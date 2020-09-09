
BANCO=./src/BancoPrueba
OBJ=./src/out 
VCD=mux.vcd
SYNTH=./src/mux_synth.v

rtlil:
	#Script de yosys con modificacion mediante $sed
	yosys ./yosysScripts/rtlil.ys
	sed -i 's/mux/mux_synth/g' $(SYNTH)

	#run iverilog and object
	iverilog -o $(OBJ) $(BANCO)RTLIL.v
	vvp $(OBJ)
	
	#GTKWave
	gtkwave $(VCD)

nodelay:
	#Script de yosys con modificacion mediante $sed
	yosys ./yosysScripts/tech_synth.ys
	sed -i 's/mux/mux_synth/g' $(SYNTH)

	#run iverilog and object
	iverilog -o $(OBJ) $(BANCO)NoDelay.v
	vvp $(OBJ)
	
	#GTKWave
	gtkwave $(VCD)

delay:
	#Script de yosys con modificacion mediante $sed
	yosys ./yosysScripts/tech_synth.ys
	sed -i 's/mux/mux_synth/g' $(SYNTH)

	#run iverilog and object
	iverilog -o $(OBJ) $(BANCO)Delay.v
	vvp $(OBJ)
	
	#GTKWave
	gtkwave $(VCD)

clean:
	rm $(OBJ) $(VCD) $(SYNTH)

.PHONY: clean