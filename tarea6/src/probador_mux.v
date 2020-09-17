module probador_mux(input [3:0] data_conductual,
         input [3:0] data_estructural,
         input valid_out_conductual,
         input valid_out_estructural,
         output reg valid_0,
         output reg valid_1,
         output reg valid_2,
         output reg valid_3,
         output reg reset_L,
         output reg [3:0] data_in0,
         output reg [3:0] data_in1,
         output reg [3:0] data_in2,
         output reg [3:0] data_in3,
         output reg [1:0] selector,
         output reg clk);
   initial begin
      $dumpfile("mux.vcd"); //Se depositan los datos en este archivo para leerlo en gtkwave
      $dumpvars;
      //$display ("\t\t\tclk,\tdata_in0,\tdata_in1,\tdata_out,\treset_L ,\tselector");

      //$monitor($time, "\t%b\t%b\t\t%b\t\t%b\t\t%b \t\t%b", clk, data_in0, data_in1, data_out, reset_L, selector); //Datos a mostar
      selector <= 2'b00;
      reset_L <= 'b0; //Se inicializan estas entradas a 0
      {data_in0, data_in1, data_in2, data_in3} <= 4'b0000; //Se inicializan entradas en 00
      {valid_0, valid_1, valid_2, valid_3} <= 0;
      
      @(posedge clk); //Como los pulsos no siguen una secuencia, se deben generar uno por uno en cada flanco
      reset_L <= 1;
      selector <= 2'b01;
      data_in0 <= 1101;
      valid_1 <= 0;
      valid_0 <= 1;
      valid_2 <= 0;
      valid_3 <= 1;

      @(posedge clk);
      selector <= 2'b01;
      data_in1 <= 4'b1010;
      data_in0 <= 4'b1101;
      data_in2 <= 4'b0100;
      data_in3 <= 4'b0011;
      valid_1 <= 1;
      valid_0 <= 1;
      valid_2 <= 0;
      valid_3 <= 0;

      @(posedge clk);
      selector <= 2'b10;
      data_in0 <= 4'b0101;
      data_in1 <= 4'b1000;
      data_in2 <= 4'b1110;
      data_in3 <= 4'b1111;
      valid_1 <= 0;
      valid_0 <= 1;
      valid_2 <= 1;
      valid_3 <= 1;

      @(posedge clk);
      selector <= 2'b11;
      data_in0 <= 4'b0100;
      data_in1 <= 4'b1001;
      data_in2 <= 4'b1010;
      data_in3 <= 4'b1011;
      valid_1 <= 1;
      valid_0 <= 1;
      valid_2 <= 1;
      valid_3 <= 0;

      @(posedge clk);
      valid_1 <= 0;
      valid_0 <= 1;
      valid_2 <= 0;
      valid_3 <= 1;
      selector <= 2'b01;
      data_in0 <= 4'b0111; 
      data_in1 <= 4'b1011;
      data_in2 <= 4'b1110;
      data_in3 <= 4'b0011;


      @(posedge clk);
      selector <= 1;
      data_in0 <= 4'b0100;
      data_in1 <= 4'b0101;
      data_in2 <= 4'b1000;
      data_in3 <= 4'b1111;
      selector <= 2'b10;
      valid_1 <= 0;
      valid_0 <= 1;
      valid_2 <= 0;
      valid_3 <= 1;

      @(posedge clk);
      selector <= 0;
      data_in0 <= 4'b1010;
      data_in1 <= 4'b0000;
      data_in2 <= 4'b1001;
      data_in3 <= 4'b1011;
      selector <= 2'b10;
      valid_1 <= 1;
      valid_0 <= 1;
      valid_2 <= 1;
      valid_3 <= 1;

      @(posedge clk);

      @(posedge clk);

      @(posedge clk); //Para mostrar dos ciclo más
      
      
$finish;
      
   end // initial begin

   always @(posedge clk) begin
      if(data_conductual != data_estructural) begin
         $display($time, "s\tLas señales no son iguales");
      end
      if(data_conductual == data_estructural) begin
         $display($time, "s\tOK");
      end
   end

   initial clk <= 0;
   always #2 clk <= ~clk;

endmodule // probador_mux
