`include "probador.v"
`include "state_machine.v"
`include "state_machine_sintetizado.v"
`include "./lib/cmos_cells.v"

module bancopruebas#(parameter BUS_SIZE = 16,
                    parameter WORD_SIZE = 4,
                    parameter WORD_NUM = BUS_SIZE/WORD_SIZE
                    );

    wire [BUS_SIZE-1:0] data_bus;
    wire [BUS_SIZE-1:0] data_out_bus;
    wire [WORD_NUM-1:0] control_out;

state_machine u_state_machine(
    .reset        ( reset        ),
    .clk          ( clk          ),
    .data_bus     ( data_bus [BUS_SIZE-1:0] ),
    .data_out_bus ( data_out_bus [BUS_SIZE-1:0] ),
    .control_out  ( control_out [WORD_NUM-1:0]  ),
    .error        ( error        )
);

probador u_probador(
    .data_out_bus ( data_out_bus [BUS_SIZE-1:0]),
    .control_out  ( control_out [WORD_NUM-1:0]  ),
    .error        ( error        ),
    .reset        ( reset        ),
    .clk          ( clk          ),
    .data_bus     ( data_bus  [BUS_SIZE-1:0])
);

state_machine_sintetizado u_state_machine_sint(
    .reset        ( reset        ),
    .clk          ( clk          ),
    .data_bus     ( data_bus [BUS_SIZE-1:0] ),
    .data_out_bus ( data_out_bus_sint [BUS_SIZE-1:0] ),
    .control_out  ( control_out_sint [WORD_NUM-1:0]  ),
    .error        ( error_sint        )
);

endmodule

