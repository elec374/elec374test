module MDRUnit (
BusMuxOut, MDataIn, clear, clk, read, MDRin, D, Q
)

input [31:0] BusMuxOut, MDataIn, read, clk, clear;
wire D;
output Q;

mux2x1 MDMux(.D0(BusMuxOut), .D1(MDataIn), .S(read), .Y(D));

