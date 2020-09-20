# MicroUAZ versión Agosto 2020

## Proyecto 2 Microprocesador

Construir un microprocesador RISC de 8-bits con arquitectura Harvard con el siguiente set de instrucciones.

|     Instruction    |     Arguments    |     Description                                             |     Comments                                                                                                                                                                                             |
|--------------------|------------------|-------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|     LOAD           |     RX,#NUM      |     Load #Num to register X                                 |     #Num is 3 bits [0,7]                                                                                                                                                                                 |
|     LOAD           |     RX,[RY]      |     Load data at address [RY] from   memory                 |     RY and RX are 3 bits[0,7]                                                                                                                                                                            |
|     STORE          |     #NUM         |     Store #Num to [RX] address memory                       |     #Num is 3 bits [0,7]                                                                                                                                                                                 |
|     STORE          |     [RX],RY      |     Stores data at Register RY in [RX]   memory address     |     RY and RX are 3 bits [0,7]                                                                                                                                                                           |
|     MOVE           |     RX,RY        |     Move data form register RY to RX                        |     RY and RX are 3 bits [0,7]                                                                                                                                                                           |
|     MATH           |     RX,OP        |     DO MATH OPERATION WITH RX, AND   STORES RESULT IN R0    |     OP:     0: R0=R0+RX     1: R0=R0-RX     2: R0= R0<<RX     3: R0= R0>>RY     4: R0=~RX     5: R0=R0&RX     6: R0 = R0\|RX     7: R0=R0^RX                                                             |
|     JUMP           |     [RX],COND    |     JUMP PC TO [RX] ADDRESS IF COND IS   TRUE               |     COND:     0:NO CONDITION     1: NO CONDITION SAVE PC IN R7     2:Z FLAG IS TRUE     3:Z FLAG IS FALSE     4: C FLAG IS TRUE     5: C FLAG IS FALSE     6: N FLAG IS TRUE      7: N FLAG IS FALSE     |
|     NOP            |                  |     NO OPERATION                                            |                                                                                                                                                                                                          |