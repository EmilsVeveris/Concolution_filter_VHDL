library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all; -- math operations using std logic vectors

entity COUNTER_GEN_1 is
generic(
			WIDTH: integer  :=	8
);
port (
	 RESET_N,CLK,EN,CLC : IN std_logic;
	 DIR : IN std_logic;
	 CNT : OUT std_logic_vector(WIDTH-1 downto 0)
);
end COUNTER_GEN_1;
architecture beh of COUNTER_GEN_1 is

 -- signal, component etc. declarations
signal Counter: std_logic_vector(WIDTH-1 downto 0) := (others => '0');

begin

 process(RESET_N,EN,CLK)
 begin
	 if RESET_N = '1' then
		 if CLK = '1' and CLK'event and EN = '1' then
			if CLC = '0' then
				if DIR = '1' then
					Counter <= Counter + 1;
				else
					Counter <= Counter - 1;
				end if;
			else
				Counter <= (others => '0');
			end if;
		 end if;
	 else
		Counter <= (others => '0');
	end if;
 end process;

 CNT <= Counter;
 
end beh;