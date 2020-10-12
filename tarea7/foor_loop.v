module for_loop (output reg [15:0] for_out);
// Integer, no es un cable que se sintetiza, es simplemente para la iteración del for loop
integer i = 0;
always @ (*) begin
	// Valor por defecto
	for_out = 'b0;
	// For loop utilizado para escribir menos líneas
	// y a la vez que la cantidad de líneas las determine el for loop.
	for(i = 0; i < 4; i = i + 1) begin
		// Indexación por partes, a la izquierda del "+:" el bit inicial,
		// a la derecha del "+:" el tamaño del bus. En el ejemplo, cuando i=0,
		// for_out [4*0 +: 4] = 0; es igual a for_out [3:0] = 0; con 3=0+(4-1)
		// con i=1, for_out [4*1 +: 4] = 4'd1; es igual a for_out [7:4] = 1; con 7=4+(4-1)
		for_out [4*i +: 4] = i;		//parte de 4*i y toma 4 bits a partir de eso
	end
end
endmodule