module mux2x1(
	input [31:0] Mdatain, BusMuxOut, 
	input read, 
	output reg [31:0] MDRin
);

always @* begin
    if (!read) begin
        MDRin = BusMuxOut;
    end
    else begin
        MDRin = Mdatain;
    end
end

endmodule 