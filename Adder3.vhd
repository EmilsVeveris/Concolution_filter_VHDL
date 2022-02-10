library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
USE ieee.std_logic_unsigned.all;
use work.bus_pkg.all;

entity Adder3 is
generic(WIDTH : integer := 8);
port (
	 DIN  : IN bus_array(1 downto 0)(WIDTH-1 downto 0);
    DOUT : OUT std_logic_vector(WIDTH-1 downto 0)
);
end Adder3;
architecture architecture_Adder3 of Adder3 is

signal Data : std_logic_vector((WIDTH-1) downto 0);

begin


	process(DIN(0), DIN(1))
	begin
			Data <= DIN(0) + DIN(1);
	end process;

DOUT <= Data;

end architecture_Adder3;

