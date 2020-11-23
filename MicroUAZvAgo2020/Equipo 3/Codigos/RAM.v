`timescale 1ns / 1ps

module RAM(
    input clk,
    input RW,
    input [7:0] Address_Data_Bus,
    input [7:0] DataOut_Bus,
    output[7:0] DataIn_Bus
    );
    
    reg [7:0] memRAM[0:255];
    assign DataIn_Bus = memRAM[Address_Data_Bus];
    initial
        $readmemh("RAM.mem",memRAM);  
        always @(posedge clk)
            begin
                if(RW == 1) 
                    memRAM[Address_Data_Bus] <= DataOut_Bus;
            end            
endmodule