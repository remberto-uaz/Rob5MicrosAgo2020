//Este componente permite el almacenamiento de los datos provenientes de la 
//memoria de datos, guarda los resultados de las operaciones realizadas por
//la ALU y guarda la direccion previa al salto del PC. Es un registro.
module Registro_de_datos(
    input i_Timming,
    input i_Rst,
    input [7:0] i_Datos,
    input [1:0] i_Lectura_escritura,
    input [2:0] i_Control_RX,
    input [2:0] i_Control_RY,
    input [2:0] i_Seleccion_registro_escritura,
    input [2:0] i_Seleccion_registro_lectura,
    output [7:0] o_RX,
    output [7:0] o_RY);
    
    // Se declaran los registros y las senales internas
    reg [7:0] R0;
    reg [7:0] R1;
    reg [7:0] R2;
    reg [7:0] R3;
    reg [7:0] R4;
    reg [7:0] R5;
    reg [7:0] R6;
    reg [7:0] R7;
    reg [7:0] RX;
    reg [7:0] RY;

    

    //Etapa de implemetacion
    always@(posedge i_Rst, posedge i_Timming)
    begin
        if (i_Rst) begin//El reset es sincrono
            R0 <= 8'b00000000;
            R1 <= 8'b00000000;
            R2 <= 8'b00000000;
            R3 <= 8'b00000000;
            R4 <= 8'b00000000;
            R5 <= 8'b00000000;
            R6 <= 8'b00000000;
            R7 <= 8'b00000000;
            RX <= 8'b00000000;
            RY <= 8'b00000000;
        end
        else begin
            case (i_Lectura_escritura)
                //Lectura de registros
                2'b00: begin
                    case (i_Control_RX)
                        3'b000: RX<=R0;
                        3'b001: RX<=R1;
                        3'b010: RX<=R2;
                        3'b011: RX<=R3;
                        3'b100: RX<=R4;
                        3'b101: RX<=R5;
                        3'b110: RX<=R6;
                        3'b111: RX<=R7;
                        default: RX<=8'b00000000;
                    endcase
                    
                    case (i_Control_RY)
                        3'b000: RY<=R0;
                        3'b001: RY<=R1;
                        3'b010: RY<=R2;
                        3'b011: RY<=R3;
                        3'b100: RY<=R4;
                        3'b101: RY<=R5;
                        3'b110: RY<=R6;
                        3'b111: RY<=R7;
                        default: RY<=8'b00000000;
                    endcase
                end
                
                //Escritura de registros
                2'b01: begin
                    case (i_Seleccion_registro_escritura)
                        3'b000: R0<=i_Datos;
                        3'b001: R1<=i_Datos;
                        3'b010: R2<=i_Datos;
                        3'b011: R3<=i_Datos;
                        3'b100: R4<=i_Datos;
                        3'b101: R5<=i_Datos;
                        3'b110: R6<=i_Datos;
                        default: R7<=i_Datos;
                    endcase
                end
                
                //Movimiento de registros
                2'b10: begin
                    case (i_Seleccion_registro_escritura)
                        3'b000: begin
                            case (i_Seleccion_registro_lectura)
                                3'b000: R0<=R0;
                                3'b001: R0<=R1;
                                3'b010: R0<=R2;
                                3'b011: R0<=R3;
                                3'b100: R0<=R4;
                                3'b101: R0<=R5;
                                3'b110: R0<=R6;
                                default: R0<=R7;
                            endcase
                        end
                        3'b001: begin
                            case (i_Seleccion_registro_lectura)
                                3'b000: R1<=R0;
                                3'b001: R1<=R1;
                                3'b010: R1<=R2;
                                3'b011: R1<=R3;
                                3'b100: R1<=R4;
                                3'b101: R1<=R5;
                                3'b110: R1<=R6;
                                default: R1<=R7;
                            endcase
                        end
                        3'b010: begin
                            case (i_Seleccion_registro_lectura)
                                3'b000: R2<=R0;
                                3'b001: R2<=R1;
                                3'b010: R2<=R2;
                                3'b011: R2<=R3;
                                3'b100: R2<=R4;
                                3'b101: R2<=R5;
                                3'b110: R2<=R6;
                                default: R2<=R7;
                            endcase
                        end
                        3'b011: begin
                            case (i_Seleccion_registro_lectura)
                                3'b000: R3<=R0;
                                3'b001: R3<=R1;
                                3'b010: R3<=R2;
                                3'b011: R3<=R3;
                                3'b100: R3<=R4;
                                3'b101: R3<=R5;
                                3'b110: R3<=R6;
                                default: R3<=R7;
                            endcase
                        end
                        3'b100: begin
                            case (i_Seleccion_registro_lectura)
                                3'b000: R4<=R0;
                                3'b001: R4<=R1;
                                3'b010: R4<=R2;
                                3'b011: R4<=R3;
                                3'b100: R4<=R4;
                                3'b101: R4<=R5;
                                3'b110: R4<=R6;
                                default: R4<=R7;
                            endcase
                        end
                        3'b101: begin
                            case (i_Seleccion_registro_lectura)
                                3'b000: R5<=R0;
                                3'b001: R5<=R1;
                                3'b010: R5<=R2;
                                3'b011: R5<=R3;
                                3'b100: R5<=R4;
                                3'b101: R5<=R5;
                                3'b110: R5<=R6;
                                default: R5<=R7;
                            endcase
                        end
                        3'b110: begin
                            case (i_Seleccion_registro_lectura)
                                3'b000: R6<=R0;
                                3'b001: R6<=R1;
                                3'b010: R6<=R2;
                                3'b011: R6<=R3;
                                3'b100: R6<=R4;
                                3'b101: R6<=R5;
                                3'b110: R6<=R6;
                                default: R6<=R7;
                            endcase
                        end
                        default: begin
                            case (i_Seleccion_registro_lectura)
                                3'b000: R7<=R0;
                                3'b001: R7<=R1;
                                3'b010: R7<=R2;
                                3'b011: R7<=R3;
                                3'b100: R7<=R4;
                                3'b101: R7<=R5;
                                3'b110: R7<=R6;
                                default: R7<=R7;
                            endcase
                        end
                    endcase
                end
                
                //Lectura y escritura simultánea
                default: begin
                    case (i_Control_RX)
                        3'b000: RX<=R0;
                        3'b001: RX<=R1;
                        3'b010: RX<=R2;
                        3'b011: RX<=R3;
                        3'b100: RX<=R4;
                        3'b101: RX<=R5;
                        3'b110: RX<=R6;
                        3'b111: RX<=R7;
                        default: RX<=8'b00000000;
                    endcase

                    case (i_Control_RY)
                        3'b000: RY<=R0;
                        3'b001: RY<=R1;
                        3'b010: RY<=R2;
                        3'b011: RY<=R3;
                        3'b100: RY<=R4;
                        3'b101: RY<=R5;
                        3'b110: RY<=R6;
                        3'b111: RY<=R7;
                        default: RY<=8'b00000000;
                    endcase

                    case (i_Seleccion_registro_escritura)
                        3'b000: R0<=i_Datos;
                        3'b001: R1<=i_Datos;
                        3'b010: R2<=i_Datos;
                        3'b011: R3<=i_Datos;
                        3'b100: R4<=i_Datos;
                        3'b101: R5<=i_Datos;
                        3'b110: R6<=i_Datos;
                        default: R7<=i_Datos;
                    endcase
                end
            endcase
        end
    end

    assign o_RX = RX; //Se pasa el valor del registro RX a o_RX
    assign o_RY = RY; //Se pasa el valor del registro RY a o_RY
endmodule