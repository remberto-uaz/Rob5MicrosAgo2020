//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.11.2020 23:31:17
// Design Name: 
// Module Name: Direccionamiento
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


module Direccionamiento(
    input [4:0] i_Control_Direc,
    input [15:0] i_DireccionDato,
    output [7:0] o_Direccion_Datos,
    output [7:0] o_Salida_Datos,
    output reg o_RW
 );
 
 wire [1:0] c_in;
 wire [2:0] c_dat;
 wire [7:0] Datos;
 reg [7:0] Salida_Datos = 0; 
 reg [7:0] Direccion_Datos = 0;
  
 //segmentar:
 assign c_in = i_Control_Direc[4:3];
 assign c_dat = i_Control_Direc[2:0];
 assign o_Salida_Datos = Salida_Datos;
 assign o_Direccion_Datos = Direccion_Datos;

assign Datos = (c_dat == 3'b000) ? 8'b00000001:         //1
               (c_dat == 3'b001) ? 8'b00000010:         //2
               (c_dat == 3'b010) ? 8'b00000100:         //4
               (c_dat == 3'b011) ? 8'b00001000:         //8
               (c_dat == 3'b100) ? 8'b00010000:         //16
               (c_dat == 3'b101) ? 8'b00100000:         //32
               (c_dat == 3'b110) ? 8'b01000000:         //64
               (c_dat == 3'b111) ? 8'b10000000: 8'h00;  //128 :00
 
/*assign o_RW = (c_in == 2'b01) ? 1'b0:
              (c_in == 2'b10) ? 1'b1:
              (c_in == 2'b11) ? 1'b1: 1'b0;*/

/*assign Direccion_Datos = (c_in == 2'b00) ? Direccion_Datos : i_DireccionDato[15:8];

assign Salida_Datos = (c_in == 2'b01) ? i_DireccionDato[7:0]:
                        (c_in == 2'b10) ? Datos:
                        (c_in == 2'b11) ? i_DireccionDato[7:0]: Salida_Datos;*/

always@(c_in)
begin
    if (c_in == 2'b00)
        Direccion_Datos <= Direccion_Datos;
    else
        Direccion_Datos <= i_DireccionDato[15:8];
        
    case(c_in)
    2'b01: begin
            Salida_Datos <= i_DireccionDato[7:0];
            o_RW <= 0;
           end
    2'b10: begin
            Salida_Datos <= Datos;
            o_RW <= 1;
           end
    2'b11: begin
            Salida_Datos <= i_DireccionDato[7:0];
            o_RW <= 1;
           end
    default: begin
              Salida_Datos <= Salida_Datos;
              o_RW <= 0;
             end
    endcase
    
end 
endmodule

