module ex229_odd_wordmode_mh5(in, out);
  input [15:0] in;
  output [15:0] out;
  wire sign = in[15];
  wire [4:0] exp = in[14:10];
  wire [9:0] mant = in[9:0];
  reg [15:0] pos_special;
  always @* begin
    pos_special = 16'h0000;
    case (exp)
      5'h00: pos_special = 16'h0000;
      5'h12: pos_special = 16'h3c00;
      5'h13: pos_special = 16'h3c00;
      5'h14: pos_special = 16'h3c00;
      5'h15: pos_special = 16'h3c00;
      5'h16: pos_special = 16'h3c00;
      5'h17: pos_special = 16'h3c00;
      5'h18: pos_special = 16'h3c00;
      5'h19: pos_special = 16'h3c00;
      5'h1a: pos_special = 16'h3c00;
      5'h1b: pos_special = 16'h3c00;
      5'h1c: pos_special = 16'h3c00;
      5'h1d: pos_special = 16'h3c00;
      5'h1e: pos_special = 16'h3c00;
      5'h1f: begin
        case (mant)
          10'h000: pos_special = 16'h3c00;
          10'h001: pos_special = 16'h7e00;
          10'h002: pos_special = 16'h7e00;
          10'h003: pos_special = 16'h7e00;
          10'h004: pos_special = 16'h7e00;
          10'h005: pos_special = 16'h7e00;
          10'h006: pos_special = 16'h7e00;
          10'h007: pos_special = 16'h7e00;
          10'h008: pos_special = 16'h7e00;
          10'h009: pos_special = 16'h7e00;
          10'h00a: pos_special = 16'h7e00;
          10'h00b: pos_special = 16'h7e00;
          10'h00c: pos_special = 16'h7e00;
          10'h00d: pos_special = 16'h7e00;
          10'h00e: pos_special = 16'h7e00;
          10'h00f: pos_special = 16'h7e00;
          10'h010: pos_special = 16'h7e00;
          10'h011: pos_special = 16'h7e00;
          10'h012: pos_special = 16'h7e00;
          10'h013: pos_special = 16'h7e00;
          10'h014: pos_special = 16'h7e00;
          10'h015: pos_special = 16'h7e00;
          10'h016: pos_special = 16'h7e00;
          10'h017: pos_special = 16'h7e00;
          10'h018: pos_special = 16'h7e00;
          10'h019: pos_special = 16'h7e00;
          10'h01a: pos_special = 16'h7e00;
          10'h01b: pos_special = 16'h7e00;
          10'h01c: pos_special = 16'h7e00;
          10'h01d: pos_special = 16'h7e00;
          10'h01e: pos_special = 16'h7e00;
          10'h01f: pos_special = 16'h7e00;
          10'h020: pos_special = 16'h7e00;
          10'h021: pos_special = 16'h7e00;
          10'h022: pos_special = 16'h7e00;
          10'h023: pos_special = 16'h7e00;
          10'h024: pos_special = 16'h7e00;
          10'h025: pos_special = 16'h7e00;
          10'h026: pos_special = 16'h7e00;
          10'h027: pos_special = 16'h7e00;
          10'h028: pos_special = 16'h7e00;
          10'h029: pos_special = 16'h7e00;
          10'h02a: pos_special = 16'h7e00;
          10'h02b: pos_special = 16'h7e00;
          10'h02c: pos_special = 16'h7e00;
          10'h02d: pos_special = 16'h7e00;
          10'h02e: pos_special = 16'h7e00;
          10'h02f: pos_special = 16'h7e00;
          10'h030: pos_special = 16'h7e00;
          10'h031: pos_special = 16'h7e00;
          10'h032: pos_special = 16'h7e00;
          10'h033: pos_special = 16'h7e00;
          10'h034: pos_special = 16'h7e00;
          10'h035: pos_special = 16'h7e00;
          10'h036: pos_special = 16'h7e00;
          10'h037: pos_special = 16'h7e00;
          10'h038: pos_special = 16'h7e00;
          10'h039: pos_special = 16'h7e00;
          10'h03a: pos_special = 16'h7e00;
          10'h03b: pos_special = 16'h7e00;
          10'h03c: pos_special = 16'h7e00;
          10'h03d: pos_special = 16'h7e00;
          10'h03e: pos_special = 16'h7e00;
          10'h03f: pos_special = 16'h7e00;
          10'h040: pos_special = 16'h7e00;
          10'h041: pos_special = 16'h7e00;
          10'h042: pos_special = 16'h7e00;
          10'h043: pos_special = 16'h7e00;
          10'h044: pos_special = 16'h7e00;
          10'h045: pos_special = 16'h7e00;
          10'h046: pos_special = 16'h7e00;
          10'h047: pos_special = 16'h7e00;
          10'h048: pos_special = 16'h7e00;
          10'h049: pos_special = 16'h7e00;
          10'h04a: pos_special = 16'h7e00;
          10'h04b: pos_special = 16'h7e00;
          10'h04c: pos_special = 16'h7e00;
          10'h04d: pos_special = 16'h7e00;
          10'h04e: pos_special = 16'h7e00;
          10'h04f: pos_special = 16'h7e00;
          10'h050: pos_special = 16'h7e00;
          10'h051: pos_special = 16'h7e00;
          10'h052: pos_special = 16'h7e00;
          10'h053: pos_special = 16'h7e00;
          10'h054: pos_special = 16'h7e00;
          10'h055: pos_special = 16'h7e00;
          10'h056: pos_special = 16'h7e00;
          10'h057: pos_special = 16'h7e00;
          10'h058: pos_special = 16'h7e00;
          10'h059: pos_special = 16'h7e00;
          10'h05a: pos_special = 16'h7e00;
          10'h05b: pos_special = 16'h7e00;
          10'h05c: pos_special = 16'h7e00;
          10'h05d: pos_special = 16'h7e00;
          10'h05e: pos_special = 16'h7e00;
          10'h05f: pos_special = 16'h7e00;
          10'h060: pos_special = 16'h7e00;
          10'h061: pos_special = 16'h7e00;
          10'h062: pos_special = 16'h7e00;
          10'h063: pos_special = 16'h7e00;
          10'h064: pos_special = 16'h7e00;
          10'h065: pos_special = 16'h7e00;
          10'h066: pos_special = 16'h7e00;
          10'h067: pos_special = 16'h7e00;
          10'h068: pos_special = 16'h7e00;
          10'h069: pos_special = 16'h7e00;
          10'h06a: pos_special = 16'h7e00;
          10'h06b: pos_special = 16'h7e00;
          10'h06c: pos_special = 16'h7e00;
          10'h06d: pos_special = 16'h7e00;
          10'h06e: pos_special = 16'h7e00;
          10'h06f: pos_special = 16'h7e00;
          10'h070: pos_special = 16'h7e00;
          10'h071: pos_special = 16'h7e00;
          10'h072: pos_special = 16'h7e00;
          10'h073: pos_special = 16'h7e00;
          10'h074: pos_special = 16'h7e00;
          10'h075: pos_special = 16'h7e00;
          10'h076: pos_special = 16'h7e00;
          10'h077: pos_special = 16'h7e00;
          10'h078: pos_special = 16'h7e00;
          10'h079: pos_special = 16'h7e00;
          10'h07a: pos_special = 16'h7e00;
          10'h07b: pos_special = 16'h7e00;
          10'h07c: pos_special = 16'h7e00;
          10'h07d: pos_special = 16'h7e00;
          10'h07e: pos_special = 16'h7e00;
          10'h07f: pos_special = 16'h7e00;
          10'h080: pos_special = 16'h7e00;
          10'h081: pos_special = 16'h7e00;
          10'h082: pos_special = 16'h7e00;
          10'h083: pos_special = 16'h7e00;
          10'h084: pos_special = 16'h7e00;
          10'h085: pos_special = 16'h7e00;
          10'h086: pos_special = 16'h7e00;
          10'h087: pos_special = 16'h7e00;
          10'h088: pos_special = 16'h7e00;
          10'h089: pos_special = 16'h7e00;
          10'h08a: pos_special = 16'h7e00;
          10'h08b: pos_special = 16'h7e00;
          10'h08c: pos_special = 16'h7e00;
          10'h08d: pos_special = 16'h7e00;
          10'h08e: pos_special = 16'h7e00;
          10'h08f: pos_special = 16'h7e00;
          10'h090: pos_special = 16'h7e00;
          10'h091: pos_special = 16'h7e00;
          10'h092: pos_special = 16'h7e00;
          10'h093: pos_special = 16'h7e00;
          10'h094: pos_special = 16'h7e00;
          10'h095: pos_special = 16'h7e00;
          10'h096: pos_special = 16'h7e00;
          10'h097: pos_special = 16'h7e00;
          10'h098: pos_special = 16'h7e00;
          10'h099: pos_special = 16'h7e00;
          10'h09a: pos_special = 16'h7e00;
          10'h09b: pos_special = 16'h7e00;
          10'h09c: pos_special = 16'h7e00;
          10'h09d: pos_special = 16'h7e00;
          10'h09e: pos_special = 16'h7e00;
          10'h09f: pos_special = 16'h7e00;
          10'h0a0: pos_special = 16'h7e00;
          10'h0a1: pos_special = 16'h7e00;
          10'h0a2: pos_special = 16'h7e00;
          10'h0a3: pos_special = 16'h7e00;
          10'h0a4: pos_special = 16'h7e00;
          10'h0a5: pos_special = 16'h7e00;
          10'h0a6: pos_special = 16'h7e00;
          10'h0a7: pos_special = 16'h7e00;
          10'h0a8: pos_special = 16'h7e00;
          10'h0a9: pos_special = 16'h7e00;
          10'h0aa: pos_special = 16'h7e00;
          10'h0ab: pos_special = 16'h7e00;
          10'h0ac: pos_special = 16'h7e00;
          10'h0ad: pos_special = 16'h7e00;
          10'h0ae: pos_special = 16'h7e00;
          10'h0af: pos_special = 16'h7e00;
          10'h0b0: pos_special = 16'h7e00;
          10'h0b1: pos_special = 16'h7e00;
          10'h0b2: pos_special = 16'h7e00;
          10'h0b3: pos_special = 16'h7e00;
          10'h0b4: pos_special = 16'h7e00;
          10'h0b5: pos_special = 16'h7e00;
          10'h0b6: pos_special = 16'h7e00;
          10'h0b7: pos_special = 16'h7e00;
          10'h0b8: pos_special = 16'h7e00;
          10'h0b9: pos_special = 16'h7e00;
          10'h0ba: pos_special = 16'h7e00;
          10'h0bb: pos_special = 16'h7e00;
          10'h0bc: pos_special = 16'h7e00;
          10'h0bd: pos_special = 16'h7e00;
          10'h0be: pos_special = 16'h7e00;
          10'h0bf: pos_special = 16'h7e00;
          10'h0c0: pos_special = 16'h7e00;
          10'h0c1: pos_special = 16'h7e00;
          10'h0c2: pos_special = 16'h7e00;
          10'h0c3: pos_special = 16'h7e00;
          10'h0c4: pos_special = 16'h7e00;
          10'h0c5: pos_special = 16'h7e00;
          10'h0c6: pos_special = 16'h7e00;
          10'h0c7: pos_special = 16'h7e00;
          10'h0c8: pos_special = 16'h7e00;
          10'h0c9: pos_special = 16'h7e00;
          10'h0ca: pos_special = 16'h7e00;
          10'h0cb: pos_special = 16'h7e00;
          10'h0cc: pos_special = 16'h7e00;
          10'h0cd: pos_special = 16'h7e00;
          10'h0ce: pos_special = 16'h7e00;
          10'h0cf: pos_special = 16'h7e00;
          10'h0d0: pos_special = 16'h7e00;
          10'h0d1: pos_special = 16'h7e00;
          10'h0d2: pos_special = 16'h7e00;
          10'h0d3: pos_special = 16'h7e00;
          10'h0d4: pos_special = 16'h7e00;
          10'h0d5: pos_special = 16'h7e00;
          10'h0d6: pos_special = 16'h7e00;
          10'h0d7: pos_special = 16'h7e00;
          10'h0d8: pos_special = 16'h7e00;
          10'h0d9: pos_special = 16'h7e00;
          10'h0da: pos_special = 16'h7e00;
          10'h0db: pos_special = 16'h7e00;
          10'h0dc: pos_special = 16'h7e00;
          10'h0dd: pos_special = 16'h7e00;
          10'h0de: pos_special = 16'h7e00;
          10'h0df: pos_special = 16'h7e00;
          10'h0e0: pos_special = 16'h7e00;
          10'h0e1: pos_special = 16'h7e00;
          10'h0e2: pos_special = 16'h7e00;
          10'h0e3: pos_special = 16'h7e00;
          10'h0e4: pos_special = 16'h7e00;
          10'h0e5: pos_special = 16'h7e00;
          10'h0e6: pos_special = 16'h7e00;
          10'h0e7: pos_special = 16'h7e00;
          10'h0e8: pos_special = 16'h7e00;
          10'h0e9: pos_special = 16'h7e00;
          10'h0ea: pos_special = 16'h7e00;
          10'h0eb: pos_special = 16'h7e00;
          10'h0ec: pos_special = 16'h7e00;
          10'h0ed: pos_special = 16'h7e00;
          10'h0ee: pos_special = 16'h7e00;
          10'h0ef: pos_special = 16'h7e00;
          10'h0f0: pos_special = 16'h7e00;
          10'h0f1: pos_special = 16'h7e00;
          10'h0f2: pos_special = 16'h7e00;
          10'h0f3: pos_special = 16'h7e00;
          10'h0f4: pos_special = 16'h7e00;
          10'h0f5: pos_special = 16'h7e00;
          10'h0f6: pos_special = 16'h7e00;
          10'h0f7: pos_special = 16'h7e00;
          10'h0f8: pos_special = 16'h7e00;
          10'h0f9: pos_special = 16'h7e00;
          10'h0fa: pos_special = 16'h7e00;
          10'h0fb: pos_special = 16'h7e00;
          10'h0fc: pos_special = 16'h7e00;
          10'h0fd: pos_special = 16'h7e00;
          10'h0fe: pos_special = 16'h7e00;
          10'h0ff: pos_special = 16'h7e00;
          10'h100: pos_special = 16'h7e00;
          10'h101: pos_special = 16'h7e00;
          10'h102: pos_special = 16'h7e00;
          10'h103: pos_special = 16'h7e00;
          10'h104: pos_special = 16'h7e00;
          10'h105: pos_special = 16'h7e00;
          10'h106: pos_special = 16'h7e00;
          10'h107: pos_special = 16'h7e00;
          10'h108: pos_special = 16'h7e00;
          10'h109: pos_special = 16'h7e00;
          10'h10a: pos_special = 16'h7e00;
          10'h10b: pos_special = 16'h7e00;
          10'h10c: pos_special = 16'h7e00;
          10'h10d: pos_special = 16'h7e00;
          10'h10e: pos_special = 16'h7e00;
          10'h10f: pos_special = 16'h7e00;
          10'h110: pos_special = 16'h7e00;
          10'h111: pos_special = 16'h7e00;
          10'h112: pos_special = 16'h7e00;
          10'h113: pos_special = 16'h7e00;
          10'h114: pos_special = 16'h7e00;
          10'h115: pos_special = 16'h7e00;
          10'h116: pos_special = 16'h7e00;
          10'h117: pos_special = 16'h7e00;
          10'h118: pos_special = 16'h7e00;
          10'h119: pos_special = 16'h7e00;
          10'h11a: pos_special = 16'h7e00;
          10'h11b: pos_special = 16'h7e00;
          10'h11c: pos_special = 16'h7e00;
          10'h11d: pos_special = 16'h7e00;
          10'h11e: pos_special = 16'h7e00;
          10'h11f: pos_special = 16'h7e00;
          10'h120: pos_special = 16'h7e00;
          10'h121: pos_special = 16'h7e00;
          10'h122: pos_special = 16'h7e00;
          10'h123: pos_special = 16'h7e00;
          10'h124: pos_special = 16'h7e00;
          10'h125: pos_special = 16'h7e00;
          10'h126: pos_special = 16'h7e00;
          10'h127: pos_special = 16'h7e00;
          10'h128: pos_special = 16'h7e00;
          10'h129: pos_special = 16'h7e00;
          10'h12a: pos_special = 16'h7e00;
          10'h12b: pos_special = 16'h7e00;
          10'h12c: pos_special = 16'h7e00;
          10'h12d: pos_special = 16'h7e00;
          10'h12e: pos_special = 16'h7e00;
          10'h12f: pos_special = 16'h7e00;
          10'h130: pos_special = 16'h7e00;
          10'h131: pos_special = 16'h7e00;
          10'h132: pos_special = 16'h7e00;
          10'h133: pos_special = 16'h7e00;
          10'h134: pos_special = 16'h7e00;
          10'h135: pos_special = 16'h7e00;
          10'h136: pos_special = 16'h7e00;
          10'h137: pos_special = 16'h7e00;
          10'h138: pos_special = 16'h7e00;
          10'h139: pos_special = 16'h7e00;
          10'h13a: pos_special = 16'h7e00;
          10'h13b: pos_special = 16'h7e00;
          10'h13c: pos_special = 16'h7e00;
          10'h13d: pos_special = 16'h7e00;
          10'h13e: pos_special = 16'h7e00;
          10'h13f: pos_special = 16'h7e00;
          10'h140: pos_special = 16'h7e00;
          10'h141: pos_special = 16'h7e00;
          10'h142: pos_special = 16'h7e00;
          10'h143: pos_special = 16'h7e00;
          10'h144: pos_special = 16'h7e00;
          10'h145: pos_special = 16'h7e00;
          10'h146: pos_special = 16'h7e00;
          10'h147: pos_special = 16'h7e00;
          10'h148: pos_special = 16'h7e00;
          10'h149: pos_special = 16'h7e00;
          10'h14a: pos_special = 16'h7e00;
          10'h14b: pos_special = 16'h7e00;
          10'h14c: pos_special = 16'h7e00;
          10'h14d: pos_special = 16'h7e00;
          10'h14e: pos_special = 16'h7e00;
          10'h14f: pos_special = 16'h7e00;
          10'h150: pos_special = 16'h7e00;
          10'h151: pos_special = 16'h7e00;
          10'h152: pos_special = 16'h7e00;
          10'h153: pos_special = 16'h7e00;
          10'h154: pos_special = 16'h7e00;
          10'h155: pos_special = 16'h7e00;
          10'h156: pos_special = 16'h7e00;
          10'h157: pos_special = 16'h7e00;
          10'h158: pos_special = 16'h7e00;
          10'h159: pos_special = 16'h7e00;
          10'h15a: pos_special = 16'h7e00;
          10'h15b: pos_special = 16'h7e00;
          10'h15c: pos_special = 16'h7e00;
          10'h15d: pos_special = 16'h7e00;
          10'h15e: pos_special = 16'h7e00;
          10'h15f: pos_special = 16'h7e00;
          10'h160: pos_special = 16'h7e00;
          10'h161: pos_special = 16'h7e00;
          10'h162: pos_special = 16'h7e00;
          10'h163: pos_special = 16'h7e00;
          10'h164: pos_special = 16'h7e00;
          10'h165: pos_special = 16'h7e00;
          10'h166: pos_special = 16'h7e00;
          10'h167: pos_special = 16'h7e00;
          10'h168: pos_special = 16'h7e00;
          10'h169: pos_special = 16'h7e00;
          10'h16a: pos_special = 16'h7e00;
          10'h16b: pos_special = 16'h7e00;
          10'h16c: pos_special = 16'h7e00;
          10'h16d: pos_special = 16'h7e00;
          10'h16e: pos_special = 16'h7e00;
          10'h16f: pos_special = 16'h7e00;
          10'h170: pos_special = 16'h7e00;
          10'h171: pos_special = 16'h7e00;
          10'h172: pos_special = 16'h7e00;
          10'h173: pos_special = 16'h7e00;
          10'h174: pos_special = 16'h7e00;
          10'h175: pos_special = 16'h7e00;
          10'h176: pos_special = 16'h7e00;
          10'h177: pos_special = 16'h7e00;
          10'h178: pos_special = 16'h7e00;
          10'h179: pos_special = 16'h7e00;
          10'h17a: pos_special = 16'h7e00;
          10'h17b: pos_special = 16'h7e00;
          10'h17c: pos_special = 16'h7e00;
          10'h17d: pos_special = 16'h7e00;
          10'h17e: pos_special = 16'h7e00;
          10'h17f: pos_special = 16'h7e00;
          10'h180: pos_special = 16'h7e00;
          10'h181: pos_special = 16'h7e00;
          10'h182: pos_special = 16'h7e00;
          10'h183: pos_special = 16'h7e00;
          10'h184: pos_special = 16'h7e00;
          10'h185: pos_special = 16'h7e00;
          10'h186: pos_special = 16'h7e00;
          10'h187: pos_special = 16'h7e00;
          10'h188: pos_special = 16'h7e00;
          10'h189: pos_special = 16'h7e00;
          10'h18a: pos_special = 16'h7e00;
          10'h18b: pos_special = 16'h7e00;
          10'h18c: pos_special = 16'h7e00;
          10'h18d: pos_special = 16'h7e00;
          10'h18e: pos_special = 16'h7e00;
          10'h18f: pos_special = 16'h7e00;
          10'h190: pos_special = 16'h7e00;
          10'h191: pos_special = 16'h7e00;
          10'h192: pos_special = 16'h7e00;
          10'h193: pos_special = 16'h7e00;
          10'h194: pos_special = 16'h7e00;
          10'h195: pos_special = 16'h7e00;
          10'h196: pos_special = 16'h7e00;
          10'h197: pos_special = 16'h7e00;
          10'h198: pos_special = 16'h7e00;
          10'h199: pos_special = 16'h7e00;
          10'h19a: pos_special = 16'h7e00;
          10'h19b: pos_special = 16'h7e00;
          10'h19c: pos_special = 16'h7e00;
          10'h19d: pos_special = 16'h7e00;
          10'h19e: pos_special = 16'h7e00;
          10'h19f: pos_special = 16'h7e00;
          10'h1a0: pos_special = 16'h7e00;
          10'h1a1: pos_special = 16'h7e00;
          10'h1a2: pos_special = 16'h7e00;
          10'h1a3: pos_special = 16'h7e00;
          10'h1a4: pos_special = 16'h7e00;
          10'h1a5: pos_special = 16'h7e00;
          10'h1a6: pos_special = 16'h7e00;
          10'h1a7: pos_special = 16'h7e00;
          10'h1a8: pos_special = 16'h7e00;
          10'h1a9: pos_special = 16'h7e00;
          10'h1aa: pos_special = 16'h7e00;
          10'h1ab: pos_special = 16'h7e00;
          10'h1ac: pos_special = 16'h7e00;
          10'h1ad: pos_special = 16'h7e00;
          10'h1ae: pos_special = 16'h7e00;
          10'h1af: pos_special = 16'h7e00;
          10'h1b0: pos_special = 16'h7e00;
          10'h1b1: pos_special = 16'h7e00;
          10'h1b2: pos_special = 16'h7e00;
          10'h1b3: pos_special = 16'h7e00;
          10'h1b4: pos_special = 16'h7e00;
          10'h1b5: pos_special = 16'h7e00;
          10'h1b6: pos_special = 16'h7e00;
          10'h1b7: pos_special = 16'h7e00;
          10'h1b8: pos_special = 16'h7e00;
          10'h1b9: pos_special = 16'h7e00;
          10'h1ba: pos_special = 16'h7e00;
          10'h1bb: pos_special = 16'h7e00;
          10'h1bc: pos_special = 16'h7e00;
          10'h1bd: pos_special = 16'h7e00;
          10'h1be: pos_special = 16'h7e00;
          10'h1bf: pos_special = 16'h7e00;
          10'h1c0: pos_special = 16'h7e00;
          10'h1c1: pos_special = 16'h7e00;
          10'h1c2: pos_special = 16'h7e00;
          10'h1c3: pos_special = 16'h7e00;
          10'h1c4: pos_special = 16'h7e00;
          10'h1c5: pos_special = 16'h7e00;
          10'h1c6: pos_special = 16'h7e00;
          10'h1c7: pos_special = 16'h7e00;
          10'h1c8: pos_special = 16'h7e00;
          10'h1c9: pos_special = 16'h7e00;
          10'h1ca: pos_special = 16'h7e00;
          10'h1cb: pos_special = 16'h7e00;
          10'h1cc: pos_special = 16'h7e00;
          10'h1cd: pos_special = 16'h7e00;
          10'h1ce: pos_special = 16'h7e00;
          10'h1cf: pos_special = 16'h7e00;
          10'h1d0: pos_special = 16'h7e00;
          10'h1d1: pos_special = 16'h7e00;
          10'h1d2: pos_special = 16'h7e00;
          10'h1d3: pos_special = 16'h7e00;
          10'h1d4: pos_special = 16'h7e00;
          10'h1d5: pos_special = 16'h7e00;
          10'h1d6: pos_special = 16'h7e00;
          10'h1d7: pos_special = 16'h7e00;
          10'h1d8: pos_special = 16'h7e00;
          10'h1d9: pos_special = 16'h7e00;
          10'h1da: pos_special = 16'h7e00;
          10'h1db: pos_special = 16'h7e00;
          10'h1dc: pos_special = 16'h7e00;
          10'h1dd: pos_special = 16'h7e00;
          10'h1de: pos_special = 16'h7e00;
          10'h1df: pos_special = 16'h7e00;
          10'h1e0: pos_special = 16'h7e00;
          10'h1e1: pos_special = 16'h7e00;
          10'h1e2: pos_special = 16'h7e00;
          10'h1e3: pos_special = 16'h7e00;
          10'h1e4: pos_special = 16'h7e00;
          10'h1e5: pos_special = 16'h7e00;
          10'h1e6: pos_special = 16'h7e00;
          10'h1e7: pos_special = 16'h7e00;
          10'h1e8: pos_special = 16'h7e00;
          10'h1e9: pos_special = 16'h7e00;
          10'h1ea: pos_special = 16'h7e00;
          10'h1eb: pos_special = 16'h7e00;
          10'h1ec: pos_special = 16'h7e00;
          10'h1ed: pos_special = 16'h7e00;
          10'h1ee: pos_special = 16'h7e00;
          10'h1ef: pos_special = 16'h7e00;
          10'h1f0: pos_special = 16'h7e00;
          10'h1f1: pos_special = 16'h7e00;
          10'h1f2: pos_special = 16'h7e00;
          10'h1f3: pos_special = 16'h7e00;
          10'h1f4: pos_special = 16'h7e00;
          10'h1f5: pos_special = 16'h7e00;
          10'h1f6: pos_special = 16'h7e00;
          10'h1f7: pos_special = 16'h7e00;
          10'h1f8: pos_special = 16'h7e00;
          10'h1f9: pos_special = 16'h7e00;
          10'h1fa: pos_special = 16'h7e00;
          10'h1fb: pos_special = 16'h7e00;
          10'h1fc: pos_special = 16'h7e00;
          10'h1fd: pos_special = 16'h7e00;
          10'h1fe: pos_special = 16'h7e00;
          10'h1ff: pos_special = 16'h7e00;
          10'h200: pos_special = 16'h7e00;
          10'h201: pos_special = 16'h7e00;
          10'h202: pos_special = 16'h7e00;
          10'h203: pos_special = 16'h7e00;
          10'h204: pos_special = 16'h7e00;
          10'h205: pos_special = 16'h7e00;
          10'h206: pos_special = 16'h7e00;
          10'h207: pos_special = 16'h7e00;
          10'h208: pos_special = 16'h7e00;
          10'h209: pos_special = 16'h7e00;
          10'h20a: pos_special = 16'h7e00;
          10'h20b: pos_special = 16'h7e00;
          10'h20c: pos_special = 16'h7e00;
          10'h20d: pos_special = 16'h7e00;
          10'h20e: pos_special = 16'h7e00;
          10'h20f: pos_special = 16'h7e00;
          10'h210: pos_special = 16'h7e00;
          10'h211: pos_special = 16'h7e00;
          10'h212: pos_special = 16'h7e00;
          10'h213: pos_special = 16'h7e00;
          10'h214: pos_special = 16'h7e00;
          10'h215: pos_special = 16'h7e00;
          10'h216: pos_special = 16'h7e00;
          10'h217: pos_special = 16'h7e00;
          10'h218: pos_special = 16'h7e00;
          10'h219: pos_special = 16'h7e00;
          10'h21a: pos_special = 16'h7e00;
          10'h21b: pos_special = 16'h7e00;
          10'h21c: pos_special = 16'h7e00;
          10'h21d: pos_special = 16'h7e00;
          10'h21e: pos_special = 16'h7e00;
          10'h21f: pos_special = 16'h7e00;
          10'h220: pos_special = 16'h7e00;
          10'h221: pos_special = 16'h7e00;
          10'h222: pos_special = 16'h7e00;
          10'h223: pos_special = 16'h7e00;
          10'h224: pos_special = 16'h7e00;
          10'h225: pos_special = 16'h7e00;
          10'h226: pos_special = 16'h7e00;
          10'h227: pos_special = 16'h7e00;
          10'h228: pos_special = 16'h7e00;
          10'h229: pos_special = 16'h7e00;
          10'h22a: pos_special = 16'h7e00;
          10'h22b: pos_special = 16'h7e00;
          10'h22c: pos_special = 16'h7e00;
          10'h22d: pos_special = 16'h7e00;
          10'h22e: pos_special = 16'h7e00;
          10'h22f: pos_special = 16'h7e00;
          10'h230: pos_special = 16'h7e00;
          10'h231: pos_special = 16'h7e00;
          10'h232: pos_special = 16'h7e00;
          10'h233: pos_special = 16'h7e00;
          10'h234: pos_special = 16'h7e00;
          10'h235: pos_special = 16'h7e00;
          10'h236: pos_special = 16'h7e00;
          10'h237: pos_special = 16'h7e00;
          10'h238: pos_special = 16'h7e00;
          10'h239: pos_special = 16'h7e00;
          10'h23a: pos_special = 16'h7e00;
          10'h23b: pos_special = 16'h7e00;
          10'h23c: pos_special = 16'h7e00;
          10'h23d: pos_special = 16'h7e00;
          10'h23e: pos_special = 16'h7e00;
          10'h23f: pos_special = 16'h7e00;
          10'h240: pos_special = 16'h7e00;
          10'h241: pos_special = 16'h7e00;
          10'h242: pos_special = 16'h7e00;
          10'h243: pos_special = 16'h7e00;
          10'h244: pos_special = 16'h7e00;
          10'h245: pos_special = 16'h7e00;
          10'h246: pos_special = 16'h7e00;
          10'h247: pos_special = 16'h7e00;
          10'h248: pos_special = 16'h7e00;
          10'h249: pos_special = 16'h7e00;
          10'h24a: pos_special = 16'h7e00;
          10'h24b: pos_special = 16'h7e00;
          10'h24c: pos_special = 16'h7e00;
          10'h24d: pos_special = 16'h7e00;
          10'h24e: pos_special = 16'h7e00;
          10'h24f: pos_special = 16'h7e00;
          10'h250: pos_special = 16'h7e00;
          10'h251: pos_special = 16'h7e00;
          10'h252: pos_special = 16'h7e00;
          10'h253: pos_special = 16'h7e00;
          10'h254: pos_special = 16'h7e00;
          10'h255: pos_special = 16'h7e00;
          10'h256: pos_special = 16'h7e00;
          10'h257: pos_special = 16'h7e00;
          10'h258: pos_special = 16'h7e00;
          10'h259: pos_special = 16'h7e00;
          10'h25a: pos_special = 16'h7e00;
          10'h25b: pos_special = 16'h7e00;
          10'h25c: pos_special = 16'h7e00;
          10'h25d: pos_special = 16'h7e00;
          10'h25e: pos_special = 16'h7e00;
          10'h25f: pos_special = 16'h7e00;
          10'h260: pos_special = 16'h7e00;
          10'h261: pos_special = 16'h7e00;
          10'h262: pos_special = 16'h7e00;
          10'h263: pos_special = 16'h7e00;
          10'h264: pos_special = 16'h7e00;
          10'h265: pos_special = 16'h7e00;
          10'h266: pos_special = 16'h7e00;
          10'h267: pos_special = 16'h7e00;
          10'h268: pos_special = 16'h7e00;
          10'h269: pos_special = 16'h7e00;
          10'h26a: pos_special = 16'h7e00;
          10'h26b: pos_special = 16'h7e00;
          10'h26c: pos_special = 16'h7e00;
          10'h26d: pos_special = 16'h7e00;
          10'h26e: pos_special = 16'h7e00;
          10'h26f: pos_special = 16'h7e00;
          10'h270: pos_special = 16'h7e00;
          10'h271: pos_special = 16'h7e00;
          10'h272: pos_special = 16'h7e00;
          10'h273: pos_special = 16'h7e00;
          10'h274: pos_special = 16'h7e00;
          10'h275: pos_special = 16'h7e00;
          10'h276: pos_special = 16'h7e00;
          10'h277: pos_special = 16'h7e00;
          10'h278: pos_special = 16'h7e00;
          10'h279: pos_special = 16'h7e00;
          10'h27a: pos_special = 16'h7e00;
          10'h27b: pos_special = 16'h7e00;
          10'h27c: pos_special = 16'h7e00;
          10'h27d: pos_special = 16'h7e00;
          10'h27e: pos_special = 16'h7e00;
          10'h27f: pos_special = 16'h7e00;
          10'h280: pos_special = 16'h7e00;
          10'h281: pos_special = 16'h7e00;
          10'h282: pos_special = 16'h7e00;
          10'h283: pos_special = 16'h7e00;
          10'h284: pos_special = 16'h7e00;
          10'h285: pos_special = 16'h7e00;
          10'h286: pos_special = 16'h7e00;
          10'h287: pos_special = 16'h7e00;
          10'h288: pos_special = 16'h7e00;
          10'h289: pos_special = 16'h7e00;
          10'h28a: pos_special = 16'h7e00;
          10'h28b: pos_special = 16'h7e00;
          10'h28c: pos_special = 16'h7e00;
          10'h28d: pos_special = 16'h7e00;
          10'h28e: pos_special = 16'h7e00;
          10'h28f: pos_special = 16'h7e00;
          10'h290: pos_special = 16'h7e00;
          10'h291: pos_special = 16'h7e00;
          10'h292: pos_special = 16'h7e00;
          10'h293: pos_special = 16'h7e00;
          10'h294: pos_special = 16'h7e00;
          10'h295: pos_special = 16'h7e00;
          10'h296: pos_special = 16'h7e00;
          10'h297: pos_special = 16'h7e00;
          10'h298: pos_special = 16'h7e00;
          10'h299: pos_special = 16'h7e00;
          10'h29a: pos_special = 16'h7e00;
          10'h29b: pos_special = 16'h7e00;
          10'h29c: pos_special = 16'h7e00;
          10'h29d: pos_special = 16'h7e00;
          10'h29e: pos_special = 16'h7e00;
          10'h29f: pos_special = 16'h7e00;
          10'h2a0: pos_special = 16'h7e00;
          10'h2a1: pos_special = 16'h7e00;
          10'h2a2: pos_special = 16'h7e00;
          10'h2a3: pos_special = 16'h7e00;
          10'h2a4: pos_special = 16'h7e00;
          10'h2a5: pos_special = 16'h7e00;
          10'h2a6: pos_special = 16'h7e00;
          10'h2a7: pos_special = 16'h7e00;
          10'h2a8: pos_special = 16'h7e00;
          10'h2a9: pos_special = 16'h7e00;
          10'h2aa: pos_special = 16'h7e00;
          10'h2ab: pos_special = 16'h7e00;
          10'h2ac: pos_special = 16'h7e00;
          10'h2ad: pos_special = 16'h7e00;
          10'h2ae: pos_special = 16'h7e00;
          10'h2af: pos_special = 16'h7e00;
          10'h2b0: pos_special = 16'h7e00;
          10'h2b1: pos_special = 16'h7e00;
          10'h2b2: pos_special = 16'h7e00;
          10'h2b3: pos_special = 16'h7e00;
          10'h2b4: pos_special = 16'h7e00;
          10'h2b5: pos_special = 16'h7e00;
          10'h2b6: pos_special = 16'h7e00;
          10'h2b7: pos_special = 16'h7e00;
          10'h2b8: pos_special = 16'h7e00;
          10'h2b9: pos_special = 16'h7e00;
          10'h2ba: pos_special = 16'h7e00;
          10'h2bb: pos_special = 16'h7e00;
          10'h2bc: pos_special = 16'h7e00;
          10'h2bd: pos_special = 16'h7e00;
          10'h2be: pos_special = 16'h7e00;
          10'h2bf: pos_special = 16'h7e00;
          10'h2c0: pos_special = 16'h7e00;
          10'h2c1: pos_special = 16'h7e00;
          10'h2c2: pos_special = 16'h7e00;
          10'h2c3: pos_special = 16'h7e00;
          10'h2c4: pos_special = 16'h7e00;
          10'h2c5: pos_special = 16'h7e00;
          10'h2c6: pos_special = 16'h7e00;
          10'h2c7: pos_special = 16'h7e00;
          10'h2c8: pos_special = 16'h7e00;
          10'h2c9: pos_special = 16'h7e00;
          10'h2ca: pos_special = 16'h7e00;
          10'h2cb: pos_special = 16'h7e00;
          10'h2cc: pos_special = 16'h7e00;
          10'h2cd: pos_special = 16'h7e00;
          10'h2ce: pos_special = 16'h7e00;
          10'h2cf: pos_special = 16'h7e00;
          10'h2d0: pos_special = 16'h7e00;
          10'h2d1: pos_special = 16'h7e00;
          10'h2d2: pos_special = 16'h7e00;
          10'h2d3: pos_special = 16'h7e00;
          10'h2d4: pos_special = 16'h7e00;
          10'h2d5: pos_special = 16'h7e00;
          10'h2d6: pos_special = 16'h7e00;
          10'h2d7: pos_special = 16'h7e00;
          10'h2d8: pos_special = 16'h7e00;
          10'h2d9: pos_special = 16'h7e00;
          10'h2da: pos_special = 16'h7e00;
          10'h2db: pos_special = 16'h7e00;
          10'h2dc: pos_special = 16'h7e00;
          10'h2dd: pos_special = 16'h7e00;
          10'h2de: pos_special = 16'h7e00;
          10'h2df: pos_special = 16'h7e00;
          10'h2e0: pos_special = 16'h7e00;
          10'h2e1: pos_special = 16'h7e00;
          10'h2e2: pos_special = 16'h7e00;
          10'h2e3: pos_special = 16'h7e00;
          10'h2e4: pos_special = 16'h7e00;
          10'h2e5: pos_special = 16'h7e00;
          10'h2e6: pos_special = 16'h7e00;
          10'h2e7: pos_special = 16'h7e00;
          10'h2e8: pos_special = 16'h7e00;
          10'h2e9: pos_special = 16'h7e00;
          10'h2ea: pos_special = 16'h7e00;
          10'h2eb: pos_special = 16'h7e00;
          10'h2ec: pos_special = 16'h7e00;
          10'h2ed: pos_special = 16'h7e00;
          10'h2ee: pos_special = 16'h7e00;
          10'h2ef: pos_special = 16'h7e00;
          10'h2f0: pos_special = 16'h7e00;
          10'h2f1: pos_special = 16'h7e00;
          10'h2f2: pos_special = 16'h7e00;
          10'h2f3: pos_special = 16'h7e00;
          10'h2f4: pos_special = 16'h7e00;
          10'h2f5: pos_special = 16'h7e00;
          10'h2f6: pos_special = 16'h7e00;
          10'h2f7: pos_special = 16'h7e00;
          10'h2f8: pos_special = 16'h7e00;
          10'h2f9: pos_special = 16'h7e00;
          10'h2fa: pos_special = 16'h7e00;
          10'h2fb: pos_special = 16'h7e00;
          10'h2fc: pos_special = 16'h7e00;
          10'h2fd: pos_special = 16'h7e00;
          10'h2fe: pos_special = 16'h7e00;
          10'h2ff: pos_special = 16'h7e00;
          10'h300: pos_special = 16'h7e00;
          10'h301: pos_special = 16'h7e00;
          10'h302: pos_special = 16'h7e00;
          10'h303: pos_special = 16'h7e00;
          10'h304: pos_special = 16'h7e00;
          10'h305: pos_special = 16'h7e00;
          10'h306: pos_special = 16'h7e00;
          10'h307: pos_special = 16'h7e00;
          10'h308: pos_special = 16'h7e00;
          10'h309: pos_special = 16'h7e00;
          10'h30a: pos_special = 16'h7e00;
          10'h30b: pos_special = 16'h7e00;
          10'h30c: pos_special = 16'h7e00;
          10'h30d: pos_special = 16'h7e00;
          10'h30e: pos_special = 16'h7e00;
          10'h30f: pos_special = 16'h7e00;
          10'h310: pos_special = 16'h7e00;
          10'h311: pos_special = 16'h7e00;
          10'h312: pos_special = 16'h7e00;
          10'h313: pos_special = 16'h7e00;
          10'h314: pos_special = 16'h7e00;
          10'h315: pos_special = 16'h7e00;
          10'h316: pos_special = 16'h7e00;
          10'h317: pos_special = 16'h7e00;
          10'h318: pos_special = 16'h7e00;
          10'h319: pos_special = 16'h7e00;
          10'h31a: pos_special = 16'h7e00;
          10'h31b: pos_special = 16'h7e00;
          10'h31c: pos_special = 16'h7e00;
          10'h31d: pos_special = 16'h7e00;
          10'h31e: pos_special = 16'h7e00;
          10'h31f: pos_special = 16'h7e00;
          10'h320: pos_special = 16'h7e00;
          10'h321: pos_special = 16'h7e00;
          10'h322: pos_special = 16'h7e00;
          10'h323: pos_special = 16'h7e00;
          10'h324: pos_special = 16'h7e00;
          10'h325: pos_special = 16'h7e00;
          10'h326: pos_special = 16'h7e00;
          10'h327: pos_special = 16'h7e00;
          10'h328: pos_special = 16'h7e00;
          10'h329: pos_special = 16'h7e00;
          10'h32a: pos_special = 16'h7e00;
          10'h32b: pos_special = 16'h7e00;
          10'h32c: pos_special = 16'h7e00;
          10'h32d: pos_special = 16'h7e00;
          10'h32e: pos_special = 16'h7e00;
          10'h32f: pos_special = 16'h7e00;
          10'h330: pos_special = 16'h7e00;
          10'h331: pos_special = 16'h7e00;
          10'h332: pos_special = 16'h7e00;
          10'h333: pos_special = 16'h7e00;
          10'h334: pos_special = 16'h7e00;
          10'h335: pos_special = 16'h7e00;
          10'h336: pos_special = 16'h7e00;
          10'h337: pos_special = 16'h7e00;
          10'h338: pos_special = 16'h7e00;
          10'h339: pos_special = 16'h7e00;
          10'h33a: pos_special = 16'h7e00;
          10'h33b: pos_special = 16'h7e00;
          10'h33c: pos_special = 16'h7e00;
          10'h33d: pos_special = 16'h7e00;
          10'h33e: pos_special = 16'h7e00;
          10'h33f: pos_special = 16'h7e00;
          10'h340: pos_special = 16'h7e00;
          10'h341: pos_special = 16'h7e00;
          10'h342: pos_special = 16'h7e00;
          10'h343: pos_special = 16'h7e00;
          10'h344: pos_special = 16'h7e00;
          10'h345: pos_special = 16'h7e00;
          10'h346: pos_special = 16'h7e00;
          10'h347: pos_special = 16'h7e00;
          10'h348: pos_special = 16'h7e00;
          10'h349: pos_special = 16'h7e00;
          10'h34a: pos_special = 16'h7e00;
          10'h34b: pos_special = 16'h7e00;
          10'h34c: pos_special = 16'h7e00;
          10'h34d: pos_special = 16'h7e00;
          10'h34e: pos_special = 16'h7e00;
          10'h34f: pos_special = 16'h7e00;
          10'h350: pos_special = 16'h7e00;
          10'h351: pos_special = 16'h7e00;
          10'h352: pos_special = 16'h7e00;
          10'h353: pos_special = 16'h7e00;
          10'h354: pos_special = 16'h7e00;
          10'h355: pos_special = 16'h7e00;
          10'h356: pos_special = 16'h7e00;
          10'h357: pos_special = 16'h7e00;
          10'h358: pos_special = 16'h7e00;
          10'h359: pos_special = 16'h7e00;
          10'h35a: pos_special = 16'h7e00;
          10'h35b: pos_special = 16'h7e00;
          10'h35c: pos_special = 16'h7e00;
          10'h35d: pos_special = 16'h7e00;
          10'h35e: pos_special = 16'h7e00;
          10'h35f: pos_special = 16'h7e00;
          10'h360: pos_special = 16'h7e00;
          10'h361: pos_special = 16'h7e00;
          10'h362: pos_special = 16'h7e00;
          10'h363: pos_special = 16'h7e00;
          10'h364: pos_special = 16'h7e00;
          10'h365: pos_special = 16'h7e00;
          10'h366: pos_special = 16'h7e00;
          10'h367: pos_special = 16'h7e00;
          10'h368: pos_special = 16'h7e00;
          10'h369: pos_special = 16'h7e00;
          10'h36a: pos_special = 16'h7e00;
          10'h36b: pos_special = 16'h7e00;
          10'h36c: pos_special = 16'h7e00;
          10'h36d: pos_special = 16'h7e00;
          10'h36e: pos_special = 16'h7e00;
          10'h36f: pos_special = 16'h7e00;
          10'h370: pos_special = 16'h7e00;
          10'h371: pos_special = 16'h7e00;
          10'h372: pos_special = 16'h7e00;
          10'h373: pos_special = 16'h7e00;
          10'h374: pos_special = 16'h7e00;
          10'h375: pos_special = 16'h7e00;
          10'h376: pos_special = 16'h7e00;
          10'h377: pos_special = 16'h7e00;
          10'h378: pos_special = 16'h7e00;
          10'h379: pos_special = 16'h7e00;
          10'h37a: pos_special = 16'h7e00;
          10'h37b: pos_special = 16'h7e00;
          10'h37c: pos_special = 16'h7e00;
          10'h37d: pos_special = 16'h7e00;
          10'h37e: pos_special = 16'h7e00;
          10'h37f: pos_special = 16'h7e00;
          10'h380: pos_special = 16'h7e00;
          10'h381: pos_special = 16'h7e00;
          10'h382: pos_special = 16'h7e00;
          10'h383: pos_special = 16'h7e00;
          10'h384: pos_special = 16'h7e00;
          10'h385: pos_special = 16'h7e00;
          10'h386: pos_special = 16'h7e00;
          10'h387: pos_special = 16'h7e00;
          10'h388: pos_special = 16'h7e00;
          10'h389: pos_special = 16'h7e00;
          10'h38a: pos_special = 16'h7e00;
          10'h38b: pos_special = 16'h7e00;
          10'h38c: pos_special = 16'h7e00;
          10'h38d: pos_special = 16'h7e00;
          10'h38e: pos_special = 16'h7e00;
          10'h38f: pos_special = 16'h7e00;
          10'h390: pos_special = 16'h7e00;
          10'h391: pos_special = 16'h7e00;
          10'h392: pos_special = 16'h7e00;
          10'h393: pos_special = 16'h7e00;
          10'h394: pos_special = 16'h7e00;
          10'h395: pos_special = 16'h7e00;
          10'h396: pos_special = 16'h7e00;
          10'h397: pos_special = 16'h7e00;
          10'h398: pos_special = 16'h7e00;
          10'h399: pos_special = 16'h7e00;
          10'h39a: pos_special = 16'h7e00;
          10'h39b: pos_special = 16'h7e00;
          10'h39c: pos_special = 16'h7e00;
          10'h39d: pos_special = 16'h7e00;
          10'h39e: pos_special = 16'h7e00;
          10'h39f: pos_special = 16'h7e00;
          10'h3a0: pos_special = 16'h7e00;
          10'h3a1: pos_special = 16'h7e00;
          10'h3a2: pos_special = 16'h7e00;
          10'h3a3: pos_special = 16'h7e00;
          10'h3a4: pos_special = 16'h7e00;
          10'h3a5: pos_special = 16'h7e00;
          10'h3a6: pos_special = 16'h7e00;
          10'h3a7: pos_special = 16'h7e00;
          10'h3a8: pos_special = 16'h7e00;
          10'h3a9: pos_special = 16'h7e00;
          10'h3aa: pos_special = 16'h7e00;
          10'h3ab: pos_special = 16'h7e00;
          10'h3ac: pos_special = 16'h7e00;
          10'h3ad: pos_special = 16'h7e00;
          10'h3ae: pos_special = 16'h7e00;
          10'h3af: pos_special = 16'h7e00;
          10'h3b0: pos_special = 16'h7e00;
          10'h3b1: pos_special = 16'h7e00;
          10'h3b2: pos_special = 16'h7e00;
          10'h3b3: pos_special = 16'h7e00;
          10'h3b4: pos_special = 16'h7e00;
          10'h3b5: pos_special = 16'h7e00;
          10'h3b6: pos_special = 16'h7e00;
          10'h3b7: pos_special = 16'h7e00;
          10'h3b8: pos_special = 16'h7e00;
          10'h3b9: pos_special = 16'h7e00;
          10'h3ba: pos_special = 16'h7e00;
          10'h3bb: pos_special = 16'h7e00;
          10'h3bc: pos_special = 16'h7e00;
          10'h3bd: pos_special = 16'h7e00;
          10'h3be: pos_special = 16'h7e00;
          10'h3bf: pos_special = 16'h7e00;
          10'h3c0: pos_special = 16'h7e00;
          10'h3c1: pos_special = 16'h7e00;
          10'h3c2: pos_special = 16'h7e00;
          10'h3c3: pos_special = 16'h7e00;
          10'h3c4: pos_special = 16'h7e00;
          10'h3c5: pos_special = 16'h7e00;
          10'h3c6: pos_special = 16'h7e00;
          10'h3c7: pos_special = 16'h7e00;
          10'h3c8: pos_special = 16'h7e00;
          10'h3c9: pos_special = 16'h7e00;
          10'h3ca: pos_special = 16'h7e00;
          10'h3cb: pos_special = 16'h7e00;
          10'h3cc: pos_special = 16'h7e00;
          10'h3cd: pos_special = 16'h7e00;
          10'h3ce: pos_special = 16'h7e00;
          10'h3cf: pos_special = 16'h7e00;
          10'h3d0: pos_special = 16'h7e00;
          10'h3d1: pos_special = 16'h7e00;
          10'h3d2: pos_special = 16'h7e00;
          10'h3d3: pos_special = 16'h7e00;
          10'h3d4: pos_special = 16'h7e00;
          10'h3d5: pos_special = 16'h7e00;
          10'h3d6: pos_special = 16'h7e00;
          10'h3d7: pos_special = 16'h7e00;
          10'h3d8: pos_special = 16'h7e00;
          10'h3d9: pos_special = 16'h7e00;
          10'h3da: pos_special = 16'h7e00;
          10'h3db: pos_special = 16'h7e00;
          10'h3dc: pos_special = 16'h7e00;
          10'h3dd: pos_special = 16'h7e00;
          10'h3de: pos_special = 16'h7e00;
          10'h3df: pos_special = 16'h7e00;
          10'h3e0: pos_special = 16'h7e00;
          10'h3e1: pos_special = 16'h7e00;
          10'h3e2: pos_special = 16'h7e00;
          10'h3e3: pos_special = 16'h7e00;
          10'h3e4: pos_special = 16'h7e00;
          10'h3e5: pos_special = 16'h7e00;
          10'h3e6: pos_special = 16'h7e00;
          10'h3e7: pos_special = 16'h7e00;
          10'h3e8: pos_special = 16'h7e00;
          10'h3e9: pos_special = 16'h7e00;
          10'h3ea: pos_special = 16'h7e00;
          10'h3eb: pos_special = 16'h7e00;
          10'h3ec: pos_special = 16'h7e00;
          10'h3ed: pos_special = 16'h7e00;
          10'h3ee: pos_special = 16'h7e00;
          10'h3ef: pos_special = 16'h7e00;
          10'h3f0: pos_special = 16'h7e00;
          10'h3f1: pos_special = 16'h7e00;
          10'h3f2: pos_special = 16'h7e00;
          10'h3f3: pos_special = 16'h7e00;
          10'h3f4: pos_special = 16'h7e00;
          10'h3f5: pos_special = 16'h7e00;
          10'h3f6: pos_special = 16'h7e00;
          10'h3f7: pos_special = 16'h7e00;
          10'h3f8: pos_special = 16'h7e00;
          10'h3f9: pos_special = 16'h7e00;
          10'h3fa: pos_special = 16'h7e00;
          10'h3fb: pos_special = 16'h7e00;
          10'h3fc: pos_special = 16'h7e00;
          10'h3fd: pos_special = 16'h7e00;
          10'h3fe: pos_special = 16'h7e00;
          10'h3ff: pos_special = 16'h7e00;
          default: pos_special = 16'h0000;
        endcase
      end
      default: begin end
    endcase
  end
  reg active_exp;
  always @* begin
    active_exp = 1'b0;
    case (exp)
      5'h01: active_exp = 1'b1;
      5'h02: active_exp = 1'b1;
      5'h03: active_exp = 1'b1;
      5'h04: active_exp = 1'b1;
      5'h05: active_exp = 1'b1;
      5'h06: active_exp = 1'b1;
      5'h07: active_exp = 1'b1;
      5'h08: active_exp = 1'b1;
      5'h09: active_exp = 1'b1;
      5'h0a: active_exp = 1'b1;
      5'h0b: active_exp = 1'b1;
      5'h0c: active_exp = 1'b1;
      5'h0d: active_exp = 1'b1;
      5'h0e: active_exp = 1'b1;
      5'h0f: active_exp = 1'b1;
      5'h10: active_exp = 1'b1;
      5'h11: active_exp = 1'b1;
      default: begin end
    endcase
  end
  reg [15:0] pos_normal;
  always @* begin
    pos_normal = 16'h0000;
    case (exp)
      5'h01: begin
        case (mant[9:5])
          5'h00: begin
            pos_normal = 16'h0400;
            case (mant[4:0])
              5'h01: pos_normal = 16'h0401;
              5'h02: pos_normal = 16'h0402;
              5'h03: pos_normal = 16'h0403;
              5'h04: pos_normal = 16'h0404;
              5'h05: pos_normal = 16'h0405;
              5'h06: pos_normal = 16'h0406;
              5'h07: pos_normal = 16'h0407;
              5'h08: pos_normal = 16'h0408;
              5'h09: pos_normal = 16'h0409;
              5'h0a: pos_normal = 16'h040a;
              5'h0b: pos_normal = 16'h040b;
              5'h0c: pos_normal = 16'h040c;
              5'h0d: pos_normal = 16'h040d;
              5'h0e: pos_normal = 16'h040e;
              5'h0f: pos_normal = 16'h040f;
              5'h10: pos_normal = 16'h0410;
              5'h11: pos_normal = 16'h0411;
              5'h12: pos_normal = 16'h0412;
              5'h13: pos_normal = 16'h0413;
              5'h14: pos_normal = 16'h0414;
              5'h15: pos_normal = 16'h0415;
              5'h16: pos_normal = 16'h0416;
              5'h17: pos_normal = 16'h0417;
              5'h18: pos_normal = 16'h0418;
              5'h19: pos_normal = 16'h0419;
              5'h1a: pos_normal = 16'h041a;
              5'h1b: pos_normal = 16'h041b;
              5'h1c: pos_normal = 16'h041c;
              5'h1d: pos_normal = 16'h041d;
              5'h1e: pos_normal = 16'h041e;
              5'h1f: pos_normal = 16'h041f;
              default: begin end
            endcase
          end
          5'h01: begin
            pos_normal = 16'h0420;
            case (mant[4:0])
              5'h01: pos_normal = 16'h0421;
              5'h02: pos_normal = 16'h0422;
              5'h03: pos_normal = 16'h0423;
              5'h04: pos_normal = 16'h0424;
              5'h05: pos_normal = 16'h0425;
              5'h06: pos_normal = 16'h0426;
              5'h07: pos_normal = 16'h0427;
              5'h08: pos_normal = 16'h0428;
              5'h09: pos_normal = 16'h0429;
              5'h0a: pos_normal = 16'h042a;
              5'h0b: pos_normal = 16'h042b;
              5'h0c: pos_normal = 16'h042c;
              5'h0d: pos_normal = 16'h042d;
              5'h0e: pos_normal = 16'h042e;
              5'h0f: pos_normal = 16'h042f;
              5'h10: pos_normal = 16'h0430;
              5'h11: pos_normal = 16'h0431;
              5'h12: pos_normal = 16'h0432;
              5'h13: pos_normal = 16'h0433;
              5'h14: pos_normal = 16'h0434;
              5'h15: pos_normal = 16'h0435;
              5'h16: pos_normal = 16'h0436;
              5'h17: pos_normal = 16'h0437;
              5'h18: pos_normal = 16'h0438;
              5'h19: pos_normal = 16'h0439;
              5'h1a: pos_normal = 16'h043a;
              5'h1b: pos_normal = 16'h043b;
              5'h1c: pos_normal = 16'h043c;
              5'h1d: pos_normal = 16'h043d;
              5'h1e: pos_normal = 16'h043e;
              5'h1f: pos_normal = 16'h043f;
              default: begin end
            endcase
          end
          5'h02: begin
            pos_normal = 16'h0440;
            case (mant[4:0])
              5'h01: pos_normal = 16'h0441;
              5'h02: pos_normal = 16'h0442;
              5'h03: pos_normal = 16'h0443;
              5'h04: pos_normal = 16'h0444;
              5'h05: pos_normal = 16'h0445;
              5'h06: pos_normal = 16'h0446;
              5'h07: pos_normal = 16'h0447;
              5'h08: pos_normal = 16'h0448;
              5'h09: pos_normal = 16'h0449;
              5'h0a: pos_normal = 16'h044a;
              5'h0b: pos_normal = 16'h044b;
              5'h0c: pos_normal = 16'h044c;
              5'h0d: pos_normal = 16'h044d;
              5'h0e: pos_normal = 16'h044e;
              5'h0f: pos_normal = 16'h044f;
              5'h10: pos_normal = 16'h0450;
              5'h11: pos_normal = 16'h0451;
              5'h12: pos_normal = 16'h0452;
              5'h13: pos_normal = 16'h0453;
              5'h14: pos_normal = 16'h0454;
              5'h15: pos_normal = 16'h0455;
              5'h16: pos_normal = 16'h0456;
              5'h17: pos_normal = 16'h0457;
              5'h18: pos_normal = 16'h0458;
              5'h19: pos_normal = 16'h0459;
              5'h1a: pos_normal = 16'h045a;
              5'h1b: pos_normal = 16'h045b;
              5'h1c: pos_normal = 16'h045c;
              5'h1d: pos_normal = 16'h045d;
              5'h1e: pos_normal = 16'h045e;
              5'h1f: pos_normal = 16'h045f;
              default: begin end
            endcase
          end
          5'h03: begin
            pos_normal = 16'h0460;
            case (mant[4:0])
              5'h01: pos_normal = 16'h0461;
              5'h02: pos_normal = 16'h0462;
              5'h03: pos_normal = 16'h0463;
              5'h04: pos_normal = 16'h0464;
              5'h05: pos_normal = 16'h0465;
              5'h06: pos_normal = 16'h0466;
              5'h07: pos_normal = 16'h0467;
              5'h08: pos_normal = 16'h0468;
              5'h09: pos_normal = 16'h0469;
              5'h0a: pos_normal = 16'h046a;
              5'h0b: pos_normal = 16'h046b;
              5'h0c: pos_normal = 16'h046c;
              5'h0d: pos_normal = 16'h046d;
              5'h0e: pos_normal = 16'h046e;
              5'h0f: pos_normal = 16'h046f;
              5'h10: pos_normal = 16'h0470;
              5'h11: pos_normal = 16'h0471;
              5'h12: pos_normal = 16'h0472;
              5'h13: pos_normal = 16'h0473;
              5'h14: pos_normal = 16'h0474;
              5'h15: pos_normal = 16'h0475;
              5'h16: pos_normal = 16'h0476;
              5'h17: pos_normal = 16'h0477;
              5'h18: pos_normal = 16'h0478;
              5'h19: pos_normal = 16'h0479;
              5'h1a: pos_normal = 16'h047a;
              5'h1b: pos_normal = 16'h047b;
              5'h1c: pos_normal = 16'h047c;
              5'h1d: pos_normal = 16'h047d;
              5'h1e: pos_normal = 16'h047e;
              5'h1f: pos_normal = 16'h047f;
              default: begin end
            endcase
          end
          5'h04: begin
            pos_normal = 16'h0480;
            case (mant[4:0])
              5'h01: pos_normal = 16'h0481;
              5'h02: pos_normal = 16'h0482;
              5'h03: pos_normal = 16'h0483;
              5'h04: pos_normal = 16'h0484;
              5'h05: pos_normal = 16'h0485;
              5'h06: pos_normal = 16'h0486;
              5'h07: pos_normal = 16'h0487;
              5'h08: pos_normal = 16'h0488;
              5'h09: pos_normal = 16'h0489;
              5'h0a: pos_normal = 16'h048a;
              5'h0b: pos_normal = 16'h048b;
              5'h0c: pos_normal = 16'h048c;
              5'h0d: pos_normal = 16'h048d;
              5'h0e: pos_normal = 16'h048e;
              5'h0f: pos_normal = 16'h048f;
              5'h10: pos_normal = 16'h0490;
              5'h11: pos_normal = 16'h0491;
              5'h12: pos_normal = 16'h0492;
              5'h13: pos_normal = 16'h0493;
              5'h14: pos_normal = 16'h0494;
              5'h15: pos_normal = 16'h0495;
              5'h16: pos_normal = 16'h0496;
              5'h17: pos_normal = 16'h0497;
              5'h18: pos_normal = 16'h0498;
              5'h19: pos_normal = 16'h0499;
              5'h1a: pos_normal = 16'h049a;
              5'h1b: pos_normal = 16'h049b;
              5'h1c: pos_normal = 16'h049c;
              5'h1d: pos_normal = 16'h049d;
              5'h1e: pos_normal = 16'h049e;
              5'h1f: pos_normal = 16'h049f;
              default: begin end
            endcase
          end
          5'h05: begin
            pos_normal = 16'h04a0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h04a1;
              5'h02: pos_normal = 16'h04a2;
              5'h03: pos_normal = 16'h04a3;
              5'h04: pos_normal = 16'h04a4;
              5'h05: pos_normal = 16'h04a5;
              5'h06: pos_normal = 16'h04a6;
              5'h07: pos_normal = 16'h04a7;
              5'h08: pos_normal = 16'h04a8;
              5'h09: pos_normal = 16'h04a9;
              5'h0a: pos_normal = 16'h04aa;
              5'h0b: pos_normal = 16'h04ab;
              5'h0c: pos_normal = 16'h04ac;
              5'h0d: pos_normal = 16'h04ad;
              5'h0e: pos_normal = 16'h04ae;
              5'h0f: pos_normal = 16'h04af;
              5'h10: pos_normal = 16'h04b0;
              5'h11: pos_normal = 16'h04b1;
              5'h12: pos_normal = 16'h04b2;
              5'h13: pos_normal = 16'h04b3;
              5'h14: pos_normal = 16'h04b4;
              5'h15: pos_normal = 16'h04b5;
              5'h16: pos_normal = 16'h04b6;
              5'h17: pos_normal = 16'h04b7;
              5'h18: pos_normal = 16'h04b8;
              5'h19: pos_normal = 16'h04b9;
              5'h1a: pos_normal = 16'h04ba;
              5'h1b: pos_normal = 16'h04bb;
              5'h1c: pos_normal = 16'h04bc;
              5'h1d: pos_normal = 16'h04bd;
              5'h1e: pos_normal = 16'h04be;
              5'h1f: pos_normal = 16'h04bf;
              default: begin end
            endcase
          end
          5'h06: begin
            pos_normal = 16'h04c0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h04c1;
              5'h02: pos_normal = 16'h04c2;
              5'h03: pos_normal = 16'h04c3;
              5'h04: pos_normal = 16'h04c4;
              5'h05: pos_normal = 16'h04c5;
              5'h06: pos_normal = 16'h04c6;
              5'h07: pos_normal = 16'h04c7;
              5'h08: pos_normal = 16'h04c8;
              5'h09: pos_normal = 16'h04c9;
              5'h0a: pos_normal = 16'h04ca;
              5'h0b: pos_normal = 16'h04cb;
              5'h0c: pos_normal = 16'h04cc;
              5'h0d: pos_normal = 16'h04cd;
              5'h0e: pos_normal = 16'h04ce;
              5'h0f: pos_normal = 16'h04cf;
              5'h10: pos_normal = 16'h04d0;
              5'h11: pos_normal = 16'h04d1;
              5'h12: pos_normal = 16'h04d2;
              5'h13: pos_normal = 16'h04d3;
              5'h14: pos_normal = 16'h04d4;
              5'h15: pos_normal = 16'h04d5;
              5'h16: pos_normal = 16'h04d6;
              5'h17: pos_normal = 16'h04d7;
              5'h18: pos_normal = 16'h04d8;
              5'h19: pos_normal = 16'h04d9;
              5'h1a: pos_normal = 16'h04da;
              5'h1b: pos_normal = 16'h04db;
              5'h1c: pos_normal = 16'h04dc;
              5'h1d: pos_normal = 16'h04dd;
              5'h1e: pos_normal = 16'h04de;
              5'h1f: pos_normal = 16'h04df;
              default: begin end
            endcase
          end
          5'h07: begin
            pos_normal = 16'h04e0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h04e1;
              5'h02: pos_normal = 16'h04e2;
              5'h03: pos_normal = 16'h04e3;
              5'h04: pos_normal = 16'h04e4;
              5'h05: pos_normal = 16'h04e5;
              5'h06: pos_normal = 16'h04e6;
              5'h07: pos_normal = 16'h04e7;
              5'h08: pos_normal = 16'h04e8;
              5'h09: pos_normal = 16'h04e9;
              5'h0a: pos_normal = 16'h04ea;
              5'h0b: pos_normal = 16'h04eb;
              5'h0c: pos_normal = 16'h04ec;
              5'h0d: pos_normal = 16'h04ed;
              5'h0e: pos_normal = 16'h04ee;
              5'h0f: pos_normal = 16'h04ef;
              5'h10: pos_normal = 16'h04f0;
              5'h11: pos_normal = 16'h04f1;
              5'h12: pos_normal = 16'h04f2;
              5'h13: pos_normal = 16'h04f3;
              5'h14: pos_normal = 16'h04f4;
              5'h15: pos_normal = 16'h04f5;
              5'h16: pos_normal = 16'h04f6;
              5'h17: pos_normal = 16'h04f7;
              5'h18: pos_normal = 16'h04f8;
              5'h19: pos_normal = 16'h04f9;
              5'h1a: pos_normal = 16'h04fa;
              5'h1b: pos_normal = 16'h04fb;
              5'h1c: pos_normal = 16'h04fc;
              5'h1d: pos_normal = 16'h04fd;
              5'h1e: pos_normal = 16'h04fe;
              5'h1f: pos_normal = 16'h04ff;
              default: begin end
            endcase
          end
          5'h08: begin
            pos_normal = 16'h0500;
            case (mant[4:0])
              5'h01: pos_normal = 16'h0501;
              5'h02: pos_normal = 16'h0502;
              5'h03: pos_normal = 16'h0503;
              5'h04: pos_normal = 16'h0504;
              5'h05: pos_normal = 16'h0505;
              5'h06: pos_normal = 16'h0506;
              5'h07: pos_normal = 16'h0507;
              5'h08: pos_normal = 16'h0508;
              5'h09: pos_normal = 16'h0509;
              5'h0a: pos_normal = 16'h050a;
              5'h0b: pos_normal = 16'h050b;
              5'h0c: pos_normal = 16'h050c;
              5'h0d: pos_normal = 16'h050d;
              5'h0e: pos_normal = 16'h050e;
              5'h0f: pos_normal = 16'h050f;
              5'h10: pos_normal = 16'h0510;
              5'h11: pos_normal = 16'h0511;
              5'h12: pos_normal = 16'h0512;
              5'h13: pos_normal = 16'h0513;
              5'h14: pos_normal = 16'h0514;
              5'h15: pos_normal = 16'h0515;
              5'h16: pos_normal = 16'h0516;
              5'h17: pos_normal = 16'h0517;
              5'h18: pos_normal = 16'h0518;
              5'h19: pos_normal = 16'h0519;
              5'h1a: pos_normal = 16'h051a;
              5'h1b: pos_normal = 16'h051b;
              5'h1c: pos_normal = 16'h051c;
              5'h1d: pos_normal = 16'h051d;
              5'h1e: pos_normal = 16'h051e;
              5'h1f: pos_normal = 16'h051f;
              default: begin end
            endcase
          end
          5'h09: begin
            pos_normal = 16'h0520;
            case (mant[4:0])
              5'h01: pos_normal = 16'h0521;
              5'h02: pos_normal = 16'h0522;
              5'h03: pos_normal = 16'h0523;
              5'h04: pos_normal = 16'h0524;
              5'h05: pos_normal = 16'h0525;
              5'h06: pos_normal = 16'h0526;
              5'h07: pos_normal = 16'h0527;
              5'h08: pos_normal = 16'h0528;
              5'h09: pos_normal = 16'h0529;
              5'h0a: pos_normal = 16'h052a;
              5'h0b: pos_normal = 16'h052b;
              5'h0c: pos_normal = 16'h052c;
              5'h0d: pos_normal = 16'h052d;
              5'h0e: pos_normal = 16'h052e;
              5'h0f: pos_normal = 16'h052f;
              5'h10: pos_normal = 16'h0530;
              5'h11: pos_normal = 16'h0531;
              5'h12: pos_normal = 16'h0532;
              5'h13: pos_normal = 16'h0533;
              5'h14: pos_normal = 16'h0534;
              5'h15: pos_normal = 16'h0535;
              5'h16: pos_normal = 16'h0536;
              5'h17: pos_normal = 16'h0537;
              5'h18: pos_normal = 16'h0538;
              5'h19: pos_normal = 16'h0539;
              5'h1a: pos_normal = 16'h053a;
              5'h1b: pos_normal = 16'h053b;
              5'h1c: pos_normal = 16'h053c;
              5'h1d: pos_normal = 16'h053d;
              5'h1e: pos_normal = 16'h053e;
              5'h1f: pos_normal = 16'h053f;
              default: begin end
            endcase
          end
          5'h0a: begin
            pos_normal = 16'h0540;
            case (mant[4:0])
              5'h01: pos_normal = 16'h0541;
              5'h02: pos_normal = 16'h0542;
              5'h03: pos_normal = 16'h0543;
              5'h04: pos_normal = 16'h0544;
              5'h05: pos_normal = 16'h0545;
              5'h06: pos_normal = 16'h0546;
              5'h07: pos_normal = 16'h0547;
              5'h08: pos_normal = 16'h0548;
              5'h09: pos_normal = 16'h0549;
              5'h0a: pos_normal = 16'h054a;
              5'h0b: pos_normal = 16'h054b;
              5'h0c: pos_normal = 16'h054c;
              5'h0d: pos_normal = 16'h054d;
              5'h0e: pos_normal = 16'h054e;
              5'h0f: pos_normal = 16'h054f;
              5'h10: pos_normal = 16'h0550;
              5'h11: pos_normal = 16'h0551;
              5'h12: pos_normal = 16'h0552;
              5'h13: pos_normal = 16'h0553;
              5'h14: pos_normal = 16'h0554;
              5'h15: pos_normal = 16'h0555;
              5'h16: pos_normal = 16'h0556;
              5'h17: pos_normal = 16'h0557;
              5'h18: pos_normal = 16'h0558;
              5'h19: pos_normal = 16'h0559;
              5'h1a: pos_normal = 16'h055a;
              5'h1b: pos_normal = 16'h055b;
              5'h1c: pos_normal = 16'h055c;
              5'h1d: pos_normal = 16'h055d;
              5'h1e: pos_normal = 16'h055e;
              5'h1f: pos_normal = 16'h055f;
              default: begin end
            endcase
          end
          5'h0b: begin
            pos_normal = 16'h0560;
            case (mant[4:0])
              5'h01: pos_normal = 16'h0561;
              5'h02: pos_normal = 16'h0562;
              5'h03: pos_normal = 16'h0563;
              5'h04: pos_normal = 16'h0564;
              5'h05: pos_normal = 16'h0565;
              5'h06: pos_normal = 16'h0566;
              5'h07: pos_normal = 16'h0567;
              5'h08: pos_normal = 16'h0568;
              5'h09: pos_normal = 16'h0569;
              5'h0a: pos_normal = 16'h056a;
              5'h0b: pos_normal = 16'h056b;
              5'h0c: pos_normal = 16'h056c;
              5'h0d: pos_normal = 16'h056d;
              5'h0e: pos_normal = 16'h056e;
              5'h0f: pos_normal = 16'h056f;
              5'h10: pos_normal = 16'h0570;
              5'h11: pos_normal = 16'h0571;
              5'h12: pos_normal = 16'h0572;
              5'h13: pos_normal = 16'h0573;
              5'h14: pos_normal = 16'h0574;
              5'h15: pos_normal = 16'h0575;
              5'h16: pos_normal = 16'h0576;
              5'h17: pos_normal = 16'h0577;
              5'h18: pos_normal = 16'h0578;
              5'h19: pos_normal = 16'h0579;
              5'h1a: pos_normal = 16'h057a;
              5'h1b: pos_normal = 16'h057b;
              5'h1c: pos_normal = 16'h057c;
              5'h1d: pos_normal = 16'h057d;
              5'h1e: pos_normal = 16'h057e;
              5'h1f: pos_normal = 16'h057f;
              default: begin end
            endcase
          end
          5'h0c: begin
            pos_normal = 16'h0580;
            case (mant[4:0])
              5'h01: pos_normal = 16'h0581;
              5'h02: pos_normal = 16'h0582;
              5'h03: pos_normal = 16'h0583;
              5'h04: pos_normal = 16'h0584;
              5'h05: pos_normal = 16'h0585;
              5'h06: pos_normal = 16'h0586;
              5'h07: pos_normal = 16'h0587;
              5'h08: pos_normal = 16'h0588;
              5'h09: pos_normal = 16'h0589;
              5'h0a: pos_normal = 16'h058a;
              5'h0b: pos_normal = 16'h058b;
              5'h0c: pos_normal = 16'h058c;
              5'h0d: pos_normal = 16'h058d;
              5'h0e: pos_normal = 16'h058e;
              5'h0f: pos_normal = 16'h058f;
              5'h10: pos_normal = 16'h0590;
              5'h11: pos_normal = 16'h0591;
              5'h12: pos_normal = 16'h0592;
              5'h13: pos_normal = 16'h0593;
              5'h14: pos_normal = 16'h0594;
              5'h15: pos_normal = 16'h0595;
              5'h16: pos_normal = 16'h0596;
              5'h17: pos_normal = 16'h0597;
              5'h18: pos_normal = 16'h0598;
              5'h19: pos_normal = 16'h0599;
              5'h1a: pos_normal = 16'h059a;
              5'h1b: pos_normal = 16'h059b;
              5'h1c: pos_normal = 16'h059c;
              5'h1d: pos_normal = 16'h059d;
              5'h1e: pos_normal = 16'h059e;
              5'h1f: pos_normal = 16'h059f;
              default: begin end
            endcase
          end
          5'h0d: begin
            pos_normal = 16'h05a0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h05a1;
              5'h02: pos_normal = 16'h05a2;
              5'h03: pos_normal = 16'h05a3;
              5'h04: pos_normal = 16'h05a4;
              5'h05: pos_normal = 16'h05a5;
              5'h06: pos_normal = 16'h05a6;
              5'h07: pos_normal = 16'h05a7;
              5'h08: pos_normal = 16'h05a8;
              5'h09: pos_normal = 16'h05a9;
              5'h0a: pos_normal = 16'h05aa;
              5'h0b: pos_normal = 16'h05ab;
              5'h0c: pos_normal = 16'h05ac;
              5'h0d: pos_normal = 16'h05ad;
              5'h0e: pos_normal = 16'h05ae;
              5'h0f: pos_normal = 16'h05af;
              5'h10: pos_normal = 16'h05b0;
              5'h11: pos_normal = 16'h05b1;
              5'h12: pos_normal = 16'h05b2;
              5'h13: pos_normal = 16'h05b3;
              5'h14: pos_normal = 16'h05b4;
              5'h15: pos_normal = 16'h05b5;
              5'h16: pos_normal = 16'h05b6;
              5'h17: pos_normal = 16'h05b7;
              5'h18: pos_normal = 16'h05b8;
              5'h19: pos_normal = 16'h05b9;
              5'h1a: pos_normal = 16'h05ba;
              5'h1b: pos_normal = 16'h05bb;
              5'h1c: pos_normal = 16'h05bc;
              5'h1d: pos_normal = 16'h05bd;
              5'h1e: pos_normal = 16'h05be;
              5'h1f: pos_normal = 16'h05bf;
              default: begin end
            endcase
          end
          5'h0e: begin
            pos_normal = 16'h05c0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h05c1;
              5'h02: pos_normal = 16'h05c2;
              5'h03: pos_normal = 16'h05c3;
              5'h04: pos_normal = 16'h05c4;
              5'h05: pos_normal = 16'h05c5;
              5'h06: pos_normal = 16'h05c6;
              5'h07: pos_normal = 16'h05c7;
              5'h08: pos_normal = 16'h05c8;
              5'h09: pos_normal = 16'h05c9;
              5'h0a: pos_normal = 16'h05ca;
              5'h0b: pos_normal = 16'h05cb;
              5'h0c: pos_normal = 16'h05cc;
              5'h0d: pos_normal = 16'h05cd;
              5'h0e: pos_normal = 16'h05ce;
              5'h0f: pos_normal = 16'h05cf;
              5'h10: pos_normal = 16'h05d0;
              5'h11: pos_normal = 16'h05d1;
              5'h12: pos_normal = 16'h05d2;
              5'h13: pos_normal = 16'h05d3;
              5'h14: pos_normal = 16'h05d4;
              5'h15: pos_normal = 16'h05d5;
              5'h16: pos_normal = 16'h05d6;
              5'h17: pos_normal = 16'h05d7;
              5'h18: pos_normal = 16'h05d8;
              5'h19: pos_normal = 16'h05d9;
              5'h1a: pos_normal = 16'h05da;
              5'h1b: pos_normal = 16'h05db;
              5'h1c: pos_normal = 16'h05dc;
              5'h1d: pos_normal = 16'h05dd;
              5'h1e: pos_normal = 16'h05de;
              5'h1f: pos_normal = 16'h05df;
              default: begin end
            endcase
          end
          5'h0f: begin
            pos_normal = 16'h05e0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h05e1;
              5'h02: pos_normal = 16'h05e2;
              5'h03: pos_normal = 16'h05e3;
              5'h04: pos_normal = 16'h05e4;
              5'h05: pos_normal = 16'h05e5;
              5'h06: pos_normal = 16'h05e6;
              5'h07: pos_normal = 16'h05e7;
              5'h08: pos_normal = 16'h05e8;
              5'h09: pos_normal = 16'h05e9;
              5'h0a: pos_normal = 16'h05ea;
              5'h0b: pos_normal = 16'h05eb;
              5'h0c: pos_normal = 16'h05ec;
              5'h0d: pos_normal = 16'h05ed;
              5'h0e: pos_normal = 16'h05ee;
              5'h0f: pos_normal = 16'h05ef;
              5'h10: pos_normal = 16'h05f0;
              5'h11: pos_normal = 16'h05f1;
              5'h12: pos_normal = 16'h05f2;
              5'h13: pos_normal = 16'h05f3;
              5'h14: pos_normal = 16'h05f4;
              5'h15: pos_normal = 16'h05f5;
              5'h16: pos_normal = 16'h05f6;
              5'h17: pos_normal = 16'h05f7;
              5'h18: pos_normal = 16'h05f8;
              5'h19: pos_normal = 16'h05f9;
              5'h1a: pos_normal = 16'h05fa;
              5'h1b: pos_normal = 16'h05fb;
              5'h1c: pos_normal = 16'h05fc;
              5'h1d: pos_normal = 16'h05fd;
              5'h1e: pos_normal = 16'h05fe;
              5'h1f: pos_normal = 16'h05ff;
              default: begin end
            endcase
          end
          5'h10: begin
            pos_normal = 16'h0600;
            case (mant[4:0])
              5'h01: pos_normal = 16'h0601;
              5'h02: pos_normal = 16'h0602;
              5'h03: pos_normal = 16'h0603;
              5'h04: pos_normal = 16'h0604;
              5'h05: pos_normal = 16'h0605;
              5'h06: pos_normal = 16'h0606;
              5'h07: pos_normal = 16'h0607;
              5'h08: pos_normal = 16'h0608;
              5'h09: pos_normal = 16'h0609;
              5'h0a: pos_normal = 16'h060a;
              5'h0b: pos_normal = 16'h060b;
              5'h0c: pos_normal = 16'h060c;
              5'h0d: pos_normal = 16'h060d;
              5'h0e: pos_normal = 16'h060e;
              5'h0f: pos_normal = 16'h060f;
              5'h10: pos_normal = 16'h0610;
              5'h11: pos_normal = 16'h0611;
              5'h12: pos_normal = 16'h0612;
              5'h13: pos_normal = 16'h0613;
              5'h14: pos_normal = 16'h0614;
              5'h15: pos_normal = 16'h0615;
              5'h16: pos_normal = 16'h0616;
              5'h17: pos_normal = 16'h0617;
              5'h18: pos_normal = 16'h0618;
              5'h19: pos_normal = 16'h0619;
              5'h1a: pos_normal = 16'h061a;
              5'h1b: pos_normal = 16'h061b;
              5'h1c: pos_normal = 16'h061c;
              5'h1d: pos_normal = 16'h061d;
              5'h1e: pos_normal = 16'h061e;
              5'h1f: pos_normal = 16'h061f;
              default: begin end
            endcase
          end
          5'h11: begin
            pos_normal = 16'h0620;
            case (mant[4:0])
              5'h01: pos_normal = 16'h0621;
              5'h02: pos_normal = 16'h0622;
              5'h03: pos_normal = 16'h0623;
              5'h04: pos_normal = 16'h0624;
              5'h05: pos_normal = 16'h0625;
              5'h06: pos_normal = 16'h0626;
              5'h07: pos_normal = 16'h0627;
              5'h08: pos_normal = 16'h0628;
              5'h09: pos_normal = 16'h0629;
              5'h0a: pos_normal = 16'h062a;
              5'h0b: pos_normal = 16'h062b;
              5'h0c: pos_normal = 16'h062c;
              5'h0d: pos_normal = 16'h062d;
              5'h0e: pos_normal = 16'h062e;
              5'h0f: pos_normal = 16'h062f;
              5'h10: pos_normal = 16'h0630;
              5'h11: pos_normal = 16'h0631;
              5'h12: pos_normal = 16'h0632;
              5'h13: pos_normal = 16'h0633;
              5'h14: pos_normal = 16'h0634;
              5'h15: pos_normal = 16'h0635;
              5'h16: pos_normal = 16'h0636;
              5'h17: pos_normal = 16'h0637;
              5'h18: pos_normal = 16'h0638;
              5'h19: pos_normal = 16'h0639;
              5'h1a: pos_normal = 16'h063a;
              5'h1b: pos_normal = 16'h063b;
              5'h1c: pos_normal = 16'h063c;
              5'h1d: pos_normal = 16'h063d;
              5'h1e: pos_normal = 16'h063e;
              5'h1f: pos_normal = 16'h063f;
              default: begin end
            endcase
          end
          5'h12: begin
            pos_normal = 16'h0640;
            case (mant[4:0])
              5'h01: pos_normal = 16'h0641;
              5'h02: pos_normal = 16'h0642;
              5'h03: pos_normal = 16'h0643;
              5'h04: pos_normal = 16'h0644;
              5'h05: pos_normal = 16'h0645;
              5'h06: pos_normal = 16'h0646;
              5'h07: pos_normal = 16'h0647;
              5'h08: pos_normal = 16'h0648;
              5'h09: pos_normal = 16'h0649;
              5'h0a: pos_normal = 16'h064a;
              5'h0b: pos_normal = 16'h064b;
              5'h0c: pos_normal = 16'h064c;
              5'h0d: pos_normal = 16'h064d;
              5'h0e: pos_normal = 16'h064e;
              5'h0f: pos_normal = 16'h064f;
              5'h10: pos_normal = 16'h0650;
              5'h11: pos_normal = 16'h0651;
              5'h12: pos_normal = 16'h0652;
              5'h13: pos_normal = 16'h0653;
              5'h14: pos_normal = 16'h0654;
              5'h15: pos_normal = 16'h0655;
              5'h16: pos_normal = 16'h0656;
              5'h17: pos_normal = 16'h0657;
              5'h18: pos_normal = 16'h0658;
              5'h19: pos_normal = 16'h0659;
              5'h1a: pos_normal = 16'h065a;
              5'h1b: pos_normal = 16'h065b;
              5'h1c: pos_normal = 16'h065c;
              5'h1d: pos_normal = 16'h065d;
              5'h1e: pos_normal = 16'h065e;
              5'h1f: pos_normal = 16'h065f;
              default: begin end
            endcase
          end
          5'h13: begin
            pos_normal = 16'h0660;
            case (mant[4:0])
              5'h01: pos_normal = 16'h0661;
              5'h02: pos_normal = 16'h0662;
              5'h03: pos_normal = 16'h0663;
              5'h04: pos_normal = 16'h0664;
              5'h05: pos_normal = 16'h0665;
              5'h06: pos_normal = 16'h0666;
              5'h07: pos_normal = 16'h0667;
              5'h08: pos_normal = 16'h0668;
              5'h09: pos_normal = 16'h0669;
              5'h0a: pos_normal = 16'h066a;
              5'h0b: pos_normal = 16'h066b;
              5'h0c: pos_normal = 16'h066c;
              5'h0d: pos_normal = 16'h066d;
              5'h0e: pos_normal = 16'h066e;
              5'h0f: pos_normal = 16'h066f;
              5'h10: pos_normal = 16'h0670;
              5'h11: pos_normal = 16'h0671;
              5'h12: pos_normal = 16'h0672;
              5'h13: pos_normal = 16'h0673;
              5'h14: pos_normal = 16'h0674;
              5'h15: pos_normal = 16'h0675;
              5'h16: pos_normal = 16'h0676;
              5'h17: pos_normal = 16'h0677;
              5'h18: pos_normal = 16'h0678;
              5'h19: pos_normal = 16'h0679;
              5'h1a: pos_normal = 16'h067a;
              5'h1b: pos_normal = 16'h067b;
              5'h1c: pos_normal = 16'h067c;
              5'h1d: pos_normal = 16'h067d;
              5'h1e: pos_normal = 16'h067e;
              5'h1f: pos_normal = 16'h067f;
              default: begin end
            endcase
          end
          5'h14: begin
            pos_normal = 16'h0680;
            case (mant[4:0])
              5'h01: pos_normal = 16'h0681;
              5'h02: pos_normal = 16'h0682;
              5'h03: pos_normal = 16'h0683;
              5'h04: pos_normal = 16'h0684;
              5'h05: pos_normal = 16'h0685;
              5'h06: pos_normal = 16'h0686;
              5'h07: pos_normal = 16'h0687;
              5'h08: pos_normal = 16'h0688;
              5'h09: pos_normal = 16'h0689;
              5'h0a: pos_normal = 16'h068a;
              5'h0b: pos_normal = 16'h068b;
              5'h0c: pos_normal = 16'h068c;
              5'h0d: pos_normal = 16'h068d;
              5'h0e: pos_normal = 16'h068e;
              5'h0f: pos_normal = 16'h068f;
              5'h10: pos_normal = 16'h0690;
              5'h11: pos_normal = 16'h0691;
              5'h12: pos_normal = 16'h0692;
              5'h13: pos_normal = 16'h0693;
              5'h14: pos_normal = 16'h0694;
              5'h15: pos_normal = 16'h0695;
              5'h16: pos_normal = 16'h0696;
              5'h17: pos_normal = 16'h0697;
              5'h18: pos_normal = 16'h0698;
              5'h19: pos_normal = 16'h0699;
              5'h1a: pos_normal = 16'h069a;
              5'h1b: pos_normal = 16'h069b;
              5'h1c: pos_normal = 16'h069c;
              5'h1d: pos_normal = 16'h069d;
              5'h1e: pos_normal = 16'h069e;
              5'h1f: pos_normal = 16'h069f;
              default: begin end
            endcase
          end
          5'h15: begin
            pos_normal = 16'h06a0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h06a1;
              5'h02: pos_normal = 16'h06a2;
              5'h03: pos_normal = 16'h06a3;
              5'h04: pos_normal = 16'h06a4;
              5'h05: pos_normal = 16'h06a5;
              5'h06: pos_normal = 16'h06a6;
              5'h07: pos_normal = 16'h06a7;
              5'h08: pos_normal = 16'h06a8;
              5'h09: pos_normal = 16'h06a9;
              5'h0a: pos_normal = 16'h06aa;
              5'h0b: pos_normal = 16'h06ab;
              5'h0c: pos_normal = 16'h06ac;
              5'h0d: pos_normal = 16'h06ad;
              5'h0e: pos_normal = 16'h06ae;
              5'h0f: pos_normal = 16'h06af;
              5'h10: pos_normal = 16'h06b0;
              5'h11: pos_normal = 16'h06b1;
              5'h12: pos_normal = 16'h06b2;
              5'h13: pos_normal = 16'h06b3;
              5'h14: pos_normal = 16'h06b4;
              5'h15: pos_normal = 16'h06b5;
              5'h16: pos_normal = 16'h06b6;
              5'h17: pos_normal = 16'h06b7;
              5'h18: pos_normal = 16'h06b8;
              5'h19: pos_normal = 16'h06b9;
              5'h1a: pos_normal = 16'h06ba;
              5'h1b: pos_normal = 16'h06bb;
              5'h1c: pos_normal = 16'h06bc;
              5'h1d: pos_normal = 16'h06bd;
              5'h1e: pos_normal = 16'h06be;
              5'h1f: pos_normal = 16'h06bf;
              default: begin end
            endcase
          end
          5'h16: begin
            pos_normal = 16'h06c0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h06c1;
              5'h02: pos_normal = 16'h06c2;
              5'h03: pos_normal = 16'h06c3;
              5'h04: pos_normal = 16'h06c4;
              5'h05: pos_normal = 16'h06c5;
              5'h06: pos_normal = 16'h06c6;
              5'h07: pos_normal = 16'h06c7;
              5'h08: pos_normal = 16'h06c8;
              5'h09: pos_normal = 16'h06c9;
              5'h0a: pos_normal = 16'h06ca;
              5'h0b: pos_normal = 16'h06cb;
              5'h0c: pos_normal = 16'h06cc;
              5'h0d: pos_normal = 16'h06cd;
              5'h0e: pos_normal = 16'h06ce;
              5'h0f: pos_normal = 16'h06cf;
              5'h10: pos_normal = 16'h06d0;
              5'h11: pos_normal = 16'h06d1;
              5'h12: pos_normal = 16'h06d2;
              5'h13: pos_normal = 16'h06d3;
              5'h14: pos_normal = 16'h06d4;
              5'h15: pos_normal = 16'h06d5;
              5'h16: pos_normal = 16'h06d6;
              5'h17: pos_normal = 16'h06d7;
              5'h18: pos_normal = 16'h06d8;
              5'h19: pos_normal = 16'h06d9;
              5'h1a: pos_normal = 16'h06da;
              5'h1b: pos_normal = 16'h06db;
              5'h1c: pos_normal = 16'h06dc;
              5'h1d: pos_normal = 16'h06dd;
              5'h1e: pos_normal = 16'h06de;
              5'h1f: pos_normal = 16'h06df;
              default: begin end
            endcase
          end
          5'h17: begin
            pos_normal = 16'h06e0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h06e1;
              5'h02: pos_normal = 16'h06e2;
              5'h03: pos_normal = 16'h06e3;
              5'h04: pos_normal = 16'h06e4;
              5'h05: pos_normal = 16'h06e5;
              5'h06: pos_normal = 16'h06e6;
              5'h07: pos_normal = 16'h06e7;
              5'h08: pos_normal = 16'h06e8;
              5'h09: pos_normal = 16'h06e9;
              5'h0a: pos_normal = 16'h06ea;
              5'h0b: pos_normal = 16'h06eb;
              5'h0c: pos_normal = 16'h06ec;
              5'h0d: pos_normal = 16'h06ed;
              5'h0e: pos_normal = 16'h06ee;
              5'h0f: pos_normal = 16'h06ef;
              5'h10: pos_normal = 16'h06f0;
              5'h11: pos_normal = 16'h06f1;
              5'h12: pos_normal = 16'h06f2;
              5'h13: pos_normal = 16'h06f3;
              5'h14: pos_normal = 16'h06f4;
              5'h15: pos_normal = 16'h06f5;
              5'h16: pos_normal = 16'h06f6;
              5'h17: pos_normal = 16'h06f7;
              5'h18: pos_normal = 16'h06f8;
              5'h19: pos_normal = 16'h06f9;
              5'h1a: pos_normal = 16'h06fa;
              5'h1b: pos_normal = 16'h06fb;
              5'h1c: pos_normal = 16'h06fc;
              5'h1d: pos_normal = 16'h06fd;
              5'h1e: pos_normal = 16'h06fe;
              5'h1f: pos_normal = 16'h06ff;
              default: begin end
            endcase
          end
          5'h18: begin
            pos_normal = 16'h0700;
            case (mant[4:0])
              5'h01: pos_normal = 16'h0701;
              5'h02: pos_normal = 16'h0702;
              5'h03: pos_normal = 16'h0703;
              5'h04: pos_normal = 16'h0704;
              5'h05: pos_normal = 16'h0705;
              5'h06: pos_normal = 16'h0706;
              5'h07: pos_normal = 16'h0707;
              5'h08: pos_normal = 16'h0708;
              5'h09: pos_normal = 16'h0709;
              5'h0a: pos_normal = 16'h070a;
              5'h0b: pos_normal = 16'h070b;
              5'h0c: pos_normal = 16'h070c;
              5'h0d: pos_normal = 16'h070d;
              5'h0e: pos_normal = 16'h070e;
              5'h0f: pos_normal = 16'h070f;
              5'h10: pos_normal = 16'h0710;
              5'h11: pos_normal = 16'h0711;
              5'h12: pos_normal = 16'h0712;
              5'h13: pos_normal = 16'h0713;
              5'h14: pos_normal = 16'h0714;
              5'h15: pos_normal = 16'h0715;
              5'h16: pos_normal = 16'h0716;
              5'h17: pos_normal = 16'h0717;
              5'h18: pos_normal = 16'h0718;
              5'h19: pos_normal = 16'h0719;
              5'h1a: pos_normal = 16'h071a;
              5'h1b: pos_normal = 16'h071b;
              5'h1c: pos_normal = 16'h071c;
              5'h1d: pos_normal = 16'h071d;
              5'h1e: pos_normal = 16'h071e;
              5'h1f: pos_normal = 16'h071f;
              default: begin end
            endcase
          end
          5'h19: begin
            pos_normal = 16'h0720;
            case (mant[4:0])
              5'h01: pos_normal = 16'h0721;
              5'h02: pos_normal = 16'h0722;
              5'h03: pos_normal = 16'h0723;
              5'h04: pos_normal = 16'h0724;
              5'h05: pos_normal = 16'h0725;
              5'h06: pos_normal = 16'h0726;
              5'h07: pos_normal = 16'h0727;
              5'h08: pos_normal = 16'h0728;
              5'h09: pos_normal = 16'h0729;
              5'h0a: pos_normal = 16'h072a;
              5'h0b: pos_normal = 16'h072b;
              5'h0c: pos_normal = 16'h072c;
              5'h0d: pos_normal = 16'h072d;
              5'h0e: pos_normal = 16'h072e;
              5'h0f: pos_normal = 16'h072f;
              5'h10: pos_normal = 16'h0730;
              5'h11: pos_normal = 16'h0731;
              5'h12: pos_normal = 16'h0732;
              5'h13: pos_normal = 16'h0733;
              5'h14: pos_normal = 16'h0734;
              5'h15: pos_normal = 16'h0735;
              5'h16: pos_normal = 16'h0736;
              5'h17: pos_normal = 16'h0737;
              5'h18: pos_normal = 16'h0738;
              5'h19: pos_normal = 16'h0739;
              5'h1a: pos_normal = 16'h073a;
              5'h1b: pos_normal = 16'h073b;
              5'h1c: pos_normal = 16'h073c;
              5'h1d: pos_normal = 16'h073d;
              5'h1e: pos_normal = 16'h073e;
              5'h1f: pos_normal = 16'h073f;
              default: begin end
            endcase
          end
          5'h1a: begin
            pos_normal = 16'h0740;
            case (mant[4:0])
              5'h01: pos_normal = 16'h0741;
              5'h02: pos_normal = 16'h0742;
              5'h03: pos_normal = 16'h0743;
              5'h04: pos_normal = 16'h0744;
              5'h05: pos_normal = 16'h0745;
              5'h06: pos_normal = 16'h0746;
              5'h07: pos_normal = 16'h0747;
              5'h08: pos_normal = 16'h0748;
              5'h09: pos_normal = 16'h0749;
              5'h0a: pos_normal = 16'h074a;
              5'h0b: pos_normal = 16'h074b;
              5'h0c: pos_normal = 16'h074c;
              5'h0d: pos_normal = 16'h074d;
              5'h0e: pos_normal = 16'h074e;
              5'h0f: pos_normal = 16'h074f;
              5'h10: pos_normal = 16'h0750;
              5'h11: pos_normal = 16'h0751;
              5'h12: pos_normal = 16'h0752;
              5'h13: pos_normal = 16'h0753;
              5'h14: pos_normal = 16'h0754;
              5'h15: pos_normal = 16'h0755;
              5'h16: pos_normal = 16'h0756;
              5'h17: pos_normal = 16'h0757;
              5'h18: pos_normal = 16'h0758;
              5'h19: pos_normal = 16'h0759;
              5'h1a: pos_normal = 16'h075a;
              5'h1b: pos_normal = 16'h075b;
              5'h1c: pos_normal = 16'h075c;
              5'h1d: pos_normal = 16'h075d;
              5'h1e: pos_normal = 16'h075e;
              5'h1f: pos_normal = 16'h075f;
              default: begin end
            endcase
          end
          5'h1b: begin
            pos_normal = 16'h0760;
            case (mant[4:0])
              5'h01: pos_normal = 16'h0761;
              5'h02: pos_normal = 16'h0762;
              5'h03: pos_normal = 16'h0763;
              5'h04: pos_normal = 16'h0764;
              5'h05: pos_normal = 16'h0765;
              5'h06: pos_normal = 16'h0766;
              5'h07: pos_normal = 16'h0767;
              5'h08: pos_normal = 16'h0768;
              5'h09: pos_normal = 16'h0769;
              5'h0a: pos_normal = 16'h076a;
              5'h0b: pos_normal = 16'h076b;
              5'h0c: pos_normal = 16'h076c;
              5'h0d: pos_normal = 16'h076d;
              5'h0e: pos_normal = 16'h076e;
              5'h0f: pos_normal = 16'h076f;
              5'h10: pos_normal = 16'h0770;
              5'h11: pos_normal = 16'h0771;
              5'h12: pos_normal = 16'h0772;
              5'h13: pos_normal = 16'h0773;
              5'h14: pos_normal = 16'h0774;
              5'h15: pos_normal = 16'h0775;
              5'h16: pos_normal = 16'h0776;
              5'h17: pos_normal = 16'h0777;
              5'h18: pos_normal = 16'h0778;
              5'h19: pos_normal = 16'h0779;
              5'h1a: pos_normal = 16'h077a;
              5'h1b: pos_normal = 16'h077b;
              5'h1c: pos_normal = 16'h077c;
              5'h1d: pos_normal = 16'h077d;
              5'h1e: pos_normal = 16'h077e;
              5'h1f: pos_normal = 16'h077f;
              default: begin end
            endcase
          end
          5'h1c: begin
            pos_normal = 16'h0780;
            case (mant[4:0])
              5'h01: pos_normal = 16'h0781;
              5'h02: pos_normal = 16'h0782;
              5'h03: pos_normal = 16'h0783;
              5'h04: pos_normal = 16'h0784;
              5'h05: pos_normal = 16'h0785;
              5'h06: pos_normal = 16'h0786;
              5'h07: pos_normal = 16'h0787;
              5'h08: pos_normal = 16'h0788;
              5'h09: pos_normal = 16'h0789;
              5'h0a: pos_normal = 16'h078a;
              5'h0b: pos_normal = 16'h078b;
              5'h0c: pos_normal = 16'h078c;
              5'h0d: pos_normal = 16'h078d;
              5'h0e: pos_normal = 16'h078e;
              5'h0f: pos_normal = 16'h078f;
              5'h10: pos_normal = 16'h0790;
              5'h11: pos_normal = 16'h0791;
              5'h12: pos_normal = 16'h0792;
              5'h13: pos_normal = 16'h0793;
              5'h14: pos_normal = 16'h0794;
              5'h15: pos_normal = 16'h0795;
              5'h16: pos_normal = 16'h0796;
              5'h17: pos_normal = 16'h0797;
              5'h18: pos_normal = 16'h0798;
              5'h19: pos_normal = 16'h0799;
              5'h1a: pos_normal = 16'h079a;
              5'h1b: pos_normal = 16'h079b;
              5'h1c: pos_normal = 16'h079c;
              5'h1d: pos_normal = 16'h079d;
              5'h1e: pos_normal = 16'h079e;
              5'h1f: pos_normal = 16'h079f;
              default: begin end
            endcase
          end
          5'h1d: begin
            pos_normal = 16'h07a0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h07a1;
              5'h02: pos_normal = 16'h07a2;
              5'h03: pos_normal = 16'h07a3;
              5'h04: pos_normal = 16'h07a4;
              5'h05: pos_normal = 16'h07a5;
              5'h06: pos_normal = 16'h07a6;
              5'h07: pos_normal = 16'h07a7;
              5'h08: pos_normal = 16'h07a8;
              5'h09: pos_normal = 16'h07a9;
              5'h0a: pos_normal = 16'h07aa;
              5'h0b: pos_normal = 16'h07ab;
              5'h0c: pos_normal = 16'h07ac;
              5'h0d: pos_normal = 16'h07ad;
              5'h0e: pos_normal = 16'h07ae;
              5'h0f: pos_normal = 16'h07af;
              5'h10: pos_normal = 16'h07b0;
              5'h11: pos_normal = 16'h07b1;
              5'h12: pos_normal = 16'h07b2;
              5'h13: pos_normal = 16'h07b3;
              5'h14: pos_normal = 16'h07b4;
              5'h15: pos_normal = 16'h07b5;
              5'h16: pos_normal = 16'h07b6;
              5'h17: pos_normal = 16'h07b7;
              5'h18: pos_normal = 16'h07b8;
              5'h19: pos_normal = 16'h07b9;
              5'h1a: pos_normal = 16'h07ba;
              5'h1b: pos_normal = 16'h07bb;
              5'h1c: pos_normal = 16'h07bc;
              5'h1d: pos_normal = 16'h07bd;
              5'h1e: pos_normal = 16'h07be;
              5'h1f: pos_normal = 16'h07bf;
              default: begin end
            endcase
          end
          5'h1e: begin
            pos_normal = 16'h07c0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h07c1;
              5'h02: pos_normal = 16'h07c2;
              5'h03: pos_normal = 16'h07c3;
              5'h04: pos_normal = 16'h07c4;
              5'h05: pos_normal = 16'h07c5;
              5'h06: pos_normal = 16'h07c6;
              5'h07: pos_normal = 16'h07c7;
              5'h08: pos_normal = 16'h07c8;
              5'h09: pos_normal = 16'h07c9;
              5'h0a: pos_normal = 16'h07ca;
              5'h0b: pos_normal = 16'h07cb;
              5'h0c: pos_normal = 16'h07cc;
              5'h0d: pos_normal = 16'h07cd;
              5'h0e: pos_normal = 16'h07ce;
              5'h0f: pos_normal = 16'h07cf;
              5'h10: pos_normal = 16'h07d0;
              5'h11: pos_normal = 16'h07d1;
              5'h12: pos_normal = 16'h07d2;
              5'h13: pos_normal = 16'h07d3;
              5'h14: pos_normal = 16'h07d4;
              5'h15: pos_normal = 16'h07d5;
              5'h16: pos_normal = 16'h07d6;
              5'h17: pos_normal = 16'h07d7;
              5'h18: pos_normal = 16'h07d8;
              5'h19: pos_normal = 16'h07d9;
              5'h1a: pos_normal = 16'h07da;
              5'h1b: pos_normal = 16'h07db;
              5'h1c: pos_normal = 16'h07dc;
              5'h1d: pos_normal = 16'h07dd;
              5'h1e: pos_normal = 16'h07de;
              5'h1f: pos_normal = 16'h07df;
              default: begin end
            endcase
          end
          5'h1f: begin
            pos_normal = 16'h07e0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h07e1;
              5'h02: pos_normal = 16'h07e2;
              5'h03: pos_normal = 16'h07e3;
              5'h04: pos_normal = 16'h07e4;
              5'h05: pos_normal = 16'h07e5;
              5'h06: pos_normal = 16'h07e6;
              5'h07: pos_normal = 16'h07e7;
              5'h08: pos_normal = 16'h07e8;
              5'h09: pos_normal = 16'h07e9;
              5'h0a: pos_normal = 16'h07ea;
              5'h0b: pos_normal = 16'h07eb;
              5'h0c: pos_normal = 16'h07ec;
              5'h0d: pos_normal = 16'h07ed;
              5'h0e: pos_normal = 16'h07ee;
              5'h0f: pos_normal = 16'h07ef;
              5'h10: pos_normal = 16'h07f0;
              5'h11: pos_normal = 16'h07f1;
              5'h12: pos_normal = 16'h07f2;
              5'h13: pos_normal = 16'h07f3;
              5'h14: pos_normal = 16'h07f4;
              5'h15: pos_normal = 16'h07f5;
              5'h16: pos_normal = 16'h07f6;
              5'h17: pos_normal = 16'h07f7;
              5'h18: pos_normal = 16'h07f8;
              5'h19: pos_normal = 16'h07f9;
              5'h1a: pos_normal = 16'h07fa;
              5'h1b: pos_normal = 16'h07fb;
              5'h1c: pos_normal = 16'h07fc;
              5'h1d: pos_normal = 16'h07fd;
              5'h1e: pos_normal = 16'h07fe;
              5'h1f: pos_normal = 16'h07ff;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      5'h02: begin
        case (mant[9:5])
          5'h00: begin
            pos_normal = 16'h0800;
            case (mant[4:0])
              5'h01: pos_normal = 16'h0801;
              5'h02: pos_normal = 16'h0802;
              5'h03: pos_normal = 16'h0803;
              5'h04: pos_normal = 16'h0804;
              5'h05: pos_normal = 16'h0805;
              5'h06: pos_normal = 16'h0806;
              5'h07: pos_normal = 16'h0807;
              5'h08: pos_normal = 16'h0808;
              5'h09: pos_normal = 16'h0809;
              5'h0a: pos_normal = 16'h080a;
              5'h0b: pos_normal = 16'h080b;
              5'h0c: pos_normal = 16'h080c;
              5'h0d: pos_normal = 16'h080d;
              5'h0e: pos_normal = 16'h080e;
              5'h0f: pos_normal = 16'h080f;
              5'h10: pos_normal = 16'h0810;
              5'h11: pos_normal = 16'h0811;
              5'h12: pos_normal = 16'h0812;
              5'h13: pos_normal = 16'h0813;
              5'h14: pos_normal = 16'h0814;
              5'h15: pos_normal = 16'h0815;
              5'h16: pos_normal = 16'h0816;
              5'h17: pos_normal = 16'h0817;
              5'h18: pos_normal = 16'h0818;
              5'h19: pos_normal = 16'h0819;
              5'h1a: pos_normal = 16'h081a;
              5'h1b: pos_normal = 16'h081b;
              5'h1c: pos_normal = 16'h081c;
              5'h1d: pos_normal = 16'h081d;
              5'h1e: pos_normal = 16'h081e;
              5'h1f: pos_normal = 16'h081f;
              default: begin end
            endcase
          end
          5'h01: begin
            pos_normal = 16'h0820;
            case (mant[4:0])
              5'h01: pos_normal = 16'h0821;
              5'h02: pos_normal = 16'h0822;
              5'h03: pos_normal = 16'h0823;
              5'h04: pos_normal = 16'h0824;
              5'h05: pos_normal = 16'h0825;
              5'h06: pos_normal = 16'h0826;
              5'h07: pos_normal = 16'h0827;
              5'h08: pos_normal = 16'h0828;
              5'h09: pos_normal = 16'h0829;
              5'h0a: pos_normal = 16'h082a;
              5'h0b: pos_normal = 16'h082b;
              5'h0c: pos_normal = 16'h082c;
              5'h0d: pos_normal = 16'h082d;
              5'h0e: pos_normal = 16'h082e;
              5'h0f: pos_normal = 16'h082f;
              5'h10: pos_normal = 16'h0830;
              5'h11: pos_normal = 16'h0831;
              5'h12: pos_normal = 16'h0832;
              5'h13: pos_normal = 16'h0833;
              5'h14: pos_normal = 16'h0834;
              5'h15: pos_normal = 16'h0835;
              5'h16: pos_normal = 16'h0836;
              5'h17: pos_normal = 16'h0837;
              5'h18: pos_normal = 16'h0838;
              5'h19: pos_normal = 16'h0839;
              5'h1a: pos_normal = 16'h083a;
              5'h1b: pos_normal = 16'h083b;
              5'h1c: pos_normal = 16'h083c;
              5'h1d: pos_normal = 16'h083d;
              5'h1e: pos_normal = 16'h083e;
              5'h1f: pos_normal = 16'h083f;
              default: begin end
            endcase
          end
          5'h02: begin
            pos_normal = 16'h0840;
            case (mant[4:0])
              5'h01: pos_normal = 16'h0841;
              5'h02: pos_normal = 16'h0842;
              5'h03: pos_normal = 16'h0843;
              5'h04: pos_normal = 16'h0844;
              5'h05: pos_normal = 16'h0845;
              5'h06: pos_normal = 16'h0846;
              5'h07: pos_normal = 16'h0847;
              5'h08: pos_normal = 16'h0848;
              5'h09: pos_normal = 16'h0849;
              5'h0a: pos_normal = 16'h084a;
              5'h0b: pos_normal = 16'h084b;
              5'h0c: pos_normal = 16'h084c;
              5'h0d: pos_normal = 16'h084d;
              5'h0e: pos_normal = 16'h084e;
              5'h0f: pos_normal = 16'h084f;
              5'h10: pos_normal = 16'h0850;
              5'h11: pos_normal = 16'h0851;
              5'h12: pos_normal = 16'h0852;
              5'h13: pos_normal = 16'h0853;
              5'h14: pos_normal = 16'h0854;
              5'h15: pos_normal = 16'h0855;
              5'h16: pos_normal = 16'h0856;
              5'h17: pos_normal = 16'h0857;
              5'h18: pos_normal = 16'h0858;
              5'h19: pos_normal = 16'h0859;
              5'h1a: pos_normal = 16'h085a;
              5'h1b: pos_normal = 16'h085b;
              5'h1c: pos_normal = 16'h085c;
              5'h1d: pos_normal = 16'h085d;
              5'h1e: pos_normal = 16'h085e;
              5'h1f: pos_normal = 16'h085f;
              default: begin end
            endcase
          end
          5'h03: begin
            pos_normal = 16'h0860;
            case (mant[4:0])
              5'h01: pos_normal = 16'h0861;
              5'h02: pos_normal = 16'h0862;
              5'h03: pos_normal = 16'h0863;
              5'h04: pos_normal = 16'h0864;
              5'h05: pos_normal = 16'h0865;
              5'h06: pos_normal = 16'h0866;
              5'h07: pos_normal = 16'h0867;
              5'h08: pos_normal = 16'h0868;
              5'h09: pos_normal = 16'h0869;
              5'h0a: pos_normal = 16'h086a;
              5'h0b: pos_normal = 16'h086b;
              5'h0c: pos_normal = 16'h086c;
              5'h0d: pos_normal = 16'h086d;
              5'h0e: pos_normal = 16'h086e;
              5'h0f: pos_normal = 16'h086f;
              5'h10: pos_normal = 16'h0870;
              5'h11: pos_normal = 16'h0871;
              5'h12: pos_normal = 16'h0872;
              5'h13: pos_normal = 16'h0873;
              5'h14: pos_normal = 16'h0874;
              5'h15: pos_normal = 16'h0875;
              5'h16: pos_normal = 16'h0876;
              5'h17: pos_normal = 16'h0877;
              5'h18: pos_normal = 16'h0878;
              5'h19: pos_normal = 16'h0879;
              5'h1a: pos_normal = 16'h087a;
              5'h1b: pos_normal = 16'h087b;
              5'h1c: pos_normal = 16'h087c;
              5'h1d: pos_normal = 16'h087d;
              5'h1e: pos_normal = 16'h087e;
              5'h1f: pos_normal = 16'h087f;
              default: begin end
            endcase
          end
          5'h04: begin
            pos_normal = 16'h0880;
            case (mant[4:0])
              5'h01: pos_normal = 16'h0881;
              5'h02: pos_normal = 16'h0882;
              5'h03: pos_normal = 16'h0883;
              5'h04: pos_normal = 16'h0884;
              5'h05: pos_normal = 16'h0885;
              5'h06: pos_normal = 16'h0886;
              5'h07: pos_normal = 16'h0887;
              5'h08: pos_normal = 16'h0888;
              5'h09: pos_normal = 16'h0889;
              5'h0a: pos_normal = 16'h088a;
              5'h0b: pos_normal = 16'h088b;
              5'h0c: pos_normal = 16'h088c;
              5'h0d: pos_normal = 16'h088d;
              5'h0e: pos_normal = 16'h088e;
              5'h0f: pos_normal = 16'h088f;
              5'h10: pos_normal = 16'h0890;
              5'h11: pos_normal = 16'h0891;
              5'h12: pos_normal = 16'h0892;
              5'h13: pos_normal = 16'h0893;
              5'h14: pos_normal = 16'h0894;
              5'h15: pos_normal = 16'h0895;
              5'h16: pos_normal = 16'h0896;
              5'h17: pos_normal = 16'h0897;
              5'h18: pos_normal = 16'h0898;
              5'h19: pos_normal = 16'h0899;
              5'h1a: pos_normal = 16'h089a;
              5'h1b: pos_normal = 16'h089b;
              5'h1c: pos_normal = 16'h089c;
              5'h1d: pos_normal = 16'h089d;
              5'h1e: pos_normal = 16'h089e;
              5'h1f: pos_normal = 16'h089f;
              default: begin end
            endcase
          end
          5'h05: begin
            pos_normal = 16'h08a0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h08a1;
              5'h02: pos_normal = 16'h08a2;
              5'h03: pos_normal = 16'h08a3;
              5'h04: pos_normal = 16'h08a4;
              5'h05: pos_normal = 16'h08a5;
              5'h06: pos_normal = 16'h08a6;
              5'h07: pos_normal = 16'h08a7;
              5'h08: pos_normal = 16'h08a8;
              5'h09: pos_normal = 16'h08a9;
              5'h0a: pos_normal = 16'h08aa;
              5'h0b: pos_normal = 16'h08ab;
              5'h0c: pos_normal = 16'h08ac;
              5'h0d: pos_normal = 16'h08ad;
              5'h0e: pos_normal = 16'h08ae;
              5'h0f: pos_normal = 16'h08af;
              5'h10: pos_normal = 16'h08b0;
              5'h11: pos_normal = 16'h08b1;
              5'h12: pos_normal = 16'h08b2;
              5'h13: pos_normal = 16'h08b3;
              5'h14: pos_normal = 16'h08b4;
              5'h15: pos_normal = 16'h08b5;
              5'h16: pos_normal = 16'h08b6;
              5'h17: pos_normal = 16'h08b7;
              5'h18: pos_normal = 16'h08b8;
              5'h19: pos_normal = 16'h08b9;
              5'h1a: pos_normal = 16'h08ba;
              5'h1b: pos_normal = 16'h08bb;
              5'h1c: pos_normal = 16'h08bc;
              5'h1d: pos_normal = 16'h08bd;
              5'h1e: pos_normal = 16'h08be;
              5'h1f: pos_normal = 16'h08bf;
              default: begin end
            endcase
          end
          5'h06: begin
            pos_normal = 16'h08c0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h08c1;
              5'h02: pos_normal = 16'h08c2;
              5'h03: pos_normal = 16'h08c3;
              5'h04: pos_normal = 16'h08c4;
              5'h05: pos_normal = 16'h08c5;
              5'h06: pos_normal = 16'h08c6;
              5'h07: pos_normal = 16'h08c7;
              5'h08: pos_normal = 16'h08c8;
              5'h09: pos_normal = 16'h08c9;
              5'h0a: pos_normal = 16'h08ca;
              5'h0b: pos_normal = 16'h08cb;
              5'h0c: pos_normal = 16'h08cc;
              5'h0d: pos_normal = 16'h08cd;
              5'h0e: pos_normal = 16'h08ce;
              5'h0f: pos_normal = 16'h08cf;
              5'h10: pos_normal = 16'h08d0;
              5'h11: pos_normal = 16'h08d1;
              5'h12: pos_normal = 16'h08d2;
              5'h13: pos_normal = 16'h08d3;
              5'h14: pos_normal = 16'h08d4;
              5'h15: pos_normal = 16'h08d5;
              5'h16: pos_normal = 16'h08d6;
              5'h17: pos_normal = 16'h08d7;
              5'h18: pos_normal = 16'h08d8;
              5'h19: pos_normal = 16'h08d9;
              5'h1a: pos_normal = 16'h08da;
              5'h1b: pos_normal = 16'h08db;
              5'h1c: pos_normal = 16'h08dc;
              5'h1d: pos_normal = 16'h08dd;
              5'h1e: pos_normal = 16'h08de;
              5'h1f: pos_normal = 16'h08df;
              default: begin end
            endcase
          end
          5'h07: begin
            pos_normal = 16'h08e0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h08e1;
              5'h02: pos_normal = 16'h08e2;
              5'h03: pos_normal = 16'h08e3;
              5'h04: pos_normal = 16'h08e4;
              5'h05: pos_normal = 16'h08e5;
              5'h06: pos_normal = 16'h08e6;
              5'h07: pos_normal = 16'h08e7;
              5'h08: pos_normal = 16'h08e8;
              5'h09: pos_normal = 16'h08e9;
              5'h0a: pos_normal = 16'h08ea;
              5'h0b: pos_normal = 16'h08eb;
              5'h0c: pos_normal = 16'h08ec;
              5'h0d: pos_normal = 16'h08ed;
              5'h0e: pos_normal = 16'h08ee;
              5'h0f: pos_normal = 16'h08ef;
              5'h10: pos_normal = 16'h08f0;
              5'h11: pos_normal = 16'h08f1;
              5'h12: pos_normal = 16'h08f2;
              5'h13: pos_normal = 16'h08f3;
              5'h14: pos_normal = 16'h08f4;
              5'h15: pos_normal = 16'h08f5;
              5'h16: pos_normal = 16'h08f6;
              5'h17: pos_normal = 16'h08f7;
              5'h18: pos_normal = 16'h08f8;
              5'h19: pos_normal = 16'h08f9;
              5'h1a: pos_normal = 16'h08fa;
              5'h1b: pos_normal = 16'h08fb;
              5'h1c: pos_normal = 16'h08fc;
              5'h1d: pos_normal = 16'h08fd;
              5'h1e: pos_normal = 16'h08fe;
              5'h1f: pos_normal = 16'h08ff;
              default: begin end
            endcase
          end
          5'h08: begin
            pos_normal = 16'h0900;
            case (mant[4:0])
              5'h01: pos_normal = 16'h0901;
              5'h02: pos_normal = 16'h0902;
              5'h03: pos_normal = 16'h0903;
              5'h04: pos_normal = 16'h0904;
              5'h05: pos_normal = 16'h0905;
              5'h06: pos_normal = 16'h0906;
              5'h07: pos_normal = 16'h0907;
              5'h08: pos_normal = 16'h0908;
              5'h09: pos_normal = 16'h0909;
              5'h0a: pos_normal = 16'h090a;
              5'h0b: pos_normal = 16'h090b;
              5'h0c: pos_normal = 16'h090c;
              5'h0d: pos_normal = 16'h090d;
              5'h0e: pos_normal = 16'h090e;
              5'h0f: pos_normal = 16'h090f;
              5'h10: pos_normal = 16'h0910;
              5'h11: pos_normal = 16'h0911;
              5'h12: pos_normal = 16'h0912;
              5'h13: pos_normal = 16'h0913;
              5'h14: pos_normal = 16'h0914;
              5'h15: pos_normal = 16'h0915;
              5'h16: pos_normal = 16'h0916;
              5'h17: pos_normal = 16'h0917;
              5'h18: pos_normal = 16'h0918;
              5'h19: pos_normal = 16'h0919;
              5'h1a: pos_normal = 16'h091a;
              5'h1b: pos_normal = 16'h091b;
              5'h1c: pos_normal = 16'h091c;
              5'h1d: pos_normal = 16'h091d;
              5'h1e: pos_normal = 16'h091e;
              5'h1f: pos_normal = 16'h091f;
              default: begin end
            endcase
          end
          5'h09: begin
            pos_normal = 16'h0920;
            case (mant[4:0])
              5'h01: pos_normal = 16'h0921;
              5'h02: pos_normal = 16'h0922;
              5'h03: pos_normal = 16'h0923;
              5'h04: pos_normal = 16'h0924;
              5'h05: pos_normal = 16'h0925;
              5'h06: pos_normal = 16'h0926;
              5'h07: pos_normal = 16'h0927;
              5'h08: pos_normal = 16'h0928;
              5'h09: pos_normal = 16'h0929;
              5'h0a: pos_normal = 16'h092a;
              5'h0b: pos_normal = 16'h092b;
              5'h0c: pos_normal = 16'h092c;
              5'h0d: pos_normal = 16'h092d;
              5'h0e: pos_normal = 16'h092e;
              5'h0f: pos_normal = 16'h092f;
              5'h10: pos_normal = 16'h0930;
              5'h11: pos_normal = 16'h0931;
              5'h12: pos_normal = 16'h0932;
              5'h13: pos_normal = 16'h0933;
              5'h14: pos_normal = 16'h0934;
              5'h15: pos_normal = 16'h0935;
              5'h16: pos_normal = 16'h0936;
              5'h17: pos_normal = 16'h0937;
              5'h18: pos_normal = 16'h0938;
              5'h19: pos_normal = 16'h0939;
              5'h1a: pos_normal = 16'h093a;
              5'h1b: pos_normal = 16'h093b;
              5'h1c: pos_normal = 16'h093c;
              5'h1d: pos_normal = 16'h093d;
              5'h1e: pos_normal = 16'h093e;
              5'h1f: pos_normal = 16'h093f;
              default: begin end
            endcase
          end
          5'h0a: begin
            pos_normal = 16'h0940;
            case (mant[4:0])
              5'h01: pos_normal = 16'h0941;
              5'h02: pos_normal = 16'h0942;
              5'h03: pos_normal = 16'h0943;
              5'h04: pos_normal = 16'h0944;
              5'h05: pos_normal = 16'h0945;
              5'h06: pos_normal = 16'h0946;
              5'h07: pos_normal = 16'h0947;
              5'h08: pos_normal = 16'h0948;
              5'h09: pos_normal = 16'h0949;
              5'h0a: pos_normal = 16'h094a;
              5'h0b: pos_normal = 16'h094b;
              5'h0c: pos_normal = 16'h094c;
              5'h0d: pos_normal = 16'h094d;
              5'h0e: pos_normal = 16'h094e;
              5'h0f: pos_normal = 16'h094f;
              5'h10: pos_normal = 16'h0950;
              5'h11: pos_normal = 16'h0951;
              5'h12: pos_normal = 16'h0952;
              5'h13: pos_normal = 16'h0953;
              5'h14: pos_normal = 16'h0954;
              5'h15: pos_normal = 16'h0955;
              5'h16: pos_normal = 16'h0956;
              5'h17: pos_normal = 16'h0957;
              5'h18: pos_normal = 16'h0958;
              5'h19: pos_normal = 16'h0959;
              5'h1a: pos_normal = 16'h095a;
              5'h1b: pos_normal = 16'h095b;
              5'h1c: pos_normal = 16'h095c;
              5'h1d: pos_normal = 16'h095d;
              5'h1e: pos_normal = 16'h095e;
              5'h1f: pos_normal = 16'h095f;
              default: begin end
            endcase
          end
          5'h0b: begin
            pos_normal = 16'h0960;
            case (mant[4:0])
              5'h01: pos_normal = 16'h0961;
              5'h02: pos_normal = 16'h0962;
              5'h03: pos_normal = 16'h0963;
              5'h04: pos_normal = 16'h0964;
              5'h05: pos_normal = 16'h0965;
              5'h06: pos_normal = 16'h0966;
              5'h07: pos_normal = 16'h0967;
              5'h08: pos_normal = 16'h0968;
              5'h09: pos_normal = 16'h0969;
              5'h0a: pos_normal = 16'h096a;
              5'h0b: pos_normal = 16'h096b;
              5'h0c: pos_normal = 16'h096c;
              5'h0d: pos_normal = 16'h096d;
              5'h0e: pos_normal = 16'h096e;
              5'h0f: pos_normal = 16'h096f;
              5'h10: pos_normal = 16'h0970;
              5'h11: pos_normal = 16'h0971;
              5'h12: pos_normal = 16'h0972;
              5'h13: pos_normal = 16'h0973;
              5'h14: pos_normal = 16'h0974;
              5'h15: pos_normal = 16'h0975;
              5'h16: pos_normal = 16'h0976;
              5'h17: pos_normal = 16'h0977;
              5'h18: pos_normal = 16'h0978;
              5'h19: pos_normal = 16'h0979;
              5'h1a: pos_normal = 16'h097a;
              5'h1b: pos_normal = 16'h097b;
              5'h1c: pos_normal = 16'h097c;
              5'h1d: pos_normal = 16'h097d;
              5'h1e: pos_normal = 16'h097e;
              5'h1f: pos_normal = 16'h097f;
              default: begin end
            endcase
          end
          5'h0c: begin
            pos_normal = 16'h0980;
            case (mant[4:0])
              5'h01: pos_normal = 16'h0981;
              5'h02: pos_normal = 16'h0982;
              5'h03: pos_normal = 16'h0983;
              5'h04: pos_normal = 16'h0984;
              5'h05: pos_normal = 16'h0985;
              5'h06: pos_normal = 16'h0986;
              5'h07: pos_normal = 16'h0987;
              5'h08: pos_normal = 16'h0988;
              5'h09: pos_normal = 16'h0989;
              5'h0a: pos_normal = 16'h098a;
              5'h0b: pos_normal = 16'h098b;
              5'h0c: pos_normal = 16'h098c;
              5'h0d: pos_normal = 16'h098d;
              5'h0e: pos_normal = 16'h098e;
              5'h0f: pos_normal = 16'h098f;
              5'h10: pos_normal = 16'h0990;
              5'h11: pos_normal = 16'h0991;
              5'h12: pos_normal = 16'h0992;
              5'h13: pos_normal = 16'h0993;
              5'h14: pos_normal = 16'h0994;
              5'h15: pos_normal = 16'h0995;
              5'h16: pos_normal = 16'h0996;
              5'h17: pos_normal = 16'h0997;
              5'h18: pos_normal = 16'h0998;
              5'h19: pos_normal = 16'h0999;
              5'h1a: pos_normal = 16'h099a;
              5'h1b: pos_normal = 16'h099b;
              5'h1c: pos_normal = 16'h099c;
              5'h1d: pos_normal = 16'h099d;
              5'h1e: pos_normal = 16'h099e;
              5'h1f: pos_normal = 16'h099f;
              default: begin end
            endcase
          end
          5'h0d: begin
            pos_normal = 16'h09a0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h09a1;
              5'h02: pos_normal = 16'h09a2;
              5'h03: pos_normal = 16'h09a3;
              5'h04: pos_normal = 16'h09a4;
              5'h05: pos_normal = 16'h09a5;
              5'h06: pos_normal = 16'h09a6;
              5'h07: pos_normal = 16'h09a7;
              5'h08: pos_normal = 16'h09a8;
              5'h09: pos_normal = 16'h09a9;
              5'h0a: pos_normal = 16'h09aa;
              5'h0b: pos_normal = 16'h09ab;
              5'h0c: pos_normal = 16'h09ac;
              5'h0d: pos_normal = 16'h09ad;
              5'h0e: pos_normal = 16'h09ae;
              5'h0f: pos_normal = 16'h09af;
              5'h10: pos_normal = 16'h09b0;
              5'h11: pos_normal = 16'h09b1;
              5'h12: pos_normal = 16'h09b2;
              5'h13: pos_normal = 16'h09b3;
              5'h14: pos_normal = 16'h09b4;
              5'h15: pos_normal = 16'h09b5;
              5'h16: pos_normal = 16'h09b6;
              5'h17: pos_normal = 16'h09b7;
              5'h18: pos_normal = 16'h09b8;
              5'h19: pos_normal = 16'h09b9;
              5'h1a: pos_normal = 16'h09ba;
              5'h1b: pos_normal = 16'h09bb;
              5'h1c: pos_normal = 16'h09bc;
              5'h1d: pos_normal = 16'h09bd;
              5'h1e: pos_normal = 16'h09be;
              5'h1f: pos_normal = 16'h09bf;
              default: begin end
            endcase
          end
          5'h0e: begin
            pos_normal = 16'h09c0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h09c1;
              5'h02: pos_normal = 16'h09c2;
              5'h03: pos_normal = 16'h09c3;
              5'h04: pos_normal = 16'h09c4;
              5'h05: pos_normal = 16'h09c5;
              5'h06: pos_normal = 16'h09c6;
              5'h07: pos_normal = 16'h09c7;
              5'h08: pos_normal = 16'h09c8;
              5'h09: pos_normal = 16'h09c9;
              5'h0a: pos_normal = 16'h09ca;
              5'h0b: pos_normal = 16'h09cb;
              5'h0c: pos_normal = 16'h09cc;
              5'h0d: pos_normal = 16'h09cd;
              5'h0e: pos_normal = 16'h09ce;
              5'h0f: pos_normal = 16'h09cf;
              5'h10: pos_normal = 16'h09d0;
              5'h11: pos_normal = 16'h09d1;
              5'h12: pos_normal = 16'h09d2;
              5'h13: pos_normal = 16'h09d3;
              5'h14: pos_normal = 16'h09d4;
              5'h15: pos_normal = 16'h09d5;
              5'h16: pos_normal = 16'h09d6;
              5'h17: pos_normal = 16'h09d7;
              5'h18: pos_normal = 16'h09d8;
              5'h19: pos_normal = 16'h09d9;
              5'h1a: pos_normal = 16'h09da;
              5'h1b: pos_normal = 16'h09db;
              5'h1c: pos_normal = 16'h09dc;
              5'h1d: pos_normal = 16'h09dd;
              5'h1e: pos_normal = 16'h09de;
              5'h1f: pos_normal = 16'h09df;
              default: begin end
            endcase
          end
          5'h0f: begin
            pos_normal = 16'h09e0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h09e1;
              5'h02: pos_normal = 16'h09e2;
              5'h03: pos_normal = 16'h09e3;
              5'h04: pos_normal = 16'h09e4;
              5'h05: pos_normal = 16'h09e5;
              5'h06: pos_normal = 16'h09e6;
              5'h07: pos_normal = 16'h09e7;
              5'h08: pos_normal = 16'h09e8;
              5'h09: pos_normal = 16'h09e9;
              5'h0a: pos_normal = 16'h09ea;
              5'h0b: pos_normal = 16'h09eb;
              5'h0c: pos_normal = 16'h09ec;
              5'h0d: pos_normal = 16'h09ed;
              5'h0e: pos_normal = 16'h09ee;
              5'h0f: pos_normal = 16'h09ef;
              5'h10: pos_normal = 16'h09f0;
              5'h11: pos_normal = 16'h09f1;
              5'h12: pos_normal = 16'h09f2;
              5'h13: pos_normal = 16'h09f3;
              5'h14: pos_normal = 16'h09f4;
              5'h15: pos_normal = 16'h09f5;
              5'h16: pos_normal = 16'h09f6;
              5'h17: pos_normal = 16'h09f7;
              5'h18: pos_normal = 16'h09f8;
              5'h19: pos_normal = 16'h09f9;
              5'h1a: pos_normal = 16'h09fa;
              5'h1b: pos_normal = 16'h09fb;
              5'h1c: pos_normal = 16'h09fc;
              5'h1d: pos_normal = 16'h09fd;
              5'h1e: pos_normal = 16'h09fe;
              5'h1f: pos_normal = 16'h09ff;
              default: begin end
            endcase
          end
          5'h10: begin
            pos_normal = 16'h0a00;
            case (mant[4:0])
              5'h01: pos_normal = 16'h0a01;
              5'h02: pos_normal = 16'h0a02;
              5'h03: pos_normal = 16'h0a03;
              5'h04: pos_normal = 16'h0a04;
              5'h05: pos_normal = 16'h0a05;
              5'h06: pos_normal = 16'h0a06;
              5'h07: pos_normal = 16'h0a07;
              5'h08: pos_normal = 16'h0a08;
              5'h09: pos_normal = 16'h0a09;
              5'h0a: pos_normal = 16'h0a0a;
              5'h0b: pos_normal = 16'h0a0b;
              5'h0c: pos_normal = 16'h0a0c;
              5'h0d: pos_normal = 16'h0a0d;
              5'h0e: pos_normal = 16'h0a0e;
              5'h0f: pos_normal = 16'h0a0f;
              5'h10: pos_normal = 16'h0a10;
              5'h11: pos_normal = 16'h0a11;
              5'h12: pos_normal = 16'h0a12;
              5'h13: pos_normal = 16'h0a13;
              5'h14: pos_normal = 16'h0a14;
              5'h15: pos_normal = 16'h0a15;
              5'h16: pos_normal = 16'h0a16;
              5'h17: pos_normal = 16'h0a17;
              5'h18: pos_normal = 16'h0a18;
              5'h19: pos_normal = 16'h0a19;
              5'h1a: pos_normal = 16'h0a1a;
              5'h1b: pos_normal = 16'h0a1b;
              5'h1c: pos_normal = 16'h0a1c;
              5'h1d: pos_normal = 16'h0a1d;
              5'h1e: pos_normal = 16'h0a1e;
              5'h1f: pos_normal = 16'h0a1f;
              default: begin end
            endcase
          end
          5'h11: begin
            pos_normal = 16'h0a20;
            case (mant[4:0])
              5'h01: pos_normal = 16'h0a21;
              5'h02: pos_normal = 16'h0a22;
              5'h03: pos_normal = 16'h0a23;
              5'h04: pos_normal = 16'h0a24;
              5'h05: pos_normal = 16'h0a25;
              5'h06: pos_normal = 16'h0a26;
              5'h07: pos_normal = 16'h0a27;
              5'h08: pos_normal = 16'h0a28;
              5'h09: pos_normal = 16'h0a29;
              5'h0a: pos_normal = 16'h0a2a;
              5'h0b: pos_normal = 16'h0a2b;
              5'h0c: pos_normal = 16'h0a2c;
              5'h0d: pos_normal = 16'h0a2d;
              5'h0e: pos_normal = 16'h0a2e;
              5'h0f: pos_normal = 16'h0a2f;
              5'h10: pos_normal = 16'h0a30;
              5'h11: pos_normal = 16'h0a31;
              5'h12: pos_normal = 16'h0a32;
              5'h13: pos_normal = 16'h0a33;
              5'h14: pos_normal = 16'h0a34;
              5'h15: pos_normal = 16'h0a35;
              5'h16: pos_normal = 16'h0a36;
              5'h17: pos_normal = 16'h0a37;
              5'h18: pos_normal = 16'h0a38;
              5'h19: pos_normal = 16'h0a39;
              5'h1a: pos_normal = 16'h0a3a;
              5'h1b: pos_normal = 16'h0a3b;
              5'h1c: pos_normal = 16'h0a3c;
              5'h1d: pos_normal = 16'h0a3d;
              5'h1e: pos_normal = 16'h0a3e;
              5'h1f: pos_normal = 16'h0a3f;
              default: begin end
            endcase
          end
          5'h12: begin
            pos_normal = 16'h0a40;
            case (mant[4:0])
              5'h01: pos_normal = 16'h0a41;
              5'h02: pos_normal = 16'h0a42;
              5'h03: pos_normal = 16'h0a43;
              5'h04: pos_normal = 16'h0a44;
              5'h05: pos_normal = 16'h0a45;
              5'h06: pos_normal = 16'h0a46;
              5'h07: pos_normal = 16'h0a47;
              5'h08: pos_normal = 16'h0a48;
              5'h09: pos_normal = 16'h0a49;
              5'h0a: pos_normal = 16'h0a4a;
              5'h0b: pos_normal = 16'h0a4b;
              5'h0c: pos_normal = 16'h0a4c;
              5'h0d: pos_normal = 16'h0a4d;
              5'h0e: pos_normal = 16'h0a4e;
              5'h0f: pos_normal = 16'h0a4f;
              5'h10: pos_normal = 16'h0a50;
              5'h11: pos_normal = 16'h0a51;
              5'h12: pos_normal = 16'h0a52;
              5'h13: pos_normal = 16'h0a53;
              5'h14: pos_normal = 16'h0a54;
              5'h15: pos_normal = 16'h0a55;
              5'h16: pos_normal = 16'h0a56;
              5'h17: pos_normal = 16'h0a57;
              5'h18: pos_normal = 16'h0a58;
              5'h19: pos_normal = 16'h0a59;
              5'h1a: pos_normal = 16'h0a5a;
              5'h1b: pos_normal = 16'h0a5b;
              5'h1c: pos_normal = 16'h0a5c;
              5'h1d: pos_normal = 16'h0a5d;
              5'h1e: pos_normal = 16'h0a5e;
              5'h1f: pos_normal = 16'h0a5f;
              default: begin end
            endcase
          end
          5'h13: begin
            pos_normal = 16'h0a60;
            case (mant[4:0])
              5'h01: pos_normal = 16'h0a61;
              5'h02: pos_normal = 16'h0a62;
              5'h03: pos_normal = 16'h0a63;
              5'h04: pos_normal = 16'h0a64;
              5'h05: pos_normal = 16'h0a65;
              5'h06: pos_normal = 16'h0a66;
              5'h07: pos_normal = 16'h0a67;
              5'h08: pos_normal = 16'h0a68;
              5'h09: pos_normal = 16'h0a69;
              5'h0a: pos_normal = 16'h0a6a;
              5'h0b: pos_normal = 16'h0a6b;
              5'h0c: pos_normal = 16'h0a6c;
              5'h0d: pos_normal = 16'h0a6d;
              5'h0e: pos_normal = 16'h0a6e;
              5'h0f: pos_normal = 16'h0a6f;
              5'h10: pos_normal = 16'h0a70;
              5'h11: pos_normal = 16'h0a71;
              5'h12: pos_normal = 16'h0a72;
              5'h13: pos_normal = 16'h0a73;
              5'h14: pos_normal = 16'h0a74;
              5'h15: pos_normal = 16'h0a75;
              5'h16: pos_normal = 16'h0a76;
              5'h17: pos_normal = 16'h0a77;
              5'h18: pos_normal = 16'h0a78;
              5'h19: pos_normal = 16'h0a79;
              5'h1a: pos_normal = 16'h0a7a;
              5'h1b: pos_normal = 16'h0a7b;
              5'h1c: pos_normal = 16'h0a7c;
              5'h1d: pos_normal = 16'h0a7d;
              5'h1e: pos_normal = 16'h0a7e;
              5'h1f: pos_normal = 16'h0a7f;
              default: begin end
            endcase
          end
          5'h14: begin
            pos_normal = 16'h0a80;
            case (mant[4:0])
              5'h01: pos_normal = 16'h0a81;
              5'h02: pos_normal = 16'h0a82;
              5'h03: pos_normal = 16'h0a83;
              5'h04: pos_normal = 16'h0a84;
              5'h05: pos_normal = 16'h0a85;
              5'h06: pos_normal = 16'h0a86;
              5'h07: pos_normal = 16'h0a87;
              5'h08: pos_normal = 16'h0a88;
              5'h09: pos_normal = 16'h0a89;
              5'h0a: pos_normal = 16'h0a8a;
              5'h0b: pos_normal = 16'h0a8b;
              5'h0c: pos_normal = 16'h0a8c;
              5'h0d: pos_normal = 16'h0a8d;
              5'h0e: pos_normal = 16'h0a8e;
              5'h0f: pos_normal = 16'h0a8f;
              5'h10: pos_normal = 16'h0a90;
              5'h11: pos_normal = 16'h0a91;
              5'h12: pos_normal = 16'h0a92;
              5'h13: pos_normal = 16'h0a93;
              5'h14: pos_normal = 16'h0a94;
              5'h15: pos_normal = 16'h0a95;
              5'h16: pos_normal = 16'h0a96;
              5'h17: pos_normal = 16'h0a97;
              5'h18: pos_normal = 16'h0a98;
              5'h19: pos_normal = 16'h0a99;
              5'h1a: pos_normal = 16'h0a9a;
              5'h1b: pos_normal = 16'h0a9b;
              5'h1c: pos_normal = 16'h0a9c;
              5'h1d: pos_normal = 16'h0a9d;
              5'h1e: pos_normal = 16'h0a9e;
              5'h1f: pos_normal = 16'h0a9f;
              default: begin end
            endcase
          end
          5'h15: begin
            pos_normal = 16'h0aa0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h0aa1;
              5'h02: pos_normal = 16'h0aa2;
              5'h03: pos_normal = 16'h0aa3;
              5'h04: pos_normal = 16'h0aa4;
              5'h05: pos_normal = 16'h0aa5;
              5'h06: pos_normal = 16'h0aa6;
              5'h07: pos_normal = 16'h0aa7;
              5'h08: pos_normal = 16'h0aa8;
              5'h09: pos_normal = 16'h0aa9;
              5'h0a: pos_normal = 16'h0aaa;
              5'h0b: pos_normal = 16'h0aab;
              5'h0c: pos_normal = 16'h0aac;
              5'h0d: pos_normal = 16'h0aad;
              5'h0e: pos_normal = 16'h0aae;
              5'h0f: pos_normal = 16'h0aaf;
              5'h10: pos_normal = 16'h0ab0;
              5'h11: pos_normal = 16'h0ab1;
              5'h12: pos_normal = 16'h0ab2;
              5'h13: pos_normal = 16'h0ab3;
              5'h14: pos_normal = 16'h0ab4;
              5'h15: pos_normal = 16'h0ab5;
              5'h16: pos_normal = 16'h0ab6;
              5'h17: pos_normal = 16'h0ab7;
              5'h18: pos_normal = 16'h0ab8;
              5'h19: pos_normal = 16'h0ab9;
              5'h1a: pos_normal = 16'h0aba;
              5'h1b: pos_normal = 16'h0abb;
              5'h1c: pos_normal = 16'h0abc;
              5'h1d: pos_normal = 16'h0abd;
              5'h1e: pos_normal = 16'h0abe;
              5'h1f: pos_normal = 16'h0abf;
              default: begin end
            endcase
          end
          5'h16: begin
            pos_normal = 16'h0ac0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h0ac1;
              5'h02: pos_normal = 16'h0ac2;
              5'h03: pos_normal = 16'h0ac3;
              5'h04: pos_normal = 16'h0ac4;
              5'h05: pos_normal = 16'h0ac5;
              5'h06: pos_normal = 16'h0ac6;
              5'h07: pos_normal = 16'h0ac7;
              5'h08: pos_normal = 16'h0ac8;
              5'h09: pos_normal = 16'h0ac9;
              5'h0a: pos_normal = 16'h0aca;
              5'h0b: pos_normal = 16'h0acb;
              5'h0c: pos_normal = 16'h0acc;
              5'h0d: pos_normal = 16'h0acd;
              5'h0e: pos_normal = 16'h0ace;
              5'h0f: pos_normal = 16'h0acf;
              5'h10: pos_normal = 16'h0ad0;
              5'h11: pos_normal = 16'h0ad1;
              5'h12: pos_normal = 16'h0ad2;
              5'h13: pos_normal = 16'h0ad3;
              5'h14: pos_normal = 16'h0ad4;
              5'h15: pos_normal = 16'h0ad5;
              5'h16: pos_normal = 16'h0ad6;
              5'h17: pos_normal = 16'h0ad7;
              5'h18: pos_normal = 16'h0ad8;
              5'h19: pos_normal = 16'h0ad9;
              5'h1a: pos_normal = 16'h0ada;
              5'h1b: pos_normal = 16'h0adb;
              5'h1c: pos_normal = 16'h0adc;
              5'h1d: pos_normal = 16'h0add;
              5'h1e: pos_normal = 16'h0ade;
              5'h1f: pos_normal = 16'h0adf;
              default: begin end
            endcase
          end
          5'h17: begin
            pos_normal = 16'h0ae0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h0ae1;
              5'h02: pos_normal = 16'h0ae2;
              5'h03: pos_normal = 16'h0ae3;
              5'h04: pos_normal = 16'h0ae4;
              5'h05: pos_normal = 16'h0ae5;
              5'h06: pos_normal = 16'h0ae6;
              5'h07: pos_normal = 16'h0ae7;
              5'h08: pos_normal = 16'h0ae8;
              5'h09: pos_normal = 16'h0ae9;
              5'h0a: pos_normal = 16'h0aea;
              5'h0b: pos_normal = 16'h0aeb;
              5'h0c: pos_normal = 16'h0aec;
              5'h0d: pos_normal = 16'h0aed;
              5'h0e: pos_normal = 16'h0aee;
              5'h0f: pos_normal = 16'h0aef;
              5'h10: pos_normal = 16'h0af0;
              5'h11: pos_normal = 16'h0af1;
              5'h12: pos_normal = 16'h0af2;
              5'h13: pos_normal = 16'h0af3;
              5'h14: pos_normal = 16'h0af4;
              5'h15: pos_normal = 16'h0af5;
              5'h16: pos_normal = 16'h0af6;
              5'h17: pos_normal = 16'h0af7;
              5'h18: pos_normal = 16'h0af8;
              5'h19: pos_normal = 16'h0af9;
              5'h1a: pos_normal = 16'h0afa;
              5'h1b: pos_normal = 16'h0afb;
              5'h1c: pos_normal = 16'h0afc;
              5'h1d: pos_normal = 16'h0afd;
              5'h1e: pos_normal = 16'h0afe;
              5'h1f: pos_normal = 16'h0aff;
              default: begin end
            endcase
          end
          5'h18: begin
            pos_normal = 16'h0b00;
            case (mant[4:0])
              5'h01: pos_normal = 16'h0b01;
              5'h02: pos_normal = 16'h0b02;
              5'h03: pos_normal = 16'h0b03;
              5'h04: pos_normal = 16'h0b04;
              5'h05: pos_normal = 16'h0b05;
              5'h06: pos_normal = 16'h0b06;
              5'h07: pos_normal = 16'h0b07;
              5'h08: pos_normal = 16'h0b08;
              5'h09: pos_normal = 16'h0b09;
              5'h0a: pos_normal = 16'h0b0a;
              5'h0b: pos_normal = 16'h0b0b;
              5'h0c: pos_normal = 16'h0b0c;
              5'h0d: pos_normal = 16'h0b0d;
              5'h0e: pos_normal = 16'h0b0e;
              5'h0f: pos_normal = 16'h0b0f;
              5'h10: pos_normal = 16'h0b10;
              5'h11: pos_normal = 16'h0b11;
              5'h12: pos_normal = 16'h0b12;
              5'h13: pos_normal = 16'h0b13;
              5'h14: pos_normal = 16'h0b14;
              5'h15: pos_normal = 16'h0b15;
              5'h16: pos_normal = 16'h0b16;
              5'h17: pos_normal = 16'h0b17;
              5'h18: pos_normal = 16'h0b18;
              5'h19: pos_normal = 16'h0b19;
              5'h1a: pos_normal = 16'h0b1a;
              5'h1b: pos_normal = 16'h0b1b;
              5'h1c: pos_normal = 16'h0b1c;
              5'h1d: pos_normal = 16'h0b1d;
              5'h1e: pos_normal = 16'h0b1e;
              5'h1f: pos_normal = 16'h0b1f;
              default: begin end
            endcase
          end
          5'h19: begin
            pos_normal = 16'h0b20;
            case (mant[4:0])
              5'h01: pos_normal = 16'h0b21;
              5'h02: pos_normal = 16'h0b22;
              5'h03: pos_normal = 16'h0b23;
              5'h04: pos_normal = 16'h0b24;
              5'h05: pos_normal = 16'h0b25;
              5'h06: pos_normal = 16'h0b26;
              5'h07: pos_normal = 16'h0b27;
              5'h08: pos_normal = 16'h0b28;
              5'h09: pos_normal = 16'h0b29;
              5'h0a: pos_normal = 16'h0b2a;
              5'h0b: pos_normal = 16'h0b2b;
              5'h0c: pos_normal = 16'h0b2c;
              5'h0d: pos_normal = 16'h0b2d;
              5'h0e: pos_normal = 16'h0b2e;
              5'h0f: pos_normal = 16'h0b2f;
              5'h10: pos_normal = 16'h0b30;
              5'h11: pos_normal = 16'h0b31;
              5'h12: pos_normal = 16'h0b32;
              5'h13: pos_normal = 16'h0b33;
              5'h14: pos_normal = 16'h0b34;
              5'h15: pos_normal = 16'h0b35;
              5'h16: pos_normal = 16'h0b36;
              5'h17: pos_normal = 16'h0b37;
              5'h18: pos_normal = 16'h0b38;
              5'h19: pos_normal = 16'h0b39;
              5'h1a: pos_normal = 16'h0b3a;
              5'h1b: pos_normal = 16'h0b3b;
              5'h1c: pos_normal = 16'h0b3c;
              5'h1d: pos_normal = 16'h0b3d;
              5'h1e: pos_normal = 16'h0b3e;
              5'h1f: pos_normal = 16'h0b3f;
              default: begin end
            endcase
          end
          5'h1a: begin
            pos_normal = 16'h0b40;
            case (mant[4:0])
              5'h01: pos_normal = 16'h0b41;
              5'h02: pos_normal = 16'h0b42;
              5'h03: pos_normal = 16'h0b43;
              5'h04: pos_normal = 16'h0b44;
              5'h05: pos_normal = 16'h0b45;
              5'h06: pos_normal = 16'h0b46;
              5'h07: pos_normal = 16'h0b47;
              5'h08: pos_normal = 16'h0b48;
              5'h09: pos_normal = 16'h0b49;
              5'h0a: pos_normal = 16'h0b4a;
              5'h0b: pos_normal = 16'h0b4b;
              5'h0c: pos_normal = 16'h0b4c;
              5'h0d: pos_normal = 16'h0b4d;
              5'h0e: pos_normal = 16'h0b4e;
              5'h0f: pos_normal = 16'h0b4f;
              5'h10: pos_normal = 16'h0b50;
              5'h11: pos_normal = 16'h0b51;
              5'h12: pos_normal = 16'h0b52;
              5'h13: pos_normal = 16'h0b53;
              5'h14: pos_normal = 16'h0b54;
              5'h15: pos_normal = 16'h0b55;
              5'h16: pos_normal = 16'h0b56;
              5'h17: pos_normal = 16'h0b57;
              5'h18: pos_normal = 16'h0b58;
              5'h19: pos_normal = 16'h0b59;
              5'h1a: pos_normal = 16'h0b5a;
              5'h1b: pos_normal = 16'h0b5b;
              5'h1c: pos_normal = 16'h0b5c;
              5'h1d: pos_normal = 16'h0b5d;
              5'h1e: pos_normal = 16'h0b5e;
              5'h1f: pos_normal = 16'h0b5f;
              default: begin end
            endcase
          end
          5'h1b: begin
            pos_normal = 16'h0b60;
            case (mant[4:0])
              5'h01: pos_normal = 16'h0b61;
              5'h02: pos_normal = 16'h0b62;
              5'h03: pos_normal = 16'h0b63;
              5'h04: pos_normal = 16'h0b64;
              5'h05: pos_normal = 16'h0b65;
              5'h06: pos_normal = 16'h0b66;
              5'h07: pos_normal = 16'h0b67;
              5'h08: pos_normal = 16'h0b68;
              5'h09: pos_normal = 16'h0b69;
              5'h0a: pos_normal = 16'h0b6a;
              5'h0b: pos_normal = 16'h0b6b;
              5'h0c: pos_normal = 16'h0b6c;
              5'h0d: pos_normal = 16'h0b6d;
              5'h0e: pos_normal = 16'h0b6e;
              5'h0f: pos_normal = 16'h0b6f;
              5'h10: pos_normal = 16'h0b70;
              5'h11: pos_normal = 16'h0b71;
              5'h12: pos_normal = 16'h0b72;
              5'h13: pos_normal = 16'h0b73;
              5'h14: pos_normal = 16'h0b74;
              5'h15: pos_normal = 16'h0b75;
              5'h16: pos_normal = 16'h0b76;
              5'h17: pos_normal = 16'h0b77;
              5'h18: pos_normal = 16'h0b78;
              5'h19: pos_normal = 16'h0b79;
              5'h1a: pos_normal = 16'h0b7a;
              5'h1b: pos_normal = 16'h0b7b;
              5'h1c: pos_normal = 16'h0b7c;
              5'h1d: pos_normal = 16'h0b7d;
              5'h1e: pos_normal = 16'h0b7e;
              5'h1f: pos_normal = 16'h0b7f;
              default: begin end
            endcase
          end
          5'h1c: begin
            pos_normal = 16'h0b80;
            case (mant[4:0])
              5'h01: pos_normal = 16'h0b81;
              5'h02: pos_normal = 16'h0b82;
              5'h03: pos_normal = 16'h0b83;
              5'h04: pos_normal = 16'h0b84;
              5'h05: pos_normal = 16'h0b85;
              5'h06: pos_normal = 16'h0b86;
              5'h07: pos_normal = 16'h0b87;
              5'h08: pos_normal = 16'h0b88;
              5'h09: pos_normal = 16'h0b89;
              5'h0a: pos_normal = 16'h0b8a;
              5'h0b: pos_normal = 16'h0b8b;
              5'h0c: pos_normal = 16'h0b8c;
              5'h0d: pos_normal = 16'h0b8d;
              5'h0e: pos_normal = 16'h0b8e;
              5'h0f: pos_normal = 16'h0b8f;
              5'h10: pos_normal = 16'h0b90;
              5'h11: pos_normal = 16'h0b91;
              5'h12: pos_normal = 16'h0b92;
              5'h13: pos_normal = 16'h0b93;
              5'h14: pos_normal = 16'h0b94;
              5'h15: pos_normal = 16'h0b95;
              5'h16: pos_normal = 16'h0b96;
              5'h17: pos_normal = 16'h0b97;
              5'h18: pos_normal = 16'h0b98;
              5'h19: pos_normal = 16'h0b99;
              5'h1a: pos_normal = 16'h0b9a;
              5'h1b: pos_normal = 16'h0b9b;
              5'h1c: pos_normal = 16'h0b9c;
              5'h1d: pos_normal = 16'h0b9d;
              5'h1e: pos_normal = 16'h0b9e;
              5'h1f: pos_normal = 16'h0b9f;
              default: begin end
            endcase
          end
          5'h1d: begin
            pos_normal = 16'h0ba0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h0ba1;
              5'h02: pos_normal = 16'h0ba2;
              5'h03: pos_normal = 16'h0ba3;
              5'h04: pos_normal = 16'h0ba4;
              5'h05: pos_normal = 16'h0ba5;
              5'h06: pos_normal = 16'h0ba6;
              5'h07: pos_normal = 16'h0ba7;
              5'h08: pos_normal = 16'h0ba8;
              5'h09: pos_normal = 16'h0ba9;
              5'h0a: pos_normal = 16'h0baa;
              5'h0b: pos_normal = 16'h0bab;
              5'h0c: pos_normal = 16'h0bac;
              5'h0d: pos_normal = 16'h0bad;
              5'h0e: pos_normal = 16'h0bae;
              5'h0f: pos_normal = 16'h0baf;
              5'h10: pos_normal = 16'h0bb0;
              5'h11: pos_normal = 16'h0bb1;
              5'h12: pos_normal = 16'h0bb2;
              5'h13: pos_normal = 16'h0bb3;
              5'h14: pos_normal = 16'h0bb4;
              5'h15: pos_normal = 16'h0bb5;
              5'h16: pos_normal = 16'h0bb6;
              5'h17: pos_normal = 16'h0bb7;
              5'h18: pos_normal = 16'h0bb8;
              5'h19: pos_normal = 16'h0bb9;
              5'h1a: pos_normal = 16'h0bba;
              5'h1b: pos_normal = 16'h0bbb;
              5'h1c: pos_normal = 16'h0bbc;
              5'h1d: pos_normal = 16'h0bbd;
              5'h1e: pos_normal = 16'h0bbe;
              5'h1f: pos_normal = 16'h0bbf;
              default: begin end
            endcase
          end
          5'h1e: begin
            pos_normal = 16'h0bc0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h0bc1;
              5'h02: pos_normal = 16'h0bc2;
              5'h03: pos_normal = 16'h0bc3;
              5'h04: pos_normal = 16'h0bc4;
              5'h05: pos_normal = 16'h0bc5;
              5'h06: pos_normal = 16'h0bc6;
              5'h07: pos_normal = 16'h0bc7;
              5'h08: pos_normal = 16'h0bc8;
              5'h09: pos_normal = 16'h0bc9;
              5'h0a: pos_normal = 16'h0bca;
              5'h0b: pos_normal = 16'h0bcb;
              5'h0c: pos_normal = 16'h0bcc;
              5'h0d: pos_normal = 16'h0bcd;
              5'h0e: pos_normal = 16'h0bce;
              5'h0f: pos_normal = 16'h0bcf;
              5'h10: pos_normal = 16'h0bd0;
              5'h11: pos_normal = 16'h0bd1;
              5'h12: pos_normal = 16'h0bd2;
              5'h13: pos_normal = 16'h0bd3;
              5'h14: pos_normal = 16'h0bd4;
              5'h15: pos_normal = 16'h0bd5;
              5'h16: pos_normal = 16'h0bd6;
              5'h17: pos_normal = 16'h0bd7;
              5'h18: pos_normal = 16'h0bd8;
              5'h19: pos_normal = 16'h0bd9;
              5'h1a: pos_normal = 16'h0bda;
              5'h1b: pos_normal = 16'h0bdb;
              5'h1c: pos_normal = 16'h0bdc;
              5'h1d: pos_normal = 16'h0bdd;
              5'h1e: pos_normal = 16'h0bde;
              5'h1f: pos_normal = 16'h0bdf;
              default: begin end
            endcase
          end
          5'h1f: begin
            pos_normal = 16'h0be0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h0be1;
              5'h02: pos_normal = 16'h0be2;
              5'h03: pos_normal = 16'h0be3;
              5'h04: pos_normal = 16'h0be4;
              5'h05: pos_normal = 16'h0be5;
              5'h06: pos_normal = 16'h0be6;
              5'h07: pos_normal = 16'h0be7;
              5'h08: pos_normal = 16'h0be8;
              5'h09: pos_normal = 16'h0be9;
              5'h0a: pos_normal = 16'h0bea;
              5'h0b: pos_normal = 16'h0beb;
              5'h0c: pos_normal = 16'h0bec;
              5'h0d: pos_normal = 16'h0bed;
              5'h0e: pos_normal = 16'h0bee;
              5'h0f: pos_normal = 16'h0bef;
              5'h10: pos_normal = 16'h0bf0;
              5'h11: pos_normal = 16'h0bf1;
              5'h12: pos_normal = 16'h0bf2;
              5'h13: pos_normal = 16'h0bf3;
              5'h14: pos_normal = 16'h0bf4;
              5'h15: pos_normal = 16'h0bf5;
              5'h16: pos_normal = 16'h0bf6;
              5'h17: pos_normal = 16'h0bf7;
              5'h18: pos_normal = 16'h0bf8;
              5'h19: pos_normal = 16'h0bf9;
              5'h1a: pos_normal = 16'h0bfa;
              5'h1b: pos_normal = 16'h0bfb;
              5'h1c: pos_normal = 16'h0bfc;
              5'h1d: pos_normal = 16'h0bfd;
              5'h1e: pos_normal = 16'h0bfe;
              5'h1f: pos_normal = 16'h0bff;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      5'h03: begin
        case (mant[9:5])
          5'h00: begin
            pos_normal = 16'h0c00;
            case (mant[4:0])
              5'h01: pos_normal = 16'h0c01;
              5'h02: pos_normal = 16'h0c02;
              5'h03: pos_normal = 16'h0c03;
              5'h04: pos_normal = 16'h0c04;
              5'h05: pos_normal = 16'h0c05;
              5'h06: pos_normal = 16'h0c06;
              5'h07: pos_normal = 16'h0c07;
              5'h08: pos_normal = 16'h0c08;
              5'h09: pos_normal = 16'h0c09;
              5'h0a: pos_normal = 16'h0c0a;
              5'h0b: pos_normal = 16'h0c0b;
              5'h0c: pos_normal = 16'h0c0c;
              5'h0d: pos_normal = 16'h0c0d;
              5'h0e: pos_normal = 16'h0c0e;
              5'h0f: pos_normal = 16'h0c0f;
              5'h10: pos_normal = 16'h0c10;
              5'h11: pos_normal = 16'h0c11;
              5'h12: pos_normal = 16'h0c12;
              5'h13: pos_normal = 16'h0c13;
              5'h14: pos_normal = 16'h0c14;
              5'h15: pos_normal = 16'h0c15;
              5'h16: pos_normal = 16'h0c16;
              5'h17: pos_normal = 16'h0c17;
              5'h18: pos_normal = 16'h0c18;
              5'h19: pos_normal = 16'h0c19;
              5'h1a: pos_normal = 16'h0c1a;
              5'h1b: pos_normal = 16'h0c1b;
              5'h1c: pos_normal = 16'h0c1c;
              5'h1d: pos_normal = 16'h0c1d;
              5'h1e: pos_normal = 16'h0c1e;
              5'h1f: pos_normal = 16'h0c1f;
              default: begin end
            endcase
          end
          5'h01: begin
            pos_normal = 16'h0c20;
            case (mant[4:0])
              5'h01: pos_normal = 16'h0c21;
              5'h02: pos_normal = 16'h0c22;
              5'h03: pos_normal = 16'h0c23;
              5'h04: pos_normal = 16'h0c24;
              5'h05: pos_normal = 16'h0c25;
              5'h06: pos_normal = 16'h0c26;
              5'h07: pos_normal = 16'h0c27;
              5'h08: pos_normal = 16'h0c28;
              5'h09: pos_normal = 16'h0c29;
              5'h0a: pos_normal = 16'h0c2a;
              5'h0b: pos_normal = 16'h0c2b;
              5'h0c: pos_normal = 16'h0c2c;
              5'h0d: pos_normal = 16'h0c2d;
              5'h0e: pos_normal = 16'h0c2e;
              5'h0f: pos_normal = 16'h0c2f;
              5'h10: pos_normal = 16'h0c30;
              5'h11: pos_normal = 16'h0c31;
              5'h12: pos_normal = 16'h0c32;
              5'h13: pos_normal = 16'h0c33;
              5'h14: pos_normal = 16'h0c34;
              5'h15: pos_normal = 16'h0c35;
              5'h16: pos_normal = 16'h0c36;
              5'h17: pos_normal = 16'h0c37;
              5'h18: pos_normal = 16'h0c38;
              5'h19: pos_normal = 16'h0c39;
              5'h1a: pos_normal = 16'h0c3a;
              5'h1b: pos_normal = 16'h0c3b;
              5'h1c: pos_normal = 16'h0c3c;
              5'h1d: pos_normal = 16'h0c3d;
              5'h1e: pos_normal = 16'h0c3e;
              5'h1f: pos_normal = 16'h0c3f;
              default: begin end
            endcase
          end
          5'h02: begin
            pos_normal = 16'h0c40;
            case (mant[4:0])
              5'h01: pos_normal = 16'h0c41;
              5'h02: pos_normal = 16'h0c42;
              5'h03: pos_normal = 16'h0c43;
              5'h04: pos_normal = 16'h0c44;
              5'h05: pos_normal = 16'h0c45;
              5'h06: pos_normal = 16'h0c46;
              5'h07: pos_normal = 16'h0c47;
              5'h08: pos_normal = 16'h0c48;
              5'h09: pos_normal = 16'h0c49;
              5'h0a: pos_normal = 16'h0c4a;
              5'h0b: pos_normal = 16'h0c4b;
              5'h0c: pos_normal = 16'h0c4c;
              5'h0d: pos_normal = 16'h0c4d;
              5'h0e: pos_normal = 16'h0c4e;
              5'h0f: pos_normal = 16'h0c4f;
              5'h10: pos_normal = 16'h0c50;
              5'h11: pos_normal = 16'h0c51;
              5'h12: pos_normal = 16'h0c52;
              5'h13: pos_normal = 16'h0c53;
              5'h14: pos_normal = 16'h0c54;
              5'h15: pos_normal = 16'h0c55;
              5'h16: pos_normal = 16'h0c56;
              5'h17: pos_normal = 16'h0c57;
              5'h18: pos_normal = 16'h0c58;
              5'h19: pos_normal = 16'h0c59;
              5'h1a: pos_normal = 16'h0c5a;
              5'h1b: pos_normal = 16'h0c5b;
              5'h1c: pos_normal = 16'h0c5c;
              5'h1d: pos_normal = 16'h0c5d;
              5'h1e: pos_normal = 16'h0c5e;
              5'h1f: pos_normal = 16'h0c5f;
              default: begin end
            endcase
          end
          5'h03: begin
            pos_normal = 16'h0c60;
            case (mant[4:0])
              5'h01: pos_normal = 16'h0c61;
              5'h02: pos_normal = 16'h0c62;
              5'h03: pos_normal = 16'h0c63;
              5'h04: pos_normal = 16'h0c64;
              5'h05: pos_normal = 16'h0c65;
              5'h06: pos_normal = 16'h0c66;
              5'h07: pos_normal = 16'h0c67;
              5'h08: pos_normal = 16'h0c68;
              5'h09: pos_normal = 16'h0c69;
              5'h0a: pos_normal = 16'h0c6a;
              5'h0b: pos_normal = 16'h0c6b;
              5'h0c: pos_normal = 16'h0c6c;
              5'h0d: pos_normal = 16'h0c6d;
              5'h0e: pos_normal = 16'h0c6e;
              5'h0f: pos_normal = 16'h0c6f;
              5'h10: pos_normal = 16'h0c70;
              5'h11: pos_normal = 16'h0c71;
              5'h12: pos_normal = 16'h0c72;
              5'h13: pos_normal = 16'h0c73;
              5'h14: pos_normal = 16'h0c74;
              5'h15: pos_normal = 16'h0c75;
              5'h16: pos_normal = 16'h0c76;
              5'h17: pos_normal = 16'h0c77;
              5'h18: pos_normal = 16'h0c78;
              5'h19: pos_normal = 16'h0c79;
              5'h1a: pos_normal = 16'h0c7a;
              5'h1b: pos_normal = 16'h0c7b;
              5'h1c: pos_normal = 16'h0c7c;
              5'h1d: pos_normal = 16'h0c7d;
              5'h1e: pos_normal = 16'h0c7e;
              5'h1f: pos_normal = 16'h0c7f;
              default: begin end
            endcase
          end
          5'h04: begin
            pos_normal = 16'h0c80;
            case (mant[4:0])
              5'h01: pos_normal = 16'h0c81;
              5'h02: pos_normal = 16'h0c82;
              5'h03: pos_normal = 16'h0c83;
              5'h04: pos_normal = 16'h0c84;
              5'h05: pos_normal = 16'h0c85;
              5'h06: pos_normal = 16'h0c86;
              5'h07: pos_normal = 16'h0c87;
              5'h08: pos_normal = 16'h0c88;
              5'h09: pos_normal = 16'h0c89;
              5'h0a: pos_normal = 16'h0c8a;
              5'h0b: pos_normal = 16'h0c8b;
              5'h0c: pos_normal = 16'h0c8c;
              5'h0d: pos_normal = 16'h0c8d;
              5'h0e: pos_normal = 16'h0c8e;
              5'h0f: pos_normal = 16'h0c8f;
              5'h10: pos_normal = 16'h0c90;
              5'h11: pos_normal = 16'h0c91;
              5'h12: pos_normal = 16'h0c92;
              5'h13: pos_normal = 16'h0c93;
              5'h14: pos_normal = 16'h0c94;
              5'h15: pos_normal = 16'h0c95;
              5'h16: pos_normal = 16'h0c96;
              5'h17: pos_normal = 16'h0c97;
              5'h18: pos_normal = 16'h0c98;
              5'h19: pos_normal = 16'h0c99;
              5'h1a: pos_normal = 16'h0c9a;
              5'h1b: pos_normal = 16'h0c9b;
              5'h1c: pos_normal = 16'h0c9c;
              5'h1d: pos_normal = 16'h0c9d;
              5'h1e: pos_normal = 16'h0c9e;
              5'h1f: pos_normal = 16'h0c9f;
              default: begin end
            endcase
          end
          5'h05: begin
            pos_normal = 16'h0ca0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h0ca1;
              5'h02: pos_normal = 16'h0ca2;
              5'h03: pos_normal = 16'h0ca3;
              5'h04: pos_normal = 16'h0ca4;
              5'h05: pos_normal = 16'h0ca5;
              5'h06: pos_normal = 16'h0ca6;
              5'h07: pos_normal = 16'h0ca7;
              5'h08: pos_normal = 16'h0ca8;
              5'h09: pos_normal = 16'h0ca9;
              5'h0a: pos_normal = 16'h0caa;
              5'h0b: pos_normal = 16'h0cab;
              5'h0c: pos_normal = 16'h0cac;
              5'h0d: pos_normal = 16'h0cad;
              5'h0e: pos_normal = 16'h0cae;
              5'h0f: pos_normal = 16'h0caf;
              5'h10: pos_normal = 16'h0cb0;
              5'h11: pos_normal = 16'h0cb1;
              5'h12: pos_normal = 16'h0cb2;
              5'h13: pos_normal = 16'h0cb3;
              5'h14: pos_normal = 16'h0cb4;
              5'h15: pos_normal = 16'h0cb5;
              5'h16: pos_normal = 16'h0cb6;
              5'h17: pos_normal = 16'h0cb7;
              5'h18: pos_normal = 16'h0cb8;
              5'h19: pos_normal = 16'h0cb9;
              5'h1a: pos_normal = 16'h0cba;
              5'h1b: pos_normal = 16'h0cbb;
              5'h1c: pos_normal = 16'h0cbc;
              5'h1d: pos_normal = 16'h0cbd;
              5'h1e: pos_normal = 16'h0cbe;
              5'h1f: pos_normal = 16'h0cbf;
              default: begin end
            endcase
          end
          5'h06: begin
            pos_normal = 16'h0cc0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h0cc1;
              5'h02: pos_normal = 16'h0cc2;
              5'h03: pos_normal = 16'h0cc3;
              5'h04: pos_normal = 16'h0cc4;
              5'h05: pos_normal = 16'h0cc5;
              5'h06: pos_normal = 16'h0cc6;
              5'h07: pos_normal = 16'h0cc7;
              5'h08: pos_normal = 16'h0cc8;
              5'h09: pos_normal = 16'h0cc9;
              5'h0a: pos_normal = 16'h0cca;
              5'h0b: pos_normal = 16'h0ccb;
              5'h0c: pos_normal = 16'h0ccc;
              5'h0d: pos_normal = 16'h0ccd;
              5'h0e: pos_normal = 16'h0cce;
              5'h0f: pos_normal = 16'h0ccf;
              5'h10: pos_normal = 16'h0cd0;
              5'h11: pos_normal = 16'h0cd1;
              5'h12: pos_normal = 16'h0cd2;
              5'h13: pos_normal = 16'h0cd3;
              5'h14: pos_normal = 16'h0cd4;
              5'h15: pos_normal = 16'h0cd5;
              5'h16: pos_normal = 16'h0cd6;
              5'h17: pos_normal = 16'h0cd7;
              5'h18: pos_normal = 16'h0cd8;
              5'h19: pos_normal = 16'h0cd9;
              5'h1a: pos_normal = 16'h0cda;
              5'h1b: pos_normal = 16'h0cdb;
              5'h1c: pos_normal = 16'h0cdc;
              5'h1d: pos_normal = 16'h0cdd;
              5'h1e: pos_normal = 16'h0cde;
              5'h1f: pos_normal = 16'h0cdf;
              default: begin end
            endcase
          end
          5'h07: begin
            pos_normal = 16'h0ce0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h0ce1;
              5'h02: pos_normal = 16'h0ce2;
              5'h03: pos_normal = 16'h0ce3;
              5'h04: pos_normal = 16'h0ce4;
              5'h05: pos_normal = 16'h0ce5;
              5'h06: pos_normal = 16'h0ce6;
              5'h07: pos_normal = 16'h0ce7;
              5'h08: pos_normal = 16'h0ce8;
              5'h09: pos_normal = 16'h0ce9;
              5'h0a: pos_normal = 16'h0cea;
              5'h0b: pos_normal = 16'h0ceb;
              5'h0c: pos_normal = 16'h0cec;
              5'h0d: pos_normal = 16'h0ced;
              5'h0e: pos_normal = 16'h0cee;
              5'h0f: pos_normal = 16'h0cef;
              5'h10: pos_normal = 16'h0cf0;
              5'h11: pos_normal = 16'h0cf1;
              5'h12: pos_normal = 16'h0cf2;
              5'h13: pos_normal = 16'h0cf3;
              5'h14: pos_normal = 16'h0cf4;
              5'h15: pos_normal = 16'h0cf5;
              5'h16: pos_normal = 16'h0cf6;
              5'h17: pos_normal = 16'h0cf7;
              5'h18: pos_normal = 16'h0cf8;
              5'h19: pos_normal = 16'h0cf9;
              5'h1a: pos_normal = 16'h0cfa;
              5'h1b: pos_normal = 16'h0cfb;
              5'h1c: pos_normal = 16'h0cfc;
              5'h1d: pos_normal = 16'h0cfd;
              5'h1e: pos_normal = 16'h0cfe;
              5'h1f: pos_normal = 16'h0cff;
              default: begin end
            endcase
          end
          5'h08: begin
            pos_normal = 16'h0d00;
            case (mant[4:0])
              5'h01: pos_normal = 16'h0d01;
              5'h02: pos_normal = 16'h0d02;
              5'h03: pos_normal = 16'h0d03;
              5'h04: pos_normal = 16'h0d04;
              5'h05: pos_normal = 16'h0d05;
              5'h06: pos_normal = 16'h0d06;
              5'h07: pos_normal = 16'h0d07;
              5'h08: pos_normal = 16'h0d08;
              5'h09: pos_normal = 16'h0d09;
              5'h0a: pos_normal = 16'h0d0a;
              5'h0b: pos_normal = 16'h0d0b;
              5'h0c: pos_normal = 16'h0d0c;
              5'h0d: pos_normal = 16'h0d0d;
              5'h0e: pos_normal = 16'h0d0e;
              5'h0f: pos_normal = 16'h0d0f;
              5'h10: pos_normal = 16'h0d10;
              5'h11: pos_normal = 16'h0d11;
              5'h12: pos_normal = 16'h0d12;
              5'h13: pos_normal = 16'h0d13;
              5'h14: pos_normal = 16'h0d14;
              5'h15: pos_normal = 16'h0d15;
              5'h16: pos_normal = 16'h0d16;
              5'h17: pos_normal = 16'h0d17;
              5'h18: pos_normal = 16'h0d18;
              5'h19: pos_normal = 16'h0d19;
              5'h1a: pos_normal = 16'h0d1a;
              5'h1b: pos_normal = 16'h0d1b;
              5'h1c: pos_normal = 16'h0d1c;
              5'h1d: pos_normal = 16'h0d1d;
              5'h1e: pos_normal = 16'h0d1e;
              5'h1f: pos_normal = 16'h0d1f;
              default: begin end
            endcase
          end
          5'h09: begin
            pos_normal = 16'h0d20;
            case (mant[4:0])
              5'h01: pos_normal = 16'h0d21;
              5'h02: pos_normal = 16'h0d22;
              5'h03: pos_normal = 16'h0d23;
              5'h04: pos_normal = 16'h0d24;
              5'h05: pos_normal = 16'h0d25;
              5'h06: pos_normal = 16'h0d26;
              5'h07: pos_normal = 16'h0d27;
              5'h08: pos_normal = 16'h0d28;
              5'h09: pos_normal = 16'h0d29;
              5'h0a: pos_normal = 16'h0d2a;
              5'h0b: pos_normal = 16'h0d2b;
              5'h0c: pos_normal = 16'h0d2c;
              5'h0d: pos_normal = 16'h0d2d;
              5'h0e: pos_normal = 16'h0d2e;
              5'h0f: pos_normal = 16'h0d2f;
              5'h10: pos_normal = 16'h0d30;
              5'h11: pos_normal = 16'h0d31;
              5'h12: pos_normal = 16'h0d32;
              5'h13: pos_normal = 16'h0d33;
              5'h14: pos_normal = 16'h0d34;
              5'h15: pos_normal = 16'h0d35;
              5'h16: pos_normal = 16'h0d36;
              5'h17: pos_normal = 16'h0d37;
              5'h18: pos_normal = 16'h0d38;
              5'h19: pos_normal = 16'h0d39;
              5'h1a: pos_normal = 16'h0d3a;
              5'h1b: pos_normal = 16'h0d3b;
              5'h1c: pos_normal = 16'h0d3c;
              5'h1d: pos_normal = 16'h0d3d;
              5'h1e: pos_normal = 16'h0d3e;
              5'h1f: pos_normal = 16'h0d3f;
              default: begin end
            endcase
          end
          5'h0a: begin
            pos_normal = 16'h0d40;
            case (mant[4:0])
              5'h01: pos_normal = 16'h0d41;
              5'h02: pos_normal = 16'h0d42;
              5'h03: pos_normal = 16'h0d43;
              5'h04: pos_normal = 16'h0d44;
              5'h05: pos_normal = 16'h0d45;
              5'h06: pos_normal = 16'h0d46;
              5'h07: pos_normal = 16'h0d47;
              5'h08: pos_normal = 16'h0d48;
              5'h09: pos_normal = 16'h0d49;
              5'h0a: pos_normal = 16'h0d4a;
              5'h0b: pos_normal = 16'h0d4b;
              5'h0c: pos_normal = 16'h0d4c;
              5'h0d: pos_normal = 16'h0d4d;
              5'h0e: pos_normal = 16'h0d4e;
              5'h0f: pos_normal = 16'h0d4f;
              5'h10: pos_normal = 16'h0d50;
              5'h11: pos_normal = 16'h0d51;
              5'h12: pos_normal = 16'h0d52;
              5'h13: pos_normal = 16'h0d53;
              5'h14: pos_normal = 16'h0d54;
              5'h15: pos_normal = 16'h0d55;
              5'h16: pos_normal = 16'h0d56;
              5'h17: pos_normal = 16'h0d57;
              5'h18: pos_normal = 16'h0d58;
              5'h19: pos_normal = 16'h0d59;
              5'h1a: pos_normal = 16'h0d5a;
              5'h1b: pos_normal = 16'h0d5b;
              5'h1c: pos_normal = 16'h0d5c;
              5'h1d: pos_normal = 16'h0d5d;
              5'h1e: pos_normal = 16'h0d5e;
              5'h1f: pos_normal = 16'h0d5f;
              default: begin end
            endcase
          end
          5'h0b: begin
            pos_normal = 16'h0d60;
            case (mant[4:0])
              5'h01: pos_normal = 16'h0d61;
              5'h02: pos_normal = 16'h0d62;
              5'h03: pos_normal = 16'h0d63;
              5'h04: pos_normal = 16'h0d64;
              5'h05: pos_normal = 16'h0d65;
              5'h06: pos_normal = 16'h0d66;
              5'h07: pos_normal = 16'h0d67;
              5'h08: pos_normal = 16'h0d68;
              5'h09: pos_normal = 16'h0d69;
              5'h0a: pos_normal = 16'h0d6a;
              5'h0b: pos_normal = 16'h0d6b;
              5'h0c: pos_normal = 16'h0d6c;
              5'h0d: pos_normal = 16'h0d6d;
              5'h0e: pos_normal = 16'h0d6e;
              5'h0f: pos_normal = 16'h0d6f;
              5'h10: pos_normal = 16'h0d70;
              5'h11: pos_normal = 16'h0d71;
              5'h12: pos_normal = 16'h0d72;
              5'h13: pos_normal = 16'h0d73;
              5'h14: pos_normal = 16'h0d74;
              5'h15: pos_normal = 16'h0d75;
              5'h16: pos_normal = 16'h0d76;
              5'h17: pos_normal = 16'h0d77;
              5'h18: pos_normal = 16'h0d78;
              5'h19: pos_normal = 16'h0d79;
              5'h1a: pos_normal = 16'h0d7a;
              5'h1b: pos_normal = 16'h0d7b;
              5'h1c: pos_normal = 16'h0d7c;
              5'h1d: pos_normal = 16'h0d7d;
              5'h1e: pos_normal = 16'h0d7e;
              5'h1f: pos_normal = 16'h0d7f;
              default: begin end
            endcase
          end
          5'h0c: begin
            pos_normal = 16'h0d80;
            case (mant[4:0])
              5'h01: pos_normal = 16'h0d81;
              5'h02: pos_normal = 16'h0d82;
              5'h03: pos_normal = 16'h0d83;
              5'h04: pos_normal = 16'h0d84;
              5'h05: pos_normal = 16'h0d85;
              5'h06: pos_normal = 16'h0d86;
              5'h07: pos_normal = 16'h0d87;
              5'h08: pos_normal = 16'h0d88;
              5'h09: pos_normal = 16'h0d89;
              5'h0a: pos_normal = 16'h0d8a;
              5'h0b: pos_normal = 16'h0d8b;
              5'h0c: pos_normal = 16'h0d8c;
              5'h0d: pos_normal = 16'h0d8d;
              5'h0e: pos_normal = 16'h0d8e;
              5'h0f: pos_normal = 16'h0d8f;
              5'h10: pos_normal = 16'h0d90;
              5'h11: pos_normal = 16'h0d91;
              5'h12: pos_normal = 16'h0d92;
              5'h13: pos_normal = 16'h0d93;
              5'h14: pos_normal = 16'h0d94;
              5'h15: pos_normal = 16'h0d95;
              5'h16: pos_normal = 16'h0d96;
              5'h17: pos_normal = 16'h0d97;
              5'h18: pos_normal = 16'h0d98;
              5'h19: pos_normal = 16'h0d99;
              5'h1a: pos_normal = 16'h0d9a;
              5'h1b: pos_normal = 16'h0d9b;
              5'h1c: pos_normal = 16'h0d9c;
              5'h1d: pos_normal = 16'h0d9d;
              5'h1e: pos_normal = 16'h0d9e;
              5'h1f: pos_normal = 16'h0d9f;
              default: begin end
            endcase
          end
          5'h0d: begin
            pos_normal = 16'h0da0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h0da1;
              5'h02: pos_normal = 16'h0da2;
              5'h03: pos_normal = 16'h0da3;
              5'h04: pos_normal = 16'h0da4;
              5'h05: pos_normal = 16'h0da5;
              5'h06: pos_normal = 16'h0da6;
              5'h07: pos_normal = 16'h0da7;
              5'h08: pos_normal = 16'h0da8;
              5'h09: pos_normal = 16'h0da9;
              5'h0a: pos_normal = 16'h0daa;
              5'h0b: pos_normal = 16'h0dab;
              5'h0c: pos_normal = 16'h0dac;
              5'h0d: pos_normal = 16'h0dad;
              5'h0e: pos_normal = 16'h0dae;
              5'h0f: pos_normal = 16'h0daf;
              5'h10: pos_normal = 16'h0db0;
              5'h11: pos_normal = 16'h0db1;
              5'h12: pos_normal = 16'h0db2;
              5'h13: pos_normal = 16'h0db3;
              5'h14: pos_normal = 16'h0db4;
              5'h15: pos_normal = 16'h0db5;
              5'h16: pos_normal = 16'h0db6;
              5'h17: pos_normal = 16'h0db7;
              5'h18: pos_normal = 16'h0db8;
              5'h19: pos_normal = 16'h0db9;
              5'h1a: pos_normal = 16'h0dba;
              5'h1b: pos_normal = 16'h0dbb;
              5'h1c: pos_normal = 16'h0dbc;
              5'h1d: pos_normal = 16'h0dbd;
              5'h1e: pos_normal = 16'h0dbe;
              5'h1f: pos_normal = 16'h0dbf;
              default: begin end
            endcase
          end
          5'h0e: begin
            pos_normal = 16'h0dc0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h0dc1;
              5'h02: pos_normal = 16'h0dc2;
              5'h03: pos_normal = 16'h0dc3;
              5'h04: pos_normal = 16'h0dc4;
              5'h05: pos_normal = 16'h0dc5;
              5'h06: pos_normal = 16'h0dc6;
              5'h07: pos_normal = 16'h0dc7;
              5'h08: pos_normal = 16'h0dc8;
              5'h09: pos_normal = 16'h0dc9;
              5'h0a: pos_normal = 16'h0dca;
              5'h0b: pos_normal = 16'h0dcb;
              5'h0c: pos_normal = 16'h0dcc;
              5'h0d: pos_normal = 16'h0dcd;
              5'h0e: pos_normal = 16'h0dce;
              5'h0f: pos_normal = 16'h0dcf;
              5'h10: pos_normal = 16'h0dd0;
              5'h11: pos_normal = 16'h0dd1;
              5'h12: pos_normal = 16'h0dd2;
              5'h13: pos_normal = 16'h0dd3;
              5'h14: pos_normal = 16'h0dd4;
              5'h15: pos_normal = 16'h0dd5;
              5'h16: pos_normal = 16'h0dd6;
              5'h17: pos_normal = 16'h0dd7;
              5'h18: pos_normal = 16'h0dd8;
              5'h19: pos_normal = 16'h0dd9;
              5'h1a: pos_normal = 16'h0dda;
              5'h1b: pos_normal = 16'h0ddb;
              5'h1c: pos_normal = 16'h0ddc;
              5'h1d: pos_normal = 16'h0ddd;
              5'h1e: pos_normal = 16'h0dde;
              5'h1f: pos_normal = 16'h0ddf;
              default: begin end
            endcase
          end
          5'h0f: begin
            pos_normal = 16'h0de0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h0de1;
              5'h02: pos_normal = 16'h0de2;
              5'h03: pos_normal = 16'h0de3;
              5'h04: pos_normal = 16'h0de4;
              5'h05: pos_normal = 16'h0de5;
              5'h06: pos_normal = 16'h0de6;
              5'h07: pos_normal = 16'h0de7;
              5'h08: pos_normal = 16'h0de8;
              5'h09: pos_normal = 16'h0de9;
              5'h0a: pos_normal = 16'h0dea;
              5'h0b: pos_normal = 16'h0deb;
              5'h0c: pos_normal = 16'h0dec;
              5'h0d: pos_normal = 16'h0ded;
              5'h0e: pos_normal = 16'h0dee;
              5'h0f: pos_normal = 16'h0def;
              5'h10: pos_normal = 16'h0df0;
              5'h11: pos_normal = 16'h0df1;
              5'h12: pos_normal = 16'h0df2;
              5'h13: pos_normal = 16'h0df3;
              5'h14: pos_normal = 16'h0df4;
              5'h15: pos_normal = 16'h0df5;
              5'h16: pos_normal = 16'h0df6;
              5'h17: pos_normal = 16'h0df7;
              5'h18: pos_normal = 16'h0df8;
              5'h19: pos_normal = 16'h0df9;
              5'h1a: pos_normal = 16'h0dfa;
              5'h1b: pos_normal = 16'h0dfb;
              5'h1c: pos_normal = 16'h0dfc;
              5'h1d: pos_normal = 16'h0dfd;
              5'h1e: pos_normal = 16'h0dfe;
              5'h1f: pos_normal = 16'h0dff;
              default: begin end
            endcase
          end
          5'h10: begin
            pos_normal = 16'h0e00;
            case (mant[4:0])
              5'h01: pos_normal = 16'h0e01;
              5'h02: pos_normal = 16'h0e02;
              5'h03: pos_normal = 16'h0e03;
              5'h04: pos_normal = 16'h0e04;
              5'h05: pos_normal = 16'h0e05;
              5'h06: pos_normal = 16'h0e06;
              5'h07: pos_normal = 16'h0e07;
              5'h08: pos_normal = 16'h0e08;
              5'h09: pos_normal = 16'h0e09;
              5'h0a: pos_normal = 16'h0e0a;
              5'h0b: pos_normal = 16'h0e0b;
              5'h0c: pos_normal = 16'h0e0c;
              5'h0d: pos_normal = 16'h0e0d;
              5'h0e: pos_normal = 16'h0e0e;
              5'h0f: pos_normal = 16'h0e0f;
              5'h10: pos_normal = 16'h0e10;
              5'h11: pos_normal = 16'h0e11;
              5'h12: pos_normal = 16'h0e12;
              5'h13: pos_normal = 16'h0e13;
              5'h14: pos_normal = 16'h0e14;
              5'h15: pos_normal = 16'h0e15;
              5'h16: pos_normal = 16'h0e16;
              5'h17: pos_normal = 16'h0e17;
              5'h18: pos_normal = 16'h0e18;
              5'h19: pos_normal = 16'h0e19;
              5'h1a: pos_normal = 16'h0e1a;
              5'h1b: pos_normal = 16'h0e1b;
              5'h1c: pos_normal = 16'h0e1c;
              5'h1d: pos_normal = 16'h0e1d;
              5'h1e: pos_normal = 16'h0e1e;
              5'h1f: pos_normal = 16'h0e1f;
              default: begin end
            endcase
          end
          5'h11: begin
            pos_normal = 16'h0e20;
            case (mant[4:0])
              5'h01: pos_normal = 16'h0e21;
              5'h02: pos_normal = 16'h0e22;
              5'h03: pos_normal = 16'h0e23;
              5'h04: pos_normal = 16'h0e24;
              5'h05: pos_normal = 16'h0e25;
              5'h06: pos_normal = 16'h0e26;
              5'h07: pos_normal = 16'h0e27;
              5'h08: pos_normal = 16'h0e28;
              5'h09: pos_normal = 16'h0e29;
              5'h0a: pos_normal = 16'h0e2a;
              5'h0b: pos_normal = 16'h0e2b;
              5'h0c: pos_normal = 16'h0e2c;
              5'h0d: pos_normal = 16'h0e2d;
              5'h0e: pos_normal = 16'h0e2e;
              5'h0f: pos_normal = 16'h0e2f;
              5'h10: pos_normal = 16'h0e30;
              5'h11: pos_normal = 16'h0e31;
              5'h12: pos_normal = 16'h0e32;
              5'h13: pos_normal = 16'h0e33;
              5'h14: pos_normal = 16'h0e34;
              5'h15: pos_normal = 16'h0e35;
              5'h16: pos_normal = 16'h0e36;
              5'h17: pos_normal = 16'h0e37;
              5'h18: pos_normal = 16'h0e38;
              5'h19: pos_normal = 16'h0e39;
              5'h1a: pos_normal = 16'h0e3a;
              5'h1b: pos_normal = 16'h0e3b;
              5'h1c: pos_normal = 16'h0e3c;
              5'h1d: pos_normal = 16'h0e3d;
              5'h1e: pos_normal = 16'h0e3e;
              5'h1f: pos_normal = 16'h0e3f;
              default: begin end
            endcase
          end
          5'h12: begin
            pos_normal = 16'h0e40;
            case (mant[4:0])
              5'h01: pos_normal = 16'h0e41;
              5'h02: pos_normal = 16'h0e42;
              5'h03: pos_normal = 16'h0e43;
              5'h04: pos_normal = 16'h0e44;
              5'h05: pos_normal = 16'h0e45;
              5'h06: pos_normal = 16'h0e46;
              5'h07: pos_normal = 16'h0e47;
              5'h08: pos_normal = 16'h0e48;
              5'h09: pos_normal = 16'h0e49;
              5'h0a: pos_normal = 16'h0e4a;
              5'h0b: pos_normal = 16'h0e4b;
              5'h0c: pos_normal = 16'h0e4c;
              5'h0d: pos_normal = 16'h0e4d;
              5'h0e: pos_normal = 16'h0e4e;
              5'h0f: pos_normal = 16'h0e4f;
              5'h10: pos_normal = 16'h0e50;
              5'h11: pos_normal = 16'h0e51;
              5'h12: pos_normal = 16'h0e52;
              5'h13: pos_normal = 16'h0e53;
              5'h14: pos_normal = 16'h0e54;
              5'h15: pos_normal = 16'h0e55;
              5'h16: pos_normal = 16'h0e56;
              5'h17: pos_normal = 16'h0e57;
              5'h18: pos_normal = 16'h0e58;
              5'h19: pos_normal = 16'h0e59;
              5'h1a: pos_normal = 16'h0e5a;
              5'h1b: pos_normal = 16'h0e5b;
              5'h1c: pos_normal = 16'h0e5c;
              5'h1d: pos_normal = 16'h0e5d;
              5'h1e: pos_normal = 16'h0e5e;
              5'h1f: pos_normal = 16'h0e5f;
              default: begin end
            endcase
          end
          5'h13: begin
            pos_normal = 16'h0e60;
            case (mant[4:0])
              5'h01: pos_normal = 16'h0e61;
              5'h02: pos_normal = 16'h0e62;
              5'h03: pos_normal = 16'h0e63;
              5'h04: pos_normal = 16'h0e64;
              5'h05: pos_normal = 16'h0e65;
              5'h06: pos_normal = 16'h0e66;
              5'h07: pos_normal = 16'h0e67;
              5'h08: pos_normal = 16'h0e68;
              5'h09: pos_normal = 16'h0e69;
              5'h0a: pos_normal = 16'h0e6a;
              5'h0b: pos_normal = 16'h0e6b;
              5'h0c: pos_normal = 16'h0e6c;
              5'h0d: pos_normal = 16'h0e6d;
              5'h0e: pos_normal = 16'h0e6e;
              5'h0f: pos_normal = 16'h0e6f;
              5'h10: pos_normal = 16'h0e70;
              5'h11: pos_normal = 16'h0e71;
              5'h12: pos_normal = 16'h0e72;
              5'h13: pos_normal = 16'h0e73;
              5'h14: pos_normal = 16'h0e74;
              5'h15: pos_normal = 16'h0e75;
              5'h16: pos_normal = 16'h0e76;
              5'h17: pos_normal = 16'h0e77;
              5'h18: pos_normal = 16'h0e78;
              5'h19: pos_normal = 16'h0e79;
              5'h1a: pos_normal = 16'h0e7a;
              5'h1b: pos_normal = 16'h0e7b;
              5'h1c: pos_normal = 16'h0e7c;
              5'h1d: pos_normal = 16'h0e7d;
              5'h1e: pos_normal = 16'h0e7e;
              5'h1f: pos_normal = 16'h0e7f;
              default: begin end
            endcase
          end
          5'h14: begin
            pos_normal = 16'h0e80;
            case (mant[4:0])
              5'h01: pos_normal = 16'h0e81;
              5'h02: pos_normal = 16'h0e82;
              5'h03: pos_normal = 16'h0e83;
              5'h04: pos_normal = 16'h0e84;
              5'h05: pos_normal = 16'h0e85;
              5'h06: pos_normal = 16'h0e86;
              5'h07: pos_normal = 16'h0e87;
              5'h08: pos_normal = 16'h0e88;
              5'h09: pos_normal = 16'h0e89;
              5'h0a: pos_normal = 16'h0e8a;
              5'h0b: pos_normal = 16'h0e8b;
              5'h0c: pos_normal = 16'h0e8c;
              5'h0d: pos_normal = 16'h0e8d;
              5'h0e: pos_normal = 16'h0e8e;
              5'h0f: pos_normal = 16'h0e8f;
              5'h10: pos_normal = 16'h0e90;
              5'h11: pos_normal = 16'h0e91;
              5'h12: pos_normal = 16'h0e92;
              5'h13: pos_normal = 16'h0e93;
              5'h14: pos_normal = 16'h0e94;
              5'h15: pos_normal = 16'h0e95;
              5'h16: pos_normal = 16'h0e96;
              5'h17: pos_normal = 16'h0e97;
              5'h18: pos_normal = 16'h0e98;
              5'h19: pos_normal = 16'h0e99;
              5'h1a: pos_normal = 16'h0e9a;
              5'h1b: pos_normal = 16'h0e9b;
              5'h1c: pos_normal = 16'h0e9c;
              5'h1d: pos_normal = 16'h0e9d;
              5'h1e: pos_normal = 16'h0e9e;
              5'h1f: pos_normal = 16'h0e9f;
              default: begin end
            endcase
          end
          5'h15: begin
            pos_normal = 16'h0ea0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h0ea1;
              5'h02: pos_normal = 16'h0ea2;
              5'h03: pos_normal = 16'h0ea3;
              5'h04: pos_normal = 16'h0ea4;
              5'h05: pos_normal = 16'h0ea5;
              5'h06: pos_normal = 16'h0ea6;
              5'h07: pos_normal = 16'h0ea7;
              5'h08: pos_normal = 16'h0ea8;
              5'h09: pos_normal = 16'h0ea9;
              5'h0a: pos_normal = 16'h0eaa;
              5'h0b: pos_normal = 16'h0eab;
              5'h0c: pos_normal = 16'h0eac;
              5'h0d: pos_normal = 16'h0ead;
              5'h0e: pos_normal = 16'h0eae;
              5'h0f: pos_normal = 16'h0eaf;
              5'h10: pos_normal = 16'h0eb0;
              5'h11: pos_normal = 16'h0eb1;
              5'h12: pos_normal = 16'h0eb2;
              5'h13: pos_normal = 16'h0eb3;
              5'h14: pos_normal = 16'h0eb4;
              5'h15: pos_normal = 16'h0eb5;
              5'h16: pos_normal = 16'h0eb6;
              5'h17: pos_normal = 16'h0eb7;
              5'h18: pos_normal = 16'h0eb8;
              5'h19: pos_normal = 16'h0eb9;
              5'h1a: pos_normal = 16'h0eba;
              5'h1b: pos_normal = 16'h0ebb;
              5'h1c: pos_normal = 16'h0ebc;
              5'h1d: pos_normal = 16'h0ebd;
              5'h1e: pos_normal = 16'h0ebe;
              5'h1f: pos_normal = 16'h0ebf;
              default: begin end
            endcase
          end
          5'h16: begin
            pos_normal = 16'h0ec0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h0ec1;
              5'h02: pos_normal = 16'h0ec2;
              5'h03: pos_normal = 16'h0ec3;
              5'h04: pos_normal = 16'h0ec4;
              5'h05: pos_normal = 16'h0ec5;
              5'h06: pos_normal = 16'h0ec6;
              5'h07: pos_normal = 16'h0ec7;
              5'h08: pos_normal = 16'h0ec8;
              5'h09: pos_normal = 16'h0ec9;
              5'h0a: pos_normal = 16'h0eca;
              5'h0b: pos_normal = 16'h0ecb;
              5'h0c: pos_normal = 16'h0ecc;
              5'h0d: pos_normal = 16'h0ecd;
              5'h0e: pos_normal = 16'h0ece;
              5'h0f: pos_normal = 16'h0ecf;
              5'h10: pos_normal = 16'h0ed0;
              5'h11: pos_normal = 16'h0ed1;
              5'h12: pos_normal = 16'h0ed2;
              5'h13: pos_normal = 16'h0ed3;
              5'h14: pos_normal = 16'h0ed4;
              5'h15: pos_normal = 16'h0ed5;
              5'h16: pos_normal = 16'h0ed6;
              5'h17: pos_normal = 16'h0ed7;
              5'h18: pos_normal = 16'h0ed8;
              5'h19: pos_normal = 16'h0ed9;
              5'h1a: pos_normal = 16'h0eda;
              5'h1b: pos_normal = 16'h0edb;
              5'h1c: pos_normal = 16'h0edc;
              5'h1d: pos_normal = 16'h0edd;
              5'h1e: pos_normal = 16'h0ede;
              5'h1f: pos_normal = 16'h0edf;
              default: begin end
            endcase
          end
          5'h17: begin
            pos_normal = 16'h0ee0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h0ee1;
              5'h02: pos_normal = 16'h0ee2;
              5'h03: pos_normal = 16'h0ee3;
              5'h04: pos_normal = 16'h0ee4;
              5'h05: pos_normal = 16'h0ee5;
              5'h06: pos_normal = 16'h0ee6;
              5'h07: pos_normal = 16'h0ee7;
              5'h08: pos_normal = 16'h0ee8;
              5'h09: pos_normal = 16'h0ee9;
              5'h0a: pos_normal = 16'h0eea;
              5'h0b: pos_normal = 16'h0eeb;
              5'h0c: pos_normal = 16'h0eec;
              5'h0d: pos_normal = 16'h0eed;
              5'h0e: pos_normal = 16'h0eee;
              5'h0f: pos_normal = 16'h0eef;
              5'h10: pos_normal = 16'h0ef0;
              5'h11: pos_normal = 16'h0ef1;
              5'h12: pos_normal = 16'h0ef2;
              5'h13: pos_normal = 16'h0ef3;
              5'h14: pos_normal = 16'h0ef4;
              5'h15: pos_normal = 16'h0ef5;
              5'h16: pos_normal = 16'h0ef6;
              5'h17: pos_normal = 16'h0ef7;
              5'h18: pos_normal = 16'h0ef8;
              5'h19: pos_normal = 16'h0ef9;
              5'h1a: pos_normal = 16'h0efa;
              5'h1b: pos_normal = 16'h0efb;
              5'h1c: pos_normal = 16'h0efc;
              5'h1d: pos_normal = 16'h0efd;
              5'h1e: pos_normal = 16'h0efe;
              5'h1f: pos_normal = 16'h0eff;
              default: begin end
            endcase
          end
          5'h18: begin
            pos_normal = 16'h0f00;
            case (mant[4:0])
              5'h01: pos_normal = 16'h0f01;
              5'h02: pos_normal = 16'h0f02;
              5'h03: pos_normal = 16'h0f03;
              5'h04: pos_normal = 16'h0f04;
              5'h05: pos_normal = 16'h0f05;
              5'h06: pos_normal = 16'h0f06;
              5'h07: pos_normal = 16'h0f07;
              5'h08: pos_normal = 16'h0f08;
              5'h09: pos_normal = 16'h0f09;
              5'h0a: pos_normal = 16'h0f0a;
              5'h0b: pos_normal = 16'h0f0b;
              5'h0c: pos_normal = 16'h0f0c;
              5'h0d: pos_normal = 16'h0f0d;
              5'h0e: pos_normal = 16'h0f0e;
              5'h0f: pos_normal = 16'h0f0f;
              5'h10: pos_normal = 16'h0f10;
              5'h11: pos_normal = 16'h0f11;
              5'h12: pos_normal = 16'h0f12;
              5'h13: pos_normal = 16'h0f13;
              5'h14: pos_normal = 16'h0f14;
              5'h15: pos_normal = 16'h0f15;
              5'h16: pos_normal = 16'h0f16;
              5'h17: pos_normal = 16'h0f17;
              5'h18: pos_normal = 16'h0f18;
              5'h19: pos_normal = 16'h0f19;
              5'h1a: pos_normal = 16'h0f1a;
              5'h1b: pos_normal = 16'h0f1b;
              5'h1c: pos_normal = 16'h0f1c;
              5'h1d: pos_normal = 16'h0f1d;
              5'h1e: pos_normal = 16'h0f1e;
              5'h1f: pos_normal = 16'h0f1f;
              default: begin end
            endcase
          end
          5'h19: begin
            pos_normal = 16'h0f20;
            case (mant[4:0])
              5'h01: pos_normal = 16'h0f21;
              5'h02: pos_normal = 16'h0f22;
              5'h03: pos_normal = 16'h0f23;
              5'h04: pos_normal = 16'h0f24;
              5'h05: pos_normal = 16'h0f25;
              5'h06: pos_normal = 16'h0f26;
              5'h07: pos_normal = 16'h0f27;
              5'h08: pos_normal = 16'h0f28;
              5'h09: pos_normal = 16'h0f29;
              5'h0a: pos_normal = 16'h0f2a;
              5'h0b: pos_normal = 16'h0f2b;
              5'h0c: pos_normal = 16'h0f2c;
              5'h0d: pos_normal = 16'h0f2d;
              5'h0e: pos_normal = 16'h0f2e;
              5'h0f: pos_normal = 16'h0f2f;
              5'h10: pos_normal = 16'h0f30;
              5'h11: pos_normal = 16'h0f31;
              5'h12: pos_normal = 16'h0f32;
              5'h13: pos_normal = 16'h0f33;
              5'h14: pos_normal = 16'h0f34;
              5'h15: pos_normal = 16'h0f35;
              5'h16: pos_normal = 16'h0f36;
              5'h17: pos_normal = 16'h0f37;
              5'h18: pos_normal = 16'h0f38;
              5'h19: pos_normal = 16'h0f39;
              5'h1a: pos_normal = 16'h0f3a;
              5'h1b: pos_normal = 16'h0f3b;
              5'h1c: pos_normal = 16'h0f3c;
              5'h1d: pos_normal = 16'h0f3d;
              5'h1e: pos_normal = 16'h0f3e;
              5'h1f: pos_normal = 16'h0f3f;
              default: begin end
            endcase
          end
          5'h1a: begin
            pos_normal = 16'h0f40;
            case (mant[4:0])
              5'h01: pos_normal = 16'h0f41;
              5'h02: pos_normal = 16'h0f42;
              5'h03: pos_normal = 16'h0f43;
              5'h04: pos_normal = 16'h0f44;
              5'h05: pos_normal = 16'h0f45;
              5'h06: pos_normal = 16'h0f46;
              5'h07: pos_normal = 16'h0f47;
              5'h08: pos_normal = 16'h0f48;
              5'h09: pos_normal = 16'h0f49;
              5'h0a: pos_normal = 16'h0f4a;
              5'h0b: pos_normal = 16'h0f4b;
              5'h0c: pos_normal = 16'h0f4c;
              5'h0d: pos_normal = 16'h0f4d;
              5'h0e: pos_normal = 16'h0f4e;
              5'h0f: pos_normal = 16'h0f4f;
              5'h10: pos_normal = 16'h0f50;
              5'h11: pos_normal = 16'h0f51;
              5'h12: pos_normal = 16'h0f52;
              5'h13: pos_normal = 16'h0f53;
              5'h14: pos_normal = 16'h0f54;
              5'h15: pos_normal = 16'h0f55;
              5'h16: pos_normal = 16'h0f56;
              5'h17: pos_normal = 16'h0f57;
              5'h18: pos_normal = 16'h0f58;
              5'h19: pos_normal = 16'h0f59;
              5'h1a: pos_normal = 16'h0f5a;
              5'h1b: pos_normal = 16'h0f5b;
              5'h1c: pos_normal = 16'h0f5c;
              5'h1d: pos_normal = 16'h0f5d;
              5'h1e: pos_normal = 16'h0f5e;
              5'h1f: pos_normal = 16'h0f5f;
              default: begin end
            endcase
          end
          5'h1b: begin
            pos_normal = 16'h0f60;
            case (mant[4:0])
              5'h01: pos_normal = 16'h0f61;
              5'h02: pos_normal = 16'h0f62;
              5'h03: pos_normal = 16'h0f63;
              5'h04: pos_normal = 16'h0f64;
              5'h05: pos_normal = 16'h0f65;
              5'h06: pos_normal = 16'h0f66;
              5'h07: pos_normal = 16'h0f67;
              5'h08: pos_normal = 16'h0f68;
              5'h09: pos_normal = 16'h0f69;
              5'h0a: pos_normal = 16'h0f6a;
              5'h0b: pos_normal = 16'h0f6b;
              5'h0c: pos_normal = 16'h0f6c;
              5'h0d: pos_normal = 16'h0f6d;
              5'h0e: pos_normal = 16'h0f6e;
              5'h0f: pos_normal = 16'h0f6f;
              5'h10: pos_normal = 16'h0f70;
              5'h11: pos_normal = 16'h0f71;
              5'h12: pos_normal = 16'h0f72;
              5'h13: pos_normal = 16'h0f73;
              5'h14: pos_normal = 16'h0f74;
              5'h15: pos_normal = 16'h0f75;
              5'h16: pos_normal = 16'h0f76;
              5'h17: pos_normal = 16'h0f77;
              5'h18: pos_normal = 16'h0f78;
              5'h19: pos_normal = 16'h0f79;
              5'h1a: pos_normal = 16'h0f7a;
              5'h1b: pos_normal = 16'h0f7b;
              5'h1c: pos_normal = 16'h0f7c;
              5'h1d: pos_normal = 16'h0f7d;
              5'h1e: pos_normal = 16'h0f7e;
              5'h1f: pos_normal = 16'h0f7f;
              default: begin end
            endcase
          end
          5'h1c: begin
            pos_normal = 16'h0f80;
            case (mant[4:0])
              5'h01: pos_normal = 16'h0f81;
              5'h02: pos_normal = 16'h0f82;
              5'h03: pos_normal = 16'h0f83;
              5'h04: pos_normal = 16'h0f84;
              5'h05: pos_normal = 16'h0f85;
              5'h06: pos_normal = 16'h0f86;
              5'h07: pos_normal = 16'h0f87;
              5'h08: pos_normal = 16'h0f88;
              5'h09: pos_normal = 16'h0f89;
              5'h0a: pos_normal = 16'h0f8a;
              5'h0b: pos_normal = 16'h0f8b;
              5'h0c: pos_normal = 16'h0f8c;
              5'h0d: pos_normal = 16'h0f8d;
              5'h0e: pos_normal = 16'h0f8e;
              5'h0f: pos_normal = 16'h0f8f;
              5'h10: pos_normal = 16'h0f90;
              5'h11: pos_normal = 16'h0f91;
              5'h12: pos_normal = 16'h0f92;
              5'h13: pos_normal = 16'h0f93;
              5'h14: pos_normal = 16'h0f94;
              5'h15: pos_normal = 16'h0f95;
              5'h16: pos_normal = 16'h0f96;
              5'h17: pos_normal = 16'h0f97;
              5'h18: pos_normal = 16'h0f98;
              5'h19: pos_normal = 16'h0f99;
              5'h1a: pos_normal = 16'h0f9a;
              5'h1b: pos_normal = 16'h0f9b;
              5'h1c: pos_normal = 16'h0f9c;
              5'h1d: pos_normal = 16'h0f9d;
              5'h1e: pos_normal = 16'h0f9e;
              5'h1f: pos_normal = 16'h0f9f;
              default: begin end
            endcase
          end
          5'h1d: begin
            pos_normal = 16'h0fa0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h0fa1;
              5'h02: pos_normal = 16'h0fa2;
              5'h03: pos_normal = 16'h0fa3;
              5'h04: pos_normal = 16'h0fa4;
              5'h05: pos_normal = 16'h0fa5;
              5'h06: pos_normal = 16'h0fa6;
              5'h07: pos_normal = 16'h0fa7;
              5'h08: pos_normal = 16'h0fa8;
              5'h09: pos_normal = 16'h0fa9;
              5'h0a: pos_normal = 16'h0faa;
              5'h0b: pos_normal = 16'h0fab;
              5'h0c: pos_normal = 16'h0fac;
              5'h0d: pos_normal = 16'h0fad;
              5'h0e: pos_normal = 16'h0fae;
              5'h0f: pos_normal = 16'h0faf;
              5'h10: pos_normal = 16'h0fb0;
              5'h11: pos_normal = 16'h0fb1;
              5'h12: pos_normal = 16'h0fb2;
              5'h13: pos_normal = 16'h0fb3;
              5'h14: pos_normal = 16'h0fb4;
              5'h15: pos_normal = 16'h0fb5;
              5'h16: pos_normal = 16'h0fb6;
              5'h17: pos_normal = 16'h0fb7;
              5'h18: pos_normal = 16'h0fb8;
              5'h19: pos_normal = 16'h0fb9;
              5'h1a: pos_normal = 16'h0fba;
              5'h1b: pos_normal = 16'h0fbb;
              5'h1c: pos_normal = 16'h0fbc;
              5'h1d: pos_normal = 16'h0fbd;
              5'h1e: pos_normal = 16'h0fbe;
              5'h1f: pos_normal = 16'h0fbf;
              default: begin end
            endcase
          end
          5'h1e: begin
            pos_normal = 16'h0fc0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h0fc1;
              5'h02: pos_normal = 16'h0fc2;
              5'h03: pos_normal = 16'h0fc3;
              5'h04: pos_normal = 16'h0fc4;
              5'h05: pos_normal = 16'h0fc5;
              5'h06: pos_normal = 16'h0fc6;
              5'h07: pos_normal = 16'h0fc7;
              5'h08: pos_normal = 16'h0fc8;
              5'h09: pos_normal = 16'h0fc9;
              5'h0a: pos_normal = 16'h0fca;
              5'h0b: pos_normal = 16'h0fcb;
              5'h0c: pos_normal = 16'h0fcc;
              5'h0d: pos_normal = 16'h0fcd;
              5'h0e: pos_normal = 16'h0fce;
              5'h0f: pos_normal = 16'h0fcf;
              5'h10: pos_normal = 16'h0fd0;
              5'h11: pos_normal = 16'h0fd1;
              5'h12: pos_normal = 16'h0fd2;
              5'h13: pos_normal = 16'h0fd3;
              5'h14: pos_normal = 16'h0fd4;
              5'h15: pos_normal = 16'h0fd5;
              5'h16: pos_normal = 16'h0fd6;
              5'h17: pos_normal = 16'h0fd7;
              5'h18: pos_normal = 16'h0fd8;
              5'h19: pos_normal = 16'h0fd9;
              5'h1a: pos_normal = 16'h0fda;
              5'h1b: pos_normal = 16'h0fdb;
              5'h1c: pos_normal = 16'h0fdc;
              5'h1d: pos_normal = 16'h0fdd;
              5'h1e: pos_normal = 16'h0fde;
              5'h1f: pos_normal = 16'h0fdf;
              default: begin end
            endcase
          end
          5'h1f: begin
            pos_normal = 16'h0fe0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h0fe1;
              5'h02: pos_normal = 16'h0fe2;
              5'h03: pos_normal = 16'h0fe3;
              5'h04: pos_normal = 16'h0fe4;
              5'h05: pos_normal = 16'h0fe5;
              5'h06: pos_normal = 16'h0fe6;
              5'h07: pos_normal = 16'h0fe7;
              5'h08: pos_normal = 16'h0fe8;
              5'h09: pos_normal = 16'h0fe9;
              5'h0a: pos_normal = 16'h0fea;
              5'h0b: pos_normal = 16'h0feb;
              5'h0c: pos_normal = 16'h0fec;
              5'h0d: pos_normal = 16'h0fed;
              5'h0e: pos_normal = 16'h0fee;
              5'h0f: pos_normal = 16'h0fef;
              5'h10: pos_normal = 16'h0ff0;
              5'h11: pos_normal = 16'h0ff1;
              5'h12: pos_normal = 16'h0ff2;
              5'h13: pos_normal = 16'h0ff3;
              5'h14: pos_normal = 16'h0ff4;
              5'h15: pos_normal = 16'h0ff5;
              5'h16: pos_normal = 16'h0ff6;
              5'h17: pos_normal = 16'h0ff7;
              5'h18: pos_normal = 16'h0ff8;
              5'h19: pos_normal = 16'h0ff9;
              5'h1a: pos_normal = 16'h0ffa;
              5'h1b: pos_normal = 16'h0ffb;
              5'h1c: pos_normal = 16'h0ffc;
              5'h1d: pos_normal = 16'h0ffd;
              5'h1e: pos_normal = 16'h0ffe;
              5'h1f: pos_normal = 16'h0fff;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      5'h04: begin
        case (mant[9:5])
          5'h00: begin
            pos_normal = 16'h1000;
            case (mant[4:0])
              5'h01: pos_normal = 16'h1001;
              5'h02: pos_normal = 16'h1002;
              5'h03: pos_normal = 16'h1003;
              5'h04: pos_normal = 16'h1004;
              5'h05: pos_normal = 16'h1005;
              5'h06: pos_normal = 16'h1006;
              5'h07: pos_normal = 16'h1007;
              5'h08: pos_normal = 16'h1008;
              5'h09: pos_normal = 16'h1009;
              5'h0a: pos_normal = 16'h100a;
              5'h0b: pos_normal = 16'h100b;
              5'h0c: pos_normal = 16'h100c;
              5'h0d: pos_normal = 16'h100d;
              5'h0e: pos_normal = 16'h100e;
              5'h0f: pos_normal = 16'h100f;
              5'h10: pos_normal = 16'h1010;
              5'h11: pos_normal = 16'h1011;
              5'h12: pos_normal = 16'h1012;
              5'h13: pos_normal = 16'h1013;
              5'h14: pos_normal = 16'h1014;
              5'h15: pos_normal = 16'h1015;
              5'h16: pos_normal = 16'h1016;
              5'h17: pos_normal = 16'h1017;
              5'h18: pos_normal = 16'h1018;
              5'h19: pos_normal = 16'h1019;
              5'h1a: pos_normal = 16'h101a;
              5'h1b: pos_normal = 16'h101b;
              5'h1c: pos_normal = 16'h101c;
              5'h1d: pos_normal = 16'h101d;
              5'h1e: pos_normal = 16'h101e;
              5'h1f: pos_normal = 16'h101f;
              default: begin end
            endcase
          end
          5'h01: begin
            pos_normal = 16'h1020;
            case (mant[4:0])
              5'h01: pos_normal = 16'h1021;
              5'h02: pos_normal = 16'h1022;
              5'h03: pos_normal = 16'h1023;
              5'h04: pos_normal = 16'h1024;
              5'h05: pos_normal = 16'h1025;
              5'h06: pos_normal = 16'h1026;
              5'h07: pos_normal = 16'h1027;
              5'h08: pos_normal = 16'h1028;
              5'h09: pos_normal = 16'h1029;
              5'h0a: pos_normal = 16'h102a;
              5'h0b: pos_normal = 16'h102b;
              5'h0c: pos_normal = 16'h102c;
              5'h0d: pos_normal = 16'h102d;
              5'h0e: pos_normal = 16'h102e;
              5'h0f: pos_normal = 16'h102f;
              5'h10: pos_normal = 16'h1030;
              5'h11: pos_normal = 16'h1031;
              5'h12: pos_normal = 16'h1032;
              5'h13: pos_normal = 16'h1033;
              5'h14: pos_normal = 16'h1034;
              5'h15: pos_normal = 16'h1035;
              5'h16: pos_normal = 16'h1036;
              5'h17: pos_normal = 16'h1037;
              5'h18: pos_normal = 16'h1038;
              5'h19: pos_normal = 16'h1039;
              5'h1a: pos_normal = 16'h103a;
              5'h1b: pos_normal = 16'h103b;
              5'h1c: pos_normal = 16'h103c;
              5'h1d: pos_normal = 16'h103d;
              5'h1e: pos_normal = 16'h103e;
              5'h1f: pos_normal = 16'h103f;
              default: begin end
            endcase
          end
          5'h02: begin
            pos_normal = 16'h1040;
            case (mant[4:0])
              5'h01: pos_normal = 16'h1041;
              5'h02: pos_normal = 16'h1042;
              5'h03: pos_normal = 16'h1043;
              5'h04: pos_normal = 16'h1044;
              5'h05: pos_normal = 16'h1045;
              5'h06: pos_normal = 16'h1046;
              5'h07: pos_normal = 16'h1047;
              5'h08: pos_normal = 16'h1048;
              5'h09: pos_normal = 16'h1049;
              5'h0a: pos_normal = 16'h104a;
              5'h0b: pos_normal = 16'h104b;
              5'h0c: pos_normal = 16'h104c;
              5'h0d: pos_normal = 16'h104d;
              5'h0e: pos_normal = 16'h104e;
              5'h0f: pos_normal = 16'h104f;
              5'h10: pos_normal = 16'h1050;
              5'h11: pos_normal = 16'h1051;
              5'h12: pos_normal = 16'h1052;
              5'h13: pos_normal = 16'h1053;
              5'h14: pos_normal = 16'h1054;
              5'h15: pos_normal = 16'h1055;
              5'h16: pos_normal = 16'h1056;
              5'h17: pos_normal = 16'h1057;
              5'h18: pos_normal = 16'h1058;
              5'h19: pos_normal = 16'h1059;
              5'h1a: pos_normal = 16'h105a;
              5'h1b: pos_normal = 16'h105b;
              5'h1c: pos_normal = 16'h105c;
              5'h1d: pos_normal = 16'h105d;
              5'h1e: pos_normal = 16'h105e;
              5'h1f: pos_normal = 16'h105f;
              default: begin end
            endcase
          end
          5'h03: begin
            pos_normal = 16'h1060;
            case (mant[4:0])
              5'h01: pos_normal = 16'h1061;
              5'h02: pos_normal = 16'h1062;
              5'h03: pos_normal = 16'h1063;
              5'h04: pos_normal = 16'h1064;
              5'h05: pos_normal = 16'h1065;
              5'h06: pos_normal = 16'h1066;
              5'h07: pos_normal = 16'h1067;
              5'h08: pos_normal = 16'h1068;
              5'h09: pos_normal = 16'h1069;
              5'h0a: pos_normal = 16'h106a;
              5'h0b: pos_normal = 16'h106b;
              5'h0c: pos_normal = 16'h106c;
              5'h0d: pos_normal = 16'h106d;
              5'h0e: pos_normal = 16'h106e;
              5'h0f: pos_normal = 16'h106f;
              5'h10: pos_normal = 16'h1070;
              5'h11: pos_normal = 16'h1071;
              5'h12: pos_normal = 16'h1072;
              5'h13: pos_normal = 16'h1073;
              5'h14: pos_normal = 16'h1074;
              5'h15: pos_normal = 16'h1075;
              5'h16: pos_normal = 16'h1076;
              5'h17: pos_normal = 16'h1077;
              5'h18: pos_normal = 16'h1078;
              5'h19: pos_normal = 16'h1079;
              5'h1a: pos_normal = 16'h107a;
              5'h1b: pos_normal = 16'h107b;
              5'h1c: pos_normal = 16'h107c;
              5'h1d: pos_normal = 16'h107d;
              5'h1e: pos_normal = 16'h107e;
              5'h1f: pos_normal = 16'h107f;
              default: begin end
            endcase
          end
          5'h04: begin
            pos_normal = 16'h1080;
            case (mant[4:0])
              5'h01: pos_normal = 16'h1081;
              5'h02: pos_normal = 16'h1082;
              5'h03: pos_normal = 16'h1083;
              5'h04: pos_normal = 16'h1084;
              5'h05: pos_normal = 16'h1085;
              5'h06: pos_normal = 16'h1086;
              5'h07: pos_normal = 16'h1087;
              5'h08: pos_normal = 16'h1088;
              5'h09: pos_normal = 16'h1089;
              5'h0a: pos_normal = 16'h108a;
              5'h0b: pos_normal = 16'h108b;
              5'h0c: pos_normal = 16'h108c;
              5'h0d: pos_normal = 16'h108d;
              5'h0e: pos_normal = 16'h108e;
              5'h0f: pos_normal = 16'h108f;
              5'h10: pos_normal = 16'h1090;
              5'h11: pos_normal = 16'h1091;
              5'h12: pos_normal = 16'h1092;
              5'h13: pos_normal = 16'h1093;
              5'h14: pos_normal = 16'h1094;
              5'h15: pos_normal = 16'h1095;
              5'h16: pos_normal = 16'h1096;
              5'h17: pos_normal = 16'h1097;
              5'h18: pos_normal = 16'h1098;
              5'h19: pos_normal = 16'h1099;
              5'h1a: pos_normal = 16'h109a;
              5'h1b: pos_normal = 16'h109b;
              5'h1c: pos_normal = 16'h109c;
              5'h1d: pos_normal = 16'h109d;
              5'h1e: pos_normal = 16'h109e;
              5'h1f: pos_normal = 16'h109f;
              default: begin end
            endcase
          end
          5'h05: begin
            pos_normal = 16'h10a0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h10a1;
              5'h02: pos_normal = 16'h10a2;
              5'h03: pos_normal = 16'h10a3;
              5'h04: pos_normal = 16'h10a4;
              5'h05: pos_normal = 16'h10a5;
              5'h06: pos_normal = 16'h10a6;
              5'h07: pos_normal = 16'h10a7;
              5'h08: pos_normal = 16'h10a8;
              5'h09: pos_normal = 16'h10a9;
              5'h0a: pos_normal = 16'h10aa;
              5'h0b: pos_normal = 16'h10ab;
              5'h0c: pos_normal = 16'h10ac;
              5'h0d: pos_normal = 16'h10ad;
              5'h0e: pos_normal = 16'h10ae;
              5'h0f: pos_normal = 16'h10af;
              5'h10: pos_normal = 16'h10b0;
              5'h11: pos_normal = 16'h10b1;
              5'h12: pos_normal = 16'h10b2;
              5'h13: pos_normal = 16'h10b3;
              5'h14: pos_normal = 16'h10b4;
              5'h15: pos_normal = 16'h10b5;
              5'h16: pos_normal = 16'h10b6;
              5'h17: pos_normal = 16'h10b7;
              5'h18: pos_normal = 16'h10b8;
              5'h19: pos_normal = 16'h10b9;
              5'h1a: pos_normal = 16'h10ba;
              5'h1b: pos_normal = 16'h10bb;
              5'h1c: pos_normal = 16'h10bc;
              5'h1d: pos_normal = 16'h10bd;
              5'h1e: pos_normal = 16'h10be;
              5'h1f: pos_normal = 16'h10bf;
              default: begin end
            endcase
          end
          5'h06: begin
            pos_normal = 16'h10c0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h10c1;
              5'h02: pos_normal = 16'h10c2;
              5'h03: pos_normal = 16'h10c3;
              5'h04: pos_normal = 16'h10c4;
              5'h05: pos_normal = 16'h10c5;
              5'h06: pos_normal = 16'h10c6;
              5'h07: pos_normal = 16'h10c7;
              5'h08: pos_normal = 16'h10c8;
              5'h09: pos_normal = 16'h10c9;
              5'h0a: pos_normal = 16'h10ca;
              5'h0b: pos_normal = 16'h10cb;
              5'h0c: pos_normal = 16'h10cc;
              5'h0d: pos_normal = 16'h10cd;
              5'h0e: pos_normal = 16'h10ce;
              5'h0f: pos_normal = 16'h10cf;
              5'h10: pos_normal = 16'h10d0;
              5'h11: pos_normal = 16'h10d1;
              5'h12: pos_normal = 16'h10d2;
              5'h13: pos_normal = 16'h10d3;
              5'h14: pos_normal = 16'h10d4;
              5'h15: pos_normal = 16'h10d5;
              5'h16: pos_normal = 16'h10d6;
              5'h17: pos_normal = 16'h10d7;
              5'h18: pos_normal = 16'h10d8;
              5'h19: pos_normal = 16'h10d9;
              5'h1a: pos_normal = 16'h10da;
              5'h1b: pos_normal = 16'h10db;
              5'h1c: pos_normal = 16'h10dc;
              5'h1d: pos_normal = 16'h10dd;
              5'h1e: pos_normal = 16'h10de;
              5'h1f: pos_normal = 16'h10df;
              default: begin end
            endcase
          end
          5'h07: begin
            pos_normal = 16'h10e0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h10e1;
              5'h02: pos_normal = 16'h10e2;
              5'h03: pos_normal = 16'h10e3;
              5'h04: pos_normal = 16'h10e4;
              5'h05: pos_normal = 16'h10e5;
              5'h06: pos_normal = 16'h10e6;
              5'h07: pos_normal = 16'h10e7;
              5'h08: pos_normal = 16'h10e8;
              5'h09: pos_normal = 16'h10e9;
              5'h0a: pos_normal = 16'h10ea;
              5'h0b: pos_normal = 16'h10eb;
              5'h0c: pos_normal = 16'h10ec;
              5'h0d: pos_normal = 16'h10ed;
              5'h0e: pos_normal = 16'h10ee;
              5'h0f: pos_normal = 16'h10ef;
              5'h10: pos_normal = 16'h10f0;
              5'h11: pos_normal = 16'h10f1;
              5'h12: pos_normal = 16'h10f2;
              5'h13: pos_normal = 16'h10f3;
              5'h14: pos_normal = 16'h10f4;
              5'h15: pos_normal = 16'h10f5;
              5'h16: pos_normal = 16'h10f6;
              5'h17: pos_normal = 16'h10f7;
              5'h18: pos_normal = 16'h10f8;
              5'h19: pos_normal = 16'h10f9;
              5'h1a: pos_normal = 16'h10fa;
              5'h1b: pos_normal = 16'h10fb;
              5'h1c: pos_normal = 16'h10fc;
              5'h1d: pos_normal = 16'h10fd;
              5'h1e: pos_normal = 16'h10fe;
              5'h1f: pos_normal = 16'h10ff;
              default: begin end
            endcase
          end
          5'h08: begin
            pos_normal = 16'h1100;
            case (mant[4:0])
              5'h01: pos_normal = 16'h1101;
              5'h02: pos_normal = 16'h1102;
              5'h03: pos_normal = 16'h1103;
              5'h04: pos_normal = 16'h1104;
              5'h05: pos_normal = 16'h1105;
              5'h06: pos_normal = 16'h1106;
              5'h07: pos_normal = 16'h1107;
              5'h08: pos_normal = 16'h1108;
              5'h09: pos_normal = 16'h1109;
              5'h0a: pos_normal = 16'h110a;
              5'h0b: pos_normal = 16'h110b;
              5'h0c: pos_normal = 16'h110c;
              5'h0d: pos_normal = 16'h110d;
              5'h0e: pos_normal = 16'h110e;
              5'h0f: pos_normal = 16'h110f;
              5'h10: pos_normal = 16'h1110;
              5'h11: pos_normal = 16'h1111;
              5'h12: pos_normal = 16'h1112;
              5'h13: pos_normal = 16'h1113;
              5'h14: pos_normal = 16'h1114;
              5'h15: pos_normal = 16'h1115;
              5'h16: pos_normal = 16'h1116;
              5'h17: pos_normal = 16'h1117;
              5'h18: pos_normal = 16'h1118;
              5'h19: pos_normal = 16'h1119;
              5'h1a: pos_normal = 16'h111a;
              5'h1b: pos_normal = 16'h111b;
              5'h1c: pos_normal = 16'h111c;
              5'h1d: pos_normal = 16'h111d;
              5'h1e: pos_normal = 16'h111e;
              5'h1f: pos_normal = 16'h111f;
              default: begin end
            endcase
          end
          5'h09: begin
            pos_normal = 16'h1120;
            case (mant[4:0])
              5'h01: pos_normal = 16'h1121;
              5'h02: pos_normal = 16'h1122;
              5'h03: pos_normal = 16'h1123;
              5'h04: pos_normal = 16'h1124;
              5'h05: pos_normal = 16'h1125;
              5'h06: pos_normal = 16'h1126;
              5'h07: pos_normal = 16'h1127;
              5'h08: pos_normal = 16'h1128;
              5'h09: pos_normal = 16'h1129;
              5'h0a: pos_normal = 16'h112a;
              5'h0b: pos_normal = 16'h112b;
              5'h0c: pos_normal = 16'h112c;
              5'h0d: pos_normal = 16'h112d;
              5'h0e: pos_normal = 16'h112e;
              5'h0f: pos_normal = 16'h112f;
              5'h10: pos_normal = 16'h1130;
              5'h11: pos_normal = 16'h1131;
              5'h12: pos_normal = 16'h1132;
              5'h13: pos_normal = 16'h1133;
              5'h14: pos_normal = 16'h1134;
              5'h15: pos_normal = 16'h1135;
              5'h16: pos_normal = 16'h1136;
              5'h17: pos_normal = 16'h1137;
              5'h18: pos_normal = 16'h1138;
              5'h19: pos_normal = 16'h1139;
              5'h1a: pos_normal = 16'h113a;
              5'h1b: pos_normal = 16'h113b;
              5'h1c: pos_normal = 16'h113c;
              5'h1d: pos_normal = 16'h113d;
              5'h1e: pos_normal = 16'h113e;
              5'h1f: pos_normal = 16'h113f;
              default: begin end
            endcase
          end
          5'h0a: begin
            pos_normal = 16'h1140;
            case (mant[4:0])
              5'h01: pos_normal = 16'h1141;
              5'h02: pos_normal = 16'h1142;
              5'h03: pos_normal = 16'h1143;
              5'h04: pos_normal = 16'h1144;
              5'h05: pos_normal = 16'h1145;
              5'h06: pos_normal = 16'h1146;
              5'h07: pos_normal = 16'h1147;
              5'h08: pos_normal = 16'h1148;
              5'h09: pos_normal = 16'h1149;
              5'h0a: pos_normal = 16'h114a;
              5'h0b: pos_normal = 16'h114b;
              5'h0c: pos_normal = 16'h114c;
              5'h0d: pos_normal = 16'h114d;
              5'h0e: pos_normal = 16'h114e;
              5'h0f: pos_normal = 16'h114f;
              5'h10: pos_normal = 16'h1150;
              5'h11: pos_normal = 16'h1151;
              5'h12: pos_normal = 16'h1152;
              5'h13: pos_normal = 16'h1153;
              5'h14: pos_normal = 16'h1154;
              5'h15: pos_normal = 16'h1155;
              5'h16: pos_normal = 16'h1156;
              5'h17: pos_normal = 16'h1157;
              5'h18: pos_normal = 16'h1158;
              5'h19: pos_normal = 16'h1159;
              5'h1a: pos_normal = 16'h115a;
              5'h1b: pos_normal = 16'h115b;
              5'h1c: pos_normal = 16'h115c;
              5'h1d: pos_normal = 16'h115d;
              5'h1e: pos_normal = 16'h115e;
              5'h1f: pos_normal = 16'h115f;
              default: begin end
            endcase
          end
          5'h0b: begin
            pos_normal = 16'h1160;
            case (mant[4:0])
              5'h01: pos_normal = 16'h1161;
              5'h02: pos_normal = 16'h1162;
              5'h03: pos_normal = 16'h1163;
              5'h04: pos_normal = 16'h1164;
              5'h05: pos_normal = 16'h1165;
              5'h06: pos_normal = 16'h1166;
              5'h07: pos_normal = 16'h1167;
              5'h08: pos_normal = 16'h1168;
              5'h09: pos_normal = 16'h1169;
              5'h0a: pos_normal = 16'h116a;
              5'h0b: pos_normal = 16'h116b;
              5'h0c: pos_normal = 16'h116c;
              5'h0d: pos_normal = 16'h116d;
              5'h0e: pos_normal = 16'h116e;
              5'h0f: pos_normal = 16'h116f;
              5'h10: pos_normal = 16'h1170;
              5'h11: pos_normal = 16'h1171;
              5'h12: pos_normal = 16'h1172;
              5'h13: pos_normal = 16'h1173;
              5'h14: pos_normal = 16'h1174;
              5'h15: pos_normal = 16'h1175;
              5'h16: pos_normal = 16'h1176;
              5'h17: pos_normal = 16'h1177;
              5'h18: pos_normal = 16'h1178;
              5'h19: pos_normal = 16'h1179;
              5'h1a: pos_normal = 16'h117a;
              5'h1b: pos_normal = 16'h117b;
              5'h1c: pos_normal = 16'h117c;
              5'h1d: pos_normal = 16'h117d;
              5'h1e: pos_normal = 16'h117e;
              5'h1f: pos_normal = 16'h117f;
              default: begin end
            endcase
          end
          5'h0c: begin
            pos_normal = 16'h1180;
            case (mant[4:0])
              5'h01: pos_normal = 16'h1181;
              5'h02: pos_normal = 16'h1182;
              5'h03: pos_normal = 16'h1183;
              5'h04: pos_normal = 16'h1184;
              5'h05: pos_normal = 16'h1185;
              5'h06: pos_normal = 16'h1186;
              5'h07: pos_normal = 16'h1187;
              5'h08: pos_normal = 16'h1188;
              5'h09: pos_normal = 16'h1189;
              5'h0a: pos_normal = 16'h118a;
              5'h0b: pos_normal = 16'h118b;
              5'h0c: pos_normal = 16'h118c;
              5'h0d: pos_normal = 16'h118d;
              5'h0e: pos_normal = 16'h118e;
              5'h0f: pos_normal = 16'h118f;
              5'h10: pos_normal = 16'h1190;
              5'h11: pos_normal = 16'h1191;
              5'h12: pos_normal = 16'h1192;
              5'h13: pos_normal = 16'h1193;
              5'h14: pos_normal = 16'h1194;
              5'h15: pos_normal = 16'h1195;
              5'h16: pos_normal = 16'h1196;
              5'h17: pos_normal = 16'h1197;
              5'h18: pos_normal = 16'h1198;
              5'h19: pos_normal = 16'h1199;
              5'h1a: pos_normal = 16'h119a;
              5'h1b: pos_normal = 16'h119b;
              5'h1c: pos_normal = 16'h119c;
              5'h1d: pos_normal = 16'h119d;
              5'h1e: pos_normal = 16'h119e;
              5'h1f: pos_normal = 16'h119f;
              default: begin end
            endcase
          end
          5'h0d: begin
            pos_normal = 16'h11a0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h11a1;
              5'h02: pos_normal = 16'h11a2;
              5'h03: pos_normal = 16'h11a3;
              5'h04: pos_normal = 16'h11a4;
              5'h05: pos_normal = 16'h11a5;
              5'h06: pos_normal = 16'h11a6;
              5'h07: pos_normal = 16'h11a7;
              5'h08: pos_normal = 16'h11a8;
              5'h09: pos_normal = 16'h11a9;
              5'h0a: pos_normal = 16'h11aa;
              5'h0b: pos_normal = 16'h11ab;
              5'h0c: pos_normal = 16'h11ac;
              5'h0d: pos_normal = 16'h11ad;
              5'h0e: pos_normal = 16'h11ae;
              5'h0f: pos_normal = 16'h11af;
              5'h10: pos_normal = 16'h11b0;
              5'h11: pos_normal = 16'h11b1;
              5'h12: pos_normal = 16'h11b2;
              5'h13: pos_normal = 16'h11b3;
              5'h14: pos_normal = 16'h11b4;
              5'h15: pos_normal = 16'h11b5;
              5'h16: pos_normal = 16'h11b6;
              5'h17: pos_normal = 16'h11b7;
              5'h18: pos_normal = 16'h11b8;
              5'h19: pos_normal = 16'h11b9;
              5'h1a: pos_normal = 16'h11ba;
              5'h1b: pos_normal = 16'h11bb;
              5'h1c: pos_normal = 16'h11bc;
              5'h1d: pos_normal = 16'h11bd;
              5'h1e: pos_normal = 16'h11be;
              5'h1f: pos_normal = 16'h11bf;
              default: begin end
            endcase
          end
          5'h0e: begin
            pos_normal = 16'h11c0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h11c1;
              5'h02: pos_normal = 16'h11c2;
              5'h03: pos_normal = 16'h11c3;
              5'h04: pos_normal = 16'h11c4;
              5'h05: pos_normal = 16'h11c5;
              5'h06: pos_normal = 16'h11c6;
              5'h07: pos_normal = 16'h11c7;
              5'h08: pos_normal = 16'h11c8;
              5'h09: pos_normal = 16'h11c9;
              5'h0a: pos_normal = 16'h11ca;
              5'h0b: pos_normal = 16'h11cb;
              5'h0c: pos_normal = 16'h11cc;
              5'h0d: pos_normal = 16'h11cd;
              5'h0e: pos_normal = 16'h11ce;
              5'h0f: pos_normal = 16'h11cf;
              5'h10: pos_normal = 16'h11d0;
              5'h11: pos_normal = 16'h11d1;
              5'h12: pos_normal = 16'h11d2;
              5'h13: pos_normal = 16'h11d3;
              5'h14: pos_normal = 16'h11d4;
              5'h15: pos_normal = 16'h11d5;
              5'h16: pos_normal = 16'h11d6;
              5'h17: pos_normal = 16'h11d7;
              5'h18: pos_normal = 16'h11d8;
              5'h19: pos_normal = 16'h11d9;
              5'h1a: pos_normal = 16'h11da;
              5'h1b: pos_normal = 16'h11db;
              5'h1c: pos_normal = 16'h11dc;
              5'h1d: pos_normal = 16'h11dd;
              5'h1e: pos_normal = 16'h11de;
              5'h1f: pos_normal = 16'h11df;
              default: begin end
            endcase
          end
          5'h0f: begin
            pos_normal = 16'h11e0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h11e1;
              5'h02: pos_normal = 16'h11e2;
              5'h03: pos_normal = 16'h11e3;
              5'h04: pos_normal = 16'h11e4;
              5'h05: pos_normal = 16'h11e5;
              5'h06: pos_normal = 16'h11e6;
              5'h07: pos_normal = 16'h11e7;
              5'h08: pos_normal = 16'h11e8;
              5'h09: pos_normal = 16'h11e9;
              5'h0a: pos_normal = 16'h11ea;
              5'h0b: pos_normal = 16'h11eb;
              5'h0c: pos_normal = 16'h11ec;
              5'h0d: pos_normal = 16'h11ed;
              5'h0e: pos_normal = 16'h11ee;
              5'h0f: pos_normal = 16'h11ef;
              5'h10: pos_normal = 16'h11f0;
              5'h11: pos_normal = 16'h11f1;
              5'h12: pos_normal = 16'h11f2;
              5'h13: pos_normal = 16'h11f3;
              5'h14: pos_normal = 16'h11f4;
              5'h15: pos_normal = 16'h11f5;
              5'h16: pos_normal = 16'h11f6;
              5'h17: pos_normal = 16'h11f7;
              5'h18: pos_normal = 16'h11f8;
              5'h19: pos_normal = 16'h11f9;
              5'h1a: pos_normal = 16'h11fa;
              5'h1b: pos_normal = 16'h11fb;
              5'h1c: pos_normal = 16'h11fc;
              5'h1d: pos_normal = 16'h11fd;
              5'h1e: pos_normal = 16'h11fe;
              5'h1f: pos_normal = 16'h11ff;
              default: begin end
            endcase
          end
          5'h10: begin
            pos_normal = 16'h1200;
            case (mant[4:0])
              5'h01: pos_normal = 16'h1201;
              5'h02: pos_normal = 16'h1202;
              5'h03: pos_normal = 16'h1203;
              5'h04: pos_normal = 16'h1204;
              5'h05: pos_normal = 16'h1205;
              5'h06: pos_normal = 16'h1206;
              5'h07: pos_normal = 16'h1207;
              5'h08: pos_normal = 16'h1208;
              5'h09: pos_normal = 16'h1209;
              5'h0a: pos_normal = 16'h120a;
              5'h0b: pos_normal = 16'h120b;
              5'h0c: pos_normal = 16'h120c;
              5'h0d: pos_normal = 16'h120d;
              5'h0e: pos_normal = 16'h120e;
              5'h0f: pos_normal = 16'h120f;
              5'h10: pos_normal = 16'h1210;
              5'h11: pos_normal = 16'h1211;
              5'h12: pos_normal = 16'h1212;
              5'h13: pos_normal = 16'h1213;
              5'h14: pos_normal = 16'h1214;
              5'h15: pos_normal = 16'h1215;
              5'h16: pos_normal = 16'h1216;
              5'h17: pos_normal = 16'h1217;
              5'h18: pos_normal = 16'h1218;
              5'h19: pos_normal = 16'h1219;
              5'h1a: pos_normal = 16'h121a;
              5'h1b: pos_normal = 16'h121b;
              5'h1c: pos_normal = 16'h121c;
              5'h1d: pos_normal = 16'h121d;
              5'h1e: pos_normal = 16'h121e;
              5'h1f: pos_normal = 16'h121f;
              default: begin end
            endcase
          end
          5'h11: begin
            pos_normal = 16'h1220;
            case (mant[4:0])
              5'h01: pos_normal = 16'h1221;
              5'h02: pos_normal = 16'h1222;
              5'h03: pos_normal = 16'h1223;
              5'h04: pos_normal = 16'h1224;
              5'h05: pos_normal = 16'h1225;
              5'h06: pos_normal = 16'h1226;
              5'h07: pos_normal = 16'h1227;
              5'h08: pos_normal = 16'h1228;
              5'h09: pos_normal = 16'h1229;
              5'h0a: pos_normal = 16'h122a;
              5'h0b: pos_normal = 16'h122b;
              5'h0c: pos_normal = 16'h122c;
              5'h0d: pos_normal = 16'h122d;
              5'h0e: pos_normal = 16'h122e;
              5'h0f: pos_normal = 16'h122f;
              5'h10: pos_normal = 16'h1230;
              5'h11: pos_normal = 16'h1231;
              5'h12: pos_normal = 16'h1232;
              5'h13: pos_normal = 16'h1233;
              5'h14: pos_normal = 16'h1234;
              5'h15: pos_normal = 16'h1235;
              5'h16: pos_normal = 16'h1236;
              5'h17: pos_normal = 16'h1237;
              5'h18: pos_normal = 16'h1238;
              5'h19: pos_normal = 16'h1239;
              5'h1a: pos_normal = 16'h123a;
              5'h1b: pos_normal = 16'h123b;
              5'h1c: pos_normal = 16'h123c;
              5'h1d: pos_normal = 16'h123d;
              5'h1e: pos_normal = 16'h123e;
              5'h1f: pos_normal = 16'h123f;
              default: begin end
            endcase
          end
          5'h12: begin
            pos_normal = 16'h1240;
            case (mant[4:0])
              5'h01: pos_normal = 16'h1241;
              5'h02: pos_normal = 16'h1242;
              5'h03: pos_normal = 16'h1243;
              5'h04: pos_normal = 16'h1244;
              5'h05: pos_normal = 16'h1245;
              5'h06: pos_normal = 16'h1246;
              5'h07: pos_normal = 16'h1247;
              5'h08: pos_normal = 16'h1248;
              5'h09: pos_normal = 16'h1249;
              5'h0a: pos_normal = 16'h124a;
              5'h0b: pos_normal = 16'h124b;
              5'h0c: pos_normal = 16'h124c;
              5'h0d: pos_normal = 16'h124d;
              5'h0e: pos_normal = 16'h124e;
              5'h0f: pos_normal = 16'h124f;
              5'h10: pos_normal = 16'h1250;
              5'h11: pos_normal = 16'h1251;
              5'h12: pos_normal = 16'h1252;
              5'h13: pos_normal = 16'h1253;
              5'h14: pos_normal = 16'h1254;
              5'h15: pos_normal = 16'h1255;
              5'h16: pos_normal = 16'h1256;
              5'h17: pos_normal = 16'h1257;
              5'h18: pos_normal = 16'h1258;
              5'h19: pos_normal = 16'h1259;
              5'h1a: pos_normal = 16'h125a;
              5'h1b: pos_normal = 16'h125b;
              5'h1c: pos_normal = 16'h125c;
              5'h1d: pos_normal = 16'h125d;
              5'h1e: pos_normal = 16'h125e;
              5'h1f: pos_normal = 16'h125f;
              default: begin end
            endcase
          end
          5'h13: begin
            pos_normal = 16'h1260;
            case (mant[4:0])
              5'h01: pos_normal = 16'h1261;
              5'h02: pos_normal = 16'h1262;
              5'h03: pos_normal = 16'h1263;
              5'h04: pos_normal = 16'h1264;
              5'h05: pos_normal = 16'h1265;
              5'h06: pos_normal = 16'h1266;
              5'h07: pos_normal = 16'h1267;
              5'h08: pos_normal = 16'h1268;
              5'h09: pos_normal = 16'h1269;
              5'h0a: pos_normal = 16'h126a;
              5'h0b: pos_normal = 16'h126b;
              5'h0c: pos_normal = 16'h126c;
              5'h0d: pos_normal = 16'h126d;
              5'h0e: pos_normal = 16'h126e;
              5'h0f: pos_normal = 16'h126f;
              5'h10: pos_normal = 16'h1270;
              5'h11: pos_normal = 16'h1271;
              5'h12: pos_normal = 16'h1272;
              5'h13: pos_normal = 16'h1273;
              5'h14: pos_normal = 16'h1274;
              5'h15: pos_normal = 16'h1275;
              5'h16: pos_normal = 16'h1276;
              5'h17: pos_normal = 16'h1277;
              5'h18: pos_normal = 16'h1278;
              5'h19: pos_normal = 16'h1279;
              5'h1a: pos_normal = 16'h127a;
              5'h1b: pos_normal = 16'h127b;
              5'h1c: pos_normal = 16'h127c;
              5'h1d: pos_normal = 16'h127d;
              5'h1e: pos_normal = 16'h127e;
              5'h1f: pos_normal = 16'h127f;
              default: begin end
            endcase
          end
          5'h14: begin
            pos_normal = 16'h1280;
            case (mant[4:0])
              5'h01: pos_normal = 16'h1281;
              5'h02: pos_normal = 16'h1282;
              5'h03: pos_normal = 16'h1283;
              5'h04: pos_normal = 16'h1284;
              5'h05: pos_normal = 16'h1285;
              5'h06: pos_normal = 16'h1286;
              5'h07: pos_normal = 16'h1287;
              5'h08: pos_normal = 16'h1288;
              5'h09: pos_normal = 16'h1289;
              5'h0a: pos_normal = 16'h128a;
              5'h0b: pos_normal = 16'h128b;
              5'h0c: pos_normal = 16'h128c;
              5'h0d: pos_normal = 16'h128d;
              5'h0e: pos_normal = 16'h128e;
              5'h0f: pos_normal = 16'h128f;
              5'h10: pos_normal = 16'h1290;
              5'h11: pos_normal = 16'h1291;
              5'h12: pos_normal = 16'h1292;
              5'h13: pos_normal = 16'h1293;
              5'h14: pos_normal = 16'h1294;
              5'h15: pos_normal = 16'h1295;
              5'h16: pos_normal = 16'h1296;
              5'h17: pos_normal = 16'h1297;
              5'h18: pos_normal = 16'h1298;
              5'h19: pos_normal = 16'h1299;
              5'h1a: pos_normal = 16'h129a;
              5'h1b: pos_normal = 16'h129b;
              5'h1c: pos_normal = 16'h129c;
              5'h1d: pos_normal = 16'h129d;
              5'h1e: pos_normal = 16'h129e;
              5'h1f: pos_normal = 16'h129f;
              default: begin end
            endcase
          end
          5'h15: begin
            pos_normal = 16'h12a0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h12a1;
              5'h02: pos_normal = 16'h12a2;
              5'h03: pos_normal = 16'h12a3;
              5'h04: pos_normal = 16'h12a4;
              5'h05: pos_normal = 16'h12a5;
              5'h06: pos_normal = 16'h12a6;
              5'h07: pos_normal = 16'h12a7;
              5'h08: pos_normal = 16'h12a8;
              5'h09: pos_normal = 16'h12a9;
              5'h0a: pos_normal = 16'h12aa;
              5'h0b: pos_normal = 16'h12ab;
              5'h0c: pos_normal = 16'h12ac;
              5'h0d: pos_normal = 16'h12ad;
              5'h0e: pos_normal = 16'h12ae;
              5'h0f: pos_normal = 16'h12af;
              5'h10: pos_normal = 16'h12b0;
              5'h11: pos_normal = 16'h12b1;
              5'h12: pos_normal = 16'h12b2;
              5'h13: pos_normal = 16'h12b3;
              5'h14: pos_normal = 16'h12b4;
              5'h15: pos_normal = 16'h12b5;
              5'h16: pos_normal = 16'h12b6;
              5'h17: pos_normal = 16'h12b7;
              5'h18: pos_normal = 16'h12b8;
              5'h19: pos_normal = 16'h12b9;
              5'h1a: pos_normal = 16'h12ba;
              5'h1b: pos_normal = 16'h12bb;
              5'h1c: pos_normal = 16'h12bc;
              5'h1d: pos_normal = 16'h12bd;
              5'h1e: pos_normal = 16'h12be;
              5'h1f: pos_normal = 16'h12bf;
              default: begin end
            endcase
          end
          5'h16: begin
            pos_normal = 16'h12c0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h12c1;
              5'h02: pos_normal = 16'h12c2;
              5'h03: pos_normal = 16'h12c3;
              5'h04: pos_normal = 16'h12c4;
              5'h05: pos_normal = 16'h12c5;
              5'h06: pos_normal = 16'h12c6;
              5'h07: pos_normal = 16'h12c7;
              5'h08: pos_normal = 16'h12c8;
              5'h09: pos_normal = 16'h12c9;
              5'h0a: pos_normal = 16'h12ca;
              5'h0b: pos_normal = 16'h12cb;
              5'h0c: pos_normal = 16'h12cc;
              5'h0d: pos_normal = 16'h12cd;
              5'h0e: pos_normal = 16'h12ce;
              5'h0f: pos_normal = 16'h12cf;
              5'h10: pos_normal = 16'h12d0;
              5'h11: pos_normal = 16'h12d1;
              5'h12: pos_normal = 16'h12d2;
              5'h13: pos_normal = 16'h12d3;
              5'h14: pos_normal = 16'h12d4;
              5'h15: pos_normal = 16'h12d5;
              5'h16: pos_normal = 16'h12d6;
              5'h17: pos_normal = 16'h12d7;
              5'h18: pos_normal = 16'h12d8;
              5'h19: pos_normal = 16'h12d9;
              5'h1a: pos_normal = 16'h12da;
              5'h1b: pos_normal = 16'h12db;
              5'h1c: pos_normal = 16'h12dc;
              5'h1d: pos_normal = 16'h12dd;
              5'h1e: pos_normal = 16'h12de;
              5'h1f: pos_normal = 16'h12df;
              default: begin end
            endcase
          end
          5'h17: begin
            pos_normal = 16'h12e0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h12e1;
              5'h02: pos_normal = 16'h12e2;
              5'h03: pos_normal = 16'h12e3;
              5'h04: pos_normal = 16'h12e4;
              5'h05: pos_normal = 16'h12e5;
              5'h06: pos_normal = 16'h12e6;
              5'h07: pos_normal = 16'h12e7;
              5'h08: pos_normal = 16'h12e8;
              5'h09: pos_normal = 16'h12e9;
              5'h0a: pos_normal = 16'h12ea;
              5'h0b: pos_normal = 16'h12eb;
              5'h0c: pos_normal = 16'h12ec;
              5'h0d: pos_normal = 16'h12ed;
              5'h0e: pos_normal = 16'h12ee;
              5'h0f: pos_normal = 16'h12ef;
              5'h10: pos_normal = 16'h12f0;
              5'h11: pos_normal = 16'h12f1;
              5'h12: pos_normal = 16'h12f2;
              5'h13: pos_normal = 16'h12f3;
              5'h14: pos_normal = 16'h12f4;
              5'h15: pos_normal = 16'h12f5;
              5'h16: pos_normal = 16'h12f6;
              5'h17: pos_normal = 16'h12f7;
              5'h18: pos_normal = 16'h12f8;
              5'h19: pos_normal = 16'h12f9;
              5'h1a: pos_normal = 16'h12fa;
              5'h1b: pos_normal = 16'h12fb;
              5'h1c: pos_normal = 16'h12fc;
              5'h1d: pos_normal = 16'h12fd;
              5'h1e: pos_normal = 16'h12fe;
              5'h1f: pos_normal = 16'h12ff;
              default: begin end
            endcase
          end
          5'h18: begin
            pos_normal = 16'h1300;
            case (mant[4:0])
              5'h01: pos_normal = 16'h1301;
              5'h02: pos_normal = 16'h1302;
              5'h03: pos_normal = 16'h1303;
              5'h04: pos_normal = 16'h1304;
              5'h05: pos_normal = 16'h1305;
              5'h06: pos_normal = 16'h1306;
              5'h07: pos_normal = 16'h1307;
              5'h08: pos_normal = 16'h1308;
              5'h09: pos_normal = 16'h1309;
              5'h0a: pos_normal = 16'h130a;
              5'h0b: pos_normal = 16'h130b;
              5'h0c: pos_normal = 16'h130c;
              5'h0d: pos_normal = 16'h130d;
              5'h0e: pos_normal = 16'h130e;
              5'h0f: pos_normal = 16'h130f;
              5'h10: pos_normal = 16'h1310;
              5'h11: pos_normal = 16'h1311;
              5'h12: pos_normal = 16'h1312;
              5'h13: pos_normal = 16'h1313;
              5'h14: pos_normal = 16'h1314;
              5'h15: pos_normal = 16'h1315;
              5'h16: pos_normal = 16'h1316;
              5'h17: pos_normal = 16'h1317;
              5'h18: pos_normal = 16'h1318;
              5'h19: pos_normal = 16'h1319;
              5'h1a: pos_normal = 16'h131a;
              5'h1b: pos_normal = 16'h131b;
              5'h1c: pos_normal = 16'h131c;
              5'h1d: pos_normal = 16'h131d;
              5'h1e: pos_normal = 16'h131e;
              5'h1f: pos_normal = 16'h131f;
              default: begin end
            endcase
          end
          5'h19: begin
            pos_normal = 16'h1320;
            case (mant[4:0])
              5'h01: pos_normal = 16'h1321;
              5'h02: pos_normal = 16'h1322;
              5'h03: pos_normal = 16'h1323;
              5'h04: pos_normal = 16'h1324;
              5'h05: pos_normal = 16'h1325;
              5'h06: pos_normal = 16'h1326;
              5'h07: pos_normal = 16'h1327;
              5'h08: pos_normal = 16'h1328;
              5'h09: pos_normal = 16'h1329;
              5'h0a: pos_normal = 16'h132a;
              5'h0b: pos_normal = 16'h132b;
              5'h0c: pos_normal = 16'h132c;
              5'h0d: pos_normal = 16'h132d;
              5'h0e: pos_normal = 16'h132e;
              5'h0f: pos_normal = 16'h132f;
              5'h10: pos_normal = 16'h1330;
              5'h11: pos_normal = 16'h1331;
              5'h12: pos_normal = 16'h1332;
              5'h13: pos_normal = 16'h1333;
              5'h14: pos_normal = 16'h1334;
              5'h15: pos_normal = 16'h1335;
              5'h16: pos_normal = 16'h1336;
              5'h17: pos_normal = 16'h1337;
              5'h18: pos_normal = 16'h1338;
              5'h19: pos_normal = 16'h1339;
              5'h1a: pos_normal = 16'h133a;
              5'h1b: pos_normal = 16'h133b;
              5'h1c: pos_normal = 16'h133c;
              5'h1d: pos_normal = 16'h133d;
              5'h1e: pos_normal = 16'h133e;
              5'h1f: pos_normal = 16'h133f;
              default: begin end
            endcase
          end
          5'h1a: begin
            pos_normal = 16'h1340;
            case (mant[4:0])
              5'h01: pos_normal = 16'h1341;
              5'h02: pos_normal = 16'h1342;
              5'h03: pos_normal = 16'h1343;
              5'h04: pos_normal = 16'h1344;
              5'h05: pos_normal = 16'h1345;
              5'h06: pos_normal = 16'h1346;
              5'h07: pos_normal = 16'h1347;
              5'h08: pos_normal = 16'h1348;
              5'h09: pos_normal = 16'h1349;
              5'h0a: pos_normal = 16'h134a;
              5'h0b: pos_normal = 16'h134b;
              5'h0c: pos_normal = 16'h134c;
              5'h0d: pos_normal = 16'h134d;
              5'h0e: pos_normal = 16'h134e;
              5'h0f: pos_normal = 16'h134f;
              5'h10: pos_normal = 16'h1350;
              5'h11: pos_normal = 16'h1351;
              5'h12: pos_normal = 16'h1352;
              5'h13: pos_normal = 16'h1353;
              5'h14: pos_normal = 16'h1354;
              5'h15: pos_normal = 16'h1355;
              5'h16: pos_normal = 16'h1356;
              5'h17: pos_normal = 16'h1357;
              5'h18: pos_normal = 16'h1358;
              5'h19: pos_normal = 16'h1359;
              5'h1a: pos_normal = 16'h135a;
              5'h1b: pos_normal = 16'h135b;
              5'h1c: pos_normal = 16'h135c;
              5'h1d: pos_normal = 16'h135d;
              5'h1e: pos_normal = 16'h135e;
              5'h1f: pos_normal = 16'h135f;
              default: begin end
            endcase
          end
          5'h1b: begin
            pos_normal = 16'h1360;
            case (mant[4:0])
              5'h01: pos_normal = 16'h1361;
              5'h02: pos_normal = 16'h1362;
              5'h03: pos_normal = 16'h1363;
              5'h04: pos_normal = 16'h1364;
              5'h05: pos_normal = 16'h1365;
              5'h06: pos_normal = 16'h1366;
              5'h07: pos_normal = 16'h1367;
              5'h08: pos_normal = 16'h1368;
              5'h09: pos_normal = 16'h1369;
              5'h0a: pos_normal = 16'h136a;
              5'h0b: pos_normal = 16'h136b;
              5'h0c: pos_normal = 16'h136c;
              5'h0d: pos_normal = 16'h136d;
              5'h0e: pos_normal = 16'h136e;
              5'h0f: pos_normal = 16'h136f;
              5'h10: pos_normal = 16'h1370;
              5'h11: pos_normal = 16'h1371;
              5'h12: pos_normal = 16'h1372;
              5'h13: pos_normal = 16'h1373;
              5'h14: pos_normal = 16'h1374;
              5'h15: pos_normal = 16'h1375;
              5'h16: pos_normal = 16'h1376;
              5'h17: pos_normal = 16'h1377;
              5'h18: pos_normal = 16'h1378;
              5'h19: pos_normal = 16'h1379;
              5'h1a: pos_normal = 16'h137a;
              5'h1b: pos_normal = 16'h137b;
              5'h1c: pos_normal = 16'h137c;
              5'h1d: pos_normal = 16'h137d;
              5'h1e: pos_normal = 16'h137e;
              5'h1f: pos_normal = 16'h137f;
              default: begin end
            endcase
          end
          5'h1c: begin
            pos_normal = 16'h1380;
            case (mant[4:0])
              5'h01: pos_normal = 16'h1381;
              5'h02: pos_normal = 16'h1382;
              5'h03: pos_normal = 16'h1383;
              5'h04: pos_normal = 16'h1384;
              5'h05: pos_normal = 16'h1385;
              5'h06: pos_normal = 16'h1386;
              5'h07: pos_normal = 16'h1387;
              5'h08: pos_normal = 16'h1388;
              5'h09: pos_normal = 16'h1389;
              5'h0a: pos_normal = 16'h138a;
              5'h0b: pos_normal = 16'h138b;
              5'h0c: pos_normal = 16'h138c;
              5'h0d: pos_normal = 16'h138d;
              5'h0e: pos_normal = 16'h138e;
              5'h0f: pos_normal = 16'h138f;
              5'h10: pos_normal = 16'h1390;
              5'h11: pos_normal = 16'h1391;
              5'h12: pos_normal = 16'h1392;
              5'h13: pos_normal = 16'h1393;
              5'h14: pos_normal = 16'h1394;
              5'h15: pos_normal = 16'h1395;
              5'h16: pos_normal = 16'h1396;
              5'h17: pos_normal = 16'h1397;
              5'h18: pos_normal = 16'h1398;
              5'h19: pos_normal = 16'h1399;
              5'h1a: pos_normal = 16'h139a;
              5'h1b: pos_normal = 16'h139b;
              5'h1c: pos_normal = 16'h139c;
              5'h1d: pos_normal = 16'h139d;
              5'h1e: pos_normal = 16'h139e;
              5'h1f: pos_normal = 16'h139f;
              default: begin end
            endcase
          end
          5'h1d: begin
            pos_normal = 16'h13a0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h13a1;
              5'h02: pos_normal = 16'h13a2;
              5'h03: pos_normal = 16'h13a3;
              5'h04: pos_normal = 16'h13a4;
              5'h05: pos_normal = 16'h13a5;
              5'h06: pos_normal = 16'h13a6;
              5'h07: pos_normal = 16'h13a7;
              5'h08: pos_normal = 16'h13a8;
              5'h09: pos_normal = 16'h13a9;
              5'h0a: pos_normal = 16'h13aa;
              5'h0b: pos_normal = 16'h13ab;
              5'h0c: pos_normal = 16'h13ac;
              5'h0d: pos_normal = 16'h13ad;
              5'h0e: pos_normal = 16'h13ae;
              5'h0f: pos_normal = 16'h13af;
              5'h10: pos_normal = 16'h13b0;
              5'h11: pos_normal = 16'h13b1;
              5'h12: pos_normal = 16'h13b2;
              5'h13: pos_normal = 16'h13b3;
              5'h14: pos_normal = 16'h13b4;
              5'h15: pos_normal = 16'h13b5;
              5'h16: pos_normal = 16'h13b6;
              5'h17: pos_normal = 16'h13b7;
              5'h18: pos_normal = 16'h13b8;
              5'h19: pos_normal = 16'h13b9;
              5'h1a: pos_normal = 16'h13ba;
              5'h1b: pos_normal = 16'h13bb;
              5'h1c: pos_normal = 16'h13bc;
              5'h1d: pos_normal = 16'h13bd;
              5'h1e: pos_normal = 16'h13be;
              5'h1f: pos_normal = 16'h13bf;
              default: begin end
            endcase
          end
          5'h1e: begin
            pos_normal = 16'h13c0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h13c1;
              5'h02: pos_normal = 16'h13c2;
              5'h03: pos_normal = 16'h13c3;
              5'h04: pos_normal = 16'h13c4;
              5'h05: pos_normal = 16'h13c5;
              5'h06: pos_normal = 16'h13c6;
              5'h07: pos_normal = 16'h13c7;
              5'h08: pos_normal = 16'h13c8;
              5'h09: pos_normal = 16'h13c9;
              5'h0a: pos_normal = 16'h13ca;
              5'h0b: pos_normal = 16'h13cb;
              5'h0c: pos_normal = 16'h13cc;
              5'h0d: pos_normal = 16'h13cd;
              5'h0e: pos_normal = 16'h13ce;
              5'h0f: pos_normal = 16'h13cf;
              5'h10: pos_normal = 16'h13d0;
              5'h11: pos_normal = 16'h13d1;
              5'h12: pos_normal = 16'h13d2;
              5'h13: pos_normal = 16'h13d3;
              5'h14: pos_normal = 16'h13d4;
              5'h15: pos_normal = 16'h13d5;
              5'h16: pos_normal = 16'h13d6;
              5'h17: pos_normal = 16'h13d7;
              5'h18: pos_normal = 16'h13d8;
              5'h19: pos_normal = 16'h13d9;
              5'h1a: pos_normal = 16'h13da;
              5'h1b: pos_normal = 16'h13db;
              5'h1c: pos_normal = 16'h13dc;
              5'h1d: pos_normal = 16'h13dd;
              5'h1e: pos_normal = 16'h13de;
              5'h1f: pos_normal = 16'h13df;
              default: begin end
            endcase
          end
          5'h1f: begin
            pos_normal = 16'h13e0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h13e1;
              5'h02: pos_normal = 16'h13e2;
              5'h03: pos_normal = 16'h13e3;
              5'h04: pos_normal = 16'h13e4;
              5'h05: pos_normal = 16'h13e5;
              5'h06: pos_normal = 16'h13e6;
              5'h07: pos_normal = 16'h13e7;
              5'h08: pos_normal = 16'h13e8;
              5'h09: pos_normal = 16'h13e9;
              5'h0a: pos_normal = 16'h13ea;
              5'h0b: pos_normal = 16'h13eb;
              5'h0c: pos_normal = 16'h13ec;
              5'h0d: pos_normal = 16'h13ed;
              5'h0e: pos_normal = 16'h13ee;
              5'h0f: pos_normal = 16'h13ef;
              5'h10: pos_normal = 16'h13f0;
              5'h11: pos_normal = 16'h13f1;
              5'h12: pos_normal = 16'h13f2;
              5'h13: pos_normal = 16'h13f3;
              5'h14: pos_normal = 16'h13f4;
              5'h15: pos_normal = 16'h13f5;
              5'h16: pos_normal = 16'h13f6;
              5'h17: pos_normal = 16'h13f7;
              5'h18: pos_normal = 16'h13f8;
              5'h19: pos_normal = 16'h13f9;
              5'h1a: pos_normal = 16'h13fa;
              5'h1b: pos_normal = 16'h13fb;
              5'h1c: pos_normal = 16'h13fc;
              5'h1d: pos_normal = 16'h13fd;
              5'h1e: pos_normal = 16'h13fe;
              5'h1f: pos_normal = 16'h13ff;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      5'h05: begin
        case (mant[9:5])
          5'h00: begin
            pos_normal = 16'h1400;
            case (mant[4:0])
              5'h01: pos_normal = 16'h1401;
              5'h02: pos_normal = 16'h1402;
              5'h03: pos_normal = 16'h1403;
              5'h04: pos_normal = 16'h1404;
              5'h05: pos_normal = 16'h1405;
              5'h06: pos_normal = 16'h1406;
              5'h07: pos_normal = 16'h1407;
              5'h08: pos_normal = 16'h1408;
              5'h09: pos_normal = 16'h1409;
              5'h0a: pos_normal = 16'h140a;
              5'h0b: pos_normal = 16'h140b;
              5'h0c: pos_normal = 16'h140c;
              5'h0d: pos_normal = 16'h140d;
              5'h0e: pos_normal = 16'h140e;
              5'h0f: pos_normal = 16'h140f;
              5'h10: pos_normal = 16'h1410;
              5'h11: pos_normal = 16'h1411;
              5'h12: pos_normal = 16'h1412;
              5'h13: pos_normal = 16'h1413;
              5'h14: pos_normal = 16'h1414;
              5'h15: pos_normal = 16'h1415;
              5'h16: pos_normal = 16'h1416;
              5'h17: pos_normal = 16'h1417;
              5'h18: pos_normal = 16'h1418;
              5'h19: pos_normal = 16'h1419;
              5'h1a: pos_normal = 16'h141a;
              5'h1b: pos_normal = 16'h141b;
              5'h1c: pos_normal = 16'h141c;
              5'h1d: pos_normal = 16'h141d;
              5'h1e: pos_normal = 16'h141e;
              5'h1f: pos_normal = 16'h141f;
              default: begin end
            endcase
          end
          5'h01: begin
            pos_normal = 16'h1420;
            case (mant[4:0])
              5'h01: pos_normal = 16'h1421;
              5'h02: pos_normal = 16'h1422;
              5'h03: pos_normal = 16'h1423;
              5'h04: pos_normal = 16'h1424;
              5'h05: pos_normal = 16'h1425;
              5'h06: pos_normal = 16'h1426;
              5'h07: pos_normal = 16'h1427;
              5'h08: pos_normal = 16'h1428;
              5'h09: pos_normal = 16'h1429;
              5'h0a: pos_normal = 16'h142a;
              5'h0b: pos_normal = 16'h142b;
              5'h0c: pos_normal = 16'h142c;
              5'h0d: pos_normal = 16'h142d;
              5'h0e: pos_normal = 16'h142e;
              5'h0f: pos_normal = 16'h142f;
              5'h10: pos_normal = 16'h1430;
              5'h11: pos_normal = 16'h1431;
              5'h12: pos_normal = 16'h1432;
              5'h13: pos_normal = 16'h1433;
              5'h14: pos_normal = 16'h1434;
              5'h15: pos_normal = 16'h1435;
              5'h16: pos_normal = 16'h1436;
              5'h17: pos_normal = 16'h1437;
              5'h18: pos_normal = 16'h1438;
              5'h19: pos_normal = 16'h1439;
              5'h1a: pos_normal = 16'h143a;
              5'h1b: pos_normal = 16'h143b;
              5'h1c: pos_normal = 16'h143c;
              5'h1d: pos_normal = 16'h143d;
              5'h1e: pos_normal = 16'h143e;
              5'h1f: pos_normal = 16'h143f;
              default: begin end
            endcase
          end
          5'h02: begin
            pos_normal = 16'h1440;
            case (mant[4:0])
              5'h01: pos_normal = 16'h1441;
              5'h02: pos_normal = 16'h1442;
              5'h03: pos_normal = 16'h1443;
              5'h04: pos_normal = 16'h1444;
              5'h05: pos_normal = 16'h1445;
              5'h06: pos_normal = 16'h1446;
              5'h07: pos_normal = 16'h1447;
              5'h08: pos_normal = 16'h1448;
              5'h09: pos_normal = 16'h1449;
              5'h0a: pos_normal = 16'h144a;
              5'h0b: pos_normal = 16'h144b;
              5'h0c: pos_normal = 16'h144c;
              5'h0d: pos_normal = 16'h144d;
              5'h0e: pos_normal = 16'h144e;
              5'h0f: pos_normal = 16'h144f;
              5'h10: pos_normal = 16'h1450;
              5'h11: pos_normal = 16'h1451;
              5'h12: pos_normal = 16'h1452;
              5'h13: pos_normal = 16'h1453;
              5'h14: pos_normal = 16'h1454;
              5'h15: pos_normal = 16'h1455;
              5'h16: pos_normal = 16'h1456;
              5'h17: pos_normal = 16'h1457;
              5'h18: pos_normal = 16'h1458;
              5'h19: pos_normal = 16'h1459;
              5'h1a: pos_normal = 16'h145a;
              5'h1b: pos_normal = 16'h145b;
              5'h1c: pos_normal = 16'h145c;
              5'h1d: pos_normal = 16'h145d;
              5'h1e: pos_normal = 16'h145e;
              5'h1f: pos_normal = 16'h145f;
              default: begin end
            endcase
          end
          5'h03: begin
            pos_normal = 16'h1460;
            case (mant[4:0])
              5'h01: pos_normal = 16'h1461;
              5'h02: pos_normal = 16'h1462;
              5'h03: pos_normal = 16'h1463;
              5'h04: pos_normal = 16'h1464;
              5'h05: pos_normal = 16'h1465;
              5'h06: pos_normal = 16'h1466;
              5'h07: pos_normal = 16'h1467;
              5'h08: pos_normal = 16'h1468;
              5'h09: pos_normal = 16'h1469;
              5'h0a: pos_normal = 16'h146a;
              5'h0b: pos_normal = 16'h146b;
              5'h0c: pos_normal = 16'h146c;
              5'h0d: pos_normal = 16'h146d;
              5'h0e: pos_normal = 16'h146e;
              5'h0f: pos_normal = 16'h146f;
              5'h10: pos_normal = 16'h1470;
              5'h11: pos_normal = 16'h1471;
              5'h12: pos_normal = 16'h1472;
              5'h13: pos_normal = 16'h1473;
              5'h14: pos_normal = 16'h1474;
              5'h15: pos_normal = 16'h1475;
              5'h16: pos_normal = 16'h1476;
              5'h17: pos_normal = 16'h1477;
              5'h18: pos_normal = 16'h1478;
              5'h19: pos_normal = 16'h1479;
              5'h1a: pos_normal = 16'h147a;
              5'h1b: pos_normal = 16'h147b;
              5'h1c: pos_normal = 16'h147c;
              5'h1d: pos_normal = 16'h147d;
              5'h1e: pos_normal = 16'h147e;
              5'h1f: pos_normal = 16'h147f;
              default: begin end
            endcase
          end
          5'h04: begin
            pos_normal = 16'h1480;
            case (mant[4:0])
              5'h01: pos_normal = 16'h1481;
              5'h02: pos_normal = 16'h1482;
              5'h03: pos_normal = 16'h1483;
              5'h04: pos_normal = 16'h1484;
              5'h05: pos_normal = 16'h1485;
              5'h06: pos_normal = 16'h1486;
              5'h07: pos_normal = 16'h1487;
              5'h08: pos_normal = 16'h1488;
              5'h09: pos_normal = 16'h1489;
              5'h0a: pos_normal = 16'h148a;
              5'h0b: pos_normal = 16'h148b;
              5'h0c: pos_normal = 16'h148c;
              5'h0d: pos_normal = 16'h148d;
              5'h0e: pos_normal = 16'h148e;
              5'h0f: pos_normal = 16'h148f;
              5'h10: pos_normal = 16'h1490;
              5'h11: pos_normal = 16'h1491;
              5'h12: pos_normal = 16'h1492;
              5'h13: pos_normal = 16'h1493;
              5'h14: pos_normal = 16'h1494;
              5'h15: pos_normal = 16'h1495;
              5'h16: pos_normal = 16'h1496;
              5'h17: pos_normal = 16'h1497;
              5'h18: pos_normal = 16'h1498;
              5'h19: pos_normal = 16'h1499;
              5'h1a: pos_normal = 16'h149a;
              5'h1b: pos_normal = 16'h149b;
              5'h1c: pos_normal = 16'h149c;
              5'h1d: pos_normal = 16'h149d;
              5'h1e: pos_normal = 16'h149e;
              5'h1f: pos_normal = 16'h149f;
              default: begin end
            endcase
          end
          5'h05: begin
            pos_normal = 16'h14a0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h14a1;
              5'h02: pos_normal = 16'h14a2;
              5'h03: pos_normal = 16'h14a3;
              5'h04: pos_normal = 16'h14a4;
              5'h05: pos_normal = 16'h14a5;
              5'h06: pos_normal = 16'h14a6;
              5'h07: pos_normal = 16'h14a7;
              5'h08: pos_normal = 16'h14a8;
              5'h09: pos_normal = 16'h14a9;
              5'h0a: pos_normal = 16'h14aa;
              5'h0b: pos_normal = 16'h14ab;
              5'h0c: pos_normal = 16'h14ac;
              5'h0d: pos_normal = 16'h14ad;
              5'h0e: pos_normal = 16'h14ae;
              5'h0f: pos_normal = 16'h14af;
              5'h10: pos_normal = 16'h14b0;
              5'h11: pos_normal = 16'h14b1;
              5'h12: pos_normal = 16'h14b2;
              5'h13: pos_normal = 16'h14b3;
              5'h14: pos_normal = 16'h14b4;
              5'h15: pos_normal = 16'h14b5;
              5'h16: pos_normal = 16'h14b6;
              5'h17: pos_normal = 16'h14b7;
              5'h18: pos_normal = 16'h14b8;
              5'h19: pos_normal = 16'h14b9;
              5'h1a: pos_normal = 16'h14ba;
              5'h1b: pos_normal = 16'h14bb;
              5'h1c: pos_normal = 16'h14bc;
              5'h1d: pos_normal = 16'h14bd;
              5'h1e: pos_normal = 16'h14be;
              5'h1f: pos_normal = 16'h14bf;
              default: begin end
            endcase
          end
          5'h06: begin
            pos_normal = 16'h14c0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h14c1;
              5'h02: pos_normal = 16'h14c2;
              5'h03: pos_normal = 16'h14c3;
              5'h04: pos_normal = 16'h14c4;
              5'h05: pos_normal = 16'h14c5;
              5'h06: pos_normal = 16'h14c6;
              5'h07: pos_normal = 16'h14c7;
              5'h08: pos_normal = 16'h14c8;
              5'h09: pos_normal = 16'h14c9;
              5'h0a: pos_normal = 16'h14ca;
              5'h0b: pos_normal = 16'h14cb;
              5'h0c: pos_normal = 16'h14cc;
              5'h0d: pos_normal = 16'h14cd;
              5'h0e: pos_normal = 16'h14ce;
              5'h0f: pos_normal = 16'h14cf;
              5'h10: pos_normal = 16'h14d0;
              5'h11: pos_normal = 16'h14d1;
              5'h12: pos_normal = 16'h14d2;
              5'h13: pos_normal = 16'h14d3;
              5'h14: pos_normal = 16'h14d4;
              5'h15: pos_normal = 16'h14d5;
              5'h16: pos_normal = 16'h14d6;
              5'h17: pos_normal = 16'h14d7;
              5'h18: pos_normal = 16'h14d8;
              5'h19: pos_normal = 16'h14d9;
              5'h1a: pos_normal = 16'h14da;
              5'h1b: pos_normal = 16'h14db;
              5'h1c: pos_normal = 16'h14dc;
              5'h1d: pos_normal = 16'h14dd;
              5'h1e: pos_normal = 16'h14de;
              5'h1f: pos_normal = 16'h14df;
              default: begin end
            endcase
          end
          5'h07: begin
            pos_normal = 16'h14e0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h14e1;
              5'h02: pos_normal = 16'h14e2;
              5'h03: pos_normal = 16'h14e3;
              5'h04: pos_normal = 16'h14e4;
              5'h05: pos_normal = 16'h14e5;
              5'h06: pos_normal = 16'h14e6;
              5'h07: pos_normal = 16'h14e7;
              5'h08: pos_normal = 16'h14e8;
              5'h09: pos_normal = 16'h14e9;
              5'h0a: pos_normal = 16'h14ea;
              5'h0b: pos_normal = 16'h14eb;
              5'h0c: pos_normal = 16'h14ec;
              5'h0d: pos_normal = 16'h14ed;
              5'h0e: pos_normal = 16'h14ee;
              5'h0f: pos_normal = 16'h14ef;
              5'h10: pos_normal = 16'h14f0;
              5'h11: pos_normal = 16'h14f1;
              5'h12: pos_normal = 16'h14f2;
              5'h13: pos_normal = 16'h14f3;
              5'h14: pos_normal = 16'h14f4;
              5'h15: pos_normal = 16'h14f5;
              5'h16: pos_normal = 16'h14f6;
              5'h17: pos_normal = 16'h14f7;
              5'h18: pos_normal = 16'h14f8;
              5'h19: pos_normal = 16'h14f9;
              5'h1a: pos_normal = 16'h14fa;
              5'h1b: pos_normal = 16'h14fb;
              5'h1c: pos_normal = 16'h14fc;
              5'h1d: pos_normal = 16'h14fd;
              5'h1e: pos_normal = 16'h14fe;
              5'h1f: pos_normal = 16'h14ff;
              default: begin end
            endcase
          end
          5'h08: begin
            pos_normal = 16'h1500;
            case (mant[4:0])
              5'h01: pos_normal = 16'h1501;
              5'h02: pos_normal = 16'h1502;
              5'h03: pos_normal = 16'h1503;
              5'h04: pos_normal = 16'h1504;
              5'h05: pos_normal = 16'h1505;
              5'h06: pos_normal = 16'h1506;
              5'h07: pos_normal = 16'h1507;
              5'h08: pos_normal = 16'h1508;
              5'h09: pos_normal = 16'h1509;
              5'h0a: pos_normal = 16'h150a;
              5'h0b: pos_normal = 16'h150b;
              5'h0c: pos_normal = 16'h150c;
              5'h0d: pos_normal = 16'h150d;
              5'h0e: pos_normal = 16'h150e;
              5'h0f: pos_normal = 16'h150f;
              5'h10: pos_normal = 16'h1510;
              5'h11: pos_normal = 16'h1511;
              5'h12: pos_normal = 16'h1512;
              5'h13: pos_normal = 16'h1513;
              5'h14: pos_normal = 16'h1514;
              5'h15: pos_normal = 16'h1515;
              5'h16: pos_normal = 16'h1516;
              5'h17: pos_normal = 16'h1517;
              5'h18: pos_normal = 16'h1518;
              5'h19: pos_normal = 16'h1519;
              5'h1a: pos_normal = 16'h151a;
              5'h1b: pos_normal = 16'h151b;
              5'h1c: pos_normal = 16'h151c;
              5'h1d: pos_normal = 16'h151d;
              5'h1e: pos_normal = 16'h151e;
              5'h1f: pos_normal = 16'h151f;
              default: begin end
            endcase
          end
          5'h09: begin
            pos_normal = 16'h1520;
            case (mant[4:0])
              5'h01: pos_normal = 16'h1521;
              5'h02: pos_normal = 16'h1522;
              5'h03: pos_normal = 16'h1523;
              5'h04: pos_normal = 16'h1524;
              5'h05: pos_normal = 16'h1525;
              5'h06: pos_normal = 16'h1526;
              5'h07: pos_normal = 16'h1527;
              5'h08: pos_normal = 16'h1528;
              5'h09: pos_normal = 16'h1529;
              5'h0a: pos_normal = 16'h152a;
              5'h0b: pos_normal = 16'h152b;
              5'h0c: pos_normal = 16'h152c;
              5'h0d: pos_normal = 16'h152d;
              5'h0e: pos_normal = 16'h152e;
              5'h0f: pos_normal = 16'h152f;
              5'h10: pos_normal = 16'h1530;
              5'h11: pos_normal = 16'h1531;
              5'h12: pos_normal = 16'h1532;
              5'h13: pos_normal = 16'h1533;
              5'h14: pos_normal = 16'h1534;
              5'h15: pos_normal = 16'h1535;
              5'h16: pos_normal = 16'h1536;
              5'h17: pos_normal = 16'h1537;
              5'h18: pos_normal = 16'h1538;
              5'h19: pos_normal = 16'h1539;
              5'h1a: pos_normal = 16'h153a;
              5'h1b: pos_normal = 16'h153b;
              5'h1c: pos_normal = 16'h153c;
              5'h1d: pos_normal = 16'h153d;
              5'h1e: pos_normal = 16'h153e;
              5'h1f: pos_normal = 16'h153f;
              default: begin end
            endcase
          end
          5'h0a: begin
            pos_normal = 16'h1540;
            case (mant[4:0])
              5'h01: pos_normal = 16'h1541;
              5'h02: pos_normal = 16'h1542;
              5'h03: pos_normal = 16'h1543;
              5'h04: pos_normal = 16'h1544;
              5'h05: pos_normal = 16'h1545;
              5'h06: pos_normal = 16'h1546;
              5'h07: pos_normal = 16'h1547;
              5'h08: pos_normal = 16'h1548;
              5'h09: pos_normal = 16'h1549;
              5'h0a: pos_normal = 16'h154a;
              5'h0b: pos_normal = 16'h154b;
              5'h0c: pos_normal = 16'h154c;
              5'h0d: pos_normal = 16'h154d;
              5'h0e: pos_normal = 16'h154e;
              5'h0f: pos_normal = 16'h154f;
              5'h10: pos_normal = 16'h1550;
              5'h11: pos_normal = 16'h1551;
              5'h12: pos_normal = 16'h1552;
              5'h13: pos_normal = 16'h1553;
              5'h14: pos_normal = 16'h1554;
              5'h15: pos_normal = 16'h1555;
              5'h16: pos_normal = 16'h1556;
              5'h17: pos_normal = 16'h1557;
              5'h18: pos_normal = 16'h1558;
              5'h19: pos_normal = 16'h1559;
              5'h1a: pos_normal = 16'h155a;
              5'h1b: pos_normal = 16'h155b;
              5'h1c: pos_normal = 16'h155c;
              5'h1d: pos_normal = 16'h155d;
              5'h1e: pos_normal = 16'h155e;
              5'h1f: pos_normal = 16'h155f;
              default: begin end
            endcase
          end
          5'h0b: begin
            pos_normal = 16'h1560;
            case (mant[4:0])
              5'h01: pos_normal = 16'h1561;
              5'h02: pos_normal = 16'h1562;
              5'h03: pos_normal = 16'h1563;
              5'h04: pos_normal = 16'h1564;
              5'h05: pos_normal = 16'h1565;
              5'h06: pos_normal = 16'h1566;
              5'h07: pos_normal = 16'h1567;
              5'h08: pos_normal = 16'h1568;
              5'h09: pos_normal = 16'h1569;
              5'h0a: pos_normal = 16'h156a;
              5'h0b: pos_normal = 16'h156b;
              5'h0c: pos_normal = 16'h156c;
              5'h0d: pos_normal = 16'h156d;
              5'h0e: pos_normal = 16'h156e;
              5'h0f: pos_normal = 16'h156f;
              5'h10: pos_normal = 16'h1570;
              5'h11: pos_normal = 16'h1571;
              5'h12: pos_normal = 16'h1572;
              5'h13: pos_normal = 16'h1573;
              5'h14: pos_normal = 16'h1574;
              5'h15: pos_normal = 16'h1575;
              5'h16: pos_normal = 16'h1576;
              5'h17: pos_normal = 16'h1577;
              5'h18: pos_normal = 16'h1578;
              5'h19: pos_normal = 16'h1579;
              5'h1a: pos_normal = 16'h157a;
              5'h1b: pos_normal = 16'h157b;
              5'h1c: pos_normal = 16'h157c;
              5'h1d: pos_normal = 16'h157d;
              5'h1e: pos_normal = 16'h157e;
              5'h1f: pos_normal = 16'h157f;
              default: begin end
            endcase
          end
          5'h0c: begin
            pos_normal = 16'h1580;
            case (mant[4:0])
              5'h01: pos_normal = 16'h1581;
              5'h02: pos_normal = 16'h1582;
              5'h03: pos_normal = 16'h1583;
              5'h04: pos_normal = 16'h1584;
              5'h05: pos_normal = 16'h1585;
              5'h06: pos_normal = 16'h1586;
              5'h07: pos_normal = 16'h1587;
              5'h08: pos_normal = 16'h1588;
              5'h09: pos_normal = 16'h1589;
              5'h0a: pos_normal = 16'h158a;
              5'h0b: pos_normal = 16'h158b;
              5'h0c: pos_normal = 16'h158c;
              5'h0d: pos_normal = 16'h158d;
              5'h0e: pos_normal = 16'h158e;
              5'h0f: pos_normal = 16'h158f;
              5'h10: pos_normal = 16'h1590;
              5'h11: pos_normal = 16'h1591;
              5'h12: pos_normal = 16'h1592;
              5'h13: pos_normal = 16'h1593;
              5'h14: pos_normal = 16'h1594;
              5'h15: pos_normal = 16'h1595;
              5'h16: pos_normal = 16'h1596;
              5'h17: pos_normal = 16'h1597;
              5'h18: pos_normal = 16'h1598;
              5'h19: pos_normal = 16'h1599;
              5'h1a: pos_normal = 16'h159a;
              5'h1b: pos_normal = 16'h159b;
              5'h1c: pos_normal = 16'h159c;
              5'h1d: pos_normal = 16'h159d;
              5'h1e: pos_normal = 16'h159e;
              5'h1f: pos_normal = 16'h159f;
              default: begin end
            endcase
          end
          5'h0d: begin
            pos_normal = 16'h15a0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h15a1;
              5'h02: pos_normal = 16'h15a2;
              5'h03: pos_normal = 16'h15a3;
              5'h04: pos_normal = 16'h15a4;
              5'h05: pos_normal = 16'h15a5;
              5'h06: pos_normal = 16'h15a6;
              5'h07: pos_normal = 16'h15a7;
              5'h08: pos_normal = 16'h15a8;
              5'h09: pos_normal = 16'h15a9;
              5'h0a: pos_normal = 16'h15aa;
              5'h0b: pos_normal = 16'h15ab;
              5'h0c: pos_normal = 16'h15ac;
              5'h0d: pos_normal = 16'h15ad;
              5'h0e: pos_normal = 16'h15ae;
              5'h0f: pos_normal = 16'h15af;
              5'h10: pos_normal = 16'h15b0;
              5'h11: pos_normal = 16'h15b1;
              5'h12: pos_normal = 16'h15b2;
              5'h13: pos_normal = 16'h15b3;
              5'h14: pos_normal = 16'h15b4;
              5'h15: pos_normal = 16'h15b5;
              5'h16: pos_normal = 16'h15b6;
              5'h17: pos_normal = 16'h15b7;
              5'h18: pos_normal = 16'h15b8;
              5'h19: pos_normal = 16'h15b9;
              5'h1a: pos_normal = 16'h15ba;
              5'h1b: pos_normal = 16'h15bb;
              5'h1c: pos_normal = 16'h15bc;
              5'h1d: pos_normal = 16'h15bd;
              5'h1e: pos_normal = 16'h15be;
              5'h1f: pos_normal = 16'h15bf;
              default: begin end
            endcase
          end
          5'h0e: begin
            pos_normal = 16'h15c0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h15c1;
              5'h02: pos_normal = 16'h15c2;
              5'h03: pos_normal = 16'h15c3;
              5'h04: pos_normal = 16'h15c4;
              5'h05: pos_normal = 16'h15c5;
              5'h06: pos_normal = 16'h15c6;
              5'h07: pos_normal = 16'h15c7;
              5'h08: pos_normal = 16'h15c8;
              5'h09: pos_normal = 16'h15c9;
              5'h0a: pos_normal = 16'h15ca;
              5'h0b: pos_normal = 16'h15cb;
              5'h0c: pos_normal = 16'h15cc;
              5'h0d: pos_normal = 16'h15cd;
              5'h0e: pos_normal = 16'h15ce;
              5'h0f: pos_normal = 16'h15cf;
              5'h10: pos_normal = 16'h15d0;
              5'h11: pos_normal = 16'h15d1;
              5'h12: pos_normal = 16'h15d2;
              5'h13: pos_normal = 16'h15d3;
              5'h14: pos_normal = 16'h15d4;
              5'h15: pos_normal = 16'h15d5;
              5'h16: pos_normal = 16'h15d6;
              5'h17: pos_normal = 16'h15d7;
              5'h18: pos_normal = 16'h15d8;
              5'h19: pos_normal = 16'h15d9;
              5'h1a: pos_normal = 16'h15da;
              5'h1b: pos_normal = 16'h15db;
              5'h1c: pos_normal = 16'h15dc;
              5'h1d: pos_normal = 16'h15dd;
              5'h1e: pos_normal = 16'h15de;
              5'h1f: pos_normal = 16'h15df;
              default: begin end
            endcase
          end
          5'h0f: begin
            pos_normal = 16'h15e0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h15e1;
              5'h02: pos_normal = 16'h15e2;
              5'h03: pos_normal = 16'h15e3;
              5'h04: pos_normal = 16'h15e4;
              5'h05: pos_normal = 16'h15e5;
              5'h06: pos_normal = 16'h15e6;
              5'h07: pos_normal = 16'h15e7;
              5'h08: pos_normal = 16'h15e8;
              5'h09: pos_normal = 16'h15e9;
              5'h0a: pos_normal = 16'h15ea;
              5'h0b: pos_normal = 16'h15eb;
              5'h0c: pos_normal = 16'h15ec;
              5'h0d: pos_normal = 16'h15ed;
              5'h0e: pos_normal = 16'h15ee;
              5'h0f: pos_normal = 16'h15ef;
              5'h10: pos_normal = 16'h15f0;
              5'h11: pos_normal = 16'h15f1;
              5'h12: pos_normal = 16'h15f2;
              5'h13: pos_normal = 16'h15f3;
              5'h14: pos_normal = 16'h15f4;
              5'h15: pos_normal = 16'h15f5;
              5'h16: pos_normal = 16'h15f6;
              5'h17: pos_normal = 16'h15f7;
              5'h18: pos_normal = 16'h15f8;
              5'h19: pos_normal = 16'h15f9;
              5'h1a: pos_normal = 16'h15fa;
              5'h1b: pos_normal = 16'h15fb;
              5'h1c: pos_normal = 16'h15fc;
              5'h1d: pos_normal = 16'h15fd;
              5'h1e: pos_normal = 16'h15fe;
              5'h1f: pos_normal = 16'h15ff;
              default: begin end
            endcase
          end
          5'h10: begin
            pos_normal = 16'h1600;
            case (mant[4:0])
              5'h01: pos_normal = 16'h1601;
              5'h02: pos_normal = 16'h1602;
              5'h03: pos_normal = 16'h1603;
              5'h04: pos_normal = 16'h1604;
              5'h05: pos_normal = 16'h1605;
              5'h06: pos_normal = 16'h1606;
              5'h07: pos_normal = 16'h1607;
              5'h08: pos_normal = 16'h1608;
              5'h09: pos_normal = 16'h1609;
              5'h0a: pos_normal = 16'h160a;
              5'h0b: pos_normal = 16'h160b;
              5'h0c: pos_normal = 16'h160c;
              5'h0d: pos_normal = 16'h160d;
              5'h0e: pos_normal = 16'h160e;
              5'h0f: pos_normal = 16'h160f;
              5'h10: pos_normal = 16'h1610;
              5'h11: pos_normal = 16'h1611;
              5'h12: pos_normal = 16'h1612;
              5'h13: pos_normal = 16'h1613;
              5'h14: pos_normal = 16'h1614;
              5'h15: pos_normal = 16'h1615;
              5'h16: pos_normal = 16'h1616;
              5'h17: pos_normal = 16'h1617;
              5'h18: pos_normal = 16'h1618;
              5'h19: pos_normal = 16'h1619;
              5'h1a: pos_normal = 16'h161a;
              5'h1b: pos_normal = 16'h161b;
              5'h1c: pos_normal = 16'h161c;
              5'h1d: pos_normal = 16'h161d;
              5'h1e: pos_normal = 16'h161e;
              5'h1f: pos_normal = 16'h161f;
              default: begin end
            endcase
          end
          5'h11: begin
            pos_normal = 16'h1620;
            case (mant[4:0])
              5'h01: pos_normal = 16'h1621;
              5'h02: pos_normal = 16'h1622;
              5'h03: pos_normal = 16'h1623;
              5'h04: pos_normal = 16'h1624;
              5'h05: pos_normal = 16'h1625;
              5'h06: pos_normal = 16'h1626;
              5'h07: pos_normal = 16'h1627;
              5'h08: pos_normal = 16'h1628;
              5'h09: pos_normal = 16'h1629;
              5'h0a: pos_normal = 16'h162a;
              5'h0b: pos_normal = 16'h162b;
              5'h0c: pos_normal = 16'h162c;
              5'h0d: pos_normal = 16'h162d;
              5'h0e: pos_normal = 16'h162e;
              5'h0f: pos_normal = 16'h162f;
              5'h10: pos_normal = 16'h1630;
              5'h11: pos_normal = 16'h1631;
              5'h12: pos_normal = 16'h1632;
              5'h13: pos_normal = 16'h1633;
              5'h14: pos_normal = 16'h1634;
              5'h15: pos_normal = 16'h1635;
              5'h16: pos_normal = 16'h1636;
              5'h17: pos_normal = 16'h1637;
              5'h18: pos_normal = 16'h1638;
              5'h19: pos_normal = 16'h1639;
              5'h1a: pos_normal = 16'h163a;
              5'h1b: pos_normal = 16'h163b;
              5'h1c: pos_normal = 16'h163c;
              5'h1d: pos_normal = 16'h163d;
              5'h1e: pos_normal = 16'h163e;
              5'h1f: pos_normal = 16'h163f;
              default: begin end
            endcase
          end
          5'h12: begin
            pos_normal = 16'h1640;
            case (mant[4:0])
              5'h01: pos_normal = 16'h1641;
              5'h02: pos_normal = 16'h1642;
              5'h03: pos_normal = 16'h1643;
              5'h04: pos_normal = 16'h1644;
              5'h05: pos_normal = 16'h1645;
              5'h06: pos_normal = 16'h1646;
              5'h07: pos_normal = 16'h1647;
              5'h08: pos_normal = 16'h1648;
              5'h09: pos_normal = 16'h1649;
              5'h0a: pos_normal = 16'h164a;
              5'h0b: pos_normal = 16'h164b;
              5'h0c: pos_normal = 16'h164c;
              5'h0d: pos_normal = 16'h164d;
              5'h0e: pos_normal = 16'h164e;
              5'h0f: pos_normal = 16'h164f;
              5'h10: pos_normal = 16'h1650;
              5'h11: pos_normal = 16'h1651;
              5'h12: pos_normal = 16'h1652;
              5'h13: pos_normal = 16'h1653;
              5'h14: pos_normal = 16'h1654;
              5'h15: pos_normal = 16'h1655;
              5'h16: pos_normal = 16'h1656;
              5'h17: pos_normal = 16'h1657;
              5'h18: pos_normal = 16'h1658;
              5'h19: pos_normal = 16'h1659;
              5'h1a: pos_normal = 16'h165a;
              5'h1b: pos_normal = 16'h165b;
              5'h1c: pos_normal = 16'h165c;
              5'h1d: pos_normal = 16'h165d;
              5'h1e: pos_normal = 16'h165e;
              5'h1f: pos_normal = 16'h165f;
              default: begin end
            endcase
          end
          5'h13: begin
            pos_normal = 16'h1660;
            case (mant[4:0])
              5'h01: pos_normal = 16'h1661;
              5'h02: pos_normal = 16'h1662;
              5'h03: pos_normal = 16'h1663;
              5'h04: pos_normal = 16'h1664;
              5'h05: pos_normal = 16'h1665;
              5'h06: pos_normal = 16'h1666;
              5'h07: pos_normal = 16'h1667;
              5'h08: pos_normal = 16'h1668;
              5'h09: pos_normal = 16'h1669;
              5'h0a: pos_normal = 16'h166a;
              5'h0b: pos_normal = 16'h166b;
              5'h0c: pos_normal = 16'h166c;
              5'h0d: pos_normal = 16'h166d;
              5'h0e: pos_normal = 16'h166e;
              5'h0f: pos_normal = 16'h166f;
              5'h10: pos_normal = 16'h1670;
              5'h11: pos_normal = 16'h1671;
              5'h12: pos_normal = 16'h1672;
              5'h13: pos_normal = 16'h1673;
              5'h14: pos_normal = 16'h1674;
              5'h15: pos_normal = 16'h1675;
              5'h16: pos_normal = 16'h1676;
              5'h17: pos_normal = 16'h1677;
              5'h18: pos_normal = 16'h1678;
              5'h19: pos_normal = 16'h1679;
              5'h1a: pos_normal = 16'h167a;
              5'h1b: pos_normal = 16'h167b;
              5'h1c: pos_normal = 16'h167c;
              5'h1d: pos_normal = 16'h167d;
              5'h1e: pos_normal = 16'h167e;
              5'h1f: pos_normal = 16'h167f;
              default: begin end
            endcase
          end
          5'h14: begin
            pos_normal = 16'h1680;
            case (mant[4:0])
              5'h01: pos_normal = 16'h1681;
              5'h02: pos_normal = 16'h1682;
              5'h03: pos_normal = 16'h1683;
              5'h04: pos_normal = 16'h1684;
              5'h05: pos_normal = 16'h1685;
              5'h06: pos_normal = 16'h1686;
              5'h07: pos_normal = 16'h1687;
              5'h08: pos_normal = 16'h1688;
              5'h09: pos_normal = 16'h1689;
              5'h0a: pos_normal = 16'h168a;
              5'h0b: pos_normal = 16'h168b;
              5'h0c: pos_normal = 16'h168c;
              5'h0d: pos_normal = 16'h168d;
              5'h0e: pos_normal = 16'h168e;
              5'h0f: pos_normal = 16'h168f;
              5'h10: pos_normal = 16'h1690;
              5'h11: pos_normal = 16'h1691;
              5'h12: pos_normal = 16'h1692;
              5'h13: pos_normal = 16'h1693;
              5'h14: pos_normal = 16'h1694;
              5'h15: pos_normal = 16'h1695;
              5'h16: pos_normal = 16'h1696;
              5'h17: pos_normal = 16'h1697;
              5'h18: pos_normal = 16'h1698;
              5'h19: pos_normal = 16'h1699;
              5'h1a: pos_normal = 16'h169a;
              5'h1b: pos_normal = 16'h169b;
              5'h1c: pos_normal = 16'h169c;
              5'h1d: pos_normal = 16'h169d;
              5'h1e: pos_normal = 16'h169e;
              5'h1f: pos_normal = 16'h169f;
              default: begin end
            endcase
          end
          5'h15: begin
            pos_normal = 16'h16a0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h16a1;
              5'h02: pos_normal = 16'h16a2;
              5'h03: pos_normal = 16'h16a3;
              5'h04: pos_normal = 16'h16a4;
              5'h05: pos_normal = 16'h16a5;
              5'h06: pos_normal = 16'h16a6;
              5'h07: pos_normal = 16'h16a7;
              5'h08: pos_normal = 16'h16a8;
              5'h09: pos_normal = 16'h16a9;
              5'h0a: pos_normal = 16'h16aa;
              5'h0b: pos_normal = 16'h16ab;
              5'h0c: pos_normal = 16'h16ac;
              5'h0d: pos_normal = 16'h16ad;
              5'h0e: pos_normal = 16'h16ae;
              5'h0f: pos_normal = 16'h16af;
              5'h10: pos_normal = 16'h16b0;
              5'h11: pos_normal = 16'h16b1;
              5'h12: pos_normal = 16'h16b2;
              5'h13: pos_normal = 16'h16b3;
              5'h14: pos_normal = 16'h16b4;
              5'h15: pos_normal = 16'h16b5;
              5'h16: pos_normal = 16'h16b6;
              5'h17: pos_normal = 16'h16b7;
              5'h18: pos_normal = 16'h16b8;
              5'h19: pos_normal = 16'h16b9;
              5'h1a: pos_normal = 16'h16ba;
              5'h1b: pos_normal = 16'h16bb;
              5'h1c: pos_normal = 16'h16bc;
              5'h1d: pos_normal = 16'h16bd;
              5'h1e: pos_normal = 16'h16be;
              5'h1f: pos_normal = 16'h16bf;
              default: begin end
            endcase
          end
          5'h16: begin
            pos_normal = 16'h16c0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h16c1;
              5'h02: pos_normal = 16'h16c2;
              5'h03: pos_normal = 16'h16c3;
              5'h04: pos_normal = 16'h16c4;
              5'h05: pos_normal = 16'h16c5;
              5'h06: pos_normal = 16'h16c6;
              5'h07: pos_normal = 16'h16c7;
              5'h08: pos_normal = 16'h16c8;
              5'h09: pos_normal = 16'h16c9;
              5'h0a: pos_normal = 16'h16ca;
              5'h0b: pos_normal = 16'h16cb;
              5'h0c: pos_normal = 16'h16cc;
              5'h0d: pos_normal = 16'h16cd;
              5'h0e: pos_normal = 16'h16ce;
              5'h0f: pos_normal = 16'h16cf;
              5'h10: pos_normal = 16'h16d0;
              5'h11: pos_normal = 16'h16d1;
              5'h12: pos_normal = 16'h16d2;
              5'h13: pos_normal = 16'h16d3;
              5'h14: pos_normal = 16'h16d4;
              5'h15: pos_normal = 16'h16d5;
              5'h16: pos_normal = 16'h16d6;
              5'h17: pos_normal = 16'h16d7;
              5'h18: pos_normal = 16'h16d8;
              5'h19: pos_normal = 16'h16d9;
              5'h1a: pos_normal = 16'h16da;
              5'h1b: pos_normal = 16'h16db;
              5'h1c: pos_normal = 16'h16dc;
              5'h1d: pos_normal = 16'h16dd;
              5'h1e: pos_normal = 16'h16de;
              5'h1f: pos_normal = 16'h16df;
              default: begin end
            endcase
          end
          5'h17: begin
            pos_normal = 16'h16e0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h16e1;
              5'h02: pos_normal = 16'h16e2;
              5'h03: pos_normal = 16'h16e3;
              5'h04: pos_normal = 16'h16e4;
              5'h05: pos_normal = 16'h16e5;
              5'h06: pos_normal = 16'h16e6;
              5'h07: pos_normal = 16'h16e7;
              5'h08: pos_normal = 16'h16e8;
              5'h09: pos_normal = 16'h16e9;
              5'h0a: pos_normal = 16'h16ea;
              5'h0b: pos_normal = 16'h16eb;
              5'h0c: pos_normal = 16'h16ec;
              5'h0d: pos_normal = 16'h16ed;
              5'h0e: pos_normal = 16'h16ee;
              5'h0f: pos_normal = 16'h16ef;
              5'h10: pos_normal = 16'h16f0;
              5'h11: pos_normal = 16'h16f1;
              5'h12: pos_normal = 16'h16f2;
              5'h13: pos_normal = 16'h16f3;
              5'h14: pos_normal = 16'h16f4;
              5'h15: pos_normal = 16'h16f5;
              5'h16: pos_normal = 16'h16f6;
              5'h17: pos_normal = 16'h16f7;
              5'h18: pos_normal = 16'h16f8;
              5'h19: pos_normal = 16'h16f9;
              5'h1a: pos_normal = 16'h16fa;
              5'h1b: pos_normal = 16'h16fb;
              5'h1c: pos_normal = 16'h16fc;
              5'h1d: pos_normal = 16'h16fd;
              5'h1e: pos_normal = 16'h16fe;
              5'h1f: pos_normal = 16'h16ff;
              default: begin end
            endcase
          end
          5'h18: begin
            pos_normal = 16'h1700;
            case (mant[4:0])
              5'h01: pos_normal = 16'h1701;
              5'h02: pos_normal = 16'h1702;
              5'h03: pos_normal = 16'h1703;
              5'h04: pos_normal = 16'h1704;
              5'h05: pos_normal = 16'h1705;
              5'h06: pos_normal = 16'h1706;
              5'h07: pos_normal = 16'h1707;
              5'h08: pos_normal = 16'h1708;
              5'h09: pos_normal = 16'h1709;
              5'h0a: pos_normal = 16'h170a;
              5'h0b: pos_normal = 16'h170b;
              5'h0c: pos_normal = 16'h170c;
              5'h0d: pos_normal = 16'h170d;
              5'h0e: pos_normal = 16'h170e;
              5'h0f: pos_normal = 16'h170f;
              5'h10: pos_normal = 16'h1710;
              5'h11: pos_normal = 16'h1711;
              5'h12: pos_normal = 16'h1712;
              5'h13: pos_normal = 16'h1713;
              5'h14: pos_normal = 16'h1714;
              5'h15: pos_normal = 16'h1715;
              5'h16: pos_normal = 16'h1716;
              5'h17: pos_normal = 16'h1717;
              5'h18: pos_normal = 16'h1718;
              5'h19: pos_normal = 16'h1719;
              5'h1a: pos_normal = 16'h171a;
              5'h1b: pos_normal = 16'h171b;
              5'h1c: pos_normal = 16'h171c;
              5'h1d: pos_normal = 16'h171d;
              5'h1e: pos_normal = 16'h171e;
              5'h1f: pos_normal = 16'h171f;
              default: begin end
            endcase
          end
          5'h19: begin
            pos_normal = 16'h1720;
            case (mant[4:0])
              5'h01: pos_normal = 16'h1721;
              5'h02: pos_normal = 16'h1722;
              5'h03: pos_normal = 16'h1723;
              5'h04: pos_normal = 16'h1724;
              5'h05: pos_normal = 16'h1725;
              5'h06: pos_normal = 16'h1726;
              5'h07: pos_normal = 16'h1727;
              5'h08: pos_normal = 16'h1728;
              5'h09: pos_normal = 16'h1729;
              5'h0a: pos_normal = 16'h172a;
              5'h0b: pos_normal = 16'h172b;
              5'h0c: pos_normal = 16'h172c;
              5'h0d: pos_normal = 16'h172d;
              5'h0e: pos_normal = 16'h172e;
              5'h0f: pos_normal = 16'h172f;
              5'h10: pos_normal = 16'h1730;
              5'h11: pos_normal = 16'h1731;
              5'h12: pos_normal = 16'h1732;
              5'h13: pos_normal = 16'h1733;
              5'h14: pos_normal = 16'h1734;
              5'h15: pos_normal = 16'h1735;
              5'h16: pos_normal = 16'h1736;
              5'h17: pos_normal = 16'h1737;
              5'h18: pos_normal = 16'h1738;
              5'h19: pos_normal = 16'h1739;
              5'h1a: pos_normal = 16'h173a;
              5'h1b: pos_normal = 16'h173b;
              5'h1c: pos_normal = 16'h173c;
              5'h1d: pos_normal = 16'h173d;
              5'h1e: pos_normal = 16'h173e;
              5'h1f: pos_normal = 16'h173f;
              default: begin end
            endcase
          end
          5'h1a: begin
            pos_normal = 16'h1740;
            case (mant[4:0])
              5'h01: pos_normal = 16'h1741;
              5'h02: pos_normal = 16'h1742;
              5'h03: pos_normal = 16'h1743;
              5'h04: pos_normal = 16'h1744;
              5'h05: pos_normal = 16'h1745;
              5'h06: pos_normal = 16'h1746;
              5'h07: pos_normal = 16'h1747;
              5'h08: pos_normal = 16'h1748;
              5'h09: pos_normal = 16'h1749;
              5'h0a: pos_normal = 16'h174a;
              5'h0b: pos_normal = 16'h174b;
              5'h0c: pos_normal = 16'h174c;
              5'h0d: pos_normal = 16'h174d;
              5'h0e: pos_normal = 16'h174e;
              5'h0f: pos_normal = 16'h174f;
              5'h10: pos_normal = 16'h1750;
              5'h11: pos_normal = 16'h1751;
              5'h12: pos_normal = 16'h1752;
              5'h13: pos_normal = 16'h1753;
              5'h14: pos_normal = 16'h1754;
              5'h15: pos_normal = 16'h1755;
              5'h16: pos_normal = 16'h1756;
              5'h17: pos_normal = 16'h1757;
              5'h18: pos_normal = 16'h1758;
              5'h19: pos_normal = 16'h1759;
              5'h1a: pos_normal = 16'h175a;
              5'h1b: pos_normal = 16'h175b;
              5'h1c: pos_normal = 16'h175c;
              5'h1d: pos_normal = 16'h175d;
              5'h1e: pos_normal = 16'h175e;
              5'h1f: pos_normal = 16'h175f;
              default: begin end
            endcase
          end
          5'h1b: begin
            pos_normal = 16'h1760;
            case (mant[4:0])
              5'h01: pos_normal = 16'h1761;
              5'h02: pos_normal = 16'h1762;
              5'h03: pos_normal = 16'h1763;
              5'h04: pos_normal = 16'h1764;
              5'h05: pos_normal = 16'h1765;
              5'h06: pos_normal = 16'h1766;
              5'h07: pos_normal = 16'h1767;
              5'h08: pos_normal = 16'h1768;
              5'h09: pos_normal = 16'h1769;
              5'h0a: pos_normal = 16'h176a;
              5'h0b: pos_normal = 16'h176b;
              5'h0c: pos_normal = 16'h176c;
              5'h0d: pos_normal = 16'h176d;
              5'h0e: pos_normal = 16'h176e;
              5'h0f: pos_normal = 16'h176f;
              5'h10: pos_normal = 16'h1770;
              5'h11: pos_normal = 16'h1771;
              5'h12: pos_normal = 16'h1772;
              5'h13: pos_normal = 16'h1773;
              5'h14: pos_normal = 16'h1774;
              5'h15: pos_normal = 16'h1775;
              5'h16: pos_normal = 16'h1776;
              5'h17: pos_normal = 16'h1777;
              5'h18: pos_normal = 16'h1778;
              5'h19: pos_normal = 16'h1779;
              5'h1a: pos_normal = 16'h177a;
              5'h1b: pos_normal = 16'h177b;
              5'h1c: pos_normal = 16'h177c;
              5'h1d: pos_normal = 16'h177d;
              5'h1e: pos_normal = 16'h177e;
              5'h1f: pos_normal = 16'h177f;
              default: begin end
            endcase
          end
          5'h1c: begin
            pos_normal = 16'h1780;
            case (mant[4:0])
              5'h01: pos_normal = 16'h1781;
              5'h02: pos_normal = 16'h1782;
              5'h03: pos_normal = 16'h1783;
              5'h04: pos_normal = 16'h1784;
              5'h05: pos_normal = 16'h1785;
              5'h06: pos_normal = 16'h1786;
              5'h07: pos_normal = 16'h1787;
              5'h08: pos_normal = 16'h1788;
              5'h09: pos_normal = 16'h1789;
              5'h0a: pos_normal = 16'h178a;
              5'h0b: pos_normal = 16'h178b;
              5'h0c: pos_normal = 16'h178c;
              5'h0d: pos_normal = 16'h178d;
              5'h0e: pos_normal = 16'h178e;
              5'h0f: pos_normal = 16'h178f;
              5'h10: pos_normal = 16'h1790;
              5'h11: pos_normal = 16'h1791;
              5'h12: pos_normal = 16'h1792;
              5'h13: pos_normal = 16'h1793;
              5'h14: pos_normal = 16'h1794;
              5'h15: pos_normal = 16'h1795;
              5'h16: pos_normal = 16'h1796;
              5'h17: pos_normal = 16'h1797;
              5'h18: pos_normal = 16'h1798;
              5'h19: pos_normal = 16'h1799;
              5'h1a: pos_normal = 16'h179a;
              5'h1b: pos_normal = 16'h179b;
              5'h1c: pos_normal = 16'h179c;
              5'h1d: pos_normal = 16'h179d;
              5'h1e: pos_normal = 16'h179e;
              5'h1f: pos_normal = 16'h179f;
              default: begin end
            endcase
          end
          5'h1d: begin
            pos_normal = 16'h17a0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h17a1;
              5'h02: pos_normal = 16'h17a2;
              5'h03: pos_normal = 16'h17a3;
              5'h04: pos_normal = 16'h17a4;
              5'h05: pos_normal = 16'h17a5;
              5'h06: pos_normal = 16'h17a6;
              5'h07: pos_normal = 16'h17a7;
              5'h08: pos_normal = 16'h17a8;
              5'h09: pos_normal = 16'h17a9;
              5'h0a: pos_normal = 16'h17aa;
              5'h0b: pos_normal = 16'h17ab;
              5'h0c: pos_normal = 16'h17ac;
              5'h0d: pos_normal = 16'h17ad;
              5'h0e: pos_normal = 16'h17ae;
              5'h0f: pos_normal = 16'h17af;
              5'h10: pos_normal = 16'h17b0;
              5'h11: pos_normal = 16'h17b1;
              5'h12: pos_normal = 16'h17b2;
              5'h13: pos_normal = 16'h17b3;
              5'h14: pos_normal = 16'h17b4;
              5'h15: pos_normal = 16'h17b5;
              5'h16: pos_normal = 16'h17b6;
              5'h17: pos_normal = 16'h17b7;
              5'h18: pos_normal = 16'h17b8;
              5'h19: pos_normal = 16'h17b9;
              5'h1a: pos_normal = 16'h17ba;
              5'h1b: pos_normal = 16'h17bb;
              5'h1c: pos_normal = 16'h17bc;
              5'h1d: pos_normal = 16'h17bd;
              5'h1e: pos_normal = 16'h17be;
              5'h1f: pos_normal = 16'h17bf;
              default: begin end
            endcase
          end
          5'h1e: begin
            pos_normal = 16'h17c0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h17c1;
              5'h02: pos_normal = 16'h17c2;
              5'h03: pos_normal = 16'h17c3;
              5'h04: pos_normal = 16'h17c4;
              5'h05: pos_normal = 16'h17c5;
              5'h06: pos_normal = 16'h17c6;
              5'h07: pos_normal = 16'h17c7;
              5'h08: pos_normal = 16'h17c8;
              5'h09: pos_normal = 16'h17c9;
              5'h0a: pos_normal = 16'h17ca;
              5'h0b: pos_normal = 16'h17cb;
              5'h0c: pos_normal = 16'h17cc;
              5'h0d: pos_normal = 16'h17cd;
              5'h0e: pos_normal = 16'h17ce;
              5'h0f: pos_normal = 16'h17cf;
              5'h10: pos_normal = 16'h17d0;
              5'h11: pos_normal = 16'h17d1;
              5'h12: pos_normal = 16'h17d2;
              5'h13: pos_normal = 16'h17d3;
              5'h14: pos_normal = 16'h17d4;
              5'h15: pos_normal = 16'h17d5;
              5'h16: pos_normal = 16'h17d6;
              5'h17: pos_normal = 16'h17d7;
              5'h18: pos_normal = 16'h17d8;
              5'h19: pos_normal = 16'h17d9;
              5'h1a: pos_normal = 16'h17da;
              5'h1b: pos_normal = 16'h17db;
              5'h1c: pos_normal = 16'h17dc;
              5'h1d: pos_normal = 16'h17dd;
              5'h1e: pos_normal = 16'h17de;
              5'h1f: pos_normal = 16'h17df;
              default: begin end
            endcase
          end
          5'h1f: begin
            pos_normal = 16'h17e0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h17e1;
              5'h02: pos_normal = 16'h17e2;
              5'h03: pos_normal = 16'h17e3;
              5'h04: pos_normal = 16'h17e4;
              5'h05: pos_normal = 16'h17e5;
              5'h06: pos_normal = 16'h17e6;
              5'h07: pos_normal = 16'h17e7;
              5'h08: pos_normal = 16'h17e8;
              5'h09: pos_normal = 16'h17e9;
              5'h0a: pos_normal = 16'h17ea;
              5'h0b: pos_normal = 16'h17eb;
              5'h0c: pos_normal = 16'h17ec;
              5'h0d: pos_normal = 16'h17ed;
              5'h0e: pos_normal = 16'h17ee;
              5'h0f: pos_normal = 16'h17ef;
              5'h10: pos_normal = 16'h17f0;
              5'h11: pos_normal = 16'h17f1;
              5'h12: pos_normal = 16'h17f2;
              5'h13: pos_normal = 16'h17f3;
              5'h14: pos_normal = 16'h17f4;
              5'h15: pos_normal = 16'h17f5;
              5'h16: pos_normal = 16'h17f6;
              5'h17: pos_normal = 16'h17f7;
              5'h18: pos_normal = 16'h17f8;
              5'h19: pos_normal = 16'h17f9;
              5'h1a: pos_normal = 16'h17fa;
              5'h1b: pos_normal = 16'h17fb;
              5'h1c: pos_normal = 16'h17fc;
              5'h1d: pos_normal = 16'h17fd;
              5'h1e: pos_normal = 16'h17fe;
              5'h1f: pos_normal = 16'h17ff;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      5'h06: begin
        case (mant[9:5])
          5'h00: begin
            pos_normal = 16'h1800;
            case (mant[4:0])
              5'h01: pos_normal = 16'h1801;
              5'h02: pos_normal = 16'h1802;
              5'h03: pos_normal = 16'h1803;
              5'h04: pos_normal = 16'h1804;
              5'h05: pos_normal = 16'h1805;
              5'h06: pos_normal = 16'h1806;
              5'h07: pos_normal = 16'h1807;
              5'h08: pos_normal = 16'h1808;
              5'h09: pos_normal = 16'h1809;
              5'h0a: pos_normal = 16'h180a;
              5'h0b: pos_normal = 16'h180b;
              5'h0c: pos_normal = 16'h180c;
              5'h0d: pos_normal = 16'h180d;
              5'h0e: pos_normal = 16'h180e;
              5'h0f: pos_normal = 16'h180f;
              5'h10: pos_normal = 16'h1810;
              5'h11: pos_normal = 16'h1811;
              5'h12: pos_normal = 16'h1812;
              5'h13: pos_normal = 16'h1813;
              5'h14: pos_normal = 16'h1814;
              5'h15: pos_normal = 16'h1815;
              5'h16: pos_normal = 16'h1816;
              5'h17: pos_normal = 16'h1817;
              5'h18: pos_normal = 16'h1818;
              5'h19: pos_normal = 16'h1819;
              5'h1a: pos_normal = 16'h181a;
              5'h1b: pos_normal = 16'h181b;
              5'h1c: pos_normal = 16'h181c;
              5'h1d: pos_normal = 16'h181d;
              5'h1e: pos_normal = 16'h181e;
              5'h1f: pos_normal = 16'h181f;
              default: begin end
            endcase
          end
          5'h01: begin
            pos_normal = 16'h1820;
            case (mant[4:0])
              5'h01: pos_normal = 16'h1821;
              5'h02: pos_normal = 16'h1822;
              5'h03: pos_normal = 16'h1823;
              5'h04: pos_normal = 16'h1824;
              5'h05: pos_normal = 16'h1825;
              5'h06: pos_normal = 16'h1826;
              5'h07: pos_normal = 16'h1827;
              5'h08: pos_normal = 16'h1828;
              5'h09: pos_normal = 16'h1829;
              5'h0a: pos_normal = 16'h182a;
              5'h0b: pos_normal = 16'h182b;
              5'h0c: pos_normal = 16'h182c;
              5'h0d: pos_normal = 16'h182d;
              5'h0e: pos_normal = 16'h182e;
              5'h0f: pos_normal = 16'h182f;
              5'h10: pos_normal = 16'h1830;
              5'h11: pos_normal = 16'h1831;
              5'h12: pos_normal = 16'h1832;
              5'h13: pos_normal = 16'h1833;
              5'h14: pos_normal = 16'h1834;
              5'h15: pos_normal = 16'h1835;
              5'h16: pos_normal = 16'h1836;
              5'h17: pos_normal = 16'h1837;
              5'h18: pos_normal = 16'h1838;
              5'h19: pos_normal = 16'h1839;
              5'h1a: pos_normal = 16'h183a;
              5'h1b: pos_normal = 16'h183b;
              5'h1c: pos_normal = 16'h183c;
              5'h1d: pos_normal = 16'h183d;
              5'h1e: pos_normal = 16'h183e;
              5'h1f: pos_normal = 16'h183f;
              default: begin end
            endcase
          end
          5'h02: begin
            pos_normal = 16'h1840;
            case (mant[4:0])
              5'h01: pos_normal = 16'h1841;
              5'h02: pos_normal = 16'h1842;
              5'h03: pos_normal = 16'h1843;
              5'h04: pos_normal = 16'h1844;
              5'h05: pos_normal = 16'h1845;
              5'h06: pos_normal = 16'h1846;
              5'h07: pos_normal = 16'h1847;
              5'h08: pos_normal = 16'h1848;
              5'h09: pos_normal = 16'h1849;
              5'h0a: pos_normal = 16'h184a;
              5'h0b: pos_normal = 16'h184b;
              5'h0c: pos_normal = 16'h184c;
              5'h0d: pos_normal = 16'h184d;
              5'h0e: pos_normal = 16'h184e;
              5'h0f: pos_normal = 16'h184f;
              5'h10: pos_normal = 16'h1850;
              5'h11: pos_normal = 16'h1851;
              5'h12: pos_normal = 16'h1852;
              5'h13: pos_normal = 16'h1853;
              5'h14: pos_normal = 16'h1854;
              5'h15: pos_normal = 16'h1855;
              5'h16: pos_normal = 16'h1856;
              5'h17: pos_normal = 16'h1857;
              5'h18: pos_normal = 16'h1858;
              5'h19: pos_normal = 16'h1859;
              5'h1a: pos_normal = 16'h185a;
              5'h1b: pos_normal = 16'h185b;
              5'h1c: pos_normal = 16'h185c;
              5'h1d: pos_normal = 16'h185d;
              5'h1e: pos_normal = 16'h185e;
              5'h1f: pos_normal = 16'h185f;
              default: begin end
            endcase
          end
          5'h03: begin
            pos_normal = 16'h1860;
            case (mant[4:0])
              5'h01: pos_normal = 16'h1861;
              5'h02: pos_normal = 16'h1862;
              5'h03: pos_normal = 16'h1863;
              5'h04: pos_normal = 16'h1864;
              5'h05: pos_normal = 16'h1865;
              5'h06: pos_normal = 16'h1866;
              5'h07: pos_normal = 16'h1867;
              5'h08: pos_normal = 16'h1868;
              5'h09: pos_normal = 16'h1869;
              5'h0a: pos_normal = 16'h186a;
              5'h0b: pos_normal = 16'h186b;
              5'h0c: pos_normal = 16'h186c;
              5'h0d: pos_normal = 16'h186d;
              5'h0e: pos_normal = 16'h186e;
              5'h0f: pos_normal = 16'h186f;
              5'h10: pos_normal = 16'h1870;
              5'h11: pos_normal = 16'h1871;
              5'h12: pos_normal = 16'h1872;
              5'h13: pos_normal = 16'h1873;
              5'h14: pos_normal = 16'h1874;
              5'h15: pos_normal = 16'h1875;
              5'h16: pos_normal = 16'h1876;
              5'h17: pos_normal = 16'h1877;
              5'h18: pos_normal = 16'h1878;
              5'h19: pos_normal = 16'h1879;
              5'h1a: pos_normal = 16'h187a;
              5'h1b: pos_normal = 16'h187b;
              5'h1c: pos_normal = 16'h187c;
              5'h1d: pos_normal = 16'h187d;
              5'h1e: pos_normal = 16'h187e;
              5'h1f: pos_normal = 16'h187f;
              default: begin end
            endcase
          end
          5'h04: begin
            pos_normal = 16'h1880;
            case (mant[4:0])
              5'h01: pos_normal = 16'h1881;
              5'h02: pos_normal = 16'h1882;
              5'h03: pos_normal = 16'h1883;
              5'h04: pos_normal = 16'h1884;
              5'h05: pos_normal = 16'h1885;
              5'h06: pos_normal = 16'h1886;
              5'h07: pos_normal = 16'h1887;
              5'h08: pos_normal = 16'h1888;
              5'h09: pos_normal = 16'h1889;
              5'h0a: pos_normal = 16'h188a;
              5'h0b: pos_normal = 16'h188b;
              5'h0c: pos_normal = 16'h188c;
              5'h0d: pos_normal = 16'h188d;
              5'h0e: pos_normal = 16'h188e;
              5'h0f: pos_normal = 16'h188f;
              5'h10: pos_normal = 16'h1890;
              5'h11: pos_normal = 16'h1891;
              5'h12: pos_normal = 16'h1892;
              5'h13: pos_normal = 16'h1893;
              5'h14: pos_normal = 16'h1894;
              5'h15: pos_normal = 16'h1895;
              5'h16: pos_normal = 16'h1896;
              5'h17: pos_normal = 16'h1897;
              5'h18: pos_normal = 16'h1898;
              5'h19: pos_normal = 16'h1899;
              5'h1a: pos_normal = 16'h189a;
              5'h1b: pos_normal = 16'h189b;
              5'h1c: pos_normal = 16'h189c;
              5'h1d: pos_normal = 16'h189d;
              5'h1e: pos_normal = 16'h189e;
              5'h1f: pos_normal = 16'h189f;
              default: begin end
            endcase
          end
          5'h05: begin
            pos_normal = 16'h18a0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h18a1;
              5'h02: pos_normal = 16'h18a2;
              5'h03: pos_normal = 16'h18a3;
              5'h04: pos_normal = 16'h18a4;
              5'h05: pos_normal = 16'h18a5;
              5'h06: pos_normal = 16'h18a6;
              5'h07: pos_normal = 16'h18a7;
              5'h08: pos_normal = 16'h18a8;
              5'h09: pos_normal = 16'h18a9;
              5'h0a: pos_normal = 16'h18aa;
              5'h0b: pos_normal = 16'h18ab;
              5'h0c: pos_normal = 16'h18ac;
              5'h0d: pos_normal = 16'h18ad;
              5'h0e: pos_normal = 16'h18ae;
              5'h0f: pos_normal = 16'h18af;
              5'h10: pos_normal = 16'h18b0;
              5'h11: pos_normal = 16'h18b1;
              5'h12: pos_normal = 16'h18b2;
              5'h13: pos_normal = 16'h18b3;
              5'h14: pos_normal = 16'h18b4;
              5'h15: pos_normal = 16'h18b5;
              5'h16: pos_normal = 16'h18b6;
              5'h17: pos_normal = 16'h18b7;
              5'h18: pos_normal = 16'h18b8;
              5'h19: pos_normal = 16'h18b9;
              5'h1a: pos_normal = 16'h18ba;
              5'h1b: pos_normal = 16'h18bb;
              5'h1c: pos_normal = 16'h18bc;
              5'h1d: pos_normal = 16'h18bd;
              5'h1e: pos_normal = 16'h18be;
              5'h1f: pos_normal = 16'h18bf;
              default: begin end
            endcase
          end
          5'h06: begin
            pos_normal = 16'h18c0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h18c1;
              5'h02: pos_normal = 16'h18c2;
              5'h03: pos_normal = 16'h18c3;
              5'h04: pos_normal = 16'h18c4;
              5'h05: pos_normal = 16'h18c5;
              5'h06: pos_normal = 16'h18c6;
              5'h07: pos_normal = 16'h18c7;
              5'h08: pos_normal = 16'h18c8;
              5'h09: pos_normal = 16'h18c9;
              5'h0a: pos_normal = 16'h18ca;
              5'h0b: pos_normal = 16'h18cb;
              5'h0c: pos_normal = 16'h18cc;
              5'h0d: pos_normal = 16'h18cd;
              5'h0e: pos_normal = 16'h18ce;
              5'h0f: pos_normal = 16'h18cf;
              5'h10: pos_normal = 16'h18d0;
              5'h11: pos_normal = 16'h18d1;
              5'h12: pos_normal = 16'h18d2;
              5'h13: pos_normal = 16'h18d3;
              5'h14: pos_normal = 16'h18d4;
              5'h15: pos_normal = 16'h18d5;
              5'h16: pos_normal = 16'h18d6;
              5'h17: pos_normal = 16'h18d7;
              5'h18: pos_normal = 16'h18d8;
              5'h19: pos_normal = 16'h18d9;
              5'h1a: pos_normal = 16'h18da;
              5'h1b: pos_normal = 16'h18db;
              5'h1c: pos_normal = 16'h18dc;
              5'h1d: pos_normal = 16'h18dd;
              5'h1e: pos_normal = 16'h18de;
              5'h1f: pos_normal = 16'h18df;
              default: begin end
            endcase
          end
          5'h07: begin
            pos_normal = 16'h18e0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h18e1;
              5'h02: pos_normal = 16'h18e2;
              5'h03: pos_normal = 16'h18e3;
              5'h04: pos_normal = 16'h18e4;
              5'h05: pos_normal = 16'h18e5;
              5'h06: pos_normal = 16'h18e6;
              5'h07: pos_normal = 16'h18e7;
              5'h08: pos_normal = 16'h18e8;
              5'h09: pos_normal = 16'h18e9;
              5'h0a: pos_normal = 16'h18ea;
              5'h0b: pos_normal = 16'h18eb;
              5'h0c: pos_normal = 16'h18ec;
              5'h0d: pos_normal = 16'h18ed;
              5'h0e: pos_normal = 16'h18ee;
              5'h0f: pos_normal = 16'h18ef;
              5'h10: pos_normal = 16'h18f0;
              5'h11: pos_normal = 16'h18f1;
              5'h12: pos_normal = 16'h18f2;
              5'h13: pos_normal = 16'h18f3;
              5'h14: pos_normal = 16'h18f4;
              5'h15: pos_normal = 16'h18f5;
              5'h16: pos_normal = 16'h18f6;
              5'h17: pos_normal = 16'h18f7;
              5'h18: pos_normal = 16'h18f8;
              5'h19: pos_normal = 16'h18f9;
              5'h1a: pos_normal = 16'h18fa;
              5'h1b: pos_normal = 16'h18fb;
              5'h1c: pos_normal = 16'h18fc;
              5'h1d: pos_normal = 16'h18fd;
              5'h1e: pos_normal = 16'h18fe;
              5'h1f: pos_normal = 16'h18ff;
              default: begin end
            endcase
          end
          5'h08: begin
            pos_normal = 16'h1900;
            case (mant[4:0])
              5'h01: pos_normal = 16'h1901;
              5'h02: pos_normal = 16'h1902;
              5'h03: pos_normal = 16'h1903;
              5'h04: pos_normal = 16'h1904;
              5'h05: pos_normal = 16'h1905;
              5'h06: pos_normal = 16'h1906;
              5'h07: pos_normal = 16'h1907;
              5'h08: pos_normal = 16'h1908;
              5'h09: pos_normal = 16'h1909;
              5'h0a: pos_normal = 16'h190a;
              5'h0b: pos_normal = 16'h190b;
              5'h0c: pos_normal = 16'h190c;
              5'h0d: pos_normal = 16'h190d;
              5'h0e: pos_normal = 16'h190e;
              5'h0f: pos_normal = 16'h190f;
              5'h10: pos_normal = 16'h1910;
              5'h11: pos_normal = 16'h1911;
              5'h12: pos_normal = 16'h1912;
              5'h13: pos_normal = 16'h1913;
              5'h14: pos_normal = 16'h1914;
              5'h15: pos_normal = 16'h1915;
              5'h16: pos_normal = 16'h1916;
              5'h17: pos_normal = 16'h1917;
              5'h18: pos_normal = 16'h1918;
              5'h19: pos_normal = 16'h1919;
              5'h1a: pos_normal = 16'h191a;
              5'h1b: pos_normal = 16'h191b;
              5'h1c: pos_normal = 16'h191c;
              5'h1d: pos_normal = 16'h191d;
              5'h1e: pos_normal = 16'h191e;
              5'h1f: pos_normal = 16'h191f;
              default: begin end
            endcase
          end
          5'h09: begin
            pos_normal = 16'h1920;
            case (mant[4:0])
              5'h01: pos_normal = 16'h1921;
              5'h02: pos_normal = 16'h1922;
              5'h03: pos_normal = 16'h1923;
              5'h04: pos_normal = 16'h1924;
              5'h05: pos_normal = 16'h1925;
              5'h06: pos_normal = 16'h1926;
              5'h07: pos_normal = 16'h1927;
              5'h08: pos_normal = 16'h1928;
              5'h09: pos_normal = 16'h1929;
              5'h0a: pos_normal = 16'h192a;
              5'h0b: pos_normal = 16'h192b;
              5'h0c: pos_normal = 16'h192c;
              5'h0d: pos_normal = 16'h192d;
              5'h0e: pos_normal = 16'h192e;
              5'h0f: pos_normal = 16'h192f;
              5'h10: pos_normal = 16'h1930;
              5'h11: pos_normal = 16'h1931;
              5'h12: pos_normal = 16'h1932;
              5'h13: pos_normal = 16'h1933;
              5'h14: pos_normal = 16'h1934;
              5'h15: pos_normal = 16'h1935;
              5'h16: pos_normal = 16'h1936;
              5'h17: pos_normal = 16'h1937;
              5'h18: pos_normal = 16'h1938;
              5'h19: pos_normal = 16'h1939;
              5'h1a: pos_normal = 16'h193a;
              5'h1b: pos_normal = 16'h193b;
              5'h1c: pos_normal = 16'h193c;
              5'h1d: pos_normal = 16'h193d;
              5'h1e: pos_normal = 16'h193e;
              5'h1f: pos_normal = 16'h193f;
              default: begin end
            endcase
          end
          5'h0a: begin
            pos_normal = 16'h1940;
            case (mant[4:0])
              5'h01: pos_normal = 16'h1941;
              5'h02: pos_normal = 16'h1942;
              5'h03: pos_normal = 16'h1943;
              5'h04: pos_normal = 16'h1944;
              5'h05: pos_normal = 16'h1945;
              5'h06: pos_normal = 16'h1946;
              5'h07: pos_normal = 16'h1947;
              5'h08: pos_normal = 16'h1948;
              5'h09: pos_normal = 16'h1949;
              5'h0a: pos_normal = 16'h194a;
              5'h0b: pos_normal = 16'h194b;
              5'h0c: pos_normal = 16'h194c;
              5'h0d: pos_normal = 16'h194d;
              5'h0e: pos_normal = 16'h194e;
              5'h0f: pos_normal = 16'h194f;
              5'h10: pos_normal = 16'h1950;
              5'h11: pos_normal = 16'h1951;
              5'h12: pos_normal = 16'h1952;
              5'h13: pos_normal = 16'h1953;
              5'h14: pos_normal = 16'h1954;
              5'h15: pos_normal = 16'h1955;
              5'h16: pos_normal = 16'h1956;
              5'h17: pos_normal = 16'h1957;
              5'h18: pos_normal = 16'h1958;
              5'h19: pos_normal = 16'h1959;
              5'h1a: pos_normal = 16'h195a;
              5'h1b: pos_normal = 16'h195b;
              5'h1c: pos_normal = 16'h195c;
              5'h1d: pos_normal = 16'h195d;
              5'h1e: pos_normal = 16'h195e;
              5'h1f: pos_normal = 16'h195f;
              default: begin end
            endcase
          end
          5'h0b: begin
            pos_normal = 16'h1960;
            case (mant[4:0])
              5'h01: pos_normal = 16'h1961;
              5'h02: pos_normal = 16'h1962;
              5'h03: pos_normal = 16'h1963;
              5'h04: pos_normal = 16'h1964;
              5'h05: pos_normal = 16'h1965;
              5'h06: pos_normal = 16'h1966;
              5'h07: pos_normal = 16'h1967;
              5'h08: pos_normal = 16'h1968;
              5'h09: pos_normal = 16'h1969;
              5'h0a: pos_normal = 16'h196a;
              5'h0b: pos_normal = 16'h196b;
              5'h0c: pos_normal = 16'h196c;
              5'h0d: pos_normal = 16'h196d;
              5'h0e: pos_normal = 16'h196e;
              5'h0f: pos_normal = 16'h196f;
              5'h10: pos_normal = 16'h1970;
              5'h11: pos_normal = 16'h1971;
              5'h12: pos_normal = 16'h1972;
              5'h13: pos_normal = 16'h1973;
              5'h14: pos_normal = 16'h1974;
              5'h15: pos_normal = 16'h1975;
              5'h16: pos_normal = 16'h1976;
              5'h17: pos_normal = 16'h1977;
              5'h18: pos_normal = 16'h1978;
              5'h19: pos_normal = 16'h1979;
              5'h1a: pos_normal = 16'h197a;
              5'h1b: pos_normal = 16'h197b;
              5'h1c: pos_normal = 16'h197c;
              5'h1d: pos_normal = 16'h197d;
              5'h1e: pos_normal = 16'h197e;
              5'h1f: pos_normal = 16'h197f;
              default: begin end
            endcase
          end
          5'h0c: begin
            pos_normal = 16'h1980;
            case (mant[4:0])
              5'h01: pos_normal = 16'h1981;
              5'h02: pos_normal = 16'h1982;
              5'h03: pos_normal = 16'h1983;
              5'h04: pos_normal = 16'h1984;
              5'h05: pos_normal = 16'h1985;
              5'h06: pos_normal = 16'h1986;
              5'h07: pos_normal = 16'h1987;
              5'h08: pos_normal = 16'h1988;
              5'h09: pos_normal = 16'h1989;
              5'h0a: pos_normal = 16'h198a;
              5'h0b: pos_normal = 16'h198b;
              5'h0c: pos_normal = 16'h198c;
              5'h0d: pos_normal = 16'h198d;
              5'h0e: pos_normal = 16'h198e;
              5'h0f: pos_normal = 16'h198f;
              5'h10: pos_normal = 16'h1990;
              5'h11: pos_normal = 16'h1991;
              5'h12: pos_normal = 16'h1992;
              5'h13: pos_normal = 16'h1993;
              5'h14: pos_normal = 16'h1994;
              5'h15: pos_normal = 16'h1995;
              5'h16: pos_normal = 16'h1996;
              5'h17: pos_normal = 16'h1997;
              5'h18: pos_normal = 16'h1998;
              5'h19: pos_normal = 16'h1999;
              5'h1a: pos_normal = 16'h199a;
              5'h1b: pos_normal = 16'h199b;
              5'h1c: pos_normal = 16'h199c;
              5'h1d: pos_normal = 16'h199d;
              5'h1e: pos_normal = 16'h199e;
              5'h1f: pos_normal = 16'h199f;
              default: begin end
            endcase
          end
          5'h0d: begin
            pos_normal = 16'h19a0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h19a1;
              5'h02: pos_normal = 16'h19a2;
              5'h03: pos_normal = 16'h19a3;
              5'h04: pos_normal = 16'h19a4;
              5'h05: pos_normal = 16'h19a5;
              5'h06: pos_normal = 16'h19a6;
              5'h07: pos_normal = 16'h19a7;
              5'h08: pos_normal = 16'h19a8;
              5'h09: pos_normal = 16'h19a9;
              5'h0a: pos_normal = 16'h19aa;
              5'h0b: pos_normal = 16'h19ab;
              5'h0c: pos_normal = 16'h19ac;
              5'h0d: pos_normal = 16'h19ad;
              5'h0e: pos_normal = 16'h19ae;
              5'h0f: pos_normal = 16'h19af;
              5'h10: pos_normal = 16'h19b0;
              5'h11: pos_normal = 16'h19b1;
              5'h12: pos_normal = 16'h19b2;
              5'h13: pos_normal = 16'h19b3;
              5'h14: pos_normal = 16'h19b4;
              5'h15: pos_normal = 16'h19b5;
              5'h16: pos_normal = 16'h19b6;
              5'h17: pos_normal = 16'h19b7;
              5'h18: pos_normal = 16'h19b8;
              5'h19: pos_normal = 16'h19b9;
              5'h1a: pos_normal = 16'h19ba;
              5'h1b: pos_normal = 16'h19bb;
              5'h1c: pos_normal = 16'h19bc;
              5'h1d: pos_normal = 16'h19bd;
              5'h1e: pos_normal = 16'h19be;
              5'h1f: pos_normal = 16'h19bf;
              default: begin end
            endcase
          end
          5'h0e: begin
            pos_normal = 16'h19c0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h19c1;
              5'h02: pos_normal = 16'h19c2;
              5'h03: pos_normal = 16'h19c3;
              5'h04: pos_normal = 16'h19c4;
              5'h05: pos_normal = 16'h19c5;
              5'h06: pos_normal = 16'h19c6;
              5'h07: pos_normal = 16'h19c7;
              5'h08: pos_normal = 16'h19c8;
              5'h09: pos_normal = 16'h19c9;
              5'h0a: pos_normal = 16'h19ca;
              5'h0b: pos_normal = 16'h19cb;
              5'h0c: pos_normal = 16'h19cc;
              5'h0d: pos_normal = 16'h19cd;
              5'h0e: pos_normal = 16'h19ce;
              5'h0f: pos_normal = 16'h19cf;
              5'h10: pos_normal = 16'h19d0;
              5'h11: pos_normal = 16'h19d1;
              5'h12: pos_normal = 16'h19d2;
              5'h13: pos_normal = 16'h19d3;
              5'h14: pos_normal = 16'h19d4;
              5'h15: pos_normal = 16'h19d5;
              5'h16: pos_normal = 16'h19d6;
              5'h17: pos_normal = 16'h19d7;
              5'h18: pos_normal = 16'h19d8;
              5'h19: pos_normal = 16'h19d9;
              5'h1a: pos_normal = 16'h19da;
              5'h1b: pos_normal = 16'h19db;
              5'h1c: pos_normal = 16'h19dc;
              5'h1d: pos_normal = 16'h19dd;
              5'h1e: pos_normal = 16'h19de;
              5'h1f: pos_normal = 16'h19df;
              default: begin end
            endcase
          end
          5'h0f: begin
            pos_normal = 16'h19e0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h19e1;
              5'h02: pos_normal = 16'h19e2;
              5'h03: pos_normal = 16'h19e3;
              5'h04: pos_normal = 16'h19e4;
              5'h05: pos_normal = 16'h19e5;
              5'h06: pos_normal = 16'h19e6;
              5'h07: pos_normal = 16'h19e7;
              5'h08: pos_normal = 16'h19e8;
              5'h09: pos_normal = 16'h19e9;
              5'h0a: pos_normal = 16'h19ea;
              5'h0b: pos_normal = 16'h19eb;
              5'h0c: pos_normal = 16'h19ec;
              5'h0d: pos_normal = 16'h19ed;
              5'h0e: pos_normal = 16'h19ee;
              5'h0f: pos_normal = 16'h19ef;
              5'h10: pos_normal = 16'h19f0;
              5'h11: pos_normal = 16'h19f1;
              5'h12: pos_normal = 16'h19f2;
              5'h13: pos_normal = 16'h19f3;
              5'h14: pos_normal = 16'h19f4;
              5'h15: pos_normal = 16'h19f5;
              5'h16: pos_normal = 16'h19f6;
              5'h17: pos_normal = 16'h19f7;
              5'h18: pos_normal = 16'h19f8;
              5'h19: pos_normal = 16'h19f9;
              5'h1a: pos_normal = 16'h19fa;
              5'h1b: pos_normal = 16'h19fb;
              5'h1c: pos_normal = 16'h19fc;
              5'h1d: pos_normal = 16'h19fd;
              5'h1e: pos_normal = 16'h19fe;
              5'h1f: pos_normal = 16'h19ff;
              default: begin end
            endcase
          end
          5'h10: begin
            pos_normal = 16'h1a00;
            case (mant[4:0])
              5'h01: pos_normal = 16'h1a01;
              5'h02: pos_normal = 16'h1a02;
              5'h03: pos_normal = 16'h1a03;
              5'h04: pos_normal = 16'h1a04;
              5'h05: pos_normal = 16'h1a05;
              5'h06: pos_normal = 16'h1a06;
              5'h07: pos_normal = 16'h1a07;
              5'h08: pos_normal = 16'h1a08;
              5'h09: pos_normal = 16'h1a09;
              5'h0a: pos_normal = 16'h1a0a;
              5'h0b: pos_normal = 16'h1a0b;
              5'h0c: pos_normal = 16'h1a0c;
              5'h0d: pos_normal = 16'h1a0d;
              5'h0e: pos_normal = 16'h1a0e;
              5'h0f: pos_normal = 16'h1a0f;
              5'h10: pos_normal = 16'h1a10;
              5'h11: pos_normal = 16'h1a11;
              5'h12: pos_normal = 16'h1a12;
              5'h13: pos_normal = 16'h1a13;
              5'h14: pos_normal = 16'h1a14;
              5'h15: pos_normal = 16'h1a15;
              5'h16: pos_normal = 16'h1a16;
              5'h17: pos_normal = 16'h1a17;
              5'h18: pos_normal = 16'h1a18;
              5'h19: pos_normal = 16'h1a19;
              5'h1a: pos_normal = 16'h1a1a;
              5'h1b: pos_normal = 16'h1a1b;
              5'h1c: pos_normal = 16'h1a1c;
              5'h1d: pos_normal = 16'h1a1d;
              5'h1e: pos_normal = 16'h1a1e;
              5'h1f: pos_normal = 16'h1a1f;
              default: begin end
            endcase
          end
          5'h11: begin
            pos_normal = 16'h1a20;
            case (mant[4:0])
              5'h01: pos_normal = 16'h1a21;
              5'h02: pos_normal = 16'h1a22;
              5'h03: pos_normal = 16'h1a23;
              5'h04: pos_normal = 16'h1a24;
              5'h05: pos_normal = 16'h1a25;
              5'h06: pos_normal = 16'h1a26;
              5'h07: pos_normal = 16'h1a27;
              5'h08: pos_normal = 16'h1a28;
              5'h09: pos_normal = 16'h1a29;
              5'h0a: pos_normal = 16'h1a2a;
              5'h0b: pos_normal = 16'h1a2b;
              5'h0c: pos_normal = 16'h1a2c;
              5'h0d: pos_normal = 16'h1a2d;
              5'h0e: pos_normal = 16'h1a2e;
              5'h0f: pos_normal = 16'h1a2f;
              5'h10: pos_normal = 16'h1a30;
              5'h11: pos_normal = 16'h1a31;
              5'h12: pos_normal = 16'h1a32;
              5'h13: pos_normal = 16'h1a33;
              5'h14: pos_normal = 16'h1a34;
              5'h15: pos_normal = 16'h1a35;
              5'h16: pos_normal = 16'h1a36;
              5'h17: pos_normal = 16'h1a37;
              5'h18: pos_normal = 16'h1a38;
              5'h19: pos_normal = 16'h1a39;
              5'h1a: pos_normal = 16'h1a3a;
              5'h1b: pos_normal = 16'h1a3b;
              5'h1c: pos_normal = 16'h1a3c;
              5'h1d: pos_normal = 16'h1a3d;
              5'h1e: pos_normal = 16'h1a3e;
              5'h1f: pos_normal = 16'h1a3f;
              default: begin end
            endcase
          end
          5'h12: begin
            pos_normal = 16'h1a40;
            case (mant[4:0])
              5'h01: pos_normal = 16'h1a41;
              5'h02: pos_normal = 16'h1a42;
              5'h03: pos_normal = 16'h1a43;
              5'h04: pos_normal = 16'h1a44;
              5'h05: pos_normal = 16'h1a45;
              5'h06: pos_normal = 16'h1a46;
              5'h07: pos_normal = 16'h1a47;
              5'h08: pos_normal = 16'h1a48;
              5'h09: pos_normal = 16'h1a49;
              5'h0a: pos_normal = 16'h1a4a;
              5'h0b: pos_normal = 16'h1a4b;
              5'h0c: pos_normal = 16'h1a4c;
              5'h0d: pos_normal = 16'h1a4d;
              5'h0e: pos_normal = 16'h1a4e;
              5'h0f: pos_normal = 16'h1a4f;
              5'h10: pos_normal = 16'h1a50;
              5'h11: pos_normal = 16'h1a51;
              5'h12: pos_normal = 16'h1a52;
              5'h13: pos_normal = 16'h1a53;
              5'h14: pos_normal = 16'h1a54;
              5'h15: pos_normal = 16'h1a55;
              5'h16: pos_normal = 16'h1a56;
              5'h17: pos_normal = 16'h1a57;
              5'h18: pos_normal = 16'h1a58;
              5'h19: pos_normal = 16'h1a59;
              5'h1a: pos_normal = 16'h1a5a;
              5'h1b: pos_normal = 16'h1a5b;
              5'h1c: pos_normal = 16'h1a5c;
              5'h1d: pos_normal = 16'h1a5d;
              5'h1e: pos_normal = 16'h1a5e;
              5'h1f: pos_normal = 16'h1a5f;
              default: begin end
            endcase
          end
          5'h13: begin
            pos_normal = 16'h1a60;
            case (mant[4:0])
              5'h01: pos_normal = 16'h1a61;
              5'h02: pos_normal = 16'h1a62;
              5'h03: pos_normal = 16'h1a63;
              5'h04: pos_normal = 16'h1a64;
              5'h05: pos_normal = 16'h1a65;
              5'h06: pos_normal = 16'h1a66;
              5'h07: pos_normal = 16'h1a67;
              5'h08: pos_normal = 16'h1a68;
              5'h09: pos_normal = 16'h1a69;
              5'h0a: pos_normal = 16'h1a6a;
              5'h0b: pos_normal = 16'h1a6b;
              5'h0c: pos_normal = 16'h1a6c;
              5'h0d: pos_normal = 16'h1a6d;
              5'h0e: pos_normal = 16'h1a6e;
              5'h0f: pos_normal = 16'h1a6f;
              5'h10: pos_normal = 16'h1a70;
              5'h11: pos_normal = 16'h1a71;
              5'h12: pos_normal = 16'h1a72;
              5'h13: pos_normal = 16'h1a73;
              5'h14: pos_normal = 16'h1a74;
              5'h15: pos_normal = 16'h1a75;
              5'h16: pos_normal = 16'h1a76;
              5'h17: pos_normal = 16'h1a77;
              5'h18: pos_normal = 16'h1a78;
              5'h19: pos_normal = 16'h1a79;
              5'h1a: pos_normal = 16'h1a7a;
              5'h1b: pos_normal = 16'h1a7b;
              5'h1c: pos_normal = 16'h1a7c;
              5'h1d: pos_normal = 16'h1a7d;
              5'h1e: pos_normal = 16'h1a7e;
              5'h1f: pos_normal = 16'h1a7f;
              default: begin end
            endcase
          end
          5'h14: begin
            pos_normal = 16'h1a80;
            case (mant[4:0])
              5'h01: pos_normal = 16'h1a81;
              5'h02: pos_normal = 16'h1a82;
              5'h03: pos_normal = 16'h1a83;
              5'h04: pos_normal = 16'h1a84;
              5'h05: pos_normal = 16'h1a85;
              5'h06: pos_normal = 16'h1a86;
              5'h07: pos_normal = 16'h1a87;
              5'h08: pos_normal = 16'h1a88;
              5'h09: pos_normal = 16'h1a89;
              5'h0a: pos_normal = 16'h1a8a;
              5'h0b: pos_normal = 16'h1a8b;
              5'h0c: pos_normal = 16'h1a8c;
              5'h0d: pos_normal = 16'h1a8d;
              5'h0e: pos_normal = 16'h1a8e;
              5'h0f: pos_normal = 16'h1a8f;
              5'h10: pos_normal = 16'h1a90;
              5'h11: pos_normal = 16'h1a91;
              5'h12: pos_normal = 16'h1a92;
              5'h13: pos_normal = 16'h1a93;
              5'h14: pos_normal = 16'h1a94;
              5'h15: pos_normal = 16'h1a95;
              5'h16: pos_normal = 16'h1a96;
              5'h17: pos_normal = 16'h1a97;
              5'h18: pos_normal = 16'h1a98;
              5'h19: pos_normal = 16'h1a99;
              5'h1a: pos_normal = 16'h1a9a;
              5'h1b: pos_normal = 16'h1a9b;
              5'h1c: pos_normal = 16'h1a9c;
              5'h1d: pos_normal = 16'h1a9d;
              5'h1e: pos_normal = 16'h1a9e;
              5'h1f: pos_normal = 16'h1a9f;
              default: begin end
            endcase
          end
          5'h15: begin
            pos_normal = 16'h1aa0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h1aa1;
              5'h02: pos_normal = 16'h1aa2;
              5'h03: pos_normal = 16'h1aa3;
              5'h04: pos_normal = 16'h1aa4;
              5'h05: pos_normal = 16'h1aa5;
              5'h06: pos_normal = 16'h1aa6;
              5'h07: pos_normal = 16'h1aa7;
              5'h08: pos_normal = 16'h1aa8;
              5'h09: pos_normal = 16'h1aa9;
              5'h0a: pos_normal = 16'h1aaa;
              5'h0b: pos_normal = 16'h1aab;
              5'h0c: pos_normal = 16'h1aac;
              5'h0d: pos_normal = 16'h1aad;
              5'h0e: pos_normal = 16'h1aae;
              5'h0f: pos_normal = 16'h1aaf;
              5'h10: pos_normal = 16'h1ab0;
              5'h11: pos_normal = 16'h1ab1;
              5'h12: pos_normal = 16'h1ab2;
              5'h13: pos_normal = 16'h1ab3;
              5'h14: pos_normal = 16'h1ab4;
              5'h15: pos_normal = 16'h1ab5;
              5'h16: pos_normal = 16'h1ab6;
              5'h17: pos_normal = 16'h1ab7;
              5'h18: pos_normal = 16'h1ab8;
              5'h19: pos_normal = 16'h1ab9;
              5'h1a: pos_normal = 16'h1aba;
              5'h1b: pos_normal = 16'h1abb;
              5'h1c: pos_normal = 16'h1abc;
              5'h1d: pos_normal = 16'h1abd;
              5'h1e: pos_normal = 16'h1abe;
              5'h1f: pos_normal = 16'h1abf;
              default: begin end
            endcase
          end
          5'h16: begin
            pos_normal = 16'h1ac0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h1ac1;
              5'h02: pos_normal = 16'h1ac2;
              5'h03: pos_normal = 16'h1ac3;
              5'h04: pos_normal = 16'h1ac4;
              5'h05: pos_normal = 16'h1ac5;
              5'h06: pos_normal = 16'h1ac6;
              5'h07: pos_normal = 16'h1ac7;
              5'h08: pos_normal = 16'h1ac8;
              5'h09: pos_normal = 16'h1ac9;
              5'h0a: pos_normal = 16'h1aca;
              5'h0b: pos_normal = 16'h1acb;
              5'h0c: pos_normal = 16'h1acc;
              5'h0d: pos_normal = 16'h1acd;
              5'h0e: pos_normal = 16'h1ace;
              5'h0f: pos_normal = 16'h1acf;
              5'h10: pos_normal = 16'h1ad0;
              5'h11: pos_normal = 16'h1ad1;
              5'h12: pos_normal = 16'h1ad2;
              5'h13: pos_normal = 16'h1ad3;
              5'h14: pos_normal = 16'h1ad4;
              5'h15: pos_normal = 16'h1ad5;
              5'h16: pos_normal = 16'h1ad6;
              5'h17: pos_normal = 16'h1ad7;
              5'h18: pos_normal = 16'h1ad8;
              5'h19: pos_normal = 16'h1ad9;
              5'h1a: pos_normal = 16'h1ada;
              5'h1b: pos_normal = 16'h1adb;
              5'h1c: pos_normal = 16'h1adc;
              5'h1d: pos_normal = 16'h1add;
              5'h1e: pos_normal = 16'h1ade;
              5'h1f: pos_normal = 16'h1adf;
              default: begin end
            endcase
          end
          5'h17: begin
            pos_normal = 16'h1ae0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h1ae1;
              5'h02: pos_normal = 16'h1ae2;
              5'h03: pos_normal = 16'h1ae3;
              5'h04: pos_normal = 16'h1ae4;
              5'h05: pos_normal = 16'h1ae5;
              5'h06: pos_normal = 16'h1ae6;
              5'h07: pos_normal = 16'h1ae7;
              5'h08: pos_normal = 16'h1ae8;
              5'h09: pos_normal = 16'h1ae9;
              5'h0a: pos_normal = 16'h1aea;
              5'h0b: pos_normal = 16'h1aeb;
              5'h0c: pos_normal = 16'h1aec;
              5'h0d: pos_normal = 16'h1aed;
              5'h0e: pos_normal = 16'h1aee;
              5'h0f: pos_normal = 16'h1aef;
              5'h10: pos_normal = 16'h1af0;
              5'h11: pos_normal = 16'h1af1;
              5'h12: pos_normal = 16'h1af2;
              5'h13: pos_normal = 16'h1af3;
              5'h14: pos_normal = 16'h1af4;
              5'h15: pos_normal = 16'h1af5;
              5'h16: pos_normal = 16'h1af6;
              5'h17: pos_normal = 16'h1af7;
              5'h18: pos_normal = 16'h1af8;
              5'h19: pos_normal = 16'h1af9;
              5'h1a: pos_normal = 16'h1afa;
              5'h1b: pos_normal = 16'h1afb;
              5'h1c: pos_normal = 16'h1afc;
              5'h1d: pos_normal = 16'h1afd;
              5'h1e: pos_normal = 16'h1afe;
              5'h1f: pos_normal = 16'h1aff;
              default: begin end
            endcase
          end
          5'h18: begin
            pos_normal = 16'h1b00;
            case (mant[4:0])
              5'h01: pos_normal = 16'h1b01;
              5'h02: pos_normal = 16'h1b02;
              5'h03: pos_normal = 16'h1b03;
              5'h04: pos_normal = 16'h1b04;
              5'h05: pos_normal = 16'h1b05;
              5'h06: pos_normal = 16'h1b06;
              5'h07: pos_normal = 16'h1b07;
              5'h08: pos_normal = 16'h1b08;
              5'h09: pos_normal = 16'h1b09;
              5'h0a: pos_normal = 16'h1b0a;
              5'h0b: pos_normal = 16'h1b0b;
              5'h0c: pos_normal = 16'h1b0c;
              5'h0d: pos_normal = 16'h1b0d;
              5'h0e: pos_normal = 16'h1b0e;
              5'h0f: pos_normal = 16'h1b0f;
              5'h10: pos_normal = 16'h1b10;
              5'h11: pos_normal = 16'h1b11;
              5'h12: pos_normal = 16'h1b12;
              5'h13: pos_normal = 16'h1b13;
              5'h14: pos_normal = 16'h1b14;
              5'h15: pos_normal = 16'h1b15;
              5'h16: pos_normal = 16'h1b16;
              5'h17: pos_normal = 16'h1b17;
              5'h18: pos_normal = 16'h1b18;
              5'h19: pos_normal = 16'h1b19;
              5'h1a: pos_normal = 16'h1b1a;
              5'h1b: pos_normal = 16'h1b1b;
              5'h1c: pos_normal = 16'h1b1c;
              5'h1d: pos_normal = 16'h1b1d;
              5'h1e: pos_normal = 16'h1b1e;
              5'h1f: pos_normal = 16'h1b1f;
              default: begin end
            endcase
          end
          5'h19: begin
            pos_normal = 16'h1b20;
            case (mant[4:0])
              5'h01: pos_normal = 16'h1b21;
              5'h02: pos_normal = 16'h1b22;
              5'h03: pos_normal = 16'h1b23;
              5'h04: pos_normal = 16'h1b24;
              5'h05: pos_normal = 16'h1b25;
              5'h06: pos_normal = 16'h1b26;
              5'h07: pos_normal = 16'h1b27;
              5'h08: pos_normal = 16'h1b28;
              5'h09: pos_normal = 16'h1b29;
              5'h0a: pos_normal = 16'h1b2a;
              5'h0b: pos_normal = 16'h1b2b;
              5'h0c: pos_normal = 16'h1b2c;
              5'h0d: pos_normal = 16'h1b2d;
              5'h0e: pos_normal = 16'h1b2e;
              5'h0f: pos_normal = 16'h1b2f;
              5'h10: pos_normal = 16'h1b30;
              5'h11: pos_normal = 16'h1b31;
              5'h12: pos_normal = 16'h1b32;
              5'h13: pos_normal = 16'h1b33;
              5'h14: pos_normal = 16'h1b34;
              5'h15: pos_normal = 16'h1b35;
              5'h16: pos_normal = 16'h1b36;
              5'h17: pos_normal = 16'h1b37;
              5'h18: pos_normal = 16'h1b38;
              5'h19: pos_normal = 16'h1b39;
              5'h1a: pos_normal = 16'h1b3a;
              5'h1b: pos_normal = 16'h1b3b;
              5'h1c: pos_normal = 16'h1b3c;
              5'h1d: pos_normal = 16'h1b3d;
              5'h1e: pos_normal = 16'h1b3e;
              5'h1f: pos_normal = 16'h1b3f;
              default: begin end
            endcase
          end
          5'h1a: begin
            pos_normal = 16'h1b40;
            case (mant[4:0])
              5'h01: pos_normal = 16'h1b41;
              5'h02: pos_normal = 16'h1b42;
              5'h03: pos_normal = 16'h1b43;
              5'h04: pos_normal = 16'h1b44;
              5'h05: pos_normal = 16'h1b45;
              5'h06: pos_normal = 16'h1b46;
              5'h07: pos_normal = 16'h1b47;
              5'h08: pos_normal = 16'h1b48;
              5'h09: pos_normal = 16'h1b49;
              5'h0a: pos_normal = 16'h1b4a;
              5'h0b: pos_normal = 16'h1b4b;
              5'h0c: pos_normal = 16'h1b4c;
              5'h0d: pos_normal = 16'h1b4d;
              5'h0e: pos_normal = 16'h1b4e;
              5'h0f: pos_normal = 16'h1b4f;
              5'h10: pos_normal = 16'h1b50;
              5'h11: pos_normal = 16'h1b51;
              5'h12: pos_normal = 16'h1b52;
              5'h13: pos_normal = 16'h1b53;
              5'h14: pos_normal = 16'h1b54;
              5'h15: pos_normal = 16'h1b55;
              5'h16: pos_normal = 16'h1b56;
              5'h17: pos_normal = 16'h1b57;
              5'h18: pos_normal = 16'h1b58;
              5'h19: pos_normal = 16'h1b59;
              5'h1a: pos_normal = 16'h1b5a;
              5'h1b: pos_normal = 16'h1b5b;
              5'h1c: pos_normal = 16'h1b5c;
              5'h1d: pos_normal = 16'h1b5d;
              5'h1e: pos_normal = 16'h1b5e;
              5'h1f: pos_normal = 16'h1b5f;
              default: begin end
            endcase
          end
          5'h1b: begin
            pos_normal = 16'h1b60;
            case (mant[4:0])
              5'h01: pos_normal = 16'h1b61;
              5'h02: pos_normal = 16'h1b62;
              5'h03: pos_normal = 16'h1b63;
              5'h04: pos_normal = 16'h1b64;
              5'h05: pos_normal = 16'h1b65;
              5'h06: pos_normal = 16'h1b66;
              5'h07: pos_normal = 16'h1b67;
              5'h08: pos_normal = 16'h1b68;
              5'h09: pos_normal = 16'h1b69;
              5'h0a: pos_normal = 16'h1b6a;
              5'h0b: pos_normal = 16'h1b6b;
              5'h0c: pos_normal = 16'h1b6c;
              5'h0d: pos_normal = 16'h1b6d;
              5'h0e: pos_normal = 16'h1b6e;
              5'h0f: pos_normal = 16'h1b6f;
              5'h10: pos_normal = 16'h1b70;
              5'h11: pos_normal = 16'h1b71;
              5'h12: pos_normal = 16'h1b72;
              5'h13: pos_normal = 16'h1b73;
              5'h14: pos_normal = 16'h1b74;
              5'h15: pos_normal = 16'h1b75;
              5'h16: pos_normal = 16'h1b76;
              5'h17: pos_normal = 16'h1b77;
              5'h18: pos_normal = 16'h1b78;
              5'h19: pos_normal = 16'h1b79;
              5'h1a: pos_normal = 16'h1b7a;
              5'h1b: pos_normal = 16'h1b7b;
              5'h1c: pos_normal = 16'h1b7c;
              5'h1d: pos_normal = 16'h1b7d;
              5'h1e: pos_normal = 16'h1b7e;
              5'h1f: pos_normal = 16'h1b7f;
              default: begin end
            endcase
          end
          5'h1c: begin
            pos_normal = 16'h1b80;
            case (mant[4:0])
              5'h01: pos_normal = 16'h1b81;
              5'h02: pos_normal = 16'h1b82;
              5'h03: pos_normal = 16'h1b83;
              5'h04: pos_normal = 16'h1b84;
              5'h05: pos_normal = 16'h1b85;
              5'h06: pos_normal = 16'h1b86;
              5'h07: pos_normal = 16'h1b87;
              5'h08: pos_normal = 16'h1b88;
              5'h09: pos_normal = 16'h1b89;
              5'h0a: pos_normal = 16'h1b8a;
              5'h0b: pos_normal = 16'h1b8b;
              5'h0c: pos_normal = 16'h1b8c;
              5'h0d: pos_normal = 16'h1b8d;
              5'h0e: pos_normal = 16'h1b8e;
              5'h0f: pos_normal = 16'h1b8f;
              5'h10: pos_normal = 16'h1b90;
              5'h11: pos_normal = 16'h1b91;
              5'h12: pos_normal = 16'h1b92;
              5'h13: pos_normal = 16'h1b93;
              5'h14: pos_normal = 16'h1b94;
              5'h15: pos_normal = 16'h1b95;
              5'h16: pos_normal = 16'h1b96;
              5'h17: pos_normal = 16'h1b97;
              5'h18: pos_normal = 16'h1b98;
              5'h19: pos_normal = 16'h1b99;
              5'h1a: pos_normal = 16'h1b9a;
              5'h1b: pos_normal = 16'h1b9b;
              5'h1c: pos_normal = 16'h1b9c;
              5'h1d: pos_normal = 16'h1b9d;
              5'h1e: pos_normal = 16'h1b9e;
              5'h1f: pos_normal = 16'h1b9f;
              default: begin end
            endcase
          end
          5'h1d: begin
            pos_normal = 16'h1ba0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h1ba1;
              5'h02: pos_normal = 16'h1ba2;
              5'h03: pos_normal = 16'h1ba3;
              5'h04: pos_normal = 16'h1ba4;
              5'h05: pos_normal = 16'h1ba5;
              5'h06: pos_normal = 16'h1ba6;
              5'h07: pos_normal = 16'h1ba7;
              5'h08: pos_normal = 16'h1ba8;
              5'h09: pos_normal = 16'h1ba9;
              5'h0a: pos_normal = 16'h1baa;
              5'h0b: pos_normal = 16'h1bab;
              5'h0c: pos_normal = 16'h1bac;
              5'h0d: pos_normal = 16'h1bad;
              5'h0e: pos_normal = 16'h1bae;
              5'h0f: pos_normal = 16'h1baf;
              5'h10: pos_normal = 16'h1bb0;
              5'h11: pos_normal = 16'h1bb1;
              5'h12: pos_normal = 16'h1bb2;
              5'h13: pos_normal = 16'h1bb3;
              5'h14: pos_normal = 16'h1bb4;
              5'h15: pos_normal = 16'h1bb5;
              5'h16: pos_normal = 16'h1bb6;
              5'h17: pos_normal = 16'h1bb7;
              5'h18: pos_normal = 16'h1bb8;
              5'h19: pos_normal = 16'h1bb9;
              5'h1a: pos_normal = 16'h1bba;
              5'h1b: pos_normal = 16'h1bbb;
              5'h1c: pos_normal = 16'h1bbc;
              5'h1d: pos_normal = 16'h1bbd;
              5'h1e: pos_normal = 16'h1bbe;
              5'h1f: pos_normal = 16'h1bbf;
              default: begin end
            endcase
          end
          5'h1e: begin
            pos_normal = 16'h1bc0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h1bc1;
              5'h02: pos_normal = 16'h1bc2;
              5'h03: pos_normal = 16'h1bc3;
              5'h04: pos_normal = 16'h1bc4;
              5'h05: pos_normal = 16'h1bc5;
              5'h06: pos_normal = 16'h1bc6;
              5'h07: pos_normal = 16'h1bc7;
              5'h08: pos_normal = 16'h1bc8;
              5'h09: pos_normal = 16'h1bc9;
              5'h0a: pos_normal = 16'h1bca;
              5'h0b: pos_normal = 16'h1bcb;
              5'h0c: pos_normal = 16'h1bcc;
              5'h0d: pos_normal = 16'h1bcd;
              5'h0e: pos_normal = 16'h1bce;
              5'h0f: pos_normal = 16'h1bcf;
              5'h10: pos_normal = 16'h1bd0;
              5'h11: pos_normal = 16'h1bd1;
              5'h12: pos_normal = 16'h1bd2;
              5'h13: pos_normal = 16'h1bd3;
              5'h14: pos_normal = 16'h1bd4;
              5'h15: pos_normal = 16'h1bd5;
              5'h16: pos_normal = 16'h1bd6;
              5'h17: pos_normal = 16'h1bd7;
              5'h18: pos_normal = 16'h1bd8;
              5'h19: pos_normal = 16'h1bd9;
              5'h1a: pos_normal = 16'h1bda;
              5'h1b: pos_normal = 16'h1bdb;
              5'h1c: pos_normal = 16'h1bdc;
              5'h1d: pos_normal = 16'h1bdd;
              5'h1e: pos_normal = 16'h1bde;
              5'h1f: pos_normal = 16'h1bdf;
              default: begin end
            endcase
          end
          5'h1f: begin
            pos_normal = 16'h1be0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h1be1;
              5'h02: pos_normal = 16'h1be2;
              5'h03: pos_normal = 16'h1be3;
              5'h04: pos_normal = 16'h1be4;
              5'h05: pos_normal = 16'h1be5;
              5'h06: pos_normal = 16'h1be6;
              5'h07: pos_normal = 16'h1be7;
              5'h08: pos_normal = 16'h1be8;
              5'h09: pos_normal = 16'h1be9;
              5'h0a: pos_normal = 16'h1bea;
              5'h0b: pos_normal = 16'h1beb;
              5'h0c: pos_normal = 16'h1bec;
              5'h0d: pos_normal = 16'h1bed;
              5'h0e: pos_normal = 16'h1bee;
              5'h0f: pos_normal = 16'h1bef;
              5'h10: pos_normal = 16'h1bf0;
              5'h11: pos_normal = 16'h1bf1;
              5'h12: pos_normal = 16'h1bf2;
              5'h13: pos_normal = 16'h1bf3;
              5'h14: pos_normal = 16'h1bf4;
              5'h15: pos_normal = 16'h1bf5;
              5'h16: pos_normal = 16'h1bf6;
              5'h17: pos_normal = 16'h1bf7;
              5'h18: pos_normal = 16'h1bf8;
              5'h19: pos_normal = 16'h1bf9;
              5'h1a: pos_normal = 16'h1bfa;
              5'h1b: pos_normal = 16'h1bfb;
              5'h1c: pos_normal = 16'h1bfc;
              5'h1d: pos_normal = 16'h1bfd;
              5'h1e: pos_normal = 16'h1bfe;
              5'h1f: pos_normal = 16'h1bff;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      5'h07: begin
        case (mant[9:5])
          5'h00: begin
            pos_normal = 16'h1c00;
            case (mant[4:0])
              5'h01: pos_normal = 16'h1c01;
              5'h02: pos_normal = 16'h1c02;
              5'h03: pos_normal = 16'h1c03;
              5'h04: pos_normal = 16'h1c04;
              5'h05: pos_normal = 16'h1c05;
              5'h06: pos_normal = 16'h1c06;
              5'h07: pos_normal = 16'h1c07;
              5'h08: pos_normal = 16'h1c08;
              5'h09: pos_normal = 16'h1c09;
              5'h0a: pos_normal = 16'h1c0a;
              5'h0b: pos_normal = 16'h1c0b;
              5'h0c: pos_normal = 16'h1c0c;
              5'h0d: pos_normal = 16'h1c0d;
              5'h0e: pos_normal = 16'h1c0e;
              5'h0f: pos_normal = 16'h1c0f;
              5'h10: pos_normal = 16'h1c10;
              5'h11: pos_normal = 16'h1c11;
              5'h12: pos_normal = 16'h1c12;
              5'h13: pos_normal = 16'h1c13;
              5'h14: pos_normal = 16'h1c14;
              5'h15: pos_normal = 16'h1c15;
              5'h16: pos_normal = 16'h1c16;
              5'h17: pos_normal = 16'h1c17;
              5'h18: pos_normal = 16'h1c18;
              5'h19: pos_normal = 16'h1c19;
              5'h1a: pos_normal = 16'h1c1a;
              5'h1b: pos_normal = 16'h1c1b;
              5'h1c: pos_normal = 16'h1c1c;
              5'h1d: pos_normal = 16'h1c1d;
              5'h1e: pos_normal = 16'h1c1e;
              5'h1f: pos_normal = 16'h1c1f;
              default: begin end
            endcase
          end
          5'h01: begin
            pos_normal = 16'h1c20;
            case (mant[4:0])
              5'h01: pos_normal = 16'h1c21;
              5'h02: pos_normal = 16'h1c22;
              5'h03: pos_normal = 16'h1c23;
              5'h04: pos_normal = 16'h1c24;
              5'h05: pos_normal = 16'h1c25;
              5'h06: pos_normal = 16'h1c26;
              5'h07: pos_normal = 16'h1c27;
              5'h08: pos_normal = 16'h1c28;
              5'h09: pos_normal = 16'h1c29;
              5'h0a: pos_normal = 16'h1c2a;
              5'h0b: pos_normal = 16'h1c2b;
              5'h0c: pos_normal = 16'h1c2c;
              5'h0d: pos_normal = 16'h1c2d;
              5'h0e: pos_normal = 16'h1c2e;
              5'h0f: pos_normal = 16'h1c2f;
              5'h10: pos_normal = 16'h1c30;
              5'h11: pos_normal = 16'h1c31;
              5'h12: pos_normal = 16'h1c32;
              5'h13: pos_normal = 16'h1c33;
              5'h14: pos_normal = 16'h1c34;
              5'h15: pos_normal = 16'h1c35;
              5'h16: pos_normal = 16'h1c36;
              5'h17: pos_normal = 16'h1c37;
              5'h18: pos_normal = 16'h1c38;
              5'h19: pos_normal = 16'h1c39;
              5'h1a: pos_normal = 16'h1c3a;
              5'h1b: pos_normal = 16'h1c3b;
              5'h1c: pos_normal = 16'h1c3c;
              5'h1d: pos_normal = 16'h1c3d;
              5'h1e: pos_normal = 16'h1c3e;
              5'h1f: pos_normal = 16'h1c3f;
              default: begin end
            endcase
          end
          5'h02: begin
            pos_normal = 16'h1c40;
            case (mant[4:0])
              5'h01: pos_normal = 16'h1c41;
              5'h02: pos_normal = 16'h1c42;
              5'h03: pos_normal = 16'h1c43;
              5'h04: pos_normal = 16'h1c44;
              5'h05: pos_normal = 16'h1c45;
              5'h06: pos_normal = 16'h1c46;
              5'h07: pos_normal = 16'h1c47;
              5'h08: pos_normal = 16'h1c48;
              5'h09: pos_normal = 16'h1c49;
              5'h0a: pos_normal = 16'h1c4a;
              5'h0b: pos_normal = 16'h1c4b;
              5'h0c: pos_normal = 16'h1c4c;
              5'h0d: pos_normal = 16'h1c4d;
              5'h0e: pos_normal = 16'h1c4e;
              5'h0f: pos_normal = 16'h1c4f;
              5'h10: pos_normal = 16'h1c50;
              5'h11: pos_normal = 16'h1c51;
              5'h12: pos_normal = 16'h1c52;
              5'h13: pos_normal = 16'h1c53;
              5'h14: pos_normal = 16'h1c54;
              5'h15: pos_normal = 16'h1c55;
              5'h16: pos_normal = 16'h1c56;
              5'h17: pos_normal = 16'h1c57;
              5'h18: pos_normal = 16'h1c58;
              5'h19: pos_normal = 16'h1c59;
              5'h1a: pos_normal = 16'h1c5a;
              5'h1b: pos_normal = 16'h1c5b;
              5'h1c: pos_normal = 16'h1c5c;
              5'h1d: pos_normal = 16'h1c5d;
              5'h1e: pos_normal = 16'h1c5e;
              5'h1f: pos_normal = 16'h1c5f;
              default: begin end
            endcase
          end
          5'h03: begin
            pos_normal = 16'h1c60;
            case (mant[4:0])
              5'h01: pos_normal = 16'h1c61;
              5'h02: pos_normal = 16'h1c62;
              5'h03: pos_normal = 16'h1c63;
              5'h04: pos_normal = 16'h1c64;
              5'h05: pos_normal = 16'h1c65;
              5'h06: pos_normal = 16'h1c66;
              5'h07: pos_normal = 16'h1c67;
              5'h08: pos_normal = 16'h1c68;
              5'h09: pos_normal = 16'h1c69;
              5'h0a: pos_normal = 16'h1c6a;
              5'h0b: pos_normal = 16'h1c6b;
              5'h0c: pos_normal = 16'h1c6c;
              5'h0d: pos_normal = 16'h1c6d;
              5'h0e: pos_normal = 16'h1c6e;
              5'h0f: pos_normal = 16'h1c6f;
              5'h10: pos_normal = 16'h1c70;
              5'h11: pos_normal = 16'h1c71;
              5'h12: pos_normal = 16'h1c72;
              5'h13: pos_normal = 16'h1c73;
              5'h14: pos_normal = 16'h1c74;
              5'h15: pos_normal = 16'h1c75;
              5'h16: pos_normal = 16'h1c76;
              5'h17: pos_normal = 16'h1c77;
              5'h18: pos_normal = 16'h1c78;
              5'h19: pos_normal = 16'h1c79;
              5'h1a: pos_normal = 16'h1c7a;
              5'h1b: pos_normal = 16'h1c7b;
              5'h1c: pos_normal = 16'h1c7c;
              5'h1d: pos_normal = 16'h1c7d;
              5'h1e: pos_normal = 16'h1c7e;
              5'h1f: pos_normal = 16'h1c7f;
              default: begin end
            endcase
          end
          5'h04: begin
            pos_normal = 16'h1c80;
            case (mant[4:0])
              5'h01: pos_normal = 16'h1c81;
              5'h02: pos_normal = 16'h1c82;
              5'h03: pos_normal = 16'h1c83;
              5'h04: pos_normal = 16'h1c84;
              5'h05: pos_normal = 16'h1c85;
              5'h06: pos_normal = 16'h1c86;
              5'h07: pos_normal = 16'h1c87;
              5'h08: pos_normal = 16'h1c88;
              5'h09: pos_normal = 16'h1c89;
              5'h0a: pos_normal = 16'h1c8a;
              5'h0b: pos_normal = 16'h1c8b;
              5'h0c: pos_normal = 16'h1c8c;
              5'h0d: pos_normal = 16'h1c8d;
              5'h0e: pos_normal = 16'h1c8e;
              5'h0f: pos_normal = 16'h1c8f;
              5'h10: pos_normal = 16'h1c90;
              5'h11: pos_normal = 16'h1c91;
              5'h12: pos_normal = 16'h1c92;
              5'h13: pos_normal = 16'h1c93;
              5'h14: pos_normal = 16'h1c94;
              5'h15: pos_normal = 16'h1c95;
              5'h16: pos_normal = 16'h1c96;
              5'h17: pos_normal = 16'h1c97;
              5'h18: pos_normal = 16'h1c98;
              5'h19: pos_normal = 16'h1c99;
              5'h1a: pos_normal = 16'h1c9a;
              5'h1b: pos_normal = 16'h1c9b;
              5'h1c: pos_normal = 16'h1c9c;
              5'h1d: pos_normal = 16'h1c9d;
              5'h1e: pos_normal = 16'h1c9e;
              5'h1f: pos_normal = 16'h1c9f;
              default: begin end
            endcase
          end
          5'h05: begin
            pos_normal = 16'h1ca0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h1ca1;
              5'h02: pos_normal = 16'h1ca2;
              5'h03: pos_normal = 16'h1ca3;
              5'h04: pos_normal = 16'h1ca4;
              5'h05: pos_normal = 16'h1ca5;
              5'h06: pos_normal = 16'h1ca6;
              5'h07: pos_normal = 16'h1ca7;
              5'h08: pos_normal = 16'h1ca8;
              5'h09: pos_normal = 16'h1ca9;
              5'h0a: pos_normal = 16'h1caa;
              5'h0b: pos_normal = 16'h1cab;
              5'h0c: pos_normal = 16'h1cac;
              5'h0d: pos_normal = 16'h1cad;
              5'h0e: pos_normal = 16'h1cae;
              5'h0f: pos_normal = 16'h1caf;
              5'h10: pos_normal = 16'h1cb0;
              5'h11: pos_normal = 16'h1cb1;
              5'h12: pos_normal = 16'h1cb2;
              5'h13: pos_normal = 16'h1cb3;
              5'h14: pos_normal = 16'h1cb4;
              5'h15: pos_normal = 16'h1cb5;
              5'h16: pos_normal = 16'h1cb6;
              5'h17: pos_normal = 16'h1cb7;
              5'h18: pos_normal = 16'h1cb8;
              5'h19: pos_normal = 16'h1cb9;
              5'h1a: pos_normal = 16'h1cba;
              5'h1b: pos_normal = 16'h1cbb;
              5'h1c: pos_normal = 16'h1cbc;
              5'h1d: pos_normal = 16'h1cbd;
              5'h1e: pos_normal = 16'h1cbe;
              5'h1f: pos_normal = 16'h1cbf;
              default: begin end
            endcase
          end
          5'h06: begin
            pos_normal = 16'h1cc0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h1cc1;
              5'h02: pos_normal = 16'h1cc2;
              5'h03: pos_normal = 16'h1cc3;
              5'h04: pos_normal = 16'h1cc4;
              5'h05: pos_normal = 16'h1cc5;
              5'h06: pos_normal = 16'h1cc6;
              5'h07: pos_normal = 16'h1cc7;
              5'h08: pos_normal = 16'h1cc8;
              5'h09: pos_normal = 16'h1cc9;
              5'h0a: pos_normal = 16'h1cca;
              5'h0b: pos_normal = 16'h1ccb;
              5'h0c: pos_normal = 16'h1ccc;
              5'h0d: pos_normal = 16'h1ccd;
              5'h0e: pos_normal = 16'h1cce;
              5'h0f: pos_normal = 16'h1ccf;
              5'h10: pos_normal = 16'h1cd0;
              5'h11: pos_normal = 16'h1cd1;
              5'h12: pos_normal = 16'h1cd2;
              5'h13: pos_normal = 16'h1cd3;
              5'h14: pos_normal = 16'h1cd4;
              5'h15: pos_normal = 16'h1cd5;
              5'h16: pos_normal = 16'h1cd6;
              5'h17: pos_normal = 16'h1cd7;
              5'h18: pos_normal = 16'h1cd8;
              5'h19: pos_normal = 16'h1cd9;
              5'h1a: pos_normal = 16'h1cda;
              5'h1b: pos_normal = 16'h1cdb;
              5'h1c: pos_normal = 16'h1cdc;
              5'h1d: pos_normal = 16'h1cdd;
              5'h1e: pos_normal = 16'h1cde;
              5'h1f: pos_normal = 16'h1cdf;
              default: begin end
            endcase
          end
          5'h07: begin
            pos_normal = 16'h1ce0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h1ce1;
              5'h02: pos_normal = 16'h1ce2;
              5'h03: pos_normal = 16'h1ce3;
              5'h04: pos_normal = 16'h1ce4;
              5'h05: pos_normal = 16'h1ce5;
              5'h06: pos_normal = 16'h1ce6;
              5'h07: pos_normal = 16'h1ce7;
              5'h08: pos_normal = 16'h1ce8;
              5'h09: pos_normal = 16'h1ce9;
              5'h0a: pos_normal = 16'h1cea;
              5'h0b: pos_normal = 16'h1ceb;
              5'h0c: pos_normal = 16'h1cec;
              5'h0d: pos_normal = 16'h1ced;
              5'h0e: pos_normal = 16'h1cee;
              5'h0f: pos_normal = 16'h1cef;
              5'h10: pos_normal = 16'h1cf0;
              5'h11: pos_normal = 16'h1cf1;
              5'h12: pos_normal = 16'h1cf2;
              5'h13: pos_normal = 16'h1cf3;
              5'h14: pos_normal = 16'h1cf4;
              5'h15: pos_normal = 16'h1cf5;
              5'h16: pos_normal = 16'h1cf6;
              5'h17: pos_normal = 16'h1cf7;
              5'h18: pos_normal = 16'h1cf8;
              5'h19: pos_normal = 16'h1cf9;
              5'h1a: pos_normal = 16'h1cfa;
              5'h1b: pos_normal = 16'h1cfb;
              5'h1c: pos_normal = 16'h1cfc;
              5'h1d: pos_normal = 16'h1cfd;
              5'h1e: pos_normal = 16'h1cfe;
              5'h1f: pos_normal = 16'h1cff;
              default: begin end
            endcase
          end
          5'h08: begin
            pos_normal = 16'h1d00;
            case (mant[4:0])
              5'h01: pos_normal = 16'h1d01;
              5'h02: pos_normal = 16'h1d02;
              5'h03: pos_normal = 16'h1d03;
              5'h04: pos_normal = 16'h1d04;
              5'h05: pos_normal = 16'h1d05;
              5'h06: pos_normal = 16'h1d06;
              5'h07: pos_normal = 16'h1d07;
              5'h08: pos_normal = 16'h1d08;
              5'h09: pos_normal = 16'h1d09;
              5'h0a: pos_normal = 16'h1d0a;
              5'h0b: pos_normal = 16'h1d0b;
              5'h0c: pos_normal = 16'h1d0c;
              5'h0d: pos_normal = 16'h1d0d;
              5'h0e: pos_normal = 16'h1d0e;
              5'h0f: pos_normal = 16'h1d0f;
              5'h10: pos_normal = 16'h1d10;
              5'h11: pos_normal = 16'h1d11;
              5'h12: pos_normal = 16'h1d12;
              5'h13: pos_normal = 16'h1d13;
              5'h14: pos_normal = 16'h1d14;
              5'h15: pos_normal = 16'h1d15;
              5'h16: pos_normal = 16'h1d16;
              5'h17: pos_normal = 16'h1d17;
              5'h18: pos_normal = 16'h1d18;
              5'h19: pos_normal = 16'h1d19;
              5'h1a: pos_normal = 16'h1d1a;
              5'h1b: pos_normal = 16'h1d1b;
              5'h1c: pos_normal = 16'h1d1c;
              5'h1d: pos_normal = 16'h1d1d;
              5'h1e: pos_normal = 16'h1d1e;
              5'h1f: pos_normal = 16'h1d1f;
              default: begin end
            endcase
          end
          5'h09: begin
            pos_normal = 16'h1d20;
            case (mant[4:0])
              5'h01: pos_normal = 16'h1d21;
              5'h02: pos_normal = 16'h1d22;
              5'h03: pos_normal = 16'h1d23;
              5'h04: pos_normal = 16'h1d24;
              5'h05: pos_normal = 16'h1d25;
              5'h06: pos_normal = 16'h1d26;
              5'h07: pos_normal = 16'h1d27;
              5'h08: pos_normal = 16'h1d28;
              5'h09: pos_normal = 16'h1d29;
              5'h0a: pos_normal = 16'h1d2a;
              5'h0b: pos_normal = 16'h1d2b;
              5'h0c: pos_normal = 16'h1d2c;
              5'h0d: pos_normal = 16'h1d2d;
              5'h0e: pos_normal = 16'h1d2e;
              5'h0f: pos_normal = 16'h1d2f;
              5'h10: pos_normal = 16'h1d30;
              5'h11: pos_normal = 16'h1d31;
              5'h12: pos_normal = 16'h1d32;
              5'h13: pos_normal = 16'h1d33;
              5'h14: pos_normal = 16'h1d34;
              5'h15: pos_normal = 16'h1d35;
              5'h16: pos_normal = 16'h1d36;
              5'h17: pos_normal = 16'h1d37;
              5'h18: pos_normal = 16'h1d38;
              5'h19: pos_normal = 16'h1d39;
              5'h1a: pos_normal = 16'h1d3a;
              5'h1b: pos_normal = 16'h1d3b;
              5'h1c: pos_normal = 16'h1d3c;
              5'h1d: pos_normal = 16'h1d3d;
              5'h1e: pos_normal = 16'h1d3e;
              5'h1f: pos_normal = 16'h1d3f;
              default: begin end
            endcase
          end
          5'h0a: begin
            pos_normal = 16'h1d40;
            case (mant[4:0])
              5'h01: pos_normal = 16'h1d41;
              5'h02: pos_normal = 16'h1d42;
              5'h03: pos_normal = 16'h1d43;
              5'h04: pos_normal = 16'h1d44;
              5'h05: pos_normal = 16'h1d45;
              5'h06: pos_normal = 16'h1d46;
              5'h07: pos_normal = 16'h1d47;
              5'h08: pos_normal = 16'h1d48;
              5'h09: pos_normal = 16'h1d49;
              5'h0a: pos_normal = 16'h1d4a;
              5'h0b: pos_normal = 16'h1d4b;
              5'h0c: pos_normal = 16'h1d4c;
              5'h0d: pos_normal = 16'h1d4d;
              5'h0e: pos_normal = 16'h1d4e;
              5'h0f: pos_normal = 16'h1d4f;
              5'h10: pos_normal = 16'h1d50;
              5'h11: pos_normal = 16'h1d51;
              5'h12: pos_normal = 16'h1d52;
              5'h13: pos_normal = 16'h1d53;
              5'h14: pos_normal = 16'h1d54;
              5'h15: pos_normal = 16'h1d55;
              5'h16: pos_normal = 16'h1d56;
              5'h17: pos_normal = 16'h1d57;
              5'h18: pos_normal = 16'h1d58;
              5'h19: pos_normal = 16'h1d59;
              5'h1a: pos_normal = 16'h1d5a;
              5'h1b: pos_normal = 16'h1d5b;
              5'h1c: pos_normal = 16'h1d5c;
              5'h1d: pos_normal = 16'h1d5d;
              5'h1e: pos_normal = 16'h1d5e;
              5'h1f: pos_normal = 16'h1d5f;
              default: begin end
            endcase
          end
          5'h0b: begin
            pos_normal = 16'h1d60;
            case (mant[4:0])
              5'h01: pos_normal = 16'h1d61;
              5'h02: pos_normal = 16'h1d62;
              5'h03: pos_normal = 16'h1d63;
              5'h04: pos_normal = 16'h1d64;
              5'h05: pos_normal = 16'h1d65;
              5'h06: pos_normal = 16'h1d66;
              5'h07: pos_normal = 16'h1d67;
              5'h08: pos_normal = 16'h1d68;
              5'h09: pos_normal = 16'h1d69;
              5'h0a: pos_normal = 16'h1d6a;
              5'h0b: pos_normal = 16'h1d6b;
              5'h0c: pos_normal = 16'h1d6c;
              5'h0d: pos_normal = 16'h1d6d;
              5'h0e: pos_normal = 16'h1d6e;
              5'h0f: pos_normal = 16'h1d6f;
              5'h10: pos_normal = 16'h1d70;
              5'h11: pos_normal = 16'h1d71;
              5'h12: pos_normal = 16'h1d72;
              5'h13: pos_normal = 16'h1d73;
              5'h14: pos_normal = 16'h1d74;
              5'h15: pos_normal = 16'h1d75;
              5'h16: pos_normal = 16'h1d76;
              5'h17: pos_normal = 16'h1d77;
              5'h18: pos_normal = 16'h1d78;
              5'h19: pos_normal = 16'h1d79;
              5'h1a: pos_normal = 16'h1d7a;
              5'h1b: pos_normal = 16'h1d7b;
              5'h1c: pos_normal = 16'h1d7c;
              5'h1d: pos_normal = 16'h1d7d;
              5'h1e: pos_normal = 16'h1d7e;
              5'h1f: pos_normal = 16'h1d7f;
              default: begin end
            endcase
          end
          5'h0c: begin
            pos_normal = 16'h1d80;
            case (mant[4:0])
              5'h01: pos_normal = 16'h1d81;
              5'h02: pos_normal = 16'h1d82;
              5'h03: pos_normal = 16'h1d83;
              5'h04: pos_normal = 16'h1d84;
              5'h05: pos_normal = 16'h1d85;
              5'h06: pos_normal = 16'h1d86;
              5'h07: pos_normal = 16'h1d87;
              5'h08: pos_normal = 16'h1d88;
              5'h09: pos_normal = 16'h1d89;
              5'h0a: pos_normal = 16'h1d8a;
              5'h0b: pos_normal = 16'h1d8b;
              5'h0c: pos_normal = 16'h1d8c;
              5'h0d: pos_normal = 16'h1d8d;
              5'h0e: pos_normal = 16'h1d8e;
              5'h0f: pos_normal = 16'h1d8f;
              5'h10: pos_normal = 16'h1d90;
              5'h11: pos_normal = 16'h1d91;
              5'h12: pos_normal = 16'h1d92;
              5'h13: pos_normal = 16'h1d93;
              5'h14: pos_normal = 16'h1d94;
              5'h15: pos_normal = 16'h1d95;
              5'h16: pos_normal = 16'h1d96;
              5'h17: pos_normal = 16'h1d97;
              5'h18: pos_normal = 16'h1d98;
              5'h19: pos_normal = 16'h1d99;
              5'h1a: pos_normal = 16'h1d9a;
              5'h1b: pos_normal = 16'h1d9b;
              5'h1c: pos_normal = 16'h1d9c;
              5'h1d: pos_normal = 16'h1d9d;
              5'h1e: pos_normal = 16'h1d9e;
              5'h1f: pos_normal = 16'h1d9f;
              default: begin end
            endcase
          end
          5'h0d: begin
            pos_normal = 16'h1da0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h1da1;
              5'h02: pos_normal = 16'h1da2;
              5'h03: pos_normal = 16'h1da3;
              5'h04: pos_normal = 16'h1da4;
              5'h05: pos_normal = 16'h1da5;
              5'h06: pos_normal = 16'h1da6;
              5'h07: pos_normal = 16'h1da7;
              5'h08: pos_normal = 16'h1da8;
              5'h09: pos_normal = 16'h1da9;
              5'h0a: pos_normal = 16'h1daa;
              5'h0b: pos_normal = 16'h1dab;
              5'h0c: pos_normal = 16'h1dac;
              5'h0d: pos_normal = 16'h1dad;
              5'h0e: pos_normal = 16'h1dae;
              5'h0f: pos_normal = 16'h1daf;
              5'h10: pos_normal = 16'h1db0;
              5'h11: pos_normal = 16'h1db1;
              5'h12: pos_normal = 16'h1db2;
              5'h13: pos_normal = 16'h1db3;
              5'h14: pos_normal = 16'h1db4;
              5'h15: pos_normal = 16'h1db5;
              5'h16: pos_normal = 16'h1db6;
              5'h17: pos_normal = 16'h1db7;
              5'h18: pos_normal = 16'h1db8;
              5'h19: pos_normal = 16'h1db9;
              5'h1a: pos_normal = 16'h1dba;
              5'h1b: pos_normal = 16'h1dbb;
              5'h1c: pos_normal = 16'h1dbc;
              5'h1d: pos_normal = 16'h1dbd;
              5'h1e: pos_normal = 16'h1dbe;
              5'h1f: pos_normal = 16'h1dbf;
              default: begin end
            endcase
          end
          5'h0e: begin
            pos_normal = 16'h1dc0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h1dc1;
              5'h02: pos_normal = 16'h1dc2;
              5'h03: pos_normal = 16'h1dc3;
              5'h04: pos_normal = 16'h1dc4;
              5'h05: pos_normal = 16'h1dc5;
              5'h06: pos_normal = 16'h1dc6;
              5'h07: pos_normal = 16'h1dc7;
              5'h08: pos_normal = 16'h1dc8;
              5'h09: pos_normal = 16'h1dc9;
              5'h0a: pos_normal = 16'h1dca;
              5'h0b: pos_normal = 16'h1dcb;
              5'h0c: pos_normal = 16'h1dcc;
              5'h0d: pos_normal = 16'h1dcd;
              5'h0e: pos_normal = 16'h1dce;
              5'h0f: pos_normal = 16'h1dcf;
              5'h10: pos_normal = 16'h1dd0;
              5'h11: pos_normal = 16'h1dd1;
              5'h12: pos_normal = 16'h1dd2;
              5'h13: pos_normal = 16'h1dd3;
              5'h14: pos_normal = 16'h1dd4;
              5'h15: pos_normal = 16'h1dd5;
              5'h16: pos_normal = 16'h1dd6;
              5'h17: pos_normal = 16'h1dd7;
              5'h18: pos_normal = 16'h1dd8;
              5'h19: pos_normal = 16'h1dd9;
              5'h1a: pos_normal = 16'h1dda;
              5'h1b: pos_normal = 16'h1ddb;
              5'h1c: pos_normal = 16'h1ddc;
              5'h1d: pos_normal = 16'h1ddd;
              5'h1e: pos_normal = 16'h1dde;
              5'h1f: pos_normal = 16'h1ddf;
              default: begin end
            endcase
          end
          5'h0f: begin
            pos_normal = 16'h1de0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h1de1;
              5'h02: pos_normal = 16'h1de2;
              5'h03: pos_normal = 16'h1de3;
              5'h04: pos_normal = 16'h1de4;
              5'h05: pos_normal = 16'h1de5;
              5'h06: pos_normal = 16'h1de6;
              5'h07: pos_normal = 16'h1de7;
              5'h08: pos_normal = 16'h1de8;
              5'h09: pos_normal = 16'h1de9;
              5'h0a: pos_normal = 16'h1dea;
              5'h0b: pos_normal = 16'h1deb;
              5'h0c: pos_normal = 16'h1dec;
              5'h0d: pos_normal = 16'h1ded;
              5'h0e: pos_normal = 16'h1dee;
              5'h0f: pos_normal = 16'h1def;
              5'h10: pos_normal = 16'h1df0;
              5'h11: pos_normal = 16'h1df1;
              5'h12: pos_normal = 16'h1df2;
              5'h13: pos_normal = 16'h1df3;
              5'h14: pos_normal = 16'h1df4;
              5'h15: pos_normal = 16'h1df5;
              5'h16: pos_normal = 16'h1df6;
              5'h17: pos_normal = 16'h1df7;
              5'h18: pos_normal = 16'h1df8;
              5'h19: pos_normal = 16'h1df9;
              5'h1a: pos_normal = 16'h1dfa;
              5'h1b: pos_normal = 16'h1dfb;
              5'h1c: pos_normal = 16'h1dfc;
              5'h1d: pos_normal = 16'h1dfd;
              5'h1e: pos_normal = 16'h1dfe;
              5'h1f: pos_normal = 16'h1dff;
              default: begin end
            endcase
          end
          5'h10: begin
            pos_normal = 16'h1e00;
            case (mant[4:0])
              5'h01: pos_normal = 16'h1e01;
              5'h02: pos_normal = 16'h1e02;
              5'h03: pos_normal = 16'h1e03;
              5'h04: pos_normal = 16'h1e04;
              5'h05: pos_normal = 16'h1e05;
              5'h06: pos_normal = 16'h1e06;
              5'h07: pos_normal = 16'h1e07;
              5'h08: pos_normal = 16'h1e08;
              5'h09: pos_normal = 16'h1e09;
              5'h0a: pos_normal = 16'h1e0a;
              5'h0b: pos_normal = 16'h1e0b;
              5'h0c: pos_normal = 16'h1e0c;
              5'h0d: pos_normal = 16'h1e0d;
              5'h0e: pos_normal = 16'h1e0e;
              5'h0f: pos_normal = 16'h1e0f;
              5'h10: pos_normal = 16'h1e10;
              5'h11: pos_normal = 16'h1e11;
              5'h12: pos_normal = 16'h1e12;
              5'h13: pos_normal = 16'h1e13;
              5'h14: pos_normal = 16'h1e14;
              5'h15: pos_normal = 16'h1e15;
              5'h16: pos_normal = 16'h1e16;
              5'h17: pos_normal = 16'h1e17;
              5'h18: pos_normal = 16'h1e18;
              5'h19: pos_normal = 16'h1e19;
              5'h1a: pos_normal = 16'h1e1a;
              5'h1b: pos_normal = 16'h1e1b;
              5'h1c: pos_normal = 16'h1e1c;
              5'h1d: pos_normal = 16'h1e1d;
              5'h1e: pos_normal = 16'h1e1e;
              5'h1f: pos_normal = 16'h1e1f;
              default: begin end
            endcase
          end
          5'h11: begin
            pos_normal = 16'h1e20;
            case (mant[4:0])
              5'h01: pos_normal = 16'h1e21;
              5'h02: pos_normal = 16'h1e22;
              5'h03: pos_normal = 16'h1e23;
              5'h04: pos_normal = 16'h1e24;
              5'h05: pos_normal = 16'h1e25;
              5'h06: pos_normal = 16'h1e26;
              5'h07: pos_normal = 16'h1e27;
              5'h08: pos_normal = 16'h1e28;
              5'h09: pos_normal = 16'h1e29;
              5'h0a: pos_normal = 16'h1e2a;
              5'h0b: pos_normal = 16'h1e2b;
              5'h0c: pos_normal = 16'h1e2c;
              5'h0d: pos_normal = 16'h1e2d;
              5'h0e: pos_normal = 16'h1e2e;
              5'h0f: pos_normal = 16'h1e2f;
              5'h10: pos_normal = 16'h1e30;
              5'h11: pos_normal = 16'h1e31;
              5'h12: pos_normal = 16'h1e32;
              5'h13: pos_normal = 16'h1e33;
              5'h14: pos_normal = 16'h1e34;
              5'h15: pos_normal = 16'h1e35;
              5'h16: pos_normal = 16'h1e36;
              5'h17: pos_normal = 16'h1e37;
              5'h18: pos_normal = 16'h1e38;
              5'h19: pos_normal = 16'h1e39;
              5'h1a: pos_normal = 16'h1e3a;
              5'h1b: pos_normal = 16'h1e3b;
              5'h1c: pos_normal = 16'h1e3c;
              5'h1d: pos_normal = 16'h1e3d;
              5'h1e: pos_normal = 16'h1e3e;
              5'h1f: pos_normal = 16'h1e3f;
              default: begin end
            endcase
          end
          5'h12: begin
            pos_normal = 16'h1e40;
            case (mant[4:0])
              5'h01: pos_normal = 16'h1e41;
              5'h02: pos_normal = 16'h1e42;
              5'h03: pos_normal = 16'h1e43;
              5'h04: pos_normal = 16'h1e44;
              5'h05: pos_normal = 16'h1e45;
              5'h06: pos_normal = 16'h1e46;
              5'h07: pos_normal = 16'h1e47;
              5'h08: pos_normal = 16'h1e48;
              5'h09: pos_normal = 16'h1e49;
              5'h0a: pos_normal = 16'h1e4a;
              5'h0b: pos_normal = 16'h1e4b;
              5'h0c: pos_normal = 16'h1e4c;
              5'h0d: pos_normal = 16'h1e4d;
              5'h0e: pos_normal = 16'h1e4e;
              5'h0f: pos_normal = 16'h1e4f;
              5'h10: pos_normal = 16'h1e50;
              5'h11: pos_normal = 16'h1e51;
              5'h12: pos_normal = 16'h1e52;
              5'h13: pos_normal = 16'h1e53;
              5'h14: pos_normal = 16'h1e54;
              5'h15: pos_normal = 16'h1e55;
              5'h16: pos_normal = 16'h1e56;
              5'h17: pos_normal = 16'h1e57;
              5'h18: pos_normal = 16'h1e58;
              5'h19: pos_normal = 16'h1e59;
              5'h1a: pos_normal = 16'h1e5a;
              5'h1b: pos_normal = 16'h1e5b;
              5'h1c: pos_normal = 16'h1e5c;
              5'h1d: pos_normal = 16'h1e5d;
              5'h1e: pos_normal = 16'h1e5e;
              5'h1f: pos_normal = 16'h1e5f;
              default: begin end
            endcase
          end
          5'h13: begin
            pos_normal = 16'h1e60;
            case (mant[4:0])
              5'h01: pos_normal = 16'h1e61;
              5'h02: pos_normal = 16'h1e62;
              5'h03: pos_normal = 16'h1e63;
              5'h04: pos_normal = 16'h1e64;
              5'h05: pos_normal = 16'h1e65;
              5'h06: pos_normal = 16'h1e66;
              5'h07: pos_normal = 16'h1e67;
              5'h08: pos_normal = 16'h1e68;
              5'h09: pos_normal = 16'h1e69;
              5'h0a: pos_normal = 16'h1e6a;
              5'h0b: pos_normal = 16'h1e6b;
              5'h0c: pos_normal = 16'h1e6c;
              5'h0d: pos_normal = 16'h1e6d;
              5'h0e: pos_normal = 16'h1e6e;
              5'h0f: pos_normal = 16'h1e6f;
              5'h10: pos_normal = 16'h1e70;
              5'h11: pos_normal = 16'h1e71;
              5'h12: pos_normal = 16'h1e72;
              5'h13: pos_normal = 16'h1e73;
              5'h14: pos_normal = 16'h1e74;
              5'h15: pos_normal = 16'h1e75;
              5'h16: pos_normal = 16'h1e76;
              5'h17: pos_normal = 16'h1e77;
              5'h18: pos_normal = 16'h1e78;
              5'h19: pos_normal = 16'h1e79;
              5'h1a: pos_normal = 16'h1e7a;
              5'h1b: pos_normal = 16'h1e7b;
              5'h1c: pos_normal = 16'h1e7c;
              5'h1d: pos_normal = 16'h1e7d;
              5'h1e: pos_normal = 16'h1e7e;
              5'h1f: pos_normal = 16'h1e7f;
              default: begin end
            endcase
          end
          5'h14: begin
            pos_normal = 16'h1e80;
            case (mant[4:0])
              5'h01: pos_normal = 16'h1e81;
              5'h02: pos_normal = 16'h1e82;
              5'h03: pos_normal = 16'h1e83;
              5'h04: pos_normal = 16'h1e84;
              5'h05: pos_normal = 16'h1e85;
              5'h06: pos_normal = 16'h1e86;
              5'h07: pos_normal = 16'h1e87;
              5'h08: pos_normal = 16'h1e88;
              5'h09: pos_normal = 16'h1e89;
              5'h0a: pos_normal = 16'h1e8a;
              5'h0b: pos_normal = 16'h1e8b;
              5'h0c: pos_normal = 16'h1e8c;
              5'h0d: pos_normal = 16'h1e8d;
              5'h0e: pos_normal = 16'h1e8e;
              5'h0f: pos_normal = 16'h1e8f;
              5'h10: pos_normal = 16'h1e90;
              5'h11: pos_normal = 16'h1e91;
              5'h12: pos_normal = 16'h1e92;
              5'h13: pos_normal = 16'h1e93;
              5'h14: pos_normal = 16'h1e94;
              5'h15: pos_normal = 16'h1e95;
              5'h16: pos_normal = 16'h1e96;
              5'h17: pos_normal = 16'h1e97;
              5'h18: pos_normal = 16'h1e98;
              5'h19: pos_normal = 16'h1e99;
              5'h1a: pos_normal = 16'h1e9a;
              5'h1b: pos_normal = 16'h1e9b;
              5'h1c: pos_normal = 16'h1e9c;
              5'h1d: pos_normal = 16'h1e9d;
              5'h1e: pos_normal = 16'h1e9e;
              5'h1f: pos_normal = 16'h1e9f;
              default: begin end
            endcase
          end
          5'h15: begin
            pos_normal = 16'h1ea0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h1ea1;
              5'h02: pos_normal = 16'h1ea2;
              5'h03: pos_normal = 16'h1ea3;
              5'h04: pos_normal = 16'h1ea4;
              5'h05: pos_normal = 16'h1ea5;
              5'h06: pos_normal = 16'h1ea6;
              5'h07: pos_normal = 16'h1ea7;
              5'h08: pos_normal = 16'h1ea8;
              5'h09: pos_normal = 16'h1ea9;
              5'h0a: pos_normal = 16'h1eaa;
              5'h0b: pos_normal = 16'h1eab;
              5'h0c: pos_normal = 16'h1eac;
              5'h0d: pos_normal = 16'h1ead;
              5'h0e: pos_normal = 16'h1eae;
              5'h0f: pos_normal = 16'h1eaf;
              5'h10: pos_normal = 16'h1eb0;
              5'h11: pos_normal = 16'h1eb1;
              5'h12: pos_normal = 16'h1eb2;
              5'h13: pos_normal = 16'h1eb3;
              5'h14: pos_normal = 16'h1eb4;
              5'h15: pos_normal = 16'h1eb5;
              5'h16: pos_normal = 16'h1eb6;
              5'h17: pos_normal = 16'h1eb7;
              5'h18: pos_normal = 16'h1eb8;
              5'h19: pos_normal = 16'h1eb9;
              5'h1a: pos_normal = 16'h1eba;
              5'h1b: pos_normal = 16'h1ebb;
              5'h1c: pos_normal = 16'h1ebc;
              5'h1d: pos_normal = 16'h1ebd;
              5'h1e: pos_normal = 16'h1ebe;
              5'h1f: pos_normal = 16'h1ebf;
              default: begin end
            endcase
          end
          5'h16: begin
            pos_normal = 16'h1ec0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h1ec1;
              5'h02: pos_normal = 16'h1ec2;
              5'h03: pos_normal = 16'h1ec3;
              5'h04: pos_normal = 16'h1ec4;
              5'h05: pos_normal = 16'h1ec5;
              5'h06: pos_normal = 16'h1ec6;
              5'h07: pos_normal = 16'h1ec7;
              5'h08: pos_normal = 16'h1ec8;
              5'h09: pos_normal = 16'h1ec9;
              5'h0a: pos_normal = 16'h1eca;
              5'h0b: pos_normal = 16'h1ecb;
              5'h0c: pos_normal = 16'h1ecc;
              5'h0d: pos_normal = 16'h1ecd;
              5'h0e: pos_normal = 16'h1ece;
              5'h0f: pos_normal = 16'h1ecf;
              5'h10: pos_normal = 16'h1ed0;
              5'h11: pos_normal = 16'h1ed1;
              5'h12: pos_normal = 16'h1ed2;
              5'h13: pos_normal = 16'h1ed3;
              5'h14: pos_normal = 16'h1ed4;
              5'h15: pos_normal = 16'h1ed5;
              5'h16: pos_normal = 16'h1ed6;
              5'h17: pos_normal = 16'h1ed7;
              5'h18: pos_normal = 16'h1ed8;
              5'h19: pos_normal = 16'h1ed9;
              5'h1a: pos_normal = 16'h1eda;
              5'h1b: pos_normal = 16'h1edb;
              5'h1c: pos_normal = 16'h1edc;
              5'h1d: pos_normal = 16'h1edd;
              5'h1e: pos_normal = 16'h1ede;
              5'h1f: pos_normal = 16'h1edf;
              default: begin end
            endcase
          end
          5'h17: begin
            pos_normal = 16'h1ee0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h1ee1;
              5'h02: pos_normal = 16'h1ee2;
              5'h03: pos_normal = 16'h1ee3;
              5'h04: pos_normal = 16'h1ee4;
              5'h05: pos_normal = 16'h1ee5;
              5'h06: pos_normal = 16'h1ee6;
              5'h07: pos_normal = 16'h1ee7;
              5'h08: pos_normal = 16'h1ee8;
              5'h09: pos_normal = 16'h1ee9;
              5'h0a: pos_normal = 16'h1eea;
              5'h0b: pos_normal = 16'h1eeb;
              5'h0c: pos_normal = 16'h1eec;
              5'h0d: pos_normal = 16'h1eed;
              5'h0e: pos_normal = 16'h1eee;
              5'h0f: pos_normal = 16'h1eef;
              5'h10: pos_normal = 16'h1ef0;
              5'h11: pos_normal = 16'h1ef1;
              5'h12: pos_normal = 16'h1ef2;
              5'h13: pos_normal = 16'h1ef3;
              5'h14: pos_normal = 16'h1ef4;
              5'h15: pos_normal = 16'h1ef5;
              5'h16: pos_normal = 16'h1ef6;
              5'h17: pos_normal = 16'h1ef7;
              5'h18: pos_normal = 16'h1ef8;
              5'h19: pos_normal = 16'h1ef9;
              5'h1a: pos_normal = 16'h1efa;
              5'h1b: pos_normal = 16'h1efb;
              5'h1c: pos_normal = 16'h1efc;
              5'h1d: pos_normal = 16'h1efd;
              5'h1e: pos_normal = 16'h1efe;
              5'h1f: pos_normal = 16'h1eff;
              default: begin end
            endcase
          end
          5'h18: begin
            pos_normal = 16'h1f00;
            case (mant[4:0])
              5'h01: pos_normal = 16'h1f01;
              5'h02: pos_normal = 16'h1f02;
              5'h03: pos_normal = 16'h1f03;
              5'h04: pos_normal = 16'h1f04;
              5'h05: pos_normal = 16'h1f05;
              5'h06: pos_normal = 16'h1f06;
              5'h07: pos_normal = 16'h1f07;
              5'h08: pos_normal = 16'h1f08;
              5'h09: pos_normal = 16'h1f09;
              5'h0a: pos_normal = 16'h1f0a;
              5'h0b: pos_normal = 16'h1f0b;
              5'h0c: pos_normal = 16'h1f0c;
              5'h0d: pos_normal = 16'h1f0d;
              5'h0e: pos_normal = 16'h1f0e;
              5'h0f: pos_normal = 16'h1f0f;
              5'h10: pos_normal = 16'h1f10;
              5'h11: pos_normal = 16'h1f11;
              5'h12: pos_normal = 16'h1f12;
              5'h13: pos_normal = 16'h1f13;
              5'h14: pos_normal = 16'h1f14;
              5'h15: pos_normal = 16'h1f15;
              5'h16: pos_normal = 16'h1f16;
              5'h17: pos_normal = 16'h1f17;
              5'h18: pos_normal = 16'h1f18;
              5'h19: pos_normal = 16'h1f19;
              5'h1a: pos_normal = 16'h1f1a;
              5'h1b: pos_normal = 16'h1f1b;
              5'h1c: pos_normal = 16'h1f1c;
              5'h1d: pos_normal = 16'h1f1d;
              5'h1e: pos_normal = 16'h1f1e;
              5'h1f: pos_normal = 16'h1f1f;
              default: begin end
            endcase
          end
          5'h19: begin
            pos_normal = 16'h1f20;
            case (mant[4:0])
              5'h01: pos_normal = 16'h1f21;
              5'h02: pos_normal = 16'h1f22;
              5'h03: pos_normal = 16'h1f23;
              5'h04: pos_normal = 16'h1f24;
              5'h05: pos_normal = 16'h1f25;
              5'h06: pos_normal = 16'h1f26;
              5'h07: pos_normal = 16'h1f27;
              5'h08: pos_normal = 16'h1f28;
              5'h09: pos_normal = 16'h1f29;
              5'h0a: pos_normal = 16'h1f2a;
              5'h0b: pos_normal = 16'h1f2b;
              5'h0c: pos_normal = 16'h1f2c;
              5'h0d: pos_normal = 16'h1f2d;
              5'h0e: pos_normal = 16'h1f2e;
              5'h0f: pos_normal = 16'h1f2f;
              5'h10: pos_normal = 16'h1f30;
              5'h11: pos_normal = 16'h1f31;
              5'h12: pos_normal = 16'h1f32;
              5'h13: pos_normal = 16'h1f33;
              5'h14: pos_normal = 16'h1f34;
              5'h15: pos_normal = 16'h1f35;
              5'h16: pos_normal = 16'h1f36;
              5'h17: pos_normal = 16'h1f37;
              5'h18: pos_normal = 16'h1f38;
              5'h19: pos_normal = 16'h1f39;
              5'h1a: pos_normal = 16'h1f3a;
              5'h1b: pos_normal = 16'h1f3b;
              5'h1c: pos_normal = 16'h1f3c;
              5'h1d: pos_normal = 16'h1f3d;
              5'h1e: pos_normal = 16'h1f3e;
              5'h1f: pos_normal = 16'h1f3f;
              default: begin end
            endcase
          end
          5'h1a: begin
            pos_normal = 16'h1f40;
            case (mant[4:0])
              5'h01: pos_normal = 16'h1f41;
              5'h02: pos_normal = 16'h1f42;
              5'h03: pos_normal = 16'h1f43;
              5'h04: pos_normal = 16'h1f44;
              5'h05: pos_normal = 16'h1f45;
              5'h06: pos_normal = 16'h1f46;
              5'h07: pos_normal = 16'h1f47;
              5'h08: pos_normal = 16'h1f48;
              5'h09: pos_normal = 16'h1f49;
              5'h0a: pos_normal = 16'h1f4a;
              5'h0b: pos_normal = 16'h1f4b;
              5'h0c: pos_normal = 16'h1f4c;
              5'h0d: pos_normal = 16'h1f4d;
              5'h0e: pos_normal = 16'h1f4e;
              5'h0f: pos_normal = 16'h1f4f;
              5'h10: pos_normal = 16'h1f50;
              5'h11: pos_normal = 16'h1f51;
              5'h12: pos_normal = 16'h1f52;
              5'h13: pos_normal = 16'h1f53;
              5'h14: pos_normal = 16'h1f54;
              5'h15: pos_normal = 16'h1f55;
              5'h16: pos_normal = 16'h1f56;
              5'h17: pos_normal = 16'h1f57;
              5'h18: pos_normal = 16'h1f58;
              5'h19: pos_normal = 16'h1f59;
              5'h1a: pos_normal = 16'h1f5a;
              5'h1b: pos_normal = 16'h1f5b;
              5'h1c: pos_normal = 16'h1f5c;
              5'h1d: pos_normal = 16'h1f5d;
              5'h1e: pos_normal = 16'h1f5e;
              5'h1f: pos_normal = 16'h1f5f;
              default: begin end
            endcase
          end
          5'h1b: begin
            pos_normal = 16'h1f60;
            case (mant[4:0])
              5'h01: pos_normal = 16'h1f61;
              5'h02: pos_normal = 16'h1f62;
              5'h03: pos_normal = 16'h1f63;
              5'h04: pos_normal = 16'h1f64;
              5'h05: pos_normal = 16'h1f65;
              5'h06: pos_normal = 16'h1f66;
              5'h07: pos_normal = 16'h1f67;
              5'h08: pos_normal = 16'h1f68;
              5'h09: pos_normal = 16'h1f69;
              5'h0a: pos_normal = 16'h1f6a;
              5'h0b: pos_normal = 16'h1f6b;
              5'h0c: pos_normal = 16'h1f6c;
              5'h0d: pos_normal = 16'h1f6d;
              5'h0e: pos_normal = 16'h1f6e;
              5'h0f: pos_normal = 16'h1f6f;
              5'h10: pos_normal = 16'h1f70;
              5'h11: pos_normal = 16'h1f71;
              5'h12: pos_normal = 16'h1f72;
              5'h13: pos_normal = 16'h1f73;
              5'h14: pos_normal = 16'h1f74;
              5'h15: pos_normal = 16'h1f75;
              5'h16: pos_normal = 16'h1f76;
              5'h17: pos_normal = 16'h1f77;
              5'h18: pos_normal = 16'h1f78;
              5'h19: pos_normal = 16'h1f79;
              5'h1a: pos_normal = 16'h1f7a;
              5'h1b: pos_normal = 16'h1f7b;
              5'h1c: pos_normal = 16'h1f7c;
              5'h1d: pos_normal = 16'h1f7d;
              5'h1e: pos_normal = 16'h1f7e;
              5'h1f: pos_normal = 16'h1f7f;
              default: begin end
            endcase
          end
          5'h1c: begin
            pos_normal = 16'h1f80;
            case (mant[4:0])
              5'h01: pos_normal = 16'h1f81;
              5'h02: pos_normal = 16'h1f82;
              5'h03: pos_normal = 16'h1f83;
              5'h04: pos_normal = 16'h1f84;
              5'h05: pos_normal = 16'h1f85;
              5'h06: pos_normal = 16'h1f86;
              5'h07: pos_normal = 16'h1f87;
              5'h08: pos_normal = 16'h1f88;
              5'h09: pos_normal = 16'h1f89;
              5'h0a: pos_normal = 16'h1f8a;
              5'h0b: pos_normal = 16'h1f8b;
              5'h0c: pos_normal = 16'h1f8c;
              5'h0d: pos_normal = 16'h1f8d;
              5'h0e: pos_normal = 16'h1f8e;
              5'h0f: pos_normal = 16'h1f8f;
              5'h10: pos_normal = 16'h1f90;
              5'h11: pos_normal = 16'h1f91;
              5'h12: pos_normal = 16'h1f92;
              5'h13: pos_normal = 16'h1f93;
              5'h14: pos_normal = 16'h1f94;
              5'h15: pos_normal = 16'h1f95;
              5'h16: pos_normal = 16'h1f96;
              5'h17: pos_normal = 16'h1f97;
              5'h18: pos_normal = 16'h1f98;
              5'h19: pos_normal = 16'h1f99;
              5'h1a: pos_normal = 16'h1f9a;
              5'h1b: pos_normal = 16'h1f9b;
              5'h1c: pos_normal = 16'h1f9c;
              5'h1d: pos_normal = 16'h1f9d;
              5'h1e: pos_normal = 16'h1f9e;
              5'h1f: pos_normal = 16'h1f9f;
              default: begin end
            endcase
          end
          5'h1d: begin
            pos_normal = 16'h1fa0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h1fa1;
              5'h02: pos_normal = 16'h1fa2;
              5'h03: pos_normal = 16'h1fa3;
              5'h04: pos_normal = 16'h1fa4;
              5'h05: pos_normal = 16'h1fa5;
              5'h06: pos_normal = 16'h1fa6;
              5'h07: pos_normal = 16'h1fa7;
              5'h08: pos_normal = 16'h1fa8;
              5'h09: pos_normal = 16'h1fa9;
              5'h0a: pos_normal = 16'h1faa;
              5'h0b: pos_normal = 16'h1fab;
              5'h0c: pos_normal = 16'h1fac;
              5'h0d: pos_normal = 16'h1fad;
              5'h0e: pos_normal = 16'h1fae;
              5'h0f: pos_normal = 16'h1faf;
              5'h10: pos_normal = 16'h1fb0;
              5'h11: pos_normal = 16'h1fb1;
              5'h12: pos_normal = 16'h1fb2;
              5'h13: pos_normal = 16'h1fb3;
              5'h14: pos_normal = 16'h1fb4;
              5'h15: pos_normal = 16'h1fb5;
              5'h16: pos_normal = 16'h1fb6;
              5'h17: pos_normal = 16'h1fb7;
              5'h18: pos_normal = 16'h1fb8;
              5'h19: pos_normal = 16'h1fb9;
              5'h1a: pos_normal = 16'h1fba;
              5'h1b: pos_normal = 16'h1fbb;
              5'h1c: pos_normal = 16'h1fbc;
              5'h1d: pos_normal = 16'h1fbd;
              5'h1e: pos_normal = 16'h1fbe;
              5'h1f: pos_normal = 16'h1fbf;
              default: begin end
            endcase
          end
          5'h1e: begin
            pos_normal = 16'h1fc0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h1fc1;
              5'h02: pos_normal = 16'h1fc2;
              5'h03: pos_normal = 16'h1fc3;
              5'h04: pos_normal = 16'h1fc4;
              5'h05: pos_normal = 16'h1fc5;
              5'h06: pos_normal = 16'h1fc6;
              5'h07: pos_normal = 16'h1fc7;
              5'h08: pos_normal = 16'h1fc8;
              5'h09: pos_normal = 16'h1fc9;
              5'h0a: pos_normal = 16'h1fca;
              5'h0b: pos_normal = 16'h1fcb;
              5'h0c: pos_normal = 16'h1fcc;
              5'h0d: pos_normal = 16'h1fcd;
              5'h0e: pos_normal = 16'h1fce;
              5'h0f: pos_normal = 16'h1fcf;
              5'h10: pos_normal = 16'h1fd0;
              5'h11: pos_normal = 16'h1fd1;
              5'h12: pos_normal = 16'h1fd2;
              5'h13: pos_normal = 16'h1fd3;
              5'h14: pos_normal = 16'h1fd4;
              5'h15: pos_normal = 16'h1fd5;
              5'h16: pos_normal = 16'h1fd6;
              5'h17: pos_normal = 16'h1fd7;
              5'h18: pos_normal = 16'h1fd8;
              5'h19: pos_normal = 16'h1fd9;
              5'h1a: pos_normal = 16'h1fda;
              5'h1b: pos_normal = 16'h1fdb;
              5'h1c: pos_normal = 16'h1fdc;
              5'h1d: pos_normal = 16'h1fdd;
              5'h1e: pos_normal = 16'h1fde;
              5'h1f: pos_normal = 16'h1fdf;
              default: begin end
            endcase
          end
          5'h1f: begin
            pos_normal = 16'h1fe0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h1fe1;
              5'h02: pos_normal = 16'h1fe2;
              5'h03: pos_normal = 16'h1fe3;
              5'h04: pos_normal = 16'h1fe4;
              5'h05: pos_normal = 16'h1fe5;
              5'h06: pos_normal = 16'h1fe6;
              5'h07: pos_normal = 16'h1fe7;
              5'h08: pos_normal = 16'h1fe8;
              5'h09: pos_normal = 16'h1fe9;
              5'h0a: pos_normal = 16'h1fea;
              5'h0b: pos_normal = 16'h1feb;
              5'h0c: pos_normal = 16'h1fec;
              5'h0d: pos_normal = 16'h1fed;
              5'h0e: pos_normal = 16'h1fee;
              5'h0f: pos_normal = 16'h1fef;
              5'h10: pos_normal = 16'h1ff0;
              5'h11: pos_normal = 16'h1ff1;
              5'h12: pos_normal = 16'h1ff2;
              5'h13: pos_normal = 16'h1ff3;
              5'h14: pos_normal = 16'h1ff4;
              5'h15: pos_normal = 16'h1ff5;
              5'h16: pos_normal = 16'h1ff6;
              5'h17: pos_normal = 16'h1ff7;
              5'h18: pos_normal = 16'h1ff8;
              5'h19: pos_normal = 16'h1ff9;
              5'h1a: pos_normal = 16'h1ffa;
              5'h1b: pos_normal = 16'h1ffb;
              5'h1c: pos_normal = 16'h1ffc;
              5'h1d: pos_normal = 16'h1ffd;
              5'h1e: pos_normal = 16'h1ffe;
              5'h1f: pos_normal = 16'h1fff;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      5'h08: begin
        case (mant[9:5])
          5'h00: begin
            pos_normal = 16'h2000;
            case (mant[4:0])
              5'h01: pos_normal = 16'h2001;
              5'h02: pos_normal = 16'h2002;
              5'h03: pos_normal = 16'h2003;
              5'h04: pos_normal = 16'h2004;
              5'h05: pos_normal = 16'h2005;
              5'h06: pos_normal = 16'h2006;
              5'h07: pos_normal = 16'h2007;
              5'h08: pos_normal = 16'h2008;
              5'h09: pos_normal = 16'h2009;
              5'h0a: pos_normal = 16'h200a;
              5'h0b: pos_normal = 16'h200b;
              5'h0c: pos_normal = 16'h200c;
              5'h0d: pos_normal = 16'h200d;
              5'h0e: pos_normal = 16'h200e;
              5'h0f: pos_normal = 16'h200f;
              5'h10: pos_normal = 16'h2010;
              5'h11: pos_normal = 16'h2011;
              5'h12: pos_normal = 16'h2012;
              5'h13: pos_normal = 16'h2013;
              5'h14: pos_normal = 16'h2014;
              5'h15: pos_normal = 16'h2015;
              5'h16: pos_normal = 16'h2016;
              5'h17: pos_normal = 16'h2017;
              5'h18: pos_normal = 16'h2018;
              5'h19: pos_normal = 16'h2019;
              5'h1a: pos_normal = 16'h201a;
              5'h1b: pos_normal = 16'h201b;
              5'h1c: pos_normal = 16'h201c;
              5'h1d: pos_normal = 16'h201d;
              5'h1e: pos_normal = 16'h201e;
              5'h1f: pos_normal = 16'h201f;
              default: begin end
            endcase
          end
          5'h01: begin
            pos_normal = 16'h2020;
            case (mant[4:0])
              5'h01: pos_normal = 16'h2021;
              5'h02: pos_normal = 16'h2022;
              5'h03: pos_normal = 16'h2023;
              5'h04: pos_normal = 16'h2024;
              5'h05: pos_normal = 16'h2025;
              5'h06: pos_normal = 16'h2026;
              5'h07: pos_normal = 16'h2027;
              5'h08: pos_normal = 16'h2028;
              5'h09: pos_normal = 16'h2029;
              5'h0a: pos_normal = 16'h202a;
              5'h0b: pos_normal = 16'h202b;
              5'h0c: pos_normal = 16'h202c;
              5'h0d: pos_normal = 16'h202d;
              5'h0e: pos_normal = 16'h202e;
              5'h0f: pos_normal = 16'h202f;
              5'h10: pos_normal = 16'h2030;
              5'h11: pos_normal = 16'h2031;
              5'h12: pos_normal = 16'h2032;
              5'h13: pos_normal = 16'h2033;
              5'h14: pos_normal = 16'h2034;
              5'h15: pos_normal = 16'h2035;
              5'h16: pos_normal = 16'h2036;
              5'h17: pos_normal = 16'h2037;
              5'h18: pos_normal = 16'h2038;
              5'h19: pos_normal = 16'h2039;
              5'h1a: pos_normal = 16'h203a;
              5'h1b: pos_normal = 16'h203b;
              5'h1c: pos_normal = 16'h203c;
              5'h1d: pos_normal = 16'h203d;
              5'h1e: pos_normal = 16'h203e;
              5'h1f: pos_normal = 16'h203f;
              default: begin end
            endcase
          end
          5'h02: begin
            pos_normal = 16'h2040;
            case (mant[4:0])
              5'h01: pos_normal = 16'h2041;
              5'h02: pos_normal = 16'h2042;
              5'h03: pos_normal = 16'h2043;
              5'h04: pos_normal = 16'h2044;
              5'h05: pos_normal = 16'h2045;
              5'h06: pos_normal = 16'h2046;
              5'h07: pos_normal = 16'h2047;
              5'h08: pos_normal = 16'h2048;
              5'h09: pos_normal = 16'h2049;
              5'h0a: pos_normal = 16'h204a;
              5'h0b: pos_normal = 16'h204b;
              5'h0c: pos_normal = 16'h204c;
              5'h0d: pos_normal = 16'h204d;
              5'h0e: pos_normal = 16'h204e;
              5'h0f: pos_normal = 16'h204f;
              5'h10: pos_normal = 16'h2050;
              5'h11: pos_normal = 16'h2051;
              5'h12: pos_normal = 16'h2052;
              5'h13: pos_normal = 16'h2053;
              5'h14: pos_normal = 16'h2054;
              5'h15: pos_normal = 16'h2055;
              5'h16: pos_normal = 16'h2056;
              5'h17: pos_normal = 16'h2057;
              5'h18: pos_normal = 16'h2058;
              5'h19: pos_normal = 16'h2059;
              5'h1a: pos_normal = 16'h205a;
              5'h1b: pos_normal = 16'h205b;
              5'h1c: pos_normal = 16'h205c;
              5'h1d: pos_normal = 16'h205d;
              5'h1e: pos_normal = 16'h205e;
              5'h1f: pos_normal = 16'h205f;
              default: begin end
            endcase
          end
          5'h03: begin
            pos_normal = 16'h2060;
            case (mant[4:0])
              5'h01: pos_normal = 16'h2061;
              5'h02: pos_normal = 16'h2062;
              5'h03: pos_normal = 16'h2063;
              5'h04: pos_normal = 16'h2064;
              5'h05: pos_normal = 16'h2065;
              5'h06: pos_normal = 16'h2066;
              5'h07: pos_normal = 16'h2067;
              5'h08: pos_normal = 16'h2068;
              5'h09: pos_normal = 16'h2069;
              5'h0a: pos_normal = 16'h206a;
              5'h0b: pos_normal = 16'h206b;
              5'h0c: pos_normal = 16'h206c;
              5'h0d: pos_normal = 16'h206d;
              5'h0e: pos_normal = 16'h206e;
              5'h0f: pos_normal = 16'h206f;
              5'h10: pos_normal = 16'h2070;
              5'h11: pos_normal = 16'h2071;
              5'h12: pos_normal = 16'h2072;
              5'h13: pos_normal = 16'h2073;
              5'h14: pos_normal = 16'h2074;
              5'h15: pos_normal = 16'h2075;
              5'h16: pos_normal = 16'h2076;
              5'h17: pos_normal = 16'h2077;
              5'h18: pos_normal = 16'h2078;
              5'h19: pos_normal = 16'h2079;
              5'h1a: pos_normal = 16'h207a;
              5'h1b: pos_normal = 16'h207b;
              5'h1c: pos_normal = 16'h207c;
              5'h1d: pos_normal = 16'h207d;
              5'h1e: pos_normal = 16'h207e;
              5'h1f: pos_normal = 16'h207f;
              default: begin end
            endcase
          end
          5'h04: begin
            pos_normal = 16'h2080;
            case (mant[4:0])
              5'h01: pos_normal = 16'h2081;
              5'h02: pos_normal = 16'h2082;
              5'h03: pos_normal = 16'h2083;
              5'h04: pos_normal = 16'h2084;
              5'h05: pos_normal = 16'h2085;
              5'h06: pos_normal = 16'h2086;
              5'h07: pos_normal = 16'h2087;
              5'h08: pos_normal = 16'h2088;
              5'h09: pos_normal = 16'h2089;
              5'h0a: pos_normal = 16'h208a;
              5'h0b: pos_normal = 16'h208b;
              5'h0c: pos_normal = 16'h208c;
              5'h0d: pos_normal = 16'h208d;
              5'h0e: pos_normal = 16'h208e;
              5'h0f: pos_normal = 16'h208f;
              5'h10: pos_normal = 16'h2090;
              5'h11: pos_normal = 16'h2091;
              5'h12: pos_normal = 16'h2092;
              5'h13: pos_normal = 16'h2093;
              5'h14: pos_normal = 16'h2094;
              5'h15: pos_normal = 16'h2095;
              5'h16: pos_normal = 16'h2096;
              5'h17: pos_normal = 16'h2097;
              5'h18: pos_normal = 16'h2098;
              5'h19: pos_normal = 16'h2099;
              5'h1a: pos_normal = 16'h209a;
              5'h1b: pos_normal = 16'h209b;
              5'h1c: pos_normal = 16'h209c;
              5'h1d: pos_normal = 16'h209d;
              5'h1e: pos_normal = 16'h209e;
              5'h1f: pos_normal = 16'h209f;
              default: begin end
            endcase
          end
          5'h05: begin
            pos_normal = 16'h20a0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h20a1;
              5'h02: pos_normal = 16'h20a2;
              5'h03: pos_normal = 16'h20a3;
              5'h04: pos_normal = 16'h20a4;
              5'h05: pos_normal = 16'h20a5;
              5'h06: pos_normal = 16'h20a6;
              5'h07: pos_normal = 16'h20a7;
              5'h08: pos_normal = 16'h20a8;
              5'h09: pos_normal = 16'h20a9;
              5'h0a: pos_normal = 16'h20aa;
              5'h0b: pos_normal = 16'h20ab;
              5'h0c: pos_normal = 16'h20ac;
              5'h0d: pos_normal = 16'h20ad;
              5'h0e: pos_normal = 16'h20ae;
              5'h0f: pos_normal = 16'h20af;
              5'h10: pos_normal = 16'h20b0;
              5'h11: pos_normal = 16'h20b1;
              5'h12: pos_normal = 16'h20b2;
              5'h13: pos_normal = 16'h20b3;
              5'h14: pos_normal = 16'h20b4;
              5'h15: pos_normal = 16'h20b5;
              5'h16: pos_normal = 16'h20b6;
              5'h17: pos_normal = 16'h20b7;
              5'h18: pos_normal = 16'h20b8;
              5'h19: pos_normal = 16'h20b9;
              5'h1a: pos_normal = 16'h20ba;
              5'h1b: pos_normal = 16'h20bb;
              5'h1c: pos_normal = 16'h20bc;
              5'h1d: pos_normal = 16'h20bd;
              5'h1e: pos_normal = 16'h20be;
              5'h1f: pos_normal = 16'h20bf;
              default: begin end
            endcase
          end
          5'h06: begin
            pos_normal = 16'h20c0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h20c1;
              5'h02: pos_normal = 16'h20c2;
              5'h03: pos_normal = 16'h20c3;
              5'h04: pos_normal = 16'h20c4;
              5'h05: pos_normal = 16'h20c5;
              5'h06: pos_normal = 16'h20c6;
              5'h07: pos_normal = 16'h20c7;
              5'h08: pos_normal = 16'h20c8;
              5'h09: pos_normal = 16'h20c9;
              5'h0a: pos_normal = 16'h20ca;
              5'h0b: pos_normal = 16'h20cb;
              5'h0c: pos_normal = 16'h20cc;
              5'h0d: pos_normal = 16'h20cd;
              5'h0e: pos_normal = 16'h20ce;
              5'h0f: pos_normal = 16'h20cf;
              5'h10: pos_normal = 16'h20d0;
              5'h11: pos_normal = 16'h20d1;
              5'h12: pos_normal = 16'h20d2;
              5'h13: pos_normal = 16'h20d3;
              5'h14: pos_normal = 16'h20d4;
              5'h15: pos_normal = 16'h20d5;
              5'h16: pos_normal = 16'h20d6;
              5'h17: pos_normal = 16'h20d7;
              5'h18: pos_normal = 16'h20d8;
              5'h19: pos_normal = 16'h20d9;
              5'h1a: pos_normal = 16'h20da;
              5'h1b: pos_normal = 16'h20db;
              5'h1c: pos_normal = 16'h20dc;
              5'h1d: pos_normal = 16'h20dd;
              5'h1e: pos_normal = 16'h20de;
              5'h1f: pos_normal = 16'h20df;
              default: begin end
            endcase
          end
          5'h07: begin
            pos_normal = 16'h20e0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h20e1;
              5'h02: pos_normal = 16'h20e2;
              5'h03: pos_normal = 16'h20e3;
              5'h04: pos_normal = 16'h20e4;
              5'h05: pos_normal = 16'h20e5;
              5'h06: pos_normal = 16'h20e6;
              5'h07: pos_normal = 16'h20e7;
              5'h08: pos_normal = 16'h20e8;
              5'h09: pos_normal = 16'h20e9;
              5'h0a: pos_normal = 16'h20ea;
              5'h0b: pos_normal = 16'h20eb;
              5'h0c: pos_normal = 16'h20ec;
              5'h0d: pos_normal = 16'h20ed;
              5'h0e: pos_normal = 16'h20ee;
              5'h0f: pos_normal = 16'h20ef;
              5'h10: pos_normal = 16'h20f0;
              5'h11: pos_normal = 16'h20f1;
              5'h12: pos_normal = 16'h20f2;
              5'h13: pos_normal = 16'h20f3;
              5'h14: pos_normal = 16'h20f4;
              5'h15: pos_normal = 16'h20f5;
              5'h16: pos_normal = 16'h20f6;
              5'h17: pos_normal = 16'h20f7;
              5'h18: pos_normal = 16'h20f8;
              5'h19: pos_normal = 16'h20f9;
              5'h1a: pos_normal = 16'h20fa;
              5'h1b: pos_normal = 16'h20fb;
              5'h1c: pos_normal = 16'h20fc;
              5'h1d: pos_normal = 16'h20fd;
              5'h1e: pos_normal = 16'h20fe;
              5'h1f: pos_normal = 16'h20ff;
              default: begin end
            endcase
          end
          5'h08: begin
            pos_normal = 16'h2100;
            case (mant[4:0])
              5'h01: pos_normal = 16'h2101;
              5'h02: pos_normal = 16'h2102;
              5'h03: pos_normal = 16'h2103;
              5'h04: pos_normal = 16'h2104;
              5'h05: pos_normal = 16'h2105;
              5'h06: pos_normal = 16'h2106;
              5'h07: pos_normal = 16'h2107;
              5'h08: pos_normal = 16'h2108;
              5'h09: pos_normal = 16'h2109;
              5'h0a: pos_normal = 16'h210a;
              5'h0b: pos_normal = 16'h210b;
              5'h0c: pos_normal = 16'h210c;
              5'h0d: pos_normal = 16'h210d;
              5'h0e: pos_normal = 16'h210e;
              5'h0f: pos_normal = 16'h210f;
              5'h10: pos_normal = 16'h2110;
              5'h11: pos_normal = 16'h2111;
              5'h12: pos_normal = 16'h2112;
              5'h13: pos_normal = 16'h2113;
              5'h14: pos_normal = 16'h2114;
              5'h15: pos_normal = 16'h2115;
              5'h16: pos_normal = 16'h2116;
              5'h17: pos_normal = 16'h2117;
              5'h18: pos_normal = 16'h2118;
              5'h19: pos_normal = 16'h2119;
              5'h1a: pos_normal = 16'h211a;
              5'h1b: pos_normal = 16'h211b;
              5'h1c: pos_normal = 16'h211c;
              5'h1d: pos_normal = 16'h211d;
              5'h1e: pos_normal = 16'h211e;
              5'h1f: pos_normal = 16'h211f;
              default: begin end
            endcase
          end
          5'h09: begin
            pos_normal = 16'h2120;
            case (mant[4:0])
              5'h01: pos_normal = 16'h2121;
              5'h02: pos_normal = 16'h2122;
              5'h03: pos_normal = 16'h2123;
              5'h04: pos_normal = 16'h2124;
              5'h05: pos_normal = 16'h2125;
              5'h06: pos_normal = 16'h2126;
              5'h07: pos_normal = 16'h2127;
              5'h08: pos_normal = 16'h2128;
              5'h09: pos_normal = 16'h2129;
              5'h0a: pos_normal = 16'h212a;
              5'h0b: pos_normal = 16'h212b;
              5'h0c: pos_normal = 16'h212c;
              5'h0d: pos_normal = 16'h212d;
              5'h0e: pos_normal = 16'h212e;
              5'h0f: pos_normal = 16'h212f;
              5'h10: pos_normal = 16'h2130;
              5'h11: pos_normal = 16'h2131;
              5'h12: pos_normal = 16'h2132;
              5'h13: pos_normal = 16'h2133;
              5'h14: pos_normal = 16'h2134;
              5'h15: pos_normal = 16'h2135;
              5'h16: pos_normal = 16'h2136;
              5'h17: pos_normal = 16'h2137;
              5'h18: pos_normal = 16'h2138;
              5'h19: pos_normal = 16'h2139;
              5'h1a: pos_normal = 16'h213a;
              5'h1b: pos_normal = 16'h213b;
              5'h1c: pos_normal = 16'h213c;
              5'h1d: pos_normal = 16'h213d;
              5'h1e: pos_normal = 16'h213e;
              5'h1f: pos_normal = 16'h213f;
              default: begin end
            endcase
          end
          5'h0a: begin
            pos_normal = 16'h2140;
            case (mant[4:0])
              5'h01: pos_normal = 16'h2141;
              5'h02: pos_normal = 16'h2142;
              5'h03: pos_normal = 16'h2143;
              5'h04: pos_normal = 16'h2144;
              5'h05: pos_normal = 16'h2145;
              5'h06: pos_normal = 16'h2146;
              5'h07: pos_normal = 16'h2147;
              5'h08: pos_normal = 16'h2148;
              5'h09: pos_normal = 16'h2149;
              5'h0a: pos_normal = 16'h214a;
              5'h0b: pos_normal = 16'h214b;
              5'h0c: pos_normal = 16'h214c;
              5'h0d: pos_normal = 16'h214d;
              5'h0e: pos_normal = 16'h214e;
              5'h0f: pos_normal = 16'h214f;
              5'h10: pos_normal = 16'h2150;
              5'h11: pos_normal = 16'h2151;
              5'h12: pos_normal = 16'h2152;
              5'h13: pos_normal = 16'h2153;
              5'h14: pos_normal = 16'h2154;
              5'h15: pos_normal = 16'h2155;
              5'h16: pos_normal = 16'h2156;
              5'h17: pos_normal = 16'h2157;
              5'h18: pos_normal = 16'h2158;
              5'h19: pos_normal = 16'h2159;
              5'h1a: pos_normal = 16'h215a;
              5'h1b: pos_normal = 16'h215b;
              5'h1c: pos_normal = 16'h215c;
              5'h1d: pos_normal = 16'h215d;
              5'h1e: pos_normal = 16'h215e;
              5'h1f: pos_normal = 16'h215f;
              default: begin end
            endcase
          end
          5'h0b: begin
            pos_normal = 16'h2160;
            case (mant[4:0])
              5'h01: pos_normal = 16'h2161;
              5'h02: pos_normal = 16'h2162;
              5'h03: pos_normal = 16'h2163;
              5'h04: pos_normal = 16'h2164;
              5'h05: pos_normal = 16'h2165;
              5'h06: pos_normal = 16'h2166;
              5'h07: pos_normal = 16'h2167;
              5'h08: pos_normal = 16'h2168;
              5'h09: pos_normal = 16'h2169;
              5'h0a: pos_normal = 16'h216a;
              5'h0b: pos_normal = 16'h216b;
              5'h0c: pos_normal = 16'h216c;
              5'h0d: pos_normal = 16'h216d;
              5'h0e: pos_normal = 16'h216e;
              5'h0f: pos_normal = 16'h216f;
              5'h10: pos_normal = 16'h2170;
              5'h11: pos_normal = 16'h2171;
              5'h12: pos_normal = 16'h2172;
              5'h13: pos_normal = 16'h2173;
              5'h14: pos_normal = 16'h2174;
              5'h15: pos_normal = 16'h2175;
              5'h16: pos_normal = 16'h2176;
              5'h17: pos_normal = 16'h2177;
              5'h18: pos_normal = 16'h2178;
              5'h19: pos_normal = 16'h2179;
              5'h1a: pos_normal = 16'h217a;
              5'h1b: pos_normal = 16'h217b;
              5'h1c: pos_normal = 16'h217c;
              5'h1d: pos_normal = 16'h217d;
              5'h1e: pos_normal = 16'h217e;
              5'h1f: pos_normal = 16'h217f;
              default: begin end
            endcase
          end
          5'h0c: begin
            pos_normal = 16'h2180;
            case (mant[4:0])
              5'h01: pos_normal = 16'h2181;
              5'h02: pos_normal = 16'h2182;
              5'h03: pos_normal = 16'h2183;
              5'h04: pos_normal = 16'h2184;
              5'h05: pos_normal = 16'h2185;
              5'h06: pos_normal = 16'h2186;
              5'h07: pos_normal = 16'h2187;
              5'h08: pos_normal = 16'h2188;
              5'h09: pos_normal = 16'h2189;
              5'h0a: pos_normal = 16'h218a;
              5'h0b: pos_normal = 16'h218b;
              5'h0c: pos_normal = 16'h218c;
              5'h0d: pos_normal = 16'h218d;
              5'h0e: pos_normal = 16'h218e;
              5'h0f: pos_normal = 16'h218f;
              5'h10: pos_normal = 16'h2190;
              5'h11: pos_normal = 16'h2191;
              5'h12: pos_normal = 16'h2192;
              5'h13: pos_normal = 16'h2193;
              5'h14: pos_normal = 16'h2194;
              5'h15: pos_normal = 16'h2195;
              5'h16: pos_normal = 16'h2196;
              5'h17: pos_normal = 16'h2197;
              5'h18: pos_normal = 16'h2198;
              5'h19: pos_normal = 16'h2199;
              5'h1a: pos_normal = 16'h219a;
              5'h1b: pos_normal = 16'h219b;
              5'h1c: pos_normal = 16'h219c;
              5'h1d: pos_normal = 16'h219d;
              5'h1e: pos_normal = 16'h219e;
              5'h1f: pos_normal = 16'h219f;
              default: begin end
            endcase
          end
          5'h0d: begin
            pos_normal = 16'h21a0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h21a1;
              5'h02: pos_normal = 16'h21a2;
              5'h03: pos_normal = 16'h21a3;
              5'h04: pos_normal = 16'h21a4;
              5'h05: pos_normal = 16'h21a5;
              5'h06: pos_normal = 16'h21a6;
              5'h07: pos_normal = 16'h21a7;
              5'h08: pos_normal = 16'h21a8;
              5'h09: pos_normal = 16'h21a9;
              5'h0a: pos_normal = 16'h21aa;
              5'h0b: pos_normal = 16'h21ab;
              5'h0c: pos_normal = 16'h21ac;
              5'h0d: pos_normal = 16'h21ad;
              5'h0e: pos_normal = 16'h21ae;
              5'h0f: pos_normal = 16'h21af;
              5'h10: pos_normal = 16'h21b0;
              5'h11: pos_normal = 16'h21b1;
              5'h12: pos_normal = 16'h21b2;
              5'h13: pos_normal = 16'h21b3;
              5'h14: pos_normal = 16'h21b4;
              5'h15: pos_normal = 16'h21b5;
              5'h16: pos_normal = 16'h21b6;
              5'h17: pos_normal = 16'h21b7;
              5'h18: pos_normal = 16'h21b8;
              5'h19: pos_normal = 16'h21b9;
              5'h1a: pos_normal = 16'h21ba;
              5'h1b: pos_normal = 16'h21bb;
              5'h1c: pos_normal = 16'h21bc;
              5'h1d: pos_normal = 16'h21bd;
              5'h1e: pos_normal = 16'h21be;
              5'h1f: pos_normal = 16'h21bf;
              default: begin end
            endcase
          end
          5'h0e: begin
            pos_normal = 16'h21c0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h21c1;
              5'h02: pos_normal = 16'h21c2;
              5'h03: pos_normal = 16'h21c3;
              5'h04: pos_normal = 16'h21c4;
              5'h05: pos_normal = 16'h21c5;
              5'h06: pos_normal = 16'h21c6;
              5'h07: pos_normal = 16'h21c7;
              5'h08: pos_normal = 16'h21c8;
              5'h09: pos_normal = 16'h21c9;
              5'h0a: pos_normal = 16'h21ca;
              5'h0b: pos_normal = 16'h21cb;
              5'h0c: pos_normal = 16'h21cc;
              5'h0d: pos_normal = 16'h21cd;
              5'h0e: pos_normal = 16'h21ce;
              5'h0f: pos_normal = 16'h21cf;
              5'h10: pos_normal = 16'h21d0;
              5'h11: pos_normal = 16'h21d1;
              5'h12: pos_normal = 16'h21d2;
              5'h13: pos_normal = 16'h21d3;
              5'h14: pos_normal = 16'h21d4;
              5'h15: pos_normal = 16'h21d5;
              5'h16: pos_normal = 16'h21d6;
              5'h17: pos_normal = 16'h21d7;
              5'h18: pos_normal = 16'h21d8;
              5'h19: pos_normal = 16'h21d9;
              5'h1a: pos_normal = 16'h21da;
              5'h1b: pos_normal = 16'h21db;
              5'h1c: pos_normal = 16'h21dc;
              5'h1d: pos_normal = 16'h21dd;
              5'h1e: pos_normal = 16'h21de;
              5'h1f: pos_normal = 16'h21df;
              default: begin end
            endcase
          end
          5'h0f: begin
            pos_normal = 16'h21e0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h21e1;
              5'h02: pos_normal = 16'h21e2;
              5'h03: pos_normal = 16'h21e3;
              5'h04: pos_normal = 16'h21e4;
              5'h05: pos_normal = 16'h21e5;
              5'h06: pos_normal = 16'h21e6;
              5'h07: pos_normal = 16'h21e7;
              5'h08: pos_normal = 16'h21e8;
              5'h09: pos_normal = 16'h21e9;
              5'h0a: pos_normal = 16'h21ea;
              5'h0b: pos_normal = 16'h21eb;
              5'h0c: pos_normal = 16'h21ec;
              5'h0d: pos_normal = 16'h21ed;
              5'h0e: pos_normal = 16'h21ee;
              5'h0f: pos_normal = 16'h21ef;
              5'h10: pos_normal = 16'h21f0;
              5'h11: pos_normal = 16'h21f1;
              5'h12: pos_normal = 16'h21f2;
              5'h13: pos_normal = 16'h21f3;
              5'h14: pos_normal = 16'h21f4;
              5'h15: pos_normal = 16'h21f5;
              5'h16: pos_normal = 16'h21f6;
              5'h17: pos_normal = 16'h21f7;
              5'h18: pos_normal = 16'h21f8;
              5'h19: pos_normal = 16'h21f9;
              5'h1a: pos_normal = 16'h21fa;
              5'h1b: pos_normal = 16'h21fb;
              5'h1c: pos_normal = 16'h21fc;
              5'h1d: pos_normal = 16'h21fd;
              5'h1e: pos_normal = 16'h21fe;
              5'h1f: pos_normal = 16'h21ff;
              default: begin end
            endcase
          end
          5'h10: begin
            pos_normal = 16'h2200;
            case (mant[4:0])
              5'h01: pos_normal = 16'h2201;
              5'h02: pos_normal = 16'h2202;
              5'h03: pos_normal = 16'h2203;
              5'h04: pos_normal = 16'h2204;
              5'h05: pos_normal = 16'h2205;
              5'h06: pos_normal = 16'h2206;
              5'h07: pos_normal = 16'h2207;
              5'h08: pos_normal = 16'h2208;
              5'h09: pos_normal = 16'h2209;
              5'h0a: pos_normal = 16'h220a;
              5'h0b: pos_normal = 16'h220b;
              5'h0c: pos_normal = 16'h220c;
              5'h0d: pos_normal = 16'h220d;
              5'h0e: pos_normal = 16'h220e;
              5'h0f: pos_normal = 16'h220f;
              5'h10: pos_normal = 16'h2210;
              5'h11: pos_normal = 16'h2211;
              5'h12: pos_normal = 16'h2212;
              5'h13: pos_normal = 16'h2213;
              5'h14: pos_normal = 16'h2214;
              5'h15: pos_normal = 16'h2215;
              5'h16: pos_normal = 16'h2216;
              5'h17: pos_normal = 16'h2217;
              5'h18: pos_normal = 16'h2218;
              5'h19: pos_normal = 16'h2219;
              5'h1a: pos_normal = 16'h221a;
              5'h1b: pos_normal = 16'h221b;
              5'h1c: pos_normal = 16'h221c;
              5'h1d: pos_normal = 16'h221d;
              5'h1e: pos_normal = 16'h221e;
              5'h1f: pos_normal = 16'h221f;
              default: begin end
            endcase
          end
          5'h11: begin
            pos_normal = 16'h2220;
            case (mant[4:0])
              5'h01: pos_normal = 16'h2221;
              5'h02: pos_normal = 16'h2222;
              5'h03: pos_normal = 16'h2223;
              5'h04: pos_normal = 16'h2224;
              5'h05: pos_normal = 16'h2225;
              5'h06: pos_normal = 16'h2226;
              5'h07: pos_normal = 16'h2227;
              5'h08: pos_normal = 16'h2228;
              5'h09: pos_normal = 16'h2229;
              5'h0a: pos_normal = 16'h222a;
              5'h0b: pos_normal = 16'h222b;
              5'h0c: pos_normal = 16'h222c;
              5'h0d: pos_normal = 16'h222d;
              5'h0e: pos_normal = 16'h222e;
              5'h0f: pos_normal = 16'h222f;
              5'h10: pos_normal = 16'h2230;
              5'h11: pos_normal = 16'h2231;
              5'h12: pos_normal = 16'h2232;
              5'h13: pos_normal = 16'h2233;
              5'h14: pos_normal = 16'h2234;
              5'h15: pos_normal = 16'h2235;
              5'h16: pos_normal = 16'h2236;
              5'h17: pos_normal = 16'h2237;
              5'h18: pos_normal = 16'h2238;
              5'h19: pos_normal = 16'h2239;
              5'h1a: pos_normal = 16'h223a;
              5'h1b: pos_normal = 16'h223b;
              5'h1c: pos_normal = 16'h223c;
              5'h1d: pos_normal = 16'h223d;
              5'h1e: pos_normal = 16'h223e;
              5'h1f: pos_normal = 16'h223f;
              default: begin end
            endcase
          end
          5'h12: begin
            pos_normal = 16'h2240;
            case (mant[4:0])
              5'h01: pos_normal = 16'h2241;
              5'h02: pos_normal = 16'h2242;
              5'h03: pos_normal = 16'h2243;
              5'h04: pos_normal = 16'h2244;
              5'h05: pos_normal = 16'h2245;
              5'h06: pos_normal = 16'h2246;
              5'h07: pos_normal = 16'h2247;
              5'h08: pos_normal = 16'h2248;
              5'h09: pos_normal = 16'h2249;
              5'h0a: pos_normal = 16'h224a;
              5'h0b: pos_normal = 16'h224b;
              5'h0c: pos_normal = 16'h224c;
              5'h0d: pos_normal = 16'h224d;
              5'h0e: pos_normal = 16'h224e;
              5'h0f: pos_normal = 16'h224f;
              5'h10: pos_normal = 16'h2250;
              5'h11: pos_normal = 16'h2251;
              5'h12: pos_normal = 16'h2252;
              5'h13: pos_normal = 16'h2253;
              5'h14: pos_normal = 16'h2254;
              5'h15: pos_normal = 16'h2255;
              5'h16: pos_normal = 16'h2256;
              5'h17: pos_normal = 16'h2257;
              5'h18: pos_normal = 16'h2258;
              5'h19: pos_normal = 16'h2259;
              5'h1a: pos_normal = 16'h225a;
              5'h1b: pos_normal = 16'h225b;
              5'h1c: pos_normal = 16'h225c;
              5'h1d: pos_normal = 16'h225d;
              5'h1e: pos_normal = 16'h225e;
              5'h1f: pos_normal = 16'h225f;
              default: begin end
            endcase
          end
          5'h13: begin
            pos_normal = 16'h2260;
            case (mant[4:0])
              5'h01: pos_normal = 16'h2261;
              5'h02: pos_normal = 16'h2262;
              5'h03: pos_normal = 16'h2263;
              5'h04: pos_normal = 16'h2264;
              5'h05: pos_normal = 16'h2265;
              5'h06: pos_normal = 16'h2266;
              5'h07: pos_normal = 16'h2267;
              5'h08: pos_normal = 16'h2268;
              5'h09: pos_normal = 16'h2269;
              5'h0a: pos_normal = 16'h226a;
              5'h0b: pos_normal = 16'h226b;
              5'h0c: pos_normal = 16'h226c;
              5'h0d: pos_normal = 16'h226d;
              5'h0e: pos_normal = 16'h226e;
              5'h0f: pos_normal = 16'h226f;
              5'h10: pos_normal = 16'h2270;
              5'h11: pos_normal = 16'h2271;
              5'h12: pos_normal = 16'h2272;
              5'h13: pos_normal = 16'h2273;
              5'h14: pos_normal = 16'h2274;
              5'h15: pos_normal = 16'h2275;
              5'h16: pos_normal = 16'h2276;
              5'h17: pos_normal = 16'h2277;
              5'h18: pos_normal = 16'h2278;
              5'h19: pos_normal = 16'h2279;
              5'h1a: pos_normal = 16'h227a;
              5'h1b: pos_normal = 16'h227b;
              5'h1c: pos_normal = 16'h227c;
              5'h1d: pos_normal = 16'h227d;
              5'h1e: pos_normal = 16'h227e;
              5'h1f: pos_normal = 16'h227f;
              default: begin end
            endcase
          end
          5'h14: begin
            pos_normal = 16'h2280;
            case (mant[4:0])
              5'h01: pos_normal = 16'h2281;
              5'h02: pos_normal = 16'h2282;
              5'h03: pos_normal = 16'h2283;
              5'h04: pos_normal = 16'h2284;
              5'h05: pos_normal = 16'h2285;
              5'h06: pos_normal = 16'h2286;
              5'h07: pos_normal = 16'h2287;
              5'h08: pos_normal = 16'h2288;
              5'h09: pos_normal = 16'h2289;
              5'h0a: pos_normal = 16'h228a;
              5'h0b: pos_normal = 16'h228b;
              5'h0c: pos_normal = 16'h228c;
              5'h0d: pos_normal = 16'h228d;
              5'h0e: pos_normal = 16'h228e;
              5'h0f: pos_normal = 16'h228f;
              5'h10: pos_normal = 16'h2290;
              5'h11: pos_normal = 16'h2291;
              5'h12: pos_normal = 16'h2292;
              5'h13: pos_normal = 16'h2293;
              5'h14: pos_normal = 16'h2294;
              5'h15: pos_normal = 16'h2295;
              5'h16: pos_normal = 16'h2296;
              5'h17: pos_normal = 16'h2297;
              5'h18: pos_normal = 16'h2298;
              5'h19: pos_normal = 16'h2299;
              5'h1a: pos_normal = 16'h229a;
              5'h1b: pos_normal = 16'h229b;
              5'h1c: pos_normal = 16'h229c;
              5'h1d: pos_normal = 16'h229d;
              5'h1e: pos_normal = 16'h229e;
              5'h1f: pos_normal = 16'h229f;
              default: begin end
            endcase
          end
          5'h15: begin
            pos_normal = 16'h22a0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h22a1;
              5'h02: pos_normal = 16'h22a2;
              5'h03: pos_normal = 16'h22a3;
              5'h04: pos_normal = 16'h22a4;
              5'h05: pos_normal = 16'h22a5;
              5'h06: pos_normal = 16'h22a6;
              5'h07: pos_normal = 16'h22a7;
              5'h08: pos_normal = 16'h22a8;
              5'h09: pos_normal = 16'h22a9;
              5'h0a: pos_normal = 16'h22aa;
              5'h0b: pos_normal = 16'h22ab;
              5'h0c: pos_normal = 16'h22ac;
              5'h0d: pos_normal = 16'h22ad;
              5'h0e: pos_normal = 16'h22ae;
              5'h0f: pos_normal = 16'h22af;
              5'h10: pos_normal = 16'h22b0;
              5'h11: pos_normal = 16'h22b1;
              5'h12: pos_normal = 16'h22b2;
              5'h13: pos_normal = 16'h22b3;
              5'h14: pos_normal = 16'h22b4;
              5'h15: pos_normal = 16'h22b5;
              5'h16: pos_normal = 16'h22b6;
              5'h17: pos_normal = 16'h22b7;
              5'h18: pos_normal = 16'h22b8;
              5'h19: pos_normal = 16'h22b9;
              5'h1a: pos_normal = 16'h22ba;
              5'h1b: pos_normal = 16'h22bb;
              5'h1c: pos_normal = 16'h22bc;
              5'h1d: pos_normal = 16'h22bd;
              5'h1e: pos_normal = 16'h22be;
              5'h1f: pos_normal = 16'h22bf;
              default: begin end
            endcase
          end
          5'h16: begin
            pos_normal = 16'h22c0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h22c1;
              5'h02: pos_normal = 16'h22c2;
              5'h03: pos_normal = 16'h22c3;
              5'h04: pos_normal = 16'h22c4;
              5'h05: pos_normal = 16'h22c5;
              5'h06: pos_normal = 16'h22c6;
              5'h07: pos_normal = 16'h22c7;
              5'h08: pos_normal = 16'h22c8;
              5'h09: pos_normal = 16'h22c9;
              5'h0a: pos_normal = 16'h22ca;
              5'h0b: pos_normal = 16'h22cb;
              5'h0c: pos_normal = 16'h22cc;
              5'h0d: pos_normal = 16'h22cd;
              5'h0e: pos_normal = 16'h22ce;
              5'h0f: pos_normal = 16'h22cf;
              5'h10: pos_normal = 16'h22d0;
              5'h11: pos_normal = 16'h22d1;
              5'h12: pos_normal = 16'h22d2;
              5'h13: pos_normal = 16'h22d3;
              5'h14: pos_normal = 16'h22d4;
              5'h15: pos_normal = 16'h22d5;
              5'h16: pos_normal = 16'h22d6;
              5'h17: pos_normal = 16'h22d7;
              5'h18: pos_normal = 16'h22d8;
              5'h19: pos_normal = 16'h22d9;
              5'h1a: pos_normal = 16'h22da;
              5'h1b: pos_normal = 16'h22db;
              5'h1c: pos_normal = 16'h22dc;
              5'h1d: pos_normal = 16'h22dd;
              5'h1e: pos_normal = 16'h22de;
              5'h1f: pos_normal = 16'h22df;
              default: begin end
            endcase
          end
          5'h17: begin
            pos_normal = 16'h22e0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h22e1;
              5'h02: pos_normal = 16'h22e2;
              5'h03: pos_normal = 16'h22e3;
              5'h04: pos_normal = 16'h22e4;
              5'h05: pos_normal = 16'h22e5;
              5'h06: pos_normal = 16'h22e6;
              5'h07: pos_normal = 16'h22e7;
              5'h08: pos_normal = 16'h22e8;
              5'h09: pos_normal = 16'h22e9;
              5'h0a: pos_normal = 16'h22ea;
              5'h0b: pos_normal = 16'h22eb;
              5'h0c: pos_normal = 16'h22ec;
              5'h0d: pos_normal = 16'h22ed;
              5'h0e: pos_normal = 16'h22ee;
              5'h0f: pos_normal = 16'h22ef;
              5'h10: pos_normal = 16'h22f0;
              5'h11: pos_normal = 16'h22f1;
              5'h12: pos_normal = 16'h22f2;
              5'h13: pos_normal = 16'h22f3;
              5'h14: pos_normal = 16'h22f4;
              5'h15: pos_normal = 16'h22f5;
              5'h16: pos_normal = 16'h22f6;
              5'h17: pos_normal = 16'h22f7;
              5'h18: pos_normal = 16'h22f8;
              5'h19: pos_normal = 16'h22f9;
              5'h1a: pos_normal = 16'h22fa;
              5'h1b: pos_normal = 16'h22fb;
              5'h1c: pos_normal = 16'h22fc;
              5'h1d: pos_normal = 16'h22fd;
              5'h1e: pos_normal = 16'h22fe;
              5'h1f: pos_normal = 16'h22ff;
              default: begin end
            endcase
          end
          5'h18: begin
            pos_normal = 16'h2300;
            case (mant[4:0])
              5'h01: pos_normal = 16'h2301;
              5'h02: pos_normal = 16'h2302;
              5'h03: pos_normal = 16'h2303;
              5'h04: pos_normal = 16'h2304;
              5'h05: pos_normal = 16'h2305;
              5'h06: pos_normal = 16'h2306;
              5'h07: pos_normal = 16'h2307;
              5'h08: pos_normal = 16'h2308;
              5'h09: pos_normal = 16'h2309;
              5'h0a: pos_normal = 16'h230a;
              5'h0b: pos_normal = 16'h230b;
              5'h0c: pos_normal = 16'h230c;
              5'h0d: pos_normal = 16'h230d;
              5'h0e: pos_normal = 16'h230e;
              5'h0f: pos_normal = 16'h230f;
              5'h10: pos_normal = 16'h2310;
              5'h11: pos_normal = 16'h2311;
              5'h12: pos_normal = 16'h2312;
              5'h13: pos_normal = 16'h2313;
              5'h14: pos_normal = 16'h2314;
              5'h15: pos_normal = 16'h2315;
              5'h16: pos_normal = 16'h2316;
              5'h17: pos_normal = 16'h2317;
              5'h18: pos_normal = 16'h2318;
              5'h19: pos_normal = 16'h2319;
              5'h1a: pos_normal = 16'h231a;
              5'h1b: pos_normal = 16'h231b;
              5'h1c: pos_normal = 16'h231c;
              5'h1d: pos_normal = 16'h231d;
              5'h1e: pos_normal = 16'h231e;
              5'h1f: pos_normal = 16'h231f;
              default: begin end
            endcase
          end
          5'h19: begin
            pos_normal = 16'h2320;
            case (mant[4:0])
              5'h01: pos_normal = 16'h2321;
              5'h02: pos_normal = 16'h2322;
              5'h03: pos_normal = 16'h2323;
              5'h04: pos_normal = 16'h2324;
              5'h05: pos_normal = 16'h2325;
              5'h06: pos_normal = 16'h2326;
              5'h07: pos_normal = 16'h2327;
              5'h08: pos_normal = 16'h2328;
              5'h09: pos_normal = 16'h2329;
              5'h0a: pos_normal = 16'h232a;
              5'h0b: pos_normal = 16'h232b;
              5'h0c: pos_normal = 16'h232c;
              5'h0d: pos_normal = 16'h232d;
              5'h0e: pos_normal = 16'h232e;
              5'h0f: pos_normal = 16'h232f;
              5'h10: pos_normal = 16'h2330;
              5'h11: pos_normal = 16'h2331;
              5'h12: pos_normal = 16'h2332;
              5'h13: pos_normal = 16'h2333;
              5'h14: pos_normal = 16'h2334;
              5'h15: pos_normal = 16'h2335;
              5'h16: pos_normal = 16'h2336;
              5'h17: pos_normal = 16'h2337;
              5'h18: pos_normal = 16'h2338;
              5'h19: pos_normal = 16'h2339;
              5'h1a: pos_normal = 16'h233a;
              5'h1b: pos_normal = 16'h233b;
              5'h1c: pos_normal = 16'h233c;
              5'h1d: pos_normal = 16'h233d;
              5'h1e: pos_normal = 16'h233e;
              5'h1f: pos_normal = 16'h233f;
              default: begin end
            endcase
          end
          5'h1a: begin
            pos_normal = 16'h2340;
            case (mant[4:0])
              5'h01: pos_normal = 16'h2341;
              5'h02: pos_normal = 16'h2342;
              5'h03: pos_normal = 16'h2343;
              5'h04: pos_normal = 16'h2344;
              5'h05: pos_normal = 16'h2345;
              5'h06: pos_normal = 16'h2346;
              5'h07: pos_normal = 16'h2347;
              5'h08: pos_normal = 16'h2348;
              5'h09: pos_normal = 16'h2349;
              5'h0a: pos_normal = 16'h234a;
              5'h0b: pos_normal = 16'h234b;
              5'h0c: pos_normal = 16'h234c;
              5'h0d: pos_normal = 16'h234d;
              5'h0e: pos_normal = 16'h234e;
              5'h0f: pos_normal = 16'h234f;
              5'h10: pos_normal = 16'h2350;
              5'h11: pos_normal = 16'h2351;
              5'h12: pos_normal = 16'h2352;
              5'h13: pos_normal = 16'h2353;
              5'h14: pos_normal = 16'h2354;
              5'h15: pos_normal = 16'h2355;
              5'h16: pos_normal = 16'h2356;
              5'h17: pos_normal = 16'h2357;
              5'h18: pos_normal = 16'h2358;
              5'h19: pos_normal = 16'h2359;
              5'h1a: pos_normal = 16'h235a;
              5'h1b: pos_normal = 16'h235b;
              5'h1c: pos_normal = 16'h235c;
              5'h1d: pos_normal = 16'h235d;
              5'h1e: pos_normal = 16'h235e;
              5'h1f: pos_normal = 16'h235f;
              default: begin end
            endcase
          end
          5'h1b: begin
            pos_normal = 16'h2360;
            case (mant[4:0])
              5'h01: pos_normal = 16'h2361;
              5'h02: pos_normal = 16'h2362;
              5'h03: pos_normal = 16'h2363;
              5'h04: pos_normal = 16'h2364;
              5'h05: pos_normal = 16'h2365;
              5'h06: pos_normal = 16'h2366;
              5'h07: pos_normal = 16'h2367;
              5'h08: pos_normal = 16'h2368;
              5'h09: pos_normal = 16'h2369;
              5'h0a: pos_normal = 16'h236a;
              5'h0b: pos_normal = 16'h236b;
              5'h0c: pos_normal = 16'h236c;
              5'h0d: pos_normal = 16'h236d;
              5'h0e: pos_normal = 16'h236e;
              5'h0f: pos_normal = 16'h236f;
              5'h10: pos_normal = 16'h2370;
              5'h11: pos_normal = 16'h2371;
              5'h12: pos_normal = 16'h2372;
              5'h13: pos_normal = 16'h2373;
              5'h14: pos_normal = 16'h2374;
              5'h15: pos_normal = 16'h2375;
              5'h16: pos_normal = 16'h2376;
              5'h17: pos_normal = 16'h2377;
              5'h18: pos_normal = 16'h2378;
              5'h19: pos_normal = 16'h2379;
              5'h1a: pos_normal = 16'h237a;
              5'h1b: pos_normal = 16'h237b;
              5'h1c: pos_normal = 16'h237c;
              5'h1d: pos_normal = 16'h237d;
              5'h1e: pos_normal = 16'h237e;
              5'h1f: pos_normal = 16'h237f;
              default: begin end
            endcase
          end
          5'h1c: begin
            pos_normal = 16'h2380;
            case (mant[4:0])
              5'h01: pos_normal = 16'h2381;
              5'h02: pos_normal = 16'h2382;
              5'h03: pos_normal = 16'h2383;
              5'h04: pos_normal = 16'h2384;
              5'h05: pos_normal = 16'h2385;
              5'h06: pos_normal = 16'h2386;
              5'h07: pos_normal = 16'h2387;
              5'h08: pos_normal = 16'h2388;
              5'h09: pos_normal = 16'h2389;
              5'h0a: pos_normal = 16'h238a;
              5'h0b: pos_normal = 16'h238b;
              5'h0c: pos_normal = 16'h238c;
              5'h0d: pos_normal = 16'h238d;
              5'h0e: pos_normal = 16'h238e;
              5'h0f: pos_normal = 16'h238f;
              5'h10: pos_normal = 16'h2390;
              5'h11: pos_normal = 16'h2391;
              5'h12: pos_normal = 16'h2392;
              5'h13: pos_normal = 16'h2393;
              5'h14: pos_normal = 16'h2394;
              5'h15: pos_normal = 16'h2395;
              5'h16: pos_normal = 16'h2396;
              5'h17: pos_normal = 16'h2397;
              5'h18: pos_normal = 16'h2398;
              5'h19: pos_normal = 16'h2399;
              5'h1a: pos_normal = 16'h239a;
              5'h1b: pos_normal = 16'h239b;
              5'h1c: pos_normal = 16'h239c;
              5'h1d: pos_normal = 16'h239d;
              5'h1e: pos_normal = 16'h239e;
              5'h1f: pos_normal = 16'h239f;
              default: begin end
            endcase
          end
          5'h1d: begin
            pos_normal = 16'h23a0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h23a1;
              5'h02: pos_normal = 16'h23a2;
              5'h03: pos_normal = 16'h23a3;
              5'h04: pos_normal = 16'h23a4;
              5'h05: pos_normal = 16'h23a5;
              5'h06: pos_normal = 16'h23a6;
              5'h07: pos_normal = 16'h23a7;
              5'h08: pos_normal = 16'h23a8;
              5'h09: pos_normal = 16'h23a9;
              5'h0a: pos_normal = 16'h23aa;
              5'h0b: pos_normal = 16'h23ab;
              5'h0c: pos_normal = 16'h23ac;
              5'h0d: pos_normal = 16'h23ad;
              5'h0e: pos_normal = 16'h23ae;
              5'h0f: pos_normal = 16'h23af;
              5'h10: pos_normal = 16'h23b0;
              5'h11: pos_normal = 16'h23b1;
              5'h12: pos_normal = 16'h23b2;
              5'h13: pos_normal = 16'h23b3;
              5'h14: pos_normal = 16'h23b4;
              5'h15: pos_normal = 16'h23b5;
              5'h16: pos_normal = 16'h23b6;
              5'h17: pos_normal = 16'h23b7;
              5'h18: pos_normal = 16'h23b8;
              5'h19: pos_normal = 16'h23b9;
              5'h1a: pos_normal = 16'h23ba;
              5'h1b: pos_normal = 16'h23bb;
              5'h1c: pos_normal = 16'h23bc;
              5'h1d: pos_normal = 16'h23bd;
              5'h1e: pos_normal = 16'h23be;
              5'h1f: pos_normal = 16'h23bf;
              default: begin end
            endcase
          end
          5'h1e: begin
            pos_normal = 16'h23c0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h23c1;
              5'h02: pos_normal = 16'h23c2;
              5'h03: pos_normal = 16'h23c3;
              5'h04: pos_normal = 16'h23c4;
              5'h05: pos_normal = 16'h23c5;
              5'h06: pos_normal = 16'h23c6;
              5'h07: pos_normal = 16'h23c7;
              5'h08: pos_normal = 16'h23c8;
              5'h09: pos_normal = 16'h23c9;
              5'h0a: pos_normal = 16'h23ca;
              5'h0b: pos_normal = 16'h23cb;
              5'h0c: pos_normal = 16'h23cc;
              5'h0d: pos_normal = 16'h23cd;
              5'h0e: pos_normal = 16'h23ce;
              5'h0f: pos_normal = 16'h23cf;
              5'h10: pos_normal = 16'h23d0;
              5'h11: pos_normal = 16'h23d1;
              5'h12: pos_normal = 16'h23d2;
              5'h13: pos_normal = 16'h23d3;
              5'h14: pos_normal = 16'h23d4;
              5'h15: pos_normal = 16'h23d5;
              5'h16: pos_normal = 16'h23d6;
              5'h17: pos_normal = 16'h23d7;
              5'h18: pos_normal = 16'h23d8;
              5'h19: pos_normal = 16'h23d9;
              5'h1a: pos_normal = 16'h23da;
              5'h1b: pos_normal = 16'h23db;
              5'h1c: pos_normal = 16'h23dc;
              5'h1d: pos_normal = 16'h23dd;
              5'h1e: pos_normal = 16'h23de;
              5'h1f: pos_normal = 16'h23df;
              default: begin end
            endcase
          end
          5'h1f: begin
            pos_normal = 16'h23e0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h23e1;
              5'h02: pos_normal = 16'h23e2;
              5'h03: pos_normal = 16'h23e3;
              5'h04: pos_normal = 16'h23e4;
              5'h05: pos_normal = 16'h23e5;
              5'h06: pos_normal = 16'h23e6;
              5'h07: pos_normal = 16'h23e7;
              5'h08: pos_normal = 16'h23e8;
              5'h09: pos_normal = 16'h23e9;
              5'h0a: pos_normal = 16'h23ea;
              5'h0b: pos_normal = 16'h23eb;
              5'h0c: pos_normal = 16'h23ec;
              5'h0d: pos_normal = 16'h23ed;
              5'h0e: pos_normal = 16'h23ee;
              5'h0f: pos_normal = 16'h23ef;
              5'h10: pos_normal = 16'h23f0;
              5'h11: pos_normal = 16'h23f1;
              5'h12: pos_normal = 16'h23f2;
              5'h13: pos_normal = 16'h23f3;
              5'h14: pos_normal = 16'h23f4;
              5'h15: pos_normal = 16'h23f5;
              5'h16: pos_normal = 16'h23f6;
              5'h17: pos_normal = 16'h23f7;
              5'h18: pos_normal = 16'h23f8;
              5'h19: pos_normal = 16'h23f9;
              5'h1a: pos_normal = 16'h23fa;
              5'h1b: pos_normal = 16'h23fb;
              5'h1c: pos_normal = 16'h23fc;
              5'h1d: pos_normal = 16'h23fd;
              5'h1e: pos_normal = 16'h23fe;
              5'h1f: pos_normal = 16'h23ff;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      5'h09: begin
        case (mant[9:5])
          5'h00: begin
            pos_normal = 16'h2400;
            case (mant[4:0])
              5'h01: pos_normal = 16'h2401;
              5'h02: pos_normal = 16'h2402;
              5'h03: pos_normal = 16'h2403;
              5'h04: pos_normal = 16'h2404;
              5'h05: pos_normal = 16'h2405;
              5'h06: pos_normal = 16'h2406;
              5'h07: pos_normal = 16'h2407;
              5'h08: pos_normal = 16'h2408;
              5'h09: pos_normal = 16'h2409;
              5'h0a: pos_normal = 16'h240a;
              5'h0b: pos_normal = 16'h240b;
              5'h0c: pos_normal = 16'h240c;
              5'h0d: pos_normal = 16'h240d;
              5'h0e: pos_normal = 16'h240e;
              5'h0f: pos_normal = 16'h240f;
              5'h10: pos_normal = 16'h2410;
              5'h11: pos_normal = 16'h2411;
              5'h12: pos_normal = 16'h2412;
              5'h13: pos_normal = 16'h2413;
              5'h14: pos_normal = 16'h2414;
              5'h15: pos_normal = 16'h2415;
              5'h16: pos_normal = 16'h2416;
              5'h17: pos_normal = 16'h2417;
              5'h18: pos_normal = 16'h2418;
              5'h19: pos_normal = 16'h2419;
              5'h1a: pos_normal = 16'h241a;
              5'h1b: pos_normal = 16'h241b;
              5'h1c: pos_normal = 16'h241c;
              5'h1d: pos_normal = 16'h241d;
              5'h1e: pos_normal = 16'h241e;
              5'h1f: pos_normal = 16'h241f;
              default: begin end
            endcase
          end
          5'h01: begin
            pos_normal = 16'h2420;
            case (mant[4:0])
              5'h01: pos_normal = 16'h2421;
              5'h02: pos_normal = 16'h2422;
              5'h03: pos_normal = 16'h2423;
              5'h04: pos_normal = 16'h2424;
              5'h05: pos_normal = 16'h2425;
              5'h06: pos_normal = 16'h2426;
              5'h07: pos_normal = 16'h2427;
              5'h08: pos_normal = 16'h2428;
              5'h09: pos_normal = 16'h2429;
              5'h0a: pos_normal = 16'h242a;
              5'h0b: pos_normal = 16'h242b;
              5'h0c: pos_normal = 16'h242c;
              5'h0d: pos_normal = 16'h242d;
              5'h0e: pos_normal = 16'h242e;
              5'h0f: pos_normal = 16'h242f;
              5'h10: pos_normal = 16'h2430;
              5'h11: pos_normal = 16'h2431;
              5'h12: pos_normal = 16'h2432;
              5'h13: pos_normal = 16'h2433;
              5'h14: pos_normal = 16'h2434;
              5'h15: pos_normal = 16'h2435;
              5'h16: pos_normal = 16'h2436;
              5'h17: pos_normal = 16'h2437;
              5'h18: pos_normal = 16'h2438;
              5'h19: pos_normal = 16'h2439;
              5'h1a: pos_normal = 16'h243a;
              5'h1b: pos_normal = 16'h243b;
              5'h1c: pos_normal = 16'h243c;
              5'h1d: pos_normal = 16'h243d;
              5'h1e: pos_normal = 16'h243e;
              5'h1f: pos_normal = 16'h243f;
              default: begin end
            endcase
          end
          5'h02: begin
            pos_normal = 16'h2440;
            case (mant[4:0])
              5'h01: pos_normal = 16'h2441;
              5'h02: pos_normal = 16'h2442;
              5'h03: pos_normal = 16'h2443;
              5'h04: pos_normal = 16'h2444;
              5'h05: pos_normal = 16'h2445;
              5'h06: pos_normal = 16'h2446;
              5'h07: pos_normal = 16'h2447;
              5'h08: pos_normal = 16'h2448;
              5'h09: pos_normal = 16'h2449;
              5'h0a: pos_normal = 16'h244a;
              5'h0b: pos_normal = 16'h244b;
              5'h0c: pos_normal = 16'h244c;
              5'h0d: pos_normal = 16'h244d;
              5'h0e: pos_normal = 16'h244e;
              5'h0f: pos_normal = 16'h244f;
              5'h10: pos_normal = 16'h2450;
              5'h11: pos_normal = 16'h2451;
              5'h12: pos_normal = 16'h2452;
              5'h13: pos_normal = 16'h2453;
              5'h14: pos_normal = 16'h2454;
              5'h15: pos_normal = 16'h2455;
              5'h16: pos_normal = 16'h2456;
              5'h17: pos_normal = 16'h2457;
              5'h18: pos_normal = 16'h2458;
              5'h19: pos_normal = 16'h2459;
              5'h1a: pos_normal = 16'h245a;
              5'h1b: pos_normal = 16'h245b;
              5'h1c: pos_normal = 16'h245c;
              5'h1d: pos_normal = 16'h245d;
              5'h1e: pos_normal = 16'h245e;
              5'h1f: pos_normal = 16'h245f;
              default: begin end
            endcase
          end
          5'h03: begin
            pos_normal = 16'h2460;
            case (mant[4:0])
              5'h01: pos_normal = 16'h2461;
              5'h02: pos_normal = 16'h2462;
              5'h03: pos_normal = 16'h2463;
              5'h04: pos_normal = 16'h2464;
              5'h05: pos_normal = 16'h2465;
              5'h06: pos_normal = 16'h2466;
              5'h07: pos_normal = 16'h2467;
              5'h08: pos_normal = 16'h2468;
              5'h09: pos_normal = 16'h2469;
              5'h0a: pos_normal = 16'h246a;
              5'h0b: pos_normal = 16'h246b;
              5'h0c: pos_normal = 16'h246c;
              5'h0d: pos_normal = 16'h246d;
              5'h0e: pos_normal = 16'h246e;
              5'h0f: pos_normal = 16'h246f;
              5'h10: pos_normal = 16'h2470;
              5'h11: pos_normal = 16'h2471;
              5'h12: pos_normal = 16'h2472;
              5'h13: pos_normal = 16'h2473;
              5'h14: pos_normal = 16'h2474;
              5'h15: pos_normal = 16'h2475;
              5'h16: pos_normal = 16'h2476;
              5'h17: pos_normal = 16'h2477;
              5'h18: pos_normal = 16'h2478;
              5'h19: pos_normal = 16'h2479;
              5'h1a: pos_normal = 16'h247a;
              5'h1b: pos_normal = 16'h247b;
              5'h1c: pos_normal = 16'h247c;
              5'h1d: pos_normal = 16'h247d;
              5'h1e: pos_normal = 16'h247e;
              5'h1f: pos_normal = 16'h247f;
              default: begin end
            endcase
          end
          5'h04: begin
            pos_normal = 16'h2480;
            case (mant[4:0])
              5'h01: pos_normal = 16'h2481;
              5'h02: pos_normal = 16'h2482;
              5'h03: pos_normal = 16'h2483;
              5'h04: pos_normal = 16'h2484;
              5'h05: pos_normal = 16'h2485;
              5'h06: pos_normal = 16'h2486;
              5'h07: pos_normal = 16'h2487;
              5'h08: pos_normal = 16'h2488;
              5'h09: pos_normal = 16'h2489;
              5'h0a: pos_normal = 16'h248a;
              5'h0b: pos_normal = 16'h248b;
              5'h0c: pos_normal = 16'h248c;
              5'h0d: pos_normal = 16'h248d;
              5'h0e: pos_normal = 16'h248e;
              5'h0f: pos_normal = 16'h248f;
              5'h10: pos_normal = 16'h2490;
              5'h11: pos_normal = 16'h2491;
              5'h12: pos_normal = 16'h2492;
              5'h13: pos_normal = 16'h2493;
              5'h14: pos_normal = 16'h2494;
              5'h15: pos_normal = 16'h2495;
              5'h16: pos_normal = 16'h2496;
              5'h17: pos_normal = 16'h2497;
              5'h18: pos_normal = 16'h2498;
              5'h19: pos_normal = 16'h2499;
              5'h1a: pos_normal = 16'h249a;
              5'h1b: pos_normal = 16'h249b;
              5'h1c: pos_normal = 16'h249c;
              5'h1d: pos_normal = 16'h249d;
              5'h1e: pos_normal = 16'h249e;
              5'h1f: pos_normal = 16'h249f;
              default: begin end
            endcase
          end
          5'h05: begin
            pos_normal = 16'h24a0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h24a1;
              5'h02: pos_normal = 16'h24a2;
              5'h03: pos_normal = 16'h24a3;
              5'h04: pos_normal = 16'h24a4;
              5'h05: pos_normal = 16'h24a5;
              5'h06: pos_normal = 16'h24a6;
              5'h07: pos_normal = 16'h24a7;
              5'h08: pos_normal = 16'h24a8;
              5'h09: pos_normal = 16'h24a9;
              5'h0a: pos_normal = 16'h24aa;
              5'h0b: pos_normal = 16'h24ab;
              5'h0c: pos_normal = 16'h24ac;
              5'h0d: pos_normal = 16'h24ad;
              5'h0e: pos_normal = 16'h24ae;
              5'h0f: pos_normal = 16'h24af;
              5'h10: pos_normal = 16'h24b0;
              5'h11: pos_normal = 16'h24b1;
              5'h12: pos_normal = 16'h24b2;
              5'h13: pos_normal = 16'h24b3;
              5'h14: pos_normal = 16'h24b4;
              5'h15: pos_normal = 16'h24b5;
              5'h16: pos_normal = 16'h24b6;
              5'h17: pos_normal = 16'h24b7;
              5'h18: pos_normal = 16'h24b8;
              5'h19: pos_normal = 16'h24b9;
              5'h1a: pos_normal = 16'h24ba;
              5'h1b: pos_normal = 16'h24bb;
              5'h1c: pos_normal = 16'h24bc;
              5'h1d: pos_normal = 16'h24bd;
              5'h1e: pos_normal = 16'h24be;
              5'h1f: pos_normal = 16'h24bf;
              default: begin end
            endcase
          end
          5'h06: begin
            pos_normal = 16'h24c0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h24c1;
              5'h02: pos_normal = 16'h24c2;
              5'h03: pos_normal = 16'h24c3;
              5'h04: pos_normal = 16'h24c4;
              5'h05: pos_normal = 16'h24c5;
              5'h06: pos_normal = 16'h24c6;
              5'h07: pos_normal = 16'h24c7;
              5'h08: pos_normal = 16'h24c8;
              5'h09: pos_normal = 16'h24c9;
              5'h0a: pos_normal = 16'h24ca;
              5'h0b: pos_normal = 16'h24cb;
              5'h0c: pos_normal = 16'h24cc;
              5'h0d: pos_normal = 16'h24cd;
              5'h0e: pos_normal = 16'h24ce;
              5'h0f: pos_normal = 16'h24cf;
              5'h10: pos_normal = 16'h24d0;
              5'h11: pos_normal = 16'h24d1;
              5'h12: pos_normal = 16'h24d2;
              5'h13: pos_normal = 16'h24d3;
              5'h14: pos_normal = 16'h24d4;
              5'h15: pos_normal = 16'h24d5;
              5'h16: pos_normal = 16'h24d6;
              5'h17: pos_normal = 16'h24d7;
              5'h18: pos_normal = 16'h24d8;
              5'h19: pos_normal = 16'h24d9;
              5'h1a: pos_normal = 16'h24da;
              5'h1b: pos_normal = 16'h24db;
              5'h1c: pos_normal = 16'h24dc;
              5'h1d: pos_normal = 16'h24dd;
              5'h1e: pos_normal = 16'h24de;
              5'h1f: pos_normal = 16'h24df;
              default: begin end
            endcase
          end
          5'h07: begin
            pos_normal = 16'h24e0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h24e1;
              5'h02: pos_normal = 16'h24e2;
              5'h03: pos_normal = 16'h24e3;
              5'h04: pos_normal = 16'h24e4;
              5'h05: pos_normal = 16'h24e5;
              5'h06: pos_normal = 16'h24e6;
              5'h07: pos_normal = 16'h24e7;
              5'h08: pos_normal = 16'h24e8;
              5'h09: pos_normal = 16'h24e9;
              5'h0a: pos_normal = 16'h24ea;
              5'h0b: pos_normal = 16'h24eb;
              5'h0c: pos_normal = 16'h24ec;
              5'h0d: pos_normal = 16'h24ed;
              5'h0e: pos_normal = 16'h24ee;
              5'h0f: pos_normal = 16'h24ef;
              5'h10: pos_normal = 16'h24f0;
              5'h11: pos_normal = 16'h24f1;
              5'h12: pos_normal = 16'h24f2;
              5'h13: pos_normal = 16'h24f3;
              5'h14: pos_normal = 16'h24f4;
              5'h15: pos_normal = 16'h24f5;
              5'h16: pos_normal = 16'h24f6;
              5'h17: pos_normal = 16'h24f7;
              5'h18: pos_normal = 16'h24f8;
              5'h19: pos_normal = 16'h24f9;
              5'h1a: pos_normal = 16'h24fa;
              5'h1b: pos_normal = 16'h24fb;
              5'h1c: pos_normal = 16'h24fc;
              5'h1d: pos_normal = 16'h24fd;
              5'h1e: pos_normal = 16'h24fe;
              5'h1f: pos_normal = 16'h24ff;
              default: begin end
            endcase
          end
          5'h08: begin
            pos_normal = 16'h2500;
            case (mant[4:0])
              5'h01: pos_normal = 16'h2501;
              5'h02: pos_normal = 16'h2502;
              5'h03: pos_normal = 16'h2503;
              5'h04: pos_normal = 16'h2504;
              5'h05: pos_normal = 16'h2505;
              5'h06: pos_normal = 16'h2506;
              5'h07: pos_normal = 16'h2507;
              5'h08: pos_normal = 16'h2508;
              5'h09: pos_normal = 16'h2509;
              5'h0a: pos_normal = 16'h250a;
              5'h0b: pos_normal = 16'h250b;
              5'h0c: pos_normal = 16'h250c;
              5'h0d: pos_normal = 16'h250d;
              5'h0e: pos_normal = 16'h250e;
              5'h0f: pos_normal = 16'h250f;
              5'h10: pos_normal = 16'h2510;
              5'h11: pos_normal = 16'h2511;
              5'h12: pos_normal = 16'h2512;
              5'h13: pos_normal = 16'h2513;
              5'h14: pos_normal = 16'h2514;
              5'h15: pos_normal = 16'h2515;
              5'h16: pos_normal = 16'h2516;
              5'h17: pos_normal = 16'h2517;
              5'h18: pos_normal = 16'h2518;
              5'h19: pos_normal = 16'h2519;
              5'h1a: pos_normal = 16'h251a;
              5'h1b: pos_normal = 16'h251b;
              5'h1c: pos_normal = 16'h251c;
              5'h1d: pos_normal = 16'h251d;
              5'h1e: pos_normal = 16'h251e;
              5'h1f: pos_normal = 16'h251f;
              default: begin end
            endcase
          end
          5'h09: begin
            pos_normal = 16'h2520;
            case (mant[4:0])
              5'h01: pos_normal = 16'h2521;
              5'h02: pos_normal = 16'h2522;
              5'h03: pos_normal = 16'h2523;
              5'h04: pos_normal = 16'h2524;
              5'h05: pos_normal = 16'h2525;
              5'h06: pos_normal = 16'h2526;
              5'h07: pos_normal = 16'h2527;
              5'h08: pos_normal = 16'h2528;
              5'h09: pos_normal = 16'h2529;
              5'h0a: pos_normal = 16'h252a;
              5'h0b: pos_normal = 16'h252b;
              5'h0c: pos_normal = 16'h252c;
              5'h0d: pos_normal = 16'h252d;
              5'h0e: pos_normal = 16'h252e;
              5'h0f: pos_normal = 16'h252f;
              5'h10: pos_normal = 16'h2530;
              5'h11: pos_normal = 16'h2531;
              5'h12: pos_normal = 16'h2532;
              5'h13: pos_normal = 16'h2533;
              5'h14: pos_normal = 16'h2534;
              5'h15: pos_normal = 16'h2535;
              5'h16: pos_normal = 16'h2536;
              5'h17: pos_normal = 16'h2537;
              5'h18: pos_normal = 16'h2538;
              5'h19: pos_normal = 16'h2539;
              5'h1a: pos_normal = 16'h253a;
              5'h1b: pos_normal = 16'h253b;
              5'h1c: pos_normal = 16'h253c;
              5'h1d: pos_normal = 16'h253d;
              5'h1e: pos_normal = 16'h253e;
              5'h1f: pos_normal = 16'h253f;
              default: begin end
            endcase
          end
          5'h0a: begin
            pos_normal = 16'h2540;
            case (mant[4:0])
              5'h01: pos_normal = 16'h2541;
              5'h02: pos_normal = 16'h2542;
              5'h03: pos_normal = 16'h2543;
              5'h04: pos_normal = 16'h2544;
              5'h05: pos_normal = 16'h2545;
              5'h06: pos_normal = 16'h2546;
              5'h07: pos_normal = 16'h2547;
              5'h08: pos_normal = 16'h2548;
              5'h09: pos_normal = 16'h2549;
              5'h0a: pos_normal = 16'h254a;
              5'h0b: pos_normal = 16'h254b;
              5'h0c: pos_normal = 16'h254c;
              5'h0d: pos_normal = 16'h254d;
              5'h0e: pos_normal = 16'h254e;
              5'h0f: pos_normal = 16'h254f;
              5'h10: pos_normal = 16'h2550;
              5'h11: pos_normal = 16'h2551;
              5'h12: pos_normal = 16'h2552;
              5'h13: pos_normal = 16'h2553;
              5'h14: pos_normal = 16'h2554;
              5'h15: pos_normal = 16'h2555;
              5'h16: pos_normal = 16'h2556;
              5'h17: pos_normal = 16'h2557;
              5'h18: pos_normal = 16'h2558;
              5'h19: pos_normal = 16'h2559;
              5'h1a: pos_normal = 16'h255a;
              5'h1b: pos_normal = 16'h255b;
              5'h1c: pos_normal = 16'h255c;
              5'h1d: pos_normal = 16'h255d;
              5'h1e: pos_normal = 16'h255e;
              5'h1f: pos_normal = 16'h255f;
              default: begin end
            endcase
          end
          5'h0b: begin
            pos_normal = 16'h2560;
            case (mant[4:0])
              5'h01: pos_normal = 16'h2561;
              5'h02: pos_normal = 16'h2562;
              5'h03: pos_normal = 16'h2563;
              5'h04: pos_normal = 16'h2564;
              5'h05: pos_normal = 16'h2565;
              5'h06: pos_normal = 16'h2566;
              5'h07: pos_normal = 16'h2567;
              5'h08: pos_normal = 16'h2568;
              5'h09: pos_normal = 16'h2569;
              5'h0a: pos_normal = 16'h256a;
              5'h0b: pos_normal = 16'h256b;
              5'h0c: pos_normal = 16'h256c;
              5'h0d: pos_normal = 16'h256d;
              5'h0e: pos_normal = 16'h256e;
              5'h0f: pos_normal = 16'h256f;
              5'h10: pos_normal = 16'h2570;
              5'h11: pos_normal = 16'h2571;
              5'h12: pos_normal = 16'h2572;
              5'h13: pos_normal = 16'h2573;
              5'h14: pos_normal = 16'h2574;
              5'h15: pos_normal = 16'h2575;
              5'h16: pos_normal = 16'h2576;
              5'h17: pos_normal = 16'h2577;
              5'h18: pos_normal = 16'h2578;
              5'h19: pos_normal = 16'h2579;
              5'h1a: pos_normal = 16'h257a;
              5'h1b: pos_normal = 16'h257b;
              5'h1c: pos_normal = 16'h257c;
              5'h1d: pos_normal = 16'h257d;
              5'h1e: pos_normal = 16'h257e;
              5'h1f: pos_normal = 16'h257f;
              default: begin end
            endcase
          end
          5'h0c: begin
            pos_normal = 16'h2580;
            case (mant[4:0])
              5'h01: pos_normal = 16'h2581;
              5'h02: pos_normal = 16'h2582;
              5'h03: pos_normal = 16'h2583;
              5'h04: pos_normal = 16'h2584;
              5'h05: pos_normal = 16'h2585;
              5'h06: pos_normal = 16'h2586;
              5'h07: pos_normal = 16'h2587;
              5'h08: pos_normal = 16'h2588;
              5'h09: pos_normal = 16'h2589;
              5'h0a: pos_normal = 16'h258a;
              5'h0b: pos_normal = 16'h258b;
              5'h0c: pos_normal = 16'h258c;
              5'h0d: pos_normal = 16'h258d;
              5'h0e: pos_normal = 16'h258e;
              5'h0f: pos_normal = 16'h258f;
              5'h10: pos_normal = 16'h2590;
              5'h11: pos_normal = 16'h2591;
              5'h12: pos_normal = 16'h2592;
              5'h13: pos_normal = 16'h2593;
              5'h14: pos_normal = 16'h2594;
              5'h15: pos_normal = 16'h2595;
              5'h16: pos_normal = 16'h2596;
              5'h17: pos_normal = 16'h2597;
              5'h18: pos_normal = 16'h2598;
              5'h19: pos_normal = 16'h2599;
              5'h1a: pos_normal = 16'h259a;
              5'h1b: pos_normal = 16'h259b;
              5'h1c: pos_normal = 16'h259c;
              5'h1d: pos_normal = 16'h259d;
              5'h1e: pos_normal = 16'h259e;
              5'h1f: pos_normal = 16'h259f;
              default: begin end
            endcase
          end
          5'h0d: begin
            pos_normal = 16'h25a0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h25a1;
              5'h02: pos_normal = 16'h25a2;
              5'h03: pos_normal = 16'h25a3;
              5'h04: pos_normal = 16'h25a4;
              5'h05: pos_normal = 16'h25a5;
              5'h06: pos_normal = 16'h25a6;
              5'h07: pos_normal = 16'h25a7;
              5'h08: pos_normal = 16'h25a8;
              5'h09: pos_normal = 16'h25a9;
              5'h0a: pos_normal = 16'h25aa;
              5'h0b: pos_normal = 16'h25ab;
              5'h0c: pos_normal = 16'h25ac;
              5'h0d: pos_normal = 16'h25ad;
              5'h0e: pos_normal = 16'h25ae;
              5'h0f: pos_normal = 16'h25af;
              5'h10: pos_normal = 16'h25b0;
              5'h11: pos_normal = 16'h25b1;
              5'h12: pos_normal = 16'h25b2;
              5'h13: pos_normal = 16'h25b3;
              5'h14: pos_normal = 16'h25b4;
              5'h15: pos_normal = 16'h25b5;
              5'h16: pos_normal = 16'h25b6;
              5'h17: pos_normal = 16'h25b7;
              5'h18: pos_normal = 16'h25b8;
              5'h19: pos_normal = 16'h25b9;
              5'h1a: pos_normal = 16'h25ba;
              5'h1b: pos_normal = 16'h25bb;
              5'h1c: pos_normal = 16'h25bc;
              5'h1d: pos_normal = 16'h25bd;
              5'h1e: pos_normal = 16'h25be;
              5'h1f: pos_normal = 16'h25bf;
              default: begin end
            endcase
          end
          5'h0e: begin
            pos_normal = 16'h25c0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h25c1;
              5'h02: pos_normal = 16'h25c2;
              5'h03: pos_normal = 16'h25c3;
              5'h04: pos_normal = 16'h25c4;
              5'h05: pos_normal = 16'h25c5;
              5'h06: pos_normal = 16'h25c6;
              5'h07: pos_normal = 16'h25c7;
              5'h08: pos_normal = 16'h25c8;
              5'h09: pos_normal = 16'h25c9;
              5'h0a: pos_normal = 16'h25ca;
              5'h0b: pos_normal = 16'h25cb;
              5'h0c: pos_normal = 16'h25cc;
              5'h0d: pos_normal = 16'h25cd;
              5'h0e: pos_normal = 16'h25ce;
              5'h0f: pos_normal = 16'h25cf;
              5'h10: pos_normal = 16'h25d0;
              5'h11: pos_normal = 16'h25d1;
              5'h12: pos_normal = 16'h25d2;
              5'h13: pos_normal = 16'h25d3;
              5'h14: pos_normal = 16'h25d4;
              5'h15: pos_normal = 16'h25d5;
              5'h16: pos_normal = 16'h25d6;
              5'h17: pos_normal = 16'h25d7;
              5'h18: pos_normal = 16'h25d8;
              5'h19: pos_normal = 16'h25d9;
              5'h1a: pos_normal = 16'h25da;
              5'h1b: pos_normal = 16'h25db;
              5'h1c: pos_normal = 16'h25dc;
              5'h1d: pos_normal = 16'h25dd;
              5'h1e: pos_normal = 16'h25de;
              5'h1f: pos_normal = 16'h25df;
              default: begin end
            endcase
          end
          5'h0f: begin
            pos_normal = 16'h25e0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h25e1;
              5'h02: pos_normal = 16'h25e2;
              5'h03: pos_normal = 16'h25e3;
              5'h04: pos_normal = 16'h25e4;
              5'h05: pos_normal = 16'h25e5;
              5'h06: pos_normal = 16'h25e6;
              5'h07: pos_normal = 16'h25e7;
              5'h08: pos_normal = 16'h25e8;
              5'h09: pos_normal = 16'h25e9;
              5'h0a: pos_normal = 16'h25ea;
              5'h0b: pos_normal = 16'h25eb;
              5'h0c: pos_normal = 16'h25ec;
              5'h0d: pos_normal = 16'h25ed;
              5'h0e: pos_normal = 16'h25ee;
              5'h0f: pos_normal = 16'h25ef;
              5'h10: pos_normal = 16'h25f0;
              5'h11: pos_normal = 16'h25f1;
              5'h12: pos_normal = 16'h25f2;
              5'h13: pos_normal = 16'h25f3;
              5'h14: pos_normal = 16'h25f4;
              5'h15: pos_normal = 16'h25f5;
              5'h16: pos_normal = 16'h25f6;
              5'h17: pos_normal = 16'h25f7;
              5'h18: pos_normal = 16'h25f8;
              5'h19: pos_normal = 16'h25f9;
              5'h1a: pos_normal = 16'h25fa;
              5'h1b: pos_normal = 16'h25fb;
              5'h1c: pos_normal = 16'h25fc;
              5'h1d: pos_normal = 16'h25fd;
              5'h1e: pos_normal = 16'h25fe;
              5'h1f: pos_normal = 16'h25ff;
              default: begin end
            endcase
          end
          5'h10: begin
            pos_normal = 16'h2600;
            case (mant[4:0])
              5'h01: pos_normal = 16'h2601;
              5'h02: pos_normal = 16'h2602;
              5'h03: pos_normal = 16'h2603;
              5'h04: pos_normal = 16'h2604;
              5'h05: pos_normal = 16'h2605;
              5'h06: pos_normal = 16'h2606;
              5'h07: pos_normal = 16'h2607;
              5'h08: pos_normal = 16'h2608;
              5'h09: pos_normal = 16'h2609;
              5'h0a: pos_normal = 16'h260a;
              5'h0b: pos_normal = 16'h260b;
              5'h0c: pos_normal = 16'h260c;
              5'h0d: pos_normal = 16'h260d;
              5'h0e: pos_normal = 16'h260e;
              5'h0f: pos_normal = 16'h260f;
              5'h10: pos_normal = 16'h2610;
              5'h11: pos_normal = 16'h2611;
              5'h12: pos_normal = 16'h2612;
              5'h13: pos_normal = 16'h2613;
              5'h14: pos_normal = 16'h2614;
              5'h15: pos_normal = 16'h2615;
              5'h16: pos_normal = 16'h2616;
              5'h17: pos_normal = 16'h2617;
              5'h18: pos_normal = 16'h2618;
              5'h19: pos_normal = 16'h2619;
              5'h1a: pos_normal = 16'h261a;
              5'h1b: pos_normal = 16'h261b;
              5'h1c: pos_normal = 16'h261c;
              5'h1d: pos_normal = 16'h261d;
              5'h1e: pos_normal = 16'h261e;
              5'h1f: pos_normal = 16'h261f;
              default: begin end
            endcase
          end
          5'h11: begin
            pos_normal = 16'h2620;
            case (mant[4:0])
              5'h01: pos_normal = 16'h2621;
              5'h02: pos_normal = 16'h2622;
              5'h03: pos_normal = 16'h2623;
              5'h04: pos_normal = 16'h2624;
              5'h05: pos_normal = 16'h2625;
              5'h06: pos_normal = 16'h2626;
              5'h07: pos_normal = 16'h2627;
              5'h08: pos_normal = 16'h2628;
              5'h09: pos_normal = 16'h2629;
              5'h0a: pos_normal = 16'h262a;
              5'h0b: pos_normal = 16'h262b;
              5'h0c: pos_normal = 16'h262c;
              5'h0d: pos_normal = 16'h262d;
              5'h0e: pos_normal = 16'h262e;
              5'h0f: pos_normal = 16'h262f;
              5'h10: pos_normal = 16'h2630;
              5'h11: pos_normal = 16'h2631;
              5'h12: pos_normal = 16'h2632;
              5'h13: pos_normal = 16'h2633;
              5'h14: pos_normal = 16'h2634;
              5'h15: pos_normal = 16'h2635;
              5'h16: pos_normal = 16'h2636;
              5'h17: pos_normal = 16'h2637;
              5'h18: pos_normal = 16'h2638;
              5'h19: pos_normal = 16'h2639;
              5'h1a: pos_normal = 16'h263a;
              5'h1b: pos_normal = 16'h263b;
              5'h1c: pos_normal = 16'h263c;
              5'h1d: pos_normal = 16'h263d;
              5'h1e: pos_normal = 16'h263e;
              5'h1f: pos_normal = 16'h263f;
              default: begin end
            endcase
          end
          5'h12: begin
            pos_normal = 16'h2640;
            case (mant[4:0])
              5'h01: pos_normal = 16'h2641;
              5'h02: pos_normal = 16'h2642;
              5'h03: pos_normal = 16'h2643;
              5'h04: pos_normal = 16'h2644;
              5'h05: pos_normal = 16'h2645;
              5'h06: pos_normal = 16'h2646;
              5'h07: pos_normal = 16'h2647;
              5'h08: pos_normal = 16'h2648;
              5'h09: pos_normal = 16'h2649;
              5'h0a: pos_normal = 16'h264a;
              5'h0b: pos_normal = 16'h264b;
              5'h0c: pos_normal = 16'h264c;
              5'h0d: pos_normal = 16'h264d;
              5'h0e: pos_normal = 16'h264e;
              5'h0f: pos_normal = 16'h264f;
              5'h10: pos_normal = 16'h2650;
              5'h11: pos_normal = 16'h2651;
              5'h12: pos_normal = 16'h2652;
              5'h13: pos_normal = 16'h2653;
              5'h14: pos_normal = 16'h2654;
              5'h15: pos_normal = 16'h2655;
              5'h16: pos_normal = 16'h2656;
              5'h17: pos_normal = 16'h2657;
              5'h18: pos_normal = 16'h2658;
              5'h19: pos_normal = 16'h2659;
              5'h1a: pos_normal = 16'h265a;
              5'h1b: pos_normal = 16'h265b;
              5'h1c: pos_normal = 16'h265c;
              5'h1d: pos_normal = 16'h265d;
              5'h1e: pos_normal = 16'h265e;
              5'h1f: pos_normal = 16'h265f;
              default: begin end
            endcase
          end
          5'h13: begin
            pos_normal = 16'h2660;
            case (mant[4:0])
              5'h01: pos_normal = 16'h2661;
              5'h02: pos_normal = 16'h2662;
              5'h03: pos_normal = 16'h2663;
              5'h04: pos_normal = 16'h2664;
              5'h05: pos_normal = 16'h2665;
              5'h06: pos_normal = 16'h2666;
              5'h07: pos_normal = 16'h2667;
              5'h08: pos_normal = 16'h2668;
              5'h09: pos_normal = 16'h2669;
              5'h0a: pos_normal = 16'h266a;
              5'h0b: pos_normal = 16'h266b;
              5'h0c: pos_normal = 16'h266c;
              5'h0d: pos_normal = 16'h266d;
              5'h0e: pos_normal = 16'h266e;
              5'h0f: pos_normal = 16'h266f;
              5'h10: pos_normal = 16'h2670;
              5'h11: pos_normal = 16'h2671;
              5'h12: pos_normal = 16'h2672;
              5'h13: pos_normal = 16'h2673;
              5'h14: pos_normal = 16'h2674;
              5'h15: pos_normal = 16'h2675;
              5'h16: pos_normal = 16'h2676;
              5'h17: pos_normal = 16'h2677;
              5'h18: pos_normal = 16'h2678;
              5'h19: pos_normal = 16'h2679;
              5'h1a: pos_normal = 16'h267a;
              5'h1b: pos_normal = 16'h267b;
              5'h1c: pos_normal = 16'h267c;
              5'h1d: pos_normal = 16'h267d;
              5'h1e: pos_normal = 16'h267e;
              5'h1f: pos_normal = 16'h267f;
              default: begin end
            endcase
          end
          5'h14: begin
            pos_normal = 16'h2680;
            case (mant[4:0])
              5'h01: pos_normal = 16'h2681;
              5'h02: pos_normal = 16'h2682;
              5'h03: pos_normal = 16'h2683;
              5'h04: pos_normal = 16'h2684;
              5'h05: pos_normal = 16'h2685;
              5'h06: pos_normal = 16'h2686;
              5'h07: pos_normal = 16'h2687;
              5'h08: pos_normal = 16'h2688;
              5'h09: pos_normal = 16'h2689;
              5'h0a: pos_normal = 16'h268a;
              5'h0b: pos_normal = 16'h268b;
              5'h0c: pos_normal = 16'h268c;
              5'h0d: pos_normal = 16'h268d;
              5'h0e: pos_normal = 16'h268e;
              5'h0f: pos_normal = 16'h268f;
              5'h10: pos_normal = 16'h2690;
              5'h11: pos_normal = 16'h2691;
              5'h12: pos_normal = 16'h2692;
              5'h13: pos_normal = 16'h2693;
              5'h14: pos_normal = 16'h2694;
              5'h15: pos_normal = 16'h2695;
              5'h16: pos_normal = 16'h2696;
              5'h17: pos_normal = 16'h2697;
              5'h18: pos_normal = 16'h2698;
              5'h19: pos_normal = 16'h2699;
              5'h1a: pos_normal = 16'h269a;
              5'h1b: pos_normal = 16'h269b;
              5'h1c: pos_normal = 16'h269c;
              5'h1d: pos_normal = 16'h269d;
              5'h1e: pos_normal = 16'h269e;
              5'h1f: pos_normal = 16'h269f;
              default: begin end
            endcase
          end
          5'h15: begin
            pos_normal = 16'h26a0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h26a1;
              5'h02: pos_normal = 16'h26a2;
              5'h03: pos_normal = 16'h26a3;
              5'h04: pos_normal = 16'h26a4;
              5'h05: pos_normal = 16'h26a5;
              5'h06: pos_normal = 16'h26a6;
              5'h07: pos_normal = 16'h26a7;
              5'h08: pos_normal = 16'h26a8;
              5'h09: pos_normal = 16'h26a9;
              5'h0a: pos_normal = 16'h26aa;
              5'h0b: pos_normal = 16'h26ab;
              5'h0c: pos_normal = 16'h26ac;
              5'h0d: pos_normal = 16'h26ad;
              5'h0e: pos_normal = 16'h26ae;
              5'h0f: pos_normal = 16'h26af;
              5'h10: pos_normal = 16'h26b0;
              5'h11: pos_normal = 16'h26b1;
              5'h12: pos_normal = 16'h26b2;
              5'h13: pos_normal = 16'h26b3;
              5'h14: pos_normal = 16'h26b4;
              5'h15: pos_normal = 16'h26b5;
              5'h16: pos_normal = 16'h26b6;
              5'h17: pos_normal = 16'h26b7;
              5'h18: pos_normal = 16'h26b8;
              5'h19: pos_normal = 16'h26b9;
              5'h1a: pos_normal = 16'h26ba;
              5'h1b: pos_normal = 16'h26bb;
              5'h1c: pos_normal = 16'h26bc;
              5'h1d: pos_normal = 16'h26bd;
              5'h1e: pos_normal = 16'h26be;
              5'h1f: pos_normal = 16'h26bf;
              default: begin end
            endcase
          end
          5'h16: begin
            pos_normal = 16'h26c0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h26c1;
              5'h02: pos_normal = 16'h26c2;
              5'h03: pos_normal = 16'h26c3;
              5'h04: pos_normal = 16'h26c4;
              5'h05: pos_normal = 16'h26c5;
              5'h06: pos_normal = 16'h26c6;
              5'h07: pos_normal = 16'h26c7;
              5'h08: pos_normal = 16'h26c8;
              5'h09: pos_normal = 16'h26c9;
              5'h0a: pos_normal = 16'h26ca;
              5'h0b: pos_normal = 16'h26cb;
              5'h0c: pos_normal = 16'h26cc;
              5'h0d: pos_normal = 16'h26cd;
              5'h0e: pos_normal = 16'h26ce;
              5'h0f: pos_normal = 16'h26cf;
              5'h10: pos_normal = 16'h26d0;
              5'h11: pos_normal = 16'h26d1;
              5'h12: pos_normal = 16'h26d2;
              5'h13: pos_normal = 16'h26d3;
              5'h14: pos_normal = 16'h26d4;
              5'h15: pos_normal = 16'h26d5;
              5'h16: pos_normal = 16'h26d6;
              5'h17: pos_normal = 16'h26d7;
              5'h18: pos_normal = 16'h26d8;
              5'h19: pos_normal = 16'h26d9;
              5'h1a: pos_normal = 16'h26da;
              5'h1b: pos_normal = 16'h26db;
              5'h1c: pos_normal = 16'h26dc;
              5'h1d: pos_normal = 16'h26dd;
              5'h1e: pos_normal = 16'h26de;
              5'h1f: pos_normal = 16'h26df;
              default: begin end
            endcase
          end
          5'h17: begin
            pos_normal = 16'h26e0;
            case (mant[4:0])
              5'h01: pos_normal = 16'h26e1;
              5'h02: pos_normal = 16'h26e2;
              5'h03: pos_normal = 16'h26e3;
              5'h04: pos_normal = 16'h26e4;
              5'h05: pos_normal = 16'h26e5;
              5'h06: pos_normal = 16'h26e6;
              5'h07: pos_normal = 16'h26e7;
              5'h08: pos_normal = 16'h26e8;
              5'h09: pos_normal = 16'h26e9;
              5'h0a: pos_normal = 16'h26ea;
              5'h0b: pos_normal = 16'h26eb;
              5'h0c: pos_normal = 16'h26ec;
              5'h0d: pos_normal = 16'h26ed;
              5'h0e: pos_normal = 16'h26ee;
              5'h0f: pos_normal = 16'h26ef;
              5'h10: pos_normal = 16'h26f0;
              5'h11: pos_normal = 16'h26f1;
              5'h12: pos_normal = 16'h26f2;
              5'h13: pos_normal = 16'h26f3;
              5'h14: pos_normal = 16'h26f4;
              5'h15: pos_normal = 16'h26f5;
              5'h16: pos_normal = 16'h26f6;
              5'h17: pos_normal = 16'h26f7;
              5'h18: pos_normal = 16'h26f8;
              5'h19: pos_normal = 16'h26f9;
              5'h1a: pos_normal = 16'h26fa;
              5'h1b: pos_normal = 16'h26fb;
              5'h1c: pos_normal = 16'h26fc;
              5'h1d: pos_normal = 16'h26fd;
              5'h1e: pos_normal = 16'h26fe;
              5'h1f: pos_normal = 16'h26ff;
              default: begin end
            endcase
          end
          5'h18: begin
            pos_normal = 16'h2700;
            case (mant[4:0])
              5'h01: pos_normal = 16'h2701;
              5'h02: pos_normal = 16'h2702;
              5'h03: pos_normal = 16'h2703;
              5'h04: pos_normal = 16'h2704;
              5'h05: pos_normal = 16'h2705;
              5'h06: pos_normal = 16'h2706;
              5'h07: pos_normal = 16'h2707;
              5'h08: pos_normal = 16'h2708;
              5'h09: pos_normal = 16'h2709;
              5'h0a: pos_normal = 16'h270a;
              5'h0b: pos_normal = 16'h270b;
              5'h0c: pos_normal = 16'h270c;
              5'h0d: pos_normal = 16'h270d;
              5'h0e: pos_normal = 16'h270e;
              5'h0f: pos_normal = 16'h270f;
              5'h10: pos_normal = 16'h2710;
              5'h11: pos_normal = 16'h2711;
              5'h12: pos_normal = 16'h2712;
              5'h13: pos_normal = 16'h2713;
              5'h14: pos_normal = 16'h2714;
              5'h15: pos_normal = 16'h2715;
              5'h16: pos_normal = 16'h2716;
              5'h17: pos_normal = 16'h2717;
              5'h18: pos_normal = 16'h2718;
              5'h19: pos_normal = 16'h2719;
              5'h1a: pos_normal = 16'h271a;
              5'h1b: pos_normal = 16'h271b;
              5'h1c: pos_normal = 16'h271c;
              5'h1d: pos_normal = 16'h271d;
              5'h1e: pos_normal = 16'h271e;
              5'h1f: pos_normal = 16'h271f;
              default: begin end
            endcase
          end
          5'h19: begin
            pos_normal = 16'h2720;
            case (mant[4:0])
              5'h01: pos_normal = 16'h2721;
              5'h02: pos_normal = 16'h2722;
              5'h03: pos_normal = 16'h2723;
              5'h04: pos_normal = 16'h2724;
              5'h05: pos_normal = 16'h2725;
              5'h06: pos_normal = 16'h2726;
              5'h07: pos_normal = 16'h2727;
              5'h08: pos_normal = 16'h2728;
              5'h09: pos_normal = 16'h2729;
              5'h0a: pos_normal = 16'h272a;
              5'h0b: pos_normal = 16'h272b;
              5'h0c: pos_normal = 16'h272c;
              5'h0d: pos_normal = 16'h272d;
              5'h0e: pos_normal = 16'h272e;
              5'h0f: pos_normal = 16'h272f;
              5'h10: pos_normal = 16'h2730;
              5'h11: pos_normal = 16'h2731;
              5'h12: pos_normal = 16'h2732;
              5'h13: pos_normal = 16'h2733;
              5'h14: pos_normal = 16'h2734;
              5'h15: pos_normal = 16'h2735;
              5'h16: pos_normal = 16'h2736;
              5'h17: pos_normal = 16'h2737;
              5'h18: pos_normal = 16'h2738;
              5'h19: pos_normal = 16'h2739;
              5'h1a: pos_normal = 16'h273a;
              5'h1b: pos_normal = 16'h273b;
              5'h1c: pos_normal = 16'h273c;
              5'h1d: pos_normal = 16'h273d;
              5'h1e: pos_normal = 16'h273e;
              5'h1f: pos_normal = 16'h273f;
              default: begin end
            endcase
          end
          5'h1a: begin
            pos_normal = 16'h2744;
            case (mant[4:0])
              5'h00: pos_normal = 16'h2740;
              5'h01: pos_normal = 16'h2741;
              5'h02: pos_normal = 16'h2742;
              5'h03: pos_normal = 16'h2743;
              5'h06: pos_normal = 16'h2745;
              5'h07: pos_normal = 16'h2746;
              5'h08: pos_normal = 16'h2747;
              5'h09: pos_normal = 16'h2748;
              5'h0a: pos_normal = 16'h2749;
              5'h0b: pos_normal = 16'h274a;
              5'h0c: pos_normal = 16'h274b;
              5'h0d: pos_normal = 16'h274c;
              5'h0e: pos_normal = 16'h274d;
              5'h0f: pos_normal = 16'h274e;
              5'h10: pos_normal = 16'h274f;
              5'h11: pos_normal = 16'h2750;
              5'h12: pos_normal = 16'h2751;
              5'h13: pos_normal = 16'h2752;
              5'h14: pos_normal = 16'h2753;
              5'h15: pos_normal = 16'h2754;
              5'h16: pos_normal = 16'h2755;
              5'h17: pos_normal = 16'h2756;
              5'h18: pos_normal = 16'h2757;
              5'h19: pos_normal = 16'h2758;
              5'h1a: pos_normal = 16'h2759;
              5'h1b: pos_normal = 16'h275a;
              5'h1c: pos_normal = 16'h275b;
              5'h1d: pos_normal = 16'h275c;
              5'h1e: pos_normal = 16'h275d;
              5'h1f: pos_normal = 16'h275e;
              default: begin end
            endcase
          end
          5'h1b: begin
            pos_normal = 16'h275f;
            case (mant[4:0])
              5'h01: pos_normal = 16'h2760;
              5'h02: pos_normal = 16'h2761;
              5'h03: pos_normal = 16'h2762;
              5'h04: pos_normal = 16'h2763;
              5'h05: pos_normal = 16'h2764;
              5'h06: pos_normal = 16'h2765;
              5'h07: pos_normal = 16'h2766;
              5'h08: pos_normal = 16'h2767;
              5'h09: pos_normal = 16'h2768;
              5'h0a: pos_normal = 16'h2769;
              5'h0b: pos_normal = 16'h276a;
              5'h0c: pos_normal = 16'h276b;
              5'h0d: pos_normal = 16'h276c;
              5'h0e: pos_normal = 16'h276d;
              5'h0f: pos_normal = 16'h276e;
              5'h10: pos_normal = 16'h276f;
              5'h11: pos_normal = 16'h2770;
              5'h12: pos_normal = 16'h2771;
              5'h13: pos_normal = 16'h2772;
              5'h14: pos_normal = 16'h2773;
              5'h15: pos_normal = 16'h2774;
              5'h16: pos_normal = 16'h2775;
              5'h17: pos_normal = 16'h2776;
              5'h18: pos_normal = 16'h2777;
              5'h19: pos_normal = 16'h2778;
              5'h1a: pos_normal = 16'h2779;
              5'h1b: pos_normal = 16'h277a;
              5'h1c: pos_normal = 16'h277b;
              5'h1d: pos_normal = 16'h277c;
              5'h1e: pos_normal = 16'h277d;
              5'h1f: pos_normal = 16'h277e;
              default: begin end
            endcase
          end
          5'h1c: begin
            pos_normal = 16'h277f;
            case (mant[4:0])
              5'h01: pos_normal = 16'h2780;
              5'h02: pos_normal = 16'h2781;
              5'h03: pos_normal = 16'h2782;
              5'h04: pos_normal = 16'h2783;
              5'h05: pos_normal = 16'h2784;
              5'h06: pos_normal = 16'h2785;
              5'h07: pos_normal = 16'h2786;
              5'h08: pos_normal = 16'h2787;
              5'h09: pos_normal = 16'h2788;
              5'h0a: pos_normal = 16'h2789;
              5'h0b: pos_normal = 16'h278a;
              5'h0c: pos_normal = 16'h278b;
              5'h0d: pos_normal = 16'h278c;
              5'h0e: pos_normal = 16'h278d;
              5'h0f: pos_normal = 16'h278e;
              5'h10: pos_normal = 16'h278f;
              5'h11: pos_normal = 16'h2790;
              5'h12: pos_normal = 16'h2791;
              5'h13: pos_normal = 16'h2792;
              5'h14: pos_normal = 16'h2793;
              5'h15: pos_normal = 16'h2794;
              5'h16: pos_normal = 16'h2795;
              5'h17: pos_normal = 16'h2796;
              5'h18: pos_normal = 16'h2797;
              5'h19: pos_normal = 16'h2798;
              5'h1a: pos_normal = 16'h2799;
              5'h1b: pos_normal = 16'h279a;
              5'h1c: pos_normal = 16'h279b;
              5'h1d: pos_normal = 16'h279c;
              5'h1e: pos_normal = 16'h279d;
              5'h1f: pos_normal = 16'h279e;
              default: begin end
            endcase
          end
          5'h1d: begin
            pos_normal = 16'h279f;
            case (mant[4:0])
              5'h01: pos_normal = 16'h27a0;
              5'h02: pos_normal = 16'h27a1;
              5'h03: pos_normal = 16'h27a2;
              5'h04: pos_normal = 16'h27a3;
              5'h05: pos_normal = 16'h27a4;
              5'h06: pos_normal = 16'h27a5;
              5'h07: pos_normal = 16'h27a6;
              5'h08: pos_normal = 16'h27a7;
              5'h09: pos_normal = 16'h27a8;
              5'h0a: pos_normal = 16'h27a9;
              5'h0b: pos_normal = 16'h27aa;
              5'h0c: pos_normal = 16'h27ab;
              5'h0d: pos_normal = 16'h27ac;
              5'h0e: pos_normal = 16'h27ad;
              5'h0f: pos_normal = 16'h27ae;
              5'h10: pos_normal = 16'h27af;
              5'h11: pos_normal = 16'h27b0;
              5'h12: pos_normal = 16'h27b1;
              5'h13: pos_normal = 16'h27b2;
              5'h14: pos_normal = 16'h27b3;
              5'h15: pos_normal = 16'h27b4;
              5'h16: pos_normal = 16'h27b5;
              5'h17: pos_normal = 16'h27b6;
              5'h18: pos_normal = 16'h27b7;
              5'h19: pos_normal = 16'h27b8;
              5'h1a: pos_normal = 16'h27b9;
              5'h1b: pos_normal = 16'h27ba;
              5'h1c: pos_normal = 16'h27bb;
              5'h1d: pos_normal = 16'h27bc;
              5'h1e: pos_normal = 16'h27bd;
              5'h1f: pos_normal = 16'h27be;
              default: begin end
            endcase
          end
          5'h1e: begin
            pos_normal = 16'h27bf;
            case (mant[4:0])
              5'h01: pos_normal = 16'h27c0;
              5'h02: pos_normal = 16'h27c1;
              5'h03: pos_normal = 16'h27c2;
              5'h04: pos_normal = 16'h27c3;
              5'h05: pos_normal = 16'h27c4;
              5'h06: pos_normal = 16'h27c5;
              5'h07: pos_normal = 16'h27c6;
              5'h08: pos_normal = 16'h27c7;
              5'h09: pos_normal = 16'h27c8;
              5'h0a: pos_normal = 16'h27c9;
              5'h0b: pos_normal = 16'h27ca;
              5'h0c: pos_normal = 16'h27cb;
              5'h0d: pos_normal = 16'h27cc;
              5'h0e: pos_normal = 16'h27cd;
              5'h0f: pos_normal = 16'h27ce;
              5'h10: pos_normal = 16'h27cf;
              5'h11: pos_normal = 16'h27d0;
              5'h12: pos_normal = 16'h27d1;
              5'h13: pos_normal = 16'h27d2;
              5'h14: pos_normal = 16'h27d3;
              5'h15: pos_normal = 16'h27d4;
              5'h16: pos_normal = 16'h27d5;
              5'h17: pos_normal = 16'h27d6;
              5'h18: pos_normal = 16'h27d7;
              5'h19: pos_normal = 16'h27d8;
              5'h1a: pos_normal = 16'h27d9;
              5'h1b: pos_normal = 16'h27da;
              5'h1c: pos_normal = 16'h27db;
              5'h1d: pos_normal = 16'h27dc;
              5'h1e: pos_normal = 16'h27dd;
              5'h1f: pos_normal = 16'h27de;
              default: begin end
            endcase
          end
          5'h1f: begin
            pos_normal = 16'h27df;
            case (mant[4:0])
              5'h01: pos_normal = 16'h27e0;
              5'h02: pos_normal = 16'h27e1;
              5'h03: pos_normal = 16'h27e2;
              5'h04: pos_normal = 16'h27e3;
              5'h05: pos_normal = 16'h27e4;
              5'h06: pos_normal = 16'h27e5;
              5'h07: pos_normal = 16'h27e6;
              5'h08: pos_normal = 16'h27e7;
              5'h09: pos_normal = 16'h27e8;
              5'h0a: pos_normal = 16'h27e9;
              5'h0b: pos_normal = 16'h27ea;
              5'h0c: pos_normal = 16'h27eb;
              5'h0d: pos_normal = 16'h27ec;
              5'h0e: pos_normal = 16'h27ed;
              5'h0f: pos_normal = 16'h27ee;
              5'h10: pos_normal = 16'h27ef;
              5'h11: pos_normal = 16'h27f0;
              5'h12: pos_normal = 16'h27f1;
              5'h13: pos_normal = 16'h27f2;
              5'h14: pos_normal = 16'h27f3;
              5'h15: pos_normal = 16'h27f4;
              5'h16: pos_normal = 16'h27f5;
              5'h17: pos_normal = 16'h27f6;
              5'h18: pos_normal = 16'h27f7;
              5'h19: pos_normal = 16'h27f8;
              5'h1a: pos_normal = 16'h27f9;
              5'h1b: pos_normal = 16'h27fa;
              5'h1c: pos_normal = 16'h27fb;
              5'h1d: pos_normal = 16'h27fc;
              5'h1e: pos_normal = 16'h27fd;
              5'h1f: pos_normal = 16'h27fe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      5'h0a: begin
        case (mant[9:5])
          5'h00: begin
            pos_normal = 16'h27ff;
            case (mant[4:0])
              5'h01: pos_normal = 16'h2801;
              5'h02: pos_normal = 16'h2802;
              5'h03: pos_normal = 16'h2803;
              5'h04: pos_normal = 16'h2804;
              5'h05: pos_normal = 16'h2805;
              5'h06: pos_normal = 16'h2806;
              5'h07: pos_normal = 16'h2807;
              5'h08: pos_normal = 16'h2808;
              5'h09: pos_normal = 16'h2809;
              5'h0a: pos_normal = 16'h280a;
              5'h0b: pos_normal = 16'h280b;
              5'h0c: pos_normal = 16'h280c;
              5'h0d: pos_normal = 16'h280d;
              5'h0e: pos_normal = 16'h280e;
              5'h0f: pos_normal = 16'h280f;
              5'h10: pos_normal = 16'h2810;
              5'h11: pos_normal = 16'h2811;
              5'h12: pos_normal = 16'h2812;
              5'h13: pos_normal = 16'h2813;
              5'h14: pos_normal = 16'h2814;
              5'h15: pos_normal = 16'h2815;
              5'h16: pos_normal = 16'h2816;
              5'h17: pos_normal = 16'h2817;
              5'h18: pos_normal = 16'h2818;
              5'h19: pos_normal = 16'h2819;
              5'h1a: pos_normal = 16'h281a;
              5'h1b: pos_normal = 16'h281b;
              5'h1c: pos_normal = 16'h281c;
              5'h1d: pos_normal = 16'h281d;
              5'h1e: pos_normal = 16'h281e;
              5'h1f: pos_normal = 16'h281f;
              default: begin end
            endcase
          end
          5'h01: begin
            pos_normal = 16'h2820;
            case (mant[4:0])
              5'h01: pos_normal = 16'h2821;
              5'h02: pos_normal = 16'h2822;
              5'h03: pos_normal = 16'h2823;
              5'h04: pos_normal = 16'h2824;
              5'h05: pos_normal = 16'h2825;
              5'h06: pos_normal = 16'h2826;
              5'h07: pos_normal = 16'h2827;
              5'h08: pos_normal = 16'h2828;
              5'h09: pos_normal = 16'h2829;
              5'h0a: pos_normal = 16'h282a;
              5'h0b: pos_normal = 16'h282b;
              5'h0c: pos_normal = 16'h282c;
              5'h0d: pos_normal = 16'h282d;
              5'h0e: pos_normal = 16'h282e;
              5'h0f: pos_normal = 16'h282f;
              5'h10: pos_normal = 16'h2830;
              5'h11: pos_normal = 16'h2831;
              5'h12: pos_normal = 16'h2832;
              5'h13: pos_normal = 16'h2833;
              5'h14: pos_normal = 16'h2834;
              5'h15: pos_normal = 16'h2835;
              5'h16: pos_normal = 16'h2836;
              5'h17: pos_normal = 16'h2837;
              5'h18: pos_normal = 16'h2838;
              5'h19: pos_normal = 16'h2839;
              5'h1a: pos_normal = 16'h283a;
              5'h1b: pos_normal = 16'h283b;
              5'h1c: pos_normal = 16'h283c;
              5'h1d: pos_normal = 16'h283d;
              5'h1e: pos_normal = 16'h283e;
              5'h1f: pos_normal = 16'h283f;
              default: begin end
            endcase
          end
          5'h02: begin
            pos_normal = 16'h2840;
            case (mant[4:0])
              5'h01: pos_normal = 16'h2841;
              5'h02: pos_normal = 16'h2842;
              5'h03: pos_normal = 16'h2843;
              5'h04: pos_normal = 16'h2844;
              5'h05: pos_normal = 16'h2845;
              5'h06: pos_normal = 16'h2846;
              5'h07: pos_normal = 16'h2847;
              5'h08: pos_normal = 16'h2848;
              5'h09: pos_normal = 16'h2849;
              5'h0a: pos_normal = 16'h284a;
              5'h0b: pos_normal = 16'h284b;
              5'h0c: pos_normal = 16'h284c;
              5'h0d: pos_normal = 16'h284d;
              5'h0e: pos_normal = 16'h284e;
              5'h0f: pos_normal = 16'h284f;
              5'h10: pos_normal = 16'h2850;
              5'h11: pos_normal = 16'h2851;
              5'h12: pos_normal = 16'h2852;
              5'h13: pos_normal = 16'h2853;
              5'h14: pos_normal = 16'h2854;
              5'h15: pos_normal = 16'h2855;
              5'h16: pos_normal = 16'h2856;
              5'h17: pos_normal = 16'h2857;
              5'h18: pos_normal = 16'h2858;
              5'h19: pos_normal = 16'h2859;
              5'h1a: pos_normal = 16'h285a;
              5'h1b: pos_normal = 16'h285b;
              5'h1c: pos_normal = 16'h285c;
              5'h1d: pos_normal = 16'h285d;
              5'h1e: pos_normal = 16'h285e;
              5'h1f: pos_normal = 16'h285f;
              default: begin end
            endcase
          end
          5'h03: begin
            pos_normal = 16'h2860;
            case (mant[4:0])
              5'h01: pos_normal = 16'h2861;
              5'h02: pos_normal = 16'h2862;
              5'h03: pos_normal = 16'h2863;
              5'h04: pos_normal = 16'h2864;
              5'h05: pos_normal = 16'h2865;
              5'h06: pos_normal = 16'h2866;
              5'h07: pos_normal = 16'h2867;
              5'h08: pos_normal = 16'h2868;
              5'h09: pos_normal = 16'h2869;
              5'h0a: pos_normal = 16'h286a;
              5'h0b: pos_normal = 16'h286b;
              5'h0c: pos_normal = 16'h286c;
              5'h0d: pos_normal = 16'h286d;
              5'h0e: pos_normal = 16'h286e;
              5'h0f: pos_normal = 16'h286f;
              5'h10: pos_normal = 16'h2870;
              5'h11: pos_normal = 16'h2871;
              5'h12: pos_normal = 16'h2872;
              5'h13: pos_normal = 16'h2873;
              5'h14: pos_normal = 16'h2874;
              5'h15: pos_normal = 16'h2875;
              5'h16: pos_normal = 16'h2876;
              5'h17: pos_normal = 16'h2877;
              5'h18: pos_normal = 16'h2878;
              5'h19: pos_normal = 16'h2879;
              5'h1a: pos_normal = 16'h287a;
              5'h1b: pos_normal = 16'h287b;
              5'h1c: pos_normal = 16'h287c;
              5'h1d: pos_normal = 16'h287d;
              5'h1e: pos_normal = 16'h287e;
              5'h1f: pos_normal = 16'h287f;
              default: begin end
            endcase
          end
          5'h04: begin
            pos_normal = 16'h2894;
            case (mant[4:0])
              5'h00: pos_normal = 16'h2880;
              5'h01: pos_normal = 16'h2881;
              5'h02: pos_normal = 16'h2882;
              5'h03: pos_normal = 16'h2883;
              5'h04: pos_normal = 16'h2884;
              5'h05: pos_normal = 16'h2885;
              5'h06: pos_normal = 16'h2886;
              5'h07: pos_normal = 16'h2887;
              5'h08: pos_normal = 16'h2888;
              5'h09: pos_normal = 16'h2889;
              5'h0a: pos_normal = 16'h288a;
              5'h0b: pos_normal = 16'h288b;
              5'h0c: pos_normal = 16'h288c;
              5'h0d: pos_normal = 16'h288d;
              5'h0e: pos_normal = 16'h288e;
              5'h0f: pos_normal = 16'h288f;
              5'h10: pos_normal = 16'h2890;
              5'h11: pos_normal = 16'h2891;
              5'h12: pos_normal = 16'h2892;
              5'h13: pos_normal = 16'h2893;
              5'h16: pos_normal = 16'h2895;
              5'h17: pos_normal = 16'h2896;
              5'h18: pos_normal = 16'h2897;
              5'h19: pos_normal = 16'h2898;
              5'h1a: pos_normal = 16'h2899;
              5'h1b: pos_normal = 16'h289a;
              5'h1c: pos_normal = 16'h289b;
              5'h1d: pos_normal = 16'h289c;
              5'h1e: pos_normal = 16'h289d;
              5'h1f: pos_normal = 16'h289e;
              default: begin end
            endcase
          end
          5'h05: begin
            pos_normal = 16'h289f;
            case (mant[4:0])
              5'h01: pos_normal = 16'h28a0;
              5'h02: pos_normal = 16'h28a1;
              5'h03: pos_normal = 16'h28a2;
              5'h04: pos_normal = 16'h28a3;
              5'h05: pos_normal = 16'h28a4;
              5'h06: pos_normal = 16'h28a5;
              5'h07: pos_normal = 16'h28a6;
              5'h08: pos_normal = 16'h28a7;
              5'h09: pos_normal = 16'h28a8;
              5'h0a: pos_normal = 16'h28a9;
              5'h0b: pos_normal = 16'h28aa;
              5'h0c: pos_normal = 16'h28ab;
              5'h0d: pos_normal = 16'h28ac;
              5'h0e: pos_normal = 16'h28ad;
              5'h0f: pos_normal = 16'h28ae;
              5'h10: pos_normal = 16'h28af;
              5'h11: pos_normal = 16'h28b0;
              5'h12: pos_normal = 16'h28b1;
              5'h13: pos_normal = 16'h28b2;
              5'h14: pos_normal = 16'h28b3;
              5'h15: pos_normal = 16'h28b4;
              5'h16: pos_normal = 16'h28b5;
              5'h17: pos_normal = 16'h28b6;
              5'h18: pos_normal = 16'h28b7;
              5'h19: pos_normal = 16'h28b8;
              5'h1a: pos_normal = 16'h28b9;
              5'h1b: pos_normal = 16'h28ba;
              5'h1c: pos_normal = 16'h28bb;
              5'h1d: pos_normal = 16'h28bc;
              5'h1e: pos_normal = 16'h28bd;
              5'h1f: pos_normal = 16'h28be;
              default: begin end
            endcase
          end
          5'h06: begin
            pos_normal = 16'h28bf;
            case (mant[4:0])
              5'h01: pos_normal = 16'h28c0;
              5'h02: pos_normal = 16'h28c1;
              5'h03: pos_normal = 16'h28c2;
              5'h04: pos_normal = 16'h28c3;
              5'h05: pos_normal = 16'h28c4;
              5'h06: pos_normal = 16'h28c5;
              5'h07: pos_normal = 16'h28c6;
              5'h08: pos_normal = 16'h28c7;
              5'h09: pos_normal = 16'h28c8;
              5'h0a: pos_normal = 16'h28c9;
              5'h0b: pos_normal = 16'h28ca;
              5'h0c: pos_normal = 16'h28cb;
              5'h0d: pos_normal = 16'h28cc;
              5'h0e: pos_normal = 16'h28cd;
              5'h0f: pos_normal = 16'h28ce;
              5'h10: pos_normal = 16'h28cf;
              5'h11: pos_normal = 16'h28d0;
              5'h12: pos_normal = 16'h28d1;
              5'h13: pos_normal = 16'h28d2;
              5'h14: pos_normal = 16'h28d3;
              5'h15: pos_normal = 16'h28d4;
              5'h16: pos_normal = 16'h28d5;
              5'h17: pos_normal = 16'h28d6;
              5'h18: pos_normal = 16'h28d7;
              5'h19: pos_normal = 16'h28d8;
              5'h1a: pos_normal = 16'h28d9;
              5'h1b: pos_normal = 16'h28da;
              5'h1c: pos_normal = 16'h28db;
              5'h1d: pos_normal = 16'h28dc;
              5'h1e: pos_normal = 16'h28dd;
              5'h1f: pos_normal = 16'h28de;
              default: begin end
            endcase
          end
          5'h07: begin
            pos_normal = 16'h28df;
            case (mant[4:0])
              5'h01: pos_normal = 16'h28e0;
              5'h02: pos_normal = 16'h28e1;
              5'h03: pos_normal = 16'h28e2;
              5'h04: pos_normal = 16'h28e3;
              5'h05: pos_normal = 16'h28e4;
              5'h06: pos_normal = 16'h28e5;
              5'h07: pos_normal = 16'h28e6;
              5'h08: pos_normal = 16'h28e7;
              5'h09: pos_normal = 16'h28e8;
              5'h0a: pos_normal = 16'h28e9;
              5'h0b: pos_normal = 16'h28ea;
              5'h0c: pos_normal = 16'h28eb;
              5'h0d: pos_normal = 16'h28ec;
              5'h0e: pos_normal = 16'h28ed;
              5'h0f: pos_normal = 16'h28ee;
              5'h10: pos_normal = 16'h28ef;
              5'h11: pos_normal = 16'h28f0;
              5'h12: pos_normal = 16'h28f1;
              5'h13: pos_normal = 16'h28f2;
              5'h14: pos_normal = 16'h28f3;
              5'h15: pos_normal = 16'h28f4;
              5'h16: pos_normal = 16'h28f5;
              5'h17: pos_normal = 16'h28f6;
              5'h18: pos_normal = 16'h28f7;
              5'h19: pos_normal = 16'h28f8;
              5'h1a: pos_normal = 16'h28f9;
              5'h1b: pos_normal = 16'h28fa;
              5'h1c: pos_normal = 16'h28fb;
              5'h1d: pos_normal = 16'h28fc;
              5'h1e: pos_normal = 16'h28fd;
              5'h1f: pos_normal = 16'h28fe;
              default: begin end
            endcase
          end
          5'h08: begin
            pos_normal = 16'h28ff;
            case (mant[4:0])
              5'h01: pos_normal = 16'h2900;
              5'h02: pos_normal = 16'h2901;
              5'h03: pos_normal = 16'h2902;
              5'h04: pos_normal = 16'h2903;
              5'h05: pos_normal = 16'h2904;
              5'h06: pos_normal = 16'h2905;
              5'h07: pos_normal = 16'h2906;
              5'h08: pos_normal = 16'h2907;
              5'h09: pos_normal = 16'h2908;
              5'h0a: pos_normal = 16'h2909;
              5'h0b: pos_normal = 16'h290a;
              5'h0c: pos_normal = 16'h290b;
              5'h0d: pos_normal = 16'h290c;
              5'h0e: pos_normal = 16'h290d;
              5'h0f: pos_normal = 16'h290e;
              5'h10: pos_normal = 16'h290f;
              5'h11: pos_normal = 16'h2910;
              5'h12: pos_normal = 16'h2911;
              5'h13: pos_normal = 16'h2912;
              5'h14: pos_normal = 16'h2913;
              5'h15: pos_normal = 16'h2914;
              5'h16: pos_normal = 16'h2915;
              5'h17: pos_normal = 16'h2916;
              5'h18: pos_normal = 16'h2917;
              5'h19: pos_normal = 16'h2918;
              5'h1a: pos_normal = 16'h2919;
              5'h1b: pos_normal = 16'h291a;
              5'h1c: pos_normal = 16'h291b;
              5'h1d: pos_normal = 16'h291c;
              5'h1e: pos_normal = 16'h291d;
              5'h1f: pos_normal = 16'h291e;
              default: begin end
            endcase
          end
          5'h09: begin
            pos_normal = 16'h291f;
            case (mant[4:0])
              5'h01: pos_normal = 16'h2920;
              5'h02: pos_normal = 16'h2921;
              5'h03: pos_normal = 16'h2922;
              5'h04: pos_normal = 16'h2923;
              5'h05: pos_normal = 16'h2924;
              5'h06: pos_normal = 16'h2925;
              5'h07: pos_normal = 16'h2926;
              5'h08: pos_normal = 16'h2927;
              5'h09: pos_normal = 16'h2928;
              5'h0a: pos_normal = 16'h2929;
              5'h0b: pos_normal = 16'h292a;
              5'h0c: pos_normal = 16'h292b;
              5'h0d: pos_normal = 16'h292c;
              5'h0e: pos_normal = 16'h292d;
              5'h0f: pos_normal = 16'h292e;
              5'h10: pos_normal = 16'h292f;
              5'h11: pos_normal = 16'h2930;
              5'h12: pos_normal = 16'h2931;
              5'h13: pos_normal = 16'h2932;
              5'h14: pos_normal = 16'h2933;
              5'h15: pos_normal = 16'h2934;
              5'h16: pos_normal = 16'h2935;
              5'h17: pos_normal = 16'h2936;
              5'h18: pos_normal = 16'h2937;
              5'h19: pos_normal = 16'h2938;
              5'h1a: pos_normal = 16'h2939;
              5'h1b: pos_normal = 16'h293a;
              5'h1c: pos_normal = 16'h293b;
              5'h1d: pos_normal = 16'h293c;
              5'h1e: pos_normal = 16'h293d;
              5'h1f: pos_normal = 16'h293e;
              default: begin end
            endcase
          end
          5'h0a: begin
            pos_normal = 16'h293f;
            case (mant[4:0])
              5'h01: pos_normal = 16'h2940;
              5'h02: pos_normal = 16'h2941;
              5'h03: pos_normal = 16'h2942;
              5'h04: pos_normal = 16'h2943;
              5'h05: pos_normal = 16'h2944;
              5'h06: pos_normal = 16'h2945;
              5'h07: pos_normal = 16'h2946;
              5'h08: pos_normal = 16'h2947;
              5'h09: pos_normal = 16'h2948;
              5'h0a: pos_normal = 16'h2949;
              5'h0b: pos_normal = 16'h294a;
              5'h0c: pos_normal = 16'h294b;
              5'h0d: pos_normal = 16'h294c;
              5'h0e: pos_normal = 16'h294d;
              5'h0f: pos_normal = 16'h294e;
              5'h10: pos_normal = 16'h294f;
              5'h11: pos_normal = 16'h2950;
              5'h12: pos_normal = 16'h2951;
              5'h13: pos_normal = 16'h2952;
              5'h14: pos_normal = 16'h2953;
              5'h15: pos_normal = 16'h2954;
              5'h16: pos_normal = 16'h2955;
              5'h17: pos_normal = 16'h2956;
              5'h18: pos_normal = 16'h2957;
              5'h19: pos_normal = 16'h2958;
              5'h1a: pos_normal = 16'h2959;
              5'h1b: pos_normal = 16'h295a;
              5'h1c: pos_normal = 16'h295b;
              5'h1d: pos_normal = 16'h295c;
              5'h1e: pos_normal = 16'h295d;
              5'h1f: pos_normal = 16'h295e;
              default: begin end
            endcase
          end
          5'h0b: begin
            pos_normal = 16'h295f;
            case (mant[4:0])
              5'h01: pos_normal = 16'h2960;
              5'h02: pos_normal = 16'h2961;
              5'h03: pos_normal = 16'h2962;
              5'h04: pos_normal = 16'h2963;
              5'h05: pos_normal = 16'h2964;
              5'h06: pos_normal = 16'h2965;
              5'h07: pos_normal = 16'h2966;
              5'h08: pos_normal = 16'h2967;
              5'h09: pos_normal = 16'h2968;
              5'h0a: pos_normal = 16'h2969;
              5'h0b: pos_normal = 16'h296a;
              5'h0c: pos_normal = 16'h296b;
              5'h0d: pos_normal = 16'h296c;
              5'h0e: pos_normal = 16'h296d;
              5'h0f: pos_normal = 16'h296e;
              5'h10: pos_normal = 16'h296f;
              5'h11: pos_normal = 16'h2970;
              5'h12: pos_normal = 16'h2971;
              5'h13: pos_normal = 16'h2972;
              5'h14: pos_normal = 16'h2973;
              5'h15: pos_normal = 16'h2974;
              5'h16: pos_normal = 16'h2975;
              5'h17: pos_normal = 16'h2976;
              5'h18: pos_normal = 16'h2977;
              5'h19: pos_normal = 16'h2978;
              5'h1a: pos_normal = 16'h2979;
              5'h1b: pos_normal = 16'h297a;
              5'h1c: pos_normal = 16'h297b;
              5'h1d: pos_normal = 16'h297c;
              5'h1e: pos_normal = 16'h297d;
              5'h1f: pos_normal = 16'h297e;
              default: begin end
            endcase
          end
          5'h0c: begin
            pos_normal = 16'h297f;
            case (mant[4:0])
              5'h01: pos_normal = 16'h2980;
              5'h02: pos_normal = 16'h2981;
              5'h03: pos_normal = 16'h2982;
              5'h04: pos_normal = 16'h2983;
              5'h05: pos_normal = 16'h2984;
              5'h06: pos_normal = 16'h2985;
              5'h07: pos_normal = 16'h2986;
              5'h08: pos_normal = 16'h2987;
              5'h09: pos_normal = 16'h2988;
              5'h0a: pos_normal = 16'h2989;
              5'h0b: pos_normal = 16'h298a;
              5'h0c: pos_normal = 16'h298b;
              5'h0d: pos_normal = 16'h298c;
              5'h0e: pos_normal = 16'h298d;
              5'h0f: pos_normal = 16'h298e;
              5'h10: pos_normal = 16'h298f;
              5'h11: pos_normal = 16'h2990;
              5'h12: pos_normal = 16'h2991;
              5'h13: pos_normal = 16'h2992;
              5'h14: pos_normal = 16'h2993;
              5'h15: pos_normal = 16'h2994;
              5'h16: pos_normal = 16'h2995;
              5'h17: pos_normal = 16'h2996;
              5'h18: pos_normal = 16'h2997;
              5'h19: pos_normal = 16'h2998;
              5'h1a: pos_normal = 16'h2999;
              5'h1b: pos_normal = 16'h299a;
              5'h1c: pos_normal = 16'h299b;
              5'h1d: pos_normal = 16'h299c;
              5'h1e: pos_normal = 16'h299d;
              5'h1f: pos_normal = 16'h299e;
              default: begin end
            endcase
          end
          5'h0d: begin
            pos_normal = 16'h299f;
            case (mant[4:0])
              5'h01: pos_normal = 16'h29a0;
              5'h02: pos_normal = 16'h29a1;
              5'h03: pos_normal = 16'h29a2;
              5'h04: pos_normal = 16'h29a3;
              5'h05: pos_normal = 16'h29a4;
              5'h06: pos_normal = 16'h29a5;
              5'h07: pos_normal = 16'h29a6;
              5'h08: pos_normal = 16'h29a7;
              5'h09: pos_normal = 16'h29a8;
              5'h0a: pos_normal = 16'h29a9;
              5'h0b: pos_normal = 16'h29aa;
              5'h0c: pos_normal = 16'h29ab;
              5'h0d: pos_normal = 16'h29ac;
              5'h0e: pos_normal = 16'h29ad;
              5'h0f: pos_normal = 16'h29ae;
              5'h10: pos_normal = 16'h29af;
              5'h11: pos_normal = 16'h29b0;
              5'h12: pos_normal = 16'h29b1;
              5'h13: pos_normal = 16'h29b2;
              5'h14: pos_normal = 16'h29b3;
              5'h15: pos_normal = 16'h29b4;
              5'h16: pos_normal = 16'h29b5;
              5'h17: pos_normal = 16'h29b6;
              5'h18: pos_normal = 16'h29b7;
              5'h19: pos_normal = 16'h29b8;
              5'h1a: pos_normal = 16'h29b9;
              5'h1b: pos_normal = 16'h29ba;
              5'h1c: pos_normal = 16'h29bb;
              5'h1d: pos_normal = 16'h29bc;
              5'h1e: pos_normal = 16'h29bd;
              5'h1f: pos_normal = 16'h29be;
              default: begin end
            endcase
          end
          5'h0e: begin
            pos_normal = 16'h29bf;
            case (mant[4:0])
              5'h01: pos_normal = 16'h29c0;
              5'h02: pos_normal = 16'h29c1;
              5'h03: pos_normal = 16'h29c2;
              5'h04: pos_normal = 16'h29c3;
              5'h05: pos_normal = 16'h29c4;
              5'h06: pos_normal = 16'h29c5;
              5'h07: pos_normal = 16'h29c6;
              5'h08: pos_normal = 16'h29c7;
              5'h09: pos_normal = 16'h29c8;
              5'h0a: pos_normal = 16'h29c9;
              5'h0b: pos_normal = 16'h29ca;
              5'h0c: pos_normal = 16'h29cb;
              5'h0d: pos_normal = 16'h29cc;
              5'h0e: pos_normal = 16'h29cd;
              5'h0f: pos_normal = 16'h29ce;
              5'h10: pos_normal = 16'h29cf;
              5'h11: pos_normal = 16'h29d0;
              5'h12: pos_normal = 16'h29d1;
              5'h13: pos_normal = 16'h29d2;
              5'h14: pos_normal = 16'h29d3;
              5'h15: pos_normal = 16'h29d4;
              5'h16: pos_normal = 16'h29d5;
              5'h17: pos_normal = 16'h29d6;
              5'h18: pos_normal = 16'h29d7;
              5'h19: pos_normal = 16'h29d8;
              5'h1a: pos_normal = 16'h29d9;
              5'h1b: pos_normal = 16'h29da;
              5'h1c: pos_normal = 16'h29db;
              5'h1d: pos_normal = 16'h29dc;
              5'h1e: pos_normal = 16'h29dd;
              5'h1f: pos_normal = 16'h29de;
              default: begin end
            endcase
          end
          5'h0f: begin
            pos_normal = 16'h29df;
            case (mant[4:0])
              5'h01: pos_normal = 16'h29e0;
              5'h02: pos_normal = 16'h29e1;
              5'h03: pos_normal = 16'h29e2;
              5'h04: pos_normal = 16'h29e3;
              5'h05: pos_normal = 16'h29e4;
              5'h06: pos_normal = 16'h29e5;
              5'h07: pos_normal = 16'h29e6;
              5'h08: pos_normal = 16'h29e7;
              5'h09: pos_normal = 16'h29e8;
              5'h0a: pos_normal = 16'h29e9;
              5'h0b: pos_normal = 16'h29ea;
              5'h0c: pos_normal = 16'h29eb;
              5'h0d: pos_normal = 16'h29ec;
              5'h0e: pos_normal = 16'h29ed;
              5'h0f: pos_normal = 16'h29ee;
              5'h10: pos_normal = 16'h29ef;
              5'h11: pos_normal = 16'h29f0;
              5'h12: pos_normal = 16'h29f1;
              5'h13: pos_normal = 16'h29f2;
              5'h14: pos_normal = 16'h29f3;
              5'h15: pos_normal = 16'h29f4;
              5'h16: pos_normal = 16'h29f5;
              5'h17: pos_normal = 16'h29f6;
              5'h18: pos_normal = 16'h29f7;
              5'h19: pos_normal = 16'h29f8;
              5'h1a: pos_normal = 16'h29f9;
              5'h1b: pos_normal = 16'h29fa;
              5'h1c: pos_normal = 16'h29fb;
              5'h1d: pos_normal = 16'h29fc;
              5'h1e: pos_normal = 16'h29fd;
              5'h1f: pos_normal = 16'h29fe;
              default: begin end
            endcase
          end
          5'h10: begin
            pos_normal = 16'h29ff;
            case (mant[4:0])
              5'h01: pos_normal = 16'h2a00;
              5'h02: pos_normal = 16'h2a01;
              5'h03: pos_normal = 16'h2a02;
              5'h04: pos_normal = 16'h2a03;
              5'h05: pos_normal = 16'h2a04;
              5'h06: pos_normal = 16'h2a05;
              5'h07: pos_normal = 16'h2a06;
              5'h08: pos_normal = 16'h2a07;
              5'h09: pos_normal = 16'h2a08;
              5'h0a: pos_normal = 16'h2a09;
              5'h0b: pos_normal = 16'h2a0a;
              5'h0c: pos_normal = 16'h2a0b;
              5'h0d: pos_normal = 16'h2a0c;
              5'h0e: pos_normal = 16'h2a0d;
              5'h0f: pos_normal = 16'h2a0e;
              5'h10: pos_normal = 16'h2a0f;
              5'h11: pos_normal = 16'h2a10;
              5'h12: pos_normal = 16'h2a11;
              5'h13: pos_normal = 16'h2a12;
              5'h14: pos_normal = 16'h2a13;
              5'h15: pos_normal = 16'h2a14;
              5'h16: pos_normal = 16'h2a15;
              5'h17: pos_normal = 16'h2a16;
              5'h18: pos_normal = 16'h2a17;
              5'h19: pos_normal = 16'h2a18;
              5'h1a: pos_normal = 16'h2a19;
              5'h1b: pos_normal = 16'h2a1a;
              5'h1c: pos_normal = 16'h2a1b;
              5'h1d: pos_normal = 16'h2a1c;
              5'h1e: pos_normal = 16'h2a1d;
              5'h1f: pos_normal = 16'h2a1e;
              default: begin end
            endcase
          end
          5'h11: begin
            pos_normal = 16'h2a1f;
            case (mant[4:0])
              5'h01: pos_normal = 16'h2a20;
              5'h02: pos_normal = 16'h2a21;
              5'h03: pos_normal = 16'h2a22;
              5'h04: pos_normal = 16'h2a23;
              5'h05: pos_normal = 16'h2a24;
              5'h06: pos_normal = 16'h2a25;
              5'h07: pos_normal = 16'h2a26;
              5'h08: pos_normal = 16'h2a27;
              5'h09: pos_normal = 16'h2a28;
              5'h0a: pos_normal = 16'h2a29;
              5'h0b: pos_normal = 16'h2a2a;
              5'h0c: pos_normal = 16'h2a2b;
              5'h0d: pos_normal = 16'h2a2c;
              5'h0e: pos_normal = 16'h2a2d;
              5'h0f: pos_normal = 16'h2a2e;
              5'h10: pos_normal = 16'h2a2f;
              5'h11: pos_normal = 16'h2a30;
              5'h12: pos_normal = 16'h2a31;
              5'h13: pos_normal = 16'h2a32;
              5'h14: pos_normal = 16'h2a33;
              5'h15: pos_normal = 16'h2a34;
              5'h16: pos_normal = 16'h2a35;
              5'h17: pos_normal = 16'h2a36;
              5'h18: pos_normal = 16'h2a37;
              5'h19: pos_normal = 16'h2a38;
              5'h1a: pos_normal = 16'h2a39;
              5'h1b: pos_normal = 16'h2a3a;
              5'h1c: pos_normal = 16'h2a3b;
              5'h1d: pos_normal = 16'h2a3c;
              5'h1e: pos_normal = 16'h2a3d;
              5'h1f: pos_normal = 16'h2a3e;
              default: begin end
            endcase
          end
          5'h12: begin
            pos_normal = 16'h2a3f;
            case (mant[4:0])
              5'h01: pos_normal = 16'h2a40;
              5'h02: pos_normal = 16'h2a41;
              5'h03: pos_normal = 16'h2a42;
              5'h04: pos_normal = 16'h2a43;
              5'h05: pos_normal = 16'h2a44;
              5'h06: pos_normal = 16'h2a45;
              5'h07: pos_normal = 16'h2a46;
              5'h08: pos_normal = 16'h2a47;
              5'h09: pos_normal = 16'h2a48;
              5'h0a: pos_normal = 16'h2a49;
              5'h0b: pos_normal = 16'h2a4a;
              5'h0c: pos_normal = 16'h2a4b;
              5'h0d: pos_normal = 16'h2a4c;
              5'h0e: pos_normal = 16'h2a4d;
              5'h0f: pos_normal = 16'h2a4e;
              5'h10: pos_normal = 16'h2a4f;
              5'h11: pos_normal = 16'h2a50;
              5'h12: pos_normal = 16'h2a51;
              5'h13: pos_normal = 16'h2a52;
              5'h14: pos_normal = 16'h2a53;
              5'h15: pos_normal = 16'h2a54;
              5'h16: pos_normal = 16'h2a55;
              5'h17: pos_normal = 16'h2a56;
              5'h18: pos_normal = 16'h2a57;
              5'h19: pos_normal = 16'h2a58;
              5'h1a: pos_normal = 16'h2a59;
              5'h1b: pos_normal = 16'h2a5a;
              5'h1c: pos_normal = 16'h2a5b;
              5'h1d: pos_normal = 16'h2a5c;
              5'h1e: pos_normal = 16'h2a5d;
              5'h1f: pos_normal = 16'h2a5e;
              default: begin end
            endcase
          end
          5'h13: begin
            pos_normal = 16'h2a5f;
            case (mant[4:0])
              5'h01: pos_normal = 16'h2a60;
              5'h02: pos_normal = 16'h2a61;
              5'h03: pos_normal = 16'h2a62;
              5'h04: pos_normal = 16'h2a63;
              5'h05: pos_normal = 16'h2a64;
              5'h06: pos_normal = 16'h2a65;
              5'h07: pos_normal = 16'h2a66;
              5'h08: pos_normal = 16'h2a67;
              5'h09: pos_normal = 16'h2a68;
              5'h0a: pos_normal = 16'h2a69;
              5'h0b: pos_normal = 16'h2a6a;
              5'h0c: pos_normal = 16'h2a6b;
              5'h0d: pos_normal = 16'h2a6c;
              5'h0e: pos_normal = 16'h2a6d;
              5'h0f: pos_normal = 16'h2a6e;
              5'h10: pos_normal = 16'h2a6f;
              5'h11: pos_normal = 16'h2a70;
              5'h12: pos_normal = 16'h2a71;
              5'h13: pos_normal = 16'h2a72;
              5'h14: pos_normal = 16'h2a73;
              5'h15: pos_normal = 16'h2a74;
              5'h16: pos_normal = 16'h2a75;
              5'h17: pos_normal = 16'h2a76;
              5'h18: pos_normal = 16'h2a77;
              5'h19: pos_normal = 16'h2a78;
              5'h1a: pos_normal = 16'h2a79;
              5'h1b: pos_normal = 16'h2a7a;
              5'h1c: pos_normal = 16'h2a7b;
              5'h1d: pos_normal = 16'h2a7c;
              5'h1e: pos_normal = 16'h2a7d;
              5'h1f: pos_normal = 16'h2a7e;
              default: begin end
            endcase
          end
          5'h14: begin
            pos_normal = 16'h2a9a;
            case (mant[4:0])
              5'h00: pos_normal = 16'h2a7f;
              5'h01: pos_normal = 16'h2a80;
              5'h02: pos_normal = 16'h2a81;
              5'h03: pos_normal = 16'h2a82;
              5'h04: pos_normal = 16'h2a83;
              5'h05: pos_normal = 16'h2a84;
              5'h06: pos_normal = 16'h2a85;
              5'h07: pos_normal = 16'h2a86;
              5'h08: pos_normal = 16'h2a87;
              5'h09: pos_normal = 16'h2a88;
              5'h0a: pos_normal = 16'h2a89;
              5'h0b: pos_normal = 16'h2a8a;
              5'h0c: pos_normal = 16'h2a8b;
              5'h0d: pos_normal = 16'h2a8c;
              5'h0e: pos_normal = 16'h2a8d;
              5'h0f: pos_normal = 16'h2a8e;
              5'h10: pos_normal = 16'h2a8f;
              5'h11: pos_normal = 16'h2a90;
              5'h12: pos_normal = 16'h2a91;
              5'h13: pos_normal = 16'h2a92;
              5'h14: pos_normal = 16'h2a93;
              5'h15: pos_normal = 16'h2a94;
              5'h16: pos_normal = 16'h2a95;
              5'h17: pos_normal = 16'h2a96;
              5'h18: pos_normal = 16'h2a97;
              5'h19: pos_normal = 16'h2a98;
              5'h1a: pos_normal = 16'h2a99;
              5'h1d: pos_normal = 16'h2a9b;
              5'h1e: pos_normal = 16'h2a9c;
              5'h1f: pos_normal = 16'h2a9d;
              default: begin end
            endcase
          end
          5'h15: begin
            pos_normal = 16'h2a9e;
            case (mant[4:0])
              5'h01: pos_normal = 16'h2a9f;
              5'h02: pos_normal = 16'h2aa0;
              5'h03: pos_normal = 16'h2aa1;
              5'h04: pos_normal = 16'h2aa2;
              5'h05: pos_normal = 16'h2aa3;
              5'h06: pos_normal = 16'h2aa4;
              5'h07: pos_normal = 16'h2aa5;
              5'h08: pos_normal = 16'h2aa6;
              5'h09: pos_normal = 16'h2aa7;
              5'h0a: pos_normal = 16'h2aa8;
              5'h0b: pos_normal = 16'h2aa9;
              5'h0c: pos_normal = 16'h2aaa;
              5'h0d: pos_normal = 16'h2aab;
              5'h0e: pos_normal = 16'h2aac;
              5'h0f: pos_normal = 16'h2aad;
              5'h10: pos_normal = 16'h2aae;
              5'h11: pos_normal = 16'h2aaf;
              5'h12: pos_normal = 16'h2ab0;
              5'h13: pos_normal = 16'h2ab1;
              5'h14: pos_normal = 16'h2ab2;
              5'h15: pos_normal = 16'h2ab3;
              5'h16: pos_normal = 16'h2ab4;
              5'h17: pos_normal = 16'h2ab5;
              5'h18: pos_normal = 16'h2ab6;
              5'h19: pos_normal = 16'h2ab7;
              5'h1a: pos_normal = 16'h2ab8;
              5'h1b: pos_normal = 16'h2ab9;
              5'h1c: pos_normal = 16'h2aba;
              5'h1d: pos_normal = 16'h2abb;
              5'h1e: pos_normal = 16'h2abc;
              5'h1f: pos_normal = 16'h2abd;
              default: begin end
            endcase
          end
          5'h16: begin
            pos_normal = 16'h2abe;
            case (mant[4:0])
              5'h01: pos_normal = 16'h2abf;
              5'h02: pos_normal = 16'h2ac0;
              5'h03: pos_normal = 16'h2ac1;
              5'h04: pos_normal = 16'h2ac2;
              5'h05: pos_normal = 16'h2ac3;
              5'h06: pos_normal = 16'h2ac4;
              5'h07: pos_normal = 16'h2ac5;
              5'h08: pos_normal = 16'h2ac6;
              5'h09: pos_normal = 16'h2ac7;
              5'h0a: pos_normal = 16'h2ac8;
              5'h0b: pos_normal = 16'h2ac9;
              5'h0c: pos_normal = 16'h2aca;
              5'h0d: pos_normal = 16'h2acb;
              5'h0e: pos_normal = 16'h2acc;
              5'h0f: pos_normal = 16'h2acd;
              5'h10: pos_normal = 16'h2ace;
              5'h11: pos_normal = 16'h2acf;
              5'h12: pos_normal = 16'h2ad0;
              5'h13: pos_normal = 16'h2ad1;
              5'h14: pos_normal = 16'h2ad2;
              5'h15: pos_normal = 16'h2ad3;
              5'h16: pos_normal = 16'h2ad4;
              5'h17: pos_normal = 16'h2ad5;
              5'h18: pos_normal = 16'h2ad6;
              5'h19: pos_normal = 16'h2ad7;
              5'h1a: pos_normal = 16'h2ad8;
              5'h1b: pos_normal = 16'h2ad9;
              5'h1c: pos_normal = 16'h2ada;
              5'h1d: pos_normal = 16'h2adb;
              5'h1e: pos_normal = 16'h2adc;
              5'h1f: pos_normal = 16'h2add;
              default: begin end
            endcase
          end
          5'h17: begin
            pos_normal = 16'h2ade;
            case (mant[4:0])
              5'h01: pos_normal = 16'h2adf;
              5'h02: pos_normal = 16'h2ae0;
              5'h03: pos_normal = 16'h2ae1;
              5'h04: pos_normal = 16'h2ae2;
              5'h05: pos_normal = 16'h2ae3;
              5'h06: pos_normal = 16'h2ae4;
              5'h07: pos_normal = 16'h2ae5;
              5'h08: pos_normal = 16'h2ae6;
              5'h09: pos_normal = 16'h2ae7;
              5'h0a: pos_normal = 16'h2ae8;
              5'h0b: pos_normal = 16'h2ae9;
              5'h0c: pos_normal = 16'h2aea;
              5'h0d: pos_normal = 16'h2aeb;
              5'h0e: pos_normal = 16'h2aec;
              5'h0f: pos_normal = 16'h2aed;
              5'h10: pos_normal = 16'h2aee;
              5'h11: pos_normal = 16'h2aef;
              5'h12: pos_normal = 16'h2af0;
              5'h13: pos_normal = 16'h2af1;
              5'h14: pos_normal = 16'h2af2;
              5'h15: pos_normal = 16'h2af3;
              5'h16: pos_normal = 16'h2af4;
              5'h17: pos_normal = 16'h2af5;
              5'h18: pos_normal = 16'h2af6;
              5'h19: pos_normal = 16'h2af7;
              5'h1a: pos_normal = 16'h2af8;
              5'h1b: pos_normal = 16'h2af9;
              5'h1c: pos_normal = 16'h2afa;
              5'h1d: pos_normal = 16'h2afb;
              5'h1e: pos_normal = 16'h2afc;
              5'h1f: pos_normal = 16'h2afd;
              default: begin end
            endcase
          end
          5'h18: begin
            pos_normal = 16'h2afe;
            case (mant[4:0])
              5'h01: pos_normal = 16'h2aff;
              5'h02: pos_normal = 16'h2b00;
              5'h03: pos_normal = 16'h2b01;
              5'h04: pos_normal = 16'h2b02;
              5'h05: pos_normal = 16'h2b03;
              5'h06: pos_normal = 16'h2b04;
              5'h07: pos_normal = 16'h2b05;
              5'h08: pos_normal = 16'h2b06;
              5'h09: pos_normal = 16'h2b07;
              5'h0a: pos_normal = 16'h2b08;
              5'h0b: pos_normal = 16'h2b09;
              5'h0c: pos_normal = 16'h2b0a;
              5'h0d: pos_normal = 16'h2b0b;
              5'h0e: pos_normal = 16'h2b0c;
              5'h0f: pos_normal = 16'h2b0d;
              5'h10: pos_normal = 16'h2b0e;
              5'h11: pos_normal = 16'h2b0f;
              5'h12: pos_normal = 16'h2b10;
              5'h13: pos_normal = 16'h2b11;
              5'h14: pos_normal = 16'h2b12;
              5'h15: pos_normal = 16'h2b13;
              5'h16: pos_normal = 16'h2b14;
              5'h17: pos_normal = 16'h2b15;
              5'h18: pos_normal = 16'h2b16;
              5'h19: pos_normal = 16'h2b17;
              5'h1a: pos_normal = 16'h2b18;
              5'h1b: pos_normal = 16'h2b19;
              5'h1c: pos_normal = 16'h2b1a;
              5'h1d: pos_normal = 16'h2b1b;
              5'h1e: pos_normal = 16'h2b1c;
              5'h1f: pos_normal = 16'h2b1d;
              default: begin end
            endcase
          end
          5'h19: begin
            pos_normal = 16'h2b1e;
            case (mant[4:0])
              5'h01: pos_normal = 16'h2b1f;
              5'h02: pos_normal = 16'h2b20;
              5'h03: pos_normal = 16'h2b21;
              5'h04: pos_normal = 16'h2b22;
              5'h05: pos_normal = 16'h2b23;
              5'h06: pos_normal = 16'h2b24;
              5'h07: pos_normal = 16'h2b25;
              5'h08: pos_normal = 16'h2b26;
              5'h09: pos_normal = 16'h2b27;
              5'h0a: pos_normal = 16'h2b28;
              5'h0b: pos_normal = 16'h2b29;
              5'h0c: pos_normal = 16'h2b2a;
              5'h0d: pos_normal = 16'h2b2b;
              5'h0e: pos_normal = 16'h2b2c;
              5'h0f: pos_normal = 16'h2b2d;
              5'h10: pos_normal = 16'h2b2e;
              5'h11: pos_normal = 16'h2b2f;
              5'h12: pos_normal = 16'h2b30;
              5'h13: pos_normal = 16'h2b31;
              5'h14: pos_normal = 16'h2b32;
              5'h15: pos_normal = 16'h2b33;
              5'h16: pos_normal = 16'h2b34;
              5'h17: pos_normal = 16'h2b35;
              5'h18: pos_normal = 16'h2b36;
              5'h19: pos_normal = 16'h2b37;
              5'h1a: pos_normal = 16'h2b38;
              5'h1b: pos_normal = 16'h2b39;
              5'h1c: pos_normal = 16'h2b3a;
              5'h1d: pos_normal = 16'h2b3b;
              5'h1e: pos_normal = 16'h2b3c;
              5'h1f: pos_normal = 16'h2b3d;
              default: begin end
            endcase
          end
          5'h1a: begin
            pos_normal = 16'h2b3e;
            case (mant[4:0])
              5'h01: pos_normal = 16'h2b3f;
              5'h02: pos_normal = 16'h2b40;
              5'h03: pos_normal = 16'h2b41;
              5'h04: pos_normal = 16'h2b42;
              5'h05: pos_normal = 16'h2b43;
              5'h06: pos_normal = 16'h2b44;
              5'h07: pos_normal = 16'h2b45;
              5'h08: pos_normal = 16'h2b46;
              5'h09: pos_normal = 16'h2b47;
              5'h0a: pos_normal = 16'h2b48;
              5'h0b: pos_normal = 16'h2b49;
              5'h0c: pos_normal = 16'h2b4a;
              5'h0d: pos_normal = 16'h2b4b;
              5'h0e: pos_normal = 16'h2b4c;
              5'h0f: pos_normal = 16'h2b4d;
              5'h10: pos_normal = 16'h2b4e;
              5'h11: pos_normal = 16'h2b4f;
              5'h12: pos_normal = 16'h2b50;
              5'h13: pos_normal = 16'h2b51;
              5'h14: pos_normal = 16'h2b52;
              5'h15: pos_normal = 16'h2b53;
              5'h16: pos_normal = 16'h2b54;
              5'h17: pos_normal = 16'h2b55;
              5'h18: pos_normal = 16'h2b56;
              5'h19: pos_normal = 16'h2b57;
              5'h1a: pos_normal = 16'h2b58;
              5'h1b: pos_normal = 16'h2b59;
              5'h1c: pos_normal = 16'h2b5a;
              5'h1d: pos_normal = 16'h2b5b;
              5'h1e: pos_normal = 16'h2b5c;
              5'h1f: pos_normal = 16'h2b5d;
              default: begin end
            endcase
          end
          5'h1b: begin
            pos_normal = 16'h2b5e;
            case (mant[4:0])
              5'h01: pos_normal = 16'h2b5f;
              5'h02: pos_normal = 16'h2b60;
              5'h03: pos_normal = 16'h2b61;
              5'h04: pos_normal = 16'h2b62;
              5'h05: pos_normal = 16'h2b63;
              5'h06: pos_normal = 16'h2b64;
              5'h07: pos_normal = 16'h2b65;
              5'h08: pos_normal = 16'h2b66;
              5'h09: pos_normal = 16'h2b67;
              5'h0a: pos_normal = 16'h2b68;
              5'h0b: pos_normal = 16'h2b69;
              5'h0c: pos_normal = 16'h2b6a;
              5'h0d: pos_normal = 16'h2b6b;
              5'h0e: pos_normal = 16'h2b6c;
              5'h0f: pos_normal = 16'h2b6d;
              5'h10: pos_normal = 16'h2b6e;
              5'h11: pos_normal = 16'h2b6f;
              5'h12: pos_normal = 16'h2b70;
              5'h13: pos_normal = 16'h2b71;
              5'h14: pos_normal = 16'h2b72;
              5'h15: pos_normal = 16'h2b73;
              5'h16: pos_normal = 16'h2b74;
              5'h17: pos_normal = 16'h2b75;
              5'h18: pos_normal = 16'h2b76;
              5'h19: pos_normal = 16'h2b77;
              5'h1a: pos_normal = 16'h2b78;
              5'h1b: pos_normal = 16'h2b79;
              5'h1c: pos_normal = 16'h2b7a;
              5'h1d: pos_normal = 16'h2b7b;
              5'h1e: pos_normal = 16'h2b7c;
              5'h1f: pos_normal = 16'h2b7d;
              default: begin end
            endcase
          end
          5'h1c: begin
            pos_normal = 16'h2b7e;
            case (mant[4:0])
              5'h01: pos_normal = 16'h2b7f;
              5'h02: pos_normal = 16'h2b80;
              5'h03: pos_normal = 16'h2b81;
              5'h04: pos_normal = 16'h2b82;
              5'h05: pos_normal = 16'h2b83;
              5'h06: pos_normal = 16'h2b84;
              5'h07: pos_normal = 16'h2b85;
              5'h08: pos_normal = 16'h2b86;
              5'h09: pos_normal = 16'h2b87;
              5'h0a: pos_normal = 16'h2b88;
              5'h0b: pos_normal = 16'h2b89;
              5'h0c: pos_normal = 16'h2b8a;
              5'h0d: pos_normal = 16'h2b8b;
              5'h0e: pos_normal = 16'h2b8c;
              5'h0f: pos_normal = 16'h2b8d;
              5'h10: pos_normal = 16'h2b8e;
              5'h11: pos_normal = 16'h2b8f;
              5'h12: pos_normal = 16'h2b90;
              5'h13: pos_normal = 16'h2b91;
              5'h14: pos_normal = 16'h2b92;
              5'h15: pos_normal = 16'h2b93;
              5'h16: pos_normal = 16'h2b94;
              5'h17: pos_normal = 16'h2b95;
              5'h18: pos_normal = 16'h2b96;
              5'h19: pos_normal = 16'h2b97;
              5'h1a: pos_normal = 16'h2b98;
              5'h1b: pos_normal = 16'h2b99;
              5'h1c: pos_normal = 16'h2b9a;
              5'h1d: pos_normal = 16'h2b9b;
              5'h1e: pos_normal = 16'h2b9c;
              5'h1f: pos_normal = 16'h2b9d;
              default: begin end
            endcase
          end
          5'h1d: begin
            pos_normal = 16'h2b9e;
            case (mant[4:0])
              5'h01: pos_normal = 16'h2b9f;
              5'h02: pos_normal = 16'h2ba0;
              5'h03: pos_normal = 16'h2ba1;
              5'h04: pos_normal = 16'h2ba2;
              5'h05: pos_normal = 16'h2ba3;
              5'h06: pos_normal = 16'h2ba4;
              5'h07: pos_normal = 16'h2ba5;
              5'h08: pos_normal = 16'h2ba6;
              5'h09: pos_normal = 16'h2ba7;
              5'h0a: pos_normal = 16'h2ba8;
              5'h0b: pos_normal = 16'h2ba9;
              5'h0c: pos_normal = 16'h2baa;
              5'h0d: pos_normal = 16'h2bab;
              5'h0e: pos_normal = 16'h2bac;
              5'h0f: pos_normal = 16'h2bad;
              5'h10: pos_normal = 16'h2bae;
              5'h11: pos_normal = 16'h2baf;
              5'h12: pos_normal = 16'h2bb0;
              5'h13: pos_normal = 16'h2bb1;
              5'h14: pos_normal = 16'h2bb2;
              5'h15: pos_normal = 16'h2bb3;
              5'h16: pos_normal = 16'h2bb4;
              5'h17: pos_normal = 16'h2bb5;
              5'h18: pos_normal = 16'h2bb6;
              5'h19: pos_normal = 16'h2bb7;
              5'h1a: pos_normal = 16'h2bb8;
              5'h1b: pos_normal = 16'h2bb9;
              5'h1c: pos_normal = 16'h2bba;
              5'h1d: pos_normal = 16'h2bbb;
              5'h1e: pos_normal = 16'h2bbc;
              5'h1f: pos_normal = 16'h2bbd;
              default: begin end
            endcase
          end
          5'h1e: begin
            pos_normal = 16'h2bd3;
            case (mant[4:0])
              5'h00: pos_normal = 16'h2bbe;
              5'h01: pos_normal = 16'h2bbf;
              5'h02: pos_normal = 16'h2bc0;
              5'h03: pos_normal = 16'h2bc1;
              5'h04: pos_normal = 16'h2bc2;
              5'h05: pos_normal = 16'h2bc3;
              5'h06: pos_normal = 16'h2bc4;
              5'h07: pos_normal = 16'h2bc5;
              5'h08: pos_normal = 16'h2bc6;
              5'h09: pos_normal = 16'h2bc7;
              5'h0a: pos_normal = 16'h2bc8;
              5'h0b: pos_normal = 16'h2bc9;
              5'h0c: pos_normal = 16'h2bca;
              5'h0d: pos_normal = 16'h2bcb;
              5'h0e: pos_normal = 16'h2bcc;
              5'h0f: pos_normal = 16'h2bcd;
              5'h10: pos_normal = 16'h2bce;
              5'h11: pos_normal = 16'h2bcf;
              5'h12: pos_normal = 16'h2bd0;
              5'h13: pos_normal = 16'h2bd1;
              5'h14: pos_normal = 16'h2bd2;
              5'h17: pos_normal = 16'h2bd4;
              5'h18: pos_normal = 16'h2bd5;
              5'h19: pos_normal = 16'h2bd6;
              5'h1a: pos_normal = 16'h2bd7;
              5'h1b: pos_normal = 16'h2bd8;
              5'h1c: pos_normal = 16'h2bd9;
              5'h1d: pos_normal = 16'h2bda;
              5'h1e: pos_normal = 16'h2bdb;
              5'h1f: pos_normal = 16'h2bdc;
              default: begin end
            endcase
          end
          5'h1f: begin
            pos_normal = 16'h2bdd;
            case (mant[4:0])
              5'h01: pos_normal = 16'h2bde;
              5'h02: pos_normal = 16'h2bdf;
              5'h03: pos_normal = 16'h2be0;
              5'h04: pos_normal = 16'h2be1;
              5'h05: pos_normal = 16'h2be2;
              5'h06: pos_normal = 16'h2be3;
              5'h07: pos_normal = 16'h2be4;
              5'h08: pos_normal = 16'h2be5;
              5'h09: pos_normal = 16'h2be6;
              5'h0a: pos_normal = 16'h2be7;
              5'h0b: pos_normal = 16'h2be8;
              5'h0c: pos_normal = 16'h2be9;
              5'h0d: pos_normal = 16'h2bea;
              5'h0e: pos_normal = 16'h2beb;
              5'h0f: pos_normal = 16'h2bec;
              5'h10: pos_normal = 16'h2bed;
              5'h11: pos_normal = 16'h2bee;
              5'h12: pos_normal = 16'h2bef;
              5'h13: pos_normal = 16'h2bf0;
              5'h14: pos_normal = 16'h2bf1;
              5'h15: pos_normal = 16'h2bf2;
              5'h16: pos_normal = 16'h2bf3;
              5'h17: pos_normal = 16'h2bf4;
              5'h18: pos_normal = 16'h2bf5;
              5'h19: pos_normal = 16'h2bf6;
              5'h1a: pos_normal = 16'h2bf7;
              5'h1b: pos_normal = 16'h2bf8;
              5'h1c: pos_normal = 16'h2bf9;
              5'h1d: pos_normal = 16'h2bfa;
              5'h1e: pos_normal = 16'h2bfb;
              5'h1f: pos_normal = 16'h2bfc;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      5'h0b: begin
        case (mant[9:5])
          5'h00: begin
            pos_normal = 16'h2bfd;
            case (mant[4:0])
              5'h01: pos_normal = 16'h2bff;
              5'h02: pos_normal = 16'h2c01;
              5'h03: pos_normal = 16'h2c02;
              5'h04: pos_normal = 16'h2c03;
              5'h05: pos_normal = 16'h2c04;
              5'h06: pos_normal = 16'h2c05;
              5'h07: pos_normal = 16'h2c06;
              5'h08: pos_normal = 16'h2c07;
              5'h09: pos_normal = 16'h2c08;
              5'h0a: pos_normal = 16'h2c09;
              5'h0b: pos_normal = 16'h2c0a;
              5'h0c: pos_normal = 16'h2c0b;
              5'h0d: pos_normal = 16'h2c0c;
              5'h0e: pos_normal = 16'h2c0d;
              5'h0f: pos_normal = 16'h2c0e;
              5'h10: pos_normal = 16'h2c0f;
              5'h11: pos_normal = 16'h2c10;
              5'h12: pos_normal = 16'h2c11;
              5'h13: pos_normal = 16'h2c12;
              5'h14: pos_normal = 16'h2c13;
              5'h15: pos_normal = 16'h2c14;
              5'h16: pos_normal = 16'h2c15;
              5'h17: pos_normal = 16'h2c16;
              5'h18: pos_normal = 16'h2c17;
              5'h19: pos_normal = 16'h2c18;
              5'h1a: pos_normal = 16'h2c19;
              5'h1b: pos_normal = 16'h2c1a;
              5'h1c: pos_normal = 16'h2c1b;
              5'h1d: pos_normal = 16'h2c1c;
              5'h1e: pos_normal = 16'h2c1d;
              5'h1f: pos_normal = 16'h2c1e;
              default: begin end
            endcase
          end
          5'h01: begin
            pos_normal = 16'h2c28;
            case (mant[4:0])
              5'h00: pos_normal = 16'h2c1f;
              5'h01: pos_normal = 16'h2c20;
              5'h02: pos_normal = 16'h2c21;
              5'h03: pos_normal = 16'h2c22;
              5'h04: pos_normal = 16'h2c23;
              5'h05: pos_normal = 16'h2c24;
              5'h06: pos_normal = 16'h2c25;
              5'h07: pos_normal = 16'h2c26;
              5'h08: pos_normal = 16'h2c27;
              5'h0b: pos_normal = 16'h2c29;
              5'h0c: pos_normal = 16'h2c2a;
              5'h0d: pos_normal = 16'h2c2b;
              5'h0e: pos_normal = 16'h2c2c;
              5'h0f: pos_normal = 16'h2c2d;
              5'h10: pos_normal = 16'h2c2e;
              5'h11: pos_normal = 16'h2c2f;
              5'h12: pos_normal = 16'h2c30;
              5'h13: pos_normal = 16'h2c31;
              5'h14: pos_normal = 16'h2c32;
              5'h15: pos_normal = 16'h2c33;
              5'h16: pos_normal = 16'h2c34;
              5'h17: pos_normal = 16'h2c35;
              5'h18: pos_normal = 16'h2c36;
              5'h19: pos_normal = 16'h2c37;
              5'h1a: pos_normal = 16'h2c38;
              5'h1b: pos_normal = 16'h2c39;
              5'h1c: pos_normal = 16'h2c3a;
              5'h1d: pos_normal = 16'h2c3b;
              5'h1e: pos_normal = 16'h2c3c;
              5'h1f: pos_normal = 16'h2c3d;
              default: begin end
            endcase
          end
          5'h02: begin
            pos_normal = 16'h2c3e;
            case (mant[4:0])
              5'h01: pos_normal = 16'h2c3f;
              5'h02: pos_normal = 16'h2c40;
              5'h03: pos_normal = 16'h2c41;
              5'h04: pos_normal = 16'h2c42;
              5'h05: pos_normal = 16'h2c43;
              5'h06: pos_normal = 16'h2c44;
              5'h07: pos_normal = 16'h2c45;
              5'h08: pos_normal = 16'h2c46;
              5'h09: pos_normal = 16'h2c47;
              5'h0a: pos_normal = 16'h2c48;
              5'h0b: pos_normal = 16'h2c49;
              5'h0c: pos_normal = 16'h2c4a;
              5'h0d: pos_normal = 16'h2c4b;
              5'h0e: pos_normal = 16'h2c4c;
              5'h0f: pos_normal = 16'h2c4d;
              5'h10: pos_normal = 16'h2c4e;
              5'h11: pos_normal = 16'h2c4f;
              5'h12: pos_normal = 16'h2c50;
              5'h13: pos_normal = 16'h2c51;
              5'h14: pos_normal = 16'h2c52;
              5'h15: pos_normal = 16'h2c53;
              5'h16: pos_normal = 16'h2c54;
              5'h17: pos_normal = 16'h2c55;
              5'h18: pos_normal = 16'h2c56;
              5'h19: pos_normal = 16'h2c57;
              5'h1a: pos_normal = 16'h2c58;
              5'h1b: pos_normal = 16'h2c59;
              5'h1c: pos_normal = 16'h2c5a;
              5'h1d: pos_normal = 16'h2c5b;
              5'h1e: pos_normal = 16'h2c5c;
              5'h1f: pos_normal = 16'h2c5d;
              default: begin end
            endcase
          end
          5'h03: begin
            pos_normal = 16'h2c5e;
            case (mant[4:0])
              5'h01: pos_normal = 16'h2c5f;
              5'h02: pos_normal = 16'h2c60;
              5'h03: pos_normal = 16'h2c61;
              5'h04: pos_normal = 16'h2c62;
              5'h05: pos_normal = 16'h2c63;
              5'h06: pos_normal = 16'h2c64;
              5'h07: pos_normal = 16'h2c65;
              5'h08: pos_normal = 16'h2c66;
              5'h09: pos_normal = 16'h2c67;
              5'h0a: pos_normal = 16'h2c68;
              5'h0b: pos_normal = 16'h2c69;
              5'h0c: pos_normal = 16'h2c6a;
              5'h0d: pos_normal = 16'h2c6b;
              5'h0e: pos_normal = 16'h2c6c;
              5'h0f: pos_normal = 16'h2c6d;
              5'h10: pos_normal = 16'h2c6e;
              5'h11: pos_normal = 16'h2c6f;
              5'h12: pos_normal = 16'h2c70;
              5'h13: pos_normal = 16'h2c71;
              5'h14: pos_normal = 16'h2c72;
              5'h15: pos_normal = 16'h2c73;
              5'h16: pos_normal = 16'h2c74;
              5'h17: pos_normal = 16'h2c75;
              5'h18: pos_normal = 16'h2c76;
              5'h19: pos_normal = 16'h2c77;
              5'h1a: pos_normal = 16'h2c78;
              5'h1b: pos_normal = 16'h2c79;
              5'h1c: pos_normal = 16'h2c7a;
              5'h1d: pos_normal = 16'h2c7b;
              5'h1e: pos_normal = 16'h2c7c;
              5'h1f: pos_normal = 16'h2c7d;
              default: begin end
            endcase
          end
          5'h04: begin
            pos_normal = 16'h2c7e;
            case (mant[4:0])
              5'h01: pos_normal = 16'h2c7f;
              5'h02: pos_normal = 16'h2c80;
              5'h03: pos_normal = 16'h2c81;
              5'h04: pos_normal = 16'h2c82;
              5'h05: pos_normal = 16'h2c83;
              5'h06: pos_normal = 16'h2c84;
              5'h07: pos_normal = 16'h2c85;
              5'h08: pos_normal = 16'h2c86;
              5'h09: pos_normal = 16'h2c87;
              5'h0a: pos_normal = 16'h2c88;
              5'h0b: pos_normal = 16'h2c89;
              5'h0c: pos_normal = 16'h2c8a;
              5'h0d: pos_normal = 16'h2c8b;
              5'h0e: pos_normal = 16'h2c8c;
              5'h0f: pos_normal = 16'h2c8d;
              5'h10: pos_normal = 16'h2c8e;
              5'h11: pos_normal = 16'h2c8f;
              5'h12: pos_normal = 16'h2c90;
              5'h13: pos_normal = 16'h2c91;
              5'h14: pos_normal = 16'h2c92;
              5'h15: pos_normal = 16'h2c93;
              5'h16: pos_normal = 16'h2c94;
              5'h17: pos_normal = 16'h2c95;
              5'h18: pos_normal = 16'h2c96;
              5'h19: pos_normal = 16'h2c97;
              5'h1a: pos_normal = 16'h2c98;
              5'h1b: pos_normal = 16'h2c99;
              5'h1c: pos_normal = 16'h2c9a;
              5'h1d: pos_normal = 16'h2c9b;
              5'h1e: pos_normal = 16'h2c9c;
              5'h1f: pos_normal = 16'h2c9d;
              default: begin end
            endcase
          end
          5'h05: begin
            pos_normal = 16'h2c9e;
            case (mant[4:0])
              5'h01: pos_normal = 16'h2c9f;
              5'h02: pos_normal = 16'h2ca0;
              5'h03: pos_normal = 16'h2ca1;
              5'h04: pos_normal = 16'h2ca2;
              5'h05: pos_normal = 16'h2ca3;
              5'h06: pos_normal = 16'h2ca4;
              5'h07: pos_normal = 16'h2ca5;
              5'h08: pos_normal = 16'h2ca6;
              5'h09: pos_normal = 16'h2ca7;
              5'h0a: pos_normal = 16'h2ca8;
              5'h0b: pos_normal = 16'h2ca9;
              5'h0c: pos_normal = 16'h2caa;
              5'h0d: pos_normal = 16'h2cab;
              5'h0e: pos_normal = 16'h2cac;
              5'h0f: pos_normal = 16'h2cad;
              5'h10: pos_normal = 16'h2cae;
              5'h11: pos_normal = 16'h2caf;
              5'h12: pos_normal = 16'h2cb0;
              5'h13: pos_normal = 16'h2cb1;
              5'h14: pos_normal = 16'h2cb2;
              5'h15: pos_normal = 16'h2cb3;
              5'h16: pos_normal = 16'h2cb4;
              5'h17: pos_normal = 16'h2cb5;
              5'h18: pos_normal = 16'h2cb6;
              5'h19: pos_normal = 16'h2cb7;
              5'h1a: pos_normal = 16'h2cb8;
              5'h1b: pos_normal = 16'h2cb9;
              5'h1c: pos_normal = 16'h2cba;
              5'h1d: pos_normal = 16'h2cbb;
              5'h1e: pos_normal = 16'h2cbc;
              5'h1f: pos_normal = 16'h2cbd;
              default: begin end
            endcase
          end
          5'h06: begin
            pos_normal = 16'h2cbe;
            case (mant[4:0])
              5'h01: pos_normal = 16'h2cbf;
              5'h02: pos_normal = 16'h2cc0;
              5'h03: pos_normal = 16'h2cc1;
              5'h04: pos_normal = 16'h2cc2;
              5'h05: pos_normal = 16'h2cc3;
              5'h06: pos_normal = 16'h2cc4;
              5'h07: pos_normal = 16'h2cc5;
              5'h08: pos_normal = 16'h2cc6;
              5'h09: pos_normal = 16'h2cc7;
              5'h0a: pos_normal = 16'h2cc8;
              5'h0b: pos_normal = 16'h2cc9;
              5'h0c: pos_normal = 16'h2cca;
              5'h0d: pos_normal = 16'h2ccb;
              5'h0e: pos_normal = 16'h2ccc;
              5'h0f: pos_normal = 16'h2ccd;
              5'h10: pos_normal = 16'h2cce;
              5'h11: pos_normal = 16'h2ccf;
              5'h12: pos_normal = 16'h2cd0;
              5'h13: pos_normal = 16'h2cd1;
              5'h14: pos_normal = 16'h2cd2;
              5'h15: pos_normal = 16'h2cd3;
              5'h16: pos_normal = 16'h2cd4;
              5'h17: pos_normal = 16'h2cd5;
              5'h18: pos_normal = 16'h2cd6;
              5'h19: pos_normal = 16'h2cd7;
              5'h1a: pos_normal = 16'h2cd8;
              5'h1b: pos_normal = 16'h2cd9;
              5'h1c: pos_normal = 16'h2cda;
              5'h1d: pos_normal = 16'h2cdb;
              5'h1e: pos_normal = 16'h2cdc;
              5'h1f: pos_normal = 16'h2cdd;
              default: begin end
            endcase
          end
          5'h07: begin
            pos_normal = 16'h2ced;
            case (mant[4:0])
              5'h00: pos_normal = 16'h2cde;
              5'h01: pos_normal = 16'h2cdf;
              5'h02: pos_normal = 16'h2ce0;
              5'h03: pos_normal = 16'h2ce1;
              5'h04: pos_normal = 16'h2ce2;
              5'h05: pos_normal = 16'h2ce3;
              5'h06: pos_normal = 16'h2ce4;
              5'h07: pos_normal = 16'h2ce5;
              5'h08: pos_normal = 16'h2ce6;
              5'h09: pos_normal = 16'h2ce7;
              5'h0a: pos_normal = 16'h2ce8;
              5'h0b: pos_normal = 16'h2ce9;
              5'h0c: pos_normal = 16'h2cea;
              5'h0d: pos_normal = 16'h2ceb;
              5'h0e: pos_normal = 16'h2cec;
              5'h11: pos_normal = 16'h2cee;
              5'h12: pos_normal = 16'h2cef;
              5'h13: pos_normal = 16'h2cf0;
              5'h14: pos_normal = 16'h2cf1;
              5'h15: pos_normal = 16'h2cf2;
              5'h16: pos_normal = 16'h2cf3;
              5'h17: pos_normal = 16'h2cf4;
              5'h18: pos_normal = 16'h2cf5;
              5'h19: pos_normal = 16'h2cf6;
              5'h1a: pos_normal = 16'h2cf7;
              5'h1b: pos_normal = 16'h2cf8;
              5'h1c: pos_normal = 16'h2cf9;
              5'h1d: pos_normal = 16'h2cfa;
              5'h1e: pos_normal = 16'h2cfb;
              5'h1f: pos_normal = 16'h2cfc;
              default: begin end
            endcase
          end
          5'h08: begin
            pos_normal = 16'h2cfd;
            case (mant[4:0])
              5'h01: pos_normal = 16'h2cfe;
              5'h02: pos_normal = 16'h2cff;
              5'h03: pos_normal = 16'h2d00;
              5'h04: pos_normal = 16'h2d01;
              5'h05: pos_normal = 16'h2d02;
              5'h06: pos_normal = 16'h2d03;
              5'h07: pos_normal = 16'h2d04;
              5'h08: pos_normal = 16'h2d05;
              5'h09: pos_normal = 16'h2d06;
              5'h0a: pos_normal = 16'h2d07;
              5'h0b: pos_normal = 16'h2d08;
              5'h0c: pos_normal = 16'h2d09;
              5'h0d: pos_normal = 16'h2d0a;
              5'h0e: pos_normal = 16'h2d0b;
              5'h0f: pos_normal = 16'h2d0c;
              5'h10: pos_normal = 16'h2d0d;
              5'h11: pos_normal = 16'h2d0e;
              5'h12: pos_normal = 16'h2d0f;
              5'h13: pos_normal = 16'h2d10;
              5'h14: pos_normal = 16'h2d11;
              5'h15: pos_normal = 16'h2d12;
              5'h16: pos_normal = 16'h2d13;
              5'h17: pos_normal = 16'h2d14;
              5'h18: pos_normal = 16'h2d15;
              5'h19: pos_normal = 16'h2d16;
              5'h1a: pos_normal = 16'h2d17;
              5'h1b: pos_normal = 16'h2d18;
              5'h1c: pos_normal = 16'h2d19;
              5'h1d: pos_normal = 16'h2d1a;
              5'h1e: pos_normal = 16'h2d1b;
              5'h1f: pos_normal = 16'h2d1c;
              default: begin end
            endcase
          end
          5'h09: begin
            pos_normal = 16'h2d1d;
            case (mant[4:0])
              5'h01: pos_normal = 16'h2d1e;
              5'h02: pos_normal = 16'h2d1f;
              5'h03: pos_normal = 16'h2d20;
              5'h04: pos_normal = 16'h2d21;
              5'h05: pos_normal = 16'h2d22;
              5'h06: pos_normal = 16'h2d23;
              5'h07: pos_normal = 16'h2d24;
              5'h08: pos_normal = 16'h2d25;
              5'h09: pos_normal = 16'h2d26;
              5'h0a: pos_normal = 16'h2d27;
              5'h0b: pos_normal = 16'h2d28;
              5'h0c: pos_normal = 16'h2d29;
              5'h0d: pos_normal = 16'h2d2a;
              5'h0e: pos_normal = 16'h2d2b;
              5'h0f: pos_normal = 16'h2d2c;
              5'h10: pos_normal = 16'h2d2d;
              5'h11: pos_normal = 16'h2d2e;
              5'h12: pos_normal = 16'h2d2f;
              5'h13: pos_normal = 16'h2d30;
              5'h14: pos_normal = 16'h2d31;
              5'h15: pos_normal = 16'h2d32;
              5'h16: pos_normal = 16'h2d33;
              5'h17: pos_normal = 16'h2d34;
              5'h18: pos_normal = 16'h2d35;
              5'h19: pos_normal = 16'h2d36;
              5'h1a: pos_normal = 16'h2d37;
              5'h1b: pos_normal = 16'h2d38;
              5'h1c: pos_normal = 16'h2d39;
              5'h1d: pos_normal = 16'h2d3a;
              5'h1e: pos_normal = 16'h2d3b;
              5'h1f: pos_normal = 16'h2d3c;
              default: begin end
            endcase
          end
          5'h0a: begin
            pos_normal = 16'h2d3d;
            case (mant[4:0])
              5'h01: pos_normal = 16'h2d3e;
              5'h02: pos_normal = 16'h2d3f;
              5'h03: pos_normal = 16'h2d40;
              5'h04: pos_normal = 16'h2d41;
              5'h05: pos_normal = 16'h2d42;
              5'h06: pos_normal = 16'h2d43;
              5'h07: pos_normal = 16'h2d44;
              5'h08: pos_normal = 16'h2d45;
              5'h09: pos_normal = 16'h2d46;
              5'h0a: pos_normal = 16'h2d47;
              5'h0b: pos_normal = 16'h2d48;
              5'h0c: pos_normal = 16'h2d49;
              5'h0d: pos_normal = 16'h2d4a;
              5'h0e: pos_normal = 16'h2d4b;
              5'h0f: pos_normal = 16'h2d4c;
              5'h10: pos_normal = 16'h2d4d;
              5'h11: pos_normal = 16'h2d4e;
              5'h12: pos_normal = 16'h2d4f;
              5'h13: pos_normal = 16'h2d50;
              5'h14: pos_normal = 16'h2d51;
              5'h15: pos_normal = 16'h2d52;
              5'h16: pos_normal = 16'h2d53;
              5'h17: pos_normal = 16'h2d54;
              5'h18: pos_normal = 16'h2d55;
              5'h19: pos_normal = 16'h2d56;
              5'h1a: pos_normal = 16'h2d57;
              5'h1b: pos_normal = 16'h2d58;
              5'h1c: pos_normal = 16'h2d59;
              5'h1d: pos_normal = 16'h2d5a;
              5'h1e: pos_normal = 16'h2d5b;
              5'h1f: pos_normal = 16'h2d5c;
              default: begin end
            endcase
          end
          5'h0b: begin
            pos_normal = 16'h2d5d;
            case (mant[4:0])
              5'h01: pos_normal = 16'h2d5e;
              5'h02: pos_normal = 16'h2d5f;
              5'h03: pos_normal = 16'h2d60;
              5'h04: pos_normal = 16'h2d61;
              5'h05: pos_normal = 16'h2d62;
              5'h06: pos_normal = 16'h2d63;
              5'h07: pos_normal = 16'h2d64;
              5'h08: pos_normal = 16'h2d65;
              5'h09: pos_normal = 16'h2d66;
              5'h0a: pos_normal = 16'h2d67;
              5'h0b: pos_normal = 16'h2d68;
              5'h0c: pos_normal = 16'h2d69;
              5'h0d: pos_normal = 16'h2d6a;
              5'h0e: pos_normal = 16'h2d6b;
              5'h0f: pos_normal = 16'h2d6c;
              5'h10: pos_normal = 16'h2d6d;
              5'h11: pos_normal = 16'h2d6e;
              5'h12: pos_normal = 16'h2d6f;
              5'h13: pos_normal = 16'h2d70;
              5'h14: pos_normal = 16'h2d71;
              5'h15: pos_normal = 16'h2d72;
              5'h16: pos_normal = 16'h2d73;
              5'h17: pos_normal = 16'h2d74;
              5'h18: pos_normal = 16'h2d75;
              5'h19: pos_normal = 16'h2d76;
              5'h1a: pos_normal = 16'h2d77;
              5'h1b: pos_normal = 16'h2d78;
              5'h1c: pos_normal = 16'h2d79;
              5'h1d: pos_normal = 16'h2d7a;
              5'h1e: pos_normal = 16'h2d7b;
              5'h1f: pos_normal = 16'h2d7c;
              default: begin end
            endcase
          end
          5'h0c: begin
            pos_normal = 16'h2d82;
            case (mant[4:0])
              5'h00: pos_normal = 16'h2d7d;
              5'h01: pos_normal = 16'h2d7e;
              5'h02: pos_normal = 16'h2d7f;
              5'h03: pos_normal = 16'h2d80;
              5'h04: pos_normal = 16'h2d81;
              5'h07: pos_normal = 16'h2d83;
              5'h08: pos_normal = 16'h2d84;
              5'h09: pos_normal = 16'h2d85;
              5'h0a: pos_normal = 16'h2d86;
              5'h0b: pos_normal = 16'h2d87;
              5'h0c: pos_normal = 16'h2d88;
              5'h0d: pos_normal = 16'h2d89;
              5'h0e: pos_normal = 16'h2d8a;
              5'h0f: pos_normal = 16'h2d8b;
              5'h10: pos_normal = 16'h2d8c;
              5'h11: pos_normal = 16'h2d8d;
              5'h12: pos_normal = 16'h2d8e;
              5'h13: pos_normal = 16'h2d8f;
              5'h14: pos_normal = 16'h2d90;
              5'h15: pos_normal = 16'h2d91;
              5'h16: pos_normal = 16'h2d92;
              5'h17: pos_normal = 16'h2d93;
              5'h18: pos_normal = 16'h2d94;
              5'h19: pos_normal = 16'h2d95;
              5'h1a: pos_normal = 16'h2d96;
              5'h1b: pos_normal = 16'h2d97;
              5'h1c: pos_normal = 16'h2d98;
              5'h1d: pos_normal = 16'h2d99;
              5'h1e: pos_normal = 16'h2d9a;
              5'h1f: pos_normal = 16'h2d9b;
              default: begin end
            endcase
          end
          5'h0d: begin
            pos_normal = 16'h2d9c;
            case (mant[4:0])
              5'h01: pos_normal = 16'h2d9d;
              5'h02: pos_normal = 16'h2d9e;
              5'h03: pos_normal = 16'h2d9f;
              5'h04: pos_normal = 16'h2da0;
              5'h05: pos_normal = 16'h2da1;
              5'h06: pos_normal = 16'h2da2;
              5'h07: pos_normal = 16'h2da3;
              5'h08: pos_normal = 16'h2da4;
              5'h09: pos_normal = 16'h2da5;
              5'h0a: pos_normal = 16'h2da6;
              5'h0b: pos_normal = 16'h2da7;
              5'h0c: pos_normal = 16'h2da8;
              5'h0d: pos_normal = 16'h2da9;
              5'h0e: pos_normal = 16'h2daa;
              5'h0f: pos_normal = 16'h2dab;
              5'h10: pos_normal = 16'h2dac;
              5'h11: pos_normal = 16'h2dad;
              5'h12: pos_normal = 16'h2dae;
              5'h13: pos_normal = 16'h2daf;
              5'h14: pos_normal = 16'h2db0;
              5'h15: pos_normal = 16'h2db1;
              5'h16: pos_normal = 16'h2db2;
              5'h17: pos_normal = 16'h2db3;
              5'h18: pos_normal = 16'h2db4;
              5'h19: pos_normal = 16'h2db5;
              5'h1a: pos_normal = 16'h2db6;
              5'h1b: pos_normal = 16'h2db7;
              5'h1c: pos_normal = 16'h2db8;
              5'h1d: pos_normal = 16'h2db9;
              5'h1e: pos_normal = 16'h2dba;
              5'h1f: pos_normal = 16'h2dbb;
              default: begin end
            endcase
          end
          5'h0e: begin
            pos_normal = 16'h2dbc;
            case (mant[4:0])
              5'h01: pos_normal = 16'h2dbd;
              5'h02: pos_normal = 16'h2dbe;
              5'h03: pos_normal = 16'h2dbf;
              5'h04: pos_normal = 16'h2dc0;
              5'h05: pos_normal = 16'h2dc1;
              5'h06: pos_normal = 16'h2dc2;
              5'h07: pos_normal = 16'h2dc3;
              5'h08: pos_normal = 16'h2dc4;
              5'h09: pos_normal = 16'h2dc5;
              5'h0a: pos_normal = 16'h2dc6;
              5'h0b: pos_normal = 16'h2dc7;
              5'h0c: pos_normal = 16'h2dc8;
              5'h0d: pos_normal = 16'h2dc9;
              5'h0e: pos_normal = 16'h2dca;
              5'h0f: pos_normal = 16'h2dcb;
              5'h10: pos_normal = 16'h2dcc;
              5'h11: pos_normal = 16'h2dcd;
              5'h12: pos_normal = 16'h2dce;
              5'h13: pos_normal = 16'h2dcf;
              5'h14: pos_normal = 16'h2dd0;
              5'h15: pos_normal = 16'h2dd1;
              5'h16: pos_normal = 16'h2dd2;
              5'h17: pos_normal = 16'h2dd3;
              5'h18: pos_normal = 16'h2dd4;
              5'h19: pos_normal = 16'h2dd5;
              5'h1a: pos_normal = 16'h2dd6;
              5'h1b: pos_normal = 16'h2dd7;
              5'h1c: pos_normal = 16'h2dd8;
              5'h1d: pos_normal = 16'h2dd9;
              5'h1e: pos_normal = 16'h2dda;
              5'h1f: pos_normal = 16'h2ddb;
              default: begin end
            endcase
          end
          5'h0f: begin
            pos_normal = 16'h2ddc;
            case (mant[4:0])
              5'h01: pos_normal = 16'h2ddd;
              5'h02: pos_normal = 16'h2dde;
              5'h03: pos_normal = 16'h2ddf;
              5'h04: pos_normal = 16'h2de0;
              5'h05: pos_normal = 16'h2de1;
              5'h06: pos_normal = 16'h2de2;
              5'h07: pos_normal = 16'h2de3;
              5'h08: pos_normal = 16'h2de4;
              5'h09: pos_normal = 16'h2de5;
              5'h0a: pos_normal = 16'h2de6;
              5'h0b: pos_normal = 16'h2de7;
              5'h0c: pos_normal = 16'h2de8;
              5'h0d: pos_normal = 16'h2de9;
              5'h0e: pos_normal = 16'h2dea;
              5'h0f: pos_normal = 16'h2deb;
              5'h10: pos_normal = 16'h2dec;
              5'h11: pos_normal = 16'h2ded;
              5'h12: pos_normal = 16'h2dee;
              5'h13: pos_normal = 16'h2def;
              5'h14: pos_normal = 16'h2df0;
              5'h15: pos_normal = 16'h2df1;
              5'h16: pos_normal = 16'h2df2;
              5'h17: pos_normal = 16'h2df3;
              5'h18: pos_normal = 16'h2df4;
              5'h19: pos_normal = 16'h2df5;
              5'h1a: pos_normal = 16'h2df6;
              5'h1b: pos_normal = 16'h2df7;
              5'h1c: pos_normal = 16'h2df8;
              5'h1d: pos_normal = 16'h2df9;
              5'h1e: pos_normal = 16'h2dfa;
              5'h1f: pos_normal = 16'h2dfb;
              default: begin end
            endcase
          end
          5'h10: begin
            pos_normal = 16'h2dfd;
            case (mant[4:0])
              5'h00: pos_normal = 16'h2dfc;
              5'h03: pos_normal = 16'h2dfe;
              5'h04: pos_normal = 16'h2dff;
              5'h05: pos_normal = 16'h2e00;
              5'h06: pos_normal = 16'h2e01;
              5'h07: pos_normal = 16'h2e02;
              5'h08: pos_normal = 16'h2e03;
              5'h09: pos_normal = 16'h2e04;
              5'h0a: pos_normal = 16'h2e05;
              5'h0b: pos_normal = 16'h2e06;
              5'h0c: pos_normal = 16'h2e07;
              5'h0d: pos_normal = 16'h2e08;
              5'h0e: pos_normal = 16'h2e09;
              5'h0f: pos_normal = 16'h2e0a;
              5'h10: pos_normal = 16'h2e0b;
              5'h11: pos_normal = 16'h2e0c;
              5'h12: pos_normal = 16'h2e0d;
              5'h13: pos_normal = 16'h2e0e;
              5'h14: pos_normal = 16'h2e0f;
              5'h15: pos_normal = 16'h2e10;
              5'h16: pos_normal = 16'h2e11;
              5'h17: pos_normal = 16'h2e12;
              5'h18: pos_normal = 16'h2e13;
              5'h19: pos_normal = 16'h2e14;
              5'h1a: pos_normal = 16'h2e15;
              5'h1b: pos_normal = 16'h2e16;
              5'h1c: pos_normal = 16'h2e17;
              5'h1d: pos_normal = 16'h2e18;
              5'h1e: pos_normal = 16'h2e19;
              5'h1f: pos_normal = 16'h2e1a;
              default: begin end
            endcase
          end
          5'h11: begin
            pos_normal = 16'h2e1b;
            case (mant[4:0])
              5'h01: pos_normal = 16'h2e1c;
              5'h02: pos_normal = 16'h2e1d;
              5'h03: pos_normal = 16'h2e1e;
              5'h04: pos_normal = 16'h2e1f;
              5'h05: pos_normal = 16'h2e20;
              5'h06: pos_normal = 16'h2e21;
              5'h07: pos_normal = 16'h2e22;
              5'h08: pos_normal = 16'h2e23;
              5'h09: pos_normal = 16'h2e24;
              5'h0a: pos_normal = 16'h2e25;
              5'h0b: pos_normal = 16'h2e26;
              5'h0c: pos_normal = 16'h2e27;
              5'h0d: pos_normal = 16'h2e28;
              5'h0e: pos_normal = 16'h2e29;
              5'h0f: pos_normal = 16'h2e2a;
              5'h10: pos_normal = 16'h2e2b;
              5'h11: pos_normal = 16'h2e2c;
              5'h12: pos_normal = 16'h2e2d;
              5'h13: pos_normal = 16'h2e2e;
              5'h14: pos_normal = 16'h2e2f;
              5'h15: pos_normal = 16'h2e30;
              5'h16: pos_normal = 16'h2e31;
              5'h17: pos_normal = 16'h2e32;
              5'h18: pos_normal = 16'h2e33;
              5'h19: pos_normal = 16'h2e34;
              5'h1a: pos_normal = 16'h2e35;
              5'h1b: pos_normal = 16'h2e36;
              5'h1c: pos_normal = 16'h2e37;
              5'h1d: pos_normal = 16'h2e38;
              5'h1e: pos_normal = 16'h2e39;
              5'h1f: pos_normal = 16'h2e3a;
              default: begin end
            endcase
          end
          5'h12: begin
            pos_normal = 16'h2e3b;
            case (mant[4:0])
              5'h01: pos_normal = 16'h2e3c;
              5'h02: pos_normal = 16'h2e3d;
              5'h03: pos_normal = 16'h2e3e;
              5'h04: pos_normal = 16'h2e3f;
              5'h05: pos_normal = 16'h2e40;
              5'h06: pos_normal = 16'h2e41;
              5'h07: pos_normal = 16'h2e42;
              5'h08: pos_normal = 16'h2e43;
              5'h09: pos_normal = 16'h2e44;
              5'h0a: pos_normal = 16'h2e45;
              5'h0b: pos_normal = 16'h2e46;
              5'h0c: pos_normal = 16'h2e47;
              5'h0d: pos_normal = 16'h2e48;
              5'h0e: pos_normal = 16'h2e49;
              5'h0f: pos_normal = 16'h2e4a;
              5'h10: pos_normal = 16'h2e4b;
              5'h11: pos_normal = 16'h2e4c;
              5'h12: pos_normal = 16'h2e4d;
              5'h13: pos_normal = 16'h2e4e;
              5'h14: pos_normal = 16'h2e4f;
              5'h15: pos_normal = 16'h2e50;
              5'h16: pos_normal = 16'h2e51;
              5'h17: pos_normal = 16'h2e52;
              5'h18: pos_normal = 16'h2e53;
              5'h19: pos_normal = 16'h2e54;
              5'h1a: pos_normal = 16'h2e55;
              5'h1b: pos_normal = 16'h2e56;
              5'h1c: pos_normal = 16'h2e57;
              5'h1d: pos_normal = 16'h2e58;
              5'h1e: pos_normal = 16'h2e59;
              5'h1f: pos_normal = 16'h2e5a;
              default: begin end
            endcase
          end
          5'h13: begin
            pos_normal = 16'h2e67;
            case (mant[4:0])
              5'h00: pos_normal = 16'h2e5b;
              5'h01: pos_normal = 16'h2e5c;
              5'h02: pos_normal = 16'h2e5d;
              5'h03: pos_normal = 16'h2e5e;
              5'h04: pos_normal = 16'h2e5f;
              5'h05: pos_normal = 16'h2e60;
              5'h06: pos_normal = 16'h2e61;
              5'h07: pos_normal = 16'h2e62;
              5'h08: pos_normal = 16'h2e63;
              5'h09: pos_normal = 16'h2e64;
              5'h0a: pos_normal = 16'h2e65;
              5'h0b: pos_normal = 16'h2e66;
              5'h0e: pos_normal = 16'h2e68;
              5'h0f: pos_normal = 16'h2e69;
              5'h10: pos_normal = 16'h2e6a;
              5'h11: pos_normal = 16'h2e6b;
              5'h12: pos_normal = 16'h2e6c;
              5'h13: pos_normal = 16'h2e6d;
              5'h14: pos_normal = 16'h2e6e;
              5'h15: pos_normal = 16'h2e6f;
              5'h16: pos_normal = 16'h2e70;
              5'h17: pos_normal = 16'h2e71;
              5'h18: pos_normal = 16'h2e72;
              5'h19: pos_normal = 16'h2e73;
              5'h1a: pos_normal = 16'h2e74;
              5'h1b: pos_normal = 16'h2e75;
              5'h1c: pos_normal = 16'h2e76;
              5'h1d: pos_normal = 16'h2e77;
              5'h1e: pos_normal = 16'h2e78;
              5'h1f: pos_normal = 16'h2e79;
              default: begin end
            endcase
          end
          5'h14: begin
            pos_normal = 16'h2e7a;
            case (mant[4:0])
              5'h01: pos_normal = 16'h2e7b;
              5'h02: pos_normal = 16'h2e7c;
              5'h03: pos_normal = 16'h2e7d;
              5'h04: pos_normal = 16'h2e7e;
              5'h05: pos_normal = 16'h2e7f;
              5'h06: pos_normal = 16'h2e80;
              5'h07: pos_normal = 16'h2e81;
              5'h08: pos_normal = 16'h2e82;
              5'h09: pos_normal = 16'h2e83;
              5'h0a: pos_normal = 16'h2e84;
              5'h0b: pos_normal = 16'h2e85;
              5'h0c: pos_normal = 16'h2e86;
              5'h0d: pos_normal = 16'h2e87;
              5'h0e: pos_normal = 16'h2e88;
              5'h0f: pos_normal = 16'h2e89;
              5'h10: pos_normal = 16'h2e8a;
              5'h11: pos_normal = 16'h2e8b;
              5'h12: pos_normal = 16'h2e8c;
              5'h13: pos_normal = 16'h2e8d;
              5'h14: pos_normal = 16'h2e8e;
              5'h15: pos_normal = 16'h2e8f;
              5'h16: pos_normal = 16'h2e90;
              5'h17: pos_normal = 16'h2e91;
              5'h18: pos_normal = 16'h2e92;
              5'h19: pos_normal = 16'h2e93;
              5'h1a: pos_normal = 16'h2e94;
              5'h1b: pos_normal = 16'h2e95;
              5'h1c: pos_normal = 16'h2e96;
              5'h1d: pos_normal = 16'h2e97;
              5'h1e: pos_normal = 16'h2e98;
              5'h1f: pos_normal = 16'h2e99;
              default: begin end
            endcase
          end
          5'h15: begin
            pos_normal = 16'h2e9a;
            case (mant[4:0])
              5'h01: pos_normal = 16'h2e9b;
              5'h02: pos_normal = 16'h2e9c;
              5'h03: pos_normal = 16'h2e9d;
              5'h04: pos_normal = 16'h2e9e;
              5'h05: pos_normal = 16'h2e9f;
              5'h06: pos_normal = 16'h2ea0;
              5'h07: pos_normal = 16'h2ea1;
              5'h08: pos_normal = 16'h2ea2;
              5'h09: pos_normal = 16'h2ea3;
              5'h0a: pos_normal = 16'h2ea4;
              5'h0b: pos_normal = 16'h2ea5;
              5'h0c: pos_normal = 16'h2ea6;
              5'h0d: pos_normal = 16'h2ea7;
              5'h0e: pos_normal = 16'h2ea8;
              5'h0f: pos_normal = 16'h2ea9;
              5'h10: pos_normal = 16'h2eaa;
              5'h11: pos_normal = 16'h2eab;
              5'h12: pos_normal = 16'h2eac;
              5'h13: pos_normal = 16'h2ead;
              5'h14: pos_normal = 16'h2eae;
              5'h15: pos_normal = 16'h2eaf;
              5'h16: pos_normal = 16'h2eb0;
              5'h17: pos_normal = 16'h2eb1;
              5'h18: pos_normal = 16'h2eb2;
              5'h19: pos_normal = 16'h2eb3;
              5'h1a: pos_normal = 16'h2eb4;
              5'h1b: pos_normal = 16'h2eb5;
              5'h1c: pos_normal = 16'h2eb6;
              5'h1d: pos_normal = 16'h2eb7;
              5'h1e: pos_normal = 16'h2eb8;
              5'h1f: pos_normal = 16'h2eb9;
              default: begin end
            endcase
          end
          5'h16: begin
            pos_normal = 16'h2ec4;
            case (mant[4:0])
              5'h00: pos_normal = 16'h2eba;
              5'h01: pos_normal = 16'h2ebb;
              5'h02: pos_normal = 16'h2ebc;
              5'h03: pos_normal = 16'h2ebd;
              5'h04: pos_normal = 16'h2ebe;
              5'h05: pos_normal = 16'h2ebf;
              5'h06: pos_normal = 16'h2ec0;
              5'h07: pos_normal = 16'h2ec1;
              5'h08: pos_normal = 16'h2ec2;
              5'h09: pos_normal = 16'h2ec3;
              5'h0c: pos_normal = 16'h2ec5;
              5'h0d: pos_normal = 16'h2ec6;
              5'h0e: pos_normal = 16'h2ec7;
              5'h0f: pos_normal = 16'h2ec8;
              5'h10: pos_normal = 16'h2ec9;
              5'h11: pos_normal = 16'h2eca;
              5'h12: pos_normal = 16'h2ecb;
              5'h13: pos_normal = 16'h2ecc;
              5'h14: pos_normal = 16'h2ecd;
              5'h15: pos_normal = 16'h2ece;
              5'h16: pos_normal = 16'h2ecf;
              5'h17: pos_normal = 16'h2ed0;
              5'h18: pos_normal = 16'h2ed1;
              5'h19: pos_normal = 16'h2ed2;
              5'h1a: pos_normal = 16'h2ed3;
              5'h1b: pos_normal = 16'h2ed4;
              5'h1c: pos_normal = 16'h2ed5;
              5'h1d: pos_normal = 16'h2ed6;
              5'h1e: pos_normal = 16'h2ed7;
              5'h1f: pos_normal = 16'h2ed8;
              default: begin end
            endcase
          end
          5'h17: begin
            pos_normal = 16'h2ed9;
            case (mant[4:0])
              5'h01: pos_normal = 16'h2eda;
              5'h02: pos_normal = 16'h2edb;
              5'h03: pos_normal = 16'h2edc;
              5'h04: pos_normal = 16'h2edd;
              5'h05: pos_normal = 16'h2ede;
              5'h06: pos_normal = 16'h2edf;
              5'h07: pos_normal = 16'h2ee0;
              5'h08: pos_normal = 16'h2ee1;
              5'h09: pos_normal = 16'h2ee2;
              5'h0a: pos_normal = 16'h2ee3;
              5'h0b: pos_normal = 16'h2ee4;
              5'h0c: pos_normal = 16'h2ee5;
              5'h0d: pos_normal = 16'h2ee6;
              5'h0e: pos_normal = 16'h2ee7;
              5'h0f: pos_normal = 16'h2ee8;
              5'h10: pos_normal = 16'h2ee9;
              5'h11: pos_normal = 16'h2eea;
              5'h12: pos_normal = 16'h2eeb;
              5'h13: pos_normal = 16'h2eec;
              5'h14: pos_normal = 16'h2eed;
              5'h15: pos_normal = 16'h2eee;
              5'h16: pos_normal = 16'h2eef;
              5'h17: pos_normal = 16'h2ef0;
              5'h18: pos_normal = 16'h2ef1;
              5'h19: pos_normal = 16'h2ef2;
              5'h1a: pos_normal = 16'h2ef3;
              5'h1b: pos_normal = 16'h2ef4;
              5'h1c: pos_normal = 16'h2ef5;
              5'h1d: pos_normal = 16'h2ef6;
              5'h1e: pos_normal = 16'h2ef7;
              5'h1f: pos_normal = 16'h2ef8;
              default: begin end
            endcase
          end
          5'h18: begin
            pos_normal = 16'h2ef9;
            case (mant[4:0])
              5'h01: pos_normal = 16'h2efa;
              5'h02: pos_normal = 16'h2efb;
              5'h03: pos_normal = 16'h2efc;
              5'h04: pos_normal = 16'h2efd;
              5'h05: pos_normal = 16'h2efe;
              5'h06: pos_normal = 16'h2eff;
              5'h07: pos_normal = 16'h2f00;
              5'h08: pos_normal = 16'h2f01;
              5'h09: pos_normal = 16'h2f02;
              5'h0a: pos_normal = 16'h2f03;
              5'h0b: pos_normal = 16'h2f04;
              5'h0c: pos_normal = 16'h2f05;
              5'h0d: pos_normal = 16'h2f06;
              5'h0e: pos_normal = 16'h2f07;
              5'h0f: pos_normal = 16'h2f08;
              5'h10: pos_normal = 16'h2f09;
              5'h11: pos_normal = 16'h2f0a;
              5'h12: pos_normal = 16'h2f0b;
              5'h13: pos_normal = 16'h2f0c;
              5'h14: pos_normal = 16'h2f0d;
              5'h15: pos_normal = 16'h2f0e;
              5'h16: pos_normal = 16'h2f0f;
              5'h17: pos_normal = 16'h2f10;
              5'h18: pos_normal = 16'h2f11;
              5'h19: pos_normal = 16'h2f12;
              5'h1a: pos_normal = 16'h2f13;
              5'h1b: pos_normal = 16'h2f14;
              5'h1c: pos_normal = 16'h2f15;
              5'h1d: pos_normal = 16'h2f16;
              5'h1e: pos_normal = 16'h2f17;
              5'h1f: pos_normal = 16'h2f18;
              default: begin end
            endcase
          end
          5'h19: begin
            pos_normal = 16'h2f19;
            case (mant[4:0])
              5'h02: pos_normal = 16'h2f1a;
              5'h03: pos_normal = 16'h2f1b;
              5'h04: pos_normal = 16'h2f1c;
              5'h05: pos_normal = 16'h2f1d;
              5'h06: pos_normal = 16'h2f1e;
              5'h07: pos_normal = 16'h2f1f;
              5'h08: pos_normal = 16'h2f20;
              5'h09: pos_normal = 16'h2f21;
              5'h0a: pos_normal = 16'h2f22;
              5'h0b: pos_normal = 16'h2f23;
              5'h0c: pos_normal = 16'h2f24;
              5'h0d: pos_normal = 16'h2f25;
              5'h0e: pos_normal = 16'h2f26;
              5'h0f: pos_normal = 16'h2f27;
              5'h10: pos_normal = 16'h2f28;
              5'h11: pos_normal = 16'h2f29;
              5'h12: pos_normal = 16'h2f2a;
              5'h13: pos_normal = 16'h2f2b;
              5'h14: pos_normal = 16'h2f2c;
              5'h15: pos_normal = 16'h2f2d;
              5'h16: pos_normal = 16'h2f2e;
              5'h17: pos_normal = 16'h2f2f;
              5'h18: pos_normal = 16'h2f30;
              5'h19: pos_normal = 16'h2f31;
              5'h1a: pos_normal = 16'h2f32;
              5'h1b: pos_normal = 16'h2f33;
              5'h1c: pos_normal = 16'h2f34;
              5'h1d: pos_normal = 16'h2f35;
              5'h1e: pos_normal = 16'h2f36;
              5'h1f: pos_normal = 16'h2f37;
              default: begin end
            endcase
          end
          5'h1a: begin
            pos_normal = 16'h2f38;
            case (mant[4:0])
              5'h01: pos_normal = 16'h2f39;
              5'h02: pos_normal = 16'h2f3a;
              5'h03: pos_normal = 16'h2f3b;
              5'h04: pos_normal = 16'h2f3c;
              5'h05: pos_normal = 16'h2f3d;
              5'h06: pos_normal = 16'h2f3e;
              5'h07: pos_normal = 16'h2f3f;
              5'h08: pos_normal = 16'h2f40;
              5'h09: pos_normal = 16'h2f41;
              5'h0a: pos_normal = 16'h2f42;
              5'h0b: pos_normal = 16'h2f43;
              5'h0c: pos_normal = 16'h2f44;
              5'h0d: pos_normal = 16'h2f45;
              5'h0e: pos_normal = 16'h2f46;
              5'h0f: pos_normal = 16'h2f47;
              5'h10: pos_normal = 16'h2f48;
              5'h11: pos_normal = 16'h2f49;
              5'h12: pos_normal = 16'h2f4a;
              5'h13: pos_normal = 16'h2f4b;
              5'h14: pos_normal = 16'h2f4c;
              5'h15: pos_normal = 16'h2f4d;
              5'h16: pos_normal = 16'h2f4e;
              5'h17: pos_normal = 16'h2f4f;
              5'h18: pos_normal = 16'h2f50;
              5'h19: pos_normal = 16'h2f51;
              5'h1a: pos_normal = 16'h2f52;
              5'h1b: pos_normal = 16'h2f53;
              5'h1c: pos_normal = 16'h2f54;
              5'h1d: pos_normal = 16'h2f55;
              5'h1e: pos_normal = 16'h2f56;
              5'h1f: pos_normal = 16'h2f57;
              default: begin end
            endcase
          end
          5'h1b: begin
            pos_normal = 16'h2f66;
            case (mant[4:0])
              5'h00: pos_normal = 16'h2f58;
              5'h01: pos_normal = 16'h2f59;
              5'h02: pos_normal = 16'h2f5a;
              5'h03: pos_normal = 16'h2f5b;
              5'h04: pos_normal = 16'h2f5c;
              5'h05: pos_normal = 16'h2f5d;
              5'h06: pos_normal = 16'h2f5e;
              5'h07: pos_normal = 16'h2f5f;
              5'h08: pos_normal = 16'h2f60;
              5'h09: pos_normal = 16'h2f61;
              5'h0a: pos_normal = 16'h2f62;
              5'h0b: pos_normal = 16'h2f63;
              5'h0c: pos_normal = 16'h2f64;
              5'h0d: pos_normal = 16'h2f65;
              5'h10: pos_normal = 16'h2f67;
              5'h11: pos_normal = 16'h2f68;
              5'h12: pos_normal = 16'h2f69;
              5'h13: pos_normal = 16'h2f6a;
              5'h14: pos_normal = 16'h2f6b;
              5'h15: pos_normal = 16'h2f6c;
              5'h16: pos_normal = 16'h2f6d;
              5'h17: pos_normal = 16'h2f6e;
              5'h18: pos_normal = 16'h2f6f;
              5'h19: pos_normal = 16'h2f70;
              5'h1a: pos_normal = 16'h2f71;
              5'h1b: pos_normal = 16'h2f72;
              5'h1c: pos_normal = 16'h2f73;
              5'h1d: pos_normal = 16'h2f74;
              5'h1e: pos_normal = 16'h2f75;
              5'h1f: pos_normal = 16'h2f76;
              default: begin end
            endcase
          end
          5'h1c: begin
            pos_normal = 16'h2f77;
            case (mant[4:0])
              5'h01: pos_normal = 16'h2f78;
              5'h02: pos_normal = 16'h2f79;
              5'h03: pos_normal = 16'h2f7a;
              5'h04: pos_normal = 16'h2f7b;
              5'h05: pos_normal = 16'h2f7c;
              5'h06: pos_normal = 16'h2f7d;
              5'h07: pos_normal = 16'h2f7e;
              5'h08: pos_normal = 16'h2f7f;
              5'h09: pos_normal = 16'h2f80;
              5'h0a: pos_normal = 16'h2f81;
              5'h0b: pos_normal = 16'h2f82;
              5'h0c: pos_normal = 16'h2f83;
              5'h0d: pos_normal = 16'h2f84;
              5'h0e: pos_normal = 16'h2f85;
              5'h0f: pos_normal = 16'h2f86;
              5'h10: pos_normal = 16'h2f87;
              5'h11: pos_normal = 16'h2f88;
              5'h12: pos_normal = 16'h2f89;
              5'h13: pos_normal = 16'h2f8a;
              5'h14: pos_normal = 16'h2f8b;
              5'h15: pos_normal = 16'h2f8c;
              5'h16: pos_normal = 16'h2f8d;
              5'h17: pos_normal = 16'h2f8e;
              5'h18: pos_normal = 16'h2f8f;
              5'h19: pos_normal = 16'h2f90;
              5'h1a: pos_normal = 16'h2f91;
              5'h1b: pos_normal = 16'h2f92;
              5'h1c: pos_normal = 16'h2f93;
              5'h1d: pos_normal = 16'h2f94;
              5'h1e: pos_normal = 16'h2f95;
              5'h1f: pos_normal = 16'h2f96;
              default: begin end
            endcase
          end
          5'h1d: begin
            pos_normal = 16'h2fad;
            case (mant[4:0])
              5'h00: pos_normal = 16'h2f97;
              5'h01: pos_normal = 16'h2f98;
              5'h02: pos_normal = 16'h2f99;
              5'h03: pos_normal = 16'h2f9a;
              5'h04: pos_normal = 16'h2f9b;
              5'h05: pos_normal = 16'h2f9c;
              5'h06: pos_normal = 16'h2f9d;
              5'h07: pos_normal = 16'h2f9e;
              5'h08: pos_normal = 16'h2f9f;
              5'h09: pos_normal = 16'h2fa0;
              5'h0a: pos_normal = 16'h2fa1;
              5'h0b: pos_normal = 16'h2fa2;
              5'h0c: pos_normal = 16'h2fa3;
              5'h0d: pos_normal = 16'h2fa4;
              5'h0e: pos_normal = 16'h2fa5;
              5'h0f: pos_normal = 16'h2fa6;
              5'h10: pos_normal = 16'h2fa7;
              5'h11: pos_normal = 16'h2fa8;
              5'h12: pos_normal = 16'h2fa9;
              5'h13: pos_normal = 16'h2faa;
              5'h14: pos_normal = 16'h2fab;
              5'h15: pos_normal = 16'h2fac;
              5'h18: pos_normal = 16'h2fae;
              5'h19: pos_normal = 16'h2faf;
              5'h1a: pos_normal = 16'h2fb0;
              5'h1b: pos_normal = 16'h2fb1;
              5'h1c: pos_normal = 16'h2fb2;
              5'h1d: pos_normal = 16'h2fb3;
              5'h1e: pos_normal = 16'h2fb4;
              5'h1f: pos_normal = 16'h2fb5;
              default: begin end
            endcase
          end
          5'h1e: begin
            pos_normal = 16'h2fb6;
            case (mant[4:0])
              5'h01: pos_normal = 16'h2fb7;
              5'h02: pos_normal = 16'h2fb8;
              5'h03: pos_normal = 16'h2fb9;
              5'h04: pos_normal = 16'h2fba;
              5'h05: pos_normal = 16'h2fbb;
              5'h06: pos_normal = 16'h2fbc;
              5'h07: pos_normal = 16'h2fbd;
              5'h08: pos_normal = 16'h2fbe;
              5'h09: pos_normal = 16'h2fbf;
              5'h0a: pos_normal = 16'h2fc0;
              5'h0b: pos_normal = 16'h2fc1;
              5'h0c: pos_normal = 16'h2fc2;
              5'h0d: pos_normal = 16'h2fc3;
              5'h0e: pos_normal = 16'h2fc4;
              5'h0f: pos_normal = 16'h2fc5;
              5'h10: pos_normal = 16'h2fc6;
              5'h11: pos_normal = 16'h2fc7;
              5'h12: pos_normal = 16'h2fc8;
              5'h13: pos_normal = 16'h2fc9;
              5'h14: pos_normal = 16'h2fca;
              5'h15: pos_normal = 16'h2fcb;
              5'h16: pos_normal = 16'h2fcc;
              5'h17: pos_normal = 16'h2fcd;
              5'h18: pos_normal = 16'h2fce;
              5'h19: pos_normal = 16'h2fcf;
              5'h1a: pos_normal = 16'h2fd0;
              5'h1b: pos_normal = 16'h2fd1;
              5'h1c: pos_normal = 16'h2fd2;
              5'h1d: pos_normal = 16'h2fd3;
              5'h1e: pos_normal = 16'h2fd4;
              5'h1f: pos_normal = 16'h2fd5;
              default: begin end
            endcase
          end
          5'h1f: begin
            pos_normal = 16'h2fef;
            case (mant[4:0])
              5'h00: pos_normal = 16'h2fd6;
              5'h01: pos_normal = 16'h2fd7;
              5'h02: pos_normal = 16'h2fd8;
              5'h03: pos_normal = 16'h2fd9;
              5'h04: pos_normal = 16'h2fda;
              5'h05: pos_normal = 16'h2fdb;
              5'h06: pos_normal = 16'h2fdc;
              5'h07: pos_normal = 16'h2fdd;
              5'h08: pos_normal = 16'h2fde;
              5'h09: pos_normal = 16'h2fdf;
              5'h0a: pos_normal = 16'h2fe0;
              5'h0b: pos_normal = 16'h2fe1;
              5'h0c: pos_normal = 16'h2fe2;
              5'h0d: pos_normal = 16'h2fe3;
              5'h0e: pos_normal = 16'h2fe4;
              5'h0f: pos_normal = 16'h2fe5;
              5'h10: pos_normal = 16'h2fe6;
              5'h11: pos_normal = 16'h2fe7;
              5'h12: pos_normal = 16'h2fe8;
              5'h13: pos_normal = 16'h2fe9;
              5'h14: pos_normal = 16'h2fea;
              5'h15: pos_normal = 16'h2feb;
              5'h16: pos_normal = 16'h2fec;
              5'h17: pos_normal = 16'h2fed;
              5'h18: pos_normal = 16'h2fee;
              5'h1b: pos_normal = 16'h2ff0;
              5'h1c: pos_normal = 16'h2ff1;
              5'h1d: pos_normal = 16'h2ff2;
              5'h1e: pos_normal = 16'h2ff3;
              5'h1f: pos_normal = 16'h2ff4;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      5'h0c: begin
        case (mant[9:5])
          5'h00: begin
            pos_normal = 16'h3007;
            case (mant[4:0])
              5'h00: pos_normal = 16'h2ff5;
              5'h01: pos_normal = 16'h2ff7;
              5'h02: pos_normal = 16'h2ff9;
              5'h03: pos_normal = 16'h2ffb;
              5'h04: pos_normal = 16'h2ffd;
              5'h05: pos_normal = 16'h2fff;
              5'h06: pos_normal = 16'h3001;
              5'h07: pos_normal = 16'h3002;
              5'h08: pos_normal = 16'h3003;
              5'h09: pos_normal = 16'h3004;
              5'h0a: pos_normal = 16'h3005;
              5'h0b: pos_normal = 16'h3006;
              5'h0e: pos_normal = 16'h3008;
              5'h0f: pos_normal = 16'h3009;
              5'h10: pos_normal = 16'h300a;
              5'h11: pos_normal = 16'h300b;
              5'h12: pos_normal = 16'h300c;
              5'h13: pos_normal = 16'h300d;
              5'h14: pos_normal = 16'h300e;
              5'h15: pos_normal = 16'h300f;
              5'h16: pos_normal = 16'h3010;
              5'h17: pos_normal = 16'h3011;
              5'h18: pos_normal = 16'h3012;
              5'h19: pos_normal = 16'h3013;
              5'h1a: pos_normal = 16'h3014;
              5'h1b: pos_normal = 16'h3015;
              5'h1c: pos_normal = 16'h3016;
              5'h1d: pos_normal = 16'h3017;
              5'h1e: pos_normal = 16'h3018;
              5'h1f: pos_normal = 16'h3019;
              default: begin end
            endcase
          end
          5'h01: begin
            pos_normal = 16'h301a;
            case (mant[4:0])
              5'h01: pos_normal = 16'h301b;
              5'h02: pos_normal = 16'h301c;
              5'h03: pos_normal = 16'h301d;
              5'h04: pos_normal = 16'h301e;
              5'h05: pos_normal = 16'h301f;
              5'h06: pos_normal = 16'h3020;
              5'h07: pos_normal = 16'h3021;
              5'h08: pos_normal = 16'h3022;
              5'h09: pos_normal = 16'h3023;
              5'h0a: pos_normal = 16'h3024;
              5'h0b: pos_normal = 16'h3025;
              5'h0c: pos_normal = 16'h3026;
              5'h0d: pos_normal = 16'h3027;
              5'h0e: pos_normal = 16'h3028;
              5'h0f: pos_normal = 16'h3029;
              5'h10: pos_normal = 16'h302a;
              5'h11: pos_normal = 16'h302b;
              5'h12: pos_normal = 16'h302c;
              5'h13: pos_normal = 16'h302d;
              5'h14: pos_normal = 16'h302e;
              5'h15: pos_normal = 16'h302f;
              5'h16: pos_normal = 16'h3030;
              5'h17: pos_normal = 16'h3031;
              5'h18: pos_normal = 16'h3032;
              5'h19: pos_normal = 16'h3033;
              5'h1a: pos_normal = 16'h3034;
              5'h1b: pos_normal = 16'h3035;
              5'h1c: pos_normal = 16'h3036;
              5'h1d: pos_normal = 16'h3037;
              5'h1e: pos_normal = 16'h3038;
              5'h1f: pos_normal = 16'h3039;
              default: begin end
            endcase
          end
          5'h02: begin
            pos_normal = 16'h3042;
            case (mant[4:0])
              5'h00: pos_normal = 16'h303a;
              5'h01: pos_normal = 16'h303b;
              5'h02: pos_normal = 16'h303c;
              5'h03: pos_normal = 16'h303d;
              5'h04: pos_normal = 16'h303e;
              5'h05: pos_normal = 16'h303f;
              5'h06: pos_normal = 16'h3040;
              5'h07: pos_normal = 16'h3041;
              5'h0a: pos_normal = 16'h3043;
              5'h0b: pos_normal = 16'h3044;
              5'h0c: pos_normal = 16'h3045;
              5'h0d: pos_normal = 16'h3046;
              5'h0e: pos_normal = 16'h3047;
              5'h0f: pos_normal = 16'h3048;
              5'h10: pos_normal = 16'h3049;
              5'h11: pos_normal = 16'h304a;
              5'h12: pos_normal = 16'h304b;
              5'h13: pos_normal = 16'h304c;
              5'h14: pos_normal = 16'h304d;
              5'h15: pos_normal = 16'h304e;
              5'h16: pos_normal = 16'h304f;
              5'h17: pos_normal = 16'h3050;
              5'h18: pos_normal = 16'h3051;
              5'h19: pos_normal = 16'h3052;
              5'h1a: pos_normal = 16'h3053;
              5'h1b: pos_normal = 16'h3054;
              5'h1c: pos_normal = 16'h3055;
              5'h1d: pos_normal = 16'h3056;
              5'h1e: pos_normal = 16'h3057;
              5'h1f: pos_normal = 16'h3058;
              default: begin end
            endcase
          end
          5'h03: begin
            pos_normal = 16'h3077;
            case (mant[4:0])
              5'h00: pos_normal = 16'h3059;
              5'h01: pos_normal = 16'h305a;
              5'h02: pos_normal = 16'h305b;
              5'h03: pos_normal = 16'h305c;
              5'h04: pos_normal = 16'h305d;
              5'h05: pos_normal = 16'h305e;
              5'h06: pos_normal = 16'h305f;
              5'h07: pos_normal = 16'h3060;
              5'h08: pos_normal = 16'h3061;
              5'h09: pos_normal = 16'h3062;
              5'h0a: pos_normal = 16'h3063;
              5'h0b: pos_normal = 16'h3064;
              5'h0c: pos_normal = 16'h3065;
              5'h0d: pos_normal = 16'h3066;
              5'h0e: pos_normal = 16'h3067;
              5'h0f: pos_normal = 16'h3068;
              5'h10: pos_normal = 16'h3069;
              5'h11: pos_normal = 16'h306a;
              5'h12: pos_normal = 16'h306b;
              5'h13: pos_normal = 16'h306c;
              5'h14: pos_normal = 16'h306d;
              5'h15: pos_normal = 16'h306e;
              5'h16: pos_normal = 16'h306f;
              5'h17: pos_normal = 16'h3070;
              5'h18: pos_normal = 16'h3071;
              5'h19: pos_normal = 16'h3072;
              5'h1a: pos_normal = 16'h3073;
              5'h1b: pos_normal = 16'h3074;
              5'h1c: pos_normal = 16'h3075;
              5'h1d: pos_normal = 16'h3076;
              default: begin end
            endcase
          end
          5'h04: begin
            pos_normal = 16'h3078;
            case (mant[4:0])
              5'h01: pos_normal = 16'h3079;
              5'h02: pos_normal = 16'h307a;
              5'h03: pos_normal = 16'h307b;
              5'h04: pos_normal = 16'h307c;
              5'h05: pos_normal = 16'h307d;
              5'h06: pos_normal = 16'h307e;
              5'h07: pos_normal = 16'h307f;
              5'h08: pos_normal = 16'h3080;
              5'h09: pos_normal = 16'h3081;
              5'h0a: pos_normal = 16'h3082;
              5'h0b: pos_normal = 16'h3083;
              5'h0c: pos_normal = 16'h3084;
              5'h0d: pos_normal = 16'h3085;
              5'h0e: pos_normal = 16'h3086;
              5'h0f: pos_normal = 16'h3087;
              5'h10: pos_normal = 16'h3088;
              5'h11: pos_normal = 16'h3089;
              5'h12: pos_normal = 16'h308a;
              5'h13: pos_normal = 16'h308b;
              5'h14: pos_normal = 16'h308c;
              5'h15: pos_normal = 16'h308d;
              5'h16: pos_normal = 16'h308e;
              5'h17: pos_normal = 16'h308f;
              5'h18: pos_normal = 16'h3090;
              5'h19: pos_normal = 16'h3091;
              5'h1a: pos_normal = 16'h3092;
              5'h1b: pos_normal = 16'h3093;
              5'h1c: pos_normal = 16'h3094;
              5'h1d: pos_normal = 16'h3095;
              5'h1e: pos_normal = 16'h3096;
              5'h1f: pos_normal = 16'h3097;
              default: begin end
            endcase
          end
          5'h05: begin
            pos_normal = 16'h30a7;
            case (mant[4:0])
              5'h00: pos_normal = 16'h3098;
              5'h01: pos_normal = 16'h3099;
              5'h02: pos_normal = 16'h309a;
              5'h03: pos_normal = 16'h309b;
              5'h04: pos_normal = 16'h309c;
              5'h05: pos_normal = 16'h309d;
              5'h06: pos_normal = 16'h309e;
              5'h07: pos_normal = 16'h309f;
              5'h08: pos_normal = 16'h30a0;
              5'h09: pos_normal = 16'h30a1;
              5'h0a: pos_normal = 16'h30a2;
              5'h0b: pos_normal = 16'h30a3;
              5'h0c: pos_normal = 16'h30a4;
              5'h0d: pos_normal = 16'h30a5;
              5'h0e: pos_normal = 16'h30a6;
              5'h11: pos_normal = 16'h30a8;
              5'h12: pos_normal = 16'h30a9;
              5'h13: pos_normal = 16'h30aa;
              5'h14: pos_normal = 16'h30ab;
              5'h15: pos_normal = 16'h30ac;
              5'h16: pos_normal = 16'h30ad;
              5'h17: pos_normal = 16'h30ae;
              5'h18: pos_normal = 16'h30af;
              5'h19: pos_normal = 16'h30b0;
              5'h1a: pos_normal = 16'h30b1;
              5'h1b: pos_normal = 16'h30b2;
              5'h1c: pos_normal = 16'h30b3;
              5'h1d: pos_normal = 16'h30b4;
              5'h1e: pos_normal = 16'h30b5;
              5'h1f: pos_normal = 16'h30b6;
              default: begin end
            endcase
          end
          5'h06: begin
            pos_normal = 16'h30d4;
            case (mant[4:0])
              5'h00: pos_normal = 16'h30b7;
              5'h01: pos_normal = 16'h30b8;
              5'h02: pos_normal = 16'h30b9;
              5'h03: pos_normal = 16'h30ba;
              5'h04: pos_normal = 16'h30bb;
              5'h05: pos_normal = 16'h30bc;
              5'h06: pos_normal = 16'h30bd;
              5'h07: pos_normal = 16'h30be;
              5'h08: pos_normal = 16'h30bf;
              5'h09: pos_normal = 16'h30c0;
              5'h0a: pos_normal = 16'h30c1;
              5'h0b: pos_normal = 16'h30c2;
              5'h0c: pos_normal = 16'h30c3;
              5'h0d: pos_normal = 16'h30c4;
              5'h0e: pos_normal = 16'h30c5;
              5'h0f: pos_normal = 16'h30c6;
              5'h10: pos_normal = 16'h30c7;
              5'h11: pos_normal = 16'h30c8;
              5'h12: pos_normal = 16'h30c9;
              5'h13: pos_normal = 16'h30ca;
              5'h14: pos_normal = 16'h30cb;
              5'h15: pos_normal = 16'h30cc;
              5'h16: pos_normal = 16'h30cd;
              5'h17: pos_normal = 16'h30ce;
              5'h18: pos_normal = 16'h30cf;
              5'h19: pos_normal = 16'h30d0;
              5'h1a: pos_normal = 16'h30d1;
              5'h1b: pos_normal = 16'h30d2;
              5'h1c: pos_normal = 16'h30d3;
              5'h1f: pos_normal = 16'h30d5;
              default: begin end
            endcase
          end
          5'h07: begin
            pos_normal = 16'h30d6;
            case (mant[4:0])
              5'h01: pos_normal = 16'h30d7;
              5'h02: pos_normal = 16'h30d8;
              5'h03: pos_normal = 16'h30d9;
              5'h04: pos_normal = 16'h30da;
              5'h05: pos_normal = 16'h30db;
              5'h06: pos_normal = 16'h30dc;
              5'h07: pos_normal = 16'h30dd;
              5'h08: pos_normal = 16'h30de;
              5'h09: pos_normal = 16'h30df;
              5'h0a: pos_normal = 16'h30e0;
              5'h0b: pos_normal = 16'h30e1;
              5'h0c: pos_normal = 16'h30e2;
              5'h0d: pos_normal = 16'h30e3;
              5'h0e: pos_normal = 16'h30e4;
              5'h0f: pos_normal = 16'h30e5;
              5'h10: pos_normal = 16'h30e6;
              5'h11: pos_normal = 16'h30e7;
              5'h12: pos_normal = 16'h30e8;
              5'h13: pos_normal = 16'h30e9;
              5'h14: pos_normal = 16'h30ea;
              5'h15: pos_normal = 16'h30eb;
              5'h16: pos_normal = 16'h30ec;
              5'h17: pos_normal = 16'h30ed;
              5'h18: pos_normal = 16'h30ee;
              5'h19: pos_normal = 16'h30ef;
              5'h1a: pos_normal = 16'h30f0;
              5'h1b: pos_normal = 16'h30f1;
              5'h1c: pos_normal = 16'h30f2;
              5'h1d: pos_normal = 16'h30f3;
              5'h1e: pos_normal = 16'h30f4;
              5'h1f: pos_normal = 16'h30f5;
              default: begin end
            endcase
          end
          5'h08: begin
            pos_normal = 16'h30fd;
            case (mant[4:0])
              5'h00: pos_normal = 16'h30f6;
              5'h01: pos_normal = 16'h30f7;
              5'h02: pos_normal = 16'h30f8;
              5'h03: pos_normal = 16'h30f9;
              5'h04: pos_normal = 16'h30fa;
              5'h05: pos_normal = 16'h30fb;
              5'h06: pos_normal = 16'h30fc;
              5'h09: pos_normal = 16'h30fe;
              5'h0a: pos_normal = 16'h30ff;
              5'h0b: pos_normal = 16'h3100;
              5'h0c: pos_normal = 16'h3101;
              5'h0d: pos_normal = 16'h3102;
              5'h0e: pos_normal = 16'h3103;
              5'h0f: pos_normal = 16'h3104;
              5'h10: pos_normal = 16'h3105;
              5'h11: pos_normal = 16'h3106;
              5'h12: pos_normal = 16'h3107;
              5'h13: pos_normal = 16'h3108;
              5'h14: pos_normal = 16'h3109;
              5'h15: pos_normal = 16'h310a;
              5'h16: pos_normal = 16'h310b;
              5'h17: pos_normal = 16'h310c;
              5'h18: pos_normal = 16'h310d;
              5'h19: pos_normal = 16'h310e;
              5'h1a: pos_normal = 16'h310f;
              5'h1b: pos_normal = 16'h3110;
              5'h1c: pos_normal = 16'h3111;
              5'h1d: pos_normal = 16'h3112;
              5'h1e: pos_normal = 16'h3113;
              5'h1f: pos_normal = 16'h3114;
              default: begin end
            endcase
          end
          5'h09: begin
            pos_normal = 16'h3124;
            case (mant[4:0])
              5'h00: pos_normal = 16'h3115;
              5'h01: pos_normal = 16'h3116;
              5'h02: pos_normal = 16'h3117;
              5'h03: pos_normal = 16'h3118;
              5'h04: pos_normal = 16'h3119;
              5'h05: pos_normal = 16'h311a;
              5'h06: pos_normal = 16'h311b;
              5'h07: pos_normal = 16'h311c;
              5'h08: pos_normal = 16'h311d;
              5'h09: pos_normal = 16'h311e;
              5'h0a: pos_normal = 16'h311f;
              5'h0b: pos_normal = 16'h3120;
              5'h0c: pos_normal = 16'h3121;
              5'h0d: pos_normal = 16'h3122;
              5'h0e: pos_normal = 16'h3123;
              5'h11: pos_normal = 16'h3125;
              5'h12: pos_normal = 16'h3126;
              5'h13: pos_normal = 16'h3127;
              5'h14: pos_normal = 16'h3128;
              5'h15: pos_normal = 16'h3129;
              5'h16: pos_normal = 16'h312a;
              5'h17: pos_normal = 16'h312b;
              5'h18: pos_normal = 16'h312c;
              5'h19: pos_normal = 16'h312d;
              5'h1a: pos_normal = 16'h312e;
              5'h1b: pos_normal = 16'h312f;
              5'h1c: pos_normal = 16'h3130;
              5'h1d: pos_normal = 16'h3131;
              5'h1e: pos_normal = 16'h3132;
              5'h1f: pos_normal = 16'h3133;
              default: begin end
            endcase
          end
          5'h0a: begin
            pos_normal = 16'h3149;
            case (mant[4:0])
              5'h00: pos_normal = 16'h3134;
              5'h01: pos_normal = 16'h3135;
              5'h02: pos_normal = 16'h3136;
              5'h03: pos_normal = 16'h3137;
              5'h04: pos_normal = 16'h3138;
              5'h05: pos_normal = 16'h3139;
              5'h06: pos_normal = 16'h313a;
              5'h07: pos_normal = 16'h313b;
              5'h08: pos_normal = 16'h313c;
              5'h09: pos_normal = 16'h313d;
              5'h0a: pos_normal = 16'h313e;
              5'h0b: pos_normal = 16'h313f;
              5'h0c: pos_normal = 16'h3140;
              5'h0d: pos_normal = 16'h3141;
              5'h0e: pos_normal = 16'h3142;
              5'h0f: pos_normal = 16'h3143;
              5'h10: pos_normal = 16'h3144;
              5'h11: pos_normal = 16'h3145;
              5'h12: pos_normal = 16'h3146;
              5'h13: pos_normal = 16'h3147;
              5'h14: pos_normal = 16'h3148;
              5'h17: pos_normal = 16'h314a;
              5'h18: pos_normal = 16'h314b;
              5'h19: pos_normal = 16'h314c;
              5'h1a: pos_normal = 16'h314d;
              5'h1b: pos_normal = 16'h314e;
              5'h1c: pos_normal = 16'h314f;
              5'h1d: pos_normal = 16'h3150;
              5'h1e: pos_normal = 16'h3151;
              5'h1f: pos_normal = 16'h3152;
              default: begin end
            endcase
          end
          5'h0b: begin
            pos_normal = 16'h316b;
            case (mant[4:0])
              5'h00: pos_normal = 16'h3153;
              5'h01: pos_normal = 16'h3154;
              5'h02: pos_normal = 16'h3155;
              5'h03: pos_normal = 16'h3156;
              5'h04: pos_normal = 16'h3157;
              5'h05: pos_normal = 16'h3158;
              5'h06: pos_normal = 16'h3159;
              5'h07: pos_normal = 16'h315a;
              5'h08: pos_normal = 16'h315b;
              5'h09: pos_normal = 16'h315c;
              5'h0a: pos_normal = 16'h315d;
              5'h0b: pos_normal = 16'h315e;
              5'h0c: pos_normal = 16'h315f;
              5'h0d: pos_normal = 16'h3160;
              5'h0e: pos_normal = 16'h3161;
              5'h0f: pos_normal = 16'h3162;
              5'h10: pos_normal = 16'h3163;
              5'h11: pos_normal = 16'h3164;
              5'h12: pos_normal = 16'h3165;
              5'h13: pos_normal = 16'h3166;
              5'h14: pos_normal = 16'h3167;
              5'h15: pos_normal = 16'h3168;
              5'h16: pos_normal = 16'h3169;
              5'h17: pos_normal = 16'h316a;
              5'h1a: pos_normal = 16'h316c;
              5'h1b: pos_normal = 16'h316d;
              5'h1c: pos_normal = 16'h316e;
              5'h1d: pos_normal = 16'h316f;
              5'h1e: pos_normal = 16'h3170;
              5'h1f: pos_normal = 16'h3171;
              default: begin end
            endcase
          end
          5'h0c: begin
            pos_normal = 16'h318d;
            case (mant[4:0])
              5'h00: pos_normal = 16'h3172;
              5'h01: pos_normal = 16'h3173;
              5'h02: pos_normal = 16'h3174;
              5'h03: pos_normal = 16'h3175;
              5'h04: pos_normal = 16'h3176;
              5'h05: pos_normal = 16'h3177;
              5'h06: pos_normal = 16'h3178;
              5'h07: pos_normal = 16'h3179;
              5'h08: pos_normal = 16'h317a;
              5'h09: pos_normal = 16'h317b;
              5'h0a: pos_normal = 16'h317c;
              5'h0b: pos_normal = 16'h317d;
              5'h0c: pos_normal = 16'h317e;
              5'h0d: pos_normal = 16'h317f;
              5'h0e: pos_normal = 16'h3180;
              5'h0f: pos_normal = 16'h3181;
              5'h10: pos_normal = 16'h3182;
              5'h11: pos_normal = 16'h3183;
              5'h12: pos_normal = 16'h3184;
              5'h13: pos_normal = 16'h3185;
              5'h14: pos_normal = 16'h3186;
              5'h15: pos_normal = 16'h3187;
              5'h16: pos_normal = 16'h3188;
              5'h17: pos_normal = 16'h3189;
              5'h18: pos_normal = 16'h318a;
              5'h19: pos_normal = 16'h318b;
              5'h1a: pos_normal = 16'h318c;
              5'h1d: pos_normal = 16'h318e;
              5'h1e: pos_normal = 16'h318f;
              5'h1f: pos_normal = 16'h3190;
              default: begin end
            endcase
          end
          5'h0d: begin
            pos_normal = 16'h31ac;
            case (mant[4:0])
              5'h00: pos_normal = 16'h3191;
              5'h01: pos_normal = 16'h3192;
              5'h02: pos_normal = 16'h3193;
              5'h03: pos_normal = 16'h3194;
              5'h04: pos_normal = 16'h3195;
              5'h05: pos_normal = 16'h3196;
              5'h06: pos_normal = 16'h3197;
              5'h07: pos_normal = 16'h3198;
              5'h08: pos_normal = 16'h3199;
              5'h09: pos_normal = 16'h319a;
              5'h0a: pos_normal = 16'h319b;
              5'h0b: pos_normal = 16'h319c;
              5'h0c: pos_normal = 16'h319d;
              5'h0d: pos_normal = 16'h319e;
              5'h0e: pos_normal = 16'h319f;
              5'h0f: pos_normal = 16'h31a0;
              5'h10: pos_normal = 16'h31a1;
              5'h11: pos_normal = 16'h31a2;
              5'h12: pos_normal = 16'h31a3;
              5'h13: pos_normal = 16'h31a4;
              5'h14: pos_normal = 16'h31a5;
              5'h15: pos_normal = 16'h31a6;
              5'h16: pos_normal = 16'h31a7;
              5'h17: pos_normal = 16'h31a8;
              5'h18: pos_normal = 16'h31a9;
              5'h19: pos_normal = 16'h31aa;
              5'h1a: pos_normal = 16'h31ab;
              5'h1d: pos_normal = 16'h31ad;
              5'h1e: pos_normal = 16'h31ae;
              5'h1f: pos_normal = 16'h31af;
              default: begin end
            endcase
          end
          5'h0e: begin
            pos_normal = 16'h31ca;
            case (mant[4:0])
              5'h00: pos_normal = 16'h31b0;
              5'h01: pos_normal = 16'h31b1;
              5'h02: pos_normal = 16'h31b2;
              5'h03: pos_normal = 16'h31b3;
              5'h04: pos_normal = 16'h31b4;
              5'h05: pos_normal = 16'h31b5;
              5'h06: pos_normal = 16'h31b6;
              5'h07: pos_normal = 16'h31b7;
              5'h08: pos_normal = 16'h31b8;
              5'h09: pos_normal = 16'h31b9;
              5'h0a: pos_normal = 16'h31ba;
              5'h0b: pos_normal = 16'h31bb;
              5'h0c: pos_normal = 16'h31bc;
              5'h0d: pos_normal = 16'h31bd;
              5'h0e: pos_normal = 16'h31be;
              5'h0f: pos_normal = 16'h31bf;
              5'h10: pos_normal = 16'h31c0;
              5'h11: pos_normal = 16'h31c1;
              5'h12: pos_normal = 16'h31c2;
              5'h13: pos_normal = 16'h31c3;
              5'h14: pos_normal = 16'h31c4;
              5'h15: pos_normal = 16'h31c5;
              5'h16: pos_normal = 16'h31c6;
              5'h17: pos_normal = 16'h31c7;
              5'h18: pos_normal = 16'h31c8;
              5'h19: pos_normal = 16'h31c9;
              5'h1c: pos_normal = 16'h31cb;
              5'h1d: pos_normal = 16'h31cc;
              5'h1e: pos_normal = 16'h31cd;
              5'h1f: pos_normal = 16'h31ce;
              default: begin end
            endcase
          end
          5'h0f: begin
            pos_normal = 16'h31e7;
            case (mant[4:0])
              5'h00: pos_normal = 16'h31cf;
              5'h01: pos_normal = 16'h31d0;
              5'h02: pos_normal = 16'h31d1;
              5'h03: pos_normal = 16'h31d2;
              5'h04: pos_normal = 16'h31d3;
              5'h05: pos_normal = 16'h31d4;
              5'h06: pos_normal = 16'h31d5;
              5'h07: pos_normal = 16'h31d6;
              5'h08: pos_normal = 16'h31d7;
              5'h09: pos_normal = 16'h31d8;
              5'h0a: pos_normal = 16'h31d9;
              5'h0b: pos_normal = 16'h31da;
              5'h0c: pos_normal = 16'h31db;
              5'h0d: pos_normal = 16'h31dc;
              5'h0e: pos_normal = 16'h31dd;
              5'h0f: pos_normal = 16'h31de;
              5'h10: pos_normal = 16'h31df;
              5'h11: pos_normal = 16'h31e0;
              5'h12: pos_normal = 16'h31e1;
              5'h13: pos_normal = 16'h31e2;
              5'h14: pos_normal = 16'h31e3;
              5'h15: pos_normal = 16'h31e4;
              5'h16: pos_normal = 16'h31e5;
              5'h17: pos_normal = 16'h31e6;
              5'h1a: pos_normal = 16'h31e8;
              5'h1b: pos_normal = 16'h31e9;
              5'h1c: pos_normal = 16'h31ea;
              5'h1d: pos_normal = 16'h31eb;
              5'h1e: pos_normal = 16'h31ec;
              5'h1f: pos_normal = 16'h31ed;
              default: begin end
            endcase
          end
          5'h10: begin
            pos_normal = 16'h3203;
            case (mant[4:0])
              5'h00: pos_normal = 16'h31ee;
              5'h01: pos_normal = 16'h31ef;
              5'h02: pos_normal = 16'h31f0;
              5'h03: pos_normal = 16'h31f1;
              5'h04: pos_normal = 16'h31f2;
              5'h05: pos_normal = 16'h31f3;
              5'h06: pos_normal = 16'h31f4;
              5'h07: pos_normal = 16'h31f5;
              5'h08: pos_normal = 16'h31f6;
              5'h09: pos_normal = 16'h31f7;
              5'h0a: pos_normal = 16'h31f8;
              5'h0b: pos_normal = 16'h31f9;
              5'h0c: pos_normal = 16'h31fa;
              5'h0d: pos_normal = 16'h31fb;
              5'h0e: pos_normal = 16'h31fc;
              5'h0f: pos_normal = 16'h31fd;
              5'h10: pos_normal = 16'h31fe;
              5'h11: pos_normal = 16'h31ff;
              5'h12: pos_normal = 16'h3200;
              5'h13: pos_normal = 16'h3201;
              5'h14: pos_normal = 16'h3202;
              5'h17: pos_normal = 16'h3204;
              5'h18: pos_normal = 16'h3205;
              5'h19: pos_normal = 16'h3206;
              5'h1a: pos_normal = 16'h3207;
              5'h1b: pos_normal = 16'h3208;
              5'h1c: pos_normal = 16'h3209;
              5'h1d: pos_normal = 16'h320a;
              5'h1e: pos_normal = 16'h320b;
              5'h1f: pos_normal = 16'h320c;
              default: begin end
            endcase
          end
          5'h11: begin
            pos_normal = 16'h321e;
            case (mant[4:0])
              5'h00: pos_normal = 16'h320d;
              5'h01: pos_normal = 16'h320e;
              5'h02: pos_normal = 16'h320f;
              5'h03: pos_normal = 16'h3210;
              5'h04: pos_normal = 16'h3211;
              5'h05: pos_normal = 16'h3212;
              5'h06: pos_normal = 16'h3213;
              5'h07: pos_normal = 16'h3214;
              5'h08: pos_normal = 16'h3215;
              5'h09: pos_normal = 16'h3216;
              5'h0a: pos_normal = 16'h3217;
              5'h0b: pos_normal = 16'h3218;
              5'h0c: pos_normal = 16'h3219;
              5'h0d: pos_normal = 16'h321a;
              5'h0e: pos_normal = 16'h321b;
              5'h0f: pos_normal = 16'h321c;
              5'h10: pos_normal = 16'h321d;
              5'h13: pos_normal = 16'h321f;
              5'h14: pos_normal = 16'h3220;
              5'h15: pos_normal = 16'h3221;
              5'h16: pos_normal = 16'h3222;
              5'h17: pos_normal = 16'h3223;
              5'h18: pos_normal = 16'h3224;
              5'h19: pos_normal = 16'h3225;
              5'h1a: pos_normal = 16'h3226;
              5'h1b: pos_normal = 16'h3227;
              5'h1c: pos_normal = 16'h3228;
              5'h1d: pos_normal = 16'h3229;
              5'h1e: pos_normal = 16'h322a;
              5'h1f: pos_normal = 16'h322b;
              default: begin end
            endcase
          end
          5'h12: begin
            pos_normal = 16'h3238;
            case (mant[4:0])
              5'h00: pos_normal = 16'h322c;
              5'h01: pos_normal = 16'h322d;
              5'h02: pos_normal = 16'h322e;
              5'h03: pos_normal = 16'h322f;
              5'h04: pos_normal = 16'h3230;
              5'h05: pos_normal = 16'h3231;
              5'h06: pos_normal = 16'h3232;
              5'h07: pos_normal = 16'h3233;
              5'h08: pos_normal = 16'h3234;
              5'h09: pos_normal = 16'h3235;
              5'h0a: pos_normal = 16'h3236;
              5'h0b: pos_normal = 16'h3237;
              5'h0e: pos_normal = 16'h3239;
              5'h0f: pos_normal = 16'h323a;
              5'h10: pos_normal = 16'h323b;
              5'h11: pos_normal = 16'h323c;
              5'h12: pos_normal = 16'h323d;
              5'h13: pos_normal = 16'h323e;
              5'h14: pos_normal = 16'h323f;
              5'h15: pos_normal = 16'h3240;
              5'h16: pos_normal = 16'h3241;
              5'h17: pos_normal = 16'h3242;
              5'h18: pos_normal = 16'h3243;
              5'h19: pos_normal = 16'h3244;
              5'h1a: pos_normal = 16'h3245;
              5'h1b: pos_normal = 16'h3246;
              5'h1c: pos_normal = 16'h3247;
              5'h1d: pos_normal = 16'h3248;
              5'h1e: pos_normal = 16'h3249;
              5'h1f: pos_normal = 16'h324a;
              default: begin end
            endcase
          end
          5'h13: begin
            pos_normal = 16'h3251;
            case (mant[4:0])
              5'h00: pos_normal = 16'h324b;
              5'h01: pos_normal = 16'h324c;
              5'h02: pos_normal = 16'h324d;
              5'h03: pos_normal = 16'h324e;
              5'h04: pos_normal = 16'h324f;
              5'h05: pos_normal = 16'h3250;
              5'h08: pos_normal = 16'h3252;
              5'h09: pos_normal = 16'h3253;
              5'h0a: pos_normal = 16'h3254;
              5'h0b: pos_normal = 16'h3255;
              5'h0c: pos_normal = 16'h3256;
              5'h0d: pos_normal = 16'h3257;
              5'h0e: pos_normal = 16'h3258;
              5'h0f: pos_normal = 16'h3259;
              5'h10: pos_normal = 16'h325a;
              5'h11: pos_normal = 16'h325b;
              5'h12: pos_normal = 16'h325c;
              5'h13: pos_normal = 16'h325d;
              5'h14: pos_normal = 16'h325e;
              5'h15: pos_normal = 16'h325f;
              5'h16: pos_normal = 16'h3260;
              5'h17: pos_normal = 16'h3261;
              5'h18: pos_normal = 16'h3262;
              5'h19: pos_normal = 16'h3263;
              5'h1a: pos_normal = 16'h3264;
              5'h1b: pos_normal = 16'h3265;
              5'h1c: pos_normal = 16'h3266;
              5'h1d: pos_normal = 16'h3267;
              5'h1e: pos_normal = 16'h3268;
              5'h1f: pos_normal = 16'h3269;
              default: begin end
            endcase
          end
          5'h14: begin
            pos_normal = 16'h3281;
            case (mant[4:0])
              5'h00: pos_normal = 16'h3269;
              5'h01: pos_normal = 16'h326a;
              5'h02: pos_normal = 16'h326b;
              5'h03: pos_normal = 16'h326c;
              5'h04: pos_normal = 16'h326d;
              5'h05: pos_normal = 16'h326e;
              5'h06: pos_normal = 16'h326f;
              5'h07: pos_normal = 16'h3270;
              5'h08: pos_normal = 16'h3271;
              5'h09: pos_normal = 16'h3272;
              5'h0a: pos_normal = 16'h3273;
              5'h0b: pos_normal = 16'h3274;
              5'h0c: pos_normal = 16'h3275;
              5'h0d: pos_normal = 16'h3276;
              5'h0e: pos_normal = 16'h3277;
              5'h0f: pos_normal = 16'h3278;
              5'h10: pos_normal = 16'h3279;
              5'h11: pos_normal = 16'h327a;
              5'h12: pos_normal = 16'h327b;
              5'h13: pos_normal = 16'h327c;
              5'h14: pos_normal = 16'h327d;
              5'h15: pos_normal = 16'h327e;
              5'h16: pos_normal = 16'h327f;
              5'h17: pos_normal = 16'h3280;
              5'h1a: pos_normal = 16'h3282;
              5'h1b: pos_normal = 16'h3283;
              5'h1c: pos_normal = 16'h3284;
              5'h1d: pos_normal = 16'h3285;
              5'h1e: pos_normal = 16'h3286;
              5'h1f: pos_normal = 16'h3287;
              default: begin end
            endcase
          end
          5'h15: begin
            pos_normal = 16'h3298;
            case (mant[4:0])
              5'h00: pos_normal = 16'h3288;
              5'h01: pos_normal = 16'h3289;
              5'h02: pos_normal = 16'h328a;
              5'h03: pos_normal = 16'h328b;
              5'h04: pos_normal = 16'h328c;
              5'h05: pos_normal = 16'h328d;
              5'h06: pos_normal = 16'h328e;
              5'h07: pos_normal = 16'h328f;
              5'h08: pos_normal = 16'h3290;
              5'h09: pos_normal = 16'h3291;
              5'h0a: pos_normal = 16'h3292;
              5'h0b: pos_normal = 16'h3293;
              5'h0c: pos_normal = 16'h3294;
              5'h0d: pos_normal = 16'h3295;
              5'h0e: pos_normal = 16'h3296;
              5'h0f: pos_normal = 16'h3297;
              5'h12: pos_normal = 16'h3299;
              5'h13: pos_normal = 16'h329a;
              5'h14: pos_normal = 16'h329b;
              5'h15: pos_normal = 16'h329c;
              5'h16: pos_normal = 16'h329d;
              5'h17: pos_normal = 16'h329e;
              5'h18: pos_normal = 16'h329f;
              5'h19: pos_normal = 16'h32a0;
              5'h1a: pos_normal = 16'h32a1;
              5'h1b: pos_normal = 16'h32a2;
              5'h1c: pos_normal = 16'h32a3;
              5'h1d: pos_normal = 16'h32a4;
              5'h1e: pos_normal = 16'h32a5;
              5'h1f: pos_normal = 16'h32a6;
              default: begin end
            endcase
          end
          5'h16: begin
            pos_normal = 16'h32ae;
            case (mant[4:0])
              5'h00: pos_normal = 16'h32a7;
              5'h01: pos_normal = 16'h32a8;
              5'h02: pos_normal = 16'h32a9;
              5'h03: pos_normal = 16'h32aa;
              5'h04: pos_normal = 16'h32ab;
              5'h05: pos_normal = 16'h32ac;
              5'h06: pos_normal = 16'h32ad;
              5'h09: pos_normal = 16'h32af;
              5'h0a: pos_normal = 16'h32b0;
              5'h0b: pos_normal = 16'h32b1;
              5'h0c: pos_normal = 16'h32b2;
              5'h0d: pos_normal = 16'h32b3;
              5'h0e: pos_normal = 16'h32b4;
              5'h0f: pos_normal = 16'h32b5;
              5'h10: pos_normal = 16'h32b6;
              5'h11: pos_normal = 16'h32b7;
              5'h12: pos_normal = 16'h32b8;
              5'h13: pos_normal = 16'h32b9;
              5'h14: pos_normal = 16'h32ba;
              5'h15: pos_normal = 16'h32bb;
              5'h16: pos_normal = 16'h32bc;
              5'h17: pos_normal = 16'h32bd;
              5'h18: pos_normal = 16'h32be;
              5'h19: pos_normal = 16'h32bf;
              5'h1a: pos_normal = 16'h32c0;
              5'h1b: pos_normal = 16'h32c1;
              5'h1c: pos_normal = 16'h32c2;
              5'h1d: pos_normal = 16'h32c3;
              5'h1e: pos_normal = 16'h32c4;
              5'h1f: pos_normal = 16'h32c4;
              default: begin end
            endcase
          end
          5'h17: begin
            pos_normal = 16'h32d9;
            case (mant[4:0])
              5'h00: pos_normal = 16'h32c5;
              5'h01: pos_normal = 16'h32c6;
              5'h02: pos_normal = 16'h32c7;
              5'h03: pos_normal = 16'h32c8;
              5'h04: pos_normal = 16'h32c9;
              5'h05: pos_normal = 16'h32ca;
              5'h06: pos_normal = 16'h32cb;
              5'h07: pos_normal = 16'h32cc;
              5'h08: pos_normal = 16'h32cd;
              5'h09: pos_normal = 16'h32ce;
              5'h0a: pos_normal = 16'h32cf;
              5'h0b: pos_normal = 16'h32d0;
              5'h0c: pos_normal = 16'h32d1;
              5'h0d: pos_normal = 16'h32d2;
              5'h0e: pos_normal = 16'h32d3;
              5'h0f: pos_normal = 16'h32d4;
              5'h10: pos_normal = 16'h32d5;
              5'h11: pos_normal = 16'h32d6;
              5'h12: pos_normal = 16'h32d7;
              5'h13: pos_normal = 16'h32d8;
              5'h16: pos_normal = 16'h32da;
              5'h17: pos_normal = 16'h32db;
              5'h18: pos_normal = 16'h32dc;
              5'h19: pos_normal = 16'h32dd;
              5'h1a: pos_normal = 16'h32de;
              5'h1b: pos_normal = 16'h32df;
              5'h1c: pos_normal = 16'h32e0;
              5'h1d: pos_normal = 16'h32e1;
              5'h1e: pos_normal = 16'h32e2;
              5'h1f: pos_normal = 16'h32e3;
              default: begin end
            endcase
          end
          5'h18: begin
            pos_normal = 16'h32ed;
            case (mant[4:0])
              5'h00: pos_normal = 16'h32e4;
              5'h01: pos_normal = 16'h32e5;
              5'h02: pos_normal = 16'h32e6;
              5'h03: pos_normal = 16'h32e7;
              5'h04: pos_normal = 16'h32e8;
              5'h05: pos_normal = 16'h32e9;
              5'h06: pos_normal = 16'h32ea;
              5'h07: pos_normal = 16'h32eb;
              5'h08: pos_normal = 16'h32ec;
              5'h0b: pos_normal = 16'h32ee;
              5'h0c: pos_normal = 16'h32ef;
              5'h0d: pos_normal = 16'h32f0;
              5'h0e: pos_normal = 16'h32f1;
              5'h0f: pos_normal = 16'h32f2;
              5'h10: pos_normal = 16'h32f3;
              5'h11: pos_normal = 16'h32f4;
              5'h12: pos_normal = 16'h32f5;
              5'h13: pos_normal = 16'h32f6;
              5'h14: pos_normal = 16'h32f7;
              5'h15: pos_normal = 16'h32f8;
              5'h16: pos_normal = 16'h32f9;
              5'h17: pos_normal = 16'h32fa;
              5'h18: pos_normal = 16'h32fb;
              5'h19: pos_normal = 16'h32fc;
              5'h1a: pos_normal = 16'h32fd;
              5'h1b: pos_normal = 16'h32fe;
              5'h1c: pos_normal = 16'h32ff;
              5'h1d: pos_normal = 16'h3300;
              5'h1e: pos_normal = 16'h3301;
              5'h1f: pos_normal = 16'h3301;
              default: begin end
            endcase
          end
          5'h19: begin
            pos_normal = 16'h3315;
            case (mant[4:0])
              5'h00: pos_normal = 16'h3302;
              5'h01: pos_normal = 16'h3303;
              5'h02: pos_normal = 16'h3304;
              5'h03: pos_normal = 16'h3305;
              5'h04: pos_normal = 16'h3306;
              5'h05: pos_normal = 16'h3307;
              5'h06: pos_normal = 16'h3308;
              5'h07: pos_normal = 16'h3309;
              5'h08: pos_normal = 16'h330a;
              5'h09: pos_normal = 16'h330b;
              5'h0a: pos_normal = 16'h330c;
              5'h0b: pos_normal = 16'h330d;
              5'h0c: pos_normal = 16'h330e;
              5'h0d: pos_normal = 16'h330f;
              5'h0e: pos_normal = 16'h3310;
              5'h0f: pos_normal = 16'h3311;
              5'h10: pos_normal = 16'h3312;
              5'h11: pos_normal = 16'h3313;
              5'h12: pos_normal = 16'h3314;
              5'h15: pos_normal = 16'h3316;
              5'h16: pos_normal = 16'h3317;
              5'h17: pos_normal = 16'h3318;
              5'h18: pos_normal = 16'h3319;
              5'h19: pos_normal = 16'h331a;
              5'h1a: pos_normal = 16'h331b;
              5'h1b: pos_normal = 16'h331c;
              5'h1c: pos_normal = 16'h331d;
              5'h1d: pos_normal = 16'h331e;
              5'h1e: pos_normal = 16'h331f;
              5'h1f: pos_normal = 16'h3320;
              default: begin end
            endcase
          end
          5'h1a: begin
            pos_normal = 16'h3328;
            case (mant[4:0])
              5'h00: pos_normal = 16'h3321;
              5'h01: pos_normal = 16'h3322;
              5'h02: pos_normal = 16'h3323;
              5'h03: pos_normal = 16'h3324;
              5'h04: pos_normal = 16'h3325;
              5'h05: pos_normal = 16'h3326;
              5'h06: pos_normal = 16'h3327;
              5'h09: pos_normal = 16'h3329;
              5'h0a: pos_normal = 16'h332a;
              5'h0b: pos_normal = 16'h332b;
              5'h0c: pos_normal = 16'h332c;
              5'h0d: pos_normal = 16'h332d;
              5'h0e: pos_normal = 16'h332e;
              5'h0f: pos_normal = 16'h332f;
              5'h10: pos_normal = 16'h3330;
              5'h11: pos_normal = 16'h3331;
              5'h12: pos_normal = 16'h3332;
              5'h13: pos_normal = 16'h3333;
              5'h14: pos_normal = 16'h3334;
              5'h15: pos_normal = 16'h3335;
              5'h16: pos_normal = 16'h3336;
              5'h17: pos_normal = 16'h3337;
              5'h18: pos_normal = 16'h3338;
              5'h19: pos_normal = 16'h3339;
              5'h1a: pos_normal = 16'h333a;
              5'h1b: pos_normal = 16'h333b;
              5'h1c: pos_normal = 16'h333b;
              5'h1d: pos_normal = 16'h333c;
              5'h1e: pos_normal = 16'h333d;
              5'h1f: pos_normal = 16'h333e;
              default: begin end
            endcase
          end
          5'h1b: begin
            pos_normal = 16'h334d;
            case (mant[4:0])
              5'h00: pos_normal = 16'h333f;
              5'h01: pos_normal = 16'h3340;
              5'h02: pos_normal = 16'h3341;
              5'h03: pos_normal = 16'h3342;
              5'h04: pos_normal = 16'h3343;
              5'h05: pos_normal = 16'h3344;
              5'h06: pos_normal = 16'h3345;
              5'h07: pos_normal = 16'h3346;
              5'h08: pos_normal = 16'h3347;
              5'h09: pos_normal = 16'h3348;
              5'h0a: pos_normal = 16'h3349;
              5'h0b: pos_normal = 16'h334a;
              5'h0c: pos_normal = 16'h334b;
              5'h0d: pos_normal = 16'h334c;
              5'h10: pos_normal = 16'h334e;
              5'h11: pos_normal = 16'h334f;
              5'h12: pos_normal = 16'h3350;
              5'h13: pos_normal = 16'h3351;
              5'h14: pos_normal = 16'h3352;
              5'h15: pos_normal = 16'h3353;
              5'h16: pos_normal = 16'h3354;
              5'h17: pos_normal = 16'h3355;
              5'h18: pos_normal = 16'h3356;
              5'h19: pos_normal = 16'h3357;
              5'h1a: pos_normal = 16'h3358;
              5'h1b: pos_normal = 16'h3359;
              5'h1c: pos_normal = 16'h335a;
              5'h1d: pos_normal = 16'h335b;
              5'h1e: pos_normal = 16'h335c;
              5'h1f: pos_normal = 16'h335d;
              default: begin end
            endcase
          end
          5'h1c: begin
            pos_normal = 16'h335f;
            case (mant[4:0])
              5'h00: pos_normal = 16'h335e;
              5'h03: pos_normal = 16'h3360;
              5'h04: pos_normal = 16'h3361;
              5'h05: pos_normal = 16'h3362;
              5'h06: pos_normal = 16'h3363;
              5'h07: pos_normal = 16'h3364;
              5'h08: pos_normal = 16'h3365;
              5'h09: pos_normal = 16'h3366;
              5'h0a: pos_normal = 16'h3367;
              5'h0b: pos_normal = 16'h3368;
              5'h0c: pos_normal = 16'h3369;
              5'h0d: pos_normal = 16'h336a;
              5'h0e: pos_normal = 16'h336b;
              5'h0f: pos_normal = 16'h336c;
              5'h10: pos_normal = 16'h336d;
              5'h11: pos_normal = 16'h336e;
              5'h12: pos_normal = 16'h336f;
              5'h13: pos_normal = 16'h3370;
              5'h14: pos_normal = 16'h3371;
              5'h15: pos_normal = 16'h3371;
              5'h16: pos_normal = 16'h3372;
              5'h17: pos_normal = 16'h3373;
              5'h18: pos_normal = 16'h3374;
              5'h19: pos_normal = 16'h3375;
              5'h1a: pos_normal = 16'h3376;
              5'h1b: pos_normal = 16'h3377;
              5'h1c: pos_normal = 16'h3378;
              5'h1d: pos_normal = 16'h3379;
              5'h1e: pos_normal = 16'h337a;
              5'h1f: pos_normal = 16'h337b;
              default: begin end
            endcase
          end
          5'h1d: begin
            pos_normal = 16'h3382;
            case (mant[4:0])
              5'h00: pos_normal = 16'h337c;
              5'h01: pos_normal = 16'h337d;
              5'h02: pos_normal = 16'h337e;
              5'h03: pos_normal = 16'h337f;
              5'h04: pos_normal = 16'h3380;
              5'h05: pos_normal = 16'h3381;
              5'h08: pos_normal = 16'h3383;
              5'h09: pos_normal = 16'h3384;
              5'h0a: pos_normal = 16'h3385;
              5'h0b: pos_normal = 16'h3386;
              5'h0c: pos_normal = 16'h3387;
              5'h0d: pos_normal = 16'h3388;
              5'h0e: pos_normal = 16'h3389;
              5'h0f: pos_normal = 16'h338a;
              5'h10: pos_normal = 16'h338b;
              5'h11: pos_normal = 16'h338c;
              5'h12: pos_normal = 16'h338d;
              5'h13: pos_normal = 16'h338e;
              5'h14: pos_normal = 16'h338f;
              5'h15: pos_normal = 16'h3390;
              5'h16: pos_normal = 16'h3391;
              5'h17: pos_normal = 16'h3392;
              5'h18: pos_normal = 16'h3393;
              5'h19: pos_normal = 16'h3393;
              5'h1a: pos_normal = 16'h3394;
              5'h1b: pos_normal = 16'h3395;
              5'h1c: pos_normal = 16'h3396;
              5'h1d: pos_normal = 16'h3397;
              5'h1e: pos_normal = 16'h3398;
              5'h1f: pos_normal = 16'h3399;
              default: begin end
            endcase
          end
          5'h1e: begin
            pos_normal = 16'h33a4;
            case (mant[4:0])
              5'h00: pos_normal = 16'h339a;
              5'h01: pos_normal = 16'h339b;
              5'h02: pos_normal = 16'h339c;
              5'h03: pos_normal = 16'h339d;
              5'h04: pos_normal = 16'h339e;
              5'h05: pos_normal = 16'h339f;
              5'h06: pos_normal = 16'h33a0;
              5'h07: pos_normal = 16'h33a1;
              5'h08: pos_normal = 16'h33a2;
              5'h09: pos_normal = 16'h33a3;
              5'h0c: pos_normal = 16'h33a5;
              5'h0d: pos_normal = 16'h33a6;
              5'h0e: pos_normal = 16'h33a7;
              5'h0f: pos_normal = 16'h33a8;
              5'h10: pos_normal = 16'h33a9;
              5'h11: pos_normal = 16'h33aa;
              5'h12: pos_normal = 16'h33ab;
              5'h13: pos_normal = 16'h33ac;
              5'h14: pos_normal = 16'h33ad;
              5'h15: pos_normal = 16'h33ae;
              5'h16: pos_normal = 16'h33af;
              5'h17: pos_normal = 16'h33b0;
              5'h18: pos_normal = 16'h33b1;
              5'h19: pos_normal = 16'h33b2;
              5'h1a: pos_normal = 16'h33b3;
              5'h1b: pos_normal = 16'h33b4;
              5'h1c: pos_normal = 16'h33b4;
              5'h1d: pos_normal = 16'h33b5;
              5'h1e: pos_normal = 16'h33b6;
              5'h1f: pos_normal = 16'h33b7;
              default: begin end
            endcase
          end
          5'h1f: begin
            pos_normal = 16'h33c5;
            case (mant[4:0])
              5'h00: pos_normal = 16'h33b8;
              5'h01: pos_normal = 16'h33b9;
              5'h02: pos_normal = 16'h33ba;
              5'h03: pos_normal = 16'h33bb;
              5'h04: pos_normal = 16'h33bc;
              5'h05: pos_normal = 16'h33bd;
              5'h06: pos_normal = 16'h33be;
              5'h07: pos_normal = 16'h33bf;
              5'h08: pos_normal = 16'h33c0;
              5'h09: pos_normal = 16'h33c1;
              5'h0a: pos_normal = 16'h33c2;
              5'h0b: pos_normal = 16'h33c3;
              5'h0c: pos_normal = 16'h33c4;
              5'h0f: pos_normal = 16'h33c6;
              5'h10: pos_normal = 16'h33c7;
              5'h11: pos_normal = 16'h33c8;
              5'h12: pos_normal = 16'h33c9;
              5'h13: pos_normal = 16'h33ca;
              5'h14: pos_normal = 16'h33cb;
              5'h15: pos_normal = 16'h33cc;
              5'h16: pos_normal = 16'h33cd;
              5'h17: pos_normal = 16'h33ce;
              5'h18: pos_normal = 16'h33cf;
              5'h19: pos_normal = 16'h33d0;
              5'h1a: pos_normal = 16'h33d1;
              5'h1b: pos_normal = 16'h33d2;
              5'h1c: pos_normal = 16'h33d3;
              5'h1d: pos_normal = 16'h33d4;
              5'h1e: pos_normal = 16'h33d4;
              5'h1f: pos_normal = 16'h33d5;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      5'h0d: begin
        case (mant[9:5])
          5'h00: begin
            pos_normal = 16'h3405;
            case (mant[4:0])
              5'h00: pos_normal = 16'h33d6;
              5'h01: pos_normal = 16'h33d8;
              5'h02: pos_normal = 16'h33da;
              5'h03: pos_normal = 16'h33dc;
              5'h04: pos_normal = 16'h33de;
              5'h05: pos_normal = 16'h33e0;
              5'h06: pos_normal = 16'h33e2;
              5'h07: pos_normal = 16'h33e4;
              5'h08: pos_normal = 16'h33e5;
              5'h09: pos_normal = 16'h33e7;
              5'h0a: pos_normal = 16'h33e9;
              5'h0b: pos_normal = 16'h33eb;
              5'h0c: pos_normal = 16'h33ed;
              5'h0d: pos_normal = 16'h33ef;
              5'h0e: pos_normal = 16'h33f1;
              5'h0f: pos_normal = 16'h33f3;
              5'h10: pos_normal = 16'h33f4;
              5'h11: pos_normal = 16'h33f6;
              5'h12: pos_normal = 16'h33f8;
              5'h13: pos_normal = 16'h33fa;
              5'h14: pos_normal = 16'h33fc;
              5'h15: pos_normal = 16'h33fe;
              5'h16: pos_normal = 16'h3400;
              5'h17: pos_normal = 16'h3401;
              5'h18: pos_normal = 16'h3402;
              5'h19: pos_normal = 16'h3403;
              5'h1a: pos_normal = 16'h3404;
              5'h1d: pos_normal = 16'h3406;
              5'h1e: pos_normal = 16'h3407;
              5'h1f: pos_normal = 16'h3408;
              default: begin end
            endcase
          end
          5'h01: begin
            pos_normal = 16'h3414;
            case (mant[4:0])
              5'h00: pos_normal = 16'h3409;
              5'h01: pos_normal = 16'h340a;
              5'h02: pos_normal = 16'h340b;
              5'h03: pos_normal = 16'h340c;
              5'h04: pos_normal = 16'h340d;
              5'h05: pos_normal = 16'h340e;
              5'h06: pos_normal = 16'h340f;
              5'h07: pos_normal = 16'h3410;
              5'h08: pos_normal = 16'h3411;
              5'h09: pos_normal = 16'h3412;
              5'h0a: pos_normal = 16'h3413;
              5'h0d: pos_normal = 16'h3415;
              5'h0e: pos_normal = 16'h3416;
              5'h0f: pos_normal = 16'h3417;
              5'h10: pos_normal = 16'h3418;
              5'h11: pos_normal = 16'h3419;
              5'h12: pos_normal = 16'h341a;
              5'h13: pos_normal = 16'h341b;
              5'h14: pos_normal = 16'h341c;
              5'h15: pos_normal = 16'h341d;
              5'h16: pos_normal = 16'h341e;
              5'h17: pos_normal = 16'h341f;
              5'h18: pos_normal = 16'h3420;
              5'h19: pos_normal = 16'h3421;
              5'h1a: pos_normal = 16'h3422;
              5'h1b: pos_normal = 16'h3422;
              5'h1c: pos_normal = 16'h3423;
              5'h1d: pos_normal = 16'h3424;
              5'h1e: pos_normal = 16'h3425;
              5'h1f: pos_normal = 16'h3426;
              default: begin end
            endcase
          end
          5'h02: begin
            pos_normal = 16'h3430;
            case (mant[4:0])
              5'h00: pos_normal = 16'h3427;
              5'h01: pos_normal = 16'h3428;
              5'h02: pos_normal = 16'h3429;
              5'h03: pos_normal = 16'h342a;
              5'h04: pos_normal = 16'h342b;
              5'h05: pos_normal = 16'h342c;
              5'h06: pos_normal = 16'h342d;
              5'h07: pos_normal = 16'h342e;
              5'h08: pos_normal = 16'h342f;
              5'h0b: pos_normal = 16'h3431;
              5'h0c: pos_normal = 16'h3432;
              5'h0d: pos_normal = 16'h3433;
              5'h0e: pos_normal = 16'h3434;
              5'h0f: pos_normal = 16'h3435;
              5'h10: pos_normal = 16'h3436;
              5'h11: pos_normal = 16'h3437;
              5'h12: pos_normal = 16'h3438;
              5'h13: pos_normal = 16'h3439;
              5'h14: pos_normal = 16'h343a;
              5'h15: pos_normal = 16'h343b;
              5'h16: pos_normal = 16'h343c;
              5'h17: pos_normal = 16'h343d;
              5'h18: pos_normal = 16'h343d;
              5'h19: pos_normal = 16'h343e;
              5'h1a: pos_normal = 16'h343f;
              5'h1b: pos_normal = 16'h3440;
              5'h1c: pos_normal = 16'h3441;
              5'h1d: pos_normal = 16'h3442;
              5'h1e: pos_normal = 16'h3443;
              5'h1f: pos_normal = 16'h3444;
              default: begin end
            endcase
          end
          5'h03: begin
            pos_normal = 16'h344a;
            case (mant[4:0])
              5'h00: pos_normal = 16'h3445;
              5'h01: pos_normal = 16'h3446;
              5'h02: pos_normal = 16'h3447;
              5'h03: pos_normal = 16'h3448;
              5'h04: pos_normal = 16'h3449;
              5'h07: pos_normal = 16'h344b;
              5'h08: pos_normal = 16'h344c;
              5'h09: pos_normal = 16'h344d;
              5'h0a: pos_normal = 16'h344e;
              5'h0b: pos_normal = 16'h344f;
              5'h0c: pos_normal = 16'h3450;
              5'h0d: pos_normal = 16'h3451;
              5'h0e: pos_normal = 16'h3452;
              5'h0f: pos_normal = 16'h3453;
              5'h10: pos_normal = 16'h3454;
              5'h11: pos_normal = 16'h3455;
              5'h12: pos_normal = 16'h3456;
              5'h13: pos_normal = 16'h3457;
              5'h14: pos_normal = 16'h3457;
              5'h15: pos_normal = 16'h3458;
              5'h16: pos_normal = 16'h3459;
              5'h17: pos_normal = 16'h345a;
              5'h18: pos_normal = 16'h345b;
              5'h19: pos_normal = 16'h345c;
              5'h1a: pos_normal = 16'h345d;
              5'h1b: pos_normal = 16'h345e;
              5'h1c: pos_normal = 16'h345f;
              5'h1d: pos_normal = 16'h3460;
              5'h1e: pos_normal = 16'h3461;
              5'h1f: pos_normal = 16'h3462;
              default: begin end
            endcase
          end
          5'h04: begin
            pos_normal = 16'h3463;
            case (mant[4:0])
              5'h02: pos_normal = 16'h3464;
              5'h03: pos_normal = 16'h3465;
              5'h04: pos_normal = 16'h3466;
              5'h05: pos_normal = 16'h3467;
              5'h06: pos_normal = 16'h3468;
              5'h07: pos_normal = 16'h3469;
              5'h08: pos_normal = 16'h346a;
              5'h09: pos_normal = 16'h346b;
              5'h0a: pos_normal = 16'h346c;
              5'h0b: pos_normal = 16'h346d;
              5'h0c: pos_normal = 16'h346e;
              5'h0d: pos_normal = 16'h346f;
              5'h0e: pos_normal = 16'h346f;
              5'h0f: pos_normal = 16'h3470;
              5'h10: pos_normal = 16'h3471;
              5'h11: pos_normal = 16'h3472;
              5'h12: pos_normal = 16'h3473;
              5'h13: pos_normal = 16'h3474;
              5'h14: pos_normal = 16'h3475;
              5'h15: pos_normal = 16'h3476;
              5'h16: pos_normal = 16'h3477;
              5'h17: pos_normal = 16'h3478;
              5'h18: pos_normal = 16'h3479;
              5'h19: pos_normal = 16'h347a;
              5'h1a: pos_normal = 16'h347b;
              5'h1b: pos_normal = 16'h347b;
              5'h1c: pos_normal = 16'h347c;
              5'h1d: pos_normal = 16'h347d;
              5'h1e: pos_normal = 16'h347e;
              5'h1f: pos_normal = 16'h347f;
              default: begin end
            endcase
          end
          5'h05: begin
            pos_normal = 16'h3487;
            case (mant[4:0])
              5'h00: pos_normal = 16'h3480;
              5'h01: pos_normal = 16'h3481;
              5'h02: pos_normal = 16'h3482;
              5'h03: pos_normal = 16'h3483;
              5'h04: pos_normal = 16'h3484;
              5'h05: pos_normal = 16'h3485;
              5'h06: pos_normal = 16'h3486;
              5'h09: pos_normal = 16'h3488;
              5'h0a: pos_normal = 16'h3489;
              5'h0b: pos_normal = 16'h348a;
              5'h0c: pos_normal = 16'h348b;
              5'h0d: pos_normal = 16'h348c;
              5'h0e: pos_normal = 16'h348d;
              5'h0f: pos_normal = 16'h348e;
              5'h10: pos_normal = 16'h348f;
              5'h11: pos_normal = 16'h3490;
              5'h12: pos_normal = 16'h3491;
              5'h13: pos_normal = 16'h3492;
              5'h14: pos_normal = 16'h3492;
              5'h15: pos_normal = 16'h3493;
              5'h16: pos_normal = 16'h3494;
              5'h17: pos_normal = 16'h3495;
              5'h18: pos_normal = 16'h3496;
              5'h19: pos_normal = 16'h3497;
              5'h1a: pos_normal = 16'h3498;
              5'h1b: pos_normal = 16'h3499;
              5'h1c: pos_normal = 16'h349a;
              5'h1d: pos_normal = 16'h349b;
              5'h1e: pos_normal = 16'h349c;
              5'h1f: pos_normal = 16'h349d;
              default: begin end
            endcase
          end
          5'h06: begin
            pos_normal = 16'h34a8;
            case (mant[4:0])
              5'h00: pos_normal = 16'h349d;
              5'h01: pos_normal = 16'h349e;
              5'h02: pos_normal = 16'h349f;
              5'h03: pos_normal = 16'h34a0;
              5'h04: pos_normal = 16'h34a1;
              5'h05: pos_normal = 16'h34a2;
              5'h06: pos_normal = 16'h34a3;
              5'h07: pos_normal = 16'h34a4;
              5'h08: pos_normal = 16'h34a5;
              5'h09: pos_normal = 16'h34a6;
              5'h0a: pos_normal = 16'h34a7;
              5'h0d: pos_normal = 16'h34a9;
              5'h0e: pos_normal = 16'h34aa;
              5'h0f: pos_normal = 16'h34ab;
              5'h10: pos_normal = 16'h34ac;
              5'h11: pos_normal = 16'h34ad;
              5'h12: pos_normal = 16'h34ae;
              5'h13: pos_normal = 16'h34af;
              5'h14: pos_normal = 16'h34b0;
              5'h15: pos_normal = 16'h34b1;
              5'h16: pos_normal = 16'h34b2;
              5'h17: pos_normal = 16'h34b3;
              5'h18: pos_normal = 16'h34b3;
              5'h19: pos_normal = 16'h34b4;
              5'h1a: pos_normal = 16'h34b5;
              5'h1b: pos_normal = 16'h34b6;
              5'h1c: pos_normal = 16'h34b7;
              5'h1d: pos_normal = 16'h34b8;
              5'h1e: pos_normal = 16'h34b9;
              5'h1f: pos_normal = 16'h34ba;
              default: begin end
            endcase
          end
          5'h07: begin
            pos_normal = 16'h34be;
            case (mant[4:0])
              5'h00: pos_normal = 16'h34bb;
              5'h01: pos_normal = 16'h34bc;
              5'h02: pos_normal = 16'h34bd;
              5'h05: pos_normal = 16'h34bf;
              5'h06: pos_normal = 16'h34c0;
              5'h07: pos_normal = 16'h34c1;
              5'h08: pos_normal = 16'h34c2;
              5'h09: pos_normal = 16'h34c3;
              5'h0a: pos_normal = 16'h34c4;
              5'h0b: pos_normal = 16'h34c5;
              5'h0c: pos_normal = 16'h34c6;
              5'h0d: pos_normal = 16'h34c7;
              5'h0e: pos_normal = 16'h34c8;
              5'h0f: pos_normal = 16'h34c8;
              5'h10: pos_normal = 16'h34c9;
              5'h11: pos_normal = 16'h34ca;
              5'h12: pos_normal = 16'h34cb;
              5'h13: pos_normal = 16'h34cc;
              5'h14: pos_normal = 16'h34cd;
              5'h15: pos_normal = 16'h34ce;
              5'h16: pos_normal = 16'h34cf;
              5'h17: pos_normal = 16'h34d0;
              5'h18: pos_normal = 16'h34d1;
              5'h19: pos_normal = 16'h34d2;
              5'h1a: pos_normal = 16'h34d2;
              5'h1b: pos_normal = 16'h34d3;
              5'h1c: pos_normal = 16'h34d4;
              5'h1d: pos_normal = 16'h34d5;
              5'h1e: pos_normal = 16'h34d6;
              5'h1f: pos_normal = 16'h34d7;
              default: begin end
            endcase
          end
          5'h08: begin
            pos_normal = 16'h34dc;
            case (mant[4:0])
              5'h00: pos_normal = 16'h34d8;
              5'h01: pos_normal = 16'h34d9;
              5'h02: pos_normal = 16'h34da;
              5'h03: pos_normal = 16'h34db;
              5'h06: pos_normal = 16'h34dd;
              5'h07: pos_normal = 16'h34de;
              5'h08: pos_normal = 16'h34df;
              5'h09: pos_normal = 16'h34e0;
              5'h0a: pos_normal = 16'h34e1;
              5'h0b: pos_normal = 16'h34e2;
              5'h0c: pos_normal = 16'h34e3;
              5'h0d: pos_normal = 16'h34e4;
              5'h0e: pos_normal = 16'h34e5;
              5'h0f: pos_normal = 16'h34e6;
              5'h10: pos_normal = 16'h34e6;
              5'h11: pos_normal = 16'h34e7;
              5'h12: pos_normal = 16'h34e8;
              5'h13: pos_normal = 16'h34e9;
              5'h14: pos_normal = 16'h34ea;
              5'h15: pos_normal = 16'h34eb;
              5'h16: pos_normal = 16'h34ec;
              5'h17: pos_normal = 16'h34ed;
              5'h18: pos_normal = 16'h34ee;
              5'h19: pos_normal = 16'h34ef;
              5'h1a: pos_normal = 16'h34ef;
              5'h1b: pos_normal = 16'h34f0;
              5'h1c: pos_normal = 16'h34f1;
              5'h1d: pos_normal = 16'h34f2;
              5'h1e: pos_normal = 16'h34f3;
              5'h1f: pos_normal = 16'h34f4;
              default: begin end
            endcase
          end
          5'h09: begin
            pos_normal = 16'h34f9;
            case (mant[4:0])
              5'h00: pos_normal = 16'h34f5;
              5'h01: pos_normal = 16'h34f6;
              5'h02: pos_normal = 16'h34f7;
              5'h03: pos_normal = 16'h34f8;
              5'h06: pos_normal = 16'h34fa;
              5'h07: pos_normal = 16'h34fb;
              5'h08: pos_normal = 16'h34fc;
              5'h09: pos_normal = 16'h34fd;
              5'h0a: pos_normal = 16'h34fe;
              5'h0b: pos_normal = 16'h34ff;
              5'h0c: pos_normal = 16'h3500;
              5'h0d: pos_normal = 16'h3501;
              5'h0e: pos_normal = 16'h3502;
              5'h0f: pos_normal = 16'h3502;
              5'h10: pos_normal = 16'h3503;
              5'h11: pos_normal = 16'h3504;
              5'h12: pos_normal = 16'h3505;
              5'h13: pos_normal = 16'h3506;
              5'h14: pos_normal = 16'h3507;
              5'h15: pos_normal = 16'h3508;
              5'h16: pos_normal = 16'h3509;
              5'h17: pos_normal = 16'h350a;
              5'h18: pos_normal = 16'h350b;
              5'h19: pos_normal = 16'h350b;
              5'h1a: pos_normal = 16'h350c;
              5'h1b: pos_normal = 16'h350d;
              5'h1c: pos_normal = 16'h350e;
              5'h1d: pos_normal = 16'h350f;
              5'h1e: pos_normal = 16'h3510;
              5'h1f: pos_normal = 16'h3511;
              default: begin end
            endcase
          end
          5'h0a: begin
            pos_normal = 16'h3514;
            case (mant[4:0])
              5'h00: pos_normal = 16'h3512;
              5'h01: pos_normal = 16'h3513;
              5'h04: pos_normal = 16'h3515;
              5'h05: pos_normal = 16'h3516;
              5'h06: pos_normal = 16'h3517;
              5'h07: pos_normal = 16'h3518;
              5'h08: pos_normal = 16'h3519;
              5'h09: pos_normal = 16'h351a;
              5'h0a: pos_normal = 16'h351b;
              5'h0b: pos_normal = 16'h351c;
              5'h0c: pos_normal = 16'h351d;
              5'h0d: pos_normal = 16'h351d;
              5'h0e: pos_normal = 16'h351e;
              5'h0f: pos_normal = 16'h351f;
              5'h10: pos_normal = 16'h3520;
              5'h11: pos_normal = 16'h3521;
              5'h12: pos_normal = 16'h3522;
              5'h13: pos_normal = 16'h3523;
              5'h14: pos_normal = 16'h3524;
              5'h15: pos_normal = 16'h3525;
              5'h16: pos_normal = 16'h3526;
              5'h17: pos_normal = 16'h3526;
              5'h18: pos_normal = 16'h3527;
              5'h19: pos_normal = 16'h3528;
              5'h1a: pos_normal = 16'h3529;
              5'h1b: pos_normal = 16'h352a;
              5'h1c: pos_normal = 16'h352b;
              5'h1d: pos_normal = 16'h352c;
              5'h1e: pos_normal = 16'h352d;
              5'h1f: pos_normal = 16'h352e;
              default: begin end
            endcase
          end
          5'h0b: begin
            pos_normal = 16'h3537;
            case (mant[4:0])
              5'h00: pos_normal = 16'h352e;
              5'h01: pos_normal = 16'h352f;
              5'h02: pos_normal = 16'h3530;
              5'h03: pos_normal = 16'h3531;
              5'h04: pos_normal = 16'h3532;
              5'h05: pos_normal = 16'h3533;
              5'h06: pos_normal = 16'h3534;
              5'h07: pos_normal = 16'h3535;
              5'h08: pos_normal = 16'h3536;
              5'h0b: pos_normal = 16'h3538;
              5'h0c: pos_normal = 16'h3539;
              5'h0d: pos_normal = 16'h353a;
              5'h0e: pos_normal = 16'h353b;
              5'h0f: pos_normal = 16'h353c;
              5'h10: pos_normal = 16'h353d;
              5'h11: pos_normal = 16'h353e;
              5'h12: pos_normal = 16'h353f;
              5'h13: pos_normal = 16'h353f;
              5'h14: pos_normal = 16'h3540;
              5'h15: pos_normal = 16'h3541;
              5'h16: pos_normal = 16'h3542;
              5'h17: pos_normal = 16'h3543;
              5'h18: pos_normal = 16'h3544;
              5'h19: pos_normal = 16'h3545;
              5'h1a: pos_normal = 16'h3546;
              5'h1b: pos_normal = 16'h3547;
              5'h1c: pos_normal = 16'h3547;
              5'h1d: pos_normal = 16'h3548;
              5'h1e: pos_normal = 16'h3549;
              5'h1f: pos_normal = 16'h354a;
              default: begin end
            endcase
          end
          5'h0c: begin
            pos_normal = 16'h354f;
            case (mant[4:0])
              5'h00: pos_normal = 16'h354b;
              5'h01: pos_normal = 16'h354c;
              5'h02: pos_normal = 16'h354d;
              5'h03: pos_normal = 16'h354e;
              5'h06: pos_normal = 16'h3550;
              5'h07: pos_normal = 16'h3551;
              5'h08: pos_normal = 16'h3552;
              5'h09: pos_normal = 16'h3553;
              5'h0a: pos_normal = 16'h3554;
              5'h0b: pos_normal = 16'h3555;
              5'h0c: pos_normal = 16'h3556;
              5'h0d: pos_normal = 16'h3557;
              5'h0e: pos_normal = 16'h3557;
              5'h0f: pos_normal = 16'h3558;
              5'h10: pos_normal = 16'h3559;
              5'h11: pos_normal = 16'h355a;
              5'h12: pos_normal = 16'h355b;
              5'h13: pos_normal = 16'h355c;
              5'h14: pos_normal = 16'h355d;
              5'h15: pos_normal = 16'h355e;
              5'h16: pos_normal = 16'h355f;
              5'h17: pos_normal = 16'h355f;
              5'h18: pos_normal = 16'h3560;
              5'h19: pos_normal = 16'h3561;
              5'h1a: pos_normal = 16'h3562;
              5'h1b: pos_normal = 16'h3563;
              5'h1c: pos_normal = 16'h3564;
              5'h1d: pos_normal = 16'h3565;
              5'h1e: pos_normal = 16'h3566;
              5'h1f: pos_normal = 16'h3567;
              default: begin end
            endcase
          end
          5'h0d: begin
            pos_normal = 16'h356f;
            case (mant[4:0])
              5'h00: pos_normal = 16'h3567;
              5'h01: pos_normal = 16'h3568;
              5'h02: pos_normal = 16'h3569;
              5'h03: pos_normal = 16'h356a;
              5'h04: pos_normal = 16'h356b;
              5'h05: pos_normal = 16'h356c;
              5'h06: pos_normal = 16'h356d;
              5'h07: pos_normal = 16'h356e;
              5'h0a: pos_normal = 16'h3570;
              5'h0b: pos_normal = 16'h3571;
              5'h0c: pos_normal = 16'h3572;
              5'h0d: pos_normal = 16'h3573;
              5'h0e: pos_normal = 16'h3574;
              5'h0f: pos_normal = 16'h3575;
              5'h10: pos_normal = 16'h3576;
              5'h11: pos_normal = 16'h3577;
              5'h12: pos_normal = 16'h3577;
              5'h13: pos_normal = 16'h3578;
              5'h14: pos_normal = 16'h3579;
              5'h15: pos_normal = 16'h357a;
              5'h16: pos_normal = 16'h357b;
              5'h17: pos_normal = 16'h357c;
              5'h18: pos_normal = 16'h357d;
              5'h19: pos_normal = 16'h357e;
              5'h1a: pos_normal = 16'h357e;
              5'h1b: pos_normal = 16'h357f;
              5'h1c: pos_normal = 16'h3580;
              5'h1d: pos_normal = 16'h3581;
              5'h1e: pos_normal = 16'h3582;
              5'h1f: pos_normal = 16'h3583;
              default: begin end
            endcase
          end
          5'h0e: begin
            pos_normal = 16'h3586;
            case (mant[4:0])
              5'h00: pos_normal = 16'h3584;
              5'h01: pos_normal = 16'h3585;
              5'h04: pos_normal = 16'h3587;
              5'h05: pos_normal = 16'h3588;
              5'h06: pos_normal = 16'h3589;
              5'h07: pos_normal = 16'h358a;
              5'h08: pos_normal = 16'h358b;
              5'h09: pos_normal = 16'h358c;
              5'h0a: pos_normal = 16'h358d;
              5'h0b: pos_normal = 16'h358d;
              5'h0c: pos_normal = 16'h358e;
              5'h0d: pos_normal = 16'h358f;
              5'h0e: pos_normal = 16'h3590;
              5'h0f: pos_normal = 16'h3591;
              5'h10: pos_normal = 16'h3592;
              5'h11: pos_normal = 16'h3593;
              5'h12: pos_normal = 16'h3594;
              5'h13: pos_normal = 16'h3594;
              5'h14: pos_normal = 16'h3595;
              5'h15: pos_normal = 16'h3596;
              5'h16: pos_normal = 16'h3597;
              5'h17: pos_normal = 16'h3598;
              5'h18: pos_normal = 16'h3599;
              5'h19: pos_normal = 16'h359a;
              5'h1a: pos_normal = 16'h359b;
              5'h1b: pos_normal = 16'h359b;
              5'h1c: pos_normal = 16'h359c;
              5'h1d: pos_normal = 16'h359d;
              5'h1e: pos_normal = 16'h359e;
              5'h1f: pos_normal = 16'h359f;
              default: begin end
            endcase
          end
          5'h0f: begin
            pos_normal = 16'h35a2;
            case (mant[4:0])
              5'h00: pos_normal = 16'h35a0;
              5'h01: pos_normal = 16'h35a1;
              5'h04: pos_normal = 16'h35a3;
              5'h05: pos_normal = 16'h35a4;
              5'h06: pos_normal = 16'h35a5;
              5'h07: pos_normal = 16'h35a6;
              5'h08: pos_normal = 16'h35a7;
              5'h09: pos_normal = 16'h35a8;
              5'h0a: pos_normal = 16'h35a9;
              5'h0b: pos_normal = 16'h35a9;
              5'h0c: pos_normal = 16'h35aa;
              5'h0d: pos_normal = 16'h35ab;
              5'h0e: pos_normal = 16'h35ac;
              5'h0f: pos_normal = 16'h35ad;
              5'h10: pos_normal = 16'h35ae;
              5'h11: pos_normal = 16'h35af;
              5'h12: pos_normal = 16'h35b0;
              5'h13: pos_normal = 16'h35b0;
              5'h14: pos_normal = 16'h35b1;
              5'h15: pos_normal = 16'h35b2;
              5'h16: pos_normal = 16'h35b3;
              5'h17: pos_normal = 16'h35b4;
              5'h18: pos_normal = 16'h35b5;
              5'h19: pos_normal = 16'h35b6;
              5'h1a: pos_normal = 16'h35b7;
              5'h1b: pos_normal = 16'h35b7;
              5'h1c: pos_normal = 16'h35b8;
              5'h1d: pos_normal = 16'h35b9;
              5'h1e: pos_normal = 16'h35ba;
              5'h1f: pos_normal = 16'h35bb;
              default: begin end
            endcase
          end
          5'h10: begin
            pos_normal = 16'h35be;
            case (mant[4:0])
              5'h00: pos_normal = 16'h35bc;
              5'h01: pos_normal = 16'h35bd;
              5'h04: pos_normal = 16'h35bf;
              5'h05: pos_normal = 16'h35c0;
              5'h06: pos_normal = 16'h35c1;
              5'h07: pos_normal = 16'h35c2;
              5'h08: pos_normal = 16'h35c3;
              5'h09: pos_normal = 16'h35c4;
              5'h0a: pos_normal = 16'h35c5;
              5'h0b: pos_normal = 16'h35c5;
              5'h0c: pos_normal = 16'h35c6;
              5'h0d: pos_normal = 16'h35c7;
              5'h0e: pos_normal = 16'h35c8;
              5'h0f: pos_normal = 16'h35c9;
              5'h10: pos_normal = 16'h35ca;
              5'h11: pos_normal = 16'h35cb;
              5'h12: pos_normal = 16'h35cb;
              5'h13: pos_normal = 16'h35cc;
              5'h14: pos_normal = 16'h35cd;
              5'h15: pos_normal = 16'h35ce;
              5'h16: pos_normal = 16'h35cf;
              5'h17: pos_normal = 16'h35d0;
              5'h18: pos_normal = 16'h35d1;
              5'h19: pos_normal = 16'h35d2;
              5'h1a: pos_normal = 16'h35d2;
              5'h1b: pos_normal = 16'h35d3;
              5'h1c: pos_normal = 16'h35d4;
              5'h1d: pos_normal = 16'h35d5;
              5'h1e: pos_normal = 16'h35d6;
              5'h1f: pos_normal = 16'h35d7;
              default: begin end
            endcase
          end
          5'h11: begin
            pos_normal = 16'h35d9;
            case (mant[4:0])
              5'h00: pos_normal = 16'h35d8;
              5'h03: pos_normal = 16'h35da;
              5'h04: pos_normal = 16'h35db;
              5'h05: pos_normal = 16'h35dc;
              5'h06: pos_normal = 16'h35dd;
              5'h07: pos_normal = 16'h35de;
              5'h08: pos_normal = 16'h35df;
              5'h09: pos_normal = 16'h35df;
              5'h0a: pos_normal = 16'h35e0;
              5'h0b: pos_normal = 16'h35e1;
              5'h0c: pos_normal = 16'h35e2;
              5'h0d: pos_normal = 16'h35e3;
              5'h0e: pos_normal = 16'h35e4;
              5'h0f: pos_normal = 16'h35e5;
              5'h10: pos_normal = 16'h35e5;
              5'h11: pos_normal = 16'h35e6;
              5'h12: pos_normal = 16'h35e7;
              5'h13: pos_normal = 16'h35e8;
              5'h14: pos_normal = 16'h35e9;
              5'h15: pos_normal = 16'h35ea;
              5'h16: pos_normal = 16'h35eb;
              5'h17: pos_normal = 16'h35ec;
              5'h18: pos_normal = 16'h35ec;
              5'h19: pos_normal = 16'h35ed;
              5'h1a: pos_normal = 16'h35ee;
              5'h1b: pos_normal = 16'h35ef;
              5'h1c: pos_normal = 16'h35f0;
              5'h1d: pos_normal = 16'h35f1;
              5'h1e: pos_normal = 16'h35f2;
              5'h1f: pos_normal = 16'h35f2;
              default: begin end
            endcase
          end
          5'h12: begin
            pos_normal = 16'h35f8;
            case (mant[4:0])
              5'h00: pos_normal = 16'h35f3;
              5'h01: pos_normal = 16'h35f4;
              5'h02: pos_normal = 16'h35f5;
              5'h03: pos_normal = 16'h35f6;
              5'h04: pos_normal = 16'h35f7;
              5'h07: pos_normal = 16'h35f9;
              5'h08: pos_normal = 16'h35fa;
              5'h09: pos_normal = 16'h35fb;
              5'h0a: pos_normal = 16'h35fc;
              5'h0b: pos_normal = 16'h35fd;
              5'h0c: pos_normal = 16'h35fe;
              5'h0d: pos_normal = 16'h35fe;
              5'h0e: pos_normal = 16'h35ff;
              5'h0f: pos_normal = 16'h3600;
              5'h10: pos_normal = 16'h3601;
              5'h11: pos_normal = 16'h3602;
              5'h12: pos_normal = 16'h3603;
              5'h13: pos_normal = 16'h3604;
              5'h14: pos_normal = 16'h3605;
              5'h15: pos_normal = 16'h3605;
              5'h16: pos_normal = 16'h3606;
              5'h17: pos_normal = 16'h3607;
              5'h18: pos_normal = 16'h3608;
              5'h19: pos_normal = 16'h3609;
              5'h1a: pos_normal = 16'h360a;
              5'h1b: pos_normal = 16'h360b;
              5'h1c: pos_normal = 16'h360b;
              5'h1d: pos_normal = 16'h360c;
              5'h1e: pos_normal = 16'h360d;
              5'h1f: pos_normal = 16'h360e;
              default: begin end
            endcase
          end
          5'h13: begin
            pos_normal = 16'h3611;
            case (mant[4:0])
              5'h00: pos_normal = 16'h360f;
              5'h01: pos_normal = 16'h3610;
              5'h04: pos_normal = 16'h3612;
              5'h05: pos_normal = 16'h3613;
              5'h06: pos_normal = 16'h3614;
              5'h07: pos_normal = 16'h3615;
              5'h08: pos_normal = 16'h3616;
              5'h09: pos_normal = 16'h3616;
              5'h0a: pos_normal = 16'h3617;
              5'h0b: pos_normal = 16'h3618;
              5'h0c: pos_normal = 16'h3619;
              5'h0d: pos_normal = 16'h361a;
              5'h0e: pos_normal = 16'h361b;
              5'h0f: pos_normal = 16'h361c;
              5'h10: pos_normal = 16'h361c;
              5'h11: pos_normal = 16'h361d;
              5'h12: pos_normal = 16'h361e;
              5'h13: pos_normal = 16'h361f;
              5'h14: pos_normal = 16'h3620;
              5'h15: pos_normal = 16'h3621;
              5'h16: pos_normal = 16'h3622;
              5'h17: pos_normal = 16'h3622;
              5'h18: pos_normal = 16'h3623;
              5'h19: pos_normal = 16'h3624;
              5'h1a: pos_normal = 16'h3625;
              5'h1b: pos_normal = 16'h3626;
              5'h1c: pos_normal = 16'h3627;
              5'h1d: pos_normal = 16'h3628;
              5'h1e: pos_normal = 16'h3628;
              5'h1f: pos_normal = 16'h3629;
              default: begin end
            endcase
          end
          5'h14: begin
            pos_normal = 16'h362e;
            case (mant[4:0])
              5'h00: pos_normal = 16'h362a;
              5'h01: pos_normal = 16'h362b;
              5'h02: pos_normal = 16'h362c;
              5'h03: pos_normal = 16'h362d;
              5'h06: pos_normal = 16'h362f;
              5'h07: pos_normal = 16'h3630;
              5'h08: pos_normal = 16'h3631;
              5'h09: pos_normal = 16'h3632;
              5'h0a: pos_normal = 16'h3633;
              5'h0b: pos_normal = 16'h3633;
              5'h0c: pos_normal = 16'h3634;
              5'h0d: pos_normal = 16'h3635;
              5'h0e: pos_normal = 16'h3636;
              5'h0f: pos_normal = 16'h3637;
              5'h10: pos_normal = 16'h3638;
              5'h11: pos_normal = 16'h3639;
              5'h12: pos_normal = 16'h3639;
              5'h13: pos_normal = 16'h363a;
              5'h14: pos_normal = 16'h363b;
              5'h15: pos_normal = 16'h363c;
              5'h16: pos_normal = 16'h363d;
              5'h17: pos_normal = 16'h363e;
              5'h18: pos_normal = 16'h363f;
              5'h19: pos_normal = 16'h363f;
              5'h1a: pos_normal = 16'h3640;
              5'h1b: pos_normal = 16'h3641;
              5'h1c: pos_normal = 16'h3642;
              5'h1d: pos_normal = 16'h3643;
              5'h1e: pos_normal = 16'h3644;
              5'h1f: pos_normal = 16'h3644;
              default: begin end
            endcase
          end
          5'h15: begin
            pos_normal = 16'h364a;
            case (mant[4:0])
              5'h00: pos_normal = 16'h3645;
              5'h01: pos_normal = 16'h3646;
              5'h02: pos_normal = 16'h3647;
              5'h03: pos_normal = 16'h3648;
              5'h04: pos_normal = 16'h3649;
              5'h07: pos_normal = 16'h364b;
              5'h08: pos_normal = 16'h364c;
              5'h09: pos_normal = 16'h364d;
              5'h0a: pos_normal = 16'h364e;
              5'h0b: pos_normal = 16'h364f;
              5'h0c: pos_normal = 16'h364f;
              5'h0d: pos_normal = 16'h3650;
              5'h0e: pos_normal = 16'h3651;
              5'h0f: pos_normal = 16'h3652;
              5'h10: pos_normal = 16'h3653;
              5'h11: pos_normal = 16'h3654;
              5'h12: pos_normal = 16'h3654;
              5'h13: pos_normal = 16'h3655;
              5'h14: pos_normal = 16'h3656;
              5'h15: pos_normal = 16'h3657;
              5'h16: pos_normal = 16'h3658;
              5'h17: pos_normal = 16'h3659;
              5'h18: pos_normal = 16'h365a;
              5'h19: pos_normal = 16'h365a;
              5'h1a: pos_normal = 16'h365b;
              5'h1b: pos_normal = 16'h365c;
              5'h1c: pos_normal = 16'h365d;
              5'h1d: pos_normal = 16'h365e;
              5'h1e: pos_normal = 16'h365f;
              5'h1f: pos_normal = 16'h365f;
              default: begin end
            endcase
          end
          5'h16: begin
            pos_normal = 16'h3664;
            case (mant[4:0])
              5'h00: pos_normal = 16'h3660;
              5'h01: pos_normal = 16'h3661;
              5'h02: pos_normal = 16'h3662;
              5'h03: pos_normal = 16'h3663;
              5'h06: pos_normal = 16'h3665;
              5'h07: pos_normal = 16'h3666;
              5'h08: pos_normal = 16'h3667;
              5'h09: pos_normal = 16'h3668;
              5'h0a: pos_normal = 16'h3669;
              5'h0b: pos_normal = 16'h366a;
              5'h0c: pos_normal = 16'h366a;
              5'h0d: pos_normal = 16'h366b;
              5'h0e: pos_normal = 16'h366c;
              5'h0f: pos_normal = 16'h366d;
              5'h10: pos_normal = 16'h366e;
              5'h11: pos_normal = 16'h366f;
              5'h12: pos_normal = 16'h366f;
              5'h13: pos_normal = 16'h3670;
              5'h14: pos_normal = 16'h3671;
              5'h15: pos_normal = 16'h3672;
              5'h16: pos_normal = 16'h3673;
              5'h17: pos_normal = 16'h3674;
              5'h18: pos_normal = 16'h3674;
              5'h19: pos_normal = 16'h3675;
              5'h1a: pos_normal = 16'h3676;
              5'h1b: pos_normal = 16'h3677;
              5'h1c: pos_normal = 16'h3678;
              5'h1d: pos_normal = 16'h3679;
              5'h1e: pos_normal = 16'h3679;
              5'h1f: pos_normal = 16'h367a;
              default: begin end
            endcase
          end
          5'h17: begin
            pos_normal = 16'h367e;
            case (mant[4:0])
              5'h00: pos_normal = 16'h367b;
              5'h01: pos_normal = 16'h367c;
              5'h02: pos_normal = 16'h367d;
              5'h05: pos_normal = 16'h367f;
              5'h06: pos_normal = 16'h3680;
              5'h07: pos_normal = 16'h3681;
              5'h08: pos_normal = 16'h3682;
              5'h09: pos_normal = 16'h3683;
              5'h0a: pos_normal = 16'h3683;
              5'h0b: pos_normal = 16'h3684;
              5'h0c: pos_normal = 16'h3685;
              5'h0d: pos_normal = 16'h3686;
              5'h0e: pos_normal = 16'h3687;
              5'h0f: pos_normal = 16'h3688;
              5'h10: pos_normal = 16'h3688;
              5'h11: pos_normal = 16'h3689;
              5'h12: pos_normal = 16'h368a;
              5'h13: pos_normal = 16'h368b;
              5'h14: pos_normal = 16'h368c;
              5'h15: pos_normal = 16'h368d;
              5'h16: pos_normal = 16'h368d;
              5'h17: pos_normal = 16'h368e;
              5'h18: pos_normal = 16'h368f;
              5'h19: pos_normal = 16'h3690;
              5'h1a: pos_normal = 16'h3691;
              5'h1b: pos_normal = 16'h3692;
              5'h1c: pos_normal = 16'h3692;
              5'h1d: pos_normal = 16'h3693;
              5'h1e: pos_normal = 16'h3694;
              5'h1f: pos_normal = 16'h3695;
              default: begin end
            endcase
          end
          5'h18: begin
            pos_normal = 16'h3697;
            case (mant[4:0])
              5'h00: pos_normal = 16'h3696;
              5'h03: pos_normal = 16'h3698;
              5'h04: pos_normal = 16'h3699;
              5'h05: pos_normal = 16'h369a;
              5'h06: pos_normal = 16'h369b;
              5'h07: pos_normal = 16'h369c;
              5'h08: pos_normal = 16'h369c;
              5'h09: pos_normal = 16'h369d;
              5'h0a: pos_normal = 16'h369e;
              5'h0b: pos_normal = 16'h369f;
              5'h0c: pos_normal = 16'h36a0;
              5'h0d: pos_normal = 16'h36a1;
              5'h0e: pos_normal = 16'h36a1;
              5'h0f: pos_normal = 16'h36a2;
              5'h10: pos_normal = 16'h36a3;
              5'h11: pos_normal = 16'h36a4;
              5'h12: pos_normal = 16'h36a5;
              5'h13: pos_normal = 16'h36a6;
              5'h14: pos_normal = 16'h36a6;
              5'h15: pos_normal = 16'h36a7;
              5'h16: pos_normal = 16'h36a8;
              5'h17: pos_normal = 16'h36a9;
              5'h18: pos_normal = 16'h36aa;
              5'h19: pos_normal = 16'h36ab;
              5'h1a: pos_normal = 16'h36ab;
              5'h1b: pos_normal = 16'h36ac;
              5'h1c: pos_normal = 16'h36ad;
              5'h1d: pos_normal = 16'h36ae;
              5'h1e: pos_normal = 16'h36af;
              5'h1f: pos_normal = 16'h36af;
              default: begin end
            endcase
          end
          5'h19: begin
            pos_normal = 16'h36b4;
            case (mant[4:0])
              5'h00: pos_normal = 16'h36b0;
              5'h01: pos_normal = 16'h36b1;
              5'h02: pos_normal = 16'h36b2;
              5'h03: pos_normal = 16'h36b3;
              5'h06: pos_normal = 16'h36b5;
              5'h07: pos_normal = 16'h36b6;
              5'h08: pos_normal = 16'h36b7;
              5'h09: pos_normal = 16'h36b8;
              5'h0a: pos_normal = 16'h36b9;
              5'h0b: pos_normal = 16'h36b9;
              5'h0c: pos_normal = 16'h36ba;
              5'h0d: pos_normal = 16'h36bb;
              5'h0e: pos_normal = 16'h36bc;
              5'h0f: pos_normal = 16'h36bd;
              5'h10: pos_normal = 16'h36bd;
              5'h11: pos_normal = 16'h36be;
              5'h12: pos_normal = 16'h36bf;
              5'h13: pos_normal = 16'h36c0;
              5'h14: pos_normal = 16'h36c1;
              5'h15: pos_normal = 16'h36c2;
              5'h16: pos_normal = 16'h36c2;
              5'h17: pos_normal = 16'h36c3;
              5'h18: pos_normal = 16'h36c4;
              5'h19: pos_normal = 16'h36c5;
              5'h1a: pos_normal = 16'h36c6;
              5'h1b: pos_normal = 16'h36c7;
              5'h1c: pos_normal = 16'h36c7;
              5'h1d: pos_normal = 16'h36c8;
              5'h1e: pos_normal = 16'h36c9;
              5'h1f: pos_normal = 16'h36ca;
              default: begin end
            endcase
          end
          5'h1a: begin
            pos_normal = 16'h36cb;
            case (mant[4:0])
              5'h02: pos_normal = 16'h36cc;
              5'h03: pos_normal = 16'h36cd;
              5'h04: pos_normal = 16'h36ce;
              5'h05: pos_normal = 16'h36cf;
              5'h06: pos_normal = 16'h36d0;
              5'h07: pos_normal = 16'h36d0;
              5'h08: pos_normal = 16'h36d1;
              5'h09: pos_normal = 16'h36d2;
              5'h0a: pos_normal = 16'h36d3;
              5'h0b: pos_normal = 16'h36d4;
              5'h0c: pos_normal = 16'h36d4;
              5'h0d: pos_normal = 16'h36d5;
              5'h0e: pos_normal = 16'h36d6;
              5'h0f: pos_normal = 16'h36d7;
              5'h10: pos_normal = 16'h36d8;
              5'h11: pos_normal = 16'h36d9;
              5'h12: pos_normal = 16'h36d9;
              5'h13: pos_normal = 16'h36da;
              5'h14: pos_normal = 16'h36db;
              5'h15: pos_normal = 16'h36dc;
              5'h16: pos_normal = 16'h36dd;
              5'h17: pos_normal = 16'h36dd;
              5'h18: pos_normal = 16'h36de;
              5'h19: pos_normal = 16'h36df;
              5'h1a: pos_normal = 16'h36e0;
              5'h1b: pos_normal = 16'h36e1;
              5'h1c: pos_normal = 16'h36e1;
              5'h1d: pos_normal = 16'h36e2;
              5'h1e: pos_normal = 16'h36e3;
              5'h1f: pos_normal = 16'h36e4;
              default: begin end
            endcase
          end
          5'h1b: begin
            pos_normal = 16'h36e6;
            case (mant[4:0])
              5'h00: pos_normal = 16'h36e5;
              5'h03: pos_normal = 16'h36e7;
              5'h04: pos_normal = 16'h36e8;
              5'h05: pos_normal = 16'h36e9;
              5'h06: pos_normal = 16'h36ea;
              5'h07: pos_normal = 16'h36ea;
              5'h08: pos_normal = 16'h36eb;
              5'h09: pos_normal = 16'h36ec;
              5'h0a: pos_normal = 16'h36ed;
              5'h0b: pos_normal = 16'h36ee;
              5'h0c: pos_normal = 16'h36ef;
              5'h0d: pos_normal = 16'h36ef;
              5'h0e: pos_normal = 16'h36f0;
              5'h0f: pos_normal = 16'h36f1;
              5'h10: pos_normal = 16'h36f2;
              5'h11: pos_normal = 16'h36f3;
              5'h12: pos_normal = 16'h36f3;
              5'h13: pos_normal = 16'h36f4;
              5'h14: pos_normal = 16'h36f5;
              5'h15: pos_normal = 16'h36f6;
              5'h16: pos_normal = 16'h36f7;
              5'h17: pos_normal = 16'h36f7;
              5'h18: pos_normal = 16'h36f8;
              5'h19: pos_normal = 16'h36f9;
              5'h1a: pos_normal = 16'h36fa;
              5'h1b: pos_normal = 16'h36fb;
              5'h1c: pos_normal = 16'h36fb;
              5'h1d: pos_normal = 16'h36fc;
              5'h1e: pos_normal = 16'h36fd;
              5'h1f: pos_normal = 16'h36fe;
              default: begin end
            endcase
          end
          5'h1c: begin
            pos_normal = 16'h3700;
            case (mant[4:0])
              5'h00: pos_normal = 16'h36ff;
              5'h03: pos_normal = 16'h3701;
              5'h04: pos_normal = 16'h3702;
              5'h05: pos_normal = 16'h3703;
              5'h06: pos_normal = 16'h3704;
              5'h07: pos_normal = 16'h3704;
              5'h08: pos_normal = 16'h3705;
              5'h09: pos_normal = 16'h3706;
              5'h0a: pos_normal = 16'h3707;
              5'h0b: pos_normal = 16'h3708;
              5'h0c: pos_normal = 16'h3708;
              5'h0d: pos_normal = 16'h3709;
              5'h0e: pos_normal = 16'h370a;
              5'h0f: pos_normal = 16'h370b;
              5'h10: pos_normal = 16'h370c;
              5'h11: pos_normal = 16'h370c;
              5'h12: pos_normal = 16'h370d;
              5'h13: pos_normal = 16'h370e;
              5'h14: pos_normal = 16'h370f;
              5'h15: pos_normal = 16'h3710;
              5'h16: pos_normal = 16'h3710;
              5'h17: pos_normal = 16'h3711;
              5'h18: pos_normal = 16'h3712;
              5'h19: pos_normal = 16'h3713;
              5'h1a: pos_normal = 16'h3714;
              5'h1b: pos_normal = 16'h3715;
              5'h1c: pos_normal = 16'h3715;
              5'h1d: pos_normal = 16'h3716;
              5'h1e: pos_normal = 16'h3717;
              5'h1f: pos_normal = 16'h3718;
              default: begin end
            endcase
          end
          5'h1d: begin
            pos_normal = 16'h3719;
            case (mant[4:0])
              5'h02: pos_normal = 16'h371a;
              5'h03: pos_normal = 16'h371b;
              5'h04: pos_normal = 16'h371c;
              5'h05: pos_normal = 16'h371d;
              5'h06: pos_normal = 16'h371d;
              5'h07: pos_normal = 16'h371e;
              5'h08: pos_normal = 16'h371f;
              5'h09: pos_normal = 16'h3720;
              5'h0a: pos_normal = 16'h3721;
              5'h0b: pos_normal = 16'h3721;
              5'h0c: pos_normal = 16'h3722;
              5'h0d: pos_normal = 16'h3723;
              5'h0e: pos_normal = 16'h3724;
              5'h0f: pos_normal = 16'h3725;
              5'h10: pos_normal = 16'h3725;
              5'h11: pos_normal = 16'h3726;
              5'h12: pos_normal = 16'h3727;
              5'h13: pos_normal = 16'h3728;
              5'h14: pos_normal = 16'h3729;
              5'h15: pos_normal = 16'h3729;
              5'h16: pos_normal = 16'h372a;
              5'h17: pos_normal = 16'h372b;
              5'h18: pos_normal = 16'h372c;
              5'h19: pos_normal = 16'h372d;
              5'h1a: pos_normal = 16'h372d;
              5'h1b: pos_normal = 16'h372e;
              5'h1c: pos_normal = 16'h372f;
              5'h1d: pos_normal = 16'h3730;
              5'h1e: pos_normal = 16'h3731;
              5'h1f: pos_normal = 16'h3731;
              default: begin end
            endcase
          end
          5'h1e: begin
            pos_normal = 16'h3735;
            case (mant[4:0])
              5'h00: pos_normal = 16'h3732;
              5'h01: pos_normal = 16'h3733;
              5'h02: pos_normal = 16'h3734;
              5'h05: pos_normal = 16'h3736;
              5'h06: pos_normal = 16'h3737;
              5'h07: pos_normal = 16'h3738;
              5'h08: pos_normal = 16'h3739;
              5'h09: pos_normal = 16'h3739;
              5'h0a: pos_normal = 16'h373a;
              5'h0b: pos_normal = 16'h373b;
              5'h0c: pos_normal = 16'h373c;
              5'h0d: pos_normal = 16'h373c;
              5'h0e: pos_normal = 16'h373d;
              5'h0f: pos_normal = 16'h373e;
              5'h10: pos_normal = 16'h373f;
              5'h11: pos_normal = 16'h3740;
              5'h12: pos_normal = 16'h3740;
              5'h13: pos_normal = 16'h3741;
              5'h14: pos_normal = 16'h3742;
              5'h15: pos_normal = 16'h3743;
              5'h16: pos_normal = 16'h3744;
              5'h17: pos_normal = 16'h3744;
              5'h18: pos_normal = 16'h3745;
              5'h19: pos_normal = 16'h3746;
              5'h1a: pos_normal = 16'h3747;
              5'h1b: pos_normal = 16'h3748;
              5'h1c: pos_normal = 16'h3748;
              5'h1d: pos_normal = 16'h3749;
              5'h1e: pos_normal = 16'h374a;
              5'h1f: pos_normal = 16'h374b;
              default: begin end
            endcase
          end
          5'h1f: begin
            pos_normal = 16'h374c;
            case (mant[4:0])
              5'h02: pos_normal = 16'h374d;
              5'h03: pos_normal = 16'h374e;
              5'h04: pos_normal = 16'h374f;
              5'h05: pos_normal = 16'h3750;
              5'h06: pos_normal = 16'h3750;
              5'h07: pos_normal = 16'h3751;
              5'h08: pos_normal = 16'h3752;
              5'h09: pos_normal = 16'h3753;
              5'h0a: pos_normal = 16'h3753;
              5'h0b: pos_normal = 16'h3754;
              5'h0c: pos_normal = 16'h3755;
              5'h0d: pos_normal = 16'h3756;
              5'h0e: pos_normal = 16'h3757;
              5'h0f: pos_normal = 16'h3757;
              5'h10: pos_normal = 16'h3758;
              5'h11: pos_normal = 16'h3759;
              5'h12: pos_normal = 16'h375a;
              5'h13: pos_normal = 16'h375b;
              5'h14: pos_normal = 16'h375b;
              5'h15: pos_normal = 16'h375c;
              5'h16: pos_normal = 16'h375d;
              5'h17: pos_normal = 16'h375e;
              5'h18: pos_normal = 16'h375f;
              5'h19: pos_normal = 16'h375f;
              5'h1a: pos_normal = 16'h3760;
              5'h1b: pos_normal = 16'h3761;
              5'h1c: pos_normal = 16'h3762;
              5'h1d: pos_normal = 16'h3762;
              5'h1e: pos_normal = 16'h3763;
              5'h1f: pos_normal = 16'h3764;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      5'h0e: begin
        case (mant[9:5])
          5'h00: begin
            pos_normal = 16'h3765;
            case (mant[4:0])
              5'h01: pos_normal = 16'h3766;
              5'h02: pos_normal = 16'h3768;
              5'h03: pos_normal = 16'h376a;
              5'h04: pos_normal = 16'h376b;
              5'h05: pos_normal = 16'h376d;
              5'h06: pos_normal = 16'h376e;
              5'h07: pos_normal = 16'h3770;
              5'h08: pos_normal = 16'h3771;
              5'h09: pos_normal = 16'h3773;
              5'h0a: pos_normal = 16'h3775;
              5'h0b: pos_normal = 16'h3776;
              5'h0c: pos_normal = 16'h3778;
              5'h0d: pos_normal = 16'h3779;
              5'h0e: pos_normal = 16'h377b;
              5'h0f: pos_normal = 16'h377c;
              5'h10: pos_normal = 16'h377e;
              5'h11: pos_normal = 16'h377f;
              5'h12: pos_normal = 16'h3781;
              5'h13: pos_normal = 16'h3783;
              5'h14: pos_normal = 16'h3784;
              5'h15: pos_normal = 16'h3786;
              5'h16: pos_normal = 16'h3787;
              5'h17: pos_normal = 16'h3789;
              5'h18: pos_normal = 16'h378a;
              5'h19: pos_normal = 16'h378c;
              5'h1a: pos_normal = 16'h378d;
              5'h1b: pos_normal = 16'h378f;
              5'h1c: pos_normal = 16'h3791;
              5'h1d: pos_normal = 16'h3792;
              5'h1e: pos_normal = 16'h3794;
              5'h1f: pos_normal = 16'h3795;
              default: begin end
            endcase
          end
          5'h01: begin
            pos_normal = 16'h3797;
            case (mant[4:0])
              5'h01: pos_normal = 16'h3798;
              5'h02: pos_normal = 16'h379a;
              5'h03: pos_normal = 16'h379b;
              5'h04: pos_normal = 16'h379d;
              5'h05: pos_normal = 16'h379f;
              5'h06: pos_normal = 16'h37a0;
              5'h07: pos_normal = 16'h37a2;
              5'h08: pos_normal = 16'h37a3;
              5'h09: pos_normal = 16'h37a5;
              5'h0a: pos_normal = 16'h37a6;
              5'h0b: pos_normal = 16'h37a8;
              5'h0c: pos_normal = 16'h37a9;
              5'h0d: pos_normal = 16'h37ab;
              5'h0e: pos_normal = 16'h37ac;
              5'h0f: pos_normal = 16'h37ae;
              5'h10: pos_normal = 16'h37b0;
              5'h11: pos_normal = 16'h37b1;
              5'h12: pos_normal = 16'h37b3;
              5'h13: pos_normal = 16'h37b4;
              5'h14: pos_normal = 16'h37b6;
              5'h15: pos_normal = 16'h37b7;
              5'h16: pos_normal = 16'h37b9;
              5'h17: pos_normal = 16'h37ba;
              5'h18: pos_normal = 16'h37bc;
              5'h19: pos_normal = 16'h37bd;
              5'h1a: pos_normal = 16'h37bf;
              5'h1b: pos_normal = 16'h37c0;
              5'h1c: pos_normal = 16'h37c2;
              5'h1d: pos_normal = 16'h37c3;
              5'h1e: pos_normal = 16'h37c5;
              5'h1f: pos_normal = 16'h37c7;
              default: begin end
            endcase
          end
          5'h02: begin
            pos_normal = 16'h37c8;
            case (mant[4:0])
              5'h01: pos_normal = 16'h37ca;
              5'h02: pos_normal = 16'h37cb;
              5'h03: pos_normal = 16'h37cd;
              5'h04: pos_normal = 16'h37ce;
              5'h05: pos_normal = 16'h37d0;
              5'h06: pos_normal = 16'h37d1;
              5'h07: pos_normal = 16'h37d3;
              5'h08: pos_normal = 16'h37d4;
              5'h09: pos_normal = 16'h37d6;
              5'h0a: pos_normal = 16'h37d7;
              5'h0b: pos_normal = 16'h37d9;
              5'h0c: pos_normal = 16'h37da;
              5'h0d: pos_normal = 16'h37dc;
              5'h0e: pos_normal = 16'h37dd;
              5'h0f: pos_normal = 16'h37df;
              5'h10: pos_normal = 16'h37e0;
              5'h11: pos_normal = 16'h37e2;
              5'h12: pos_normal = 16'h37e3;
              5'h13: pos_normal = 16'h37e5;
              5'h14: pos_normal = 16'h37e6;
              5'h15: pos_normal = 16'h37e8;
              5'h16: pos_normal = 16'h37e9;
              5'h17: pos_normal = 16'h37eb;
              5'h18: pos_normal = 16'h37ec;
              5'h19: pos_normal = 16'h37ee;
              5'h1a: pos_normal = 16'h37ef;
              5'h1b: pos_normal = 16'h37f1;
              5'h1c: pos_normal = 16'h37f3;
              5'h1d: pos_normal = 16'h37f4;
              5'h1e: pos_normal = 16'h37f6;
              5'h1f: pos_normal = 16'h37f7;
              default: begin end
            endcase
          end
          5'h03: begin
            pos_normal = 16'h3802;
            case (mant[4:0])
              5'h00: pos_normal = 16'h37f9;
              5'h01: pos_normal = 16'h37fa;
              5'h02: pos_normal = 16'h37fc;
              5'h03: pos_normal = 16'h37fd;
              5'h04: pos_normal = 16'h37ff;
              5'h05: pos_normal = 16'h3800;
              5'h06: pos_normal = 16'h3801;
              5'h09: pos_normal = 16'h3803;
              5'h0a: pos_normal = 16'h3804;
              5'h0b: pos_normal = 16'h3805;
              5'h0c: pos_normal = 16'h3805;
              5'h0d: pos_normal = 16'h3806;
              5'h0e: pos_normal = 16'h3807;
              5'h0f: pos_normal = 16'h3807;
              5'h10: pos_normal = 16'h3808;
              5'h11: pos_normal = 16'h3809;
              5'h12: pos_normal = 16'h380a;
              5'h13: pos_normal = 16'h380a;
              5'h14: pos_normal = 16'h380b;
              5'h15: pos_normal = 16'h380c;
              5'h16: pos_normal = 16'h380d;
              5'h17: pos_normal = 16'h380d;
              5'h18: pos_normal = 16'h380e;
              5'h19: pos_normal = 16'h380f;
              5'h1a: pos_normal = 16'h3810;
              5'h1b: pos_normal = 16'h3810;
              5'h1c: pos_normal = 16'h3811;
              5'h1d: pos_normal = 16'h3812;
              5'h1e: pos_normal = 16'h3813;
              5'h1f: pos_normal = 16'h3813;
              default: begin end
            endcase
          end
          5'h04: begin
            pos_normal = 16'h3816;
            case (mant[4:0])
              5'h00: pos_normal = 16'h3814;
              5'h01: pos_normal = 16'h3815;
              5'h04: pos_normal = 16'h3817;
              5'h05: pos_normal = 16'h3818;
              5'h06: pos_normal = 16'h3819;
              5'h07: pos_normal = 16'h3819;
              5'h08: pos_normal = 16'h381a;
              5'h09: pos_normal = 16'h381b;
              5'h0a: pos_normal = 16'h381c;
              5'h0b: pos_normal = 16'h381c;
              5'h0c: pos_normal = 16'h381d;
              5'h0d: pos_normal = 16'h381e;
              5'h0e: pos_normal = 16'h381e;
              5'h0f: pos_normal = 16'h381f;
              5'h10: pos_normal = 16'h3820;
              5'h11: pos_normal = 16'h3821;
              5'h12: pos_normal = 16'h3821;
              5'h13: pos_normal = 16'h3822;
              5'h14: pos_normal = 16'h3823;
              5'h15: pos_normal = 16'h3824;
              5'h16: pos_normal = 16'h3824;
              5'h17: pos_normal = 16'h3825;
              5'h18: pos_normal = 16'h3826;
              5'h19: pos_normal = 16'h3827;
              5'h1a: pos_normal = 16'h3827;
              5'h1b: pos_normal = 16'h3828;
              5'h1c: pos_normal = 16'h3829;
              5'h1d: pos_normal = 16'h3829;
              5'h1e: pos_normal = 16'h382a;
              5'h1f: pos_normal = 16'h382b;
              default: begin end
            endcase
          end
          5'h05: begin
            pos_normal = 16'h382c;
            case (mant[4:0])
              5'h02: pos_normal = 16'h382d;
              5'h03: pos_normal = 16'h382e;
              5'h04: pos_normal = 16'h382f;
              5'h05: pos_normal = 16'h382f;
              5'h06: pos_normal = 16'h3830;
              5'h07: pos_normal = 16'h3831;
              5'h08: pos_normal = 16'h3831;
              5'h09: pos_normal = 16'h3832;
              5'h0a: pos_normal = 16'h3833;
              5'h0b: pos_normal = 16'h3834;
              5'h0c: pos_normal = 16'h3834;
              5'h0d: pos_normal = 16'h3835;
              5'h0e: pos_normal = 16'h3836;
              5'h0f: pos_normal = 16'h3837;
              5'h10: pos_normal = 16'h3837;
              5'h11: pos_normal = 16'h3838;
              5'h12: pos_normal = 16'h3839;
              5'h13: pos_normal = 16'h3839;
              5'h14: pos_normal = 16'h383a;
              5'h15: pos_normal = 16'h383b;
              5'h16: pos_normal = 16'h383c;
              5'h17: pos_normal = 16'h383c;
              5'h18: pos_normal = 16'h383d;
              5'h19: pos_normal = 16'h383e;
              5'h1a: pos_normal = 16'h383e;
              5'h1b: pos_normal = 16'h383f;
              5'h1c: pos_normal = 16'h3840;
              5'h1d: pos_normal = 16'h3841;
              5'h1e: pos_normal = 16'h3841;
              5'h1f: pos_normal = 16'h3842;
              default: begin end
            endcase
          end
          5'h06: begin
            pos_normal = 16'h3843;
            case (mant[4:0])
              5'h02: pos_normal = 16'h3844;
              5'h03: pos_normal = 16'h3845;
              5'h04: pos_normal = 16'h3846;
              5'h05: pos_normal = 16'h3846;
              5'h06: pos_normal = 16'h3847;
              5'h07: pos_normal = 16'h3848;
              5'h08: pos_normal = 16'h3848;
              5'h09: pos_normal = 16'h3849;
              5'h0a: pos_normal = 16'h384a;
              5'h0b: pos_normal = 16'h384b;
              5'h0c: pos_normal = 16'h384b;
              5'h0d: pos_normal = 16'h384c;
              5'h0e: pos_normal = 16'h384d;
              5'h0f: pos_normal = 16'h384d;
              5'h10: pos_normal = 16'h384e;
              5'h11: pos_normal = 16'h384f;
              5'h12: pos_normal = 16'h3850;
              5'h13: pos_normal = 16'h3850;
              5'h14: pos_normal = 16'h3851;
              5'h15: pos_normal = 16'h3852;
              5'h16: pos_normal = 16'h3852;
              5'h17: pos_normal = 16'h3853;
              5'h18: pos_normal = 16'h3854;
              5'h19: pos_normal = 16'h3855;
              5'h1a: pos_normal = 16'h3855;
              5'h1b: pos_normal = 16'h3856;
              5'h1c: pos_normal = 16'h3857;
              5'h1d: pos_normal = 16'h3857;
              5'h1e: pos_normal = 16'h3858;
              5'h1f: pos_normal = 16'h3859;
              default: begin end
            endcase
          end
          5'h07: begin
            pos_normal = 16'h385c;
            case (mant[4:0])
              5'h00: pos_normal = 16'h3859;
              5'h01: pos_normal = 16'h385a;
              5'h02: pos_normal = 16'h385b;
              5'h05: pos_normal = 16'h385d;
              5'h06: pos_normal = 16'h385e;
              5'h07: pos_normal = 16'h385e;
              5'h08: pos_normal = 16'h385f;
              5'h09: pos_normal = 16'h3860;
              5'h0a: pos_normal = 16'h3860;
              5'h0b: pos_normal = 16'h3861;
              5'h0c: pos_normal = 16'h3862;
              5'h0d: pos_normal = 16'h3863;
              5'h0e: pos_normal = 16'h3863;
              5'h0f: pos_normal = 16'h3864;
              5'h10: pos_normal = 16'h3865;
              5'h11: pos_normal = 16'h3865;
              5'h12: pos_normal = 16'h3866;
              5'h13: pos_normal = 16'h3867;
              5'h14: pos_normal = 16'h3867;
              5'h15: pos_normal = 16'h3868;
              5'h16: pos_normal = 16'h3869;
              5'h17: pos_normal = 16'h386a;
              5'h18: pos_normal = 16'h386a;
              5'h19: pos_normal = 16'h386b;
              5'h1a: pos_normal = 16'h386c;
              5'h1b: pos_normal = 16'h386c;
              5'h1c: pos_normal = 16'h386d;
              5'h1d: pos_normal = 16'h386e;
              5'h1e: pos_normal = 16'h386e;
              5'h1f: pos_normal = 16'h386f;
              default: begin end
            endcase
          end
          5'h08: begin
            pos_normal = 16'h3871;
            case (mant[4:0])
              5'h00: pos_normal = 16'h3870;
              5'h03: pos_normal = 16'h3872;
              5'h04: pos_normal = 16'h3873;
              5'h05: pos_normal = 16'h3873;
              5'h06: pos_normal = 16'h3874;
              5'h07: pos_normal = 16'h3875;
              5'h08: pos_normal = 16'h3875;
              5'h09: pos_normal = 16'h3876;
              5'h0a: pos_normal = 16'h3877;
              5'h0b: pos_normal = 16'h3877;
              5'h0c: pos_normal = 16'h3878;
              5'h0d: pos_normal = 16'h3879;
              5'h0e: pos_normal = 16'h3879;
              5'h0f: pos_normal = 16'h387a;
              5'h10: pos_normal = 16'h387b;
              5'h11: pos_normal = 16'h387c;
              5'h12: pos_normal = 16'h387c;
              5'h13: pos_normal = 16'h387d;
              5'h14: pos_normal = 16'h387e;
              5'h15: pos_normal = 16'h387e;
              5'h16: pos_normal = 16'h387f;
              5'h17: pos_normal = 16'h3880;
              5'h18: pos_normal = 16'h3880;
              5'h19: pos_normal = 16'h3881;
              5'h1a: pos_normal = 16'h3882;
              5'h1b: pos_normal = 16'h3882;
              5'h1c: pos_normal = 16'h3883;
              5'h1d: pos_normal = 16'h3884;
              5'h1e: pos_normal = 16'h3884;
              5'h1f: pos_normal = 16'h3885;
              default: begin end
            endcase
          end
          5'h09: begin
            pos_normal = 16'h3886;
            case (mant[4:0])
              5'h02: pos_normal = 16'h3887;
              5'h03: pos_normal = 16'h3888;
              5'h04: pos_normal = 16'h3889;
              5'h05: pos_normal = 16'h3889;
              5'h06: pos_normal = 16'h388a;
              5'h07: pos_normal = 16'h388b;
              5'h08: pos_normal = 16'h388b;
              5'h09: pos_normal = 16'h388c;
              5'h0a: pos_normal = 16'h388d;
              5'h0b: pos_normal = 16'h388d;
              5'h0c: pos_normal = 16'h388e;
              5'h0d: pos_normal = 16'h388f;
              5'h0e: pos_normal = 16'h388f;
              5'h0f: pos_normal = 16'h3890;
              5'h10: pos_normal = 16'h3891;
              5'h11: pos_normal = 16'h3891;
              5'h12: pos_normal = 16'h3892;
              5'h13: pos_normal = 16'h3893;
              5'h14: pos_normal = 16'h3893;
              5'h15: pos_normal = 16'h3894;
              5'h16: pos_normal = 16'h3895;
              5'h17: pos_normal = 16'h3895;
              5'h18: pos_normal = 16'h3896;
              5'h19: pos_normal = 16'h3897;
              5'h1a: pos_normal = 16'h3897;
              5'h1b: pos_normal = 16'h3898;
              5'h1c: pos_normal = 16'h3899;
              5'h1d: pos_normal = 16'h3899;
              5'h1e: pos_normal = 16'h389a;
              5'h1f: pos_normal = 16'h389b;
              default: begin end
            endcase
          end
          5'h0a: begin
            pos_normal = 16'h389d;
            case (mant[4:0])
              5'h00: pos_normal = 16'h389b;
              5'h01: pos_normal = 16'h389c;
              5'h04: pos_normal = 16'h389e;
              5'h05: pos_normal = 16'h389f;
              5'h06: pos_normal = 16'h389f;
              5'h07: pos_normal = 16'h38a0;
              5'h08: pos_normal = 16'h38a1;
              5'h09: pos_normal = 16'h38a1;
              5'h0a: pos_normal = 16'h38a2;
              5'h0b: pos_normal = 16'h38a3;
              5'h0c: pos_normal = 16'h38a3;
              5'h0d: pos_normal = 16'h38a4;
              5'h0e: pos_normal = 16'h38a5;
              5'h0f: pos_normal = 16'h38a5;
              5'h10: pos_normal = 16'h38a6;
              5'h11: pos_normal = 16'h38a7;
              5'h12: pos_normal = 16'h38a7;
              5'h13: pos_normal = 16'h38a8;
              5'h14: pos_normal = 16'h38a9;
              5'h15: pos_normal = 16'h38a9;
              5'h16: pos_normal = 16'h38aa;
              5'h17: pos_normal = 16'h38ab;
              5'h18: pos_normal = 16'h38ab;
              5'h19: pos_normal = 16'h38ac;
              5'h1a: pos_normal = 16'h38ad;
              5'h1b: pos_normal = 16'h38ad;
              5'h1c: pos_normal = 16'h38ae;
              5'h1d: pos_normal = 16'h38af;
              5'h1e: pos_normal = 16'h38af;
              5'h1f: pos_normal = 16'h38b0;
              default: begin end
            endcase
          end
          5'h0b: begin
            pos_normal = 16'h38b1;
            case (mant[4:0])
              5'h02: pos_normal = 16'h38b2;
              5'h03: pos_normal = 16'h38b3;
              5'h04: pos_normal = 16'h38b3;
              5'h05: pos_normal = 16'h38b4;
              5'h06: pos_normal = 16'h38b4;
              5'h07: pos_normal = 16'h38b5;
              5'h08: pos_normal = 16'h38b6;
              5'h09: pos_normal = 16'h38b6;
              5'h0a: pos_normal = 16'h38b7;
              5'h0b: pos_normal = 16'h38b8;
              5'h0c: pos_normal = 16'h38b8;
              5'h0d: pos_normal = 16'h38b9;
              5'h0e: pos_normal = 16'h38ba;
              5'h0f: pos_normal = 16'h38ba;
              5'h10: pos_normal = 16'h38bb;
              5'h11: pos_normal = 16'h38bc;
              5'h12: pos_normal = 16'h38bc;
              5'h13: pos_normal = 16'h38bd;
              5'h14: pos_normal = 16'h38be;
              5'h15: pos_normal = 16'h38be;
              5'h16: pos_normal = 16'h38bf;
              5'h17: pos_normal = 16'h38c0;
              5'h18: pos_normal = 16'h38c0;
              5'h19: pos_normal = 16'h38c1;
              5'h1a: pos_normal = 16'h38c2;
              5'h1b: pos_normal = 16'h38c2;
              5'h1c: pos_normal = 16'h38c3;
              5'h1d: pos_normal = 16'h38c3;
              5'h1e: pos_normal = 16'h38c4;
              5'h1f: pos_normal = 16'h38c5;
              default: begin end
            endcase
          end
          5'h0c: begin
            pos_normal = 16'h38c7;
            case (mant[4:0])
              5'h00: pos_normal = 16'h38c5;
              5'h01: pos_normal = 16'h38c6;
              5'h04: pos_normal = 16'h38c8;
              5'h05: pos_normal = 16'h38c9;
              5'h06: pos_normal = 16'h38c9;
              5'h07: pos_normal = 16'h38ca;
              5'h08: pos_normal = 16'h38cb;
              5'h09: pos_normal = 16'h38cb;
              5'h0a: pos_normal = 16'h38cc;
              5'h0b: pos_normal = 16'h38cc;
              5'h0c: pos_normal = 16'h38cd;
              5'h0d: pos_normal = 16'h38ce;
              5'h0e: pos_normal = 16'h38ce;
              5'h0f: pos_normal = 16'h38cf;
              5'h10: pos_normal = 16'h38d0;
              5'h11: pos_normal = 16'h38d0;
              5'h12: pos_normal = 16'h38d1;
              5'h13: pos_normal = 16'h38d2;
              5'h14: pos_normal = 16'h38d2;
              5'h15: pos_normal = 16'h38d3;
              5'h16: pos_normal = 16'h38d3;
              5'h17: pos_normal = 16'h38d4;
              5'h18: pos_normal = 16'h38d5;
              5'h19: pos_normal = 16'h38d5;
              5'h1a: pos_normal = 16'h38d6;
              5'h1b: pos_normal = 16'h38d7;
              5'h1c: pos_normal = 16'h38d7;
              5'h1d: pos_normal = 16'h38d8;
              5'h1e: pos_normal = 16'h38d9;
              5'h1f: pos_normal = 16'h38d9;
              default: begin end
            endcase
          end
          5'h0d: begin
            pos_normal = 16'h38da;
            case (mant[4:0])
              5'h02: pos_normal = 16'h38db;
              5'h03: pos_normal = 16'h38dc;
              5'h04: pos_normal = 16'h38dc;
              5'h05: pos_normal = 16'h38dd;
              5'h06: pos_normal = 16'h38de;
              5'h07: pos_normal = 16'h38de;
              5'h08: pos_normal = 16'h38df;
              5'h09: pos_normal = 16'h38df;
              5'h0a: pos_normal = 16'h38e0;
              5'h0b: pos_normal = 16'h38e1;
              5'h0c: pos_normal = 16'h38e1;
              5'h0d: pos_normal = 16'h38e2;
              5'h0e: pos_normal = 16'h38e3;
              5'h0f: pos_normal = 16'h38e3;
              5'h10: pos_normal = 16'h38e4;
              5'h11: pos_normal = 16'h38e4;
              5'h12: pos_normal = 16'h38e5;
              5'h13: pos_normal = 16'h38e6;
              5'h14: pos_normal = 16'h38e6;
              5'h15: pos_normal = 16'h38e7;
              5'h16: pos_normal = 16'h38e8;
              5'h17: pos_normal = 16'h38e8;
              5'h18: pos_normal = 16'h38e9;
              5'h19: pos_normal = 16'h38e9;
              5'h1a: pos_normal = 16'h38ea;
              5'h1b: pos_normal = 16'h38eb;
              5'h1c: pos_normal = 16'h38eb;
              5'h1d: pos_normal = 16'h38ec;
              5'h1e: pos_normal = 16'h38ed;
              5'h1f: pos_normal = 16'h38ed;
              default: begin end
            endcase
          end
          5'h0e: begin
            pos_normal = 16'h38ee;
            case (mant[4:0])
              5'h02: pos_normal = 16'h38ef;
              5'h03: pos_normal = 16'h38f0;
              5'h04: pos_normal = 16'h38f0;
              5'h05: pos_normal = 16'h38f1;
              5'h06: pos_normal = 16'h38f2;
              5'h07: pos_normal = 16'h38f2;
              5'h08: pos_normal = 16'h38f3;
              5'h09: pos_normal = 16'h38f3;
              5'h0a: pos_normal = 16'h38f4;
              5'h0b: pos_normal = 16'h38f5;
              5'h0c: pos_normal = 16'h38f5;
              5'h0d: pos_normal = 16'h38f6;
              5'h0e: pos_normal = 16'h38f6;
              5'h0f: pos_normal = 16'h38f7;
              5'h10: pos_normal = 16'h38f8;
              5'h11: pos_normal = 16'h38f8;
              5'h12: pos_normal = 16'h38f9;
              5'h13: pos_normal = 16'h38fa;
              5'h14: pos_normal = 16'h38fa;
              5'h15: pos_normal = 16'h38fb;
              5'h16: pos_normal = 16'h38fb;
              5'h17: pos_normal = 16'h38fc;
              5'h18: pos_normal = 16'h38fd;
              5'h19: pos_normal = 16'h38fd;
              5'h1a: pos_normal = 16'h38fe;
              5'h1b: pos_normal = 16'h38fe;
              5'h1c: pos_normal = 16'h38ff;
              5'h1d: pos_normal = 16'h3900;
              5'h1e: pos_normal = 16'h3900;
              5'h1f: pos_normal = 16'h3901;
              default: begin end
            endcase
          end
          5'h0f: begin
            pos_normal = 16'h3902;
            case (mant[4:0])
              5'h02: pos_normal = 16'h3903;
              5'h03: pos_normal = 16'h3903;
              5'h04: pos_normal = 16'h3904;
              5'h05: pos_normal = 16'h3905;
              5'h06: pos_normal = 16'h3905;
              5'h07: pos_normal = 16'h3906;
              5'h08: pos_normal = 16'h3906;
              5'h09: pos_normal = 16'h3907;
              5'h0a: pos_normal = 16'h3908;
              5'h0b: pos_normal = 16'h3908;
              5'h0c: pos_normal = 16'h3909;
              5'h0d: pos_normal = 16'h3909;
              5'h0e: pos_normal = 16'h390a;
              5'h0f: pos_normal = 16'h390b;
              5'h10: pos_normal = 16'h390b;
              5'h11: pos_normal = 16'h390c;
              5'h12: pos_normal = 16'h390c;
              5'h13: pos_normal = 16'h390d;
              5'h14: pos_normal = 16'h390e;
              5'h15: pos_normal = 16'h390e;
              5'h16: pos_normal = 16'h390f;
              5'h17: pos_normal = 16'h390f;
              5'h18: pos_normal = 16'h3910;
              5'h19: pos_normal = 16'h3911;
              5'h1a: pos_normal = 16'h3911;
              5'h1b: pos_normal = 16'h3912;
              5'h1c: pos_normal = 16'h3912;
              5'h1d: pos_normal = 16'h3913;
              5'h1e: pos_normal = 16'h3914;
              5'h1f: pos_normal = 16'h3914;
              default: begin end
            endcase
          end
          5'h10: begin
            pos_normal = 16'h3915;
            case (mant[4:0])
              5'h02: pos_normal = 16'h3916;
              5'h03: pos_normal = 16'h3917;
              5'h04: pos_normal = 16'h3917;
              5'h05: pos_normal = 16'h3918;
              5'h06: pos_normal = 16'h3918;
              5'h07: pos_normal = 16'h3919;
              5'h08: pos_normal = 16'h391a;
              5'h09: pos_normal = 16'h391a;
              5'h0a: pos_normal = 16'h391b;
              5'h0b: pos_normal = 16'h391b;
              5'h0c: pos_normal = 16'h391c;
              5'h0d: pos_normal = 16'h391d;
              5'h0e: pos_normal = 16'h391d;
              5'h0f: pos_normal = 16'h391e;
              5'h10: pos_normal = 16'h391e;
              5'h11: pos_normal = 16'h391f;
              5'h12: pos_normal = 16'h391f;
              5'h13: pos_normal = 16'h3920;
              5'h14: pos_normal = 16'h3921;
              5'h15: pos_normal = 16'h3921;
              5'h16: pos_normal = 16'h3922;
              5'h17: pos_normal = 16'h3922;
              5'h18: pos_normal = 16'h3923;
              5'h19: pos_normal = 16'h3924;
              5'h1a: pos_normal = 16'h3924;
              5'h1b: pos_normal = 16'h3925;
              5'h1c: pos_normal = 16'h3925;
              5'h1d: pos_normal = 16'h3926;
              5'h1e: pos_normal = 16'h3927;
              5'h1f: pos_normal = 16'h3927;
              default: begin end
            endcase
          end
          5'h11: begin
            pos_normal = 16'h3928;
            case (mant[4:0])
              5'h02: pos_normal = 16'h3929;
              5'h03: pos_normal = 16'h3929;
              5'h04: pos_normal = 16'h392a;
              5'h05: pos_normal = 16'h392b;
              5'h06: pos_normal = 16'h392b;
              5'h07: pos_normal = 16'h392c;
              5'h08: pos_normal = 16'h392c;
              5'h09: pos_normal = 16'h392d;
              5'h0a: pos_normal = 16'h392e;
              5'h0b: pos_normal = 16'h392e;
              5'h0c: pos_normal = 16'h392f;
              5'h0d: pos_normal = 16'h392f;
              5'h0e: pos_normal = 16'h3930;
              5'h0f: pos_normal = 16'h3930;
              5'h10: pos_normal = 16'h3931;
              5'h11: pos_normal = 16'h3932;
              5'h12: pos_normal = 16'h3932;
              5'h13: pos_normal = 16'h3933;
              5'h14: pos_normal = 16'h3933;
              5'h15: pos_normal = 16'h3934;
              5'h16: pos_normal = 16'h3934;
              5'h17: pos_normal = 16'h3935;
              5'h18: pos_normal = 16'h3936;
              5'h19: pos_normal = 16'h3936;
              5'h1a: pos_normal = 16'h3937;
              5'h1b: pos_normal = 16'h3937;
              5'h1c: pos_normal = 16'h3938;
              5'h1d: pos_normal = 16'h3938;
              5'h1e: pos_normal = 16'h3939;
              5'h1f: pos_normal = 16'h393a;
              default: begin end
            endcase
          end
          5'h12: begin
            pos_normal = 16'h393b;
            case (mant[4:0])
              5'h00: pos_normal = 16'h393a;
              5'h03: pos_normal = 16'h393c;
              5'h04: pos_normal = 16'h393d;
              5'h05: pos_normal = 16'h393d;
              5'h06: pos_normal = 16'h393e;
              5'h07: pos_normal = 16'h393e;
              5'h08: pos_normal = 16'h393f;
              5'h09: pos_normal = 16'h393f;
              5'h0a: pos_normal = 16'h3940;
              5'h0b: pos_normal = 16'h3940;
              5'h0c: pos_normal = 16'h3941;
              5'h0d: pos_normal = 16'h3942;
              5'h0e: pos_normal = 16'h3942;
              5'h0f: pos_normal = 16'h3943;
              5'h10: pos_normal = 16'h3943;
              5'h11: pos_normal = 16'h3944;
              5'h12: pos_normal = 16'h3944;
              5'h13: pos_normal = 16'h3945;
              5'h14: pos_normal = 16'h3946;
              5'h15: pos_normal = 16'h3946;
              5'h16: pos_normal = 16'h3947;
              5'h17: pos_normal = 16'h3947;
              5'h18: pos_normal = 16'h3948;
              5'h19: pos_normal = 16'h3948;
              5'h1a: pos_normal = 16'h3949;
              5'h1b: pos_normal = 16'h394a;
              5'h1c: pos_normal = 16'h394a;
              5'h1d: pos_normal = 16'h394b;
              5'h1e: pos_normal = 16'h394b;
              5'h1f: pos_normal = 16'h394c;
              default: begin end
            endcase
          end
          5'h13: begin
            pos_normal = 16'h394d;
            case (mant[4:0])
              5'h00: pos_normal = 16'h394c;
              5'h03: pos_normal = 16'h394e;
              5'h04: pos_normal = 16'h394f;
              5'h05: pos_normal = 16'h394f;
              5'h06: pos_normal = 16'h3950;
              5'h07: pos_normal = 16'h3950;
              5'h08: pos_normal = 16'h3951;
              5'h09: pos_normal = 16'h3951;
              5'h0a: pos_normal = 16'h3952;
              5'h0b: pos_normal = 16'h3953;
              5'h0c: pos_normal = 16'h3953;
              5'h0d: pos_normal = 16'h3954;
              5'h0e: pos_normal = 16'h3954;
              5'h0f: pos_normal = 16'h3955;
              5'h10: pos_normal = 16'h3955;
              5'h11: pos_normal = 16'h3956;
              5'h12: pos_normal = 16'h3956;
              5'h13: pos_normal = 16'h3957;
              5'h14: pos_normal = 16'h3958;
              5'h15: pos_normal = 16'h3958;
              5'h16: pos_normal = 16'h3959;
              5'h17: pos_normal = 16'h3959;
              5'h18: pos_normal = 16'h395a;
              5'h19: pos_normal = 16'h395a;
              5'h1a: pos_normal = 16'h395b;
              5'h1b: pos_normal = 16'h395b;
              5'h1c: pos_normal = 16'h395c;
              5'h1d: pos_normal = 16'h395c;
              5'h1e: pos_normal = 16'h395d;
              5'h1f: pos_normal = 16'h395e;
              default: begin end
            endcase
          end
          5'h14: begin
            pos_normal = 16'h395f;
            case (mant[4:0])
              5'h00: pos_normal = 16'h395e;
              5'h03: pos_normal = 16'h3960;
              5'h04: pos_normal = 16'h3960;
              5'h05: pos_normal = 16'h3961;
              5'h06: pos_normal = 16'h3961;
              5'h07: pos_normal = 16'h3962;
              5'h08: pos_normal = 16'h3963;
              5'h09: pos_normal = 16'h3963;
              5'h0a: pos_normal = 16'h3964;
              5'h0b: pos_normal = 16'h3964;
              5'h0c: pos_normal = 16'h3965;
              5'h0d: pos_normal = 16'h3965;
              5'h0e: pos_normal = 16'h3966;
              5'h0f: pos_normal = 16'h3966;
              5'h10: pos_normal = 16'h3967;
              5'h11: pos_normal = 16'h3967;
              5'h12: pos_normal = 16'h3968;
              5'h13: pos_normal = 16'h3969;
              5'h14: pos_normal = 16'h3969;
              5'h15: pos_normal = 16'h396a;
              5'h16: pos_normal = 16'h396a;
              5'h17: pos_normal = 16'h396b;
              5'h18: pos_normal = 16'h396b;
              5'h19: pos_normal = 16'h396c;
              5'h1a: pos_normal = 16'h396c;
              5'h1b: pos_normal = 16'h396d;
              5'h1c: pos_normal = 16'h396d;
              5'h1d: pos_normal = 16'h396e;
              5'h1e: pos_normal = 16'h396e;
              5'h1f: pos_normal = 16'h396f;
              default: begin end
            endcase
          end
          5'h15: begin
            pos_normal = 16'h3970;
            case (mant[4:0])
              5'h02: pos_normal = 16'h3971;
              5'h03: pos_normal = 16'h3971;
              5'h04: pos_normal = 16'h3972;
              5'h05: pos_normal = 16'h3972;
              5'h06: pos_normal = 16'h3973;
              5'h07: pos_normal = 16'h3973;
              5'h08: pos_normal = 16'h3974;
              5'h09: pos_normal = 16'h3974;
              5'h0a: pos_normal = 16'h3975;
              5'h0b: pos_normal = 16'h3975;
              5'h0c: pos_normal = 16'h3976;
              5'h0d: pos_normal = 16'h3977;
              5'h0e: pos_normal = 16'h3977;
              5'h0f: pos_normal = 16'h3978;
              5'h10: pos_normal = 16'h3978;
              5'h11: pos_normal = 16'h3979;
              5'h12: pos_normal = 16'h3979;
              5'h13: pos_normal = 16'h397a;
              5'h14: pos_normal = 16'h397a;
              5'h15: pos_normal = 16'h397b;
              5'h16: pos_normal = 16'h397b;
              5'h17: pos_normal = 16'h397c;
              5'h18: pos_normal = 16'h397c;
              5'h19: pos_normal = 16'h397d;
              5'h1a: pos_normal = 16'h397d;
              5'h1b: pos_normal = 16'h397e;
              5'h1c: pos_normal = 16'h397e;
              5'h1d: pos_normal = 16'h397f;
              5'h1e: pos_normal = 16'h3980;
              5'h1f: pos_normal = 16'h3980;
              default: begin end
            endcase
          end
          5'h16: begin
            pos_normal = 16'h3981;
            case (mant[4:0])
              5'h02: pos_normal = 16'h3982;
              5'h03: pos_normal = 16'h3982;
              5'h04: pos_normal = 16'h3983;
              5'h05: pos_normal = 16'h3983;
              5'h06: pos_normal = 16'h3984;
              5'h07: pos_normal = 16'h3984;
              5'h08: pos_normal = 16'h3985;
              5'h09: pos_normal = 16'h3985;
              5'h0a: pos_normal = 16'h3986;
              5'h0b: pos_normal = 16'h3986;
              5'h0c: pos_normal = 16'h3987;
              5'h0d: pos_normal = 16'h3987;
              5'h0e: pos_normal = 16'h3988;
              5'h0f: pos_normal = 16'h3988;
              5'h10: pos_normal = 16'h3989;
              5'h11: pos_normal = 16'h398a;
              5'h12: pos_normal = 16'h398a;
              5'h13: pos_normal = 16'h398b;
              5'h14: pos_normal = 16'h398b;
              5'h15: pos_normal = 16'h398c;
              5'h16: pos_normal = 16'h398c;
              5'h17: pos_normal = 16'h398d;
              5'h18: pos_normal = 16'h398d;
              5'h19: pos_normal = 16'h398e;
              5'h1a: pos_normal = 16'h398e;
              5'h1b: pos_normal = 16'h398f;
              5'h1c: pos_normal = 16'h398f;
              5'h1d: pos_normal = 16'h3990;
              5'h1e: pos_normal = 16'h3990;
              5'h1f: pos_normal = 16'h3991;
              default: begin end
            endcase
          end
          5'h17: begin
            pos_normal = 16'h3992;
            case (mant[4:0])
              5'h00: pos_normal = 16'h3991;
              5'h03: pos_normal = 16'h3993;
              5'h04: pos_normal = 16'h3993;
              5'h05: pos_normal = 16'h3994;
              5'h06: pos_normal = 16'h3994;
              5'h07: pos_normal = 16'h3995;
              5'h08: pos_normal = 16'h3995;
              5'h09: pos_normal = 16'h3996;
              5'h0a: pos_normal = 16'h3996;
              5'h0b: pos_normal = 16'h3997;
              5'h0c: pos_normal = 16'h3997;
              5'h0d: pos_normal = 16'h3998;
              5'h0e: pos_normal = 16'h3998;
              5'h0f: pos_normal = 16'h3999;
              5'h10: pos_normal = 16'h3999;
              5'h11: pos_normal = 16'h399a;
              5'h12: pos_normal = 16'h399b;
              5'h13: pos_normal = 16'h399b;
              5'h14: pos_normal = 16'h399c;
              5'h15: pos_normal = 16'h399c;
              5'h16: pos_normal = 16'h399d;
              5'h17: pos_normal = 16'h399d;
              5'h18: pos_normal = 16'h399e;
              5'h19: pos_normal = 16'h399e;
              5'h1a: pos_normal = 16'h399f;
              5'h1b: pos_normal = 16'h399f;
              5'h1c: pos_normal = 16'h39a0;
              5'h1d: pos_normal = 16'h39a0;
              5'h1e: pos_normal = 16'h39a1;
              5'h1f: pos_normal = 16'h39a1;
              default: begin end
            endcase
          end
          5'h18: begin
            pos_normal = 16'h39a2;
            case (mant[4:0])
              5'h02: pos_normal = 16'h39a3;
              5'h03: pos_normal = 16'h39a3;
              5'h04: pos_normal = 16'h39a4;
              5'h05: pos_normal = 16'h39a4;
              5'h06: pos_normal = 16'h39a5;
              5'h07: pos_normal = 16'h39a5;
              5'h08: pos_normal = 16'h39a6;
              5'h09: pos_normal = 16'h39a6;
              5'h0a: pos_normal = 16'h39a7;
              5'h0b: pos_normal = 16'h39a7;
              5'h0c: pos_normal = 16'h39a8;
              5'h0d: pos_normal = 16'h39a8;
              5'h0e: pos_normal = 16'h39a9;
              5'h0f: pos_normal = 16'h39a9;
              5'h10: pos_normal = 16'h39aa;
              5'h11: pos_normal = 16'h39aa;
              5'h12: pos_normal = 16'h39ab;
              5'h13: pos_normal = 16'h39ab;
              5'h14: pos_normal = 16'h39ac;
              5'h15: pos_normal = 16'h39ac;
              5'h16: pos_normal = 16'h39ad;
              5'h17: pos_normal = 16'h39ad;
              5'h18: pos_normal = 16'h39ae;
              5'h19: pos_normal = 16'h39ae;
              5'h1a: pos_normal = 16'h39af;
              5'h1b: pos_normal = 16'h39af;
              5'h1c: pos_normal = 16'h39b0;
              5'h1d: pos_normal = 16'h39b0;
              5'h1e: pos_normal = 16'h39b1;
              5'h1f: pos_normal = 16'h39b1;
              default: begin end
            endcase
          end
          5'h19: begin
            pos_normal = 16'h39b6;
            case (mant[4:0])
              5'h00: pos_normal = 16'h39b2;
              5'h01: pos_normal = 16'h39b2;
              5'h02: pos_normal = 16'h39b3;
              5'h03: pos_normal = 16'h39b3;
              5'h04: pos_normal = 16'h39b4;
              5'h05: pos_normal = 16'h39b4;
              5'h06: pos_normal = 16'h39b5;
              5'h07: pos_normal = 16'h39b5;
              5'h0b: pos_normal = 16'h39b7;
              5'h0c: pos_normal = 16'h39b7;
              5'h0d: pos_normal = 16'h39b8;
              5'h0e: pos_normal = 16'h39b8;
              5'h0f: pos_normal = 16'h39b9;
              5'h10: pos_normal = 16'h39b9;
              5'h11: pos_normal = 16'h39ba;
              5'h12: pos_normal = 16'h39ba;
              5'h13: pos_normal = 16'h39bb;
              5'h14: pos_normal = 16'h39bb;
              5'h15: pos_normal = 16'h39bc;
              5'h16: pos_normal = 16'h39bc;
              5'h17: pos_normal = 16'h39bd;
              5'h18: pos_normal = 16'h39bd;
              5'h19: pos_normal = 16'h39be;
              5'h1a: pos_normal = 16'h39be;
              5'h1b: pos_normal = 16'h39bf;
              5'h1c: pos_normal = 16'h39bf;
              5'h1d: pos_normal = 16'h39c0;
              5'h1e: pos_normal = 16'h39c0;
              5'h1f: pos_normal = 16'h39c1;
              default: begin end
            endcase
          end
          5'h1a: begin
            pos_normal = 16'h39c6;
            case (mant[4:0])
              5'h00: pos_normal = 16'h39c1;
              5'h01: pos_normal = 16'h39c2;
              5'h02: pos_normal = 16'h39c2;
              5'h03: pos_normal = 16'h39c3;
              5'h04: pos_normal = 16'h39c3;
              5'h05: pos_normal = 16'h39c4;
              5'h06: pos_normal = 16'h39c4;
              5'h07: pos_normal = 16'h39c5;
              5'h08: pos_normal = 16'h39c5;
              5'h0c: pos_normal = 16'h39c7;
              5'h0d: pos_normal = 16'h39c7;
              5'h0e: pos_normal = 16'h39c8;
              5'h0f: pos_normal = 16'h39c8;
              5'h10: pos_normal = 16'h39c9;
              5'h11: pos_normal = 16'h39c9;
              5'h12: pos_normal = 16'h39ca;
              5'h13: pos_normal = 16'h39ca;
              5'h14: pos_normal = 16'h39cb;
              5'h15: pos_normal = 16'h39cb;
              5'h16: pos_normal = 16'h39cc;
              5'h17: pos_normal = 16'h39cc;
              5'h18: pos_normal = 16'h39cd;
              5'h19: pos_normal = 16'h39cd;
              5'h1a: pos_normal = 16'h39ce;
              5'h1b: pos_normal = 16'h39ce;
              5'h1c: pos_normal = 16'h39cf;
              5'h1d: pos_normal = 16'h39cf;
              5'h1e: pos_normal = 16'h39d0;
              5'h1f: pos_normal = 16'h39d0;
              default: begin end
            endcase
          end
          5'h1b: begin
            pos_normal = 16'h39d7;
            case (mant[4:0])
              5'h00: pos_normal = 16'h39d0;
              5'h01: pos_normal = 16'h39d1;
              5'h02: pos_normal = 16'h39d1;
              5'h03: pos_normal = 16'h39d2;
              5'h04: pos_normal = 16'h39d2;
              5'h05: pos_normal = 16'h39d3;
              5'h06: pos_normal = 16'h39d3;
              5'h07: pos_normal = 16'h39d4;
              5'h08: pos_normal = 16'h39d4;
              5'h09: pos_normal = 16'h39d5;
              5'h0a: pos_normal = 16'h39d5;
              5'h0b: pos_normal = 16'h39d6;
              5'h0c: pos_normal = 16'h39d6;
              5'h10: pos_normal = 16'h39d8;
              5'h11: pos_normal = 16'h39d8;
              5'h12: pos_normal = 16'h39d9;
              5'h13: pos_normal = 16'h39d9;
              5'h14: pos_normal = 16'h39da;
              5'h15: pos_normal = 16'h39da;
              5'h16: pos_normal = 16'h39db;
              5'h17: pos_normal = 16'h39db;
              5'h18: pos_normal = 16'h39dc;
              5'h19: pos_normal = 16'h39dc;
              5'h1a: pos_normal = 16'h39dd;
              5'h1b: pos_normal = 16'h39dd;
              5'h1c: pos_normal = 16'h39de;
              5'h1d: pos_normal = 16'h39de;
              5'h1e: pos_normal = 16'h39de;
              5'h1f: pos_normal = 16'h39df;
              default: begin end
            endcase
          end
          5'h1c: begin
            pos_normal = 16'h39e4;
            case (mant[4:0])
              5'h00: pos_normal = 16'h39df;
              5'h01: pos_normal = 16'h39e0;
              5'h02: pos_normal = 16'h39e0;
              5'h03: pos_normal = 16'h39e1;
              5'h04: pos_normal = 16'h39e1;
              5'h05: pos_normal = 16'h39e2;
              5'h06: pos_normal = 16'h39e2;
              5'h07: pos_normal = 16'h39e3;
              5'h08: pos_normal = 16'h39e3;
              5'h0c: pos_normal = 16'h39e5;
              5'h0d: pos_normal = 16'h39e5;
              5'h0e: pos_normal = 16'h39e6;
              5'h0f: pos_normal = 16'h39e6;
              5'h10: pos_normal = 16'h39e7;
              5'h11: pos_normal = 16'h39e7;
              5'h12: pos_normal = 16'h39e8;
              5'h13: pos_normal = 16'h39e8;
              5'h14: pos_normal = 16'h39e9;
              5'h15: pos_normal = 16'h39e9;
              5'h16: pos_normal = 16'h39e9;
              5'h17: pos_normal = 16'h39ea;
              5'h18: pos_normal = 16'h39ea;
              5'h19: pos_normal = 16'h39eb;
              5'h1a: pos_normal = 16'h39eb;
              5'h1b: pos_normal = 16'h39ec;
              5'h1c: pos_normal = 16'h39ec;
              5'h1d: pos_normal = 16'h39ed;
              5'h1e: pos_normal = 16'h39ed;
              5'h1f: pos_normal = 16'h39ee;
              default: begin end
            endcase
          end
          5'h1d: begin
            pos_normal = 16'h39f2;
            case (mant[4:0])
              5'h00: pos_normal = 16'h39ee;
              5'h01: pos_normal = 16'h39ee;
              5'h02: pos_normal = 16'h39ef;
              5'h03: pos_normal = 16'h39ef;
              5'h04: pos_normal = 16'h39f0;
              5'h05: pos_normal = 16'h39f0;
              5'h06: pos_normal = 16'h39f1;
              5'h07: pos_normal = 16'h39f1;
              5'h0b: pos_normal = 16'h39f3;
              5'h0c: pos_normal = 16'h39f3;
              5'h0d: pos_normal = 16'h39f4;
              5'h0e: pos_normal = 16'h39f4;
              5'h0f: pos_normal = 16'h39f5;
              5'h10: pos_normal = 16'h39f5;
              5'h11: pos_normal = 16'h39f6;
              5'h12: pos_normal = 16'h39f6;
              5'h13: pos_normal = 16'h39f6;
              5'h14: pos_normal = 16'h39f7;
              5'h15: pos_normal = 16'h39f7;
              5'h16: pos_normal = 16'h39f8;
              5'h17: pos_normal = 16'h39f8;
              5'h18: pos_normal = 16'h39f9;
              5'h19: pos_normal = 16'h39f9;
              5'h1a: pos_normal = 16'h39fa;
              5'h1b: pos_normal = 16'h39fa;
              5'h1c: pos_normal = 16'h39fa;
              5'h1d: pos_normal = 16'h39fb;
              5'h1e: pos_normal = 16'h39fb;
              5'h1f: pos_normal = 16'h39fc;
              default: begin end
            endcase
          end
          5'h1e: begin
            pos_normal = 16'h39fe;
            case (mant[4:0])
              5'h00: pos_normal = 16'h39fc;
              5'h01: pos_normal = 16'h39fd;
              5'h02: pos_normal = 16'h39fd;
              5'h06: pos_normal = 16'h39ff;
              5'h07: pos_normal = 16'h39ff;
              5'h08: pos_normal = 16'h3a00;
              5'h09: pos_normal = 16'h3a00;
              5'h0a: pos_normal = 16'h3a01;
              5'h0b: pos_normal = 16'h3a01;
              5'h0c: pos_normal = 16'h3a01;
              5'h0d: pos_normal = 16'h3a02;
              5'h0e: pos_normal = 16'h3a02;
              5'h0f: pos_normal = 16'h3a03;
              5'h10: pos_normal = 16'h3a03;
              5'h11: pos_normal = 16'h3a04;
              5'h12: pos_normal = 16'h3a04;
              5'h13: pos_normal = 16'h3a05;
              5'h14: pos_normal = 16'h3a05;
              5'h15: pos_normal = 16'h3a05;
              5'h16: pos_normal = 16'h3a06;
              5'h17: pos_normal = 16'h3a06;
              5'h18: pos_normal = 16'h3a07;
              5'h19: pos_normal = 16'h3a07;
              5'h1a: pos_normal = 16'h3a08;
              5'h1b: pos_normal = 16'h3a08;
              5'h1c: pos_normal = 16'h3a08;
              5'h1d: pos_normal = 16'h3a09;
              5'h1e: pos_normal = 16'h3a09;
              5'h1f: pos_normal = 16'h3a0a;
              default: begin end
            endcase
          end
          5'h1f: begin
            pos_normal = 16'h3a0b;
            case (mant[4:0])
              5'h00: pos_normal = 16'h3a0a;
              5'h04: pos_normal = 16'h3a0c;
              5'h05: pos_normal = 16'h3a0c;
              5'h06: pos_normal = 16'h3a0d;
              5'h07: pos_normal = 16'h3a0d;
              5'h08: pos_normal = 16'h3a0e;
              5'h09: pos_normal = 16'h3a0e;
              5'h0a: pos_normal = 16'h3a0e;
              5'h0b: pos_normal = 16'h3a0f;
              5'h0c: pos_normal = 16'h3a0f;
              5'h0d: pos_normal = 16'h3a10;
              5'h0e: pos_normal = 16'h3a10;
              5'h0f: pos_normal = 16'h3a11;
              5'h10: pos_normal = 16'h3a11;
              5'h11: pos_normal = 16'h3a11;
              5'h12: pos_normal = 16'h3a12;
              5'h13: pos_normal = 16'h3a12;
              5'h14: pos_normal = 16'h3a13;
              5'h15: pos_normal = 16'h3a13;
              5'h16: pos_normal = 16'h3a14;
              5'h17: pos_normal = 16'h3a14;
              5'h18: pos_normal = 16'h3a14;
              5'h19: pos_normal = 16'h3a15;
              5'h1a: pos_normal = 16'h3a15;
              5'h1b: pos_normal = 16'h3a16;
              5'h1c: pos_normal = 16'h3a16;
              5'h1d: pos_normal = 16'h3a16;
              5'h1e: pos_normal = 16'h3a17;
              5'h1f: pos_normal = 16'h3a17;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      5'h0f: begin
        case (mant[9:5])
          5'h00: begin
            pos_normal = 16'h3a19;
            case (mant[4:0])
              5'h00: pos_normal = 16'h3a18;
              5'h03: pos_normal = 16'h3a1a;
              5'h04: pos_normal = 16'h3a1b;
              5'h05: pos_normal = 16'h3a1c;
              5'h06: pos_normal = 16'h3a1d;
              5'h07: pos_normal = 16'h3a1e;
              5'h08: pos_normal = 16'h3a1e;
              5'h09: pos_normal = 16'h3a1f;
              5'h0a: pos_normal = 16'h3a20;
              5'h0b: pos_normal = 16'h3a21;
              5'h0c: pos_normal = 16'h3a22;
              5'h0d: pos_normal = 16'h3a23;
              5'h0e: pos_normal = 16'h3a23;
              5'h0f: pos_normal = 16'h3a24;
              5'h10: pos_normal = 16'h3a25;
              5'h11: pos_normal = 16'h3a26;
              5'h12: pos_normal = 16'h3a27;
              5'h13: pos_normal = 16'h3a27;
              5'h14: pos_normal = 16'h3a28;
              5'h15: pos_normal = 16'h3a29;
              5'h16: pos_normal = 16'h3a2a;
              5'h17: pos_normal = 16'h3a2b;
              5'h18: pos_normal = 16'h3a2c;
              5'h19: pos_normal = 16'h3a2c;
              5'h1a: pos_normal = 16'h3a2d;
              5'h1b: pos_normal = 16'h3a2e;
              5'h1c: pos_normal = 16'h3a2f;
              5'h1d: pos_normal = 16'h3a30;
              5'h1e: pos_normal = 16'h3a30;
              5'h1f: pos_normal = 16'h3a31;
              default: begin end
            endcase
          end
          5'h01: begin
            pos_normal = 16'h3a34;
            case (mant[4:0])
              5'h00: pos_normal = 16'h3a32;
              5'h01: pos_normal = 16'h3a33;
              5'h04: pos_normal = 16'h3a35;
              5'h05: pos_normal = 16'h3a36;
              5'h06: pos_normal = 16'h3a37;
              5'h07: pos_normal = 16'h3a38;
              5'h08: pos_normal = 16'h3a38;
              5'h09: pos_normal = 16'h3a39;
              5'h0a: pos_normal = 16'h3a3a;
              5'h0b: pos_normal = 16'h3a3b;
              5'h0c: pos_normal = 16'h3a3c;
              5'h0d: pos_normal = 16'h3a3c;
              5'h0e: pos_normal = 16'h3a3d;
              5'h0f: pos_normal = 16'h3a3e;
              5'h10: pos_normal = 16'h3a3f;
              5'h11: pos_normal = 16'h3a3f;
              5'h12: pos_normal = 16'h3a40;
              5'h13: pos_normal = 16'h3a41;
              5'h14: pos_normal = 16'h3a42;
              5'h15: pos_normal = 16'h3a43;
              5'h16: pos_normal = 16'h3a43;
              5'h17: pos_normal = 16'h3a44;
              5'h18: pos_normal = 16'h3a45;
              5'h19: pos_normal = 16'h3a46;
              5'h1a: pos_normal = 16'h3a46;
              5'h1b: pos_normal = 16'h3a47;
              5'h1c: pos_normal = 16'h3a48;
              5'h1d: pos_normal = 16'h3a49;
              5'h1e: pos_normal = 16'h3a49;
              5'h1f: pos_normal = 16'h3a4a;
              default: begin end
            endcase
          end
          5'h02: begin
            pos_normal = 16'h3a4d;
            case (mant[4:0])
              5'h00: pos_normal = 16'h3a4b;
              5'h01: pos_normal = 16'h3a4c;
              5'h04: pos_normal = 16'h3a4e;
              5'h05: pos_normal = 16'h3a4f;
              5'h06: pos_normal = 16'h3a50;
              5'h07: pos_normal = 16'h3a50;
              5'h08: pos_normal = 16'h3a51;
              5'h09: pos_normal = 16'h3a52;
              5'h0a: pos_normal = 16'h3a53;
              5'h0b: pos_normal = 16'h3a53;
              5'h0c: pos_normal = 16'h3a54;
              5'h0d: pos_normal = 16'h3a55;
              5'h0e: pos_normal = 16'h3a56;
              5'h0f: pos_normal = 16'h3a56;
              5'h10: pos_normal = 16'h3a57;
              5'h11: pos_normal = 16'h3a58;
              5'h12: pos_normal = 16'h3a59;
              5'h13: pos_normal = 16'h3a59;
              5'h14: pos_normal = 16'h3a5a;
              5'h15: pos_normal = 16'h3a5b;
              5'h16: pos_normal = 16'h3a5b;
              5'h17: pos_normal = 16'h3a5c;
              5'h18: pos_normal = 16'h3a5d;
              5'h19: pos_normal = 16'h3a5e;
              5'h1a: pos_normal = 16'h3a5e;
              5'h1b: pos_normal = 16'h3a5f;
              5'h1c: pos_normal = 16'h3a60;
              5'h1d: pos_normal = 16'h3a61;
              5'h1e: pos_normal = 16'h3a61;
              5'h1f: pos_normal = 16'h3a62;
              default: begin end
            endcase
          end
          5'h03: begin
            pos_normal = 16'h3a64;
            case (mant[4:0])
              5'h00: pos_normal = 16'h3a63;
              5'h03: pos_normal = 16'h3a65;
              5'h04: pos_normal = 16'h3a66;
              5'h05: pos_normal = 16'h3a66;
              5'h06: pos_normal = 16'h3a67;
              5'h07: pos_normal = 16'h3a68;
              5'h08: pos_normal = 16'h3a69;
              5'h09: pos_normal = 16'h3a69;
              5'h0a: pos_normal = 16'h3a6a;
              5'h0b: pos_normal = 16'h3a6b;
              5'h0c: pos_normal = 16'h3a6b;
              5'h0d: pos_normal = 16'h3a6c;
              5'h0e: pos_normal = 16'h3a6d;
              5'h0f: pos_normal = 16'h3a6e;
              5'h10: pos_normal = 16'h3a6e;
              5'h11: pos_normal = 16'h3a6f;
              5'h12: pos_normal = 16'h3a70;
              5'h13: pos_normal = 16'h3a70;
              5'h14: pos_normal = 16'h3a71;
              5'h15: pos_normal = 16'h3a72;
              5'h16: pos_normal = 16'h3a72;
              5'h17: pos_normal = 16'h3a73;
              5'h18: pos_normal = 16'h3a74;
              5'h19: pos_normal = 16'h3a75;
              5'h1a: pos_normal = 16'h3a75;
              5'h1b: pos_normal = 16'h3a76;
              5'h1c: pos_normal = 16'h3a77;
              5'h1d: pos_normal = 16'h3a77;
              5'h1e: pos_normal = 16'h3a78;
              5'h1f: pos_normal = 16'h3a79;
              default: begin end
            endcase
          end
          5'h04: begin
            pos_normal = 16'h3a7c;
            case (mant[4:0])
              5'h00: pos_normal = 16'h3a79;
              5'h01: pos_normal = 16'h3a7a;
              5'h02: pos_normal = 16'h3a7b;
              5'h05: pos_normal = 16'h3a7d;
              5'h06: pos_normal = 16'h3a7e;
              5'h07: pos_normal = 16'h3a7e;
              5'h08: pos_normal = 16'h3a7f;
              5'h09: pos_normal = 16'h3a80;
              5'h0a: pos_normal = 16'h3a80;
              5'h0b: pos_normal = 16'h3a81;
              5'h0c: pos_normal = 16'h3a82;
              5'h0d: pos_normal = 16'h3a82;
              5'h0e: pos_normal = 16'h3a83;
              5'h0f: pos_normal = 16'h3a84;
              5'h10: pos_normal = 16'h3a84;
              5'h11: pos_normal = 16'h3a85;
              5'h12: pos_normal = 16'h3a86;
              5'h13: pos_normal = 16'h3a86;
              5'h14: pos_normal = 16'h3a87;
              5'h15: pos_normal = 16'h3a88;
              5'h16: pos_normal = 16'h3a88;
              5'h17: pos_normal = 16'h3a89;
              5'h18: pos_normal = 16'h3a8a;
              5'h19: pos_normal = 16'h3a8a;
              5'h1a: pos_normal = 16'h3a8b;
              5'h1b: pos_normal = 16'h3a8c;
              5'h1c: pos_normal = 16'h3a8c;
              5'h1d: pos_normal = 16'h3a8d;
              5'h1e: pos_normal = 16'h3a8e;
              5'h1f: pos_normal = 16'h3a8e;
              default: begin end
            endcase
          end
          5'h05: begin
            pos_normal = 16'h3a90;
            case (mant[4:0])
              5'h00: pos_normal = 16'h3a8f;
              5'h03: pos_normal = 16'h3a91;
              5'h04: pos_normal = 16'h3a92;
              5'h05: pos_normal = 16'h3a92;
              5'h06: pos_normal = 16'h3a93;
              5'h07: pos_normal = 16'h3a94;
              5'h08: pos_normal = 16'h3a94;
              5'h09: pos_normal = 16'h3a95;
              5'h0a: pos_normal = 16'h3a95;
              5'h0b: pos_normal = 16'h3a96;
              5'h0c: pos_normal = 16'h3a97;
              5'h0d: pos_normal = 16'h3a97;
              5'h0e: pos_normal = 16'h3a98;
              5'h0f: pos_normal = 16'h3a99;
              5'h10: pos_normal = 16'h3a99;
              5'h11: pos_normal = 16'h3a9a;
              5'h12: pos_normal = 16'h3a9b;
              5'h13: pos_normal = 16'h3a9b;
              5'h14: pos_normal = 16'h3a9c;
              5'h15: pos_normal = 16'h3a9d;
              5'h16: pos_normal = 16'h3a9d;
              5'h17: pos_normal = 16'h3a9e;
              5'h18: pos_normal = 16'h3a9e;
              5'h19: pos_normal = 16'h3a9f;
              5'h1a: pos_normal = 16'h3aa0;
              5'h1b: pos_normal = 16'h3aa0;
              5'h1c: pos_normal = 16'h3aa1;
              5'h1d: pos_normal = 16'h3aa2;
              5'h1e: pos_normal = 16'h3aa2;
              5'h1f: pos_normal = 16'h3aa3;
              default: begin end
            endcase
          end
          5'h06: begin
            pos_normal = 16'h3aa5;
            case (mant[4:0])
              5'h00: pos_normal = 16'h3aa3;
              5'h01: pos_normal = 16'h3aa4;
              5'h04: pos_normal = 16'h3aa6;
              5'h05: pos_normal = 16'h3aa7;
              5'h06: pos_normal = 16'h3aa7;
              5'h07: pos_normal = 16'h3aa8;
              5'h08: pos_normal = 16'h3aa8;
              5'h09: pos_normal = 16'h3aa9;
              5'h0a: pos_normal = 16'h3aaa;
              5'h0b: pos_normal = 16'h3aaa;
              5'h0c: pos_normal = 16'h3aab;
              5'h0d: pos_normal = 16'h3aab;
              5'h0e: pos_normal = 16'h3aac;
              5'h0f: pos_normal = 16'h3aad;
              5'h10: pos_normal = 16'h3aad;
              5'h11: pos_normal = 16'h3aae;
              5'h12: pos_normal = 16'h3aae;
              5'h13: pos_normal = 16'h3aaf;
              5'h14: pos_normal = 16'h3ab0;
              5'h15: pos_normal = 16'h3ab0;
              5'h16: pos_normal = 16'h3ab1;
              5'h17: pos_normal = 16'h3ab1;
              5'h18: pos_normal = 16'h3ab2;
              5'h19: pos_normal = 16'h3ab3;
              5'h1a: pos_normal = 16'h3ab3;
              5'h1b: pos_normal = 16'h3ab4;
              5'h1c: pos_normal = 16'h3ab4;
              5'h1d: pos_normal = 16'h3ab5;
              5'h1e: pos_normal = 16'h3ab6;
              5'h1f: pos_normal = 16'h3ab6;
              default: begin end
            endcase
          end
          5'h07: begin
            pos_normal = 16'h3ab7;
            case (mant[4:0])
              5'h02: pos_normal = 16'h3ab8;
              5'h03: pos_normal = 16'h3ab9;
              5'h04: pos_normal = 16'h3ab9;
              5'h05: pos_normal = 16'h3aba;
              5'h06: pos_normal = 16'h3aba;
              5'h07: pos_normal = 16'h3abb;
              5'h08: pos_normal = 16'h3abc;
              5'h09: pos_normal = 16'h3abc;
              5'h0a: pos_normal = 16'h3abd;
              5'h0b: pos_normal = 16'h3abd;
              5'h0c: pos_normal = 16'h3abe;
              5'h0d: pos_normal = 16'h3abe;
              5'h0e: pos_normal = 16'h3abf;
              5'h0f: pos_normal = 16'h3ac0;
              5'h10: pos_normal = 16'h3ac0;
              5'h11: pos_normal = 16'h3ac1;
              5'h12: pos_normal = 16'h3ac1;
              5'h13: pos_normal = 16'h3ac2;
              5'h14: pos_normal = 16'h3ac2;
              5'h15: pos_normal = 16'h3ac3;
              5'h16: pos_normal = 16'h3ac4;
              5'h17: pos_normal = 16'h3ac4;
              5'h18: pos_normal = 16'h3ac5;
              5'h19: pos_normal = 16'h3ac5;
              5'h1a: pos_normal = 16'h3ac6;
              5'h1b: pos_normal = 16'h3ac6;
              5'h1c: pos_normal = 16'h3ac7;
              5'h1d: pos_normal = 16'h3ac8;
              5'h1e: pos_normal = 16'h3ac8;
              5'h1f: pos_normal = 16'h3ac9;
              default: begin end
            endcase
          end
          5'h08: begin
            pos_normal = 16'h3aca;
            case (mant[4:0])
              5'h00: pos_normal = 16'h3ac9;
              5'h03: pos_normal = 16'h3acb;
              5'h04: pos_normal = 16'h3acc;
              5'h05: pos_normal = 16'h3acc;
              5'h06: pos_normal = 16'h3acd;
              5'h07: pos_normal = 16'h3acd;
              5'h08: pos_normal = 16'h3ace;
              5'h09: pos_normal = 16'h3ace;
              5'h0a: pos_normal = 16'h3acf;
              5'h0b: pos_normal = 16'h3acf;
              5'h0c: pos_normal = 16'h3ad0;
              5'h0d: pos_normal = 16'h3ad0;
              5'h0e: pos_normal = 16'h3ad1;
              5'h0f: pos_normal = 16'h3ad2;
              5'h10: pos_normal = 16'h3ad2;
              5'h11: pos_normal = 16'h3ad3;
              5'h12: pos_normal = 16'h3ad3;
              5'h13: pos_normal = 16'h3ad4;
              5'h14: pos_normal = 16'h3ad4;
              5'h15: pos_normal = 16'h3ad5;
              5'h16: pos_normal = 16'h3ad5;
              5'h17: pos_normal = 16'h3ad6;
              5'h18: pos_normal = 16'h3ad6;
              5'h19: pos_normal = 16'h3ad7;
              5'h1a: pos_normal = 16'h3ad8;
              5'h1b: pos_normal = 16'h3ad8;
              5'h1c: pos_normal = 16'h3ad9;
              5'h1d: pos_normal = 16'h3ad9;
              5'h1e: pos_normal = 16'h3ada;
              5'h1f: pos_normal = 16'h3ada;
              default: begin end
            endcase
          end
          5'h09: begin
            pos_normal = 16'h3adb;
            case (mant[4:0])
              5'h02: pos_normal = 16'h3adc;
              5'h03: pos_normal = 16'h3adc;
              5'h04: pos_normal = 16'h3add;
              5'h05: pos_normal = 16'h3add;
              5'h06: pos_normal = 16'h3ade;
              5'h07: pos_normal = 16'h3ade;
              5'h08: pos_normal = 16'h3adf;
              5'h09: pos_normal = 16'h3ae0;
              5'h0a: pos_normal = 16'h3ae0;
              5'h0b: pos_normal = 16'h3ae1;
              5'h0c: pos_normal = 16'h3ae1;
              5'h0d: pos_normal = 16'h3ae2;
              5'h0e: pos_normal = 16'h3ae2;
              5'h0f: pos_normal = 16'h3ae3;
              5'h10: pos_normal = 16'h3ae3;
              5'h11: pos_normal = 16'h3ae4;
              5'h12: pos_normal = 16'h3ae4;
              5'h13: pos_normal = 16'h3ae5;
              5'h14: pos_normal = 16'h3ae5;
              5'h15: pos_normal = 16'h3ae6;
              5'h16: pos_normal = 16'h3ae6;
              5'h17: pos_normal = 16'h3ae7;
              5'h18: pos_normal = 16'h3ae7;
              5'h19: pos_normal = 16'h3ae8;
              5'h1a: pos_normal = 16'h3ae8;
              5'h1b: pos_normal = 16'h3ae9;
              5'h1c: pos_normal = 16'h3ae9;
              5'h1d: pos_normal = 16'h3aea;
              5'h1e: pos_normal = 16'h3aea;
              5'h1f: pos_normal = 16'h3aeb;
              default: begin end
            endcase
          end
          5'h0a: begin
            pos_normal = 16'h3aec;
            case (mant[4:0])
              5'h00: pos_normal = 16'h3aeb;
              5'h03: pos_normal = 16'h3aed;
              5'h04: pos_normal = 16'h3aed;
              5'h05: pos_normal = 16'h3aee;
              5'h06: pos_normal = 16'h3aee;
              5'h07: pos_normal = 16'h3aef;
              5'h08: pos_normal = 16'h3aef;
              5'h09: pos_normal = 16'h3af0;
              5'h0a: pos_normal = 16'h3af0;
              5'h0b: pos_normal = 16'h3af1;
              5'h0c: pos_normal = 16'h3af1;
              5'h0d: pos_normal = 16'h3af2;
              5'h0e: pos_normal = 16'h3af2;
              5'h0f: pos_normal = 16'h3af3;
              5'h10: pos_normal = 16'h3af3;
              5'h11: pos_normal = 16'h3af4;
              5'h12: pos_normal = 16'h3af4;
              5'h13: pos_normal = 16'h3af5;
              5'h14: pos_normal = 16'h3af5;
              5'h15: pos_normal = 16'h3af6;
              5'h16: pos_normal = 16'h3af6;
              5'h17: pos_normal = 16'h3af7;
              5'h18: pos_normal = 16'h3af7;
              5'h19: pos_normal = 16'h3af8;
              5'h1a: pos_normal = 16'h3af8;
              5'h1b: pos_normal = 16'h3af9;
              5'h1c: pos_normal = 16'h3af9;
              5'h1d: pos_normal = 16'h3afa;
              5'h1e: pos_normal = 16'h3afa;
              5'h1f: pos_normal = 16'h3afb;
              default: begin end
            endcase
          end
          5'h0b: begin
            pos_normal = 16'h3afc;
            case (mant[4:0])
              5'h00: pos_normal = 16'h3afb;
              5'h04: pos_normal = 16'h3afd;
              5'h05: pos_normal = 16'h3afd;
              5'h06: pos_normal = 16'h3afe;
              5'h07: pos_normal = 16'h3afe;
              5'h08: pos_normal = 16'h3aff;
              5'h09: pos_normal = 16'h3aff;
              5'h0a: pos_normal = 16'h3b00;
              5'h0b: pos_normal = 16'h3b00;
              5'h0c: pos_normal = 16'h3b01;
              5'h0d: pos_normal = 16'h3b01;
              5'h0e: pos_normal = 16'h3b02;
              5'h0f: pos_normal = 16'h3b02;
              5'h10: pos_normal = 16'h3b03;
              5'h11: pos_normal = 16'h3b03;
              5'h12: pos_normal = 16'h3b03;
              5'h13: pos_normal = 16'h3b04;
              5'h14: pos_normal = 16'h3b04;
              5'h15: pos_normal = 16'h3b05;
              5'h16: pos_normal = 16'h3b05;
              5'h17: pos_normal = 16'h3b06;
              5'h18: pos_normal = 16'h3b06;
              5'h19: pos_normal = 16'h3b07;
              5'h1a: pos_normal = 16'h3b07;
              5'h1b: pos_normal = 16'h3b08;
              5'h1c: pos_normal = 16'h3b08;
              5'h1d: pos_normal = 16'h3b09;
              5'h1e: pos_normal = 16'h3b09;
              5'h1f: pos_normal = 16'h3b09;
              default: begin end
            endcase
          end
          5'h0c: begin
            pos_normal = 16'h3b0d;
            case (mant[4:0])
              5'h00: pos_normal = 16'h3b0a;
              5'h01: pos_normal = 16'h3b0a;
              5'h02: pos_normal = 16'h3b0b;
              5'h03: pos_normal = 16'h3b0b;
              5'h04: pos_normal = 16'h3b0c;
              5'h05: pos_normal = 16'h3b0c;
              5'h09: pos_normal = 16'h3b0e;
              5'h0a: pos_normal = 16'h3b0e;
              5'h0b: pos_normal = 16'h3b0f;
              5'h0c: pos_normal = 16'h3b0f;
              5'h0d: pos_normal = 16'h3b10;
              5'h0e: pos_normal = 16'h3b10;
              5'h0f: pos_normal = 16'h3b11;
              5'h10: pos_normal = 16'h3b11;
              5'h11: pos_normal = 16'h3b11;
              5'h12: pos_normal = 16'h3b12;
              5'h13: pos_normal = 16'h3b12;
              5'h14: pos_normal = 16'h3b13;
              5'h15: pos_normal = 16'h3b13;
              5'h16: pos_normal = 16'h3b14;
              5'h17: pos_normal = 16'h3b14;
              5'h18: pos_normal = 16'h3b15;
              5'h19: pos_normal = 16'h3b15;
              5'h1a: pos_normal = 16'h3b15;
              5'h1b: pos_normal = 16'h3b16;
              5'h1c: pos_normal = 16'h3b16;
              5'h1d: pos_normal = 16'h3b17;
              5'h1e: pos_normal = 16'h3b17;
              5'h1f: pos_normal = 16'h3b18;
              default: begin end
            endcase
          end
          5'h0d: begin
            pos_normal = 16'h3b1b;
            case (mant[4:0])
              5'h00: pos_normal = 16'h3b18;
              5'h01: pos_normal = 16'h3b18;
              5'h02: pos_normal = 16'h3b19;
              5'h03: pos_normal = 16'h3b19;
              5'h04: pos_normal = 16'h3b1a;
              5'h05: pos_normal = 16'h3b1a;
              5'h09: pos_normal = 16'h3b1c;
              5'h0a: pos_normal = 16'h3b1c;
              5'h0b: pos_normal = 16'h3b1d;
              5'h0c: pos_normal = 16'h3b1d;
              5'h0d: pos_normal = 16'h3b1d;
              5'h0e: pos_normal = 16'h3b1e;
              5'h0f: pos_normal = 16'h3b1e;
              5'h10: pos_normal = 16'h3b1f;
              5'h11: pos_normal = 16'h3b1f;
              5'h12: pos_normal = 16'h3b20;
              5'h13: pos_normal = 16'h3b20;
              5'h14: pos_normal = 16'h3b20;
              5'h15: pos_normal = 16'h3b21;
              5'h16: pos_normal = 16'h3b21;
              5'h17: pos_normal = 16'h3b22;
              5'h18: pos_normal = 16'h3b22;
              5'h19: pos_normal = 16'h3b22;
              5'h1a: pos_normal = 16'h3b23;
              5'h1b: pos_normal = 16'h3b23;
              5'h1c: pos_normal = 16'h3b24;
              5'h1d: pos_normal = 16'h3b24;
              5'h1e: pos_normal = 16'h3b24;
              5'h1f: pos_normal = 16'h3b25;
              default: begin end
            endcase
          end
          5'h0e: begin
            pos_normal = 16'h3b26;
            case (mant[4:0])
              5'h00: pos_normal = 16'h3b25;
              5'h04: pos_normal = 16'h3b27;
              5'h05: pos_normal = 16'h3b27;
              5'h06: pos_normal = 16'h3b28;
              5'h07: pos_normal = 16'h3b28;
              5'h08: pos_normal = 16'h3b28;
              5'h09: pos_normal = 16'h3b29;
              5'h0a: pos_normal = 16'h3b29;
              5'h0b: pos_normal = 16'h3b2a;
              5'h0c: pos_normal = 16'h3b2a;
              5'h0d: pos_normal = 16'h3b2a;
              5'h0e: pos_normal = 16'h3b2b;
              5'h0f: pos_normal = 16'h3b2b;
              5'h10: pos_normal = 16'h3b2c;
              5'h11: pos_normal = 16'h3b2c;
              5'h12: pos_normal = 16'h3b2c;
              5'h13: pos_normal = 16'h3b2d;
              5'h14: pos_normal = 16'h3b2d;
              5'h15: pos_normal = 16'h3b2e;
              5'h16: pos_normal = 16'h3b2e;
              5'h17: pos_normal = 16'h3b2e;
              5'h18: pos_normal = 16'h3b2f;
              5'h19: pos_normal = 16'h3b2f;
              5'h1a: pos_normal = 16'h3b30;
              5'h1b: pos_normal = 16'h3b30;
              5'h1c: pos_normal = 16'h3b30;
              5'h1d: pos_normal = 16'h3b31;
              5'h1e: pos_normal = 16'h3b31;
              5'h1f: pos_normal = 16'h3b31;
              default: begin end
            endcase
          end
          5'h0f: begin
            pos_normal = 16'h3b33;
            case (mant[4:0])
              5'h00: pos_normal = 16'h3b32;
              5'h01: pos_normal = 16'h3b32;
              5'h05: pos_normal = 16'h3b34;
              5'h06: pos_normal = 16'h3b34;
              5'h07: pos_normal = 16'h3b35;
              5'h08: pos_normal = 16'h3b35;
              5'h09: pos_normal = 16'h3b35;
              5'h0a: pos_normal = 16'h3b36;
              5'h0b: pos_normal = 16'h3b36;
              5'h0c: pos_normal = 16'h3b36;
              5'h0d: pos_normal = 16'h3b37;
              5'h0e: pos_normal = 16'h3b37;
              5'h0f: pos_normal = 16'h3b38;
              5'h10: pos_normal = 16'h3b38;
              5'h11: pos_normal = 16'h3b38;
              5'h12: pos_normal = 16'h3b39;
              5'h13: pos_normal = 16'h3b39;
              5'h14: pos_normal = 16'h3b39;
              5'h15: pos_normal = 16'h3b3a;
              5'h16: pos_normal = 16'h3b3a;
              5'h17: pos_normal = 16'h3b3a;
              5'h18: pos_normal = 16'h3b3b;
              5'h19: pos_normal = 16'h3b3b;
              5'h1a: pos_normal = 16'h3b3c;
              5'h1b: pos_normal = 16'h3b3c;
              5'h1c: pos_normal = 16'h3b3c;
              5'h1d: pos_normal = 16'h3b3d;
              5'h1e: pos_normal = 16'h3b3d;
              5'h1f: pos_normal = 16'h3b3d;
              default: begin end
            endcase
          end
          5'h10: begin
            pos_normal = 16'h3b3e;
            case (mant[4:0])
              5'h03: pos_normal = 16'h3b3f;
              5'h04: pos_normal = 16'h3b3f;
              5'h05: pos_normal = 16'h3b40;
              5'h06: pos_normal = 16'h3b40;
              5'h07: pos_normal = 16'h3b40;
              5'h08: pos_normal = 16'h3b41;
              5'h09: pos_normal = 16'h3b41;
              5'h0a: pos_normal = 16'h3b41;
              5'h0b: pos_normal = 16'h3b42;
              5'h0c: pos_normal = 16'h3b42;
              5'h0d: pos_normal = 16'h3b42;
              5'h0e: pos_normal = 16'h3b43;
              5'h0f: pos_normal = 16'h3b43;
              5'h10: pos_normal = 16'h3b43;
              5'h11: pos_normal = 16'h3b44;
              5'h12: pos_normal = 16'h3b44;
              5'h13: pos_normal = 16'h3b44;
              5'h14: pos_normal = 16'h3b45;
              5'h15: pos_normal = 16'h3b45;
              5'h16: pos_normal = 16'h3b46;
              5'h17: pos_normal = 16'h3b46;
              5'h18: pos_normal = 16'h3b46;
              5'h19: pos_normal = 16'h3b47;
              5'h1a: pos_normal = 16'h3b47;
              5'h1b: pos_normal = 16'h3b47;
              5'h1c: pos_normal = 16'h3b48;
              5'h1d: pos_normal = 16'h3b48;
              5'h1e: pos_normal = 16'h3b48;
              5'h1f: pos_normal = 16'h3b49;
              default: begin end
            endcase
          end
          5'h11: begin
            pos_normal = 16'h3b4a;
            case (mant[4:0])
              5'h00: pos_normal = 16'h3b49;
              5'h01: pos_normal = 16'h3b49;
              5'h05: pos_normal = 16'h3b4b;
              5'h06: pos_normal = 16'h3b4b;
              5'h07: pos_normal = 16'h3b4b;
              5'h08: pos_normal = 16'h3b4c;
              5'h09: pos_normal = 16'h3b4c;
              5'h0a: pos_normal = 16'h3b4c;
              5'h0b: pos_normal = 16'h3b4d;
              5'h0c: pos_normal = 16'h3b4d;
              5'h0d: pos_normal = 16'h3b4d;
              5'h0e: pos_normal = 16'h3b4e;
              5'h0f: pos_normal = 16'h3b4e;
              5'h10: pos_normal = 16'h3b4e;
              5'h11: pos_normal = 16'h3b4f;
              5'h12: pos_normal = 16'h3b4f;
              5'h13: pos_normal = 16'h3b4f;
              5'h14: pos_normal = 16'h3b50;
              5'h15: pos_normal = 16'h3b50;
              5'h16: pos_normal = 16'h3b50;
              5'h17: pos_normal = 16'h3b51;
              5'h18: pos_normal = 16'h3b51;
              5'h19: pos_normal = 16'h3b51;
              5'h1a: pos_normal = 16'h3b52;
              5'h1b: pos_normal = 16'h3b52;
              5'h1c: pos_normal = 16'h3b52;
              5'h1d: pos_normal = 16'h3b53;
              5'h1e: pos_normal = 16'h3b53;
              5'h1f: pos_normal = 16'h3b53;
              default: begin end
            endcase
          end
          5'h12: begin
            pos_normal = 16'h3b56;
            case (mant[4:0])
              5'h00: pos_normal = 16'h3b54;
              5'h01: pos_normal = 16'h3b54;
              5'h02: pos_normal = 16'h3b54;
              5'h03: pos_normal = 16'h3b55;
              5'h04: pos_normal = 16'h3b55;
              5'h05: pos_normal = 16'h3b55;
              5'h0a: pos_normal = 16'h3b57;
              5'h0b: pos_normal = 16'h3b57;
              5'h0c: pos_normal = 16'h3b57;
              5'h0d: pos_normal = 16'h3b58;
              5'h0e: pos_normal = 16'h3b58;
              5'h0f: pos_normal = 16'h3b58;
              5'h10: pos_normal = 16'h3b59;
              5'h11: pos_normal = 16'h3b59;
              5'h12: pos_normal = 16'h3b59;
              5'h13: pos_normal = 16'h3b5a;
              5'h14: pos_normal = 16'h3b5a;
              5'h15: pos_normal = 16'h3b5a;
              5'h16: pos_normal = 16'h3b5b;
              5'h17: pos_normal = 16'h3b5b;
              5'h18: pos_normal = 16'h3b5b;
              5'h19: pos_normal = 16'h3b5b;
              5'h1a: pos_normal = 16'h3b5c;
              5'h1b: pos_normal = 16'h3b5c;
              5'h1c: pos_normal = 16'h3b5c;
              5'h1d: pos_normal = 16'h3b5d;
              5'h1e: pos_normal = 16'h3b5d;
              5'h1f: pos_normal = 16'h3b5d;
              default: begin end
            endcase
          end
          5'h13: begin
            pos_normal = 16'h3b5f;
            case (mant[4:0])
              5'h00: pos_normal = 16'h3b5e;
              5'h01: pos_normal = 16'h3b5e;
              5'h02: pos_normal = 16'h3b5e;
              5'h07: pos_normal = 16'h3b60;
              5'h08: pos_normal = 16'h3b60;
              5'h09: pos_normal = 16'h3b60;
              5'h0a: pos_normal = 16'h3b61;
              5'h0b: pos_normal = 16'h3b61;
              5'h0c: pos_normal = 16'h3b61;
              5'h0d: pos_normal = 16'h3b62;
              5'h0e: pos_normal = 16'h3b62;
              5'h0f: pos_normal = 16'h3b62;
              5'h10: pos_normal = 16'h3b62;
              5'h11: pos_normal = 16'h3b63;
              5'h12: pos_normal = 16'h3b63;
              5'h13: pos_normal = 16'h3b63;
              5'h14: pos_normal = 16'h3b64;
              5'h15: pos_normal = 16'h3b64;
              5'h16: pos_normal = 16'h3b64;
              5'h17: pos_normal = 16'h3b65;
              5'h18: pos_normal = 16'h3b65;
              5'h19: pos_normal = 16'h3b65;
              5'h1a: pos_normal = 16'h3b65;
              5'h1b: pos_normal = 16'h3b66;
              5'h1c: pos_normal = 16'h3b66;
              5'h1d: pos_normal = 16'h3b66;
              5'h1e: pos_normal = 16'h3b67;
              5'h1f: pos_normal = 16'h3b67;
              default: begin end
            endcase
          end
          5'h14: begin
            pos_normal = 16'h3b69;
            case (mant[4:0])
              5'h00: pos_normal = 16'h3b67;
              5'h01: pos_normal = 16'h3b67;
              5'h02: pos_normal = 16'h3b68;
              5'h03: pos_normal = 16'h3b68;
              5'h04: pos_normal = 16'h3b68;
              5'h09: pos_normal = 16'h3b6a;
              5'h0a: pos_normal = 16'h3b6a;
              5'h0b: pos_normal = 16'h3b6a;
              5'h0c: pos_normal = 16'h3b6b;
              5'h0d: pos_normal = 16'h3b6b;
              5'h0e: pos_normal = 16'h3b6b;
              5'h0f: pos_normal = 16'h3b6b;
              5'h10: pos_normal = 16'h3b6c;
              5'h11: pos_normal = 16'h3b6c;
              5'h12: pos_normal = 16'h3b6c;
              5'h13: pos_normal = 16'h3b6c;
              5'h14: pos_normal = 16'h3b6d;
              5'h15: pos_normal = 16'h3b6d;
              5'h16: pos_normal = 16'h3b6d;
              5'h17: pos_normal = 16'h3b6e;
              5'h18: pos_normal = 16'h3b6e;
              5'h19: pos_normal = 16'h3b6e;
              5'h1a: pos_normal = 16'h3b6e;
              5'h1b: pos_normal = 16'h3b6f;
              5'h1c: pos_normal = 16'h3b6f;
              5'h1d: pos_normal = 16'h3b6f;
              5'h1e: pos_normal = 16'h3b70;
              5'h1f: pos_normal = 16'h3b70;
              default: begin end
            endcase
          end
          5'h15: begin
            pos_normal = 16'h3b71;
            case (mant[4:0])
              5'h00: pos_normal = 16'h3b70;
              5'h01: pos_normal = 16'h3b70;
              5'h06: pos_normal = 16'h3b72;
              5'h07: pos_normal = 16'h3b72;
              5'h08: pos_normal = 16'h3b72;
              5'h09: pos_normal = 16'h3b72;
              5'h0a: pos_normal = 16'h3b73;
              5'h0b: pos_normal = 16'h3b73;
              5'h0c: pos_normal = 16'h3b73;
              5'h0d: pos_normal = 16'h3b74;
              5'h0e: pos_normal = 16'h3b74;
              5'h0f: pos_normal = 16'h3b74;
              5'h10: pos_normal = 16'h3b74;
              5'h11: pos_normal = 16'h3b75;
              5'h12: pos_normal = 16'h3b75;
              5'h13: pos_normal = 16'h3b75;
              5'h14: pos_normal = 16'h3b75;
              5'h15: pos_normal = 16'h3b76;
              5'h16: pos_normal = 16'h3b76;
              5'h17: pos_normal = 16'h3b76;
              5'h18: pos_normal = 16'h3b76;
              5'h19: pos_normal = 16'h3b77;
              5'h1a: pos_normal = 16'h3b77;
              5'h1b: pos_normal = 16'h3b77;
              5'h1c: pos_normal = 16'h3b77;
              5'h1d: pos_normal = 16'h3b78;
              5'h1e: pos_normal = 16'h3b78;
              5'h1f: pos_normal = 16'h3b78;
              default: begin end
            endcase
          end
          5'h16: begin
            pos_normal = 16'h3b7e;
            case (mant[4:0])
              5'h00: pos_normal = 16'h3b78;
              5'h01: pos_normal = 16'h3b79;
              5'h02: pos_normal = 16'h3b79;
              5'h03: pos_normal = 16'h3b79;
              5'h04: pos_normal = 16'h3b79;
              5'h05: pos_normal = 16'h3b7a;
              5'h06: pos_normal = 16'h3b7a;
              5'h07: pos_normal = 16'h3b7a;
              5'h08: pos_normal = 16'h3b7b;
              5'h09: pos_normal = 16'h3b7b;
              5'h0a: pos_normal = 16'h3b7b;
              5'h0b: pos_normal = 16'h3b7b;
              5'h0c: pos_normal = 16'h3b7c;
              5'h0d: pos_normal = 16'h3b7c;
              5'h0e: pos_normal = 16'h3b7c;
              5'h0f: pos_normal = 16'h3b7c;
              5'h10: pos_normal = 16'h3b7d;
              5'h11: pos_normal = 16'h3b7d;
              5'h12: pos_normal = 16'h3b7d;
              5'h13: pos_normal = 16'h3b7d;
              5'h19: pos_normal = 16'h3b7f;
              5'h1a: pos_normal = 16'h3b7f;
              5'h1b: pos_normal = 16'h3b7f;
              5'h1c: pos_normal = 16'h3b7f;
              5'h1d: pos_normal = 16'h3b80;
              5'h1e: pos_normal = 16'h3b80;
              5'h1f: pos_normal = 16'h3b80;
              default: begin end
            endcase
          end
          5'h17: begin
            pos_normal = 16'h3b84;
            case (mant[4:0])
              5'h00: pos_normal = 16'h3b80;
              5'h01: pos_normal = 16'h3b81;
              5'h02: pos_normal = 16'h3b81;
              5'h03: pos_normal = 16'h3b81;
              5'h04: pos_normal = 16'h3b81;
              5'h05: pos_normal = 16'h3b82;
              5'h06: pos_normal = 16'h3b82;
              5'h07: pos_normal = 16'h3b82;
              5'h08: pos_normal = 16'h3b82;
              5'h09: pos_normal = 16'h3b83;
              5'h0a: pos_normal = 16'h3b83;
              5'h0b: pos_normal = 16'h3b83;
              5'h0c: pos_normal = 16'h3b83;
              5'h12: pos_normal = 16'h3b85;
              5'h13: pos_normal = 16'h3b85;
              5'h14: pos_normal = 16'h3b85;
              5'h15: pos_normal = 16'h3b85;
              5'h16: pos_normal = 16'h3b86;
              5'h17: pos_normal = 16'h3b86;
              5'h18: pos_normal = 16'h3b86;
              5'h19: pos_normal = 16'h3b86;
              5'h1a: pos_normal = 16'h3b87;
              5'h1b: pos_normal = 16'h3b87;
              5'h1c: pos_normal = 16'h3b87;
              5'h1d: pos_normal = 16'h3b87;
              5'h1e: pos_normal = 16'h3b87;
              5'h1f: pos_normal = 16'h3b88;
              default: begin end
            endcase
          end
          5'h18: begin
            pos_normal = 16'h3b8a;
            case (mant[4:0])
              5'h00: pos_normal = 16'h3b88;
              5'h01: pos_normal = 16'h3b88;
              5'h02: pos_normal = 16'h3b88;
              5'h03: pos_normal = 16'h3b89;
              5'h04: pos_normal = 16'h3b89;
              5'h05: pos_normal = 16'h3b89;
              5'h06: pos_normal = 16'h3b89;
              5'h0c: pos_normal = 16'h3b8b;
              5'h0d: pos_normal = 16'h3b8b;
              5'h0e: pos_normal = 16'h3b8b;
              5'h0f: pos_normal = 16'h3b8b;
              5'h10: pos_normal = 16'h3b8c;
              5'h11: pos_normal = 16'h3b8c;
              5'h12: pos_normal = 16'h3b8c;
              5'h13: pos_normal = 16'h3b8c;
              5'h14: pos_normal = 16'h3b8c;
              5'h15: pos_normal = 16'h3b8d;
              5'h16: pos_normal = 16'h3b8d;
              5'h17: pos_normal = 16'h3b8d;
              5'h18: pos_normal = 16'h3b8d;
              5'h19: pos_normal = 16'h3b8d;
              5'h1a: pos_normal = 16'h3b8e;
              5'h1b: pos_normal = 16'h3b8e;
              5'h1c: pos_normal = 16'h3b8e;
              5'h1d: pos_normal = 16'h3b8e;
              5'h1e: pos_normal = 16'h3b8f;
              5'h1f: pos_normal = 16'h3b8f;
              default: begin end
            endcase
          end
          5'h19: begin
            pos_normal = 16'h3b91;
            case (mant[4:0])
              5'h00: pos_normal = 16'h3b8f;
              5'h01: pos_normal = 16'h3b8f;
              5'h02: pos_normal = 16'h3b8f;
              5'h03: pos_normal = 16'h3b90;
              5'h04: pos_normal = 16'h3b90;
              5'h05: pos_normal = 16'h3b90;
              5'h06: pos_normal = 16'h3b90;
              5'h0c: pos_normal = 16'h3b92;
              5'h0d: pos_normal = 16'h3b92;
              5'h0e: pos_normal = 16'h3b92;
              5'h0f: pos_normal = 16'h3b92;
              5'h10: pos_normal = 16'h3b92;
              5'h11: pos_normal = 16'h3b93;
              5'h12: pos_normal = 16'h3b93;
              5'h13: pos_normal = 16'h3b93;
              5'h14: pos_normal = 16'h3b93;
              5'h15: pos_normal = 16'h3b93;
              5'h16: pos_normal = 16'h3b94;
              5'h17: pos_normal = 16'h3b94;
              5'h18: pos_normal = 16'h3b94;
              5'h19: pos_normal = 16'h3b94;
              5'h1a: pos_normal = 16'h3b94;
              5'h1b: pos_normal = 16'h3b95;
              5'h1c: pos_normal = 16'h3b95;
              5'h1d: pos_normal = 16'h3b95;
              5'h1e: pos_normal = 16'h3b95;
              5'h1f: pos_normal = 16'h3b95;
              default: begin end
            endcase
          end
          5'h1a: begin
            pos_normal = 16'h3b96;
            case (mant[4:0])
              5'h05: pos_normal = 16'h3b97;
              5'h06: pos_normal = 16'h3b97;
              5'h07: pos_normal = 16'h3b97;
              5'h08: pos_normal = 16'h3b97;
              5'h09: pos_normal = 16'h3b97;
              5'h0a: pos_normal = 16'h3b98;
              5'h0b: pos_normal = 16'h3b98;
              5'h0c: pos_normal = 16'h3b98;
              5'h0d: pos_normal = 16'h3b98;
              5'h0e: pos_normal = 16'h3b98;
              5'h0f: pos_normal = 16'h3b99;
              5'h10: pos_normal = 16'h3b99;
              5'h11: pos_normal = 16'h3b99;
              5'h12: pos_normal = 16'h3b99;
              5'h13: pos_normal = 16'h3b99;
              5'h14: pos_normal = 16'h3b9a;
              5'h15: pos_normal = 16'h3b9a;
              5'h16: pos_normal = 16'h3b9a;
              5'h17: pos_normal = 16'h3b9a;
              5'h18: pos_normal = 16'h3b9a;
              5'h19: pos_normal = 16'h3b9b;
              5'h1a: pos_normal = 16'h3b9b;
              5'h1b: pos_normal = 16'h3b9b;
              5'h1c: pos_normal = 16'h3b9b;
              5'h1d: pos_normal = 16'h3b9b;
              5'h1e: pos_normal = 16'h3b9c;
              5'h1f: pos_normal = 16'h3b9c;
              default: begin end
            endcase
          end
          5'h1b: begin
            pos_normal = 16'h3b9d;
            case (mant[4:0])
              5'h00: pos_normal = 16'h3b9c;
              5'h01: pos_normal = 16'h3b9c;
              5'h02: pos_normal = 16'h3b9c;
              5'h09: pos_normal = 16'h3b9e;
              5'h0a: pos_normal = 16'h3b9e;
              5'h0b: pos_normal = 16'h3b9e;
              5'h0c: pos_normal = 16'h3b9e;
              5'h0d: pos_normal = 16'h3b9e;
              5'h0e: pos_normal = 16'h3b9f;
              5'h0f: pos_normal = 16'h3b9f;
              5'h10: pos_normal = 16'h3b9f;
              5'h11: pos_normal = 16'h3b9f;
              5'h12: pos_normal = 16'h3b9f;
              5'h13: pos_normal = 16'h3ba0;
              5'h14: pos_normal = 16'h3ba0;
              5'h15: pos_normal = 16'h3ba0;
              5'h16: pos_normal = 16'h3ba0;
              5'h17: pos_normal = 16'h3ba0;
              5'h18: pos_normal = 16'h3ba0;
              5'h19: pos_normal = 16'h3ba1;
              5'h1a: pos_normal = 16'h3ba1;
              5'h1b: pos_normal = 16'h3ba1;
              5'h1c: pos_normal = 16'h3ba1;
              5'h1d: pos_normal = 16'h3ba1;
              5'h1e: pos_normal = 16'h3ba2;
              5'h1f: pos_normal = 16'h3ba2;
              default: begin end
            endcase
          end
          5'h1c: begin
            pos_normal = 16'h3ba3;
            case (mant[4:0])
              5'h00: pos_normal = 16'h3ba2;
              5'h01: pos_normal = 16'h3ba2;
              5'h02: pos_normal = 16'h3ba2;
              5'h03: pos_normal = 16'h3ba2;
              5'h0a: pos_normal = 16'h3ba4;
              5'h0b: pos_normal = 16'h3ba4;
              5'h0c: pos_normal = 16'h3ba4;
              5'h0d: pos_normal = 16'h3ba4;
              5'h0e: pos_normal = 16'h3ba4;
              5'h0f: pos_normal = 16'h3ba5;
              5'h10: pos_normal = 16'h3ba5;
              5'h11: pos_normal = 16'h3ba5;
              5'h12: pos_normal = 16'h3ba5;
              5'h13: pos_normal = 16'h3ba5;
              5'h14: pos_normal = 16'h3ba5;
              5'h15: pos_normal = 16'h3ba6;
              5'h16: pos_normal = 16'h3ba6;
              5'h17: pos_normal = 16'h3ba6;
              5'h18: pos_normal = 16'h3ba6;
              5'h19: pos_normal = 16'h3ba6;
              5'h1a: pos_normal = 16'h3ba6;
              5'h1b: pos_normal = 16'h3ba7;
              5'h1c: pos_normal = 16'h3ba7;
              5'h1d: pos_normal = 16'h3ba7;
              5'h1e: pos_normal = 16'h3ba7;
              5'h1f: pos_normal = 16'h3ba7;
              default: begin end
            endcase
          end
          5'h1d: begin
            pos_normal = 16'h3ba8;
            case (mant[4:0])
              5'h00: pos_normal = 16'h3ba7;
              5'h07: pos_normal = 16'h3ba9;
              5'h08: pos_normal = 16'h3ba9;
              5'h09: pos_normal = 16'h3ba9;
              5'h0a: pos_normal = 16'h3ba9;
              5'h0b: pos_normal = 16'h3ba9;
              5'h0c: pos_normal = 16'h3ba9;
              5'h0d: pos_normal = 16'h3baa;
              5'h0e: pos_normal = 16'h3baa;
              5'h0f: pos_normal = 16'h3baa;
              5'h10: pos_normal = 16'h3baa;
              5'h11: pos_normal = 16'h3baa;
              5'h12: pos_normal = 16'h3baa;
              5'h13: pos_normal = 16'h3bab;
              5'h14: pos_normal = 16'h3bab;
              5'h15: pos_normal = 16'h3bab;
              5'h16: pos_normal = 16'h3bab;
              5'h17: pos_normal = 16'h3bab;
              5'h18: pos_normal = 16'h3bab;
              5'h19: pos_normal = 16'h3bac;
              5'h1a: pos_normal = 16'h3bac;
              5'h1b: pos_normal = 16'h3bac;
              5'h1c: pos_normal = 16'h3bac;
              5'h1d: pos_normal = 16'h3bac;
              5'h1e: pos_normal = 16'h3bac;
              5'h1f: pos_normal = 16'h3bad;
              default: begin end
            endcase
          end
          5'h1e: begin
            pos_normal = 16'h3bae;
            case (mant[4:0])
              5'h00: pos_normal = 16'h3bad;
              5'h01: pos_normal = 16'h3bad;
              5'h02: pos_normal = 16'h3bad;
              5'h03: pos_normal = 16'h3bad;
              5'h04: pos_normal = 16'h3bad;
              5'h0c: pos_normal = 16'h3baf;
              5'h0d: pos_normal = 16'h3baf;
              5'h0e: pos_normal = 16'h3baf;
              5'h0f: pos_normal = 16'h3baf;
              5'h10: pos_normal = 16'h3baf;
              5'h11: pos_normal = 16'h3baf;
              5'h12: pos_normal = 16'h3bb0;
              5'h13: pos_normal = 16'h3bb0;
              5'h14: pos_normal = 16'h3bb0;
              5'h15: pos_normal = 16'h3bb0;
              5'h16: pos_normal = 16'h3bb0;
              5'h17: pos_normal = 16'h3bb0;
              5'h18: pos_normal = 16'h3bb0;
              5'h19: pos_normal = 16'h3bb1;
              5'h1a: pos_normal = 16'h3bb1;
              5'h1b: pos_normal = 16'h3bb1;
              5'h1c: pos_normal = 16'h3bb1;
              5'h1d: pos_normal = 16'h3bb1;
              5'h1e: pos_normal = 16'h3bb1;
              5'h1f: pos_normal = 16'h3bb2;
              default: begin end
            endcase
          end
          5'h1f: begin
            pos_normal = 16'h3bb3;
            case (mant[4:0])
              5'h00: pos_normal = 16'h3bb2;
              5'h01: pos_normal = 16'h3bb2;
              5'h02: pos_normal = 16'h3bb2;
              5'h03: pos_normal = 16'h3bb2;
              5'h04: pos_normal = 16'h3bb2;
              5'h05: pos_normal = 16'h3bb2;
              5'h0d: pos_normal = 16'h3bb4;
              5'h0e: pos_normal = 16'h3bb4;
              5'h0f: pos_normal = 16'h3bb4;
              5'h10: pos_normal = 16'h3bb4;
              5'h11: pos_normal = 16'h3bb4;
              5'h12: pos_normal = 16'h3bb4;
              5'h13: pos_normal = 16'h3bb4;
              5'h14: pos_normal = 16'h3bb5;
              5'h15: pos_normal = 16'h3bb5;
              5'h16: pos_normal = 16'h3bb5;
              5'h17: pos_normal = 16'h3bb5;
              5'h18: pos_normal = 16'h3bb5;
              5'h19: pos_normal = 16'h3bb5;
              5'h1a: pos_normal = 16'h3bb5;
              5'h1b: pos_normal = 16'h3bb6;
              5'h1c: pos_normal = 16'h3bb6;
              5'h1d: pos_normal = 16'h3bb6;
              5'h1e: pos_normal = 16'h3bb6;
              5'h1f: pos_normal = 16'h3bb6;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      5'h10: begin
        case (mant[9:5])
          5'h00: begin
            pos_normal = 16'h3bb7;
            case (mant[4:0])
              5'h00: pos_normal = 16'h3bb6;
              5'h05: pos_normal = 16'h3bb8;
              5'h06: pos_normal = 16'h3bb8;
              5'h07: pos_normal = 16'h3bb8;
              5'h08: pos_normal = 16'h3bb9;
              5'h09: pos_normal = 16'h3bb9;
              5'h0a: pos_normal = 16'h3bb9;
              5'h0b: pos_normal = 16'h3bb9;
              5'h0c: pos_normal = 16'h3bba;
              5'h0d: pos_normal = 16'h3bba;
              5'h0e: pos_normal = 16'h3bba;
              5'h0f: pos_normal = 16'h3bba;
              5'h10: pos_normal = 16'h3bbb;
              5'h11: pos_normal = 16'h3bbb;
              5'h12: pos_normal = 16'h3bbb;
              5'h13: pos_normal = 16'h3bbc;
              5'h14: pos_normal = 16'h3bbc;
              5'h15: pos_normal = 16'h3bbc;
              5'h16: pos_normal = 16'h3bbc;
              5'h17: pos_normal = 16'h3bbd;
              5'h18: pos_normal = 16'h3bbd;
              5'h19: pos_normal = 16'h3bbd;
              5'h1a: pos_normal = 16'h3bbd;
              5'h1b: pos_normal = 16'h3bbe;
              5'h1c: pos_normal = 16'h3bbe;
              5'h1d: pos_normal = 16'h3bbe;
              5'h1e: pos_normal = 16'h3bbe;
              5'h1f: pos_normal = 16'h3bbf;
              default: begin end
            endcase
          end
          5'h01: begin
            pos_normal = 16'h3bc2;
            case (mant[4:0])
              5'h00: pos_normal = 16'h3bbf;
              5'h01: pos_normal = 16'h3bbf;
              5'h02: pos_normal = 16'h3bbf;
              5'h03: pos_normal = 16'h3bc0;
              5'h04: pos_normal = 16'h3bc0;
              5'h05: pos_normal = 16'h3bc0;
              5'h06: pos_normal = 16'h3bc0;
              5'h07: pos_normal = 16'h3bc1;
              5'h08: pos_normal = 16'h3bc1;
              5'h09: pos_normal = 16'h3bc1;
              5'h0a: pos_normal = 16'h3bc1;
              5'h10: pos_normal = 16'h3bc3;
              5'h11: pos_normal = 16'h3bc3;
              5'h12: pos_normal = 16'h3bc3;
              5'h13: pos_normal = 16'h3bc3;
              5'h14: pos_normal = 16'h3bc4;
              5'h15: pos_normal = 16'h3bc4;
              5'h16: pos_normal = 16'h3bc4;
              5'h17: pos_normal = 16'h3bc4;
              5'h18: pos_normal = 16'h3bc5;
              5'h19: pos_normal = 16'h3bc5;
              5'h1a: pos_normal = 16'h3bc5;
              5'h1b: pos_normal = 16'h3bc5;
              5'h1c: pos_normal = 16'h3bc6;
              5'h1d: pos_normal = 16'h3bc6;
              5'h1e: pos_normal = 16'h3bc6;
              5'h1f: pos_normal = 16'h3bc6;
              default: begin end
            endcase
          end
          5'h02: begin
            pos_normal = 16'h3bc7;
            case (mant[4:0])
              5'h00: pos_normal = 16'h3bc6;
              5'h06: pos_normal = 16'h3bc8;
              5'h07: pos_normal = 16'h3bc8;
              5'h08: pos_normal = 16'h3bc8;
              5'h09: pos_normal = 16'h3bc8;
              5'h0a: pos_normal = 16'h3bc9;
              5'h0b: pos_normal = 16'h3bc9;
              5'h0c: pos_normal = 16'h3bc9;
              5'h0d: pos_normal = 16'h3bc9;
              5'h0e: pos_normal = 16'h3bc9;
              5'h0f: pos_normal = 16'h3bca;
              5'h10: pos_normal = 16'h3bca;
              5'h11: pos_normal = 16'h3bca;
              5'h12: pos_normal = 16'h3bca;
              5'h13: pos_normal = 16'h3bca;
              5'h14: pos_normal = 16'h3bcb;
              5'h15: pos_normal = 16'h3bcb;
              5'h16: pos_normal = 16'h3bcb;
              5'h17: pos_normal = 16'h3bcb;
              5'h18: pos_normal = 16'h3bcb;
              5'h19: pos_normal = 16'h3bcc;
              5'h1a: pos_normal = 16'h3bcc;
              5'h1b: pos_normal = 16'h3bcc;
              5'h1c: pos_normal = 16'h3bcc;
              5'h1d: pos_normal = 16'h3bcc;
              5'h1e: pos_normal = 16'h3bcd;
              5'h1f: pos_normal = 16'h3bcd;
              default: begin end
            endcase
          end
          5'h03: begin
            pos_normal = 16'h3bd0;
            case (mant[4:0])
              5'h00: pos_normal = 16'h3bcd;
              5'h01: pos_normal = 16'h3bcd;
              5'h02: pos_normal = 16'h3bcd;
              5'h03: pos_normal = 16'h3bce;
              5'h04: pos_normal = 16'h3bce;
              5'h05: pos_normal = 16'h3bce;
              5'h06: pos_normal = 16'h3bce;
              5'h07: pos_normal = 16'h3bce;
              5'h08: pos_normal = 16'h3bcf;
              5'h09: pos_normal = 16'h3bcf;
              5'h0a: pos_normal = 16'h3bcf;
              5'h0b: pos_normal = 16'h3bcf;
              5'h0c: pos_normal = 16'h3bcf;
              5'h13: pos_normal = 16'h3bd1;
              5'h14: pos_normal = 16'h3bd1;
              5'h15: pos_normal = 16'h3bd1;
              5'h16: pos_normal = 16'h3bd1;
              5'h17: pos_normal = 16'h3bd1;
              5'h18: pos_normal = 16'h3bd2;
              5'h19: pos_normal = 16'h3bd2;
              5'h1a: pos_normal = 16'h3bd2;
              5'h1b: pos_normal = 16'h3bd2;
              5'h1c: pos_normal = 16'h3bd2;
              5'h1d: pos_normal = 16'h3bd2;
              5'h1e: pos_normal = 16'h3bd3;
              5'h1f: pos_normal = 16'h3bd3;
              default: begin end
            endcase
          end
          5'h04: begin
            pos_normal = 16'h3bd7;
            case (mant[4:0])
              5'h00: pos_normal = 16'h3bd3;
              5'h01: pos_normal = 16'h3bd3;
              5'h02: pos_normal = 16'h3bd3;
              5'h03: pos_normal = 16'h3bd4;
              5'h04: pos_normal = 16'h3bd4;
              5'h05: pos_normal = 16'h3bd4;
              5'h06: pos_normal = 16'h3bd4;
              5'h07: pos_normal = 16'h3bd4;
              5'h08: pos_normal = 16'h3bd4;
              5'h09: pos_normal = 16'h3bd5;
              5'h0a: pos_normal = 16'h3bd5;
              5'h0b: pos_normal = 16'h3bd5;
              5'h0c: pos_normal = 16'h3bd5;
              5'h0d: pos_normal = 16'h3bd5;
              5'h0e: pos_normal = 16'h3bd5;
              5'h0f: pos_normal = 16'h3bd6;
              5'h10: pos_normal = 16'h3bd6;
              5'h11: pos_normal = 16'h3bd6;
              5'h12: pos_normal = 16'h3bd6;
              5'h13: pos_normal = 16'h3bd6;
              5'h14: pos_normal = 16'h3bd6;
              5'h1c: pos_normal = 16'h3bd8;
              5'h1d: pos_normal = 16'h3bd8;
              5'h1e: pos_normal = 16'h3bd8;
              5'h1f: pos_normal = 16'h3bd8;
              default: begin end
            endcase
          end
          5'h05: begin
            pos_normal = 16'h3bd9;
            case (mant[4:0])
              5'h00: pos_normal = 16'h3bd8;
              5'h01: pos_normal = 16'h3bd8;
              5'h09: pos_normal = 16'h3bda;
              5'h0a: pos_normal = 16'h3bda;
              5'h0b: pos_normal = 16'h3bda;
              5'h0c: pos_normal = 16'h3bda;
              5'h0d: pos_normal = 16'h3bda;
              5'h0e: pos_normal = 16'h3bda;
              5'h0f: pos_normal = 16'h3bda;
              5'h10: pos_normal = 16'h3bdb;
              5'h11: pos_normal = 16'h3bdb;
              5'h12: pos_normal = 16'h3bdb;
              5'h13: pos_normal = 16'h3bdb;
              5'h14: pos_normal = 16'h3bdb;
              5'h15: pos_normal = 16'h3bdb;
              5'h16: pos_normal = 16'h3bdb;
              5'h17: pos_normal = 16'h3bdc;
              5'h18: pos_normal = 16'h3bdc;
              5'h19: pos_normal = 16'h3bdc;
              5'h1a: pos_normal = 16'h3bdc;
              5'h1b: pos_normal = 16'h3bdc;
              5'h1c: pos_normal = 16'h3bdc;
              5'h1d: pos_normal = 16'h3bdc;
              5'h1e: pos_normal = 16'h3bdd;
              5'h1f: pos_normal = 16'h3bdd;
              default: begin end
            endcase
          end
          5'h06: begin
            pos_normal = 16'h3bde;
            case (mant[4:0])
              5'h00: pos_normal = 16'h3bdd;
              5'h01: pos_normal = 16'h3bdd;
              5'h02: pos_normal = 16'h3bdd;
              5'h03: pos_normal = 16'h3bdd;
              5'h04: pos_normal = 16'h3bdd;
              5'h0d: pos_normal = 16'h3bdf;
              5'h0e: pos_normal = 16'h3bdf;
              5'h0f: pos_normal = 16'h3bdf;
              5'h10: pos_normal = 16'h3bdf;
              5'h11: pos_normal = 16'h3bdf;
              5'h12: pos_normal = 16'h3bdf;
              5'h13: pos_normal = 16'h3bdf;
              5'h14: pos_normal = 16'h3bdf;
              5'h15: pos_normal = 16'h3be0;
              5'h16: pos_normal = 16'h3be0;
              5'h17: pos_normal = 16'h3be0;
              5'h18: pos_normal = 16'h3be0;
              5'h19: pos_normal = 16'h3be0;
              5'h1a: pos_normal = 16'h3be0;
              5'h1b: pos_normal = 16'h3be0;
              5'h1c: pos_normal = 16'h3be0;
              5'h1d: pos_normal = 16'h3be1;
              5'h1e: pos_normal = 16'h3be1;
              5'h1f: pos_normal = 16'h3be1;
              default: begin end
            endcase
          end
          5'h07: begin
            pos_normal = 16'h3be4;
            case (mant[4:0])
              5'h00: pos_normal = 16'h3be1;
              5'h01: pos_normal = 16'h3be1;
              5'h02: pos_normal = 16'h3be1;
              5'h03: pos_normal = 16'h3be1;
              5'h04: pos_normal = 16'h3be1;
              5'h05: pos_normal = 16'h3be2;
              5'h06: pos_normal = 16'h3be2;
              5'h07: pos_normal = 16'h3be2;
              5'h08: pos_normal = 16'h3be2;
              5'h09: pos_normal = 16'h3be2;
              5'h0a: pos_normal = 16'h3be2;
              5'h0b: pos_normal = 16'h3be2;
              5'h0c: pos_normal = 16'h3be2;
              5'h0d: pos_normal = 16'h3be2;
              5'h0e: pos_normal = 16'h3be3;
              5'h0f: pos_normal = 16'h3be3;
              5'h10: pos_normal = 16'h3be3;
              5'h11: pos_normal = 16'h3be3;
              5'h12: pos_normal = 16'h3be3;
              5'h13: pos_normal = 16'h3be3;
              5'h14: pos_normal = 16'h3be3;
              5'h15: pos_normal = 16'h3be3;
              default: begin end
            endcase
          end
          5'h08: begin
            pos_normal = 16'h3be6;
            case (mant[4:0])
              5'h00: pos_normal = 16'h3be5;
              5'h01: pos_normal = 16'h3be5;
              5'h02: pos_normal = 16'h3be5;
              5'h03: pos_normal = 16'h3be5;
              5'h04: pos_normal = 16'h3be5;
              5'h05: pos_normal = 16'h3be5;
              5'h06: pos_normal = 16'h3be5;
              5'h07: pos_normal = 16'h3be5;
              5'h08: pos_normal = 16'h3be5;
              5'h13: pos_normal = 16'h3be7;
              5'h14: pos_normal = 16'h3be7;
              5'h15: pos_normal = 16'h3be7;
              5'h16: pos_normal = 16'h3be7;
              5'h17: pos_normal = 16'h3be7;
              5'h18: pos_normal = 16'h3be7;
              5'h19: pos_normal = 16'h3be7;
              5'h1a: pos_normal = 16'h3be7;
              5'h1b: pos_normal = 16'h3be7;
              5'h1c: pos_normal = 16'h3be7;
              5'h1d: pos_normal = 16'h3be8;
              5'h1e: pos_normal = 16'h3be8;
              5'h1f: pos_normal = 16'h3be8;
              default: begin end
            endcase
          end
          5'h09: begin
            pos_normal = 16'h3bea;
            case (mant[4:0])
              5'h00: pos_normal = 16'h3be8;
              5'h01: pos_normal = 16'h3be8;
              5'h02: pos_normal = 16'h3be8;
              5'h03: pos_normal = 16'h3be8;
              5'h04: pos_normal = 16'h3be8;
              5'h05: pos_normal = 16'h3be8;
              5'h06: pos_normal = 16'h3be8;
              5'h07: pos_normal = 16'h3be8;
              5'h08: pos_normal = 16'h3be9;
              5'h09: pos_normal = 16'h3be9;
              5'h0a: pos_normal = 16'h3be9;
              5'h0b: pos_normal = 16'h3be9;
              5'h0c: pos_normal = 16'h3be9;
              5'h0d: pos_normal = 16'h3be9;
              5'h0e: pos_normal = 16'h3be9;
              5'h0f: pos_normal = 16'h3be9;
              5'h10: pos_normal = 16'h3be9;
              5'h11: pos_normal = 16'h3be9;
              5'h12: pos_normal = 16'h3be9;
              5'h1f: pos_normal = 16'h3beb;
              default: begin end
            endcase
          end
          5'h0a: begin
            pos_normal = 16'h3bec;
            case (mant[4:0])
              5'h00: pos_normal = 16'h3beb;
              5'h01: pos_normal = 16'h3beb;
              5'h02: pos_normal = 16'h3beb;
              5'h03: pos_normal = 16'h3beb;
              5'h04: pos_normal = 16'h3beb;
              5'h05: pos_normal = 16'h3beb;
              5'h06: pos_normal = 16'h3beb;
              5'h07: pos_normal = 16'h3beb;
              5'h08: pos_normal = 16'h3beb;
              5'h09: pos_normal = 16'h3beb;
              5'h0a: pos_normal = 16'h3beb;
              5'h18: pos_normal = 16'h3bed;
              5'h19: pos_normal = 16'h3bed;
              5'h1a: pos_normal = 16'h3bed;
              5'h1b: pos_normal = 16'h3bed;
              5'h1c: pos_normal = 16'h3bed;
              5'h1d: pos_normal = 16'h3bed;
              5'h1e: pos_normal = 16'h3bed;
              5'h1f: pos_normal = 16'h3bed;
              default: begin end
            endcase
          end
          5'h0b: begin
            pos_normal = 16'h3bee;
            case (mant[4:0])
              5'h00: pos_normal = 16'h3bed;
              5'h01: pos_normal = 16'h3bed;
              5'h02: pos_normal = 16'h3bed;
              5'h03: pos_normal = 16'h3bed;
              5'h04: pos_normal = 16'h3bed;
              5'h05: pos_normal = 16'h3bed;
              5'h14: pos_normal = 16'h3bef;
              5'h15: pos_normal = 16'h3bef;
              5'h16: pos_normal = 16'h3bef;
              5'h17: pos_normal = 16'h3bef;
              5'h18: pos_normal = 16'h3bef;
              5'h19: pos_normal = 16'h3bef;
              5'h1a: pos_normal = 16'h3bef;
              5'h1b: pos_normal = 16'h3bef;
              5'h1c: pos_normal = 16'h3bef;
              5'h1d: pos_normal = 16'h3bef;
              5'h1e: pos_normal = 16'h3bef;
              5'h1f: pos_normal = 16'h3bef;
              default: begin end
            endcase
          end
          5'h0c: begin
            pos_normal = 16'h3bf0;
            case (mant[4:0])
              5'h00: pos_normal = 16'h3bef;
              5'h01: pos_normal = 16'h3bef;
              5'h02: pos_normal = 16'h3bef;
              5'h13: pos_normal = 16'h3bf1;
              5'h14: pos_normal = 16'h3bf1;
              5'h15: pos_normal = 16'h3bf1;
              5'h16: pos_normal = 16'h3bf1;
              5'h17: pos_normal = 16'h3bf1;
              5'h18: pos_normal = 16'h3bf1;
              5'h19: pos_normal = 16'h3bf1;
              5'h1a: pos_normal = 16'h3bf1;
              5'h1b: pos_normal = 16'h3bf1;
              5'h1c: pos_normal = 16'h3bf1;
              5'h1d: pos_normal = 16'h3bf1;
              5'h1e: pos_normal = 16'h3bf1;
              5'h1f: pos_normal = 16'h3bf1;
              default: begin end
            endcase
          end
          5'h0d: begin
            pos_normal = 16'h3bf2;
            case (mant[4:0])
              5'h00: pos_normal = 16'h3bf1;
              5'h01: pos_normal = 16'h3bf1;
              5'h02: pos_normal = 16'h3bf1;
              5'h03: pos_normal = 16'h3bf1;
              5'h17: pos_normal = 16'h3bf3;
              5'h18: pos_normal = 16'h3bf3;
              5'h19: pos_normal = 16'h3bf3;
              5'h1a: pos_normal = 16'h3bf3;
              5'h1b: pos_normal = 16'h3bf3;
              5'h1c: pos_normal = 16'h3bf3;
              5'h1d: pos_normal = 16'h3bf3;
              5'h1e: pos_normal = 16'h3bf3;
              5'h1f: pos_normal = 16'h3bf3;
              default: begin end
            endcase
          end
          5'h0e: begin
            pos_normal = 16'h3bf4;
            case (mant[4:0])
              5'h00: pos_normal = 16'h3bf3;
              5'h01: pos_normal = 16'h3bf3;
              5'h02: pos_normal = 16'h3bf3;
              5'h03: pos_normal = 16'h3bf3;
              5'h04: pos_normal = 16'h3bf3;
              5'h05: pos_normal = 16'h3bf3;
              5'h06: pos_normal = 16'h3bf3;
              5'h07: pos_normal = 16'h3bf3;
              5'h08: pos_normal = 16'h3bf3;
              5'h09: pos_normal = 16'h3bf3;
              default: begin end
            endcase
          end
          5'h0f: begin
            pos_normal = 16'h3bf5;
            case (mant[4:0])
              5'h17: pos_normal = 16'h3bf6;
              5'h18: pos_normal = 16'h3bf6;
              5'h19: pos_normal = 16'h3bf6;
              5'h1a: pos_normal = 16'h3bf6;
              5'h1b: pos_normal = 16'h3bf6;
              5'h1c: pos_normal = 16'h3bf6;
              5'h1d: pos_normal = 16'h3bf6;
              5'h1e: pos_normal = 16'h3bf6;
              5'h1f: pos_normal = 16'h3bf6;
              default: begin end
            endcase
          end
          5'h10: begin
            pos_normal = 16'h3bf6;
            case (mant[4:0])
              5'h11: pos_normal = 16'h3bf7;
              5'h12: pos_normal = 16'h3bf7;
              5'h13: pos_normal = 16'h3bf7;
              5'h14: pos_normal = 16'h3bf7;
              5'h15: pos_normal = 16'h3bf7;
              5'h16: pos_normal = 16'h3bf7;
              5'h17: pos_normal = 16'h3bf7;
              5'h18: pos_normal = 16'h3bf7;
              5'h19: pos_normal = 16'h3bf7;
              5'h1a: pos_normal = 16'h3bf7;
              5'h1b: pos_normal = 16'h3bf7;
              5'h1c: pos_normal = 16'h3bf7;
              5'h1d: pos_normal = 16'h3bf7;
              5'h1e: pos_normal = 16'h3bf7;
              5'h1f: pos_normal = 16'h3bf7;
              default: begin end
            endcase
          end
          5'h11: begin
            pos_normal = 16'h3bf8;
            case (mant[4:0])
              5'h00: pos_normal = 16'h3bf7;
              5'h01: pos_normal = 16'h3bf7;
              5'h02: pos_normal = 16'h3bf7;
              5'h03: pos_normal = 16'h3bf7;
              5'h04: pos_normal = 16'h3bf7;
              5'h05: pos_normal = 16'h3bf7;
              5'h06: pos_normal = 16'h3bf7;
              5'h07: pos_normal = 16'h3bf7;
              5'h08: pos_normal = 16'h3bf7;
              5'h09: pos_normal = 16'h3bf7;
              5'h0a: pos_normal = 16'h3bf7;
              5'h0b: pos_normal = 16'h3bf7;
              5'h0c: pos_normal = 16'h3bf7;
              default: begin end
            endcase
          end
          5'h12: begin
            pos_normal = 16'h3bf9;
            case (mant[4:0])
              5'h00: pos_normal = 16'h3bf8;
              5'h01: pos_normal = 16'h3bf8;
              5'h02: pos_normal = 16'h3bf8;
              5'h03: pos_normal = 16'h3bf8;
              5'h04: pos_normal = 16'h3bf8;
              5'h05: pos_normal = 16'h3bf8;
              5'h06: pos_normal = 16'h3bf8;
              5'h07: pos_normal = 16'h3bf8;
              5'h08: pos_normal = 16'h3bf8;
              5'h09: pos_normal = 16'h3bf8;
              5'h0a: pos_normal = 16'h3bf8;
              5'h0b: pos_normal = 16'h3bf8;
              5'h0c: pos_normal = 16'h3bf8;
              5'h0d: pos_normal = 16'h3bf8;
              default: begin end
            endcase
          end
          5'h13: begin
            pos_normal = 16'h3bf9;
            case (mant[4:0])
              5'h12: pos_normal = 16'h3bfa;
              5'h13: pos_normal = 16'h3bfa;
              5'h14: pos_normal = 16'h3bfa;
              5'h15: pos_normal = 16'h3bfa;
              5'h16: pos_normal = 16'h3bfa;
              5'h17: pos_normal = 16'h3bfa;
              5'h18: pos_normal = 16'h3bfa;
              5'h19: pos_normal = 16'h3bfa;
              5'h1a: pos_normal = 16'h3bfa;
              5'h1b: pos_normal = 16'h3bfa;
              5'h1c: pos_normal = 16'h3bfa;
              5'h1d: pos_normal = 16'h3bfa;
              5'h1e: pos_normal = 16'h3bfa;
              5'h1f: pos_normal = 16'h3bfa;
              default: begin end
            endcase
          end
          5'h14: begin
            pos_normal = 16'h3bfa;
            case (mant[4:0])
              5'h1d: pos_normal = 16'h3bfb;
              5'h1e: pos_normal = 16'h3bfb;
              5'h1f: pos_normal = 16'h3bfb;
              default: begin end
            endcase
          end
          5'h15: pos_normal = 16'h3bfb;
          5'h16: begin
            pos_normal = 16'h3bfb;
            case (mant[4:0])
              5'h11: pos_normal = 16'h3bfc;
              5'h12: pos_normal = 16'h3bfc;
              5'h13: pos_normal = 16'h3bfc;
              5'h14: pos_normal = 16'h3bfc;
              5'h15: pos_normal = 16'h3bfc;
              5'h16: pos_normal = 16'h3bfc;
              5'h17: pos_normal = 16'h3bfc;
              5'h18: pos_normal = 16'h3bfc;
              5'h19: pos_normal = 16'h3bfc;
              5'h1a: pos_normal = 16'h3bfc;
              5'h1b: pos_normal = 16'h3bfc;
              5'h1c: pos_normal = 16'h3bfc;
              5'h1d: pos_normal = 16'h3bfc;
              5'h1e: pos_normal = 16'h3bfc;
              5'h1f: pos_normal = 16'h3bfc;
              default: begin end
            endcase
          end
          5'h17: pos_normal = 16'h3bfc;
          5'h18: begin
            pos_normal = 16'h3bfc;
            case (mant[4:0])
              5'h11: pos_normal = 16'h3bfd;
              5'h12: pos_normal = 16'h3bfd;
              5'h13: pos_normal = 16'h3bfd;
              5'h14: pos_normal = 16'h3bfd;
              5'h15: pos_normal = 16'h3bfd;
              5'h16: pos_normal = 16'h3bfd;
              5'h17: pos_normal = 16'h3bfd;
              5'h18: pos_normal = 16'h3bfd;
              5'h19: pos_normal = 16'h3bfd;
              5'h1a: pos_normal = 16'h3bfd;
              5'h1b: pos_normal = 16'h3bfd;
              5'h1c: pos_normal = 16'h3bfd;
              5'h1d: pos_normal = 16'h3bfd;
              5'h1e: pos_normal = 16'h3bfd;
              5'h1f: pos_normal = 16'h3bfd;
              default: begin end
            endcase
          end
          5'h19: pos_normal = 16'h3bfd;
          5'h1a: pos_normal = 16'h3bfd;
          5'h1b: begin
            pos_normal = 16'h3bfe;
            case (mant[4:0])
              5'h00: pos_normal = 16'h3bfd;
              5'h01: pos_normal = 16'h3bfd;
              5'h02: pos_normal = 16'h3bfd;
              5'h03: pos_normal = 16'h3bfd;
              5'h04: pos_normal = 16'h3bfd;
              5'h05: pos_normal = 16'h3bfd;
              5'h06: pos_normal = 16'h3bfd;
              default: begin end
            endcase
          end
          5'h1c: pos_normal = 16'h3bfe;
          5'h1d: pos_normal = 16'h3bfe;
          5'h1e: pos_normal = 16'h3bfe;
          5'h1f: begin
            pos_normal = 16'h3bff;
            case (mant[4:0])
              5'h00: pos_normal = 16'h3bfe;
              5'h01: pos_normal = 16'h3bfe;
              5'h02: pos_normal = 16'h3bfe;
              5'h03: pos_normal = 16'h3bfe;
              5'h04: pos_normal = 16'h3bfe;
              5'h05: pos_normal = 16'h3bfe;
              5'h06: pos_normal = 16'h3bfe;
              5'h07: pos_normal = 16'h3bfe;
              5'h08: pos_normal = 16'h3bfe;
              5'h09: pos_normal = 16'h3bfe;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      5'h11: begin
        case (mant[9:5])
          5'h00: pos_normal = 16'h3bff;
          5'h01: pos_normal = 16'h3bff;
          5'h02: pos_normal = 16'h3bff;
          5'h03: pos_normal = 16'h3bff;
          5'h04: begin
            pos_normal = 16'h3c00;
            case (mant[4:0])
              5'h00: pos_normal = 16'h3bff;
              5'h01: pos_normal = 16'h3bff;
              default: begin end
            endcase
          end
          5'h05: pos_normal = 16'h3c00;
          5'h06: pos_normal = 16'h3c00;
          5'h07: pos_normal = 16'h3c00;
          5'h08: pos_normal = 16'h3c00;
          5'h09: pos_normal = 16'h3c00;
          5'h0a: pos_normal = 16'h3c00;
          5'h0b: pos_normal = 16'h3c00;
          5'h0c: pos_normal = 16'h3c00;
          5'h0d: pos_normal = 16'h3c00;
          5'h0e: pos_normal = 16'h3c00;
          5'h0f: pos_normal = 16'h3c00;
          5'h10: pos_normal = 16'h3c00;
          5'h11: pos_normal = 16'h3c00;
          5'h12: pos_normal = 16'h3c00;
          5'h13: pos_normal = 16'h3c00;
          5'h14: pos_normal = 16'h3c00;
          5'h15: pos_normal = 16'h3c00;
          5'h16: pos_normal = 16'h3c00;
          5'h17: pos_normal = 16'h3c00;
          5'h18: pos_normal = 16'h3c00;
          5'h19: pos_normal = 16'h3c00;
          5'h1a: pos_normal = 16'h3c00;
          5'h1b: pos_normal = 16'h3c00;
          5'h1c: pos_normal = 16'h3c00;
          5'h1d: pos_normal = 16'h3c00;
          5'h1e: pos_normal = 16'h3c00;
          5'h1f: pos_normal = 16'h3c00;
          default: begin end
        endcase
      end
      default: begin end
    endcase
  end
  wire [15:0] pos_out = active_exp ? pos_normal : pos_special;
  wire [15:0] neg_out = (pos_out == 16'h7e00) ? 16'h7e00 : (pos_out ^ 16'h8000);
  assign out = sign ? neg_out : pos_out;
endmodule
