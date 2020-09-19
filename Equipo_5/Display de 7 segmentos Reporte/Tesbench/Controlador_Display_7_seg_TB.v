module Controlador_Display_7_seg_TB(            //Nombre del modulo del testbench
);
    reg clk,reset;                              //Registros llamados clk y reset
    reg [3:0] D0,D1,D2,D3;                      //Registros de 4 bits llamados D0, D1, D2 y D3
    wire [3:0] AN;                              //Cable de 4 bits llamado AN
    wire [6:0] Seg;                             //Cable de 7 bits llamado Seg

    Controlador_Display_7_seg DUT(              //Nombre de la unidad bajo testeo (DUT)
        .i_Clk(clk),                            //Asignacion de los nombres de las variables de otros bloques
        .i_Rst(reset),                          //Asignacion de los nombres de las variables de otros bloques
        .i_Datos1(D0),                          //Asignacion de los nombres de las variables de otros bloques
        .i_Datos2(D1),                          //Asignacion de los nombres de las variables de otros bloques
        .i_Datos3(D2),                          //Asignacion de los nombres de las variables de otros bloques
        .i_Datos4(D3),                          //Asignacion de los nombres de las variables de otros bloques
        .o_Anodos(AN),                          //Asignacion de los nombres de las variables de otros bloques
        .o_Segmentos(Seg)                       //Asignacion de los nombres de las variables de otros bloques
    );

    initial                                     //Inicializa el testbench
    begin                                       //Inicia el bloque de codigo
        clk<=0;                                 //Se le asigna a clk el valor 0
        reset<=1;                               //Se le asigna a reset el valor de 1
        D0<=9;                                  //Se le asigna a d0 el valor de 9
        D1<=7;                                  //Se le asigna a d1 el valor de 7
        D2<=5;                                  //Se le asigna a d2 el valor de 5
        D3<=1;                                  //Se le asigna a d3 el valor de 1
        #20 reset<=0;                           //Pasa tiempo y el reset se le asigna el valor de 0
    end                                         //Termina el bloque de codigo

    always@(clk) begin                          //Inicializa el reloj
        #5 clk<=~clk;                           //El reloj se actualiza cada cierto tiempo
    end                                         //Termina el reloj

endmodule                                       //Termina el testbench