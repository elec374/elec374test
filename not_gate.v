module not_gate(
	input wire [31:0] A, 
	output wire [31:0] notA
)

assign notA = ~A;
endmodule