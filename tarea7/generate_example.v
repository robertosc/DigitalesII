`include "cmos_cells.v"
//`include "memory_cluster_synth.v"
`include "memory_cluster_cond.v"

module generate_example();

parameter ADDR_WIDTH = 4;
parameter BUS_SIZE = 32;
// No modificar estos parametros
parameter MEM_LENGTH = 1 << ADDR_WIDTH;

// Existen algunas directivas de compilacion o macros,
// Por ejemplo, `define, `ifdef, `ifndef, `endif;
// no funcionan bien en algunas versiones de icarus.
// Los  defines, se trabajan en un archivo individual
// Son globales, al definirlos una vez,
// se definen en todo el ambiente o workspace
// Los valores de los defines se eligen por los
// arquitectos del chip y se utilizan en los bloques
// de mayor jerarquia o top-level-blocks, para asiganar
// valor como tamanos de buses. En este caso, ADDR_WIDTH
// y BUS_SIZE podrian ser defines numericos.

reg read,write;
reg [BUS_SIZE-1:0] data_in;
reg [ADDR_WIDTH-1:0] address;
wire [BUS_SIZE-1:0] data_out_synth;
wire [BUS_SIZE-1:0] data_out_cond;
reg clk;

// Probador
initial begin
	$dumpfile("dump.vcd");
	$dumpvars();
	@(posedge clk);
	read <= 0;
	write <= 0;
	data_in <= 0;
	address <= 0;
	@(posedge clk);
	repeat (MEM_LENGTH) begin
	  	data_in <= $random;
	  	write <= 1;
		@(posedge clk);	
		address <= address + 1;
	end
	write <= 0;
	address <= 0;
	@(posedge clk);@(posedge clk);
	repeat (MEM_LENGTH) begin
		read <= 1;
		@(posedge clk);
	  	address <= address + 1;
	end
	read <= 0;
	@(posedge clk);@(posedge clk);
	$finish;
end  

initial clk <= 0;
always #1 clk <= ~clk;

// Estructural
/*memory_cluster_synth mc_synth (	.clk		(clk),
				.read		(read),
				.write		(write),
				.data_in	(data_in),
				.data_out	(data_out_synth),
				.address	(address)
);*/

// Conductual
memory_cluster_cond mc_cond (	.clk		(clk),
				.read		(read),
				.write		(write),
				.data_in	(data_in),
				.data_out	(data_out_cond),
				.address	(address)
);

endmodule