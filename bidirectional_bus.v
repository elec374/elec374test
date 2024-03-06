module bidirectional_bus (
	input wire[5:0] BusMuxSelect,

	input [31:0] BusMuxInR0, BusMuxInR1,  BusMuxInR2, BusMuxInR3, BusMuxInR4, BusMuxInR5, BusMuxInR6, BusMuxInR7, BusMuxInR8,BusMuxInR9, BusMuxInR10, BusMuxInR11, BusMuxInR12,BusMuxInR13, BusMuxInR14,BusMuxInR15,
	
	input [31:0] BusMuxInHI, BusMuxInLO, BusMuxInZHI, BusMuxInZLO, BusMuxInPC, BusMuxInMDR, BusMuxInPort, BusMuxInCsignextended,

	output wire [31:0] BusMuxOut
);

reg [31:0] q;

always @ (*) begin
	case(BusMuxSelect)
		5'd0	:	q <= BusMuxInR0[31:0];
		5'd1	:	q <= BusMuxInR1[31:0];
		5'd2	:	q <= BusMuxInR2[31:0];
		5'd3	:	q <= BusMuxInR3[31:0];
		5'd4	:	q <= BusMuxInR4[31:0];
		5'd5	:	q <= BusMuxInR5[31:0];
		5'd6	:	q <= BusMuxInR6[31:0];
		5'd7	:	q <= BusMuxInR7[31:0];
		5'd8	:	q <= BusMuxInR8[31:0];
		5'd9	:	q <= BusMuxInR9[31:0];
		5'd10	:	q <= BusMuxInR10[31:0];
		5'd11	:	q <= BusMuxInR11[31:0];
		5'd12	:	q <= BusMuxInR12[31:0];
		5'd13	:	q <= BusMuxInR13[31:0];
		5'd14	:	q <= BusMuxInR14[31:0];
		5'd15	:	q <= BusMuxInR15[31:0];
		
		5'd16	:	q <= BusMuxInHI[31:0];
		5'd17	:	q <= BusMuxInLO[31:0];
		5'd18	:	q <= BusMuxInZHI[31:0];
		5'd19	:	q <= BusMuxInZLO[31:0];
		5'd20	:	q <= BusMuxInPC[31:0];
		5'd21	:	q <= BusMuxInMDR[31:0];
		5'd22	:	q <= BusMuxInPort[31:0];
		5'd23	: 	q <= BusMuxInCsignextended[31:0];
	endcase
end

assign BusMuxOut = q;

endmodule 