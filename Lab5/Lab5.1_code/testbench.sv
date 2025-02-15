module testbench();

timeunit 10ns;	// Half clock cycle at 50 MHz
			// This is the amount of time represented by #1 
timeprecision 1ns;

// These signals are internal because the processor will be 
// instantiated as a submodule in testbench.
logic Clk = 0;


logic Run, Continue;
//logic [9:0] LED;
//logic [6:0] HEX0, HEX1, HEX2, HEX3;
//logic [9:0] SW;
//logic [19:0] MAR_Out;
logic [15:0] MA;
logic [15:0] MD;
logic [15:0] PC;


// A counter to count the instances where simulation results
// do no match with expected results
integer ErrorCnt = 0;
		
// Instantiating the DUT
// Make sure the module and signal names match with those in your design

slc3_testtop test( .Clk, .Run, .Continue);
assign MA = test.slc.d0.MAR_reg.Data_Out; //get MAR data
assign MD = test.slc.d0.MDR_reg.Data_Out; //get MDR data
assign PC = test.slc.d0.PC_reg.Data_Out;	//get PC data


// Toggle the clock
// #1 means wait for a delay of 1 timeunit
always begin : CLOCK_GENERATION
#1 Clk = ~Clk;
end

initial begin: CLOCK_INITIALIZATION
    Clk = 0;
end 

// Testing begins here
// The initial block is not synthesizable
// Everything happens sequentially inside an initial block
// as in a software program



initial begin: TEST_VECTORS
Run = 1;
Continue = 1;

#2
Run = 0;
Continue = 0;

#2
Run = 1;
Continue = 1;

#4
Run = 0;

#2
Run = 1;

#20
Continue = 0;

#2
Continue = 1;










if (ErrorCnt == 0)
	$display("Success!");  // Command line output in ModelSim
else
	$display("%d error(s) detected. Try again!", ErrorCnt);
end
endmodule
