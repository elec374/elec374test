module datapath(
	input wire clock, clear,
	input wire [31:0] A,
	input wire [31:0] RegisterAImmediate,
	input wire RZout, RAout, RBout,
	input wire RAin, RBin, RZin
);

wire [31:0] BusMuxOut, BusMuxInRZ, BusMuxInRA, BusMuxInRB;
wire [31:0] Zregin;

edgetrigreg RA(clear, clock, RAin, RegisterAImmediate, BusMuxInRA);
edgetrigreg RB(clear, clock, RBin, BusMuxOut, BusMuxInRB);

ripplecarryaddr add(A, BusMuxOut, Zregin);
edgetrigreg RZ(clear, clock, RZin, Zregin, BusMuxInRZ);

bidirectional_bus bus(BusMuxInRZ, BusMuxInRA, BusMuxInRB, RZout, RAout, RBout, BusMuxOut);
endmodule 