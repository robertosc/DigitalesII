module checker#(parameter BUS_SIZE = 16,
				parameter WORD_SIZE = 4,
				parameter WORD_NUM = BUS_SIZE / WORD_SIZE
				)(input error,
				input error_sint,
				input [BUS_SIZE-1:0] data_out_bus,
				input [BUS_SIZE-1:0] data_out_bus_sint,
				input [WORD_NUM-1:0] control_out,
				input [WORD_SIZE-1:0] control_out_sint,
				output reg check_out,
				output reg check_control,
				output reg check_error
				);
				
	always @(*) begin
		if(data_out_bus != data_out_bus_sint) begin
			check_out = 1;
		end else check_out = 0;

		if(control_out != control_out_sint) begin
			check_control = 1;
		end else check_control = 0;
	
		if(error_sint != error) begin
			check_error = 1;
		end else check_error = 0;
	end

endmodule