module probador(input [4:0] salida_gray,
				input [4:0] salida_gray_rob,
				input check,
				output reg clk,
				output reg reset_L,
				output reg enable);

	initial begin
		$dumpfile("contador.vcd");
		$dumpvars;
		reset_L <= 0;
		enable <= 0;
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		reset_L <= 1;
		enable <= 1;
		repeat (100) begin
			@(posedge clk);	
		end
		@(posedge clk);
		repeat (100) begin
			@(posedge clk);	
		end
		enable <= 1;	
		repeat (50) begin
			@(posedge clk);	
		end
		@(posedge clk);
		@(posedge clk);

		@(posedge clk);
		$finish;
	end

	initial clk <= 1;
	always #10 clk <= ~clk;


endmodule
