// `timescale 	1ns	/ 100ps
// escala	unidad temporal (valor de "#1") / precisi�n

// includes de archivos de verilog
// Pueden omitirse y llamarse desde el makefile
`include "desc_conductual_tarea2.v"
`include "desc_estructural_tarea2.v"
// `include "biblioteca.v"
`include "probador.v"

module BancoPruebas; // Testbench
	// Por lo general, las se�ales en el banco de pruebas son wires.
	// No almacenan un valor, son manejadas por otras instancias de m�dulos.
	wire reset_L, selector;
	wire[1:0] data_in0, data_in1;
	wire[1:0] data_out_estr, data_out_cond;
	wire gate_stim_indiv, gate_stim1, gate_stim2, outNOT, outAND, outOR, outFFD;

	// Descripcion conductual del circuito de la tarea 2
	desc_conductual_tarea2	muxConductual(/*AUTOINST*/
					      // Outputs
					      .data_out_cond	(data_out_cond[1:0]),
					      // Inputs
					      .clk		(clk),
					      .reset_L		(reset_L),
					      .selector		(selector),
					      .data_in0		(data_in0[1:0]),
					      .data_in1		(data_in1[1:0]));

	// Descripcion estructural del circuito de la tarea 2
	desc_estructural_tarea2	muxEstructural(/*AUTOINST*/
					       // Outputs
					       .data_out_estr	(data_out_estr[1:0]),
					       // Inputs
					       .clk		(clk),
					       .reset_L		(reset_L),
					       .selector	(selector),
					       .data_in0	(data_in0[1:0]),
					       .data_in1	(data_in1[1:0]));

	my_not noty(.IN(gate_stim_indiv),
				 .OUT(outNOT));
				 
	my_flop flopy( .D({1'b0, gate_stim2}),
				   .clk(gate_stim1),
				   .Q(outFFD));

	my_and andy( .A(gate_stim1),
				 .B(gate_stim2),
				 .OUT(outAND));

	my_or ory( .A(gate_stim1),
			   .B(gate_stim2),
			   .OUT(outOR));
					  
	// Probador: generador de señales y monitor
	probador prob (/*AUTOINST*/
		       // Outputs
		       .clk		(clk),
		       .reset_L		(reset_L),
		       .selector	(selector),
		       .data_in0	(data_in0[1:0]),
		       .data_in1	(data_in1[1:0]),
			   .gate_stim_indiv		(gate_stim_indiv),
			   .gate_stim1		(gate_stim1),
			   .gate_stim2		(gate_stim2),
		       // Inputs
		       .data_out_cond	(data_out_cond[1:0]),
		       .data_out_estr	(data_out_estr[1:0]),
			   .outAND		(outAND),
			   .outNOT		(outNOT),
			   .outOR		(outOR),
			   .outFFD		(outFFD));
endmodule
