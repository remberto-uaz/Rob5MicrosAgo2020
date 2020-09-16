module contador_inc_nb
    #(parameter n=8)
    (   input i_Clk,
        input i_Rst,
        input i_Inc,
        output [n-1:0] o_Cta);
    
    reg [n-1:0] cta_i;

    
    always@(negedge i_Rst, posedge i_Clk) begin
        if (!i_Rst) begin
            cta_i<=0;
        end else begin
            if (i_Inc==1) begin
                cta_i<=cta_i+1;
            end
        end
    end
    assign 
        o_Cta=cta_i;
endmodule
