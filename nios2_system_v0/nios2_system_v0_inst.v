	nios2_system_v0 u0 (
		.clk_clk                                                    (<connected-to-clk_clk>),                                                    //                              clk.clk
		.data_out_external_connection_export                        (<connected-to-data_out_external_connection_export>),                        //     data_out_external_connection.export
		.led_pio_external_connection_export                         (<connected-to-led_pio_external_connection_export>),                         //      led_pio_external_connection.export
		.mem_if_lpddr2_emif_0_pll_sharing_pll_mem_clk               (<connected-to-mem_if_lpddr2_emif_0_pll_sharing_pll_mem_clk>),               // mem_if_lpddr2_emif_0_pll_sharing.pll_mem_clk
		.mem_if_lpddr2_emif_0_pll_sharing_pll_write_clk             (<connected-to-mem_if_lpddr2_emif_0_pll_sharing_pll_write_clk>),             //                                 .pll_write_clk
		.mem_if_lpddr2_emif_0_pll_sharing_pll_locked                (<connected-to-mem_if_lpddr2_emif_0_pll_sharing_pll_locked>),                //                                 .pll_locked
		.mem_if_lpddr2_emif_0_pll_sharing_pll_write_clk_pre_phy_clk (<connected-to-mem_if_lpddr2_emif_0_pll_sharing_pll_write_clk_pre_phy_clk>), //                                 .pll_write_clk_pre_phy_clk
		.mem_if_lpddr2_emif_0_pll_sharing_pll_addr_cmd_clk          (<connected-to-mem_if_lpddr2_emif_0_pll_sharing_pll_addr_cmd_clk>),          //                                 .pll_addr_cmd_clk
		.mem_if_lpddr2_emif_0_pll_sharing_pll_avl_clk               (<connected-to-mem_if_lpddr2_emif_0_pll_sharing_pll_avl_clk>),               //                                 .pll_avl_clk
		.mem_if_lpddr2_emif_0_pll_sharing_pll_config_clk            (<connected-to-mem_if_lpddr2_emif_0_pll_sharing_pll_config_clk>),            //                                 .pll_config_clk
		.mem_if_lpddr2_emif_0_pll_sharing_pll_mem_phy_clk           (<connected-to-mem_if_lpddr2_emif_0_pll_sharing_pll_mem_phy_clk>),           //                                 .pll_mem_phy_clk
		.mem_if_lpddr2_emif_0_pll_sharing_afi_phy_clk               (<connected-to-mem_if_lpddr2_emif_0_pll_sharing_afi_phy_clk>),               //                                 .afi_phy_clk
		.mem_if_lpddr2_emif_0_pll_sharing_pll_avl_phy_clk           (<connected-to-mem_if_lpddr2_emif_0_pll_sharing_pll_avl_phy_clk>),           //                                 .pll_avl_phy_clk
		.mem_if_lpddr2_emif_0_status_local_init_done                (<connected-to-mem_if_lpddr2_emif_0_status_local_init_done>),                //      mem_if_lpddr2_emif_0_status.local_init_done
		.mem_if_lpddr2_emif_0_status_local_cal_success              (<connected-to-mem_if_lpddr2_emif_0_status_local_cal_success>),              //                                 .local_cal_success
		.mem_if_lpddr2_emif_0_status_local_cal_fail                 (<connected-to-mem_if_lpddr2_emif_0_status_local_cal_fail>),                 //                                 .local_cal_fail
		.memory_mem_ca                                              (<connected-to-memory_mem_ca>),                                              //                           memory.mem_ca
		.memory_mem_ck                                              (<connected-to-memory_mem_ck>),                                              //                                 .mem_ck
		.memory_mem_ck_n                                            (<connected-to-memory_mem_ck_n>),                                            //                                 .mem_ck_n
		.memory_mem_cke                                             (<connected-to-memory_mem_cke>),                                             //                                 .mem_cke
		.memory_mem_cs_n                                            (<connected-to-memory_mem_cs_n>),                                            //                                 .mem_cs_n
		.memory_mem_dm                                              (<connected-to-memory_mem_dm>),                                              //                                 .mem_dm
		.memory_mem_dq                                              (<connected-to-memory_mem_dq>),                                              //                                 .mem_dq
		.memory_mem_dqs                                             (<connected-to-memory_mem_dqs>),                                             //                                 .mem_dqs
		.memory_mem_dqs_n                                           (<connected-to-memory_mem_dqs_n>),                                           //                                 .mem_dqs_n
		.oct_rzqin                                                  (<connected-to-oct_rzqin>),                                                  //                              oct.rzqin
		.reset_reset_n                                              (<connected-to-reset_reset_n>),                                              //                            reset.reset_n
		.reset_cnt_external_connection_export                       (<connected-to-reset_cnt_external_connection_export>),                       //    reset_cnt_external_connection.export
		.start_bit_external_connection_export                       (<connected-to-start_bit_external_connection_export>),                       //    start_bit_external_connection.export
		.sw_pio_external_connection_export                          (<connected-to-sw_pio_external_connection_export>),                          //       sw_pio_external_connection.export
		.uart_0_external_connection_rxd                             (<connected-to-uart_0_external_connection_rxd>),                             //       uart_0_external_connection.rxd
		.uart_0_external_connection_txd                             (<connected-to-uart_0_external_connection_txd>),                             //                                 .txd
		.write_en_external_connection_export                        (<connected-to-write_en_external_connection_export>)                         //     write_en_external_connection.export
	);

