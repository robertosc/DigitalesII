/* Generated by Yosys 0.9 (git sha1 1979e0b) */

(* dynports =  1  *)
(* cells_not_processed =  1  *)
(* src = "state_machine_sintetizado.v:1" *)
module state_machine_sintetizado(reset, clk, data_bus, error_sint);
  (* src = "state_machine_sintetizado.v:24" *)
  wire [3:0] _000_;
  (* src = "state_machine_sintetizado.v:24" *)
  wire _001_;
  (* src = "state_machine_sintetizado.v:24" *)
  wire [3:0] _002_;
  wire _003_;
  wire _004_;
  wire _005_;
  wire _006_;
  wire _007_;
  wire _008_;
  wire _009_;
  wire _010_;
  wire _011_;
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
  (* src = "state_machine_sintetizado.v:6" *)
  input clk;
  (* src = "state_machine_sintetizado.v:13" *)
  wire [3:0] counter;
  (* src = "state_machine_sintetizado.v:7" *)
  input [15:0] data_bus;
  (* src = "state_machine_sintetizado.v:8" *)
  output error_sint;
  (* src = "state_machine_sintetizado.v:16" *)
  wire [3:0] f_code;
  (* src = "state_machine_sintetizado.v:15" *)
  wire [31:0] k;
  (* src = "state_machine_sintetizado.v:13" *)
  (* unused_bits = "0 1 2 3" *)
  wire [3:0] next_counter;
  (* src = "state_machine_sintetizado.v:5" *)
  input reset;
  (* onehot = 32'd1 *)
  wire [4:0] state;
  NOT _100_ (
    .A(state[3]),
    .Y(_035_)
  );
  NOT _101_ (
    .A(state[2]),
    .Y(_036_)
  );
  NOT _102_ (
    .A(state[0]),
    .Y(_037_)
  );
  NOT _103_ (
    .A(counter[3]),
    .Y(_038_)
  );
  NOT _104_ (
    .A(f_code[3]),
    .Y(_039_)
  );
  NOT _105_ (
    .A(reset),
    .Y(_003_)
  );
  NOT _106_ (
    .A(f_code[0]),
    .Y(_040_)
  );
  NOT _107_ (
    .A(f_code[2]),
    .Y(_041_)
  );
  NOT _108_ (
    .A(f_code[1]),
    .Y(_042_)
  );
  NOT _109_ (
    .A(data_bus[0]),
    .Y(_043_)
  );
  NOT _110_ (
    .A(data_bus[3]),
    .Y(_044_)
  );
  NOT _111_ (
    .A(data_bus[12]),
    .Y(_045_)
  );
  NOT _112_ (
    .A(data_bus[13]),
    .Y(_046_)
  );
  NOT _113_ (
    .A(data_bus[14]),
    .Y(_047_)
  );
  NOT _114_ (
    .A(data_bus[15]),
    .Y(_048_)
  );
  NOR _115_ (
    .A(state[3]),
    .B(state[2]),
    .Y(_049_)
  );
  NAND _116_ (
    .A(_035_),
    .B(_036_),
    .Y(_050_)
  );
  NOR _117_ (
    .A(f_code[1]),
    .B(data_bus[1]),
    .Y(_051_)
  );
  NAND _118_ (
    .A(f_code[1]),
    .B(data_bus[1]),
    .Y(_052_)
  );
  NOT _119_ (
    .A(_052_),
    .Y(_053_)
  );
  NOR _120_ (
    .A(_051_),
    .B(_053_),
    .Y(_054_)
  );
  NOR _121_ (
    .A(f_code[0]),
    .B(data_bus[0]),
    .Y(_055_)
  );
  NOR _122_ (
    .A(_040_),
    .B(_043_),
    .Y(_056_)
  );
  NOR _123_ (
    .A(_055_),
    .B(_056_),
    .Y(_057_)
  );
  NAND _124_ (
    .A(_054_),
    .B(_057_),
    .Y(_058_)
  );
  NOR _125_ (
    .A(f_code[3]),
    .B(data_bus[3]),
    .Y(_059_)
  );
  NAND _126_ (
    .A(f_code[3]),
    .B(data_bus[3]),
    .Y(_060_)
  );
  NOT _127_ (
    .A(_060_),
    .Y(_061_)
  );
  NOR _128_ (
    .A(_059_),
    .B(_061_),
    .Y(_062_)
  );
  NOR _129_ (
    .A(f_code[2]),
    .B(data_bus[2]),
    .Y(_063_)
  );
  NAND _130_ (
    .A(f_code[2]),
    .B(data_bus[2]),
    .Y(_064_)
  );
  NOT _131_ (
    .A(_064_),
    .Y(_065_)
  );
  NOR _132_ (
    .A(_063_),
    .B(_065_),
    .Y(_066_)
  );
  NAND _133_ (
    .A(_062_),
    .B(_066_),
    .Y(_067_)
  );
  NOR _134_ (
    .A(_058_),
    .B(_067_),
    .Y(_068_)
  );
  NOT _135_ (
    .A(_068_),
    .Y(_069_)
  );
  NOR _136_ (
    .A(state[1]),
    .B(state[4]),
    .Y(_070_)
  );
  NOR _137_ (
    .A(_068_),
    .B(_070_),
    .Y(_071_)
  );
  NOR _138_ (
    .A(_050_),
    .B(_071_),
    .Y(_072_)
  );
  NOR _139_ (
    .A(_042_),
    .B(data_bus[13]),
    .Y(_073_)
  );
  NOR _140_ (
    .A(f_code[1]),
    .B(_046_),
    .Y(_074_)
  );
  NOR _141_ (
    .A(_073_),
    .B(_074_),
    .Y(_075_)
  );
  NOR _142_ (
    .A(_040_),
    .B(data_bus[12]),
    .Y(_076_)
  );
  NOR _143_ (
    .A(f_code[0]),
    .B(_045_),
    .Y(_077_)
  );
  NOR _144_ (
    .A(_076_),
    .B(_077_),
    .Y(_078_)
  );
  NAND _145_ (
    .A(_075_),
    .B(_078_),
    .Y(_079_)
  );
  NOR _146_ (
    .A(_039_),
    .B(data_bus[15]),
    .Y(_080_)
  );
  NOR _147_ (
    .A(f_code[3]),
    .B(_048_),
    .Y(_081_)
  );
  NOR _148_ (
    .A(_080_),
    .B(_081_),
    .Y(_082_)
  );
  NOR _149_ (
    .A(_041_),
    .B(data_bus[14]),
    .Y(_083_)
  );
  NOR _150_ (
    .A(f_code[2]),
    .B(_047_),
    .Y(_084_)
  );
  NOR _151_ (
    .A(_083_),
    .B(_084_),
    .Y(_085_)
  );
  NAND _152_ (
    .A(_082_),
    .B(_085_),
    .Y(_086_)
  );
  NOR _153_ (
    .A(_079_),
    .B(_086_),
    .Y(_087_)
  );
  NAND _154_ (
    .A(reset),
    .B(_087_),
    .Y(_088_)
  );
  NOT _155_ (
    .A(_088_),
    .Y(_089_)
  );
  NAND _156_ (
    .A(_038_),
    .B(_043_),
    .Y(_090_)
  );
  NOR _157_ (
    .A(data_bus[1]),
    .B(data_bus[2]),
    .Y(_091_)
  );
  NAND _158_ (
    .A(_044_),
    .B(_091_),
    .Y(_092_)
  );
  NOR _159_ (
    .A(data_bus[1]),
    .B(data_bus[3]),
    .Y(_093_)
  );
  NOR _160_ (
    .A(data_bus[2]),
    .B(_090_),
    .Y(_094_)
  );
  NOR _161_ (
    .A(_090_),
    .B(_092_),
    .Y(_095_)
  );
  NAND _162_ (
    .A(_093_),
    .B(_094_),
    .Y(_096_)
  );
  NAND _163_ (
    .A(data_bus[1]),
    .B(data_bus[2]),
    .Y(_097_)
  );
  NOT _164_ (
    .A(_097_),
    .Y(_098_)
  );
  NAND _165_ (
    .A(data_bus[3]),
    .B(_098_),
    .Y(_099_)
  );
  NAND _166_ (
    .A(counter[3]),
    .B(data_bus[0]),
    .Y(_009_)
  );
  NOR _167_ (
    .A(_043_),
    .B(_099_),
    .Y(_010_)
  );
  NOR _168_ (
    .A(_099_),
    .B(_009_),
    .Y(_011_)
  );
  NAND _169_ (
    .A(counter[3]),
    .B(_010_),
    .Y(_012_)
  );
  NOR _170_ (
    .A(_095_),
    .B(_011_),
    .Y(_013_)
  );
  NAND _171_ (
    .A(_096_),
    .B(_012_),
    .Y(_014_)
  );
  NAND _172_ (
    .A(_050_),
    .B(_014_),
    .Y(_015_)
  );
  NAND _173_ (
    .A(_089_),
    .B(_015_),
    .Y(_016_)
  );
  NAND _174_ (
    .A(_050_),
    .B(_013_),
    .Y(_017_)
  );
  NOR _175_ (
    .A(_050_),
    .B(_088_),
    .Y(_018_)
  );
  NOR _176_ (
    .A(_072_),
    .B(_016_),
    .Y(_004_)
  );
  NAND _177_ (
    .A(_049_),
    .B(_070_),
    .Y(_019_)
  );
  NAND _178_ (
    .A(reset),
    .B(_019_),
    .Y(_020_)
  );
  NOR _179_ (
    .A(_087_),
    .B(_020_),
    .Y(_007_)
  );
  NAND _180_ (
    .A(state[0]),
    .B(reset),
    .Y(_021_)
  );
  NOR _181_ (
    .A(_069_),
    .B(_070_),
    .Y(_022_)
  );
  NAND _182_ (
    .A(_018_),
    .B(_022_),
    .Y(_023_)
  );
  NAND _183_ (
    .A(_021_),
    .B(_023_),
    .Y(_006_)
  );
  NOR _184_ (
    .A(_088_),
    .B(_015_),
    .Y(_005_)
  );
  NAND _185_ (
    .A(_039_),
    .B(reset),
    .Y(_002_[3])
  );
  NAND _186_ (
    .A(reset),
    .B(_040_),
    .Y(_002_[0])
  );
  NAND _187_ (
    .A(reset),
    .B(_041_),
    .Y(_002_[2])
  );
  NAND _188_ (
    .A(reset),
    .B(_042_),
    .Y(_002_[1])
  );
  NAND _189_ (
    .A(_087_),
    .B(_017_),
    .Y(_024_)
  );
  NOR _190_ (
    .A(_071_),
    .B(_024_),
    .Y(_025_)
  );
  NAND _191_ (
    .A(_037_),
    .B(reset),
    .Y(_026_)
  );
  NOR _192_ (
    .A(_025_),
    .B(_026_),
    .Y(_001_)
  );
  NOR _193_ (
    .A(state[0]),
    .B(_088_),
    .Y(_027_)
  );
  NOT _194_ (
    .A(_027_),
    .Y(_028_)
  );
  NOR _195_ (
    .A(_038_),
    .B(_070_),
    .Y(_029_)
  );
  NOR _196_ (
    .A(_049_),
    .B(_096_),
    .Y(_030_)
  );
  NOR _197_ (
    .A(_029_),
    .B(_030_),
    .Y(_031_)
  );
  NAND _198_ (
    .A(counter[3]),
    .B(_027_),
    .Y(_032_)
  );
  NOR _199_ (
    .A(_070_),
    .B(_032_),
    .Y(_000_[3])
  );
  NOR _200_ (
    .A(_028_),
    .B(_031_),
    .Y(_000_[0])
  );
  NAND _201_ (
    .A(_037_),
    .B(_087_),
    .Y(_033_)
  );
  NAND _202_ (
    .A(state[1]),
    .B(_069_),
    .Y(_034_)
  );
  NOR _203_ (
    .A(_033_),
    .B(_034_),
    .Y(_008_)
  );
  DFF _204_ (
    .C(clk),
    .D(_003_),
    .Q(state[0])
  );
  DFF _205_ (
    .C(clk),
    .D(_004_),
    .Q(state[1])
  );
  DFF _206_ (
    .C(clk),
    .D(_005_),
    .Q(state[2])
  );
  DFF _207_ (
    .C(clk),
    .D(_006_),
    .Q(state[3])
  );
  DFF _208_ (
    .C(clk),
    .D(_007_),
    .Q(state[4])
  );
  (* src = "state_machine_sintetizado.v:24" *)
  DFF _209_ (
    .C(clk),
    .D(_000_[0]),
    .Q(counter[3])
  );
  (* src = "state_machine_sintetizado.v:24" *)
  DFF _210_ (
    .C(clk),
    .D(_000_[3]),
    .Q(counter[3])
  );
  (* src = "state_machine_sintetizado.v:24" *)
  DFF _211_ (
    .C(clk),
    .D(_001_),
    .Q(error_sint)
  );
  (* src = "state_machine_sintetizado.v:24" *)
  DFF _212_ (
    .C(clk),
    .D(_002_[0]),
    .Q(f_code[0])
  );
  (* src = "state_machine_sintetizado.v:24" *)
  DFF _213_ (
    .C(clk),
    .D(_002_[1]),
    .Q(f_code[1])
  );
  (* src = "state_machine_sintetizado.v:24" *)
  DFF _214_ (
    .C(clk),
    .D(_002_[2]),
    .Q(f_code[2])
  );
  (* src = "state_machine_sintetizado.v:24" *)
  DFF _215_ (
    .C(clk),
    .D(_002_[3]),
    .Q(f_code[3])
  );
  (* src = "state_machine_sintetizado.v:41" *)
  \$_DLATCH_P_  _216_ (
    .D(1'h0),
    .E(_008_),
    .Q(counter[3])
  );
  assign _000_[2:1] = { _000_[3], _000_[3] };
  assign counter[2:0] = { counter[3], counter[3], counter[3] };
  assign k = 32'd4;
  assign next_counter[2:1] = { next_counter[3], next_counter[3] };
endmodule
