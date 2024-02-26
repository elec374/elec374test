module srl(
	input wire [31:0] A, 
	output wire [31:0] C
);

assign C[31] = A[31];
assign C[30:0] = A[31:1];
endmodule
