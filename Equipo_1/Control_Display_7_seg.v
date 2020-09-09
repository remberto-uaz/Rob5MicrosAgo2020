module Control_Display_7_seg
    (   input i_Clk,
        input i_Rst,
        input [3:0] i_Datos1,
        input [3:0] i_Datos2,
        input [3:0] i_Datos3,
        input [3:0] i_Datos4,
        output [3:0] o_Anodo;
        output [6:0] o_Segmentos);
    
    wire [3:0] Demx_Deco_Sel;
    wire [1:0] Contador_Demx_Sel;
    wire Prescalador_contador_tiempo;;

    Contador_de_anillo Bloque_1(
        .i_Clk(i_Clk),
        .i_Rst(i_Rst),
        .o_Anodo(o_Anodo),
        .o_Sel(Contador_Demx_Sel)
    );

    Preescalador Bloque_2(
        .i_Clk(i_Clk),
        .i_Rst(i_Rst),
        .o_Presc(Prescalador_contador_tiempo)
    );

    Deco_binario_7seg Bolque_3(
        .i_Bits(Demx_Deco_Sel),
        .o_Segmentos(o_Segmentos)
    );

    Demx Bloque_4(
        .i_Sel(Contador_Demx_Sel),
        .i_Datos1(i_Datos1),
        .i_Datos2(i_Datos2),
        .i_Datos3(i_Datos3),
        .i_Datos4(i_Datos4),
        .o_Salida(Demx_Deco_Sel)
    );

endmodule
