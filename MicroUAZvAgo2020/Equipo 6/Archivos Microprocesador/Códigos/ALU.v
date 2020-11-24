//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.11.2020 00:59:45
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
    input [3:0] i_Control_ALU,
    input [15:0] i_Operandos,
    output [7:0] o_Resultado,
    output [2:0] o_Banderas_Estado
    );
    
    reg signed [8:0] Resultado = 0;
    wire signed [7:0]op1;
    wire signed [7:0]op2;
	wire [2:0] Operacion;
	wire Control;
	wire Z;
	wire N;
	wire C;
	
	assign Control = i_Control_ALU[3];
	assign Operacion = i_Control_ALU[2:0];
    assign op1 = i_Operandos[7:0];
    assign op2 = i_Operandos[15:8]; 
    
always @(i_Control_ALU or Operacion or op1 or op2) 
begin
	if (Control) 
	begin
		case (Operacion)
			3'b000: Resultado <= op1 + op2;
			3'b001: Resultado <= op1 - op2;
			3'b010: Resultado <= op1 << op2;
			3'b011: Resultado <= op1 >> op2;
			3'b100: Resultado <= ~op2;
			3'b101: Resultado <= op1 & op2;
			3'b110:	Resultado <= op1 | op2;
			default: Resultado <= op1 ^ op2; 
		endcase
	end
	else
		Resultado <= Resultado;
end

assign Z = (Resultado == 0) ? 1'b1 : 1'b0;
assign N = (Resultado[8] == 1) ? 1'b1 : 1'b0;
assign C = (Resultado[8] == Resultado[7]) ? 1'b0 : 1'b1;

assign o_Resultado = Resultado[7:0];
assign o_Banderas_Estado = {Z, N, C};

endmodule