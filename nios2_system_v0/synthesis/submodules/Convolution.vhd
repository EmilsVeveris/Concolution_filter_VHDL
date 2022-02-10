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
signal reg_out_1, reg_out_2, reg_out_3, reg_out_4 : std_logic_vector(7 downto 0);
signal summ : std_logic_vector(15 downto 0);

begin

	
	process(reset_reset,clock_clk,avs_s0_read,avs_s0_address)
	begin

				if avs_s0_read = '1' then
					if avs_s0_address = "00000100" then
						avs_s0_readdata <= reg_out_1;
					elsif avs_s0_address = "00000101" then
						avs_s0_readdata <= reg_out_2;
				/*	elsif avs_s0_address = "00000110" then
						avs_s0_readdata <= reg_out_3;
					elsif avs_s0_address = "00000111" then
						avs_s0_readdata <= reg_out_4;*/
					else
						avs_s0_readdata <= (others => '0');
					end if;
				else
					avs_s0_readdata <= (others => '0');
				end if;
	end process;
	
						MULTIPLYER_ARRAY : entity work.MULTIPLYER_ARRAY
				generic map (WIDTH  => 8,
								len => 9)
				port map (	DIN(0)  => reg_data_1,
								DIN(1)  => kernell_data_1,
								DIN(2)  => reg_data_2,
								DIN(3)  => kernell_data_2,
								DIN(4)  => reg_data_3,
								DIN(5)  => kernell_data_3,
								DIN(6)  => reg_data_4,
								DIN(7)  => kernell_data_4,
								DIN(8)  => reg_data_5,
								DIN(9)  => kernell_data_5,
								DIN(10)  => reg_data_6,
								DIN(11)  => kernell_data_6,
								DIN(12)  => reg_data_7,
								DIN(13)  => kernell_data_7,
								DIN(14)  => reg_data_8,
								DIN(15)  => kernell_data_8,
								DIN(16)  => reg_data_9,
								DIN(17)  => kernell_data_9,
								DOUT(0)    => Multi_1,
								DOUT(1)    => Multi_2,
								DOUT(2)    => Multi_3,
								DOUT(3)    => Multi_4,
								DOUT(4)    => Multi_5,
								DOUT(5)    => Multi_6,
								DOUT(6)    => Multi_7,
								DOUT(7)    => Multi_8,
								DOUT(8)    => Multi_9
							);
	

					Register_ARRAY : entity work.Register_ARRAY
				generic map (WIDTH  => 8)
				port map (	reset_reset 		=> reset_reset,
								clock_clk	  		=> clock_clk,
								avs_s0_address 	=> avs_s0_address,
								avs_s0_write 		=> avs_s0_write,
								avs_s0_writedata  => avs_s0_writedata,
								DOUT_L1(0)		=> reg_data_1,
								DOUT_Ker(0)    => kernell_data_1,
								DOUT_L1(1)		=> reg_data_2,
								DOUT_Ker(1)    => kernell_data_2,
								DOUT_L1(2)		=> reg_data_3,
								DOUT_Ker(2)    => kernell_data_3,
								DOUT_L2(0)		=> reg_data_4,
								DOUT_Ker(3)    => kernell_data_4,
								DOUT_L2(1)		=> reg_data_5,
								DOUT_Ker(4)    => kernell_data_5,
								DOUT_L2(2)		=> reg_data_6,
								DOUT_Ker(5)    => kernell_data_6,
								DOUT_L3(0)		=> reg_data_7,
								DOUT_Ker(6)    => kernell_data_7,
								DOUT_L3(1)		=> reg_data_8,
								DOUT_Ker(7)    => kernell_data_8,
								DOUT_L3(2)		=> reg_data_9,
								DOUT_Ker(8)    => kernell_data_9							
							);
			ADDER_TREE : entity work.ADDER_TREE
				generic map (WIDTH  => 16,
								N => 5)
				port map (	DIN(0)		=> Multi_1,
								DIN(1)		=> Multi_2,
								DIN(2)		=> Multi_3,
								DIN(3)		=> Multi_4,
								DIN(4)		=> Multi_5,
								DIN(5)		=> Multi_6,
								DIN(6)		=> Multi_7,
								DIN(7)		=> Multi_8,
								DIN(8)		=> Multi_9,
								DOUT		   => summ					
							);

   reg_out_1 <= summ(7 downto 0);
	reg_out_2 <= summ(15 downto 8);






end architecture rtl; -- of my_reg8 