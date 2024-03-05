//32:5 select encoder
module BusMuxEncoder( 
input wire [31:0] DataIn, //register outs
output wire [5:0] select
);
reg [5:0] Code;
always @(*) begin
	casex(DataIn)
		32'h00000001	:	Code <= 6'd0;
		32'h00000002	:  Code <= 6'd1;
		32'h00000004	:  Code <= 6'd2;
		32'h00000008	:  Code <= 6'd3;
		32'h00000010	:  Code <= 6'd4;
		32'h00000020	:  Code <= 6'd5;
		32'h00000040	:	Code <= 6'd6;
		32'h00000080	:	Code <= 6'd7;
		32'h00000100	:  Code <= 6'd8;
		32'h00000200	:  Code <= 6'd9;
		32'h00000400	:  Code <= 6'd10;
		32'h00000800	:  Code <= 6'd11;
		32'h00001000	:  Code <= 6'd12;
		32'h00002000	:  Code <= 6'd13;
		32'h00004000	:  Code <= 6'd14;
		32'h00008000	:  Code <= 6'd15;
		
		32'h00010000	:  Code <= 6'd16;
		32'h00020000	:  Code <= 6'd17;
		32'h00040000	:  Code <= 6'd18;
		32'h00080000	:  Code <= 6'd19;
		32'h00100000	:  Code <= 6'd20;
		32'h00200000	:  Code <= 6'd21;
		32'h00400000	:  Code <= 6'd22;
		32'h00800000	:  Code <= 6'd23;
		
		default			:	Code <= 6'd31;
		endcase
	end
	assign select = Code;
endmodule