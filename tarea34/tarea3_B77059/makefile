all: iverilog gtk

iverilog:
	iverilog BancoPruebas.v -T typ -o banco
	vvp banco

gtk:
	gtkwave componentes.vcd

