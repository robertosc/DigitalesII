module state_machine #(parameter BUS_SIZE = 16,
					parameter WORD_SIZE = 4,
					parameter WORD_NUM = BUS_SIZE / WORD_SIZE
					)(
					input reset,
					input clk,
					input [BUS_SIZE-1:0] data_bus,
					output reg [BUS_SIZE-1:0] data_out_bus,
					output reg [WORD_NUM-1:0] control_out,
					output reg error
					);
	
	//Hay 13 estados: reset, first, reg, f_error inicio palabra y seq_error de secuencia
	reg [4:0] next_state, state;
	reg [WORD_SIZE:0] counter;
	reg next_error;
	integer i;
	reg [WORD_SIZE-1:0] buffer, f_code, buf2;
	reg prueba;

	parameter RESET = 0;
	parameter FIRST_PKT = 1;
	parameter REG_PKT = 2;
	parameter F_ERR = 3;
	parameter SEQ_ERR = 4;

	always @(posedge clk) begin
		if(reset == 0) begin
			state <= RESET;
			data_out_bus <= 0;
			i <= 0;
			control_out <= 0;
			error <= 0;
			counter <= 0;
		end
		else begin
			for (i = 0; i < WORD_SIZE; i=i+1) begin
				f_code[i] <= 1;
			end

			state <= next_state;
			if (next_state == FIRST_PKT || next_state == REG_PKT) counter <= counter + 1;
			else error <= next_error;
		end
	end

	always @(*) begin		//Lógica combinacional que saca el próximo estado
		next_state = state;
		buffer = data_bus[3:0];//[BUS_SIZE-1:(BUS_SIZE-WORD_SIZE)];
		//if (state == RESET) begin 		//Acá no se puede manipular reset, intefiere
		//	next_state = FIRST_PKT;
		//	next_error = 0;
		//end
		case(state)
			RESET: begin
				next_state = FIRST_PKT;
				next_error = 0;
			end
			FIRST_PKT:
			begin
				if(data_bus[BUS_SIZE-1:(BUS_SIZE-WORD_SIZE)] == f_code) begin
					if(data_bus[3:0] == counter) begin
						next_state = REG_PKT;
						next_error = 0;
					end
					else next_state = SEQ_ERR;
				end
				else begin
					next_state = F_ERR;
					next_error = 1;
				end
			end
			REG_PKT: 
			begin						// Revisar si empieza en F y termina entre [1-9] dep contador
				if (data_bus[3:0] == counter) begin
					next_state = REG_PKT;
					next_error = 0;
				end
				else begin
					next_state = SEQ_ERR;
					next_error = 1;
				end
			end
			F_ERR: 
			begin
				next_state = FIRST_PKT;
				next_error = 0;
				counter = 0;
			end
			SEQ_ERR:
			begin
				next_state = FIRST_PKT;
				next_error = 0;
				counter = 0;
			end		
		endcase
		else if (data_bus[BUS_SIZE-1:(BUS_SIZE-WORD_SIZE)] != f_code) begin
			next_state = F_ERR;
			next_error = 1;
			counter = 0;
		end
	end
endmodule

