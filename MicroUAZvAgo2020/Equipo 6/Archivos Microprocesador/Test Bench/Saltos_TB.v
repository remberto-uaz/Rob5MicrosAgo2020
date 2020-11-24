//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.11.2020 05:59:28
// Design Name: 
// Module Name: Saltos_TB
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


module Saltos_TB(
    );
    reg [3:0] Control;
    reg [2:0] Estado;
    wire [1:0] PC;
    
    Saltos DUT (
        .i_Control_Salto(Control),
        .i_BanEstado(Estado),
        .o_Salto_PC(PC)
    );
    
    initial begin
        Control<=4'b0000; 
        Estado<=3'b000;
        #20; 
        Control<=4'b0001; 
        Estado<=3'b001;
        #20; 
        Control<=4'b0010; 
        Estado<=3'b010;
        #20; 
        Control<=4'b0011; 
        Estado<=3'b011;
        #20; 
        Control<=4'b0100; 
        Estado<=3'b100;
        #20; 
        Control<=4'b0101; 
        Estado<=3'b101;
        #20; 
        Control<=4'b0110; 
        Estado<=3'b110;
        #20; 
        Control<=4'b0111; 
        Estado<=3'b111;
        #20; 
        Control<=4'b1000; 
        Estado<=3'b000;
        #20; 
        Control<=4'b1001; 
        Estado<=3'b001;
        #20; 
        Control<=4'b1010; 
        Estado<=3'b010;
        #20; 
        Control<=4'b1011; 
        Estado<=3'b001;
        #20; 
        Control<=4'b1100; 
        Estado<=3'b100;
        #20; 
        Control<=4'b1101; 
        Estado<=3'b010;
        #20; 
        Control<=4'b1110; 
        Estado<=3'b001;
        #20; 
        Control<=4'b1111; 
        Estado<=3'b010;
        #20;
    end
    
    
endmodule
