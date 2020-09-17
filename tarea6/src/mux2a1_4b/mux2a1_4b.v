`include "./src/mux2a1_2b/mux2a1_2b.v"

module mux2a1_4b( input clk,
            input 	    reset_L,
            input 	    selector,
            input        valid_0,
            input        valid_1,
            input [3:0] 	    data_in0,
            input [3:0] 	    data_in1,
            output         valid_out_conductual,
            output [3:0] data_conductual);

      mux2a1_2b mux0(.clk(clk),
                        .reset_L(reset_L),
                        .selector(selector),
                        .data_in0(data_in0[3:2]),
                        .data_in1(data_in1[3:2]),
                        .valid_0(valid_0),
                        .valid_1(valid_1),
                        .valid_out_conductual(valid_out_conductual),
                        .data_conductual(data_conductual[3:2])
                        );

      mux2a1_2b mux1(.clk(clk),
                        .reset_L(reset_L),
                        .selector(selector),
                        .data_in0(data_in0[1:0]),
                        .data_in1(data_in1[1:0]),
                        .valid_0(valid_0),
                        .valid_1(valid_1),
                        .valid_out_conductual(valid_out_conductual),
                        .data_conductual(data_conductual[1:0])
                        );
endmodule
