module Preescalador_TB(
);
    reg clk;
    reg reset;
    wire clk_out;

    Preescalador DUT (
        .i_Clk(clk),
        .i_Rst(reset),
        .o_Presc(clk_out)
    );

    initial begin
        clk<=0;
        reset<=1;
        #20 reset<=0;
    end

    always@(clk) begin
        #5 clk <= ~clk;
    end

endmodule
