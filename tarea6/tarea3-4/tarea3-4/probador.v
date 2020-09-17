`timescale 1ns/100ps
module probador( // M�dulo probador: generador de se�ales y monitor de datos
	output reg clk,
	output reg		reset_L,
	output reg		selector,
	output reg[1:0]	data_in0,
	output reg[1:0]	data_in1,
	output reg gate_stim_indiv,
	output reg gate_stim1,
	output reg gate_stim2,
	input [1:0]	data_out_cond,
	input [1:0] data_out_estr,
	input outAND,
	input outOR,
	input outNOT,
	input outFFD);

	reg [7:0] cnt = 'b0;

	// reg 		clk;
	// Bloque de procedimiento, no sintetizable, se recorre una �nica vez
	// Generalmente, los initial s�lo se usan en los testbench o probadores
	// Se recomienda siempre sincronizar con el reloj y utilizar
	// asignaciones no bloqueantes en la generaci�n de se�ales
	initial begin
		$dumpfile("estr.vcd");	// Nombre de archivo del "dump"
		$dumpvars;			// Directiva para "dumpear" variables
		// Mensaje que se imprime en consola una vez
		$display ("\t\tclk,\treset_L,\tselector,\tdata_in0,\tdata_in1,\tdata_out_estr,\tdata_out_cond,\toutNOT,\toutAND,\toutOR,\toutFFD\tcuenta");
		// Mensaje que se imprime en consola cada vez que un elemento de la lista cambia
		$monitor($time,"\t%b\t%b\t\t%b\t\t%b\t%b\t%b\t%b\t\t%d", clk, reset_L, selector, data_in0, data_in1, data_out_estr, 
		data_out_cond, outNOT, outAND, outOR, outFFD, cnt);
		reset_L = 1'b0;
		selector = 1'b0;
		{data_in0, data_in1} = {2'b0, 2'b0};
		@(posedge clk);
		reset_L <= 1'b1;
		@(posedge clk);
		data_in0 <= 2'b11;
		data_in1 <= 2'b10;
		@(posedge clk);
		selector <= 1'b1;
		data_in0 <= 2'b01;
		data_in1 <= 2'b00;
		@(posedge clk);
		data_in0 <= 2'b00;
		data_in1 <= 2'b10;
		@(posedge clk);
		selector <= 1'b0;
		data_in0 <= 2'b11;
		data_in1 <= 2'b11;
		@(posedge clk);
		selector <= 1'b1;
		data_in0 <= 2'b00;
		data_in1 <= 2'b01;
		@(posedge clk);
		selector <= 1'b0;
		data_in0 <= 2'b10;
		data_in1 <= 2'b00;
		repeat (4) begin
    	@(posedge clk);
    	end
		$finish;			// Termina de almacenar se�ales
	end // initial begin

	initial 
	begin
		gate_stim1 <= 1'b1;
		gate_stim2 <= 1'b1;
		gate_stim_indiv <= 1'b1;

		#6
		gate_stim1 <= 1'b0;
		gate_stim2 <= 1'b1;
		gate_stim_indiv <= 1'b0;

		#6
		gate_stim1 <= 1'b1;
		gate_stim2 <= 1'b0;
		gate_stim_indiv <= 1'b0;

		#6
		gate_stim1 <= 1'b0;
		gate_stim2 <= 1'b0;
		gate_stim_indiv <= 1'b1;
	end

	always @ (posedge clk) begin
      	if (reset_L) begin
         	if (data_out_cond != data_out_estr)
            	$display("Inconsistencia a los %t", $realtime);
      	end
   	end

	always @ (posedge data_out_estr[0]) begin
		cnt = cnt + 1;
	end
	always @ (posedge data_out_estr[1]) begin
		cnt = cnt + 1;
	end

	// Reloj
	initial	clk 	<= 0;			// Valor inicial al reloj, sino siempre ser� indeterminado
	always	#8.9 clk 	<= ~clk;		// Hace "toggle" cada 2*10ns
endmodule
