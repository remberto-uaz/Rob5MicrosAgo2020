module Unidad_de_Saltos (
    input Clk,
    input Rst,
	input [7:0] Direccion_de_Salto,
	input [2:0] Banderas,
	input [3:0] Condicion,
	output reg[7:0] o_Bus_Direcciones_Instrucciones
);

always @(posedge Clk)
begin
	if(Rst) begin
        o_Bus_Direcciones_Instrucciones <= 0;
    end
    else begin   
		if (Condicion[3] == 1) begin
            case (Condicion[2:0])
                3'b000: begin
                    o_Bus_Direcciones_Instrucciones <= Direccion_de_Salto;
                end
                3'b001: begin
                    o_Bus_Direcciones_Instrucciones <= Direccion_de_Salto;
                end
                3'b010: begin //Z
                        if(Banderas[0])
                              o_Bus_Direcciones_Instrucciones <= Direccion_de_Salto;
                        else
                              o_Bus_Direcciones_Instrucciones <= o_Bus_Direcciones_Instrucciones + 1;
                        end
                3'b011: begin //~Z
                        if(~Banderas[0])
                              o_Bus_Direcciones_Instrucciones <= Direccion_de_Salto;
                        else
                              o_Bus_Direcciones_Instrucciones <= o_Bus_Direcciones_Instrucciones + 1;
                        end
                3'b100: begin //C
                        if(Banderas[1])
                              o_Bus_Direcciones_Instrucciones <= Direccion_de_Salto;
                        else
                              o_Bus_Direcciones_Instrucciones <= o_Bus_Direcciones_Instrucciones + 1;
                        end
                3'b101: begin //~C
                        if(~Banderas[1])
                              o_Bus_Direcciones_Instrucciones <= Direccion_de_Salto;
                        else
                              o_Bus_Direcciones_Instrucciones <= o_Bus_Direcciones_Instrucciones + 1;
                        end
                3'b110: begin //N
                        if(Banderas[2])
                              o_Bus_Direcciones_Instrucciones <= Direccion_de_Salto;
                        else
                              o_Bus_Direcciones_Instrucciones <= o_Bus_Direcciones_Instrucciones + 1;
                        end
                3'b111: begin //~N
                        if(~Banderas[2])
                              o_Bus_Direcciones_Instrucciones <= Direccion_de_Salto;
                        else
                              o_Bus_Direcciones_Instrucciones <= o_Bus_Direcciones_Instrucciones + 1;
                        end          
            endcase
		end
		else begin
			o_Bus_Direcciones_Instrucciones <= o_Bus_Direcciones_Instrucciones + 1;
		end
	end
end
endmodule