// `timescale 	1ns	/ 100ps
// escala	unidad temporal (valor de "#1") / precisi�n

// includes de archivos de verilog
// Pueden omitirse y llamarse desde el makefile
`include "src/mux.v"
`include "src/mux_synth.v"
`include "src/probador.v"

module BancoPruebas; // Testbench
	// Por lo general, las se�ales en el banco de pruebas son wires.
	// No almacenan un valor, son manejadas por otras instancias de m�dulos.
	wire reset_L, selector;
	wire[1:0] data_in0, data_in1;
	wire[1:0] data_out_estr, data_out_cond;

	// Descripcion conductual del circuito de la tarea 2
	mux	muxConductual(/*AUTOINST*/
			      // Outputs
			      .data_out		(data_out_cond[1:0]),
			      // Inputs
			      .clk		(clk),
			      .reset_L		(reset_L),
			      .selector		(selector),
			      .data_in0		(data_in0[1:0]),
			      .data_in1		(data_in1[1:0]));

	// Descripcion estructural del circuito de la tarea 2
	mux_synth muxSintetizado(/*AUTOINST*/
				 // Outputs
				 .data_out		(data_out_estr[1:0]),
				 // Inputs
				 .clk			(clk),
				 .data_in0		(data_in0[1:0]),
				 .data_in1		(data_in1[1:0]),
				 .reset_L		(reset_L),
				 .selector		(selector));
					  
	// Probador: generador de señales y monitor
	probador prob (/*AUTOINST*/
		       // Outputs
		       .clk		(clk),
		       .reset_L		(reset_L),
		       .selector	(selector),
		       .data_in0	(data_in0[1:0]),
		       .data_in1	(data_in1[1:0]),
		       // Inputs
		       .data_out_cond	(data_out_cond[1:0]),
		       .data_out_estr	(data_out_estr[1:0]));
endmodule
