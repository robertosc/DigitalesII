module desc_conductual_tarea2( input clk,
                               input reset_L,
                               input selector,
                               input [1:0] data_in0,
                               input [1:0] data_in1,
                               output reg[1:0] data_out_cond
    );

    reg[1:0] salMux1 = 2'b00;

    always @(*) begin
        if (selector == 1)
            salMux1 = data_in1;
        else
            salMux1 = data_in0;
    end

    always @(posedge clk) begin
        if (reset_L == 1)
            data_out_cond <= salMux1;
        else
            data_out_cond <= 2'b00;
    end
endmodule