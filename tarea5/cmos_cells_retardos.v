
module BUF(A, Y);
input A;
output Y;
assign #(1.4:4.1:4.1) Y = A;
endmodule

module NOT(A, Y);
input A;
output Y;
assign #(1:3.5:6, 1:3.5:6) Y = ~A;
endmodule

module NAND(A, B, Y); //SN74LVC1G38
input A, B;
output Y;
assign #(0.9:1.6:2.4, 0.9:1.6:2.4) Y = ~(A & B);
endmodule

module NOR(A, B, Y);
input A, B;
output Y;
assign #(0.8:2.1:3.4, 0.8:2.1:3.4) Y = ~(A | B);
endmodule

module DFF(C, D, Q); //(1.1:2.4:3.8)
input C, D;
output reg Q;
always @(posedge C)
	#(1.1:2.4:3.8) Q <= D;
endmodule

module DFFSR(C, D, Q, S, R);
//assign #(1:3.5:6, 1:3.5:6)
input C, D, S, R;
output reg Q;
always @(posedge C, posedge S, posedge R)
	if (S)
		Q <= 1'b1;
	else if (R)
		Q <= 1'b0;
	else
		Q <= D;
endmodule

