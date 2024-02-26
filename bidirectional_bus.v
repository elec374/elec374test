module bidirectional_bus (
	//Mux
	input wire[4:0] BusMuxSelect,
	//Encoder
	input [31:0] BusMuxInR0, BusMuxInR1,  BusMuxInR2, BusMuxInR3, BusMuxInR4, BusMuxInR5, BusMuxInR6, 
	BusMuxInR7, BusMuxInR8,BusMuxInR9, BusMuxInR10, BusMuxInR11, BusMuxInR12,BusMuxInR13, BusMuxInR14,BusMuxInR15,
	BusMuxInHI,BusMuxInLO, BusMuxInZlow, BusMuxInZhigh,BusMuxInPc, BusMuxInMDR, BusMuxInCsignextended, BusMuxInIR, BusMuxInCout,

	output wire [31:0]BusMuxOut
);

reg [31:0]q;

always @ (*) begin
	case(BusMuxSelect)
		5'd0	:	q <= BusMuxInR0;
		5'd1	:	q <= BusMuxInR1;
		5'd2	:	q <= BusMuxInR2;
		5'd3	:	q <= BusMuxInR3;
		5'd4	:	q <= BusMuxInR4;
		5'd5	:	q <= BusMuxInR5;
		5'd6	:	q <= BusMuxInR6;
		5'd7	:	q <= BusMuxInR7;
		5'd8	:	q <= BusMuxInR8;
		5'd9	:	q <= BusMuxInR9;
		5'd10	:	q <= BusMuxInR10;
		5'd11	:	q <= BusMuxInR11;
		5'd12	:	q <= BusMuxInR12;
		5'd13	:	q <= BusMuxInR13;
		5'd14	:	q <= BusMuxInR14;
		5'd15	:	q <= BusMuxInR15;
		5'd16	:	q <= BusMuxInHI;
		5'd17	:	q <= BusMuxInLO;
		5'd18	:	q <= BusMuxInZlow;
		5'd19	:	q <= BusMuxInZhigh;
		5'd20	:	q <= BusMuxInPc;
		5'd21	:	q <= BusMuxInMDR;
		5'd23	:	q <= BusMuxInCsignextended;
		5'd24	: 	q <= BusMuxInIR;		
		5'd32 : 	q <= 32'hF;
		default	:	q <= 32'd0;
		endcase
end
assign BusMuxOut = q;
endmodule 