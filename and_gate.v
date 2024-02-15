module and_gate(
	input wire [31:0] A, [31:0] B, 
	output wire [31:0] C
)

assign C = A & B;
endmodule