module ex238_core_boundary_low14_hi6(in, out);
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
    case (mant[9:4])
      6'h00: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h000;
          4'h1: mant_low = 10'h3fa;
          4'h2: mant_low = 10'h3f4;
          4'h3: mant_low = 10'h3ee;
          4'h4: mant_low = 10'h3e8;
          4'h5: mant_low = 10'h3e2;
          4'h6: mant_low = 10'h3dc;
          4'h7: mant_low = 10'h3d7;
          4'h8: mant_low = 10'h3d1;
          4'h9: mant_low = 10'h3cb;
          4'ha: mant_low = 10'h3c5;
          4'hb: mant_low = 10'h3bf;
          4'hc: mant_low = 10'h3ba;
          4'hd: mant_low = 10'h3b4;
          4'he: mant_low = 10'h3ae;
          4'hf: mant_low = 10'h3a9;
          default: mant_low = 10'h000;
        endcase
      end
      6'h01: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h3a3;
          4'h1: mant_low = 10'h39d;
          4'h2: mant_low = 10'h398;
          4'h3: mant_low = 10'h392;
          4'h4: mant_low = 10'h38d;
          4'h5: mant_low = 10'h387;
          4'h6: mant_low = 10'h381;
          4'h7: mant_low = 10'h37c;
          4'h8: mant_low = 10'h376;
          4'h9: mant_low = 10'h371;
          4'ha: mant_low = 10'h36c;
          4'hb: mant_low = 10'h366;
          4'hc: mant_low = 10'h361;
          4'hd: mant_low = 10'h35b;
          4'he: mant_low = 10'h356;
          4'hf: mant_low = 10'h351;
          default: mant_low = 10'h000;
        endcase
      end
      6'h02: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h34b;
          4'h1: mant_low = 10'h346;
          4'h2: mant_low = 10'h341;
          4'h3: mant_low = 10'h33c;
          4'h4: mant_low = 10'h336;
          4'h5: mant_low = 10'h331;
          4'h6: mant_low = 10'h32c;
          4'h7: mant_low = 10'h327;
          4'h8: mant_low = 10'h322;
          4'h9: mant_low = 10'h31c;
          4'ha: mant_low = 10'h317;
          4'hb: mant_low = 10'h312;
          4'hc: mant_low = 10'h30d;
          4'hd: mant_low = 10'h308;
          4'he: mant_low = 10'h303;
          4'hf: mant_low = 10'h2fe;
          default: mant_low = 10'h000;
        endcase
      end
      6'h03: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h2f9;
          4'h1: mant_low = 10'h2f4;
          4'h2: mant_low = 10'h2ef;
          4'h3: mant_low = 10'h2ea;
          4'h4: mant_low = 10'h2e5;
          4'h5: mant_low = 10'h2e0;
          4'h6: mant_low = 10'h2db;
          4'h7: mant_low = 10'h2d7;
          4'h8: mant_low = 10'h2d2;
          4'h9: mant_low = 10'h2cd;
          4'ha: mant_low = 10'h2c8;
          4'hb: mant_low = 10'h2c3;
          4'hc: mant_low = 10'h2be;
          4'hd: mant_low = 10'h2ba;
          4'he: mant_low = 10'h2b5;
          4'hf: mant_low = 10'h2b0;
          default: mant_low = 10'h000;
        endcase
      end
      6'h04: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h2ab;
          4'h1: mant_low = 10'h2a7;
          4'h2: mant_low = 10'h2a2;
          4'h3: mant_low = 10'h29d;
          4'h4: mant_low = 10'h299;
          4'h5: mant_low = 10'h294;
          4'h6: mant_low = 10'h28f;
          4'h7: mant_low = 10'h28b;
          4'h8: mant_low = 10'h286;
          4'h9: mant_low = 10'h282;
          4'ha: mant_low = 10'h27d;
          4'hb: mant_low = 10'h279;
          4'hc: mant_low = 10'h274;
          4'hd: mant_low = 10'h270;
          4'he: mant_low = 10'h26b;
          4'hf: mant_low = 10'h267;
          default: mant_low = 10'h000;
        endcase
      end
      6'h05: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h262;
          4'h1: mant_low = 10'h25e;
          4'h2: mant_low = 10'h259;
          4'h3: mant_low = 10'h255;
          4'h4: mant_low = 10'h251;
          4'h5: mant_low = 10'h24c;
          4'h6: mant_low = 10'h248;
          4'h7: mant_low = 10'h244;
          4'h8: mant_low = 10'h23f;
          4'h9: mant_low = 10'h23b;
          4'ha: mant_low = 10'h237;
          4'hb: mant_low = 10'h232;
          4'hc: mant_low = 10'h22e;
          4'hd: mant_low = 10'h22a;
          4'he: mant_low = 10'h226;
          4'hf: mant_low = 10'h221;
          default: mant_low = 10'h000;
        endcase
      end
      6'h06: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h21d;
          4'h1: mant_low = 10'h219;
          4'h2: mant_low = 10'h215;
          4'h3: mant_low = 10'h211;
          4'h4: mant_low = 10'h20d;
          4'h5: mant_low = 10'h208;
          4'h6: mant_low = 10'h204;
          4'h7: mant_low = 10'h200;
          4'h8: mant_low = 10'h1fc;
          4'h9: mant_low = 10'h1f8;
          4'ha: mant_low = 10'h1f4;
          4'hb: mant_low = 10'h1f0;
          4'hc: mant_low = 10'h1ec;
          4'hd: mant_low = 10'h1e8;
          4'he: mant_low = 10'h1e4;
          4'hf: mant_low = 10'h1e0;
          default: mant_low = 10'h000;
        endcase
      end
      6'h07: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h1dc;
          4'h1: mant_low = 10'h1d8;
          4'h2: mant_low = 10'h1d4;
          4'h3: mant_low = 10'h1d0;
          4'h4: mant_low = 10'h1cc;
          4'h5: mant_low = 10'h1c8;
          4'h6: mant_low = 10'h1c4;
          4'h7: mant_low = 10'h1c1;
          4'h8: mant_low = 10'h1bd;
          4'h9: mant_low = 10'h1b9;
          4'ha: mant_low = 10'h1b5;
          4'hb: mant_low = 10'h1b1;
          4'hc: mant_low = 10'h1ad;
          4'hd: mant_low = 10'h1aa;
          4'he: mant_low = 10'h1a6;
          4'hf: mant_low = 10'h1a2;
          default: mant_low = 10'h000;
        endcase
      end
      6'h08: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h19e;
          4'h1: mant_low = 10'h19b;
          4'h2: mant_low = 10'h197;
          4'h3: mant_low = 10'h193;
          4'h4: mant_low = 10'h18f;
          4'h5: mant_low = 10'h18c;
          4'h6: mant_low = 10'h188;
          4'h7: mant_low = 10'h184;
          4'h8: mant_low = 10'h181;
          4'h9: mant_low = 10'h17d;
          4'ha: mant_low = 10'h17a;
          4'hb: mant_low = 10'h176;
          4'hc: mant_low = 10'h172;
          4'hd: mant_low = 10'h16f;
          4'he: mant_low = 10'h16b;
          4'hf: mant_low = 10'h168;
          default: mant_low = 10'h000;
        endcase
      end
      6'h09: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h164;
          4'h1: mant_low = 10'h161;
          4'h2: mant_low = 10'h15d;
          4'h3: mant_low = 10'h159;
          4'h4: mant_low = 10'h156;
          4'h5: mant_low = 10'h152;
          4'h6: mant_low = 10'h14f;
          4'h7: mant_low = 10'h14c;
          4'h8: mant_low = 10'h148;
          4'h9: mant_low = 10'h145;
          4'ha: mant_low = 10'h141;
          4'hb: mant_low = 10'h13e;
          4'hc: mant_low = 10'h13a;
          4'hd: mant_low = 10'h137;
          4'he: mant_low = 10'h134;
          4'hf: mant_low = 10'h130;
          default: mant_low = 10'h000;
        endcase
      end
      6'h0a: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h12d;
          4'h1: mant_low = 10'h12a;
          4'h2: mant_low = 10'h126;
          4'h3: mant_low = 10'h123;
          4'h4: mant_low = 10'h120;
          4'h5: mant_low = 10'h11c;
          4'h6: mant_low = 10'h119;
          4'h7: mant_low = 10'h116;
          4'h8: mant_low = 10'h112;
          4'h9: mant_low = 10'h10f;
          4'ha: mant_low = 10'h10c;
          4'hb: mant_low = 10'h109;
          4'hc: mant_low = 10'h105;
          4'hd: mant_low = 10'h102;
          4'he: mant_low = 10'h0ff;
          4'hf: mant_low = 10'h0fc;
          default: mant_low = 10'h000;
        endcase
      end
      6'h0b: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h0f9;
          4'h1: mant_low = 10'h0f5;
          4'h2: mant_low = 10'h0f2;
          4'h3: mant_low = 10'h0ef;
          4'h4: mant_low = 10'h0ec;
          4'h5: mant_low = 10'h0e9;
          4'h6: mant_low = 10'h0e6;
          4'h7: mant_low = 10'h0e3;
          4'h8: mant_low = 10'h0df;
          4'h9: mant_low = 10'h0dc;
          4'ha: mant_low = 10'h0d9;
          4'hb: mant_low = 10'h0d6;
          4'hc: mant_low = 10'h0d3;
          4'hd: mant_low = 10'h0d0;
          4'he: mant_low = 10'h0cd;
          4'hf: mant_low = 10'h0ca;
          default: mant_low = 10'h000;
        endcase
      end
      6'h0c: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h0c7;
          4'h1: mant_low = 10'h0c4;
          4'h2: mant_low = 10'h0c1;
          4'h3: mant_low = 10'h0be;
          4'h4: mant_low = 10'h0bb;
          4'h5: mant_low = 10'h0b8;
          4'h6: mant_low = 10'h0b5;
          4'h7: mant_low = 10'h0b2;
          4'h8: mant_low = 10'h0af;
          4'h9: mant_low = 10'h0ac;
          4'ha: mant_low = 10'h0a9;
          4'hb: mant_low = 10'h0a6;
          4'hc: mant_low = 10'h0a4;
          4'hd: mant_low = 10'h0a1;
          4'he: mant_low = 10'h09e;
          4'hf: mant_low = 10'h09b;
          default: mant_low = 10'h000;
        endcase
      end
      6'h0d: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h098;
          4'h1: mant_low = 10'h095;
          4'h2: mant_low = 10'h092;
          4'h3: mant_low = 10'h08f;
          4'h4: mant_low = 10'h08d;
          4'h5: mant_low = 10'h08a;
          4'h6: mant_low = 10'h087;
          4'h7: mant_low = 10'h084;
          4'h8: mant_low = 10'h081;
          4'h9: mant_low = 10'h07f;
          4'ha: mant_low = 10'h07c;
          4'hb: mant_low = 10'h079;
          4'hc: mant_low = 10'h076;
          4'hd: mant_low = 10'h074;
          4'he: mant_low = 10'h071;
          4'hf: mant_low = 10'h06e;
          default: mant_low = 10'h000;
        endcase
      end
      6'h0e: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h06b;
          4'h1: mant_low = 10'h069;
          4'h2: mant_low = 10'h066;
          4'h3: mant_low = 10'h063;
          4'h4: mant_low = 10'h061;
          4'h5: mant_low = 10'h05e;
          4'h6: mant_low = 10'h05b;
          4'h7: mant_low = 10'h058;
          4'h8: mant_low = 10'h056;
          4'h9: mant_low = 10'h053;
          4'ha: mant_low = 10'h051;
          4'hb: mant_low = 10'h04e;
          4'hc: mant_low = 10'h04b;
          4'hd: mant_low = 10'h049;
          4'he: mant_low = 10'h046;
          4'hf: mant_low = 10'h043;
          default: mant_low = 10'h000;
        endcase
      end
      6'h0f: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h041;
          4'h1: mant_low = 10'h03e;
          4'h2: mant_low = 10'h03c;
          4'h3: mant_low = 10'h039;
          4'h4: mant_low = 10'h037;
          4'h5: mant_low = 10'h034;
          4'h6: mant_low = 10'h032;
          4'h7: mant_low = 10'h02f;
          4'h8: mant_low = 10'h02c;
          4'h9: mant_low = 10'h02a;
          4'ha: mant_low = 10'h027;
          4'hb: mant_low = 10'h025;
          4'hc: mant_low = 10'h022;
          4'hd: mant_low = 10'h020;
          4'he: mant_low = 10'h01e;
          4'hf: mant_low = 10'h01b;
          default: mant_low = 10'h000;
        endcase
      end
      6'h10: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h019;
          4'h1: mant_low = 10'h016;
          4'h2: mant_low = 10'h014;
          4'h3: mant_low = 10'h011;
          4'h4: mant_low = 10'h00f;
          4'h5: mant_low = 10'h00c;
          4'h6: mant_low = 10'h00a;
          4'h7: mant_low = 10'h008;
          4'h8: mant_low = 10'h005;
          4'h9: mant_low = 10'h003;
          4'ha: mant_low = 10'h000;
          4'hb: mant_low = 10'h3fc;
          4'hc: mant_low = 10'h3f7;
          4'hd: mant_low = 10'h3f3;
          4'he: mant_low = 10'h3ee;
          4'hf: mant_low = 10'h3e9;
          default: mant_low = 10'h000;
        endcase
      end
      6'h11: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h3e4;
          4'h1: mant_low = 10'h3e0;
          4'h2: mant_low = 10'h3db;
          4'h3: mant_low = 10'h3d6;
          4'h4: mant_low = 10'h3d2;
          4'h5: mant_low = 10'h3cd;
          4'h6: mant_low = 10'h3c9;
          4'h7: mant_low = 10'h3c4;
          4'h8: mant_low = 10'h3bf;
          4'h9: mant_low = 10'h3bb;
          4'ha: mant_low = 10'h3b6;
          4'hb: mant_low = 10'h3b2;
          4'hc: mant_low = 10'h3ad;
          4'hd: mant_low = 10'h3a9;
          4'he: mant_low = 10'h3a4;
          4'hf: mant_low = 10'h3a0;
          default: mant_low = 10'h000;
        endcase
      end
      6'h12: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h39b;
          4'h1: mant_low = 10'h397;
          4'h2: mant_low = 10'h393;
          4'h3: mant_low = 10'h38e;
          4'h4: mant_low = 10'h38a;
          4'h5: mant_low = 10'h385;
          4'h6: mant_low = 10'h381;
          4'h7: mant_low = 10'h37d;
          4'h8: mant_low = 10'h378;
          4'h9: mant_low = 10'h374;
          4'ha: mant_low = 10'h370;
          4'hb: mant_low = 10'h36b;
          4'hc: mant_low = 10'h367;
          4'hd: mant_low = 10'h363;
          4'he: mant_low = 10'h35e;
          4'hf: mant_low = 10'h35a;
          default: mant_low = 10'h000;
        endcase
      end
      6'h13: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h356;
          4'h1: mant_low = 10'h352;
          4'h2: mant_low = 10'h34d;
          4'h3: mant_low = 10'h349;
          4'h4: mant_low = 10'h345;
          4'h5: mant_low = 10'h341;
          4'h6: mant_low = 10'h33d;
          4'h7: mant_low = 10'h338;
          4'h8: mant_low = 10'h334;
          4'h9: mant_low = 10'h330;
          4'ha: mant_low = 10'h32c;
          4'hb: mant_low = 10'h328;
          4'hc: mant_low = 10'h324;
          4'hd: mant_low = 10'h320;
          4'he: mant_low = 10'h31c;
          4'hf: mant_low = 10'h318;
          default: mant_low = 10'h000;
        endcase
      end
      6'h14: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h314;
          4'h1: mant_low = 10'h310;
          4'h2: mant_low = 10'h30c;
          4'h3: mant_low = 10'h308;
          4'h4: mant_low = 10'h304;
          4'h5: mant_low = 10'h300;
          4'h6: mant_low = 10'h2fc;
          4'h7: mant_low = 10'h2f8;
          4'h8: mant_low = 10'h2f4;
          4'h9: mant_low = 10'h2f0;
          4'ha: mant_low = 10'h2ec;
          4'hb: mant_low = 10'h2e8;
          4'hc: mant_low = 10'h2e4;
          4'hd: mant_low = 10'h2e0;
          4'he: mant_low = 10'h2dc;
          4'hf: mant_low = 10'h2d8;
          default: mant_low = 10'h000;
        endcase
      end
      6'h15: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h2d4;
          4'h1: mant_low = 10'h2d1;
          4'h2: mant_low = 10'h2cd;
          4'h3: mant_low = 10'h2c9;
          4'h4: mant_low = 10'h2c5;
          4'h5: mant_low = 10'h2c1;
          4'h6: mant_low = 10'h2bd;
          4'h7: mant_low = 10'h2ba;
          4'h8: mant_low = 10'h2b6;
          4'h9: mant_low = 10'h2b2;
          4'ha: mant_low = 10'h2ae;
          4'hb: mant_low = 10'h2ab;
          4'hc: mant_low = 10'h2a7;
          4'hd: mant_low = 10'h2a3;
          4'he: mant_low = 10'h2a0;
          4'hf: mant_low = 10'h29c;
          default: mant_low = 10'h000;
        endcase
      end
      6'h16: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h298;
          4'h1: mant_low = 10'h294;
          4'h2: mant_low = 10'h291;
          4'h3: mant_low = 10'h28d;
          4'h4: mant_low = 10'h289;
          4'h5: mant_low = 10'h286;
          4'h6: mant_low = 10'h282;
          4'h7: mant_low = 10'h27f;
          4'h8: mant_low = 10'h27b;
          4'h9: mant_low = 10'h277;
          4'ha: mant_low = 10'h274;
          4'hb: mant_low = 10'h270;
          4'hc: mant_low = 10'h26d;
          4'hd: mant_low = 10'h269;
          4'he: mant_low = 10'h266;
          4'hf: mant_low = 10'h262;
          default: mant_low = 10'h000;
        endcase
      end
      6'h17: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h25f;
          4'h1: mant_low = 10'h25b;
          4'h2: mant_low = 10'h258;
          4'h3: mant_low = 10'h254;
          4'h4: mant_low = 10'h251;
          4'h5: mant_low = 10'h24d;
          4'h6: mant_low = 10'h24a;
          4'h7: mant_low = 10'h246;
          4'h8: mant_low = 10'h243;
          4'h9: mant_low = 10'h23f;
          4'ha: mant_low = 10'h23c;
          4'hb: mant_low = 10'h239;
          4'hc: mant_low = 10'h235;
          4'hd: mant_low = 10'h232;
          4'he: mant_low = 10'h22e;
          4'hf: mant_low = 10'h22b;
          default: mant_low = 10'h000;
        endcase
      end
      6'h18: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h228;
          4'h1: mant_low = 10'h224;
          4'h2: mant_low = 10'h221;
          4'h3: mant_low = 10'h21e;
          4'h4: mant_low = 10'h21a;
          4'h5: mant_low = 10'h217;
          4'h6: mant_low = 10'h214;
          4'h7: mant_low = 10'h210;
          4'h8: mant_low = 10'h20d;
          4'h9: mant_low = 10'h20a;
          4'ha: mant_low = 10'h207;
          4'hb: mant_low = 10'h203;
          4'hc: mant_low = 10'h200;
          4'hd: mant_low = 10'h1fd;
          4'he: mant_low = 10'h1fa;
          4'hf: mant_low = 10'h1f6;
          default: mant_low = 10'h000;
        endcase
      end
      6'h19: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h1f3;
          4'h1: mant_low = 10'h1f0;
          4'h2: mant_low = 10'h1ed;
          4'h3: mant_low = 10'h1ea;
          4'h4: mant_low = 10'h1e6;
          4'h5: mant_low = 10'h1e3;
          4'h6: mant_low = 10'h1e0;
          4'h7: mant_low = 10'h1dd;
          4'h8: mant_low = 10'h1da;
          4'h9: mant_low = 10'h1d7;
          4'ha: mant_low = 10'h1d3;
          4'hb: mant_low = 10'h1d0;
          4'hc: mant_low = 10'h1cd;
          4'hd: mant_low = 10'h1ca;
          4'he: mant_low = 10'h1c7;
          4'hf: mant_low = 10'h1c4;
          default: mant_low = 10'h000;
        endcase
      end
      6'h1a: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h1c1;
          4'h1: mant_low = 10'h1be;
          4'h2: mant_low = 10'h1bb;
          4'h3: mant_low = 10'h1b8;
          4'h4: mant_low = 10'h1b5;
          4'h5: mant_low = 10'h1b2;
          4'h6: mant_low = 10'h1af;
          4'h7: mant_low = 10'h1ac;
          4'h8: mant_low = 10'h1a9;
          4'h9: mant_low = 10'h1a6;
          4'ha: mant_low = 10'h1a3;
          4'hb: mant_low = 10'h1a0;
          4'hc: mant_low = 10'h19d;
          4'hd: mant_low = 10'h19a;
          4'he: mant_low = 10'h197;
          4'hf: mant_low = 10'h194;
          default: mant_low = 10'h000;
        endcase
      end
      6'h1b: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h191;
          4'h1: mant_low = 10'h18e;
          4'h2: mant_low = 10'h18b;
          4'h3: mant_low = 10'h188;
          4'h4: mant_low = 10'h185;
          4'h5: mant_low = 10'h182;
          4'h6: mant_low = 10'h17f;
          4'h7: mant_low = 10'h17d;
          4'h8: mant_low = 10'h17a;
          4'h9: mant_low = 10'h177;
          4'ha: mant_low = 10'h174;
          4'hb: mant_low = 10'h171;
          4'hc: mant_low = 10'h16e;
          4'hd: mant_low = 10'h16b;
          4'he: mant_low = 10'h169;
          4'hf: mant_low = 10'h166;
          default: mant_low = 10'h000;
        endcase
      end
      6'h1c: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h163;
          4'h1: mant_low = 10'h160;
          4'h2: mant_low = 10'h15d;
          4'h3: mant_low = 10'h15b;
          4'h4: mant_low = 10'h158;
          4'h5: mant_low = 10'h155;
          4'h6: mant_low = 10'h152;
          4'h7: mant_low = 10'h14f;
          4'h8: mant_low = 10'h14d;
          4'h9: mant_low = 10'h14a;
          4'ha: mant_low = 10'h147;
          4'hb: mant_low = 10'h144;
          4'hc: mant_low = 10'h142;
          4'hd: mant_low = 10'h13f;
          4'he: mant_low = 10'h13c;
          4'hf: mant_low = 10'h13a;
          default: mant_low = 10'h000;
        endcase
      end
      6'h1d: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h137;
          4'h1: mant_low = 10'h134;
          4'h2: mant_low = 10'h132;
          4'h3: mant_low = 10'h12f;
          4'h4: mant_low = 10'h12c;
          4'h5: mant_low = 10'h12a;
          4'h6: mant_low = 10'h127;
          4'h7: mant_low = 10'h124;
          4'h8: mant_low = 10'h122;
          4'h9: mant_low = 10'h11f;
          4'ha: mant_low = 10'h11c;
          4'hb: mant_low = 10'h11a;
          4'hc: mant_low = 10'h117;
          4'hd: mant_low = 10'h115;
          4'he: mant_low = 10'h112;
          4'hf: mant_low = 10'h10f;
          default: mant_low = 10'h000;
        endcase
      end
      6'h1e: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h10d;
          4'h1: mant_low = 10'h10a;
          4'h2: mant_low = 10'h108;
          4'h3: mant_low = 10'h105;
          4'h4: mant_low = 10'h102;
          4'h5: mant_low = 10'h100;
          4'h6: mant_low = 10'h0fd;
          4'h7: mant_low = 10'h0fb;
          4'h8: mant_low = 10'h0f8;
          4'h9: mant_low = 10'h0f6;
          4'ha: mant_low = 10'h0f3;
          4'hb: mant_low = 10'h0f1;
          4'hc: mant_low = 10'h0ee;
          4'hd: mant_low = 10'h0ec;
          4'he: mant_low = 10'h0e9;
          4'hf: mant_low = 10'h0e7;
          default: mant_low = 10'h000;
        endcase
      end
      6'h1f: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h0e4;
          4'h1: mant_low = 10'h0e2;
          4'h2: mant_low = 10'h0df;
          4'h3: mant_low = 10'h0dd;
          4'h4: mant_low = 10'h0db;
          4'h5: mant_low = 10'h0d8;
          4'h6: mant_low = 10'h0d6;
          4'h7: mant_low = 10'h0d3;
          4'h8: mant_low = 10'h0d1;
          4'h9: mant_low = 10'h0ce;
          4'ha: mant_low = 10'h0cc;
          4'hb: mant_low = 10'h0ca;
          4'hc: mant_low = 10'h0c7;
          4'hd: mant_low = 10'h0c5;
          4'he: mant_low = 10'h0c2;
          4'hf: mant_low = 10'h0c0;
          default: mant_low = 10'h000;
        endcase
      end
      6'h20: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h0be;
          4'h1: mant_low = 10'h0bb;
          4'h2: mant_low = 10'h0b9;
          4'h3: mant_low = 10'h0b7;
          4'h4: mant_low = 10'h0b4;
          4'h5: mant_low = 10'h0b2;
          4'h6: mant_low = 10'h0b0;
          4'h7: mant_low = 10'h0ad;
          4'h8: mant_low = 10'h0ab;
          4'h9: mant_low = 10'h0a9;
          4'ha: mant_low = 10'h0a6;
          4'hb: mant_low = 10'h0a4;
          4'hc: mant_low = 10'h0a2;
          4'hd: mant_low = 10'h09f;
          4'he: mant_low = 10'h09d;
          4'hf: mant_low = 10'h09b;
          default: mant_low = 10'h000;
        endcase
      end
      6'h21: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h098;
          4'h1: mant_low = 10'h096;
          4'h2: mant_low = 10'h094;
          4'h3: mant_low = 10'h092;
          4'h4: mant_low = 10'h08f;
          4'h5: mant_low = 10'h08d;
          4'h6: mant_low = 10'h08b;
          4'h7: mant_low = 10'h089;
          4'h8: mant_low = 10'h086;
          4'h9: mant_low = 10'h084;
          4'ha: mant_low = 10'h082;
          4'hb: mant_low = 10'h080;
          4'hc: mant_low = 10'h07e;
          4'hd: mant_low = 10'h07b;
          4'he: mant_low = 10'h079;
          4'hf: mant_low = 10'h077;
          default: mant_low = 10'h000;
        endcase
      end
      6'h22: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h075;
          4'h1: mant_low = 10'h073;
          4'h2: mant_low = 10'h070;
          4'h3: mant_low = 10'h06e;
          4'h4: mant_low = 10'h06c;
          4'h5: mant_low = 10'h06a;
          4'h6: mant_low = 10'h068;
          4'h7: mant_low = 10'h066;
          4'h8: mant_low = 10'h064;
          4'h9: mant_low = 10'h061;
          4'ha: mant_low = 10'h05f;
          4'hb: mant_low = 10'h05d;
          4'hc: mant_low = 10'h05b;
          4'hd: mant_low = 10'h059;
          4'he: mant_low = 10'h057;
          4'hf: mant_low = 10'h055;
          default: mant_low = 10'h000;
        endcase
      end
      6'h23: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h053;
          4'h1: mant_low = 10'h051;
          4'h2: mant_low = 10'h04e;
          4'h3: mant_low = 10'h04c;
          4'h4: mant_low = 10'h04a;
          4'h5: mant_low = 10'h048;
          4'h6: mant_low = 10'h046;
          4'h7: mant_low = 10'h044;
          4'h8: mant_low = 10'h042;
          4'h9: mant_low = 10'h040;
          4'ha: mant_low = 10'h03e;
          4'hb: mant_low = 10'h03c;
          4'hc: mant_low = 10'h03a;
          4'hd: mant_low = 10'h038;
          4'he: mant_low = 10'h036;
          4'hf: mant_low = 10'h034;
          default: mant_low = 10'h000;
        endcase
      end
      6'h24: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h032;
          4'h1: mant_low = 10'h030;
          4'h2: mant_low = 10'h02e;
          4'h3: mant_low = 10'h02c;
          4'h4: mant_low = 10'h02a;
          4'h5: mant_low = 10'h028;
          4'h6: mant_low = 10'h026;
          4'h7: mant_low = 10'h024;
          4'h8: mant_low = 10'h022;
          4'h9: mant_low = 10'h020;
          4'ha: mant_low = 10'h01e;
          4'hb: mant_low = 10'h01c;
          4'hc: mant_low = 10'h01a;
          4'hd: mant_low = 10'h018;
          4'he: mant_low = 10'h016;
          4'hf: mant_low = 10'h014;
          default: mant_low = 10'h000;
        endcase
      end
      6'h25: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h012;
          4'h1: mant_low = 10'h010;
          4'h2: mant_low = 10'h00e;
          4'h3: mant_low = 10'h00c;
          4'h4: mant_low = 10'h00a;
          4'h5: mant_low = 10'h009;
          4'h6: mant_low = 10'h007;
          4'h7: mant_low = 10'h005;
          4'h8: mant_low = 10'h003;
          4'h9: mant_low = 10'h001;
          4'ha: mant_low = 10'h3fe;
          4'hb: mant_low = 10'h3fa;
          4'hc: mant_low = 10'h3f7;
          4'hd: mant_low = 10'h3f3;
          4'he: mant_low = 10'h3ef;
          4'hf: mant_low = 10'h3eb;
          default: mant_low = 10'h000;
        endcase
      end
      6'h26: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h3e8;
          4'h1: mant_low = 10'h3e4;
          4'h2: mant_low = 10'h3e0;
          4'h3: mant_low = 10'h3dd;
          4'h4: mant_low = 10'h3d9;
          4'h5: mant_low = 10'h3d5;
          4'h6: mant_low = 10'h3d1;
          4'h7: mant_low = 10'h3ce;
          4'h8: mant_low = 10'h3ca;
          4'h9: mant_low = 10'h3c7;
          4'ha: mant_low = 10'h3c3;
          4'hb: mant_low = 10'h3bf;
          4'hc: mant_low = 10'h3bc;
          4'hd: mant_low = 10'h3b8;
          4'he: mant_low = 10'h3b4;
          4'hf: mant_low = 10'h3b1;
          default: mant_low = 10'h000;
        endcase
      end
      6'h27: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h3ad;
          4'h1: mant_low = 10'h3aa;
          4'h2: mant_low = 10'h3a6;
          4'h3: mant_low = 10'h3a3;
          4'h4: mant_low = 10'h39f;
          4'h5: mant_low = 10'h39b;
          4'h6: mant_low = 10'h398;
          4'h7: mant_low = 10'h394;
          4'h8: mant_low = 10'h391;
          4'h9: mant_low = 10'h38d;
          4'ha: mant_low = 10'h38a;
          4'hb: mant_low = 10'h386;
          4'hc: mant_low = 10'h383;
          4'hd: mant_low = 10'h37f;
          4'he: mant_low = 10'h37c;
          4'hf: mant_low = 10'h379;
          default: mant_low = 10'h000;
        endcase
      end
      6'h28: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h375;
          4'h1: mant_low = 10'h372;
          4'h2: mant_low = 10'h36e;
          4'h3: mant_low = 10'h36b;
          4'h4: mant_low = 10'h367;
          4'h5: mant_low = 10'h364;
          4'h6: mant_low = 10'h361;
          4'h7: mant_low = 10'h35d;
          4'h8: mant_low = 10'h35a;
          4'h9: mant_low = 10'h356;
          4'ha: mant_low = 10'h353;
          4'hb: mant_low = 10'h350;
          4'hc: mant_low = 10'h34c;
          4'hd: mant_low = 10'h349;
          4'he: mant_low = 10'h346;
          4'hf: mant_low = 10'h342;
          default: mant_low = 10'h000;
        endcase
      end
      6'h29: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h33f;
          4'h1: mant_low = 10'h33c;
          4'h2: mant_low = 10'h338;
          4'h3: mant_low = 10'h335;
          4'h4: mant_low = 10'h332;
          4'h5: mant_low = 10'h32f;
          4'h6: mant_low = 10'h32b;
          4'h7: mant_low = 10'h328;
          4'h8: mant_low = 10'h325;
          4'h9: mant_low = 10'h322;
          4'ha: mant_low = 10'h31e;
          4'hb: mant_low = 10'h31b;
          4'hc: mant_low = 10'h318;
          4'hd: mant_low = 10'h315;
          4'he: mant_low = 10'h311;
          4'hf: mant_low = 10'h30e;
          default: mant_low = 10'h000;
        endcase
      end
      6'h2a: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h30b;
          4'h1: mant_low = 10'h308;
          4'h2: mant_low = 10'h305;
          4'h3: mant_low = 10'h302;
          4'h4: mant_low = 10'h2fe;
          4'h5: mant_low = 10'h2fb;
          4'h6: mant_low = 10'h2f8;
          4'h7: mant_low = 10'h2f5;
          4'h8: mant_low = 10'h2f2;
          4'h9: mant_low = 10'h2ef;
          4'ha: mant_low = 10'h2ec;
          4'hb: mant_low = 10'h2e8;
          4'hc: mant_low = 10'h2e5;
          4'hd: mant_low = 10'h2e2;
          4'he: mant_low = 10'h2df;
          4'hf: mant_low = 10'h2dc;
          default: mant_low = 10'h000;
        endcase
      end
      6'h2b: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h2d9;
          4'h1: mant_low = 10'h2d6;
          4'h2: mant_low = 10'h2d3;
          4'h3: mant_low = 10'h2d0;
          4'h4: mant_low = 10'h2cd;
          4'h5: mant_low = 10'h2ca;
          4'h6: mant_low = 10'h2c7;
          4'h7: mant_low = 10'h2c4;
          4'h8: mant_low = 10'h2c1;
          4'h9: mant_low = 10'h2be;
          4'ha: mant_low = 10'h2bb;
          4'hb: mant_low = 10'h2b8;
          4'hc: mant_low = 10'h2b5;
          4'hd: mant_low = 10'h2b2;
          4'he: mant_low = 10'h2af;
          4'hf: mant_low = 10'h2ac;
          default: mant_low = 10'h000;
        endcase
      end
      6'h2c: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h2a9;
          4'h1: mant_low = 10'h2a6;
          4'h2: mant_low = 10'h2a3;
          4'h3: mant_low = 10'h2a0;
          4'h4: mant_low = 10'h29d;
          4'h5: mant_low = 10'h29a;
          4'h6: mant_low = 10'h297;
          4'h7: mant_low = 10'h294;
          4'h8: mant_low = 10'h291;
          4'h9: mant_low = 10'h28e;
          4'ha: mant_low = 10'h28b;
          4'hb: mant_low = 10'h289;
          4'hc: mant_low = 10'h286;
          4'hd: mant_low = 10'h283;
          4'he: mant_low = 10'h280;
          4'hf: mant_low = 10'h27d;
          default: mant_low = 10'h000;
        endcase
      end
      6'h2d: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h27a;
          4'h1: mant_low = 10'h277;
          4'h2: mant_low = 10'h275;
          4'h3: mant_low = 10'h272;
          4'h4: mant_low = 10'h26f;
          4'h5: mant_low = 10'h26c;
          4'h6: mant_low = 10'h269;
          4'h7: mant_low = 10'h266;
          4'h8: mant_low = 10'h264;
          4'h9: mant_low = 10'h261;
          4'ha: mant_low = 10'h25e;
          4'hb: mant_low = 10'h25b;
          4'hc: mant_low = 10'h258;
          4'hd: mant_low = 10'h256;
          4'he: mant_low = 10'h253;
          4'hf: mant_low = 10'h250;
          default: mant_low = 10'h000;
        endcase
      end
      6'h2e: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h24d;
          4'h1: mant_low = 10'h24b;
          4'h2: mant_low = 10'h248;
          4'h3: mant_low = 10'h245;
          4'h4: mant_low = 10'h242;
          4'h5: mant_low = 10'h240;
          4'h6: mant_low = 10'h23d;
          4'h7: mant_low = 10'h23a;
          4'h8: mant_low = 10'h238;
          4'h9: mant_low = 10'h235;
          4'ha: mant_low = 10'h232;
          4'hb: mant_low = 10'h230;
          4'hc: mant_low = 10'h22d;
          4'hd: mant_low = 10'h22a;
          4'he: mant_low = 10'h228;
          4'hf: mant_low = 10'h225;
          default: mant_low = 10'h000;
        endcase
      end
      6'h2f: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h222;
          4'h1: mant_low = 10'h220;
          4'h2: mant_low = 10'h21d;
          4'h3: mant_low = 10'h21a;
          4'h4: mant_low = 10'h218;
          4'h5: mant_low = 10'h215;
          4'h6: mant_low = 10'h212;
          4'h7: mant_low = 10'h210;
          4'h8: mant_low = 10'h20d;
          4'h9: mant_low = 10'h20b;
          4'ha: mant_low = 10'h208;
          4'hb: mant_low = 10'h205;
          4'hc: mant_low = 10'h203;
          4'hd: mant_low = 10'h200;
          4'he: mant_low = 10'h1fe;
          4'hf: mant_low = 10'h1fb;
          default: mant_low = 10'h000;
        endcase
      end
      6'h30: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h1f9;
          4'h1: mant_low = 10'h1f6;
          4'h2: mant_low = 10'h1f3;
          4'h3: mant_low = 10'h1f1;
          4'h4: mant_low = 10'h1ee;
          4'h5: mant_low = 10'h1ec;
          4'h6: mant_low = 10'h1e9;
          4'h7: mant_low = 10'h1e7;
          4'h8: mant_low = 10'h1e4;
          4'h9: mant_low = 10'h1e2;
          4'ha: mant_low = 10'h1df;
          4'hb: mant_low = 10'h1dd;
          4'hc: mant_low = 10'h1da;
          4'hd: mant_low = 10'h1d8;
          4'he: mant_low = 10'h1d5;
          4'hf: mant_low = 10'h1d3;
          default: mant_low = 10'h000;
        endcase
      end
      6'h31: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h1d0;
          4'h1: mant_low = 10'h1ce;
          4'h2: mant_low = 10'h1cb;
          4'h3: mant_low = 10'h1c9;
          4'h4: mant_low = 10'h1c6;
          4'h5: mant_low = 10'h1c4;
          4'h6: mant_low = 10'h1c2;
          4'h7: mant_low = 10'h1bf;
          4'h8: mant_low = 10'h1bd;
          4'h9: mant_low = 10'h1ba;
          4'ha: mant_low = 10'h1b8;
          4'hb: mant_low = 10'h1b5;
          4'hc: mant_low = 10'h1b3;
          4'hd: mant_low = 10'h1b1;
          4'he: mant_low = 10'h1ae;
          4'hf: mant_low = 10'h1ac;
          default: mant_low = 10'h000;
        endcase
      end
      6'h32: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h1a9;
          4'h1: mant_low = 10'h1a7;
          4'h2: mant_low = 10'h1a5;
          4'h3: mant_low = 10'h1a2;
          4'h4: mant_low = 10'h1a0;
          4'h5: mant_low = 10'h19e;
          4'h6: mant_low = 10'h19b;
          4'h7: mant_low = 10'h199;
          4'h8: mant_low = 10'h197;
          4'h9: mant_low = 10'h194;
          4'ha: mant_low = 10'h192;
          4'hb: mant_low = 10'h190;
          4'hc: mant_low = 10'h18d;
          4'hd: mant_low = 10'h18b;
          4'he: mant_low = 10'h189;
          4'hf: mant_low = 10'h186;
          default: mant_low = 10'h000;
        endcase
      end
      6'h33: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h184;
          4'h1: mant_low = 10'h182;
          4'h2: mant_low = 10'h17f;
          4'h3: mant_low = 10'h17d;
          4'h4: mant_low = 10'h17b;
          4'h5: mant_low = 10'h179;
          4'h6: mant_low = 10'h176;
          4'h7: mant_low = 10'h174;
          4'h8: mant_low = 10'h172;
          4'h9: mant_low = 10'h16f;
          4'ha: mant_low = 10'h16d;
          4'hb: mant_low = 10'h16b;
          4'hc: mant_low = 10'h169;
          4'hd: mant_low = 10'h166;
          4'he: mant_low = 10'h164;
          4'hf: mant_low = 10'h162;
          default: mant_low = 10'h000;
        endcase
      end
      6'h34: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h160;
          4'h1: mant_low = 10'h15e;
          4'h2: mant_low = 10'h15b;
          4'h3: mant_low = 10'h159;
          4'h4: mant_low = 10'h157;
          4'h5: mant_low = 10'h155;
          4'h6: mant_low = 10'h153;
          4'h7: mant_low = 10'h150;
          4'h8: mant_low = 10'h14e;
          4'h9: mant_low = 10'h14c;
          4'ha: mant_low = 10'h14a;
          4'hb: mant_low = 10'h148;
          4'hc: mant_low = 10'h145;
          4'hd: mant_low = 10'h143;
          4'he: mant_low = 10'h141;
          4'hf: mant_low = 10'h13f;
          default: mant_low = 10'h000;
        endcase
      end
      6'h35: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h13d;
          4'h1: mant_low = 10'h13b;
          4'h2: mant_low = 10'h139;
          4'h3: mant_low = 10'h136;
          4'h4: mant_low = 10'h134;
          4'h5: mant_low = 10'h132;
          4'h6: mant_low = 10'h130;
          4'h7: mant_low = 10'h12e;
          4'h8: mant_low = 10'h12c;
          4'h9: mant_low = 10'h12a;
          4'ha: mant_low = 10'h128;
          4'hb: mant_low = 10'h125;
          4'hc: mant_low = 10'h123;
          4'hd: mant_low = 10'h121;
          4'he: mant_low = 10'h11f;
          4'hf: mant_low = 10'h11d;
          default: mant_low = 10'h000;
        endcase
      end
      6'h36: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h11b;
          4'h1: mant_low = 10'h119;
          4'h2: mant_low = 10'h117;
          4'h3: mant_low = 10'h115;
          4'h4: mant_low = 10'h113;
          4'h5: mant_low = 10'h111;
          4'h6: mant_low = 10'h10f;
          4'h7: mant_low = 10'h10d;
          4'h8: mant_low = 10'h10b;
          4'h9: mant_low = 10'h109;
          4'ha: mant_low = 10'h106;
          4'hb: mant_low = 10'h104;
          4'hc: mant_low = 10'h102;
          4'hd: mant_low = 10'h100;
          4'he: mant_low = 10'h0fe;
          4'hf: mant_low = 10'h0fc;
          default: mant_low = 10'h000;
        endcase
      end
      6'h37: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h0fa;
          4'h1: mant_low = 10'h0f8;
          4'h2: mant_low = 10'h0f6;
          4'h3: mant_low = 10'h0f4;
          4'h4: mant_low = 10'h0f2;
          4'h5: mant_low = 10'h0f0;
          4'h6: mant_low = 10'h0ee;
          4'h7: mant_low = 10'h0ec;
          4'h8: mant_low = 10'h0ea;
          4'h9: mant_low = 10'h0e8;
          4'ha: mant_low = 10'h0e6;
          4'hb: mant_low = 10'h0e5;
          4'hc: mant_low = 10'h0e3;
          4'hd: mant_low = 10'h0e1;
          4'he: mant_low = 10'h0df;
          4'hf: mant_low = 10'h0dd;
          default: mant_low = 10'h000;
        endcase
      end
      6'h38: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h0db;
          4'h1: mant_low = 10'h0d9;
          4'h2: mant_low = 10'h0d7;
          4'h3: mant_low = 10'h0d5;
          4'h4: mant_low = 10'h0d3;
          4'h5: mant_low = 10'h0d1;
          4'h6: mant_low = 10'h0cf;
          4'h7: mant_low = 10'h0cd;
          4'h8: mant_low = 10'h0cb;
          4'h9: mant_low = 10'h0c9;
          4'ha: mant_low = 10'h0c8;
          4'hb: mant_low = 10'h0c6;
          4'hc: mant_low = 10'h0c4;
          4'hd: mant_low = 10'h0c2;
          4'he: mant_low = 10'h0c0;
          4'hf: mant_low = 10'h0be;
          default: mant_low = 10'h000;
        endcase
      end
      6'h39: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h0bc;
          4'h1: mant_low = 10'h0ba;
          4'h2: mant_low = 10'h0b8;
          4'h3: mant_low = 10'h0b7;
          4'h4: mant_low = 10'h0b5;
          4'h5: mant_low = 10'h0b3;
          4'h6: mant_low = 10'h0b1;
          4'h7: mant_low = 10'h0af;
          4'h8: mant_low = 10'h0ad;
          4'h9: mant_low = 10'h0ab;
          4'ha: mant_low = 10'h0aa;
          4'hb: mant_low = 10'h0a8;
          4'hc: mant_low = 10'h0a6;
          4'hd: mant_low = 10'h0a4;
          4'he: mant_low = 10'h0a2;
          4'hf: mant_low = 10'h0a0;
          default: mant_low = 10'h000;
        endcase
      end
      6'h3a: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h09f;
          4'h1: mant_low = 10'h09d;
          4'h2: mant_low = 10'h09b;
          4'h3: mant_low = 10'h099;
          4'h4: mant_low = 10'h097;
          4'h5: mant_low = 10'h096;
          4'h6: mant_low = 10'h094;
          4'h7: mant_low = 10'h092;
          4'h8: mant_low = 10'h090;
          4'h9: mant_low = 10'h08e;
          4'ha: mant_low = 10'h08d;
          4'hb: mant_low = 10'h08b;
          4'hc: mant_low = 10'h089;
          4'hd: mant_low = 10'h087;
          4'he: mant_low = 10'h086;
          4'hf: mant_low = 10'h084;
          default: mant_low = 10'h000;
        endcase
      end
      6'h3b: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h082;
          4'h1: mant_low = 10'h080;
          4'h2: mant_low = 10'h07f;
          4'h3: mant_low = 10'h07d;
          4'h4: mant_low = 10'h07b;
          4'h5: mant_low = 10'h079;
          4'h6: mant_low = 10'h078;
          4'h7: mant_low = 10'h076;
          4'h8: mant_low = 10'h074;
          4'h9: mant_low = 10'h072;
          4'ha: mant_low = 10'h071;
          4'hb: mant_low = 10'h06f;
          4'hc: mant_low = 10'h06d;
          4'hd: mant_low = 10'h06b;
          4'he: mant_low = 10'h06a;
          4'hf: mant_low = 10'h068;
          default: mant_low = 10'h000;
        endcase
      end
      6'h3c: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h066;
          4'h1: mant_low = 10'h065;
          4'h2: mant_low = 10'h063;
          4'h3: mant_low = 10'h061;
          4'h4: mant_low = 10'h060;
          4'h5: mant_low = 10'h05e;
          4'h6: mant_low = 10'h05c;
          4'h7: mant_low = 10'h05a;
          4'h8: mant_low = 10'h059;
          4'h9: mant_low = 10'h057;
          4'ha: mant_low = 10'h055;
          4'hb: mant_low = 10'h054;
          4'hc: mant_low = 10'h052;
          4'hd: mant_low = 10'h050;
          4'he: mant_low = 10'h04f;
          4'hf: mant_low = 10'h04d;
          default: mant_low = 10'h000;
        endcase
      end
      6'h3d: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h04c;
          4'h1: mant_low = 10'h04a;
          4'h2: mant_low = 10'h048;
          4'h3: mant_low = 10'h047;
          4'h4: mant_low = 10'h045;
          4'h5: mant_low = 10'h043;
          4'h6: mant_low = 10'h042;
          4'h7: mant_low = 10'h040;
          4'h8: mant_low = 10'h03e;
          4'h9: mant_low = 10'h03d;
          4'ha: mant_low = 10'h03b;
          4'hb: mant_low = 10'h03a;
          4'hc: mant_low = 10'h038;
          4'hd: mant_low = 10'h036;
          4'he: mant_low = 10'h035;
          4'hf: mant_low = 10'h033;
          default: mant_low = 10'h000;
        endcase
      end
      6'h3e: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h032;
          4'h1: mant_low = 10'h030;
          4'h2: mant_low = 10'h02e;
          4'h3: mant_low = 10'h02d;
          4'h4: mant_low = 10'h02b;
          4'h5: mant_low = 10'h02a;
          4'h6: mant_low = 10'h028;
          4'h7: mant_low = 10'h026;
          4'h8: mant_low = 10'h025;
          4'h9: mant_low = 10'h023;
          4'ha: mant_low = 10'h022;
          4'hb: mant_low = 10'h020;
          4'hc: mant_low = 10'h01f;
          4'hd: mant_low = 10'h01d;
          4'he: mant_low = 10'h01b;
          4'hf: mant_low = 10'h01a;
          default: mant_low = 10'h000;
        endcase
      end
      6'h3f: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h018;
          4'h1: mant_low = 10'h017;
          4'h2: mant_low = 10'h015;
          4'h3: mant_low = 10'h014;
          4'h4: mant_low = 10'h012;
          4'h5: mant_low = 10'h011;
          4'h6: mant_low = 10'h00f;
          4'h7: mant_low = 10'h00e;
          4'h8: mant_low = 10'h00c;
          4'h9: mant_low = 10'h00b;
          4'ha: mant_low = 10'h009;
          4'hb: mant_low = 10'h008;
          4'hc: mant_low = 10'h006;
          4'hd: mant_low = 10'h005;
          4'he: mant_low = 10'h003;
          4'hf: mant_low = 10'h002;
          default: mant_low = 10'h000;
        endcase
      end
      default: mant_low = 10'h000;
    endcase
  end
  wire [9:0] out_mant = {mant_low};
  wire [14:0] core_mag = {core_exp, out_mant};
  reg [13:0] boundary_low;
  always @* begin
    case (exp)
      5'h09: begin
        case (mant[9:4])
          6'h00: boundary_low = 14'h3c00;
          6'h01: boundary_low = 14'h3c00;
          6'h02: boundary_low = 14'h3c00;
          6'h03: boundary_low = 14'h3c00;
          6'h04: boundary_low = 14'h3c00;
          6'h05: boundary_low = 14'h3c00;
          6'h06: boundary_low = 14'h3c00;
          6'h07: boundary_low = 14'h3c00;
          6'h08: boundary_low = 14'h3c00;
          6'h09: boundary_low = 14'h3c00;
          6'h0a: boundary_low = 14'h3c00;
          6'h0b: boundary_low = 14'h3c00;
          6'h0c: boundary_low = 14'h3c00;
          6'h0d: boundary_low = 14'h3c00;
          6'h0e: boundary_low = 14'h3c00;
          6'h0f: boundary_low = 14'h3c00;
          6'h10: boundary_low = 14'h3c00;
          6'h11: boundary_low = 14'h3c00;
          6'h12: boundary_low = 14'h3c00;
          6'h13: boundary_low = 14'h3c00;
          6'h14: boundary_low = 14'h3c00;
          6'h15: boundary_low = 14'h3c00;
          6'h16: boundary_low = 14'h3c00;
          6'h17: boundary_low = 14'h3c00;
          6'h18: boundary_low = 14'h3c00;
          6'h19: boundary_low = 14'h3c00;
          6'h1a: boundary_low = 14'h3c00;
          6'h1b: boundary_low = 14'h3c00;
          6'h1c: boundary_low = 14'h3c00;
          6'h1d: boundary_low = 14'h3c00;
          6'h1e: boundary_low = 14'h3c00;
          6'h1f: boundary_low = 14'h3c00;
          6'h20: boundary_low = 14'h3c00;
          6'h21: boundary_low = 14'h3c00;
          6'h22: boundary_low = 14'h3c00;
          6'h23: boundary_low = 14'h3c00;
          6'h24: boundary_low = 14'h3c00;
          6'h25: begin
            case (mant[3:0])
              4'h0: boundary_low = 14'h3c00;
              4'h1: boundary_low = 14'h3c00;
              4'h2: boundary_low = 14'h3c00;
              4'h3: boundary_low = 14'h3c00;
              4'h4: boundary_low = 14'h3c00;
              4'h5: boundary_low = 14'h3c00;
              4'h6: boundary_low = 14'h3c00;
              4'h7: boundary_low = 14'h3c00;
              4'h8: boundary_low = 14'h3c00;
              4'h9: boundary_low = 14'h3c00;
              4'ha: boundary_low = 14'h3bfe;
              4'hb: boundary_low = 14'h3bfa;
              4'hc: boundary_low = 14'h3bf7;
              4'hd: boundary_low = 14'h3bf3;
              4'he: boundary_low = 14'h3bef;
              4'hf: boundary_low = 14'h3beb;
              default: boundary_low = 14'h0000;
            endcase
          end
          6'h26: begin
            case (mant[3:0])
              4'h0: boundary_low = 14'h3be8;
              4'h1: boundary_low = 14'h3be4;
              4'h2: boundary_low = 14'h3be0;
              4'h3: boundary_low = 14'h3bdd;
              4'h4: boundary_low = 14'h3bd9;
              4'h5: boundary_low = 14'h3bd5;
              4'h6: boundary_low = 14'h3bd1;
              4'h7: boundary_low = 14'h3bce;
              4'h8: boundary_low = 14'h3bca;
              4'h9: boundary_low = 14'h3bc7;
              4'ha: boundary_low = 14'h3bc3;
              4'hb: boundary_low = 14'h3bbf;
              4'hc: boundary_low = 14'h3bbc;
              4'hd: boundary_low = 14'h3bb8;
              4'he: boundary_low = 14'h3bb4;
              4'hf: boundary_low = 14'h3bb1;
              default: boundary_low = 14'h0000;
            endcase
          end
          6'h27: begin
            case (mant[3:0])
              4'h0: boundary_low = 14'h3bad;
              4'h1: boundary_low = 14'h3baa;
              4'h2: boundary_low = 14'h3ba6;
              4'h3: boundary_low = 14'h3ba3;
              4'h4: boundary_low = 14'h3b9f;
              4'h5: boundary_low = 14'h3b9b;
              4'h6: boundary_low = 14'h3b98;
              4'h7: boundary_low = 14'h3b94;
              4'h8: boundary_low = 14'h3b91;
              4'h9: boundary_low = 14'h3b8d;
              4'ha: boundary_low = 14'h3b8a;
              4'hb: boundary_low = 14'h3b86;
              4'hc: boundary_low = 14'h3b83;
              4'hd: boundary_low = 14'h3b7f;
              4'he: boundary_low = 14'h3b7c;
              4'hf: boundary_low = 14'h3b79;
              default: boundary_low = 14'h0000;
            endcase
          end
          6'h28: begin
            case (mant[3:0])
              4'h0: boundary_low = 14'h3b75;
              4'h1: boundary_low = 14'h3b72;
              4'h2: boundary_low = 14'h3b6e;
              4'h3: boundary_low = 14'h3b6b;
              4'h4: boundary_low = 14'h3b67;
              4'h5: boundary_low = 14'h3b64;
              4'h6: boundary_low = 14'h3b61;
              4'h7: boundary_low = 14'h3b5d;
              4'h8: boundary_low = 14'h3b5a;
              4'h9: boundary_low = 14'h3b56;
              4'ha: boundary_low = 14'h3b53;
              4'hb: boundary_low = 14'h3b50;
              4'hc: boundary_low = 14'h3b4c;
              4'hd: boundary_low = 14'h3b49;
              4'he: boundary_low = 14'h3b46;
              4'hf: boundary_low = 14'h3b42;
              default: boundary_low = 14'h0000;
            endcase
          end
          6'h29: begin
            case (mant[3:0])
              4'h0: boundary_low = 14'h3b3f;
              4'h1: boundary_low = 14'h3b3c;
              4'h2: boundary_low = 14'h3b38;
              4'h3: boundary_low = 14'h3b35;
              4'h4: boundary_low = 14'h3b32;
              4'h5: boundary_low = 14'h3b2f;
              4'h6: boundary_low = 14'h3b2b;
              4'h7: boundary_low = 14'h3b28;
              4'h8: boundary_low = 14'h3b25;
              4'h9: boundary_low = 14'h3b22;
              4'ha: boundary_low = 14'h3b1e;
              4'hb: boundary_low = 14'h3b1b;
              4'hc: boundary_low = 14'h3b18;
              4'hd: boundary_low = 14'h3b15;
              4'he: boundary_low = 14'h3b11;
              4'hf: boundary_low = 14'h3b0e;
              default: boundary_low = 14'h0000;
            endcase
          end
          6'h2a: begin
            case (mant[3:0])
              4'h0: boundary_low = 14'h3b0b;
              4'h1: boundary_low = 14'h3b08;
              4'h2: boundary_low = 14'h3b05;
              4'h3: boundary_low = 14'h3b02;
              4'h4: boundary_low = 14'h3afe;
              4'h5: boundary_low = 14'h3afb;
              4'h6: boundary_low = 14'h3af8;
              4'h7: boundary_low = 14'h3af5;
              4'h8: boundary_low = 14'h3af2;
              4'h9: boundary_low = 14'h3aef;
              4'ha: boundary_low = 14'h3aec;
              4'hb: boundary_low = 14'h3ae8;
              4'hc: boundary_low = 14'h3ae5;
              4'hd: boundary_low = 14'h3ae2;
              4'he: boundary_low = 14'h3adf;
              4'hf: boundary_low = 14'h3adc;
              default: boundary_low = 14'h0000;
            endcase
          end
          6'h2b: begin
            case (mant[3:0])
              4'h0: boundary_low = 14'h3ad9;
              4'h1: boundary_low = 14'h3ad6;
              4'h2: boundary_low = 14'h3ad3;
              4'h3: boundary_low = 14'h3ad0;
              4'h4: boundary_low = 14'h3acd;
              4'h5: boundary_low = 14'h3aca;
              4'h6: boundary_low = 14'h3ac7;
              4'h7: boundary_low = 14'h3ac4;
              4'h8: boundary_low = 14'h3ac1;
              4'h9: boundary_low = 14'h3abe;
              4'ha: boundary_low = 14'h3abb;
              4'hb: boundary_low = 14'h3ab8;
              4'hc: boundary_low = 14'h3ab5;
              4'hd: boundary_low = 14'h3ab2;
              4'he: boundary_low = 14'h3aaf;
              4'hf: boundary_low = 14'h3aac;
              default: boundary_low = 14'h0000;
            endcase
          end
          6'h2c: begin
            case (mant[3:0])
              4'h0: boundary_low = 14'h3aa9;
              4'h1: boundary_low = 14'h3aa6;
              4'h2: boundary_low = 14'h3aa3;
              4'h3: boundary_low = 14'h3aa0;
              4'h4: boundary_low = 14'h3a9d;
              4'h5: boundary_low = 14'h3a9a;
              4'h6: boundary_low = 14'h3a97;
              4'h7: boundary_low = 14'h3a94;
              4'h8: boundary_low = 14'h3a91;
              4'h9: boundary_low = 14'h3a8e;
              4'ha: boundary_low = 14'h3a8b;
              4'hb: boundary_low = 14'h3a89;
              4'hc: boundary_low = 14'h3a86;
              4'hd: boundary_low = 14'h3a83;
              4'he: boundary_low = 14'h3a80;
              4'hf: boundary_low = 14'h3a7d;
              default: boundary_low = 14'h0000;
            endcase
          end
          6'h2d: begin
            case (mant[3:0])
              4'h0: boundary_low = 14'h3a7a;
              4'h1: boundary_low = 14'h3a77;
              4'h2: boundary_low = 14'h3a75;
              4'h3: boundary_low = 14'h3a72;
              4'h4: boundary_low = 14'h3a6f;
              4'h5: boundary_low = 14'h3a6c;
              4'h6: boundary_low = 14'h3a69;
              4'h7: boundary_low = 14'h3a66;
              4'h8: boundary_low = 14'h3a64;
              4'h9: boundary_low = 14'h3a61;
              4'ha: boundary_low = 14'h3a5e;
              4'hb: boundary_low = 14'h3a5b;
              4'hc: boundary_low = 14'h3a58;
              4'hd: boundary_low = 14'h3a56;
              4'he: boundary_low = 14'h3a53;
              4'hf: boundary_low = 14'h3a50;
              default: boundary_low = 14'h0000;
            endcase
          end
          6'h2e: begin
            case (mant[3:0])
              4'h0: boundary_low = 14'h3a4d;
              4'h1: boundary_low = 14'h3a4b;
              4'h2: boundary_low = 14'h3a48;
              4'h3: boundary_low = 14'h3a45;
              4'h4: boundary_low = 14'h3a42;
              4'h5: boundary_low = 14'h3a40;
              4'h6: boundary_low = 14'h3a3d;
              4'h7: boundary_low = 14'h3a3a;
              4'h8: boundary_low = 14'h3a38;
              4'h9: boundary_low = 14'h3a35;
              4'ha: boundary_low = 14'h3a32;
              4'hb: boundary_low = 14'h3a30;
              4'hc: boundary_low = 14'h3a2d;
              4'hd: boundary_low = 14'h3a2a;
              4'he: boundary_low = 14'h3a28;
              4'hf: boundary_low = 14'h3a25;
              default: boundary_low = 14'h0000;
            endcase
          end
          6'h2f: begin
            case (mant[3:0])
              4'h0: boundary_low = 14'h3a22;
              4'h1: boundary_low = 14'h3a20;
              4'h2: boundary_low = 14'h3a1d;
              4'h3: boundary_low = 14'h3a1a;
              4'h4: boundary_low = 14'h3a18;
              4'h5: boundary_low = 14'h3a15;
              4'h6: boundary_low = 14'h3a12;
              4'h7: boundary_low = 14'h3a10;
              4'h8: boundary_low = 14'h3a0d;
              4'h9: boundary_low = 14'h3a0b;
              4'ha: boundary_low = 14'h3a08;
              4'hb: boundary_low = 14'h3a05;
              4'hc: boundary_low = 14'h3a03;
              4'hd: boundary_low = 14'h3a00;
              4'he: boundary_low = 14'h39fe;
              4'hf: boundary_low = 14'h39fb;
              default: boundary_low = 14'h0000;
            endcase
          end
          6'h30: begin
            case (mant[3:0])
              4'h0: boundary_low = 14'h39f9;
              4'h1: boundary_low = 14'h39f6;
              4'h2: boundary_low = 14'h39f3;
              4'h3: boundary_low = 14'h39f1;
              4'h4: boundary_low = 14'h39ee;
              4'h5: boundary_low = 14'h39ec;
              4'h6: boundary_low = 14'h39e9;
              4'h7: boundary_low = 14'h39e7;
              4'h8: boundary_low = 14'h39e4;
              4'h9: boundary_low = 14'h39e2;
              4'ha: boundary_low = 14'h39df;
              4'hb: boundary_low = 14'h39dd;
              4'hc: boundary_low = 14'h39da;
              4'hd: boundary_low = 14'h39d8;
              4'he: boundary_low = 14'h39d5;
              4'hf: boundary_low = 14'h39d3;
              default: boundary_low = 14'h0000;
            endcase
          end
          6'h31: begin
            case (mant[3:0])
              4'h0: boundary_low = 14'h39d0;
              4'h1: boundary_low = 14'h39ce;
              4'h2: boundary_low = 14'h39cb;
              4'h3: boundary_low = 14'h39c9;
              4'h4: boundary_low = 14'h39c6;
              4'h5: boundary_low = 14'h39c4;
              4'h6: boundary_low = 14'h39c2;
              4'h7: boundary_low = 14'h39bf;
              4'h8: boundary_low = 14'h39bd;
              4'h9: boundary_low = 14'h39ba;
              4'ha: boundary_low = 14'h39b8;
              4'hb: boundary_low = 14'h39b5;
              4'hc: boundary_low = 14'h39b3;
              4'hd: boundary_low = 14'h39b1;
              4'he: boundary_low = 14'h39ae;
              4'hf: boundary_low = 14'h39ac;
              default: boundary_low = 14'h0000;
            endcase
          end
          6'h32: begin
            case (mant[3:0])
              4'h0: boundary_low = 14'h39a9;
              4'h1: boundary_low = 14'h39a7;
              4'h2: boundary_low = 14'h39a5;
              4'h3: boundary_low = 14'h39a2;
              4'h4: boundary_low = 14'h39a0;
              4'h5: boundary_low = 14'h399e;
              4'h6: boundary_low = 14'h399b;
              4'h7: boundary_low = 14'h3999;
              4'h8: boundary_low = 14'h3997;
              4'h9: boundary_low = 14'h3994;
              4'ha: boundary_low = 14'h3992;
              4'hb: boundary_low = 14'h3990;
              4'hc: boundary_low = 14'h398d;
              4'hd: boundary_low = 14'h398b;
              4'he: boundary_low = 14'h3989;
              4'hf: boundary_low = 14'h3986;
              default: boundary_low = 14'h0000;
            endcase
          end
          6'h33: begin
            case (mant[3:0])
              4'h0: boundary_low = 14'h3984;
              4'h1: boundary_low = 14'h3982;
              4'h2: boundary_low = 14'h397f;
              4'h3: boundary_low = 14'h397d;
              4'h4: boundary_low = 14'h397b;
              4'h5: boundary_low = 14'h3979;
              4'h6: boundary_low = 14'h3976;
              4'h7: boundary_low = 14'h3974;
              4'h8: boundary_low = 14'h3972;
              4'h9: boundary_low = 14'h396f;
              4'ha: boundary_low = 14'h396d;
              4'hb: boundary_low = 14'h396b;
              4'hc: boundary_low = 14'h3969;
              4'hd: boundary_low = 14'h3966;
              4'he: boundary_low = 14'h3964;
              4'hf: boundary_low = 14'h3962;
              default: boundary_low = 14'h0000;
            endcase
          end
          6'h34: begin
            case (mant[3:0])
              4'h0: boundary_low = 14'h3960;
              4'h1: boundary_low = 14'h395e;
              4'h2: boundary_low = 14'h395b;
              4'h3: boundary_low = 14'h3959;
              4'h4: boundary_low = 14'h3957;
              4'h5: boundary_low = 14'h3955;
              4'h6: boundary_low = 14'h3953;
              4'h7: boundary_low = 14'h3950;
              4'h8: boundary_low = 14'h394e;
              4'h9: boundary_low = 14'h394c;
              4'ha: boundary_low = 14'h394a;
              4'hb: boundary_low = 14'h3948;
              4'hc: boundary_low = 14'h3945;
              4'hd: boundary_low = 14'h3943;
              4'he: boundary_low = 14'h3941;
              4'hf: boundary_low = 14'h393f;
              default: boundary_low = 14'h0000;
            endcase
          end
          6'h35: begin
            case (mant[3:0])
              4'h0: boundary_low = 14'h393d;
              4'h1: boundary_low = 14'h393b;
              4'h2: boundary_low = 14'h3939;
              4'h3: boundary_low = 14'h3936;
              4'h4: boundary_low = 14'h3934;
              4'h5: boundary_low = 14'h3932;
              4'h6: boundary_low = 14'h3930;
              4'h7: boundary_low = 14'h392e;
              4'h8: boundary_low = 14'h392c;
              4'h9: boundary_low = 14'h392a;
              4'ha: boundary_low = 14'h3928;
              4'hb: boundary_low = 14'h3925;
              4'hc: boundary_low = 14'h3923;
              4'hd: boundary_low = 14'h3921;
              4'he: boundary_low = 14'h391f;
              4'hf: boundary_low = 14'h391d;
              default: boundary_low = 14'h0000;
            endcase
          end
          6'h36: begin
            case (mant[3:0])
              4'h0: boundary_low = 14'h391b;
              4'h1: boundary_low = 14'h3919;
              4'h2: boundary_low = 14'h3917;
              4'h3: boundary_low = 14'h3915;
              4'h4: boundary_low = 14'h3913;
              4'h5: boundary_low = 14'h3911;
              4'h6: boundary_low = 14'h390f;
              4'h7: boundary_low = 14'h390d;
              4'h8: boundary_low = 14'h390b;
              4'h9: boundary_low = 14'h3909;
              4'ha: boundary_low = 14'h3906;
              4'hb: boundary_low = 14'h3904;
              4'hc: boundary_low = 14'h3902;
              4'hd: boundary_low = 14'h3900;
              4'he: boundary_low = 14'h38fe;
              4'hf: boundary_low = 14'h38fc;
              default: boundary_low = 14'h0000;
            endcase
          end
          6'h37: begin
            case (mant[3:0])
              4'h0: boundary_low = 14'h38fa;
              4'h1: boundary_low = 14'h38f8;
              4'h2: boundary_low = 14'h38f6;
              4'h3: boundary_low = 14'h38f4;
              4'h4: boundary_low = 14'h38f2;
              4'h5: boundary_low = 14'h38f0;
              4'h6: boundary_low = 14'h38ee;
              4'h7: boundary_low = 14'h38ec;
              4'h8: boundary_low = 14'h38ea;
              4'h9: boundary_low = 14'h38e8;
              4'ha: boundary_low = 14'h38e6;
              4'hb: boundary_low = 14'h38e5;
              4'hc: boundary_low = 14'h38e3;
              4'hd: boundary_low = 14'h38e1;
              4'he: boundary_low = 14'h38df;
              4'hf: boundary_low = 14'h38dd;
              default: boundary_low = 14'h0000;
            endcase
          end
          6'h38: begin
            case (mant[3:0])
              4'h0: boundary_low = 14'h38db;
              4'h1: boundary_low = 14'h38d9;
              4'h2: boundary_low = 14'h38d7;
              4'h3: boundary_low = 14'h38d5;
              4'h4: boundary_low = 14'h38d3;
              4'h5: boundary_low = 14'h38d1;
              4'h6: boundary_low = 14'h38cf;
              4'h7: boundary_low = 14'h38cd;
              4'h8: boundary_low = 14'h38cb;
              4'h9: boundary_low = 14'h38c9;
              4'ha: boundary_low = 14'h38c8;
              4'hb: boundary_low = 14'h38c6;
              4'hc: boundary_low = 14'h38c4;
              4'hd: boundary_low = 14'h38c2;
              4'he: boundary_low = 14'h38c0;
              4'hf: boundary_low = 14'h38be;
              default: boundary_low = 14'h0000;
            endcase
          end
          6'h39: begin
            case (mant[3:0])
              4'h0: boundary_low = 14'h38bc;
              4'h1: boundary_low = 14'h38ba;
              4'h2: boundary_low = 14'h38b8;
              4'h3: boundary_low = 14'h38b7;
              4'h4: boundary_low = 14'h38b5;
              4'h5: boundary_low = 14'h38b3;
              4'h6: boundary_low = 14'h38b1;
              4'h7: boundary_low = 14'h38af;
              4'h8: boundary_low = 14'h38ad;
              4'h9: boundary_low = 14'h38ab;
              4'ha: boundary_low = 14'h38aa;
              4'hb: boundary_low = 14'h38a8;
              4'hc: boundary_low = 14'h38a6;
              4'hd: boundary_low = 14'h38a4;
              4'he: boundary_low = 14'h38a2;
              4'hf: boundary_low = 14'h38a0;
              default: boundary_low = 14'h0000;
            endcase
          end
          6'h3a: begin
            case (mant[3:0])
              4'h0: boundary_low = 14'h389f;
              4'h1: boundary_low = 14'h389d;
              4'h2: boundary_low = 14'h389b;
              4'h3: boundary_low = 14'h3899;
              4'h4: boundary_low = 14'h3897;
              4'h5: boundary_low = 14'h3896;
              4'h6: boundary_low = 14'h3894;
              4'h7: boundary_low = 14'h3892;
              4'h8: boundary_low = 14'h3890;
              4'h9: boundary_low = 14'h388e;
              4'ha: boundary_low = 14'h388d;
              4'hb: boundary_low = 14'h388b;
              4'hc: boundary_low = 14'h3889;
              4'hd: boundary_low = 14'h3887;
              4'he: boundary_low = 14'h3886;
              4'hf: boundary_low = 14'h3884;
              default: boundary_low = 14'h0000;
            endcase
          end
          6'h3b: begin
            case (mant[3:0])
              4'h0: boundary_low = 14'h3882;
              4'h1: boundary_low = 14'h3880;
              4'h2: boundary_low = 14'h387f;
              4'h3: boundary_low = 14'h387d;
              4'h4: boundary_low = 14'h387b;
              4'h5: boundary_low = 14'h3879;
              4'h6: boundary_low = 14'h3878;
              4'h7: boundary_low = 14'h3876;
              4'h8: boundary_low = 14'h3874;
              4'h9: boundary_low = 14'h3872;
              4'ha: boundary_low = 14'h3871;
              4'hb: boundary_low = 14'h386f;
              4'hc: boundary_low = 14'h386d;
              4'hd: boundary_low = 14'h386b;
              4'he: boundary_low = 14'h386a;
              4'hf: boundary_low = 14'h3868;
              default: boundary_low = 14'h0000;
            endcase
          end
          6'h3c: begin
            case (mant[3:0])
              4'h0: boundary_low = 14'h3866;
              4'h1: boundary_low = 14'h3865;
              4'h2: boundary_low = 14'h3863;
              4'h3: boundary_low = 14'h3861;
              4'h4: boundary_low = 14'h3860;
              4'h5: boundary_low = 14'h385e;
              4'h6: boundary_low = 14'h385c;
              4'h7: boundary_low = 14'h385a;
              4'h8: boundary_low = 14'h3859;
              4'h9: boundary_low = 14'h3857;
              4'ha: boundary_low = 14'h3855;
              4'hb: boundary_low = 14'h3854;
              4'hc: boundary_low = 14'h3852;
              4'hd: boundary_low = 14'h3850;
              4'he: boundary_low = 14'h384f;
              4'hf: boundary_low = 14'h384d;
              default: boundary_low = 14'h0000;
            endcase
          end
          6'h3d: begin
            case (mant[3:0])
              4'h0: boundary_low = 14'h384c;
              4'h1: boundary_low = 14'h384a;
              4'h2: boundary_low = 14'h3848;
              4'h3: boundary_low = 14'h3847;
              4'h4: boundary_low = 14'h3845;
              4'h5: boundary_low = 14'h3843;
              4'h6: boundary_low = 14'h3842;
              4'h7: boundary_low = 14'h3840;
              4'h8: boundary_low = 14'h383e;
              4'h9: boundary_low = 14'h383d;
              4'ha: boundary_low = 14'h383b;
              4'hb: boundary_low = 14'h383a;
              4'hc: boundary_low = 14'h3838;
              4'hd: boundary_low = 14'h3836;
              4'he: boundary_low = 14'h3835;
              4'hf: boundary_low = 14'h3833;
              default: boundary_low = 14'h0000;
            endcase
          end
          6'h3e: begin
            case (mant[3:0])
              4'h0: boundary_low = 14'h3832;
              4'h1: boundary_low = 14'h3830;
              4'h2: boundary_low = 14'h382e;
              4'h3: boundary_low = 14'h382d;
              4'h4: boundary_low = 14'h382b;
              4'h5: boundary_low = 14'h382a;
              4'h6: boundary_low = 14'h3828;
              4'h7: boundary_low = 14'h3826;
              4'h8: boundary_low = 14'h3825;
              4'h9: boundary_low = 14'h3823;
              4'ha: boundary_low = 14'h3822;
              4'hb: boundary_low = 14'h3820;
              4'hc: boundary_low = 14'h381f;
              4'hd: boundary_low = 14'h381d;
              4'he: boundary_low = 14'h381b;
              4'hf: boundary_low = 14'h381a;
              default: boundary_low = 14'h0000;
            endcase
          end
          6'h3f: begin
            case (mant[3:0])
              4'h0: boundary_low = 14'h3818;
              4'h1: boundary_low = 14'h3817;
              4'h2: boundary_low = 14'h3815;
              4'h3: boundary_low = 14'h3814;
              4'h4: boundary_low = 14'h3812;
              4'h5: boundary_low = 14'h3811;
              4'h6: boundary_low = 14'h380f;
              4'h7: boundary_low = 14'h380e;
              4'h8: boundary_low = 14'h380c;
              4'h9: boundary_low = 14'h380b;
              4'ha: boundary_low = 14'h3809;
              4'hb: boundary_low = 14'h3808;
              4'hc: boundary_low = 14'h3806;
              4'hd: boundary_low = 14'h3805;
              4'he: boundary_low = 14'h3803;
              4'hf: boundary_low = 14'h3802;
              default: boundary_low = 14'h0000;
            endcase
          end
          default: boundary_low = 14'h0000;
        endcase
      end
      5'h13: begin
        case (mant[9:4])
          6'h00: begin
            case (mant[3:0])
              4'h0: boundary_low = 14'h0c00;
              4'h1: boundary_low = 14'h0bfa;
              4'h2: boundary_low = 14'h0bf4;
              4'h3: boundary_low = 14'h0bee;
              4'h4: boundary_low = 14'h0be8;
              4'h5: boundary_low = 14'h0be2;
              4'h6: boundary_low = 14'h0bdc;
              4'h7: boundary_low = 14'h0bd7;
              4'h8: boundary_low = 14'h0bd1;
              4'h9: boundary_low = 14'h0bcb;
              4'ha: boundary_low = 14'h0bc5;
              4'hb: boundary_low = 14'h0bbf;
              4'hc: boundary_low = 14'h0bba;
              4'hd: boundary_low = 14'h0bb4;
              4'he: boundary_low = 14'h0bae;
              4'hf: boundary_low = 14'h0ba9;
              default: boundary_low = 14'h0000;
            endcase
          end
          6'h01: begin
            case (mant[3:0])
              4'h0: boundary_low = 14'h0ba3;
              4'h1: boundary_low = 14'h0b9d;
              4'h2: boundary_low = 14'h0b98;
              4'h3: boundary_low = 14'h0b92;
              4'h4: boundary_low = 14'h0b8d;
              4'h5: boundary_low = 14'h0b87;
              4'h6: boundary_low = 14'h0b81;
              4'h7: boundary_low = 14'h0b7c;
              4'h8: boundary_low = 14'h0b76;
              4'h9: boundary_low = 14'h0b71;
              4'ha: boundary_low = 14'h0b6c;
              4'hb: boundary_low = 14'h0b66;
              4'hc: boundary_low = 14'h0b61;
              4'hd: boundary_low = 14'h0b5b;
              4'he: boundary_low = 14'h0b56;
              4'hf: boundary_low = 14'h0b51;
              default: boundary_low = 14'h0000;
            endcase
          end
          6'h02: begin
            case (mant[3:0])
              4'h0: boundary_low = 14'h0b4b;
              4'h1: boundary_low = 14'h0b46;
              4'h2: boundary_low = 14'h0b41;
              4'h3: boundary_low = 14'h0b3c;
              4'h4: boundary_low = 14'h0b36;
              4'h5: boundary_low = 14'h0b31;
              4'h6: boundary_low = 14'h0b2c;
              4'h7: boundary_low = 14'h0b27;
              4'h8: boundary_low = 14'h0b22;
              4'h9: boundary_low = 14'h0b1c;
              4'ha: boundary_low = 14'h0b17;
              4'hb: boundary_low = 14'h0b12;
              4'hc: boundary_low = 14'h0b0d;
              4'hd: boundary_low = 14'h0b08;
              4'he: boundary_low = 14'h0b03;
              4'hf: boundary_low = 14'h0afe;
              default: boundary_low = 14'h0000;
            endcase
          end
          6'h03: begin
            case (mant[3:0])
              4'h0: boundary_low = 14'h0af9;
              4'h1: boundary_low = 14'h0af4;
              4'h2: boundary_low = 14'h0aef;
              4'h3: boundary_low = 14'h0aea;
              4'h4: boundary_low = 14'h0ae5;
              4'h5: boundary_low = 14'h0ae0;
              4'h6: boundary_low = 14'h0adb;
              4'h7: boundary_low = 14'h0ad7;
              4'h8: boundary_low = 14'h0ad2;
              4'h9: boundary_low = 14'h0acd;
              4'ha: boundary_low = 14'h0ac8;
              4'hb: boundary_low = 14'h0ac3;
              4'hc: boundary_low = 14'h0abe;
              4'hd: boundary_low = 14'h0aba;
              4'he: boundary_low = 14'h0ab5;
              4'hf: boundary_low = 14'h0ab0;
              default: boundary_low = 14'h0000;
            endcase
          end
          6'h04: begin
            case (mant[3:0])
              4'h0: boundary_low = 14'h0aab;
              4'h1: boundary_low = 14'h0aa7;
              4'h2: boundary_low = 14'h0aa2;
              4'h3: boundary_low = 14'h0a9d;
              4'h4: boundary_low = 14'h0a99;
              4'h5: boundary_low = 14'h0a94;
              4'h6: boundary_low = 14'h0a8f;
              4'h7: boundary_low = 14'h0a8b;
              4'h8: boundary_low = 14'h0a86;
              4'h9: boundary_low = 14'h0a82;
              4'ha: boundary_low = 14'h0a7d;
              4'hb: boundary_low = 14'h0a79;
              4'hc: boundary_low = 14'h0a74;
              4'hd: boundary_low = 14'h0a70;
              4'he: boundary_low = 14'h0a6b;
              4'hf: boundary_low = 14'h0a67;
              default: boundary_low = 14'h0000;
            endcase
          end
          6'h05: begin
            case (mant[3:0])
              4'h0: boundary_low = 14'h0a62;
              4'h1: boundary_low = 14'h0a5e;
              4'h2: boundary_low = 14'h0a59;
              4'h3: boundary_low = 14'h0a55;
              4'h4: boundary_low = 14'h0a51;
              4'h5: boundary_low = 14'h0a4c;
              4'h6: boundary_low = 14'h0a48;
              4'h7: boundary_low = 14'h0a44;
              4'h8: boundary_low = 14'h0a3f;
              4'h9: boundary_low = 14'h0a3b;
              4'ha: boundary_low = 14'h0a37;
              4'hb: boundary_low = 14'h0a32;
              4'hc: boundary_low = 14'h0a2e;
              4'hd: boundary_low = 14'h0a2a;
              4'he: boundary_low = 14'h0a26;
              4'hf: boundary_low = 14'h0a21;
              default: boundary_low = 14'h0000;
            endcase
          end
          6'h06: begin
            case (mant[3:0])
              4'h0: boundary_low = 14'h0a1d;
              4'h1: boundary_low = 14'h0a19;
              4'h2: boundary_low = 14'h0a15;
              4'h3: boundary_low = 14'h0a11;
              4'h4: boundary_low = 14'h0a0d;
              4'h5: boundary_low = 14'h0a08;
              4'h6: boundary_low = 14'h0a04;
              4'h7: boundary_low = 14'h0a00;
              4'h8: boundary_low = 14'h09fc;
              4'h9: boundary_low = 14'h09f8;
              4'ha: boundary_low = 14'h09f4;
              4'hb: boundary_low = 14'h09f0;
              4'hc: boundary_low = 14'h09ec;
              4'hd: boundary_low = 14'h09e8;
              4'he: boundary_low = 14'h09e4;
              4'hf: boundary_low = 14'h09e0;
              default: boundary_low = 14'h0000;
            endcase
          end
          6'h07: begin
            case (mant[3:0])
              4'h0: boundary_low = 14'h09dc;
              4'h1: boundary_low = 14'h09d8;
              4'h2: boundary_low = 14'h09d4;
              4'h3: boundary_low = 14'h09d0;
              4'h4: boundary_low = 14'h09cc;
              4'h5: boundary_low = 14'h09c8;
              4'h6: boundary_low = 14'h09c4;
              4'h7: boundary_low = 14'h09c1;
              4'h8: boundary_low = 14'h09bd;
              4'h9: boundary_low = 14'h09b9;
              4'ha: boundary_low = 14'h09b5;
              4'hb: boundary_low = 14'h09b1;
              4'hc: boundary_low = 14'h09ad;
              4'hd: boundary_low = 14'h09aa;
              4'he: boundary_low = 14'h09a6;
              4'hf: boundary_low = 14'h09a2;
              default: boundary_low = 14'h0000;
            endcase
          end
          6'h08: begin
            case (mant[3:0])
              4'h0: boundary_low = 14'h099e;
              4'h1: boundary_low = 14'h099b;
              4'h2: boundary_low = 14'h0997;
              4'h3: boundary_low = 14'h0993;
              4'h4: boundary_low = 14'h098f;
              4'h5: boundary_low = 14'h098c;
              4'h6: boundary_low = 14'h0988;
              4'h7: boundary_low = 14'h0984;
              4'h8: boundary_low = 14'h0981;
              4'h9: boundary_low = 14'h097d;
              4'ha: boundary_low = 14'h097a;
              4'hb: boundary_low = 14'h0976;
              4'hc: boundary_low = 14'h0972;
              4'hd: boundary_low = 14'h096f;
              4'he: boundary_low = 14'h096b;
              4'hf: boundary_low = 14'h0968;
              default: boundary_low = 14'h0000;
            endcase
          end
          6'h09: begin
            case (mant[3:0])
              4'h0: boundary_low = 14'h0964;
              4'h1: boundary_low = 14'h0961;
              4'h2: boundary_low = 14'h095d;
              4'h3: boundary_low = 14'h0959;
              4'h4: boundary_low = 14'h0956;
              4'h5: boundary_low = 14'h0952;
              4'h6: boundary_low = 14'h094f;
              4'h7: boundary_low = 14'h094c;
              4'h8: boundary_low = 14'h0948;
              4'h9: boundary_low = 14'h0945;
              4'ha: boundary_low = 14'h0941;
              4'hb: boundary_low = 14'h093e;
              4'hc: boundary_low = 14'h093a;
              4'hd: boundary_low = 14'h0937;
              4'he: boundary_low = 14'h0934;
              4'hf: boundary_low = 14'h0930;
              default: boundary_low = 14'h0000;
            endcase
          end
          6'h0a: begin
            case (mant[3:0])
              4'h0: boundary_low = 14'h092d;
              4'h1: boundary_low = 14'h092a;
              4'h2: boundary_low = 14'h0926;
              4'h3: boundary_low = 14'h0923;
              4'h4: boundary_low = 14'h0920;
              4'h5: boundary_low = 14'h091c;
              4'h6: boundary_low = 14'h0919;
              4'h7: boundary_low = 14'h0916;
              4'h8: boundary_low = 14'h0912;
              4'h9: boundary_low = 14'h090f;
              4'ha: boundary_low = 14'h090c;
              4'hb: boundary_low = 14'h0909;
              4'hc: boundary_low = 14'h0905;
              4'hd: boundary_low = 14'h0902;
              4'he: boundary_low = 14'h08ff;
              4'hf: boundary_low = 14'h08fc;
              default: boundary_low = 14'h0000;
            endcase
          end
          6'h0b: begin
            case (mant[3:0])
              4'h0: boundary_low = 14'h08f9;
              4'h1: boundary_low = 14'h08f5;
              4'h2: boundary_low = 14'h08f2;
              4'h3: boundary_low = 14'h08ef;
              4'h4: boundary_low = 14'h08ec;
              4'h5: boundary_low = 14'h08e9;
              4'h6: boundary_low = 14'h08e6;
              4'h7: boundary_low = 14'h08e3;
              4'h8: boundary_low = 14'h08df;
              4'h9: boundary_low = 14'h08dc;
              4'ha: boundary_low = 14'h08d9;
              4'hb: boundary_low = 14'h08d6;
              4'hc: boundary_low = 14'h08d3;
              4'hd: boundary_low = 14'h08d0;
              4'he: boundary_low = 14'h08cd;
              4'hf: boundary_low = 14'h08ca;
              default: boundary_low = 14'h0000;
            endcase
          end
          6'h0c: begin
            case (mant[3:0])
              4'h0: boundary_low = 14'h08c7;
              4'h1: boundary_low = 14'h08c4;
              4'h2: boundary_low = 14'h08c1;
              4'h3: boundary_low = 14'h08be;
              4'h4: boundary_low = 14'h08bb;
              4'h5: boundary_low = 14'h08b8;
              4'h6: boundary_low = 14'h08b5;
              4'h7: boundary_low = 14'h08b2;
              4'h8: boundary_low = 14'h08af;
              4'h9: boundary_low = 14'h08ac;
              4'ha: boundary_low = 14'h08a9;
              4'hb: boundary_low = 14'h08a6;
              4'hc: boundary_low = 14'h08a4;
              4'hd: boundary_low = 14'h08a1;
              4'he: boundary_low = 14'h089e;
              4'hf: boundary_low = 14'h089b;
              default: boundary_low = 14'h0000;
            endcase
          end
          6'h0d: begin
            case (mant[3:0])
              4'h0: boundary_low = 14'h0898;
              4'h1: boundary_low = 14'h0895;
              4'h2: boundary_low = 14'h0892;
              4'h3: boundary_low = 14'h088f;
              4'h4: boundary_low = 14'h088d;
              4'h5: boundary_low = 14'h088a;
              4'h6: boundary_low = 14'h0887;
              4'h7: boundary_low = 14'h0884;
              4'h8: boundary_low = 14'h0881;
              4'h9: boundary_low = 14'h087f;
              4'ha: boundary_low = 14'h087c;
              4'hb: boundary_low = 14'h0879;
              4'hc: boundary_low = 14'h0876;
              4'hd: boundary_low = 14'h0874;
              4'he: boundary_low = 14'h0871;
              4'hf: boundary_low = 14'h086e;
              default: boundary_low = 14'h0000;
            endcase
          end
          6'h0e: begin
            case (mant[3:0])
              4'h0: boundary_low = 14'h086b;
              4'h1: boundary_low = 14'h0869;
              4'h2: boundary_low = 14'h0866;
              4'h3: boundary_low = 14'h0863;
              4'h4: boundary_low = 14'h0861;
              4'h5: boundary_low = 14'h085e;
              4'h6: boundary_low = 14'h085b;
              4'h7: boundary_low = 14'h0858;
              4'h8: boundary_low = 14'h0856;
              4'h9: boundary_low = 14'h0853;
              4'ha: boundary_low = 14'h0851;
              4'hb: boundary_low = 14'h084e;
              4'hc: boundary_low = 14'h084b;
              4'hd: boundary_low = 14'h0849;
              4'he: boundary_low = 14'h0846;
              4'hf: boundary_low = 14'h0843;
              default: boundary_low = 14'h0000;
            endcase
          end
          6'h0f: begin
            case (mant[3:0])
              4'h0: boundary_low = 14'h0841;
              4'h1: boundary_low = 14'h083e;
              4'h2: boundary_low = 14'h083c;
              4'h3: boundary_low = 14'h0839;
              4'h4: boundary_low = 14'h0837;
              4'h5: boundary_low = 14'h0834;
              4'h6: boundary_low = 14'h0832;
              4'h7: boundary_low = 14'h082f;
              4'h8: boundary_low = 14'h082c;
              4'h9: boundary_low = 14'h082a;
              4'ha: boundary_low = 14'h0827;
              4'hb: boundary_low = 14'h0825;
              4'hc: boundary_low = 14'h0822;
              4'hd: boundary_low = 14'h0820;
              4'he: boundary_low = 14'h081e;
              4'hf: boundary_low = 14'h081b;
              default: boundary_low = 14'h0000;
            endcase
          end
          6'h10: begin
            case (mant[3:0])
              4'h0: boundary_low = 14'h0819;
              4'h1: boundary_low = 14'h0816;
              4'h2: boundary_low = 14'h0814;
              4'h3: boundary_low = 14'h0811;
              4'h4: boundary_low = 14'h080f;
              4'h5: boundary_low = 14'h080c;
              4'h6: boundary_low = 14'h080a;
              4'h7: boundary_low = 14'h0808;
              4'h8: boundary_low = 14'h0805;
              4'h9: boundary_low = 14'h0803;
              4'ha: boundary_low = 14'h0800;
              4'hb: boundary_low = 14'h07fc;
              4'hc: boundary_low = 14'h07f7;
              4'hd: boundary_low = 14'h07f3;
              4'he: boundary_low = 14'h07ee;
              4'hf: boundary_low = 14'h07e9;
              default: boundary_low = 14'h0000;
            endcase
          end
          6'h11: begin
            case (mant[3:0])
              4'h0: boundary_low = 14'h07e4;
              4'h1: boundary_low = 14'h07e0;
              4'h2: boundary_low = 14'h07db;
              4'h3: boundary_low = 14'h07d6;
              4'h4: boundary_low = 14'h07d2;
              4'h5: boundary_low = 14'h07cd;
              4'h6: boundary_low = 14'h07c9;
              4'h7: boundary_low = 14'h07c4;
              4'h8: boundary_low = 14'h07bf;
              4'h9: boundary_low = 14'h07bb;
              4'ha: boundary_low = 14'h07b6;
              4'hb: boundary_low = 14'h07b2;
              4'hc: boundary_low = 14'h07ad;
              4'hd: boundary_low = 14'h07a9;
              4'he: boundary_low = 14'h07a4;
              4'hf: boundary_low = 14'h07a0;
              default: boundary_low = 14'h0000;
            endcase
          end
          6'h12: begin
            case (mant[3:0])
              4'h0: boundary_low = 14'h079b;
              4'h1: boundary_low = 14'h0797;
              4'h2: boundary_low = 14'h0793;
              4'h3: boundary_low = 14'h078e;
              4'h4: boundary_low = 14'h078a;
              4'h5: boundary_low = 14'h0785;
              4'h6: boundary_low = 14'h0781;
              4'h7: boundary_low = 14'h077d;
              4'h8: boundary_low = 14'h0778;
              4'h9: boundary_low = 14'h0774;
              4'ha: boundary_low = 14'h0770;
              4'hb: boundary_low = 14'h076b;
              4'hc: boundary_low = 14'h0767;
              4'hd: boundary_low = 14'h0763;
              4'he: boundary_low = 14'h075e;
              4'hf: boundary_low = 14'h075a;
              default: boundary_low = 14'h0000;
            endcase
          end
          6'h13: begin
            case (mant[3:0])
              4'h0: boundary_low = 14'h0756;
              4'h1: boundary_low = 14'h0752;
              4'h2: boundary_low = 14'h074d;
              4'h3: boundary_low = 14'h0749;
              4'h4: boundary_low = 14'h0745;
              4'h5: boundary_low = 14'h0741;
              4'h6: boundary_low = 14'h073d;
              4'h7: boundary_low = 14'h0738;
              4'h8: boundary_low = 14'h0734;
              4'h9: boundary_low = 14'h0730;
              4'ha: boundary_low = 14'h072c;
              4'hb: boundary_low = 14'h0728;
              4'hc: boundary_low = 14'h0724;
              4'hd: boundary_low = 14'h0720;
              4'he: boundary_low = 14'h071c;
              4'hf: boundary_low = 14'h0718;
              default: boundary_low = 14'h0000;
            endcase
          end
          6'h14: begin
            case (mant[3:0])
              4'h0: boundary_low = 14'h0714;
              4'h1: boundary_low = 14'h0710;
              4'h2: boundary_low = 14'h070c;
              4'h3: boundary_low = 14'h0708;
              4'h4: boundary_low = 14'h0704;
              4'h5: boundary_low = 14'h0700;
              4'h6: boundary_low = 14'h06fc;
              4'h7: boundary_low = 14'h06f8;
              4'h8: boundary_low = 14'h06f4;
              4'h9: boundary_low = 14'h06f0;
              4'ha: boundary_low = 14'h06ec;
              4'hb: boundary_low = 14'h06e8;
              4'hc: boundary_low = 14'h06e4;
              4'hd: boundary_low = 14'h06e0;
              4'he: boundary_low = 14'h06dc;
              4'hf: boundary_low = 14'h06d8;
              default: boundary_low = 14'h0000;
            endcase
          end
          6'h15: begin
            case (mant[3:0])
              4'h0: boundary_low = 14'h06d4;
              4'h1: boundary_low = 14'h06d1;
              4'h2: boundary_low = 14'h06cd;
              4'h3: boundary_low = 14'h06c9;
              4'h4: boundary_low = 14'h06c5;
              4'h5: boundary_low = 14'h06c1;
              4'h6: boundary_low = 14'h06bd;
              4'h7: boundary_low = 14'h06ba;
              4'h8: boundary_low = 14'h06b6;
              4'h9: boundary_low = 14'h06b2;
              4'ha: boundary_low = 14'h06ae;
              4'hb: boundary_low = 14'h06ab;
              4'hc: boundary_low = 14'h06a7;
              4'hd: boundary_low = 14'h06a3;
              4'he: boundary_low = 14'h06a0;
              4'hf: boundary_low = 14'h069c;
              default: boundary_low = 14'h0000;
            endcase
          end
          6'h16: begin
            case (mant[3:0])
              4'h0: boundary_low = 14'h0698;
              4'h1: boundary_low = 14'h0694;
              4'h2: boundary_low = 14'h0691;
              4'h3: boundary_low = 14'h068d;
              4'h4: boundary_low = 14'h0689;
              4'h5: boundary_low = 14'h0686;
              4'h6: boundary_low = 14'h0682;
              4'h7: boundary_low = 14'h067f;
              4'h8: boundary_low = 14'h067b;
              4'h9: boundary_low = 14'h0677;
              4'ha: boundary_low = 14'h0674;
              4'hb: boundary_low = 14'h0670;
              4'hc: boundary_low = 14'h066d;
              4'hd: boundary_low = 14'h0669;
              4'he: boundary_low = 14'h0666;
              4'hf: boundary_low = 14'h0662;
              default: boundary_low = 14'h0000;
            endcase
          end
          6'h17: begin
            case (mant[3:0])
              4'h0: boundary_low = 14'h065f;
              4'h1: boundary_low = 14'h065b;
              4'h2: boundary_low = 14'h0658;
              4'h3: boundary_low = 14'h0654;
              4'h4: boundary_low = 14'h0651;
              4'h5: boundary_low = 14'h064d;
              4'h6: boundary_low = 14'h064a;
              4'h7: boundary_low = 14'h0646;
              4'h8: boundary_low = 14'h0643;
              4'h9: boundary_low = 14'h063f;
              4'ha: boundary_low = 14'h063c;
              4'hb: boundary_low = 14'h0639;
              4'hc: boundary_low = 14'h0635;
              4'hd: boundary_low = 14'h0632;
              4'he: boundary_low = 14'h062e;
              4'hf: boundary_low = 14'h062b;
              default: boundary_low = 14'h0000;
            endcase
          end
          6'h18: begin
            case (mant[3:0])
              4'h0: boundary_low = 14'h0628;
              4'h1: boundary_low = 14'h0624;
              4'h2: boundary_low = 14'h0621;
              4'h3: boundary_low = 14'h061e;
              4'h4: boundary_low = 14'h061a;
              4'h5: boundary_low = 14'h0617;
              4'h6: boundary_low = 14'h0614;
              4'h7: boundary_low = 14'h0610;
              4'h8: boundary_low = 14'h060d;
              4'h9: boundary_low = 14'h060a;
              4'ha: boundary_low = 14'h0607;
              4'hb: boundary_low = 14'h0603;
              4'hc: boundary_low = 14'h0600;
              4'hd: boundary_low = 14'h05fd;
              4'he: boundary_low = 14'h05fa;
              4'hf: boundary_low = 14'h05f6;
              default: boundary_low = 14'h0000;
            endcase
          end
          6'h19: begin
            case (mant[3:0])
              4'h0: boundary_low = 14'h05f3;
              4'h1: boundary_low = 14'h05f0;
              4'h2: boundary_low = 14'h05ed;
              4'h3: boundary_low = 14'h05ea;
              4'h4: boundary_low = 14'h05e6;
              4'h5: boundary_low = 14'h05e3;
              4'h6: boundary_low = 14'h05e0;
              4'h7: boundary_low = 14'h05dd;
              4'h8: boundary_low = 14'h05da;
              4'h9: boundary_low = 14'h05d7;
              4'ha: boundary_low = 14'h05d3;
              4'hb: boundary_low = 14'h05d0;
              4'hc: boundary_low = 14'h05cd;
              4'hd: boundary_low = 14'h05ca;
              4'he: boundary_low = 14'h05c7;
              4'hf: boundary_low = 14'h05c4;
              default: boundary_low = 14'h0000;
            endcase
          end
          6'h1a: begin
            case (mant[3:0])
              4'h0: boundary_low = 14'h05c1;
              4'h1: boundary_low = 14'h05be;
              4'h2: boundary_low = 14'h05bb;
              4'h3: boundary_low = 14'h05b8;
              4'h4: boundary_low = 14'h05b5;
              4'h5: boundary_low = 14'h05b2;
              4'h6: boundary_low = 14'h05af;
              4'h7: boundary_low = 14'h05ac;
              4'h8: boundary_low = 14'h05a9;
              4'h9: boundary_low = 14'h05a6;
              4'ha: boundary_low = 14'h05a3;
              4'hb: boundary_low = 14'h05a0;
              4'hc: boundary_low = 14'h059d;
              4'hd: boundary_low = 14'h059a;
              4'he: boundary_low = 14'h0597;
              4'hf: boundary_low = 14'h0594;
              default: boundary_low = 14'h0000;
            endcase
          end
          6'h1b: begin
            case (mant[3:0])
              4'h0: boundary_low = 14'h0591;
              4'h1: boundary_low = 14'h058e;
              4'h2: boundary_low = 14'h058b;
              4'h3: boundary_low = 14'h0588;
              4'h4: boundary_low = 14'h0585;
              4'h5: boundary_low = 14'h0582;
              4'h6: boundary_low = 14'h057f;
              4'h7: boundary_low = 14'h057d;
              4'h8: boundary_low = 14'h057a;
              4'h9: boundary_low = 14'h0577;
              4'ha: boundary_low = 14'h0574;
              4'hb: boundary_low = 14'h0571;
              4'hc: boundary_low = 14'h056e;
              4'hd: boundary_low = 14'h056b;
              4'he: boundary_low = 14'h0569;
              4'hf: boundary_low = 14'h0566;
              default: boundary_low = 14'h0000;
            endcase
          end
          6'h1c: begin
            case (mant[3:0])
              4'h0: boundary_low = 14'h0563;
              4'h1: boundary_low = 14'h0560;
              4'h2: boundary_low = 14'h055d;
              4'h3: boundary_low = 14'h055b;
              4'h4: boundary_low = 14'h0558;
              4'h5: boundary_low = 14'h0555;
              4'h6: boundary_low = 14'h0552;
              4'h7: boundary_low = 14'h054f;
              4'h8: boundary_low = 14'h054d;
              4'h9: boundary_low = 14'h054a;
              4'ha: boundary_low = 14'h0547;
              4'hb: boundary_low = 14'h0544;
              4'hc: boundary_low = 14'h0542;
              4'hd: boundary_low = 14'h053f;
              4'he: boundary_low = 14'h053c;
              4'hf: boundary_low = 14'h053a;
              default: boundary_low = 14'h0000;
            endcase
          end
          6'h1d: begin
            case (mant[3:0])
              4'h0: boundary_low = 14'h0537;
              4'h1: boundary_low = 14'h0534;
              4'h2: boundary_low = 14'h0532;
              4'h3: boundary_low = 14'h052f;
              4'h4: boundary_low = 14'h052c;
              4'h5: boundary_low = 14'h052a;
              4'h6: boundary_low = 14'h0527;
              4'h7: boundary_low = 14'h0524;
              4'h8: boundary_low = 14'h0522;
              4'h9: boundary_low = 14'h051f;
              4'ha: boundary_low = 14'h051c;
              4'hb: boundary_low = 14'h051a;
              4'hc: boundary_low = 14'h0517;
              4'hd: boundary_low = 14'h0515;
              4'he: boundary_low = 14'h0512;
              4'hf: boundary_low = 14'h050f;
              default: boundary_low = 14'h0000;
            endcase
          end
          6'h1e: begin
            case (mant[3:0])
              4'h0: boundary_low = 14'h050d;
              4'h1: boundary_low = 14'h050a;
              4'h2: boundary_low = 14'h0508;
              4'h3: boundary_low = 14'h0505;
              4'h4: boundary_low = 14'h0502;
              4'h5: boundary_low = 14'h0500;
              4'h6: boundary_low = 14'h04fd;
              4'h7: boundary_low = 14'h04fb;
              4'h8: boundary_low = 14'h04f8;
              4'h9: boundary_low = 14'h04f6;
              4'ha: boundary_low = 14'h04f3;
              4'hb: boundary_low = 14'h04f1;
              4'hc: boundary_low = 14'h04ee;
              4'hd: boundary_low = 14'h04ec;
              4'he: boundary_low = 14'h04e9;
              4'hf: boundary_low = 14'h04e7;
              default: boundary_low = 14'h0000;
            endcase
          end
          6'h1f: begin
            case (mant[3:0])
              4'h0: boundary_low = 14'h04e4;
              4'h1: boundary_low = 14'h04e2;
              4'h2: boundary_low = 14'h04df;
              4'h3: boundary_low = 14'h04dd;
              4'h4: boundary_low = 14'h04db;
              4'h5: boundary_low = 14'h04d8;
              4'h6: boundary_low = 14'h04d6;
              4'h7: boundary_low = 14'h04d3;
              4'h8: boundary_low = 14'h04d1;
              4'h9: boundary_low = 14'h04ce;
              4'ha: boundary_low = 14'h04cc;
              4'hb: boundary_low = 14'h04ca;
              4'hc: boundary_low = 14'h04c7;
              4'hd: boundary_low = 14'h04c5;
              4'he: boundary_low = 14'h04c2;
              4'hf: boundary_low = 14'h04c0;
              default: boundary_low = 14'h0000;
            endcase
          end
          6'h20: begin
            case (mant[3:0])
              4'h0: boundary_low = 14'h04be;
              4'h1: boundary_low = 14'h04bb;
              4'h2: boundary_low = 14'h04b9;
              4'h3: boundary_low = 14'h04b7;
              4'h4: boundary_low = 14'h04b4;
              4'h5: boundary_low = 14'h04b2;
              4'h6: boundary_low = 14'h04b0;
              4'h7: boundary_low = 14'h04ad;
              4'h8: boundary_low = 14'h04ab;
              4'h9: boundary_low = 14'h04a9;
              4'ha: boundary_low = 14'h04a6;
              4'hb: boundary_low = 14'h04a4;
              4'hc: boundary_low = 14'h04a2;
              4'hd: boundary_low = 14'h049f;
              4'he: boundary_low = 14'h049d;
              4'hf: boundary_low = 14'h049b;
              default: boundary_low = 14'h0000;
            endcase
          end
          6'h21: begin
            case (mant[3:0])
              4'h0: boundary_low = 14'h0498;
              4'h1: boundary_low = 14'h0496;
              4'h2: boundary_low = 14'h0494;
              4'h3: boundary_low = 14'h0492;
              4'h4: boundary_low = 14'h048f;
              4'h5: boundary_low = 14'h048d;
              4'h6: boundary_low = 14'h048b;
              4'h7: boundary_low = 14'h0489;
              4'h8: boundary_low = 14'h0486;
              4'h9: boundary_low = 14'h0484;
              4'ha: boundary_low = 14'h0482;
              4'hb: boundary_low = 14'h0480;
              4'hc: boundary_low = 14'h047e;
              4'hd: boundary_low = 14'h047b;
              4'he: boundary_low = 14'h0479;
              4'hf: boundary_low = 14'h0477;
              default: boundary_low = 14'h0000;
            endcase
          end
          6'h22: begin
            case (mant[3:0])
              4'h0: boundary_low = 14'h0475;
              4'h1: boundary_low = 14'h0473;
              4'h2: boundary_low = 14'h0470;
              4'h3: boundary_low = 14'h046e;
              4'h4: boundary_low = 14'h046c;
              4'h5: boundary_low = 14'h046a;
              4'h6: boundary_low = 14'h0468;
              4'h7: boundary_low = 14'h0466;
              4'h8: boundary_low = 14'h0464;
              4'h9: boundary_low = 14'h0461;
              4'ha: boundary_low = 14'h045f;
              4'hb: boundary_low = 14'h045d;
              4'hc: boundary_low = 14'h045b;
              4'hd: boundary_low = 14'h0459;
              4'he: boundary_low = 14'h0457;
              4'hf: boundary_low = 14'h0455;
              default: boundary_low = 14'h0000;
            endcase
          end
          6'h23: begin
            case (mant[3:0])
              4'h0: boundary_low = 14'h0453;
              4'h1: boundary_low = 14'h0451;
              4'h2: boundary_low = 14'h044e;
              4'h3: boundary_low = 14'h044c;
              4'h4: boundary_low = 14'h044a;
              4'h5: boundary_low = 14'h0448;
              4'h6: boundary_low = 14'h0446;
              4'h7: boundary_low = 14'h0444;
              4'h8: boundary_low = 14'h0442;
              4'h9: boundary_low = 14'h0440;
              4'ha: boundary_low = 14'h043e;
              4'hb: boundary_low = 14'h043c;
              4'hc: boundary_low = 14'h043a;
              4'hd: boundary_low = 14'h0438;
              4'he: boundary_low = 14'h0436;
              4'hf: boundary_low = 14'h0434;
              default: boundary_low = 14'h0000;
            endcase
          end
          6'h24: begin
            case (mant[3:0])
              4'h0: boundary_low = 14'h0432;
              4'h1: boundary_low = 14'h0430;
              4'h2: boundary_low = 14'h042e;
              4'h3: boundary_low = 14'h042c;
              4'h4: boundary_low = 14'h042a;
              4'h5: boundary_low = 14'h0428;
              4'h6: boundary_low = 14'h0426;
              4'h7: boundary_low = 14'h0424;
              4'h8: boundary_low = 14'h0422;
              4'h9: boundary_low = 14'h0420;
              4'ha: boundary_low = 14'h041e;
              4'hb: boundary_low = 14'h041c;
              4'hc: boundary_low = 14'h041a;
              4'hd: boundary_low = 14'h0418;
              4'he: boundary_low = 14'h0416;
              4'hf: boundary_low = 14'h0414;
              default: boundary_low = 14'h0000;
            endcase
          end
          6'h25: begin
            case (mant[3:0])
              4'h0: boundary_low = 14'h0412;
              4'h1: boundary_low = 14'h0410;
              4'h2: boundary_low = 14'h040e;
              4'h3: boundary_low = 14'h040c;
              4'h4: boundary_low = 14'h040a;
              4'h5: boundary_low = 14'h0409;
              4'h6: boundary_low = 14'h0407;
              4'h7: boundary_low = 14'h0405;
              4'h8: boundary_low = 14'h0403;
              4'h9: boundary_low = 14'h0401;
              4'ha: boundary_low = 14'h0000;
              4'hb: boundary_low = 14'h0000;
              4'hc: boundary_low = 14'h0000;
              4'hd: boundary_low = 14'h0000;
              4'he: boundary_low = 14'h0000;
              4'hf: boundary_low = 14'h0000;
              default: boundary_low = 14'h0000;
            endcase
          end
          6'h26: boundary_low = 14'h0000;
          6'h27: boundary_low = 14'h0000;
          6'h28: boundary_low = 14'h0000;
          6'h29: boundary_low = 14'h0000;
          6'h2a: boundary_low = 14'h0000;
          6'h2b: boundary_low = 14'h0000;
          6'h2c: boundary_low = 14'h0000;
          6'h2d: boundary_low = 14'h0000;
          6'h2e: boundary_low = 14'h0000;
          6'h2f: boundary_low = 14'h0000;
          6'h30: boundary_low = 14'h0000;
          6'h31: boundary_low = 14'h0000;
          6'h32: boundary_low = 14'h0000;
          6'h33: boundary_low = 14'h0000;
          6'h34: boundary_low = 14'h0000;
          6'h35: boundary_low = 14'h0000;
          6'h36: boundary_low = 14'h0000;
          6'h37: boundary_low = 14'h0000;
          6'h38: boundary_low = 14'h0000;
          6'h39: boundary_low = 14'h0000;
          6'h3a: boundary_low = 14'h0000;
          6'h3b: boundary_low = 14'h0000;
          6'h3c: boundary_low = 14'h0000;
          6'h3d: boundary_low = 14'h0000;
          6'h3e: boundary_low = 14'h0000;
          6'h3f: boundary_low = 14'h0000;
          default: boundary_low = 14'h0000;
        endcase
      end
      default: boundary_low = 14'h0000;
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
  wire [14:0] boundary_mag = {boundary_b14, boundary_low};
  wire [14:0] active_mag = core_active ? core_mag : boundary_mag;
  wire [15:0] active_out = {sign, active_mag};
  assign out = (core_active || boundary_active) ? active_out : special_out;
endmodule
