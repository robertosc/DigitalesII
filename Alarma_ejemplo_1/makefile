all: iverilog yosys gtkwave sed

iverilog:
	iverilog BancoPrueba.v -o Banco
	vvp Banco

yosys:
	yosys -p "read_verilog alarma_desc_conductual.v" -p "hierarchy -check -top alarma_desc_conductual" -p "show"

gtkwave:
	gtkwave alarma.vcd

sed:
	sed 's/alarma_desc_conductual/alarma_desc_conductual_synth/g' alarma_desc_conductual.v>alarma_desc_conductual_copy.v
