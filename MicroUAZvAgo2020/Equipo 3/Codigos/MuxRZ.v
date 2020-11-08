`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.11.2020 17:42:52
// Design Name: 
// Module Name: MuxRZ
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


module MuxRZ(
    input [2:0] RX,
    input [2:0] RY,
    input SEL_R,
    output reg [2:0] RZ
    );
    
    always@* begin
        if(SEL_R)
            RZ<=RY;
        else
            RZ<=RX;
    end
endmodule
