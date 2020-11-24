module ALU(
input [7:0] RX,
input [7:0] R0,
input [3:0] Operacion,
output [7:0] Resultado,
output [2:0] Banderas);

reg [8:0] AResultado =0;

always@(RX,Operacion)
begin
    if (Operacion[3] == 1) begin
        case (Operacion[2:0])
            3'b000: begin 
                AResultado <= R0 + RX;
            end
            3'b001: begin 
                AResultado <= R0 - RX; 
            end
            3'b010: begin 
                AResultado[7:0] <= R0 << RX; 
            end
            3'b011: begin 
                AResultado <= R0 >> RX; 
            end
            3'b100: begin 
                AResultado <= ~ RX; 
            end
            3'b101: begin 
                AResultado <= R0 & RX; 
            end
            3'b110: begin 
                AResultado <= R0 | RX; 
            end
            3'b111: begin 
                AResultado <= R0 ^ RX;
            end
        endcase
    end
    else begin
        AResultado <= AResultado;
    end   
end 
    assign Resultado = AResultado[7:0];   
    assign Banderas[0] = &(~AResultado);
    assign Banderas[1] = AResultado[8];
    assign Banderas[2] = AResultado[7];  
endmodule