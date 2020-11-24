`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.11.2020 20:04:03
// Design Name: 
// Module Name: Banco_de_registros
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


module Banco_de_registros(
input [7:0] Resultado,
input Move,
input [7:0] DataIn_Bus,
input Write,
input [7:0] PC_save,
input [2:0] k,
input [2:0] i,
input [2:0] j,
input Clk,
input Reset,
output [7:0] x_k,
output [7:0] x_i
    );
    
reg[7:0] R[0:7];
assign x_k=R[k];
assign x_i=R[i];

always@(posedge Clk)
begin
if(Reset)

begin
R[0]<=0;
R[1]<=0;
R[2]<=0;
R[3]<=0;
R[4]<=0;
R[5]<=0;
R[6]<=0;
R[7]<=0;
end

else
begin

if(Write)
begin
R[k]<= j;
R[i]<= R[i];    
end

else
    
R[7] <= PC_save;
R[0] <= Resultado;
 end
  

if(!Move)
begin 

end
else
R[i] <= R [k];
end


endmodule
