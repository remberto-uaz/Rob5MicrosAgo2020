//Este componente permite seleccionar los datos que se pasarán al bus de datos
//de salida a memoria, al bus de direccionamiento y si se realizará un proceso
//de lectura o escritura en memoria. Es un componente meramente combinacional.
module Manager_de_salidas_a_memoria(
    input [7:0] i_Direccionamiento_inmediato,
    input [2:0] i_Senal_de_control,
    input [7:0] i_RX,
    input [7:0] i_RY,
    output [7:0] o_Direcciones_Datos,
    output [7:0] o_Bus_Datos,
    output o_Lectura_Escritura);

    // Se declaran los registros y las señales internas
    reg [7:0] Direcciones_Datos=0;
    reg [7:0] Bus_Datos=0;
    reg Lectura_Escritura=0;

    //Etapa de implemetacion
    //Se toman en cuenta todas las entradas para la lista de sensitividad
    always@ (*)
    begin
        if (i_Senal_de_control[2]==1) begin
            if (i_Senal_de_control[1]==0) begin
                //Lectura de memoria
                Lectura_Escritura<=0;
                Direcciones_Datos<=i_RY;
            end
            else begin
                //Escritura en memoria
                Lectura_Escritura<=1;
    
                if (i_Senal_de_control[0]==0) begin
                    //Direccionamiento indirecto
                    Direcciones_Datos<=i_RX;
                    Bus_Datos<=i_RY;
                end
                else begin
                    //Direccionamiento inmediato
                    Direcciones_Datos<=i_RX;
                    Bus_Datos<=i_Direccionamiento_inmediato;
                end
            end
        end    
    end

    assign o_Direcciones_Datos=Direcciones_Datos;
    assign o_Bus_Datos=Bus_Datos;
    assign o_Lectura_Escritura=Lectura_Escritura;
endmodule