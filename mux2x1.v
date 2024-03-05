//2 - 1 multiplexer 
//S - Select | D0,D1 - Input
module mux2x1(
	input [31:0] Mdatain, BusMuxOut, 
	input read, 
	output reg [31:0] MDRin
);

always @* begin
    if (!read) begin
        MDRin = Mdatain;
    end
    else begin
        MDRin = BusMuxOut;
    end
end

endmodule 