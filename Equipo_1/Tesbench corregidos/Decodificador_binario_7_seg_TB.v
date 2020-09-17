module Deco_binario_7seg_TB(
);
    reg  [3:0] bits;
    wire [6:0] seg;

    Deco_binario_7seg DUT(
        .i_Bits(bits),
        .o_Segmentos(seg)
    );

    initial
    begin
        bits<=4'b0000;
    end
    always@(bits)begin
        bits<=4'b0001;
        #5
        bits<=4'b0010;
        #5
        bits<=4'b0011;
        #5
        bits<=4'b0100;
        #5
        bits<=4'b0101;
        #5
        bits<=4'b0110;
        #5
        bits<=4'b0111;
        #5
        bits<=4'b1000;
        #5
        bits<=4'b1001;
        #5
        bits<=4'b1010;
        #5
        bits<=4'b1011;
        #5
        bits<=4'b1100;
        #5
        bits<=4'b1101;
        #5
        bits<=4'b1110;
        #5
        bits<=4'b1111;
    end
endmodule
