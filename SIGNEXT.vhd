library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity SIGNEXT is -- sign extender
	port( A: in STD_LOGIC_VECTOR(15 downto 0);
			Y: out STD_LOGIC_VECTOR(23 downto 0));
   end;
	
architecture behave of SIGNEXT is
begin
	process(A)
	begin
		if A(15) = '0' then
			Y <= ("00000000"&A);
		else
			Y <= ("11111111"&A);			
		end if;
	end process;
	
end;