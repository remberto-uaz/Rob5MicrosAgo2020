`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: UAZ
// Engineer: Juan Bernardo Esparza Luevano
// 
// Create Date: 03.11.2020 13:48:33
// Design Name: 
// Module Name: Seg
// Project Name: Microprocesador
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


module Seg(
    input [8:0] Instruction,
    output reg [2:0] Inst,
    output reg [2:0] RX,
    output reg [2:0] RY
    );
  
  always@(Instruction)
  begin
  

  Inst <= Instruction[8:6];
  RX <= Instruction[5:3];
  RY <= Instruction[2:0];
    
  end
endmodule
