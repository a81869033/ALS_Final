module ex236_core_clamp_hi6(in, out);
  input [15:0] in;
  output [15:0] out;
  wire sign = in[15];
  wire [4:0] exp = in[14:10];
  wire [9:0] mant = in[9:0];
  wire [5:0] exp3 = {1'b0, exp} + ({1'b0, exp} << 1);
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
  wire [15:0] signed_zero = {sign, 15'h0000};
  wire [15:0] signed_inf = {sign, 5'h1f, 10'h000};
  wire active_core = (exp >= 5'd11) && (exp <= 5'd19);
  wire exp10 = (exp == 5'd10);
  wire exp20 = (exp == 5'd20);
  wire underflow_exp10 = exp10 && (mant >= 10'h001) && (mant <= 10'h109);
  wire min_normal_exp10 = exp10 && (mant == 10'h10a);
  wire overflow_exp20 = exp20 && (mant >= 10'h10b);
  wire [15:0] formula_out = {sign, core_mag};
  wire [15:0] boundary_out = underflow_exp10 ? signed_zero :
                              min_normal_exp10 ? {sign, 15'h0400} :
                              overflow_exp20 ? signed_inf : formula_out;
  wire [15:0] special_out = (exp == 5'h1f && mant != 10'h000) ? 16'h7e00 :
                           ((exp <= 5'd9) ? signed_zero : signed_inf);
  assign out = (active_core || exp10 || exp20) ? boundary_out : special_out;
endmodule
