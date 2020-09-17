`timescale 1ns/100ps

module and_gate(input  in_A,
		input  in_B,
		output and_output); //-40 85 5V+-0.5 SN74LVC1G08

	assign #(0.8:2.1:3.4, 0.8:2.1:3.4) and_output = in_A & in_B;
endmodule // and_gate

module or_gate(input  in_A,
			input  in_B,
	    	output or_output); //-40 85 5V+-0.5 SN74AHC1G32

	assign #(1:3.7:6.5, 1:4:7) or_output = in_A | in_B;
endmodule // or_gate

module not_gate(input in_A,
		output not_output); //-40 85 +5V SN74AHC1GU04

	assign #(1:3.5:6, 1:3.5:6) not_output = ~in_A;
endmodule // not_gate

module flipflop(input [1:0] D,
		input  clk,
		output reg[1:0] Q); //SN74LVC1G80 5V -40 85
	always @(posedge clk) begin
    	//#1//
		#2.4 //Se usa un retardo tpd  promedio de min y max (1.1:2.45:3.8)
		Q <= D;
	end
endmodule // flipflop

module mux21(input  selector,
		input  in_A,
		input  in_B,
		output mux_output);
	wire 	    and_out1, and_out2, not_out;

	not_gate negSelector(.in_A(selector),
			.not_output(not_out));

	and_gate andGate1(.in_A(in_A),
			.in_B(not_out),
			.and_output(and_out1));

	and_gate andGate2(.in_A(in_B),
			.in_B(selector),
			.and_output(and_out2));

	or_gate orGate(.in_A(and_out1),
			.in_B(and_out2),
			.or_output(mux_output));

endmodule // mux21

module twobits_mux21(input selector,
		input  [1:0]in_A,
		input  [1:0]in_B,
		output [1:0] mux_out);

	mux21 muxA(.selector(selector),
		.in_A(in_A[0]),
		.in_B(in_B[0]),
		.mux_output(mux_out[0]));

	mux21 muxB(.selector(selector),
		.in_A(in_A[1]),
		.in_B(in_B[1]),
		.mux_output(mux_out[1]));

endmodule // bits2_mux21
