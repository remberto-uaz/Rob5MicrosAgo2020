module preescalador
    #(parameter n=4,
    parameter lim=100000)
    (   input i_Clk,
        input i_Reset,
        output o_H);
    
    reg [n-1:0] cta_i;

    always@(negedge i_Rst, posedge i_Clk) begin
        if (!Rst_n) begin
            cta_i<=0;
        end else begin
            o_H<=0;
            cta_i=cta_i+1;
            if (cta_i==lim) begin
                o_H<=1;
                cta_i<=0;
            end
        end
    end

endmodule