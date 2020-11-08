`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.11.2020 17:50:28
// Design Name: 
// Module Name: MuxR_In
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


module MuxR_In(
    input [2:0] RY,
    input [7:0] RY_DATO,
    input [7:0] DATO_IN,
    input [2:0] SELEC,
    output reg [7:0] DATO
    );
    
    always@* begin
        case(SELEC)
            3'b001: DATO<={5'b0,RY};
            3'b010: DATO<=RY_DATO;
            3'b011: DATO<=DATO_IN;
            default: DATO<=0;
        endcase
    end
    
    
endmodule
