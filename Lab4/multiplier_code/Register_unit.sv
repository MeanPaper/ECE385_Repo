module register_unit (input  logic Clk, Reset, A_In, Ld_A, Ld_B, 
                            Shift_En,
                      input  logic [7:0]  D, 
                      output logic A_out, B_out, 
                      output logic [7:0]  A,
                      output logic [7:0]  B);
	

    reg_8  reg_A (.*, .Shift_In(A_In), .Load(Ld_A),
	               .Shift_Out(A_out), .Data_Out(A));
						
	// connect the B shift_in to the A_out which is the last bit.
    reg_8  reg_B (.*, .Shift_In(A_out), .Load(Ld_B),
	               .Shift_Out(B_out), .Data_Out(B));

endmodule
