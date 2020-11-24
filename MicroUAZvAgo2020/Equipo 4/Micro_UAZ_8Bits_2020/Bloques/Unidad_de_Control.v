module Unidad_de_Control(
	input [8:0] i_Instricciones,
	output reg E_N,
    output reg [2:0] R_W,
    output reg [2:0] Selec,
    output reg [2:0] Num,
    output reg [3:0] Condicion,
    output reg [3:0] Operacion,
	output reg [1:0] Control_Salida,
	output reg [5:0] RegXY
);


always @(i_Instricciones)begin
			case(i_Instricciones[8:6] ) //Evalua la instruccion a realizar
				3'b001: begin // LOAD Num
					E_N <= 1;
					R_W <= i_Instricciones[5:3];
					Selec <= 3'b010;
					Num <= i_Instricciones[2:0];
					Condicion <= 4'b0000;
					Operacion <= 4'b0000;
					Control_Salida <= 2'b00;
					RegXY <= 6'b000000;
				end
				3'b010: begin //LOAD EN RX
					E_N <= 1;
					R_W <= i_Instricciones[5:3];
					Selec <= 3'b001;
					Num <= 3'b000;
					Condicion <= 4'b0000;
					Operacion <= 4'b0000;
					Control_Salida <= 2'b01;
					RegXY[5:3] <= 3'b000;
					RegXY[2:0] <= i_Instricciones[2:0];
				end
				3'b011: begin // STORE Num
					E_N <= 0;
					R_W <= 3'b000;
					Selec <= 3'b111;
					Num <= i_Instricciones[2:0];
					Condicion <= 4'b0000;
					Operacion <= 4'b0000;
					Control_Salida <= 2'b10;
					RegXY[5:3] <= i_Instricciones[5:3];
					RegXY[2:0] <= 3'b000;
				end
				3'b100: begin //STORE [RY] en RX
					E_N <= 0;
					R_W <= 3'b000;
					Selec <= 3'b111;
					Num <= 3'b000;
					Condicion <= 4'b0000;
					Operacion <= 4'b0000;
					Control_Salida <= 2'b11;
					RegXY <= i_Instricciones[5:0];
				end
				3'b101: begin // Move
					E_N <= 1;
					R_W <= i_Instricciones[5:3];
					Selec <= 3'b100;
					Num <= 3'b000;
					Condicion <= 4'b0000;
					Operacion <= 4'b0000;
					Control_Salida <= 2'b00;
					RegXY[5:3] <= 3'b000;
					RegXY[2:0] <= i_Instricciones[2:0];
				end
				3'b110: begin //Math
					E_N <= 1;
					R_W <= 3'b000;
					Selec <= 3'b011;
					Num <= 3'b000;
					Condicion <= 4'b0000;
					Operacion[2:0] <= i_Instricciones[2:0];
					Operacion[3] <= 1;
					Control_Salida <= 2'b00;
					RegXY[5:3] <= i_Instricciones[5:3];
					RegXY[2:0] <= 3'b000;
				end
				3'b111: begin  //Jump
					//E_N <= 0;
					R_W <= 3'b111;
					Num <= 3'b000;
					Condicion[2:0] <= i_Instricciones[2:0];
					Condicion[3] <= 1;
					Operacion <= 4'b0000;
					Control_Salida <= 2'b00;
					RegXY[5:3] <= i_Instricciones[5:3];
					RegXY[2:0] <= 3'b000;
						if (i_Instricciones[2:0] == 2'b001)begin
							E_N <= 1;
							Selec <= 0;
					    end
						else begin
     						E_N <= 0;
     						Selec <= 7;
     					end
				end
				default begin  //NO Operacion
					E_N <= 0;
					R_W <= 3'b000;
					Selec <= 3'b111;
					Num <= 3'b000;
					Condicion <= 4'b0000;
					Operacion <= 4'b0000;
					Control_Salida <= 2'b00;
					RegXY <= 6'b000000;
				end
			endcase	
		end
endmodule