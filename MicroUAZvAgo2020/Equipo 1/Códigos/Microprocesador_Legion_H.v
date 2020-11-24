//La finalidad de este modulo es reunir los componentes e interconectarlos
//para crear el sistema final, asi como agregar sus entradas y salidas
//Funge como parte top del sistema
module Microprocesador_Legion_H
    (   input i_Clk,
        input i_Rst,
        input [8:0] i_Instrucciones,
        input [7:0] i_Bus_Datos,
        input [31:0] i_Frec_de_trabajo,
        output [7:0] o_Direcciones_Instrucciones,
        output [7:0] o_Direcciones_Datos,
        output [7:0] o_Bus_Datos,
        output o_Lectura_Escritura);
        

    wire Timming;
    wire Hab;
    wire Senal_de_salto;
    wire [7:0] Senal_a_stack;
    wire [7:0] Direccionamiento_inmediato;
    wire [5:0] Operandos;
    wire [2:0] Operation_code;
    wire [2:0] Senal_de_control;
    wire [7:0] RX;
    wire [7:0] RY;
    wire [7:0] Resultado;
    wire [2:0] Bandera;
    wire [7:0] Datos;
    wire [1:0] Lectura_escritura;
    wire [2:0] Control_RX;
    wire [2:0] Control_RY;
    wire [2:0] Seleccion_registro_escritura;
    wire [2:0] Seleccion_registro_lectura;
    wire [2:0] Inst_decodificada;
    wire [1:0] Selector_de_entrada_a_registros;
    // Se declaran las señales internas que conectaran nuestros componentes
    
    //Preescalador
    Preescalador Bloque_1(
        .i_Clk(i_Clk),
        .i_Rst(i_Rst),
        .i_Frec_de_trabajo(i_Frec_de_trabajo),
        .o_Timming(Timming)
    );
    //Se encarga de dividir la frecuencia de entrada para adaptarla a la 
    //frecuencia de funcionamiento de los componentes internos, otorga una 
    //señal lógica cuyo fin será sincronizar los procesos del sistema.
    //De frecuencia variable determinada por i_Frec_de_trabajo


    //PC Counter
    PC Bloque_2(
        .i_Timming(i_Clk),
        .i_Rst(i_Rst),
        .i_Senal_de_salto(Senal_de_salto),
        .i_Direccion_salto(RX),
        .o_Stack(Senal_a_stack),
        .o_Fetch(o_Direcciones_Instrucciones)
    );
    //El PC counter que funge como puntero de instrucciones, se encarga de 
    //registrar e indicar la posición del procesador en la secuencia de 
    //instrucciones e incrementa con cada ciclo de la señal timming, en caso 
    //de romper con la secuencia se ayuda con un registro de stack o pila para 
    //guardar la posición en la que se encontraba para posteriormente volver a
    //ella. 


    //Unidad de control
    Unidad_de_control Bloque_3(
        .i_Timming(i_Clk),
        .i_Rst(i_Rst),
        .i_Bandera(Bandera),
        .i_Operation_code(Operation_code),
        .i_Operandos(Operandos),
        .o_Senal_de_salto(Senal_de_salto),
        .o_Selector_de_entrada_a_registros(Selector_de_entrada_a_registros),
        .o_Lectura_escritura(Lectura_escritura),
        .o_Control_RX(Control_RX),
        .o_Control_RY(Control_RY),
        .o_Seleccion_registro_escritura(Seleccion_registro_escritura),
        .o_Seleccion_registro_lectura(Seleccion_registro_lectura),
        .o_Senal_de_control(Senal_de_control),
        .o_Inst_decodificada(Inst_decodificada),
        .o_Hab(Hab)
    );
    //Decodifica las instrucciones que llegan desde el registro de instrucciones 
    //y actúa conforme al set de instrucciones establecido y coordina las operaciones 
    //en la unidad lógica aritmética, también analiza el estado de las banderas y 
    //conforme a este establece un salto o no en el PC counter o envía una señal para 
    //que se pase algún valor almacenado en el registro al bus de datos para su posterior
    //almacenamiento en memoria 

     
    //Registro de instrucciones
    Registro_de_instrucciones Bloque_4(
        .i_Timming(i_Clk),
        .i_Rst(i_Rst),
        .i_Instrucciones(i_Instrucciones),
        .o_Instruccion(Operation_code),
        .o_Operandos(Operandos),
        .o_Direccionamiento_inmediato(Direccionamiento_inmediato)
    );
    //Este componente permite la decodificación y almacenamiento de la instrucción
    //a ejecutar, la cual proviene del bus de la memoria de instrucciones, también
    //permite la función de direccionamiento inmediato. Es un registro.


    //Registro de datos
    Registro_de_datos Bloque_5(
        .i_Timming(i_Clk),
        .i_Rst(i_Rst),
        .i_Datos(Datos),
        .i_Lectura_escritura(Lectura_escritura),
        .i_Control_RX(Control_RX),
        .i_Control_RY(Control_RY),
        .i_Seleccion_registro_escritura(Seleccion_registro_escritura),
        .i_Seleccion_registro_lectura(Seleccion_registro_lectura),
        .o_RX(RX),
        .o_RY(RY)
    );
    //Este componente permite el almacenamiento de los datos provenientes de la 
    //memoria de datos, guarda los resultados de las operaciones realizadas por
    //la ALU y guarda la dirección previa al salto del PC. Es un registro.


    //Unidad Lógico Aritmética
    ALU Bloque_6(
        .i_Inst_decodificada(Inst_decodificada),
        .i_RX(RX),
        .i_RY(RY),
        .i_Hab(Hab),
        .o_Resultado(Resultado),
        .o_Bandera(Bandera)
    );

    //Manager de salidas a memoria
    Manager_de_salidas_a_memoria Bloque_7(
        .i_Direccionamiento_inmediato(Direccionamiento_inmediato),
        .i_Senal_de_control(Senal_de_control),
        .i_RX(RX),
        .i_RY(RY),
        .o_Direcciones_Datos(o_Direcciones_Datos),
        .o_Bus_Datos(o_Bus_Datos),
        .o_Lectura_Escritura(o_Lectura_Escritura)
    );
    //Este componente permite seleccionar los datos que se pasarán al bus de datos
    //de salida a memoria, al bus de direccionamiento y si se realizará un proceso
    //de lectura o escritura en memoria. Es un componente meramente combinacional.


    //Multiplexor
    MUX Bloque_8(
        .i_Selector_de_entrada_a_registros(Selector_de_entrada_a_registros),
        .i_Resultado(Resultado),
        .i_Direccionamiento_inmediato(Direccionamiento_inmediato),
        .i_Bus_Datos(i_Bus_Datos),
        .i_Senal_a_stack(Senal_a_stack),
        .o_Datos(Datos)
    );
    //Este componente permite seleccionar el dato que entrará a los
    //registros de datos. Es meramente combinacional.

endmodule