transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib riviera/xilinx_vip
vlib riviera/xpm
vlib riviera/noc_nps_v1_0_2
vlib riviera/xil_defaultlib

vmap xilinx_vip riviera/xilinx_vip
vmap xpm riviera/xpm
vmap noc_nps_v1_0_2 riviera/noc_nps_v1_0_2
vmap xil_defaultlib riviera/xil_defaultlib

vlog -work xilinx_vip  -incr -l axi_vip_v1_1_22 -l smartconnect_v1_0 -l versal_cips_ps_vip_v1_0_14 -l clk_gen_sim_v1_0_6 -l cpm5_v1_0_20 -l cpm4_v1_0_20 -l noc_hbm_nmu_sim_v1_0_0 -l noc_nmu_sim_v1_0_0 -l emb_mem_gen_v1_0_11 "+incdir+/home/smartscott/AMD/2025.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l noc_nps_v1_0_2 -l xil_defaultlib \
"/home/smartscott/AMD/2025.2/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"/home/smartscott/AMD/2025.2/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"/home/smartscott/AMD/2025.2/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"/home/smartscott/AMD/2025.2/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"/home/smartscott/AMD/2025.2/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"/home/smartscott/AMD/2025.2/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"/home/smartscott/AMD/2025.2/data/xilinx_vip/hdl/axi_vip_if.sv" \
"/home/smartscott/AMD/2025.2/data/xilinx_vip/hdl/clk_vip_if.sv" \
"/home/smartscott/AMD/2025.2/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xpm  -incr -l axi_vip_v1_1_22 -l smartconnect_v1_0 -l versal_cips_ps_vip_v1_0_14 -l clk_gen_sim_v1_0_6 -l cpm5_v1_0_20 -l cpm4_v1_0_20 -l noc_hbm_nmu_sim_v1_0_0 -l noc_nmu_sim_v1_0_0 -l emb_mem_gen_v1_0_11 "+incdir+../../../../tb3d.gen/sim_1/bd/xlnoc/ipshared/d993/hdl/bfm" "+incdir+../../../../../../AMD/2025.2/data/rsb/busdef" "+incdir+/home/smartscott/AMD/2025.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l noc_nps_v1_0_2 -l xil_defaultlib \
"/home/smartscott/AMD/2025.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/home/smartscott/AMD/2025.2/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"/home/smartscott/AMD/2025.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93  -incr \
"/home/smartscott/AMD/2025.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work noc_nps_v1_0_2  -incr -l axi_vip_v1_1_22 -l smartconnect_v1_0 -l versal_cips_ps_vip_v1_0_14 -l clk_gen_sim_v1_0_6 -l cpm5_v1_0_20 -l cpm4_v1_0_20 -l noc_hbm_nmu_sim_v1_0_0 -l noc_nmu_sim_v1_0_0 -l emb_mem_gen_v1_0_11 "+incdir+../../../../tb3d.gen/sim_1/bd/xlnoc/ipshared/d993/hdl/bfm" "+incdir+../../../../../../AMD/2025.2/data/rsb/busdef" "+incdir+/home/smartscott/AMD/2025.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l noc_nps_v1_0_2 -l xil_defaultlib \
"../../../../tb3d.gen/sim_1/bd/xlnoc/ipshared/d993/hdl/noc_nps_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr -l axi_vip_v1_1_22 -l smartconnect_v1_0 -l versal_cips_ps_vip_v1_0_14 -l clk_gen_sim_v1_0_6 -l cpm5_v1_0_20 -l cpm4_v1_0_20 -l noc_hbm_nmu_sim_v1_0_0 -l noc_nmu_sim_v1_0_0 -l emb_mem_gen_v1_0_11 "+incdir+../../../../tb3d.gen/sim_1/bd/xlnoc/ipshared/d993/hdl/bfm" "+incdir+../../../../../../AMD/2025.2/data/rsb/busdef" "+incdir+/home/smartscott/AMD/2025.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l noc_nps_v1_0_2 -l xil_defaultlib \
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

vlog -work xil_defaultlib  -incr -v2k5 "+incdir+../../../../tb3d.gen/sim_1/bd/xlnoc/ipshared/d993/hdl/bfm" "+incdir+../../../../../../AMD/2025.2/data/rsb/busdef" "+incdir+/home/smartscott/AMD/2025.2/data/xilinx_vip/include" -l xilinx_vip -l xpm -l noc_nps_v1_0_2 -l xil_defaultlib \
"../../../bd/xlnoc/sim/xlnoc.v" \

vlog -work xil_defaultlib \
"glbl.v"

