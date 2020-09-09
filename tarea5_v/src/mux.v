module mux( input clk,
            input reset_L,
            input selector,
            input [1:0] data_in0,
            input [1:0] data_in1,
            output reg[1:0] data_out
    );

    reg[1:0] salMux1 = 2'b00;

    always @(*) begin
        if (selector == 1) begin
            salMux1 = data_in1;
        end else begin
            salMux1 = data_in0;
        end
    end

    always @(posedge clk) begin
        if (reset_L == 1) begin
            data_out <= salMux1;
        end else begin
            data_out <= 2'b00;
        end
    end
endmodule