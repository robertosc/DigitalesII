`include "buffer_gen.v"

module generate_mod # (
	parameter BUS_SIZE = 16,
    parameter WORD_SIZE = 4,
    parameter WORD_NUM = BUS_SIZE/WORD_SIZE)
	(input [BUS_SIZE-1:0] data_bus,
	input clk,
	output [BUS_SIZE-1:0] data_out_bus,
	output [WORD_NUM-1:0] control_out
	);

	genvar i;
	generate
	for (i = 0; i < WORD_NUM; i = i+1) begin: BUFFER_GEN_1
		buffer_gen buff (.data_bus(data_bus[i*WORD_SIZE +: WORD_SIZE]),
						.clk (clk),
						.data_out_bus (data_out_bus[(BUS_SIZE-1)-(WORD_SIZE*i): (BUS_SIZE	)-(WORD_SIZE*(i+1))]),
						.control_out (control_out[WORD_NUM-i-1])
						);
	end
	endgenerate
endmodule