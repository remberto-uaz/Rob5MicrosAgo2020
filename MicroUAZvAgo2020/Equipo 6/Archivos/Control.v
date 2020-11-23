//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.11.2020 22:25:06
// Design Name: 
// Module Name: Control
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


module Control(
    input [8:0] i_Instrucciones,
  //  input i_Rst,
   // input i_Clk,
    output o_Control_PC,
    output o_Control_Registros,
    output [3:0] o_Control_ALU,
    output [4:0] o_Control_Direccionamiento,
    output [3:0] o_Control_Saltos
    );
    
    wire [2:0] c_in;
    wire [2:0] c_reg;
    wire [2:0] c_arg;
    wire PC;
    wire Registros;
    wire [3:0] ALU;
    wire [4:0] Direccionamiento; 
    wire [3:0] Saltos;
    
    assign c_in = i_Instrucciones [8:6];
    assign c_reg = i_Instrucciones [5:3];
    assign c_arg = i_Instrucciones [2:0];
    assign o_Control_PC = PC;
    assign o_Control_Registros = Registros;
    assign o_Control_ALU = ALU;
    assign o_Control_Direccionamiento = Direccionamiento;
    assign o_Control_Saltos = Saltos;
    
 assign Direccionamiento = (c_in == 3'b010) ? {2'b01, c_arg} : 
                           (c_in == 3'b011) ? {2'b10, c_arg} :
                           (c_in == 3'b100) ? {2'b11, c_arg} : 5'b0;
 
 assign PC = (c_in == 3'b111) ? 1'b0 : 1'b1;
 
 assign Registros = (c_in == 3'b110) ? 1'b1 : 1'b0;
 
 assign ALU = (c_in == 3'b110) ? {1'b1,c_arg} : 
              (c_in == 3'b000) ? 4'b0 : {1'b0,c_arg};

 
 assign Saltos = (c_in == 3'b111) ? {1'b1,c_arg} : 
                 (c_in == 3'b000) ? 4'b0 : {1'b0,c_arg};

    
/*always @(negedge i_Clk)
begin 

    if(i_Rst) begin
        PC <= 0;
        ALU <=0;
        Direccionamiento <= 0;
        Saltos <=0;
        Registros <= 0;
    end
    else begin 
        case (c_in)
            3'b001:begin
                Direccionamiento <= {2'b00,c_arg};
                ALU <= {1'b0,c_arg};
                Saltos <= {1'b0, c_arg};
                PC <=1'b1;
                Registros <= 1'bz;
            end
            3'b010:begin
                Direccionamiento <= {2'b01,c_arg};
                ALU <= {1'b0,c_arg};
                Saltos <= {1'b0, c_arg};
                PC <=1'b1;
                Registros <= 1'bz;
            end
            3'b011:begin
                Direccionamiento <= {2'b10,c_arg};
                ALU <= {1'b0,c_arg};
                Saltos <= {1'b0, c_arg};
                PC <=1'b1;
                Registros <= 1'bz;
            end
            3'b100:begin
                Direccionamiento <= {2'b11,c_arg};
                ALU <= {1'b0,c_arg};
                Saltos <= {1'b0, c_arg};
                PC <=1'b1;
                Registros <= 1'bz;
            end
            3'b101:begin
               Direccionamiento <= {2'b00,c_arg};
                ALU <= {1'b0,c_arg};
                Saltos <= {1'b0, c_arg};
                PC <=1'b1;
                Registros <= 1'bz;
            end
            3'b110:begin
                Direccionamiento <= {2'b00,c_arg};
                ALU <= {1'b1,c_arg};
                Saltos <= {1'b0, c_arg};
                PC <=1'b1;
                Registros <= 1'b1;
            end
            3'b111:begin
                Direccionamiento <= {2'b00,c_arg};
                ALU <= {1'b0,c_arg};
                Saltos <= {1'b1, c_arg};
                PC <=1'b0;
                Registros <= 1'b0;
            end
            default: begin
               // Direccionamiento <= 5'b0;
                ALU <= 4'b0;
              //  Saltos <= 4'b0;
               // PC <=1'b1;
                Registros <= 1'bz;
            end
        endcase
    end
end*/

//assign PC = (c_in == 3'b111) ? 1'b0 : 1'b1;
 
/*always@(negedge i_Clk)
begin
    if (i_Rst) begin
        Direccionamiento <= 0;
    end
    else begin
        case(c_in)
            3'b010: Direccionamiento <= {2'b01, c_arg};
            3'b011: Direccionamiento <= {2'b10, c_arg};
            3'b100: Direccionamiento <= {2'b11, c_arg};
            default: Direccionamiento <= 5'b0;
        endcase
    end
 end*/
/*assign Direccionamiento = (c_in == 3'b010) ? {2'b01, c_arg} : 
                          (c_in == 3'b011) ? {2'b10, c_arg} :
                          (c_in == 3'b100) ? {2'b11, c_arg} : 5'b0;*/
/*always@(negedge i_Clk)
    begin
        if (i_Rst) begin
            Direccionamiento <= 0;
        end
        else begin
            if (c_in == 3'b111)begin
                PC <= 1'b0;
                Saltos <= {1'b1, c_arg};
            end
            else begin
                PC <= 1'b1;
                Saltos <= {1'b0,c_arg};
            end
        end 
    end*/
endmodule



