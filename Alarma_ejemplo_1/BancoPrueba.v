`timescale 	1ns				/ 100ps
// escala	unidad temporal (valor de "#1") / precisi�n
// includes de archivos de verilog
// Pueden omitirse y llamarse desde el testbench
`include "alarma_desc_conductual.v"
`include "alarma_desc_estructural.v"
`include "probador.v"

module BancoPruebas; // Testbench
	// Por lo general, las se�ales en el banco de pruebas son wires.
	// No almacenan un valor, son manejadas por otras instancias de m�dulos.
	wire sAlr_cond, sAlr_estr, sLuz, sPrta, sIgn;

	// Descripci�n conductual de alarma
	alarma_desc_conductual	a_cond(	.sAlr		(sAlr_cond),
					.sLuz		(sLuz),
					.sPrta		(sPrta),
					.sIgn		(sIgn)
	);
	// Descripci�n estructural de alarma
	alarma_desc_estructural	a_estr(	.sAlr		(sAlr_estr),
					.sLuz		(sLuz),
					.sPrta		(sPrta),
					.sIgn		(sIgn)
	);
	// Probador: generador de se�ales y monitor
	probador probador_(		.sAlr_estr	(sAlr_estr),
					.sAlr_cond	(sAlr_cond),
					.sLuz		(sLuz),
					.sPrta		(sPrta),
					.sIgn		(sIgn)
	);
endmodule
