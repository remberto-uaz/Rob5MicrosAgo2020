module ALU_TB(
);
    reg hab;
    reg [2:0] inst_decodificada;
    reg [7:0] RX,RY;
    wire [7:0] resultado;
    wire [2:0] bandera;

    ALU DUT(
        .i_Inst_decodificada(inst_decodificada),
        .i_RX(RX),
        .i_RY(RY),
        .i_Hab(hab),
        .o_Resultado(resultado),
        .o_Bandera(bandera)
    );

    initial
    begin
        inst_decodificada<=3'b000;
        RX<=8'b00001111;
        RY<=8'b00000001;
        hab<=0;
        #5 hab<=~hab;
        #5 hab<=~hab;
        inst_decodificada<=3'b001;
        RX<=8'b00001111;
        RY<=8'b00000001;
        #5 hab<=~hab;
        #5 hab<=~hab;
        inst_decodificada<=3'b010;
        RX<=8'b00001111;
        RY<=8'b00000001;
        #5 hab<=~hab;
        #5 hab<=~hab;
        inst_decodificada<=3'b011;
        RX<=8'b00001111;
        RY<=8'b00000001;
        #5 hab<=~hab;
        #5 hab<=~hab;
        inst_decodificada<=3'b100;
        RX<=8'b00001111;
        RY<=8'b00000001;
        #5 hab<=~hab;
        #5 hab<=~hab;
        inst_decodificada<=3'b101;
        RX<=8'b00001111;
        RY<=8'b00000001;
        #5 hab<=~hab;
        #5 hab<=~hab;
        inst_decodificada<=3'b110;
        RX<=8'b00001111;
        RY<=8'b00000001;
        #5 hab<=~hab;
        #5 hab<=~hab;
        inst_decodificada<=3'b111;
        RX<=8'b00001111;
        RY<=8'b00000001;
        #5 hab<=~hab;
        #5 hab<=~hab;
        inst_decodificada<=3'b001;
        RX<=8'b00000001;
        RY<=8'b00001111;
        #5 hab<=~hab;
        #5 hab<=~hab;
        inst_decodificada<=3'b001;
        RX<=8'b00000001;
        RY<=8'b00000001;
        #5 hab<=~hab;
        #5 hab<=~hab;
    end



endmodule