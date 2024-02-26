`timescale 1ns/10ps

module and_tb;

    reg [31:0] operand_A;
    reg [31:0] operand_B;
    reg [31:0] result_dp; // Result from datapath AND gate
    reg [31:0] result_alu; // Result from ALU AND operation
    reg prev_Rz, clock;
    reg [3:0] state;

    wire [31:0] Rz;
    wire [31:0] alu_opcode;

    // Instantiate Datapath module
    datapath dut (
    .clock(clock),
    .clear(1'b0), 
    .Mdatain(32'h00000000), 
    .Z(result_alu),
    .HIin(32'h00000000),
    .LOin(32'h00000000),
    .PCin(32'h00000000),
    .Zin(1'b0),
    .Yin(1'b0),
    .IRin(32'h00000000),
    .MARin(32'h00000000),
    .MDRin(32'h00000000),
    .Read(1'b0),
    .IncPC(1'b0),
    .Csignextendedin(1'b0),
    .BusMuxInR1(operand_A), // Connect operand A to HI input
    .BusMuxInR2(operand_B), // Connect operand B to LO input
    .BusMuxSelect(),
    .MuxToMDR()
);


    // Instantiate ALU module
    ALU alu (
        .opcode(4'b0010), // Opcode for AND operation
        .operand_A(operand_A), // Connect operand A to ALU input A
        .operand_B(operand_B), // Connect operand B to ALU input B
        .result(result_alu) // Connect ALU result to result_alu
    );

    initial begin
        clock = 0;
        state = 4'b0000;
        operand_A = 32'h00000000;
        operand_B = 32'h00000000;
    end

    always #10 clock = ~clock;

    always @(negedge clock) state <= state + 1;

    always @(posedge clock) begin
        case(state)
            0: begin
                operand_A <= 32'h00000000;
                operand_B <= 32'h00000000;
            end
            1: begin
                operand_A <= 32'hffffffff;
                operand_B <= 32'hffffffff;
            end
            2: begin
                operand_A <= 32'h00000000;
                operand_B <= 32'hffffffff;
            end
            3: begin
                operand_A <= 32'hffffffff;
                operand_B <= 32'hffff0000;
            end
            4: begin
                operand_A <= 32'hffffffff;
                operand_B <= 32'h0000ffff;
            end
            default: begin
                operand_A <= 32'h00000000;
                operand_B <= 32'h00000000;
            end
        endcase
    end

endmodule
