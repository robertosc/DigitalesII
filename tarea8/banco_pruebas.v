`include "probador.v"
`include "contador_gray_synth.v"
`include "contador_gray_rob.v"
`include "./lib/cmos_cells.v"
`include "checker.v"

module banco_pruebas();

	wire [4:0] salida_gray, salida_gray_rob;
	wire enable, reset_L, clk, check;

contador_gray_synth u_contador_gray_synth(
    .clk     ( clk     ),
    .reset_L ( reset_L ),
    .enable  ( enable  ),
    .salida_gray ( salida_gray [4:0] )
);

probador u_probador(
	.clk (clk),
	.reset_L (reset_L),
	.enable (enable),
	.check (check),
	.salida_gray(salida_gray [4:0]),
	.salida_gray_rob(salida_gray_rob[4:0])
);

contador_gray_rob u_contador_gray_rob(
    .clk     ( clk     ),
    .reset_L ( reset_L ),
    .enable  ( enable  ),
    .contador_out ( salida_gray_rob[4:0] )
);
checker u_checker(
    .salida_gray     ( salida_gray [4:0]),
    .salida_gray_rob ( salida_gray_rob[4:0]),
    .check           ( check           ),
	.reset_L (reset_L),
	.enable (enable)
);


endmodule