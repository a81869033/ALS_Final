module ex238_r74_core_boundary_low13_hi5(in, out);
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
  reg [12:0] boundary_low;
  always @* begin
    case (exp)
      5'h09: begin
        case (mant[9:5])
          5'h00: boundary_low = 13'h1c00;
          5'h01: boundary_low = 13'h1c00;
          5'h02: boundary_low = 13'h1c00;
          5'h03: boundary_low = 13'h1c00;
          5'h04: boundary_low = 13'h1c00;
          5'h05: boundary_low = 13'h1c00;
          5'h06: boundary_low = 13'h1c00;
          5'h07: boundary_low = 13'h1c00;
          5'h08: boundary_low = 13'h1c00;
          5'h09: boundary_low = 13'h1c00;
          5'h0a: boundary_low = 13'h1c00;
          5'h0b: boundary_low = 13'h1c00;
          5'h0c: boundary_low = 13'h1c00;
          5'h0d: boundary_low = 13'h1c00;
          5'h0e: boundary_low = 13'h1c00;
          5'h0f: boundary_low = 13'h1c00;
          5'h10: boundary_low = 13'h1c00;
          5'h11: boundary_low = 13'h1c00;
          5'h12: begin
            case (mant[4:0])
              5'h00: boundary_low = 13'h1c00;
              5'h01: boundary_low = 13'h1c00;
              5'h02: boundary_low = 13'h1c00;
              5'h03: boundary_low = 13'h1c00;
              5'h04: boundary_low = 13'h1c00;
              5'h05: boundary_low = 13'h1c00;
              5'h06: boundary_low = 13'h1c00;
              5'h07: boundary_low = 13'h1c00;
              5'h08: boundary_low = 13'h1c00;
              5'h09: boundary_low = 13'h1c00;
              5'h0a: boundary_low = 13'h1c00;
              5'h0b: boundary_low = 13'h1c00;
              5'h0c: boundary_low = 13'h1c00;
              5'h0d: boundary_low = 13'h1c00;
              5'h0e: boundary_low = 13'h1c00;
              5'h0f: boundary_low = 13'h1c00;
              5'h10: boundary_low = 13'h1c00;
              5'h11: boundary_low = 13'h1c00;
              5'h12: boundary_low = 13'h1c00;
              5'h13: boundary_low = 13'h1c00;
              5'h14: boundary_low = 13'h1c00;
              5'h15: boundary_low = 13'h1c00;
              5'h16: boundary_low = 13'h1c00;
              5'h17: boundary_low = 13'h1c00;
              5'h18: boundary_low = 13'h1c00;
              5'h19: boundary_low = 13'h1c00;
              5'h1a: boundary_low = 13'h1bfe;
              5'h1b: boundary_low = 13'h1bfa;
              5'h1c: boundary_low = 13'h1bf7;
              5'h1d: boundary_low = 13'h1bf3;
              5'h1e: boundary_low = 13'h1bef;
              5'h1f: boundary_low = 13'h1beb;
              default: boundary_low = 13'h0000;
            endcase
          end
          5'h13: begin
            case (mant[4:0])
              5'h00: boundary_low = 13'h1be8;
              5'h01: boundary_low = 13'h1be4;
              5'h02: boundary_low = 13'h1be0;
              5'h03: boundary_low = 13'h1bdd;
              5'h04: boundary_low = 13'h1bd9;
              5'h05: boundary_low = 13'h1bd5;
              5'h06: boundary_low = 13'h1bd1;
              5'h07: boundary_low = 13'h1bce;
              5'h08: boundary_low = 13'h1bca;
              5'h09: boundary_low = 13'h1bc7;
              5'h0a: boundary_low = 13'h1bc3;
              5'h0b: boundary_low = 13'h1bbf;
              5'h0c: boundary_low = 13'h1bbc;
              5'h0d: boundary_low = 13'h1bb8;
              5'h0e: boundary_low = 13'h1bb4;
              5'h0f: boundary_low = 13'h1bb1;
              5'h10: boundary_low = 13'h1bad;
              5'h11: boundary_low = 13'h1baa;
              5'h12: boundary_low = 13'h1ba6;
              5'h13: boundary_low = 13'h1ba3;
              5'h14: boundary_low = 13'h1b9f;
              5'h15: boundary_low = 13'h1b9b;
              5'h16: boundary_low = 13'h1b98;
              5'h17: boundary_low = 13'h1b94;
              5'h18: boundary_low = 13'h1b91;
              5'h19: boundary_low = 13'h1b8d;
              5'h1a: boundary_low = 13'h1b8a;
              5'h1b: boundary_low = 13'h1b86;
              5'h1c: boundary_low = 13'h1b83;
              5'h1d: boundary_low = 13'h1b7f;
              5'h1e: boundary_low = 13'h1b7c;
              5'h1f: boundary_low = 13'h1b79;
              default: boundary_low = 13'h0000;
            endcase
          end
          5'h14: begin
            case (mant[4:0])
              5'h00: boundary_low = 13'h1b75;
              5'h01: boundary_low = 13'h1b72;
              5'h02: boundary_low = 13'h1b6e;
              5'h03: boundary_low = 13'h1b6b;
              5'h04: boundary_low = 13'h1b67;
              5'h05: boundary_low = 13'h1b64;
              5'h06: boundary_low = 13'h1b61;
              5'h07: boundary_low = 13'h1b5d;
              5'h08: boundary_low = 13'h1b5a;
              5'h09: boundary_low = 13'h1b56;
              5'h0a: boundary_low = 13'h1b53;
              5'h0b: boundary_low = 13'h1b50;
              5'h0c: boundary_low = 13'h1b4c;
              5'h0d: boundary_low = 13'h1b49;
              5'h0e: boundary_low = 13'h1b46;
              5'h0f: boundary_low = 13'h1b42;
              5'h10: boundary_low = 13'h1b3f;
              5'h11: boundary_low = 13'h1b3c;
              5'h12: boundary_low = 13'h1b38;
              5'h13: boundary_low = 13'h1b35;
              5'h14: boundary_low = 13'h1b32;
              5'h15: boundary_low = 13'h1b2f;
              5'h16: boundary_low = 13'h1b2b;
              5'h17: boundary_low = 13'h1b28;
              5'h18: boundary_low = 13'h1b25;
              5'h19: boundary_low = 13'h1b22;
              5'h1a: boundary_low = 13'h1b1e;
              5'h1b: boundary_low = 13'h1b1b;
              5'h1c: boundary_low = 13'h1b18;
              5'h1d: boundary_low = 13'h1b15;
              5'h1e: boundary_low = 13'h1b11;
              5'h1f: boundary_low = 13'h1b0e;
              default: boundary_low = 13'h0000;
            endcase
          end
          5'h15: begin
            case (mant[4:0])
              5'h00: boundary_low = 13'h1b0b;
              5'h01: boundary_low = 13'h1b08;
              5'h02: boundary_low = 13'h1b05;
              5'h03: boundary_low = 13'h1b02;
              5'h04: boundary_low = 13'h1afe;
              5'h05: boundary_low = 13'h1afb;
              5'h06: boundary_low = 13'h1af8;
              5'h07: boundary_low = 13'h1af5;
              5'h08: boundary_low = 13'h1af2;
              5'h09: boundary_low = 13'h1aef;
              5'h0a: boundary_low = 13'h1aec;
              5'h0b: boundary_low = 13'h1ae8;
              5'h0c: boundary_low = 13'h1ae5;
              5'h0d: boundary_low = 13'h1ae2;
              5'h0e: boundary_low = 13'h1adf;
              5'h0f: boundary_low = 13'h1adc;
              5'h10: boundary_low = 13'h1ad9;
              5'h11: boundary_low = 13'h1ad6;
              5'h12: boundary_low = 13'h1ad3;
              5'h13: boundary_low = 13'h1ad0;
              5'h14: boundary_low = 13'h1acd;
              5'h15: boundary_low = 13'h1aca;
              5'h16: boundary_low = 13'h1ac7;
              5'h17: boundary_low = 13'h1ac4;
              5'h18: boundary_low = 13'h1ac1;
              5'h19: boundary_low = 13'h1abe;
              5'h1a: boundary_low = 13'h1abb;
              5'h1b: boundary_low = 13'h1ab8;
              5'h1c: boundary_low = 13'h1ab5;
              5'h1d: boundary_low = 13'h1ab2;
              5'h1e: boundary_low = 13'h1aaf;
              5'h1f: boundary_low = 13'h1aac;
              default: boundary_low = 13'h0000;
            endcase
          end
          5'h16: begin
            case (mant[4:0])
              5'h00: boundary_low = 13'h1aa9;
              5'h01: boundary_low = 13'h1aa6;
              5'h02: boundary_low = 13'h1aa3;
              5'h03: boundary_low = 13'h1aa0;
              5'h04: boundary_low = 13'h1a9d;
              5'h05: boundary_low = 13'h1a9a;
              5'h06: boundary_low = 13'h1a97;
              5'h07: boundary_low = 13'h1a94;
              5'h08: boundary_low = 13'h1a91;
              5'h09: boundary_low = 13'h1a8e;
              5'h0a: boundary_low = 13'h1a8b;
              5'h0b: boundary_low = 13'h1a89;
              5'h0c: boundary_low = 13'h1a86;
              5'h0d: boundary_low = 13'h1a83;
              5'h0e: boundary_low = 13'h1a80;
              5'h0f: boundary_low = 13'h1a7d;
              5'h10: boundary_low = 13'h1a7a;
              5'h11: boundary_low = 13'h1a77;
              5'h12: boundary_low = 13'h1a75;
              5'h13: boundary_low = 13'h1a72;
              5'h14: boundary_low = 13'h1a6f;
              5'h15: boundary_low = 13'h1a6c;
              5'h16: boundary_low = 13'h1a69;
              5'h17: boundary_low = 13'h1a66;
              5'h18: boundary_low = 13'h1a64;
              5'h19: boundary_low = 13'h1a61;
              5'h1a: boundary_low = 13'h1a5e;
              5'h1b: boundary_low = 13'h1a5b;
              5'h1c: boundary_low = 13'h1a58;
              5'h1d: boundary_low = 13'h1a56;
              5'h1e: boundary_low = 13'h1a53;
              5'h1f: boundary_low = 13'h1a50;
              default: boundary_low = 13'h0000;
            endcase
          end
          5'h17: begin
            case (mant[4:0])
              5'h00: boundary_low = 13'h1a4d;
              5'h01: boundary_low = 13'h1a4b;
              5'h02: boundary_low = 13'h1a48;
              5'h03: boundary_low = 13'h1a45;
              5'h04: boundary_low = 13'h1a42;
              5'h05: boundary_low = 13'h1a40;
              5'h06: boundary_low = 13'h1a3d;
              5'h07: boundary_low = 13'h1a3a;
              5'h08: boundary_low = 13'h1a38;
              5'h09: boundary_low = 13'h1a35;
              5'h0a: boundary_low = 13'h1a32;
              5'h0b: boundary_low = 13'h1a30;
              5'h0c: boundary_low = 13'h1a2d;
              5'h0d: boundary_low = 13'h1a2a;
              5'h0e: boundary_low = 13'h1a28;
              5'h0f: boundary_low = 13'h1a25;
              5'h10: boundary_low = 13'h1a22;
              5'h11: boundary_low = 13'h1a20;
              5'h12: boundary_low = 13'h1a1d;
              5'h13: boundary_low = 13'h1a1a;
              5'h14: boundary_low = 13'h1a18;
              5'h15: boundary_low = 13'h1a15;
              5'h16: boundary_low = 13'h1a12;
              5'h17: boundary_low = 13'h1a10;
              5'h18: boundary_low = 13'h1a0d;
              5'h19: boundary_low = 13'h1a0b;
              5'h1a: boundary_low = 13'h1a08;
              5'h1b: boundary_low = 13'h1a05;
              5'h1c: boundary_low = 13'h1a03;
              5'h1d: boundary_low = 13'h1a00;
              5'h1e: boundary_low = 13'h19fe;
              5'h1f: boundary_low = 13'h19fb;
              default: boundary_low = 13'h0000;
            endcase
          end
          5'h18: begin
            case (mant[4:0])
              5'h00: boundary_low = 13'h19f9;
              5'h01: boundary_low = 13'h19f6;
              5'h02: boundary_low = 13'h19f3;
              5'h03: boundary_low = 13'h19f1;
              5'h04: boundary_low = 13'h19ee;
              5'h05: boundary_low = 13'h19ec;
              5'h06: boundary_low = 13'h19e9;
              5'h07: boundary_low = 13'h19e7;
              5'h08: boundary_low = 13'h19e4;
              5'h09: boundary_low = 13'h19e2;
              5'h0a: boundary_low = 13'h19df;
              5'h0b: boundary_low = 13'h19dd;
              5'h0c: boundary_low = 13'h19da;
              5'h0d: boundary_low = 13'h19d8;
              5'h0e: boundary_low = 13'h19d5;
              5'h0f: boundary_low = 13'h19d3;
              5'h10: boundary_low = 13'h19d0;
              5'h11: boundary_low = 13'h19ce;
              5'h12: boundary_low = 13'h19cb;
              5'h13: boundary_low = 13'h19c9;
              5'h14: boundary_low = 13'h19c6;
              5'h15: boundary_low = 13'h19c4;
              5'h16: boundary_low = 13'h19c2;
              5'h17: boundary_low = 13'h19bf;
              5'h18: boundary_low = 13'h19bd;
              5'h19: boundary_low = 13'h19ba;
              5'h1a: boundary_low = 13'h19b8;
              5'h1b: boundary_low = 13'h19b5;
              5'h1c: boundary_low = 13'h19b3;
              5'h1d: boundary_low = 13'h19b1;
              5'h1e: boundary_low = 13'h19ae;
              5'h1f: boundary_low = 13'h19ac;
              default: boundary_low = 13'h0000;
            endcase
          end
          5'h19: begin
            case (mant[4:0])
              5'h00: boundary_low = 13'h19a9;
              5'h01: boundary_low = 13'h19a7;
              5'h02: boundary_low = 13'h19a5;
              5'h03: boundary_low = 13'h19a2;
              5'h04: boundary_low = 13'h19a0;
              5'h05: boundary_low = 13'h199e;
              5'h06: boundary_low = 13'h199b;
              5'h07: boundary_low = 13'h1999;
              5'h08: boundary_low = 13'h1997;
              5'h09: boundary_low = 13'h1994;
              5'h0a: boundary_low = 13'h1992;
              5'h0b: boundary_low = 13'h1990;
              5'h0c: boundary_low = 13'h198d;
              5'h0d: boundary_low = 13'h198b;
              5'h0e: boundary_low = 13'h1989;
              5'h0f: boundary_low = 13'h1986;
              5'h10: boundary_low = 13'h1984;
              5'h11: boundary_low = 13'h1982;
              5'h12: boundary_low = 13'h197f;
              5'h13: boundary_low = 13'h197d;
              5'h14: boundary_low = 13'h197b;
              5'h15: boundary_low = 13'h1979;
              5'h16: boundary_low = 13'h1976;
              5'h17: boundary_low = 13'h1974;
              5'h18: boundary_low = 13'h1972;
              5'h19: boundary_low = 13'h196f;
              5'h1a: boundary_low = 13'h196d;
              5'h1b: boundary_low = 13'h196b;
              5'h1c: boundary_low = 13'h1969;
              5'h1d: boundary_low = 13'h1966;
              5'h1e: boundary_low = 13'h1964;
              5'h1f: boundary_low = 13'h1962;
              default: boundary_low = 13'h0000;
            endcase
          end
          5'h1a: begin
            case (mant[4:0])
              5'h00: boundary_low = 13'h1960;
              5'h01: boundary_low = 13'h195e;
              5'h02: boundary_low = 13'h195b;
              5'h03: boundary_low = 13'h1959;
              5'h04: boundary_low = 13'h1957;
              5'h05: boundary_low = 13'h1955;
              5'h06: boundary_low = 13'h1953;
              5'h07: boundary_low = 13'h1950;
              5'h08: boundary_low = 13'h194e;
              5'h09: boundary_low = 13'h194c;
              5'h0a: boundary_low = 13'h194a;
              5'h0b: boundary_low = 13'h1948;
              5'h0c: boundary_low = 13'h1945;
              5'h0d: boundary_low = 13'h1943;
              5'h0e: boundary_low = 13'h1941;
              5'h0f: boundary_low = 13'h193f;
              5'h10: boundary_low = 13'h193d;
              5'h11: boundary_low = 13'h193b;
              5'h12: boundary_low = 13'h1939;
              5'h13: boundary_low = 13'h1936;
              5'h14: boundary_low = 13'h1934;
              5'h15: boundary_low = 13'h1932;
              5'h16: boundary_low = 13'h1930;
              5'h17: boundary_low = 13'h192e;
              5'h18: boundary_low = 13'h192c;
              5'h19: boundary_low = 13'h192a;
              5'h1a: boundary_low = 13'h1928;
              5'h1b: boundary_low = 13'h1925;
              5'h1c: boundary_low = 13'h1923;
              5'h1d: boundary_low = 13'h1921;
              5'h1e: boundary_low = 13'h191f;
              5'h1f: boundary_low = 13'h191d;
              default: boundary_low = 13'h0000;
            endcase
          end
          5'h1b: begin
            case (mant[4:0])
              5'h00: boundary_low = 13'h191b;
              5'h01: boundary_low = 13'h1919;
              5'h02: boundary_low = 13'h1917;
              5'h03: boundary_low = 13'h1915;
              5'h04: boundary_low = 13'h1913;
              5'h05: boundary_low = 13'h1911;
              5'h06: boundary_low = 13'h190f;
              5'h07: boundary_low = 13'h190d;
              5'h08: boundary_low = 13'h190b;
              5'h09: boundary_low = 13'h1909;
              5'h0a: boundary_low = 13'h1906;
              5'h0b: boundary_low = 13'h1904;
              5'h0c: boundary_low = 13'h1902;
              5'h0d: boundary_low = 13'h1900;
              5'h0e: boundary_low = 13'h18fe;
              5'h0f: boundary_low = 13'h18fc;
              5'h10: boundary_low = 13'h18fa;
              5'h11: boundary_low = 13'h18f8;
              5'h12: boundary_low = 13'h18f6;
              5'h13: boundary_low = 13'h18f4;
              5'h14: boundary_low = 13'h18f2;
              5'h15: boundary_low = 13'h18f0;
              5'h16: boundary_low = 13'h18ee;
              5'h17: boundary_low = 13'h18ec;
              5'h18: boundary_low = 13'h18ea;
              5'h19: boundary_low = 13'h18e8;
              5'h1a: boundary_low = 13'h18e6;
              5'h1b: boundary_low = 13'h18e5;
              5'h1c: boundary_low = 13'h18e3;
              5'h1d: boundary_low = 13'h18e1;
              5'h1e: boundary_low = 13'h18df;
              5'h1f: boundary_low = 13'h18dd;
              default: boundary_low = 13'h0000;
            endcase
          end
          5'h1c: begin
            case (mant[4:0])
              5'h00: boundary_low = 13'h18db;
              5'h01: boundary_low = 13'h18d9;
              5'h02: boundary_low = 13'h18d7;
              5'h03: boundary_low = 13'h18d5;
              5'h04: boundary_low = 13'h18d3;
              5'h05: boundary_low = 13'h18d1;
              5'h06: boundary_low = 13'h18cf;
              5'h07: boundary_low = 13'h18cd;
              5'h08: boundary_low = 13'h18cb;
              5'h09: boundary_low = 13'h18c9;
              5'h0a: boundary_low = 13'h18c8;
              5'h0b: boundary_low = 13'h18c6;
              5'h0c: boundary_low = 13'h18c4;
              5'h0d: boundary_low = 13'h18c2;
              5'h0e: boundary_low = 13'h18c0;
              5'h0f: boundary_low = 13'h18be;
              5'h10: boundary_low = 13'h18bc;
              5'h11: boundary_low = 13'h18ba;
              5'h12: boundary_low = 13'h18b8;
              5'h13: boundary_low = 13'h18b7;
              5'h14: boundary_low = 13'h18b5;
              5'h15: boundary_low = 13'h18b3;
              5'h16: boundary_low = 13'h18b1;
              5'h17: boundary_low = 13'h18af;
              5'h18: boundary_low = 13'h18ad;
              5'h19: boundary_low = 13'h18ab;
              5'h1a: boundary_low = 13'h18aa;
              5'h1b: boundary_low = 13'h18a8;
              5'h1c: boundary_low = 13'h18a6;
              5'h1d: boundary_low = 13'h18a4;
              5'h1e: boundary_low = 13'h18a2;
              5'h1f: boundary_low = 13'h18a0;
              default: boundary_low = 13'h0000;
            endcase
          end
          5'h1d: begin
            case (mant[4:0])
              5'h00: boundary_low = 13'h189f;
              5'h01: boundary_low = 13'h189d;
              5'h02: boundary_low = 13'h189b;
              5'h03: boundary_low = 13'h1899;
              5'h04: boundary_low = 13'h1897;
              5'h05: boundary_low = 13'h1896;
              5'h06: boundary_low = 13'h1894;
              5'h07: boundary_low = 13'h1892;
              5'h08: boundary_low = 13'h1890;
              5'h09: boundary_low = 13'h188e;
              5'h0a: boundary_low = 13'h188d;
              5'h0b: boundary_low = 13'h188b;
              5'h0c: boundary_low = 13'h1889;
              5'h0d: boundary_low = 13'h1887;
              5'h0e: boundary_low = 13'h1886;
              5'h0f: boundary_low = 13'h1884;
              5'h10: boundary_low = 13'h1882;
              5'h11: boundary_low = 13'h1880;
              5'h12: boundary_low = 13'h187f;
              5'h13: boundary_low = 13'h187d;
              5'h14: boundary_low = 13'h187b;
              5'h15: boundary_low = 13'h1879;
              5'h16: boundary_low = 13'h1878;
              5'h17: boundary_low = 13'h1876;
              5'h18: boundary_low = 13'h1874;
              5'h19: boundary_low = 13'h1872;
              5'h1a: boundary_low = 13'h1871;
              5'h1b: boundary_low = 13'h186f;
              5'h1c: boundary_low = 13'h186d;
              5'h1d: boundary_low = 13'h186b;
              5'h1e: boundary_low = 13'h186a;
              5'h1f: boundary_low = 13'h1868;
              default: boundary_low = 13'h0000;
            endcase
          end
          5'h1e: begin
            case (mant[4:0])
              5'h00: boundary_low = 13'h1866;
              5'h01: boundary_low = 13'h1865;
              5'h02: boundary_low = 13'h1863;
              5'h03: boundary_low = 13'h1861;
              5'h04: boundary_low = 13'h1860;
              5'h05: boundary_low = 13'h185e;
              5'h06: boundary_low = 13'h185c;
              5'h07: boundary_low = 13'h185a;
              5'h08: boundary_low = 13'h1859;
              5'h09: boundary_low = 13'h1857;
              5'h0a: boundary_low = 13'h1855;
              5'h0b: boundary_low = 13'h1854;
              5'h0c: boundary_low = 13'h1852;
              5'h0d: boundary_low = 13'h1850;
              5'h0e: boundary_low = 13'h184f;
              5'h0f: boundary_low = 13'h184d;
              5'h10: boundary_low = 13'h184c;
              5'h11: boundary_low = 13'h184a;
              5'h12: boundary_low = 13'h1848;
              5'h13: boundary_low = 13'h1847;
              5'h14: boundary_low = 13'h1845;
              5'h15: boundary_low = 13'h1843;
              5'h16: boundary_low = 13'h1842;
              5'h17: boundary_low = 13'h1840;
              5'h18: boundary_low = 13'h183e;
              5'h19: boundary_low = 13'h183d;
              5'h1a: boundary_low = 13'h183b;
              5'h1b: boundary_low = 13'h183a;
              5'h1c: boundary_low = 13'h1838;
              5'h1d: boundary_low = 13'h1836;
              5'h1e: boundary_low = 13'h1835;
              5'h1f: boundary_low = 13'h1833;
              default: boundary_low = 13'h0000;
            endcase
          end
          5'h1f: begin
            case (mant[4:0])
              5'h00: boundary_low = 13'h1832;
              5'h01: boundary_low = 13'h1830;
              5'h02: boundary_low = 13'h182e;
              5'h03: boundary_low = 13'h182d;
              5'h04: boundary_low = 13'h182b;
              5'h05: boundary_low = 13'h182a;
              5'h06: boundary_low = 13'h1828;
              5'h07: boundary_low = 13'h1826;
              5'h08: boundary_low = 13'h1825;
              5'h09: boundary_low = 13'h1823;
              5'h0a: boundary_low = 13'h1822;
              5'h0b: boundary_low = 13'h1820;
              5'h0c: boundary_low = 13'h181f;
              5'h0d: boundary_low = 13'h181d;
              5'h0e: boundary_low = 13'h181b;
              5'h0f: boundary_low = 13'h181a;
              5'h10: boundary_low = 13'h1818;
              5'h11: boundary_low = 13'h1817;
              5'h12: boundary_low = 13'h1815;
              5'h13: boundary_low = 13'h1814;
              5'h14: boundary_low = 13'h1812;
              5'h15: boundary_low = 13'h1811;
              5'h16: boundary_low = 13'h180f;
              5'h17: boundary_low = 13'h180e;
              5'h18: boundary_low = 13'h180c;
              5'h19: boundary_low = 13'h180b;
              5'h1a: boundary_low = 13'h1809;
              5'h1b: boundary_low = 13'h1808;
              5'h1c: boundary_low = 13'h1806;
              5'h1d: boundary_low = 13'h1805;
              5'h1e: boundary_low = 13'h1803;
              5'h1f: boundary_low = 13'h1802;
              default: boundary_low = 13'h0000;
            endcase
          end
          default: boundary_low = 13'h0000;
        endcase
      end
      5'h13: begin
        case (mant[9:5])
          5'h00: begin
            case (mant[4:0])
              5'h00: boundary_low = 13'h0c00;
              5'h01: boundary_low = 13'h0bfa;
              5'h02: boundary_low = 13'h0bf4;
              5'h03: boundary_low = 13'h0bee;
              5'h04: boundary_low = 13'h0be8;
              5'h05: boundary_low = 13'h0be2;
              5'h06: boundary_low = 13'h0bdc;
              5'h07: boundary_low = 13'h0bd7;
              5'h08: boundary_low = 13'h0bd1;
              5'h09: boundary_low = 13'h0bcb;
              5'h0a: boundary_low = 13'h0bc5;
              5'h0b: boundary_low = 13'h0bbf;
              5'h0c: boundary_low = 13'h0bba;
              5'h0d: boundary_low = 13'h0bb4;
              5'h0e: boundary_low = 13'h0bae;
              5'h0f: boundary_low = 13'h0ba9;
              5'h10: boundary_low = 13'h0ba3;
              5'h11: boundary_low = 13'h0b9d;
              5'h12: boundary_low = 13'h0b98;
              5'h13: boundary_low = 13'h0b92;
              5'h14: boundary_low = 13'h0b8d;
              5'h15: boundary_low = 13'h0b87;
              5'h16: boundary_low = 13'h0b81;
              5'h17: boundary_low = 13'h0b7c;
              5'h18: boundary_low = 13'h0b76;
              5'h19: boundary_low = 13'h0b71;
              5'h1a: boundary_low = 13'h0b6c;
              5'h1b: boundary_low = 13'h0b66;
              5'h1c: boundary_low = 13'h0b61;
              5'h1d: boundary_low = 13'h0b5b;
              5'h1e: boundary_low = 13'h0b56;
              5'h1f: boundary_low = 13'h0b51;
              default: boundary_low = 13'h0000;
            endcase
          end
          5'h01: begin
            case (mant[4:0])
              5'h00: boundary_low = 13'h0b4b;
              5'h01: boundary_low = 13'h0b46;
              5'h02: boundary_low = 13'h0b41;
              5'h03: boundary_low = 13'h0b3c;
              5'h04: boundary_low = 13'h0b36;
              5'h05: boundary_low = 13'h0b31;
              5'h06: boundary_low = 13'h0b2c;
              5'h07: boundary_low = 13'h0b27;
              5'h08: boundary_low = 13'h0b22;
              5'h09: boundary_low = 13'h0b1c;
              5'h0a: boundary_low = 13'h0b17;
              5'h0b: boundary_low = 13'h0b12;
              5'h0c: boundary_low = 13'h0b0d;
              5'h0d: boundary_low = 13'h0b08;
              5'h0e: boundary_low = 13'h0b03;
              5'h0f: boundary_low = 13'h0afe;
              5'h10: boundary_low = 13'h0af9;
              5'h11: boundary_low = 13'h0af4;
              5'h12: boundary_low = 13'h0aef;
              5'h13: boundary_low = 13'h0aea;
              5'h14: boundary_low = 13'h0ae5;
              5'h15: boundary_low = 13'h0ae0;
              5'h16: boundary_low = 13'h0adb;
              5'h17: boundary_low = 13'h0ad7;
              5'h18: boundary_low = 13'h0ad2;
              5'h19: boundary_low = 13'h0acd;
              5'h1a: boundary_low = 13'h0ac8;
              5'h1b: boundary_low = 13'h0ac3;
              5'h1c: boundary_low = 13'h0abe;
              5'h1d: boundary_low = 13'h0aba;
              5'h1e: boundary_low = 13'h0ab5;
              5'h1f: boundary_low = 13'h0ab0;
              default: boundary_low = 13'h0000;
            endcase
          end
          5'h02: begin
            case (mant[4:0])
              5'h00: boundary_low = 13'h0aab;
              5'h01: boundary_low = 13'h0aa7;
              5'h02: boundary_low = 13'h0aa2;
              5'h03: boundary_low = 13'h0a9d;
              5'h04: boundary_low = 13'h0a99;
              5'h05: boundary_low = 13'h0a94;
              5'h06: boundary_low = 13'h0a8f;
              5'h07: boundary_low = 13'h0a8b;
              5'h08: boundary_low = 13'h0a86;
              5'h09: boundary_low = 13'h0a82;
              5'h0a: boundary_low = 13'h0a7d;
              5'h0b: boundary_low = 13'h0a79;
              5'h0c: boundary_low = 13'h0a74;
              5'h0d: boundary_low = 13'h0a70;
              5'h0e: boundary_low = 13'h0a6b;
              5'h0f: boundary_low = 13'h0a67;
              5'h10: boundary_low = 13'h0a62;
              5'h11: boundary_low = 13'h0a5e;
              5'h12: boundary_low = 13'h0a59;
              5'h13: boundary_low = 13'h0a55;
              5'h14: boundary_low = 13'h0a51;
              5'h15: boundary_low = 13'h0a4c;
              5'h16: boundary_low = 13'h0a48;
              5'h17: boundary_low = 13'h0a44;
              5'h18: boundary_low = 13'h0a3f;
              5'h19: boundary_low = 13'h0a3b;
              5'h1a: boundary_low = 13'h0a37;
              5'h1b: boundary_low = 13'h0a32;
              5'h1c: boundary_low = 13'h0a2e;
              5'h1d: boundary_low = 13'h0a2a;
              5'h1e: boundary_low = 13'h0a26;
              5'h1f: boundary_low = 13'h0a21;
              default: boundary_low = 13'h0000;
            endcase
          end
          5'h03: begin
            case (mant[4:0])
              5'h00: boundary_low = 13'h0a1d;
              5'h01: boundary_low = 13'h0a19;
              5'h02: boundary_low = 13'h0a15;
              5'h03: boundary_low = 13'h0a11;
              5'h04: boundary_low = 13'h0a0d;
              5'h05: boundary_low = 13'h0a08;
              5'h06: boundary_low = 13'h0a04;
              5'h07: boundary_low = 13'h0a00;
              5'h08: boundary_low = 13'h09fc;
              5'h09: boundary_low = 13'h09f8;
              5'h0a: boundary_low = 13'h09f4;
              5'h0b: boundary_low = 13'h09f0;
              5'h0c: boundary_low = 13'h09ec;
              5'h0d: boundary_low = 13'h09e8;
              5'h0e: boundary_low = 13'h09e4;
              5'h0f: boundary_low = 13'h09e0;
              5'h10: boundary_low = 13'h09dc;
              5'h11: boundary_low = 13'h09d8;
              5'h12: boundary_low = 13'h09d4;
              5'h13: boundary_low = 13'h09d0;
              5'h14: boundary_low = 13'h09cc;
              5'h15: boundary_low = 13'h09c8;
              5'h16: boundary_low = 13'h09c4;
              5'h17: boundary_low = 13'h09c1;
              5'h18: boundary_low = 13'h09bd;
              5'h19: boundary_low = 13'h09b9;
              5'h1a: boundary_low = 13'h09b5;
              5'h1b: boundary_low = 13'h09b1;
              5'h1c: boundary_low = 13'h09ad;
              5'h1d: boundary_low = 13'h09aa;
              5'h1e: boundary_low = 13'h09a6;
              5'h1f: boundary_low = 13'h09a2;
              default: boundary_low = 13'h0000;
            endcase
          end
          5'h04: begin
            case (mant[4:0])
              5'h00: boundary_low = 13'h099e;
              5'h01: boundary_low = 13'h099b;
              5'h02: boundary_low = 13'h0997;
              5'h03: boundary_low = 13'h0993;
              5'h04: boundary_low = 13'h098f;
              5'h05: boundary_low = 13'h098c;
              5'h06: boundary_low = 13'h0988;
              5'h07: boundary_low = 13'h0984;
              5'h08: boundary_low = 13'h0981;
              5'h09: boundary_low = 13'h097d;
              5'h0a: boundary_low = 13'h097a;
              5'h0b: boundary_low = 13'h0976;
              5'h0c: boundary_low = 13'h0972;
              5'h0d: boundary_low = 13'h096f;
              5'h0e: boundary_low = 13'h096b;
              5'h0f: boundary_low = 13'h0968;
              5'h10: boundary_low = 13'h0964;
              5'h11: boundary_low = 13'h0961;
              5'h12: boundary_low = 13'h095d;
              5'h13: boundary_low = 13'h0959;
              5'h14: boundary_low = 13'h0956;
              5'h15: boundary_low = 13'h0952;
              5'h16: boundary_low = 13'h094f;
              5'h17: boundary_low = 13'h094c;
              5'h18: boundary_low = 13'h0948;
              5'h19: boundary_low = 13'h0945;
              5'h1a: boundary_low = 13'h0941;
              5'h1b: boundary_low = 13'h093e;
              5'h1c: boundary_low = 13'h093a;
              5'h1d: boundary_low = 13'h0937;
              5'h1e: boundary_low = 13'h0934;
              5'h1f: boundary_low = 13'h0930;
              default: boundary_low = 13'h0000;
            endcase
          end
          5'h05: begin
            case (mant[4:0])
              5'h00: boundary_low = 13'h092d;
              5'h01: boundary_low = 13'h092a;
              5'h02: boundary_low = 13'h0926;
              5'h03: boundary_low = 13'h0923;
              5'h04: boundary_low = 13'h0920;
              5'h05: boundary_low = 13'h091c;
              5'h06: boundary_low = 13'h0919;
              5'h07: boundary_low = 13'h0916;
              5'h08: boundary_low = 13'h0912;
              5'h09: boundary_low = 13'h090f;
              5'h0a: boundary_low = 13'h090c;
              5'h0b: boundary_low = 13'h0909;
              5'h0c: boundary_low = 13'h0905;
              5'h0d: boundary_low = 13'h0902;
              5'h0e: boundary_low = 13'h08ff;
              5'h0f: boundary_low = 13'h08fc;
              5'h10: boundary_low = 13'h08f9;
              5'h11: boundary_low = 13'h08f5;
              5'h12: boundary_low = 13'h08f2;
              5'h13: boundary_low = 13'h08ef;
              5'h14: boundary_low = 13'h08ec;
              5'h15: boundary_low = 13'h08e9;
              5'h16: boundary_low = 13'h08e6;
              5'h17: boundary_low = 13'h08e3;
              5'h18: boundary_low = 13'h08df;
              5'h19: boundary_low = 13'h08dc;
              5'h1a: boundary_low = 13'h08d9;
              5'h1b: boundary_low = 13'h08d6;
              5'h1c: boundary_low = 13'h08d3;
              5'h1d: boundary_low = 13'h08d0;
              5'h1e: boundary_low = 13'h08cd;
              5'h1f: boundary_low = 13'h08ca;
              default: boundary_low = 13'h0000;
            endcase
          end
          5'h06: begin
            case (mant[4:0])
              5'h00: boundary_low = 13'h08c7;
              5'h01: boundary_low = 13'h08c4;
              5'h02: boundary_low = 13'h08c1;
              5'h03: boundary_low = 13'h08be;
              5'h04: boundary_low = 13'h08bb;
              5'h05: boundary_low = 13'h08b8;
              5'h06: boundary_low = 13'h08b5;
              5'h07: boundary_low = 13'h08b2;
              5'h08: boundary_low = 13'h08af;
              5'h09: boundary_low = 13'h08ac;
              5'h0a: boundary_low = 13'h08a9;
              5'h0b: boundary_low = 13'h08a6;
              5'h0c: boundary_low = 13'h08a4;
              5'h0d: boundary_low = 13'h08a1;
              5'h0e: boundary_low = 13'h089e;
              5'h0f: boundary_low = 13'h089b;
              5'h10: boundary_low = 13'h0898;
              5'h11: boundary_low = 13'h0895;
              5'h12: boundary_low = 13'h0892;
              5'h13: boundary_low = 13'h088f;
              5'h14: boundary_low = 13'h088d;
              5'h15: boundary_low = 13'h088a;
              5'h16: boundary_low = 13'h0887;
              5'h17: boundary_low = 13'h0884;
              5'h18: boundary_low = 13'h0881;
              5'h19: boundary_low = 13'h087f;
              5'h1a: boundary_low = 13'h087c;
              5'h1b: boundary_low = 13'h0879;
              5'h1c: boundary_low = 13'h0876;
              5'h1d: boundary_low = 13'h0874;
              5'h1e: boundary_low = 13'h0871;
              5'h1f: boundary_low = 13'h086e;
              default: boundary_low = 13'h0000;
            endcase
          end
          5'h07: begin
            case (mant[4:0])
              5'h00: boundary_low = 13'h086b;
              5'h01: boundary_low = 13'h0869;
              5'h02: boundary_low = 13'h0866;
              5'h03: boundary_low = 13'h0863;
              5'h04: boundary_low = 13'h0861;
              5'h05: boundary_low = 13'h085e;
              5'h06: boundary_low = 13'h085b;
              5'h07: boundary_low = 13'h0858;
              5'h08: boundary_low = 13'h0856;
              5'h09: boundary_low = 13'h0853;
              5'h0a: boundary_low = 13'h0851;
              5'h0b: boundary_low = 13'h084e;
              5'h0c: boundary_low = 13'h084b;
              5'h0d: boundary_low = 13'h0849;
              5'h0e: boundary_low = 13'h0846;
              5'h0f: boundary_low = 13'h0843;
              5'h10: boundary_low = 13'h0841;
              5'h11: boundary_low = 13'h083e;
              5'h12: boundary_low = 13'h083c;
              5'h13: boundary_low = 13'h0839;
              5'h14: boundary_low = 13'h0837;
              5'h15: boundary_low = 13'h0834;
              5'h16: boundary_low = 13'h0832;
              5'h17: boundary_low = 13'h082f;
              5'h18: boundary_low = 13'h082c;
              5'h19: boundary_low = 13'h082a;
              5'h1a: boundary_low = 13'h0827;
              5'h1b: boundary_low = 13'h0825;
              5'h1c: boundary_low = 13'h0822;
              5'h1d: boundary_low = 13'h0820;
              5'h1e: boundary_low = 13'h081e;
              5'h1f: boundary_low = 13'h081b;
              default: boundary_low = 13'h0000;
            endcase
          end
          5'h08: begin
            case (mant[4:0])
              5'h00: boundary_low = 13'h0819;
              5'h01: boundary_low = 13'h0816;
              5'h02: boundary_low = 13'h0814;
              5'h03: boundary_low = 13'h0811;
              5'h04: boundary_low = 13'h080f;
              5'h05: boundary_low = 13'h080c;
              5'h06: boundary_low = 13'h080a;
              5'h07: boundary_low = 13'h0808;
              5'h08: boundary_low = 13'h0805;
              5'h09: boundary_low = 13'h0803;
              5'h0a: boundary_low = 13'h0800;
              5'h0b: boundary_low = 13'h07fc;
              5'h0c: boundary_low = 13'h07f7;
              5'h0d: boundary_low = 13'h07f3;
              5'h0e: boundary_low = 13'h07ee;
              5'h0f: boundary_low = 13'h07e9;
              5'h10: boundary_low = 13'h07e4;
              5'h11: boundary_low = 13'h07e0;
              5'h12: boundary_low = 13'h07db;
              5'h13: boundary_low = 13'h07d6;
              5'h14: boundary_low = 13'h07d2;
              5'h15: boundary_low = 13'h07cd;
              5'h16: boundary_low = 13'h07c9;
              5'h17: boundary_low = 13'h07c4;
              5'h18: boundary_low = 13'h07bf;
              5'h19: boundary_low = 13'h07bb;
              5'h1a: boundary_low = 13'h07b6;
              5'h1b: boundary_low = 13'h07b2;
              5'h1c: boundary_low = 13'h07ad;
              5'h1d: boundary_low = 13'h07a9;
              5'h1e: boundary_low = 13'h07a4;
              5'h1f: boundary_low = 13'h07a0;
              default: boundary_low = 13'h0000;
            endcase
          end
          5'h09: begin
            case (mant[4:0])
              5'h00: boundary_low = 13'h079b;
              5'h01: boundary_low = 13'h0797;
              5'h02: boundary_low = 13'h0793;
              5'h03: boundary_low = 13'h078e;
              5'h04: boundary_low = 13'h078a;
              5'h05: boundary_low = 13'h0785;
              5'h06: boundary_low = 13'h0781;
              5'h07: boundary_low = 13'h077d;
              5'h08: boundary_low = 13'h0778;
              5'h09: boundary_low = 13'h0774;
              5'h0a: boundary_low = 13'h0770;
              5'h0b: boundary_low = 13'h076b;
              5'h0c: boundary_low = 13'h0767;
              5'h0d: boundary_low = 13'h0763;
              5'h0e: boundary_low = 13'h075e;
              5'h0f: boundary_low = 13'h075a;
              5'h10: boundary_low = 13'h0756;
              5'h11: boundary_low = 13'h0752;
              5'h12: boundary_low = 13'h074d;
              5'h13: boundary_low = 13'h0749;
              5'h14: boundary_low = 13'h0745;
              5'h15: boundary_low = 13'h0741;
              5'h16: boundary_low = 13'h073d;
              5'h17: boundary_low = 13'h0738;
              5'h18: boundary_low = 13'h0734;
              5'h19: boundary_low = 13'h0730;
              5'h1a: boundary_low = 13'h072c;
              5'h1b: boundary_low = 13'h0728;
              5'h1c: boundary_low = 13'h0724;
              5'h1d: boundary_low = 13'h0720;
              5'h1e: boundary_low = 13'h071c;
              5'h1f: boundary_low = 13'h0718;
              default: boundary_low = 13'h0000;
            endcase
          end
          5'h0a: begin
            case (mant[4:0])
              5'h00: boundary_low = 13'h0714;
              5'h01: boundary_low = 13'h0710;
              5'h02: boundary_low = 13'h070c;
              5'h03: boundary_low = 13'h0708;
              5'h04: boundary_low = 13'h0704;
              5'h05: boundary_low = 13'h0700;
              5'h06: boundary_low = 13'h06fc;
              5'h07: boundary_low = 13'h06f8;
              5'h08: boundary_low = 13'h06f4;
              5'h09: boundary_low = 13'h06f0;
              5'h0a: boundary_low = 13'h06ec;
              5'h0b: boundary_low = 13'h06e8;
              5'h0c: boundary_low = 13'h06e4;
              5'h0d: boundary_low = 13'h06e0;
              5'h0e: boundary_low = 13'h06dc;
              5'h0f: boundary_low = 13'h06d8;
              5'h10: boundary_low = 13'h06d4;
              5'h11: boundary_low = 13'h06d1;
              5'h12: boundary_low = 13'h06cd;
              5'h13: boundary_low = 13'h06c9;
              5'h14: boundary_low = 13'h06c5;
              5'h15: boundary_low = 13'h06c1;
              5'h16: boundary_low = 13'h06bd;
              5'h17: boundary_low = 13'h06ba;
              5'h18: boundary_low = 13'h06b6;
              5'h19: boundary_low = 13'h06b2;
              5'h1a: boundary_low = 13'h06ae;
              5'h1b: boundary_low = 13'h06ab;
              5'h1c: boundary_low = 13'h06a7;
              5'h1d: boundary_low = 13'h06a3;
              5'h1e: boundary_low = 13'h06a0;
              5'h1f: boundary_low = 13'h069c;
              default: boundary_low = 13'h0000;
            endcase
          end
          5'h0b: begin
            case (mant[4:0])
              5'h00: boundary_low = 13'h0698;
              5'h01: boundary_low = 13'h0694;
              5'h02: boundary_low = 13'h0691;
              5'h03: boundary_low = 13'h068d;
              5'h04: boundary_low = 13'h0689;
              5'h05: boundary_low = 13'h0686;
              5'h06: boundary_low = 13'h0682;
              5'h07: boundary_low = 13'h067f;
              5'h08: boundary_low = 13'h067b;
              5'h09: boundary_low = 13'h0677;
              5'h0a: boundary_low = 13'h0674;
              5'h0b: boundary_low = 13'h0670;
              5'h0c: boundary_low = 13'h066d;
              5'h0d: boundary_low = 13'h0669;
              5'h0e: boundary_low = 13'h0666;
              5'h0f: boundary_low = 13'h0662;
              5'h10: boundary_low = 13'h065f;
              5'h11: boundary_low = 13'h065b;
              5'h12: boundary_low = 13'h0658;
              5'h13: boundary_low = 13'h0654;
              5'h14: boundary_low = 13'h0651;
              5'h15: boundary_low = 13'h064d;
              5'h16: boundary_low = 13'h064a;
              5'h17: boundary_low = 13'h0646;
              5'h18: boundary_low = 13'h0643;
              5'h19: boundary_low = 13'h063f;
              5'h1a: boundary_low = 13'h063c;
              5'h1b: boundary_low = 13'h0639;
              5'h1c: boundary_low = 13'h0635;
              5'h1d: boundary_low = 13'h0632;
              5'h1e: boundary_low = 13'h062e;
              5'h1f: boundary_low = 13'h062b;
              default: boundary_low = 13'h0000;
            endcase
          end
          5'h0c: begin
            case (mant[4:0])
              5'h00: boundary_low = 13'h0628;
              5'h01: boundary_low = 13'h0624;
              5'h02: boundary_low = 13'h0621;
              5'h03: boundary_low = 13'h061e;
              5'h04: boundary_low = 13'h061a;
              5'h05: boundary_low = 13'h0617;
              5'h06: boundary_low = 13'h0614;
              5'h07: boundary_low = 13'h0610;
              5'h08: boundary_low = 13'h060d;
              5'h09: boundary_low = 13'h060a;
              5'h0a: boundary_low = 13'h0607;
              5'h0b: boundary_low = 13'h0603;
              5'h0c: boundary_low = 13'h0600;
              5'h0d: boundary_low = 13'h05fd;
              5'h0e: boundary_low = 13'h05fa;
              5'h0f: boundary_low = 13'h05f6;
              5'h10: boundary_low = 13'h05f3;
              5'h11: boundary_low = 13'h05f0;
              5'h12: boundary_low = 13'h05ed;
              5'h13: boundary_low = 13'h05ea;
              5'h14: boundary_low = 13'h05e6;
              5'h15: boundary_low = 13'h05e3;
              5'h16: boundary_low = 13'h05e0;
              5'h17: boundary_low = 13'h05dd;
              5'h18: boundary_low = 13'h05da;
              5'h19: boundary_low = 13'h05d7;
              5'h1a: boundary_low = 13'h05d3;
              5'h1b: boundary_low = 13'h05d0;
              5'h1c: boundary_low = 13'h05cd;
              5'h1d: boundary_low = 13'h05ca;
              5'h1e: boundary_low = 13'h05c7;
              5'h1f: boundary_low = 13'h05c4;
              default: boundary_low = 13'h0000;
            endcase
          end
          5'h0d: begin
            case (mant[4:0])
              5'h00: boundary_low = 13'h05c1;
              5'h01: boundary_low = 13'h05be;
              5'h02: boundary_low = 13'h05bb;
              5'h03: boundary_low = 13'h05b8;
              5'h04: boundary_low = 13'h05b5;
              5'h05: boundary_low = 13'h05b2;
              5'h06: boundary_low = 13'h05af;
              5'h07: boundary_low = 13'h05ac;
              5'h08: boundary_low = 13'h05a9;
              5'h09: boundary_low = 13'h05a6;
              5'h0a: boundary_low = 13'h05a3;
              5'h0b: boundary_low = 13'h05a0;
              5'h0c: boundary_low = 13'h059d;
              5'h0d: boundary_low = 13'h059a;
              5'h0e: boundary_low = 13'h0597;
              5'h0f: boundary_low = 13'h0594;
              5'h10: boundary_low = 13'h0591;
              5'h11: boundary_low = 13'h058e;
              5'h12: boundary_low = 13'h058b;
              5'h13: boundary_low = 13'h0588;
              5'h14: boundary_low = 13'h0585;
              5'h15: boundary_low = 13'h0582;
              5'h16: boundary_low = 13'h057f;
              5'h17: boundary_low = 13'h057d;
              5'h18: boundary_low = 13'h057a;
              5'h19: boundary_low = 13'h0577;
              5'h1a: boundary_low = 13'h0574;
              5'h1b: boundary_low = 13'h0571;
              5'h1c: boundary_low = 13'h056e;
              5'h1d: boundary_low = 13'h056b;
              5'h1e: boundary_low = 13'h0569;
              5'h1f: boundary_low = 13'h0566;
              default: boundary_low = 13'h0000;
            endcase
          end
          5'h0e: begin
            case (mant[4:0])
              5'h00: boundary_low = 13'h0563;
              5'h01: boundary_low = 13'h0560;
              5'h02: boundary_low = 13'h055d;
              5'h03: boundary_low = 13'h055b;
              5'h04: boundary_low = 13'h0558;
              5'h05: boundary_low = 13'h0555;
              5'h06: boundary_low = 13'h0552;
              5'h07: boundary_low = 13'h054f;
              5'h08: boundary_low = 13'h054d;
              5'h09: boundary_low = 13'h054a;
              5'h0a: boundary_low = 13'h0547;
              5'h0b: boundary_low = 13'h0544;
              5'h0c: boundary_low = 13'h0542;
              5'h0d: boundary_low = 13'h053f;
              5'h0e: boundary_low = 13'h053c;
              5'h0f: boundary_low = 13'h053a;
              5'h10: boundary_low = 13'h0537;
              5'h11: boundary_low = 13'h0534;
              5'h12: boundary_low = 13'h0532;
              5'h13: boundary_low = 13'h052f;
              5'h14: boundary_low = 13'h052c;
              5'h15: boundary_low = 13'h052a;
              5'h16: boundary_low = 13'h0527;
              5'h17: boundary_low = 13'h0524;
              5'h18: boundary_low = 13'h0522;
              5'h19: boundary_low = 13'h051f;
              5'h1a: boundary_low = 13'h051c;
              5'h1b: boundary_low = 13'h051a;
              5'h1c: boundary_low = 13'h0517;
              5'h1d: boundary_low = 13'h0515;
              5'h1e: boundary_low = 13'h0512;
              5'h1f: boundary_low = 13'h050f;
              default: boundary_low = 13'h0000;
            endcase
          end
          5'h0f: begin
            case (mant[4:0])
              5'h00: boundary_low = 13'h050d;
              5'h01: boundary_low = 13'h050a;
              5'h02: boundary_low = 13'h0508;
              5'h03: boundary_low = 13'h0505;
              5'h04: boundary_low = 13'h0502;
              5'h05: boundary_low = 13'h0500;
              5'h06: boundary_low = 13'h04fd;
              5'h07: boundary_low = 13'h04fb;
              5'h08: boundary_low = 13'h04f8;
              5'h09: boundary_low = 13'h04f6;
              5'h0a: boundary_low = 13'h04f3;
              5'h0b: boundary_low = 13'h04f1;
              5'h0c: boundary_low = 13'h04ee;
              5'h0d: boundary_low = 13'h04ec;
              5'h0e: boundary_low = 13'h04e9;
              5'h0f: boundary_low = 13'h04e7;
              5'h10: boundary_low = 13'h04e4;
              5'h11: boundary_low = 13'h04e2;
              5'h12: boundary_low = 13'h04df;
              5'h13: boundary_low = 13'h04dd;
              5'h14: boundary_low = 13'h04db;
              5'h15: boundary_low = 13'h04d8;
              5'h16: boundary_low = 13'h04d6;
              5'h17: boundary_low = 13'h04d3;
              5'h18: boundary_low = 13'h04d1;
              5'h19: boundary_low = 13'h04ce;
              5'h1a: boundary_low = 13'h04cc;
              5'h1b: boundary_low = 13'h04ca;
              5'h1c: boundary_low = 13'h04c7;
              5'h1d: boundary_low = 13'h04c5;
              5'h1e: boundary_low = 13'h04c2;
              5'h1f: boundary_low = 13'h04c0;
              default: boundary_low = 13'h0000;
            endcase
          end
          5'h10: begin
            case (mant[4:0])
              5'h00: boundary_low = 13'h04be;
              5'h01: boundary_low = 13'h04bb;
              5'h02: boundary_low = 13'h04b9;
              5'h03: boundary_low = 13'h04b7;
              5'h04: boundary_low = 13'h04b4;
              5'h05: boundary_low = 13'h04b2;
              5'h06: boundary_low = 13'h04b0;
              5'h07: boundary_low = 13'h04ad;
              5'h08: boundary_low = 13'h04ab;
              5'h09: boundary_low = 13'h04a9;
              5'h0a: boundary_low = 13'h04a6;
              5'h0b: boundary_low = 13'h04a4;
              5'h0c: boundary_low = 13'h04a2;
              5'h0d: boundary_low = 13'h049f;
              5'h0e: boundary_low = 13'h049d;
              5'h0f: boundary_low = 13'h049b;
              5'h10: boundary_low = 13'h0498;
              5'h11: boundary_low = 13'h0496;
              5'h12: boundary_low = 13'h0494;
              5'h13: boundary_low = 13'h0492;
              5'h14: boundary_low = 13'h048f;
              5'h15: boundary_low = 13'h048d;
              5'h16: boundary_low = 13'h048b;
              5'h17: boundary_low = 13'h0489;
              5'h18: boundary_low = 13'h0486;
              5'h19: boundary_low = 13'h0484;
              5'h1a: boundary_low = 13'h0482;
              5'h1b: boundary_low = 13'h0480;
              5'h1c: boundary_low = 13'h047e;
              5'h1d: boundary_low = 13'h047b;
              5'h1e: boundary_low = 13'h0479;
              5'h1f: boundary_low = 13'h0477;
              default: boundary_low = 13'h0000;
            endcase
          end
          5'h11: begin
            case (mant[4:0])
              5'h00: boundary_low = 13'h0475;
              5'h01: boundary_low = 13'h0473;
              5'h02: boundary_low = 13'h0470;
              5'h03: boundary_low = 13'h046e;
              5'h04: boundary_low = 13'h046c;
              5'h05: boundary_low = 13'h046a;
              5'h06: boundary_low = 13'h0468;
              5'h07: boundary_low = 13'h0466;
              5'h08: boundary_low = 13'h0464;
              5'h09: boundary_low = 13'h0461;
              5'h0a: boundary_low = 13'h045f;
              5'h0b: boundary_low = 13'h045d;
              5'h0c: boundary_low = 13'h045b;
              5'h0d: boundary_low = 13'h0459;
              5'h0e: boundary_low = 13'h0457;
              5'h0f: boundary_low = 13'h0455;
              5'h10: boundary_low = 13'h0453;
              5'h11: boundary_low = 13'h0451;
              5'h12: boundary_low = 13'h044e;
              5'h13: boundary_low = 13'h044c;
              5'h14: boundary_low = 13'h044a;
              5'h15: boundary_low = 13'h0448;
              5'h16: boundary_low = 13'h0446;
              5'h17: boundary_low = 13'h0444;
              5'h18: boundary_low = 13'h0442;
              5'h19: boundary_low = 13'h0440;
              5'h1a: boundary_low = 13'h043e;
              5'h1b: boundary_low = 13'h043c;
              5'h1c: boundary_low = 13'h043a;
              5'h1d: boundary_low = 13'h0438;
              5'h1e: boundary_low = 13'h0436;
              5'h1f: boundary_low = 13'h0434;
              default: boundary_low = 13'h0000;
            endcase
          end
          5'h12: begin
            case (mant[4:0])
              5'h00: boundary_low = 13'h0432;
              5'h01: boundary_low = 13'h0430;
              5'h02: boundary_low = 13'h042e;
              5'h03: boundary_low = 13'h042c;
              5'h04: boundary_low = 13'h042a;
              5'h05: boundary_low = 13'h0428;
              5'h06: boundary_low = 13'h0426;
              5'h07: boundary_low = 13'h0424;
              5'h08: boundary_low = 13'h0422;
              5'h09: boundary_low = 13'h0420;
              5'h0a: boundary_low = 13'h041e;
              5'h0b: boundary_low = 13'h041c;
              5'h0c: boundary_low = 13'h041a;
              5'h0d: boundary_low = 13'h0418;
              5'h0e: boundary_low = 13'h0416;
              5'h0f: boundary_low = 13'h0414;
              5'h10: boundary_low = 13'h0412;
              5'h11: boundary_low = 13'h0410;
              5'h12: boundary_low = 13'h040e;
              5'h13: boundary_low = 13'h040c;
              5'h14: boundary_low = 13'h040a;
              5'h15: boundary_low = 13'h0409;
              5'h16: boundary_low = 13'h0407;
              5'h17: boundary_low = 13'h0405;
              5'h18: boundary_low = 13'h0403;
              5'h19: boundary_low = 13'h0401;
              5'h1a: boundary_low = 13'h0000;
              5'h1b: boundary_low = 13'h0000;
              5'h1c: boundary_low = 13'h0000;
              5'h1d: boundary_low = 13'h0000;
              5'h1e: boundary_low = 13'h0000;
              5'h1f: boundary_low = 13'h0000;
              default: boundary_low = 13'h0000;
            endcase
          end
          5'h13: boundary_low = 13'h0000;
          5'h14: boundary_low = 13'h0000;
          5'h15: boundary_low = 13'h0000;
          5'h16: boundary_low = 13'h0000;
          5'h17: boundary_low = 13'h0000;
          5'h18: boundary_low = 13'h0000;
          5'h19: boundary_low = 13'h0000;
          5'h1a: boundary_low = 13'h0000;
          5'h1b: boundary_low = 13'h0000;
          5'h1c: boundary_low = 13'h0000;
          5'h1d: boundary_low = 13'h0000;
          5'h1e: boundary_low = 13'h0000;
          5'h1f: boundary_low = 13'h0000;
          default: boundary_low = 13'h0000;
        endcase
      end
      default: boundary_low = 13'h0000;
    endcase
  end
  reg boundary_b14;
  always @* begin
    case (exp)
      5'h09: begin
        boundary_b14 = 1;
      end
      5'h13: begin
        boundary_b14 = 0;
      end
      default: boundary_b14 = 1'b0;
    endcase
  end
  reg boundary_b13;
  always @* begin
    case (exp)
      5'h09: begin
        boundary_b13 = 1;
      end
      5'h13: begin
        boundary_b13 = 0;
      end
      default: boundary_b13 = 1'b0;
    endcase
  end
  wire [14:0] boundary_mag = {boundary_b14, boundary_b13, boundary_low};
  wire [14:0] active_mag = core_active ? core_mag : boundary_mag;
  wire [15:0] active_out = {sign, active_mag};
  assign out = (core_active || boundary_active) ? active_out : special_out;
endmodule
