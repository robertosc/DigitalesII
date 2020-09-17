module mux2a1_2b( input clk,
            input 	    reset_L,
            input 	    selector,
            input        valid_0,
            input        valid_1,
            input [1:0] 	    data_in0,
            input [1:0] 	    data_in1,
            output reg         valid_out_conductual,
            output reg [1:0] data_conductual);

      reg [1:0] salMux1 = 2'b00;                  //se genera un elemento para conexión capaz de almacenar datos
      reg salValid;
      //Valid en 1 pasa
      always @(*) begin
            //salMux1 = 1'b0;               //se inicializa el valor de conexión a 0
            if (selector == 0) begin
                  salValid = valid_0;
	            salMux1 = data_in0;     //Dependiendo del valor del selector, se pasa a la salida del mux
            end
            else begin
                  salValid = valid_1;
                  salMux1 = data_in1;
            end
      end

      always @(posedge clk) begin         //Se hace otro elemento que lee únicamente en el flanco positivo de reloj, este elemento resetea o deja pasar el dato y lo guarda
            if (reset_L == 0) begin
	            data_conductual <= 0;          //Si reset_L esta en 0 se resetea, caso contrario se pasa el dato del primer mux 
                  valid_out_conductual <= 0; 
            end
            else begin                    //El valid afecta acá, si valid está en 1 deja pasar, si no pasa el val pasado
                  if ((selector == 0 && valid_0 == 1) || (selector == 1 && valid_1 == 1)) begin   
                        data_conductual <= salMux1;
                  end
                  valid_out_conductual <= salValid;
            end
      end
endmodule
