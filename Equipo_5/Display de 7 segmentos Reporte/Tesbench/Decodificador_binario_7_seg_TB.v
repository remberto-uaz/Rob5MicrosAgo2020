module Deco_binario_7seg_TB(    //Nombre del modulo testbench
);
    reg  [3:0] bits;            //Registro de 4 bits llamado bits
    wire [6:0] seg;             //Cable de 7 bits llamado llamado seg

    Deco_binario_7seg DUT(      //Nombre de la unidad bajo testeo (DUT)
        .Demx_deco_Sel(bits),   //Asignacion de los nombres de las variables de otros bloques
        .o_Segmentos(seg)       //Asignacion de los nombres de las variables de otros bloques
    );

    initial                     //Inicializa el testbench
    begin                       //Inicia el bloque de codigo
        bits<=4'b0000;          //Se le asigna a bits el valor 0000
    end                         //Termina bloque de codigo
    always@(bits)begin          //Inicializa el bloque de codigo con
        bits<=4'b0001;          //Se le asigna a bits el valor 00001
        #5                      //Pasa tiempo
        bits<=4'b0010;          //Se le asigna a bits el valor 0010
        #5                      //Pasa tiempo
        bits<=4'b0011;          //Se le asigna a bits el valor 0011
        #5                      //Pasa tiempo
        bits<=4'b0100;          //Se le asigna a bits el valor 0100
        #5                      //Pasa tiempo
        bits<=4'b0101;          //Se le asigna a bits el valor 0101
        #5                      //Pasa tiempo
        bits<=4'b0110;          //Se le asigna a bits el valor 0110
        #5                      //Pasa tiempo
        bits<=4'b0111;          //Se le asigna a bits el valor 0111
        #5                      //Pasa tiempo
        bits<=4'b1000;          //Se le asigna a bits el valor 1000
        #5                      //Pasa tiempo
        bits<=4'b1001;          //Se le asigna a bits el valor 1001
        #5                      //Pasa tiempo
        bits<=4'b1010;          //Se le asigna a bits el valor 1010
        #5                      //Pasa tiempo
        bits<=4'b1011;          //Se le asigna a bits el valor 1011
        #5                      //Pasa tiempo
        bits<=4'b1100;          //Se le asigna a bits el valor 1100
        #5                      //Pasa tiempo
        bits<=4'b1101;          //Se le asigna a bits el valor 1101
        #5                      //Pasa tiempo
        bits<=4'b1110;          //Se le asigna a bits el valor 1110
        #5                      //Pasa tiempo
        bits<=4'b1111;          //Se le asigna a bits el valor 1111
    end                         //Finaliza el bloque de codigo
endmodule                       //Finaliza el testbench
