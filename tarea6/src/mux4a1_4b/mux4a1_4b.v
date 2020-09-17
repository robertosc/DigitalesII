`include "./src/mux2a1_4b/mux2a1_4b.v"

module mux4a1_4b( input clk,
            input 	     reset_L,
            input [1:0]	 selector,
            input 	     valid_0,
            input 	     valid_1,
            input 	     valid_2,
            input 	     valid_3,
            input [3:0]  data_in0,
            input [3:0]  data_in1,
            input [3:0]  data_in2,
            input [3:0]  data_in3,
            output 	     valid_out_conductual,
            output [3:0] data_conductual);

    wire [3:0] salMux1, salMux2;                  //deben ser wires porque no almacenan
    wire 		valid_out_0, valid_out_1;
	reg sel;

	always@(posedge clk) begin
		sel<=selector[1];
	end

    mux2a1_4b mux0(/*AUTOINST*/
		     // Outputs
		     .valid_out_conductual		(valid_out_0),
		     .data_conductual	(salMux1),				//No debe tener []
		     // Inputs
		     .clk		(clk),
		     .reset_L		(reset_L),
		     .selector		(selector[0]),
		     .valid_0		(valid_0),
		     .valid_1		(valid_1),
		     .data_in0		(data_in0[3:0]),
		     .data_in1		(data_in1[3:0]));

    mux2a1_4b mux1(/*AUTOINST*/ 
		     // Outputs
		     .valid_out_conductual		(valid_out_1),
		     .data_conductual	(salMux2),
		     // Inputs
		     .clk		(clk),
		     .reset_L		(reset_L),
		     .selector		(selector[0]),
		     .valid_0		(valid_2),
		     .valid_1		(valid_3),
		     .data_in0		(data_in2[3:0]),
		     .data_in1		(data_in3[3:0]));
  
	mux2a1_4b mux_out(/*AUTOINST*/
		     // Outputs
		     .valid_out_conductual		(valid_out_conductual),
		     .data_conductual	(data_conductual[3:0]),
		     // Inputs
		     .clk		(clk),
		     .reset_L		(reset_L),
		     .selector		(sel),
		     .valid_0		(valid_out_0),
		     .valid_1		(valid_out_1),
		     .data_in0		(salMux1[3:0]),
		     .data_in1		(salMux2[3:0]));
   
endmodule
