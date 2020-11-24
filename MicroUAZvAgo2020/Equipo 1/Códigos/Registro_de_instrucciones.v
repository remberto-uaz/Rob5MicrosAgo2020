//Este componente permite la decodificación y almacenamiento de la instrucción
//a ejecutar, la cual proviene del bus de la memoria de instrucciones, también
//permite la función de direccionamiento inmediato. Es un registro.
module Registro_de_instrucciones(
    input i_Timming,
    input i_Rst,
    input [8:0] i_Instrucciones,
    output [2:0] o_Instruccion,
    output [5:0] o_Operandos,
    output [7:0] o_Direccionamiento_inmediato);
    
    // Se declaran los registros y las señales internas
    reg [2:0] Operation_code;
    reg [5:0] Operandos;
    reg [7:0] Direccionamiento_inmediato=0;
    

    //Etapa de implemetacion
    always@(posedge i_Rst, posedge i_Timming)
    begin
        if (i_Rst) begin//El reset es sincrono
            Operation_code <= 3'b000;
            Operandos <= 3'b000;
        end
        else begin
            if (i_Instrucciones[8:6]==3'b000 || i_Instrucciones[8:6]==3'b010) begin
                Direccionamiento_inmediato<=i_Instrucciones[2:0];
                Operation_code<=i_Instrucciones[8:6];
                Operandos[5:3]<=i_Instrucciones[5:3];
                Operandos[2:0]<=& 3'b000;
            end
            else begin
                Operation_code<=i_Instrucciones[8:6];
                Operandos[5:3]<=i_Instrucciones[5:3];
                Operandos[2:0]<=i_Instrucciones[2:0];
                Direccionamiento_inmediato<=0;
            end
        end
    end

    assign o_Instruccion = Operation_code;//Se pasa el valor del registro Operation 
                                          //_code a o_Instruccion
    assign o_Operandos = Operandos; //Se pasa el valor del registro Operandos a 
                                    //o_Operandos
    assign o_Direccionamiento_inmediato = Direccionamiento_inmediato;//Se pasa el valor  
                                    //del registro direccionamiento_inmediato a la salida
                                    //de o_Direccionamiento_inmediato
endmodule