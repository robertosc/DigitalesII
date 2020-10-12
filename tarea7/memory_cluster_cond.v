`include "memory_int_cond.v"

module memory_cluster_cond #(
	// Los parametros se definen antes de la construccion o sintesis,
	// una vez sintetizado el modelo, no se pueden modificar.
	// Por esta razon, no se modifican en el testbench.
	parameter BUS_SIZE = 32,
	parameter ADDR_WIDTH = 4,
	parameter NUM_MEM_UNITS = 4,
	// Parametros calculados automaticamente, no modificar
	parameter MEM_UNIT_WIDTH = BUS_SIZE / NUM_MEM_UNITS,
	parameter MEM_LENGTH = 1 << ADDR_WIDTH
	) (
	input clk,
	input read,
	input write,
	input [BUS_SIZE-1:0] data_in,
	input [ADDR_WIDTH-1:0] address,
	output [BUS_SIZE-1:0] data_out
);
// La directiva generate funciona como una especie de constructor o generador de instancias o "cajas" que pueden
// indexarse por medio de una variable genvar.
// Dentro del generate se pueden colocar regs, wires, assigns, always, instancias de modulos, y otros.
// Al combinarse con el for, se generan NUM_MEM_UNITS "cajas", cada una con una instancia de memory_int_cond.
genvar i;
generate
	for (i=0; i < NUM_MEM_UNITS; i=i+1) begin : MEM // Etiqueta
     		memory_int_cond 	#(	.BUS_SIZE	(BUS_SIZE),
						.ADDR_WIDTH	(ADDR_WIDTH),
						.NUM_MEM_UNITS	(NUM_MEM_UNITS)	// Sobrescritura de parametro interno 
					) mem_unit (
						.clk		(clk),
						.read		(read),
						.write		(write),
						// Indexacion por partes parte de un arreglo en Verilog con [ inicio +: ancho]
						// [8+:8] equivale a [8:15], [0+:8] equivale a [0:7]
						// Sintaxis muy utilizada en combinacion de for y generate.
          					.data_in	(data_in	[(i*MEM_UNIT_WIDTH)+:MEM_UNIT_WIDTH]), 
               					.address	(address),
						.data_out	(data_out	[(i*MEM_UNIT_WIDTH)+:MEM_UNIT_WIDTH])
					);
	end
endgenerate
endmodule