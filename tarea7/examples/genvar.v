module generate_example();

reg read,write = 0;
reg [31:0] data_in  = 0;
reg [3:0] address = 0;
wire [31:0] data_out;

initial begin
  $dumpfile("dump.vcd");
  $dumpvars();
  $monitor ("%g read=%b write=%b address=%b data_in=%h data_out=%h",
    $time, read, write, address, data_in, data_out);
  // Cuidado, no se sincroniza con el reloj ya que el ejemplo no tiene reloj
  // Sincronizar con el reloj si se tuviera.
  #1 read <= 0;
  #3 repeat (16) begin
    data_in <= $random;
    write <= 1;
    #1 address <= address + 1;
  end
  write <= 0;
  address <= 0;
  #3 repeat (16) begin
    read <= 1;
    #1 address <= address + 1;
  end
  read <= 0;
  #1 $finish;
end  
// Variable genvar sobre la que se va a hacer la generación de "cajitas" o bloques
genvar i;
// Directiva generate, "constructor de cajitas" o bloques
generate
  for (i=0; i < 4; i=i+1) begin : MEM // tag "MEM" utlizado, ayuda a identificar bloques generados en el waveform
     memory U (read, write,
			   // Indexación simple
               data_in[(i*8)+7:(i*8)],
               address,
			   // Indexación simple
			   data_out[(i*8)+7:(i*8)]);
  end
endgenerate

endmodule

// Módulo sencillo de memoria por conectar
module memory (
  input wire read,
  input wire write,
  input wire [7:0] data_in,
  input wire [3:0] address,
  output reg [7:0] data_out
);
// Matriz
reg [7:0] mem [0:15];

always @ (*)
begin
  if (write) mem[address] = data_in;
end

always @ (read, address)
begin
  if (read) data_out = mem[address];
end

endmodule