module ALU (
    input wire [3:0] opcode,          // 4-bit opcode to select operation
	 input wire exec,
    input wire [31:0] operand_A,      // First input operand
    input wire [31:0] operand_B,      // Second input operand
    output wire [63:0] result          // Output result
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


wire [31:0] add_result, sub_result, and_result, or_result, neg_result, not_result, shr_result, shra_result, shl_result, ror_result, rol_result;
wire [63:0] mul_result;
wire [31:0] div_result;

and_gate AG(.A(operand_A), .B(operand_B), .C(and_result));
or_gate OG(.A(operand_A), .B(operand_B), .C(or_result));
not_gate NG(.A(operand_A) );
rotright_gate ROTRG(.A(operand_A), .C(ror_result));
rotleft_gate ROTLG(.A(operand_A), .C(rol_result));
shl_gate SHLG(.A(operand_A), .C(shl_result));
sra_gate SHRAG(.A(operand_A), .C(shra_result));
srl_gate SHRG(.A(operand_A),.C(shr_result));
neg_gate NEGG(.A(operand_A), .C(neg_result));
ripplecarryaddr ADDG(.A(operand_A), .B(operand_B), .Result(add_result));
booths_gate MULG(.multiplicand(operand_A), .multiplier(operand_B), .product(mul_result));

reg [63:0] operation_result;
always @(*) begin
    if (exec) begin
        casex (opcode)
            ADD: operation_result = {32'b0, add_result};
            //SUB: operation_result = {32'b0, sub_result};
            AND: operation_result = {32'b0, and_result};
            OR: operation_result = {32'b0, or_result};
            NEG: operation_result = {32'b0, neg_result};
            NOT: operation_result = {32'b0, not_result};
            SHR: operation_result = {32'b0, shr_result};
            SHRA: operation_result = {32'b0, shra_result};
            SHL: operation_result = {32'b0, shl_result};
            ROR: operation_result = {32'b0, ror_result};
            ROL: operation_result = {32'b0, rol_result};
            MUL: operation_result = mul_result;
            // DIV and other operations can be added here, following the same pattern

            default: operation_result = 64'b0; 
        endcase
    end
end

assign result = operation_result;

endmodule 