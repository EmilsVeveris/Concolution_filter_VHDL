library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.bus_pkg.all;
use ieee.numeric_std.all;

entity Register_ARRAY is
   generic (WIDTH : positive := 16);
	port (

		avs_s0_address   : in  std_logic_vector(7 downto 0) := (others => '0'); -- avs_s0.address
		avs_s0_write     : in  std_logic                    := '0';             --       .write
		avs_s0_writedata : in  std_logic_vector(7 downto 0) := (others => '0'); --       .writedata
		clock_clk        : in  std_logic                    := '0';             --  clock.clk
		reset_reset      : in  std_logic                    := '0';             --  reset.reset
		DOUT_Ker  : out bus_array(8 downto 0)(WIDTH - 1 downto 0);
		DOUT_L1  : out bus_array(2 downto 0)(WIDTH - 1 downto 0);
		DOUT_L2  : out bus_array(2 downto 0)(WIDTH - 1 downto 0);
		DOUT_L3  : out bus_array(2 downto 0)(WIDTH - 1 downto 0)
	);
end Register_ARRAY;

architecture arch_Register_ARRAY of Register_ARRAY is

signal EN_KERNEL, EN_LINE_1, EN_LINE_2, EN_LINE_3 : std_logic;

begin


		SHIFT_REG_ARRAY_Kernel : entity work.SHIFT_REG_ARRAY
				generic map (WIDTH  => WIDTH,
								DELAY => 9)
				port map (	
								RESET_N	  => reset_reset,
								CLK		  => clock_clk,
								EN			  => EN_KERNEL,
								DIN  		  => avs_s0_writedata,
								DOUT(0)    => DOUT_Ker(0),
								DOUT(1)    => DOUT_Ker(1),
								DOUT(2)    => DOUT_Ker(2),
								DOUT(3)    => DOUT_Ker(3),
								DOUT(4)    => DOUT_Ker(4),
								DOUT(5)    => DOUT_Ker(5),
								DOUT(6)    => DOUT_Ker(6),
								DOUT(7)    => DOUT_Ker(7),
								DOUT(8)    => DOUT_Ker(8)
							);
			
		SHIFT_REG_ARRAY_Line_1 : entity work.SHIFT_REG_ARRAY
				generic map (WIDTH  => WIDTH,
								DELAY => 3)
				port map (	
								RESET_N	  => reset_reset,
								CLK		  => clock_clk,
								EN			  => EN_LINE_1,
								DIN  		  => avs_s0_writedata,
								DOUT(0)    => DOUT_L1(0),
								DOUT(1)    => DOUT_L1(1),
								DOUT(2)    => DOUT_L1(2)
							);
			SHIFT_REG_ARRAY_Line_2 : entity work.SHIFT_REG_ARRAY
				generic map (WIDTH  => WIDTH,
								DELAY => 3)
				port map (	
								RESET_N	  => reset_reset,
								CLK		  => clock_clk,
								EN			  => EN_LINE_2,
								DIN  		  => avs_s0_writedata,
								DOUT(0)    => DOUT_L2(0),
								DOUT(1)    => DOUT_L2(1),
								DOUT(2)    => DOUT_L2(2)
							);
			SHIFT_REG_ARRAY_Line_3 : entity work.SHIFT_REG_ARRAY
				generic map (WIDTH  => WIDTH,
								DELAY => 3)
				port map (	
								RESET_N	  => reset_reset,
								CLK		  => clock_clk,
								EN			  => EN_LINE_3,
								DIN  		  => avs_s0_writedata,
								DOUT(0)    => DOUT_L3(0),
								DOUT(1)    => DOUT_L3(1),
								DOUT(2)    => DOUT_L3(2)
							);
			FSM_REG_CONT : entity work.FSM_REG_CONT
							port map (	
								RESET_N	  => reset_reset,
								CLK		  => clock_clk,
								avs_s0_address	=> avs_s0_address,
								avs_s0_write   => avs_s0_write,
								EN_KERNEL  => EN_KERNEL,
								EN_LINE_1  => EN_LINE_1,
								EN_LINE_2  => EN_LINE_2,
								EN_LINE_3  => EN_LINE_3
							);
end arch_Register_ARRAY;