# Clock Definition
create_clock -name clk -period 10.0 [get_ports clk]

# Input Delays (Assume external flop driving inputs)
set_input_delay -clock clk -max 2.0 [get_ports i_addr_a*]
set_input_delay -clock clk -max 2.0 [get_ports i_addr_b*]
set_input_delay -clock clk -max 2.0 [get_ports i_wdata_b*]
set_input_delay -clock clk -max 1.0 [get_ports i_en_a i_en_b i_we_b rst_n]

# Output Delays (Assume capturing flop external)
set_output_delay -clock clk -max 3.0 [get_ports o_rdata_a*]
set_output_delay -clock clk -max 3.0 [get_ports o_rdata_b*]
set_output_delay -clock clk -max 2.0 [get_ports o_ecc_err_a o_ecc_err_b]

# Macro Timing Exceptions (Critical!)
# Sky130 SRAMs have internal setup/hold. 
# Port 0 (RW) Read: Data available after clk0 rise (tco).
# Port 1 (R)  Read: Data available after clk1 rise (tco).
# We assume 1-cycle latency.
# No multicycle paths needed if purely registered in/out.

# False Paths for Async Reset (if not synchronized)
# set_false_path -from [get_ports rst_n] -to [all_registers]
