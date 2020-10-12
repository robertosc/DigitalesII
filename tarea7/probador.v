module probador#(parameter BUS_SIZE = 16,
					parameter WORD_SIZE = 4,
					parameter WORD_NUM = BUS_SIZE / WORD_SIZE
					)(
					input [BUS_SIZE-1:0] data_out_bus,
					input [WORD_NUM-1:0] control_out,
					input error,
					output reg reset,
					output reg clk, 
					output reg [BUS_SIZE-1:0] data_bus
					);

	initial begin
		$dumpfile("ss.vcd");
		$dumpvars;
		data_bus <= 16'h0000;
		reset <= 0;
		@(posedge clk);
		@(posedge clk);
		data_bus <= 16'hFBA0;
		reset <= 1;
		repeat (2) begin
			@(posedge clk);	
			data_bus <= data_bus + 1;
		end
		@(posedge clk);
		data_bus <= 16'hABA3;
		@(posedge clk);
		data_bus <= 16'hFBA0;
		@(posedge clk);
		data_bus <= 16'hFBA9;
		repeat (4) begin
			@(posedge clk);
		end
		
		$finish;
	end

	initial	clk 	<= 0;
	always	#15 clk 	<= ~clk;
endmodule