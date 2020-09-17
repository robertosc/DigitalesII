`timescale 1s / 1ms

`include "sintetizado_cmos_delay.v"
`include "./src/probador.v"
`include "./lib/cmos_cells_retardos.v"
`include "./src/mux.v"

module BancoPruebas;
   wire [1:0] data_in0, data_in1, data_conductual, data_estructural; //Se generan los cables de entrada (buses)
   wire [1:0] data_synth;
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

   
   mux_delay p_delay(/*AUTOINST*/
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
   
