//32:5 select encoder
module BusMuxEncoder( 
input wire [31:0] DataIn, //register outs
output wire [4:0] select
);
reg [4:0] Code;
always @(*) begin
	casex(DataIn)
		32'h00000001	:	Code <= 5'd0;
		32'h00000002	:Code <= 5'd1;
		32'h00000004	:Code <= 5'd2;
		32'h00000008	:Code <= 5'd3;
		32'h00000010	:Code <= 5'd4;
		32'h00000020	:Code <= 5'd5;
		32'h00000040	:	Code <= 5'd6;
		32'h00000080	:	Code <= 5'd7;
		32'h00000100	:Code <= 5'd8;
		32'h00000200	:Code <= 5'd9;
		32'h00000400	:Code <= 5'd10;
		32'h00000800	:Code <= 5'd11;
		32'h00001000	:Code <= 5'd12;
		32'h00002000	:Code <= 5'd13;
		32'h00004000	:Code <= 5'd14;
		32'h00008000	:Code <= 5'd15;
		32'h00010000	:Code <= 5'd16;
		32'h00020000	:Code <= 5'd17;
		32'h00040000	:Code <= 5'd18;
		32'h00080000	:Code <= 5'd19;
		32'h00100000	:Code <= 5'd20;
		32'h00200000	:Code <= 5'd21;
		32'h00400000	:Code <= 5'd22;
		32'h00800000	:Code <= 5'd23;
		32'h01000000	:Code <= 5'd24;
		32'h02000000	:Code <= 5'd25;
		32'h04000000	:Code <= 5'd26;
		
		default:	Code <= 5'd32;
		endcase
	end
	assign select = Code;
endmodule
		
		
		