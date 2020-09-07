all: veriComp gtkGen 

veriComp:
	iverilog -o out ./BancoPruebaConductual.v -T typ
	vvp out
gtkGen:
	gtkwave ./estr.vcd
clean:
	rm ./*.vcd ./out

.PHONY: all clean
