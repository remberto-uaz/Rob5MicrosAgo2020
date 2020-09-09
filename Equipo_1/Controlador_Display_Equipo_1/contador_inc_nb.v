module contador_inc_nb
    #(parameter n=0)
    (   input i_Clk,
        input i_Rst,
        input i_Inc,
        output [n-1:0] o_Cta);
    
    wire [n-1:0] cata_i;

    
    always@(negedge i_Rst, posedge i_Clk) begin
        if (!rst_n) begin
            cta_i<=0;
        end else begin
            if (inc==1) begin
                cta_i<=cta_i+1;
            end
        end
    end
    assign 
        cta=cta_i;
endmodule