module Control_de_Bus (
input Clk,
input Rst,
input [1:0] Control_Salida,
input [7:0] Num8b,
input [7:0] RX,
input [7:0] RY,
output reg[7:0] o_Bus_Datos_S,
output reg[7:0] o_Bus_Direccion_Datos,
output reg o_Lectura_Escritura);

always@(posedge Clk)  
begin
if (Rst)
begin
o_Bus_Datos_S <= 0;
o_Bus_Direccion_Datos <= 0;
o_Lectura_Escritura <= 0;
end
    case (Control_Salida)
        2'b00: begin
            o_Bus_Datos_S <= 0;
            o_Bus_Direccion_Datos <= 0;
            o_Lectura_Escritura <= 0;
        end
        2'b01: begin// LOAD_Registros
            o_Bus_Datos_S <= 0;
            o_Bus_Direccion_Datos <= RY;
            o_Lectura_Escritura <= 0;
        end
        2'b10: begin// STORE_Num
            o_Bus_Datos_S <= Num8b;
            o_Bus_Direccion_Datos <= RX;
            o_Lectura_Escritura <= 1;
        end
        2'b11: begin // STORE_Registro
            o_Bus_Direccion_Datos <= RX;
            o_Bus_Datos_S <= RY;
            o_Lectura_Escritura <= 1;
        end
        default begin
            o_Bus_Datos_S <= 0;
            o_Bus_Direccion_Datos <= 0;
            o_Lectura_Escritura <= 0;
        end
    endcase;
end 
endmodule