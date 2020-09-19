module Preescalador(               //Nombre del módulo
  input i_Clk,                     //Declaración de la entrada llamada 
i_Clk
  input i_Rst,                     //Declaración de la entrada llamada 
i_Rst
  output o_Presc                   //Declaración de la salida llamada 
o_Presc
  );
  reg [19:0] contador;             //Registro de 20 bits llamado contador
  reg salida;                      //Registro llamado salida
  always@(posedge i_Clk)           //Función que se ejecuta en forma de bucle, hace que el código espere el rise del clock y también el reset para ejecutar el código
  begin                            //Se engloba el proceso en un buble
      if (i_Rst)                   //Condicional que se activa cuando se 
presiona i_reset
      contador <= 0;               //Se asigna el valor a contador
      else                         //Condicional que engloba otro bloque
      contador <= contador+1;      //Se asigna nuevo valor a contador
      if (contador <= 416666)      //Condicional que se activa cuando se 
cumple la condición
      salida <= 0;                 //Se asigna el valor de salida
      else                         //Condicional que engloba otro bloque 
      salida <= 1;                 //Se asigna nuevo valor a salida
      if (contador == 833333)      //Condicional que se activa cuando se 
cumple la condición
      contador <= 0;               //Se asigna el valor a contador
  end                              //Termina el bloque de código
  assign o_Presc = salida;         //Se iguala el valor de assign o_Presc 
a salida
endmodule                          //Acaba el modulo
