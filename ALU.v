module ALU (
    input wire [3:0] opcode,          // 4-bit opcode to select operation
	 input wire exec,
    input wire [31:0] operand_A,      // First input operand
    input wire [31:0] operand_B,      // Second input operand
    output wire [31:0] result          // Output result
);

// Parameter definitions for opcode
parameter ADD = 4'b0000;
parameter SUB = 4'b0001;
parameter AND = 4'b0010;
parameter OR  = 4'b0011;
parameter XOR = 4'b0100;

reg [31:0] temp_result;

always @(*) begin
    if (exec) begin
        temp_result = ((opcode == ADD) ? operand_A + operand_B :
                       (opcode == SUB) ? operand_A - operand_B :
                       (opcode == AND) ? operand_A & operand_B :
                       (opcode == OR)  ? operand_A | operand_B :
                       (opcode == XOR) ? operand_A ^ operand_B :
                       32'b0);
    end 
end

assign result = temp_result;
endmodule 