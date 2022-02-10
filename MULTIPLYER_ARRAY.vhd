library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.bus_pkg.all;
use ieee.numeric_std.all;

entity MULTIPLYER_ARRAY is
        generic (WIDTH : positive := 16;
                 len : positive := 8);
			port (

		          DIN   : in bus_array((len*2)-1 downto 0)(WIDTH - 1 downto 0);
					 DOUT : OUT bus_array(len-1 downto 0)((WIDTH*2) - 1 downto 0)
			);
end MULTIPLYER_ARRAY;

architecture arch_MULTIPLYER_ARRAY of MULTIPLYER_ARRAY is


begin

   MULTIPLYER_ARRAY : for I in 0 to (len - 1) generate
	
	

				Multiplyer : entity work.Multi
				port map (  
								dataa  => DIN((2*I)),
								datab  => DIN((2*I)+1),
								result    => DOUT(I)
							);


	
	
	end generate MULTIPLYER_ARRAY; 
	

end arch_MULTIPLYER_ARRAY;

