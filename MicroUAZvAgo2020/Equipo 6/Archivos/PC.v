//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.11.2020 06:36:57
// Design Name: 
// Module Name: PC
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module PC(
    input i_Clk,
    input i_Rst,
    input i_Control_PC,    
    input [1:0] i_Control_Saltos,
    input [7:0] i_Direccion_Salto,
    output [7:0] o_Direccion_Instrucciones,
    output [7:0] o_Direccion_PC
    );
    
    wire Control;
    wire [1:0] Saltos;
    wire [7:0] Direccion_Salto;
   // reg [7:0] Direccion_Instrucciones;
    wire [7:0] Direccion_PC;
    reg [7:0] contador = 0;
    
assign Control = i_Control_PC;
assign Saltos = i_Control_Saltos;
assign Direccion_Salto = i_Direccion_Salto;
//assign o_Direccion_Instrucciones = Direccion_Instrucciones;
assign  o_Direccion_PC = Direccion_PC;  

always @(posedge i_Clk)
begin 
    //Direccion_Instrucciones = contador;
     if(i_Rst) begin
        contador <= 0;
     end
     else begin
         if(Control) begin
            contador <= contador +1;
            if (contador == 255)
                contador <= 0;
         end
         else begin
            //Direccion_Instrucciones = contador;
            case (Saltos)
                2'b00:begin
                    contador <= contador +1;
                    if (contador == 255)
                        contador <= 0;
                end
                2'b01:begin
                    contador <= Direccion_Salto;
                end
                2'b10:begin
                    //Direccion_PC <= o_Direccion_Instrucciones;
                    contador <= contador +1;
                    if (contador == 255)
                        contador <= 0;
                end
                
            endcase
            
         end
         
     end    
     
end

 assign o_Direccion_Instrucciones = contador;
 assign Direccion_PC = (Saltos == 2'b10) ? o_Direccion_Instrucciones : 8'b0;

endmodule
