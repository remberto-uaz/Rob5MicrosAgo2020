//Este componente permitira llevar la cuenta de la instrucción que se está
//ejecutando, se autoincreenta con cada ciclo de reloj y ejecuta saltos de
//instrucciones en caso de requerirlo.

 module PC(
    input i_Timming,
    input i_Rst,
    input i_Senal_de_salto,
    input [7:0] i_Direccion_salto,
    output[7:0] o_Stack,
    output[7:0] o_Fetch);
    
    // Se declaran los registros y las señales internas
    reg [7:0] cont=0;
    reg [7:0] stack=0;

    //Etapa de implemetacion
    always@(posedge i_Rst, posedge i_Timming)
    begin
        if (i_Rst) begin//El reset es asincrono
        cont <= 8'b00000000;
        end
        else begin
            if (i_Senal_de_salto==1)  begin
                stack<=cont;
                cont<=i_Direccion_salto;
            end
            else begin
                cont<=cont+1;
            end
        end
    end

    assign o_Fetch = cont;//Se pasa el valor del registro cont a o_Fetch
    assign o_Stack = stack;//Se pasa el valor del registro stack a o_Stack
endmodule