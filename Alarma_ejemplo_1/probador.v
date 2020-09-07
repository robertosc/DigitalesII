module probador( // M�dulo probador: generador de se�ales y monitor de datos
	input		sAlr_estr,
	input		sAlr_cond,
	output reg	sLuz,
	output reg	sPrta,
	output reg	sIgn);

	reg 		clk;
	// Bloque de procedimiento, no sintetizable, se recorre una �nica vez
	// Generalmente, los initial s�lo se usan en los testbench o probadores
	// Se recomienda siempre sincronizar con el reloj y utilizar
	// asignaciones no bloqueantes en la generaci�n de se�ales
	initial begin
		$dumpfile("alarma.vcd");	// Nombre de archivo del "dump"
		$dumpvars;			// Directiva para "dumpear" variables
		// Mensaje que se imprime en consola una vez
		$display ("\t\t\tclk,\tsAlr_estr,\tsAlr_cond,\tsLuz,\tsPrta,\tsIgn");
		// Mensaje que se imprime en consola cada vez que un elemento de la lista cambia
		$monitor($time,"\t%b\t%b\t\t%b\t\t%b\t%b\t%b", clk, sAlr_estr, sAlr_cond, sLuz, sPrta, sIgn);
		{sLuz, sPrta, sIgn} = 3'b0; 	// A los 3 bits, asigna un tipo bit con valor 0.
		repeat (8) begin		// Repite 8 veces
								// Es muy importante la notaci�n de sincronizar con @(posedge clk); y luego,
								// hacer una asignaci�n no bloqueante ( <= ), les va a ahorrar tiempo. 
        		@(posedge clk);	// Espera/sincroniza con el flanco positivo del reloj
			{sLuz, sPrta, sIgn} <= {sLuz, sPrta, sIgn} + 1; // Suma 1, asignaci�n no bloqueante 
		end
		@(posedge clk);	
		{sLuz, sPrta, sIgn} <= 'b0;	// Asigna un tipo bit con valor 0, de tama�o N
		$finish;			// Termina de almacenar se�ales
	end
	// Reloj
	initial	clk 	<= 0;			// Valor inicial al reloj, sino siempre ser� indeterminado
	always	#2 clk 	<= ~clk;		// Hace "toggle" cada 2*10ns
endmodule
