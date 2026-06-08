module ex239_open_low8_hi6(in, out);
  input [15:0] in;
  output [15:0] out;
  wire sign = in[15];
  wire [4:0] exp = in[14:10];
  wire [5:0] sign_exp = in[15:10];
  wire [9:0] mant = in[9:0];
  wire active = (exp >= 5'd1) && (exp <= 5'd30);
  reg [15:0] special_out;
  always @* begin
    special_out = 16'h0000;
    case (sign_exp)
      6'h00: special_out = 16'h7c00;
      6'h1f: begin
        case (mant)
          10'h000: special_out = 16'h0000;
          10'h001: special_out = 16'h7e00;
          10'h002: special_out = 16'h7e00;
          10'h003: special_out = 16'h7e00;
          10'h004: special_out = 16'h7e00;
          10'h005: special_out = 16'h7e00;
          10'h006: special_out = 16'h7e00;
          10'h007: special_out = 16'h7e00;
          10'h008: special_out = 16'h7e00;
          10'h009: special_out = 16'h7e00;
          10'h00a: special_out = 16'h7e00;
          10'h00b: special_out = 16'h7e00;
          10'h00c: special_out = 16'h7e00;
          10'h00d: special_out = 16'h7e00;
          10'h00e: special_out = 16'h7e00;
          10'h00f: special_out = 16'h7e00;
          10'h010: special_out = 16'h7e00;
          10'h011: special_out = 16'h7e00;
          10'h012: special_out = 16'h7e00;
          10'h013: special_out = 16'h7e00;
          10'h014: special_out = 16'h7e00;
          10'h015: special_out = 16'h7e00;
          10'h016: special_out = 16'h7e00;
          10'h017: special_out = 16'h7e00;
          10'h018: special_out = 16'h7e00;
          10'h019: special_out = 16'h7e00;
          10'h01a: special_out = 16'h7e00;
          10'h01b: special_out = 16'h7e00;
          10'h01c: special_out = 16'h7e00;
          10'h01d: special_out = 16'h7e00;
          10'h01e: special_out = 16'h7e00;
          10'h01f: special_out = 16'h7e00;
          10'h020: special_out = 16'h7e00;
          10'h021: special_out = 16'h7e00;
          10'h022: special_out = 16'h7e00;
          10'h023: special_out = 16'h7e00;
          10'h024: special_out = 16'h7e00;
          10'h025: special_out = 16'h7e00;
          10'h026: special_out = 16'h7e00;
          10'h027: special_out = 16'h7e00;
          10'h028: special_out = 16'h7e00;
          10'h029: special_out = 16'h7e00;
          10'h02a: special_out = 16'h7e00;
          10'h02b: special_out = 16'h7e00;
          10'h02c: special_out = 16'h7e00;
          10'h02d: special_out = 16'h7e00;
          10'h02e: special_out = 16'h7e00;
          10'h02f: special_out = 16'h7e00;
          10'h030: special_out = 16'h7e00;
          10'h031: special_out = 16'h7e00;
          10'h032: special_out = 16'h7e00;
          10'h033: special_out = 16'h7e00;
          10'h034: special_out = 16'h7e00;
          10'h035: special_out = 16'h7e00;
          10'h036: special_out = 16'h7e00;
          10'h037: special_out = 16'h7e00;
          10'h038: special_out = 16'h7e00;
          10'h039: special_out = 16'h7e00;
          10'h03a: special_out = 16'h7e00;
          10'h03b: special_out = 16'h7e00;
          10'h03c: special_out = 16'h7e00;
          10'h03d: special_out = 16'h7e00;
          10'h03e: special_out = 16'h7e00;
          10'h03f: special_out = 16'h7e00;
          10'h040: special_out = 16'h7e00;
          10'h041: special_out = 16'h7e00;
          10'h042: special_out = 16'h7e00;
          10'h043: special_out = 16'h7e00;
          10'h044: special_out = 16'h7e00;
          10'h045: special_out = 16'h7e00;
          10'h046: special_out = 16'h7e00;
          10'h047: special_out = 16'h7e00;
          10'h048: special_out = 16'h7e00;
          10'h049: special_out = 16'h7e00;
          10'h04a: special_out = 16'h7e00;
          10'h04b: special_out = 16'h7e00;
          10'h04c: special_out = 16'h7e00;
          10'h04d: special_out = 16'h7e00;
          10'h04e: special_out = 16'h7e00;
          10'h04f: special_out = 16'h7e00;
          10'h050: special_out = 16'h7e00;
          10'h051: special_out = 16'h7e00;
          10'h052: special_out = 16'h7e00;
          10'h053: special_out = 16'h7e00;
          10'h054: special_out = 16'h7e00;
          10'h055: special_out = 16'h7e00;
          10'h056: special_out = 16'h7e00;
          10'h057: special_out = 16'h7e00;
          10'h058: special_out = 16'h7e00;
          10'h059: special_out = 16'h7e00;
          10'h05a: special_out = 16'h7e00;
          10'h05b: special_out = 16'h7e00;
          10'h05c: special_out = 16'h7e00;
          10'h05d: special_out = 16'h7e00;
          10'h05e: special_out = 16'h7e00;
          10'h05f: special_out = 16'h7e00;
          10'h060: special_out = 16'h7e00;
          10'h061: special_out = 16'h7e00;
          10'h062: special_out = 16'h7e00;
          10'h063: special_out = 16'h7e00;
          10'h064: special_out = 16'h7e00;
          10'h065: special_out = 16'h7e00;
          10'h066: special_out = 16'h7e00;
          10'h067: special_out = 16'h7e00;
          10'h068: special_out = 16'h7e00;
          10'h069: special_out = 16'h7e00;
          10'h06a: special_out = 16'h7e00;
          10'h06b: special_out = 16'h7e00;
          10'h06c: special_out = 16'h7e00;
          10'h06d: special_out = 16'h7e00;
          10'h06e: special_out = 16'h7e00;
          10'h06f: special_out = 16'h7e00;
          10'h070: special_out = 16'h7e00;
          10'h071: special_out = 16'h7e00;
          10'h072: special_out = 16'h7e00;
          10'h073: special_out = 16'h7e00;
          10'h074: special_out = 16'h7e00;
          10'h075: special_out = 16'h7e00;
          10'h076: special_out = 16'h7e00;
          10'h077: special_out = 16'h7e00;
          10'h078: special_out = 16'h7e00;
          10'h079: special_out = 16'h7e00;
          10'h07a: special_out = 16'h7e00;
          10'h07b: special_out = 16'h7e00;
          10'h07c: special_out = 16'h7e00;
          10'h07d: special_out = 16'h7e00;
          10'h07e: special_out = 16'h7e00;
          10'h07f: special_out = 16'h7e00;
          10'h080: special_out = 16'h7e00;
          10'h081: special_out = 16'h7e00;
          10'h082: special_out = 16'h7e00;
          10'h083: special_out = 16'h7e00;
          10'h084: special_out = 16'h7e00;
          10'h085: special_out = 16'h7e00;
          10'h086: special_out = 16'h7e00;
          10'h087: special_out = 16'h7e00;
          10'h088: special_out = 16'h7e00;
          10'h089: special_out = 16'h7e00;
          10'h08a: special_out = 16'h7e00;
          10'h08b: special_out = 16'h7e00;
          10'h08c: special_out = 16'h7e00;
          10'h08d: special_out = 16'h7e00;
          10'h08e: special_out = 16'h7e00;
          10'h08f: special_out = 16'h7e00;
          10'h090: special_out = 16'h7e00;
          10'h091: special_out = 16'h7e00;
          10'h092: special_out = 16'h7e00;
          10'h093: special_out = 16'h7e00;
          10'h094: special_out = 16'h7e00;
          10'h095: special_out = 16'h7e00;
          10'h096: special_out = 16'h7e00;
          10'h097: special_out = 16'h7e00;
          10'h098: special_out = 16'h7e00;
          10'h099: special_out = 16'h7e00;
          10'h09a: special_out = 16'h7e00;
          10'h09b: special_out = 16'h7e00;
          10'h09c: special_out = 16'h7e00;
          10'h09d: special_out = 16'h7e00;
          10'h09e: special_out = 16'h7e00;
          10'h09f: special_out = 16'h7e00;
          10'h0a0: special_out = 16'h7e00;
          10'h0a1: special_out = 16'h7e00;
          10'h0a2: special_out = 16'h7e00;
          10'h0a3: special_out = 16'h7e00;
          10'h0a4: special_out = 16'h7e00;
          10'h0a5: special_out = 16'h7e00;
          10'h0a6: special_out = 16'h7e00;
          10'h0a7: special_out = 16'h7e00;
          10'h0a8: special_out = 16'h7e00;
          10'h0a9: special_out = 16'h7e00;
          10'h0aa: special_out = 16'h7e00;
          10'h0ab: special_out = 16'h7e00;
          10'h0ac: special_out = 16'h7e00;
          10'h0ad: special_out = 16'h7e00;
          10'h0ae: special_out = 16'h7e00;
          10'h0af: special_out = 16'h7e00;
          10'h0b0: special_out = 16'h7e00;
          10'h0b1: special_out = 16'h7e00;
          10'h0b2: special_out = 16'h7e00;
          10'h0b3: special_out = 16'h7e00;
          10'h0b4: special_out = 16'h7e00;
          10'h0b5: special_out = 16'h7e00;
          10'h0b6: special_out = 16'h7e00;
          10'h0b7: special_out = 16'h7e00;
          10'h0b8: special_out = 16'h7e00;
          10'h0b9: special_out = 16'h7e00;
          10'h0ba: special_out = 16'h7e00;
          10'h0bb: special_out = 16'h7e00;
          10'h0bc: special_out = 16'h7e00;
          10'h0bd: special_out = 16'h7e00;
          10'h0be: special_out = 16'h7e00;
          10'h0bf: special_out = 16'h7e00;
          10'h0c0: special_out = 16'h7e00;
          10'h0c1: special_out = 16'h7e00;
          10'h0c2: special_out = 16'h7e00;
          10'h0c3: special_out = 16'h7e00;
          10'h0c4: special_out = 16'h7e00;
          10'h0c5: special_out = 16'h7e00;
          10'h0c6: special_out = 16'h7e00;
          10'h0c7: special_out = 16'h7e00;
          10'h0c8: special_out = 16'h7e00;
          10'h0c9: special_out = 16'h7e00;
          10'h0ca: special_out = 16'h7e00;
          10'h0cb: special_out = 16'h7e00;
          10'h0cc: special_out = 16'h7e00;
          10'h0cd: special_out = 16'h7e00;
          10'h0ce: special_out = 16'h7e00;
          10'h0cf: special_out = 16'h7e00;
          10'h0d0: special_out = 16'h7e00;
          10'h0d1: special_out = 16'h7e00;
          10'h0d2: special_out = 16'h7e00;
          10'h0d3: special_out = 16'h7e00;
          10'h0d4: special_out = 16'h7e00;
          10'h0d5: special_out = 16'h7e00;
          10'h0d6: special_out = 16'h7e00;
          10'h0d7: special_out = 16'h7e00;
          10'h0d8: special_out = 16'h7e00;
          10'h0d9: special_out = 16'h7e00;
          10'h0da: special_out = 16'h7e00;
          10'h0db: special_out = 16'h7e00;
          10'h0dc: special_out = 16'h7e00;
          10'h0dd: special_out = 16'h7e00;
          10'h0de: special_out = 16'h7e00;
          10'h0df: special_out = 16'h7e00;
          10'h0e0: special_out = 16'h7e00;
          10'h0e1: special_out = 16'h7e00;
          10'h0e2: special_out = 16'h7e00;
          10'h0e3: special_out = 16'h7e00;
          10'h0e4: special_out = 16'h7e00;
          10'h0e5: special_out = 16'h7e00;
          10'h0e6: special_out = 16'h7e00;
          10'h0e7: special_out = 16'h7e00;
          10'h0e8: special_out = 16'h7e00;
          10'h0e9: special_out = 16'h7e00;
          10'h0ea: special_out = 16'h7e00;
          10'h0eb: special_out = 16'h7e00;
          10'h0ec: special_out = 16'h7e00;
          10'h0ed: special_out = 16'h7e00;
          10'h0ee: special_out = 16'h7e00;
          10'h0ef: special_out = 16'h7e00;
          10'h0f0: special_out = 16'h7e00;
          10'h0f1: special_out = 16'h7e00;
          10'h0f2: special_out = 16'h7e00;
          10'h0f3: special_out = 16'h7e00;
          10'h0f4: special_out = 16'h7e00;
          10'h0f5: special_out = 16'h7e00;
          10'h0f6: special_out = 16'h7e00;
          10'h0f7: special_out = 16'h7e00;
          10'h0f8: special_out = 16'h7e00;
          10'h0f9: special_out = 16'h7e00;
          10'h0fa: special_out = 16'h7e00;
          10'h0fb: special_out = 16'h7e00;
          10'h0fc: special_out = 16'h7e00;
          10'h0fd: special_out = 16'h7e00;
          10'h0fe: special_out = 16'h7e00;
          10'h0ff: special_out = 16'h7e00;
          10'h100: special_out = 16'h7e00;
          10'h101: special_out = 16'h7e00;
          10'h102: special_out = 16'h7e00;
          10'h103: special_out = 16'h7e00;
          10'h104: special_out = 16'h7e00;
          10'h105: special_out = 16'h7e00;
          10'h106: special_out = 16'h7e00;
          10'h107: special_out = 16'h7e00;
          10'h108: special_out = 16'h7e00;
          10'h109: special_out = 16'h7e00;
          10'h10a: special_out = 16'h7e00;
          10'h10b: special_out = 16'h7e00;
          10'h10c: special_out = 16'h7e00;
          10'h10d: special_out = 16'h7e00;
          10'h10e: special_out = 16'h7e00;
          10'h10f: special_out = 16'h7e00;
          10'h110: special_out = 16'h7e00;
          10'h111: special_out = 16'h7e00;
          10'h112: special_out = 16'h7e00;
          10'h113: special_out = 16'h7e00;
          10'h114: special_out = 16'h7e00;
          10'h115: special_out = 16'h7e00;
          10'h116: special_out = 16'h7e00;
          10'h117: special_out = 16'h7e00;
          10'h118: special_out = 16'h7e00;
          10'h119: special_out = 16'h7e00;
          10'h11a: special_out = 16'h7e00;
          10'h11b: special_out = 16'h7e00;
          10'h11c: special_out = 16'h7e00;
          10'h11d: special_out = 16'h7e00;
          10'h11e: special_out = 16'h7e00;
          10'h11f: special_out = 16'h7e00;
          10'h120: special_out = 16'h7e00;
          10'h121: special_out = 16'h7e00;
          10'h122: special_out = 16'h7e00;
          10'h123: special_out = 16'h7e00;
          10'h124: special_out = 16'h7e00;
          10'h125: special_out = 16'h7e00;
          10'h126: special_out = 16'h7e00;
          10'h127: special_out = 16'h7e00;
          10'h128: special_out = 16'h7e00;
          10'h129: special_out = 16'h7e00;
          10'h12a: special_out = 16'h7e00;
          10'h12b: special_out = 16'h7e00;
          10'h12c: special_out = 16'h7e00;
          10'h12d: special_out = 16'h7e00;
          10'h12e: special_out = 16'h7e00;
          10'h12f: special_out = 16'h7e00;
          10'h130: special_out = 16'h7e00;
          10'h131: special_out = 16'h7e00;
          10'h132: special_out = 16'h7e00;
          10'h133: special_out = 16'h7e00;
          10'h134: special_out = 16'h7e00;
          10'h135: special_out = 16'h7e00;
          10'h136: special_out = 16'h7e00;
          10'h137: special_out = 16'h7e00;
          10'h138: special_out = 16'h7e00;
          10'h139: special_out = 16'h7e00;
          10'h13a: special_out = 16'h7e00;
          10'h13b: special_out = 16'h7e00;
          10'h13c: special_out = 16'h7e00;
          10'h13d: special_out = 16'h7e00;
          10'h13e: special_out = 16'h7e00;
          10'h13f: special_out = 16'h7e00;
          10'h140: special_out = 16'h7e00;
          10'h141: special_out = 16'h7e00;
          10'h142: special_out = 16'h7e00;
          10'h143: special_out = 16'h7e00;
          10'h144: special_out = 16'h7e00;
          10'h145: special_out = 16'h7e00;
          10'h146: special_out = 16'h7e00;
          10'h147: special_out = 16'h7e00;
          10'h148: special_out = 16'h7e00;
          10'h149: special_out = 16'h7e00;
          10'h14a: special_out = 16'h7e00;
          10'h14b: special_out = 16'h7e00;
          10'h14c: special_out = 16'h7e00;
          10'h14d: special_out = 16'h7e00;
          10'h14e: special_out = 16'h7e00;
          10'h14f: special_out = 16'h7e00;
          10'h150: special_out = 16'h7e00;
          10'h151: special_out = 16'h7e00;
          10'h152: special_out = 16'h7e00;
          10'h153: special_out = 16'h7e00;
          10'h154: special_out = 16'h7e00;
          10'h155: special_out = 16'h7e00;
          10'h156: special_out = 16'h7e00;
          10'h157: special_out = 16'h7e00;
          10'h158: special_out = 16'h7e00;
          10'h159: special_out = 16'h7e00;
          10'h15a: special_out = 16'h7e00;
          10'h15b: special_out = 16'h7e00;
          10'h15c: special_out = 16'h7e00;
          10'h15d: special_out = 16'h7e00;
          10'h15e: special_out = 16'h7e00;
          10'h15f: special_out = 16'h7e00;
          10'h160: special_out = 16'h7e00;
          10'h161: special_out = 16'h7e00;
          10'h162: special_out = 16'h7e00;
          10'h163: special_out = 16'h7e00;
          10'h164: special_out = 16'h7e00;
          10'h165: special_out = 16'h7e00;
          10'h166: special_out = 16'h7e00;
          10'h167: special_out = 16'h7e00;
          10'h168: special_out = 16'h7e00;
          10'h169: special_out = 16'h7e00;
          10'h16a: special_out = 16'h7e00;
          10'h16b: special_out = 16'h7e00;
          10'h16c: special_out = 16'h7e00;
          10'h16d: special_out = 16'h7e00;
          10'h16e: special_out = 16'h7e00;
          10'h16f: special_out = 16'h7e00;
          10'h170: special_out = 16'h7e00;
          10'h171: special_out = 16'h7e00;
          10'h172: special_out = 16'h7e00;
          10'h173: special_out = 16'h7e00;
          10'h174: special_out = 16'h7e00;
          10'h175: special_out = 16'h7e00;
          10'h176: special_out = 16'h7e00;
          10'h177: special_out = 16'h7e00;
          10'h178: special_out = 16'h7e00;
          10'h179: special_out = 16'h7e00;
          10'h17a: special_out = 16'h7e00;
          10'h17b: special_out = 16'h7e00;
          10'h17c: special_out = 16'h7e00;
          10'h17d: special_out = 16'h7e00;
          10'h17e: special_out = 16'h7e00;
          10'h17f: special_out = 16'h7e00;
          10'h180: special_out = 16'h7e00;
          10'h181: special_out = 16'h7e00;
          10'h182: special_out = 16'h7e00;
          10'h183: special_out = 16'h7e00;
          10'h184: special_out = 16'h7e00;
          10'h185: special_out = 16'h7e00;
          10'h186: special_out = 16'h7e00;
          10'h187: special_out = 16'h7e00;
          10'h188: special_out = 16'h7e00;
          10'h189: special_out = 16'h7e00;
          10'h18a: special_out = 16'h7e00;
          10'h18b: special_out = 16'h7e00;
          10'h18c: special_out = 16'h7e00;
          10'h18d: special_out = 16'h7e00;
          10'h18e: special_out = 16'h7e00;
          10'h18f: special_out = 16'h7e00;
          10'h190: special_out = 16'h7e00;
          10'h191: special_out = 16'h7e00;
          10'h192: special_out = 16'h7e00;
          10'h193: special_out = 16'h7e00;
          10'h194: special_out = 16'h7e00;
          10'h195: special_out = 16'h7e00;
          10'h196: special_out = 16'h7e00;
          10'h197: special_out = 16'h7e00;
          10'h198: special_out = 16'h7e00;
          10'h199: special_out = 16'h7e00;
          10'h19a: special_out = 16'h7e00;
          10'h19b: special_out = 16'h7e00;
          10'h19c: special_out = 16'h7e00;
          10'h19d: special_out = 16'h7e00;
          10'h19e: special_out = 16'h7e00;
          10'h19f: special_out = 16'h7e00;
          10'h1a0: special_out = 16'h7e00;
          10'h1a1: special_out = 16'h7e00;
          10'h1a2: special_out = 16'h7e00;
          10'h1a3: special_out = 16'h7e00;
          10'h1a4: special_out = 16'h7e00;
          10'h1a5: special_out = 16'h7e00;
          10'h1a6: special_out = 16'h7e00;
          10'h1a7: special_out = 16'h7e00;
          10'h1a8: special_out = 16'h7e00;
          10'h1a9: special_out = 16'h7e00;
          10'h1aa: special_out = 16'h7e00;
          10'h1ab: special_out = 16'h7e00;
          10'h1ac: special_out = 16'h7e00;
          10'h1ad: special_out = 16'h7e00;
          10'h1ae: special_out = 16'h7e00;
          10'h1af: special_out = 16'h7e00;
          10'h1b0: special_out = 16'h7e00;
          10'h1b1: special_out = 16'h7e00;
          10'h1b2: special_out = 16'h7e00;
          10'h1b3: special_out = 16'h7e00;
          10'h1b4: special_out = 16'h7e00;
          10'h1b5: special_out = 16'h7e00;
          10'h1b6: special_out = 16'h7e00;
          10'h1b7: special_out = 16'h7e00;
          10'h1b8: special_out = 16'h7e00;
          10'h1b9: special_out = 16'h7e00;
          10'h1ba: special_out = 16'h7e00;
          10'h1bb: special_out = 16'h7e00;
          10'h1bc: special_out = 16'h7e00;
          10'h1bd: special_out = 16'h7e00;
          10'h1be: special_out = 16'h7e00;
          10'h1bf: special_out = 16'h7e00;
          10'h1c0: special_out = 16'h7e00;
          10'h1c1: special_out = 16'h7e00;
          10'h1c2: special_out = 16'h7e00;
          10'h1c3: special_out = 16'h7e00;
          10'h1c4: special_out = 16'h7e00;
          10'h1c5: special_out = 16'h7e00;
          10'h1c6: special_out = 16'h7e00;
          10'h1c7: special_out = 16'h7e00;
          10'h1c8: special_out = 16'h7e00;
          10'h1c9: special_out = 16'h7e00;
          10'h1ca: special_out = 16'h7e00;
          10'h1cb: special_out = 16'h7e00;
          10'h1cc: special_out = 16'h7e00;
          10'h1cd: special_out = 16'h7e00;
          10'h1ce: special_out = 16'h7e00;
          10'h1cf: special_out = 16'h7e00;
          10'h1d0: special_out = 16'h7e00;
          10'h1d1: special_out = 16'h7e00;
          10'h1d2: special_out = 16'h7e00;
          10'h1d3: special_out = 16'h7e00;
          10'h1d4: special_out = 16'h7e00;
          10'h1d5: special_out = 16'h7e00;
          10'h1d6: special_out = 16'h7e00;
          10'h1d7: special_out = 16'h7e00;
          10'h1d8: special_out = 16'h7e00;
          10'h1d9: special_out = 16'h7e00;
          10'h1da: special_out = 16'h7e00;
          10'h1db: special_out = 16'h7e00;
          10'h1dc: special_out = 16'h7e00;
          10'h1dd: special_out = 16'h7e00;
          10'h1de: special_out = 16'h7e00;
          10'h1df: special_out = 16'h7e00;
          10'h1e0: special_out = 16'h7e00;
          10'h1e1: special_out = 16'h7e00;
          10'h1e2: special_out = 16'h7e00;
          10'h1e3: special_out = 16'h7e00;
          10'h1e4: special_out = 16'h7e00;
          10'h1e5: special_out = 16'h7e00;
          10'h1e6: special_out = 16'h7e00;
          10'h1e7: special_out = 16'h7e00;
          10'h1e8: special_out = 16'h7e00;
          10'h1e9: special_out = 16'h7e00;
          10'h1ea: special_out = 16'h7e00;
          10'h1eb: special_out = 16'h7e00;
          10'h1ec: special_out = 16'h7e00;
          10'h1ed: special_out = 16'h7e00;
          10'h1ee: special_out = 16'h7e00;
          10'h1ef: special_out = 16'h7e00;
          10'h1f0: special_out = 16'h7e00;
          10'h1f1: special_out = 16'h7e00;
          10'h1f2: special_out = 16'h7e00;
          10'h1f3: special_out = 16'h7e00;
          10'h1f4: special_out = 16'h7e00;
          10'h1f5: special_out = 16'h7e00;
          10'h1f6: special_out = 16'h7e00;
          10'h1f7: special_out = 16'h7e00;
          10'h1f8: special_out = 16'h7e00;
          10'h1f9: special_out = 16'h7e00;
          10'h1fa: special_out = 16'h7e00;
          10'h1fb: special_out = 16'h7e00;
          10'h1fc: special_out = 16'h7e00;
          10'h1fd: special_out = 16'h7e00;
          10'h1fe: special_out = 16'h7e00;
          10'h1ff: special_out = 16'h7e00;
          10'h200: special_out = 16'h7e00;
          10'h201: special_out = 16'h7e00;
          10'h202: special_out = 16'h7e00;
          10'h203: special_out = 16'h7e00;
          10'h204: special_out = 16'h7e00;
          10'h205: special_out = 16'h7e00;
          10'h206: special_out = 16'h7e00;
          10'h207: special_out = 16'h7e00;
          10'h208: special_out = 16'h7e00;
          10'h209: special_out = 16'h7e00;
          10'h20a: special_out = 16'h7e00;
          10'h20b: special_out = 16'h7e00;
          10'h20c: special_out = 16'h7e00;
          10'h20d: special_out = 16'h7e00;
          10'h20e: special_out = 16'h7e00;
          10'h20f: special_out = 16'h7e00;
          10'h210: special_out = 16'h7e00;
          10'h211: special_out = 16'h7e00;
          10'h212: special_out = 16'h7e00;
          10'h213: special_out = 16'h7e00;
          10'h214: special_out = 16'h7e00;
          10'h215: special_out = 16'h7e00;
          10'h216: special_out = 16'h7e00;
          10'h217: special_out = 16'h7e00;
          10'h218: special_out = 16'h7e00;
          10'h219: special_out = 16'h7e00;
          10'h21a: special_out = 16'h7e00;
          10'h21b: special_out = 16'h7e00;
          10'h21c: special_out = 16'h7e00;
          10'h21d: special_out = 16'h7e00;
          10'h21e: special_out = 16'h7e00;
          10'h21f: special_out = 16'h7e00;
          10'h220: special_out = 16'h7e00;
          10'h221: special_out = 16'h7e00;
          10'h222: special_out = 16'h7e00;
          10'h223: special_out = 16'h7e00;
          10'h224: special_out = 16'h7e00;
          10'h225: special_out = 16'h7e00;
          10'h226: special_out = 16'h7e00;
          10'h227: special_out = 16'h7e00;
          10'h228: special_out = 16'h7e00;
          10'h229: special_out = 16'h7e00;
          10'h22a: special_out = 16'h7e00;
          10'h22b: special_out = 16'h7e00;
          10'h22c: special_out = 16'h7e00;
          10'h22d: special_out = 16'h7e00;
          10'h22e: special_out = 16'h7e00;
          10'h22f: special_out = 16'h7e00;
          10'h230: special_out = 16'h7e00;
          10'h231: special_out = 16'h7e00;
          10'h232: special_out = 16'h7e00;
          10'h233: special_out = 16'h7e00;
          10'h234: special_out = 16'h7e00;
          10'h235: special_out = 16'h7e00;
          10'h236: special_out = 16'h7e00;
          10'h237: special_out = 16'h7e00;
          10'h238: special_out = 16'h7e00;
          10'h239: special_out = 16'h7e00;
          10'h23a: special_out = 16'h7e00;
          10'h23b: special_out = 16'h7e00;
          10'h23c: special_out = 16'h7e00;
          10'h23d: special_out = 16'h7e00;
          10'h23e: special_out = 16'h7e00;
          10'h23f: special_out = 16'h7e00;
          10'h240: special_out = 16'h7e00;
          10'h241: special_out = 16'h7e00;
          10'h242: special_out = 16'h7e00;
          10'h243: special_out = 16'h7e00;
          10'h244: special_out = 16'h7e00;
          10'h245: special_out = 16'h7e00;
          10'h246: special_out = 16'h7e00;
          10'h247: special_out = 16'h7e00;
          10'h248: special_out = 16'h7e00;
          10'h249: special_out = 16'h7e00;
          10'h24a: special_out = 16'h7e00;
          10'h24b: special_out = 16'h7e00;
          10'h24c: special_out = 16'h7e00;
          10'h24d: special_out = 16'h7e00;
          10'h24e: special_out = 16'h7e00;
          10'h24f: special_out = 16'h7e00;
          10'h250: special_out = 16'h7e00;
          10'h251: special_out = 16'h7e00;
          10'h252: special_out = 16'h7e00;
          10'h253: special_out = 16'h7e00;
          10'h254: special_out = 16'h7e00;
          10'h255: special_out = 16'h7e00;
          10'h256: special_out = 16'h7e00;
          10'h257: special_out = 16'h7e00;
          10'h258: special_out = 16'h7e00;
          10'h259: special_out = 16'h7e00;
          10'h25a: special_out = 16'h7e00;
          10'h25b: special_out = 16'h7e00;
          10'h25c: special_out = 16'h7e00;
          10'h25d: special_out = 16'h7e00;
          10'h25e: special_out = 16'h7e00;
          10'h25f: special_out = 16'h7e00;
          10'h260: special_out = 16'h7e00;
          10'h261: special_out = 16'h7e00;
          10'h262: special_out = 16'h7e00;
          10'h263: special_out = 16'h7e00;
          10'h264: special_out = 16'h7e00;
          10'h265: special_out = 16'h7e00;
          10'h266: special_out = 16'h7e00;
          10'h267: special_out = 16'h7e00;
          10'h268: special_out = 16'h7e00;
          10'h269: special_out = 16'h7e00;
          10'h26a: special_out = 16'h7e00;
          10'h26b: special_out = 16'h7e00;
          10'h26c: special_out = 16'h7e00;
          10'h26d: special_out = 16'h7e00;
          10'h26e: special_out = 16'h7e00;
          10'h26f: special_out = 16'h7e00;
          10'h270: special_out = 16'h7e00;
          10'h271: special_out = 16'h7e00;
          10'h272: special_out = 16'h7e00;
          10'h273: special_out = 16'h7e00;
          10'h274: special_out = 16'h7e00;
          10'h275: special_out = 16'h7e00;
          10'h276: special_out = 16'h7e00;
          10'h277: special_out = 16'h7e00;
          10'h278: special_out = 16'h7e00;
          10'h279: special_out = 16'h7e00;
          10'h27a: special_out = 16'h7e00;
          10'h27b: special_out = 16'h7e00;
          10'h27c: special_out = 16'h7e00;
          10'h27d: special_out = 16'h7e00;
          10'h27e: special_out = 16'h7e00;
          10'h27f: special_out = 16'h7e00;
          10'h280: special_out = 16'h7e00;
          10'h281: special_out = 16'h7e00;
          10'h282: special_out = 16'h7e00;
          10'h283: special_out = 16'h7e00;
          10'h284: special_out = 16'h7e00;
          10'h285: special_out = 16'h7e00;
          10'h286: special_out = 16'h7e00;
          10'h287: special_out = 16'h7e00;
          10'h288: special_out = 16'h7e00;
          10'h289: special_out = 16'h7e00;
          10'h28a: special_out = 16'h7e00;
          10'h28b: special_out = 16'h7e00;
          10'h28c: special_out = 16'h7e00;
          10'h28d: special_out = 16'h7e00;
          10'h28e: special_out = 16'h7e00;
          10'h28f: special_out = 16'h7e00;
          10'h290: special_out = 16'h7e00;
          10'h291: special_out = 16'h7e00;
          10'h292: special_out = 16'h7e00;
          10'h293: special_out = 16'h7e00;
          10'h294: special_out = 16'h7e00;
          10'h295: special_out = 16'h7e00;
          10'h296: special_out = 16'h7e00;
          10'h297: special_out = 16'h7e00;
          10'h298: special_out = 16'h7e00;
          10'h299: special_out = 16'h7e00;
          10'h29a: special_out = 16'h7e00;
          10'h29b: special_out = 16'h7e00;
          10'h29c: special_out = 16'h7e00;
          10'h29d: special_out = 16'h7e00;
          10'h29e: special_out = 16'h7e00;
          10'h29f: special_out = 16'h7e00;
          10'h2a0: special_out = 16'h7e00;
          10'h2a1: special_out = 16'h7e00;
          10'h2a2: special_out = 16'h7e00;
          10'h2a3: special_out = 16'h7e00;
          10'h2a4: special_out = 16'h7e00;
          10'h2a5: special_out = 16'h7e00;
          10'h2a6: special_out = 16'h7e00;
          10'h2a7: special_out = 16'h7e00;
          10'h2a8: special_out = 16'h7e00;
          10'h2a9: special_out = 16'h7e00;
          10'h2aa: special_out = 16'h7e00;
          10'h2ab: special_out = 16'h7e00;
          10'h2ac: special_out = 16'h7e00;
          10'h2ad: special_out = 16'h7e00;
          10'h2ae: special_out = 16'h7e00;
          10'h2af: special_out = 16'h7e00;
          10'h2b0: special_out = 16'h7e00;
          10'h2b1: special_out = 16'h7e00;
          10'h2b2: special_out = 16'h7e00;
          10'h2b3: special_out = 16'h7e00;
          10'h2b4: special_out = 16'h7e00;
          10'h2b5: special_out = 16'h7e00;
          10'h2b6: special_out = 16'h7e00;
          10'h2b7: special_out = 16'h7e00;
          10'h2b8: special_out = 16'h7e00;
          10'h2b9: special_out = 16'h7e00;
          10'h2ba: special_out = 16'h7e00;
          10'h2bb: special_out = 16'h7e00;
          10'h2bc: special_out = 16'h7e00;
          10'h2bd: special_out = 16'h7e00;
          10'h2be: special_out = 16'h7e00;
          10'h2bf: special_out = 16'h7e00;
          10'h2c0: special_out = 16'h7e00;
          10'h2c1: special_out = 16'h7e00;
          10'h2c2: special_out = 16'h7e00;
          10'h2c3: special_out = 16'h7e00;
          10'h2c4: special_out = 16'h7e00;
          10'h2c5: special_out = 16'h7e00;
          10'h2c6: special_out = 16'h7e00;
          10'h2c7: special_out = 16'h7e00;
          10'h2c8: special_out = 16'h7e00;
          10'h2c9: special_out = 16'h7e00;
          10'h2ca: special_out = 16'h7e00;
          10'h2cb: special_out = 16'h7e00;
          10'h2cc: special_out = 16'h7e00;
          10'h2cd: special_out = 16'h7e00;
          10'h2ce: special_out = 16'h7e00;
          10'h2cf: special_out = 16'h7e00;
          10'h2d0: special_out = 16'h7e00;
          10'h2d1: special_out = 16'h7e00;
          10'h2d2: special_out = 16'h7e00;
          10'h2d3: special_out = 16'h7e00;
          10'h2d4: special_out = 16'h7e00;
          10'h2d5: special_out = 16'h7e00;
          10'h2d6: special_out = 16'h7e00;
          10'h2d7: special_out = 16'h7e00;
          10'h2d8: special_out = 16'h7e00;
          10'h2d9: special_out = 16'h7e00;
          10'h2da: special_out = 16'h7e00;
          10'h2db: special_out = 16'h7e00;
          10'h2dc: special_out = 16'h7e00;
          10'h2dd: special_out = 16'h7e00;
          10'h2de: special_out = 16'h7e00;
          10'h2df: special_out = 16'h7e00;
          10'h2e0: special_out = 16'h7e00;
          10'h2e1: special_out = 16'h7e00;
          10'h2e2: special_out = 16'h7e00;
          10'h2e3: special_out = 16'h7e00;
          10'h2e4: special_out = 16'h7e00;
          10'h2e5: special_out = 16'h7e00;
          10'h2e6: special_out = 16'h7e00;
          10'h2e7: special_out = 16'h7e00;
          10'h2e8: special_out = 16'h7e00;
          10'h2e9: special_out = 16'h7e00;
          10'h2ea: special_out = 16'h7e00;
          10'h2eb: special_out = 16'h7e00;
          10'h2ec: special_out = 16'h7e00;
          10'h2ed: special_out = 16'h7e00;
          10'h2ee: special_out = 16'h7e00;
          10'h2ef: special_out = 16'h7e00;
          10'h2f0: special_out = 16'h7e00;
          10'h2f1: special_out = 16'h7e00;
          10'h2f2: special_out = 16'h7e00;
          10'h2f3: special_out = 16'h7e00;
          10'h2f4: special_out = 16'h7e00;
          10'h2f5: special_out = 16'h7e00;
          10'h2f6: special_out = 16'h7e00;
          10'h2f7: special_out = 16'h7e00;
          10'h2f8: special_out = 16'h7e00;
          10'h2f9: special_out = 16'h7e00;
          10'h2fa: special_out = 16'h7e00;
          10'h2fb: special_out = 16'h7e00;
          10'h2fc: special_out = 16'h7e00;
          10'h2fd: special_out = 16'h7e00;
          10'h2fe: special_out = 16'h7e00;
          10'h2ff: special_out = 16'h7e00;
          10'h300: special_out = 16'h7e00;
          10'h301: special_out = 16'h7e00;
          10'h302: special_out = 16'h7e00;
          10'h303: special_out = 16'h7e00;
          10'h304: special_out = 16'h7e00;
          10'h305: special_out = 16'h7e00;
          10'h306: special_out = 16'h7e00;
          10'h307: special_out = 16'h7e00;
          10'h308: special_out = 16'h7e00;
          10'h309: special_out = 16'h7e00;
          10'h30a: special_out = 16'h7e00;
          10'h30b: special_out = 16'h7e00;
          10'h30c: special_out = 16'h7e00;
          10'h30d: special_out = 16'h7e00;
          10'h30e: special_out = 16'h7e00;
          10'h30f: special_out = 16'h7e00;
          10'h310: special_out = 16'h7e00;
          10'h311: special_out = 16'h7e00;
          10'h312: special_out = 16'h7e00;
          10'h313: special_out = 16'h7e00;
          10'h314: special_out = 16'h7e00;
          10'h315: special_out = 16'h7e00;
          10'h316: special_out = 16'h7e00;
          10'h317: special_out = 16'h7e00;
          10'h318: special_out = 16'h7e00;
          10'h319: special_out = 16'h7e00;
          10'h31a: special_out = 16'h7e00;
          10'h31b: special_out = 16'h7e00;
          10'h31c: special_out = 16'h7e00;
          10'h31d: special_out = 16'h7e00;
          10'h31e: special_out = 16'h7e00;
          10'h31f: special_out = 16'h7e00;
          10'h320: special_out = 16'h7e00;
          10'h321: special_out = 16'h7e00;
          10'h322: special_out = 16'h7e00;
          10'h323: special_out = 16'h7e00;
          10'h324: special_out = 16'h7e00;
          10'h325: special_out = 16'h7e00;
          10'h326: special_out = 16'h7e00;
          10'h327: special_out = 16'h7e00;
          10'h328: special_out = 16'h7e00;
          10'h329: special_out = 16'h7e00;
          10'h32a: special_out = 16'h7e00;
          10'h32b: special_out = 16'h7e00;
          10'h32c: special_out = 16'h7e00;
          10'h32d: special_out = 16'h7e00;
          10'h32e: special_out = 16'h7e00;
          10'h32f: special_out = 16'h7e00;
          10'h330: special_out = 16'h7e00;
          10'h331: special_out = 16'h7e00;
          10'h332: special_out = 16'h7e00;
          10'h333: special_out = 16'h7e00;
          10'h334: special_out = 16'h7e00;
          10'h335: special_out = 16'h7e00;
          10'h336: special_out = 16'h7e00;
          10'h337: special_out = 16'h7e00;
          10'h338: special_out = 16'h7e00;
          10'h339: special_out = 16'h7e00;
          10'h33a: special_out = 16'h7e00;
          10'h33b: special_out = 16'h7e00;
          10'h33c: special_out = 16'h7e00;
          10'h33d: special_out = 16'h7e00;
          10'h33e: special_out = 16'h7e00;
          10'h33f: special_out = 16'h7e00;
          10'h340: special_out = 16'h7e00;
          10'h341: special_out = 16'h7e00;
          10'h342: special_out = 16'h7e00;
          10'h343: special_out = 16'h7e00;
          10'h344: special_out = 16'h7e00;
          10'h345: special_out = 16'h7e00;
          10'h346: special_out = 16'h7e00;
          10'h347: special_out = 16'h7e00;
          10'h348: special_out = 16'h7e00;
          10'h349: special_out = 16'h7e00;
          10'h34a: special_out = 16'h7e00;
          10'h34b: special_out = 16'h7e00;
          10'h34c: special_out = 16'h7e00;
          10'h34d: special_out = 16'h7e00;
          10'h34e: special_out = 16'h7e00;
          10'h34f: special_out = 16'h7e00;
          10'h350: special_out = 16'h7e00;
          10'h351: special_out = 16'h7e00;
          10'h352: special_out = 16'h7e00;
          10'h353: special_out = 16'h7e00;
          10'h354: special_out = 16'h7e00;
          10'h355: special_out = 16'h7e00;
          10'h356: special_out = 16'h7e00;
          10'h357: special_out = 16'h7e00;
          10'h358: special_out = 16'h7e00;
          10'h359: special_out = 16'h7e00;
          10'h35a: special_out = 16'h7e00;
          10'h35b: special_out = 16'h7e00;
          10'h35c: special_out = 16'h7e00;
          10'h35d: special_out = 16'h7e00;
          10'h35e: special_out = 16'h7e00;
          10'h35f: special_out = 16'h7e00;
          10'h360: special_out = 16'h7e00;
          10'h361: special_out = 16'h7e00;
          10'h362: special_out = 16'h7e00;
          10'h363: special_out = 16'h7e00;
          10'h364: special_out = 16'h7e00;
          10'h365: special_out = 16'h7e00;
          10'h366: special_out = 16'h7e00;
          10'h367: special_out = 16'h7e00;
          10'h368: special_out = 16'h7e00;
          10'h369: special_out = 16'h7e00;
          10'h36a: special_out = 16'h7e00;
          10'h36b: special_out = 16'h7e00;
          10'h36c: special_out = 16'h7e00;
          10'h36d: special_out = 16'h7e00;
          10'h36e: special_out = 16'h7e00;
          10'h36f: special_out = 16'h7e00;
          10'h370: special_out = 16'h7e00;
          10'h371: special_out = 16'h7e00;
          10'h372: special_out = 16'h7e00;
          10'h373: special_out = 16'h7e00;
          10'h374: special_out = 16'h7e00;
          10'h375: special_out = 16'h7e00;
          10'h376: special_out = 16'h7e00;
          10'h377: special_out = 16'h7e00;
          10'h378: special_out = 16'h7e00;
          10'h379: special_out = 16'h7e00;
          10'h37a: special_out = 16'h7e00;
          10'h37b: special_out = 16'h7e00;
          10'h37c: special_out = 16'h7e00;
          10'h37d: special_out = 16'h7e00;
          10'h37e: special_out = 16'h7e00;
          10'h37f: special_out = 16'h7e00;
          10'h380: special_out = 16'h7e00;
          10'h381: special_out = 16'h7e00;
          10'h382: special_out = 16'h7e00;
          10'h383: special_out = 16'h7e00;
          10'h384: special_out = 16'h7e00;
          10'h385: special_out = 16'h7e00;
          10'h386: special_out = 16'h7e00;
          10'h387: special_out = 16'h7e00;
          10'h388: special_out = 16'h7e00;
          10'h389: special_out = 16'h7e00;
          10'h38a: special_out = 16'h7e00;
          10'h38b: special_out = 16'h7e00;
          10'h38c: special_out = 16'h7e00;
          10'h38d: special_out = 16'h7e00;
          10'h38e: special_out = 16'h7e00;
          10'h38f: special_out = 16'h7e00;
          10'h390: special_out = 16'h7e00;
          10'h391: special_out = 16'h7e00;
          10'h392: special_out = 16'h7e00;
          10'h393: special_out = 16'h7e00;
          10'h394: special_out = 16'h7e00;
          10'h395: special_out = 16'h7e00;
          10'h396: special_out = 16'h7e00;
          10'h397: special_out = 16'h7e00;
          10'h398: special_out = 16'h7e00;
          10'h399: special_out = 16'h7e00;
          10'h39a: special_out = 16'h7e00;
          10'h39b: special_out = 16'h7e00;
          10'h39c: special_out = 16'h7e00;
          10'h39d: special_out = 16'h7e00;
          10'h39e: special_out = 16'h7e00;
          10'h39f: special_out = 16'h7e00;
          10'h3a0: special_out = 16'h7e00;
          10'h3a1: special_out = 16'h7e00;
          10'h3a2: special_out = 16'h7e00;
          10'h3a3: special_out = 16'h7e00;
          10'h3a4: special_out = 16'h7e00;
          10'h3a5: special_out = 16'h7e00;
          10'h3a6: special_out = 16'h7e00;
          10'h3a7: special_out = 16'h7e00;
          10'h3a8: special_out = 16'h7e00;
          10'h3a9: special_out = 16'h7e00;
          10'h3aa: special_out = 16'h7e00;
          10'h3ab: special_out = 16'h7e00;
          10'h3ac: special_out = 16'h7e00;
          10'h3ad: special_out = 16'h7e00;
          10'h3ae: special_out = 16'h7e00;
          10'h3af: special_out = 16'h7e00;
          10'h3b0: special_out = 16'h7e00;
          10'h3b1: special_out = 16'h7e00;
          10'h3b2: special_out = 16'h7e00;
          10'h3b3: special_out = 16'h7e00;
          10'h3b4: special_out = 16'h7e00;
          10'h3b5: special_out = 16'h7e00;
          10'h3b6: special_out = 16'h7e00;
          10'h3b7: special_out = 16'h7e00;
          10'h3b8: special_out = 16'h7e00;
          10'h3b9: special_out = 16'h7e00;
          10'h3ba: special_out = 16'h7e00;
          10'h3bb: special_out = 16'h7e00;
          10'h3bc: special_out = 16'h7e00;
          10'h3bd: special_out = 16'h7e00;
          10'h3be: special_out = 16'h7e00;
          10'h3bf: special_out = 16'h7e00;
          10'h3c0: special_out = 16'h7e00;
          10'h3c1: special_out = 16'h7e00;
          10'h3c2: special_out = 16'h7e00;
          10'h3c3: special_out = 16'h7e00;
          10'h3c4: special_out = 16'h7e00;
          10'h3c5: special_out = 16'h7e00;
          10'h3c6: special_out = 16'h7e00;
          10'h3c7: special_out = 16'h7e00;
          10'h3c8: special_out = 16'h7e00;
          10'h3c9: special_out = 16'h7e00;
          10'h3ca: special_out = 16'h7e00;
          10'h3cb: special_out = 16'h7e00;
          10'h3cc: special_out = 16'h7e00;
          10'h3cd: special_out = 16'h7e00;
          10'h3ce: special_out = 16'h7e00;
          10'h3cf: special_out = 16'h7e00;
          10'h3d0: special_out = 16'h7e00;
          10'h3d1: special_out = 16'h7e00;
          10'h3d2: special_out = 16'h7e00;
          10'h3d3: special_out = 16'h7e00;
          10'h3d4: special_out = 16'h7e00;
          10'h3d5: special_out = 16'h7e00;
          10'h3d6: special_out = 16'h7e00;
          10'h3d7: special_out = 16'h7e00;
          10'h3d8: special_out = 16'h7e00;
          10'h3d9: special_out = 16'h7e00;
          10'h3da: special_out = 16'h7e00;
          10'h3db: special_out = 16'h7e00;
          10'h3dc: special_out = 16'h7e00;
          10'h3dd: special_out = 16'h7e00;
          10'h3de: special_out = 16'h7e00;
          10'h3df: special_out = 16'h7e00;
          10'h3e0: special_out = 16'h7e00;
          10'h3e1: special_out = 16'h7e00;
          10'h3e2: special_out = 16'h7e00;
          10'h3e3: special_out = 16'h7e00;
          10'h3e4: special_out = 16'h7e00;
          10'h3e5: special_out = 16'h7e00;
          10'h3e6: special_out = 16'h7e00;
          10'h3e7: special_out = 16'h7e00;
          10'h3e8: special_out = 16'h7e00;
          10'h3e9: special_out = 16'h7e00;
          10'h3ea: special_out = 16'h7e00;
          10'h3eb: special_out = 16'h7e00;
          10'h3ec: special_out = 16'h7e00;
          10'h3ed: special_out = 16'h7e00;
          10'h3ee: special_out = 16'h7e00;
          10'h3ef: special_out = 16'h7e00;
          10'h3f0: special_out = 16'h7e00;
          10'h3f1: special_out = 16'h7e00;
          10'h3f2: special_out = 16'h7e00;
          10'h3f3: special_out = 16'h7e00;
          10'h3f4: special_out = 16'h7e00;
          10'h3f5: special_out = 16'h7e00;
          10'h3f6: special_out = 16'h7e00;
          10'h3f7: special_out = 16'h7e00;
          10'h3f8: special_out = 16'h7e00;
          10'h3f9: special_out = 16'h7e00;
          10'h3fa: special_out = 16'h7e00;
          10'h3fb: special_out = 16'h7e00;
          10'h3fc: special_out = 16'h7e00;
          10'h3fd: special_out = 16'h7e00;
          10'h3fe: special_out = 16'h7e00;
          10'h3ff: special_out = 16'h7e00;
          default: special_out = 16'h0000;
        endcase
      end
      6'h20: special_out = 16'hfc00;
      6'h3f: begin
        case (mant)
          10'h000: special_out = 16'h8000;
          10'h001: special_out = 16'h7e00;
          10'h002: special_out = 16'h7e00;
          10'h003: special_out = 16'h7e00;
          10'h004: special_out = 16'h7e00;
          10'h005: special_out = 16'h7e00;
          10'h006: special_out = 16'h7e00;
          10'h007: special_out = 16'h7e00;
          10'h008: special_out = 16'h7e00;
          10'h009: special_out = 16'h7e00;
          10'h00a: special_out = 16'h7e00;
          10'h00b: special_out = 16'h7e00;
          10'h00c: special_out = 16'h7e00;
          10'h00d: special_out = 16'h7e00;
          10'h00e: special_out = 16'h7e00;
          10'h00f: special_out = 16'h7e00;
          10'h010: special_out = 16'h7e00;
          10'h011: special_out = 16'h7e00;
          10'h012: special_out = 16'h7e00;
          10'h013: special_out = 16'h7e00;
          10'h014: special_out = 16'h7e00;
          10'h015: special_out = 16'h7e00;
          10'h016: special_out = 16'h7e00;
          10'h017: special_out = 16'h7e00;
          10'h018: special_out = 16'h7e00;
          10'h019: special_out = 16'h7e00;
          10'h01a: special_out = 16'h7e00;
          10'h01b: special_out = 16'h7e00;
          10'h01c: special_out = 16'h7e00;
          10'h01d: special_out = 16'h7e00;
          10'h01e: special_out = 16'h7e00;
          10'h01f: special_out = 16'h7e00;
          10'h020: special_out = 16'h7e00;
          10'h021: special_out = 16'h7e00;
          10'h022: special_out = 16'h7e00;
          10'h023: special_out = 16'h7e00;
          10'h024: special_out = 16'h7e00;
          10'h025: special_out = 16'h7e00;
          10'h026: special_out = 16'h7e00;
          10'h027: special_out = 16'h7e00;
          10'h028: special_out = 16'h7e00;
          10'h029: special_out = 16'h7e00;
          10'h02a: special_out = 16'h7e00;
          10'h02b: special_out = 16'h7e00;
          10'h02c: special_out = 16'h7e00;
          10'h02d: special_out = 16'h7e00;
          10'h02e: special_out = 16'h7e00;
          10'h02f: special_out = 16'h7e00;
          10'h030: special_out = 16'h7e00;
          10'h031: special_out = 16'h7e00;
          10'h032: special_out = 16'h7e00;
          10'h033: special_out = 16'h7e00;
          10'h034: special_out = 16'h7e00;
          10'h035: special_out = 16'h7e00;
          10'h036: special_out = 16'h7e00;
          10'h037: special_out = 16'h7e00;
          10'h038: special_out = 16'h7e00;
          10'h039: special_out = 16'h7e00;
          10'h03a: special_out = 16'h7e00;
          10'h03b: special_out = 16'h7e00;
          10'h03c: special_out = 16'h7e00;
          10'h03d: special_out = 16'h7e00;
          10'h03e: special_out = 16'h7e00;
          10'h03f: special_out = 16'h7e00;
          10'h040: special_out = 16'h7e00;
          10'h041: special_out = 16'h7e00;
          10'h042: special_out = 16'h7e00;
          10'h043: special_out = 16'h7e00;
          10'h044: special_out = 16'h7e00;
          10'h045: special_out = 16'h7e00;
          10'h046: special_out = 16'h7e00;
          10'h047: special_out = 16'h7e00;
          10'h048: special_out = 16'h7e00;
          10'h049: special_out = 16'h7e00;
          10'h04a: special_out = 16'h7e00;
          10'h04b: special_out = 16'h7e00;
          10'h04c: special_out = 16'h7e00;
          10'h04d: special_out = 16'h7e00;
          10'h04e: special_out = 16'h7e00;
          10'h04f: special_out = 16'h7e00;
          10'h050: special_out = 16'h7e00;
          10'h051: special_out = 16'h7e00;
          10'h052: special_out = 16'h7e00;
          10'h053: special_out = 16'h7e00;
          10'h054: special_out = 16'h7e00;
          10'h055: special_out = 16'h7e00;
          10'h056: special_out = 16'h7e00;
          10'h057: special_out = 16'h7e00;
          10'h058: special_out = 16'h7e00;
          10'h059: special_out = 16'h7e00;
          10'h05a: special_out = 16'h7e00;
          10'h05b: special_out = 16'h7e00;
          10'h05c: special_out = 16'h7e00;
          10'h05d: special_out = 16'h7e00;
          10'h05e: special_out = 16'h7e00;
          10'h05f: special_out = 16'h7e00;
          10'h060: special_out = 16'h7e00;
          10'h061: special_out = 16'h7e00;
          10'h062: special_out = 16'h7e00;
          10'h063: special_out = 16'h7e00;
          10'h064: special_out = 16'h7e00;
          10'h065: special_out = 16'h7e00;
          10'h066: special_out = 16'h7e00;
          10'h067: special_out = 16'h7e00;
          10'h068: special_out = 16'h7e00;
          10'h069: special_out = 16'h7e00;
          10'h06a: special_out = 16'h7e00;
          10'h06b: special_out = 16'h7e00;
          10'h06c: special_out = 16'h7e00;
          10'h06d: special_out = 16'h7e00;
          10'h06e: special_out = 16'h7e00;
          10'h06f: special_out = 16'h7e00;
          10'h070: special_out = 16'h7e00;
          10'h071: special_out = 16'h7e00;
          10'h072: special_out = 16'h7e00;
          10'h073: special_out = 16'h7e00;
          10'h074: special_out = 16'h7e00;
          10'h075: special_out = 16'h7e00;
          10'h076: special_out = 16'h7e00;
          10'h077: special_out = 16'h7e00;
          10'h078: special_out = 16'h7e00;
          10'h079: special_out = 16'h7e00;
          10'h07a: special_out = 16'h7e00;
          10'h07b: special_out = 16'h7e00;
          10'h07c: special_out = 16'h7e00;
          10'h07d: special_out = 16'h7e00;
          10'h07e: special_out = 16'h7e00;
          10'h07f: special_out = 16'h7e00;
          10'h080: special_out = 16'h7e00;
          10'h081: special_out = 16'h7e00;
          10'h082: special_out = 16'h7e00;
          10'h083: special_out = 16'h7e00;
          10'h084: special_out = 16'h7e00;
          10'h085: special_out = 16'h7e00;
          10'h086: special_out = 16'h7e00;
          10'h087: special_out = 16'h7e00;
          10'h088: special_out = 16'h7e00;
          10'h089: special_out = 16'h7e00;
          10'h08a: special_out = 16'h7e00;
          10'h08b: special_out = 16'h7e00;
          10'h08c: special_out = 16'h7e00;
          10'h08d: special_out = 16'h7e00;
          10'h08e: special_out = 16'h7e00;
          10'h08f: special_out = 16'h7e00;
          10'h090: special_out = 16'h7e00;
          10'h091: special_out = 16'h7e00;
          10'h092: special_out = 16'h7e00;
          10'h093: special_out = 16'h7e00;
          10'h094: special_out = 16'h7e00;
          10'h095: special_out = 16'h7e00;
          10'h096: special_out = 16'h7e00;
          10'h097: special_out = 16'h7e00;
          10'h098: special_out = 16'h7e00;
          10'h099: special_out = 16'h7e00;
          10'h09a: special_out = 16'h7e00;
          10'h09b: special_out = 16'h7e00;
          10'h09c: special_out = 16'h7e00;
          10'h09d: special_out = 16'h7e00;
          10'h09e: special_out = 16'h7e00;
          10'h09f: special_out = 16'h7e00;
          10'h0a0: special_out = 16'h7e00;
          10'h0a1: special_out = 16'h7e00;
          10'h0a2: special_out = 16'h7e00;
          10'h0a3: special_out = 16'h7e00;
          10'h0a4: special_out = 16'h7e00;
          10'h0a5: special_out = 16'h7e00;
          10'h0a6: special_out = 16'h7e00;
          10'h0a7: special_out = 16'h7e00;
          10'h0a8: special_out = 16'h7e00;
          10'h0a9: special_out = 16'h7e00;
          10'h0aa: special_out = 16'h7e00;
          10'h0ab: special_out = 16'h7e00;
          10'h0ac: special_out = 16'h7e00;
          10'h0ad: special_out = 16'h7e00;
          10'h0ae: special_out = 16'h7e00;
          10'h0af: special_out = 16'h7e00;
          10'h0b0: special_out = 16'h7e00;
          10'h0b1: special_out = 16'h7e00;
          10'h0b2: special_out = 16'h7e00;
          10'h0b3: special_out = 16'h7e00;
          10'h0b4: special_out = 16'h7e00;
          10'h0b5: special_out = 16'h7e00;
          10'h0b6: special_out = 16'h7e00;
          10'h0b7: special_out = 16'h7e00;
          10'h0b8: special_out = 16'h7e00;
          10'h0b9: special_out = 16'h7e00;
          10'h0ba: special_out = 16'h7e00;
          10'h0bb: special_out = 16'h7e00;
          10'h0bc: special_out = 16'h7e00;
          10'h0bd: special_out = 16'h7e00;
          10'h0be: special_out = 16'h7e00;
          10'h0bf: special_out = 16'h7e00;
          10'h0c0: special_out = 16'h7e00;
          10'h0c1: special_out = 16'h7e00;
          10'h0c2: special_out = 16'h7e00;
          10'h0c3: special_out = 16'h7e00;
          10'h0c4: special_out = 16'h7e00;
          10'h0c5: special_out = 16'h7e00;
          10'h0c6: special_out = 16'h7e00;
          10'h0c7: special_out = 16'h7e00;
          10'h0c8: special_out = 16'h7e00;
          10'h0c9: special_out = 16'h7e00;
          10'h0ca: special_out = 16'h7e00;
          10'h0cb: special_out = 16'h7e00;
          10'h0cc: special_out = 16'h7e00;
          10'h0cd: special_out = 16'h7e00;
          10'h0ce: special_out = 16'h7e00;
          10'h0cf: special_out = 16'h7e00;
          10'h0d0: special_out = 16'h7e00;
          10'h0d1: special_out = 16'h7e00;
          10'h0d2: special_out = 16'h7e00;
          10'h0d3: special_out = 16'h7e00;
          10'h0d4: special_out = 16'h7e00;
          10'h0d5: special_out = 16'h7e00;
          10'h0d6: special_out = 16'h7e00;
          10'h0d7: special_out = 16'h7e00;
          10'h0d8: special_out = 16'h7e00;
          10'h0d9: special_out = 16'h7e00;
          10'h0da: special_out = 16'h7e00;
          10'h0db: special_out = 16'h7e00;
          10'h0dc: special_out = 16'h7e00;
          10'h0dd: special_out = 16'h7e00;
          10'h0de: special_out = 16'h7e00;
          10'h0df: special_out = 16'h7e00;
          10'h0e0: special_out = 16'h7e00;
          10'h0e1: special_out = 16'h7e00;
          10'h0e2: special_out = 16'h7e00;
          10'h0e3: special_out = 16'h7e00;
          10'h0e4: special_out = 16'h7e00;
          10'h0e5: special_out = 16'h7e00;
          10'h0e6: special_out = 16'h7e00;
          10'h0e7: special_out = 16'h7e00;
          10'h0e8: special_out = 16'h7e00;
          10'h0e9: special_out = 16'h7e00;
          10'h0ea: special_out = 16'h7e00;
          10'h0eb: special_out = 16'h7e00;
          10'h0ec: special_out = 16'h7e00;
          10'h0ed: special_out = 16'h7e00;
          10'h0ee: special_out = 16'h7e00;
          10'h0ef: special_out = 16'h7e00;
          10'h0f0: special_out = 16'h7e00;
          10'h0f1: special_out = 16'h7e00;
          10'h0f2: special_out = 16'h7e00;
          10'h0f3: special_out = 16'h7e00;
          10'h0f4: special_out = 16'h7e00;
          10'h0f5: special_out = 16'h7e00;
          10'h0f6: special_out = 16'h7e00;
          10'h0f7: special_out = 16'h7e00;
          10'h0f8: special_out = 16'h7e00;
          10'h0f9: special_out = 16'h7e00;
          10'h0fa: special_out = 16'h7e00;
          10'h0fb: special_out = 16'h7e00;
          10'h0fc: special_out = 16'h7e00;
          10'h0fd: special_out = 16'h7e00;
          10'h0fe: special_out = 16'h7e00;
          10'h0ff: special_out = 16'h7e00;
          10'h100: special_out = 16'h7e00;
          10'h101: special_out = 16'h7e00;
          10'h102: special_out = 16'h7e00;
          10'h103: special_out = 16'h7e00;
          10'h104: special_out = 16'h7e00;
          10'h105: special_out = 16'h7e00;
          10'h106: special_out = 16'h7e00;
          10'h107: special_out = 16'h7e00;
          10'h108: special_out = 16'h7e00;
          10'h109: special_out = 16'h7e00;
          10'h10a: special_out = 16'h7e00;
          10'h10b: special_out = 16'h7e00;
          10'h10c: special_out = 16'h7e00;
          10'h10d: special_out = 16'h7e00;
          10'h10e: special_out = 16'h7e00;
          10'h10f: special_out = 16'h7e00;
          10'h110: special_out = 16'h7e00;
          10'h111: special_out = 16'h7e00;
          10'h112: special_out = 16'h7e00;
          10'h113: special_out = 16'h7e00;
          10'h114: special_out = 16'h7e00;
          10'h115: special_out = 16'h7e00;
          10'h116: special_out = 16'h7e00;
          10'h117: special_out = 16'h7e00;
          10'h118: special_out = 16'h7e00;
          10'h119: special_out = 16'h7e00;
          10'h11a: special_out = 16'h7e00;
          10'h11b: special_out = 16'h7e00;
          10'h11c: special_out = 16'h7e00;
          10'h11d: special_out = 16'h7e00;
          10'h11e: special_out = 16'h7e00;
          10'h11f: special_out = 16'h7e00;
          10'h120: special_out = 16'h7e00;
          10'h121: special_out = 16'h7e00;
          10'h122: special_out = 16'h7e00;
          10'h123: special_out = 16'h7e00;
          10'h124: special_out = 16'h7e00;
          10'h125: special_out = 16'h7e00;
          10'h126: special_out = 16'h7e00;
          10'h127: special_out = 16'h7e00;
          10'h128: special_out = 16'h7e00;
          10'h129: special_out = 16'h7e00;
          10'h12a: special_out = 16'h7e00;
          10'h12b: special_out = 16'h7e00;
          10'h12c: special_out = 16'h7e00;
          10'h12d: special_out = 16'h7e00;
          10'h12e: special_out = 16'h7e00;
          10'h12f: special_out = 16'h7e00;
          10'h130: special_out = 16'h7e00;
          10'h131: special_out = 16'h7e00;
          10'h132: special_out = 16'h7e00;
          10'h133: special_out = 16'h7e00;
          10'h134: special_out = 16'h7e00;
          10'h135: special_out = 16'h7e00;
          10'h136: special_out = 16'h7e00;
          10'h137: special_out = 16'h7e00;
          10'h138: special_out = 16'h7e00;
          10'h139: special_out = 16'h7e00;
          10'h13a: special_out = 16'h7e00;
          10'h13b: special_out = 16'h7e00;
          10'h13c: special_out = 16'h7e00;
          10'h13d: special_out = 16'h7e00;
          10'h13e: special_out = 16'h7e00;
          10'h13f: special_out = 16'h7e00;
          10'h140: special_out = 16'h7e00;
          10'h141: special_out = 16'h7e00;
          10'h142: special_out = 16'h7e00;
          10'h143: special_out = 16'h7e00;
          10'h144: special_out = 16'h7e00;
          10'h145: special_out = 16'h7e00;
          10'h146: special_out = 16'h7e00;
          10'h147: special_out = 16'h7e00;
          10'h148: special_out = 16'h7e00;
          10'h149: special_out = 16'h7e00;
          10'h14a: special_out = 16'h7e00;
          10'h14b: special_out = 16'h7e00;
          10'h14c: special_out = 16'h7e00;
          10'h14d: special_out = 16'h7e00;
          10'h14e: special_out = 16'h7e00;
          10'h14f: special_out = 16'h7e00;
          10'h150: special_out = 16'h7e00;
          10'h151: special_out = 16'h7e00;
          10'h152: special_out = 16'h7e00;
          10'h153: special_out = 16'h7e00;
          10'h154: special_out = 16'h7e00;
          10'h155: special_out = 16'h7e00;
          10'h156: special_out = 16'h7e00;
          10'h157: special_out = 16'h7e00;
          10'h158: special_out = 16'h7e00;
          10'h159: special_out = 16'h7e00;
          10'h15a: special_out = 16'h7e00;
          10'h15b: special_out = 16'h7e00;
          10'h15c: special_out = 16'h7e00;
          10'h15d: special_out = 16'h7e00;
          10'h15e: special_out = 16'h7e00;
          10'h15f: special_out = 16'h7e00;
          10'h160: special_out = 16'h7e00;
          10'h161: special_out = 16'h7e00;
          10'h162: special_out = 16'h7e00;
          10'h163: special_out = 16'h7e00;
          10'h164: special_out = 16'h7e00;
          10'h165: special_out = 16'h7e00;
          10'h166: special_out = 16'h7e00;
          10'h167: special_out = 16'h7e00;
          10'h168: special_out = 16'h7e00;
          10'h169: special_out = 16'h7e00;
          10'h16a: special_out = 16'h7e00;
          10'h16b: special_out = 16'h7e00;
          10'h16c: special_out = 16'h7e00;
          10'h16d: special_out = 16'h7e00;
          10'h16e: special_out = 16'h7e00;
          10'h16f: special_out = 16'h7e00;
          10'h170: special_out = 16'h7e00;
          10'h171: special_out = 16'h7e00;
          10'h172: special_out = 16'h7e00;
          10'h173: special_out = 16'h7e00;
          10'h174: special_out = 16'h7e00;
          10'h175: special_out = 16'h7e00;
          10'h176: special_out = 16'h7e00;
          10'h177: special_out = 16'h7e00;
          10'h178: special_out = 16'h7e00;
          10'h179: special_out = 16'h7e00;
          10'h17a: special_out = 16'h7e00;
          10'h17b: special_out = 16'h7e00;
          10'h17c: special_out = 16'h7e00;
          10'h17d: special_out = 16'h7e00;
          10'h17e: special_out = 16'h7e00;
          10'h17f: special_out = 16'h7e00;
          10'h180: special_out = 16'h7e00;
          10'h181: special_out = 16'h7e00;
          10'h182: special_out = 16'h7e00;
          10'h183: special_out = 16'h7e00;
          10'h184: special_out = 16'h7e00;
          10'h185: special_out = 16'h7e00;
          10'h186: special_out = 16'h7e00;
          10'h187: special_out = 16'h7e00;
          10'h188: special_out = 16'h7e00;
          10'h189: special_out = 16'h7e00;
          10'h18a: special_out = 16'h7e00;
          10'h18b: special_out = 16'h7e00;
          10'h18c: special_out = 16'h7e00;
          10'h18d: special_out = 16'h7e00;
          10'h18e: special_out = 16'h7e00;
          10'h18f: special_out = 16'h7e00;
          10'h190: special_out = 16'h7e00;
          10'h191: special_out = 16'h7e00;
          10'h192: special_out = 16'h7e00;
          10'h193: special_out = 16'h7e00;
          10'h194: special_out = 16'h7e00;
          10'h195: special_out = 16'h7e00;
          10'h196: special_out = 16'h7e00;
          10'h197: special_out = 16'h7e00;
          10'h198: special_out = 16'h7e00;
          10'h199: special_out = 16'h7e00;
          10'h19a: special_out = 16'h7e00;
          10'h19b: special_out = 16'h7e00;
          10'h19c: special_out = 16'h7e00;
          10'h19d: special_out = 16'h7e00;
          10'h19e: special_out = 16'h7e00;
          10'h19f: special_out = 16'h7e00;
          10'h1a0: special_out = 16'h7e00;
          10'h1a1: special_out = 16'h7e00;
          10'h1a2: special_out = 16'h7e00;
          10'h1a3: special_out = 16'h7e00;
          10'h1a4: special_out = 16'h7e00;
          10'h1a5: special_out = 16'h7e00;
          10'h1a6: special_out = 16'h7e00;
          10'h1a7: special_out = 16'h7e00;
          10'h1a8: special_out = 16'h7e00;
          10'h1a9: special_out = 16'h7e00;
          10'h1aa: special_out = 16'h7e00;
          10'h1ab: special_out = 16'h7e00;
          10'h1ac: special_out = 16'h7e00;
          10'h1ad: special_out = 16'h7e00;
          10'h1ae: special_out = 16'h7e00;
          10'h1af: special_out = 16'h7e00;
          10'h1b0: special_out = 16'h7e00;
          10'h1b1: special_out = 16'h7e00;
          10'h1b2: special_out = 16'h7e00;
          10'h1b3: special_out = 16'h7e00;
          10'h1b4: special_out = 16'h7e00;
          10'h1b5: special_out = 16'h7e00;
          10'h1b6: special_out = 16'h7e00;
          10'h1b7: special_out = 16'h7e00;
          10'h1b8: special_out = 16'h7e00;
          10'h1b9: special_out = 16'h7e00;
          10'h1ba: special_out = 16'h7e00;
          10'h1bb: special_out = 16'h7e00;
          10'h1bc: special_out = 16'h7e00;
          10'h1bd: special_out = 16'h7e00;
          10'h1be: special_out = 16'h7e00;
          10'h1bf: special_out = 16'h7e00;
          10'h1c0: special_out = 16'h7e00;
          10'h1c1: special_out = 16'h7e00;
          10'h1c2: special_out = 16'h7e00;
          10'h1c3: special_out = 16'h7e00;
          10'h1c4: special_out = 16'h7e00;
          10'h1c5: special_out = 16'h7e00;
          10'h1c6: special_out = 16'h7e00;
          10'h1c7: special_out = 16'h7e00;
          10'h1c8: special_out = 16'h7e00;
          10'h1c9: special_out = 16'h7e00;
          10'h1ca: special_out = 16'h7e00;
          10'h1cb: special_out = 16'h7e00;
          10'h1cc: special_out = 16'h7e00;
          10'h1cd: special_out = 16'h7e00;
          10'h1ce: special_out = 16'h7e00;
          10'h1cf: special_out = 16'h7e00;
          10'h1d0: special_out = 16'h7e00;
          10'h1d1: special_out = 16'h7e00;
          10'h1d2: special_out = 16'h7e00;
          10'h1d3: special_out = 16'h7e00;
          10'h1d4: special_out = 16'h7e00;
          10'h1d5: special_out = 16'h7e00;
          10'h1d6: special_out = 16'h7e00;
          10'h1d7: special_out = 16'h7e00;
          10'h1d8: special_out = 16'h7e00;
          10'h1d9: special_out = 16'h7e00;
          10'h1da: special_out = 16'h7e00;
          10'h1db: special_out = 16'h7e00;
          10'h1dc: special_out = 16'h7e00;
          10'h1dd: special_out = 16'h7e00;
          10'h1de: special_out = 16'h7e00;
          10'h1df: special_out = 16'h7e00;
          10'h1e0: special_out = 16'h7e00;
          10'h1e1: special_out = 16'h7e00;
          10'h1e2: special_out = 16'h7e00;
          10'h1e3: special_out = 16'h7e00;
          10'h1e4: special_out = 16'h7e00;
          10'h1e5: special_out = 16'h7e00;
          10'h1e6: special_out = 16'h7e00;
          10'h1e7: special_out = 16'h7e00;
          10'h1e8: special_out = 16'h7e00;
          10'h1e9: special_out = 16'h7e00;
          10'h1ea: special_out = 16'h7e00;
          10'h1eb: special_out = 16'h7e00;
          10'h1ec: special_out = 16'h7e00;
          10'h1ed: special_out = 16'h7e00;
          10'h1ee: special_out = 16'h7e00;
          10'h1ef: special_out = 16'h7e00;
          10'h1f0: special_out = 16'h7e00;
          10'h1f1: special_out = 16'h7e00;
          10'h1f2: special_out = 16'h7e00;
          10'h1f3: special_out = 16'h7e00;
          10'h1f4: special_out = 16'h7e00;
          10'h1f5: special_out = 16'h7e00;
          10'h1f6: special_out = 16'h7e00;
          10'h1f7: special_out = 16'h7e00;
          10'h1f8: special_out = 16'h7e00;
          10'h1f9: special_out = 16'h7e00;
          10'h1fa: special_out = 16'h7e00;
          10'h1fb: special_out = 16'h7e00;
          10'h1fc: special_out = 16'h7e00;
          10'h1fd: special_out = 16'h7e00;
          10'h1fe: special_out = 16'h7e00;
          10'h1ff: special_out = 16'h7e00;
          10'h200: special_out = 16'h7e00;
          10'h201: special_out = 16'h7e00;
          10'h202: special_out = 16'h7e00;
          10'h203: special_out = 16'h7e00;
          10'h204: special_out = 16'h7e00;
          10'h205: special_out = 16'h7e00;
          10'h206: special_out = 16'h7e00;
          10'h207: special_out = 16'h7e00;
          10'h208: special_out = 16'h7e00;
          10'h209: special_out = 16'h7e00;
          10'h20a: special_out = 16'h7e00;
          10'h20b: special_out = 16'h7e00;
          10'h20c: special_out = 16'h7e00;
          10'h20d: special_out = 16'h7e00;
          10'h20e: special_out = 16'h7e00;
          10'h20f: special_out = 16'h7e00;
          10'h210: special_out = 16'h7e00;
          10'h211: special_out = 16'h7e00;
          10'h212: special_out = 16'h7e00;
          10'h213: special_out = 16'h7e00;
          10'h214: special_out = 16'h7e00;
          10'h215: special_out = 16'h7e00;
          10'h216: special_out = 16'h7e00;
          10'h217: special_out = 16'h7e00;
          10'h218: special_out = 16'h7e00;
          10'h219: special_out = 16'h7e00;
          10'h21a: special_out = 16'h7e00;
          10'h21b: special_out = 16'h7e00;
          10'h21c: special_out = 16'h7e00;
          10'h21d: special_out = 16'h7e00;
          10'h21e: special_out = 16'h7e00;
          10'h21f: special_out = 16'h7e00;
          10'h220: special_out = 16'h7e00;
          10'h221: special_out = 16'h7e00;
          10'h222: special_out = 16'h7e00;
          10'h223: special_out = 16'h7e00;
          10'h224: special_out = 16'h7e00;
          10'h225: special_out = 16'h7e00;
          10'h226: special_out = 16'h7e00;
          10'h227: special_out = 16'h7e00;
          10'h228: special_out = 16'h7e00;
          10'h229: special_out = 16'h7e00;
          10'h22a: special_out = 16'h7e00;
          10'h22b: special_out = 16'h7e00;
          10'h22c: special_out = 16'h7e00;
          10'h22d: special_out = 16'h7e00;
          10'h22e: special_out = 16'h7e00;
          10'h22f: special_out = 16'h7e00;
          10'h230: special_out = 16'h7e00;
          10'h231: special_out = 16'h7e00;
          10'h232: special_out = 16'h7e00;
          10'h233: special_out = 16'h7e00;
          10'h234: special_out = 16'h7e00;
          10'h235: special_out = 16'h7e00;
          10'h236: special_out = 16'h7e00;
          10'h237: special_out = 16'h7e00;
          10'h238: special_out = 16'h7e00;
          10'h239: special_out = 16'h7e00;
          10'h23a: special_out = 16'h7e00;
          10'h23b: special_out = 16'h7e00;
          10'h23c: special_out = 16'h7e00;
          10'h23d: special_out = 16'h7e00;
          10'h23e: special_out = 16'h7e00;
          10'h23f: special_out = 16'h7e00;
          10'h240: special_out = 16'h7e00;
          10'h241: special_out = 16'h7e00;
          10'h242: special_out = 16'h7e00;
          10'h243: special_out = 16'h7e00;
          10'h244: special_out = 16'h7e00;
          10'h245: special_out = 16'h7e00;
          10'h246: special_out = 16'h7e00;
          10'h247: special_out = 16'h7e00;
          10'h248: special_out = 16'h7e00;
          10'h249: special_out = 16'h7e00;
          10'h24a: special_out = 16'h7e00;
          10'h24b: special_out = 16'h7e00;
          10'h24c: special_out = 16'h7e00;
          10'h24d: special_out = 16'h7e00;
          10'h24e: special_out = 16'h7e00;
          10'h24f: special_out = 16'h7e00;
          10'h250: special_out = 16'h7e00;
          10'h251: special_out = 16'h7e00;
          10'h252: special_out = 16'h7e00;
          10'h253: special_out = 16'h7e00;
          10'h254: special_out = 16'h7e00;
          10'h255: special_out = 16'h7e00;
          10'h256: special_out = 16'h7e00;
          10'h257: special_out = 16'h7e00;
          10'h258: special_out = 16'h7e00;
          10'h259: special_out = 16'h7e00;
          10'h25a: special_out = 16'h7e00;
          10'h25b: special_out = 16'h7e00;
          10'h25c: special_out = 16'h7e00;
          10'h25d: special_out = 16'h7e00;
          10'h25e: special_out = 16'h7e00;
          10'h25f: special_out = 16'h7e00;
          10'h260: special_out = 16'h7e00;
          10'h261: special_out = 16'h7e00;
          10'h262: special_out = 16'h7e00;
          10'h263: special_out = 16'h7e00;
          10'h264: special_out = 16'h7e00;
          10'h265: special_out = 16'h7e00;
          10'h266: special_out = 16'h7e00;
          10'h267: special_out = 16'h7e00;
          10'h268: special_out = 16'h7e00;
          10'h269: special_out = 16'h7e00;
          10'h26a: special_out = 16'h7e00;
          10'h26b: special_out = 16'h7e00;
          10'h26c: special_out = 16'h7e00;
          10'h26d: special_out = 16'h7e00;
          10'h26e: special_out = 16'h7e00;
          10'h26f: special_out = 16'h7e00;
          10'h270: special_out = 16'h7e00;
          10'h271: special_out = 16'h7e00;
          10'h272: special_out = 16'h7e00;
          10'h273: special_out = 16'h7e00;
          10'h274: special_out = 16'h7e00;
          10'h275: special_out = 16'h7e00;
          10'h276: special_out = 16'h7e00;
          10'h277: special_out = 16'h7e00;
          10'h278: special_out = 16'h7e00;
          10'h279: special_out = 16'h7e00;
          10'h27a: special_out = 16'h7e00;
          10'h27b: special_out = 16'h7e00;
          10'h27c: special_out = 16'h7e00;
          10'h27d: special_out = 16'h7e00;
          10'h27e: special_out = 16'h7e00;
          10'h27f: special_out = 16'h7e00;
          10'h280: special_out = 16'h7e00;
          10'h281: special_out = 16'h7e00;
          10'h282: special_out = 16'h7e00;
          10'h283: special_out = 16'h7e00;
          10'h284: special_out = 16'h7e00;
          10'h285: special_out = 16'h7e00;
          10'h286: special_out = 16'h7e00;
          10'h287: special_out = 16'h7e00;
          10'h288: special_out = 16'h7e00;
          10'h289: special_out = 16'h7e00;
          10'h28a: special_out = 16'h7e00;
          10'h28b: special_out = 16'h7e00;
          10'h28c: special_out = 16'h7e00;
          10'h28d: special_out = 16'h7e00;
          10'h28e: special_out = 16'h7e00;
          10'h28f: special_out = 16'h7e00;
          10'h290: special_out = 16'h7e00;
          10'h291: special_out = 16'h7e00;
          10'h292: special_out = 16'h7e00;
          10'h293: special_out = 16'h7e00;
          10'h294: special_out = 16'h7e00;
          10'h295: special_out = 16'h7e00;
          10'h296: special_out = 16'h7e00;
          10'h297: special_out = 16'h7e00;
          10'h298: special_out = 16'h7e00;
          10'h299: special_out = 16'h7e00;
          10'h29a: special_out = 16'h7e00;
          10'h29b: special_out = 16'h7e00;
          10'h29c: special_out = 16'h7e00;
          10'h29d: special_out = 16'h7e00;
          10'h29e: special_out = 16'h7e00;
          10'h29f: special_out = 16'h7e00;
          10'h2a0: special_out = 16'h7e00;
          10'h2a1: special_out = 16'h7e00;
          10'h2a2: special_out = 16'h7e00;
          10'h2a3: special_out = 16'h7e00;
          10'h2a4: special_out = 16'h7e00;
          10'h2a5: special_out = 16'h7e00;
          10'h2a6: special_out = 16'h7e00;
          10'h2a7: special_out = 16'h7e00;
          10'h2a8: special_out = 16'h7e00;
          10'h2a9: special_out = 16'h7e00;
          10'h2aa: special_out = 16'h7e00;
          10'h2ab: special_out = 16'h7e00;
          10'h2ac: special_out = 16'h7e00;
          10'h2ad: special_out = 16'h7e00;
          10'h2ae: special_out = 16'h7e00;
          10'h2af: special_out = 16'h7e00;
          10'h2b0: special_out = 16'h7e00;
          10'h2b1: special_out = 16'h7e00;
          10'h2b2: special_out = 16'h7e00;
          10'h2b3: special_out = 16'h7e00;
          10'h2b4: special_out = 16'h7e00;
          10'h2b5: special_out = 16'h7e00;
          10'h2b6: special_out = 16'h7e00;
          10'h2b7: special_out = 16'h7e00;
          10'h2b8: special_out = 16'h7e00;
          10'h2b9: special_out = 16'h7e00;
          10'h2ba: special_out = 16'h7e00;
          10'h2bb: special_out = 16'h7e00;
          10'h2bc: special_out = 16'h7e00;
          10'h2bd: special_out = 16'h7e00;
          10'h2be: special_out = 16'h7e00;
          10'h2bf: special_out = 16'h7e00;
          10'h2c0: special_out = 16'h7e00;
          10'h2c1: special_out = 16'h7e00;
          10'h2c2: special_out = 16'h7e00;
          10'h2c3: special_out = 16'h7e00;
          10'h2c4: special_out = 16'h7e00;
          10'h2c5: special_out = 16'h7e00;
          10'h2c6: special_out = 16'h7e00;
          10'h2c7: special_out = 16'h7e00;
          10'h2c8: special_out = 16'h7e00;
          10'h2c9: special_out = 16'h7e00;
          10'h2ca: special_out = 16'h7e00;
          10'h2cb: special_out = 16'h7e00;
          10'h2cc: special_out = 16'h7e00;
          10'h2cd: special_out = 16'h7e00;
          10'h2ce: special_out = 16'h7e00;
          10'h2cf: special_out = 16'h7e00;
          10'h2d0: special_out = 16'h7e00;
          10'h2d1: special_out = 16'h7e00;
          10'h2d2: special_out = 16'h7e00;
          10'h2d3: special_out = 16'h7e00;
          10'h2d4: special_out = 16'h7e00;
          10'h2d5: special_out = 16'h7e00;
          10'h2d6: special_out = 16'h7e00;
          10'h2d7: special_out = 16'h7e00;
          10'h2d8: special_out = 16'h7e00;
          10'h2d9: special_out = 16'h7e00;
          10'h2da: special_out = 16'h7e00;
          10'h2db: special_out = 16'h7e00;
          10'h2dc: special_out = 16'h7e00;
          10'h2dd: special_out = 16'h7e00;
          10'h2de: special_out = 16'h7e00;
          10'h2df: special_out = 16'h7e00;
          10'h2e0: special_out = 16'h7e00;
          10'h2e1: special_out = 16'h7e00;
          10'h2e2: special_out = 16'h7e00;
          10'h2e3: special_out = 16'h7e00;
          10'h2e4: special_out = 16'h7e00;
          10'h2e5: special_out = 16'h7e00;
          10'h2e6: special_out = 16'h7e00;
          10'h2e7: special_out = 16'h7e00;
          10'h2e8: special_out = 16'h7e00;
          10'h2e9: special_out = 16'h7e00;
          10'h2ea: special_out = 16'h7e00;
          10'h2eb: special_out = 16'h7e00;
          10'h2ec: special_out = 16'h7e00;
          10'h2ed: special_out = 16'h7e00;
          10'h2ee: special_out = 16'h7e00;
          10'h2ef: special_out = 16'h7e00;
          10'h2f0: special_out = 16'h7e00;
          10'h2f1: special_out = 16'h7e00;
          10'h2f2: special_out = 16'h7e00;
          10'h2f3: special_out = 16'h7e00;
          10'h2f4: special_out = 16'h7e00;
          10'h2f5: special_out = 16'h7e00;
          10'h2f6: special_out = 16'h7e00;
          10'h2f7: special_out = 16'h7e00;
          10'h2f8: special_out = 16'h7e00;
          10'h2f9: special_out = 16'h7e00;
          10'h2fa: special_out = 16'h7e00;
          10'h2fb: special_out = 16'h7e00;
          10'h2fc: special_out = 16'h7e00;
          10'h2fd: special_out = 16'h7e00;
          10'h2fe: special_out = 16'h7e00;
          10'h2ff: special_out = 16'h7e00;
          10'h300: special_out = 16'h7e00;
          10'h301: special_out = 16'h7e00;
          10'h302: special_out = 16'h7e00;
          10'h303: special_out = 16'h7e00;
          10'h304: special_out = 16'h7e00;
          10'h305: special_out = 16'h7e00;
          10'h306: special_out = 16'h7e00;
          10'h307: special_out = 16'h7e00;
          10'h308: special_out = 16'h7e00;
          10'h309: special_out = 16'h7e00;
          10'h30a: special_out = 16'h7e00;
          10'h30b: special_out = 16'h7e00;
          10'h30c: special_out = 16'h7e00;
          10'h30d: special_out = 16'h7e00;
          10'h30e: special_out = 16'h7e00;
          10'h30f: special_out = 16'h7e00;
          10'h310: special_out = 16'h7e00;
          10'h311: special_out = 16'h7e00;
          10'h312: special_out = 16'h7e00;
          10'h313: special_out = 16'h7e00;
          10'h314: special_out = 16'h7e00;
          10'h315: special_out = 16'h7e00;
          10'h316: special_out = 16'h7e00;
          10'h317: special_out = 16'h7e00;
          10'h318: special_out = 16'h7e00;
          10'h319: special_out = 16'h7e00;
          10'h31a: special_out = 16'h7e00;
          10'h31b: special_out = 16'h7e00;
          10'h31c: special_out = 16'h7e00;
          10'h31d: special_out = 16'h7e00;
          10'h31e: special_out = 16'h7e00;
          10'h31f: special_out = 16'h7e00;
          10'h320: special_out = 16'h7e00;
          10'h321: special_out = 16'h7e00;
          10'h322: special_out = 16'h7e00;
          10'h323: special_out = 16'h7e00;
          10'h324: special_out = 16'h7e00;
          10'h325: special_out = 16'h7e00;
          10'h326: special_out = 16'h7e00;
          10'h327: special_out = 16'h7e00;
          10'h328: special_out = 16'h7e00;
          10'h329: special_out = 16'h7e00;
          10'h32a: special_out = 16'h7e00;
          10'h32b: special_out = 16'h7e00;
          10'h32c: special_out = 16'h7e00;
          10'h32d: special_out = 16'h7e00;
          10'h32e: special_out = 16'h7e00;
          10'h32f: special_out = 16'h7e00;
          10'h330: special_out = 16'h7e00;
          10'h331: special_out = 16'h7e00;
          10'h332: special_out = 16'h7e00;
          10'h333: special_out = 16'h7e00;
          10'h334: special_out = 16'h7e00;
          10'h335: special_out = 16'h7e00;
          10'h336: special_out = 16'h7e00;
          10'h337: special_out = 16'h7e00;
          10'h338: special_out = 16'h7e00;
          10'h339: special_out = 16'h7e00;
          10'h33a: special_out = 16'h7e00;
          10'h33b: special_out = 16'h7e00;
          10'h33c: special_out = 16'h7e00;
          10'h33d: special_out = 16'h7e00;
          10'h33e: special_out = 16'h7e00;
          10'h33f: special_out = 16'h7e00;
          10'h340: special_out = 16'h7e00;
          10'h341: special_out = 16'h7e00;
          10'h342: special_out = 16'h7e00;
          10'h343: special_out = 16'h7e00;
          10'h344: special_out = 16'h7e00;
          10'h345: special_out = 16'h7e00;
          10'h346: special_out = 16'h7e00;
          10'h347: special_out = 16'h7e00;
          10'h348: special_out = 16'h7e00;
          10'h349: special_out = 16'h7e00;
          10'h34a: special_out = 16'h7e00;
          10'h34b: special_out = 16'h7e00;
          10'h34c: special_out = 16'h7e00;
          10'h34d: special_out = 16'h7e00;
          10'h34e: special_out = 16'h7e00;
          10'h34f: special_out = 16'h7e00;
          10'h350: special_out = 16'h7e00;
          10'h351: special_out = 16'h7e00;
          10'h352: special_out = 16'h7e00;
          10'h353: special_out = 16'h7e00;
          10'h354: special_out = 16'h7e00;
          10'h355: special_out = 16'h7e00;
          10'h356: special_out = 16'h7e00;
          10'h357: special_out = 16'h7e00;
          10'h358: special_out = 16'h7e00;
          10'h359: special_out = 16'h7e00;
          10'h35a: special_out = 16'h7e00;
          10'h35b: special_out = 16'h7e00;
          10'h35c: special_out = 16'h7e00;
          10'h35d: special_out = 16'h7e00;
          10'h35e: special_out = 16'h7e00;
          10'h35f: special_out = 16'h7e00;
          10'h360: special_out = 16'h7e00;
          10'h361: special_out = 16'h7e00;
          10'h362: special_out = 16'h7e00;
          10'h363: special_out = 16'h7e00;
          10'h364: special_out = 16'h7e00;
          10'h365: special_out = 16'h7e00;
          10'h366: special_out = 16'h7e00;
          10'h367: special_out = 16'h7e00;
          10'h368: special_out = 16'h7e00;
          10'h369: special_out = 16'h7e00;
          10'h36a: special_out = 16'h7e00;
          10'h36b: special_out = 16'h7e00;
          10'h36c: special_out = 16'h7e00;
          10'h36d: special_out = 16'h7e00;
          10'h36e: special_out = 16'h7e00;
          10'h36f: special_out = 16'h7e00;
          10'h370: special_out = 16'h7e00;
          10'h371: special_out = 16'h7e00;
          10'h372: special_out = 16'h7e00;
          10'h373: special_out = 16'h7e00;
          10'h374: special_out = 16'h7e00;
          10'h375: special_out = 16'h7e00;
          10'h376: special_out = 16'h7e00;
          10'h377: special_out = 16'h7e00;
          10'h378: special_out = 16'h7e00;
          10'h379: special_out = 16'h7e00;
          10'h37a: special_out = 16'h7e00;
          10'h37b: special_out = 16'h7e00;
          10'h37c: special_out = 16'h7e00;
          10'h37d: special_out = 16'h7e00;
          10'h37e: special_out = 16'h7e00;
          10'h37f: special_out = 16'h7e00;
          10'h380: special_out = 16'h7e00;
          10'h381: special_out = 16'h7e00;
          10'h382: special_out = 16'h7e00;
          10'h383: special_out = 16'h7e00;
          10'h384: special_out = 16'h7e00;
          10'h385: special_out = 16'h7e00;
          10'h386: special_out = 16'h7e00;
          10'h387: special_out = 16'h7e00;
          10'h388: special_out = 16'h7e00;
          10'h389: special_out = 16'h7e00;
          10'h38a: special_out = 16'h7e00;
          10'h38b: special_out = 16'h7e00;
          10'h38c: special_out = 16'h7e00;
          10'h38d: special_out = 16'h7e00;
          10'h38e: special_out = 16'h7e00;
          10'h38f: special_out = 16'h7e00;
          10'h390: special_out = 16'h7e00;
          10'h391: special_out = 16'h7e00;
          10'h392: special_out = 16'h7e00;
          10'h393: special_out = 16'h7e00;
          10'h394: special_out = 16'h7e00;
          10'h395: special_out = 16'h7e00;
          10'h396: special_out = 16'h7e00;
          10'h397: special_out = 16'h7e00;
          10'h398: special_out = 16'h7e00;
          10'h399: special_out = 16'h7e00;
          10'h39a: special_out = 16'h7e00;
          10'h39b: special_out = 16'h7e00;
          10'h39c: special_out = 16'h7e00;
          10'h39d: special_out = 16'h7e00;
          10'h39e: special_out = 16'h7e00;
          10'h39f: special_out = 16'h7e00;
          10'h3a0: special_out = 16'h7e00;
          10'h3a1: special_out = 16'h7e00;
          10'h3a2: special_out = 16'h7e00;
          10'h3a3: special_out = 16'h7e00;
          10'h3a4: special_out = 16'h7e00;
          10'h3a5: special_out = 16'h7e00;
          10'h3a6: special_out = 16'h7e00;
          10'h3a7: special_out = 16'h7e00;
          10'h3a8: special_out = 16'h7e00;
          10'h3a9: special_out = 16'h7e00;
          10'h3aa: special_out = 16'h7e00;
          10'h3ab: special_out = 16'h7e00;
          10'h3ac: special_out = 16'h7e00;
          10'h3ad: special_out = 16'h7e00;
          10'h3ae: special_out = 16'h7e00;
          10'h3af: special_out = 16'h7e00;
          10'h3b0: special_out = 16'h7e00;
          10'h3b1: special_out = 16'h7e00;
          10'h3b2: special_out = 16'h7e00;
          10'h3b3: special_out = 16'h7e00;
          10'h3b4: special_out = 16'h7e00;
          10'h3b5: special_out = 16'h7e00;
          10'h3b6: special_out = 16'h7e00;
          10'h3b7: special_out = 16'h7e00;
          10'h3b8: special_out = 16'h7e00;
          10'h3b9: special_out = 16'h7e00;
          10'h3ba: special_out = 16'h7e00;
          10'h3bb: special_out = 16'h7e00;
          10'h3bc: special_out = 16'h7e00;
          10'h3bd: special_out = 16'h7e00;
          10'h3be: special_out = 16'h7e00;
          10'h3bf: special_out = 16'h7e00;
          10'h3c0: special_out = 16'h7e00;
          10'h3c1: special_out = 16'h7e00;
          10'h3c2: special_out = 16'h7e00;
          10'h3c3: special_out = 16'h7e00;
          10'h3c4: special_out = 16'h7e00;
          10'h3c5: special_out = 16'h7e00;
          10'h3c6: special_out = 16'h7e00;
          10'h3c7: special_out = 16'h7e00;
          10'h3c8: special_out = 16'h7e00;
          10'h3c9: special_out = 16'h7e00;
          10'h3ca: special_out = 16'h7e00;
          10'h3cb: special_out = 16'h7e00;
          10'h3cc: special_out = 16'h7e00;
          10'h3cd: special_out = 16'h7e00;
          10'h3ce: special_out = 16'h7e00;
          10'h3cf: special_out = 16'h7e00;
          10'h3d0: special_out = 16'h7e00;
          10'h3d1: special_out = 16'h7e00;
          10'h3d2: special_out = 16'h7e00;
          10'h3d3: special_out = 16'h7e00;
          10'h3d4: special_out = 16'h7e00;
          10'h3d5: special_out = 16'h7e00;
          10'h3d6: special_out = 16'h7e00;
          10'h3d7: special_out = 16'h7e00;
          10'h3d8: special_out = 16'h7e00;
          10'h3d9: special_out = 16'h7e00;
          10'h3da: special_out = 16'h7e00;
          10'h3db: special_out = 16'h7e00;
          10'h3dc: special_out = 16'h7e00;
          10'h3dd: special_out = 16'h7e00;
          10'h3de: special_out = 16'h7e00;
          10'h3df: special_out = 16'h7e00;
          10'h3e0: special_out = 16'h7e00;
          10'h3e1: special_out = 16'h7e00;
          10'h3e2: special_out = 16'h7e00;
          10'h3e3: special_out = 16'h7e00;
          10'h3e4: special_out = 16'h7e00;
          10'h3e5: special_out = 16'h7e00;
          10'h3e6: special_out = 16'h7e00;
          10'h3e7: special_out = 16'h7e00;
          10'h3e8: special_out = 16'h7e00;
          10'h3e9: special_out = 16'h7e00;
          10'h3ea: special_out = 16'h7e00;
          10'h3eb: special_out = 16'h7e00;
          10'h3ec: special_out = 16'h7e00;
          10'h3ed: special_out = 16'h7e00;
          10'h3ee: special_out = 16'h7e00;
          10'h3ef: special_out = 16'h7e00;
          10'h3f0: special_out = 16'h7e00;
          10'h3f1: special_out = 16'h7e00;
          10'h3f2: special_out = 16'h7e00;
          10'h3f3: special_out = 16'h7e00;
          10'h3f4: special_out = 16'h7e00;
          10'h3f5: special_out = 16'h7e00;
          10'h3f6: special_out = 16'h7e00;
          10'h3f7: special_out = 16'h7e00;
          10'h3f8: special_out = 16'h7e00;
          10'h3f9: special_out = 16'h7e00;
          10'h3fa: special_out = 16'h7e00;
          10'h3fb: special_out = 16'h7e00;
          10'h3fc: special_out = 16'h7e00;
          10'h3fd: special_out = 16'h7e00;
          10'h3fe: special_out = 16'h7e00;
          10'h3ff: special_out = 16'h7e00;
          default: special_out = 16'h0000;
        endcase
      end
      default: special_out = 16'h0000;
    endcase
  end
  reg [1:0] cls;
  always @* begin
    case (exp)
      5'h01: cls = 2'h1;
      5'h02: cls = 2'h2;
      5'h03: cls = 2'h0;
      5'h04: cls = 2'h1;
      5'h05: cls = 2'h2;
      5'h06: cls = 2'h0;
      5'h07: cls = 2'h1;
      5'h08: cls = 2'h2;
      5'h09: cls = 2'h0;
      5'h0a: cls = 2'h1;
      5'h0b: cls = 2'h2;
      5'h0c: cls = 2'h0;
      5'h0d: cls = 2'h1;
      5'h0e: cls = 2'h2;
      5'h0f: cls = 2'h0;
      5'h10: cls = 2'h1;
      5'h11: cls = 2'h2;
      5'h12: cls = 2'h0;
      5'h13: cls = 2'h1;
      5'h14: cls = 2'h2;
      5'h15: cls = 2'h0;
      5'h16: cls = 2'h1;
      5'h17: cls = 2'h2;
      5'h18: cls = 2'h0;
      5'h19: cls = 2'h1;
      5'h1a: cls = 2'h2;
      5'h1b: cls = 2'h0;
      5'h1c: cls = 2'h1;
      5'h1d: cls = 2'h2;
      5'h1e: cls = 2'h0;
      default: cls = 2'd0;
    endcase
  end
  reg [7:0] out_low;
  always @* begin
    case (cls)
      2'h0: begin
      case (mant[9:4])
        6'h00: begin
          case (mant[3:0])
            4'h0: out_low = 8'h00;
            4'h1: out_low = 8'hff;
            4'h2: out_low = 8'hff;
            4'h3: out_low = 8'hfe;
            4'h4: out_low = 8'hfd;
            4'h5: out_low = 8'hfd;
            4'h6: out_low = 8'hfc;
            4'h7: out_low = 8'hfb;
            4'h8: out_low = 8'hfb;
            4'h9: out_low = 8'hfa;
            4'ha: out_low = 8'hf9;
            4'hb: out_low = 8'hf9;
            4'hc: out_low = 8'hf8;
            4'hd: out_low = 8'hf7;
            4'he: out_low = 8'hf7;
            4'hf: out_low = 8'hf6;
            default: out_low = 8'h00;
          endcase
        end
        6'h01: begin
          case (mant[3:0])
            4'h0: out_low = 8'hf5;
            4'h1: out_low = 8'hf5;
            4'h2: out_low = 8'hf4;
            4'h3: out_low = 8'hf3;
            4'h4: out_low = 8'hf3;
            4'h5: out_low = 8'hf2;
            4'h6: out_low = 8'hf2;
            4'h7: out_low = 8'hf1;
            4'h8: out_low = 8'hf0;
            4'h9: out_low = 8'hf0;
            4'ha: out_low = 8'hef;
            4'hb: out_low = 8'hee;
            4'hc: out_low = 8'hee;
            4'hd: out_low = 8'hed;
            4'he: out_low = 8'hec;
            4'hf: out_low = 8'hec;
            default: out_low = 8'h00;
          endcase
        end
        6'h02: begin
          case (mant[3:0])
            4'h0: out_low = 8'heb;
            4'h1: out_low = 8'hea;
            4'h2: out_low = 8'hea;
            4'h3: out_low = 8'he9;
            4'h4: out_low = 8'he9;
            4'h5: out_low = 8'he8;
            4'h6: out_low = 8'he7;
            4'h7: out_low = 8'he7;
            4'h8: out_low = 8'he6;
            4'h9: out_low = 8'he5;
            4'ha: out_low = 8'he5;
            4'hb: out_low = 8'he4;
            4'hc: out_low = 8'he3;
            4'hd: out_low = 8'he3;
            4'he: out_low = 8'he2;
            4'hf: out_low = 8'he2;
            default: out_low = 8'h00;
          endcase
        end
        6'h03: begin
          case (mant[3:0])
            4'h0: out_low = 8'he1;
            4'h1: out_low = 8'he0;
            4'h2: out_low = 8'he0;
            4'h3: out_low = 8'hdf;
            4'h4: out_low = 8'hde;
            4'h5: out_low = 8'hde;
            4'h6: out_low = 8'hdd;
            4'h7: out_low = 8'hdd;
            4'h8: out_low = 8'hdc;
            4'h9: out_low = 8'hdb;
            4'ha: out_low = 8'hdb;
            4'hb: out_low = 8'hda;
            4'hc: out_low = 8'hd9;
            4'hd: out_low = 8'hd9;
            4'he: out_low = 8'hd8;
            4'hf: out_low = 8'hd8;
            default: out_low = 8'h00;
          endcase
        end
        6'h04: begin
          case (mant[3:0])
            4'h0: out_low = 8'hd7;
            4'h1: out_low = 8'hd6;
            4'h2: out_low = 8'hd6;
            4'h3: out_low = 8'hd5;
            4'h4: out_low = 8'hd5;
            4'h5: out_low = 8'hd4;
            4'h6: out_low = 8'hd3;
            4'h7: out_low = 8'hd3;
            4'h8: out_low = 8'hd2;
            4'h9: out_low = 8'hd2;
            4'ha: out_low = 8'hd1;
            4'hb: out_low = 8'hd0;
            4'hc: out_low = 8'hd0;
            4'hd: out_low = 8'hcf;
            4'he: out_low = 8'hce;
            4'hf: out_low = 8'hce;
            default: out_low = 8'h00;
          endcase
        end
        6'h05: begin
          case (mant[3:0])
            4'h0: out_low = 8'hcd;
            4'h1: out_low = 8'hcd;
            4'h2: out_low = 8'hcc;
            4'h3: out_low = 8'hcb;
            4'h4: out_low = 8'hcb;
            4'h5: out_low = 8'hca;
            4'h6: out_low = 8'hca;
            4'h7: out_low = 8'hc9;
            4'h8: out_low = 8'hc8;
            4'h9: out_low = 8'hc8;
            4'ha: out_low = 8'hc7;
            4'hb: out_low = 8'hc7;
            4'hc: out_low = 8'hc6;
            4'hd: out_low = 8'hc6;
            4'he: out_low = 8'hc5;
            4'hf: out_low = 8'hc4;
            default: out_low = 8'h00;
          endcase
        end
        6'h06: begin
          case (mant[3:0])
            4'h0: out_low = 8'hc4;
            4'h1: out_low = 8'hc3;
            4'h2: out_low = 8'hc3;
            4'h3: out_low = 8'hc2;
            4'h4: out_low = 8'hc1;
            4'h5: out_low = 8'hc1;
            4'h6: out_low = 8'hc0;
            4'h7: out_low = 8'hc0;
            4'h8: out_low = 8'hbf;
            4'h9: out_low = 8'hbe;
            4'ha: out_low = 8'hbe;
            4'hb: out_low = 8'hbd;
            4'hc: out_low = 8'hbd;
            4'hd: out_low = 8'hbc;
            4'he: out_low = 8'hbc;
            4'hf: out_low = 8'hbb;
            default: out_low = 8'h00;
          endcase
        end
        6'h07: begin
          case (mant[3:0])
            4'h0: out_low = 8'hba;
            4'h1: out_low = 8'hba;
            4'h2: out_low = 8'hb9;
            4'h3: out_low = 8'hb9;
            4'h4: out_low = 8'hb8;
            4'h5: out_low = 8'hb7;
            4'h6: out_low = 8'hb7;
            4'h7: out_low = 8'hb6;
            4'h8: out_low = 8'hb6;
            4'h9: out_low = 8'hb5;
            4'ha: out_low = 8'hb5;
            4'hb: out_low = 8'hb4;
            4'hc: out_low = 8'hb3;
            4'hd: out_low = 8'hb3;
            4'he: out_low = 8'hb2;
            4'hf: out_low = 8'hb2;
            default: out_low = 8'h00;
          endcase
        end
        6'h08: begin
          case (mant[3:0])
            4'h0: out_low = 8'hb1;
            4'h1: out_low = 8'hb1;
            4'h2: out_low = 8'hb0;
            4'h3: out_low = 8'haf;
            4'h4: out_low = 8'haf;
            4'h5: out_low = 8'hae;
            4'h6: out_low = 8'hae;
            4'h7: out_low = 8'had;
            4'h8: out_low = 8'had;
            4'h9: out_low = 8'hac;
            4'ha: out_low = 8'hab;
            4'hb: out_low = 8'hab;
            4'hc: out_low = 8'haa;
            4'hd: out_low = 8'haa;
            4'he: out_low = 8'ha9;
            4'hf: out_low = 8'ha9;
            default: out_low = 8'h00;
          endcase
        end
        6'h09: begin
          case (mant[3:0])
            4'h0: out_low = 8'ha8;
            4'h1: out_low = 8'ha8;
            4'h2: out_low = 8'ha7;
            4'h3: out_low = 8'ha6;
            4'h4: out_low = 8'ha6;
            4'h5: out_low = 8'ha5;
            4'h6: out_low = 8'ha5;
            4'h7: out_low = 8'ha4;
            4'h8: out_low = 8'ha4;
            4'h9: out_low = 8'ha3;
            4'ha: out_low = 8'ha3;
            4'hb: out_low = 8'ha2;
            4'hc: out_low = 8'ha1;
            4'hd: out_low = 8'ha1;
            4'he: out_low = 8'ha0;
            4'hf: out_low = 8'ha0;
            default: out_low = 8'h00;
          endcase
        end
        6'h0a: begin
          case (mant[3:0])
            4'h0: out_low = 8'h9f;
            4'h1: out_low = 8'h9f;
            4'h2: out_low = 8'h9e;
            4'h3: out_low = 8'h9e;
            4'h4: out_low = 8'h9d;
            4'h5: out_low = 8'h9d;
            4'h6: out_low = 8'h9c;
            4'h7: out_low = 8'h9b;
            4'h8: out_low = 8'h9b;
            4'h9: out_low = 8'h9a;
            4'ha: out_low = 8'h9a;
            4'hb: out_low = 8'h99;
            4'hc: out_low = 8'h99;
            4'hd: out_low = 8'h98;
            4'he: out_low = 8'h98;
            4'hf: out_low = 8'h97;
            default: out_low = 8'h00;
          endcase
        end
        6'h0b: begin
          case (mant[3:0])
            4'h0: out_low = 8'h97;
            4'h1: out_low = 8'h96;
            4'h2: out_low = 8'h95;
            4'h3: out_low = 8'h95;
            4'h4: out_low = 8'h94;
            4'h5: out_low = 8'h94;
            4'h6: out_low = 8'h93;
            4'h7: out_low = 8'h93;
            4'h8: out_low = 8'h92;
            4'h9: out_low = 8'h92;
            4'ha: out_low = 8'h91;
            4'hb: out_low = 8'h91;
            4'hc: out_low = 8'h90;
            4'hd: out_low = 8'h90;
            4'he: out_low = 8'h8f;
            4'hf: out_low = 8'h8f;
            default: out_low = 8'h00;
          endcase
        end
        6'h0c: begin
          case (mant[3:0])
            4'h0: out_low = 8'h8e;
            4'h1: out_low = 8'h8d;
            4'h2: out_low = 8'h8d;
            4'h3: out_low = 8'h8c;
            4'h4: out_low = 8'h8c;
            4'h5: out_low = 8'h8b;
            4'h6: out_low = 8'h8b;
            4'h7: out_low = 8'h8a;
            4'h8: out_low = 8'h8a;
            4'h9: out_low = 8'h89;
            4'ha: out_low = 8'h89;
            4'hb: out_low = 8'h88;
            4'hc: out_low = 8'h88;
            4'hd: out_low = 8'h87;
            4'he: out_low = 8'h87;
            4'hf: out_low = 8'h86;
            default: out_low = 8'h00;
          endcase
        end
        6'h0d: begin
          case (mant[3:0])
            4'h0: out_low = 8'h86;
            4'h1: out_low = 8'h85;
            4'h2: out_low = 8'h85;
            4'h3: out_low = 8'h84;
            4'h4: out_low = 8'h83;
            4'h5: out_low = 8'h83;
            4'h6: out_low = 8'h82;
            4'h7: out_low = 8'h82;
            4'h8: out_low = 8'h81;
            4'h9: out_low = 8'h81;
            4'ha: out_low = 8'h80;
            4'hb: out_low = 8'h80;
            4'hc: out_low = 8'h7f;
            4'hd: out_low = 8'h7f;
            4'he: out_low = 8'h7e;
            4'hf: out_low = 8'h7e;
            default: out_low = 8'h00;
          endcase
        end
        6'h0e: begin
          case (mant[3:0])
            4'h0: out_low = 8'h7d;
            4'h1: out_low = 8'h7d;
            4'h2: out_low = 8'h7c;
            4'h3: out_low = 8'h7c;
            4'h4: out_low = 8'h7b;
            4'h5: out_low = 8'h7b;
            4'h6: out_low = 8'h7a;
            4'h7: out_low = 8'h7a;
            4'h8: out_low = 8'h79;
            4'h9: out_low = 8'h79;
            4'ha: out_low = 8'h78;
            4'hb: out_low = 8'h78;
            4'hc: out_low = 8'h77;
            4'hd: out_low = 8'h77;
            4'he: out_low = 8'h76;
            4'hf: out_low = 8'h76;
            default: out_low = 8'h00;
          endcase
        end
        6'h0f: begin
          case (mant[3:0])
            4'h0: out_low = 8'h75;
            4'h1: out_low = 8'h75;
            4'h2: out_low = 8'h74;
            4'h3: out_low = 8'h74;
            4'h4: out_low = 8'h73;
            4'h5: out_low = 8'h73;
            4'h6: out_low = 8'h72;
            4'h7: out_low = 8'h72;
            4'h8: out_low = 8'h71;
            4'h9: out_low = 8'h71;
            4'ha: out_low = 8'h70;
            4'hb: out_low = 8'h70;
            4'hc: out_low = 8'h6f;
            4'hd: out_low = 8'h6f;
            4'he: out_low = 8'h6e;
            4'hf: out_low = 8'h6e;
            default: out_low = 8'h00;
          endcase
        end
        6'h10: begin
          case (mant[3:0])
            4'h0: out_low = 8'h6d;
            4'h1: out_low = 8'h6d;
            4'h2: out_low = 8'h6c;
            4'h3: out_low = 8'h6c;
            4'h4: out_low = 8'h6b;
            4'h5: out_low = 8'h6b;
            4'h6: out_low = 8'h6a;
            4'h7: out_low = 8'h6a;
            4'h8: out_low = 8'h69;
            4'h9: out_low = 8'h69;
            4'ha: out_low = 8'h68;
            4'hb: out_low = 8'h68;
            4'hc: out_low = 8'h67;
            4'hd: out_low = 8'h67;
            4'he: out_low = 8'h66;
            4'hf: out_low = 8'h66;
            default: out_low = 8'h00;
          endcase
        end
        6'h11: begin
          case (mant[3:0])
            4'h0: out_low = 8'h65;
            4'h1: out_low = 8'h65;
            4'h2: out_low = 8'h64;
            4'h3: out_low = 8'h64;
            4'h4: out_low = 8'h63;
            4'h5: out_low = 8'h63;
            4'h6: out_low = 8'h62;
            4'h7: out_low = 8'h62;
            4'h8: out_low = 8'h61;
            4'h9: out_low = 8'h61;
            4'ha: out_low = 8'h60;
            4'hb: out_low = 8'h60;
            4'hc: out_low = 8'h60;
            4'hd: out_low = 8'h5f;
            4'he: out_low = 8'h5f;
            4'hf: out_low = 8'h5e;
            default: out_low = 8'h00;
          endcase
        end
        6'h12: begin
          case (mant[3:0])
            4'h0: out_low = 8'h5e;
            4'h1: out_low = 8'h5d;
            4'h2: out_low = 8'h5d;
            4'h3: out_low = 8'h5c;
            4'h4: out_low = 8'h5c;
            4'h5: out_low = 8'h5b;
            4'h6: out_low = 8'h5b;
            4'h7: out_low = 8'h5a;
            4'h8: out_low = 8'h5a;
            4'h9: out_low = 8'h59;
            4'ha: out_low = 8'h59;
            4'hb: out_low = 8'h58;
            4'hc: out_low = 8'h58;
            4'hd: out_low = 8'h57;
            4'he: out_low = 8'h57;
            4'hf: out_low = 8'h56;
            default: out_low = 8'h00;
          endcase
        end
        6'h13: begin
          case (mant[3:0])
            4'h0: out_low = 8'h56;
            4'h1: out_low = 8'h56;
            4'h2: out_low = 8'h55;
            4'h3: out_low = 8'h55;
            4'h4: out_low = 8'h54;
            4'h5: out_low = 8'h54;
            4'h6: out_low = 8'h53;
            4'h7: out_low = 8'h53;
            4'h8: out_low = 8'h52;
            4'h9: out_low = 8'h52;
            4'ha: out_low = 8'h51;
            4'hb: out_low = 8'h51;
            4'hc: out_low = 8'h50;
            4'hd: out_low = 8'h50;
            4'he: out_low = 8'h4f;
            4'hf: out_low = 8'h4f;
            default: out_low = 8'h00;
          endcase
        end
        6'h14: begin
          case (mant[3:0])
            4'h0: out_low = 8'h4f;
            4'h1: out_low = 8'h4e;
            4'h2: out_low = 8'h4e;
            4'h3: out_low = 8'h4d;
            4'h4: out_low = 8'h4d;
            4'h5: out_low = 8'h4c;
            4'h6: out_low = 8'h4c;
            4'h7: out_low = 8'h4b;
            4'h8: out_low = 8'h4b;
            4'h9: out_low = 8'h4a;
            4'ha: out_low = 8'h4a;
            4'hb: out_low = 8'h49;
            4'hc: out_low = 8'h49;
            4'hd: out_low = 8'h49;
            4'he: out_low = 8'h48;
            4'hf: out_low = 8'h48;
            default: out_low = 8'h00;
          endcase
        end
        6'h15: begin
          case (mant[3:0])
            4'h0: out_low = 8'h47;
            4'h1: out_low = 8'h47;
            4'h2: out_low = 8'h46;
            4'h3: out_low = 8'h46;
            4'h4: out_low = 8'h45;
            4'h5: out_low = 8'h45;
            4'h6: out_low = 8'h44;
            4'h7: out_low = 8'h44;
            4'h8: out_low = 8'h44;
            4'h9: out_low = 8'h43;
            4'ha: out_low = 8'h43;
            4'hb: out_low = 8'h42;
            4'hc: out_low = 8'h42;
            4'hd: out_low = 8'h41;
            4'he: out_low = 8'h41;
            4'hf: out_low = 8'h40;
            default: out_low = 8'h00;
          endcase
        end
        6'h16: begin
          case (mant[3:0])
            4'h0: out_low = 8'h40;
            4'h1: out_low = 8'h3f;
            4'h2: out_low = 8'h3f;
            4'h3: out_low = 8'h3f;
            4'h4: out_low = 8'h3e;
            4'h5: out_low = 8'h3e;
            4'h6: out_low = 8'h3d;
            4'h7: out_low = 8'h3d;
            4'h8: out_low = 8'h3c;
            4'h9: out_low = 8'h3c;
            4'ha: out_low = 8'h3b;
            4'hb: out_low = 8'h3b;
            4'hc: out_low = 8'h3b;
            4'hd: out_low = 8'h3a;
            4'he: out_low = 8'h3a;
            4'hf: out_low = 8'h39;
            default: out_low = 8'h00;
          endcase
        end
        6'h17: begin
          case (mant[3:0])
            4'h0: out_low = 8'h39;
            4'h1: out_low = 8'h38;
            4'h2: out_low = 8'h38;
            4'h3: out_low = 8'h37;
            4'h4: out_low = 8'h37;
            4'h5: out_low = 8'h37;
            4'h6: out_low = 8'h36;
            4'h7: out_low = 8'h36;
            4'h8: out_low = 8'h35;
            4'h9: out_low = 8'h35;
            4'ha: out_low = 8'h34;
            4'hb: out_low = 8'h34;
            4'hc: out_low = 8'h33;
            4'hd: out_low = 8'h33;
            4'he: out_low = 8'h33;
            4'hf: out_low = 8'h32;
            default: out_low = 8'h00;
          endcase
        end
        6'h18: begin
          case (mant[3:0])
            4'h0: out_low = 8'h32;
            4'h1: out_low = 8'h31;
            4'h2: out_low = 8'h31;
            4'h3: out_low = 8'h30;
            4'h4: out_low = 8'h30;
            4'h5: out_low = 8'h30;
            4'h6: out_low = 8'h2f;
            4'h7: out_low = 8'h2f;
            4'h8: out_low = 8'h2e;
            4'h9: out_low = 8'h2e;
            4'ha: out_low = 8'h2d;
            4'hb: out_low = 8'h2d;
            4'hc: out_low = 8'h2d;
            4'hd: out_low = 8'h2c;
            4'he: out_low = 8'h2c;
            4'hf: out_low = 8'h2b;
            default: out_low = 8'h00;
          endcase
        end
        6'h19: begin
          case (mant[3:0])
            4'h0: out_low = 8'h2b;
            4'h1: out_low = 8'h2a;
            4'h2: out_low = 8'h2a;
            4'h3: out_low = 8'h2a;
            4'h4: out_low = 8'h29;
            4'h5: out_low = 8'h29;
            4'h6: out_low = 8'h28;
            4'h7: out_low = 8'h28;
            4'h8: out_low = 8'h27;
            4'h9: out_low = 8'h27;
            4'ha: out_low = 8'h27;
            4'hb: out_low = 8'h26;
            4'hc: out_low = 8'h26;
            4'hd: out_low = 8'h25;
            4'he: out_low = 8'h25;
            4'hf: out_low = 8'h24;
            default: out_low = 8'h00;
          endcase
        end
        6'h1a: begin
          case (mant[3:0])
            4'h0: out_low = 8'h24;
            4'h1: out_low = 8'h24;
            4'h2: out_low = 8'h23;
            4'h3: out_low = 8'h23;
            4'h4: out_low = 8'h22;
            4'h5: out_low = 8'h22;
            4'h6: out_low = 8'h21;
            4'h7: out_low = 8'h21;
            4'h8: out_low = 8'h21;
            4'h9: out_low = 8'h20;
            4'ha: out_low = 8'h20;
            4'hb: out_low = 8'h1f;
            4'hc: out_low = 8'h1f;
            4'hd: out_low = 8'h1f;
            4'he: out_low = 8'h1e;
            4'hf: out_low = 8'h1e;
            default: out_low = 8'h00;
          endcase
        end
        6'h1b: begin
          case (mant[3:0])
            4'h0: out_low = 8'h1d;
            4'h1: out_low = 8'h1d;
            4'h2: out_low = 8'h1c;
            4'h3: out_low = 8'h1c;
            4'h4: out_low = 8'h1c;
            4'h5: out_low = 8'h1b;
            4'h6: out_low = 8'h1b;
            4'h7: out_low = 8'h1a;
            4'h8: out_low = 8'h1a;
            4'h9: out_low = 8'h1a;
            4'ha: out_low = 8'h19;
            4'hb: out_low = 8'h19;
            4'hc: out_low = 8'h18;
            4'hd: out_low = 8'h18;
            4'he: out_low = 8'h17;
            4'hf: out_low = 8'h17;
            default: out_low = 8'h00;
          endcase
        end
        6'h1c: begin
          case (mant[3:0])
            4'h0: out_low = 8'h17;
            4'h1: out_low = 8'h16;
            4'h2: out_low = 8'h16;
            4'h3: out_low = 8'h15;
            4'h4: out_low = 8'h15;
            4'h5: out_low = 8'h15;
            4'h6: out_low = 8'h14;
            4'h7: out_low = 8'h14;
            4'h8: out_low = 8'h13;
            4'h9: out_low = 8'h13;
            4'ha: out_low = 8'h13;
            4'hb: out_low = 8'h12;
            4'hc: out_low = 8'h12;
            4'hd: out_low = 8'h11;
            4'he: out_low = 8'h11;
            4'hf: out_low = 8'h11;
            default: out_low = 8'h00;
          endcase
        end
        6'h1d: begin
          case (mant[3:0])
            4'h0: out_low = 8'h10;
            4'h1: out_low = 8'h10;
            4'h2: out_low = 8'h0f;
            4'h3: out_low = 8'h0f;
            4'h4: out_low = 8'h0f;
            4'h5: out_low = 8'h0e;
            4'h6: out_low = 8'h0e;
            4'h7: out_low = 8'h0d;
            4'h8: out_low = 8'h0d;
            4'h9: out_low = 8'h0c;
            4'ha: out_low = 8'h0c;
            4'hb: out_low = 8'h0c;
            4'hc: out_low = 8'h0b;
            4'hd: out_low = 8'h0b;
            4'he: out_low = 8'h0a;
            4'hf: out_low = 8'h0a;
            default: out_low = 8'h00;
          endcase
        end
        6'h1e: begin
          case (mant[3:0])
            4'h0: out_low = 8'h0a;
            4'h1: out_low = 8'h09;
            4'h2: out_low = 8'h09;
            4'h3: out_low = 8'h08;
            4'h4: out_low = 8'h08;
            4'h5: out_low = 8'h08;
            4'h6: out_low = 8'h07;
            4'h7: out_low = 8'h07;
            4'h8: out_low = 8'h07;
            4'h9: out_low = 8'h06;
            4'ha: out_low = 8'h06;
            4'hb: out_low = 8'h05;
            4'hc: out_low = 8'h05;
            4'hd: out_low = 8'h05;
            4'he: out_low = 8'h04;
            4'hf: out_low = 8'h04;
            default: out_low = 8'h00;
          endcase
        end
        6'h1f: begin
          case (mant[3:0])
            4'h0: out_low = 8'h03;
            4'h1: out_low = 8'h03;
            4'h2: out_low = 8'h03;
            4'h3: out_low = 8'h02;
            4'h4: out_low = 8'h02;
            4'h5: out_low = 8'h01;
            4'h6: out_low = 8'h01;
            4'h7: out_low = 8'h01;
            4'h8: out_low = 8'h00;
            4'h9: out_low = 8'h00;
            4'ha: out_low = 8'hff;
            4'hb: out_low = 8'hff;
            4'hc: out_low = 8'hff;
            4'hd: out_low = 8'hfe;
            4'he: out_low = 8'hfe;
            4'hf: out_low = 8'hfd;
            default: out_low = 8'h00;
          endcase
        end
        6'h20: begin
          case (mant[3:0])
            4'h0: out_low = 8'hfd;
            4'h1: out_low = 8'hfd;
            4'h2: out_low = 8'hfc;
            4'h3: out_low = 8'hfc;
            4'h4: out_low = 8'hfc;
            4'h5: out_low = 8'hfb;
            4'h6: out_low = 8'hfb;
            4'h7: out_low = 8'hfa;
            4'h8: out_low = 8'hfa;
            4'h9: out_low = 8'hfa;
            4'ha: out_low = 8'hf9;
            4'hb: out_low = 8'hf9;
            4'hc: out_low = 8'hf8;
            4'hd: out_low = 8'hf8;
            4'he: out_low = 8'hf8;
            4'hf: out_low = 8'hf7;
            default: out_low = 8'h00;
          endcase
        end
        6'h21: begin
          case (mant[3:0])
            4'h0: out_low = 8'hf7;
            4'h1: out_low = 8'hf7;
            4'h2: out_low = 8'hf6;
            4'h3: out_low = 8'hf6;
            4'h4: out_low = 8'hf5;
            4'h5: out_low = 8'hf5;
            4'h6: out_low = 8'hf5;
            4'h7: out_low = 8'hf4;
            4'h8: out_low = 8'hf4;
            4'h9: out_low = 8'hf3;
            4'ha: out_low = 8'hf3;
            4'hb: out_low = 8'hf3;
            4'hc: out_low = 8'hf2;
            4'hd: out_low = 8'hf2;
            4'he: out_low = 8'hf2;
            4'hf: out_low = 8'hf1;
            default: out_low = 8'h00;
          endcase
        end
        6'h22: begin
          case (mant[3:0])
            4'h0: out_low = 8'hf1;
            4'h1: out_low = 8'hf0;
            4'h2: out_low = 8'hf0;
            4'h3: out_low = 8'hf0;
            4'h4: out_low = 8'hef;
            4'h5: out_low = 8'hef;
            4'h6: out_low = 8'hef;
            4'h7: out_low = 8'hee;
            4'h8: out_low = 8'hee;
            4'h9: out_low = 8'hed;
            4'ha: out_low = 8'hed;
            4'hb: out_low = 8'hed;
            4'hc: out_low = 8'hec;
            4'hd: out_low = 8'hec;
            4'he: out_low = 8'hec;
            4'hf: out_low = 8'heb;
            default: out_low = 8'h00;
          endcase
        end
        6'h23: begin
          case (mant[3:0])
            4'h0: out_low = 8'heb;
            4'h1: out_low = 8'hea;
            4'h2: out_low = 8'hea;
            4'h3: out_low = 8'hea;
            4'h4: out_low = 8'he9;
            4'h5: out_low = 8'he9;
            4'h6: out_low = 8'he9;
            4'h7: out_low = 8'he8;
            4'h8: out_low = 8'he8;
            4'h9: out_low = 8'he7;
            4'ha: out_low = 8'he7;
            4'hb: out_low = 8'he7;
            4'hc: out_low = 8'he6;
            4'hd: out_low = 8'he6;
            4'he: out_low = 8'he6;
            4'hf: out_low = 8'he5;
            default: out_low = 8'h00;
          endcase
        end
        6'h24: begin
          case (mant[3:0])
            4'h0: out_low = 8'he5;
            4'h1: out_low = 8'he5;
            4'h2: out_low = 8'he4;
            4'h3: out_low = 8'he4;
            4'h4: out_low = 8'he3;
            4'h5: out_low = 8'he3;
            4'h6: out_low = 8'he3;
            4'h7: out_low = 8'he2;
            4'h8: out_low = 8'he2;
            4'h9: out_low = 8'he2;
            4'ha: out_low = 8'he1;
            4'hb: out_low = 8'he1;
            4'hc: out_low = 8'he1;
            4'hd: out_low = 8'he0;
            4'he: out_low = 8'he0;
            4'hf: out_low = 8'hdf;
            default: out_low = 8'h00;
          endcase
        end
        6'h25: begin
          case (mant[3:0])
            4'h0: out_low = 8'hdf;
            4'h1: out_low = 8'hdf;
            4'h2: out_low = 8'hde;
            4'h3: out_low = 8'hde;
            4'h4: out_low = 8'hde;
            4'h5: out_low = 8'hdd;
            4'h6: out_low = 8'hdd;
            4'h7: out_low = 8'hdd;
            4'h8: out_low = 8'hdc;
            4'h9: out_low = 8'hdc;
            4'ha: out_low = 8'hdb;
            4'hb: out_low = 8'hdb;
            4'hc: out_low = 8'hdb;
            4'hd: out_low = 8'hda;
            4'he: out_low = 8'hda;
            4'hf: out_low = 8'hda;
            default: out_low = 8'h00;
          endcase
        end
        6'h26: begin
          case (mant[3:0])
            4'h0: out_low = 8'hd9;
            4'h1: out_low = 8'hd9;
            4'h2: out_low = 8'hd9;
            4'h3: out_low = 8'hd8;
            4'h4: out_low = 8'hd8;
            4'h5: out_low = 8'hd8;
            4'h6: out_low = 8'hd7;
            4'h7: out_low = 8'hd7;
            4'h8: out_low = 8'hd6;
            4'h9: out_low = 8'hd6;
            4'ha: out_low = 8'hd6;
            4'hb: out_low = 8'hd5;
            4'hc: out_low = 8'hd5;
            4'hd: out_low = 8'hd5;
            4'he: out_low = 8'hd4;
            4'hf: out_low = 8'hd4;
            default: out_low = 8'h00;
          endcase
        end
        6'h27: begin
          case (mant[3:0])
            4'h0: out_low = 8'hd4;
            4'h1: out_low = 8'hd3;
            4'h2: out_low = 8'hd3;
            4'h3: out_low = 8'hd3;
            4'h4: out_low = 8'hd2;
            4'h5: out_low = 8'hd2;
            4'h6: out_low = 8'hd1;
            4'h7: out_low = 8'hd1;
            4'h8: out_low = 8'hd1;
            4'h9: out_low = 8'hd0;
            4'ha: out_low = 8'hd0;
            4'hb: out_low = 8'hd0;
            4'hc: out_low = 8'hcf;
            4'hd: out_low = 8'hcf;
            4'he: out_low = 8'hcf;
            4'hf: out_low = 8'hce;
            default: out_low = 8'h00;
          endcase
        end
        6'h28: begin
          case (mant[3:0])
            4'h0: out_low = 8'hce;
            4'h1: out_low = 8'hce;
            4'h2: out_low = 8'hcd;
            4'h3: out_low = 8'hcd;
            4'h4: out_low = 8'hcd;
            4'h5: out_low = 8'hcc;
            4'h6: out_low = 8'hcc;
            4'h7: out_low = 8'hcc;
            4'h8: out_low = 8'hcb;
            4'h9: out_low = 8'hcb;
            4'ha: out_low = 8'hcb;
            4'hb: out_low = 8'hca;
            4'hc: out_low = 8'hca;
            4'hd: out_low = 8'hc9;
            4'he: out_low = 8'hc9;
            4'hf: out_low = 8'hc9;
            default: out_low = 8'h00;
          endcase
        end
        6'h29: begin
          case (mant[3:0])
            4'h0: out_low = 8'hc8;
            4'h1: out_low = 8'hc8;
            4'h2: out_low = 8'hc8;
            4'h3: out_low = 8'hc7;
            4'h4: out_low = 8'hc7;
            4'h5: out_low = 8'hc7;
            4'h6: out_low = 8'hc6;
            4'h7: out_low = 8'hc6;
            4'h8: out_low = 8'hc6;
            4'h9: out_low = 8'hc5;
            4'ha: out_low = 8'hc5;
            4'hb: out_low = 8'hc5;
            4'hc: out_low = 8'hc4;
            4'hd: out_low = 8'hc4;
            4'he: out_low = 8'hc4;
            4'hf: out_low = 8'hc3;
            default: out_low = 8'h00;
          endcase
        end
        6'h2a: begin
          case (mant[3:0])
            4'h0: out_low = 8'hc3;
            4'h1: out_low = 8'hc3;
            4'h2: out_low = 8'hc2;
            4'h3: out_low = 8'hc2;
            4'h4: out_low = 8'hc2;
            4'h5: out_low = 8'hc1;
            4'h6: out_low = 8'hc1;
            4'h7: out_low = 8'hc1;
            4'h8: out_low = 8'hc0;
            4'h9: out_low = 8'hc0;
            4'ha: out_low = 8'hc0;
            4'hb: out_low = 8'hbf;
            4'hc: out_low = 8'hbf;
            4'hd: out_low = 8'hbf;
            4'he: out_low = 8'hbe;
            4'hf: out_low = 8'hbe;
            default: out_low = 8'h00;
          endcase
        end
        6'h2b: begin
          case (mant[3:0])
            4'h0: out_low = 8'hbe;
            4'h1: out_low = 8'hbd;
            4'h2: out_low = 8'hbd;
            4'h3: out_low = 8'hbd;
            4'h4: out_low = 8'hbc;
            4'h5: out_low = 8'hbc;
            4'h6: out_low = 8'hbc;
            4'h7: out_low = 8'hbb;
            4'h8: out_low = 8'hbb;
            4'h9: out_low = 8'hbb;
            4'ha: out_low = 8'hba;
            4'hb: out_low = 8'hba;
            4'hc: out_low = 8'hba;
            4'hd: out_low = 8'hb9;
            4'he: out_low = 8'hb9;
            4'hf: out_low = 8'hb9;
            default: out_low = 8'h00;
          endcase
        end
        6'h2c: begin
          case (mant[3:0])
            4'h0: out_low = 8'hb8;
            4'h1: out_low = 8'hb8;
            4'h2: out_low = 8'hb8;
            4'h3: out_low = 8'hb7;
            4'h4: out_low = 8'hb7;
            4'h5: out_low = 8'hb7;
            4'h6: out_low = 8'hb6;
            4'h7: out_low = 8'hb6;
            4'h8: out_low = 8'hb6;
            4'h9: out_low = 8'hb5;
            4'ha: out_low = 8'hb5;
            4'hb: out_low = 8'hb5;
            4'hc: out_low = 8'hb4;
            4'hd: out_low = 8'hb4;
            4'he: out_low = 8'hb4;
            4'hf: out_low = 8'hb3;
            default: out_low = 8'h00;
          endcase
        end
        6'h2d: begin
          case (mant[3:0])
            4'h0: out_low = 8'hb3;
            4'h1: out_low = 8'hb3;
            4'h2: out_low = 8'hb2;
            4'h3: out_low = 8'hb2;
            4'h4: out_low = 8'hb2;
            4'h5: out_low = 8'hb1;
            4'h6: out_low = 8'hb1;
            4'h7: out_low = 8'hb1;
            4'h8: out_low = 8'hb0;
            4'h9: out_low = 8'hb0;
            4'ha: out_low = 8'hb0;
            4'hb: out_low = 8'haf;
            4'hc: out_low = 8'haf;
            4'hd: out_low = 8'haf;
            4'he: out_low = 8'hae;
            4'hf: out_low = 8'hae;
            default: out_low = 8'h00;
          endcase
        end
        6'h2e: begin
          case (mant[3:0])
            4'h0: out_low = 8'hae;
            4'h1: out_low = 8'had;
            4'h2: out_low = 8'had;
            4'h3: out_low = 8'had;
            4'h4: out_low = 8'hac;
            4'h5: out_low = 8'hac;
            4'h6: out_low = 8'hac;
            4'h7: out_low = 8'hab;
            4'h8: out_low = 8'hab;
            4'h9: out_low = 8'hab;
            4'ha: out_low = 8'haa;
            4'hb: out_low = 8'haa;
            4'hc: out_low = 8'haa;
            4'hd: out_low = 8'haa;
            4'he: out_low = 8'ha9;
            4'hf: out_low = 8'ha9;
            default: out_low = 8'h00;
          endcase
        end
        6'h2f: begin
          case (mant[3:0])
            4'h0: out_low = 8'ha9;
            4'h1: out_low = 8'ha8;
            4'h2: out_low = 8'ha8;
            4'h3: out_low = 8'ha8;
            4'h4: out_low = 8'ha7;
            4'h5: out_low = 8'ha7;
            4'h6: out_low = 8'ha7;
            4'h7: out_low = 8'ha6;
            4'h8: out_low = 8'ha6;
            4'h9: out_low = 8'ha6;
            4'ha: out_low = 8'ha5;
            4'hb: out_low = 8'ha5;
            4'hc: out_low = 8'ha5;
            4'hd: out_low = 8'ha4;
            4'he: out_low = 8'ha4;
            4'hf: out_low = 8'ha4;
            default: out_low = 8'h00;
          endcase
        end
        6'h30: begin
          case (mant[3:0])
            4'h0: out_low = 8'ha3;
            4'h1: out_low = 8'ha3;
            4'h2: out_low = 8'ha3;
            4'h3: out_low = 8'ha3;
            4'h4: out_low = 8'ha2;
            4'h5: out_low = 8'ha2;
            4'h6: out_low = 8'ha2;
            4'h7: out_low = 8'ha1;
            4'h8: out_low = 8'ha1;
            4'h9: out_low = 8'ha1;
            4'ha: out_low = 8'ha0;
            4'hb: out_low = 8'ha0;
            4'hc: out_low = 8'ha0;
            4'hd: out_low = 8'h9f;
            4'he: out_low = 8'h9f;
            4'hf: out_low = 8'h9f;
            default: out_low = 8'h00;
          endcase
        end
        6'h31: begin
          case (mant[3:0])
            4'h0: out_low = 8'h9e;
            4'h1: out_low = 8'h9e;
            4'h2: out_low = 8'h9e;
            4'h3: out_low = 8'h9e;
            4'h4: out_low = 8'h9d;
            4'h5: out_low = 8'h9d;
            4'h6: out_low = 8'h9d;
            4'h7: out_low = 8'h9c;
            4'h8: out_low = 8'h9c;
            4'h9: out_low = 8'h9c;
            4'ha: out_low = 8'h9b;
            4'hb: out_low = 8'h9b;
            4'hc: out_low = 8'h9b;
            4'hd: out_low = 8'h9a;
            4'he: out_low = 8'h9a;
            4'hf: out_low = 8'h9a;
            default: out_low = 8'h00;
          endcase
        end
        6'h32: begin
          case (mant[3:0])
            4'h0: out_low = 8'h99;
            4'h1: out_low = 8'h99;
            4'h2: out_low = 8'h99;
            4'h3: out_low = 8'h99;
            4'h4: out_low = 8'h98;
            4'h5: out_low = 8'h98;
            4'h6: out_low = 8'h98;
            4'h7: out_low = 8'h97;
            4'h8: out_low = 8'h97;
            4'h9: out_low = 8'h97;
            4'ha: out_low = 8'h96;
            4'hb: out_low = 8'h96;
            4'hc: out_low = 8'h96;
            4'hd: out_low = 8'h95;
            4'he: out_low = 8'h95;
            4'hf: out_low = 8'h95;
            default: out_low = 8'h00;
          endcase
        end
        6'h33: begin
          case (mant[3:0])
            4'h0: out_low = 8'h95;
            4'h1: out_low = 8'h94;
            4'h2: out_low = 8'h94;
            4'h3: out_low = 8'h94;
            4'h4: out_low = 8'h93;
            4'h5: out_low = 8'h93;
            4'h6: out_low = 8'h93;
            4'h7: out_low = 8'h92;
            4'h8: out_low = 8'h92;
            4'h9: out_low = 8'h92;
            4'ha: out_low = 8'h92;
            4'hb: out_low = 8'h91;
            4'hc: out_low = 8'h91;
            4'hd: out_low = 8'h91;
            4'he: out_low = 8'h90;
            4'hf: out_low = 8'h90;
            default: out_low = 8'h00;
          endcase
        end
        6'h34: begin
          case (mant[3:0])
            4'h0: out_low = 8'h90;
            4'h1: out_low = 8'h8f;
            4'h2: out_low = 8'h8f;
            4'h3: out_low = 8'h8f;
            4'h4: out_low = 8'h8f;
            4'h5: out_low = 8'h8e;
            4'h6: out_low = 8'h8e;
            4'h7: out_low = 8'h8e;
            4'h8: out_low = 8'h8d;
            4'h9: out_low = 8'h8d;
            4'ha: out_low = 8'h8d;
            4'hb: out_low = 8'h8c;
            4'hc: out_low = 8'h8c;
            4'hd: out_low = 8'h8c;
            4'he: out_low = 8'h8c;
            4'hf: out_low = 8'h8b;
            default: out_low = 8'h00;
          endcase
        end
        6'h35: begin
          case (mant[3:0])
            4'h0: out_low = 8'h8b;
            4'h1: out_low = 8'h8b;
            4'h2: out_low = 8'h8a;
            4'h3: out_low = 8'h8a;
            4'h4: out_low = 8'h8a;
            4'h5: out_low = 8'h89;
            4'h6: out_low = 8'h89;
            4'h7: out_low = 8'h89;
            4'h8: out_low = 8'h89;
            4'h9: out_low = 8'h88;
            4'ha: out_low = 8'h88;
            4'hb: out_low = 8'h88;
            4'hc: out_low = 8'h87;
            4'hd: out_low = 8'h87;
            4'he: out_low = 8'h87;
            4'hf: out_low = 8'h86;
            default: out_low = 8'h00;
          endcase
        end
        6'h36: begin
          case (mant[3:0])
            4'h0: out_low = 8'h86;
            4'h1: out_low = 8'h86;
            4'h2: out_low = 8'h86;
            4'h3: out_low = 8'h85;
            4'h4: out_low = 8'h85;
            4'h5: out_low = 8'h85;
            4'h6: out_low = 8'h84;
            4'h7: out_low = 8'h84;
            4'h8: out_low = 8'h84;
            4'h9: out_low = 8'h84;
            4'ha: out_low = 8'h83;
            4'hb: out_low = 8'h83;
            4'hc: out_low = 8'h83;
            4'hd: out_low = 8'h82;
            4'he: out_low = 8'h82;
            4'hf: out_low = 8'h82;
            default: out_low = 8'h00;
          endcase
        end
        6'h37: begin
          case (mant[3:0])
            4'h0: out_low = 8'h81;
            4'h1: out_low = 8'h81;
            4'h2: out_low = 8'h81;
            4'h3: out_low = 8'h81;
            4'h4: out_low = 8'h80;
            4'h5: out_low = 8'h80;
            4'h6: out_low = 8'h80;
            4'h7: out_low = 8'h7f;
            4'h8: out_low = 8'h7f;
            4'h9: out_low = 8'h7f;
            4'ha: out_low = 8'h7f;
            4'hb: out_low = 8'h7e;
            4'hc: out_low = 8'h7e;
            4'hd: out_low = 8'h7e;
            4'he: out_low = 8'h7d;
            4'hf: out_low = 8'h7d;
            default: out_low = 8'h00;
          endcase
        end
        6'h38: begin
          case (mant[3:0])
            4'h0: out_low = 8'h7d;
            4'h1: out_low = 8'h7d;
            4'h2: out_low = 8'h7c;
            4'h3: out_low = 8'h7c;
            4'h4: out_low = 8'h7c;
            4'h5: out_low = 8'h7b;
            4'h6: out_low = 8'h7b;
            4'h7: out_low = 8'h7b;
            4'h8: out_low = 8'h7b;
            4'h9: out_low = 8'h7a;
            4'ha: out_low = 8'h7a;
            4'hb: out_low = 8'h7a;
            4'hc: out_low = 8'h79;
            4'hd: out_low = 8'h79;
            4'he: out_low = 8'h79;
            4'hf: out_low = 8'h79;
            default: out_low = 8'h00;
          endcase
        end
        6'h39: begin
          case (mant[3:0])
            4'h0: out_low = 8'h78;
            4'h1: out_low = 8'h78;
            4'h2: out_low = 8'h78;
            4'h3: out_low = 8'h77;
            4'h4: out_low = 8'h77;
            4'h5: out_low = 8'h77;
            4'h6: out_low = 8'h77;
            4'h7: out_low = 8'h76;
            4'h8: out_low = 8'h76;
            4'h9: out_low = 8'h76;
            4'ha: out_low = 8'h75;
            4'hb: out_low = 8'h75;
            4'hc: out_low = 8'h75;
            4'hd: out_low = 8'h75;
            4'he: out_low = 8'h74;
            4'hf: out_low = 8'h74;
            default: out_low = 8'h00;
          endcase
        end
        6'h3a: begin
          case (mant[3:0])
            4'h0: out_low = 8'h74;
            4'h1: out_low = 8'h73;
            4'h2: out_low = 8'h73;
            4'h3: out_low = 8'h73;
            4'h4: out_low = 8'h73;
            4'h5: out_low = 8'h72;
            4'h6: out_low = 8'h72;
            4'h7: out_low = 8'h72;
            4'h8: out_low = 8'h71;
            4'h9: out_low = 8'h71;
            4'ha: out_low = 8'h71;
            4'hb: out_low = 8'h71;
            4'hc: out_low = 8'h70;
            4'hd: out_low = 8'h70;
            4'he: out_low = 8'h70;
            4'hf: out_low = 8'h70;
            default: out_low = 8'h00;
          endcase
        end
        6'h3b: begin
          case (mant[3:0])
            4'h0: out_low = 8'h6f;
            4'h1: out_low = 8'h6f;
            4'h2: out_low = 8'h6f;
            4'h3: out_low = 8'h6e;
            4'h4: out_low = 8'h6e;
            4'h5: out_low = 8'h6e;
            4'h6: out_low = 8'h6e;
            4'h7: out_low = 8'h6d;
            4'h8: out_low = 8'h6d;
            4'h9: out_low = 8'h6d;
            4'ha: out_low = 8'h6c;
            4'hb: out_low = 8'h6c;
            4'hc: out_low = 8'h6c;
            4'hd: out_low = 8'h6c;
            4'he: out_low = 8'h6b;
            4'hf: out_low = 8'h6b;
            default: out_low = 8'h00;
          endcase
        end
        6'h3c: begin
          case (mant[3:0])
            4'h0: out_low = 8'h6b;
            4'h1: out_low = 8'h6b;
            4'h2: out_low = 8'h6a;
            4'h3: out_low = 8'h6a;
            4'h4: out_low = 8'h6a;
            4'h5: out_low = 8'h69;
            4'h6: out_low = 8'h69;
            4'h7: out_low = 8'h69;
            4'h8: out_low = 8'h69;
            4'h9: out_low = 8'h68;
            4'ha: out_low = 8'h68;
            4'hb: out_low = 8'h68;
            4'hc: out_low = 8'h67;
            4'hd: out_low = 8'h67;
            4'he: out_low = 8'h67;
            4'hf: out_low = 8'h67;
            default: out_low = 8'h00;
          endcase
        end
        6'h3d: begin
          case (mant[3:0])
            4'h0: out_low = 8'h66;
            4'h1: out_low = 8'h66;
            4'h2: out_low = 8'h66;
            4'h3: out_low = 8'h66;
            4'h4: out_low = 8'h65;
            4'h5: out_low = 8'h65;
            4'h6: out_low = 8'h65;
            4'h7: out_low = 8'h64;
            4'h8: out_low = 8'h64;
            4'h9: out_low = 8'h64;
            4'ha: out_low = 8'h64;
            4'hb: out_low = 8'h63;
            4'hc: out_low = 8'h63;
            4'hd: out_low = 8'h63;
            4'he: out_low = 8'h63;
            4'hf: out_low = 8'h62;
            default: out_low = 8'h00;
          endcase
        end
        6'h3e: begin
          case (mant[3:0])
            4'h0: out_low = 8'h62;
            4'h1: out_low = 8'h62;
            4'h2: out_low = 8'h62;
            4'h3: out_low = 8'h61;
            4'h4: out_low = 8'h61;
            4'h5: out_low = 8'h61;
            4'h6: out_low = 8'h60;
            4'h7: out_low = 8'h60;
            4'h8: out_low = 8'h60;
            4'h9: out_low = 8'h60;
            4'ha: out_low = 8'h5f;
            4'hb: out_low = 8'h5f;
            4'hc: out_low = 8'h5f;
            4'hd: out_low = 8'h5f;
            4'he: out_low = 8'h5e;
            4'hf: out_low = 8'h5e;
            default: out_low = 8'h00;
          endcase
        end
        6'h3f: begin
          case (mant[3:0])
            4'h0: out_low = 8'h5e;
            4'h1: out_low = 8'h5d;
            4'h2: out_low = 8'h5d;
            4'h3: out_low = 8'h5d;
            4'h4: out_low = 8'h5d;
            4'h5: out_low = 8'h5c;
            4'h6: out_low = 8'h5c;
            4'h7: out_low = 8'h5c;
            4'h8: out_low = 8'h5c;
            4'h9: out_low = 8'h5b;
            4'ha: out_low = 8'h5b;
            4'hb: out_low = 8'h5b;
            4'hc: out_low = 8'h5b;
            4'hd: out_low = 8'h5a;
            4'he: out_low = 8'h5a;
            4'hf: out_low = 8'h5a;
            default: out_low = 8'h00;
          endcase
        end
        default: out_low = 8'h00;
      endcase
      end
      2'h1: begin
      case (mant[9:4])
        6'h00: begin
          case (mant[3:0])
            4'h0: out_low = 8'h59;
            4'h1: out_low = 8'h59;
            4'h2: out_low = 8'h58;
            4'h3: out_low = 8'h58;
            4'h4: out_low = 8'h57;
            4'h5: out_low = 8'h57;
            4'h6: out_low = 8'h56;
            4'h7: out_low = 8'h56;
            4'h8: out_low = 8'h55;
            4'h9: out_low = 8'h55;
            4'ha: out_low = 8'h54;
            4'hb: out_low = 8'h54;
            4'hc: out_low = 8'h53;
            4'hd: out_low = 8'h53;
            4'he: out_low = 8'h52;
            4'hf: out_low = 8'h52;
            default: out_low = 8'h00;
          endcase
        end
        6'h01: begin
          case (mant[3:0])
            4'h0: out_low = 8'h51;
            4'h1: out_low = 8'h51;
            4'h2: out_low = 8'h50;
            4'h3: out_low = 8'h50;
            4'h4: out_low = 8'h4f;
            4'h5: out_low = 8'h4f;
            4'h6: out_low = 8'h4e;
            4'h7: out_low = 8'h4e;
            4'h8: out_low = 8'h4d;
            4'h9: out_low = 8'h4c;
            4'ha: out_low = 8'h4c;
            4'hb: out_low = 8'h4b;
            4'hc: out_low = 8'h4b;
            4'hd: out_low = 8'h4a;
            4'he: out_low = 8'h4a;
            4'hf: out_low = 8'h49;
            default: out_low = 8'h00;
          endcase
        end
        6'h02: begin
          case (mant[3:0])
            4'h0: out_low = 8'h49;
            4'h1: out_low = 8'h48;
            4'h2: out_low = 8'h48;
            4'h3: out_low = 8'h47;
            4'h4: out_low = 8'h47;
            4'h5: out_low = 8'h46;
            4'h6: out_low = 8'h46;
            4'h7: out_low = 8'h45;
            4'h8: out_low = 8'h45;
            4'h9: out_low = 8'h44;
            4'ha: out_low = 8'h44;
            4'hb: out_low = 8'h43;
            4'hc: out_low = 8'h43;
            4'hd: out_low = 8'h42;
            4'he: out_low = 8'h42;
            4'hf: out_low = 8'h41;
            default: out_low = 8'h00;
          endcase
        end
        6'h03: begin
          case (mant[3:0])
            4'h0: out_low = 8'h41;
            4'h1: out_low = 8'h40;
            4'h2: out_low = 8'h40;
            4'h3: out_low = 8'h3f;
            4'h4: out_low = 8'h3f;
            4'h5: out_low = 8'h3e;
            4'h6: out_low = 8'h3e;
            4'h7: out_low = 8'h3d;
            4'h8: out_low = 8'h3d;
            4'h9: out_low = 8'h3c;
            4'ha: out_low = 8'h3c;
            4'hb: out_low = 8'h3b;
            4'hc: out_low = 8'h3b;
            4'hd: out_low = 8'h3a;
            4'he: out_low = 8'h3a;
            4'hf: out_low = 8'h39;
            default: out_low = 8'h00;
          endcase
        end
        6'h04: begin
          case (mant[3:0])
            4'h0: out_low = 8'h39;
            4'h1: out_low = 8'h38;
            4'h2: out_low = 8'h38;
            4'h3: out_low = 8'h38;
            4'h4: out_low = 8'h37;
            4'h5: out_low = 8'h37;
            4'h6: out_low = 8'h36;
            4'h7: out_low = 8'h36;
            4'h8: out_low = 8'h35;
            4'h9: out_low = 8'h35;
            4'ha: out_low = 8'h34;
            4'hb: out_low = 8'h34;
            4'hc: out_low = 8'h33;
            4'hd: out_low = 8'h33;
            4'he: out_low = 8'h32;
            4'hf: out_low = 8'h32;
            default: out_low = 8'h00;
          endcase
        end
        6'h05: begin
          case (mant[3:0])
            4'h0: out_low = 8'h31;
            4'h1: out_low = 8'h31;
            4'h2: out_low = 8'h30;
            4'h3: out_low = 8'h30;
            4'h4: out_low = 8'h2f;
            4'h5: out_low = 8'h2f;
            4'h6: out_low = 8'h2e;
            4'h7: out_low = 8'h2e;
            4'h8: out_low = 8'h2d;
            4'h9: out_low = 8'h2d;
            4'ha: out_low = 8'h2c;
            4'hb: out_low = 8'h2c;
            4'hc: out_low = 8'h2c;
            4'hd: out_low = 8'h2b;
            4'he: out_low = 8'h2b;
            4'hf: out_low = 8'h2a;
            default: out_low = 8'h00;
          endcase
        end
        6'h06: begin
          case (mant[3:0])
            4'h0: out_low = 8'h2a;
            4'h1: out_low = 8'h29;
            4'h2: out_low = 8'h29;
            4'h3: out_low = 8'h28;
            4'h4: out_low = 8'h28;
            4'h5: out_low = 8'h27;
            4'h6: out_low = 8'h27;
            4'h7: out_low = 8'h26;
            4'h8: out_low = 8'h26;
            4'h9: out_low = 8'h25;
            4'ha: out_low = 8'h25;
            4'hb: out_low = 8'h25;
            4'hc: out_low = 8'h24;
            4'hd: out_low = 8'h24;
            4'he: out_low = 8'h23;
            4'hf: out_low = 8'h23;
            default: out_low = 8'h00;
          endcase
        end
        6'h07: begin
          case (mant[3:0])
            4'h0: out_low = 8'h22;
            4'h1: out_low = 8'h22;
            4'h2: out_low = 8'h21;
            4'h3: out_low = 8'h21;
            4'h4: out_low = 8'h20;
            4'h5: out_low = 8'h20;
            4'h6: out_low = 8'h1f;
            4'h7: out_low = 8'h1f;
            4'h8: out_low = 8'h1f;
            4'h9: out_low = 8'h1e;
            4'ha: out_low = 8'h1e;
            4'hb: out_low = 8'h1d;
            4'hc: out_low = 8'h1d;
            4'hd: out_low = 8'h1c;
            4'he: out_low = 8'h1c;
            4'hf: out_low = 8'h1b;
            default: out_low = 8'h00;
          endcase
        end
        6'h08: begin
          case (mant[3:0])
            4'h0: out_low = 8'h1b;
            4'h1: out_low = 8'h1a;
            4'h2: out_low = 8'h1a;
            4'h3: out_low = 8'h1a;
            4'h4: out_low = 8'h19;
            4'h5: out_low = 8'h19;
            4'h6: out_low = 8'h18;
            4'h7: out_low = 8'h18;
            4'h8: out_low = 8'h17;
            4'h9: out_low = 8'h17;
            4'ha: out_low = 8'h16;
            4'hb: out_low = 8'h16;
            4'hc: out_low = 8'h16;
            4'hd: out_low = 8'h15;
            4'he: out_low = 8'h15;
            4'hf: out_low = 8'h14;
            default: out_low = 8'h00;
          endcase
        end
        6'h09: begin
          case (mant[3:0])
            4'h0: out_low = 8'h14;
            4'h1: out_low = 8'h13;
            4'h2: out_low = 8'h13;
            4'h3: out_low = 8'h12;
            4'h4: out_low = 8'h12;
            4'h5: out_low = 8'h12;
            4'h6: out_low = 8'h11;
            4'h7: out_low = 8'h11;
            4'h8: out_low = 8'h10;
            4'h9: out_low = 8'h10;
            4'ha: out_low = 8'h0f;
            4'hb: out_low = 8'h0f;
            4'hc: out_low = 8'h0e;
            4'hd: out_low = 8'h0e;
            4'he: out_low = 8'h0e;
            4'hf: out_low = 8'h0d;
            default: out_low = 8'h00;
          endcase
        end
        6'h0a: begin
          case (mant[3:0])
            4'h0: out_low = 8'h0d;
            4'h1: out_low = 8'h0c;
            4'h2: out_low = 8'h0c;
            4'h3: out_low = 8'h0b;
            4'h4: out_low = 8'h0b;
            4'h5: out_low = 8'h0b;
            4'h6: out_low = 8'h0a;
            4'h7: out_low = 8'h0a;
            4'h8: out_low = 8'h09;
            4'h9: out_low = 8'h09;
            4'ha: out_low = 8'h08;
            4'hb: out_low = 8'h08;
            4'hc: out_low = 8'h08;
            4'hd: out_low = 8'h07;
            4'he: out_low = 8'h07;
            4'hf: out_low = 8'h06;
            default: out_low = 8'h00;
          endcase
        end
        6'h0b: begin
          case (mant[3:0])
            4'h0: out_low = 8'h06;
            4'h1: out_low = 8'h05;
            4'h2: out_low = 8'h05;
            4'h3: out_low = 8'h05;
            4'h4: out_low = 8'h04;
            4'h5: out_low = 8'h04;
            4'h6: out_low = 8'h03;
            4'h7: out_low = 8'h03;
            4'h8: out_low = 8'h02;
            4'h9: out_low = 8'h02;
            4'ha: out_low = 8'h02;
            4'hb: out_low = 8'h01;
            4'hc: out_low = 8'h01;
            4'hd: out_low = 8'h00;
            4'he: out_low = 8'h00;
            4'hf: out_low = 8'hff;
            default: out_low = 8'h00;
          endcase
        end
        6'h0c: begin
          case (mant[3:0])
            4'h0: out_low = 8'hff;
            4'h1: out_low = 8'hff;
            4'h2: out_low = 8'hfe;
            4'h3: out_low = 8'hfe;
            4'h4: out_low = 8'hfd;
            4'h5: out_low = 8'hfd;
            4'h6: out_low = 8'hfc;
            4'h7: out_low = 8'hfc;
            4'h8: out_low = 8'hfc;
            4'h9: out_low = 8'hfb;
            4'ha: out_low = 8'hfb;
            4'hb: out_low = 8'hfa;
            4'hc: out_low = 8'hfa;
            4'hd: out_low = 8'hfa;
            4'he: out_low = 8'hf9;
            4'hf: out_low = 8'hf9;
            default: out_low = 8'h00;
          endcase
        end
        6'h0d: begin
          case (mant[3:0])
            4'h0: out_low = 8'hf8;
            4'h1: out_low = 8'hf8;
            4'h2: out_low = 8'hf8;
            4'h3: out_low = 8'hf7;
            4'h4: out_low = 8'hf7;
            4'h5: out_low = 8'hf6;
            4'h6: out_low = 8'hf6;
            4'h7: out_low = 8'hf5;
            4'h8: out_low = 8'hf5;
            4'h9: out_low = 8'hf5;
            4'ha: out_low = 8'hf4;
            4'hb: out_low = 8'hf4;
            4'hc: out_low = 8'hf3;
            4'hd: out_low = 8'hf3;
            4'he: out_low = 8'hf3;
            4'hf: out_low = 8'hf2;
            default: out_low = 8'h00;
          endcase
        end
        6'h0e: begin
          case (mant[3:0])
            4'h0: out_low = 8'hf2;
            4'h1: out_low = 8'hf1;
            4'h2: out_low = 8'hf1;
            4'h3: out_low = 8'hf1;
            4'h4: out_low = 8'hf0;
            4'h5: out_low = 8'hf0;
            4'h6: out_low = 8'hef;
            4'h7: out_low = 8'hef;
            4'h8: out_low = 8'hef;
            4'h9: out_low = 8'hee;
            4'ha: out_low = 8'hee;
            4'hb: out_low = 8'hed;
            4'hc: out_low = 8'hed;
            4'hd: out_low = 8'hed;
            4'he: out_low = 8'hec;
            4'hf: out_low = 8'hec;
            default: out_low = 8'h00;
          endcase
        end
        6'h0f: begin
          case (mant[3:0])
            4'h0: out_low = 8'heb;
            4'h1: out_low = 8'heb;
            4'h2: out_low = 8'heb;
            4'h3: out_low = 8'hea;
            4'h4: out_low = 8'hea;
            4'h5: out_low = 8'he9;
            4'h6: out_low = 8'he9;
            4'h7: out_low = 8'he9;
            4'h8: out_low = 8'he8;
            4'h9: out_low = 8'he8;
            4'ha: out_low = 8'he7;
            4'hb: out_low = 8'he7;
            4'hc: out_low = 8'he7;
            4'hd: out_low = 8'he6;
            4'he: out_low = 8'he6;
            4'hf: out_low = 8'he5;
            default: out_low = 8'h00;
          endcase
        end
        6'h10: begin
          case (mant[3:0])
            4'h0: out_low = 8'he5;
            4'h1: out_low = 8'he5;
            4'h2: out_low = 8'he4;
            4'h3: out_low = 8'he4;
            4'h4: out_low = 8'he3;
            4'h5: out_low = 8'he3;
            4'h6: out_low = 8'he3;
            4'h7: out_low = 8'he2;
            4'h8: out_low = 8'he2;
            4'h9: out_low = 8'he1;
            4'ha: out_low = 8'he1;
            4'hb: out_low = 8'he1;
            4'hc: out_low = 8'he0;
            4'hd: out_low = 8'he0;
            4'he: out_low = 8'he0;
            4'hf: out_low = 8'hdf;
            default: out_low = 8'h00;
          endcase
        end
        6'h11: begin
          case (mant[3:0])
            4'h0: out_low = 8'hdf;
            4'h1: out_low = 8'hde;
            4'h2: out_low = 8'hde;
            4'h3: out_low = 8'hde;
            4'h4: out_low = 8'hdd;
            4'h5: out_low = 8'hdd;
            4'h6: out_low = 8'hdc;
            4'h7: out_low = 8'hdc;
            4'h8: out_low = 8'hdc;
            4'h9: out_low = 8'hdb;
            4'ha: out_low = 8'hdb;
            4'hb: out_low = 8'hdb;
            4'hc: out_low = 8'hda;
            4'hd: out_low = 8'hda;
            4'he: out_low = 8'hd9;
            4'hf: out_low = 8'hd9;
            default: out_low = 8'h00;
          endcase
        end
        6'h12: begin
          case (mant[3:0])
            4'h0: out_low = 8'hd9;
            4'h1: out_low = 8'hd8;
            4'h2: out_low = 8'hd8;
            4'h3: out_low = 8'hd7;
            4'h4: out_low = 8'hd7;
            4'h5: out_low = 8'hd7;
            4'h6: out_low = 8'hd6;
            4'h7: out_low = 8'hd6;
            4'h8: out_low = 8'hd6;
            4'h9: out_low = 8'hd5;
            4'ha: out_low = 8'hd5;
            4'hb: out_low = 8'hd4;
            4'hc: out_low = 8'hd4;
            4'hd: out_low = 8'hd4;
            4'he: out_low = 8'hd3;
            4'hf: out_low = 8'hd3;
            default: out_low = 8'h00;
          endcase
        end
        6'h13: begin
          case (mant[3:0])
            4'h0: out_low = 8'hd3;
            4'h1: out_low = 8'hd2;
            4'h2: out_low = 8'hd2;
            4'h3: out_low = 8'hd1;
            4'h4: out_low = 8'hd1;
            4'h5: out_low = 8'hd1;
            4'h6: out_low = 8'hd0;
            4'h7: out_low = 8'hd0;
            4'h8: out_low = 8'hd0;
            4'h9: out_low = 8'hcf;
            4'ha: out_low = 8'hcf;
            4'hb: out_low = 8'hce;
            4'hc: out_low = 8'hce;
            4'hd: out_low = 8'hce;
            4'he: out_low = 8'hcd;
            4'hf: out_low = 8'hcd;
            default: out_low = 8'h00;
          endcase
        end
        6'h14: begin
          case (mant[3:0])
            4'h0: out_low = 8'hcd;
            4'h1: out_low = 8'hcc;
            4'h2: out_low = 8'hcc;
            4'h3: out_low = 8'hcc;
            4'h4: out_low = 8'hcb;
            4'h5: out_low = 8'hcb;
            4'h6: out_low = 8'hca;
            4'h7: out_low = 8'hca;
            4'h8: out_low = 8'hca;
            4'h9: out_low = 8'hc9;
            4'ha: out_low = 8'hc9;
            4'hb: out_low = 8'hc9;
            4'hc: out_low = 8'hc8;
            4'hd: out_low = 8'hc8;
            4'he: out_low = 8'hc8;
            4'hf: out_low = 8'hc7;
            default: out_low = 8'h00;
          endcase
        end
        6'h15: begin
          case (mant[3:0])
            4'h0: out_low = 8'hc7;
            4'h1: out_low = 8'hc6;
            4'h2: out_low = 8'hc6;
            4'h3: out_low = 8'hc6;
            4'h4: out_low = 8'hc5;
            4'h5: out_low = 8'hc5;
            4'h6: out_low = 8'hc5;
            4'h7: out_low = 8'hc4;
            4'h8: out_low = 8'hc4;
            4'h9: out_low = 8'hc4;
            4'ha: out_low = 8'hc3;
            4'hb: out_low = 8'hc3;
            4'hc: out_low = 8'hc2;
            4'hd: out_low = 8'hc2;
            4'he: out_low = 8'hc2;
            4'hf: out_low = 8'hc1;
            default: out_low = 8'h00;
          endcase
        end
        6'h16: begin
          case (mant[3:0])
            4'h0: out_low = 8'hc1;
            4'h1: out_low = 8'hc1;
            4'h2: out_low = 8'hc0;
            4'h3: out_low = 8'hc0;
            4'h4: out_low = 8'hc0;
            4'h5: out_low = 8'hbf;
            4'h6: out_low = 8'hbf;
            4'h7: out_low = 8'hbf;
            4'h8: out_low = 8'hbe;
            4'h9: out_low = 8'hbe;
            4'ha: out_low = 8'hbd;
            4'hb: out_low = 8'hbd;
            4'hc: out_low = 8'hbd;
            4'hd: out_low = 8'hbc;
            4'he: out_low = 8'hbc;
            4'hf: out_low = 8'hbc;
            default: out_low = 8'h00;
          endcase
        end
        6'h17: begin
          case (mant[3:0])
            4'h0: out_low = 8'hbb;
            4'h1: out_low = 8'hbb;
            4'h2: out_low = 8'hbb;
            4'h3: out_low = 8'hba;
            4'h4: out_low = 8'hba;
            4'h5: out_low = 8'hba;
            4'h6: out_low = 8'hb9;
            4'h7: out_low = 8'hb9;
            4'h8: out_low = 8'hb9;
            4'h9: out_low = 8'hb8;
            4'ha: out_low = 8'hb8;
            4'hb: out_low = 8'hb8;
            4'hc: out_low = 8'hb7;
            4'hd: out_low = 8'hb7;
            4'he: out_low = 8'hb6;
            4'hf: out_low = 8'hb6;
            default: out_low = 8'h00;
          endcase
        end
        6'h18: begin
          case (mant[3:0])
            4'h0: out_low = 8'hb6;
            4'h1: out_low = 8'hb5;
            4'h2: out_low = 8'hb5;
            4'h3: out_low = 8'hb5;
            4'h4: out_low = 8'hb4;
            4'h5: out_low = 8'hb4;
            4'h6: out_low = 8'hb4;
            4'h7: out_low = 8'hb3;
            4'h8: out_low = 8'hb3;
            4'h9: out_low = 8'hb3;
            4'ha: out_low = 8'hb2;
            4'hb: out_low = 8'hb2;
            4'hc: out_low = 8'hb2;
            4'hd: out_low = 8'hb1;
            4'he: out_low = 8'hb1;
            4'hf: out_low = 8'hb1;
            default: out_low = 8'h00;
          endcase
        end
        6'h19: begin
          case (mant[3:0])
            4'h0: out_low = 8'hb0;
            4'h1: out_low = 8'hb0;
            4'h2: out_low = 8'hb0;
            4'h3: out_low = 8'haf;
            4'h4: out_low = 8'haf;
            4'h5: out_low = 8'haf;
            4'h6: out_low = 8'hae;
            4'h7: out_low = 8'hae;
            4'h8: out_low = 8'hae;
            4'h9: out_low = 8'had;
            4'ha: out_low = 8'had;
            4'hb: out_low = 8'had;
            4'hc: out_low = 8'hac;
            4'hd: out_low = 8'hac;
            4'he: out_low = 8'hac;
            4'hf: out_low = 8'hab;
            default: out_low = 8'h00;
          endcase
        end
        6'h1a: begin
          case (mant[3:0])
            4'h0: out_low = 8'hab;
            4'h1: out_low = 8'hab;
            4'h2: out_low = 8'haa;
            4'h3: out_low = 8'haa;
            4'h4: out_low = 8'haa;
            4'h5: out_low = 8'ha9;
            4'h6: out_low = 8'ha9;
            4'h7: out_low = 8'ha9;
            4'h8: out_low = 8'ha8;
            4'h9: out_low = 8'ha8;
            4'ha: out_low = 8'ha8;
            4'hb: out_low = 8'ha7;
            4'hc: out_low = 8'ha7;
            4'hd: out_low = 8'ha7;
            4'he: out_low = 8'ha6;
            4'hf: out_low = 8'ha6;
            default: out_low = 8'h00;
          endcase
        end
        6'h1b: begin
          case (mant[3:0])
            4'h0: out_low = 8'ha6;
            4'h1: out_low = 8'ha5;
            4'h2: out_low = 8'ha5;
            4'h3: out_low = 8'ha5;
            4'h4: out_low = 8'ha4;
            4'h5: out_low = 8'ha4;
            4'h6: out_low = 8'ha4;
            4'h7: out_low = 8'ha3;
            4'h8: out_low = 8'ha3;
            4'h9: out_low = 8'ha3;
            4'ha: out_low = 8'ha2;
            4'hb: out_low = 8'ha2;
            4'hc: out_low = 8'ha2;
            4'hd: out_low = 8'ha1;
            4'he: out_low = 8'ha1;
            4'hf: out_low = 8'ha1;
            default: out_low = 8'h00;
          endcase
        end
        6'h1c: begin
          case (mant[3:0])
            4'h0: out_low = 8'ha0;
            4'h1: out_low = 8'ha0;
            4'h2: out_low = 8'ha0;
            4'h3: out_low = 8'h9f;
            4'h4: out_low = 8'h9f;
            4'h5: out_low = 8'h9f;
            4'h6: out_low = 8'h9e;
            4'h7: out_low = 8'h9e;
            4'h8: out_low = 8'h9e;
            4'h9: out_low = 8'h9d;
            4'ha: out_low = 8'h9d;
            4'hb: out_low = 8'h9d;
            4'hc: out_low = 8'h9c;
            4'hd: out_low = 8'h9c;
            4'he: out_low = 8'h9c;
            4'hf: out_low = 8'h9b;
            default: out_low = 8'h00;
          endcase
        end
        6'h1d: begin
          case (mant[3:0])
            4'h0: out_low = 8'h9b;
            4'h1: out_low = 8'h9b;
            4'h2: out_low = 8'h9a;
            4'h3: out_low = 8'h9a;
            4'h4: out_low = 8'h9a;
            4'h5: out_low = 8'h9a;
            4'h6: out_low = 8'h99;
            4'h7: out_low = 8'h99;
            4'h8: out_low = 8'h99;
            4'h9: out_low = 8'h98;
            4'ha: out_low = 8'h98;
            4'hb: out_low = 8'h98;
            4'hc: out_low = 8'h97;
            4'hd: out_low = 8'h97;
            4'he: out_low = 8'h97;
            4'hf: out_low = 8'h96;
            default: out_low = 8'h00;
          endcase
        end
        6'h1e: begin
          case (mant[3:0])
            4'h0: out_low = 8'h96;
            4'h1: out_low = 8'h96;
            4'h2: out_low = 8'h95;
            4'h3: out_low = 8'h95;
            4'h4: out_low = 8'h95;
            4'h5: out_low = 8'h94;
            4'h6: out_low = 8'h94;
            4'h7: out_low = 8'h94;
            4'h8: out_low = 8'h93;
            4'h9: out_low = 8'h93;
            4'ha: out_low = 8'h93;
            4'hb: out_low = 8'h93;
            4'hc: out_low = 8'h92;
            4'hd: out_low = 8'h92;
            4'he: out_low = 8'h92;
            4'hf: out_low = 8'h91;
            default: out_low = 8'h00;
          endcase
        end
        6'h1f: begin
          case (mant[3:0])
            4'h0: out_low = 8'h91;
            4'h1: out_low = 8'h91;
            4'h2: out_low = 8'h90;
            4'h3: out_low = 8'h90;
            4'h4: out_low = 8'h90;
            4'h5: out_low = 8'h8f;
            4'h6: out_low = 8'h8f;
            4'h7: out_low = 8'h8f;
            4'h8: out_low = 8'h8e;
            4'h9: out_low = 8'h8e;
            4'ha: out_low = 8'h8e;
            4'hb: out_low = 8'h8e;
            4'hc: out_low = 8'h8d;
            4'hd: out_low = 8'h8d;
            4'he: out_low = 8'h8d;
            4'hf: out_low = 8'h8c;
            default: out_low = 8'h00;
          endcase
        end
        6'h20: begin
          case (mant[3:0])
            4'h0: out_low = 8'h8c;
            4'h1: out_low = 8'h8c;
            4'h2: out_low = 8'h8b;
            4'h3: out_low = 8'h8b;
            4'h4: out_low = 8'h8b;
            4'h5: out_low = 8'h8a;
            4'h6: out_low = 8'h8a;
            4'h7: out_low = 8'h8a;
            4'h8: out_low = 8'h8a;
            4'h9: out_low = 8'h89;
            4'ha: out_low = 8'h89;
            4'hb: out_low = 8'h89;
            4'hc: out_low = 8'h88;
            4'hd: out_low = 8'h88;
            4'he: out_low = 8'h88;
            4'hf: out_low = 8'h87;
            default: out_low = 8'h00;
          endcase
        end
        6'h21: begin
          case (mant[3:0])
            4'h0: out_low = 8'h87;
            4'h1: out_low = 8'h87;
            4'h2: out_low = 8'h86;
            4'h3: out_low = 8'h86;
            4'h4: out_low = 8'h86;
            4'h5: out_low = 8'h86;
            4'h6: out_low = 8'h85;
            4'h7: out_low = 8'h85;
            4'h8: out_low = 8'h85;
            4'h9: out_low = 8'h84;
            4'ha: out_low = 8'h84;
            4'hb: out_low = 8'h84;
            4'hc: out_low = 8'h83;
            4'hd: out_low = 8'h83;
            4'he: out_low = 8'h83;
            4'hf: out_low = 8'h83;
            default: out_low = 8'h00;
          endcase
        end
        6'h22: begin
          case (mant[3:0])
            4'h0: out_low = 8'h82;
            4'h1: out_low = 8'h82;
            4'h2: out_low = 8'h82;
            4'h3: out_low = 8'h81;
            4'h4: out_low = 8'h81;
            4'h5: out_low = 8'h81;
            4'h6: out_low = 8'h80;
            4'h7: out_low = 8'h80;
            4'h8: out_low = 8'h80;
            4'h9: out_low = 8'h80;
            4'ha: out_low = 8'h7f;
            4'hb: out_low = 8'h7f;
            4'hc: out_low = 8'h7f;
            4'hd: out_low = 8'h7e;
            4'he: out_low = 8'h7e;
            4'hf: out_low = 8'h7e;
            default: out_low = 8'h00;
          endcase
        end
        6'h23: begin
          case (mant[3:0])
            4'h0: out_low = 8'h7e;
            4'h1: out_low = 8'h7d;
            4'h2: out_low = 8'h7d;
            4'h3: out_low = 8'h7d;
            4'h4: out_low = 8'h7c;
            4'h5: out_low = 8'h7c;
            4'h6: out_low = 8'h7c;
            4'h7: out_low = 8'h7b;
            4'h8: out_low = 8'h7b;
            4'h9: out_low = 8'h7b;
            4'ha: out_low = 8'h7b;
            4'hb: out_low = 8'h7a;
            4'hc: out_low = 8'h7a;
            4'hd: out_low = 8'h7a;
            4'he: out_low = 8'h79;
            4'hf: out_low = 8'h79;
            default: out_low = 8'h00;
          endcase
        end
        6'h24: begin
          case (mant[3:0])
            4'h0: out_low = 8'h79;
            4'h1: out_low = 8'h79;
            4'h2: out_low = 8'h78;
            4'h3: out_low = 8'h78;
            4'h4: out_low = 8'h78;
            4'h5: out_low = 8'h77;
            4'h6: out_low = 8'h77;
            4'h7: out_low = 8'h77;
            4'h8: out_low = 8'h76;
            4'h9: out_low = 8'h76;
            4'ha: out_low = 8'h76;
            4'hb: out_low = 8'h76;
            4'hc: out_low = 8'h75;
            4'hd: out_low = 8'h75;
            4'he: out_low = 8'h75;
            4'hf: out_low = 8'h74;
            default: out_low = 8'h00;
          endcase
        end
        6'h25: begin
          case (mant[3:0])
            4'h0: out_low = 8'h74;
            4'h1: out_low = 8'h74;
            4'h2: out_low = 8'h74;
            4'h3: out_low = 8'h73;
            4'h4: out_low = 8'h73;
            4'h5: out_low = 8'h73;
            4'h6: out_low = 8'h72;
            4'h7: out_low = 8'h72;
            4'h8: out_low = 8'h72;
            4'h9: out_low = 8'h72;
            4'ha: out_low = 8'h71;
            4'hb: out_low = 8'h71;
            4'hc: out_low = 8'h71;
            4'hd: out_low = 8'h70;
            4'he: out_low = 8'h70;
            4'hf: out_low = 8'h70;
            default: out_low = 8'h00;
          endcase
        end
        6'h26: begin
          case (mant[3:0])
            4'h0: out_low = 8'h70;
            4'h1: out_low = 8'h6f;
            4'h2: out_low = 8'h6f;
            4'h3: out_low = 8'h6f;
            4'h4: out_low = 8'h6e;
            4'h5: out_low = 8'h6e;
            4'h6: out_low = 8'h6e;
            4'h7: out_low = 8'h6e;
            4'h8: out_low = 8'h6d;
            4'h9: out_low = 8'h6d;
            4'ha: out_low = 8'h6d;
            4'hb: out_low = 8'h6c;
            4'hc: out_low = 8'h6c;
            4'hd: out_low = 8'h6c;
            4'he: out_low = 8'h6c;
            4'hf: out_low = 8'h6b;
            default: out_low = 8'h00;
          endcase
        end
        6'h27: begin
          case (mant[3:0])
            4'h0: out_low = 8'h6b;
            4'h1: out_low = 8'h6b;
            4'h2: out_low = 8'h6b;
            4'h3: out_low = 8'h6a;
            4'h4: out_low = 8'h6a;
            4'h5: out_low = 8'h6a;
            4'h6: out_low = 8'h69;
            4'h7: out_low = 8'h69;
            4'h8: out_low = 8'h69;
            4'h9: out_low = 8'h69;
            4'ha: out_low = 8'h68;
            4'hb: out_low = 8'h68;
            4'hc: out_low = 8'h68;
            4'hd: out_low = 8'h67;
            4'he: out_low = 8'h67;
            4'hf: out_low = 8'h67;
            default: out_low = 8'h00;
          endcase
        end
        6'h28: begin
          case (mant[3:0])
            4'h0: out_low = 8'h67;
            4'h1: out_low = 8'h66;
            4'h2: out_low = 8'h66;
            4'h3: out_low = 8'h66;
            4'h4: out_low = 8'h66;
            4'h5: out_low = 8'h65;
            4'h6: out_low = 8'h65;
            4'h7: out_low = 8'h65;
            4'h8: out_low = 8'h64;
            4'h9: out_low = 8'h64;
            4'ha: out_low = 8'h64;
            4'hb: out_low = 8'h64;
            4'hc: out_low = 8'h63;
            4'hd: out_low = 8'h63;
            4'he: out_low = 8'h63;
            4'hf: out_low = 8'h62;
            default: out_low = 8'h00;
          endcase
        end
        6'h29: begin
          case (mant[3:0])
            4'h0: out_low = 8'h62;
            4'h1: out_low = 8'h62;
            4'h2: out_low = 8'h62;
            4'h3: out_low = 8'h61;
            4'h4: out_low = 8'h61;
            4'h5: out_low = 8'h61;
            4'h6: out_low = 8'h61;
            4'h7: out_low = 8'h60;
            4'h8: out_low = 8'h60;
            4'h9: out_low = 8'h60;
            4'ha: out_low = 8'h5f;
            4'hb: out_low = 8'h5f;
            4'hc: out_low = 8'h5f;
            4'hd: out_low = 8'h5f;
            4'he: out_low = 8'h5e;
            4'hf: out_low = 8'h5e;
            default: out_low = 8'h00;
          endcase
        end
        6'h2a: begin
          case (mant[3:0])
            4'h0: out_low = 8'h5e;
            4'h1: out_low = 8'h5e;
            4'h2: out_low = 8'h5d;
            4'h3: out_low = 8'h5d;
            4'h4: out_low = 8'h5d;
            4'h5: out_low = 8'h5d;
            4'h6: out_low = 8'h5c;
            4'h7: out_low = 8'h5c;
            4'h8: out_low = 8'h5c;
            4'h9: out_low = 8'h5b;
            4'ha: out_low = 8'h5b;
            4'hb: out_low = 8'h5b;
            4'hc: out_low = 8'h5b;
            4'hd: out_low = 8'h5a;
            4'he: out_low = 8'h5a;
            4'hf: out_low = 8'h5a;
            default: out_low = 8'h00;
          endcase
        end
        6'h2b: begin
          case (mant[3:0])
            4'h0: out_low = 8'h5a;
            4'h1: out_low = 8'h59;
            4'h2: out_low = 8'h59;
            4'h3: out_low = 8'h59;
            4'h4: out_low = 8'h59;
            4'h5: out_low = 8'h58;
            4'h6: out_low = 8'h58;
            4'h7: out_low = 8'h58;
            4'h8: out_low = 8'h57;
            4'h9: out_low = 8'h57;
            4'ha: out_low = 8'h57;
            4'hb: out_low = 8'h57;
            4'hc: out_low = 8'h56;
            4'hd: out_low = 8'h56;
            4'he: out_low = 8'h56;
            4'hf: out_low = 8'h56;
            default: out_low = 8'h00;
          endcase
        end
        6'h2c: begin
          case (mant[3:0])
            4'h0: out_low = 8'h55;
            4'h1: out_low = 8'h55;
            4'h2: out_low = 8'h55;
            4'h3: out_low = 8'h55;
            4'h4: out_low = 8'h54;
            4'h5: out_low = 8'h54;
            4'h6: out_low = 8'h54;
            4'h7: out_low = 8'h53;
            4'h8: out_low = 8'h53;
            4'h9: out_low = 8'h53;
            4'ha: out_low = 8'h53;
            4'hb: out_low = 8'h52;
            4'hc: out_low = 8'h52;
            4'hd: out_low = 8'h52;
            4'he: out_low = 8'h52;
            4'hf: out_low = 8'h51;
            default: out_low = 8'h00;
          endcase
        end
        6'h2d: begin
          case (mant[3:0])
            4'h0: out_low = 8'h51;
            4'h1: out_low = 8'h51;
            4'h2: out_low = 8'h51;
            4'h3: out_low = 8'h50;
            4'h4: out_low = 8'h50;
            4'h5: out_low = 8'h50;
            4'h6: out_low = 8'h50;
            4'h7: out_low = 8'h4f;
            4'h8: out_low = 8'h4f;
            4'h9: out_low = 8'h4f;
            4'ha: out_low = 8'h4f;
            4'hb: out_low = 8'h4e;
            4'hc: out_low = 8'h4e;
            4'hd: out_low = 8'h4e;
            4'he: out_low = 8'h4e;
            4'hf: out_low = 8'h4d;
            default: out_low = 8'h00;
          endcase
        end
        6'h2e: begin
          case (mant[3:0])
            4'h0: out_low = 8'h4d;
            4'h1: out_low = 8'h4d;
            4'h2: out_low = 8'h4c;
            4'h3: out_low = 8'h4c;
            4'h4: out_low = 8'h4c;
            4'h5: out_low = 8'h4c;
            4'h6: out_low = 8'h4b;
            4'h7: out_low = 8'h4b;
            4'h8: out_low = 8'h4b;
            4'h9: out_low = 8'h4b;
            4'ha: out_low = 8'h4a;
            4'hb: out_low = 8'h4a;
            4'hc: out_low = 8'h4a;
            4'hd: out_low = 8'h4a;
            4'he: out_low = 8'h49;
            4'hf: out_low = 8'h49;
            default: out_low = 8'h00;
          endcase
        end
        6'h2f: begin
          case (mant[3:0])
            4'h0: out_low = 8'h49;
            4'h1: out_low = 8'h49;
            4'h2: out_low = 8'h48;
            4'h3: out_low = 8'h48;
            4'h4: out_low = 8'h48;
            4'h5: out_low = 8'h48;
            4'h6: out_low = 8'h47;
            4'h7: out_low = 8'h47;
            4'h8: out_low = 8'h47;
            4'h9: out_low = 8'h47;
            4'ha: out_low = 8'h46;
            4'hb: out_low = 8'h46;
            4'hc: out_low = 8'h46;
            4'hd: out_low = 8'h46;
            4'he: out_low = 8'h45;
            4'hf: out_low = 8'h45;
            default: out_low = 8'h00;
          endcase
        end
        6'h30: begin
          case (mant[3:0])
            4'h0: out_low = 8'h45;
            4'h1: out_low = 8'h45;
            4'h2: out_low = 8'h44;
            4'h3: out_low = 8'h44;
            4'h4: out_low = 8'h44;
            4'h5: out_low = 8'h44;
            4'h6: out_low = 8'h43;
            4'h7: out_low = 8'h43;
            4'h8: out_low = 8'h43;
            4'h9: out_low = 8'h43;
            4'ha: out_low = 8'h42;
            4'hb: out_low = 8'h42;
            4'hc: out_low = 8'h42;
            4'hd: out_low = 8'h42;
            4'he: out_low = 8'h41;
            4'hf: out_low = 8'h41;
            default: out_low = 8'h00;
          endcase
        end
        6'h31: begin
          case (mant[3:0])
            4'h0: out_low = 8'h41;
            4'h1: out_low = 8'h41;
            4'h2: out_low = 8'h40;
            4'h3: out_low = 8'h40;
            4'h4: out_low = 8'h40;
            4'h5: out_low = 8'h40;
            4'h6: out_low = 8'h3f;
            4'h7: out_low = 8'h3f;
            4'h8: out_low = 8'h3f;
            4'h9: out_low = 8'h3f;
            4'ha: out_low = 8'h3e;
            4'hb: out_low = 8'h3e;
            4'hc: out_low = 8'h3e;
            4'hd: out_low = 8'h3e;
            4'he: out_low = 8'h3d;
            4'hf: out_low = 8'h3d;
            default: out_low = 8'h00;
          endcase
        end
        6'h32: begin
          case (mant[3:0])
            4'h0: out_low = 8'h3d;
            4'h1: out_low = 8'h3d;
            4'h2: out_low = 8'h3c;
            4'h3: out_low = 8'h3c;
            4'h4: out_low = 8'h3c;
            4'h5: out_low = 8'h3c;
            4'h6: out_low = 8'h3b;
            4'h7: out_low = 8'h3b;
            4'h8: out_low = 8'h3b;
            4'h9: out_low = 8'h3b;
            4'ha: out_low = 8'h3b;
            4'hb: out_low = 8'h3a;
            4'hc: out_low = 8'h3a;
            4'hd: out_low = 8'h3a;
            4'he: out_low = 8'h3a;
            4'hf: out_low = 8'h39;
            default: out_low = 8'h00;
          endcase
        end
        6'h33: begin
          case (mant[3:0])
            4'h0: out_low = 8'h39;
            4'h1: out_low = 8'h39;
            4'h2: out_low = 8'h39;
            4'h3: out_low = 8'h38;
            4'h4: out_low = 8'h38;
            4'h5: out_low = 8'h38;
            4'h6: out_low = 8'h38;
            4'h7: out_low = 8'h37;
            4'h8: out_low = 8'h37;
            4'h9: out_low = 8'h37;
            4'ha: out_low = 8'h37;
            4'hb: out_low = 8'h36;
            4'hc: out_low = 8'h36;
            4'hd: out_low = 8'h36;
            4'he: out_low = 8'h36;
            4'hf: out_low = 8'h35;
            default: out_low = 8'h00;
          endcase
        end
        6'h34: begin
          case (mant[3:0])
            4'h0: out_low = 8'h35;
            4'h1: out_low = 8'h35;
            4'h2: out_low = 8'h35;
            4'h3: out_low = 8'h34;
            4'h4: out_low = 8'h34;
            4'h5: out_low = 8'h34;
            4'h6: out_low = 8'h34;
            4'h7: out_low = 8'h34;
            4'h8: out_low = 8'h33;
            4'h9: out_low = 8'h33;
            4'ha: out_low = 8'h33;
            4'hb: out_low = 8'h33;
            4'hc: out_low = 8'h32;
            4'hd: out_low = 8'h32;
            4'he: out_low = 8'h32;
            4'hf: out_low = 8'h32;
            default: out_low = 8'h00;
          endcase
        end
        6'h35: begin
          case (mant[3:0])
            4'h0: out_low = 8'h31;
            4'h1: out_low = 8'h31;
            4'h2: out_low = 8'h31;
            4'h3: out_low = 8'h31;
            4'h4: out_low = 8'h30;
            4'h5: out_low = 8'h30;
            4'h6: out_low = 8'h30;
            4'h7: out_low = 8'h30;
            4'h8: out_low = 8'h2f;
            4'h9: out_low = 8'h2f;
            4'ha: out_low = 8'h2f;
            4'hb: out_low = 8'h2f;
            4'hc: out_low = 8'h2f;
            4'hd: out_low = 8'h2e;
            4'he: out_low = 8'h2e;
            4'hf: out_low = 8'h2e;
            default: out_low = 8'h00;
          endcase
        end
        6'h36: begin
          case (mant[3:0])
            4'h0: out_low = 8'h2e;
            4'h1: out_low = 8'h2d;
            4'h2: out_low = 8'h2d;
            4'h3: out_low = 8'h2d;
            4'h4: out_low = 8'h2d;
            4'h5: out_low = 8'h2c;
            4'h6: out_low = 8'h2c;
            4'h7: out_low = 8'h2c;
            4'h8: out_low = 8'h2c;
            4'h9: out_low = 8'h2c;
            4'ha: out_low = 8'h2b;
            4'hb: out_low = 8'h2b;
            4'hc: out_low = 8'h2b;
            4'hd: out_low = 8'h2b;
            4'he: out_low = 8'h2a;
            4'hf: out_low = 8'h2a;
            default: out_low = 8'h00;
          endcase
        end
        6'h37: begin
          case (mant[3:0])
            4'h0: out_low = 8'h2a;
            4'h1: out_low = 8'h2a;
            4'h2: out_low = 8'h29;
            4'h3: out_low = 8'h29;
            4'h4: out_low = 8'h29;
            4'h5: out_low = 8'h29;
            4'h6: out_low = 8'h29;
            4'h7: out_low = 8'h28;
            4'h8: out_low = 8'h28;
            4'h9: out_low = 8'h28;
            4'ha: out_low = 8'h28;
            4'hb: out_low = 8'h27;
            4'hc: out_low = 8'h27;
            4'hd: out_low = 8'h27;
            4'he: out_low = 8'h27;
            4'hf: out_low = 8'h26;
            default: out_low = 8'h00;
          endcase
        end
        6'h38: begin
          case (mant[3:0])
            4'h0: out_low = 8'h26;
            4'h1: out_low = 8'h26;
            4'h2: out_low = 8'h26;
            4'h3: out_low = 8'h26;
            4'h4: out_low = 8'h25;
            4'h5: out_low = 8'h25;
            4'h6: out_low = 8'h25;
            4'h7: out_low = 8'h25;
            4'h8: out_low = 8'h24;
            4'h9: out_low = 8'h24;
            4'ha: out_low = 8'h24;
            4'hb: out_low = 8'h24;
            4'hc: out_low = 8'h23;
            4'hd: out_low = 8'h23;
            4'he: out_low = 8'h23;
            4'hf: out_low = 8'h23;
            default: out_low = 8'h00;
          endcase
        end
        6'h39: begin
          case (mant[3:0])
            4'h0: out_low = 8'h23;
            4'h1: out_low = 8'h22;
            4'h2: out_low = 8'h22;
            4'h3: out_low = 8'h22;
            4'h4: out_low = 8'h22;
            4'h5: out_low = 8'h21;
            4'h6: out_low = 8'h21;
            4'h7: out_low = 8'h21;
            4'h8: out_low = 8'h21;
            4'h9: out_low = 8'h21;
            4'ha: out_low = 8'h20;
            4'hb: out_low = 8'h20;
            4'hc: out_low = 8'h20;
            4'hd: out_low = 8'h20;
            4'he: out_low = 8'h1f;
            4'hf: out_low = 8'h1f;
            default: out_low = 8'h00;
          endcase
        end
        6'h3a: begin
          case (mant[3:0])
            4'h0: out_low = 8'h1f;
            4'h1: out_low = 8'h1f;
            4'h2: out_low = 8'h1f;
            4'h3: out_low = 8'h1e;
            4'h4: out_low = 8'h1e;
            4'h5: out_low = 8'h1e;
            4'h6: out_low = 8'h1e;
            4'h7: out_low = 8'h1d;
            4'h8: out_low = 8'h1d;
            4'h9: out_low = 8'h1d;
            4'ha: out_low = 8'h1d;
            4'hb: out_low = 8'h1d;
            4'hc: out_low = 8'h1c;
            4'hd: out_low = 8'h1c;
            4'he: out_low = 8'h1c;
            4'hf: out_low = 8'h1c;
            default: out_low = 8'h00;
          endcase
        end
        6'h3b: begin
          case (mant[3:0])
            4'h0: out_low = 8'h1b;
            4'h1: out_low = 8'h1b;
            4'h2: out_low = 8'h1b;
            4'h3: out_low = 8'h1b;
            4'h4: out_low = 8'h1b;
            4'h5: out_low = 8'h1a;
            4'h6: out_low = 8'h1a;
            4'h7: out_low = 8'h1a;
            4'h8: out_low = 8'h1a;
            4'h9: out_low = 8'h19;
            4'ha: out_low = 8'h19;
            4'hb: out_low = 8'h19;
            4'hc: out_low = 8'h19;
            4'hd: out_low = 8'h19;
            4'he: out_low = 8'h18;
            4'hf: out_low = 8'h18;
            default: out_low = 8'h00;
          endcase
        end
        6'h3c: begin
          case (mant[3:0])
            4'h0: out_low = 8'h18;
            4'h1: out_low = 8'h18;
            4'h2: out_low = 8'h17;
            4'h3: out_low = 8'h17;
            4'h4: out_low = 8'h17;
            4'h5: out_low = 8'h17;
            4'h6: out_low = 8'h17;
            4'h7: out_low = 8'h16;
            4'h8: out_low = 8'h16;
            4'h9: out_low = 8'h16;
            4'ha: out_low = 8'h16;
            4'hb: out_low = 8'h15;
            4'hc: out_low = 8'h15;
            4'hd: out_low = 8'h15;
            4'he: out_low = 8'h15;
            4'hf: out_low = 8'h15;
            default: out_low = 8'h00;
          endcase
        end
        6'h3d: begin
          case (mant[3:0])
            4'h0: out_low = 8'h14;
            4'h1: out_low = 8'h14;
            4'h2: out_low = 8'h14;
            4'h3: out_low = 8'h14;
            4'h4: out_low = 8'h14;
            4'h5: out_low = 8'h13;
            4'h6: out_low = 8'h13;
            4'h7: out_low = 8'h13;
            4'h8: out_low = 8'h13;
            4'h9: out_low = 8'h12;
            4'ha: out_low = 8'h12;
            4'hb: out_low = 8'h12;
            4'hc: out_low = 8'h12;
            4'hd: out_low = 8'h12;
            4'he: out_low = 8'h11;
            4'hf: out_low = 8'h11;
            default: out_low = 8'h00;
          endcase
        end
        6'h3e: begin
          case (mant[3:0])
            4'h0: out_low = 8'h11;
            4'h1: out_low = 8'h11;
            4'h2: out_low = 8'h11;
            4'h3: out_low = 8'h10;
            4'h4: out_low = 8'h10;
            4'h5: out_low = 8'h10;
            4'h6: out_low = 8'h10;
            4'h7: out_low = 8'h0f;
            4'h8: out_low = 8'h0f;
            4'h9: out_low = 8'h0f;
            4'ha: out_low = 8'h0f;
            4'hb: out_low = 8'h0f;
            4'hc: out_low = 8'h0e;
            4'hd: out_low = 8'h0e;
            4'he: out_low = 8'h0e;
            4'hf: out_low = 8'h0e;
            default: out_low = 8'h00;
          endcase
        end
        6'h3f: begin
          case (mant[3:0])
            4'h0: out_low = 8'h0e;
            4'h1: out_low = 8'h0d;
            4'h2: out_low = 8'h0d;
            4'h3: out_low = 8'h0d;
            4'h4: out_low = 8'h0d;
            4'h5: out_low = 8'h0c;
            4'h6: out_low = 8'h0c;
            4'h7: out_low = 8'h0c;
            4'h8: out_low = 8'h0c;
            4'h9: out_low = 8'h0c;
            4'ha: out_low = 8'h0b;
            4'hb: out_low = 8'h0b;
            4'hc: out_low = 8'h0b;
            4'hd: out_low = 8'h0b;
            4'he: out_low = 8'h0b;
            4'hf: out_low = 8'h0a;
            default: out_low = 8'h00;
          endcase
        end
        default: out_low = 8'h00;
      endcase
      end
      2'h2: begin
      case (mant[9:4])
        6'h00: begin
          case (mant[3:0])
            4'h0: out_low = 8'h0a;
            4'h1: out_low = 8'h0a;
            4'h2: out_low = 8'h09;
            4'h3: out_low = 8'h09;
            4'h4: out_low = 8'h08;
            4'h5: out_low = 8'h08;
            4'h6: out_low = 8'h08;
            4'h7: out_low = 8'h07;
            4'h8: out_low = 8'h07;
            4'h9: out_low = 8'h06;
            4'ha: out_low = 8'h06;
            4'hb: out_low = 8'h06;
            4'hc: out_low = 8'h05;
            4'hd: out_low = 8'h05;
            4'he: out_low = 8'h04;
            4'hf: out_low = 8'h04;
            default: out_low = 8'h00;
          endcase
        end
        6'h01: begin
          case (mant[3:0])
            4'h0: out_low = 8'h04;
            4'h1: out_low = 8'h03;
            4'h2: out_low = 8'h03;
            4'h3: out_low = 8'h02;
            4'h4: out_low = 8'h02;
            4'h5: out_low = 8'h01;
            4'h6: out_low = 8'h01;
            4'h7: out_low = 8'h01;
            4'h8: out_low = 8'h00;
            4'h9: out_low = 8'h00;
            4'ha: out_low = 8'hff;
            4'hb: out_low = 8'hff;
            4'hc: out_low = 8'hff;
            4'hd: out_low = 8'hfe;
            4'he: out_low = 8'hfe;
            4'hf: out_low = 8'hfd;
            default: out_low = 8'h00;
          endcase
        end
        6'h02: begin
          case (mant[3:0])
            4'h0: out_low = 8'hfd;
            4'h1: out_low = 8'hfd;
            4'h2: out_low = 8'hfc;
            4'h3: out_low = 8'hfc;
            4'h4: out_low = 8'hfb;
            4'h5: out_low = 8'hfb;
            4'h6: out_low = 8'hfb;
            4'h7: out_low = 8'hfa;
            4'h8: out_low = 8'hfa;
            4'h9: out_low = 8'hf9;
            4'ha: out_low = 8'hf9;
            4'hb: out_low = 8'hf9;
            4'hc: out_low = 8'hf8;
            4'hd: out_low = 8'hf8;
            4'he: out_low = 8'hf7;
            4'hf: out_low = 8'hf7;
            default: out_low = 8'h00;
          endcase
        end
        6'h03: begin
          case (mant[3:0])
            4'h0: out_low = 8'hf7;
            4'h1: out_low = 8'hf6;
            4'h2: out_low = 8'hf6;
            4'h3: out_low = 8'hf5;
            4'h4: out_low = 8'hf5;
            4'h5: out_low = 8'hf5;
            4'h6: out_low = 8'hf4;
            4'h7: out_low = 8'hf4;
            4'h8: out_low = 8'hf3;
            4'h9: out_low = 8'hf3;
            4'ha: out_low = 8'hf3;
            4'hb: out_low = 8'hf2;
            4'hc: out_low = 8'hf2;
            4'hd: out_low = 8'hf2;
            4'he: out_low = 8'hf1;
            4'hf: out_low = 8'hf1;
            default: out_low = 8'h00;
          endcase
        end
        6'h04: begin
          case (mant[3:0])
            4'h0: out_low = 8'hf0;
            4'h1: out_low = 8'hf0;
            4'h2: out_low = 8'hf0;
            4'h3: out_low = 8'hef;
            4'h4: out_low = 8'hef;
            4'h5: out_low = 8'hee;
            4'h6: out_low = 8'hee;
            4'h7: out_low = 8'hee;
            4'h8: out_low = 8'hed;
            4'h9: out_low = 8'hed;
            4'ha: out_low = 8'hec;
            4'hb: out_low = 8'hec;
            4'hc: out_low = 8'hec;
            4'hd: out_low = 8'heb;
            4'he: out_low = 8'heb;
            4'hf: out_low = 8'heb;
            default: out_low = 8'h00;
          endcase
        end
        6'h05: begin
          case (mant[3:0])
            4'h0: out_low = 8'hea;
            4'h1: out_low = 8'hea;
            4'h2: out_low = 8'he9;
            4'h3: out_low = 8'he9;
            4'h4: out_low = 8'he9;
            4'h5: out_low = 8'he8;
            4'h6: out_low = 8'he8;
            4'h7: out_low = 8'he8;
            4'h8: out_low = 8'he7;
            4'h9: out_low = 8'he7;
            4'ha: out_low = 8'he6;
            4'hb: out_low = 8'he6;
            4'hc: out_low = 8'he6;
            4'hd: out_low = 8'he5;
            4'he: out_low = 8'he5;
            4'hf: out_low = 8'he5;
            default: out_low = 8'h00;
          endcase
        end
        6'h06: begin
          case (mant[3:0])
            4'h0: out_low = 8'he4;
            4'h1: out_low = 8'he4;
            4'h2: out_low = 8'he3;
            4'h3: out_low = 8'he3;
            4'h4: out_low = 8'he3;
            4'h5: out_low = 8'he2;
            4'h6: out_low = 8'he2;
            4'h7: out_low = 8'he2;
            4'h8: out_low = 8'he1;
            4'h9: out_low = 8'he1;
            4'ha: out_low = 8'he0;
            4'hb: out_low = 8'he0;
            4'hc: out_low = 8'he0;
            4'hd: out_low = 8'hdf;
            4'he: out_low = 8'hdf;
            4'hf: out_low = 8'hdf;
            default: out_low = 8'h00;
          endcase
        end
        6'h07: begin
          case (mant[3:0])
            4'h0: out_low = 8'hde;
            4'h1: out_low = 8'hde;
            4'h2: out_low = 8'hde;
            4'h3: out_low = 8'hdd;
            4'h4: out_low = 8'hdd;
            4'h5: out_low = 8'hdc;
            4'h6: out_low = 8'hdc;
            4'h7: out_low = 8'hdc;
            4'h8: out_low = 8'hdb;
            4'h9: out_low = 8'hdb;
            4'ha: out_low = 8'hdb;
            4'hb: out_low = 8'hda;
            4'hc: out_low = 8'hda;
            4'hd: out_low = 8'hda;
            4'he: out_low = 8'hd9;
            4'hf: out_low = 8'hd9;
            default: out_low = 8'h00;
          endcase
        end
        6'h08: begin
          case (mant[3:0])
            4'h0: out_low = 8'hd8;
            4'h1: out_low = 8'hd8;
            4'h2: out_low = 8'hd8;
            4'h3: out_low = 8'hd7;
            4'h4: out_low = 8'hd7;
            4'h5: out_low = 8'hd7;
            4'h6: out_low = 8'hd6;
            4'h7: out_low = 8'hd6;
            4'h8: out_low = 8'hd6;
            4'h9: out_low = 8'hd5;
            4'ha: out_low = 8'hd5;
            4'hb: out_low = 8'hd5;
            4'hc: out_low = 8'hd4;
            4'hd: out_low = 8'hd4;
            4'he: out_low = 8'hd4;
            4'hf: out_low = 8'hd3;
            default: out_low = 8'h00;
          endcase
        end
        6'h09: begin
          case (mant[3:0])
            4'h0: out_low = 8'hd3;
            4'h1: out_low = 8'hd2;
            4'h2: out_low = 8'hd2;
            4'h3: out_low = 8'hd2;
            4'h4: out_low = 8'hd1;
            4'h5: out_low = 8'hd1;
            4'h6: out_low = 8'hd1;
            4'h7: out_low = 8'hd0;
            4'h8: out_low = 8'hd0;
            4'h9: out_low = 8'hd0;
            4'ha: out_low = 8'hcf;
            4'hb: out_low = 8'hcf;
            4'hc: out_low = 8'hcf;
            4'hd: out_low = 8'hce;
            4'he: out_low = 8'hce;
            4'hf: out_low = 8'hce;
            default: out_low = 8'h00;
          endcase
        end
        6'h0a: begin
          case (mant[3:0])
            4'h0: out_low = 8'hcd;
            4'h1: out_low = 8'hcd;
            4'h2: out_low = 8'hcd;
            4'h3: out_low = 8'hcc;
            4'h4: out_low = 8'hcc;
            4'h5: out_low = 8'hcb;
            4'h6: out_low = 8'hcb;
            4'h7: out_low = 8'hcb;
            4'h8: out_low = 8'hca;
            4'h9: out_low = 8'hca;
            4'ha: out_low = 8'hca;
            4'hb: out_low = 8'hc9;
            4'hc: out_low = 8'hc9;
            4'hd: out_low = 8'hc9;
            4'he: out_low = 8'hc8;
            4'hf: out_low = 8'hc8;
            default: out_low = 8'h00;
          endcase
        end
        6'h0b: begin
          case (mant[3:0])
            4'h0: out_low = 8'hc8;
            4'h1: out_low = 8'hc7;
            4'h2: out_low = 8'hc7;
            4'h3: out_low = 8'hc7;
            4'h4: out_low = 8'hc6;
            4'h5: out_low = 8'hc6;
            4'h6: out_low = 8'hc6;
            4'h7: out_low = 8'hc5;
            4'h8: out_low = 8'hc5;
            4'h9: out_low = 8'hc5;
            4'ha: out_low = 8'hc4;
            4'hb: out_low = 8'hc4;
            4'hc: out_low = 8'hc4;
            4'hd: out_low = 8'hc3;
            4'he: out_low = 8'hc3;
            4'hf: out_low = 8'hc3;
            default: out_low = 8'h00;
          endcase
        end
        6'h0c: begin
          case (mant[3:0])
            4'h0: out_low = 8'hc2;
            4'h1: out_low = 8'hc2;
            4'h2: out_low = 8'hc2;
            4'h3: out_low = 8'hc1;
            4'h4: out_low = 8'hc1;
            4'h5: out_low = 8'hc1;
            4'h6: out_low = 8'hc0;
            4'h7: out_low = 8'hc0;
            4'h8: out_low = 8'hc0;
            4'h9: out_low = 8'hbf;
            4'ha: out_low = 8'hbf;
            4'hb: out_low = 8'hbf;
            4'hc: out_low = 8'hbe;
            4'hd: out_low = 8'hbe;
            4'he: out_low = 8'hbe;
            4'hf: out_low = 8'hbd;
            default: out_low = 8'h00;
          endcase
        end
        6'h0d: begin
          case (mant[3:0])
            4'h0: out_low = 8'hbd;
            4'h1: out_low = 8'hbd;
            4'h2: out_low = 8'hbc;
            4'h3: out_low = 8'hbc;
            4'h4: out_low = 8'hbc;
            4'h5: out_low = 8'hbb;
            4'h6: out_low = 8'hbb;
            4'h7: out_low = 8'hbb;
            4'h8: out_low = 8'hba;
            4'h9: out_low = 8'hba;
            4'ha: out_low = 8'hba;
            4'hb: out_low = 8'hb9;
            4'hc: out_low = 8'hb9;
            4'hd: out_low = 8'hb9;
            4'he: out_low = 8'hb8;
            4'hf: out_low = 8'hb8;
            default: out_low = 8'h00;
          endcase
        end
        6'h0e: begin
          case (mant[3:0])
            4'h0: out_low = 8'hb8;
            4'h1: out_low = 8'hb8;
            4'h2: out_low = 8'hb7;
            4'h3: out_low = 8'hb7;
            4'h4: out_low = 8'hb7;
            4'h5: out_low = 8'hb6;
            4'h6: out_low = 8'hb6;
            4'h7: out_low = 8'hb6;
            4'h8: out_low = 8'hb5;
            4'h9: out_low = 8'hb5;
            4'ha: out_low = 8'hb5;
            4'hb: out_low = 8'hb4;
            4'hc: out_low = 8'hb4;
            4'hd: out_low = 8'hb4;
            4'he: out_low = 8'hb3;
            4'hf: out_low = 8'hb3;
            default: out_low = 8'h00;
          endcase
        end
        6'h0f: begin
          case (mant[3:0])
            4'h0: out_low = 8'hb3;
            4'h1: out_low = 8'hb2;
            4'h2: out_low = 8'hb2;
            4'h3: out_low = 8'hb2;
            4'h4: out_low = 8'hb1;
            4'h5: out_low = 8'hb1;
            4'h6: out_low = 8'hb1;
            4'h7: out_low = 8'hb0;
            4'h8: out_low = 8'hb0;
            4'h9: out_low = 8'hb0;
            4'ha: out_low = 8'hb0;
            4'hb: out_low = 8'haf;
            4'hc: out_low = 8'haf;
            4'hd: out_low = 8'haf;
            4'he: out_low = 8'hae;
            4'hf: out_low = 8'hae;
            default: out_low = 8'h00;
          endcase
        end
        6'h10: begin
          case (mant[3:0])
            4'h0: out_low = 8'hae;
            4'h1: out_low = 8'had;
            4'h2: out_low = 8'had;
            4'h3: out_low = 8'had;
            4'h4: out_low = 8'hac;
            4'h5: out_low = 8'hac;
            4'h6: out_low = 8'hac;
            4'h7: out_low = 8'hac;
            4'h8: out_low = 8'hab;
            4'h9: out_low = 8'hab;
            4'ha: out_low = 8'hab;
            4'hb: out_low = 8'haa;
            4'hc: out_low = 8'haa;
            4'hd: out_low = 8'haa;
            4'he: out_low = 8'ha9;
            4'hf: out_low = 8'ha9;
            default: out_low = 8'h00;
          endcase
        end
        6'h11: begin
          case (mant[3:0])
            4'h0: out_low = 8'ha9;
            4'h1: out_low = 8'ha8;
            4'h2: out_low = 8'ha8;
            4'h3: out_low = 8'ha8;
            4'h4: out_low = 8'ha8;
            4'h5: out_low = 8'ha7;
            4'h6: out_low = 8'ha7;
            4'h7: out_low = 8'ha7;
            4'h8: out_low = 8'ha6;
            4'h9: out_low = 8'ha6;
            4'ha: out_low = 8'ha6;
            4'hb: out_low = 8'ha5;
            4'hc: out_low = 8'ha5;
            4'hd: out_low = 8'ha5;
            4'he: out_low = 8'ha4;
            4'hf: out_low = 8'ha4;
            default: out_low = 8'h00;
          endcase
        end
        6'h12: begin
          case (mant[3:0])
            4'h0: out_low = 8'ha4;
            4'h1: out_low = 8'ha4;
            4'h2: out_low = 8'ha3;
            4'h3: out_low = 8'ha3;
            4'h4: out_low = 8'ha3;
            4'h5: out_low = 8'ha2;
            4'h6: out_low = 8'ha2;
            4'h7: out_low = 8'ha2;
            4'h8: out_low = 8'ha1;
            4'h9: out_low = 8'ha1;
            4'ha: out_low = 8'ha1;
            4'hb: out_low = 8'ha1;
            4'hc: out_low = 8'ha0;
            4'hd: out_low = 8'ha0;
            4'he: out_low = 8'ha0;
            4'hf: out_low = 8'h9f;
            default: out_low = 8'h00;
          endcase
        end
        6'h13: begin
          case (mant[3:0])
            4'h0: out_low = 8'h9f;
            4'h1: out_low = 8'h9f;
            4'h2: out_low = 8'h9e;
            4'h3: out_low = 8'h9e;
            4'h4: out_low = 8'h9e;
            4'h5: out_low = 8'h9e;
            4'h6: out_low = 8'h9d;
            4'h7: out_low = 8'h9d;
            4'h8: out_low = 8'h9d;
            4'h9: out_low = 8'h9c;
            4'ha: out_low = 8'h9c;
            4'hb: out_low = 8'h9c;
            4'hc: out_low = 8'h9c;
            4'hd: out_low = 8'h9b;
            4'he: out_low = 8'h9b;
            4'hf: out_low = 8'h9b;
            default: out_low = 8'h00;
          endcase
        end
        6'h14: begin
          case (mant[3:0])
            4'h0: out_low = 8'h9a;
            4'h1: out_low = 8'h9a;
            4'h2: out_low = 8'h9a;
            4'h3: out_low = 8'h99;
            4'h4: out_low = 8'h99;
            4'h5: out_low = 8'h99;
            4'h6: out_low = 8'h99;
            4'h7: out_low = 8'h98;
            4'h8: out_low = 8'h98;
            4'h9: out_low = 8'h98;
            4'ha: out_low = 8'h97;
            4'hb: out_low = 8'h97;
            4'hc: out_low = 8'h97;
            4'hd: out_low = 8'h97;
            4'he: out_low = 8'h96;
            4'hf: out_low = 8'h96;
            default: out_low = 8'h00;
          endcase
        end
        6'h15: begin
          case (mant[3:0])
            4'h0: out_low = 8'h96;
            4'h1: out_low = 8'h95;
            4'h2: out_low = 8'h95;
            4'h3: out_low = 8'h95;
            4'h4: out_low = 8'h95;
            4'h5: out_low = 8'h94;
            4'h6: out_low = 8'h94;
            4'h7: out_low = 8'h94;
            4'h8: out_low = 8'h93;
            4'h9: out_low = 8'h93;
            4'ha: out_low = 8'h93;
            4'hb: out_low = 8'h93;
            4'hc: out_low = 8'h92;
            4'hd: out_low = 8'h92;
            4'he: out_low = 8'h92;
            4'hf: out_low = 8'h91;
            default: out_low = 8'h00;
          endcase
        end
        6'h16: begin
          case (mant[3:0])
            4'h0: out_low = 8'h91;
            4'h1: out_low = 8'h91;
            4'h2: out_low = 8'h91;
            4'h3: out_low = 8'h90;
            4'h4: out_low = 8'h90;
            4'h5: out_low = 8'h90;
            4'h6: out_low = 8'h8f;
            4'h7: out_low = 8'h8f;
            4'h8: out_low = 8'h8f;
            4'h9: out_low = 8'h8f;
            4'ha: out_low = 8'h8e;
            4'hb: out_low = 8'h8e;
            4'hc: out_low = 8'h8e;
            4'hd: out_low = 8'h8d;
            4'he: out_low = 8'h8d;
            4'hf: out_low = 8'h8d;
            default: out_low = 8'h00;
          endcase
        end
        6'h17: begin
          case (mant[3:0])
            4'h0: out_low = 8'h8d;
            4'h1: out_low = 8'h8c;
            4'h2: out_low = 8'h8c;
            4'h3: out_low = 8'h8c;
            4'h4: out_low = 8'h8c;
            4'h5: out_low = 8'h8b;
            4'h6: out_low = 8'h8b;
            4'h7: out_low = 8'h8b;
            4'h8: out_low = 8'h8a;
            4'h9: out_low = 8'h8a;
            4'ha: out_low = 8'h8a;
            4'hb: out_low = 8'h8a;
            4'hc: out_low = 8'h89;
            4'hd: out_low = 8'h89;
            4'he: out_low = 8'h89;
            4'hf: out_low = 8'h89;
            default: out_low = 8'h00;
          endcase
        end
        6'h18: begin
          case (mant[3:0])
            4'h0: out_low = 8'h88;
            4'h1: out_low = 8'h88;
            4'h2: out_low = 8'h88;
            4'h3: out_low = 8'h87;
            4'h4: out_low = 8'h87;
            4'h5: out_low = 8'h87;
            4'h6: out_low = 8'h87;
            4'h7: out_low = 8'h86;
            4'h8: out_low = 8'h86;
            4'h9: out_low = 8'h86;
            4'ha: out_low = 8'h85;
            4'hb: out_low = 8'h85;
            4'hc: out_low = 8'h85;
            4'hd: out_low = 8'h85;
            4'he: out_low = 8'h84;
            4'hf: out_low = 8'h84;
            default: out_low = 8'h00;
          endcase
        end
        6'h19: begin
          case (mant[3:0])
            4'h0: out_low = 8'h84;
            4'h1: out_low = 8'h84;
            4'h2: out_low = 8'h83;
            4'h3: out_low = 8'h83;
            4'h4: out_low = 8'h83;
            4'h5: out_low = 8'h83;
            4'h6: out_low = 8'h82;
            4'h7: out_low = 8'h82;
            4'h8: out_low = 8'h82;
            4'h9: out_low = 8'h81;
            4'ha: out_low = 8'h81;
            4'hb: out_low = 8'h81;
            4'hc: out_low = 8'h81;
            4'hd: out_low = 8'h80;
            4'he: out_low = 8'h80;
            4'hf: out_low = 8'h80;
            default: out_low = 8'h00;
          endcase
        end
        6'h1a: begin
          case (mant[3:0])
            4'h0: out_low = 8'h80;
            4'h1: out_low = 8'h7f;
            4'h2: out_low = 8'h7f;
            4'h3: out_low = 8'h7f;
            4'h4: out_low = 8'h7f;
            4'h5: out_low = 8'h7e;
            4'h6: out_low = 8'h7e;
            4'h7: out_low = 8'h7e;
            4'h8: out_low = 8'h7d;
            4'h9: out_low = 8'h7d;
            4'ha: out_low = 8'h7d;
            4'hb: out_low = 8'h7d;
            4'hc: out_low = 8'h7c;
            4'hd: out_low = 8'h7c;
            4'he: out_low = 8'h7c;
            4'hf: out_low = 8'h7c;
            default: out_low = 8'h00;
          endcase
        end
        6'h1b: begin
          case (mant[3:0])
            4'h0: out_low = 8'h7b;
            4'h1: out_low = 8'h7b;
            4'h2: out_low = 8'h7b;
            4'h3: out_low = 8'h7b;
            4'h4: out_low = 8'h7a;
            4'h5: out_low = 8'h7a;
            4'h6: out_low = 8'h7a;
            4'h7: out_low = 8'h7a;
            4'h8: out_low = 8'h79;
            4'h9: out_low = 8'h79;
            4'ha: out_low = 8'h79;
            4'hb: out_low = 8'h78;
            4'hc: out_low = 8'h78;
            4'hd: out_low = 8'h78;
            4'he: out_low = 8'h78;
            4'hf: out_low = 8'h77;
            default: out_low = 8'h00;
          endcase
        end
        6'h1c: begin
          case (mant[3:0])
            4'h0: out_low = 8'h77;
            4'h1: out_low = 8'h77;
            4'h2: out_low = 8'h77;
            4'h3: out_low = 8'h76;
            4'h4: out_low = 8'h76;
            4'h5: out_low = 8'h76;
            4'h6: out_low = 8'h76;
            4'h7: out_low = 8'h75;
            4'h8: out_low = 8'h75;
            4'h9: out_low = 8'h75;
            4'ha: out_low = 8'h75;
            4'hb: out_low = 8'h74;
            4'hc: out_low = 8'h74;
            4'hd: out_low = 8'h74;
            4'he: out_low = 8'h74;
            4'hf: out_low = 8'h73;
            default: out_low = 8'h00;
          endcase
        end
        6'h1d: begin
          case (mant[3:0])
            4'h0: out_low = 8'h73;
            4'h1: out_low = 8'h73;
            4'h2: out_low = 8'h73;
            4'h3: out_low = 8'h72;
            4'h4: out_low = 8'h72;
            4'h5: out_low = 8'h72;
            4'h6: out_low = 8'h72;
            4'h7: out_low = 8'h71;
            4'h8: out_low = 8'h71;
            4'h9: out_low = 8'h71;
            4'ha: out_low = 8'h71;
            4'hb: out_low = 8'h70;
            4'hc: out_low = 8'h70;
            4'hd: out_low = 8'h70;
            4'he: out_low = 8'h6f;
            4'hf: out_low = 8'h6f;
            default: out_low = 8'h00;
          endcase
        end
        6'h1e: begin
          case (mant[3:0])
            4'h0: out_low = 8'h6f;
            4'h1: out_low = 8'h6f;
            4'h2: out_low = 8'h6e;
            4'h3: out_low = 8'h6e;
            4'h4: out_low = 8'h6e;
            4'h5: out_low = 8'h6e;
            4'h6: out_low = 8'h6d;
            4'h7: out_low = 8'h6d;
            4'h8: out_low = 8'h6d;
            4'h9: out_low = 8'h6d;
            4'ha: out_low = 8'h6c;
            4'hb: out_low = 8'h6c;
            4'hc: out_low = 8'h6c;
            4'hd: out_low = 8'h6c;
            4'he: out_low = 8'h6b;
            4'hf: out_low = 8'h6b;
            default: out_low = 8'h00;
          endcase
        end
        6'h1f: begin
          case (mant[3:0])
            4'h0: out_low = 8'h6b;
            4'h1: out_low = 8'h6b;
            4'h2: out_low = 8'h6b;
            4'h3: out_low = 8'h6a;
            4'h4: out_low = 8'h6a;
            4'h5: out_low = 8'h6a;
            4'h6: out_low = 8'h6a;
            4'h7: out_low = 8'h69;
            4'h8: out_low = 8'h69;
            4'h9: out_low = 8'h69;
            4'ha: out_low = 8'h69;
            4'hb: out_low = 8'h68;
            4'hc: out_low = 8'h68;
            4'hd: out_low = 8'h68;
            4'he: out_low = 8'h68;
            4'hf: out_low = 8'h67;
            default: out_low = 8'h00;
          endcase
        end
        6'h20: begin
          case (mant[3:0])
            4'h0: out_low = 8'h67;
            4'h1: out_low = 8'h67;
            4'h2: out_low = 8'h67;
            4'h3: out_low = 8'h66;
            4'h4: out_low = 8'h66;
            4'h5: out_low = 8'h66;
            4'h6: out_low = 8'h66;
            4'h7: out_low = 8'h65;
            4'h8: out_low = 8'h65;
            4'h9: out_low = 8'h65;
            4'ha: out_low = 8'h65;
            4'hb: out_low = 8'h64;
            4'hc: out_low = 8'h64;
            4'hd: out_low = 8'h64;
            4'he: out_low = 8'h64;
            4'hf: out_low = 8'h63;
            default: out_low = 8'h00;
          endcase
        end
        6'h21: begin
          case (mant[3:0])
            4'h0: out_low = 8'h63;
            4'h1: out_low = 8'h63;
            4'h2: out_low = 8'h63;
            4'h3: out_low = 8'h62;
            4'h4: out_low = 8'h62;
            4'h5: out_low = 8'h62;
            4'h6: out_low = 8'h62;
            4'h7: out_low = 8'h61;
            4'h8: out_low = 8'h61;
            4'h9: out_low = 8'h61;
            4'ha: out_low = 8'h61;
            4'hb: out_low = 8'h61;
            4'hc: out_low = 8'h60;
            4'hd: out_low = 8'h60;
            4'he: out_low = 8'h60;
            4'hf: out_low = 8'h60;
            default: out_low = 8'h00;
          endcase
        end
        6'h22: begin
          case (mant[3:0])
            4'h0: out_low = 8'h5f;
            4'h1: out_low = 8'h5f;
            4'h2: out_low = 8'h5f;
            4'h3: out_low = 8'h5f;
            4'h4: out_low = 8'h5e;
            4'h5: out_low = 8'h5e;
            4'h6: out_low = 8'h5e;
            4'h7: out_low = 8'h5e;
            4'h8: out_low = 8'h5d;
            4'h9: out_low = 8'h5d;
            4'ha: out_low = 8'h5d;
            4'hb: out_low = 8'h5d;
            4'hc: out_low = 8'h5c;
            4'hd: out_low = 8'h5c;
            4'he: out_low = 8'h5c;
            4'hf: out_low = 8'h5c;
            default: out_low = 8'h00;
          endcase
        end
        6'h23: begin
          case (mant[3:0])
            4'h0: out_low = 8'h5c;
            4'h1: out_low = 8'h5b;
            4'h2: out_low = 8'h5b;
            4'h3: out_low = 8'h5b;
            4'h4: out_low = 8'h5b;
            4'h5: out_low = 8'h5a;
            4'h6: out_low = 8'h5a;
            4'h7: out_low = 8'h5a;
            4'h8: out_low = 8'h5a;
            4'h9: out_low = 8'h59;
            4'ha: out_low = 8'h59;
            4'hb: out_low = 8'h59;
            4'hc: out_low = 8'h59;
            4'hd: out_low = 8'h59;
            4'he: out_low = 8'h58;
            4'hf: out_low = 8'h58;
            default: out_low = 8'h00;
          endcase
        end
        6'h24: begin
          case (mant[3:0])
            4'h0: out_low = 8'h58;
            4'h1: out_low = 8'h58;
            4'h2: out_low = 8'h57;
            4'h3: out_low = 8'h57;
            4'h4: out_low = 8'h57;
            4'h5: out_low = 8'h57;
            4'h6: out_low = 8'h56;
            4'h7: out_low = 8'h56;
            4'h8: out_low = 8'h56;
            4'h9: out_low = 8'h56;
            4'ha: out_low = 8'h56;
            4'hb: out_low = 8'h55;
            4'hc: out_low = 8'h55;
            4'hd: out_low = 8'h55;
            4'he: out_low = 8'h55;
            4'hf: out_low = 8'h54;
            default: out_low = 8'h00;
          endcase
        end
        6'h25: begin
          case (mant[3:0])
            4'h0: out_low = 8'h54;
            4'h1: out_low = 8'h54;
            4'h2: out_low = 8'h54;
            4'h3: out_low = 8'h53;
            4'h4: out_low = 8'h53;
            4'h5: out_low = 8'h53;
            4'h6: out_low = 8'h53;
            4'h7: out_low = 8'h53;
            4'h8: out_low = 8'h52;
            4'h9: out_low = 8'h52;
            4'ha: out_low = 8'h52;
            4'hb: out_low = 8'h52;
            4'hc: out_low = 8'h51;
            4'hd: out_low = 8'h51;
            4'he: out_low = 8'h51;
            4'hf: out_low = 8'h51;
            default: out_low = 8'h00;
          endcase
        end
        6'h26: begin
          case (mant[3:0])
            4'h0: out_low = 8'h51;
            4'h1: out_low = 8'h50;
            4'h2: out_low = 8'h50;
            4'h3: out_low = 8'h50;
            4'h4: out_low = 8'h50;
            4'h5: out_low = 8'h4f;
            4'h6: out_low = 8'h4f;
            4'h7: out_low = 8'h4f;
            4'h8: out_low = 8'h4f;
            4'h9: out_low = 8'h4e;
            4'ha: out_low = 8'h4e;
            4'hb: out_low = 8'h4e;
            4'hc: out_low = 8'h4e;
            4'hd: out_low = 8'h4e;
            4'he: out_low = 8'h4d;
            4'hf: out_low = 8'h4d;
            default: out_low = 8'h00;
          endcase
        end
        6'h27: begin
          case (mant[3:0])
            4'h0: out_low = 8'h4d;
            4'h1: out_low = 8'h4d;
            4'h2: out_low = 8'h4c;
            4'h3: out_low = 8'h4c;
            4'h4: out_low = 8'h4c;
            4'h5: out_low = 8'h4c;
            4'h6: out_low = 8'h4c;
            4'h7: out_low = 8'h4b;
            4'h8: out_low = 8'h4b;
            4'h9: out_low = 8'h4b;
            4'ha: out_low = 8'h4b;
            4'hb: out_low = 8'h4a;
            4'hc: out_low = 8'h4a;
            4'hd: out_low = 8'h4a;
            4'he: out_low = 8'h4a;
            4'hf: out_low = 8'h4a;
            default: out_low = 8'h00;
          endcase
        end
        6'h28: begin
          case (mant[3:0])
            4'h0: out_low = 8'h49;
            4'h1: out_low = 8'h49;
            4'h2: out_low = 8'h49;
            4'h3: out_low = 8'h49;
            4'h4: out_low = 8'h49;
            4'h5: out_low = 8'h48;
            4'h6: out_low = 8'h48;
            4'h7: out_low = 8'h48;
            4'h8: out_low = 8'h48;
            4'h9: out_low = 8'h47;
            4'ha: out_low = 8'h47;
            4'hb: out_low = 8'h47;
            4'hc: out_low = 8'h47;
            4'hd: out_low = 8'h47;
            4'he: out_low = 8'h46;
            4'hf: out_low = 8'h46;
            default: out_low = 8'h00;
          endcase
        end
        6'h29: begin
          case (mant[3:0])
            4'h0: out_low = 8'h46;
            4'h1: out_low = 8'h46;
            4'h2: out_low = 8'h45;
            4'h3: out_low = 8'h45;
            4'h4: out_low = 8'h45;
            4'h5: out_low = 8'h45;
            4'h6: out_low = 8'h45;
            4'h7: out_low = 8'h44;
            4'h8: out_low = 8'h44;
            4'h9: out_low = 8'h44;
            4'ha: out_low = 8'h44;
            4'hb: out_low = 8'h44;
            4'hc: out_low = 8'h43;
            4'hd: out_low = 8'h43;
            4'he: out_low = 8'h43;
            4'hf: out_low = 8'h43;
            default: out_low = 8'h00;
          endcase
        end
        6'h2a: begin
          case (mant[3:0])
            4'h0: out_low = 8'h42;
            4'h1: out_low = 8'h42;
            4'h2: out_low = 8'h42;
            4'h3: out_low = 8'h42;
            4'h4: out_low = 8'h42;
            4'h5: out_low = 8'h41;
            4'h6: out_low = 8'h41;
            4'h7: out_low = 8'h41;
            4'h8: out_low = 8'h41;
            4'h9: out_low = 8'h41;
            4'ha: out_low = 8'h40;
            4'hb: out_low = 8'h40;
            4'hc: out_low = 8'h40;
            4'hd: out_low = 8'h40;
            4'he: out_low = 8'h3f;
            4'hf: out_low = 8'h3f;
            default: out_low = 8'h00;
          endcase
        end
        6'h2b: begin
          case (mant[3:0])
            4'h0: out_low = 8'h3f;
            4'h1: out_low = 8'h3f;
            4'h2: out_low = 8'h3f;
            4'h3: out_low = 8'h3e;
            4'h4: out_low = 8'h3e;
            4'h5: out_low = 8'h3e;
            4'h6: out_low = 8'h3e;
            4'h7: out_low = 8'h3e;
            4'h8: out_low = 8'h3d;
            4'h9: out_low = 8'h3d;
            4'ha: out_low = 8'h3d;
            4'hb: out_low = 8'h3d;
            4'hc: out_low = 8'h3d;
            4'hd: out_low = 8'h3c;
            4'he: out_low = 8'h3c;
            4'hf: out_low = 8'h3c;
            default: out_low = 8'h00;
          endcase
        end
        6'h2c: begin
          case (mant[3:0])
            4'h0: out_low = 8'h3c;
            4'h1: out_low = 8'h3b;
            4'h2: out_low = 8'h3b;
            4'h3: out_low = 8'h3b;
            4'h4: out_low = 8'h3b;
            4'h5: out_low = 8'h3b;
            4'h6: out_low = 8'h3a;
            4'h7: out_low = 8'h3a;
            4'h8: out_low = 8'h3a;
            4'h9: out_low = 8'h3a;
            4'ha: out_low = 8'h3a;
            4'hb: out_low = 8'h39;
            4'hc: out_low = 8'h39;
            4'hd: out_low = 8'h39;
            4'he: out_low = 8'h39;
            4'hf: out_low = 8'h39;
            default: out_low = 8'h00;
          endcase
        end
        6'h2d: begin
          case (mant[3:0])
            4'h0: out_low = 8'h38;
            4'h1: out_low = 8'h38;
            4'h2: out_low = 8'h38;
            4'h3: out_low = 8'h38;
            4'h4: out_low = 8'h38;
            4'h5: out_low = 8'h37;
            4'h6: out_low = 8'h37;
            4'h7: out_low = 8'h37;
            4'h8: out_low = 8'h37;
            4'h9: out_low = 8'h36;
            4'ha: out_low = 8'h36;
            4'hb: out_low = 8'h36;
            4'hc: out_low = 8'h36;
            4'hd: out_low = 8'h36;
            4'he: out_low = 8'h35;
            4'hf: out_low = 8'h35;
            default: out_low = 8'h00;
          endcase
        end
        6'h2e: begin
          case (mant[3:0])
            4'h0: out_low = 8'h35;
            4'h1: out_low = 8'h35;
            4'h2: out_low = 8'h35;
            4'h3: out_low = 8'h34;
            4'h4: out_low = 8'h34;
            4'h5: out_low = 8'h34;
            4'h6: out_low = 8'h34;
            4'h7: out_low = 8'h34;
            4'h8: out_low = 8'h33;
            4'h9: out_low = 8'h33;
            4'ha: out_low = 8'h33;
            4'hb: out_low = 8'h33;
            4'hc: out_low = 8'h33;
            4'hd: out_low = 8'h32;
            4'he: out_low = 8'h32;
            4'hf: out_low = 8'h32;
            default: out_low = 8'h00;
          endcase
        end
        6'h2f: begin
          case (mant[3:0])
            4'h0: out_low = 8'h32;
            4'h1: out_low = 8'h32;
            4'h2: out_low = 8'h31;
            4'h3: out_low = 8'h31;
            4'h4: out_low = 8'h31;
            4'h5: out_low = 8'h31;
            4'h6: out_low = 8'h31;
            4'h7: out_low = 8'h30;
            4'h8: out_low = 8'h30;
            4'h9: out_low = 8'h30;
            4'ha: out_low = 8'h30;
            4'hb: out_low = 8'h30;
            4'hc: out_low = 8'h2f;
            4'hd: out_low = 8'h2f;
            4'he: out_low = 8'h2f;
            4'hf: out_low = 8'h2f;
            default: out_low = 8'h00;
          endcase
        end
        6'h30: begin
          case (mant[3:0])
            4'h0: out_low = 8'h2f;
            4'h1: out_low = 8'h2e;
            4'h2: out_low = 8'h2e;
            4'h3: out_low = 8'h2e;
            4'h4: out_low = 8'h2e;
            4'h5: out_low = 8'h2e;
            4'h6: out_low = 8'h2d;
            4'h7: out_low = 8'h2d;
            4'h8: out_low = 8'h2d;
            4'h9: out_low = 8'h2d;
            4'ha: out_low = 8'h2d;
            4'hb: out_low = 8'h2c;
            4'hc: out_low = 8'h2c;
            4'hd: out_low = 8'h2c;
            4'he: out_low = 8'h2c;
            4'hf: out_low = 8'h2c;
            default: out_low = 8'h00;
          endcase
        end
        6'h31: begin
          case (mant[3:0])
            4'h0: out_low = 8'h2b;
            4'h1: out_low = 8'h2b;
            4'h2: out_low = 8'h2b;
            4'h3: out_low = 8'h2b;
            4'h4: out_low = 8'h2b;
            4'h5: out_low = 8'h2a;
            4'h6: out_low = 8'h2a;
            4'h7: out_low = 8'h2a;
            4'h8: out_low = 8'h2a;
            4'h9: out_low = 8'h2a;
            4'ha: out_low = 8'h29;
            4'hb: out_low = 8'h29;
            4'hc: out_low = 8'h29;
            4'hd: out_low = 8'h29;
            4'he: out_low = 8'h29;
            4'hf: out_low = 8'h29;
            default: out_low = 8'h00;
          endcase
        end
        6'h32: begin
          case (mant[3:0])
            4'h0: out_low = 8'h28;
            4'h1: out_low = 8'h28;
            4'h2: out_low = 8'h28;
            4'h3: out_low = 8'h28;
            4'h4: out_low = 8'h28;
            4'h5: out_low = 8'h27;
            4'h6: out_low = 8'h27;
            4'h7: out_low = 8'h27;
            4'h8: out_low = 8'h27;
            4'h9: out_low = 8'h27;
            4'ha: out_low = 8'h26;
            4'hb: out_low = 8'h26;
            4'hc: out_low = 8'h26;
            4'hd: out_low = 8'h26;
            4'he: out_low = 8'h26;
            4'hf: out_low = 8'h25;
            default: out_low = 8'h00;
          endcase
        end
        6'h33: begin
          case (mant[3:0])
            4'h0: out_low = 8'h25;
            4'h1: out_low = 8'h25;
            4'h2: out_low = 8'h25;
            4'h3: out_low = 8'h25;
            4'h4: out_low = 8'h24;
            4'h5: out_low = 8'h24;
            4'h6: out_low = 8'h24;
            4'h7: out_low = 8'h24;
            4'h8: out_low = 8'h24;
            4'h9: out_low = 8'h23;
            4'ha: out_low = 8'h23;
            4'hb: out_low = 8'h23;
            4'hc: out_low = 8'h23;
            4'hd: out_low = 8'h23;
            4'he: out_low = 8'h23;
            4'hf: out_low = 8'h22;
            default: out_low = 8'h00;
          endcase
        end
        6'h34: begin
          case (mant[3:0])
            4'h0: out_low = 8'h22;
            4'h1: out_low = 8'h22;
            4'h2: out_low = 8'h22;
            4'h3: out_low = 8'h22;
            4'h4: out_low = 8'h21;
            4'h5: out_low = 8'h21;
            4'h6: out_low = 8'h21;
            4'h7: out_low = 8'h21;
            4'h8: out_low = 8'h21;
            4'h9: out_low = 8'h20;
            4'ha: out_low = 8'h20;
            4'hb: out_low = 8'h20;
            4'hc: out_low = 8'h20;
            4'hd: out_low = 8'h20;
            4'he: out_low = 8'h20;
            4'hf: out_low = 8'h1f;
            default: out_low = 8'h00;
          endcase
        end
        6'h35: begin
          case (mant[3:0])
            4'h0: out_low = 8'h1f;
            4'h1: out_low = 8'h1f;
            4'h2: out_low = 8'h1f;
            4'h3: out_low = 8'h1f;
            4'h4: out_low = 8'h1e;
            4'h5: out_low = 8'h1e;
            4'h6: out_low = 8'h1e;
            4'h7: out_low = 8'h1e;
            4'h8: out_low = 8'h1e;
            4'h9: out_low = 8'h1d;
            4'ha: out_low = 8'h1d;
            4'hb: out_low = 8'h1d;
            4'hc: out_low = 8'h1d;
            4'hd: out_low = 8'h1d;
            4'he: out_low = 8'h1d;
            4'hf: out_low = 8'h1c;
            default: out_low = 8'h00;
          endcase
        end
        6'h36: begin
          case (mant[3:0])
            4'h0: out_low = 8'h1c;
            4'h1: out_low = 8'h1c;
            4'h2: out_low = 8'h1c;
            4'h3: out_low = 8'h1c;
            4'h4: out_low = 8'h1b;
            4'h5: out_low = 8'h1b;
            4'h6: out_low = 8'h1b;
            4'h7: out_low = 8'h1b;
            4'h8: out_low = 8'h1b;
            4'h9: out_low = 8'h1a;
            4'ha: out_low = 8'h1a;
            4'hb: out_low = 8'h1a;
            4'hc: out_low = 8'h1a;
            4'hd: out_low = 8'h1a;
            4'he: out_low = 8'h1a;
            4'hf: out_low = 8'h19;
            default: out_low = 8'h00;
          endcase
        end
        6'h37: begin
          case (mant[3:0])
            4'h0: out_low = 8'h19;
            4'h1: out_low = 8'h19;
            4'h2: out_low = 8'h19;
            4'h3: out_low = 8'h19;
            4'h4: out_low = 8'h18;
            4'h5: out_low = 8'h18;
            4'h6: out_low = 8'h18;
            4'h7: out_low = 8'h18;
            4'h8: out_low = 8'h18;
            4'h9: out_low = 8'h18;
            4'ha: out_low = 8'h17;
            4'hb: out_low = 8'h17;
            4'hc: out_low = 8'h17;
            4'hd: out_low = 8'h17;
            4'he: out_low = 8'h17;
            4'hf: out_low = 8'h16;
            default: out_low = 8'h00;
          endcase
        end
        6'h38: begin
          case (mant[3:0])
            4'h0: out_low = 8'h16;
            4'h1: out_low = 8'h16;
            4'h2: out_low = 8'h16;
            4'h3: out_low = 8'h16;
            4'h4: out_low = 8'h16;
            4'h5: out_low = 8'h15;
            4'h6: out_low = 8'h15;
            4'h7: out_low = 8'h15;
            4'h8: out_low = 8'h15;
            4'h9: out_low = 8'h15;
            4'ha: out_low = 8'h14;
            4'hb: out_low = 8'h14;
            4'hc: out_low = 8'h14;
            4'hd: out_low = 8'h14;
            4'he: out_low = 8'h14;
            4'hf: out_low = 8'h14;
            default: out_low = 8'h00;
          endcase
        end
        6'h39: begin
          case (mant[3:0])
            4'h0: out_low = 8'h13;
            4'h1: out_low = 8'h13;
            4'h2: out_low = 8'h13;
            4'h3: out_low = 8'h13;
            4'h4: out_low = 8'h13;
            4'h5: out_low = 8'h12;
            4'h6: out_low = 8'h12;
            4'h7: out_low = 8'h12;
            4'h8: out_low = 8'h12;
            4'h9: out_low = 8'h12;
            4'ha: out_low = 8'h12;
            4'hb: out_low = 8'h11;
            4'hc: out_low = 8'h11;
            4'hd: out_low = 8'h11;
            4'he: out_low = 8'h11;
            4'hf: out_low = 8'h11;
            default: out_low = 8'h00;
          endcase
        end
        6'h3a: begin
          case (mant[3:0])
            4'h0: out_low = 8'h11;
            4'h1: out_low = 8'h10;
            4'h2: out_low = 8'h10;
            4'h3: out_low = 8'h10;
            4'h4: out_low = 8'h10;
            4'h5: out_low = 8'h10;
            4'h6: out_low = 8'h0f;
            4'h7: out_low = 8'h0f;
            4'h8: out_low = 8'h0f;
            4'h9: out_low = 8'h0f;
            4'ha: out_low = 8'h0f;
            4'hb: out_low = 8'h0f;
            4'hc: out_low = 8'h0e;
            4'hd: out_low = 8'h0e;
            4'he: out_low = 8'h0e;
            4'hf: out_low = 8'h0e;
            default: out_low = 8'h00;
          endcase
        end
        6'h3b: begin
          case (mant[3:0])
            4'h0: out_low = 8'h0e;
            4'h1: out_low = 8'h0e;
            4'h2: out_low = 8'h0d;
            4'h3: out_low = 8'h0d;
            4'h4: out_low = 8'h0d;
            4'h5: out_low = 8'h0d;
            4'h6: out_low = 8'h0d;
            4'h7: out_low = 8'h0c;
            4'h8: out_low = 8'h0c;
            4'h9: out_low = 8'h0c;
            4'ha: out_low = 8'h0c;
            4'hb: out_low = 8'h0c;
            4'hc: out_low = 8'h0c;
            4'hd: out_low = 8'h0b;
            4'he: out_low = 8'h0b;
            4'hf: out_low = 8'h0b;
            default: out_low = 8'h00;
          endcase
        end
        6'h3c: begin
          case (mant[3:0])
            4'h0: out_low = 8'h0b;
            4'h1: out_low = 8'h0b;
            4'h2: out_low = 8'h0b;
            4'h3: out_low = 8'h0a;
            4'h4: out_low = 8'h0a;
            4'h5: out_low = 8'h0a;
            4'h6: out_low = 8'h0a;
            4'h7: out_low = 8'h0a;
            4'h8: out_low = 8'h0a;
            4'h9: out_low = 8'h09;
            4'ha: out_low = 8'h09;
            4'hb: out_low = 8'h09;
            4'hc: out_low = 8'h09;
            4'hd: out_low = 8'h09;
            4'he: out_low = 8'h08;
            4'hf: out_low = 8'h08;
            default: out_low = 8'h00;
          endcase
        end
        6'h3d: begin
          case (mant[3:0])
            4'h0: out_low = 8'h08;
            4'h1: out_low = 8'h08;
            4'h2: out_low = 8'h08;
            4'h3: out_low = 8'h08;
            4'h4: out_low = 8'h07;
            4'h5: out_low = 8'h07;
            4'h6: out_low = 8'h07;
            4'h7: out_low = 8'h07;
            4'h8: out_low = 8'h07;
            4'h9: out_low = 8'h07;
            4'ha: out_low = 8'h06;
            4'hb: out_low = 8'h06;
            4'hc: out_low = 8'h06;
            4'hd: out_low = 8'h06;
            4'he: out_low = 8'h06;
            4'hf: out_low = 8'h06;
            default: out_low = 8'h00;
          endcase
        end
        6'h3e: begin
          case (mant[3:0])
            4'h0: out_low = 8'h05;
            4'h1: out_low = 8'h05;
            4'h2: out_low = 8'h05;
            4'h3: out_low = 8'h05;
            4'h4: out_low = 8'h05;
            4'h5: out_low = 8'h05;
            4'h6: out_low = 8'h04;
            4'h7: out_low = 8'h04;
            4'h8: out_low = 8'h04;
            4'h9: out_low = 8'h04;
            4'ha: out_low = 8'h04;
            4'hb: out_low = 8'h04;
            4'hc: out_low = 8'h03;
            4'hd: out_low = 8'h03;
            4'he: out_low = 8'h03;
            4'hf: out_low = 8'h03;
            default: out_low = 8'h00;
          endcase
        end
        6'h3f: begin
          case (mant[3:0])
            4'h0: out_low = 8'h03;
            4'h1: out_low = 8'h03;
            4'h2: out_low = 8'h02;
            4'h3: out_low = 8'h02;
            4'h4: out_low = 8'h02;
            4'h5: out_low = 8'h02;
            4'h6: out_low = 8'h02;
            4'h7: out_low = 8'h02;
            4'h8: out_low = 8'h01;
            4'h9: out_low = 8'h01;
            4'ha: out_low = 8'h01;
            4'hb: out_low = 8'h01;
            4'hc: out_low = 8'h01;
            4'hd: out_low = 8'h01;
            4'he: out_low = 8'h00;
            4'hf: out_low = 8'h00;
            default: out_low = 8'h00;
          endcase
        end
        default: out_low = 8'h00;
      endcase
      end
      default: out_low = 8'h00;
    endcase
  end
  reg mag_b14;
  always @* begin
    case (exp)
      5'h01: begin
        mag_b14 = 1;
      end
      5'h02: begin
        mag_b14 = 1;
      end
      5'h03: begin
        mag_b14 = 1;
      end
      5'h04: begin
        mag_b14 = 1;
      end
      5'h05: begin
        mag_b14 = 1;
      end
      5'h06: begin
        mag_b14 = 1;
      end
      5'h07: begin
        mag_b14 = 1;
      end
      5'h08: begin
        mag_b14 = 1;
      end
      5'h09: begin
        mag_b14 = 1;
      end
      5'h0a: begin
        mag_b14 = 1;
      end
      5'h0b: begin
        mag_b14 = 1;
      end
      5'h0c: begin
        if (mant <= 10'h000) begin
          mag_b14 = 1;
        end else begin
          mag_b14 = 0;
        end
      end
      5'h0d: begin
        mag_b14 = 0;
      end
      5'h0e: begin
        mag_b14 = 0;
      end
      5'h0f: begin
        mag_b14 = 0;
      end
      5'h10: begin
        mag_b14 = 0;
      end
      5'h11: begin
        mag_b14 = 0;
      end
      5'h12: begin
        mag_b14 = 0;
      end
      5'h13: begin
        mag_b14 = 0;
      end
      5'h14: begin
        mag_b14 = 0;
      end
      5'h15: begin
        mag_b14 = 0;
      end
      5'h16: begin
        mag_b14 = 0;
      end
      5'h17: begin
        mag_b14 = 0;
      end
      5'h18: begin
        mag_b14 = 0;
      end
      5'h19: begin
        mag_b14 = 0;
      end
      5'h1a: begin
        mag_b14 = 0;
      end
      5'h1b: begin
        mag_b14 = 0;
      end
      5'h1c: begin
        mag_b14 = 0;
      end
      5'h1d: begin
        mag_b14 = 0;
      end
      5'h1e: begin
        mag_b14 = 0;
      end
      default: mag_b14 = 1'b0;
    endcase
  end
  reg mag_b13;
  always @* begin
    case (exp)
      5'h01: begin
        mag_b13 = 0;
      end
      5'h02: begin
        mag_b13 = 0;
      end
      5'h03: begin
        mag_b13 = 0;
      end
      5'h04: begin
        mag_b13 = 0;
      end
      5'h05: begin
        mag_b13 = 0;
      end
      5'h06: begin
        mag_b13 = 0;
      end
      5'h07: begin
        mag_b13 = 0;
      end
      5'h08: begin
        mag_b13 = 0;
      end
      5'h09: begin
        mag_b13 = 0;
      end
      5'h0a: begin
        mag_b13 = 0;
      end
      5'h0b: begin
        mag_b13 = 0;
      end
      5'h0c: begin
        if (mant <= 10'h000) begin
          mag_b13 = 0;
        end else begin
          mag_b13 = 1;
        end
      end
      5'h0d: begin
        mag_b13 = 1;
      end
      5'h0e: begin
        mag_b13 = 1;
      end
      5'h0f: begin
        mag_b13 = 1;
      end
      5'h10: begin
        mag_b13 = 1;
      end
      5'h11: begin
        mag_b13 = 1;
      end
      5'h12: begin
        mag_b13 = 1;
      end
      5'h13: begin
        mag_b13 = 1;
      end
      5'h14: begin
        mag_b13 = 1;
      end
      5'h15: begin
        mag_b13 = 1;
      end
      5'h16: begin
        mag_b13 = 1;
      end
      5'h17: begin
        mag_b13 = 1;
      end
      5'h18: begin
        mag_b13 = 1;
      end
      5'h19: begin
        mag_b13 = 1;
      end
      5'h1a: begin
        mag_b13 = 1;
      end
      5'h1b: begin
        mag_b13 = 1;
      end
      5'h1c: begin
        mag_b13 = 1;
      end
      5'h1d: begin
        mag_b13 = 1;
      end
      5'h1e: begin
        mag_b13 = 1;
      end
      default: mag_b13 = 1'b0;
    endcase
  end
  reg mag_b12;
  always @* begin
    case (exp)
      5'h01: begin
        mag_b12 = 0;
      end
      5'h02: begin
        mag_b12 = 0;
      end
      5'h03: begin
        mag_b12 = 0;
      end
      5'h04: begin
        mag_b12 = 0;
      end
      5'h05: begin
        mag_b12 = 0;
      end
      5'h06: begin
        mag_b12 = 0;
      end
      5'h07: begin
        mag_b12 = 0;
      end
      5'h08: begin
        mag_b12 = 0;
      end
      5'h09: begin
        mag_b12 = 0;
      end
      5'h0a: begin
        mag_b12 = 0;
      end
      5'h0b: begin
        mag_b12 = 0;
      end
      5'h0c: begin
        if (mant <= 10'h000) begin
          mag_b12 = 0;
        end else begin
          mag_b12 = 1;
        end
      end
      5'h0d: begin
        mag_b12 = 1;
      end
      5'h0e: begin
        mag_b12 = 1;
      end
      5'h0f: begin
        mag_b12 = 1;
      end
      5'h10: begin
        mag_b12 = 1;
      end
      5'h11: begin
        mag_b12 = 1;
      end
      5'h12: begin
        mag_b12 = 1;
      end
      5'h13: begin
        mag_b12 = 1;
      end
      5'h14: begin
        mag_b12 = 1;
      end
      5'h15: begin
        mag_b12 = 1;
      end
      5'h16: begin
        mag_b12 = 1;
      end
      5'h17: begin
        mag_b12 = 1;
      end
      5'h18: begin
        if (mant <= 10'h000) begin
          mag_b12 = 1;
        end else begin
          mag_b12 = 0;
        end
      end
      5'h19: begin
        mag_b12 = 0;
      end
      5'h1a: begin
        mag_b12 = 0;
      end
      5'h1b: begin
        mag_b12 = 0;
      end
      5'h1c: begin
        mag_b12 = 0;
      end
      5'h1d: begin
        mag_b12 = 0;
      end
      5'h1e: begin
        mag_b12 = 0;
      end
      default: mag_b12 = 1'b0;
    endcase
  end
  reg mag_b11;
  always @* begin
    case (exp)
      5'h01: begin
        mag_b11 = 1;
      end
      5'h02: begin
        mag_b11 = 1;
      end
      5'h03: begin
        mag_b11 = 1;
      end
      5'h04: begin
        mag_b11 = 1;
      end
      5'h05: begin
        mag_b11 = 1;
      end
      5'h06: begin
        if (mant <= 10'h000) begin
          mag_b11 = 1;
        end else begin
          mag_b11 = 0;
        end
      end
      5'h07: begin
        mag_b11 = 0;
      end
      5'h08: begin
        mag_b11 = 0;
      end
      5'h09: begin
        mag_b11 = 0;
      end
      5'h0a: begin
        mag_b11 = 0;
      end
      5'h0b: begin
        mag_b11 = 0;
      end
      5'h0c: begin
        if (mant <= 10'h000) begin
          mag_b11 = 0;
        end else begin
          mag_b11 = 1;
        end
      end
      5'h0d: begin
        mag_b11 = 1;
      end
      5'h0e: begin
        mag_b11 = 1;
      end
      5'h0f: begin
        mag_b11 = 1;
      end
      5'h10: begin
        mag_b11 = 1;
      end
      5'h11: begin
        mag_b11 = 1;
      end
      5'h12: begin
        if (mant <= 10'h000) begin
          mag_b11 = 1;
        end else begin
          mag_b11 = 0;
        end
      end
      5'h13: begin
        mag_b11 = 0;
      end
      5'h14: begin
        mag_b11 = 0;
      end
      5'h15: begin
        mag_b11 = 0;
      end
      5'h16: begin
        mag_b11 = 0;
      end
      5'h17: begin
        mag_b11 = 0;
      end
      5'h18: begin
        if (mant <= 10'h000) begin
          mag_b11 = 0;
        end else begin
          mag_b11 = 1;
        end
      end
      5'h19: begin
        mag_b11 = 1;
      end
      5'h1a: begin
        mag_b11 = 1;
      end
      5'h1b: begin
        mag_b11 = 1;
      end
      5'h1c: begin
        mag_b11 = 1;
      end
      5'h1d: begin
        mag_b11 = 1;
      end
      5'h1e: begin
        if (mant <= 10'h000) begin
          mag_b11 = 1;
        end else begin
          mag_b11 = 0;
        end
      end
      default: mag_b11 = 1'b0;
    endcase
  end
  reg mag_b10;
  always @* begin
    case (exp)
      5'h01: begin
        mag_b10 = 1;
      end
      5'h02: begin
        mag_b10 = 1;
      end
      5'h03: begin
        if (mant <= 10'h000) begin
          mag_b10 = 1;
        end else begin
          mag_b10 = 0;
        end
      end
      5'h04: begin
        mag_b10 = 0;
      end
      5'h05: begin
        mag_b10 = 0;
      end
      5'h06: begin
        if (mant <= 10'h000) begin
          mag_b10 = 0;
        end else begin
          mag_b10 = 1;
        end
      end
      5'h07: begin
        mag_b10 = 1;
      end
      5'h08: begin
        mag_b10 = 1;
      end
      5'h09: begin
        if (mant <= 10'h000) begin
          mag_b10 = 1;
        end else begin
          mag_b10 = 0;
        end
      end
      5'h0a: begin
        mag_b10 = 0;
      end
      5'h0b: begin
        mag_b10 = 0;
      end
      5'h0c: begin
        if (mant <= 10'h000) begin
          mag_b10 = 0;
        end else begin
          mag_b10 = 1;
        end
      end
      5'h0d: begin
        mag_b10 = 1;
      end
      5'h0e: begin
        mag_b10 = 1;
      end
      5'h0f: begin
        if (mant <= 10'h000) begin
          mag_b10 = 1;
        end else begin
          mag_b10 = 0;
        end
      end
      5'h10: begin
        mag_b10 = 0;
      end
      5'h11: begin
        mag_b10 = 0;
      end
      5'h12: begin
        if (mant <= 10'h000) begin
          mag_b10 = 0;
        end else begin
          mag_b10 = 1;
        end
      end
      5'h13: begin
        mag_b10 = 1;
      end
      5'h14: begin
        mag_b10 = 1;
      end
      5'h15: begin
        if (mant <= 10'h000) begin
          mag_b10 = 1;
        end else begin
          mag_b10 = 0;
        end
      end
      5'h16: begin
        mag_b10 = 0;
      end
      5'h17: begin
        mag_b10 = 0;
      end
      5'h18: begin
        if (mant <= 10'h000) begin
          mag_b10 = 0;
        end else begin
          mag_b10 = 1;
        end
      end
      5'h19: begin
        mag_b10 = 1;
      end
      5'h1a: begin
        mag_b10 = 1;
      end
      5'h1b: begin
        if (mant <= 10'h000) begin
          mag_b10 = 1;
        end else begin
          mag_b10 = 0;
        end
      end
      5'h1c: begin
        mag_b10 = 0;
      end
      5'h1d: begin
        mag_b10 = 0;
      end
      5'h1e: begin
        if (mant <= 10'h000) begin
          mag_b10 = 0;
        end else begin
          mag_b10 = 1;
        end
      end
      default: mag_b10 = 1'b0;
    endcase
  end
  reg mag_b9;
  always @* begin
    case (exp)
      5'h01: begin
        if (mant <= 10'h0be) begin
          mag_b9 = 1;
        end else begin
          mag_b9 = 0;
        end
      end
      5'h02: begin
        mag_b9 = 0;
      end
      5'h03: begin
        if (mant <= 10'h000) begin
          mag_b9 = 0;
        end else begin
          mag_b9 = 1;
        end
      end
      5'h04: begin
        if (mant <= 10'h0be) begin
          mag_b9 = 1;
        end else begin
          mag_b9 = 0;
        end
      end
      5'h05: begin
        mag_b9 = 0;
      end
      5'h06: begin
        if (mant <= 10'h000) begin
          mag_b9 = 0;
        end else begin
          mag_b9 = 1;
        end
      end
      5'h07: begin
        if (mant <= 10'h0be) begin
          mag_b9 = 1;
        end else begin
          mag_b9 = 0;
        end
      end
      5'h08: begin
        mag_b9 = 0;
      end
      5'h09: begin
        if (mant <= 10'h000) begin
          mag_b9 = 0;
        end else begin
          mag_b9 = 1;
        end
      end
      5'h0a: begin
        if (mant <= 10'h0be) begin
          mag_b9 = 1;
        end else begin
          mag_b9 = 0;
        end
      end
      5'h0b: begin
        mag_b9 = 0;
      end
      5'h0c: begin
        if (mant <= 10'h000) begin
          mag_b9 = 0;
        end else begin
          mag_b9 = 1;
        end
      end
      5'h0d: begin
        if (mant <= 10'h0be) begin
          mag_b9 = 1;
        end else begin
          mag_b9 = 0;
        end
      end
      5'h0e: begin
        mag_b9 = 0;
      end
      5'h0f: begin
        if (mant <= 10'h000) begin
          mag_b9 = 0;
        end else begin
          mag_b9 = 1;
        end
      end
      5'h10: begin
        if (mant <= 10'h0be) begin
          mag_b9 = 1;
        end else begin
          mag_b9 = 0;
        end
      end
      5'h11: begin
        mag_b9 = 0;
      end
      5'h12: begin
        if (mant <= 10'h000) begin
          mag_b9 = 0;
        end else begin
          mag_b9 = 1;
        end
      end
      5'h13: begin
        if (mant <= 10'h0be) begin
          mag_b9 = 1;
        end else begin
          mag_b9 = 0;
        end
      end
      5'h14: begin
        mag_b9 = 0;
      end
      5'h15: begin
        if (mant <= 10'h000) begin
          mag_b9 = 0;
        end else begin
          mag_b9 = 1;
        end
      end
      5'h16: begin
        if (mant <= 10'h0be) begin
          mag_b9 = 1;
        end else begin
          mag_b9 = 0;
        end
      end
      5'h17: begin
        mag_b9 = 0;
      end
      5'h18: begin
        if (mant <= 10'h000) begin
          mag_b9 = 0;
        end else begin
          mag_b9 = 1;
        end
      end
      5'h19: begin
        if (mant <= 10'h0be) begin
          mag_b9 = 1;
        end else begin
          mag_b9 = 0;
        end
      end
      5'h1a: begin
        mag_b9 = 0;
      end
      5'h1b: begin
        if (mant <= 10'h000) begin
          mag_b9 = 0;
        end else begin
          mag_b9 = 1;
        end
      end
      5'h1c: begin
        if (mant <= 10'h0be) begin
          mag_b9 = 1;
        end else begin
          mag_b9 = 0;
        end
      end
      5'h1d: begin
        mag_b9 = 0;
      end
      5'h1e: begin
        if (mant <= 10'h000) begin
          mag_b9 = 0;
        end else begin
          mag_b9 = 1;
        end
      end
      default: mag_b9 = 1'b0;
    endcase
  end
  reg mag_b8;
  always @* begin
    case (exp)
      5'h01: begin
        if (mant <= 10'h0be) begin
          mag_b8 = 0;
        end else begin
          mag_b8 = 1;
        end
      end
      5'h02: begin
        if (mant <= 10'h019) begin
          mag_b8 = 1;
        end else begin
          mag_b8 = 0;
        end
      end
      5'h03: begin
        if (mant <= 10'h000) begin
          mag_b8 = 0;
        end else begin
          if (mant <= 10'h1f9) begin
            mag_b8 = 1;
          end else begin
            mag_b8 = 0;
          end
        end
      end
      5'h04: begin
        if (mant <= 10'h0be) begin
          mag_b8 = 0;
        end else begin
          mag_b8 = 1;
        end
      end
      5'h05: begin
        if (mant <= 10'h019) begin
          mag_b8 = 1;
        end else begin
          mag_b8 = 0;
        end
      end
      5'h06: begin
        if (mant <= 10'h000) begin
          mag_b8 = 0;
        end else begin
          if (mant <= 10'h1f9) begin
            mag_b8 = 1;
          end else begin
            mag_b8 = 0;
          end
        end
      end
      5'h07: begin
        if (mant <= 10'h0be) begin
          mag_b8 = 0;
        end else begin
          mag_b8 = 1;
        end
      end
      5'h08: begin
        if (mant <= 10'h019) begin
          mag_b8 = 1;
        end else begin
          mag_b8 = 0;
        end
      end
      5'h09: begin
        if (mant <= 10'h000) begin
          mag_b8 = 0;
        end else begin
          if (mant <= 10'h1f9) begin
            mag_b8 = 1;
          end else begin
            mag_b8 = 0;
          end
        end
      end
      5'h0a: begin
        if (mant <= 10'h0be) begin
          mag_b8 = 0;
        end else begin
          mag_b8 = 1;
        end
      end
      5'h0b: begin
        if (mant <= 10'h019) begin
          mag_b8 = 1;
        end else begin
          mag_b8 = 0;
        end
      end
      5'h0c: begin
        if (mant <= 10'h000) begin
          mag_b8 = 0;
        end else begin
          if (mant <= 10'h1f9) begin
            mag_b8 = 1;
          end else begin
            mag_b8 = 0;
          end
        end
      end
      5'h0d: begin
        if (mant <= 10'h0be) begin
          mag_b8 = 0;
        end else begin
          mag_b8 = 1;
        end
      end
      5'h0e: begin
        if (mant <= 10'h019) begin
          mag_b8 = 1;
        end else begin
          mag_b8 = 0;
        end
      end
      5'h0f: begin
        if (mant <= 10'h000) begin
          mag_b8 = 0;
        end else begin
          if (mant <= 10'h1f9) begin
            mag_b8 = 1;
          end else begin
            mag_b8 = 0;
          end
        end
      end
      5'h10: begin
        if (mant <= 10'h0be) begin
          mag_b8 = 0;
        end else begin
          mag_b8 = 1;
        end
      end
      5'h11: begin
        if (mant <= 10'h019) begin
          mag_b8 = 1;
        end else begin
          mag_b8 = 0;
        end
      end
      5'h12: begin
        if (mant <= 10'h000) begin
          mag_b8 = 0;
        end else begin
          if (mant <= 10'h1f9) begin
            mag_b8 = 1;
          end else begin
            mag_b8 = 0;
          end
        end
      end
      5'h13: begin
        if (mant <= 10'h0be) begin
          mag_b8 = 0;
        end else begin
          mag_b8 = 1;
        end
      end
      5'h14: begin
        if (mant <= 10'h019) begin
          mag_b8 = 1;
        end else begin
          mag_b8 = 0;
        end
      end
      5'h15: begin
        if (mant <= 10'h000) begin
          mag_b8 = 0;
        end else begin
          if (mant <= 10'h1f9) begin
            mag_b8 = 1;
          end else begin
            mag_b8 = 0;
          end
        end
      end
      5'h16: begin
        if (mant <= 10'h0be) begin
          mag_b8 = 0;
        end else begin
          mag_b8 = 1;
        end
      end
      5'h17: begin
        if (mant <= 10'h019) begin
          mag_b8 = 1;
        end else begin
          mag_b8 = 0;
        end
      end
      5'h18: begin
        if (mant <= 10'h000) begin
          mag_b8 = 0;
        end else begin
          if (mant <= 10'h1f9) begin
            mag_b8 = 1;
          end else begin
            mag_b8 = 0;
          end
        end
      end
      5'h19: begin
        if (mant <= 10'h0be) begin
          mag_b8 = 0;
        end else begin
          mag_b8 = 1;
        end
      end
      5'h1a: begin
        if (mant <= 10'h019) begin
          mag_b8 = 1;
        end else begin
          mag_b8 = 0;
        end
      end
      5'h1b: begin
        if (mant <= 10'h000) begin
          mag_b8 = 0;
        end else begin
          if (mant <= 10'h1f9) begin
            mag_b8 = 1;
          end else begin
            mag_b8 = 0;
          end
        end
      end
      5'h1c: begin
        if (mant <= 10'h0be) begin
          mag_b8 = 0;
        end else begin
          mag_b8 = 1;
        end
      end
      5'h1d: begin
        if (mant <= 10'h019) begin
          mag_b8 = 1;
        end else begin
          mag_b8 = 0;
        end
      end
      5'h1e: begin
        if (mant <= 10'h000) begin
          mag_b8 = 0;
        end else begin
          if (mant <= 10'h1f9) begin
            mag_b8 = 1;
          end else begin
            mag_b8 = 0;
          end
        end
      end
      default: mag_b8 = 1'b0;
    endcase
  end
  wire [14:0] active_mag = {mag_b14, mag_b13, mag_b12, mag_b11, mag_b10, mag_b9, mag_b8, out_low};
  wire [15:0] active_out = {sign, active_mag};
  assign out = active ? active_out : special_out;
endmodule
