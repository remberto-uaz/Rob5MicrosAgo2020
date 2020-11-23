//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.11.2020 05:21:13
// Design Name: 
// Module Name: Control_TB
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


module Control_TB(
    );
    
   // reg Clk;
   // reg Rst;
    reg [8:0] Instrucciones;
    wire PC;
    wire Registros;
    wire [3:0] ALU;
    wire [4:0] Direccionamiento;
    wire [3:0] Saltos;
    
    Control DUT (
     //   .i_Clk(Clk),
       // .i_Rst(Rst),
        .i_Instrucciones(Instrucciones),
        .o_Control_PC(PC),
        .o_Control_Registros(Registros),
        .o_Control_ALU(ALU),
        .o_Control_Direccionamiento(Direccionamiento),
        .o_Control_Saltos(Saltos)
    );
    
    initial begin
       // Clk<=0;
      //  Rst<=1;
        Instrucciones<=9'b010100101;
        #20; //Rst<=0;
        
        Instrucciones<=9'b010100101;
        #20; 
        Instrucciones<=9'b100010101;
        #20; 
        Instrucciones<=9'b111000110;
        #20; 
        Instrucciones<=9'b110010100;
        #20;
        Instrucciones<=9'b000111111;
        #20;
    end
    
 //   always@(Clk) begin
   //     #5 Clk <= ~Clk;
  //  end    
endmodule