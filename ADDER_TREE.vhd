library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.bus_pkg.all;
use ieee.numeric_std.all;

entity ADDER_TREE is
        generic (WIDTH : positive := 19;
                 N : positive := 6);
			port (
		      DIN   : in bus_array((2**(N-1)) - 1 downto 0)(WIDTH - 1 downto 0);
				DOUT : OUT std_logic_vector((WIDTH-1) downto 0)
			);
end ADDER_TREE;

architecture arch_ADDER_TREE of ADDER_TREE is
-- izveidojam masīvu, kura elementus izmantosim, lai savienotut attiecīgā reģistra izeju ar nākamā reģistra ieeju
type st_custom_logic_type is array (0 to N - 1, 0 to (2**N) - 1) of std_logic_vector(WIDTH - 1 downto 0);
signal net0: bus_array((2**N) - 1 downto 0) ((WIDTH*2)-1 downto 0);
signal out_add: bus_array((2**N) - 1 downto 0) ((WIDTH*2) downto 0);
signal st_custom_logic : st_custom_logic_type;


begin


	ADDER_TREE : for X in 0 to (N-1) generate  -- For cikls lai izvaditu attiecigo daudzumu kollonas summatora kokam

		First_collum : if X = 0 generate -- parbauda vai ir para skaita ieejas
			ADDER_TREE_COLLUM_START : for I in 0 to ((2**(N-1)/2)-1) generate -- Izveido pirmo rindu ar summatoriem
						Adder3 : entity work.Adder3
						generic map (WIDTH  => WIDTH)
						port map (  
										DIN(0)  => DIN(2*I),
										DIN(1)  => DIN((2*I)+1),
										DOUT    => st_custom_logic(X,I)
									);
			end generate ADDER_TREE_COLLUM_START;  -- beidz pirmas rindas izvadi
		end generate First_collum;
		Middle_Collums : if ((X > 0) and (X < (N-2))) generate
				ADDER_TREE_ROW_MID : for I in 0 to ((2**(N-X-1)/2)-1) generate
						Adder3 : entity work.Adder3
						generic map (WIDTH  => WIDTH)
						port map (  
										DIN(0)  => st_custom_logic(X-1,(2*I)),
										DIN(1)  => st_custom_logic(X-1,(2*I)+1),
										DOUT    => st_custom_logic(X,I)
									);
				end generate ADDER_TREE_ROW_MID; 
		end generate Middle_Collums;
		Last_Collum : if X = (N-1) generate
			Adder3 : entity work.Adder3
			generic map (WIDTH  => WIDTH)
			port map (  
							DIN(0)  => st_custom_logic(X-2,0),
							DIN(1)  => st_custom_logic(X-2,1),
							DOUT    => DOUT
									);
		end generate Last_Collum;
	end generate ADDER_TREE;
end arch_ADDER_TREE;
