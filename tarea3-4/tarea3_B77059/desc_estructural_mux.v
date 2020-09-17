`include "library_r.v"
module desc_estructural_mux(input [1:0] data_in0,
					input [1:0] data_in1,
					input 	selector,
					input 	reset_L,
					input clk,
					output[1:0] data_out);

	wire [1:0] 	salMux1;
	wire [1:0] 	salMux2; 

    twobits_mux21 mux1(.selector(selector),
				.in_A(data_in0),
				.in_B(data_in1),
				.mux_out(salMux1));

	twobits_mux21 mux2 (.selector(reset_L),
				.in_A(2'b00),
				.in_B(salMux1),
				.mux_out(salMux2));

	flipflop ff(.D(salMux2),
				.clk(clk),
				.Q(data_out));



endmodule
