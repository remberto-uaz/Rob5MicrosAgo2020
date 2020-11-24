module MUX_TB(
);
    reg [1:0] selector_de_entrada_a_registros;
    reg [7:0] resultado,bus_Datos;
    reg [7:0] direccionamiento_inmediato,senal_a_stack;
    wire [7:0] datos;

    MUX DUT(
        .i_Selector_de_entrada_a_registros(selector_de_entrada_a_registros),
        .i_Resultado(resultado),
        .i_Direccionamiento_inmediato(direccionamiento_inmediato),
        .i_Bus_Datos(bus_Datos),
        .i_Senal_a_stack(senal_a_stack),
        .o_Datos(datos)
    );

    initial
    begin
        selector_de_entrada_a_registros<=2'b00;
        resultado<=8'b11001110;
        direccionamiento_inmediato<=8'b00000001;
        bus_Datos<=8'b11010101;
        senal_a_stack<=8'b11111111;
        #5 selector_de_entrada_a_registros<=2'b01;
        #5 selector_de_entrada_a_registros<=2'b10;
        #5 selector_de_entrada_a_registros<=2'b11;

    end



endmodule