all: gray

gray:
	iverilog banco_pruebas.v -o banco
	vvp banco
	gtkwave contador.vcd
	rm banco
	rm contador.vcd