library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;


entity VGA_DRIVER is
	generic
	(
		H_FP : natural := 16;
		H_PULSE : natural := 96;
		H_BP : natural := 48;
		H_PIXELS : natural := 640;
		V_FP : natural := 10;
		V_PULSE : natural := 2;
		V_BP : natural := 29;
		V_PIXELS : natural := 480
	);
	port
	(
		RESET_N : in std_logic;
		CLK : in std_logic;
		EN : in std_logic;
		R_IN,G_IN,B_IN : in std_logic_vector(7 downto 0);
    	X,Y : out std_logic_vector(9 downto 0);		
		HDMI_TX_D : out std_logic_vector(23 downto 0);
		HDMI_DEN : out std_logic;
		HDMI_VSYNC : out std_logic;
		HDMI_HSYNC : out std_logic
	);
end VGA_DRIVER;

architecture behavioral of VGA_DRIVER is


	
	
	component COUNTER_GEN_1 is
	generic(
				WIDTH: integer  :=	8
	);
	port (
			RESET_N,CLK,EN,CLC,DIR : IN std_logic;
			CNT : OUT std_logic_vector(WIDTH-1 downto 0)
	);
	end component;


					
	constant HSYNC_START : natural := H_FP;
	constant HSYNC_STOP : natural := H_FP + H_PULSE;
	constant VSYNC_START : natural := V_FP;
	constant VSYNC_STOP : natural := V_FP + V_PULSE;
	
	constant HACT_START : natural := H_FP + H_BP + H_PULSE;
	constant HACT_STOP : natural := 0;
	constant VACT_START : natural := V_FP + V_BP + V_PULSE;
	constant VACT_STOP : natural := 0;
	
	constant H_PERIOD : natural := H_FP + H_BP + H_PULSE + H_PIXELS - 1;
	constant V_PERIOD : natural := V_FP + V_BP + V_PULSE + V_PIXELS - 1;	



	signal s_xpos : std_logic_vector(9 downto 0);
	signal s_ypos : std_logic_vector(9 downto 0);
	signal s_hsync : std_logic := '1';
	signal s_vsync : std_logic := '1';

	
	
   signal HSyncVal : std_logic_vector(9 downto 0);
	signal VSyncVal  : std_logic_vector(9 downto 0);
	signal HSyncReset,VSyncReset : std_logic;
	signal VSyncEn : std_logic;
	signal HDMI_DEN_net : std_logic;

begin

		
	
	HSYNC_CLOCK : COUNTER_GEN_1
	generic map (WIDTH => 10)
	port map (RESET_N => RESET_N,
				 CLK => CLK,
			    EN => EN,
				 CLC => HSyncReset,
				 DIR => '1',
				 CNT => HSyncVal				 
				 );
				 
				 
	VSYNC_CLOCK : COUNTER_GEN_1
	generic map (WIDTH => 10)
	port map (RESET_N => RESET_N,
				 CLK => CLK,
			    EN => VSyncEn,
				 CLC => VSyncReset,
				 DIR => '1',
				 CNT => VSyncVal				 
				 );

	
	
	process(HSyncVal,VSyncVal, RESET_N)
	begin
		if RESET_N = '1' then
			if HSyncVal = H_PERIOD then
				HSyncReset <= '1';
			else
				HSyncReset <= '0';
			end if;
			
			if VSyncVal = V_PERIOD then
				VSyncReset <= '1';
			else
				VSyncReset <= '0';
			end if;
		else
			HSyncReset <= '1';
			VSyncReset <= '1';
		end if;
	end process;
	
	process(HSyncVal)
	begin
		if HSyncVal = H_PERIOD then
			VSyncEn <= '1';
		else
			VSyncEn <= '0';
		end if;
	end process;
	
	process(HSyncVal)
	begin
		if ((HSyncVal >= (H_PIXELS + H_FP)) and ((HSyncVal < (H_PIXELS + H_BP + H_PULSE))))  then
			s_hsync <= '0';
		else
			s_hsync <= '1';
		end if;
	end process;
	
	process(VSyncVal)
	begin
		if ((VSyncVal >= (V_PIXELS + V_FP)) and ((VSyncVal < (V_PIXELS + V_BP + V_PULSE))))  then
			s_vsync <= '0';
		else
			s_vsync <= '1';
		end if;
	end process;
	
	
	process(HSyncVal,VSyncVal)
	begin
		if (HSyncVal < (H_PIXELS + H_FP)) and (VSyncVal < (V_PIXELS + V_FP)) then
			HDMI_DEN_net <= '1';
		else
			HDMI_DEN_net <= '0';
		end if;
	end process;
	
	process(HDMI_DEN_net,R_in,G_in,B_in)
	begin
		if HDMI_DEN_net = '1' then	
			HDMI_TX_D <= R_in & G_in & B_in;
		else
			HDMI_TX_D <= (others => '0');
		end if;
	end process;



	HDMI_HSYNC <= s_hsync;
	HDMI_VSYNC <= s_vsync;
   X <= HSyncVal;
   Y <= VSyncVal;
	
	HDMI_DEN <= HDMI_DEN_net;

end architecture;
