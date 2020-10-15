all: ss

ss:
	yosys -s state_machine.ys
	yosys -s generador.ys

	sed -i "s/state_machine/state_machine_sintetizado/g" state_machine_sintetizado.v
	sed -i "s/error/error_sint/g" state_machine_sintetizado.v

	sed -i "s/generate_mod/generate_mod_sintetizado/g" generate_mod_sintetizado.v
	sed -i "s/control_out/control_out_sint/g" generate_mod_sintetizado.v
	sed -i "s/data_out_bus/data_out_bus_sint/g" generate_mod_sintetizado.v
	sed -i "s/buffer_gen/buffer_gen_sintetizado/g" generate_mod_sintetizado.v

	iverilog bancopruebas.v -o banco
	vvp banco
	rm banco
	gtkwave ss.vcd