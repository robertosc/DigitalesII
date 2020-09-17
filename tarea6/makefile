MUX2A1_2 = ./src/mux2a1_2b/
MUX2A1_4 = ./src/mux2a1_4b/
MUX4A1_4 = ./src/mux4a1_4b/
all: mux2a1_2b mux2a1_4b mux4a1_4b

mux2a1_2b:
	yosys ./yosys_commands/mux2a1_2b.ys
	sed -i "s/mux2a1_2b/sintetizado2a1_cmos/g" sintetizado2a1_cmos.v
	sed -i "s/data_conductual/data_estructural/g" sintetizado2a1_cmos.v
	sed -i "s/valid_out_conductual/valid_out_estructural/g" sintetizado2a1_cmos.v
	mv sintetizado2a1_cmos.v $(MUX2A1_2)
	iverilog $(MUX2A1_2)BancoPrueba_2a1_2b.v -o Banco2a1_2b
	vvp Banco2a1_2b
	rm Banco2a1_2b	
	gtkwave mux.vcd
	#rm *.vcd

mux2a1_4b:
	yosys ./yosys_commands/mux2a1_4b.ys
	sed -i "s/mux2a1_4b/sintetizado2a1_4b_cmos/g" sintetizado2a1_4b_cmos.v
	sed -i "s/data_conductual/data_estructural/g" sintetizado2a1_4b_cmos.v
	sed -i "s/valid_out_conductual/valid_out_estructural/g" sintetizado2a1_4b_cmos.v
	sed -i "s/mux2a1_2b/mux2a1_2b_interno/g" sintetizado2a1_4b_cmos.v
	mv sintetizado2a1_4b_cmos.v $(MUX2A1_4)
	iverilog $(MUX2A1_4)BancoPrueba_2a1_4b.v -o Banco2a1_4b
	vvp Banco2a1_4b
	rm Banco2a1_4b	
	gtkwave mux.vcd
	#rm *.vcd

mux4a1_4b:
	yosys ./yosys_commands/mux4a1_4b.ys
	sed -i "s/mux4a1_4b/sintetizado4a1_4b_cmos/g" sintetizado4a1_4b_cmos.v
	sed -i "s/data_conductual/data_estructural/g" sintetizado4a1_4b_cmos.v
	sed -i "s/valid_out_conductual/valid_out_estructural/g" sintetizado4a1_4b_cmos.v
	sed -i "s/mux2a1_4b/mux2a1_4b_interno/g" sintetizado4a1_4b_cmos.v
	sed -i "s/mux2a1_2b/mux2a1_2b_interno/g" sintetizado4a1_4b_cmos.v
	mv sintetizado4a1_4b_cmos.v $(MUX4A1_4)
	iverilog $(MUX4A1_4)BancoPrueba_4a1_4b.v -o Banco4a1_4b
	vvp Banco4a1_4b
	rm Banco4a1_4b	
	gtkwave mux.vcd
	#rm *.vcd