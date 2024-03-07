module MDRreg (clr, clk, enable, Mdatain, BusMuxOut, read, MDRout);
    input clr, clk, enable, read;
    input [31:0] Mdatain, BusMuxOut;
    output  wire [31:0] MDRout;
	
    wire [31:0] MDRin;
    mux2x1 MDMux (Mdatain, BusMuxOut, read, MDRin);
    edgetrigreg RegMDR (clr, clk, enable, MDRin, MDRout);
		
endmodule 