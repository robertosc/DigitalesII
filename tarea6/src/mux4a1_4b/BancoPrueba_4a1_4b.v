`timescale 1s / 1ms

`include "./src/probador_mux.v"
`include "./lib/cmos_cells.v"
`include "./src/mux4a1_4b/mux4a1_4b.v"
`include "./src/mux4a1_4b/sintetizado4a1_4b_cmos.v"


module BancoPruebas;
	wire [3:0] data_in0, data_in1, data_in2, data_in3, data_conductual, data_estructural; //cables
	wire       clk, salMux1, salMux2, reset_L, valid_2, valid_3, valid_0, valid_1, valid_out_conductual, valid_out_estructural; 
	wire [1:0] selector;

	mux4a1_4b p_conductal(/*AUTOINST*/
						// Outputs
						.valid_out_conductual	(valid_out_conductual),
						.data_conductual	(data_conductual[3:0]),
						// Inputs
						.clk		(clk),
						.reset_L		(reset_L),
						.selector		(selector[1:0]),
						.valid_0		(valid_0),
						.valid_2		(valid_2),
						.valid_3		(valid_3),
						.valid_1		(valid_1),
						.data_in0		(data_in0[3:0]),
						.data_in1		(data_in1[3:0]),
						.data_in2		(data_in2[3:0]),
						.data_in3		(data_in3[3:0]));

	probador_mux probador(/*AUTOINST*/
			      		// Outputs
						.valid_0		(valid_0),
						.valid_1		(valid_1),
						.valid_2		(valid_2),
						.valid_3		(valid_3),
						.reset_L		(reset_L),
						.data_in0		(data_in0[3:0]),
						.data_in1		(data_in1[3:0]),
						.data_in2		(data_in2[3:0]),
						.data_in3		(data_in3[3:0]),
						.selector		(selector[1:0]),
						.clk		(clk),
						// Inputs
						.data_conductual	(data_conductual[3:0]),
						.data_estructural	(data_estructural[3:0]),
						.valid_out_conductual	(valid_out_conductual),
						.valid_out_estructural (valid_out_estructural));

	sintetizado4a1_4b_cmos synth_estructural(/*AUTOINST*/
						// Outputs
						.data_estructural(data_estructural[3:0]),
						.valid_out_estructural	(valid_out_estructural),
						// Inputs
						.clk			(clk),
						.data_in0		(data_in0[3:0]),
						.data_in1		(data_in1[3:0]),
						.data_in2		(data_in2[3:0]),
						.data_in3		(data_in3[3:0]),
						.reset_L		(reset_L),
						.selector		(selector[1:0]),
						.valid_0		(valid_0),
						.valid_1		(valid_1),
						.valid_2		(valid_2),
						.valid_3		(valid_3));

    		
   //Para que autoinst sirva, tiene que estar en la misma carpeta

endmodule
