SYNTH = ./sintetizado

all: parteA parteC parteE

parteA:
	yosys -p "read_verilog mux.v" -p "hierarchy -check -top mux" -p "proc; opt; memory; opt; fsm; opt" -p "techmap; opt" -p "write_verilog sintetizado.v"
	sed -i "s/mux/mux_synth/g" $(SYNTH).v
	iverilog -T typ BancoPruebaConductual_original.v -o sintetizado
	vvp sintetizado
	gtkwave mux.vcd


parteC:
	yosys -p "read_verilog mux.v" -p "hierarchy -check -top mux" -p "proc; opt; memory; opt; fsm; opt" -p "techmap; opt" -p "dfflibmap -liberty cmos_cells.lib" -p "abc -liberty cmos_cells.lib" -p "clean" -p "write_verilog sintetizado_cmos.v"
	sed -i "s/mux/mux_nodelay/g" $(SYNTH)_cmos.v
	iverilog -T typ BancoPruebaConductual_nodelay.v -o sintetizado_nodelay
	vvp sintetizado_nodelay
	gtkwave mux.vcd

parteE:
	yosys -p "read_verilog mux.v" -p "hierarchy -check -top mux" -p "proc; opt; memory; opt; fsm; opt" -p "techmap; opt" -p "dfflibmap -liberty cmos_cells.lib" -p "abc -liberty cmos_cells.lib" -p "clean" -p "write_verilog sintetizado_cmos_delay.v"
	sed -i "s/mux/mux_delay/g" $(SYNTH)_cmos_delay.v
	iverilog -T typ BancoPruebaConductual_delay.v -o sintetizado_delay
	vvp sintetizado_delay
	gtkwave mux.vcd