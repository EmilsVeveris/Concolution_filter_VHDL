
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use work.bus_pkg.all;


entity Multiplyer is
        generic (bus_width : positive := 16);
        port (  
		          DIN   : in bus_array(1 downto 0)(bus_width - 1 downto 0);
					 DOUT : OUT std_logic_vector((bus_width*2)-1 downto 0)
					);
end Multiplyer;

architecture GEN of Multiplyer is
signal Data : std_logic_vector((bus_width*2) - 1 downto 0);
begin
							 				

	process(DIN(0), DIN(1))
	begin
			Data <= DIN(0) * DIN(1);
	end process;
		 DOUT <= Data;


end GEN;
