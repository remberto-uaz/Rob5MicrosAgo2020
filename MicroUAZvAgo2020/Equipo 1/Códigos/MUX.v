//Este componente permite seleccionar el dato que entrará a los
//registros de datos. Es meramente combinacional.
module MUX
    (   input [1:0] i_Selector_de_entrada_a_registros,
        input [7:0] i_Resultado,
        input [7:0] i_Direccionamiento_inmediato,
        input [7:0] i_Bus_Datos,
        input [7:0] i_Senal_a_stack,
        output [7:0] o_Datos);
	
    // Se declaran los registros y las señales internas
    reg [7:0] Datos;

	//Etapa de implemetacion
    //Se incluyen todas las entradas en la lista de sensitividad,
    always@(*) 
    begin
        //Dependiendo del valor del selector pasara el dato a
        //la salida
        case (i_Selector_de_entrada_a_registros)
            2'b00: Datos <= i_Resultado;
            2'b01: Datos <= i_Direccionamiento_inmediato;
            2'b10: Datos <= i_Bus_Datos;
            default : Datos <= i_Senal_a_stack;
        endcase 
    end 

    assign o_Datos=Datos; //Asignamos el valor del registro Datos a
                          //la salida del multiplexor
    
endmodule 