module Controlador_Display_7_seg_TB(
	);
	reg clk,rst;
	reg [3:0] Datos1,Datos2,Datos3,Datos4;
	wire [3:0] Anodos;
	wire [6:0] Segmentos;
	Controlador_Display_7_seg DUT(
		.i_Clk(clk),
		.i_Rst(rst),
		.i_Datos1(Datos1),
		.i_Datos2(Datos2),
		.i_Datos3(Datos3),
		.i_Datos4(Datos4),
		.o_Anodo(Anodos),
		.o_Segmentos(Segmentos)
	);
	initial
	begin
		clk<=0;
		rst<=1;
		Datos1<=12;
		Datos2<=10;
		Datos3<=15;
		Datos4<=14;
		#20 rst<=0;
	end
	always@(clk) begin
		#5 clk<=~clk;
	end
endmodule
