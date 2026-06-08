module ex238_core_boundary_low12_hi6(in, out);
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
  reg [11:0] boundary_low;
  always @* begin
    case (exp)
      5'h09: begin
        case (mant[9:4])
          6'h00: boundary_low = 12'hc00;
          6'h01: boundary_low = 12'hc00;
          6'h02: boundary_low = 12'hc00;
          6'h03: boundary_low = 12'hc00;
          6'h04: boundary_low = 12'hc00;
          6'h05: boundary_low = 12'hc00;
          6'h06: boundary_low = 12'hc00;
          6'h07: boundary_low = 12'hc00;
          6'h08: boundary_low = 12'hc00;
          6'h09: boundary_low = 12'hc00;
          6'h0a: boundary_low = 12'hc00;
          6'h0b: boundary_low = 12'hc00;
          6'h0c: boundary_low = 12'hc00;
          6'h0d: boundary_low = 12'hc00;
          6'h0e: boundary_low = 12'hc00;
          6'h0f: boundary_low = 12'hc00;
          6'h10: boundary_low = 12'hc00;
          6'h11: boundary_low = 12'hc00;
          6'h12: boundary_low = 12'hc00;
          6'h13: boundary_low = 12'hc00;
          6'h14: boundary_low = 12'hc00;
          6'h15: boundary_low = 12'hc00;
          6'h16: boundary_low = 12'hc00;
          6'h17: boundary_low = 12'hc00;
          6'h18: boundary_low = 12'hc00;
          6'h19: boundary_low = 12'hc00;
          6'h1a: boundary_low = 12'hc00;
          6'h1b: boundary_low = 12'hc00;
          6'h1c: boundary_low = 12'hc00;
          6'h1d: boundary_low = 12'hc00;
          6'h1e: boundary_low = 12'hc00;
          6'h1f: boundary_low = 12'hc00;
          6'h20: boundary_low = 12'hc00;
          6'h21: boundary_low = 12'hc00;
          6'h22: boundary_low = 12'hc00;
          6'h23: boundary_low = 12'hc00;
          6'h24: boundary_low = 12'hc00;
          6'h25: begin
            case (mant[3:0])
              4'h0: boundary_low = 12'hc00;
              4'h1: boundary_low = 12'hc00;
              4'h2: boundary_low = 12'hc00;
              4'h3: boundary_low = 12'hc00;
              4'h4: boundary_low = 12'hc00;
              4'h5: boundary_low = 12'hc00;
              4'h6: boundary_low = 12'hc00;
              4'h7: boundary_low = 12'hc00;
              4'h8: boundary_low = 12'hc00;
              4'h9: boundary_low = 12'hc00;
              4'ha: boundary_low = 12'hbfe;
              4'hb: boundary_low = 12'hbfa;
              4'hc: boundary_low = 12'hbf7;
              4'hd: boundary_low = 12'hbf3;
              4'he: boundary_low = 12'hbef;
              4'hf: boundary_low = 12'hbeb;
              default: boundary_low = 12'h000;
            endcase
          end
          6'h26: begin
            case (mant[3:0])
              4'h0: boundary_low = 12'hbe8;
              4'h1: boundary_low = 12'hbe4;
              4'h2: boundary_low = 12'hbe0;
              4'h3: boundary_low = 12'hbdd;
              4'h4: boundary_low = 12'hbd9;
              4'h5: boundary_low = 12'hbd5;
              4'h6: boundary_low = 12'hbd1;
              4'h7: boundary_low = 12'hbce;
              4'h8: boundary_low = 12'hbca;
              4'h9: boundary_low = 12'hbc7;
              4'ha: boundary_low = 12'hbc3;
              4'hb: boundary_low = 12'hbbf;
              4'hc: boundary_low = 12'hbbc;
              4'hd: boundary_low = 12'hbb8;
              4'he: boundary_low = 12'hbb4;
              4'hf: boundary_low = 12'hbb1;
              default: boundary_low = 12'h000;
            endcase
          end
          6'h27: begin
            case (mant[3:0])
              4'h0: boundary_low = 12'hbad;
              4'h1: boundary_low = 12'hbaa;
              4'h2: boundary_low = 12'hba6;
              4'h3: boundary_low = 12'hba3;
              4'h4: boundary_low = 12'hb9f;
              4'h5: boundary_low = 12'hb9b;
              4'h6: boundary_low = 12'hb98;
              4'h7: boundary_low = 12'hb94;
              4'h8: boundary_low = 12'hb91;
              4'h9: boundary_low = 12'hb8d;
              4'ha: boundary_low = 12'hb8a;
              4'hb: boundary_low = 12'hb86;
              4'hc: boundary_low = 12'hb83;
              4'hd: boundary_low = 12'hb7f;
              4'he: boundary_low = 12'hb7c;
              4'hf: boundary_low = 12'hb79;
              default: boundary_low = 12'h000;
            endcase
          end
          6'h28: begin
            case (mant[3:0])
              4'h0: boundary_low = 12'hb75;
              4'h1: boundary_low = 12'hb72;
              4'h2: boundary_low = 12'hb6e;
              4'h3: boundary_low = 12'hb6b;
              4'h4: boundary_low = 12'hb67;
              4'h5: boundary_low = 12'hb64;
              4'h6: boundary_low = 12'hb61;
              4'h7: boundary_low = 12'hb5d;
              4'h8: boundary_low = 12'hb5a;
              4'h9: boundary_low = 12'hb56;
              4'ha: boundary_low = 12'hb53;
              4'hb: boundary_low = 12'hb50;
              4'hc: boundary_low = 12'hb4c;
              4'hd: boundary_low = 12'hb49;
              4'he: boundary_low = 12'hb46;
              4'hf: boundary_low = 12'hb42;
              default: boundary_low = 12'h000;
            endcase
          end
          6'h29: begin
            case (mant[3:0])
              4'h0: boundary_low = 12'hb3f;
              4'h1: boundary_low = 12'hb3c;
              4'h2: boundary_low = 12'hb38;
              4'h3: boundary_low = 12'hb35;
              4'h4: boundary_low = 12'hb32;
              4'h5: boundary_low = 12'hb2f;
              4'h6: boundary_low = 12'hb2b;
              4'h7: boundary_low = 12'hb28;
              4'h8: boundary_low = 12'hb25;
              4'h9: boundary_low = 12'hb22;
              4'ha: boundary_low = 12'hb1e;
              4'hb: boundary_low = 12'hb1b;
              4'hc: boundary_low = 12'hb18;
              4'hd: boundary_low = 12'hb15;
              4'he: boundary_low = 12'hb11;
              4'hf: boundary_low = 12'hb0e;
              default: boundary_low = 12'h000;
            endcase
          end
          6'h2a: begin
            case (mant[3:0])
              4'h0: boundary_low = 12'hb0b;
              4'h1: boundary_low = 12'hb08;
              4'h2: boundary_low = 12'hb05;
              4'h3: boundary_low = 12'hb02;
              4'h4: boundary_low = 12'hafe;
              4'h5: boundary_low = 12'hafb;
              4'h6: boundary_low = 12'haf8;
              4'h7: boundary_low = 12'haf5;
              4'h8: boundary_low = 12'haf2;
              4'h9: boundary_low = 12'haef;
              4'ha: boundary_low = 12'haec;
              4'hb: boundary_low = 12'hae8;
              4'hc: boundary_low = 12'hae5;
              4'hd: boundary_low = 12'hae2;
              4'he: boundary_low = 12'hadf;
              4'hf: boundary_low = 12'hadc;
              default: boundary_low = 12'h000;
            endcase
          end
          6'h2b: begin
            case (mant[3:0])
              4'h0: boundary_low = 12'had9;
              4'h1: boundary_low = 12'had6;
              4'h2: boundary_low = 12'had3;
              4'h3: boundary_low = 12'had0;
              4'h4: boundary_low = 12'hacd;
              4'h5: boundary_low = 12'haca;
              4'h6: boundary_low = 12'hac7;
              4'h7: boundary_low = 12'hac4;
              4'h8: boundary_low = 12'hac1;
              4'h9: boundary_low = 12'habe;
              4'ha: boundary_low = 12'habb;
              4'hb: boundary_low = 12'hab8;
              4'hc: boundary_low = 12'hab5;
              4'hd: boundary_low = 12'hab2;
              4'he: boundary_low = 12'haaf;
              4'hf: boundary_low = 12'haac;
              default: boundary_low = 12'h000;
            endcase
          end
          6'h2c: begin
            case (mant[3:0])
              4'h0: boundary_low = 12'haa9;
              4'h1: boundary_low = 12'haa6;
              4'h2: boundary_low = 12'haa3;
              4'h3: boundary_low = 12'haa0;
              4'h4: boundary_low = 12'ha9d;
              4'h5: boundary_low = 12'ha9a;
              4'h6: boundary_low = 12'ha97;
              4'h7: boundary_low = 12'ha94;
              4'h8: boundary_low = 12'ha91;
              4'h9: boundary_low = 12'ha8e;
              4'ha: boundary_low = 12'ha8b;
              4'hb: boundary_low = 12'ha89;
              4'hc: boundary_low = 12'ha86;
              4'hd: boundary_low = 12'ha83;
              4'he: boundary_low = 12'ha80;
              4'hf: boundary_low = 12'ha7d;
              default: boundary_low = 12'h000;
            endcase
          end
          6'h2d: begin
            case (mant[3:0])
              4'h0: boundary_low = 12'ha7a;
              4'h1: boundary_low = 12'ha77;
              4'h2: boundary_low = 12'ha75;
              4'h3: boundary_low = 12'ha72;
              4'h4: boundary_low = 12'ha6f;
              4'h5: boundary_low = 12'ha6c;
              4'h6: boundary_low = 12'ha69;
              4'h7: boundary_low = 12'ha66;
              4'h8: boundary_low = 12'ha64;
              4'h9: boundary_low = 12'ha61;
              4'ha: boundary_low = 12'ha5e;
              4'hb: boundary_low = 12'ha5b;
              4'hc: boundary_low = 12'ha58;
              4'hd: boundary_low = 12'ha56;
              4'he: boundary_low = 12'ha53;
              4'hf: boundary_low = 12'ha50;
              default: boundary_low = 12'h000;
            endcase
          end
          6'h2e: begin
            case (mant[3:0])
              4'h0: boundary_low = 12'ha4d;
              4'h1: boundary_low = 12'ha4b;
              4'h2: boundary_low = 12'ha48;
              4'h3: boundary_low = 12'ha45;
              4'h4: boundary_low = 12'ha42;
              4'h5: boundary_low = 12'ha40;
              4'h6: boundary_low = 12'ha3d;
              4'h7: boundary_low = 12'ha3a;
              4'h8: boundary_low = 12'ha38;
              4'h9: boundary_low = 12'ha35;
              4'ha: boundary_low = 12'ha32;
              4'hb: boundary_low = 12'ha30;
              4'hc: boundary_low = 12'ha2d;
              4'hd: boundary_low = 12'ha2a;
              4'he: boundary_low = 12'ha28;
              4'hf: boundary_low = 12'ha25;
              default: boundary_low = 12'h000;
            endcase
          end
          6'h2f: begin
            case (mant[3:0])
              4'h0: boundary_low = 12'ha22;
              4'h1: boundary_low = 12'ha20;
              4'h2: boundary_low = 12'ha1d;
              4'h3: boundary_low = 12'ha1a;
              4'h4: boundary_low = 12'ha18;
              4'h5: boundary_low = 12'ha15;
              4'h6: boundary_low = 12'ha12;
              4'h7: boundary_low = 12'ha10;
              4'h8: boundary_low = 12'ha0d;
              4'h9: boundary_low = 12'ha0b;
              4'ha: boundary_low = 12'ha08;
              4'hb: boundary_low = 12'ha05;
              4'hc: boundary_low = 12'ha03;
              4'hd: boundary_low = 12'ha00;
              4'he: boundary_low = 12'h9fe;
              4'hf: boundary_low = 12'h9fb;
              default: boundary_low = 12'h000;
            endcase
          end
          6'h30: begin
            case (mant[3:0])
              4'h0: boundary_low = 12'h9f9;
              4'h1: boundary_low = 12'h9f6;
              4'h2: boundary_low = 12'h9f3;
              4'h3: boundary_low = 12'h9f1;
              4'h4: boundary_low = 12'h9ee;
              4'h5: boundary_low = 12'h9ec;
              4'h6: boundary_low = 12'h9e9;
              4'h7: boundary_low = 12'h9e7;
              4'h8: boundary_low = 12'h9e4;
              4'h9: boundary_low = 12'h9e2;
              4'ha: boundary_low = 12'h9df;
              4'hb: boundary_low = 12'h9dd;
              4'hc: boundary_low = 12'h9da;
              4'hd: boundary_low = 12'h9d8;
              4'he: boundary_low = 12'h9d5;
              4'hf: boundary_low = 12'h9d3;
              default: boundary_low = 12'h000;
            endcase
          end
          6'h31: begin
            case (mant[3:0])
              4'h0: boundary_low = 12'h9d0;
              4'h1: boundary_low = 12'h9ce;
              4'h2: boundary_low = 12'h9cb;
              4'h3: boundary_low = 12'h9c9;
              4'h4: boundary_low = 12'h9c6;
              4'h5: boundary_low = 12'h9c4;
              4'h6: boundary_low = 12'h9c2;
              4'h7: boundary_low = 12'h9bf;
              4'h8: boundary_low = 12'h9bd;
              4'h9: boundary_low = 12'h9ba;
              4'ha: boundary_low = 12'h9b8;
              4'hb: boundary_low = 12'h9b5;
              4'hc: boundary_low = 12'h9b3;
              4'hd: boundary_low = 12'h9b1;
              4'he: boundary_low = 12'h9ae;
              4'hf: boundary_low = 12'h9ac;
              default: boundary_low = 12'h000;
            endcase
          end
          6'h32: begin
            case (mant[3:0])
              4'h0: boundary_low = 12'h9a9;
              4'h1: boundary_low = 12'h9a7;
              4'h2: boundary_low = 12'h9a5;
              4'h3: boundary_low = 12'h9a2;
              4'h4: boundary_low = 12'h9a0;
              4'h5: boundary_low = 12'h99e;
              4'h6: boundary_low = 12'h99b;
              4'h7: boundary_low = 12'h999;
              4'h8: boundary_low = 12'h997;
              4'h9: boundary_low = 12'h994;
              4'ha: boundary_low = 12'h992;
              4'hb: boundary_low = 12'h990;
              4'hc: boundary_low = 12'h98d;
              4'hd: boundary_low = 12'h98b;
              4'he: boundary_low = 12'h989;
              4'hf: boundary_low = 12'h986;
              default: boundary_low = 12'h000;
            endcase
          end
          6'h33: begin
            case (mant[3:0])
              4'h0: boundary_low = 12'h984;
              4'h1: boundary_low = 12'h982;
              4'h2: boundary_low = 12'h97f;
              4'h3: boundary_low = 12'h97d;
              4'h4: boundary_low = 12'h97b;
              4'h5: boundary_low = 12'h979;
              4'h6: boundary_low = 12'h976;
              4'h7: boundary_low = 12'h974;
              4'h8: boundary_low = 12'h972;
              4'h9: boundary_low = 12'h96f;
              4'ha: boundary_low = 12'h96d;
              4'hb: boundary_low = 12'h96b;
              4'hc: boundary_low = 12'h969;
              4'hd: boundary_low = 12'h966;
              4'he: boundary_low = 12'h964;
              4'hf: boundary_low = 12'h962;
              default: boundary_low = 12'h000;
            endcase
          end
          6'h34: begin
            case (mant[3:0])
              4'h0: boundary_low = 12'h960;
              4'h1: boundary_low = 12'h95e;
              4'h2: boundary_low = 12'h95b;
              4'h3: boundary_low = 12'h959;
              4'h4: boundary_low = 12'h957;
              4'h5: boundary_low = 12'h955;
              4'h6: boundary_low = 12'h953;
              4'h7: boundary_low = 12'h950;
              4'h8: boundary_low = 12'h94e;
              4'h9: boundary_low = 12'h94c;
              4'ha: boundary_low = 12'h94a;
              4'hb: boundary_low = 12'h948;
              4'hc: boundary_low = 12'h945;
              4'hd: boundary_low = 12'h943;
              4'he: boundary_low = 12'h941;
              4'hf: boundary_low = 12'h93f;
              default: boundary_low = 12'h000;
            endcase
          end
          6'h35: begin
            case (mant[3:0])
              4'h0: boundary_low = 12'h93d;
              4'h1: boundary_low = 12'h93b;
              4'h2: boundary_low = 12'h939;
              4'h3: boundary_low = 12'h936;
              4'h4: boundary_low = 12'h934;
              4'h5: boundary_low = 12'h932;
              4'h6: boundary_low = 12'h930;
              4'h7: boundary_low = 12'h92e;
              4'h8: boundary_low = 12'h92c;
              4'h9: boundary_low = 12'h92a;
              4'ha: boundary_low = 12'h928;
              4'hb: boundary_low = 12'h925;
              4'hc: boundary_low = 12'h923;
              4'hd: boundary_low = 12'h921;
              4'he: boundary_low = 12'h91f;
              4'hf: boundary_low = 12'h91d;
              default: boundary_low = 12'h000;
            endcase
          end
          6'h36: begin
            case (mant[3:0])
              4'h0: boundary_low = 12'h91b;
              4'h1: boundary_low = 12'h919;
              4'h2: boundary_low = 12'h917;
              4'h3: boundary_low = 12'h915;
              4'h4: boundary_low = 12'h913;
              4'h5: boundary_low = 12'h911;
              4'h6: boundary_low = 12'h90f;
              4'h7: boundary_low = 12'h90d;
              4'h8: boundary_low = 12'h90b;
              4'h9: boundary_low = 12'h909;
              4'ha: boundary_low = 12'h906;
              4'hb: boundary_low = 12'h904;
              4'hc: boundary_low = 12'h902;
              4'hd: boundary_low = 12'h900;
              4'he: boundary_low = 12'h8fe;
              4'hf: boundary_low = 12'h8fc;
              default: boundary_low = 12'h000;
            endcase
          end
          6'h37: begin
            case (mant[3:0])
              4'h0: boundary_low = 12'h8fa;
              4'h1: boundary_low = 12'h8f8;
              4'h2: boundary_low = 12'h8f6;
              4'h3: boundary_low = 12'h8f4;
              4'h4: boundary_low = 12'h8f2;
              4'h5: boundary_low = 12'h8f0;
              4'h6: boundary_low = 12'h8ee;
              4'h7: boundary_low = 12'h8ec;
              4'h8: boundary_low = 12'h8ea;
              4'h9: boundary_low = 12'h8e8;
              4'ha: boundary_low = 12'h8e6;
              4'hb: boundary_low = 12'h8e5;
              4'hc: boundary_low = 12'h8e3;
              4'hd: boundary_low = 12'h8e1;
              4'he: boundary_low = 12'h8df;
              4'hf: boundary_low = 12'h8dd;
              default: boundary_low = 12'h000;
            endcase
          end
          6'h38: begin
            case (mant[3:0])
              4'h0: boundary_low = 12'h8db;
              4'h1: boundary_low = 12'h8d9;
              4'h2: boundary_low = 12'h8d7;
              4'h3: boundary_low = 12'h8d5;
              4'h4: boundary_low = 12'h8d3;
              4'h5: boundary_low = 12'h8d1;
              4'h6: boundary_low = 12'h8cf;
              4'h7: boundary_low = 12'h8cd;
              4'h8: boundary_low = 12'h8cb;
              4'h9: boundary_low = 12'h8c9;
              4'ha: boundary_low = 12'h8c8;
              4'hb: boundary_low = 12'h8c6;
              4'hc: boundary_low = 12'h8c4;
              4'hd: boundary_low = 12'h8c2;
              4'he: boundary_low = 12'h8c0;
              4'hf: boundary_low = 12'h8be;
              default: boundary_low = 12'h000;
            endcase
          end
          6'h39: begin
            case (mant[3:0])
              4'h0: boundary_low = 12'h8bc;
              4'h1: boundary_low = 12'h8ba;
              4'h2: boundary_low = 12'h8b8;
              4'h3: boundary_low = 12'h8b7;
              4'h4: boundary_low = 12'h8b5;
              4'h5: boundary_low = 12'h8b3;
              4'h6: boundary_low = 12'h8b1;
              4'h7: boundary_low = 12'h8af;
              4'h8: boundary_low = 12'h8ad;
              4'h9: boundary_low = 12'h8ab;
              4'ha: boundary_low = 12'h8aa;
              4'hb: boundary_low = 12'h8a8;
              4'hc: boundary_low = 12'h8a6;
              4'hd: boundary_low = 12'h8a4;
              4'he: boundary_low = 12'h8a2;
              4'hf: boundary_low = 12'h8a0;
              default: boundary_low = 12'h000;
            endcase
          end
          6'h3a: begin
            case (mant[3:0])
              4'h0: boundary_low = 12'h89f;
              4'h1: boundary_low = 12'h89d;
              4'h2: boundary_low = 12'h89b;
              4'h3: boundary_low = 12'h899;
              4'h4: boundary_low = 12'h897;
              4'h5: boundary_low = 12'h896;
              4'h6: boundary_low = 12'h894;
              4'h7: boundary_low = 12'h892;
              4'h8: boundary_low = 12'h890;
              4'h9: boundary_low = 12'h88e;
              4'ha: boundary_low = 12'h88d;
              4'hb: boundary_low = 12'h88b;
              4'hc: boundary_low = 12'h889;
              4'hd: boundary_low = 12'h887;
              4'he: boundary_low = 12'h886;
              4'hf: boundary_low = 12'h884;
              default: boundary_low = 12'h000;
            endcase
          end
          6'h3b: begin
            case (mant[3:0])
              4'h0: boundary_low = 12'h882;
              4'h1: boundary_low = 12'h880;
              4'h2: boundary_low = 12'h87f;
              4'h3: boundary_low = 12'h87d;
              4'h4: boundary_low = 12'h87b;
              4'h5: boundary_low = 12'h879;
              4'h6: boundary_low = 12'h878;
              4'h7: boundary_low = 12'h876;
              4'h8: boundary_low = 12'h874;
              4'h9: boundary_low = 12'h872;
              4'ha: boundary_low = 12'h871;
              4'hb: boundary_low = 12'h86f;
              4'hc: boundary_low = 12'h86d;
              4'hd: boundary_low = 12'h86b;
              4'he: boundary_low = 12'h86a;
              4'hf: boundary_low = 12'h868;
              default: boundary_low = 12'h000;
            endcase
          end
          6'h3c: begin
            case (mant[3:0])
              4'h0: boundary_low = 12'h866;
              4'h1: boundary_low = 12'h865;
              4'h2: boundary_low = 12'h863;
              4'h3: boundary_low = 12'h861;
              4'h4: boundary_low = 12'h860;
              4'h5: boundary_low = 12'h85e;
              4'h6: boundary_low = 12'h85c;
              4'h7: boundary_low = 12'h85a;
              4'h8: boundary_low = 12'h859;
              4'h9: boundary_low = 12'h857;
              4'ha: boundary_low = 12'h855;
              4'hb: boundary_low = 12'h854;
              4'hc: boundary_low = 12'h852;
              4'hd: boundary_low = 12'h850;
              4'he: boundary_low = 12'h84f;
              4'hf: boundary_low = 12'h84d;
              default: boundary_low = 12'h000;
            endcase
          end
          6'h3d: begin
            case (mant[3:0])
              4'h0: boundary_low = 12'h84c;
              4'h1: boundary_low = 12'h84a;
              4'h2: boundary_low = 12'h848;
              4'h3: boundary_low = 12'h847;
              4'h4: boundary_low = 12'h845;
              4'h5: boundary_low = 12'h843;
              4'h6: boundary_low = 12'h842;
              4'h7: boundary_low = 12'h840;
              4'h8: boundary_low = 12'h83e;
              4'h9: boundary_low = 12'h83d;
              4'ha: boundary_low = 12'h83b;
              4'hb: boundary_low = 12'h83a;
              4'hc: boundary_low = 12'h838;
              4'hd: boundary_low = 12'h836;
              4'he: boundary_low = 12'h835;
              4'hf: boundary_low = 12'h833;
              default: boundary_low = 12'h000;
            endcase
          end
          6'h3e: begin
            case (mant[3:0])
              4'h0: boundary_low = 12'h832;
              4'h1: boundary_low = 12'h830;
              4'h2: boundary_low = 12'h82e;
              4'h3: boundary_low = 12'h82d;
              4'h4: boundary_low = 12'h82b;
              4'h5: boundary_low = 12'h82a;
              4'h6: boundary_low = 12'h828;
              4'h7: boundary_low = 12'h826;
              4'h8: boundary_low = 12'h825;
              4'h9: boundary_low = 12'h823;
              4'ha: boundary_low = 12'h822;
              4'hb: boundary_low = 12'h820;
              4'hc: boundary_low = 12'h81f;
              4'hd: boundary_low = 12'h81d;
              4'he: boundary_low = 12'h81b;
              4'hf: boundary_low = 12'h81a;
              default: boundary_low = 12'h000;
            endcase
          end
          6'h3f: begin
            case (mant[3:0])
              4'h0: boundary_low = 12'h818;
              4'h1: boundary_low = 12'h817;
              4'h2: boundary_low = 12'h815;
              4'h3: boundary_low = 12'h814;
              4'h4: boundary_low = 12'h812;
              4'h5: boundary_low = 12'h811;
              4'h6: boundary_low = 12'h80f;
              4'h7: boundary_low = 12'h80e;
              4'h8: boundary_low = 12'h80c;
              4'h9: boundary_low = 12'h80b;
              4'ha: boundary_low = 12'h809;
              4'hb: boundary_low = 12'h808;
              4'hc: boundary_low = 12'h806;
              4'hd: boundary_low = 12'h805;
              4'he: boundary_low = 12'h803;
              4'hf: boundary_low = 12'h802;
              default: boundary_low = 12'h000;
            endcase
          end
          default: boundary_low = 12'h000;
        endcase
      end
      5'h13: begin
        case (mant[9:4])
          6'h00: begin
            case (mant[3:0])
              4'h0: boundary_low = 12'hc00;
              4'h1: boundary_low = 12'hbfa;
              4'h2: boundary_low = 12'hbf4;
              4'h3: boundary_low = 12'hbee;
              4'h4: boundary_low = 12'hbe8;
              4'h5: boundary_low = 12'hbe2;
              4'h6: boundary_low = 12'hbdc;
              4'h7: boundary_low = 12'hbd7;
              4'h8: boundary_low = 12'hbd1;
              4'h9: boundary_low = 12'hbcb;
              4'ha: boundary_low = 12'hbc5;
              4'hb: boundary_low = 12'hbbf;
              4'hc: boundary_low = 12'hbba;
              4'hd: boundary_low = 12'hbb4;
              4'he: boundary_low = 12'hbae;
              4'hf: boundary_low = 12'hba9;
              default: boundary_low = 12'h000;
            endcase
          end
          6'h01: begin
            case (mant[3:0])
              4'h0: boundary_low = 12'hba3;
              4'h1: boundary_low = 12'hb9d;
              4'h2: boundary_low = 12'hb98;
              4'h3: boundary_low = 12'hb92;
              4'h4: boundary_low = 12'hb8d;
              4'h5: boundary_low = 12'hb87;
              4'h6: boundary_low = 12'hb81;
              4'h7: boundary_low = 12'hb7c;
              4'h8: boundary_low = 12'hb76;
              4'h9: boundary_low = 12'hb71;
              4'ha: boundary_low = 12'hb6c;
              4'hb: boundary_low = 12'hb66;
              4'hc: boundary_low = 12'hb61;
              4'hd: boundary_low = 12'hb5b;
              4'he: boundary_low = 12'hb56;
              4'hf: boundary_low = 12'hb51;
              default: boundary_low = 12'h000;
            endcase
          end
          6'h02: begin
            case (mant[3:0])
              4'h0: boundary_low = 12'hb4b;
              4'h1: boundary_low = 12'hb46;
              4'h2: boundary_low = 12'hb41;
              4'h3: boundary_low = 12'hb3c;
              4'h4: boundary_low = 12'hb36;
              4'h5: boundary_low = 12'hb31;
              4'h6: boundary_low = 12'hb2c;
              4'h7: boundary_low = 12'hb27;
              4'h8: boundary_low = 12'hb22;
              4'h9: boundary_low = 12'hb1c;
              4'ha: boundary_low = 12'hb17;
              4'hb: boundary_low = 12'hb12;
              4'hc: boundary_low = 12'hb0d;
              4'hd: boundary_low = 12'hb08;
              4'he: boundary_low = 12'hb03;
              4'hf: boundary_low = 12'hafe;
              default: boundary_low = 12'h000;
            endcase
          end
          6'h03: begin
            case (mant[3:0])
              4'h0: boundary_low = 12'haf9;
              4'h1: boundary_low = 12'haf4;
              4'h2: boundary_low = 12'haef;
              4'h3: boundary_low = 12'haea;
              4'h4: boundary_low = 12'hae5;
              4'h5: boundary_low = 12'hae0;
              4'h6: boundary_low = 12'hadb;
              4'h7: boundary_low = 12'had7;
              4'h8: boundary_low = 12'had2;
              4'h9: boundary_low = 12'hacd;
              4'ha: boundary_low = 12'hac8;
              4'hb: boundary_low = 12'hac3;
              4'hc: boundary_low = 12'habe;
              4'hd: boundary_low = 12'haba;
              4'he: boundary_low = 12'hab5;
              4'hf: boundary_low = 12'hab0;
              default: boundary_low = 12'h000;
            endcase
          end
          6'h04: begin
            case (mant[3:0])
              4'h0: boundary_low = 12'haab;
              4'h1: boundary_low = 12'haa7;
              4'h2: boundary_low = 12'haa2;
              4'h3: boundary_low = 12'ha9d;
              4'h4: boundary_low = 12'ha99;
              4'h5: boundary_low = 12'ha94;
              4'h6: boundary_low = 12'ha8f;
              4'h7: boundary_low = 12'ha8b;
              4'h8: boundary_low = 12'ha86;
              4'h9: boundary_low = 12'ha82;
              4'ha: boundary_low = 12'ha7d;
              4'hb: boundary_low = 12'ha79;
              4'hc: boundary_low = 12'ha74;
              4'hd: boundary_low = 12'ha70;
              4'he: boundary_low = 12'ha6b;
              4'hf: boundary_low = 12'ha67;
              default: boundary_low = 12'h000;
            endcase
          end
          6'h05: begin
            case (mant[3:0])
              4'h0: boundary_low = 12'ha62;
              4'h1: boundary_low = 12'ha5e;
              4'h2: boundary_low = 12'ha59;
              4'h3: boundary_low = 12'ha55;
              4'h4: boundary_low = 12'ha51;
              4'h5: boundary_low = 12'ha4c;
              4'h6: boundary_low = 12'ha48;
              4'h7: boundary_low = 12'ha44;
              4'h8: boundary_low = 12'ha3f;
              4'h9: boundary_low = 12'ha3b;
              4'ha: boundary_low = 12'ha37;
              4'hb: boundary_low = 12'ha32;
              4'hc: boundary_low = 12'ha2e;
              4'hd: boundary_low = 12'ha2a;
              4'he: boundary_low = 12'ha26;
              4'hf: boundary_low = 12'ha21;
              default: boundary_low = 12'h000;
            endcase
          end
          6'h06: begin
            case (mant[3:0])
              4'h0: boundary_low = 12'ha1d;
              4'h1: boundary_low = 12'ha19;
              4'h2: boundary_low = 12'ha15;
              4'h3: boundary_low = 12'ha11;
              4'h4: boundary_low = 12'ha0d;
              4'h5: boundary_low = 12'ha08;
              4'h6: boundary_low = 12'ha04;
              4'h7: boundary_low = 12'ha00;
              4'h8: boundary_low = 12'h9fc;
              4'h9: boundary_low = 12'h9f8;
              4'ha: boundary_low = 12'h9f4;
              4'hb: boundary_low = 12'h9f0;
              4'hc: boundary_low = 12'h9ec;
              4'hd: boundary_low = 12'h9e8;
              4'he: boundary_low = 12'h9e4;
              4'hf: boundary_low = 12'h9e0;
              default: boundary_low = 12'h000;
            endcase
          end
          6'h07: begin
            case (mant[3:0])
              4'h0: boundary_low = 12'h9dc;
              4'h1: boundary_low = 12'h9d8;
              4'h2: boundary_low = 12'h9d4;
              4'h3: boundary_low = 12'h9d0;
              4'h4: boundary_low = 12'h9cc;
              4'h5: boundary_low = 12'h9c8;
              4'h6: boundary_low = 12'h9c4;
              4'h7: boundary_low = 12'h9c1;
              4'h8: boundary_low = 12'h9bd;
              4'h9: boundary_low = 12'h9b9;
              4'ha: boundary_low = 12'h9b5;
              4'hb: boundary_low = 12'h9b1;
              4'hc: boundary_low = 12'h9ad;
              4'hd: boundary_low = 12'h9aa;
              4'he: boundary_low = 12'h9a6;
              4'hf: boundary_low = 12'h9a2;
              default: boundary_low = 12'h000;
            endcase
          end
          6'h08: begin
            case (mant[3:0])
              4'h0: boundary_low = 12'h99e;
              4'h1: boundary_low = 12'h99b;
              4'h2: boundary_low = 12'h997;
              4'h3: boundary_low = 12'h993;
              4'h4: boundary_low = 12'h98f;
              4'h5: boundary_low = 12'h98c;
              4'h6: boundary_low = 12'h988;
              4'h7: boundary_low = 12'h984;
              4'h8: boundary_low = 12'h981;
              4'h9: boundary_low = 12'h97d;
              4'ha: boundary_low = 12'h97a;
              4'hb: boundary_low = 12'h976;
              4'hc: boundary_low = 12'h972;
              4'hd: boundary_low = 12'h96f;
              4'he: boundary_low = 12'h96b;
              4'hf: boundary_low = 12'h968;
              default: boundary_low = 12'h000;
            endcase
          end
          6'h09: begin
            case (mant[3:0])
              4'h0: boundary_low = 12'h964;
              4'h1: boundary_low = 12'h961;
              4'h2: boundary_low = 12'h95d;
              4'h3: boundary_low = 12'h959;
              4'h4: boundary_low = 12'h956;
              4'h5: boundary_low = 12'h952;
              4'h6: boundary_low = 12'h94f;
              4'h7: boundary_low = 12'h94c;
              4'h8: boundary_low = 12'h948;
              4'h9: boundary_low = 12'h945;
              4'ha: boundary_low = 12'h941;
              4'hb: boundary_low = 12'h93e;
              4'hc: boundary_low = 12'h93a;
              4'hd: boundary_low = 12'h937;
              4'he: boundary_low = 12'h934;
              4'hf: boundary_low = 12'h930;
              default: boundary_low = 12'h000;
            endcase
          end
          6'h0a: begin
            case (mant[3:0])
              4'h0: boundary_low = 12'h92d;
              4'h1: boundary_low = 12'h92a;
              4'h2: boundary_low = 12'h926;
              4'h3: boundary_low = 12'h923;
              4'h4: boundary_low = 12'h920;
              4'h5: boundary_low = 12'h91c;
              4'h6: boundary_low = 12'h919;
              4'h7: boundary_low = 12'h916;
              4'h8: boundary_low = 12'h912;
              4'h9: boundary_low = 12'h90f;
              4'ha: boundary_low = 12'h90c;
              4'hb: boundary_low = 12'h909;
              4'hc: boundary_low = 12'h905;
              4'hd: boundary_low = 12'h902;
              4'he: boundary_low = 12'h8ff;
              4'hf: boundary_low = 12'h8fc;
              default: boundary_low = 12'h000;
            endcase
          end
          6'h0b: begin
            case (mant[3:0])
              4'h0: boundary_low = 12'h8f9;
              4'h1: boundary_low = 12'h8f5;
              4'h2: boundary_low = 12'h8f2;
              4'h3: boundary_low = 12'h8ef;
              4'h4: boundary_low = 12'h8ec;
              4'h5: boundary_low = 12'h8e9;
              4'h6: boundary_low = 12'h8e6;
              4'h7: boundary_low = 12'h8e3;
              4'h8: boundary_low = 12'h8df;
              4'h9: boundary_low = 12'h8dc;
              4'ha: boundary_low = 12'h8d9;
              4'hb: boundary_low = 12'h8d6;
              4'hc: boundary_low = 12'h8d3;
              4'hd: boundary_low = 12'h8d0;
              4'he: boundary_low = 12'h8cd;
              4'hf: boundary_low = 12'h8ca;
              default: boundary_low = 12'h000;
            endcase
          end
          6'h0c: begin
            case (mant[3:0])
              4'h0: boundary_low = 12'h8c7;
              4'h1: boundary_low = 12'h8c4;
              4'h2: boundary_low = 12'h8c1;
              4'h3: boundary_low = 12'h8be;
              4'h4: boundary_low = 12'h8bb;
              4'h5: boundary_low = 12'h8b8;
              4'h6: boundary_low = 12'h8b5;
              4'h7: boundary_low = 12'h8b2;
              4'h8: boundary_low = 12'h8af;
              4'h9: boundary_low = 12'h8ac;
              4'ha: boundary_low = 12'h8a9;
              4'hb: boundary_low = 12'h8a6;
              4'hc: boundary_low = 12'h8a4;
              4'hd: boundary_low = 12'h8a1;
              4'he: boundary_low = 12'h89e;
              4'hf: boundary_low = 12'h89b;
              default: boundary_low = 12'h000;
            endcase
          end
          6'h0d: begin
            case (mant[3:0])
              4'h0: boundary_low = 12'h898;
              4'h1: boundary_low = 12'h895;
              4'h2: boundary_low = 12'h892;
              4'h3: boundary_low = 12'h88f;
              4'h4: boundary_low = 12'h88d;
              4'h5: boundary_low = 12'h88a;
              4'h6: boundary_low = 12'h887;
              4'h7: boundary_low = 12'h884;
              4'h8: boundary_low = 12'h881;
              4'h9: boundary_low = 12'h87f;
              4'ha: boundary_low = 12'h87c;
              4'hb: boundary_low = 12'h879;
              4'hc: boundary_low = 12'h876;
              4'hd: boundary_low = 12'h874;
              4'he: boundary_low = 12'h871;
              4'hf: boundary_low = 12'h86e;
              default: boundary_low = 12'h000;
            endcase
          end
          6'h0e: begin
            case (mant[3:0])
              4'h0: boundary_low = 12'h86b;
              4'h1: boundary_low = 12'h869;
              4'h2: boundary_low = 12'h866;
              4'h3: boundary_low = 12'h863;
              4'h4: boundary_low = 12'h861;
              4'h5: boundary_low = 12'h85e;
              4'h6: boundary_low = 12'h85b;
              4'h7: boundary_low = 12'h858;
              4'h8: boundary_low = 12'h856;
              4'h9: boundary_low = 12'h853;
              4'ha: boundary_low = 12'h851;
              4'hb: boundary_low = 12'h84e;
              4'hc: boundary_low = 12'h84b;
              4'hd: boundary_low = 12'h849;
              4'he: boundary_low = 12'h846;
              4'hf: boundary_low = 12'h843;
              default: boundary_low = 12'h000;
            endcase
          end
          6'h0f: begin
            case (mant[3:0])
              4'h0: boundary_low = 12'h841;
              4'h1: boundary_low = 12'h83e;
              4'h2: boundary_low = 12'h83c;
              4'h3: boundary_low = 12'h839;
              4'h4: boundary_low = 12'h837;
              4'h5: boundary_low = 12'h834;
              4'h6: boundary_low = 12'h832;
              4'h7: boundary_low = 12'h82f;
              4'h8: boundary_low = 12'h82c;
              4'h9: boundary_low = 12'h82a;
              4'ha: boundary_low = 12'h827;
              4'hb: boundary_low = 12'h825;
              4'hc: boundary_low = 12'h822;
              4'hd: boundary_low = 12'h820;
              4'he: boundary_low = 12'h81e;
              4'hf: boundary_low = 12'h81b;
              default: boundary_low = 12'h000;
            endcase
          end
          6'h10: begin
            case (mant[3:0])
              4'h0: boundary_low = 12'h819;
              4'h1: boundary_low = 12'h816;
              4'h2: boundary_low = 12'h814;
              4'h3: boundary_low = 12'h811;
              4'h4: boundary_low = 12'h80f;
              4'h5: boundary_low = 12'h80c;
              4'h6: boundary_low = 12'h80a;
              4'h7: boundary_low = 12'h808;
              4'h8: boundary_low = 12'h805;
              4'h9: boundary_low = 12'h803;
              4'ha: boundary_low = 12'h800;
              4'hb: boundary_low = 12'h7fc;
              4'hc: boundary_low = 12'h7f7;
              4'hd: boundary_low = 12'h7f3;
              4'he: boundary_low = 12'h7ee;
              4'hf: boundary_low = 12'h7e9;
              default: boundary_low = 12'h000;
            endcase
          end
          6'h11: begin
            case (mant[3:0])
              4'h0: boundary_low = 12'h7e4;
              4'h1: boundary_low = 12'h7e0;
              4'h2: boundary_low = 12'h7db;
              4'h3: boundary_low = 12'h7d6;
              4'h4: boundary_low = 12'h7d2;
              4'h5: boundary_low = 12'h7cd;
              4'h6: boundary_low = 12'h7c9;
              4'h7: boundary_low = 12'h7c4;
              4'h8: boundary_low = 12'h7bf;
              4'h9: boundary_low = 12'h7bb;
              4'ha: boundary_low = 12'h7b6;
              4'hb: boundary_low = 12'h7b2;
              4'hc: boundary_low = 12'h7ad;
              4'hd: boundary_low = 12'h7a9;
              4'he: boundary_low = 12'h7a4;
              4'hf: boundary_low = 12'h7a0;
              default: boundary_low = 12'h000;
            endcase
          end
          6'h12: begin
            case (mant[3:0])
              4'h0: boundary_low = 12'h79b;
              4'h1: boundary_low = 12'h797;
              4'h2: boundary_low = 12'h793;
              4'h3: boundary_low = 12'h78e;
              4'h4: boundary_low = 12'h78a;
              4'h5: boundary_low = 12'h785;
              4'h6: boundary_low = 12'h781;
              4'h7: boundary_low = 12'h77d;
              4'h8: boundary_low = 12'h778;
              4'h9: boundary_low = 12'h774;
              4'ha: boundary_low = 12'h770;
              4'hb: boundary_low = 12'h76b;
              4'hc: boundary_low = 12'h767;
              4'hd: boundary_low = 12'h763;
              4'he: boundary_low = 12'h75e;
              4'hf: boundary_low = 12'h75a;
              default: boundary_low = 12'h000;
            endcase
          end
          6'h13: begin
            case (mant[3:0])
              4'h0: boundary_low = 12'h756;
              4'h1: boundary_low = 12'h752;
              4'h2: boundary_low = 12'h74d;
              4'h3: boundary_low = 12'h749;
              4'h4: boundary_low = 12'h745;
              4'h5: boundary_low = 12'h741;
              4'h6: boundary_low = 12'h73d;
              4'h7: boundary_low = 12'h738;
              4'h8: boundary_low = 12'h734;
              4'h9: boundary_low = 12'h730;
              4'ha: boundary_low = 12'h72c;
              4'hb: boundary_low = 12'h728;
              4'hc: boundary_low = 12'h724;
              4'hd: boundary_low = 12'h720;
              4'he: boundary_low = 12'h71c;
              4'hf: boundary_low = 12'h718;
              default: boundary_low = 12'h000;
            endcase
          end
          6'h14: begin
            case (mant[3:0])
              4'h0: boundary_low = 12'h714;
              4'h1: boundary_low = 12'h710;
              4'h2: boundary_low = 12'h70c;
              4'h3: boundary_low = 12'h708;
              4'h4: boundary_low = 12'h704;
              4'h5: boundary_low = 12'h700;
              4'h6: boundary_low = 12'h6fc;
              4'h7: boundary_low = 12'h6f8;
              4'h8: boundary_low = 12'h6f4;
              4'h9: boundary_low = 12'h6f0;
              4'ha: boundary_low = 12'h6ec;
              4'hb: boundary_low = 12'h6e8;
              4'hc: boundary_low = 12'h6e4;
              4'hd: boundary_low = 12'h6e0;
              4'he: boundary_low = 12'h6dc;
              4'hf: boundary_low = 12'h6d8;
              default: boundary_low = 12'h000;
            endcase
          end
          6'h15: begin
            case (mant[3:0])
              4'h0: boundary_low = 12'h6d4;
              4'h1: boundary_low = 12'h6d1;
              4'h2: boundary_low = 12'h6cd;
              4'h3: boundary_low = 12'h6c9;
              4'h4: boundary_low = 12'h6c5;
              4'h5: boundary_low = 12'h6c1;
              4'h6: boundary_low = 12'h6bd;
              4'h7: boundary_low = 12'h6ba;
              4'h8: boundary_low = 12'h6b6;
              4'h9: boundary_low = 12'h6b2;
              4'ha: boundary_low = 12'h6ae;
              4'hb: boundary_low = 12'h6ab;
              4'hc: boundary_low = 12'h6a7;
              4'hd: boundary_low = 12'h6a3;
              4'he: boundary_low = 12'h6a0;
              4'hf: boundary_low = 12'h69c;
              default: boundary_low = 12'h000;
            endcase
          end
          6'h16: begin
            case (mant[3:0])
              4'h0: boundary_low = 12'h698;
              4'h1: boundary_low = 12'h694;
              4'h2: boundary_low = 12'h691;
              4'h3: boundary_low = 12'h68d;
              4'h4: boundary_low = 12'h689;
              4'h5: boundary_low = 12'h686;
              4'h6: boundary_low = 12'h682;
              4'h7: boundary_low = 12'h67f;
              4'h8: boundary_low = 12'h67b;
              4'h9: boundary_low = 12'h677;
              4'ha: boundary_low = 12'h674;
              4'hb: boundary_low = 12'h670;
              4'hc: boundary_low = 12'h66d;
              4'hd: boundary_low = 12'h669;
              4'he: boundary_low = 12'h666;
              4'hf: boundary_low = 12'h662;
              default: boundary_low = 12'h000;
            endcase
          end
          6'h17: begin
            case (mant[3:0])
              4'h0: boundary_low = 12'h65f;
              4'h1: boundary_low = 12'h65b;
              4'h2: boundary_low = 12'h658;
              4'h3: boundary_low = 12'h654;
              4'h4: boundary_low = 12'h651;
              4'h5: boundary_low = 12'h64d;
              4'h6: boundary_low = 12'h64a;
              4'h7: boundary_low = 12'h646;
              4'h8: boundary_low = 12'h643;
              4'h9: boundary_low = 12'h63f;
              4'ha: boundary_low = 12'h63c;
              4'hb: boundary_low = 12'h639;
              4'hc: boundary_low = 12'h635;
              4'hd: boundary_low = 12'h632;
              4'he: boundary_low = 12'h62e;
              4'hf: boundary_low = 12'h62b;
              default: boundary_low = 12'h000;
            endcase
          end
          6'h18: begin
            case (mant[3:0])
              4'h0: boundary_low = 12'h628;
              4'h1: boundary_low = 12'h624;
              4'h2: boundary_low = 12'h621;
              4'h3: boundary_low = 12'h61e;
              4'h4: boundary_low = 12'h61a;
              4'h5: boundary_low = 12'h617;
              4'h6: boundary_low = 12'h614;
              4'h7: boundary_low = 12'h610;
              4'h8: boundary_low = 12'h60d;
              4'h9: boundary_low = 12'h60a;
              4'ha: boundary_low = 12'h607;
              4'hb: boundary_low = 12'h603;
              4'hc: boundary_low = 12'h600;
              4'hd: boundary_low = 12'h5fd;
              4'he: boundary_low = 12'h5fa;
              4'hf: boundary_low = 12'h5f6;
              default: boundary_low = 12'h000;
            endcase
          end
          6'h19: begin
            case (mant[3:0])
              4'h0: boundary_low = 12'h5f3;
              4'h1: boundary_low = 12'h5f0;
              4'h2: boundary_low = 12'h5ed;
              4'h3: boundary_low = 12'h5ea;
              4'h4: boundary_low = 12'h5e6;
              4'h5: boundary_low = 12'h5e3;
              4'h6: boundary_low = 12'h5e0;
              4'h7: boundary_low = 12'h5dd;
              4'h8: boundary_low = 12'h5da;
              4'h9: boundary_low = 12'h5d7;
              4'ha: boundary_low = 12'h5d3;
              4'hb: boundary_low = 12'h5d0;
              4'hc: boundary_low = 12'h5cd;
              4'hd: boundary_low = 12'h5ca;
              4'he: boundary_low = 12'h5c7;
              4'hf: boundary_low = 12'h5c4;
              default: boundary_low = 12'h000;
            endcase
          end
          6'h1a: begin
            case (mant[3:0])
              4'h0: boundary_low = 12'h5c1;
              4'h1: boundary_low = 12'h5be;
              4'h2: boundary_low = 12'h5bb;
              4'h3: boundary_low = 12'h5b8;
              4'h4: boundary_low = 12'h5b5;
              4'h5: boundary_low = 12'h5b2;
              4'h6: boundary_low = 12'h5af;
              4'h7: boundary_low = 12'h5ac;
              4'h8: boundary_low = 12'h5a9;
              4'h9: boundary_low = 12'h5a6;
              4'ha: boundary_low = 12'h5a3;
              4'hb: boundary_low = 12'h5a0;
              4'hc: boundary_low = 12'h59d;
              4'hd: boundary_low = 12'h59a;
              4'he: boundary_low = 12'h597;
              4'hf: boundary_low = 12'h594;
              default: boundary_low = 12'h000;
            endcase
          end
          6'h1b: begin
            case (mant[3:0])
              4'h0: boundary_low = 12'h591;
              4'h1: boundary_low = 12'h58e;
              4'h2: boundary_low = 12'h58b;
              4'h3: boundary_low = 12'h588;
              4'h4: boundary_low = 12'h585;
              4'h5: boundary_low = 12'h582;
              4'h6: boundary_low = 12'h57f;
              4'h7: boundary_low = 12'h57d;
              4'h8: boundary_low = 12'h57a;
              4'h9: boundary_low = 12'h577;
              4'ha: boundary_low = 12'h574;
              4'hb: boundary_low = 12'h571;
              4'hc: boundary_low = 12'h56e;
              4'hd: boundary_low = 12'h56b;
              4'he: boundary_low = 12'h569;
              4'hf: boundary_low = 12'h566;
              default: boundary_low = 12'h000;
            endcase
          end
          6'h1c: begin
            case (mant[3:0])
              4'h0: boundary_low = 12'h563;
              4'h1: boundary_low = 12'h560;
              4'h2: boundary_low = 12'h55d;
              4'h3: boundary_low = 12'h55b;
              4'h4: boundary_low = 12'h558;
              4'h5: boundary_low = 12'h555;
              4'h6: boundary_low = 12'h552;
              4'h7: boundary_low = 12'h54f;
              4'h8: boundary_low = 12'h54d;
              4'h9: boundary_low = 12'h54a;
              4'ha: boundary_low = 12'h547;
              4'hb: boundary_low = 12'h544;
              4'hc: boundary_low = 12'h542;
              4'hd: boundary_low = 12'h53f;
              4'he: boundary_low = 12'h53c;
              4'hf: boundary_low = 12'h53a;
              default: boundary_low = 12'h000;
            endcase
          end
          6'h1d: begin
            case (mant[3:0])
              4'h0: boundary_low = 12'h537;
              4'h1: boundary_low = 12'h534;
              4'h2: boundary_low = 12'h532;
              4'h3: boundary_low = 12'h52f;
              4'h4: boundary_low = 12'h52c;
              4'h5: boundary_low = 12'h52a;
              4'h6: boundary_low = 12'h527;
              4'h7: boundary_low = 12'h524;
              4'h8: boundary_low = 12'h522;
              4'h9: boundary_low = 12'h51f;
              4'ha: boundary_low = 12'h51c;
              4'hb: boundary_low = 12'h51a;
              4'hc: boundary_low = 12'h517;
              4'hd: boundary_low = 12'h515;
              4'he: boundary_low = 12'h512;
              4'hf: boundary_low = 12'h50f;
              default: boundary_low = 12'h000;
            endcase
          end
          6'h1e: begin
            case (mant[3:0])
              4'h0: boundary_low = 12'h50d;
              4'h1: boundary_low = 12'h50a;
              4'h2: boundary_low = 12'h508;
              4'h3: boundary_low = 12'h505;
              4'h4: boundary_low = 12'h502;
              4'h5: boundary_low = 12'h500;
              4'h6: boundary_low = 12'h4fd;
              4'h7: boundary_low = 12'h4fb;
              4'h8: boundary_low = 12'h4f8;
              4'h9: boundary_low = 12'h4f6;
              4'ha: boundary_low = 12'h4f3;
              4'hb: boundary_low = 12'h4f1;
              4'hc: boundary_low = 12'h4ee;
              4'hd: boundary_low = 12'h4ec;
              4'he: boundary_low = 12'h4e9;
              4'hf: boundary_low = 12'h4e7;
              default: boundary_low = 12'h000;
            endcase
          end
          6'h1f: begin
            case (mant[3:0])
              4'h0: boundary_low = 12'h4e4;
              4'h1: boundary_low = 12'h4e2;
              4'h2: boundary_low = 12'h4df;
              4'h3: boundary_low = 12'h4dd;
              4'h4: boundary_low = 12'h4db;
              4'h5: boundary_low = 12'h4d8;
              4'h6: boundary_low = 12'h4d6;
              4'h7: boundary_low = 12'h4d3;
              4'h8: boundary_low = 12'h4d1;
              4'h9: boundary_low = 12'h4ce;
              4'ha: boundary_low = 12'h4cc;
              4'hb: boundary_low = 12'h4ca;
              4'hc: boundary_low = 12'h4c7;
              4'hd: boundary_low = 12'h4c5;
              4'he: boundary_low = 12'h4c2;
              4'hf: boundary_low = 12'h4c0;
              default: boundary_low = 12'h000;
            endcase
          end
          6'h20: begin
            case (mant[3:0])
              4'h0: boundary_low = 12'h4be;
              4'h1: boundary_low = 12'h4bb;
              4'h2: boundary_low = 12'h4b9;
              4'h3: boundary_low = 12'h4b7;
              4'h4: boundary_low = 12'h4b4;
              4'h5: boundary_low = 12'h4b2;
              4'h6: boundary_low = 12'h4b0;
              4'h7: boundary_low = 12'h4ad;
              4'h8: boundary_low = 12'h4ab;
              4'h9: boundary_low = 12'h4a9;
              4'ha: boundary_low = 12'h4a6;
              4'hb: boundary_low = 12'h4a4;
              4'hc: boundary_low = 12'h4a2;
              4'hd: boundary_low = 12'h49f;
              4'he: boundary_low = 12'h49d;
              4'hf: boundary_low = 12'h49b;
              default: boundary_low = 12'h000;
            endcase
          end
          6'h21: begin
            case (mant[3:0])
              4'h0: boundary_low = 12'h498;
              4'h1: boundary_low = 12'h496;
              4'h2: boundary_low = 12'h494;
              4'h3: boundary_low = 12'h492;
              4'h4: boundary_low = 12'h48f;
              4'h5: boundary_low = 12'h48d;
              4'h6: boundary_low = 12'h48b;
              4'h7: boundary_low = 12'h489;
              4'h8: boundary_low = 12'h486;
              4'h9: boundary_low = 12'h484;
              4'ha: boundary_low = 12'h482;
              4'hb: boundary_low = 12'h480;
              4'hc: boundary_low = 12'h47e;
              4'hd: boundary_low = 12'h47b;
              4'he: boundary_low = 12'h479;
              4'hf: boundary_low = 12'h477;
              default: boundary_low = 12'h000;
            endcase
          end
          6'h22: begin
            case (mant[3:0])
              4'h0: boundary_low = 12'h475;
              4'h1: boundary_low = 12'h473;
              4'h2: boundary_low = 12'h470;
              4'h3: boundary_low = 12'h46e;
              4'h4: boundary_low = 12'h46c;
              4'h5: boundary_low = 12'h46a;
              4'h6: boundary_low = 12'h468;
              4'h7: boundary_low = 12'h466;
              4'h8: boundary_low = 12'h464;
              4'h9: boundary_low = 12'h461;
              4'ha: boundary_low = 12'h45f;
              4'hb: boundary_low = 12'h45d;
              4'hc: boundary_low = 12'h45b;
              4'hd: boundary_low = 12'h459;
              4'he: boundary_low = 12'h457;
              4'hf: boundary_low = 12'h455;
              default: boundary_low = 12'h000;
            endcase
          end
          6'h23: begin
            case (mant[3:0])
              4'h0: boundary_low = 12'h453;
              4'h1: boundary_low = 12'h451;
              4'h2: boundary_low = 12'h44e;
              4'h3: boundary_low = 12'h44c;
              4'h4: boundary_low = 12'h44a;
              4'h5: boundary_low = 12'h448;
              4'h6: boundary_low = 12'h446;
              4'h7: boundary_low = 12'h444;
              4'h8: boundary_low = 12'h442;
              4'h9: boundary_low = 12'h440;
              4'ha: boundary_low = 12'h43e;
              4'hb: boundary_low = 12'h43c;
              4'hc: boundary_low = 12'h43a;
              4'hd: boundary_low = 12'h438;
              4'he: boundary_low = 12'h436;
              4'hf: boundary_low = 12'h434;
              default: boundary_low = 12'h000;
            endcase
          end
          6'h24: begin
            case (mant[3:0])
              4'h0: boundary_low = 12'h432;
              4'h1: boundary_low = 12'h430;
              4'h2: boundary_low = 12'h42e;
              4'h3: boundary_low = 12'h42c;
              4'h4: boundary_low = 12'h42a;
              4'h5: boundary_low = 12'h428;
              4'h6: boundary_low = 12'h426;
              4'h7: boundary_low = 12'h424;
              4'h8: boundary_low = 12'h422;
              4'h9: boundary_low = 12'h420;
              4'ha: boundary_low = 12'h41e;
              4'hb: boundary_low = 12'h41c;
              4'hc: boundary_low = 12'h41a;
              4'hd: boundary_low = 12'h418;
              4'he: boundary_low = 12'h416;
              4'hf: boundary_low = 12'h414;
              default: boundary_low = 12'h000;
            endcase
          end
          6'h25: begin
            case (mant[3:0])
              4'h0: boundary_low = 12'h412;
              4'h1: boundary_low = 12'h410;
              4'h2: boundary_low = 12'h40e;
              4'h3: boundary_low = 12'h40c;
              4'h4: boundary_low = 12'h40a;
              4'h5: boundary_low = 12'h409;
              4'h6: boundary_low = 12'h407;
              4'h7: boundary_low = 12'h405;
              4'h8: boundary_low = 12'h403;
              4'h9: boundary_low = 12'h401;
              4'ha: boundary_low = 12'h000;
              4'hb: boundary_low = 12'h000;
              4'hc: boundary_low = 12'h000;
              4'hd: boundary_low = 12'h000;
              4'he: boundary_low = 12'h000;
              4'hf: boundary_low = 12'h000;
              default: boundary_low = 12'h000;
            endcase
          end
          6'h26: boundary_low = 12'h000;
          6'h27: boundary_low = 12'h000;
          6'h28: boundary_low = 12'h000;
          6'h29: boundary_low = 12'h000;
          6'h2a: boundary_low = 12'h000;
          6'h2b: boundary_low = 12'h000;
          6'h2c: boundary_low = 12'h000;
          6'h2d: boundary_low = 12'h000;
          6'h2e: boundary_low = 12'h000;
          6'h2f: boundary_low = 12'h000;
          6'h30: boundary_low = 12'h000;
          6'h31: boundary_low = 12'h000;
          6'h32: boundary_low = 12'h000;
          6'h33: boundary_low = 12'h000;
          6'h34: boundary_low = 12'h000;
          6'h35: boundary_low = 12'h000;
          6'h36: boundary_low = 12'h000;
          6'h37: boundary_low = 12'h000;
          6'h38: boundary_low = 12'h000;
          6'h39: boundary_low = 12'h000;
          6'h3a: boundary_low = 12'h000;
          6'h3b: boundary_low = 12'h000;
          6'h3c: boundary_low = 12'h000;
          6'h3d: boundary_low = 12'h000;
          6'h3e: boundary_low = 12'h000;
          6'h3f: boundary_low = 12'h000;
          default: boundary_low = 12'h000;
        endcase
      end
      default: boundary_low = 12'h000;
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
  reg boundary_b12;
  always @* begin
    case (exp)
      5'h09: begin
        boundary_b12 = 1;
      end
      5'h13: begin
        boundary_b12 = 0;
      end
      default: boundary_b12 = 1'b0;
    endcase
  end
  wire [14:0] boundary_mag = {boundary_b14, boundary_b13, boundary_b12, boundary_low};
  wire [14:0] active_mag = core_active ? core_mag : boundary_mag;
  wire [15:0] active_out = {sign, active_mag};
  assign out = (core_active || boundary_active) ? active_out : special_out;
endmodule
