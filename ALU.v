module ALU (
    input wire [3:0] opcode,          // 4-bit opcode to select operation
    input wire [31:0] operand_A,      // First input operand
    input wire [31:0] operand_B,      // Second input operand
    output reg [31:0] result          // Output result
);

// Parameter definitions for opcode
parameter ADD = 4'b0000;
parameter SUB = 4'b0001;
parameter AND = 4'b0010;
parameter OR  = 4'b0011;
parameter XOR = 4'b0100;

always @(*)
begin
    case (opcode)
        ADD: result = operand_A + operand_B;
        SUB: result = operand_A - operand_B;
        AND: result = operand_A & operand_B;
        OR : result = operand_A | operand_B;
        XOR: result = operand_A ^ operand_B;
        default: result = 32'b0; // Default to 0 for unknown opcodes
    endcase
end

endmodule
