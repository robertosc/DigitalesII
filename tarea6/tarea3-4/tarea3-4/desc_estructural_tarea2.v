`include "biblioteca.v"

module desc_estructural_tarea2 (input clk,
                   input reset_L,
                   input selector,
                   input [1:0] data_in0,
                   input [1:0] data_in1,
                   output [1:0] data_out_estr);
    wire [1:0] salMux1; 
    wire [1:0] D;

    my_2bit_mux firstMux( .A(data_in0),
                          .B(data_in1),
                          .SEL(selector),
                          .OUT(salMux1));

    my_2bit_mux secondMux( .A(2'b0),
                           .B(salMux1),
                           .SEL(reset_L),
                           .OUT(D));

    my_flop outFlop( .clk(clk),
                     .D(D),
                     .Q(data_out_estr));
endmodule