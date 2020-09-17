SYNTH = ./sintetizado
PROB = ./src/probador.v
all: synth nodelay delay

synth:
	yosys -p "read_verilog ./src/mux.v" -p "hierarchy -check -top mux" -p "proc; opt; memory; opt; fsm; opt" -p "techmap; opt" -p "write_verilog sintetizado.v"
	sed -i "s/mux/mux_synth/g" $(SYNTH).v
	iverilog -T typ ./src/BancoPruebaConductual_original.v -o sintetizado
	vvp sintetizado
	gtkwave mux.vcd


nodelay:
	yosys -p "read_verilog ./src/mux.v" -p "hierarchy -check -top mux" -p "proc; opt; memory; opt; fsm; opt" -p "techmap; opt" -p "dfflibmap -liberty ./lib/cmos_cells.lib" -p "abc -liberty ./lib/cmos_cells.lib" -p "clean" -p "write_verilog sintetizado_cmos.v"
	sed -i "s/mux/mux_nodelay/g" $(SYNTH)_cmos.v
	sed -i "s/mux.vcd/mux_nodelay.vcd/g"  $(PROB)
	iverilog -T typ ./src/BancoPruebaConductual_nodelay.v -o sintetizado_nodelay
	vvp sintetizado_nodelay
	sed -i "s/mux_nodelay.vcd/mux.vcd/g"  $(PROB)
	gtkwave mux_nodelay.vcd

delay:
	yosys -p "read_verilog ./src/mux.v" -p "hierarchy -check -top mux" -p "proc; opt; memory; opt; fsm; opt" -p "techmap; opt" -p "dfflibmap -liberty ./lib/cmos_cells.lib" -p "abc -liberty ./lib/cmos_cells.lib" -p "clean" -p "write_verilog sintetizado_cmos_delay.v"
	sed -i "s/mux/mux_delay/g" $(SYNTH)_cmos_delay.v
	sed -i "s/mux.vcd/mux_delay.vcd/g"  $(PROB)
	iverilog -T typ ./src/BancoPruebaConductual_delay.v -o sintetizado_delay
	vvp sintetizado_delay
	sed -i "s/mux_delay.vcd/mux.vcd/g"  $(PROB)
	gtkwave mux_delay.vcd