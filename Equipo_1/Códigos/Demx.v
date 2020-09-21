//Este componente permite seleccionar el dato a representar en cada
//iteracion del contador de anillo el cual depende directamente del
//preescalador, esto debido a que el display solo puede mostrar un 
//dato a la vez
module Demx
    (   input [3:0] i_Datos_0,
        input [3:0] i_Datos_1,
        input [3:0] i_Datos_2,
	    input [3:0] i_Datos_3,
	    input [1:0] i_Sel,
        output reg [3:0] o_Salida);//Se establece como registro para 
                                   //poder usarla en el always
	
	//Se incluyen todas las entradas en la lista de sensitividad,
	//tambien se podria representar como always@(*) que vendria a
	//ser lo mismo que considerar todas las entradas posibles
    always@(i_Sel,i_Datos_0,i_Datos_1,i_Datos_2,i_Datos_3) begin
            //Dependiendo del valor del selecto pasara el dato a
            //la salida
            case (i_Sel)
                2'b00: o_Salida <= i_Datos_0;
                2'b01: o_Salida <= i_Datos_1;
                2'b10: o_Salida <= i_Datos_2;
                default : o_Salida <= i_Datos_3;
            endcase 
    end 
    
endmodule 