`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: UAZ
// Engineer: Juan Bernardo Esparza Luevano
// 
// Create Date: 08.11.2020 13:22:25
// Design Name: 
// Module Name: Control
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


module Control(
    input [2:0] Inst,
    input [1:0] COND,
    output reg SEL_R,
    output reg [2:0] SELEC,
    output reg DONE,
    output reg [1:0] HAB
    );
    
    always @(Inst, COND, SEL_R, SELEC, DONE, HAB)
    begin
        case(Inst)
        3'b001:
        begin
            SEL_R <= 0;
            SELEC <= 001;
            DONE <= 1;
            HAB <= 00;
        end
       
        3'b010:
        begin
            SEL_R <= 1;
            SELEC <= 011;
            DONE <= 1;
            HAB <= 00;
        end
        
        3'b011:
        begin
            SEL_R <= 0;
            SELEC <= 101;
            DONE <= 1;
            HAB <= 00;
        end
        
        3'b100:
        begin
            SEL_R <= 0;
            SELEC <= 110;
            DONE <= 1;
            HAB <= 00;
        end
        
        3'b101:
        begin
            SEL_R <= 0;
            SELEC <= 010;
            DONE <= 1;
            HAB <= 00;
        end
        
        3'b110:
        begin
            SEL_R <= 0;
            SELEC <= 000;
            DONE <= 1;
            HAB <= 01;
        end
        
        3'b111:
        begin
            case(COND)
                2'b01:
                begin
                    SEL_R <= 0;
                    SELEC <= 000;
                    DONE <= 1;
                    HAB <= 10;
                end
                2'b11:
                begin
                    SEL_R <= 0;
                    SELEC <= 000;
                    DONE <= 1;
                    HAB <= 11;
                end
                default:
                begin
                    SEL_R <= 0;
                    SELEC <= 000;
                    DONE <= 0;
                    HAB <= 00;
                end
            endcase
        end
        
        default:
        begin
            SEL_R <= 0;
            SELEC <= 000;
            DONE <= 0;
            HAB <= 00;
        end
        endcase
    end
endmodule
