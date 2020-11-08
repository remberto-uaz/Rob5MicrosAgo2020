`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: UAZ
// Engineer: Juan Bernardo Esparza Luevano
// 
// Create Date: 03.11.2020 17:59:44
// Design Name: 
// Module Name: Registros
// Project Name: Microprosesador
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
    input reset,
    input clk,
    input [1:0] HAB,
    input [2:0] RZ,
    input [2:0] RX,
    input [2:0] RY,
    input [7:0] DATO,
    input [7:0] RESUL,
    input [7:0] PC_VAL,
    output reg [7:0] RY_DATO,
    output reg [7:0] RX_DATO,
    output reg [7:0] R0_DATO
    );
    
    reg [7:0] R0;
    reg [7:0] R1;
    reg [7:0] R2;
    reg [7:0] R3;
    reg [7:0] R4;
    reg [7:0] R5;
    reg [7:0] R6;
    reg [7:0] R7;
    
    always @(posedge reset, posedge clk, HAB, RX, RZ, RY, DATO, RESUL, PC_VAL, RY_DATO, RX_DATO, R0_DATO)
        begin
            if(reset == 1)
            begin
                RY_DATO <= 7'b00000000;
                RX_DATO <= 7'b00000000;
                R0_DATO <= 7'b00000000;
            end
           
            else
            begin
                case(RX)
                    3'b000:
                    begin
                        RX_DATO <= R0;
                    end
                    3'b001:
                    begin 
                        RX_DATO <= R1;
                    end
                        
                    3'b010:
                    begin
                        RX_DATO <= R2;
                    end
                        
                    3'b011:
                    begin
                        RX_DATO <= R3;
                    end
                        
                    3'b100:
                    begin
                        RX_DATO <= R4;
                    end
                        
                    3'b101:
                    begin
                        RX_DATO <= R5;
                    end
                        
                    3'b110:
                    begin
                        RX_DATO <= R6;
                    end
                        
                    3'b111:
                    begin
                        RX_DATO <= R7;
                    end
                        
                    default:
                    begin
                        RX_DATO <= 8'b00000000;
                    end
                endcase
                
                case(RY)
                    3'b000:
                    begin
                        RY_DATO <= R0;
                    end
                    
                    3'b001:
                    begin 
                        RY_DATO <= R1;
                    end
                                            
                    3'b010:
                    begin
                        RY_DATO <= R2;
                    end
                                            
                    3'b011:
                    begin
                        RY_DATO <= R3;
                    end
                                            
                    3'b100:
                    begin
                        RY_DATO <= R4;
                    end
                                            
                    3'b101:
                    begin
                        RY_DATO <= R5;
                    end
                                            
                    3'b110:
                    begin
                        RY_DATO <= R6;
                    end
                                            
                    3'b111:
                    begin
                        RY_DATO <= R7;
                    end
                                            
                    default:
                    begin
                        RY_DATO <= 8'b00000000;
                    end
                endcase
                
                R0_DATO <= R0;
                
                if(HAB == 2'b01)
                begin
                    R0 <= RESUL;
                end
                
                else if(HAB == 2'b11)
                begin
                    R7 <= PC_VAL;
                end
                
                else
                begin
                    case(RZ)
                        3'b000:
                        begin
                            R0 <= DATO;
                        end
                        
                        3'b010:
                        begin
                            R2 <= DATO;
                        end
                        
                        3'b011:
                        begin
                            R3 <= DATO;
                        end
                        
                        3'b100:
                        begin
                            R4 <= DATO;
                        end
                        
                        3'b101:
                        begin
                            R5 <= DATO;
                        end
                        
                        3'b110:
                        begin
                            R6 <= DATO;
                        end
                        
                        3'b111:
                        begin
                            R7 <= DATO;
                        end
                        
                        default:
                        begin
                            R1 <= DATO;
                        end
                    endcase
                end
                
            end
        end
endmodule
