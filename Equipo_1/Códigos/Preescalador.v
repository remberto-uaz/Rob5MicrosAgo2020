//Este componente sirve como un divisor de frecuencia
//de la señal de reloj interna de 100Mhz de la basys 3 a 120Hz que
//es la frecuencia que se requiere para desplegar cada digito en el
//display, se podria decir que cada 2.4Micro segundos otorga un pulso 
//positivo que dura la misma cantidad de tiempo y posteriormente 
//baja a un valor logico '0'
  module Preescalador(
    input i_Clk,
    input i_Rst,
    output o_Presc);
    
    //Se establece un registro para el contador, que debe almacenar un valor
    //de hasta 833,333 iteraciones que es lo equivalente al periodo requerido
    reg [19:0] contador;
    //Un registro salida para trabajar en el always y que su valor a la salida
    //o_Presc
    reg salida;
    
    //Se elimino el reset asincrono debido a que causaba ambiguedades en la 
    //etapa de implemetacion
    always@(posedge i_Clk)
    begin
        if (i_Rst) begin//El reset es sincrono
        contador <= 0;
        end
        else begin
            contador <= contador+1;
        end
        if (contador <= 416667) begin//Se compara si el contador llega a la
                                    // Mitad del periodo para establecer un '1'
                                    //logico en la salida, si no, lo deja en '0'
        salida <= 0;
        end
        else begin
        salida <= 1;
        end
        if (contador == 833334)begin//Se verifica que el contador complete el
                                    //periodo para establecer la salida a 0
                                    
        contador <= 0;//Se retorna el valor del contador a 0
        end
    end
    assign o_Presc = salida;//Se pasa el valor del registro salida a o_Presc
endmodule