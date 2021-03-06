/* Generated by Yosys 0.9 (git sha1 1979e0b) */

(* src = "./src/mux2a1_2b_interno/mux2a1_2b_interno.v:1" *)
module mux2a1_2b_interno(clk, reset_L, selector, valid_0, valid_1, data_in0, data_in1, valid_out_estructural, data_estructural);
  (* src = "./src/mux2a1_2b_interno/mux2a1_2b_interno.v:26" *)
  wire [1:0] _00_;
  (* src = "./src/mux2a1_2b_interno/mux2a1_2b_interno.v:26" *)
  wire _01_;
  wire _02_;
  wire _03_;
  wire _04_;
  wire _05_;
  wire _06_;
  wire _07_;
  wire _08_;
  wire _09_;
  wire _10_;
  wire _11_;
  wire _12_;
  wire _13_;
  wire _14_;
  wire _15_;
  wire _16_;
  wire _17_;
  wire _18_;
  wire _19_;
  wire _20_;
  wire _21_;
  wire _22_;
  (* src = "./src/mux2a1_2b_interno/mux2a1_2b_interno.v:1" *)
  input clk;
  (* src = "./src/mux2a1_2b_interno/mux2a1_2b_interno.v:9" *)
  output [1:0] data_estructural;
  (* src = "./src/mux2a1_2b_interno/mux2a1_2b_interno.v:6" *)
  input [1:0] data_in0;
  (* src = "./src/mux2a1_2b_interno/mux2a1_2b_interno.v:7" *)
  input [1:0] data_in1;
  (* src = "./src/mux2a1_2b_interno/mux2a1_2b_interno.v:2" *)
  input reset_L;
  (* init = 2'h0 *)
  (* src = "./src/mux2a1_2b_interno/mux2a1_2b_interno.v:11" *)
  (* unused_bits = "0 1" *)
  wire [1:0] salMux1;
  (* src = "./src/mux2a1_2b_interno/mux2a1_2b_interno.v:3" *)
  input selector;
  (* src = "./src/mux2a1_2b_interno/mux2a1_2b_interno.v:4" *)
  input valid_0;
  (* src = "./src/mux2a1_2b_interno/mux2a1_2b_interno.v:5" *)
  input valid_1;
  (* src = "./src/mux2a1_2b_interno/mux2a1_2b_interno.v:8" *)
  output valid_out_estructural;
  NOR _23_ (
    .A(_08_),
    .B(_09_),
    .Y(_10_)
  );
  NAND _24_ (
    .A(selector),
    .B(data_in1[0]),
    .Y(_11_)
  );
  NAND _25_ (
    .A(_02_),
    .B(data_in0[0]),
    .Y(_12_)
  );
  NAND _26_ (
    .A(_11_),
    .B(_12_),
    .Y(_13_)
  );
  NOR _27_ (
    .A(_10_),
    .B(_13_),
    .Y(_14_)
  );
  NAND _28_ (
    .A(_03_),
    .B(_10_),
    .Y(_15_)
  );
  NAND _29_ (
    .A(reset_L),
    .B(_15_),
    .Y(_16_)
  );
  NOR _30_ (
    .A(_14_),
    .B(_16_),
    .Y(_00_[0])
  );
  NAND _31_ (
    .A(selector),
    .B(data_in1[1]),
    .Y(_17_)
  );
  NAND _32_ (
    .A(_02_),
    .B(data_in0[1]),
    .Y(_18_)
  );
  NAND _33_ (
    .A(_17_),
    .B(_18_),
    .Y(_19_)
  );
  NOR _34_ (
    .A(_10_),
    .B(_19_),
    .Y(_20_)
  );
  NAND _35_ (
    .A(_04_),
    .B(_10_),
    .Y(_21_)
  );
  NAND _36_ (
    .A(reset_L),
    .B(_21_),
    .Y(_22_)
  );
  NOR _37_ (
    .A(_20_),
    .B(_22_),
    .Y(_00_[1])
  );
  NOR _38_ (
    .A(_05_),
    .B(_10_),
    .Y(_01_)
  );
  NOT _39_ (
    .A(selector),
    .Y(_02_)
  );
  NOT _40_ (
    .A(data_estructural[0]),
    .Y(_03_)
  );
  NOT _41_ (
    .A(data_estructural[1]),
    .Y(_04_)
  );
  NOT _42_ (
    .A(reset_L),
    .Y(_05_)
  );
  NOT _43_ (
    .A(valid_0),
    .Y(_06_)
  );
  NAND _44_ (
    .A(selector),
    .B(valid_1),
    .Y(_07_)
  );
  NOT _45_ (
    .A(_07_),
    .Y(_08_)
  );
  NOR _46_ (
    .A(selector),
    .B(_06_),
    .Y(_09_)
  );
  (* src = "./src/mux2a1_2b_interno/mux2a1_2b_interno.v:26" *)
  DFF _47_ (
    .C(clk),
    .D(_01_),
    .Q(valid_out_estructural)
  );
  (* src = "./src/mux2a1_2b_interno/mux2a1_2b_interno.v:26" *)
  DFF _48_ (
    .C(clk),
    .D(_00_[0]),
    .Q(data_estructural[0])
  );
  (* src = "./src/mux2a1_2b_interno/mux2a1_2b_interno.v:26" *)
  DFF _49_ (
    .C(clk),
    .D(_00_[1]),
    .Q(data_estructural[1])
  );
endmodule

(* src = "./src/mux2a1_4b_interno/mux2a1_4b_interno.v:3" *)
module mux2a1_4b_interno(clk, reset_L, selector, valid_0, valid_1, data_in0, data_in1, valid_out_estructural, data_estructural);
  (* src = "./src/mux2a1_4b_interno/mux2a1_4b_interno.v:3" *)
  input clk;
  (* src = "./src/mux2a1_4b_interno/mux2a1_4b_interno.v:11" *)
  output [3:0] data_estructural;
  (* src = "./src/mux2a1_4b_interno/mux2a1_4b_interno.v:8" *)
  input [3:0] data_in0;
  (* src = "./src/mux2a1_4b_interno/mux2a1_4b_interno.v:9" *)
  input [3:0] data_in1;
  (* src = "./src/mux2a1_4b_interno/mux2a1_4b_interno.v:4" *)
  input reset_L;
  (* src = "./src/mux2a1_4b_interno/mux2a1_4b_interno.v:5" *)
  input selector;
  (* src = "./src/mux2a1_4b_interno/mux2a1_4b_interno.v:6" *)
  input valid_0;
  (* src = "./src/mux2a1_4b_interno/mux2a1_4b_interno.v:7" *)
  input valid_1;
  (* src = "./src/mux2a1_4b_interno/mux2a1_4b_interno.v:10" *)
  output valid_out_estructural;
  (* module_not_derived = 32'd1 *)
  (* src = "./src/mux2a1_4b_interno/mux2a1_4b_interno.v:13" *)
  mux2a1_2b_interno mux0 (
    .clk(clk),
    .data_estructural(data_estructural[3:2]),
    .data_in0(data_in0[3:2]),
    .data_in1(data_in1[3:2]),
    .reset_L(reset_L),
    .selector(selector),
    .valid_0(valid_0),
    .valid_1(valid_1),
    .valid_out_estructural(valid_out_estructural)
  );
  (* module_not_derived = 32'd1 *)
  (* src = "./src/mux2a1_4b_interno/mux2a1_4b_interno.v:24" *)
  mux2a1_2b_interno mux1 (
    .clk(clk),
    .data_estructural(data_estructural[1:0]),
    .data_in0(data_in0[1:0]),
    .data_in1(data_in1[1:0]),
    .reset_L(reset_L),
    .selector(selector),
    .valid_0(valid_0),
    .valid_1(valid_1),
    .valid_out_estructural(valid_out_estructural)
  );
endmodule

(* top =  1  *)
(* src = "./src/sintetizado4a1_4b_cmos/sintetizado4a1_4b_cmos.v:3" *)
module sintetizado4a1_4b_cmos(clk, reset_L, selector, valid_0, valid_1, valid_2, valid_3, data_in0, data_in1, data_in2, data_in3, valid_out_estructural, data_estructural);
  (* src = "./src/sintetizado4a1_4b_cmos/sintetizado4a1_4b_cmos.v:3" *)
  input clk;
  (* src = "./src/sintetizado4a1_4b_cmos/sintetizado4a1_4b_cmos.v:15" *)
  output [3:0] data_estructural;
  (* src = "./src/sintetizado4a1_4b_cmos/sintetizado4a1_4b_cmos.v:10" *)
  input [3:0] data_in0;
  (* src = "./src/sintetizado4a1_4b_cmos/sintetizado4a1_4b_cmos.v:11" *)
  input [3:0] data_in1;
  (* src = "./src/sintetizado4a1_4b_cmos/sintetizado4a1_4b_cmos.v:12" *)
  input [3:0] data_in2;
  (* src = "./src/sintetizado4a1_4b_cmos/sintetizado4a1_4b_cmos.v:13" *)
  input [3:0] data_in3;
  (* src = "./src/sintetizado4a1_4b_cmos/sintetizado4a1_4b_cmos.v:4" *)
  input reset_L;
  (* src = "./src/sintetizado4a1_4b_cmos/sintetizado4a1_4b_cmos.v:17" *)
  wire [3:0] salMux1;
  (* src = "./src/sintetizado4a1_4b_cmos/sintetizado4a1_4b_cmos.v:17" *)
  wire [3:0] salMux2;
  (* src = "./src/sintetizado4a1_4b_cmos/sintetizado4a1_4b_cmos.v:19" *)
  wire sel;
  (* src = "./src/sintetizado4a1_4b_cmos/sintetizado4a1_4b_cmos.v:5" *)
  input [1:0] selector;
  (* src = "./src/sintetizado4a1_4b_cmos/sintetizado4a1_4b_cmos.v:6" *)
  input valid_0;
  (* src = "./src/sintetizado4a1_4b_cmos/sintetizado4a1_4b_cmos.v:7" *)
  input valid_1;
  (* src = "./src/sintetizado4a1_4b_cmos/sintetizado4a1_4b_cmos.v:8" *)
  input valid_2;
  (* src = "./src/sintetizado4a1_4b_cmos/sintetizado4a1_4b_cmos.v:9" *)
  input valid_3;
  (* src = "./src/sintetizado4a1_4b_cmos/sintetizado4a1_4b_cmos.v:18" *)
  wire valid_out_0;
  (* src = "./src/sintetizado4a1_4b_cmos/sintetizado4a1_4b_cmos.v:18" *)
  wire valid_out_1;
  (* src = "./src/sintetizado4a1_4b_cmos/sintetizado4a1_4b_cmos.v:14" *)
  output valid_out_estructural;
  (* src = "./src/sintetizado4a1_4b_cmos/sintetizado4a1_4b_cmos.v:21" *)
  DFF _0_ (
    .C(clk),
    .D(selector[1]),
    .Q(sel)
  );
  (* module_not_derived = 32'd1 *)
  (* src = "./src/sintetizado4a1_4b_cmos/sintetizado4a1_4b_cmos.v:25" *)
  mux2a1_4b_interno mux0 (
    .clk(clk),
    .data_estructural(salMux1),
    .data_in0(data_in0),
    .data_in1(data_in1),
    .reset_L(reset_L),
    .selector(selector[0]),
    .valid_0(valid_0),
    .valid_1(valid_1),
    .valid_out_estructural(valid_out_0)
  );
  (* module_not_derived = 32'd1 *)
  (* src = "./src/sintetizado4a1_4b_cmos/sintetizado4a1_4b_cmos.v:38" *)
  mux2a1_4b_interno mux1 (
    .clk(clk),
    .data_estructural(salMux2),
    .data_in0(data_in2),
    .data_in1(data_in3),
    .reset_L(reset_L),
    .selector(selector[0]),
    .valid_0(valid_2),
    .valid_1(valid_3),
    .valid_out_estructural(valid_out_1)
  );
  (* module_not_derived = 32'd1 *)
  (* src = "./src/sintetizado4a1_4b_cmos/sintetizado4a1_4b_cmos.v:51" *)
  mux2a1_4b_interno mux_out (
    .clk(clk),
    .data_estructural(data_estructural),
    .data_in0(salMux1),
    .data_in1(salMux2),
    .reset_L(reset_L),
    .selector(sel),
    .valid_0(valid_out_0),
    .valid_1(valid_out_1),
    .valid_out_estructural(valid_out_estructural)
  );
endmodule
