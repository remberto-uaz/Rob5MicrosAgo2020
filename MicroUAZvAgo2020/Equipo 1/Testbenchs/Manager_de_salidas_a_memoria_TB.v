module Manager_de_salidas_a_memoria_TB(
);
    reg [7:0] direccionamiento_inmediato;
    reg [2:0] senal_de_control;
    reg [7:0] RX,RY;
    wire [7:0] direcciones_Datos;
    wire [7:0] bus_Datos;
    wire lectura_Escritura;

    Manager_de_salidas_a_memoria DUT(
        .i_Direccionamiento_inmediato(direccionamiento_inmediato),
        .i_Senal_de_control(senal_de_control),
        .i_RX(RX),
        .i_RY(RY),
        .o_Direcciones_Datos(direcciones_Datos),
        .o_Bus_Datos(bus_Datos),
        .o_Lectura_Escritura(lectura_Escritura)
    );

    initial
    begin
        direccionamiento_inmediato<=8'b11110000;
        senal_de_control<=3'b000;
        RX<=8'b11001110;
        RY<=8'b11111111;
        #5 senal_de_control<=3'b100;
        #5 senal_de_control<=3'b110;
        #5 senal_de_control<=3'b111;

    end

endmodule