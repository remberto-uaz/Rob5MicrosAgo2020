`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.11.2020 20:04:03
// Design Name: 
// Module Name: ALU
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


module ALU(
input [7:0] x_k,
input [7:0] x_i,
input [2:0] f,
input Math,
output [7:0] Resultado,
output [2:0] Ban_PC
    );
    

reg [7:0] R0 = 0;  

always @(*)
begin
case(Math)
1'b0:
R0=x_k;

1'b1:

case(f)
 0: R0 = (x_k + x_i) ;
 1: R0 = (x_k - x_i) ;
 2: R0 = (x_k << x_i) ;
 3: R0 = (x_k >> x_i) ;
 4: R0 =~ x_i;
 5: R0 = (x_k & x_i) ;
 6: R0 = (x_k | x_i) ;
 7: R0 = (x_k ^ x_i) ;
endcase

endcase
end

assign Resultado = R0;
assign Ban_PC[0] = &(~R0);     //Cero
assign Ban_PC[1] = R0[8];    //Acarreo
assign Ban_PC[2] = R0[7];    //Negativo


endmodule
