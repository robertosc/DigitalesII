`timescale 1s / 1ms
`include "mux.v"
`include "sintetizado.v"
`include "probador.v"

module BancoPruebas;
   wire [1:0] data_in0, data_in1, data_conductual, data_estructural; //Se generan los cables de entrada (buses)
   wire       clk, salMux1, reset_L, selector; 
   
   mux p_conductual(/*AUTOINST*/
	      // Outputs
	      .data_out			(data_conductual[1:0]),
	      // Inputs
	      .clk			(clk),
	      .reset_L			(reset_L),
	      .selector			(selector),
	      .data_in0			(data_in0[1:0]),
	      .data_in1			(data_in1[1:0]));
   
   mux_synth p_synth(/*AUTOINST*/
	      // Outputs
	      .data_out			(data_estructural[1:0]),
	      // Inputs
	      .clk			(clk),
	      .reset_L			(reset_L),
	      .selector			(selector),
	      .data_in0			(data_in0[1:0]),
	      .data_in1			(data_in1[1:0]));
   
   
   probador probador(/*AUTOINST*/
			 // Outputs
			 .reset_L		(reset_L),
			 .data_in0		(data_in0[1:0]),
			 .data_in1		(data_in1[1:0]),
			 .selector		(selector),
			 .clk			(clk),
			 // Inputs
			 .data_estructural		(data_estructural[1:0]),
			.data_conductual		(data_conductual[1:0]));
   

endmodule
   
