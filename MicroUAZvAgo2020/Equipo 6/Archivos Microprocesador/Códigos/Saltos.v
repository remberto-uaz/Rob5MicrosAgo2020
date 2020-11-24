//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.11.2020 06:21:22
// Design Name: 
// Module Name: Saltos
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


module Saltos(
    input [3:0] i_Control_Salto,
    input [2:0] i_BanEstado,
    output [1:0] o_Salto_PC
    );
    
    wire [3:0] Control;
    wire [2:0] Estado;
    reg [1:0] PC;
    
    assign o_Salto_PC = PC;
    assign Control = i_Control_Salto;
    assign Estado = i_BanEstado;
    
always @(i_Control_Salto or i_BanEstado)
begin 

    if(Control[3]) begin
        case (Control[2:0])
            3'b001:begin
                PC <= 2'b10;
            end
            3'b010:begin
                if(Estado[2]) begin
                    PC <= 2'b01;
                end
                else begin
                    PC <= 2'b00;
                end
            end
            
            3'b011:begin
                if(!Estado[2]) begin
                    PC <= 2'b01;
                end
                else begin
                    PC <= 2'b00;
                end
            end
            
            3'b100:begin
                if(Estado[1]) begin
                    PC <= 2'b01;
                end
                else begin
                    PC <= 2'b00;
                end
            end
            
            3'b101:begin
                if(!Estado[1]) begin
                    PC <= 2'b01;
                end
                else begin
                    PC <= 2'b00;
                end
            end
            
            3'b110:begin
                if(Estado[0]) begin
                    PC <= 2'b01;
                end
                else begin
                    PC <= 2'b00;
                end
            end
            
            3'b111:begin
                if(!Estado[1]) begin
                    PC <= 2'b01;
                end
                else begin
                    PC <= 2'b00;
                end
            end
            
            default: begin
                PC <= 2'b01;
            end
        endcase
    end
	
	else begin
		PC <= 2'b11;
	end
	
end

endmodule
