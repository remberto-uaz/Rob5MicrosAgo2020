//La finalidad de este modulo es reunir los componentes e interconectarlos
//para crear el sistema final, asi como agregar sus entradas y salidas
//Funge como parte top del sistema
module Controlador_Display_7_seg
    (   input i_Clk,
        input i_Rst,
        input [3:0] i_Datos_1,
        input [3:0] i_Datos_2,
        input [3:0] i_Datos_3,
        input [3:0] i_Datos_4,
        output [3:0] o_Anodo,
        output [6:0] o_Segmentos);
        

    wire [3:0] Demx_Deco_Sel;
    wire [1:0] Contador_Demx_Sel;
    wire Prescalador_contador_tiempo;
    // Se declaran las senales internas que conectaran nuestros componentes
    
    
    //Contador de anillo
    Contador_de_anillo Bloque_1(
        .i_Clk(Prescalador_contador_tiempo),
        .i_Rst(i_Rst),
        .o_Anodo(o_Anodo),
        .o_Sel(Contador_Demx_Sel)
    );
    //La senal Contador_Demx_Sel conectara la salida o_Sel del contador con 
    //el selector del multiplexor

    //Preescalador a 2.4 micro segundos
    Preescalador Bloque_2(
        .i_Clk(i_Clk),
        .i_Rst(i_Rst),
        .o_Presc(Prescalador_contador_tiempo)
    );
    //La senal Demx_Deco_Sel conecta a la salida del multiplexor con el
    //decodificador binario para pasarle la entrada de datos a representar
    //en el display
    
    //Decodificador de binario a formato de 7 segmentos para display de 
    //anodo comun
    Deco_binario_7seg Bloque_3(
        .i_Bits(Demx_Deco_Sel),
        .o_Segmentos(o_Segmentos)
    );
    //La senal interna Precalador_contador_proviene de la salida del preescalador
    //y permitira que el contador trabaje a 120Hz   
    
    //Multiplexor
    Demx Bloque_4(
        .i_Sel(Contador_Demx_Sel),
        .i_Datos_0(i_Datos_1),
        .i_Datos_1(i_Datos_2),
        .i_Datos_2(i_Datos_3),
        .i_Datos_3(i_Datos_4),
        .o_Salida(Demx_Deco_Sel)
    );

endmodule