`timescale 1ns/100ps

//Representación de la compuerta NOT SN74LV1T04, $0.22 unidad, CL = 15 pF
module my_not (input IN,
              output OUT);
    //assign #(1:3.5:6, 1:3.5:6) OUT = ~IN;  
    assign #(0:4:5, 0:4:5) OUT = ~IN;//La hoja del fabricante no indica tiempo mínimo 
endmodule

// Representación de la compuerta OR SN74LVC2G32-Q1, $0.46 unidad,
module my_or (input A,
              input B,
              output OUT);
    //assign #(1:3.7:6.5, 1:4:7) OUT = A | B;
    assign #(1:5.8:5.8, 1:5.8:5.8) OUT = A | B; // Vcc = 3.3 V. La hoja del fabricante no indica tiempo típico, se asume peor caso
endmodule

// Representación de la compuerta AND SN74AUP2G08, $0.35 unidad
module my_and (input A,
              input B,
              output OUT);
    //assign #(0.8:2.1:3.4, 0.8:2.1:3.4) OUT = A & B;
    assign #(0.9:3.3:5.5, 0.9:3.3:5.5) OUT = A & B; // Vcc = 3.3 V, CL = 15 pF
endmodule

// Representación del FFD SN74LVC1G80-Q1, $0.2 unidad, tpd(1.3:4.2), no indica tiempo típico, se asume peor caso
module my_flop (input [1:0] D,
                input clk,
                output reg [1:0] Q);
    always @(posedge clk)
        #4.2
        Q <= D;
endmodule

// Representación del diagrama del IC SN74LVC2G157, $1.11 unidad
module my_1bit_mux(input A,
              input B,
              input SEL,
              output OUT);
    wire salAndA_notSel, salAndB_Sel, salNotSel;
    my_not notSel( .IN(SEL),
                   .OUT(salNotSel));
    
    my_and andA_notSel ( .A(A),
                         .B(salNotSel),
                         .OUT(salAndA_notSel));

    my_and andB_Sel ( .A(B),
                      .B(SEL),
                      .OUT(salAndB_Sel));

    my_or orOUT ( .A(salAndA_notSel),
                  .B(salAndB_Sel),
                  .OUT(OUT));
endmodule

module my_2bit_mux(input [1:0] A,
                   input [1:0] B,
                   input SEL,
                   output [1:0] OUT);
    
    my_1bit_mux mux0( .A(A[0]),
                      .B(B[0]),
                      .SEL(SEL),
                      .OUT(OUT[0]));

    my_1bit_mux mux1( .A(A[1]),
                      .B(B[1]),
                      .SEL(SEL),
                      .OUT(OUT[1]));

endmodule