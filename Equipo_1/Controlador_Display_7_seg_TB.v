module Controlador_Display_7_seg_TB(
);
    reg clk,reset;
    reg [3:0] D0,D1,D2,D3;
    wire [3:0] AN;
    wire [6:0] Seg;

    Controlador_Display_7_seg DUT(
        .i_Clk(clk),
        .i_Rst(reset),
        .i_Datos_1(D0),
        .i_Datos_2(D1),
        .i_Datos_3(D2),
        .i_Datos_4(D3),
        .o_Anodo(AN),
        .o_Segmentos(Seg)
    );

    initial
    begin
        clk<=0;
        reset<=1;
        D0<=9;
        D1<=7;
        D2<=5;
        D3<=1;
        #20 reset<=0;
    end

    always@(clk) begin
        #5 clk<=~clk;
    end

endmodule
