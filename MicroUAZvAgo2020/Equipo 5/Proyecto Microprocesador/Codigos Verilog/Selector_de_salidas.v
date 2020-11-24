`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.11.2020 20:04:03
// Design Name: 
// Module Name: Selector_de_salidas
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


module Selector_de_salidas(
input [7:0] x_i,
input [2:0] k,
input Sel_out,
input Clk,
input Reset,
output [7:0] DataOut_Bus,
output [7:0] Adress_Data_Bus
    );
  
reg [7:0] DataOut_Bus_i;
reg [7:0] Adress_Data_Bus_i;
reg [7:0] aux;

always@(posedge Clk)
begin
 if (Reset)
 begin
 aux<=0;
 end
 else
 case(Sel_out)

 0: aux<=x_i;
 1: aux<=k;
 
 default: aux<=0;

 endcase

end
always@(posedge Clk)
begin
 if (Reset)
 begin
 DataOut_Bus_i<=0; 
 Adress_Data_Bus_i<=0; 
 end
 else
 
begin
 DataOut_Bus_i<=aux;
 Adress_Data_Bus_i<= k;
 end

end    

assign DataOut_Bus = DataOut_Bus_i;
assign Adress_Data_Bus = Adress_Data_Bus_i;
    
endmodule
