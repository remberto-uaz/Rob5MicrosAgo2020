//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.11.2020 08:17:28
// Design Name: 
// Module Name: PC_TB
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


module PC_TB(
    );
    reg Clk;
    reg Rst;
    reg Control;    
    reg [1:0] Saltos;
    reg [7:0] Direccion_Salto;
    wire [7:0] Direccion_Instrucciones;
    wire [7:0] Direccion_PC;
    
    PC DUT(
        .i_Clk(Clk),
        .i_Rst(Rst),
        .i_Control_PC(Control),
        .i_Control_Saltos(Saltos),
        .i_Direccion_Salto(Direccion_Salto),
        .o_Direccion_Instrucciones(Direccion_Instrucciones),
        .o_Direccion_PC(Direccion_PC)
    );
    
initial
begin
    Clk<=0;
    Rst<=1;
    Control<=1'b1; Saltos<=2'b00; Direccion_Salto<=8'b00000001;
    #20 Rst<=0;
    Control<=1'b1; Saltos<=2'b00; Direccion_Salto<=8'b00000001;
	#20; 
	Control<=1'b1; Saltos<=2'b10; Direccion_Salto<=8'b11111111;
	#20; 
	Control<=1'b1; Saltos<=2'b01; Direccion_Salto<=8'b01111000;
    #20; 
    Control<=1'b0; Saltos<=2'b00; Direccion_Salto<=8'b01010101;
    #20; 
    Control<=1'b0; Saltos<=2'b01; Direccion_Salto<=8'b11111111;
    #20; 
    Control<=1'b0; Saltos<=2'b10; Direccion_Salto<=8'b10101011;
	#20;
	Control<=1'b1; Saltos<=2'b00; Direccion_Salto<=8'b01010101;
	#20;
end

always@(Clk)
  #5 Clk <= ~Clk;
    
endmodule
