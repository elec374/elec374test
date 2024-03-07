module datapath(
	input wire clock, clear,
	input wire [31:0] Mdatain, Z,
	input wire HIin, LOin, PCin, Zin, Yin, IRin, MARin, MDRin, Read, IncPC, Csignextendedin, R0in, R1in, R2in, R3in, R4in, R5in, R6in, R7in, R8in, R9in, R10in, R11in, R12in, R13in, R14in, R15in 
);
wire HIout, LOout, PCout, Zhighout, Zlowout, MDRout;
wire [15:0] R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, R9out, R10out, R11out, R12out, R13out, R14out, R15out;
wire [31:0] BusMuxOut, BusMuxInCsignextended, BusMuxInHI, BusMuxInLO, BusMuxInZ, BusMuxInZlow, BusMuxInZhigh, BusMuxInPC, BusMuxInMDR, BusMuxInMAR, BusMuxInMdata, BusMuxInR0, BusMuxInR1, BusMuxInR2, BusMuxInR3, BusMuxInR4, BusMuxInR5, BusMuxInR6, BusMuxInR7, BusMuxInR8, BusMuxInR9, BusMuxInR10, BusMuxInR11, BusMuxInR12, BusMuxInR13, BusMuxInR14, BusMuxInR15,BusMuxInIR;
wire [4:0] BusMuxSelect;
wire [31:0] MuxToMDR;
edgetrigreg R0(clear, clock, R0in, BusMuxOut, BusMuxInR0);
edgetrigreg R1(clear, clock, R1in, BusMuxOut, BusMuxInR1);
edgetrigreg R2(clear, clock, R2in, BusMuxOut, BusMuxInR2);
edgetrigreg R3(clear, clock, R3in, BusMuxOut, BusMuxInR3);
edgetrigreg R4(clear, clock, R4in, BusMuxOut, BusMuxInR4);
edgetrigreg R5(clear, clock, R5in, BusMuxOut, BusMuxInR5);
edgetrigreg R6(clear, clock, R6in, BusMuxOut, BusMuxInR6);
edgetrigreg R7(clear, clock, R7in, BusMuxOut, BusMuxInR7);
edgetrigreg R8(clear, clock, R8in, BusMuxOut, BusMuxInR8);
edgetrigreg R9(clear, clock, R9in, BusMuxOut, BusMuxInR9);
edgetrigreg R10(clear, clock, R10in, BusMuxOut, BusMuxInR10);
edgetrigreg R11(clear, clock, R11in, BusMuxOut, BusMuxInR11);
edgetrigreg R12(clear, clock, R12in, BusMuxOut, BusMuxInR12);
edgetrigreg R13(clear, clock, R13in, BusMuxOut, BusMuxInR13);
edgetrigreg R14(clear, clock, R14in, BusMuxOut, BusMuxInR14);
edgetrigreg R15(clear, clock, R15in, BusMuxOut, BusMuxInR15);
edgetrigreg IR(clear, clock, IRin, BusMuxOut, BusMuxInIR);
edgetrigreg HI(clear, clock, HIin, BusMuxOut, BusMuxInHI);
edgetrigreg LO(clear, clock, LOin, BusMuxOut, BusMuxInLO);
edgetrigreg Zlow(clear, clock, Zlowin, BusMuxOut, BusMuxInZlow);
edgetrigreg Zhigh(clear, clock, Zhighin, BusMuxOut, BusMuxInZhigh);
edgetrigreg PC(clear, clock, PCin, BusMuxOut, BusMuxInPC);
edgetrigreg MDR(clear, clock, MDRin, MUXtoMDR, BusMuxInMDR);
edgetrigreg MAR(clear, clock, MARin, BusMuxOut, BusMuxInMAR);
edgetrigreg Mdata(clear, clock, Mdatain, BusMuxOut, BusMuxInMdata);
edgetrigreg Csignextended(clear, clock, Csignextendedin, BusMuxOut, BusMuxInCsignextended);

//think this works

MDMux mdm(BusMuxOut, Mdatain, Read, MUXtoMDR);
bidirectional_bus bus(BusMuxSelect, BusMuxInR0,BusMuxInR1,BusMuxInR2,BusMuxInR3,BusMuxInR4,BusMuxInR5,BusMuxInR6,BusMuxInR7,BusMuxInR8,BusMuxInR9,BusMuxInR10,BusMuxInR11,BusMuxInR12,BusMuxInR13,BusMuxInR14,BusMuxInR15,BusMuxInHI,BusMuxInLO,BusMuxInZlow,BusMuxInZhigh,BusMuxInPC,BusMuxInMDR, BusMuxInCsignextended, BusMuxInIR, BusMuxOut);
BusMuxEncoder bme({HIout, LOout, PCout, Zhighout, Zlowout, MDRout, rOut}, BusMuxSelect);
ALU alu(IRin, BusMuxOut, BusMuxOut, Z);
endmodule 