`timescale 1ns / 1ps

module MuxR_In_TB(
    );
    
    reg [2:0] RY;
    reg [7:0] RY_DATO;
    reg [7:0] DATO_IN;
    reg [2:0] SELEC;
    wire [7:0] DATO;
    
    MuxR_In DUT(
        .RY(RY),
        .RY_DATO(RY_DATO),
        .DATO_IN(DATO_IN),
        .SELEC(SELEC),
        .DATO(DATO)
    );
    
    initial
        begin
            RY <= 3'b000;  RY_DATO <= 8'b00000000; DATO_IN <= 8'b00000000; SELEC <= 3'b000;
            #10 RY <= 3'b101;  RY_DATO <= 8'b10101010; DATO_IN <= 8'b00001111; SELEC <= 3'b001;
            #10 RY <= 3'b101;  RY_DATO <= 8'b10101010; DATO_IN <= 8'b00001111; SELEC <= 3'b010;
            #10 RY <= 3'b101;  RY_DATO <= 8'b10101010; DATO_IN <= 8'b00001111; SELEC <= 3'b011;
        end
endmodule
