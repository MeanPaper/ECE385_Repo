module datapath( 	input logic Clk, Reset,
						input logic LD_MAR, LD_MDR, LD_IR, LD_BEN, LD_CC, LD_REG, LD_PC, LD_LED,
						input logic GatePC, GateMDR, GateALU, GateMARMUX,
						input logic [1:0] PCMUX, ADDR2MUX, ALUK,
						input logic DRMUX, SR1MUX, SR2MUX, ADDR1MUX, MARMUX,
						input logic MIO_EN,
						input logic [15:0]MDR_In,
						output logic BEN,
						output logic [9:0]LED,
						output logic [15:0]MAR, MDR, IR, PC	
					);

					
					
					//dl35 create the following block
//=================================================================
logic [15:0] PC_MUX_OUT; //output of PC mux

logic [15:0] PC_MUX_IN;
logic [15:0] PC_GATE_IN;	//the PC output to the gate	
assign PC_MUX_IN = PC_GATE_IN + 1; //self increment of PC
logic [15:0] MEM_MUX_OUT;	//the mux output before the MDR
logic [15:0] MDR_GATE_IN;	//MDR output before gate

logic [3:0] GATE_S;	
assign GATE_S = {GatePC, GateMDR, GateALU, GateMARMUX};



logic [15:0] BUS;
assign PC = PC_GATE_IN;




	reg_16	MAR_reg(	.Clk, 
							.Reset, 
							.Load(LD_MAR),
							.D(BUS),
							.Data_Out(MAR));

	reg_16	MDR_reg(	.Clk, 
							.Reset, 
							.Load(LD_MDR),
							.D(MEM_MUX_OUT),
							.Data_Out(MDR));
	
	reg_16	PC_reg(	.Clk, 
							.Reset, 
							.Load(LD_PC),
							.D(PC_MUX_OUT),  //output from the PC mux
							.Data_Out(PC_GATE_IN)); //output the data of pc reg and connects to gates
	
	reg_16 	IR_reg(	.Clk, 
							.Reset, 
							.Load(LD_IR),
							.D(BUS),
							.Data_Out(IR));
							
	mux2to1	MDR_mux(	.A(BUS), 	//select 0
							.B(MDR_In),			//select 1
							.select(MIO_EN),
							.out(MEM_MUX_OUT));
	
	
	mux4to1	PC_mux(.IN_0(PC_MUX_IN),
						 .IN_1(16'hxxxx), //change from 0s to don't care
						 .IN_2(16'hxxxx),
						 .IN_3(16'hxxxx),
						 .select(PCMUX),
						 .out(PC_MUX_OUT));
						 
						 
	gateMux 	gates(.GATE_0(PC_GATE_IN), //gatePC
						.GATE_1(MDR),	 		//gateMDR
						.GATE_2(16'hxxxx), 	//gateALU
						.GATE_3(16'hxxxx), 	//gateMarMUX
						.select(GATE_S),		//change from 0s to don't care
						.out(BUS));
//====================================================================	
	

endmodule 