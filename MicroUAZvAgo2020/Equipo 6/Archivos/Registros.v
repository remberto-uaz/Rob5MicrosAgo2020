//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.11.2020 21:35:21
// Design Name: 
// Module Name: Registros
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


module Registros(
    input i_Rst,
    input i_Clk,
    input [7:0] i_Direccion_PC,
    input [7:0] i_Resultado_ALU,
    input i_Control_Registros,
    input [7:0] i_Datos_Entrada,
    input [8:0] i_Instrucciones,
    output  [7:0] o_Direccion_Salto,
    output [15:0] o_DireccionDato,
    output  [15:0] o_Operandos
 );

reg[7:0] BancoRegistros [0:7];
integer i;
//reg [2:0] R7 = 3'b111;
wire [2:0] c_Ins;
wire [2:0] c_RX;
wire [2:0] c_RY;

assign c_Ins = i_Instrucciones[8:6];
assign c_RX = i_Instrucciones[5:3];
assign c_RY = i_Instrucciones[2:0];

always@(posedge i_Clk)
begin
      if (i_Rst)
        for(i = 0; i <8; i = i+1) 
            BancoRegistros[i] <= 0;
            
      else begin
        case(c_Ins)
          3'b001: BancoRegistros [c_RX] <= {5'b00000, c_RY};
          3'b010: BancoRegistros[c_RX] <= i_Datos_Entrada;
          3'b101: BancoRegistros [c_RX] <= BancoRegistros[c_RY];
    //      3'b110: begin
  //                  o_Operandos <= { BancoRegistros[c_RX], BancoRegistros[000] };
      //              BancoRegistros[0] <= i_Resultado_ALU;
      //            end
          3'b111: begin
         //           o_Direccion_Salto <= BancoRegistros[c_RX];
                    if (c_RY == 3'b001)
                        BancoRegistros[7] <= i_Direccion_PC;
                  end
          /*default: begin 
                    o_Direccion_Salto <= o_Direccion_Salto;
//                    o_Operandos <= o_Operandos;
                   end*/
        endcase 
        
        if (i_Control_Registros)
            BancoRegistros[000] <= i_Resultado_ALU;
     //   else
       //     BancoRegistros[7] <= i_Direccion_PC;*/
       end

end 

assign o_Direccion_Salto = (c_Ins == 3'b111) ? BancoRegistros[c_RX] : 8'b0;
assign o_Operandos = (c_Ins == 3'b110) ? {BancoRegistros[c_RX], BancoRegistros[000]} : 16'b0;

assign o_DireccionDato = (c_Ins == 3'b010) ? { BancoRegistros[c_RY], BancoRegistros[c_RX] } :
                         (c_Ins == 3'b011) ? { BancoRegistros[c_RX], BancoRegistros[c_RY] } :
                         (c_Ins == 3'b100) ? { BancoRegistros[c_RX], BancoRegistros[c_RY] } : 16'b0; 
endmodule