module controlador_display_7_seg
    #(parameter n=19,
    parameter lim=4999999)
    (   input i_Clk,
        input i_Rst,
        input [3:0] i_Datos1,
        input [3:0] i_Datos2,
        input [3:0] i_Datos3,
        input [3:0] i_Datos4,
        output [3:0] o_Habs,
        output [6:0] o_S7seg);
    
    wire [3:0] cifra;
    wire [1:0] n_cifra;
    wire h;

    contador_inc_nb Bloque_1(2)(
        .i_Clk(i_Clk),
        .i_Rst(i_Rst),
        .i_Inc(H),
        .o_Cta(n_cifra)
    );

    preescalador Bloque_2(17,99999)(
        .i_Clk(i_Clk),
        .i_Rst(i_Rst),
        .o_H(h),
    );

    decodificador_binario_7seg Bolque_3(
        .i_Entrada(o_Cifra),
        .o_Salida(o_S7seg)
    );

    multiplexor_habilitaciones Bloque_4(
        .i_N_cifra(n_cifra),
        .i_Datos1(i_Datos1),
        .i_Datos2(i_Datos2),
        .i_Datos3(i_Datos3),
        .i_Datos4(i_Datos4),
        .o_Cifra(cifra)
        .o_Habs(o_Habs)
    );

endmodule
