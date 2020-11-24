file = open("D:/MicroUAZ_DobleV/MicroUAZ_DobleV.srcs/sources_1/new/ROM.mem", "w")
#si quiero multiplicar 3 por 4
"""file.write("001001011" + '\n')

file.write("110001000" + '\n')
file.write("110001000" + '\n')
file.write("110001000" + '\n')
file.write("110001000" + '\n')

file.write("100010000" + '\n')

file.write("000000000" + '\n')
file.close()"""


x = int(input("Introduce el primer operando: "))
y = int(input("Introduce el segundo operando: "))

file.write("001001001" + '\n')

for i in range(x):
    file.write("110001000" + '\n')
file.write("101001000" + '\n')
file.write("001000000" + '\n')

for i in range(y):
    file.write("110001000" + '\n')
file.write("101010000" + '\n')
file.write("001000000" + '\n')

file.write("100000010" + '\n')
file.write("000000000" + '\n')
z = x * y
print("Resultado en hex: " + hex(z))
print("Resultado en dec: " + str(z))