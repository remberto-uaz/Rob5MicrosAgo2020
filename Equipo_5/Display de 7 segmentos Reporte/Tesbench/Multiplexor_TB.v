//`timescale 1ns / 1ps


module Multiplexor_TB(                  //Nombre del modulo  

    );
    
 reg [3:0] Datos_0;   					//Entrada de 4 bits llamada	i_Datos_0 	
 reg [3:0] Datos_1;						//Entrada de 4 bits llamada	i_Datos_1
 reg [3:0] Datos_2;						//Entrada de 4 bits llamada i_Datos_2	
 reg [3:0] Datos_3;						//Entrada de 4 bits llamada i_Datos_3	
 reg [1:0] Sel;							//Entrada de 2 bits llamada i_Sel
 wire [3:0] Salida;						//Salida de 4 bits llamada o_Salida
 
 Multiplexor DUT(						//Diseño bajo testeo de multiplexor
     .i_Datos_0(Datos_0),  				// Especifica que i_Datos_0 es Datos_0 para su futuro uso
     .i_Datos_1(Datos_1),				// Especifica que i_Datos_1 es Datos_1 para su futuro uso
     .i_Datos_2(Datos_2),				// Especifica que i_Datos_2 es Datos_2 para su futuro uso				
     .i_Datos_3(Datos_3),				// Especifica que i_Datos_3 es Datos_3 para su futuro uso
     .i_Sel(Sel),						// Especifica que i_Sel es Sel para su futuro uso
     .o_Salida(Salida)					// Especifica que o_Salida es Salida para su futuro uso
 );
 
 initial								//Iniciacion del testbench
begin                    			    //Funcion que ejecuta en forma de bucle
  
  Datos_0 <=0;                     		//Asigna el valor de 0 a Datos_0
  Datos_1 <=0;							//Asigna el valor de 0 a Datos_1
  Datos_2 <=0;							//Asigna el valor de 0 a Datos_2
  Datos_3 <=0;							//Asigna el valor de 0 a Datos_3
  Sel <=0;								//Asigna el valor de 0 a Sel
  #50;
  Datos_0 [0]<=1;						//En el vector 0 de Datos_0 se asigna el valor de 1
  Datos_1 [1]<=1;						//En el vector 0 de Datos_1 se asigna el valor de 1
  Datos_2 [2]<=1;						//En el vector 0 de Datos_2 se asigna el valor de 1
  Datos_3 [3]<=1;						//En el vector 0 de Datos_3 se asigna el valor de 1
  #50;									//Pasa Tiempo
  Sel <=0;							    //Asigna el valir 0 a Sel
  #50;									//Pasa Tiempo
  Sel [0]<=1;							//En el vector 0 de Sel se asigna el valor de 1
  Sel [1]<=0;							//En el vector 1 de Sel se asigna el valor de 0
  #50;									//Pasa Tiempo
  Sel [0]<=0;							//En el vector 0 de Sel se asigna el valor de 0
  Sel [1]<=1;							//En el vector 1 de Sel se asigna el valor de 1
  #50;									//Pasa Tiempo
  Sel [0]<=1;							//En el vector 0 de Sel se asigna el valor de 1
  Sel [1]<=1;							//En el vector 1 de Sel se asigna el valor de 1
  #50;									//Pasa Tiempo
end							     		//Termina el bloque de codigo
endmodule						    	//Termina el modulo
