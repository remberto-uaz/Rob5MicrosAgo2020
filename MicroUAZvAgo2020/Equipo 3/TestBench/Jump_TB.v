`timescale 1ns / 1ps

module Jump_TB(
    );

    reg [2:0] FLAG_OUT;
    reg [2:0] RY;
    wire [1:0] COND;
    
    Jump DUT(
        .FLAG_OUT(FLAG_OUT),
        .RY(RY),
        .COND(COND)
    );
    
    initial
        begin
            FLAG_OUT  <= 3'b000; RY <= 3'b000;
            #10 FLAG_OUT  <= 3'b000; RY <= 3'b001;
            #10 FLAG_OUT  <= 3'b100; RY <= 3'b010;
            #10 FLAG_OUT  <= 3'b001; RY <= 3'b011;
            #10 FLAG_OUT  <= 3'b010; RY <= 3'b100;
            #10 FLAG_OUT  <= 3'b101; RY <= 3'b101;
            #10 FLAG_OUT  <= 3'b001; RY <= 3'b110;
            #10 FLAG_OUT  <= 3'b000; RY <= 3'b111;
            
            #10 FLAG_OUT  <= ~3'b000; RY <= 3'b000;
            #10 FLAG_OUT  <= ~3'b000; RY <= 3'b001;
            #10 FLAG_OUT  <= ~3'b100; RY <= 3'b010;
            #10 FLAG_OUT  <= ~3'b001; RY <= 3'b011;
            #10 FLAG_OUT  <= ~3'b010; RY <= 3'b100;
            #10 FLAG_OUT  <= ~3'b101; RY <= 3'b101;
            #10 FLAG_OUT  <= ~3'b001; RY <= 3'b110;
            #10 FLAG_OUT  <= ~3'b000; RY <= 3'b111;
        end
endmodule
