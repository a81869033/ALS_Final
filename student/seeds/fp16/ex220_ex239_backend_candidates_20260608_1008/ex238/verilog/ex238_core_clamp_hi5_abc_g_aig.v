module ex238_core_clamp_hi5(in, out);
  input [15:0] in;
  output [15:0] out;
  wire sign = in[15];
  wire [4:0] exp = in[14:10];
  wire [9:0] mant = in[9:0];
  wire [5:0] exp3 = {1'b0, exp} + ({1'b0, exp} << 1);
  reg [1:0] exp_delta;
  always @* begin
    if (mant <= 10'h10a) begin
      if (mant <= 10'h000) begin
        exp_delta = 2'h0;
      end else begin
        exp_delta = 2'h1;
      end
    end else begin
      if (mant <= 10'h259) begin
        exp_delta = 2'h2;
      end else begin
        exp_delta = 2'h3;
      end
    end
  end
  wire [5:0] core_exp_wide = 6'd60 - exp3 - {4'b0, exp_delta};
  wire [4:0] core_exp = core_exp_wide[4:0];
  reg [9:0] mant_low;
  always @* begin
    case (mant[9:5])
      5'h00: begin
        case (mant[4:0])
          5'h00: mant_low = 10'h000;
          5'h01: mant_low = 10'h3fa;
          5'h02: mant_low = 10'h3f4;
          5'h03: mant_low = 10'h3ee;
          5'h04: mant_low = 10'h3e8;
          5'h05: mant_low = 10'h3e2;
          5'h06: mant_low = 10'h3dc;
          5'h07: mant_low = 10'h3d7;
          5'h08: mant_low = 10'h3d1;
          5'h09: mant_low = 10'h3cb;
          5'h0a: mant_low = 10'h3c5;
          5'h0b: mant_low = 10'h3bf;
          5'h0c: mant_low = 10'h3ba;
          5'h0d: mant_low = 10'h3b4;
          5'h0e: mant_low = 10'h3ae;
          5'h0f: mant_low = 10'h3a9;
          5'h10: mant_low = 10'h3a3;
          5'h11: mant_low = 10'h39d;
          5'h12: mant_low = 10'h398;
          5'h13: mant_low = 10'h392;
          5'h14: mant_low = 10'h38d;
          5'h15: mant_low = 10'h387;
          5'h16: mant_low = 10'h381;
          5'h17: mant_low = 10'h37c;
          5'h18: mant_low = 10'h376;
          5'h19: mant_low = 10'h371;
          5'h1a: mant_low = 10'h36c;
          5'h1b: mant_low = 10'h366;
          5'h1c: mant_low = 10'h361;
          5'h1d: mant_low = 10'h35b;
          5'h1e: mant_low = 10'h356;
          5'h1f: mant_low = 10'h351;
          default: mant_low = 10'h000;
        endcase
      end
      5'h01: begin
        case (mant[4:0])
          5'h00: mant_low = 10'h34b;
          5'h01: mant_low = 10'h346;
          5'h02: mant_low = 10'h341;
          5'h03: mant_low = 10'h33c;
          5'h04: mant_low = 10'h336;
          5'h05: mant_low = 10'h331;
          5'h06: mant_low = 10'h32c;
          5'h07: mant_low = 10'h327;
          5'h08: mant_low = 10'h322;
          5'h09: mant_low = 10'h31c;
          5'h0a: mant_low = 10'h317;
          5'h0b: mant_low = 10'h312;
          5'h0c: mant_low = 10'h30d;
          5'h0d: mant_low = 10'h308;
          5'h0e: mant_low = 10'h303;
          5'h0f: mant_low = 10'h2fe;
          5'h10: mant_low = 10'h2f9;
          5'h11: mant_low = 10'h2f4;
          5'h12: mant_low = 10'h2ef;
          5'h13: mant_low = 10'h2ea;
          5'h14: mant_low = 10'h2e5;
          5'h15: mant_low = 10'h2e0;
          5'h16: mant_low = 10'h2db;
          5'h17: mant_low = 10'h2d7;
          5'h18: mant_low = 10'h2d2;
          5'h19: mant_low = 10'h2cd;
          5'h1a: mant_low = 10'h2c8;
          5'h1b: mant_low = 10'h2c3;
          5'h1c: mant_low = 10'h2be;
          5'h1d: mant_low = 10'h2ba;
          5'h1e: mant_low = 10'h2b5;
          5'h1f: mant_low = 10'h2b0;
          default: mant_low = 10'h000;
        endcase
      end
      5'h02: begin
        case (mant[4:0])
          5'h00: mant_low = 10'h2ab;
          5'h01: mant_low = 10'h2a7;
          5'h02: mant_low = 10'h2a2;
          5'h03: mant_low = 10'h29d;
          5'h04: mant_low = 10'h299;
          5'h05: mant_low = 10'h294;
          5'h06: mant_low = 10'h28f;
          5'h07: mant_low = 10'h28b;
          5'h08: mant_low = 10'h286;
          5'h09: mant_low = 10'h282;
          5'h0a: mant_low = 10'h27d;
          5'h0b: mant_low = 10'h279;
          5'h0c: mant_low = 10'h274;
          5'h0d: mant_low = 10'h270;
          5'h0e: mant_low = 10'h26b;
          5'h0f: mant_low = 10'h267;
          5'h10: mant_low = 10'h262;
          5'h11: mant_low = 10'h25e;
          5'h12: mant_low = 10'h259;
          5'h13: mant_low = 10'h255;
          5'h14: mant_low = 10'h251;
          5'h15: mant_low = 10'h24c;
          5'h16: mant_low = 10'h248;
          5'h17: mant_low = 10'h244;
          5'h18: mant_low = 10'h23f;
          5'h19: mant_low = 10'h23b;
          5'h1a: mant_low = 10'h237;
          5'h1b: mant_low = 10'h232;
          5'h1c: mant_low = 10'h22e;
          5'h1d: mant_low = 10'h22a;
          5'h1e: mant_low = 10'h226;
          5'h1f: mant_low = 10'h221;
          default: mant_low = 10'h000;
        endcase
      end
      5'h03: begin
        case (mant[4:0])
          5'h00: mant_low = 10'h21d;
          5'h01: mant_low = 10'h219;
          5'h02: mant_low = 10'h215;
          5'h03: mant_low = 10'h211;
          5'h04: mant_low = 10'h20d;
          5'h05: mant_low = 10'h208;
          5'h06: mant_low = 10'h204;
          5'h07: mant_low = 10'h200;
          5'h08: mant_low = 10'h1fc;
          5'h09: mant_low = 10'h1f8;
          5'h0a: mant_low = 10'h1f4;
          5'h0b: mant_low = 10'h1f0;
          5'h0c: mant_low = 10'h1ec;
          5'h0d: mant_low = 10'h1e8;
          5'h0e: mant_low = 10'h1e4;
          5'h0f: mant_low = 10'h1e0;
          5'h10: mant_low = 10'h1dc;
          5'h11: mant_low = 10'h1d8;
          5'h12: mant_low = 10'h1d4;
          5'h13: mant_low = 10'h1d0;
          5'h14: mant_low = 10'h1cc;
          5'h15: mant_low = 10'h1c8;
          5'h16: mant_low = 10'h1c4;
          5'h17: mant_low = 10'h1c1;
          5'h18: mant_low = 10'h1bd;
          5'h19: mant_low = 10'h1b9;
          5'h1a: mant_low = 10'h1b5;
          5'h1b: mant_low = 10'h1b1;
          5'h1c: mant_low = 10'h1ad;
          5'h1d: mant_low = 10'h1aa;
          5'h1e: mant_low = 10'h1a6;
          5'h1f: mant_low = 10'h1a2;
          default: mant_low = 10'h000;
        endcase
      end
      5'h04: begin
        case (mant[4:0])
          5'h00: mant_low = 10'h19e;
          5'h01: mant_low = 10'h19b;
          5'h02: mant_low = 10'h197;
          5'h03: mant_low = 10'h193;
          5'h04: mant_low = 10'h18f;
          5'h05: mant_low = 10'h18c;
          5'h06: mant_low = 10'h188;
          5'h07: mant_low = 10'h184;
          5'h08: mant_low = 10'h181;
          5'h09: mant_low = 10'h17d;
          5'h0a: mant_low = 10'h17a;
          5'h0b: mant_low = 10'h176;
          5'h0c: mant_low = 10'h172;
          5'h0d: mant_low = 10'h16f;
          5'h0e: mant_low = 10'h16b;
          5'h0f: mant_low = 10'h168;
          5'h10: mant_low = 10'h164;
          5'h11: mant_low = 10'h161;
          5'h12: mant_low = 10'h15d;
          5'h13: mant_low = 10'h159;
          5'h14: mant_low = 10'h156;
          5'h15: mant_low = 10'h152;
          5'h16: mant_low = 10'h14f;
          5'h17: mant_low = 10'h14c;
          5'h18: mant_low = 10'h148;
          5'h19: mant_low = 10'h145;
          5'h1a: mant_low = 10'h141;
          5'h1b: mant_low = 10'h13e;
          5'h1c: mant_low = 10'h13a;
          5'h1d: mant_low = 10'h137;
          5'h1e: mant_low = 10'h134;
          5'h1f: mant_low = 10'h130;
          default: mant_low = 10'h000;
        endcase
      end
      5'h05: begin
        case (mant[4:0])
          5'h00: mant_low = 10'h12d;
          5'h01: mant_low = 10'h12a;
          5'h02: mant_low = 10'h126;
          5'h03: mant_low = 10'h123;
          5'h04: mant_low = 10'h120;
          5'h05: mant_low = 10'h11c;
          5'h06: mant_low = 10'h119;
          5'h07: mant_low = 10'h116;
          5'h08: mant_low = 10'h112;
          5'h09: mant_low = 10'h10f;
          5'h0a: mant_low = 10'h10c;
          5'h0b: mant_low = 10'h109;
          5'h0c: mant_low = 10'h105;
          5'h0d: mant_low = 10'h102;
          5'h0e: mant_low = 10'h0ff;
          5'h0f: mant_low = 10'h0fc;
          5'h10: mant_low = 10'h0f9;
          5'h11: mant_low = 10'h0f5;
          5'h12: mant_low = 10'h0f2;
          5'h13: mant_low = 10'h0ef;
          5'h14: mant_low = 10'h0ec;
          5'h15: mant_low = 10'h0e9;
          5'h16: mant_low = 10'h0e6;
          5'h17: mant_low = 10'h0e3;
          5'h18: mant_low = 10'h0df;
          5'h19: mant_low = 10'h0dc;
          5'h1a: mant_low = 10'h0d9;
          5'h1b: mant_low = 10'h0d6;
          5'h1c: mant_low = 10'h0d3;
          5'h1d: mant_low = 10'h0d0;
          5'h1e: mant_low = 10'h0cd;
          5'h1f: mant_low = 10'h0ca;
          default: mant_low = 10'h000;
        endcase
      end
      5'h06: begin
        case (mant[4:0])
          5'h00: mant_low = 10'h0c7;
          5'h01: mant_low = 10'h0c4;
          5'h02: mant_low = 10'h0c1;
          5'h03: mant_low = 10'h0be;
          5'h04: mant_low = 10'h0bb;
          5'h05: mant_low = 10'h0b8;
          5'h06: mant_low = 10'h0b5;
          5'h07: mant_low = 10'h0b2;
          5'h08: mant_low = 10'h0af;
          5'h09: mant_low = 10'h0ac;
          5'h0a: mant_low = 10'h0a9;
          5'h0b: mant_low = 10'h0a6;
          5'h0c: mant_low = 10'h0a4;
          5'h0d: mant_low = 10'h0a1;
          5'h0e: mant_low = 10'h09e;
          5'h0f: mant_low = 10'h09b;
          5'h10: mant_low = 10'h098;
          5'h11: mant_low = 10'h095;
          5'h12: mant_low = 10'h092;
          5'h13: mant_low = 10'h08f;
          5'h14: mant_low = 10'h08d;
          5'h15: mant_low = 10'h08a;
          5'h16: mant_low = 10'h087;
          5'h17: mant_low = 10'h084;
          5'h18: mant_low = 10'h081;
          5'h19: mant_low = 10'h07f;
          5'h1a: mant_low = 10'h07c;
          5'h1b: mant_low = 10'h079;
          5'h1c: mant_low = 10'h076;
          5'h1d: mant_low = 10'h074;
          5'h1e: mant_low = 10'h071;
          5'h1f: mant_low = 10'h06e;
          default: mant_low = 10'h000;
        endcase
      end
      5'h07: begin
        case (mant[4:0])
          5'h00: mant_low = 10'h06b;
          5'h01: mant_low = 10'h069;
          5'h02: mant_low = 10'h066;
          5'h03: mant_low = 10'h063;
          5'h04: mant_low = 10'h061;
          5'h05: mant_low = 10'h05e;
          5'h06: mant_low = 10'h05b;
          5'h07: mant_low = 10'h058;
          5'h08: mant_low = 10'h056;
          5'h09: mant_low = 10'h053;
          5'h0a: mant_low = 10'h051;
          5'h0b: mant_low = 10'h04e;
          5'h0c: mant_low = 10'h04b;
          5'h0d: mant_low = 10'h049;
          5'h0e: mant_low = 10'h046;
          5'h0f: mant_low = 10'h043;
          5'h10: mant_low = 10'h041;
          5'h11: mant_low = 10'h03e;
          5'h12: mant_low = 10'h03c;
          5'h13: mant_low = 10'h039;
          5'h14: mant_low = 10'h037;
          5'h15: mant_low = 10'h034;
          5'h16: mant_low = 10'h032;
          5'h17: mant_low = 10'h02f;
          5'h18: mant_low = 10'h02c;
          5'h19: mant_low = 10'h02a;
          5'h1a: mant_low = 10'h027;
          5'h1b: mant_low = 10'h025;
          5'h1c: mant_low = 10'h022;
          5'h1d: mant_low = 10'h020;
          5'h1e: mant_low = 10'h01e;
          5'h1f: mant_low = 10'h01b;
          default: mant_low = 10'h000;
        endcase
      end
      5'h08: begin
        case (mant[4:0])
          5'h00: mant_low = 10'h019;
          5'h01: mant_low = 10'h016;
          5'h02: mant_low = 10'h014;
          5'h03: mant_low = 10'h011;
          5'h04: mant_low = 10'h00f;
          5'h05: mant_low = 10'h00c;
          5'h06: mant_low = 10'h00a;
          5'h07: mant_low = 10'h008;
          5'h08: mant_low = 10'h005;
          5'h09: mant_low = 10'h003;
          5'h0a: mant_low = 10'h000;
          5'h0b: mant_low = 10'h3fc;
          5'h0c: mant_low = 10'h3f7;
          5'h0d: mant_low = 10'h3f3;
          5'h0e: mant_low = 10'h3ee;
          5'h0f: mant_low = 10'h3e9;
          5'h10: mant_low = 10'h3e4;
          5'h11: mant_low = 10'h3e0;
          5'h12: mant_low = 10'h3db;
          5'h13: mant_low = 10'h3d6;
          5'h14: mant_low = 10'h3d2;
          5'h15: mant_low = 10'h3cd;
          5'h16: mant_low = 10'h3c9;
          5'h17: mant_low = 10'h3c4;
          5'h18: mant_low = 10'h3bf;
          5'h19: mant_low = 10'h3bb;
          5'h1a: mant_low = 10'h3b6;
          5'h1b: mant_low = 10'h3b2;
          5'h1c: mant_low = 10'h3ad;
          5'h1d: mant_low = 10'h3a9;
          5'h1e: mant_low = 10'h3a4;
          5'h1f: mant_low = 10'h3a0;
          default: mant_low = 10'h000;
        endcase
      end
      5'h09: begin
        case (mant[4:0])
          5'h00: mant_low = 10'h39b;
          5'h01: mant_low = 10'h397;
          5'h02: mant_low = 10'h393;
          5'h03: mant_low = 10'h38e;
          5'h04: mant_low = 10'h38a;
          5'h05: mant_low = 10'h385;
          5'h06: mant_low = 10'h381;
          5'h07: mant_low = 10'h37d;
          5'h08: mant_low = 10'h378;
          5'h09: mant_low = 10'h374;
          5'h0a: mant_low = 10'h370;
          5'h0b: mant_low = 10'h36b;
          5'h0c: mant_low = 10'h367;
          5'h0d: mant_low = 10'h363;
          5'h0e: mant_low = 10'h35e;
          5'h0f: mant_low = 10'h35a;
          5'h10: mant_low = 10'h356;
          5'h11: mant_low = 10'h352;
          5'h12: mant_low = 10'h34d;
          5'h13: mant_low = 10'h349;
          5'h14: mant_low = 10'h345;
          5'h15: mant_low = 10'h341;
          5'h16: mant_low = 10'h33d;
          5'h17: mant_low = 10'h338;
          5'h18: mant_low = 10'h334;
          5'h19: mant_low = 10'h330;
          5'h1a: mant_low = 10'h32c;
          5'h1b: mant_low = 10'h328;
          5'h1c: mant_low = 10'h324;
          5'h1d: mant_low = 10'h320;
          5'h1e: mant_low = 10'h31c;
          5'h1f: mant_low = 10'h318;
          default: mant_low = 10'h000;
        endcase
      end
      5'h0a: begin
        case (mant[4:0])
          5'h00: mant_low = 10'h314;
          5'h01: mant_low = 10'h310;
          5'h02: mant_low = 10'h30c;
          5'h03: mant_low = 10'h308;
          5'h04: mant_low = 10'h304;
          5'h05: mant_low = 10'h300;
          5'h06: mant_low = 10'h2fc;
          5'h07: mant_low = 10'h2f8;
          5'h08: mant_low = 10'h2f4;
          5'h09: mant_low = 10'h2f0;
          5'h0a: mant_low = 10'h2ec;
          5'h0b: mant_low = 10'h2e8;
          5'h0c: mant_low = 10'h2e4;
          5'h0d: mant_low = 10'h2e0;
          5'h0e: mant_low = 10'h2dc;
          5'h0f: mant_low = 10'h2d8;
          5'h10: mant_low = 10'h2d4;
          5'h11: mant_low = 10'h2d1;
          5'h12: mant_low = 10'h2cd;
          5'h13: mant_low = 10'h2c9;
          5'h14: mant_low = 10'h2c5;
          5'h15: mant_low = 10'h2c1;
          5'h16: mant_low = 10'h2bd;
          5'h17: mant_low = 10'h2ba;
          5'h18: mant_low = 10'h2b6;
          5'h19: mant_low = 10'h2b2;
          5'h1a: mant_low = 10'h2ae;
          5'h1b: mant_low = 10'h2ab;
          5'h1c: mant_low = 10'h2a7;
          5'h1d: mant_low = 10'h2a3;
          5'h1e: mant_low = 10'h2a0;
          5'h1f: mant_low = 10'h29c;
          default: mant_low = 10'h000;
        endcase
      end
      5'h0b: begin
        case (mant[4:0])
          5'h00: mant_low = 10'h298;
          5'h01: mant_low = 10'h294;
          5'h02: mant_low = 10'h291;
          5'h03: mant_low = 10'h28d;
          5'h04: mant_low = 10'h289;
          5'h05: mant_low = 10'h286;
          5'h06: mant_low = 10'h282;
          5'h07: mant_low = 10'h27f;
          5'h08: mant_low = 10'h27b;
          5'h09: mant_low = 10'h277;
          5'h0a: mant_low = 10'h274;
          5'h0b: mant_low = 10'h270;
          5'h0c: mant_low = 10'h26d;
          5'h0d: mant_low = 10'h269;
          5'h0e: mant_low = 10'h266;
          5'h0f: mant_low = 10'h262;
          5'h10: mant_low = 10'h25f;
          5'h11: mant_low = 10'h25b;
          5'h12: mant_low = 10'h258;
          5'h13: mant_low = 10'h254;
          5'h14: mant_low = 10'h251;
          5'h15: mant_low = 10'h24d;
          5'h16: mant_low = 10'h24a;
          5'h17: mant_low = 10'h246;
          5'h18: mant_low = 10'h243;
          5'h19: mant_low = 10'h23f;
          5'h1a: mant_low = 10'h23c;
          5'h1b: mant_low = 10'h239;
          5'h1c: mant_low = 10'h235;
          5'h1d: mant_low = 10'h232;
          5'h1e: mant_low = 10'h22e;
          5'h1f: mant_low = 10'h22b;
          default: mant_low = 10'h000;
        endcase
      end
      5'h0c: begin
        case (mant[4:0])
          5'h00: mant_low = 10'h228;
          5'h01: mant_low = 10'h224;
          5'h02: mant_low = 10'h221;
          5'h03: mant_low = 10'h21e;
          5'h04: mant_low = 10'h21a;
          5'h05: mant_low = 10'h217;
          5'h06: mant_low = 10'h214;
          5'h07: mant_low = 10'h210;
          5'h08: mant_low = 10'h20d;
          5'h09: mant_low = 10'h20a;
          5'h0a: mant_low = 10'h207;
          5'h0b: mant_low = 10'h203;
          5'h0c: mant_low = 10'h200;
          5'h0d: mant_low = 10'h1fd;
          5'h0e: mant_low = 10'h1fa;
          5'h0f: mant_low = 10'h1f6;
          5'h10: mant_low = 10'h1f3;
          5'h11: mant_low = 10'h1f0;
          5'h12: mant_low = 10'h1ed;
          5'h13: mant_low = 10'h1ea;
          5'h14: mant_low = 10'h1e6;
          5'h15: mant_low = 10'h1e3;
          5'h16: mant_low = 10'h1e0;
          5'h17: mant_low = 10'h1dd;
          5'h18: mant_low = 10'h1da;
          5'h19: mant_low = 10'h1d7;
          5'h1a: mant_low = 10'h1d3;
          5'h1b: mant_low = 10'h1d0;
          5'h1c: mant_low = 10'h1cd;
          5'h1d: mant_low = 10'h1ca;
          5'h1e: mant_low = 10'h1c7;
          5'h1f: mant_low = 10'h1c4;
          default: mant_low = 10'h000;
        endcase
      end
      5'h0d: begin
        case (mant[4:0])
          5'h00: mant_low = 10'h1c1;
          5'h01: mant_low = 10'h1be;
          5'h02: mant_low = 10'h1bb;
          5'h03: mant_low = 10'h1b8;
          5'h04: mant_low = 10'h1b5;
          5'h05: mant_low = 10'h1b2;
          5'h06: mant_low = 10'h1af;
          5'h07: mant_low = 10'h1ac;
          5'h08: mant_low = 10'h1a9;
          5'h09: mant_low = 10'h1a6;
          5'h0a: mant_low = 10'h1a3;
          5'h0b: mant_low = 10'h1a0;
          5'h0c: mant_low = 10'h19d;
          5'h0d: mant_low = 10'h19a;
          5'h0e: mant_low = 10'h197;
          5'h0f: mant_low = 10'h194;
          5'h10: mant_low = 10'h191;
          5'h11: mant_low = 10'h18e;
          5'h12: mant_low = 10'h18b;
          5'h13: mant_low = 10'h188;
          5'h14: mant_low = 10'h185;
          5'h15: mant_low = 10'h182;
          5'h16: mant_low = 10'h17f;
          5'h17: mant_low = 10'h17d;
          5'h18: mant_low = 10'h17a;
          5'h19: mant_low = 10'h177;
          5'h1a: mant_low = 10'h174;
          5'h1b: mant_low = 10'h171;
          5'h1c: mant_low = 10'h16e;
          5'h1d: mant_low = 10'h16b;
          5'h1e: mant_low = 10'h169;
          5'h1f: mant_low = 10'h166;
          default: mant_low = 10'h000;
        endcase
      end
      5'h0e: begin
        case (mant[4:0])
          5'h00: mant_low = 10'h163;
          5'h01: mant_low = 10'h160;
          5'h02: mant_low = 10'h15d;
          5'h03: mant_low = 10'h15b;
          5'h04: mant_low = 10'h158;
          5'h05: mant_low = 10'h155;
          5'h06: mant_low = 10'h152;
          5'h07: mant_low = 10'h14f;
          5'h08: mant_low = 10'h14d;
          5'h09: mant_low = 10'h14a;
          5'h0a: mant_low = 10'h147;
          5'h0b: mant_low = 10'h144;
          5'h0c: mant_low = 10'h142;
          5'h0d: mant_low = 10'h13f;
          5'h0e: mant_low = 10'h13c;
          5'h0f: mant_low = 10'h13a;
          5'h10: mant_low = 10'h137;
          5'h11: mant_low = 10'h134;
          5'h12: mant_low = 10'h132;
          5'h13: mant_low = 10'h12f;
          5'h14: mant_low = 10'h12c;
          5'h15: mant_low = 10'h12a;
          5'h16: mant_low = 10'h127;
          5'h17: mant_low = 10'h124;
          5'h18: mant_low = 10'h122;
          5'h19: mant_low = 10'h11f;
          5'h1a: mant_low = 10'h11c;
          5'h1b: mant_low = 10'h11a;
          5'h1c: mant_low = 10'h117;
          5'h1d: mant_low = 10'h115;
          5'h1e: mant_low = 10'h112;
          5'h1f: mant_low = 10'h10f;
          default: mant_low = 10'h000;
        endcase
      end
      5'h0f: begin
        case (mant[4:0])
          5'h00: mant_low = 10'h10d;
          5'h01: mant_low = 10'h10a;
          5'h02: mant_low = 10'h108;
          5'h03: mant_low = 10'h105;
          5'h04: mant_low = 10'h102;
          5'h05: mant_low = 10'h100;
          5'h06: mant_low = 10'h0fd;
          5'h07: mant_low = 10'h0fb;
          5'h08: mant_low = 10'h0f8;
          5'h09: mant_low = 10'h0f6;
          5'h0a: mant_low = 10'h0f3;
          5'h0b: mant_low = 10'h0f1;
          5'h0c: mant_low = 10'h0ee;
          5'h0d: mant_low = 10'h0ec;
          5'h0e: mant_low = 10'h0e9;
          5'h0f: mant_low = 10'h0e7;
          5'h10: mant_low = 10'h0e4;
          5'h11: mant_low = 10'h0e2;
          5'h12: mant_low = 10'h0df;
          5'h13: mant_low = 10'h0dd;
          5'h14: mant_low = 10'h0db;
          5'h15: mant_low = 10'h0d8;
          5'h16: mant_low = 10'h0d6;
          5'h17: mant_low = 10'h0d3;
          5'h18: mant_low = 10'h0d1;
          5'h19: mant_low = 10'h0ce;
          5'h1a: mant_low = 10'h0cc;
          5'h1b: mant_low = 10'h0ca;
          5'h1c: mant_low = 10'h0c7;
          5'h1d: mant_low = 10'h0c5;
          5'h1e: mant_low = 10'h0c2;
          5'h1f: mant_low = 10'h0c0;
          default: mant_low = 10'h000;
        endcase
      end
      5'h10: begin
        case (mant[4:0])
          5'h00: mant_low = 10'h0be;
          5'h01: mant_low = 10'h0bb;
          5'h02: mant_low = 10'h0b9;
          5'h03: mant_low = 10'h0b7;
          5'h04: mant_low = 10'h0b4;
          5'h05: mant_low = 10'h0b2;
          5'h06: mant_low = 10'h0b0;
          5'h07: mant_low = 10'h0ad;
          5'h08: mant_low = 10'h0ab;
          5'h09: mant_low = 10'h0a9;
          5'h0a: mant_low = 10'h0a6;
          5'h0b: mant_low = 10'h0a4;
          5'h0c: mant_low = 10'h0a2;
          5'h0d: mant_low = 10'h09f;
          5'h0e: mant_low = 10'h09d;
          5'h0f: mant_low = 10'h09b;
          5'h10: mant_low = 10'h098;
          5'h11: mant_low = 10'h096;
          5'h12: mant_low = 10'h094;
          5'h13: mant_low = 10'h092;
          5'h14: mant_low = 10'h08f;
          5'h15: mant_low = 10'h08d;
          5'h16: mant_low = 10'h08b;
          5'h17: mant_low = 10'h089;
          5'h18: mant_low = 10'h086;
          5'h19: mant_low = 10'h084;
          5'h1a: mant_low = 10'h082;
          5'h1b: mant_low = 10'h080;
          5'h1c: mant_low = 10'h07e;
          5'h1d: mant_low = 10'h07b;
          5'h1e: mant_low = 10'h079;
          5'h1f: mant_low = 10'h077;
          default: mant_low = 10'h000;
        endcase
      end
      5'h11: begin
        case (mant[4:0])
          5'h00: mant_low = 10'h075;
          5'h01: mant_low = 10'h073;
          5'h02: mant_low = 10'h070;
          5'h03: mant_low = 10'h06e;
          5'h04: mant_low = 10'h06c;
          5'h05: mant_low = 10'h06a;
          5'h06: mant_low = 10'h068;
          5'h07: mant_low = 10'h066;
          5'h08: mant_low = 10'h064;
          5'h09: mant_low = 10'h061;
          5'h0a: mant_low = 10'h05f;
          5'h0b: mant_low = 10'h05d;
          5'h0c: mant_low = 10'h05b;
          5'h0d: mant_low = 10'h059;
          5'h0e: mant_low = 10'h057;
          5'h0f: mant_low = 10'h055;
          5'h10: mant_low = 10'h053;
          5'h11: mant_low = 10'h051;
          5'h12: mant_low = 10'h04e;
          5'h13: mant_low = 10'h04c;
          5'h14: mant_low = 10'h04a;
          5'h15: mant_low = 10'h048;
          5'h16: mant_low = 10'h046;
          5'h17: mant_low = 10'h044;
          5'h18: mant_low = 10'h042;
          5'h19: mant_low = 10'h040;
          5'h1a: mant_low = 10'h03e;
          5'h1b: mant_low = 10'h03c;
          5'h1c: mant_low = 10'h03a;
          5'h1d: mant_low = 10'h038;
          5'h1e: mant_low = 10'h036;
          5'h1f: mant_low = 10'h034;
          default: mant_low = 10'h000;
        endcase
      end
      5'h12: begin
        case (mant[4:0])
          5'h00: mant_low = 10'h032;
          5'h01: mant_low = 10'h030;
          5'h02: mant_low = 10'h02e;
          5'h03: mant_low = 10'h02c;
          5'h04: mant_low = 10'h02a;
          5'h05: mant_low = 10'h028;
          5'h06: mant_low = 10'h026;
          5'h07: mant_low = 10'h024;
          5'h08: mant_low = 10'h022;
          5'h09: mant_low = 10'h020;
          5'h0a: mant_low = 10'h01e;
          5'h0b: mant_low = 10'h01c;
          5'h0c: mant_low = 10'h01a;
          5'h0d: mant_low = 10'h018;
          5'h0e: mant_low = 10'h016;
          5'h0f: mant_low = 10'h014;
          5'h10: mant_low = 10'h012;
          5'h11: mant_low = 10'h010;
          5'h12: mant_low = 10'h00e;
          5'h13: mant_low = 10'h00c;
          5'h14: mant_low = 10'h00a;
          5'h15: mant_low = 10'h009;
          5'h16: mant_low = 10'h007;
          5'h17: mant_low = 10'h005;
          5'h18: mant_low = 10'h003;
          5'h19: mant_low = 10'h001;
          5'h1a: mant_low = 10'h3fe;
          5'h1b: mant_low = 10'h3fa;
          5'h1c: mant_low = 10'h3f7;
          5'h1d: mant_low = 10'h3f3;
          5'h1e: mant_low = 10'h3ef;
          5'h1f: mant_low = 10'h3eb;
          default: mant_low = 10'h000;
        endcase
      end
      5'h13: begin
        case (mant[4:0])
          5'h00: mant_low = 10'h3e8;
          5'h01: mant_low = 10'h3e4;
          5'h02: mant_low = 10'h3e0;
          5'h03: mant_low = 10'h3dd;
          5'h04: mant_low = 10'h3d9;
          5'h05: mant_low = 10'h3d5;
          5'h06: mant_low = 10'h3d1;
          5'h07: mant_low = 10'h3ce;
          5'h08: mant_low = 10'h3ca;
          5'h09: mant_low = 10'h3c7;
          5'h0a: mant_low = 10'h3c3;
          5'h0b: mant_low = 10'h3bf;
          5'h0c: mant_low = 10'h3bc;
          5'h0d: mant_low = 10'h3b8;
          5'h0e: mant_low = 10'h3b4;
          5'h0f: mant_low = 10'h3b1;
          5'h10: mant_low = 10'h3ad;
          5'h11: mant_low = 10'h3aa;
          5'h12: mant_low = 10'h3a6;
          5'h13: mant_low = 10'h3a3;
          5'h14: mant_low = 10'h39f;
          5'h15: mant_low = 10'h39b;
          5'h16: mant_low = 10'h398;
          5'h17: mant_low = 10'h394;
          5'h18: mant_low = 10'h391;
          5'h19: mant_low = 10'h38d;
          5'h1a: mant_low = 10'h38a;
          5'h1b: mant_low = 10'h386;
          5'h1c: mant_low = 10'h383;
          5'h1d: mant_low = 10'h37f;
          5'h1e: mant_low = 10'h37c;
          5'h1f: mant_low = 10'h379;
          default: mant_low = 10'h000;
        endcase
      end
      5'h14: begin
        case (mant[4:0])
          5'h00: mant_low = 10'h375;
          5'h01: mant_low = 10'h372;
          5'h02: mant_low = 10'h36e;
          5'h03: mant_low = 10'h36b;
          5'h04: mant_low = 10'h367;
          5'h05: mant_low = 10'h364;
          5'h06: mant_low = 10'h361;
          5'h07: mant_low = 10'h35d;
          5'h08: mant_low = 10'h35a;
          5'h09: mant_low = 10'h356;
          5'h0a: mant_low = 10'h353;
          5'h0b: mant_low = 10'h350;
          5'h0c: mant_low = 10'h34c;
          5'h0d: mant_low = 10'h349;
          5'h0e: mant_low = 10'h346;
          5'h0f: mant_low = 10'h342;
          5'h10: mant_low = 10'h33f;
          5'h11: mant_low = 10'h33c;
          5'h12: mant_low = 10'h338;
          5'h13: mant_low = 10'h335;
          5'h14: mant_low = 10'h332;
          5'h15: mant_low = 10'h32f;
          5'h16: mant_low = 10'h32b;
          5'h17: mant_low = 10'h328;
          5'h18: mant_low = 10'h325;
          5'h19: mant_low = 10'h322;
          5'h1a: mant_low = 10'h31e;
          5'h1b: mant_low = 10'h31b;
          5'h1c: mant_low = 10'h318;
          5'h1d: mant_low = 10'h315;
          5'h1e: mant_low = 10'h311;
          5'h1f: mant_low = 10'h30e;
          default: mant_low = 10'h000;
        endcase
      end
      5'h15: begin
        case (mant[4:0])
          5'h00: mant_low = 10'h30b;
          5'h01: mant_low = 10'h308;
          5'h02: mant_low = 10'h305;
          5'h03: mant_low = 10'h302;
          5'h04: mant_low = 10'h2fe;
          5'h05: mant_low = 10'h2fb;
          5'h06: mant_low = 10'h2f8;
          5'h07: mant_low = 10'h2f5;
          5'h08: mant_low = 10'h2f2;
          5'h09: mant_low = 10'h2ef;
          5'h0a: mant_low = 10'h2ec;
          5'h0b: mant_low = 10'h2e8;
          5'h0c: mant_low = 10'h2e5;
          5'h0d: mant_low = 10'h2e2;
          5'h0e: mant_low = 10'h2df;
          5'h0f: mant_low = 10'h2dc;
          5'h10: mant_low = 10'h2d9;
          5'h11: mant_low = 10'h2d6;
          5'h12: mant_low = 10'h2d3;
          5'h13: mant_low = 10'h2d0;
          5'h14: mant_low = 10'h2cd;
          5'h15: mant_low = 10'h2ca;
          5'h16: mant_low = 10'h2c7;
          5'h17: mant_low = 10'h2c4;
          5'h18: mant_low = 10'h2c1;
          5'h19: mant_low = 10'h2be;
          5'h1a: mant_low = 10'h2bb;
          5'h1b: mant_low = 10'h2b8;
          5'h1c: mant_low = 10'h2b5;
          5'h1d: mant_low = 10'h2b2;
          5'h1e: mant_low = 10'h2af;
          5'h1f: mant_low = 10'h2ac;
          default: mant_low = 10'h000;
        endcase
      end
      5'h16: begin
        case (mant[4:0])
          5'h00: mant_low = 10'h2a9;
          5'h01: mant_low = 10'h2a6;
          5'h02: mant_low = 10'h2a3;
          5'h03: mant_low = 10'h2a0;
          5'h04: mant_low = 10'h29d;
          5'h05: mant_low = 10'h29a;
          5'h06: mant_low = 10'h297;
          5'h07: mant_low = 10'h294;
          5'h08: mant_low = 10'h291;
          5'h09: mant_low = 10'h28e;
          5'h0a: mant_low = 10'h28b;
          5'h0b: mant_low = 10'h289;
          5'h0c: mant_low = 10'h286;
          5'h0d: mant_low = 10'h283;
          5'h0e: mant_low = 10'h280;
          5'h0f: mant_low = 10'h27d;
          5'h10: mant_low = 10'h27a;
          5'h11: mant_low = 10'h277;
          5'h12: mant_low = 10'h275;
          5'h13: mant_low = 10'h272;
          5'h14: mant_low = 10'h26f;
          5'h15: mant_low = 10'h26c;
          5'h16: mant_low = 10'h269;
          5'h17: mant_low = 10'h266;
          5'h18: mant_low = 10'h264;
          5'h19: mant_low = 10'h261;
          5'h1a: mant_low = 10'h25e;
          5'h1b: mant_low = 10'h25b;
          5'h1c: mant_low = 10'h258;
          5'h1d: mant_low = 10'h256;
          5'h1e: mant_low = 10'h253;
          5'h1f: mant_low = 10'h250;
          default: mant_low = 10'h000;
        endcase
      end
      5'h17: begin
        case (mant[4:0])
          5'h00: mant_low = 10'h24d;
          5'h01: mant_low = 10'h24b;
          5'h02: mant_low = 10'h248;
          5'h03: mant_low = 10'h245;
          5'h04: mant_low = 10'h242;
          5'h05: mant_low = 10'h240;
          5'h06: mant_low = 10'h23d;
          5'h07: mant_low = 10'h23a;
          5'h08: mant_low = 10'h238;
          5'h09: mant_low = 10'h235;
          5'h0a: mant_low = 10'h232;
          5'h0b: mant_low = 10'h230;
          5'h0c: mant_low = 10'h22d;
          5'h0d: mant_low = 10'h22a;
          5'h0e: mant_low = 10'h228;
          5'h0f: mant_low = 10'h225;
          5'h10: mant_low = 10'h222;
          5'h11: mant_low = 10'h220;
          5'h12: mant_low = 10'h21d;
          5'h13: mant_low = 10'h21a;
          5'h14: mant_low = 10'h218;
          5'h15: mant_low = 10'h215;
          5'h16: mant_low = 10'h212;
          5'h17: mant_low = 10'h210;
          5'h18: mant_low = 10'h20d;
          5'h19: mant_low = 10'h20b;
          5'h1a: mant_low = 10'h208;
          5'h1b: mant_low = 10'h205;
          5'h1c: mant_low = 10'h203;
          5'h1d: mant_low = 10'h200;
          5'h1e: mant_low = 10'h1fe;
          5'h1f: mant_low = 10'h1fb;
          default: mant_low = 10'h000;
        endcase
      end
      5'h18: begin
        case (mant[4:0])
          5'h00: mant_low = 10'h1f9;
          5'h01: mant_low = 10'h1f6;
          5'h02: mant_low = 10'h1f3;
          5'h03: mant_low = 10'h1f1;
          5'h04: mant_low = 10'h1ee;
          5'h05: mant_low = 10'h1ec;
          5'h06: mant_low = 10'h1e9;
          5'h07: mant_low = 10'h1e7;
          5'h08: mant_low = 10'h1e4;
          5'h09: mant_low = 10'h1e2;
          5'h0a: mant_low = 10'h1df;
          5'h0b: mant_low = 10'h1dd;
          5'h0c: mant_low = 10'h1da;
          5'h0d: mant_low = 10'h1d8;
          5'h0e: mant_low = 10'h1d5;
          5'h0f: mant_low = 10'h1d3;
          5'h10: mant_low = 10'h1d0;
          5'h11: mant_low = 10'h1ce;
          5'h12: mant_low = 10'h1cb;
          5'h13: mant_low = 10'h1c9;
          5'h14: mant_low = 10'h1c6;
          5'h15: mant_low = 10'h1c4;
          5'h16: mant_low = 10'h1c2;
          5'h17: mant_low = 10'h1bf;
          5'h18: mant_low = 10'h1bd;
          5'h19: mant_low = 10'h1ba;
          5'h1a: mant_low = 10'h1b8;
          5'h1b: mant_low = 10'h1b5;
          5'h1c: mant_low = 10'h1b3;
          5'h1d: mant_low = 10'h1b1;
          5'h1e: mant_low = 10'h1ae;
          5'h1f: mant_low = 10'h1ac;
          default: mant_low = 10'h000;
        endcase
      end
      5'h19: begin
        case (mant[4:0])
          5'h00: mant_low = 10'h1a9;
          5'h01: mant_low = 10'h1a7;
          5'h02: mant_low = 10'h1a5;
          5'h03: mant_low = 10'h1a2;
          5'h04: mant_low = 10'h1a0;
          5'h05: mant_low = 10'h19e;
          5'h06: mant_low = 10'h19b;
          5'h07: mant_low = 10'h199;
          5'h08: mant_low = 10'h197;
          5'h09: mant_low = 10'h194;
          5'h0a: mant_low = 10'h192;
          5'h0b: mant_low = 10'h190;
          5'h0c: mant_low = 10'h18d;
          5'h0d: mant_low = 10'h18b;
          5'h0e: mant_low = 10'h189;
          5'h0f: mant_low = 10'h186;
          5'h10: mant_low = 10'h184;
          5'h11: mant_low = 10'h182;
          5'h12: mant_low = 10'h17f;
          5'h13: mant_low = 10'h17d;
          5'h14: mant_low = 10'h17b;
          5'h15: mant_low = 10'h179;
          5'h16: mant_low = 10'h176;
          5'h17: mant_low = 10'h174;
          5'h18: mant_low = 10'h172;
          5'h19: mant_low = 10'h16f;
          5'h1a: mant_low = 10'h16d;
          5'h1b: mant_low = 10'h16b;
          5'h1c: mant_low = 10'h169;
          5'h1d: mant_low = 10'h166;
          5'h1e: mant_low = 10'h164;
          5'h1f: mant_low = 10'h162;
          default: mant_low = 10'h000;
        endcase
      end
      5'h1a: begin
        case (mant[4:0])
          5'h00: mant_low = 10'h160;
          5'h01: mant_low = 10'h15e;
          5'h02: mant_low = 10'h15b;
          5'h03: mant_low = 10'h159;
          5'h04: mant_low = 10'h157;
          5'h05: mant_low = 10'h155;
          5'h06: mant_low = 10'h153;
          5'h07: mant_low = 10'h150;
          5'h08: mant_low = 10'h14e;
          5'h09: mant_low = 10'h14c;
          5'h0a: mant_low = 10'h14a;
          5'h0b: mant_low = 10'h148;
          5'h0c: mant_low = 10'h145;
          5'h0d: mant_low = 10'h143;
          5'h0e: mant_low = 10'h141;
          5'h0f: mant_low = 10'h13f;
          5'h10: mant_low = 10'h13d;
          5'h11: mant_low = 10'h13b;
          5'h12: mant_low = 10'h139;
          5'h13: mant_low = 10'h136;
          5'h14: mant_low = 10'h134;
          5'h15: mant_low = 10'h132;
          5'h16: mant_low = 10'h130;
          5'h17: mant_low = 10'h12e;
          5'h18: mant_low = 10'h12c;
          5'h19: mant_low = 10'h12a;
          5'h1a: mant_low = 10'h128;
          5'h1b: mant_low = 10'h125;
          5'h1c: mant_low = 10'h123;
          5'h1d: mant_low = 10'h121;
          5'h1e: mant_low = 10'h11f;
          5'h1f: mant_low = 10'h11d;
          default: mant_low = 10'h000;
        endcase
      end
      5'h1b: begin
        case (mant[4:0])
          5'h00: mant_low = 10'h11b;
          5'h01: mant_low = 10'h119;
          5'h02: mant_low = 10'h117;
          5'h03: mant_low = 10'h115;
          5'h04: mant_low = 10'h113;
          5'h05: mant_low = 10'h111;
          5'h06: mant_low = 10'h10f;
          5'h07: mant_low = 10'h10d;
          5'h08: mant_low = 10'h10b;
          5'h09: mant_low = 10'h109;
          5'h0a: mant_low = 10'h106;
          5'h0b: mant_low = 10'h104;
          5'h0c: mant_low = 10'h102;
          5'h0d: mant_low = 10'h100;
          5'h0e: mant_low = 10'h0fe;
          5'h0f: mant_low = 10'h0fc;
          5'h10: mant_low = 10'h0fa;
          5'h11: mant_low = 10'h0f8;
          5'h12: mant_low = 10'h0f6;
          5'h13: mant_low = 10'h0f4;
          5'h14: mant_low = 10'h0f2;
          5'h15: mant_low = 10'h0f0;
          5'h16: mant_low = 10'h0ee;
          5'h17: mant_low = 10'h0ec;
          5'h18: mant_low = 10'h0ea;
          5'h19: mant_low = 10'h0e8;
          5'h1a: mant_low = 10'h0e6;
          5'h1b: mant_low = 10'h0e5;
          5'h1c: mant_low = 10'h0e3;
          5'h1d: mant_low = 10'h0e1;
          5'h1e: mant_low = 10'h0df;
          5'h1f: mant_low = 10'h0dd;
          default: mant_low = 10'h000;
        endcase
      end
      5'h1c: begin
        case (mant[4:0])
          5'h00: mant_low = 10'h0db;
          5'h01: mant_low = 10'h0d9;
          5'h02: mant_low = 10'h0d7;
          5'h03: mant_low = 10'h0d5;
          5'h04: mant_low = 10'h0d3;
          5'h05: mant_low = 10'h0d1;
          5'h06: mant_low = 10'h0cf;
          5'h07: mant_low = 10'h0cd;
          5'h08: mant_low = 10'h0cb;
          5'h09: mant_low = 10'h0c9;
          5'h0a: mant_low = 10'h0c8;
          5'h0b: mant_low = 10'h0c6;
          5'h0c: mant_low = 10'h0c4;
          5'h0d: mant_low = 10'h0c2;
          5'h0e: mant_low = 10'h0c0;
          5'h0f: mant_low = 10'h0be;
          5'h10: mant_low = 10'h0bc;
          5'h11: mant_low = 10'h0ba;
          5'h12: mant_low = 10'h0b8;
          5'h13: mant_low = 10'h0b7;
          5'h14: mant_low = 10'h0b5;
          5'h15: mant_low = 10'h0b3;
          5'h16: mant_low = 10'h0b1;
          5'h17: mant_low = 10'h0af;
          5'h18: mant_low = 10'h0ad;
          5'h19: mant_low = 10'h0ab;
          5'h1a: mant_low = 10'h0aa;
          5'h1b: mant_low = 10'h0a8;
          5'h1c: mant_low = 10'h0a6;
          5'h1d: mant_low = 10'h0a4;
          5'h1e: mant_low = 10'h0a2;
          5'h1f: mant_low = 10'h0a0;
          default: mant_low = 10'h000;
        endcase
      end
      5'h1d: begin
        case (mant[4:0])
          5'h00: mant_low = 10'h09f;
          5'h01: mant_low = 10'h09d;
          5'h02: mant_low = 10'h09b;
          5'h03: mant_low = 10'h099;
          5'h04: mant_low = 10'h097;
          5'h05: mant_low = 10'h096;
          5'h06: mant_low = 10'h094;
          5'h07: mant_low = 10'h092;
          5'h08: mant_low = 10'h090;
          5'h09: mant_low = 10'h08e;
          5'h0a: mant_low = 10'h08d;
          5'h0b: mant_low = 10'h08b;
          5'h0c: mant_low = 10'h089;
          5'h0d: mant_low = 10'h087;
          5'h0e: mant_low = 10'h086;
          5'h0f: mant_low = 10'h084;
          5'h10: mant_low = 10'h082;
          5'h11: mant_low = 10'h080;
          5'h12: mant_low = 10'h07f;
          5'h13: mant_low = 10'h07d;
          5'h14: mant_low = 10'h07b;
          5'h15: mant_low = 10'h079;
          5'h16: mant_low = 10'h078;
          5'h17: mant_low = 10'h076;
          5'h18: mant_low = 10'h074;
          5'h19: mant_low = 10'h072;
          5'h1a: mant_low = 10'h071;
          5'h1b: mant_low = 10'h06f;
          5'h1c: mant_low = 10'h06d;
          5'h1d: mant_low = 10'h06b;
          5'h1e: mant_low = 10'h06a;
          5'h1f: mant_low = 10'h068;
          default: mant_low = 10'h000;
        endcase
      end
      5'h1e: begin
        case (mant[4:0])
          5'h00: mant_low = 10'h066;
          5'h01: mant_low = 10'h065;
          5'h02: mant_low = 10'h063;
          5'h03: mant_low = 10'h061;
          5'h04: mant_low = 10'h060;
          5'h05: mant_low = 10'h05e;
          5'h06: mant_low = 10'h05c;
          5'h07: mant_low = 10'h05a;
          5'h08: mant_low = 10'h059;
          5'h09: mant_low = 10'h057;
          5'h0a: mant_low = 10'h055;
          5'h0b: mant_low = 10'h054;
          5'h0c: mant_low = 10'h052;
          5'h0d: mant_low = 10'h050;
          5'h0e: mant_low = 10'h04f;
          5'h0f: mant_low = 10'h04d;
          5'h10: mant_low = 10'h04c;
          5'h11: mant_low = 10'h04a;
          5'h12: mant_low = 10'h048;
          5'h13: mant_low = 10'h047;
          5'h14: mant_low = 10'h045;
          5'h15: mant_low = 10'h043;
          5'h16: mant_low = 10'h042;
          5'h17: mant_low = 10'h040;
          5'h18: mant_low = 10'h03e;
          5'h19: mant_low = 10'h03d;
          5'h1a: mant_low = 10'h03b;
          5'h1b: mant_low = 10'h03a;
          5'h1c: mant_low = 10'h038;
          5'h1d: mant_low = 10'h036;
          5'h1e: mant_low = 10'h035;
          5'h1f: mant_low = 10'h033;
          default: mant_low = 10'h000;
        endcase
      end
      5'h1f: begin
        case (mant[4:0])
          5'h00: mant_low = 10'h032;
          5'h01: mant_low = 10'h030;
          5'h02: mant_low = 10'h02e;
          5'h03: mant_low = 10'h02d;
          5'h04: mant_low = 10'h02b;
          5'h05: mant_low = 10'h02a;
          5'h06: mant_low = 10'h028;
          5'h07: mant_low = 10'h026;
          5'h08: mant_low = 10'h025;
          5'h09: mant_low = 10'h023;
          5'h0a: mant_low = 10'h022;
          5'h0b: mant_low = 10'h020;
          5'h0c: mant_low = 10'h01f;
          5'h0d: mant_low = 10'h01d;
          5'h0e: mant_low = 10'h01b;
          5'h0f: mant_low = 10'h01a;
          5'h10: mant_low = 10'h018;
          5'h11: mant_low = 10'h017;
          5'h12: mant_low = 10'h015;
          5'h13: mant_low = 10'h014;
          5'h14: mant_low = 10'h012;
          5'h15: mant_low = 10'h011;
          5'h16: mant_low = 10'h00f;
          5'h17: mant_low = 10'h00e;
          5'h18: mant_low = 10'h00c;
          5'h19: mant_low = 10'h00b;
          5'h1a: mant_low = 10'h009;
          5'h1b: mant_low = 10'h008;
          5'h1c: mant_low = 10'h006;
          5'h1d: mant_low = 10'h005;
          5'h1e: mant_low = 10'h003;
          5'h1f: mant_low = 10'h002;
          default: mant_low = 10'h000;
        endcase
      end
      default: mant_low = 10'h000;
    endcase
  end
  wire [9:0] out_mant = {mant_low};
  wire [14:0] core_mag = {core_exp, out_mant};
  wire [15:0] signed_zero = {sign, 15'h0000};
  wire [15:0] signed_inf = {sign, 5'h1f, 10'h000};
  wire active_core = (exp >= 5'd10) && (exp <= 5'd18);
  wire exp9 = (exp == 5'd9);
  wire exp19 = (exp == 5'd19);
  wire overflow_exp9 = exp9 && (mant <= 10'h259);
  wire underflow_exp19 = exp19 && (mant >= 10'h25a);
  wire [15:0] formula_out = {sign, core_mag};
  wire [15:0] boundary_out = overflow_exp9 ? signed_inf :
                              underflow_exp19 ? signed_zero : formula_out;
  wire [15:0] special_out = (exp == 5'h1f && mant != 10'h000) ? 16'h7e00 :
                           ((exp <= 5'd8) ? signed_inf : signed_zero);
  assign out = (active_core || exp9 || exp19) ? boundary_out : special_out;
endmodule
