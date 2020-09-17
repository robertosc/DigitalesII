`timescale 1ns/100ps
`include "desc_estructural_mux.v"
`include "mux.v"
`include "probador.v"


module BancoPruebas;
	wire [1:0] data_in0, data_in1;
	wire [1:0] data_estructural, data_cond;
	wire       clk, in_A, in_B, reset_L, selector, and_out, or_out, not_out, mux_output;
	wire [1:0] ff_out;

	and_gate comp_and(// Outputs
			.and_output	(and_out),
			// Inputs
			.in_A		(in_A),
			.in_B		(in_B));

	or_gate comp_or(.or_output (or_out),
			.in_A (in_A),
			.in_B (in_B));

	not_gate comp_not(.not_output(not_out),
			.in_A(in_A));

	flipflop comp_ff(.D({in_A, in_B}),
			.clk(clk),
			.Q(ff_out[1:0]));

	mux21 mux_BP(.in_A(in_A),
				.in_B(in_B),
				.selector(selector),
				.mux_output(mux_output));

	mux p_cond(/*AUTOINST*/
	      // Outputs
		.data_out			(data_cond[1:0]),
	      // Inputs
		.clk				(clk),
		.reset_L			(reset_L),
		.selector			(selector),
		.data_in0			(data_in0[1:0]),
		.data_in1			(data_in1[1:0]));

	desc_estructural_mux estr(.data_in0(data_in0[1:0]),
					.data_in1(data_in1[1:0]),
					.selector(selector),
					.reset_L(reset_L),
					.data_out(data_estructural[1:0]),
					.clk(clk));


	probador prob(/*AUTOINST*/
		 // Outputs
		.in_A			(in_A),
		.in_B			(in_B),
		.selector		(selector),
		.reset_L		(reset_L),
		.data_in0		(data_in0[1:0]),
		.data_in1		(data_in1[1:0]),
		.clk			(clk),
		// Inputs
		.data_cond		(data_cond[1:0]),
		.data_estructural(data_estructural[1:0]),
		.and_out		(and_out),
		.or_out		(or_out),
		.not_out		(not_out),
		.ff_out		(ff_out[1:0]),
		.mux_output(mux_output));


endmodule
