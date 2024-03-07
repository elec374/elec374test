module ALU (
    input wire [3:0] opcode,          // 4-bit opcode to select operation
	 input wire exec,
    input wire [31:0] operand_A,      // First input operand
    input wire [31:0] operand_B,      // Second input operand
    output wire [31:0] result,          // Output result
	 output wire [31:0] HI
);

// Parameter definitions for opcode
parameter ADD = 4'b0000;
parameter SUB = 4'b0001;
parameter AND = 4'b0010;
parameter OR  = 4'b0011;
parameter NEG  = 4'b0100;
parameter NOT  = 4'b0101;
parameter SHR  = 4'b0110;
parameter SHRA  = 4'b0111;
parameter SHL  = 4'b1000;
parameter ROR  = 4'b1001;
parameter ROL  = 4'b1010;
parameter MUL  = 4'b1011;
parameter DIV  = 4'b1100;


wire [31:0] add_result, sub_result, and_result, or_result, neg_result, not_result, shr_result, shra_result, shl_result, ror_result, rol_result, mul_result, div_result,rem_result;
and_gate AG(.A(operand_A), .B(operand_B), .C(and_result));
or_gate OG(.A(operand_A), .B(operand_B), .C(or_result));
not_gate NG(.A(operand_A) );
rotright_gate ROTRG(.A(operand_A), .C(ror_result));
rotleft_gate ROTLG(.A(operand_A), .C(rol_result));
shl_gate SHLG(.A(operand_A), .C(shl_result));
sra_gate SHRAG(.A(operand_A), .C(shra_result));
srl_gate SHRG(.A(operand_A),.C(shr_result));
neg_gate NEGG(.A(operand_A), .C(neg_result));
div DIVG(.dividend(operand_A),.divisor(operand_B),.quotient(div_result), .remainder(rem_result));
reg [31:0] operation_resultLO, operation_resultHI;
always @(*) begin
    if (exec) begin
        casex (opcode)
            //ADD: operation_result = 
            //SUB: operation_result = 
            AND: operation_resultLO = and_result;
            OR:  operation_resultLO = or_result;
				NEG: operation_resultLO = neg_result;
				NOT: operation_resultLO = not_result;
				SHR: operation_resultLO = shr_result;
				SHRA: operation_resultLO = shra_result;
				SHL: operation_resultLO = shl_result;
				ROR: operation_resultLO = ror_result;
				ROL: operation_resultLO = rol_result;
				//MUL: operation_result = 
				DIV:begin
				operation_resultLO = div_result;
				operation_resultHI = rem_result;
				end
            default: operation_resultLO = 32'b0; 
        endcase
    end
end

assign result = operation_resultLO;
assign HI = operation_resultHI;

endmodule 

