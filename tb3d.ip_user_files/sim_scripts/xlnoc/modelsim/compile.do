vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xilinx_vip
vlib modelsim_lib/msim/xpm
vlib modelsim_lib/msim/noc_nps_v1_0_2
vlib modelsim_lib/msim/xil_defaultlib

vmap xilinx_vip modelsim_lib/msim/xilinx_vip
vmap xpm modelsim_lib/msim/xpm
vmap noc_nps_v1_0_2 modelsim_lib/msim/noc_nps_v1_0_2
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vlog -work xilinx_vip -64 -incr -mfcu  -sv -L noc_nps_v1_0_2 -L axi_vip_v1_1_22 -L smartconnect_v1_0 -L versal_cips_ps_vip_v1_0_14 -L clk_gen_sim_v1_0_6 -L cpm5_v1_0_20 -L cpm4_v1_0_20 -L noc_hbm_nmu_sim_v1_0_0 -L noc_nmu_sim_v1_0_0 -L emb_mem_gen_v1_0_11 -L xilinx_vip "+incdir+/home/smartscott/AMD/2025.2/data/xilinx_vip/include" \
"/home/smartscott/AMD/2025.2/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"/home/smartscott/AMD/2025.2/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"/home/smartscott/AMD/2025.2/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"/home/smartscott/AMD/2025.2/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"/home/smartscott/AMD/2025.2/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"/home/smartscott/AMD/2025.2/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"/home/smartscott/AMD/2025.2/data/xilinx_vip/hdl/axi_vip_if.sv" \
"/home/smartscott/AMD/2025.2/data/xilinx_vip/hdl/clk_vip_if.sv" \
"/home/smartscott/AMD/2025.2/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xpm -64 -incr -mfcu  -sv -L noc_nps_v1_0_2 -L axi_vip_v1_1_22 -L smartconnect_v1_0 -L versal_cips_ps_vip_v1_0_14 -L clk_gen_sim_v1_0_6 -L cpm5_v1_0_20 -L cpm4_v1_0_20 -L noc_hbm_nmu_sim_v1_0_0 -L noc_nmu_sim_v1_0_0 -L emb_mem_gen_v1_0_11 -L xilinx_vip "+incdir+../../../../tb3d.gen/sim_1/bd/xlnoc/ipshared/d993/hdl/bfm" "+incdir+../../../../../../AMD/2025.2/data/rsb/busdef" "+incdir+/home/smartscott/AMD/2025.2/data/xilinx_vip/include" \
"/home/smartscott/AMD/2025.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/home/smartscott/AMD/2025.2/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"/home/smartscott/AMD/2025.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -64 -93  \
"/home/smartscott/AMD/2025.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work noc_nps_v1_0_2 -64 -incr -mfcu  -sv -L noc_nps_v1_0_2 -L axi_vip_v1_1_22 -L smartconnect_v1_0 -L versal_cips_ps_vip_v1_0_14 -L clk_gen_sim_v1_0_6 -L cpm5_v1_0_20 -L cpm4_v1_0_20 -L noc_hbm_nmu_sim_v1_0_0 -L noc_nmu_sim_v1_0_0 -L emb_mem_gen_v1_0_11 -L xilinx_vip "+incdir+../../../../tb3d.gen/sim_1/bd/xlnoc/ipshared/d993/hdl/bfm" "+incdir+../../../../../../AMD/2025.2/data/rsb/busdef" "+incdir+/home/smartscott/AMD/2025.2/data/xilinx_vip/include" \
"../../../../tb3d.gen/sim_1/bd/xlnoc/ipshared/d993/hdl/noc_nps_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -mfcu  -sv -L noc_nps_v1_0_2 -L axi_vip_v1_1_22 -L smartconnect_v1_0 -L versal_cips_ps_vip_v1_0_14 -L clk_gen_sim_v1_0_6 -L cpm5_v1_0_20 -L cpm4_v1_0_20 -L noc_hbm_nmu_sim_v1_0_0 -L noc_nmu_sim_v1_0_0 -L emb_mem_gen_v1_0_11 -L xilinx_vip "+incdir+../../../../tb3d.gen/sim_1/bd/xlnoc/ipshared/d993/hdl/bfm" "+incdir+../../../../../../AMD/2025.2/data/rsb/busdef" "+incdir+/home/smartscott/AMD/2025.2/data/xilinx_vip/include" \
"../../../bd/xlnoc/ip/xlnoc_nps_0_0/hdl/bfm/xlnoc_nps_0_0_top.sv" \
"../../../bd/xlnoc/ip/xlnoc_nps_0_0/hdl/bfm/xlnoc_nps_0_0.sv" \
"../../../bd/xlnoc/ip/xlnoc_nps_1_0/hdl/bfm/xlnoc_nps_1_0_top.sv" \
"../../../bd/xlnoc/ip/xlnoc_nps_1_0/hdl/bfm/xlnoc_nps_1_0.sv" \
"../../../bd/xlnoc/ip/xlnoc_nps_2_0/hdl/bfm/xlnoc_nps_2_0_top.sv" \
"../../../bd/xlnoc/ip/xlnoc_nps_2_0/hdl/bfm/xlnoc_nps_2_0.sv" \
"../../../bd/xlnoc/ip/xlnoc_nps_3_0/hdl/bfm/xlnoc_nps_3_0_top.sv" \
"../../../bd/xlnoc/ip/xlnoc_nps_3_0/hdl/bfm/xlnoc_nps_3_0.sv" \
"../../../bd/xlnoc/ip/xlnoc_nps_4_0/hdl/bfm/xlnoc_nps_4_0_top.sv" \
"../../../bd/xlnoc/ip/xlnoc_nps_4_0/hdl/bfm/xlnoc_nps_4_0.sv" \
"../../../bd/xlnoc/ip/xlnoc_nps_5_0/hdl/bfm/xlnoc_nps_5_0_top.sv" \
"../../../bd/xlnoc/ip/xlnoc_nps_5_0/hdl/bfm/xlnoc_nps_5_0.sv" \

vlog -work xil_defaultlib -64 -incr -mfcu  "+incdir+../../../../tb3d.gen/sim_1/bd/xlnoc/ipshared/d993/hdl/bfm" "+incdir+../../../../../../AMD/2025.2/data/rsb/busdef" "+incdir+/home/smartscott/AMD/2025.2/data/xilinx_vip/include" \
"../../../bd/xlnoc/sim/xlnoc.v" \

vlog -work xil_defaultlib \
"glbl.v"

