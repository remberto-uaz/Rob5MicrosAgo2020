module Banco_de_Registros (
    input Clk,
    input Rst,
	input [7:0] Dat,
	input [5:0] RegXY,
	input [2:0] R_W,
	input E_N,
	output [7:0] RX, 
	output [7:0] RY
);

reg [7:0] Registro[0:7];

	always @(posedge Clk)
	begin
		if(Rst) begin
			Registro[0] <= 0;
			Registro[1] <= 0;
			Registro[2] <= 0;
			Registro[3] <= 0;
			Registro[4] <= 0;
			Registro[5] <= 0;
			Registro[6] <= 0;
			Registro[7] <= 0;
			
		end
		else if(E_N) 
			Registro[R_W] <= Dat;
	end
	assign RX = Registro[RegXY[5:3]];
	assign RY = Registro[RegXY[2:0]];
endmodule