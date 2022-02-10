
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.bus_pkg.all;
use ieee.numeric_std.all;

entity SIGNEXT_ARRAY is
        generic (WIDTH : positive := 16;
                 len : positive := 8);
			port (

				 DIN : IN bus_array(len - 1 downto 0)(WIDTH - 1 downto 0);
				 DOUT  : out bus_array(len - 1 downto 0)((WIDTH+(len-1)) - 1 downto 0)
			);
end SIGNEXT_ARRAY;

architecture arch_SIGNEXT_ARRAY of SIGNEXT_ARRAY is


begin

   SIGNEXT_ARRAY : for I in 0 to (len - 1) generate
	
	


		  SIGNEXT : entity work.SIGNEXT
        port map (  A      => DIN(I),
						  Y	   => DOUT(I) 
					);


	
	
	end generate SIGNEXT_ARRAY; 
	

end arch_SIGNEXT_ARRAY;

