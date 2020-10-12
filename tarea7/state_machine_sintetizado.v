/* Generated by Yosys 0.9 (git sha1 1979e0b) */

(* dynports =  1  *)
(* cells_not_processed =  1  *)
(* src = "state_machine_sintetizado.v:1" *)
module state_machine_sintetizado(reset, clk, data_bus, data_out_bus_sint, control_out_sint, error_sint);
  (* src = "state_machine_sintetizado.v:27" *)
  wire [4:0] _000_;
  (* src = "state_machine_sintetizado.v:27" *)
  wire _001_;
  (* src = "state_machine_sintetizado.v:27" *)
  wire [3:0] _002_;
  (* src = "state_machine_sintetizado.v:47" *)
  wire _003_;
  (* src = "state_machine_sintetizado.v:27" *)
  wire [4:0] _004_;
  wire _005_;
  wire _006_;
  wire _007_;
  wire _008_;
  wire _009_;
  wire _010_;
  (* src = "state_machine_sintetizado.v:14" *)
  wire _011_;
  (* src = "state_machine_sintetizado.v:14" *)
  wire _012_;
  wire _013_;
  wire _014_;
  wire _015_;
  wire _016_;
  wire _017_;
  wire _018_;
  wire _019_;
  wire _020_;
  wire _021_;
  wire _022_;
  wire _023_;
  wire _024_;
  wire _025_;
  wire _026_;
  wire _027_;
  wire _028_;
  wire _029_;
  wire _030_;
  wire _031_;
  wire _032_;
  wire _033_;
  wire _034_;
  wire _035_;
  wire _036_;
  wire _037_;
  wire _038_;
  wire _039_;
  wire _040_;
  wire _041_;
  wire _042_;
  wire _043_;
  wire _044_;
  wire _045_;
  wire _046_;
  wire _047_;
  wire _048_;
  wire _049_;
  wire _050_;
  wire _051_;
  wire _052_;
  wire _053_;
  wire _054_;
  wire _055_;
  wire _056_;
  wire _057_;
  wire _058_;
  wire _059_;
  wire _060_;
  wire _061_;
  wire _062_;
  wire _063_;
  wire _064_;
  wire _065_;
  wire _066_;
  wire _067_;
  wire _068_;
  wire _069_;
  wire _070_;
  wire _071_;
  wire _072_;
  wire _073_;
  wire _074_;
  wire _075_;
  wire _076_;
  wire _077_;
  wire _078_;
  wire _079_;
  wire _080_;
  wire _081_;
  wire _082_;
  wire _083_;
  wire _084_;
  wire _085_;
  wire _086_;
  wire _087_;
  wire _088_;
  wire _089_;
  wire _090_;
  wire _091_;
  wire _092_;
  wire _093_;
  wire _094_;
  wire _095_;
  wire _096_;
  wire _097_;
  wire _098_;
  wire _099_;
  wire _100_;
  wire _101_;
  wire _102_;
  (* src = "state_machine_sintetizado.v:18" *)
  wire [3:0] buffer;
  (* src = "state_machine_sintetizado.v:6" *)
  input clk;
  (* src = "state_machine_sintetizado.v:9" *)
  output [3:0] control_out_sint;
  (* src = "state_machine_sintetizado.v:15" *)
  wire [4:0] counter;
  (* src = "state_machine_sintetizado.v:7" *)
  input [15:0] data_bus;
  (* src = "state_machine_sintetizado.v:8" *)
  output [15:0] data_out_bus_sint;
  (* src = "state_machine_sintetizado.v:10" *)
  output error_sint;
  (* src = "state_machine_sintetizado.v:18" *)
  wire [3:0] f_code;
  (* src = "state_machine_sintetizado.v:16" *)
  wire next_error_sint;
  (* src = "state_machine_sintetizado.v:14" *)
  (* unused_bits = "0 1 2" *)
  wire [4:0] next_state;
  (* src = "state_machine_sintetizado.v:5" *)
  input reset;
  (* onehot = 32'd1 *)
  wire [4:0] state;
  NOT _103_ (
    .A(state[1]),
    .Y(_048_)
  );
  NOT _104_ (
    .A(state[4]),
    .Y(_049_)
  );
  NOT _105_ (
    .A(state[0]),
    .Y(_050_)
  );
  NOT _106_ (
    .A(f_code[3]),
    .Y(_051_)
  );
  NOT _107_ (
    .A(reset),
    .Y(_005_)
  );
  NOT _108_ (
    .A(f_code[2]),
    .Y(_052_)
  );
  NOT _109_ (
    .A(next_error_sint),
    .Y(_053_)
  );
  NOT _110_ (
    .A(data_bus[1]),
    .Y(_054_)
  );
  NOT _111_ (
    .A(data_bus[2]),
    .Y(_055_)
  );
  NOT _112_ (
    .A(data_bus[14]),
    .Y(_056_)
  );
  NOT _113_ (
    .A(data_bus[15]),
    .Y(_057_)
  );
  NAND _114_ (
    .A(f_code[1]),
    .B(data_bus[13]),
    .Y(_058_)
  );
  NOT _115_ (
    .A(_058_),
    .Y(_059_)
  );
  NOR _116_ (
    .A(f_code[1]),
    .B(data_bus[13]),
    .Y(_060_)
  );
  NOT _117_ (
    .A(_060_),
    .Y(_061_)
  );
  NAND _118_ (
    .A(_058_),
    .B(_061_),
    .Y(_062_)
  );
  NOR _119_ (
    .A(_059_),
    .B(_060_),
    .Y(_063_)
  );
  NAND _120_ (
    .A(f_code[0]),
    .B(data_bus[12]),
    .Y(_064_)
  );
  NOT _121_ (
    .A(_064_),
    .Y(_065_)
  );
  NOR _122_ (
    .A(f_code[0]),
    .B(data_bus[12]),
    .Y(_066_)
  );
  NOT _123_ (
    .A(_066_),
    .Y(_067_)
  );
  NAND _124_ (
    .A(_064_),
    .B(_067_),
    .Y(_068_)
  );
  NOR _125_ (
    .A(_065_),
    .B(_066_),
    .Y(_069_)
  );
  NOR _126_ (
    .A(_063_),
    .B(_069_),
    .Y(_070_)
  );
  NAND _127_ (
    .A(_062_),
    .B(_068_),
    .Y(_071_)
  );
  NOR _128_ (
    .A(_051_),
    .B(data_bus[15]),
    .Y(_072_)
  );
  NAND _129_ (
    .A(f_code[3]),
    .B(_057_),
    .Y(_073_)
  );
  NOR _130_ (
    .A(f_code[3]),
    .B(_057_),
    .Y(_074_)
  );
  NAND _131_ (
    .A(_051_),
    .B(data_bus[15]),
    .Y(_075_)
  );
  NOR _132_ (
    .A(_072_),
    .B(_074_),
    .Y(_076_)
  );
  NAND _133_ (
    .A(_073_),
    .B(_075_),
    .Y(_077_)
  );
  NOR _134_ (
    .A(_052_),
    .B(data_bus[14]),
    .Y(_078_)
  );
  NAND _135_ (
    .A(f_code[2]),
    .B(_056_),
    .Y(_079_)
  );
  NOR _136_ (
    .A(f_code[2]),
    .B(_056_),
    .Y(_080_)
  );
  NAND _137_ (
    .A(_052_),
    .B(data_bus[14]),
    .Y(_081_)
  );
  NOR _138_ (
    .A(_078_),
    .B(_080_),
    .Y(_082_)
  );
  NAND _139_ (
    .A(_079_),
    .B(_081_),
    .Y(_083_)
  );
  NOR _140_ (
    .A(_077_),
    .B(_083_),
    .Y(_084_)
  );
  NAND _141_ (
    .A(_076_),
    .B(_082_),
    .Y(_085_)
  );
  NOR _142_ (
    .A(_071_),
    .B(_085_),
    .Y(_086_)
  );
  NAND _143_ (
    .A(_070_),
    .B(_084_),
    .Y(_087_)
  );
  NAND _144_ (
    .A(reset),
    .B(_086_),
    .Y(_088_)
  );
  NOT _145_ (
    .A(_088_),
    .Y(_089_)
  );
  NOR _146_ (
    .A(counter[4]),
    .B(data_bus[0]),
    .Y(_090_)
  );
  NAND _147_ (
    .A(_054_),
    .B(_055_),
    .Y(_091_)
  );
  NOR _148_ (
    .A(data_bus[3]),
    .B(_091_),
    .Y(_092_)
  );
  NAND _149_ (
    .A(_090_),
    .B(_092_),
    .Y(_093_)
  );
  NOT _150_ (
    .A(_093_),
    .Y(_094_)
  );
  NOR _151_ (
    .A(state[3]),
    .B(state[2]),
    .Y(_095_)
  );
  NOT _152_ (
    .A(_095_),
    .Y(_096_)
  );
  NOR _153_ (
    .A(_093_),
    .B(_095_),
    .Y(_097_)
  );
  NAND _154_ (
    .A(_089_),
    .B(_097_),
    .Y(_098_)
  );
  NOT _155_ (
    .A(_098_),
    .Y(_006_)
  );
  NAND _156_ (
    .A(reset),
    .B(_087_),
    .Y(_099_)
  );
  NAND _157_ (
    .A(_048_),
    .B(_049_),
    .Y(_100_)
  );
  NOR _158_ (
    .A(_096_),
    .B(_100_),
    .Y(_101_)
  );
  NOR _159_ (
    .A(_099_),
    .B(_101_),
    .Y(_008_)
  );
  NOT _160_ (
    .A(_008_),
    .Y(_102_)
  );
  NAND _161_ (
    .A(_098_),
    .B(_102_),
    .Y(_004_[1])
  );
  NAND _162_ (
    .A(state[0]),
    .B(reset),
    .Y(_013_)
  );
  NOT _163_ (
    .A(_013_),
    .Y(_014_)
  );
  NAND _164_ (
    .A(_095_),
    .B(_100_),
    .Y(_015_)
  );
  NOR _165_ (
    .A(_088_),
    .B(_015_),
    .Y(_016_)
  );
  NOR _166_ (
    .A(_014_),
    .B(_016_),
    .Y(_017_)
  );
  NOT _167_ (
    .A(_017_),
    .Y(_007_)
  );
  NAND _168_ (
    .A(_099_),
    .B(_017_),
    .Y(_004_[0])
  );
  NAND _169_ (
    .A(_093_),
    .B(_096_),
    .Y(_018_)
  );
  NOR _170_ (
    .A(_088_),
    .B(_018_),
    .Y(_004_[2])
  );
  NOR _171_ (
    .A(_094_),
    .B(_100_),
    .Y(_019_)
  );
  NOR _172_ (
    .A(_087_),
    .B(_019_),
    .Y(_020_)
  );
  NOR _173_ (
    .A(state[0]),
    .B(_020_),
    .Y(_003_)
  );
  NOR _174_ (
    .A(f_code[3]),
    .B(reset),
    .Y(_021_)
  );
  NOT _175_ (
    .A(_021_),
    .Y(_002_[3])
  );
  NOR _176_ (
    .A(reset),
    .B(f_code[0]),
    .Y(_022_)
  );
  NOT _177_ (
    .A(_022_),
    .Y(_002_[0])
  );
  NOR _178_ (
    .A(reset),
    .B(f_code[2]),
    .Y(_023_)
  );
  NOT _179_ (
    .A(_023_),
    .Y(_002_[2])
  );
  NOR _180_ (
    .A(reset),
    .B(f_code[1]),
    .Y(_024_)
  );
  NOT _181_ (
    .A(_024_),
    .Y(_002_[1])
  );
  NAND _182_ (
    .A(_050_),
    .B(_086_),
    .Y(_025_)
  );
  NOR _183_ (
    .A(_100_),
    .B(_025_),
    .Y(_026_)
  );
  NAND _184_ (
    .A(_011_),
    .B(_095_),
    .Y(_027_)
  );
  NAND _185_ (
    .A(_026_),
    .B(_027_),
    .Y(_028_)
  );
  NAND _186_ (
    .A(_012_),
    .B(_101_),
    .Y(_029_)
  );
  NAND _187_ (
    .A(_086_),
    .B(_029_),
    .Y(_030_)
  );
  NOR _188_ (
    .A(_097_),
    .B(_030_),
    .Y(_031_)
  );
  NOR _189_ (
    .A(state[0]),
    .B(_031_),
    .Y(_032_)
  );
  NOT _190_ (
    .A(_032_),
    .Y(_033_)
  );
  NOR _191_ (
    .A(_028_),
    .B(_033_),
    .Y(_034_)
  );
  NOR _192_ (
    .A(_018_),
    .B(_025_),
    .Y(_035_)
  );
  NOT _193_ (
    .A(_035_),
    .Y(_036_)
  );
  NAND _194_ (
    .A(_028_),
    .B(_036_),
    .Y(_037_)
  );
  NOR _195_ (
    .A(_032_),
    .B(_037_),
    .Y(_038_)
  );
  NOR _196_ (
    .A(_034_),
    .B(_038_),
    .Y(_039_)
  );
  NOR _197_ (
    .A(counter[4]),
    .B(_039_),
    .Y(_040_)
  );
  NAND _198_ (
    .A(counter[4]),
    .B(reset),
    .Y(_041_)
  );
  NOT _199_ (
    .A(_041_),
    .Y(_042_)
  );
  NAND _200_ (
    .A(_039_),
    .B(_042_),
    .Y(_043_)
  );
  NOT _201_ (
    .A(_043_),
    .Y(_000_[4])
  );
  NAND _202_ (
    .A(reset),
    .B(_040_),
    .Y(_044_)
  );
  NAND _203_ (
    .A(_043_),
    .B(_044_),
    .Y(_000_[0])
  );
  NOR _204_ (
    .A(error_sint),
    .B(_039_),
    .Y(_045_)
  );
  NAND _205_ (
    .A(_053_),
    .B(_039_),
    .Y(_046_)
  );
  NAND _206_ (
    .A(reset),
    .B(_046_),
    .Y(_047_)
  );
  NOR _207_ (
    .A(_045_),
    .B(_047_),
    .Y(_001_)
  );
  NOR _208_ (
    .A(state[0]),
    .B(_026_),
    .Y(_009_)
  );
  NAND _209_ (
    .A(_095_),
    .B(_026_),
    .Y(_010_)
  );
  DFF _210_ (
    .C(clk),
    .D(_005_),
    .Q(state[0])
  );
  DFF _211_ (
    .C(clk),
    .D(_004_[2]),
    .Q(state[1])
  );
  DFF _212_ (
    .C(clk),
    .D(_006_),
    .Q(state[2])
  );
  DFF _213_ (
    .C(clk),
    .D(_007_),
    .Q(state[3])
  );
  DFF _214_ (
    .C(clk),
    .D(_008_),
    .Q(state[4])
  );
  (* src = "state_machine_sintetizado.v:27" *)
  DFF _215_ (
    .C(clk),
    .D(_001_),
    .Q(error_sint)
  );
  (* src = "state_machine_sintetizado.v:27" *)
  DFF _216_ (
    .C(clk),
    .D(_004_[0]),
    .Q(_011_)
  );
  (* src = "state_machine_sintetizado.v:27" *)
  DFF _217_ (
    .C(clk),
    .D(_004_[1]),
    .Q(_012_)
  );
  (* src = "state_machine_sintetizado.v:27" *)
  DFF _218_ (
    .C(clk),
    .D(_000_[0]),
    .Q(counter[4])
  );
  (* src = "state_machine_sintetizado.v:27" *)
  DFF _219_ (
    .C(clk),
    .D(_000_[4]),
    .Q(counter[4])
  );
  (* src = "state_machine_sintetizado.v:27" *)
  DFF _220_ (
    .C(clk),
    .D(_002_[0]),
    .Q(f_code[0])
  );
  (* src = "state_machine_sintetizado.v:27" *)
  DFF _221_ (
    .C(clk),
    .D(_002_[1]),
    .Q(f_code[1])
  );
  (* src = "state_machine_sintetizado.v:27" *)
  DFF _222_ (
    .C(clk),
    .D(_002_[2]),
    .Q(f_code[2])
  );
  (* src = "state_machine_sintetizado.v:27" *)
  DFF _223_ (
    .C(clk),
    .D(_002_[3]),
    .Q(f_code[3])
  );
  (* src = "state_machine_sintetizado.v:47" *)
  \$_DLATCH_P_  _224_ (
    .D(1'h0),
    .E(_009_),
    .Q(counter[4])
  );
  (* src = "state_machine_sintetizado.v:47" *)
  \$_DLATCH_P_  _225_ (
    .D(_003_),
    .E(_010_),
    .Q(next_error_sint)
  );
  assign _000_[3:1] = { _000_[4], _000_[4], _000_[4] };
  assign _004_[4:3] = 2'h0;
  assign buffer = data_bus[3:0];
  assign control_out_sint = 4'h0;
  assign counter[3:0] = { counter[4], counter[4], counter[4], counter[4] };
  assign data_out_bus_sint = 16'h0000;
  assign next_state[4:3] = 2'h0;
endmodule
