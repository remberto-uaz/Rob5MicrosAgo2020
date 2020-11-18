`timescale 1ns / 1ps

module ALU_TB(
    );
    reg [7:0] RX_DATO;
    reg [7:0] R0_DATO;
    reg [2:0] RY;
    wire [2:0] FLAG_IN;
    wire [7:0] RESUL;
    
    ALU DUT(
    .RX_DATO(RX_DATO),
    .R0_DATO(R0_DATO),
    .RY(RY),
    .FLAG_IN(FLAG_IN),
    .RESUL(RESUL)
    );
    initial
        begin
            RY <= 3'b000; RX_DATO <= 8'b00000000; R0_DATO <= 8'b00000000;
            #10 RY <= 3'b000; RX_DATO <= 8'b00000001; R0_DATO <= 8'b00000011;
            #10 RY <= 3'b001; RX_DATO <= 8'b00000111; R0_DATO <= 8'b00000011;
            #10 RY <= 3'b010; RX_DATO <= 8'b00001000; R0_DATO <= 8'b00000001;
            #10 RY <= 3'b011; RX_DATO <= 8'b00101010; R0_DATO <= 8'b00000111;
            #10 RY <= 3'b100; RX_DATO <= 8'b11111110; R0_DATO <= 8'b00000111;
            #10 RY <= 3'b101; RX_DATO <= 8'b00001111; R0_DATO <= 8'b11111111;
            #10 RY <= 3'b110; RX_DATO <= 8'b10101010; R0_DATO <= 8'b01010101;
            #10 RY <= 3'b111; RX_DATO <= 8'b00001111; R0_DATO <= 8'b11111111;
        end
endmodule
