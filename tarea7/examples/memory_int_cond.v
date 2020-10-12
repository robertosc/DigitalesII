module memory_int_cond #(
	// Los parametros se definen antes de la construccion o sintesis,
	// una vez sintetizado el modelo, no se pueden modificar.
	// Por esta razon, no se modifican en el testbench
	parameter BUS_SIZE = 32,
	parameter ADDR_WIDTH = 4,
	parameter NUM_MEM_UNITS = 4,
	parameter MEM_LENGTH = 1 << ADDR_WIDTH,
	parameter MEM_UNIT_WIDTH = BUS_SIZE / NUM_MEM_UNITS
	) (
	input clk,
	input read,
	input write,
	input [MEM_UNIT_WIDTH-1:0] data_in,
	input [ADDR_WIDTH-1:0] address ,
	output reg [MEM_UNIT_WIDTH-1:0] data_out
);


reg [MEM_UNIT_WIDTH-1:0] mem [MEM_LENGTH-1:0];

always @ (posedge clk) begin
  	if (write) mem[address] <= data_in;
  	if (read) data_out <= mem[address];
end

endmodule