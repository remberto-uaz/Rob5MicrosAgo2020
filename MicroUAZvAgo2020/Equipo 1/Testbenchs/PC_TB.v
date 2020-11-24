module PC_TB(
);
    reg clk,reset,senal_de_salto;
    reg [7:0] direccion_salto;
    wire [7:0] stack,fetch;

    PC DUT(
        .i_Timming(clk),
        .i_Rst(reset),
        .i_Senal_de_salto(senal_de_salto),
        .i_Direccion_salto(direccion_salto),
        .o_Stack(stack),
        .o_Fetch(fetch)
    );

    initial
    begin
        clk<=0;
        reset<=1;
        senal_de_salto<=0;
        direccion_salto<=0;
        #20 reset<=0;
        #5 clk<=~clk;
        #5 clk<=~clk;
        #5 clk<=~clk;
        #5 clk<=~clk;
        #5 clk<=~clk;
        #5 clk<=~clk;
        #5 clk<=~clk;
        #5 clk<=~clk;
        direccion_salto<=8'b00011111;
        senal_de_salto<=~senal_de_salto;
        #5 clk<=~clk;
        #5 clk<=~clk;
        senal_de_salto<=~senal_de_salto;
        #5 clk<=~clk;
        #5 clk<=~clk;
        #5 clk<=~clk;
        #5 clk<=~clk;
        #5 clk<=~clk;
        
    end
    
    always@(clk) begin
        #5 clk<=~clk;
    end


endmodule