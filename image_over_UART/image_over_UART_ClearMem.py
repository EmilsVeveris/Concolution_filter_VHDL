import serial
import time
import os
import threading
import time
import msvcrt
import os.path
from os import path
from PIL import Image
from time import sleep
import sys
import numpy as np
from scipy import ndimage
from skimage.io import imread
import scipy.fftpack as fp
from serial import Serial



# DESCRIPTION --------------------------------------------------------------------------
#
# Clears target devices memory
#
# DESCRIPTION --------------------------------------------------------------------------

# USER EDITABLE CONSTANTS --------------------------------------------------------------
 
# WARNING | edit params to match your device | WARNING

BAUD_RATE = 115200
PORT = 'COM11'

TIMEOUT = 1     # timeout in seconds, in case target device freezes, for receive only

# USER EDITABLE CONSTANTS --------------------------------------------------------------


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
    

        
    print("Quick test done!")

print()

breakNow = 0

t = threading.Thread(target=waitForKeyPress)
t.start()

ser = serial.Serial()

try:
    SerialInit()
except (OSError, serial.SerialException):
    print("Not connected or port already opened")
    exit()
 
print()
print("Memory cleaner v1.1 extra cleanish")
print()

#test()

inc = 0

print()
print("Clearing memory")
print()


##for y in range(3):  # 3 colors
##    sendData(128 + 7)
##    sendData(128 >> y)
##    k = 0
##    for x in range(128):    # 128 fifo frames
##        sendData(128 + 64)
##        for z in range(16):
##            sendData(0)
##            k += 1
##            
##        if(breakNow):
##            exit()
##        
##    if(breakNow):
##        exit()
##
y = 0
x = 0

##im = np.mean(imread('Test_01.png'), axis=2)
##data = np.array(im, dtype=float)
##print(np.mean(im))

im = np.mean(imread('Picture.png'), axis=2)
data = np.array(im, dtype=float)
print(np.mean(im))

for i in range(307200):

    sendData(int(im[y][x]))
    if (x < 639):
        x = x+1
    else:
        x = 0
        y = y +1

    #print(x)
print()
print("Done!")

































































