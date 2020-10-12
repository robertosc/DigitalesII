module state_machine #(parameter BUS_SIZE = 16,
					parameter WORD_SIZE = 4,
					parameter WORD_NUM = BUS_SIZE / WORD_SIZE
					)(
					input reset,
					input clk,
					input [BUS_SIZE-1:0] data_bus,
					output reg error
					);
	
	//Hay 13 estados: reset, first, reg, f_error inicio palabra y seq_error de secuencia
	reg [4:0] next_state, state;
	reg [WORD_SIZE-1:0] counter, next_counter;
	reg next_error;
	integer k;
	reg [WORD_SIZE-1:0] buffer, f_code;

	parameter RESET = 0;
	parameter FIRST_PKT = 1;
	parameter REG_PKT = 2;
	parameter F_ERR = 3;
	parameter SEQ_ERR = 4;

	always @(posedge clk) begin
		if(reset == 0) begin
			k <= 0;
			error <= 0;
			counter <= 0;
			state <= RESET;
			for (k = 0; k < WORD_SIZE; k=k+1) begin
				f_code[k] <= 1;
			end
		end
		else begin
			state <= next_state;
			error <= next_error;
			counter <= next_counter;
		end
	end

	always @(*) begin		//Lógica combinacional que saca el próximo estado
		next_state = state;
		next_error = error;
		next_counter = counter;
		
		if (state == RESET) begin 		//Acá no se puede manipular reset, intefiere
			next_state = FIRST_PKT;
			next_error = 0;
			next_counter = 0;
		end

		else if(data_bus[BUS_SIZE-1:(BUS_SIZE-WORD_SIZE)] == f_code) begin
			case(state)
				FIRST_PKT:
				begin
					if(data_bus[WORD_SIZE-1:0] == counter) begin
						next_state = REG_PKT;
						next_error = 0;
						next_counter = counter+1;
					end
					else begin
						next_state = SEQ_ERR;
						next_error = 1;
						next_counter = 0;
					end
				end
				REG_PKT: 
				begin						// Revisar si empieza en F y termina entre [1-9] dep contador
					if (data_bus[WORD_SIZE-1:0] == counter) begin
						next_state = REG_PKT;
						next_error = 0;
						next_counter = counter+1;
					end
					else begin
						next_state = SEQ_ERR;
						next_error = 1;
						next_counter = 0;
					end
				end
				F_ERR: 
				begin
					if(data_bus[WORD_SIZE-1:0] == ~f_code) begin
						next_state = FIRST_PKT;
						next_error = 0;
					end
					else begin
						next_state = SEQ_ERR;
						next_error = 1;
					end
				end
				SEQ_ERR:
				begin
					if(data_bus[WORD_SIZE-1:0] == ~f_code) begin
						next_state = FIRST_PKT;
						next_error = 0;
					end
					else begin
						next_state = SEQ_ERR;
						next_error = 1;
						counter = 0;
					end
				end
				default:
				begin
					next_state = FIRST_PKT;
					next_error = 0;
					next_counter = 0;
				end
			endcase
		end
		else if (data_bus[BUS_SIZE-1:(BUS_SIZE-WORD_SIZE)] != f_code) begin
			next_state = F_ERR;
			next_error = 1;
			next_counter = 0;
		end
	end
endmodule
