module MDRreg(
	input [31:0] D,
	input clk,clr,enable,
	output [31:0] Q,
	reg[31:0] Q,
);

always @(posedge clk)
	begin
		if(clr)
			Q <= 0;
		else if(enable)
			Q <= D;
