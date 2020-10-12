module buffer_gen # (parameter BUS_SIZE = 16,
					parameter WORD_SIZE = 4,
					parameter WORD_NUM = BUS_SIZE / WORD_SIZE
					)(
					input clk,
					input [WORD_SIZE-1:0] data_bus,
					output reg [WORD_SIZE-1:0] data_out_bus,
					output reg control_out
					);
		
	always @(posedge clk) begin
		if (data_bus == 0) begin
			control_out <= 0;
		end
		else control_out <= 1;
		data_out_bus <= data_bus;
	end

endmodule