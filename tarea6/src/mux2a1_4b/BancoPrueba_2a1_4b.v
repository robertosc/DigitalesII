`timescale 1s / 1ms

`include "./src/probador_mux.v"
`include "./lib/cmos_cells.v"
`include "./src/mux2a1_4b/mux2a1_4b.v"
`include "./src/mux2a1_4b/sintetizado2a1_4b_cmos.v"

module BancoPruebas;
	wire [3:0] data_in0, data_in1, data_conductual, data_estructural; //Se generan los cables de entrada (buses)
	wire       clk, salMux1, reset_L, selector, salValid, valid_out_conductual, valid_out_estructural; 

		mux2a1_4b p_conductal(/*AUTOINST*/
			      // Outputs
			      .valid_out_conductual	(valid_out_conductual),
			      .data_conductual	(data_conductual[3:0]),
			      // Inputs
			      .clk		(clk),
			      .reset_L		(reset_L),
			      .selector		(selector),
			      .valid_0		(valid_0),
			      .valid_1		(valid_1),
			      .data_in0		(data_in0[3:0]),
			      .data_in1		(data_in1[3:0]));

        probador_mux probador(/*AUTOINST*/
			      // Outputs
			      .valid_0		(valid_0),
			      .valid_1		(valid_1),
			      .reset_L		(reset_L),
			      .data_in0		(data_in0[3:0]),
			      .data_in1		(data_in1[3:0]),
			      .selector		(selector),
			      .clk		(clk),
			      // Inputs
			      .data_conductual	(data_conductual[3:0]),
			      .data_estructural	(data_estructural[3:0]),
			      .valid_out_conductual	(valid_out_conductual),
				  .valid_out_estructural (valid_out_estructural));

   //Para que autoinst sirva, tiene que estar en la misma carpeta
	sintetizado2a1_4b_cmos synth_estructural(/*AUTOINST*/
						 // Outputs
						 .data_estructural	(data_estructural[3:0]),
						 .valid_out_estructural		(valid_out_estructural),
						 // Inputs
						 .clk			(clk),
						 .data_in0		(data_in0[3:0]),
						 .data_in1		(data_in1[3:0]),
						 .reset_L		(reset_L),
						 .selector		(selector),
						 .valid_0		(valid_0),
						 .valid_1		(valid_1));

endmodule
