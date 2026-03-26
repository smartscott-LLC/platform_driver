onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc"  -L xil_defaultlib -L xilinx_vip -L xpm -L proc_sys_reset_v5_0_17 -L smartconnect_v1_0 -L axi_infrastructure_v1_1_0 -L axi_register_slice_v2_1_36 -L axi_vip_v1_1_22 -L clk_gen_sim_v1_0_6 -L axi_apb_bridge_v3_0_21 -L versal_cips_ps_vip_v1_0_14 -L cpm5_v1_0_20 -L cpm4_v1_0_20 -L axi_lite_ipif_v3_0_4 -L axi_fifo_mm_s_v4_3_7 -L noc_nmu_sim_v1_0_0 -L noc_hbm_nmu_sim_v1_0_0 -L xlconstant_v1_1_10 -L noc_nsu_sim_v1_0_1 -L microblaze_v11_0_16 -L lmb_v10_v3_0_16 -L lmb_bram_if_cntlr_v4_0_27 -L emb_mem_gen_v1_0_11 -L axi_intc_v4_1_22 -L mdm_v3_2_29 -L axi_uartlite_v2_0_39 -L axi_datamover_v5_1_37 -L axi_sg_v4_1_21 -L axi_dma_v7_1_37 -L axis_infrastructure_v1_1_1 -L axis_register_slice_v1_1_35 -L axis_subset_converter_v1_1_36 -L xilinx_vip -L unisims_ver -L unimacro_ver -L secureip -lib xil_defaultlib xil_defaultlib.full_blown xil_defaultlib.glbl

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure
view signals

do {full_blown.udo}

run 1000ns

quit -force
