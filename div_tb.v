`timescale 1ns/10ps
module div_tb;

reg Zlowout, ZHighout, MDRout, R4out, R5out,MARin, IncPc, Zin, PCin;
reg MDRin, Yin, PCout, IRin;
reg Read, AND,  R4in, R5in;
reg LOin, HIin;
reg clock;
reg [31:0] Mdatain;
reg clear;
 
parameter Default = 4'b0000, Reg_load1a = 4'b0001, Reg_load1b = 4'b0010, Reg_load2a = 4'b0011,
 Reg_load2b = 4'b0100, Reg_load3a = 4'b0101, Reg_load3b = 4'b0110, T0 = 4'b0111,
 T1 = 4'b1000, T2 = 4'b1001, T3 = 4'b1010, T4 = 4'b1011, T5 = 4'b1100, T6 = 4'b1101;

reg [3:0] Present_state = Default;
 
datapath DUT(.PCout(PCout), .Zlowout(Zlowout), .MDRout(MDRout), .R4out(R4out), 
.R5out(R5out), .MDRin(MDRin), .Yin(Yin), .Read(Read), .R1in(R1in), .R4in(R4in), 
.R5in(R5in), .clock(clock), .Mdatain(Mdatain), .clear(clear), .IRin(IRin), .AND(AND), .ZHighout(ZHighout), .LOin(LOin), .HIin(HIin));

initial
	begin
		clock = 0;
		clear = 0;
	forever #10 clock = ~ clock;
end

always @(posedge clock) 
	begin
		case (Present_state)
			Default : Present_state = Reg_load1a;
			Reg_load1a : Present_state = Reg_load1b;
			Reg_load1b : Present_state = Reg_load2a;
			Reg_load2a : Present_state = Reg_load2b;
			Reg_load2b : Present_state = Reg_load3a;
			Reg_load3a : Present_state = Reg_load3b;
			Reg_load3b : Present_state = T0;
			T0 : Present_state = T1;
			T1 : Present_state = T2;
			T2 : Present_state = T3;
			T3 : Present_state = T4;
			T4 : Present_state = T5;
			T5 : Present_state = T6;

		endcase
	end

	
always @(Present_state) // do the required job in each state
	begin
		case (Present_state) // assert the required signals in each clock cycle
				Default: begin
				PCout <= 0; Zlowout <= 0; ZHighout <= 0; MDRout <= 0; // initialize the signals
				R4out <= 0; R5out <= 0;
				IRin <=0;
				MDRin <= 0; Yin <= 0;
				Read <= 0; AND <= 0;
				R4in <= 0; R5in <= 0; Mdatain <= 32'h00000000;
				HIin <=0; LOin <=0;
				MARin <= 0; IncPc<=0; Zin<=0; PCin<=0;

		end
				Reg_load1a: begin
				Mdatain <= 32'h00000012;
				Read = 0; MDRin = 0; // the first zero is there for completeness
				Read <= 1; MDRin <= 1; // and the first 10ns might not be needed depending on your
				#20 Read <= 0; MDRin <= 0; 
		end
				Reg_load1b: begin
				Mdatain <= 32'h00000002;
				MDRout <= 1; R4in <= 1;
				#20 MDRout <= 0; R4in <= 0; // initialize R4 with the value $12
		end
				Reg_load2a: begin
				Mdatain <= 32'h00000004;
				Read <= 1; MDRin <= 1;
				#20 Read <= 0; MDRin <= 0;
		end
				Reg_load2b: begin
				MDRout <= 1; R5in <= 1;
				#20 MDRout <= 0; R5in <= 0; // initialize R5 with the value $14
		end
				Reg_load3a: begin
				Mdatain <= 32'h00000018;
				Read <= 1; MDRin <= 1;
				#20 Read <= 0; MDRin <= 0;
		end
				T0: begin 
				PCout <= 1; IncPc<= 1; Zin<= 1; MARin<= 1;
		end
				T1: begin
				PCout <= 0; IncPc<= 0; Zin<= 0; MARin<= 0;
				Zlowout <= 1; Read <= 1; MDRin <= 1;
				Mdatain <= 32'b1100; // opcode for “div R4, R5”
		end
				T2: begin
				Zlowout <= 0; Read <= 0; MDRin <= 0;
				MDRout <= 1; IRin <= 1;
		end
				T3: begin
				MDRout <= 0; IRin <=0;
				R4out <= 1; Yin <= 1;
		end
				T4: begin
				R4out <= 0; Yin <= 0;
				R5out <= 1; 
				#10 AND <= 1;
		end
				T5: begin
				R5out <= 0; AND <= 0; 
				Zlowout <= 1; LOin <= 1; 
				
		end
				T6: begin
				ZHighout <= 1; HIin <= 1;
				Zlowout<= 0; LOin <=0;
				#10 ZHighout <= 1; HIin <= 1;
				end
		endcase
	end
endmodule 	