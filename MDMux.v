module MDMux(
input [31:0] BusMuxOut, Mdatain,
input read
output reg [31:0] out
);

always @(*) begin
	case(read)
		0 : out <= BusMuxOut;
		1 : out <= Mdatain;
		default : out <= 32'bx;
		endcase
	end
endmodule 