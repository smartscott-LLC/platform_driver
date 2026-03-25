



####Location constraint for master PS9 instance

set_property LOC PS9_X0Y0 [get_cells -hierarchical -filter {NAME =~ "*PS9_inst"}]

####Location constraint for slave PS9 instances

set_property LOC PS9_X0Y1 [get_cells -hierarchical -filter {NAME =~ "*PS9_SLV1"}]
set_property LOC PS9_X0Y2 [get_cells -hierarchical -filter {NAME =~ "*PS9_SLV2"}]
set_property LOC PS9_X0Y3 [get_cells -hierarchical -filter {NAME =~ "*PS9_SLV3"}]

