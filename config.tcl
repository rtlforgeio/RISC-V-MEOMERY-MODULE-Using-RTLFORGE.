# designs/sram_64kb_1rw1r_ecc/config.tcl

set ::env(DESIGN_NAME) "sram_64kb_1rw1r_ecc"
set ::env(VERILOG_FILES) "[$::env(DESIGN_DIR)/src/sram_64kb_1rw1r_ecc.v $::env(DESIGN_DIR)/src/sky130_sram_1rw1r_32x2048_8.v]"
set ::env(SDC_FILE) "$::env(DESIGN_DIR)/signoff/sram_64kb_1rw1r_ecc.sdc"

# PDK & Std Cell Library
set ::env(PDK) "sky130A"
set ::env(STD_CELL_LIBRARY) "sky130_fd_sc_hd"

# Clock
set ::env(CLOCK_PORT) "clk"
set ::env(CLOCK_PERIOD) 10.0 ;# 100 MHz target

# Die / Core Area (Estimation for 8 Macros + Logic)
# Macro: ~ 0.16mm x 0.16mm (approx). 8 Macros ~ 0.5mm x 0.5mm logic + routing.
set ::env(DIE_AREA) "0 0 1200 1200"       # microns (1.2mm x 1.2mm)
set ::env(CORE_AREA) "100 100 1100 1100"  # microns

# Pin Placement (IO Pins on perimeter)
set ::env(PIN_ORDER_CFG) "$::env(DESIGN_DIR)/pin_order.cfg"

# Macro Placement (Manual Floorplan Required for Macros)
set ::env(MACRO_PLACEMENT_CFG) "$::env(DESIGN_DIR)/macro.cfg"

# Placement Density
set ::env(PL_TARGET_DENSITY) 0.55
set ::env(PL_RESIZER_TIMING_OPTIMIZATIONS) 1

# Routing
set ::env(RT_MAX_LAYER) "met5"

# Hold Fixing (Critical for Macros)
set ::env(OPTIMIZE_HOLD) 1
set ::env(HOLD_FIX_FANOUT) 4

# Magic/Netgen Signoff
set ::env(RUN_MAGIC_DRC) 1
set ::env(RUN_MAGIC_ANTENNA_CHECK) 1
set ::env(RUN_NETGEN_LVS) 1
