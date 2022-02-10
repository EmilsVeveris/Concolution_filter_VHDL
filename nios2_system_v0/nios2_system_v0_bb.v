
module nios2_system_v0 (
	clk_clk,
	data_out_external_connection_export,
	led_pio_external_connection_export,
	mem_if_lpddr2_emif_0_pll_sharing_pll_mem_clk,
	mem_if_lpddr2_emif_0_pll_sharing_pll_write_clk,
	mem_if_lpddr2_emif_0_pll_sharing_pll_locked,
	mem_if_lpddr2_emif_0_pll_sharing_pll_write_clk_pre_phy_clk,
	mem_if_lpddr2_emif_0_pll_sharing_pll_addr_cmd_clk,
	mem_if_lpddr2_emif_0_pll_sharing_pll_avl_clk,
	mem_if_lpddr2_emif_0_pll_sharing_pll_config_clk,
	mem_if_lpddr2_emif_0_pll_sharing_pll_mem_phy_clk,
	mem_if_lpddr2_emif_0_pll_sharing_afi_phy_clk,
	mem_if_lpddr2_emif_0_pll_sharing_pll_avl_phy_clk,
	mem_if_lpddr2_emif_0_status_local_init_done,
	mem_if_lpddr2_emif_0_status_local_cal_success,
	mem_if_lpddr2_emif_0_status_local_cal_fail,
	memory_mem_ca,
	memory_mem_ck,
	memory_mem_ck_n,
	memory_mem_cke,
	memory_mem_cs_n,
	memory_mem_dm,
	memory_mem_dq,
	memory_mem_dqs,
	memory_mem_dqs_n,
	oct_rzqin,
	reset_reset_n,
	reset_cnt_external_connection_export,
	start_bit_external_connection_export,
	sw_pio_external_connection_export,
	uart_0_external_connection_rxd,
	uart_0_external_connection_txd,
	write_en_external_connection_export);	

	input		clk_clk;
	output	[7:0]	data_out_external_connection_export;
	output	[7:0]	led_pio_external_connection_export;
	output		mem_if_lpddr2_emif_0_pll_sharing_pll_mem_clk;
	output		mem_if_lpddr2_emif_0_pll_sharing_pll_write_clk;
	output		mem_if_lpddr2_emif_0_pll_sharing_pll_locked;
	output		mem_if_lpddr2_emif_0_pll_sharing_pll_write_clk_pre_phy_clk;
	output		mem_if_lpddr2_emif_0_pll_sharing_pll_addr_cmd_clk;
	output		mem_if_lpddr2_emif_0_pll_sharing_pll_avl_clk;
	output		mem_if_lpddr2_emif_0_pll_sharing_pll_config_clk;
	output		mem_if_lpddr2_emif_0_pll_sharing_pll_mem_phy_clk;
	output		mem_if_lpddr2_emif_0_pll_sharing_afi_phy_clk;
	output		mem_if_lpddr2_emif_0_pll_sharing_pll_avl_phy_clk;
	output		mem_if_lpddr2_emif_0_status_local_init_done;
	output		mem_if_lpddr2_emif_0_status_local_cal_success;
	output		mem_if_lpddr2_emif_0_status_local_cal_fail;
	output	[9:0]	memory_mem_ca;
	output	[0:0]	memory_mem_ck;
	output	[0:0]	memory_mem_ck_n;
	output	[0:0]	memory_mem_cke;
	output	[0:0]	memory_mem_cs_n;
	output	[3:0]	memory_mem_dm;
	inout	[31:0]	memory_mem_dq;
	inout	[3:0]	memory_mem_dqs;
	inout	[3:0]	memory_mem_dqs_n;
	input		oct_rzqin;
	input		reset_reset_n;
	output		reset_cnt_external_connection_export;
	output		start_bit_external_connection_export;
	input	[7:0]	sw_pio_external_connection_export;
	input		uart_0_external_connection_rxd;
	output		uart_0_external_connection_txd;
	output		write_en_external_connection_export;
endmodule
