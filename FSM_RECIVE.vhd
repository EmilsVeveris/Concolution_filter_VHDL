LIBRARY ieee  ; 

USE ieee.std_logic_1164.all  ; 
USE ieee.std_logic_textio.all  ; 
USE ieee.STD_LOGIC_UNSIGNED.all  ; 
USE ieee.std_logic_unsigned.all  ; 
use ieee.numeric_std.all;



ENTITY FSM_RECIVE  IS 

port (
	 RESET_N, CLK, REC_DATA,Start_bit : IN  std_logic;
	 WREN, CNT_EN : OUT  std_logic);
END ; 
 
ARCHITECTURE FSM_RECIVE_arch OF FSM_RECIVE IS
-- Izveidot velvienu stavokli katram bita kura tiek atjauts ierakstišana shift registra
  
  
  type state is (init, wait_start, wait_data, recive_data, wait_signal, wait_stop);
  signal NextState : state;
  signal PresentState : state := init;



begin
	
	process(RESET_N,CLK)
	begin
		if RESET_N = '1' then
				  if CLK = '1' and CLK'event then
						PresentState <= NextState;
				  end if;
		else
			 PresentState <= init;
		end if;
	end process;
	 
	 
	process (PresentState, REC_DATA, Start_bit)
	begin
		case PresentState is
			when init =>
				NextState <= wait_start;
			when wait_start =>
				if Start_bit = '1'  then 
					NextState <= wait_data;
				else
					NextState <= wait_start;
				end if;
			when wait_data =>
				if REC_DATA = '1'  then 
					NextState <= recive_data;
				else
					NextState <= wait_data;
				end if;
			when recive_data =>
					NextState <= wait_signal;
			when wait_signal =>
				if REC_DATA = '0' then 
					NextState <= wait_stop;
				else
					NextState <= wait_signal;
				end if;
			when wait_stop =>
				if Start_bit = '0' then 
					NextState <= wait_start;
				else
					NextState <= wait_data;
				end if;

		end case;
	end process;
	
	
	process (PresentState)
	begin
		case PresentState is
			when init =>				
				WREN <= '0';
				CNT_EN <= '0';
			when wait_start =>
				WREN <= '0';
				CNT_EN <= '0';
			when wait_data =>
				WREN <= '0';
				CNT_EN <= '0';
			when recive_data =>
				WREN <= '1';
				CNT_EN <= '1';
			when wait_signal =>
				WREN <= '0';
				CNT_EN <= '0';
			when wait_stop =>
				WREN <= '0';
				CNT_EN <= '0';

			end case;	
	end process;
 


 
	 
	 
end;