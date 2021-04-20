vlib work
vlib riviera

vlib riviera/xilinx_vip
vlib riviera/xil_defaultlib
vlib riviera/xpm
vlib riviera/axi_infrastructure_v1_1_0
vlib riviera/smartconnect_v1_0
vlib riviera/axi_protocol_checker_v2_0_3
vlib riviera/axi_vip_v1_1_3
vlib riviera/processing_system7_vip_v1_0_5
vlib riviera/axi_lite_ipif_v3_0_4
vlib riviera/lib_cdc_v1_0_2
vlib riviera/interrupt_control_v3_1_4
vlib riviera/axi_gpio_v2_0_19
vlib riviera/proc_sys_reset_v5_0_12
vlib riviera/generic_baseblocks_v2_1_0
vlib riviera/axi_register_slice_v2_1_17
vlib riviera/fifo_generator_v13_2_2
vlib riviera/axi_data_fifo_v2_1_16
vlib riviera/axi_crossbar_v2_1_18
vlib riviera/axi_protocol_converter_v2_1_17

vmap xilinx_vip riviera/xilinx_vip
vmap xil_defaultlib riviera/xil_defaultlib
vmap xpm riviera/xpm
vmap axi_infrastructure_v1_1_0 riviera/axi_infrastructure_v1_1_0
vmap smartconnect_v1_0 riviera/smartconnect_v1_0
vmap axi_protocol_checker_v2_0_3 riviera/axi_protocol_checker_v2_0_3
vmap axi_vip_v1_1_3 riviera/axi_vip_v1_1_3
vmap processing_system7_vip_v1_0_5 riviera/processing_system7_vip_v1_0_5
vmap axi_lite_ipif_v3_0_4 riviera/axi_lite_ipif_v3_0_4
vmap lib_cdc_v1_0_2 riviera/lib_cdc_v1_0_2
vmap interrupt_control_v3_1_4 riviera/interrupt_control_v3_1_4
vmap axi_gpio_v2_0_19 riviera/axi_gpio_v2_0_19
vmap proc_sys_reset_v5_0_12 riviera/proc_sys_reset_v5_0_12
vmap generic_baseblocks_v2_1_0 riviera/generic_baseblocks_v2_1_0
vmap axi_register_slice_v2_1_17 riviera/axi_register_slice_v2_1_17
vmap fifo_generator_v13_2_2 riviera/fifo_generator_v13_2_2
vmap axi_data_fifo_v2_1_16 riviera/axi_data_fifo_v2_1_16
vmap axi_crossbar_v2_1_18 riviera/axi_crossbar_v2_1_18
vmap axi_protocol_converter_v2_1_17 riviera/axi_protocol_converter_v2_1_17

vlog -work xilinx_vip  -sv2k12 "+incdir+../../../../../src/bd/ipshared/ec67/hdl" "+incdir+../../../../../src/bd/ipshared/5bb9/hdl/verilog" "+incdir+../../../../../src/bd/ipshared/70fd/hdl" "+incdir+/esat/micas-data/software/xilinx_vivado_2018.2/Vivado/2018.2/data/xilinx_vip/include" "+incdir+/esat/micas-data/software/xilinx_vivado_2018.2/Vivado/2018.2/data/xilinx_vip/include" \
"/esat/micas-data/software/xilinx_vivado_2018.2/Vivado/2018.2/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"/esat/micas-data/software/xilinx_vivado_2018.2/Vivado/2018.2/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"/esat/micas-data/software/xilinx_vivado_2018.2/Vivado/2018.2/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"/esat/micas-data/software/xilinx_vivado_2018.2/Vivado/2018.2/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"/esat/micas-data/software/xilinx_vivado_2018.2/Vivado/2018.2/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"/esat/micas-data/software/xilinx_vivado_2018.2/Vivado/2018.2/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"/esat/micas-data/software/xilinx_vivado_2018.2/Vivado/2018.2/data/xilinx_vip/hdl/axi_vip_if.sv" \
"/esat/micas-data/software/xilinx_vivado_2018.2/Vivado/2018.2/data/xilinx_vip/hdl/clk_vip_if.sv" \
"/esat/micas-data/software/xilinx_vivado_2018.2/Vivado/2018.2/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../../src/bd/ipshared/ec67/hdl" "+incdir+../../../../../src/bd/ipshared/5bb9/hdl/verilog" "+incdir+../../../../../src/bd/ipshared/70fd/hdl" "+incdir+/esat/micas-data/software/xilinx_vivado_2018.2/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../../src/bd/ipshared/ec67/hdl" "+incdir+../../../../../src/bd/ipshared/5bb9/hdl/verilog" "+incdir+../../../../../src/bd/ipshared/70fd/hdl" "+incdir+/esat/micas-data/software/xilinx_vivado_2018.2/Vivado/2018.2/data/xilinx_vip/include" \
"/esat/micas-data/software/xilinx_vivado_2018.2/Vivado/2018.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/esat/micas-data/software/xilinx_vivado_2018.2/Vivado/2018.2/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"/esat/micas-data/software/xilinx_vivado_2018.2/Vivado/2018.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"/esat/micas-data/software/xilinx_vivado_2018.2/Vivado/2018.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work axi_infrastructure_v1_1_0  -v2k5 "+incdir+../../../../../src/bd/ipshared/ec67/hdl" "+incdir+../../../../../src/bd/ipshared/5bb9/hdl/verilog" "+incdir+../../../../../src/bd/ipshared/70fd/hdl" "+incdir+/esat/micas-data/software/xilinx_vivado_2018.2/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../../src/bd/ipshared/ec67/hdl" "+incdir+../../../../../src/bd/ipshared/5bb9/hdl/verilog" "+incdir+../../../../../src/bd/ipshared/70fd/hdl" "+incdir+/esat/micas-data/software/xilinx_vivado_2018.2/Vivado/2018.2/data/xilinx_vip/include" \
"../../../../../src/bd/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../../src/bd/ipshared/ec67/hdl" "+incdir+../../../../../src/bd/ipshared/5bb9/hdl/verilog" "+incdir+../../../../../src/bd/ipshared/70fd/hdl" "+incdir+/esat/micas-data/software/xilinx_vivado_2018.2/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../../src/bd/ipshared/ec67/hdl" "+incdir+../../../../../src/bd/ipshared/5bb9/hdl/verilog" "+incdir+../../../../../src/bd/ipshared/70fd/hdl" "+incdir+/esat/micas-data/software/xilinx_vivado_2018.2/Vivado/2018.2/data/xilinx_vip/include" \
"../../../../../src/bd/ipshared/5bb9/hdl/sc_util_v1_0_vl_rfs.sv" \

vlog -work axi_protocol_checker_v2_0_3  -sv2k12 "+incdir+../../../../../src/bd/ipshared/ec67/hdl" "+incdir+../../../../../src/bd/ipshared/5bb9/hdl/verilog" "+incdir+../../../../../src/bd/ipshared/70fd/hdl" "+incdir+/esat/micas-data/software/xilinx_vivado_2018.2/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../../src/bd/ipshared/ec67/hdl" "+incdir+../../../../../src/bd/ipshared/5bb9/hdl/verilog" "+incdir+../../../../../src/bd/ipshared/70fd/hdl" "+incdir+/esat/micas-data/software/xilinx_vivado_2018.2/Vivado/2018.2/data/xilinx_vip/include" \
"../../../../../src/bd/ipshared/03a9/hdl/axi_protocol_checker_v2_0_vl_rfs.sv" \

vlog -work axi_vip_v1_1_3  -sv2k12 "+incdir+../../../../../src/bd/ipshared/ec67/hdl" "+incdir+../../../../../src/bd/ipshared/5bb9/hdl/verilog" "+incdir+../../../../../src/bd/ipshared/70fd/hdl" "+incdir+/esat/micas-data/software/xilinx_vivado_2018.2/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../../src/bd/ipshared/ec67/hdl" "+incdir+../../../../../src/bd/ipshared/5bb9/hdl/verilog" "+incdir+../../../../../src/bd/ipshared/70fd/hdl" "+incdir+/esat/micas-data/software/xilinx_vivado_2018.2/Vivado/2018.2/data/xilinx_vip/include" \
"../../../../../src/bd/ipshared/b9a8/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work processing_system7_vip_v1_0_5  -sv2k12 "+incdir+../../../../../src/bd/ipshared/ec67/hdl" "+incdir+../../../../../src/bd/ipshared/5bb9/hdl/verilog" "+incdir+../../../../../src/bd/ipshared/70fd/hdl" "+incdir+/esat/micas-data/software/xilinx_vivado_2018.2/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../../src/bd/ipshared/ec67/hdl" "+incdir+../../../../../src/bd/ipshared/5bb9/hdl/verilog" "+incdir+../../../../../src/bd/ipshared/70fd/hdl" "+incdir+/esat/micas-data/software/xilinx_vivado_2018.2/Vivado/2018.2/data/xilinx_vip/include" \
"../../../../../src/bd/ipshared/70fd/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../../src/bd/ipshared/ec67/hdl" "+incdir+../../../../../src/bd/ipshared/5bb9/hdl/verilog" "+incdir+../../../../../src/bd/ipshared/70fd/hdl" "+incdir+/esat/micas-data/software/xilinx_vivado_2018.2/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../../src/bd/ipshared/ec67/hdl" "+incdir+../../../../../src/bd/ipshared/5bb9/hdl/verilog" "+incdir+../../../../../src/bd/ipshared/70fd/hdl" "+incdir+/esat/micas-data/software/xilinx_vivado_2018.2/Vivado/2018.2/data/xilinx_vip/include" \
"../../../../../src/bd/ip/drone_processing_system7_0_0/sim/drone_processing_system7_0_0.v" \

vcom -work xil_defaultlib -93 \
"../../../../../src/bd/ipshared/5f23/src/PWM_measure.vhd" \
"../../../../../src/bd/ipshared/5f23/hdl/RC_v1_0_S00_AXI.vhd" \
"../../../../../src/bd/ipshared/5f23/hdl/RC_v1_0.vhd" \
"../../../../../src/bd/ip/drone_RC_1_0/sim/drone_RC_1_0.vhd" \
"../../../../../src/bd/ip/drone_RC_0_0/sim/drone_RC_0_0.vhd" \

vcom -work axi_lite_ipif_v3_0_4 -93 \
"../../../../../src/bd/ipshared/cced/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \

vcom -work lib_cdc_v1_0_2 -93 \
"../../../../../src/bd/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work interrupt_control_v3_1_4 -93 \
"../../../../../src/bd/ipshared/8e66/hdl/interrupt_control_v3_1_vh_rfs.vhd" \

vcom -work axi_gpio_v2_0_19 -93 \
"../../../../../src/bd/ipshared/c193/hdl/axi_gpio_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../../../src/bd/ip/drone_axi_gpio_testpins_0/sim/drone_axi_gpio_testpins_0.vhd" \
"../../../../../src/bd/ip/drone_axi_gpio_led_0/sim/drone_axi_gpio_led_0.vhd" \
"../../../../../src/bd/ipshared/7836/kill_switch.vhd" \
"../../../../../src/bd/ip/drone_kill_switch_0_0/sim/drone_kill_switch_0_0.vhd" \
"../../../../../src/bd/ipshared/7486/hdl/PWM_AXI.vhd" \
"../../../../../src/bd/ipshared/7486/hdl/PWM_AXI_v1_0_S00_AXI.vhd" \
"../../../../../src/bd/ipshared/7486/hdl/PWM_AXI_v1_0.vhd" \
"../../../../../src/bd/ip/drone_PWM_AXI_triple_0_0/sim/drone_PWM_AXI_triple_0_0.vhd" \
"../../../../../src/bd/ip/drone_PWM_AXI_triple_3_0/sim/drone_PWM_AXI_triple_3_0.vhd" \
"../../../../../src/bd/ip/drone_PWM_AXI_triple_5_0/sim/drone_PWM_AXI_triple_5_0.vhd" \

vcom -work proc_sys_reset_v5_0_12 -93 \
"../../../../../src/bd/ipshared/f86a/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../../../src/bd/ip/drone_rst_processing_system7_0_100M_0/sim/drone_rst_processing_system7_0_100M_0.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../../src/bd/ipshared/ec67/hdl" "+incdir+../../../../../src/bd/ipshared/5bb9/hdl/verilog" "+incdir+../../../../../src/bd/ipshared/70fd/hdl" "+incdir+/esat/micas-data/software/xilinx_vivado_2018.2/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../../src/bd/ipshared/ec67/hdl" "+incdir+../../../../../src/bd/ipshared/5bb9/hdl/verilog" "+incdir+../../../../../src/bd/ipshared/70fd/hdl" "+incdir+/esat/micas-data/software/xilinx_vivado_2018.2/Vivado/2018.2/data/xilinx_vip/include" \
"../../../../../src/bd/ipshared/903d/hdl/TDP_bram.v" \
"../../../../../src/bd/ipshared/903d/hdl/keccakF400Permutation.v" \
"../../../../../src/bd/ipshared/903d/hdl/EAGLE_interface_CONTROL.v" \
"../../../../../src/bd/ipshared/903d/hdl/EAGLE_to_AXI_interface.v" \
"../../../../../src/bd/ipshared/903d/hdl/crypto2020_hash_ip_v1_v1_0_S00_AXI.v" \
"../../../../../src/bd/ipshared/903d/hdl/crypto2020_hash_ip_v1_v1_0.v" \
"../../../../../src/bd/ip/drone_crypto2020_hash_ip_v1_0_0/sim/drone_crypto2020_hash_ip_v1_0_0.v" \
"../../../../../src/bd/ip/drone_xadc_wiz_0_0/drone_xadc_wiz_0_0.v" \

vcom -work xil_defaultlib -93 \
"../../../../../src/bd/ip/drone_PWM_AXI_triple_4_0/sim/drone_PWM_AXI_triple_4_0.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../../src/bd/ipshared/ec67/hdl" "+incdir+../../../../../src/bd/ipshared/5bb9/hdl/verilog" "+incdir+../../../../../src/bd/ipshared/70fd/hdl" "+incdir+/esat/micas-data/software/xilinx_vivado_2018.2/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../../src/bd/ipshared/ec67/hdl" "+incdir+../../../../../src/bd/ipshared/5bb9/hdl/verilog" "+incdir+../../../../../src/bd/ipshared/70fd/hdl" "+incdir+/esat/micas-data/software/xilinx_vivado_2018.2/Vivado/2018.2/data/xilinx_vip/include" \
"../../../../../src/bd/ipshared/8942/hdl/SWIPT_2020_v1_0_S00_AXI.v" \
"../../../../../src/bd/ipshared/8942/swipt_toplevel.v" \
"../../../../../src/bd/ipshared/8942/hdl/Pwm.v" \
"../../../../../src/bd/ipshared/8942/hdl/EnvelopeFollower.v" \
"../../../../../src/bd/ipshared/8942/hdl/FrequencyTrackerII.v" \
"../../../../../src/bd/ipshared/8942/hdl/SWIPT_2020_v1_0.v" \
"../../../../../src/bd/ip/drone_SWIPT_2020_0_0/sim/drone_SWIPT_2020_0_0.v" \

vlog -work generic_baseblocks_v2_1_0  -v2k5 "+incdir+../../../../../src/bd/ipshared/ec67/hdl" "+incdir+../../../../../src/bd/ipshared/5bb9/hdl/verilog" "+incdir+../../../../../src/bd/ipshared/70fd/hdl" "+incdir+/esat/micas-data/software/xilinx_vivado_2018.2/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../../src/bd/ipshared/ec67/hdl" "+incdir+../../../../../src/bd/ipshared/5bb9/hdl/verilog" "+incdir+../../../../../src/bd/ipshared/70fd/hdl" "+incdir+/esat/micas-data/software/xilinx_vivado_2018.2/Vivado/2018.2/data/xilinx_vip/include" \
"../../../../../src/bd/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_17  -v2k5 "+incdir+../../../../../src/bd/ipshared/ec67/hdl" "+incdir+../../../../../src/bd/ipshared/5bb9/hdl/verilog" "+incdir+../../../../../src/bd/ipshared/70fd/hdl" "+incdir+/esat/micas-data/software/xilinx_vivado_2018.2/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../../src/bd/ipshared/ec67/hdl" "+incdir+../../../../../src/bd/ipshared/5bb9/hdl/verilog" "+incdir+../../../../../src/bd/ipshared/70fd/hdl" "+incdir+/esat/micas-data/software/xilinx_vivado_2018.2/Vivado/2018.2/data/xilinx_vip/include" \
"../../../../../src/bd/ipshared/6020/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work fifo_generator_v13_2_2  -v2k5 "+incdir+../../../../../src/bd/ipshared/ec67/hdl" "+incdir+../../../../../src/bd/ipshared/5bb9/hdl/verilog" "+incdir+../../../../../src/bd/ipshared/70fd/hdl" "+incdir+/esat/micas-data/software/xilinx_vivado_2018.2/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../../src/bd/ipshared/ec67/hdl" "+incdir+../../../../../src/bd/ipshared/5bb9/hdl/verilog" "+incdir+../../../../../src/bd/ipshared/70fd/hdl" "+incdir+/esat/micas-data/software/xilinx_vivado_2018.2/Vivado/2018.2/data/xilinx_vip/include" \
"../../../../../src/bd/ipshared/7aff/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_2 -93 \
"../../../../../src/bd/ipshared/7aff/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_2  -v2k5 "+incdir+../../../../../src/bd/ipshared/ec67/hdl" "+incdir+../../../../../src/bd/ipshared/5bb9/hdl/verilog" "+incdir+../../../../../src/bd/ipshared/70fd/hdl" "+incdir+/esat/micas-data/software/xilinx_vivado_2018.2/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../../src/bd/ipshared/ec67/hdl" "+incdir+../../../../../src/bd/ipshared/5bb9/hdl/verilog" "+incdir+../../../../../src/bd/ipshared/70fd/hdl" "+incdir+/esat/micas-data/software/xilinx_vivado_2018.2/Vivado/2018.2/data/xilinx_vip/include" \
"../../../../../src/bd/ipshared/7aff/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work axi_data_fifo_v2_1_16  -v2k5 "+incdir+../../../../../src/bd/ipshared/ec67/hdl" "+incdir+../../../../../src/bd/ipshared/5bb9/hdl/verilog" "+incdir+../../../../../src/bd/ipshared/70fd/hdl" "+incdir+/esat/micas-data/software/xilinx_vivado_2018.2/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../../src/bd/ipshared/ec67/hdl" "+incdir+../../../../../src/bd/ipshared/5bb9/hdl/verilog" "+incdir+../../../../../src/bd/ipshared/70fd/hdl" "+incdir+/esat/micas-data/software/xilinx_vivado_2018.2/Vivado/2018.2/data/xilinx_vip/include" \
"../../../../../src/bd/ipshared/247d/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_crossbar_v2_1_18  -v2k5 "+incdir+../../../../../src/bd/ipshared/ec67/hdl" "+incdir+../../../../../src/bd/ipshared/5bb9/hdl/verilog" "+incdir+../../../../../src/bd/ipshared/70fd/hdl" "+incdir+/esat/micas-data/software/xilinx_vivado_2018.2/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../../src/bd/ipshared/ec67/hdl" "+incdir+../../../../../src/bd/ipshared/5bb9/hdl/verilog" "+incdir+../../../../../src/bd/ipshared/70fd/hdl" "+incdir+/esat/micas-data/software/xilinx_vivado_2018.2/Vivado/2018.2/data/xilinx_vip/include" \
"../../../../../src/bd/ipshared/15a3/hdl/axi_crossbar_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../../src/bd/ipshared/ec67/hdl" "+incdir+../../../../../src/bd/ipshared/5bb9/hdl/verilog" "+incdir+../../../../../src/bd/ipshared/70fd/hdl" "+incdir+/esat/micas-data/software/xilinx_vivado_2018.2/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../../src/bd/ipshared/ec67/hdl" "+incdir+../../../../../src/bd/ipshared/5bb9/hdl/verilog" "+incdir+../../../../../src/bd/ipshared/70fd/hdl" "+incdir+/esat/micas-data/software/xilinx_vivado_2018.2/Vivado/2018.2/data/xilinx_vip/include" \
"../../../../../src/bd/ip/drone_xbar_0/sim/drone_xbar_0.v" \
"../../../../../src/bd/sim/drone.v" \

vlog -work axi_protocol_converter_v2_1_17  -v2k5 "+incdir+../../../../../src/bd/ipshared/ec67/hdl" "+incdir+../../../../../src/bd/ipshared/5bb9/hdl/verilog" "+incdir+../../../../../src/bd/ipshared/70fd/hdl" "+incdir+/esat/micas-data/software/xilinx_vivado_2018.2/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../../src/bd/ipshared/ec67/hdl" "+incdir+../../../../../src/bd/ipshared/5bb9/hdl/verilog" "+incdir+../../../../../src/bd/ipshared/70fd/hdl" "+incdir+/esat/micas-data/software/xilinx_vivado_2018.2/Vivado/2018.2/data/xilinx_vip/include" \
"../../../../../src/bd/ipshared/ccfb/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../../src/bd/ipshared/ec67/hdl" "+incdir+../../../../../src/bd/ipshared/5bb9/hdl/verilog" "+incdir+../../../../../src/bd/ipshared/70fd/hdl" "+incdir+/esat/micas-data/software/xilinx_vivado_2018.2/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../../src/bd/ipshared/ec67/hdl" "+incdir+../../../../../src/bd/ipshared/5bb9/hdl/verilog" "+incdir+../../../../../src/bd/ipshared/70fd/hdl" "+incdir+/esat/micas-data/software/xilinx_vivado_2018.2/Vivado/2018.2/data/xilinx_vip/include" \
"../../../../../src/bd/ip/drone_auto_pc_8/sim/drone_auto_pc_8.v" \
"../../../../../src/bd/ip/drone_auto_pc_7/sim/drone_auto_pc_7.v" \
"../../../../../src/bd/ip/drone_auto_pc_6/sim/drone_auto_pc_6.v" \
"../../../../../src/bd/ip/drone_auto_pc_5/sim/drone_auto_pc_5.v" \
"../../../../../src/bd/ip/drone_auto_pc_4/sim/drone_auto_pc_4.v" \
"../../../../../src/bd/ip/drone_auto_pc_3/sim/drone_auto_pc_3.v" \
"../../../../../src/bd/ip/drone_auto_pc_2/sim/drone_auto_pc_2.v" \
"../../../../../src/bd/ip/drone_auto_pc_1/sim/drone_auto_pc_1.v" \
"../../../../../src/bd/ip/drone_auto_pc_0/sim/drone_auto_pc_0.v" \
"../../../../../src/bd/ip/drone_auto_pc_9/sim/drone_auto_pc_9.v" \

vlog -work xil_defaultlib \
"glbl.v"
