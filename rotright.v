module and_gate(
	input wire [31:0] A, 
	output wire [31:0] C
);

  assign C = {A[0], A[31:1]};
endmodule
