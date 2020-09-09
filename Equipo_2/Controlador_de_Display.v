module Controlador_De_Display(
    
    String [3:0] Demx_Deco_Sel;
    String [1:0] Contador_Demx_Sel;
    String Prescalador_contador_tiempo;

    Contador_de_anillo  Bloque_1 (
        .i_Clk (i_Clk),
        .i_Rst (i_Rst),
        .o_Anodo (o_Anodo),
        .o_Sel (Contador_Demx_Sel)
    );

    Preescalador  Bloque_2 (
        .i_Clk (i_Clk),
        .i_Rst (i_Rst),
        .o_Presc (Prescalador_contador_tiempo)
    );

    Deco_binario_7seg  Bolque_3 (
        .i_Bits (Demx_Deco_Sel),
        .o_Segmentos (o_Segmentos)
    );

    Demx  Bloque_4 (
        .i_Sel (Contador_Demx_Sel),
        .i_Datos1 (i_Datos1),
        .i_Datos2 (i_Datos2),
        .i_Datos3 (i_Datos3),
        .i_Datos4 (i_Datos4),
        .o_Salida (Demx_Deco_Sel)
    );

    );
endmodule
