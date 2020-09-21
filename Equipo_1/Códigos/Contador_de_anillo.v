//Este componente crea un contador que itera de 0 a 3 Bin con cada pulso de
//reloj, al acabar la cuenta, vuelve al primer valor, con cada iteracion 
//pasa su valor a la salida o_Sel y tambien a o_Anodo pero en otro formato
module Contador_de_anillo(
    input i_Clk,
    input i_Rst,
    output reg [3:0] o_Anodo,//Como registros para poder pasar su valor
    output reg [1:0] o_Sel);//dentro del always

    reg [1:0] cont;//Se crea el contador que al tener un limite de 3 solo
                   //requiere de 2 bits

    //Se establece Clk y un Rst asicrono en la lista de sensitividad
    always @(posedge i_Rst, posedge i_Clk)
    begin
        if(i_Rst) begin//Reset asincrono
            o_Anodo<= 4'b0001;
            o_Sel<=2'b00;   
            cont<=2'b00;
        end 
        else begin
            case(cont)
                2'b00: begin
                    o_Anodo<= 4'b0001;//Se codifica en otro formato para
                                      //o_Anodo, en este caso, de un bit
                                      //a la vez 
                    o_Sel<=cont;//Con cada iteracion el contador pasa su 
                                //a o_Sel  
                    cont<=cont+1;
                end
                2'b01: begin
                    o_Anodo<= 4'b0010;
                    o_Sel<=cont;  
                    cont<=cont+1;
                end  
                2'b10: begin
                    o_Anodo<= 4'b0100;
                    o_Sel<=cont;  
                    cont<=cont+1;
                end
                default: begin 
                    o_Anodo<= 4'b1000;
                    o_Sel<=cont;  
                    cont<=2'b00;//Llega al limite, por lo que retorna
                                //a cero
                end
            endcase    
        end 
    end

endmodule