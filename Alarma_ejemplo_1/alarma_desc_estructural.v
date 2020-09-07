module alarma_desc_estructural (
	output 	sAlr,	// No se indica el tipo de sAlr,  wire impl�cito
	input 	sLuz,	// No se indica el tipo de sLuz,  wire impl�cito
	input 	sPrta,	// No se indica el tipo de sPrta, wire impl�cito
	input 	sIgn);	// No se indica el tipo de sIgn,  wire impl�cito
	// En las descripciones estructurales, los puertos de entrada y 
	// salida siempre son wires.
	// wire x; // En este escenario, la declaraci�n de x es impl�cita
	// Compuerta "not" primitiva de Verilog, retardo de propagaci�n = 1
	not #1 gate1(	x,	// Salida, primer puerto
			sIgn);	// Entradas, segundo puerto y otros

	// Compuerta "and" primitiva de Verilog, retardo de propagaci�n = 1
	and #1 gate2(	sAlr,	// Salida, primer puerto
			sLuz,	// Entradas, segundo puerto y otros
			sPrta,
			x);
endmodule
