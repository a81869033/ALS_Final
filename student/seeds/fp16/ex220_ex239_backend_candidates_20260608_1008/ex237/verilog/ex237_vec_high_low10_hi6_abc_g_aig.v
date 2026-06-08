module ex237_vec_high_low10_hi6(in, out);
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
      6'h00: special_out = 16'h0000;
      6'h1f: begin
        case (mant)
          10'h000: special_out = 16'h7c00;
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
      6'h20: special_out = 16'h8000;
      6'h3f: begin
        case (mant)
          10'h000: special_out = 16'hfc00;
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
  reg [9:0] out_low;
  always @* begin
    case (cls)
      2'h0: begin
      case (mant[9:4])
        6'h00: begin
          case (mant[3:0])
            4'h0: out_low = 10'h000;
            4'h1: out_low = 10'h000;
            4'h2: out_low = 10'h001;
            4'h3: out_low = 10'h001;
            4'h4: out_low = 10'h001;
            4'h5: out_low = 10'h002;
            4'h6: out_low = 10'h002;
            4'h7: out_low = 10'h002;
            4'h8: out_low = 10'h003;
            4'h9: out_low = 10'h003;
            4'ha: out_low = 10'h003;
            4'hb: out_low = 10'h004;
            4'hc: out_low = 10'h004;
            4'hd: out_low = 10'h004;
            4'he: out_low = 10'h005;
            4'hf: out_low = 10'h005;
            default: out_low = 10'h000;
          endcase
        end
        6'h01: begin
          case (mant[3:0])
            4'h0: out_low = 10'h005;
            4'h1: out_low = 10'h006;
            4'h2: out_low = 10'h006;
            4'h3: out_low = 10'h006;
            4'h4: out_low = 10'h007;
            4'h5: out_low = 10'h007;
            4'h6: out_low = 10'h007;
            4'h7: out_low = 10'h008;
            4'h8: out_low = 10'h008;
            4'h9: out_low = 10'h008;
            4'ha: out_low = 10'h009;
            4'hb: out_low = 10'h009;
            4'hc: out_low = 10'h009;
            4'hd: out_low = 10'h00a;
            4'he: out_low = 10'h00a;
            4'hf: out_low = 10'h00a;
            default: out_low = 10'h000;
          endcase
        end
        6'h02: begin
          case (mant[3:0])
            4'h0: out_low = 10'h00b;
            4'h1: out_low = 10'h00b;
            4'h2: out_low = 10'h00b;
            4'h3: out_low = 10'h00c;
            4'h4: out_low = 10'h00c;
            4'h5: out_low = 10'h00c;
            4'h6: out_low = 10'h00d;
            4'h7: out_low = 10'h00d;
            4'h8: out_low = 10'h00d;
            4'h9: out_low = 10'h00d;
            4'ha: out_low = 10'h00e;
            4'hb: out_low = 10'h00e;
            4'hc: out_low = 10'h00e;
            4'hd: out_low = 10'h00f;
            4'he: out_low = 10'h00f;
            4'hf: out_low = 10'h00f;
            default: out_low = 10'h000;
          endcase
        end
        6'h03: begin
          case (mant[3:0])
            4'h0: out_low = 10'h010;
            4'h1: out_low = 10'h010;
            4'h2: out_low = 10'h010;
            4'h3: out_low = 10'h011;
            4'h4: out_low = 10'h011;
            4'h5: out_low = 10'h011;
            4'h6: out_low = 10'h012;
            4'h7: out_low = 10'h012;
            4'h8: out_low = 10'h012;
            4'h9: out_low = 10'h013;
            4'ha: out_low = 10'h013;
            4'hb: out_low = 10'h013;
            4'hc: out_low = 10'h014;
            4'hd: out_low = 10'h014;
            4'he: out_low = 10'h014;
            4'hf: out_low = 10'h015;
            default: out_low = 10'h000;
          endcase
        end
        6'h04: begin
          case (mant[3:0])
            4'h0: out_low = 10'h015;
            4'h1: out_low = 10'h015;
            4'h2: out_low = 10'h016;
            4'h3: out_low = 10'h016;
            4'h4: out_low = 10'h016;
            4'h5: out_low = 10'h017;
            4'h6: out_low = 10'h017;
            4'h7: out_low = 10'h017;
            4'h8: out_low = 10'h017;
            4'h9: out_low = 10'h018;
            4'ha: out_low = 10'h018;
            4'hb: out_low = 10'h018;
            4'hc: out_low = 10'h019;
            4'hd: out_low = 10'h019;
            4'he: out_low = 10'h019;
            4'hf: out_low = 10'h01a;
            default: out_low = 10'h000;
          endcase
        end
        6'h05: begin
          case (mant[3:0])
            4'h0: out_low = 10'h01a;
            4'h1: out_low = 10'h01a;
            4'h2: out_low = 10'h01b;
            4'h3: out_low = 10'h01b;
            4'h4: out_low = 10'h01b;
            4'h5: out_low = 10'h01c;
            4'h6: out_low = 10'h01c;
            4'h7: out_low = 10'h01c;
            4'h8: out_low = 10'h01d;
            4'h9: out_low = 10'h01d;
            4'ha: out_low = 10'h01d;
            4'hb: out_low = 10'h01d;
            4'hc: out_low = 10'h01e;
            4'hd: out_low = 10'h01e;
            4'he: out_low = 10'h01e;
            4'hf: out_low = 10'h01f;
            default: out_low = 10'h000;
          endcase
        end
        6'h06: begin
          case (mant[3:0])
            4'h0: out_low = 10'h01f;
            4'h1: out_low = 10'h01f;
            4'h2: out_low = 10'h020;
            4'h3: out_low = 10'h020;
            4'h4: out_low = 10'h020;
            4'h5: out_low = 10'h021;
            4'h6: out_low = 10'h021;
            4'h7: out_low = 10'h021;
            4'h8: out_low = 10'h022;
            4'h9: out_low = 10'h022;
            4'ha: out_low = 10'h022;
            4'hb: out_low = 10'h022;
            4'hc: out_low = 10'h023;
            4'hd: out_low = 10'h023;
            4'he: out_low = 10'h023;
            4'hf: out_low = 10'h024;
            default: out_low = 10'h000;
          endcase
        end
        6'h07: begin
          case (mant[3:0])
            4'h0: out_low = 10'h024;
            4'h1: out_low = 10'h024;
            4'h2: out_low = 10'h025;
            4'h3: out_low = 10'h025;
            4'h4: out_low = 10'h025;
            4'h5: out_low = 10'h026;
            4'h6: out_low = 10'h026;
            4'h7: out_low = 10'h026;
            4'h8: out_low = 10'h027;
            4'h9: out_low = 10'h027;
            4'ha: out_low = 10'h027;
            4'hb: out_low = 10'h027;
            4'hc: out_low = 10'h028;
            4'hd: out_low = 10'h028;
            4'he: out_low = 10'h028;
            4'hf: out_low = 10'h029;
            default: out_low = 10'h000;
          endcase
        end
        6'h08: begin
          case (mant[3:0])
            4'h0: out_low = 10'h029;
            4'h1: out_low = 10'h029;
            4'h2: out_low = 10'h02a;
            4'h3: out_low = 10'h02a;
            4'h4: out_low = 10'h02a;
            4'h5: out_low = 10'h02b;
            4'h6: out_low = 10'h02b;
            4'h7: out_low = 10'h02b;
            4'h8: out_low = 10'h02b;
            4'h9: out_low = 10'h02c;
            4'ha: out_low = 10'h02c;
            4'hb: out_low = 10'h02c;
            4'hc: out_low = 10'h02d;
            4'hd: out_low = 10'h02d;
            4'he: out_low = 10'h02d;
            4'hf: out_low = 10'h02e;
            default: out_low = 10'h000;
          endcase
        end
        6'h09: begin
          case (mant[3:0])
            4'h0: out_low = 10'h02e;
            4'h1: out_low = 10'h02e;
            4'h2: out_low = 10'h02f;
            4'h3: out_low = 10'h02f;
            4'h4: out_low = 10'h02f;
            4'h5: out_low = 10'h02f;
            4'h6: out_low = 10'h030;
            4'h7: out_low = 10'h030;
            4'h8: out_low = 10'h030;
            4'h9: out_low = 10'h031;
            4'ha: out_low = 10'h031;
            4'hb: out_low = 10'h031;
            4'hc: out_low = 10'h032;
            4'hd: out_low = 10'h032;
            4'he: out_low = 10'h032;
            4'hf: out_low = 10'h032;
            default: out_low = 10'h000;
          endcase
        end
        6'h0a: begin
          case (mant[3:0])
            4'h0: out_low = 10'h033;
            4'h1: out_low = 10'h033;
            4'h2: out_low = 10'h033;
            4'h3: out_low = 10'h034;
            4'h4: out_low = 10'h034;
            4'h5: out_low = 10'h034;
            4'h6: out_low = 10'h035;
            4'h7: out_low = 10'h035;
            4'h8: out_low = 10'h035;
            4'h9: out_low = 10'h035;
            4'ha: out_low = 10'h036;
            4'hb: out_low = 10'h036;
            4'hc: out_low = 10'h036;
            4'hd: out_low = 10'h037;
            4'he: out_low = 10'h037;
            4'hf: out_low = 10'h037;
            default: out_low = 10'h000;
          endcase
        end
        6'h0b: begin
          case (mant[3:0])
            4'h0: out_low = 10'h038;
            4'h1: out_low = 10'h038;
            4'h2: out_low = 10'h038;
            4'h3: out_low = 10'h038;
            4'h4: out_low = 10'h039;
            4'h5: out_low = 10'h039;
            4'h6: out_low = 10'h039;
            4'h7: out_low = 10'h03a;
            4'h8: out_low = 10'h03a;
            4'h9: out_low = 10'h03a;
            4'ha: out_low = 10'h03b;
            4'hb: out_low = 10'h03b;
            4'hc: out_low = 10'h03b;
            4'hd: out_low = 10'h03b;
            4'he: out_low = 10'h03c;
            4'hf: out_low = 10'h03c;
            default: out_low = 10'h000;
          endcase
        end
        6'h0c: begin
          case (mant[3:0])
            4'h0: out_low = 10'h03c;
            4'h1: out_low = 10'h03d;
            4'h2: out_low = 10'h03d;
            4'h3: out_low = 10'h03d;
            4'h4: out_low = 10'h03e;
            4'h5: out_low = 10'h03e;
            4'h6: out_low = 10'h03e;
            4'h7: out_low = 10'h03e;
            4'h8: out_low = 10'h03f;
            4'h9: out_low = 10'h03f;
            4'ha: out_low = 10'h03f;
            4'hb: out_low = 10'h040;
            4'hc: out_low = 10'h040;
            4'hd: out_low = 10'h040;
            4'he: out_low = 10'h041;
            4'hf: out_low = 10'h041;
            default: out_low = 10'h000;
          endcase
        end
        6'h0d: begin
          case (mant[3:0])
            4'h0: out_low = 10'h041;
            4'h1: out_low = 10'h041;
            4'h2: out_low = 10'h042;
            4'h3: out_low = 10'h042;
            4'h4: out_low = 10'h042;
            4'h5: out_low = 10'h043;
            4'h6: out_low = 10'h043;
            4'h7: out_low = 10'h043;
            4'h8: out_low = 10'h043;
            4'h9: out_low = 10'h044;
            4'ha: out_low = 10'h044;
            4'hb: out_low = 10'h044;
            4'hc: out_low = 10'h045;
            4'hd: out_low = 10'h045;
            4'he: out_low = 10'h045;
            4'hf: out_low = 10'h046;
            default: out_low = 10'h000;
          endcase
        end
        6'h0e: begin
          case (mant[3:0])
            4'h0: out_low = 10'h046;
            4'h1: out_low = 10'h046;
            4'h2: out_low = 10'h046;
            4'h3: out_low = 10'h047;
            4'h4: out_low = 10'h047;
            4'h5: out_low = 10'h047;
            4'h6: out_low = 10'h048;
            4'h7: out_low = 10'h048;
            4'h8: out_low = 10'h048;
            4'h9: out_low = 10'h048;
            4'ha: out_low = 10'h049;
            4'hb: out_low = 10'h049;
            4'hc: out_low = 10'h049;
            4'hd: out_low = 10'h04a;
            4'he: out_low = 10'h04a;
            4'hf: out_low = 10'h04a;
            default: out_low = 10'h000;
          endcase
        end
        6'h0f: begin
          case (mant[3:0])
            4'h0: out_low = 10'h04a;
            4'h1: out_low = 10'h04b;
            4'h2: out_low = 10'h04b;
            4'h3: out_low = 10'h04b;
            4'h4: out_low = 10'h04c;
            4'h5: out_low = 10'h04c;
            4'h6: out_low = 10'h04c;
            4'h7: out_low = 10'h04c;
            4'h8: out_low = 10'h04d;
            4'h9: out_low = 10'h04d;
            4'ha: out_low = 10'h04d;
            4'hb: out_low = 10'h04e;
            4'hc: out_low = 10'h04e;
            4'hd: out_low = 10'h04e;
            4'he: out_low = 10'h04e;
            4'hf: out_low = 10'h04f;
            default: out_low = 10'h000;
          endcase
        end
        6'h10: begin
          case (mant[3:0])
            4'h0: out_low = 10'h04f;
            4'h1: out_low = 10'h04f;
            4'h2: out_low = 10'h050;
            4'h3: out_low = 10'h050;
            4'h4: out_low = 10'h050;
            4'h5: out_low = 10'h051;
            4'h6: out_low = 10'h051;
            4'h7: out_low = 10'h051;
            4'h8: out_low = 10'h051;
            4'h9: out_low = 10'h052;
            4'ha: out_low = 10'h052;
            4'hb: out_low = 10'h052;
            4'hc: out_low = 10'h053;
            4'hd: out_low = 10'h053;
            4'he: out_low = 10'h053;
            4'hf: out_low = 10'h053;
            default: out_low = 10'h000;
          endcase
        end
        6'h11: begin
          case (mant[3:0])
            4'h0: out_low = 10'h054;
            4'h1: out_low = 10'h054;
            4'h2: out_low = 10'h054;
            4'h3: out_low = 10'h055;
            4'h4: out_low = 10'h055;
            4'h5: out_low = 10'h055;
            4'h6: out_low = 10'h055;
            4'h7: out_low = 10'h056;
            4'h8: out_low = 10'h056;
            4'h9: out_low = 10'h056;
            4'ha: out_low = 10'h056;
            4'hb: out_low = 10'h057;
            4'hc: out_low = 10'h057;
            4'hd: out_low = 10'h057;
            4'he: out_low = 10'h058;
            4'hf: out_low = 10'h058;
            default: out_low = 10'h000;
          endcase
        end
        6'h12: begin
          case (mant[3:0])
            4'h0: out_low = 10'h058;
            4'h1: out_low = 10'h058;
            4'h2: out_low = 10'h059;
            4'h3: out_low = 10'h059;
            4'h4: out_low = 10'h059;
            4'h5: out_low = 10'h05a;
            4'h6: out_low = 10'h05a;
            4'h7: out_low = 10'h05a;
            4'h8: out_low = 10'h05a;
            4'h9: out_low = 10'h05b;
            4'ha: out_low = 10'h05b;
            4'hb: out_low = 10'h05b;
            4'hc: out_low = 10'h05c;
            4'hd: out_low = 10'h05c;
            4'he: out_low = 10'h05c;
            4'hf: out_low = 10'h05c;
            default: out_low = 10'h000;
          endcase
        end
        6'h13: begin
          case (mant[3:0])
            4'h0: out_low = 10'h05d;
            4'h1: out_low = 10'h05d;
            4'h2: out_low = 10'h05d;
            4'h3: out_low = 10'h05e;
            4'h4: out_low = 10'h05e;
            4'h5: out_low = 10'h05e;
            4'h6: out_low = 10'h05e;
            4'h7: out_low = 10'h05f;
            4'h8: out_low = 10'h05f;
            4'h9: out_low = 10'h05f;
            4'ha: out_low = 10'h05f;
            4'hb: out_low = 10'h060;
            4'hc: out_low = 10'h060;
            4'hd: out_low = 10'h060;
            4'he: out_low = 10'h061;
            4'hf: out_low = 10'h061;
            default: out_low = 10'h000;
          endcase
        end
        6'h14: begin
          case (mant[3:0])
            4'h0: out_low = 10'h061;
            4'h1: out_low = 10'h061;
            4'h2: out_low = 10'h062;
            4'h3: out_low = 10'h062;
            4'h4: out_low = 10'h062;
            4'h5: out_low = 10'h063;
            4'h6: out_low = 10'h063;
            4'h7: out_low = 10'h063;
            4'h8: out_low = 10'h063;
            4'h9: out_low = 10'h064;
            4'ha: out_low = 10'h064;
            4'hb: out_low = 10'h064;
            4'hc: out_low = 10'h064;
            4'hd: out_low = 10'h065;
            4'he: out_low = 10'h065;
            4'hf: out_low = 10'h065;
            default: out_low = 10'h000;
          endcase
        end
        6'h15: begin
          case (mant[3:0])
            4'h0: out_low = 10'h066;
            4'h1: out_low = 10'h066;
            4'h2: out_low = 10'h066;
            4'h3: out_low = 10'h066;
            4'h4: out_low = 10'h067;
            4'h5: out_low = 10'h067;
            4'h6: out_low = 10'h067;
            4'h7: out_low = 10'h068;
            4'h8: out_low = 10'h068;
            4'h9: out_low = 10'h068;
            4'ha: out_low = 10'h068;
            4'hb: out_low = 10'h069;
            4'hc: out_low = 10'h069;
            4'hd: out_low = 10'h069;
            4'he: out_low = 10'h069;
            4'hf: out_low = 10'h06a;
            default: out_low = 10'h000;
          endcase
        end
        6'h16: begin
          case (mant[3:0])
            4'h0: out_low = 10'h06a;
            4'h1: out_low = 10'h06a;
            4'h2: out_low = 10'h06b;
            4'h3: out_low = 10'h06b;
            4'h4: out_low = 10'h06b;
            4'h5: out_low = 10'h06b;
            4'h6: out_low = 10'h06c;
            4'h7: out_low = 10'h06c;
            4'h8: out_low = 10'h06c;
            4'h9: out_low = 10'h06c;
            4'ha: out_low = 10'h06d;
            4'hb: out_low = 10'h06d;
            4'hc: out_low = 10'h06d;
            4'hd: out_low = 10'h06e;
            4'he: out_low = 10'h06e;
            4'hf: out_low = 10'h06e;
            default: out_low = 10'h000;
          endcase
        end
        6'h17: begin
          case (mant[3:0])
            4'h0: out_low = 10'h06e;
            4'h1: out_low = 10'h06f;
            4'h2: out_low = 10'h06f;
            4'h3: out_low = 10'h06f;
            4'h4: out_low = 10'h06f;
            4'h5: out_low = 10'h070;
            4'h6: out_low = 10'h070;
            4'h7: out_low = 10'h070;
            4'h8: out_low = 10'h071;
            4'h9: out_low = 10'h071;
            4'ha: out_low = 10'h071;
            4'hb: out_low = 10'h071;
            4'hc: out_low = 10'h072;
            4'hd: out_low = 10'h072;
            4'he: out_low = 10'h072;
            4'hf: out_low = 10'h072;
            default: out_low = 10'h000;
          endcase
        end
        6'h18: begin
          case (mant[3:0])
            4'h0: out_low = 10'h073;
            4'h1: out_low = 10'h073;
            4'h2: out_low = 10'h073;
            4'h3: out_low = 10'h073;
            4'h4: out_low = 10'h074;
            4'h5: out_low = 10'h074;
            4'h6: out_low = 10'h074;
            4'h7: out_low = 10'h075;
            4'h8: out_low = 10'h075;
            4'h9: out_low = 10'h075;
            4'ha: out_low = 10'h075;
            4'hb: out_low = 10'h076;
            4'hc: out_low = 10'h076;
            4'hd: out_low = 10'h076;
            4'he: out_low = 10'h076;
            4'hf: out_low = 10'h077;
            default: out_low = 10'h000;
          endcase
        end
        6'h19: begin
          case (mant[3:0])
            4'h0: out_low = 10'h077;
            4'h1: out_low = 10'h077;
            4'h2: out_low = 10'h078;
            4'h3: out_low = 10'h078;
            4'h4: out_low = 10'h078;
            4'h5: out_low = 10'h078;
            4'h6: out_low = 10'h079;
            4'h7: out_low = 10'h079;
            4'h8: out_low = 10'h079;
            4'h9: out_low = 10'h079;
            4'ha: out_low = 10'h07a;
            4'hb: out_low = 10'h07a;
            4'hc: out_low = 10'h07a;
            4'hd: out_low = 10'h07a;
            4'he: out_low = 10'h07b;
            4'hf: out_low = 10'h07b;
            default: out_low = 10'h000;
          endcase
        end
        6'h1a: begin
          case (mant[3:0])
            4'h0: out_low = 10'h07b;
            4'h1: out_low = 10'h07c;
            4'h2: out_low = 10'h07c;
            4'h3: out_low = 10'h07c;
            4'h4: out_low = 10'h07c;
            4'h5: out_low = 10'h07d;
            4'h6: out_low = 10'h07d;
            4'h7: out_low = 10'h07d;
            4'h8: out_low = 10'h07d;
            4'h9: out_low = 10'h07e;
            4'ha: out_low = 10'h07e;
            4'hb: out_low = 10'h07e;
            4'hc: out_low = 10'h07e;
            4'hd: out_low = 10'h07f;
            4'he: out_low = 10'h07f;
            4'hf: out_low = 10'h07f;
            default: out_low = 10'h000;
          endcase
        end
        6'h1b: begin
          case (mant[3:0])
            4'h0: out_low = 10'h07f;
            4'h1: out_low = 10'h080;
            4'h2: out_low = 10'h080;
            4'h3: out_low = 10'h080;
            4'h4: out_low = 10'h081;
            4'h5: out_low = 10'h081;
            4'h6: out_low = 10'h081;
            4'h7: out_low = 10'h081;
            4'h8: out_low = 10'h082;
            4'h9: out_low = 10'h082;
            4'ha: out_low = 10'h082;
            4'hb: out_low = 10'h082;
            4'hc: out_low = 10'h083;
            4'hd: out_low = 10'h083;
            4'he: out_low = 10'h083;
            4'hf: out_low = 10'h083;
            default: out_low = 10'h000;
          endcase
        end
        6'h1c: begin
          case (mant[3:0])
            4'h0: out_low = 10'h084;
            4'h1: out_low = 10'h084;
            4'h2: out_low = 10'h084;
            4'h3: out_low = 10'h084;
            4'h4: out_low = 10'h085;
            4'h5: out_low = 10'h085;
            4'h6: out_low = 10'h085;
            4'h7: out_low = 10'h086;
            4'h8: out_low = 10'h086;
            4'h9: out_low = 10'h086;
            4'ha: out_low = 10'h086;
            4'hb: out_low = 10'h087;
            4'hc: out_low = 10'h087;
            4'hd: out_low = 10'h087;
            4'he: out_low = 10'h087;
            4'hf: out_low = 10'h088;
            default: out_low = 10'h000;
          endcase
        end
        6'h1d: begin
          case (mant[3:0])
            4'h0: out_low = 10'h088;
            4'h1: out_low = 10'h088;
            4'h2: out_low = 10'h088;
            4'h3: out_low = 10'h089;
            4'h4: out_low = 10'h089;
            4'h5: out_low = 10'h089;
            4'h6: out_low = 10'h089;
            4'h7: out_low = 10'h08a;
            4'h8: out_low = 10'h08a;
            4'h9: out_low = 10'h08a;
            4'ha: out_low = 10'h08a;
            4'hb: out_low = 10'h08b;
            4'hc: out_low = 10'h08b;
            4'hd: out_low = 10'h08b;
            4'he: out_low = 10'h08b;
            4'hf: out_low = 10'h08c;
            default: out_low = 10'h000;
          endcase
        end
        6'h1e: begin
          case (mant[3:0])
            4'h0: out_low = 10'h08c;
            4'h1: out_low = 10'h08c;
            4'h2: out_low = 10'h08d;
            4'h3: out_low = 10'h08d;
            4'h4: out_low = 10'h08d;
            4'h5: out_low = 10'h08d;
            4'h6: out_low = 10'h08e;
            4'h7: out_low = 10'h08e;
            4'h8: out_low = 10'h08e;
            4'h9: out_low = 10'h08e;
            4'ha: out_low = 10'h08f;
            4'hb: out_low = 10'h08f;
            4'hc: out_low = 10'h08f;
            4'hd: out_low = 10'h08f;
            4'he: out_low = 10'h090;
            4'hf: out_low = 10'h090;
            default: out_low = 10'h000;
          endcase
        end
        6'h1f: begin
          case (mant[3:0])
            4'h0: out_low = 10'h090;
            4'h1: out_low = 10'h090;
            4'h2: out_low = 10'h091;
            4'h3: out_low = 10'h091;
            4'h4: out_low = 10'h091;
            4'h5: out_low = 10'h091;
            4'h6: out_low = 10'h092;
            4'h7: out_low = 10'h092;
            4'h8: out_low = 10'h092;
            4'h9: out_low = 10'h092;
            4'ha: out_low = 10'h093;
            4'hb: out_low = 10'h093;
            4'hc: out_low = 10'h093;
            4'hd: out_low = 10'h093;
            4'he: out_low = 10'h094;
            4'hf: out_low = 10'h094;
            default: out_low = 10'h000;
          endcase
        end
        6'h20: begin
          case (mant[3:0])
            4'h0: out_low = 10'h094;
            4'h1: out_low = 10'h094;
            4'h2: out_low = 10'h095;
            4'h3: out_low = 10'h095;
            4'h4: out_low = 10'h095;
            4'h5: out_low = 10'h095;
            4'h6: out_low = 10'h096;
            4'h7: out_low = 10'h096;
            4'h8: out_low = 10'h096;
            4'h9: out_low = 10'h096;
            4'ha: out_low = 10'h097;
            4'hb: out_low = 10'h097;
            4'hc: out_low = 10'h097;
            4'hd: out_low = 10'h097;
            4'he: out_low = 10'h098;
            4'hf: out_low = 10'h098;
            default: out_low = 10'h000;
          endcase
        end
        6'h21: begin
          case (mant[3:0])
            4'h0: out_low = 10'h098;
            4'h1: out_low = 10'h098;
            4'h2: out_low = 10'h099;
            4'h3: out_low = 10'h099;
            4'h4: out_low = 10'h099;
            4'h5: out_low = 10'h09a;
            4'h6: out_low = 10'h09a;
            4'h7: out_low = 10'h09a;
            4'h8: out_low = 10'h09a;
            4'h9: out_low = 10'h09b;
            4'ha: out_low = 10'h09b;
            4'hb: out_low = 10'h09b;
            4'hc: out_low = 10'h09b;
            4'hd: out_low = 10'h09c;
            4'he: out_low = 10'h09c;
            4'hf: out_low = 10'h09c;
            default: out_low = 10'h000;
          endcase
        end
        6'h22: begin
          case (mant[3:0])
            4'h0: out_low = 10'h09c;
            4'h1: out_low = 10'h09d;
            4'h2: out_low = 10'h09d;
            4'h3: out_low = 10'h09d;
            4'h4: out_low = 10'h09d;
            4'h5: out_low = 10'h09e;
            4'h6: out_low = 10'h09e;
            4'h7: out_low = 10'h09e;
            4'h8: out_low = 10'h09e;
            4'h9: out_low = 10'h09f;
            4'ha: out_low = 10'h09f;
            4'hb: out_low = 10'h09f;
            4'hc: out_low = 10'h09f;
            4'hd: out_low = 10'h0a0;
            4'he: out_low = 10'h0a0;
            4'hf: out_low = 10'h0a0;
            default: out_low = 10'h000;
          endcase
        end
        6'h23: begin
          case (mant[3:0])
            4'h0: out_low = 10'h0a0;
            4'h1: out_low = 10'h0a1;
            4'h2: out_low = 10'h0a1;
            4'h3: out_low = 10'h0a1;
            4'h4: out_low = 10'h0a1;
            4'h5: out_low = 10'h0a2;
            4'h6: out_low = 10'h0a2;
            4'h7: out_low = 10'h0a2;
            4'h8: out_low = 10'h0a2;
            4'h9: out_low = 10'h0a3;
            4'ha: out_low = 10'h0a3;
            4'hb: out_low = 10'h0a3;
            4'hc: out_low = 10'h0a3;
            4'hd: out_low = 10'h0a4;
            4'he: out_low = 10'h0a4;
            4'hf: out_low = 10'h0a4;
            default: out_low = 10'h000;
          endcase
        end
        6'h24: begin
          case (mant[3:0])
            4'h0: out_low = 10'h0a4;
            4'h1: out_low = 10'h0a4;
            4'h2: out_low = 10'h0a5;
            4'h3: out_low = 10'h0a5;
            4'h4: out_low = 10'h0a5;
            4'h5: out_low = 10'h0a5;
            4'h6: out_low = 10'h0a6;
            4'h7: out_low = 10'h0a6;
            4'h8: out_low = 10'h0a6;
            4'h9: out_low = 10'h0a6;
            4'ha: out_low = 10'h0a7;
            4'hb: out_low = 10'h0a7;
            4'hc: out_low = 10'h0a7;
            4'hd: out_low = 10'h0a7;
            4'he: out_low = 10'h0a8;
            4'hf: out_low = 10'h0a8;
            default: out_low = 10'h000;
          endcase
        end
        6'h25: begin
          case (mant[3:0])
            4'h0: out_low = 10'h0a8;
            4'h1: out_low = 10'h0a8;
            4'h2: out_low = 10'h0a9;
            4'h3: out_low = 10'h0a9;
            4'h4: out_low = 10'h0a9;
            4'h5: out_low = 10'h0a9;
            4'h6: out_low = 10'h0aa;
            4'h7: out_low = 10'h0aa;
            4'h8: out_low = 10'h0aa;
            4'h9: out_low = 10'h0aa;
            4'ha: out_low = 10'h0ab;
            4'hb: out_low = 10'h0ab;
            4'hc: out_low = 10'h0ab;
            4'hd: out_low = 10'h0ab;
            4'he: out_low = 10'h0ac;
            4'hf: out_low = 10'h0ac;
            default: out_low = 10'h000;
          endcase
        end
        6'h26: begin
          case (mant[3:0])
            4'h0: out_low = 10'h0ac;
            4'h1: out_low = 10'h0ac;
            4'h2: out_low = 10'h0ad;
            4'h3: out_low = 10'h0ad;
            4'h4: out_low = 10'h0ad;
            4'h5: out_low = 10'h0ad;
            4'h6: out_low = 10'h0ae;
            4'h7: out_low = 10'h0ae;
            4'h8: out_low = 10'h0ae;
            4'h9: out_low = 10'h0ae;
            4'ha: out_low = 10'h0af;
            4'hb: out_low = 10'h0af;
            4'hc: out_low = 10'h0af;
            4'hd: out_low = 10'h0af;
            4'he: out_low = 10'h0b0;
            4'hf: out_low = 10'h0b0;
            default: out_low = 10'h000;
          endcase
        end
        6'h27: begin
          case (mant[3:0])
            4'h0: out_low = 10'h0b0;
            4'h1: out_low = 10'h0b0;
            4'h2: out_low = 10'h0b0;
            4'h3: out_low = 10'h0b1;
            4'h4: out_low = 10'h0b1;
            4'h5: out_low = 10'h0b1;
            4'h6: out_low = 10'h0b1;
            4'h7: out_low = 10'h0b2;
            4'h8: out_low = 10'h0b2;
            4'h9: out_low = 10'h0b2;
            4'ha: out_low = 10'h0b2;
            4'hb: out_low = 10'h0b3;
            4'hc: out_low = 10'h0b3;
            4'hd: out_low = 10'h0b3;
            4'he: out_low = 10'h0b3;
            4'hf: out_low = 10'h0b4;
            default: out_low = 10'h000;
          endcase
        end
        6'h28: begin
          case (mant[3:0])
            4'h0: out_low = 10'h0b4;
            4'h1: out_low = 10'h0b4;
            4'h2: out_low = 10'h0b4;
            4'h3: out_low = 10'h0b5;
            4'h4: out_low = 10'h0b5;
            4'h5: out_low = 10'h0b5;
            4'h6: out_low = 10'h0b5;
            4'h7: out_low = 10'h0b6;
            4'h8: out_low = 10'h0b6;
            4'h9: out_low = 10'h0b6;
            4'ha: out_low = 10'h0b6;
            4'hb: out_low = 10'h0b7;
            4'hc: out_low = 10'h0b7;
            4'hd: out_low = 10'h0b7;
            4'he: out_low = 10'h0b7;
            4'hf: out_low = 10'h0b7;
            default: out_low = 10'h000;
          endcase
        end
        6'h29: begin
          case (mant[3:0])
            4'h0: out_low = 10'h0b8;
            4'h1: out_low = 10'h0b8;
            4'h2: out_low = 10'h0b8;
            4'h3: out_low = 10'h0b8;
            4'h4: out_low = 10'h0b9;
            4'h5: out_low = 10'h0b9;
            4'h6: out_low = 10'h0b9;
            4'h7: out_low = 10'h0b9;
            4'h8: out_low = 10'h0ba;
            4'h9: out_low = 10'h0ba;
            4'ha: out_low = 10'h0ba;
            4'hb: out_low = 10'h0ba;
            4'hc: out_low = 10'h0bb;
            4'hd: out_low = 10'h0bb;
            4'he: out_low = 10'h0bb;
            4'hf: out_low = 10'h0bb;
            default: out_low = 10'h000;
          endcase
        end
        6'h2a: begin
          case (mant[3:0])
            4'h0: out_low = 10'h0bc;
            4'h1: out_low = 10'h0bc;
            4'h2: out_low = 10'h0bc;
            4'h3: out_low = 10'h0bc;
            4'h4: out_low = 10'h0bd;
            4'h5: out_low = 10'h0bd;
            4'h6: out_low = 10'h0bd;
            4'h7: out_low = 10'h0bd;
            4'h8: out_low = 10'h0bd;
            4'h9: out_low = 10'h0be;
            4'ha: out_low = 10'h0be;
            4'hb: out_low = 10'h0be;
            4'hc: out_low = 10'h0be;
            4'hd: out_low = 10'h0bf;
            4'he: out_low = 10'h0bf;
            4'hf: out_low = 10'h0bf;
            default: out_low = 10'h000;
          endcase
        end
        6'h2b: begin
          case (mant[3:0])
            4'h0: out_low = 10'h0bf;
            4'h1: out_low = 10'h0c0;
            4'h2: out_low = 10'h0c0;
            4'h3: out_low = 10'h0c0;
            4'h4: out_low = 10'h0c0;
            4'h5: out_low = 10'h0c1;
            4'h6: out_low = 10'h0c1;
            4'h7: out_low = 10'h0c1;
            4'h8: out_low = 10'h0c1;
            4'h9: out_low = 10'h0c1;
            4'ha: out_low = 10'h0c2;
            4'hb: out_low = 10'h0c2;
            4'hc: out_low = 10'h0c2;
            4'hd: out_low = 10'h0c2;
            4'he: out_low = 10'h0c3;
            4'hf: out_low = 10'h0c3;
            default: out_low = 10'h000;
          endcase
        end
        6'h2c: begin
          case (mant[3:0])
            4'h0: out_low = 10'h0c3;
            4'h1: out_low = 10'h0c3;
            4'h2: out_low = 10'h0c4;
            4'h3: out_low = 10'h0c4;
            4'h4: out_low = 10'h0c4;
            4'h5: out_low = 10'h0c4;
            4'h6: out_low = 10'h0c5;
            4'h7: out_low = 10'h0c5;
            4'h8: out_low = 10'h0c5;
            4'h9: out_low = 10'h0c5;
            4'ha: out_low = 10'h0c5;
            4'hb: out_low = 10'h0c6;
            4'hc: out_low = 10'h0c6;
            4'hd: out_low = 10'h0c6;
            4'he: out_low = 10'h0c6;
            4'hf: out_low = 10'h0c7;
            default: out_low = 10'h000;
          endcase
        end
        6'h2d: begin
          case (mant[3:0])
            4'h0: out_low = 10'h0c7;
            4'h1: out_low = 10'h0c7;
            4'h2: out_low = 10'h0c7;
            4'h3: out_low = 10'h0c8;
            4'h4: out_low = 10'h0c8;
            4'h5: out_low = 10'h0c8;
            4'h6: out_low = 10'h0c8;
            4'h7: out_low = 10'h0c9;
            4'h8: out_low = 10'h0c9;
            4'h9: out_low = 10'h0c9;
            4'ha: out_low = 10'h0c9;
            4'hb: out_low = 10'h0c9;
            4'hc: out_low = 10'h0ca;
            4'hd: out_low = 10'h0ca;
            4'he: out_low = 10'h0ca;
            4'hf: out_low = 10'h0ca;
            default: out_low = 10'h000;
          endcase
        end
        6'h2e: begin
          case (mant[3:0])
            4'h0: out_low = 10'h0cb;
            4'h1: out_low = 10'h0cb;
            4'h2: out_low = 10'h0cb;
            4'h3: out_low = 10'h0cb;
            4'h4: out_low = 10'h0cc;
            4'h5: out_low = 10'h0cc;
            4'h6: out_low = 10'h0cc;
            4'h7: out_low = 10'h0cc;
            4'h8: out_low = 10'h0cc;
            4'h9: out_low = 10'h0cd;
            4'ha: out_low = 10'h0cd;
            4'hb: out_low = 10'h0cd;
            4'hc: out_low = 10'h0cd;
            4'hd: out_low = 10'h0ce;
            4'he: out_low = 10'h0ce;
            4'hf: out_low = 10'h0ce;
            default: out_low = 10'h000;
          endcase
        end
        6'h2f: begin
          case (mant[3:0])
            4'h0: out_low = 10'h0ce;
            4'h1: out_low = 10'h0cf;
            4'h2: out_low = 10'h0cf;
            4'h3: out_low = 10'h0cf;
            4'h4: out_low = 10'h0cf;
            4'h5: out_low = 10'h0cf;
            4'h6: out_low = 10'h0d0;
            4'h7: out_low = 10'h0d0;
            4'h8: out_low = 10'h0d0;
            4'h9: out_low = 10'h0d0;
            4'ha: out_low = 10'h0d1;
            4'hb: out_low = 10'h0d1;
            4'hc: out_low = 10'h0d1;
            4'hd: out_low = 10'h0d1;
            4'he: out_low = 10'h0d2;
            4'hf: out_low = 10'h0d2;
            default: out_low = 10'h000;
          endcase
        end
        6'h30: begin
          case (mant[3:0])
            4'h0: out_low = 10'h0d2;
            4'h1: out_low = 10'h0d2;
            4'h2: out_low = 10'h0d2;
            4'h3: out_low = 10'h0d3;
            4'h4: out_low = 10'h0d3;
            4'h5: out_low = 10'h0d3;
            4'h6: out_low = 10'h0d3;
            4'h7: out_low = 10'h0d4;
            4'h8: out_low = 10'h0d4;
            4'h9: out_low = 10'h0d4;
            4'ha: out_low = 10'h0d4;
            4'hb: out_low = 10'h0d5;
            4'hc: out_low = 10'h0d5;
            4'hd: out_low = 10'h0d5;
            4'he: out_low = 10'h0d5;
            4'hf: out_low = 10'h0d5;
            default: out_low = 10'h000;
          endcase
        end
        6'h31: begin
          case (mant[3:0])
            4'h0: out_low = 10'h0d6;
            4'h1: out_low = 10'h0d6;
            4'h2: out_low = 10'h0d6;
            4'h3: out_low = 10'h0d6;
            4'h4: out_low = 10'h0d7;
            4'h5: out_low = 10'h0d7;
            4'h6: out_low = 10'h0d7;
            4'h7: out_low = 10'h0d7;
            4'h8: out_low = 10'h0d7;
            4'h9: out_low = 10'h0d8;
            4'ha: out_low = 10'h0d8;
            4'hb: out_low = 10'h0d8;
            4'hc: out_low = 10'h0d8;
            4'hd: out_low = 10'h0d9;
            4'he: out_low = 10'h0d9;
            4'hf: out_low = 10'h0d9;
            default: out_low = 10'h000;
          endcase
        end
        6'h32: begin
          case (mant[3:0])
            4'h0: out_low = 10'h0d9;
            4'h1: out_low = 10'h0da;
            4'h2: out_low = 10'h0da;
            4'h3: out_low = 10'h0da;
            4'h4: out_low = 10'h0da;
            4'h5: out_low = 10'h0da;
            4'h6: out_low = 10'h0db;
            4'h7: out_low = 10'h0db;
            4'h8: out_low = 10'h0db;
            4'h9: out_low = 10'h0db;
            4'ha: out_low = 10'h0dc;
            4'hb: out_low = 10'h0dc;
            4'hc: out_low = 10'h0dc;
            4'hd: out_low = 10'h0dc;
            4'he: out_low = 10'h0dc;
            4'hf: out_low = 10'h0dd;
            default: out_low = 10'h000;
          endcase
        end
        6'h33: begin
          case (mant[3:0])
            4'h0: out_low = 10'h0dd;
            4'h1: out_low = 10'h0dd;
            4'h2: out_low = 10'h0dd;
            4'h3: out_low = 10'h0de;
            4'h4: out_low = 10'h0de;
            4'h5: out_low = 10'h0de;
            4'h6: out_low = 10'h0de;
            4'h7: out_low = 10'h0de;
            4'h8: out_low = 10'h0df;
            4'h9: out_low = 10'h0df;
            4'ha: out_low = 10'h0df;
            4'hb: out_low = 10'h0df;
            4'hc: out_low = 10'h0e0;
            4'hd: out_low = 10'h0e0;
            4'he: out_low = 10'h0e0;
            4'hf: out_low = 10'h0e0;
            default: out_low = 10'h000;
          endcase
        end
        6'h34: begin
          case (mant[3:0])
            4'h0: out_low = 10'h0e1;
            4'h1: out_low = 10'h0e1;
            4'h2: out_low = 10'h0e1;
            4'h3: out_low = 10'h0e1;
            4'h4: out_low = 10'h0e1;
            4'h5: out_low = 10'h0e2;
            4'h6: out_low = 10'h0e2;
            4'h7: out_low = 10'h0e2;
            4'h8: out_low = 10'h0e2;
            4'h9: out_low = 10'h0e3;
            4'ha: out_low = 10'h0e3;
            4'hb: out_low = 10'h0e3;
            4'hc: out_low = 10'h0e3;
            4'hd: out_low = 10'h0e3;
            4'he: out_low = 10'h0e4;
            4'hf: out_low = 10'h0e4;
            default: out_low = 10'h000;
          endcase
        end
        6'h35: begin
          case (mant[3:0])
            4'h0: out_low = 10'h0e4;
            4'h1: out_low = 10'h0e4;
            4'h2: out_low = 10'h0e5;
            4'h3: out_low = 10'h0e5;
            4'h4: out_low = 10'h0e5;
            4'h5: out_low = 10'h0e5;
            4'h6: out_low = 10'h0e5;
            4'h7: out_low = 10'h0e6;
            4'h8: out_low = 10'h0e6;
            4'h9: out_low = 10'h0e6;
            4'ha: out_low = 10'h0e6;
            4'hb: out_low = 10'h0e7;
            4'hc: out_low = 10'h0e7;
            4'hd: out_low = 10'h0e7;
            4'he: out_low = 10'h0e7;
            4'hf: out_low = 10'h0e7;
            default: out_low = 10'h000;
          endcase
        end
        6'h36: begin
          case (mant[3:0])
            4'h0: out_low = 10'h0e8;
            4'h1: out_low = 10'h0e8;
            4'h2: out_low = 10'h0e8;
            4'h3: out_low = 10'h0e8;
            4'h4: out_low = 10'h0e9;
            4'h5: out_low = 10'h0e9;
            4'h6: out_low = 10'h0e9;
            4'h7: out_low = 10'h0e9;
            4'h8: out_low = 10'h0e9;
            4'h9: out_low = 10'h0ea;
            4'ha: out_low = 10'h0ea;
            4'hb: out_low = 10'h0ea;
            4'hc: out_low = 10'h0ea;
            4'hd: out_low = 10'h0eb;
            4'he: out_low = 10'h0eb;
            4'hf: out_low = 10'h0eb;
            default: out_low = 10'h000;
          endcase
        end
        6'h37: begin
          case (mant[3:0])
            4'h0: out_low = 10'h0eb;
            4'h1: out_low = 10'h0eb;
            4'h2: out_low = 10'h0ec;
            4'h3: out_low = 10'h0ec;
            4'h4: out_low = 10'h0ec;
            4'h5: out_low = 10'h0ec;
            4'h6: out_low = 10'h0ed;
            4'h7: out_low = 10'h0ed;
            4'h8: out_low = 10'h0ed;
            4'h9: out_low = 10'h0ed;
            4'ha: out_low = 10'h0ed;
            4'hb: out_low = 10'h0ee;
            4'hc: out_low = 10'h0ee;
            4'hd: out_low = 10'h0ee;
            4'he: out_low = 10'h0ee;
            4'hf: out_low = 10'h0ee;
            default: out_low = 10'h000;
          endcase
        end
        6'h38: begin
          case (mant[3:0])
            4'h0: out_low = 10'h0ef;
            4'h1: out_low = 10'h0ef;
            4'h2: out_low = 10'h0ef;
            4'h3: out_low = 10'h0ef;
            4'h4: out_low = 10'h0f0;
            4'h5: out_low = 10'h0f0;
            4'h6: out_low = 10'h0f0;
            4'h7: out_low = 10'h0f0;
            4'h8: out_low = 10'h0f0;
            4'h9: out_low = 10'h0f1;
            4'ha: out_low = 10'h0f1;
            4'hb: out_low = 10'h0f1;
            4'hc: out_low = 10'h0f1;
            4'hd: out_low = 10'h0f2;
            4'he: out_low = 10'h0f2;
            4'hf: out_low = 10'h0f2;
            default: out_low = 10'h000;
          endcase
        end
        6'h39: begin
          case (mant[3:0])
            4'h0: out_low = 10'h0f2;
            4'h1: out_low = 10'h0f2;
            4'h2: out_low = 10'h0f3;
            4'h3: out_low = 10'h0f3;
            4'h4: out_low = 10'h0f3;
            4'h5: out_low = 10'h0f3;
            4'h6: out_low = 10'h0f4;
            4'h7: out_low = 10'h0f4;
            4'h8: out_low = 10'h0f4;
            4'h9: out_low = 10'h0f4;
            4'ha: out_low = 10'h0f4;
            4'hb: out_low = 10'h0f5;
            4'hc: out_low = 10'h0f5;
            4'hd: out_low = 10'h0f5;
            4'he: out_low = 10'h0f5;
            4'hf: out_low = 10'h0f5;
            default: out_low = 10'h000;
          endcase
        end
        6'h3a: begin
          case (mant[3:0])
            4'h0: out_low = 10'h0f6;
            4'h1: out_low = 10'h0f6;
            4'h2: out_low = 10'h0f6;
            4'h3: out_low = 10'h0f6;
            4'h4: out_low = 10'h0f7;
            4'h5: out_low = 10'h0f7;
            4'h6: out_low = 10'h0f7;
            4'h7: out_low = 10'h0f7;
            4'h8: out_low = 10'h0f7;
            4'h9: out_low = 10'h0f8;
            4'ha: out_low = 10'h0f8;
            4'hb: out_low = 10'h0f8;
            4'hc: out_low = 10'h0f8;
            4'hd: out_low = 10'h0f8;
            4'he: out_low = 10'h0f9;
            4'hf: out_low = 10'h0f9;
            default: out_low = 10'h000;
          endcase
        end
        6'h3b: begin
          case (mant[3:0])
            4'h0: out_low = 10'h0f9;
            4'h1: out_low = 10'h0f9;
            4'h2: out_low = 10'h0fa;
            4'h3: out_low = 10'h0fa;
            4'h4: out_low = 10'h0fa;
            4'h5: out_low = 10'h0fa;
            4'h6: out_low = 10'h0fa;
            4'h7: out_low = 10'h0fb;
            4'h8: out_low = 10'h0fb;
            4'h9: out_low = 10'h0fb;
            4'ha: out_low = 10'h0fb;
            4'hb: out_low = 10'h0fc;
            4'hc: out_low = 10'h0fc;
            4'hd: out_low = 10'h0fc;
            4'he: out_low = 10'h0fc;
            4'hf: out_low = 10'h0fc;
            default: out_low = 10'h000;
          endcase
        end
        6'h3c: begin
          case (mant[3:0])
            4'h0: out_low = 10'h0fd;
            4'h1: out_low = 10'h0fd;
            4'h2: out_low = 10'h0fd;
            4'h3: out_low = 10'h0fd;
            4'h4: out_low = 10'h0fd;
            4'h5: out_low = 10'h0fe;
            4'h6: out_low = 10'h0fe;
            4'h7: out_low = 10'h0fe;
            4'h8: out_low = 10'h0fe;
            4'h9: out_low = 10'h0ff;
            4'ha: out_low = 10'h0ff;
            4'hb: out_low = 10'h0ff;
            4'hc: out_low = 10'h0ff;
            4'hd: out_low = 10'h0ff;
            4'he: out_low = 10'h100;
            4'hf: out_low = 10'h100;
            default: out_low = 10'h000;
          endcase
        end
        6'h3d: begin
          case (mant[3:0])
            4'h0: out_low = 10'h100;
            4'h1: out_low = 10'h100;
            4'h2: out_low = 10'h100;
            4'h3: out_low = 10'h101;
            4'h4: out_low = 10'h101;
            4'h5: out_low = 10'h101;
            4'h6: out_low = 10'h101;
            4'h7: out_low = 10'h101;
            4'h8: out_low = 10'h102;
            4'h9: out_low = 10'h102;
            4'ha: out_low = 10'h102;
            4'hb: out_low = 10'h102;
            4'hc: out_low = 10'h103;
            4'hd: out_low = 10'h103;
            4'he: out_low = 10'h103;
            4'hf: out_low = 10'h103;
            default: out_low = 10'h000;
          endcase
        end
        6'h3e: begin
          case (mant[3:0])
            4'h0: out_low = 10'h103;
            4'h1: out_low = 10'h104;
            4'h2: out_low = 10'h104;
            4'h3: out_low = 10'h104;
            4'h4: out_low = 10'h104;
            4'h5: out_low = 10'h104;
            4'h6: out_low = 10'h105;
            4'h7: out_low = 10'h105;
            4'h8: out_low = 10'h105;
            4'h9: out_low = 10'h105;
            4'ha: out_low = 10'h106;
            4'hb: out_low = 10'h106;
            4'hc: out_low = 10'h106;
            4'hd: out_low = 10'h106;
            4'he: out_low = 10'h106;
            4'hf: out_low = 10'h107;
            default: out_low = 10'h000;
          endcase
        end
        6'h3f: begin
          case (mant[3:0])
            4'h0: out_low = 10'h107;
            4'h1: out_low = 10'h107;
            4'h2: out_low = 10'h107;
            4'h3: out_low = 10'h107;
            4'h4: out_low = 10'h108;
            4'h5: out_low = 10'h108;
            4'h6: out_low = 10'h108;
            4'h7: out_low = 10'h108;
            4'h8: out_low = 10'h108;
            4'h9: out_low = 10'h109;
            4'ha: out_low = 10'h109;
            4'hb: out_low = 10'h109;
            4'hc: out_low = 10'h109;
            4'hd: out_low = 10'h10a;
            4'he: out_low = 10'h10a;
            4'hf: out_low = 10'h10a;
            default: out_low = 10'h000;
          endcase
        end
        default: out_low = 10'h000;
      endcase
      end
      2'h1: begin
      case (mant[9:4])
        6'h00: begin
          case (mant[3:0])
            4'h0: out_low = 10'h10a;
            4'h1: out_low = 10'h10b;
            4'h2: out_low = 10'h10b;
            4'h3: out_low = 10'h10b;
            4'h4: out_low = 10'h10c;
            4'h5: out_low = 10'h10c;
            4'h6: out_low = 10'h10d;
            4'h7: out_low = 10'h10d;
            4'h8: out_low = 10'h10e;
            4'h9: out_low = 10'h10e;
            4'ha: out_low = 10'h10e;
            4'hb: out_low = 10'h10f;
            4'hc: out_low = 10'h10f;
            4'hd: out_low = 10'h110;
            4'he: out_low = 10'h110;
            4'hf: out_low = 10'h110;
            default: out_low = 10'h000;
          endcase
        end
        6'h01: begin
          case (mant[3:0])
            4'h0: out_low = 10'h111;
            4'h1: out_low = 10'h111;
            4'h2: out_low = 10'h112;
            4'h3: out_low = 10'h112;
            4'h4: out_low = 10'h113;
            4'h5: out_low = 10'h113;
            4'h6: out_low = 10'h113;
            4'h7: out_low = 10'h114;
            4'h8: out_low = 10'h114;
            4'h9: out_low = 10'h115;
            4'ha: out_low = 10'h115;
            4'hb: out_low = 10'h115;
            4'hc: out_low = 10'h116;
            4'hd: out_low = 10'h116;
            4'he: out_low = 10'h117;
            4'hf: out_low = 10'h117;
            default: out_low = 10'h000;
          endcase
        end
        6'h02: begin
          case (mant[3:0])
            4'h0: out_low = 10'h117;
            4'h1: out_low = 10'h118;
            4'h2: out_low = 10'h118;
            4'h3: out_low = 10'h119;
            4'h4: out_low = 10'h119;
            4'h5: out_low = 10'h11a;
            4'h6: out_low = 10'h11a;
            4'h7: out_low = 10'h11a;
            4'h8: out_low = 10'h11b;
            4'h9: out_low = 10'h11b;
            4'ha: out_low = 10'h11c;
            4'hb: out_low = 10'h11c;
            4'hc: out_low = 10'h11c;
            4'hd: out_low = 10'h11d;
            4'he: out_low = 10'h11d;
            4'hf: out_low = 10'h11e;
            default: out_low = 10'h000;
          endcase
        end
        6'h03: begin
          case (mant[3:0])
            4'h0: out_low = 10'h11e;
            4'h1: out_low = 10'h11e;
            4'h2: out_low = 10'h11f;
            4'h3: out_low = 10'h11f;
            4'h4: out_low = 10'h120;
            4'h5: out_low = 10'h120;
            4'h6: out_low = 10'h120;
            4'h7: out_low = 10'h121;
            4'h8: out_low = 10'h121;
            4'h9: out_low = 10'h122;
            4'ha: out_low = 10'h122;
            4'hb: out_low = 10'h122;
            4'hc: out_low = 10'h123;
            4'hd: out_low = 10'h123;
            4'he: out_low = 10'h124;
            4'hf: out_low = 10'h124;
            default: out_low = 10'h000;
          endcase
        end
        6'h04: begin
          case (mant[3:0])
            4'h0: out_low = 10'h124;
            4'h1: out_low = 10'h125;
            4'h2: out_low = 10'h125;
            4'h3: out_low = 10'h126;
            4'h4: out_low = 10'h126;
            4'h5: out_low = 10'h127;
            4'h6: out_low = 10'h127;
            4'h7: out_low = 10'h127;
            4'h8: out_low = 10'h128;
            4'h9: out_low = 10'h128;
            4'ha: out_low = 10'h129;
            4'hb: out_low = 10'h129;
            4'hc: out_low = 10'h129;
            4'hd: out_low = 10'h12a;
            4'he: out_low = 10'h12a;
            4'hf: out_low = 10'h12b;
            default: out_low = 10'h000;
          endcase
        end
        6'h05: begin
          case (mant[3:0])
            4'h0: out_low = 10'h12b;
            4'h1: out_low = 10'h12b;
            4'h2: out_low = 10'h12c;
            4'h3: out_low = 10'h12c;
            4'h4: out_low = 10'h12d;
            4'h5: out_low = 10'h12d;
            4'h6: out_low = 10'h12d;
            4'h7: out_low = 10'h12e;
            4'h8: out_low = 10'h12e;
            4'h9: out_low = 10'h12f;
            4'ha: out_low = 10'h12f;
            4'hb: out_low = 10'h12f;
            4'hc: out_low = 10'h130;
            4'hd: out_low = 10'h130;
            4'he: out_low = 10'h130;
            4'hf: out_low = 10'h131;
            default: out_low = 10'h000;
          endcase
        end
        6'h06: begin
          case (mant[3:0])
            4'h0: out_low = 10'h131;
            4'h1: out_low = 10'h132;
            4'h2: out_low = 10'h132;
            4'h3: out_low = 10'h132;
            4'h4: out_low = 10'h133;
            4'h5: out_low = 10'h133;
            4'h6: out_low = 10'h134;
            4'h7: out_low = 10'h134;
            4'h8: out_low = 10'h134;
            4'h9: out_low = 10'h135;
            4'ha: out_low = 10'h135;
            4'hb: out_low = 10'h136;
            4'hc: out_low = 10'h136;
            4'hd: out_low = 10'h136;
            4'he: out_low = 10'h137;
            4'hf: out_low = 10'h137;
            default: out_low = 10'h000;
          endcase
        end
        6'h07: begin
          case (mant[3:0])
            4'h0: out_low = 10'h138;
            4'h1: out_low = 10'h138;
            4'h2: out_low = 10'h138;
            4'h3: out_low = 10'h139;
            4'h4: out_low = 10'h139;
            4'h5: out_low = 10'h13a;
            4'h6: out_low = 10'h13a;
            4'h7: out_low = 10'h13a;
            4'h8: out_low = 10'h13b;
            4'h9: out_low = 10'h13b;
            4'ha: out_low = 10'h13b;
            4'hb: out_low = 10'h13c;
            4'hc: out_low = 10'h13c;
            4'hd: out_low = 10'h13d;
            4'he: out_low = 10'h13d;
            4'hf: out_low = 10'h13d;
            default: out_low = 10'h000;
          endcase
        end
        6'h08: begin
          case (mant[3:0])
            4'h0: out_low = 10'h13e;
            4'h1: out_low = 10'h13e;
            4'h2: out_low = 10'h13f;
            4'h3: out_low = 10'h13f;
            4'h4: out_low = 10'h13f;
            4'h5: out_low = 10'h140;
            4'h6: out_low = 10'h140;
            4'h7: out_low = 10'h141;
            4'h8: out_low = 10'h141;
            4'h9: out_low = 10'h141;
            4'ha: out_low = 10'h142;
            4'hb: out_low = 10'h142;
            4'hc: out_low = 10'h142;
            4'hd: out_low = 10'h143;
            4'he: out_low = 10'h143;
            4'hf: out_low = 10'h144;
            default: out_low = 10'h000;
          endcase
        end
        6'h09: begin
          case (mant[3:0])
            4'h0: out_low = 10'h144;
            4'h1: out_low = 10'h144;
            4'h2: out_low = 10'h145;
            4'h3: out_low = 10'h145;
            4'h4: out_low = 10'h146;
            4'h5: out_low = 10'h146;
            4'h6: out_low = 10'h146;
            4'h7: out_low = 10'h147;
            4'h8: out_low = 10'h147;
            4'h9: out_low = 10'h147;
            4'ha: out_low = 10'h148;
            4'hb: out_low = 10'h148;
            4'hc: out_low = 10'h149;
            4'hd: out_low = 10'h149;
            4'he: out_low = 10'h149;
            4'hf: out_low = 10'h14a;
            default: out_low = 10'h000;
          endcase
        end
        6'h0a: begin
          case (mant[3:0])
            4'h0: out_low = 10'h14a;
            4'h1: out_low = 10'h14b;
            4'h2: out_low = 10'h14b;
            4'h3: out_low = 10'h14b;
            4'h4: out_low = 10'h14c;
            4'h5: out_low = 10'h14c;
            4'h6: out_low = 10'h14c;
            4'h7: out_low = 10'h14d;
            4'h8: out_low = 10'h14d;
            4'h9: out_low = 10'h14e;
            4'ha: out_low = 10'h14e;
            4'hb: out_low = 10'h14e;
            4'hc: out_low = 10'h14f;
            4'hd: out_low = 10'h14f;
            4'he: out_low = 10'h14f;
            4'hf: out_low = 10'h150;
            default: out_low = 10'h000;
          endcase
        end
        6'h0b: begin
          case (mant[3:0])
            4'h0: out_low = 10'h150;
            4'h1: out_low = 10'h151;
            4'h2: out_low = 10'h151;
            4'h3: out_low = 10'h151;
            4'h4: out_low = 10'h152;
            4'h5: out_low = 10'h152;
            4'h6: out_low = 10'h152;
            4'h7: out_low = 10'h153;
            4'h8: out_low = 10'h153;
            4'h9: out_low = 10'h154;
            4'ha: out_low = 10'h154;
            4'hb: out_low = 10'h154;
            4'hc: out_low = 10'h155;
            4'hd: out_low = 10'h155;
            4'he: out_low = 10'h155;
            4'hf: out_low = 10'h156;
            default: out_low = 10'h000;
          endcase
        end
        6'h0c: begin
          case (mant[3:0])
            4'h0: out_low = 10'h156;
            4'h1: out_low = 10'h157;
            4'h2: out_low = 10'h157;
            4'h3: out_low = 10'h157;
            4'h4: out_low = 10'h158;
            4'h5: out_low = 10'h158;
            4'h6: out_low = 10'h158;
            4'h7: out_low = 10'h159;
            4'h8: out_low = 10'h159;
            4'h9: out_low = 10'h15a;
            4'ha: out_low = 10'h15a;
            4'hb: out_low = 10'h15a;
            4'hc: out_low = 10'h15b;
            4'hd: out_low = 10'h15b;
            4'he: out_low = 10'h15b;
            4'hf: out_low = 10'h15c;
            default: out_low = 10'h000;
          endcase
        end
        6'h0d: begin
          case (mant[3:0])
            4'h0: out_low = 10'h15c;
            4'h1: out_low = 10'h15d;
            4'h2: out_low = 10'h15d;
            4'h3: out_low = 10'h15d;
            4'h4: out_low = 10'h15e;
            4'h5: out_low = 10'h15e;
            4'h6: out_low = 10'h15e;
            4'h7: out_low = 10'h15f;
            4'h8: out_low = 10'h15f;
            4'h9: out_low = 10'h160;
            4'ha: out_low = 10'h160;
            4'hb: out_low = 10'h160;
            4'hc: out_low = 10'h161;
            4'hd: out_low = 10'h161;
            4'he: out_low = 10'h161;
            4'hf: out_low = 10'h162;
            default: out_low = 10'h000;
          endcase
        end
        6'h0e: begin
          case (mant[3:0])
            4'h0: out_low = 10'h162;
            4'h1: out_low = 10'h162;
            4'h2: out_low = 10'h163;
            4'h3: out_low = 10'h163;
            4'h4: out_low = 10'h164;
            4'h5: out_low = 10'h164;
            4'h6: out_low = 10'h164;
            4'h7: out_low = 10'h165;
            4'h8: out_low = 10'h165;
            4'h9: out_low = 10'h165;
            4'ha: out_low = 10'h166;
            4'hb: out_low = 10'h166;
            4'hc: out_low = 10'h167;
            4'hd: out_low = 10'h167;
            4'he: out_low = 10'h167;
            4'hf: out_low = 10'h168;
            default: out_low = 10'h000;
          endcase
        end
        6'h0f: begin
          case (mant[3:0])
            4'h0: out_low = 10'h168;
            4'h1: out_low = 10'h168;
            4'h2: out_low = 10'h169;
            4'h3: out_low = 10'h169;
            4'h4: out_low = 10'h169;
            4'h5: out_low = 10'h16a;
            4'h6: out_low = 10'h16a;
            4'h7: out_low = 10'h16b;
            4'h8: out_low = 10'h16b;
            4'h9: out_low = 10'h16b;
            4'ha: out_low = 10'h16c;
            4'hb: out_low = 10'h16c;
            4'hc: out_low = 10'h16c;
            4'hd: out_low = 10'h16d;
            4'he: out_low = 10'h16d;
            4'hf: out_low = 10'h16d;
            default: out_low = 10'h000;
          endcase
        end
        6'h10: begin
          case (mant[3:0])
            4'h0: out_low = 10'h16e;
            4'h1: out_low = 10'h16e;
            4'h2: out_low = 10'h16f;
            4'h3: out_low = 10'h16f;
            4'h4: out_low = 10'h16f;
            4'h5: out_low = 10'h170;
            4'h6: out_low = 10'h170;
            4'h7: out_low = 10'h170;
            4'h8: out_low = 10'h171;
            4'h9: out_low = 10'h171;
            4'ha: out_low = 10'h171;
            4'hb: out_low = 10'h172;
            4'hc: out_low = 10'h172;
            4'hd: out_low = 10'h172;
            4'he: out_low = 10'h173;
            4'hf: out_low = 10'h173;
            default: out_low = 10'h000;
          endcase
        end
        6'h11: begin
          case (mant[3:0])
            4'h0: out_low = 10'h174;
            4'h1: out_low = 10'h174;
            4'h2: out_low = 10'h174;
            4'h3: out_low = 10'h175;
            4'h4: out_low = 10'h175;
            4'h5: out_low = 10'h175;
            4'h6: out_low = 10'h176;
            4'h7: out_low = 10'h176;
            4'h8: out_low = 10'h176;
            4'h9: out_low = 10'h177;
            4'ha: out_low = 10'h177;
            4'hb: out_low = 10'h177;
            4'hc: out_low = 10'h178;
            4'hd: out_low = 10'h178;
            4'he: out_low = 10'h179;
            4'hf: out_low = 10'h179;
            default: out_low = 10'h000;
          endcase
        end
        6'h12: begin
          case (mant[3:0])
            4'h0: out_low = 10'h179;
            4'h1: out_low = 10'h17a;
            4'h2: out_low = 10'h17a;
            4'h3: out_low = 10'h17a;
            4'h4: out_low = 10'h17b;
            4'h5: out_low = 10'h17b;
            4'h6: out_low = 10'h17b;
            4'h7: out_low = 10'h17c;
            4'h8: out_low = 10'h17c;
            4'h9: out_low = 10'h17c;
            4'ha: out_low = 10'h17d;
            4'hb: out_low = 10'h17d;
            4'hc: out_low = 10'h17e;
            4'hd: out_low = 10'h17e;
            4'he: out_low = 10'h17e;
            4'hf: out_low = 10'h17f;
            default: out_low = 10'h000;
          endcase
        end
        6'h13: begin
          case (mant[3:0])
            4'h0: out_low = 10'h17f;
            4'h1: out_low = 10'h17f;
            4'h2: out_low = 10'h180;
            4'h3: out_low = 10'h180;
            4'h4: out_low = 10'h180;
            4'h5: out_low = 10'h181;
            4'h6: out_low = 10'h181;
            4'h7: out_low = 10'h181;
            4'h8: out_low = 10'h182;
            4'h9: out_low = 10'h182;
            4'ha: out_low = 10'h182;
            4'hb: out_low = 10'h183;
            4'hc: out_low = 10'h183;
            4'hd: out_low = 10'h184;
            4'he: out_low = 10'h184;
            4'hf: out_low = 10'h184;
            default: out_low = 10'h000;
          endcase
        end
        6'h14: begin
          case (mant[3:0])
            4'h0: out_low = 10'h185;
            4'h1: out_low = 10'h185;
            4'h2: out_low = 10'h185;
            4'h3: out_low = 10'h186;
            4'h4: out_low = 10'h186;
            4'h5: out_low = 10'h186;
            4'h6: out_low = 10'h187;
            4'h7: out_low = 10'h187;
            4'h8: out_low = 10'h187;
            4'h9: out_low = 10'h188;
            4'ha: out_low = 10'h188;
            4'hb: out_low = 10'h188;
            4'hc: out_low = 10'h189;
            4'hd: out_low = 10'h189;
            4'he: out_low = 10'h189;
            4'hf: out_low = 10'h18a;
            default: out_low = 10'h000;
          endcase
        end
        6'h15: begin
          case (mant[3:0])
            4'h0: out_low = 10'h18a;
            4'h1: out_low = 10'h18a;
            4'h2: out_low = 10'h18b;
            4'h3: out_low = 10'h18b;
            4'h4: out_low = 10'h18c;
            4'h5: out_low = 10'h18c;
            4'h6: out_low = 10'h18c;
            4'h7: out_low = 10'h18d;
            4'h8: out_low = 10'h18d;
            4'h9: out_low = 10'h18d;
            4'ha: out_low = 10'h18e;
            4'hb: out_low = 10'h18e;
            4'hc: out_low = 10'h18e;
            4'hd: out_low = 10'h18f;
            4'he: out_low = 10'h18f;
            4'hf: out_low = 10'h18f;
            default: out_low = 10'h000;
          endcase
        end
        6'h16: begin
          case (mant[3:0])
            4'h0: out_low = 10'h190;
            4'h1: out_low = 10'h190;
            4'h2: out_low = 10'h190;
            4'h3: out_low = 10'h191;
            4'h4: out_low = 10'h191;
            4'h5: out_low = 10'h191;
            4'h6: out_low = 10'h192;
            4'h7: out_low = 10'h192;
            4'h8: out_low = 10'h192;
            4'h9: out_low = 10'h193;
            4'ha: out_low = 10'h193;
            4'hb: out_low = 10'h193;
            4'hc: out_low = 10'h194;
            4'hd: out_low = 10'h194;
            4'he: out_low = 10'h195;
            4'hf: out_low = 10'h195;
            default: out_low = 10'h000;
          endcase
        end
        6'h17: begin
          case (mant[3:0])
            4'h0: out_low = 10'h195;
            4'h1: out_low = 10'h196;
            4'h2: out_low = 10'h196;
            4'h3: out_low = 10'h196;
            4'h4: out_low = 10'h197;
            4'h5: out_low = 10'h197;
            4'h6: out_low = 10'h197;
            4'h7: out_low = 10'h198;
            4'h8: out_low = 10'h198;
            4'h9: out_low = 10'h198;
            4'ha: out_low = 10'h199;
            4'hb: out_low = 10'h199;
            4'hc: out_low = 10'h199;
            4'hd: out_low = 10'h19a;
            4'he: out_low = 10'h19a;
            4'hf: out_low = 10'h19a;
            default: out_low = 10'h000;
          endcase
        end
        6'h18: begin
          case (mant[3:0])
            4'h0: out_low = 10'h19b;
            4'h1: out_low = 10'h19b;
            4'h2: out_low = 10'h19b;
            4'h3: out_low = 10'h19c;
            4'h4: out_low = 10'h19c;
            4'h5: out_low = 10'h19c;
            4'h6: out_low = 10'h19d;
            4'h7: out_low = 10'h19d;
            4'h8: out_low = 10'h19d;
            4'h9: out_low = 10'h19e;
            4'ha: out_low = 10'h19e;
            4'hb: out_low = 10'h19e;
            4'hc: out_low = 10'h19f;
            4'hd: out_low = 10'h19f;
            4'he: out_low = 10'h19f;
            4'hf: out_low = 10'h1a0;
            default: out_low = 10'h000;
          endcase
        end
        6'h19: begin
          case (mant[3:0])
            4'h0: out_low = 10'h1a0;
            4'h1: out_low = 10'h1a0;
            4'h2: out_low = 10'h1a1;
            4'h3: out_low = 10'h1a1;
            4'h4: out_low = 10'h1a1;
            4'h5: out_low = 10'h1a2;
            4'h6: out_low = 10'h1a2;
            4'h7: out_low = 10'h1a2;
            4'h8: out_low = 10'h1a3;
            4'h9: out_low = 10'h1a3;
            4'ha: out_low = 10'h1a3;
            4'hb: out_low = 10'h1a4;
            4'hc: out_low = 10'h1a4;
            4'hd: out_low = 10'h1a4;
            4'he: out_low = 10'h1a5;
            4'hf: out_low = 10'h1a5;
            default: out_low = 10'h000;
          endcase
        end
        6'h1a: begin
          case (mant[3:0])
            4'h0: out_low = 10'h1a5;
            4'h1: out_low = 10'h1a6;
            4'h2: out_low = 10'h1a6;
            4'h3: out_low = 10'h1a6;
            4'h4: out_low = 10'h1a7;
            4'h5: out_low = 10'h1a7;
            4'h6: out_low = 10'h1a7;
            4'h7: out_low = 10'h1a8;
            4'h8: out_low = 10'h1a8;
            4'h9: out_low = 10'h1a8;
            4'ha: out_low = 10'h1a9;
            4'hb: out_low = 10'h1a9;
            4'hc: out_low = 10'h1a9;
            4'hd: out_low = 10'h1aa;
            4'he: out_low = 10'h1aa;
            4'hf: out_low = 10'h1aa;
            default: out_low = 10'h000;
          endcase
        end
        6'h1b: begin
          case (mant[3:0])
            4'h0: out_low = 10'h1ab;
            4'h1: out_low = 10'h1ab;
            4'h2: out_low = 10'h1ab;
            4'h3: out_low = 10'h1ac;
            4'h4: out_low = 10'h1ac;
            4'h5: out_low = 10'h1ac;
            4'h6: out_low = 10'h1ad;
            4'h7: out_low = 10'h1ad;
            4'h8: out_low = 10'h1ad;
            4'h9: out_low = 10'h1ae;
            4'ha: out_low = 10'h1ae;
            4'hb: out_low = 10'h1ae;
            4'hc: out_low = 10'h1af;
            4'hd: out_low = 10'h1af;
            4'he: out_low = 10'h1af;
            4'hf: out_low = 10'h1b0;
            default: out_low = 10'h000;
          endcase
        end
        6'h1c: begin
          case (mant[3:0])
            4'h0: out_low = 10'h1b0;
            4'h1: out_low = 10'h1b0;
            4'h2: out_low = 10'h1b1;
            4'h3: out_low = 10'h1b1;
            4'h4: out_low = 10'h1b1;
            4'h5: out_low = 10'h1b2;
            4'h6: out_low = 10'h1b2;
            4'h7: out_low = 10'h1b2;
            4'h8: out_low = 10'h1b3;
            4'h9: out_low = 10'h1b3;
            4'ha: out_low = 10'h1b3;
            4'hb: out_low = 10'h1b4;
            4'hc: out_low = 10'h1b4;
            4'hd: out_low = 10'h1b4;
            4'he: out_low = 10'h1b5;
            4'hf: out_low = 10'h1b5;
            default: out_low = 10'h000;
          endcase
        end
        6'h1d: begin
          case (mant[3:0])
            4'h0: out_low = 10'h1b5;
            4'h1: out_low = 10'h1b6;
            4'h2: out_low = 10'h1b6;
            4'h3: out_low = 10'h1b6;
            4'h4: out_low = 10'h1b7;
            4'h5: out_low = 10'h1b7;
            4'h6: out_low = 10'h1b7;
            4'h7: out_low = 10'h1b8;
            4'h8: out_low = 10'h1b8;
            4'h9: out_low = 10'h1b8;
            4'ha: out_low = 10'h1b9;
            4'hb: out_low = 10'h1b9;
            4'hc: out_low = 10'h1b9;
            4'hd: out_low = 10'h1ba;
            4'he: out_low = 10'h1ba;
            4'hf: out_low = 10'h1ba;
            default: out_low = 10'h000;
          endcase
        end
        6'h1e: begin
          case (mant[3:0])
            4'h0: out_low = 10'h1bb;
            4'h1: out_low = 10'h1bb;
            4'h2: out_low = 10'h1bb;
            4'h3: out_low = 10'h1bc;
            4'h4: out_low = 10'h1bc;
            4'h5: out_low = 10'h1bc;
            4'h6: out_low = 10'h1bc;
            4'h7: out_low = 10'h1bd;
            4'h8: out_low = 10'h1bd;
            4'h9: out_low = 10'h1bd;
            4'ha: out_low = 10'h1be;
            4'hb: out_low = 10'h1be;
            4'hc: out_low = 10'h1be;
            4'hd: out_low = 10'h1bf;
            4'he: out_low = 10'h1bf;
            4'hf: out_low = 10'h1bf;
            default: out_low = 10'h000;
          endcase
        end
        6'h1f: begin
          case (mant[3:0])
            4'h0: out_low = 10'h1c0;
            4'h1: out_low = 10'h1c0;
            4'h2: out_low = 10'h1c0;
            4'h3: out_low = 10'h1c1;
            4'h4: out_low = 10'h1c1;
            4'h5: out_low = 10'h1c1;
            4'h6: out_low = 10'h1c2;
            4'h7: out_low = 10'h1c2;
            4'h8: out_low = 10'h1c2;
            4'h9: out_low = 10'h1c3;
            4'ha: out_low = 10'h1c3;
            4'hb: out_low = 10'h1c3;
            4'hc: out_low = 10'h1c4;
            4'hd: out_low = 10'h1c4;
            4'he: out_low = 10'h1c4;
            4'hf: out_low = 10'h1c5;
            default: out_low = 10'h000;
          endcase
        end
        6'h20: begin
          case (mant[3:0])
            4'h0: out_low = 10'h1c5;
            4'h1: out_low = 10'h1c5;
            4'h2: out_low = 10'h1c6;
            4'h3: out_low = 10'h1c6;
            4'h4: out_low = 10'h1c6;
            4'h5: out_low = 10'h1c6;
            4'h6: out_low = 10'h1c7;
            4'h7: out_low = 10'h1c7;
            4'h8: out_low = 10'h1c7;
            4'h9: out_low = 10'h1c8;
            4'ha: out_low = 10'h1c8;
            4'hb: out_low = 10'h1c8;
            4'hc: out_low = 10'h1c9;
            4'hd: out_low = 10'h1c9;
            4'he: out_low = 10'h1c9;
            4'hf: out_low = 10'h1ca;
            default: out_low = 10'h000;
          endcase
        end
        6'h21: begin
          case (mant[3:0])
            4'h0: out_low = 10'h1ca;
            4'h1: out_low = 10'h1ca;
            4'h2: out_low = 10'h1cb;
            4'h3: out_low = 10'h1cb;
            4'h4: out_low = 10'h1cb;
            4'h5: out_low = 10'h1cc;
            4'h6: out_low = 10'h1cc;
            4'h7: out_low = 10'h1cc;
            4'h8: out_low = 10'h1cd;
            4'h9: out_low = 10'h1cd;
            4'ha: out_low = 10'h1cd;
            4'hb: out_low = 10'h1cd;
            4'hc: out_low = 10'h1ce;
            4'hd: out_low = 10'h1ce;
            4'he: out_low = 10'h1ce;
            4'hf: out_low = 10'h1cf;
            default: out_low = 10'h000;
          endcase
        end
        6'h22: begin
          case (mant[3:0])
            4'h0: out_low = 10'h1cf;
            4'h1: out_low = 10'h1cf;
            4'h2: out_low = 10'h1d0;
            4'h3: out_low = 10'h1d0;
            4'h4: out_low = 10'h1d0;
            4'h5: out_low = 10'h1d1;
            4'h6: out_low = 10'h1d1;
            4'h7: out_low = 10'h1d1;
            4'h8: out_low = 10'h1d2;
            4'h9: out_low = 10'h1d2;
            4'ha: out_low = 10'h1d2;
            4'hb: out_low = 10'h1d3;
            4'hc: out_low = 10'h1d3;
            4'hd: out_low = 10'h1d3;
            4'he: out_low = 10'h1d3;
            4'hf: out_low = 10'h1d4;
            default: out_low = 10'h000;
          endcase
        end
        6'h23: begin
          case (mant[3:0])
            4'h0: out_low = 10'h1d4;
            4'h1: out_low = 10'h1d4;
            4'h2: out_low = 10'h1d5;
            4'h3: out_low = 10'h1d5;
            4'h4: out_low = 10'h1d5;
            4'h5: out_low = 10'h1d6;
            4'h6: out_low = 10'h1d6;
            4'h7: out_low = 10'h1d6;
            4'h8: out_low = 10'h1d7;
            4'h9: out_low = 10'h1d7;
            4'ha: out_low = 10'h1d7;
            4'hb: out_low = 10'h1d8;
            4'hc: out_low = 10'h1d8;
            4'hd: out_low = 10'h1d8;
            4'he: out_low = 10'h1d8;
            4'hf: out_low = 10'h1d9;
            default: out_low = 10'h000;
          endcase
        end
        6'h24: begin
          case (mant[3:0])
            4'h0: out_low = 10'h1d9;
            4'h1: out_low = 10'h1d9;
            4'h2: out_low = 10'h1da;
            4'h3: out_low = 10'h1da;
            4'h4: out_low = 10'h1da;
            4'h5: out_low = 10'h1db;
            4'h6: out_low = 10'h1db;
            4'h7: out_low = 10'h1db;
            4'h8: out_low = 10'h1dc;
            4'h9: out_low = 10'h1dc;
            4'ha: out_low = 10'h1dc;
            4'hb: out_low = 10'h1dd;
            4'hc: out_low = 10'h1dd;
            4'hd: out_low = 10'h1dd;
            4'he: out_low = 10'h1dd;
            4'hf: out_low = 10'h1de;
            default: out_low = 10'h000;
          endcase
        end
        6'h25: begin
          case (mant[3:0])
            4'h0: out_low = 10'h1de;
            4'h1: out_low = 10'h1de;
            4'h2: out_low = 10'h1df;
            4'h3: out_low = 10'h1df;
            4'h4: out_low = 10'h1df;
            4'h5: out_low = 10'h1e0;
            4'h6: out_low = 10'h1e0;
            4'h7: out_low = 10'h1e0;
            4'h8: out_low = 10'h1e1;
            4'h9: out_low = 10'h1e1;
            4'ha: out_low = 10'h1e1;
            4'hb: out_low = 10'h1e1;
            4'hc: out_low = 10'h1e2;
            4'hd: out_low = 10'h1e2;
            4'he: out_low = 10'h1e2;
            4'hf: out_low = 10'h1e3;
            default: out_low = 10'h000;
          endcase
        end
        6'h26: begin
          case (mant[3:0])
            4'h0: out_low = 10'h1e3;
            4'h1: out_low = 10'h1e3;
            4'h2: out_low = 10'h1e4;
            4'h3: out_low = 10'h1e4;
            4'h4: out_low = 10'h1e4;
            4'h5: out_low = 10'h1e5;
            4'h6: out_low = 10'h1e5;
            4'h7: out_low = 10'h1e5;
            4'h8: out_low = 10'h1e5;
            4'h9: out_low = 10'h1e6;
            4'ha: out_low = 10'h1e6;
            4'hb: out_low = 10'h1e6;
            4'hc: out_low = 10'h1e7;
            4'hd: out_low = 10'h1e7;
            4'he: out_low = 10'h1e7;
            4'hf: out_low = 10'h1e8;
            default: out_low = 10'h000;
          endcase
        end
        6'h27: begin
          case (mant[3:0])
            4'h0: out_low = 10'h1e8;
            4'h1: out_low = 10'h1e8;
            4'h2: out_low = 10'h1e9;
            4'h3: out_low = 10'h1e9;
            4'h4: out_low = 10'h1e9;
            4'h5: out_low = 10'h1e9;
            4'h6: out_low = 10'h1ea;
            4'h7: out_low = 10'h1ea;
            4'h8: out_low = 10'h1ea;
            4'h9: out_low = 10'h1eb;
            4'ha: out_low = 10'h1eb;
            4'hb: out_low = 10'h1eb;
            4'hc: out_low = 10'h1ec;
            4'hd: out_low = 10'h1ec;
            4'he: out_low = 10'h1ec;
            4'hf: out_low = 10'h1ec;
            default: out_low = 10'h000;
          endcase
        end
        6'h28: begin
          case (mant[3:0])
            4'h0: out_low = 10'h1ed;
            4'h1: out_low = 10'h1ed;
            4'h2: out_low = 10'h1ed;
            4'h3: out_low = 10'h1ee;
            4'h4: out_low = 10'h1ee;
            4'h5: out_low = 10'h1ee;
            4'h6: out_low = 10'h1ef;
            4'h7: out_low = 10'h1ef;
            4'h8: out_low = 10'h1ef;
            4'h9: out_low = 10'h1f0;
            4'ha: out_low = 10'h1f0;
            4'hb: out_low = 10'h1f0;
            4'hc: out_low = 10'h1f0;
            4'hd: out_low = 10'h1f1;
            4'he: out_low = 10'h1f1;
            4'hf: out_low = 10'h1f1;
            default: out_low = 10'h000;
          endcase
        end
        6'h29: begin
          case (mant[3:0])
            4'h0: out_low = 10'h1f2;
            4'h1: out_low = 10'h1f2;
            4'h2: out_low = 10'h1f2;
            4'h3: out_low = 10'h1f3;
            4'h4: out_low = 10'h1f3;
            4'h5: out_low = 10'h1f3;
            4'h6: out_low = 10'h1f3;
            4'h7: out_low = 10'h1f4;
            4'h8: out_low = 10'h1f4;
            4'h9: out_low = 10'h1f4;
            4'ha: out_low = 10'h1f5;
            4'hb: out_low = 10'h1f5;
            4'hc: out_low = 10'h1f5;
            4'hd: out_low = 10'h1f6;
            4'he: out_low = 10'h1f6;
            4'hf: out_low = 10'h1f6;
            default: out_low = 10'h000;
          endcase
        end
        6'h2a: begin
          case (mant[3:0])
            4'h0: out_low = 10'h1f6;
            4'h1: out_low = 10'h1f7;
            4'h2: out_low = 10'h1f7;
            4'h3: out_low = 10'h1f7;
            4'h4: out_low = 10'h1f8;
            4'h5: out_low = 10'h1f8;
            4'h6: out_low = 10'h1f8;
            4'h7: out_low = 10'h1f9;
            4'h8: out_low = 10'h1f9;
            4'h9: out_low = 10'h1f9;
            4'ha: out_low = 10'h1f9;
            4'hb: out_low = 10'h1fa;
            4'hc: out_low = 10'h1fa;
            4'hd: out_low = 10'h1fa;
            4'he: out_low = 10'h1fb;
            4'hf: out_low = 10'h1fb;
            default: out_low = 10'h000;
          endcase
        end
        6'h2b: begin
          case (mant[3:0])
            4'h0: out_low = 10'h1fb;
            4'h1: out_low = 10'h1fc;
            4'h2: out_low = 10'h1fc;
            4'h3: out_low = 10'h1fc;
            4'h4: out_low = 10'h1fc;
            4'h5: out_low = 10'h1fd;
            4'h6: out_low = 10'h1fd;
            4'h7: out_low = 10'h1fd;
            4'h8: out_low = 10'h1fe;
            4'h9: out_low = 10'h1fe;
            4'ha: out_low = 10'h1fe;
            4'hb: out_low = 10'h1ff;
            4'hc: out_low = 10'h1ff;
            4'hd: out_low = 10'h1ff;
            4'he: out_low = 10'h1ff;
            4'hf: out_low = 10'h200;
            default: out_low = 10'h000;
          endcase
        end
        6'h2c: begin
          case (mant[3:0])
            4'h0: out_low = 10'h200;
            4'h1: out_low = 10'h200;
            4'h2: out_low = 10'h201;
            4'h3: out_low = 10'h201;
            4'h4: out_low = 10'h201;
            4'h5: out_low = 10'h201;
            4'h6: out_low = 10'h202;
            4'h7: out_low = 10'h202;
            4'h8: out_low = 10'h202;
            4'h9: out_low = 10'h203;
            4'ha: out_low = 10'h203;
            4'hb: out_low = 10'h203;
            4'hc: out_low = 10'h204;
            4'hd: out_low = 10'h204;
            4'he: out_low = 10'h204;
            4'hf: out_low = 10'h204;
            default: out_low = 10'h000;
          endcase
        end
        6'h2d: begin
          case (mant[3:0])
            4'h0: out_low = 10'h205;
            4'h1: out_low = 10'h205;
            4'h2: out_low = 10'h205;
            4'h3: out_low = 10'h206;
            4'h4: out_low = 10'h206;
            4'h5: out_low = 10'h206;
            4'h6: out_low = 10'h206;
            4'h7: out_low = 10'h207;
            4'h8: out_low = 10'h207;
            4'h9: out_low = 10'h207;
            4'ha: out_low = 10'h208;
            4'hb: out_low = 10'h208;
            4'hc: out_low = 10'h208;
            4'hd: out_low = 10'h209;
            4'he: out_low = 10'h209;
            4'hf: out_low = 10'h209;
            default: out_low = 10'h000;
          endcase
        end
        6'h2e: begin
          case (mant[3:0])
            4'h0: out_low = 10'h209;
            4'h1: out_low = 10'h20a;
            4'h2: out_low = 10'h20a;
            4'h3: out_low = 10'h20a;
            4'h4: out_low = 10'h20b;
            4'h5: out_low = 10'h20b;
            4'h6: out_low = 10'h20b;
            4'h7: out_low = 10'h20b;
            4'h8: out_low = 10'h20c;
            4'h9: out_low = 10'h20c;
            4'ha: out_low = 10'h20c;
            4'hb: out_low = 10'h20d;
            4'hc: out_low = 10'h20d;
            4'hd: out_low = 10'h20d;
            4'he: out_low = 10'h20e;
            4'hf: out_low = 10'h20e;
            default: out_low = 10'h000;
          endcase
        end
        6'h2f: begin
          case (mant[3:0])
            4'h0: out_low = 10'h20e;
            4'h1: out_low = 10'h20e;
            4'h2: out_low = 10'h20f;
            4'h3: out_low = 10'h20f;
            4'h4: out_low = 10'h20f;
            4'h5: out_low = 10'h210;
            4'h6: out_low = 10'h210;
            4'h7: out_low = 10'h210;
            4'h8: out_low = 10'h210;
            4'h9: out_low = 10'h211;
            4'ha: out_low = 10'h211;
            4'hb: out_low = 10'h211;
            4'hc: out_low = 10'h212;
            4'hd: out_low = 10'h212;
            4'he: out_low = 10'h212;
            4'hf: out_low = 10'h212;
            default: out_low = 10'h000;
          endcase
        end
        6'h30: begin
          case (mant[3:0])
            4'h0: out_low = 10'h213;
            4'h1: out_low = 10'h213;
            4'h2: out_low = 10'h213;
            4'h3: out_low = 10'h214;
            4'h4: out_low = 10'h214;
            4'h5: out_low = 10'h214;
            4'h6: out_low = 10'h214;
            4'h7: out_low = 10'h215;
            4'h8: out_low = 10'h215;
            4'h9: out_low = 10'h215;
            4'ha: out_low = 10'h216;
            4'hb: out_low = 10'h216;
            4'hc: out_low = 10'h216;
            4'hd: out_low = 10'h216;
            4'he: out_low = 10'h217;
            4'hf: out_low = 10'h217;
            default: out_low = 10'h000;
          endcase
        end
        6'h31: begin
          case (mant[3:0])
            4'h0: out_low = 10'h217;
            4'h1: out_low = 10'h218;
            4'h2: out_low = 10'h218;
            4'h3: out_low = 10'h218;
            4'h4: out_low = 10'h218;
            4'h5: out_low = 10'h219;
            4'h6: out_low = 10'h219;
            4'h7: out_low = 10'h219;
            4'h8: out_low = 10'h21a;
            4'h9: out_low = 10'h21a;
            4'ha: out_low = 10'h21a;
            4'hb: out_low = 10'h21b;
            4'hc: out_low = 10'h21b;
            4'hd: out_low = 10'h21b;
            4'he: out_low = 10'h21b;
            4'hf: out_low = 10'h21c;
            default: out_low = 10'h000;
          endcase
        end
        6'h32: begin
          case (mant[3:0])
            4'h0: out_low = 10'h21c;
            4'h1: out_low = 10'h21c;
            4'h2: out_low = 10'h21d;
            4'h3: out_low = 10'h21d;
            4'h4: out_low = 10'h21d;
            4'h5: out_low = 10'h21d;
            4'h6: out_low = 10'h21e;
            4'h7: out_low = 10'h21e;
            4'h8: out_low = 10'h21e;
            4'h9: out_low = 10'h21f;
            4'ha: out_low = 10'h21f;
            4'hb: out_low = 10'h21f;
            4'hc: out_low = 10'h21f;
            4'hd: out_low = 10'h220;
            4'he: out_low = 10'h220;
            4'hf: out_low = 10'h220;
            default: out_low = 10'h000;
          endcase
        end
        6'h33: begin
          case (mant[3:0])
            4'h0: out_low = 10'h220;
            4'h1: out_low = 10'h221;
            4'h2: out_low = 10'h221;
            4'h3: out_low = 10'h221;
            4'h4: out_low = 10'h222;
            4'h5: out_low = 10'h222;
            4'h6: out_low = 10'h222;
            4'h7: out_low = 10'h222;
            4'h8: out_low = 10'h223;
            4'h9: out_low = 10'h223;
            4'ha: out_low = 10'h223;
            4'hb: out_low = 10'h224;
            4'hc: out_low = 10'h224;
            4'hd: out_low = 10'h224;
            4'he: out_low = 10'h224;
            4'hf: out_low = 10'h225;
            default: out_low = 10'h000;
          endcase
        end
        6'h34: begin
          case (mant[3:0])
            4'h0: out_low = 10'h225;
            4'h1: out_low = 10'h225;
            4'h2: out_low = 10'h226;
            4'h3: out_low = 10'h226;
            4'h4: out_low = 10'h226;
            4'h5: out_low = 10'h226;
            4'h6: out_low = 10'h227;
            4'h7: out_low = 10'h227;
            4'h8: out_low = 10'h227;
            4'h9: out_low = 10'h228;
            4'ha: out_low = 10'h228;
            4'hb: out_low = 10'h228;
            4'hc: out_low = 10'h228;
            4'hd: out_low = 10'h229;
            4'he: out_low = 10'h229;
            4'hf: out_low = 10'h229;
            default: out_low = 10'h000;
          endcase
        end
        6'h35: begin
          case (mant[3:0])
            4'h0: out_low = 10'h22a;
            4'h1: out_low = 10'h22a;
            4'h2: out_low = 10'h22a;
            4'h3: out_low = 10'h22a;
            4'h4: out_low = 10'h22b;
            4'h5: out_low = 10'h22b;
            4'h6: out_low = 10'h22b;
            4'h7: out_low = 10'h22b;
            4'h8: out_low = 10'h22c;
            4'h9: out_low = 10'h22c;
            4'ha: out_low = 10'h22c;
            4'hb: out_low = 10'h22d;
            4'hc: out_low = 10'h22d;
            4'hd: out_low = 10'h22d;
            4'he: out_low = 10'h22d;
            4'hf: out_low = 10'h22e;
            default: out_low = 10'h000;
          endcase
        end
        6'h36: begin
          case (mant[3:0])
            4'h0: out_low = 10'h22e;
            4'h1: out_low = 10'h22e;
            4'h2: out_low = 10'h22f;
            4'h3: out_low = 10'h22f;
            4'h4: out_low = 10'h22f;
            4'h5: out_low = 10'h22f;
            4'h6: out_low = 10'h230;
            4'h7: out_low = 10'h230;
            4'h8: out_low = 10'h230;
            4'h9: out_low = 10'h231;
            4'ha: out_low = 10'h231;
            4'hb: out_low = 10'h231;
            4'hc: out_low = 10'h231;
            4'hd: out_low = 10'h232;
            4'he: out_low = 10'h232;
            4'hf: out_low = 10'h232;
            default: out_low = 10'h000;
          endcase
        end
        6'h37: begin
          case (mant[3:0])
            4'h0: out_low = 10'h232;
            4'h1: out_low = 10'h233;
            4'h2: out_low = 10'h233;
            4'h3: out_low = 10'h233;
            4'h4: out_low = 10'h234;
            4'h5: out_low = 10'h234;
            4'h6: out_low = 10'h234;
            4'h7: out_low = 10'h234;
            4'h8: out_low = 10'h235;
            4'h9: out_low = 10'h235;
            4'ha: out_low = 10'h235;
            4'hb: out_low = 10'h236;
            4'hc: out_low = 10'h236;
            4'hd: out_low = 10'h236;
            4'he: out_low = 10'h236;
            4'hf: out_low = 10'h237;
            default: out_low = 10'h000;
          endcase
        end
        6'h38: begin
          case (mant[3:0])
            4'h0: out_low = 10'h237;
            4'h1: out_low = 10'h237;
            4'h2: out_low = 10'h237;
            4'h3: out_low = 10'h238;
            4'h4: out_low = 10'h238;
            4'h5: out_low = 10'h238;
            4'h6: out_low = 10'h239;
            4'h7: out_low = 10'h239;
            4'h8: out_low = 10'h239;
            4'h9: out_low = 10'h239;
            4'ha: out_low = 10'h23a;
            4'hb: out_low = 10'h23a;
            4'hc: out_low = 10'h23a;
            4'hd: out_low = 10'h23a;
            4'he: out_low = 10'h23b;
            4'hf: out_low = 10'h23b;
            default: out_low = 10'h000;
          endcase
        end
        6'h39: begin
          case (mant[3:0])
            4'h0: out_low = 10'h23b;
            4'h1: out_low = 10'h23c;
            4'h2: out_low = 10'h23c;
            4'h3: out_low = 10'h23c;
            4'h4: out_low = 10'h23c;
            4'h5: out_low = 10'h23d;
            4'h6: out_low = 10'h23d;
            4'h7: out_low = 10'h23d;
            4'h8: out_low = 10'h23e;
            4'h9: out_low = 10'h23e;
            4'ha: out_low = 10'h23e;
            4'hb: out_low = 10'h23e;
            4'hc: out_low = 10'h23f;
            4'hd: out_low = 10'h23f;
            4'he: out_low = 10'h23f;
            4'hf: out_low = 10'h23f;
            default: out_low = 10'h000;
          endcase
        end
        6'h3a: begin
          case (mant[3:0])
            4'h0: out_low = 10'h240;
            4'h1: out_low = 10'h240;
            4'h2: out_low = 10'h240;
            4'h3: out_low = 10'h241;
            4'h4: out_low = 10'h241;
            4'h5: out_low = 10'h241;
            4'h6: out_low = 10'h241;
            4'h7: out_low = 10'h242;
            4'h8: out_low = 10'h242;
            4'h9: out_low = 10'h242;
            4'ha: out_low = 10'h242;
            4'hb: out_low = 10'h243;
            4'hc: out_low = 10'h243;
            4'hd: out_low = 10'h243;
            4'he: out_low = 10'h244;
            4'hf: out_low = 10'h244;
            default: out_low = 10'h000;
          endcase
        end
        6'h3b: begin
          case (mant[3:0])
            4'h0: out_low = 10'h244;
            4'h1: out_low = 10'h244;
            4'h2: out_low = 10'h245;
            4'h3: out_low = 10'h245;
            4'h4: out_low = 10'h245;
            4'h5: out_low = 10'h245;
            4'h6: out_low = 10'h246;
            4'h7: out_low = 10'h246;
            4'h8: out_low = 10'h246;
            4'h9: out_low = 10'h246;
            4'ha: out_low = 10'h247;
            4'hb: out_low = 10'h247;
            4'hc: out_low = 10'h247;
            4'hd: out_low = 10'h248;
            4'he: out_low = 10'h248;
            4'hf: out_low = 10'h248;
            default: out_low = 10'h000;
          endcase
        end
        6'h3c: begin
          case (mant[3:0])
            4'h0: out_low = 10'h248;
            4'h1: out_low = 10'h249;
            4'h2: out_low = 10'h249;
            4'h3: out_low = 10'h249;
            4'h4: out_low = 10'h249;
            4'h5: out_low = 10'h24a;
            4'h6: out_low = 10'h24a;
            4'h7: out_low = 10'h24a;
            4'h8: out_low = 10'h24b;
            4'h9: out_low = 10'h24b;
            4'ha: out_low = 10'h24b;
            4'hb: out_low = 10'h24b;
            4'hc: out_low = 10'h24c;
            4'hd: out_low = 10'h24c;
            4'he: out_low = 10'h24c;
            4'hf: out_low = 10'h24c;
            default: out_low = 10'h000;
          endcase
        end
        6'h3d: begin
          case (mant[3:0])
            4'h0: out_low = 10'h24d;
            4'h1: out_low = 10'h24d;
            4'h2: out_low = 10'h24d;
            4'h3: out_low = 10'h24e;
            4'h4: out_low = 10'h24e;
            4'h5: out_low = 10'h24e;
            4'h6: out_low = 10'h24e;
            4'h7: out_low = 10'h24f;
            4'h8: out_low = 10'h24f;
            4'h9: out_low = 10'h24f;
            4'ha: out_low = 10'h24f;
            4'hb: out_low = 10'h250;
            4'hc: out_low = 10'h250;
            4'hd: out_low = 10'h250;
            4'he: out_low = 10'h250;
            4'hf: out_low = 10'h251;
            default: out_low = 10'h000;
          endcase
        end
        6'h3e: begin
          case (mant[3:0])
            4'h0: out_low = 10'h251;
            4'h1: out_low = 10'h251;
            4'h2: out_low = 10'h252;
            4'h3: out_low = 10'h252;
            4'h4: out_low = 10'h252;
            4'h5: out_low = 10'h252;
            4'h6: out_low = 10'h253;
            4'h7: out_low = 10'h253;
            4'h8: out_low = 10'h253;
            4'h9: out_low = 10'h253;
            4'ha: out_low = 10'h254;
            4'hb: out_low = 10'h254;
            4'hc: out_low = 10'h254;
            4'hd: out_low = 10'h254;
            4'he: out_low = 10'h255;
            4'hf: out_low = 10'h255;
            default: out_low = 10'h000;
          endcase
        end
        6'h3f: begin
          case (mant[3:0])
            4'h0: out_low = 10'h255;
            4'h1: out_low = 10'h256;
            4'h2: out_low = 10'h256;
            4'h3: out_low = 10'h256;
            4'h4: out_low = 10'h256;
            4'h5: out_low = 10'h257;
            4'h6: out_low = 10'h257;
            4'h7: out_low = 10'h257;
            4'h8: out_low = 10'h257;
            4'h9: out_low = 10'h258;
            4'ha: out_low = 10'h258;
            4'hb: out_low = 10'h258;
            4'hc: out_low = 10'h258;
            4'hd: out_low = 10'h259;
            4'he: out_low = 10'h259;
            4'hf: out_low = 10'h259;
            default: out_low = 10'h000;
          endcase
        end
        default: out_low = 10'h000;
      endcase
      end
      2'h2: begin
      case (mant[9:4])
        6'h00: begin
          case (mant[3:0])
            4'h0: out_low = 10'h259;
            4'h1: out_low = 10'h25a;
            4'h2: out_low = 10'h25b;
            4'h3: out_low = 10'h25b;
            4'h4: out_low = 10'h25c;
            4'h5: out_low = 10'h25c;
            4'h6: out_low = 10'h25d;
            4'h7: out_low = 10'h25d;
            4'h8: out_low = 10'h25e;
            4'h9: out_low = 10'h25e;
            4'ha: out_low = 10'h25f;
            4'hb: out_low = 10'h25f;
            4'hc: out_low = 10'h260;
            4'hd: out_low = 10'h260;
            4'he: out_low = 10'h261;
            4'hf: out_low = 10'h261;
            default: out_low = 10'h000;
          endcase
        end
        6'h01: begin
          case (mant[3:0])
            4'h0: out_low = 10'h262;
            4'h1: out_low = 10'h262;
            4'h2: out_low = 10'h263;
            4'h3: out_low = 10'h263;
            4'h4: out_low = 10'h264;
            4'h5: out_low = 10'h265;
            4'h6: out_low = 10'h265;
            4'h7: out_low = 10'h266;
            4'h8: out_low = 10'h266;
            4'h9: out_low = 10'h267;
            4'ha: out_low = 10'h267;
            4'hb: out_low = 10'h268;
            4'hc: out_low = 10'h268;
            4'hd: out_low = 10'h269;
            4'he: out_low = 10'h269;
            4'hf: out_low = 10'h26a;
            default: out_low = 10'h000;
          endcase
        end
        6'h02: begin
          case (mant[3:0])
            4'h0: out_low = 10'h26a;
            4'h1: out_low = 10'h26b;
            4'h2: out_low = 10'h26b;
            4'h3: out_low = 10'h26c;
            4'h4: out_low = 10'h26c;
            4'h5: out_low = 10'h26d;
            4'h6: out_low = 10'h26d;
            4'h7: out_low = 10'h26e;
            4'h8: out_low = 10'h26e;
            4'h9: out_low = 10'h26f;
            4'ha: out_low = 10'h26f;
            4'hb: out_low = 10'h270;
            4'hc: out_low = 10'h270;
            4'hd: out_low = 10'h271;
            4'he: out_low = 10'h271;
            4'hf: out_low = 10'h272;
            default: out_low = 10'h000;
          endcase
        end
        6'h03: begin
          case (mant[3:0])
            4'h0: out_low = 10'h273;
            4'h1: out_low = 10'h273;
            4'h2: out_low = 10'h274;
            4'h3: out_low = 10'h274;
            4'h4: out_low = 10'h275;
            4'h5: out_low = 10'h275;
            4'h6: out_low = 10'h276;
            4'h7: out_low = 10'h276;
            4'h8: out_low = 10'h277;
            4'h9: out_low = 10'h277;
            4'ha: out_low = 10'h278;
            4'hb: out_low = 10'h278;
            4'hc: out_low = 10'h279;
            4'hd: out_low = 10'h279;
            4'he: out_low = 10'h27a;
            4'hf: out_low = 10'h27a;
            default: out_low = 10'h000;
          endcase
        end
        6'h04: begin
          case (mant[3:0])
            4'h0: out_low = 10'h27b;
            4'h1: out_low = 10'h27b;
            4'h2: out_low = 10'h27c;
            4'h3: out_low = 10'h27c;
            4'h4: out_low = 10'h27d;
            4'h5: out_low = 10'h27d;
            4'h6: out_low = 10'h27e;
            4'h7: out_low = 10'h27e;
            4'h8: out_low = 10'h27f;
            4'h9: out_low = 10'h27f;
            4'ha: out_low = 10'h280;
            4'hb: out_low = 10'h280;
            4'hc: out_low = 10'h281;
            4'hd: out_low = 10'h281;
            4'he: out_low = 10'h282;
            4'hf: out_low = 10'h282;
            default: out_low = 10'h000;
          endcase
        end
        6'h05: begin
          case (mant[3:0])
            4'h0: out_low = 10'h283;
            4'h1: out_low = 10'h283;
            4'h2: out_low = 10'h284;
            4'h3: out_low = 10'h284;
            4'h4: out_low = 10'h285;
            4'h5: out_low = 10'h285;
            4'h6: out_low = 10'h286;
            4'h7: out_low = 10'h286;
            4'h8: out_low = 10'h287;
            4'h9: out_low = 10'h287;
            4'ha: out_low = 10'h288;
            4'hb: out_low = 10'h288;
            4'hc: out_low = 10'h289;
            4'hd: out_low = 10'h289;
            4'he: out_low = 10'h28a;
            4'hf: out_low = 10'h28a;
            default: out_low = 10'h000;
          endcase
        end
        6'h06: begin
          case (mant[3:0])
            4'h0: out_low = 10'h28b;
            4'h1: out_low = 10'h28b;
            4'h2: out_low = 10'h28c;
            4'h3: out_low = 10'h28c;
            4'h4: out_low = 10'h28d;
            4'h5: out_low = 10'h28d;
            4'h6: out_low = 10'h28e;
            4'h7: out_low = 10'h28e;
            4'h8: out_low = 10'h28f;
            4'h9: out_low = 10'h28f;
            4'ha: out_low = 10'h290;
            4'hb: out_low = 10'h290;
            4'hc: out_low = 10'h291;
            4'hd: out_low = 10'h291;
            4'he: out_low = 10'h292;
            4'hf: out_low = 10'h292;
            default: out_low = 10'h000;
          endcase
        end
        6'h07: begin
          case (mant[3:0])
            4'h0: out_low = 10'h293;
            4'h1: out_low = 10'h293;
            4'h2: out_low = 10'h294;
            4'h3: out_low = 10'h294;
            4'h4: out_low = 10'h295;
            4'h5: out_low = 10'h295;
            4'h6: out_low = 10'h296;
            4'h7: out_low = 10'h296;
            4'h8: out_low = 10'h297;
            4'h9: out_low = 10'h297;
            4'ha: out_low = 10'h298;
            4'hb: out_low = 10'h298;
            4'hc: out_low = 10'h299;
            4'hd: out_low = 10'h299;
            4'he: out_low = 10'h29a;
            4'hf: out_low = 10'h29a;
            default: out_low = 10'h000;
          endcase
        end
        6'h08: begin
          case (mant[3:0])
            4'h0: out_low = 10'h29b;
            4'h1: out_low = 10'h29b;
            4'h2: out_low = 10'h29c;
            4'h3: out_low = 10'h29c;
            4'h4: out_low = 10'h29d;
            4'h5: out_low = 10'h29d;
            4'h6: out_low = 10'h29e;
            4'h7: out_low = 10'h29e;
            4'h8: out_low = 10'h29e;
            4'h9: out_low = 10'h29f;
            4'ha: out_low = 10'h29f;
            4'hb: out_low = 10'h2a0;
            4'hc: out_low = 10'h2a0;
            4'hd: out_low = 10'h2a1;
            4'he: out_low = 10'h2a1;
            4'hf: out_low = 10'h2a2;
            default: out_low = 10'h000;
          endcase
        end
        6'h09: begin
          case (mant[3:0])
            4'h0: out_low = 10'h2a2;
            4'h1: out_low = 10'h2a3;
            4'h2: out_low = 10'h2a3;
            4'h3: out_low = 10'h2a4;
            4'h4: out_low = 10'h2a4;
            4'h5: out_low = 10'h2a5;
            4'h6: out_low = 10'h2a5;
            4'h7: out_low = 10'h2a6;
            4'h8: out_low = 10'h2a6;
            4'h9: out_low = 10'h2a7;
            4'ha: out_low = 10'h2a7;
            4'hb: out_low = 10'h2a8;
            4'hc: out_low = 10'h2a8;
            4'hd: out_low = 10'h2a9;
            4'he: out_low = 10'h2a9;
            4'hf: out_low = 10'h2aa;
            default: out_low = 10'h000;
          endcase
        end
        6'h0a: begin
          case (mant[3:0])
            4'h0: out_low = 10'h2aa;
            4'h1: out_low = 10'h2ab;
            4'h2: out_low = 10'h2ab;
            4'h3: out_low = 10'h2ac;
            4'h4: out_low = 10'h2ac;
            4'h5: out_low = 10'h2ac;
            4'h6: out_low = 10'h2ad;
            4'h7: out_low = 10'h2ad;
            4'h8: out_low = 10'h2ae;
            4'h9: out_low = 10'h2ae;
            4'ha: out_low = 10'h2af;
            4'hb: out_low = 10'h2af;
            4'hc: out_low = 10'h2b0;
            4'hd: out_low = 10'h2b0;
            4'he: out_low = 10'h2b1;
            4'hf: out_low = 10'h2b1;
            default: out_low = 10'h000;
          endcase
        end
        6'h0b: begin
          case (mant[3:0])
            4'h0: out_low = 10'h2b2;
            4'h1: out_low = 10'h2b2;
            4'h2: out_low = 10'h2b3;
            4'h3: out_low = 10'h2b3;
            4'h4: out_low = 10'h2b4;
            4'h5: out_low = 10'h2b4;
            4'h6: out_low = 10'h2b5;
            4'h7: out_low = 10'h2b5;
            4'h8: out_low = 10'h2b6;
            4'h9: out_low = 10'h2b6;
            4'ha: out_low = 10'h2b6;
            4'hb: out_low = 10'h2b7;
            4'hc: out_low = 10'h2b7;
            4'hd: out_low = 10'h2b8;
            4'he: out_low = 10'h2b8;
            4'hf: out_low = 10'h2b9;
            default: out_low = 10'h000;
          endcase
        end
        6'h0c: begin
          case (mant[3:0])
            4'h0: out_low = 10'h2b9;
            4'h1: out_low = 10'h2ba;
            4'h2: out_low = 10'h2ba;
            4'h3: out_low = 10'h2bb;
            4'h4: out_low = 10'h2bb;
            4'h5: out_low = 10'h2bc;
            4'h6: out_low = 10'h2bc;
            4'h7: out_low = 10'h2bd;
            4'h8: out_low = 10'h2bd;
            4'h9: out_low = 10'h2be;
            4'ha: out_low = 10'h2be;
            4'hb: out_low = 10'h2bf;
            4'hc: out_low = 10'h2bf;
            4'hd: out_low = 10'h2bf;
            4'he: out_low = 10'h2c0;
            4'hf: out_low = 10'h2c0;
            default: out_low = 10'h000;
          endcase
        end
        6'h0d: begin
          case (mant[3:0])
            4'h0: out_low = 10'h2c1;
            4'h1: out_low = 10'h2c1;
            4'h2: out_low = 10'h2c2;
            4'h3: out_low = 10'h2c2;
            4'h4: out_low = 10'h2c3;
            4'h5: out_low = 10'h2c3;
            4'h6: out_low = 10'h2c4;
            4'h7: out_low = 10'h2c4;
            4'h8: out_low = 10'h2c5;
            4'h9: out_low = 10'h2c5;
            4'ha: out_low = 10'h2c6;
            4'hb: out_low = 10'h2c6;
            4'hc: out_low = 10'h2c6;
            4'hd: out_low = 10'h2c7;
            4'he: out_low = 10'h2c7;
            4'hf: out_low = 10'h2c8;
            default: out_low = 10'h000;
          endcase
        end
        6'h0e: begin
          case (mant[3:0])
            4'h0: out_low = 10'h2c8;
            4'h1: out_low = 10'h2c9;
            4'h2: out_low = 10'h2c9;
            4'h3: out_low = 10'h2ca;
            4'h4: out_low = 10'h2ca;
            4'h5: out_low = 10'h2cb;
            4'h6: out_low = 10'h2cb;
            4'h7: out_low = 10'h2cc;
            4'h8: out_low = 10'h2cc;
            4'h9: out_low = 10'h2cc;
            4'ha: out_low = 10'h2cd;
            4'hb: out_low = 10'h2cd;
            4'hc: out_low = 10'h2ce;
            4'hd: out_low = 10'h2ce;
            4'he: out_low = 10'h2cf;
            4'hf: out_low = 10'h2cf;
            default: out_low = 10'h000;
          endcase
        end
        6'h0f: begin
          case (mant[3:0])
            4'h0: out_low = 10'h2d0;
            4'h1: out_low = 10'h2d0;
            4'h2: out_low = 10'h2d1;
            4'h3: out_low = 10'h2d1;
            4'h4: out_low = 10'h2d2;
            4'h5: out_low = 10'h2d2;
            4'h6: out_low = 10'h2d2;
            4'h7: out_low = 10'h2d3;
            4'h8: out_low = 10'h2d3;
            4'h9: out_low = 10'h2d4;
            4'ha: out_low = 10'h2d4;
            4'hb: out_low = 10'h2d5;
            4'hc: out_low = 10'h2d5;
            4'hd: out_low = 10'h2d6;
            4'he: out_low = 10'h2d6;
            4'hf: out_low = 10'h2d7;
            default: out_low = 10'h000;
          endcase
        end
        6'h10: begin
          case (mant[3:0])
            4'h0: out_low = 10'h2d7;
            4'h1: out_low = 10'h2d7;
            4'h2: out_low = 10'h2d8;
            4'h3: out_low = 10'h2d8;
            4'h4: out_low = 10'h2d9;
            4'h5: out_low = 10'h2d9;
            4'h6: out_low = 10'h2da;
            4'h7: out_low = 10'h2da;
            4'h8: out_low = 10'h2db;
            4'h9: out_low = 10'h2db;
            4'ha: out_low = 10'h2dc;
            4'hb: out_low = 10'h2dc;
            4'hc: out_low = 10'h2dc;
            4'hd: out_low = 10'h2dd;
            4'he: out_low = 10'h2dd;
            4'hf: out_low = 10'h2de;
            default: out_low = 10'h000;
          endcase
        end
        6'h11: begin
          case (mant[3:0])
            4'h0: out_low = 10'h2de;
            4'h1: out_low = 10'h2df;
            4'h2: out_low = 10'h2df;
            4'h3: out_low = 10'h2e0;
            4'h4: out_low = 10'h2e0;
            4'h5: out_low = 10'h2e1;
            4'h6: out_low = 10'h2e1;
            4'h7: out_low = 10'h2e1;
            4'h8: out_low = 10'h2e2;
            4'h9: out_low = 10'h2e2;
            4'ha: out_low = 10'h2e3;
            4'hb: out_low = 10'h2e3;
            4'hc: out_low = 10'h2e4;
            4'hd: out_low = 10'h2e4;
            4'he: out_low = 10'h2e5;
            4'hf: out_low = 10'h2e5;
            default: out_low = 10'h000;
          endcase
        end
        6'h12: begin
          case (mant[3:0])
            4'h0: out_low = 10'h2e5;
            4'h1: out_low = 10'h2e6;
            4'h2: out_low = 10'h2e6;
            4'h3: out_low = 10'h2e7;
            4'h4: out_low = 10'h2e7;
            4'h5: out_low = 10'h2e8;
            4'h6: out_low = 10'h2e8;
            4'h7: out_low = 10'h2e9;
            4'h8: out_low = 10'h2e9;
            4'h9: out_low = 10'h2ea;
            4'ha: out_low = 10'h2ea;
            4'hb: out_low = 10'h2ea;
            4'hc: out_low = 10'h2eb;
            4'hd: out_low = 10'h2eb;
            4'he: out_low = 10'h2ec;
            4'hf: out_low = 10'h2ec;
            default: out_low = 10'h000;
          endcase
        end
        6'h13: begin
          case (mant[3:0])
            4'h0: out_low = 10'h2ed;
            4'h1: out_low = 10'h2ed;
            4'h2: out_low = 10'h2ee;
            4'h3: out_low = 10'h2ee;
            4'h4: out_low = 10'h2ee;
            4'h5: out_low = 10'h2ef;
            4'h6: out_low = 10'h2ef;
            4'h7: out_low = 10'h2f0;
            4'h8: out_low = 10'h2f0;
            4'h9: out_low = 10'h2f1;
            4'ha: out_low = 10'h2f1;
            4'hb: out_low = 10'h2f2;
            4'hc: out_low = 10'h2f2;
            4'hd: out_low = 10'h2f2;
            4'he: out_low = 10'h2f3;
            4'hf: out_low = 10'h2f3;
            default: out_low = 10'h000;
          endcase
        end
        6'h14: begin
          case (mant[3:0])
            4'h0: out_low = 10'h2f4;
            4'h1: out_low = 10'h2f4;
            4'h2: out_low = 10'h2f5;
            4'h3: out_low = 10'h2f5;
            4'h4: out_low = 10'h2f5;
            4'h5: out_low = 10'h2f6;
            4'h6: out_low = 10'h2f6;
            4'h7: out_low = 10'h2f7;
            4'h8: out_low = 10'h2f7;
            4'h9: out_low = 10'h2f8;
            4'ha: out_low = 10'h2f8;
            4'hb: out_low = 10'h2f9;
            4'hc: out_low = 10'h2f9;
            4'hd: out_low = 10'h2f9;
            4'he: out_low = 10'h2fa;
            4'hf: out_low = 10'h2fa;
            default: out_low = 10'h000;
          endcase
        end
        6'h15: begin
          case (mant[3:0])
            4'h0: out_low = 10'h2fb;
            4'h1: out_low = 10'h2fb;
            4'h2: out_low = 10'h2fc;
            4'h3: out_low = 10'h2fc;
            4'h4: out_low = 10'h2fd;
            4'h5: out_low = 10'h2fd;
            4'h6: out_low = 10'h2fd;
            4'h7: out_low = 10'h2fe;
            4'h8: out_low = 10'h2fe;
            4'h9: out_low = 10'h2ff;
            4'ha: out_low = 10'h2ff;
            4'hb: out_low = 10'h300;
            4'hc: out_low = 10'h300;
            4'hd: out_low = 10'h300;
            4'he: out_low = 10'h301;
            4'hf: out_low = 10'h301;
            default: out_low = 10'h000;
          endcase
        end
        6'h16: begin
          case (mant[3:0])
            4'h0: out_low = 10'h302;
            4'h1: out_low = 10'h302;
            4'h2: out_low = 10'h303;
            4'h3: out_low = 10'h303;
            4'h4: out_low = 10'h303;
            4'h5: out_low = 10'h304;
            4'h6: out_low = 10'h304;
            4'h7: out_low = 10'h305;
            4'h8: out_low = 10'h305;
            4'h9: out_low = 10'h306;
            4'ha: out_low = 10'h306;
            4'hb: out_low = 10'h307;
            4'hc: out_low = 10'h307;
            4'hd: out_low = 10'h307;
            4'he: out_low = 10'h308;
            4'hf: out_low = 10'h308;
            default: out_low = 10'h000;
          endcase
        end
        6'h17: begin
          case (mant[3:0])
            4'h0: out_low = 10'h309;
            4'h1: out_low = 10'h309;
            4'h2: out_low = 10'h30a;
            4'h3: out_low = 10'h30a;
            4'h4: out_low = 10'h30a;
            4'h5: out_low = 10'h30b;
            4'h6: out_low = 10'h30b;
            4'h7: out_low = 10'h30c;
            4'h8: out_low = 10'h30c;
            4'h9: out_low = 10'h30d;
            4'ha: out_low = 10'h30d;
            4'hb: out_low = 10'h30d;
            4'hc: out_low = 10'h30e;
            4'hd: out_low = 10'h30e;
            4'he: out_low = 10'h30f;
            4'hf: out_low = 10'h30f;
            default: out_low = 10'h000;
          endcase
        end
        6'h18: begin
          case (mant[3:0])
            4'h0: out_low = 10'h310;
            4'h1: out_low = 10'h310;
            4'h2: out_low = 10'h310;
            4'h3: out_low = 10'h311;
            4'h4: out_low = 10'h311;
            4'h5: out_low = 10'h312;
            4'h6: out_low = 10'h312;
            4'h7: out_low = 10'h313;
            4'h8: out_low = 10'h313;
            4'h9: out_low = 10'h313;
            4'ha: out_low = 10'h314;
            4'hb: out_low = 10'h314;
            4'hc: out_low = 10'h315;
            4'hd: out_low = 10'h315;
            4'he: out_low = 10'h316;
            4'hf: out_low = 10'h316;
            default: out_low = 10'h000;
          endcase
        end
        6'h19: begin
          case (mant[3:0])
            4'h0: out_low = 10'h316;
            4'h1: out_low = 10'h317;
            4'h2: out_low = 10'h317;
            4'h3: out_low = 10'h318;
            4'h4: out_low = 10'h318;
            4'h5: out_low = 10'h318;
            4'h6: out_low = 10'h319;
            4'h7: out_low = 10'h319;
            4'h8: out_low = 10'h31a;
            4'h9: out_low = 10'h31a;
            4'ha: out_low = 10'h31b;
            4'hb: out_low = 10'h31b;
            4'hc: out_low = 10'h31b;
            4'hd: out_low = 10'h31c;
            4'he: out_low = 10'h31c;
            4'hf: out_low = 10'h31d;
            default: out_low = 10'h000;
          endcase
        end
        6'h1a: begin
          case (mant[3:0])
            4'h0: out_low = 10'h31d;
            4'h1: out_low = 10'h31e;
            4'h2: out_low = 10'h31e;
            4'h3: out_low = 10'h31e;
            4'h4: out_low = 10'h31f;
            4'h5: out_low = 10'h31f;
            4'h6: out_low = 10'h320;
            4'h7: out_low = 10'h320;
            4'h8: out_low = 10'h320;
            4'h9: out_low = 10'h321;
            4'ha: out_low = 10'h321;
            4'hb: out_low = 10'h322;
            4'hc: out_low = 10'h322;
            4'hd: out_low = 10'h323;
            4'he: out_low = 10'h323;
            4'hf: out_low = 10'h323;
            default: out_low = 10'h000;
          endcase
        end
        6'h1b: begin
          case (mant[3:0])
            4'h0: out_low = 10'h324;
            4'h1: out_low = 10'h324;
            4'h2: out_low = 10'h325;
            4'h3: out_low = 10'h325;
            4'h4: out_low = 10'h326;
            4'h5: out_low = 10'h326;
            4'h6: out_low = 10'h326;
            4'h7: out_low = 10'h327;
            4'h8: out_low = 10'h327;
            4'h9: out_low = 10'h328;
            4'ha: out_low = 10'h328;
            4'hb: out_low = 10'h328;
            4'hc: out_low = 10'h329;
            4'hd: out_low = 10'h329;
            4'he: out_low = 10'h32a;
            4'hf: out_low = 10'h32a;
            default: out_low = 10'h000;
          endcase
        end
        6'h1c: begin
          case (mant[3:0])
            4'h0: out_low = 10'h32b;
            4'h1: out_low = 10'h32b;
            4'h2: out_low = 10'h32b;
            4'h3: out_low = 10'h32c;
            4'h4: out_low = 10'h32c;
            4'h5: out_low = 10'h32d;
            4'h6: out_low = 10'h32d;
            4'h7: out_low = 10'h32d;
            4'h8: out_low = 10'h32e;
            4'h9: out_low = 10'h32e;
            4'ha: out_low = 10'h32f;
            4'hb: out_low = 10'h32f;
            4'hc: out_low = 10'h32f;
            4'hd: out_low = 10'h330;
            4'he: out_low = 10'h330;
            4'hf: out_low = 10'h331;
            default: out_low = 10'h000;
          endcase
        end
        6'h1d: begin
          case (mant[3:0])
            4'h0: out_low = 10'h331;
            4'h1: out_low = 10'h332;
            4'h2: out_low = 10'h332;
            4'h3: out_low = 10'h332;
            4'h4: out_low = 10'h333;
            4'h5: out_low = 10'h333;
            4'h6: out_low = 10'h334;
            4'h7: out_low = 10'h334;
            4'h8: out_low = 10'h334;
            4'h9: out_low = 10'h335;
            4'ha: out_low = 10'h335;
            4'hb: out_low = 10'h336;
            4'hc: out_low = 10'h336;
            4'hd: out_low = 10'h336;
            4'he: out_low = 10'h337;
            4'hf: out_low = 10'h337;
            default: out_low = 10'h000;
          endcase
        end
        6'h1e: begin
          case (mant[3:0])
            4'h0: out_low = 10'h338;
            4'h1: out_low = 10'h338;
            4'h2: out_low = 10'h339;
            4'h3: out_low = 10'h339;
            4'h4: out_low = 10'h339;
            4'h5: out_low = 10'h33a;
            4'h6: out_low = 10'h33a;
            4'h7: out_low = 10'h33b;
            4'h8: out_low = 10'h33b;
            4'h9: out_low = 10'h33b;
            4'ha: out_low = 10'h33c;
            4'hb: out_low = 10'h33c;
            4'hc: out_low = 10'h33d;
            4'hd: out_low = 10'h33d;
            4'he: out_low = 10'h33d;
            4'hf: out_low = 10'h33e;
            default: out_low = 10'h000;
          endcase
        end
        6'h1f: begin
          case (mant[3:0])
            4'h0: out_low = 10'h33e;
            4'h1: out_low = 10'h33f;
            4'h2: out_low = 10'h33f;
            4'h3: out_low = 10'h33f;
            4'h4: out_low = 10'h340;
            4'h5: out_low = 10'h340;
            4'h6: out_low = 10'h341;
            4'h7: out_low = 10'h341;
            4'h8: out_low = 10'h341;
            4'h9: out_low = 10'h342;
            4'ha: out_low = 10'h342;
            4'hb: out_low = 10'h343;
            4'hc: out_low = 10'h343;
            4'hd: out_low = 10'h344;
            4'he: out_low = 10'h344;
            4'hf: out_low = 10'h344;
            default: out_low = 10'h000;
          endcase
        end
        6'h20: begin
          case (mant[3:0])
            4'h0: out_low = 10'h345;
            4'h1: out_low = 10'h345;
            4'h2: out_low = 10'h346;
            4'h3: out_low = 10'h346;
            4'h4: out_low = 10'h346;
            4'h5: out_low = 10'h347;
            4'h6: out_low = 10'h347;
            4'h7: out_low = 10'h348;
            4'h8: out_low = 10'h348;
            4'h9: out_low = 10'h348;
            4'ha: out_low = 10'h349;
            4'hb: out_low = 10'h349;
            4'hc: out_low = 10'h34a;
            4'hd: out_low = 10'h34a;
            4'he: out_low = 10'h34a;
            4'hf: out_low = 10'h34b;
            default: out_low = 10'h000;
          endcase
        end
        6'h21: begin
          case (mant[3:0])
            4'h0: out_low = 10'h34b;
            4'h1: out_low = 10'h34c;
            4'h2: out_low = 10'h34c;
            4'h3: out_low = 10'h34c;
            4'h4: out_low = 10'h34d;
            4'h5: out_low = 10'h34d;
            4'h6: out_low = 10'h34e;
            4'h7: out_low = 10'h34e;
            4'h8: out_low = 10'h34e;
            4'h9: out_low = 10'h34f;
            4'ha: out_low = 10'h34f;
            4'hb: out_low = 10'h350;
            4'hc: out_low = 10'h350;
            4'hd: out_low = 10'h350;
            4'he: out_low = 10'h351;
            4'hf: out_low = 10'h351;
            default: out_low = 10'h000;
          endcase
        end
        6'h22: begin
          case (mant[3:0])
            4'h0: out_low = 10'h352;
            4'h1: out_low = 10'h352;
            4'h2: out_low = 10'h352;
            4'h3: out_low = 10'h353;
            4'h4: out_low = 10'h353;
            4'h5: out_low = 10'h354;
            4'h6: out_low = 10'h354;
            4'h7: out_low = 10'h354;
            4'h8: out_low = 10'h355;
            4'h9: out_low = 10'h355;
            4'ha: out_low = 10'h356;
            4'hb: out_low = 10'h356;
            4'hc: out_low = 10'h356;
            4'hd: out_low = 10'h357;
            4'he: out_low = 10'h357;
            4'hf: out_low = 10'h358;
            default: out_low = 10'h000;
          endcase
        end
        6'h23: begin
          case (mant[3:0])
            4'h0: out_low = 10'h358;
            4'h1: out_low = 10'h358;
            4'h2: out_low = 10'h359;
            4'h3: out_low = 10'h359;
            4'h4: out_low = 10'h359;
            4'h5: out_low = 10'h35a;
            4'h6: out_low = 10'h35a;
            4'h7: out_low = 10'h35b;
            4'h8: out_low = 10'h35b;
            4'h9: out_low = 10'h35b;
            4'ha: out_low = 10'h35c;
            4'hb: out_low = 10'h35c;
            4'hc: out_low = 10'h35d;
            4'hd: out_low = 10'h35d;
            4'he: out_low = 10'h35d;
            4'hf: out_low = 10'h35e;
            default: out_low = 10'h000;
          endcase
        end
        6'h24: begin
          case (mant[3:0])
            4'h0: out_low = 10'h35e;
            4'h1: out_low = 10'h35f;
            4'h2: out_low = 10'h35f;
            4'h3: out_low = 10'h35f;
            4'h4: out_low = 10'h360;
            4'h5: out_low = 10'h360;
            4'h6: out_low = 10'h361;
            4'h7: out_low = 10'h361;
            4'h8: out_low = 10'h361;
            4'h9: out_low = 10'h362;
            4'ha: out_low = 10'h362;
            4'hb: out_low = 10'h363;
            4'hc: out_low = 10'h363;
            4'hd: out_low = 10'h363;
            4'he: out_low = 10'h364;
            4'hf: out_low = 10'h364;
            default: out_low = 10'h000;
          endcase
        end
        6'h25: begin
          case (mant[3:0])
            4'h0: out_low = 10'h364;
            4'h1: out_low = 10'h365;
            4'h2: out_low = 10'h365;
            4'h3: out_low = 10'h366;
            4'h4: out_low = 10'h366;
            4'h5: out_low = 10'h366;
            4'h6: out_low = 10'h367;
            4'h7: out_low = 10'h367;
            4'h8: out_low = 10'h368;
            4'h9: out_low = 10'h368;
            4'ha: out_low = 10'h368;
            4'hb: out_low = 10'h369;
            4'hc: out_low = 10'h369;
            4'hd: out_low = 10'h36a;
            4'he: out_low = 10'h36a;
            4'hf: out_low = 10'h36a;
            default: out_low = 10'h000;
          endcase
        end
        6'h26: begin
          case (mant[3:0])
            4'h0: out_low = 10'h36b;
            4'h1: out_low = 10'h36b;
            4'h2: out_low = 10'h36b;
            4'h3: out_low = 10'h36c;
            4'h4: out_low = 10'h36c;
            4'h5: out_low = 10'h36d;
            4'h6: out_low = 10'h36d;
            4'h7: out_low = 10'h36d;
            4'h8: out_low = 10'h36e;
            4'h9: out_low = 10'h36e;
            4'ha: out_low = 10'h36f;
            4'hb: out_low = 10'h36f;
            4'hc: out_low = 10'h36f;
            4'hd: out_low = 10'h370;
            4'he: out_low = 10'h370;
            4'hf: out_low = 10'h371;
            default: out_low = 10'h000;
          endcase
        end
        6'h27: begin
          case (mant[3:0])
            4'h0: out_low = 10'h371;
            4'h1: out_low = 10'h371;
            4'h2: out_low = 10'h372;
            4'h3: out_low = 10'h372;
            4'h4: out_low = 10'h372;
            4'h5: out_low = 10'h373;
            4'h6: out_low = 10'h373;
            4'h7: out_low = 10'h374;
            4'h8: out_low = 10'h374;
            4'h9: out_low = 10'h374;
            4'ha: out_low = 10'h375;
            4'hb: out_low = 10'h375;
            4'hc: out_low = 10'h376;
            4'hd: out_low = 10'h376;
            4'he: out_low = 10'h376;
            4'hf: out_low = 10'h377;
            default: out_low = 10'h000;
          endcase
        end
        6'h28: begin
          case (mant[3:0])
            4'h0: out_low = 10'h377;
            4'h1: out_low = 10'h377;
            4'h2: out_low = 10'h378;
            4'h3: out_low = 10'h378;
            4'h4: out_low = 10'h379;
            4'h5: out_low = 10'h379;
            4'h6: out_low = 10'h379;
            4'h7: out_low = 10'h37a;
            4'h8: out_low = 10'h37a;
            4'h9: out_low = 10'h37a;
            4'ha: out_low = 10'h37b;
            4'hb: out_low = 10'h37b;
            4'hc: out_low = 10'h37c;
            4'hd: out_low = 10'h37c;
            4'he: out_low = 10'h37c;
            4'hf: out_low = 10'h37d;
            default: out_low = 10'h000;
          endcase
        end
        6'h29: begin
          case (mant[3:0])
            4'h0: out_low = 10'h37d;
            4'h1: out_low = 10'h37e;
            4'h2: out_low = 10'h37e;
            4'h3: out_low = 10'h37e;
            4'h4: out_low = 10'h37f;
            4'h5: out_low = 10'h37f;
            4'h6: out_low = 10'h37f;
            4'h7: out_low = 10'h380;
            4'h8: out_low = 10'h380;
            4'h9: out_low = 10'h381;
            4'ha: out_low = 10'h381;
            4'hb: out_low = 10'h381;
            4'hc: out_low = 10'h382;
            4'hd: out_low = 10'h382;
            4'he: out_low = 10'h382;
            4'hf: out_low = 10'h383;
            default: out_low = 10'h000;
          endcase
        end
        6'h2a: begin
          case (mant[3:0])
            4'h0: out_low = 10'h383;
            4'h1: out_low = 10'h384;
            4'h2: out_low = 10'h384;
            4'h3: out_low = 10'h384;
            4'h4: out_low = 10'h385;
            4'h5: out_low = 10'h385;
            4'h6: out_low = 10'h385;
            4'h7: out_low = 10'h386;
            4'h8: out_low = 10'h386;
            4'h9: out_low = 10'h387;
            4'ha: out_low = 10'h387;
            4'hb: out_low = 10'h387;
            4'hc: out_low = 10'h388;
            4'hd: out_low = 10'h388;
            4'he: out_low = 10'h388;
            4'hf: out_low = 10'h389;
            default: out_low = 10'h000;
          endcase
        end
        6'h2b: begin
          case (mant[3:0])
            4'h0: out_low = 10'h389;
            4'h1: out_low = 10'h38a;
            4'h2: out_low = 10'h38a;
            4'h3: out_low = 10'h38a;
            4'h4: out_low = 10'h38b;
            4'h5: out_low = 10'h38b;
            4'h6: out_low = 10'h38b;
            4'h7: out_low = 10'h38c;
            4'h8: out_low = 10'h38c;
            4'h9: out_low = 10'h38d;
            4'ha: out_low = 10'h38d;
            4'hb: out_low = 10'h38d;
            4'hc: out_low = 10'h38e;
            4'hd: out_low = 10'h38e;
            4'he: out_low = 10'h38e;
            4'hf: out_low = 10'h38f;
            default: out_low = 10'h000;
          endcase
        end
        6'h2c: begin
          case (mant[3:0])
            4'h0: out_low = 10'h38f;
            4'h1: out_low = 10'h390;
            4'h2: out_low = 10'h390;
            4'h3: out_low = 10'h390;
            4'h4: out_low = 10'h391;
            4'h5: out_low = 10'h391;
            4'h6: out_low = 10'h391;
            4'h7: out_low = 10'h392;
            4'h8: out_low = 10'h392;
            4'h9: out_low = 10'h393;
            4'ha: out_low = 10'h393;
            4'hb: out_low = 10'h393;
            4'hc: out_low = 10'h394;
            4'hd: out_low = 10'h394;
            4'he: out_low = 10'h394;
            4'hf: out_low = 10'h395;
            default: out_low = 10'h000;
          endcase
        end
        6'h2d: begin
          case (mant[3:0])
            4'h0: out_low = 10'h395;
            4'h1: out_low = 10'h396;
            4'h2: out_low = 10'h396;
            4'h3: out_low = 10'h396;
            4'h4: out_low = 10'h397;
            4'h5: out_low = 10'h397;
            4'h6: out_low = 10'h397;
            4'h7: out_low = 10'h398;
            4'h8: out_low = 10'h398;
            4'h9: out_low = 10'h399;
            4'ha: out_low = 10'h399;
            4'hb: out_low = 10'h399;
            4'hc: out_low = 10'h39a;
            4'hd: out_low = 10'h39a;
            4'he: out_low = 10'h39a;
            4'hf: out_low = 10'h39b;
            default: out_low = 10'h000;
          endcase
        end
        6'h2e: begin
          case (mant[3:0])
            4'h0: out_low = 10'h39b;
            4'h1: out_low = 10'h39b;
            4'h2: out_low = 10'h39c;
            4'h3: out_low = 10'h39c;
            4'h4: out_low = 10'h39d;
            4'h5: out_low = 10'h39d;
            4'h6: out_low = 10'h39d;
            4'h7: out_low = 10'h39e;
            4'h8: out_low = 10'h39e;
            4'h9: out_low = 10'h39e;
            4'ha: out_low = 10'h39f;
            4'hb: out_low = 10'h39f;
            4'hc: out_low = 10'h3a0;
            4'hd: out_low = 10'h3a0;
            4'he: out_low = 10'h3a0;
            4'hf: out_low = 10'h3a1;
            default: out_low = 10'h000;
          endcase
        end
        6'h2f: begin
          case (mant[3:0])
            4'h0: out_low = 10'h3a1;
            4'h1: out_low = 10'h3a1;
            4'h2: out_low = 10'h3a2;
            4'h3: out_low = 10'h3a2;
            4'h4: out_low = 10'h3a2;
            4'h5: out_low = 10'h3a3;
            4'h6: out_low = 10'h3a3;
            4'h7: out_low = 10'h3a4;
            4'h8: out_low = 10'h3a4;
            4'h9: out_low = 10'h3a4;
            4'ha: out_low = 10'h3a5;
            4'hb: out_low = 10'h3a5;
            4'hc: out_low = 10'h3a5;
            4'hd: out_low = 10'h3a6;
            4'he: out_low = 10'h3a6;
            4'hf: out_low = 10'h3a6;
            default: out_low = 10'h000;
          endcase
        end
        6'h30: begin
          case (mant[3:0])
            4'h0: out_low = 10'h3a7;
            4'h1: out_low = 10'h3a7;
            4'h2: out_low = 10'h3a8;
            4'h3: out_low = 10'h3a8;
            4'h4: out_low = 10'h3a8;
            4'h5: out_low = 10'h3a9;
            4'h6: out_low = 10'h3a9;
            4'h7: out_low = 10'h3a9;
            4'h8: out_low = 10'h3aa;
            4'h9: out_low = 10'h3aa;
            4'ha: out_low = 10'h3aa;
            4'hb: out_low = 10'h3ab;
            4'hc: out_low = 10'h3ab;
            4'hd: out_low = 10'h3ac;
            4'he: out_low = 10'h3ac;
            4'hf: out_low = 10'h3ac;
            default: out_low = 10'h000;
          endcase
        end
        6'h31: begin
          case (mant[3:0])
            4'h0: out_low = 10'h3ad;
            4'h1: out_low = 10'h3ad;
            4'h2: out_low = 10'h3ad;
            4'h3: out_low = 10'h3ae;
            4'h4: out_low = 10'h3ae;
            4'h5: out_low = 10'h3ae;
            4'h6: out_low = 10'h3af;
            4'h7: out_low = 10'h3af;
            4'h8: out_low = 10'h3b0;
            4'h9: out_low = 10'h3b0;
            4'ha: out_low = 10'h3b0;
            4'hb: out_low = 10'h3b1;
            4'hc: out_low = 10'h3b1;
            4'hd: out_low = 10'h3b1;
            4'he: out_low = 10'h3b2;
            4'hf: out_low = 10'h3b2;
            default: out_low = 10'h000;
          endcase
        end
        6'h32: begin
          case (mant[3:0])
            4'h0: out_low = 10'h3b2;
            4'h1: out_low = 10'h3b3;
            4'h2: out_low = 10'h3b3;
            4'h3: out_low = 10'h3b4;
            4'h4: out_low = 10'h3b4;
            4'h5: out_low = 10'h3b4;
            4'h6: out_low = 10'h3b5;
            4'h7: out_low = 10'h3b5;
            4'h8: out_low = 10'h3b5;
            4'h9: out_low = 10'h3b6;
            4'ha: out_low = 10'h3b6;
            4'hb: out_low = 10'h3b6;
            4'hc: out_low = 10'h3b7;
            4'hd: out_low = 10'h3b7;
            4'he: out_low = 10'h3b7;
            4'hf: out_low = 10'h3b8;
            default: out_low = 10'h000;
          endcase
        end
        6'h33: begin
          case (mant[3:0])
            4'h0: out_low = 10'h3b8;
            4'h1: out_low = 10'h3b9;
            4'h2: out_low = 10'h3b9;
            4'h3: out_low = 10'h3b9;
            4'h4: out_low = 10'h3ba;
            4'h5: out_low = 10'h3ba;
            4'h6: out_low = 10'h3ba;
            4'h7: out_low = 10'h3bb;
            4'h8: out_low = 10'h3bb;
            4'h9: out_low = 10'h3bb;
            4'ha: out_low = 10'h3bc;
            4'hb: out_low = 10'h3bc;
            4'hc: out_low = 10'h3bc;
            4'hd: out_low = 10'h3bd;
            4'he: out_low = 10'h3bd;
            4'hf: out_low = 10'h3be;
            default: out_low = 10'h000;
          endcase
        end
        6'h34: begin
          case (mant[3:0])
            4'h0: out_low = 10'h3be;
            4'h1: out_low = 10'h3be;
            4'h2: out_low = 10'h3bf;
            4'h3: out_low = 10'h3bf;
            4'h4: out_low = 10'h3bf;
            4'h5: out_low = 10'h3c0;
            4'h6: out_low = 10'h3c0;
            4'h7: out_low = 10'h3c0;
            4'h8: out_low = 10'h3c1;
            4'h9: out_low = 10'h3c1;
            4'ha: out_low = 10'h3c1;
            4'hb: out_low = 10'h3c2;
            4'hc: out_low = 10'h3c2;
            4'hd: out_low = 10'h3c3;
            4'he: out_low = 10'h3c3;
            4'hf: out_low = 10'h3c3;
            default: out_low = 10'h000;
          endcase
        end
        6'h35: begin
          case (mant[3:0])
            4'h0: out_low = 10'h3c4;
            4'h1: out_low = 10'h3c4;
            4'h2: out_low = 10'h3c4;
            4'h3: out_low = 10'h3c5;
            4'h4: out_low = 10'h3c5;
            4'h5: out_low = 10'h3c5;
            4'h6: out_low = 10'h3c6;
            4'h7: out_low = 10'h3c6;
            4'h8: out_low = 10'h3c6;
            4'h9: out_low = 10'h3c7;
            4'ha: out_low = 10'h3c7;
            4'hb: out_low = 10'h3c7;
            4'hc: out_low = 10'h3c8;
            4'hd: out_low = 10'h3c8;
            4'he: out_low = 10'h3c9;
            4'hf: out_low = 10'h3c9;
            default: out_low = 10'h000;
          endcase
        end
        6'h36: begin
          case (mant[3:0])
            4'h0: out_low = 10'h3c9;
            4'h1: out_low = 10'h3ca;
            4'h2: out_low = 10'h3ca;
            4'h3: out_low = 10'h3ca;
            4'h4: out_low = 10'h3cb;
            4'h5: out_low = 10'h3cb;
            4'h6: out_low = 10'h3cb;
            4'h7: out_low = 10'h3cc;
            4'h8: out_low = 10'h3cc;
            4'h9: out_low = 10'h3cc;
            4'ha: out_low = 10'h3cd;
            4'hb: out_low = 10'h3cd;
            4'hc: out_low = 10'h3cd;
            4'hd: out_low = 10'h3ce;
            4'he: out_low = 10'h3ce;
            4'hf: out_low = 10'h3ce;
            default: out_low = 10'h000;
          endcase
        end
        6'h37: begin
          case (mant[3:0])
            4'h0: out_low = 10'h3cf;
            4'h1: out_low = 10'h3cf;
            4'h2: out_low = 10'h3d0;
            4'h3: out_low = 10'h3d0;
            4'h4: out_low = 10'h3d0;
            4'h5: out_low = 10'h3d1;
            4'h6: out_low = 10'h3d1;
            4'h7: out_low = 10'h3d1;
            4'h8: out_low = 10'h3d2;
            4'h9: out_low = 10'h3d2;
            4'ha: out_low = 10'h3d2;
            4'hb: out_low = 10'h3d3;
            4'hc: out_low = 10'h3d3;
            4'hd: out_low = 10'h3d3;
            4'he: out_low = 10'h3d4;
            4'hf: out_low = 10'h3d4;
            default: out_low = 10'h000;
          endcase
        end
        6'h38: begin
          case (mant[3:0])
            4'h0: out_low = 10'h3d4;
            4'h1: out_low = 10'h3d5;
            4'h2: out_low = 10'h3d5;
            4'h3: out_low = 10'h3d5;
            4'h4: out_low = 10'h3d6;
            4'h5: out_low = 10'h3d6;
            4'h6: out_low = 10'h3d6;
            4'h7: out_low = 10'h3d7;
            4'h8: out_low = 10'h3d7;
            4'h9: out_low = 10'h3d8;
            4'ha: out_low = 10'h3d8;
            4'hb: out_low = 10'h3d8;
            4'hc: out_low = 10'h3d9;
            4'hd: out_low = 10'h3d9;
            4'he: out_low = 10'h3d9;
            4'hf: out_low = 10'h3da;
            default: out_low = 10'h000;
          endcase
        end
        6'h39: begin
          case (mant[3:0])
            4'h0: out_low = 10'h3da;
            4'h1: out_low = 10'h3da;
            4'h2: out_low = 10'h3db;
            4'h3: out_low = 10'h3db;
            4'h4: out_low = 10'h3db;
            4'h5: out_low = 10'h3dc;
            4'h6: out_low = 10'h3dc;
            4'h7: out_low = 10'h3dc;
            4'h8: out_low = 10'h3dd;
            4'h9: out_low = 10'h3dd;
            4'ha: out_low = 10'h3dd;
            4'hb: out_low = 10'h3de;
            4'hc: out_low = 10'h3de;
            4'hd: out_low = 10'h3de;
            4'he: out_low = 10'h3df;
            4'hf: out_low = 10'h3df;
            default: out_low = 10'h000;
          endcase
        end
        6'h3a: begin
          case (mant[3:0])
            4'h0: out_low = 10'h3df;
            4'h1: out_low = 10'h3e0;
            4'h2: out_low = 10'h3e0;
            4'h3: out_low = 10'h3e1;
            4'h4: out_low = 10'h3e1;
            4'h5: out_low = 10'h3e1;
            4'h6: out_low = 10'h3e2;
            4'h7: out_low = 10'h3e2;
            4'h8: out_low = 10'h3e2;
            4'h9: out_low = 10'h3e3;
            4'ha: out_low = 10'h3e3;
            4'hb: out_low = 10'h3e3;
            4'hc: out_low = 10'h3e4;
            4'hd: out_low = 10'h3e4;
            4'he: out_low = 10'h3e4;
            4'hf: out_low = 10'h3e5;
            default: out_low = 10'h000;
          endcase
        end
        6'h3b: begin
          case (mant[3:0])
            4'h0: out_low = 10'h3e5;
            4'h1: out_low = 10'h3e5;
            4'h2: out_low = 10'h3e6;
            4'h3: out_low = 10'h3e6;
            4'h4: out_low = 10'h3e6;
            4'h5: out_low = 10'h3e7;
            4'h6: out_low = 10'h3e7;
            4'h7: out_low = 10'h3e7;
            4'h8: out_low = 10'h3e8;
            4'h9: out_low = 10'h3e8;
            4'ha: out_low = 10'h3e8;
            4'hb: out_low = 10'h3e9;
            4'hc: out_low = 10'h3e9;
            4'hd: out_low = 10'h3e9;
            4'he: out_low = 10'h3ea;
            4'hf: out_low = 10'h3ea;
            default: out_low = 10'h000;
          endcase
        end
        6'h3c: begin
          case (mant[3:0])
            4'h0: out_low = 10'h3ea;
            4'h1: out_low = 10'h3eb;
            4'h2: out_low = 10'h3eb;
            4'h3: out_low = 10'h3eb;
            4'h4: out_low = 10'h3ec;
            4'h5: out_low = 10'h3ec;
            4'h6: out_low = 10'h3ec;
            4'h7: out_low = 10'h3ed;
            4'h8: out_low = 10'h3ed;
            4'h9: out_low = 10'h3ee;
            4'ha: out_low = 10'h3ee;
            4'hb: out_low = 10'h3ee;
            4'hc: out_low = 10'h3ef;
            4'hd: out_low = 10'h3ef;
            4'he: out_low = 10'h3ef;
            4'hf: out_low = 10'h3f0;
            default: out_low = 10'h000;
          endcase
        end
        6'h3d: begin
          case (mant[3:0])
            4'h0: out_low = 10'h3f0;
            4'h1: out_low = 10'h3f0;
            4'h2: out_low = 10'h3f1;
            4'h3: out_low = 10'h3f1;
            4'h4: out_low = 10'h3f1;
            4'h5: out_low = 10'h3f2;
            4'h6: out_low = 10'h3f2;
            4'h7: out_low = 10'h3f2;
            4'h8: out_low = 10'h3f3;
            4'h9: out_low = 10'h3f3;
            4'ha: out_low = 10'h3f3;
            4'hb: out_low = 10'h3f4;
            4'hc: out_low = 10'h3f4;
            4'hd: out_low = 10'h3f4;
            4'he: out_low = 10'h3f5;
            4'hf: out_low = 10'h3f5;
            default: out_low = 10'h000;
          endcase
        end
        6'h3e: begin
          case (mant[3:0])
            4'h0: out_low = 10'h3f5;
            4'h1: out_low = 10'h3f6;
            4'h2: out_low = 10'h3f6;
            4'h3: out_low = 10'h3f6;
            4'h4: out_low = 10'h3f7;
            4'h5: out_low = 10'h3f7;
            4'h6: out_low = 10'h3f7;
            4'h7: out_low = 10'h3f8;
            4'h8: out_low = 10'h3f8;
            4'h9: out_low = 10'h3f8;
            4'ha: out_low = 10'h3f9;
            4'hb: out_low = 10'h3f9;
            4'hc: out_low = 10'h3f9;
            4'hd: out_low = 10'h3fa;
            4'he: out_low = 10'h3fa;
            4'hf: out_low = 10'h3fa;
            default: out_low = 10'h000;
          endcase
        end
        6'h3f: begin
          case (mant[3:0])
            4'h0: out_low = 10'h3fb;
            4'h1: out_low = 10'h3fb;
            4'h2: out_low = 10'h3fb;
            4'h3: out_low = 10'h3fc;
            4'h4: out_low = 10'h3fc;
            4'h5: out_low = 10'h3fc;
            4'h6: out_low = 10'h3fd;
            4'h7: out_low = 10'h3fd;
            4'h8: out_low = 10'h3fd;
            4'h9: out_low = 10'h3fe;
            4'ha: out_low = 10'h3fe;
            4'hb: out_low = 10'h3fe;
            4'hc: out_low = 10'h3ff;
            4'hd: out_low = 10'h3ff;
            4'he: out_low = 10'h3ff;
            4'hf: out_low = 10'h000;
            default: out_low = 10'h000;
          endcase
        end
        default: out_low = 10'h000;
      endcase
      end
      default: out_low = 10'h000;
    endcase
  end
  reg [4:0] high_vec;
  always @* begin
    case (exp)
      5'h01: begin
        high_vec = 5'h0a;
      end
      5'h02: begin
        if (mant <= 10'h3fe) begin
          high_vec = 5'h0a;
        end else begin
          high_vec = 5'h0b;
        end
      end
      5'h03: begin
        high_vec = 5'h0b;
      end
      5'h04: begin
        high_vec = 5'h0b;
      end
      5'h05: begin
        if (mant <= 10'h3fe) begin
          high_vec = 5'h0b;
        end else begin
          high_vec = 5'h0c;
        end
      end
      5'h06: begin
        high_vec = 5'h0c;
      end
      5'h07: begin
        high_vec = 5'h0c;
      end
      5'h08: begin
        if (mant <= 10'h3fe) begin
          high_vec = 5'h0c;
        end else begin
          high_vec = 5'h0d;
        end
      end
      5'h09: begin
        high_vec = 5'h0d;
      end
      5'h0a: begin
        high_vec = 5'h0d;
      end
      5'h0b: begin
        if (mant <= 10'h3fe) begin
          high_vec = 5'h0d;
        end else begin
          high_vec = 5'h0e;
        end
      end
      5'h0c: begin
        high_vec = 5'h0e;
      end
      5'h0d: begin
        high_vec = 5'h0e;
      end
      5'h0e: begin
        if (mant <= 10'h3fe) begin
          high_vec = 5'h0e;
        end else begin
          high_vec = 5'h0f;
        end
      end
      5'h0f: begin
        high_vec = 5'h0f;
      end
      5'h10: begin
        high_vec = 5'h0f;
      end
      5'h11: begin
        if (mant <= 10'h3fe) begin
          high_vec = 5'h0f;
        end else begin
          high_vec = 5'h10;
        end
      end
      5'h12: begin
        high_vec = 5'h10;
      end
      5'h13: begin
        high_vec = 5'h10;
      end
      5'h14: begin
        if (mant <= 10'h3fe) begin
          high_vec = 5'h10;
        end else begin
          high_vec = 5'h11;
        end
      end
      5'h15: begin
        high_vec = 5'h11;
      end
      5'h16: begin
        high_vec = 5'h11;
      end
      5'h17: begin
        if (mant <= 10'h3fe) begin
          high_vec = 5'h11;
        end else begin
          high_vec = 5'h12;
        end
      end
      5'h18: begin
        high_vec = 5'h12;
      end
      5'h19: begin
        high_vec = 5'h12;
      end
      5'h1a: begin
        if (mant <= 10'h3fe) begin
          high_vec = 5'h12;
        end else begin
          high_vec = 5'h13;
        end
      end
      5'h1b: begin
        high_vec = 5'h13;
      end
      5'h1c: begin
        high_vec = 5'h13;
      end
      5'h1d: begin
        if (mant <= 10'h3fe) begin
          high_vec = 5'h13;
        end else begin
          high_vec = 5'h14;
        end
      end
      5'h1e: begin
        high_vec = 5'h14;
      end
      default: high_vec = 5'h00;
    endcase
  end
  wire [14:0] active_mag = {high_vec, out_low};
  wire [15:0] active_out = {sign, active_mag};
  assign out = active ? active_out : special_out;
endmodule
