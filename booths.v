module booths_gate(
    input [31:0] multiplicand,
    input [31:0] multiplier,
    output [31:0] outLO,
	 output [31:0] outHI
);
    reg [63:0] m, q, acc, product;
    reg q_1;
    integer i;

    always @(multiplicand or multiplier) begin
        m = multiplicand;
        q = multiplier;
        acc = 0;
        q_1 = 0;

        for (i = 0; i < 32; i = i + 1) begin
            case ({q[0], q_1})
                2'b01: acc = acc + m;  // If 01, add M to A
                2'b10: acc = acc - m;  // If 10, subtract M from A
            endcase

            q_1 = q[0];
            q = {acc[0], q[31:1]};
            acc = {acc[63], acc[63:1]}; // Keep sign bit for arithmetic shift
        end
    end

    assign outHI = acc; // The final product is the combination of acc and q
	 assign outLO = q; // The final product is the combination of acc and q

endmodule 