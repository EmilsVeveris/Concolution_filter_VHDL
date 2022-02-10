
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.bus_pkg.all;
use ieee.numeric_std.all;

entity SHIFT_REG_ARRAY is
        generic (WIDTH : positive := 16;
                 DELAY : positive := 8);
			port (
				RESET_N,CLK : IN  std_logic;
				 EN : IN std_logic;
				 DIN : IN std_logic_vector((WIDTH-1) downto 0);
				 DOUT  : out bus_array(DELAY - 1 downto 0)(WIDTH - 1 downto 0)
			);
end SHIFT_REG_ARRAY;

architecture arch_SHIFT_REG_ARRAY of SHIFT_REG_ARRAY is


-- izveidojam masīvu, kura elementus izmantosim, lai savienotut attiecīgā reģistra izeju ar nākamā reģistra ieeju
signal net0: bus_array(DELAY   - 1 downto 0) (WIDTH - 1 downto 0);

begin

   SHIFT_REG_ARRAY : for I in 0 to (DELAY - 1) generate
	
	
		-- ciklā ievietojam papildu generate operatoru, kas izpilda if nosacījumu, lai 
		-- atšķirīgi konfigurētu pirmo reģistru virknē, proti, pieslēdzot ta ieejā DIN pieslēgvietu
		input_layer : if I = 0 generate
		  REG_IN : entity work.REG_GEN
        generic map (WIDTH =>  WIDTH)
        port map (  RESET_N => RESET_N,
						  CLK     => CLK,
						  EN => EN,
						  DIN      => DIN,
						  DOUT    => net0(I) --
					);
					DOUT(I) <= net0(I);
		 end generate input_layer;
		 
		-- ciklā ievietojam papildu generate operatoru, kas izpilda if nosacījumu, lai 
		-- atšķirīgi konfigurētu visus iekšējos reģistrus (kas nav pirmais vai pēdējais),
		-- proti, pieslēdzot to ieejā iepriekšējo reģistru izejas signālus		 
		inner_layers : if (I > 0 and I < (DELAY - 1) ) generate
		  REG_IN : entity work.REG_GEN
        generic map (WIDTH =>  WIDTH)
        port map (  RESET_N => RESET_N,
						  CLK     => CLK,
						  EN => EN,
						  DIN     => net0(I-1),
						  DOUT    => net0(I)
					);
					DOUT(I) <= net0(I);
		 end generate inner_layers;
		
		-- ciklā ievietojam papildu generate operatoru, kas izpilda if nosacījumu, lai 
		-- atšķirīgi konfigurētu visus iekšējos reģistrus (kas nav pirmais vai pēdējais),
		-- proti, pieslēdzot to ieejā iepriekšējo reģistru izejas signālus		
		output_layer : if (I = (DELAY - 1) ) generate
		  REG_IN : entity work.REG_GEN
        generic map (WIDTH =>  WIDTH)
        port map (  RESET_N => RESET_N,
						  CLK     => CLK,
						  EN => EN,
						  DIN     => net0(I-1),
						  DOUT    => DOUT(I)
					);
		 end generate output_layer;	
	
	
	end generate SHIFT_REG_ARRAY; 
	

end arch_SHIFT_REG_ARRAY;



