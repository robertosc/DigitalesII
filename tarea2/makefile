all: iverilog gtkwave

iverilog:
	iverilog BancoPruebaConductual_mux.v -o prueba
	vvp prueba
gtkwave:
	gtkwave mux.vcd
