module Preescalador_TB(
);
    reg clk;
    reg reset;
    reg [31:0] frec_de_trabajo; 
    wire timming;

    Preescalador DUT (
        .i_Clk(clk),
        .i_Rst(reset),
        .i_Frec_de_trabajo(frec_de_trabajo),
        .o_Timming(timming)
    );

    initial begin
        clk<=0;
        reset<=1;
        frec_de_trabajo<=8;
        #20 reset<=0;
    end

    always@(clk) begin
        #5 clk <= ~clk;
    end

endmodule