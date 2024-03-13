module booths_gate(
    input signed [31:0] multiplicand,
    input signed [31:0] multiplier,
    output signed [31:0] outLO,
    output signed [31:0] outHI
);

    reg [2:0] combination_bits [15:0];                
    reg signed [32:0] partial_products [15:0];         
    reg signed [63:0] shifted_partial_products [15:0];
    reg signed [31:0] sum_of_partial_products_low;   
    reg signed [31:0] sum_of_partial_products_high;  
    wire signed [32:0] neg_operand_x;
    
    integer i;

    assign neg_operand_x = -multiplicand;

    always @ (multiplicand or multiplier or neg_operand_x) begin
        combination_bits[0] = {multiplier[1], multiplier[0], 1'b0};
        
        for(i=1; i<16; i=i+1) begin
             combination_bits[i] = {multiplier[2*i+1], multiplier[2*i], multiplier[2*i-1]};
        end

        for(i=0; i<16; i=i+1) begin 
            case(combination_bits[i])
                3'b001, 3'b010 : partial_products[i] = {multiplicand[31], multiplicand};
                3'b011 : partial_products[i] = {multiplicand, 1'b0};
                3'b100 : partial_products[i] = {neg_operand_x[31:0], 1'b0};
                3'b101, 3'b110 : partial_products[i] = neg_operand_x;
                default : partial_products[i] = 0;
            endcase
            
            shifted_partial_products[i] = partial_products[i] << (2*i);
        end

        sum_of_partial_products_low = shifted_partial_products[0][31:0];  
        sum_of_partial_products_high = shifted_partial_products[0][63:32]; 
        
        for(i=1; i<16; i=i+1) begin 
            sum_of_partial_products_low = sum_of_partial_products_low + shifted_partial_products[i][31:0];
            sum_of_partial_products_high = sum_of_partial_products_high + shifted_partial_products[i][63:32];
        end
    end
    assign outLO = sum_of_partial_products_low;
    assign outHI = sum_of_partial_products_high;

endmodule 