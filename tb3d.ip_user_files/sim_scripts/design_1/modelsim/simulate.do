onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc"  -L xil_defaultlib -L xilinx_vip -L xpm -L microblaze_v11_0_16 -L noc_nmu_sim_v1_0_0 -L noc_hbm_nmu_sim_v1_0_0 -L xlconstant_v1_1_10 -L proc_sys_reset_v5_0_17 -L smartconnect_v1_0 -L axi_infrastructure_v1_1_0 -L axi_register_slice_v2_1_36 -L axi_vip_v1_1_22 -L axi_apb_bridge_v3_0_21 -L versal_cips_ps_vip_v1_0_14 -L cpm4_v1_0_20 -L cpm5_v1_0_20 -L lmb_v10_v3_0_16 -L lmb_bram_if_cntlr_v4_0_27 -L emb_mem_gen_v1_0_11 -L axi_lite_ipif_v3_0_4 -L mdm_v3_2_29 -L clk_gen_sim_v1_0_6 -L xilinx_vip -L unisims_ver -L unimacro_ver -L secureip -lib xil_defaultlib xil_defaultlib.design_1 xil_defaultlib.glbl

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure
view signals

do {design_1.udo}

run 1000ns

quit -force
