-- Convolution.vhd

-- This file was auto-generated as a prototype implementation of a module
-- created in component editor.  It ties off all outputs to ground and
-- ignores all inputs.  It needs to be edited to make it do something
-- useful.
-- 
-- This file will not be automatically regenerated.  You should check it in
-- to your version control system if you want to keep it.

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity Convolution is
	port (
		avs_s0_address   : in  std_logic_vector(7 downto 0) := (others => '0'); -- avs_s0.address
		avs_s0_read      : in  std_logic                    := '0';             --       .read
		avs_s0_readdata  : out std_logic_vector(7 downto 0);                    --       .readdata
		avs_s0_write     : in  std_logic                    := '0';             --       .write
		avs_s0_writedata : in  std_logic_vector(7 downto 0) := (others => '0'); --       .writedata
		clock_clk        : in  std_logic                    := '0';             --  clock.clk
		reset_reset      : in  std_logic                    := '0'              --  reset.reset
	);
end entity Convolution;

architecture rtl of Convolution is
signal reg_data_1, reg_data_2, reg_data_3, reg_data_4, reg_data_5, reg_data_6, reg_data_7, reg_data_8, reg_data_9 : std_logic_vector(7 downto 0);
signal kernell_data_1, kernell_data_2, kernell_data_3, kernell_data_4, kernell_data_5, kernell_data_6, kernell_data_7, kernell_data_8, kernell_data_9 : std_logic_vector(7 downto 0);
signal Multi_1, Multi_2, Multi_3, Multi_4, Multi_5, Multi_6, Multi_7, Multi_8, Multi_9 : std_logic_vector(15 downto 0);
signal Multi_ext_1, Multi_ext_2, Multi_ext_3, Multi_ext_4, Multi_ext_5, Multi_ext_6, Multi_ext_7, Multi_ext_8, Multi_ext_9 : std_logic_vector(23 downto 0);
signal reg_out_1, reg_out_2, reg_out_3 : std_logic_vector(7 downto 0);
signal summ : std_logic_vector(23 downto 0);

begin

	-- TODO: Auto-generated HDL template

	process(reset_reset,clock_clk,avs_s0_address,avs_s0_write)
	begin
		if reset_reset = '1' then
			if clock_clk = '1' and clock_clk'event then
				if avs_s0_write = '1' then
					if avs_s0_address = "00000000" then
						reg_data_1 <= avs_s0_writedata;
						reg_data_2 <= reg_data_1;
						reg_data_3 <= reg_data_2;
						reg_data_4 <= reg_data_4;
						reg_data_5 <= reg_data_5;
						reg_data_6 <= reg_data_6;
						reg_data_7 <= reg_data_7;
						reg_data_8 <= reg_data_8;
						reg_data_9 <= reg_data_9;
						kernell_data_1 <= kernell_data_1;
						kernell_data_2 <= kernell_data_2;
						kernell_data_3 <= kernell_data_3;
						kernell_data_4 <= kernell_data_4;
						kernell_data_5 <= kernell_data_5;
						kernell_data_6 <= kernell_data_6;
						kernell_data_7 <= kernell_data_7;
						kernell_data_8 <= kernell_data_8;
						kernell_data_9 <= kernell_data_9;
					elsif avs_s0_address = "00000001" then
						reg_data_1 <= reg_data_1;
						reg_data_2 <= reg_data_2;
						reg_data_3 <= reg_data_3;
						reg_data_4 <= avs_s0_writedata;
						reg_data_5 <= reg_data_4;
						reg_data_6 <= reg_data_5;
						reg_data_7 <= reg_data_7;
						reg_data_8 <= reg_data_8;
						reg_data_9 <= reg_data_9;
						kernell_data_1 <= kernell_data_1;
						kernell_data_2 <= kernell_data_2;
						kernell_data_3 <= kernell_data_3;
						kernell_data_4 <= kernell_data_4;
						kernell_data_5 <= kernell_data_5;
						kernell_data_6 <= kernell_data_6;
						kernell_data_7 <= kernell_data_7;
						kernell_data_8 <= kernell_data_8;
						kernell_data_9 <= kernell_data_9;
					elsif avs_s0_address = "00000010" then
						reg_data_1 <= reg_data_1;
						reg_data_2 <= reg_data_2;
						reg_data_3 <= reg_data_3;
						reg_data_4 <= reg_data_4;
						reg_data_5 <= reg_data_5;
						reg_data_6 <= reg_data_6;
						reg_data_7 <= avs_s0_writedata;
						reg_data_8 <= reg_data_7;
						reg_data_9 <= reg_data_8;
						kernell_data_1 <= kernell_data_1;
						kernell_data_2 <= kernell_data_2;
						kernell_data_3 <= kernell_data_3;
						kernell_data_4 <= kernell_data_4;
						kernell_data_5 <= kernell_data_5;
						kernell_data_6 <= kernell_data_6;
						kernell_data_7 <= kernell_data_7;
						kernell_data_8 <= kernell_data_8;
						kernell_data_9 <= kernell_data_9;
					elsif  avs_s0_address = "00000011" then
						reg_data_1 <= reg_data_1;
						reg_data_2 <= reg_data_2;
						reg_data_3 <= reg_data_3;
						reg_data_4 <= reg_data_4;
						reg_data_5 <= reg_data_5;
						reg_data_6 <= reg_data_6;
						reg_data_7 <= reg_data_7;
						reg_data_8 <= reg_data_8;
						reg_data_9 <= reg_data_9;
						kernell_data_1 <= avs_s0_writedata;
						kernell_data_2 <= kernell_data_1;
						kernell_data_3 <= kernell_data_2;
						kernell_data_4 <= kernell_data_3;
						kernell_data_5 <= kernell_data_4;
						kernell_data_6 <= kernell_data_5;
						kernell_data_7 <= kernell_data_6;
						kernell_data_8 <= kernell_data_7;
						kernell_data_9 <= kernell_data_8;
					else
						reg_data_1 <= reg_data_1;
						reg_data_2 <= reg_data_2;
						reg_data_3 <= reg_data_3;
						reg_data_4 <= reg_data_4;
						reg_data_5 <= reg_data_5;
						reg_data_6 <= reg_data_6;
						reg_data_7 <= reg_data_7;
						reg_data_8 <= reg_data_8;
						reg_data_9 <= reg_data_9;
						kernell_data_1 <= kernell_data_1;
						kernell_data_2 <= kernell_data_2;
						kernell_data_3 <= kernell_data_3;
						kernell_data_4 <= kernell_data_4;
						kernell_data_5 <= kernell_data_5;
						kernell_data_6 <= kernell_data_6;
						kernell_data_7 <= kernell_data_7;
						kernell_data_8 <= kernell_data_8;
						kernell_data_9 <= kernell_data_9;
					end if;
				else
						reg_data_1 <= reg_data_1;
						reg_data_2 <= reg_data_2;
						reg_data_3 <= reg_data_3;
						reg_data_4 <= reg_data_4;
						reg_data_5 <= reg_data_5;
						reg_data_6 <= reg_data_6;
						reg_data_7 <= reg_data_7;
						reg_data_8 <= reg_data_8;
						reg_data_9 <= reg_data_9;
						kernell_data_1 <= kernell_data_1;
						kernell_data_2 <= kernell_data_2;
						kernell_data_3 <= kernell_data_3;
						kernell_data_4 <= kernell_data_4;
						kernell_data_5 <= kernell_data_5;
						kernell_data_6 <= kernell_data_6;
						kernell_data_7 <= kernell_data_7;
						kernell_data_8 <= kernell_data_8;
						kernell_data_9 <= kernell_data_9;
				end if;
			else
						reg_data_1 <= reg_data_1;
						reg_data_2 <= reg_data_2;
						reg_data_3 <= reg_data_3;
						reg_data_4 <= reg_data_4;
						reg_data_5 <= reg_data_5;
						reg_data_6 <= reg_data_6;
						reg_data_7 <= reg_data_7;
						reg_data_8 <= reg_data_8;
						reg_data_9 <= reg_data_9;
						kernell_data_1 <= kernell_data_1;
						kernell_data_2 <= kernell_data_2;
						kernell_data_3 <= kernell_data_3;
						kernell_data_4 <= kernell_data_4;
						kernell_data_5 <= kernell_data_5;
						kernell_data_6 <= kernell_data_6;
						kernell_data_7 <= kernell_data_7;
						kernell_data_8 <= kernell_data_8;
						kernell_data_9 <= kernell_data_9;
			end if;		
		else
			reg_data_1 <= (others => '0');
			reg_data_2 <= (others => '0');
			reg_data_3 <= (others => '0');
			reg_data_4 <= (others => '0');
			reg_data_5 <= (others => '0');
			reg_data_6 <= (others => '0');
			reg_data_7 <= (others => '0');
			reg_data_8 <= (others => '0');
			reg_data_9 <= (others => '0');
			kernell_data_1 <= (others => '0');
			kernell_data_2 <= (others => '0');
			kernell_data_3 <= (others => '0');
			kernell_data_4 <= (others => '0');
			kernell_data_5 <= (others => '0');
			kernell_data_6 <= (others => '0');
			kernell_data_7 <= (others => '0');
			kernell_data_8 <= (others => '0');
			kernell_data_9 <= (others => '0');

		end if;
	end process;
	
	process(reset_reset,clock_clk,avs_s0_read,avs_s0_address)
	begin

				if avs_s0_read = '1' then
					if avs_s0_address = "00000100" then
						avs_s0_readdata <= reg_out_1;
					elsif avs_s0_address = "00000101" then
						avs_s0_readdata <= reg_out_2;
					elsif avs_s0_address = "00000110" then
						avs_s0_readdata <= reg_out_3;
					else
						avs_s0_readdata <= (others => '0');
					end if;
				else
					avs_s0_readdata <= (others => '0');
				end if;
	end process;
	
	Multi_1 <= reg_data_1 * kernell_data_1;
	Multi_2 <= reg_data_2 * kernell_data_2;
	Multi_3 <= reg_data_3 * kernell_data_3;
	Multi_4 <= reg_data_4 * kernell_data_4;
	Multi_5 <= reg_data_5 * kernell_data_5;
	Multi_6 <= reg_data_6 * kernell_data_6;
	Multi_7 <= reg_data_7 * kernell_data_7;
	Multi_8 <= reg_data_8 * kernell_data_8;
	Multi_9 <= reg_data_9 * kernell_data_9;
	
	Multi_ext_1 <= "00000000" & Multi_1;
	Multi_ext_2 <= "00000000" & Multi_2;
	Multi_ext_3 <= "00000000" & Multi_3;
	Multi_ext_4 <= "00000000" & Multi_4;
	Multi_ext_5 <= "00000000" & Multi_5;
	Multi_ext_6 <= "00000000" & Multi_6;
	Multi_ext_7 <= "00000000" & Multi_7;
	Multi_ext_8 <= "00000000" & Multi_8;
	Multi_ext_9 <= "00000000" & Multi_9;
	
	summ <= Multi_ext_1 + Multi_ext_2 + Multi_ext_3 + Multi_ext_4 + Multi_ext_5 + Multi_ext_6 + Multi_ext_7 + Multi_ext_8 + Multi_ext_9;
   reg_out_1 <= summ(7 downto 0);
	reg_out_2 <= summ(15 downto 8);
	reg_out_3 <= summ(23 downto 16);



end architecture rtl; -- of my_reg8 