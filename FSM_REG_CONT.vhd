LIBRARY ieee  ; 

USE ieee.std_logic_1164.all  ; 
USE ieee.std_logic_textio.all  ; 
USE ieee.STD_LOGIC_UNSIGNED.all  ; 
USE ieee.std_logic_unsigned.all  ; 
use ieee.numeric_std.all;



ENTITY FSM_REG_CONT  IS 

port (
	 RESET_N, CLK : IN  std_logic;
	 avs_s0_address   : in  std_logic_vector(7 downto 0) := (others => '0'); -- avs_s0.address
	 avs_s0_write     : in  std_logic                    := '0'; 
	 EN_KERNEL, EN_LINE_1, EN_LINE_2, EN_LINE_3 : OUT  std_logic);
END ; 

 
ARCHITECTURE FSM_REG_CONT_arch OF FSM_REG_CONT IS
-- Izveidot velvienu stavokli katram bita kura tiek atjauts ierakstišana shift registra
  
  
  type state is (init, wait_en, check_addr, output_en_ker, output_en_l1, output_en_l2, output_en_l3, wait_for_en_end);
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
	 
	 
	process (PresentState, avs_s0_write, avs_s0_address)
	begin
		case PresentState is
			when init =>
				NextState <= wait_en;
			when wait_en =>
				if avs_s0_write = '1'  then 
					NextState <= check_addr;
				else
					NextState <= wait_en;
				end if;
			when check_addr =>
				if avs_s0_address = "00000000"  then 
					NextState <= output_en_l1;
				elsif avs_s0_address = "00000001"  then 
					NextState <= output_en_l2;
				elsif avs_s0_address = "00000010"  then 
					NextState <= output_en_l3;
				elsif avs_s0_address = "00000011"  then 
					NextState <= output_en_ker;
				else
					NextState <= wait_for_en_end;
				end if;
			when output_en_l1 =>
					NextState <= wait_for_en_end;
			when output_en_l2 =>
					NextState <= wait_for_en_end;
			when output_en_l3 =>
					NextState <= wait_for_en_end;
			when output_en_ker =>
					NextState <= wait_for_en_end;
			when wait_for_en_end =>
				if avs_s0_write = '0'  then 
					NextState <= wait_en;
				else
					NextState <= wait_for_en_end;
				end if;
			
		end case;
	end process;
	
	
	process (PresentState)
	begin
		case PresentState is
			when init =>				
				EN_KERNEL <= '0';
				EN_LINE_1 <= '0';
				EN_LINE_2 <= '0';
				EN_LINE_3 <= '0';
			when wait_en =>
				EN_KERNEL <= '0';
				EN_LINE_1 <= '0';
				EN_LINE_2 <= '0';
				EN_LINE_3 <= '0';
			when check_addr =>
				EN_KERNEL <= '0';
				EN_LINE_1 <= '0';
				EN_LINE_2 <= '0';
				EN_LINE_3 <= '0';
			when output_en_l1 =>
				EN_KERNEL <= '0';
				EN_LINE_1 <= '1';
				EN_LINE_2 <= '0';
				EN_LINE_3 <= '0';
			when output_en_l2 =>
				EN_KERNEL <= '0';
				EN_LINE_1 <= '0';
				EN_LINE_2 <= '1';
				EN_LINE_3 <= '0';
			when output_en_l3 =>
				EN_KERNEL <= '0';
				EN_LINE_1 <= '0';
				EN_LINE_2 <= '0';
				EN_LINE_3 <= '1';
			when output_en_ker =>
				EN_KERNEL <= '1';
				EN_LINE_1 <= '0';
				EN_LINE_2 <= '0';
				EN_LINE_3 <= '0';
			when wait_for_en_end =>
				EN_KERNEL <= '0';
				EN_LINE_1 <= '0';
				EN_LINE_2 <= '0';
				EN_LINE_3 <= '0';

			end case;	
	end process;
 


 
	 
	 
end;