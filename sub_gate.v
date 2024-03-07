module sub_gate(
	input wire [31:0] A,
	input wire [31:0] B,
	output wire [31:0] Result
);
	wire [31:0] negB;
	
	neg_gate neg1(.A(B), .C(negB));
	ripplecarryaddr add1(.A(A), .B(negB), .Result(Result));
endmodule 