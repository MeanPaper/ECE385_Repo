module ripple_adder
(
	input  [15:0] A, B,
	input         cin,
	output [15:0] S,
	output logic cout
);

    /* TODO
     *
     * Insert code here to implement a ripple adder.
     * Your code should be completly combinational (don't use always_ff or always_latch).
     * Feel free to create sub-modules or other files. */
	  
	  logic co1, co2, co3;
	  
	  
	  //4*4 CRA unit
	  four_bit_adder	CRA0(.A(A[3:0]), .B(B[3:0]), .C_in(cin), .S(S[3:0]), .C_out(co1));
	  four_bit_adder	CRA1(.A(A[7:4]), .B(B[7:4]), .C_in(co1), .S(S[7:4]), .C_out(co2));
	  four_bit_adder	CRA2(.A(A[11:8]), .B(B[11:8]), .C_in(co2), .S(S[11:8]), .C_out(co3));
	  four_bit_adder	CRA3(.A(A[15:12]), .B(B[15:12]), .C_in(co3), .S(S[15:12]), .C_out(cout));


endmodule


//create an full adder
module full_adder(
	input 		a,b,
	input			c,
	output 		logic s,
	output 		logic c_out
);

	always_comb
	begin
	
			//logic for the full adder
			s = a ^ b ^ c;
			c_out = (a & b)|(b & c)|(a & c);
		
	end
	


endmodule


//4 bit carry ripple adder
module four_bit_adder(
	input 		[3:0]A,
	input			[3:0]B,
	input			C_in,
	output 		[3:0]S,
	output		logic C_out
);

	logic c1, c2, c3;
	
	//chain 4 1-bit full adder together
	full_adder	FA0(.a(A[0]), .b(B[0]), .c(C_in), .s(S[0]), .c_out(c1));
	full_adder	FA1(.a(A[1]), .b(B[1]), .c(c1), .s(S[1]), .c_out(c2));
	full_adder	FA2(.a(A[2]), .b(B[2]), .c(c2), .s(S[2]), .c_out(c3));
	full_adder	FA3(.a(A[3]), .b(B[3]), .c(c3), .s(S[3]), .c_out(C_out));

	

endmodule

