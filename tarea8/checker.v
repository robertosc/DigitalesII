module checker(input [4:0] salida_gray,
				input [4:0] salida_gray_rob,
				input reset_L,
				input enable,
				output reg check);
	always@(*) begin
		if(salida_gray != salida_gray_rob) check = 1;
		else check = 0;
	end

endmodule