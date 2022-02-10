	component nios2_system_v0 is
		port (
			clk_clk                                                    : in    std_logic                     := 'X';             -- clk
			data_out_external_connection_export                        : out   std_logic_vector(7 downto 0);                     -- export
			led_pio_external_connection_export                         : out   std_logic_vector(7 downto 0);                     -- export
			mem_if_lpddr2_emif_0_pll_sharing_pll_mem_clk               : out   std_logic;                                        -- pll_mem_clk
			mem_if_lpddr2_emif_0_pll_sharing_pll_write_clk             : out   std_logic;                                        -- pll_write_clk
			mem_if_lpddr2_emif_0_pll_sharing_pll_locked                : out   std_logic;                                        -- pll_locked
			mem_if_lpddr2_emif_0_pll_sharing_pll_write_clk_pre_phy_clk : out   std_logic;                                        -- pll_write_clk_pre_phy_clk
			mem_if_lpddr2_emif_0_pll_sharing_pll_addr_cmd_clk          : out   std_logic;                                        -- pll_addr_cmd_clk
			mem_if_lpddr2_emif_0_pll_sharing_pll_avl_clk               : out   std_logic;                                        -- pll_avl_clk
			mem_if_lpddr2_emif_0_pll_sharing_pll_config_clk            : out   std_logic;                                        -- pll_config_clk
			mem_if_lpddr2_emif_0_pll_sharing_pll_mem_phy_clk           : out   std_logic;                                        -- pll_mem_phy_clk
			mem_if_lpddr2_emif_0_pll_sharing_afi_phy_clk               : out   std_logic;                                        -- afi_phy_clk
			mem_if_lpddr2_emif_0_pll_sharing_pll_avl_phy_clk           : out   std_logic;                                        -- pll_avl_phy_clk
			mem_if_lpddr2_emif_0_status_local_init_done                : out   std_logic;                                        -- local_init_done
			mem_if_lpddr2_emif_0_status_local_cal_success              : out   std_logic;                                        -- local_cal_success
			mem_if_lpddr2_emif_0_status_local_cal_fail                 : out   std_logic;                                        -- local_cal_fail
			memory_mem_ca                                              : out   std_logic_vector(9 downto 0);                     -- mem_ca
			memory_mem_ck                                              : out   std_logic_vector(0 downto 0);                     -- mem_ck
			memory_mem_ck_n                                            : out   std_logic_vector(0 downto 0);                     -- mem_ck_n
			memory_mem_cke                                             : out   std_logic_vector(0 downto 0);                     -- mem_cke
			memory_mem_cs_n                                            : out   std_logic_vector(0 downto 0);                     -- mem_cs_n
			memory_mem_dm                                              : out   std_logic_vector(3 downto 0);                     -- mem_dm
			memory_mem_dq                                              : inout std_logic_vector(31 downto 0) := (others => 'X'); -- mem_dq
			memory_mem_dqs                                             : inout std_logic_vector(3 downto 0)  := (others => 'X'); -- mem_dqs
			memory_mem_dqs_n                                           : inout std_logic_vector(3 downto 0)  := (others => 'X'); -- mem_dqs_n
			oct_rzqin                                                  : in    std_logic                     := 'X';             -- rzqin
			reset_reset_n                                              : in    std_logic                     := 'X';             -- reset_n
			reset_cnt_external_connection_export                       : out   std_logic;                                        -- export
			start_bit_external_connection_export                       : out   std_logic;                                        -- export
			sw_pio_external_connection_export                          : in    std_logic_vector(7 downto 0)  := (others => 'X'); -- export
			uart_0_external_connection_rxd                             : in    std_logic                     := 'X';             -- rxd
			uart_0_external_connection_txd                             : out   std_logic;                                        -- txd
			write_en_external_connection_export                        : out   std_logic                                         -- export
		);
	end component nios2_system_v0;

	u0 : component nios2_system_v0
		port map (
			clk_clk                                                    => CONNECTED_TO_clk_clk,                                                    --                              clk.clk
			data_out_external_connection_export                        => CONNECTED_TO_data_out_external_connection_export,                        --     data_out_external_connection.export
			led_pio_external_connection_export                         => CONNECTED_TO_led_pio_external_connection_export,                         --      led_pio_external_connection.export
			mem_if_lpddr2_emif_0_pll_sharing_pll_mem_clk               => CONNECTED_TO_mem_if_lpddr2_emif_0_pll_sharing_pll_mem_clk,               -- mem_if_lpddr2_emif_0_pll_sharing.pll_mem_clk
			mem_if_lpddr2_emif_0_pll_sharing_pll_write_clk             => CONNECTED_TO_mem_if_lpddr2_emif_0_pll_sharing_pll_write_clk,             --                                 .pll_write_clk
			mem_if_lpddr2_emif_0_pll_sharing_pll_locked                => CONNECTED_TO_mem_if_lpddr2_emif_0_pll_sharing_pll_locked,                --                                 .pll_locked
			mem_if_lpddr2_emif_0_pll_sharing_pll_write_clk_pre_phy_clk => CONNECTED_TO_mem_if_lpddr2_emif_0_pll_sharing_pll_write_clk_pre_phy_clk, --                                 .pll_write_clk_pre_phy_clk
			mem_if_lpddr2_emif_0_pll_sharing_pll_addr_cmd_clk          => CONNECTED_TO_mem_if_lpddr2_emif_0_pll_sharing_pll_addr_cmd_clk,          --                                 .pll_addr_cmd_clk
			mem_if_lpddr2_emif_0_pll_sharing_pll_avl_clk               => CONNECTED_TO_mem_if_lpddr2_emif_0_pll_sharing_pll_avl_clk,               --                                 .pll_avl_clk
			mem_if_lpddr2_emif_0_pll_sharing_pll_config_clk            => CONNECTED_TO_mem_if_lpddr2_emif_0_pll_sharing_pll_config_clk,            --                                 .pll_config_clk
			mem_if_lpddr2_emif_0_pll_sharing_pll_mem_phy_clk           => CONNECTED_TO_mem_if_lpddr2_emif_0_pll_sharing_pll_mem_phy_clk,           --                                 .pll_mem_phy_clk
			mem_if_lpddr2_emif_0_pll_sharing_afi_phy_clk               => CONNECTED_TO_mem_if_lpddr2_emif_0_pll_sharing_afi_phy_clk,               --                                 .afi_phy_clk
			mem_if_lpddr2_emif_0_pll_sharing_pll_avl_phy_clk           => CONNECTED_TO_mem_if_lpddr2_emif_0_pll_sharing_pll_avl_phy_clk,           --                                 .pll_avl_phy_clk
			mem_if_lpddr2_emif_0_status_local_init_done                => CONNECTED_TO_mem_if_lpddr2_emif_0_status_local_init_done,                --      mem_if_lpddr2_emif_0_status.local_init_done
			mem_if_lpddr2_emif_0_status_local_cal_success              => CONNECTED_TO_mem_if_lpddr2_emif_0_status_local_cal_success,              --                                 .local_cal_success
			mem_if_lpddr2_emif_0_status_local_cal_fail                 => CONNECTED_TO_mem_if_lpddr2_emif_0_status_local_cal_fail,                 --                                 .local_cal_fail
			memory_mem_ca                                              => CONNECTED_TO_memory_mem_ca,                                              --                           memory.mem_ca
			memory_mem_ck                                              => CONNECTED_TO_memory_mem_ck,                                              --                                 .mem_ck
			memory_mem_ck_n                                            => CONNECTED_TO_memory_mem_ck_n,                                            --                                 .mem_ck_n
			memory_mem_cke                                             => CONNECTED_TO_memory_mem_cke,                                             --                                 .mem_cke
			memory_mem_cs_n                                            => CONNECTED_TO_memory_mem_cs_n,                                            --                                 .mem_cs_n
			memory_mem_dm                                              => CONNECTED_TO_memory_mem_dm,                                              --                                 .mem_dm
			memory_mem_dq                                              => CONNECTED_TO_memory_mem_dq,                                              --                                 .mem_dq
			memory_mem_dqs                                             => CONNECTED_TO_memory_mem_dqs,                                             --                                 .mem_dqs
			memory_mem_dqs_n                                           => CONNECTED_TO_memory_mem_dqs_n,                                           --                                 .mem_dqs_n
			oct_rzqin                                                  => CONNECTED_TO_oct_rzqin,                                                  --                              oct.rzqin
			reset_reset_n                                              => CONNECTED_TO_reset_reset_n,                                              --                            reset.reset_n
			reset_cnt_external_connection_export                       => CONNECTED_TO_reset_cnt_external_connection_export,                       --    reset_cnt_external_connection.export
			start_bit_external_connection_export                       => CONNECTED_TO_start_bit_external_connection_export,                       --    start_bit_external_connection.export
			sw_pio_external_connection_export                          => CONNECTED_TO_sw_pio_external_connection_export,                          --       sw_pio_external_connection.export
			uart_0_external_connection_rxd                             => CONNECTED_TO_uart_0_external_connection_rxd,                             --       uart_0_external_connection.rxd
			uart_0_external_connection_txd                             => CONNECTED_TO_uart_0_external_connection_txd,                             --                                 .txd
			write_en_external_connection_export                        => CONNECTED_TO_write_en_external_connection_export                         --     write_en_external_connection.export
		);

