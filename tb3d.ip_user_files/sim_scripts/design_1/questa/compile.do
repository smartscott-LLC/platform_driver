vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xilinx_vip
vlib questa_lib/msim/xpm
vlib questa_lib/msim/xil_defaultlib
vlib questa_lib/msim/proc_sys_reset_v5_0_17
vlib questa_lib/msim/smartconnect_v1_0
vlib questa_lib/msim/axi_infrastructure_v1_1_0
vlib questa_lib/msim/axi_register_slice_v2_1_36
vlib questa_lib/msim/axi_vip_v1_1_22
vlib questa_lib/msim/clk_gen_sim_v1_0_6

vmap xilinx_vip questa_lib/msim/xilinx_vip
vmap xpm questa_lib/msim/xpm
vmap xil_defaultlib questa_lib/msim/xil_defaultlib
vmap proc_sys_reset_v5_0_17 questa_lib/msim/proc_sys_reset_v5_0_17
vmap smartconnect_v1_0 questa_lib/msim/smartconnect_v1_0
vmap axi_infrastructure_v1_1_0 questa_lib/msim/axi_infrastructure_v1_1_0
vmap axi_register_slice_v2_1_36 questa_lib/msim/axi_register_slice_v2_1_36
vmap axi_vip_v1_1_22 questa_lib/msim/axi_vip_v1_1_22
vmap clk_gen_sim_v1_0_6 questa_lib/msim/clk_gen_sim_v1_0_6

vlog -work xilinx_vip -64 -incr -mfcu  -sv -L noc_nps_v1_0_2 -L clk_gen_sim_v1_0_6 -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L xilinx_vip "+incdir+/home/smartscott/AMD/2025.2/data/xilinx_vip/include" \
"/home/smartscott/AMD/2025.2/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"/home/smartscott/AMD/2025.2/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"/home/smartscott/AMD/2025.2/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"/home/smartscott/AMD/2025.2/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"/home/smartscott/AMD/2025.2/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"/home/smartscott/AMD/2025.2/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"/home/smartscott/AMD/2025.2/data/xilinx_vip/hdl/axi_vip_if.sv" \
"/home/smartscott/AMD/2025.2/data/xilinx_vip/hdl/clk_vip_if.sv" \
"/home/smartscott/AMD/2025.2/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xpm -64 -incr -mfcu  -sv -L noc_nps_v1_0_2 -L clk_gen_sim_v1_0_6 -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L xilinx_vip "+incdir+../../../../tb3d.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../tb3d.gen/sources_1/bd/design_1/ipshared/00fe/hdl/verilog" "+incdir+../../../../tb3d.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../../AMD/2025.2/data/rsb/busdef" "+incdir+/home/smartscott/AMD/2025.2/data/xilinx_vip/include" \
"/home/smartscott/AMD/2025.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/home/smartscott/AMD/2025.2/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"/home/smartscott/AMD/2025.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -64 -93  \
"/home/smartscott/AMD/2025.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib -64 -incr -mfcu  "+incdir+../../../../tb3d.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../tb3d.gen/sources_1/bd/design_1/ipshared/00fe/hdl/verilog" "+incdir+../../../../tb3d.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../../AMD/2025.2/data/rsb/busdef" "+incdir+/home/smartscott/AMD/2025.2/data/xilinx_vip/include" \
"../../../bd/design_1/sim/design_1.v" \
"../../../bd/design_1/ip/design_1_tb3d_engine_top_0_0/sim/design_1_tb3d_engine_top_0_0.v" \
"../../../bd/design_1/ip/design_1_tb3d_pcie_bridge_0_0/sim/design_1_tb3d_pcie_bridge_0_0.v" \

vcom -work proc_sys_reset_v5_0_17 -64 -93  \
"../../../../tb3d.gen/sources_1/bd/design_1/ipshared/9438/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93  \
"../../../bd/design_1/ip/design_1_axi_smc_2/bd_0/ip/ip_1/sim/bd_6e42_psr_aclk_0.vhd" \

vlog -work smartconnect_v1_0 -64 -incr -mfcu  -sv -L noc_nps_v1_0_2 -L clk_gen_sim_v1_0_6 -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L xilinx_vip "+incdir+../../../../tb3d.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../tb3d.gen/sources_1/bd/design_1/ipshared/00fe/hdl/verilog" "+incdir+../../../../tb3d.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../../AMD/2025.2/data/rsb/busdef" "+incdir+/home/smartscott/AMD/2025.2/data/xilinx_vip/include" \
"../../../../tb3d.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/sc_util_v1_0_vl_rfs.sv" \
"../../../../tb3d.gen/sources_1/bd/design_1/ipshared/3d9a/hdl/sc_mmu_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -mfcu  -sv -L noc_nps_v1_0_2 -L clk_gen_sim_v1_0_6 -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L xilinx_vip "+incdir+../../../../tb3d.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../tb3d.gen/sources_1/bd/design_1/ipshared/00fe/hdl/verilog" "+incdir+../../../../tb3d.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../../AMD/2025.2/data/rsb/busdef" "+incdir+/home/smartscott/AMD/2025.2/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_axi_smc_2/bd_0/ip/ip_2/sim/bd_6e42_s00mmu_0.sv" \

vlog -work smartconnect_v1_0 -64 -incr -mfcu  -sv -L noc_nps_v1_0_2 -L clk_gen_sim_v1_0_6 -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L xilinx_vip "+incdir+../../../../tb3d.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../tb3d.gen/sources_1/bd/design_1/ipshared/00fe/hdl/verilog" "+incdir+../../../../tb3d.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../../AMD/2025.2/data/rsb/busdef" "+incdir+/home/smartscott/AMD/2025.2/data/xilinx_vip/include" \
"../../../../tb3d.gen/sources_1/bd/design_1/ipshared/7785/hdl/sc_transaction_regulator_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -mfcu  -sv -L noc_nps_v1_0_2 -L clk_gen_sim_v1_0_6 -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L xilinx_vip "+incdir+../../../../tb3d.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../tb3d.gen/sources_1/bd/design_1/ipshared/00fe/hdl/verilog" "+incdir+../../../../tb3d.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../../AMD/2025.2/data/rsb/busdef" "+incdir+/home/smartscott/AMD/2025.2/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_axi_smc_2/bd_0/ip/ip_3/sim/bd_6e42_s00tr_0.sv" \

vlog -work smartconnect_v1_0 -64 -incr -mfcu  -sv -L noc_nps_v1_0_2 -L clk_gen_sim_v1_0_6 -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L xilinx_vip "+incdir+../../../../tb3d.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../tb3d.gen/sources_1/bd/design_1/ipshared/00fe/hdl/verilog" "+incdir+../../../../tb3d.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../../AMD/2025.2/data/rsb/busdef" "+incdir+/home/smartscott/AMD/2025.2/data/xilinx_vip/include" \
"../../../../tb3d.gen/sources_1/bd/design_1/ipshared/3051/hdl/sc_si_converter_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -mfcu  -sv -L noc_nps_v1_0_2 -L clk_gen_sim_v1_0_6 -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L xilinx_vip "+incdir+../../../../tb3d.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../tb3d.gen/sources_1/bd/design_1/ipshared/00fe/hdl/verilog" "+incdir+../../../../tb3d.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../../AMD/2025.2/data/rsb/busdef" "+incdir+/home/smartscott/AMD/2025.2/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_axi_smc_2/bd_0/ip/ip_4/sim/bd_6e42_s00sic_0.sv" \

vlog -work smartconnect_v1_0 -64 -incr -mfcu  -sv -L noc_nps_v1_0_2 -L clk_gen_sim_v1_0_6 -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L xilinx_vip "+incdir+../../../../tb3d.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../tb3d.gen/sources_1/bd/design_1/ipshared/00fe/hdl/verilog" "+incdir+../../../../tb3d.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../../AMD/2025.2/data/rsb/busdef" "+incdir+/home/smartscott/AMD/2025.2/data/xilinx_vip/include" \
"../../../../tb3d.gen/sources_1/bd/design_1/ipshared/852f/hdl/sc_axi2sc_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -mfcu  -sv -L noc_nps_v1_0_2 -L clk_gen_sim_v1_0_6 -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L xilinx_vip "+incdir+../../../../tb3d.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../tb3d.gen/sources_1/bd/design_1/ipshared/00fe/hdl/verilog" "+incdir+../../../../tb3d.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../../AMD/2025.2/data/rsb/busdef" "+incdir+/home/smartscott/AMD/2025.2/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_axi_smc_2/bd_0/ip/ip_5/sim/bd_6e42_s00a2s_0.sv" \

vlog -work smartconnect_v1_0 -64 -incr -mfcu  -sv -L noc_nps_v1_0_2 -L clk_gen_sim_v1_0_6 -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L xilinx_vip "+incdir+../../../../tb3d.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../tb3d.gen/sources_1/bd/design_1/ipshared/00fe/hdl/verilog" "+incdir+../../../../tb3d.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../../AMD/2025.2/data/rsb/busdef" "+incdir+/home/smartscott/AMD/2025.2/data/xilinx_vip/include" \
"../../../../tb3d.gen/sources_1/bd/design_1/ipshared/00fe/hdl/sc_node_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -mfcu  -sv -L noc_nps_v1_0_2 -L clk_gen_sim_v1_0_6 -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L xilinx_vip "+incdir+../../../../tb3d.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../tb3d.gen/sources_1/bd/design_1/ipshared/00fe/hdl/verilog" "+incdir+../../../../tb3d.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../../AMD/2025.2/data/rsb/busdef" "+incdir+/home/smartscott/AMD/2025.2/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_axi_smc_2/bd_0/ip/ip_6/sim/bd_6e42_sarn_0.sv" \
"../../../bd/design_1/ip/design_1_axi_smc_2/bd_0/ip/ip_7/sim/bd_6e42_srn_0.sv" \
"../../../bd/design_1/ip/design_1_axi_smc_2/bd_0/ip/ip_8/sim/bd_6e42_sawn_0.sv" \
"../../../bd/design_1/ip/design_1_axi_smc_2/bd_0/ip/ip_9/sim/bd_6e42_swn_0.sv" \
"../../../bd/design_1/ip/design_1_axi_smc_2/bd_0/ip/ip_10/sim/bd_6e42_sbn_0.sv" \

vlog -work smartconnect_v1_0 -64 -incr -mfcu  -sv -L noc_nps_v1_0_2 -L clk_gen_sim_v1_0_6 -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L xilinx_vip "+incdir+../../../../tb3d.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../tb3d.gen/sources_1/bd/design_1/ipshared/00fe/hdl/verilog" "+incdir+../../../../tb3d.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../../AMD/2025.2/data/rsb/busdef" "+incdir+/home/smartscott/AMD/2025.2/data/xilinx_vip/include" \
"../../../../tb3d.gen/sources_1/bd/design_1/ipshared/fca9/hdl/sc_sc2axi_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -mfcu  -sv -L noc_nps_v1_0_2 -L clk_gen_sim_v1_0_6 -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L xilinx_vip "+incdir+../../../../tb3d.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../tb3d.gen/sources_1/bd/design_1/ipshared/00fe/hdl/verilog" "+incdir+../../../../tb3d.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../../AMD/2025.2/data/rsb/busdef" "+incdir+/home/smartscott/AMD/2025.2/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_axi_smc_2/bd_0/ip/ip_11/sim/bd_6e42_m00s2a_0.sv" \

vlog -work smartconnect_v1_0 -64 -incr -mfcu  -sv -L noc_nps_v1_0_2 -L clk_gen_sim_v1_0_6 -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L xilinx_vip "+incdir+../../../../tb3d.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../tb3d.gen/sources_1/bd/design_1/ipshared/00fe/hdl/verilog" "+incdir+../../../../tb3d.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../../AMD/2025.2/data/rsb/busdef" "+incdir+/home/smartscott/AMD/2025.2/data/xilinx_vip/include" \
"../../../../tb3d.gen/sources_1/bd/design_1/ipshared/e44a/hdl/sc_exit_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -mfcu  -sv -L noc_nps_v1_0_2 -L clk_gen_sim_v1_0_6 -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L xilinx_vip "+incdir+../../../../tb3d.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../tb3d.gen/sources_1/bd/design_1/ipshared/00fe/hdl/verilog" "+incdir+../../../../tb3d.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../../AMD/2025.2/data/rsb/busdef" "+incdir+/home/smartscott/AMD/2025.2/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_axi_smc_2/bd_0/ip/ip_12/sim/bd_6e42_m00e_0.sv" \

vlog -work xil_defaultlib -64 -incr -mfcu  "+incdir+../../../../tb3d.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../tb3d.gen/sources_1/bd/design_1/ipshared/00fe/hdl/verilog" "+incdir+../../../../tb3d.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../../AMD/2025.2/data/rsb/busdef" "+incdir+/home/smartscott/AMD/2025.2/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_axi_smc_2/bd_0/sim/bd_6e42.v" \

vcom -work smartconnect_v1_0 -64 -93  \
"../../../../tb3d.gen/sources_1/bd/design_1/ipshared/cb42/hdl/sc_ultralite_v1_0_rfs.vhd" \

vlog -work smartconnect_v1_0 -64 -incr -mfcu  -sv -L noc_nps_v1_0_2 -L clk_gen_sim_v1_0_6 -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L xilinx_vip "+incdir+../../../../tb3d.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../tb3d.gen/sources_1/bd/design_1/ipshared/00fe/hdl/verilog" "+incdir+../../../../tb3d.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../../AMD/2025.2/data/rsb/busdef" "+incdir+/home/smartscott/AMD/2025.2/data/xilinx_vip/include" \
"../../../../tb3d.gen/sources_1/bd/design_1/ipshared/cb42/hdl/sc_ultralite_v1_0_rfs.sv" \
"../../../../tb3d.gen/sources_1/bd/design_1/ipshared/0848/hdl/sc_switchboard_v1_0_vl_rfs.sv" \

vlog -work axi_infrastructure_v1_1_0 -64 -incr -mfcu  "+incdir+../../../../tb3d.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../tb3d.gen/sources_1/bd/design_1/ipshared/00fe/hdl/verilog" "+incdir+../../../../tb3d.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../../AMD/2025.2/data/rsb/busdef" "+incdir+/home/smartscott/AMD/2025.2/data/xilinx_vip/include" \
"../../../../tb3d.gen/sources_1/bd/design_1/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_36 -64 -incr -mfcu  "+incdir+../../../../tb3d.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../tb3d.gen/sources_1/bd/design_1/ipshared/00fe/hdl/verilog" "+incdir+../../../../tb3d.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../../AMD/2025.2/data/rsb/busdef" "+incdir+/home/smartscott/AMD/2025.2/data/xilinx_vip/include" \
"../../../../tb3d.gen/sources_1/bd/design_1/ipshared/bc4b/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work axi_vip_v1_1_22 -64 -incr -mfcu  -sv -L noc_nps_v1_0_2 -L clk_gen_sim_v1_0_6 -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L xilinx_vip "+incdir+../../../../tb3d.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../tb3d.gen/sources_1/bd/design_1/ipshared/00fe/hdl/verilog" "+incdir+../../../../tb3d.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../../AMD/2025.2/data/rsb/busdef" "+incdir+/home/smartscott/AMD/2025.2/data/xilinx_vip/include" \
"../../../../tb3d.gen/sources_1/bd/design_1/ipshared/b16a/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -mfcu  -sv -L noc_nps_v1_0_2 -L clk_gen_sim_v1_0_6 -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L xilinx_vip "+incdir+../../../../tb3d.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../tb3d.gen/sources_1/bd/design_1/ipshared/00fe/hdl/verilog" "+incdir+../../../../tb3d.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../../AMD/2025.2/data/rsb/busdef" "+incdir+/home/smartscott/AMD/2025.2/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_axi_smc_2/sim/design_1_axi_smc_2.sv" \

vlog -work clk_gen_sim_v1_0_6 -64 -incr -mfcu  -sv -L noc_nps_v1_0_2 -L clk_gen_sim_v1_0_6 -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L xilinx_vip "+incdir+../../../../tb3d.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../tb3d.gen/sources_1/bd/design_1/ipshared/00fe/hdl/verilog" "+incdir+../../../../tb3d.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../../AMD/2025.2/data/rsb/busdef" "+incdir+/home/smartscott/AMD/2025.2/data/xilinx_vip/include" \
"../../../../tb3d.gen/sources_1/bd/design_1/ipshared/6aeb/hdl/clk_gen_sim_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -mfcu  -sv -L noc_nps_v1_0_2 -L clk_gen_sim_v1_0_6 -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L xilinx_vip "+incdir+../../../../tb3d.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../tb3d.gen/sources_1/bd/design_1/ipshared/00fe/hdl/verilog" "+incdir+../../../../tb3d.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../../AMD/2025.2/data/rsb/busdef" "+incdir+/home/smartscott/AMD/2025.2/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_noc_clk_gen_2/hdl/design_1_noc_clk_gen_2.sv" \

vlog -work xil_defaultlib -64 -incr -mfcu  "+incdir+../../../../tb3d.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../tb3d.gen/sources_1/bd/design_1/ipshared/00fe/hdl/verilog" "+incdir+../../../../tb3d.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../../AMD/2025.2/data/rsb/busdef" "+incdir+/home/smartscott/AMD/2025.2/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_clk_wiz_1/design_1_clk_wiz_1_clocking_structure.v" \
"../../../bd/design_1/ip/design_1_clk_wiz_1/design_1_clk_wiz_1_clocking_MBUFGCE_CE_DLY.v" \

vlog -work xil_defaultlib -64 -incr -mfcu  -sv -L noc_nps_v1_0_2 -L clk_gen_sim_v1_0_6 -L smartconnect_v1_0 -L axi_vip_v1_1_22 -L xilinx_vip "+incdir+../../../../tb3d.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../tb3d.gen/sources_1/bd/design_1/ipshared/00fe/hdl/verilog" "+incdir+../../../../tb3d.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../../AMD/2025.2/data/rsb/busdef" "+incdir+/home/smartscott/AMD/2025.2/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_clk_wiz_1/design_1_clk_wiz_1_clocking_cmt_dpll_fd_cal.sv" \
"../../../bd/design_1/ip/design_1_clk_wiz_1/design_1_clk_wiz_1_clocking_Synchronizer3.sv" \

vlog -work xil_defaultlib -64 -incr -mfcu  "+incdir+../../../../tb3d.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../tb3d.gen/sources_1/bd/design_1/ipshared/00fe/hdl/verilog" "+incdir+../../../../tb3d.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../../AMD/2025.2/data/rsb/busdef" "+incdir+/home/smartscott/AMD/2025.2/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_clk_wiz_1/design_1_clk_wiz_1_clk_wiz_top.v" \
"../../../bd/design_1/ip/design_1_clk_wiz_1/sim/design_1_clk_wiz_1.v" \

vcom -work xil_defaultlib -64 -93  \
"../../../bd/design_1/ip/design_1_rst_clk_wiz_100M_2/sim/design_1_rst_clk_wiz_100M_2.vhd" \

vlog -work xil_defaultlib \
"glbl.v"

