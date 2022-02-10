library IEEE;
use IEEE.std_logic_1164.all;

entity REG_GEN is
generic(WIDTH : integer := 8);
port (
	RESET_N,CLK : IN  std_logic;
    EN : IN std_logic;
    DIN : IN std_logic_vector((WIDTH-1) downto 0);
    DOUT : OUT std_logic_vector((WIDTH-1) downto 0)
);
end REG_GEN;
architecture architecture_REG_GEN of REG_GEN is

signal Data : std_logic_vector((WIDTH-1) downto 0);
begin


process(RESET_N,CLK)
begin
    if RESET_N = '0' then
        Data <= (others => '0');
    else
        if CLK = '1' and CLK'event then
            if EN = '1' then
                Data <= DIN;
            else
                Data <= Data;
            end if;
        end if;
    end if;
end process;

DOUT <= Data;

end architecture_REG_GEN;
