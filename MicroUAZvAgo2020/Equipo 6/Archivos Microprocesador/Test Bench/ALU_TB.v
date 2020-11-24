//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.11.2020 01:03:06
// Design Name: 
// Module Name: ALU_TB
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


module ALU_TB(

    );
  reg [3:0] Control;
  reg [15:0] Operandos;
  wire [7:0] Resultado;
  wire [2:0] Banderas;
        
  ALU DUT(
    .i_Control_ALU(Control),
    .i_Operandos(Operandos),
    .o_Resultado(Resultado),
    .o_Banderas_Estado(Banderas)
  );
        
  initial 
  begin
    Control <= 0;
    Operandos <= 0;
    #20;
    Control <= 4'b1000;
    Operandos[15:8] <= 8'b01111111;
    Operandos[7:0] <= 8'b00000001;
    #20;
    Control <= 4'b1001;
    Operandos[15:8] <= 8'b11101110;
    Operandos[7:0] <= 8'b11110111;
    #20;
    Control <= 4'b1010;
    Operandos[15:8] <= 8'b00000101;
    Operandos[7:0] <= 8'b00000011;   
    #20;
    Control <= 4'b1011;
    Operandos[15:8] <= 8'b00000101;
    Operandos[7:0] <= 8'b00000011;   
    #20;
    Control <= 4'b1100;
    Operandos[15:8] <= 8'b01010101;
    Operandos[7:0] <= 8'b01010101;   
    #20;
    Control <= 4'b1101;
    Operandos[15:8] <= 8'b01010101;
    Operandos[7:0] <= 8'b10101010;   
    #20;
    Control <= 4'b1110;
    Operandos[15:8] <= 8'b01010101;
    Operandos[7:0] <= 8'b10101010;   
    #20;
    Control <= 4'b1111;
    Operandos[15:8] <= 8'b00000101;
    Operandos[7:0] <= 8'b00000010;   
    #20;
    Control <= 4'b0010;
    Operandos[15:8] <= 8'b00000101;
    Operandos[7:0] <= 8'b00000011;   
    #20;
  end
endmodule
