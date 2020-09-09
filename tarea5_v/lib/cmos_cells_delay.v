
// Compuerta SN74LVC3G34, $0.29 unidad
// http://www.ti.com/lit/ds/symlink/sn74lvc3g34.pdf?ts=1588861842627
module BUF(A, Y);
input A;
output Y;
assign #(1.4:4.1:4.1) Y = A; // No se indica tiempo tipico
endmodule

// Compuerta SN74LV1T04, $0.22 unidad
// http://www.ti.com/lit/ds/symlink/sn74lv1t04.pdf?ts=1588862169682
module NOT(A, Y);
input A;
output Y;
assign #(0:4.8:5, 0:4.8:5) Y = ~A; // No se indica tiempo minimo
endmodule

// Compuerta SN74AUP2G00-Q1, $0.66 unidad
// http://www.ti.com/lit/ds/symlink/sn74aup2g00-q1.pdf?&ts=1588868916234
module NAND(A, B, Y);
input A, B;
output Y;
assign #(1:2.4:5.2, 1:2.4:5.2) Y = ~(A & B);
endmodule

// Compuerta SN74LVC1G02, $0.08 unidad
// http://www.ti.com/lit/ds/symlink/sn74lvc1g02.pdf?ts=1588862588071
module NOR(A, B, Y);
input A, B;
output Y;
assign #(0.8:3.6:3.6, 0.8:3.6:3.6) Y = ~(A | B);
endmodule

// FFD SN74LVC1G80-Q1, $0.2 unidad
// http://www.ti.com/lit/ds/symlink/sn74lvc1g80-q1.pdf?ts=1588863392876
module DFF(C, D, Q);
input C, D;
output reg Q;
always @(posedge C)
	#4.2 Q <= D;
endmodule

// FFD con SR SN74HCS74-Q1, $0.17 unidad
// http://www.ti.com/lit/ds/symlink/sn74hcs74-q1.pdf?ts=1588864004893
module DFFSR(C, D, Q, S, R);
input C, D, S, R;
output reg Q;
always @(posedge C, posedge S, posedge R)
	if (S)
		#8 Q <= 1'b1;
	else if (R)
		#8 Q <= 1'b0;
	else
		#8 Q <= D;
endmodule