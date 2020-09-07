module mux(input clk,
	   input 	    reset_L,
	   input 	    selector,
	   input [1:0] 	    data_in0,
	   input [1:0] 	    data_in1,
	   output reg [1:0] data_out);

   reg [1:0] salMux1; //se genera un elemento para conexión capaz de almacenar datos
   
   
   always @(*) begin
      salMux1 = 1'b0; //se inicializa el valor de conexión a 0
      if (selector == 0)
	salMux1 = data_in0; //Dependiendo del valor del selector, se pasa a la salida del mux
      else
	salMux1 = data_in1;
   end

   always @(posedge clk) begin //Se hace otro elemento que lee únicamente en el flanco positivo de reloj, este elemento resetea o deja pasar el dato y lo guarda

      if (reset_L == 0)
	data_out <= 0; //Si reset_L esta en 0 se resetea, caso contrario se pasa el dato del primer mux 
      else
	data_out <= salMux1;
   end
endmodule
