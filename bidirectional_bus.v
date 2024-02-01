module bidirectional_bus (
	//Mux
	input [31:0]BusMuxInRZ, input [31:0]BusMuxInRA, input [31:0]BusMuxInRB,
	//Encoder
	input RZout, RAout, RBout, 

	output wire [31:0]BusMuxOut
);

reg [31:0]q;

always @ (*) begin
	if(R0out) q = BusMuxInR0;
	if(R1out) q = BusMuxInR1;
	if(R2out) q = BusMuxInR2;
	if(R3out) q = BusMuxInR3;
	if(R4out) q = BusMuxInR4;
	if(R5out) q = BusMuxInR5;
	if(R6out) q = BusMuxInR6;
	if(R7out) q = BusMuxInR7;
	if(R8out) q = BusMuxInR8;
	if(R9out) q = BusMuxInR9;
	if(R10out) q = BusMuxInR10;
	if(R11out) q = BusMuxInR11;
	if(R12out) q = BusMuxInR12;
	if(R13out) q = BusMuxInR13;
	if(R14out) q = BusMuxInR14;
	if(R15out) q = BusMuxInR15;
end
assign BusMuxOut = q;
endmodule 