`timescale 1ns / 1ps

module RAM_TB(
    );
    reg clk;
    reg RW;
    reg Address_Data_Bus;
    reg DataOut_Bus;
    wire DataIn_Bus;

RAM DUT(
    .clk(clk),
    .RW(RW),
    .Address_Data_Bus(Address_Data_Bus),
    .DataOut_Bus(DataOut_Bus),
    .DataIn_Bus(DataIn_Bus)
);
    initial
        begin
            RW <= 0; Address_Data_Bus <= 8'b00000000;  DataOut_Bus <= 8'b00000000;
            #10 RW <= 1; Address_Data_Bus <= 8'b00000011;  DataOut_Bus <= 8'b00001001;
            #10 RW <= 0; Address_Data_Bus <= 8'b00011011;  DataOut_Bus <= 8'b00110101;
            #10 RW <= 1; Address_Data_Bus <= 8'b11010111;  DataOut_Bus <= 8'b00101100;
        end
    always@(clk)
        #5 clk <= ~clk; 
endmodule