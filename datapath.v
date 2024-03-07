module datapath(

	input clear, clock, 
	input [31:0] Mdatain,
	input PCin, IRin, Yin, HIin, LOin, MDRin, ZHIin, ZLOin, Read, AND,
	input wire R0in, R1in, R2in, R3in, R4in, R5in, R6in, R7in, R8in, R9in, R10in, R11in, R12in, R13in, R14in, R15in,
	
	input HIout, LOout, ZHighout, Zlowout, PCout, MDRout, InPortout, Cout,
	input R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, R9out, R10out, R11out, R12out, R13out, R14out, R15out
	);

wire [31:0] BusMuxInR0, BusMuxInR1, BusMuxInR2, BusMuxInR3, BusMuxInR4, BusMuxInR5, BusMuxInR6, BusMuxInR7, BusMuxInR8, BusMuxInR9, BusMuxInR10, BusMuxInR11, BusMuxInR12, BusMuxInR13, BusMuxInR14, BusMuxInR15;
wire [31:0] BusMuxInPC, BusMuxInIR, BusMuxInY, BusMuxInHI, BusMuxInLO, BusMuxInZHI, BusMuxInZLO, BusMuxInMDR, BusMuxInPort, BusMuxInCsignextended;
wire [5:0] BusMuxSelect;
wire [31:0] BusMuxOut;
wire [63:0] alu_out;

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

edgetrigreg PC(clear, clock, PCin, BusMuxOut, BusMuxInPC);
edgetrigreg IR(clear, clock, IRin, BusMuxOut, BusMuxInIR);
edgetrigreg Y(clear, clock, Yin, BusMuxOut, BusMuxInY);
edgetrigreg HI(clear, clock, HIin, BusMuxOut, BusMuxInHI);
edgetrigreg LO(clear, clock, LOin, BusMuxOut, BusMuxInLO);

edgetrigreg ZHI(clear, clock, ZHIin, alu_out[63:32], BusMuxInZHI);
edgetrigreg ZLO(clear, clock, ZLOin, alu_out[31:0], BusMuxInZLO);

MDRreg MDR(clear, clock, MDRin, Mdatain, BusMuxOut, Read, BusMuxInMDR);

BusMuxEncoder bme({Yout,IRout,Cout, InPortout, MDRout, PCout, Zlowout, ZHighout, LOout, HIout, R15out, R14out, R13out, R12out, R11out, R10out, R9out, R8out, R7out, R6out, R5out, R4out, R3out, R2out, R1out,R0out}, BusMuxSelect);


ALU alu(BusMuxInIR, AND, BusMuxInY, BusMuxOut, alu_out);
bidirectional_bus bus(BusMuxSelect, BusMuxInR0, BusMuxInR1,  BusMuxInR2, BusMuxInR3, BusMuxInR4, BusMuxInR5, BusMuxInR6, BusMuxInR7, BusMuxInR8, BusMuxInR9, BusMuxInR10, BusMuxInR11, BusMuxInR12, BusMuxInR13, BusMuxInR14, BusMuxInR15, BusMuxInHI, BusMuxInLO, BusMuxInZHI, BusMuxInZLO, BusMuxInPC, BusMuxInMDR, BusMuxInPort, BusMuxInCsignextended,BusMuxInIR,BusMuxInY, BusMuxOut);



endmodule 