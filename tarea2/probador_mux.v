module probador_mux(input [0:1] data_out,
		    output reg reset_L,
		    output reg [0:1] data_in0,
		    output reg [0:1] data_in1,
		    output reg selector,
		    output reg clk);
   initial begin
      $dumpfile("mux.vcd"); //Se depositan los datos en este archivo para leerlo en gtkwave
      $dumpvars;
      $display ("\t\t\tclk,\tdata_in0,\tdata_in1,\tdata_out,\treset_L ,\tselector");

      $monitor($time, "\t%b\t%b\t\t%b\t\t%b\t\t%b \t\t%b", clk, data_in0, data_in1, data_out, reset_L, selector); //Datos a mostar
      
      {selector, reset_L} <= 'b0; //Se inicializan estas entradas a 0
      {data_in0, data_in1} <= 2'b00; //Se inicializan entradas en 00



      @(posedge clk); //Como los pulsos no siguen una secuencia, se deben generar uno por uno en cada flanco
      reset_L <= 1;

      @(posedge clk);
      data_in0 <= 2'b11;
      data_in1 <= 2'b10;

      @(posedge clk);
      selector <= 1;
      data_in0 <= 2'b01;
      data_in1 <= 2'b00;

      @(posedge clk);
      data_in0 <= 2'b00;
      data_in1 <= 2'b10;

      @(posedge clk);
      selector <= 0;
      data_in0 <= 2'b11; 
      data_in1 <= 2'b11;

      @(posedge clk);
      selector <= 1;
      data_in0 <= 2'b00;
      data_in1 <= 2'b01;

      @(posedge clk);
      selector <= 0;
      data_in0 <= 2'b10;
      data_in1 <= 2'b00;

      @(posedge clk);

      @(posedge clk); //Para mostrar dos ciclo más
      
      
$finish;
      
   end // initial begin
  
   initial clk <= 0;
   always #2 clk <= ~clk;

endmodule // probador_mux
