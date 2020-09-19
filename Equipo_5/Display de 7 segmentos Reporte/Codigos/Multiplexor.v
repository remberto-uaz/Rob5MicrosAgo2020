
module Demx                                     //Nombre del modulo 
    (   input [3:0] i_Datos_0,                  //Entrada de 4 bits llamada	i_Datos_0 	
        input [3:0] i_Datos_1,                  //Entrada de 4 bits llamada	i_Datos_1
        input [3:0] i_Datos_2,                  //Entrada de 4 bits llamada i_Datos_2	
	    input [3:0] i_Datos_3,                  //Entrada de de 4 bits llamada i_Datos_3
	    input [1:0] i_Sel,                      //Entrada de 2 bits llamada i_Sel	
        output reg [3:0] o_Salida);             //Salida de 4 bits llamada o_Salida
		
always@(i_Sel) begin                            //Funcion que ejecuta en forma de bucle
		case (i_Sel)                            //Condicional que revisa i_Sel
			2'b00: o_Salida <= i_Datos_0;       //Cuando i_sel esta em estos 1'b00 se le asigna a o_Salida los datos de i_Datos_0
			2'b01: o_Salida <= i_Datos_1;       //Cuando i_sel esta em estos 1'b01 se le asigna a o_Salida los datos de i_Datos_1
			2'b10: o_Salida <= i_Datos_2;       //Cuando i_sel esta em estos 1'b10 se le asigna a o_Salida los datos de i_Datos_2
			default : o_Salida <= i_Datos_3;    //En caso contrario que no se cumpla una de las anteriores
		endcase                                 //Fin de la condicional
     	end                                     //Termina el bloque de codigo
    
endmodule										//Termina el modulo
