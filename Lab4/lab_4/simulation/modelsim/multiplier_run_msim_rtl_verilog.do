transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/ldm18/Desktop/385_FPGA_project/multiplier_code {C:/Users/ldm18/Desktop/385_FPGA_project/multiplier_code/Synchronizers.sv}
vlog -sv -work work +incdir+C:/Users/ldm18/Desktop/385_FPGA_project/multiplier_code {C:/Users/ldm18/Desktop/385_FPGA_project/multiplier_code/Control.sv}
vlog -sv -work work +incdir+C:/Users/ldm18/Desktop/385_FPGA_project/multiplier_code {C:/Users/ldm18/Desktop/385_FPGA_project/multiplier_code/Reg_8.sv}
vlog -sv -work work +incdir+C:/Users/ldm18/Desktop/385_FPGA_project/multiplier_code {C:/Users/ldm18/Desktop/385_FPGA_project/multiplier_code/HexDriver.sv}
vlog -sv -work work +incdir+C:/Users/ldm18/Desktop/385_FPGA_project/multiplier_code {C:/Users/ldm18/Desktop/385_FPGA_project/multiplier_code/ripple_adder.sv}
vlog -sv -work work +incdir+C:/Users/ldm18/Desktop/385_FPGA_project/multiplier_code {C:/Users/ldm18/Desktop/385_FPGA_project/multiplier_code/Multiplier.sv}

vlog -sv -work work +incdir+C:/Users/ldm18/Desktop/385_FPGA_project/lab_4/../multiplier_code {C:/Users/ldm18/Desktop/385_FPGA_project/lab_4/../multiplier_code/testbench.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L rtl_work -L work -voptargs="+acc"  testbench

add wave *
view structure
view signals
run 2000 ns
