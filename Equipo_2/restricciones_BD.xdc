    ## Este archivo es un .xdc general para la placa Basys3 rev B

	## Para usarlo en un proyecto:

	## - descomenta las líneas correspondientes a los pines usados

	## - cambie el nombre de los puertos usados (en cada línea, después de get_ports) de acuerdo con los nombres de las señales de nivel superior en el proyecto

	

	## Señal de reloj

	set_property PACKAGE_PIN W5 [get_ports i_Clk]							

		set_property IOSTANDARD LVCMOS33 [get_ports i_Clk]

		#create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]

	 

	## Interruptores

	set_property PACKAGE_PIN V17 [get_ports {i_Datos1 [0]}]					

		set_property IOSTANDARD LVCMOS33 [get_ports {i_Datos1 [0]}]

	set_property PACKAGE_PIN V16 [get_ports {i_Datos1 [1]}]					

		set_property IOSTANDARD LVCMOS33 [get_ports {i_Datos1 [1]}]

	set_property PACKAGE_PIN W16 [get_ports {i_Datos1 [2]}]					

		set_property IOSTANDARD LVCMOS33 [get_ports {i_Datos1 [2]}]

	set_property PACKAGE_PIN W17 [get_ports {i_Datos1 [3]}]					

		set_property IOSTANDARD LVCMOS33 [get_ports {i_Datos1 [3]}]

	set_property PACKAGE_PIN W15 [get_ports {i_Datos2 [0]}]					

		set_property IOSTANDARD LVCMOS33 [get_ports {i_Datos2 [0]}]

	set_property PACKAGE_PIN V15 [get_ports {i_Datos2 [1]}]					

		set_property IOSTANDARD LVCMOS33 [get_ports {i_Datos2 [1]}]

	set_property PACKAGE_PIN W14 [get_ports {i_Datos2 [2]}]					

		set_property IOSTANDARD LVCMOS33 [get_ports {i_Datos2 [2]}]

	set_property PACKAGE_PIN W13 [get_ports {i_Datos2 [3]}]					

		set_property IOSTANDARD LVCMOS33 [get_ports {i_Datos2 [3]}]

	set_property PACKAGE_PIN V2 [get_ports {i_Datos3 [0]}]					

		set_property IOSTANDARD LVCMOS33 [get_ports {i_Datos3 [0]}]

	set_property PACKAGE_PIN T3 [get_ports {i_Datos3 [1]}]					

		set_property IOSTANDARD LVCMOS33 [get_ports {i_Datos3 [1]}]

	set_property PACKAGE_PIN T2 [get_ports {i_Datos3 [2]}]					

		set_property IOSTANDARD LVCMOS33 [get_ports {i_Datos3 [2]}]

	set_property PACKAGE_PIN R3 [get_ports {i_Datos3 [3]}]					

		set_property IOSTANDARD LVCMOS33 [get_ports {i_Datos3 [3]}]

	set_property PACKAGE_PIN W2 [get_ports {i_Datos4 [0]}]					

		set_property IOSTANDARD LVCMOS33 [get_ports {i_Datos4 [0]}]

	set_property PACKAGE_PIN U1 [get_ports {i_Datos4 [1]}]					

		set_property IOSTANDARD LVCMOS33 [get_ports {i_Datos4 [1]}]

	set_property PACKAGE_PIN T1 [get_ports {i_Datos4 [2]}]					

		set_property IOSTANDARD LVCMOS33 [get_ports {i_Datos4 [2]}]

	set_property PACKAGE_PIN R2 [get_ports {i_Datos4 [3]}]					

		set_property IOSTANDARD LVCMOS33 [get_ports {i_Datos4 [3]}]

	 

	

	## LED

	#set_property PACKAGE_PIN U16 [get_ports {led [0]}]					

		#set_property IOSTANDARD LVCMOS33 [get_ports {led [0]}]

	#set_property PACKAGE_PIN E19 [get_ports {led [1]}]					

		#set_property IOSTANDARD LVCMOS33 [get_ports {led [1]}]

	#set_property PACKAGE_PIN U19 [get_ports {led [2]}]					

		#set_property IOSTANDARD LVCMOS33 [get_ports {led [2]}]

	#set_property PACKAGE_PIN V19 [get_ports {led [3]}]					

		#set_property IOSTANDARD LVCMOS33 [get_ports {led [3]}]

	#set_property PACKAGE_PIN W18 [get_ports {led [4]}]					

		#set_property IOSTANDARD LVCMOS33 [get_ports {led [4]}]

	#set_property PACKAGE_PIN U15 [get_ports {led [5]}]					

		#set_property IOSTANDARD LVCMOS33 [get_ports {led [5]}]

	#set_property PACKAGE_PIN U14 [get_ports {led [6]}]					

		#set_property IOSTANDARD LVCMOS33 [get_ports {led [6]}]

	#set_property PACKAGE_PIN V14 [get_ports {led [7]}]					

		#set_property IOSTANDARD LVCMOS33 [get_ports {led [7]}]

	#set_property PACKAGE_PIN V13 [get_ports {led [8]}]					

		#set_property IOSTANDARD LVCMOS33 [get_ports {led [8]}]

	#set_property PACKAGE_PIN V3 [get_ports {led [9]}]					

		#set_property IOSTANDARD LVCMOS33 [get_ports {led [9]}]

	#set_property PACKAGE_PIN W3 [get_ports {led [10]}]					

		#set_property IOSTANDARD LVCMOS33 [get_ports {led [10]}]

	#set_property PACKAGE_PIN U3 [get_ports {led [11]}]					

		#set_property IOSTANDARD LVCMOS33 [get_ports {led [11]}]

	#set_property PACKAGE_PIN P3 [get_ports {led [12]}]					

		#set_property IOSTANDARD LVCMOS33 [get_ports {led [12]}]

	#set_property PACKAGE_PIN N3 [get_ports {led [13]}]					

		#set_property IOSTANDARD LVCMOS33 [get_ports {led [13]}]

	#set_property PACKAGE_PIN P1 [get_ports {led [14]}]					

		#set_property IOSTANDARD LVCMOS33 [get_ports {led [14]}]

	#set_property PACKAGE_PIN L1 [get_ports {led [15]}]					

		#set_property IOSTANDARD LVCMOS33 [get_ports {led [15]}]

		

		

	## Pantalla de 7 segmentos

	set_property PACKAGE_PIN W7 [get_ports {o_Segmentos [0]}]

	    set_property IOSTANDARD LVCMOS33 [get_ports {o_Segmentos [0]}]

	set_property PACKAGE_PIN W6 [get_ports {o_Segmentos [1]}]

	    set_property IOSTANDARD LVCMOS33 [get_ports {o_Segmentos [1]}]

	set_property PACKAGE_PIN U8 [get_ports {o_Segmentos [2]}]

	    set_property IOSTANDARD LVCMOS33 [get_ports {o_Segmentos [2]}]

	set_property PACKAGE_PIN V8 [get_ports {o_Segmentos [3]}]

	    set_property IOSTANDARD LVCMOS33 [get_ports {o_Segmentos [3]}]

	set_property PACKAGE_PIN U5 [get_ports {o_Segmentos [4]}]

	    set_property IOSTANDARD LVCMOS33 [get_ports {o_Segmentos [4]}]

	set_property PACKAGE_PIN V5 [get_ports {o_Segmentos [5]}]

	    set_property IOSTANDARD LVCMOS33 [get_ports {o_Segmentos [5]}]

	set_property PACKAGE_PIN U7 [get_ports {o_Segmentos [6]}]

	    set_property IOSTANDARD LVCMOS33 [get_ports {o_Segmentos [6]}]

	

	set_property PACKAGE_PIN V7 [get_ports dp]

	    set_property IOSTANDARD LVCMOS33 [get_ports dp]

	

	set_property PACKAGE_PIN U2 [get_ports {o_Anodo [0]}]

	    set_property IOSTANDARD LVCMOS33 [get_ports {o_Anodo [0]}]

	set_property PACKAGE_PIN U4 [get_ports {o_Anodo [1]}]

	    set_property IOSTANDARD LVCMOS33 [get_ports {o_Anodo [1]}]

	set_property PACKAGE_PIN V4 [get_ports {o_Anodo [2]}]

	    set_property IOSTANDARD LVCMOS33 [get_ports {o_Anodo [2]}]

	set_property PACKAGE_PIN W4 [get_ports {o_Anodo [3]}]

	    set_property IOSTANDARD LVCMOS33 [get_ports {o_Anodo [3]}]

	

	##Botones

	set_property PACKAGE_PIN U18 [get_ports i_Rst]						

		set_property IOSTANDARD LVCMOS33 [get_ports i_Rst]

	#set_property PACKAGE_PIN T18 [get_ports btnU]						

		#set_property IOSTANDARD LVCMOS33 [get_ports btnU]

	#set_property PACKAGE_PIN W19 [get_ports btnL]						

		#set_property IOSTANDARD LVCMOS33 [get_ports btnL]

	#set_property PACKAGE_PIN T17 [get_ports btnR]						

		#set_property IOSTANDARD LVCMOS33 [get_ports btnR]

	#set_property PACKAGE_PIN U17 [get_ports btnD]						

		#set_property IOSTANDARD LVCMOS33 [get_ports btnD]

	 

	

	

	## Encabezado Pmod JA

	## Nombre Sch = JA1

	#set_property PACKAGE_PIN J1 [get_ports {JA [0]}]					

		#set_property IOSTANDARD LVCMOS33 [get_ports {JA [0]}]

	## Nombre Sch = JA2

	#set_property PACKAGE_PIN L2 [get_ports {JA [1]}]					

		#set_property IOSTANDARD LVCMOS33 [get_ports {JA [1]}]

	## Sch nombre = JA3

	#set_property PACKAGE_PIN J2 [get_ports {JA [2]}]					

		#set_property IOSTANDARD LVCMOS33 [get_ports {JA [2]}]

	## Nombre Sch = JA4

	#set_property PACKAGE_PIN G2 [get_ports {JA [3]}]					

		#set_property IOSTANDARD LVCMOS33 [get_ports {JA [3]}]

	## Nombre Sch = JA7

	#set_property PACKAGE_PIN H1 [get_ports {JA [4]}]					

		#set_property IOSTANDARD LVCMOS33 [get_ports {JA [4]}]

	## Nombre Sch = JA8

	#set_property PACKAGE_PIN K2 [get_ports {JA [5]}]					

		#set_property IOSTANDARD LVCMOS33 [get_ports {JA [5]}]

	## Sch name = JA9

	#set_property PACKAGE_PIN H2 [get_ports {JA [6]}]					

		#set_property IOSTANDARD LVCMOS33 [get_ports {JA [6]}]

	## Nombre de Sch = JA10

	#set_property PACKAGE_PIN G3 [get_ports {JA [7]}]					

		#set_property IOSTANDARD LVCMOS33 [get_ports {JA [7]}]

	

	

	

	## Encabezado Pmod JB

	## Nombre Sch = JB1

	#set_property PACKAGE_PIN A14 [get_ports {JB [0]}]					

		#set_property IOSTANDARD LVCMOS33 [get_ports {JB [0]}]

	## Sch nombre = JB2

	#set_property PACKAGE_PIN A16 [get_ports {JB [1]}]					

		#set_property IOSTANDARD LVCMOS33 [get_ports {JB [1]}]

	## Sch nombre = JB3

	#set_property PACKAGE_PIN B15 [get_ports {JB [2]}]					

		#set_property IOSTANDARD LVCMOS33 [get_ports {JB [2]}]

	## Nombre Sch = JB4

	#set_property PACKAGE_PIN B16 [get_ports {JB [3]}]					

		#set_property IOSTANDARD LVCMOS33 [get_ports {JB [3]}]

	## Nombre Sch = JB7

	#set_property PACKAGE_PIN A15 [get_ports {JB [4]}]					

		#set_property IOSTANDARD LVCMOS33 [get_ports {JB [4]}]

	## Nombre Sch = JB8

	#set_property PACKAGE_PIN A17 [get_ports {JB [5]}]					

		#set_property IOSTANDARD LVCMOS33 [get_ports {JB [5]}]

	## Nombre Sch = JB9

	#set_property PACKAGE_PIN C15 [get_ports {JB [6]}]					

		#set_property IOSTANDARD LVCMOS33 [get_ports {JB [6]}]

	## Nombre Sch = JB10 

	#set_property PACKAGE_PIN C16 [get_ports {JB [7]}]					

		#set_property IOSTANDARD LVCMOS33 [get_ports {JB [7]}]

	 

	

	

	## Encabezado Pmod JC

	## Nombre Sch = JC1

	#set_property PACKAGE_PIN K17 [get_ports {JC [0]}]					

		#set_property IOSTANDARD LVCMOS33 [get_ports {JC [0]}]

	## Sch nombre = JC2

	#set_property PACKAGE_PIN M18 [get_ports {JC [1]}]					

		#set_property IOSTANDARD LVCMOS33 [get_ports {JC [1]}]

	## Nombre Sch = JC3

	#set_property PACKAGE_PIN N17 [get_ports {JC [2]}]					

		#set_property IOSTANDARD LVCMOS33 [get_ports {JC [2]}]

	## Nombre Sch = JC4

	#set_property PACKAGE_PIN P18 [get_ports {JC [3]}]					

		#set_property IOSTANDARD LVCMOS33 [get_ports {JC [3]}]

	## Nombre Sch = JC7

	#set_property PACKAGE_PIN L17 [get_ports {JC [4]}]					

		#set_property IOSTANDARD LVCMOS33 [get_ports {JC [4]}]

	## Nombre Sch = JC8

	#set_property PACKAGE_PIN M19 [get_ports {JC [5]}]					

		#set_property IOSTANDARD LVCMOS33 [get_ports {JC [5]}]

	## Nombre Sch = JC9

	#set_property PACKAGE_PIN P17 [get_ports {JC [6]}]					

		#set_property IOSTANDARD LVCMOS33 [get_ports {JC [6]}]

	## Nombre Sch = JC10

	#set_property PACKAGE_PIN R18 [get_ports {JC [7]}]					

		#set_property IOSTANDARD LVCMOS33 [get_ports {JC [7]}]

	

	

	## Encabezado Pmod JXADC

	## Nombre Sch = XA1_P

	#set_property PACKAGE_PIN J3 [get_ports {JXADC [0]}]				

		#set_property IOSTANDARD LVCMOS33 [get_ports {JXADC [0]}]

	## Sch nombre = XA2_P

	#set_property PACKAGE_PIN L3 [get_ports {JXADC [1]}]				

		#set_property IOSTANDARD LVCMOS33 [get_ports {JXADC [1]}]

	## Sch nombre = XA3_P

	#set_property PACKAGE_PIN M2 [get_ports {JXADC [2]}]				

		#set_property IOSTANDARD LVCMOS33 [get_ports {JXADC [2]}]

	## Sch nombre = XA4_P

	#set_property PACKAGE_PIN N2 [get_ports {JXADC [3]}]				

		#set_property IOSTANDARD LVCMOS33 [get_ports {JXADC [3]}]

	## Nombre Sch = XA1_N

	#set_property PACKAGE_PIN K3 [get_ports {JXADC [4]}]				

		#set_property IOSTANDARD LVCMOS33 [get_ports {JXADC [4]}]

	## Sch name = XA2_N

	#set_property PACKAGE_PIN M3 [get_ports {JXADC [5]}]				

		#set_property IOSTANDARD LVCMOS33 [get_ports {JXADC [5]}]

	## Sch name = XA3_N

	#set_property PACKAGE_PIN M1 [get_ports {JXADC [6]}]				

		#set_property IOSTANDARD LVCMOS33 [get_ports {JXADC [6]}]

	## Sch name = XA4_N

	#set_property PACKAGE_PIN N1 [get_ports {JXADC [7]}]				

		#set_property IOSTANDARD LVCMOS33 [get_ports {JXADC [7]}]

	

	

	

	## Conector VGA

	#set_property PACKAGE_PIN G19 [get_ports {vgaRed [0]}]				

		#set_property IOSTANDARD LVCMOS33 [get_ports {vgaRed [0]}]

	#set_property PACKAGE_PIN H19 [get_ports {vgaRed [1]}]				

		#set_property IOSTANDARD LVCMOS33 [get_ports {vgaRed [1]}]

	#set_property PACKAGE_PIN J19 [get_ports {vgaRed [2]}]				

		#set_property IOSTANDARD LVCMOS33 [get_ports {vgaRed [2]}]

	#set_property PACKAGE_PIN N19 [get_ports {vgaRed [3]}]				

		#set_property IOSTANDARD LVCMOS33 [get_ports {vgaRed [3]}]

	#set_property PACKAGE_PIN N18 [get_ports {vgaBlue [0]}]				

		#set_property IOSTANDARD LVCMOS33 [get_ports {vgaBlue [0]}]

	#set_property PACKAGE_PIN L18 [get_ports {vgaBlue [1]}]				

		#set_property IOSTANDARD LVCMOS33 [get_ports {vgaBlue [1]}]

	#set_property PACKAGE_PIN K18 [get_ports {vgaBlue [2]}]				

		#set_property IOSTANDARD LVCMOS33 [get_ports {vgaBlue [2]}]

	#set_property PACKAGE_PIN J18 [get_ports {vgaBlue [3]}]				

		#set_property IOSTANDARD LVCMOS33 [get_ports {vgaBlue [3]}]

	#set_property PACKAGE_PIN J17 [get_ports {vgaGreen [0]}]				

		#set_property IOSTANDARD LVCMOS33 [get_ports {vgaGreen [0]}]

	#set_property PACKAGE_PIN H17 [get_ports {vgaGreen [1]}]				

		#set_property IOSTANDARD LVCMOS33 [get_ports {vgaGreen [1]}]

	#set_property PACKAGE_PIN G17 [get_ports {vgaGreen [2]}]				

		#set_property IOSTANDARD LVCMOS33 [get_ports {vgaGreen [2]}]

	#set_property PACKAGE_PIN D17 [get_ports {vgaGreen [3]}]				

		#set_property IOSTANDARD LVCMOS33 [get_ports {vgaGreen [3]}]

	#set_property PACKAGE_PIN P19 [get_ports Hsync]						

		#set_property IOSTANDARD LVCMOS33 [get_ports Hsync]

	#set_property PACKAGE_PIN R19 [get_ports Vsync]						

		#set_property IOSTANDARD LVCMOS33 [get_ports Vsync]

	

	

	## Interfaz USB-RS232

	#set_property PACKAGE_PIN B18 [get_ports RsRx]						

		#set_property IOSTANDARD LVCMOS33 [get_ports RsRx]

	#set_property PACKAGE_PIN A18 [get_ports RsTx]						

		#set_property IOSTANDARD LVCMOS33 [get_ports RsTx]

	

	

	## USB HID (PS / 2)

	#set_property PACKAGE_PIN C17 [get_ports PS2Clk]						

		#set_property IOSTANDARD LVCMOS33 [get_ports PS2Clk]

		#set_property PULLUP verdadero [get_ports PS2Clk]

	#set_property PACKAGE_PIN B17 [get_ports PS2Data]					

		#set_property IOSTANDARD LVCMOS33 [get_ports PS2Data]	

		#set_property PULLUP verdadero [get_ports PS2Data]

	

	

	## Flash cuádruple SPI

	## Tenga en cuenta que CCLK_0 no se puede colocar en dispositivos de la serie 7. Puede acceder a él utilizando el

	## Primitiva STARTUPE2.

	#set_property PACKAGE_PIN D18 [get_ports {QspiDB [0]}]				

		#set_property IOSTANDARD LVCMOS33 [get_ports {QspiDB [0]}]

	#set_property PACKAGE_PIN D19 [get_ports {QspiDB [1]}]				

		#set_property IOSTANDARD LVCMOS33 [get_ports {QspiDB [1]}]

	#set_property PACKAGE_PIN G18 [get_ports {QspiDB [2]}]				

		#set_property IOSTANDARD LVCMOS33 [get_ports {QspiDB [2]}]

	#set_property PACKAGE_PIN F18 [get_ports {QspiDB [3]}]				

		#set_property IOSTANDARD LVCMOS33 [get_ports {QspiDB [3]}]

	#set_property PACKAGE_PIN K19 [get_ports QspiCSn]					

		#set_property IOSTANDARD LVCMOS33 [get_ports QspiCSn]
