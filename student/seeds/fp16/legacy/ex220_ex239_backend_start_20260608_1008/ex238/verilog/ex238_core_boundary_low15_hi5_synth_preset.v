module ex238_core_boundary_low15_hi5(in, out);
  input [15:0] in;
  output [15:0] out;
  wire sign = in[15];
  wire [4:0] exp = in[14:10];
  wire [9:0] mant = in[9:0];
  wire core_active = (exp >= 5'd10) && (exp <= 5'd18);
  wire boundary_active = (exp == 5'd9) || (exp == 5'd19);
  wire [5:0] exp3 = {1'b0, exp} + ({1'b0, exp} << 1);
  wire [15:0] signed_zero = {sign, 15'h0000};
  wire [15:0] signed_inf = {sign, 5'h1f, 10'h000};
  wire [15:0] special_out = (exp == 5'h1f && mant != 10'h000) ? 16'h7e00 :
                           ((exp <= 5'd8) ? signed_inf : signed_zero);
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
  reg [14:0] boundary_low;
  always @* begin
    case (exp)
      5'h09: begin
        case (mant[9:5])
          5'h00: boundary_low = 15'h7c00;
          5'h01: boundary_low = 15'h7c00;
          5'h02: boundary_low = 15'h7c00;
          5'h03: boundary_low = 15'h7c00;
          5'h04: boundary_low = 15'h7c00;
          5'h05: boundary_low = 15'h7c00;
          5'h06: boundary_low = 15'h7c00;
          5'h07: boundary_low = 15'h7c00;
          5'h08: boundary_low = 15'h7c00;
          5'h09: boundary_low = 15'h7c00;
          5'h0a: boundary_low = 15'h7c00;
          5'h0b: boundary_low = 15'h7c00;
          5'h0c: boundary_low = 15'h7c00;
          5'h0d: boundary_low = 15'h7c00;
          5'h0e: boundary_low = 15'h7c00;
          5'h0f: boundary_low = 15'h7c00;
          5'h10: boundary_low = 15'h7c00;
          5'h11: boundary_low = 15'h7c00;
          5'h12: begin
            case (mant[4:0])
              5'h00: boundary_low = 15'h7c00;
              5'h01: boundary_low = 15'h7c00;
              5'h02: boundary_low = 15'h7c00;
              5'h03: boundary_low = 15'h7c00;
              5'h04: boundary_low = 15'h7c00;
              5'h05: boundary_low = 15'h7c00;
              5'h06: boundary_low = 15'h7c00;
              5'h07: boundary_low = 15'h7c00;
              5'h08: boundary_low = 15'h7c00;
              5'h09: boundary_low = 15'h7c00;
              5'h0a: boundary_low = 15'h7c00;
              5'h0b: boundary_low = 15'h7c00;
              5'h0c: boundary_low = 15'h7c00;
              5'h0d: boundary_low = 15'h7c00;
              5'h0e: boundary_low = 15'h7c00;
              5'h0f: boundary_low = 15'h7c00;
              5'h10: boundary_low = 15'h7c00;
              5'h11: boundary_low = 15'h7c00;
              5'h12: boundary_low = 15'h7c00;
              5'h13: boundary_low = 15'h7c00;
              5'h14: boundary_low = 15'h7c00;
              5'h15: boundary_low = 15'h7c00;
              5'h16: boundary_low = 15'h7c00;
              5'h17: boundary_low = 15'h7c00;
              5'h18: boundary_low = 15'h7c00;
              5'h19: boundary_low = 15'h7c00;
              5'h1a: boundary_low = 15'h7bfe;
              5'h1b: boundary_low = 15'h7bfa;
              5'h1c: boundary_low = 15'h7bf7;
              5'h1d: boundary_low = 15'h7bf3;
              5'h1e: boundary_low = 15'h7bef;
              5'h1f: boundary_low = 15'h7beb;
              default: boundary_low = 15'h0000;
            endcase
          end
          5'h13: begin
            case (mant[4:0])
              5'h00: boundary_low = 15'h7be8;
              5'h01: boundary_low = 15'h7be4;
              5'h02: boundary_low = 15'h7be0;
              5'h03: boundary_low = 15'h7bdd;
              5'h04: boundary_low = 15'h7bd9;
              5'h05: boundary_low = 15'h7bd5;
              5'h06: boundary_low = 15'h7bd1;
              5'h07: boundary_low = 15'h7bce;
              5'h08: boundary_low = 15'h7bca;
              5'h09: boundary_low = 15'h7bc7;
              5'h0a: boundary_low = 15'h7bc3;
              5'h0b: boundary_low = 15'h7bbf;
              5'h0c: boundary_low = 15'h7bbc;
              5'h0d: boundary_low = 15'h7bb8;
              5'h0e: boundary_low = 15'h7bb4;
              5'h0f: boundary_low = 15'h7bb1;
              5'h10: boundary_low = 15'h7bad;
              5'h11: boundary_low = 15'h7baa;
              5'h12: boundary_low = 15'h7ba6;
              5'h13: boundary_low = 15'h7ba3;
              5'h14: boundary_low = 15'h7b9f;
              5'h15: boundary_low = 15'h7b9b;
              5'h16: boundary_low = 15'h7b98;
              5'h17: boundary_low = 15'h7b94;
              5'h18: boundary_low = 15'h7b91;
              5'h19: boundary_low = 15'h7b8d;
              5'h1a: boundary_low = 15'h7b8a;
              5'h1b: boundary_low = 15'h7b86;
              5'h1c: boundary_low = 15'h7b83;
              5'h1d: boundary_low = 15'h7b7f;
              5'h1e: boundary_low = 15'h7b7c;
              5'h1f: boundary_low = 15'h7b79;
              default: boundary_low = 15'h0000;
            endcase
          end
          5'h14: begin
            case (mant[4:0])
              5'h00: boundary_low = 15'h7b75;
              5'h01: boundary_low = 15'h7b72;
              5'h02: boundary_low = 15'h7b6e;
              5'h03: boundary_low = 15'h7b6b;
              5'h04: boundary_low = 15'h7b67;
              5'h05: boundary_low = 15'h7b64;
              5'h06: boundary_low = 15'h7b61;
              5'h07: boundary_low = 15'h7b5d;
              5'h08: boundary_low = 15'h7b5a;
              5'h09: boundary_low = 15'h7b56;
              5'h0a: boundary_low = 15'h7b53;
              5'h0b: boundary_low = 15'h7b50;
              5'h0c: boundary_low = 15'h7b4c;
              5'h0d: boundary_low = 15'h7b49;
              5'h0e: boundary_low = 15'h7b46;
              5'h0f: boundary_low = 15'h7b42;
              5'h10: boundary_low = 15'h7b3f;
              5'h11: boundary_low = 15'h7b3c;
              5'h12: boundary_low = 15'h7b38;
              5'h13: boundary_low = 15'h7b35;
              5'h14: boundary_low = 15'h7b32;
              5'h15: boundary_low = 15'h7b2f;
              5'h16: boundary_low = 15'h7b2b;
              5'h17: boundary_low = 15'h7b28;
              5'h18: boundary_low = 15'h7b25;
              5'h19: boundary_low = 15'h7b22;
              5'h1a: boundary_low = 15'h7b1e;
              5'h1b: boundary_low = 15'h7b1b;
              5'h1c: boundary_low = 15'h7b18;
              5'h1d: boundary_low = 15'h7b15;
              5'h1e: boundary_low = 15'h7b11;
              5'h1f: boundary_low = 15'h7b0e;
              default: boundary_low = 15'h0000;
            endcase
          end
          5'h15: begin
            case (mant[4:0])
              5'h00: boundary_low = 15'h7b0b;
              5'h01: boundary_low = 15'h7b08;
              5'h02: boundary_low = 15'h7b05;
              5'h03: boundary_low = 15'h7b02;
              5'h04: boundary_low = 15'h7afe;
              5'h05: boundary_low = 15'h7afb;
              5'h06: boundary_low = 15'h7af8;
              5'h07: boundary_low = 15'h7af5;
              5'h08: boundary_low = 15'h7af2;
              5'h09: boundary_low = 15'h7aef;
              5'h0a: boundary_low = 15'h7aec;
              5'h0b: boundary_low = 15'h7ae8;
              5'h0c: boundary_low = 15'h7ae5;
              5'h0d: boundary_low = 15'h7ae2;
              5'h0e: boundary_low = 15'h7adf;
              5'h0f: boundary_low = 15'h7adc;
              5'h10: boundary_low = 15'h7ad9;
              5'h11: boundary_low = 15'h7ad6;
              5'h12: boundary_low = 15'h7ad3;
              5'h13: boundary_low = 15'h7ad0;
              5'h14: boundary_low = 15'h7acd;
              5'h15: boundary_low = 15'h7aca;
              5'h16: boundary_low = 15'h7ac7;
              5'h17: boundary_low = 15'h7ac4;
              5'h18: boundary_low = 15'h7ac1;
              5'h19: boundary_low = 15'h7abe;
              5'h1a: boundary_low = 15'h7abb;
              5'h1b: boundary_low = 15'h7ab8;
              5'h1c: boundary_low = 15'h7ab5;
              5'h1d: boundary_low = 15'h7ab2;
              5'h1e: boundary_low = 15'h7aaf;
              5'h1f: boundary_low = 15'h7aac;
              default: boundary_low = 15'h0000;
            endcase
          end
          5'h16: begin
            case (mant[4:0])
              5'h00: boundary_low = 15'h7aa9;
              5'h01: boundary_low = 15'h7aa6;
              5'h02: boundary_low = 15'h7aa3;
              5'h03: boundary_low = 15'h7aa0;
              5'h04: boundary_low = 15'h7a9d;
              5'h05: boundary_low = 15'h7a9a;
              5'h06: boundary_low = 15'h7a97;
              5'h07: boundary_low = 15'h7a94;
              5'h08: boundary_low = 15'h7a91;
              5'h09: boundary_low = 15'h7a8e;
              5'h0a: boundary_low = 15'h7a8b;
              5'h0b: boundary_low = 15'h7a89;
              5'h0c: boundary_low = 15'h7a86;
              5'h0d: boundary_low = 15'h7a83;
              5'h0e: boundary_low = 15'h7a80;
              5'h0f: boundary_low = 15'h7a7d;
              5'h10: boundary_low = 15'h7a7a;
              5'h11: boundary_low = 15'h7a77;
              5'h12: boundary_low = 15'h7a75;
              5'h13: boundary_low = 15'h7a72;
              5'h14: boundary_low = 15'h7a6f;
              5'h15: boundary_low = 15'h7a6c;
              5'h16: boundary_low = 15'h7a69;
              5'h17: boundary_low = 15'h7a66;
              5'h18: boundary_low = 15'h7a64;
              5'h19: boundary_low = 15'h7a61;
              5'h1a: boundary_low = 15'h7a5e;
              5'h1b: boundary_low = 15'h7a5b;
              5'h1c: boundary_low = 15'h7a58;
              5'h1d: boundary_low = 15'h7a56;
              5'h1e: boundary_low = 15'h7a53;
              5'h1f: boundary_low = 15'h7a50;
              default: boundary_low = 15'h0000;
            endcase
          end
          5'h17: begin
            case (mant[4:0])
              5'h00: boundary_low = 15'h7a4d;
              5'h01: boundary_low = 15'h7a4b;
              5'h02: boundary_low = 15'h7a48;
              5'h03: boundary_low = 15'h7a45;
              5'h04: boundary_low = 15'h7a42;
              5'h05: boundary_low = 15'h7a40;
              5'h06: boundary_low = 15'h7a3d;
              5'h07: boundary_low = 15'h7a3a;
              5'h08: boundary_low = 15'h7a38;
              5'h09: boundary_low = 15'h7a35;
              5'h0a: boundary_low = 15'h7a32;
              5'h0b: boundary_low = 15'h7a30;
              5'h0c: boundary_low = 15'h7a2d;
              5'h0d: boundary_low = 15'h7a2a;
              5'h0e: boundary_low = 15'h7a28;
              5'h0f: boundary_low = 15'h7a25;
              5'h10: boundary_low = 15'h7a22;
              5'h11: boundary_low = 15'h7a20;
              5'h12: boundary_low = 15'h7a1d;
              5'h13: boundary_low = 15'h7a1a;
              5'h14: boundary_low = 15'h7a18;
              5'h15: boundary_low = 15'h7a15;
              5'h16: boundary_low = 15'h7a12;
              5'h17: boundary_low = 15'h7a10;
              5'h18: boundary_low = 15'h7a0d;
              5'h19: boundary_low = 15'h7a0b;
              5'h1a: boundary_low = 15'h7a08;
              5'h1b: boundary_low = 15'h7a05;
              5'h1c: boundary_low = 15'h7a03;
              5'h1d: boundary_low = 15'h7a00;
              5'h1e: boundary_low = 15'h79fe;
              5'h1f: boundary_low = 15'h79fb;
              default: boundary_low = 15'h0000;
            endcase
          end
          5'h18: begin
            case (mant[4:0])
              5'h00: boundary_low = 15'h79f9;
              5'h01: boundary_low = 15'h79f6;
              5'h02: boundary_low = 15'h79f3;
              5'h03: boundary_low = 15'h79f1;
              5'h04: boundary_low = 15'h79ee;
              5'h05: boundary_low = 15'h79ec;
              5'h06: boundary_low = 15'h79e9;
              5'h07: boundary_low = 15'h79e7;
              5'h08: boundary_low = 15'h79e4;
              5'h09: boundary_low = 15'h79e2;
              5'h0a: boundary_low = 15'h79df;
              5'h0b: boundary_low = 15'h79dd;
              5'h0c: boundary_low = 15'h79da;
              5'h0d: boundary_low = 15'h79d8;
              5'h0e: boundary_low = 15'h79d5;
              5'h0f: boundary_low = 15'h79d3;
              5'h10: boundary_low = 15'h79d0;
              5'h11: boundary_low = 15'h79ce;
              5'h12: boundary_low = 15'h79cb;
              5'h13: boundary_low = 15'h79c9;
              5'h14: boundary_low = 15'h79c6;
              5'h15: boundary_low = 15'h79c4;
              5'h16: boundary_low = 15'h79c2;
              5'h17: boundary_low = 15'h79bf;
              5'h18: boundary_low = 15'h79bd;
              5'h19: boundary_low = 15'h79ba;
              5'h1a: boundary_low = 15'h79b8;
              5'h1b: boundary_low = 15'h79b5;
              5'h1c: boundary_low = 15'h79b3;
              5'h1d: boundary_low = 15'h79b1;
              5'h1e: boundary_low = 15'h79ae;
              5'h1f: boundary_low = 15'h79ac;
              default: boundary_low = 15'h0000;
            endcase
          end
          5'h19: begin
            case (mant[4:0])
              5'h00: boundary_low = 15'h79a9;
              5'h01: boundary_low = 15'h79a7;
              5'h02: boundary_low = 15'h79a5;
              5'h03: boundary_low = 15'h79a2;
              5'h04: boundary_low = 15'h79a0;
              5'h05: boundary_low = 15'h799e;
              5'h06: boundary_low = 15'h799b;
              5'h07: boundary_low = 15'h7999;
              5'h08: boundary_low = 15'h7997;
              5'h09: boundary_low = 15'h7994;
              5'h0a: boundary_low = 15'h7992;
              5'h0b: boundary_low = 15'h7990;
              5'h0c: boundary_low = 15'h798d;
              5'h0d: boundary_low = 15'h798b;
              5'h0e: boundary_low = 15'h7989;
              5'h0f: boundary_low = 15'h7986;
              5'h10: boundary_low = 15'h7984;
              5'h11: boundary_low = 15'h7982;
              5'h12: boundary_low = 15'h797f;
              5'h13: boundary_low = 15'h797d;
              5'h14: boundary_low = 15'h797b;
              5'h15: boundary_low = 15'h7979;
              5'h16: boundary_low = 15'h7976;
              5'h17: boundary_low = 15'h7974;
              5'h18: boundary_low = 15'h7972;
              5'h19: boundary_low = 15'h796f;
              5'h1a: boundary_low = 15'h796d;
              5'h1b: boundary_low = 15'h796b;
              5'h1c: boundary_low = 15'h7969;
              5'h1d: boundary_low = 15'h7966;
              5'h1e: boundary_low = 15'h7964;
              5'h1f: boundary_low = 15'h7962;
              default: boundary_low = 15'h0000;
            endcase
          end
          5'h1a: begin
            case (mant[4:0])
              5'h00: boundary_low = 15'h7960;
              5'h01: boundary_low = 15'h795e;
              5'h02: boundary_low = 15'h795b;
              5'h03: boundary_low = 15'h7959;
              5'h04: boundary_low = 15'h7957;
              5'h05: boundary_low = 15'h7955;
              5'h06: boundary_low = 15'h7953;
              5'h07: boundary_low = 15'h7950;
              5'h08: boundary_low = 15'h794e;
              5'h09: boundary_low = 15'h794c;
              5'h0a: boundary_low = 15'h794a;
              5'h0b: boundary_low = 15'h7948;
              5'h0c: boundary_low = 15'h7945;
              5'h0d: boundary_low = 15'h7943;
              5'h0e: boundary_low = 15'h7941;
              5'h0f: boundary_low = 15'h793f;
              5'h10: boundary_low = 15'h793d;
              5'h11: boundary_low = 15'h793b;
              5'h12: boundary_low = 15'h7939;
              5'h13: boundary_low = 15'h7936;
              5'h14: boundary_low = 15'h7934;
              5'h15: boundary_low = 15'h7932;
              5'h16: boundary_low = 15'h7930;
              5'h17: boundary_low = 15'h792e;
              5'h18: boundary_low = 15'h792c;
              5'h19: boundary_low = 15'h792a;
              5'h1a: boundary_low = 15'h7928;
              5'h1b: boundary_low = 15'h7925;
              5'h1c: boundary_low = 15'h7923;
              5'h1d: boundary_low = 15'h7921;
              5'h1e: boundary_low = 15'h791f;
              5'h1f: boundary_low = 15'h791d;
              default: boundary_low = 15'h0000;
            endcase
          end
          5'h1b: begin
            case (mant[4:0])
              5'h00: boundary_low = 15'h791b;
              5'h01: boundary_low = 15'h7919;
              5'h02: boundary_low = 15'h7917;
              5'h03: boundary_low = 15'h7915;
              5'h04: boundary_low = 15'h7913;
              5'h05: boundary_low = 15'h7911;
              5'h06: boundary_low = 15'h790f;
              5'h07: boundary_low = 15'h790d;
              5'h08: boundary_low = 15'h790b;
              5'h09: boundary_low = 15'h7909;
              5'h0a: boundary_low = 15'h7906;
              5'h0b: boundary_low = 15'h7904;
              5'h0c: boundary_low = 15'h7902;
              5'h0d: boundary_low = 15'h7900;
              5'h0e: boundary_low = 15'h78fe;
              5'h0f: boundary_low = 15'h78fc;
              5'h10: boundary_low = 15'h78fa;
              5'h11: boundary_low = 15'h78f8;
              5'h12: boundary_low = 15'h78f6;
              5'h13: boundary_low = 15'h78f4;
              5'h14: boundary_low = 15'h78f2;
              5'h15: boundary_low = 15'h78f0;
              5'h16: boundary_low = 15'h78ee;
              5'h17: boundary_low = 15'h78ec;
              5'h18: boundary_low = 15'h78ea;
              5'h19: boundary_low = 15'h78e8;
              5'h1a: boundary_low = 15'h78e6;
              5'h1b: boundary_low = 15'h78e5;
              5'h1c: boundary_low = 15'h78e3;
              5'h1d: boundary_low = 15'h78e1;
              5'h1e: boundary_low = 15'h78df;
              5'h1f: boundary_low = 15'h78dd;
              default: boundary_low = 15'h0000;
            endcase
          end
          5'h1c: begin
            case (mant[4:0])
              5'h00: boundary_low = 15'h78db;
              5'h01: boundary_low = 15'h78d9;
              5'h02: boundary_low = 15'h78d7;
              5'h03: boundary_low = 15'h78d5;
              5'h04: boundary_low = 15'h78d3;
              5'h05: boundary_low = 15'h78d1;
              5'h06: boundary_low = 15'h78cf;
              5'h07: boundary_low = 15'h78cd;
              5'h08: boundary_low = 15'h78cb;
              5'h09: boundary_low = 15'h78c9;
              5'h0a: boundary_low = 15'h78c8;
              5'h0b: boundary_low = 15'h78c6;
              5'h0c: boundary_low = 15'h78c4;
              5'h0d: boundary_low = 15'h78c2;
              5'h0e: boundary_low = 15'h78c0;
              5'h0f: boundary_low = 15'h78be;
              5'h10: boundary_low = 15'h78bc;
              5'h11: boundary_low = 15'h78ba;
              5'h12: boundary_low = 15'h78b8;
              5'h13: boundary_low = 15'h78b7;
              5'h14: boundary_low = 15'h78b5;
              5'h15: boundary_low = 15'h78b3;
              5'h16: boundary_low = 15'h78b1;
              5'h17: boundary_low = 15'h78af;
              5'h18: boundary_low = 15'h78ad;
              5'h19: boundary_low = 15'h78ab;
              5'h1a: boundary_low = 15'h78aa;
              5'h1b: boundary_low = 15'h78a8;
              5'h1c: boundary_low = 15'h78a6;
              5'h1d: boundary_low = 15'h78a4;
              5'h1e: boundary_low = 15'h78a2;
              5'h1f: boundary_low = 15'h78a0;
              default: boundary_low = 15'h0000;
            endcase
          end
          5'h1d: begin
            case (mant[4:0])
              5'h00: boundary_low = 15'h789f;
              5'h01: boundary_low = 15'h789d;
              5'h02: boundary_low = 15'h789b;
              5'h03: boundary_low = 15'h7899;
              5'h04: boundary_low = 15'h7897;
              5'h05: boundary_low = 15'h7896;
              5'h06: boundary_low = 15'h7894;
              5'h07: boundary_low = 15'h7892;
              5'h08: boundary_low = 15'h7890;
              5'h09: boundary_low = 15'h788e;
              5'h0a: boundary_low = 15'h788d;
              5'h0b: boundary_low = 15'h788b;
              5'h0c: boundary_low = 15'h7889;
              5'h0d: boundary_low = 15'h7887;
              5'h0e: boundary_low = 15'h7886;
              5'h0f: boundary_low = 15'h7884;
              5'h10: boundary_low = 15'h7882;
              5'h11: boundary_low = 15'h7880;
              5'h12: boundary_low = 15'h787f;
              5'h13: boundary_low = 15'h787d;
              5'h14: boundary_low = 15'h787b;
              5'h15: boundary_low = 15'h7879;
              5'h16: boundary_low = 15'h7878;
              5'h17: boundary_low = 15'h7876;
              5'h18: boundary_low = 15'h7874;
              5'h19: boundary_low = 15'h7872;
              5'h1a: boundary_low = 15'h7871;
              5'h1b: boundary_low = 15'h786f;
              5'h1c: boundary_low = 15'h786d;
              5'h1d: boundary_low = 15'h786b;
              5'h1e: boundary_low = 15'h786a;
              5'h1f: boundary_low = 15'h7868;
              default: boundary_low = 15'h0000;
            endcase
          end
          5'h1e: begin
            case (mant[4:0])
              5'h00: boundary_low = 15'h7866;
              5'h01: boundary_low = 15'h7865;
              5'h02: boundary_low = 15'h7863;
              5'h03: boundary_low = 15'h7861;
              5'h04: boundary_low = 15'h7860;
              5'h05: boundary_low = 15'h785e;
              5'h06: boundary_low = 15'h785c;
              5'h07: boundary_low = 15'h785a;
              5'h08: boundary_low = 15'h7859;
              5'h09: boundary_low = 15'h7857;
              5'h0a: boundary_low = 15'h7855;
              5'h0b: boundary_low = 15'h7854;
              5'h0c: boundary_low = 15'h7852;
              5'h0d: boundary_low = 15'h7850;
              5'h0e: boundary_low = 15'h784f;
              5'h0f: boundary_low = 15'h784d;
              5'h10: boundary_low = 15'h784c;
              5'h11: boundary_low = 15'h784a;
              5'h12: boundary_low = 15'h7848;
              5'h13: boundary_low = 15'h7847;
              5'h14: boundary_low = 15'h7845;
              5'h15: boundary_low = 15'h7843;
              5'h16: boundary_low = 15'h7842;
              5'h17: boundary_low = 15'h7840;
              5'h18: boundary_low = 15'h783e;
              5'h19: boundary_low = 15'h783d;
              5'h1a: boundary_low = 15'h783b;
              5'h1b: boundary_low = 15'h783a;
              5'h1c: boundary_low = 15'h7838;
              5'h1d: boundary_low = 15'h7836;
              5'h1e: boundary_low = 15'h7835;
              5'h1f: boundary_low = 15'h7833;
              default: boundary_low = 15'h0000;
            endcase
          end
          5'h1f: begin
            case (mant[4:0])
              5'h00: boundary_low = 15'h7832;
              5'h01: boundary_low = 15'h7830;
              5'h02: boundary_low = 15'h782e;
              5'h03: boundary_low = 15'h782d;
              5'h04: boundary_low = 15'h782b;
              5'h05: boundary_low = 15'h782a;
              5'h06: boundary_low = 15'h7828;
              5'h07: boundary_low = 15'h7826;
              5'h08: boundary_low = 15'h7825;
              5'h09: boundary_low = 15'h7823;
              5'h0a: boundary_low = 15'h7822;
              5'h0b: boundary_low = 15'h7820;
              5'h0c: boundary_low = 15'h781f;
              5'h0d: boundary_low = 15'h781d;
              5'h0e: boundary_low = 15'h781b;
              5'h0f: boundary_low = 15'h781a;
              5'h10: boundary_low = 15'h7818;
              5'h11: boundary_low = 15'h7817;
              5'h12: boundary_low = 15'h7815;
              5'h13: boundary_low = 15'h7814;
              5'h14: boundary_low = 15'h7812;
              5'h15: boundary_low = 15'h7811;
              5'h16: boundary_low = 15'h780f;
              5'h17: boundary_low = 15'h780e;
              5'h18: boundary_low = 15'h780c;
              5'h19: boundary_low = 15'h780b;
              5'h1a: boundary_low = 15'h7809;
              5'h1b: boundary_low = 15'h7808;
              5'h1c: boundary_low = 15'h7806;
              5'h1d: boundary_low = 15'h7805;
              5'h1e: boundary_low = 15'h7803;
              5'h1f: boundary_low = 15'h7802;
              default: boundary_low = 15'h0000;
            endcase
          end
          default: boundary_low = 15'h0000;
        endcase
      end
      5'h13: begin
        case (mant[9:5])
          5'h00: begin
            case (mant[4:0])
              5'h00: boundary_low = 15'h0c00;
              5'h01: boundary_low = 15'h0bfa;
              5'h02: boundary_low = 15'h0bf4;
              5'h03: boundary_low = 15'h0bee;
              5'h04: boundary_low = 15'h0be8;
              5'h05: boundary_low = 15'h0be2;
              5'h06: boundary_low = 15'h0bdc;
              5'h07: boundary_low = 15'h0bd7;
              5'h08: boundary_low = 15'h0bd1;
              5'h09: boundary_low = 15'h0bcb;
              5'h0a: boundary_low = 15'h0bc5;
              5'h0b: boundary_low = 15'h0bbf;
              5'h0c: boundary_low = 15'h0bba;
              5'h0d: boundary_low = 15'h0bb4;
              5'h0e: boundary_low = 15'h0bae;
              5'h0f: boundary_low = 15'h0ba9;
              5'h10: boundary_low = 15'h0ba3;
              5'h11: boundary_low = 15'h0b9d;
              5'h12: boundary_low = 15'h0b98;
              5'h13: boundary_low = 15'h0b92;
              5'h14: boundary_low = 15'h0b8d;
              5'h15: boundary_low = 15'h0b87;
              5'h16: boundary_low = 15'h0b81;
              5'h17: boundary_low = 15'h0b7c;
              5'h18: boundary_low = 15'h0b76;
              5'h19: boundary_low = 15'h0b71;
              5'h1a: boundary_low = 15'h0b6c;
              5'h1b: boundary_low = 15'h0b66;
              5'h1c: boundary_low = 15'h0b61;
              5'h1d: boundary_low = 15'h0b5b;
              5'h1e: boundary_low = 15'h0b56;
              5'h1f: boundary_low = 15'h0b51;
              default: boundary_low = 15'h0000;
            endcase
          end
          5'h01: begin
            case (mant[4:0])
              5'h00: boundary_low = 15'h0b4b;
              5'h01: boundary_low = 15'h0b46;
              5'h02: boundary_low = 15'h0b41;
              5'h03: boundary_low = 15'h0b3c;
              5'h04: boundary_low = 15'h0b36;
              5'h05: boundary_low = 15'h0b31;
              5'h06: boundary_low = 15'h0b2c;
              5'h07: boundary_low = 15'h0b27;
              5'h08: boundary_low = 15'h0b22;
              5'h09: boundary_low = 15'h0b1c;
              5'h0a: boundary_low = 15'h0b17;
              5'h0b: boundary_low = 15'h0b12;
              5'h0c: boundary_low = 15'h0b0d;
              5'h0d: boundary_low = 15'h0b08;
              5'h0e: boundary_low = 15'h0b03;
              5'h0f: boundary_low = 15'h0afe;
              5'h10: boundary_low = 15'h0af9;
              5'h11: boundary_low = 15'h0af4;
              5'h12: boundary_low = 15'h0aef;
              5'h13: boundary_low = 15'h0aea;
              5'h14: boundary_low = 15'h0ae5;
              5'h15: boundary_low = 15'h0ae0;
              5'h16: boundary_low = 15'h0adb;
              5'h17: boundary_low = 15'h0ad7;
              5'h18: boundary_low = 15'h0ad2;
              5'h19: boundary_low = 15'h0acd;
              5'h1a: boundary_low = 15'h0ac8;
              5'h1b: boundary_low = 15'h0ac3;
              5'h1c: boundary_low = 15'h0abe;
              5'h1d: boundary_low = 15'h0aba;
              5'h1e: boundary_low = 15'h0ab5;
              5'h1f: boundary_low = 15'h0ab0;
              default: boundary_low = 15'h0000;
            endcase
          end
          5'h02: begin
            case (mant[4:0])
              5'h00: boundary_low = 15'h0aab;
              5'h01: boundary_low = 15'h0aa7;
              5'h02: boundary_low = 15'h0aa2;
              5'h03: boundary_low = 15'h0a9d;
              5'h04: boundary_low = 15'h0a99;
              5'h05: boundary_low = 15'h0a94;
              5'h06: boundary_low = 15'h0a8f;
              5'h07: boundary_low = 15'h0a8b;
              5'h08: boundary_low = 15'h0a86;
              5'h09: boundary_low = 15'h0a82;
              5'h0a: boundary_low = 15'h0a7d;
              5'h0b: boundary_low = 15'h0a79;
              5'h0c: boundary_low = 15'h0a74;
              5'h0d: boundary_low = 15'h0a70;
              5'h0e: boundary_low = 15'h0a6b;
              5'h0f: boundary_low = 15'h0a67;
              5'h10: boundary_low = 15'h0a62;
              5'h11: boundary_low = 15'h0a5e;
              5'h12: boundary_low = 15'h0a59;
              5'h13: boundary_low = 15'h0a55;
              5'h14: boundary_low = 15'h0a51;
              5'h15: boundary_low = 15'h0a4c;
              5'h16: boundary_low = 15'h0a48;
              5'h17: boundary_low = 15'h0a44;
              5'h18: boundary_low = 15'h0a3f;
              5'h19: boundary_low = 15'h0a3b;
              5'h1a: boundary_low = 15'h0a37;
              5'h1b: boundary_low = 15'h0a32;
              5'h1c: boundary_low = 15'h0a2e;
              5'h1d: boundary_low = 15'h0a2a;
              5'h1e: boundary_low = 15'h0a26;
              5'h1f: boundary_low = 15'h0a21;
              default: boundary_low = 15'h0000;
            endcase
          end
          5'h03: begin
            case (mant[4:0])
              5'h00: boundary_low = 15'h0a1d;
              5'h01: boundary_low = 15'h0a19;
              5'h02: boundary_low = 15'h0a15;
              5'h03: boundary_low = 15'h0a11;
              5'h04: boundary_low = 15'h0a0d;
              5'h05: boundary_low = 15'h0a08;
              5'h06: boundary_low = 15'h0a04;
              5'h07: boundary_low = 15'h0a00;
              5'h08: boundary_low = 15'h09fc;
              5'h09: boundary_low = 15'h09f8;
              5'h0a: boundary_low = 15'h09f4;
              5'h0b: boundary_low = 15'h09f0;
              5'h0c: boundary_low = 15'h09ec;
              5'h0d: boundary_low = 15'h09e8;
              5'h0e: boundary_low = 15'h09e4;
              5'h0f: boundary_low = 15'h09e0;
              5'h10: boundary_low = 15'h09dc;
              5'h11: boundary_low = 15'h09d8;
              5'h12: boundary_low = 15'h09d4;
              5'h13: boundary_low = 15'h09d0;
              5'h14: boundary_low = 15'h09cc;
              5'h15: boundary_low = 15'h09c8;
              5'h16: boundary_low = 15'h09c4;
              5'h17: boundary_low = 15'h09c1;
              5'h18: boundary_low = 15'h09bd;
              5'h19: boundary_low = 15'h09b9;
              5'h1a: boundary_low = 15'h09b5;
              5'h1b: boundary_low = 15'h09b1;
              5'h1c: boundary_low = 15'h09ad;
              5'h1d: boundary_low = 15'h09aa;
              5'h1e: boundary_low = 15'h09a6;
              5'h1f: boundary_low = 15'h09a2;
              default: boundary_low = 15'h0000;
            endcase
          end
          5'h04: begin
            case (mant[4:0])
              5'h00: boundary_low = 15'h099e;
              5'h01: boundary_low = 15'h099b;
              5'h02: boundary_low = 15'h0997;
              5'h03: boundary_low = 15'h0993;
              5'h04: boundary_low = 15'h098f;
              5'h05: boundary_low = 15'h098c;
              5'h06: boundary_low = 15'h0988;
              5'h07: boundary_low = 15'h0984;
              5'h08: boundary_low = 15'h0981;
              5'h09: boundary_low = 15'h097d;
              5'h0a: boundary_low = 15'h097a;
              5'h0b: boundary_low = 15'h0976;
              5'h0c: boundary_low = 15'h0972;
              5'h0d: boundary_low = 15'h096f;
              5'h0e: boundary_low = 15'h096b;
              5'h0f: boundary_low = 15'h0968;
              5'h10: boundary_low = 15'h0964;
              5'h11: boundary_low = 15'h0961;
              5'h12: boundary_low = 15'h095d;
              5'h13: boundary_low = 15'h0959;
              5'h14: boundary_low = 15'h0956;
              5'h15: boundary_low = 15'h0952;
              5'h16: boundary_low = 15'h094f;
              5'h17: boundary_low = 15'h094c;
              5'h18: boundary_low = 15'h0948;
              5'h19: boundary_low = 15'h0945;
              5'h1a: boundary_low = 15'h0941;
              5'h1b: boundary_low = 15'h093e;
              5'h1c: boundary_low = 15'h093a;
              5'h1d: boundary_low = 15'h0937;
              5'h1e: boundary_low = 15'h0934;
              5'h1f: boundary_low = 15'h0930;
              default: boundary_low = 15'h0000;
            endcase
          end
          5'h05: begin
            case (mant[4:0])
              5'h00: boundary_low = 15'h092d;
              5'h01: boundary_low = 15'h092a;
              5'h02: boundary_low = 15'h0926;
              5'h03: boundary_low = 15'h0923;
              5'h04: boundary_low = 15'h0920;
              5'h05: boundary_low = 15'h091c;
              5'h06: boundary_low = 15'h0919;
              5'h07: boundary_low = 15'h0916;
              5'h08: boundary_low = 15'h0912;
              5'h09: boundary_low = 15'h090f;
              5'h0a: boundary_low = 15'h090c;
              5'h0b: boundary_low = 15'h0909;
              5'h0c: boundary_low = 15'h0905;
              5'h0d: boundary_low = 15'h0902;
              5'h0e: boundary_low = 15'h08ff;
              5'h0f: boundary_low = 15'h08fc;
              5'h10: boundary_low = 15'h08f9;
              5'h11: boundary_low = 15'h08f5;
              5'h12: boundary_low = 15'h08f2;
              5'h13: boundary_low = 15'h08ef;
              5'h14: boundary_low = 15'h08ec;
              5'h15: boundary_low = 15'h08e9;
              5'h16: boundary_low = 15'h08e6;
              5'h17: boundary_low = 15'h08e3;
              5'h18: boundary_low = 15'h08df;
              5'h19: boundary_low = 15'h08dc;
              5'h1a: boundary_low = 15'h08d9;
              5'h1b: boundary_low = 15'h08d6;
              5'h1c: boundary_low = 15'h08d3;
              5'h1d: boundary_low = 15'h08d0;
              5'h1e: boundary_low = 15'h08cd;
              5'h1f: boundary_low = 15'h08ca;
              default: boundary_low = 15'h0000;
            endcase
          end
          5'h06: begin
            case (mant[4:0])
              5'h00: boundary_low = 15'h08c7;
              5'h01: boundary_low = 15'h08c4;
              5'h02: boundary_low = 15'h08c1;
              5'h03: boundary_low = 15'h08be;
              5'h04: boundary_low = 15'h08bb;
              5'h05: boundary_low = 15'h08b8;
              5'h06: boundary_low = 15'h08b5;
              5'h07: boundary_low = 15'h08b2;
              5'h08: boundary_low = 15'h08af;
              5'h09: boundary_low = 15'h08ac;
              5'h0a: boundary_low = 15'h08a9;
              5'h0b: boundary_low = 15'h08a6;
              5'h0c: boundary_low = 15'h08a4;
              5'h0d: boundary_low = 15'h08a1;
              5'h0e: boundary_low = 15'h089e;
              5'h0f: boundary_low = 15'h089b;
              5'h10: boundary_low = 15'h0898;
              5'h11: boundary_low = 15'h0895;
              5'h12: boundary_low = 15'h0892;
              5'h13: boundary_low = 15'h088f;
              5'h14: boundary_low = 15'h088d;
              5'h15: boundary_low = 15'h088a;
              5'h16: boundary_low = 15'h0887;
              5'h17: boundary_low = 15'h0884;
              5'h18: boundary_low = 15'h0881;
              5'h19: boundary_low = 15'h087f;
              5'h1a: boundary_low = 15'h087c;
              5'h1b: boundary_low = 15'h0879;
              5'h1c: boundary_low = 15'h0876;
              5'h1d: boundary_low = 15'h0874;
              5'h1e: boundary_low = 15'h0871;
              5'h1f: boundary_low = 15'h086e;
              default: boundary_low = 15'h0000;
            endcase
          end
          5'h07: begin
            case (mant[4:0])
              5'h00: boundary_low = 15'h086b;
              5'h01: boundary_low = 15'h0869;
              5'h02: boundary_low = 15'h0866;
              5'h03: boundary_low = 15'h0863;
              5'h04: boundary_low = 15'h0861;
              5'h05: boundary_low = 15'h085e;
              5'h06: boundary_low = 15'h085b;
              5'h07: boundary_low = 15'h0858;
              5'h08: boundary_low = 15'h0856;
              5'h09: boundary_low = 15'h0853;
              5'h0a: boundary_low = 15'h0851;
              5'h0b: boundary_low = 15'h084e;
              5'h0c: boundary_low = 15'h084b;
              5'h0d: boundary_low = 15'h0849;
              5'h0e: boundary_low = 15'h0846;
              5'h0f: boundary_low = 15'h0843;
              5'h10: boundary_low = 15'h0841;
              5'h11: boundary_low = 15'h083e;
              5'h12: boundary_low = 15'h083c;
              5'h13: boundary_low = 15'h0839;
              5'h14: boundary_low = 15'h0837;
              5'h15: boundary_low = 15'h0834;
              5'h16: boundary_low = 15'h0832;
              5'h17: boundary_low = 15'h082f;
              5'h18: boundary_low = 15'h082c;
              5'h19: boundary_low = 15'h082a;
              5'h1a: boundary_low = 15'h0827;
              5'h1b: boundary_low = 15'h0825;
              5'h1c: boundary_low = 15'h0822;
              5'h1d: boundary_low = 15'h0820;
              5'h1e: boundary_low = 15'h081e;
              5'h1f: boundary_low = 15'h081b;
              default: boundary_low = 15'h0000;
            endcase
          end
          5'h08: begin
            case (mant[4:0])
              5'h00: boundary_low = 15'h0819;
              5'h01: boundary_low = 15'h0816;
              5'h02: boundary_low = 15'h0814;
              5'h03: boundary_low = 15'h0811;
              5'h04: boundary_low = 15'h080f;
              5'h05: boundary_low = 15'h080c;
              5'h06: boundary_low = 15'h080a;
              5'h07: boundary_low = 15'h0808;
              5'h08: boundary_low = 15'h0805;
              5'h09: boundary_low = 15'h0803;
              5'h0a: boundary_low = 15'h0800;
              5'h0b: boundary_low = 15'h07fc;
              5'h0c: boundary_low = 15'h07f7;
              5'h0d: boundary_low = 15'h07f3;
              5'h0e: boundary_low = 15'h07ee;
              5'h0f: boundary_low = 15'h07e9;
              5'h10: boundary_low = 15'h07e4;
              5'h11: boundary_low = 15'h07e0;
              5'h12: boundary_low = 15'h07db;
              5'h13: boundary_low = 15'h07d6;
              5'h14: boundary_low = 15'h07d2;
              5'h15: boundary_low = 15'h07cd;
              5'h16: boundary_low = 15'h07c9;
              5'h17: boundary_low = 15'h07c4;
              5'h18: boundary_low = 15'h07bf;
              5'h19: boundary_low = 15'h07bb;
              5'h1a: boundary_low = 15'h07b6;
              5'h1b: boundary_low = 15'h07b2;
              5'h1c: boundary_low = 15'h07ad;
              5'h1d: boundary_low = 15'h07a9;
              5'h1e: boundary_low = 15'h07a4;
              5'h1f: boundary_low = 15'h07a0;
              default: boundary_low = 15'h0000;
            endcase
          end
          5'h09: begin
            case (mant[4:0])
              5'h00: boundary_low = 15'h079b;
              5'h01: boundary_low = 15'h0797;
              5'h02: boundary_low = 15'h0793;
              5'h03: boundary_low = 15'h078e;
              5'h04: boundary_low = 15'h078a;
              5'h05: boundary_low = 15'h0785;
              5'h06: boundary_low = 15'h0781;
              5'h07: boundary_low = 15'h077d;
              5'h08: boundary_low = 15'h0778;
              5'h09: boundary_low = 15'h0774;
              5'h0a: boundary_low = 15'h0770;
              5'h0b: boundary_low = 15'h076b;
              5'h0c: boundary_low = 15'h0767;
              5'h0d: boundary_low = 15'h0763;
              5'h0e: boundary_low = 15'h075e;
              5'h0f: boundary_low = 15'h075a;
              5'h10: boundary_low = 15'h0756;
              5'h11: boundary_low = 15'h0752;
              5'h12: boundary_low = 15'h074d;
              5'h13: boundary_low = 15'h0749;
              5'h14: boundary_low = 15'h0745;
              5'h15: boundary_low = 15'h0741;
              5'h16: boundary_low = 15'h073d;
              5'h17: boundary_low = 15'h0738;
              5'h18: boundary_low = 15'h0734;
              5'h19: boundary_low = 15'h0730;
              5'h1a: boundary_low = 15'h072c;
              5'h1b: boundary_low = 15'h0728;
              5'h1c: boundary_low = 15'h0724;
              5'h1d: boundary_low = 15'h0720;
              5'h1e: boundary_low = 15'h071c;
              5'h1f: boundary_low = 15'h0718;
              default: boundary_low = 15'h0000;
            endcase
          end
          5'h0a: begin
            case (mant[4:0])
              5'h00: boundary_low = 15'h0714;
              5'h01: boundary_low = 15'h0710;
              5'h02: boundary_low = 15'h070c;
              5'h03: boundary_low = 15'h0708;
              5'h04: boundary_low = 15'h0704;
              5'h05: boundary_low = 15'h0700;
              5'h06: boundary_low = 15'h06fc;
              5'h07: boundary_low = 15'h06f8;
              5'h08: boundary_low = 15'h06f4;
              5'h09: boundary_low = 15'h06f0;
              5'h0a: boundary_low = 15'h06ec;
              5'h0b: boundary_low = 15'h06e8;
              5'h0c: boundary_low = 15'h06e4;
              5'h0d: boundary_low = 15'h06e0;
              5'h0e: boundary_low = 15'h06dc;
              5'h0f: boundary_low = 15'h06d8;
              5'h10: boundary_low = 15'h06d4;
              5'h11: boundary_low = 15'h06d1;
              5'h12: boundary_low = 15'h06cd;
              5'h13: boundary_low = 15'h06c9;
              5'h14: boundary_low = 15'h06c5;
              5'h15: boundary_low = 15'h06c1;
              5'h16: boundary_low = 15'h06bd;
              5'h17: boundary_low = 15'h06ba;
              5'h18: boundary_low = 15'h06b6;
              5'h19: boundary_low = 15'h06b2;
              5'h1a: boundary_low = 15'h06ae;
              5'h1b: boundary_low = 15'h06ab;
              5'h1c: boundary_low = 15'h06a7;
              5'h1d: boundary_low = 15'h06a3;
              5'h1e: boundary_low = 15'h06a0;
              5'h1f: boundary_low = 15'h069c;
              default: boundary_low = 15'h0000;
            endcase
          end
          5'h0b: begin
            case (mant[4:0])
              5'h00: boundary_low = 15'h0698;
              5'h01: boundary_low = 15'h0694;
              5'h02: boundary_low = 15'h0691;
              5'h03: boundary_low = 15'h068d;
              5'h04: boundary_low = 15'h0689;
              5'h05: boundary_low = 15'h0686;
              5'h06: boundary_low = 15'h0682;
              5'h07: boundary_low = 15'h067f;
              5'h08: boundary_low = 15'h067b;
              5'h09: boundary_low = 15'h0677;
              5'h0a: boundary_low = 15'h0674;
              5'h0b: boundary_low = 15'h0670;
              5'h0c: boundary_low = 15'h066d;
              5'h0d: boundary_low = 15'h0669;
              5'h0e: boundary_low = 15'h0666;
              5'h0f: boundary_low = 15'h0662;
              5'h10: boundary_low = 15'h065f;
              5'h11: boundary_low = 15'h065b;
              5'h12: boundary_low = 15'h0658;
              5'h13: boundary_low = 15'h0654;
              5'h14: boundary_low = 15'h0651;
              5'h15: boundary_low = 15'h064d;
              5'h16: boundary_low = 15'h064a;
              5'h17: boundary_low = 15'h0646;
              5'h18: boundary_low = 15'h0643;
              5'h19: boundary_low = 15'h063f;
              5'h1a: boundary_low = 15'h063c;
              5'h1b: boundary_low = 15'h0639;
              5'h1c: boundary_low = 15'h0635;
              5'h1d: boundary_low = 15'h0632;
              5'h1e: boundary_low = 15'h062e;
              5'h1f: boundary_low = 15'h062b;
              default: boundary_low = 15'h0000;
            endcase
          end
          5'h0c: begin
            case (mant[4:0])
              5'h00: boundary_low = 15'h0628;
              5'h01: boundary_low = 15'h0624;
              5'h02: boundary_low = 15'h0621;
              5'h03: boundary_low = 15'h061e;
              5'h04: boundary_low = 15'h061a;
              5'h05: boundary_low = 15'h0617;
              5'h06: boundary_low = 15'h0614;
              5'h07: boundary_low = 15'h0610;
              5'h08: boundary_low = 15'h060d;
              5'h09: boundary_low = 15'h060a;
              5'h0a: boundary_low = 15'h0607;
              5'h0b: boundary_low = 15'h0603;
              5'h0c: boundary_low = 15'h0600;
              5'h0d: boundary_low = 15'h05fd;
              5'h0e: boundary_low = 15'h05fa;
              5'h0f: boundary_low = 15'h05f6;
              5'h10: boundary_low = 15'h05f3;
              5'h11: boundary_low = 15'h05f0;
              5'h12: boundary_low = 15'h05ed;
              5'h13: boundary_low = 15'h05ea;
              5'h14: boundary_low = 15'h05e6;
              5'h15: boundary_low = 15'h05e3;
              5'h16: boundary_low = 15'h05e0;
              5'h17: boundary_low = 15'h05dd;
              5'h18: boundary_low = 15'h05da;
              5'h19: boundary_low = 15'h05d7;
              5'h1a: boundary_low = 15'h05d3;
              5'h1b: boundary_low = 15'h05d0;
              5'h1c: boundary_low = 15'h05cd;
              5'h1d: boundary_low = 15'h05ca;
              5'h1e: boundary_low = 15'h05c7;
              5'h1f: boundary_low = 15'h05c4;
              default: boundary_low = 15'h0000;
            endcase
          end
          5'h0d: begin
            case (mant[4:0])
              5'h00: boundary_low = 15'h05c1;
              5'h01: boundary_low = 15'h05be;
              5'h02: boundary_low = 15'h05bb;
              5'h03: boundary_low = 15'h05b8;
              5'h04: boundary_low = 15'h05b5;
              5'h05: boundary_low = 15'h05b2;
              5'h06: boundary_low = 15'h05af;
              5'h07: boundary_low = 15'h05ac;
              5'h08: boundary_low = 15'h05a9;
              5'h09: boundary_low = 15'h05a6;
              5'h0a: boundary_low = 15'h05a3;
              5'h0b: boundary_low = 15'h05a0;
              5'h0c: boundary_low = 15'h059d;
              5'h0d: boundary_low = 15'h059a;
              5'h0e: boundary_low = 15'h0597;
              5'h0f: boundary_low = 15'h0594;
              5'h10: boundary_low = 15'h0591;
              5'h11: boundary_low = 15'h058e;
              5'h12: boundary_low = 15'h058b;
              5'h13: boundary_low = 15'h0588;
              5'h14: boundary_low = 15'h0585;
              5'h15: boundary_low = 15'h0582;
              5'h16: boundary_low = 15'h057f;
              5'h17: boundary_low = 15'h057d;
              5'h18: boundary_low = 15'h057a;
              5'h19: boundary_low = 15'h0577;
              5'h1a: boundary_low = 15'h0574;
              5'h1b: boundary_low = 15'h0571;
              5'h1c: boundary_low = 15'h056e;
              5'h1d: boundary_low = 15'h056b;
              5'h1e: boundary_low = 15'h0569;
              5'h1f: boundary_low = 15'h0566;
              default: boundary_low = 15'h0000;
            endcase
          end
          5'h0e: begin
            case (mant[4:0])
              5'h00: boundary_low = 15'h0563;
              5'h01: boundary_low = 15'h0560;
              5'h02: boundary_low = 15'h055d;
              5'h03: boundary_low = 15'h055b;
              5'h04: boundary_low = 15'h0558;
              5'h05: boundary_low = 15'h0555;
              5'h06: boundary_low = 15'h0552;
              5'h07: boundary_low = 15'h054f;
              5'h08: boundary_low = 15'h054d;
              5'h09: boundary_low = 15'h054a;
              5'h0a: boundary_low = 15'h0547;
              5'h0b: boundary_low = 15'h0544;
              5'h0c: boundary_low = 15'h0542;
              5'h0d: boundary_low = 15'h053f;
              5'h0e: boundary_low = 15'h053c;
              5'h0f: boundary_low = 15'h053a;
              5'h10: boundary_low = 15'h0537;
              5'h11: boundary_low = 15'h0534;
              5'h12: boundary_low = 15'h0532;
              5'h13: boundary_low = 15'h052f;
              5'h14: boundary_low = 15'h052c;
              5'h15: boundary_low = 15'h052a;
              5'h16: boundary_low = 15'h0527;
              5'h17: boundary_low = 15'h0524;
              5'h18: boundary_low = 15'h0522;
              5'h19: boundary_low = 15'h051f;
              5'h1a: boundary_low = 15'h051c;
              5'h1b: boundary_low = 15'h051a;
              5'h1c: boundary_low = 15'h0517;
              5'h1d: boundary_low = 15'h0515;
              5'h1e: boundary_low = 15'h0512;
              5'h1f: boundary_low = 15'h050f;
              default: boundary_low = 15'h0000;
            endcase
          end
          5'h0f: begin
            case (mant[4:0])
              5'h00: boundary_low = 15'h050d;
              5'h01: boundary_low = 15'h050a;
              5'h02: boundary_low = 15'h0508;
              5'h03: boundary_low = 15'h0505;
              5'h04: boundary_low = 15'h0502;
              5'h05: boundary_low = 15'h0500;
              5'h06: boundary_low = 15'h04fd;
              5'h07: boundary_low = 15'h04fb;
              5'h08: boundary_low = 15'h04f8;
              5'h09: boundary_low = 15'h04f6;
              5'h0a: boundary_low = 15'h04f3;
              5'h0b: boundary_low = 15'h04f1;
              5'h0c: boundary_low = 15'h04ee;
              5'h0d: boundary_low = 15'h04ec;
              5'h0e: boundary_low = 15'h04e9;
              5'h0f: boundary_low = 15'h04e7;
              5'h10: boundary_low = 15'h04e4;
              5'h11: boundary_low = 15'h04e2;
              5'h12: boundary_low = 15'h04df;
              5'h13: boundary_low = 15'h04dd;
              5'h14: boundary_low = 15'h04db;
              5'h15: boundary_low = 15'h04d8;
              5'h16: boundary_low = 15'h04d6;
              5'h17: boundary_low = 15'h04d3;
              5'h18: boundary_low = 15'h04d1;
              5'h19: boundary_low = 15'h04ce;
              5'h1a: boundary_low = 15'h04cc;
              5'h1b: boundary_low = 15'h04ca;
              5'h1c: boundary_low = 15'h04c7;
              5'h1d: boundary_low = 15'h04c5;
              5'h1e: boundary_low = 15'h04c2;
              5'h1f: boundary_low = 15'h04c0;
              default: boundary_low = 15'h0000;
            endcase
          end
          5'h10: begin
            case (mant[4:0])
              5'h00: boundary_low = 15'h04be;
              5'h01: boundary_low = 15'h04bb;
              5'h02: boundary_low = 15'h04b9;
              5'h03: boundary_low = 15'h04b7;
              5'h04: boundary_low = 15'h04b4;
              5'h05: boundary_low = 15'h04b2;
              5'h06: boundary_low = 15'h04b0;
              5'h07: boundary_low = 15'h04ad;
              5'h08: boundary_low = 15'h04ab;
              5'h09: boundary_low = 15'h04a9;
              5'h0a: boundary_low = 15'h04a6;
              5'h0b: boundary_low = 15'h04a4;
              5'h0c: boundary_low = 15'h04a2;
              5'h0d: boundary_low = 15'h049f;
              5'h0e: boundary_low = 15'h049d;
              5'h0f: boundary_low = 15'h049b;
              5'h10: boundary_low = 15'h0498;
              5'h11: boundary_low = 15'h0496;
              5'h12: boundary_low = 15'h0494;
              5'h13: boundary_low = 15'h0492;
              5'h14: boundary_low = 15'h048f;
              5'h15: boundary_low = 15'h048d;
              5'h16: boundary_low = 15'h048b;
              5'h17: boundary_low = 15'h0489;
              5'h18: boundary_low = 15'h0486;
              5'h19: boundary_low = 15'h0484;
              5'h1a: boundary_low = 15'h0482;
              5'h1b: boundary_low = 15'h0480;
              5'h1c: boundary_low = 15'h047e;
              5'h1d: boundary_low = 15'h047b;
              5'h1e: boundary_low = 15'h0479;
              5'h1f: boundary_low = 15'h0477;
              default: boundary_low = 15'h0000;
            endcase
          end
          5'h11: begin
            case (mant[4:0])
              5'h00: boundary_low = 15'h0475;
              5'h01: boundary_low = 15'h0473;
              5'h02: boundary_low = 15'h0470;
              5'h03: boundary_low = 15'h046e;
              5'h04: boundary_low = 15'h046c;
              5'h05: boundary_low = 15'h046a;
              5'h06: boundary_low = 15'h0468;
              5'h07: boundary_low = 15'h0466;
              5'h08: boundary_low = 15'h0464;
              5'h09: boundary_low = 15'h0461;
              5'h0a: boundary_low = 15'h045f;
              5'h0b: boundary_low = 15'h045d;
              5'h0c: boundary_low = 15'h045b;
              5'h0d: boundary_low = 15'h0459;
              5'h0e: boundary_low = 15'h0457;
              5'h0f: boundary_low = 15'h0455;
              5'h10: boundary_low = 15'h0453;
              5'h11: boundary_low = 15'h0451;
              5'h12: boundary_low = 15'h044e;
              5'h13: boundary_low = 15'h044c;
              5'h14: boundary_low = 15'h044a;
              5'h15: boundary_low = 15'h0448;
              5'h16: boundary_low = 15'h0446;
              5'h17: boundary_low = 15'h0444;
              5'h18: boundary_low = 15'h0442;
              5'h19: boundary_low = 15'h0440;
              5'h1a: boundary_low = 15'h043e;
              5'h1b: boundary_low = 15'h043c;
              5'h1c: boundary_low = 15'h043a;
              5'h1d: boundary_low = 15'h0438;
              5'h1e: boundary_low = 15'h0436;
              5'h1f: boundary_low = 15'h0434;
              default: boundary_low = 15'h0000;
            endcase
          end
          5'h12: begin
            case (mant[4:0])
              5'h00: boundary_low = 15'h0432;
              5'h01: boundary_low = 15'h0430;
              5'h02: boundary_low = 15'h042e;
              5'h03: boundary_low = 15'h042c;
              5'h04: boundary_low = 15'h042a;
              5'h05: boundary_low = 15'h0428;
              5'h06: boundary_low = 15'h0426;
              5'h07: boundary_low = 15'h0424;
              5'h08: boundary_low = 15'h0422;
              5'h09: boundary_low = 15'h0420;
              5'h0a: boundary_low = 15'h041e;
              5'h0b: boundary_low = 15'h041c;
              5'h0c: boundary_low = 15'h041a;
              5'h0d: boundary_low = 15'h0418;
              5'h0e: boundary_low = 15'h0416;
              5'h0f: boundary_low = 15'h0414;
              5'h10: boundary_low = 15'h0412;
              5'h11: boundary_low = 15'h0410;
              5'h12: boundary_low = 15'h040e;
              5'h13: boundary_low = 15'h040c;
              5'h14: boundary_low = 15'h040a;
              5'h15: boundary_low = 15'h0409;
              5'h16: boundary_low = 15'h0407;
              5'h17: boundary_low = 15'h0405;
              5'h18: boundary_low = 15'h0403;
              5'h19: boundary_low = 15'h0401;
              5'h1a: boundary_low = 15'h0000;
              5'h1b: boundary_low = 15'h0000;
              5'h1c: boundary_low = 15'h0000;
              5'h1d: boundary_low = 15'h0000;
              5'h1e: boundary_low = 15'h0000;
              5'h1f: boundary_low = 15'h0000;
              default: boundary_low = 15'h0000;
            endcase
          end
          5'h13: boundary_low = 15'h0000;
          5'h14: boundary_low = 15'h0000;
          5'h15: boundary_low = 15'h0000;
          5'h16: boundary_low = 15'h0000;
          5'h17: boundary_low = 15'h0000;
          5'h18: boundary_low = 15'h0000;
          5'h19: boundary_low = 15'h0000;
          5'h1a: boundary_low = 15'h0000;
          5'h1b: boundary_low = 15'h0000;
          5'h1c: boundary_low = 15'h0000;
          5'h1d: boundary_low = 15'h0000;
          5'h1e: boundary_low = 15'h0000;
          5'h1f: boundary_low = 15'h0000;
          default: boundary_low = 15'h0000;
        endcase
      end
      default: boundary_low = 15'h0000;
    endcase
  end
  wire [14:0] boundary_mag = {boundary_low};
  wire [14:0] active_mag = core_active ? core_mag : boundary_mag;
  wire [15:0] active_out = {sign, active_mag};
  assign out = (core_active || boundary_active) ? active_out : special_out;
endmodule
