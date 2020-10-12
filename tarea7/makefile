all: ss

ss:
	yosys -s state_machine.ys
	sed -i "s/state_machine/state_machine_sintetizado/g" state_machine_sintetizado.v
	sed -i "s/data_out_bus/data_out_bus_sint/g" state_machine_sintetizado.v
	sed -i "s/error/error_sint/g" state_machine_sintetizado.v
	sed -i "s/control_out/control_out_sint/g" state_machine_sintetizado.v
	sed -i "s/buffer_gen/buffer_gen_sintetizado/g" state_machine_sintetizado.v
	iverilog bancopruebas.v -o banco
	vvp banco
	rm banco
	gtkwave ss.vcd