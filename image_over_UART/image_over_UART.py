import serial
import time
import os
import threading
import time
import msvcrt
import os.path
from os import path
from PIL import Image
import sys

RAM_0 = 0
RAM_1 = 1
RAM_2 = 2

# DESCRIPTION --------------------------------------------------------------------------
#
# Sends png image over UART to target device
# To send image drag'n'drop png on script or change filename name and then launch script
# To stop script mid run time press any key and wait, NOT RECOMMENDED TO FORCE CLOSE
#
# DESCRIPTION --------------------------------------------------------------------------


# USER EDITABLE CONSTANTS --------------------------------------------------------------
 
# WARNING | edit params to match your device | WARNING

fileName = "./Example_Images/stand.png" # or drag'n'drop

BAUD_RATE = 9600
PORT = 'COM14'

RED     =   RAM_0   # which ram block corresponds to wich color
GREEN   =   RAM_1       
BLUE    =   RAM_2

RAM_ADDR_0 = 128    # ram block addresses
RAM_ADDR_1 = 64     # not actaully implemented
RAM_ADDR_2 = 32

TIMEOUT = 1     # timeout in seconds, in case target device freezes, for receive only

MOVIE_MODE = 0  # EXPERIMENTAL FEATURE, high BAUD RATE recommended
WAIT_FRAMES = 1 # in MOVIE_MODE sets min delay between full frames

# USER EDITABLE CONSTANTS --------------------------------------------------------------


def getColorData(fileName):
    temp = [[None] * 2048, [None] * 2048, [None] * 2048]
    
    im = Image.open(str(fileName))
    im = im.convert('RGB')
    x, y = im.size
    
    k = 0
    for i in range(y):
        for j in range(x):
            r, g, b = im.getpixel((j, i))
            
            temp[RED][k]    = r
            temp[GREEN][k]  = g
            temp[BLUE][k]   = b
            k += 1
            
    return temp

def waitForKeyPress():  # wait on keypress on new thread
    global breakNow
    global keyPressed
    while True:
        ch = msvcrt.getch()
        breakNow = True
        if(breakNow):
            break

def sendData(data):
    global ser
    temp = 0
    if(ser.is_open):
        #print("sending:", data)
        if(isinstance(data, int)):   # turn all chars to integers
            ser.write(bytearray([data]))
            return
        if(len(data) < 2):
            ser.write(bytes(data, encoding='utf8'))
          

def SerialInit():
    global ser
    ser.baudrate = BAUD_RATE
    ser.port = PORT
    ser.timout = 1
    ser.EIGHTBITS = serial.EIGHTBITS
    ser.parity = serial.PARITY_NONE
    ser.stopbits = serial.STOPBITS_ONE
    ser.open()
    
def receiveData(timeout):
    global ser
    endTime = time.time() + timeout
    while(1):
        if(ser.inWaiting()):
            return int.from_bytes(ser.read(), "big")    # returns int
        if(endTime < time.time()):
            return -1
    
def test():             # check if memory works before sending image
    print()
    print("Doing some quick tests")
    sendData(128 + 7)       # test register           
    sendData('s')
    sendData(0 + 7)
    temp = receiveData(TIMEOUT)
    if(temp != -1):
        if(chr(temp) != 's'):
            print("Did not receive correct data from target")
            exit()
    else:
        print("Timed out, is target frozen or not working ?")
        exit()
            
    sendData(128 + 64)  #test fifo
    
    for x in range(16):
        sendData(x)
    
    testTime = time.time() + 5
    sendData(64)
    temp = 255
    
    for x in range(16):
        if(testTime < time.time()):
            print("Timed out, is target frozen or not working ?")
            exit()
        
        temp = receiveData(TIMEOUT)
        
        if(temp != -1):
            if(temp != x):
                print("Did not receive correct data from target")
                print(temp)
                print(x)
                exit()
        else:
            print("Timed out, is target frozen ?")
            exit()
        
    print("Quick test done!")

print()

breakNow = 0

t = threading.Thread(target=waitForKeyPress)
t.start()

STAND = "./Example_Images/stand.png"
WALK_0 = "./Example_Images/walk0.png"
WALK_1 = "./Example_Images/walk1.png"
WALK_2 = "./Example_Images/walk2.png"
mario = [STAND, WALK_0, WALK_1, WALK_2]

if(len(sys.argv) > 1):
    fileName = sys.argv[1]
    
if(fileName[-4:] != ".png"):
        print("Not PNG image")
        exit()
        
if not(path.exists(fileName)):
    print(fileName)
    print("Does not exist")
    exit()

ser = serial.Serial()

try:
    SerialInit()
except (OSError, serial.SerialException):
    print("Not connected or port already opened")
    exit()
 
print()
print("Picture over UART V3001 (supports only 32x64 resolution, PNG format only)")
print()

test()

movieDelay = 0

if(MOVIE_MODE):
    if(path.exists(STAND) and path.exists(WALK_0) and path.exists(WALK_1) and path.exists(WALK_2)):
        pass
    else:   
        print("Missing required files, disabling MOVIE_MODE")
        MOVIE_MODE = 0

inc = 0

print()
print("Sending image")
print()

while(1):
    if(MOVIE_MODE):
        fileName = mario[(inc % (len(mario) - 1)) + 1]
        time.sleep(0.0166 * WAIT_FRAMES) # wait frames before sending new one
        if(breakNow):
            fileName = mario[0]
            breakNow = 2
    else:
        if(inc > 0):
            print()
            print("Done!")
            exit()
            
    colors = getColorData(fileName)

    for y in range(3):  # 3 colors
        sendData(128 + 7)
        sendData(128 >> y)
        k = 0
        for x in range(128):    # 128 fifo frames
            sendData(128 + 64)
            for z in range(16):
                sendData(colors[y][k])
                k += 1
             
        
    
    if(breakNow == 2):
        print("done")
        exit()    

        
    inc += 1
    
print("done")

