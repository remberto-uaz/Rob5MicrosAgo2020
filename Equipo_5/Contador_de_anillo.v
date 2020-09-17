module Contador_de_anillo(
    input i_Clk,
    input i_Rst,
    output reg [3:0] o_Anodo,
    output reg [1:0] o_Sel);
    
 always @(posedge i_Rst, posedge i_Clk)
    begin
        if(i_Rst) begin
            o_Anodo<= 4'b0001;
            o_Sel<=2'b00;   
        end
        else begin
            case(o_Sel)
                2'b00: begin
                    o_Anodo<= 4'b0001;
                    o_Sel<=o_Sel+1;
                end
               
