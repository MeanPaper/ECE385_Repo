transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/ldm18/Desktop/385_FPGA_project/385_lab3_adder_code {C:/Users/ldm18/Desktop/385_FPGA_project/385_lab3_adder_code/select_adder.sv}
vlog -sv -work work +incdir+C:/Users/ldm18/Desktop/385_FPGA_project/385_lab3_adder_code {C:/Users/ldm18/Desktop/385_FPGA_project/385_lab3_adder_code/router.sv}
vlog -sv -work work +incdir+C:/Users/ldm18/Desktop/385_FPGA_project/385_lab3_adder_code {C:/Users/ldm18/Desktop/385_FPGA_project/385_lab3_adder_code/ripple_adder.sv}
vlog -sv -work work +incdir+C:/Users/ldm18/Desktop/385_FPGA_project/385_lab3_adder_code {C:/Users/ldm18/Desktop/385_FPGA_project/385_lab3_adder_code/reg_17.sv}
vlog -sv -work work +incdir+C:/Users/ldm18/Desktop/385_FPGA_project/385_lab3_adder_code {C:/Users/ldm18/Desktop/385_FPGA_project/385_lab3_adder_code/HexDriver.sv}
vlog -sv -work work +incdir+C:/Users/ldm18/Desktop/385_FPGA_project/385_lab3_adder_code {C:/Users/ldm18/Desktop/385_FPGA_project/385_lab3_adder_code/control.sv}
vlog -sv -work work +incdir+C:/Users/ldm18/Desktop/385_FPGA_project/385_lab3_adder_code {C:/Users/ldm18/Desktop/385_FPGA_project/385_lab3_adder_code/adder2.sv}

vlog -sv -work work +incdir+C:/Users/ldm18/Desktop/385_FPGA_project/lab_3/../385_lab3_adder_code {C:/Users/ldm18/Desktop/385_FPGA_project/lab_3/../385_lab3_adder_code/testbench_adders.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L rtl_work -L work -voptargs="+acc"  testbench_adders

add wave *
view structure
view signals
run 700 ns
