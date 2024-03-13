module div(
    input wire [31:0] dividend,
    input wire [31:0] divisor,
	 output wire [31:0] quotient,
    output wire [31:0] remainder
);

reg [31:0] Q,M,R,temp;

integer i;

assign quotient = Q;
assign remainder = R;

always @(dividend or divisor)
begin
    R = 32'd0;
    Q = dividend;
    M = divisor;

    for(i=0; i<32; i= i + 1)begin
        R={R[30:0],Q[31]}; 
        temp = R - M; 

        if(temp[31] == 1)begin
            Q = {Q[30:0],1'b0};
        end
        else begin
            Q = {Q[30:0],1'b1};
            R = temp; 
        end
    end
end
endmodule 