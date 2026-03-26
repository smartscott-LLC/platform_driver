# aclk {FREQ_HZ 100000000 CLK_DOMAIN full_blown_aclk0_0 PHASE 0.0} aclk1 {FREQ_HZ 300000000 CLK_DOMAIN full_blown_noc_clk_gen_0_axi_clk_0 PHASE 0.0}
# Clock Domain: full_blown_aclk0_0
create_clock -name aclk -period 10.000 [get_ports aclk]
# Clock Domain: full_blown_noc_clk_gen_0_axi_clk_0
create_clock -name aclk1 -period 3.333 [get_ports aclk1]
# Generated clocks
