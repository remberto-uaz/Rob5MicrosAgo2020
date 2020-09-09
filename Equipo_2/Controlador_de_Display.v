módulo  Control_Display_7_seg
    (    entrada i_Clk,
        entrada i_Rst,
        entrada [ 3 : 0 ] i_Datos1,
        entrada [ 3 : 0 ] i_Datos2,
        entrada [ 3 : 0 ] i_Datos3,
        entrada [ 3 : 0 ] i_Datos4,
        salida [ 3 : 0 ] o_Anodo;
        salida [ 6 : 0 ] o_Segmentos);
    
    alambre [ 3 : 0 ] Demx_Deco_Sel;
    alambre [ 1 : 0 ] Contador_Demx_Sel;
    alambre Prescalador_contador_tiempo ;;

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

endmodule
