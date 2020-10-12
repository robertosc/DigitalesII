module demux_striping(input [31:0] data_in,
					input clk_2f,
					input valid_demux,
					output reg [31:0] data_lane_0,
					output reg [31:0] data_lane_1);

	reg sel = 0;

	always @(posedge clk_2f) begin
		if (sel == 0) begin
			
		end
	end

endmodule