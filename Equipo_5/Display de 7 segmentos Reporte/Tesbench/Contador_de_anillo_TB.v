module Contador_de_anillo_TB(       //Nombre del modulo testbench
);
    reg clk;                        //Registro del relog
    reg rst;                        //Registro del reset
    wire [3:0] anodo;               //Cables de 4 bits de nombre anodo
    wire [1:0] sel;                 //Cables de 2 bits de nombre sel

    Contador_de_anillo DUT (        //Nombre de la unidad bajo testeo(DUT)
        .i_Clk(clk),                //Asignacion de los nombres de las variables de otros bloques
        .i_Rst(rst),                ////Asignacion de los nombres de las variables de otros bloques
        .o_Anodos(anodo),           ////Asignacion de los nombres de las variables de otros bloques
        .o_Sel(sel)                 ////Asignacion de los nombres de las variables de otros bloques
    );

    initial begin                   //Inicia el testbench
        clk<=0;                     //Se le asigna valor al reloj
        rst<=1;                     //Se le asigna el valor de 1 al reset
        #20 rst<=0;                 //Pasa tiempo y se le asigna el valor 0 al reset
    end                             //Termina la inicializacion del testbench

    always@(clk) begin              //Inicia la lista de sensitividad para el clock
        #5 clk <= ~clk;             //Lineas de codigo para el reloj
    end                             //Termina el modulo de codigo

endmodule                           //Termina el modulo testbench
