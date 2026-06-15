module ex236_core_boundary_low15_hi6(in, out);
  input [15:0] in;
  output [15:0] out;
  wire sign = in[15];
  wire [4:0] exp = in[14:10];
  wire [9:0] mant = in[9:0];
  wire core_active = (exp >= 5'd11) && (exp <= 5'd19);
  wire boundary_active = (exp == 5'd10) || (exp == 5'd20);
  wire [5:0] exp3 = {1'b0, exp} + ({1'b0, exp} << 1);
  wire [15:0] signed_zero = {sign, 15'h0000};
  wire [15:0] signed_inf = {sign, 5'h1f, 10'h000};
  wire [15:0] special_out = (exp == 5'h1f && mant != 10'h000) ? 16'h7e00 :
                           ((exp <= 5'd9) ? signed_zero : signed_inf);
  reg [1:0] exp_delta;
  always @* begin
    if (mant <= 10'h10a) begin
      exp_delta = 2'h0;
    end else begin
      if (mant <= 10'h259) begin
        exp_delta = 2'h1;
      end else begin
        exp_delta = 2'h2;
      end
    end
  end
  wire [5:0] core_exp_wide = exp3 - 6'd30 + {4'b0, exp_delta};
  wire [4:0] core_exp = core_exp_wide[4:0];
  reg [9:0] mant_low;
  always @* begin
    case (mant[9:4])
      6'h00: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h000;
          4'h1: mant_low = 10'h003;
          4'h2: mant_low = 10'h006;
          4'h3: mant_low = 10'h009;
          4'h4: mant_low = 10'h00c;
          4'h5: mant_low = 10'h00f;
          4'h6: mant_low = 10'h012;
          4'h7: mant_low = 10'h015;
          4'h8: mant_low = 10'h018;
          4'h9: mant_low = 10'h01b;
          4'ha: mant_low = 10'h01e;
          4'hb: mant_low = 10'h021;
          4'hc: mant_low = 10'h024;
          4'hd: mant_low = 10'h027;
          4'he: mant_low = 10'h02b;
          4'hf: mant_low = 10'h02e;
          default: mant_low = 10'h000;
        endcase
      end
      6'h01: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h031;
          4'h1: mant_low = 10'h034;
          4'h2: mant_low = 10'h037;
          4'h3: mant_low = 10'h03a;
          4'h4: mant_low = 10'h03d;
          4'h5: mant_low = 10'h040;
          4'h6: mant_low = 10'h043;
          4'h7: mant_low = 10'h047;
          4'h8: mant_low = 10'h04a;
          4'h9: mant_low = 10'h04d;
          4'ha: mant_low = 10'h050;
          4'hb: mant_low = 10'h053;
          4'hc: mant_low = 10'h056;
          4'hd: mant_low = 10'h059;
          4'he: mant_low = 10'h05d;
          4'hf: mant_low = 10'h060;
          default: mant_low = 10'h000;
        endcase
      end
      6'h02: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h063;
          4'h1: mant_low = 10'h066;
          4'h2: mant_low = 10'h069;
          4'h3: mant_low = 10'h06d;
          4'h4: mant_low = 10'h070;
          4'h5: mant_low = 10'h073;
          4'h6: mant_low = 10'h076;
          4'h7: mant_low = 10'h07a;
          4'h8: mant_low = 10'h07d;
          4'h9: mant_low = 10'h080;
          4'ha: mant_low = 10'h083;
          4'hb: mant_low = 10'h086;
          4'hc: mant_low = 10'h08a;
          4'hd: mant_low = 10'h08d;
          4'he: mant_low = 10'h090;
          4'hf: mant_low = 10'h094;
          default: mant_low = 10'h000;
        endcase
      end
      6'h03: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h097;
          4'h1: mant_low = 10'h09a;
          4'h2: mant_low = 10'h09d;
          4'h3: mant_low = 10'h0a1;
          4'h4: mant_low = 10'h0a4;
          4'h5: mant_low = 10'h0a7;
          4'h6: mant_low = 10'h0ab;
          4'h7: mant_low = 10'h0ae;
          4'h8: mant_low = 10'h0b1;
          4'h9: mant_low = 10'h0b5;
          4'ha: mant_low = 10'h0b8;
          4'hb: mant_low = 10'h0bb;
          4'hc: mant_low = 10'h0bf;
          4'hd: mant_low = 10'h0c2;
          4'he: mant_low = 10'h0c5;
          4'hf: mant_low = 10'h0c9;
          default: mant_low = 10'h000;
        endcase
      end
      6'h04: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h0cc;
          4'h1: mant_low = 10'h0d0;
          4'h2: mant_low = 10'h0d3;
          4'h3: mant_low = 10'h0d6;
          4'h4: mant_low = 10'h0da;
          4'h5: mant_low = 10'h0dd;
          4'h6: mant_low = 10'h0e1;
          4'h7: mant_low = 10'h0e4;
          4'h8: mant_low = 10'h0e8;
          4'h9: mant_low = 10'h0eb;
          4'ha: mant_low = 10'h0ee;
          4'hb: mant_low = 10'h0f2;
          4'hc: mant_low = 10'h0f5;
          4'hd: mant_low = 10'h0f9;
          4'he: mant_low = 10'h0fc;
          4'hf: mant_low = 10'h100;
          default: mant_low = 10'h000;
        endcase
      end
      6'h05: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h103;
          4'h1: mant_low = 10'h107;
          4'h2: mant_low = 10'h10a;
          4'h3: mant_low = 10'h10e;
          4'h4: mant_low = 10'h111;
          4'h5: mant_low = 10'h115;
          4'h6: mant_low = 10'h118;
          4'h7: mant_low = 10'h11c;
          4'h8: mant_low = 10'h11f;
          4'h9: mant_low = 10'h123;
          4'ha: mant_low = 10'h126;
          4'hb: mant_low = 10'h12a;
          4'hc: mant_low = 10'h12e;
          4'hd: mant_low = 10'h131;
          4'he: mant_low = 10'h135;
          4'hf: mant_low = 10'h138;
          default: mant_low = 10'h000;
        endcase
      end
      6'h06: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h13c;
          4'h1: mant_low = 10'h13f;
          4'h2: mant_low = 10'h143;
          4'h3: mant_low = 10'h147;
          4'h4: mant_low = 10'h14a;
          4'h5: mant_low = 10'h14e;
          4'h6: mant_low = 10'h151;
          4'h7: mant_low = 10'h155;
          4'h8: mant_low = 10'h159;
          4'h9: mant_low = 10'h15c;
          4'ha: mant_low = 10'h160;
          4'hb: mant_low = 10'h164;
          4'hc: mant_low = 10'h167;
          4'hd: mant_low = 10'h16b;
          4'he: mant_low = 10'h16f;
          4'hf: mant_low = 10'h172;
          default: mant_low = 10'h000;
        endcase
      end
      6'h07: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h176;
          4'h1: mant_low = 10'h17a;
          4'h2: mant_low = 10'h17d;
          4'h3: mant_low = 10'h181;
          4'h4: mant_low = 10'h185;
          4'h5: mant_low = 10'h189;
          4'h6: mant_low = 10'h18c;
          4'h7: mant_low = 10'h190;
          4'h8: mant_low = 10'h194;
          4'h9: mant_low = 10'h198;
          4'ha: mant_low = 10'h19b;
          4'hb: mant_low = 10'h19f;
          4'hc: mant_low = 10'h1a3;
          4'hd: mant_low = 10'h1a7;
          4'he: mant_low = 10'h1aa;
          4'hf: mant_low = 10'h1ae;
          default: mant_low = 10'h000;
        endcase
      end
      6'h08: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h1b2;
          4'h1: mant_low = 10'h1b6;
          4'h2: mant_low = 10'h1ba;
          4'h3: mant_low = 10'h1bd;
          4'h4: mant_low = 10'h1c1;
          4'h5: mant_low = 10'h1c5;
          4'h6: mant_low = 10'h1c9;
          4'h7: mant_low = 10'h1cd;
          4'h8: mant_low = 10'h1d1;
          4'h9: mant_low = 10'h1d4;
          4'ha: mant_low = 10'h1d8;
          4'hb: mant_low = 10'h1dc;
          4'hc: mant_low = 10'h1e0;
          4'hd: mant_low = 10'h1e4;
          4'he: mant_low = 10'h1e8;
          4'hf: mant_low = 10'h1ec;
          default: mant_low = 10'h000;
        endcase
      end
      6'h09: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h1f0;
          4'h1: mant_low = 10'h1f4;
          4'h2: mant_low = 10'h1f7;
          4'h3: mant_low = 10'h1fb;
          4'h4: mant_low = 10'h1ff;
          4'h5: mant_low = 10'h203;
          4'h6: mant_low = 10'h207;
          4'h7: mant_low = 10'h20b;
          4'h8: mant_low = 10'h20f;
          4'h9: mant_low = 10'h213;
          4'ha: mant_low = 10'h217;
          4'hb: mant_low = 10'h21b;
          4'hc: mant_low = 10'h21f;
          4'hd: mant_low = 10'h223;
          4'he: mant_low = 10'h227;
          4'hf: mant_low = 10'h22b;
          default: mant_low = 10'h000;
        endcase
      end
      6'h0a: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h22f;
          4'h1: mant_low = 10'h233;
          4'h2: mant_low = 10'h237;
          4'h3: mant_low = 10'h23b;
          4'h4: mant_low = 10'h23f;
          4'h5: mant_low = 10'h243;
          4'h6: mant_low = 10'h247;
          4'h7: mant_low = 10'h24b;
          4'h8: mant_low = 10'h24f;
          4'h9: mant_low = 10'h253;
          4'ha: mant_low = 10'h257;
          4'hb: mant_low = 10'h25b;
          4'hc: mant_low = 10'h260;
          4'hd: mant_low = 10'h264;
          4'he: mant_low = 10'h268;
          4'hf: mant_low = 10'h26c;
          default: mant_low = 10'h000;
        endcase
      end
      6'h0b: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h270;
          4'h1: mant_low = 10'h274;
          4'h2: mant_low = 10'h278;
          4'h3: mant_low = 10'h27c;
          4'h4: mant_low = 10'h280;
          4'h5: mant_low = 10'h285;
          4'h6: mant_low = 10'h289;
          4'h7: mant_low = 10'h28d;
          4'h8: mant_low = 10'h291;
          4'h9: mant_low = 10'h295;
          4'ha: mant_low = 10'h299;
          4'hb: mant_low = 10'h29e;
          4'hc: mant_low = 10'h2a2;
          4'hd: mant_low = 10'h2a6;
          4'he: mant_low = 10'h2aa;
          4'hf: mant_low = 10'h2af;
          default: mant_low = 10'h000;
        endcase
      end
      6'h0c: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h2b3;
          4'h1: mant_low = 10'h2b7;
          4'h2: mant_low = 10'h2bb;
          4'h3: mant_low = 10'h2bf;
          4'h4: mant_low = 10'h2c4;
          4'h5: mant_low = 10'h2c8;
          4'h6: mant_low = 10'h2cc;
          4'h7: mant_low = 10'h2d1;
          4'h8: mant_low = 10'h2d5;
          4'h9: mant_low = 10'h2d9;
          4'ha: mant_low = 10'h2dd;
          4'hb: mant_low = 10'h2e2;
          4'hc: mant_low = 10'h2e6;
          4'hd: mant_low = 10'h2ea;
          4'he: mant_low = 10'h2ef;
          4'hf: mant_low = 10'h2f3;
          default: mant_low = 10'h000;
        endcase
      end
      6'h0d: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h2f7;
          4'h1: mant_low = 10'h2fc;
          4'h2: mant_low = 10'h300;
          4'h3: mant_low = 10'h304;
          4'h4: mant_low = 10'h309;
          4'h5: mant_low = 10'h30d;
          4'h6: mant_low = 10'h312;
          4'h7: mant_low = 10'h316;
          4'h8: mant_low = 10'h31a;
          4'h9: mant_low = 10'h31f;
          4'ha: mant_low = 10'h323;
          4'hb: mant_low = 10'h328;
          4'hc: mant_low = 10'h32c;
          4'hd: mant_low = 10'h330;
          4'he: mant_low = 10'h335;
          4'hf: mant_low = 10'h339;
          default: mant_low = 10'h000;
        endcase
      end
      6'h0e: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h33e;
          4'h1: mant_low = 10'h342;
          4'h2: mant_low = 10'h347;
          4'h3: mant_low = 10'h34b;
          4'h4: mant_low = 10'h350;
          4'h5: mant_low = 10'h354;
          4'h6: mant_low = 10'h359;
          4'h7: mant_low = 10'h35d;
          4'h8: mant_low = 10'h362;
          4'h9: mant_low = 10'h366;
          4'ha: mant_low = 10'h36b;
          4'hb: mant_low = 10'h36f;
          4'hc: mant_low = 10'h374;
          4'hd: mant_low = 10'h378;
          4'he: mant_low = 10'h37d;
          4'hf: mant_low = 10'h381;
          default: mant_low = 10'h000;
        endcase
      end
      6'h0f: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h386;
          4'h1: mant_low = 10'h38b;
          4'h2: mant_low = 10'h38f;
          4'h3: mant_low = 10'h394;
          4'h4: mant_low = 10'h398;
          4'h5: mant_low = 10'h39d;
          4'h6: mant_low = 10'h3a1;
          4'h7: mant_low = 10'h3a6;
          4'h8: mant_low = 10'h3ab;
          4'h9: mant_low = 10'h3af;
          4'ha: mant_low = 10'h3b4;
          4'hb: mant_low = 10'h3b9;
          4'hc: mant_low = 10'h3bd;
          4'hd: mant_low = 10'h3c2;
          4'he: mant_low = 10'h3c7;
          4'hf: mant_low = 10'h3cb;
          default: mant_low = 10'h000;
        endcase
      end
      6'h10: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h3d0;
          4'h1: mant_low = 10'h3d5;
          4'h2: mant_low = 10'h3d9;
          4'h3: mant_low = 10'h3de;
          4'h4: mant_low = 10'h3e3;
          4'h5: mant_low = 10'h3e8;
          4'h6: mant_low = 10'h3ec;
          4'h7: mant_low = 10'h3f1;
          4'h8: mant_low = 10'h3f6;
          4'h9: mant_low = 10'h3fa;
          4'ha: mant_low = 10'h3ff;
          4'hb: mant_low = 10'h002;
          4'hc: mant_low = 10'h004;
          4'hd: mant_low = 10'h007;
          4'he: mant_low = 10'h009;
          4'hf: mant_low = 10'h00c;
          default: mant_low = 10'h000;
        endcase
      end
      6'h11: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h00e;
          4'h1: mant_low = 10'h010;
          4'h2: mant_low = 10'h013;
          4'h3: mant_low = 10'h015;
          4'h4: mant_low = 10'h018;
          4'h5: mant_low = 10'h01a;
          4'h6: mant_low = 10'h01c;
          4'h7: mant_low = 10'h01f;
          4'h8: mant_low = 10'h021;
          4'h9: mant_low = 10'h024;
          4'ha: mant_low = 10'h026;
          4'hb: mant_low = 10'h029;
          4'hc: mant_low = 10'h02b;
          4'hd: mant_low = 10'h02e;
          4'he: mant_low = 10'h030;
          4'hf: mant_low = 10'h032;
          default: mant_low = 10'h000;
        endcase
      end
      6'h12: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h035;
          4'h1: mant_low = 10'h037;
          4'h2: mant_low = 10'h03a;
          4'h3: mant_low = 10'h03c;
          4'h4: mant_low = 10'h03f;
          4'h5: mant_low = 10'h041;
          4'h6: mant_low = 10'h044;
          4'h7: mant_low = 10'h046;
          4'h8: mant_low = 10'h049;
          4'h9: mant_low = 10'h04b;
          4'ha: mant_low = 10'h04e;
          4'hb: mant_low = 10'h050;
          4'hc: mant_low = 10'h053;
          4'hd: mant_low = 10'h055;
          4'he: mant_low = 10'h058;
          4'hf: mant_low = 10'h05a;
          default: mant_low = 10'h000;
        endcase
      end
      6'h13: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h05d;
          4'h1: mant_low = 10'h05f;
          4'h2: mant_low = 10'h062;
          4'h3: mant_low = 10'h064;
          4'h4: mant_low = 10'h067;
          4'h5: mant_low = 10'h069;
          4'h6: mant_low = 10'h06c;
          4'h7: mant_low = 10'h06f;
          4'h8: mant_low = 10'h071;
          4'h9: mant_low = 10'h074;
          4'ha: mant_low = 10'h076;
          4'hb: mant_low = 10'h079;
          4'hc: mant_low = 10'h07b;
          4'hd: mant_low = 10'h07e;
          4'he: mant_low = 10'h080;
          4'hf: mant_low = 10'h083;
          default: mant_low = 10'h000;
        endcase
      end
      6'h14: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h086;
          4'h1: mant_low = 10'h088;
          4'h2: mant_low = 10'h08b;
          4'h3: mant_low = 10'h08d;
          4'h4: mant_low = 10'h090;
          4'h5: mant_low = 10'h093;
          4'h6: mant_low = 10'h095;
          4'h7: mant_low = 10'h098;
          4'h8: mant_low = 10'h09a;
          4'h9: mant_low = 10'h09d;
          4'ha: mant_low = 10'h0a0;
          4'hb: mant_low = 10'h0a2;
          4'hc: mant_low = 10'h0a5;
          4'hd: mant_low = 10'h0a8;
          4'he: mant_low = 10'h0aa;
          4'hf: mant_low = 10'h0ad;
          default: mant_low = 10'h000;
        endcase
      end
      6'h15: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h0af;
          4'h1: mant_low = 10'h0b2;
          4'h2: mant_low = 10'h0b5;
          4'h3: mant_low = 10'h0b7;
          4'h4: mant_low = 10'h0ba;
          4'h5: mant_low = 10'h0bd;
          4'h6: mant_low = 10'h0bf;
          4'h7: mant_low = 10'h0c2;
          4'h8: mant_low = 10'h0c5;
          4'h9: mant_low = 10'h0c7;
          4'ha: mant_low = 10'h0ca;
          4'hb: mant_low = 10'h0cd;
          4'hc: mant_low = 10'h0cf;
          4'hd: mant_low = 10'h0d2;
          4'he: mant_low = 10'h0d5;
          4'hf: mant_low = 10'h0d8;
          default: mant_low = 10'h000;
        endcase
      end
      6'h16: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h0da;
          4'h1: mant_low = 10'h0dd;
          4'h2: mant_low = 10'h0e0;
          4'h3: mant_low = 10'h0e2;
          4'h4: mant_low = 10'h0e5;
          4'h5: mant_low = 10'h0e8;
          4'h6: mant_low = 10'h0eb;
          4'h7: mant_low = 10'h0ed;
          4'h8: mant_low = 10'h0f0;
          4'h9: mant_low = 10'h0f3;
          4'ha: mant_low = 10'h0f6;
          4'hb: mant_low = 10'h0f8;
          4'hc: mant_low = 10'h0fb;
          4'hd: mant_low = 10'h0fe;
          4'he: mant_low = 10'h101;
          4'hf: mant_low = 10'h103;
          default: mant_low = 10'h000;
        endcase
      end
      6'h17: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h106;
          4'h1: mant_low = 10'h109;
          4'h2: mant_low = 10'h10c;
          4'h3: mant_low = 10'h10e;
          4'h4: mant_low = 10'h111;
          4'h5: mant_low = 10'h114;
          4'h6: mant_low = 10'h117;
          4'h7: mant_low = 10'h11a;
          4'h8: mant_low = 10'h11c;
          4'h9: mant_low = 10'h11f;
          4'ha: mant_low = 10'h122;
          4'hb: mant_low = 10'h125;
          4'hc: mant_low = 10'h128;
          4'hd: mant_low = 10'h12b;
          4'he: mant_low = 10'h12d;
          4'hf: mant_low = 10'h130;
          default: mant_low = 10'h000;
        endcase
      end
      6'h18: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h133;
          4'h1: mant_low = 10'h136;
          4'h2: mant_low = 10'h139;
          4'h3: mant_low = 10'h13c;
          4'h4: mant_low = 10'h13e;
          4'h5: mant_low = 10'h141;
          4'h6: mant_low = 10'h144;
          4'h7: mant_low = 10'h147;
          4'h8: mant_low = 10'h14a;
          4'h9: mant_low = 10'h14d;
          4'ha: mant_low = 10'h150;
          4'hb: mant_low = 10'h152;
          4'hc: mant_low = 10'h155;
          4'hd: mant_low = 10'h158;
          4'he: mant_low = 10'h15b;
          4'hf: mant_low = 10'h15e;
          default: mant_low = 10'h000;
        endcase
      end
      6'h19: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h161;
          4'h1: mant_low = 10'h164;
          4'h2: mant_low = 10'h167;
          4'h3: mant_low = 10'h16a;
          4'h4: mant_low = 10'h16d;
          4'h5: mant_low = 10'h16f;
          4'h6: mant_low = 10'h172;
          4'h7: mant_low = 10'h175;
          4'h8: mant_low = 10'h178;
          4'h9: mant_low = 10'h17b;
          4'ha: mant_low = 10'h17e;
          4'hb: mant_low = 10'h181;
          4'hc: mant_low = 10'h184;
          4'hd: mant_low = 10'h187;
          4'he: mant_low = 10'h18a;
          4'hf: mant_low = 10'h18d;
          default: mant_low = 10'h000;
        endcase
      end
      6'h1a: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h190;
          4'h1: mant_low = 10'h193;
          4'h2: mant_low = 10'h196;
          4'h3: mant_low = 10'h199;
          4'h4: mant_low = 10'h19c;
          4'h5: mant_low = 10'h19f;
          4'h6: mant_low = 10'h1a2;
          4'h7: mant_low = 10'h1a5;
          4'h8: mant_low = 10'h1a8;
          4'h9: mant_low = 10'h1ab;
          4'ha: mant_low = 10'h1ae;
          4'hb: mant_low = 10'h1b1;
          4'hc: mant_low = 10'h1b4;
          4'hd: mant_low = 10'h1b7;
          4'he: mant_low = 10'h1ba;
          4'hf: mant_low = 10'h1bd;
          default: mant_low = 10'h000;
        endcase
      end
      6'h1b: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h1c0;
          4'h1: mant_low = 10'h1c3;
          4'h2: mant_low = 10'h1c6;
          4'h3: mant_low = 10'h1c9;
          4'h4: mant_low = 10'h1cc;
          4'h5: mant_low = 10'h1cf;
          4'h6: mant_low = 10'h1d2;
          4'h7: mant_low = 10'h1d5;
          4'h8: mant_low = 10'h1d8;
          4'h9: mant_low = 10'h1db;
          4'ha: mant_low = 10'h1de;
          4'hb: mant_low = 10'h1e1;
          4'hc: mant_low = 10'h1e5;
          4'hd: mant_low = 10'h1e8;
          4'he: mant_low = 10'h1eb;
          4'hf: mant_low = 10'h1ee;
          default: mant_low = 10'h000;
        endcase
      end
      6'h1c: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h1f1;
          4'h1: mant_low = 10'h1f4;
          4'h2: mant_low = 10'h1f7;
          4'h3: mant_low = 10'h1fa;
          4'h4: mant_low = 10'h1fd;
          4'h5: mant_low = 10'h200;
          4'h6: mant_low = 10'h204;
          4'h7: mant_low = 10'h207;
          4'h8: mant_low = 10'h20a;
          4'h9: mant_low = 10'h20d;
          4'ha: mant_low = 10'h210;
          4'hb: mant_low = 10'h213;
          4'hc: mant_low = 10'h216;
          4'hd: mant_low = 10'h21a;
          4'he: mant_low = 10'h21d;
          4'hf: mant_low = 10'h220;
          default: mant_low = 10'h000;
        endcase
      end
      6'h1d: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h223;
          4'h1: mant_low = 10'h226;
          4'h2: mant_low = 10'h229;
          4'h3: mant_low = 10'h22d;
          4'h4: mant_low = 10'h230;
          4'h5: mant_low = 10'h233;
          4'h6: mant_low = 10'h236;
          4'h7: mant_low = 10'h239;
          4'h8: mant_low = 10'h23c;
          4'h9: mant_low = 10'h240;
          4'ha: mant_low = 10'h243;
          4'hb: mant_low = 10'h246;
          4'hc: mant_low = 10'h249;
          4'hd: mant_low = 10'h24d;
          4'he: mant_low = 10'h250;
          4'hf: mant_low = 10'h253;
          default: mant_low = 10'h000;
        endcase
      end
      6'h1e: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h256;
          4'h1: mant_low = 10'h259;
          4'h2: mant_low = 10'h25d;
          4'h3: mant_low = 10'h260;
          4'h4: mant_low = 10'h263;
          4'h5: mant_low = 10'h266;
          4'h6: mant_low = 10'h26a;
          4'h7: mant_low = 10'h26d;
          4'h8: mant_low = 10'h270;
          4'h9: mant_low = 10'h274;
          4'ha: mant_low = 10'h277;
          4'hb: mant_low = 10'h27a;
          4'hc: mant_low = 10'h27d;
          4'hd: mant_low = 10'h281;
          4'he: mant_low = 10'h284;
          4'hf: mant_low = 10'h287;
          default: mant_low = 10'h000;
        endcase
      end
      6'h1f: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h28b;
          4'h1: mant_low = 10'h28e;
          4'h2: mant_low = 10'h291;
          4'h3: mant_low = 10'h294;
          4'h4: mant_low = 10'h298;
          4'h5: mant_low = 10'h29b;
          4'h6: mant_low = 10'h29e;
          4'h7: mant_low = 10'h2a2;
          4'h8: mant_low = 10'h2a5;
          4'h9: mant_low = 10'h2a8;
          4'ha: mant_low = 10'h2ac;
          4'hb: mant_low = 10'h2af;
          4'hc: mant_low = 10'h2b3;
          4'hd: mant_low = 10'h2b6;
          4'he: mant_low = 10'h2b9;
          4'hf: mant_low = 10'h2bd;
          default: mant_low = 10'h000;
        endcase
      end
      6'h20: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h2c0;
          4'h1: mant_low = 10'h2c3;
          4'h2: mant_low = 10'h2c7;
          4'h3: mant_low = 10'h2ca;
          4'h4: mant_low = 10'h2ce;
          4'h5: mant_low = 10'h2d1;
          4'h6: mant_low = 10'h2d4;
          4'h7: mant_low = 10'h2d8;
          4'h8: mant_low = 10'h2db;
          4'h9: mant_low = 10'h2df;
          4'ha: mant_low = 10'h2e2;
          4'hb: mant_low = 10'h2e5;
          4'hc: mant_low = 10'h2e9;
          4'hd: mant_low = 10'h2ec;
          4'he: mant_low = 10'h2f0;
          4'hf: mant_low = 10'h2f3;
          default: mant_low = 10'h000;
        endcase
      end
      6'h21: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h2f7;
          4'h1: mant_low = 10'h2fa;
          4'h2: mant_low = 10'h2fd;
          4'h3: mant_low = 10'h301;
          4'h4: mant_low = 10'h304;
          4'h5: mant_low = 10'h308;
          4'h6: mant_low = 10'h30b;
          4'h7: mant_low = 10'h30f;
          4'h8: mant_low = 10'h312;
          4'h9: mant_low = 10'h316;
          4'ha: mant_low = 10'h319;
          4'hb: mant_low = 10'h31d;
          4'hc: mant_low = 10'h320;
          4'hd: mant_low = 10'h324;
          4'he: mant_low = 10'h327;
          4'hf: mant_low = 10'h32b;
          default: mant_low = 10'h000;
        endcase
      end
      6'h22: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h32e;
          4'h1: mant_low = 10'h332;
          4'h2: mant_low = 10'h335;
          4'h3: mant_low = 10'h339;
          4'h4: mant_low = 10'h33c;
          4'h5: mant_low = 10'h340;
          4'h6: mant_low = 10'h343;
          4'h7: mant_low = 10'h347;
          4'h8: mant_low = 10'h34b;
          4'h9: mant_low = 10'h34e;
          4'ha: mant_low = 10'h352;
          4'hb: mant_low = 10'h355;
          4'hc: mant_low = 10'h359;
          4'hd: mant_low = 10'h35c;
          4'he: mant_low = 10'h360;
          4'hf: mant_low = 10'h364;
          default: mant_low = 10'h000;
        endcase
      end
      6'h23: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h367;
          4'h1: mant_low = 10'h36b;
          4'h2: mant_low = 10'h36e;
          4'h3: mant_low = 10'h372;
          4'h4: mant_low = 10'h376;
          4'h5: mant_low = 10'h379;
          4'h6: mant_low = 10'h37d;
          4'h7: mant_low = 10'h380;
          4'h8: mant_low = 10'h384;
          4'h9: mant_low = 10'h388;
          4'ha: mant_low = 10'h38b;
          4'hb: mant_low = 10'h38f;
          4'hc: mant_low = 10'h393;
          4'hd: mant_low = 10'h396;
          4'he: mant_low = 10'h39a;
          4'hf: mant_low = 10'h39d;
          default: mant_low = 10'h000;
        endcase
      end
      6'h24: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h3a1;
          4'h1: mant_low = 10'h3a5;
          4'h2: mant_low = 10'h3a8;
          4'h3: mant_low = 10'h3ac;
          4'h4: mant_low = 10'h3b0;
          4'h5: mant_low = 10'h3b3;
          4'h6: mant_low = 10'h3b7;
          4'h7: mant_low = 10'h3bb;
          4'h8: mant_low = 10'h3bf;
          4'h9: mant_low = 10'h3c2;
          4'ha: mant_low = 10'h3c6;
          4'hb: mant_low = 10'h3ca;
          4'hc: mant_low = 10'h3cd;
          4'hd: mant_low = 10'h3d1;
          4'he: mant_low = 10'h3d5;
          4'hf: mant_low = 10'h3d9;
          default: mant_low = 10'h000;
        endcase
      end
      6'h25: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h3dc;
          4'h1: mant_low = 10'h3e0;
          4'h2: mant_low = 10'h3e4;
          4'h3: mant_low = 10'h3e8;
          4'h4: mant_low = 10'h3eb;
          4'h5: mant_low = 10'h3ef;
          4'h6: mant_low = 10'h3f3;
          4'h7: mant_low = 10'h3f7;
          4'h8: mant_low = 10'h3fa;
          4'h9: mant_low = 10'h3fe;
          4'ha: mant_low = 10'h001;
          4'hb: mant_low = 10'h003;
          4'hc: mant_low = 10'h005;
          4'hd: mant_low = 10'h007;
          4'he: mant_low = 10'h009;
          4'hf: mant_low = 10'h00a;
          default: mant_low = 10'h000;
        endcase
      end
      6'h26: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h00c;
          4'h1: mant_low = 10'h00e;
          4'h2: mant_low = 10'h010;
          4'h3: mant_low = 10'h012;
          4'h4: mant_low = 10'h014;
          4'h5: mant_low = 10'h016;
          4'h6: mant_low = 10'h018;
          4'h7: mant_low = 10'h01a;
          4'h8: mant_low = 10'h01c;
          4'h9: mant_low = 10'h01e;
          4'ha: mant_low = 10'h020;
          4'hb: mant_low = 10'h021;
          4'hc: mant_low = 10'h023;
          4'hd: mant_low = 10'h025;
          4'he: mant_low = 10'h027;
          4'hf: mant_low = 10'h029;
          default: mant_low = 10'h000;
        endcase
      end
      6'h27: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h02b;
          4'h1: mant_low = 10'h02d;
          4'h2: mant_low = 10'h02f;
          4'h3: mant_low = 10'h031;
          4'h4: mant_low = 10'h033;
          4'h5: mant_low = 10'h035;
          4'h6: mant_low = 10'h037;
          4'h7: mant_low = 10'h039;
          4'h8: mant_low = 10'h03b;
          4'h9: mant_low = 10'h03d;
          4'ha: mant_low = 10'h03f;
          4'hb: mant_low = 10'h041;
          4'hc: mant_low = 10'h043;
          4'hd: mant_low = 10'h045;
          4'he: mant_low = 10'h047;
          4'hf: mant_low = 10'h049;
          default: mant_low = 10'h000;
        endcase
      end
      6'h28: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h04a;
          4'h1: mant_low = 10'h04c;
          4'h2: mant_low = 10'h04e;
          4'h3: mant_low = 10'h050;
          4'h4: mant_low = 10'h052;
          4'h5: mant_low = 10'h054;
          4'h6: mant_low = 10'h056;
          4'h7: mant_low = 10'h058;
          4'h8: mant_low = 10'h05a;
          4'h9: mant_low = 10'h05c;
          4'ha: mant_low = 10'h05e;
          4'hb: mant_low = 10'h060;
          4'hc: mant_low = 10'h062;
          4'hd: mant_low = 10'h064;
          4'he: mant_low = 10'h066;
          4'hf: mant_low = 10'h068;
          default: mant_low = 10'h000;
        endcase
      end
      6'h29: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h06a;
          4'h1: mant_low = 10'h06d;
          4'h2: mant_low = 10'h06f;
          4'h3: mant_low = 10'h071;
          4'h4: mant_low = 10'h073;
          4'h5: mant_low = 10'h075;
          4'h6: mant_low = 10'h077;
          4'h7: mant_low = 10'h079;
          4'h8: mant_low = 10'h07b;
          4'h9: mant_low = 10'h07d;
          4'ha: mant_low = 10'h07f;
          4'hb: mant_low = 10'h081;
          4'hc: mant_low = 10'h083;
          4'hd: mant_low = 10'h085;
          4'he: mant_low = 10'h087;
          4'hf: mant_low = 10'h089;
          default: mant_low = 10'h000;
        endcase
      end
      6'h2a: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h08b;
          4'h1: mant_low = 10'h08d;
          4'h2: mant_low = 10'h08f;
          4'h3: mant_low = 10'h091;
          4'h4: mant_low = 10'h093;
          4'h5: mant_low = 10'h095;
          4'h6: mant_low = 10'h097;
          4'h7: mant_low = 10'h09a;
          4'h8: mant_low = 10'h09c;
          4'h9: mant_low = 10'h09e;
          4'ha: mant_low = 10'h0a0;
          4'hb: mant_low = 10'h0a2;
          4'hc: mant_low = 10'h0a4;
          4'hd: mant_low = 10'h0a6;
          4'he: mant_low = 10'h0a8;
          4'hf: mant_low = 10'h0aa;
          default: mant_low = 10'h000;
        endcase
      end
      6'h2b: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h0ac;
          4'h1: mant_low = 10'h0ae;
          4'h2: mant_low = 10'h0b1;
          4'h3: mant_low = 10'h0b3;
          4'h4: mant_low = 10'h0b5;
          4'h5: mant_low = 10'h0b7;
          4'h6: mant_low = 10'h0b9;
          4'h7: mant_low = 10'h0bb;
          4'h8: mant_low = 10'h0bd;
          4'h9: mant_low = 10'h0bf;
          4'ha: mant_low = 10'h0c1;
          4'hb: mant_low = 10'h0c4;
          4'hc: mant_low = 10'h0c6;
          4'hd: mant_low = 10'h0c8;
          4'he: mant_low = 10'h0ca;
          4'hf: mant_low = 10'h0cc;
          default: mant_low = 10'h000;
        endcase
      end
      6'h2c: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h0ce;
          4'h1: mant_low = 10'h0d0;
          4'h2: mant_low = 10'h0d2;
          4'h3: mant_low = 10'h0d5;
          4'h4: mant_low = 10'h0d7;
          4'h5: mant_low = 10'h0d9;
          4'h6: mant_low = 10'h0db;
          4'h7: mant_low = 10'h0dd;
          4'h8: mant_low = 10'h0df;
          4'h9: mant_low = 10'h0e2;
          4'ha: mant_low = 10'h0e4;
          4'hb: mant_low = 10'h0e6;
          4'hc: mant_low = 10'h0e8;
          4'hd: mant_low = 10'h0ea;
          4'he: mant_low = 10'h0ec;
          4'hf: mant_low = 10'h0ef;
          default: mant_low = 10'h000;
        endcase
      end
      6'h2d: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h0f1;
          4'h1: mant_low = 10'h0f3;
          4'h2: mant_low = 10'h0f5;
          4'h3: mant_low = 10'h0f7;
          4'h4: mant_low = 10'h0f9;
          4'h5: mant_low = 10'h0fc;
          4'h6: mant_low = 10'h0fe;
          4'h7: mant_low = 10'h100;
          4'h8: mant_low = 10'h102;
          4'h9: mant_low = 10'h104;
          4'ha: mant_low = 10'h107;
          4'hb: mant_low = 10'h109;
          4'hc: mant_low = 10'h10b;
          4'hd: mant_low = 10'h10d;
          4'he: mant_low = 10'h10f;
          4'hf: mant_low = 10'h112;
          default: mant_low = 10'h000;
        endcase
      end
      6'h2e: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h114;
          4'h1: mant_low = 10'h116;
          4'h2: mant_low = 10'h118;
          4'h3: mant_low = 10'h11a;
          4'h4: mant_low = 10'h11d;
          4'h5: mant_low = 10'h11f;
          4'h6: mant_low = 10'h121;
          4'h7: mant_low = 10'h123;
          4'h8: mant_low = 10'h126;
          4'h9: mant_low = 10'h128;
          4'ha: mant_low = 10'h12a;
          4'hb: mant_low = 10'h12c;
          4'hc: mant_low = 10'h12f;
          4'hd: mant_low = 10'h131;
          4'he: mant_low = 10'h133;
          4'hf: mant_low = 10'h135;
          default: mant_low = 10'h000;
        endcase
      end
      6'h2f: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h138;
          4'h1: mant_low = 10'h13a;
          4'h2: mant_low = 10'h13c;
          4'h3: mant_low = 10'h13e;
          4'h4: mant_low = 10'h141;
          4'h5: mant_low = 10'h143;
          4'h6: mant_low = 10'h145;
          4'h7: mant_low = 10'h147;
          4'h8: mant_low = 10'h14a;
          4'h9: mant_low = 10'h14c;
          4'ha: mant_low = 10'h14e;
          4'hb: mant_low = 10'h151;
          4'hc: mant_low = 10'h153;
          4'hd: mant_low = 10'h155;
          4'he: mant_low = 10'h157;
          4'hf: mant_low = 10'h15a;
          default: mant_low = 10'h000;
        endcase
      end
      6'h30: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h15c;
          4'h1: mant_low = 10'h15e;
          4'h2: mant_low = 10'h161;
          4'h3: mant_low = 10'h163;
          4'h4: mant_low = 10'h165;
          4'h5: mant_low = 10'h168;
          4'h6: mant_low = 10'h16a;
          4'h7: mant_low = 10'h16c;
          4'h8: mant_low = 10'h16e;
          4'h9: mant_low = 10'h171;
          4'ha: mant_low = 10'h173;
          4'hb: mant_low = 10'h175;
          4'hc: mant_low = 10'h178;
          4'hd: mant_low = 10'h17a;
          4'he: mant_low = 10'h17c;
          4'hf: mant_low = 10'h17f;
          default: mant_low = 10'h000;
        endcase
      end
      6'h31: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h181;
          4'h1: mant_low = 10'h183;
          4'h2: mant_low = 10'h186;
          4'h3: mant_low = 10'h188;
          4'h4: mant_low = 10'h18a;
          4'h5: mant_low = 10'h18d;
          4'h6: mant_low = 10'h18f;
          4'h7: mant_low = 10'h192;
          4'h8: mant_low = 10'h194;
          4'h9: mant_low = 10'h196;
          4'ha: mant_low = 10'h199;
          4'hb: mant_low = 10'h19b;
          4'hc: mant_low = 10'h19d;
          4'hd: mant_low = 10'h1a0;
          4'he: mant_low = 10'h1a2;
          4'hf: mant_low = 10'h1a4;
          default: mant_low = 10'h000;
        endcase
      end
      6'h32: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h1a7;
          4'h1: mant_low = 10'h1a9;
          4'h2: mant_low = 10'h1ac;
          4'h3: mant_low = 10'h1ae;
          4'h4: mant_low = 10'h1b0;
          4'h5: mant_low = 10'h1b3;
          4'h6: mant_low = 10'h1b5;
          4'h7: mant_low = 10'h1b8;
          4'h8: mant_low = 10'h1ba;
          4'h9: mant_low = 10'h1bc;
          4'ha: mant_low = 10'h1bf;
          4'hb: mant_low = 10'h1c1;
          4'hc: mant_low = 10'h1c4;
          4'hd: mant_low = 10'h1c6;
          4'he: mant_low = 10'h1c8;
          4'hf: mant_low = 10'h1cb;
          default: mant_low = 10'h000;
        endcase
      end
      6'h33: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h1cd;
          4'h1: mant_low = 10'h1d0;
          4'h2: mant_low = 10'h1d2;
          4'h3: mant_low = 10'h1d5;
          4'h4: mant_low = 10'h1d7;
          4'h5: mant_low = 10'h1d9;
          4'h6: mant_low = 10'h1dc;
          4'h7: mant_low = 10'h1de;
          4'h8: mant_low = 10'h1e1;
          4'h9: mant_low = 10'h1e3;
          4'ha: mant_low = 10'h1e6;
          4'hb: mant_low = 10'h1e8;
          4'hc: mant_low = 10'h1ea;
          4'hd: mant_low = 10'h1ed;
          4'he: mant_low = 10'h1ef;
          4'hf: mant_low = 10'h1f2;
          default: mant_low = 10'h000;
        endcase
      end
      6'h34: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h1f4;
          4'h1: mant_low = 10'h1f7;
          4'h2: mant_low = 10'h1f9;
          4'h3: mant_low = 10'h1fc;
          4'h4: mant_low = 10'h1fe;
          4'h5: mant_low = 10'h201;
          4'h6: mant_low = 10'h203;
          4'h7: mant_low = 10'h206;
          4'h8: mant_low = 10'h208;
          4'h9: mant_low = 10'h20b;
          4'ha: mant_low = 10'h20d;
          4'hb: mant_low = 10'h210;
          4'hc: mant_low = 10'h212;
          4'hd: mant_low = 10'h215;
          4'he: mant_low = 10'h217;
          4'hf: mant_low = 10'h21a;
          default: mant_low = 10'h000;
        endcase
      end
      6'h35: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h21c;
          4'h1: mant_low = 10'h21f;
          4'h2: mant_low = 10'h221;
          4'h3: mant_low = 10'h224;
          4'h4: mant_low = 10'h226;
          4'h5: mant_low = 10'h229;
          4'h6: mant_low = 10'h22b;
          4'h7: mant_low = 10'h22e;
          4'h8: mant_low = 10'h230;
          4'h9: mant_low = 10'h233;
          4'ha: mant_low = 10'h235;
          4'hb: mant_low = 10'h238;
          4'hc: mant_low = 10'h23a;
          4'hd: mant_low = 10'h23d;
          4'he: mant_low = 10'h23f;
          4'hf: mant_low = 10'h242;
          default: mant_low = 10'h000;
        endcase
      end
      6'h36: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h245;
          4'h1: mant_low = 10'h247;
          4'h2: mant_low = 10'h24a;
          4'h3: mant_low = 10'h24c;
          4'h4: mant_low = 10'h24f;
          4'h5: mant_low = 10'h251;
          4'h6: mant_low = 10'h254;
          4'h7: mant_low = 10'h256;
          4'h8: mant_low = 10'h259;
          4'h9: mant_low = 10'h25c;
          4'ha: mant_low = 10'h25e;
          4'hb: mant_low = 10'h261;
          4'hc: mant_low = 10'h263;
          4'hd: mant_low = 10'h266;
          4'he: mant_low = 10'h268;
          4'hf: mant_low = 10'h26b;
          default: mant_low = 10'h000;
        endcase
      end
      6'h37: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h26e;
          4'h1: mant_low = 10'h270;
          4'h2: mant_low = 10'h273;
          4'h3: mant_low = 10'h275;
          4'h4: mant_low = 10'h278;
          4'h5: mant_low = 10'h27b;
          4'h6: mant_low = 10'h27d;
          4'h7: mant_low = 10'h280;
          4'h8: mant_low = 10'h282;
          4'h9: mant_low = 10'h285;
          4'ha: mant_low = 10'h288;
          4'hb: mant_low = 10'h28a;
          4'hc: mant_low = 10'h28d;
          4'hd: mant_low = 10'h290;
          4'he: mant_low = 10'h292;
          4'hf: mant_low = 10'h295;
          default: mant_low = 10'h000;
        endcase
      end
      6'h38: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h298;
          4'h1: mant_low = 10'h29a;
          4'h2: mant_low = 10'h29d;
          4'h3: mant_low = 10'h29f;
          4'h4: mant_low = 10'h2a2;
          4'h5: mant_low = 10'h2a5;
          4'h6: mant_low = 10'h2a7;
          4'h7: mant_low = 10'h2aa;
          4'h8: mant_low = 10'h2ad;
          4'h9: mant_low = 10'h2af;
          4'ha: mant_low = 10'h2b2;
          4'hb: mant_low = 10'h2b5;
          4'hc: mant_low = 10'h2b7;
          4'hd: mant_low = 10'h2ba;
          4'he: mant_low = 10'h2bd;
          4'hf: mant_low = 10'h2bf;
          default: mant_low = 10'h000;
        endcase
      end
      6'h39: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h2c2;
          4'h1: mant_low = 10'h2c5;
          4'h2: mant_low = 10'h2c7;
          4'h3: mant_low = 10'h2ca;
          4'h4: mant_low = 10'h2cd;
          4'h5: mant_low = 10'h2cf;
          4'h6: mant_low = 10'h2d2;
          4'h7: mant_low = 10'h2d5;
          4'h8: mant_low = 10'h2d8;
          4'h9: mant_low = 10'h2da;
          4'ha: mant_low = 10'h2dd;
          4'hb: mant_low = 10'h2e0;
          4'hc: mant_low = 10'h2e2;
          4'hd: mant_low = 10'h2e5;
          4'he: mant_low = 10'h2e8;
          4'hf: mant_low = 10'h2eb;
          default: mant_low = 10'h000;
        endcase
      end
      6'h3a: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h2ed;
          4'h1: mant_low = 10'h2f0;
          4'h2: mant_low = 10'h2f3;
          4'h3: mant_low = 10'h2f5;
          4'h4: mant_low = 10'h2f8;
          4'h5: mant_low = 10'h2fb;
          4'h6: mant_low = 10'h2fe;
          4'h7: mant_low = 10'h300;
          4'h8: mant_low = 10'h303;
          4'h9: mant_low = 10'h306;
          4'ha: mant_low = 10'h309;
          4'hb: mant_low = 10'h30b;
          4'hc: mant_low = 10'h30e;
          4'hd: mant_low = 10'h311;
          4'he: mant_low = 10'h314;
          4'hf: mant_low = 10'h316;
          default: mant_low = 10'h000;
        endcase
      end
      6'h3b: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h319;
          4'h1: mant_low = 10'h31c;
          4'h2: mant_low = 10'h31f;
          4'h3: mant_low = 10'h322;
          4'h4: mant_low = 10'h324;
          4'h5: mant_low = 10'h327;
          4'h6: mant_low = 10'h32a;
          4'h7: mant_low = 10'h32d;
          4'h8: mant_low = 10'h330;
          4'h9: mant_low = 10'h332;
          4'ha: mant_low = 10'h335;
          4'hb: mant_low = 10'h338;
          4'hc: mant_low = 10'h33b;
          4'hd: mant_low = 10'h33e;
          4'he: mant_low = 10'h340;
          4'hf: mant_low = 10'h343;
          default: mant_low = 10'h000;
        endcase
      end
      6'h3c: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h346;
          4'h1: mant_low = 10'h349;
          4'h2: mant_low = 10'h34c;
          4'h3: mant_low = 10'h34e;
          4'h4: mant_low = 10'h351;
          4'h5: mant_low = 10'h354;
          4'h6: mant_low = 10'h357;
          4'h7: mant_low = 10'h35a;
          4'h8: mant_low = 10'h35d;
          4'h9: mant_low = 10'h35f;
          4'ha: mant_low = 10'h362;
          4'hb: mant_low = 10'h365;
          4'hc: mant_low = 10'h368;
          4'hd: mant_low = 10'h36b;
          4'he: mant_low = 10'h36e;
          4'hf: mant_low = 10'h370;
          default: mant_low = 10'h000;
        endcase
      end
      6'h3d: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h373;
          4'h1: mant_low = 10'h376;
          4'h2: mant_low = 10'h379;
          4'h3: mant_low = 10'h37c;
          4'h4: mant_low = 10'h37f;
          4'h5: mant_low = 10'h382;
          4'h6: mant_low = 10'h385;
          4'h7: mant_low = 10'h387;
          4'h8: mant_low = 10'h38a;
          4'h9: mant_low = 10'h38d;
          4'ha: mant_low = 10'h390;
          4'hb: mant_low = 10'h393;
          4'hc: mant_low = 10'h396;
          4'hd: mant_low = 10'h399;
          4'he: mant_low = 10'h39c;
          4'hf: mant_low = 10'h39f;
          default: mant_low = 10'h000;
        endcase
      end
      6'h3e: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h3a1;
          4'h1: mant_low = 10'h3a4;
          4'h2: mant_low = 10'h3a7;
          4'h3: mant_low = 10'h3aa;
          4'h4: mant_low = 10'h3ad;
          4'h5: mant_low = 10'h3b0;
          4'h6: mant_low = 10'h3b3;
          4'h7: mant_low = 10'h3b6;
          4'h8: mant_low = 10'h3b9;
          4'h9: mant_low = 10'h3bc;
          4'ha: mant_low = 10'h3bf;
          4'hb: mant_low = 10'h3c2;
          4'hc: mant_low = 10'h3c5;
          4'hd: mant_low = 10'h3c8;
          4'he: mant_low = 10'h3ca;
          4'hf: mant_low = 10'h3cd;
          default: mant_low = 10'h000;
        endcase
      end
      6'h3f: begin
        case (mant[3:0])
          4'h0: mant_low = 10'h3d0;
          4'h1: mant_low = 10'h3d3;
          4'h2: mant_low = 10'h3d6;
          4'h3: mant_low = 10'h3d9;
          4'h4: mant_low = 10'h3dc;
          4'h5: mant_low = 10'h3df;
          4'h6: mant_low = 10'h3e2;
          4'h7: mant_low = 10'h3e5;
          4'h8: mant_low = 10'h3e8;
          4'h9: mant_low = 10'h3eb;
          4'ha: mant_low = 10'h3ee;
          4'hb: mant_low = 10'h3f1;
          4'hc: mant_low = 10'h3f4;
          4'hd: mant_low = 10'h3f7;
          4'he: mant_low = 10'h3fa;
          4'hf: mant_low = 10'h3fd;
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
      5'h0a: begin
        case (mant[9:4])
          6'h00: boundary_low = 15'h0000;
          6'h01: boundary_low = 15'h0000;
          6'h02: boundary_low = 15'h0000;
          6'h03: boundary_low = 15'h0000;
          6'h04: boundary_low = 15'h0000;
          6'h05: boundary_low = 15'h0000;
          6'h06: boundary_low = 15'h0000;
          6'h07: boundary_low = 15'h0000;
          6'h08: boundary_low = 15'h0000;
          6'h09: boundary_low = 15'h0000;
          6'h0a: boundary_low = 15'h0000;
          6'h0b: boundary_low = 15'h0000;
          6'h0c: boundary_low = 15'h0000;
          6'h0d: boundary_low = 15'h0000;
          6'h0e: boundary_low = 15'h0000;
          6'h0f: boundary_low = 15'h0000;
          6'h10: begin
            case (mant[3:0])
              4'h0: boundary_low = 15'h0000;
              4'h1: boundary_low = 15'h0000;
              4'h2: boundary_low = 15'h0000;
              4'h3: boundary_low = 15'h0000;
              4'h4: boundary_low = 15'h0000;
              4'h5: boundary_low = 15'h0000;
              4'h6: boundary_low = 15'h0000;
              4'h7: boundary_low = 15'h0000;
              4'h8: boundary_low = 15'h0000;
              4'h9: boundary_low = 15'h0000;
              4'ha: boundary_low = 15'h0400;
              4'hb: boundary_low = 15'h0402;
              4'hc: boundary_low = 15'h0404;
              4'hd: boundary_low = 15'h0407;
              4'he: boundary_low = 15'h0409;
              4'hf: boundary_low = 15'h040c;
              default: boundary_low = 15'h0000;
            endcase
          end
          6'h11: begin
            case (mant[3:0])
              4'h0: boundary_low = 15'h040e;
              4'h1: boundary_low = 15'h0410;
              4'h2: boundary_low = 15'h0413;
              4'h3: boundary_low = 15'h0415;
              4'h4: boundary_low = 15'h0418;
              4'h5: boundary_low = 15'h041a;
              4'h6: boundary_low = 15'h041c;
              4'h7: boundary_low = 15'h041f;
              4'h8: boundary_low = 15'h0421;
              4'h9: boundary_low = 15'h0424;
              4'ha: boundary_low = 15'h0426;
              4'hb: boundary_low = 15'h0429;
              4'hc: boundary_low = 15'h042b;
              4'hd: boundary_low = 15'h042e;
              4'he: boundary_low = 15'h0430;
              4'hf: boundary_low = 15'h0432;
              default: boundary_low = 15'h0000;
            endcase
          end
          6'h12: begin
            case (mant[3:0])
              4'h0: boundary_low = 15'h0435;
              4'h1: boundary_low = 15'h0437;
              4'h2: boundary_low = 15'h043a;
              4'h3: boundary_low = 15'h043c;
              4'h4: boundary_low = 15'h043f;
              4'h5: boundary_low = 15'h0441;
              4'h6: boundary_low = 15'h0444;
              4'h7: boundary_low = 15'h0446;
              4'h8: boundary_low = 15'h0449;
              4'h9: boundary_low = 15'h044b;
              4'ha: boundary_low = 15'h044e;
              4'hb: boundary_low = 15'h0450;
              4'hc: boundary_low = 15'h0453;
              4'hd: boundary_low = 15'h0455;
              4'he: boundary_low = 15'h0458;
              4'hf: boundary_low = 15'h045a;
              default: boundary_low = 15'h0000;
            endcase
          end
          6'h13: begin
            case (mant[3:0])
              4'h0: boundary_low = 15'h045d;
              4'h1: boundary_low = 15'h045f;
              4'h2: boundary_low = 15'h0462;
              4'h3: boundary_low = 15'h0464;
              4'h4: boundary_low = 15'h0467;
              4'h5: boundary_low = 15'h0469;
              4'h6: boundary_low = 15'h046c;
              4'h7: boundary_low = 15'h046f;
              4'h8: boundary_low = 15'h0471;
              4'h9: boundary_low = 15'h0474;
              4'ha: boundary_low = 15'h0476;
              4'hb: boundary_low = 15'h0479;
              4'hc: boundary_low = 15'h047b;
              4'hd: boundary_low = 15'h047e;
              4'he: boundary_low = 15'h0480;
              4'hf: boundary_low = 15'h0483;
              default: boundary_low = 15'h0000;
            endcase
          end
          6'h14: begin
            case (mant[3:0])
              4'h0: boundary_low = 15'h0486;
              4'h1: boundary_low = 15'h0488;
              4'h2: boundary_low = 15'h048b;
              4'h3: boundary_low = 15'h048d;
              4'h4: boundary_low = 15'h0490;
              4'h5: boundary_low = 15'h0493;
              4'h6: boundary_low = 15'h0495;
              4'h7: boundary_low = 15'h0498;
              4'h8: boundary_low = 15'h049a;
              4'h9: boundary_low = 15'h049d;
              4'ha: boundary_low = 15'h04a0;
              4'hb: boundary_low = 15'h04a2;
              4'hc: boundary_low = 15'h04a5;
              4'hd: boundary_low = 15'h04a8;
              4'he: boundary_low = 15'h04aa;
              4'hf: boundary_low = 15'h04ad;
              default: boundary_low = 15'h0000;
            endcase
          end
          6'h15: begin
            case (mant[3:0])
              4'h0: boundary_low = 15'h04af;
              4'h1: boundary_low = 15'h04b2;
              4'h2: boundary_low = 15'h04b5;
              4'h3: boundary_low = 15'h04b7;
              4'h4: boundary_low = 15'h04ba;
              4'h5: boundary_low = 15'h04bd;
              4'h6: boundary_low = 15'h04bf;
              4'h7: boundary_low = 15'h04c2;
              4'h8: boundary_low = 15'h04c5;
              4'h9: boundary_low = 15'h04c7;
              4'ha: boundary_low = 15'h04ca;
              4'hb: boundary_low = 15'h04cd;
              4'hc: boundary_low = 15'h04cf;
              4'hd: boundary_low = 15'h04d2;
              4'he: boundary_low = 15'h04d5;
              4'hf: boundary_low = 15'h04d8;
              default: boundary_low = 15'h0000;
            endcase
          end
          6'h16: begin
            case (mant[3:0])
              4'h0: boundary_low = 15'h04da;
              4'h1: boundary_low = 15'h04dd;
              4'h2: boundary_low = 15'h04e0;
              4'h3: boundary_low = 15'h04e2;
              4'h4: boundary_low = 15'h04e5;
              4'h5: boundary_low = 15'h04e8;
              4'h6: boundary_low = 15'h04eb;
              4'h7: boundary_low = 15'h04ed;
              4'h8: boundary_low = 15'h04f0;
              4'h9: boundary_low = 15'h04f3;
              4'ha: boundary_low = 15'h04f6;
              4'hb: boundary_low = 15'h04f8;
              4'hc: boundary_low = 15'h04fb;
              4'hd: boundary_low = 15'h04fe;
              4'he: boundary_low = 15'h0501;
              4'hf: boundary_low = 15'h0503;
              default: boundary_low = 15'h0000;
            endcase
          end
          6'h17: begin
            case (mant[3:0])
              4'h0: boundary_low = 15'h0506;
              4'h1: boundary_low = 15'h0509;
              4'h2: boundary_low = 15'h050c;
              4'h3: boundary_low = 15'h050e;
              4'h4: boundary_low = 15'h0511;
              4'h5: boundary_low = 15'h0514;
              4'h6: boundary_low = 15'h0517;
              4'h7: boundary_low = 15'h051a;
              4'h8: boundary_low = 15'h051c;
              4'h9: boundary_low = 15'h051f;
              4'ha: boundary_low = 15'h0522;
              4'hb: boundary_low = 15'h0525;
              4'hc: boundary_low = 15'h0528;
              4'hd: boundary_low = 15'h052b;
              4'he: boundary_low = 15'h052d;
              4'hf: boundary_low = 15'h0530;
              default: boundary_low = 15'h0000;
            endcase
          end
          6'h18: begin
            case (mant[3:0])
              4'h0: boundary_low = 15'h0533;
              4'h1: boundary_low = 15'h0536;
              4'h2: boundary_low = 15'h0539;
              4'h3: boundary_low = 15'h053c;
              4'h4: boundary_low = 15'h053e;
              4'h5: boundary_low = 15'h0541;
              4'h6: boundary_low = 15'h0544;
              4'h7: boundary_low = 15'h0547;
              4'h8: boundary_low = 15'h054a;
              4'h9: boundary_low = 15'h054d;
              4'ha: boundary_low = 15'h0550;
              4'hb: boundary_low = 15'h0552;
              4'hc: boundary_low = 15'h0555;
              4'hd: boundary_low = 15'h0558;
              4'he: boundary_low = 15'h055b;
              4'hf: boundary_low = 15'h055e;
              default: boundary_low = 15'h0000;
            endcase
          end
          6'h19: begin
            case (mant[3:0])
              4'h0: boundary_low = 15'h0561;
              4'h1: boundary_low = 15'h0564;
              4'h2: boundary_low = 15'h0567;
              4'h3: boundary_low = 15'h056a;
              4'h4: boundary_low = 15'h056d;
              4'h5: boundary_low = 15'h056f;
              4'h6: boundary_low = 15'h0572;
              4'h7: boundary_low = 15'h0575;
              4'h8: boundary_low = 15'h0578;
              4'h9: boundary_low = 15'h057b;
              4'ha: boundary_low = 15'h057e;
              4'hb: boundary_low = 15'h0581;
              4'hc: boundary_low = 15'h0584;
              4'hd: boundary_low = 15'h0587;
              4'he: boundary_low = 15'h058a;
              4'hf: boundary_low = 15'h058d;
              default: boundary_low = 15'h0000;
            endcase
          end
          6'h1a: begin
            case (mant[3:0])
              4'h0: boundary_low = 15'h0590;
              4'h1: boundary_low = 15'h0593;
              4'h2: boundary_low = 15'h0596;
              4'h3: boundary_low = 15'h0599;
              4'h4: boundary_low = 15'h059c;
              4'h5: boundary_low = 15'h059f;
              4'h6: boundary_low = 15'h05a2;
              4'h7: boundary_low = 15'h05a5;
              4'h8: boundary_low = 15'h05a8;
              4'h9: boundary_low = 15'h05ab;
              4'ha: boundary_low = 15'h05ae;
              4'hb: boundary_low = 15'h05b1;
              4'hc: boundary_low = 15'h05b4;
              4'hd: boundary_low = 15'h05b7;
              4'he: boundary_low = 15'h05ba;
              4'hf: boundary_low = 15'h05bd;
              default: boundary_low = 15'h0000;
            endcase
          end
          6'h1b: begin
            case (mant[3:0])
              4'h0: boundary_low = 15'h05c0;
              4'h1: boundary_low = 15'h05c3;
              4'h2: boundary_low = 15'h05c6;
              4'h3: boundary_low = 15'h05c9;
              4'h4: boundary_low = 15'h05cc;
              4'h5: boundary_low = 15'h05cf;
              4'h6: boundary_low = 15'h05d2;
              4'h7: boundary_low = 15'h05d5;
              4'h8: boundary_low = 15'h05d8;
              4'h9: boundary_low = 15'h05db;
              4'ha: boundary_low = 15'h05de;
              4'hb: boundary_low = 15'h05e1;
              4'hc: boundary_low = 15'h05e5;
              4'hd: boundary_low = 15'h05e8;
              4'he: boundary_low = 15'h05eb;
              4'hf: boundary_low = 15'h05ee;
              default: boundary_low = 15'h0000;
            endcase
          end
          6'h1c: begin
            case (mant[3:0])
              4'h0: boundary_low = 15'h05f1;
              4'h1: boundary_low = 15'h05f4;
              4'h2: boundary_low = 15'h05f7;
              4'h3: boundary_low = 15'h05fa;
              4'h4: boundary_low = 15'h05fd;
              4'h5: boundary_low = 15'h0600;
              4'h6: boundary_low = 15'h0604;
              4'h7: boundary_low = 15'h0607;
              4'h8: boundary_low = 15'h060a;
              4'h9: boundary_low = 15'h060d;
              4'ha: boundary_low = 15'h0610;
              4'hb: boundary_low = 15'h0613;
              4'hc: boundary_low = 15'h0616;
              4'hd: boundary_low = 15'h061a;
              4'he: boundary_low = 15'h061d;
              4'hf: boundary_low = 15'h0620;
              default: boundary_low = 15'h0000;
            endcase
          end
          6'h1d: begin
            case (mant[3:0])
              4'h0: boundary_low = 15'h0623;
              4'h1: boundary_low = 15'h0626;
              4'h2: boundary_low = 15'h0629;
              4'h3: boundary_low = 15'h062d;
              4'h4: boundary_low = 15'h0630;
              4'h5: boundary_low = 15'h0633;
              4'h6: boundary_low = 15'h0636;
              4'h7: boundary_low = 15'h0639;
              4'h8: boundary_low = 15'h063c;
              4'h9: boundary_low = 15'h0640;
              4'ha: boundary_low = 15'h0643;
              4'hb: boundary_low = 15'h0646;
              4'hc: boundary_low = 15'h0649;
              4'hd: boundary_low = 15'h064d;
              4'he: boundary_low = 15'h0650;
              4'hf: boundary_low = 15'h0653;
              default: boundary_low = 15'h0000;
            endcase
          end
          6'h1e: begin
            case (mant[3:0])
              4'h0: boundary_low = 15'h0656;
              4'h1: boundary_low = 15'h0659;
              4'h2: boundary_low = 15'h065d;
              4'h3: boundary_low = 15'h0660;
              4'h4: boundary_low = 15'h0663;
              4'h5: boundary_low = 15'h0666;
              4'h6: boundary_low = 15'h066a;
              4'h7: boundary_low = 15'h066d;
              4'h8: boundary_low = 15'h0670;
              4'h9: boundary_low = 15'h0674;
              4'ha: boundary_low = 15'h0677;
              4'hb: boundary_low = 15'h067a;
              4'hc: boundary_low = 15'h067d;
              4'hd: boundary_low = 15'h0681;
              4'he: boundary_low = 15'h0684;
              4'hf: boundary_low = 15'h0687;
              default: boundary_low = 15'h0000;
            endcase
          end
          6'h1f: begin
            case (mant[3:0])
              4'h0: boundary_low = 15'h068b;
              4'h1: boundary_low = 15'h068e;
              4'h2: boundary_low = 15'h0691;
              4'h3: boundary_low = 15'h0694;
              4'h4: boundary_low = 15'h0698;
              4'h5: boundary_low = 15'h069b;
              4'h6: boundary_low = 15'h069e;
              4'h7: boundary_low = 15'h06a2;
              4'h8: boundary_low = 15'h06a5;
              4'h9: boundary_low = 15'h06a8;
              4'ha: boundary_low = 15'h06ac;
              4'hb: boundary_low = 15'h06af;
              4'hc: boundary_low = 15'h06b3;
              4'hd: boundary_low = 15'h06b6;
              4'he: boundary_low = 15'h06b9;
              4'hf: boundary_low = 15'h06bd;
              default: boundary_low = 15'h0000;
            endcase
          end
          6'h20: begin
            case (mant[3:0])
              4'h0: boundary_low = 15'h06c0;
              4'h1: boundary_low = 15'h06c3;
              4'h2: boundary_low = 15'h06c7;
              4'h3: boundary_low = 15'h06ca;
              4'h4: boundary_low = 15'h06ce;
              4'h5: boundary_low = 15'h06d1;
              4'h6: boundary_low = 15'h06d4;
              4'h7: boundary_low = 15'h06d8;
              4'h8: boundary_low = 15'h06db;
              4'h9: boundary_low = 15'h06df;
              4'ha: boundary_low = 15'h06e2;
              4'hb: boundary_low = 15'h06e5;
              4'hc: boundary_low = 15'h06e9;
              4'hd: boundary_low = 15'h06ec;
              4'he: boundary_low = 15'h06f0;
              4'hf: boundary_low = 15'h06f3;
              default: boundary_low = 15'h0000;
            endcase
          end
          6'h21: begin
            case (mant[3:0])
              4'h0: boundary_low = 15'h06f7;
              4'h1: boundary_low = 15'h06fa;
              4'h2: boundary_low = 15'h06fd;
              4'h3: boundary_low = 15'h0701;
              4'h4: boundary_low = 15'h0704;
              4'h5: boundary_low = 15'h0708;
              4'h6: boundary_low = 15'h070b;
              4'h7: boundary_low = 15'h070f;
              4'h8: boundary_low = 15'h0712;
              4'h9: boundary_low = 15'h0716;
              4'ha: boundary_low = 15'h0719;
              4'hb: boundary_low = 15'h071d;
              4'hc: boundary_low = 15'h0720;
              4'hd: boundary_low = 15'h0724;
              4'he: boundary_low = 15'h0727;
              4'hf: boundary_low = 15'h072b;
              default: boundary_low = 15'h0000;
            endcase
          end
          6'h22: begin
            case (mant[3:0])
              4'h0: boundary_low = 15'h072e;
              4'h1: boundary_low = 15'h0732;
              4'h2: boundary_low = 15'h0735;
              4'h3: boundary_low = 15'h0739;
              4'h4: boundary_low = 15'h073c;
              4'h5: boundary_low = 15'h0740;
              4'h6: boundary_low = 15'h0743;
              4'h7: boundary_low = 15'h0747;
              4'h8: boundary_low = 15'h074b;
              4'h9: boundary_low = 15'h074e;
              4'ha: boundary_low = 15'h0752;
              4'hb: boundary_low = 15'h0755;
              4'hc: boundary_low = 15'h0759;
              4'hd: boundary_low = 15'h075c;
              4'he: boundary_low = 15'h0760;
              4'hf: boundary_low = 15'h0764;
              default: boundary_low = 15'h0000;
            endcase
          end
          6'h23: begin
            case (mant[3:0])
              4'h0: boundary_low = 15'h0767;
              4'h1: boundary_low = 15'h076b;
              4'h2: boundary_low = 15'h076e;
              4'h3: boundary_low = 15'h0772;
              4'h4: boundary_low = 15'h0776;
              4'h5: boundary_low = 15'h0779;
              4'h6: boundary_low = 15'h077d;
              4'h7: boundary_low = 15'h0780;
              4'h8: boundary_low = 15'h0784;
              4'h9: boundary_low = 15'h0788;
              4'ha: boundary_low = 15'h078b;
              4'hb: boundary_low = 15'h078f;
              4'hc: boundary_low = 15'h0793;
              4'hd: boundary_low = 15'h0796;
              4'he: boundary_low = 15'h079a;
              4'hf: boundary_low = 15'h079d;
              default: boundary_low = 15'h0000;
            endcase
          end
          6'h24: begin
            case (mant[3:0])
              4'h0: boundary_low = 15'h07a1;
              4'h1: boundary_low = 15'h07a5;
              4'h2: boundary_low = 15'h07a8;
              4'h3: boundary_low = 15'h07ac;
              4'h4: boundary_low = 15'h07b0;
              4'h5: boundary_low = 15'h07b3;
              4'h6: boundary_low = 15'h07b7;
              4'h7: boundary_low = 15'h07bb;
              4'h8: boundary_low = 15'h07bf;
              4'h9: boundary_low = 15'h07c2;
              4'ha: boundary_low = 15'h07c6;
              4'hb: boundary_low = 15'h07ca;
              4'hc: boundary_low = 15'h07cd;
              4'hd: boundary_low = 15'h07d1;
              4'he: boundary_low = 15'h07d5;
              4'hf: boundary_low = 15'h07d9;
              default: boundary_low = 15'h0000;
            endcase
          end
          6'h25: begin
            case (mant[3:0])
              4'h0: boundary_low = 15'h07dc;
              4'h1: boundary_low = 15'h07e0;
              4'h2: boundary_low = 15'h07e4;
              4'h3: boundary_low = 15'h07e8;
              4'h4: boundary_low = 15'h07eb;
              4'h5: boundary_low = 15'h07ef;
              4'h6: boundary_low = 15'h07f3;
              4'h7: boundary_low = 15'h07f7;
              4'h8: boundary_low = 15'h07fa;
              4'h9: boundary_low = 15'h07fe;
              4'ha: boundary_low = 15'h0801;
              4'hb: boundary_low = 15'h0803;
              4'hc: boundary_low = 15'h0805;
              4'hd: boundary_low = 15'h0807;
              4'he: boundary_low = 15'h0809;
              4'hf: boundary_low = 15'h080a;
              default: boundary_low = 15'h0000;
            endcase
          end
          6'h26: begin
            case (mant[3:0])
              4'h0: boundary_low = 15'h080c;
              4'h1: boundary_low = 15'h080e;
              4'h2: boundary_low = 15'h0810;
              4'h3: boundary_low = 15'h0812;
              4'h4: boundary_low = 15'h0814;
              4'h5: boundary_low = 15'h0816;
              4'h6: boundary_low = 15'h0818;
              4'h7: boundary_low = 15'h081a;
              4'h8: boundary_low = 15'h081c;
              4'h9: boundary_low = 15'h081e;
              4'ha: boundary_low = 15'h0820;
              4'hb: boundary_low = 15'h0821;
              4'hc: boundary_low = 15'h0823;
              4'hd: boundary_low = 15'h0825;
              4'he: boundary_low = 15'h0827;
              4'hf: boundary_low = 15'h0829;
              default: boundary_low = 15'h0000;
            endcase
          end
          6'h27: begin
            case (mant[3:0])
              4'h0: boundary_low = 15'h082b;
              4'h1: boundary_low = 15'h082d;
              4'h2: boundary_low = 15'h082f;
              4'h3: boundary_low = 15'h0831;
              4'h4: boundary_low = 15'h0833;
              4'h5: boundary_low = 15'h0835;
              4'h6: boundary_low = 15'h0837;
              4'h7: boundary_low = 15'h0839;
              4'h8: boundary_low = 15'h083b;
              4'h9: boundary_low = 15'h083d;
              4'ha: boundary_low = 15'h083f;
              4'hb: boundary_low = 15'h0841;
              4'hc: boundary_low = 15'h0843;
              4'hd: boundary_low = 15'h0845;
              4'he: boundary_low = 15'h0847;
              4'hf: boundary_low = 15'h0849;
              default: boundary_low = 15'h0000;
            endcase
          end
          6'h28: begin
            case (mant[3:0])
              4'h0: boundary_low = 15'h084a;
              4'h1: boundary_low = 15'h084c;
              4'h2: boundary_low = 15'h084e;
              4'h3: boundary_low = 15'h0850;
              4'h4: boundary_low = 15'h0852;
              4'h5: boundary_low = 15'h0854;
              4'h6: boundary_low = 15'h0856;
              4'h7: boundary_low = 15'h0858;
              4'h8: boundary_low = 15'h085a;
              4'h9: boundary_low = 15'h085c;
              4'ha: boundary_low = 15'h085e;
              4'hb: boundary_low = 15'h0860;
              4'hc: boundary_low = 15'h0862;
              4'hd: boundary_low = 15'h0864;
              4'he: boundary_low = 15'h0866;
              4'hf: boundary_low = 15'h0868;
              default: boundary_low = 15'h0000;
            endcase
          end
          6'h29: begin
            case (mant[3:0])
              4'h0: boundary_low = 15'h086a;
              4'h1: boundary_low = 15'h086d;
              4'h2: boundary_low = 15'h086f;
              4'h3: boundary_low = 15'h0871;
              4'h4: boundary_low = 15'h0873;
              4'h5: boundary_low = 15'h0875;
              4'h6: boundary_low = 15'h0877;
              4'h7: boundary_low = 15'h0879;
              4'h8: boundary_low = 15'h087b;
              4'h9: boundary_low = 15'h087d;
              4'ha: boundary_low = 15'h087f;
              4'hb: boundary_low = 15'h0881;
              4'hc: boundary_low = 15'h0883;
              4'hd: boundary_low = 15'h0885;
              4'he: boundary_low = 15'h0887;
              4'hf: boundary_low = 15'h0889;
              default: boundary_low = 15'h0000;
            endcase
          end
          6'h2a: begin
            case (mant[3:0])
              4'h0: boundary_low = 15'h088b;
              4'h1: boundary_low = 15'h088d;
              4'h2: boundary_low = 15'h088f;
              4'h3: boundary_low = 15'h0891;
              4'h4: boundary_low = 15'h0893;
              4'h5: boundary_low = 15'h0895;
              4'h6: boundary_low = 15'h0897;
              4'h7: boundary_low = 15'h089a;
              4'h8: boundary_low = 15'h089c;
              4'h9: boundary_low = 15'h089e;
              4'ha: boundary_low = 15'h08a0;
              4'hb: boundary_low = 15'h08a2;
              4'hc: boundary_low = 15'h08a4;
              4'hd: boundary_low = 15'h08a6;
              4'he: boundary_low = 15'h08a8;
              4'hf: boundary_low = 15'h08aa;
              default: boundary_low = 15'h0000;
            endcase
          end
          6'h2b: begin
            case (mant[3:0])
              4'h0: boundary_low = 15'h08ac;
              4'h1: boundary_low = 15'h08ae;
              4'h2: boundary_low = 15'h08b1;
              4'h3: boundary_low = 15'h08b3;
              4'h4: boundary_low = 15'h08b5;
              4'h5: boundary_low = 15'h08b7;
              4'h6: boundary_low = 15'h08b9;
              4'h7: boundary_low = 15'h08bb;
              4'h8: boundary_low = 15'h08bd;
              4'h9: boundary_low = 15'h08bf;
              4'ha: boundary_low = 15'h08c1;
              4'hb: boundary_low = 15'h08c4;
              4'hc: boundary_low = 15'h08c6;
              4'hd: boundary_low = 15'h08c8;
              4'he: boundary_low = 15'h08ca;
              4'hf: boundary_low = 15'h08cc;
              default: boundary_low = 15'h0000;
            endcase
          end
          6'h2c: begin
            case (mant[3:0])
              4'h0: boundary_low = 15'h08ce;
              4'h1: boundary_low = 15'h08d0;
              4'h2: boundary_low = 15'h08d2;
              4'h3: boundary_low = 15'h08d5;
              4'h4: boundary_low = 15'h08d7;
              4'h5: boundary_low = 15'h08d9;
              4'h6: boundary_low = 15'h08db;
              4'h7: boundary_low = 15'h08dd;
              4'h8: boundary_low = 15'h08df;
              4'h9: boundary_low = 15'h08e2;
              4'ha: boundary_low = 15'h08e4;
              4'hb: boundary_low = 15'h08e6;
              4'hc: boundary_low = 15'h08e8;
              4'hd: boundary_low = 15'h08ea;
              4'he: boundary_low = 15'h08ec;
              4'hf: boundary_low = 15'h08ef;
              default: boundary_low = 15'h0000;
            endcase
          end
          6'h2d: begin
            case (mant[3:0])
              4'h0: boundary_low = 15'h08f1;
              4'h1: boundary_low = 15'h08f3;
              4'h2: boundary_low = 15'h08f5;
              4'h3: boundary_low = 15'h08f7;
              4'h4: boundary_low = 15'h08f9;
              4'h5: boundary_low = 15'h08fc;
              4'h6: boundary_low = 15'h08fe;
              4'h7: boundary_low = 15'h0900;
              4'h8: boundary_low = 15'h0902;
              4'h9: boundary_low = 15'h0904;
              4'ha: boundary_low = 15'h0907;
              4'hb: boundary_low = 15'h0909;
              4'hc: boundary_low = 15'h090b;
              4'hd: boundary_low = 15'h090d;
              4'he: boundary_low = 15'h090f;
              4'hf: boundary_low = 15'h0912;
              default: boundary_low = 15'h0000;
            endcase
          end
          6'h2e: begin
            case (mant[3:0])
              4'h0: boundary_low = 15'h0914;
              4'h1: boundary_low = 15'h0916;
              4'h2: boundary_low = 15'h0918;
              4'h3: boundary_low = 15'h091a;
              4'h4: boundary_low = 15'h091d;
              4'h5: boundary_low = 15'h091f;
              4'h6: boundary_low = 15'h0921;
              4'h7: boundary_low = 15'h0923;
              4'h8: boundary_low = 15'h0926;
              4'h9: boundary_low = 15'h0928;
              4'ha: boundary_low = 15'h092a;
              4'hb: boundary_low = 15'h092c;
              4'hc: boundary_low = 15'h092f;
              4'hd: boundary_low = 15'h0931;
              4'he: boundary_low = 15'h0933;
              4'hf: boundary_low = 15'h0935;
              default: boundary_low = 15'h0000;
            endcase
          end
          6'h2f: begin
            case (mant[3:0])
              4'h0: boundary_low = 15'h0938;
              4'h1: boundary_low = 15'h093a;
              4'h2: boundary_low = 15'h093c;
              4'h3: boundary_low = 15'h093e;
              4'h4: boundary_low = 15'h0941;
              4'h5: boundary_low = 15'h0943;
              4'h6: boundary_low = 15'h0945;
              4'h7: boundary_low = 15'h0947;
              4'h8: boundary_low = 15'h094a;
              4'h9: boundary_low = 15'h094c;
              4'ha: boundary_low = 15'h094e;
              4'hb: boundary_low = 15'h0951;
              4'hc: boundary_low = 15'h0953;
              4'hd: boundary_low = 15'h0955;
              4'he: boundary_low = 15'h0957;
              4'hf: boundary_low = 15'h095a;
              default: boundary_low = 15'h0000;
            endcase
          end
          6'h30: begin
            case (mant[3:0])
              4'h0: boundary_low = 15'h095c;
              4'h1: boundary_low = 15'h095e;
              4'h2: boundary_low = 15'h0961;
              4'h3: boundary_low = 15'h0963;
              4'h4: boundary_low = 15'h0965;
              4'h5: boundary_low = 15'h0968;
              4'h6: boundary_low = 15'h096a;
              4'h7: boundary_low = 15'h096c;
              4'h8: boundary_low = 15'h096e;
              4'h9: boundary_low = 15'h0971;
              4'ha: boundary_low = 15'h0973;
              4'hb: boundary_low = 15'h0975;
              4'hc: boundary_low = 15'h0978;
              4'hd: boundary_low = 15'h097a;
              4'he: boundary_low = 15'h097c;
              4'hf: boundary_low = 15'h097f;
              default: boundary_low = 15'h0000;
            endcase
          end
          6'h31: begin
            case (mant[3:0])
              4'h0: boundary_low = 15'h0981;
              4'h1: boundary_low = 15'h0983;
              4'h2: boundary_low = 15'h0986;
              4'h3: boundary_low = 15'h0988;
              4'h4: boundary_low = 15'h098a;
              4'h5: boundary_low = 15'h098d;
              4'h6: boundary_low = 15'h098f;
              4'h7: boundary_low = 15'h0992;
              4'h8: boundary_low = 15'h0994;
              4'h9: boundary_low = 15'h0996;
              4'ha: boundary_low = 15'h0999;
              4'hb: boundary_low = 15'h099b;
              4'hc: boundary_low = 15'h099d;
              4'hd: boundary_low = 15'h09a0;
              4'he: boundary_low = 15'h09a2;
              4'hf: boundary_low = 15'h09a4;
              default: boundary_low = 15'h0000;
            endcase
          end
          6'h32: begin
            case (mant[3:0])
              4'h0: boundary_low = 15'h09a7;
              4'h1: boundary_low = 15'h09a9;
              4'h2: boundary_low = 15'h09ac;
              4'h3: boundary_low = 15'h09ae;
              4'h4: boundary_low = 15'h09b0;
              4'h5: boundary_low = 15'h09b3;
              4'h6: boundary_low = 15'h09b5;
              4'h7: boundary_low = 15'h09b8;
              4'h8: boundary_low = 15'h09ba;
              4'h9: boundary_low = 15'h09bc;
              4'ha: boundary_low = 15'h09bf;
              4'hb: boundary_low = 15'h09c1;
              4'hc: boundary_low = 15'h09c4;
              4'hd: boundary_low = 15'h09c6;
              4'he: boundary_low = 15'h09c8;
              4'hf: boundary_low = 15'h09cb;
              default: boundary_low = 15'h0000;
            endcase
          end
          6'h33: begin
            case (mant[3:0])
              4'h0: boundary_low = 15'h09cd;
              4'h1: boundary_low = 15'h09d0;
              4'h2: boundary_low = 15'h09d2;
              4'h3: boundary_low = 15'h09d5;
              4'h4: boundary_low = 15'h09d7;
              4'h5: boundary_low = 15'h09d9;
              4'h6: boundary_low = 15'h09dc;
              4'h7: boundary_low = 15'h09de;
              4'h8: boundary_low = 15'h09e1;
              4'h9: boundary_low = 15'h09e3;
              4'ha: boundary_low = 15'h09e6;
              4'hb: boundary_low = 15'h09e8;
              4'hc: boundary_low = 15'h09ea;
              4'hd: boundary_low = 15'h09ed;
              4'he: boundary_low = 15'h09ef;
              4'hf: boundary_low = 15'h09f2;
              default: boundary_low = 15'h0000;
            endcase
          end
          6'h34: begin
            case (mant[3:0])
              4'h0: boundary_low = 15'h09f4;
              4'h1: boundary_low = 15'h09f7;
              4'h2: boundary_low = 15'h09f9;
              4'h3: boundary_low = 15'h09fc;
              4'h4: boundary_low = 15'h09fe;
              4'h5: boundary_low = 15'h0a01;
              4'h6: boundary_low = 15'h0a03;
              4'h7: boundary_low = 15'h0a06;
              4'h8: boundary_low = 15'h0a08;
              4'h9: boundary_low = 15'h0a0b;
              4'ha: boundary_low = 15'h0a0d;
              4'hb: boundary_low = 15'h0a10;
              4'hc: boundary_low = 15'h0a12;
              4'hd: boundary_low = 15'h0a15;
              4'he: boundary_low = 15'h0a17;
              4'hf: boundary_low = 15'h0a1a;
              default: boundary_low = 15'h0000;
            endcase
          end
          6'h35: begin
            case (mant[3:0])
              4'h0: boundary_low = 15'h0a1c;
              4'h1: boundary_low = 15'h0a1f;
              4'h2: boundary_low = 15'h0a21;
              4'h3: boundary_low = 15'h0a24;
              4'h4: boundary_low = 15'h0a26;
              4'h5: boundary_low = 15'h0a29;
              4'h6: boundary_low = 15'h0a2b;
              4'h7: boundary_low = 15'h0a2e;
              4'h8: boundary_low = 15'h0a30;
              4'h9: boundary_low = 15'h0a33;
              4'ha: boundary_low = 15'h0a35;
              4'hb: boundary_low = 15'h0a38;
              4'hc: boundary_low = 15'h0a3a;
              4'hd: boundary_low = 15'h0a3d;
              4'he: boundary_low = 15'h0a3f;
              4'hf: boundary_low = 15'h0a42;
              default: boundary_low = 15'h0000;
            endcase
          end
          6'h36: begin
            case (mant[3:0])
              4'h0: boundary_low = 15'h0a45;
              4'h1: boundary_low = 15'h0a47;
              4'h2: boundary_low = 15'h0a4a;
              4'h3: boundary_low = 15'h0a4c;
              4'h4: boundary_low = 15'h0a4f;
              4'h5: boundary_low = 15'h0a51;
              4'h6: boundary_low = 15'h0a54;
              4'h7: boundary_low = 15'h0a56;
              4'h8: boundary_low = 15'h0a59;
              4'h9: boundary_low = 15'h0a5c;
              4'ha: boundary_low = 15'h0a5e;
              4'hb: boundary_low = 15'h0a61;
              4'hc: boundary_low = 15'h0a63;
              4'hd: boundary_low = 15'h0a66;
              4'he: boundary_low = 15'h0a68;
              4'hf: boundary_low = 15'h0a6b;
              default: boundary_low = 15'h0000;
            endcase
          end
          6'h37: begin
            case (mant[3:0])
              4'h0: boundary_low = 15'h0a6e;
              4'h1: boundary_low = 15'h0a70;
              4'h2: boundary_low = 15'h0a73;
              4'h3: boundary_low = 15'h0a75;
              4'h4: boundary_low = 15'h0a78;
              4'h5: boundary_low = 15'h0a7b;
              4'h6: boundary_low = 15'h0a7d;
              4'h7: boundary_low = 15'h0a80;
              4'h8: boundary_low = 15'h0a82;
              4'h9: boundary_low = 15'h0a85;
              4'ha: boundary_low = 15'h0a88;
              4'hb: boundary_low = 15'h0a8a;
              4'hc: boundary_low = 15'h0a8d;
              4'hd: boundary_low = 15'h0a90;
              4'he: boundary_low = 15'h0a92;
              4'hf: boundary_low = 15'h0a95;
              default: boundary_low = 15'h0000;
            endcase
          end
          6'h38: begin
            case (mant[3:0])
              4'h0: boundary_low = 15'h0a98;
              4'h1: boundary_low = 15'h0a9a;
              4'h2: boundary_low = 15'h0a9d;
              4'h3: boundary_low = 15'h0a9f;
              4'h4: boundary_low = 15'h0aa2;
              4'h5: boundary_low = 15'h0aa5;
              4'h6: boundary_low = 15'h0aa7;
              4'h7: boundary_low = 15'h0aaa;
              4'h8: boundary_low = 15'h0aad;
              4'h9: boundary_low = 15'h0aaf;
              4'ha: boundary_low = 15'h0ab2;
              4'hb: boundary_low = 15'h0ab5;
              4'hc: boundary_low = 15'h0ab7;
              4'hd: boundary_low = 15'h0aba;
              4'he: boundary_low = 15'h0abd;
              4'hf: boundary_low = 15'h0abf;
              default: boundary_low = 15'h0000;
            endcase
          end
          6'h39: begin
            case (mant[3:0])
              4'h0: boundary_low = 15'h0ac2;
              4'h1: boundary_low = 15'h0ac5;
              4'h2: boundary_low = 15'h0ac7;
              4'h3: boundary_low = 15'h0aca;
              4'h4: boundary_low = 15'h0acd;
              4'h5: boundary_low = 15'h0acf;
              4'h6: boundary_low = 15'h0ad2;
              4'h7: boundary_low = 15'h0ad5;
              4'h8: boundary_low = 15'h0ad8;
              4'h9: boundary_low = 15'h0ada;
              4'ha: boundary_low = 15'h0add;
              4'hb: boundary_low = 15'h0ae0;
              4'hc: boundary_low = 15'h0ae2;
              4'hd: boundary_low = 15'h0ae5;
              4'he: boundary_low = 15'h0ae8;
              4'hf: boundary_low = 15'h0aeb;
              default: boundary_low = 15'h0000;
            endcase
          end
          6'h3a: begin
            case (mant[3:0])
              4'h0: boundary_low = 15'h0aed;
              4'h1: boundary_low = 15'h0af0;
              4'h2: boundary_low = 15'h0af3;
              4'h3: boundary_low = 15'h0af5;
              4'h4: boundary_low = 15'h0af8;
              4'h5: boundary_low = 15'h0afb;
              4'h6: boundary_low = 15'h0afe;
              4'h7: boundary_low = 15'h0b00;
              4'h8: boundary_low = 15'h0b03;
              4'h9: boundary_low = 15'h0b06;
              4'ha: boundary_low = 15'h0b09;
              4'hb: boundary_low = 15'h0b0b;
              4'hc: boundary_low = 15'h0b0e;
              4'hd: boundary_low = 15'h0b11;
              4'he: boundary_low = 15'h0b14;
              4'hf: boundary_low = 15'h0b16;
              default: boundary_low = 15'h0000;
            endcase
          end
          6'h3b: begin
            case (mant[3:0])
              4'h0: boundary_low = 15'h0b19;
              4'h1: boundary_low = 15'h0b1c;
              4'h2: boundary_low = 15'h0b1f;
              4'h3: boundary_low = 15'h0b22;
              4'h4: boundary_low = 15'h0b24;
              4'h5: boundary_low = 15'h0b27;
              4'h6: boundary_low = 15'h0b2a;
              4'h7: boundary_low = 15'h0b2d;
              4'h8: boundary_low = 15'h0b30;
              4'h9: boundary_low = 15'h0b32;
              4'ha: boundary_low = 15'h0b35;
              4'hb: boundary_low = 15'h0b38;
              4'hc: boundary_low = 15'h0b3b;
              4'hd: boundary_low = 15'h0b3e;
              4'he: boundary_low = 15'h0b40;
              4'hf: boundary_low = 15'h0b43;
              default: boundary_low = 15'h0000;
            endcase
          end
          6'h3c: begin
            case (mant[3:0])
              4'h0: boundary_low = 15'h0b46;
              4'h1: boundary_low = 15'h0b49;
              4'h2: boundary_low = 15'h0b4c;
              4'h3: boundary_low = 15'h0b4e;
              4'h4: boundary_low = 15'h0b51;
              4'h5: boundary_low = 15'h0b54;
              4'h6: boundary_low = 15'h0b57;
              4'h7: boundary_low = 15'h0b5a;
              4'h8: boundary_low = 15'h0b5d;
              4'h9: boundary_low = 15'h0b5f;
              4'ha: boundary_low = 15'h0b62;
              4'hb: boundary_low = 15'h0b65;
              4'hc: boundary_low = 15'h0b68;
              4'hd: boundary_low = 15'h0b6b;
              4'he: boundary_low = 15'h0b6e;
              4'hf: boundary_low = 15'h0b70;
              default: boundary_low = 15'h0000;
            endcase
          end
          6'h3d: begin
            case (mant[3:0])
              4'h0: boundary_low = 15'h0b73;
              4'h1: boundary_low = 15'h0b76;
              4'h2: boundary_low = 15'h0b79;
              4'h3: boundary_low = 15'h0b7c;
              4'h4: boundary_low = 15'h0b7f;
              4'h5: boundary_low = 15'h0b82;
              4'h6: boundary_low = 15'h0b85;
              4'h7: boundary_low = 15'h0b87;
              4'h8: boundary_low = 15'h0b8a;
              4'h9: boundary_low = 15'h0b8d;
              4'ha: boundary_low = 15'h0b90;
              4'hb: boundary_low = 15'h0b93;
              4'hc: boundary_low = 15'h0b96;
              4'hd: boundary_low = 15'h0b99;
              4'he: boundary_low = 15'h0b9c;
              4'hf: boundary_low = 15'h0b9f;
              default: boundary_low = 15'h0000;
            endcase
          end
          6'h3e: begin
            case (mant[3:0])
              4'h0: boundary_low = 15'h0ba1;
              4'h1: boundary_low = 15'h0ba4;
              4'h2: boundary_low = 15'h0ba7;
              4'h3: boundary_low = 15'h0baa;
              4'h4: boundary_low = 15'h0bad;
              4'h5: boundary_low = 15'h0bb0;
              4'h6: boundary_low = 15'h0bb3;
              4'h7: boundary_low = 15'h0bb6;
              4'h8: boundary_low = 15'h0bb9;
              4'h9: boundary_low = 15'h0bbc;
              4'ha: boundary_low = 15'h0bbf;
              4'hb: boundary_low = 15'h0bc2;
              4'hc: boundary_low = 15'h0bc5;
              4'hd: boundary_low = 15'h0bc8;
              4'he: boundary_low = 15'h0bca;
              4'hf: boundary_low = 15'h0bcd;
              default: boundary_low = 15'h0000;
            endcase
          end
          6'h3f: begin
            case (mant[3:0])
              4'h0: boundary_low = 15'h0bd0;
              4'h1: boundary_low = 15'h0bd3;
              4'h2: boundary_low = 15'h0bd6;
              4'h3: boundary_low = 15'h0bd9;
              4'h4: boundary_low = 15'h0bdc;
              4'h5: boundary_low = 15'h0bdf;
              4'h6: boundary_low = 15'h0be2;
              4'h7: boundary_low = 15'h0be5;
              4'h8: boundary_low = 15'h0be8;
              4'h9: boundary_low = 15'h0beb;
              4'ha: boundary_low = 15'h0bee;
              4'hb: boundary_low = 15'h0bf1;
              4'hc: boundary_low = 15'h0bf4;
              4'hd: boundary_low = 15'h0bf7;
              4'he: boundary_low = 15'h0bfa;
              4'hf: boundary_low = 15'h0bfd;
              default: boundary_low = 15'h0000;
            endcase
          end
          default: boundary_low = 15'h0000;
        endcase
      end
      5'h14: begin
        case (mant[9:4])
          6'h00: begin
            case (mant[3:0])
              4'h0: boundary_low = 15'h7800;
              4'h1: boundary_low = 15'h7803;
              4'h2: boundary_low = 15'h7806;
              4'h3: boundary_low = 15'h7809;
              4'h4: boundary_low = 15'h780c;
              4'h5: boundary_low = 15'h780f;
              4'h6: boundary_low = 15'h7812;
              4'h7: boundary_low = 15'h7815;
              4'h8: boundary_low = 15'h7818;
              4'h9: boundary_low = 15'h781b;
              4'ha: boundary_low = 15'h781e;
              4'hb: boundary_low = 15'h7821;
              4'hc: boundary_low = 15'h7824;
              4'hd: boundary_low = 15'h7827;
              4'he: boundary_low = 15'h782b;
              4'hf: boundary_low = 15'h782e;
              default: boundary_low = 15'h0000;
            endcase
          end
          6'h01: begin
            case (mant[3:0])
              4'h0: boundary_low = 15'h7831;
              4'h1: boundary_low = 15'h7834;
              4'h2: boundary_low = 15'h7837;
              4'h3: boundary_low = 15'h783a;
              4'h4: boundary_low = 15'h783d;
              4'h5: boundary_low = 15'h7840;
              4'h6: boundary_low = 15'h7843;
              4'h7: boundary_low = 15'h7847;
              4'h8: boundary_low = 15'h784a;
              4'h9: boundary_low = 15'h784d;
              4'ha: boundary_low = 15'h7850;
              4'hb: boundary_low = 15'h7853;
              4'hc: boundary_low = 15'h7856;
              4'hd: boundary_low = 15'h7859;
              4'he: boundary_low = 15'h785d;
              4'hf: boundary_low = 15'h7860;
              default: boundary_low = 15'h0000;
            endcase
          end
          6'h02: begin
            case (mant[3:0])
              4'h0: boundary_low = 15'h7863;
              4'h1: boundary_low = 15'h7866;
              4'h2: boundary_low = 15'h7869;
              4'h3: boundary_low = 15'h786d;
              4'h4: boundary_low = 15'h7870;
              4'h5: boundary_low = 15'h7873;
              4'h6: boundary_low = 15'h7876;
              4'h7: boundary_low = 15'h787a;
              4'h8: boundary_low = 15'h787d;
              4'h9: boundary_low = 15'h7880;
              4'ha: boundary_low = 15'h7883;
              4'hb: boundary_low = 15'h7886;
              4'hc: boundary_low = 15'h788a;
              4'hd: boundary_low = 15'h788d;
              4'he: boundary_low = 15'h7890;
              4'hf: boundary_low = 15'h7894;
              default: boundary_low = 15'h0000;
            endcase
          end
          6'h03: begin
            case (mant[3:0])
              4'h0: boundary_low = 15'h7897;
              4'h1: boundary_low = 15'h789a;
              4'h2: boundary_low = 15'h789d;
              4'h3: boundary_low = 15'h78a1;
              4'h4: boundary_low = 15'h78a4;
              4'h5: boundary_low = 15'h78a7;
              4'h6: boundary_low = 15'h78ab;
              4'h7: boundary_low = 15'h78ae;
              4'h8: boundary_low = 15'h78b1;
              4'h9: boundary_low = 15'h78b5;
              4'ha: boundary_low = 15'h78b8;
              4'hb: boundary_low = 15'h78bb;
              4'hc: boundary_low = 15'h78bf;
              4'hd: boundary_low = 15'h78c2;
              4'he: boundary_low = 15'h78c5;
              4'hf: boundary_low = 15'h78c9;
              default: boundary_low = 15'h0000;
            endcase
          end
          6'h04: begin
            case (mant[3:0])
              4'h0: boundary_low = 15'h78cc;
              4'h1: boundary_low = 15'h78d0;
              4'h2: boundary_low = 15'h78d3;
              4'h3: boundary_low = 15'h78d6;
              4'h4: boundary_low = 15'h78da;
              4'h5: boundary_low = 15'h78dd;
              4'h6: boundary_low = 15'h78e1;
              4'h7: boundary_low = 15'h78e4;
              4'h8: boundary_low = 15'h78e8;
              4'h9: boundary_low = 15'h78eb;
              4'ha: boundary_low = 15'h78ee;
              4'hb: boundary_low = 15'h78f2;
              4'hc: boundary_low = 15'h78f5;
              4'hd: boundary_low = 15'h78f9;
              4'he: boundary_low = 15'h78fc;
              4'hf: boundary_low = 15'h7900;
              default: boundary_low = 15'h0000;
            endcase
          end
          6'h05: begin
            case (mant[3:0])
              4'h0: boundary_low = 15'h7903;
              4'h1: boundary_low = 15'h7907;
              4'h2: boundary_low = 15'h790a;
              4'h3: boundary_low = 15'h790e;
              4'h4: boundary_low = 15'h7911;
              4'h5: boundary_low = 15'h7915;
              4'h6: boundary_low = 15'h7918;
              4'h7: boundary_low = 15'h791c;
              4'h8: boundary_low = 15'h791f;
              4'h9: boundary_low = 15'h7923;
              4'ha: boundary_low = 15'h7926;
              4'hb: boundary_low = 15'h792a;
              4'hc: boundary_low = 15'h792e;
              4'hd: boundary_low = 15'h7931;
              4'he: boundary_low = 15'h7935;
              4'hf: boundary_low = 15'h7938;
              default: boundary_low = 15'h0000;
            endcase
          end
          6'h06: begin
            case (mant[3:0])
              4'h0: boundary_low = 15'h793c;
              4'h1: boundary_low = 15'h793f;
              4'h2: boundary_low = 15'h7943;
              4'h3: boundary_low = 15'h7947;
              4'h4: boundary_low = 15'h794a;
              4'h5: boundary_low = 15'h794e;
              4'h6: boundary_low = 15'h7951;
              4'h7: boundary_low = 15'h7955;
              4'h8: boundary_low = 15'h7959;
              4'h9: boundary_low = 15'h795c;
              4'ha: boundary_low = 15'h7960;
              4'hb: boundary_low = 15'h7964;
              4'hc: boundary_low = 15'h7967;
              4'hd: boundary_low = 15'h796b;
              4'he: boundary_low = 15'h796f;
              4'hf: boundary_low = 15'h7972;
              default: boundary_low = 15'h0000;
            endcase
          end
          6'h07: begin
            case (mant[3:0])
              4'h0: boundary_low = 15'h7976;
              4'h1: boundary_low = 15'h797a;
              4'h2: boundary_low = 15'h797d;
              4'h3: boundary_low = 15'h7981;
              4'h4: boundary_low = 15'h7985;
              4'h5: boundary_low = 15'h7989;
              4'h6: boundary_low = 15'h798c;
              4'h7: boundary_low = 15'h7990;
              4'h8: boundary_low = 15'h7994;
              4'h9: boundary_low = 15'h7998;
              4'ha: boundary_low = 15'h799b;
              4'hb: boundary_low = 15'h799f;
              4'hc: boundary_low = 15'h79a3;
              4'hd: boundary_low = 15'h79a7;
              4'he: boundary_low = 15'h79aa;
              4'hf: boundary_low = 15'h79ae;
              default: boundary_low = 15'h0000;
            endcase
          end
          6'h08: begin
            case (mant[3:0])
              4'h0: boundary_low = 15'h79b2;
              4'h1: boundary_low = 15'h79b6;
              4'h2: boundary_low = 15'h79ba;
              4'h3: boundary_low = 15'h79bd;
              4'h4: boundary_low = 15'h79c1;
              4'h5: boundary_low = 15'h79c5;
              4'h6: boundary_low = 15'h79c9;
              4'h7: boundary_low = 15'h79cd;
              4'h8: boundary_low = 15'h79d1;
              4'h9: boundary_low = 15'h79d4;
              4'ha: boundary_low = 15'h79d8;
              4'hb: boundary_low = 15'h79dc;
              4'hc: boundary_low = 15'h79e0;
              4'hd: boundary_low = 15'h79e4;
              4'he: boundary_low = 15'h79e8;
              4'hf: boundary_low = 15'h79ec;
              default: boundary_low = 15'h0000;
            endcase
          end
          6'h09: begin
            case (mant[3:0])
              4'h0: boundary_low = 15'h79f0;
              4'h1: boundary_low = 15'h79f4;
              4'h2: boundary_low = 15'h79f7;
              4'h3: boundary_low = 15'h79fb;
              4'h4: boundary_low = 15'h79ff;
              4'h5: boundary_low = 15'h7a03;
              4'h6: boundary_low = 15'h7a07;
              4'h7: boundary_low = 15'h7a0b;
              4'h8: boundary_low = 15'h7a0f;
              4'h9: boundary_low = 15'h7a13;
              4'ha: boundary_low = 15'h7a17;
              4'hb: boundary_low = 15'h7a1b;
              4'hc: boundary_low = 15'h7a1f;
              4'hd: boundary_low = 15'h7a23;
              4'he: boundary_low = 15'h7a27;
              4'hf: boundary_low = 15'h7a2b;
              default: boundary_low = 15'h0000;
            endcase
          end
          6'h0a: begin
            case (mant[3:0])
              4'h0: boundary_low = 15'h7a2f;
              4'h1: boundary_low = 15'h7a33;
              4'h2: boundary_low = 15'h7a37;
              4'h3: boundary_low = 15'h7a3b;
              4'h4: boundary_low = 15'h7a3f;
              4'h5: boundary_low = 15'h7a43;
              4'h6: boundary_low = 15'h7a47;
              4'h7: boundary_low = 15'h7a4b;
              4'h8: boundary_low = 15'h7a4f;
              4'h9: boundary_low = 15'h7a53;
              4'ha: boundary_low = 15'h7a57;
              4'hb: boundary_low = 15'h7a5b;
              4'hc: boundary_low = 15'h7a60;
              4'hd: boundary_low = 15'h7a64;
              4'he: boundary_low = 15'h7a68;
              4'hf: boundary_low = 15'h7a6c;
              default: boundary_low = 15'h0000;
            endcase
          end
          6'h0b: begin
            case (mant[3:0])
              4'h0: boundary_low = 15'h7a70;
              4'h1: boundary_low = 15'h7a74;
              4'h2: boundary_low = 15'h7a78;
              4'h3: boundary_low = 15'h7a7c;
              4'h4: boundary_low = 15'h7a80;
              4'h5: boundary_low = 15'h7a85;
              4'h6: boundary_low = 15'h7a89;
              4'h7: boundary_low = 15'h7a8d;
              4'h8: boundary_low = 15'h7a91;
              4'h9: boundary_low = 15'h7a95;
              4'ha: boundary_low = 15'h7a99;
              4'hb: boundary_low = 15'h7a9e;
              4'hc: boundary_low = 15'h7aa2;
              4'hd: boundary_low = 15'h7aa6;
              4'he: boundary_low = 15'h7aaa;
              4'hf: boundary_low = 15'h7aaf;
              default: boundary_low = 15'h0000;
            endcase
          end
          6'h0c: begin
            case (mant[3:0])
              4'h0: boundary_low = 15'h7ab3;
              4'h1: boundary_low = 15'h7ab7;
              4'h2: boundary_low = 15'h7abb;
              4'h3: boundary_low = 15'h7abf;
              4'h4: boundary_low = 15'h7ac4;
              4'h5: boundary_low = 15'h7ac8;
              4'h6: boundary_low = 15'h7acc;
              4'h7: boundary_low = 15'h7ad1;
              4'h8: boundary_low = 15'h7ad5;
              4'h9: boundary_low = 15'h7ad9;
              4'ha: boundary_low = 15'h7add;
              4'hb: boundary_low = 15'h7ae2;
              4'hc: boundary_low = 15'h7ae6;
              4'hd: boundary_low = 15'h7aea;
              4'he: boundary_low = 15'h7aef;
              4'hf: boundary_low = 15'h7af3;
              default: boundary_low = 15'h0000;
            endcase
          end
          6'h0d: begin
            case (mant[3:0])
              4'h0: boundary_low = 15'h7af7;
              4'h1: boundary_low = 15'h7afc;
              4'h2: boundary_low = 15'h7b00;
              4'h3: boundary_low = 15'h7b04;
              4'h4: boundary_low = 15'h7b09;
              4'h5: boundary_low = 15'h7b0d;
              4'h6: boundary_low = 15'h7b12;
              4'h7: boundary_low = 15'h7b16;
              4'h8: boundary_low = 15'h7b1a;
              4'h9: boundary_low = 15'h7b1f;
              4'ha: boundary_low = 15'h7b23;
              4'hb: boundary_low = 15'h7b28;
              4'hc: boundary_low = 15'h7b2c;
              4'hd: boundary_low = 15'h7b30;
              4'he: boundary_low = 15'h7b35;
              4'hf: boundary_low = 15'h7b39;
              default: boundary_low = 15'h0000;
            endcase
          end
          6'h0e: begin
            case (mant[3:0])
              4'h0: boundary_low = 15'h7b3e;
              4'h1: boundary_low = 15'h7b42;
              4'h2: boundary_low = 15'h7b47;
              4'h3: boundary_low = 15'h7b4b;
              4'h4: boundary_low = 15'h7b50;
              4'h5: boundary_low = 15'h7b54;
              4'h6: boundary_low = 15'h7b59;
              4'h7: boundary_low = 15'h7b5d;
              4'h8: boundary_low = 15'h7b62;
              4'h9: boundary_low = 15'h7b66;
              4'ha: boundary_low = 15'h7b6b;
              4'hb: boundary_low = 15'h7b6f;
              4'hc: boundary_low = 15'h7b74;
              4'hd: boundary_low = 15'h7b78;
              4'he: boundary_low = 15'h7b7d;
              4'hf: boundary_low = 15'h7b81;
              default: boundary_low = 15'h0000;
            endcase
          end
          6'h0f: begin
            case (mant[3:0])
              4'h0: boundary_low = 15'h7b86;
              4'h1: boundary_low = 15'h7b8b;
              4'h2: boundary_low = 15'h7b8f;
              4'h3: boundary_low = 15'h7b94;
              4'h4: boundary_low = 15'h7b98;
              4'h5: boundary_low = 15'h7b9d;
              4'h6: boundary_low = 15'h7ba1;
              4'h7: boundary_low = 15'h7ba6;
              4'h8: boundary_low = 15'h7bab;
              4'h9: boundary_low = 15'h7baf;
              4'ha: boundary_low = 15'h7bb4;
              4'hb: boundary_low = 15'h7bb9;
              4'hc: boundary_low = 15'h7bbd;
              4'hd: boundary_low = 15'h7bc2;
              4'he: boundary_low = 15'h7bc7;
              4'hf: boundary_low = 15'h7bcb;
              default: boundary_low = 15'h0000;
            endcase
          end
          6'h10: begin
            case (mant[3:0])
              4'h0: boundary_low = 15'h7bd0;
              4'h1: boundary_low = 15'h7bd5;
              4'h2: boundary_low = 15'h7bd9;
              4'h3: boundary_low = 15'h7bde;
              4'h4: boundary_low = 15'h7be3;
              4'h5: boundary_low = 15'h7be8;
              4'h6: boundary_low = 15'h7bec;
              4'h7: boundary_low = 15'h7bf1;
              4'h8: boundary_low = 15'h7bf6;
              4'h9: boundary_low = 15'h7bfa;
              4'ha: boundary_low = 15'h7bff;
              4'hb: boundary_low = 15'h7c00;
              4'hc: boundary_low = 15'h7c00;
              4'hd: boundary_low = 15'h7c00;
              4'he: boundary_low = 15'h7c00;
              4'hf: boundary_low = 15'h7c00;
              default: boundary_low = 15'h0000;
            endcase
          end
          6'h11: boundary_low = 15'h7c00;
          6'h12: boundary_low = 15'h7c00;
          6'h13: boundary_low = 15'h7c00;
          6'h14: boundary_low = 15'h7c00;
          6'h15: boundary_low = 15'h7c00;
          6'h16: boundary_low = 15'h7c00;
          6'h17: boundary_low = 15'h7c00;
          6'h18: boundary_low = 15'h7c00;
          6'h19: boundary_low = 15'h7c00;
          6'h1a: boundary_low = 15'h7c00;
          6'h1b: boundary_low = 15'h7c00;
          6'h1c: boundary_low = 15'h7c00;
          6'h1d: boundary_low = 15'h7c00;
          6'h1e: boundary_low = 15'h7c00;
          6'h1f: boundary_low = 15'h7c00;
          6'h20: boundary_low = 15'h7c00;
          6'h21: boundary_low = 15'h7c00;
          6'h22: boundary_low = 15'h7c00;
          6'h23: boundary_low = 15'h7c00;
          6'h24: boundary_low = 15'h7c00;
          6'h25: boundary_low = 15'h7c00;
          6'h26: boundary_low = 15'h7c00;
          6'h27: boundary_low = 15'h7c00;
          6'h28: boundary_low = 15'h7c00;
          6'h29: boundary_low = 15'h7c00;
          6'h2a: boundary_low = 15'h7c00;
          6'h2b: boundary_low = 15'h7c00;
          6'h2c: boundary_low = 15'h7c00;
          6'h2d: boundary_low = 15'h7c00;
          6'h2e: boundary_low = 15'h7c00;
          6'h2f: boundary_low = 15'h7c00;
          6'h30: boundary_low = 15'h7c00;
          6'h31: boundary_low = 15'h7c00;
          6'h32: boundary_low = 15'h7c00;
          6'h33: boundary_low = 15'h7c00;
          6'h34: boundary_low = 15'h7c00;
          6'h35: boundary_low = 15'h7c00;
          6'h36: boundary_low = 15'h7c00;
          6'h37: boundary_low = 15'h7c00;
          6'h38: boundary_low = 15'h7c00;
          6'h39: boundary_low = 15'h7c00;
          6'h3a: boundary_low = 15'h7c00;
          6'h3b: boundary_low = 15'h7c00;
          6'h3c: boundary_low = 15'h7c00;
          6'h3d: boundary_low = 15'h7c00;
          6'h3e: boundary_low = 15'h7c00;
          6'h3f: boundary_low = 15'h7c00;
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
