 //Este componente sirve como un divisor de frecuencia
//de la señal de reloj interna de 100Mhz de la basys 3 a 120Hz que
//es la frecuencia que se requiere para desplegar cada digito en el
//display, se podria decir que cada que llega a 1/2 del límite otorga 
// un pulso positivo que dura la misma cantidad de tiempo y posteriormente 
//baja a un valor logico '0'
module Preescalador(
    input i_Clk,
    input i_Rst,
    input [31:0] i_Frec_de_trabajo,
    output o_Timming);
    
    // Se declaran los registros y las señales internas
    reg [32:0] Cont=0;
    reg [32:0] Lim_med=32'b11111111111111111111111111111111;
    reg Salida=0;
    
    //Se elimino el reset asincrono debido a que causaba ambiguedades en la 
    //Etapa de implemetacion
    always@(posedge i_Clk)
    begin
        if (i_Rst) begin//El reset es sincrono
        Cont <=0;
        Lim_med<=i_Frec_de_trabajo/2;
        end
        else begin
        end
        if (Cont == Lim_med-1)begin//Se compara si el contador llega a la
                                 // Mitad del periodo para establecer un '1'
                                 //logico en la salida, si no, lo deja en '0'
                                    
            Cont<= 0;//Se retorna el valor del contador a 0
            Salida<= ~Salida;
        end
        else begin
            Cont<= Cont+1;
        end
    end
    assign o_Timming = Salida;//Se pasa el valor del registro Salida a o_Timming
endmodule