module probador(input [0:1] data_cond, //Conductual
      input [0:1] data_estructural,
		input 		 and_out, //salida and
		input 		 or_out, //salida or
		input 		 not_out, //salida not
		input [0:1]  ff_out,
		input mux_output,
		output reg 	 in_A, //Se�al para compuertas
		output reg 	 in_B, //Se�al 2 para compuertas
		output reg 	 selector, //Selector para muxes
		output reg 	 reset_L,
		output reg [0:1] data_in0,
		output reg [0:1] data_in1,
		output reg 	 clk);


	reg [3:0] contador_cond = 'b0;
	reg [3:0] contador_estr = 'b0;

	initial begin
		$dumpfile("componentes.vcd"); //Se depositan los datos en este archivo para leerlo en gtkwave
		$dumpvars;

      //$display ("\t\t\tclk,\tin_A,\tin_B,\tand_out, \tor_out, \tdata_in0, \tdata_in1, \tdata_cond, \tdata_estructural");

      //$monitor($time, "\t%b\t%b\t%b\t\t%b\t\t%b\t\t%b\t\t%b\t\t%b\t\t%b", clk, in_A, in_B, and_out, or_out, data_in0, data_in1, data_cond, data_estructural); //Datos a mostar
      
	  {selector, reset_L} = 1'b0;
      in_A = 1'b0; 
      in_B =  1'b0;
      {data_in0, data_in1} = 2'b00;

      @(posedge clk);  //Usando el mismo probador de la tarea 2
		reset_L <= 1'b1;
		@(posedge clk);
		data_in0 <= 2'b11;
		data_in1 <= 2'b10;
		@(posedge clk);
		selector <= 1'b1;
		data_in0 <= 2'b01;
		data_in1 <= 2'b00;
		@(posedge clk);
		data_in0 <= 2'b00;
		data_in1 <= 2'b10;
		@(posedge clk);
		selector <= 1'b0;
		data_in0 <= 2'b11;
		data_in1 <= 2'b11;
		@(posedge clk);
		selector <= 1'b1;
		data_in0 <= 2'b00;
		data_in1 <= 2'b01;
		@(posedge clk);
		selector <= 1'b0;
		data_in0 <= 2'b10;
		data_in1 <= 2'b00;
		@(posedge clk);
		reset_L <= 1'b0;
		data_in0 <= 2'b01;
		data_in1 <= 2'b11;
		@(posedge clk);
		selector <= 1'b0;
		data_in0 <= 2'b11;
		data_in1 <= 2'b00;
		repeat (2) begin
		@(posedge clk);
		end
    $finish;

	end // initial begin

   initial begin
      in_A <= 1'b1;
		in_B <= 1'b1;
		

		#6
		in_A <= 1'b0;
		in_B <= 1'b1;

		#6
		in_A <= 1'b1;
		in_B <= 1'b0;
		
		#6
		in_A <= 1'b0;
		in_B <= 1'b0;

		#6
		in_A <= 1'b1;
		in_B <= 1'b1;

		#6
		in_A <= 1'b1;
		in_B <= 1'b0;

		#6
		in_A <= 1'b1;
		in_B <= 1'b1;

		#6
		in_A <= 1'b0;
		in_B <= 1'b0;

   end // initial begin

	always @(posedge clk) begin	
		if (data_cond != data_estructural); 
		$display("La descripción estructural no concuerda con la conductual en %t [ps]", $realtime);
		$monitor($realtime, "[ns]\tCond: %b\tEstr: %b\tContadores[cond/estr]", data_cond, data_estructural, contador_cond, contador_estr);
	end

	always @(posedge data_cond) begin
		contador_cond = contador_cond + 1;
		//$display("Contador %b", contador);
	end

	always @(posedge data_estructural) begin
		contador_estr = contador_estr + 1;
		//$display("Contador %b", contador);
	end


	initial clk <= 0;
	always #3 clk <= ~clk;
	//always #3 clk <= ~clk;

endmodule
