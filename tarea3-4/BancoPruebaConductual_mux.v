`timescale 1s / 1ms

`include "mux.v"
`include "probador_mux.v"

module BancoPruebas;
   wire [1:0] data_in0, data_in1, data_out; //Se generan los cables de entrada (buses)
   wire       clk, salMux1, reset_L, selector; 
   

   
   mux p_cond(/*AUTOINST*/
	      // Outputs
	      .data_out			(data_out[1:0]),
	      // Inputs
	      .clk			(clk),
	      .reset_L			(reset_L),
	      .selector			(selector),
	      .data_in0			(data_in0[1:0]),
	      .data_in1			(data_in1[1:0]));
   
   
   probador_mux probador(/*AUTOINST*/
			 // Outputs
			 .reset_L		(reset_L),
			 .data_in0		(data_in0[1:0]),
			 .data_in1		(data_in1[1:0]),
			 .selector		(selector),
			 .clk			(clk),
			 // Inputs
			 .data_out		(data_out[1:0]));
   

endmodule
   
