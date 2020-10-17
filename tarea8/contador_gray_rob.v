module contador_gray_rob(input clk,
						input reset_L,
						input enable,
						output reg [4:0] contador_out);

	reg [4:0] buffer;
	reg [4:0] contador_interno;
	integer i;

	always@(posedge clk) begin
		if (reset_L == 0) begin
				contador_interno <= 0;
				contador_out <= 0;
				i <= 0;
		end
		else if (enable == 1) begin
			if (contador_interno == 'd31) contador_interno <= 0;
			else contador_interno <= contador_interno + 1;
		end

	end

	always@(*) begin
		buffer = {1'b0, contador_interno[4:1]};
		for(i = 0; i<5; i=i+1) begin
			if(buffer[i] != contador_interno[i]) contador_out[i] <= 1'b1;
			else contador_out[i] <= 2'b0;
		end
	end


endmodule