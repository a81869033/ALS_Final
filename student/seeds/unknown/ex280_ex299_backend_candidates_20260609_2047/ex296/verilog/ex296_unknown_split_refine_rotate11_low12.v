module ex296_unknown_split_refine_rotate11_low12(in, out);
  input [12:0] in;
  output [12:0] out;
  wire [12:0] key = {in[1:0], in[12:2]};
  wire key_hi = key[12:12];
  wire [11:0] key_lo = key[11:0];
  reg [12:0] out_r;
  always @* begin
    out_r = 13'h0000;
    case (key_lo)
      12'h000: begin
        out_r = 13'h0000;
        case (key_hi)
          1'h1: out_r = 13'h0002;
          default: begin end
        endcase
      end
      12'h001: begin
        out_r = 13'h0004;
        case (key_hi)
          1'h1: out_r = 13'h0005;
          default: begin end
        endcase
      end
      12'h002: begin
        out_r = 13'h0008;
        case (key_hi)
          1'h1: out_r = 13'h000a;
          default: begin end
        endcase
      end
      12'h003: begin
        out_r = 13'h000d;
      end
      12'h004: begin
        out_r = 13'h0010;
        case (key_hi)
          1'h1: out_r = 13'h0012;
          default: begin end
        endcase
      end
      12'h005: begin
        out_r = 13'h0018;
        case (key_hi)
          1'h1: out_r = 13'h001b;
          default: begin end
        endcase
      end
      12'h006: begin
        out_r = 13'h0015;
      end
      12'h007: begin
        out_r = 13'h001a;
      end
      12'h008: begin
        out_r = 13'h0020;
        case (key_hi)
          1'h1: out_r = 13'h0022;
          default: begin end
        endcase
      end
      12'h009: begin
        out_r = 13'h0024;
        case (key_hi)
          1'h1: out_r = 13'h0025;
          default: begin end
        endcase
      end
      12'h00a: begin
        out_r = 13'h0028;
        case (key_hi)
          1'h1: out_r = 13'h002a;
          default: begin end
        endcase
      end
      12'h00b: begin
        out_r = 13'h002d;
      end
      12'h00c: begin
        out_r = 13'h0034;
        case (key_hi)
          1'h1: out_r = 13'h0036;
          default: begin end
        endcase
      end
      12'h00d: begin
        out_r = 13'h0039;
        case (key_hi)
          1'h1: out_r = 13'h0038;
          default: begin end
        endcase
      end
      12'h00e: begin
        out_r = 13'h0034;
        case (key_hi)
          1'h1: out_r = 13'h0037;
          default: begin end
        endcase
      end
      12'h00f: begin
        out_r = 13'h0039;
      end
      12'h010: begin
        out_r = 13'h0040;
        case (key_hi)
          1'h1: out_r = 13'h0042;
          default: begin end
        endcase
      end
      12'h011: begin
        out_r = 13'h0044;
        case (key_hi)
          1'h1: out_r = 13'h0045;
          default: begin end
        endcase
      end
      12'h012: begin
        out_r = 13'h0048;
        case (key_hi)
          1'h1: out_r = 13'h004a;
          default: begin end
        endcase
      end
      12'h013: begin
        out_r = 13'h004d;
      end
      12'h014: begin
        out_r = 13'h0060;
        case (key_hi)
          1'h1: out_r = 13'h0062;
          default: begin end
        endcase
      end
      12'h015: begin
        out_r = 13'h0064;
        case (key_hi)
          1'h1: out_r = 13'h0065;
          default: begin end
        endcase
      end
      12'h016: begin
        out_r = 13'h006c;
        case (key_hi)
          1'h1: out_r = 13'h006d;
          default: begin end
        endcase
      end
      12'h017: begin
        out_r = 13'h0065;
      end
      12'h018: begin
        out_r = 13'h0055;
      end
      12'h019: begin
        out_r = 13'h005b;
        case (key_hi)
          1'h1: out_r = 13'h0058;
          default: begin end
        endcase
      end
      12'h01a: begin
        out_r = 13'h0055;
        case (key_hi)
          1'h1: out_r = 13'h0054;
          default: begin end
        endcase
      end
      12'h01b: begin
        out_r = 13'h0053;
      end
      12'h01c: begin
        out_r = 13'h0068;
        case (key_hi)
          1'h1: out_r = 13'h006a;
          default: begin end
        endcase
      end
      12'h01d: begin
        out_r = 13'h0065;
      end
      12'h01e: begin
        out_r = 13'h0068;
        case (key_hi)
          1'h1: out_r = 13'h006a;
          default: begin end
        endcase
      end
      12'h01f: begin
        out_r = 13'h0065;
      end
      12'h020: begin
        out_r = 13'h0080;
        case (key_hi)
          1'h1: out_r = 13'h0082;
          default: begin end
        endcase
      end
      12'h021: begin
        out_r = 13'h0084;
        case (key_hi)
          1'h1: out_r = 13'h0085;
          default: begin end
        endcase
      end
      12'h022: begin
        out_r = 13'h0088;
        case (key_hi)
          1'h1: out_r = 13'h008a;
          default: begin end
        endcase
      end
      12'h023: begin
        out_r = 13'h008d;
      end
      12'h024: begin
        out_r = 13'h0090;
        case (key_hi)
          1'h1: out_r = 13'h0092;
          default: begin end
        endcase
      end
      12'h025: begin
        out_r = 13'h0098;
        case (key_hi)
          1'h1: out_r = 13'h009b;
          default: begin end
        endcase
      end
      12'h026: begin
        out_r = 13'h0095;
      end
      12'h027: begin
        out_r = 13'h009a;
      end
      12'h028: begin
        out_r = 13'h00a0;
        case (key_hi)
          1'h1: out_r = 13'h00a2;
          default: begin end
        endcase
      end
      12'h029: begin
        out_r = 13'h00a4;
        case (key_hi)
          1'h1: out_r = 13'h00a5;
          default: begin end
        endcase
      end
      12'h02a: begin
        out_r = 13'h00a8;
        case (key_hi)
          1'h1: out_r = 13'h00aa;
          default: begin end
        endcase
      end
      12'h02b: begin
        out_r = 13'h00ad;
      end
      12'h02c: begin
        out_r = 13'h00b4;
        case (key_hi)
          1'h1: out_r = 13'h00b6;
          default: begin end
        endcase
      end
      12'h02d: begin
        out_r = 13'h00b9;
        case (key_hi)
          1'h1: out_r = 13'h00b8;
          default: begin end
        endcase
      end
      12'h02e: begin
        out_r = 13'h00b4;
        case (key_hi)
          1'h1: out_r = 13'h00b7;
          default: begin end
        endcase
      end
      12'h02f: begin
        out_r = 13'h00b9;
      end
      12'h030: begin
        out_r = 13'h00d3;
        case (key_hi)
          1'h1: out_r = 13'h00d0;
          default: begin end
        endcase
      end
      12'h031: begin
        out_r = 13'h00d4;
        case (key_hi)
          1'h1: out_r = 13'h00d5;
          default: begin end
        endcase
      end
      12'h032: begin
        out_r = 13'h00db;
        case (key_hi)
          1'h1: out_r = 13'h00d8;
          default: begin end
        endcase
      end
      12'h033: begin
        out_r = 13'h00d5;
      end
      12'h034: begin
        out_r = 13'h00e4;
        case (key_hi)
          1'h1: out_r = 13'h00e5;
          default: begin end
        endcase
      end
      12'h035: begin
        out_r = 13'h00e8;
        case (key_hi)
          1'h1: out_r = 13'h00ea;
          default: begin end
        endcase
      end
      12'h036: begin
        out_r = 13'h00e2;
        case (key_hi)
          1'h1: out_r = 13'h00e3;
          default: begin end
        endcase
      end
      12'h037: begin
        out_r = 13'h00ea;
      end
      12'h038: begin
        out_r = 13'h00d3;
        case (key_hi)
          1'h1: out_r = 13'h00d0;
          default: begin end
        endcase
      end
      12'h039: begin
        out_r = 13'h00d5;
        case (key_hi)
          1'h1: out_r = 13'h00d4;
          default: begin end
        endcase
      end
      12'h03a: begin
        out_r = 13'h00df;
        case (key_hi)
          1'h1: out_r = 13'h00dd;
          default: begin end
        endcase
      end
      12'h03b: begin
        out_r = 13'h00d5;
      end
      12'h03c: begin
        out_r = 13'h00e4;
        case (key_hi)
          1'h1: out_r = 13'h00e5;
          default: begin end
        endcase
      end
      12'h03d: begin
        out_r = 13'h00ec;
        case (key_hi)
          1'h1: out_r = 13'h00ef;
          default: begin end
        endcase
      end
      12'h03e: begin
        out_r = 13'h00e4;
        case (key_hi)
          1'h1: out_r = 13'h00e5;
          default: begin end
        endcase
      end
      12'h03f: begin
        out_r = 13'h00e2;
      end
      12'h040: begin
        out_r = 13'h0100;
        case (key_hi)
          1'h1: out_r = 13'h0102;
          default: begin end
        endcase
      end
      12'h041: begin
        out_r = 13'h0104;
        case (key_hi)
          1'h1: out_r = 13'h0105;
          default: begin end
        endcase
      end
      12'h042: begin
        out_r = 13'h0108;
        case (key_hi)
          1'h1: out_r = 13'h010a;
          default: begin end
        endcase
      end
      12'h043: begin
        out_r = 13'h010d;
      end
      12'h044: begin
        out_r = 13'h0110;
        case (key_hi)
          1'h1: out_r = 13'h0112;
          default: begin end
        endcase
      end
      12'h045: begin
        out_r = 13'h0118;
        case (key_hi)
          1'h1: out_r = 13'h011b;
          default: begin end
        endcase
      end
      12'h046: begin
        out_r = 13'h0115;
      end
      12'h047: begin
        out_r = 13'h011a;
      end
      12'h048: begin
        out_r = 13'h0120;
        case (key_hi)
          1'h1: out_r = 13'h0122;
          default: begin end
        endcase
      end
      12'h049: begin
        out_r = 13'h0124;
        case (key_hi)
          1'h1: out_r = 13'h0125;
          default: begin end
        endcase
      end
      12'h04a: begin
        out_r = 13'h0128;
        case (key_hi)
          1'h1: out_r = 13'h012a;
          default: begin end
        endcase
      end
      12'h04b: begin
        out_r = 13'h012d;
      end
      12'h04c: begin
        out_r = 13'h0134;
        case (key_hi)
          1'h1: out_r = 13'h0136;
          default: begin end
        endcase
      end
      12'h04d: begin
        out_r = 13'h0139;
        case (key_hi)
          1'h1: out_r = 13'h0138;
          default: begin end
        endcase
      end
      12'h04e: begin
        out_r = 13'h0134;
        case (key_hi)
          1'h1: out_r = 13'h0137;
          default: begin end
        endcase
      end
      12'h04f: begin
        out_r = 13'h0139;
      end
      12'h050: begin
        out_r = 13'h0180;
        case (key_hi)
          1'h1: out_r = 13'h0182;
          default: begin end
        endcase
      end
      12'h051: begin
        out_r = 13'h0184;
        case (key_hi)
          1'h1: out_r = 13'h0185;
          default: begin end
        endcase
      end
      12'h052: begin
        out_r = 13'h018b;
        case (key_hi)
          1'h1: out_r = 13'h0188;
          default: begin end
        endcase
      end
      12'h053: begin
        out_r = 13'h0185;
      end
      12'h054: begin
        out_r = 13'h0190;
        case (key_hi)
          1'h1: out_r = 13'h0192;
          default: begin end
        endcase
      end
      12'h055: begin
        out_r = 13'h019f;
        case (key_hi)
          1'h1: out_r = 13'h019c;
          default: begin end
        endcase
      end
      12'h056: begin
        out_r = 13'h0194;
        case (key_hi)
          1'h1: out_r = 13'h0195;
          default: begin end
        endcase
      end
      12'h057: begin
        out_r = 13'h019d;
      end
      12'h058: begin
        out_r = 13'h01b0;
        case (key_hi)
          1'h1: out_r = 13'h01b2;
          default: begin end
        endcase
      end
      12'h059: begin
        out_r = 13'h01b8;
        case (key_hi)
          1'h1: out_r = 13'h01b9;
          default: begin end
        endcase
      end
      12'h05a: begin
        out_r = 13'h01b4;
        case (key_hi)
          1'h1: out_r = 13'h01b6;
          default: begin end
        endcase
      end
      12'h05b: begin
        out_r = 13'h01b9;
      end
      12'h05c: begin
        out_r = 13'h0194;
        case (key_hi)
          1'h1: out_r = 13'h0195;
          default: begin end
        endcase
      end
      12'h05d: begin
        out_r = 13'h019a;
        case (key_hi)
          1'h1: out_r = 13'h0198;
          default: begin end
        endcase
      end
      12'h05e: begin
        out_r = 13'h0194;
        case (key_hi)
          1'h1: out_r = 13'h0195;
          default: begin end
        endcase
      end
      12'h05f: begin
        out_r = 13'h0192;
      end
      12'h060: begin
        out_r = 13'h0155;
      end
      12'h061: begin
        out_r = 13'h015a;
        case (key_hi)
          1'h1: out_r = 13'h015b;
          default: begin end
        endcase
      end
      12'h062: begin
        out_r = 13'h0155;
        case (key_hi)
          1'h1: out_r = 13'h0154;
          default: begin end
        endcase
      end
      12'h063: begin
        out_r = 13'h0152;
      end
      12'h064: begin
        out_r = 13'h016d;
        case (key_hi)
          1'h1: out_r = 13'h016f;
          default: begin end
        endcase
      end
      12'h065: begin
        out_r = 13'h0165;
      end
      12'h066: begin
        out_r = 13'h0163;
        case (key_hi)
          1'h1: out_r = 13'h0160;
          default: begin end
        endcase
      end
      12'h067: begin
        out_r = 13'h0164;
      end
      12'h068: begin
        out_r = 13'h0155;
      end
      12'h069: begin
        out_r = 13'h015d;
        case (key_hi)
          1'h1: out_r = 13'h015f;
          default: begin end
        endcase
      end
      12'h06a: begin
        out_r = 13'h0152;
        case (key_hi)
          1'h1: out_r = 13'h0153;
          default: begin end
        endcase
      end
      12'h06b: begin
        out_r = 13'h015f;
      end
      12'h06c: begin
        out_r = 13'h014f;
        case (key_hi)
          1'h1: out_r = 13'h014d;
          default: begin end
        endcase
      end
      12'h06d: begin
        out_r = 13'h0142;
        case (key_hi)
          1'h1: out_r = 13'h0140;
          default: begin end
        endcase
      end
      12'h06e: begin
        out_r = 13'h014f;
        case (key_hi)
          1'h1: out_r = 13'h014c;
          default: begin end
        endcase
      end
      12'h06f: begin
        out_r = 13'h0145;
      end
      12'h070: begin
        out_r = 13'h01a0;
        case (key_hi)
          1'h1: out_r = 13'h01a2;
          default: begin end
        endcase
      end
      12'h071: begin
        out_r = 13'h01a4;
        case (key_hi)
          1'h1: out_r = 13'h01a5;
          default: begin end
        endcase
      end
      12'h072: begin
        out_r = 13'h01ab;
        case (key_hi)
          1'h1: out_r = 13'h01a8;
          default: begin end
        endcase
      end
      12'h073: begin
        out_r = 13'h01a4;
      end
      12'h074: begin
        out_r = 13'h0194;
        case (key_hi)
          1'h1: out_r = 13'h0195;
          default: begin end
        endcase
      end
      12'h075: begin
        out_r = 13'h019c;
        case (key_hi)
          1'h1: out_r = 13'h019d;
          default: begin end
        endcase
      end
      12'h076: begin
        out_r = 13'h0194;
        case (key_hi)
          1'h1: out_r = 13'h0195;
          default: begin end
        endcase
      end
      12'h077: begin
        out_r = 13'h019d;
      end
      12'h078: begin
        out_r = 13'h01a0;
        case (key_hi)
          1'h1: out_r = 13'h01a2;
          default: begin end
        endcase
      end
      12'h079: begin
        out_r = 13'h01a4;
        case (key_hi)
          1'h1: out_r = 13'h01a5;
          default: begin end
        endcase
      end
      12'h07a: begin
        out_r = 13'h01ab;
        case (key_hi)
          1'h1: out_r = 13'h01aa;
          default: begin end
        endcase
      end
      12'h07b: begin
        out_r = 13'h01a4;
      end
      12'h07c: begin
        out_r = 13'h0195;
        case (key_hi)
          1'h1: out_r = 13'h0194;
          default: begin end
        endcase
      end
      12'h07d: begin
        out_r = 13'h019a;
        case (key_hi)
          1'h1: out_r = 13'h0198;
          default: begin end
        endcase
      end
      12'h07e: begin
        out_r = 13'h0195;
        case (key_hi)
          1'h1: out_r = 13'h0194;
          default: begin end
        endcase
      end
      12'h07f: begin
        out_r = 13'h0192;
      end
      12'h080: begin
        out_r = 13'h0200;
        case (key_hi)
          1'h1: out_r = 13'h0202;
          default: begin end
        endcase
      end
      12'h081: begin
        out_r = 13'h0204;
        case (key_hi)
          1'h1: out_r = 13'h0205;
          default: begin end
        endcase
      end
      12'h082: begin
        out_r = 13'h0208;
        case (key_hi)
          1'h1: out_r = 13'h020a;
          default: begin end
        endcase
      end
      12'h083: begin
        out_r = 13'h020d;
      end
      12'h084: begin
        out_r = 13'h0210;
        case (key_hi)
          1'h1: out_r = 13'h0212;
          default: begin end
        endcase
      end
      12'h085: begin
        out_r = 13'h0218;
        case (key_hi)
          1'h1: out_r = 13'h021b;
          default: begin end
        endcase
      end
      12'h086: begin
        out_r = 13'h0215;
      end
      12'h087: begin
        out_r = 13'h021a;
      end
      12'h088: begin
        out_r = 13'h0220;
        case (key_hi)
          1'h1: out_r = 13'h0222;
          default: begin end
        endcase
      end
      12'h089: begin
        out_r = 13'h0224;
        case (key_hi)
          1'h1: out_r = 13'h0225;
          default: begin end
        endcase
      end
      12'h08a: begin
        out_r = 13'h0228;
        case (key_hi)
          1'h1: out_r = 13'h022a;
          default: begin end
        endcase
      end
      12'h08b: begin
        out_r = 13'h022d;
      end
      12'h08c: begin
        out_r = 13'h0234;
        case (key_hi)
          1'h1: out_r = 13'h0236;
          default: begin end
        endcase
      end
      12'h08d: begin
        out_r = 13'h0239;
        case (key_hi)
          1'h1: out_r = 13'h0238;
          default: begin end
        endcase
      end
      12'h08e: begin
        out_r = 13'h0234;
        case (key_hi)
          1'h1: out_r = 13'h0237;
          default: begin end
        endcase
      end
      12'h08f: begin
        out_r = 13'h0239;
      end
      12'h090: begin
        out_r = 13'h0240;
        case (key_hi)
          1'h1: out_r = 13'h0242;
          default: begin end
        endcase
      end
      12'h091: begin
        out_r = 13'h0244;
        case (key_hi)
          1'h1: out_r = 13'h0245;
          default: begin end
        endcase
      end
      12'h092: begin
        out_r = 13'h0248;
        case (key_hi)
          1'h1: out_r = 13'h024a;
          default: begin end
        endcase
      end
      12'h093: begin
        out_r = 13'h024d;
      end
      12'h094: begin
        out_r = 13'h0260;
        case (key_hi)
          1'h1: out_r = 13'h0262;
          default: begin end
        endcase
      end
      12'h095: begin
        out_r = 13'h0264;
        case (key_hi)
          1'h1: out_r = 13'h0265;
          default: begin end
        endcase
      end
      12'h096: begin
        out_r = 13'h026c;
        case (key_hi)
          1'h1: out_r = 13'h026d;
          default: begin end
        endcase
      end
      12'h097: begin
        out_r = 13'h0265;
      end
      12'h098: begin
        out_r = 13'h0255;
      end
      12'h099: begin
        out_r = 13'h025b;
        case (key_hi)
          1'h1: out_r = 13'h0258;
          default: begin end
        endcase
      end
      12'h09a: begin
        out_r = 13'h0255;
        case (key_hi)
          1'h1: out_r = 13'h0254;
          default: begin end
        endcase
      end
      12'h09b: begin
        out_r = 13'h0253;
      end
      12'h09c: begin
        out_r = 13'h0268;
        case (key_hi)
          1'h1: out_r = 13'h026a;
          default: begin end
        endcase
      end
      12'h09d: begin
        out_r = 13'h0265;
      end
      12'h09e: begin
        out_r = 13'h0268;
        case (key_hi)
          1'h1: out_r = 13'h026a;
          default: begin end
        endcase
      end
      12'h09f: begin
        out_r = 13'h0265;
      end
      12'h0a0: begin
        out_r = 13'h0280;
        case (key_hi)
          1'h1: out_r = 13'h0282;
          default: begin end
        endcase
      end
      12'h0a1: begin
        out_r = 13'h0284;
        case (key_hi)
          1'h1: out_r = 13'h0285;
          default: begin end
        endcase
      end
      12'h0a2: begin
        out_r = 13'h0288;
        case (key_hi)
          1'h1: out_r = 13'h028a;
          default: begin end
        endcase
      end
      12'h0a3: begin
        out_r = 13'h028d;
      end
      12'h0a4: begin
        out_r = 13'h0290;
        case (key_hi)
          1'h1: out_r = 13'h0292;
          default: begin end
        endcase
      end
      12'h0a5: begin
        out_r = 13'h0298;
        case (key_hi)
          1'h1: out_r = 13'h029b;
          default: begin end
        endcase
      end
      12'h0a6: begin
        out_r = 13'h0295;
      end
      12'h0a7: begin
        out_r = 13'h029a;
      end
      12'h0a8: begin
        out_r = 13'h02a0;
        case (key_hi)
          1'h1: out_r = 13'h02a2;
          default: begin end
        endcase
      end
      12'h0a9: begin
        out_r = 13'h02a4;
        case (key_hi)
          1'h1: out_r = 13'h02a5;
          default: begin end
        endcase
      end
      12'h0aa: begin
        out_r = 13'h02a8;
        case (key_hi)
          1'h1: out_r = 13'h02aa;
          default: begin end
        endcase
      end
      12'h0ab: begin
        out_r = 13'h02ad;
      end
      12'h0ac: begin
        out_r = 13'h02b4;
        case (key_hi)
          1'h1: out_r = 13'h02b6;
          default: begin end
        endcase
      end
      12'h0ad: begin
        out_r = 13'h02b9;
        case (key_hi)
          1'h1: out_r = 13'h02b8;
          default: begin end
        endcase
      end
      12'h0ae: begin
        out_r = 13'h02b4;
        case (key_hi)
          1'h1: out_r = 13'h02b7;
          default: begin end
        endcase
      end
      12'h0af: begin
        out_r = 13'h02b9;
      end
      12'h0b0: begin
        out_r = 13'h02d3;
        case (key_hi)
          1'h1: out_r = 13'h02d0;
          default: begin end
        endcase
      end
      12'h0b1: begin
        out_r = 13'h02d4;
        case (key_hi)
          1'h1: out_r = 13'h02d5;
          default: begin end
        endcase
      end
      12'h0b2: begin
        out_r = 13'h02db;
        case (key_hi)
          1'h1: out_r = 13'h02d8;
          default: begin end
        endcase
      end
      12'h0b3: begin
        out_r = 13'h02d5;
      end
      12'h0b4: begin
        out_r = 13'h02e4;
        case (key_hi)
          1'h1: out_r = 13'h02e5;
          default: begin end
        endcase
      end
      12'h0b5: begin
        out_r = 13'h02e8;
        case (key_hi)
          1'h1: out_r = 13'h02ea;
          default: begin end
        endcase
      end
      12'h0b6: begin
        out_r = 13'h02e2;
        case (key_hi)
          1'h1: out_r = 13'h02e3;
          default: begin end
        endcase
      end
      12'h0b7: begin
        out_r = 13'h02ea;
      end
      12'h0b8: begin
        out_r = 13'h02d3;
        case (key_hi)
          1'h1: out_r = 13'h02d0;
          default: begin end
        endcase
      end
      12'h0b9: begin
        out_r = 13'h02d5;
        case (key_hi)
          1'h1: out_r = 13'h02d4;
          default: begin end
        endcase
      end
      12'h0ba: begin
        out_r = 13'h02df;
        case (key_hi)
          1'h1: out_r = 13'h02dd;
          default: begin end
        endcase
      end
      12'h0bb: begin
        out_r = 13'h02d5;
      end
      12'h0bc: begin
        out_r = 13'h02e4;
        case (key_hi)
          1'h1: out_r = 13'h02e5;
          default: begin end
        endcase
      end
      12'h0bd: begin
        out_r = 13'h02ec;
        case (key_hi)
          1'h1: out_r = 13'h02ef;
          default: begin end
        endcase
      end
      12'h0be: begin
        out_r = 13'h02e4;
        case (key_hi)
          1'h1: out_r = 13'h02e5;
          default: begin end
        endcase
      end
      12'h0bf: begin
        out_r = 13'h02e2;
      end
      12'h0c0: begin
        out_r = 13'h034d;
        case (key_hi)
          1'h1: out_r = 13'h034c;
          default: begin end
        endcase
      end
      12'h0c1: begin
        out_r = 13'h0344;
        case (key_hi)
          1'h1: out_r = 13'h0345;
          default: begin end
        endcase
      end
      12'h0c2: begin
        out_r = 13'h0340;
        case (key_hi)
          1'h1: out_r = 13'h0343;
          default: begin end
        endcase
      end
      12'h0c3: begin
        out_r = 13'h0344;
      end
      12'h0c4: begin
        out_r = 13'h0350;
        case (key_hi)
          1'h1: out_r = 13'h0352;
          default: begin end
        endcase
      end
      12'h0c5: begin
        out_r = 13'h035b;
        case (key_hi)
          1'h1: out_r = 13'h035a;
          default: begin end
        endcase
      end
      12'h0c6: begin
        out_r = 13'h0355;
      end
      12'h0c7: begin
        out_r = 13'h0358;
      end
      12'h0c8: begin
        out_r = 13'h036d;
        case (key_hi)
          1'h1: out_r = 13'h036c;
          default: begin end
        endcase
      end
      12'h0c9: begin
        out_r = 13'h0364;
        case (key_hi)
          1'h1: out_r = 13'h0365;
          default: begin end
        endcase
      end
      12'h0ca: begin
        out_r = 13'h0360;
        case (key_hi)
          1'h1: out_r = 13'h0363;
          default: begin end
        endcase
      end
      12'h0cb: begin
        out_r = 13'h0364;
      end
      12'h0cc: begin
        out_r = 13'h0355;
      end
      12'h0cd: begin
        out_r = 13'h0352;
        case (key_hi)
          1'h1: out_r = 13'h0350;
          default: begin end
        endcase
      end
      12'h0ce: begin
        out_r = 13'h0355;
        case (key_hi)
          1'h1: out_r = 13'h0354;
          default: begin end
        endcase
      end
      12'h0cf: begin
        out_r = 13'h035f;
      end
      12'h0d0: begin
        out_r = 13'h0390;
        case (key_hi)
          1'h1: out_r = 13'h0392;
          default: begin end
        endcase
      end
      12'h0d1: begin
        out_r = 13'h039a;
        case (key_hi)
          1'h1: out_r = 13'h039b;
          default: begin end
        endcase
      end
      12'h0d2: begin
        out_r = 13'h0395;
      end
      12'h0d3: begin
        out_r = 13'h0398;
      end
      12'h0d4: begin
        out_r = 13'h03a0;
        case (key_hi)
          1'h1: out_r = 13'h03a2;
          default: begin end
        endcase
      end
      12'h0d5: begin
        out_r = 13'h03a5;
        case (key_hi)
          1'h1: out_r = 13'h03a4;
          default: begin end
        endcase
      end
      12'h0d6: begin
        out_r = 13'h03aa;
        case (key_hi)
          1'h1: out_r = 13'h03a8;
          default: begin end
        endcase
      end
      12'h0d7: begin
        out_r = 13'h03a5;
      end
      12'h0d8: begin
        out_r = 13'h0388;
        case (key_hi)
          1'h1: out_r = 13'h038a;
          default: begin end
        endcase
      end
      12'h0d9: begin
        out_r = 13'h0384;
        case (key_hi)
          1'h1: out_r = 13'h0385;
          default: begin end
        endcase
      end
      12'h0da: begin
        out_r = 13'h038f;
        case (key_hi)
          1'h1: out_r = 13'h038d;
          default: begin end
        endcase
      end
      12'h0db: begin
        out_r = 13'h0383;
      end
      12'h0dc: begin
        out_r = 13'h03a8;
        case (key_hi)
          1'h1: out_r = 13'h03aa;
          default: begin end
        endcase
      end
      12'h0dd: begin
        out_r = 13'h03af;
        case (key_hi)
          1'h1: out_r = 13'h03ad;
          default: begin end
        endcase
      end
      12'h0de: begin
        out_r = 13'h03a8;
        case (key_hi)
          1'h1: out_r = 13'h03aa;
          default: begin end
        endcase
      end
      12'h0df: begin
        out_r = 13'h03a2;
      end
      12'h0e0: begin
        out_r = 13'h034d;
        case (key_hi)
          1'h1: out_r = 13'h034c;
          default: begin end
        endcase
      end
      12'h0e1: begin
        out_r = 13'h0344;
        case (key_hi)
          1'h1: out_r = 13'h0345;
          default: begin end
        endcase
      end
      12'h0e2: begin
        out_r = 13'h0340;
        case (key_hi)
          1'h1: out_r = 13'h0343;
          default: begin end
        endcase
      end
      12'h0e3: begin
        out_r = 13'h0344;
      end
      12'h0e4: begin
        out_r = 13'h0355;
      end
      12'h0e5: begin
        out_r = 13'h035a;
        case (key_hi)
          1'h1: out_r = 13'h035b;
          default: begin end
        endcase
      end
      12'h0e6: begin
        out_r = 13'h0353;
        case (key_hi)
          1'h1: out_r = 13'h0350;
          default: begin end
        endcase
      end
      12'h0e7: begin
        out_r = 13'h035b;
      end
      12'h0e8: begin
        out_r = 13'h037f;
        case (key_hi)
          1'h1: out_r = 13'h037c;
          default: begin end
        endcase
      end
      12'h0e9: begin
        out_r = 13'h0379;
      end
      12'h0ea: begin
        out_r = 13'h0374;
        case (key_hi)
          1'h1: out_r = 13'h0377;
          default: begin end
        endcase
      end
      12'h0eb: begin
        out_r = 13'h0378;
      end
      12'h0ec: begin
        out_r = 13'h0355;
      end
      12'h0ed: begin
        out_r = 13'h0352;
        case (key_hi)
          1'h1: out_r = 13'h0350;
          default: begin end
        endcase
      end
      12'h0ee: begin
        out_r = 13'h0355;
        case (key_hi)
          1'h1: out_r = 13'h0354;
          default: begin end
        endcase
      end
      12'h0ef: begin
        out_r = 13'h035f;
      end
      12'h0f0: begin
        out_r = 13'h0390;
        case (key_hi)
          1'h1: out_r = 13'h0392;
          default: begin end
        endcase
      end
      12'h0f1: begin
        out_r = 13'h039d;
        case (key_hi)
          1'h1: out_r = 13'h039f;
          default: begin end
        endcase
      end
      12'h0f2: begin
        out_r = 13'h0395;
      end
      12'h0f3: begin
        out_r = 13'h039f;
      end
      12'h0f4: begin
        out_r = 13'h03b0;
        case (key_hi)
          1'h1: out_r = 13'h03b2;
          default: begin end
        endcase
      end
      12'h0f5: begin
        out_r = 13'h03b8;
        case (key_hi)
          1'h1: out_r = 13'h03bb;
          default: begin end
        endcase
      end
      12'h0f6: begin
        out_r = 13'h03bc;
        case (key_hi)
          1'h1: out_r = 13'h03bd;
          default: begin end
        endcase
      end
      12'h0f7: begin
        out_r = 13'h03b9;
      end
      12'h0f8: begin
        out_r = 13'h0390;
        case (key_hi)
          1'h1: out_r = 13'h0392;
          default: begin end
        endcase
      end
      12'h0f9: begin
        out_r = 13'h039d;
        case (key_hi)
          1'h1: out_r = 13'h039f;
          default: begin end
        endcase
      end
      12'h0fa: begin
        out_r = 13'h0395;
        case (key_hi)
          1'h1: out_r = 13'h0394;
          default: begin end
        endcase
      end
      12'h0fb: begin
        out_r = 13'h039f;
      end
      12'h0fc: begin
        out_r = 13'h0388;
        case (key_hi)
          1'h1: out_r = 13'h038a;
          default: begin end
        endcase
      end
      12'h0fd: begin
        out_r = 13'h038c;
        case (key_hi)
          1'h1: out_r = 13'h038f;
          default: begin end
        endcase
      end
      12'h0fe: begin
        out_r = 13'h0388;
        case (key_hi)
          1'h1: out_r = 13'h038a;
          default: begin end
        endcase
      end
      12'h0ff: begin
        out_r = 13'h0382;
      end
      12'h100: begin
        out_r = 13'h0400;
        case (key_hi)
          1'h1: out_r = 13'h0402;
          default: begin end
        endcase
      end
      12'h101: begin
        out_r = 13'h0404;
        case (key_hi)
          1'h1: out_r = 13'h0405;
          default: begin end
        endcase
      end
      12'h102: begin
        out_r = 13'h0408;
        case (key_hi)
          1'h1: out_r = 13'h040a;
          default: begin end
        endcase
      end
      12'h103: begin
        out_r = 13'h040d;
      end
      12'h104: begin
        out_r = 13'h0410;
        case (key_hi)
          1'h1: out_r = 13'h0412;
          default: begin end
        endcase
      end
      12'h105: begin
        out_r = 13'h0818;
        case (key_hi)
          1'h1: out_r = 13'h041b;
          default: begin end
        endcase
      end
      12'h106: begin
        out_r = 13'h0415;
      end
      12'h107: begin
        out_r = 13'h041a;
      end
      12'h108: begin
        out_r = 13'h0420;
        case (key_hi)
          1'h1: out_r = 13'h0422;
          default: begin end
        endcase
      end
      12'h109: begin
        out_r = 13'h0424;
        case (key_hi)
          1'h1: out_r = 13'h0425;
          default: begin end
        endcase
      end
      12'h10a: begin
        out_r = 13'h0428;
        case (key_hi)
          1'h1: out_r = 13'h042a;
          default: begin end
        endcase
      end
      12'h10b: begin
        out_r = 13'h042d;
      end
      12'h10c: begin
        out_r = 13'h0434;
        case (key_hi)
          1'h1: out_r = 13'h0436;
          default: begin end
        endcase
      end
      12'h10d: begin
        out_r = 13'h0439;
        case (key_hi)
          1'h1: out_r = 13'h0438;
          default: begin end
        endcase
      end
      12'h10e: begin
        out_r = 13'h0434;
        case (key_hi)
          1'h1: out_r = 13'h0837;
          default: begin end
        endcase
      end
      12'h10f: begin
        out_r = 13'h0439;
      end
      12'h110: begin
        out_r = 13'h0440;
        case (key_hi)
          1'h1: out_r = 13'h0442;
          default: begin end
        endcase
      end
      12'h111: begin
        out_r = 13'h0444;
        case (key_hi)
          1'h1: out_r = 13'h0445;
          default: begin end
        endcase
      end
      12'h112: begin
        out_r = 13'h0448;
        case (key_hi)
          1'h1: out_r = 13'h044a;
          default: begin end
        endcase
      end
      12'h113: begin
        out_r = 13'h044d;
      end
      12'h114: begin
        out_r = 13'h0860;
        case (key_hi)
          1'h1: out_r = 13'h0462;
          default: begin end
        endcase
      end
      12'h115: begin
        out_r = 13'h0464;
        case (key_hi)
          1'h1: out_r = 13'h0465;
          default: begin end
        endcase
      end
      12'h116: begin
        out_r = 13'h046c;
        case (key_hi)
          1'h1: out_r = 13'h086d;
          default: begin end
        endcase
      end
      12'h117: begin
        out_r = 13'h0465;
      end
      12'h118: begin
        out_r = 13'h0455;
      end
      12'h119: begin
        out_r = 13'h045b;
        case (key_hi)
          1'h1: out_r = 13'h0858;
          default: begin end
        endcase
      end
      12'h11a: begin
        out_r = 13'h0455;
        case (key_hi)
          1'h1: out_r = 13'h0454;
          default: begin end
        endcase
      end
      12'h11b: begin
        out_r = 13'h0853;
      end
      12'h11c: begin
        out_r = 13'h0468;
        case (key_hi)
          1'h1: out_r = 13'h046a;
          default: begin end
        endcase
      end
      12'h11d: begin
        out_r = 13'h0465;
      end
      12'h11e: begin
        out_r = 13'h0468;
        case (key_hi)
          1'h1: out_r = 13'h046a;
          default: begin end
        endcase
      end
      12'h11f: begin
        out_r = 13'h0465;
      end
      12'h120: begin
        out_r = 13'h0480;
        case (key_hi)
          1'h1: out_r = 13'h0482;
          default: begin end
        endcase
      end
      12'h121: begin
        out_r = 13'h0484;
        case (key_hi)
          1'h1: out_r = 13'h0485;
          default: begin end
        endcase
      end
      12'h122: begin
        out_r = 13'h0488;
        case (key_hi)
          1'h1: out_r = 13'h048a;
          default: begin end
        endcase
      end
      12'h123: begin
        out_r = 13'h048d;
      end
      12'h124: begin
        out_r = 13'h0490;
        case (key_hi)
          1'h1: out_r = 13'h0492;
          default: begin end
        endcase
      end
      12'h125: begin
        out_r = 13'h0898;
        case (key_hi)
          1'h1: out_r = 13'h049b;
          default: begin end
        endcase
      end
      12'h126: begin
        out_r = 13'h0495;
      end
      12'h127: begin
        out_r = 13'h049a;
      end
      12'h128: begin
        out_r = 13'h04a0;
        case (key_hi)
          1'h1: out_r = 13'h04a2;
          default: begin end
        endcase
      end
      12'h129: begin
        out_r = 13'h04a4;
        case (key_hi)
          1'h1: out_r = 13'h04a5;
          default: begin end
        endcase
      end
      12'h12a: begin
        out_r = 13'h04a8;
        case (key_hi)
          1'h1: out_r = 13'h04aa;
          default: begin end
        endcase
      end
      12'h12b: begin
        out_r = 13'h04ad;
      end
      12'h12c: begin
        out_r = 13'h04b4;
        case (key_hi)
          1'h1: out_r = 13'h04b6;
          default: begin end
        endcase
      end
      12'h12d: begin
        out_r = 13'h04b9;
        case (key_hi)
          1'h1: out_r = 13'h04b8;
          default: begin end
        endcase
      end
      12'h12e: begin
        out_r = 13'h04b4;
        case (key_hi)
          1'h1: out_r = 13'h08b7;
          default: begin end
        endcase
      end
      12'h12f: begin
        out_r = 13'h04b9;
      end
      12'h130: begin
        out_r = 13'h08d3;
        case (key_hi)
          1'h1: out_r = 13'h04d0;
          default: begin end
        endcase
      end
      12'h131: begin
        out_r = 13'h04d4;
        case (key_hi)
          1'h1: out_r = 13'h04d5;
          default: begin end
        endcase
      end
      12'h132: begin
        out_r = 13'h08db;
        case (key_hi)
          1'h1: out_r = 13'h04d8;
          default: begin end
        endcase
      end
      12'h133: begin
        out_r = 13'h04d5;
      end
      12'h134: begin
        out_r = 13'h04e4;
        case (key_hi)
          1'h1: out_r = 13'h04e5;
          default: begin end
        endcase
      end
      12'h135: begin
        out_r = 13'h04e8;
        case (key_hi)
          1'h1: out_r = 13'h04ea;
          default: begin end
        endcase
      end
      12'h136: begin
        out_r = 13'h04e2;
        case (key_hi)
          1'h1: out_r = 13'h08e3;
          default: begin end
        endcase
      end
      12'h137: begin
        out_r = 13'h04ea;
      end
      12'h138: begin
        out_r = 13'h08d3;
        case (key_hi)
          1'h1: out_r = 13'h04d0;
          default: begin end
        endcase
      end
      12'h139: begin
        out_r = 13'h04d5;
        case (key_hi)
          1'h1: out_r = 13'h04d4;
          default: begin end
        endcase
      end
      12'h13a: begin
        out_r = 13'h04df;
        case (key_hi)
          1'h1: out_r = 13'h04dd;
          default: begin end
        endcase
      end
      12'h13b: begin
        out_r = 13'h04d5;
      end
      12'h13c: begin
        out_r = 13'h04e4;
        case (key_hi)
          1'h1: out_r = 13'h04e5;
          default: begin end
        endcase
      end
      12'h13d: begin
        out_r = 13'h08ec;
        case (key_hi)
          1'h1: out_r = 13'h04ef;
          default: begin end
        endcase
      end
      12'h13e: begin
        out_r = 13'h04e4;
        case (key_hi)
          1'h1: out_r = 13'h04e5;
          default: begin end
        endcase
      end
      12'h13f: begin
        out_r = 13'h04e2;
      end
      12'h140: begin
        out_r = 13'h0603;
        case (key_hi)
          1'h1: out_r = 13'h0732;
          default: begin end
        endcase
      end
      12'h141: begin
        out_r = 13'h0604;
        case (key_hi)
          1'h1: out_r = 13'h0705;
          default: begin end
        endcase
      end
      12'h142: begin
        out_r = 13'h0648;
        case (key_hi)
          1'h1: out_r = 13'h098b;
          default: begin end
        endcase
      end
      12'h143: begin
        out_r = 13'h0705;
      end
      12'h144: begin
        out_r = 13'h0610;
        case (key_hi)
          1'h1: out_r = 13'h0612;
          default: begin end
        endcase
      end
      12'h145: begin
        out_r = 13'h06ed;
        case (key_hi)
          1'h1: out_r = 13'h09c7;
          default: begin end
        endcase
      end
      12'h146: begin
        out_r = 13'h0715;
        case (key_hi)
          1'h1: out_r = 13'h0615;
          default: begin end
        endcase
      end
      12'h147: begin
        out_r = 13'h061d;
      end
      12'h148: begin
        out_r = 13'h062d;
        case (key_hi)
          1'h1: out_r = 13'h0a2c;
          default: begin end
        endcase
      end
      12'h149: begin
        out_r = 13'h0624;
        case (key_hi)
          1'h1: out_r = 13'h0725;
          default: begin end
        endcase
      end
      12'h14a: begin
        out_r = 13'h070c;
        case (key_hi)
          1'h1: out_r = 13'h0bc0;
          default: begin end
        endcase
      end
      12'h14b: begin
        out_r = 13'h0738;
      end
      12'h14c: begin
        out_r = 13'h0695;
        case (key_hi)
          1'h1: out_r = 13'h0612;
          default: begin end
        endcase
      end
      12'h14d: begin
        out_r = 13'h069c;
        case (key_hi)
          1'h1: out_r = 13'h0b5f;
          default: begin end
        endcase
      end
      12'h14e: begin
        out_r = 13'h0695;
        case (key_hi)
          1'h1: out_r = 13'h0694;
          default: begin end
        endcase
      end
      12'h14f: begin
        out_r = 13'h069c;
      end
      12'h150: begin
        out_r = 13'h0640;
        case (key_hi)
          1'h1: out_r = 13'h0642;
          default: begin end
        endcase
      end
      12'h151: begin
        out_r = 13'h0644;
        case (key_hi)
          1'h1: out_r = 13'h0785;
          default: begin end
        endcase
      end
      12'h152: begin
        out_r = 13'h0648;
        case (key_hi)
          1'h1: out_r = 13'h064a;
          default: begin end
        endcase
      end
      12'h153: begin
        out_r = 13'h078d;
      end
      12'h154: begin
        out_r = 13'h0672;
        case (key_hi)
          1'h1: out_r = 13'h0ba3;
          default: begin end
        endcase
      end
      12'h155: begin
        out_r = 13'h0678;
        case (key_hi)
          1'h1: out_r = 13'h07a5;
          default: begin end
        endcase
      end
      12'h156: begin
        out_r = 13'h0bab;
      end
      12'h157: begin
        out_r = 13'h0bbb;
      end
      12'h158: begin
        out_r = 13'h0652;
        case (key_hi)
          1'h1: out_r = 13'h0790;
          default: begin end
        endcase
      end
      12'h159: begin
        out_r = 13'h065a;
        case (key_hi)
          1'h1: out_r = 13'h0bbb;
          default: begin end
        endcase
      end
      12'h15a: begin
        out_r = 13'h0657;
        case (key_hi)
          1'h1: out_r = 13'h0654;
          default: begin end
        endcase
      end
      12'h15b: begin
        out_r = 13'h0bbb;
      end
      12'h15c: begin
        out_r = 13'h0bab;
        case (key_hi)
          1'h1: out_r = 13'h067f;
          default: begin end
        endcase
      end
      12'h15d: begin
        out_r = 13'h0bbb;
        case (key_hi)
          1'h1: out_r = 13'h0785;
          default: begin end
        endcase
      end
      12'h15e: begin
        out_r = 13'h0bab;
        case (key_hi)
          1'h1: out_r = 13'h067f;
          default: begin end
        endcase
      end
      12'h15f: begin
        out_r = 13'h0679;
      end
      12'h160: begin
        out_r = 13'h0b23;
        case (key_hi)
          1'h1: out_r = 13'h05f0;
          default: begin end
        endcase
      end
      12'h161: begin
        out_r = 13'h06c4;
        case (key_hi)
          1'h1: out_r = 13'h07d5;
          default: begin end
        endcase
      end
      12'h162: begin
        out_r = 13'h063c;
        case (key_hi)
          1'h1: out_r = 13'h095d;
          default: begin end
        endcase
      end
      12'h163: begin
        out_r = 13'h0684;
      end
      12'h164: begin
        out_r = 13'h06e0;
        case (key_hi)
          1'h1: out_r = 13'h06e2;
          default: begin end
        endcase
      end
      12'h165: begin
        out_r = 13'h069c;
        case (key_hi)
          1'h1: out_r = 13'h061d;
          default: begin end
        endcase
      end
      12'h166: begin
        out_r = 13'h07e4;
        case (key_hi)
          1'h1: out_r = 13'h0755;
          default: begin end
        endcase
      end
      12'h167: begin
        out_r = 13'h0a1c;
      end
      12'h168: begin
        out_r = 13'h0ad0;
        case (key_hi)
          1'h1: out_r = 13'h05f3;
          default: begin end
        endcase
      end
      12'h169: begin
        out_r = 13'h06d4;
        case (key_hi)
          1'h1: out_r = 13'h07f9;
          default: begin end
        endcase
      end
      12'h16a: begin
        out_r = 13'h07d8;
        case (key_hi)
          1'h1: out_r = 13'h0b2b;
          default: begin end
        endcase
      end
      12'h16b: begin
        out_r = 13'h0739;
      end
      12'h16c: begin
        out_r = 13'h06e5;
        case (key_hi)
          1'h1: out_r = 13'h0755;
          default: begin end
        endcase
      end
      12'h16d: begin
        out_r = 13'h06e2;
        case (key_hi)
          1'h1: out_r = 13'h07e0;
          default: begin end
        endcase
      end
      12'h16e: begin
        out_r = 13'h06e5;
        case (key_hi)
          1'h1: out_r = 13'h07e4;
          default: begin end
        endcase
      end
      12'h16f: begin
        out_r = 13'h075a;
      end
      12'h170: begin
        out_r = 13'h0650;
        case (key_hi)
          1'h1: out_r = 13'h0652;
          default: begin end
        endcase
      end
      12'h171: begin
        out_r = 13'h07fd;
        case (key_hi)
          1'h1: out_r = 13'h0b9f;
          default: begin end
        endcase
      end
      12'h172: begin
        out_r = 13'h0657;
        case (key_hi)
          1'h1: out_r = 13'h0795;
          default: begin end
        endcase
      end
      12'h173: begin
        out_r = 13'h0780;
      end
      12'h174: begin
        out_r = 13'h0ba3;
        case (key_hi)
          1'h1: out_r = 13'h0568;
          default: begin end
        endcase
      end
      12'h175: begin
        out_r = 13'h0664;
        case (key_hi)
          1'h1: out_r = 13'h0bbb;
          default: begin end
        endcase
      end
      12'h176: begin
        out_r = 13'h0ba3;
        case (key_hi)
          1'h1: out_r = 13'h0563;
          default: begin end
        endcase
      end
      12'h177: begin
        out_r = 13'h0665;
      end
      12'h178: begin
        out_r = 13'h0650;
        case (key_hi)
          1'h1: out_r = 13'h0652;
          default: begin end
        endcase
      end
      12'h179: begin
        out_r = 13'h07fd;
        case (key_hi)
          1'h1: out_r = 13'h0b03;
          default: begin end
        endcase
      end
      12'h17a: begin
        out_r = 13'h0657;
        case (key_hi)
          1'h1: out_r = 13'h0a55;
          default: begin end
        endcase
      end
      12'h17b: begin
        out_r = 13'h0780;
      end
      12'h17c: begin
        out_r = 13'h0648;
        case (key_hi)
          1'h1: out_r = 13'h064a;
          default: begin end
        endcase
      end
      12'h17d: begin
        out_r = 13'h0b8c;
        case (key_hi)
          1'h1: out_r = 13'h064f;
          default: begin end
        endcase
      end
      12'h17e: begin
        out_r = 13'h0648;
        case (key_hi)
          1'h1: out_r = 13'h064a;
          default: begin end
        endcase
      end
      12'h17f: begin
        out_r = 13'h0642;
      end
      12'h180: begin
        out_r = 13'h05d5;
        case (key_hi)
          1'h1: out_r = 13'h0575;
          default: begin end
        endcase
      end
      12'h181: begin
        out_r = 13'h0a58;
        case (key_hi)
          1'h1: out_r = 13'h0539;
          default: begin end
        endcase
      end
      12'h182: begin
        out_r = 13'h0575;
        case (key_hi)
          1'h1: out_r = 13'h0556;
          default: begin end
        endcase
      end
      12'h183: begin
        out_r = 13'h0552;
      end
      12'h184: begin
        out_r = 13'h0a6b;
        case (key_hi)
          1'h1: out_r = 13'h05ea;
          default: begin end
        endcase
      end
      12'h185: begin
        out_r = 13'h0544;
        case (key_hi)
          1'h1: out_r = 13'h061c;
          default: begin end
        endcase
      end
      12'h186: begin
        out_r = 13'h0543;
        case (key_hi)
          1'h1: out_r = 13'h065d;
          default: begin end
        endcase
      end
      12'h187: begin
        out_r = 13'h0960;
      end
      12'h188: begin
        out_r = 13'h0575;
        case (key_hi)
          1'h1: out_r = 13'h055d;
          default: begin end
        endcase
      end
      12'h189: begin
        out_r = 13'h069c;
        case (key_hi)
          1'h1: out_r = 13'h0505;
          default: begin end
        endcase
      end
      12'h18a: begin
        out_r = 13'h0552;
        case (key_hi)
          1'h1: out_r = 13'h0aa3;
          default: begin end
        endcase
      end
      12'h18b: begin
        out_r = 13'h0aa3;
      end
      12'h18c: begin
        out_r = 13'h054a;
        case (key_hi)
          1'h1: out_r = 13'h0ab7;
          default: begin end
        endcase
      end
      12'h18d: begin
        out_r = 13'h0545;
        case (key_hi)
          1'h1: out_r = 13'h061c;
          default: begin end
        endcase
      end
      12'h18e: begin
        out_r = 13'h054a;
        case (key_hi)
          1'h1: out_r = 13'h0a8b;
          default: begin end
        endcase
      end
      12'h18f: begin
        out_r = 13'h0545;
      end
      12'h190: begin
        out_r = 13'h06b6;
        case (key_hi)
          1'h1: out_r = 13'h095c;
          default: begin end
        endcase
      end
      12'h191: begin
        out_r = 13'h05b8;
        case (key_hi)
          1'h1: out_r = 13'h05c5;
          default: begin end
        endcase
      end
      12'h192: begin
        out_r = 13'h05bd;
        case (key_hi)
          1'h1: out_r = 13'h0ac0;
          default: begin end
        endcase
      end
      12'h193: begin
        out_r = 13'h05f2;
      end
      12'h194: begin
        out_r = 13'h05fc;
        case (key_hi)
          1'h1: out_r = 13'h09ab;
          default: begin end
        endcase
      end
      12'h195: begin
        out_r = 13'h099b;
        case (key_hi)
          1'h1: out_r = 13'h059a;
          default: begin end
        endcase
      end
      12'h196: begin
        out_r = 13'h05e7;
        case (key_hi)
          1'h1: out_r = 13'h05a5;
          default: begin end
        endcase
      end
      12'h197: begin
        out_r = 13'h05e9;
      end
      12'h198: begin
        out_r = 13'h0b83;
      end
      12'h199: begin
        out_r = 13'h0505;
        case (key_hi)
          1'h1: out_r = 13'h07d4;
          default: begin end
        endcase
      end
      12'h19a: begin
        out_r = 13'h07a7;
        case (key_hi)
          1'h1: out_r = 13'h0508;
          default: begin end
        endcase
      end
      12'h19b: begin
        out_r = 13'h0a23;
      end
      12'h19c: begin
        out_r = 13'h0592;
        case (key_hi)
          1'h1: out_r = 13'h0510;
          default: begin end
        endcase
      end
      12'h19d: begin
        out_r = 13'h05ec;
        case (key_hi)
          1'h1: out_r = 13'h0599;
          default: begin end
        endcase
      end
      12'h19e: begin
        out_r = 13'h0592;
        case (key_hi)
          1'h1: out_r = 13'h0510;
          default: begin end
        endcase
      end
      12'h19f: begin
        out_r = 13'h0698;
      end
      12'h1a0: begin
        out_r = 13'h0575;
        case (key_hi)
          1'h1: out_r = 13'h055d;
          default: begin end
        endcase
      end
      12'h1a1: begin
        out_r = 13'h069c;
      end
      12'h1a2: begin
        out_r = 13'h055d;
        case (key_hi)
          1'h1: out_r = 13'h0557;
          default: begin end
        endcase
      end
      12'h1a3: begin
        out_r = 13'h0645;
      end
      12'h1a4: begin
        out_r = 13'h0ab7;
        case (key_hi)
          1'h1: out_r = 13'h0556;
          default: begin end
        endcase
      end
      12'h1a5: begin
        out_r = 13'h057f;
        case (key_hi)
          1'h1: out_r = 13'h0559;
          default: begin end
        endcase
      end
      12'h1a6: begin
        out_r = 13'h0560;
        case (key_hi)
          1'h1: out_r = 13'h0943;
          default: begin end
        endcase
      end
      12'h1a7: begin
        out_r = 13'h0544;
      end
      12'h1a8: begin
        out_r = 13'h0548;
        case (key_hi)
          1'h1: out_r = 13'h054a;
          default: begin end
        endcase
      end
      12'h1a9: begin
        out_r = 13'h0544;
        case (key_hi)
          1'h1: out_r = 13'h0a58;
          default: begin end
        endcase
      end
      12'h1aa: begin
        out_r = 13'h0670;
        case (key_hi)
          1'h1: out_r = 13'h05dc;
          default: begin end
        endcase
      end
      12'h1ab: begin
        out_r = 13'h055d;
      end
      12'h1ac: begin
        out_r = 13'h0548;
        case (key_hi)
          1'h1: out_r = 13'h090c;
          default: begin end
        endcase
      end
      12'h1ad: begin
        out_r = 13'h055a;
        case (key_hi)
          1'h1: out_r = 13'h0544;
          default: begin end
        endcase
      end
      12'h1ae: begin
        out_r = 13'h0548;
        case (key_hi)
          1'h1: out_r = 13'h0a83;
          default: begin end
        endcase
      end
      12'h1af: begin
        out_r = 13'h057b;
      end
      12'h1b0: begin
        out_r = 13'h05dd;
        case (key_hi)
          1'h1: out_r = 13'h0683;
          default: begin end
        endcase
      end
      12'h1b1: begin
        out_r = 13'h0538;
        case (key_hi)
          1'h1: out_r = 13'h07f9;
          default: begin end
        endcase
      end
      12'h1b2: begin
        out_r = 13'h09fd;
        case (key_hi)
          1'h1: out_r = 13'h0bb5;
          default: begin end
        endcase
      end
      12'h1b3: begin
        out_r = 13'h0a3b;
      end
      12'h1b4: begin
        out_r = 13'h0508;
        case (key_hi)
          1'h1: out_r = 13'h050a;
          default: begin end
        endcase
      end
      12'h1b5: begin
        out_r = 13'h0504;
        case (key_hi)
          1'h1: out_r = 13'h059f;
          default: begin end
        endcase
      end
      12'h1b6: begin
        out_r = 13'h0502;
        case (key_hi)
          1'h1: out_r = 13'h0a03;
          default: begin end
        endcase
      end
      12'h1b7: begin
        out_r = 13'h0505;
      end
      12'h1b8: begin
        out_r = 13'h05dd;
        case (key_hi)
          1'h1: out_r = 13'h0683;
          default: begin end
        endcase
      end
      12'h1b9: begin
        out_r = 13'h0539;
        case (key_hi)
          1'h1: out_r = 13'h09a5;
          default: begin end
        endcase
      end
      12'h1ba: begin
        out_r = 13'h05b7;
        case (key_hi)
          1'h1: out_r = 13'h0573;
          default: begin end
        endcase
      end
      12'h1bb: begin
        out_r = 13'h0a3b;
      end
      12'h1bc: begin
        out_r = 13'h05e7;
        case (key_hi)
          1'h1: out_r = 13'h0995;
          default: begin end
        endcase
      end
      12'h1bd: begin
        out_r = 13'h07ab;
        case (key_hi)
          1'h1: out_r = 13'h055b;
          default: begin end
        endcase
      end
      12'h1be: begin
        out_r = 13'h05e7;
        case (key_hi)
          1'h1: out_r = 13'h0995;
          default: begin end
        endcase
      end
      12'h1bf: begin
        out_r = 13'h0512;
      end
      12'h1c0: begin
        out_r = 13'h0b43;
        case (key_hi)
          1'h1: out_r = 13'h077f;
          default: begin end
        endcase
      end
      12'h1c1: begin
        out_r = 13'h0684;
        case (key_hi)
          1'h1: out_r = 13'h0765;
          default: begin end
        endcase
      end
      12'h1c2: begin
        out_r = 13'h06c8;
        case (key_hi)
          1'h1: out_r = 13'h096b;
          default: begin end
        endcase
      end
      12'h1c3: begin
        out_r = 13'h0779;
      end
      12'h1c4: begin
        out_r = 13'h0690;
        case (key_hi)
          1'h1: out_r = 13'h0692;
          default: begin end
        endcase
      end
      12'h1c5: begin
        out_r = 13'h06ed;
        case (key_hi)
          1'h1: out_r = 13'h0a9f;
          default: begin end
        endcase
      end
      12'h1c6: begin
        out_r = 13'h0755;
        case (key_hi)
          1'h1: out_r = 13'h07e4;
          default: begin end
        endcase
      end
      12'h1c7: begin
        out_r = 13'h0a1c;
      end
      12'h1c8: begin
        out_r = 13'h0aac;
        case (key_hi)
          1'h1: out_r = 13'h062f;
          default: begin end
        endcase
      end
      12'h1c9: begin
        out_r = 13'h06a4;
        case (key_hi)
          1'h1: out_r = 13'h0779;
          default: begin end
        endcase
      end
      12'h1ca: begin
        out_r = 13'h074f;
        case (key_hi)
          1'h1: out_r = 13'h06a0;
          default: begin end
        endcase
      end
      12'h1cb: begin
        out_r = 13'h0705;
      end
      12'h1cc: begin
        out_r = 13'h0692;
        case (key_hi)
          1'h1: out_r = 13'h0ae5;
          default: begin end
        endcase
      end
      12'h1cd: begin
        out_r = 13'h0be8;
        case (key_hi)
          1'h1: out_r = 13'h0718;
          default: begin end
        endcase
      end
      12'h1ce: begin
        out_r = 13'h0692;
        case (key_hi)
          1'h1: out_r = 13'h0be3;
          default: begin end
        endcase
      end
      12'h1cf: begin
        out_r = 13'h06ed;
      end
      12'h1d0: begin
        out_r = 13'h0652;
        case (key_hi)
          1'h1: out_r = 13'h0790;
          default: begin end
        endcase
      end
      12'h1d1: begin
        out_r = 13'h0b98;
        case (key_hi)
          1'h1: out_r = 13'h079d;
          default: begin end
        endcase
      end
      12'h1d2: begin
        out_r = 13'h0656;
        case (key_hi)
          1'h1: out_r = 13'h054d;
          default: begin end
        endcase
      end
      12'h1d3: begin
        out_r = 13'h065b;
      end
      12'h1d4: begin
        out_r = 13'h0a70;
        case (key_hi)
          1'h1: out_r = 13'h06a3;
          default: begin end
        endcase
      end
      12'h1d5: begin
        out_r = 13'h07b9;
        case (key_hi)
          1'h1: out_r = 13'h0678;
          default: begin end
        endcase
      end
      12'h1d6: begin
        out_r = 13'h07af;
        case (key_hi)
          1'h1: out_r = 13'h0973;
          default: begin end
        endcase
      end
      12'h1d7: begin
        out_r = 13'h07a5;
      end
      12'h1d8: begin
        out_r = 13'h0652;
        case (key_hi)
          1'h1: out_r = 13'h0790;
          default: begin end
        endcase
      end
      12'h1d9: begin
        out_r = 13'h065b;
        case (key_hi)
          1'h1: out_r = 13'h07fd;
          default: begin end
        endcase
      end
      12'h1da: begin
        out_r = 13'h0b93;
        case (key_hi)
          1'h1: out_r = 13'h0654;
          default: begin end
        endcase
      end
      12'h1db: begin
        out_r = 13'h0923;
      end
      12'h1dc: begin
        out_r = 13'h0676;
        case (key_hi)
          1'h1: out_r = 13'h09eb;
          default: begin end
        endcase
      end
      12'h1dd: begin
        out_r = 13'h07a5;
        case (key_hi)
          1'h1: out_r = 13'h0665;
          default: begin end
        endcase
      end
      12'h1de: begin
        out_r = 13'h0676;
        case (key_hi)
          1'h1: out_r = 13'h09eb;
          default: begin end
        endcase
      end
      12'h1df: begin
        out_r = 13'h0679;
      end
      12'h1e0: begin
        out_r = 13'h0b43;
        case (key_hi)
          1'h1: out_r = 13'h077f;
          default: begin end
        endcase
      end
      12'h1e1: begin
        out_r = 13'h0684;
        case (key_hi)
          1'h1: out_r = 13'h0765;
          default: begin end
        endcase
      end
      12'h1e2: begin
        out_r = 13'h06c8;
        case (key_hi)
          1'h1: out_r = 13'h096b;
          default: begin end
        endcase
      end
      12'h1e3: begin
        out_r = 13'h0779;
      end
      12'h1e4: begin
        out_r = 13'h0690;
        case (key_hi)
          1'h1: out_r = 13'h0692;
          default: begin end
        endcase
      end
      12'h1e5: begin
        out_r = 13'h0be8;
        case (key_hi)
          1'h1: out_r = 13'h0b19;
          default: begin end
        endcase
      end
      12'h1e6: begin
        out_r = 13'h0755;
        case (key_hi)
          1'h1: out_r = 13'h06e5;
          default: begin end
        endcase
      end
      12'h1e7: begin
        out_r = 13'h0a1c;
      end
      12'h1e8: begin
        out_r = 13'h0aac;
        case (key_hi)
          1'h1: out_r = 13'h062f;
          default: begin end
        endcase
      end
      12'h1e9: begin
        out_r = 13'h06a4;
        case (key_hi)
          1'h1: out_r = 13'h0779;
          default: begin end
        endcase
      end
      12'h1ea: begin
        out_r = 13'h0923;
        case (key_hi)
          1'h1: out_r = 13'h0768;
          default: begin end
        endcase
      end
      12'h1eb: begin
        out_r = 13'h0505;
      end
      12'h1ec: begin
        out_r = 13'h0692;
        case (key_hi)
          1'h1: out_r = 13'h0ae5;
          default: begin end
        endcase
      end
      12'h1ed: begin
        out_r = 13'h0be8;
        case (key_hi)
          1'h1: out_r = 13'h0718;
          default: begin end
        endcase
      end
      12'h1ee: begin
        out_r = 13'h0692;
        case (key_hi)
          1'h1: out_r = 13'h0be3;
          default: begin end
        endcase
      end
      12'h1ef: begin
        out_r = 13'h06ed;
      end
      12'h1f0: begin
        out_r = 13'h0659;
        case (key_hi)
          1'h1: out_r = 13'h0656;
          default: begin end
        endcase
      end
      12'h1f1: begin
        out_r = 13'h0b98;
        case (key_hi)
          1'h1: out_r = 13'h0603;
          default: begin end
        endcase
      end
      12'h1f2: begin
        out_r = 13'h0652;
        case (key_hi)
          1'h1: out_r = 13'h0790;
          default: begin end
        endcase
      end
      12'h1f3: begin
        out_r = 13'h0b93;
      end
      12'h1f4: begin
        out_r = 13'h0ba3;
        case (key_hi)
          1'h1: out_r = 13'h0568;
          default: begin end
        endcase
      end
      12'h1f5: begin
        out_r = 13'h0664;
        case (key_hi)
          1'h1: out_r = 13'h0bbb;
          default: begin end
        endcase
      end
      12'h1f6: begin
        out_r = 13'h0ba3;
        case (key_hi)
          1'h1: out_r = 13'h0563;
          default: begin end
        endcase
      end
      12'h1f7: begin
        out_r = 13'h0665;
      end
      12'h1f8: begin
        out_r = 13'h0659;
        case (key_hi)
          1'h1: out_r = 13'h0656;
          default: begin end
        endcase
      end
      12'h1f9: begin
        out_r = 13'h0b98;
        case (key_hi)
          1'h1: out_r = 13'h065b;
          default: begin end
        endcase
      end
      12'h1fa: begin
        out_r = 13'h0652;
        case (key_hi)
          1'h1: out_r = 13'h0b93;
          default: begin end
        endcase
      end
      12'h1fb: begin
        out_r = 13'h0b93;
      end
      12'h1fc: begin
        out_r = 13'h0648;
        case (key_hi)
          1'h1: out_r = 13'h064a;
          default: begin end
        endcase
      end
      12'h1fd: begin
        out_r = 13'h0b8c;
        case (key_hi)
          1'h1: out_r = 13'h064f;
          default: begin end
        endcase
      end
      12'h1fe: begin
        out_r = 13'h0648;
        case (key_hi)
          1'h1: out_r = 13'h064a;
          default: begin end
        endcase
      end
      12'h1ff: begin
        out_r = 13'h0642;
      end
      12'h200: begin
        out_r = 13'h0800;
        case (key_hi)
          1'h1: out_r = 13'h0802;
          default: begin end
        endcase
      end
      12'h201: begin
        out_r = 13'h0804;
        case (key_hi)
          1'h1: out_r = 13'h0805;
          default: begin end
        endcase
      end
      12'h202: begin
        out_r = 13'h0808;
        case (key_hi)
          1'h1: out_r = 13'h080a;
          default: begin end
        endcase
      end
      12'h203: begin
        out_r = 13'h080d;
      end
      12'h204: begin
        out_r = 13'h0810;
        case (key_hi)
          1'h1: out_r = 13'h0812;
          default: begin end
        endcase
      end
      12'h205: begin
        out_r = 13'h0418;
        case (key_hi)
          1'h1: out_r = 13'h081b;
          default: begin end
        endcase
      end
      12'h206: begin
        out_r = 13'h0815;
      end
      12'h207: begin
        out_r = 13'h081a;
      end
      12'h208: begin
        out_r = 13'h0820;
        case (key_hi)
          1'h1: out_r = 13'h0822;
          default: begin end
        endcase
      end
      12'h209: begin
        out_r = 13'h0824;
        case (key_hi)
          1'h1: out_r = 13'h0825;
          default: begin end
        endcase
      end
      12'h20a: begin
        out_r = 13'h0828;
        case (key_hi)
          1'h1: out_r = 13'h082a;
          default: begin end
        endcase
      end
      12'h20b: begin
        out_r = 13'h082d;
      end
      12'h20c: begin
        out_r = 13'h0834;
        case (key_hi)
          1'h1: out_r = 13'h0836;
          default: begin end
        endcase
      end
      12'h20d: begin
        out_r = 13'h0839;
        case (key_hi)
          1'h1: out_r = 13'h0838;
          default: begin end
        endcase
      end
      12'h20e: begin
        out_r = 13'h0834;
        case (key_hi)
          1'h1: out_r = 13'h0437;
          default: begin end
        endcase
      end
      12'h20f: begin
        out_r = 13'h0839;
      end
      12'h210: begin
        out_r = 13'h0840;
        case (key_hi)
          1'h1: out_r = 13'h0842;
          default: begin end
        endcase
      end
      12'h211: begin
        out_r = 13'h0844;
        case (key_hi)
          1'h1: out_r = 13'h0845;
          default: begin end
        endcase
      end
      12'h212: begin
        out_r = 13'h0848;
        case (key_hi)
          1'h1: out_r = 13'h084a;
          default: begin end
        endcase
      end
      12'h213: begin
        out_r = 13'h084d;
      end
      12'h214: begin
        out_r = 13'h0460;
        case (key_hi)
          1'h1: out_r = 13'h0862;
          default: begin end
        endcase
      end
      12'h215: begin
        out_r = 13'h0864;
        case (key_hi)
          1'h1: out_r = 13'h0865;
          default: begin end
        endcase
      end
      12'h216: begin
        out_r = 13'h086c;
        case (key_hi)
          1'h1: out_r = 13'h046d;
          default: begin end
        endcase
      end
      12'h217: begin
        out_r = 13'h0865;
      end
      12'h218: begin
        out_r = 13'h0855;
      end
      12'h219: begin
        out_r = 13'h085b;
        case (key_hi)
          1'h1: out_r = 13'h0458;
          default: begin end
        endcase
      end
      12'h21a: begin
        out_r = 13'h0855;
        case (key_hi)
          1'h1: out_r = 13'h0854;
          default: begin end
        endcase
      end
      12'h21b: begin
        out_r = 13'h0453;
      end
      12'h21c: begin
        out_r = 13'h0868;
        case (key_hi)
          1'h1: out_r = 13'h086a;
          default: begin end
        endcase
      end
      12'h21d: begin
        out_r = 13'h0865;
      end
      12'h21e: begin
        out_r = 13'h0868;
        case (key_hi)
          1'h1: out_r = 13'h086a;
          default: begin end
        endcase
      end
      12'h21f: begin
        out_r = 13'h0865;
      end
      12'h220: begin
        out_r = 13'h0880;
        case (key_hi)
          1'h1: out_r = 13'h0882;
          default: begin end
        endcase
      end
      12'h221: begin
        out_r = 13'h0884;
        case (key_hi)
          1'h1: out_r = 13'h0885;
          default: begin end
        endcase
      end
      12'h222: begin
        out_r = 13'h0888;
        case (key_hi)
          1'h1: out_r = 13'h088a;
          default: begin end
        endcase
      end
      12'h223: begin
        out_r = 13'h088d;
      end
      12'h224: begin
        out_r = 13'h0890;
        case (key_hi)
          1'h1: out_r = 13'h0892;
          default: begin end
        endcase
      end
      12'h225: begin
        out_r = 13'h0498;
        case (key_hi)
          1'h1: out_r = 13'h089b;
          default: begin end
        endcase
      end
      12'h226: begin
        out_r = 13'h0895;
      end
      12'h227: begin
        out_r = 13'h089a;
      end
      12'h228: begin
        out_r = 13'h08a0;
        case (key_hi)
          1'h1: out_r = 13'h08a2;
          default: begin end
        endcase
      end
      12'h229: begin
        out_r = 13'h08a4;
        case (key_hi)
          1'h1: out_r = 13'h08a5;
          default: begin end
        endcase
      end
      12'h22a: begin
        out_r = 13'h08a8;
        case (key_hi)
          1'h1: out_r = 13'h08aa;
          default: begin end
        endcase
      end
      12'h22b: begin
        out_r = 13'h08ad;
      end
      12'h22c: begin
        out_r = 13'h08b4;
        case (key_hi)
          1'h1: out_r = 13'h08b6;
          default: begin end
        endcase
      end
      12'h22d: begin
        out_r = 13'h08b9;
        case (key_hi)
          1'h1: out_r = 13'h08b8;
          default: begin end
        endcase
      end
      12'h22e: begin
        out_r = 13'h08b4;
        case (key_hi)
          1'h1: out_r = 13'h04b7;
          default: begin end
        endcase
      end
      12'h22f: begin
        out_r = 13'h08b9;
      end
      12'h230: begin
        out_r = 13'h04d3;
        case (key_hi)
          1'h1: out_r = 13'h08d0;
          default: begin end
        endcase
      end
      12'h231: begin
        out_r = 13'h08d4;
        case (key_hi)
          1'h1: out_r = 13'h08d5;
          default: begin end
        endcase
      end
      12'h232: begin
        out_r = 13'h04db;
        case (key_hi)
          1'h1: out_r = 13'h08d8;
          default: begin end
        endcase
      end
      12'h233: begin
        out_r = 13'h08d5;
      end
      12'h234: begin
        out_r = 13'h08e4;
        case (key_hi)
          1'h1: out_r = 13'h08e5;
          default: begin end
        endcase
      end
      12'h235: begin
        out_r = 13'h08e8;
        case (key_hi)
          1'h1: out_r = 13'h08ea;
          default: begin end
        endcase
      end
      12'h236: begin
        out_r = 13'h08e2;
        case (key_hi)
          1'h1: out_r = 13'h04e3;
          default: begin end
        endcase
      end
      12'h237: begin
        out_r = 13'h08ea;
      end
      12'h238: begin
        out_r = 13'h04d3;
        case (key_hi)
          1'h1: out_r = 13'h08d0;
          default: begin end
        endcase
      end
      12'h239: begin
        out_r = 13'h08d5;
        case (key_hi)
          1'h1: out_r = 13'h08d4;
          default: begin end
        endcase
      end
      12'h23a: begin
        out_r = 13'h08df;
        case (key_hi)
          1'h1: out_r = 13'h08dd;
          default: begin end
        endcase
      end
      12'h23b: begin
        out_r = 13'h08d5;
      end
      12'h23c: begin
        out_r = 13'h08e4;
        case (key_hi)
          1'h1: out_r = 13'h08e5;
          default: begin end
        endcase
      end
      12'h23d: begin
        out_r = 13'h04ec;
        case (key_hi)
          1'h1: out_r = 13'h08ef;
          default: begin end
        endcase
      end
      12'h23e: begin
        out_r = 13'h08e4;
        case (key_hi)
          1'h1: out_r = 13'h08e5;
          default: begin end
        endcase
      end
      12'h23f: begin
        out_r = 13'h08e2;
      end
      12'h240: begin
        out_r = 13'h0900;
        case (key_hi)
          1'h1: out_r = 13'h0902;
          default: begin end
        endcase
      end
      12'h241: begin
        out_r = 13'h0904;
        case (key_hi)
          1'h1: out_r = 13'h0905;
          default: begin end
        endcase
      end
      12'h242: begin
        out_r = 13'h0908;
        case (key_hi)
          1'h1: out_r = 13'h090a;
          default: begin end
        endcase
      end
      12'h243: begin
        out_r = 13'h0a0d;
      end
      12'h244: begin
        out_r = 13'h0910;
        case (key_hi)
          1'h1: out_r = 13'h0912;
          default: begin end
        endcase
      end
      12'h245: begin
        out_r = 13'h0aec;
        case (key_hi)
          1'h1: out_r = 13'h0a78;
          default: begin end
        endcase
      end
      12'h246: begin
        out_r = 13'h0915;
      end
      12'h247: begin
        out_r = 13'h095f;
      end
      12'h248: begin
        out_r = 13'h0920;
        case (key_hi)
          1'h1: out_r = 13'h0922;
          default: begin end
        endcase
      end
      12'h249: begin
        out_r = 13'h0924;
        case (key_hi)
          1'h1: out_r = 13'h0925;
          default: begin end
        endcase
      end
      12'h24a: begin
        out_r = 13'h0928;
        case (key_hi)
          1'h1: out_r = 13'h092a;
          default: begin end
        endcase
      end
      12'h24b: begin
        out_r = 13'h0a2d;
      end
      12'h24c: begin
        out_r = 13'h0a34;
        case (key_hi)
          1'h1: out_r = 13'h0936;
          default: begin end
        endcase
      end
      12'h24d: begin
        out_r = 13'h0939;
        case (key_hi)
          1'h1: out_r = 13'h0938;
          default: begin end
        endcase
      end
      12'h24e: begin
        out_r = 13'h0a34;
        case (key_hi)
          1'h1: out_r = 13'h05e5;
          default: begin end
        endcase
      end
      12'h24f: begin
        out_r = 13'h0939;
      end
      12'h250: begin
        out_r = 13'h0590;
        case (key_hi)
          1'h1: out_r = 13'h09ca;
          default: begin end
        endcase
      end
      12'h251: begin
        out_r = 13'h0984;
        case (key_hi)
          1'h1: out_r = 13'h0985;
          default: begin end
        endcase
      end
      12'h252: begin
        out_r = 13'h058b;
        case (key_hi)
          1'h1: out_r = 13'h095c;
          default: begin end
        endcase
      end
      12'h253: begin
        out_r = 13'h0bb9;
      end
      12'h254: begin
        out_r = 13'h0990;
        case (key_hi)
          1'h1: out_r = 13'h0992;
          default: begin end
        endcase
      end
      12'h255: begin
        out_r = 13'h0618;
        case (key_hi)
          1'h1: out_r = 13'h0bb9;
          default: begin end
        endcase
      end
      12'h256: begin
        out_r = 13'h0994;
        case (key_hi)
          1'h1: out_r = 13'h0995;
          default: begin end
        endcase
      end
      12'h257: begin
        out_r = 13'h0ae0;
      end
      12'h258: begin
        out_r = 13'h09c8;
        case (key_hi)
          1'h1: out_r = 13'h09f3;
          default: begin end
        endcase
      end
      12'h259: begin
        out_r = 13'h09b8;
        case (key_hi)
          1'h1: out_r = 13'h0985;
          default: begin end
        endcase
      end
      12'h25a: begin
        out_r = 13'h05bc;
        case (key_hi)
          1'h1: out_r = 13'h097f;
          default: begin end
        endcase
      end
      12'h25b: begin
        out_r = 13'h0bb9;
      end
      12'h25c: begin
        out_r = 13'h0994;
        case (key_hi)
          1'h1: out_r = 13'h09e5;
          default: begin end
        endcase
      end
      12'h25d: begin
        out_r = 13'h0bad;
        case (key_hi)
          1'h1: out_r = 13'h05e3;
          default: begin end
        endcase
      end
      12'h25e: begin
        out_r = 13'h0994;
        case (key_hi)
          1'h1: out_r = 13'h09e5;
          default: begin end
        endcase
      end
      12'h25f: begin
        out_r = 13'h0992;
      end
      12'h260: begin
        out_r = 13'h095d;
        case (key_hi)
          1'h1: out_r = 13'h0957;
          default: begin end
        endcase
      end
      12'h261: begin
        out_r = 13'h0bda;
        case (key_hi)
          1'h1: out_r = 13'h0607;
          default: begin end
        endcase
      end
      12'h262: begin
        out_r = 13'h0957;
        case (key_hi)
          1'h1: out_r = 13'h0555;
          default: begin end
        endcase
      end
      12'h263: begin
        out_r = 13'h0bda;
      end
      12'h264: begin
        out_r = 13'h06ed;
        case (key_hi)
          1'h1: out_r = 13'h054c;
          default: begin end
        endcase
      end
      12'h265: begin
        out_r = 13'h097f;
        case (key_hi)
          1'h1: out_r = 13'h0679;
          default: begin end
        endcase
      end
      12'h266: begin
        out_r = 13'h097d;
        case (key_hi)
          1'h1: out_r = 13'h0564;
          default: begin end
        endcase
      end
      12'h267: begin
        out_r = 13'h0573;
      end
      12'h268: begin
        out_r = 13'h0957;
        case (key_hi)
          1'h1: out_r = 13'h0555;
          default: begin end
        endcase
      end
      12'h269: begin
        out_r = 13'h0b3d;
        case (key_hi)
          1'h1: out_r = 13'h0b78;
          default: begin end
        endcase
      end
      12'h26a: begin
        out_r = 13'h0952;
        case (key_hi)
          1'h1: out_r = 13'h06cb;
          default: begin end
        endcase
      end
      12'h26b: begin
        out_r = 13'h0bd4;
      end
      12'h26c: begin
        out_r = 13'h09a7;
        case (key_hi)
          1'h1: out_r = 13'h0a56;
          default: begin end
        endcase
      end
      12'h26d: begin
        out_r = 13'h0942;
        case (key_hi)
          1'h1: out_r = 13'h0964;
          default: begin end
        endcase
      end
      12'h26e: begin
        out_r = 13'h09a7;
        case (key_hi)
          1'h1: out_r = 13'h05e9;
          default: begin end
        endcase
      end
      12'h26f: begin
        out_r = 13'h0965;
      end
      12'h270: begin
        out_r = 13'h09f0;
        case (key_hi)
          1'h1: out_r = 13'h09da;
          default: begin end
        endcase
      end
      12'h271: begin
        out_r = 13'h09a4;
        case (key_hi)
          1'h1: out_r = 13'h0bb9;
          default: begin end
        endcase
      end
      12'h272: begin
        out_r = 13'h07db;
        case (key_hi)
          1'h1: out_r = 13'h09d7;
          default: begin end
        endcase
      end
      12'h273: begin
        out_r = 13'h09d4;
      end
      12'h274: begin
        out_r = 13'h0994;
        case (key_hi)
          1'h1: out_r = 13'h0955;
          default: begin end
        endcase
      end
      12'h275: begin
        out_r = 13'h07ec;
        case (key_hi)
          1'h1: out_r = 13'h099f;
          default: begin end
        endcase
      end
      12'h276: begin
        out_r = 13'h0994;
        case (key_hi)
          1'h1: out_r = 13'h05c3;
          default: begin end
        endcase
      end
      12'h277: begin
        out_r = 13'h09aa;
      end
      12'h278: begin
        out_r = 13'h09f0;
        case (key_hi)
          1'h1: out_r = 13'h09da;
          default: begin end
        endcase
      end
      12'h279: begin
        out_r = 13'h09a4;
        case (key_hi)
          1'h1: out_r = 13'h0bb9;
          default: begin end
        endcase
      end
      12'h27a: begin
        out_r = 13'h07db;
        case (key_hi)
          1'h1: out_r = 13'h0a55;
          default: begin end
        endcase
      end
      12'h27b: begin
        out_r = 13'h09d4;
      end
      12'h27c: begin
        out_r = 13'h09e5;
        case (key_hi)
          1'h1: out_r = 13'h0994;
          default: begin end
        endcase
      end
      12'h27d: begin
        out_r = 13'h0bad;
        case (key_hi)
          1'h1: out_r = 13'h05e3;
          default: begin end
        endcase
      end
      12'h27e: begin
        out_r = 13'h09e5;
        case (key_hi)
          1'h1: out_r = 13'h0994;
          default: begin end
        endcase
      end
      12'h27f: begin
        out_r = 13'h0992;
      end
      12'h280: begin
        out_r = 13'h0a00;
        case (key_hi)
          1'h1: out_r = 13'h0a02;
          default: begin end
        endcase
      end
      12'h281: begin
        out_r = 13'h0a04;
        case (key_hi)
          1'h1: out_r = 13'h0b65;
          default: begin end
        endcase
      end
      12'h282: begin
        out_r = 13'h0a08;
        case (key_hi)
          1'h1: out_r = 13'h0a0a;
          default: begin end
        endcase
      end
      12'h283: begin
        out_r = 13'h0902;
      end
      12'h284: begin
        out_r = 13'h0a10;
        case (key_hi)
          1'h1: out_r = 13'h0a12;
          default: begin end
        endcase
      end
      12'h285: begin
        out_r = 13'h0aea;
      end
      12'h286: begin
        out_r = 13'h0be5;
        case (key_hi)
          1'h1: out_r = 13'h0b15;
          default: begin end
        endcase
      end
      12'h287: begin
        out_r = 13'h0aea;
      end
      12'h288: begin
        out_r = 13'h0a20;
        case (key_hi)
          1'h1: out_r = 13'h0a22;
          default: begin end
        endcase
      end
      12'h289: begin
        out_r = 13'h0a24;
        case (key_hi)
          1'h1: out_r = 13'h0b45;
          default: begin end
        endcase
      end
      12'h28a: begin
        out_r = 13'h0a28;
        case (key_hi)
          1'h1: out_r = 13'h0a2a;
          default: begin end
        endcase
      end
      12'h28b: begin
        out_r = 13'h0a02;
      end
      12'h28c: begin
        out_r = 13'h0b12;
      end
      12'h28d: begin
        out_r = 13'h0a39;
        case (key_hi)
          1'h1: out_r = 13'h059f;
          default: begin end
        endcase
      end
      12'h28e: begin
        out_r = 13'h0b12;
        case (key_hi)
          1'h1: out_r = 13'h0be4;
          default: begin end
        endcase
      end
      12'h28f: begin
        out_r = 13'h0a39;
      end
      12'h290: begin
        out_r = 13'h0a40;
        case (key_hi)
          1'h1: out_r = 13'h0a42;
          default: begin end
        endcase
      end
      12'h291: begin
        out_r = 13'h0a44;
        case (key_hi)
          1'h1: out_r = 13'h0b85;
          default: begin end
        endcase
      end
      12'h292: begin
        out_r = 13'h0a48;
        case (key_hi)
          1'h1: out_r = 13'h0a4a;
          default: begin end
        endcase
      end
      12'h293: begin
        out_r = 13'h094d;
      end
      12'h294: begin
        out_r = 13'h0983;
        case (key_hi)
          1'h1: out_r = 13'h0ba2;
          default: begin end
        endcase
      end
      12'h295: begin
        out_r = 13'h0a64;
        case (key_hi)
          1'h1: out_r = 13'h0aea;
          default: begin end
        endcase
      end
      12'h296: begin
        out_r = 13'h0513;
        case (key_hi)
          1'h1: out_r = 13'h0a5d;
          default: begin end
        endcase
      end
      12'h297: begin
        out_r = 13'h0a65;
      end
      12'h298: begin
        out_r = 13'h0b95;
      end
      12'h299: begin
        out_r = 13'h0a7f;
        case (key_hi)
          1'h1: out_r = 13'h0559;
          default: begin end
        endcase
      end
      12'h29a: begin
        out_r = 13'h0b95;
        case (key_hi)
          1'h1: out_r = 13'h0b94;
          default: begin end
        endcase
      end
      12'h29b: begin
        out_r = 13'h0ad5;
      end
      12'h29c: begin
        out_r = 13'h07e3;
        case (key_hi)
          1'h1: out_r = 13'h0ba2;
          default: begin end
        endcase
      end
      12'h29d: begin
        out_r = 13'h0aea;
        case (key_hi)
          1'h1: out_r = 13'h0ba2;
          default: begin end
        endcase
      end
      12'h29e: begin
        out_r = 13'h07e3;
        case (key_hi)
          1'h1: out_r = 13'h0ba2;
          default: begin end
        endcase
      end
      12'h29f: begin
        out_r = 13'h0a79;
      end
      12'h2a0: begin
        out_r = 13'h0a80;
        case (key_hi)
          1'h1: out_r = 13'h0a82;
          default: begin end
        endcase
      end
      12'h2a1: begin
        out_r = 13'h0a84;
        case (key_hi)
          1'h1: out_r = 13'h0bf9;
          default: begin end
        endcase
      end
      12'h2a2: begin
        out_r = 13'h0a88;
        case (key_hi)
          1'h1: out_r = 13'h0a8a;
          default: begin end
        endcase
      end
      12'h2a3: begin
        out_r = 13'h0bf8;
      end
      12'h2a4: begin
        out_r = 13'h0a90;
        case (key_hi)
          1'h1: out_r = 13'h0a92;
          default: begin end
        endcase
      end
      12'h2a5: begin
        out_r = 13'h09ed;
        case (key_hi)
          1'h1: out_r = 13'h0be8;
          default: begin end
        endcase
      end
      12'h2a6: begin
        out_r = 13'h0b15;
        case (key_hi)
          1'h1: out_r = 13'h0b55;
          default: begin end
        endcase
      end
      12'h2a7: begin
        out_r = 13'h06a8;
      end
      12'h2a8: begin
        out_r = 13'h0aa0;
        case (key_hi)
          1'h1: out_r = 13'h0aa2;
          default: begin end
        endcase
      end
      12'h2a9: begin
        out_r = 13'h0aa4;
        case (key_hi)
          1'h1: out_r = 13'h0bc5;
          default: begin end
        endcase
      end
      12'h2aa: begin
        out_r = 13'h0aa8;
        case (key_hi)
          1'h1: out_r = 13'h0aaa;
          default: begin end
        endcase
      end
      12'h2ab: begin
        out_r = 13'h0af8;
      end
      12'h2ac: begin
        out_r = 13'h0a15;
      end
      12'h2ad: begin
        out_r = 13'h0ab9;
        case (key_hi)
          1'h1: out_r = 13'h05e8;
          default: begin end
        endcase
      end
      12'h2ae: begin
        out_r = 13'h0a15;
        case (key_hi)
          1'h1: out_r = 13'h054b;
          default: begin end
        endcase
      end
      12'h2af: begin
        out_r = 13'h0ab9;
      end
      12'h2b0: begin
        out_r = 13'h06d3;
        case (key_hi)
          1'h1: out_r = 13'h050b;
          default: begin end
        endcase
      end
      12'h2b1: begin
        out_r = 13'h0ad4;
        case (key_hi)
          1'h1: out_r = 13'h0ada;
          default: begin end
        endcase
      end
      12'h2b2: begin
        out_r = 13'h050b;
      end
      12'h2b3: begin
        out_r = 13'h0a39;
      end
      12'h2b4: begin
        out_r = 13'h0ae4;
        case (key_hi)
          1'h1: out_r = 13'h0baa;
          default: begin end
        endcase
      end
      12'h2b5: begin
        out_r = 13'h0ae8;
        case (key_hi)
          1'h1: out_r = 13'h067b;
          default: begin end
        endcase
      end
      12'h2b6: begin
        out_r = 13'h0ae2;
        case (key_hi)
          1'h1: out_r = 13'h0513;
          default: begin end
        endcase
      end
      12'h2b7: begin
        out_r = 13'h0aea;
      end
      12'h2b8: begin
        out_r = 13'h06d3;
        case (key_hi)
          1'h1: out_r = 13'h050b;
          default: begin end
        endcase
      end
      12'h2b9: begin
        out_r = 13'h0b99;
        case (key_hi)
          1'h1: out_r = 13'h0a20;
          default: begin end
        endcase
      end
      12'h2ba: begin
        out_r = 13'h0a5a;
        case (key_hi)
          1'h1: out_r = 13'h0655;
          default: begin end
        endcase
      end
      12'h2bb: begin
        out_r = 13'h0a39;
      end
      12'h2bc: begin
        out_r = 13'h0ae4;
        case (key_hi)
          1'h1: out_r = 13'h0baa;
          default: begin end
        endcase
      end
      12'h2bd: begin
        out_r = 13'h0979;
        case (key_hi)
          1'h1: out_r = 13'h0a55;
          default: begin end
        endcase
      end
      12'h2be: begin
        out_r = 13'h0ae4;
        case (key_hi)
          1'h1: out_r = 13'h0baa;
          default: begin end
        endcase
      end
      12'h2bf: begin
        out_r = 13'h0ae2;
      end
      12'h2c0: begin
        out_r = 13'h0b4d;
        case (key_hi)
          1'h1: out_r = 13'h074c;
          default: begin end
        endcase
      end
      12'h2c1: begin
        out_r = 13'h0b44;
        case (key_hi)
          1'h1: out_r = 13'h0925;
          default: begin end
        endcase
      end
      12'h2c2: begin
        out_r = 13'h0a76;
        case (key_hi)
          1'h1: out_r = 13'h09d7;
          default: begin end
        endcase
      end
      12'h2c3: begin
        out_r = 13'h0653;
      end
      12'h2c4: begin
        out_r = 13'h0b50;
        case (key_hi)
          1'h1: out_r = 13'h0b52;
          default: begin end
        endcase
      end
      12'h2c5: begin
        out_r = 13'h0aec;
        case (key_hi)
          1'h1: out_r = 13'h0568;
          default: begin end
        endcase
      end
      12'h2c6: begin
        out_r = 13'h0a70;
      end
      12'h2c7: begin
        out_r = 13'h096c;
      end
      12'h2c8: begin
        out_r = 13'h0aad;
        case (key_hi)
          1'h1: out_r = 13'h0574;
          default: begin end
        endcase
      end
      12'h2c9: begin
        out_r = 13'h0b64;
        case (key_hi)
          1'h1: out_r = 13'h0905;
          default: begin end
        endcase
      end
      12'h2ca: begin
        out_r = 13'h0a74;
        case (key_hi)
          1'h1: out_r = 13'h0997;
          default: begin end
        endcase
      end
      12'h2cb: begin
        out_r = 13'h095d;
      end
      12'h2cc: begin
        out_r = 13'h0915;
        case (key_hi)
          1'h1: out_r = 13'h0a6d;
          default: begin end
        endcase
      end
      12'h2cd: begin
        out_r = 13'h0b52;
        case (key_hi)
          1'h1: out_r = 13'h0910;
          default: begin end
        endcase
      end
      12'h2ce: begin
        out_r = 13'h0915;
        case (key_hi)
          1'h1: out_r = 13'h0573;
          default: begin end
        endcase
      end
      12'h2cf: begin
        out_r = 13'h071b;
      end
      12'h2d0: begin
        out_r = 13'h0b90;
        case (key_hi)
          1'h1: out_r = 13'h0b92;
          default: begin end
        endcase
      end
      12'h2d1: begin
        out_r = 13'h0b9a;
        case (key_hi)
          1'h1: out_r = 13'h0bb9;
          default: begin end
        endcase
      end
      12'h2d2: begin
        out_r = 13'h09b5;
        case (key_hi)
          1'h1: out_r = 13'h09fd;
          default: begin end
        endcase
      end
      12'h2d3: begin
        out_r = 13'h0b82;
      end
      12'h2d4: begin
        out_r = 13'h0ba0;
        case (key_hi)
          1'h1: out_r = 13'h0ba2;
          default: begin end
        endcase
      end
      12'h2d5: begin
        out_r = 13'h09ed;
        case (key_hi)
          1'h1: out_r = 13'h059b;
          default: begin end
        endcase
      end
      12'h2d6: begin
        out_r = 13'h09e6;
        case (key_hi)
          1'h1: out_r = 13'h09e8;
          default: begin end
        endcase
      end
      12'h2d7: begin
        out_r = 13'h0bb9;
      end
      12'h2d8: begin
        out_r = 13'h0b88;
        case (key_hi)
          1'h1: out_r = 13'h0b8a;
          default: begin end
        endcase
      end
      12'h2d9: begin
        out_r = 13'h0b84;
        case (key_hi)
          1'h1: out_r = 13'h0b85;
          default: begin end
        endcase
      end
      12'h2da: begin
        out_r = 13'h09c2;
        case (key_hi)
          1'h1: out_r = 13'h09d2;
          default: begin end
        endcase
      end
      12'h2db: begin
        out_r = 13'h0783;
      end
      12'h2dc: begin
        out_r = 13'h0ba8;
        case (key_hi)
          1'h1: out_r = 13'h09e6;
          default: begin end
        endcase
      end
      12'h2dd: begin
        out_r = 13'h0bb9;
        case (key_hi)
          1'h1: out_r = 13'h0998;
          default: begin end
        endcase
      end
      12'h2de: begin
        out_r = 13'h0ba8;
        case (key_hi)
          1'h1: out_r = 13'h09e6;
          default: begin end
        endcase
      end
      12'h2df: begin
        out_r = 13'h0ba2;
      end
      12'h2e0: begin
        out_r = 13'h0b4d;
        case (key_hi)
          1'h1: out_r = 13'h074c;
          default: begin end
        endcase
      end
      12'h2e1: begin
        out_r = 13'h0b44;
        case (key_hi)
          1'h1: out_r = 13'h0925;
          default: begin end
        endcase
      end
      12'h2e2: begin
        out_r = 13'h0a76;
        case (key_hi)
          1'h1: out_r = 13'h09d7;
          default: begin end
        endcase
      end
      12'h2e3: begin
        out_r = 13'h0653;
      end
      12'h2e4: begin
        out_r = 13'h0955;
      end
      12'h2e5: begin
        out_r = 13'h0b1a;
        case (key_hi)
          1'h1: out_r = 13'h0965;
          default: begin end
        endcase
      end
      12'h2e6: begin
        out_r = 13'h0613;
        case (key_hi)
          1'h1: out_r = 13'h097d;
          default: begin end
        endcase
      end
      12'h2e7: begin
        out_r = 13'h095f;
      end
      12'h2e8: begin
        out_r = 13'h0936;
        case (key_hi)
          1'h1: out_r = 13'h098f;
          default: begin end
        endcase
      end
      12'h2e9: begin
        out_r = 13'h0905;
      end
      12'h2ea: begin
        out_r = 13'h0a34;
        case (key_hi)
          1'h1: out_r = 13'h0ab4;
          default: begin end
        endcase
      end
      12'h2eb: begin
        out_r = 13'h0b38;
      end
      12'h2ec: begin
        out_r = 13'h0915;
        case (key_hi)
          1'h1: out_r = 13'h0a6d;
          default: begin end
        endcase
      end
      12'h2ed: begin
        out_r = 13'h0b52;
        case (key_hi)
          1'h1: out_r = 13'h0910;
          default: begin end
        endcase
      end
      12'h2ee: begin
        out_r = 13'h0915;
        case (key_hi)
          1'h1: out_r = 13'h0573;
          default: begin end
        endcase
      end
      12'h2ef: begin
        out_r = 13'h071b;
      end
      12'h2f0: begin
        out_r = 13'h0b90;
        case (key_hi)
          1'h1: out_r = 13'h0b92;
          default: begin end
        endcase
      end
      12'h2f1: begin
        out_r = 13'h0b9d;
        case (key_hi)
          1'h1: out_r = 13'h0b98;
          default: begin end
        endcase
      end
      12'h2f2: begin
        out_r = 13'h09fd;
        case (key_hi)
          1'h1: out_r = 13'h0983;
          default: begin end
        endcase
      end
      12'h2f3: begin
        out_r = 13'h0bb8;
      end
      12'h2f4: begin
        out_r = 13'h06cb;
        case (key_hi)
          1'h1: out_r = 13'h0715;
          default: begin end
        endcase
      end
      12'h2f5: begin
        out_r = 13'h0bb8;
        case (key_hi)
          1'h1: out_r = 13'h0bb9;
          default: begin end
        endcase
      end
      12'h2f6: begin
        out_r = 13'h0617;
        case (key_hi)
          1'h1: out_r = 13'h0aa2;
          default: begin end
        endcase
      end
      12'h2f7: begin
        out_r = 13'h0bb9;
      end
      12'h2f8: begin
        out_r = 13'h0b90;
        case (key_hi)
          1'h1: out_r = 13'h0b92;
          default: begin end
        endcase
      end
      12'h2f9: begin
        out_r = 13'h0b9d;
        case (key_hi)
          1'h1: out_r = 13'h079f;
          default: begin end
        endcase
      end
      12'h2fa: begin
        out_r = 13'h09fd;
        case (key_hi)
          1'h1: out_r = 13'h09c2;
          default: begin end
        endcase
      end
      12'h2fb: begin
        out_r = 13'h0bb8;
      end
      12'h2fc: begin
        out_r = 13'h0b88;
        case (key_hi)
          1'h1: out_r = 13'h0b8a;
          default: begin end
        endcase
      end
      12'h2fd: begin
        out_r = 13'h099a;
        case (key_hi)
          1'h1: out_r = 13'h099f;
          default: begin end
        endcase
      end
      12'h2fe: begin
        out_r = 13'h0b88;
        case (key_hi)
          1'h1: out_r = 13'h0b8a;
          default: begin end
        endcase
      end
      12'h2ff: begin
        out_r = 13'h0b82;
      end
      12'h300: begin
        out_r = 13'h0d34;
        case (key_hi)
          1'h1: out_r = 13'h0d36;
          default: begin end
        endcase
      end
      12'h301: begin
        out_r = 13'h0d38;
        case (key_hi)
          1'h1: out_r = 13'h0d39;
          default: begin end
        endcase
      end
      12'h302: begin
        out_r = 13'h0d32;
        case (key_hi)
          1'h1: out_r = 13'h0d33;
          default: begin end
        endcase
      end
      12'h303: begin
        out_r = 13'h0d38;
      end
      12'h304: begin
        out_r = 13'h0d10;
        case (key_hi)
          1'h1: out_r = 13'h0d12;
          default: begin end
        endcase
      end
      12'h305: begin
        out_r = 13'h0d18;
        case (key_hi)
          1'h1: out_r = 13'h0d1b;
          default: begin end
        endcase
      end
      12'h306: begin
        out_r = 13'h0d15;
      end
      12'h307: begin
        out_r = 13'h0d1a;
      end
      12'h308: begin
        out_r = 13'h0d00;
        case (key_hi)
          1'h1: out_r = 13'h0d02;
          default: begin end
        endcase
      end
      12'h309: begin
        out_r = 13'h0d04;
        case (key_hi)
          1'h1: out_r = 13'h0d05;
          default: begin end
        endcase
      end
      12'h30a: begin
        out_r = 13'h0d0d;
        case (key_hi)
          1'h1: out_r = 13'h0d0f;
          default: begin end
        endcase
      end
      12'h30b: begin
        out_r = 13'h0d04;
      end
      12'h30c: begin
        out_r = 13'h0d10;
        case (key_hi)
          1'h1: out_r = 13'h0d12;
          default: begin end
        endcase
      end
      12'h30d: begin
        out_r = 13'h0d19;
        case (key_hi)
          1'h1: out_r = 13'h0d18;
          default: begin end
        endcase
      end
      12'h30e: begin
        out_r = 13'h0d10;
        case (key_hi)
          1'h1: out_r = 13'h0d13;
          default: begin end
        endcase
      end
      12'h30f: begin
        out_r = 13'h0d19;
      end
      12'h310: begin
        out_r = 13'h0d40;
        case (key_hi)
          1'h1: out_r = 13'h0d42;
          default: begin end
        endcase
      end
      12'h311: begin
        out_r = 13'h0d44;
        case (key_hi)
          1'h1: out_r = 13'h0d45;
          default: begin end
        endcase
      end
      12'h312: begin
        out_r = 13'h0d48;
        case (key_hi)
          1'h1: out_r = 13'h0d4a;
          default: begin end
        endcase
      end
      12'h313: begin
        out_r = 13'h0d4d;
      end
      12'h314: begin
        out_r = 13'h0d6d;
        case (key_hi)
          1'h1: out_r = 13'h0d6c;
          default: begin end
        endcase
      end
      12'h315: begin
        out_r = 13'h0d64;
        case (key_hi)
          1'h1: out_r = 13'h0d65;
          default: begin end
        endcase
      end
      12'h316: begin
        out_r = 13'h0d68;
        case (key_hi)
          1'h1: out_r = 13'h0d6a;
          default: begin end
        endcase
      end
      12'h317: begin
        out_r = 13'h0d65;
      end
      12'h318: begin
        out_r = 13'h0d55;
      end
      12'h319: begin
        out_r = 13'h0d5b;
        case (key_hi)
          1'h1: out_r = 13'h0d58;
          default: begin end
        endcase
      end
      12'h31a: begin
        out_r = 13'h0d55;
        case (key_hi)
          1'h1: out_r = 13'h0d54;
          default: begin end
        endcase
      end
      12'h31b: begin
        out_r = 13'h0d53;
      end
      12'h31c: begin
        out_r = 13'h0d60;
        case (key_hi)
          1'h1: out_r = 13'h0d63;
          default: begin end
        endcase
      end
      12'h31d: begin
        out_r = 13'h0d65;
      end
      12'h31e: begin
        out_r = 13'h0d60;
        case (key_hi)
          1'h1: out_r = 13'h0d63;
          default: begin end
        endcase
      end
      12'h31f: begin
        out_r = 13'h0d65;
      end
      12'h320: begin
        out_r = 13'h0db6;
        case (key_hi)
          1'h1: out_r = 13'h0db4;
          default: begin end
        endcase
      end
      12'h321: begin
        out_r = 13'h0db8;
        case (key_hi)
          1'h1: out_r = 13'h0db9;
          default: begin end
        endcase
      end
      12'h322: begin
        out_r = 13'h0db0;
        case (key_hi)
          1'h1: out_r = 13'h0db3;
          default: begin end
        endcase
      end
      12'h323: begin
        out_r = 13'h0db8;
      end
      12'h324: begin
        out_r = 13'h0d90;
        case (key_hi)
          1'h1: out_r = 13'h0d92;
          default: begin end
        endcase
      end
      12'h325: begin
        out_r = 13'h0d98;
        case (key_hi)
          1'h1: out_r = 13'h0d9b;
          default: begin end
        endcase
      end
      12'h326: begin
        out_r = 13'h0d95;
      end
      12'h327: begin
        out_r = 13'h0d9a;
      end
      12'h328: begin
        out_r = 13'h0d80;
        case (key_hi)
          1'h1: out_r = 13'h0d82;
          default: begin end
        endcase
      end
      12'h329: begin
        out_r = 13'h0d84;
        case (key_hi)
          1'h1: out_r = 13'h0d85;
          default: begin end
        endcase
      end
      12'h32a: begin
        out_r = 13'h0d8d;
        case (key_hi)
          1'h1: out_r = 13'h0d8f;
          default: begin end
        endcase
      end
      12'h32b: begin
        out_r = 13'h0d84;
      end
      12'h32c: begin
        out_r = 13'h0d92;
        case (key_hi)
          1'h1: out_r = 13'h0d90;
          default: begin end
        endcase
      end
      12'h32d: begin
        out_r = 13'h0d9f;
        case (key_hi)
          1'h1: out_r = 13'h0d9d;
          default: begin end
        endcase
      end
      12'h32e: begin
        out_r = 13'h0d92;
        case (key_hi)
          1'h1: out_r = 13'h0d93;
          default: begin end
        endcase
      end
      12'h32f: begin
        out_r = 13'h0d9f;
      end
      12'h330: begin
        out_r = 13'h0d55;
        case (key_hi)
          1'h1: out_r = 13'h0d54;
          default: begin end
        endcase
      end
      12'h331: begin
        out_r = 13'h0d5a;
        case (key_hi)
          1'h1: out_r = 13'h0d5b;
          default: begin end
        endcase
      end
      12'h332: begin
        out_r = 13'h0d55;
        case (key_hi)
          1'h1: out_r = 13'h0d54;
          default: begin end
        endcase
      end
      12'h333: begin
        out_r = 13'h0d5b;
      end
      12'h334: begin
        out_r = 13'h0d48;
        case (key_hi)
          1'h1: out_r = 13'h0d4a;
          default: begin end
        endcase
      end
      12'h335: begin
        out_r = 13'h0d44;
        case (key_hi)
          1'h1: out_r = 13'h0d45;
          default: begin end
        endcase
      end
      12'h336: begin
        out_r = 13'h0d42;
        case (key_hi)
          1'h1: out_r = 13'h0d43;
          default: begin end
        endcase
      end
      12'h337: begin
        out_r = 13'h0d45;
      end
      12'h338: begin
        out_r = 13'h0d55;
        case (key_hi)
          1'h1: out_r = 13'h0d54;
          default: begin end
        endcase
      end
      12'h339: begin
        out_r = 13'h0d58;
        case (key_hi)
          1'h1: out_r = 13'h0d5a;
          default: begin end
        endcase
      end
      12'h33a: begin
        out_r = 13'h0d52;
        case (key_hi)
          1'h1: out_r = 13'h0d53;
          default: begin end
        endcase
      end
      12'h33b: begin
        out_r = 13'h0d5b;
      end
      12'h33c: begin
        out_r = 13'h0d7c;
        case (key_hi)
          1'h1: out_r = 13'h0d7f;
          default: begin end
        endcase
      end
      12'h33d: begin
        out_r = 13'h0d79;
      end
      12'h33e: begin
        out_r = 13'h0d7c;
        case (key_hi)
          1'h1: out_r = 13'h0d7f;
          default: begin end
        endcase
      end
      12'h33f: begin
        out_r = 13'h0d79;
      end
      12'h340: begin
        out_r = 13'h0e40;
        case (key_hi)
          1'h1: out_r = 13'h0e42;
          default: begin end
        endcase
      end
      12'h341: begin
        out_r = 13'h0e44;
        case (key_hi)
          1'h1: out_r = 13'h0e45;
          default: begin end
        endcase
      end
      12'h342: begin
        out_r = 13'h0e48;
        case (key_hi)
          1'h1: out_r = 13'h0e4a;
          default: begin end
        endcase
      end
      12'h343: begin
        out_r = 13'h0e4d;
      end
      12'h344: begin
        out_r = 13'h0e6b;
        case (key_hi)
          1'h1: out_r = 13'h0e6a;
          default: begin end
        endcase
      end
      12'h345: begin
        out_r = 13'h0e65;
      end
      12'h346: begin
        out_r = 13'h0e6c;
      end
      12'h347: begin
        out_r = 13'h0e64;
      end
      12'h348: begin
        out_r = 13'h0e55;
      end
      12'h349: begin
        out_r = 13'h0e58;
        case (key_hi)
          1'h1: out_r = 13'h0e5a;
          default: begin end
        endcase
      end
      12'h34a: begin
        out_r = 13'h0e55;
        case (key_hi)
          1'h1: out_r = 13'h0e54;
          default: begin end
        endcase
      end
      12'h34b: begin
        out_r = 13'h0e50;
      end
      12'h34c: begin
        out_r = 13'h0e62;
        case (key_hi)
          1'h1: out_r = 13'h0e60;
          default: begin end
        endcase
      end
      12'h34d: begin
        out_r = 13'h0e65;
        case (key_hi)
          1'h1: out_r = 13'h0e64;
          default: begin end
        endcase
      end
      12'h34e: begin
        out_r = 13'h0e62;
        case (key_hi)
          1'h1: out_r = 13'h0e63;
          default: begin end
        endcase
      end
      12'h34f: begin
        out_r = 13'h0e65;
      end
      12'h350: begin
        out_r = 13'h0e80;
        case (key_hi)
          1'h1: out_r = 13'h0e82;
          default: begin end
        endcase
      end
      12'h351: begin
        out_r = 13'h0e84;
        case (key_hi)
          1'h1: out_r = 13'h0e85;
          default: begin end
        endcase
      end
      12'h352: begin
        out_r = 13'h0e88;
        case (key_hi)
          1'h1: out_r = 13'h0e8a;
          default: begin end
        endcase
      end
      12'h353: begin
        out_r = 13'h0e8d;
      end
      12'h354: begin
        out_r = 13'h0e95;
      end
      12'h355: begin
        out_r = 13'h0e9c;
        case (key_hi)
          1'h1: out_r = 13'h0e9d;
          default: begin end
        endcase
      end
      12'h356: begin
        out_r = 13'h0e90;
        case (key_hi)
          1'h1: out_r = 13'h0e92;
          default: begin end
        endcase
      end
      12'h357: begin
        out_r = 13'h0e9d;
      end
      12'h358: begin
        out_r = 13'h0eaa;
        case (key_hi)
          1'h1: out_r = 13'h0ea8;
          default: begin end
        endcase
      end
      12'h359: begin
        out_r = 13'h0eaf;
        case (key_hi)
          1'h1: out_r = 13'h0eac;
          default: begin end
        endcase
      end
      12'h35a: begin
        out_r = 13'h0ea2;
        case (key_hi)
          1'h1: out_r = 13'h0ea0;
          default: begin end
        endcase
      end
      12'h35b: begin
        out_r = 13'h0eac;
      end
      12'h35c: begin
        out_r = 13'h0e95;
      end
      12'h35d: begin
        out_r = 13'h0e90;
        case (key_hi)
          1'h1: out_r = 13'h0e93;
          default: begin end
        endcase
      end
      12'h35e: begin
        out_r = 13'h0e95;
      end
      12'h35f: begin
        out_r = 13'h0e9d;
      end
      12'h360: begin
        out_r = 13'h0e20;
        case (key_hi)
          1'h1: out_r = 13'h0e22;
          default: begin end
        endcase
      end
      12'h361: begin
        out_r = 13'h0e24;
        case (key_hi)
          1'h1: out_r = 13'h0e25;
          default: begin end
        endcase
      end
      12'h362: begin
        out_r = 13'h0e28;
        case (key_hi)
          1'h1: out_r = 13'h0e2a;
          default: begin end
        endcase
      end
      12'h363: begin
        out_r = 13'h0e2d;
      end
      12'h364: begin
        out_r = 13'h0e10;
        case (key_hi)
          1'h1: out_r = 13'h0e12;
          default: begin end
        endcase
      end
      12'h365: begin
        out_r = 13'h0e1f;
        case (key_hi)
          1'h1: out_r = 13'h0e1d;
          default: begin end
        endcase
      end
      12'h366: begin
        out_r = 13'h0e15;
        case (key_hi)
          1'h1: out_r = 13'h0e14;
          default: begin end
        endcase
      end
      12'h367: begin
        out_r = 13'h0e1c;
      end
      12'h368: begin
        out_r = 13'h0e3f;
        case (key_hi)
          1'h1: out_r = 13'h0e3c;
          default: begin end
        endcase
      end
      12'h369: begin
        out_r = 13'h0e38;
        case (key_hi)
          1'h1: out_r = 13'h0e39;
          default: begin end
        endcase
      end
      12'h36a: begin
        out_r = 13'h0e34;
        case (key_hi)
          1'h1: out_r = 13'h0e37;
          default: begin end
        endcase
      end
      12'h36b: begin
        out_r = 13'h0e3b;
      end
      12'h36c: begin
        out_r = 13'h0e0f;
        case (key_hi)
          1'h1: out_r = 13'h0e0d;
          default: begin end
        endcase
      end
      12'h36d: begin
        out_r = 13'h0e02;
        case (key_hi)
          1'h1: out_r = 13'h0e00;
          default: begin end
        endcase
      end
      12'h36e: begin
        out_r = 13'h0e0f;
        case (key_hi)
          1'h1: out_r = 13'h0e0c;
          default: begin end
        endcase
      end
      12'h36f: begin
        out_r = 13'h0e05;
      end
      12'h370: begin
        out_r = 13'h0ea0;
        case (key_hi)
          1'h1: out_r = 13'h0ea2;
          default: begin end
        endcase
      end
      12'h371: begin
        out_r = 13'h0ea5;
      end
      12'h372: begin
        out_r = 13'h0eaa;
      end
      12'h373: begin
        out_r = 13'h0ea5;
      end
      12'h374: begin
        out_r = 13'h0ebd;
        case (key_hi)
          1'h1: out_r = 13'h0ebf;
          default: begin end
        endcase
      end
      12'h375: begin
        out_r = 13'h0eb8;
        case (key_hi)
          1'h1: out_r = 13'h0eb9;
          default: begin end
        endcase
      end
      12'h376: begin
        out_r = 13'h0eb4;
        case (key_hi)
          1'h1: out_r = 13'h0eb7;
          default: begin end
        endcase
      end
      12'h377: begin
        out_r = 13'h0eb9;
      end
      12'h378: begin
        out_r = 13'h0ea0;
        case (key_hi)
          1'h1: out_r = 13'h0ea2;
          default: begin end
        endcase
      end
      12'h379: begin
        out_r = 13'h0ea5;
      end
      12'h37a: begin
        out_r = 13'h0eaa;
        case (key_hi)
          1'h1: out_r = 13'h0ea8;
          default: begin end
        endcase
      end
      12'h37b: begin
        out_r = 13'h0ea5;
      end
      12'h37c: begin
        out_r = 13'h0e88;
        case (key_hi)
          1'h1: out_r = 13'h0e8a;
          default: begin end
        endcase
      end
      12'h37d: begin
        out_r = 13'h0e8c;
        case (key_hi)
          1'h1: out_r = 13'h0e8f;
          default: begin end
        endcase
      end
      12'h37e: begin
        out_r = 13'h0e88;
        case (key_hi)
          1'h1: out_r = 13'h0e8a;
          default: begin end
        endcase
      end
      12'h37f: begin
        out_r = 13'h0e82;
      end
      12'h380: begin
        out_r = 13'h0d34;
        case (key_hi)
          1'h1: out_r = 13'h0d36;
          default: begin end
        endcase
      end
      12'h381: begin
        out_r = 13'h0d38;
        case (key_hi)
          1'h1: out_r = 13'h0d39;
          default: begin end
        endcase
      end
      12'h382: begin
        out_r = 13'h0d32;
        case (key_hi)
          1'h1: out_r = 13'h0d33;
          default: begin end
        endcase
      end
      12'h383: begin
        out_r = 13'h0d38;
      end
      12'h384: begin
        out_r = 13'h0d10;
        case (key_hi)
          1'h1: out_r = 13'h0d12;
          default: begin end
        endcase
      end
      12'h385: begin
        out_r = 13'h0d18;
        case (key_hi)
          1'h1: out_r = 13'h0d1b;
          default: begin end
        endcase
      end
      12'h386: begin
        out_r = 13'h0d15;
      end
      12'h387: begin
        out_r = 13'h0d1a;
      end
      12'h388: begin
        out_r = 13'h0d00;
        case (key_hi)
          1'h1: out_r = 13'h0d02;
          default: begin end
        endcase
      end
      12'h389: begin
        out_r = 13'h0d04;
        case (key_hi)
          1'h1: out_r = 13'h0d05;
          default: begin end
        endcase
      end
      12'h38a: begin
        out_r = 13'h0d0d;
        case (key_hi)
          1'h1: out_r = 13'h0d0f;
          default: begin end
        endcase
      end
      12'h38b: begin
        out_r = 13'h0d04;
      end
      12'h38c: begin
        out_r = 13'h0d10;
        case (key_hi)
          1'h1: out_r = 13'h0d12;
          default: begin end
        endcase
      end
      12'h38d: begin
        out_r = 13'h0d19;
        case (key_hi)
          1'h1: out_r = 13'h0d18;
          default: begin end
        endcase
      end
      12'h38e: begin
        out_r = 13'h0d10;
        case (key_hi)
          1'h1: out_r = 13'h0d13;
          default: begin end
        endcase
      end
      12'h38f: begin
        out_r = 13'h0d19;
      end
      12'h390: begin
        out_r = 13'h0d55;
      end
      12'h391: begin
        out_r = 13'h0d5b;
        case (key_hi)
          1'h1: out_r = 13'h0d58;
          default: begin end
        endcase
      end
      12'h392: begin
        out_r = 13'h0d55;
        case (key_hi)
          1'h1: out_r = 13'h0d54;
          default: begin end
        endcase
      end
      12'h393: begin
        out_r = 13'h0d53;
      end
      12'h394: begin
        out_r = 13'h0d6b;
        case (key_hi)
          1'h1: out_r = 13'h0d6a;
          default: begin end
        endcase
      end
      12'h395: begin
        out_r = 13'h0d65;
        case (key_hi)
          1'h1: out_r = 13'h0d64;
          default: begin end
        endcase
      end
      12'h396: begin
        out_r = 13'h0d6f;
        case (key_hi)
          1'h1: out_r = 13'h0d6d;
          default: begin end
        endcase
      end
      12'h397: begin
        out_r = 13'h0d65;
      end
      12'h398: begin
        out_r = 13'h0d4d;
        case (key_hi)
          1'h1: out_r = 13'h0d4c;
          default: begin end
        endcase
      end
      12'h399: begin
        out_r = 13'h0d44;
        case (key_hi)
          1'h1: out_r = 13'h0d45;
          default: begin end
        endcase
      end
      12'h39a: begin
        out_r = 13'h0d42;
        case (key_hi)
          1'h1: out_r = 13'h0d40;
          default: begin end
        endcase
      end
      12'h39b: begin
        out_r = 13'h0d45;
      end
      12'h39c: begin
        out_r = 13'h0d6f;
        case (key_hi)
          1'h1: out_r = 13'h0d6d;
          default: begin end
        endcase
      end
      12'h39d: begin
        out_r = 13'h0d64;
        case (key_hi)
          1'h1: out_r = 13'h0d65;
          default: begin end
        endcase
      end
      12'h39e: begin
        out_r = 13'h0d6f;
        case (key_hi)
          1'h1: out_r = 13'h0d6d;
          default: begin end
        endcase
      end
      12'h39f: begin
        out_r = 13'h0d65;
      end
      12'h3a0: begin
        out_r = 13'h0dfd;
        case (key_hi)
          1'h1: out_r = 13'h0dff;
          default: begin end
        endcase
      end
      12'h3a1: begin
        out_r = 13'h0df8;
        case (key_hi)
          1'h1: out_r = 13'h0df9;
          default: begin end
        endcase
      end
      12'h3a2: begin
        out_r = 13'h0df3;
        case (key_hi)
          1'h1: out_r = 13'h0df0;
          default: begin end
        endcase
      end
      12'h3a3: begin
        out_r = 13'h0df9;
      end
      12'h3a4: begin
        out_r = 13'h0de4;
        case (key_hi)
          1'h1: out_r = 13'h0de5;
          default: begin end
        endcase
      end
      12'h3a5: begin
        out_r = 13'h0de3;
        case (key_hi)
          1'h1: out_r = 13'h0de2;
          default: begin end
        endcase
      end
      12'h3a6: begin
        out_r = 13'h0de4;
      end
      12'h3a7: begin
        out_r = 13'h0de0;
      end
      12'h3a8: begin
        out_r = 13'h0dd3;
        case (key_hi)
          1'h1: out_r = 13'h0dd0;
          default: begin end
        endcase
      end
      12'h3a9: begin
        out_r = 13'h0dd4;
        case (key_hi)
          1'h1: out_r = 13'h0dd5;
          default: begin end
        endcase
      end
      12'h3aa: begin
        out_r = 13'h0ddc;
        case (key_hi)
          1'h1: out_r = 13'h0ddd;
          default: begin end
        endcase
      end
      12'h3ab: begin
        out_r = 13'h0dd4;
      end
      12'h3ac: begin
        out_r = 13'h0de3;
        case (key_hi)
          1'h1: out_r = 13'h0de2;
          default: begin end
        endcase
      end
      12'h3ad: begin
        out_r = 13'h0dea;
        case (key_hi)
          1'h1: out_r = 13'h0de8;
          default: begin end
        endcase
      end
      12'h3ae: begin
        out_r = 13'h0de3;
        case (key_hi)
          1'h1: out_r = 13'h0de0;
          default: begin end
        endcase
      end
      12'h3af: begin
        out_r = 13'h0dea;
      end
      12'h3b0: begin
        out_r = 13'h0d55;
        case (key_hi)
          1'h1: out_r = 13'h0d54;
          default: begin end
        endcase
      end
      12'h3b1: begin
        out_r = 13'h0d5a;
        case (key_hi)
          1'h1: out_r = 13'h0d5b;
          default: begin end
        endcase
      end
      12'h3b2: begin
        out_r = 13'h0d55;
        case (key_hi)
          1'h1: out_r = 13'h0d54;
          default: begin end
        endcase
      end
      12'h3b3: begin
        out_r = 13'h0d5b;
      end
      12'h3b4: begin
        out_r = 13'h0d48;
        case (key_hi)
          1'h1: out_r = 13'h0d4a;
          default: begin end
        endcase
      end
      12'h3b5: begin
        out_r = 13'h0d44;
        case (key_hi)
          1'h1: out_r = 13'h0d45;
          default: begin end
        endcase
      end
      12'h3b6: begin
        out_r = 13'h0d42;
        case (key_hi)
          1'h1: out_r = 13'h0d43;
          default: begin end
        endcase
      end
      12'h3b7: begin
        out_r = 13'h0d45;
      end
      12'h3b8: begin
        out_r = 13'h0d55;
        case (key_hi)
          1'h1: out_r = 13'h0d54;
          default: begin end
        endcase
      end
      12'h3b9: begin
        out_r = 13'h0d58;
        case (key_hi)
          1'h1: out_r = 13'h0d5a;
          default: begin end
        endcase
      end
      12'h3ba: begin
        out_r = 13'h0d52;
        case (key_hi)
          1'h1: out_r = 13'h0d53;
          default: begin end
        endcase
      end
      12'h3bb: begin
        out_r = 13'h0d5b;
      end
      12'h3bc: begin
        out_r = 13'h0d7c;
        case (key_hi)
          1'h1: out_r = 13'h0d7f;
          default: begin end
        endcase
      end
      12'h3bd: begin
        out_r = 13'h0d79;
      end
      12'h3be: begin
        out_r = 13'h0d7c;
        case (key_hi)
          1'h1: out_r = 13'h0d7f;
          default: begin end
        endcase
      end
      12'h3bf: begin
        out_r = 13'h0d79;
      end
      12'h3c0: begin
        out_r = 13'h0e40;
        case (key_hi)
          1'h1: out_r = 13'h0e42;
          default: begin end
        endcase
      end
      12'h3c1: begin
        out_r = 13'h0e44;
        case (key_hi)
          1'h1: out_r = 13'h0e45;
          default: begin end
        endcase
      end
      12'h3c2: begin
        out_r = 13'h0e48;
        case (key_hi)
          1'h1: out_r = 13'h0e4a;
          default: begin end
        endcase
      end
      12'h3c3: begin
        out_r = 13'h0e4d;
      end
      12'h3c4: begin
        out_r = 13'h0e77;
        case (key_hi)
          1'h1: out_r = 13'h0e76;
          default: begin end
        endcase
      end
      12'h3c5: begin
        out_r = 13'h0e78;
        case (key_hi)
          1'h1: out_r = 13'h0e79;
          default: begin end
        endcase
      end
      12'h3c6: begin
        out_r = 13'h0e7d;
      end
      12'h3c7: begin
        out_r = 13'h0e79;
      end
      12'h3c8: begin
        out_r = 13'h0e55;
      end
      12'h3c9: begin
        out_r = 13'h0e5c;
        case (key_hi)
          1'h1: out_r = 13'h0e5d;
          default: begin end
        endcase
      end
      12'h3ca: begin
        out_r = 13'h0e55;
        case (key_hi)
          1'h1: out_r = 13'h0e54;
          default: begin end
        endcase
      end
      12'h3cb: begin
        out_r = 13'h0e53;
      end
      12'h3cc: begin
        out_r = 13'h0e7c;
        case (key_hi)
          1'h1: out_r = 13'h0e7f;
          default: begin end
        endcase
      end
      12'h3cd: begin
        out_r = 13'h0e79;
        case (key_hi)
          1'h1: out_r = 13'h0e78;
          default: begin end
        endcase
      end
      12'h3ce: begin
        out_r = 13'h0e7c;
        case (key_hi)
          1'h1: out_r = 13'h0e7d;
          default: begin end
        endcase
      end
      12'h3cf: begin
        out_r = 13'h0e79;
      end
      12'h3d0: begin
        out_r = 13'h0ec3;
        case (key_hi)
          1'h1: out_r = 13'h0ec0;
          default: begin end
        endcase
      end
      12'h3d1: begin
        out_r = 13'h0ec4;
        case (key_hi)
          1'h1: out_r = 13'h0ec5;
          default: begin end
        endcase
      end
      12'h3d2: begin
        out_r = 13'h0ecb;
        case (key_hi)
          1'h1: out_r = 13'h0ec8;
          default: begin end
        endcase
      end
      12'h3d3: begin
        out_r = 13'h0ec4;
      end
      12'h3d4: begin
        out_r = 13'h0ee0;
        case (key_hi)
          1'h1: out_r = 13'h0ee2;
          default: begin end
        endcase
      end
      12'h3d5: begin
        out_r = 13'h0ee8;
        case (key_hi)
          1'h1: out_r = 13'h0eeb;
          default: begin end
        endcase
      end
      12'h3d6: begin
        out_r = 13'h0eec;
        case (key_hi)
          1'h1: out_r = 13'h0eed;
          default: begin end
        endcase
      end
      12'h3d7: begin
        out_r = 13'h0eea;
      end
      12'h3d8: begin
        out_r = 13'h0ef3;
        case (key_hi)
          1'h1: out_r = 13'h0ef0;
          default: begin end
        endcase
      end
      12'h3d9: begin
        out_r = 13'h0ef8;
        case (key_hi)
          1'h1: out_r = 13'h0ef9;
          default: begin end
        endcase
      end
      12'h3da: begin
        out_r = 13'h0ef4;
        case (key_hi)
          1'h1: out_r = 13'h0ef6;
          default: begin end
        endcase
      end
      12'h3db: begin
        out_r = 13'h0ef9;
      end
      12'h3dc: begin
        out_r = 13'h0ee4;
        case (key_hi)
          1'h1: out_r = 13'h0ee5;
          default: begin end
        endcase
      end
      12'h3dd: begin
        out_r = 13'h0eec;
        case (key_hi)
          1'h1: out_r = 13'h0eef;
          default: begin end
        endcase
      end
      12'h3de: begin
        out_r = 13'h0ee4;
        case (key_hi)
          1'h1: out_r = 13'h0ee5;
          default: begin end
        endcase
      end
      12'h3df: begin
        out_r = 13'h0ee2;
      end
      12'h3e0: begin
        out_r = 13'h0e40;
        case (key_hi)
          1'h1: out_r = 13'h0e42;
          default: begin end
        endcase
      end
      12'h3e1: begin
        out_r = 13'h0e44;
        case (key_hi)
          1'h1: out_r = 13'h0e45;
          default: begin end
        endcase
      end
      12'h3e2: begin
        out_r = 13'h0e48;
        case (key_hi)
          1'h1: out_r = 13'h0e4a;
          default: begin end
        endcase
      end
      12'h3e3: begin
        out_r = 13'h0e4d;
      end
      12'h3e4: begin
        out_r = 13'h0e77;
        case (key_hi)
          1'h1: out_r = 13'h0e76;
          default: begin end
        endcase
      end
      12'h3e5: begin
        out_r = 13'h0e79;
        case (key_hi)
          1'h1: out_r = 13'h0e78;
          default: begin end
        endcase
      end
      12'h3e6: begin
        out_r = 13'h0e7d;
        case (key_hi)
          1'h1: out_r = 13'h0e7f;
          default: begin end
        endcase
      end
      12'h3e7: begin
        out_r = 13'h0e79;
      end
      12'h3e8: begin
        out_r = 13'h0e55;
      end
      12'h3e9: begin
        out_r = 13'h0e5c;
        case (key_hi)
          1'h1: out_r = 13'h0e5d;
          default: begin end
        endcase
      end
      12'h3ea: begin
        out_r = 13'h0e50;
        case (key_hi)
          1'h1: out_r = 13'h0e52;
          default: begin end
        endcase
      end
      12'h3eb: begin
        out_r = 13'h0e5d;
      end
      12'h3ec: begin
        out_r = 13'h0e7c;
        case (key_hi)
          1'h1: out_r = 13'h0e7f;
          default: begin end
        endcase
      end
      12'h3ed: begin
        out_r = 13'h0e79;
        case (key_hi)
          1'h1: out_r = 13'h0e78;
          default: begin end
        endcase
      end
      12'h3ee: begin
        out_r = 13'h0e7c;
        case (key_hi)
          1'h1: out_r = 13'h0e7d;
          default: begin end
        endcase
      end
      12'h3ef: begin
        out_r = 13'h0e79;
      end
      12'h3f0: begin
        out_r = 13'h0e20;
        case (key_hi)
          1'h1: out_r = 13'h0e22;
          default: begin end
        endcase
      end
      12'h3f1: begin
        out_r = 13'h0e24;
        case (key_hi)
          1'h1: out_r = 13'h0e25;
          default: begin end
        endcase
      end
      12'h3f2: begin
        out_r = 13'h0e28;
        case (key_hi)
          1'h1: out_r = 13'h0e2a;
          default: begin end
        endcase
      end
      12'h3f3: begin
        out_r = 13'h0e2d;
      end
      12'h3f4: begin
        out_r = 13'h0e30;
        case (key_hi)
          1'h1: out_r = 13'h0e32;
          default: begin end
        endcase
      end
      12'h3f5: begin
        out_r = 13'h0e38;
        case (key_hi)
          1'h1: out_r = 13'h0e3b;
          default: begin end
        endcase
      end
      12'h3f6: begin
        out_r = 13'h0e3c;
        case (key_hi)
          1'h1: out_r = 13'h0e3d;
          default: begin end
        endcase
      end
      12'h3f7: begin
        out_r = 13'h0e39;
      end
      12'h3f8: begin
        out_r = 13'h0e20;
        case (key_hi)
          1'h1: out_r = 13'h0e22;
          default: begin end
        endcase
      end
      12'h3f9: begin
        out_r = 13'h0e24;
        case (key_hi)
          1'h1: out_r = 13'h0e25;
          default: begin end
        endcase
      end
      12'h3fa: begin
        out_r = 13'h0e28;
        case (key_hi)
          1'h1: out_r = 13'h0e2b;
          default: begin end
        endcase
      end
      12'h3fb: begin
        out_r = 13'h0e2d;
      end
      12'h3fc: begin
        out_r = 13'h0e08;
        case (key_hi)
          1'h1: out_r = 13'h0e0a;
          default: begin end
        endcase
      end
      12'h3fd: begin
        out_r = 13'h0e0c;
        case (key_hi)
          1'h1: out_r = 13'h0e0f;
          default: begin end
        endcase
      end
      12'h3fe: begin
        out_r = 13'h0e08;
        case (key_hi)
          1'h1: out_r = 13'h0e0a;
          default: begin end
        endcase
      end
      12'h3ff: begin
        out_r = 13'h0e02;
      end
      12'h400: begin
        out_r = 13'h0000;
        case (key_hi)
          1'h1: out_r = 13'h0002;
          default: begin end
        endcase
      end
      12'h401: begin
        out_r = 13'h0004;
        case (key_hi)
          1'h1: out_r = 13'h0005;
          default: begin end
        endcase
      end
      12'h402: begin
        out_r = 13'h0008;
        case (key_hi)
          1'h1: out_r = 13'h000a;
          default: begin end
        endcase
      end
      12'h403: begin
        out_r = 13'h000d;
      end
      12'h404: begin
        out_r = 13'h0010;
        case (key_hi)
          1'h1: out_r = 13'h0012;
          default: begin end
        endcase
      end
      12'h405: begin
        out_r = 13'h0018;
        case (key_hi)
          1'h1: out_r = 13'h001b;
          default: begin end
        endcase
      end
      12'h406: begin
        out_r = 13'h0015;
      end
      12'h407: begin
        out_r = 13'h001a;
      end
      12'h408: begin
        out_r = 13'h0020;
        case (key_hi)
          1'h1: out_r = 13'h0022;
          default: begin end
        endcase
      end
      12'h409: begin
        out_r = 13'h0024;
        case (key_hi)
          1'h1: out_r = 13'h0025;
          default: begin end
        endcase
      end
      12'h40a: begin
        out_r = 13'h0028;
        case (key_hi)
          1'h1: out_r = 13'h002a;
          default: begin end
        endcase
      end
      12'h40b: begin
        out_r = 13'h002d;
      end
      12'h40c: begin
        out_r = 13'h0034;
        case (key_hi)
          1'h1: out_r = 13'h0036;
          default: begin end
        endcase
      end
      12'h40d: begin
        out_r = 13'h0039;
        case (key_hi)
          1'h1: out_r = 13'h0038;
          default: begin end
        endcase
      end
      12'h40e: begin
        out_r = 13'h0034;
        case (key_hi)
          1'h1: out_r = 13'h0037;
          default: begin end
        endcase
      end
      12'h40f: begin
        out_r = 13'h0039;
      end
      12'h410: begin
        out_r = 13'h0040;
        case (key_hi)
          1'h1: out_r = 13'h0042;
          default: begin end
        endcase
      end
      12'h411: begin
        out_r = 13'h0044;
        case (key_hi)
          1'h1: out_r = 13'h0045;
          default: begin end
        endcase
      end
      12'h412: begin
        out_r = 13'h0048;
        case (key_hi)
          1'h1: out_r = 13'h004a;
          default: begin end
        endcase
      end
      12'h413: begin
        out_r = 13'h004d;
      end
      12'h414: begin
        out_r = 13'h0060;
        case (key_hi)
          1'h1: out_r = 13'h0062;
          default: begin end
        endcase
      end
      12'h415: begin
        out_r = 13'h0064;
        case (key_hi)
          1'h1: out_r = 13'h0065;
          default: begin end
        endcase
      end
      12'h416: begin
        out_r = 13'h006c;
        case (key_hi)
          1'h1: out_r = 13'h006d;
          default: begin end
        endcase
      end
      12'h417: begin
        out_r = 13'h0065;
      end
      12'h418: begin
        out_r = 13'h0055;
      end
      12'h419: begin
        out_r = 13'h005b;
        case (key_hi)
          1'h1: out_r = 13'h0058;
          default: begin end
        endcase
      end
      12'h41a: begin
        out_r = 13'h0055;
        case (key_hi)
          1'h1: out_r = 13'h0054;
          default: begin end
        endcase
      end
      12'h41b: begin
        out_r = 13'h0053;
      end
      12'h41c: begin
        out_r = 13'h0068;
        case (key_hi)
          1'h1: out_r = 13'h006a;
          default: begin end
        endcase
      end
      12'h41d: begin
        out_r = 13'h0065;
      end
      12'h41e: begin
        out_r = 13'h0068;
        case (key_hi)
          1'h1: out_r = 13'h006a;
          default: begin end
        endcase
      end
      12'h41f: begin
        out_r = 13'h0065;
      end
      12'h420: begin
        out_r = 13'h0080;
        case (key_hi)
          1'h1: out_r = 13'h0082;
          default: begin end
        endcase
      end
      12'h421: begin
        out_r = 13'h0084;
        case (key_hi)
          1'h1: out_r = 13'h0085;
          default: begin end
        endcase
      end
      12'h422: begin
        out_r = 13'h0088;
        case (key_hi)
          1'h1: out_r = 13'h008a;
          default: begin end
        endcase
      end
      12'h423: begin
        out_r = 13'h008d;
      end
      12'h424: begin
        out_r = 13'h0090;
        case (key_hi)
          1'h1: out_r = 13'h0092;
          default: begin end
        endcase
      end
      12'h425: begin
        out_r = 13'h0098;
        case (key_hi)
          1'h1: out_r = 13'h009b;
          default: begin end
        endcase
      end
      12'h426: begin
        out_r = 13'h0095;
      end
      12'h427: begin
        out_r = 13'h009a;
      end
      12'h428: begin
        out_r = 13'h00a0;
        case (key_hi)
          1'h1: out_r = 13'h00a2;
          default: begin end
        endcase
      end
      12'h429: begin
        out_r = 13'h00a4;
        case (key_hi)
          1'h1: out_r = 13'h00a5;
          default: begin end
        endcase
      end
      12'h42a: begin
        out_r = 13'h00a8;
        case (key_hi)
          1'h1: out_r = 13'h00aa;
          default: begin end
        endcase
      end
      12'h42b: begin
        out_r = 13'h00ad;
      end
      12'h42c: begin
        out_r = 13'h00b4;
        case (key_hi)
          1'h1: out_r = 13'h00b6;
          default: begin end
        endcase
      end
      12'h42d: begin
        out_r = 13'h00b9;
        case (key_hi)
          1'h1: out_r = 13'h00b8;
          default: begin end
        endcase
      end
      12'h42e: begin
        out_r = 13'h00b4;
        case (key_hi)
          1'h1: out_r = 13'h00b7;
          default: begin end
        endcase
      end
      12'h42f: begin
        out_r = 13'h00b9;
      end
      12'h430: begin
        out_r = 13'h00d3;
        case (key_hi)
          1'h1: out_r = 13'h00d0;
          default: begin end
        endcase
      end
      12'h431: begin
        out_r = 13'h00d4;
        case (key_hi)
          1'h1: out_r = 13'h00d5;
          default: begin end
        endcase
      end
      12'h432: begin
        out_r = 13'h00db;
        case (key_hi)
          1'h1: out_r = 13'h00d8;
          default: begin end
        endcase
      end
      12'h433: begin
        out_r = 13'h00d5;
      end
      12'h434: begin
        out_r = 13'h00e4;
        case (key_hi)
          1'h1: out_r = 13'h00e5;
          default: begin end
        endcase
      end
      12'h435: begin
        out_r = 13'h00e8;
        case (key_hi)
          1'h1: out_r = 13'h00ea;
          default: begin end
        endcase
      end
      12'h436: begin
        out_r = 13'h00e2;
        case (key_hi)
          1'h1: out_r = 13'h00e3;
          default: begin end
        endcase
      end
      12'h437: begin
        out_r = 13'h00ea;
      end
      12'h438: begin
        out_r = 13'h00d3;
        case (key_hi)
          1'h1: out_r = 13'h00d0;
          default: begin end
        endcase
      end
      12'h439: begin
        out_r = 13'h00d5;
        case (key_hi)
          1'h1: out_r = 13'h00d4;
          default: begin end
        endcase
      end
      12'h43a: begin
        out_r = 13'h00df;
        case (key_hi)
          1'h1: out_r = 13'h00dd;
          default: begin end
        endcase
      end
      12'h43b: begin
        out_r = 13'h00d5;
      end
      12'h43c: begin
        out_r = 13'h00e4;
        case (key_hi)
          1'h1: out_r = 13'h00e5;
          default: begin end
        endcase
      end
      12'h43d: begin
        out_r = 13'h00ec;
        case (key_hi)
          1'h1: out_r = 13'h00ef;
          default: begin end
        endcase
      end
      12'h43e: begin
        out_r = 13'h00e4;
        case (key_hi)
          1'h1: out_r = 13'h00e5;
          default: begin end
        endcase
      end
      12'h43f: begin
        out_r = 13'h00e2;
      end
      12'h440: begin
        out_r = 13'h0100;
        case (key_hi)
          1'h1: out_r = 13'h0102;
          default: begin end
        endcase
      end
      12'h441: begin
        out_r = 13'h0104;
        case (key_hi)
          1'h1: out_r = 13'h0105;
          default: begin end
        endcase
      end
      12'h442: begin
        out_r = 13'h0108;
        case (key_hi)
          1'h1: out_r = 13'h010a;
          default: begin end
        endcase
      end
      12'h443: begin
        out_r = 13'h010d;
      end
      12'h444: begin
        out_r = 13'h0110;
        case (key_hi)
          1'h1: out_r = 13'h0112;
          default: begin end
        endcase
      end
      12'h445: begin
        out_r = 13'h0118;
        case (key_hi)
          1'h1: out_r = 13'h011b;
          default: begin end
        endcase
      end
      12'h446: begin
        out_r = 13'h0115;
      end
      12'h447: begin
        out_r = 13'h011a;
      end
      12'h448: begin
        out_r = 13'h0120;
        case (key_hi)
          1'h1: out_r = 13'h0122;
          default: begin end
        endcase
      end
      12'h449: begin
        out_r = 13'h0124;
        case (key_hi)
          1'h1: out_r = 13'h0125;
          default: begin end
        endcase
      end
      12'h44a: begin
        out_r = 13'h0128;
        case (key_hi)
          1'h1: out_r = 13'h012a;
          default: begin end
        endcase
      end
      12'h44b: begin
        out_r = 13'h012d;
      end
      12'h44c: begin
        out_r = 13'h0134;
        case (key_hi)
          1'h1: out_r = 13'h0136;
          default: begin end
        endcase
      end
      12'h44d: begin
        out_r = 13'h0139;
        case (key_hi)
          1'h1: out_r = 13'h0138;
          default: begin end
        endcase
      end
      12'h44e: begin
        out_r = 13'h0134;
        case (key_hi)
          1'h1: out_r = 13'h0137;
          default: begin end
        endcase
      end
      12'h44f: begin
        out_r = 13'h0139;
      end
      12'h450: begin
        out_r = 13'h0180;
        case (key_hi)
          1'h1: out_r = 13'h0182;
          default: begin end
        endcase
      end
      12'h451: begin
        out_r = 13'h0184;
        case (key_hi)
          1'h1: out_r = 13'h0185;
          default: begin end
        endcase
      end
      12'h452: begin
        out_r = 13'h018b;
        case (key_hi)
          1'h1: out_r = 13'h0188;
          default: begin end
        endcase
      end
      12'h453: begin
        out_r = 13'h0185;
      end
      12'h454: begin
        out_r = 13'h0190;
        case (key_hi)
          1'h1: out_r = 13'h0192;
          default: begin end
        endcase
      end
      12'h455: begin
        out_r = 13'h019f;
        case (key_hi)
          1'h1: out_r = 13'h019c;
          default: begin end
        endcase
      end
      12'h456: begin
        out_r = 13'h0194;
        case (key_hi)
          1'h1: out_r = 13'h0195;
          default: begin end
        endcase
      end
      12'h457: begin
        out_r = 13'h019d;
      end
      12'h458: begin
        out_r = 13'h01b0;
        case (key_hi)
          1'h1: out_r = 13'h01b2;
          default: begin end
        endcase
      end
      12'h459: begin
        out_r = 13'h01b8;
        case (key_hi)
          1'h1: out_r = 13'h01b9;
          default: begin end
        endcase
      end
      12'h45a: begin
        out_r = 13'h01b4;
        case (key_hi)
          1'h1: out_r = 13'h01b6;
          default: begin end
        endcase
      end
      12'h45b: begin
        out_r = 13'h01b9;
      end
      12'h45c: begin
        out_r = 13'h0194;
        case (key_hi)
          1'h1: out_r = 13'h0195;
          default: begin end
        endcase
      end
      12'h45d: begin
        out_r = 13'h019a;
        case (key_hi)
          1'h1: out_r = 13'h0198;
          default: begin end
        endcase
      end
      12'h45e: begin
        out_r = 13'h0194;
        case (key_hi)
          1'h1: out_r = 13'h0195;
          default: begin end
        endcase
      end
      12'h45f: begin
        out_r = 13'h0192;
      end
      12'h460: begin
        out_r = 13'h0155;
      end
      12'h461: begin
        out_r = 13'h015a;
        case (key_hi)
          1'h1: out_r = 13'h015b;
          default: begin end
        endcase
      end
      12'h462: begin
        out_r = 13'h0155;
        case (key_hi)
          1'h1: out_r = 13'h0154;
          default: begin end
        endcase
      end
      12'h463: begin
        out_r = 13'h0152;
      end
      12'h464: begin
        out_r = 13'h016d;
        case (key_hi)
          1'h1: out_r = 13'h016f;
          default: begin end
        endcase
      end
      12'h465: begin
        out_r = 13'h0165;
      end
      12'h466: begin
        out_r = 13'h0163;
        case (key_hi)
          1'h1: out_r = 13'h0160;
          default: begin end
        endcase
      end
      12'h467: begin
        out_r = 13'h0164;
      end
      12'h468: begin
        out_r = 13'h0155;
      end
      12'h469: begin
        out_r = 13'h015d;
        case (key_hi)
          1'h1: out_r = 13'h015f;
          default: begin end
        endcase
      end
      12'h46a: begin
        out_r = 13'h0152;
        case (key_hi)
          1'h1: out_r = 13'h0153;
          default: begin end
        endcase
      end
      12'h46b: begin
        out_r = 13'h015f;
      end
      12'h46c: begin
        out_r = 13'h014f;
        case (key_hi)
          1'h1: out_r = 13'h014d;
          default: begin end
        endcase
      end
      12'h46d: begin
        out_r = 13'h0142;
        case (key_hi)
          1'h1: out_r = 13'h0140;
          default: begin end
        endcase
      end
      12'h46e: begin
        out_r = 13'h014f;
        case (key_hi)
          1'h1: out_r = 13'h014c;
          default: begin end
        endcase
      end
      12'h46f: begin
        out_r = 13'h0145;
      end
      12'h470: begin
        out_r = 13'h01a0;
        case (key_hi)
          1'h1: out_r = 13'h01a2;
          default: begin end
        endcase
      end
      12'h471: begin
        out_r = 13'h01a4;
        case (key_hi)
          1'h1: out_r = 13'h01a5;
          default: begin end
        endcase
      end
      12'h472: begin
        out_r = 13'h01ab;
        case (key_hi)
          1'h1: out_r = 13'h01a8;
          default: begin end
        endcase
      end
      12'h473: begin
        out_r = 13'h01a4;
      end
      12'h474: begin
        out_r = 13'h0194;
        case (key_hi)
          1'h1: out_r = 13'h0195;
          default: begin end
        endcase
      end
      12'h475: begin
        out_r = 13'h019c;
        case (key_hi)
          1'h1: out_r = 13'h019d;
          default: begin end
        endcase
      end
      12'h476: begin
        out_r = 13'h0194;
        case (key_hi)
          1'h1: out_r = 13'h0195;
          default: begin end
        endcase
      end
      12'h477: begin
        out_r = 13'h019d;
      end
      12'h478: begin
        out_r = 13'h01a0;
        case (key_hi)
          1'h1: out_r = 13'h01a2;
          default: begin end
        endcase
      end
      12'h479: begin
        out_r = 13'h01a4;
        case (key_hi)
          1'h1: out_r = 13'h01a5;
          default: begin end
        endcase
      end
      12'h47a: begin
        out_r = 13'h01ab;
        case (key_hi)
          1'h1: out_r = 13'h01aa;
          default: begin end
        endcase
      end
      12'h47b: begin
        out_r = 13'h01a4;
      end
      12'h47c: begin
        out_r = 13'h0195;
        case (key_hi)
          1'h1: out_r = 13'h0194;
          default: begin end
        endcase
      end
      12'h47d: begin
        out_r = 13'h019a;
        case (key_hi)
          1'h1: out_r = 13'h0198;
          default: begin end
        endcase
      end
      12'h47e: begin
        out_r = 13'h0195;
        case (key_hi)
          1'h1: out_r = 13'h0194;
          default: begin end
        endcase
      end
      12'h47f: begin
        out_r = 13'h0192;
      end
      12'h480: begin
        out_r = 13'h0200;
        case (key_hi)
          1'h1: out_r = 13'h0202;
          default: begin end
        endcase
      end
      12'h481: begin
        out_r = 13'h0204;
        case (key_hi)
          1'h1: out_r = 13'h0205;
          default: begin end
        endcase
      end
      12'h482: begin
        out_r = 13'h0208;
        case (key_hi)
          1'h1: out_r = 13'h020a;
          default: begin end
        endcase
      end
      12'h483: begin
        out_r = 13'h020d;
      end
      12'h484: begin
        out_r = 13'h0210;
        case (key_hi)
          1'h1: out_r = 13'h0212;
          default: begin end
        endcase
      end
      12'h485: begin
        out_r = 13'h0218;
        case (key_hi)
          1'h1: out_r = 13'h021b;
          default: begin end
        endcase
      end
      12'h486: begin
        out_r = 13'h0215;
      end
      12'h487: begin
        out_r = 13'h021a;
      end
      12'h488: begin
        out_r = 13'h0220;
        case (key_hi)
          1'h1: out_r = 13'h0222;
          default: begin end
        endcase
      end
      12'h489: begin
        out_r = 13'h0224;
        case (key_hi)
          1'h1: out_r = 13'h0225;
          default: begin end
        endcase
      end
      12'h48a: begin
        out_r = 13'h0228;
        case (key_hi)
          1'h1: out_r = 13'h022a;
          default: begin end
        endcase
      end
      12'h48b: begin
        out_r = 13'h022d;
      end
      12'h48c: begin
        out_r = 13'h0234;
        case (key_hi)
          1'h1: out_r = 13'h0236;
          default: begin end
        endcase
      end
      12'h48d: begin
        out_r = 13'h0239;
        case (key_hi)
          1'h1: out_r = 13'h0238;
          default: begin end
        endcase
      end
      12'h48e: begin
        out_r = 13'h0234;
        case (key_hi)
          1'h1: out_r = 13'h0237;
          default: begin end
        endcase
      end
      12'h48f: begin
        out_r = 13'h0239;
      end
      12'h490: begin
        out_r = 13'h0240;
        case (key_hi)
          1'h1: out_r = 13'h0242;
          default: begin end
        endcase
      end
      12'h491: begin
        out_r = 13'h0244;
        case (key_hi)
          1'h1: out_r = 13'h0245;
          default: begin end
        endcase
      end
      12'h492: begin
        out_r = 13'h0248;
        case (key_hi)
          1'h1: out_r = 13'h024a;
          default: begin end
        endcase
      end
      12'h493: begin
        out_r = 13'h024d;
      end
      12'h494: begin
        out_r = 13'h0260;
        case (key_hi)
          1'h1: out_r = 13'h0262;
          default: begin end
        endcase
      end
      12'h495: begin
        out_r = 13'h0264;
        case (key_hi)
          1'h1: out_r = 13'h0265;
          default: begin end
        endcase
      end
      12'h496: begin
        out_r = 13'h026c;
        case (key_hi)
          1'h1: out_r = 13'h026d;
          default: begin end
        endcase
      end
      12'h497: begin
        out_r = 13'h0265;
      end
      12'h498: begin
        out_r = 13'h0255;
      end
      12'h499: begin
        out_r = 13'h025b;
        case (key_hi)
          1'h1: out_r = 13'h0258;
          default: begin end
        endcase
      end
      12'h49a: begin
        out_r = 13'h0255;
        case (key_hi)
          1'h1: out_r = 13'h0254;
          default: begin end
        endcase
      end
      12'h49b: begin
        out_r = 13'h0253;
      end
      12'h49c: begin
        out_r = 13'h0268;
        case (key_hi)
          1'h1: out_r = 13'h026a;
          default: begin end
        endcase
      end
      12'h49d: begin
        out_r = 13'h0265;
      end
      12'h49e: begin
        out_r = 13'h0268;
        case (key_hi)
          1'h1: out_r = 13'h026a;
          default: begin end
        endcase
      end
      12'h49f: begin
        out_r = 13'h0265;
      end
      12'h4a0: begin
        out_r = 13'h0280;
        case (key_hi)
          1'h1: out_r = 13'h0282;
          default: begin end
        endcase
      end
      12'h4a1: begin
        out_r = 13'h0284;
        case (key_hi)
          1'h1: out_r = 13'h0285;
          default: begin end
        endcase
      end
      12'h4a2: begin
        out_r = 13'h0288;
        case (key_hi)
          1'h1: out_r = 13'h028a;
          default: begin end
        endcase
      end
      12'h4a3: begin
        out_r = 13'h028d;
      end
      12'h4a4: begin
        out_r = 13'h0290;
        case (key_hi)
          1'h1: out_r = 13'h0292;
          default: begin end
        endcase
      end
      12'h4a5: begin
        out_r = 13'h0298;
        case (key_hi)
          1'h1: out_r = 13'h029b;
          default: begin end
        endcase
      end
      12'h4a6: begin
        out_r = 13'h0295;
      end
      12'h4a7: begin
        out_r = 13'h029a;
      end
      12'h4a8: begin
        out_r = 13'h02a0;
        case (key_hi)
          1'h1: out_r = 13'h02a2;
          default: begin end
        endcase
      end
      12'h4a9: begin
        out_r = 13'h02a4;
        case (key_hi)
          1'h1: out_r = 13'h02a5;
          default: begin end
        endcase
      end
      12'h4aa: begin
        out_r = 13'h02a8;
        case (key_hi)
          1'h1: out_r = 13'h02aa;
          default: begin end
        endcase
      end
      12'h4ab: begin
        out_r = 13'h02ad;
      end
      12'h4ac: begin
        out_r = 13'h02b4;
        case (key_hi)
          1'h1: out_r = 13'h02b6;
          default: begin end
        endcase
      end
      12'h4ad: begin
        out_r = 13'h02b9;
        case (key_hi)
          1'h1: out_r = 13'h02b8;
          default: begin end
        endcase
      end
      12'h4ae: begin
        out_r = 13'h02b4;
        case (key_hi)
          1'h1: out_r = 13'h02b7;
          default: begin end
        endcase
      end
      12'h4af: begin
        out_r = 13'h02b9;
      end
      12'h4b0: begin
        out_r = 13'h02d3;
        case (key_hi)
          1'h1: out_r = 13'h02d0;
          default: begin end
        endcase
      end
      12'h4b1: begin
        out_r = 13'h02d4;
        case (key_hi)
          1'h1: out_r = 13'h02d5;
          default: begin end
        endcase
      end
      12'h4b2: begin
        out_r = 13'h02db;
        case (key_hi)
          1'h1: out_r = 13'h02d8;
          default: begin end
        endcase
      end
      12'h4b3: begin
        out_r = 13'h02d5;
      end
      12'h4b4: begin
        out_r = 13'h02e4;
        case (key_hi)
          1'h1: out_r = 13'h02e5;
          default: begin end
        endcase
      end
      12'h4b5: begin
        out_r = 13'h02e8;
        case (key_hi)
          1'h1: out_r = 13'h02ea;
          default: begin end
        endcase
      end
      12'h4b6: begin
        out_r = 13'h02e2;
        case (key_hi)
          1'h1: out_r = 13'h02e3;
          default: begin end
        endcase
      end
      12'h4b7: begin
        out_r = 13'h02ea;
      end
      12'h4b8: begin
        out_r = 13'h02d3;
        case (key_hi)
          1'h1: out_r = 13'h02d0;
          default: begin end
        endcase
      end
      12'h4b9: begin
        out_r = 13'h02d5;
        case (key_hi)
          1'h1: out_r = 13'h02d4;
          default: begin end
        endcase
      end
      12'h4ba: begin
        out_r = 13'h02df;
        case (key_hi)
          1'h1: out_r = 13'h02dd;
          default: begin end
        endcase
      end
      12'h4bb: begin
        out_r = 13'h02d5;
      end
      12'h4bc: begin
        out_r = 13'h02e4;
        case (key_hi)
          1'h1: out_r = 13'h02e5;
          default: begin end
        endcase
      end
      12'h4bd: begin
        out_r = 13'h02ec;
        case (key_hi)
          1'h1: out_r = 13'h02ef;
          default: begin end
        endcase
      end
      12'h4be: begin
        out_r = 13'h02e4;
        case (key_hi)
          1'h1: out_r = 13'h02e5;
          default: begin end
        endcase
      end
      12'h4bf: begin
        out_r = 13'h02e2;
      end
      12'h4c0: begin
        out_r = 13'h034d;
        case (key_hi)
          1'h1: out_r = 13'h034c;
          default: begin end
        endcase
      end
      12'h4c1: begin
        out_r = 13'h0344;
        case (key_hi)
          1'h1: out_r = 13'h0345;
          default: begin end
        endcase
      end
      12'h4c2: begin
        out_r = 13'h0340;
        case (key_hi)
          1'h1: out_r = 13'h0343;
          default: begin end
        endcase
      end
      12'h4c3: begin
        out_r = 13'h0344;
      end
      12'h4c4: begin
        out_r = 13'h0350;
        case (key_hi)
          1'h1: out_r = 13'h0352;
          default: begin end
        endcase
      end
      12'h4c5: begin
        out_r = 13'h035b;
        case (key_hi)
          1'h1: out_r = 13'h035a;
          default: begin end
        endcase
      end
      12'h4c6: begin
        out_r = 13'h0355;
      end
      12'h4c7: begin
        out_r = 13'h0358;
      end
      12'h4c8: begin
        out_r = 13'h036d;
        case (key_hi)
          1'h1: out_r = 13'h036c;
          default: begin end
        endcase
      end
      12'h4c9: begin
        out_r = 13'h0364;
        case (key_hi)
          1'h1: out_r = 13'h0365;
          default: begin end
        endcase
      end
      12'h4ca: begin
        out_r = 13'h0360;
        case (key_hi)
          1'h1: out_r = 13'h0363;
          default: begin end
        endcase
      end
      12'h4cb: begin
        out_r = 13'h0364;
      end
      12'h4cc: begin
        out_r = 13'h0355;
      end
      12'h4cd: begin
        out_r = 13'h0352;
        case (key_hi)
          1'h1: out_r = 13'h0350;
          default: begin end
        endcase
      end
      12'h4ce: begin
        out_r = 13'h0355;
        case (key_hi)
          1'h1: out_r = 13'h0354;
          default: begin end
        endcase
      end
      12'h4cf: begin
        out_r = 13'h035f;
      end
      12'h4d0: begin
        out_r = 13'h0390;
        case (key_hi)
          1'h1: out_r = 13'h0392;
          default: begin end
        endcase
      end
      12'h4d1: begin
        out_r = 13'h039a;
        case (key_hi)
          1'h1: out_r = 13'h039b;
          default: begin end
        endcase
      end
      12'h4d2: begin
        out_r = 13'h0395;
      end
      12'h4d3: begin
        out_r = 13'h0398;
      end
      12'h4d4: begin
        out_r = 13'h03a0;
        case (key_hi)
          1'h1: out_r = 13'h03a2;
          default: begin end
        endcase
      end
      12'h4d5: begin
        out_r = 13'h03a5;
        case (key_hi)
          1'h1: out_r = 13'h03a4;
          default: begin end
        endcase
      end
      12'h4d6: begin
        out_r = 13'h03aa;
        case (key_hi)
          1'h1: out_r = 13'h03a8;
          default: begin end
        endcase
      end
      12'h4d7: begin
        out_r = 13'h03a5;
      end
      12'h4d8: begin
        out_r = 13'h0388;
        case (key_hi)
          1'h1: out_r = 13'h038a;
          default: begin end
        endcase
      end
      12'h4d9: begin
        out_r = 13'h0384;
        case (key_hi)
          1'h1: out_r = 13'h0385;
          default: begin end
        endcase
      end
      12'h4da: begin
        out_r = 13'h038f;
        case (key_hi)
          1'h1: out_r = 13'h038d;
          default: begin end
        endcase
      end
      12'h4db: begin
        out_r = 13'h0383;
      end
      12'h4dc: begin
        out_r = 13'h03a8;
        case (key_hi)
          1'h1: out_r = 13'h03aa;
          default: begin end
        endcase
      end
      12'h4dd: begin
        out_r = 13'h03af;
        case (key_hi)
          1'h1: out_r = 13'h03ad;
          default: begin end
        endcase
      end
      12'h4de: begin
        out_r = 13'h03a8;
        case (key_hi)
          1'h1: out_r = 13'h03aa;
          default: begin end
        endcase
      end
      12'h4df: begin
        out_r = 13'h03a2;
      end
      12'h4e0: begin
        out_r = 13'h034d;
        case (key_hi)
          1'h1: out_r = 13'h034c;
          default: begin end
        endcase
      end
      12'h4e1: begin
        out_r = 13'h0344;
        case (key_hi)
          1'h1: out_r = 13'h0345;
          default: begin end
        endcase
      end
      12'h4e2: begin
        out_r = 13'h0340;
        case (key_hi)
          1'h1: out_r = 13'h0343;
          default: begin end
        endcase
      end
      12'h4e3: begin
        out_r = 13'h0344;
      end
      12'h4e4: begin
        out_r = 13'h0355;
      end
      12'h4e5: begin
        out_r = 13'h035a;
        case (key_hi)
          1'h1: out_r = 13'h035b;
          default: begin end
        endcase
      end
      12'h4e6: begin
        out_r = 13'h0353;
        case (key_hi)
          1'h1: out_r = 13'h0350;
          default: begin end
        endcase
      end
      12'h4e7: begin
        out_r = 13'h035b;
      end
      12'h4e8: begin
        out_r = 13'h037f;
        case (key_hi)
          1'h1: out_r = 13'h037c;
          default: begin end
        endcase
      end
      12'h4e9: begin
        out_r = 13'h0379;
      end
      12'h4ea: begin
        out_r = 13'h0374;
        case (key_hi)
          1'h1: out_r = 13'h0377;
          default: begin end
        endcase
      end
      12'h4eb: begin
        out_r = 13'h0378;
      end
      12'h4ec: begin
        out_r = 13'h0355;
      end
      12'h4ed: begin
        out_r = 13'h0352;
        case (key_hi)
          1'h1: out_r = 13'h0350;
          default: begin end
        endcase
      end
      12'h4ee: begin
        out_r = 13'h0355;
        case (key_hi)
          1'h1: out_r = 13'h0354;
          default: begin end
        endcase
      end
      12'h4ef: begin
        out_r = 13'h035f;
      end
      12'h4f0: begin
        out_r = 13'h0390;
        case (key_hi)
          1'h1: out_r = 13'h0392;
          default: begin end
        endcase
      end
      12'h4f1: begin
        out_r = 13'h039d;
        case (key_hi)
          1'h1: out_r = 13'h039f;
          default: begin end
        endcase
      end
      12'h4f2: begin
        out_r = 13'h0395;
      end
      12'h4f3: begin
        out_r = 13'h039f;
      end
      12'h4f4: begin
        out_r = 13'h03b0;
        case (key_hi)
          1'h1: out_r = 13'h03b2;
          default: begin end
        endcase
      end
      12'h4f5: begin
        out_r = 13'h03b8;
        case (key_hi)
          1'h1: out_r = 13'h03bb;
          default: begin end
        endcase
      end
      12'h4f6: begin
        out_r = 13'h03bc;
        case (key_hi)
          1'h1: out_r = 13'h03bd;
          default: begin end
        endcase
      end
      12'h4f7: begin
        out_r = 13'h03b9;
      end
      12'h4f8: begin
        out_r = 13'h0390;
        case (key_hi)
          1'h1: out_r = 13'h0392;
          default: begin end
        endcase
      end
      12'h4f9: begin
        out_r = 13'h039d;
        case (key_hi)
          1'h1: out_r = 13'h039f;
          default: begin end
        endcase
      end
      12'h4fa: begin
        out_r = 13'h0395;
        case (key_hi)
          1'h1: out_r = 13'h0394;
          default: begin end
        endcase
      end
      12'h4fb: begin
        out_r = 13'h039f;
      end
      12'h4fc: begin
        out_r = 13'h0388;
        case (key_hi)
          1'h1: out_r = 13'h038a;
          default: begin end
        endcase
      end
      12'h4fd: begin
        out_r = 13'h038c;
        case (key_hi)
          1'h1: out_r = 13'h038f;
          default: begin end
        endcase
      end
      12'h4fe: begin
        out_r = 13'h0388;
        case (key_hi)
          1'h1: out_r = 13'h038a;
          default: begin end
        endcase
      end
      12'h4ff: begin
        out_r = 13'h0382;
      end
      12'h500: begin
        out_r = 13'h0400;
        case (key_hi)
          1'h1: out_r = 13'h0402;
          default: begin end
        endcase
      end
      12'h501: begin
        out_r = 13'h0404;
        case (key_hi)
          1'h1: out_r = 13'h0405;
          default: begin end
        endcase
      end
      12'h502: begin
        out_r = 13'h0408;
        case (key_hi)
          1'h1: out_r = 13'h040a;
          default: begin end
        endcase
      end
      12'h503: begin
        out_r = 13'h040d;
      end
      12'h504: begin
        out_r = 13'h0410;
        case (key_hi)
          1'h1: out_r = 13'h0412;
          default: begin end
        endcase
      end
      12'h505: begin
        out_r = 13'h0818;
        case (key_hi)
          1'h1: out_r = 13'h041b;
          default: begin end
        endcase
      end
      12'h506: begin
        out_r = 13'h0415;
      end
      12'h507: begin
        out_r = 13'h041a;
      end
      12'h508: begin
        out_r = 13'h0420;
        case (key_hi)
          1'h1: out_r = 13'h0422;
          default: begin end
        endcase
      end
      12'h509: begin
        out_r = 13'h0424;
        case (key_hi)
          1'h1: out_r = 13'h0425;
          default: begin end
        endcase
      end
      12'h50a: begin
        out_r = 13'h0428;
        case (key_hi)
          1'h1: out_r = 13'h042a;
          default: begin end
        endcase
      end
      12'h50b: begin
        out_r = 13'h042d;
      end
      12'h50c: begin
        out_r = 13'h0434;
        case (key_hi)
          1'h1: out_r = 13'h0436;
          default: begin end
        endcase
      end
      12'h50d: begin
        out_r = 13'h0439;
        case (key_hi)
          1'h1: out_r = 13'h0438;
          default: begin end
        endcase
      end
      12'h50e: begin
        out_r = 13'h0434;
        case (key_hi)
          1'h1: out_r = 13'h0837;
          default: begin end
        endcase
      end
      12'h50f: begin
        out_r = 13'h0439;
      end
      12'h510: begin
        out_r = 13'h0440;
        case (key_hi)
          1'h1: out_r = 13'h0442;
          default: begin end
        endcase
      end
      12'h511: begin
        out_r = 13'h0444;
        case (key_hi)
          1'h1: out_r = 13'h0445;
          default: begin end
        endcase
      end
      12'h512: begin
        out_r = 13'h0448;
        case (key_hi)
          1'h1: out_r = 13'h044a;
          default: begin end
        endcase
      end
      12'h513: begin
        out_r = 13'h044d;
      end
      12'h514: begin
        out_r = 13'h0860;
        case (key_hi)
          1'h1: out_r = 13'h0462;
          default: begin end
        endcase
      end
      12'h515: begin
        out_r = 13'h0464;
        case (key_hi)
          1'h1: out_r = 13'h0465;
          default: begin end
        endcase
      end
      12'h516: begin
        out_r = 13'h046c;
        case (key_hi)
          1'h1: out_r = 13'h086d;
          default: begin end
        endcase
      end
      12'h517: begin
        out_r = 13'h0465;
      end
      12'h518: begin
        out_r = 13'h0455;
      end
      12'h519: begin
        out_r = 13'h045b;
        case (key_hi)
          1'h1: out_r = 13'h0858;
          default: begin end
        endcase
      end
      12'h51a: begin
        out_r = 13'h0455;
        case (key_hi)
          1'h1: out_r = 13'h0454;
          default: begin end
        endcase
      end
      12'h51b: begin
        out_r = 13'h0853;
      end
      12'h51c: begin
        out_r = 13'h0468;
        case (key_hi)
          1'h1: out_r = 13'h046a;
          default: begin end
        endcase
      end
      12'h51d: begin
        out_r = 13'h0465;
      end
      12'h51e: begin
        out_r = 13'h0468;
        case (key_hi)
          1'h1: out_r = 13'h046a;
          default: begin end
        endcase
      end
      12'h51f: begin
        out_r = 13'h0465;
      end
      12'h520: begin
        out_r = 13'h0480;
        case (key_hi)
          1'h1: out_r = 13'h0482;
          default: begin end
        endcase
      end
      12'h521: begin
        out_r = 13'h0484;
        case (key_hi)
          1'h1: out_r = 13'h0485;
          default: begin end
        endcase
      end
      12'h522: begin
        out_r = 13'h0488;
        case (key_hi)
          1'h1: out_r = 13'h048a;
          default: begin end
        endcase
      end
      12'h523: begin
        out_r = 13'h048d;
      end
      12'h524: begin
        out_r = 13'h0490;
        case (key_hi)
          1'h1: out_r = 13'h0492;
          default: begin end
        endcase
      end
      12'h525: begin
        out_r = 13'h0898;
        case (key_hi)
          1'h1: out_r = 13'h049b;
          default: begin end
        endcase
      end
      12'h526: begin
        out_r = 13'h0495;
      end
      12'h527: begin
        out_r = 13'h049a;
      end
      12'h528: begin
        out_r = 13'h04a0;
        case (key_hi)
          1'h1: out_r = 13'h04a2;
          default: begin end
        endcase
      end
      12'h529: begin
        out_r = 13'h04a4;
        case (key_hi)
          1'h1: out_r = 13'h04a5;
          default: begin end
        endcase
      end
      12'h52a: begin
        out_r = 13'h04a8;
        case (key_hi)
          1'h1: out_r = 13'h04aa;
          default: begin end
        endcase
      end
      12'h52b: begin
        out_r = 13'h04ad;
      end
      12'h52c: begin
        out_r = 13'h04b4;
        case (key_hi)
          1'h1: out_r = 13'h04b6;
          default: begin end
        endcase
      end
      12'h52d: begin
        out_r = 13'h04b9;
        case (key_hi)
          1'h1: out_r = 13'h04b8;
          default: begin end
        endcase
      end
      12'h52e: begin
        out_r = 13'h04b4;
        case (key_hi)
          1'h1: out_r = 13'h08b7;
          default: begin end
        endcase
      end
      12'h52f: begin
        out_r = 13'h04b9;
      end
      12'h530: begin
        out_r = 13'h08d3;
        case (key_hi)
          1'h1: out_r = 13'h04d0;
          default: begin end
        endcase
      end
      12'h531: begin
        out_r = 13'h04d4;
        case (key_hi)
          1'h1: out_r = 13'h04d5;
          default: begin end
        endcase
      end
      12'h532: begin
        out_r = 13'h08db;
        case (key_hi)
          1'h1: out_r = 13'h04d8;
          default: begin end
        endcase
      end
      12'h533: begin
        out_r = 13'h04d5;
      end
      12'h534: begin
        out_r = 13'h04e4;
        case (key_hi)
          1'h1: out_r = 13'h04e5;
          default: begin end
        endcase
      end
      12'h535: begin
        out_r = 13'h04e8;
        case (key_hi)
          1'h1: out_r = 13'h04ea;
          default: begin end
        endcase
      end
      12'h536: begin
        out_r = 13'h04e2;
        case (key_hi)
          1'h1: out_r = 13'h08e3;
          default: begin end
        endcase
      end
      12'h537: begin
        out_r = 13'h04ea;
      end
      12'h538: begin
        out_r = 13'h08d3;
        case (key_hi)
          1'h1: out_r = 13'h04d0;
          default: begin end
        endcase
      end
      12'h539: begin
        out_r = 13'h04d5;
        case (key_hi)
          1'h1: out_r = 13'h04d4;
          default: begin end
        endcase
      end
      12'h53a: begin
        out_r = 13'h04df;
        case (key_hi)
          1'h1: out_r = 13'h04dd;
          default: begin end
        endcase
      end
      12'h53b: begin
        out_r = 13'h04d5;
      end
      12'h53c: begin
        out_r = 13'h04e4;
        case (key_hi)
          1'h1: out_r = 13'h04e5;
          default: begin end
        endcase
      end
      12'h53d: begin
        out_r = 13'h08ec;
        case (key_hi)
          1'h1: out_r = 13'h04ef;
          default: begin end
        endcase
      end
      12'h53e: begin
        out_r = 13'h04e4;
        case (key_hi)
          1'h1: out_r = 13'h04e5;
          default: begin end
        endcase
      end
      12'h53f: begin
        out_r = 13'h04e2;
      end
      12'h540: begin
        out_r = 13'h06da;
        case (key_hi)
          1'h1: out_r = 13'h07d8;
          default: begin end
        endcase
      end
      12'h541: begin
        out_r = 13'h06d4;
        case (key_hi)
          1'h1: out_r = 13'h0779;
          default: begin end
        endcase
      end
      12'h542: begin
        out_r = 13'h0ad0;
        case (key_hi)
          1'h1: out_r = 13'h05f3;
          default: begin end
        endcase
      end
      12'h543: begin
        out_r = 13'h06d5;
      end
      12'h544: begin
        out_r = 13'h06e0;
        case (key_hi)
          1'h1: out_r = 13'h06e2;
          default: begin end
        endcase
      end
      12'h545: begin
        out_r = 13'h0a1c;
        case (key_hi)
          1'h1: out_r = 13'h06ed;
          default: begin end
        endcase
      end
      12'h546: begin
        out_r = 13'h07e5;
        case (key_hi)
          1'h1: out_r = 13'h0695;
          default: begin end
        endcase
      end
      12'h547: begin
        out_r = 13'h076b;
      end
      12'h548: begin
        out_r = 13'h06f4;
        case (key_hi)
          1'h1: out_r = 13'h06f6;
          default: begin end
        endcase
      end
      12'h549: begin
        out_r = 13'h06f8;
        case (key_hi)
          1'h1: out_r = 13'h0765;
          default: begin end
        endcase
      end
      12'h54a: begin
        out_r = 13'h06df;
        case (key_hi)
          1'h1: out_r = 13'h076d;
          default: begin end
        endcase
      end
      12'h54b: begin
        out_r = 13'h06f0;
      end
      12'h54c: begin
        out_r = 13'h07e4;
        case (key_hi)
          1'h1: out_r = 13'h06f0;
          default: begin end
        endcase
      end
      12'h54d: begin
        out_r = 13'h0be8;
        case (key_hi)
          1'h1: out_r = 13'h075d;
          default: begin end
        endcase
      end
      12'h54e: begin
        out_r = 13'h07e4;
        case (key_hi)
          1'h1: out_r = 13'h0913;
          default: begin end
        endcase
      end
      12'h54f: begin
        out_r = 13'h0be8;
      end
      12'h550: begin
        out_r = 13'h0640;
        case (key_hi)
          1'h1: out_r = 13'h0642;
          default: begin end
        endcase
      end
      12'h551: begin
        out_r = 13'h0644;
        case (key_hi)
          1'h1: out_r = 13'h0b9f;
          default: begin end
        endcase
      end
      12'h552: begin
        out_r = 13'h0648;
        case (key_hi)
          1'h1: out_r = 13'h064a;
          default: begin end
        endcase
      end
      12'h553: begin
        out_r = 13'h078d;
      end
      12'h554: begin
        out_r = 13'h06b4;
        case (key_hi)
          1'h1: out_r = 13'h0ba3;
          default: begin end
        endcase
      end
      12'h555: begin
        out_r = 13'h0664;
      end
      12'h556: begin
        out_r = 13'h06a3;
        case (key_hi)
          1'h1: out_r = 13'h0bab;
          default: begin end
        endcase
      end
      12'h557: begin
        out_r = 13'h07b9;
      end
      12'h558: begin
        out_r = 13'h0654;
        case (key_hi)
          1'h1: out_r = 13'h0655;
          default: begin end
        endcase
      end
      12'h559: begin
        out_r = 13'h059c;
        case (key_hi)
          1'h1: out_r = 13'h079b;
          default: begin end
        endcase
      end
      12'h55a: begin
        out_r = 13'h0652;
      end
      12'h55b: begin
        out_r = 13'h0795;
      end
      12'h55c: begin
        out_r = 13'h0bab;
      end
      12'h55d: begin
        out_r = 13'h07b9;
        case (key_hi)
          1'h1: out_r = 13'h0baf;
          default: begin end
        endcase
      end
      12'h55e: begin
        out_r = 13'h0bab;
      end
      12'h55f: begin
        out_r = 13'h0665;
      end
      12'h560: begin
        out_r = 13'h06bf;
        case (key_hi)
          1'h1: out_r = 13'h074d;
          default: begin end
        endcase
      end
      12'h561: begin
        out_r = 13'h0632;
        case (key_hi)
          1'h1: out_r = 13'h0685;
          default: begin end
        endcase
      end
      12'h562: begin
        out_r = 13'h063d;
        case (key_hi)
          1'h1: out_r = 13'h094b;
          default: begin end
        endcase
      end
      12'h563: begin
        out_r = 13'h0632;
      end
      12'h564: begin
        out_r = 13'h0655;
        case (key_hi)
          1'h1: out_r = 13'h0715;
          default: begin end
        endcase
      end
      12'h565: begin
        out_r = 13'h0913;
        case (key_hi)
          1'h1: out_r = 13'h06ed;
          default: begin end
        endcase
      end
      12'h566: begin
        out_r = 13'h0754;
        case (key_hi)
          1'h1: out_r = 13'h0695;
          default: begin end
        endcase
      end
      12'h567: begin
        out_r = 13'h0710;
      end
      12'h568: begin
        out_r = 13'h0648;
        case (key_hi)
          1'h1: out_r = 13'h098b;
          default: begin end
        endcase
      end
      12'h569: begin
        out_r = 13'h0604;
        case (key_hi)
          1'h1: out_r = 13'h07f9;
          default: begin end
        endcase
      end
      12'h56a: begin
        out_r = 13'h0732;
        case (key_hi)
          1'h1: out_r = 13'h0b6b;
          default: begin end
        endcase
      end
      12'h56b: begin
        out_r = 13'h0745;
      end
      12'h56c: begin
        out_r = 13'h0b4c;
        case (key_hi)
          1'h1: out_r = 13'h0695;
          default: begin end
        endcase
      end
      12'h56d: begin
        out_r = 13'h0b5f;
        case (key_hi)
          1'h1: out_r = 13'h0beb;
          default: begin end
        endcase
      end
      12'h56e: begin
        out_r = 13'h0b4c;
        case (key_hi)
          1'h1: out_r = 13'h0754;
          default: begin end
        endcase
      end
      12'h56f: begin
        out_r = 13'h071d;
      end
      12'h570: begin
        out_r = 13'h0652;
        case (key_hi)
          1'h1: out_r = 13'h0790;
          default: begin end
        endcase
      end
      12'h571: begin
        out_r = 13'h0b98;
        case (key_hi)
          1'h1: out_r = 13'h079d;
          default: begin end
        endcase
      end
      12'h572: begin
        out_r = 13'h0659;
        case (key_hi)
          1'h1: out_r = 13'h0654;
          default: begin end
        endcase
      end
      12'h573: begin
        out_r = 13'h0780;
      end
      12'h574: begin
        out_r = 13'h0bab;
        case (key_hi)
          1'h1: out_r = 13'h0af0;
          default: begin end
        endcase
      end
      12'h575: begin
        out_r = 13'h0664;
        case (key_hi)
          1'h1: out_r = 13'h0968;
          default: begin end
        endcase
      end
      12'h576: begin
        out_r = 13'h066a;
        case (key_hi)
          1'h1: out_r = 13'h0669;
          default: begin end
        endcase
      end
      12'h577: begin
        out_r = 13'h0665;
      end
      12'h578: begin
        out_r = 13'h0652;
        case (key_hi)
          1'h1: out_r = 13'h0790;
          default: begin end
        endcase
      end
      12'h579: begin
        out_r = 13'h0b98;
        case (key_hi)
          1'h1: out_r = 13'h0645;
          default: begin end
        endcase
      end
      12'h57a: begin
        out_r = 13'h0659;
        case (key_hi)
          1'h1: out_r = 13'h09f0;
          default: begin end
        endcase
      end
      12'h57b: begin
        out_r = 13'h0780;
      end
      12'h57c: begin
        out_r = 13'h0648;
        case (key_hi)
          1'h1: out_r = 13'h064a;
          default: begin end
        endcase
      end
      12'h57d: begin
        out_r = 13'h0b8c;
        case (key_hi)
          1'h1: out_r = 13'h07b2;
          default: begin end
        endcase
      end
      12'h57e: begin
        out_r = 13'h0648;
        case (key_hi)
          1'h1: out_r = 13'h064a;
          default: begin end
        endcase
      end
      12'h57f: begin
        out_r = 13'h0642;
      end
      12'h580: begin
        out_r = 13'h05d5;
        case (key_hi)
          1'h1: out_r = 13'h0575;
          default: begin end
        endcase
      end
      12'h581: begin
        out_r = 13'h0a58;
        case (key_hi)
          1'h1: out_r = 13'h0525;
          default: begin end
        endcase
      end
      12'h582: begin
        out_r = 13'h0575;
        case (key_hi)
          1'h1: out_r = 13'h0556;
          default: begin end
        endcase
      end
      12'h583: begin
        out_r = 13'h0552;
      end
      12'h584: begin
        out_r = 13'h0a6b;
        case (key_hi)
          1'h1: out_r = 13'h05ea;
          default: begin end
        endcase
      end
      12'h585: begin
        out_r = 13'h0544;
        case (key_hi)
          1'h1: out_r = 13'h05f8;
          default: begin end
        endcase
      end
      12'h586: begin
        out_r = 13'h0543;
        case (key_hi)
          1'h1: out_r = 13'h065d;
          default: begin end
        endcase
      end
      12'h587: begin
        out_r = 13'h0960;
      end
      12'h588: begin
        out_r = 13'h0548;
        case (key_hi)
          1'h1: out_r = 13'h054a;
          default: begin end
        endcase
      end
      12'h589: begin
        out_r = 13'h0544;
        case (key_hi)
          1'h1: out_r = 13'h0505;
          default: begin end
        endcase
      end
      12'h58a: begin
        out_r = 13'h09d0;
        case (key_hi)
          1'h1: out_r = 13'h0758;
          default: begin end
        endcase
      end
      12'h58b: begin
        out_r = 13'h069c;
      end
      12'h58c: begin
        out_r = 13'h05ea;
        case (key_hi)
          1'h1: out_r = 13'h0548;
          default: begin end
        endcase
      end
      12'h58d: begin
        out_r = 13'h0566;
        case (key_hi)
          1'h1: out_r = 13'h059d;
          default: begin end
        endcase
      end
      12'h58e: begin
        out_r = 13'h05ea;
        case (key_hi)
          1'h1: out_r = 13'h0994;
          default: begin end
        endcase
      end
      12'h58f: begin
        out_r = 13'h0544;
      end
      12'h590: begin
        out_r = 13'h09dc;
        case (key_hi)
          1'h1: out_r = 13'h07af;
          default: begin end
        endcase
      end
      12'h591: begin
        out_r = 13'h05d4;
        case (key_hi)
          1'h1: out_r = 13'h05a5;
          default: begin end
        endcase
      end
      12'h592: begin
        out_r = 13'h05da;
        case (key_hi)
          1'h1: out_r = 13'h0aff;
          default: begin end
        endcase
      end
      12'h593: begin
        out_r = 13'h068d;
      end
      12'h594: begin
        out_r = 13'h05b4;
        case (key_hi)
          1'h1: out_r = 13'h0573;
          default: begin end
        endcase
      end
      12'h595: begin
        out_r = 13'h05eb;
        case (key_hi)
          1'h1: out_r = 13'h05ed;
          default: begin end
        endcase
      end
      12'h596: begin
        out_r = 13'h0555;
        case (key_hi)
          1'h1: out_r = 13'h05fc;
          default: begin end
        endcase
      end
      12'h597: begin
        out_r = 13'h061c;
      end
      12'h598: begin
        out_r = 13'h0696;
        case (key_hi)
          1'h1: out_r = 13'h0508;
          default: begin end
        endcase
      end
      12'h599: begin
        out_r = 13'h0505;
        case (key_hi)
          1'h1: out_r = 13'h0bbb;
          default: begin end
        endcase
      end
      12'h59a: begin
        out_r = 13'h0b83;
        case (key_hi)
          1'h1: out_r = 13'h0adf;
          default: begin end
        endcase
      end
      12'h59b: begin
        out_r = 13'h06c4;
      end
      12'h59c: begin
        out_r = 13'h05e2;
        case (key_hi)
          1'h1: out_r = 13'h0510;
          default: begin end
        endcase
      end
      12'h59d: begin
        out_r = 13'h0654;
        case (key_hi)
          1'h1: out_r = 13'h0aa8;
          default: begin end
        endcase
      end
      12'h59e: begin
        out_r = 13'h05e2;
        case (key_hi)
          1'h1: out_r = 13'h0510;
          default: begin end
        endcase
      end
      12'h59f: begin
        out_r = 13'h09e8;
      end
      12'h5a0: begin
        out_r = 13'h0520;
        case (key_hi)
          1'h1: out_r = 13'h0522;
          default: begin end
        endcase
      end
      12'h5a1: begin
        out_r = 13'h0524;
        case (key_hi)
          1'h1: out_r = 13'h069c;
          default: begin end
        endcase
      end
      12'h5a2: begin
        out_r = 13'h0528;
        case (key_hi)
          1'h1: out_r = 13'h052a;
          default: begin end
        endcase
      end
      12'h5a3: begin
        out_r = 13'h0585;
      end
      12'h5a4: begin
        out_r = 13'h0510;
        case (key_hi)
          1'h1: out_r = 13'h0512;
          default: begin end
        endcase
      end
      12'h5a5: begin
        out_r = 13'h0abc;
        case (key_hi)
          1'h1: out_r = 13'h0544;
          default: begin end
        endcase
      end
      12'h5a6: begin
        out_r = 13'h057f;
        case (key_hi)
          1'h1: out_r = 13'h0960;
          default: begin end
        endcase
      end
      12'h5a7: begin
        out_r = 13'h077a;
      end
      12'h5a8: begin
        out_r = 13'h0508;
        case (key_hi)
          1'h1: out_r = 13'h050a;
          default: begin end
        endcase
      end
      12'h5a9: begin
        out_r = 13'h0504;
        case (key_hi)
          1'h1: out_r = 13'h0a58;
          default: begin end
        endcase
      end
      12'h5aa: begin
        out_r = 13'h063c;
        case (key_hi)
          1'h1: out_r = 13'h05b6;
          default: begin end
        endcase
      end
      12'h5ab: begin
        out_r = 13'h055a;
      end
      12'h5ac: begin
        out_r = 13'h056d;
        case (key_hi)
          1'h1: out_r = 13'h0515;
          default: begin end
        endcase
      end
      12'h5ad: begin
        out_r = 13'h0512;
        case (key_hi)
          1'h1: out_r = 13'h0564;
          default: begin end
        endcase
      end
      12'h5ae: begin
        out_r = 13'h056d;
        case (key_hi)
          1'h1: out_r = 13'h057d;
          default: begin end
        endcase
      end
      12'h5af: begin
        out_r = 13'h06b2;
      end
      12'h5b0: begin
        out_r = 13'h0b83;
        case (key_hi)
          1'h1: out_r = 13'h0683;
          default: begin end
        endcase
      end
      12'h5b1: begin
        out_r = 13'h0505;
      end
      12'h5b2: begin
        out_r = 13'h0b83;
        case (key_hi)
          1'h1: out_r = 13'h0bbd;
          default: begin end
        endcase
      end
      12'h5b3: begin
        out_r = 13'h06c4;
      end
      12'h5b4: begin
        out_r = 13'h0515;
        case (key_hi)
          1'h1: out_r = 13'h05b4;
          default: begin end
        endcase
      end
      12'h5b5: begin
        out_r = 13'h0aef;
        case (key_hi)
          1'h1: out_r = 13'h09e8;
          default: begin end
        endcase
      end
      12'h5b6: begin
        out_r = 13'h05e2;
        case (key_hi)
          1'h1: out_r = 13'h0a43;
          default: begin end
        endcase
      end
      12'h5b7: begin
        out_r = 13'h079c;
      end
      12'h5b8: begin
        out_r = 13'h0b83;
        case (key_hi)
          1'h1: out_r = 13'h0683;
          default: begin end
        endcase
      end
      12'h5b9: begin
        out_r = 13'h0538;
        case (key_hi)
          1'h1: out_r = 13'h06d5;
          default: begin end
        endcase
      end
      12'h5ba: begin
        out_r = 13'h0696;
        case (key_hi)
          1'h1: out_r = 13'h0b93;
          default: begin end
        endcase
      end
      12'h5bb: begin
        out_r = 13'h06c4;
      end
      12'h5bc: begin
        out_r = 13'h0515;
        case (key_hi)
          1'h1: out_r = 13'h0aeb;
          default: begin end
        endcase
      end
      12'h5bd: begin
        out_r = 13'h0aec;
        case (key_hi)
          1'h1: out_r = 13'h05e8;
          default: begin end
        endcase
      end
      12'h5be: begin
        out_r = 13'h0515;
        case (key_hi)
          1'h1: out_r = 13'h0aeb;
          default: begin end
        endcase
      end
      12'h5bf: begin
        out_r = 13'h05e2;
      end
      12'h5c0: begin
        out_r = 13'h0b43;
        case (key_hi)
          1'h1: out_r = 13'h077f;
          default: begin end
        endcase
      end
      12'h5c1: begin
        out_r = 13'h0684;
        case (key_hi)
          1'h1: out_r = 13'h07d5;
          default: begin end
        endcase
      end
      12'h5c2: begin
        out_r = 13'h06c8;
        case (key_hi)
          1'h1: out_r = 13'h096b;
          default: begin end
        endcase
      end
      12'h5c3: begin
        out_r = 13'h0779;
      end
      12'h5c4: begin
        out_r = 13'h0690;
        case (key_hi)
          1'h1: out_r = 13'h0692;
          default: begin end
        endcase
      end
      12'h5c5: begin
        out_r = 13'h06ed;
        case (key_hi)
          1'h1: out_r = 13'h0b53;
          default: begin end
        endcase
      end
      12'h5c6: begin
        out_r = 13'h0755;
        case (key_hi)
          1'h1: out_r = 13'h07e4;
          default: begin end
        endcase
      end
      12'h5c7: begin
        out_r = 13'h0a1c;
      end
      12'h5c8: begin
        out_r = 13'h06b6;
        case (key_hi)
          1'h1: out_r = 13'h0ab7;
          default: begin end
        endcase
      end
      12'h5c9: begin
        out_r = 13'h06b8;
        case (key_hi)
          1'h1: out_r = 13'h0b63;
          default: begin end
        endcase
      end
      12'h5ca: begin
        out_r = 13'h06bf;
        case (key_hi)
          1'h1: out_r = 13'h0b4b;
          default: begin end
        endcase
      end
      12'h5cb: begin
        out_r = 13'h06d5;
      end
      12'h5cc: begin
        out_r = 13'h0755;
        case (key_hi)
          1'h1: out_r = 13'h0913;
          default: begin end
        endcase
      end
      12'h5cd: begin
        out_r = 13'h0b7b;
        case (key_hi)
          1'h1: out_r = 13'h0beb;
          default: begin end
        endcase
      end
      12'h5ce: begin
        out_r = 13'h0755;
        case (key_hi)
          1'h1: out_r = 13'h0614;
          default: begin end
        endcase
      end
      12'h5cf: begin
        out_r = 13'h0b7b;
      end
      12'h5d0: begin
        out_r = 13'h0652;
        case (key_hi)
          1'h1: out_r = 13'h0790;
          default: begin end
        endcase
      end
      12'h5d1: begin
        out_r = 13'h0b98;
        case (key_hi)
          1'h1: out_r = 13'h079d;
          default: begin end
        endcase
      end
      12'h5d2: begin
        out_r = 13'h0656;
        case (key_hi)
          1'h1: out_r = 13'h054d;
          default: begin end
        endcase
      end
      12'h5d3: begin
        out_r = 13'h0a5f;
      end
      12'h5d4: begin
        out_r = 13'h06b4;
        case (key_hi)
          1'h1: out_r = 13'h0ba3;
          default: begin end
        endcase
      end
      12'h5d5: begin
        out_r = 13'h0665;
        case (key_hi)
          1'h1: out_r = 13'h0bbb;
          default: begin end
        endcase
      end
      12'h5d6: begin
        out_r = 13'h07af;
        case (key_hi)
          1'h1: out_r = 13'h0a6c;
          default: begin end
        endcase
      end
      12'h5d7: begin
        out_r = 13'h0bbb;
      end
      12'h5d8: begin
        out_r = 13'h0659;
        case (key_hi)
          1'h1: out_r = 13'h0795;
          default: begin end
        endcase
      end
      12'h5d9: begin
        out_r = 13'h059c;
        case (key_hi)
          1'h1: out_r = 13'h0b98;
          default: begin end
        endcase
      end
      12'h5da: begin
        out_r = 13'h0555;
        case (key_hi)
          1'h1: out_r = 13'h0792;
          default: begin end
        endcase
      end
      12'h5db: begin
        out_r = 13'h0705;
      end
      12'h5dc: begin
        out_r = 13'h0a6c;
        case (key_hi)
          1'h1: out_r = 13'h0674;
          default: begin end
        endcase
      end
      12'h5dd: begin
        out_r = 13'h07a4;
      end
      12'h5de: begin
        out_r = 13'h0a6c;
        case (key_hi)
          1'h1: out_r = 13'h0674;
          default: begin end
        endcase
      end
      12'h5df: begin
        out_r = 13'h0665;
      end
      12'h5e0: begin
        out_r = 13'h0b43;
        case (key_hi)
          1'h1: out_r = 13'h077f;
          default: begin end
        endcase
      end
      12'h5e1: begin
        out_r = 13'h0684;
        case (key_hi)
          1'h1: out_r = 13'h07d5;
          default: begin end
        endcase
      end
      12'h5e2: begin
        out_r = 13'h06c8;
        case (key_hi)
          1'h1: out_r = 13'h096b;
          default: begin end
        endcase
      end
      12'h5e3: begin
        out_r = 13'h0779;
      end
      12'h5e4: begin
        out_r = 13'h0690;
        case (key_hi)
          1'h1: out_r = 13'h0692;
          default: begin end
        endcase
      end
      12'h5e5: begin
        out_r = 13'h0be8;
        case (key_hi)
          1'h1: out_r = 13'h0614;
          default: begin end
        endcase
      end
      12'h5e6: begin
        out_r = 13'h0755;
        case (key_hi)
          1'h1: out_r = 13'h06e5;
          default: begin end
        endcase
      end
      12'h5e7: begin
        out_r = 13'h0a1c;
      end
      12'h5e8: begin
        out_r = 13'h06b6;
        case (key_hi)
          1'h1: out_r = 13'h0ab7;
          default: begin end
        endcase
      end
      12'h5e9: begin
        out_r = 13'h06b8;
        case (key_hi)
          1'h1: out_r = 13'h06d5;
          default: begin end
        endcase
      end
      12'h5ea: begin
        out_r = 13'h0bdc;
        case (key_hi)
          1'h1: out_r = 13'h0a35;
          default: begin end
        endcase
      end
      12'h5eb: begin
        out_r = 13'h0779;
      end
      12'h5ec: begin
        out_r = 13'h0755;
        case (key_hi)
          1'h1: out_r = 13'h0913;
          default: begin end
        endcase
      end
      12'h5ed: begin
        out_r = 13'h0b7b;
        case (key_hi)
          1'h1: out_r = 13'h0beb;
          default: begin end
        endcase
      end
      12'h5ee: begin
        out_r = 13'h0755;
        case (key_hi)
          1'h1: out_r = 13'h0614;
          default: begin end
        endcase
      end
      12'h5ef: begin
        out_r = 13'h0b7b;
      end
      12'h5f0: begin
        out_r = 13'h0695;
        case (key_hi)
          1'h1: out_r = 13'h0658;
          default: begin end
        endcase
      end
      12'h5f1: begin
        out_r = 13'h065b;
        case (key_hi)
          1'h1: out_r = 13'h0b9f;
          default: begin end
        endcase
      end
      12'h5f2: begin
        out_r = 13'h0652;
        case (key_hi)
          1'h1: out_r = 13'h0790;
          default: begin end
        endcase
      end
      12'h5f3: begin
        out_r = 13'h065b;
      end
      12'h5f4: begin
        out_r = 13'h0ba3;
        case (key_hi)
          1'h1: out_r = 13'h057d;
          default: begin end
        endcase
      end
      12'h5f5: begin
        out_r = 13'h0678;
        case (key_hi)
          1'h1: out_r = 13'h093b;
          default: begin end
        endcase
      end
      12'h5f6: begin
        out_r = 13'h067f;
        case (key_hi)
          1'h1: out_r = 13'h093d;
          default: begin end
        endcase
      end
      12'h5f7: begin
        out_r = 13'h0679;
      end
      12'h5f8: begin
        out_r = 13'h0695;
        case (key_hi)
          1'h1: out_r = 13'h0658;
          default: begin end
        endcase
      end
      12'h5f9: begin
        out_r = 13'h065b;
      end
      12'h5fa: begin
        out_r = 13'h0652;
        case (key_hi)
          1'h1: out_r = 13'h092b;
          default: begin end
        endcase
      end
      12'h5fb: begin
        out_r = 13'h065b;
      end
      12'h5fc: begin
        out_r = 13'h0648;
        case (key_hi)
          1'h1: out_r = 13'h064a;
          default: begin end
        endcase
      end
      12'h5fd: begin
        out_r = 13'h0b8c;
        case (key_hi)
          1'h1: out_r = 13'h064f;
          default: begin end
        endcase
      end
      12'h5fe: begin
        out_r = 13'h0648;
        case (key_hi)
          1'h1: out_r = 13'h064a;
          default: begin end
        endcase
      end
      12'h5ff: begin
        out_r = 13'h0642;
      end
      12'h600: begin
        out_r = 13'h0c30;
        case (key_hi)
          1'h1: out_r = 13'h0c32;
          default: begin end
        endcase
      end
      12'h601: begin
        out_r = 13'h0c38;
        case (key_hi)
          1'h1: out_r = 13'h0c39;
          default: begin end
        endcase
      end
      12'h602: begin
        out_r = 13'h0c3c;
        case (key_hi)
          1'h1: out_r = 13'h0c3d;
          default: begin end
        endcase
      end
      12'h603: begin
        out_r = 13'h0c3a;
      end
      12'h604: begin
        out_r = 13'h0c10;
        case (key_hi)
          1'h1: out_r = 13'h0c12;
          default: begin end
        endcase
      end
      12'h605: begin
        out_r = 13'h0c18;
        case (key_hi)
          1'h1: out_r = 13'h0c1b;
          default: begin end
        endcase
      end
      12'h606: begin
        out_r = 13'h0c15;
      end
      12'h607: begin
        out_r = 13'h0c1a;
      end
      12'h608: begin
        out_r = 13'h0c00;
        case (key_hi)
          1'h1: out_r = 13'h0c02;
          default: begin end
        endcase
      end
      12'h609: begin
        out_r = 13'h0c04;
        case (key_hi)
          1'h1: out_r = 13'h0c05;
          default: begin end
        endcase
      end
      12'h60a: begin
        out_r = 13'h0c0c;
        case (key_hi)
          1'h1: out_r = 13'h0c0d;
          default: begin end
        endcase
      end
      12'h60b: begin
        out_r = 13'h0c05;
      end
      12'h60c: begin
        out_r = 13'h0c18;
        case (key_hi)
          1'h1: out_r = 13'h0c1a;
          default: begin end
        endcase
      end
      12'h60d: begin
        out_r = 13'h0c15;
        case (key_hi)
          1'h1: out_r = 13'h0c14;
          default: begin end
        endcase
      end
      12'h60e: begin
        out_r = 13'h0c18;
        case (key_hi)
          1'h1: out_r = 13'h0c1b;
          default: begin end
        endcase
      end
      12'h60f: begin
        out_r = 13'h0c15;
      end
      12'h610: begin
        out_r = 13'h0c40;
        case (key_hi)
          1'h1: out_r = 13'h0c42;
          default: begin end
        endcase
      end
      12'h611: begin
        out_r = 13'h0c44;
        case (key_hi)
          1'h1: out_r = 13'h0c45;
          default: begin end
        endcase
      end
      12'h612: begin
        out_r = 13'h0c48;
        case (key_hi)
          1'h1: out_r = 13'h0c4a;
          default: begin end
        endcase
      end
      12'h613: begin
        out_r = 13'h0c4d;
      end
      12'h614: begin
        out_r = 13'h0c68;
        case (key_hi)
          1'h1: out_r = 13'h0c6b;
          default: begin end
        endcase
      end
      12'h615: begin
        out_r = 13'h0c64;
        case (key_hi)
          1'h1: out_r = 13'h0c65;
          default: begin end
        endcase
      end
      12'h616: begin
        out_r = 13'h0c62;
        case (key_hi)
          1'h1: out_r = 13'h0c60;
          default: begin end
        endcase
      end
      12'h617: begin
        out_r = 13'h0c65;
      end
      12'h618: begin
        out_r = 13'h0c55;
      end
      12'h619: begin
        out_r = 13'h0c5b;
        case (key_hi)
          1'h1: out_r = 13'h0c58;
          default: begin end
        endcase
      end
      12'h61a: begin
        out_r = 13'h0c55;
        case (key_hi)
          1'h1: out_r = 13'h0c54;
          default: begin end
        endcase
      end
      12'h61b: begin
        out_r = 13'h0c53;
      end
      12'h61c: begin
        out_r = 13'h0c6d;
        case (key_hi)
          1'h1: out_r = 13'h0c6f;
          default: begin end
        endcase
      end
      12'h61d: begin
        out_r = 13'h0c65;
      end
      12'h61e: begin
        out_r = 13'h0c6d;
        case (key_hi)
          1'h1: out_r = 13'h0c6f;
          default: begin end
        endcase
      end
      12'h61f: begin
        out_r = 13'h0c65;
      end
      12'h620: begin
        out_r = 13'h0cb2;
        case (key_hi)
          1'h1: out_r = 13'h0cb0;
          default: begin end
        endcase
      end
      12'h621: begin
        out_r = 13'h0cb8;
        case (key_hi)
          1'h1: out_r = 13'h0cb9;
          default: begin end
        endcase
      end
      12'h622: begin
        out_r = 13'h0cbf;
        case (key_hi)
          1'h1: out_r = 13'h0cbd;
          default: begin end
        endcase
      end
      12'h623: begin
        out_r = 13'h0cb9;
      end
      12'h624: begin
        out_r = 13'h0c90;
        case (key_hi)
          1'h1: out_r = 13'h0c92;
          default: begin end
        endcase
      end
      12'h625: begin
        out_r = 13'h0c98;
        case (key_hi)
          1'h1: out_r = 13'h0c9b;
          default: begin end
        endcase
      end
      12'h626: begin
        out_r = 13'h0c95;
      end
      12'h627: begin
        out_r = 13'h0c9a;
      end
      12'h628: begin
        out_r = 13'h0c80;
        case (key_hi)
          1'h1: out_r = 13'h0c82;
          default: begin end
        endcase
      end
      12'h629: begin
        out_r = 13'h0c84;
        case (key_hi)
          1'h1: out_r = 13'h0c85;
          default: begin end
        endcase
      end
      12'h62a: begin
        out_r = 13'h0c8c;
        case (key_hi)
          1'h1: out_r = 13'h0c8d;
          default: begin end
        endcase
      end
      12'h62b: begin
        out_r = 13'h0c85;
      end
      12'h62c: begin
        out_r = 13'h0c95;
        case (key_hi)
          1'h1: out_r = 13'h0c97;
          default: begin end
        endcase
      end
      12'h62d: begin
        out_r = 13'h0c9b;
        case (key_hi)
          1'h1: out_r = 13'h0c9a;
          default: begin end
        endcase
      end
      12'h62e: begin
        out_r = 13'h0c95;
        case (key_hi)
          1'h1: out_r = 13'h0c94;
          default: begin end
        endcase
      end
      12'h62f: begin
        out_r = 13'h0c9b;
      end
      12'h630: begin
        out_r = 13'h0c48;
        case (key_hi)
          1'h1: out_r = 13'h0c4a;
          default: begin end
        endcase
      end
      12'h631: begin
        out_r = 13'h0c44;
        case (key_hi)
          1'h1: out_r = 13'h0c45;
          default: begin end
        endcase
      end
      12'h632: begin
        out_r = 13'h0c42;
        case (key_hi)
          1'h1: out_r = 13'h0c43;
          default: begin end
        endcase
      end
      12'h633: begin
        out_r = 13'h0c45;
      end
      12'h634: begin
        out_r = 13'h0c6f;
        case (key_hi)
          1'h1: out_r = 13'h0c6d;
          default: begin end
        endcase
      end
      12'h635: begin
        out_r = 13'h0c64;
        case (key_hi)
          1'h1: out_r = 13'h0c65;
          default: begin end
        endcase
      end
      12'h636: begin
        out_r = 13'h0c63;
        case (key_hi)
          1'h1: out_r = 13'h0c62;
          default: begin end
        endcase
      end
      12'h637: begin
        out_r = 13'h0c65;
      end
      12'h638: begin
        out_r = 13'h0c48;
        case (key_hi)
          1'h1: out_r = 13'h0c4a;
          default: begin end
        endcase
      end
      12'h639: begin
        out_r = 13'h0c42;
        case (key_hi)
          1'h1: out_r = 13'h0c40;
          default: begin end
        endcase
      end
      12'h63a: begin
        out_r = 13'h0c4d;
        case (key_hi)
          1'h1: out_r = 13'h0c4f;
          default: begin end
        endcase
      end
      12'h63b: begin
        out_r = 13'h0c45;
      end
      12'h63c: begin
        out_r = 13'h0c68;
        case (key_hi)
          1'h1: out_r = 13'h0c6a;
          default: begin end
        endcase
      end
      12'h63d: begin
        out_r = 13'h0c64;
        case (key_hi)
          1'h1: out_r = 13'h0c65;
          default: begin end
        endcase
      end
      12'h63e: begin
        out_r = 13'h0c68;
        case (key_hi)
          1'h1: out_r = 13'h0c6a;
          default: begin end
        endcase
      end
      12'h63f: begin
        out_r = 13'h0c65;
      end
      12'h640: begin
        out_r = 13'h0e00;
        case (key_hi)
          1'h1: out_r = 13'h0e02;
          default: begin end
        endcase
      end
      12'h641: begin
        out_r = 13'h0e04;
        case (key_hi)
          1'h1: out_r = 13'h0e05;
          default: begin end
        endcase
      end
      12'h642: begin
        out_r = 13'h0e08;
        case (key_hi)
          1'h1: out_r = 13'h0e0a;
          default: begin end
        endcase
      end
      12'h643: begin
        out_r = 13'h0e0d;
      end
      12'h644: begin
        out_r = 13'h0e10;
        case (key_hi)
          1'h1: out_r = 13'h0e12;
          default: begin end
        endcase
      end
      12'h645: begin
        out_r = 13'h0e18;
        case (key_hi)
          1'h1: out_r = 13'h0e1b;
          default: begin end
        endcase
      end
      12'h646: begin
        out_r = 13'h0e15;
      end
      12'h647: begin
        out_r = 13'h0e1a;
      end
      12'h648: begin
        out_r = 13'h0e20;
        case (key_hi)
          1'h1: out_r = 13'h0e22;
          default: begin end
        endcase
      end
      12'h649: begin
        out_r = 13'h0e24;
        case (key_hi)
          1'h1: out_r = 13'h0e25;
          default: begin end
        endcase
      end
      12'h64a: begin
        out_r = 13'h0e28;
        case (key_hi)
          1'h1: out_r = 13'h0e2a;
          default: begin end
        endcase
      end
      12'h64b: begin
        out_r = 13'h0e2d;
      end
      12'h64c: begin
        out_r = 13'h0e34;
        case (key_hi)
          1'h1: out_r = 13'h0e36;
          default: begin end
        endcase
      end
      12'h64d: begin
        out_r = 13'h0e39;
        case (key_hi)
          1'h1: out_r = 13'h0e38;
          default: begin end
        endcase
      end
      12'h64e: begin
        out_r = 13'h0e34;
        case (key_hi)
          1'h1: out_r = 13'h0e37;
          default: begin end
        endcase
      end
      12'h64f: begin
        out_r = 13'h0e39;
      end
      12'h650: begin
        out_r = 13'h0e80;
        case (key_hi)
          1'h1: out_r = 13'h0e82;
          default: begin end
        endcase
      end
      12'h651: begin
        out_r = 13'h0e84;
        case (key_hi)
          1'h1: out_r = 13'h0e85;
          default: begin end
        endcase
      end
      12'h652: begin
        out_r = 13'h0e88;
        case (key_hi)
          1'h1: out_r = 13'h0e8a;
          default: begin end
        endcase
      end
      12'h653: begin
        out_r = 13'h0e8d;
      end
      12'h654: begin
        out_r = 13'h0e90;
        case (key_hi)
          1'h1: out_r = 13'h0e92;
          default: begin end
        endcase
      end
      12'h655: begin
        out_r = 13'h0e9b;
        case (key_hi)
          1'h1: out_r = 13'h0e98;
          default: begin end
        endcase
      end
      12'h656: begin
        out_r = 13'h0e95;
        case (key_hi)
          1'h1: out_r = 13'h0e94;
          default: begin end
        endcase
      end
      12'h657: begin
        out_r = 13'h0e9a;
      end
      12'h658: begin
        out_r = 13'h0eb0;
        case (key_hi)
          1'h1: out_r = 13'h0eb2;
          default: begin end
        endcase
      end
      12'h659: begin
        out_r = 13'h0eb8;
        case (key_hi)
          1'h1: out_r = 13'h0ebb;
          default: begin end
        endcase
      end
      12'h65a: begin
        out_r = 13'h0eb4;
        case (key_hi)
          1'h1: out_r = 13'h0eb6;
          default: begin end
        endcase
      end
      12'h65b: begin
        out_r = 13'h0ebb;
      end
      12'h65c: begin
        out_r = 13'h0e95;
      end
      12'h65d: begin
        out_r = 13'h0e9a;
        case (key_hi)
          1'h1: out_r = 13'h0e98;
          default: begin end
        endcase
      end
      12'h65e: begin
        out_r = 13'h0e95;
      end
      12'h65f: begin
        out_r = 13'h0e92;
      end
      12'h660: begin
        out_r = 13'h0ec3;
        case (key_hi)
          1'h1: out_r = 13'h0ec0;
          default: begin end
        endcase
      end
      12'h661: begin
        out_r = 13'h0ec4;
        case (key_hi)
          1'h1: out_r = 13'h0ec5;
          default: begin end
        endcase
      end
      12'h662: begin
        out_r = 13'h0ecb;
        case (key_hi)
          1'h1: out_r = 13'h0ec8;
          default: begin end
        endcase
      end
      12'h663: begin
        out_r = 13'h0ec4;
      end
      12'h664: begin
        out_r = 13'h0ee0;
        case (key_hi)
          1'h1: out_r = 13'h0ee2;
          default: begin end
        endcase
      end
      12'h665: begin
        out_r = 13'h0ee8;
        case (key_hi)
          1'h1: out_r = 13'h0eeb;
          default: begin end
        endcase
      end
      12'h666: begin
        out_r = 13'h0eec;
        case (key_hi)
          1'h1: out_r = 13'h0eed;
          default: begin end
        endcase
      end
      12'h667: begin
        out_r = 13'h0eea;
      end
      12'h668: begin
        out_r = 13'h0ed3;
        case (key_hi)
          1'h1: out_r = 13'h0ed0;
          default: begin end
        endcase
      end
      12'h669: begin
        out_r = 13'h0ed4;
        case (key_hi)
          1'h1: out_r = 13'h0ed5;
          default: begin end
        endcase
      end
      12'h66a: begin
        out_r = 13'h0edb;
        case (key_hi)
          1'h1: out_r = 13'h0ed8;
          default: begin end
        endcase
      end
      12'h66b: begin
        out_r = 13'h0ed5;
      end
      12'h66c: begin
        out_r = 13'h0eef;
        case (key_hi)
          1'h1: out_r = 13'h0eed;
          default: begin end
        endcase
      end
      12'h66d: begin
        out_r = 13'h0ee2;
        case (key_hi)
          1'h1: out_r = 13'h0ee0;
          default: begin end
        endcase
      end
      12'h66e: begin
        out_r = 13'h0eef;
        case (key_hi)
          1'h1: out_r = 13'h0eec;
          default: begin end
        endcase
      end
      12'h66f: begin
        out_r = 13'h0eea;
      end
      12'h670: begin
        out_r = 13'h0ea0;
        case (key_hi)
          1'h1: out_r = 13'h0ea2;
          default: begin end
        endcase
      end
      12'h671: begin
        out_r = 13'h0ea4;
        case (key_hi)
          1'h1: out_r = 13'h0ea5;
          default: begin end
        endcase
      end
      12'h672: begin
        out_r = 13'h0ea8;
        case (key_hi)
          1'h1: out_r = 13'h0eaa;
          default: begin end
        endcase
      end
      12'h673: begin
        out_r = 13'h0ead;
      end
      12'h674: begin
        out_r = 13'h0eb0;
        case (key_hi)
          1'h1: out_r = 13'h0eb2;
          default: begin end
        endcase
      end
      12'h675: begin
        out_r = 13'h0eb8;
        case (key_hi)
          1'h1: out_r = 13'h0ebb;
          default: begin end
        endcase
      end
      12'h676: begin
        out_r = 13'h0ebc;
        case (key_hi)
          1'h1: out_r = 13'h0ebd;
          default: begin end
        endcase
      end
      12'h677: begin
        out_r = 13'h0eb9;
      end
      12'h678: begin
        out_r = 13'h0ea0;
        case (key_hi)
          1'h1: out_r = 13'h0ea2;
          default: begin end
        endcase
      end
      12'h679: begin
        out_r = 13'h0ea4;
        case (key_hi)
          1'h1: out_r = 13'h0ea5;
          default: begin end
        endcase
      end
      12'h67a: begin
        out_r = 13'h0ea8;
        case (key_hi)
          1'h1: out_r = 13'h0eab;
          default: begin end
        endcase
      end
      12'h67b: begin
        out_r = 13'h0ead;
      end
      12'h67c: begin
        out_r = 13'h0e88;
        case (key_hi)
          1'h1: out_r = 13'h0e8a;
          default: begin end
        endcase
      end
      12'h67d: begin
        out_r = 13'h0e8c;
        case (key_hi)
          1'h1: out_r = 13'h0e8f;
          default: begin end
        endcase
      end
      12'h67e: begin
        out_r = 13'h0e88;
        case (key_hi)
          1'h1: out_r = 13'h0e8a;
          default: begin end
        endcase
      end
      12'h67f: begin
        out_r = 13'h0e82;
      end
      12'h680: begin
        out_r = 13'h0d34;
        case (key_hi)
          1'h1: out_r = 13'h0d36;
          default: begin end
        endcase
      end
      12'h681: begin
        out_r = 13'h0d38;
        case (key_hi)
          1'h1: out_r = 13'h0d39;
          default: begin end
        endcase
      end
      12'h682: begin
        out_r = 13'h0d32;
        case (key_hi)
          1'h1: out_r = 13'h0d33;
          default: begin end
        endcase
      end
      12'h683: begin
        out_r = 13'h0d38;
      end
      12'h684: begin
        out_r = 13'h0d10;
        case (key_hi)
          1'h1: out_r = 13'h0d12;
          default: begin end
        endcase
      end
      12'h685: begin
        out_r = 13'h0d18;
        case (key_hi)
          1'h1: out_r = 13'h0d1b;
          default: begin end
        endcase
      end
      12'h686: begin
        out_r = 13'h0d15;
      end
      12'h687: begin
        out_r = 13'h0d1a;
      end
      12'h688: begin
        out_r = 13'h0d00;
        case (key_hi)
          1'h1: out_r = 13'h0d02;
          default: begin end
        endcase
      end
      12'h689: begin
        out_r = 13'h0d04;
        case (key_hi)
          1'h1: out_r = 13'h0d05;
          default: begin end
        endcase
      end
      12'h68a: begin
        out_r = 13'h0d0d;
        case (key_hi)
          1'h1: out_r = 13'h0d0f;
          default: begin end
        endcase
      end
      12'h68b: begin
        out_r = 13'h0d04;
      end
      12'h68c: begin
        out_r = 13'h0d10;
        case (key_hi)
          1'h1: out_r = 13'h0d12;
          default: begin end
        endcase
      end
      12'h68d: begin
        out_r = 13'h0d19;
        case (key_hi)
          1'h1: out_r = 13'h0d18;
          default: begin end
        endcase
      end
      12'h68e: begin
        out_r = 13'h0d10;
        case (key_hi)
          1'h1: out_r = 13'h0d13;
          default: begin end
        endcase
      end
      12'h68f: begin
        out_r = 13'h0d19;
      end
      12'h690: begin
        out_r = 13'h0d40;
        case (key_hi)
          1'h1: out_r = 13'h0d42;
          default: begin end
        endcase
      end
      12'h691: begin
        out_r = 13'h0d44;
        case (key_hi)
          1'h1: out_r = 13'h0d45;
          default: begin end
        endcase
      end
      12'h692: begin
        out_r = 13'h0d48;
        case (key_hi)
          1'h1: out_r = 13'h0d4a;
          default: begin end
        endcase
      end
      12'h693: begin
        out_r = 13'h0d4d;
      end
      12'h694: begin
        out_r = 13'h0d6d;
        case (key_hi)
          1'h1: out_r = 13'h0d6c;
          default: begin end
        endcase
      end
      12'h695: begin
        out_r = 13'h0d64;
        case (key_hi)
          1'h1: out_r = 13'h0d65;
          default: begin end
        endcase
      end
      12'h696: begin
        out_r = 13'h0d68;
        case (key_hi)
          1'h1: out_r = 13'h0d6a;
          default: begin end
        endcase
      end
      12'h697: begin
        out_r = 13'h0d65;
      end
      12'h698: begin
        out_r = 13'h0d55;
      end
      12'h699: begin
        out_r = 13'h0d5b;
        case (key_hi)
          1'h1: out_r = 13'h0d58;
          default: begin end
        endcase
      end
      12'h69a: begin
        out_r = 13'h0d55;
        case (key_hi)
          1'h1: out_r = 13'h0d54;
          default: begin end
        endcase
      end
      12'h69b: begin
        out_r = 13'h0d53;
      end
      12'h69c: begin
        out_r = 13'h0d60;
        case (key_hi)
          1'h1: out_r = 13'h0d63;
          default: begin end
        endcase
      end
      12'h69d: begin
        out_r = 13'h0d65;
      end
      12'h69e: begin
        out_r = 13'h0d60;
        case (key_hi)
          1'h1: out_r = 13'h0d63;
          default: begin end
        endcase
      end
      12'h69f: begin
        out_r = 13'h0d65;
      end
      12'h6a0: begin
        out_r = 13'h0db6;
        case (key_hi)
          1'h1: out_r = 13'h0db4;
          default: begin end
        endcase
      end
      12'h6a1: begin
        out_r = 13'h0db8;
        case (key_hi)
          1'h1: out_r = 13'h0db9;
          default: begin end
        endcase
      end
      12'h6a2: begin
        out_r = 13'h0db0;
        case (key_hi)
          1'h1: out_r = 13'h0db3;
          default: begin end
        endcase
      end
      12'h6a3: begin
        out_r = 13'h0db8;
      end
      12'h6a4: begin
        out_r = 13'h0d90;
        case (key_hi)
          1'h1: out_r = 13'h0d92;
          default: begin end
        endcase
      end
      12'h6a5: begin
        out_r = 13'h0d98;
        case (key_hi)
          1'h1: out_r = 13'h0d9b;
          default: begin end
        endcase
      end
      12'h6a6: begin
        out_r = 13'h0d95;
      end
      12'h6a7: begin
        out_r = 13'h0d9a;
      end
      12'h6a8: begin
        out_r = 13'h0d80;
        case (key_hi)
          1'h1: out_r = 13'h0d82;
          default: begin end
        endcase
      end
      12'h6a9: begin
        out_r = 13'h0d84;
        case (key_hi)
          1'h1: out_r = 13'h0d85;
          default: begin end
        endcase
      end
      12'h6aa: begin
        out_r = 13'h0d8d;
        case (key_hi)
          1'h1: out_r = 13'h0d8f;
          default: begin end
        endcase
      end
      12'h6ab: begin
        out_r = 13'h0d84;
      end
      12'h6ac: begin
        out_r = 13'h0d92;
        case (key_hi)
          1'h1: out_r = 13'h0d90;
          default: begin end
        endcase
      end
      12'h6ad: begin
        out_r = 13'h0d9f;
        case (key_hi)
          1'h1: out_r = 13'h0d9d;
          default: begin end
        endcase
      end
      12'h6ae: begin
        out_r = 13'h0d92;
        case (key_hi)
          1'h1: out_r = 13'h0d93;
          default: begin end
        endcase
      end
      12'h6af: begin
        out_r = 13'h0d9f;
      end
      12'h6b0: begin
        out_r = 13'h0d55;
        case (key_hi)
          1'h1: out_r = 13'h0d54;
          default: begin end
        endcase
      end
      12'h6b1: begin
        out_r = 13'h0d5a;
        case (key_hi)
          1'h1: out_r = 13'h0d5b;
          default: begin end
        endcase
      end
      12'h6b2: begin
        out_r = 13'h0d55;
        case (key_hi)
          1'h1: out_r = 13'h0d54;
          default: begin end
        endcase
      end
      12'h6b3: begin
        out_r = 13'h0d5b;
      end
      12'h6b4: begin
        out_r = 13'h0d48;
        case (key_hi)
          1'h1: out_r = 13'h0d4a;
          default: begin end
        endcase
      end
      12'h6b5: begin
        out_r = 13'h0d44;
        case (key_hi)
          1'h1: out_r = 13'h0d45;
          default: begin end
        endcase
      end
      12'h6b6: begin
        out_r = 13'h0d42;
        case (key_hi)
          1'h1: out_r = 13'h0d43;
          default: begin end
        endcase
      end
      12'h6b7: begin
        out_r = 13'h0d45;
      end
      12'h6b8: begin
        out_r = 13'h0d55;
        case (key_hi)
          1'h1: out_r = 13'h0d54;
          default: begin end
        endcase
      end
      12'h6b9: begin
        out_r = 13'h0d58;
        case (key_hi)
          1'h1: out_r = 13'h0d5a;
          default: begin end
        endcase
      end
      12'h6ba: begin
        out_r = 13'h0d52;
        case (key_hi)
          1'h1: out_r = 13'h0d53;
          default: begin end
        endcase
      end
      12'h6bb: begin
        out_r = 13'h0d5b;
      end
      12'h6bc: begin
        out_r = 13'h0d7c;
        case (key_hi)
          1'h1: out_r = 13'h0d7f;
          default: begin end
        endcase
      end
      12'h6bd: begin
        out_r = 13'h0d79;
      end
      12'h6be: begin
        out_r = 13'h0d7c;
        case (key_hi)
          1'h1: out_r = 13'h0d7f;
          default: begin end
        endcase
      end
      12'h6bf: begin
        out_r = 13'h0d79;
      end
      12'h6c0: begin
        out_r = 13'h0efd;
        case (key_hi)
          1'h1: out_r = 13'h0eff;
          default: begin end
        endcase
      end
      12'h6c1: begin
        out_r = 13'h0ef8;
        case (key_hi)
          1'h1: out_r = 13'h0ef9;
          default: begin end
        endcase
      end
      12'h6c2: begin
        out_r = 13'h0ef3;
        case (key_hi)
          1'h1: out_r = 13'h0ef0;
          default: begin end
        endcase
      end
      12'h6c3: begin
        out_r = 13'h0ef9;
      end
      12'h6c4: begin
        out_r = 13'h0ee0;
        case (key_hi)
          1'h1: out_r = 13'h0ee2;
          default: begin end
        endcase
      end
      12'h6c5: begin
        out_r = 13'h0eef;
        case (key_hi)
          1'h1: out_r = 13'h0eed;
          default: begin end
        endcase
      end
      12'h6c6: begin
        out_r = 13'h0ee5;
      end
      12'h6c7: begin
        out_r = 13'h0eec;
      end
      12'h6c8: begin
        out_r = 13'h0ed3;
        case (key_hi)
          1'h1: out_r = 13'h0ed0;
          default: begin end
        endcase
      end
      12'h6c9: begin
        out_r = 13'h0ed4;
        case (key_hi)
          1'h1: out_r = 13'h0ed5;
          default: begin end
        endcase
      end
      12'h6ca: begin
        out_r = 13'h0edf;
        case (key_hi)
          1'h1: out_r = 13'h0edc;
          default: begin end
        endcase
      end
      12'h6cb: begin
        out_r = 13'h0ed4;
      end
      12'h6cc: begin
        out_r = 13'h0eef;
        case (key_hi)
          1'h1: out_r = 13'h0eed;
          default: begin end
        endcase
      end
      12'h6cd: begin
        out_r = 13'h0ee2;
        case (key_hi)
          1'h1: out_r = 13'h0ee0;
          default: begin end
        endcase
      end
      12'h6ce: begin
        out_r = 13'h0eef;
        case (key_hi)
          1'h1: out_r = 13'h0eec;
          default: begin end
        endcase
      end
      12'h6cf: begin
        out_r = 13'h0eeb;
      end
      12'h6d0: begin
        out_r = 13'h0e20;
        case (key_hi)
          1'h1: out_r = 13'h0e22;
          default: begin end
        endcase
      end
      12'h6d1: begin
        out_r = 13'h0e24;
        case (key_hi)
          1'h1: out_r = 13'h0e25;
          default: begin end
        endcase
      end
      12'h6d2: begin
        out_r = 13'h0e28;
        case (key_hi)
          1'h1: out_r = 13'h0e2a;
          default: begin end
        endcase
      end
      12'h6d3: begin
        out_r = 13'h0e2d;
      end
      12'h6d4: begin
        out_r = 13'h0e10;
        case (key_hi)
          1'h1: out_r = 13'h0e12;
          default: begin end
        endcase
      end
      12'h6d5: begin
        out_r = 13'h0e1f;
        case (key_hi)
          1'h1: out_r = 13'h0e1d;
          default: begin end
        endcase
      end
      12'h6d6: begin
        out_r = 13'h0e15;
        case (key_hi)
          1'h1: out_r = 13'h0e14;
          default: begin end
        endcase
      end
      12'h6d7: begin
        out_r = 13'h0e1c;
      end
      12'h6d8: begin
        out_r = 13'h0e08;
        case (key_hi)
          1'h1: out_r = 13'h0e0a;
          default: begin end
        endcase
      end
      12'h6d9: begin
        out_r = 13'h0e04;
        case (key_hi)
          1'h1: out_r = 13'h0e05;
          default: begin end
        endcase
      end
      12'h6da: begin
        out_r = 13'h0e0f;
        case (key_hi)
          1'h1: out_r = 13'h0e0d;
          default: begin end
        endcase
      end
      12'h6db: begin
        out_r = 13'h0e03;
      end
      12'h6dc: begin
        out_r = 13'h0e14;
        case (key_hi)
          1'h1: out_r = 13'h0e15;
          default: begin end
        endcase
      end
      12'h6dd: begin
        out_r = 13'h0e1a;
        case (key_hi)
          1'h1: out_r = 13'h0e18;
          default: begin end
        endcase
      end
      12'h6de: begin
        out_r = 13'h0e14;
        case (key_hi)
          1'h1: out_r = 13'h0e15;
          default: begin end
        endcase
      end
      12'h6df: begin
        out_r = 13'h0e12;
      end
      12'h6e0: begin
        out_r = 13'h0efd;
        case (key_hi)
          1'h1: out_r = 13'h0eff;
          default: begin end
        endcase
      end
      12'h6e1: begin
        out_r = 13'h0ef8;
        case (key_hi)
          1'h1: out_r = 13'h0ef9;
          default: begin end
        endcase
      end
      12'h6e2: begin
        out_r = 13'h0ef3;
        case (key_hi)
          1'h1: out_r = 13'h0ef0;
          default: begin end
        endcase
      end
      12'h6e3: begin
        out_r = 13'h0ef9;
      end
      12'h6e4: begin
        out_r = 13'h0ee4;
        case (key_hi)
          1'h1: out_r = 13'h0ee5;
          default: begin end
        endcase
      end
      12'h6e5: begin
        out_r = 13'h0ee8;
        case (key_hi)
          1'h1: out_r = 13'h0eea;
          default: begin end
        endcase
      end
      12'h6e6: begin
        out_r = 13'h0ee3;
        case (key_hi)
          1'h1: out_r = 13'h0ee0;
          default: begin end
        endcase
      end
      12'h6e7: begin
        out_r = 13'h0eea;
      end
      12'h6e8: begin
        out_r = 13'h0ec3;
        case (key_hi)
          1'h1: out_r = 13'h0ec0;
          default: begin end
        endcase
      end
      12'h6e9: begin
        out_r = 13'h0ec5;
      end
      12'h6ea: begin
        out_r = 13'h0ecf;
        case (key_hi)
          1'h1: out_r = 13'h0ecc;
          default: begin end
        endcase
      end
      12'h6eb: begin
        out_r = 13'h0ec4;
      end
      12'h6ec: begin
        out_r = 13'h0eef;
        case (key_hi)
          1'h1: out_r = 13'h0eed;
          default: begin end
        endcase
      end
      12'h6ed: begin
        out_r = 13'h0ee2;
        case (key_hi)
          1'h1: out_r = 13'h0ee0;
          default: begin end
        endcase
      end
      12'h6ee: begin
        out_r = 13'h0eef;
        case (key_hi)
          1'h1: out_r = 13'h0eec;
          default: begin end
        endcase
      end
      12'h6ef: begin
        out_r = 13'h0eeb;
      end
      12'h6f0: begin
        out_r = 13'h0eaf;
        case (key_hi)
          1'h1: out_r = 13'h0eac;
          default: begin end
        endcase
      end
      12'h6f1: begin
        out_r = 13'h0ea4;
        case (key_hi)
          1'h1: out_r = 13'h0ea5;
          default: begin end
        endcase
      end
      12'h6f2: begin
        out_r = 13'h0eab;
        case (key_hi)
          1'h1: out_r = 13'h0ea8;
          default: begin end
        endcase
      end
      12'h6f3: begin
        out_r = 13'h0ea2;
      end
      12'h6f4: begin
        out_r = 13'h0ebd;
        case (key_hi)
          1'h1: out_r = 13'h0ebf;
          default: begin end
        endcase
      end
      12'h6f5: begin
        out_r = 13'h0eb8;
        case (key_hi)
          1'h1: out_r = 13'h0eb9;
          default: begin end
        endcase
      end
      12'h6f6: begin
        out_r = 13'h0eb4;
        case (key_hi)
          1'h1: out_r = 13'h0eb7;
          default: begin end
        endcase
      end
      12'h6f7: begin
        out_r = 13'h0eb9;
      end
      12'h6f8: begin
        out_r = 13'h0eaf;
        case (key_hi)
          1'h1: out_r = 13'h0eac;
          default: begin end
        endcase
      end
      12'h6f9: begin
        out_r = 13'h0ea4;
        case (key_hi)
          1'h1: out_r = 13'h0ea5;
          default: begin end
        endcase
      end
      12'h6fa: begin
        out_r = 13'h0eab;
        case (key_hi)
          1'h1: out_r = 13'h0eaa;
          default: begin end
        endcase
      end
      12'h6fb: begin
        out_r = 13'h0ea2;
      end
      12'h6fc: begin
        out_r = 13'h0e88;
        case (key_hi)
          1'h1: out_r = 13'h0e8a;
          default: begin end
        endcase
      end
      12'h6fd: begin
        out_r = 13'h0e8c;
        case (key_hi)
          1'h1: out_r = 13'h0e8f;
          default: begin end
        endcase
      end
      12'h6fe: begin
        out_r = 13'h0e88;
        case (key_hi)
          1'h1: out_r = 13'h0e8a;
          default: begin end
        endcase
      end
      12'h6ff: begin
        out_r = 13'h0e82;
      end
      12'h700: begin
        out_r = 13'h0655;
        case (key_hi)
          1'h1: out_r = 13'h0755;
          default: begin end
        endcase
      end
      12'h701: begin
        out_r = 13'h055b;
        case (key_hi)
          1'h1: out_r = 13'h095f;
          default: begin end
        endcase
      end
      12'h702: begin
        out_r = 13'h0755;
        case (key_hi)
          1'h1: out_r = 13'h0574;
          default: begin end
        endcase
      end
      12'h703: begin
        out_r = 13'h06a6;
      end
      12'h704: begin
        out_r = 13'h0563;
        case (key_hi)
          1'h1: out_r = 13'h0662;
          default: begin end
        endcase
      end
      12'h705: begin
        out_r = 13'h056d;
        case (key_hi)
          1'h1: out_r = 13'h05e5;
          default: begin end
        endcase
      end
      12'h706: begin
        out_r = 13'h0515;
        case (key_hi)
          1'h1: out_r = 13'h0768;
          default: begin end
        endcase
      end
      12'h707: begin
        out_r = 13'h091f;
      end
      12'h708: begin
        out_r = 13'h0755;
        case (key_hi)
          1'h1: out_r = 13'h05d5;
          default: begin end
        endcase
      end
      12'h709: begin
        out_r = 13'h095f;
        case (key_hi)
          1'h1: out_r = 13'h0a58;
          default: begin end
        endcase
      end
      12'h70a: begin
        out_r = 13'h0552;
        case (key_hi)
          1'h1: out_r = 13'h0aa3;
          default: begin end
        endcase
      end
      12'h70b: begin
        out_r = 13'h0558;
      end
      12'h70c: begin
        out_r = 13'h0568;
        case (key_hi)
          1'h1: out_r = 13'h0760;
          default: begin end
        endcase
      end
      12'h70d: begin
        out_r = 13'h0545;
        case (key_hi)
          1'h1: out_r = 13'h0544;
          default: begin end
        endcase
      end
      12'h70e: begin
        out_r = 13'h0568;
        case (key_hi)
          1'h1: out_r = 13'h0be3;
          default: begin end
        endcase
      end
      12'h70f: begin
        out_r = 13'h0545;
      end
      12'h710: begin
        out_r = 13'h05af;
        case (key_hi)
          1'h1: out_r = 13'h06ad;
          default: begin end
        endcase
      end
      12'h711: begin
        out_r = 13'h05a4;
        case (key_hi)
          1'h1: out_r = 13'h05c5;
          default: begin end
        endcase
      end
      12'h712: begin
        out_r = 13'h05aa;
        case (key_hi)
          1'h1: out_r = 13'h0adb;
          default: begin end
        endcase
      end
      12'h713: begin
        out_r = 13'h0594;
      end
      12'h714: begin
        out_r = 13'h0592;
        case (key_hi)
          1'h1: out_r = 13'h0510;
          default: begin end
        endcase
      end
      12'h715: begin
        out_r = 13'h059d;
        case (key_hi)
          1'h1: out_r = 13'h09e8;
          default: begin end
        endcase
      end
      12'h716: begin
        out_r = 13'h05f4;
        case (key_hi)
          1'h1: out_r = 13'h0794;
          default: begin end
        endcase
      end
      12'h717: begin
        out_r = 13'h059f;
      end
      12'h718: begin
        out_r = 13'h06cc;
        case (key_hi)
          1'h1: out_r = 13'h094c;
          default: begin end
        endcase
      end
      12'h719: begin
        out_r = 13'h0545;
        case (key_hi)
          1'h1: out_r = 13'h06fd;
          default: begin end
        endcase
      end
      12'h71a: begin
        out_r = 13'h094c;
        case (key_hi)
          1'h1: out_r = 13'h05d2;
          default: begin end
        endcase
      end
      12'h71b: begin
        out_r = 13'h0b93;
      end
      12'h71c: begin
        out_r = 13'h05ec;
        case (key_hi)
          1'h1: out_r = 13'h05b4;
          default: begin end
        endcase
      end
      12'h71d: begin
        out_r = 13'h05e5;
        case (key_hi)
          1'h1: out_r = 13'h079c;
          default: begin end
        endcase
      end
      12'h71e: begin
        out_r = 13'h05ec;
        case (key_hi)
          1'h1: out_r = 13'h05b4;
          default: begin end
        endcase
      end
      12'h71f: begin
        out_r = 13'h0a18;
      end
      12'h720: begin
        out_r = 13'h0755;
        case (key_hi)
          1'h1: out_r = 13'h05d5;
          default: begin end
        endcase
      end
      12'h721: begin
        out_r = 13'h095f;
        case (key_hi)
          1'h1: out_r = 13'h0a58;
          default: begin end
        endcase
      end
      12'h722: begin
        out_r = 13'h05d5;
        case (key_hi)
          1'h1: out_r = 13'h055c;
          default: begin end
        endcase
      end
      12'h723: begin
        out_r = 13'h0a05;
      end
      12'h724: begin
        out_r = 13'h0973;
        case (key_hi)
          1'h1: out_r = 13'h0772;
          default: begin end
        endcase
      end
      12'h725: begin
        out_r = 13'h0544;
      end
      12'h726: begin
        out_r = 13'h09cc;
        case (key_hi)
          1'h1: out_r = 13'h0515;
          default: begin end
        endcase
      end
      12'h727: begin
        out_r = 13'h077a;
      end
      12'h728: begin
        out_r = 13'h0548;
        case (key_hi)
          1'h1: out_r = 13'h054a;
          default: begin end
        endcase
      end
      12'h729: begin
        out_r = 13'h0544;
        case (key_hi)
          1'h1: out_r = 13'h0545;
          default: begin end
        endcase
      end
      12'h72a: begin
        out_r = 13'h077f;
        case (key_hi)
          1'h1: out_r = 13'h0670;
          default: begin end
        endcase
      end
      12'h72b: begin
        out_r = 13'h0a03;
      end
      12'h72c: begin
        out_r = 13'h05f0;
        case (key_hi)
          1'h1: out_r = 13'h0514;
          default: begin end
        endcase
      end
      12'h72d: begin
        out_r = 13'h0544;
        case (key_hi)
          1'h1: out_r = 13'h06b9;
          default: begin end
        endcase
      end
      12'h72e: begin
        out_r = 13'h05f0;
        case (key_hi)
          1'h1: out_r = 13'h05ed;
          default: begin end
        endcase
      end
      12'h72f: begin
        out_r = 13'h0544;
      end
      12'h730: begin
        out_r = 13'h0528;
        case (key_hi)
          1'h1: out_r = 13'h052a;
          default: begin end
        endcase
      end
      12'h731: begin
        out_r = 13'h0524;
        case (key_hi)
          1'h1: out_r = 13'h0539;
          default: begin end
        endcase
      end
      12'h732: begin
        out_r = 13'h0522;
        case (key_hi)
          1'h1: out_r = 13'h0a23;
          default: begin end
        endcase
      end
      12'h733: begin
        out_r = 13'h0645;
      end
      12'h734: begin
        out_r = 13'h0514;
        case (key_hi)
          1'h1: out_r = 13'h05e7;
          default: begin end
        endcase
      end
      12'h735: begin
        out_r = 13'h055d;
      end
      12'h736: begin
        out_r = 13'h0512;
        case (key_hi)
          1'h1: out_r = 13'h0ba3;
          default: begin end
        endcase
      end
      12'h737: begin
        out_r = 13'h09e7;
      end
      12'h738: begin
        out_r = 13'h0528;
        case (key_hi)
          1'h1: out_r = 13'h052a;
          default: begin end
        endcase
      end
      12'h739: begin
        out_r = 13'h0522;
        case (key_hi)
          1'h1: out_r = 13'h0504;
          default: begin end
        endcase
      end
      12'h73a: begin
        out_r = 13'h0a9d;
        case (key_hi)
          1'h1: out_r = 13'h0573;
          default: begin end
        endcase
      end
      12'h73b: begin
        out_r = 13'h0645;
      end
      12'h73c: begin
        out_r = 13'h0514;
        case (key_hi)
          1'h1: out_r = 13'h0995;
          default: begin end
        endcase
      end
      12'h73d: begin
        out_r = 13'h061a;
        case (key_hi)
          1'h1: out_r = 13'h091c;
          default: begin end
        endcase
      end
      12'h73e: begin
        out_r = 13'h0514;
        case (key_hi)
          1'h1: out_r = 13'h0995;
          default: begin end
        endcase
      end
      12'h73f: begin
        out_r = 13'h0512;
      end
      12'h740: begin
        out_r = 13'h0b43;
        case (key_hi)
          1'h1: out_r = 13'h077f;
          default: begin end
        endcase
      end
      12'h741: begin
        out_r = 13'h0684;
        case (key_hi)
          1'h1: out_r = 13'h0765;
          default: begin end
        endcase
      end
      12'h742: begin
        out_r = 13'h06c8;
        case (key_hi)
          1'h1: out_r = 13'h096b;
          default: begin end
        endcase
      end
      12'h743: begin
        out_r = 13'h0779;
      end
      12'h744: begin
        out_r = 13'h0690;
        case (key_hi)
          1'h1: out_r = 13'h0692;
          default: begin end
        endcase
      end
      12'h745: begin
        out_r = 13'h06ed;
        case (key_hi)
          1'h1: out_r = 13'h0a9f;
          default: begin end
        endcase
      end
      12'h746: begin
        out_r = 13'h0755;
        case (key_hi)
          1'h1: out_r = 13'h07e4;
          default: begin end
        endcase
      end
      12'h747: begin
        out_r = 13'h0a1c;
      end
      12'h748: begin
        out_r = 13'h0aac;
        case (key_hi)
          1'h1: out_r = 13'h062f;
          default: begin end
        endcase
      end
      12'h749: begin
        out_r = 13'h06a4;
        case (key_hi)
          1'h1: out_r = 13'h0779;
          default: begin end
        endcase
      end
      12'h74a: begin
        out_r = 13'h074f;
        case (key_hi)
          1'h1: out_r = 13'h06a0;
          default: begin end
        endcase
      end
      12'h74b: begin
        out_r = 13'h0705;
      end
      12'h74c: begin
        out_r = 13'h0692;
        case (key_hi)
          1'h1: out_r = 13'h0ae5;
          default: begin end
        endcase
      end
      12'h74d: begin
        out_r = 13'h0be8;
        case (key_hi)
          1'h1: out_r = 13'h0718;
          default: begin end
        endcase
      end
      12'h74e: begin
        out_r = 13'h0692;
        case (key_hi)
          1'h1: out_r = 13'h0be3;
          default: begin end
        endcase
      end
      12'h74f: begin
        out_r = 13'h06ed;
      end
      12'h750: begin
        out_r = 13'h0640;
        case (key_hi)
          1'h1: out_r = 13'h0642;
          default: begin end
        endcase
      end
      12'h751: begin
        out_r = 13'h0644;
        case (key_hi)
          1'h1: out_r = 13'h0785;
          default: begin end
        endcase
      end
      12'h752: begin
        out_r = 13'h0648;
        case (key_hi)
          1'h1: out_r = 13'h064a;
          default: begin end
        endcase
      end
      12'h753: begin
        out_r = 13'h078d;
      end
      12'h754: begin
        out_r = 13'h0672;
        case (key_hi)
          1'h1: out_r = 13'h0ba3;
          default: begin end
        endcase
      end
      12'h755: begin
        out_r = 13'h0678;
        case (key_hi)
          1'h1: out_r = 13'h0665;
          default: begin end
        endcase
      end
      12'h756: begin
        out_r = 13'h0ba3;
      end
      12'h757: begin
        out_r = 13'h07b9;
      end
      12'h758: begin
        out_r = 13'h0652;
        case (key_hi)
          1'h1: out_r = 13'h0790;
          default: begin end
        endcase
      end
      12'h759: begin
        out_r = 13'h065a;
        case (key_hi)
          1'h1: out_r = 13'h0bbb;
          default: begin end
        endcase
      end
      12'h75a: begin
        out_r = 13'h0657;
        case (key_hi)
          1'h1: out_r = 13'h0654;
          default: begin end
        endcase
      end
      12'h75b: begin
        out_r = 13'h0bbb;
      end
      12'h75c: begin
        out_r = 13'h06a3;
        case (key_hi)
          1'h1: out_r = 13'h07bf;
          default: begin end
        endcase
      end
      12'h75d: begin
        out_r = 13'h07b9;
        case (key_hi)
          1'h1: out_r = 13'h0665;
          default: begin end
        endcase
      end
      12'h75e: begin
        out_r = 13'h06a3;
        case (key_hi)
          1'h1: out_r = 13'h07bf;
          default: begin end
        endcase
      end
      12'h75f: begin
        out_r = 13'h0679;
      end
      12'h760: begin
        out_r = 13'h062d;
        case (key_hi)
          1'h1: out_r = 13'h0a2c;
          default: begin end
        endcase
      end
      12'h761: begin
        out_r = 13'h0624;
        case (key_hi)
          1'h1: out_r = 13'h0725;
          default: begin end
        endcase
      end
      12'h762: begin
        out_r = 13'h070c;
        case (key_hi)
          1'h1: out_r = 13'h0bc0;
          default: begin end
        endcase
      end
      12'h763: begin
        out_r = 13'h0738;
      end
      12'h764: begin
        out_r = 13'h0610;
        case (key_hi)
          1'h1: out_r = 13'h0612;
          default: begin end
        endcase
      end
      12'h765: begin
        out_r = 13'h05ec;
        case (key_hi)
          1'h1: out_r = 13'h071b;
          default: begin end
        endcase
      end
      12'h766: begin
        out_r = 13'h0715;
        case (key_hi)
          1'h1: out_r = 13'h0614;
          default: begin end
        endcase
      end
      12'h767: begin
        out_r = 13'h06eb;
      end
      12'h768: begin
        out_r = 13'h063d;
        case (key_hi)
          1'h1: out_r = 13'h06b6;
          default: begin end
        endcase
      end
      12'h769: begin
        out_r = 13'h0638;
        case (key_hi)
          1'h1: out_r = 13'h0739;
          default: begin end
        endcase
      end
      12'h76a: begin
        out_r = 13'h0b5d;
        case (key_hi)
          1'h1: out_r = 13'h0592;
          default: begin end
        endcase
      end
      12'h76b: begin
        out_r = 13'h0639;
      end
      12'h76c: begin
        out_r = 13'h0b4c;
        case (key_hi)
          1'h1: out_r = 13'h0695;
          default: begin end
        endcase
      end
      12'h76d: begin
        out_r = 13'h0612;
        case (key_hi)
          1'h1: out_r = 13'h0710;
          default: begin end
        endcase
      end
      12'h76e: begin
        out_r = 13'h0b4c;
        case (key_hi)
          1'h1: out_r = 13'h0694;
          default: begin end
        endcase
      end
      12'h76f: begin
        out_r = 13'h066b;
      end
      12'h770: begin
        out_r = 13'h0650;
        case (key_hi)
          1'h1: out_r = 13'h0652;
          default: begin end
        endcase
      end
      12'h771: begin
        out_r = 13'h065b;
        case (key_hi)
          1'h1: out_r = 13'h0b83;
          default: begin end
        endcase
      end
      12'h772: begin
        out_r = 13'h0795;
      end
      12'h773: begin
        out_r = 13'h0b9f;
      end
      12'h774: begin
        out_r = 13'h0ba3;
        case (key_hi)
          1'h1: out_r = 13'h0568;
          default: begin end
        endcase
      end
      12'h775: begin
        out_r = 13'h0664;
        case (key_hi)
          1'h1: out_r = 13'h0bbb;
          default: begin end
        endcase
      end
      12'h776: begin
        out_r = 13'h0ba3;
        case (key_hi)
          1'h1: out_r = 13'h0563;
          default: begin end
        endcase
      end
      12'h777: begin
        out_r = 13'h0665;
      end
      12'h778: begin
        out_r = 13'h0650;
        case (key_hi)
          1'h1: out_r = 13'h0652;
          default: begin end
        endcase
      end
      12'h779: begin
        out_r = 13'h065b;
        case (key_hi)
          1'h1: out_r = 13'h0b98;
          default: begin end
        endcase
      end
      12'h77a: begin
        out_r = 13'h0795;
        case (key_hi)
          1'h1: out_r = 13'h064f;
          default: begin end
        endcase
      end
      12'h77b: begin
        out_r = 13'h0b9f;
      end
      12'h77c: begin
        out_r = 13'h0648;
        case (key_hi)
          1'h1: out_r = 13'h064a;
          default: begin end
        endcase
      end
      12'h77d: begin
        out_r = 13'h0b8c;
        case (key_hi)
          1'h1: out_r = 13'h064f;
          default: begin end
        endcase
      end
      12'h77e: begin
        out_r = 13'h0648;
        case (key_hi)
          1'h1: out_r = 13'h064a;
          default: begin end
        endcase
      end
      12'h77f: begin
        out_r = 13'h0642;
      end
      12'h780: begin
        out_r = 13'h0655;
        case (key_hi)
          1'h1: out_r = 13'h0755;
          default: begin end
        endcase
      end
      12'h781: begin
        out_r = 13'h055b;
        case (key_hi)
          1'h1: out_r = 13'h095f;
          default: begin end
        endcase
      end
      12'h782: begin
        out_r = 13'h0755;
        case (key_hi)
          1'h1: out_r = 13'h0574;
          default: begin end
        endcase
      end
      12'h783: begin
        out_r = 13'h06a6;
      end
      12'h784: begin
        out_r = 13'h0563;
        case (key_hi)
          1'h1: out_r = 13'h0662;
          default: begin end
        endcase
      end
      12'h785: begin
        out_r = 13'h056d;
        case (key_hi)
          1'h1: out_r = 13'h05e5;
          default: begin end
        endcase
      end
      12'h786: begin
        out_r = 13'h0515;
        case (key_hi)
          1'h1: out_r = 13'h0768;
          default: begin end
        endcase
      end
      12'h787: begin
        out_r = 13'h091f;
      end
      12'h788: begin
        out_r = 13'h0755;
        case (key_hi)
          1'h1: out_r = 13'h05d5;
          default: begin end
        endcase
      end
      12'h789: begin
        out_r = 13'h095f;
        case (key_hi)
          1'h1: out_r = 13'h0a58;
          default: begin end
        endcase
      end
      12'h78a: begin
        out_r = 13'h0552;
        case (key_hi)
          1'h1: out_r = 13'h0aa3;
          default: begin end
        endcase
      end
      12'h78b: begin
        out_r = 13'h0558;
      end
      12'h78c: begin
        out_r = 13'h0568;
        case (key_hi)
          1'h1: out_r = 13'h0760;
          default: begin end
        endcase
      end
      12'h78d: begin
        out_r = 13'h0545;
        case (key_hi)
          1'h1: out_r = 13'h0544;
          default: begin end
        endcase
      end
      12'h78e: begin
        out_r = 13'h0568;
        case (key_hi)
          1'h1: out_r = 13'h0be3;
          default: begin end
        endcase
      end
      12'h78f: begin
        out_r = 13'h0545;
      end
      12'h790: begin
        out_r = 13'h05af;
        case (key_hi)
          1'h1: out_r = 13'h06ad;
          default: begin end
        endcase
      end
      12'h791: begin
        out_r = 13'h05a4;
        case (key_hi)
          1'h1: out_r = 13'h05c5;
          default: begin end
        endcase
      end
      12'h792: begin
        out_r = 13'h05aa;
        case (key_hi)
          1'h1: out_r = 13'h0adb;
          default: begin end
        endcase
      end
      12'h793: begin
        out_r = 13'h0594;
      end
      12'h794: begin
        out_r = 13'h0564;
        case (key_hi)
          1'h1: out_r = 13'h07bd;
          default: begin end
        endcase
      end
      12'h795: begin
        out_r = 13'h059d;
        case (key_hi)
          1'h1: out_r = 13'h059a;
          default: begin end
        endcase
      end
      12'h796: begin
        out_r = 13'h098b;
        case (key_hi)
          1'h1: out_r = 13'h05e2;
          default: begin end
        endcase
      end
      12'h797: begin
        out_r = 13'h0595;
      end
      12'h798: begin
        out_r = 13'h06cc;
        case (key_hi)
          1'h1: out_r = 13'h0b83;
          default: begin end
        endcase
      end
      12'h799: begin
        out_r = 13'h0505;
        case (key_hi)
          1'h1: out_r = 13'h0ad9;
          default: begin end
        endcase
      end
      12'h79a: begin
        out_r = 13'h095c;
        case (key_hi)
          1'h1: out_r = 13'h09dc;
          default: begin end
        endcase
      end
      12'h79b: begin
        out_r = 13'h0522;
      end
      12'h79c: begin
        out_r = 13'h05ec;
        case (key_hi)
          1'h1: out_r = 13'h0715;
          default: begin end
        endcase
      end
      12'h79d: begin
        out_r = 13'h0595;
        case (key_hi)
          1'h1: out_r = 13'h079c;
          default: begin end
        endcase
      end
      12'h79e: begin
        out_r = 13'h05ec;
        case (key_hi)
          1'h1: out_r = 13'h0715;
          default: begin end
        endcase
      end
      12'h79f: begin
        out_r = 13'h059f;
      end
      12'h7a0: begin
        out_r = 13'h0755;
        case (key_hi)
          1'h1: out_r = 13'h05d5;
          default: begin end
        endcase
      end
      12'h7a1: begin
        out_r = 13'h095f;
        case (key_hi)
          1'h1: out_r = 13'h0a58;
          default: begin end
        endcase
      end
      12'h7a2: begin
        out_r = 13'h05d5;
        case (key_hi)
          1'h1: out_r = 13'h055c;
          default: begin end
        endcase
      end
      12'h7a3: begin
        out_r = 13'h0a05;
      end
      12'h7a4: begin
        out_r = 13'h0973;
        case (key_hi)
          1'h1: out_r = 13'h0772;
          default: begin end
        endcase
      end
      12'h7a5: begin
        out_r = 13'h057f;
        case (key_hi)
          1'h1: out_r = 13'h0559;
          default: begin end
        endcase
      end
      12'h7a6: begin
        out_r = 13'h0a5c;
        case (key_hi)
          1'h1: out_r = 13'h0574;
          default: begin end
        endcase
      end
      12'h7a7: begin
        out_r = 13'h0a83;
      end
      12'h7a8: begin
        out_r = 13'h0556;
        case (key_hi)
          1'h1: out_r = 13'h0675;
          default: begin end
        endcase
      end
      12'h7a9: begin
        out_r = 13'h0a58;
        case (key_hi)
          1'h1: out_r = 13'h069c;
          default: begin end
        endcase
      end
      12'h7aa: begin
        out_r = 13'h0575;
        case (key_hi)
          1'h1: out_r = 13'h05d4;
          default: begin end
        endcase
      end
      12'h7ab: begin
        out_r = 13'h0538;
      end
      12'h7ac: begin
        out_r = 13'h05fd;
        case (key_hi)
          1'h1: out_r = 13'h0575;
          default: begin end
        endcase
      end
      12'h7ad: begin
        out_r = 13'h0755;
        case (key_hi)
          1'h1: out_r = 13'h0564;
          default: begin end
        endcase
      end
      12'h7ae: begin
        out_r = 13'h05fd;
        case (key_hi)
          1'h1: out_r = 13'h074f;
          default: begin end
        endcase
      end
      12'h7af: begin
        out_r = 13'h0560;
      end
      12'h7b0: begin
        out_r = 13'h0528;
        case (key_hi)
          1'h1: out_r = 13'h052a;
          default: begin end
        endcase
      end
      12'h7b1: begin
        out_r = 13'h0524;
        case (key_hi)
          1'h1: out_r = 13'h0539;
          default: begin end
        endcase
      end
      12'h7b2: begin
        out_r = 13'h0522;
        case (key_hi)
          1'h1: out_r = 13'h0a23;
          default: begin end
        endcase
      end
      12'h7b3: begin
        out_r = 13'h0645;
      end
      12'h7b4: begin
        out_r = 13'h0514;
        case (key_hi)
          1'h1: out_r = 13'h05e7;
          default: begin end
        endcase
      end
      12'h7b5: begin
        out_r = 13'h055d;
      end
      12'h7b6: begin
        out_r = 13'h0512;
        case (key_hi)
          1'h1: out_r = 13'h0ba3;
          default: begin end
        endcase
      end
      12'h7b7: begin
        out_r = 13'h09e7;
      end
      12'h7b8: begin
        out_r = 13'h0528;
        case (key_hi)
          1'h1: out_r = 13'h052a;
          default: begin end
        endcase
      end
      12'h7b9: begin
        out_r = 13'h0522;
        case (key_hi)
          1'h1: out_r = 13'h0504;
          default: begin end
        endcase
      end
      12'h7ba: begin
        out_r = 13'h0a9d;
        case (key_hi)
          1'h1: out_r = 13'h0573;
          default: begin end
        endcase
      end
      12'h7bb: begin
        out_r = 13'h0645;
      end
      12'h7bc: begin
        out_r = 13'h0514;
        case (key_hi)
          1'h1: out_r = 13'h0995;
          default: begin end
        endcase
      end
      12'h7bd: begin
        out_r = 13'h061a;
        case (key_hi)
          1'h1: out_r = 13'h091c;
          default: begin end
        endcase
      end
      12'h7be: begin
        out_r = 13'h0514;
        case (key_hi)
          1'h1: out_r = 13'h0995;
          default: begin end
        endcase
      end
      12'h7bf: begin
        out_r = 13'h0512;
      end
      12'h7c0: begin
        out_r = 13'h0480;
        case (key_hi)
          1'h1: out_r = 13'h0482;
          default: begin end
        endcase
      end
      12'h7c1: begin
        out_r = 13'h0484;
        case (key_hi)
          1'h1: out_r = 13'h0485;
          default: begin end
        endcase
      end
      12'h7c2: begin
        out_r = 13'h0488;
        case (key_hi)
          1'h1: out_r = 13'h048a;
          default: begin end
        endcase
      end
      12'h7c3: begin
        out_r = 13'h048d;
      end
      12'h7c4: begin
        out_r = 13'h0490;
        case (key_hi)
          1'h1: out_r = 13'h0492;
          default: begin end
        endcase
      end
      12'h7c5: begin
        out_r = 13'h0898;
        case (key_hi)
          1'h1: out_r = 13'h049b;
          default: begin end
        endcase
      end
      12'h7c6: begin
        out_r = 13'h0495;
      end
      12'h7c7: begin
        out_r = 13'h049a;
      end
      12'h7c8: begin
        out_r = 13'h04a0;
        case (key_hi)
          1'h1: out_r = 13'h04a2;
          default: begin end
        endcase
      end
      12'h7c9: begin
        out_r = 13'h04a4;
        case (key_hi)
          1'h1: out_r = 13'h04a5;
          default: begin end
        endcase
      end
      12'h7ca: begin
        out_r = 13'h04a8;
        case (key_hi)
          1'h1: out_r = 13'h04aa;
          default: begin end
        endcase
      end
      12'h7cb: begin
        out_r = 13'h04ad;
      end
      12'h7cc: begin
        out_r = 13'h04b4;
        case (key_hi)
          1'h1: out_r = 13'h04b6;
          default: begin end
        endcase
      end
      12'h7cd: begin
        out_r = 13'h04b9;
        case (key_hi)
          1'h1: out_r = 13'h04b8;
          default: begin end
        endcase
      end
      12'h7ce: begin
        out_r = 13'h04b4;
        case (key_hi)
          1'h1: out_r = 13'h08b7;
          default: begin end
        endcase
      end
      12'h7cf: begin
        out_r = 13'h04b9;
      end
      12'h7d0: begin
        out_r = 13'h04c3;
        case (key_hi)
          1'h1: out_r = 13'h08c0;
          default: begin end
        endcase
      end
      12'h7d1: begin
        out_r = 13'h04c4;
        case (key_hi)
          1'h1: out_r = 13'h04c5;
          default: begin end
        endcase
      end
      12'h7d2: begin
        out_r = 13'h08cb;
        case (key_hi)
          1'h1: out_r = 13'h04c8;
          default: begin end
        endcase
      end
      12'h7d3: begin
        out_r = 13'h04c4;
      end
      12'h7d4: begin
        out_r = 13'h04e0;
        case (key_hi)
          1'h1: out_r = 13'h04e2;
          default: begin end
        endcase
      end
      12'h7d5: begin
        out_r = 13'h04e8;
        case (key_hi)
          1'h1: out_r = 13'h08eb;
          default: begin end
        endcase
      end
      12'h7d6: begin
        out_r = 13'h08ec;
        case (key_hi)
          1'h1: out_r = 13'h04ed;
          default: begin end
        endcase
      end
      12'h7d7: begin
        out_r = 13'h04ea;
      end
      12'h7d8: begin
        out_r = 13'h08f3;
        case (key_hi)
          1'h1: out_r = 13'h04f0;
          default: begin end
        endcase
      end
      12'h7d9: begin
        out_r = 13'h04f8;
        case (key_hi)
          1'h1: out_r = 13'h04f9;
          default: begin end
        endcase
      end
      12'h7da: begin
        out_r = 13'h08f4;
        case (key_hi)
          1'h1: out_r = 13'h04f6;
          default: begin end
        endcase
      end
      12'h7db: begin
        out_r = 13'h04f9;
      end
      12'h7dc: begin
        out_r = 13'h04e4;
        case (key_hi)
          1'h1: out_r = 13'h04e5;
          default: begin end
        endcase
      end
      12'h7dd: begin
        out_r = 13'h08ec;
        case (key_hi)
          1'h1: out_r = 13'h04ef;
          default: begin end
        endcase
      end
      12'h7de: begin
        out_r = 13'h04e4;
        case (key_hi)
          1'h1: out_r = 13'h04e5;
          default: begin end
        endcase
      end
      12'h7df: begin
        out_r = 13'h04e2;
      end
      12'h7e0: begin
        out_r = 13'h0480;
        case (key_hi)
          1'h1: out_r = 13'h0482;
          default: begin end
        endcase
      end
      12'h7e1: begin
        out_r = 13'h0484;
        case (key_hi)
          1'h1: out_r = 13'h0485;
          default: begin end
        endcase
      end
      12'h7e2: begin
        out_r = 13'h0488;
        case (key_hi)
          1'h1: out_r = 13'h048a;
          default: begin end
        endcase
      end
      12'h7e3: begin
        out_r = 13'h048d;
      end
      12'h7e4: begin
        out_r = 13'h0490;
        case (key_hi)
          1'h1: out_r = 13'h0492;
          default: begin end
        endcase
      end
      12'h7e5: begin
        out_r = 13'h049b;
        case (key_hi)
          1'h1: out_r = 13'h0898;
          default: begin end
        endcase
      end
      12'h7e6: begin
        out_r = 13'h0495;
        case (key_hi)
          1'h1: out_r = 13'h0494;
          default: begin end
        endcase
      end
      12'h7e7: begin
        out_r = 13'h049a;
      end
      12'h7e8: begin
        out_r = 13'h04a0;
        case (key_hi)
          1'h1: out_r = 13'h04a2;
          default: begin end
        endcase
      end
      12'h7e9: begin
        out_r = 13'h04a4;
        case (key_hi)
          1'h1: out_r = 13'h04a5;
          default: begin end
        endcase
      end
      12'h7ea: begin
        out_r = 13'h04af;
        case (key_hi)
          1'h1: out_r = 13'h08ac;
          default: begin end
        endcase
      end
      12'h7eb: begin
        out_r = 13'h04a5;
      end
      12'h7ec: begin
        out_r = 13'h04b4;
        case (key_hi)
          1'h1: out_r = 13'h04b6;
          default: begin end
        endcase
      end
      12'h7ed: begin
        out_r = 13'h04b9;
        case (key_hi)
          1'h1: out_r = 13'h04b8;
          default: begin end
        endcase
      end
      12'h7ee: begin
        out_r = 13'h04b4;
        case (key_hi)
          1'h1: out_r = 13'h08b7;
          default: begin end
        endcase
      end
      12'h7ef: begin
        out_r = 13'h04b9;
      end
      12'h7f0: begin
        out_r = 13'h0420;
        case (key_hi)
          1'h1: out_r = 13'h0422;
          default: begin end
        endcase
      end
      12'h7f1: begin
        out_r = 13'h0424;
        case (key_hi)
          1'h1: out_r = 13'h0425;
          default: begin end
        endcase
      end
      12'h7f2: begin
        out_r = 13'h0428;
        case (key_hi)
          1'h1: out_r = 13'h042a;
          default: begin end
        endcase
      end
      12'h7f3: begin
        out_r = 13'h042d;
      end
      12'h7f4: begin
        out_r = 13'h0830;
        case (key_hi)
          1'h1: out_r = 13'h0432;
          default: begin end
        endcase
      end
      12'h7f5: begin
        out_r = 13'h0438;
        case (key_hi)
          1'h1: out_r = 13'h083b;
          default: begin end
        endcase
      end
      12'h7f6: begin
        out_r = 13'h043c;
        case (key_hi)
          1'h1: out_r = 13'h083d;
          default: begin end
        endcase
      end
      12'h7f7: begin
        out_r = 13'h0439;
      end
      12'h7f8: begin
        out_r = 13'h0420;
        case (key_hi)
          1'h1: out_r = 13'h0422;
          default: begin end
        endcase
      end
      12'h7f9: begin
        out_r = 13'h0424;
        case (key_hi)
          1'h1: out_r = 13'h0425;
          default: begin end
        endcase
      end
      12'h7fa: begin
        out_r = 13'h0428;
        case (key_hi)
          1'h1: out_r = 13'h082b;
          default: begin end
        endcase
      end
      12'h7fb: begin
        out_r = 13'h042d;
      end
      12'h7fc: begin
        out_r = 13'h0408;
        case (key_hi)
          1'h1: out_r = 13'h040a;
          default: begin end
        endcase
      end
      12'h7fd: begin
        out_r = 13'h080c;
        case (key_hi)
          1'h1: out_r = 13'h040f;
          default: begin end
        endcase
      end
      12'h7fe: begin
        out_r = 13'h0408;
        case (key_hi)
          1'h1: out_r = 13'h040a;
          default: begin end
        endcase
      end
      12'h7ff: begin
        out_r = 13'h0402;
      end
      12'h800: begin
        out_r = 13'h0001;
        case (key_hi)
          1'h1: out_r = 13'h0003;
          default: begin end
        endcase
      end
      12'h801: begin
        out_r = 13'h0006;
      end
      12'h802: begin
        out_r = 13'h0009;
        case (key_hi)
          1'h1: out_r = 13'h000b;
          default: begin end
        endcase
      end
      12'h803: begin
        out_r = 13'h000e;
      end
      12'h804: begin
        out_r = 13'h0011;
        case (key_hi)
          1'h1: out_r = 13'h0013;
          default: begin end
        endcase
      end
      12'h805: begin
        out_r = 13'h0019;
      end
      12'h806: begin
        out_r = 13'h0016;
        case (key_hi)
          1'h1: out_r = 13'h0014;
          default: begin end
        endcase
      end
      12'h807: begin
        out_r = 13'h0019;
      end
      12'h808: begin
        out_r = 13'h0021;
        case (key_hi)
          1'h1: out_r = 13'h0023;
          default: begin end
        endcase
      end
      12'h809: begin
        out_r = 13'h0026;
      end
      12'h80a: begin
        out_r = 13'h0029;
        case (key_hi)
          1'h1: out_r = 13'h002b;
          default: begin end
        endcase
      end
      12'h80b: begin
        out_r = 13'h002e;
      end
      12'h80c: begin
        out_r = 13'h0035;
      end
      12'h80d: begin
        out_r = 13'h003a;
      end
      12'h80e: begin
        out_r = 13'h0035;
      end
      12'h80f: begin
        out_r = 13'h003b;
        case (key_hi)
          1'h1: out_r = 13'h0038;
          default: begin end
        endcase
      end
      12'h810: begin
        out_r = 13'h0041;
        case (key_hi)
          1'h1: out_r = 13'h0043;
          default: begin end
        endcase
      end
      12'h811: begin
        out_r = 13'h0046;
      end
      12'h812: begin
        out_r = 13'h0049;
        case (key_hi)
          1'h1: out_r = 13'h004b;
          default: begin end
        endcase
      end
      12'h813: begin
        out_r = 13'h004e;
      end
      12'h814: begin
        out_r = 13'h0061;
      end
      12'h815: begin
        out_r = 13'h0067;
      end
      12'h816: begin
        out_r = 13'h006e;
      end
      12'h817: begin
        out_r = 13'h0066;
        case (key_hi)
          1'h1: out_r = 13'h0064;
          default: begin end
        endcase
      end
      12'h818: begin
        out_r = 13'h0056;
        case (key_hi)
          1'h1: out_r = 13'h0054;
          default: begin end
        endcase
      end
      12'h819: begin
        out_r = 13'h0059;
      end
      12'h81a: begin
        out_r = 13'h0057;
      end
      12'h81b: begin
        out_r = 13'h0050;
        case (key_hi)
          1'h1: out_r = 13'h0051;
          default: begin end
        endcase
      end
      12'h81c: begin
        out_r = 13'h0069;
      end
      12'h81d: begin
        out_r = 13'h0067;
      end
      12'h81e: begin
        out_r = 13'h0069;
      end
      12'h81f: begin
        out_r = 13'h0066;
        case (key_hi)
          1'h1: out_r = 13'h0064;
          default: begin end
        endcase
      end
      12'h820: begin
        out_r = 13'h0081;
        case (key_hi)
          1'h1: out_r = 13'h0083;
          default: begin end
        endcase
      end
      12'h821: begin
        out_r = 13'h0086;
      end
      12'h822: begin
        out_r = 13'h0089;
        case (key_hi)
          1'h1: out_r = 13'h008b;
          default: begin end
        endcase
      end
      12'h823: begin
        out_r = 13'h008e;
      end
      12'h824: begin
        out_r = 13'h0091;
        case (key_hi)
          1'h1: out_r = 13'h0093;
          default: begin end
        endcase
      end
      12'h825: begin
        out_r = 13'h0099;
      end
      12'h826: begin
        out_r = 13'h0096;
        case (key_hi)
          1'h1: out_r = 13'h0094;
          default: begin end
        endcase
      end
      12'h827: begin
        out_r = 13'h0099;
      end
      12'h828: begin
        out_r = 13'h00a1;
        case (key_hi)
          1'h1: out_r = 13'h00a3;
          default: begin end
        endcase
      end
      12'h829: begin
        out_r = 13'h00a6;
      end
      12'h82a: begin
        out_r = 13'h00a9;
        case (key_hi)
          1'h1: out_r = 13'h00ab;
          default: begin end
        endcase
      end
      12'h82b: begin
        out_r = 13'h00ae;
      end
      12'h82c: begin
        out_r = 13'h00b5;
      end
      12'h82d: begin
        out_r = 13'h00ba;
      end
      12'h82e: begin
        out_r = 13'h00b5;
      end
      12'h82f: begin
        out_r = 13'h00bb;
        case (key_hi)
          1'h1: out_r = 13'h00b8;
          default: begin end
        endcase
      end
      12'h830: begin
        out_r = 13'h00d1;
      end
      12'h831: begin
        out_r = 13'h00d6;
      end
      12'h832: begin
        out_r = 13'h00d9;
      end
      12'h833: begin
        out_r = 13'h00d4;
        case (key_hi)
          1'h1: out_r = 13'h00d7;
          default: begin end
        endcase
      end
      12'h834: begin
        out_r = 13'h00e6;
      end
      12'h835: begin
        out_r = 13'h00e9;
      end
      12'h836: begin
        out_r = 13'h00e1;
        case (key_hi)
          1'h1: out_r = 13'h00e0;
          default: begin end
        endcase
      end
      12'h837: begin
        out_r = 13'h00eb;
        case (key_hi)
          1'h1: out_r = 13'h00e8;
          default: begin end
        endcase
      end
      12'h838: begin
        out_r = 13'h00d1;
      end
      12'h839: begin
        out_r = 13'h00d6;
      end
      12'h83a: begin
        out_r = 13'h00de;
      end
      12'h83b: begin
        out_r = 13'h00d4;
        case (key_hi)
          1'h1: out_r = 13'h00d7;
          default: begin end
        endcase
      end
      12'h83c: begin
        out_r = 13'h00e7;
      end
      12'h83d: begin
        out_r = 13'h00ee;
      end
      12'h83e: begin
        out_r = 13'h00e7;
      end
      12'h83f: begin
        out_r = 13'h00e3;
        case (key_hi)
          1'h1: out_r = 13'h00e0;
          default: begin end
        endcase
      end
      12'h840: begin
        out_r = 13'h0101;
        case (key_hi)
          1'h1: out_r = 13'h0103;
          default: begin end
        endcase
      end
      12'h841: begin
        out_r = 13'h0106;
      end
      12'h842: begin
        out_r = 13'h0109;
        case (key_hi)
          1'h1: out_r = 13'h010b;
          default: begin end
        endcase
      end
      12'h843: begin
        out_r = 13'h010e;
      end
      12'h844: begin
        out_r = 13'h0111;
        case (key_hi)
          1'h1: out_r = 13'h0113;
          default: begin end
        endcase
      end
      12'h845: begin
        out_r = 13'h0119;
      end
      12'h846: begin
        out_r = 13'h0116;
        case (key_hi)
          1'h1: out_r = 13'h0114;
          default: begin end
        endcase
      end
      12'h847: begin
        out_r = 13'h0119;
      end
      12'h848: begin
        out_r = 13'h0121;
        case (key_hi)
          1'h1: out_r = 13'h0123;
          default: begin end
        endcase
      end
      12'h849: begin
        out_r = 13'h0126;
      end
      12'h84a: begin
        out_r = 13'h0129;
        case (key_hi)
          1'h1: out_r = 13'h012b;
          default: begin end
        endcase
      end
      12'h84b: begin
        out_r = 13'h012e;
      end
      12'h84c: begin
        out_r = 13'h0135;
      end
      12'h84d: begin
        out_r = 13'h013a;
      end
      12'h84e: begin
        out_r = 13'h0135;
      end
      12'h84f: begin
        out_r = 13'h013b;
        case (key_hi)
          1'h1: out_r = 13'h0138;
          default: begin end
        endcase
      end
      12'h850: begin
        out_r = 13'h0181;
      end
      12'h851: begin
        out_r = 13'h0186;
      end
      12'h852: begin
        out_r = 13'h0189;
      end
      12'h853: begin
        out_r = 13'h0186;
      end
      12'h854: begin
        out_r = 13'h0191;
        case (key_hi)
          1'h1: out_r = 13'h0193;
          default: begin end
        endcase
      end
      12'h855: begin
        out_r = 13'h019e;
      end
      12'h856: begin
        out_r = 13'h0196;
      end
      12'h857: begin
        out_r = 13'h019e;
      end
      12'h858: begin
        out_r = 13'h01b1;
      end
      12'h859: begin
        out_r = 13'h01ba;
      end
      12'h85a: begin
        out_r = 13'h01b5;
      end
      12'h85b: begin
        out_r = 13'h01b8;
        case (key_hi)
          1'h1: out_r = 13'h01bb;
          default: begin end
        endcase
      end
      12'h85c: begin
        out_r = 13'h0197;
      end
      12'h85d: begin
        out_r = 13'h0199;
      end
      12'h85e: begin
        out_r = 13'h0197;
      end
      12'h85f: begin
        out_r = 13'h0193;
        case (key_hi)
          1'h1: out_r = 13'h0190;
          default: begin end
        endcase
      end
      12'h860: begin
        out_r = 13'h0156;
        case (key_hi)
          1'h1: out_r = 13'h0154;
          default: begin end
        endcase
      end
      12'h861: begin
        out_r = 13'h0159;
      end
      12'h862: begin
        out_r = 13'h0157;
      end
      12'h863: begin
        out_r = 13'h0151;
      end
      12'h864: begin
        out_r = 13'h016e;
      end
      12'h865: begin
        out_r = 13'h0166;
      end
      12'h866: begin
        out_r = 13'h0161;
      end
      12'h867: begin
        out_r = 13'h0166;
      end
      12'h868: begin
        out_r = 13'h0157;
        case (key_hi)
          1'h1: out_r = 13'h0154;
          default: begin end
        endcase
      end
      12'h869: begin
        out_r = 13'h015e;
      end
      12'h86a: begin
        out_r = 13'h0151;
        case (key_hi)
          1'h1: out_r = 13'h0150;
          default: begin end
        endcase
      end
      12'h86b: begin
        out_r = 13'h015e;
      end
      12'h86c: begin
        out_r = 13'h014e;
      end
      12'h86d: begin
        out_r = 13'h0141;
      end
      12'h86e: begin
        out_r = 13'h014e;
      end
      12'h86f: begin
        out_r = 13'h0146;
        case (key_hi)
          1'h1: out_r = 13'h0144;
          default: begin end
        endcase
      end
      12'h870: begin
        out_r = 13'h01a1;
      end
      12'h871: begin
        out_r = 13'h01a6;
      end
      12'h872: begin
        out_r = 13'h01a9;
      end
      12'h873: begin
        out_r = 13'h01a6;
      end
      12'h874: begin
        out_r = 13'h0196;
      end
      12'h875: begin
        out_r = 13'h019e;
      end
      12'h876: begin
        out_r = 13'h0196;
      end
      12'h877: begin
        out_r = 13'h019e;
      end
      12'h878: begin
        out_r = 13'h01a1;
      end
      12'h879: begin
        out_r = 13'h01a6;
      end
      12'h87a: begin
        out_r = 13'h01a9;
      end
      12'h87b: begin
        out_r = 13'h01a6;
      end
      12'h87c: begin
        out_r = 13'h0196;
      end
      12'h87d: begin
        out_r = 13'h0199;
      end
      12'h87e: begin
        out_r = 13'h0196;
      end
      12'h87f: begin
        out_r = 13'h0193;
        case (key_hi)
          1'h1: out_r = 13'h0190;
          default: begin end
        endcase
      end
      12'h880: begin
        out_r = 13'h0201;
        case (key_hi)
          1'h1: out_r = 13'h0203;
          default: begin end
        endcase
      end
      12'h881: begin
        out_r = 13'h0206;
      end
      12'h882: begin
        out_r = 13'h0209;
        case (key_hi)
          1'h1: out_r = 13'h020b;
          default: begin end
        endcase
      end
      12'h883: begin
        out_r = 13'h020e;
      end
      12'h884: begin
        out_r = 13'h0211;
        case (key_hi)
          1'h1: out_r = 13'h0213;
          default: begin end
        endcase
      end
      12'h885: begin
        out_r = 13'h0219;
      end
      12'h886: begin
        out_r = 13'h0216;
        case (key_hi)
          1'h1: out_r = 13'h0214;
          default: begin end
        endcase
      end
      12'h887: begin
        out_r = 13'h0219;
      end
      12'h888: begin
        out_r = 13'h0221;
        case (key_hi)
          1'h1: out_r = 13'h0223;
          default: begin end
        endcase
      end
      12'h889: begin
        out_r = 13'h0226;
      end
      12'h88a: begin
        out_r = 13'h0229;
        case (key_hi)
          1'h1: out_r = 13'h022b;
          default: begin end
        endcase
      end
      12'h88b: begin
        out_r = 13'h022e;
      end
      12'h88c: begin
        out_r = 13'h0235;
      end
      12'h88d: begin
        out_r = 13'h023a;
      end
      12'h88e: begin
        out_r = 13'h0235;
      end
      12'h88f: begin
        out_r = 13'h023b;
        case (key_hi)
          1'h1: out_r = 13'h0238;
          default: begin end
        endcase
      end
      12'h890: begin
        out_r = 13'h0241;
        case (key_hi)
          1'h1: out_r = 13'h0243;
          default: begin end
        endcase
      end
      12'h891: begin
        out_r = 13'h0246;
      end
      12'h892: begin
        out_r = 13'h0249;
        case (key_hi)
          1'h1: out_r = 13'h024b;
          default: begin end
        endcase
      end
      12'h893: begin
        out_r = 13'h024e;
      end
      12'h894: begin
        out_r = 13'h0261;
      end
      12'h895: begin
        out_r = 13'h0267;
      end
      12'h896: begin
        out_r = 13'h026e;
      end
      12'h897: begin
        out_r = 13'h0266;
        case (key_hi)
          1'h1: out_r = 13'h0264;
          default: begin end
        endcase
      end
      12'h898: begin
        out_r = 13'h0256;
        case (key_hi)
          1'h1: out_r = 13'h0254;
          default: begin end
        endcase
      end
      12'h899: begin
        out_r = 13'h0259;
      end
      12'h89a: begin
        out_r = 13'h0257;
      end
      12'h89b: begin
        out_r = 13'h0250;
        case (key_hi)
          1'h1: out_r = 13'h0251;
          default: begin end
        endcase
      end
      12'h89c: begin
        out_r = 13'h0269;
      end
      12'h89d: begin
        out_r = 13'h0267;
      end
      12'h89e: begin
        out_r = 13'h0269;
      end
      12'h89f: begin
        out_r = 13'h0266;
        case (key_hi)
          1'h1: out_r = 13'h0264;
          default: begin end
        endcase
      end
      12'h8a0: begin
        out_r = 13'h0281;
        case (key_hi)
          1'h1: out_r = 13'h0283;
          default: begin end
        endcase
      end
      12'h8a1: begin
        out_r = 13'h0286;
      end
      12'h8a2: begin
        out_r = 13'h0289;
        case (key_hi)
          1'h1: out_r = 13'h028b;
          default: begin end
        endcase
      end
      12'h8a3: begin
        out_r = 13'h028e;
      end
      12'h8a4: begin
        out_r = 13'h0291;
        case (key_hi)
          1'h1: out_r = 13'h0293;
          default: begin end
        endcase
      end
      12'h8a5: begin
        out_r = 13'h0299;
      end
      12'h8a6: begin
        out_r = 13'h0296;
        case (key_hi)
          1'h1: out_r = 13'h0294;
          default: begin end
        endcase
      end
      12'h8a7: begin
        out_r = 13'h0299;
      end
      12'h8a8: begin
        out_r = 13'h02a1;
        case (key_hi)
          1'h1: out_r = 13'h02a3;
          default: begin end
        endcase
      end
      12'h8a9: begin
        out_r = 13'h02a6;
      end
      12'h8aa: begin
        out_r = 13'h02a9;
        case (key_hi)
          1'h1: out_r = 13'h02ab;
          default: begin end
        endcase
      end
      12'h8ab: begin
        out_r = 13'h02ae;
      end
      12'h8ac: begin
        out_r = 13'h02b5;
      end
      12'h8ad: begin
        out_r = 13'h02ba;
      end
      12'h8ae: begin
        out_r = 13'h02b5;
      end
      12'h8af: begin
        out_r = 13'h02bb;
        case (key_hi)
          1'h1: out_r = 13'h02b8;
          default: begin end
        endcase
      end
      12'h8b0: begin
        out_r = 13'h02d1;
      end
      12'h8b1: begin
        out_r = 13'h02d6;
      end
      12'h8b2: begin
        out_r = 13'h02d9;
      end
      12'h8b3: begin
        out_r = 13'h02d4;
        case (key_hi)
          1'h1: out_r = 13'h02d7;
          default: begin end
        endcase
      end
      12'h8b4: begin
        out_r = 13'h02e6;
      end
      12'h8b5: begin
        out_r = 13'h02e9;
      end
      12'h8b6: begin
        out_r = 13'h02e1;
        case (key_hi)
          1'h1: out_r = 13'h02e0;
          default: begin end
        endcase
      end
      12'h8b7: begin
        out_r = 13'h02eb;
        case (key_hi)
          1'h1: out_r = 13'h02e8;
          default: begin end
        endcase
      end
      12'h8b8: begin
        out_r = 13'h02d1;
      end
      12'h8b9: begin
        out_r = 13'h02d6;
      end
      12'h8ba: begin
        out_r = 13'h02de;
      end
      12'h8bb: begin
        out_r = 13'h02d4;
        case (key_hi)
          1'h1: out_r = 13'h02d7;
          default: begin end
        endcase
      end
      12'h8bc: begin
        out_r = 13'h02e7;
      end
      12'h8bd: begin
        out_r = 13'h02ee;
      end
      12'h8be: begin
        out_r = 13'h02e7;
      end
      12'h8bf: begin
        out_r = 13'h02e3;
        case (key_hi)
          1'h1: out_r = 13'h02e0;
          default: begin end
        endcase
      end
      12'h8c0: begin
        out_r = 13'h034e;
      end
      12'h8c1: begin
        out_r = 13'h0346;
      end
      12'h8c2: begin
        out_r = 13'h0341;
      end
      12'h8c3: begin
        out_r = 13'h0346;
      end
      12'h8c4: begin
        out_r = 13'h0351;
        case (key_hi)
          1'h1: out_r = 13'h0353;
          default: begin end
        endcase
      end
      12'h8c5: begin
        out_r = 13'h0359;
      end
      12'h8c6: begin
        out_r = 13'h0356;
        case (key_hi)
          1'h1: out_r = 13'h0354;
          default: begin end
        endcase
      end
      12'h8c7: begin
        out_r = 13'h0359;
      end
      12'h8c8: begin
        out_r = 13'h036e;
      end
      12'h8c9: begin
        out_r = 13'h0366;
      end
      12'h8ca: begin
        out_r = 13'h0361;
      end
      12'h8cb: begin
        out_r = 13'h0367;
      end
      12'h8cc: begin
        out_r = 13'h0356;
      end
      12'h8cd: begin
        out_r = 13'h0351;
      end
      12'h8ce: begin
        out_r = 13'h0356;
      end
      12'h8cf: begin
        out_r = 13'h035e;
      end
      12'h8d0: begin
        out_r = 13'h0391;
        case (key_hi)
          1'h1: out_r = 13'h0393;
          default: begin end
        endcase
      end
      12'h8d1: begin
        out_r = 13'h0399;
      end
      12'h8d2: begin
        out_r = 13'h0396;
        case (key_hi)
          1'h1: out_r = 13'h0394;
          default: begin end
        endcase
      end
      12'h8d3: begin
        out_r = 13'h0399;
      end
      12'h8d4: begin
        out_r = 13'h03a1;
        case (key_hi)
          1'h1: out_r = 13'h03a3;
          default: begin end
        endcase
      end
      12'h8d5: begin
        out_r = 13'h03a7;
      end
      12'h8d6: begin
        out_r = 13'h03ab;
      end
      12'h8d7: begin
        out_r = 13'h03a4;
        case (key_hi)
          1'h1: out_r = 13'h03a7;
          default: begin end
        endcase
      end
      12'h8d8: begin
        out_r = 13'h0389;
        case (key_hi)
          1'h1: out_r = 13'h038b;
          default: begin end
        endcase
      end
      12'h8d9: begin
        out_r = 13'h0387;
      end
      12'h8da: begin
        out_r = 13'h038e;
      end
      12'h8db: begin
        out_r = 13'h0380;
        case (key_hi)
          1'h1: out_r = 13'h0381;
          default: begin end
        endcase
      end
      12'h8dc: begin
        out_r = 13'h03a9;
      end
      12'h8dd: begin
        out_r = 13'h03ae;
      end
      12'h8de: begin
        out_r = 13'h03a9;
      end
      12'h8df: begin
        out_r = 13'h03a3;
        case (key_hi)
          1'h1: out_r = 13'h03a0;
          default: begin end
        endcase
      end
      12'h8e0: begin
        out_r = 13'h034e;
      end
      12'h8e1: begin
        out_r = 13'h0346;
      end
      12'h8e2: begin
        out_r = 13'h0341;
      end
      12'h8e3: begin
        out_r = 13'h0346;
      end
      12'h8e4: begin
        out_r = 13'h0356;
        case (key_hi)
          1'h1: out_r = 13'h0354;
          default: begin end
        endcase
      end
      12'h8e5: begin
        out_r = 13'h0359;
      end
      12'h8e6: begin
        out_r = 13'h0351;
      end
      12'h8e7: begin
        out_r = 13'h0359;
      end
      12'h8e8: begin
        out_r = 13'h037e;
      end
      12'h8e9: begin
        out_r = 13'h0378;
      end
      12'h8ea: begin
        out_r = 13'h0375;
      end
      12'h8eb: begin
        out_r = 13'h037a;
      end
      12'h8ec: begin
        out_r = 13'h0356;
      end
      12'h8ed: begin
        out_r = 13'h0351;
      end
      12'h8ee: begin
        out_r = 13'h0356;
      end
      12'h8ef: begin
        out_r = 13'h035e;
      end
      12'h8f0: begin
        out_r = 13'h0391;
        case (key_hi)
          1'h1: out_r = 13'h0393;
          default: begin end
        endcase
      end
      12'h8f1: begin
        out_r = 13'h039e;
      end
      12'h8f2: begin
        out_r = 13'h0397;
        case (key_hi)
          1'h1: out_r = 13'h0394;
          default: begin end
        endcase
      end
      12'h8f3: begin
        out_r = 13'h039e;
      end
      12'h8f4: begin
        out_r = 13'h03b1;
      end
      12'h8f5: begin
        out_r = 13'h03ba;
      end
      12'h8f6: begin
        out_r = 13'h03be;
      end
      12'h8f7: begin
        out_r = 13'h03bb;
        case (key_hi)
          1'h1: out_r = 13'h03b8;
          default: begin end
        endcase
      end
      12'h8f8: begin
        out_r = 13'h0391;
        case (key_hi)
          1'h1: out_r = 13'h0393;
          default: begin end
        endcase
      end
      12'h8f9: begin
        out_r = 13'h039e;
      end
      12'h8fa: begin
        out_r = 13'h0397;
      end
      12'h8fb: begin
        out_r = 13'h039e;
      end
      12'h8fc: begin
        out_r = 13'h0389;
        case (key_hi)
          1'h1: out_r = 13'h038b;
          default: begin end
        endcase
      end
      12'h8fd: begin
        out_r = 13'h038e;
      end
      12'h8fe: begin
        out_r = 13'h0389;
        case (key_hi)
          1'h1: out_r = 13'h038b;
          default: begin end
        endcase
      end
      12'h8ff: begin
        out_r = 13'h0383;
        case (key_hi)
          1'h1: out_r = 13'h0380;
          default: begin end
        endcase
      end
      12'h900: begin
        out_r = 13'h0401;
        case (key_hi)
          1'h1: out_r = 13'h0803;
          default: begin end
        endcase
      end
      12'h901: begin
        out_r = 13'h0806;
      end
      12'h902: begin
        out_r = 13'h0409;
        case (key_hi)
          1'h1: out_r = 13'h080b;
          default: begin end
        endcase
      end
      12'h903: begin
        out_r = 13'h040e;
      end
      12'h904: begin
        out_r = 13'h0411;
        case (key_hi)
          1'h1: out_r = 13'h0813;
          default: begin end
        endcase
      end
      12'h905: begin
        out_r = 13'h0419;
      end
      12'h906: begin
        out_r = 13'h0816;
        case (key_hi)
          1'h1: out_r = 13'h0414;
          default: begin end
        endcase
      end
      12'h907: begin
        out_r = 13'h0419;
      end
      12'h908: begin
        out_r = 13'h0421;
        case (key_hi)
          1'h1: out_r = 13'h0823;
          default: begin end
        endcase
      end
      12'h909: begin
        out_r = 13'h0826;
      end
      12'h90a: begin
        out_r = 13'h0429;
        case (key_hi)
          1'h1: out_r = 13'h082b;
          default: begin end
        endcase
      end
      12'h90b: begin
        out_r = 13'h042e;
      end
      12'h90c: begin
        out_r = 13'h0435;
      end
      12'h90d: begin
        out_r = 13'h043a;
      end
      12'h90e: begin
        out_r = 13'h0435;
      end
      12'h90f: begin
        out_r = 13'h083b;
        case (key_hi)
          1'h1: out_r = 13'h0438;
          default: begin end
        endcase
      end
      12'h910: begin
        out_r = 13'h0441;
        case (key_hi)
          1'h1: out_r = 13'h0843;
          default: begin end
        endcase
      end
      12'h911: begin
        out_r = 13'h0846;
      end
      12'h912: begin
        out_r = 13'h0449;
        case (key_hi)
          1'h1: out_r = 13'h084b;
          default: begin end
        endcase
      end
      12'h913: begin
        out_r = 13'h044e;
      end
      12'h914: begin
        out_r = 13'h0461;
      end
      12'h915: begin
        out_r = 13'h0867;
      end
      12'h916: begin
        out_r = 13'h046e;
      end
      12'h917: begin
        out_r = 13'h0466;
        case (key_hi)
          1'h1: out_r = 13'h0464;
          default: begin end
        endcase
      end
      12'h918: begin
        out_r = 13'h0856;
        case (key_hi)
          1'h1: out_r = 13'h0454;
          default: begin end
        endcase
      end
      12'h919: begin
        out_r = 13'h0459;
      end
      12'h91a: begin
        out_r = 13'h0457;
      end
      12'h91b: begin
        out_r = 13'h0450;
        case (key_hi)
          1'h1: out_r = 13'h0451;
          default: begin end
        endcase
      end
      12'h91c: begin
        out_r = 13'h0469;
      end
      12'h91d: begin
        out_r = 13'h0867;
      end
      12'h91e: begin
        out_r = 13'h0469;
      end
      12'h91f: begin
        out_r = 13'h0466;
        case (key_hi)
          1'h1: out_r = 13'h0464;
          default: begin end
        endcase
      end
      12'h920: begin
        out_r = 13'h0481;
        case (key_hi)
          1'h1: out_r = 13'h0883;
          default: begin end
        endcase
      end
      12'h921: begin
        out_r = 13'h0886;
      end
      12'h922: begin
        out_r = 13'h0489;
        case (key_hi)
          1'h1: out_r = 13'h088b;
          default: begin end
        endcase
      end
      12'h923: begin
        out_r = 13'h048e;
      end
      12'h924: begin
        out_r = 13'h0491;
        case (key_hi)
          1'h1: out_r = 13'h0893;
          default: begin end
        endcase
      end
      12'h925: begin
        out_r = 13'h0499;
      end
      12'h926: begin
        out_r = 13'h0896;
        case (key_hi)
          1'h1: out_r = 13'h0494;
          default: begin end
        endcase
      end
      12'h927: begin
        out_r = 13'h0499;
      end
      12'h928: begin
        out_r = 13'h04a1;
        case (key_hi)
          1'h1: out_r = 13'h08a3;
          default: begin end
        endcase
      end
      12'h929: begin
        out_r = 13'h08a6;
      end
      12'h92a: begin
        out_r = 13'h04a9;
        case (key_hi)
          1'h1: out_r = 13'h08ab;
          default: begin end
        endcase
      end
      12'h92b: begin
        out_r = 13'h04ae;
      end
      12'h92c: begin
        out_r = 13'h04b5;
      end
      12'h92d: begin
        out_r = 13'h04ba;
      end
      12'h92e: begin
        out_r = 13'h04b5;
      end
      12'h92f: begin
        out_r = 13'h08bb;
        case (key_hi)
          1'h1: out_r = 13'h04b8;
          default: begin end
        endcase
      end
      12'h930: begin
        out_r = 13'h04d1;
      end
      12'h931: begin
        out_r = 13'h08d6;
      end
      12'h932: begin
        out_r = 13'h04d9;
      end
      12'h933: begin
        out_r = 13'h04d4;
        case (key_hi)
          1'h1: out_r = 13'h04d7;
          default: begin end
        endcase
      end
      12'h934: begin
        out_r = 13'h08e6;
      end
      12'h935: begin
        out_r = 13'h04e9;
      end
      12'h936: begin
        out_r = 13'h04e1;
        case (key_hi)
          1'h1: out_r = 13'h04e0;
          default: begin end
        endcase
      end
      12'h937: begin
        out_r = 13'h08eb;
        case (key_hi)
          1'h1: out_r = 13'h04e8;
          default: begin end
        endcase
      end
      12'h938: begin
        out_r = 13'h04d1;
      end
      12'h939: begin
        out_r = 13'h08d6;
      end
      12'h93a: begin
        out_r = 13'h04de;
      end
      12'h93b: begin
        out_r = 13'h04d4;
        case (key_hi)
          1'h1: out_r = 13'h04d7;
          default: begin end
        endcase
      end
      12'h93c: begin
        out_r = 13'h04e7;
      end
      12'h93d: begin
        out_r = 13'h04ee;
      end
      12'h93e: begin
        out_r = 13'h04e7;
      end
      12'h93f: begin
        out_r = 13'h08e3;
        case (key_hi)
          1'h1: out_r = 13'h04e0;
          default: begin end
        endcase
      end
      12'h940: begin
        out_r = 13'h0601;
        case (key_hi)
          1'h1: out_r = 13'h0903;
          default: begin end
        endcase
      end
      12'h941: begin
        out_r = 13'h06c0;
        case (key_hi)
          1'h1: out_r = 13'h0a06;
          default: begin end
        endcase
      end
      12'h942: begin
        out_r = 13'h0609;
        case (key_hi)
          1'h1: out_r = 13'h090b;
          default: begin end
        endcase
      end
      12'h943: begin
        out_r = 13'h0906;
        case (key_hi)
          1'h1: out_r = 13'h06d6;
          default: begin end
        endcase
      end
      12'h944: begin
        out_r = 13'h0611;
        case (key_hi)
          1'h1: out_r = 13'h0913;
          default: begin end
        endcase
      end
      12'h945: begin
        out_r = 13'h0619;
        case (key_hi)
          1'h1: out_r = 13'h06e9;
          default: begin end
        endcase
      end
      12'h946: begin
        out_r = 13'h0af6;
        case (key_hi)
          1'h1: out_r = 13'h0754;
          default: begin end
        endcase
      end
      12'h947: begin
        out_r = 13'h069e;
        case (key_hi)
          1'h1: out_r = 13'h06e9;
          default: begin end
        endcase
      end
      12'h948: begin
        out_r = 13'h062e;
        case (key_hi)
          1'h1: out_r = 13'h0923;
          default: begin end
        endcase
      end
      12'h949: begin
        out_r = 13'h09c7;
        case (key_hi)
          1'h1: out_r = 13'h0a26;
          default: begin end
        endcase
      end
      12'h94a: begin
        out_r = 13'h0621;
        case (key_hi)
          1'h1: out_r = 13'h092b;
          default: begin end
        endcase
      end
      12'h94b: begin
        out_r = 13'h0727;
        case (key_hi)
          1'h1: out_r = 13'h06f1;
          default: begin end
        endcase
      end
      12'h94c: begin
        out_r = 13'h0a56;
        case (key_hi)
          1'h1: out_r = 13'h0757;
          default: begin end
        endcase
      end
      12'h94d: begin
        out_r = 13'h0699;
        case (key_hi)
          1'h1: out_r = 13'h0619;
          default: begin end
        endcase
      end
      12'h94e: begin
        out_r = 13'h0611;
        case (key_hi)
          1'h1: out_r = 13'h0757;
          default: begin end
        endcase
      end
      12'h94f: begin
        out_r = 13'h06e9;
      end
      12'h950: begin
        out_r = 13'h0641;
        case (key_hi)
          1'h1: out_r = 13'h065e;
          default: begin end
        endcase
      end
      12'h951: begin
        out_r = 13'h0a86;
      end
      12'h952: begin
        out_r = 13'h0649;
        case (key_hi)
          1'h1: out_r = 13'h0731;
          default: begin end
        endcase
      end
      12'h953: begin
        out_r = 13'h078e;
        case (key_hi)
          1'h1: out_r = 13'h064e;
          default: begin end
        endcase
      end
      12'h954: begin
        out_r = 13'h067e;
        case (key_hi)
          1'h1: out_r = 13'h0993;
          default: begin end
        endcase
      end
      12'h955: begin
        out_r = 13'h0bba;
        case (key_hi)
          1'h1: out_r = 13'h07a6;
          default: begin end
        endcase
      end
      12'h956: begin
        out_r = 13'h07be;
        case (key_hi)
          1'h1: out_r = 13'h0550;
          default: begin end
        endcase
      end
      12'h957: begin
        out_r = 13'h0a46;
        case (key_hi)
          1'h1: out_r = 13'h0664;
          default: begin end
        endcase
      end
      12'h958: begin
        out_r = 13'h0651;
        case (key_hi)
          1'h1: out_r = 13'h0655;
          default: begin end
        endcase
      end
      12'h959: begin
        out_r = 13'h0659;
        case (key_hi)
          1'h1: out_r = 13'h0781;
          default: begin end
        endcase
      end
      12'h95a: begin
        out_r = 13'h0ab6;
        case (key_hi)
          1'h1: out_r = 13'h0789;
          default: begin end
        endcase
      end
      12'h95b: begin
        out_r = 13'h079e;
        case (key_hi)
          1'h1: out_r = 13'h065e;
          default: begin end
        endcase
      end
      12'h95c: begin
        out_r = 13'h0675;
        case (key_hi)
          1'h1: out_r = 13'h0aae;
          default: begin end
        endcase
      end
      12'h95d: begin
        out_r = 13'h0bba;
        case (key_hi)
          1'h1: out_r = 13'h07a6;
          default: begin end
        endcase
      end
      12'h95e: begin
        out_r = 13'h0675;
        case (key_hi)
          1'h1: out_r = 13'h0aae;
          default: begin end
        endcase
      end
      12'h95f: begin
        out_r = 13'h0ba3;
        case (key_hi)
          1'h1: out_r = 13'h0664;
          default: begin end
        endcase
      end
      12'h960: begin
        out_r = 13'h06c1;
        case (key_hi)
          1'h1: out_r = 13'h070e;
          default: begin end
        endcase
      end
      12'h961: begin
        out_r = 13'h0507;
        case (key_hi)
          1'h1: out_r = 13'h06b8;
          default: begin end
        endcase
      end
      12'h962: begin
        out_r = 13'h06c9;
        case (key_hi)
          1'h1: out_r = 13'h0748;
          default: begin end
        endcase
      end
      12'h963: begin
        out_r = 13'h0a06;
        case (key_hi)
          1'h1: out_r = 13'h06b8;
          default: begin end
        endcase
      end
      12'h964: begin
        out_r = 13'h06e1;
        case (key_hi)
          1'h1: out_r = 13'h07e5;
          default: begin end
        endcase
      end
      12'h965: begin
        out_r = 13'h06e9;
        case (key_hi)
          1'h1: out_r = 13'h0611;
          default: begin end
        endcase
      end
      12'h966: begin
        out_r = 13'h0656;
        case (key_hi)
          1'h1: out_r = 13'h0717;
          default: begin end
        endcase
      end
      12'h967: begin
        out_r = 13'h069e;
        case (key_hi)
          1'h1: out_r = 13'h0611;
          default: begin end
        endcase
      end
      12'h968: begin
        out_r = 13'h06d1;
        case (key_hi)
          1'h1: out_r = 13'h094b;
          default: begin end
        endcase
      end
      12'h969: begin
        out_r = 13'h0507;
        case (key_hi)
          1'h1: out_r = 13'h099a;
          default: begin end
        endcase
      end
      12'h96a: begin
        out_r = 13'h06d9;
      end
      12'h96b: begin
        out_r = 13'h07f8;
        case (key_hi)
          1'h1: out_r = 13'h06c0;
          default: begin end
        endcase
      end
      12'h96c: begin
        out_r = 13'h0656;
        case (key_hi)
          1'h1: out_r = 13'h0717;
          default: begin end
        endcase
      end
      12'h96d: begin
        out_r = 13'h06e1;
        case (key_hi)
          1'h1: out_r = 13'h0769;
          default: begin end
        endcase
      end
      12'h96e: begin
        out_r = 13'h0aea;
        case (key_hi)
          1'h1: out_r = 13'h0717;
          default: begin end
        endcase
      end
      12'h96f: begin
        out_r = 13'h091f;
        case (key_hi)
          1'h1: out_r = 13'h061e;
          default: begin end
        endcase
      end
      12'h970: begin
        out_r = 13'h0651;
        case (key_hi)
          1'h1: out_r = 13'h0a56;
          default: begin end
        endcase
      end
      12'h971: begin
        out_r = 13'h07b8;
        case (key_hi)
          1'h1: out_r = 13'h0701;
          default: begin end
        endcase
      end
      12'h972: begin
        out_r = 13'h0567;
        case (key_hi)
          1'h1: out_r = 13'h0791;
          default: begin end
        endcase
      end
      12'h973: begin
        out_r = 13'h079e;
        case (key_hi)
          1'h1: out_r = 13'h0659;
          default: begin end
        endcase
      end
      12'h974: begin
        out_r = 13'h0669;
        case (key_hi)
          1'h1: out_r = 13'h067e;
          default: begin end
        endcase
      end
      12'h975: begin
        out_r = 13'h067a;
        case (key_hi)
          1'h1: out_r = 13'h0a6a;
          default: begin end
        endcase
      end
      12'h976: begin
        out_r = 13'h0661;
        case (key_hi)
          1'h1: out_r = 13'h07a1;
          default: begin end
        endcase
      end
      12'h977: begin
        out_r = 13'h0bbb;
        case (key_hi)
          1'h1: out_r = 13'h0664;
          default: begin end
        endcase
      end
      12'h978: begin
        out_r = 13'h0651;
        case (key_hi)
          1'h1: out_r = 13'h0a56;
          default: begin end
        endcase
      end
      12'h979: begin
        out_r = 13'h0781;
        case (key_hi)
          1'h1: out_r = 13'h0659;
          default: begin end
        endcase
      end
      12'h97a: begin
        out_r = 13'h0567;
        case (key_hi)
          1'h1: out_r = 13'h0796;
          default: begin end
        endcase
      end
      12'h97b: begin
        out_r = 13'h079e;
        case (key_hi)
          1'h1: out_r = 13'h0659;
          default: begin end
        endcase
      end
      12'h97c: begin
        out_r = 13'h0649;
        case (key_hi)
          1'h1: out_r = 13'h0aae;
          default: begin end
        endcase
      end
      12'h97d: begin
        out_r = 13'h064e;
      end
      12'h97e: begin
        out_r = 13'h0649;
        case (key_hi)
          1'h1: out_r = 13'h0aae;
          default: begin end
        endcase
      end
      12'h97f: begin
        out_r = 13'h0b83;
        case (key_hi)
          1'h1: out_r = 13'h0640;
          default: begin end
        endcase
      end
      12'h980: begin
        out_r = 13'h0b56;
        case (key_hi)
          1'h1: out_r = 13'h0b0e;
          default: begin end
        endcase
      end
      12'h981: begin
        out_r = 13'h0a3b;
      end
      12'h982: begin
        out_r = 13'h07d7;
        case (key_hi)
          1'h1: out_r = 13'h0551;
          default: begin end
        endcase
      end
      12'h983: begin
        out_r = 13'h053a;
        case (key_hi)
          1'h1: out_r = 13'h0551;
          default: begin end
        endcase
      end
      12'h984: begin
        out_r = 13'h0569;
        case (key_hi)
          1'h1: out_r = 13'h0b13;
          default: begin end
        endcase
      end
      12'h985: begin
        out_r = 13'h0967;
      end
      12'h986: begin
        out_r = 13'h0501;
        case (key_hi)
          1'h1: out_r = 13'h0514;
          default: begin end
        endcase
      end
      12'h987: begin
        out_r = 13'h051e;
        case (key_hi)
          1'h1: out_r = 13'h0967;
          default: begin end
        endcase
      end
      12'h988: begin
        out_r = 13'h07d7;
        case (key_hi)
          1'h1: out_r = 13'h056e;
          default: begin end
        endcase
      end
      12'h989: begin
        out_r = 13'h0647;
        case (key_hi)
          1'h1: out_r = 13'h0a3b;
          default: begin end
        endcase
      end
      12'h98a: begin
        out_r = 13'h0551;
      end
      12'h98b: begin
        out_r = 13'h0b7a;
        case (key_hi)
          1'h1: out_r = 13'h0541;
          default: begin end
        endcase
      end
      12'h98c: begin
        out_r = 13'h0549;
        case (key_hi)
          1'h1: out_r = 13'h0511;
          default: begin end
        endcase
      end
      12'h98d: begin
        out_r = 13'h0b58;
        case (key_hi)
          1'h1: out_r = 13'h0967;
          default: begin end
        endcase
      end
      12'h98e: begin
        out_r = 13'h0575;
        case (key_hi)
          1'h1: out_r = 13'h0511;
          default: begin end
        endcase
      end
      12'h98f: begin
        out_r = 13'h05e9;
        case (key_hi)
          1'h1: out_r = 13'h0967;
          default: begin end
        endcase
      end
      12'h990: begin
        out_r = 13'h05b5;
        case (key_hi)
          1'h1: out_r = 13'h0b83;
          default: begin end
        endcase
      end
      12'h991: begin
        out_r = 13'h099f;
        case (key_hi)
          1'h1: out_r = 13'h0b86;
          default: begin end
        endcase
      end
      12'h992: begin
        out_r = 13'h05be;
        case (key_hi)
          1'h1: out_r = 13'h0b8b;
          default: begin end
        endcase
      end
      12'h993: begin
        out_r = 13'h05c7;
        case (key_hi)
          1'h1: out_r = 13'h06d7;
          default: begin end
        endcase
      end
      12'h994: begin
        out_r = 13'h0be6;
        case (key_hi)
          1'h1: out_r = 13'h0ba3;
          default: begin end
        endcase
      end
      12'h995: begin
        out_r = 13'h07a4;
        case (key_hi)
          1'h1: out_r = 13'h0b86;
          default: begin end
        endcase
      end
      12'h996: begin
        out_r = 13'h0996;
        case (key_hi)
          1'h1: out_r = 13'h0596;
          default: begin end
        endcase
      end
      12'h997: begin
        out_r = 13'h0719;
        case (key_hi)
          1'h1: out_r = 13'h05e9;
          default: begin end
        endcase
      end
      12'h998: begin
        out_r = 13'h0531;
        case (key_hi)
          1'h1: out_r = 13'h0530;
          default: begin end
        endcase
      end
      12'h999: begin
        out_r = 13'h0538;
      end
      12'h99a: begin
        out_r = 13'h0581;
        case (key_hi)
          1'h1: out_r = 13'h0534;
          default: begin end
        endcase
      end
      12'h99b: begin
        out_r = 13'h06d7;
        case (key_hi)
          1'h1: out_r = 13'h0538;
          default: begin end
        endcase
      end
      12'h99c: begin
        out_r = 13'h0591;
        case (key_hi)
          1'h1: out_r = 13'h0bab;
          default: begin end
        endcase
      end
      12'h99d: begin
        out_r = 13'h05fa;
        case (key_hi)
          1'h1: out_r = 13'h05b9;
          default: begin end
        endcase
      end
      12'h99e: begin
        out_r = 13'h0591;
        case (key_hi)
          1'h1: out_r = 13'h0bab;
          default: begin end
        endcase
      end
      12'h99f: begin
        out_r = 13'h0bbb;
        case (key_hi)
          1'h1: out_r = 13'h05e9;
          default: begin end
        endcase
      end
      12'h9a0: begin
        out_r = 13'h07d7;
        case (key_hi)
          1'h1: out_r = 13'h074e;
          default: begin end
        endcase
      end
      12'h9a1: begin
        out_r = 13'h0647;
        case (key_hi)
          1'h1: out_r = 13'h07d6;
          default: begin end
        endcase
      end
      12'h9a2: begin
        out_r = 13'h0936;
        case (key_hi)
          1'h1: out_r = 13'h0551;
          default: begin end
        endcase
      end
      12'h9a3: begin
        out_r = 13'h055e;
        case (key_hi)
          1'h1: out_r = 13'h052e;
          default: begin end
        endcase
      end
      12'h9a4: begin
        out_r = 13'h0575;
        case (key_hi)
          1'h1: out_r = 13'h0b53;
          default: begin end
        endcase
      end
      12'h9a5: begin
        out_r = 13'h0659;
        case (key_hi)
          1'h1: out_r = 13'h051e;
          default: begin end
        endcase
      end
      12'h9a6: begin
        out_r = 13'h0511;
        case (key_hi)
          1'h1: out_r = 13'h0569;
          default: begin end
        endcase
      end
      12'h9a7: begin
        out_r = 13'h057a;
        case (key_hi)
          1'h1: out_r = 13'h051e;
          default: begin end
        endcase
      end
      12'h9a8: begin
        out_r = 13'h0549;
        case (key_hi)
          1'h1: out_r = 13'h057e;
          default: begin end
        endcase
      end
      12'h9a9: begin
        out_r = 13'h0646;
        case (key_hi)
          1'h1: out_r = 13'h093b;
          default: begin end
        endcase
      end
      12'h9aa: begin
        out_r = 13'h054e;
        case (key_hi)
          1'h1: out_r = 13'h0551;
          default: begin end
        endcase
      end
      12'h9ab: begin
        out_r = 13'h0559;
        case (key_hi)
          1'h1: out_r = 13'h0501;
          default: begin end
        endcase
      end
      12'h9ac: begin
        out_r = 13'h0577;
        case (key_hi)
          1'h1: out_r = 13'h0501;
          default: begin end
        endcase
      end
      12'h9ad: begin
        out_r = 13'h0757;
        case (key_hi)
          1'h1: out_r = 13'h0511;
          default: begin end
        endcase
      end
      12'h9ae: begin
        out_r = 13'h0776;
        case (key_hi)
          1'h1: out_r = 13'h0501;
          default: begin end
        endcase
      end
      12'h9af: begin
        out_r = 13'h057a;
        case (key_hi)
          1'h1: out_r = 13'h0519;
          default: begin end
        endcase
      end
      12'h9b0: begin
        out_r = 13'h053e;
        case (key_hi)
          1'h1: out_r = 13'h07d0;
          default: begin end
        endcase
      end
      12'h9b1: begin
        out_r = 13'h0a3b;
        case (key_hi)
          1'h1: out_r = 13'h0521;
          default: begin end
        endcase
      end
      12'h9b2: begin
        out_r = 13'h0535;
        case (key_hi)
          1'h1: out_r = 13'h05de;
          default: begin end
        endcase
      end
      12'h9b3: begin
        out_r = 13'h09d6;
        case (key_hi)
          1'h1: out_r = 13'h0538;
          default: begin end
        endcase
      end
      12'h9b4: begin
        out_r = 13'h0509;
        case (key_hi)
          1'h1: out_r = 13'h0b8b;
          default: begin end
        endcase
      end
      12'h9b5: begin
        out_r = 13'h0687;
        case (key_hi)
          1'h1: out_r = 13'h05b8;
          default: begin end
        endcase
      end
      12'h9b6: begin
        out_r = 13'h0501;
        case (key_hi)
          1'h1: out_r = 13'h0590;
          default: begin end
        endcase
      end
      12'h9b7: begin
        out_r = 13'h0b86;
        case (key_hi)
          1'h1: out_r = 13'h05ee;
          default: begin end
        endcase
      end
      12'h9b8: begin
        out_r = 13'h053e;
        case (key_hi)
          1'h1: out_r = 13'h07d0;
          default: begin end
        endcase
      end
      12'h9b9: begin
        out_r = 13'h053a;
        case (key_hi)
          1'h1: out_r = 13'h0bbb;
          default: begin end
        endcase
      end
      12'h9ba: begin
        out_r = 13'h05c1;
        case (key_hi)
          1'h1: out_r = 13'h0781;
          default: begin end
        endcase
      end
      12'h9bb: begin
        out_r = 13'h09d6;
        case (key_hi)
          1'h1: out_r = 13'h0538;
          default: begin end
        endcase
      end
      12'h9bc: begin
        out_r = 13'h0bbe;
        case (key_hi)
          1'h1: out_r = 13'h0591;
          default: begin end
        endcase
      end
      12'h9bd: begin
        out_r = 13'h0519;
        case (key_hi)
          1'h1: out_r = 13'h05ee;
          default: begin end
        endcase
      end
      12'h9be: begin
        out_r = 13'h0bbe;
        case (key_hi)
          1'h1: out_r = 13'h0591;
          default: begin end
        endcase
      end
      12'h9bf: begin
        out_r = 13'h0a13;
        case (key_hi)
          1'h1: out_r = 13'h05e0;
          default: begin end
        endcase
      end
      12'h9c0: begin
        out_r = 13'h0681;
        case (key_hi)
          1'h1: out_r = 13'h07f4;
          default: begin end
        endcase
      end
      12'h9c1: begin
        out_r = 13'h0630;
      end
      12'h9c2: begin
        out_r = 13'h0689;
        case (key_hi)
          1'h1: out_r = 13'h058e;
          default: begin end
        endcase
      end
      12'h9c3: begin
        out_r = 13'h0761;
        case (key_hi)
          1'h1: out_r = 13'h0507;
          default: begin end
        endcase
      end
      12'h9c4: begin
        out_r = 13'h0691;
        case (key_hi)
          1'h1: out_r = 13'h06e9;
          default: begin end
        endcase
      end
      12'h9c5: begin
        out_r = 13'h0699;
      end
      12'h9c6: begin
        out_r = 13'h0a16;
        case (key_hi)
          1'h1: out_r = 13'h05e7;
          default: begin end
        endcase
      end
      12'h9c7: begin
        out_r = 13'h06ee;
        case (key_hi)
          1'h1: out_r = 13'h0699;
          default: begin end
        endcase
      end
      12'h9c8: begin
        out_r = 13'h06ae;
        case (key_hi)
          1'h1: out_r = 13'h060c;
          default: begin end
        endcase
      end
      12'h9c9: begin
        out_r = 13'h077a;
        case (key_hi)
          1'h1: out_r = 13'h057b;
          default: begin end
        endcase
      end
      12'h9ca: begin
        out_r = 13'h06a1;
        case (key_hi)
          1'h1: out_r = 13'h0688;
          default: begin end
        endcase
      end
      12'h9cb: begin
        out_r = 13'h077a;
        case (key_hi)
          1'h1: out_r = 13'h06db;
          default: begin end
        endcase
      end
      12'h9cc: begin
        out_r = 13'h0691;
        case (key_hi)
          1'h1: out_r = 13'h0a16;
          default: begin end
        endcase
      end
      12'h9cd: begin
        out_r = 13'h0699;
        case (key_hi)
          1'h1: out_r = 13'h075e;
          default: begin end
        endcase
      end
      12'h9ce: begin
        out_r = 13'h06e7;
        case (key_hi)
          1'h1: out_r = 13'h0a16;
          default: begin end
        endcase
      end
      12'h9cf: begin
        out_r = 13'h07e9;
        case (key_hi)
          1'h1: out_r = 13'h069e;
          default: begin end
        endcase
      end
      12'h9d0: begin
        out_r = 13'h0651;
        case (key_hi)
          1'h1: out_r = 13'h0a56;
          default: begin end
        endcase
      end
      12'h9d1: begin
        out_r = 13'h0659;
        case (key_hi)
          1'h1: out_r = 13'h0701;
          default: begin end
        endcase
      end
      12'h9d2: begin
        out_r = 13'h0557;
        case (key_hi)
          1'h1: out_r = 13'h0796;
          default: begin end
        endcase
      end
      12'h9d3: begin
        out_r = 13'h079e;
        case (key_hi)
          1'h1: out_r = 13'h0659;
          default: begin end
        endcase
      end
      12'h9d4: begin
        out_r = 13'h0671;
        case (key_hi)
          1'h1: out_r = 13'h0993;
          default: begin end
        endcase
      end
      12'h9d5: begin
        out_r = 13'h0a7b;
        case (key_hi)
          1'h1: out_r = 13'h07a6;
          default: begin end
        endcase
      end
      12'h9d6: begin
        out_r = 13'h067f;
        case (key_hi)
          1'h1: out_r = 13'h06a5;
          default: begin end
        endcase
      end
      12'h9d7: begin
        out_r = 13'h0678;
        case (key_hi)
          1'h1: out_r = 13'h07a6;
          default: begin end
        endcase
      end
      12'h9d8: begin
        out_r = 13'h0651;
        case (key_hi)
          1'h1: out_r = 13'h079e;
          default: begin end
        endcase
      end
      12'h9d9: begin
        out_r = 13'h0624;
        case (key_hi)
          1'h1: out_r = 13'h0799;
          default: begin end
        endcase
      end
      12'h9da: begin
        out_r = 13'h0a56;
        case (key_hi)
          1'h1: out_r = 13'h078e;
          default: begin end
        endcase
      end
      12'h9db: begin
        out_r = 13'h079e;
        case (key_hi)
          1'h1: out_r = 13'h0651;
          default: begin end
        endcase
      end
      12'h9dc: begin
        out_r = 13'h0660;
        case (key_hi)
          1'h1: out_r = 13'h07e5;
          default: begin end
        endcase
      end
      12'h9dd: begin
        out_r = 13'h07ba;
        case (key_hi)
          1'h1: out_r = 13'h09ba;
          default: begin end
        endcase
      end
      12'h9de: begin
        out_r = 13'h0660;
        case (key_hi)
          1'h1: out_r = 13'h07e5;
          default: begin end
        endcase
      end
      12'h9df: begin
        out_r = 13'h0ba3;
        case (key_hi)
          1'h1: out_r = 13'h0664;
          default: begin end
        endcase
      end
      12'h9e0: begin
        out_r = 13'h0681;
        case (key_hi)
          1'h1: out_r = 13'h07f4;
          default: begin end
        endcase
      end
      12'h9e1: begin
        out_r = 13'h0630;
      end
      12'h9e2: begin
        out_r = 13'h0689;
        case (key_hi)
          1'h1: out_r = 13'h058e;
          default: begin end
        endcase
      end
      12'h9e3: begin
        out_r = 13'h0761;
        case (key_hi)
          1'h1: out_r = 13'h0507;
          default: begin end
        endcase
      end
      12'h9e4: begin
        out_r = 13'h0691;
        case (key_hi)
          1'h1: out_r = 13'h06e9;
          default: begin end
        endcase
      end
      12'h9e5: begin
        out_r = 13'h0699;
      end
      12'h9e6: begin
        out_r = 13'h05e5;
        case (key_hi)
          1'h1: out_r = 13'h0717;
          default: begin end
        endcase
      end
      12'h9e7: begin
        out_r = 13'h06ee;
        case (key_hi)
          1'h1: out_r = 13'h0699;
          default: begin end
        endcase
      end
      12'h9e8: begin
        out_r = 13'h06ae;
        case (key_hi)
          1'h1: out_r = 13'h060c;
          default: begin end
        endcase
      end
      12'h9e9: begin
        out_r = 13'h0bff;
        case (key_hi)
          1'h1: out_r = 13'h0a26;
          default: begin end
        endcase
      end
      12'h9ea: begin
        out_r = 13'h06a9;
        case (key_hi)
          1'h1: out_r = 13'h068e;
          default: begin end
        endcase
      end
      12'h9eb: begin
        out_r = 13'h0778;
        case (key_hi)
          1'h1: out_r = 13'h06db;
          default: begin end
        endcase
      end
      12'h9ec: begin
        out_r = 13'h0691;
        case (key_hi)
          1'h1: out_r = 13'h0a16;
          default: begin end
        endcase
      end
      12'h9ed: begin
        out_r = 13'h0699;
        case (key_hi)
          1'h1: out_r = 13'h075e;
          default: begin end
        endcase
      end
      12'h9ee: begin
        out_r = 13'h06e7;
        case (key_hi)
          1'h1: out_r = 13'h0a16;
          default: begin end
        endcase
      end
      12'h9ef: begin
        out_r = 13'h07e9;
        case (key_hi)
          1'h1: out_r = 13'h069e;
          default: begin end
        endcase
      end
      12'h9f0: begin
        out_r = 13'h0557;
        case (key_hi)
          1'h1: out_r = 13'h0923;
          default: begin end
        endcase
      end
      12'h9f1: begin
        out_r = 13'h0a56;
        case (key_hi)
          1'h1: out_r = 13'h0a26;
          default: begin end
        endcase
      end
      12'h9f2: begin
        out_r = 13'h0651;
        case (key_hi)
          1'h1: out_r = 13'h092b;
          default: begin end
        endcase
      end
      12'h9f3: begin
        out_r = 13'h0799;
        case (key_hi)
          1'h1: out_r = 13'h0659;
          default: begin end
        endcase
      end
      12'h9f4: begin
        out_r = 13'h0669;
        case (key_hi)
          1'h1: out_r = 13'h0661;
          default: begin end
        endcase
      end
      12'h9f5: begin
        out_r = 13'h067a;
        case (key_hi)
          1'h1: out_r = 13'h0bba;
          default: begin end
        endcase
      end
      12'h9f6: begin
        out_r = 13'h0661;
        case (key_hi)
          1'h1: out_r = 13'h07b5;
          default: begin end
        endcase
      end
      12'h9f7: begin
        out_r = 13'h0bbb;
        case (key_hi)
          1'h1: out_r = 13'h0678;
          default: begin end
        endcase
      end
      12'h9f8: begin
        out_r = 13'h0557;
        case (key_hi)
          1'h1: out_r = 13'h0923;
          default: begin end
        endcase
      end
      12'h9f9: begin
        out_r = 13'h065b;
        case (key_hi)
          1'h1: out_r = 13'h0b26;
          default: begin end
        endcase
      end
      12'h9fa: begin
        out_r = 13'h0651;
        case (key_hi)
          1'h1: out_r = 13'h0791;
          default: begin end
        endcase
      end
      12'h9fb: begin
        out_r = 13'h0799;
        case (key_hi)
          1'h1: out_r = 13'h0659;
          default: begin end
        endcase
      end
      12'h9fc: begin
        out_r = 13'h0649;
        case (key_hi)
          1'h1: out_r = 13'h090b;
          default: begin end
        endcase
      end
      12'h9fd: begin
        out_r = 13'h064e;
      end
      12'h9fe: begin
        out_r = 13'h0649;
        case (key_hi)
          1'h1: out_r = 13'h090b;
          default: begin end
        endcase
      end
      12'h9ff: begin
        out_r = 13'h0b83;
        case (key_hi)
          1'h1: out_r = 13'h0640;
          default: begin end
        endcase
      end
      12'ha00: begin
        out_r = 13'h0801;
        case (key_hi)
          1'h1: out_r = 13'h0403;
          default: begin end
        endcase
      end
      12'ha01: begin
        out_r = 13'h0406;
      end
      12'ha02: begin
        out_r = 13'h0809;
        case (key_hi)
          1'h1: out_r = 13'h040b;
          default: begin end
        endcase
      end
      12'ha03: begin
        out_r = 13'h080e;
      end
      12'ha04: begin
        out_r = 13'h0811;
        case (key_hi)
          1'h1: out_r = 13'h0413;
          default: begin end
        endcase
      end
      12'ha05: begin
        out_r = 13'h0819;
      end
      12'ha06: begin
        out_r = 13'h0416;
        case (key_hi)
          1'h1: out_r = 13'h0814;
          default: begin end
        endcase
      end
      12'ha07: begin
        out_r = 13'h0819;
      end
      12'ha08: begin
        out_r = 13'h0821;
        case (key_hi)
          1'h1: out_r = 13'h0423;
          default: begin end
        endcase
      end
      12'ha09: begin
        out_r = 13'h0426;
      end
      12'ha0a: begin
        out_r = 13'h0829;
        case (key_hi)
          1'h1: out_r = 13'h042b;
          default: begin end
        endcase
      end
      12'ha0b: begin
        out_r = 13'h082e;
      end
      12'ha0c: begin
        out_r = 13'h0835;
      end
      12'ha0d: begin
        out_r = 13'h083a;
      end
      12'ha0e: begin
        out_r = 13'h0835;
      end
      12'ha0f: begin
        out_r = 13'h043b;
        case (key_hi)
          1'h1: out_r = 13'h0838;
          default: begin end
        endcase
      end
      12'ha10: begin
        out_r = 13'h0841;
        case (key_hi)
          1'h1: out_r = 13'h0443;
          default: begin end
        endcase
      end
      12'ha11: begin
        out_r = 13'h0446;
      end
      12'ha12: begin
        out_r = 13'h0849;
        case (key_hi)
          1'h1: out_r = 13'h044b;
          default: begin end
        endcase
      end
      12'ha13: begin
        out_r = 13'h084e;
      end
      12'ha14: begin
        out_r = 13'h0861;
      end
      12'ha15: begin
        out_r = 13'h0467;
      end
      12'ha16: begin
        out_r = 13'h086e;
      end
      12'ha17: begin
        out_r = 13'h0866;
        case (key_hi)
          1'h1: out_r = 13'h0864;
          default: begin end
        endcase
      end
      12'ha18: begin
        out_r = 13'h0456;
        case (key_hi)
          1'h1: out_r = 13'h0854;
          default: begin end
        endcase
      end
      12'ha19: begin
        out_r = 13'h0859;
      end
      12'ha1a: begin
        out_r = 13'h0857;
      end
      12'ha1b: begin
        out_r = 13'h0850;
        case (key_hi)
          1'h1: out_r = 13'h0851;
          default: begin end
        endcase
      end
      12'ha1c: begin
        out_r = 13'h0869;
      end
      12'ha1d: begin
        out_r = 13'h0467;
      end
      12'ha1e: begin
        out_r = 13'h0869;
      end
      12'ha1f: begin
        out_r = 13'h0866;
        case (key_hi)
          1'h1: out_r = 13'h0864;
          default: begin end
        endcase
      end
      12'ha20: begin
        out_r = 13'h0881;
        case (key_hi)
          1'h1: out_r = 13'h0483;
          default: begin end
        endcase
      end
      12'ha21: begin
        out_r = 13'h0486;
      end
      12'ha22: begin
        out_r = 13'h0889;
        case (key_hi)
          1'h1: out_r = 13'h048b;
          default: begin end
        endcase
      end
      12'ha23: begin
        out_r = 13'h088e;
      end
      12'ha24: begin
        out_r = 13'h0891;
        case (key_hi)
          1'h1: out_r = 13'h0493;
          default: begin end
        endcase
      end
      12'ha25: begin
        out_r = 13'h0899;
      end
      12'ha26: begin
        out_r = 13'h0496;
        case (key_hi)
          1'h1: out_r = 13'h0894;
          default: begin end
        endcase
      end
      12'ha27: begin
        out_r = 13'h0899;
      end
      12'ha28: begin
        out_r = 13'h08a1;
        case (key_hi)
          1'h1: out_r = 13'h04a3;
          default: begin end
        endcase
      end
      12'ha29: begin
        out_r = 13'h04a6;
      end
      12'ha2a: begin
        out_r = 13'h08a9;
        case (key_hi)
          1'h1: out_r = 13'h04ab;
          default: begin end
        endcase
      end
      12'ha2b: begin
        out_r = 13'h08ae;
      end
      12'ha2c: begin
        out_r = 13'h08b5;
      end
      12'ha2d: begin
        out_r = 13'h08ba;
      end
      12'ha2e: begin
        out_r = 13'h08b5;
      end
      12'ha2f: begin
        out_r = 13'h04bb;
        case (key_hi)
          1'h1: out_r = 13'h08b8;
          default: begin end
        endcase
      end
      12'ha30: begin
        out_r = 13'h08d1;
      end
      12'ha31: begin
        out_r = 13'h04d6;
      end
      12'ha32: begin
        out_r = 13'h08d9;
      end
      12'ha33: begin
        out_r = 13'h08d4;
        case (key_hi)
          1'h1: out_r = 13'h08d7;
          default: begin end
        endcase
      end
      12'ha34: begin
        out_r = 13'h04e6;
      end
      12'ha35: begin
        out_r = 13'h08e9;
      end
      12'ha36: begin
        out_r = 13'h08e1;
        case (key_hi)
          1'h1: out_r = 13'h08e0;
          default: begin end
        endcase
      end
      12'ha37: begin
        out_r = 13'h04eb;
        case (key_hi)
          1'h1: out_r = 13'h08e8;
          default: begin end
        endcase
      end
      12'ha38: begin
        out_r = 13'h08d1;
      end
      12'ha39: begin
        out_r = 13'h04d6;
      end
      12'ha3a: begin
        out_r = 13'h08de;
      end
      12'ha3b: begin
        out_r = 13'h08d4;
        case (key_hi)
          1'h1: out_r = 13'h08d7;
          default: begin end
        endcase
      end
      12'ha3c: begin
        out_r = 13'h08e7;
      end
      12'ha3d: begin
        out_r = 13'h08ee;
      end
      12'ha3e: begin
        out_r = 13'h08e7;
      end
      12'ha3f: begin
        out_r = 13'h04e3;
        case (key_hi)
          1'h1: out_r = 13'h08e0;
          default: begin end
        endcase
      end
      12'ha40: begin
        out_r = 13'h0901;
        case (key_hi)
          1'h1: out_r = 13'h0b3e;
          default: begin end
        endcase
      end
      12'ha41: begin
        out_r = 13'h0506;
      end
      12'ha42: begin
        out_r = 13'h0909;
        case (key_hi)
          1'h1: out_r = 13'h0949;
          default: begin end
        endcase
      end
      12'ha43: begin
        out_r = 13'h090e;
      end
      12'ha44: begin
        out_r = 13'h0911;
        case (key_hi)
          1'h1: out_r = 13'h07e3;
          default: begin end
        endcase
      end
      12'ha45: begin
        out_r = 13'h0919;
      end
      12'ha46: begin
        out_r = 13'h0516;
        case (key_hi)
          1'h1: out_r = 13'h0b54;
          default: begin end
        endcase
      end
      12'ha47: begin
        out_r = 13'h0b1e;
        case (key_hi)
          1'h1: out_r = 13'h0919;
          default: begin end
        endcase
      end
      12'ha48: begin
        out_r = 13'h0921;
        case (key_hi)
          1'h1: out_r = 13'h07ce;
          default: begin end
        endcase
      end
      12'ha49: begin
        out_r = 13'h0526;
      end
      12'ha4a: begin
        out_r = 13'h0929;
        case (key_hi)
          1'h1: out_r = 13'h092e;
          default: begin end
        endcase
      end
      12'ha4b: begin
        out_r = 13'h092e;
      end
      12'ha4c: begin
        out_r = 13'h0935;
        case (key_hi)
          1'h1: out_r = 13'h0a57;
          default: begin end
        endcase
      end
      12'ha4d: begin
        out_r = 13'h093a;
      end
      12'ha4e: begin
        out_r = 13'h0935;
        case (key_hi)
          1'h1: out_r = 13'h0a57;
          default: begin end
        endcase
      end
      12'ha4f: begin
        out_r = 13'h0919;
        case (key_hi)
          1'h1: out_r = 13'h0938;
          default: begin end
        endcase
      end
      12'ha50: begin
        out_r = 13'h0981;
        case (key_hi)
          1'h1: out_r = 13'h0b91;
          default: begin end
        endcase
      end
      12'ha51: begin
        out_r = 13'h0697;
        case (key_hi)
          1'h1: out_r = 13'h09f1;
          default: begin end
        endcase
      end
      12'ha52: begin
        out_r = 13'h0989;
        case (key_hi)
          1'h1: out_r = 13'h0941;
          default: begin end
        endcase
      end
      12'ha53: begin
        out_r = 13'h0697;
        case (key_hi)
          1'h1: out_r = 13'h0586;
          default: begin end
        endcase
      end
      12'ha54: begin
        out_r = 13'h0991;
        case (key_hi)
          1'h1: out_r = 13'h097e;
          default: begin end
        endcase
      end
      12'ha55: begin
        out_r = 13'h099e;
        case (key_hi)
          1'h1: out_r = 13'h09ee;
          default: begin end
        endcase
      end
      12'ha56: begin
        out_r = 13'h055a;
        case (key_hi)
          1'h1: out_r = 13'h0ba1;
          default: begin end
        endcase
      end
      12'ha57: begin
        out_r = 13'h0957;
        case (key_hi)
          1'h1: out_r = 13'h09ee;
          default: begin end
        endcase
      end
      12'ha58: begin
        out_r = 13'h09b1;
        case (key_hi)
          1'h1: out_r = 13'h092e;
          default: begin end
        endcase
      end
      12'ha59: begin
        out_r = 13'h0abb;
        case (key_hi)
          1'h1: out_r = 13'h09d9;
          default: begin end
        endcase
      end
      12'ha5a: begin
        out_r = 13'h09b5;
        case (key_hi)
          1'h1: out_r = 13'h0b91;
          default: begin end
        endcase
      end
      12'ha5b: begin
        out_r = 13'h09a4;
        case (key_hi)
          1'h1: out_r = 13'h0697;
          default: begin end
        endcase
      end
      12'ha5c: begin
        out_r = 13'h09a5;
        case (key_hi)
          1'h1: out_r = 13'h09ae;
          default: begin end
        endcase
      end
      12'ha5d: begin
        out_r = 13'h0999;
        case (key_hi)
          1'h1: out_r = 13'h09e9;
          default: begin end
        endcase
      end
      12'ha5e: begin
        out_r = 13'h09a5;
        case (key_hi)
          1'h1: out_r = 13'h09ae;
          default: begin end
        endcase
      end
      12'ha5f: begin
        out_r = 13'h07a7;
        case (key_hi)
          1'h1: out_r = 13'h09e0;
          default: begin end
        endcase
      end
      12'ha60: begin
        out_r = 13'h05f6;
        case (key_hi)
          1'h1: out_r = 13'h0b08;
          default: begin end
        endcase
      end
      12'ha61: begin
        out_r = 13'h0b3a;
        case (key_hi)
          1'h1: out_r = 13'h0bd8;
          default: begin end
        endcase
      end
      12'ha62: begin
        out_r = 13'h0a4f;
        case (key_hi)
          1'h1: out_r = 13'h0b41;
          default: begin end
        endcase
      end
      12'ha63: begin
        out_r = 13'h095e;
        case (key_hi)
          1'h1: out_r = 13'h0a7b;
          default: begin end
        endcase
      end
      12'ha64: begin
        out_r = 13'h096e;
        case (key_hi)
          1'h1: out_r = 13'h0be4;
          default: begin end
        endcase
      end
      12'ha65: begin
        out_r = 13'h0b66;
        case (key_hi)
          1'h1: out_r = 13'h0bfb;
          default: begin end
        endcase
      end
      12'ha66: begin
        out_r = 13'h094e;
        case (key_hi)
          1'h1: out_r = 13'h057c;
          default: begin end
        endcase
      end
      12'ha67: begin
        out_r = 13'h097b;
        case (key_hi)
          1'h1: out_r = 13'h0bfb;
          default: begin end
        endcase
      end
      12'ha68: begin
        out_r = 13'h0a4f;
        case (key_hi)
          1'h1: out_r = 13'h090e;
          default: begin end
        endcase
      end
      12'ha69: begin
        out_r = 13'h0b3b;
        case (key_hi)
          1'h1: out_r = 13'h0b46;
          default: begin end
        endcase
      end
      12'ha6a: begin
        out_r = 13'h0951;
        case (key_hi)
          1'h1: out_r = 13'h0948;
          default: begin end
        endcase
      end
      12'ha6b: begin
        out_r = 13'h0b3e;
        case (key_hi)
          1'h1: out_r = 13'h0b78;
          default: begin end
        endcase
      end
      12'ha6c: begin
        out_r = 13'h094e;
        case (key_hi)
          1'h1: out_r = 13'h05a6;
          default: begin end
        endcase
      end
      12'ha6d: begin
        out_r = 13'h0941;
        case (key_hi)
          1'h1: out_r = 13'h067a;
          default: begin end
        endcase
      end
      12'ha6e: begin
        out_r = 13'h09b1;
        case (key_hi)
          1'h1: out_r = 13'h05a6;
          default: begin end
        endcase
      end
      12'ha6f: begin
        out_r = 13'h0919;
        case (key_hi)
          1'h1: out_r = 13'h0978;
          default: begin end
        endcase
      end
      12'ha70: begin
        out_r = 13'h09a1;
        case (key_hi)
          1'h1: out_r = 13'h078b;
          default: begin end
        endcase
      end
      12'ha71: begin
        out_r = 13'h095a;
        case (key_hi)
          1'h1: out_r = 13'h0a55;
          default: begin end
        endcase
      end
      12'ha72: begin
        out_r = 13'h09a9;
        case (key_hi)
          1'h1: out_r = 13'h0b80;
          default: begin end
        endcase
      end
      12'ha73: begin
        out_r = 13'h0b98;
        case (key_hi)
          1'h1: out_r = 13'h05d6;
          default: begin end
        endcase
      end
      12'ha74: begin
        out_r = 13'h0556;
        case (key_hi)
          1'h1: out_r = 13'h0a17;
          default: begin end
        endcase
      end
      12'ha75: begin
        out_r = 13'h0bb8;
        case (key_hi)
          1'h1: out_r = 13'h09e9;
          default: begin end
        endcase
      end
      12'ha76: begin
        out_r = 13'h05e6;
        case (key_hi)
          1'h1: out_r = 13'h0ba9;
          default: begin end
        endcase
      end
      12'ha77: begin
        out_r = 13'h0a87;
        case (key_hi)
          1'h1: out_r = 13'h09e9;
          default: begin end
        endcase
      end
      12'ha78: begin
        out_r = 13'h09a1;
        case (key_hi)
          1'h1: out_r = 13'h078b;
          default: begin end
        endcase
      end
      12'ha79: begin
        out_r = 13'h0ac7;
        case (key_hi)
          1'h1: out_r = 13'h05d6;
          default: begin end
        endcase
      end
      12'ha7a: begin
        out_r = 13'h09a9;
        case (key_hi)
          1'h1: out_r = 13'h0b81;
          default: begin end
        endcase
      end
      12'ha7b: begin
        out_r = 13'h0b98;
        case (key_hi)
          1'h1: out_r = 13'h05d6;
          default: begin end
        endcase
      end
      12'ha7c: begin
        out_r = 13'h0556;
        case (key_hi)
          1'h1: out_r = 13'h09e1;
          default: begin end
        endcase
      end
      12'ha7d: begin
        out_r = 13'h0999;
        case (key_hi)
          1'h1: out_r = 13'h09e9;
          default: begin end
        endcase
      end
      12'ha7e: begin
        out_r = 13'h0556;
        case (key_hi)
          1'h1: out_r = 13'h09e1;
          default: begin end
        endcase
      end
      12'ha7f: begin
        out_r = 13'h07a7;
        case (key_hi)
          1'h1: out_r = 13'h09e0;
          default: begin end
        endcase
      end
      12'ha80: begin
        out_r = 13'h0a01;
        case (key_hi)
          1'h1: out_r = 13'h0aa4;
          default: begin end
        endcase
      end
      12'ha81: begin
        out_r = 13'h0a3a;
      end
      12'ha82: begin
        out_r = 13'h0a09;
        case (key_hi)
          1'h1: out_r = 13'h07f7;
          default: begin end
        endcase
      end
      12'ha83: begin
        out_r = 13'h0b61;
        case (key_hi)
          1'h1: out_r = 13'h0bf1;
          default: begin end
        endcase
      end
      12'ha84: begin
        out_r = 13'h0a11;
        case (key_hi)
          1'h1: out_r = 13'h0ab1;
          default: begin end
        endcase
      end
      12'ha85: begin
        out_r = 13'h0a19;
        case (key_hi)
          1'h1: out_r = 13'h0bee;
          default: begin end
        endcase
      end
      12'ha86: begin
        out_r = 13'h060c;
        case (key_hi)
          1'h1: out_r = 13'h0ae4;
          default: begin end
        endcase
      end
      12'ha87: begin
        out_r = 13'h0ae9;
        case (key_hi)
          1'h1: out_r = 13'h0bee;
          default: begin end
        endcase
      end
      12'ha88: begin
        out_r = 13'h0a21;
        case (key_hi)
          1'h1: out_r = 13'h0aa8;
          default: begin end
        endcase
      end
      12'ha89: begin
        out_r = 13'h053a;
        case (key_hi)
          1'h1: out_r = 13'h0a3a;
          default: begin end
        endcase
      end
      12'ha8a: begin
        out_r = 13'h0a29;
        case (key_hi)
          1'h1: out_r = 13'h0aa0;
          default: begin end
        endcase
      end
      12'ha8b: begin
        out_r = 13'h0b46;
        case (key_hi)
          1'h1: out_r = 13'h0bc7;
          default: begin end
        endcase
      end
      12'ha8c: begin
        out_r = 13'h0a35;
        case (key_hi)
          1'h1: out_r = 13'h0aee;
          default: begin end
        endcase
      end
      12'ha8d: begin
        out_r = 13'h0a3a;
        case (key_hi)
          1'h1: out_r = 13'h0aba;
          default: begin end
        endcase
      end
      12'ha8e: begin
        out_r = 13'h0b11;
        case (key_hi)
          1'h1: out_r = 13'h0aee;
          default: begin end
        endcase
      end
      12'ha8f: begin
        out_r = 13'h061a;
        case (key_hi)
          1'h1: out_r = 13'h0be9;
          default: begin end
        endcase
      end
      12'ha90: begin
        out_r = 13'h0a41;
        case (key_hi)
          1'h1: out_r = 13'h0a6e;
          default: begin end
        endcase
      end
      12'ha91: begin
        out_r = 13'h0786;
        case (key_hi)
          1'h1: out_r = 13'h0686;
          default: begin end
        endcase
      end
      12'ha92: begin
        out_r = 13'h0a49;
        case (key_hi)
          1'h1: out_r = 13'h0afc;
          default: begin end
        endcase
      end
      12'ha93: begin
        out_r = 13'h0b8e;
      end
      12'ha94: begin
        out_r = 13'h0a61;
        case (key_hi)
          1'h1: out_r = 13'h0bb5;
          default: begin end
        endcase
      end
      12'ha95: begin
        out_r = 13'h0bba;
      end
      12'ha96: begin
        out_r = 13'h0a6e;
        case (key_hi)
          1'h1: out_r = 13'h0a7e;
          default: begin end
        endcase
      end
      12'ha97: begin
        out_r = 13'h0aa9;
        case (key_hi)
          1'h1: out_r = 13'h0bb8;
          default: begin end
        endcase
      end
      12'ha98: begin
        out_r = 13'h079a;
        case (key_hi)
          1'h1: out_r = 13'h0a51;
          default: begin end
        endcase
      end
      12'ha99: begin
        out_r = 13'h0a51;
        case (key_hi)
          1'h1: out_r = 13'h0ad6;
          default: begin end
        endcase
      end
      12'ha9a: begin
        out_r = 13'h095e;
        case (key_hi)
          1'h1: out_r = 13'h0a5c;
          default: begin end
        endcase
      end
      12'ha9b: begin
        out_r = 13'h0b90;
        case (key_hi)
          1'h1: out_r = 13'h0b91;
          default: begin end
        endcase
      end
      12'ha9c: begin
        out_r = 13'h0a69;
        case (key_hi)
          1'h1: out_r = 13'h0ae1;
          default: begin end
        endcase
      end
      12'ha9d: begin
        out_r = 13'h0a57;
        case (key_hi)
          1'h1: out_r = 13'h0bba;
          default: begin end
        endcase
      end
      12'ha9e: begin
        out_r = 13'h0a69;
        case (key_hi)
          1'h1: out_r = 13'h0ae1;
          default: begin end
        endcase
      end
      12'ha9f: begin
        out_r = 13'h0aa9;
        case (key_hi)
          1'h1: out_r = 13'h0bb8;
          default: begin end
        endcase
      end
      12'haa0: begin
        out_r = 13'h0a81;
        case (key_hi)
          1'h1: out_r = 13'h0aa8;
          default: begin end
        endcase
      end
      12'haa1: begin
        out_r = 13'h09c7;
        case (key_hi)
          1'h1: out_r = 13'h0b7b;
          default: begin end
        endcase
      end
      12'haa2: begin
        out_r = 13'h0a89;
        case (key_hi)
          1'h1: out_r = 13'h050e;
          default: begin end
        endcase
      end
      12'haa3: begin
        out_r = 13'h0bf1;
        case (key_hi)
          1'h1: out_r = 13'h0b05;
          default: begin end
        endcase
      end
      12'haa4: begin
        out_r = 13'h0a91;
        case (key_hi)
          1'h1: out_r = 13'h0ab5;
          default: begin end
        endcase
      end
      12'haa5: begin
        out_r = 13'h0a99;
        case (key_hi)
          1'h1: out_r = 13'h0b19;
          default: begin end
        endcase
      end
      12'haa6: begin
        out_r = 13'h0656;
        case (key_hi)
          1'h1: out_r = 13'h07e6;
          default: begin end
        endcase
      end
      12'haa7: begin
        out_r = 13'h0a9e;
        case (key_hi)
          1'h1: out_r = 13'h0b19;
          default: begin end
        endcase
      end
      12'haa8: begin
        out_r = 13'h0aa1;
        case (key_hi)
          1'h1: out_r = 13'h054b;
          default: begin end
        endcase
      end
      12'haa9: begin
        out_r = 13'h0b7b;
        case (key_hi)
          1'h1: out_r = 13'h053a;
          default: begin end
        endcase
      end
      12'haaa: begin
        out_r = 13'h0aa9;
        case (key_hi)
          1'h1: out_r = 13'h0a8e;
          default: begin end
        endcase
      end
      12'haab: begin
        out_r = 13'h0bc7;
        case (key_hi)
          1'h1: out_r = 13'h0726;
          default: begin end
        endcase
      end
      12'haac: begin
        out_r = 13'h0ab5;
        case (key_hi)
          1'h1: out_r = 13'h0a91;
          default: begin end
        endcase
      end
      12'haad: begin
        out_r = 13'h0aba;
        case (key_hi)
          1'h1: out_r = 13'h0b19;
          default: begin end
        endcase
      end
      12'haae: begin
        out_r = 13'h0b67;
        case (key_hi)
          1'h1: out_r = 13'h0a91;
          default: begin end
        endcase
      end
      12'haaf: begin
        out_r = 13'h0a91;
        case (key_hi)
          1'h1: out_r = 13'h0b19;
          default: begin end
        endcase
      end
      12'hab0: begin
        out_r = 13'h0ad1;
        case (key_hi)
          1'h1: out_r = 13'h050b;
          default: begin end
        endcase
      end
      12'hab1: begin
        out_r = 13'h0ac5;
        case (key_hi)
          1'h1: out_r = 13'h0797;
          default: begin end
        endcase
      end
      12'hab2: begin
        out_r = 13'h0ad9;
        case (key_hi)
          1'h1: out_r = 13'h0a00;
          default: begin end
        endcase
      end
      12'hab3: begin
        out_r = 13'h0b99;
        case (key_hi)
          1'h1: out_r = 13'h0786;
          default: begin end
        endcase
      end
      12'hab4: begin
        out_r = 13'h07af;
        case (key_hi)
          1'h1: out_r = 13'h0a14;
          default: begin end
        endcase
      end
      12'hab5: begin
        out_r = 13'h0967;
        case (key_hi)
          1'h1: out_r = 13'h07ba;
          default: begin end
        endcase
      end
      12'hab6: begin
        out_r = 13'h0ae1;
        case (key_hi)
          1'h1: out_r = 13'h0a10;
          default: begin end
        endcase
      end
      12'hab7: begin
        out_r = 13'h0a7b;
        case (key_hi)
          1'h1: out_r = 13'h0bae;
          default: begin end
        endcase
      end
      12'hab8: begin
        out_r = 13'h0ad1;
        case (key_hi)
          1'h1: out_r = 13'h050b;
          default: begin end
        endcase
      end
      12'hab9: begin
        out_r = 13'h073b;
        case (key_hi)
          1'h1: out_r = 13'h0b81;
          default: begin end
        endcase
      end
      12'haba: begin
        out_r = 13'h0b8e;
      end
      12'habb: begin
        out_r = 13'h0b99;
        case (key_hi)
          1'h1: out_r = 13'h0786;
          default: begin end
        endcase
      end
      12'habc: begin
        out_r = 13'h056c;
        case (key_hi)
          1'h1: out_r = 13'h0974;
          default: begin end
        endcase
      end
      12'habd: begin
        out_r = 13'h0aee;
        case (key_hi)
          1'h1: out_r = 13'h0bae;
          default: begin end
        endcase
      end
      12'habe: begin
        out_r = 13'h056c;
        case (key_hi)
          1'h1: out_r = 13'h0974;
          default: begin end
        endcase
      end
      12'habf: begin
        out_r = 13'h0513;
        case (key_hi)
          1'h1: out_r = 13'h0ba0;
          default: begin end
        endcase
      end
      12'hac0: begin
        out_r = 13'h0b4e;
        case (key_hi)
          1'h1: out_r = 13'h0b71;
          default: begin end
        endcase
      end
      12'hac1: begin
        out_r = 13'h0afa;
        case (key_hi)
          1'h1: out_r = 13'h0bf1;
          default: begin end
        endcase
      end
      12'hac2: begin
        out_r = 13'h0b41;
        case (key_hi)
          1'h1: out_r = 13'h0949;
          default: begin end
        endcase
      end
      12'hac3: begin
        out_r = 13'h092e;
        case (key_hi)
          1'h1: out_r = 13'h0bd5;
          default: begin end
        endcase
      end
      12'hac4: begin
        out_r = 13'h0b51;
        case (key_hi)
          1'h1: out_r = 13'h0753;
          default: begin end
        endcase
      end
      12'hac5: begin
        out_r = 13'h0b59;
        case (key_hi)
          1'h1: out_r = 13'h0707;
          default: begin end
        endcase
      end
      12'hac6: begin
        out_r = 13'h0516;
        case (key_hi)
          1'h1: out_r = 13'h0b14;
          default: begin end
        endcase
      end
      12'hac7: begin
        out_r = 13'h0b19;
        case (key_hi)
          1'h1: out_r = 13'h0707;
          default: begin end
        endcase
      end
      12'hac8: begin
        out_r = 13'h0b6e;
        case (key_hi)
          1'h1: out_r = 13'h092e;
          default: begin end
        endcase
      end
      12'hac9: begin
        out_r = 13'h0a27;
        case (key_hi)
          1'h1: out_r = 13'h06d7;
          default: begin end
        endcase
      end
      12'haca: begin
        out_r = 13'h0b61;
        case (key_hi)
          1'h1: out_r = 13'h092e;
          default: begin end
        endcase
      end
      12'hacb: begin
        out_r = 13'h0901;
        case (key_hi)
          1'h1: out_r = 13'h0959;
          default: begin end
        endcase
      end
      12'hacc: begin
        out_r = 13'h05e7;
        case (key_hi)
          1'h1: out_r = 13'h0aeb;
          default: begin end
        endcase
      end
      12'hacd: begin
        out_r = 13'h0b51;
        case (key_hi)
          1'h1: out_r = 13'h0b66;
          default: begin end
        endcase
      end
      12'hace: begin
        out_r = 13'h09a0;
        case (key_hi)
          1'h1: out_r = 13'h0aeb;
          default: begin end
        endcase
      end
      12'hacf: begin
        out_r = 13'h0b1e;
        case (key_hi)
          1'h1: out_r = 13'h0567;
          default: begin end
        endcase
      end
      12'had0: begin
        out_r = 13'h0b91;
        case (key_hi)
          1'h1: out_r = 13'h057e;
          default: begin end
        endcase
      end
      12'had1: begin
        out_r = 13'h0ad7;
        case (key_hi)
          1'h1: out_r = 13'h0526;
          default: begin end
        endcase
      end
      12'had2: begin
        out_r = 13'h0566;
        case (key_hi)
          1'h1: out_r = 13'h0b91;
          default: begin end
        endcase
      end
      12'had3: begin
        out_r = 13'h05fa;
        case (key_hi)
          1'h1: out_r = 13'h092e;
          default: begin end
        endcase
      end
      12'had4: begin
        out_r = 13'h0ba1;
        case (key_hi)
          1'h1: out_r = 13'h09e1;
          default: begin end
        endcase
      end
      12'had5: begin
        out_r = 13'h05aa;
        case (key_hi)
          1'h1: out_r = 13'h091e;
          default: begin end
        endcase
      end
      12'had6: begin
        out_r = 13'h0ba1;
        case (key_hi)
          1'h1: out_r = 13'h0996;
          default: begin end
        endcase
      end
      12'had7: begin
        out_r = 13'h0999;
        case (key_hi)
          1'h1: out_r = 13'h091e;
          default: begin end
        endcase
      end
      12'had8: begin
        out_r = 13'h0b89;
        case (key_hi)
          1'h1: out_r = 13'h078b;
          default: begin end
        endcase
      end
      12'had9: begin
        out_r = 13'h0a87;
        case (key_hi)
          1'h1: out_r = 13'h0a07;
          default: begin end
        endcase
      end
      12'hada: begin
        out_r = 13'h0b8e;
      end
      12'hadb: begin
        out_r = 13'h09a4;
        case (key_hi)
          1'h1: out_r = 13'h0901;
          default: begin end
        endcase
      end
      12'hadc: begin
        out_r = 13'h09e7;
        case (key_hi)
          1'h1: out_r = 13'h09e1;
          default: begin end
        endcase
      end
      12'hadd: begin
        out_r = 13'h0bae;
        case (key_hi)
          1'h1: out_r = 13'h0919;
          default: begin end
        endcase
      end
      12'hade: begin
        out_r = 13'h09e7;
        case (key_hi)
          1'h1: out_r = 13'h09e1;
          default: begin end
        endcase
      end
      12'hadf: begin
        out_r = 13'h07a7;
        case (key_hi)
          1'h1: out_r = 13'h0910;
          default: begin end
        endcase
      end
      12'hae0: begin
        out_r = 13'h0b4e;
        case (key_hi)
          1'h1: out_r = 13'h0b71;
          default: begin end
        endcase
      end
      12'hae1: begin
        out_r = 13'h0afa;
        case (key_hi)
          1'h1: out_r = 13'h0bf1;
          default: begin end
        endcase
      end
      12'hae2: begin
        out_r = 13'h0b41;
        case (key_hi)
          1'h1: out_r = 13'h0949;
          default: begin end
        endcase
      end
      12'hae3: begin
        out_r = 13'h092e;
        case (key_hi)
          1'h1: out_r = 13'h0bd5;
          default: begin end
        endcase
      end
      12'hae4: begin
        out_r = 13'h0516;
        case (key_hi)
          1'h1: out_r = 13'h0b54;
          default: begin end
        endcase
      end
      12'hae5: begin
        out_r = 13'h0919;
        case (key_hi)
          1'h1: out_r = 13'h0945;
          default: begin end
        endcase
      end
      12'hae6: begin
        out_r = 13'h0b51;
        case (key_hi)
          1'h1: out_r = 13'h0b11;
          default: begin end
        endcase
      end
      12'hae7: begin
        out_r = 13'h0b1e;
        case (key_hi)
          1'h1: out_r = 13'h0964;
          default: begin end
        endcase
      end
      12'hae8: begin
        out_r = 13'h0b7e;
        case (key_hi)
          1'h1: out_r = 13'h09bc;
          default: begin end
        endcase
      end
      12'hae9: begin
        out_r = 13'h0b38;
        case (key_hi)
          1'h1: out_r = 13'h0b24;
          default: begin end
        endcase
      end
      12'haea: begin
        out_r = 13'h0b75;
        case (key_hi)
          1'h1: out_r = 13'h090e;
          default: begin end
        endcase
      end
      12'haeb: begin
        out_r = 13'h093a;
        case (key_hi)
          1'h1: out_r = 13'h0941;
          default: begin end
        endcase
      end
      12'haec: begin
        out_r = 13'h05e7;
        case (key_hi)
          1'h1: out_r = 13'h0aeb;
          default: begin end
        endcase
      end
      12'haed: begin
        out_r = 13'h0b51;
        case (key_hi)
          1'h1: out_r = 13'h0b66;
          default: begin end
        endcase
      end
      12'haee: begin
        out_r = 13'h09a0;
        case (key_hi)
          1'h1: out_r = 13'h0aeb;
          default: begin end
        endcase
      end
      12'haef: begin
        out_r = 13'h0b1e;
        case (key_hi)
          1'h1: out_r = 13'h0567;
          default: begin end
        endcase
      end
      12'haf0: begin
        out_r = 13'h0b91;
        case (key_hi)
          1'h1: out_r = 13'h0961;
          default: begin end
        endcase
      end
      12'haf1: begin
        out_r = 13'h0b99;
        case (key_hi)
          1'h1: out_r = 13'h055a;
          default: begin end
        endcase
      end
      12'haf2: begin
        out_r = 13'h0ab7;
        case (key_hi)
          1'h1: out_r = 13'h0b91;
          default: begin end
        endcase
      end
      12'haf3: begin
        out_r = 13'h0abb;
        case (key_hi)
          1'h1: out_r = 13'h0a86;
          default: begin end
        endcase
      end
      12'haf4: begin
        out_r = 13'h0bb1;
        case (key_hi)
          1'h1: out_r = 13'h09e1;
          default: begin end
        endcase
      end
      12'haf5: begin
        out_r = 13'h0bba;
        case (key_hi)
          1'h1: out_r = 13'h0546;
          default: begin end
        endcase
      end
      12'haf6: begin
        out_r = 13'h0bbe;
        case (key_hi)
          1'h1: out_r = 13'h0ba8;
          default: begin end
        endcase
      end
      12'haf7: begin
        out_r = 13'h067b;
        case (key_hi)
          1'h1: out_r = 13'h09e9;
          default: begin end
        endcase
      end
      12'haf8: begin
        out_r = 13'h0b91;
        case (key_hi)
          1'h1: out_r = 13'h0961;
          default: begin end
        endcase
      end
      12'haf9: begin
        out_r = 13'h0b9e;
        case (key_hi)
          1'h1: out_r = 13'h0b9c;
          default: begin end
        endcase
      end
      12'hafa: begin
        out_r = 13'h0ab7;
        case (key_hi)
          1'h1: out_r = 13'h0bbe;
          default: begin end
        endcase
      end
      12'hafb: begin
        out_r = 13'h0abb;
        case (key_hi)
          1'h1: out_r = 13'h0a86;
          default: begin end
        endcase
      end
      12'hafc: begin
        out_r = 13'h0b89;
        case (key_hi)
          1'h1: out_r = 13'h078b;
          default: begin end
        endcase
      end
      12'hafd: begin
        out_r = 13'h0b8e;
        case (key_hi)
          1'h1: out_r = 13'h09ee;
          default: begin end
        endcase
      end
      12'hafe: begin
        out_r = 13'h0b89;
        case (key_hi)
          1'h1: out_r = 13'h078b;
          default: begin end
        endcase
      end
      12'haff: begin
        out_r = 13'h0643;
        case (key_hi)
          1'h1: out_r = 13'h09e0;
          default: begin end
        endcase
      end
      12'hb00: begin
        out_r = 13'h0d35;
        case (key_hi)
          1'h1: out_r = 13'h0d37;
          default: begin end
        endcase
      end
      12'hb01: begin
        out_r = 13'h0d3b;
      end
      12'hb02: begin
        out_r = 13'h0d31;
        case (key_hi)
          1'h1: out_r = 13'h0d30;
          default: begin end
        endcase
      end
      12'hb03: begin
        out_r = 13'h0d3a;
      end
      12'hb04: begin
        out_r = 13'h0d11;
        case (key_hi)
          1'h1: out_r = 13'h0d13;
          default: begin end
        endcase
      end
      12'hb05: begin
        out_r = 13'h0d19;
      end
      12'hb06: begin
        out_r = 13'h0d16;
        case (key_hi)
          1'h1: out_r = 13'h0d14;
          default: begin end
        endcase
      end
      12'hb07: begin
        out_r = 13'h0d19;
      end
      12'hb08: begin
        out_r = 13'h0d01;
      end
      12'hb09: begin
        out_r = 13'h0d06;
      end
      12'hb0a: begin
        out_r = 13'h0d0e;
      end
      12'hb0b: begin
        out_r = 13'h0d07;
      end
      12'hb0c: begin
        out_r = 13'h0d11;
      end
      12'hb0d: begin
        out_r = 13'h0d1b;
      end
      12'hb0e: begin
        out_r = 13'h0d11;
      end
      12'hb0f: begin
        out_r = 13'h0d1a;
        case (key_hi)
          1'h1: out_r = 13'h0d18;
          default: begin end
        endcase
      end
      12'hb10: begin
        out_r = 13'h0d41;
        case (key_hi)
          1'h1: out_r = 13'h0d43;
          default: begin end
        endcase
      end
      12'hb11: begin
        out_r = 13'h0d46;
      end
      12'hb12: begin
        out_r = 13'h0d49;
        case (key_hi)
          1'h1: out_r = 13'h0d4b;
          default: begin end
        endcase
      end
      12'hb13: begin
        out_r = 13'h0d4e;
      end
      12'hb14: begin
        out_r = 13'h0d6e;
      end
      12'hb15: begin
        out_r = 13'h0d67;
      end
      12'hb16: begin
        out_r = 13'h0d69;
      end
      12'hb17: begin
        out_r = 13'h0d66;
        case (key_hi)
          1'h1: out_r = 13'h0d64;
          default: begin end
        endcase
      end
      12'hb18: begin
        out_r = 13'h0d56;
        case (key_hi)
          1'h1: out_r = 13'h0d54;
          default: begin end
        endcase
      end
      12'hb19: begin
        out_r = 13'h0d59;
      end
      12'hb1a: begin
        out_r = 13'h0d57;
      end
      12'hb1b: begin
        out_r = 13'h0d50;
        case (key_hi)
          1'h1: out_r = 13'h0d51;
          default: begin end
        endcase
      end
      12'hb1c: begin
        out_r = 13'h0d61;
      end
      12'hb1d: begin
        out_r = 13'h0d66;
      end
      12'hb1e: begin
        out_r = 13'h0d61;
      end
      12'hb1f: begin
        out_r = 13'h0d66;
        case (key_hi)
          1'h1: out_r = 13'h0d64;
          default: begin end
        endcase
      end
      12'hb20: begin
        out_r = 13'h0db5;
      end
      12'hb21: begin
        out_r = 13'h0dba;
      end
      12'hb22: begin
        out_r = 13'h0db1;
      end
      12'hb23: begin
        out_r = 13'h0dba;
      end
      12'hb24: begin
        out_r = 13'h0d91;
        case (key_hi)
          1'h1: out_r = 13'h0d93;
          default: begin end
        endcase
      end
      12'hb25: begin
        out_r = 13'h0d99;
      end
      12'hb26: begin
        out_r = 13'h0d96;
        case (key_hi)
          1'h1: out_r = 13'h0d94;
          default: begin end
        endcase
      end
      12'hb27: begin
        out_r = 13'h0d99;
      end
      12'hb28: begin
        out_r = 13'h0d81;
      end
      12'hb29: begin
        out_r = 13'h0d86;
      end
      12'hb2a: begin
        out_r = 13'h0d8e;
      end
      12'hb2b: begin
        out_r = 13'h0d86;
      end
      12'hb2c: begin
        out_r = 13'h0d91;
      end
      12'hb2d: begin
        out_r = 13'h0d9e;
      end
      12'hb2e: begin
        out_r = 13'h0d90;
        case (key_hi)
          1'h1: out_r = 13'h0d91;
          default: begin end
        endcase
      end
      12'hb2f: begin
        out_r = 13'h0d9e;
      end
      12'hb30: begin
        out_r = 13'h0d57;
      end
      12'hb31: begin
        out_r = 13'h0d59;
      end
      12'hb32: begin
        out_r = 13'h0d56;
      end
      12'hb33: begin
        out_r = 13'h0d59;
      end
      12'hb34: begin
        out_r = 13'h0d49;
        case (key_hi)
          1'h1: out_r = 13'h0d4b;
          default: begin end
        endcase
      end
      12'hb35: begin
        out_r = 13'h0d47;
      end
      12'hb36: begin
        out_r = 13'h0d41;
        case (key_hi)
          1'h1: out_r = 13'h0d40;
          default: begin end
        endcase
      end
      12'hb37: begin
        out_r = 13'h0d46;
        case (key_hi)
          1'h1: out_r = 13'h0d44;
          default: begin end
        endcase
      end
      12'hb38: begin
        out_r = 13'h0d57;
      end
      12'hb39: begin
        out_r = 13'h0d59;
      end
      12'hb3a: begin
        out_r = 13'h0d50;
      end
      12'hb3b: begin
        out_r = 13'h0d59;
      end
      12'hb3c: begin
        out_r = 13'h0d7e;
      end
      12'hb3d: begin
        out_r = 13'h0d7a;
      end
      12'hb3e: begin
        out_r = 13'h0d7e;
      end
      12'hb3f: begin
        out_r = 13'h0d7b;
        case (key_hi)
          1'h1: out_r = 13'h0d78;
          default: begin end
        endcase
      end
      12'hb40: begin
        out_r = 13'h0e41;
        case (key_hi)
          1'h1: out_r = 13'h0e43;
          default: begin end
        endcase
      end
      12'hb41: begin
        out_r = 13'h0e46;
      end
      12'hb42: begin
        out_r = 13'h0e49;
        case (key_hi)
          1'h1: out_r = 13'h0e4b;
          default: begin end
        endcase
      end
      12'hb43: begin
        out_r = 13'h0e4e;
      end
      12'hb44: begin
        out_r = 13'h0e69;
      end
      12'hb45: begin
        out_r = 13'h0e67;
      end
      12'hb46: begin
        out_r = 13'h0e6e;
      end
      12'hb47: begin
        out_r = 13'h0e67;
      end
      12'hb48: begin
        out_r = 13'h0e56;
        case (key_hi)
          1'h1: out_r = 13'h0e54;
          default: begin end
        endcase
      end
      12'hb49: begin
        out_r = 13'h0e59;
      end
      12'hb4a: begin
        out_r = 13'h0e57;
      end
      12'hb4b: begin
        out_r = 13'h0e51;
      end
      12'hb4c: begin
        out_r = 13'h0e61;
      end
      12'hb4d: begin
        out_r = 13'h0e66;
      end
      12'hb4e: begin
        out_r = 13'h0e61;
      end
      12'hb4f: begin
        out_r = 13'h0e67;
        case (key_hi)
          1'h1: out_r = 13'h0e64;
          default: begin end
        endcase
      end
      12'hb50: begin
        out_r = 13'h0e81;
        case (key_hi)
          1'h1: out_r = 13'h0e83;
          default: begin end
        endcase
      end
      12'hb51: begin
        out_r = 13'h0e86;
      end
      12'hb52: begin
        out_r = 13'h0e89;
        case (key_hi)
          1'h1: out_r = 13'h0e8b;
          default: begin end
        endcase
      end
      12'hb53: begin
        out_r = 13'h0e8e;
      end
      12'hb54: begin
        out_r = 13'h0e97;
        case (key_hi)
          1'h1: out_r = 13'h0e94;
          default: begin end
        endcase
      end
      12'hb55: begin
        out_r = 13'h0e9e;
      end
      12'hb56: begin
        out_r = 13'h0e91;
      end
      12'hb57: begin
        out_r = 13'h0e9e;
      end
      12'hb58: begin
        out_r = 13'h0eab;
      end
      12'hb59: begin
        out_r = 13'h0eae;
      end
      12'hb5a: begin
        out_r = 13'h0ea1;
      end
      12'hb5b: begin
        out_r = 13'h0eae;
      end
      12'hb5c: begin
        out_r = 13'h0e96;
      end
      12'hb5d: begin
        out_r = 13'h0e91;
      end
      12'hb5e: begin
        out_r = 13'h0e96;
      end
      12'hb5f: begin
        out_r = 13'h0e9e;
      end
      12'hb60: begin
        out_r = 13'h0e21;
        case (key_hi)
          1'h1: out_r = 13'h0e23;
          default: begin end
        endcase
      end
      12'hb61: begin
        out_r = 13'h0e26;
      end
      12'hb62: begin
        out_r = 13'h0e29;
        case (key_hi)
          1'h1: out_r = 13'h0e2b;
          default: begin end
        endcase
      end
      12'hb63: begin
        out_r = 13'h0e2e;
      end
      12'hb64: begin
        out_r = 13'h0e11;
        case (key_hi)
          1'h1: out_r = 13'h0e13;
          default: begin end
        endcase
      end
      12'hb65: begin
        out_r = 13'h0e1e;
      end
      12'hb66: begin
        out_r = 13'h0e17;
      end
      12'hb67: begin
        out_r = 13'h0e1e;
      end
      12'hb68: begin
        out_r = 13'h0e3e;
      end
      12'hb69: begin
        out_r = 13'h0e3b;
      end
      12'hb6a: begin
        out_r = 13'h0e35;
      end
      12'hb6b: begin
        out_r = 13'h0e38;
        case (key_hi)
          1'h1: out_r = 13'h0e3a;
          default: begin end
        endcase
      end
      12'hb6c: begin
        out_r = 13'h0e0e;
      end
      12'hb6d: begin
        out_r = 13'h0e01;
      end
      12'hb6e: begin
        out_r = 13'h0e0e;
      end
      12'hb6f: begin
        out_r = 13'h0e06;
        case (key_hi)
          1'h1: out_r = 13'h0e04;
          default: begin end
        endcase
      end
      12'hb70: begin
        out_r = 13'h0ea1;
        case (key_hi)
          1'h1: out_r = 13'h0ea3;
          default: begin end
        endcase
      end
      12'hb71: begin
        out_r = 13'h0ea6;
      end
      12'hb72: begin
        out_r = 13'h0eab;
        case (key_hi)
          1'h1: out_r = 13'h0ea8;
          default: begin end
        endcase
      end
      12'hb73: begin
        out_r = 13'h0ea6;
      end
      12'hb74: begin
        out_r = 13'h0ebe;
      end
      12'hb75: begin
        out_r = 13'h0ebb;
      end
      12'hb76: begin
        out_r = 13'h0eb5;
      end
      12'hb77: begin
        out_r = 13'h0eba;
        case (key_hi)
          1'h1: out_r = 13'h0eb8;
          default: begin end
        endcase
      end
      12'hb78: begin
        out_r = 13'h0ea1;
        case (key_hi)
          1'h1: out_r = 13'h0ea3;
          default: begin end
        endcase
      end
      12'hb79: begin
        out_r = 13'h0ea6;
      end
      12'hb7a: begin
        out_r = 13'h0eab;
      end
      12'hb7b: begin
        out_r = 13'h0ea6;
      end
      12'hb7c: begin
        out_r = 13'h0e89;
        case (key_hi)
          1'h1: out_r = 13'h0e8b;
          default: begin end
        endcase
      end
      12'hb7d: begin
        out_r = 13'h0e8e;
      end
      12'hb7e: begin
        out_r = 13'h0e89;
        case (key_hi)
          1'h1: out_r = 13'h0e8b;
          default: begin end
        endcase
      end
      12'hb7f: begin
        out_r = 13'h0e83;
        case (key_hi)
          1'h1: out_r = 13'h0e80;
          default: begin end
        endcase
      end
      12'hb80: begin
        out_r = 13'h0d35;
        case (key_hi)
          1'h1: out_r = 13'h0d37;
          default: begin end
        endcase
      end
      12'hb81: begin
        out_r = 13'h0d3b;
      end
      12'hb82: begin
        out_r = 13'h0d31;
        case (key_hi)
          1'h1: out_r = 13'h0d30;
          default: begin end
        endcase
      end
      12'hb83: begin
        out_r = 13'h0d3a;
      end
      12'hb84: begin
        out_r = 13'h0d11;
        case (key_hi)
          1'h1: out_r = 13'h0d13;
          default: begin end
        endcase
      end
      12'hb85: begin
        out_r = 13'h0d19;
      end
      12'hb86: begin
        out_r = 13'h0d16;
        case (key_hi)
          1'h1: out_r = 13'h0d14;
          default: begin end
        endcase
      end
      12'hb87: begin
        out_r = 13'h0d19;
      end
      12'hb88: begin
        out_r = 13'h0d01;
      end
      12'hb89: begin
        out_r = 13'h0d06;
      end
      12'hb8a: begin
        out_r = 13'h0d0e;
      end
      12'hb8b: begin
        out_r = 13'h0d07;
      end
      12'hb8c: begin
        out_r = 13'h0d11;
      end
      12'hb8d: begin
        out_r = 13'h0d1b;
      end
      12'hb8e: begin
        out_r = 13'h0d11;
      end
      12'hb8f: begin
        out_r = 13'h0d1a;
        case (key_hi)
          1'h1: out_r = 13'h0d18;
          default: begin end
        endcase
      end
      12'hb90: begin
        out_r = 13'h0d56;
        case (key_hi)
          1'h1: out_r = 13'h0d54;
          default: begin end
        endcase
      end
      12'hb91: begin
        out_r = 13'h0d59;
      end
      12'hb92: begin
        out_r = 13'h0d57;
      end
      12'hb93: begin
        out_r = 13'h0d51;
      end
      12'hb94: begin
        out_r = 13'h0d69;
      end
      12'hb95: begin
        out_r = 13'h0d67;
      end
      12'hb96: begin
        out_r = 13'h0d6e;
      end
      12'hb97: begin
        out_r = 13'h0d67;
      end
      12'hb98: begin
        out_r = 13'h0d4e;
      end
      12'hb99: begin
        out_r = 13'h0d46;
      end
      12'hb9a: begin
        out_r = 13'h0d41;
      end
      12'hb9b: begin
        out_r = 13'h0d44;
        case (key_hi)
          1'h1: out_r = 13'h0d47;
          default: begin end
        endcase
      end
      12'hb9c: begin
        out_r = 13'h0d6c;
      end
      12'hb9d: begin
        out_r = 13'h0d66;
      end
      12'hb9e: begin
        out_r = 13'h0d6c;
      end
      12'hb9f: begin
        out_r = 13'h0d66;
        case (key_hi)
          1'h1: out_r = 13'h0d64;
          default: begin end
        endcase
      end
      12'hba0: begin
        out_r = 13'h0dfe;
        case (key_hi)
          1'h1: out_r = 13'h0dfc;
          default: begin end
        endcase
      end
      12'hba1: begin
        out_r = 13'h0dfb;
      end
      12'hba2: begin
        out_r = 13'h0df1;
      end
      12'hba3: begin
        out_r = 13'h0dfb;
      end
      12'hba4: begin
        out_r = 13'h0de7;
      end
      12'hba5: begin
        out_r = 13'h0de1;
      end
      12'hba6: begin
        out_r = 13'h0de6;
      end
      12'hba7: begin
        out_r = 13'h0de1;
      end
      12'hba8: begin
        out_r = 13'h0dd1;
      end
      12'hba9: begin
        out_r = 13'h0dd6;
      end
      12'hbaa: begin
        out_r = 13'h0dde;
      end
      12'hbab: begin
        out_r = 13'h0dd7;
      end
      12'hbac: begin
        out_r = 13'h0de1;
      end
      12'hbad: begin
        out_r = 13'h0de9;
      end
      12'hbae: begin
        out_r = 13'h0de1;
      end
      12'hbaf: begin
        out_r = 13'h0de9;
      end
      12'hbb0: begin
        out_r = 13'h0d57;
      end
      12'hbb1: begin
        out_r = 13'h0d59;
      end
      12'hbb2: begin
        out_r = 13'h0d56;
      end
      12'hbb3: begin
        out_r = 13'h0d59;
      end
      12'hbb4: begin
        out_r = 13'h0d49;
        case (key_hi)
          1'h1: out_r = 13'h0d4b;
          default: begin end
        endcase
      end
      12'hbb5: begin
        out_r = 13'h0d47;
      end
      12'hbb6: begin
        out_r = 13'h0d41;
        case (key_hi)
          1'h1: out_r = 13'h0d40;
          default: begin end
        endcase
      end
      12'hbb7: begin
        out_r = 13'h0d46;
        case (key_hi)
          1'h1: out_r = 13'h0d44;
          default: begin end
        endcase
      end
      12'hbb8: begin
        out_r = 13'h0d57;
      end
      12'hbb9: begin
        out_r = 13'h0d59;
      end
      12'hbba: begin
        out_r = 13'h0d50;
      end
      12'hbbb: begin
        out_r = 13'h0d59;
      end
      12'hbbc: begin
        out_r = 13'h0d7e;
      end
      12'hbbd: begin
        out_r = 13'h0d7a;
      end
      12'hbbe: begin
        out_r = 13'h0d7e;
      end
      12'hbbf: begin
        out_r = 13'h0d7b;
        case (key_hi)
          1'h1: out_r = 13'h0d78;
          default: begin end
        endcase
      end
      12'hbc0: begin
        out_r = 13'h0e41;
        case (key_hi)
          1'h1: out_r = 13'h0e43;
          default: begin end
        endcase
      end
      12'hbc1: begin
        out_r = 13'h0e46;
      end
      12'hbc2: begin
        out_r = 13'h0e49;
        case (key_hi)
          1'h1: out_r = 13'h0e4b;
          default: begin end
        endcase
      end
      12'hbc3: begin
        out_r = 13'h0e4e;
      end
      12'hbc4: begin
        out_r = 13'h0e75;
      end
      12'hbc5: begin
        out_r = 13'h0e7a;
      end
      12'hbc6: begin
        out_r = 13'h0e7e;
      end
      12'hbc7: begin
        out_r = 13'h0e7a;
      end
      12'hbc8: begin
        out_r = 13'h0e57;
        case (key_hi)
          1'h1: out_r = 13'h0e54;
          default: begin end
        endcase
      end
      12'hbc9: begin
        out_r = 13'h0e5e;
      end
      12'hbca: begin
        out_r = 13'h0e56;
      end
      12'hbcb: begin
        out_r = 13'h0e51;
      end
      12'hbcc: begin
        out_r = 13'h0e7e;
      end
      12'hbcd: begin
        out_r = 13'h0e7b;
      end
      12'hbce: begin
        out_r = 13'h0e7e;
      end
      12'hbcf: begin
        out_r = 13'h0e7a;
        case (key_hi)
          1'h1: out_r = 13'h0e78;
          default: begin end
        endcase
      end
      12'hbd0: begin
        out_r = 13'h0ec1;
      end
      12'hbd1: begin
        out_r = 13'h0ec6;
      end
      12'hbd2: begin
        out_r = 13'h0ec9;
      end
      12'hbd3: begin
        out_r = 13'h0ec6;
      end
      12'hbd4: begin
        out_r = 13'h0ee1;
        case (key_hi)
          1'h1: out_r = 13'h0ee3;
          default: begin end
        endcase
      end
      12'hbd5: begin
        out_r = 13'h0ee9;
      end
      12'hbd6: begin
        out_r = 13'h0eee;
      end
      12'hbd7: begin
        out_r = 13'h0eeb;
        case (key_hi)
          1'h1: out_r = 13'h0ee8;
          default: begin end
        endcase
      end
      12'hbd8: begin
        out_r = 13'h0ef1;
      end
      12'hbd9: begin
        out_r = 13'h0efa;
      end
      12'hbda: begin
        out_r = 13'h0ef5;
      end
      12'hbdb: begin
        out_r = 13'h0ef8;
        case (key_hi)
          1'h1: out_r = 13'h0efb;
          default: begin end
        endcase
      end
      12'hbdc: begin
        out_r = 13'h0ee6;
      end
      12'hbdd: begin
        out_r = 13'h0eee;
      end
      12'hbde: begin
        out_r = 13'h0ee6;
      end
      12'hbdf: begin
        out_r = 13'h0ee3;
        case (key_hi)
          1'h1: out_r = 13'h0ee0;
          default: begin end
        endcase
      end
      12'hbe0: begin
        out_r = 13'h0e41;
        case (key_hi)
          1'h1: out_r = 13'h0e43;
          default: begin end
        endcase
      end
      12'hbe1: begin
        out_r = 13'h0e46;
      end
      12'hbe2: begin
        out_r = 13'h0e49;
        case (key_hi)
          1'h1: out_r = 13'h0e4b;
          default: begin end
        endcase
      end
      12'hbe3: begin
        out_r = 13'h0e4e;
      end
      12'hbe4: begin
        out_r = 13'h0e75;
      end
      12'hbe5: begin
        out_r = 13'h0e7a;
      end
      12'hbe6: begin
        out_r = 13'h0e7e;
      end
      12'hbe7: begin
        out_r = 13'h0e7a;
      end
      12'hbe8: begin
        out_r = 13'h0e57;
        case (key_hi)
          1'h1: out_r = 13'h0e54;
          default: begin end
        endcase
      end
      12'hbe9: begin
        out_r = 13'h0e5e;
      end
      12'hbea: begin
        out_r = 13'h0e51;
      end
      12'hbeb: begin
        out_r = 13'h0e5e;
      end
      12'hbec: begin
        out_r = 13'h0e7e;
      end
      12'hbed: begin
        out_r = 13'h0e7b;
      end
      12'hbee: begin
        out_r = 13'h0e7e;
      end
      12'hbef: begin
        out_r = 13'h0e7a;
        case (key_hi)
          1'h1: out_r = 13'h0e78;
          default: begin end
        endcase
      end
      12'hbf0: begin
        out_r = 13'h0e21;
        case (key_hi)
          1'h1: out_r = 13'h0e23;
          default: begin end
        endcase
      end
      12'hbf1: begin
        out_r = 13'h0e26;
      end
      12'hbf2: begin
        out_r = 13'h0e29;
        case (key_hi)
          1'h1: out_r = 13'h0e2b;
          default: begin end
        endcase
      end
      12'hbf3: begin
        out_r = 13'h0e2e;
      end
      12'hbf4: begin
        out_r = 13'h0e31;
      end
      12'hbf5: begin
        out_r = 13'h0e3a;
      end
      12'hbf6: begin
        out_r = 13'h0e3e;
      end
      12'hbf7: begin
        out_r = 13'h0e3b;
        case (key_hi)
          1'h1: out_r = 13'h0e38;
          default: begin end
        endcase
      end
      12'hbf8: begin
        out_r = 13'h0e21;
        case (key_hi)
          1'h1: out_r = 13'h0e23;
          default: begin end
        endcase
      end
      12'hbf9: begin
        out_r = 13'h0e26;
      end
      12'hbfa: begin
        out_r = 13'h0e29;
      end
      12'hbfb: begin
        out_r = 13'h0e2e;
      end
      12'hbfc: begin
        out_r = 13'h0e09;
        case (key_hi)
          1'h1: out_r = 13'h0e0b;
          default: begin end
        endcase
      end
      12'hbfd: begin
        out_r = 13'h0e0e;
      end
      12'hbfe: begin
        out_r = 13'h0e09;
        case (key_hi)
          1'h1: out_r = 13'h0e0b;
          default: begin end
        endcase
      end
      12'hbff: begin
        out_r = 13'h0e03;
        case (key_hi)
          1'h1: out_r = 13'h0e00;
          default: begin end
        endcase
      end
      12'hc00: begin
        out_r = 13'h0801;
        case (key_hi)
          1'h1: out_r = 13'h0403;
          default: begin end
        endcase
      end
      12'hc01: begin
        out_r = 13'h0406;
      end
      12'hc02: begin
        out_r = 13'h0809;
        case (key_hi)
          1'h1: out_r = 13'h040b;
          default: begin end
        endcase
      end
      12'hc03: begin
        out_r = 13'h080e;
      end
      12'hc04: begin
        out_r = 13'h0811;
        case (key_hi)
          1'h1: out_r = 13'h0413;
          default: begin end
        endcase
      end
      12'hc05: begin
        out_r = 13'h0819;
      end
      12'hc06: begin
        out_r = 13'h0416;
        case (key_hi)
          1'h1: out_r = 13'h0814;
          default: begin end
        endcase
      end
      12'hc07: begin
        out_r = 13'h0819;
      end
      12'hc08: begin
        out_r = 13'h0821;
        case (key_hi)
          1'h1: out_r = 13'h0423;
          default: begin end
        endcase
      end
      12'hc09: begin
        out_r = 13'h0426;
      end
      12'hc0a: begin
        out_r = 13'h0829;
        case (key_hi)
          1'h1: out_r = 13'h042b;
          default: begin end
        endcase
      end
      12'hc0b: begin
        out_r = 13'h082e;
      end
      12'hc0c: begin
        out_r = 13'h0835;
      end
      12'hc0d: begin
        out_r = 13'h083a;
      end
      12'hc0e: begin
        out_r = 13'h0835;
      end
      12'hc0f: begin
        out_r = 13'h043b;
        case (key_hi)
          1'h1: out_r = 13'h0838;
          default: begin end
        endcase
      end
      12'hc10: begin
        out_r = 13'h0841;
        case (key_hi)
          1'h1: out_r = 13'h0443;
          default: begin end
        endcase
      end
      12'hc11: begin
        out_r = 13'h0446;
      end
      12'hc12: begin
        out_r = 13'h0849;
        case (key_hi)
          1'h1: out_r = 13'h044b;
          default: begin end
        endcase
      end
      12'hc13: begin
        out_r = 13'h084e;
      end
      12'hc14: begin
        out_r = 13'h0861;
      end
      12'hc15: begin
        out_r = 13'h0467;
      end
      12'hc16: begin
        out_r = 13'h086e;
      end
      12'hc17: begin
        out_r = 13'h0866;
        case (key_hi)
          1'h1: out_r = 13'h0864;
          default: begin end
        endcase
      end
      12'hc18: begin
        out_r = 13'h0456;
        case (key_hi)
          1'h1: out_r = 13'h0854;
          default: begin end
        endcase
      end
      12'hc19: begin
        out_r = 13'h0859;
      end
      12'hc1a: begin
        out_r = 13'h0857;
      end
      12'hc1b: begin
        out_r = 13'h0850;
        case (key_hi)
          1'h1: out_r = 13'h0851;
          default: begin end
        endcase
      end
      12'hc1c: begin
        out_r = 13'h0869;
      end
      12'hc1d: begin
        out_r = 13'h0467;
      end
      12'hc1e: begin
        out_r = 13'h0869;
      end
      12'hc1f: begin
        out_r = 13'h0866;
        case (key_hi)
          1'h1: out_r = 13'h0864;
          default: begin end
        endcase
      end
      12'hc20: begin
        out_r = 13'h0881;
        case (key_hi)
          1'h1: out_r = 13'h0483;
          default: begin end
        endcase
      end
      12'hc21: begin
        out_r = 13'h0486;
      end
      12'hc22: begin
        out_r = 13'h0889;
        case (key_hi)
          1'h1: out_r = 13'h048b;
          default: begin end
        endcase
      end
      12'hc23: begin
        out_r = 13'h088e;
      end
      12'hc24: begin
        out_r = 13'h0891;
        case (key_hi)
          1'h1: out_r = 13'h0493;
          default: begin end
        endcase
      end
      12'hc25: begin
        out_r = 13'h0899;
      end
      12'hc26: begin
        out_r = 13'h0496;
        case (key_hi)
          1'h1: out_r = 13'h0894;
          default: begin end
        endcase
      end
      12'hc27: begin
        out_r = 13'h0899;
      end
      12'hc28: begin
        out_r = 13'h08a1;
        case (key_hi)
          1'h1: out_r = 13'h04a3;
          default: begin end
        endcase
      end
      12'hc29: begin
        out_r = 13'h04a6;
      end
      12'hc2a: begin
        out_r = 13'h08a9;
        case (key_hi)
          1'h1: out_r = 13'h04ab;
          default: begin end
        endcase
      end
      12'hc2b: begin
        out_r = 13'h08ae;
      end
      12'hc2c: begin
        out_r = 13'h08b5;
      end
      12'hc2d: begin
        out_r = 13'h08ba;
      end
      12'hc2e: begin
        out_r = 13'h08b5;
      end
      12'hc2f: begin
        out_r = 13'h04bb;
        case (key_hi)
          1'h1: out_r = 13'h08b8;
          default: begin end
        endcase
      end
      12'hc30: begin
        out_r = 13'h08d1;
      end
      12'hc31: begin
        out_r = 13'h04d6;
      end
      12'hc32: begin
        out_r = 13'h08d9;
      end
      12'hc33: begin
        out_r = 13'h08d4;
        case (key_hi)
          1'h1: out_r = 13'h08d7;
          default: begin end
        endcase
      end
      12'hc34: begin
        out_r = 13'h04e6;
      end
      12'hc35: begin
        out_r = 13'h08e9;
      end
      12'hc36: begin
        out_r = 13'h08e1;
        case (key_hi)
          1'h1: out_r = 13'h08e0;
          default: begin end
        endcase
      end
      12'hc37: begin
        out_r = 13'h04eb;
        case (key_hi)
          1'h1: out_r = 13'h08e8;
          default: begin end
        endcase
      end
      12'hc38: begin
        out_r = 13'h08d1;
      end
      12'hc39: begin
        out_r = 13'h04d6;
      end
      12'hc3a: begin
        out_r = 13'h08de;
      end
      12'hc3b: begin
        out_r = 13'h08d4;
        case (key_hi)
          1'h1: out_r = 13'h08d7;
          default: begin end
        endcase
      end
      12'hc3c: begin
        out_r = 13'h08e7;
      end
      12'hc3d: begin
        out_r = 13'h08ee;
      end
      12'hc3e: begin
        out_r = 13'h08e7;
      end
      12'hc3f: begin
        out_r = 13'h04e3;
        case (key_hi)
          1'h1: out_r = 13'h08e0;
          default: begin end
        endcase
      end
      12'hc40: begin
        out_r = 13'h0901;
        case (key_hi)
          1'h1: out_r = 13'h0bd9;
          default: begin end
        endcase
      end
      12'hc41: begin
        out_r = 13'h0506;
      end
      12'hc42: begin
        out_r = 13'h0909;
        case (key_hi)
          1'h1: out_r = 13'h09f1;
          default: begin end
        endcase
      end
      12'hc43: begin
        out_r = 13'h0b61;
        case (key_hi)
          1'h1: out_r = 13'h090e;
          default: begin end
        endcase
      end
      12'hc44: begin
        out_r = 13'h0911;
        case (key_hi)
          1'h1: out_r = 13'h06e3;
          default: begin end
        endcase
      end
      12'hc45: begin
        out_r = 13'h0919;
      end
      12'hc46: begin
        out_r = 13'h0516;
        case (key_hi)
          1'h1: out_r = 13'h0914;
          default: begin end
        endcase
      end
      12'hc47: begin
        out_r = 13'h067a;
        case (key_hi)
          1'h1: out_r = 13'h0919;
          default: begin end
        endcase
      end
      12'hc48: begin
        out_r = 13'h0921;
        case (key_hi)
          1'h1: out_r = 13'h06f7;
          default: begin end
        endcase
      end
      12'hc49: begin
        out_r = 13'h0526;
      end
      12'hc4a: begin
        out_r = 13'h0929;
        case (key_hi)
          1'h1: out_r = 13'h092e;
          default: begin end
        endcase
      end
      12'hc4b: begin
        out_r = 13'h0b46;
        case (key_hi)
          1'h1: out_r = 13'h092e;
          default: begin end
        endcase
      end
      12'hc4c: begin
        out_r = 13'h0935;
      end
      12'hc4d: begin
        out_r = 13'h093a;
      end
      12'hc4e: begin
        out_r = 13'h0935;
      end
      12'hc4f: begin
        out_r = 13'h091e;
        case (key_hi)
          1'h1: out_r = 13'h0938;
          default: begin end
        endcase
      end
      12'hc50: begin
        out_r = 13'h09c1;
        case (key_hi)
          1'h1: out_r = 13'h0653;
          default: begin end
        endcase
      end
      12'hc51: begin
        out_r = 13'h09f1;
        case (key_hi)
          1'h1: out_r = 13'h0697;
          default: begin end
        endcase
      end
      12'hc52: begin
        out_r = 13'h09c9;
        case (key_hi)
          1'h1: out_r = 13'h0b94;
          default: begin end
        endcase
      end
      12'hc53: begin
        out_r = 13'h0bba;
        case (key_hi)
          1'h1: out_r = 13'h0947;
          default: begin end
        endcase
      end
      12'hc54: begin
        out_r = 13'h09e1;
        case (key_hi)
          1'h1: out_r = 13'h0991;
          default: begin end
        endcase
      end
      12'hc55: begin
        out_r = 13'h09ee;
        case (key_hi)
          1'h1: out_r = 13'h099e;
          default: begin end
        endcase
      end
      12'hc56: begin
        out_r = 13'h0aa7;
        case (key_hi)
          1'h1: out_r = 13'h0ab7;
          default: begin end
        endcase
      end
      12'hc57: begin
        out_r = 13'h091e;
        case (key_hi)
          1'h1: out_r = 13'h099e;
          default: begin end
        endcase
      end
      12'hc58: begin
        out_r = 13'h09f5;
        case (key_hi)
          1'h1: out_r = 13'h0b8e;
          default: begin end
        endcase
      end
      12'hc59: begin
        out_r = 13'h09d9;
        case (key_hi)
          1'h1: out_r = 13'h0abb;
          default: begin end
        endcase
      end
      12'hc5a: begin
        out_r = 13'h09fe;
        case (key_hi)
          1'h1: out_r = 13'h09ae;
          default: begin end
        endcase
      end
      12'hc5b: begin
        out_r = 13'h0b99;
        case (key_hi)
          1'h1: out_r = 13'h099e;
          default: begin end
        endcase
      end
      12'hc5c: begin
        out_r = 13'h0aae;
        case (key_hi)
          1'h1: out_r = 13'h099e;
          default: begin end
        endcase
      end
      12'hc5d: begin
        out_r = 13'h09e9;
        case (key_hi)
          1'h1: out_r = 13'h0999;
          default: begin end
        endcase
      end
      12'hc5e: begin
        out_r = 13'h0aae;
        case (key_hi)
          1'h1: out_r = 13'h099e;
          default: begin end
        endcase
      end
      12'hc5f: begin
        out_r = 13'h0bbb;
        case (key_hi)
          1'h1: out_r = 13'h0990;
          default: begin end
        endcase
      end
      12'hc60: begin
        out_r = 13'h094e;
        case (key_hi)
          1'h1: out_r = 13'h090e;
          default: begin end
        endcase
      end
      12'hc61: begin
        out_r = 13'h0bd8;
        case (key_hi)
          1'h1: out_r = 13'h0b3a;
          default: begin end
        endcase
      end
      12'hc62: begin
        out_r = 13'h0941;
        case (key_hi)
          1'h1: out_r = 13'h097e;
          default: begin end
        endcase
      end
      12'hc63: begin
        out_r = 13'h0907;
        case (key_hi)
          1'h1: out_r = 13'h0951;
          default: begin end
        endcase
      end
      12'hc64: begin
        out_r = 13'h0971;
        case (key_hi)
          1'h1: out_r = 13'h05a6;
          default: begin end
        endcase
      end
      12'hc65: begin
        out_r = 13'h0bfb;
        case (key_hi)
          1'h1: out_r = 13'h0b66;
          default: begin end
        endcase
      end
      12'hc66: begin
        out_r = 13'h0961;
        case (key_hi)
          1'h1: out_r = 13'h0968;
          default: begin end
        endcase
      end
      12'hc67: begin
        out_r = 13'h0b51;
        case (key_hi)
          1'h1: out_r = 13'h0b66;
          default: begin end
        endcase
      end
      12'hc68: begin
        out_r = 13'h0ad7;
        case (key_hi)
          1'h1: out_r = 13'h0b01;
          default: begin end
        endcase
      end
      12'hc69: begin
        out_r = 13'h0b46;
        case (key_hi)
          1'h1: out_r = 13'h0b3b;
          default: begin end
        endcase
      end
      12'hc6a: begin
        out_r = 13'h0596;
        case (key_hi)
          1'h1: out_r = 13'h0b75;
          default: begin end
        endcase
      end
      12'hc6b: begin
        out_r = 13'h06d7;
        case (key_hi)
          1'h1: out_r = 13'h0b7a;
          default: begin end
        endcase
      end
      12'hc6c: begin
        out_r = 13'h094e;
        case (key_hi)
          1'h1: out_r = 13'h09f5;
          default: begin end
        endcase
      end
      12'hc6d: begin
        out_r = 13'h067a;
        case (key_hi)
          1'h1: out_r = 13'h0941;
          default: begin end
        endcase
      end
      12'hc6e: begin
        out_r = 13'h09f5;
      end
      12'hc6f: begin
        out_r = 13'h0b1e;
        case (key_hi)
          1'h1: out_r = 13'h0944;
          default: begin end
        endcase
      end
      12'hc70: begin
        out_r = 13'h09d9;
        case (key_hi)
          1'h1: out_r = 13'h0b91;
          default: begin end
        endcase
      end
      12'hc71: begin
        out_r = 13'h0a55;
        case (key_hi)
          1'h1: out_r = 13'h095a;
          default: begin end
        endcase
      end
      12'hc72: begin
        out_r = 13'h09de;
        case (key_hi)
          1'h1: out_r = 13'h0981;
          default: begin end
        endcase
      end
      12'hc73: begin
        out_r = 13'h0a87;
        case (key_hi)
          1'h1: out_r = 13'h0ac7;
          default: begin end
        endcase
      end
      12'hc74: begin
        out_r = 13'h0aa7;
        case (key_hi)
          1'h1: out_r = 13'h0b8e;
          default: begin end
        endcase
      end
      12'hc75: begin
        out_r = 13'h09e9;
        case (key_hi)
          1'h1: out_r = 13'h0bb8;
          default: begin end
        endcase
      end
      12'hc76: begin
        out_r = 13'h0a97;
        case (key_hi)
          1'h1: out_r = 13'h0596;
          default: begin end
        endcase
      end
      12'hc77: begin
        out_r = 13'h0bb8;
        case (key_hi)
          1'h1: out_r = 13'h099e;
          default: begin end
        endcase
      end
      12'hc78: begin
        out_r = 13'h09d9;
        case (key_hi)
          1'h1: out_r = 13'h0b91;
          default: begin end
        endcase
      end
      12'hc79: begin
        out_r = 13'h05d6;
        case (key_hi)
          1'h1: out_r = 13'h0ac7;
          default: begin end
        endcase
      end
      12'hc7a: begin
        out_r = 13'h09de;
        case (key_hi)
          1'h1: out_r = 13'h09b1;
          default: begin end
        endcase
      end
      12'hc7b: begin
        out_r = 13'h0a87;
        case (key_hi)
          1'h1: out_r = 13'h0ac7;
          default: begin end
        endcase
      end
      12'hc7c: begin
        out_r = 13'h095e;
        case (key_hi)
          1'h1: out_r = 13'h0bbe;
          default: begin end
        endcase
      end
      12'hc7d: begin
        out_r = 13'h09e9;
        case (key_hi)
          1'h1: out_r = 13'h0999;
          default: begin end
        endcase
      end
      12'hc7e: begin
        out_r = 13'h095e;
        case (key_hi)
          1'h1: out_r = 13'h0bbe;
          default: begin end
        endcase
      end
      12'hc7f: begin
        out_r = 13'h0bbb;
        case (key_hi)
          1'h1: out_r = 13'h0990;
          default: begin end
        endcase
      end
      12'hc80: begin
        out_r = 13'h0bf5;
        case (key_hi)
          1'h1: out_r = 13'h0a94;
          default: begin end
        endcase
      end
      12'hc81: begin
        out_r = 13'h0a3a;
      end
      12'hc82: begin
        out_r = 13'h0bfe;
        case (key_hi)
          1'h1: out_r = 13'h0b6b;
          default: begin end
        endcase
      end
      12'hc83: begin
        out_r = 13'h09fb;
        case (key_hi)
          1'h1: out_r = 13'h0a0e;
          default: begin end
        endcase
      end
      12'hc84: begin
        out_r = 13'h0be1;
        case (key_hi)
          1'h1: out_r = 13'h0a61;
          default: begin end
        endcase
      end
      12'hc85: begin
        out_r = 13'h0bee;
        case (key_hi)
          1'h1: out_r = 13'h0a19;
          default: begin end
        endcase
      end
      12'hc86: begin
        out_r = 13'h0716;
        case (key_hi)
          1'h1: out_r = 13'h0b54;
          default: begin end
        endcase
      end
      12'hc87: begin
        out_r = 13'h0a9e;
        case (key_hi)
          1'h1: out_r = 13'h0a19;
          default: begin end
        endcase
      end
      12'hc88: begin
        out_r = 13'h0bce;
        case (key_hi)
          1'h1: out_r = 13'h0aa4;
          default: begin end
        endcase
      end
      12'hc89: begin
        out_r = 13'h0a3a;
        case (key_hi)
          1'h1: out_r = 13'h053a;
          default: begin end
        endcase
      end
      12'hc8a: begin
        out_r = 13'h0bc1;
        case (key_hi)
          1'h1: out_r = 13'h0aa0;
          default: begin end
        endcase
      end
      12'hc8b: begin
        out_r = 13'h0647;
        case (key_hi)
          1'h1: out_r = 13'h0a2e;
          default: begin end
        endcase
      end
      12'hc8c: begin
        out_r = 13'h0997;
        case (key_hi)
          1'h1: out_r = 13'h0b67;
          default: begin end
        endcase
      end
      12'hc8d: begin
        out_r = 13'h0aba;
        case (key_hi)
          1'h1: out_r = 13'h0a3a;
          default: begin end
        endcase
      end
      12'hc8e: begin
        out_r = 13'h0b57;
        case (key_hi)
          1'h1: out_r = 13'h0b67;
          default: begin end
        endcase
      end
      12'hc8f: begin
        out_r = 13'h0b1e;
        case (key_hi)
          1'h1: out_r = 13'h0a38;
          default: begin end
        endcase
      end
      12'hc90: begin
        out_r = 13'h0b81;
        case (key_hi)
          1'h1: out_r = 13'h0aae;
          default: begin end
        endcase
      end
      12'hc91: begin
        out_r = 13'h0686;
        case (key_hi)
          1'h1: out_r = 13'h0786;
          default: begin end
        endcase
      end
      12'hc92: begin
        out_r = 13'h0b89;
        case (key_hi)
          1'h1: out_r = 13'h0ad8;
          default: begin end
        endcase
      end
      12'hc93: begin
        out_r = 13'h0a4e;
      end
      12'hc94: begin
        out_r = 13'h0bbe;
        case (key_hi)
          1'h1: out_r = 13'h0ae1;
          default: begin end
        endcase
      end
      12'hc95: begin
        out_r = 13'h0bba;
      end
      12'hc96: begin
        out_r = 13'h0bb5;
        case (key_hi)
          1'h1: out_r = 13'h0ba1;
          default: begin end
        endcase
      end
      12'hc97: begin
        out_r = 13'h0a1e;
        case (key_hi)
          1'h1: out_r = 13'h0a64;
          default: begin end
        endcase
      end
      12'hc98: begin
        out_r = 13'h0a95;
        case (key_hi)
          1'h1: out_r = 13'h0af5;
          default: begin end
        endcase
      end
      12'hc99: begin
        out_r = 13'h0ad6;
        case (key_hi)
          1'h1: out_r = 13'h0a51;
          default: begin end
        endcase
      end
      12'hc9a: begin
        out_r = 13'h0a66;
      end
      12'hc9b: begin
        out_r = 13'h0a5e;
        case (key_hi)
          1'h1: out_r = 13'h0a51;
          default: begin end
        endcase
      end
      12'hc9c: begin
        out_r = 13'h0bb1;
        case (key_hi)
          1'h1: out_r = 13'h0a69;
          default: begin end
        endcase
      end
      12'hc9d: begin
        out_r = 13'h0bba;
        case (key_hi)
          1'h1: out_r = 13'h0a57;
          default: begin end
        endcase
      end
      12'hc9e: begin
        out_r = 13'h0bb1;
        case (key_hi)
          1'h1: out_r = 13'h0a69;
          default: begin end
        endcase
      end
      12'hc9f: begin
        out_r = 13'h0a1e;
        case (key_hi)
          1'h1: out_r = 13'h0a64;
          default: begin end
        endcase
      end
      12'hca0: begin
        out_r = 13'h0b0e;
        case (key_hi)
          1'h1: out_r = 13'h0aa4;
          default: begin end
        endcase
      end
      12'hca1: begin
        out_r = 13'h0b7b;
        case (key_hi)
          1'h1: out_r = 13'h09c7;
          default: begin end
        endcase
      end
      12'hca2: begin
        out_r = 13'h0b01;
        case (key_hi)
          1'h1: out_r = 13'h07f7;
          default: begin end
        endcase
      end
      12'hca3: begin
        out_r = 13'h0aba;
        case (key_hi)
          1'h1: out_r = 13'h0a8e;
          default: begin end
        endcase
      end
      12'hca4: begin
        out_r = 13'h0b11;
        case (key_hi)
          1'h1: out_r = 13'h0ab1;
          default: begin end
        endcase
      end
      12'hca5: begin
        out_r = 13'h0b19;
        case (key_hi)
          1'h1: out_r = 13'h0a99;
          default: begin end
        endcase
      end
      12'hca6: begin
        out_r = 13'h0b4e;
        case (key_hi)
          1'h1: out_r = 13'h0be4;
          default: begin end
        endcase
      end
      12'hca7: begin
        out_r = 13'h0aba;
        case (key_hi)
          1'h1: out_r = 13'h0a99;
          default: begin end
        endcase
      end
      12'hca8: begin
        out_r = 13'h0b2e;
        case (key_hi)
          1'h1: out_r = 13'h054b;
          default: begin end
        endcase
      end
      12'hca9: begin
        out_r = 13'h053a;
        case (key_hi)
          1'h1: out_r = 13'h0b7b;
          default: begin end
        endcase
      end
      12'hcaa: begin
        out_r = 13'h0b21;
        case (key_hi)
          1'h1: out_r = 13'h0a8e;
          default: begin end
        endcase
      end
      12'hcab: begin
        out_r = 13'h0a81;
        case (key_hi)
          1'h1: out_r = 13'h0aae;
          default: begin end
        endcase
      end
      12'hcac: begin
        out_r = 13'h0b11;
        case (key_hi)
          1'h1: out_r = 13'h0997;
          default: begin end
        endcase
      end
      12'hcad: begin
        out_r = 13'h0b19;
        case (key_hi)
          1'h1: out_r = 13'h0aba;
          default: begin end
        endcase
      end
      12'hcae: begin
        out_r = 13'h0a10;
        case (key_hi)
          1'h1: out_r = 13'h0997;
          default: begin end
        endcase
      end
      12'hcaf: begin
        out_r = 13'h0a91;
        case (key_hi)
          1'h1: out_r = 13'h0ab8;
          default: begin end
        endcase
      end
      12'hcb0: begin
        out_r = 13'h0b89;
        case (key_hi)
          1'h1: out_r = 13'h052b;
          default: begin end
        endcase
      end
      12'hcb1: begin
        out_r = 13'h0797;
        case (key_hi)
          1'h1: out_r = 13'h0ac5;
          default: begin end
        endcase
      end
      12'hcb2: begin
        out_r = 13'h0b81;
        case (key_hi)
          1'h1: out_r = 13'h0a20;
          default: begin end
        endcase
      end
      12'hcb3: begin
        out_r = 13'h0a04;
        case (key_hi)
          1'h1: out_r = 13'h0b99;
          default: begin end
        endcase
      end
      12'hcb4: begin
        out_r = 13'h0ba9;
        case (key_hi)
          1'h1: out_r = 13'h07b0;
          default: begin end
        endcase
      end
      12'hcb5: begin
        out_r = 13'h07ba;
        case (key_hi)
          1'h1: out_r = 13'h0967;
          default: begin end
        endcase
      end
      12'hcb6: begin
        out_r = 13'h0ba1;
        case (key_hi)
          1'h1: out_r = 13'h0ba0;
          default: begin end
        endcase
      end
      12'hcb7: begin
        out_r = 13'h0a7b;
        case (key_hi)
          1'h1: out_r = 13'h0ae8;
          default: begin end
        endcase
      end
      12'hcb8: begin
        out_r = 13'h0b89;
        case (key_hi)
          1'h1: out_r = 13'h052b;
          default: begin end
        endcase
      end
      12'hcb9: begin
        out_r = 13'h0b81;
        case (key_hi)
          1'h1: out_r = 13'h073b;
          default: begin end
        endcase
      end
      12'hcba: begin
        out_r = 13'h0a4e;
        case (key_hi)
          1'h1: out_r = 13'h0656;
          default: begin end
        endcase
      end
      12'hcbb: begin
        out_r = 13'h0a04;
        case (key_hi)
          1'h1: out_r = 13'h0b99;
          default: begin end
        endcase
      end
      12'hcbc: begin
        out_r = 13'h0a75;
        case (key_hi)
          1'h1: out_r = 13'h0974;
          default: begin end
        endcase
      end
      12'hcbd: begin
        out_r = 13'h0bae;
        case (key_hi)
          1'h1: out_r = 13'h0aee;
          default: begin end
        endcase
      end
      12'hcbe: begin
        out_r = 13'h0a75;
        case (key_hi)
          1'h1: out_r = 13'h0974;
          default: begin end
        endcase
      end
      12'hcbf: begin
        out_r = 13'h0513;
        case (key_hi)
          1'h1: out_r = 13'h0ae0;
          default: begin end
        endcase
      end
      12'hcc0: begin
        out_r = 13'h0ad7;
        case (key_hi)
          1'h1: out_r = 13'h06f7;
          default: begin end
        endcase
      end
      12'hcc1: begin
        out_r = 13'h0bf1;
        case (key_hi)
          1'h1: out_r = 13'h0afa;
          default: begin end
        endcase
      end
      12'hcc2: begin
        out_r = 13'h0951;
        case (key_hi)
          1'h1: out_r = 13'h092e;
          default: begin end
        endcase
      end
      12'hcc3: begin
        out_r = 13'h0506;
        case (key_hi)
          1'h1: out_r = 13'h0b46;
          default: begin end
        endcase
      end
      12'hcc4: begin
        out_r = 13'h0969;
        case (key_hi)
          1'h1: out_r = 13'h06e3;
          default: begin end
        endcase
      end
      12'hcc5: begin
        out_r = 13'h0707;
        case (key_hi)
          1'h1: out_r = 13'h0b59;
          default: begin end
        endcase
      end
      12'hcc6: begin
        out_r = 13'h096f;
        case (key_hi)
          1'h1: out_r = 13'h0914;
          default: begin end
        endcase
      end
      12'hcc7: begin
        out_r = 13'h0919;
        case (key_hi)
          1'h1: out_r = 13'h0b59;
          default: begin end
        endcase
      end
      12'hcc8: begin
        out_r = 13'h0ad7;
        case (key_hi)
          1'h1: out_r = 13'h09f1;
          default: begin end
        endcase
      end
      12'hcc9: begin
        out_r = 13'h06d7;
        case (key_hi)
          1'h1: out_r = 13'h0a27;
          default: begin end
        endcase
      end
      12'hcca: begin
        out_r = 13'h0951;
        case (key_hi)
          1'h1: out_r = 13'h0b21;
          default: begin end
        endcase
      end
      12'hccb: begin
        out_r = 13'h0ad7;
        case (key_hi)
          1'h1: out_r = 13'h0aa7;
          default: begin end
        endcase
      end
      12'hccc: begin
        out_r = 13'h094e;
        case (key_hi)
          1'h1: out_r = 13'h0516;
          default: begin end
        endcase
      end
      12'hccd: begin
        out_r = 13'h0b66;
        case (key_hi)
          1'h1: out_r = 13'h0b51;
          default: begin end
        endcase
      end
      12'hcce: begin
        out_r = 13'h09e1;
        case (key_hi)
          1'h1: out_r = 13'h0516;
          default: begin end
        endcase
      end
      12'hccf: begin
        out_r = 13'h091e;
        case (key_hi)
          1'h1: out_r = 13'h0b5e;
          default: begin end
        endcase
      end
      12'hcd0: begin
        out_r = 13'h0921;
        case (key_hi)
          1'h1: out_r = 13'h0a91;
          default: begin end
        endcase
      end
      12'hcd1: begin
        out_r = 13'h0526;
        case (key_hi)
          1'h1: out_r = 13'h0ad7;
          default: begin end
        endcase
      end
      12'hcd2: begin
        out_r = 13'h0929;
        case (key_hi)
          1'h1: out_r = 13'h0b91;
          default: begin end
        endcase
      end
      12'hcd3: begin
        out_r = 13'h0b9e;
        case (key_hi)
          1'h1: out_r = 13'h0b99;
          default: begin end
        endcase
      end
      12'hcd4: begin
        out_r = 13'h0911;
        case (key_hi)
          1'h1: out_r = 13'h0991;
          default: begin end
        endcase
      end
      12'hcd5: begin
        out_r = 13'h091e;
        case (key_hi)
          1'h1: out_r = 13'h05aa;
          default: begin end
        endcase
      end
      12'hcd6: begin
        out_r = 13'h0a17;
        case (key_hi)
          1'h1: out_r = 13'h0991;
          default: begin end
        endcase
      end
      12'hcd7: begin
        out_r = 13'h0bae;
        case (key_hi)
          1'h1: out_r = 13'h05aa;
          default: begin end
        endcase
      end
      12'hcd8: begin
        out_r = 13'h0909;
        case (key_hi)
          1'h1: out_r = 13'h064b;
          default: begin end
        endcase
      end
      12'hcd9: begin
        out_r = 13'h0a07;
        case (key_hi)
          1'h1: out_r = 13'h0a87;
          default: begin end
        endcase
      end
      12'hcda: begin
        out_r = 13'h090e;
        case (key_hi)
          1'h1: out_r = 13'h09a1;
          default: begin end
        endcase
      end
      12'hcdb: begin
        out_r = 13'h0b80;
        case (key_hi)
          1'h1: out_r = 13'h0b81;
          default: begin end
        endcase
      end
      12'hcdc: begin
        out_r = 13'h0516;
        case (key_hi)
          1'h1: out_r = 13'h09e7;
          default: begin end
        endcase
      end
      12'hcdd: begin
        out_r = 13'h0919;
        case (key_hi)
          1'h1: out_r = 13'h0bae;
          default: begin end
        endcase
      end
      12'hcde: begin
        out_r = 13'h0516;
        case (key_hi)
          1'h1: out_r = 13'h09e7;
          default: begin end
        endcase
      end
      12'hcdf: begin
        out_r = 13'h067b;
        case (key_hi)
          1'h1: out_r = 13'h0ba0;
          default: begin end
        endcase
      end
      12'hce0: begin
        out_r = 13'h0ad7;
        case (key_hi)
          1'h1: out_r = 13'h06f7;
          default: begin end
        endcase
      end
      12'hce1: begin
        out_r = 13'h0bf1;
        case (key_hi)
          1'h1: out_r = 13'h0afa;
          default: begin end
        endcase
      end
      12'hce2: begin
        out_r = 13'h0951;
        case (key_hi)
          1'h1: out_r = 13'h092e;
          default: begin end
        endcase
      end
      12'hce3: begin
        out_r = 13'h0506;
        case (key_hi)
          1'h1: out_r = 13'h0b46;
          default: begin end
        endcase
      end
      12'hce4: begin
        out_r = 13'h0961;
        case (key_hi)
          1'h1: out_r = 13'h0ae7;
          default: begin end
        endcase
      end
      12'hce5: begin
        out_r = 13'h0945;
        case (key_hi)
          1'h1: out_r = 13'h0919;
          default: begin end
        endcase
      end
      12'hce6: begin
        out_r = 13'h0969;
        case (key_hi)
          1'h1: out_r = 13'h0901;
          default: begin end
        endcase
      end
      12'hce7: begin
        out_r = 13'h0b5e;
        case (key_hi)
          1'h1: out_r = 13'h0b59;
          default: begin end
        endcase
      end
      12'hce8: begin
        out_r = 13'h0949;
        case (key_hi)
          1'h1: out_r = 13'h0bd9;
          default: begin end
        endcase
      end
      12'hce9: begin
        out_r = 13'h0b24;
        case (key_hi)
          1'h1: out_r = 13'h0b38;
          default: begin end
        endcase
      end
      12'hcea: begin
        out_r = 13'h094e;
        case (key_hi)
          1'h1: out_r = 13'h0b3e;
          default: begin end
        endcase
      end
      12'hceb: begin
        out_r = 13'h0726;
        case (key_hi)
          1'h1: out_r = 13'h0a06;
          default: begin end
        endcase
      end
      12'hcec: begin
        out_r = 13'h094e;
        case (key_hi)
          1'h1: out_r = 13'h0516;
          default: begin end
        endcase
      end
      12'hced: begin
        out_r = 13'h0b66;
        case (key_hi)
          1'h1: out_r = 13'h0b51;
          default: begin end
        endcase
      end
      12'hcee: begin
        out_r = 13'h09e1;
        case (key_hi)
          1'h1: out_r = 13'h0516;
          default: begin end
        endcase
      end
      12'hcef: begin
        out_r = 13'h091e;
        case (key_hi)
          1'h1: out_r = 13'h0b5e;
          default: begin end
        endcase
      end
      12'hcf0: begin
        out_r = 13'h09f5;
        case (key_hi)
          1'h1: out_r = 13'h0653;
          default: begin end
        endcase
      end
      12'hcf1: begin
        out_r = 13'h055a;
        case (key_hi)
          1'h1: out_r = 13'h0b99;
          default: begin end
        endcase
      end
      12'hcf2: begin
        out_r = 13'h098c;
        case (key_hi)
          1'h1: out_r = 13'h0b94;
          default: begin end
        endcase
      end
      12'hcf3: begin
        out_r = 13'h0bba;
        case (key_hi)
          1'h1: out_r = 13'h0b9e;
          default: begin end
        endcase
      end
      12'hcf4: begin
        out_r = 13'h09e7;
        case (key_hi)
          1'h1: out_r = 13'h0ba1;
          default: begin end
        endcase
      end
      12'hcf5: begin
        out_r = 13'h0546;
        case (key_hi)
          1'h1: out_r = 13'h0bba;
          default: begin end
        endcase
      end
      12'hcf6: begin
        out_r = 13'h09e1;
        case (key_hi)
          1'h1: out_r = 13'h0996;
          default: begin end
        endcase
      end
      12'hcf7: begin
        out_r = 13'h07a7;
        case (key_hi)
          1'h1: out_r = 13'h0bb8;
          default: begin end
        endcase
      end
      12'hcf8: begin
        out_r = 13'h09f5;
        case (key_hi)
          1'h1: out_r = 13'h0653;
          default: begin end
        endcase
      end
      12'hcf9: begin
        out_r = 13'h0b9c;
        case (key_hi)
          1'h1: out_r = 13'h0b9e;
          default: begin end
        endcase
      end
      12'hcfa: begin
        out_r = 13'h098c;
        case (key_hi)
          1'h1: out_r = 13'h09a1;
          default: begin end
        endcase
      end
      12'hcfb: begin
        out_r = 13'h0bba;
        case (key_hi)
          1'h1: out_r = 13'h0b9e;
          default: begin end
        endcase
      end
      12'hcfc: begin
        out_r = 13'h0ae7;
        case (key_hi)
          1'h1: out_r = 13'h064b;
          default: begin end
        endcase
      end
      12'hcfd: begin
        out_r = 13'h09ee;
        case (key_hi)
          1'h1: out_r = 13'h0b8e;
          default: begin end
        endcase
      end
      12'hcfe: begin
        out_r = 13'h0ae7;
        case (key_hi)
          1'h1: out_r = 13'h064b;
          default: begin end
        endcase
      end
      12'hcff: begin
        out_r = 13'h0783;
        case (key_hi)
          1'h1: out_r = 13'h0b80;
          default: begin end
        endcase
      end
      12'hd00: begin
        out_r = 13'h0c31;
        case (key_hi)
          1'h1: out_r = 13'h0c33;
          default: begin end
        endcase
      end
      12'hd01: begin
        out_r = 13'h0c3a;
      end
      12'hd02: begin
        out_r = 13'h0c3e;
        case (key_hi)
          1'h1: out_r = 13'h0c3f;
          default: begin end
        endcase
      end
      12'hd03: begin
        out_r = 13'h0c39;
      end
      12'hd04: begin
        out_r = 13'h0c11;
        case (key_hi)
          1'h1: out_r = 13'h0c13;
          default: begin end
        endcase
      end
      12'hd05: begin
        out_r = 13'h0c19;
      end
      12'hd06: begin
        out_r = 13'h0c16;
        case (key_hi)
          1'h1: out_r = 13'h0c14;
          default: begin end
        endcase
      end
      12'hd07: begin
        out_r = 13'h0c19;
      end
      12'hd08: begin
        out_r = 13'h0c01;
      end
      12'hd09: begin
        out_r = 13'h0c06;
      end
      12'hd0a: begin
        out_r = 13'h0c0e;
      end
      12'hd0b: begin
        out_r = 13'h0c06;
      end
      12'hd0c: begin
        out_r = 13'h0c19;
      end
      12'hd0d: begin
        out_r = 13'h0c16;
      end
      12'hd0e: begin
        out_r = 13'h0c19;
      end
      12'hd0f: begin
        out_r = 13'h0c17;
        case (key_hi)
          1'h1: out_r = 13'h0c14;
          default: begin end
        endcase
      end
      12'hd10: begin
        out_r = 13'h0c41;
        case (key_hi)
          1'h1: out_r = 13'h0c43;
          default: begin end
        endcase
      end
      12'hd11: begin
        out_r = 13'h0c46;
      end
      12'hd12: begin
        out_r = 13'h0c49;
        case (key_hi)
          1'h1: out_r = 13'h0c4b;
          default: begin end
        endcase
      end
      12'hd13: begin
        out_r = 13'h0c4e;
      end
      12'hd14: begin
        out_r = 13'h0c69;
      end
      12'hd15: begin
        out_r = 13'h0c67;
      end
      12'hd16: begin
        out_r = 13'h0c61;
      end
      12'hd17: begin
        out_r = 13'h0c66;
        case (key_hi)
          1'h1: out_r = 13'h0c64;
          default: begin end
        endcase
      end
      12'hd18: begin
        out_r = 13'h0c56;
        case (key_hi)
          1'h1: out_r = 13'h0c54;
          default: begin end
        endcase
      end
      12'hd19: begin
        out_r = 13'h0c59;
      end
      12'hd1a: begin
        out_r = 13'h0c57;
      end
      12'hd1b: begin
        out_r = 13'h0c50;
        case (key_hi)
          1'h1: out_r = 13'h0c51;
          default: begin end
        endcase
      end
      12'hd1c: begin
        out_r = 13'h0c6e;
      end
      12'hd1d: begin
        out_r = 13'h0c66;
      end
      12'hd1e: begin
        out_r = 13'h0c6e;
      end
      12'hd1f: begin
        out_r = 13'h0c66;
        case (key_hi)
          1'h1: out_r = 13'h0c64;
          default: begin end
        endcase
      end
      12'hd20: begin
        out_r = 13'h0cb1;
      end
      12'hd21: begin
        out_r = 13'h0cbb;
      end
      12'hd22: begin
        out_r = 13'h0cbe;
        case (key_hi)
          1'h1: out_r = 13'h0cbc;
          default: begin end
        endcase
      end
      12'hd23: begin
        out_r = 13'h0cba;
      end
      12'hd24: begin
        out_r = 13'h0c91;
        case (key_hi)
          1'h1: out_r = 13'h0c93;
          default: begin end
        endcase
      end
      12'hd25: begin
        out_r = 13'h0c99;
      end
      12'hd26: begin
        out_r = 13'h0c96;
        case (key_hi)
          1'h1: out_r = 13'h0c94;
          default: begin end
        endcase
      end
      12'hd27: begin
        out_r = 13'h0c99;
      end
      12'hd28: begin
        out_r = 13'h0c81;
      end
      12'hd29: begin
        out_r = 13'h0c86;
      end
      12'hd2a: begin
        out_r = 13'h0c8e;
      end
      12'hd2b: begin
        out_r = 13'h0c87;
      end
      12'hd2c: begin
        out_r = 13'h0c96;
      end
      12'hd2d: begin
        out_r = 13'h0c98;
      end
      12'hd2e: begin
        out_r = 13'h0c96;
      end
      12'hd2f: begin
        out_r = 13'h0c99;
      end
      12'hd30: begin
        out_r = 13'h0c49;
        case (key_hi)
          1'h1: out_r = 13'h0c4b;
          default: begin end
        endcase
      end
      12'hd31: begin
        out_r = 13'h0c47;
      end
      12'hd32: begin
        out_r = 13'h0c41;
        case (key_hi)
          1'h1: out_r = 13'h0c40;
          default: begin end
        endcase
      end
      12'hd33: begin
        out_r = 13'h0c44;
        case (key_hi)
          1'h1: out_r = 13'h0c46;
          default: begin end
        endcase
      end
      12'hd34: begin
        out_r = 13'h0c6e;
      end
      12'hd35: begin
        out_r = 13'h0c67;
      end
      12'hd36: begin
        out_r = 13'h0c61;
      end
      12'hd37: begin
        out_r = 13'h0c66;
        case (key_hi)
          1'h1: out_r = 13'h0c64;
          default: begin end
        endcase
      end
      12'hd38: begin
        out_r = 13'h0c49;
        case (key_hi)
          1'h1: out_r = 13'h0c4b;
          default: begin end
        endcase
      end
      12'hd39: begin
        out_r = 13'h0c41;
      end
      12'hd3a: begin
        out_r = 13'h0c4e;
      end
      12'hd3b: begin
        out_r = 13'h0c44;
        case (key_hi)
          1'h1: out_r = 13'h0c46;
          default: begin end
        endcase
      end
      12'hd3c: begin
        out_r = 13'h0c69;
      end
      12'hd3d: begin
        out_r = 13'h0c67;
      end
      12'hd3e: begin
        out_r = 13'h0c69;
      end
      12'hd3f: begin
        out_r = 13'h0c66;
        case (key_hi)
          1'h1: out_r = 13'h0c64;
          default: begin end
        endcase
      end
      12'hd40: begin
        out_r = 13'h0e01;
        case (key_hi)
          1'h1: out_r = 13'h0e03;
          default: begin end
        endcase
      end
      12'hd41: begin
        out_r = 13'h0e06;
      end
      12'hd42: begin
        out_r = 13'h0e09;
        case (key_hi)
          1'h1: out_r = 13'h0e0b;
          default: begin end
        endcase
      end
      12'hd43: begin
        out_r = 13'h0e0e;
      end
      12'hd44: begin
        out_r = 13'h0e11;
        case (key_hi)
          1'h1: out_r = 13'h0e13;
          default: begin end
        endcase
      end
      12'hd45: begin
        out_r = 13'h0e19;
      end
      12'hd46: begin
        out_r = 13'h0e16;
        case (key_hi)
          1'h1: out_r = 13'h0e14;
          default: begin end
        endcase
      end
      12'hd47: begin
        out_r = 13'h0e19;
      end
      12'hd48: begin
        out_r = 13'h0e21;
        case (key_hi)
          1'h1: out_r = 13'h0e23;
          default: begin end
        endcase
      end
      12'hd49: begin
        out_r = 13'h0e26;
      end
      12'hd4a: begin
        out_r = 13'h0e29;
        case (key_hi)
          1'h1: out_r = 13'h0e2b;
          default: begin end
        endcase
      end
      12'hd4b: begin
        out_r = 13'h0e2e;
      end
      12'hd4c: begin
        out_r = 13'h0e35;
      end
      12'hd4d: begin
        out_r = 13'h0e3a;
      end
      12'hd4e: begin
        out_r = 13'h0e35;
      end
      12'hd4f: begin
        out_r = 13'h0e3b;
        case (key_hi)
          1'h1: out_r = 13'h0e38;
          default: begin end
        endcase
      end
      12'hd50: begin
        out_r = 13'h0e81;
        case (key_hi)
          1'h1: out_r = 13'h0e83;
          default: begin end
        endcase
      end
      12'hd51: begin
        out_r = 13'h0e86;
      end
      12'hd52: begin
        out_r = 13'h0e89;
        case (key_hi)
          1'h1: out_r = 13'h0e8b;
          default: begin end
        endcase
      end
      12'hd53: begin
        out_r = 13'h0e8e;
      end
      12'hd54: begin
        out_r = 13'h0e91;
        case (key_hi)
          1'h1: out_r = 13'h0e93;
          default: begin end
        endcase
      end
      12'hd55: begin
        out_r = 13'h0e99;
      end
      12'hd56: begin
        out_r = 13'h0e97;
      end
      12'hd57: begin
        out_r = 13'h0e99;
      end
      12'hd58: begin
        out_r = 13'h0eb1;
      end
      12'hd59: begin
        out_r = 13'h0eba;
      end
      12'hd5a: begin
        out_r = 13'h0eb5;
      end
      12'hd5b: begin
        out_r = 13'h0eb8;
        case (key_hi)
          1'h1: out_r = 13'h0eba;
          default: begin end
        endcase
      end
      12'hd5c: begin
        out_r = 13'h0e96;
        case (key_hi)
          1'h1: out_r = 13'h0e94;
          default: begin end
        endcase
      end
      12'hd5d: begin
        out_r = 13'h0e99;
      end
      12'hd5e: begin
        out_r = 13'h0e96;
        case (key_hi)
          1'h1: out_r = 13'h0e94;
          default: begin end
        endcase
      end
      12'hd5f: begin
        out_r = 13'h0e93;
        case (key_hi)
          1'h1: out_r = 13'h0e90;
          default: begin end
        endcase
      end
      12'hd60: begin
        out_r = 13'h0ec1;
      end
      12'hd61: begin
        out_r = 13'h0ec6;
      end
      12'hd62: begin
        out_r = 13'h0ec9;
      end
      12'hd63: begin
        out_r = 13'h0ec6;
      end
      12'hd64: begin
        out_r = 13'h0ee1;
        case (key_hi)
          1'h1: out_r = 13'h0ee3;
          default: begin end
        endcase
      end
      12'hd65: begin
        out_r = 13'h0ee9;
      end
      12'hd66: begin
        out_r = 13'h0eee;
      end
      12'hd67: begin
        out_r = 13'h0eeb;
        case (key_hi)
          1'h1: out_r = 13'h0ee8;
          default: begin end
        endcase
      end
      12'hd68: begin
        out_r = 13'h0ed1;
      end
      12'hd69: begin
        out_r = 13'h0ed6;
      end
      12'hd6a: begin
        out_r = 13'h0ed9;
      end
      12'hd6b: begin
        out_r = 13'h0ed4;
        case (key_hi)
          1'h1: out_r = 13'h0ed7;
          default: begin end
        endcase
      end
      12'hd6c: begin
        out_r = 13'h0eee;
      end
      12'hd6d: begin
        out_r = 13'h0ee1;
      end
      12'hd6e: begin
        out_r = 13'h0eee;
      end
      12'hd6f: begin
        out_r = 13'h0eeb;
        case (key_hi)
          1'h1: out_r = 13'h0ee8;
          default: begin end
        endcase
      end
      12'hd70: begin
        out_r = 13'h0ea1;
        case (key_hi)
          1'h1: out_r = 13'h0ea3;
          default: begin end
        endcase
      end
      12'hd71: begin
        out_r = 13'h0ea6;
      end
      12'hd72: begin
        out_r = 13'h0ea9;
        case (key_hi)
          1'h1: out_r = 13'h0eab;
          default: begin end
        endcase
      end
      12'hd73: begin
        out_r = 13'h0eae;
      end
      12'hd74: begin
        out_r = 13'h0eb1;
      end
      12'hd75: begin
        out_r = 13'h0eba;
      end
      12'hd76: begin
        out_r = 13'h0ebe;
      end
      12'hd77: begin
        out_r = 13'h0ebb;
        case (key_hi)
          1'h1: out_r = 13'h0eb8;
          default: begin end
        endcase
      end
      12'hd78: begin
        out_r = 13'h0ea1;
        case (key_hi)
          1'h1: out_r = 13'h0ea3;
          default: begin end
        endcase
      end
      12'hd79: begin
        out_r = 13'h0ea6;
      end
      12'hd7a: begin
        out_r = 13'h0ea9;
      end
      12'hd7b: begin
        out_r = 13'h0eae;
      end
      12'hd7c: begin
        out_r = 13'h0e89;
        case (key_hi)
          1'h1: out_r = 13'h0e8b;
          default: begin end
        endcase
      end
      12'hd7d: begin
        out_r = 13'h0e8e;
      end
      12'hd7e: begin
        out_r = 13'h0e89;
        case (key_hi)
          1'h1: out_r = 13'h0e8b;
          default: begin end
        endcase
      end
      12'hd7f: begin
        out_r = 13'h0e83;
        case (key_hi)
          1'h1: out_r = 13'h0e80;
          default: begin end
        endcase
      end
      12'hd80: begin
        out_r = 13'h0f3e;
      end
      12'hd81: begin
        out_r = 13'h0f3a;
      end
      12'hd82: begin
        out_r = 13'h0f35;
        case (key_hi)
          1'h1: out_r = 13'h0f34;
          default: begin end
        endcase
      end
      12'hd83: begin
        out_r = 13'h0f3a;
      end
      12'hd84: begin
        out_r = 13'h0f11;
        case (key_hi)
          1'h1: out_r = 13'h0f13;
          default: begin end
        endcase
      end
      12'hd85: begin
        out_r = 13'h0f19;
      end
      12'hd86: begin
        out_r = 13'h0f16;
        case (key_hi)
          1'h1: out_r = 13'h0f14;
          default: begin end
        endcase
      end
      12'hd87: begin
        out_r = 13'h0f19;
      end
      12'hd88: begin
        out_r = 13'h0f01;
      end
      12'hd89: begin
        out_r = 13'h0f06;
      end
      12'hd8a: begin
        out_r = 13'h0f0e;
      end
      12'hd8b: begin
        out_r = 13'h0f06;
      end
      12'hd8c: begin
        out_r = 13'h0f16;
      end
      12'hd8d: begin
        out_r = 13'h0f1f;
      end
      12'hd8e: begin
        out_r = 13'h0f16;
      end
      12'hd8f: begin
        out_r = 13'h0f1e;
        case (key_hi)
          1'h1: out_r = 13'h0f1c;
          default: begin end
        endcase
      end
      12'hd90: begin
        out_r = 13'h0f81;
        case (key_hi)
          1'h1: out_r = 13'h0f83;
          default: begin end
        endcase
      end
      12'hd91: begin
        out_r = 13'h0f86;
      end
      12'hd92: begin
        out_r = 13'h0f89;
        case (key_hi)
          1'h1: out_r = 13'h0f8b;
          default: begin end
        endcase
      end
      12'hd93: begin
        out_r = 13'h0f8e;
      end
      12'hd94: begin
        out_r = 13'h0fa9;
      end
      12'hd95: begin
        out_r = 13'h0fa6;
      end
      12'hd96: begin
        out_r = 13'h0fa1;
      end
      12'hd97: begin
        out_r = 13'h0fa6;
        case (key_hi)
          1'h1: out_r = 13'h0fa4;
          default: begin end
        endcase
      end
      12'hd98: begin
        out_r = 13'h0f96;
      end
      12'hd99: begin
        out_r = 13'h0f9e;
      end
      12'hd9a: begin
        out_r = 13'h0f91;
      end
      12'hd9b: begin
        out_r = 13'h0f9e;
      end
      12'hd9c: begin
        out_r = 13'h0fae;
      end
      12'hd9d: begin
        out_r = 13'h0fa7;
      end
      12'hd9e: begin
        out_r = 13'h0fae;
      end
      12'hd9f: begin
        out_r = 13'h0fa7;
        case (key_hi)
          1'h1: out_r = 13'h0fa4;
          default: begin end
        endcase
      end
      12'hda0: begin
        out_r = 13'h0f41;
      end
      12'hda1: begin
        out_r = 13'h0f46;
      end
      12'hda2: begin
        out_r = 13'h0f49;
      end
      12'hda3: begin
        out_r = 13'h0f47;
      end
      12'hda4: begin
        out_r = 13'h0f51;
        case (key_hi)
          1'h1: out_r = 13'h0f53;
          default: begin end
        endcase
      end
      12'hda5: begin
        out_r = 13'h0f59;
      end
      12'hda6: begin
        out_r = 13'h0f56;
        case (key_hi)
          1'h1: out_r = 13'h0f54;
          default: begin end
        endcase
      end
      12'hda7: begin
        out_r = 13'h0f59;
      end
      12'hda8: begin
        out_r = 13'h0f69;
      end
      12'hda9: begin
        out_r = 13'h0f66;
      end
      12'hdaa: begin
        out_r = 13'h0f6e;
      end
      12'hdab: begin
        out_r = 13'h0f66;
      end
      12'hdac: begin
        out_r = 13'h0f57;
      end
      12'hdad: begin
        out_r = 13'h0f51;
      end
      12'hdae: begin
        out_r = 13'h0f57;
      end
      12'hdaf: begin
        out_r = 13'h0f5e;
      end
      12'hdb0: begin
        out_r = 13'h0f96;
      end
      12'hdb1: begin
        out_r = 13'h0f99;
      end
      12'hdb2: begin
        out_r = 13'h0f91;
      end
      12'hdb3: begin
        out_r = 13'h0f99;
      end
      12'hdb4: begin
        out_r = 13'h0f89;
        case (key_hi)
          1'h1: out_r = 13'h0f8b;
          default: begin end
        endcase
      end
      12'hdb5: begin
        out_r = 13'h0f87;
      end
      12'hdb6: begin
        out_r = 13'h0f81;
        case (key_hi)
          1'h1: out_r = 13'h0f80;
          default: begin end
        endcase
      end
      12'hdb7: begin
        out_r = 13'h0f86;
        case (key_hi)
          1'h1: out_r = 13'h0f84;
          default: begin end
        endcase
      end
      12'hdb8: begin
        out_r = 13'h0f96;
      end
      12'hdb9: begin
        out_r = 13'h0f99;
      end
      12'hdba: begin
        out_r = 13'h0f97;
      end
      12'hdbb: begin
        out_r = 13'h0f99;
      end
      12'hdbc: begin
        out_r = 13'h0fbe;
      end
      12'hdbd: begin
        out_r = 13'h0fbb;
      end
      12'hdbe: begin
        out_r = 13'h0fbe;
      end
      12'hdbf: begin
        out_r = 13'h0fbb;
        case (key_hi)
          1'h1: out_r = 13'h0fb8;
          default: begin end
        endcase
      end
      12'hdc0: begin
        out_r = 13'h0e41;
        case (key_hi)
          1'h1: out_r = 13'h0e43;
          default: begin end
        endcase
      end
      12'hdc1: begin
        out_r = 13'h0e46;
      end
      12'hdc2: begin
        out_r = 13'h0e49;
        case (key_hi)
          1'h1: out_r = 13'h0e4b;
          default: begin end
        endcase
      end
      12'hdc3: begin
        out_r = 13'h0e4e;
      end
      12'hdc4: begin
        out_r = 13'h0e6e;
      end
      12'hdc5: begin
        out_r = 13'h0e66;
      end
      12'hdc6: begin
        out_r = 13'h0e61;
      end
      12'hdc7: begin
        out_r = 13'h0e64;
        case (key_hi)
          1'h1: out_r = 13'h0e66;
          default: begin end
        endcase
      end
      12'hdc8: begin
        out_r = 13'h0e56;
        case (key_hi)
          1'h1: out_r = 13'h0e54;
          default: begin end
        endcase
      end
      12'hdc9: begin
        out_r = 13'h0e59;
      end
      12'hdca: begin
        out_r = 13'h0e57;
      end
      12'hdcb: begin
        out_r = 13'h0e51;
      end
      12'hdcc: begin
        out_r = 13'h0e6e;
      end
      12'hdcd: begin
        out_r = 13'h0e66;
      end
      12'hdce: begin
        out_r = 13'h0e6e;
      end
      12'hdcf: begin
        out_r = 13'h0e66;
        case (key_hi)
          1'h1: out_r = 13'h0e64;
          default: begin end
        endcase
      end
      12'hdd0: begin
        out_r = 13'h0ec1;
      end
      12'hdd1: begin
        out_r = 13'h0ec6;
      end
      12'hdd2: begin
        out_r = 13'h0ec9;
      end
      12'hdd3: begin
        out_r = 13'h0ec6;
      end
      12'hdd4: begin
        out_r = 13'h0ee1;
        case (key_hi)
          1'h1: out_r = 13'h0ee3;
          default: begin end
        endcase
      end
      12'hdd5: begin
        out_r = 13'h0ee9;
      end
      12'hdd6: begin
        out_r = 13'h0eee;
      end
      12'hdd7: begin
        out_r = 13'h0eeb;
        case (key_hi)
          1'h1: out_r = 13'h0ee8;
          default: begin end
        endcase
      end
      12'hdd8: begin
        out_r = 13'h0ef1;
      end
      12'hdd9: begin
        out_r = 13'h0efa;
      end
      12'hdda: begin
        out_r = 13'h0ef5;
      end
      12'hddb: begin
        out_r = 13'h0ef8;
        case (key_hi)
          1'h1: out_r = 13'h0efb;
          default: begin end
        endcase
      end
      12'hddc: begin
        out_r = 13'h0ee6;
      end
      12'hddd: begin
        out_r = 13'h0eee;
      end
      12'hdde: begin
        out_r = 13'h0ee6;
      end
      12'hddf: begin
        out_r = 13'h0ee3;
        case (key_hi)
          1'h1: out_r = 13'h0ee0;
          default: begin end
        endcase
      end
      12'hde0: begin
        out_r = 13'h0e41;
        case (key_hi)
          1'h1: out_r = 13'h0e43;
          default: begin end
        endcase
      end
      12'hde1: begin
        out_r = 13'h0e46;
      end
      12'hde2: begin
        out_r = 13'h0e49;
        case (key_hi)
          1'h1: out_r = 13'h0e4b;
          default: begin end
        endcase
      end
      12'hde3: begin
        out_r = 13'h0e4e;
      end
      12'hde4: begin
        out_r = 13'h0e6e;
      end
      12'hde5: begin
        out_r = 13'h0e66;
      end
      12'hde6: begin
        out_r = 13'h0e61;
      end
      12'hde7: begin
        out_r = 13'h0e66;
        case (key_hi)
          1'h1: out_r = 13'h0e64;
          default: begin end
        endcase
      end
      12'hde8: begin
        out_r = 13'h0e56;
        case (key_hi)
          1'h1: out_r = 13'h0e54;
          default: begin end
        endcase
      end
      12'hde9: begin
        out_r = 13'h0e59;
      end
      12'hdea: begin
        out_r = 13'h0e51;
      end
      12'hdeb: begin
        out_r = 13'h0e59;
      end
      12'hdec: begin
        out_r = 13'h0e6e;
      end
      12'hded: begin
        out_r = 13'h0e66;
      end
      12'hdee: begin
        out_r = 13'h0e6e;
      end
      12'hdef: begin
        out_r = 13'h0e66;
        case (key_hi)
          1'h1: out_r = 13'h0e64;
          default: begin end
        endcase
      end
      12'hdf0: begin
        out_r = 13'h0e21;
        case (key_hi)
          1'h1: out_r = 13'h0e23;
          default: begin end
        endcase
      end
      12'hdf1: begin
        out_r = 13'h0e26;
      end
      12'hdf2: begin
        out_r = 13'h0e29;
        case (key_hi)
          1'h1: out_r = 13'h0e2b;
          default: begin end
        endcase
      end
      12'hdf3: begin
        out_r = 13'h0e2e;
      end
      12'hdf4: begin
        out_r = 13'h0e31;
      end
      12'hdf5: begin
        out_r = 13'h0e3a;
      end
      12'hdf6: begin
        out_r = 13'h0e3e;
      end
      12'hdf7: begin
        out_r = 13'h0e3b;
        case (key_hi)
          1'h1: out_r = 13'h0e38;
          default: begin end
        endcase
      end
      12'hdf8: begin
        out_r = 13'h0e21;
        case (key_hi)
          1'h1: out_r = 13'h0e23;
          default: begin end
        endcase
      end
      12'hdf9: begin
        out_r = 13'h0e26;
      end
      12'hdfa: begin
        out_r = 13'h0e29;
      end
      12'hdfb: begin
        out_r = 13'h0e2e;
      end
      12'hdfc: begin
        out_r = 13'h0e09;
        case (key_hi)
          1'h1: out_r = 13'h0e0b;
          default: begin end
        endcase
      end
      12'hdfd: begin
        out_r = 13'h0e0e;
      end
      12'hdfe: begin
        out_r = 13'h0e09;
        case (key_hi)
          1'h1: out_r = 13'h0e0b;
          default: begin end
        endcase
      end
      12'hdff: begin
        out_r = 13'h0e03;
        case (key_hi)
          1'h1: out_r = 13'h0e00;
          default: begin end
        endcase
      end
      12'he00: begin
        out_r = 13'h0801;
        case (key_hi)
          1'h1: out_r = 13'h0403;
          default: begin end
        endcase
      end
      12'he01: begin
        out_r = 13'h0406;
      end
      12'he02: begin
        out_r = 13'h0809;
        case (key_hi)
          1'h1: out_r = 13'h040b;
          default: begin end
        endcase
      end
      12'he03: begin
        out_r = 13'h080e;
      end
      12'he04: begin
        out_r = 13'h0811;
        case (key_hi)
          1'h1: out_r = 13'h0413;
          default: begin end
        endcase
      end
      12'he05: begin
        out_r = 13'h0819;
      end
      12'he06: begin
        out_r = 13'h0416;
        case (key_hi)
          1'h1: out_r = 13'h0814;
          default: begin end
        endcase
      end
      12'he07: begin
        out_r = 13'h0819;
      end
      12'he08: begin
        out_r = 13'h0821;
        case (key_hi)
          1'h1: out_r = 13'h0423;
          default: begin end
        endcase
      end
      12'he09: begin
        out_r = 13'h0426;
      end
      12'he0a: begin
        out_r = 13'h0829;
        case (key_hi)
          1'h1: out_r = 13'h042b;
          default: begin end
        endcase
      end
      12'he0b: begin
        out_r = 13'h082e;
      end
      12'he0c: begin
        out_r = 13'h0835;
      end
      12'he0d: begin
        out_r = 13'h083a;
      end
      12'he0e: begin
        out_r = 13'h0835;
      end
      12'he0f: begin
        out_r = 13'h043b;
        case (key_hi)
          1'h1: out_r = 13'h0838;
          default: begin end
        endcase
      end
      12'he10: begin
        out_r = 13'h0841;
        case (key_hi)
          1'h1: out_r = 13'h0443;
          default: begin end
        endcase
      end
      12'he11: begin
        out_r = 13'h0446;
      end
      12'he12: begin
        out_r = 13'h0849;
        case (key_hi)
          1'h1: out_r = 13'h044b;
          default: begin end
        endcase
      end
      12'he13: begin
        out_r = 13'h084e;
      end
      12'he14: begin
        out_r = 13'h0861;
      end
      12'he15: begin
        out_r = 13'h0467;
      end
      12'he16: begin
        out_r = 13'h086e;
      end
      12'he17: begin
        out_r = 13'h0866;
        case (key_hi)
          1'h1: out_r = 13'h0864;
          default: begin end
        endcase
      end
      12'he18: begin
        out_r = 13'h0456;
        case (key_hi)
          1'h1: out_r = 13'h0854;
          default: begin end
        endcase
      end
      12'he19: begin
        out_r = 13'h0859;
      end
      12'he1a: begin
        out_r = 13'h0857;
      end
      12'he1b: begin
        out_r = 13'h0850;
        case (key_hi)
          1'h1: out_r = 13'h0851;
          default: begin end
        endcase
      end
      12'he1c: begin
        out_r = 13'h0869;
      end
      12'he1d: begin
        out_r = 13'h0467;
      end
      12'he1e: begin
        out_r = 13'h0869;
      end
      12'he1f: begin
        out_r = 13'h0866;
        case (key_hi)
          1'h1: out_r = 13'h0864;
          default: begin end
        endcase
      end
      12'he20: begin
        out_r = 13'h0881;
        case (key_hi)
          1'h1: out_r = 13'h0483;
          default: begin end
        endcase
      end
      12'he21: begin
        out_r = 13'h0486;
      end
      12'he22: begin
        out_r = 13'h0889;
        case (key_hi)
          1'h1: out_r = 13'h048b;
          default: begin end
        endcase
      end
      12'he23: begin
        out_r = 13'h088e;
      end
      12'he24: begin
        out_r = 13'h0891;
        case (key_hi)
          1'h1: out_r = 13'h0493;
          default: begin end
        endcase
      end
      12'he25: begin
        out_r = 13'h0899;
      end
      12'he26: begin
        out_r = 13'h0496;
        case (key_hi)
          1'h1: out_r = 13'h0894;
          default: begin end
        endcase
      end
      12'he27: begin
        out_r = 13'h0899;
      end
      12'he28: begin
        out_r = 13'h08a1;
        case (key_hi)
          1'h1: out_r = 13'h04a3;
          default: begin end
        endcase
      end
      12'he29: begin
        out_r = 13'h04a6;
      end
      12'he2a: begin
        out_r = 13'h08a9;
        case (key_hi)
          1'h1: out_r = 13'h04ab;
          default: begin end
        endcase
      end
      12'he2b: begin
        out_r = 13'h08ae;
      end
      12'he2c: begin
        out_r = 13'h08b5;
      end
      12'he2d: begin
        out_r = 13'h08ba;
      end
      12'he2e: begin
        out_r = 13'h08b5;
      end
      12'he2f: begin
        out_r = 13'h04bb;
        case (key_hi)
          1'h1: out_r = 13'h08b8;
          default: begin end
        endcase
      end
      12'he30: begin
        out_r = 13'h08d1;
      end
      12'he31: begin
        out_r = 13'h04d6;
      end
      12'he32: begin
        out_r = 13'h08d9;
      end
      12'he33: begin
        out_r = 13'h08d4;
        case (key_hi)
          1'h1: out_r = 13'h08d7;
          default: begin end
        endcase
      end
      12'he34: begin
        out_r = 13'h04e6;
      end
      12'he35: begin
        out_r = 13'h08e9;
      end
      12'he36: begin
        out_r = 13'h08e1;
        case (key_hi)
          1'h1: out_r = 13'h08e0;
          default: begin end
        endcase
      end
      12'he37: begin
        out_r = 13'h04eb;
        case (key_hi)
          1'h1: out_r = 13'h08e8;
          default: begin end
        endcase
      end
      12'he38: begin
        out_r = 13'h08d1;
      end
      12'he39: begin
        out_r = 13'h04d6;
      end
      12'he3a: begin
        out_r = 13'h08de;
      end
      12'he3b: begin
        out_r = 13'h08d4;
        case (key_hi)
          1'h1: out_r = 13'h08d7;
          default: begin end
        endcase
      end
      12'he3c: begin
        out_r = 13'h08e7;
      end
      12'he3d: begin
        out_r = 13'h08ee;
      end
      12'he3e: begin
        out_r = 13'h08e7;
      end
      12'he3f: begin
        out_r = 13'h04e3;
        case (key_hi)
          1'h1: out_r = 13'h08e0;
          default: begin end
        endcase
      end
      12'he40: begin
        out_r = 13'h0bf5;
        case (key_hi)
          1'h1: out_r = 13'h0bd9;
          default: begin end
        endcase
      end
      12'he41: begin
        out_r = 13'h0b21;
        case (key_hi)
          1'h1: out_r = 13'h0506;
          default: begin end
        endcase
      end
      12'he42: begin
        out_r = 13'h0bfe;
        case (key_hi)
          1'h1: out_r = 13'h09f1;
          default: begin end
        endcase
      end
      12'he43: begin
        out_r = 13'h0951;
        case (key_hi)
          1'h1: out_r = 13'h090e;
          default: begin end
        endcase
      end
      12'he44: begin
        out_r = 13'h0be1;
        case (key_hi)
          1'h1: out_r = 13'h06e3;
          default: begin end
        endcase
      end
      12'he45: begin
        out_r = 13'h0bee;
        case (key_hi)
          1'h1: out_r = 13'h0919;
          default: begin end
        endcase
      end
      12'he46: begin
        out_r = 13'h05e7;
        case (key_hi)
          1'h1: out_r = 13'h0914;
          default: begin end
        endcase
      end
      12'he47: begin
        out_r = 13'h0b5e;
        case (key_hi)
          1'h1: out_r = 13'h0919;
          default: begin end
        endcase
      end
      12'he48: begin
        out_r = 13'h0bce;
        case (key_hi)
          1'h1: out_r = 13'h06f7;
          default: begin end
        endcase
      end
      12'he49: begin
        out_r = 13'h0b3b;
        case (key_hi)
          1'h1: out_r = 13'h0526;
          default: begin end
        endcase
      end
      12'he4a: begin
        out_r = 13'h0bc1;
        case (key_hi)
          1'h1: out_r = 13'h092e;
          default: begin end
        endcase
      end
      12'he4b: begin
        out_r = 13'h0b3e;
        case (key_hi)
          1'h1: out_r = 13'h092e;
          default: begin end
        endcase
      end
      12'he4c: begin
        out_r = 13'h0a57;
        case (key_hi)
          1'h1: out_r = 13'h0935;
          default: begin end
        endcase
      end
      12'he4d: begin
        out_r = 13'h0b5e;
        case (key_hi)
          1'h1: out_r = 13'h093a;
          default: begin end
        endcase
      end
      12'he4e: begin
        out_r = 13'h0969;
        case (key_hi)
          1'h1: out_r = 13'h0935;
          default: begin end
        endcase
      end
      12'he4f: begin
        out_r = 13'h0919;
        case (key_hi)
          1'h1: out_r = 13'h0938;
          default: begin end
        endcase
      end
      12'he50: begin
        out_r = 13'h0b81;
        case (key_hi)
          1'h1: out_r = 13'h0643;
          default: begin end
        endcase
      end
      12'he51: begin
        out_r = 13'h0546;
        case (key_hi)
          1'h1: out_r = 13'h09d9;
          default: begin end
        endcase
      end
      12'he52: begin
        out_r = 13'h0b89;
        case (key_hi)
          1'h1: out_r = 13'h064b;
          default: begin end
        endcase
      end
      12'he53: begin
        out_r = 13'h05a6;
        case (key_hi)
          1'h1: out_r = 13'h05fa;
          default: begin end
        endcase
      end
      12'he54: begin
        out_r = 13'h0ba1;
        case (key_hi)
          1'h1: out_r = 13'h0991;
          default: begin end
        endcase
      end
      12'he55: begin
        out_r = 13'h0ae5;
        case (key_hi)
          1'h1: out_r = 13'h0999;
          default: begin end
        endcase
      end
      12'he56: begin
        out_r = 13'h0ba9;
        case (key_hi)
          1'h1: out_r = 13'h05e6;
          default: begin end
        endcase
      end
      12'he57: begin
        out_r = 13'h0bba;
        case (key_hi)
          1'h1: out_r = 13'h0999;
          default: begin end
        endcase
      end
      12'he58: begin
        out_r = 13'h0bb1;
        case (key_hi)
          1'h1: out_r = 13'h0a97;
          default: begin end
        endcase
      end
      12'he59: begin
        out_r = 13'h0bba;
        case (key_hi)
          1'h1: out_r = 13'h0b99;
          default: begin end
        endcase
      end
      12'he5a: begin
        out_r = 13'h0bb5;
        case (key_hi)
          1'h1: out_r = 13'h0981;
          default: begin end
        endcase
      end
      12'he5b: begin
        out_r = 13'h05fa;
        case (key_hi)
          1'h1: out_r = 13'h0697;
          default: begin end
        endcase
      end
      12'he5c: begin
        out_r = 13'h0bae;
        case (key_hi)
          1'h1: out_r = 13'h0597;
          default: begin end
        endcase
      end
      12'he5d: begin
        out_r = 13'h0ae5;
        case (key_hi)
          1'h1: out_r = 13'h0999;
          default: begin end
        endcase
      end
      12'he5e: begin
        out_r = 13'h0bae;
        case (key_hi)
          1'h1: out_r = 13'h0597;
          default: begin end
        endcase
      end
      12'he5f: begin
        out_r = 13'h0bbb;
        case (key_hi)
          1'h1: out_r = 13'h0990;
          default: begin end
        endcase
      end
      12'he60: begin
        out_r = 13'h0b7e;
        case (key_hi)
          1'h1: out_r = 13'h090e;
          default: begin end
        endcase
      end
      12'he61: begin
        out_r = 13'h05d6;
        case (key_hi)
          1'h1: out_r = 13'h0b3a;
          default: begin end
        endcase
      end
      12'he62: begin
        out_r = 13'h0b71;
        case (key_hi)
          1'h1: out_r = 13'h0948;
          default: begin end
        endcase
      end
      12'he63: begin
        out_r = 13'h093a;
        case (key_hi)
          1'h1: out_r = 13'h0b3a;
          default: begin end
        endcase
      end
      12'he64: begin
        out_r = 13'h0b51;
        case (key_hi)
          1'h1: out_r = 13'h0b54;
          default: begin end
        endcase
      end
      12'he65: begin
        out_r = 13'h0b5e;
        case (key_hi)
          1'h1: out_r = 13'h067a;
          default: begin end
        endcase
      end
      12'he66: begin
        out_r = 13'h05e7;
        case (key_hi)
          1'h1: out_r = 13'h0951;
          default: begin end
        endcase
      end
      12'he67: begin
        out_r = 13'h0be9;
        case (key_hi)
          1'h1: out_r = 13'h067a;
          default: begin end
        endcase
      end
      12'he68: begin
        out_r = 13'h0b6e;
        case (key_hi)
          1'h1: out_r = 13'h0949;
          default: begin end
        endcase
      end
      12'he69: begin
        out_r = 13'h0a27;
      end
      12'he6a: begin
        out_r = 13'h0b69;
        case (key_hi)
          1'h1: out_r = 13'h0b68;
          default: begin end
        endcase
      end
      12'he6b: begin
        out_r = 13'h0904;
        case (key_hi)
          1'h1: out_r = 13'h0bfe;
          default: begin end
        endcase
      end
      12'he6c: begin
        out_r = 13'h05e7;
        case (key_hi)
          1'h1: out_r = 13'h0951;
          default: begin end
        endcase
      end
      12'he6d: begin
        out_r = 13'h0b51;
        case (key_hi)
          1'h1: out_r = 13'h0bfb;
          default: begin end
        endcase
      end
      12'he6e: begin
        out_r = 13'h09a0;
        case (key_hi)
          1'h1: out_r = 13'h0951;
          default: begin end
        endcase
      end
      12'he6f: begin
        out_r = 13'h0be9;
        case (key_hi)
          1'h1: out_r = 13'h0978;
          default: begin end
        endcase
      end
      12'he70: begin
        out_r = 13'h0b91;
      end
      12'he71: begin
        out_r = 13'h0b99;
        case (key_hi)
          1'h1: out_r = 13'h095a;
          default: begin end
        endcase
      end
      12'he72: begin
        out_r = 13'h0ab7;
        case (key_hi)
          1'h1: out_r = 13'h09d0;
          default: begin end
        endcase
      end
      12'he73: begin
        out_r = 13'h0abb;
        case (key_hi)
          1'h1: out_r = 13'h0a55;
          default: begin end
        endcase
      end
      12'he74: begin
        out_r = 13'h0bb1;
        case (key_hi)
          1'h1: out_r = 13'h0ba9;
          default: begin end
        endcase
      end
      12'he75: begin
        out_r = 13'h0bba;
        case (key_hi)
          1'h1: out_r = 13'h09e9;
          default: begin end
        endcase
      end
      12'he76: begin
        out_r = 13'h0bbe;
        case (key_hi)
          1'h1: out_r = 13'h05e6;
          default: begin end
        endcase
      end
      12'he77: begin
        out_r = 13'h067b;
        case (key_hi)
          1'h1: out_r = 13'h0999;
          default: begin end
        endcase
      end
      12'he78: begin
        out_r = 13'h0b91;
      end
      12'he79: begin
        out_r = 13'h0b9e;
        case (key_hi)
          1'h1: out_r = 13'h0ac7;
          default: begin end
        endcase
      end
      12'he7a: begin
        out_r = 13'h0ab7;
        case (key_hi)
          1'h1: out_r = 13'h09b5;
          default: begin end
        endcase
      end
      12'he7b: begin
        out_r = 13'h0abb;
        case (key_hi)
          1'h1: out_r = 13'h0a55;
          default: begin end
        endcase
      end
      12'he7c: begin
        out_r = 13'h0b89;
        case (key_hi)
          1'h1: out_r = 13'h064b;
          default: begin end
        endcase
      end
      12'he7d: begin
        out_r = 13'h0b8e;
        case (key_hi)
          1'h1: out_r = 13'h099e;
          default: begin end
        endcase
      end
      12'he7e: begin
        out_r = 13'h0b89;
        case (key_hi)
          1'h1: out_r = 13'h064b;
          default: begin end
        endcase
      end
      12'he7f: begin
        out_r = 13'h0643;
        case (key_hi)
          1'h1: out_r = 13'h0990;
          default: begin end
        endcase
      end
      12'he80: begin
        out_r = 13'h0a01;
        case (key_hi)
          1'h1: out_r = 13'h0a94;
          default: begin end
        endcase
      end
      12'he81: begin
        out_r = 13'h0a3a;
      end
      12'he82: begin
        out_r = 13'h0a09;
        case (key_hi)
          1'h1: out_r = 13'h0b6b;
          default: begin end
        endcase
      end
      12'he83: begin
        out_r = 13'h0a0e;
      end
      12'he84: begin
        out_r = 13'h0a11;
        case (key_hi)
          1'h1: out_r = 13'h0a61;
          default: begin end
        endcase
      end
      12'he85: begin
        out_r = 13'h0a19;
      end
      12'he86: begin
        out_r = 13'h060c;
        case (key_hi)
          1'h1: out_r = 13'h0b54;
          default: begin end
        endcase
      end
      12'he87: begin
        out_r = 13'h0a19;
      end
      12'he88: begin
        out_r = 13'h0a21;
        case (key_hi)
          1'h1: out_r = 13'h0aa4;
          default: begin end
        endcase
      end
      12'he89: begin
        out_r = 13'h053a;
      end
      12'he8a: begin
        out_r = 13'h0a29;
        case (key_hi)
          1'h1: out_r = 13'h0aa0;
          default: begin end
        endcase
      end
      12'he8b: begin
        out_r = 13'h0a2e;
      end
      12'he8c: begin
        out_r = 13'h0a35;
        case (key_hi)
          1'h1: out_r = 13'h0b67;
          default: begin end
        endcase
      end
      12'he8d: begin
        out_r = 13'h0a3a;
      end
      12'he8e: begin
        out_r = 13'h0b11;
        case (key_hi)
          1'h1: out_r = 13'h0b67;
          default: begin end
        endcase
      end
      12'he8f: begin
        out_r = 13'h053b;
        case (key_hi)
          1'h1: out_r = 13'h0a38;
          default: begin end
        endcase
      end
      12'he90: begin
        out_r = 13'h0ad9;
        case (key_hi)
          1'h1: out_r = 13'h0aae;
          default: begin end
        endcase
      end
      12'he91: begin
        out_r = 13'h0ad9;
        case (key_hi)
          1'h1: out_r = 13'h0786;
          default: begin end
        endcase
      end
      12'he92: begin
        out_r = 13'h0ad1;
        case (key_hi)
          1'h1: out_r = 13'h0ad8;
          default: begin end
        endcase
      end
      12'he93: begin
        out_r = 13'h0a51;
        case (key_hi)
          1'h1: out_r = 13'h0a4e;
          default: begin end
        endcase
      end
      12'he94: begin
        out_r = 13'h0aee;
        case (key_hi)
          1'h1: out_r = 13'h0ae1;
          default: begin end
        endcase
      end
      12'he95: begin
        out_r = 13'h0ba7;
        case (key_hi)
          1'h1: out_r = 13'h0bba;
          default: begin end
        endcase
      end
      12'he96: begin
        out_r = 13'h06a6;
        case (key_hi)
          1'h1: out_r = 13'h0bb5;
          default: begin end
        endcase
      end
      12'he97: begin
        out_r = 13'h0ba6;
        case (key_hi)
          1'h1: out_r = 13'h0a78;
          default: begin end
        endcase
      end
      12'he98: begin
        out_r = 13'h0af5;
        case (key_hi)
          1'h1: out_r = 13'h0bb5;
          default: begin end
        endcase
      end
      12'he99: begin
        out_r = 13'h0a20;
        case (key_hi)
          1'h1: out_r = 13'h0ac5;
          default: begin end
        endcase
      end
      12'he9a: begin
        out_r = 13'h0b8e;
        case (key_hi)
          1'h1: out_r = 13'h079a;
          default: begin end
        endcase
      end
      12'he9b: begin
        out_r = 13'h0a59;
        case (key_hi)
          1'h1: out_r = 13'h0a5e;
          default: begin end
        endcase
      end
      12'he9c: begin
        out_r = 13'h0ae1;
        case (key_hi)
          1'h1: out_r = 13'h0a6e;
          default: begin end
        endcase
      end
      12'he9d: begin
        out_r = 13'h0a19;
        case (key_hi)
          1'h1: out_r = 13'h066a;
          default: begin end
        endcase
      end
      12'he9e: begin
        out_r = 13'h0ae1;
        case (key_hi)
          1'h1: out_r = 13'h0a6e;
          default: begin end
        endcase
      end
      12'he9f: begin
        out_r = 13'h0ba6;
        case (key_hi)
          1'h1: out_r = 13'h0a78;
          default: begin end
        endcase
      end
      12'hea0: begin
        out_r = 13'h0ab1;
        case (key_hi)
          1'h1: out_r = 13'h0a31;
          default: begin end
        endcase
      end
      12'hea1: begin
        out_r = 13'h0a3a;
      end
      12'hea2: begin
        out_r = 13'h0ab5;
        case (key_hi)
          1'h1: out_r = 13'h0a3e;
          default: begin end
        endcase
      end
      12'hea3: begin
        out_r = 13'h0aa1;
        case (key_hi)
          1'h1: out_r = 13'h0746;
          default: begin end
        endcase
      end
      12'hea4: begin
        out_r = 13'h0a91;
        case (key_hi)
          1'h1: out_r = 13'h0513;
          default: begin end
        endcase
      end
      12'hea5: begin
        out_r = 13'h0a9e;
        case (key_hi)
          1'h1: out_r = 13'h0aee;
          default: begin end
        endcase
      end
      12'hea6: begin
        out_r = 13'h0b17;
        case (key_hi)
          1'h1: out_r = 13'h0b14;
          default: begin end
        endcase
      end
      12'hea7: begin
        out_r = 13'h0be9;
        case (key_hi)
          1'h1: out_r = 13'h0aee;
          default: begin end
        endcase
      end
      12'hea8: begin
        out_r = 13'h0aae;
        case (key_hi)
          1'h1: out_r = 13'h050b;
          default: begin end
        endcase
      end
      12'hea9: begin
        out_r = 13'h0a84;
        case (key_hi)
          1'h1: out_r = 13'h07d7;
          default: begin end
        endcase
      end
      12'heaa: begin
        out_r = 13'h0aa1;
        case (key_hi)
          1'h1: out_r = 13'h0a00;
          default: begin end
        endcase
      end
      12'heab: begin
        out_r = 13'h0a81;
        case (key_hi)
          1'h1: out_r = 13'h09c7;
          default: begin end
        endcase
      end
      12'heac: begin
        out_r = 13'h0a81;
        case (key_hi)
          1'h1: out_r = 13'h0b11;
          default: begin end
        endcase
      end
      12'head: begin
        out_r = 13'h0bee;
        case (key_hi)
          1'h1: out_r = 13'h0a1e;
          default: begin end
        endcase
      end
      12'heae: begin
        out_r = 13'h0b50;
        case (key_hi)
          1'h1: out_r = 13'h0b11;
          default: begin end
        endcase
      end
      12'heaf: begin
        out_r = 13'h0bee;
        case (key_hi)
          1'h1: out_r = 13'h0ae8;
          default: begin end
        endcase
      end
      12'heb0: begin
        out_r = 13'h0ace;
        case (key_hi)
          1'h1: out_r = 13'h0af1;
          default: begin end
        endcase
      end
      12'heb1: begin
        out_r = 13'h0b9e;
        case (key_hi)
          1'h1: out_r = 13'h0ad6;
          default: begin end
        endcase
      end
      12'heb2: begin
        out_r = 13'h0ac1;
        case (key_hi)
          1'h1: out_r = 13'h0b94;
          default: begin end
        endcase
      end
      12'heb3: begin
        out_r = 13'h0a44;
        case (key_hi)
          1'h1: out_r = 13'h0a51;
          default: begin end
        endcase
      end
      12'heb4: begin
        out_r = 13'h0b9b;
        case (key_hi)
          1'h1: out_r = 13'h0666;
          default: begin end
        endcase
      end
      12'heb5: begin
        out_r = 13'h0a79;
        case (key_hi)
          1'h1: out_r = 13'h0b87;
          default: begin end
        endcase
      end
      12'heb6: begin
        out_r = 13'h0ae1;
        case (key_hi)
          1'h1: out_r = 13'h0b80;
          default: begin end
        endcase
      end
      12'heb7: begin
        out_r = 13'h07a6;
        case (key_hi)
          1'h1: out_r = 13'h0a44;
          default: begin end
        endcase
      end
      12'heb8: begin
        out_r = 13'h0ace;
        case (key_hi)
          1'h1: out_r = 13'h0af1;
          default: begin end
        endcase
      end
      12'heb9: begin
        out_r = 13'h0597;
        case (key_hi)
          1'h1: out_r = 13'h0a59;
          default: begin end
        endcase
      end
      12'heba: begin
        out_r = 13'h0bb5;
        case (key_hi)
          1'h1: out_r = 13'h0b94;
          default: begin end
        endcase
      end
      12'hebb: begin
        out_r = 13'h0a44;
        case (key_hi)
          1'h1: out_r = 13'h0a51;
          default: begin end
        endcase
      end
      12'hebc: begin
        out_r = 13'h0aee;
        case (key_hi)
          1'h1: out_r = 13'h0ae1;
          default: begin end
        endcase
      end
      12'hebd: begin
        out_r = 13'h0ae9;
        case (key_hi)
          1'h1: out_r = 13'h07ba;
          default: begin end
        endcase
      end
      12'hebe: begin
        out_r = 13'h0aee;
        case (key_hi)
          1'h1: out_r = 13'h0ae1;
          default: begin end
        endcase
      end
      12'hebf: begin
        out_r = 13'h05e3;
        case (key_hi)
          1'h1: out_r = 13'h0a78;
          default: begin end
        endcase
      end
      12'hec0: begin
        out_r = 13'h0ad7;
        case (key_hi)
          1'h1: out_r = 13'h06f7;
          default: begin end
        endcase
      end
      12'hec1: begin
        out_r = 13'h0bf1;
        case (key_hi)
          1'h1: out_r = 13'h0afa;
          default: begin end
        endcase
      end
      12'hec2: begin
        out_r = 13'h0951;
        case (key_hi)
          1'h1: out_r = 13'h092e;
          default: begin end
        endcase
      end
      12'hec3: begin
        out_r = 13'h0506;
        case (key_hi)
          1'h1: out_r = 13'h0b46;
          default: begin end
        endcase
      end
      12'hec4: begin
        out_r = 13'h0969;
        case (key_hi)
          1'h1: out_r = 13'h06e3;
          default: begin end
        endcase
      end
      12'hec5: begin
        out_r = 13'h0707;
        case (key_hi)
          1'h1: out_r = 13'h0b59;
          default: begin end
        endcase
      end
      12'hec6: begin
        out_r = 13'h096f;
        case (key_hi)
          1'h1: out_r = 13'h0914;
          default: begin end
        endcase
      end
      12'hec7: begin
        out_r = 13'h0919;
        case (key_hi)
          1'h1: out_r = 13'h0b59;
          default: begin end
        endcase
      end
      12'hec8: begin
        out_r = 13'h0ad7;
        case (key_hi)
          1'h1: out_r = 13'h09f1;
          default: begin end
        endcase
      end
      12'hec9: begin
        out_r = 13'h06d7;
        case (key_hi)
          1'h1: out_r = 13'h0a27;
          default: begin end
        endcase
      end
      12'heca: begin
        out_r = 13'h0951;
        case (key_hi)
          1'h1: out_r = 13'h0b21;
          default: begin end
        endcase
      end
      12'hecb: begin
        out_r = 13'h0ad7;
        case (key_hi)
          1'h1: out_r = 13'h0aa7;
          default: begin end
        endcase
      end
      12'hecc: begin
        out_r = 13'h094e;
        case (key_hi)
          1'h1: out_r = 13'h0516;
          default: begin end
        endcase
      end
      12'hecd: begin
        out_r = 13'h0b66;
        case (key_hi)
          1'h1: out_r = 13'h0b51;
          default: begin end
        endcase
      end
      12'hece: begin
        out_r = 13'h09e1;
        case (key_hi)
          1'h1: out_r = 13'h0516;
          default: begin end
        endcase
      end
      12'hecf: begin
        out_r = 13'h091e;
        case (key_hi)
          1'h1: out_r = 13'h0b5e;
          default: begin end
        endcase
      end
      12'hed0: begin
        out_r = 13'h0921;
        case (key_hi)
          1'h1: out_r = 13'h0a91;
          default: begin end
        endcase
      end
      12'hed1: begin
        out_r = 13'h0526;
        case (key_hi)
          1'h1: out_r = 13'h0ad7;
          default: begin end
        endcase
      end
      12'hed2: begin
        out_r = 13'h0929;
        case (key_hi)
          1'h1: out_r = 13'h0b91;
          default: begin end
        endcase
      end
      12'hed3: begin
        out_r = 13'h0b9e;
        case (key_hi)
          1'h1: out_r = 13'h0b99;
          default: begin end
        endcase
      end
      12'hed4: begin
        out_r = 13'h0911;
        case (key_hi)
          1'h1: out_r = 13'h0991;
          default: begin end
        endcase
      end
      12'hed5: begin
        out_r = 13'h091e;
        case (key_hi)
          1'h1: out_r = 13'h05aa;
          default: begin end
        endcase
      end
      12'hed6: begin
        out_r = 13'h0a17;
        case (key_hi)
          1'h1: out_r = 13'h0991;
          default: begin end
        endcase
      end
      12'hed7: begin
        out_r = 13'h0bae;
        case (key_hi)
          1'h1: out_r = 13'h05aa;
          default: begin end
        endcase
      end
      12'hed8: begin
        out_r = 13'h0909;
        case (key_hi)
          1'h1: out_r = 13'h064b;
          default: begin end
        endcase
      end
      12'hed9: begin
        out_r = 13'h0a07;
        case (key_hi)
          1'h1: out_r = 13'h0a87;
          default: begin end
        endcase
      end
      12'heda: begin
        out_r = 13'h090e;
        case (key_hi)
          1'h1: out_r = 13'h09a1;
          default: begin end
        endcase
      end
      12'hedb: begin
        out_r = 13'h0b80;
        case (key_hi)
          1'h1: out_r = 13'h0b81;
          default: begin end
        endcase
      end
      12'hedc: begin
        out_r = 13'h0516;
        case (key_hi)
          1'h1: out_r = 13'h09e7;
          default: begin end
        endcase
      end
      12'hedd: begin
        out_r = 13'h0919;
        case (key_hi)
          1'h1: out_r = 13'h0bae;
          default: begin end
        endcase
      end
      12'hede: begin
        out_r = 13'h0516;
        case (key_hi)
          1'h1: out_r = 13'h09e7;
          default: begin end
        endcase
      end
      12'hedf: begin
        out_r = 13'h067b;
        case (key_hi)
          1'h1: out_r = 13'h0ba0;
          default: begin end
        endcase
      end
      12'hee0: begin
        out_r = 13'h0ad7;
        case (key_hi)
          1'h1: out_r = 13'h06f7;
          default: begin end
        endcase
      end
      12'hee1: begin
        out_r = 13'h0bf1;
        case (key_hi)
          1'h1: out_r = 13'h0afa;
          default: begin end
        endcase
      end
      12'hee2: begin
        out_r = 13'h0951;
        case (key_hi)
          1'h1: out_r = 13'h092e;
          default: begin end
        endcase
      end
      12'hee3: begin
        out_r = 13'h0506;
        case (key_hi)
          1'h1: out_r = 13'h0b46;
          default: begin end
        endcase
      end
      12'hee4: begin
        out_r = 13'h0961;
        case (key_hi)
          1'h1: out_r = 13'h0ae7;
          default: begin end
        endcase
      end
      12'hee5: begin
        out_r = 13'h0945;
        case (key_hi)
          1'h1: out_r = 13'h0919;
          default: begin end
        endcase
      end
      12'hee6: begin
        out_r = 13'h0969;
        case (key_hi)
          1'h1: out_r = 13'h0901;
          default: begin end
        endcase
      end
      12'hee7: begin
        out_r = 13'h0b5e;
        case (key_hi)
          1'h1: out_r = 13'h0b59;
          default: begin end
        endcase
      end
      12'hee8: begin
        out_r = 13'h0949;
        case (key_hi)
          1'h1: out_r = 13'h0bd9;
          default: begin end
        endcase
      end
      12'hee9: begin
        out_r = 13'h0b24;
        case (key_hi)
          1'h1: out_r = 13'h0b38;
          default: begin end
        endcase
      end
      12'heea: begin
        out_r = 13'h094e;
        case (key_hi)
          1'h1: out_r = 13'h0b3e;
          default: begin end
        endcase
      end
      12'heeb: begin
        out_r = 13'h0726;
        case (key_hi)
          1'h1: out_r = 13'h0a06;
          default: begin end
        endcase
      end
      12'heec: begin
        out_r = 13'h094e;
        case (key_hi)
          1'h1: out_r = 13'h0516;
          default: begin end
        endcase
      end
      12'heed: begin
        out_r = 13'h0b66;
        case (key_hi)
          1'h1: out_r = 13'h0b51;
          default: begin end
        endcase
      end
      12'heee: begin
        out_r = 13'h09e1;
        case (key_hi)
          1'h1: out_r = 13'h0516;
          default: begin end
        endcase
      end
      12'heef: begin
        out_r = 13'h091e;
        case (key_hi)
          1'h1: out_r = 13'h0b5e;
          default: begin end
        endcase
      end
      12'hef0: begin
        out_r = 13'h09f5;
        case (key_hi)
          1'h1: out_r = 13'h0653;
          default: begin end
        endcase
      end
      12'hef1: begin
        out_r = 13'h055a;
        case (key_hi)
          1'h1: out_r = 13'h0b99;
          default: begin end
        endcase
      end
      12'hef2: begin
        out_r = 13'h098c;
        case (key_hi)
          1'h1: out_r = 13'h0b94;
          default: begin end
        endcase
      end
      12'hef3: begin
        out_r = 13'h0bba;
        case (key_hi)
          1'h1: out_r = 13'h0b9e;
          default: begin end
        endcase
      end
      12'hef4: begin
        out_r = 13'h09e7;
        case (key_hi)
          1'h1: out_r = 13'h0ba1;
          default: begin end
        endcase
      end
      12'hef5: begin
        out_r = 13'h0546;
        case (key_hi)
          1'h1: out_r = 13'h0bba;
          default: begin end
        endcase
      end
      12'hef6: begin
        out_r = 13'h09e1;
        case (key_hi)
          1'h1: out_r = 13'h0996;
          default: begin end
        endcase
      end
      12'hef7: begin
        out_r = 13'h07a7;
        case (key_hi)
          1'h1: out_r = 13'h0bb8;
          default: begin end
        endcase
      end
      12'hef8: begin
        out_r = 13'h09f5;
        case (key_hi)
          1'h1: out_r = 13'h0653;
          default: begin end
        endcase
      end
      12'hef9: begin
        out_r = 13'h0b9c;
        case (key_hi)
          1'h1: out_r = 13'h0b9e;
          default: begin end
        endcase
      end
      12'hefa: begin
        out_r = 13'h098c;
        case (key_hi)
          1'h1: out_r = 13'h09a1;
          default: begin end
        endcase
      end
      12'hefb: begin
        out_r = 13'h0bba;
        case (key_hi)
          1'h1: out_r = 13'h0b9e;
          default: begin end
        endcase
      end
      12'hefc: begin
        out_r = 13'h0ae7;
        case (key_hi)
          1'h1: out_r = 13'h064b;
          default: begin end
        endcase
      end
      12'hefd: begin
        out_r = 13'h09ee;
        case (key_hi)
          1'h1: out_r = 13'h0b8e;
          default: begin end
        endcase
      end
      12'hefe: begin
        out_r = 13'h0ae7;
        case (key_hi)
          1'h1: out_r = 13'h064b;
          default: begin end
        endcase
      end
      12'heff: begin
        out_r = 13'h0783;
        case (key_hi)
          1'h1: out_r = 13'h0b80;
          default: begin end
        endcase
      end
      12'hf00: begin
        out_r = 13'h0201;
        case (key_hi)
          1'h1: out_r = 13'h0203;
          default: begin end
        endcase
      end
      12'hf01: begin
        out_r = 13'h0206;
      end
      12'hf02: begin
        out_r = 13'h0209;
        case (key_hi)
          1'h1: out_r = 13'h020b;
          default: begin end
        endcase
      end
      12'hf03: begin
        out_r = 13'h020e;
      end
      12'hf04: begin
        out_r = 13'h0211;
        case (key_hi)
          1'h1: out_r = 13'h0213;
          default: begin end
        endcase
      end
      12'hf05: begin
        out_r = 13'h0219;
      end
      12'hf06: begin
        out_r = 13'h0216;
        case (key_hi)
          1'h1: out_r = 13'h0214;
          default: begin end
        endcase
      end
      12'hf07: begin
        out_r = 13'h0219;
      end
      12'hf08: begin
        out_r = 13'h0221;
        case (key_hi)
          1'h1: out_r = 13'h0223;
          default: begin end
        endcase
      end
      12'hf09: begin
        out_r = 13'h0226;
      end
      12'hf0a: begin
        out_r = 13'h0229;
        case (key_hi)
          1'h1: out_r = 13'h022b;
          default: begin end
        endcase
      end
      12'hf0b: begin
        out_r = 13'h022e;
      end
      12'hf0c: begin
        out_r = 13'h0235;
      end
      12'hf0d: begin
        out_r = 13'h023a;
      end
      12'hf0e: begin
        out_r = 13'h0235;
      end
      12'hf0f: begin
        out_r = 13'h023b;
        case (key_hi)
          1'h1: out_r = 13'h0238;
          default: begin end
        endcase
      end
      12'hf10: begin
        out_r = 13'h0241;
        case (key_hi)
          1'h1: out_r = 13'h0243;
          default: begin end
        endcase
      end
      12'hf11: begin
        out_r = 13'h0246;
      end
      12'hf12: begin
        out_r = 13'h0249;
        case (key_hi)
          1'h1: out_r = 13'h024b;
          default: begin end
        endcase
      end
      12'hf13: begin
        out_r = 13'h024e;
      end
      12'hf14: begin
        out_r = 13'h0261;
      end
      12'hf15: begin
        out_r = 13'h0267;
      end
      12'hf16: begin
        out_r = 13'h026e;
      end
      12'hf17: begin
        out_r = 13'h0266;
        case (key_hi)
          1'h1: out_r = 13'h0264;
          default: begin end
        endcase
      end
      12'hf18: begin
        out_r = 13'h0256;
        case (key_hi)
          1'h1: out_r = 13'h0254;
          default: begin end
        endcase
      end
      12'hf19: begin
        out_r = 13'h0259;
      end
      12'hf1a: begin
        out_r = 13'h0257;
      end
      12'hf1b: begin
        out_r = 13'h0250;
        case (key_hi)
          1'h1: out_r = 13'h0251;
          default: begin end
        endcase
      end
      12'hf1c: begin
        out_r = 13'h0269;
      end
      12'hf1d: begin
        out_r = 13'h0267;
      end
      12'hf1e: begin
        out_r = 13'h0269;
      end
      12'hf1f: begin
        out_r = 13'h0266;
        case (key_hi)
          1'h1: out_r = 13'h0264;
          default: begin end
        endcase
      end
      12'hf20: begin
        out_r = 13'h0281;
        case (key_hi)
          1'h1: out_r = 13'h0283;
          default: begin end
        endcase
      end
      12'hf21: begin
        out_r = 13'h0286;
      end
      12'hf22: begin
        out_r = 13'h0289;
        case (key_hi)
          1'h1: out_r = 13'h028b;
          default: begin end
        endcase
      end
      12'hf23: begin
        out_r = 13'h028e;
      end
      12'hf24: begin
        out_r = 13'h0291;
        case (key_hi)
          1'h1: out_r = 13'h0293;
          default: begin end
        endcase
      end
      12'hf25: begin
        out_r = 13'h0299;
      end
      12'hf26: begin
        out_r = 13'h0296;
        case (key_hi)
          1'h1: out_r = 13'h0294;
          default: begin end
        endcase
      end
      12'hf27: begin
        out_r = 13'h0299;
      end
      12'hf28: begin
        out_r = 13'h02a1;
        case (key_hi)
          1'h1: out_r = 13'h02a3;
          default: begin end
        endcase
      end
      12'hf29: begin
        out_r = 13'h02a6;
      end
      12'hf2a: begin
        out_r = 13'h02a9;
        case (key_hi)
          1'h1: out_r = 13'h02ab;
          default: begin end
        endcase
      end
      12'hf2b: begin
        out_r = 13'h02ae;
      end
      12'hf2c: begin
        out_r = 13'h02b5;
      end
      12'hf2d: begin
        out_r = 13'h02ba;
      end
      12'hf2e: begin
        out_r = 13'h02b5;
      end
      12'hf2f: begin
        out_r = 13'h02bb;
        case (key_hi)
          1'h1: out_r = 13'h02b8;
          default: begin end
        endcase
      end
      12'hf30: begin
        out_r = 13'h02d1;
      end
      12'hf31: begin
        out_r = 13'h02d6;
      end
      12'hf32: begin
        out_r = 13'h02d9;
      end
      12'hf33: begin
        out_r = 13'h02d4;
        case (key_hi)
          1'h1: out_r = 13'h02d7;
          default: begin end
        endcase
      end
      12'hf34: begin
        out_r = 13'h02e6;
      end
      12'hf35: begin
        out_r = 13'h02e9;
      end
      12'hf36: begin
        out_r = 13'h02e1;
        case (key_hi)
          1'h1: out_r = 13'h02e0;
          default: begin end
        endcase
      end
      12'hf37: begin
        out_r = 13'h02eb;
        case (key_hi)
          1'h1: out_r = 13'h02e8;
          default: begin end
        endcase
      end
      12'hf38: begin
        out_r = 13'h02d1;
      end
      12'hf39: begin
        out_r = 13'h02d6;
      end
      12'hf3a: begin
        out_r = 13'h02de;
      end
      12'hf3b: begin
        out_r = 13'h02d4;
        case (key_hi)
          1'h1: out_r = 13'h02d7;
          default: begin end
        endcase
      end
      12'hf3c: begin
        out_r = 13'h02e7;
      end
      12'hf3d: begin
        out_r = 13'h02ee;
      end
      12'hf3e: begin
        out_r = 13'h02e7;
      end
      12'hf3f: begin
        out_r = 13'h02e3;
        case (key_hi)
          1'h1: out_r = 13'h02e0;
          default: begin end
        endcase
      end
      12'hf40: begin
        out_r = 13'h030e;
      end
      12'hf41: begin
        out_r = 13'h0306;
      end
      12'hf42: begin
        out_r = 13'h0301;
      end
      12'hf43: begin
        out_r = 13'h0305;
      end
      12'hf44: begin
        out_r = 13'h0311;
        case (key_hi)
          1'h1: out_r = 13'h0313;
          default: begin end
        endcase
      end
      12'hf45: begin
        out_r = 13'h0319;
      end
      12'hf46: begin
        out_r = 13'h0316;
        case (key_hi)
          1'h1: out_r = 13'h0314;
          default: begin end
        endcase
      end
      12'hf47: begin
        out_r = 13'h0319;
      end
      12'hf48: begin
        out_r = 13'h032e;
      end
      12'hf49: begin
        out_r = 13'h0326;
      end
      12'hf4a: begin
        out_r = 13'h0321;
      end
      12'hf4b: begin
        out_r = 13'h0326;
      end
      12'hf4c: begin
        out_r = 13'h0311;
      end
      12'hf4d: begin
        out_r = 13'h0319;
      end
      12'hf4e: begin
        out_r = 13'h0310;
        case (key_hi)
          1'h1: out_r = 13'h0311;
          default: begin end
        endcase
      end
      12'hf4f: begin
        out_r = 13'h0319;
      end
      12'hf50: begin
        out_r = 13'h0381;
        case (key_hi)
          1'h1: out_r = 13'h0383;
          default: begin end
        endcase
      end
      12'hf51: begin
        out_r = 13'h0386;
      end
      12'hf52: begin
        out_r = 13'h0389;
        case (key_hi)
          1'h1: out_r = 13'h038b;
          default: begin end
        endcase
      end
      12'hf53: begin
        out_r = 13'h038e;
      end
      12'hf54: begin
        out_r = 13'h03a1;
        case (key_hi)
          1'h1: out_r = 13'h03a3;
          default: begin end
        endcase
      end
      12'hf55: begin
        out_r = 13'h03a6;
      end
      12'hf56: begin
        out_r = 13'h03ae;
      end
      12'hf57: begin
        out_r = 13'h03a6;
        case (key_hi)
          1'h1: out_r = 13'h03a4;
          default: begin end
        endcase
      end
      12'hf58: begin
        out_r = 13'h03b1;
      end
      12'hf59: begin
        out_r = 13'h03ba;
      end
      12'hf5a: begin
        out_r = 13'h03b5;
      end
      12'hf5b: begin
        out_r = 13'h03b8;
        case (key_hi)
          1'h1: out_r = 13'h03ba;
          default: begin end
        endcase
      end
      12'hf5c: begin
        out_r = 13'h03a9;
        case (key_hi)
          1'h1: out_r = 13'h03ab;
          default: begin end
        endcase
      end
      12'hf5d: begin
        out_r = 13'h03ae;
      end
      12'hf5e: begin
        out_r = 13'h03a9;
        case (key_hi)
          1'h1: out_r = 13'h03ab;
          default: begin end
        endcase
      end
      12'hf5f: begin
        out_r = 13'h03a3;
        case (key_hi)
          1'h1: out_r = 13'h03a0;
          default: begin end
        endcase
      end
      12'hf60: begin
        out_r = 13'h03ce;
      end
      12'hf61: begin
        out_r = 13'h03c6;
      end
      12'hf62: begin
        out_r = 13'h03c1;
      end
      12'hf63: begin
        out_r = 13'h03c7;
      end
      12'hf64: begin
        out_r = 13'h03e1;
        case (key_hi)
          1'h1: out_r = 13'h03e3;
          default: begin end
        endcase
      end
      12'hf65: begin
        out_r = 13'h03e9;
      end
      12'hf66: begin
        out_r = 13'h03e7;
      end
      12'hf67: begin
        out_r = 13'h03e9;
      end
      12'hf68: begin
        out_r = 13'h03d1;
      end
      12'hf69: begin
        out_r = 13'h03d6;
      end
      12'hf6a: begin
        out_r = 13'h03d9;
      end
      12'hf6b: begin
        out_r = 13'h03d4;
        case (key_hi)
          1'h1: out_r = 13'h03d7;
          default: begin end
        endcase
      end
      12'hf6c: begin
        out_r = 13'h03e6;
      end
      12'hf6d: begin
        out_r = 13'h03e1;
      end
      12'hf6e: begin
        out_r = 13'h03e6;
      end
      12'hf6f: begin
        out_r = 13'h03ee;
      end
      12'hf70: begin
        out_r = 13'h0391;
        case (key_hi)
          1'h1: out_r = 13'h0393;
          default: begin end
        endcase
      end
      12'hf71: begin
        out_r = 13'h0399;
      end
      12'hf72: begin
        out_r = 13'h0396;
        case (key_hi)
          1'h1: out_r = 13'h0394;
          default: begin end
        endcase
      end
      12'hf73: begin
        out_r = 13'h0399;
      end
      12'hf74: begin
        out_r = 13'h03b1;
      end
      12'hf75: begin
        out_r = 13'h03ba;
      end
      12'hf76: begin
        out_r = 13'h03be;
      end
      12'hf77: begin
        out_r = 13'h03bb;
        case (key_hi)
          1'h1: out_r = 13'h03b8;
          default: begin end
        endcase
      end
      12'hf78: begin
        out_r = 13'h0391;
        case (key_hi)
          1'h1: out_r = 13'h0393;
          default: begin end
        endcase
      end
      12'hf79: begin
        out_r = 13'h0399;
      end
      12'hf7a: begin
        out_r = 13'h0396;
      end
      12'hf7b: begin
        out_r = 13'h0399;
      end
      12'hf7c: begin
        out_r = 13'h0389;
        case (key_hi)
          1'h1: out_r = 13'h038b;
          default: begin end
        endcase
      end
      12'hf7d: begin
        out_r = 13'h038e;
      end
      12'hf7e: begin
        out_r = 13'h0389;
        case (key_hi)
          1'h1: out_r = 13'h038b;
          default: begin end
        endcase
      end
      12'hf7f: begin
        out_r = 13'h0383;
        case (key_hi)
          1'h1: out_r = 13'h0380;
          default: begin end
        endcase
      end
      12'hf80: begin
        out_r = 13'h0201;
        case (key_hi)
          1'h1: out_r = 13'h0203;
          default: begin end
        endcase
      end
      12'hf81: begin
        out_r = 13'h0206;
      end
      12'hf82: begin
        out_r = 13'h0209;
        case (key_hi)
          1'h1: out_r = 13'h020b;
          default: begin end
        endcase
      end
      12'hf83: begin
        out_r = 13'h020e;
      end
      12'hf84: begin
        out_r = 13'h0211;
        case (key_hi)
          1'h1: out_r = 13'h0213;
          default: begin end
        endcase
      end
      12'hf85: begin
        out_r = 13'h0219;
      end
      12'hf86: begin
        out_r = 13'h0216;
        case (key_hi)
          1'h1: out_r = 13'h0214;
          default: begin end
        endcase
      end
      12'hf87: begin
        out_r = 13'h0219;
      end
      12'hf88: begin
        out_r = 13'h0221;
        case (key_hi)
          1'h1: out_r = 13'h0223;
          default: begin end
        endcase
      end
      12'hf89: begin
        out_r = 13'h0226;
      end
      12'hf8a: begin
        out_r = 13'h0229;
        case (key_hi)
          1'h1: out_r = 13'h022b;
          default: begin end
        endcase
      end
      12'hf8b: begin
        out_r = 13'h022e;
      end
      12'hf8c: begin
        out_r = 13'h0235;
      end
      12'hf8d: begin
        out_r = 13'h023a;
      end
      12'hf8e: begin
        out_r = 13'h0235;
      end
      12'hf8f: begin
        out_r = 13'h023b;
        case (key_hi)
          1'h1: out_r = 13'h0238;
          default: begin end
        endcase
      end
      12'hf90: begin
        out_r = 13'h0241;
        case (key_hi)
          1'h1: out_r = 13'h0243;
          default: begin end
        endcase
      end
      12'hf91: begin
        out_r = 13'h0246;
      end
      12'hf92: begin
        out_r = 13'h0249;
        case (key_hi)
          1'h1: out_r = 13'h024b;
          default: begin end
        endcase
      end
      12'hf93: begin
        out_r = 13'h024e;
      end
      12'hf94: begin
        out_r = 13'h026e;
      end
      12'hf95: begin
        out_r = 13'h0266;
      end
      12'hf96: begin
        out_r = 13'h0261;
      end
      12'hf97: begin
        out_r = 13'h0266;
        case (key_hi)
          1'h1: out_r = 13'h0264;
          default: begin end
        endcase
      end
      12'hf98: begin
        out_r = 13'h0256;
      end
      12'hf99: begin
        out_r = 13'h025e;
      end
      12'hf9a: begin
        out_r = 13'h0251;
      end
      12'hf9b: begin
        out_r = 13'h025e;
      end
      12'hf9c: begin
        out_r = 13'h0269;
      end
      12'hf9d: begin
        out_r = 13'h0266;
      end
      12'hf9e: begin
        out_r = 13'h0269;
      end
      12'hf9f: begin
        out_r = 13'h0267;
        case (key_hi)
          1'h1: out_r = 13'h0264;
          default: begin end
        endcase
      end
      12'hfa0: begin
        out_r = 13'h0281;
        case (key_hi)
          1'h1: out_r = 13'h0283;
          default: begin end
        endcase
      end
      12'hfa1: begin
        out_r = 13'h0286;
      end
      12'hfa2: begin
        out_r = 13'h0289;
        case (key_hi)
          1'h1: out_r = 13'h028b;
          default: begin end
        endcase
      end
      12'hfa3: begin
        out_r = 13'h028e;
      end
      12'hfa4: begin
        out_r = 13'h0291;
        case (key_hi)
          1'h1: out_r = 13'h0293;
          default: begin end
        endcase
      end
      12'hfa5: begin
        out_r = 13'h029e;
      end
      12'hfa6: begin
        out_r = 13'h0297;
      end
      12'hfa7: begin
        out_r = 13'h029e;
      end
      12'hfa8: begin
        out_r = 13'h02be;
      end
      12'hfa9: begin
        out_r = 13'h02bb;
      end
      12'hfaa: begin
        out_r = 13'h02b1;
      end
      12'hfab: begin
        out_r = 13'h02ba;
      end
      12'hfac: begin
        out_r = 13'h0296;
      end
      12'hfad: begin
        out_r = 13'h0291;
      end
      12'hfae: begin
        out_r = 13'h0296;
      end
      12'hfaf: begin
        out_r = 13'h029e;
      end
      12'hfb0: begin
        out_r = 13'h02d1;
      end
      12'hfb1: begin
        out_r = 13'h02d6;
      end
      12'hfb2: begin
        out_r = 13'h02d9;
      end
      12'hfb3: begin
        out_r = 13'h02d4;
        case (key_hi)
          1'h1: out_r = 13'h02d7;
          default: begin end
        endcase
      end
      12'hfb4: begin
        out_r = 13'h02e6;
      end
      12'hfb5: begin
        out_r = 13'h02e9;
      end
      12'hfb6: begin
        out_r = 13'h02e1;
        case (key_hi)
          1'h1: out_r = 13'h02e0;
          default: begin end
        endcase
      end
      12'hfb7: begin
        out_r = 13'h02eb;
        case (key_hi)
          1'h1: out_r = 13'h02e8;
          default: begin end
        endcase
      end
      12'hfb8: begin
        out_r = 13'h02d1;
      end
      12'hfb9: begin
        out_r = 13'h02d6;
      end
      12'hfba: begin
        out_r = 13'h02de;
      end
      12'hfbb: begin
        out_r = 13'h02d4;
        case (key_hi)
          1'h1: out_r = 13'h02d7;
          default: begin end
        endcase
      end
      12'hfbc: begin
        out_r = 13'h02e7;
      end
      12'hfbd: begin
        out_r = 13'h02ee;
      end
      12'hfbe: begin
        out_r = 13'h02e7;
      end
      12'hfbf: begin
        out_r = 13'h02e3;
        case (key_hi)
          1'h1: out_r = 13'h02e0;
          default: begin end
        endcase
      end
      12'hfc0: begin
        out_r = 13'h0081;
        case (key_hi)
          1'h1: out_r = 13'h0083;
          default: begin end
        endcase
      end
      12'hfc1: begin
        out_r = 13'h0086;
      end
      12'hfc2: begin
        out_r = 13'h0089;
        case (key_hi)
          1'h1: out_r = 13'h008b;
          default: begin end
        endcase
      end
      12'hfc3: begin
        out_r = 13'h008e;
      end
      12'hfc4: begin
        out_r = 13'h0091;
        case (key_hi)
          1'h1: out_r = 13'h0093;
          default: begin end
        endcase
      end
      12'hfc5: begin
        out_r = 13'h0099;
      end
      12'hfc6: begin
        out_r = 13'h0096;
        case (key_hi)
          1'h1: out_r = 13'h0094;
          default: begin end
        endcase
      end
      12'hfc7: begin
        out_r = 13'h0099;
      end
      12'hfc8: begin
        out_r = 13'h00a1;
        case (key_hi)
          1'h1: out_r = 13'h00a3;
          default: begin end
        endcase
      end
      12'hfc9: begin
        out_r = 13'h00a6;
      end
      12'hfca: begin
        out_r = 13'h00a9;
        case (key_hi)
          1'h1: out_r = 13'h00ab;
          default: begin end
        endcase
      end
      12'hfcb: begin
        out_r = 13'h00ae;
      end
      12'hfcc: begin
        out_r = 13'h00b5;
      end
      12'hfcd: begin
        out_r = 13'h00ba;
      end
      12'hfce: begin
        out_r = 13'h00b5;
      end
      12'hfcf: begin
        out_r = 13'h00bb;
        case (key_hi)
          1'h1: out_r = 13'h00b8;
          default: begin end
        endcase
      end
      12'hfd0: begin
        out_r = 13'h00c1;
      end
      12'hfd1: begin
        out_r = 13'h00c6;
      end
      12'hfd2: begin
        out_r = 13'h00c9;
      end
      12'hfd3: begin
        out_r = 13'h00c6;
      end
      12'hfd4: begin
        out_r = 13'h00e1;
        case (key_hi)
          1'h1: out_r = 13'h00e3;
          default: begin end
        endcase
      end
      12'hfd5: begin
        out_r = 13'h00e9;
      end
      12'hfd6: begin
        out_r = 13'h00ee;
      end
      12'hfd7: begin
        out_r = 13'h00eb;
        case (key_hi)
          1'h1: out_r = 13'h00e8;
          default: begin end
        endcase
      end
      12'hfd8: begin
        out_r = 13'h00f1;
      end
      12'hfd9: begin
        out_r = 13'h00fa;
      end
      12'hfda: begin
        out_r = 13'h00f5;
      end
      12'hfdb: begin
        out_r = 13'h00f8;
        case (key_hi)
          1'h1: out_r = 13'h00fb;
          default: begin end
        endcase
      end
      12'hfdc: begin
        out_r = 13'h00e6;
      end
      12'hfdd: begin
        out_r = 13'h00ee;
      end
      12'hfde: begin
        out_r = 13'h00e6;
      end
      12'hfdf: begin
        out_r = 13'h00e3;
        case (key_hi)
          1'h1: out_r = 13'h00e0;
          default: begin end
        endcase
      end
      12'hfe0: begin
        out_r = 13'h0081;
        case (key_hi)
          1'h1: out_r = 13'h0083;
          default: begin end
        endcase
      end
      12'hfe1: begin
        out_r = 13'h0086;
      end
      12'hfe2: begin
        out_r = 13'h0089;
        case (key_hi)
          1'h1: out_r = 13'h008b;
          default: begin end
        endcase
      end
      12'hfe3: begin
        out_r = 13'h008e;
      end
      12'hfe4: begin
        out_r = 13'h0091;
        case (key_hi)
          1'h1: out_r = 13'h0093;
          default: begin end
        endcase
      end
      12'hfe5: begin
        out_r = 13'h0099;
      end
      12'hfe6: begin
        out_r = 13'h0097;
      end
      12'hfe7: begin
        out_r = 13'h0099;
      end
      12'hfe8: begin
        out_r = 13'h00a1;
        case (key_hi)
          1'h1: out_r = 13'h00a3;
          default: begin end
        endcase
      end
      12'hfe9: begin
        out_r = 13'h00a7;
      end
      12'hfea: begin
        out_r = 13'h00ae;
      end
      12'hfeb: begin
        out_r = 13'h00a4;
        case (key_hi)
          1'h1: out_r = 13'h00a7;
          default: begin end
        endcase
      end
      12'hfec: begin
        out_r = 13'h00b5;
      end
      12'hfed: begin
        out_r = 13'h00ba;
      end
      12'hfee: begin
        out_r = 13'h00b5;
      end
      12'hfef: begin
        out_r = 13'h00bb;
        case (key_hi)
          1'h1: out_r = 13'h00b8;
          default: begin end
        endcase
      end
      12'hff0: begin
        out_r = 13'h0021;
        case (key_hi)
          1'h1: out_r = 13'h0023;
          default: begin end
        endcase
      end
      12'hff1: begin
        out_r = 13'h0026;
      end
      12'hff2: begin
        out_r = 13'h0029;
        case (key_hi)
          1'h1: out_r = 13'h002b;
          default: begin end
        endcase
      end
      12'hff3: begin
        out_r = 13'h002e;
      end
      12'hff4: begin
        out_r = 13'h0031;
      end
      12'hff5: begin
        out_r = 13'h003a;
      end
      12'hff6: begin
        out_r = 13'h003e;
      end
      12'hff7: begin
        out_r = 13'h003b;
        case (key_hi)
          1'h1: out_r = 13'h0038;
          default: begin end
        endcase
      end
      12'hff8: begin
        out_r = 13'h0021;
        case (key_hi)
          1'h1: out_r = 13'h0023;
          default: begin end
        endcase
      end
      12'hff9: begin
        out_r = 13'h0026;
      end
      12'hffa: begin
        out_r = 13'h0029;
      end
      12'hffb: begin
        out_r = 13'h002e;
      end
      12'hffc: begin
        out_r = 13'h0009;
        case (key_hi)
          1'h1: out_r = 13'h000b;
          default: begin end
        endcase
      end
      12'hffd: begin
        out_r = 13'h000e;
      end
      12'hffe: begin
        out_r = 13'h0009;
        case (key_hi)
          1'h1: out_r = 13'h000b;
          default: begin end
        endcase
      end
      12'hfff: begin
        out_r = 13'h0003;
        case (key_hi)
          1'h1: out_r = 13'h0000;
          default: begin end
        endcase
      end
      default: begin end
    endcase
  end
  assign out = out_r;
endmodule
