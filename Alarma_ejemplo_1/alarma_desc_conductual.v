module alarma_desc_conductual (
	output reg	sAlr,	// sAlr de tipo reg, almacena el valor
	input 		sLuz,	// No se indica el tipo de sLuz,  wire impl�cito
	input 		sPrta,	// No se indica el tipo de sPrta, wire impl�cito
	input 		sIgn);	// No se indica el tipo de sIgn,  wire impl�cito
	// En las descripciones conductuales, los puertos de entrada son wires.
	// Los puertos de salida pueden ser wires o regs, dependiendo de la
	// implementaci�n.

	always @ (*) begin // always combinacional, bloque de procedimiento/comportamiento
	// (*) Lista de sensitividad, entra al "always" ante cualquier cambio
	// en (sLuz or sPrta or sIgn)
		if (sLuz == 1 & sPrta == 1 & sIgn == 0)
			sAlr 	= 1;	// Asignaci�n bloqueante (=)
      		else
			sAlr	= 0;	// Asignaci�n bloqueante (=)
    	end
endmodule
