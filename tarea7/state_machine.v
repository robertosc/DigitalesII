module state_machine #(parameter BUS_SIZE = 16,
					parameter WORD_SIZE = 4,
					parameter WORD_NUM = BUS_SIZE / WORD_SIZE
					)(
					input reset,
					input clk,
					input [BUS_SIZE-1:0] data_bus,
					output reg error
					);
	
	//Hay 5 estados: reset, first, reg, f_err inicio palabra y seq_err de secuencia
	reg [WORD_SIZE-1:0] counter, next_counter;
    reg [3:0] next_state, state;
	reg next_error;
	integer k;
	reg [WORD_SIZE-1:0] buffer, f_code;

	parameter [4:0] RESET = 0;
	parameter [4:0] FIRST_PKT = 1;
	parameter [4:0] REG_PKT = 2;
	parameter [4:0] F_ERR = 3;
	parameter [4:0] SEQ_ERR = 4;

	always @(posedge clk) begin
		if(reset == 0) begin
			k <= 0;
			error <= 0;
			counter <= 0;
			state <= 0;
			for (k = 0; k < WORD_SIZE; k=k+1) begin
				f_code[k] <= 1;
			end
		end
		else begin
			state <= next_state;
			error <= next_error;
			counter[3:0] <= next_counter;
		end
	end

	always @(*) begin		//Lógica combinacional que saca el próximo estado
        next_state = state;
        next_counter = counter;
        next_error = error;
        buffer = data_bus[WORD_SIZE-1:0];

        if(state == RESET) begin
            next_state = FIRST_PKT;
            next_error = 0;
            next_counter = 1;
        end
        else if(data_bus[BUS_SIZE-1:BUS_SIZE-WORD_SIZE] == f_code) begin
        case (state)
            FIRST_PKT: begin
                if (buffer == counter) begin
                    next_counter = counter + 1;
                    next_state = REG_PKT;
                    next_error = 0;
                end 
                else begin
                    next_counter = 0;
                    next_state = SEQ_ERR;
                    next_error = 1;
                end
            end
            REG_PKT: begin
                if (buffer == counter) begin
                    next_counter = counter + 1;
                    next_error = 0;
                end
                else begin
                    next_counter = 0;
                    next_state = SEQ_ERR;
                    next_error = 1;
                end
            end
            F_ERR: begin
                if (buffer == counter) begin
                    next_state = FIRST_PKT;
                    next_counter = counter + 1;
                    next_error = 0;
                end
                else begin
                    next_state = SEQ_ERR;
                    next_error = 1;
                end

            end
            SEQ_ERR: begin
                if (buffer == counter) begin
                    next_state = FIRST_PKT;
                    next_counter = counter + 1;
                    next_error = 0;
                end
                else begin
                    next_state = SEQ_ERR;
                    next_error = 1;
                end
            end
        endcase
        end
        else begin
            next_state = F_ERR;
            next_error = 1;
            next_counter = 0;
        end
        //end
    end
endmodule
