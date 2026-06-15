module ex229_odd_nested_low10_hi6(in, out);
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
  reg [9:0] pos_low;
  always @* begin
    pos_low = 10'h000;
    case (exp)
      5'h01: begin
        case (mant[9:4])
          6'h00: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h000;
              4'h1: pos_low = 10'h001;
              4'h2: pos_low = 10'h002;
              4'h3: pos_low = 10'h003;
              4'h4: pos_low = 10'h004;
              4'h5: pos_low = 10'h005;
              4'h6: pos_low = 10'h006;
              4'h7: pos_low = 10'h007;
              4'h8: pos_low = 10'h008;
              4'h9: pos_low = 10'h009;
              4'ha: pos_low = 10'h00a;
              4'hb: pos_low = 10'h00b;
              4'hc: pos_low = 10'h00c;
              4'hd: pos_low = 10'h00d;
              4'he: pos_low = 10'h00e;
              4'hf: pos_low = 10'h00f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h01: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h010;
              4'h1: pos_low = 10'h011;
              4'h2: pos_low = 10'h012;
              4'h3: pos_low = 10'h013;
              4'h4: pos_low = 10'h014;
              4'h5: pos_low = 10'h015;
              4'h6: pos_low = 10'h016;
              4'h7: pos_low = 10'h017;
              4'h8: pos_low = 10'h018;
              4'h9: pos_low = 10'h019;
              4'ha: pos_low = 10'h01a;
              4'hb: pos_low = 10'h01b;
              4'hc: pos_low = 10'h01c;
              4'hd: pos_low = 10'h01d;
              4'he: pos_low = 10'h01e;
              4'hf: pos_low = 10'h01f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h02: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h020;
              4'h1: pos_low = 10'h021;
              4'h2: pos_low = 10'h022;
              4'h3: pos_low = 10'h023;
              4'h4: pos_low = 10'h024;
              4'h5: pos_low = 10'h025;
              4'h6: pos_low = 10'h026;
              4'h7: pos_low = 10'h027;
              4'h8: pos_low = 10'h028;
              4'h9: pos_low = 10'h029;
              4'ha: pos_low = 10'h02a;
              4'hb: pos_low = 10'h02b;
              4'hc: pos_low = 10'h02c;
              4'hd: pos_low = 10'h02d;
              4'he: pos_low = 10'h02e;
              4'hf: pos_low = 10'h02f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h03: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h030;
              4'h1: pos_low = 10'h031;
              4'h2: pos_low = 10'h032;
              4'h3: pos_low = 10'h033;
              4'h4: pos_low = 10'h034;
              4'h5: pos_low = 10'h035;
              4'h6: pos_low = 10'h036;
              4'h7: pos_low = 10'h037;
              4'h8: pos_low = 10'h038;
              4'h9: pos_low = 10'h039;
              4'ha: pos_low = 10'h03a;
              4'hb: pos_low = 10'h03b;
              4'hc: pos_low = 10'h03c;
              4'hd: pos_low = 10'h03d;
              4'he: pos_low = 10'h03e;
              4'hf: pos_low = 10'h03f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h04: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h040;
              4'h1: pos_low = 10'h041;
              4'h2: pos_low = 10'h042;
              4'h3: pos_low = 10'h043;
              4'h4: pos_low = 10'h044;
              4'h5: pos_low = 10'h045;
              4'h6: pos_low = 10'h046;
              4'h7: pos_low = 10'h047;
              4'h8: pos_low = 10'h048;
              4'h9: pos_low = 10'h049;
              4'ha: pos_low = 10'h04a;
              4'hb: pos_low = 10'h04b;
              4'hc: pos_low = 10'h04c;
              4'hd: pos_low = 10'h04d;
              4'he: pos_low = 10'h04e;
              4'hf: pos_low = 10'h04f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h05: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h050;
              4'h1: pos_low = 10'h051;
              4'h2: pos_low = 10'h052;
              4'h3: pos_low = 10'h053;
              4'h4: pos_low = 10'h054;
              4'h5: pos_low = 10'h055;
              4'h6: pos_low = 10'h056;
              4'h7: pos_low = 10'h057;
              4'h8: pos_low = 10'h058;
              4'h9: pos_low = 10'h059;
              4'ha: pos_low = 10'h05a;
              4'hb: pos_low = 10'h05b;
              4'hc: pos_low = 10'h05c;
              4'hd: pos_low = 10'h05d;
              4'he: pos_low = 10'h05e;
              4'hf: pos_low = 10'h05f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h06: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h060;
              4'h1: pos_low = 10'h061;
              4'h2: pos_low = 10'h062;
              4'h3: pos_low = 10'h063;
              4'h4: pos_low = 10'h064;
              4'h5: pos_low = 10'h065;
              4'h6: pos_low = 10'h066;
              4'h7: pos_low = 10'h067;
              4'h8: pos_low = 10'h068;
              4'h9: pos_low = 10'h069;
              4'ha: pos_low = 10'h06a;
              4'hb: pos_low = 10'h06b;
              4'hc: pos_low = 10'h06c;
              4'hd: pos_low = 10'h06d;
              4'he: pos_low = 10'h06e;
              4'hf: pos_low = 10'h06f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h07: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h070;
              4'h1: pos_low = 10'h071;
              4'h2: pos_low = 10'h072;
              4'h3: pos_low = 10'h073;
              4'h4: pos_low = 10'h074;
              4'h5: pos_low = 10'h075;
              4'h6: pos_low = 10'h076;
              4'h7: pos_low = 10'h077;
              4'h8: pos_low = 10'h078;
              4'h9: pos_low = 10'h079;
              4'ha: pos_low = 10'h07a;
              4'hb: pos_low = 10'h07b;
              4'hc: pos_low = 10'h07c;
              4'hd: pos_low = 10'h07d;
              4'he: pos_low = 10'h07e;
              4'hf: pos_low = 10'h07f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h08: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h080;
              4'h1: pos_low = 10'h081;
              4'h2: pos_low = 10'h082;
              4'h3: pos_low = 10'h083;
              4'h4: pos_low = 10'h084;
              4'h5: pos_low = 10'h085;
              4'h6: pos_low = 10'h086;
              4'h7: pos_low = 10'h087;
              4'h8: pos_low = 10'h088;
              4'h9: pos_low = 10'h089;
              4'ha: pos_low = 10'h08a;
              4'hb: pos_low = 10'h08b;
              4'hc: pos_low = 10'h08c;
              4'hd: pos_low = 10'h08d;
              4'he: pos_low = 10'h08e;
              4'hf: pos_low = 10'h08f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h09: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h090;
              4'h1: pos_low = 10'h091;
              4'h2: pos_low = 10'h092;
              4'h3: pos_low = 10'h093;
              4'h4: pos_low = 10'h094;
              4'h5: pos_low = 10'h095;
              4'h6: pos_low = 10'h096;
              4'h7: pos_low = 10'h097;
              4'h8: pos_low = 10'h098;
              4'h9: pos_low = 10'h099;
              4'ha: pos_low = 10'h09a;
              4'hb: pos_low = 10'h09b;
              4'hc: pos_low = 10'h09c;
              4'hd: pos_low = 10'h09d;
              4'he: pos_low = 10'h09e;
              4'hf: pos_low = 10'h09f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h0a: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h0a0;
              4'h1: pos_low = 10'h0a1;
              4'h2: pos_low = 10'h0a2;
              4'h3: pos_low = 10'h0a3;
              4'h4: pos_low = 10'h0a4;
              4'h5: pos_low = 10'h0a5;
              4'h6: pos_low = 10'h0a6;
              4'h7: pos_low = 10'h0a7;
              4'h8: pos_low = 10'h0a8;
              4'h9: pos_low = 10'h0a9;
              4'ha: pos_low = 10'h0aa;
              4'hb: pos_low = 10'h0ab;
              4'hc: pos_low = 10'h0ac;
              4'hd: pos_low = 10'h0ad;
              4'he: pos_low = 10'h0ae;
              4'hf: pos_low = 10'h0af;
              default: pos_low = 10'h000;
            endcase
          end
          6'h0b: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h0b0;
              4'h1: pos_low = 10'h0b1;
              4'h2: pos_low = 10'h0b2;
              4'h3: pos_low = 10'h0b3;
              4'h4: pos_low = 10'h0b4;
              4'h5: pos_low = 10'h0b5;
              4'h6: pos_low = 10'h0b6;
              4'h7: pos_low = 10'h0b7;
              4'h8: pos_low = 10'h0b8;
              4'h9: pos_low = 10'h0b9;
              4'ha: pos_low = 10'h0ba;
              4'hb: pos_low = 10'h0bb;
              4'hc: pos_low = 10'h0bc;
              4'hd: pos_low = 10'h0bd;
              4'he: pos_low = 10'h0be;
              4'hf: pos_low = 10'h0bf;
              default: pos_low = 10'h000;
            endcase
          end
          6'h0c: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h0c0;
              4'h1: pos_low = 10'h0c1;
              4'h2: pos_low = 10'h0c2;
              4'h3: pos_low = 10'h0c3;
              4'h4: pos_low = 10'h0c4;
              4'h5: pos_low = 10'h0c5;
              4'h6: pos_low = 10'h0c6;
              4'h7: pos_low = 10'h0c7;
              4'h8: pos_low = 10'h0c8;
              4'h9: pos_low = 10'h0c9;
              4'ha: pos_low = 10'h0ca;
              4'hb: pos_low = 10'h0cb;
              4'hc: pos_low = 10'h0cc;
              4'hd: pos_low = 10'h0cd;
              4'he: pos_low = 10'h0ce;
              4'hf: pos_low = 10'h0cf;
              default: pos_low = 10'h000;
            endcase
          end
          6'h0d: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h0d0;
              4'h1: pos_low = 10'h0d1;
              4'h2: pos_low = 10'h0d2;
              4'h3: pos_low = 10'h0d3;
              4'h4: pos_low = 10'h0d4;
              4'h5: pos_low = 10'h0d5;
              4'h6: pos_low = 10'h0d6;
              4'h7: pos_low = 10'h0d7;
              4'h8: pos_low = 10'h0d8;
              4'h9: pos_low = 10'h0d9;
              4'ha: pos_low = 10'h0da;
              4'hb: pos_low = 10'h0db;
              4'hc: pos_low = 10'h0dc;
              4'hd: pos_low = 10'h0dd;
              4'he: pos_low = 10'h0de;
              4'hf: pos_low = 10'h0df;
              default: pos_low = 10'h000;
            endcase
          end
          6'h0e: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h0e0;
              4'h1: pos_low = 10'h0e1;
              4'h2: pos_low = 10'h0e2;
              4'h3: pos_low = 10'h0e3;
              4'h4: pos_low = 10'h0e4;
              4'h5: pos_low = 10'h0e5;
              4'h6: pos_low = 10'h0e6;
              4'h7: pos_low = 10'h0e7;
              4'h8: pos_low = 10'h0e8;
              4'h9: pos_low = 10'h0e9;
              4'ha: pos_low = 10'h0ea;
              4'hb: pos_low = 10'h0eb;
              4'hc: pos_low = 10'h0ec;
              4'hd: pos_low = 10'h0ed;
              4'he: pos_low = 10'h0ee;
              4'hf: pos_low = 10'h0ef;
              default: pos_low = 10'h000;
            endcase
          end
          6'h0f: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h0f0;
              4'h1: pos_low = 10'h0f1;
              4'h2: pos_low = 10'h0f2;
              4'h3: pos_low = 10'h0f3;
              4'h4: pos_low = 10'h0f4;
              4'h5: pos_low = 10'h0f5;
              4'h6: pos_low = 10'h0f6;
              4'h7: pos_low = 10'h0f7;
              4'h8: pos_low = 10'h0f8;
              4'h9: pos_low = 10'h0f9;
              4'ha: pos_low = 10'h0fa;
              4'hb: pos_low = 10'h0fb;
              4'hc: pos_low = 10'h0fc;
              4'hd: pos_low = 10'h0fd;
              4'he: pos_low = 10'h0fe;
              4'hf: pos_low = 10'h0ff;
              default: pos_low = 10'h000;
            endcase
          end
          6'h10: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h100;
              4'h1: pos_low = 10'h101;
              4'h2: pos_low = 10'h102;
              4'h3: pos_low = 10'h103;
              4'h4: pos_low = 10'h104;
              4'h5: pos_low = 10'h105;
              4'h6: pos_low = 10'h106;
              4'h7: pos_low = 10'h107;
              4'h8: pos_low = 10'h108;
              4'h9: pos_low = 10'h109;
              4'ha: pos_low = 10'h10a;
              4'hb: pos_low = 10'h10b;
              4'hc: pos_low = 10'h10c;
              4'hd: pos_low = 10'h10d;
              4'he: pos_low = 10'h10e;
              4'hf: pos_low = 10'h10f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h11: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h110;
              4'h1: pos_low = 10'h111;
              4'h2: pos_low = 10'h112;
              4'h3: pos_low = 10'h113;
              4'h4: pos_low = 10'h114;
              4'h5: pos_low = 10'h115;
              4'h6: pos_low = 10'h116;
              4'h7: pos_low = 10'h117;
              4'h8: pos_low = 10'h118;
              4'h9: pos_low = 10'h119;
              4'ha: pos_low = 10'h11a;
              4'hb: pos_low = 10'h11b;
              4'hc: pos_low = 10'h11c;
              4'hd: pos_low = 10'h11d;
              4'he: pos_low = 10'h11e;
              4'hf: pos_low = 10'h11f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h12: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h120;
              4'h1: pos_low = 10'h121;
              4'h2: pos_low = 10'h122;
              4'h3: pos_low = 10'h123;
              4'h4: pos_low = 10'h124;
              4'h5: pos_low = 10'h125;
              4'h6: pos_low = 10'h126;
              4'h7: pos_low = 10'h127;
              4'h8: pos_low = 10'h128;
              4'h9: pos_low = 10'h129;
              4'ha: pos_low = 10'h12a;
              4'hb: pos_low = 10'h12b;
              4'hc: pos_low = 10'h12c;
              4'hd: pos_low = 10'h12d;
              4'he: pos_low = 10'h12e;
              4'hf: pos_low = 10'h12f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h13: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h130;
              4'h1: pos_low = 10'h131;
              4'h2: pos_low = 10'h132;
              4'h3: pos_low = 10'h133;
              4'h4: pos_low = 10'h134;
              4'h5: pos_low = 10'h135;
              4'h6: pos_low = 10'h136;
              4'h7: pos_low = 10'h137;
              4'h8: pos_low = 10'h138;
              4'h9: pos_low = 10'h139;
              4'ha: pos_low = 10'h13a;
              4'hb: pos_low = 10'h13b;
              4'hc: pos_low = 10'h13c;
              4'hd: pos_low = 10'h13d;
              4'he: pos_low = 10'h13e;
              4'hf: pos_low = 10'h13f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h14: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h140;
              4'h1: pos_low = 10'h141;
              4'h2: pos_low = 10'h142;
              4'h3: pos_low = 10'h143;
              4'h4: pos_low = 10'h144;
              4'h5: pos_low = 10'h145;
              4'h6: pos_low = 10'h146;
              4'h7: pos_low = 10'h147;
              4'h8: pos_low = 10'h148;
              4'h9: pos_low = 10'h149;
              4'ha: pos_low = 10'h14a;
              4'hb: pos_low = 10'h14b;
              4'hc: pos_low = 10'h14c;
              4'hd: pos_low = 10'h14d;
              4'he: pos_low = 10'h14e;
              4'hf: pos_low = 10'h14f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h15: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h150;
              4'h1: pos_low = 10'h151;
              4'h2: pos_low = 10'h152;
              4'h3: pos_low = 10'h153;
              4'h4: pos_low = 10'h154;
              4'h5: pos_low = 10'h155;
              4'h6: pos_low = 10'h156;
              4'h7: pos_low = 10'h157;
              4'h8: pos_low = 10'h158;
              4'h9: pos_low = 10'h159;
              4'ha: pos_low = 10'h15a;
              4'hb: pos_low = 10'h15b;
              4'hc: pos_low = 10'h15c;
              4'hd: pos_low = 10'h15d;
              4'he: pos_low = 10'h15e;
              4'hf: pos_low = 10'h15f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h16: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h160;
              4'h1: pos_low = 10'h161;
              4'h2: pos_low = 10'h162;
              4'h3: pos_low = 10'h163;
              4'h4: pos_low = 10'h164;
              4'h5: pos_low = 10'h165;
              4'h6: pos_low = 10'h166;
              4'h7: pos_low = 10'h167;
              4'h8: pos_low = 10'h168;
              4'h9: pos_low = 10'h169;
              4'ha: pos_low = 10'h16a;
              4'hb: pos_low = 10'h16b;
              4'hc: pos_low = 10'h16c;
              4'hd: pos_low = 10'h16d;
              4'he: pos_low = 10'h16e;
              4'hf: pos_low = 10'h16f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h17: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h170;
              4'h1: pos_low = 10'h171;
              4'h2: pos_low = 10'h172;
              4'h3: pos_low = 10'h173;
              4'h4: pos_low = 10'h174;
              4'h5: pos_low = 10'h175;
              4'h6: pos_low = 10'h176;
              4'h7: pos_low = 10'h177;
              4'h8: pos_low = 10'h178;
              4'h9: pos_low = 10'h179;
              4'ha: pos_low = 10'h17a;
              4'hb: pos_low = 10'h17b;
              4'hc: pos_low = 10'h17c;
              4'hd: pos_low = 10'h17d;
              4'he: pos_low = 10'h17e;
              4'hf: pos_low = 10'h17f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h18: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h180;
              4'h1: pos_low = 10'h181;
              4'h2: pos_low = 10'h182;
              4'h3: pos_low = 10'h183;
              4'h4: pos_low = 10'h184;
              4'h5: pos_low = 10'h185;
              4'h6: pos_low = 10'h186;
              4'h7: pos_low = 10'h187;
              4'h8: pos_low = 10'h188;
              4'h9: pos_low = 10'h189;
              4'ha: pos_low = 10'h18a;
              4'hb: pos_low = 10'h18b;
              4'hc: pos_low = 10'h18c;
              4'hd: pos_low = 10'h18d;
              4'he: pos_low = 10'h18e;
              4'hf: pos_low = 10'h18f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h19: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h190;
              4'h1: pos_low = 10'h191;
              4'h2: pos_low = 10'h192;
              4'h3: pos_low = 10'h193;
              4'h4: pos_low = 10'h194;
              4'h5: pos_low = 10'h195;
              4'h6: pos_low = 10'h196;
              4'h7: pos_low = 10'h197;
              4'h8: pos_low = 10'h198;
              4'h9: pos_low = 10'h199;
              4'ha: pos_low = 10'h19a;
              4'hb: pos_low = 10'h19b;
              4'hc: pos_low = 10'h19c;
              4'hd: pos_low = 10'h19d;
              4'he: pos_low = 10'h19e;
              4'hf: pos_low = 10'h19f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h1a: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h1a0;
              4'h1: pos_low = 10'h1a1;
              4'h2: pos_low = 10'h1a2;
              4'h3: pos_low = 10'h1a3;
              4'h4: pos_low = 10'h1a4;
              4'h5: pos_low = 10'h1a5;
              4'h6: pos_low = 10'h1a6;
              4'h7: pos_low = 10'h1a7;
              4'h8: pos_low = 10'h1a8;
              4'h9: pos_low = 10'h1a9;
              4'ha: pos_low = 10'h1aa;
              4'hb: pos_low = 10'h1ab;
              4'hc: pos_low = 10'h1ac;
              4'hd: pos_low = 10'h1ad;
              4'he: pos_low = 10'h1ae;
              4'hf: pos_low = 10'h1af;
              default: pos_low = 10'h000;
            endcase
          end
          6'h1b: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h1b0;
              4'h1: pos_low = 10'h1b1;
              4'h2: pos_low = 10'h1b2;
              4'h3: pos_low = 10'h1b3;
              4'h4: pos_low = 10'h1b4;
              4'h5: pos_low = 10'h1b5;
              4'h6: pos_low = 10'h1b6;
              4'h7: pos_low = 10'h1b7;
              4'h8: pos_low = 10'h1b8;
              4'h9: pos_low = 10'h1b9;
              4'ha: pos_low = 10'h1ba;
              4'hb: pos_low = 10'h1bb;
              4'hc: pos_low = 10'h1bc;
              4'hd: pos_low = 10'h1bd;
              4'he: pos_low = 10'h1be;
              4'hf: pos_low = 10'h1bf;
              default: pos_low = 10'h000;
            endcase
          end
          6'h1c: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h1c0;
              4'h1: pos_low = 10'h1c1;
              4'h2: pos_low = 10'h1c2;
              4'h3: pos_low = 10'h1c3;
              4'h4: pos_low = 10'h1c4;
              4'h5: pos_low = 10'h1c5;
              4'h6: pos_low = 10'h1c6;
              4'h7: pos_low = 10'h1c7;
              4'h8: pos_low = 10'h1c8;
              4'h9: pos_low = 10'h1c9;
              4'ha: pos_low = 10'h1ca;
              4'hb: pos_low = 10'h1cb;
              4'hc: pos_low = 10'h1cc;
              4'hd: pos_low = 10'h1cd;
              4'he: pos_low = 10'h1ce;
              4'hf: pos_low = 10'h1cf;
              default: pos_low = 10'h000;
            endcase
          end
          6'h1d: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h1d0;
              4'h1: pos_low = 10'h1d1;
              4'h2: pos_low = 10'h1d2;
              4'h3: pos_low = 10'h1d3;
              4'h4: pos_low = 10'h1d4;
              4'h5: pos_low = 10'h1d5;
              4'h6: pos_low = 10'h1d6;
              4'h7: pos_low = 10'h1d7;
              4'h8: pos_low = 10'h1d8;
              4'h9: pos_low = 10'h1d9;
              4'ha: pos_low = 10'h1da;
              4'hb: pos_low = 10'h1db;
              4'hc: pos_low = 10'h1dc;
              4'hd: pos_low = 10'h1dd;
              4'he: pos_low = 10'h1de;
              4'hf: pos_low = 10'h1df;
              default: pos_low = 10'h000;
            endcase
          end
          6'h1e: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h1e0;
              4'h1: pos_low = 10'h1e1;
              4'h2: pos_low = 10'h1e2;
              4'h3: pos_low = 10'h1e3;
              4'h4: pos_low = 10'h1e4;
              4'h5: pos_low = 10'h1e5;
              4'h6: pos_low = 10'h1e6;
              4'h7: pos_low = 10'h1e7;
              4'h8: pos_low = 10'h1e8;
              4'h9: pos_low = 10'h1e9;
              4'ha: pos_low = 10'h1ea;
              4'hb: pos_low = 10'h1eb;
              4'hc: pos_low = 10'h1ec;
              4'hd: pos_low = 10'h1ed;
              4'he: pos_low = 10'h1ee;
              4'hf: pos_low = 10'h1ef;
              default: pos_low = 10'h000;
            endcase
          end
          6'h1f: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h1f0;
              4'h1: pos_low = 10'h1f1;
              4'h2: pos_low = 10'h1f2;
              4'h3: pos_low = 10'h1f3;
              4'h4: pos_low = 10'h1f4;
              4'h5: pos_low = 10'h1f5;
              4'h6: pos_low = 10'h1f6;
              4'h7: pos_low = 10'h1f7;
              4'h8: pos_low = 10'h1f8;
              4'h9: pos_low = 10'h1f9;
              4'ha: pos_low = 10'h1fa;
              4'hb: pos_low = 10'h1fb;
              4'hc: pos_low = 10'h1fc;
              4'hd: pos_low = 10'h1fd;
              4'he: pos_low = 10'h1fe;
              4'hf: pos_low = 10'h1ff;
              default: pos_low = 10'h000;
            endcase
          end
          6'h20: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h200;
              4'h1: pos_low = 10'h201;
              4'h2: pos_low = 10'h202;
              4'h3: pos_low = 10'h203;
              4'h4: pos_low = 10'h204;
              4'h5: pos_low = 10'h205;
              4'h6: pos_low = 10'h206;
              4'h7: pos_low = 10'h207;
              4'h8: pos_low = 10'h208;
              4'h9: pos_low = 10'h209;
              4'ha: pos_low = 10'h20a;
              4'hb: pos_low = 10'h20b;
              4'hc: pos_low = 10'h20c;
              4'hd: pos_low = 10'h20d;
              4'he: pos_low = 10'h20e;
              4'hf: pos_low = 10'h20f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h21: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h210;
              4'h1: pos_low = 10'h211;
              4'h2: pos_low = 10'h212;
              4'h3: pos_low = 10'h213;
              4'h4: pos_low = 10'h214;
              4'h5: pos_low = 10'h215;
              4'h6: pos_low = 10'h216;
              4'h7: pos_low = 10'h217;
              4'h8: pos_low = 10'h218;
              4'h9: pos_low = 10'h219;
              4'ha: pos_low = 10'h21a;
              4'hb: pos_low = 10'h21b;
              4'hc: pos_low = 10'h21c;
              4'hd: pos_low = 10'h21d;
              4'he: pos_low = 10'h21e;
              4'hf: pos_low = 10'h21f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h22: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h220;
              4'h1: pos_low = 10'h221;
              4'h2: pos_low = 10'h222;
              4'h3: pos_low = 10'h223;
              4'h4: pos_low = 10'h224;
              4'h5: pos_low = 10'h225;
              4'h6: pos_low = 10'h226;
              4'h7: pos_low = 10'h227;
              4'h8: pos_low = 10'h228;
              4'h9: pos_low = 10'h229;
              4'ha: pos_low = 10'h22a;
              4'hb: pos_low = 10'h22b;
              4'hc: pos_low = 10'h22c;
              4'hd: pos_low = 10'h22d;
              4'he: pos_low = 10'h22e;
              4'hf: pos_low = 10'h22f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h23: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h230;
              4'h1: pos_low = 10'h231;
              4'h2: pos_low = 10'h232;
              4'h3: pos_low = 10'h233;
              4'h4: pos_low = 10'h234;
              4'h5: pos_low = 10'h235;
              4'h6: pos_low = 10'h236;
              4'h7: pos_low = 10'h237;
              4'h8: pos_low = 10'h238;
              4'h9: pos_low = 10'h239;
              4'ha: pos_low = 10'h23a;
              4'hb: pos_low = 10'h23b;
              4'hc: pos_low = 10'h23c;
              4'hd: pos_low = 10'h23d;
              4'he: pos_low = 10'h23e;
              4'hf: pos_low = 10'h23f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h24: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h240;
              4'h1: pos_low = 10'h241;
              4'h2: pos_low = 10'h242;
              4'h3: pos_low = 10'h243;
              4'h4: pos_low = 10'h244;
              4'h5: pos_low = 10'h245;
              4'h6: pos_low = 10'h246;
              4'h7: pos_low = 10'h247;
              4'h8: pos_low = 10'h248;
              4'h9: pos_low = 10'h249;
              4'ha: pos_low = 10'h24a;
              4'hb: pos_low = 10'h24b;
              4'hc: pos_low = 10'h24c;
              4'hd: pos_low = 10'h24d;
              4'he: pos_low = 10'h24e;
              4'hf: pos_low = 10'h24f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h25: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h250;
              4'h1: pos_low = 10'h251;
              4'h2: pos_low = 10'h252;
              4'h3: pos_low = 10'h253;
              4'h4: pos_low = 10'h254;
              4'h5: pos_low = 10'h255;
              4'h6: pos_low = 10'h256;
              4'h7: pos_low = 10'h257;
              4'h8: pos_low = 10'h258;
              4'h9: pos_low = 10'h259;
              4'ha: pos_low = 10'h25a;
              4'hb: pos_low = 10'h25b;
              4'hc: pos_low = 10'h25c;
              4'hd: pos_low = 10'h25d;
              4'he: pos_low = 10'h25e;
              4'hf: pos_low = 10'h25f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h26: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h260;
              4'h1: pos_low = 10'h261;
              4'h2: pos_low = 10'h262;
              4'h3: pos_low = 10'h263;
              4'h4: pos_low = 10'h264;
              4'h5: pos_low = 10'h265;
              4'h6: pos_low = 10'h266;
              4'h7: pos_low = 10'h267;
              4'h8: pos_low = 10'h268;
              4'h9: pos_low = 10'h269;
              4'ha: pos_low = 10'h26a;
              4'hb: pos_low = 10'h26b;
              4'hc: pos_low = 10'h26c;
              4'hd: pos_low = 10'h26d;
              4'he: pos_low = 10'h26e;
              4'hf: pos_low = 10'h26f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h27: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h270;
              4'h1: pos_low = 10'h271;
              4'h2: pos_low = 10'h272;
              4'h3: pos_low = 10'h273;
              4'h4: pos_low = 10'h274;
              4'h5: pos_low = 10'h275;
              4'h6: pos_low = 10'h276;
              4'h7: pos_low = 10'h277;
              4'h8: pos_low = 10'h278;
              4'h9: pos_low = 10'h279;
              4'ha: pos_low = 10'h27a;
              4'hb: pos_low = 10'h27b;
              4'hc: pos_low = 10'h27c;
              4'hd: pos_low = 10'h27d;
              4'he: pos_low = 10'h27e;
              4'hf: pos_low = 10'h27f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h28: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h280;
              4'h1: pos_low = 10'h281;
              4'h2: pos_low = 10'h282;
              4'h3: pos_low = 10'h283;
              4'h4: pos_low = 10'h284;
              4'h5: pos_low = 10'h285;
              4'h6: pos_low = 10'h286;
              4'h7: pos_low = 10'h287;
              4'h8: pos_low = 10'h288;
              4'h9: pos_low = 10'h289;
              4'ha: pos_low = 10'h28a;
              4'hb: pos_low = 10'h28b;
              4'hc: pos_low = 10'h28c;
              4'hd: pos_low = 10'h28d;
              4'he: pos_low = 10'h28e;
              4'hf: pos_low = 10'h28f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h29: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h290;
              4'h1: pos_low = 10'h291;
              4'h2: pos_low = 10'h292;
              4'h3: pos_low = 10'h293;
              4'h4: pos_low = 10'h294;
              4'h5: pos_low = 10'h295;
              4'h6: pos_low = 10'h296;
              4'h7: pos_low = 10'h297;
              4'h8: pos_low = 10'h298;
              4'h9: pos_low = 10'h299;
              4'ha: pos_low = 10'h29a;
              4'hb: pos_low = 10'h29b;
              4'hc: pos_low = 10'h29c;
              4'hd: pos_low = 10'h29d;
              4'he: pos_low = 10'h29e;
              4'hf: pos_low = 10'h29f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h2a: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h2a0;
              4'h1: pos_low = 10'h2a1;
              4'h2: pos_low = 10'h2a2;
              4'h3: pos_low = 10'h2a3;
              4'h4: pos_low = 10'h2a4;
              4'h5: pos_low = 10'h2a5;
              4'h6: pos_low = 10'h2a6;
              4'h7: pos_low = 10'h2a7;
              4'h8: pos_low = 10'h2a8;
              4'h9: pos_low = 10'h2a9;
              4'ha: pos_low = 10'h2aa;
              4'hb: pos_low = 10'h2ab;
              4'hc: pos_low = 10'h2ac;
              4'hd: pos_low = 10'h2ad;
              4'he: pos_low = 10'h2ae;
              4'hf: pos_low = 10'h2af;
              default: pos_low = 10'h000;
            endcase
          end
          6'h2b: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h2b0;
              4'h1: pos_low = 10'h2b1;
              4'h2: pos_low = 10'h2b2;
              4'h3: pos_low = 10'h2b3;
              4'h4: pos_low = 10'h2b4;
              4'h5: pos_low = 10'h2b5;
              4'h6: pos_low = 10'h2b6;
              4'h7: pos_low = 10'h2b7;
              4'h8: pos_low = 10'h2b8;
              4'h9: pos_low = 10'h2b9;
              4'ha: pos_low = 10'h2ba;
              4'hb: pos_low = 10'h2bb;
              4'hc: pos_low = 10'h2bc;
              4'hd: pos_low = 10'h2bd;
              4'he: pos_low = 10'h2be;
              4'hf: pos_low = 10'h2bf;
              default: pos_low = 10'h000;
            endcase
          end
          6'h2c: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h2c0;
              4'h1: pos_low = 10'h2c1;
              4'h2: pos_low = 10'h2c2;
              4'h3: pos_low = 10'h2c3;
              4'h4: pos_low = 10'h2c4;
              4'h5: pos_low = 10'h2c5;
              4'h6: pos_low = 10'h2c6;
              4'h7: pos_low = 10'h2c7;
              4'h8: pos_low = 10'h2c8;
              4'h9: pos_low = 10'h2c9;
              4'ha: pos_low = 10'h2ca;
              4'hb: pos_low = 10'h2cb;
              4'hc: pos_low = 10'h2cc;
              4'hd: pos_low = 10'h2cd;
              4'he: pos_low = 10'h2ce;
              4'hf: pos_low = 10'h2cf;
              default: pos_low = 10'h000;
            endcase
          end
          6'h2d: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h2d0;
              4'h1: pos_low = 10'h2d1;
              4'h2: pos_low = 10'h2d2;
              4'h3: pos_low = 10'h2d3;
              4'h4: pos_low = 10'h2d4;
              4'h5: pos_low = 10'h2d5;
              4'h6: pos_low = 10'h2d6;
              4'h7: pos_low = 10'h2d7;
              4'h8: pos_low = 10'h2d8;
              4'h9: pos_low = 10'h2d9;
              4'ha: pos_low = 10'h2da;
              4'hb: pos_low = 10'h2db;
              4'hc: pos_low = 10'h2dc;
              4'hd: pos_low = 10'h2dd;
              4'he: pos_low = 10'h2de;
              4'hf: pos_low = 10'h2df;
              default: pos_low = 10'h000;
            endcase
          end
          6'h2e: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h2e0;
              4'h1: pos_low = 10'h2e1;
              4'h2: pos_low = 10'h2e2;
              4'h3: pos_low = 10'h2e3;
              4'h4: pos_low = 10'h2e4;
              4'h5: pos_low = 10'h2e5;
              4'h6: pos_low = 10'h2e6;
              4'h7: pos_low = 10'h2e7;
              4'h8: pos_low = 10'h2e8;
              4'h9: pos_low = 10'h2e9;
              4'ha: pos_low = 10'h2ea;
              4'hb: pos_low = 10'h2eb;
              4'hc: pos_low = 10'h2ec;
              4'hd: pos_low = 10'h2ed;
              4'he: pos_low = 10'h2ee;
              4'hf: pos_low = 10'h2ef;
              default: pos_low = 10'h000;
            endcase
          end
          6'h2f: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h2f0;
              4'h1: pos_low = 10'h2f1;
              4'h2: pos_low = 10'h2f2;
              4'h3: pos_low = 10'h2f3;
              4'h4: pos_low = 10'h2f4;
              4'h5: pos_low = 10'h2f5;
              4'h6: pos_low = 10'h2f6;
              4'h7: pos_low = 10'h2f7;
              4'h8: pos_low = 10'h2f8;
              4'h9: pos_low = 10'h2f9;
              4'ha: pos_low = 10'h2fa;
              4'hb: pos_low = 10'h2fb;
              4'hc: pos_low = 10'h2fc;
              4'hd: pos_low = 10'h2fd;
              4'he: pos_low = 10'h2fe;
              4'hf: pos_low = 10'h2ff;
              default: pos_low = 10'h000;
            endcase
          end
          6'h30: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h300;
              4'h1: pos_low = 10'h301;
              4'h2: pos_low = 10'h302;
              4'h3: pos_low = 10'h303;
              4'h4: pos_low = 10'h304;
              4'h5: pos_low = 10'h305;
              4'h6: pos_low = 10'h306;
              4'h7: pos_low = 10'h307;
              4'h8: pos_low = 10'h308;
              4'h9: pos_low = 10'h309;
              4'ha: pos_low = 10'h30a;
              4'hb: pos_low = 10'h30b;
              4'hc: pos_low = 10'h30c;
              4'hd: pos_low = 10'h30d;
              4'he: pos_low = 10'h30e;
              4'hf: pos_low = 10'h30f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h31: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h310;
              4'h1: pos_low = 10'h311;
              4'h2: pos_low = 10'h312;
              4'h3: pos_low = 10'h313;
              4'h4: pos_low = 10'h314;
              4'h5: pos_low = 10'h315;
              4'h6: pos_low = 10'h316;
              4'h7: pos_low = 10'h317;
              4'h8: pos_low = 10'h318;
              4'h9: pos_low = 10'h319;
              4'ha: pos_low = 10'h31a;
              4'hb: pos_low = 10'h31b;
              4'hc: pos_low = 10'h31c;
              4'hd: pos_low = 10'h31d;
              4'he: pos_low = 10'h31e;
              4'hf: pos_low = 10'h31f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h32: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h320;
              4'h1: pos_low = 10'h321;
              4'h2: pos_low = 10'h322;
              4'h3: pos_low = 10'h323;
              4'h4: pos_low = 10'h324;
              4'h5: pos_low = 10'h325;
              4'h6: pos_low = 10'h326;
              4'h7: pos_low = 10'h327;
              4'h8: pos_low = 10'h328;
              4'h9: pos_low = 10'h329;
              4'ha: pos_low = 10'h32a;
              4'hb: pos_low = 10'h32b;
              4'hc: pos_low = 10'h32c;
              4'hd: pos_low = 10'h32d;
              4'he: pos_low = 10'h32e;
              4'hf: pos_low = 10'h32f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h33: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h330;
              4'h1: pos_low = 10'h331;
              4'h2: pos_low = 10'h332;
              4'h3: pos_low = 10'h333;
              4'h4: pos_low = 10'h334;
              4'h5: pos_low = 10'h335;
              4'h6: pos_low = 10'h336;
              4'h7: pos_low = 10'h337;
              4'h8: pos_low = 10'h338;
              4'h9: pos_low = 10'h339;
              4'ha: pos_low = 10'h33a;
              4'hb: pos_low = 10'h33b;
              4'hc: pos_low = 10'h33c;
              4'hd: pos_low = 10'h33d;
              4'he: pos_low = 10'h33e;
              4'hf: pos_low = 10'h33f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h34: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h340;
              4'h1: pos_low = 10'h341;
              4'h2: pos_low = 10'h342;
              4'h3: pos_low = 10'h343;
              4'h4: pos_low = 10'h344;
              4'h5: pos_low = 10'h345;
              4'h6: pos_low = 10'h346;
              4'h7: pos_low = 10'h347;
              4'h8: pos_low = 10'h348;
              4'h9: pos_low = 10'h349;
              4'ha: pos_low = 10'h34a;
              4'hb: pos_low = 10'h34b;
              4'hc: pos_low = 10'h34c;
              4'hd: pos_low = 10'h34d;
              4'he: pos_low = 10'h34e;
              4'hf: pos_low = 10'h34f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h35: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h350;
              4'h1: pos_low = 10'h351;
              4'h2: pos_low = 10'h352;
              4'h3: pos_low = 10'h353;
              4'h4: pos_low = 10'h354;
              4'h5: pos_low = 10'h355;
              4'h6: pos_low = 10'h356;
              4'h7: pos_low = 10'h357;
              4'h8: pos_low = 10'h358;
              4'h9: pos_low = 10'h359;
              4'ha: pos_low = 10'h35a;
              4'hb: pos_low = 10'h35b;
              4'hc: pos_low = 10'h35c;
              4'hd: pos_low = 10'h35d;
              4'he: pos_low = 10'h35e;
              4'hf: pos_low = 10'h35f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h36: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h360;
              4'h1: pos_low = 10'h361;
              4'h2: pos_low = 10'h362;
              4'h3: pos_low = 10'h363;
              4'h4: pos_low = 10'h364;
              4'h5: pos_low = 10'h365;
              4'h6: pos_low = 10'h366;
              4'h7: pos_low = 10'h367;
              4'h8: pos_low = 10'h368;
              4'h9: pos_low = 10'h369;
              4'ha: pos_low = 10'h36a;
              4'hb: pos_low = 10'h36b;
              4'hc: pos_low = 10'h36c;
              4'hd: pos_low = 10'h36d;
              4'he: pos_low = 10'h36e;
              4'hf: pos_low = 10'h36f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h37: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h370;
              4'h1: pos_low = 10'h371;
              4'h2: pos_low = 10'h372;
              4'h3: pos_low = 10'h373;
              4'h4: pos_low = 10'h374;
              4'h5: pos_low = 10'h375;
              4'h6: pos_low = 10'h376;
              4'h7: pos_low = 10'h377;
              4'h8: pos_low = 10'h378;
              4'h9: pos_low = 10'h379;
              4'ha: pos_low = 10'h37a;
              4'hb: pos_low = 10'h37b;
              4'hc: pos_low = 10'h37c;
              4'hd: pos_low = 10'h37d;
              4'he: pos_low = 10'h37e;
              4'hf: pos_low = 10'h37f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h38: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h380;
              4'h1: pos_low = 10'h381;
              4'h2: pos_low = 10'h382;
              4'h3: pos_low = 10'h383;
              4'h4: pos_low = 10'h384;
              4'h5: pos_low = 10'h385;
              4'h6: pos_low = 10'h386;
              4'h7: pos_low = 10'h387;
              4'h8: pos_low = 10'h388;
              4'h9: pos_low = 10'h389;
              4'ha: pos_low = 10'h38a;
              4'hb: pos_low = 10'h38b;
              4'hc: pos_low = 10'h38c;
              4'hd: pos_low = 10'h38d;
              4'he: pos_low = 10'h38e;
              4'hf: pos_low = 10'h38f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h39: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h390;
              4'h1: pos_low = 10'h391;
              4'h2: pos_low = 10'h392;
              4'h3: pos_low = 10'h393;
              4'h4: pos_low = 10'h394;
              4'h5: pos_low = 10'h395;
              4'h6: pos_low = 10'h396;
              4'h7: pos_low = 10'h397;
              4'h8: pos_low = 10'h398;
              4'h9: pos_low = 10'h399;
              4'ha: pos_low = 10'h39a;
              4'hb: pos_low = 10'h39b;
              4'hc: pos_low = 10'h39c;
              4'hd: pos_low = 10'h39d;
              4'he: pos_low = 10'h39e;
              4'hf: pos_low = 10'h39f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h3a: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3a0;
              4'h1: pos_low = 10'h3a1;
              4'h2: pos_low = 10'h3a2;
              4'h3: pos_low = 10'h3a3;
              4'h4: pos_low = 10'h3a4;
              4'h5: pos_low = 10'h3a5;
              4'h6: pos_low = 10'h3a6;
              4'h7: pos_low = 10'h3a7;
              4'h8: pos_low = 10'h3a8;
              4'h9: pos_low = 10'h3a9;
              4'ha: pos_low = 10'h3aa;
              4'hb: pos_low = 10'h3ab;
              4'hc: pos_low = 10'h3ac;
              4'hd: pos_low = 10'h3ad;
              4'he: pos_low = 10'h3ae;
              4'hf: pos_low = 10'h3af;
              default: pos_low = 10'h000;
            endcase
          end
          6'h3b: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3b0;
              4'h1: pos_low = 10'h3b1;
              4'h2: pos_low = 10'h3b2;
              4'h3: pos_low = 10'h3b3;
              4'h4: pos_low = 10'h3b4;
              4'h5: pos_low = 10'h3b5;
              4'h6: pos_low = 10'h3b6;
              4'h7: pos_low = 10'h3b7;
              4'h8: pos_low = 10'h3b8;
              4'h9: pos_low = 10'h3b9;
              4'ha: pos_low = 10'h3ba;
              4'hb: pos_low = 10'h3bb;
              4'hc: pos_low = 10'h3bc;
              4'hd: pos_low = 10'h3bd;
              4'he: pos_low = 10'h3be;
              4'hf: pos_low = 10'h3bf;
              default: pos_low = 10'h000;
            endcase
          end
          6'h3c: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3c0;
              4'h1: pos_low = 10'h3c1;
              4'h2: pos_low = 10'h3c2;
              4'h3: pos_low = 10'h3c3;
              4'h4: pos_low = 10'h3c4;
              4'h5: pos_low = 10'h3c5;
              4'h6: pos_low = 10'h3c6;
              4'h7: pos_low = 10'h3c7;
              4'h8: pos_low = 10'h3c8;
              4'h9: pos_low = 10'h3c9;
              4'ha: pos_low = 10'h3ca;
              4'hb: pos_low = 10'h3cb;
              4'hc: pos_low = 10'h3cc;
              4'hd: pos_low = 10'h3cd;
              4'he: pos_low = 10'h3ce;
              4'hf: pos_low = 10'h3cf;
              default: pos_low = 10'h000;
            endcase
          end
          6'h3d: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3d0;
              4'h1: pos_low = 10'h3d1;
              4'h2: pos_low = 10'h3d2;
              4'h3: pos_low = 10'h3d3;
              4'h4: pos_low = 10'h3d4;
              4'h5: pos_low = 10'h3d5;
              4'h6: pos_low = 10'h3d6;
              4'h7: pos_low = 10'h3d7;
              4'h8: pos_low = 10'h3d8;
              4'h9: pos_low = 10'h3d9;
              4'ha: pos_low = 10'h3da;
              4'hb: pos_low = 10'h3db;
              4'hc: pos_low = 10'h3dc;
              4'hd: pos_low = 10'h3dd;
              4'he: pos_low = 10'h3de;
              4'hf: pos_low = 10'h3df;
              default: pos_low = 10'h000;
            endcase
          end
          6'h3e: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3e0;
              4'h1: pos_low = 10'h3e1;
              4'h2: pos_low = 10'h3e2;
              4'h3: pos_low = 10'h3e3;
              4'h4: pos_low = 10'h3e4;
              4'h5: pos_low = 10'h3e5;
              4'h6: pos_low = 10'h3e6;
              4'h7: pos_low = 10'h3e7;
              4'h8: pos_low = 10'h3e8;
              4'h9: pos_low = 10'h3e9;
              4'ha: pos_low = 10'h3ea;
              4'hb: pos_low = 10'h3eb;
              4'hc: pos_low = 10'h3ec;
              4'hd: pos_low = 10'h3ed;
              4'he: pos_low = 10'h3ee;
              4'hf: pos_low = 10'h3ef;
              default: pos_low = 10'h000;
            endcase
          end
          6'h3f: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3f0;
              4'h1: pos_low = 10'h3f1;
              4'h2: pos_low = 10'h3f2;
              4'h3: pos_low = 10'h3f3;
              4'h4: pos_low = 10'h3f4;
              4'h5: pos_low = 10'h3f5;
              4'h6: pos_low = 10'h3f6;
              4'h7: pos_low = 10'h3f7;
              4'h8: pos_low = 10'h3f8;
              4'h9: pos_low = 10'h3f9;
              4'ha: pos_low = 10'h3fa;
              4'hb: pos_low = 10'h3fb;
              4'hc: pos_low = 10'h3fc;
              4'hd: pos_low = 10'h3fd;
              4'he: pos_low = 10'h3fe;
              4'hf: pos_low = 10'h3ff;
              default: pos_low = 10'h000;
            endcase
          end
          default: begin end
        endcase
      end
      5'h02: begin
        case (mant[9:4])
          6'h00: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h000;
              4'h1: pos_low = 10'h001;
              4'h2: pos_low = 10'h002;
              4'h3: pos_low = 10'h003;
              4'h4: pos_low = 10'h004;
              4'h5: pos_low = 10'h005;
              4'h6: pos_low = 10'h006;
              4'h7: pos_low = 10'h007;
              4'h8: pos_low = 10'h008;
              4'h9: pos_low = 10'h009;
              4'ha: pos_low = 10'h00a;
              4'hb: pos_low = 10'h00b;
              4'hc: pos_low = 10'h00c;
              4'hd: pos_low = 10'h00d;
              4'he: pos_low = 10'h00e;
              4'hf: pos_low = 10'h00f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h01: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h010;
              4'h1: pos_low = 10'h011;
              4'h2: pos_low = 10'h012;
              4'h3: pos_low = 10'h013;
              4'h4: pos_low = 10'h014;
              4'h5: pos_low = 10'h015;
              4'h6: pos_low = 10'h016;
              4'h7: pos_low = 10'h017;
              4'h8: pos_low = 10'h018;
              4'h9: pos_low = 10'h019;
              4'ha: pos_low = 10'h01a;
              4'hb: pos_low = 10'h01b;
              4'hc: pos_low = 10'h01c;
              4'hd: pos_low = 10'h01d;
              4'he: pos_low = 10'h01e;
              4'hf: pos_low = 10'h01f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h02: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h020;
              4'h1: pos_low = 10'h021;
              4'h2: pos_low = 10'h022;
              4'h3: pos_low = 10'h023;
              4'h4: pos_low = 10'h024;
              4'h5: pos_low = 10'h025;
              4'h6: pos_low = 10'h026;
              4'h7: pos_low = 10'h027;
              4'h8: pos_low = 10'h028;
              4'h9: pos_low = 10'h029;
              4'ha: pos_low = 10'h02a;
              4'hb: pos_low = 10'h02b;
              4'hc: pos_low = 10'h02c;
              4'hd: pos_low = 10'h02d;
              4'he: pos_low = 10'h02e;
              4'hf: pos_low = 10'h02f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h03: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h030;
              4'h1: pos_low = 10'h031;
              4'h2: pos_low = 10'h032;
              4'h3: pos_low = 10'h033;
              4'h4: pos_low = 10'h034;
              4'h5: pos_low = 10'h035;
              4'h6: pos_low = 10'h036;
              4'h7: pos_low = 10'h037;
              4'h8: pos_low = 10'h038;
              4'h9: pos_low = 10'h039;
              4'ha: pos_low = 10'h03a;
              4'hb: pos_low = 10'h03b;
              4'hc: pos_low = 10'h03c;
              4'hd: pos_low = 10'h03d;
              4'he: pos_low = 10'h03e;
              4'hf: pos_low = 10'h03f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h04: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h040;
              4'h1: pos_low = 10'h041;
              4'h2: pos_low = 10'h042;
              4'h3: pos_low = 10'h043;
              4'h4: pos_low = 10'h044;
              4'h5: pos_low = 10'h045;
              4'h6: pos_low = 10'h046;
              4'h7: pos_low = 10'h047;
              4'h8: pos_low = 10'h048;
              4'h9: pos_low = 10'h049;
              4'ha: pos_low = 10'h04a;
              4'hb: pos_low = 10'h04b;
              4'hc: pos_low = 10'h04c;
              4'hd: pos_low = 10'h04d;
              4'he: pos_low = 10'h04e;
              4'hf: pos_low = 10'h04f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h05: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h050;
              4'h1: pos_low = 10'h051;
              4'h2: pos_low = 10'h052;
              4'h3: pos_low = 10'h053;
              4'h4: pos_low = 10'h054;
              4'h5: pos_low = 10'h055;
              4'h6: pos_low = 10'h056;
              4'h7: pos_low = 10'h057;
              4'h8: pos_low = 10'h058;
              4'h9: pos_low = 10'h059;
              4'ha: pos_low = 10'h05a;
              4'hb: pos_low = 10'h05b;
              4'hc: pos_low = 10'h05c;
              4'hd: pos_low = 10'h05d;
              4'he: pos_low = 10'h05e;
              4'hf: pos_low = 10'h05f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h06: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h060;
              4'h1: pos_low = 10'h061;
              4'h2: pos_low = 10'h062;
              4'h3: pos_low = 10'h063;
              4'h4: pos_low = 10'h064;
              4'h5: pos_low = 10'h065;
              4'h6: pos_low = 10'h066;
              4'h7: pos_low = 10'h067;
              4'h8: pos_low = 10'h068;
              4'h9: pos_low = 10'h069;
              4'ha: pos_low = 10'h06a;
              4'hb: pos_low = 10'h06b;
              4'hc: pos_low = 10'h06c;
              4'hd: pos_low = 10'h06d;
              4'he: pos_low = 10'h06e;
              4'hf: pos_low = 10'h06f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h07: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h070;
              4'h1: pos_low = 10'h071;
              4'h2: pos_low = 10'h072;
              4'h3: pos_low = 10'h073;
              4'h4: pos_low = 10'h074;
              4'h5: pos_low = 10'h075;
              4'h6: pos_low = 10'h076;
              4'h7: pos_low = 10'h077;
              4'h8: pos_low = 10'h078;
              4'h9: pos_low = 10'h079;
              4'ha: pos_low = 10'h07a;
              4'hb: pos_low = 10'h07b;
              4'hc: pos_low = 10'h07c;
              4'hd: pos_low = 10'h07d;
              4'he: pos_low = 10'h07e;
              4'hf: pos_low = 10'h07f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h08: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h080;
              4'h1: pos_low = 10'h081;
              4'h2: pos_low = 10'h082;
              4'h3: pos_low = 10'h083;
              4'h4: pos_low = 10'h084;
              4'h5: pos_low = 10'h085;
              4'h6: pos_low = 10'h086;
              4'h7: pos_low = 10'h087;
              4'h8: pos_low = 10'h088;
              4'h9: pos_low = 10'h089;
              4'ha: pos_low = 10'h08a;
              4'hb: pos_low = 10'h08b;
              4'hc: pos_low = 10'h08c;
              4'hd: pos_low = 10'h08d;
              4'he: pos_low = 10'h08e;
              4'hf: pos_low = 10'h08f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h09: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h090;
              4'h1: pos_low = 10'h091;
              4'h2: pos_low = 10'h092;
              4'h3: pos_low = 10'h093;
              4'h4: pos_low = 10'h094;
              4'h5: pos_low = 10'h095;
              4'h6: pos_low = 10'h096;
              4'h7: pos_low = 10'h097;
              4'h8: pos_low = 10'h098;
              4'h9: pos_low = 10'h099;
              4'ha: pos_low = 10'h09a;
              4'hb: pos_low = 10'h09b;
              4'hc: pos_low = 10'h09c;
              4'hd: pos_low = 10'h09d;
              4'he: pos_low = 10'h09e;
              4'hf: pos_low = 10'h09f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h0a: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h0a0;
              4'h1: pos_low = 10'h0a1;
              4'h2: pos_low = 10'h0a2;
              4'h3: pos_low = 10'h0a3;
              4'h4: pos_low = 10'h0a4;
              4'h5: pos_low = 10'h0a5;
              4'h6: pos_low = 10'h0a6;
              4'h7: pos_low = 10'h0a7;
              4'h8: pos_low = 10'h0a8;
              4'h9: pos_low = 10'h0a9;
              4'ha: pos_low = 10'h0aa;
              4'hb: pos_low = 10'h0ab;
              4'hc: pos_low = 10'h0ac;
              4'hd: pos_low = 10'h0ad;
              4'he: pos_low = 10'h0ae;
              4'hf: pos_low = 10'h0af;
              default: pos_low = 10'h000;
            endcase
          end
          6'h0b: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h0b0;
              4'h1: pos_low = 10'h0b1;
              4'h2: pos_low = 10'h0b2;
              4'h3: pos_low = 10'h0b3;
              4'h4: pos_low = 10'h0b4;
              4'h5: pos_low = 10'h0b5;
              4'h6: pos_low = 10'h0b6;
              4'h7: pos_low = 10'h0b7;
              4'h8: pos_low = 10'h0b8;
              4'h9: pos_low = 10'h0b9;
              4'ha: pos_low = 10'h0ba;
              4'hb: pos_low = 10'h0bb;
              4'hc: pos_low = 10'h0bc;
              4'hd: pos_low = 10'h0bd;
              4'he: pos_low = 10'h0be;
              4'hf: pos_low = 10'h0bf;
              default: pos_low = 10'h000;
            endcase
          end
          6'h0c: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h0c0;
              4'h1: pos_low = 10'h0c1;
              4'h2: pos_low = 10'h0c2;
              4'h3: pos_low = 10'h0c3;
              4'h4: pos_low = 10'h0c4;
              4'h5: pos_low = 10'h0c5;
              4'h6: pos_low = 10'h0c6;
              4'h7: pos_low = 10'h0c7;
              4'h8: pos_low = 10'h0c8;
              4'h9: pos_low = 10'h0c9;
              4'ha: pos_low = 10'h0ca;
              4'hb: pos_low = 10'h0cb;
              4'hc: pos_low = 10'h0cc;
              4'hd: pos_low = 10'h0cd;
              4'he: pos_low = 10'h0ce;
              4'hf: pos_low = 10'h0cf;
              default: pos_low = 10'h000;
            endcase
          end
          6'h0d: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h0d0;
              4'h1: pos_low = 10'h0d1;
              4'h2: pos_low = 10'h0d2;
              4'h3: pos_low = 10'h0d3;
              4'h4: pos_low = 10'h0d4;
              4'h5: pos_low = 10'h0d5;
              4'h6: pos_low = 10'h0d6;
              4'h7: pos_low = 10'h0d7;
              4'h8: pos_low = 10'h0d8;
              4'h9: pos_low = 10'h0d9;
              4'ha: pos_low = 10'h0da;
              4'hb: pos_low = 10'h0db;
              4'hc: pos_low = 10'h0dc;
              4'hd: pos_low = 10'h0dd;
              4'he: pos_low = 10'h0de;
              4'hf: pos_low = 10'h0df;
              default: pos_low = 10'h000;
            endcase
          end
          6'h0e: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h0e0;
              4'h1: pos_low = 10'h0e1;
              4'h2: pos_low = 10'h0e2;
              4'h3: pos_low = 10'h0e3;
              4'h4: pos_low = 10'h0e4;
              4'h5: pos_low = 10'h0e5;
              4'h6: pos_low = 10'h0e6;
              4'h7: pos_low = 10'h0e7;
              4'h8: pos_low = 10'h0e8;
              4'h9: pos_low = 10'h0e9;
              4'ha: pos_low = 10'h0ea;
              4'hb: pos_low = 10'h0eb;
              4'hc: pos_low = 10'h0ec;
              4'hd: pos_low = 10'h0ed;
              4'he: pos_low = 10'h0ee;
              4'hf: pos_low = 10'h0ef;
              default: pos_low = 10'h000;
            endcase
          end
          6'h0f: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h0f0;
              4'h1: pos_low = 10'h0f1;
              4'h2: pos_low = 10'h0f2;
              4'h3: pos_low = 10'h0f3;
              4'h4: pos_low = 10'h0f4;
              4'h5: pos_low = 10'h0f5;
              4'h6: pos_low = 10'h0f6;
              4'h7: pos_low = 10'h0f7;
              4'h8: pos_low = 10'h0f8;
              4'h9: pos_low = 10'h0f9;
              4'ha: pos_low = 10'h0fa;
              4'hb: pos_low = 10'h0fb;
              4'hc: pos_low = 10'h0fc;
              4'hd: pos_low = 10'h0fd;
              4'he: pos_low = 10'h0fe;
              4'hf: pos_low = 10'h0ff;
              default: pos_low = 10'h000;
            endcase
          end
          6'h10: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h100;
              4'h1: pos_low = 10'h101;
              4'h2: pos_low = 10'h102;
              4'h3: pos_low = 10'h103;
              4'h4: pos_low = 10'h104;
              4'h5: pos_low = 10'h105;
              4'h6: pos_low = 10'h106;
              4'h7: pos_low = 10'h107;
              4'h8: pos_low = 10'h108;
              4'h9: pos_low = 10'h109;
              4'ha: pos_low = 10'h10a;
              4'hb: pos_low = 10'h10b;
              4'hc: pos_low = 10'h10c;
              4'hd: pos_low = 10'h10d;
              4'he: pos_low = 10'h10e;
              4'hf: pos_low = 10'h10f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h11: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h110;
              4'h1: pos_low = 10'h111;
              4'h2: pos_low = 10'h112;
              4'h3: pos_low = 10'h113;
              4'h4: pos_low = 10'h114;
              4'h5: pos_low = 10'h115;
              4'h6: pos_low = 10'h116;
              4'h7: pos_low = 10'h117;
              4'h8: pos_low = 10'h118;
              4'h9: pos_low = 10'h119;
              4'ha: pos_low = 10'h11a;
              4'hb: pos_low = 10'h11b;
              4'hc: pos_low = 10'h11c;
              4'hd: pos_low = 10'h11d;
              4'he: pos_low = 10'h11e;
              4'hf: pos_low = 10'h11f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h12: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h120;
              4'h1: pos_low = 10'h121;
              4'h2: pos_low = 10'h122;
              4'h3: pos_low = 10'h123;
              4'h4: pos_low = 10'h124;
              4'h5: pos_low = 10'h125;
              4'h6: pos_low = 10'h126;
              4'h7: pos_low = 10'h127;
              4'h8: pos_low = 10'h128;
              4'h9: pos_low = 10'h129;
              4'ha: pos_low = 10'h12a;
              4'hb: pos_low = 10'h12b;
              4'hc: pos_low = 10'h12c;
              4'hd: pos_low = 10'h12d;
              4'he: pos_low = 10'h12e;
              4'hf: pos_low = 10'h12f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h13: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h130;
              4'h1: pos_low = 10'h131;
              4'h2: pos_low = 10'h132;
              4'h3: pos_low = 10'h133;
              4'h4: pos_low = 10'h134;
              4'h5: pos_low = 10'h135;
              4'h6: pos_low = 10'h136;
              4'h7: pos_low = 10'h137;
              4'h8: pos_low = 10'h138;
              4'h9: pos_low = 10'h139;
              4'ha: pos_low = 10'h13a;
              4'hb: pos_low = 10'h13b;
              4'hc: pos_low = 10'h13c;
              4'hd: pos_low = 10'h13d;
              4'he: pos_low = 10'h13e;
              4'hf: pos_low = 10'h13f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h14: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h140;
              4'h1: pos_low = 10'h141;
              4'h2: pos_low = 10'h142;
              4'h3: pos_low = 10'h143;
              4'h4: pos_low = 10'h144;
              4'h5: pos_low = 10'h145;
              4'h6: pos_low = 10'h146;
              4'h7: pos_low = 10'h147;
              4'h8: pos_low = 10'h148;
              4'h9: pos_low = 10'h149;
              4'ha: pos_low = 10'h14a;
              4'hb: pos_low = 10'h14b;
              4'hc: pos_low = 10'h14c;
              4'hd: pos_low = 10'h14d;
              4'he: pos_low = 10'h14e;
              4'hf: pos_low = 10'h14f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h15: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h150;
              4'h1: pos_low = 10'h151;
              4'h2: pos_low = 10'h152;
              4'h3: pos_low = 10'h153;
              4'h4: pos_low = 10'h154;
              4'h5: pos_low = 10'h155;
              4'h6: pos_low = 10'h156;
              4'h7: pos_low = 10'h157;
              4'h8: pos_low = 10'h158;
              4'h9: pos_low = 10'h159;
              4'ha: pos_low = 10'h15a;
              4'hb: pos_low = 10'h15b;
              4'hc: pos_low = 10'h15c;
              4'hd: pos_low = 10'h15d;
              4'he: pos_low = 10'h15e;
              4'hf: pos_low = 10'h15f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h16: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h160;
              4'h1: pos_low = 10'h161;
              4'h2: pos_low = 10'h162;
              4'h3: pos_low = 10'h163;
              4'h4: pos_low = 10'h164;
              4'h5: pos_low = 10'h165;
              4'h6: pos_low = 10'h166;
              4'h7: pos_low = 10'h167;
              4'h8: pos_low = 10'h168;
              4'h9: pos_low = 10'h169;
              4'ha: pos_low = 10'h16a;
              4'hb: pos_low = 10'h16b;
              4'hc: pos_low = 10'h16c;
              4'hd: pos_low = 10'h16d;
              4'he: pos_low = 10'h16e;
              4'hf: pos_low = 10'h16f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h17: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h170;
              4'h1: pos_low = 10'h171;
              4'h2: pos_low = 10'h172;
              4'h3: pos_low = 10'h173;
              4'h4: pos_low = 10'h174;
              4'h5: pos_low = 10'h175;
              4'h6: pos_low = 10'h176;
              4'h7: pos_low = 10'h177;
              4'h8: pos_low = 10'h178;
              4'h9: pos_low = 10'h179;
              4'ha: pos_low = 10'h17a;
              4'hb: pos_low = 10'h17b;
              4'hc: pos_low = 10'h17c;
              4'hd: pos_low = 10'h17d;
              4'he: pos_low = 10'h17e;
              4'hf: pos_low = 10'h17f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h18: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h180;
              4'h1: pos_low = 10'h181;
              4'h2: pos_low = 10'h182;
              4'h3: pos_low = 10'h183;
              4'h4: pos_low = 10'h184;
              4'h5: pos_low = 10'h185;
              4'h6: pos_low = 10'h186;
              4'h7: pos_low = 10'h187;
              4'h8: pos_low = 10'h188;
              4'h9: pos_low = 10'h189;
              4'ha: pos_low = 10'h18a;
              4'hb: pos_low = 10'h18b;
              4'hc: pos_low = 10'h18c;
              4'hd: pos_low = 10'h18d;
              4'he: pos_low = 10'h18e;
              4'hf: pos_low = 10'h18f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h19: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h190;
              4'h1: pos_low = 10'h191;
              4'h2: pos_low = 10'h192;
              4'h3: pos_low = 10'h193;
              4'h4: pos_low = 10'h194;
              4'h5: pos_low = 10'h195;
              4'h6: pos_low = 10'h196;
              4'h7: pos_low = 10'h197;
              4'h8: pos_low = 10'h198;
              4'h9: pos_low = 10'h199;
              4'ha: pos_low = 10'h19a;
              4'hb: pos_low = 10'h19b;
              4'hc: pos_low = 10'h19c;
              4'hd: pos_low = 10'h19d;
              4'he: pos_low = 10'h19e;
              4'hf: pos_low = 10'h19f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h1a: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h1a0;
              4'h1: pos_low = 10'h1a1;
              4'h2: pos_low = 10'h1a2;
              4'h3: pos_low = 10'h1a3;
              4'h4: pos_low = 10'h1a4;
              4'h5: pos_low = 10'h1a5;
              4'h6: pos_low = 10'h1a6;
              4'h7: pos_low = 10'h1a7;
              4'h8: pos_low = 10'h1a8;
              4'h9: pos_low = 10'h1a9;
              4'ha: pos_low = 10'h1aa;
              4'hb: pos_low = 10'h1ab;
              4'hc: pos_low = 10'h1ac;
              4'hd: pos_low = 10'h1ad;
              4'he: pos_low = 10'h1ae;
              4'hf: pos_low = 10'h1af;
              default: pos_low = 10'h000;
            endcase
          end
          6'h1b: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h1b0;
              4'h1: pos_low = 10'h1b1;
              4'h2: pos_low = 10'h1b2;
              4'h3: pos_low = 10'h1b3;
              4'h4: pos_low = 10'h1b4;
              4'h5: pos_low = 10'h1b5;
              4'h6: pos_low = 10'h1b6;
              4'h7: pos_low = 10'h1b7;
              4'h8: pos_low = 10'h1b8;
              4'h9: pos_low = 10'h1b9;
              4'ha: pos_low = 10'h1ba;
              4'hb: pos_low = 10'h1bb;
              4'hc: pos_low = 10'h1bc;
              4'hd: pos_low = 10'h1bd;
              4'he: pos_low = 10'h1be;
              4'hf: pos_low = 10'h1bf;
              default: pos_low = 10'h000;
            endcase
          end
          6'h1c: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h1c0;
              4'h1: pos_low = 10'h1c1;
              4'h2: pos_low = 10'h1c2;
              4'h3: pos_low = 10'h1c3;
              4'h4: pos_low = 10'h1c4;
              4'h5: pos_low = 10'h1c5;
              4'h6: pos_low = 10'h1c6;
              4'h7: pos_low = 10'h1c7;
              4'h8: pos_low = 10'h1c8;
              4'h9: pos_low = 10'h1c9;
              4'ha: pos_low = 10'h1ca;
              4'hb: pos_low = 10'h1cb;
              4'hc: pos_low = 10'h1cc;
              4'hd: pos_low = 10'h1cd;
              4'he: pos_low = 10'h1ce;
              4'hf: pos_low = 10'h1cf;
              default: pos_low = 10'h000;
            endcase
          end
          6'h1d: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h1d0;
              4'h1: pos_low = 10'h1d1;
              4'h2: pos_low = 10'h1d2;
              4'h3: pos_low = 10'h1d3;
              4'h4: pos_low = 10'h1d4;
              4'h5: pos_low = 10'h1d5;
              4'h6: pos_low = 10'h1d6;
              4'h7: pos_low = 10'h1d7;
              4'h8: pos_low = 10'h1d8;
              4'h9: pos_low = 10'h1d9;
              4'ha: pos_low = 10'h1da;
              4'hb: pos_low = 10'h1db;
              4'hc: pos_low = 10'h1dc;
              4'hd: pos_low = 10'h1dd;
              4'he: pos_low = 10'h1de;
              4'hf: pos_low = 10'h1df;
              default: pos_low = 10'h000;
            endcase
          end
          6'h1e: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h1e0;
              4'h1: pos_low = 10'h1e1;
              4'h2: pos_low = 10'h1e2;
              4'h3: pos_low = 10'h1e3;
              4'h4: pos_low = 10'h1e4;
              4'h5: pos_low = 10'h1e5;
              4'h6: pos_low = 10'h1e6;
              4'h7: pos_low = 10'h1e7;
              4'h8: pos_low = 10'h1e8;
              4'h9: pos_low = 10'h1e9;
              4'ha: pos_low = 10'h1ea;
              4'hb: pos_low = 10'h1eb;
              4'hc: pos_low = 10'h1ec;
              4'hd: pos_low = 10'h1ed;
              4'he: pos_low = 10'h1ee;
              4'hf: pos_low = 10'h1ef;
              default: pos_low = 10'h000;
            endcase
          end
          6'h1f: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h1f0;
              4'h1: pos_low = 10'h1f1;
              4'h2: pos_low = 10'h1f2;
              4'h3: pos_low = 10'h1f3;
              4'h4: pos_low = 10'h1f4;
              4'h5: pos_low = 10'h1f5;
              4'h6: pos_low = 10'h1f6;
              4'h7: pos_low = 10'h1f7;
              4'h8: pos_low = 10'h1f8;
              4'h9: pos_low = 10'h1f9;
              4'ha: pos_low = 10'h1fa;
              4'hb: pos_low = 10'h1fb;
              4'hc: pos_low = 10'h1fc;
              4'hd: pos_low = 10'h1fd;
              4'he: pos_low = 10'h1fe;
              4'hf: pos_low = 10'h1ff;
              default: pos_low = 10'h000;
            endcase
          end
          6'h20: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h200;
              4'h1: pos_low = 10'h201;
              4'h2: pos_low = 10'h202;
              4'h3: pos_low = 10'h203;
              4'h4: pos_low = 10'h204;
              4'h5: pos_low = 10'h205;
              4'h6: pos_low = 10'h206;
              4'h7: pos_low = 10'h207;
              4'h8: pos_low = 10'h208;
              4'h9: pos_low = 10'h209;
              4'ha: pos_low = 10'h20a;
              4'hb: pos_low = 10'h20b;
              4'hc: pos_low = 10'h20c;
              4'hd: pos_low = 10'h20d;
              4'he: pos_low = 10'h20e;
              4'hf: pos_low = 10'h20f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h21: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h210;
              4'h1: pos_low = 10'h211;
              4'h2: pos_low = 10'h212;
              4'h3: pos_low = 10'h213;
              4'h4: pos_low = 10'h214;
              4'h5: pos_low = 10'h215;
              4'h6: pos_low = 10'h216;
              4'h7: pos_low = 10'h217;
              4'h8: pos_low = 10'h218;
              4'h9: pos_low = 10'h219;
              4'ha: pos_low = 10'h21a;
              4'hb: pos_low = 10'h21b;
              4'hc: pos_low = 10'h21c;
              4'hd: pos_low = 10'h21d;
              4'he: pos_low = 10'h21e;
              4'hf: pos_low = 10'h21f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h22: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h220;
              4'h1: pos_low = 10'h221;
              4'h2: pos_low = 10'h222;
              4'h3: pos_low = 10'h223;
              4'h4: pos_low = 10'h224;
              4'h5: pos_low = 10'h225;
              4'h6: pos_low = 10'h226;
              4'h7: pos_low = 10'h227;
              4'h8: pos_low = 10'h228;
              4'h9: pos_low = 10'h229;
              4'ha: pos_low = 10'h22a;
              4'hb: pos_low = 10'h22b;
              4'hc: pos_low = 10'h22c;
              4'hd: pos_low = 10'h22d;
              4'he: pos_low = 10'h22e;
              4'hf: pos_low = 10'h22f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h23: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h230;
              4'h1: pos_low = 10'h231;
              4'h2: pos_low = 10'h232;
              4'h3: pos_low = 10'h233;
              4'h4: pos_low = 10'h234;
              4'h5: pos_low = 10'h235;
              4'h6: pos_low = 10'h236;
              4'h7: pos_low = 10'h237;
              4'h8: pos_low = 10'h238;
              4'h9: pos_low = 10'h239;
              4'ha: pos_low = 10'h23a;
              4'hb: pos_low = 10'h23b;
              4'hc: pos_low = 10'h23c;
              4'hd: pos_low = 10'h23d;
              4'he: pos_low = 10'h23e;
              4'hf: pos_low = 10'h23f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h24: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h240;
              4'h1: pos_low = 10'h241;
              4'h2: pos_low = 10'h242;
              4'h3: pos_low = 10'h243;
              4'h4: pos_low = 10'h244;
              4'h5: pos_low = 10'h245;
              4'h6: pos_low = 10'h246;
              4'h7: pos_low = 10'h247;
              4'h8: pos_low = 10'h248;
              4'h9: pos_low = 10'h249;
              4'ha: pos_low = 10'h24a;
              4'hb: pos_low = 10'h24b;
              4'hc: pos_low = 10'h24c;
              4'hd: pos_low = 10'h24d;
              4'he: pos_low = 10'h24e;
              4'hf: pos_low = 10'h24f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h25: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h250;
              4'h1: pos_low = 10'h251;
              4'h2: pos_low = 10'h252;
              4'h3: pos_low = 10'h253;
              4'h4: pos_low = 10'h254;
              4'h5: pos_low = 10'h255;
              4'h6: pos_low = 10'h256;
              4'h7: pos_low = 10'h257;
              4'h8: pos_low = 10'h258;
              4'h9: pos_low = 10'h259;
              4'ha: pos_low = 10'h25a;
              4'hb: pos_low = 10'h25b;
              4'hc: pos_low = 10'h25c;
              4'hd: pos_low = 10'h25d;
              4'he: pos_low = 10'h25e;
              4'hf: pos_low = 10'h25f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h26: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h260;
              4'h1: pos_low = 10'h261;
              4'h2: pos_low = 10'h262;
              4'h3: pos_low = 10'h263;
              4'h4: pos_low = 10'h264;
              4'h5: pos_low = 10'h265;
              4'h6: pos_low = 10'h266;
              4'h7: pos_low = 10'h267;
              4'h8: pos_low = 10'h268;
              4'h9: pos_low = 10'h269;
              4'ha: pos_low = 10'h26a;
              4'hb: pos_low = 10'h26b;
              4'hc: pos_low = 10'h26c;
              4'hd: pos_low = 10'h26d;
              4'he: pos_low = 10'h26e;
              4'hf: pos_low = 10'h26f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h27: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h270;
              4'h1: pos_low = 10'h271;
              4'h2: pos_low = 10'h272;
              4'h3: pos_low = 10'h273;
              4'h4: pos_low = 10'h274;
              4'h5: pos_low = 10'h275;
              4'h6: pos_low = 10'h276;
              4'h7: pos_low = 10'h277;
              4'h8: pos_low = 10'h278;
              4'h9: pos_low = 10'h279;
              4'ha: pos_low = 10'h27a;
              4'hb: pos_low = 10'h27b;
              4'hc: pos_low = 10'h27c;
              4'hd: pos_low = 10'h27d;
              4'he: pos_low = 10'h27e;
              4'hf: pos_low = 10'h27f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h28: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h280;
              4'h1: pos_low = 10'h281;
              4'h2: pos_low = 10'h282;
              4'h3: pos_low = 10'h283;
              4'h4: pos_low = 10'h284;
              4'h5: pos_low = 10'h285;
              4'h6: pos_low = 10'h286;
              4'h7: pos_low = 10'h287;
              4'h8: pos_low = 10'h288;
              4'h9: pos_low = 10'h289;
              4'ha: pos_low = 10'h28a;
              4'hb: pos_low = 10'h28b;
              4'hc: pos_low = 10'h28c;
              4'hd: pos_low = 10'h28d;
              4'he: pos_low = 10'h28e;
              4'hf: pos_low = 10'h28f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h29: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h290;
              4'h1: pos_low = 10'h291;
              4'h2: pos_low = 10'h292;
              4'h3: pos_low = 10'h293;
              4'h4: pos_low = 10'h294;
              4'h5: pos_low = 10'h295;
              4'h6: pos_low = 10'h296;
              4'h7: pos_low = 10'h297;
              4'h8: pos_low = 10'h298;
              4'h9: pos_low = 10'h299;
              4'ha: pos_low = 10'h29a;
              4'hb: pos_low = 10'h29b;
              4'hc: pos_low = 10'h29c;
              4'hd: pos_low = 10'h29d;
              4'he: pos_low = 10'h29e;
              4'hf: pos_low = 10'h29f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h2a: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h2a0;
              4'h1: pos_low = 10'h2a1;
              4'h2: pos_low = 10'h2a2;
              4'h3: pos_low = 10'h2a3;
              4'h4: pos_low = 10'h2a4;
              4'h5: pos_low = 10'h2a5;
              4'h6: pos_low = 10'h2a6;
              4'h7: pos_low = 10'h2a7;
              4'h8: pos_low = 10'h2a8;
              4'h9: pos_low = 10'h2a9;
              4'ha: pos_low = 10'h2aa;
              4'hb: pos_low = 10'h2ab;
              4'hc: pos_low = 10'h2ac;
              4'hd: pos_low = 10'h2ad;
              4'he: pos_low = 10'h2ae;
              4'hf: pos_low = 10'h2af;
              default: pos_low = 10'h000;
            endcase
          end
          6'h2b: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h2b0;
              4'h1: pos_low = 10'h2b1;
              4'h2: pos_low = 10'h2b2;
              4'h3: pos_low = 10'h2b3;
              4'h4: pos_low = 10'h2b4;
              4'h5: pos_low = 10'h2b5;
              4'h6: pos_low = 10'h2b6;
              4'h7: pos_low = 10'h2b7;
              4'h8: pos_low = 10'h2b8;
              4'h9: pos_low = 10'h2b9;
              4'ha: pos_low = 10'h2ba;
              4'hb: pos_low = 10'h2bb;
              4'hc: pos_low = 10'h2bc;
              4'hd: pos_low = 10'h2bd;
              4'he: pos_low = 10'h2be;
              4'hf: pos_low = 10'h2bf;
              default: pos_low = 10'h000;
            endcase
          end
          6'h2c: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h2c0;
              4'h1: pos_low = 10'h2c1;
              4'h2: pos_low = 10'h2c2;
              4'h3: pos_low = 10'h2c3;
              4'h4: pos_low = 10'h2c4;
              4'h5: pos_low = 10'h2c5;
              4'h6: pos_low = 10'h2c6;
              4'h7: pos_low = 10'h2c7;
              4'h8: pos_low = 10'h2c8;
              4'h9: pos_low = 10'h2c9;
              4'ha: pos_low = 10'h2ca;
              4'hb: pos_low = 10'h2cb;
              4'hc: pos_low = 10'h2cc;
              4'hd: pos_low = 10'h2cd;
              4'he: pos_low = 10'h2ce;
              4'hf: pos_low = 10'h2cf;
              default: pos_low = 10'h000;
            endcase
          end
          6'h2d: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h2d0;
              4'h1: pos_low = 10'h2d1;
              4'h2: pos_low = 10'h2d2;
              4'h3: pos_low = 10'h2d3;
              4'h4: pos_low = 10'h2d4;
              4'h5: pos_low = 10'h2d5;
              4'h6: pos_low = 10'h2d6;
              4'h7: pos_low = 10'h2d7;
              4'h8: pos_low = 10'h2d8;
              4'h9: pos_low = 10'h2d9;
              4'ha: pos_low = 10'h2da;
              4'hb: pos_low = 10'h2db;
              4'hc: pos_low = 10'h2dc;
              4'hd: pos_low = 10'h2dd;
              4'he: pos_low = 10'h2de;
              4'hf: pos_low = 10'h2df;
              default: pos_low = 10'h000;
            endcase
          end
          6'h2e: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h2e0;
              4'h1: pos_low = 10'h2e1;
              4'h2: pos_low = 10'h2e2;
              4'h3: pos_low = 10'h2e3;
              4'h4: pos_low = 10'h2e4;
              4'h5: pos_low = 10'h2e5;
              4'h6: pos_low = 10'h2e6;
              4'h7: pos_low = 10'h2e7;
              4'h8: pos_low = 10'h2e8;
              4'h9: pos_low = 10'h2e9;
              4'ha: pos_low = 10'h2ea;
              4'hb: pos_low = 10'h2eb;
              4'hc: pos_low = 10'h2ec;
              4'hd: pos_low = 10'h2ed;
              4'he: pos_low = 10'h2ee;
              4'hf: pos_low = 10'h2ef;
              default: pos_low = 10'h000;
            endcase
          end
          6'h2f: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h2f0;
              4'h1: pos_low = 10'h2f1;
              4'h2: pos_low = 10'h2f2;
              4'h3: pos_low = 10'h2f3;
              4'h4: pos_low = 10'h2f4;
              4'h5: pos_low = 10'h2f5;
              4'h6: pos_low = 10'h2f6;
              4'h7: pos_low = 10'h2f7;
              4'h8: pos_low = 10'h2f8;
              4'h9: pos_low = 10'h2f9;
              4'ha: pos_low = 10'h2fa;
              4'hb: pos_low = 10'h2fb;
              4'hc: pos_low = 10'h2fc;
              4'hd: pos_low = 10'h2fd;
              4'he: pos_low = 10'h2fe;
              4'hf: pos_low = 10'h2ff;
              default: pos_low = 10'h000;
            endcase
          end
          6'h30: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h300;
              4'h1: pos_low = 10'h301;
              4'h2: pos_low = 10'h302;
              4'h3: pos_low = 10'h303;
              4'h4: pos_low = 10'h304;
              4'h5: pos_low = 10'h305;
              4'h6: pos_low = 10'h306;
              4'h7: pos_low = 10'h307;
              4'h8: pos_low = 10'h308;
              4'h9: pos_low = 10'h309;
              4'ha: pos_low = 10'h30a;
              4'hb: pos_low = 10'h30b;
              4'hc: pos_low = 10'h30c;
              4'hd: pos_low = 10'h30d;
              4'he: pos_low = 10'h30e;
              4'hf: pos_low = 10'h30f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h31: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h310;
              4'h1: pos_low = 10'h311;
              4'h2: pos_low = 10'h312;
              4'h3: pos_low = 10'h313;
              4'h4: pos_low = 10'h314;
              4'h5: pos_low = 10'h315;
              4'h6: pos_low = 10'h316;
              4'h7: pos_low = 10'h317;
              4'h8: pos_low = 10'h318;
              4'h9: pos_low = 10'h319;
              4'ha: pos_low = 10'h31a;
              4'hb: pos_low = 10'h31b;
              4'hc: pos_low = 10'h31c;
              4'hd: pos_low = 10'h31d;
              4'he: pos_low = 10'h31e;
              4'hf: pos_low = 10'h31f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h32: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h320;
              4'h1: pos_low = 10'h321;
              4'h2: pos_low = 10'h322;
              4'h3: pos_low = 10'h323;
              4'h4: pos_low = 10'h324;
              4'h5: pos_low = 10'h325;
              4'h6: pos_low = 10'h326;
              4'h7: pos_low = 10'h327;
              4'h8: pos_low = 10'h328;
              4'h9: pos_low = 10'h329;
              4'ha: pos_low = 10'h32a;
              4'hb: pos_low = 10'h32b;
              4'hc: pos_low = 10'h32c;
              4'hd: pos_low = 10'h32d;
              4'he: pos_low = 10'h32e;
              4'hf: pos_low = 10'h32f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h33: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h330;
              4'h1: pos_low = 10'h331;
              4'h2: pos_low = 10'h332;
              4'h3: pos_low = 10'h333;
              4'h4: pos_low = 10'h334;
              4'h5: pos_low = 10'h335;
              4'h6: pos_low = 10'h336;
              4'h7: pos_low = 10'h337;
              4'h8: pos_low = 10'h338;
              4'h9: pos_low = 10'h339;
              4'ha: pos_low = 10'h33a;
              4'hb: pos_low = 10'h33b;
              4'hc: pos_low = 10'h33c;
              4'hd: pos_low = 10'h33d;
              4'he: pos_low = 10'h33e;
              4'hf: pos_low = 10'h33f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h34: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h340;
              4'h1: pos_low = 10'h341;
              4'h2: pos_low = 10'h342;
              4'h3: pos_low = 10'h343;
              4'h4: pos_low = 10'h344;
              4'h5: pos_low = 10'h345;
              4'h6: pos_low = 10'h346;
              4'h7: pos_low = 10'h347;
              4'h8: pos_low = 10'h348;
              4'h9: pos_low = 10'h349;
              4'ha: pos_low = 10'h34a;
              4'hb: pos_low = 10'h34b;
              4'hc: pos_low = 10'h34c;
              4'hd: pos_low = 10'h34d;
              4'he: pos_low = 10'h34e;
              4'hf: pos_low = 10'h34f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h35: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h350;
              4'h1: pos_low = 10'h351;
              4'h2: pos_low = 10'h352;
              4'h3: pos_low = 10'h353;
              4'h4: pos_low = 10'h354;
              4'h5: pos_low = 10'h355;
              4'h6: pos_low = 10'h356;
              4'h7: pos_low = 10'h357;
              4'h8: pos_low = 10'h358;
              4'h9: pos_low = 10'h359;
              4'ha: pos_low = 10'h35a;
              4'hb: pos_low = 10'h35b;
              4'hc: pos_low = 10'h35c;
              4'hd: pos_low = 10'h35d;
              4'he: pos_low = 10'h35e;
              4'hf: pos_low = 10'h35f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h36: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h360;
              4'h1: pos_low = 10'h361;
              4'h2: pos_low = 10'h362;
              4'h3: pos_low = 10'h363;
              4'h4: pos_low = 10'h364;
              4'h5: pos_low = 10'h365;
              4'h6: pos_low = 10'h366;
              4'h7: pos_low = 10'h367;
              4'h8: pos_low = 10'h368;
              4'h9: pos_low = 10'h369;
              4'ha: pos_low = 10'h36a;
              4'hb: pos_low = 10'h36b;
              4'hc: pos_low = 10'h36c;
              4'hd: pos_low = 10'h36d;
              4'he: pos_low = 10'h36e;
              4'hf: pos_low = 10'h36f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h37: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h370;
              4'h1: pos_low = 10'h371;
              4'h2: pos_low = 10'h372;
              4'h3: pos_low = 10'h373;
              4'h4: pos_low = 10'h374;
              4'h5: pos_low = 10'h375;
              4'h6: pos_low = 10'h376;
              4'h7: pos_low = 10'h377;
              4'h8: pos_low = 10'h378;
              4'h9: pos_low = 10'h379;
              4'ha: pos_low = 10'h37a;
              4'hb: pos_low = 10'h37b;
              4'hc: pos_low = 10'h37c;
              4'hd: pos_low = 10'h37d;
              4'he: pos_low = 10'h37e;
              4'hf: pos_low = 10'h37f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h38: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h380;
              4'h1: pos_low = 10'h381;
              4'h2: pos_low = 10'h382;
              4'h3: pos_low = 10'h383;
              4'h4: pos_low = 10'h384;
              4'h5: pos_low = 10'h385;
              4'h6: pos_low = 10'h386;
              4'h7: pos_low = 10'h387;
              4'h8: pos_low = 10'h388;
              4'h9: pos_low = 10'h389;
              4'ha: pos_low = 10'h38a;
              4'hb: pos_low = 10'h38b;
              4'hc: pos_low = 10'h38c;
              4'hd: pos_low = 10'h38d;
              4'he: pos_low = 10'h38e;
              4'hf: pos_low = 10'h38f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h39: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h390;
              4'h1: pos_low = 10'h391;
              4'h2: pos_low = 10'h392;
              4'h3: pos_low = 10'h393;
              4'h4: pos_low = 10'h394;
              4'h5: pos_low = 10'h395;
              4'h6: pos_low = 10'h396;
              4'h7: pos_low = 10'h397;
              4'h8: pos_low = 10'h398;
              4'h9: pos_low = 10'h399;
              4'ha: pos_low = 10'h39a;
              4'hb: pos_low = 10'h39b;
              4'hc: pos_low = 10'h39c;
              4'hd: pos_low = 10'h39d;
              4'he: pos_low = 10'h39e;
              4'hf: pos_low = 10'h39f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h3a: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3a0;
              4'h1: pos_low = 10'h3a1;
              4'h2: pos_low = 10'h3a2;
              4'h3: pos_low = 10'h3a3;
              4'h4: pos_low = 10'h3a4;
              4'h5: pos_low = 10'h3a5;
              4'h6: pos_low = 10'h3a6;
              4'h7: pos_low = 10'h3a7;
              4'h8: pos_low = 10'h3a8;
              4'h9: pos_low = 10'h3a9;
              4'ha: pos_low = 10'h3aa;
              4'hb: pos_low = 10'h3ab;
              4'hc: pos_low = 10'h3ac;
              4'hd: pos_low = 10'h3ad;
              4'he: pos_low = 10'h3ae;
              4'hf: pos_low = 10'h3af;
              default: pos_low = 10'h000;
            endcase
          end
          6'h3b: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3b0;
              4'h1: pos_low = 10'h3b1;
              4'h2: pos_low = 10'h3b2;
              4'h3: pos_low = 10'h3b3;
              4'h4: pos_low = 10'h3b4;
              4'h5: pos_low = 10'h3b5;
              4'h6: pos_low = 10'h3b6;
              4'h7: pos_low = 10'h3b7;
              4'h8: pos_low = 10'h3b8;
              4'h9: pos_low = 10'h3b9;
              4'ha: pos_low = 10'h3ba;
              4'hb: pos_low = 10'h3bb;
              4'hc: pos_low = 10'h3bc;
              4'hd: pos_low = 10'h3bd;
              4'he: pos_low = 10'h3be;
              4'hf: pos_low = 10'h3bf;
              default: pos_low = 10'h000;
            endcase
          end
          6'h3c: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3c0;
              4'h1: pos_low = 10'h3c1;
              4'h2: pos_low = 10'h3c2;
              4'h3: pos_low = 10'h3c3;
              4'h4: pos_low = 10'h3c4;
              4'h5: pos_low = 10'h3c5;
              4'h6: pos_low = 10'h3c6;
              4'h7: pos_low = 10'h3c7;
              4'h8: pos_low = 10'h3c8;
              4'h9: pos_low = 10'h3c9;
              4'ha: pos_low = 10'h3ca;
              4'hb: pos_low = 10'h3cb;
              4'hc: pos_low = 10'h3cc;
              4'hd: pos_low = 10'h3cd;
              4'he: pos_low = 10'h3ce;
              4'hf: pos_low = 10'h3cf;
              default: pos_low = 10'h000;
            endcase
          end
          6'h3d: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3d0;
              4'h1: pos_low = 10'h3d1;
              4'h2: pos_low = 10'h3d2;
              4'h3: pos_low = 10'h3d3;
              4'h4: pos_low = 10'h3d4;
              4'h5: pos_low = 10'h3d5;
              4'h6: pos_low = 10'h3d6;
              4'h7: pos_low = 10'h3d7;
              4'h8: pos_low = 10'h3d8;
              4'h9: pos_low = 10'h3d9;
              4'ha: pos_low = 10'h3da;
              4'hb: pos_low = 10'h3db;
              4'hc: pos_low = 10'h3dc;
              4'hd: pos_low = 10'h3dd;
              4'he: pos_low = 10'h3de;
              4'hf: pos_low = 10'h3df;
              default: pos_low = 10'h000;
            endcase
          end
          6'h3e: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3e0;
              4'h1: pos_low = 10'h3e1;
              4'h2: pos_low = 10'h3e2;
              4'h3: pos_low = 10'h3e3;
              4'h4: pos_low = 10'h3e4;
              4'h5: pos_low = 10'h3e5;
              4'h6: pos_low = 10'h3e6;
              4'h7: pos_low = 10'h3e7;
              4'h8: pos_low = 10'h3e8;
              4'h9: pos_low = 10'h3e9;
              4'ha: pos_low = 10'h3ea;
              4'hb: pos_low = 10'h3eb;
              4'hc: pos_low = 10'h3ec;
              4'hd: pos_low = 10'h3ed;
              4'he: pos_low = 10'h3ee;
              4'hf: pos_low = 10'h3ef;
              default: pos_low = 10'h000;
            endcase
          end
          6'h3f: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3f0;
              4'h1: pos_low = 10'h3f1;
              4'h2: pos_low = 10'h3f2;
              4'h3: pos_low = 10'h3f3;
              4'h4: pos_low = 10'h3f4;
              4'h5: pos_low = 10'h3f5;
              4'h6: pos_low = 10'h3f6;
              4'h7: pos_low = 10'h3f7;
              4'h8: pos_low = 10'h3f8;
              4'h9: pos_low = 10'h3f9;
              4'ha: pos_low = 10'h3fa;
              4'hb: pos_low = 10'h3fb;
              4'hc: pos_low = 10'h3fc;
              4'hd: pos_low = 10'h3fd;
              4'he: pos_low = 10'h3fe;
              4'hf: pos_low = 10'h3ff;
              default: pos_low = 10'h000;
            endcase
          end
          default: begin end
        endcase
      end
      5'h03: begin
        case (mant[9:4])
          6'h00: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h000;
              4'h1: pos_low = 10'h001;
              4'h2: pos_low = 10'h002;
              4'h3: pos_low = 10'h003;
              4'h4: pos_low = 10'h004;
              4'h5: pos_low = 10'h005;
              4'h6: pos_low = 10'h006;
              4'h7: pos_low = 10'h007;
              4'h8: pos_low = 10'h008;
              4'h9: pos_low = 10'h009;
              4'ha: pos_low = 10'h00a;
              4'hb: pos_low = 10'h00b;
              4'hc: pos_low = 10'h00c;
              4'hd: pos_low = 10'h00d;
              4'he: pos_low = 10'h00e;
              4'hf: pos_low = 10'h00f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h01: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h010;
              4'h1: pos_low = 10'h011;
              4'h2: pos_low = 10'h012;
              4'h3: pos_low = 10'h013;
              4'h4: pos_low = 10'h014;
              4'h5: pos_low = 10'h015;
              4'h6: pos_low = 10'h016;
              4'h7: pos_low = 10'h017;
              4'h8: pos_low = 10'h018;
              4'h9: pos_low = 10'h019;
              4'ha: pos_low = 10'h01a;
              4'hb: pos_low = 10'h01b;
              4'hc: pos_low = 10'h01c;
              4'hd: pos_low = 10'h01d;
              4'he: pos_low = 10'h01e;
              4'hf: pos_low = 10'h01f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h02: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h020;
              4'h1: pos_low = 10'h021;
              4'h2: pos_low = 10'h022;
              4'h3: pos_low = 10'h023;
              4'h4: pos_low = 10'h024;
              4'h5: pos_low = 10'h025;
              4'h6: pos_low = 10'h026;
              4'h7: pos_low = 10'h027;
              4'h8: pos_low = 10'h028;
              4'h9: pos_low = 10'h029;
              4'ha: pos_low = 10'h02a;
              4'hb: pos_low = 10'h02b;
              4'hc: pos_low = 10'h02c;
              4'hd: pos_low = 10'h02d;
              4'he: pos_low = 10'h02e;
              4'hf: pos_low = 10'h02f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h03: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h030;
              4'h1: pos_low = 10'h031;
              4'h2: pos_low = 10'h032;
              4'h3: pos_low = 10'h033;
              4'h4: pos_low = 10'h034;
              4'h5: pos_low = 10'h035;
              4'h6: pos_low = 10'h036;
              4'h7: pos_low = 10'h037;
              4'h8: pos_low = 10'h038;
              4'h9: pos_low = 10'h039;
              4'ha: pos_low = 10'h03a;
              4'hb: pos_low = 10'h03b;
              4'hc: pos_low = 10'h03c;
              4'hd: pos_low = 10'h03d;
              4'he: pos_low = 10'h03e;
              4'hf: pos_low = 10'h03f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h04: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h040;
              4'h1: pos_low = 10'h041;
              4'h2: pos_low = 10'h042;
              4'h3: pos_low = 10'h043;
              4'h4: pos_low = 10'h044;
              4'h5: pos_low = 10'h045;
              4'h6: pos_low = 10'h046;
              4'h7: pos_low = 10'h047;
              4'h8: pos_low = 10'h048;
              4'h9: pos_low = 10'h049;
              4'ha: pos_low = 10'h04a;
              4'hb: pos_low = 10'h04b;
              4'hc: pos_low = 10'h04c;
              4'hd: pos_low = 10'h04d;
              4'he: pos_low = 10'h04e;
              4'hf: pos_low = 10'h04f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h05: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h050;
              4'h1: pos_low = 10'h051;
              4'h2: pos_low = 10'h052;
              4'h3: pos_low = 10'h053;
              4'h4: pos_low = 10'h054;
              4'h5: pos_low = 10'h055;
              4'h6: pos_low = 10'h056;
              4'h7: pos_low = 10'h057;
              4'h8: pos_low = 10'h058;
              4'h9: pos_low = 10'h059;
              4'ha: pos_low = 10'h05a;
              4'hb: pos_low = 10'h05b;
              4'hc: pos_low = 10'h05c;
              4'hd: pos_low = 10'h05d;
              4'he: pos_low = 10'h05e;
              4'hf: pos_low = 10'h05f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h06: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h060;
              4'h1: pos_low = 10'h061;
              4'h2: pos_low = 10'h062;
              4'h3: pos_low = 10'h063;
              4'h4: pos_low = 10'h064;
              4'h5: pos_low = 10'h065;
              4'h6: pos_low = 10'h066;
              4'h7: pos_low = 10'h067;
              4'h8: pos_low = 10'h068;
              4'h9: pos_low = 10'h069;
              4'ha: pos_low = 10'h06a;
              4'hb: pos_low = 10'h06b;
              4'hc: pos_low = 10'h06c;
              4'hd: pos_low = 10'h06d;
              4'he: pos_low = 10'h06e;
              4'hf: pos_low = 10'h06f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h07: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h070;
              4'h1: pos_low = 10'h071;
              4'h2: pos_low = 10'h072;
              4'h3: pos_low = 10'h073;
              4'h4: pos_low = 10'h074;
              4'h5: pos_low = 10'h075;
              4'h6: pos_low = 10'h076;
              4'h7: pos_low = 10'h077;
              4'h8: pos_low = 10'h078;
              4'h9: pos_low = 10'h079;
              4'ha: pos_low = 10'h07a;
              4'hb: pos_low = 10'h07b;
              4'hc: pos_low = 10'h07c;
              4'hd: pos_low = 10'h07d;
              4'he: pos_low = 10'h07e;
              4'hf: pos_low = 10'h07f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h08: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h080;
              4'h1: pos_low = 10'h081;
              4'h2: pos_low = 10'h082;
              4'h3: pos_low = 10'h083;
              4'h4: pos_low = 10'h084;
              4'h5: pos_low = 10'h085;
              4'h6: pos_low = 10'h086;
              4'h7: pos_low = 10'h087;
              4'h8: pos_low = 10'h088;
              4'h9: pos_low = 10'h089;
              4'ha: pos_low = 10'h08a;
              4'hb: pos_low = 10'h08b;
              4'hc: pos_low = 10'h08c;
              4'hd: pos_low = 10'h08d;
              4'he: pos_low = 10'h08e;
              4'hf: pos_low = 10'h08f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h09: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h090;
              4'h1: pos_low = 10'h091;
              4'h2: pos_low = 10'h092;
              4'h3: pos_low = 10'h093;
              4'h4: pos_low = 10'h094;
              4'h5: pos_low = 10'h095;
              4'h6: pos_low = 10'h096;
              4'h7: pos_low = 10'h097;
              4'h8: pos_low = 10'h098;
              4'h9: pos_low = 10'h099;
              4'ha: pos_low = 10'h09a;
              4'hb: pos_low = 10'h09b;
              4'hc: pos_low = 10'h09c;
              4'hd: pos_low = 10'h09d;
              4'he: pos_low = 10'h09e;
              4'hf: pos_low = 10'h09f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h0a: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h0a0;
              4'h1: pos_low = 10'h0a1;
              4'h2: pos_low = 10'h0a2;
              4'h3: pos_low = 10'h0a3;
              4'h4: pos_low = 10'h0a4;
              4'h5: pos_low = 10'h0a5;
              4'h6: pos_low = 10'h0a6;
              4'h7: pos_low = 10'h0a7;
              4'h8: pos_low = 10'h0a8;
              4'h9: pos_low = 10'h0a9;
              4'ha: pos_low = 10'h0aa;
              4'hb: pos_low = 10'h0ab;
              4'hc: pos_low = 10'h0ac;
              4'hd: pos_low = 10'h0ad;
              4'he: pos_low = 10'h0ae;
              4'hf: pos_low = 10'h0af;
              default: pos_low = 10'h000;
            endcase
          end
          6'h0b: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h0b0;
              4'h1: pos_low = 10'h0b1;
              4'h2: pos_low = 10'h0b2;
              4'h3: pos_low = 10'h0b3;
              4'h4: pos_low = 10'h0b4;
              4'h5: pos_low = 10'h0b5;
              4'h6: pos_low = 10'h0b6;
              4'h7: pos_low = 10'h0b7;
              4'h8: pos_low = 10'h0b8;
              4'h9: pos_low = 10'h0b9;
              4'ha: pos_low = 10'h0ba;
              4'hb: pos_low = 10'h0bb;
              4'hc: pos_low = 10'h0bc;
              4'hd: pos_low = 10'h0bd;
              4'he: pos_low = 10'h0be;
              4'hf: pos_low = 10'h0bf;
              default: pos_low = 10'h000;
            endcase
          end
          6'h0c: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h0c0;
              4'h1: pos_low = 10'h0c1;
              4'h2: pos_low = 10'h0c2;
              4'h3: pos_low = 10'h0c3;
              4'h4: pos_low = 10'h0c4;
              4'h5: pos_low = 10'h0c5;
              4'h6: pos_low = 10'h0c6;
              4'h7: pos_low = 10'h0c7;
              4'h8: pos_low = 10'h0c8;
              4'h9: pos_low = 10'h0c9;
              4'ha: pos_low = 10'h0ca;
              4'hb: pos_low = 10'h0cb;
              4'hc: pos_low = 10'h0cc;
              4'hd: pos_low = 10'h0cd;
              4'he: pos_low = 10'h0ce;
              4'hf: pos_low = 10'h0cf;
              default: pos_low = 10'h000;
            endcase
          end
          6'h0d: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h0d0;
              4'h1: pos_low = 10'h0d1;
              4'h2: pos_low = 10'h0d2;
              4'h3: pos_low = 10'h0d3;
              4'h4: pos_low = 10'h0d4;
              4'h5: pos_low = 10'h0d5;
              4'h6: pos_low = 10'h0d6;
              4'h7: pos_low = 10'h0d7;
              4'h8: pos_low = 10'h0d8;
              4'h9: pos_low = 10'h0d9;
              4'ha: pos_low = 10'h0da;
              4'hb: pos_low = 10'h0db;
              4'hc: pos_low = 10'h0dc;
              4'hd: pos_low = 10'h0dd;
              4'he: pos_low = 10'h0de;
              4'hf: pos_low = 10'h0df;
              default: pos_low = 10'h000;
            endcase
          end
          6'h0e: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h0e0;
              4'h1: pos_low = 10'h0e1;
              4'h2: pos_low = 10'h0e2;
              4'h3: pos_low = 10'h0e3;
              4'h4: pos_low = 10'h0e4;
              4'h5: pos_low = 10'h0e5;
              4'h6: pos_low = 10'h0e6;
              4'h7: pos_low = 10'h0e7;
              4'h8: pos_low = 10'h0e8;
              4'h9: pos_low = 10'h0e9;
              4'ha: pos_low = 10'h0ea;
              4'hb: pos_low = 10'h0eb;
              4'hc: pos_low = 10'h0ec;
              4'hd: pos_low = 10'h0ed;
              4'he: pos_low = 10'h0ee;
              4'hf: pos_low = 10'h0ef;
              default: pos_low = 10'h000;
            endcase
          end
          6'h0f: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h0f0;
              4'h1: pos_low = 10'h0f1;
              4'h2: pos_low = 10'h0f2;
              4'h3: pos_low = 10'h0f3;
              4'h4: pos_low = 10'h0f4;
              4'h5: pos_low = 10'h0f5;
              4'h6: pos_low = 10'h0f6;
              4'h7: pos_low = 10'h0f7;
              4'h8: pos_low = 10'h0f8;
              4'h9: pos_low = 10'h0f9;
              4'ha: pos_low = 10'h0fa;
              4'hb: pos_low = 10'h0fb;
              4'hc: pos_low = 10'h0fc;
              4'hd: pos_low = 10'h0fd;
              4'he: pos_low = 10'h0fe;
              4'hf: pos_low = 10'h0ff;
              default: pos_low = 10'h000;
            endcase
          end
          6'h10: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h100;
              4'h1: pos_low = 10'h101;
              4'h2: pos_low = 10'h102;
              4'h3: pos_low = 10'h103;
              4'h4: pos_low = 10'h104;
              4'h5: pos_low = 10'h105;
              4'h6: pos_low = 10'h106;
              4'h7: pos_low = 10'h107;
              4'h8: pos_low = 10'h108;
              4'h9: pos_low = 10'h109;
              4'ha: pos_low = 10'h10a;
              4'hb: pos_low = 10'h10b;
              4'hc: pos_low = 10'h10c;
              4'hd: pos_low = 10'h10d;
              4'he: pos_low = 10'h10e;
              4'hf: pos_low = 10'h10f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h11: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h110;
              4'h1: pos_low = 10'h111;
              4'h2: pos_low = 10'h112;
              4'h3: pos_low = 10'h113;
              4'h4: pos_low = 10'h114;
              4'h5: pos_low = 10'h115;
              4'h6: pos_low = 10'h116;
              4'h7: pos_low = 10'h117;
              4'h8: pos_low = 10'h118;
              4'h9: pos_low = 10'h119;
              4'ha: pos_low = 10'h11a;
              4'hb: pos_low = 10'h11b;
              4'hc: pos_low = 10'h11c;
              4'hd: pos_low = 10'h11d;
              4'he: pos_low = 10'h11e;
              4'hf: pos_low = 10'h11f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h12: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h120;
              4'h1: pos_low = 10'h121;
              4'h2: pos_low = 10'h122;
              4'h3: pos_low = 10'h123;
              4'h4: pos_low = 10'h124;
              4'h5: pos_low = 10'h125;
              4'h6: pos_low = 10'h126;
              4'h7: pos_low = 10'h127;
              4'h8: pos_low = 10'h128;
              4'h9: pos_low = 10'h129;
              4'ha: pos_low = 10'h12a;
              4'hb: pos_low = 10'h12b;
              4'hc: pos_low = 10'h12c;
              4'hd: pos_low = 10'h12d;
              4'he: pos_low = 10'h12e;
              4'hf: pos_low = 10'h12f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h13: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h130;
              4'h1: pos_low = 10'h131;
              4'h2: pos_low = 10'h132;
              4'h3: pos_low = 10'h133;
              4'h4: pos_low = 10'h134;
              4'h5: pos_low = 10'h135;
              4'h6: pos_low = 10'h136;
              4'h7: pos_low = 10'h137;
              4'h8: pos_low = 10'h138;
              4'h9: pos_low = 10'h139;
              4'ha: pos_low = 10'h13a;
              4'hb: pos_low = 10'h13b;
              4'hc: pos_low = 10'h13c;
              4'hd: pos_low = 10'h13d;
              4'he: pos_low = 10'h13e;
              4'hf: pos_low = 10'h13f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h14: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h140;
              4'h1: pos_low = 10'h141;
              4'h2: pos_low = 10'h142;
              4'h3: pos_low = 10'h143;
              4'h4: pos_low = 10'h144;
              4'h5: pos_low = 10'h145;
              4'h6: pos_low = 10'h146;
              4'h7: pos_low = 10'h147;
              4'h8: pos_low = 10'h148;
              4'h9: pos_low = 10'h149;
              4'ha: pos_low = 10'h14a;
              4'hb: pos_low = 10'h14b;
              4'hc: pos_low = 10'h14c;
              4'hd: pos_low = 10'h14d;
              4'he: pos_low = 10'h14e;
              4'hf: pos_low = 10'h14f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h15: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h150;
              4'h1: pos_low = 10'h151;
              4'h2: pos_low = 10'h152;
              4'h3: pos_low = 10'h153;
              4'h4: pos_low = 10'h154;
              4'h5: pos_low = 10'h155;
              4'h6: pos_low = 10'h156;
              4'h7: pos_low = 10'h157;
              4'h8: pos_low = 10'h158;
              4'h9: pos_low = 10'h159;
              4'ha: pos_low = 10'h15a;
              4'hb: pos_low = 10'h15b;
              4'hc: pos_low = 10'h15c;
              4'hd: pos_low = 10'h15d;
              4'he: pos_low = 10'h15e;
              4'hf: pos_low = 10'h15f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h16: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h160;
              4'h1: pos_low = 10'h161;
              4'h2: pos_low = 10'h162;
              4'h3: pos_low = 10'h163;
              4'h4: pos_low = 10'h164;
              4'h5: pos_low = 10'h165;
              4'h6: pos_low = 10'h166;
              4'h7: pos_low = 10'h167;
              4'h8: pos_low = 10'h168;
              4'h9: pos_low = 10'h169;
              4'ha: pos_low = 10'h16a;
              4'hb: pos_low = 10'h16b;
              4'hc: pos_low = 10'h16c;
              4'hd: pos_low = 10'h16d;
              4'he: pos_low = 10'h16e;
              4'hf: pos_low = 10'h16f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h17: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h170;
              4'h1: pos_low = 10'h171;
              4'h2: pos_low = 10'h172;
              4'h3: pos_low = 10'h173;
              4'h4: pos_low = 10'h174;
              4'h5: pos_low = 10'h175;
              4'h6: pos_low = 10'h176;
              4'h7: pos_low = 10'h177;
              4'h8: pos_low = 10'h178;
              4'h9: pos_low = 10'h179;
              4'ha: pos_low = 10'h17a;
              4'hb: pos_low = 10'h17b;
              4'hc: pos_low = 10'h17c;
              4'hd: pos_low = 10'h17d;
              4'he: pos_low = 10'h17e;
              4'hf: pos_low = 10'h17f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h18: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h180;
              4'h1: pos_low = 10'h181;
              4'h2: pos_low = 10'h182;
              4'h3: pos_low = 10'h183;
              4'h4: pos_low = 10'h184;
              4'h5: pos_low = 10'h185;
              4'h6: pos_low = 10'h186;
              4'h7: pos_low = 10'h187;
              4'h8: pos_low = 10'h188;
              4'h9: pos_low = 10'h189;
              4'ha: pos_low = 10'h18a;
              4'hb: pos_low = 10'h18b;
              4'hc: pos_low = 10'h18c;
              4'hd: pos_low = 10'h18d;
              4'he: pos_low = 10'h18e;
              4'hf: pos_low = 10'h18f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h19: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h190;
              4'h1: pos_low = 10'h191;
              4'h2: pos_low = 10'h192;
              4'h3: pos_low = 10'h193;
              4'h4: pos_low = 10'h194;
              4'h5: pos_low = 10'h195;
              4'h6: pos_low = 10'h196;
              4'h7: pos_low = 10'h197;
              4'h8: pos_low = 10'h198;
              4'h9: pos_low = 10'h199;
              4'ha: pos_low = 10'h19a;
              4'hb: pos_low = 10'h19b;
              4'hc: pos_low = 10'h19c;
              4'hd: pos_low = 10'h19d;
              4'he: pos_low = 10'h19e;
              4'hf: pos_low = 10'h19f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h1a: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h1a0;
              4'h1: pos_low = 10'h1a1;
              4'h2: pos_low = 10'h1a2;
              4'h3: pos_low = 10'h1a3;
              4'h4: pos_low = 10'h1a4;
              4'h5: pos_low = 10'h1a5;
              4'h6: pos_low = 10'h1a6;
              4'h7: pos_low = 10'h1a7;
              4'h8: pos_low = 10'h1a8;
              4'h9: pos_low = 10'h1a9;
              4'ha: pos_low = 10'h1aa;
              4'hb: pos_low = 10'h1ab;
              4'hc: pos_low = 10'h1ac;
              4'hd: pos_low = 10'h1ad;
              4'he: pos_low = 10'h1ae;
              4'hf: pos_low = 10'h1af;
              default: pos_low = 10'h000;
            endcase
          end
          6'h1b: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h1b0;
              4'h1: pos_low = 10'h1b1;
              4'h2: pos_low = 10'h1b2;
              4'h3: pos_low = 10'h1b3;
              4'h4: pos_low = 10'h1b4;
              4'h5: pos_low = 10'h1b5;
              4'h6: pos_low = 10'h1b6;
              4'h7: pos_low = 10'h1b7;
              4'h8: pos_low = 10'h1b8;
              4'h9: pos_low = 10'h1b9;
              4'ha: pos_low = 10'h1ba;
              4'hb: pos_low = 10'h1bb;
              4'hc: pos_low = 10'h1bc;
              4'hd: pos_low = 10'h1bd;
              4'he: pos_low = 10'h1be;
              4'hf: pos_low = 10'h1bf;
              default: pos_low = 10'h000;
            endcase
          end
          6'h1c: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h1c0;
              4'h1: pos_low = 10'h1c1;
              4'h2: pos_low = 10'h1c2;
              4'h3: pos_low = 10'h1c3;
              4'h4: pos_low = 10'h1c4;
              4'h5: pos_low = 10'h1c5;
              4'h6: pos_low = 10'h1c6;
              4'h7: pos_low = 10'h1c7;
              4'h8: pos_low = 10'h1c8;
              4'h9: pos_low = 10'h1c9;
              4'ha: pos_low = 10'h1ca;
              4'hb: pos_low = 10'h1cb;
              4'hc: pos_low = 10'h1cc;
              4'hd: pos_low = 10'h1cd;
              4'he: pos_low = 10'h1ce;
              4'hf: pos_low = 10'h1cf;
              default: pos_low = 10'h000;
            endcase
          end
          6'h1d: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h1d0;
              4'h1: pos_low = 10'h1d1;
              4'h2: pos_low = 10'h1d2;
              4'h3: pos_low = 10'h1d3;
              4'h4: pos_low = 10'h1d4;
              4'h5: pos_low = 10'h1d5;
              4'h6: pos_low = 10'h1d6;
              4'h7: pos_low = 10'h1d7;
              4'h8: pos_low = 10'h1d8;
              4'h9: pos_low = 10'h1d9;
              4'ha: pos_low = 10'h1da;
              4'hb: pos_low = 10'h1db;
              4'hc: pos_low = 10'h1dc;
              4'hd: pos_low = 10'h1dd;
              4'he: pos_low = 10'h1de;
              4'hf: pos_low = 10'h1df;
              default: pos_low = 10'h000;
            endcase
          end
          6'h1e: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h1e0;
              4'h1: pos_low = 10'h1e1;
              4'h2: pos_low = 10'h1e2;
              4'h3: pos_low = 10'h1e3;
              4'h4: pos_low = 10'h1e4;
              4'h5: pos_low = 10'h1e5;
              4'h6: pos_low = 10'h1e6;
              4'h7: pos_low = 10'h1e7;
              4'h8: pos_low = 10'h1e8;
              4'h9: pos_low = 10'h1e9;
              4'ha: pos_low = 10'h1ea;
              4'hb: pos_low = 10'h1eb;
              4'hc: pos_low = 10'h1ec;
              4'hd: pos_low = 10'h1ed;
              4'he: pos_low = 10'h1ee;
              4'hf: pos_low = 10'h1ef;
              default: pos_low = 10'h000;
            endcase
          end
          6'h1f: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h1f0;
              4'h1: pos_low = 10'h1f1;
              4'h2: pos_low = 10'h1f2;
              4'h3: pos_low = 10'h1f3;
              4'h4: pos_low = 10'h1f4;
              4'h5: pos_low = 10'h1f5;
              4'h6: pos_low = 10'h1f6;
              4'h7: pos_low = 10'h1f7;
              4'h8: pos_low = 10'h1f8;
              4'h9: pos_low = 10'h1f9;
              4'ha: pos_low = 10'h1fa;
              4'hb: pos_low = 10'h1fb;
              4'hc: pos_low = 10'h1fc;
              4'hd: pos_low = 10'h1fd;
              4'he: pos_low = 10'h1fe;
              4'hf: pos_low = 10'h1ff;
              default: pos_low = 10'h000;
            endcase
          end
          6'h20: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h200;
              4'h1: pos_low = 10'h201;
              4'h2: pos_low = 10'h202;
              4'h3: pos_low = 10'h203;
              4'h4: pos_low = 10'h204;
              4'h5: pos_low = 10'h205;
              4'h6: pos_low = 10'h206;
              4'h7: pos_low = 10'h207;
              4'h8: pos_low = 10'h208;
              4'h9: pos_low = 10'h209;
              4'ha: pos_low = 10'h20a;
              4'hb: pos_low = 10'h20b;
              4'hc: pos_low = 10'h20c;
              4'hd: pos_low = 10'h20d;
              4'he: pos_low = 10'h20e;
              4'hf: pos_low = 10'h20f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h21: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h210;
              4'h1: pos_low = 10'h211;
              4'h2: pos_low = 10'h212;
              4'h3: pos_low = 10'h213;
              4'h4: pos_low = 10'h214;
              4'h5: pos_low = 10'h215;
              4'h6: pos_low = 10'h216;
              4'h7: pos_low = 10'h217;
              4'h8: pos_low = 10'h218;
              4'h9: pos_low = 10'h219;
              4'ha: pos_low = 10'h21a;
              4'hb: pos_low = 10'h21b;
              4'hc: pos_low = 10'h21c;
              4'hd: pos_low = 10'h21d;
              4'he: pos_low = 10'h21e;
              4'hf: pos_low = 10'h21f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h22: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h220;
              4'h1: pos_low = 10'h221;
              4'h2: pos_low = 10'h222;
              4'h3: pos_low = 10'h223;
              4'h4: pos_low = 10'h224;
              4'h5: pos_low = 10'h225;
              4'h6: pos_low = 10'h226;
              4'h7: pos_low = 10'h227;
              4'h8: pos_low = 10'h228;
              4'h9: pos_low = 10'h229;
              4'ha: pos_low = 10'h22a;
              4'hb: pos_low = 10'h22b;
              4'hc: pos_low = 10'h22c;
              4'hd: pos_low = 10'h22d;
              4'he: pos_low = 10'h22e;
              4'hf: pos_low = 10'h22f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h23: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h230;
              4'h1: pos_low = 10'h231;
              4'h2: pos_low = 10'h232;
              4'h3: pos_low = 10'h233;
              4'h4: pos_low = 10'h234;
              4'h5: pos_low = 10'h235;
              4'h6: pos_low = 10'h236;
              4'h7: pos_low = 10'h237;
              4'h8: pos_low = 10'h238;
              4'h9: pos_low = 10'h239;
              4'ha: pos_low = 10'h23a;
              4'hb: pos_low = 10'h23b;
              4'hc: pos_low = 10'h23c;
              4'hd: pos_low = 10'h23d;
              4'he: pos_low = 10'h23e;
              4'hf: pos_low = 10'h23f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h24: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h240;
              4'h1: pos_low = 10'h241;
              4'h2: pos_low = 10'h242;
              4'h3: pos_low = 10'h243;
              4'h4: pos_low = 10'h244;
              4'h5: pos_low = 10'h245;
              4'h6: pos_low = 10'h246;
              4'h7: pos_low = 10'h247;
              4'h8: pos_low = 10'h248;
              4'h9: pos_low = 10'h249;
              4'ha: pos_low = 10'h24a;
              4'hb: pos_low = 10'h24b;
              4'hc: pos_low = 10'h24c;
              4'hd: pos_low = 10'h24d;
              4'he: pos_low = 10'h24e;
              4'hf: pos_low = 10'h24f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h25: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h250;
              4'h1: pos_low = 10'h251;
              4'h2: pos_low = 10'h252;
              4'h3: pos_low = 10'h253;
              4'h4: pos_low = 10'h254;
              4'h5: pos_low = 10'h255;
              4'h6: pos_low = 10'h256;
              4'h7: pos_low = 10'h257;
              4'h8: pos_low = 10'h258;
              4'h9: pos_low = 10'h259;
              4'ha: pos_low = 10'h25a;
              4'hb: pos_low = 10'h25b;
              4'hc: pos_low = 10'h25c;
              4'hd: pos_low = 10'h25d;
              4'he: pos_low = 10'h25e;
              4'hf: pos_low = 10'h25f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h26: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h260;
              4'h1: pos_low = 10'h261;
              4'h2: pos_low = 10'h262;
              4'h3: pos_low = 10'h263;
              4'h4: pos_low = 10'h264;
              4'h5: pos_low = 10'h265;
              4'h6: pos_low = 10'h266;
              4'h7: pos_low = 10'h267;
              4'h8: pos_low = 10'h268;
              4'h9: pos_low = 10'h269;
              4'ha: pos_low = 10'h26a;
              4'hb: pos_low = 10'h26b;
              4'hc: pos_low = 10'h26c;
              4'hd: pos_low = 10'h26d;
              4'he: pos_low = 10'h26e;
              4'hf: pos_low = 10'h26f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h27: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h270;
              4'h1: pos_low = 10'h271;
              4'h2: pos_low = 10'h272;
              4'h3: pos_low = 10'h273;
              4'h4: pos_low = 10'h274;
              4'h5: pos_low = 10'h275;
              4'h6: pos_low = 10'h276;
              4'h7: pos_low = 10'h277;
              4'h8: pos_low = 10'h278;
              4'h9: pos_low = 10'h279;
              4'ha: pos_low = 10'h27a;
              4'hb: pos_low = 10'h27b;
              4'hc: pos_low = 10'h27c;
              4'hd: pos_low = 10'h27d;
              4'he: pos_low = 10'h27e;
              4'hf: pos_low = 10'h27f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h28: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h280;
              4'h1: pos_low = 10'h281;
              4'h2: pos_low = 10'h282;
              4'h3: pos_low = 10'h283;
              4'h4: pos_low = 10'h284;
              4'h5: pos_low = 10'h285;
              4'h6: pos_low = 10'h286;
              4'h7: pos_low = 10'h287;
              4'h8: pos_low = 10'h288;
              4'h9: pos_low = 10'h289;
              4'ha: pos_low = 10'h28a;
              4'hb: pos_low = 10'h28b;
              4'hc: pos_low = 10'h28c;
              4'hd: pos_low = 10'h28d;
              4'he: pos_low = 10'h28e;
              4'hf: pos_low = 10'h28f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h29: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h290;
              4'h1: pos_low = 10'h291;
              4'h2: pos_low = 10'h292;
              4'h3: pos_low = 10'h293;
              4'h4: pos_low = 10'h294;
              4'h5: pos_low = 10'h295;
              4'h6: pos_low = 10'h296;
              4'h7: pos_low = 10'h297;
              4'h8: pos_low = 10'h298;
              4'h9: pos_low = 10'h299;
              4'ha: pos_low = 10'h29a;
              4'hb: pos_low = 10'h29b;
              4'hc: pos_low = 10'h29c;
              4'hd: pos_low = 10'h29d;
              4'he: pos_low = 10'h29e;
              4'hf: pos_low = 10'h29f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h2a: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h2a0;
              4'h1: pos_low = 10'h2a1;
              4'h2: pos_low = 10'h2a2;
              4'h3: pos_low = 10'h2a3;
              4'h4: pos_low = 10'h2a4;
              4'h5: pos_low = 10'h2a5;
              4'h6: pos_low = 10'h2a6;
              4'h7: pos_low = 10'h2a7;
              4'h8: pos_low = 10'h2a8;
              4'h9: pos_low = 10'h2a9;
              4'ha: pos_low = 10'h2aa;
              4'hb: pos_low = 10'h2ab;
              4'hc: pos_low = 10'h2ac;
              4'hd: pos_low = 10'h2ad;
              4'he: pos_low = 10'h2ae;
              4'hf: pos_low = 10'h2af;
              default: pos_low = 10'h000;
            endcase
          end
          6'h2b: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h2b0;
              4'h1: pos_low = 10'h2b1;
              4'h2: pos_low = 10'h2b2;
              4'h3: pos_low = 10'h2b3;
              4'h4: pos_low = 10'h2b4;
              4'h5: pos_low = 10'h2b5;
              4'h6: pos_low = 10'h2b6;
              4'h7: pos_low = 10'h2b7;
              4'h8: pos_low = 10'h2b8;
              4'h9: pos_low = 10'h2b9;
              4'ha: pos_low = 10'h2ba;
              4'hb: pos_low = 10'h2bb;
              4'hc: pos_low = 10'h2bc;
              4'hd: pos_low = 10'h2bd;
              4'he: pos_low = 10'h2be;
              4'hf: pos_low = 10'h2bf;
              default: pos_low = 10'h000;
            endcase
          end
          6'h2c: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h2c0;
              4'h1: pos_low = 10'h2c1;
              4'h2: pos_low = 10'h2c2;
              4'h3: pos_low = 10'h2c3;
              4'h4: pos_low = 10'h2c4;
              4'h5: pos_low = 10'h2c5;
              4'h6: pos_low = 10'h2c6;
              4'h7: pos_low = 10'h2c7;
              4'h8: pos_low = 10'h2c8;
              4'h9: pos_low = 10'h2c9;
              4'ha: pos_low = 10'h2ca;
              4'hb: pos_low = 10'h2cb;
              4'hc: pos_low = 10'h2cc;
              4'hd: pos_low = 10'h2cd;
              4'he: pos_low = 10'h2ce;
              4'hf: pos_low = 10'h2cf;
              default: pos_low = 10'h000;
            endcase
          end
          6'h2d: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h2d0;
              4'h1: pos_low = 10'h2d1;
              4'h2: pos_low = 10'h2d2;
              4'h3: pos_low = 10'h2d3;
              4'h4: pos_low = 10'h2d4;
              4'h5: pos_low = 10'h2d5;
              4'h6: pos_low = 10'h2d6;
              4'h7: pos_low = 10'h2d7;
              4'h8: pos_low = 10'h2d8;
              4'h9: pos_low = 10'h2d9;
              4'ha: pos_low = 10'h2da;
              4'hb: pos_low = 10'h2db;
              4'hc: pos_low = 10'h2dc;
              4'hd: pos_low = 10'h2dd;
              4'he: pos_low = 10'h2de;
              4'hf: pos_low = 10'h2df;
              default: pos_low = 10'h000;
            endcase
          end
          6'h2e: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h2e0;
              4'h1: pos_low = 10'h2e1;
              4'h2: pos_low = 10'h2e2;
              4'h3: pos_low = 10'h2e3;
              4'h4: pos_low = 10'h2e4;
              4'h5: pos_low = 10'h2e5;
              4'h6: pos_low = 10'h2e6;
              4'h7: pos_low = 10'h2e7;
              4'h8: pos_low = 10'h2e8;
              4'h9: pos_low = 10'h2e9;
              4'ha: pos_low = 10'h2ea;
              4'hb: pos_low = 10'h2eb;
              4'hc: pos_low = 10'h2ec;
              4'hd: pos_low = 10'h2ed;
              4'he: pos_low = 10'h2ee;
              4'hf: pos_low = 10'h2ef;
              default: pos_low = 10'h000;
            endcase
          end
          6'h2f: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h2f0;
              4'h1: pos_low = 10'h2f1;
              4'h2: pos_low = 10'h2f2;
              4'h3: pos_low = 10'h2f3;
              4'h4: pos_low = 10'h2f4;
              4'h5: pos_low = 10'h2f5;
              4'h6: pos_low = 10'h2f6;
              4'h7: pos_low = 10'h2f7;
              4'h8: pos_low = 10'h2f8;
              4'h9: pos_low = 10'h2f9;
              4'ha: pos_low = 10'h2fa;
              4'hb: pos_low = 10'h2fb;
              4'hc: pos_low = 10'h2fc;
              4'hd: pos_low = 10'h2fd;
              4'he: pos_low = 10'h2fe;
              4'hf: pos_low = 10'h2ff;
              default: pos_low = 10'h000;
            endcase
          end
          6'h30: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h300;
              4'h1: pos_low = 10'h301;
              4'h2: pos_low = 10'h302;
              4'h3: pos_low = 10'h303;
              4'h4: pos_low = 10'h304;
              4'h5: pos_low = 10'h305;
              4'h6: pos_low = 10'h306;
              4'h7: pos_low = 10'h307;
              4'h8: pos_low = 10'h308;
              4'h9: pos_low = 10'h309;
              4'ha: pos_low = 10'h30a;
              4'hb: pos_low = 10'h30b;
              4'hc: pos_low = 10'h30c;
              4'hd: pos_low = 10'h30d;
              4'he: pos_low = 10'h30e;
              4'hf: pos_low = 10'h30f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h31: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h310;
              4'h1: pos_low = 10'h311;
              4'h2: pos_low = 10'h312;
              4'h3: pos_low = 10'h313;
              4'h4: pos_low = 10'h314;
              4'h5: pos_low = 10'h315;
              4'h6: pos_low = 10'h316;
              4'h7: pos_low = 10'h317;
              4'h8: pos_low = 10'h318;
              4'h9: pos_low = 10'h319;
              4'ha: pos_low = 10'h31a;
              4'hb: pos_low = 10'h31b;
              4'hc: pos_low = 10'h31c;
              4'hd: pos_low = 10'h31d;
              4'he: pos_low = 10'h31e;
              4'hf: pos_low = 10'h31f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h32: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h320;
              4'h1: pos_low = 10'h321;
              4'h2: pos_low = 10'h322;
              4'h3: pos_low = 10'h323;
              4'h4: pos_low = 10'h324;
              4'h5: pos_low = 10'h325;
              4'h6: pos_low = 10'h326;
              4'h7: pos_low = 10'h327;
              4'h8: pos_low = 10'h328;
              4'h9: pos_low = 10'h329;
              4'ha: pos_low = 10'h32a;
              4'hb: pos_low = 10'h32b;
              4'hc: pos_low = 10'h32c;
              4'hd: pos_low = 10'h32d;
              4'he: pos_low = 10'h32e;
              4'hf: pos_low = 10'h32f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h33: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h330;
              4'h1: pos_low = 10'h331;
              4'h2: pos_low = 10'h332;
              4'h3: pos_low = 10'h333;
              4'h4: pos_low = 10'h334;
              4'h5: pos_low = 10'h335;
              4'h6: pos_low = 10'h336;
              4'h7: pos_low = 10'h337;
              4'h8: pos_low = 10'h338;
              4'h9: pos_low = 10'h339;
              4'ha: pos_low = 10'h33a;
              4'hb: pos_low = 10'h33b;
              4'hc: pos_low = 10'h33c;
              4'hd: pos_low = 10'h33d;
              4'he: pos_low = 10'h33e;
              4'hf: pos_low = 10'h33f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h34: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h340;
              4'h1: pos_low = 10'h341;
              4'h2: pos_low = 10'h342;
              4'h3: pos_low = 10'h343;
              4'h4: pos_low = 10'h344;
              4'h5: pos_low = 10'h345;
              4'h6: pos_low = 10'h346;
              4'h7: pos_low = 10'h347;
              4'h8: pos_low = 10'h348;
              4'h9: pos_low = 10'h349;
              4'ha: pos_low = 10'h34a;
              4'hb: pos_low = 10'h34b;
              4'hc: pos_low = 10'h34c;
              4'hd: pos_low = 10'h34d;
              4'he: pos_low = 10'h34e;
              4'hf: pos_low = 10'h34f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h35: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h350;
              4'h1: pos_low = 10'h351;
              4'h2: pos_low = 10'h352;
              4'h3: pos_low = 10'h353;
              4'h4: pos_low = 10'h354;
              4'h5: pos_low = 10'h355;
              4'h6: pos_low = 10'h356;
              4'h7: pos_low = 10'h357;
              4'h8: pos_low = 10'h358;
              4'h9: pos_low = 10'h359;
              4'ha: pos_low = 10'h35a;
              4'hb: pos_low = 10'h35b;
              4'hc: pos_low = 10'h35c;
              4'hd: pos_low = 10'h35d;
              4'he: pos_low = 10'h35e;
              4'hf: pos_low = 10'h35f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h36: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h360;
              4'h1: pos_low = 10'h361;
              4'h2: pos_low = 10'h362;
              4'h3: pos_low = 10'h363;
              4'h4: pos_low = 10'h364;
              4'h5: pos_low = 10'h365;
              4'h6: pos_low = 10'h366;
              4'h7: pos_low = 10'h367;
              4'h8: pos_low = 10'h368;
              4'h9: pos_low = 10'h369;
              4'ha: pos_low = 10'h36a;
              4'hb: pos_low = 10'h36b;
              4'hc: pos_low = 10'h36c;
              4'hd: pos_low = 10'h36d;
              4'he: pos_low = 10'h36e;
              4'hf: pos_low = 10'h36f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h37: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h370;
              4'h1: pos_low = 10'h371;
              4'h2: pos_low = 10'h372;
              4'h3: pos_low = 10'h373;
              4'h4: pos_low = 10'h374;
              4'h5: pos_low = 10'h375;
              4'h6: pos_low = 10'h376;
              4'h7: pos_low = 10'h377;
              4'h8: pos_low = 10'h378;
              4'h9: pos_low = 10'h379;
              4'ha: pos_low = 10'h37a;
              4'hb: pos_low = 10'h37b;
              4'hc: pos_low = 10'h37c;
              4'hd: pos_low = 10'h37d;
              4'he: pos_low = 10'h37e;
              4'hf: pos_low = 10'h37f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h38: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h380;
              4'h1: pos_low = 10'h381;
              4'h2: pos_low = 10'h382;
              4'h3: pos_low = 10'h383;
              4'h4: pos_low = 10'h384;
              4'h5: pos_low = 10'h385;
              4'h6: pos_low = 10'h386;
              4'h7: pos_low = 10'h387;
              4'h8: pos_low = 10'h388;
              4'h9: pos_low = 10'h389;
              4'ha: pos_low = 10'h38a;
              4'hb: pos_low = 10'h38b;
              4'hc: pos_low = 10'h38c;
              4'hd: pos_low = 10'h38d;
              4'he: pos_low = 10'h38e;
              4'hf: pos_low = 10'h38f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h39: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h390;
              4'h1: pos_low = 10'h391;
              4'h2: pos_low = 10'h392;
              4'h3: pos_low = 10'h393;
              4'h4: pos_low = 10'h394;
              4'h5: pos_low = 10'h395;
              4'h6: pos_low = 10'h396;
              4'h7: pos_low = 10'h397;
              4'h8: pos_low = 10'h398;
              4'h9: pos_low = 10'h399;
              4'ha: pos_low = 10'h39a;
              4'hb: pos_low = 10'h39b;
              4'hc: pos_low = 10'h39c;
              4'hd: pos_low = 10'h39d;
              4'he: pos_low = 10'h39e;
              4'hf: pos_low = 10'h39f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h3a: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3a0;
              4'h1: pos_low = 10'h3a1;
              4'h2: pos_low = 10'h3a2;
              4'h3: pos_low = 10'h3a3;
              4'h4: pos_low = 10'h3a4;
              4'h5: pos_low = 10'h3a5;
              4'h6: pos_low = 10'h3a6;
              4'h7: pos_low = 10'h3a7;
              4'h8: pos_low = 10'h3a8;
              4'h9: pos_low = 10'h3a9;
              4'ha: pos_low = 10'h3aa;
              4'hb: pos_low = 10'h3ab;
              4'hc: pos_low = 10'h3ac;
              4'hd: pos_low = 10'h3ad;
              4'he: pos_low = 10'h3ae;
              4'hf: pos_low = 10'h3af;
              default: pos_low = 10'h000;
            endcase
          end
          6'h3b: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3b0;
              4'h1: pos_low = 10'h3b1;
              4'h2: pos_low = 10'h3b2;
              4'h3: pos_low = 10'h3b3;
              4'h4: pos_low = 10'h3b4;
              4'h5: pos_low = 10'h3b5;
              4'h6: pos_low = 10'h3b6;
              4'h7: pos_low = 10'h3b7;
              4'h8: pos_low = 10'h3b8;
              4'h9: pos_low = 10'h3b9;
              4'ha: pos_low = 10'h3ba;
              4'hb: pos_low = 10'h3bb;
              4'hc: pos_low = 10'h3bc;
              4'hd: pos_low = 10'h3bd;
              4'he: pos_low = 10'h3be;
              4'hf: pos_low = 10'h3bf;
              default: pos_low = 10'h000;
            endcase
          end
          6'h3c: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3c0;
              4'h1: pos_low = 10'h3c1;
              4'h2: pos_low = 10'h3c2;
              4'h3: pos_low = 10'h3c3;
              4'h4: pos_low = 10'h3c4;
              4'h5: pos_low = 10'h3c5;
              4'h6: pos_low = 10'h3c6;
              4'h7: pos_low = 10'h3c7;
              4'h8: pos_low = 10'h3c8;
              4'h9: pos_low = 10'h3c9;
              4'ha: pos_low = 10'h3ca;
              4'hb: pos_low = 10'h3cb;
              4'hc: pos_low = 10'h3cc;
              4'hd: pos_low = 10'h3cd;
              4'he: pos_low = 10'h3ce;
              4'hf: pos_low = 10'h3cf;
              default: pos_low = 10'h000;
            endcase
          end
          6'h3d: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3d0;
              4'h1: pos_low = 10'h3d1;
              4'h2: pos_low = 10'h3d2;
              4'h3: pos_low = 10'h3d3;
              4'h4: pos_low = 10'h3d4;
              4'h5: pos_low = 10'h3d5;
              4'h6: pos_low = 10'h3d6;
              4'h7: pos_low = 10'h3d7;
              4'h8: pos_low = 10'h3d8;
              4'h9: pos_low = 10'h3d9;
              4'ha: pos_low = 10'h3da;
              4'hb: pos_low = 10'h3db;
              4'hc: pos_low = 10'h3dc;
              4'hd: pos_low = 10'h3dd;
              4'he: pos_low = 10'h3de;
              4'hf: pos_low = 10'h3df;
              default: pos_low = 10'h000;
            endcase
          end
          6'h3e: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3e0;
              4'h1: pos_low = 10'h3e1;
              4'h2: pos_low = 10'h3e2;
              4'h3: pos_low = 10'h3e3;
              4'h4: pos_low = 10'h3e4;
              4'h5: pos_low = 10'h3e5;
              4'h6: pos_low = 10'h3e6;
              4'h7: pos_low = 10'h3e7;
              4'h8: pos_low = 10'h3e8;
              4'h9: pos_low = 10'h3e9;
              4'ha: pos_low = 10'h3ea;
              4'hb: pos_low = 10'h3eb;
              4'hc: pos_low = 10'h3ec;
              4'hd: pos_low = 10'h3ed;
              4'he: pos_low = 10'h3ee;
              4'hf: pos_low = 10'h3ef;
              default: pos_low = 10'h000;
            endcase
          end
          6'h3f: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3f0;
              4'h1: pos_low = 10'h3f1;
              4'h2: pos_low = 10'h3f2;
              4'h3: pos_low = 10'h3f3;
              4'h4: pos_low = 10'h3f4;
              4'h5: pos_low = 10'h3f5;
              4'h6: pos_low = 10'h3f6;
              4'h7: pos_low = 10'h3f7;
              4'h8: pos_low = 10'h3f8;
              4'h9: pos_low = 10'h3f9;
              4'ha: pos_low = 10'h3fa;
              4'hb: pos_low = 10'h3fb;
              4'hc: pos_low = 10'h3fc;
              4'hd: pos_low = 10'h3fd;
              4'he: pos_low = 10'h3fe;
              4'hf: pos_low = 10'h3ff;
              default: pos_low = 10'h000;
            endcase
          end
          default: begin end
        endcase
      end
      5'h04: begin
        case (mant[9:4])
          6'h00: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h000;
              4'h1: pos_low = 10'h001;
              4'h2: pos_low = 10'h002;
              4'h3: pos_low = 10'h003;
              4'h4: pos_low = 10'h004;
              4'h5: pos_low = 10'h005;
              4'h6: pos_low = 10'h006;
              4'h7: pos_low = 10'h007;
              4'h8: pos_low = 10'h008;
              4'h9: pos_low = 10'h009;
              4'ha: pos_low = 10'h00a;
              4'hb: pos_low = 10'h00b;
              4'hc: pos_low = 10'h00c;
              4'hd: pos_low = 10'h00d;
              4'he: pos_low = 10'h00e;
              4'hf: pos_low = 10'h00f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h01: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h010;
              4'h1: pos_low = 10'h011;
              4'h2: pos_low = 10'h012;
              4'h3: pos_low = 10'h013;
              4'h4: pos_low = 10'h014;
              4'h5: pos_low = 10'h015;
              4'h6: pos_low = 10'h016;
              4'h7: pos_low = 10'h017;
              4'h8: pos_low = 10'h018;
              4'h9: pos_low = 10'h019;
              4'ha: pos_low = 10'h01a;
              4'hb: pos_low = 10'h01b;
              4'hc: pos_low = 10'h01c;
              4'hd: pos_low = 10'h01d;
              4'he: pos_low = 10'h01e;
              4'hf: pos_low = 10'h01f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h02: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h020;
              4'h1: pos_low = 10'h021;
              4'h2: pos_low = 10'h022;
              4'h3: pos_low = 10'h023;
              4'h4: pos_low = 10'h024;
              4'h5: pos_low = 10'h025;
              4'h6: pos_low = 10'h026;
              4'h7: pos_low = 10'h027;
              4'h8: pos_low = 10'h028;
              4'h9: pos_low = 10'h029;
              4'ha: pos_low = 10'h02a;
              4'hb: pos_low = 10'h02b;
              4'hc: pos_low = 10'h02c;
              4'hd: pos_low = 10'h02d;
              4'he: pos_low = 10'h02e;
              4'hf: pos_low = 10'h02f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h03: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h030;
              4'h1: pos_low = 10'h031;
              4'h2: pos_low = 10'h032;
              4'h3: pos_low = 10'h033;
              4'h4: pos_low = 10'h034;
              4'h5: pos_low = 10'h035;
              4'h6: pos_low = 10'h036;
              4'h7: pos_low = 10'h037;
              4'h8: pos_low = 10'h038;
              4'h9: pos_low = 10'h039;
              4'ha: pos_low = 10'h03a;
              4'hb: pos_low = 10'h03b;
              4'hc: pos_low = 10'h03c;
              4'hd: pos_low = 10'h03d;
              4'he: pos_low = 10'h03e;
              4'hf: pos_low = 10'h03f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h04: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h040;
              4'h1: pos_low = 10'h041;
              4'h2: pos_low = 10'h042;
              4'h3: pos_low = 10'h043;
              4'h4: pos_low = 10'h044;
              4'h5: pos_low = 10'h045;
              4'h6: pos_low = 10'h046;
              4'h7: pos_low = 10'h047;
              4'h8: pos_low = 10'h048;
              4'h9: pos_low = 10'h049;
              4'ha: pos_low = 10'h04a;
              4'hb: pos_low = 10'h04b;
              4'hc: pos_low = 10'h04c;
              4'hd: pos_low = 10'h04d;
              4'he: pos_low = 10'h04e;
              4'hf: pos_low = 10'h04f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h05: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h050;
              4'h1: pos_low = 10'h051;
              4'h2: pos_low = 10'h052;
              4'h3: pos_low = 10'h053;
              4'h4: pos_low = 10'h054;
              4'h5: pos_low = 10'h055;
              4'h6: pos_low = 10'h056;
              4'h7: pos_low = 10'h057;
              4'h8: pos_low = 10'h058;
              4'h9: pos_low = 10'h059;
              4'ha: pos_low = 10'h05a;
              4'hb: pos_low = 10'h05b;
              4'hc: pos_low = 10'h05c;
              4'hd: pos_low = 10'h05d;
              4'he: pos_low = 10'h05e;
              4'hf: pos_low = 10'h05f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h06: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h060;
              4'h1: pos_low = 10'h061;
              4'h2: pos_low = 10'h062;
              4'h3: pos_low = 10'h063;
              4'h4: pos_low = 10'h064;
              4'h5: pos_low = 10'h065;
              4'h6: pos_low = 10'h066;
              4'h7: pos_low = 10'h067;
              4'h8: pos_low = 10'h068;
              4'h9: pos_low = 10'h069;
              4'ha: pos_low = 10'h06a;
              4'hb: pos_low = 10'h06b;
              4'hc: pos_low = 10'h06c;
              4'hd: pos_low = 10'h06d;
              4'he: pos_low = 10'h06e;
              4'hf: pos_low = 10'h06f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h07: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h070;
              4'h1: pos_low = 10'h071;
              4'h2: pos_low = 10'h072;
              4'h3: pos_low = 10'h073;
              4'h4: pos_low = 10'h074;
              4'h5: pos_low = 10'h075;
              4'h6: pos_low = 10'h076;
              4'h7: pos_low = 10'h077;
              4'h8: pos_low = 10'h078;
              4'h9: pos_low = 10'h079;
              4'ha: pos_low = 10'h07a;
              4'hb: pos_low = 10'h07b;
              4'hc: pos_low = 10'h07c;
              4'hd: pos_low = 10'h07d;
              4'he: pos_low = 10'h07e;
              4'hf: pos_low = 10'h07f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h08: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h080;
              4'h1: pos_low = 10'h081;
              4'h2: pos_low = 10'h082;
              4'h3: pos_low = 10'h083;
              4'h4: pos_low = 10'h084;
              4'h5: pos_low = 10'h085;
              4'h6: pos_low = 10'h086;
              4'h7: pos_low = 10'h087;
              4'h8: pos_low = 10'h088;
              4'h9: pos_low = 10'h089;
              4'ha: pos_low = 10'h08a;
              4'hb: pos_low = 10'h08b;
              4'hc: pos_low = 10'h08c;
              4'hd: pos_low = 10'h08d;
              4'he: pos_low = 10'h08e;
              4'hf: pos_low = 10'h08f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h09: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h090;
              4'h1: pos_low = 10'h091;
              4'h2: pos_low = 10'h092;
              4'h3: pos_low = 10'h093;
              4'h4: pos_low = 10'h094;
              4'h5: pos_low = 10'h095;
              4'h6: pos_low = 10'h096;
              4'h7: pos_low = 10'h097;
              4'h8: pos_low = 10'h098;
              4'h9: pos_low = 10'h099;
              4'ha: pos_low = 10'h09a;
              4'hb: pos_low = 10'h09b;
              4'hc: pos_low = 10'h09c;
              4'hd: pos_low = 10'h09d;
              4'he: pos_low = 10'h09e;
              4'hf: pos_low = 10'h09f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h0a: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h0a0;
              4'h1: pos_low = 10'h0a1;
              4'h2: pos_low = 10'h0a2;
              4'h3: pos_low = 10'h0a3;
              4'h4: pos_low = 10'h0a4;
              4'h5: pos_low = 10'h0a5;
              4'h6: pos_low = 10'h0a6;
              4'h7: pos_low = 10'h0a7;
              4'h8: pos_low = 10'h0a8;
              4'h9: pos_low = 10'h0a9;
              4'ha: pos_low = 10'h0aa;
              4'hb: pos_low = 10'h0ab;
              4'hc: pos_low = 10'h0ac;
              4'hd: pos_low = 10'h0ad;
              4'he: pos_low = 10'h0ae;
              4'hf: pos_low = 10'h0af;
              default: pos_low = 10'h000;
            endcase
          end
          6'h0b: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h0b0;
              4'h1: pos_low = 10'h0b1;
              4'h2: pos_low = 10'h0b2;
              4'h3: pos_low = 10'h0b3;
              4'h4: pos_low = 10'h0b4;
              4'h5: pos_low = 10'h0b5;
              4'h6: pos_low = 10'h0b6;
              4'h7: pos_low = 10'h0b7;
              4'h8: pos_low = 10'h0b8;
              4'h9: pos_low = 10'h0b9;
              4'ha: pos_low = 10'h0ba;
              4'hb: pos_low = 10'h0bb;
              4'hc: pos_low = 10'h0bc;
              4'hd: pos_low = 10'h0bd;
              4'he: pos_low = 10'h0be;
              4'hf: pos_low = 10'h0bf;
              default: pos_low = 10'h000;
            endcase
          end
          6'h0c: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h0c0;
              4'h1: pos_low = 10'h0c1;
              4'h2: pos_low = 10'h0c2;
              4'h3: pos_low = 10'h0c3;
              4'h4: pos_low = 10'h0c4;
              4'h5: pos_low = 10'h0c5;
              4'h6: pos_low = 10'h0c6;
              4'h7: pos_low = 10'h0c7;
              4'h8: pos_low = 10'h0c8;
              4'h9: pos_low = 10'h0c9;
              4'ha: pos_low = 10'h0ca;
              4'hb: pos_low = 10'h0cb;
              4'hc: pos_low = 10'h0cc;
              4'hd: pos_low = 10'h0cd;
              4'he: pos_low = 10'h0ce;
              4'hf: pos_low = 10'h0cf;
              default: pos_low = 10'h000;
            endcase
          end
          6'h0d: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h0d0;
              4'h1: pos_low = 10'h0d1;
              4'h2: pos_low = 10'h0d2;
              4'h3: pos_low = 10'h0d3;
              4'h4: pos_low = 10'h0d4;
              4'h5: pos_low = 10'h0d5;
              4'h6: pos_low = 10'h0d6;
              4'h7: pos_low = 10'h0d7;
              4'h8: pos_low = 10'h0d8;
              4'h9: pos_low = 10'h0d9;
              4'ha: pos_low = 10'h0da;
              4'hb: pos_low = 10'h0db;
              4'hc: pos_low = 10'h0dc;
              4'hd: pos_low = 10'h0dd;
              4'he: pos_low = 10'h0de;
              4'hf: pos_low = 10'h0df;
              default: pos_low = 10'h000;
            endcase
          end
          6'h0e: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h0e0;
              4'h1: pos_low = 10'h0e1;
              4'h2: pos_low = 10'h0e2;
              4'h3: pos_low = 10'h0e3;
              4'h4: pos_low = 10'h0e4;
              4'h5: pos_low = 10'h0e5;
              4'h6: pos_low = 10'h0e6;
              4'h7: pos_low = 10'h0e7;
              4'h8: pos_low = 10'h0e8;
              4'h9: pos_low = 10'h0e9;
              4'ha: pos_low = 10'h0ea;
              4'hb: pos_low = 10'h0eb;
              4'hc: pos_low = 10'h0ec;
              4'hd: pos_low = 10'h0ed;
              4'he: pos_low = 10'h0ee;
              4'hf: pos_low = 10'h0ef;
              default: pos_low = 10'h000;
            endcase
          end
          6'h0f: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h0f0;
              4'h1: pos_low = 10'h0f1;
              4'h2: pos_low = 10'h0f2;
              4'h3: pos_low = 10'h0f3;
              4'h4: pos_low = 10'h0f4;
              4'h5: pos_low = 10'h0f5;
              4'h6: pos_low = 10'h0f6;
              4'h7: pos_low = 10'h0f7;
              4'h8: pos_low = 10'h0f8;
              4'h9: pos_low = 10'h0f9;
              4'ha: pos_low = 10'h0fa;
              4'hb: pos_low = 10'h0fb;
              4'hc: pos_low = 10'h0fc;
              4'hd: pos_low = 10'h0fd;
              4'he: pos_low = 10'h0fe;
              4'hf: pos_low = 10'h0ff;
              default: pos_low = 10'h000;
            endcase
          end
          6'h10: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h100;
              4'h1: pos_low = 10'h101;
              4'h2: pos_low = 10'h102;
              4'h3: pos_low = 10'h103;
              4'h4: pos_low = 10'h104;
              4'h5: pos_low = 10'h105;
              4'h6: pos_low = 10'h106;
              4'h7: pos_low = 10'h107;
              4'h8: pos_low = 10'h108;
              4'h9: pos_low = 10'h109;
              4'ha: pos_low = 10'h10a;
              4'hb: pos_low = 10'h10b;
              4'hc: pos_low = 10'h10c;
              4'hd: pos_low = 10'h10d;
              4'he: pos_low = 10'h10e;
              4'hf: pos_low = 10'h10f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h11: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h110;
              4'h1: pos_low = 10'h111;
              4'h2: pos_low = 10'h112;
              4'h3: pos_low = 10'h113;
              4'h4: pos_low = 10'h114;
              4'h5: pos_low = 10'h115;
              4'h6: pos_low = 10'h116;
              4'h7: pos_low = 10'h117;
              4'h8: pos_low = 10'h118;
              4'h9: pos_low = 10'h119;
              4'ha: pos_low = 10'h11a;
              4'hb: pos_low = 10'h11b;
              4'hc: pos_low = 10'h11c;
              4'hd: pos_low = 10'h11d;
              4'he: pos_low = 10'h11e;
              4'hf: pos_low = 10'h11f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h12: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h120;
              4'h1: pos_low = 10'h121;
              4'h2: pos_low = 10'h122;
              4'h3: pos_low = 10'h123;
              4'h4: pos_low = 10'h124;
              4'h5: pos_low = 10'h125;
              4'h6: pos_low = 10'h126;
              4'h7: pos_low = 10'h127;
              4'h8: pos_low = 10'h128;
              4'h9: pos_low = 10'h129;
              4'ha: pos_low = 10'h12a;
              4'hb: pos_low = 10'h12b;
              4'hc: pos_low = 10'h12c;
              4'hd: pos_low = 10'h12d;
              4'he: pos_low = 10'h12e;
              4'hf: pos_low = 10'h12f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h13: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h130;
              4'h1: pos_low = 10'h131;
              4'h2: pos_low = 10'h132;
              4'h3: pos_low = 10'h133;
              4'h4: pos_low = 10'h134;
              4'h5: pos_low = 10'h135;
              4'h6: pos_low = 10'h136;
              4'h7: pos_low = 10'h137;
              4'h8: pos_low = 10'h138;
              4'h9: pos_low = 10'h139;
              4'ha: pos_low = 10'h13a;
              4'hb: pos_low = 10'h13b;
              4'hc: pos_low = 10'h13c;
              4'hd: pos_low = 10'h13d;
              4'he: pos_low = 10'h13e;
              4'hf: pos_low = 10'h13f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h14: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h140;
              4'h1: pos_low = 10'h141;
              4'h2: pos_low = 10'h142;
              4'h3: pos_low = 10'h143;
              4'h4: pos_low = 10'h144;
              4'h5: pos_low = 10'h145;
              4'h6: pos_low = 10'h146;
              4'h7: pos_low = 10'h147;
              4'h8: pos_low = 10'h148;
              4'h9: pos_low = 10'h149;
              4'ha: pos_low = 10'h14a;
              4'hb: pos_low = 10'h14b;
              4'hc: pos_low = 10'h14c;
              4'hd: pos_low = 10'h14d;
              4'he: pos_low = 10'h14e;
              4'hf: pos_low = 10'h14f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h15: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h150;
              4'h1: pos_low = 10'h151;
              4'h2: pos_low = 10'h152;
              4'h3: pos_low = 10'h153;
              4'h4: pos_low = 10'h154;
              4'h5: pos_low = 10'h155;
              4'h6: pos_low = 10'h156;
              4'h7: pos_low = 10'h157;
              4'h8: pos_low = 10'h158;
              4'h9: pos_low = 10'h159;
              4'ha: pos_low = 10'h15a;
              4'hb: pos_low = 10'h15b;
              4'hc: pos_low = 10'h15c;
              4'hd: pos_low = 10'h15d;
              4'he: pos_low = 10'h15e;
              4'hf: pos_low = 10'h15f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h16: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h160;
              4'h1: pos_low = 10'h161;
              4'h2: pos_low = 10'h162;
              4'h3: pos_low = 10'h163;
              4'h4: pos_low = 10'h164;
              4'h5: pos_low = 10'h165;
              4'h6: pos_low = 10'h166;
              4'h7: pos_low = 10'h167;
              4'h8: pos_low = 10'h168;
              4'h9: pos_low = 10'h169;
              4'ha: pos_low = 10'h16a;
              4'hb: pos_low = 10'h16b;
              4'hc: pos_low = 10'h16c;
              4'hd: pos_low = 10'h16d;
              4'he: pos_low = 10'h16e;
              4'hf: pos_low = 10'h16f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h17: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h170;
              4'h1: pos_low = 10'h171;
              4'h2: pos_low = 10'h172;
              4'h3: pos_low = 10'h173;
              4'h4: pos_low = 10'h174;
              4'h5: pos_low = 10'h175;
              4'h6: pos_low = 10'h176;
              4'h7: pos_low = 10'h177;
              4'h8: pos_low = 10'h178;
              4'h9: pos_low = 10'h179;
              4'ha: pos_low = 10'h17a;
              4'hb: pos_low = 10'h17b;
              4'hc: pos_low = 10'h17c;
              4'hd: pos_low = 10'h17d;
              4'he: pos_low = 10'h17e;
              4'hf: pos_low = 10'h17f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h18: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h180;
              4'h1: pos_low = 10'h181;
              4'h2: pos_low = 10'h182;
              4'h3: pos_low = 10'h183;
              4'h4: pos_low = 10'h184;
              4'h5: pos_low = 10'h185;
              4'h6: pos_low = 10'h186;
              4'h7: pos_low = 10'h187;
              4'h8: pos_low = 10'h188;
              4'h9: pos_low = 10'h189;
              4'ha: pos_low = 10'h18a;
              4'hb: pos_low = 10'h18b;
              4'hc: pos_low = 10'h18c;
              4'hd: pos_low = 10'h18d;
              4'he: pos_low = 10'h18e;
              4'hf: pos_low = 10'h18f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h19: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h190;
              4'h1: pos_low = 10'h191;
              4'h2: pos_low = 10'h192;
              4'h3: pos_low = 10'h193;
              4'h4: pos_low = 10'h194;
              4'h5: pos_low = 10'h195;
              4'h6: pos_low = 10'h196;
              4'h7: pos_low = 10'h197;
              4'h8: pos_low = 10'h198;
              4'h9: pos_low = 10'h199;
              4'ha: pos_low = 10'h19a;
              4'hb: pos_low = 10'h19b;
              4'hc: pos_low = 10'h19c;
              4'hd: pos_low = 10'h19d;
              4'he: pos_low = 10'h19e;
              4'hf: pos_low = 10'h19f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h1a: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h1a0;
              4'h1: pos_low = 10'h1a1;
              4'h2: pos_low = 10'h1a2;
              4'h3: pos_low = 10'h1a3;
              4'h4: pos_low = 10'h1a4;
              4'h5: pos_low = 10'h1a5;
              4'h6: pos_low = 10'h1a6;
              4'h7: pos_low = 10'h1a7;
              4'h8: pos_low = 10'h1a8;
              4'h9: pos_low = 10'h1a9;
              4'ha: pos_low = 10'h1aa;
              4'hb: pos_low = 10'h1ab;
              4'hc: pos_low = 10'h1ac;
              4'hd: pos_low = 10'h1ad;
              4'he: pos_low = 10'h1ae;
              4'hf: pos_low = 10'h1af;
              default: pos_low = 10'h000;
            endcase
          end
          6'h1b: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h1b0;
              4'h1: pos_low = 10'h1b1;
              4'h2: pos_low = 10'h1b2;
              4'h3: pos_low = 10'h1b3;
              4'h4: pos_low = 10'h1b4;
              4'h5: pos_low = 10'h1b5;
              4'h6: pos_low = 10'h1b6;
              4'h7: pos_low = 10'h1b7;
              4'h8: pos_low = 10'h1b8;
              4'h9: pos_low = 10'h1b9;
              4'ha: pos_low = 10'h1ba;
              4'hb: pos_low = 10'h1bb;
              4'hc: pos_low = 10'h1bc;
              4'hd: pos_low = 10'h1bd;
              4'he: pos_low = 10'h1be;
              4'hf: pos_low = 10'h1bf;
              default: pos_low = 10'h000;
            endcase
          end
          6'h1c: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h1c0;
              4'h1: pos_low = 10'h1c1;
              4'h2: pos_low = 10'h1c2;
              4'h3: pos_low = 10'h1c3;
              4'h4: pos_low = 10'h1c4;
              4'h5: pos_low = 10'h1c5;
              4'h6: pos_low = 10'h1c6;
              4'h7: pos_low = 10'h1c7;
              4'h8: pos_low = 10'h1c8;
              4'h9: pos_low = 10'h1c9;
              4'ha: pos_low = 10'h1ca;
              4'hb: pos_low = 10'h1cb;
              4'hc: pos_low = 10'h1cc;
              4'hd: pos_low = 10'h1cd;
              4'he: pos_low = 10'h1ce;
              4'hf: pos_low = 10'h1cf;
              default: pos_low = 10'h000;
            endcase
          end
          6'h1d: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h1d0;
              4'h1: pos_low = 10'h1d1;
              4'h2: pos_low = 10'h1d2;
              4'h3: pos_low = 10'h1d3;
              4'h4: pos_low = 10'h1d4;
              4'h5: pos_low = 10'h1d5;
              4'h6: pos_low = 10'h1d6;
              4'h7: pos_low = 10'h1d7;
              4'h8: pos_low = 10'h1d8;
              4'h9: pos_low = 10'h1d9;
              4'ha: pos_low = 10'h1da;
              4'hb: pos_low = 10'h1db;
              4'hc: pos_low = 10'h1dc;
              4'hd: pos_low = 10'h1dd;
              4'he: pos_low = 10'h1de;
              4'hf: pos_low = 10'h1df;
              default: pos_low = 10'h000;
            endcase
          end
          6'h1e: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h1e0;
              4'h1: pos_low = 10'h1e1;
              4'h2: pos_low = 10'h1e2;
              4'h3: pos_low = 10'h1e3;
              4'h4: pos_low = 10'h1e4;
              4'h5: pos_low = 10'h1e5;
              4'h6: pos_low = 10'h1e6;
              4'h7: pos_low = 10'h1e7;
              4'h8: pos_low = 10'h1e8;
              4'h9: pos_low = 10'h1e9;
              4'ha: pos_low = 10'h1ea;
              4'hb: pos_low = 10'h1eb;
              4'hc: pos_low = 10'h1ec;
              4'hd: pos_low = 10'h1ed;
              4'he: pos_low = 10'h1ee;
              4'hf: pos_low = 10'h1ef;
              default: pos_low = 10'h000;
            endcase
          end
          6'h1f: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h1f0;
              4'h1: pos_low = 10'h1f1;
              4'h2: pos_low = 10'h1f2;
              4'h3: pos_low = 10'h1f3;
              4'h4: pos_low = 10'h1f4;
              4'h5: pos_low = 10'h1f5;
              4'h6: pos_low = 10'h1f6;
              4'h7: pos_low = 10'h1f7;
              4'h8: pos_low = 10'h1f8;
              4'h9: pos_low = 10'h1f9;
              4'ha: pos_low = 10'h1fa;
              4'hb: pos_low = 10'h1fb;
              4'hc: pos_low = 10'h1fc;
              4'hd: pos_low = 10'h1fd;
              4'he: pos_low = 10'h1fe;
              4'hf: pos_low = 10'h1ff;
              default: pos_low = 10'h000;
            endcase
          end
          6'h20: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h200;
              4'h1: pos_low = 10'h201;
              4'h2: pos_low = 10'h202;
              4'h3: pos_low = 10'h203;
              4'h4: pos_low = 10'h204;
              4'h5: pos_low = 10'h205;
              4'h6: pos_low = 10'h206;
              4'h7: pos_low = 10'h207;
              4'h8: pos_low = 10'h208;
              4'h9: pos_low = 10'h209;
              4'ha: pos_low = 10'h20a;
              4'hb: pos_low = 10'h20b;
              4'hc: pos_low = 10'h20c;
              4'hd: pos_low = 10'h20d;
              4'he: pos_low = 10'h20e;
              4'hf: pos_low = 10'h20f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h21: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h210;
              4'h1: pos_low = 10'h211;
              4'h2: pos_low = 10'h212;
              4'h3: pos_low = 10'h213;
              4'h4: pos_low = 10'h214;
              4'h5: pos_low = 10'h215;
              4'h6: pos_low = 10'h216;
              4'h7: pos_low = 10'h217;
              4'h8: pos_low = 10'h218;
              4'h9: pos_low = 10'h219;
              4'ha: pos_low = 10'h21a;
              4'hb: pos_low = 10'h21b;
              4'hc: pos_low = 10'h21c;
              4'hd: pos_low = 10'h21d;
              4'he: pos_low = 10'h21e;
              4'hf: pos_low = 10'h21f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h22: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h220;
              4'h1: pos_low = 10'h221;
              4'h2: pos_low = 10'h222;
              4'h3: pos_low = 10'h223;
              4'h4: pos_low = 10'h224;
              4'h5: pos_low = 10'h225;
              4'h6: pos_low = 10'h226;
              4'h7: pos_low = 10'h227;
              4'h8: pos_low = 10'h228;
              4'h9: pos_low = 10'h229;
              4'ha: pos_low = 10'h22a;
              4'hb: pos_low = 10'h22b;
              4'hc: pos_low = 10'h22c;
              4'hd: pos_low = 10'h22d;
              4'he: pos_low = 10'h22e;
              4'hf: pos_low = 10'h22f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h23: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h230;
              4'h1: pos_low = 10'h231;
              4'h2: pos_low = 10'h232;
              4'h3: pos_low = 10'h233;
              4'h4: pos_low = 10'h234;
              4'h5: pos_low = 10'h235;
              4'h6: pos_low = 10'h236;
              4'h7: pos_low = 10'h237;
              4'h8: pos_low = 10'h238;
              4'h9: pos_low = 10'h239;
              4'ha: pos_low = 10'h23a;
              4'hb: pos_low = 10'h23b;
              4'hc: pos_low = 10'h23c;
              4'hd: pos_low = 10'h23d;
              4'he: pos_low = 10'h23e;
              4'hf: pos_low = 10'h23f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h24: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h240;
              4'h1: pos_low = 10'h241;
              4'h2: pos_low = 10'h242;
              4'h3: pos_low = 10'h243;
              4'h4: pos_low = 10'h244;
              4'h5: pos_low = 10'h245;
              4'h6: pos_low = 10'h246;
              4'h7: pos_low = 10'h247;
              4'h8: pos_low = 10'h248;
              4'h9: pos_low = 10'h249;
              4'ha: pos_low = 10'h24a;
              4'hb: pos_low = 10'h24b;
              4'hc: pos_low = 10'h24c;
              4'hd: pos_low = 10'h24d;
              4'he: pos_low = 10'h24e;
              4'hf: pos_low = 10'h24f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h25: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h250;
              4'h1: pos_low = 10'h251;
              4'h2: pos_low = 10'h252;
              4'h3: pos_low = 10'h253;
              4'h4: pos_low = 10'h254;
              4'h5: pos_low = 10'h255;
              4'h6: pos_low = 10'h256;
              4'h7: pos_low = 10'h257;
              4'h8: pos_low = 10'h258;
              4'h9: pos_low = 10'h259;
              4'ha: pos_low = 10'h25a;
              4'hb: pos_low = 10'h25b;
              4'hc: pos_low = 10'h25c;
              4'hd: pos_low = 10'h25d;
              4'he: pos_low = 10'h25e;
              4'hf: pos_low = 10'h25f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h26: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h260;
              4'h1: pos_low = 10'h261;
              4'h2: pos_low = 10'h262;
              4'h3: pos_low = 10'h263;
              4'h4: pos_low = 10'h264;
              4'h5: pos_low = 10'h265;
              4'h6: pos_low = 10'h266;
              4'h7: pos_low = 10'h267;
              4'h8: pos_low = 10'h268;
              4'h9: pos_low = 10'h269;
              4'ha: pos_low = 10'h26a;
              4'hb: pos_low = 10'h26b;
              4'hc: pos_low = 10'h26c;
              4'hd: pos_low = 10'h26d;
              4'he: pos_low = 10'h26e;
              4'hf: pos_low = 10'h26f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h27: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h270;
              4'h1: pos_low = 10'h271;
              4'h2: pos_low = 10'h272;
              4'h3: pos_low = 10'h273;
              4'h4: pos_low = 10'h274;
              4'h5: pos_low = 10'h275;
              4'h6: pos_low = 10'h276;
              4'h7: pos_low = 10'h277;
              4'h8: pos_low = 10'h278;
              4'h9: pos_low = 10'h279;
              4'ha: pos_low = 10'h27a;
              4'hb: pos_low = 10'h27b;
              4'hc: pos_low = 10'h27c;
              4'hd: pos_low = 10'h27d;
              4'he: pos_low = 10'h27e;
              4'hf: pos_low = 10'h27f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h28: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h280;
              4'h1: pos_low = 10'h281;
              4'h2: pos_low = 10'h282;
              4'h3: pos_low = 10'h283;
              4'h4: pos_low = 10'h284;
              4'h5: pos_low = 10'h285;
              4'h6: pos_low = 10'h286;
              4'h7: pos_low = 10'h287;
              4'h8: pos_low = 10'h288;
              4'h9: pos_low = 10'h289;
              4'ha: pos_low = 10'h28a;
              4'hb: pos_low = 10'h28b;
              4'hc: pos_low = 10'h28c;
              4'hd: pos_low = 10'h28d;
              4'he: pos_low = 10'h28e;
              4'hf: pos_low = 10'h28f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h29: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h290;
              4'h1: pos_low = 10'h291;
              4'h2: pos_low = 10'h292;
              4'h3: pos_low = 10'h293;
              4'h4: pos_low = 10'h294;
              4'h5: pos_low = 10'h295;
              4'h6: pos_low = 10'h296;
              4'h7: pos_low = 10'h297;
              4'h8: pos_low = 10'h298;
              4'h9: pos_low = 10'h299;
              4'ha: pos_low = 10'h29a;
              4'hb: pos_low = 10'h29b;
              4'hc: pos_low = 10'h29c;
              4'hd: pos_low = 10'h29d;
              4'he: pos_low = 10'h29e;
              4'hf: pos_low = 10'h29f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h2a: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h2a0;
              4'h1: pos_low = 10'h2a1;
              4'h2: pos_low = 10'h2a2;
              4'h3: pos_low = 10'h2a3;
              4'h4: pos_low = 10'h2a4;
              4'h5: pos_low = 10'h2a5;
              4'h6: pos_low = 10'h2a6;
              4'h7: pos_low = 10'h2a7;
              4'h8: pos_low = 10'h2a8;
              4'h9: pos_low = 10'h2a9;
              4'ha: pos_low = 10'h2aa;
              4'hb: pos_low = 10'h2ab;
              4'hc: pos_low = 10'h2ac;
              4'hd: pos_low = 10'h2ad;
              4'he: pos_low = 10'h2ae;
              4'hf: pos_low = 10'h2af;
              default: pos_low = 10'h000;
            endcase
          end
          6'h2b: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h2b0;
              4'h1: pos_low = 10'h2b1;
              4'h2: pos_low = 10'h2b2;
              4'h3: pos_low = 10'h2b3;
              4'h4: pos_low = 10'h2b4;
              4'h5: pos_low = 10'h2b5;
              4'h6: pos_low = 10'h2b6;
              4'h7: pos_low = 10'h2b7;
              4'h8: pos_low = 10'h2b8;
              4'h9: pos_low = 10'h2b9;
              4'ha: pos_low = 10'h2ba;
              4'hb: pos_low = 10'h2bb;
              4'hc: pos_low = 10'h2bc;
              4'hd: pos_low = 10'h2bd;
              4'he: pos_low = 10'h2be;
              4'hf: pos_low = 10'h2bf;
              default: pos_low = 10'h000;
            endcase
          end
          6'h2c: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h2c0;
              4'h1: pos_low = 10'h2c1;
              4'h2: pos_low = 10'h2c2;
              4'h3: pos_low = 10'h2c3;
              4'h4: pos_low = 10'h2c4;
              4'h5: pos_low = 10'h2c5;
              4'h6: pos_low = 10'h2c6;
              4'h7: pos_low = 10'h2c7;
              4'h8: pos_low = 10'h2c8;
              4'h9: pos_low = 10'h2c9;
              4'ha: pos_low = 10'h2ca;
              4'hb: pos_low = 10'h2cb;
              4'hc: pos_low = 10'h2cc;
              4'hd: pos_low = 10'h2cd;
              4'he: pos_low = 10'h2ce;
              4'hf: pos_low = 10'h2cf;
              default: pos_low = 10'h000;
            endcase
          end
          6'h2d: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h2d0;
              4'h1: pos_low = 10'h2d1;
              4'h2: pos_low = 10'h2d2;
              4'h3: pos_low = 10'h2d3;
              4'h4: pos_low = 10'h2d4;
              4'h5: pos_low = 10'h2d5;
              4'h6: pos_low = 10'h2d6;
              4'h7: pos_low = 10'h2d7;
              4'h8: pos_low = 10'h2d8;
              4'h9: pos_low = 10'h2d9;
              4'ha: pos_low = 10'h2da;
              4'hb: pos_low = 10'h2db;
              4'hc: pos_low = 10'h2dc;
              4'hd: pos_low = 10'h2dd;
              4'he: pos_low = 10'h2de;
              4'hf: pos_low = 10'h2df;
              default: pos_low = 10'h000;
            endcase
          end
          6'h2e: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h2e0;
              4'h1: pos_low = 10'h2e1;
              4'h2: pos_low = 10'h2e2;
              4'h3: pos_low = 10'h2e3;
              4'h4: pos_low = 10'h2e4;
              4'h5: pos_low = 10'h2e5;
              4'h6: pos_low = 10'h2e6;
              4'h7: pos_low = 10'h2e7;
              4'h8: pos_low = 10'h2e8;
              4'h9: pos_low = 10'h2e9;
              4'ha: pos_low = 10'h2ea;
              4'hb: pos_low = 10'h2eb;
              4'hc: pos_low = 10'h2ec;
              4'hd: pos_low = 10'h2ed;
              4'he: pos_low = 10'h2ee;
              4'hf: pos_low = 10'h2ef;
              default: pos_low = 10'h000;
            endcase
          end
          6'h2f: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h2f0;
              4'h1: pos_low = 10'h2f1;
              4'h2: pos_low = 10'h2f2;
              4'h3: pos_low = 10'h2f3;
              4'h4: pos_low = 10'h2f4;
              4'h5: pos_low = 10'h2f5;
              4'h6: pos_low = 10'h2f6;
              4'h7: pos_low = 10'h2f7;
              4'h8: pos_low = 10'h2f8;
              4'h9: pos_low = 10'h2f9;
              4'ha: pos_low = 10'h2fa;
              4'hb: pos_low = 10'h2fb;
              4'hc: pos_low = 10'h2fc;
              4'hd: pos_low = 10'h2fd;
              4'he: pos_low = 10'h2fe;
              4'hf: pos_low = 10'h2ff;
              default: pos_low = 10'h000;
            endcase
          end
          6'h30: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h300;
              4'h1: pos_low = 10'h301;
              4'h2: pos_low = 10'h302;
              4'h3: pos_low = 10'h303;
              4'h4: pos_low = 10'h304;
              4'h5: pos_low = 10'h305;
              4'h6: pos_low = 10'h306;
              4'h7: pos_low = 10'h307;
              4'h8: pos_low = 10'h308;
              4'h9: pos_low = 10'h309;
              4'ha: pos_low = 10'h30a;
              4'hb: pos_low = 10'h30b;
              4'hc: pos_low = 10'h30c;
              4'hd: pos_low = 10'h30d;
              4'he: pos_low = 10'h30e;
              4'hf: pos_low = 10'h30f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h31: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h310;
              4'h1: pos_low = 10'h311;
              4'h2: pos_low = 10'h312;
              4'h3: pos_low = 10'h313;
              4'h4: pos_low = 10'h314;
              4'h5: pos_low = 10'h315;
              4'h6: pos_low = 10'h316;
              4'h7: pos_low = 10'h317;
              4'h8: pos_low = 10'h318;
              4'h9: pos_low = 10'h319;
              4'ha: pos_low = 10'h31a;
              4'hb: pos_low = 10'h31b;
              4'hc: pos_low = 10'h31c;
              4'hd: pos_low = 10'h31d;
              4'he: pos_low = 10'h31e;
              4'hf: pos_low = 10'h31f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h32: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h320;
              4'h1: pos_low = 10'h321;
              4'h2: pos_low = 10'h322;
              4'h3: pos_low = 10'h323;
              4'h4: pos_low = 10'h324;
              4'h5: pos_low = 10'h325;
              4'h6: pos_low = 10'h326;
              4'h7: pos_low = 10'h327;
              4'h8: pos_low = 10'h328;
              4'h9: pos_low = 10'h329;
              4'ha: pos_low = 10'h32a;
              4'hb: pos_low = 10'h32b;
              4'hc: pos_low = 10'h32c;
              4'hd: pos_low = 10'h32d;
              4'he: pos_low = 10'h32e;
              4'hf: pos_low = 10'h32f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h33: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h330;
              4'h1: pos_low = 10'h331;
              4'h2: pos_low = 10'h332;
              4'h3: pos_low = 10'h333;
              4'h4: pos_low = 10'h334;
              4'h5: pos_low = 10'h335;
              4'h6: pos_low = 10'h336;
              4'h7: pos_low = 10'h337;
              4'h8: pos_low = 10'h338;
              4'h9: pos_low = 10'h339;
              4'ha: pos_low = 10'h33a;
              4'hb: pos_low = 10'h33b;
              4'hc: pos_low = 10'h33c;
              4'hd: pos_low = 10'h33d;
              4'he: pos_low = 10'h33e;
              4'hf: pos_low = 10'h33f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h34: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h340;
              4'h1: pos_low = 10'h341;
              4'h2: pos_low = 10'h342;
              4'h3: pos_low = 10'h343;
              4'h4: pos_low = 10'h344;
              4'h5: pos_low = 10'h345;
              4'h6: pos_low = 10'h346;
              4'h7: pos_low = 10'h347;
              4'h8: pos_low = 10'h348;
              4'h9: pos_low = 10'h349;
              4'ha: pos_low = 10'h34a;
              4'hb: pos_low = 10'h34b;
              4'hc: pos_low = 10'h34c;
              4'hd: pos_low = 10'h34d;
              4'he: pos_low = 10'h34e;
              4'hf: pos_low = 10'h34f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h35: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h350;
              4'h1: pos_low = 10'h351;
              4'h2: pos_low = 10'h352;
              4'h3: pos_low = 10'h353;
              4'h4: pos_low = 10'h354;
              4'h5: pos_low = 10'h355;
              4'h6: pos_low = 10'h356;
              4'h7: pos_low = 10'h357;
              4'h8: pos_low = 10'h358;
              4'h9: pos_low = 10'h359;
              4'ha: pos_low = 10'h35a;
              4'hb: pos_low = 10'h35b;
              4'hc: pos_low = 10'h35c;
              4'hd: pos_low = 10'h35d;
              4'he: pos_low = 10'h35e;
              4'hf: pos_low = 10'h35f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h36: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h360;
              4'h1: pos_low = 10'h361;
              4'h2: pos_low = 10'h362;
              4'h3: pos_low = 10'h363;
              4'h4: pos_low = 10'h364;
              4'h5: pos_low = 10'h365;
              4'h6: pos_low = 10'h366;
              4'h7: pos_low = 10'h367;
              4'h8: pos_low = 10'h368;
              4'h9: pos_low = 10'h369;
              4'ha: pos_low = 10'h36a;
              4'hb: pos_low = 10'h36b;
              4'hc: pos_low = 10'h36c;
              4'hd: pos_low = 10'h36d;
              4'he: pos_low = 10'h36e;
              4'hf: pos_low = 10'h36f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h37: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h370;
              4'h1: pos_low = 10'h371;
              4'h2: pos_low = 10'h372;
              4'h3: pos_low = 10'h373;
              4'h4: pos_low = 10'h374;
              4'h5: pos_low = 10'h375;
              4'h6: pos_low = 10'h376;
              4'h7: pos_low = 10'h377;
              4'h8: pos_low = 10'h378;
              4'h9: pos_low = 10'h379;
              4'ha: pos_low = 10'h37a;
              4'hb: pos_low = 10'h37b;
              4'hc: pos_low = 10'h37c;
              4'hd: pos_low = 10'h37d;
              4'he: pos_low = 10'h37e;
              4'hf: pos_low = 10'h37f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h38: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h380;
              4'h1: pos_low = 10'h381;
              4'h2: pos_low = 10'h382;
              4'h3: pos_low = 10'h383;
              4'h4: pos_low = 10'h384;
              4'h5: pos_low = 10'h385;
              4'h6: pos_low = 10'h386;
              4'h7: pos_low = 10'h387;
              4'h8: pos_low = 10'h388;
              4'h9: pos_low = 10'h389;
              4'ha: pos_low = 10'h38a;
              4'hb: pos_low = 10'h38b;
              4'hc: pos_low = 10'h38c;
              4'hd: pos_low = 10'h38d;
              4'he: pos_low = 10'h38e;
              4'hf: pos_low = 10'h38f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h39: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h390;
              4'h1: pos_low = 10'h391;
              4'h2: pos_low = 10'h392;
              4'h3: pos_low = 10'h393;
              4'h4: pos_low = 10'h394;
              4'h5: pos_low = 10'h395;
              4'h6: pos_low = 10'h396;
              4'h7: pos_low = 10'h397;
              4'h8: pos_low = 10'h398;
              4'h9: pos_low = 10'h399;
              4'ha: pos_low = 10'h39a;
              4'hb: pos_low = 10'h39b;
              4'hc: pos_low = 10'h39c;
              4'hd: pos_low = 10'h39d;
              4'he: pos_low = 10'h39e;
              4'hf: pos_low = 10'h39f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h3a: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3a0;
              4'h1: pos_low = 10'h3a1;
              4'h2: pos_low = 10'h3a2;
              4'h3: pos_low = 10'h3a3;
              4'h4: pos_low = 10'h3a4;
              4'h5: pos_low = 10'h3a5;
              4'h6: pos_low = 10'h3a6;
              4'h7: pos_low = 10'h3a7;
              4'h8: pos_low = 10'h3a8;
              4'h9: pos_low = 10'h3a9;
              4'ha: pos_low = 10'h3aa;
              4'hb: pos_low = 10'h3ab;
              4'hc: pos_low = 10'h3ac;
              4'hd: pos_low = 10'h3ad;
              4'he: pos_low = 10'h3ae;
              4'hf: pos_low = 10'h3af;
              default: pos_low = 10'h000;
            endcase
          end
          6'h3b: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3b0;
              4'h1: pos_low = 10'h3b1;
              4'h2: pos_low = 10'h3b2;
              4'h3: pos_low = 10'h3b3;
              4'h4: pos_low = 10'h3b4;
              4'h5: pos_low = 10'h3b5;
              4'h6: pos_low = 10'h3b6;
              4'h7: pos_low = 10'h3b7;
              4'h8: pos_low = 10'h3b8;
              4'h9: pos_low = 10'h3b9;
              4'ha: pos_low = 10'h3ba;
              4'hb: pos_low = 10'h3bb;
              4'hc: pos_low = 10'h3bc;
              4'hd: pos_low = 10'h3bd;
              4'he: pos_low = 10'h3be;
              4'hf: pos_low = 10'h3bf;
              default: pos_low = 10'h000;
            endcase
          end
          6'h3c: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3c0;
              4'h1: pos_low = 10'h3c1;
              4'h2: pos_low = 10'h3c2;
              4'h3: pos_low = 10'h3c3;
              4'h4: pos_low = 10'h3c4;
              4'h5: pos_low = 10'h3c5;
              4'h6: pos_low = 10'h3c6;
              4'h7: pos_low = 10'h3c7;
              4'h8: pos_low = 10'h3c8;
              4'h9: pos_low = 10'h3c9;
              4'ha: pos_low = 10'h3ca;
              4'hb: pos_low = 10'h3cb;
              4'hc: pos_low = 10'h3cc;
              4'hd: pos_low = 10'h3cd;
              4'he: pos_low = 10'h3ce;
              4'hf: pos_low = 10'h3cf;
              default: pos_low = 10'h000;
            endcase
          end
          6'h3d: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3d0;
              4'h1: pos_low = 10'h3d1;
              4'h2: pos_low = 10'h3d2;
              4'h3: pos_low = 10'h3d3;
              4'h4: pos_low = 10'h3d4;
              4'h5: pos_low = 10'h3d5;
              4'h6: pos_low = 10'h3d6;
              4'h7: pos_low = 10'h3d7;
              4'h8: pos_low = 10'h3d8;
              4'h9: pos_low = 10'h3d9;
              4'ha: pos_low = 10'h3da;
              4'hb: pos_low = 10'h3db;
              4'hc: pos_low = 10'h3dc;
              4'hd: pos_low = 10'h3dd;
              4'he: pos_low = 10'h3de;
              4'hf: pos_low = 10'h3df;
              default: pos_low = 10'h000;
            endcase
          end
          6'h3e: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3e0;
              4'h1: pos_low = 10'h3e1;
              4'h2: pos_low = 10'h3e2;
              4'h3: pos_low = 10'h3e3;
              4'h4: pos_low = 10'h3e4;
              4'h5: pos_low = 10'h3e5;
              4'h6: pos_low = 10'h3e6;
              4'h7: pos_low = 10'h3e7;
              4'h8: pos_low = 10'h3e8;
              4'h9: pos_low = 10'h3e9;
              4'ha: pos_low = 10'h3ea;
              4'hb: pos_low = 10'h3eb;
              4'hc: pos_low = 10'h3ec;
              4'hd: pos_low = 10'h3ed;
              4'he: pos_low = 10'h3ee;
              4'hf: pos_low = 10'h3ef;
              default: pos_low = 10'h000;
            endcase
          end
          6'h3f: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3f0;
              4'h1: pos_low = 10'h3f1;
              4'h2: pos_low = 10'h3f2;
              4'h3: pos_low = 10'h3f3;
              4'h4: pos_low = 10'h3f4;
              4'h5: pos_low = 10'h3f5;
              4'h6: pos_low = 10'h3f6;
              4'h7: pos_low = 10'h3f7;
              4'h8: pos_low = 10'h3f8;
              4'h9: pos_low = 10'h3f9;
              4'ha: pos_low = 10'h3fa;
              4'hb: pos_low = 10'h3fb;
              4'hc: pos_low = 10'h3fc;
              4'hd: pos_low = 10'h3fd;
              4'he: pos_low = 10'h3fe;
              4'hf: pos_low = 10'h3ff;
              default: pos_low = 10'h000;
            endcase
          end
          default: begin end
        endcase
      end
      5'h05: begin
        case (mant[9:4])
          6'h00: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h000;
              4'h1: pos_low = 10'h001;
              4'h2: pos_low = 10'h002;
              4'h3: pos_low = 10'h003;
              4'h4: pos_low = 10'h004;
              4'h5: pos_low = 10'h005;
              4'h6: pos_low = 10'h006;
              4'h7: pos_low = 10'h007;
              4'h8: pos_low = 10'h008;
              4'h9: pos_low = 10'h009;
              4'ha: pos_low = 10'h00a;
              4'hb: pos_low = 10'h00b;
              4'hc: pos_low = 10'h00c;
              4'hd: pos_low = 10'h00d;
              4'he: pos_low = 10'h00e;
              4'hf: pos_low = 10'h00f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h01: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h010;
              4'h1: pos_low = 10'h011;
              4'h2: pos_low = 10'h012;
              4'h3: pos_low = 10'h013;
              4'h4: pos_low = 10'h014;
              4'h5: pos_low = 10'h015;
              4'h6: pos_low = 10'h016;
              4'h7: pos_low = 10'h017;
              4'h8: pos_low = 10'h018;
              4'h9: pos_low = 10'h019;
              4'ha: pos_low = 10'h01a;
              4'hb: pos_low = 10'h01b;
              4'hc: pos_low = 10'h01c;
              4'hd: pos_low = 10'h01d;
              4'he: pos_low = 10'h01e;
              4'hf: pos_low = 10'h01f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h02: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h020;
              4'h1: pos_low = 10'h021;
              4'h2: pos_low = 10'h022;
              4'h3: pos_low = 10'h023;
              4'h4: pos_low = 10'h024;
              4'h5: pos_low = 10'h025;
              4'h6: pos_low = 10'h026;
              4'h7: pos_low = 10'h027;
              4'h8: pos_low = 10'h028;
              4'h9: pos_low = 10'h029;
              4'ha: pos_low = 10'h02a;
              4'hb: pos_low = 10'h02b;
              4'hc: pos_low = 10'h02c;
              4'hd: pos_low = 10'h02d;
              4'he: pos_low = 10'h02e;
              4'hf: pos_low = 10'h02f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h03: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h030;
              4'h1: pos_low = 10'h031;
              4'h2: pos_low = 10'h032;
              4'h3: pos_low = 10'h033;
              4'h4: pos_low = 10'h034;
              4'h5: pos_low = 10'h035;
              4'h6: pos_low = 10'h036;
              4'h7: pos_low = 10'h037;
              4'h8: pos_low = 10'h038;
              4'h9: pos_low = 10'h039;
              4'ha: pos_low = 10'h03a;
              4'hb: pos_low = 10'h03b;
              4'hc: pos_low = 10'h03c;
              4'hd: pos_low = 10'h03d;
              4'he: pos_low = 10'h03e;
              4'hf: pos_low = 10'h03f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h04: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h040;
              4'h1: pos_low = 10'h041;
              4'h2: pos_low = 10'h042;
              4'h3: pos_low = 10'h043;
              4'h4: pos_low = 10'h044;
              4'h5: pos_low = 10'h045;
              4'h6: pos_low = 10'h046;
              4'h7: pos_low = 10'h047;
              4'h8: pos_low = 10'h048;
              4'h9: pos_low = 10'h049;
              4'ha: pos_low = 10'h04a;
              4'hb: pos_low = 10'h04b;
              4'hc: pos_low = 10'h04c;
              4'hd: pos_low = 10'h04d;
              4'he: pos_low = 10'h04e;
              4'hf: pos_low = 10'h04f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h05: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h050;
              4'h1: pos_low = 10'h051;
              4'h2: pos_low = 10'h052;
              4'h3: pos_low = 10'h053;
              4'h4: pos_low = 10'h054;
              4'h5: pos_low = 10'h055;
              4'h6: pos_low = 10'h056;
              4'h7: pos_low = 10'h057;
              4'h8: pos_low = 10'h058;
              4'h9: pos_low = 10'h059;
              4'ha: pos_low = 10'h05a;
              4'hb: pos_low = 10'h05b;
              4'hc: pos_low = 10'h05c;
              4'hd: pos_low = 10'h05d;
              4'he: pos_low = 10'h05e;
              4'hf: pos_low = 10'h05f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h06: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h060;
              4'h1: pos_low = 10'h061;
              4'h2: pos_low = 10'h062;
              4'h3: pos_low = 10'h063;
              4'h4: pos_low = 10'h064;
              4'h5: pos_low = 10'h065;
              4'h6: pos_low = 10'h066;
              4'h7: pos_low = 10'h067;
              4'h8: pos_low = 10'h068;
              4'h9: pos_low = 10'h069;
              4'ha: pos_low = 10'h06a;
              4'hb: pos_low = 10'h06b;
              4'hc: pos_low = 10'h06c;
              4'hd: pos_low = 10'h06d;
              4'he: pos_low = 10'h06e;
              4'hf: pos_low = 10'h06f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h07: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h070;
              4'h1: pos_low = 10'h071;
              4'h2: pos_low = 10'h072;
              4'h3: pos_low = 10'h073;
              4'h4: pos_low = 10'h074;
              4'h5: pos_low = 10'h075;
              4'h6: pos_low = 10'h076;
              4'h7: pos_low = 10'h077;
              4'h8: pos_low = 10'h078;
              4'h9: pos_low = 10'h079;
              4'ha: pos_low = 10'h07a;
              4'hb: pos_low = 10'h07b;
              4'hc: pos_low = 10'h07c;
              4'hd: pos_low = 10'h07d;
              4'he: pos_low = 10'h07e;
              4'hf: pos_low = 10'h07f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h08: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h080;
              4'h1: pos_low = 10'h081;
              4'h2: pos_low = 10'h082;
              4'h3: pos_low = 10'h083;
              4'h4: pos_low = 10'h084;
              4'h5: pos_low = 10'h085;
              4'h6: pos_low = 10'h086;
              4'h7: pos_low = 10'h087;
              4'h8: pos_low = 10'h088;
              4'h9: pos_low = 10'h089;
              4'ha: pos_low = 10'h08a;
              4'hb: pos_low = 10'h08b;
              4'hc: pos_low = 10'h08c;
              4'hd: pos_low = 10'h08d;
              4'he: pos_low = 10'h08e;
              4'hf: pos_low = 10'h08f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h09: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h090;
              4'h1: pos_low = 10'h091;
              4'h2: pos_low = 10'h092;
              4'h3: pos_low = 10'h093;
              4'h4: pos_low = 10'h094;
              4'h5: pos_low = 10'h095;
              4'h6: pos_low = 10'h096;
              4'h7: pos_low = 10'h097;
              4'h8: pos_low = 10'h098;
              4'h9: pos_low = 10'h099;
              4'ha: pos_low = 10'h09a;
              4'hb: pos_low = 10'h09b;
              4'hc: pos_low = 10'h09c;
              4'hd: pos_low = 10'h09d;
              4'he: pos_low = 10'h09e;
              4'hf: pos_low = 10'h09f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h0a: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h0a0;
              4'h1: pos_low = 10'h0a1;
              4'h2: pos_low = 10'h0a2;
              4'h3: pos_low = 10'h0a3;
              4'h4: pos_low = 10'h0a4;
              4'h5: pos_low = 10'h0a5;
              4'h6: pos_low = 10'h0a6;
              4'h7: pos_low = 10'h0a7;
              4'h8: pos_low = 10'h0a8;
              4'h9: pos_low = 10'h0a9;
              4'ha: pos_low = 10'h0aa;
              4'hb: pos_low = 10'h0ab;
              4'hc: pos_low = 10'h0ac;
              4'hd: pos_low = 10'h0ad;
              4'he: pos_low = 10'h0ae;
              4'hf: pos_low = 10'h0af;
              default: pos_low = 10'h000;
            endcase
          end
          6'h0b: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h0b0;
              4'h1: pos_low = 10'h0b1;
              4'h2: pos_low = 10'h0b2;
              4'h3: pos_low = 10'h0b3;
              4'h4: pos_low = 10'h0b4;
              4'h5: pos_low = 10'h0b5;
              4'h6: pos_low = 10'h0b6;
              4'h7: pos_low = 10'h0b7;
              4'h8: pos_low = 10'h0b8;
              4'h9: pos_low = 10'h0b9;
              4'ha: pos_low = 10'h0ba;
              4'hb: pos_low = 10'h0bb;
              4'hc: pos_low = 10'h0bc;
              4'hd: pos_low = 10'h0bd;
              4'he: pos_low = 10'h0be;
              4'hf: pos_low = 10'h0bf;
              default: pos_low = 10'h000;
            endcase
          end
          6'h0c: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h0c0;
              4'h1: pos_low = 10'h0c1;
              4'h2: pos_low = 10'h0c2;
              4'h3: pos_low = 10'h0c3;
              4'h4: pos_low = 10'h0c4;
              4'h5: pos_low = 10'h0c5;
              4'h6: pos_low = 10'h0c6;
              4'h7: pos_low = 10'h0c7;
              4'h8: pos_low = 10'h0c8;
              4'h9: pos_low = 10'h0c9;
              4'ha: pos_low = 10'h0ca;
              4'hb: pos_low = 10'h0cb;
              4'hc: pos_low = 10'h0cc;
              4'hd: pos_low = 10'h0cd;
              4'he: pos_low = 10'h0ce;
              4'hf: pos_low = 10'h0cf;
              default: pos_low = 10'h000;
            endcase
          end
          6'h0d: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h0d0;
              4'h1: pos_low = 10'h0d1;
              4'h2: pos_low = 10'h0d2;
              4'h3: pos_low = 10'h0d3;
              4'h4: pos_low = 10'h0d4;
              4'h5: pos_low = 10'h0d5;
              4'h6: pos_low = 10'h0d6;
              4'h7: pos_low = 10'h0d7;
              4'h8: pos_low = 10'h0d8;
              4'h9: pos_low = 10'h0d9;
              4'ha: pos_low = 10'h0da;
              4'hb: pos_low = 10'h0db;
              4'hc: pos_low = 10'h0dc;
              4'hd: pos_low = 10'h0dd;
              4'he: pos_low = 10'h0de;
              4'hf: pos_low = 10'h0df;
              default: pos_low = 10'h000;
            endcase
          end
          6'h0e: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h0e0;
              4'h1: pos_low = 10'h0e1;
              4'h2: pos_low = 10'h0e2;
              4'h3: pos_low = 10'h0e3;
              4'h4: pos_low = 10'h0e4;
              4'h5: pos_low = 10'h0e5;
              4'h6: pos_low = 10'h0e6;
              4'h7: pos_low = 10'h0e7;
              4'h8: pos_low = 10'h0e8;
              4'h9: pos_low = 10'h0e9;
              4'ha: pos_low = 10'h0ea;
              4'hb: pos_low = 10'h0eb;
              4'hc: pos_low = 10'h0ec;
              4'hd: pos_low = 10'h0ed;
              4'he: pos_low = 10'h0ee;
              4'hf: pos_low = 10'h0ef;
              default: pos_low = 10'h000;
            endcase
          end
          6'h0f: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h0f0;
              4'h1: pos_low = 10'h0f1;
              4'h2: pos_low = 10'h0f2;
              4'h3: pos_low = 10'h0f3;
              4'h4: pos_low = 10'h0f4;
              4'h5: pos_low = 10'h0f5;
              4'h6: pos_low = 10'h0f6;
              4'h7: pos_low = 10'h0f7;
              4'h8: pos_low = 10'h0f8;
              4'h9: pos_low = 10'h0f9;
              4'ha: pos_low = 10'h0fa;
              4'hb: pos_low = 10'h0fb;
              4'hc: pos_low = 10'h0fc;
              4'hd: pos_low = 10'h0fd;
              4'he: pos_low = 10'h0fe;
              4'hf: pos_low = 10'h0ff;
              default: pos_low = 10'h000;
            endcase
          end
          6'h10: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h100;
              4'h1: pos_low = 10'h101;
              4'h2: pos_low = 10'h102;
              4'h3: pos_low = 10'h103;
              4'h4: pos_low = 10'h104;
              4'h5: pos_low = 10'h105;
              4'h6: pos_low = 10'h106;
              4'h7: pos_low = 10'h107;
              4'h8: pos_low = 10'h108;
              4'h9: pos_low = 10'h109;
              4'ha: pos_low = 10'h10a;
              4'hb: pos_low = 10'h10b;
              4'hc: pos_low = 10'h10c;
              4'hd: pos_low = 10'h10d;
              4'he: pos_low = 10'h10e;
              4'hf: pos_low = 10'h10f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h11: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h110;
              4'h1: pos_low = 10'h111;
              4'h2: pos_low = 10'h112;
              4'h3: pos_low = 10'h113;
              4'h4: pos_low = 10'h114;
              4'h5: pos_low = 10'h115;
              4'h6: pos_low = 10'h116;
              4'h7: pos_low = 10'h117;
              4'h8: pos_low = 10'h118;
              4'h9: pos_low = 10'h119;
              4'ha: pos_low = 10'h11a;
              4'hb: pos_low = 10'h11b;
              4'hc: pos_low = 10'h11c;
              4'hd: pos_low = 10'h11d;
              4'he: pos_low = 10'h11e;
              4'hf: pos_low = 10'h11f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h12: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h120;
              4'h1: pos_low = 10'h121;
              4'h2: pos_low = 10'h122;
              4'h3: pos_low = 10'h123;
              4'h4: pos_low = 10'h124;
              4'h5: pos_low = 10'h125;
              4'h6: pos_low = 10'h126;
              4'h7: pos_low = 10'h127;
              4'h8: pos_low = 10'h128;
              4'h9: pos_low = 10'h129;
              4'ha: pos_low = 10'h12a;
              4'hb: pos_low = 10'h12b;
              4'hc: pos_low = 10'h12c;
              4'hd: pos_low = 10'h12d;
              4'he: pos_low = 10'h12e;
              4'hf: pos_low = 10'h12f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h13: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h130;
              4'h1: pos_low = 10'h131;
              4'h2: pos_low = 10'h132;
              4'h3: pos_low = 10'h133;
              4'h4: pos_low = 10'h134;
              4'h5: pos_low = 10'h135;
              4'h6: pos_low = 10'h136;
              4'h7: pos_low = 10'h137;
              4'h8: pos_low = 10'h138;
              4'h9: pos_low = 10'h139;
              4'ha: pos_low = 10'h13a;
              4'hb: pos_low = 10'h13b;
              4'hc: pos_low = 10'h13c;
              4'hd: pos_low = 10'h13d;
              4'he: pos_low = 10'h13e;
              4'hf: pos_low = 10'h13f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h14: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h140;
              4'h1: pos_low = 10'h141;
              4'h2: pos_low = 10'h142;
              4'h3: pos_low = 10'h143;
              4'h4: pos_low = 10'h144;
              4'h5: pos_low = 10'h145;
              4'h6: pos_low = 10'h146;
              4'h7: pos_low = 10'h147;
              4'h8: pos_low = 10'h148;
              4'h9: pos_low = 10'h149;
              4'ha: pos_low = 10'h14a;
              4'hb: pos_low = 10'h14b;
              4'hc: pos_low = 10'h14c;
              4'hd: pos_low = 10'h14d;
              4'he: pos_low = 10'h14e;
              4'hf: pos_low = 10'h14f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h15: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h150;
              4'h1: pos_low = 10'h151;
              4'h2: pos_low = 10'h152;
              4'h3: pos_low = 10'h153;
              4'h4: pos_low = 10'h154;
              4'h5: pos_low = 10'h155;
              4'h6: pos_low = 10'h156;
              4'h7: pos_low = 10'h157;
              4'h8: pos_low = 10'h158;
              4'h9: pos_low = 10'h159;
              4'ha: pos_low = 10'h15a;
              4'hb: pos_low = 10'h15b;
              4'hc: pos_low = 10'h15c;
              4'hd: pos_low = 10'h15d;
              4'he: pos_low = 10'h15e;
              4'hf: pos_low = 10'h15f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h16: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h160;
              4'h1: pos_low = 10'h161;
              4'h2: pos_low = 10'h162;
              4'h3: pos_low = 10'h163;
              4'h4: pos_low = 10'h164;
              4'h5: pos_low = 10'h165;
              4'h6: pos_low = 10'h166;
              4'h7: pos_low = 10'h167;
              4'h8: pos_low = 10'h168;
              4'h9: pos_low = 10'h169;
              4'ha: pos_low = 10'h16a;
              4'hb: pos_low = 10'h16b;
              4'hc: pos_low = 10'h16c;
              4'hd: pos_low = 10'h16d;
              4'he: pos_low = 10'h16e;
              4'hf: pos_low = 10'h16f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h17: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h170;
              4'h1: pos_low = 10'h171;
              4'h2: pos_low = 10'h172;
              4'h3: pos_low = 10'h173;
              4'h4: pos_low = 10'h174;
              4'h5: pos_low = 10'h175;
              4'h6: pos_low = 10'h176;
              4'h7: pos_low = 10'h177;
              4'h8: pos_low = 10'h178;
              4'h9: pos_low = 10'h179;
              4'ha: pos_low = 10'h17a;
              4'hb: pos_low = 10'h17b;
              4'hc: pos_low = 10'h17c;
              4'hd: pos_low = 10'h17d;
              4'he: pos_low = 10'h17e;
              4'hf: pos_low = 10'h17f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h18: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h180;
              4'h1: pos_low = 10'h181;
              4'h2: pos_low = 10'h182;
              4'h3: pos_low = 10'h183;
              4'h4: pos_low = 10'h184;
              4'h5: pos_low = 10'h185;
              4'h6: pos_low = 10'h186;
              4'h7: pos_low = 10'h187;
              4'h8: pos_low = 10'h188;
              4'h9: pos_low = 10'h189;
              4'ha: pos_low = 10'h18a;
              4'hb: pos_low = 10'h18b;
              4'hc: pos_low = 10'h18c;
              4'hd: pos_low = 10'h18d;
              4'he: pos_low = 10'h18e;
              4'hf: pos_low = 10'h18f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h19: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h190;
              4'h1: pos_low = 10'h191;
              4'h2: pos_low = 10'h192;
              4'h3: pos_low = 10'h193;
              4'h4: pos_low = 10'h194;
              4'h5: pos_low = 10'h195;
              4'h6: pos_low = 10'h196;
              4'h7: pos_low = 10'h197;
              4'h8: pos_low = 10'h198;
              4'h9: pos_low = 10'h199;
              4'ha: pos_low = 10'h19a;
              4'hb: pos_low = 10'h19b;
              4'hc: pos_low = 10'h19c;
              4'hd: pos_low = 10'h19d;
              4'he: pos_low = 10'h19e;
              4'hf: pos_low = 10'h19f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h1a: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h1a0;
              4'h1: pos_low = 10'h1a1;
              4'h2: pos_low = 10'h1a2;
              4'h3: pos_low = 10'h1a3;
              4'h4: pos_low = 10'h1a4;
              4'h5: pos_low = 10'h1a5;
              4'h6: pos_low = 10'h1a6;
              4'h7: pos_low = 10'h1a7;
              4'h8: pos_low = 10'h1a8;
              4'h9: pos_low = 10'h1a9;
              4'ha: pos_low = 10'h1aa;
              4'hb: pos_low = 10'h1ab;
              4'hc: pos_low = 10'h1ac;
              4'hd: pos_low = 10'h1ad;
              4'he: pos_low = 10'h1ae;
              4'hf: pos_low = 10'h1af;
              default: pos_low = 10'h000;
            endcase
          end
          6'h1b: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h1b0;
              4'h1: pos_low = 10'h1b1;
              4'h2: pos_low = 10'h1b2;
              4'h3: pos_low = 10'h1b3;
              4'h4: pos_low = 10'h1b4;
              4'h5: pos_low = 10'h1b5;
              4'h6: pos_low = 10'h1b6;
              4'h7: pos_low = 10'h1b7;
              4'h8: pos_low = 10'h1b8;
              4'h9: pos_low = 10'h1b9;
              4'ha: pos_low = 10'h1ba;
              4'hb: pos_low = 10'h1bb;
              4'hc: pos_low = 10'h1bc;
              4'hd: pos_low = 10'h1bd;
              4'he: pos_low = 10'h1be;
              4'hf: pos_low = 10'h1bf;
              default: pos_low = 10'h000;
            endcase
          end
          6'h1c: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h1c0;
              4'h1: pos_low = 10'h1c1;
              4'h2: pos_low = 10'h1c2;
              4'h3: pos_low = 10'h1c3;
              4'h4: pos_low = 10'h1c4;
              4'h5: pos_low = 10'h1c5;
              4'h6: pos_low = 10'h1c6;
              4'h7: pos_low = 10'h1c7;
              4'h8: pos_low = 10'h1c8;
              4'h9: pos_low = 10'h1c9;
              4'ha: pos_low = 10'h1ca;
              4'hb: pos_low = 10'h1cb;
              4'hc: pos_low = 10'h1cc;
              4'hd: pos_low = 10'h1cd;
              4'he: pos_low = 10'h1ce;
              4'hf: pos_low = 10'h1cf;
              default: pos_low = 10'h000;
            endcase
          end
          6'h1d: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h1d0;
              4'h1: pos_low = 10'h1d1;
              4'h2: pos_low = 10'h1d2;
              4'h3: pos_low = 10'h1d3;
              4'h4: pos_low = 10'h1d4;
              4'h5: pos_low = 10'h1d5;
              4'h6: pos_low = 10'h1d6;
              4'h7: pos_low = 10'h1d7;
              4'h8: pos_low = 10'h1d8;
              4'h9: pos_low = 10'h1d9;
              4'ha: pos_low = 10'h1da;
              4'hb: pos_low = 10'h1db;
              4'hc: pos_low = 10'h1dc;
              4'hd: pos_low = 10'h1dd;
              4'he: pos_low = 10'h1de;
              4'hf: pos_low = 10'h1df;
              default: pos_low = 10'h000;
            endcase
          end
          6'h1e: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h1e0;
              4'h1: pos_low = 10'h1e1;
              4'h2: pos_low = 10'h1e2;
              4'h3: pos_low = 10'h1e3;
              4'h4: pos_low = 10'h1e4;
              4'h5: pos_low = 10'h1e5;
              4'h6: pos_low = 10'h1e6;
              4'h7: pos_low = 10'h1e7;
              4'h8: pos_low = 10'h1e8;
              4'h9: pos_low = 10'h1e9;
              4'ha: pos_low = 10'h1ea;
              4'hb: pos_low = 10'h1eb;
              4'hc: pos_low = 10'h1ec;
              4'hd: pos_low = 10'h1ed;
              4'he: pos_low = 10'h1ee;
              4'hf: pos_low = 10'h1ef;
              default: pos_low = 10'h000;
            endcase
          end
          6'h1f: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h1f0;
              4'h1: pos_low = 10'h1f1;
              4'h2: pos_low = 10'h1f2;
              4'h3: pos_low = 10'h1f3;
              4'h4: pos_low = 10'h1f4;
              4'h5: pos_low = 10'h1f5;
              4'h6: pos_low = 10'h1f6;
              4'h7: pos_low = 10'h1f7;
              4'h8: pos_low = 10'h1f8;
              4'h9: pos_low = 10'h1f9;
              4'ha: pos_low = 10'h1fa;
              4'hb: pos_low = 10'h1fb;
              4'hc: pos_low = 10'h1fc;
              4'hd: pos_low = 10'h1fd;
              4'he: pos_low = 10'h1fe;
              4'hf: pos_low = 10'h1ff;
              default: pos_low = 10'h000;
            endcase
          end
          6'h20: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h200;
              4'h1: pos_low = 10'h201;
              4'h2: pos_low = 10'h202;
              4'h3: pos_low = 10'h203;
              4'h4: pos_low = 10'h204;
              4'h5: pos_low = 10'h205;
              4'h6: pos_low = 10'h206;
              4'h7: pos_low = 10'h207;
              4'h8: pos_low = 10'h208;
              4'h9: pos_low = 10'h209;
              4'ha: pos_low = 10'h20a;
              4'hb: pos_low = 10'h20b;
              4'hc: pos_low = 10'h20c;
              4'hd: pos_low = 10'h20d;
              4'he: pos_low = 10'h20e;
              4'hf: pos_low = 10'h20f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h21: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h210;
              4'h1: pos_low = 10'h211;
              4'h2: pos_low = 10'h212;
              4'h3: pos_low = 10'h213;
              4'h4: pos_low = 10'h214;
              4'h5: pos_low = 10'h215;
              4'h6: pos_low = 10'h216;
              4'h7: pos_low = 10'h217;
              4'h8: pos_low = 10'h218;
              4'h9: pos_low = 10'h219;
              4'ha: pos_low = 10'h21a;
              4'hb: pos_low = 10'h21b;
              4'hc: pos_low = 10'h21c;
              4'hd: pos_low = 10'h21d;
              4'he: pos_low = 10'h21e;
              4'hf: pos_low = 10'h21f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h22: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h220;
              4'h1: pos_low = 10'h221;
              4'h2: pos_low = 10'h222;
              4'h3: pos_low = 10'h223;
              4'h4: pos_low = 10'h224;
              4'h5: pos_low = 10'h225;
              4'h6: pos_low = 10'h226;
              4'h7: pos_low = 10'h227;
              4'h8: pos_low = 10'h228;
              4'h9: pos_low = 10'h229;
              4'ha: pos_low = 10'h22a;
              4'hb: pos_low = 10'h22b;
              4'hc: pos_low = 10'h22c;
              4'hd: pos_low = 10'h22d;
              4'he: pos_low = 10'h22e;
              4'hf: pos_low = 10'h22f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h23: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h230;
              4'h1: pos_low = 10'h231;
              4'h2: pos_low = 10'h232;
              4'h3: pos_low = 10'h233;
              4'h4: pos_low = 10'h234;
              4'h5: pos_low = 10'h235;
              4'h6: pos_low = 10'h236;
              4'h7: pos_low = 10'h237;
              4'h8: pos_low = 10'h238;
              4'h9: pos_low = 10'h239;
              4'ha: pos_low = 10'h23a;
              4'hb: pos_low = 10'h23b;
              4'hc: pos_low = 10'h23c;
              4'hd: pos_low = 10'h23d;
              4'he: pos_low = 10'h23e;
              4'hf: pos_low = 10'h23f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h24: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h240;
              4'h1: pos_low = 10'h241;
              4'h2: pos_low = 10'h242;
              4'h3: pos_low = 10'h243;
              4'h4: pos_low = 10'h244;
              4'h5: pos_low = 10'h245;
              4'h6: pos_low = 10'h246;
              4'h7: pos_low = 10'h247;
              4'h8: pos_low = 10'h248;
              4'h9: pos_low = 10'h249;
              4'ha: pos_low = 10'h24a;
              4'hb: pos_low = 10'h24b;
              4'hc: pos_low = 10'h24c;
              4'hd: pos_low = 10'h24d;
              4'he: pos_low = 10'h24e;
              4'hf: pos_low = 10'h24f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h25: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h250;
              4'h1: pos_low = 10'h251;
              4'h2: pos_low = 10'h252;
              4'h3: pos_low = 10'h253;
              4'h4: pos_low = 10'h254;
              4'h5: pos_low = 10'h255;
              4'h6: pos_low = 10'h256;
              4'h7: pos_low = 10'h257;
              4'h8: pos_low = 10'h258;
              4'h9: pos_low = 10'h259;
              4'ha: pos_low = 10'h25a;
              4'hb: pos_low = 10'h25b;
              4'hc: pos_low = 10'h25c;
              4'hd: pos_low = 10'h25d;
              4'he: pos_low = 10'h25e;
              4'hf: pos_low = 10'h25f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h26: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h260;
              4'h1: pos_low = 10'h261;
              4'h2: pos_low = 10'h262;
              4'h3: pos_low = 10'h263;
              4'h4: pos_low = 10'h264;
              4'h5: pos_low = 10'h265;
              4'h6: pos_low = 10'h266;
              4'h7: pos_low = 10'h267;
              4'h8: pos_low = 10'h268;
              4'h9: pos_low = 10'h269;
              4'ha: pos_low = 10'h26a;
              4'hb: pos_low = 10'h26b;
              4'hc: pos_low = 10'h26c;
              4'hd: pos_low = 10'h26d;
              4'he: pos_low = 10'h26e;
              4'hf: pos_low = 10'h26f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h27: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h270;
              4'h1: pos_low = 10'h271;
              4'h2: pos_low = 10'h272;
              4'h3: pos_low = 10'h273;
              4'h4: pos_low = 10'h274;
              4'h5: pos_low = 10'h275;
              4'h6: pos_low = 10'h276;
              4'h7: pos_low = 10'h277;
              4'h8: pos_low = 10'h278;
              4'h9: pos_low = 10'h279;
              4'ha: pos_low = 10'h27a;
              4'hb: pos_low = 10'h27b;
              4'hc: pos_low = 10'h27c;
              4'hd: pos_low = 10'h27d;
              4'he: pos_low = 10'h27e;
              4'hf: pos_low = 10'h27f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h28: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h280;
              4'h1: pos_low = 10'h281;
              4'h2: pos_low = 10'h282;
              4'h3: pos_low = 10'h283;
              4'h4: pos_low = 10'h284;
              4'h5: pos_low = 10'h285;
              4'h6: pos_low = 10'h286;
              4'h7: pos_low = 10'h287;
              4'h8: pos_low = 10'h288;
              4'h9: pos_low = 10'h289;
              4'ha: pos_low = 10'h28a;
              4'hb: pos_low = 10'h28b;
              4'hc: pos_low = 10'h28c;
              4'hd: pos_low = 10'h28d;
              4'he: pos_low = 10'h28e;
              4'hf: pos_low = 10'h28f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h29: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h290;
              4'h1: pos_low = 10'h291;
              4'h2: pos_low = 10'h292;
              4'h3: pos_low = 10'h293;
              4'h4: pos_low = 10'h294;
              4'h5: pos_low = 10'h295;
              4'h6: pos_low = 10'h296;
              4'h7: pos_low = 10'h297;
              4'h8: pos_low = 10'h298;
              4'h9: pos_low = 10'h299;
              4'ha: pos_low = 10'h29a;
              4'hb: pos_low = 10'h29b;
              4'hc: pos_low = 10'h29c;
              4'hd: pos_low = 10'h29d;
              4'he: pos_low = 10'h29e;
              4'hf: pos_low = 10'h29f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h2a: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h2a0;
              4'h1: pos_low = 10'h2a1;
              4'h2: pos_low = 10'h2a2;
              4'h3: pos_low = 10'h2a3;
              4'h4: pos_low = 10'h2a4;
              4'h5: pos_low = 10'h2a5;
              4'h6: pos_low = 10'h2a6;
              4'h7: pos_low = 10'h2a7;
              4'h8: pos_low = 10'h2a8;
              4'h9: pos_low = 10'h2a9;
              4'ha: pos_low = 10'h2aa;
              4'hb: pos_low = 10'h2ab;
              4'hc: pos_low = 10'h2ac;
              4'hd: pos_low = 10'h2ad;
              4'he: pos_low = 10'h2ae;
              4'hf: pos_low = 10'h2af;
              default: pos_low = 10'h000;
            endcase
          end
          6'h2b: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h2b0;
              4'h1: pos_low = 10'h2b1;
              4'h2: pos_low = 10'h2b2;
              4'h3: pos_low = 10'h2b3;
              4'h4: pos_low = 10'h2b4;
              4'h5: pos_low = 10'h2b5;
              4'h6: pos_low = 10'h2b6;
              4'h7: pos_low = 10'h2b7;
              4'h8: pos_low = 10'h2b8;
              4'h9: pos_low = 10'h2b9;
              4'ha: pos_low = 10'h2ba;
              4'hb: pos_low = 10'h2bb;
              4'hc: pos_low = 10'h2bc;
              4'hd: pos_low = 10'h2bd;
              4'he: pos_low = 10'h2be;
              4'hf: pos_low = 10'h2bf;
              default: pos_low = 10'h000;
            endcase
          end
          6'h2c: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h2c0;
              4'h1: pos_low = 10'h2c1;
              4'h2: pos_low = 10'h2c2;
              4'h3: pos_low = 10'h2c3;
              4'h4: pos_low = 10'h2c4;
              4'h5: pos_low = 10'h2c5;
              4'h6: pos_low = 10'h2c6;
              4'h7: pos_low = 10'h2c7;
              4'h8: pos_low = 10'h2c8;
              4'h9: pos_low = 10'h2c9;
              4'ha: pos_low = 10'h2ca;
              4'hb: pos_low = 10'h2cb;
              4'hc: pos_low = 10'h2cc;
              4'hd: pos_low = 10'h2cd;
              4'he: pos_low = 10'h2ce;
              4'hf: pos_low = 10'h2cf;
              default: pos_low = 10'h000;
            endcase
          end
          6'h2d: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h2d0;
              4'h1: pos_low = 10'h2d1;
              4'h2: pos_low = 10'h2d2;
              4'h3: pos_low = 10'h2d3;
              4'h4: pos_low = 10'h2d4;
              4'h5: pos_low = 10'h2d5;
              4'h6: pos_low = 10'h2d6;
              4'h7: pos_low = 10'h2d7;
              4'h8: pos_low = 10'h2d8;
              4'h9: pos_low = 10'h2d9;
              4'ha: pos_low = 10'h2da;
              4'hb: pos_low = 10'h2db;
              4'hc: pos_low = 10'h2dc;
              4'hd: pos_low = 10'h2dd;
              4'he: pos_low = 10'h2de;
              4'hf: pos_low = 10'h2df;
              default: pos_low = 10'h000;
            endcase
          end
          6'h2e: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h2e0;
              4'h1: pos_low = 10'h2e1;
              4'h2: pos_low = 10'h2e2;
              4'h3: pos_low = 10'h2e3;
              4'h4: pos_low = 10'h2e4;
              4'h5: pos_low = 10'h2e5;
              4'h6: pos_low = 10'h2e6;
              4'h7: pos_low = 10'h2e7;
              4'h8: pos_low = 10'h2e8;
              4'h9: pos_low = 10'h2e9;
              4'ha: pos_low = 10'h2ea;
              4'hb: pos_low = 10'h2eb;
              4'hc: pos_low = 10'h2ec;
              4'hd: pos_low = 10'h2ed;
              4'he: pos_low = 10'h2ee;
              4'hf: pos_low = 10'h2ef;
              default: pos_low = 10'h000;
            endcase
          end
          6'h2f: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h2f0;
              4'h1: pos_low = 10'h2f1;
              4'h2: pos_low = 10'h2f2;
              4'h3: pos_low = 10'h2f3;
              4'h4: pos_low = 10'h2f4;
              4'h5: pos_low = 10'h2f5;
              4'h6: pos_low = 10'h2f6;
              4'h7: pos_low = 10'h2f7;
              4'h8: pos_low = 10'h2f8;
              4'h9: pos_low = 10'h2f9;
              4'ha: pos_low = 10'h2fa;
              4'hb: pos_low = 10'h2fb;
              4'hc: pos_low = 10'h2fc;
              4'hd: pos_low = 10'h2fd;
              4'he: pos_low = 10'h2fe;
              4'hf: pos_low = 10'h2ff;
              default: pos_low = 10'h000;
            endcase
          end
          6'h30: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h300;
              4'h1: pos_low = 10'h301;
              4'h2: pos_low = 10'h302;
              4'h3: pos_low = 10'h303;
              4'h4: pos_low = 10'h304;
              4'h5: pos_low = 10'h305;
              4'h6: pos_low = 10'h306;
              4'h7: pos_low = 10'h307;
              4'h8: pos_low = 10'h308;
              4'h9: pos_low = 10'h309;
              4'ha: pos_low = 10'h30a;
              4'hb: pos_low = 10'h30b;
              4'hc: pos_low = 10'h30c;
              4'hd: pos_low = 10'h30d;
              4'he: pos_low = 10'h30e;
              4'hf: pos_low = 10'h30f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h31: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h310;
              4'h1: pos_low = 10'h311;
              4'h2: pos_low = 10'h312;
              4'h3: pos_low = 10'h313;
              4'h4: pos_low = 10'h314;
              4'h5: pos_low = 10'h315;
              4'h6: pos_low = 10'h316;
              4'h7: pos_low = 10'h317;
              4'h8: pos_low = 10'h318;
              4'h9: pos_low = 10'h319;
              4'ha: pos_low = 10'h31a;
              4'hb: pos_low = 10'h31b;
              4'hc: pos_low = 10'h31c;
              4'hd: pos_low = 10'h31d;
              4'he: pos_low = 10'h31e;
              4'hf: pos_low = 10'h31f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h32: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h320;
              4'h1: pos_low = 10'h321;
              4'h2: pos_low = 10'h322;
              4'h3: pos_low = 10'h323;
              4'h4: pos_low = 10'h324;
              4'h5: pos_low = 10'h325;
              4'h6: pos_low = 10'h326;
              4'h7: pos_low = 10'h327;
              4'h8: pos_low = 10'h328;
              4'h9: pos_low = 10'h329;
              4'ha: pos_low = 10'h32a;
              4'hb: pos_low = 10'h32b;
              4'hc: pos_low = 10'h32c;
              4'hd: pos_low = 10'h32d;
              4'he: pos_low = 10'h32e;
              4'hf: pos_low = 10'h32f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h33: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h330;
              4'h1: pos_low = 10'h331;
              4'h2: pos_low = 10'h332;
              4'h3: pos_low = 10'h333;
              4'h4: pos_low = 10'h334;
              4'h5: pos_low = 10'h335;
              4'h6: pos_low = 10'h336;
              4'h7: pos_low = 10'h337;
              4'h8: pos_low = 10'h338;
              4'h9: pos_low = 10'h339;
              4'ha: pos_low = 10'h33a;
              4'hb: pos_low = 10'h33b;
              4'hc: pos_low = 10'h33c;
              4'hd: pos_low = 10'h33d;
              4'he: pos_low = 10'h33e;
              4'hf: pos_low = 10'h33f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h34: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h340;
              4'h1: pos_low = 10'h341;
              4'h2: pos_low = 10'h342;
              4'h3: pos_low = 10'h343;
              4'h4: pos_low = 10'h344;
              4'h5: pos_low = 10'h345;
              4'h6: pos_low = 10'h346;
              4'h7: pos_low = 10'h347;
              4'h8: pos_low = 10'h348;
              4'h9: pos_low = 10'h349;
              4'ha: pos_low = 10'h34a;
              4'hb: pos_low = 10'h34b;
              4'hc: pos_low = 10'h34c;
              4'hd: pos_low = 10'h34d;
              4'he: pos_low = 10'h34e;
              4'hf: pos_low = 10'h34f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h35: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h350;
              4'h1: pos_low = 10'h351;
              4'h2: pos_low = 10'h352;
              4'h3: pos_low = 10'h353;
              4'h4: pos_low = 10'h354;
              4'h5: pos_low = 10'h355;
              4'h6: pos_low = 10'h356;
              4'h7: pos_low = 10'h357;
              4'h8: pos_low = 10'h358;
              4'h9: pos_low = 10'h359;
              4'ha: pos_low = 10'h35a;
              4'hb: pos_low = 10'h35b;
              4'hc: pos_low = 10'h35c;
              4'hd: pos_low = 10'h35d;
              4'he: pos_low = 10'h35e;
              4'hf: pos_low = 10'h35f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h36: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h360;
              4'h1: pos_low = 10'h361;
              4'h2: pos_low = 10'h362;
              4'h3: pos_low = 10'h363;
              4'h4: pos_low = 10'h364;
              4'h5: pos_low = 10'h365;
              4'h6: pos_low = 10'h366;
              4'h7: pos_low = 10'h367;
              4'h8: pos_low = 10'h368;
              4'h9: pos_low = 10'h369;
              4'ha: pos_low = 10'h36a;
              4'hb: pos_low = 10'h36b;
              4'hc: pos_low = 10'h36c;
              4'hd: pos_low = 10'h36d;
              4'he: pos_low = 10'h36e;
              4'hf: pos_low = 10'h36f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h37: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h370;
              4'h1: pos_low = 10'h371;
              4'h2: pos_low = 10'h372;
              4'h3: pos_low = 10'h373;
              4'h4: pos_low = 10'h374;
              4'h5: pos_low = 10'h375;
              4'h6: pos_low = 10'h376;
              4'h7: pos_low = 10'h377;
              4'h8: pos_low = 10'h378;
              4'h9: pos_low = 10'h379;
              4'ha: pos_low = 10'h37a;
              4'hb: pos_low = 10'h37b;
              4'hc: pos_low = 10'h37c;
              4'hd: pos_low = 10'h37d;
              4'he: pos_low = 10'h37e;
              4'hf: pos_low = 10'h37f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h38: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h380;
              4'h1: pos_low = 10'h381;
              4'h2: pos_low = 10'h382;
              4'h3: pos_low = 10'h383;
              4'h4: pos_low = 10'h384;
              4'h5: pos_low = 10'h385;
              4'h6: pos_low = 10'h386;
              4'h7: pos_low = 10'h387;
              4'h8: pos_low = 10'h388;
              4'h9: pos_low = 10'h389;
              4'ha: pos_low = 10'h38a;
              4'hb: pos_low = 10'h38b;
              4'hc: pos_low = 10'h38c;
              4'hd: pos_low = 10'h38d;
              4'he: pos_low = 10'h38e;
              4'hf: pos_low = 10'h38f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h39: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h390;
              4'h1: pos_low = 10'h391;
              4'h2: pos_low = 10'h392;
              4'h3: pos_low = 10'h393;
              4'h4: pos_low = 10'h394;
              4'h5: pos_low = 10'h395;
              4'h6: pos_low = 10'h396;
              4'h7: pos_low = 10'h397;
              4'h8: pos_low = 10'h398;
              4'h9: pos_low = 10'h399;
              4'ha: pos_low = 10'h39a;
              4'hb: pos_low = 10'h39b;
              4'hc: pos_low = 10'h39c;
              4'hd: pos_low = 10'h39d;
              4'he: pos_low = 10'h39e;
              4'hf: pos_low = 10'h39f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h3a: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3a0;
              4'h1: pos_low = 10'h3a1;
              4'h2: pos_low = 10'h3a2;
              4'h3: pos_low = 10'h3a3;
              4'h4: pos_low = 10'h3a4;
              4'h5: pos_low = 10'h3a5;
              4'h6: pos_low = 10'h3a6;
              4'h7: pos_low = 10'h3a7;
              4'h8: pos_low = 10'h3a8;
              4'h9: pos_low = 10'h3a9;
              4'ha: pos_low = 10'h3aa;
              4'hb: pos_low = 10'h3ab;
              4'hc: pos_low = 10'h3ac;
              4'hd: pos_low = 10'h3ad;
              4'he: pos_low = 10'h3ae;
              4'hf: pos_low = 10'h3af;
              default: pos_low = 10'h000;
            endcase
          end
          6'h3b: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3b0;
              4'h1: pos_low = 10'h3b1;
              4'h2: pos_low = 10'h3b2;
              4'h3: pos_low = 10'h3b3;
              4'h4: pos_low = 10'h3b4;
              4'h5: pos_low = 10'h3b5;
              4'h6: pos_low = 10'h3b6;
              4'h7: pos_low = 10'h3b7;
              4'h8: pos_low = 10'h3b8;
              4'h9: pos_low = 10'h3b9;
              4'ha: pos_low = 10'h3ba;
              4'hb: pos_low = 10'h3bb;
              4'hc: pos_low = 10'h3bc;
              4'hd: pos_low = 10'h3bd;
              4'he: pos_low = 10'h3be;
              4'hf: pos_low = 10'h3bf;
              default: pos_low = 10'h000;
            endcase
          end
          6'h3c: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3c0;
              4'h1: pos_low = 10'h3c1;
              4'h2: pos_low = 10'h3c2;
              4'h3: pos_low = 10'h3c3;
              4'h4: pos_low = 10'h3c4;
              4'h5: pos_low = 10'h3c5;
              4'h6: pos_low = 10'h3c6;
              4'h7: pos_low = 10'h3c7;
              4'h8: pos_low = 10'h3c8;
              4'h9: pos_low = 10'h3c9;
              4'ha: pos_low = 10'h3ca;
              4'hb: pos_low = 10'h3cb;
              4'hc: pos_low = 10'h3cc;
              4'hd: pos_low = 10'h3cd;
              4'he: pos_low = 10'h3ce;
              4'hf: pos_low = 10'h3cf;
              default: pos_low = 10'h000;
            endcase
          end
          6'h3d: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3d0;
              4'h1: pos_low = 10'h3d1;
              4'h2: pos_low = 10'h3d2;
              4'h3: pos_low = 10'h3d3;
              4'h4: pos_low = 10'h3d4;
              4'h5: pos_low = 10'h3d5;
              4'h6: pos_low = 10'h3d6;
              4'h7: pos_low = 10'h3d7;
              4'h8: pos_low = 10'h3d8;
              4'h9: pos_low = 10'h3d9;
              4'ha: pos_low = 10'h3da;
              4'hb: pos_low = 10'h3db;
              4'hc: pos_low = 10'h3dc;
              4'hd: pos_low = 10'h3dd;
              4'he: pos_low = 10'h3de;
              4'hf: pos_low = 10'h3df;
              default: pos_low = 10'h000;
            endcase
          end
          6'h3e: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3e0;
              4'h1: pos_low = 10'h3e1;
              4'h2: pos_low = 10'h3e2;
              4'h3: pos_low = 10'h3e3;
              4'h4: pos_low = 10'h3e4;
              4'h5: pos_low = 10'h3e5;
              4'h6: pos_low = 10'h3e6;
              4'h7: pos_low = 10'h3e7;
              4'h8: pos_low = 10'h3e8;
              4'h9: pos_low = 10'h3e9;
              4'ha: pos_low = 10'h3ea;
              4'hb: pos_low = 10'h3eb;
              4'hc: pos_low = 10'h3ec;
              4'hd: pos_low = 10'h3ed;
              4'he: pos_low = 10'h3ee;
              4'hf: pos_low = 10'h3ef;
              default: pos_low = 10'h000;
            endcase
          end
          6'h3f: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3f0;
              4'h1: pos_low = 10'h3f1;
              4'h2: pos_low = 10'h3f2;
              4'h3: pos_low = 10'h3f3;
              4'h4: pos_low = 10'h3f4;
              4'h5: pos_low = 10'h3f5;
              4'h6: pos_low = 10'h3f6;
              4'h7: pos_low = 10'h3f7;
              4'h8: pos_low = 10'h3f8;
              4'h9: pos_low = 10'h3f9;
              4'ha: pos_low = 10'h3fa;
              4'hb: pos_low = 10'h3fb;
              4'hc: pos_low = 10'h3fc;
              4'hd: pos_low = 10'h3fd;
              4'he: pos_low = 10'h3fe;
              4'hf: pos_low = 10'h3ff;
              default: pos_low = 10'h000;
            endcase
          end
          default: begin end
        endcase
      end
      5'h06: begin
        case (mant[9:4])
          6'h00: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h000;
              4'h1: pos_low = 10'h001;
              4'h2: pos_low = 10'h002;
              4'h3: pos_low = 10'h003;
              4'h4: pos_low = 10'h004;
              4'h5: pos_low = 10'h005;
              4'h6: pos_low = 10'h006;
              4'h7: pos_low = 10'h007;
              4'h8: pos_low = 10'h008;
              4'h9: pos_low = 10'h009;
              4'ha: pos_low = 10'h00a;
              4'hb: pos_low = 10'h00b;
              4'hc: pos_low = 10'h00c;
              4'hd: pos_low = 10'h00d;
              4'he: pos_low = 10'h00e;
              4'hf: pos_low = 10'h00f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h01: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h010;
              4'h1: pos_low = 10'h011;
              4'h2: pos_low = 10'h012;
              4'h3: pos_low = 10'h013;
              4'h4: pos_low = 10'h014;
              4'h5: pos_low = 10'h015;
              4'h6: pos_low = 10'h016;
              4'h7: pos_low = 10'h017;
              4'h8: pos_low = 10'h018;
              4'h9: pos_low = 10'h019;
              4'ha: pos_low = 10'h01a;
              4'hb: pos_low = 10'h01b;
              4'hc: pos_low = 10'h01c;
              4'hd: pos_low = 10'h01d;
              4'he: pos_low = 10'h01e;
              4'hf: pos_low = 10'h01f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h02: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h020;
              4'h1: pos_low = 10'h021;
              4'h2: pos_low = 10'h022;
              4'h3: pos_low = 10'h023;
              4'h4: pos_low = 10'h024;
              4'h5: pos_low = 10'h025;
              4'h6: pos_low = 10'h026;
              4'h7: pos_low = 10'h027;
              4'h8: pos_low = 10'h028;
              4'h9: pos_low = 10'h029;
              4'ha: pos_low = 10'h02a;
              4'hb: pos_low = 10'h02b;
              4'hc: pos_low = 10'h02c;
              4'hd: pos_low = 10'h02d;
              4'he: pos_low = 10'h02e;
              4'hf: pos_low = 10'h02f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h03: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h030;
              4'h1: pos_low = 10'h031;
              4'h2: pos_low = 10'h032;
              4'h3: pos_low = 10'h033;
              4'h4: pos_low = 10'h034;
              4'h5: pos_low = 10'h035;
              4'h6: pos_low = 10'h036;
              4'h7: pos_low = 10'h037;
              4'h8: pos_low = 10'h038;
              4'h9: pos_low = 10'h039;
              4'ha: pos_low = 10'h03a;
              4'hb: pos_low = 10'h03b;
              4'hc: pos_low = 10'h03c;
              4'hd: pos_low = 10'h03d;
              4'he: pos_low = 10'h03e;
              4'hf: pos_low = 10'h03f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h04: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h040;
              4'h1: pos_low = 10'h041;
              4'h2: pos_low = 10'h042;
              4'h3: pos_low = 10'h043;
              4'h4: pos_low = 10'h044;
              4'h5: pos_low = 10'h045;
              4'h6: pos_low = 10'h046;
              4'h7: pos_low = 10'h047;
              4'h8: pos_low = 10'h048;
              4'h9: pos_low = 10'h049;
              4'ha: pos_low = 10'h04a;
              4'hb: pos_low = 10'h04b;
              4'hc: pos_low = 10'h04c;
              4'hd: pos_low = 10'h04d;
              4'he: pos_low = 10'h04e;
              4'hf: pos_low = 10'h04f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h05: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h050;
              4'h1: pos_low = 10'h051;
              4'h2: pos_low = 10'h052;
              4'h3: pos_low = 10'h053;
              4'h4: pos_low = 10'h054;
              4'h5: pos_low = 10'h055;
              4'h6: pos_low = 10'h056;
              4'h7: pos_low = 10'h057;
              4'h8: pos_low = 10'h058;
              4'h9: pos_low = 10'h059;
              4'ha: pos_low = 10'h05a;
              4'hb: pos_low = 10'h05b;
              4'hc: pos_low = 10'h05c;
              4'hd: pos_low = 10'h05d;
              4'he: pos_low = 10'h05e;
              4'hf: pos_low = 10'h05f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h06: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h060;
              4'h1: pos_low = 10'h061;
              4'h2: pos_low = 10'h062;
              4'h3: pos_low = 10'h063;
              4'h4: pos_low = 10'h064;
              4'h5: pos_low = 10'h065;
              4'h6: pos_low = 10'h066;
              4'h7: pos_low = 10'h067;
              4'h8: pos_low = 10'h068;
              4'h9: pos_low = 10'h069;
              4'ha: pos_low = 10'h06a;
              4'hb: pos_low = 10'h06b;
              4'hc: pos_low = 10'h06c;
              4'hd: pos_low = 10'h06d;
              4'he: pos_low = 10'h06e;
              4'hf: pos_low = 10'h06f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h07: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h070;
              4'h1: pos_low = 10'h071;
              4'h2: pos_low = 10'h072;
              4'h3: pos_low = 10'h073;
              4'h4: pos_low = 10'h074;
              4'h5: pos_low = 10'h075;
              4'h6: pos_low = 10'h076;
              4'h7: pos_low = 10'h077;
              4'h8: pos_low = 10'h078;
              4'h9: pos_low = 10'h079;
              4'ha: pos_low = 10'h07a;
              4'hb: pos_low = 10'h07b;
              4'hc: pos_low = 10'h07c;
              4'hd: pos_low = 10'h07d;
              4'he: pos_low = 10'h07e;
              4'hf: pos_low = 10'h07f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h08: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h080;
              4'h1: pos_low = 10'h081;
              4'h2: pos_low = 10'h082;
              4'h3: pos_low = 10'h083;
              4'h4: pos_low = 10'h084;
              4'h5: pos_low = 10'h085;
              4'h6: pos_low = 10'h086;
              4'h7: pos_low = 10'h087;
              4'h8: pos_low = 10'h088;
              4'h9: pos_low = 10'h089;
              4'ha: pos_low = 10'h08a;
              4'hb: pos_low = 10'h08b;
              4'hc: pos_low = 10'h08c;
              4'hd: pos_low = 10'h08d;
              4'he: pos_low = 10'h08e;
              4'hf: pos_low = 10'h08f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h09: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h090;
              4'h1: pos_low = 10'h091;
              4'h2: pos_low = 10'h092;
              4'h3: pos_low = 10'h093;
              4'h4: pos_low = 10'h094;
              4'h5: pos_low = 10'h095;
              4'h6: pos_low = 10'h096;
              4'h7: pos_low = 10'h097;
              4'h8: pos_low = 10'h098;
              4'h9: pos_low = 10'h099;
              4'ha: pos_low = 10'h09a;
              4'hb: pos_low = 10'h09b;
              4'hc: pos_low = 10'h09c;
              4'hd: pos_low = 10'h09d;
              4'he: pos_low = 10'h09e;
              4'hf: pos_low = 10'h09f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h0a: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h0a0;
              4'h1: pos_low = 10'h0a1;
              4'h2: pos_low = 10'h0a2;
              4'h3: pos_low = 10'h0a3;
              4'h4: pos_low = 10'h0a4;
              4'h5: pos_low = 10'h0a5;
              4'h6: pos_low = 10'h0a6;
              4'h7: pos_low = 10'h0a7;
              4'h8: pos_low = 10'h0a8;
              4'h9: pos_low = 10'h0a9;
              4'ha: pos_low = 10'h0aa;
              4'hb: pos_low = 10'h0ab;
              4'hc: pos_low = 10'h0ac;
              4'hd: pos_low = 10'h0ad;
              4'he: pos_low = 10'h0ae;
              4'hf: pos_low = 10'h0af;
              default: pos_low = 10'h000;
            endcase
          end
          6'h0b: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h0b0;
              4'h1: pos_low = 10'h0b1;
              4'h2: pos_low = 10'h0b2;
              4'h3: pos_low = 10'h0b3;
              4'h4: pos_low = 10'h0b4;
              4'h5: pos_low = 10'h0b5;
              4'h6: pos_low = 10'h0b6;
              4'h7: pos_low = 10'h0b7;
              4'h8: pos_low = 10'h0b8;
              4'h9: pos_low = 10'h0b9;
              4'ha: pos_low = 10'h0ba;
              4'hb: pos_low = 10'h0bb;
              4'hc: pos_low = 10'h0bc;
              4'hd: pos_low = 10'h0bd;
              4'he: pos_low = 10'h0be;
              4'hf: pos_low = 10'h0bf;
              default: pos_low = 10'h000;
            endcase
          end
          6'h0c: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h0c0;
              4'h1: pos_low = 10'h0c1;
              4'h2: pos_low = 10'h0c2;
              4'h3: pos_low = 10'h0c3;
              4'h4: pos_low = 10'h0c4;
              4'h5: pos_low = 10'h0c5;
              4'h6: pos_low = 10'h0c6;
              4'h7: pos_low = 10'h0c7;
              4'h8: pos_low = 10'h0c8;
              4'h9: pos_low = 10'h0c9;
              4'ha: pos_low = 10'h0ca;
              4'hb: pos_low = 10'h0cb;
              4'hc: pos_low = 10'h0cc;
              4'hd: pos_low = 10'h0cd;
              4'he: pos_low = 10'h0ce;
              4'hf: pos_low = 10'h0cf;
              default: pos_low = 10'h000;
            endcase
          end
          6'h0d: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h0d0;
              4'h1: pos_low = 10'h0d1;
              4'h2: pos_low = 10'h0d2;
              4'h3: pos_low = 10'h0d3;
              4'h4: pos_low = 10'h0d4;
              4'h5: pos_low = 10'h0d5;
              4'h6: pos_low = 10'h0d6;
              4'h7: pos_low = 10'h0d7;
              4'h8: pos_low = 10'h0d8;
              4'h9: pos_low = 10'h0d9;
              4'ha: pos_low = 10'h0da;
              4'hb: pos_low = 10'h0db;
              4'hc: pos_low = 10'h0dc;
              4'hd: pos_low = 10'h0dd;
              4'he: pos_low = 10'h0de;
              4'hf: pos_low = 10'h0df;
              default: pos_low = 10'h000;
            endcase
          end
          6'h0e: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h0e0;
              4'h1: pos_low = 10'h0e1;
              4'h2: pos_low = 10'h0e2;
              4'h3: pos_low = 10'h0e3;
              4'h4: pos_low = 10'h0e4;
              4'h5: pos_low = 10'h0e5;
              4'h6: pos_low = 10'h0e6;
              4'h7: pos_low = 10'h0e7;
              4'h8: pos_low = 10'h0e8;
              4'h9: pos_low = 10'h0e9;
              4'ha: pos_low = 10'h0ea;
              4'hb: pos_low = 10'h0eb;
              4'hc: pos_low = 10'h0ec;
              4'hd: pos_low = 10'h0ed;
              4'he: pos_low = 10'h0ee;
              4'hf: pos_low = 10'h0ef;
              default: pos_low = 10'h000;
            endcase
          end
          6'h0f: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h0f0;
              4'h1: pos_low = 10'h0f1;
              4'h2: pos_low = 10'h0f2;
              4'h3: pos_low = 10'h0f3;
              4'h4: pos_low = 10'h0f4;
              4'h5: pos_low = 10'h0f5;
              4'h6: pos_low = 10'h0f6;
              4'h7: pos_low = 10'h0f7;
              4'h8: pos_low = 10'h0f8;
              4'h9: pos_low = 10'h0f9;
              4'ha: pos_low = 10'h0fa;
              4'hb: pos_low = 10'h0fb;
              4'hc: pos_low = 10'h0fc;
              4'hd: pos_low = 10'h0fd;
              4'he: pos_low = 10'h0fe;
              4'hf: pos_low = 10'h0ff;
              default: pos_low = 10'h000;
            endcase
          end
          6'h10: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h100;
              4'h1: pos_low = 10'h101;
              4'h2: pos_low = 10'h102;
              4'h3: pos_low = 10'h103;
              4'h4: pos_low = 10'h104;
              4'h5: pos_low = 10'h105;
              4'h6: pos_low = 10'h106;
              4'h7: pos_low = 10'h107;
              4'h8: pos_low = 10'h108;
              4'h9: pos_low = 10'h109;
              4'ha: pos_low = 10'h10a;
              4'hb: pos_low = 10'h10b;
              4'hc: pos_low = 10'h10c;
              4'hd: pos_low = 10'h10d;
              4'he: pos_low = 10'h10e;
              4'hf: pos_low = 10'h10f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h11: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h110;
              4'h1: pos_low = 10'h111;
              4'h2: pos_low = 10'h112;
              4'h3: pos_low = 10'h113;
              4'h4: pos_low = 10'h114;
              4'h5: pos_low = 10'h115;
              4'h6: pos_low = 10'h116;
              4'h7: pos_low = 10'h117;
              4'h8: pos_low = 10'h118;
              4'h9: pos_low = 10'h119;
              4'ha: pos_low = 10'h11a;
              4'hb: pos_low = 10'h11b;
              4'hc: pos_low = 10'h11c;
              4'hd: pos_low = 10'h11d;
              4'he: pos_low = 10'h11e;
              4'hf: pos_low = 10'h11f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h12: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h120;
              4'h1: pos_low = 10'h121;
              4'h2: pos_low = 10'h122;
              4'h3: pos_low = 10'h123;
              4'h4: pos_low = 10'h124;
              4'h5: pos_low = 10'h125;
              4'h6: pos_low = 10'h126;
              4'h7: pos_low = 10'h127;
              4'h8: pos_low = 10'h128;
              4'h9: pos_low = 10'h129;
              4'ha: pos_low = 10'h12a;
              4'hb: pos_low = 10'h12b;
              4'hc: pos_low = 10'h12c;
              4'hd: pos_low = 10'h12d;
              4'he: pos_low = 10'h12e;
              4'hf: pos_low = 10'h12f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h13: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h130;
              4'h1: pos_low = 10'h131;
              4'h2: pos_low = 10'h132;
              4'h3: pos_low = 10'h133;
              4'h4: pos_low = 10'h134;
              4'h5: pos_low = 10'h135;
              4'h6: pos_low = 10'h136;
              4'h7: pos_low = 10'h137;
              4'h8: pos_low = 10'h138;
              4'h9: pos_low = 10'h139;
              4'ha: pos_low = 10'h13a;
              4'hb: pos_low = 10'h13b;
              4'hc: pos_low = 10'h13c;
              4'hd: pos_low = 10'h13d;
              4'he: pos_low = 10'h13e;
              4'hf: pos_low = 10'h13f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h14: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h140;
              4'h1: pos_low = 10'h141;
              4'h2: pos_low = 10'h142;
              4'h3: pos_low = 10'h143;
              4'h4: pos_low = 10'h144;
              4'h5: pos_low = 10'h145;
              4'h6: pos_low = 10'h146;
              4'h7: pos_low = 10'h147;
              4'h8: pos_low = 10'h148;
              4'h9: pos_low = 10'h149;
              4'ha: pos_low = 10'h14a;
              4'hb: pos_low = 10'h14b;
              4'hc: pos_low = 10'h14c;
              4'hd: pos_low = 10'h14d;
              4'he: pos_low = 10'h14e;
              4'hf: pos_low = 10'h14f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h15: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h150;
              4'h1: pos_low = 10'h151;
              4'h2: pos_low = 10'h152;
              4'h3: pos_low = 10'h153;
              4'h4: pos_low = 10'h154;
              4'h5: pos_low = 10'h155;
              4'h6: pos_low = 10'h156;
              4'h7: pos_low = 10'h157;
              4'h8: pos_low = 10'h158;
              4'h9: pos_low = 10'h159;
              4'ha: pos_low = 10'h15a;
              4'hb: pos_low = 10'h15b;
              4'hc: pos_low = 10'h15c;
              4'hd: pos_low = 10'h15d;
              4'he: pos_low = 10'h15e;
              4'hf: pos_low = 10'h15f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h16: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h160;
              4'h1: pos_low = 10'h161;
              4'h2: pos_low = 10'h162;
              4'h3: pos_low = 10'h163;
              4'h4: pos_low = 10'h164;
              4'h5: pos_low = 10'h165;
              4'h6: pos_low = 10'h166;
              4'h7: pos_low = 10'h167;
              4'h8: pos_low = 10'h168;
              4'h9: pos_low = 10'h169;
              4'ha: pos_low = 10'h16a;
              4'hb: pos_low = 10'h16b;
              4'hc: pos_low = 10'h16c;
              4'hd: pos_low = 10'h16d;
              4'he: pos_low = 10'h16e;
              4'hf: pos_low = 10'h16f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h17: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h170;
              4'h1: pos_low = 10'h171;
              4'h2: pos_low = 10'h172;
              4'h3: pos_low = 10'h173;
              4'h4: pos_low = 10'h174;
              4'h5: pos_low = 10'h175;
              4'h6: pos_low = 10'h176;
              4'h7: pos_low = 10'h177;
              4'h8: pos_low = 10'h178;
              4'h9: pos_low = 10'h179;
              4'ha: pos_low = 10'h17a;
              4'hb: pos_low = 10'h17b;
              4'hc: pos_low = 10'h17c;
              4'hd: pos_low = 10'h17d;
              4'he: pos_low = 10'h17e;
              4'hf: pos_low = 10'h17f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h18: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h180;
              4'h1: pos_low = 10'h181;
              4'h2: pos_low = 10'h182;
              4'h3: pos_low = 10'h183;
              4'h4: pos_low = 10'h184;
              4'h5: pos_low = 10'h185;
              4'h6: pos_low = 10'h186;
              4'h7: pos_low = 10'h187;
              4'h8: pos_low = 10'h188;
              4'h9: pos_low = 10'h189;
              4'ha: pos_low = 10'h18a;
              4'hb: pos_low = 10'h18b;
              4'hc: pos_low = 10'h18c;
              4'hd: pos_low = 10'h18d;
              4'he: pos_low = 10'h18e;
              4'hf: pos_low = 10'h18f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h19: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h190;
              4'h1: pos_low = 10'h191;
              4'h2: pos_low = 10'h192;
              4'h3: pos_low = 10'h193;
              4'h4: pos_low = 10'h194;
              4'h5: pos_low = 10'h195;
              4'h6: pos_low = 10'h196;
              4'h7: pos_low = 10'h197;
              4'h8: pos_low = 10'h198;
              4'h9: pos_low = 10'h199;
              4'ha: pos_low = 10'h19a;
              4'hb: pos_low = 10'h19b;
              4'hc: pos_low = 10'h19c;
              4'hd: pos_low = 10'h19d;
              4'he: pos_low = 10'h19e;
              4'hf: pos_low = 10'h19f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h1a: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h1a0;
              4'h1: pos_low = 10'h1a1;
              4'h2: pos_low = 10'h1a2;
              4'h3: pos_low = 10'h1a3;
              4'h4: pos_low = 10'h1a4;
              4'h5: pos_low = 10'h1a5;
              4'h6: pos_low = 10'h1a6;
              4'h7: pos_low = 10'h1a7;
              4'h8: pos_low = 10'h1a8;
              4'h9: pos_low = 10'h1a9;
              4'ha: pos_low = 10'h1aa;
              4'hb: pos_low = 10'h1ab;
              4'hc: pos_low = 10'h1ac;
              4'hd: pos_low = 10'h1ad;
              4'he: pos_low = 10'h1ae;
              4'hf: pos_low = 10'h1af;
              default: pos_low = 10'h000;
            endcase
          end
          6'h1b: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h1b0;
              4'h1: pos_low = 10'h1b1;
              4'h2: pos_low = 10'h1b2;
              4'h3: pos_low = 10'h1b3;
              4'h4: pos_low = 10'h1b4;
              4'h5: pos_low = 10'h1b5;
              4'h6: pos_low = 10'h1b6;
              4'h7: pos_low = 10'h1b7;
              4'h8: pos_low = 10'h1b8;
              4'h9: pos_low = 10'h1b9;
              4'ha: pos_low = 10'h1ba;
              4'hb: pos_low = 10'h1bb;
              4'hc: pos_low = 10'h1bc;
              4'hd: pos_low = 10'h1bd;
              4'he: pos_low = 10'h1be;
              4'hf: pos_low = 10'h1bf;
              default: pos_low = 10'h000;
            endcase
          end
          6'h1c: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h1c0;
              4'h1: pos_low = 10'h1c1;
              4'h2: pos_low = 10'h1c2;
              4'h3: pos_low = 10'h1c3;
              4'h4: pos_low = 10'h1c4;
              4'h5: pos_low = 10'h1c5;
              4'h6: pos_low = 10'h1c6;
              4'h7: pos_low = 10'h1c7;
              4'h8: pos_low = 10'h1c8;
              4'h9: pos_low = 10'h1c9;
              4'ha: pos_low = 10'h1ca;
              4'hb: pos_low = 10'h1cb;
              4'hc: pos_low = 10'h1cc;
              4'hd: pos_low = 10'h1cd;
              4'he: pos_low = 10'h1ce;
              4'hf: pos_low = 10'h1cf;
              default: pos_low = 10'h000;
            endcase
          end
          6'h1d: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h1d0;
              4'h1: pos_low = 10'h1d1;
              4'h2: pos_low = 10'h1d2;
              4'h3: pos_low = 10'h1d3;
              4'h4: pos_low = 10'h1d4;
              4'h5: pos_low = 10'h1d5;
              4'h6: pos_low = 10'h1d6;
              4'h7: pos_low = 10'h1d7;
              4'h8: pos_low = 10'h1d8;
              4'h9: pos_low = 10'h1d9;
              4'ha: pos_low = 10'h1da;
              4'hb: pos_low = 10'h1db;
              4'hc: pos_low = 10'h1dc;
              4'hd: pos_low = 10'h1dd;
              4'he: pos_low = 10'h1de;
              4'hf: pos_low = 10'h1df;
              default: pos_low = 10'h000;
            endcase
          end
          6'h1e: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h1e0;
              4'h1: pos_low = 10'h1e1;
              4'h2: pos_low = 10'h1e2;
              4'h3: pos_low = 10'h1e3;
              4'h4: pos_low = 10'h1e4;
              4'h5: pos_low = 10'h1e5;
              4'h6: pos_low = 10'h1e6;
              4'h7: pos_low = 10'h1e7;
              4'h8: pos_low = 10'h1e8;
              4'h9: pos_low = 10'h1e9;
              4'ha: pos_low = 10'h1ea;
              4'hb: pos_low = 10'h1eb;
              4'hc: pos_low = 10'h1ec;
              4'hd: pos_low = 10'h1ed;
              4'he: pos_low = 10'h1ee;
              4'hf: pos_low = 10'h1ef;
              default: pos_low = 10'h000;
            endcase
          end
          6'h1f: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h1f0;
              4'h1: pos_low = 10'h1f1;
              4'h2: pos_low = 10'h1f2;
              4'h3: pos_low = 10'h1f3;
              4'h4: pos_low = 10'h1f4;
              4'h5: pos_low = 10'h1f5;
              4'h6: pos_low = 10'h1f6;
              4'h7: pos_low = 10'h1f7;
              4'h8: pos_low = 10'h1f8;
              4'h9: pos_low = 10'h1f9;
              4'ha: pos_low = 10'h1fa;
              4'hb: pos_low = 10'h1fb;
              4'hc: pos_low = 10'h1fc;
              4'hd: pos_low = 10'h1fd;
              4'he: pos_low = 10'h1fe;
              4'hf: pos_low = 10'h1ff;
              default: pos_low = 10'h000;
            endcase
          end
          6'h20: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h200;
              4'h1: pos_low = 10'h201;
              4'h2: pos_low = 10'h202;
              4'h3: pos_low = 10'h203;
              4'h4: pos_low = 10'h204;
              4'h5: pos_low = 10'h205;
              4'h6: pos_low = 10'h206;
              4'h7: pos_low = 10'h207;
              4'h8: pos_low = 10'h208;
              4'h9: pos_low = 10'h209;
              4'ha: pos_low = 10'h20a;
              4'hb: pos_low = 10'h20b;
              4'hc: pos_low = 10'h20c;
              4'hd: pos_low = 10'h20d;
              4'he: pos_low = 10'h20e;
              4'hf: pos_low = 10'h20f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h21: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h210;
              4'h1: pos_low = 10'h211;
              4'h2: pos_low = 10'h212;
              4'h3: pos_low = 10'h213;
              4'h4: pos_low = 10'h214;
              4'h5: pos_low = 10'h215;
              4'h6: pos_low = 10'h216;
              4'h7: pos_low = 10'h217;
              4'h8: pos_low = 10'h218;
              4'h9: pos_low = 10'h219;
              4'ha: pos_low = 10'h21a;
              4'hb: pos_low = 10'h21b;
              4'hc: pos_low = 10'h21c;
              4'hd: pos_low = 10'h21d;
              4'he: pos_low = 10'h21e;
              4'hf: pos_low = 10'h21f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h22: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h220;
              4'h1: pos_low = 10'h221;
              4'h2: pos_low = 10'h222;
              4'h3: pos_low = 10'h223;
              4'h4: pos_low = 10'h224;
              4'h5: pos_low = 10'h225;
              4'h6: pos_low = 10'h226;
              4'h7: pos_low = 10'h227;
              4'h8: pos_low = 10'h228;
              4'h9: pos_low = 10'h229;
              4'ha: pos_low = 10'h22a;
              4'hb: pos_low = 10'h22b;
              4'hc: pos_low = 10'h22c;
              4'hd: pos_low = 10'h22d;
              4'he: pos_low = 10'h22e;
              4'hf: pos_low = 10'h22f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h23: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h230;
              4'h1: pos_low = 10'h231;
              4'h2: pos_low = 10'h232;
              4'h3: pos_low = 10'h233;
              4'h4: pos_low = 10'h234;
              4'h5: pos_low = 10'h235;
              4'h6: pos_low = 10'h236;
              4'h7: pos_low = 10'h237;
              4'h8: pos_low = 10'h238;
              4'h9: pos_low = 10'h239;
              4'ha: pos_low = 10'h23a;
              4'hb: pos_low = 10'h23b;
              4'hc: pos_low = 10'h23c;
              4'hd: pos_low = 10'h23d;
              4'he: pos_low = 10'h23e;
              4'hf: pos_low = 10'h23f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h24: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h240;
              4'h1: pos_low = 10'h241;
              4'h2: pos_low = 10'h242;
              4'h3: pos_low = 10'h243;
              4'h4: pos_low = 10'h244;
              4'h5: pos_low = 10'h245;
              4'h6: pos_low = 10'h246;
              4'h7: pos_low = 10'h247;
              4'h8: pos_low = 10'h248;
              4'h9: pos_low = 10'h249;
              4'ha: pos_low = 10'h24a;
              4'hb: pos_low = 10'h24b;
              4'hc: pos_low = 10'h24c;
              4'hd: pos_low = 10'h24d;
              4'he: pos_low = 10'h24e;
              4'hf: pos_low = 10'h24f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h25: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h250;
              4'h1: pos_low = 10'h251;
              4'h2: pos_low = 10'h252;
              4'h3: pos_low = 10'h253;
              4'h4: pos_low = 10'h254;
              4'h5: pos_low = 10'h255;
              4'h6: pos_low = 10'h256;
              4'h7: pos_low = 10'h257;
              4'h8: pos_low = 10'h258;
              4'h9: pos_low = 10'h259;
              4'ha: pos_low = 10'h25a;
              4'hb: pos_low = 10'h25b;
              4'hc: pos_low = 10'h25c;
              4'hd: pos_low = 10'h25d;
              4'he: pos_low = 10'h25e;
              4'hf: pos_low = 10'h25f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h26: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h260;
              4'h1: pos_low = 10'h261;
              4'h2: pos_low = 10'h262;
              4'h3: pos_low = 10'h263;
              4'h4: pos_low = 10'h264;
              4'h5: pos_low = 10'h265;
              4'h6: pos_low = 10'h266;
              4'h7: pos_low = 10'h267;
              4'h8: pos_low = 10'h268;
              4'h9: pos_low = 10'h269;
              4'ha: pos_low = 10'h26a;
              4'hb: pos_low = 10'h26b;
              4'hc: pos_low = 10'h26c;
              4'hd: pos_low = 10'h26d;
              4'he: pos_low = 10'h26e;
              4'hf: pos_low = 10'h26f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h27: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h270;
              4'h1: pos_low = 10'h271;
              4'h2: pos_low = 10'h272;
              4'h3: pos_low = 10'h273;
              4'h4: pos_low = 10'h274;
              4'h5: pos_low = 10'h275;
              4'h6: pos_low = 10'h276;
              4'h7: pos_low = 10'h277;
              4'h8: pos_low = 10'h278;
              4'h9: pos_low = 10'h279;
              4'ha: pos_low = 10'h27a;
              4'hb: pos_low = 10'h27b;
              4'hc: pos_low = 10'h27c;
              4'hd: pos_low = 10'h27d;
              4'he: pos_low = 10'h27e;
              4'hf: pos_low = 10'h27f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h28: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h280;
              4'h1: pos_low = 10'h281;
              4'h2: pos_low = 10'h282;
              4'h3: pos_low = 10'h283;
              4'h4: pos_low = 10'h284;
              4'h5: pos_low = 10'h285;
              4'h6: pos_low = 10'h286;
              4'h7: pos_low = 10'h287;
              4'h8: pos_low = 10'h288;
              4'h9: pos_low = 10'h289;
              4'ha: pos_low = 10'h28a;
              4'hb: pos_low = 10'h28b;
              4'hc: pos_low = 10'h28c;
              4'hd: pos_low = 10'h28d;
              4'he: pos_low = 10'h28e;
              4'hf: pos_low = 10'h28f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h29: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h290;
              4'h1: pos_low = 10'h291;
              4'h2: pos_low = 10'h292;
              4'h3: pos_low = 10'h293;
              4'h4: pos_low = 10'h294;
              4'h5: pos_low = 10'h295;
              4'h6: pos_low = 10'h296;
              4'h7: pos_low = 10'h297;
              4'h8: pos_low = 10'h298;
              4'h9: pos_low = 10'h299;
              4'ha: pos_low = 10'h29a;
              4'hb: pos_low = 10'h29b;
              4'hc: pos_low = 10'h29c;
              4'hd: pos_low = 10'h29d;
              4'he: pos_low = 10'h29e;
              4'hf: pos_low = 10'h29f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h2a: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h2a0;
              4'h1: pos_low = 10'h2a1;
              4'h2: pos_low = 10'h2a2;
              4'h3: pos_low = 10'h2a3;
              4'h4: pos_low = 10'h2a4;
              4'h5: pos_low = 10'h2a5;
              4'h6: pos_low = 10'h2a6;
              4'h7: pos_low = 10'h2a7;
              4'h8: pos_low = 10'h2a8;
              4'h9: pos_low = 10'h2a9;
              4'ha: pos_low = 10'h2aa;
              4'hb: pos_low = 10'h2ab;
              4'hc: pos_low = 10'h2ac;
              4'hd: pos_low = 10'h2ad;
              4'he: pos_low = 10'h2ae;
              4'hf: pos_low = 10'h2af;
              default: pos_low = 10'h000;
            endcase
          end
          6'h2b: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h2b0;
              4'h1: pos_low = 10'h2b1;
              4'h2: pos_low = 10'h2b2;
              4'h3: pos_low = 10'h2b3;
              4'h4: pos_low = 10'h2b4;
              4'h5: pos_low = 10'h2b5;
              4'h6: pos_low = 10'h2b6;
              4'h7: pos_low = 10'h2b7;
              4'h8: pos_low = 10'h2b8;
              4'h9: pos_low = 10'h2b9;
              4'ha: pos_low = 10'h2ba;
              4'hb: pos_low = 10'h2bb;
              4'hc: pos_low = 10'h2bc;
              4'hd: pos_low = 10'h2bd;
              4'he: pos_low = 10'h2be;
              4'hf: pos_low = 10'h2bf;
              default: pos_low = 10'h000;
            endcase
          end
          6'h2c: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h2c0;
              4'h1: pos_low = 10'h2c1;
              4'h2: pos_low = 10'h2c2;
              4'h3: pos_low = 10'h2c3;
              4'h4: pos_low = 10'h2c4;
              4'h5: pos_low = 10'h2c5;
              4'h6: pos_low = 10'h2c6;
              4'h7: pos_low = 10'h2c7;
              4'h8: pos_low = 10'h2c8;
              4'h9: pos_low = 10'h2c9;
              4'ha: pos_low = 10'h2ca;
              4'hb: pos_low = 10'h2cb;
              4'hc: pos_low = 10'h2cc;
              4'hd: pos_low = 10'h2cd;
              4'he: pos_low = 10'h2ce;
              4'hf: pos_low = 10'h2cf;
              default: pos_low = 10'h000;
            endcase
          end
          6'h2d: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h2d0;
              4'h1: pos_low = 10'h2d1;
              4'h2: pos_low = 10'h2d2;
              4'h3: pos_low = 10'h2d3;
              4'h4: pos_low = 10'h2d4;
              4'h5: pos_low = 10'h2d5;
              4'h6: pos_low = 10'h2d6;
              4'h7: pos_low = 10'h2d7;
              4'h8: pos_low = 10'h2d8;
              4'h9: pos_low = 10'h2d9;
              4'ha: pos_low = 10'h2da;
              4'hb: pos_low = 10'h2db;
              4'hc: pos_low = 10'h2dc;
              4'hd: pos_low = 10'h2dd;
              4'he: pos_low = 10'h2de;
              4'hf: pos_low = 10'h2df;
              default: pos_low = 10'h000;
            endcase
          end
          6'h2e: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h2e0;
              4'h1: pos_low = 10'h2e1;
              4'h2: pos_low = 10'h2e2;
              4'h3: pos_low = 10'h2e3;
              4'h4: pos_low = 10'h2e4;
              4'h5: pos_low = 10'h2e5;
              4'h6: pos_low = 10'h2e6;
              4'h7: pos_low = 10'h2e7;
              4'h8: pos_low = 10'h2e8;
              4'h9: pos_low = 10'h2e9;
              4'ha: pos_low = 10'h2ea;
              4'hb: pos_low = 10'h2eb;
              4'hc: pos_low = 10'h2ec;
              4'hd: pos_low = 10'h2ed;
              4'he: pos_low = 10'h2ee;
              4'hf: pos_low = 10'h2ef;
              default: pos_low = 10'h000;
            endcase
          end
          6'h2f: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h2f0;
              4'h1: pos_low = 10'h2f1;
              4'h2: pos_low = 10'h2f2;
              4'h3: pos_low = 10'h2f3;
              4'h4: pos_low = 10'h2f4;
              4'h5: pos_low = 10'h2f5;
              4'h6: pos_low = 10'h2f6;
              4'h7: pos_low = 10'h2f7;
              4'h8: pos_low = 10'h2f8;
              4'h9: pos_low = 10'h2f9;
              4'ha: pos_low = 10'h2fa;
              4'hb: pos_low = 10'h2fb;
              4'hc: pos_low = 10'h2fc;
              4'hd: pos_low = 10'h2fd;
              4'he: pos_low = 10'h2fe;
              4'hf: pos_low = 10'h2ff;
              default: pos_low = 10'h000;
            endcase
          end
          6'h30: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h300;
              4'h1: pos_low = 10'h301;
              4'h2: pos_low = 10'h302;
              4'h3: pos_low = 10'h303;
              4'h4: pos_low = 10'h304;
              4'h5: pos_low = 10'h305;
              4'h6: pos_low = 10'h306;
              4'h7: pos_low = 10'h307;
              4'h8: pos_low = 10'h308;
              4'h9: pos_low = 10'h309;
              4'ha: pos_low = 10'h30a;
              4'hb: pos_low = 10'h30b;
              4'hc: pos_low = 10'h30c;
              4'hd: pos_low = 10'h30d;
              4'he: pos_low = 10'h30e;
              4'hf: pos_low = 10'h30f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h31: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h310;
              4'h1: pos_low = 10'h311;
              4'h2: pos_low = 10'h312;
              4'h3: pos_low = 10'h313;
              4'h4: pos_low = 10'h314;
              4'h5: pos_low = 10'h315;
              4'h6: pos_low = 10'h316;
              4'h7: pos_low = 10'h317;
              4'h8: pos_low = 10'h318;
              4'h9: pos_low = 10'h319;
              4'ha: pos_low = 10'h31a;
              4'hb: pos_low = 10'h31b;
              4'hc: pos_low = 10'h31c;
              4'hd: pos_low = 10'h31d;
              4'he: pos_low = 10'h31e;
              4'hf: pos_low = 10'h31f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h32: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h320;
              4'h1: pos_low = 10'h321;
              4'h2: pos_low = 10'h322;
              4'h3: pos_low = 10'h323;
              4'h4: pos_low = 10'h324;
              4'h5: pos_low = 10'h325;
              4'h6: pos_low = 10'h326;
              4'h7: pos_low = 10'h327;
              4'h8: pos_low = 10'h328;
              4'h9: pos_low = 10'h329;
              4'ha: pos_low = 10'h32a;
              4'hb: pos_low = 10'h32b;
              4'hc: pos_low = 10'h32c;
              4'hd: pos_low = 10'h32d;
              4'he: pos_low = 10'h32e;
              4'hf: pos_low = 10'h32f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h33: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h330;
              4'h1: pos_low = 10'h331;
              4'h2: pos_low = 10'h332;
              4'h3: pos_low = 10'h333;
              4'h4: pos_low = 10'h334;
              4'h5: pos_low = 10'h335;
              4'h6: pos_low = 10'h336;
              4'h7: pos_low = 10'h337;
              4'h8: pos_low = 10'h338;
              4'h9: pos_low = 10'h339;
              4'ha: pos_low = 10'h33a;
              4'hb: pos_low = 10'h33b;
              4'hc: pos_low = 10'h33c;
              4'hd: pos_low = 10'h33d;
              4'he: pos_low = 10'h33e;
              4'hf: pos_low = 10'h33f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h34: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h340;
              4'h1: pos_low = 10'h341;
              4'h2: pos_low = 10'h342;
              4'h3: pos_low = 10'h343;
              4'h4: pos_low = 10'h344;
              4'h5: pos_low = 10'h345;
              4'h6: pos_low = 10'h346;
              4'h7: pos_low = 10'h347;
              4'h8: pos_low = 10'h348;
              4'h9: pos_low = 10'h349;
              4'ha: pos_low = 10'h34a;
              4'hb: pos_low = 10'h34b;
              4'hc: pos_low = 10'h34c;
              4'hd: pos_low = 10'h34d;
              4'he: pos_low = 10'h34e;
              4'hf: pos_low = 10'h34f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h35: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h350;
              4'h1: pos_low = 10'h351;
              4'h2: pos_low = 10'h352;
              4'h3: pos_low = 10'h353;
              4'h4: pos_low = 10'h354;
              4'h5: pos_low = 10'h355;
              4'h6: pos_low = 10'h356;
              4'h7: pos_low = 10'h357;
              4'h8: pos_low = 10'h358;
              4'h9: pos_low = 10'h359;
              4'ha: pos_low = 10'h35a;
              4'hb: pos_low = 10'h35b;
              4'hc: pos_low = 10'h35c;
              4'hd: pos_low = 10'h35d;
              4'he: pos_low = 10'h35e;
              4'hf: pos_low = 10'h35f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h36: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h360;
              4'h1: pos_low = 10'h361;
              4'h2: pos_low = 10'h362;
              4'h3: pos_low = 10'h363;
              4'h4: pos_low = 10'h364;
              4'h5: pos_low = 10'h365;
              4'h6: pos_low = 10'h366;
              4'h7: pos_low = 10'h367;
              4'h8: pos_low = 10'h368;
              4'h9: pos_low = 10'h369;
              4'ha: pos_low = 10'h36a;
              4'hb: pos_low = 10'h36b;
              4'hc: pos_low = 10'h36c;
              4'hd: pos_low = 10'h36d;
              4'he: pos_low = 10'h36e;
              4'hf: pos_low = 10'h36f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h37: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h370;
              4'h1: pos_low = 10'h371;
              4'h2: pos_low = 10'h372;
              4'h3: pos_low = 10'h373;
              4'h4: pos_low = 10'h374;
              4'h5: pos_low = 10'h375;
              4'h6: pos_low = 10'h376;
              4'h7: pos_low = 10'h377;
              4'h8: pos_low = 10'h378;
              4'h9: pos_low = 10'h379;
              4'ha: pos_low = 10'h37a;
              4'hb: pos_low = 10'h37b;
              4'hc: pos_low = 10'h37c;
              4'hd: pos_low = 10'h37d;
              4'he: pos_low = 10'h37e;
              4'hf: pos_low = 10'h37f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h38: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h380;
              4'h1: pos_low = 10'h381;
              4'h2: pos_low = 10'h382;
              4'h3: pos_low = 10'h383;
              4'h4: pos_low = 10'h384;
              4'h5: pos_low = 10'h385;
              4'h6: pos_low = 10'h386;
              4'h7: pos_low = 10'h387;
              4'h8: pos_low = 10'h388;
              4'h9: pos_low = 10'h389;
              4'ha: pos_low = 10'h38a;
              4'hb: pos_low = 10'h38b;
              4'hc: pos_low = 10'h38c;
              4'hd: pos_low = 10'h38d;
              4'he: pos_low = 10'h38e;
              4'hf: pos_low = 10'h38f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h39: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h390;
              4'h1: pos_low = 10'h391;
              4'h2: pos_low = 10'h392;
              4'h3: pos_low = 10'h393;
              4'h4: pos_low = 10'h394;
              4'h5: pos_low = 10'h395;
              4'h6: pos_low = 10'h396;
              4'h7: pos_low = 10'h397;
              4'h8: pos_low = 10'h398;
              4'h9: pos_low = 10'h399;
              4'ha: pos_low = 10'h39a;
              4'hb: pos_low = 10'h39b;
              4'hc: pos_low = 10'h39c;
              4'hd: pos_low = 10'h39d;
              4'he: pos_low = 10'h39e;
              4'hf: pos_low = 10'h39f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h3a: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3a0;
              4'h1: pos_low = 10'h3a1;
              4'h2: pos_low = 10'h3a2;
              4'h3: pos_low = 10'h3a3;
              4'h4: pos_low = 10'h3a4;
              4'h5: pos_low = 10'h3a5;
              4'h6: pos_low = 10'h3a6;
              4'h7: pos_low = 10'h3a7;
              4'h8: pos_low = 10'h3a8;
              4'h9: pos_low = 10'h3a9;
              4'ha: pos_low = 10'h3aa;
              4'hb: pos_low = 10'h3ab;
              4'hc: pos_low = 10'h3ac;
              4'hd: pos_low = 10'h3ad;
              4'he: pos_low = 10'h3ae;
              4'hf: pos_low = 10'h3af;
              default: pos_low = 10'h000;
            endcase
          end
          6'h3b: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3b0;
              4'h1: pos_low = 10'h3b1;
              4'h2: pos_low = 10'h3b2;
              4'h3: pos_low = 10'h3b3;
              4'h4: pos_low = 10'h3b4;
              4'h5: pos_low = 10'h3b5;
              4'h6: pos_low = 10'h3b6;
              4'h7: pos_low = 10'h3b7;
              4'h8: pos_low = 10'h3b8;
              4'h9: pos_low = 10'h3b9;
              4'ha: pos_low = 10'h3ba;
              4'hb: pos_low = 10'h3bb;
              4'hc: pos_low = 10'h3bc;
              4'hd: pos_low = 10'h3bd;
              4'he: pos_low = 10'h3be;
              4'hf: pos_low = 10'h3bf;
              default: pos_low = 10'h000;
            endcase
          end
          6'h3c: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3c0;
              4'h1: pos_low = 10'h3c1;
              4'h2: pos_low = 10'h3c2;
              4'h3: pos_low = 10'h3c3;
              4'h4: pos_low = 10'h3c4;
              4'h5: pos_low = 10'h3c5;
              4'h6: pos_low = 10'h3c6;
              4'h7: pos_low = 10'h3c7;
              4'h8: pos_low = 10'h3c8;
              4'h9: pos_low = 10'h3c9;
              4'ha: pos_low = 10'h3ca;
              4'hb: pos_low = 10'h3cb;
              4'hc: pos_low = 10'h3cc;
              4'hd: pos_low = 10'h3cd;
              4'he: pos_low = 10'h3ce;
              4'hf: pos_low = 10'h3cf;
              default: pos_low = 10'h000;
            endcase
          end
          6'h3d: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3d0;
              4'h1: pos_low = 10'h3d1;
              4'h2: pos_low = 10'h3d2;
              4'h3: pos_low = 10'h3d3;
              4'h4: pos_low = 10'h3d4;
              4'h5: pos_low = 10'h3d5;
              4'h6: pos_low = 10'h3d6;
              4'h7: pos_low = 10'h3d7;
              4'h8: pos_low = 10'h3d8;
              4'h9: pos_low = 10'h3d9;
              4'ha: pos_low = 10'h3da;
              4'hb: pos_low = 10'h3db;
              4'hc: pos_low = 10'h3dc;
              4'hd: pos_low = 10'h3dd;
              4'he: pos_low = 10'h3de;
              4'hf: pos_low = 10'h3df;
              default: pos_low = 10'h000;
            endcase
          end
          6'h3e: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3e0;
              4'h1: pos_low = 10'h3e1;
              4'h2: pos_low = 10'h3e2;
              4'h3: pos_low = 10'h3e3;
              4'h4: pos_low = 10'h3e4;
              4'h5: pos_low = 10'h3e5;
              4'h6: pos_low = 10'h3e6;
              4'h7: pos_low = 10'h3e7;
              4'h8: pos_low = 10'h3e8;
              4'h9: pos_low = 10'h3e9;
              4'ha: pos_low = 10'h3ea;
              4'hb: pos_low = 10'h3eb;
              4'hc: pos_low = 10'h3ec;
              4'hd: pos_low = 10'h3ed;
              4'he: pos_low = 10'h3ee;
              4'hf: pos_low = 10'h3ef;
              default: pos_low = 10'h000;
            endcase
          end
          6'h3f: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3f0;
              4'h1: pos_low = 10'h3f1;
              4'h2: pos_low = 10'h3f2;
              4'h3: pos_low = 10'h3f3;
              4'h4: pos_low = 10'h3f4;
              4'h5: pos_low = 10'h3f5;
              4'h6: pos_low = 10'h3f6;
              4'h7: pos_low = 10'h3f7;
              4'h8: pos_low = 10'h3f8;
              4'h9: pos_low = 10'h3f9;
              4'ha: pos_low = 10'h3fa;
              4'hb: pos_low = 10'h3fb;
              4'hc: pos_low = 10'h3fc;
              4'hd: pos_low = 10'h3fd;
              4'he: pos_low = 10'h3fe;
              4'hf: pos_low = 10'h3ff;
              default: pos_low = 10'h000;
            endcase
          end
          default: begin end
        endcase
      end
      5'h07: begin
        case (mant[9:4])
          6'h00: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h000;
              4'h1: pos_low = 10'h001;
              4'h2: pos_low = 10'h002;
              4'h3: pos_low = 10'h003;
              4'h4: pos_low = 10'h004;
              4'h5: pos_low = 10'h005;
              4'h6: pos_low = 10'h006;
              4'h7: pos_low = 10'h007;
              4'h8: pos_low = 10'h008;
              4'h9: pos_low = 10'h009;
              4'ha: pos_low = 10'h00a;
              4'hb: pos_low = 10'h00b;
              4'hc: pos_low = 10'h00c;
              4'hd: pos_low = 10'h00d;
              4'he: pos_low = 10'h00e;
              4'hf: pos_low = 10'h00f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h01: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h010;
              4'h1: pos_low = 10'h011;
              4'h2: pos_low = 10'h012;
              4'h3: pos_low = 10'h013;
              4'h4: pos_low = 10'h014;
              4'h5: pos_low = 10'h015;
              4'h6: pos_low = 10'h016;
              4'h7: pos_low = 10'h017;
              4'h8: pos_low = 10'h018;
              4'h9: pos_low = 10'h019;
              4'ha: pos_low = 10'h01a;
              4'hb: pos_low = 10'h01b;
              4'hc: pos_low = 10'h01c;
              4'hd: pos_low = 10'h01d;
              4'he: pos_low = 10'h01e;
              4'hf: pos_low = 10'h01f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h02: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h020;
              4'h1: pos_low = 10'h021;
              4'h2: pos_low = 10'h022;
              4'h3: pos_low = 10'h023;
              4'h4: pos_low = 10'h024;
              4'h5: pos_low = 10'h025;
              4'h6: pos_low = 10'h026;
              4'h7: pos_low = 10'h027;
              4'h8: pos_low = 10'h028;
              4'h9: pos_low = 10'h029;
              4'ha: pos_low = 10'h02a;
              4'hb: pos_low = 10'h02b;
              4'hc: pos_low = 10'h02c;
              4'hd: pos_low = 10'h02d;
              4'he: pos_low = 10'h02e;
              4'hf: pos_low = 10'h02f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h03: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h030;
              4'h1: pos_low = 10'h031;
              4'h2: pos_low = 10'h032;
              4'h3: pos_low = 10'h033;
              4'h4: pos_low = 10'h034;
              4'h5: pos_low = 10'h035;
              4'h6: pos_low = 10'h036;
              4'h7: pos_low = 10'h037;
              4'h8: pos_low = 10'h038;
              4'h9: pos_low = 10'h039;
              4'ha: pos_low = 10'h03a;
              4'hb: pos_low = 10'h03b;
              4'hc: pos_low = 10'h03c;
              4'hd: pos_low = 10'h03d;
              4'he: pos_low = 10'h03e;
              4'hf: pos_low = 10'h03f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h04: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h040;
              4'h1: pos_low = 10'h041;
              4'h2: pos_low = 10'h042;
              4'h3: pos_low = 10'h043;
              4'h4: pos_low = 10'h044;
              4'h5: pos_low = 10'h045;
              4'h6: pos_low = 10'h046;
              4'h7: pos_low = 10'h047;
              4'h8: pos_low = 10'h048;
              4'h9: pos_low = 10'h049;
              4'ha: pos_low = 10'h04a;
              4'hb: pos_low = 10'h04b;
              4'hc: pos_low = 10'h04c;
              4'hd: pos_low = 10'h04d;
              4'he: pos_low = 10'h04e;
              4'hf: pos_low = 10'h04f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h05: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h050;
              4'h1: pos_low = 10'h051;
              4'h2: pos_low = 10'h052;
              4'h3: pos_low = 10'h053;
              4'h4: pos_low = 10'h054;
              4'h5: pos_low = 10'h055;
              4'h6: pos_low = 10'h056;
              4'h7: pos_low = 10'h057;
              4'h8: pos_low = 10'h058;
              4'h9: pos_low = 10'h059;
              4'ha: pos_low = 10'h05a;
              4'hb: pos_low = 10'h05b;
              4'hc: pos_low = 10'h05c;
              4'hd: pos_low = 10'h05d;
              4'he: pos_low = 10'h05e;
              4'hf: pos_low = 10'h05f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h06: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h060;
              4'h1: pos_low = 10'h061;
              4'h2: pos_low = 10'h062;
              4'h3: pos_low = 10'h063;
              4'h4: pos_low = 10'h064;
              4'h5: pos_low = 10'h065;
              4'h6: pos_low = 10'h066;
              4'h7: pos_low = 10'h067;
              4'h8: pos_low = 10'h068;
              4'h9: pos_low = 10'h069;
              4'ha: pos_low = 10'h06a;
              4'hb: pos_low = 10'h06b;
              4'hc: pos_low = 10'h06c;
              4'hd: pos_low = 10'h06d;
              4'he: pos_low = 10'h06e;
              4'hf: pos_low = 10'h06f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h07: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h070;
              4'h1: pos_low = 10'h071;
              4'h2: pos_low = 10'h072;
              4'h3: pos_low = 10'h073;
              4'h4: pos_low = 10'h074;
              4'h5: pos_low = 10'h075;
              4'h6: pos_low = 10'h076;
              4'h7: pos_low = 10'h077;
              4'h8: pos_low = 10'h078;
              4'h9: pos_low = 10'h079;
              4'ha: pos_low = 10'h07a;
              4'hb: pos_low = 10'h07b;
              4'hc: pos_low = 10'h07c;
              4'hd: pos_low = 10'h07d;
              4'he: pos_low = 10'h07e;
              4'hf: pos_low = 10'h07f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h08: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h080;
              4'h1: pos_low = 10'h081;
              4'h2: pos_low = 10'h082;
              4'h3: pos_low = 10'h083;
              4'h4: pos_low = 10'h084;
              4'h5: pos_low = 10'h085;
              4'h6: pos_low = 10'h086;
              4'h7: pos_low = 10'h087;
              4'h8: pos_low = 10'h088;
              4'h9: pos_low = 10'h089;
              4'ha: pos_low = 10'h08a;
              4'hb: pos_low = 10'h08b;
              4'hc: pos_low = 10'h08c;
              4'hd: pos_low = 10'h08d;
              4'he: pos_low = 10'h08e;
              4'hf: pos_low = 10'h08f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h09: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h090;
              4'h1: pos_low = 10'h091;
              4'h2: pos_low = 10'h092;
              4'h3: pos_low = 10'h093;
              4'h4: pos_low = 10'h094;
              4'h5: pos_low = 10'h095;
              4'h6: pos_low = 10'h096;
              4'h7: pos_low = 10'h097;
              4'h8: pos_low = 10'h098;
              4'h9: pos_low = 10'h099;
              4'ha: pos_low = 10'h09a;
              4'hb: pos_low = 10'h09b;
              4'hc: pos_low = 10'h09c;
              4'hd: pos_low = 10'h09d;
              4'he: pos_low = 10'h09e;
              4'hf: pos_low = 10'h09f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h0a: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h0a0;
              4'h1: pos_low = 10'h0a1;
              4'h2: pos_low = 10'h0a2;
              4'h3: pos_low = 10'h0a3;
              4'h4: pos_low = 10'h0a4;
              4'h5: pos_low = 10'h0a5;
              4'h6: pos_low = 10'h0a6;
              4'h7: pos_low = 10'h0a7;
              4'h8: pos_low = 10'h0a8;
              4'h9: pos_low = 10'h0a9;
              4'ha: pos_low = 10'h0aa;
              4'hb: pos_low = 10'h0ab;
              4'hc: pos_low = 10'h0ac;
              4'hd: pos_low = 10'h0ad;
              4'he: pos_low = 10'h0ae;
              4'hf: pos_low = 10'h0af;
              default: pos_low = 10'h000;
            endcase
          end
          6'h0b: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h0b0;
              4'h1: pos_low = 10'h0b1;
              4'h2: pos_low = 10'h0b2;
              4'h3: pos_low = 10'h0b3;
              4'h4: pos_low = 10'h0b4;
              4'h5: pos_low = 10'h0b5;
              4'h6: pos_low = 10'h0b6;
              4'h7: pos_low = 10'h0b7;
              4'h8: pos_low = 10'h0b8;
              4'h9: pos_low = 10'h0b9;
              4'ha: pos_low = 10'h0ba;
              4'hb: pos_low = 10'h0bb;
              4'hc: pos_low = 10'h0bc;
              4'hd: pos_low = 10'h0bd;
              4'he: pos_low = 10'h0be;
              4'hf: pos_low = 10'h0bf;
              default: pos_low = 10'h000;
            endcase
          end
          6'h0c: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h0c0;
              4'h1: pos_low = 10'h0c1;
              4'h2: pos_low = 10'h0c2;
              4'h3: pos_low = 10'h0c3;
              4'h4: pos_low = 10'h0c4;
              4'h5: pos_low = 10'h0c5;
              4'h6: pos_low = 10'h0c6;
              4'h7: pos_low = 10'h0c7;
              4'h8: pos_low = 10'h0c8;
              4'h9: pos_low = 10'h0c9;
              4'ha: pos_low = 10'h0ca;
              4'hb: pos_low = 10'h0cb;
              4'hc: pos_low = 10'h0cc;
              4'hd: pos_low = 10'h0cd;
              4'he: pos_low = 10'h0ce;
              4'hf: pos_low = 10'h0cf;
              default: pos_low = 10'h000;
            endcase
          end
          6'h0d: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h0d0;
              4'h1: pos_low = 10'h0d1;
              4'h2: pos_low = 10'h0d2;
              4'h3: pos_low = 10'h0d3;
              4'h4: pos_low = 10'h0d4;
              4'h5: pos_low = 10'h0d5;
              4'h6: pos_low = 10'h0d6;
              4'h7: pos_low = 10'h0d7;
              4'h8: pos_low = 10'h0d8;
              4'h9: pos_low = 10'h0d9;
              4'ha: pos_low = 10'h0da;
              4'hb: pos_low = 10'h0db;
              4'hc: pos_low = 10'h0dc;
              4'hd: pos_low = 10'h0dd;
              4'he: pos_low = 10'h0de;
              4'hf: pos_low = 10'h0df;
              default: pos_low = 10'h000;
            endcase
          end
          6'h0e: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h0e0;
              4'h1: pos_low = 10'h0e1;
              4'h2: pos_low = 10'h0e2;
              4'h3: pos_low = 10'h0e3;
              4'h4: pos_low = 10'h0e4;
              4'h5: pos_low = 10'h0e5;
              4'h6: pos_low = 10'h0e6;
              4'h7: pos_low = 10'h0e7;
              4'h8: pos_low = 10'h0e8;
              4'h9: pos_low = 10'h0e9;
              4'ha: pos_low = 10'h0ea;
              4'hb: pos_low = 10'h0eb;
              4'hc: pos_low = 10'h0ec;
              4'hd: pos_low = 10'h0ed;
              4'he: pos_low = 10'h0ee;
              4'hf: pos_low = 10'h0ef;
              default: pos_low = 10'h000;
            endcase
          end
          6'h0f: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h0f0;
              4'h1: pos_low = 10'h0f1;
              4'h2: pos_low = 10'h0f2;
              4'h3: pos_low = 10'h0f3;
              4'h4: pos_low = 10'h0f4;
              4'h5: pos_low = 10'h0f5;
              4'h6: pos_low = 10'h0f6;
              4'h7: pos_low = 10'h0f7;
              4'h8: pos_low = 10'h0f8;
              4'h9: pos_low = 10'h0f9;
              4'ha: pos_low = 10'h0fa;
              4'hb: pos_low = 10'h0fb;
              4'hc: pos_low = 10'h0fc;
              4'hd: pos_low = 10'h0fd;
              4'he: pos_low = 10'h0fe;
              4'hf: pos_low = 10'h0ff;
              default: pos_low = 10'h000;
            endcase
          end
          6'h10: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h100;
              4'h1: pos_low = 10'h101;
              4'h2: pos_low = 10'h102;
              4'h3: pos_low = 10'h103;
              4'h4: pos_low = 10'h104;
              4'h5: pos_low = 10'h105;
              4'h6: pos_low = 10'h106;
              4'h7: pos_low = 10'h107;
              4'h8: pos_low = 10'h108;
              4'h9: pos_low = 10'h109;
              4'ha: pos_low = 10'h10a;
              4'hb: pos_low = 10'h10b;
              4'hc: pos_low = 10'h10c;
              4'hd: pos_low = 10'h10d;
              4'he: pos_low = 10'h10e;
              4'hf: pos_low = 10'h10f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h11: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h110;
              4'h1: pos_low = 10'h111;
              4'h2: pos_low = 10'h112;
              4'h3: pos_low = 10'h113;
              4'h4: pos_low = 10'h114;
              4'h5: pos_low = 10'h115;
              4'h6: pos_low = 10'h116;
              4'h7: pos_low = 10'h117;
              4'h8: pos_low = 10'h118;
              4'h9: pos_low = 10'h119;
              4'ha: pos_low = 10'h11a;
              4'hb: pos_low = 10'h11b;
              4'hc: pos_low = 10'h11c;
              4'hd: pos_low = 10'h11d;
              4'he: pos_low = 10'h11e;
              4'hf: pos_low = 10'h11f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h12: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h120;
              4'h1: pos_low = 10'h121;
              4'h2: pos_low = 10'h122;
              4'h3: pos_low = 10'h123;
              4'h4: pos_low = 10'h124;
              4'h5: pos_low = 10'h125;
              4'h6: pos_low = 10'h126;
              4'h7: pos_low = 10'h127;
              4'h8: pos_low = 10'h128;
              4'h9: pos_low = 10'h129;
              4'ha: pos_low = 10'h12a;
              4'hb: pos_low = 10'h12b;
              4'hc: pos_low = 10'h12c;
              4'hd: pos_low = 10'h12d;
              4'he: pos_low = 10'h12e;
              4'hf: pos_low = 10'h12f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h13: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h130;
              4'h1: pos_low = 10'h131;
              4'h2: pos_low = 10'h132;
              4'h3: pos_low = 10'h133;
              4'h4: pos_low = 10'h134;
              4'h5: pos_low = 10'h135;
              4'h6: pos_low = 10'h136;
              4'h7: pos_low = 10'h137;
              4'h8: pos_low = 10'h138;
              4'h9: pos_low = 10'h139;
              4'ha: pos_low = 10'h13a;
              4'hb: pos_low = 10'h13b;
              4'hc: pos_low = 10'h13c;
              4'hd: pos_low = 10'h13d;
              4'he: pos_low = 10'h13e;
              4'hf: pos_low = 10'h13f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h14: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h140;
              4'h1: pos_low = 10'h141;
              4'h2: pos_low = 10'h142;
              4'h3: pos_low = 10'h143;
              4'h4: pos_low = 10'h144;
              4'h5: pos_low = 10'h145;
              4'h6: pos_low = 10'h146;
              4'h7: pos_low = 10'h147;
              4'h8: pos_low = 10'h148;
              4'h9: pos_low = 10'h149;
              4'ha: pos_low = 10'h14a;
              4'hb: pos_low = 10'h14b;
              4'hc: pos_low = 10'h14c;
              4'hd: pos_low = 10'h14d;
              4'he: pos_low = 10'h14e;
              4'hf: pos_low = 10'h14f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h15: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h150;
              4'h1: pos_low = 10'h151;
              4'h2: pos_low = 10'h152;
              4'h3: pos_low = 10'h153;
              4'h4: pos_low = 10'h154;
              4'h5: pos_low = 10'h155;
              4'h6: pos_low = 10'h156;
              4'h7: pos_low = 10'h157;
              4'h8: pos_low = 10'h158;
              4'h9: pos_low = 10'h159;
              4'ha: pos_low = 10'h15a;
              4'hb: pos_low = 10'h15b;
              4'hc: pos_low = 10'h15c;
              4'hd: pos_low = 10'h15d;
              4'he: pos_low = 10'h15e;
              4'hf: pos_low = 10'h15f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h16: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h160;
              4'h1: pos_low = 10'h161;
              4'h2: pos_low = 10'h162;
              4'h3: pos_low = 10'h163;
              4'h4: pos_low = 10'h164;
              4'h5: pos_low = 10'h165;
              4'h6: pos_low = 10'h166;
              4'h7: pos_low = 10'h167;
              4'h8: pos_low = 10'h168;
              4'h9: pos_low = 10'h169;
              4'ha: pos_low = 10'h16a;
              4'hb: pos_low = 10'h16b;
              4'hc: pos_low = 10'h16c;
              4'hd: pos_low = 10'h16d;
              4'he: pos_low = 10'h16e;
              4'hf: pos_low = 10'h16f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h17: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h170;
              4'h1: pos_low = 10'h171;
              4'h2: pos_low = 10'h172;
              4'h3: pos_low = 10'h173;
              4'h4: pos_low = 10'h174;
              4'h5: pos_low = 10'h175;
              4'h6: pos_low = 10'h176;
              4'h7: pos_low = 10'h177;
              4'h8: pos_low = 10'h178;
              4'h9: pos_low = 10'h179;
              4'ha: pos_low = 10'h17a;
              4'hb: pos_low = 10'h17b;
              4'hc: pos_low = 10'h17c;
              4'hd: pos_low = 10'h17d;
              4'he: pos_low = 10'h17e;
              4'hf: pos_low = 10'h17f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h18: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h180;
              4'h1: pos_low = 10'h181;
              4'h2: pos_low = 10'h182;
              4'h3: pos_low = 10'h183;
              4'h4: pos_low = 10'h184;
              4'h5: pos_low = 10'h185;
              4'h6: pos_low = 10'h186;
              4'h7: pos_low = 10'h187;
              4'h8: pos_low = 10'h188;
              4'h9: pos_low = 10'h189;
              4'ha: pos_low = 10'h18a;
              4'hb: pos_low = 10'h18b;
              4'hc: pos_low = 10'h18c;
              4'hd: pos_low = 10'h18d;
              4'he: pos_low = 10'h18e;
              4'hf: pos_low = 10'h18f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h19: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h190;
              4'h1: pos_low = 10'h191;
              4'h2: pos_low = 10'h192;
              4'h3: pos_low = 10'h193;
              4'h4: pos_low = 10'h194;
              4'h5: pos_low = 10'h195;
              4'h6: pos_low = 10'h196;
              4'h7: pos_low = 10'h197;
              4'h8: pos_low = 10'h198;
              4'h9: pos_low = 10'h199;
              4'ha: pos_low = 10'h19a;
              4'hb: pos_low = 10'h19b;
              4'hc: pos_low = 10'h19c;
              4'hd: pos_low = 10'h19d;
              4'he: pos_low = 10'h19e;
              4'hf: pos_low = 10'h19f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h1a: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h1a0;
              4'h1: pos_low = 10'h1a1;
              4'h2: pos_low = 10'h1a2;
              4'h3: pos_low = 10'h1a3;
              4'h4: pos_low = 10'h1a4;
              4'h5: pos_low = 10'h1a5;
              4'h6: pos_low = 10'h1a6;
              4'h7: pos_low = 10'h1a7;
              4'h8: pos_low = 10'h1a8;
              4'h9: pos_low = 10'h1a9;
              4'ha: pos_low = 10'h1aa;
              4'hb: pos_low = 10'h1ab;
              4'hc: pos_low = 10'h1ac;
              4'hd: pos_low = 10'h1ad;
              4'he: pos_low = 10'h1ae;
              4'hf: pos_low = 10'h1af;
              default: pos_low = 10'h000;
            endcase
          end
          6'h1b: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h1b0;
              4'h1: pos_low = 10'h1b1;
              4'h2: pos_low = 10'h1b2;
              4'h3: pos_low = 10'h1b3;
              4'h4: pos_low = 10'h1b4;
              4'h5: pos_low = 10'h1b5;
              4'h6: pos_low = 10'h1b6;
              4'h7: pos_low = 10'h1b7;
              4'h8: pos_low = 10'h1b8;
              4'h9: pos_low = 10'h1b9;
              4'ha: pos_low = 10'h1ba;
              4'hb: pos_low = 10'h1bb;
              4'hc: pos_low = 10'h1bc;
              4'hd: pos_low = 10'h1bd;
              4'he: pos_low = 10'h1be;
              4'hf: pos_low = 10'h1bf;
              default: pos_low = 10'h000;
            endcase
          end
          6'h1c: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h1c0;
              4'h1: pos_low = 10'h1c1;
              4'h2: pos_low = 10'h1c2;
              4'h3: pos_low = 10'h1c3;
              4'h4: pos_low = 10'h1c4;
              4'h5: pos_low = 10'h1c5;
              4'h6: pos_low = 10'h1c6;
              4'h7: pos_low = 10'h1c7;
              4'h8: pos_low = 10'h1c8;
              4'h9: pos_low = 10'h1c9;
              4'ha: pos_low = 10'h1ca;
              4'hb: pos_low = 10'h1cb;
              4'hc: pos_low = 10'h1cc;
              4'hd: pos_low = 10'h1cd;
              4'he: pos_low = 10'h1ce;
              4'hf: pos_low = 10'h1cf;
              default: pos_low = 10'h000;
            endcase
          end
          6'h1d: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h1d0;
              4'h1: pos_low = 10'h1d1;
              4'h2: pos_low = 10'h1d2;
              4'h3: pos_low = 10'h1d3;
              4'h4: pos_low = 10'h1d4;
              4'h5: pos_low = 10'h1d5;
              4'h6: pos_low = 10'h1d6;
              4'h7: pos_low = 10'h1d7;
              4'h8: pos_low = 10'h1d8;
              4'h9: pos_low = 10'h1d9;
              4'ha: pos_low = 10'h1da;
              4'hb: pos_low = 10'h1db;
              4'hc: pos_low = 10'h1dc;
              4'hd: pos_low = 10'h1dd;
              4'he: pos_low = 10'h1de;
              4'hf: pos_low = 10'h1df;
              default: pos_low = 10'h000;
            endcase
          end
          6'h1e: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h1e0;
              4'h1: pos_low = 10'h1e1;
              4'h2: pos_low = 10'h1e2;
              4'h3: pos_low = 10'h1e3;
              4'h4: pos_low = 10'h1e4;
              4'h5: pos_low = 10'h1e5;
              4'h6: pos_low = 10'h1e6;
              4'h7: pos_low = 10'h1e7;
              4'h8: pos_low = 10'h1e8;
              4'h9: pos_low = 10'h1e9;
              4'ha: pos_low = 10'h1ea;
              4'hb: pos_low = 10'h1eb;
              4'hc: pos_low = 10'h1ec;
              4'hd: pos_low = 10'h1ed;
              4'he: pos_low = 10'h1ee;
              4'hf: pos_low = 10'h1ef;
              default: pos_low = 10'h000;
            endcase
          end
          6'h1f: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h1f0;
              4'h1: pos_low = 10'h1f1;
              4'h2: pos_low = 10'h1f2;
              4'h3: pos_low = 10'h1f3;
              4'h4: pos_low = 10'h1f4;
              4'h5: pos_low = 10'h1f5;
              4'h6: pos_low = 10'h1f6;
              4'h7: pos_low = 10'h1f7;
              4'h8: pos_low = 10'h1f8;
              4'h9: pos_low = 10'h1f9;
              4'ha: pos_low = 10'h1fa;
              4'hb: pos_low = 10'h1fb;
              4'hc: pos_low = 10'h1fc;
              4'hd: pos_low = 10'h1fd;
              4'he: pos_low = 10'h1fe;
              4'hf: pos_low = 10'h1ff;
              default: pos_low = 10'h000;
            endcase
          end
          6'h20: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h200;
              4'h1: pos_low = 10'h201;
              4'h2: pos_low = 10'h202;
              4'h3: pos_low = 10'h203;
              4'h4: pos_low = 10'h204;
              4'h5: pos_low = 10'h205;
              4'h6: pos_low = 10'h206;
              4'h7: pos_low = 10'h207;
              4'h8: pos_low = 10'h208;
              4'h9: pos_low = 10'h209;
              4'ha: pos_low = 10'h20a;
              4'hb: pos_low = 10'h20b;
              4'hc: pos_low = 10'h20c;
              4'hd: pos_low = 10'h20d;
              4'he: pos_low = 10'h20e;
              4'hf: pos_low = 10'h20f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h21: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h210;
              4'h1: pos_low = 10'h211;
              4'h2: pos_low = 10'h212;
              4'h3: pos_low = 10'h213;
              4'h4: pos_low = 10'h214;
              4'h5: pos_low = 10'h215;
              4'h6: pos_low = 10'h216;
              4'h7: pos_low = 10'h217;
              4'h8: pos_low = 10'h218;
              4'h9: pos_low = 10'h219;
              4'ha: pos_low = 10'h21a;
              4'hb: pos_low = 10'h21b;
              4'hc: pos_low = 10'h21c;
              4'hd: pos_low = 10'h21d;
              4'he: pos_low = 10'h21e;
              4'hf: pos_low = 10'h21f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h22: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h220;
              4'h1: pos_low = 10'h221;
              4'h2: pos_low = 10'h222;
              4'h3: pos_low = 10'h223;
              4'h4: pos_low = 10'h224;
              4'h5: pos_low = 10'h225;
              4'h6: pos_low = 10'h226;
              4'h7: pos_low = 10'h227;
              4'h8: pos_low = 10'h228;
              4'h9: pos_low = 10'h229;
              4'ha: pos_low = 10'h22a;
              4'hb: pos_low = 10'h22b;
              4'hc: pos_low = 10'h22c;
              4'hd: pos_low = 10'h22d;
              4'he: pos_low = 10'h22e;
              4'hf: pos_low = 10'h22f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h23: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h230;
              4'h1: pos_low = 10'h231;
              4'h2: pos_low = 10'h232;
              4'h3: pos_low = 10'h233;
              4'h4: pos_low = 10'h234;
              4'h5: pos_low = 10'h235;
              4'h6: pos_low = 10'h236;
              4'h7: pos_low = 10'h237;
              4'h8: pos_low = 10'h238;
              4'h9: pos_low = 10'h239;
              4'ha: pos_low = 10'h23a;
              4'hb: pos_low = 10'h23b;
              4'hc: pos_low = 10'h23c;
              4'hd: pos_low = 10'h23d;
              4'he: pos_low = 10'h23e;
              4'hf: pos_low = 10'h23f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h24: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h240;
              4'h1: pos_low = 10'h241;
              4'h2: pos_low = 10'h242;
              4'h3: pos_low = 10'h243;
              4'h4: pos_low = 10'h244;
              4'h5: pos_low = 10'h245;
              4'h6: pos_low = 10'h246;
              4'h7: pos_low = 10'h247;
              4'h8: pos_low = 10'h248;
              4'h9: pos_low = 10'h249;
              4'ha: pos_low = 10'h24a;
              4'hb: pos_low = 10'h24b;
              4'hc: pos_low = 10'h24c;
              4'hd: pos_low = 10'h24d;
              4'he: pos_low = 10'h24e;
              4'hf: pos_low = 10'h24f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h25: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h250;
              4'h1: pos_low = 10'h251;
              4'h2: pos_low = 10'h252;
              4'h3: pos_low = 10'h253;
              4'h4: pos_low = 10'h254;
              4'h5: pos_low = 10'h255;
              4'h6: pos_low = 10'h256;
              4'h7: pos_low = 10'h257;
              4'h8: pos_low = 10'h258;
              4'h9: pos_low = 10'h259;
              4'ha: pos_low = 10'h25a;
              4'hb: pos_low = 10'h25b;
              4'hc: pos_low = 10'h25c;
              4'hd: pos_low = 10'h25d;
              4'he: pos_low = 10'h25e;
              4'hf: pos_low = 10'h25f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h26: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h260;
              4'h1: pos_low = 10'h261;
              4'h2: pos_low = 10'h262;
              4'h3: pos_low = 10'h263;
              4'h4: pos_low = 10'h264;
              4'h5: pos_low = 10'h265;
              4'h6: pos_low = 10'h266;
              4'h7: pos_low = 10'h267;
              4'h8: pos_low = 10'h268;
              4'h9: pos_low = 10'h269;
              4'ha: pos_low = 10'h26a;
              4'hb: pos_low = 10'h26b;
              4'hc: pos_low = 10'h26c;
              4'hd: pos_low = 10'h26d;
              4'he: pos_low = 10'h26e;
              4'hf: pos_low = 10'h26f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h27: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h270;
              4'h1: pos_low = 10'h271;
              4'h2: pos_low = 10'h272;
              4'h3: pos_low = 10'h273;
              4'h4: pos_low = 10'h274;
              4'h5: pos_low = 10'h275;
              4'h6: pos_low = 10'h276;
              4'h7: pos_low = 10'h277;
              4'h8: pos_low = 10'h278;
              4'h9: pos_low = 10'h279;
              4'ha: pos_low = 10'h27a;
              4'hb: pos_low = 10'h27b;
              4'hc: pos_low = 10'h27c;
              4'hd: pos_low = 10'h27d;
              4'he: pos_low = 10'h27e;
              4'hf: pos_low = 10'h27f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h28: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h280;
              4'h1: pos_low = 10'h281;
              4'h2: pos_low = 10'h282;
              4'h3: pos_low = 10'h283;
              4'h4: pos_low = 10'h284;
              4'h5: pos_low = 10'h285;
              4'h6: pos_low = 10'h286;
              4'h7: pos_low = 10'h287;
              4'h8: pos_low = 10'h288;
              4'h9: pos_low = 10'h289;
              4'ha: pos_low = 10'h28a;
              4'hb: pos_low = 10'h28b;
              4'hc: pos_low = 10'h28c;
              4'hd: pos_low = 10'h28d;
              4'he: pos_low = 10'h28e;
              4'hf: pos_low = 10'h28f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h29: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h290;
              4'h1: pos_low = 10'h291;
              4'h2: pos_low = 10'h292;
              4'h3: pos_low = 10'h293;
              4'h4: pos_low = 10'h294;
              4'h5: pos_low = 10'h295;
              4'h6: pos_low = 10'h296;
              4'h7: pos_low = 10'h297;
              4'h8: pos_low = 10'h298;
              4'h9: pos_low = 10'h299;
              4'ha: pos_low = 10'h29a;
              4'hb: pos_low = 10'h29b;
              4'hc: pos_low = 10'h29c;
              4'hd: pos_low = 10'h29d;
              4'he: pos_low = 10'h29e;
              4'hf: pos_low = 10'h29f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h2a: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h2a0;
              4'h1: pos_low = 10'h2a1;
              4'h2: pos_low = 10'h2a2;
              4'h3: pos_low = 10'h2a3;
              4'h4: pos_low = 10'h2a4;
              4'h5: pos_low = 10'h2a5;
              4'h6: pos_low = 10'h2a6;
              4'h7: pos_low = 10'h2a7;
              4'h8: pos_low = 10'h2a8;
              4'h9: pos_low = 10'h2a9;
              4'ha: pos_low = 10'h2aa;
              4'hb: pos_low = 10'h2ab;
              4'hc: pos_low = 10'h2ac;
              4'hd: pos_low = 10'h2ad;
              4'he: pos_low = 10'h2ae;
              4'hf: pos_low = 10'h2af;
              default: pos_low = 10'h000;
            endcase
          end
          6'h2b: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h2b0;
              4'h1: pos_low = 10'h2b1;
              4'h2: pos_low = 10'h2b2;
              4'h3: pos_low = 10'h2b3;
              4'h4: pos_low = 10'h2b4;
              4'h5: pos_low = 10'h2b5;
              4'h6: pos_low = 10'h2b6;
              4'h7: pos_low = 10'h2b7;
              4'h8: pos_low = 10'h2b8;
              4'h9: pos_low = 10'h2b9;
              4'ha: pos_low = 10'h2ba;
              4'hb: pos_low = 10'h2bb;
              4'hc: pos_low = 10'h2bc;
              4'hd: pos_low = 10'h2bd;
              4'he: pos_low = 10'h2be;
              4'hf: pos_low = 10'h2bf;
              default: pos_low = 10'h000;
            endcase
          end
          6'h2c: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h2c0;
              4'h1: pos_low = 10'h2c1;
              4'h2: pos_low = 10'h2c2;
              4'h3: pos_low = 10'h2c3;
              4'h4: pos_low = 10'h2c4;
              4'h5: pos_low = 10'h2c5;
              4'h6: pos_low = 10'h2c6;
              4'h7: pos_low = 10'h2c7;
              4'h8: pos_low = 10'h2c8;
              4'h9: pos_low = 10'h2c9;
              4'ha: pos_low = 10'h2ca;
              4'hb: pos_low = 10'h2cb;
              4'hc: pos_low = 10'h2cc;
              4'hd: pos_low = 10'h2cd;
              4'he: pos_low = 10'h2ce;
              4'hf: pos_low = 10'h2cf;
              default: pos_low = 10'h000;
            endcase
          end
          6'h2d: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h2d0;
              4'h1: pos_low = 10'h2d1;
              4'h2: pos_low = 10'h2d2;
              4'h3: pos_low = 10'h2d3;
              4'h4: pos_low = 10'h2d4;
              4'h5: pos_low = 10'h2d5;
              4'h6: pos_low = 10'h2d6;
              4'h7: pos_low = 10'h2d7;
              4'h8: pos_low = 10'h2d8;
              4'h9: pos_low = 10'h2d9;
              4'ha: pos_low = 10'h2da;
              4'hb: pos_low = 10'h2db;
              4'hc: pos_low = 10'h2dc;
              4'hd: pos_low = 10'h2dd;
              4'he: pos_low = 10'h2de;
              4'hf: pos_low = 10'h2df;
              default: pos_low = 10'h000;
            endcase
          end
          6'h2e: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h2e0;
              4'h1: pos_low = 10'h2e1;
              4'h2: pos_low = 10'h2e2;
              4'h3: pos_low = 10'h2e3;
              4'h4: pos_low = 10'h2e4;
              4'h5: pos_low = 10'h2e5;
              4'h6: pos_low = 10'h2e6;
              4'h7: pos_low = 10'h2e7;
              4'h8: pos_low = 10'h2e8;
              4'h9: pos_low = 10'h2e9;
              4'ha: pos_low = 10'h2ea;
              4'hb: pos_low = 10'h2eb;
              4'hc: pos_low = 10'h2ec;
              4'hd: pos_low = 10'h2ed;
              4'he: pos_low = 10'h2ee;
              4'hf: pos_low = 10'h2ef;
              default: pos_low = 10'h000;
            endcase
          end
          6'h2f: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h2f0;
              4'h1: pos_low = 10'h2f1;
              4'h2: pos_low = 10'h2f2;
              4'h3: pos_low = 10'h2f3;
              4'h4: pos_low = 10'h2f4;
              4'h5: pos_low = 10'h2f5;
              4'h6: pos_low = 10'h2f6;
              4'h7: pos_low = 10'h2f7;
              4'h8: pos_low = 10'h2f8;
              4'h9: pos_low = 10'h2f9;
              4'ha: pos_low = 10'h2fa;
              4'hb: pos_low = 10'h2fb;
              4'hc: pos_low = 10'h2fc;
              4'hd: pos_low = 10'h2fd;
              4'he: pos_low = 10'h2fe;
              4'hf: pos_low = 10'h2ff;
              default: pos_low = 10'h000;
            endcase
          end
          6'h30: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h300;
              4'h1: pos_low = 10'h301;
              4'h2: pos_low = 10'h302;
              4'h3: pos_low = 10'h303;
              4'h4: pos_low = 10'h304;
              4'h5: pos_low = 10'h305;
              4'h6: pos_low = 10'h306;
              4'h7: pos_low = 10'h307;
              4'h8: pos_low = 10'h308;
              4'h9: pos_low = 10'h309;
              4'ha: pos_low = 10'h30a;
              4'hb: pos_low = 10'h30b;
              4'hc: pos_low = 10'h30c;
              4'hd: pos_low = 10'h30d;
              4'he: pos_low = 10'h30e;
              4'hf: pos_low = 10'h30f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h31: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h310;
              4'h1: pos_low = 10'h311;
              4'h2: pos_low = 10'h312;
              4'h3: pos_low = 10'h313;
              4'h4: pos_low = 10'h314;
              4'h5: pos_low = 10'h315;
              4'h6: pos_low = 10'h316;
              4'h7: pos_low = 10'h317;
              4'h8: pos_low = 10'h318;
              4'h9: pos_low = 10'h319;
              4'ha: pos_low = 10'h31a;
              4'hb: pos_low = 10'h31b;
              4'hc: pos_low = 10'h31c;
              4'hd: pos_low = 10'h31d;
              4'he: pos_low = 10'h31e;
              4'hf: pos_low = 10'h31f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h32: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h320;
              4'h1: pos_low = 10'h321;
              4'h2: pos_low = 10'h322;
              4'h3: pos_low = 10'h323;
              4'h4: pos_low = 10'h324;
              4'h5: pos_low = 10'h325;
              4'h6: pos_low = 10'h326;
              4'h7: pos_low = 10'h327;
              4'h8: pos_low = 10'h328;
              4'h9: pos_low = 10'h329;
              4'ha: pos_low = 10'h32a;
              4'hb: pos_low = 10'h32b;
              4'hc: pos_low = 10'h32c;
              4'hd: pos_low = 10'h32d;
              4'he: pos_low = 10'h32e;
              4'hf: pos_low = 10'h32f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h33: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h330;
              4'h1: pos_low = 10'h331;
              4'h2: pos_low = 10'h332;
              4'h3: pos_low = 10'h333;
              4'h4: pos_low = 10'h334;
              4'h5: pos_low = 10'h335;
              4'h6: pos_low = 10'h336;
              4'h7: pos_low = 10'h337;
              4'h8: pos_low = 10'h338;
              4'h9: pos_low = 10'h339;
              4'ha: pos_low = 10'h33a;
              4'hb: pos_low = 10'h33b;
              4'hc: pos_low = 10'h33c;
              4'hd: pos_low = 10'h33d;
              4'he: pos_low = 10'h33e;
              4'hf: pos_low = 10'h33f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h34: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h340;
              4'h1: pos_low = 10'h341;
              4'h2: pos_low = 10'h342;
              4'h3: pos_low = 10'h343;
              4'h4: pos_low = 10'h344;
              4'h5: pos_low = 10'h345;
              4'h6: pos_low = 10'h346;
              4'h7: pos_low = 10'h347;
              4'h8: pos_low = 10'h348;
              4'h9: pos_low = 10'h349;
              4'ha: pos_low = 10'h34a;
              4'hb: pos_low = 10'h34b;
              4'hc: pos_low = 10'h34c;
              4'hd: pos_low = 10'h34d;
              4'he: pos_low = 10'h34e;
              4'hf: pos_low = 10'h34f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h35: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h350;
              4'h1: pos_low = 10'h351;
              4'h2: pos_low = 10'h352;
              4'h3: pos_low = 10'h353;
              4'h4: pos_low = 10'h354;
              4'h5: pos_low = 10'h355;
              4'h6: pos_low = 10'h356;
              4'h7: pos_low = 10'h357;
              4'h8: pos_low = 10'h358;
              4'h9: pos_low = 10'h359;
              4'ha: pos_low = 10'h35a;
              4'hb: pos_low = 10'h35b;
              4'hc: pos_low = 10'h35c;
              4'hd: pos_low = 10'h35d;
              4'he: pos_low = 10'h35e;
              4'hf: pos_low = 10'h35f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h36: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h360;
              4'h1: pos_low = 10'h361;
              4'h2: pos_low = 10'h362;
              4'h3: pos_low = 10'h363;
              4'h4: pos_low = 10'h364;
              4'h5: pos_low = 10'h365;
              4'h6: pos_low = 10'h366;
              4'h7: pos_low = 10'h367;
              4'h8: pos_low = 10'h368;
              4'h9: pos_low = 10'h369;
              4'ha: pos_low = 10'h36a;
              4'hb: pos_low = 10'h36b;
              4'hc: pos_low = 10'h36c;
              4'hd: pos_low = 10'h36d;
              4'he: pos_low = 10'h36e;
              4'hf: pos_low = 10'h36f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h37: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h370;
              4'h1: pos_low = 10'h371;
              4'h2: pos_low = 10'h372;
              4'h3: pos_low = 10'h373;
              4'h4: pos_low = 10'h374;
              4'h5: pos_low = 10'h375;
              4'h6: pos_low = 10'h376;
              4'h7: pos_low = 10'h377;
              4'h8: pos_low = 10'h378;
              4'h9: pos_low = 10'h379;
              4'ha: pos_low = 10'h37a;
              4'hb: pos_low = 10'h37b;
              4'hc: pos_low = 10'h37c;
              4'hd: pos_low = 10'h37d;
              4'he: pos_low = 10'h37e;
              4'hf: pos_low = 10'h37f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h38: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h380;
              4'h1: pos_low = 10'h381;
              4'h2: pos_low = 10'h382;
              4'h3: pos_low = 10'h383;
              4'h4: pos_low = 10'h384;
              4'h5: pos_low = 10'h385;
              4'h6: pos_low = 10'h386;
              4'h7: pos_low = 10'h387;
              4'h8: pos_low = 10'h388;
              4'h9: pos_low = 10'h389;
              4'ha: pos_low = 10'h38a;
              4'hb: pos_low = 10'h38b;
              4'hc: pos_low = 10'h38c;
              4'hd: pos_low = 10'h38d;
              4'he: pos_low = 10'h38e;
              4'hf: pos_low = 10'h38f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h39: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h390;
              4'h1: pos_low = 10'h391;
              4'h2: pos_low = 10'h392;
              4'h3: pos_low = 10'h393;
              4'h4: pos_low = 10'h394;
              4'h5: pos_low = 10'h395;
              4'h6: pos_low = 10'h396;
              4'h7: pos_low = 10'h397;
              4'h8: pos_low = 10'h398;
              4'h9: pos_low = 10'h399;
              4'ha: pos_low = 10'h39a;
              4'hb: pos_low = 10'h39b;
              4'hc: pos_low = 10'h39c;
              4'hd: pos_low = 10'h39d;
              4'he: pos_low = 10'h39e;
              4'hf: pos_low = 10'h39f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h3a: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3a0;
              4'h1: pos_low = 10'h3a1;
              4'h2: pos_low = 10'h3a2;
              4'h3: pos_low = 10'h3a3;
              4'h4: pos_low = 10'h3a4;
              4'h5: pos_low = 10'h3a5;
              4'h6: pos_low = 10'h3a6;
              4'h7: pos_low = 10'h3a7;
              4'h8: pos_low = 10'h3a8;
              4'h9: pos_low = 10'h3a9;
              4'ha: pos_low = 10'h3aa;
              4'hb: pos_low = 10'h3ab;
              4'hc: pos_low = 10'h3ac;
              4'hd: pos_low = 10'h3ad;
              4'he: pos_low = 10'h3ae;
              4'hf: pos_low = 10'h3af;
              default: pos_low = 10'h000;
            endcase
          end
          6'h3b: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3b0;
              4'h1: pos_low = 10'h3b1;
              4'h2: pos_low = 10'h3b2;
              4'h3: pos_low = 10'h3b3;
              4'h4: pos_low = 10'h3b4;
              4'h5: pos_low = 10'h3b5;
              4'h6: pos_low = 10'h3b6;
              4'h7: pos_low = 10'h3b7;
              4'h8: pos_low = 10'h3b8;
              4'h9: pos_low = 10'h3b9;
              4'ha: pos_low = 10'h3ba;
              4'hb: pos_low = 10'h3bb;
              4'hc: pos_low = 10'h3bc;
              4'hd: pos_low = 10'h3bd;
              4'he: pos_low = 10'h3be;
              4'hf: pos_low = 10'h3bf;
              default: pos_low = 10'h000;
            endcase
          end
          6'h3c: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3c0;
              4'h1: pos_low = 10'h3c1;
              4'h2: pos_low = 10'h3c2;
              4'h3: pos_low = 10'h3c3;
              4'h4: pos_low = 10'h3c4;
              4'h5: pos_low = 10'h3c5;
              4'h6: pos_low = 10'h3c6;
              4'h7: pos_low = 10'h3c7;
              4'h8: pos_low = 10'h3c8;
              4'h9: pos_low = 10'h3c9;
              4'ha: pos_low = 10'h3ca;
              4'hb: pos_low = 10'h3cb;
              4'hc: pos_low = 10'h3cc;
              4'hd: pos_low = 10'h3cd;
              4'he: pos_low = 10'h3ce;
              4'hf: pos_low = 10'h3cf;
              default: pos_low = 10'h000;
            endcase
          end
          6'h3d: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3d0;
              4'h1: pos_low = 10'h3d1;
              4'h2: pos_low = 10'h3d2;
              4'h3: pos_low = 10'h3d3;
              4'h4: pos_low = 10'h3d4;
              4'h5: pos_low = 10'h3d5;
              4'h6: pos_low = 10'h3d6;
              4'h7: pos_low = 10'h3d7;
              4'h8: pos_low = 10'h3d8;
              4'h9: pos_low = 10'h3d9;
              4'ha: pos_low = 10'h3da;
              4'hb: pos_low = 10'h3db;
              4'hc: pos_low = 10'h3dc;
              4'hd: pos_low = 10'h3dd;
              4'he: pos_low = 10'h3de;
              4'hf: pos_low = 10'h3df;
              default: pos_low = 10'h000;
            endcase
          end
          6'h3e: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3e0;
              4'h1: pos_low = 10'h3e1;
              4'h2: pos_low = 10'h3e2;
              4'h3: pos_low = 10'h3e3;
              4'h4: pos_low = 10'h3e4;
              4'h5: pos_low = 10'h3e5;
              4'h6: pos_low = 10'h3e6;
              4'h7: pos_low = 10'h3e7;
              4'h8: pos_low = 10'h3e8;
              4'h9: pos_low = 10'h3e9;
              4'ha: pos_low = 10'h3ea;
              4'hb: pos_low = 10'h3eb;
              4'hc: pos_low = 10'h3ec;
              4'hd: pos_low = 10'h3ed;
              4'he: pos_low = 10'h3ee;
              4'hf: pos_low = 10'h3ef;
              default: pos_low = 10'h000;
            endcase
          end
          6'h3f: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3f0;
              4'h1: pos_low = 10'h3f1;
              4'h2: pos_low = 10'h3f2;
              4'h3: pos_low = 10'h3f3;
              4'h4: pos_low = 10'h3f4;
              4'h5: pos_low = 10'h3f5;
              4'h6: pos_low = 10'h3f6;
              4'h7: pos_low = 10'h3f7;
              4'h8: pos_low = 10'h3f8;
              4'h9: pos_low = 10'h3f9;
              4'ha: pos_low = 10'h3fa;
              4'hb: pos_low = 10'h3fb;
              4'hc: pos_low = 10'h3fc;
              4'hd: pos_low = 10'h3fd;
              4'he: pos_low = 10'h3fe;
              4'hf: pos_low = 10'h3ff;
              default: pos_low = 10'h000;
            endcase
          end
          default: begin end
        endcase
      end
      5'h08: begin
        case (mant[9:4])
          6'h00: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h000;
              4'h1: pos_low = 10'h001;
              4'h2: pos_low = 10'h002;
              4'h3: pos_low = 10'h003;
              4'h4: pos_low = 10'h004;
              4'h5: pos_low = 10'h005;
              4'h6: pos_low = 10'h006;
              4'h7: pos_low = 10'h007;
              4'h8: pos_low = 10'h008;
              4'h9: pos_low = 10'h009;
              4'ha: pos_low = 10'h00a;
              4'hb: pos_low = 10'h00b;
              4'hc: pos_low = 10'h00c;
              4'hd: pos_low = 10'h00d;
              4'he: pos_low = 10'h00e;
              4'hf: pos_low = 10'h00f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h01: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h010;
              4'h1: pos_low = 10'h011;
              4'h2: pos_low = 10'h012;
              4'h3: pos_low = 10'h013;
              4'h4: pos_low = 10'h014;
              4'h5: pos_low = 10'h015;
              4'h6: pos_low = 10'h016;
              4'h7: pos_low = 10'h017;
              4'h8: pos_low = 10'h018;
              4'h9: pos_low = 10'h019;
              4'ha: pos_low = 10'h01a;
              4'hb: pos_low = 10'h01b;
              4'hc: pos_low = 10'h01c;
              4'hd: pos_low = 10'h01d;
              4'he: pos_low = 10'h01e;
              4'hf: pos_low = 10'h01f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h02: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h020;
              4'h1: pos_low = 10'h021;
              4'h2: pos_low = 10'h022;
              4'h3: pos_low = 10'h023;
              4'h4: pos_low = 10'h024;
              4'h5: pos_low = 10'h025;
              4'h6: pos_low = 10'h026;
              4'h7: pos_low = 10'h027;
              4'h8: pos_low = 10'h028;
              4'h9: pos_low = 10'h029;
              4'ha: pos_low = 10'h02a;
              4'hb: pos_low = 10'h02b;
              4'hc: pos_low = 10'h02c;
              4'hd: pos_low = 10'h02d;
              4'he: pos_low = 10'h02e;
              4'hf: pos_low = 10'h02f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h03: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h030;
              4'h1: pos_low = 10'h031;
              4'h2: pos_low = 10'h032;
              4'h3: pos_low = 10'h033;
              4'h4: pos_low = 10'h034;
              4'h5: pos_low = 10'h035;
              4'h6: pos_low = 10'h036;
              4'h7: pos_low = 10'h037;
              4'h8: pos_low = 10'h038;
              4'h9: pos_low = 10'h039;
              4'ha: pos_low = 10'h03a;
              4'hb: pos_low = 10'h03b;
              4'hc: pos_low = 10'h03c;
              4'hd: pos_low = 10'h03d;
              4'he: pos_low = 10'h03e;
              4'hf: pos_low = 10'h03f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h04: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h040;
              4'h1: pos_low = 10'h041;
              4'h2: pos_low = 10'h042;
              4'h3: pos_low = 10'h043;
              4'h4: pos_low = 10'h044;
              4'h5: pos_low = 10'h045;
              4'h6: pos_low = 10'h046;
              4'h7: pos_low = 10'h047;
              4'h8: pos_low = 10'h048;
              4'h9: pos_low = 10'h049;
              4'ha: pos_low = 10'h04a;
              4'hb: pos_low = 10'h04b;
              4'hc: pos_low = 10'h04c;
              4'hd: pos_low = 10'h04d;
              4'he: pos_low = 10'h04e;
              4'hf: pos_low = 10'h04f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h05: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h050;
              4'h1: pos_low = 10'h051;
              4'h2: pos_low = 10'h052;
              4'h3: pos_low = 10'h053;
              4'h4: pos_low = 10'h054;
              4'h5: pos_low = 10'h055;
              4'h6: pos_low = 10'h056;
              4'h7: pos_low = 10'h057;
              4'h8: pos_low = 10'h058;
              4'h9: pos_low = 10'h059;
              4'ha: pos_low = 10'h05a;
              4'hb: pos_low = 10'h05b;
              4'hc: pos_low = 10'h05c;
              4'hd: pos_low = 10'h05d;
              4'he: pos_low = 10'h05e;
              4'hf: pos_low = 10'h05f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h06: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h060;
              4'h1: pos_low = 10'h061;
              4'h2: pos_low = 10'h062;
              4'h3: pos_low = 10'h063;
              4'h4: pos_low = 10'h064;
              4'h5: pos_low = 10'h065;
              4'h6: pos_low = 10'h066;
              4'h7: pos_low = 10'h067;
              4'h8: pos_low = 10'h068;
              4'h9: pos_low = 10'h069;
              4'ha: pos_low = 10'h06a;
              4'hb: pos_low = 10'h06b;
              4'hc: pos_low = 10'h06c;
              4'hd: pos_low = 10'h06d;
              4'he: pos_low = 10'h06e;
              4'hf: pos_low = 10'h06f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h07: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h070;
              4'h1: pos_low = 10'h071;
              4'h2: pos_low = 10'h072;
              4'h3: pos_low = 10'h073;
              4'h4: pos_low = 10'h074;
              4'h5: pos_low = 10'h075;
              4'h6: pos_low = 10'h076;
              4'h7: pos_low = 10'h077;
              4'h8: pos_low = 10'h078;
              4'h9: pos_low = 10'h079;
              4'ha: pos_low = 10'h07a;
              4'hb: pos_low = 10'h07b;
              4'hc: pos_low = 10'h07c;
              4'hd: pos_low = 10'h07d;
              4'he: pos_low = 10'h07e;
              4'hf: pos_low = 10'h07f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h08: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h080;
              4'h1: pos_low = 10'h081;
              4'h2: pos_low = 10'h082;
              4'h3: pos_low = 10'h083;
              4'h4: pos_low = 10'h084;
              4'h5: pos_low = 10'h085;
              4'h6: pos_low = 10'h086;
              4'h7: pos_low = 10'h087;
              4'h8: pos_low = 10'h088;
              4'h9: pos_low = 10'h089;
              4'ha: pos_low = 10'h08a;
              4'hb: pos_low = 10'h08b;
              4'hc: pos_low = 10'h08c;
              4'hd: pos_low = 10'h08d;
              4'he: pos_low = 10'h08e;
              4'hf: pos_low = 10'h08f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h09: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h090;
              4'h1: pos_low = 10'h091;
              4'h2: pos_low = 10'h092;
              4'h3: pos_low = 10'h093;
              4'h4: pos_low = 10'h094;
              4'h5: pos_low = 10'h095;
              4'h6: pos_low = 10'h096;
              4'h7: pos_low = 10'h097;
              4'h8: pos_low = 10'h098;
              4'h9: pos_low = 10'h099;
              4'ha: pos_low = 10'h09a;
              4'hb: pos_low = 10'h09b;
              4'hc: pos_low = 10'h09c;
              4'hd: pos_low = 10'h09d;
              4'he: pos_low = 10'h09e;
              4'hf: pos_low = 10'h09f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h0a: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h0a0;
              4'h1: pos_low = 10'h0a1;
              4'h2: pos_low = 10'h0a2;
              4'h3: pos_low = 10'h0a3;
              4'h4: pos_low = 10'h0a4;
              4'h5: pos_low = 10'h0a5;
              4'h6: pos_low = 10'h0a6;
              4'h7: pos_low = 10'h0a7;
              4'h8: pos_low = 10'h0a8;
              4'h9: pos_low = 10'h0a9;
              4'ha: pos_low = 10'h0aa;
              4'hb: pos_low = 10'h0ab;
              4'hc: pos_low = 10'h0ac;
              4'hd: pos_low = 10'h0ad;
              4'he: pos_low = 10'h0ae;
              4'hf: pos_low = 10'h0af;
              default: pos_low = 10'h000;
            endcase
          end
          6'h0b: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h0b0;
              4'h1: pos_low = 10'h0b1;
              4'h2: pos_low = 10'h0b2;
              4'h3: pos_low = 10'h0b3;
              4'h4: pos_low = 10'h0b4;
              4'h5: pos_low = 10'h0b5;
              4'h6: pos_low = 10'h0b6;
              4'h7: pos_low = 10'h0b7;
              4'h8: pos_low = 10'h0b8;
              4'h9: pos_low = 10'h0b9;
              4'ha: pos_low = 10'h0ba;
              4'hb: pos_low = 10'h0bb;
              4'hc: pos_low = 10'h0bc;
              4'hd: pos_low = 10'h0bd;
              4'he: pos_low = 10'h0be;
              4'hf: pos_low = 10'h0bf;
              default: pos_low = 10'h000;
            endcase
          end
          6'h0c: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h0c0;
              4'h1: pos_low = 10'h0c1;
              4'h2: pos_low = 10'h0c2;
              4'h3: pos_low = 10'h0c3;
              4'h4: pos_low = 10'h0c4;
              4'h5: pos_low = 10'h0c5;
              4'h6: pos_low = 10'h0c6;
              4'h7: pos_low = 10'h0c7;
              4'h8: pos_low = 10'h0c8;
              4'h9: pos_low = 10'h0c9;
              4'ha: pos_low = 10'h0ca;
              4'hb: pos_low = 10'h0cb;
              4'hc: pos_low = 10'h0cc;
              4'hd: pos_low = 10'h0cd;
              4'he: pos_low = 10'h0ce;
              4'hf: pos_low = 10'h0cf;
              default: pos_low = 10'h000;
            endcase
          end
          6'h0d: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h0d0;
              4'h1: pos_low = 10'h0d1;
              4'h2: pos_low = 10'h0d2;
              4'h3: pos_low = 10'h0d3;
              4'h4: pos_low = 10'h0d4;
              4'h5: pos_low = 10'h0d5;
              4'h6: pos_low = 10'h0d6;
              4'h7: pos_low = 10'h0d7;
              4'h8: pos_low = 10'h0d8;
              4'h9: pos_low = 10'h0d9;
              4'ha: pos_low = 10'h0da;
              4'hb: pos_low = 10'h0db;
              4'hc: pos_low = 10'h0dc;
              4'hd: pos_low = 10'h0dd;
              4'he: pos_low = 10'h0de;
              4'hf: pos_low = 10'h0df;
              default: pos_low = 10'h000;
            endcase
          end
          6'h0e: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h0e0;
              4'h1: pos_low = 10'h0e1;
              4'h2: pos_low = 10'h0e2;
              4'h3: pos_low = 10'h0e3;
              4'h4: pos_low = 10'h0e4;
              4'h5: pos_low = 10'h0e5;
              4'h6: pos_low = 10'h0e6;
              4'h7: pos_low = 10'h0e7;
              4'h8: pos_low = 10'h0e8;
              4'h9: pos_low = 10'h0e9;
              4'ha: pos_low = 10'h0ea;
              4'hb: pos_low = 10'h0eb;
              4'hc: pos_low = 10'h0ec;
              4'hd: pos_low = 10'h0ed;
              4'he: pos_low = 10'h0ee;
              4'hf: pos_low = 10'h0ef;
              default: pos_low = 10'h000;
            endcase
          end
          6'h0f: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h0f0;
              4'h1: pos_low = 10'h0f1;
              4'h2: pos_low = 10'h0f2;
              4'h3: pos_low = 10'h0f3;
              4'h4: pos_low = 10'h0f4;
              4'h5: pos_low = 10'h0f5;
              4'h6: pos_low = 10'h0f6;
              4'h7: pos_low = 10'h0f7;
              4'h8: pos_low = 10'h0f8;
              4'h9: pos_low = 10'h0f9;
              4'ha: pos_low = 10'h0fa;
              4'hb: pos_low = 10'h0fb;
              4'hc: pos_low = 10'h0fc;
              4'hd: pos_low = 10'h0fd;
              4'he: pos_low = 10'h0fe;
              4'hf: pos_low = 10'h0ff;
              default: pos_low = 10'h000;
            endcase
          end
          6'h10: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h100;
              4'h1: pos_low = 10'h101;
              4'h2: pos_low = 10'h102;
              4'h3: pos_low = 10'h103;
              4'h4: pos_low = 10'h104;
              4'h5: pos_low = 10'h105;
              4'h6: pos_low = 10'h106;
              4'h7: pos_low = 10'h107;
              4'h8: pos_low = 10'h108;
              4'h9: pos_low = 10'h109;
              4'ha: pos_low = 10'h10a;
              4'hb: pos_low = 10'h10b;
              4'hc: pos_low = 10'h10c;
              4'hd: pos_low = 10'h10d;
              4'he: pos_low = 10'h10e;
              4'hf: pos_low = 10'h10f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h11: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h110;
              4'h1: pos_low = 10'h111;
              4'h2: pos_low = 10'h112;
              4'h3: pos_low = 10'h113;
              4'h4: pos_low = 10'h114;
              4'h5: pos_low = 10'h115;
              4'h6: pos_low = 10'h116;
              4'h7: pos_low = 10'h117;
              4'h8: pos_low = 10'h118;
              4'h9: pos_low = 10'h119;
              4'ha: pos_low = 10'h11a;
              4'hb: pos_low = 10'h11b;
              4'hc: pos_low = 10'h11c;
              4'hd: pos_low = 10'h11d;
              4'he: pos_low = 10'h11e;
              4'hf: pos_low = 10'h11f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h12: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h120;
              4'h1: pos_low = 10'h121;
              4'h2: pos_low = 10'h122;
              4'h3: pos_low = 10'h123;
              4'h4: pos_low = 10'h124;
              4'h5: pos_low = 10'h125;
              4'h6: pos_low = 10'h126;
              4'h7: pos_low = 10'h127;
              4'h8: pos_low = 10'h128;
              4'h9: pos_low = 10'h129;
              4'ha: pos_low = 10'h12a;
              4'hb: pos_low = 10'h12b;
              4'hc: pos_low = 10'h12c;
              4'hd: pos_low = 10'h12d;
              4'he: pos_low = 10'h12e;
              4'hf: pos_low = 10'h12f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h13: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h130;
              4'h1: pos_low = 10'h131;
              4'h2: pos_low = 10'h132;
              4'h3: pos_low = 10'h133;
              4'h4: pos_low = 10'h134;
              4'h5: pos_low = 10'h135;
              4'h6: pos_low = 10'h136;
              4'h7: pos_low = 10'h137;
              4'h8: pos_low = 10'h138;
              4'h9: pos_low = 10'h139;
              4'ha: pos_low = 10'h13a;
              4'hb: pos_low = 10'h13b;
              4'hc: pos_low = 10'h13c;
              4'hd: pos_low = 10'h13d;
              4'he: pos_low = 10'h13e;
              4'hf: pos_low = 10'h13f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h14: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h140;
              4'h1: pos_low = 10'h141;
              4'h2: pos_low = 10'h142;
              4'h3: pos_low = 10'h143;
              4'h4: pos_low = 10'h144;
              4'h5: pos_low = 10'h145;
              4'h6: pos_low = 10'h146;
              4'h7: pos_low = 10'h147;
              4'h8: pos_low = 10'h148;
              4'h9: pos_low = 10'h149;
              4'ha: pos_low = 10'h14a;
              4'hb: pos_low = 10'h14b;
              4'hc: pos_low = 10'h14c;
              4'hd: pos_low = 10'h14d;
              4'he: pos_low = 10'h14e;
              4'hf: pos_low = 10'h14f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h15: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h150;
              4'h1: pos_low = 10'h151;
              4'h2: pos_low = 10'h152;
              4'h3: pos_low = 10'h153;
              4'h4: pos_low = 10'h154;
              4'h5: pos_low = 10'h155;
              4'h6: pos_low = 10'h156;
              4'h7: pos_low = 10'h157;
              4'h8: pos_low = 10'h158;
              4'h9: pos_low = 10'h159;
              4'ha: pos_low = 10'h15a;
              4'hb: pos_low = 10'h15b;
              4'hc: pos_low = 10'h15c;
              4'hd: pos_low = 10'h15d;
              4'he: pos_low = 10'h15e;
              4'hf: pos_low = 10'h15f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h16: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h160;
              4'h1: pos_low = 10'h161;
              4'h2: pos_low = 10'h162;
              4'h3: pos_low = 10'h163;
              4'h4: pos_low = 10'h164;
              4'h5: pos_low = 10'h165;
              4'h6: pos_low = 10'h166;
              4'h7: pos_low = 10'h167;
              4'h8: pos_low = 10'h168;
              4'h9: pos_low = 10'h169;
              4'ha: pos_low = 10'h16a;
              4'hb: pos_low = 10'h16b;
              4'hc: pos_low = 10'h16c;
              4'hd: pos_low = 10'h16d;
              4'he: pos_low = 10'h16e;
              4'hf: pos_low = 10'h16f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h17: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h170;
              4'h1: pos_low = 10'h171;
              4'h2: pos_low = 10'h172;
              4'h3: pos_low = 10'h173;
              4'h4: pos_low = 10'h174;
              4'h5: pos_low = 10'h175;
              4'h6: pos_low = 10'h176;
              4'h7: pos_low = 10'h177;
              4'h8: pos_low = 10'h178;
              4'h9: pos_low = 10'h179;
              4'ha: pos_low = 10'h17a;
              4'hb: pos_low = 10'h17b;
              4'hc: pos_low = 10'h17c;
              4'hd: pos_low = 10'h17d;
              4'he: pos_low = 10'h17e;
              4'hf: pos_low = 10'h17f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h18: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h180;
              4'h1: pos_low = 10'h181;
              4'h2: pos_low = 10'h182;
              4'h3: pos_low = 10'h183;
              4'h4: pos_low = 10'h184;
              4'h5: pos_low = 10'h185;
              4'h6: pos_low = 10'h186;
              4'h7: pos_low = 10'h187;
              4'h8: pos_low = 10'h188;
              4'h9: pos_low = 10'h189;
              4'ha: pos_low = 10'h18a;
              4'hb: pos_low = 10'h18b;
              4'hc: pos_low = 10'h18c;
              4'hd: pos_low = 10'h18d;
              4'he: pos_low = 10'h18e;
              4'hf: pos_low = 10'h18f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h19: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h190;
              4'h1: pos_low = 10'h191;
              4'h2: pos_low = 10'h192;
              4'h3: pos_low = 10'h193;
              4'h4: pos_low = 10'h194;
              4'h5: pos_low = 10'h195;
              4'h6: pos_low = 10'h196;
              4'h7: pos_low = 10'h197;
              4'h8: pos_low = 10'h198;
              4'h9: pos_low = 10'h199;
              4'ha: pos_low = 10'h19a;
              4'hb: pos_low = 10'h19b;
              4'hc: pos_low = 10'h19c;
              4'hd: pos_low = 10'h19d;
              4'he: pos_low = 10'h19e;
              4'hf: pos_low = 10'h19f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h1a: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h1a0;
              4'h1: pos_low = 10'h1a1;
              4'h2: pos_low = 10'h1a2;
              4'h3: pos_low = 10'h1a3;
              4'h4: pos_low = 10'h1a4;
              4'h5: pos_low = 10'h1a5;
              4'h6: pos_low = 10'h1a6;
              4'h7: pos_low = 10'h1a7;
              4'h8: pos_low = 10'h1a8;
              4'h9: pos_low = 10'h1a9;
              4'ha: pos_low = 10'h1aa;
              4'hb: pos_low = 10'h1ab;
              4'hc: pos_low = 10'h1ac;
              4'hd: pos_low = 10'h1ad;
              4'he: pos_low = 10'h1ae;
              4'hf: pos_low = 10'h1af;
              default: pos_low = 10'h000;
            endcase
          end
          6'h1b: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h1b0;
              4'h1: pos_low = 10'h1b1;
              4'h2: pos_low = 10'h1b2;
              4'h3: pos_low = 10'h1b3;
              4'h4: pos_low = 10'h1b4;
              4'h5: pos_low = 10'h1b5;
              4'h6: pos_low = 10'h1b6;
              4'h7: pos_low = 10'h1b7;
              4'h8: pos_low = 10'h1b8;
              4'h9: pos_low = 10'h1b9;
              4'ha: pos_low = 10'h1ba;
              4'hb: pos_low = 10'h1bb;
              4'hc: pos_low = 10'h1bc;
              4'hd: pos_low = 10'h1bd;
              4'he: pos_low = 10'h1be;
              4'hf: pos_low = 10'h1bf;
              default: pos_low = 10'h000;
            endcase
          end
          6'h1c: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h1c0;
              4'h1: pos_low = 10'h1c1;
              4'h2: pos_low = 10'h1c2;
              4'h3: pos_low = 10'h1c3;
              4'h4: pos_low = 10'h1c4;
              4'h5: pos_low = 10'h1c5;
              4'h6: pos_low = 10'h1c6;
              4'h7: pos_low = 10'h1c7;
              4'h8: pos_low = 10'h1c8;
              4'h9: pos_low = 10'h1c9;
              4'ha: pos_low = 10'h1ca;
              4'hb: pos_low = 10'h1cb;
              4'hc: pos_low = 10'h1cc;
              4'hd: pos_low = 10'h1cd;
              4'he: pos_low = 10'h1ce;
              4'hf: pos_low = 10'h1cf;
              default: pos_low = 10'h000;
            endcase
          end
          6'h1d: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h1d0;
              4'h1: pos_low = 10'h1d1;
              4'h2: pos_low = 10'h1d2;
              4'h3: pos_low = 10'h1d3;
              4'h4: pos_low = 10'h1d4;
              4'h5: pos_low = 10'h1d5;
              4'h6: pos_low = 10'h1d6;
              4'h7: pos_low = 10'h1d7;
              4'h8: pos_low = 10'h1d8;
              4'h9: pos_low = 10'h1d9;
              4'ha: pos_low = 10'h1da;
              4'hb: pos_low = 10'h1db;
              4'hc: pos_low = 10'h1dc;
              4'hd: pos_low = 10'h1dd;
              4'he: pos_low = 10'h1de;
              4'hf: pos_low = 10'h1df;
              default: pos_low = 10'h000;
            endcase
          end
          6'h1e: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h1e0;
              4'h1: pos_low = 10'h1e1;
              4'h2: pos_low = 10'h1e2;
              4'h3: pos_low = 10'h1e3;
              4'h4: pos_low = 10'h1e4;
              4'h5: pos_low = 10'h1e5;
              4'h6: pos_low = 10'h1e6;
              4'h7: pos_low = 10'h1e7;
              4'h8: pos_low = 10'h1e8;
              4'h9: pos_low = 10'h1e9;
              4'ha: pos_low = 10'h1ea;
              4'hb: pos_low = 10'h1eb;
              4'hc: pos_low = 10'h1ec;
              4'hd: pos_low = 10'h1ed;
              4'he: pos_low = 10'h1ee;
              4'hf: pos_low = 10'h1ef;
              default: pos_low = 10'h000;
            endcase
          end
          6'h1f: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h1f0;
              4'h1: pos_low = 10'h1f1;
              4'h2: pos_low = 10'h1f2;
              4'h3: pos_low = 10'h1f3;
              4'h4: pos_low = 10'h1f4;
              4'h5: pos_low = 10'h1f5;
              4'h6: pos_low = 10'h1f6;
              4'h7: pos_low = 10'h1f7;
              4'h8: pos_low = 10'h1f8;
              4'h9: pos_low = 10'h1f9;
              4'ha: pos_low = 10'h1fa;
              4'hb: pos_low = 10'h1fb;
              4'hc: pos_low = 10'h1fc;
              4'hd: pos_low = 10'h1fd;
              4'he: pos_low = 10'h1fe;
              4'hf: pos_low = 10'h1ff;
              default: pos_low = 10'h000;
            endcase
          end
          6'h20: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h200;
              4'h1: pos_low = 10'h201;
              4'h2: pos_low = 10'h202;
              4'h3: pos_low = 10'h203;
              4'h4: pos_low = 10'h204;
              4'h5: pos_low = 10'h205;
              4'h6: pos_low = 10'h206;
              4'h7: pos_low = 10'h207;
              4'h8: pos_low = 10'h208;
              4'h9: pos_low = 10'h209;
              4'ha: pos_low = 10'h20a;
              4'hb: pos_low = 10'h20b;
              4'hc: pos_low = 10'h20c;
              4'hd: pos_low = 10'h20d;
              4'he: pos_low = 10'h20e;
              4'hf: pos_low = 10'h20f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h21: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h210;
              4'h1: pos_low = 10'h211;
              4'h2: pos_low = 10'h212;
              4'h3: pos_low = 10'h213;
              4'h4: pos_low = 10'h214;
              4'h5: pos_low = 10'h215;
              4'h6: pos_low = 10'h216;
              4'h7: pos_low = 10'h217;
              4'h8: pos_low = 10'h218;
              4'h9: pos_low = 10'h219;
              4'ha: pos_low = 10'h21a;
              4'hb: pos_low = 10'h21b;
              4'hc: pos_low = 10'h21c;
              4'hd: pos_low = 10'h21d;
              4'he: pos_low = 10'h21e;
              4'hf: pos_low = 10'h21f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h22: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h220;
              4'h1: pos_low = 10'h221;
              4'h2: pos_low = 10'h222;
              4'h3: pos_low = 10'h223;
              4'h4: pos_low = 10'h224;
              4'h5: pos_low = 10'h225;
              4'h6: pos_low = 10'h226;
              4'h7: pos_low = 10'h227;
              4'h8: pos_low = 10'h228;
              4'h9: pos_low = 10'h229;
              4'ha: pos_low = 10'h22a;
              4'hb: pos_low = 10'h22b;
              4'hc: pos_low = 10'h22c;
              4'hd: pos_low = 10'h22d;
              4'he: pos_low = 10'h22e;
              4'hf: pos_low = 10'h22f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h23: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h230;
              4'h1: pos_low = 10'h231;
              4'h2: pos_low = 10'h232;
              4'h3: pos_low = 10'h233;
              4'h4: pos_low = 10'h234;
              4'h5: pos_low = 10'h235;
              4'h6: pos_low = 10'h236;
              4'h7: pos_low = 10'h237;
              4'h8: pos_low = 10'h238;
              4'h9: pos_low = 10'h239;
              4'ha: pos_low = 10'h23a;
              4'hb: pos_low = 10'h23b;
              4'hc: pos_low = 10'h23c;
              4'hd: pos_low = 10'h23d;
              4'he: pos_low = 10'h23e;
              4'hf: pos_low = 10'h23f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h24: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h240;
              4'h1: pos_low = 10'h241;
              4'h2: pos_low = 10'h242;
              4'h3: pos_low = 10'h243;
              4'h4: pos_low = 10'h244;
              4'h5: pos_low = 10'h245;
              4'h6: pos_low = 10'h246;
              4'h7: pos_low = 10'h247;
              4'h8: pos_low = 10'h248;
              4'h9: pos_low = 10'h249;
              4'ha: pos_low = 10'h24a;
              4'hb: pos_low = 10'h24b;
              4'hc: pos_low = 10'h24c;
              4'hd: pos_low = 10'h24d;
              4'he: pos_low = 10'h24e;
              4'hf: pos_low = 10'h24f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h25: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h250;
              4'h1: pos_low = 10'h251;
              4'h2: pos_low = 10'h252;
              4'h3: pos_low = 10'h253;
              4'h4: pos_low = 10'h254;
              4'h5: pos_low = 10'h255;
              4'h6: pos_low = 10'h256;
              4'h7: pos_low = 10'h257;
              4'h8: pos_low = 10'h258;
              4'h9: pos_low = 10'h259;
              4'ha: pos_low = 10'h25a;
              4'hb: pos_low = 10'h25b;
              4'hc: pos_low = 10'h25c;
              4'hd: pos_low = 10'h25d;
              4'he: pos_low = 10'h25e;
              4'hf: pos_low = 10'h25f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h26: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h260;
              4'h1: pos_low = 10'h261;
              4'h2: pos_low = 10'h262;
              4'h3: pos_low = 10'h263;
              4'h4: pos_low = 10'h264;
              4'h5: pos_low = 10'h265;
              4'h6: pos_low = 10'h266;
              4'h7: pos_low = 10'h267;
              4'h8: pos_low = 10'h268;
              4'h9: pos_low = 10'h269;
              4'ha: pos_low = 10'h26a;
              4'hb: pos_low = 10'h26b;
              4'hc: pos_low = 10'h26c;
              4'hd: pos_low = 10'h26d;
              4'he: pos_low = 10'h26e;
              4'hf: pos_low = 10'h26f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h27: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h270;
              4'h1: pos_low = 10'h271;
              4'h2: pos_low = 10'h272;
              4'h3: pos_low = 10'h273;
              4'h4: pos_low = 10'h274;
              4'h5: pos_low = 10'h275;
              4'h6: pos_low = 10'h276;
              4'h7: pos_low = 10'h277;
              4'h8: pos_low = 10'h278;
              4'h9: pos_low = 10'h279;
              4'ha: pos_low = 10'h27a;
              4'hb: pos_low = 10'h27b;
              4'hc: pos_low = 10'h27c;
              4'hd: pos_low = 10'h27d;
              4'he: pos_low = 10'h27e;
              4'hf: pos_low = 10'h27f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h28: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h280;
              4'h1: pos_low = 10'h281;
              4'h2: pos_low = 10'h282;
              4'h3: pos_low = 10'h283;
              4'h4: pos_low = 10'h284;
              4'h5: pos_low = 10'h285;
              4'h6: pos_low = 10'h286;
              4'h7: pos_low = 10'h287;
              4'h8: pos_low = 10'h288;
              4'h9: pos_low = 10'h289;
              4'ha: pos_low = 10'h28a;
              4'hb: pos_low = 10'h28b;
              4'hc: pos_low = 10'h28c;
              4'hd: pos_low = 10'h28d;
              4'he: pos_low = 10'h28e;
              4'hf: pos_low = 10'h28f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h29: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h290;
              4'h1: pos_low = 10'h291;
              4'h2: pos_low = 10'h292;
              4'h3: pos_low = 10'h293;
              4'h4: pos_low = 10'h294;
              4'h5: pos_low = 10'h295;
              4'h6: pos_low = 10'h296;
              4'h7: pos_low = 10'h297;
              4'h8: pos_low = 10'h298;
              4'h9: pos_low = 10'h299;
              4'ha: pos_low = 10'h29a;
              4'hb: pos_low = 10'h29b;
              4'hc: pos_low = 10'h29c;
              4'hd: pos_low = 10'h29d;
              4'he: pos_low = 10'h29e;
              4'hf: pos_low = 10'h29f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h2a: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h2a0;
              4'h1: pos_low = 10'h2a1;
              4'h2: pos_low = 10'h2a2;
              4'h3: pos_low = 10'h2a3;
              4'h4: pos_low = 10'h2a4;
              4'h5: pos_low = 10'h2a5;
              4'h6: pos_low = 10'h2a6;
              4'h7: pos_low = 10'h2a7;
              4'h8: pos_low = 10'h2a8;
              4'h9: pos_low = 10'h2a9;
              4'ha: pos_low = 10'h2aa;
              4'hb: pos_low = 10'h2ab;
              4'hc: pos_low = 10'h2ac;
              4'hd: pos_low = 10'h2ad;
              4'he: pos_low = 10'h2ae;
              4'hf: pos_low = 10'h2af;
              default: pos_low = 10'h000;
            endcase
          end
          6'h2b: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h2b0;
              4'h1: pos_low = 10'h2b1;
              4'h2: pos_low = 10'h2b2;
              4'h3: pos_low = 10'h2b3;
              4'h4: pos_low = 10'h2b4;
              4'h5: pos_low = 10'h2b5;
              4'h6: pos_low = 10'h2b6;
              4'h7: pos_low = 10'h2b7;
              4'h8: pos_low = 10'h2b8;
              4'h9: pos_low = 10'h2b9;
              4'ha: pos_low = 10'h2ba;
              4'hb: pos_low = 10'h2bb;
              4'hc: pos_low = 10'h2bc;
              4'hd: pos_low = 10'h2bd;
              4'he: pos_low = 10'h2be;
              4'hf: pos_low = 10'h2bf;
              default: pos_low = 10'h000;
            endcase
          end
          6'h2c: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h2c0;
              4'h1: pos_low = 10'h2c1;
              4'h2: pos_low = 10'h2c2;
              4'h3: pos_low = 10'h2c3;
              4'h4: pos_low = 10'h2c4;
              4'h5: pos_low = 10'h2c5;
              4'h6: pos_low = 10'h2c6;
              4'h7: pos_low = 10'h2c7;
              4'h8: pos_low = 10'h2c8;
              4'h9: pos_low = 10'h2c9;
              4'ha: pos_low = 10'h2ca;
              4'hb: pos_low = 10'h2cb;
              4'hc: pos_low = 10'h2cc;
              4'hd: pos_low = 10'h2cd;
              4'he: pos_low = 10'h2ce;
              4'hf: pos_low = 10'h2cf;
              default: pos_low = 10'h000;
            endcase
          end
          6'h2d: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h2d0;
              4'h1: pos_low = 10'h2d1;
              4'h2: pos_low = 10'h2d2;
              4'h3: pos_low = 10'h2d3;
              4'h4: pos_low = 10'h2d4;
              4'h5: pos_low = 10'h2d5;
              4'h6: pos_low = 10'h2d6;
              4'h7: pos_low = 10'h2d7;
              4'h8: pos_low = 10'h2d8;
              4'h9: pos_low = 10'h2d9;
              4'ha: pos_low = 10'h2da;
              4'hb: pos_low = 10'h2db;
              4'hc: pos_low = 10'h2dc;
              4'hd: pos_low = 10'h2dd;
              4'he: pos_low = 10'h2de;
              4'hf: pos_low = 10'h2df;
              default: pos_low = 10'h000;
            endcase
          end
          6'h2e: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h2e0;
              4'h1: pos_low = 10'h2e1;
              4'h2: pos_low = 10'h2e2;
              4'h3: pos_low = 10'h2e3;
              4'h4: pos_low = 10'h2e4;
              4'h5: pos_low = 10'h2e5;
              4'h6: pos_low = 10'h2e6;
              4'h7: pos_low = 10'h2e7;
              4'h8: pos_low = 10'h2e8;
              4'h9: pos_low = 10'h2e9;
              4'ha: pos_low = 10'h2ea;
              4'hb: pos_low = 10'h2eb;
              4'hc: pos_low = 10'h2ec;
              4'hd: pos_low = 10'h2ed;
              4'he: pos_low = 10'h2ee;
              4'hf: pos_low = 10'h2ef;
              default: pos_low = 10'h000;
            endcase
          end
          6'h2f: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h2f0;
              4'h1: pos_low = 10'h2f1;
              4'h2: pos_low = 10'h2f2;
              4'h3: pos_low = 10'h2f3;
              4'h4: pos_low = 10'h2f4;
              4'h5: pos_low = 10'h2f5;
              4'h6: pos_low = 10'h2f6;
              4'h7: pos_low = 10'h2f7;
              4'h8: pos_low = 10'h2f8;
              4'h9: pos_low = 10'h2f9;
              4'ha: pos_low = 10'h2fa;
              4'hb: pos_low = 10'h2fb;
              4'hc: pos_low = 10'h2fc;
              4'hd: pos_low = 10'h2fd;
              4'he: pos_low = 10'h2fe;
              4'hf: pos_low = 10'h2ff;
              default: pos_low = 10'h000;
            endcase
          end
          6'h30: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h300;
              4'h1: pos_low = 10'h301;
              4'h2: pos_low = 10'h302;
              4'h3: pos_low = 10'h303;
              4'h4: pos_low = 10'h304;
              4'h5: pos_low = 10'h305;
              4'h6: pos_low = 10'h306;
              4'h7: pos_low = 10'h307;
              4'h8: pos_low = 10'h308;
              4'h9: pos_low = 10'h309;
              4'ha: pos_low = 10'h30a;
              4'hb: pos_low = 10'h30b;
              4'hc: pos_low = 10'h30c;
              4'hd: pos_low = 10'h30d;
              4'he: pos_low = 10'h30e;
              4'hf: pos_low = 10'h30f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h31: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h310;
              4'h1: pos_low = 10'h311;
              4'h2: pos_low = 10'h312;
              4'h3: pos_low = 10'h313;
              4'h4: pos_low = 10'h314;
              4'h5: pos_low = 10'h315;
              4'h6: pos_low = 10'h316;
              4'h7: pos_low = 10'h317;
              4'h8: pos_low = 10'h318;
              4'h9: pos_low = 10'h319;
              4'ha: pos_low = 10'h31a;
              4'hb: pos_low = 10'h31b;
              4'hc: pos_low = 10'h31c;
              4'hd: pos_low = 10'h31d;
              4'he: pos_low = 10'h31e;
              4'hf: pos_low = 10'h31f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h32: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h320;
              4'h1: pos_low = 10'h321;
              4'h2: pos_low = 10'h322;
              4'h3: pos_low = 10'h323;
              4'h4: pos_low = 10'h324;
              4'h5: pos_low = 10'h325;
              4'h6: pos_low = 10'h326;
              4'h7: pos_low = 10'h327;
              4'h8: pos_low = 10'h328;
              4'h9: pos_low = 10'h329;
              4'ha: pos_low = 10'h32a;
              4'hb: pos_low = 10'h32b;
              4'hc: pos_low = 10'h32c;
              4'hd: pos_low = 10'h32d;
              4'he: pos_low = 10'h32e;
              4'hf: pos_low = 10'h32f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h33: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h330;
              4'h1: pos_low = 10'h331;
              4'h2: pos_low = 10'h332;
              4'h3: pos_low = 10'h333;
              4'h4: pos_low = 10'h334;
              4'h5: pos_low = 10'h335;
              4'h6: pos_low = 10'h336;
              4'h7: pos_low = 10'h337;
              4'h8: pos_low = 10'h338;
              4'h9: pos_low = 10'h339;
              4'ha: pos_low = 10'h33a;
              4'hb: pos_low = 10'h33b;
              4'hc: pos_low = 10'h33c;
              4'hd: pos_low = 10'h33d;
              4'he: pos_low = 10'h33e;
              4'hf: pos_low = 10'h33f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h34: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h340;
              4'h1: pos_low = 10'h341;
              4'h2: pos_low = 10'h342;
              4'h3: pos_low = 10'h343;
              4'h4: pos_low = 10'h344;
              4'h5: pos_low = 10'h345;
              4'h6: pos_low = 10'h346;
              4'h7: pos_low = 10'h347;
              4'h8: pos_low = 10'h348;
              4'h9: pos_low = 10'h349;
              4'ha: pos_low = 10'h34a;
              4'hb: pos_low = 10'h34b;
              4'hc: pos_low = 10'h34c;
              4'hd: pos_low = 10'h34d;
              4'he: pos_low = 10'h34e;
              4'hf: pos_low = 10'h34f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h35: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h350;
              4'h1: pos_low = 10'h351;
              4'h2: pos_low = 10'h352;
              4'h3: pos_low = 10'h353;
              4'h4: pos_low = 10'h354;
              4'h5: pos_low = 10'h355;
              4'h6: pos_low = 10'h356;
              4'h7: pos_low = 10'h357;
              4'h8: pos_low = 10'h358;
              4'h9: pos_low = 10'h359;
              4'ha: pos_low = 10'h35a;
              4'hb: pos_low = 10'h35b;
              4'hc: pos_low = 10'h35c;
              4'hd: pos_low = 10'h35d;
              4'he: pos_low = 10'h35e;
              4'hf: pos_low = 10'h35f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h36: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h360;
              4'h1: pos_low = 10'h361;
              4'h2: pos_low = 10'h362;
              4'h3: pos_low = 10'h363;
              4'h4: pos_low = 10'h364;
              4'h5: pos_low = 10'h365;
              4'h6: pos_low = 10'h366;
              4'h7: pos_low = 10'h367;
              4'h8: pos_low = 10'h368;
              4'h9: pos_low = 10'h369;
              4'ha: pos_low = 10'h36a;
              4'hb: pos_low = 10'h36b;
              4'hc: pos_low = 10'h36c;
              4'hd: pos_low = 10'h36d;
              4'he: pos_low = 10'h36e;
              4'hf: pos_low = 10'h36f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h37: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h370;
              4'h1: pos_low = 10'h371;
              4'h2: pos_low = 10'h372;
              4'h3: pos_low = 10'h373;
              4'h4: pos_low = 10'h374;
              4'h5: pos_low = 10'h375;
              4'h6: pos_low = 10'h376;
              4'h7: pos_low = 10'h377;
              4'h8: pos_low = 10'h378;
              4'h9: pos_low = 10'h379;
              4'ha: pos_low = 10'h37a;
              4'hb: pos_low = 10'h37b;
              4'hc: pos_low = 10'h37c;
              4'hd: pos_low = 10'h37d;
              4'he: pos_low = 10'h37e;
              4'hf: pos_low = 10'h37f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h38: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h380;
              4'h1: pos_low = 10'h381;
              4'h2: pos_low = 10'h382;
              4'h3: pos_low = 10'h383;
              4'h4: pos_low = 10'h384;
              4'h5: pos_low = 10'h385;
              4'h6: pos_low = 10'h386;
              4'h7: pos_low = 10'h387;
              4'h8: pos_low = 10'h388;
              4'h9: pos_low = 10'h389;
              4'ha: pos_low = 10'h38a;
              4'hb: pos_low = 10'h38b;
              4'hc: pos_low = 10'h38c;
              4'hd: pos_low = 10'h38d;
              4'he: pos_low = 10'h38e;
              4'hf: pos_low = 10'h38f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h39: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h390;
              4'h1: pos_low = 10'h391;
              4'h2: pos_low = 10'h392;
              4'h3: pos_low = 10'h393;
              4'h4: pos_low = 10'h394;
              4'h5: pos_low = 10'h395;
              4'h6: pos_low = 10'h396;
              4'h7: pos_low = 10'h397;
              4'h8: pos_low = 10'h398;
              4'h9: pos_low = 10'h399;
              4'ha: pos_low = 10'h39a;
              4'hb: pos_low = 10'h39b;
              4'hc: pos_low = 10'h39c;
              4'hd: pos_low = 10'h39d;
              4'he: pos_low = 10'h39e;
              4'hf: pos_low = 10'h39f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h3a: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3a0;
              4'h1: pos_low = 10'h3a1;
              4'h2: pos_low = 10'h3a2;
              4'h3: pos_low = 10'h3a3;
              4'h4: pos_low = 10'h3a4;
              4'h5: pos_low = 10'h3a5;
              4'h6: pos_low = 10'h3a6;
              4'h7: pos_low = 10'h3a7;
              4'h8: pos_low = 10'h3a8;
              4'h9: pos_low = 10'h3a9;
              4'ha: pos_low = 10'h3aa;
              4'hb: pos_low = 10'h3ab;
              4'hc: pos_low = 10'h3ac;
              4'hd: pos_low = 10'h3ad;
              4'he: pos_low = 10'h3ae;
              4'hf: pos_low = 10'h3af;
              default: pos_low = 10'h000;
            endcase
          end
          6'h3b: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3b0;
              4'h1: pos_low = 10'h3b1;
              4'h2: pos_low = 10'h3b2;
              4'h3: pos_low = 10'h3b3;
              4'h4: pos_low = 10'h3b4;
              4'h5: pos_low = 10'h3b5;
              4'h6: pos_low = 10'h3b6;
              4'h7: pos_low = 10'h3b7;
              4'h8: pos_low = 10'h3b8;
              4'h9: pos_low = 10'h3b9;
              4'ha: pos_low = 10'h3ba;
              4'hb: pos_low = 10'h3bb;
              4'hc: pos_low = 10'h3bc;
              4'hd: pos_low = 10'h3bd;
              4'he: pos_low = 10'h3be;
              4'hf: pos_low = 10'h3bf;
              default: pos_low = 10'h000;
            endcase
          end
          6'h3c: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3c0;
              4'h1: pos_low = 10'h3c1;
              4'h2: pos_low = 10'h3c2;
              4'h3: pos_low = 10'h3c3;
              4'h4: pos_low = 10'h3c4;
              4'h5: pos_low = 10'h3c5;
              4'h6: pos_low = 10'h3c6;
              4'h7: pos_low = 10'h3c7;
              4'h8: pos_low = 10'h3c8;
              4'h9: pos_low = 10'h3c9;
              4'ha: pos_low = 10'h3ca;
              4'hb: pos_low = 10'h3cb;
              4'hc: pos_low = 10'h3cc;
              4'hd: pos_low = 10'h3cd;
              4'he: pos_low = 10'h3ce;
              4'hf: pos_low = 10'h3cf;
              default: pos_low = 10'h000;
            endcase
          end
          6'h3d: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3d0;
              4'h1: pos_low = 10'h3d1;
              4'h2: pos_low = 10'h3d2;
              4'h3: pos_low = 10'h3d3;
              4'h4: pos_low = 10'h3d4;
              4'h5: pos_low = 10'h3d5;
              4'h6: pos_low = 10'h3d6;
              4'h7: pos_low = 10'h3d7;
              4'h8: pos_low = 10'h3d8;
              4'h9: pos_low = 10'h3d9;
              4'ha: pos_low = 10'h3da;
              4'hb: pos_low = 10'h3db;
              4'hc: pos_low = 10'h3dc;
              4'hd: pos_low = 10'h3dd;
              4'he: pos_low = 10'h3de;
              4'hf: pos_low = 10'h3df;
              default: pos_low = 10'h000;
            endcase
          end
          6'h3e: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3e0;
              4'h1: pos_low = 10'h3e1;
              4'h2: pos_low = 10'h3e2;
              4'h3: pos_low = 10'h3e3;
              4'h4: pos_low = 10'h3e4;
              4'h5: pos_low = 10'h3e5;
              4'h6: pos_low = 10'h3e6;
              4'h7: pos_low = 10'h3e7;
              4'h8: pos_low = 10'h3e8;
              4'h9: pos_low = 10'h3e9;
              4'ha: pos_low = 10'h3ea;
              4'hb: pos_low = 10'h3eb;
              4'hc: pos_low = 10'h3ec;
              4'hd: pos_low = 10'h3ed;
              4'he: pos_low = 10'h3ee;
              4'hf: pos_low = 10'h3ef;
              default: pos_low = 10'h000;
            endcase
          end
          6'h3f: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3f0;
              4'h1: pos_low = 10'h3f1;
              4'h2: pos_low = 10'h3f2;
              4'h3: pos_low = 10'h3f3;
              4'h4: pos_low = 10'h3f4;
              4'h5: pos_low = 10'h3f5;
              4'h6: pos_low = 10'h3f6;
              4'h7: pos_low = 10'h3f7;
              4'h8: pos_low = 10'h3f8;
              4'h9: pos_low = 10'h3f9;
              4'ha: pos_low = 10'h3fa;
              4'hb: pos_low = 10'h3fb;
              4'hc: pos_low = 10'h3fc;
              4'hd: pos_low = 10'h3fd;
              4'he: pos_low = 10'h3fe;
              4'hf: pos_low = 10'h3ff;
              default: pos_low = 10'h000;
            endcase
          end
          default: begin end
        endcase
      end
      5'h09: begin
        case (mant[9:4])
          6'h00: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h000;
              4'h1: pos_low = 10'h001;
              4'h2: pos_low = 10'h002;
              4'h3: pos_low = 10'h003;
              4'h4: pos_low = 10'h004;
              4'h5: pos_low = 10'h005;
              4'h6: pos_low = 10'h006;
              4'h7: pos_low = 10'h007;
              4'h8: pos_low = 10'h008;
              4'h9: pos_low = 10'h009;
              4'ha: pos_low = 10'h00a;
              4'hb: pos_low = 10'h00b;
              4'hc: pos_low = 10'h00c;
              4'hd: pos_low = 10'h00d;
              4'he: pos_low = 10'h00e;
              4'hf: pos_low = 10'h00f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h01: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h010;
              4'h1: pos_low = 10'h011;
              4'h2: pos_low = 10'h012;
              4'h3: pos_low = 10'h013;
              4'h4: pos_low = 10'h014;
              4'h5: pos_low = 10'h015;
              4'h6: pos_low = 10'h016;
              4'h7: pos_low = 10'h017;
              4'h8: pos_low = 10'h018;
              4'h9: pos_low = 10'h019;
              4'ha: pos_low = 10'h01a;
              4'hb: pos_low = 10'h01b;
              4'hc: pos_low = 10'h01c;
              4'hd: pos_low = 10'h01d;
              4'he: pos_low = 10'h01e;
              4'hf: pos_low = 10'h01f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h02: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h020;
              4'h1: pos_low = 10'h021;
              4'h2: pos_low = 10'h022;
              4'h3: pos_low = 10'h023;
              4'h4: pos_low = 10'h024;
              4'h5: pos_low = 10'h025;
              4'h6: pos_low = 10'h026;
              4'h7: pos_low = 10'h027;
              4'h8: pos_low = 10'h028;
              4'h9: pos_low = 10'h029;
              4'ha: pos_low = 10'h02a;
              4'hb: pos_low = 10'h02b;
              4'hc: pos_low = 10'h02c;
              4'hd: pos_low = 10'h02d;
              4'he: pos_low = 10'h02e;
              4'hf: pos_low = 10'h02f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h03: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h030;
              4'h1: pos_low = 10'h031;
              4'h2: pos_low = 10'h032;
              4'h3: pos_low = 10'h033;
              4'h4: pos_low = 10'h034;
              4'h5: pos_low = 10'h035;
              4'h6: pos_low = 10'h036;
              4'h7: pos_low = 10'h037;
              4'h8: pos_low = 10'h038;
              4'h9: pos_low = 10'h039;
              4'ha: pos_low = 10'h03a;
              4'hb: pos_low = 10'h03b;
              4'hc: pos_low = 10'h03c;
              4'hd: pos_low = 10'h03d;
              4'he: pos_low = 10'h03e;
              4'hf: pos_low = 10'h03f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h04: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h040;
              4'h1: pos_low = 10'h041;
              4'h2: pos_low = 10'h042;
              4'h3: pos_low = 10'h043;
              4'h4: pos_low = 10'h044;
              4'h5: pos_low = 10'h045;
              4'h6: pos_low = 10'h046;
              4'h7: pos_low = 10'h047;
              4'h8: pos_low = 10'h048;
              4'h9: pos_low = 10'h049;
              4'ha: pos_low = 10'h04a;
              4'hb: pos_low = 10'h04b;
              4'hc: pos_low = 10'h04c;
              4'hd: pos_low = 10'h04d;
              4'he: pos_low = 10'h04e;
              4'hf: pos_low = 10'h04f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h05: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h050;
              4'h1: pos_low = 10'h051;
              4'h2: pos_low = 10'h052;
              4'h3: pos_low = 10'h053;
              4'h4: pos_low = 10'h054;
              4'h5: pos_low = 10'h055;
              4'h6: pos_low = 10'h056;
              4'h7: pos_low = 10'h057;
              4'h8: pos_low = 10'h058;
              4'h9: pos_low = 10'h059;
              4'ha: pos_low = 10'h05a;
              4'hb: pos_low = 10'h05b;
              4'hc: pos_low = 10'h05c;
              4'hd: pos_low = 10'h05d;
              4'he: pos_low = 10'h05e;
              4'hf: pos_low = 10'h05f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h06: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h060;
              4'h1: pos_low = 10'h061;
              4'h2: pos_low = 10'h062;
              4'h3: pos_low = 10'h063;
              4'h4: pos_low = 10'h064;
              4'h5: pos_low = 10'h065;
              4'h6: pos_low = 10'h066;
              4'h7: pos_low = 10'h067;
              4'h8: pos_low = 10'h068;
              4'h9: pos_low = 10'h069;
              4'ha: pos_low = 10'h06a;
              4'hb: pos_low = 10'h06b;
              4'hc: pos_low = 10'h06c;
              4'hd: pos_low = 10'h06d;
              4'he: pos_low = 10'h06e;
              4'hf: pos_low = 10'h06f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h07: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h070;
              4'h1: pos_low = 10'h071;
              4'h2: pos_low = 10'h072;
              4'h3: pos_low = 10'h073;
              4'h4: pos_low = 10'h074;
              4'h5: pos_low = 10'h075;
              4'h6: pos_low = 10'h076;
              4'h7: pos_low = 10'h077;
              4'h8: pos_low = 10'h078;
              4'h9: pos_low = 10'h079;
              4'ha: pos_low = 10'h07a;
              4'hb: pos_low = 10'h07b;
              4'hc: pos_low = 10'h07c;
              4'hd: pos_low = 10'h07d;
              4'he: pos_low = 10'h07e;
              4'hf: pos_low = 10'h07f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h08: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h080;
              4'h1: pos_low = 10'h081;
              4'h2: pos_low = 10'h082;
              4'h3: pos_low = 10'h083;
              4'h4: pos_low = 10'h084;
              4'h5: pos_low = 10'h085;
              4'h6: pos_low = 10'h086;
              4'h7: pos_low = 10'h087;
              4'h8: pos_low = 10'h088;
              4'h9: pos_low = 10'h089;
              4'ha: pos_low = 10'h08a;
              4'hb: pos_low = 10'h08b;
              4'hc: pos_low = 10'h08c;
              4'hd: pos_low = 10'h08d;
              4'he: pos_low = 10'h08e;
              4'hf: pos_low = 10'h08f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h09: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h090;
              4'h1: pos_low = 10'h091;
              4'h2: pos_low = 10'h092;
              4'h3: pos_low = 10'h093;
              4'h4: pos_low = 10'h094;
              4'h5: pos_low = 10'h095;
              4'h6: pos_low = 10'h096;
              4'h7: pos_low = 10'h097;
              4'h8: pos_low = 10'h098;
              4'h9: pos_low = 10'h099;
              4'ha: pos_low = 10'h09a;
              4'hb: pos_low = 10'h09b;
              4'hc: pos_low = 10'h09c;
              4'hd: pos_low = 10'h09d;
              4'he: pos_low = 10'h09e;
              4'hf: pos_low = 10'h09f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h0a: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h0a0;
              4'h1: pos_low = 10'h0a1;
              4'h2: pos_low = 10'h0a2;
              4'h3: pos_low = 10'h0a3;
              4'h4: pos_low = 10'h0a4;
              4'h5: pos_low = 10'h0a5;
              4'h6: pos_low = 10'h0a6;
              4'h7: pos_low = 10'h0a7;
              4'h8: pos_low = 10'h0a8;
              4'h9: pos_low = 10'h0a9;
              4'ha: pos_low = 10'h0aa;
              4'hb: pos_low = 10'h0ab;
              4'hc: pos_low = 10'h0ac;
              4'hd: pos_low = 10'h0ad;
              4'he: pos_low = 10'h0ae;
              4'hf: pos_low = 10'h0af;
              default: pos_low = 10'h000;
            endcase
          end
          6'h0b: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h0b0;
              4'h1: pos_low = 10'h0b1;
              4'h2: pos_low = 10'h0b2;
              4'h3: pos_low = 10'h0b3;
              4'h4: pos_low = 10'h0b4;
              4'h5: pos_low = 10'h0b5;
              4'h6: pos_low = 10'h0b6;
              4'h7: pos_low = 10'h0b7;
              4'h8: pos_low = 10'h0b8;
              4'h9: pos_low = 10'h0b9;
              4'ha: pos_low = 10'h0ba;
              4'hb: pos_low = 10'h0bb;
              4'hc: pos_low = 10'h0bc;
              4'hd: pos_low = 10'h0bd;
              4'he: pos_low = 10'h0be;
              4'hf: pos_low = 10'h0bf;
              default: pos_low = 10'h000;
            endcase
          end
          6'h0c: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h0c0;
              4'h1: pos_low = 10'h0c1;
              4'h2: pos_low = 10'h0c2;
              4'h3: pos_low = 10'h0c3;
              4'h4: pos_low = 10'h0c4;
              4'h5: pos_low = 10'h0c5;
              4'h6: pos_low = 10'h0c6;
              4'h7: pos_low = 10'h0c7;
              4'h8: pos_low = 10'h0c8;
              4'h9: pos_low = 10'h0c9;
              4'ha: pos_low = 10'h0ca;
              4'hb: pos_low = 10'h0cb;
              4'hc: pos_low = 10'h0cc;
              4'hd: pos_low = 10'h0cd;
              4'he: pos_low = 10'h0ce;
              4'hf: pos_low = 10'h0cf;
              default: pos_low = 10'h000;
            endcase
          end
          6'h0d: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h0d0;
              4'h1: pos_low = 10'h0d1;
              4'h2: pos_low = 10'h0d2;
              4'h3: pos_low = 10'h0d3;
              4'h4: pos_low = 10'h0d4;
              4'h5: pos_low = 10'h0d5;
              4'h6: pos_low = 10'h0d6;
              4'h7: pos_low = 10'h0d7;
              4'h8: pos_low = 10'h0d8;
              4'h9: pos_low = 10'h0d9;
              4'ha: pos_low = 10'h0da;
              4'hb: pos_low = 10'h0db;
              4'hc: pos_low = 10'h0dc;
              4'hd: pos_low = 10'h0dd;
              4'he: pos_low = 10'h0de;
              4'hf: pos_low = 10'h0df;
              default: pos_low = 10'h000;
            endcase
          end
          6'h0e: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h0e0;
              4'h1: pos_low = 10'h0e1;
              4'h2: pos_low = 10'h0e2;
              4'h3: pos_low = 10'h0e3;
              4'h4: pos_low = 10'h0e4;
              4'h5: pos_low = 10'h0e5;
              4'h6: pos_low = 10'h0e6;
              4'h7: pos_low = 10'h0e7;
              4'h8: pos_low = 10'h0e8;
              4'h9: pos_low = 10'h0e9;
              4'ha: pos_low = 10'h0ea;
              4'hb: pos_low = 10'h0eb;
              4'hc: pos_low = 10'h0ec;
              4'hd: pos_low = 10'h0ed;
              4'he: pos_low = 10'h0ee;
              4'hf: pos_low = 10'h0ef;
              default: pos_low = 10'h000;
            endcase
          end
          6'h0f: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h0f0;
              4'h1: pos_low = 10'h0f1;
              4'h2: pos_low = 10'h0f2;
              4'h3: pos_low = 10'h0f3;
              4'h4: pos_low = 10'h0f4;
              4'h5: pos_low = 10'h0f5;
              4'h6: pos_low = 10'h0f6;
              4'h7: pos_low = 10'h0f7;
              4'h8: pos_low = 10'h0f8;
              4'h9: pos_low = 10'h0f9;
              4'ha: pos_low = 10'h0fa;
              4'hb: pos_low = 10'h0fb;
              4'hc: pos_low = 10'h0fc;
              4'hd: pos_low = 10'h0fd;
              4'he: pos_low = 10'h0fe;
              4'hf: pos_low = 10'h0ff;
              default: pos_low = 10'h000;
            endcase
          end
          6'h10: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h100;
              4'h1: pos_low = 10'h101;
              4'h2: pos_low = 10'h102;
              4'h3: pos_low = 10'h103;
              4'h4: pos_low = 10'h104;
              4'h5: pos_low = 10'h105;
              4'h6: pos_low = 10'h106;
              4'h7: pos_low = 10'h107;
              4'h8: pos_low = 10'h108;
              4'h9: pos_low = 10'h109;
              4'ha: pos_low = 10'h10a;
              4'hb: pos_low = 10'h10b;
              4'hc: pos_low = 10'h10c;
              4'hd: pos_low = 10'h10d;
              4'he: pos_low = 10'h10e;
              4'hf: pos_low = 10'h10f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h11: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h110;
              4'h1: pos_low = 10'h111;
              4'h2: pos_low = 10'h112;
              4'h3: pos_low = 10'h113;
              4'h4: pos_low = 10'h114;
              4'h5: pos_low = 10'h115;
              4'h6: pos_low = 10'h116;
              4'h7: pos_low = 10'h117;
              4'h8: pos_low = 10'h118;
              4'h9: pos_low = 10'h119;
              4'ha: pos_low = 10'h11a;
              4'hb: pos_low = 10'h11b;
              4'hc: pos_low = 10'h11c;
              4'hd: pos_low = 10'h11d;
              4'he: pos_low = 10'h11e;
              4'hf: pos_low = 10'h11f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h12: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h120;
              4'h1: pos_low = 10'h121;
              4'h2: pos_low = 10'h122;
              4'h3: pos_low = 10'h123;
              4'h4: pos_low = 10'h124;
              4'h5: pos_low = 10'h125;
              4'h6: pos_low = 10'h126;
              4'h7: pos_low = 10'h127;
              4'h8: pos_low = 10'h128;
              4'h9: pos_low = 10'h129;
              4'ha: pos_low = 10'h12a;
              4'hb: pos_low = 10'h12b;
              4'hc: pos_low = 10'h12c;
              4'hd: pos_low = 10'h12d;
              4'he: pos_low = 10'h12e;
              4'hf: pos_low = 10'h12f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h13: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h130;
              4'h1: pos_low = 10'h131;
              4'h2: pos_low = 10'h132;
              4'h3: pos_low = 10'h133;
              4'h4: pos_low = 10'h134;
              4'h5: pos_low = 10'h135;
              4'h6: pos_low = 10'h136;
              4'h7: pos_low = 10'h137;
              4'h8: pos_low = 10'h138;
              4'h9: pos_low = 10'h139;
              4'ha: pos_low = 10'h13a;
              4'hb: pos_low = 10'h13b;
              4'hc: pos_low = 10'h13c;
              4'hd: pos_low = 10'h13d;
              4'he: pos_low = 10'h13e;
              4'hf: pos_low = 10'h13f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h14: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h140;
              4'h1: pos_low = 10'h141;
              4'h2: pos_low = 10'h142;
              4'h3: pos_low = 10'h143;
              4'h4: pos_low = 10'h144;
              4'h5: pos_low = 10'h145;
              4'h6: pos_low = 10'h146;
              4'h7: pos_low = 10'h147;
              4'h8: pos_low = 10'h148;
              4'h9: pos_low = 10'h149;
              4'ha: pos_low = 10'h14a;
              4'hb: pos_low = 10'h14b;
              4'hc: pos_low = 10'h14c;
              4'hd: pos_low = 10'h14d;
              4'he: pos_low = 10'h14e;
              4'hf: pos_low = 10'h14f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h15: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h150;
              4'h1: pos_low = 10'h151;
              4'h2: pos_low = 10'h152;
              4'h3: pos_low = 10'h153;
              4'h4: pos_low = 10'h154;
              4'h5: pos_low = 10'h155;
              4'h6: pos_low = 10'h156;
              4'h7: pos_low = 10'h157;
              4'h8: pos_low = 10'h158;
              4'h9: pos_low = 10'h159;
              4'ha: pos_low = 10'h15a;
              4'hb: pos_low = 10'h15b;
              4'hc: pos_low = 10'h15c;
              4'hd: pos_low = 10'h15d;
              4'he: pos_low = 10'h15e;
              4'hf: pos_low = 10'h15f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h16: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h160;
              4'h1: pos_low = 10'h161;
              4'h2: pos_low = 10'h162;
              4'h3: pos_low = 10'h163;
              4'h4: pos_low = 10'h164;
              4'h5: pos_low = 10'h165;
              4'h6: pos_low = 10'h166;
              4'h7: pos_low = 10'h167;
              4'h8: pos_low = 10'h168;
              4'h9: pos_low = 10'h169;
              4'ha: pos_low = 10'h16a;
              4'hb: pos_low = 10'h16b;
              4'hc: pos_low = 10'h16c;
              4'hd: pos_low = 10'h16d;
              4'he: pos_low = 10'h16e;
              4'hf: pos_low = 10'h16f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h17: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h170;
              4'h1: pos_low = 10'h171;
              4'h2: pos_low = 10'h172;
              4'h3: pos_low = 10'h173;
              4'h4: pos_low = 10'h174;
              4'h5: pos_low = 10'h175;
              4'h6: pos_low = 10'h176;
              4'h7: pos_low = 10'h177;
              4'h8: pos_low = 10'h178;
              4'h9: pos_low = 10'h179;
              4'ha: pos_low = 10'h17a;
              4'hb: pos_low = 10'h17b;
              4'hc: pos_low = 10'h17c;
              4'hd: pos_low = 10'h17d;
              4'he: pos_low = 10'h17e;
              4'hf: pos_low = 10'h17f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h18: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h180;
              4'h1: pos_low = 10'h181;
              4'h2: pos_low = 10'h182;
              4'h3: pos_low = 10'h183;
              4'h4: pos_low = 10'h184;
              4'h5: pos_low = 10'h185;
              4'h6: pos_low = 10'h186;
              4'h7: pos_low = 10'h187;
              4'h8: pos_low = 10'h188;
              4'h9: pos_low = 10'h189;
              4'ha: pos_low = 10'h18a;
              4'hb: pos_low = 10'h18b;
              4'hc: pos_low = 10'h18c;
              4'hd: pos_low = 10'h18d;
              4'he: pos_low = 10'h18e;
              4'hf: pos_low = 10'h18f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h19: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h190;
              4'h1: pos_low = 10'h191;
              4'h2: pos_low = 10'h192;
              4'h3: pos_low = 10'h193;
              4'h4: pos_low = 10'h194;
              4'h5: pos_low = 10'h195;
              4'h6: pos_low = 10'h196;
              4'h7: pos_low = 10'h197;
              4'h8: pos_low = 10'h198;
              4'h9: pos_low = 10'h199;
              4'ha: pos_low = 10'h19a;
              4'hb: pos_low = 10'h19b;
              4'hc: pos_low = 10'h19c;
              4'hd: pos_low = 10'h19d;
              4'he: pos_low = 10'h19e;
              4'hf: pos_low = 10'h19f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h1a: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h1a0;
              4'h1: pos_low = 10'h1a1;
              4'h2: pos_low = 10'h1a2;
              4'h3: pos_low = 10'h1a3;
              4'h4: pos_low = 10'h1a4;
              4'h5: pos_low = 10'h1a5;
              4'h6: pos_low = 10'h1a6;
              4'h7: pos_low = 10'h1a7;
              4'h8: pos_low = 10'h1a8;
              4'h9: pos_low = 10'h1a9;
              4'ha: pos_low = 10'h1aa;
              4'hb: pos_low = 10'h1ab;
              4'hc: pos_low = 10'h1ac;
              4'hd: pos_low = 10'h1ad;
              4'he: pos_low = 10'h1ae;
              4'hf: pos_low = 10'h1af;
              default: pos_low = 10'h000;
            endcase
          end
          6'h1b: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h1b0;
              4'h1: pos_low = 10'h1b1;
              4'h2: pos_low = 10'h1b2;
              4'h3: pos_low = 10'h1b3;
              4'h4: pos_low = 10'h1b4;
              4'h5: pos_low = 10'h1b5;
              4'h6: pos_low = 10'h1b6;
              4'h7: pos_low = 10'h1b7;
              4'h8: pos_low = 10'h1b8;
              4'h9: pos_low = 10'h1b9;
              4'ha: pos_low = 10'h1ba;
              4'hb: pos_low = 10'h1bb;
              4'hc: pos_low = 10'h1bc;
              4'hd: pos_low = 10'h1bd;
              4'he: pos_low = 10'h1be;
              4'hf: pos_low = 10'h1bf;
              default: pos_low = 10'h000;
            endcase
          end
          6'h1c: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h1c0;
              4'h1: pos_low = 10'h1c1;
              4'h2: pos_low = 10'h1c2;
              4'h3: pos_low = 10'h1c3;
              4'h4: pos_low = 10'h1c4;
              4'h5: pos_low = 10'h1c5;
              4'h6: pos_low = 10'h1c6;
              4'h7: pos_low = 10'h1c7;
              4'h8: pos_low = 10'h1c8;
              4'h9: pos_low = 10'h1c9;
              4'ha: pos_low = 10'h1ca;
              4'hb: pos_low = 10'h1cb;
              4'hc: pos_low = 10'h1cc;
              4'hd: pos_low = 10'h1cd;
              4'he: pos_low = 10'h1ce;
              4'hf: pos_low = 10'h1cf;
              default: pos_low = 10'h000;
            endcase
          end
          6'h1d: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h1d0;
              4'h1: pos_low = 10'h1d1;
              4'h2: pos_low = 10'h1d2;
              4'h3: pos_low = 10'h1d3;
              4'h4: pos_low = 10'h1d4;
              4'h5: pos_low = 10'h1d5;
              4'h6: pos_low = 10'h1d6;
              4'h7: pos_low = 10'h1d7;
              4'h8: pos_low = 10'h1d8;
              4'h9: pos_low = 10'h1d9;
              4'ha: pos_low = 10'h1da;
              4'hb: pos_low = 10'h1db;
              4'hc: pos_low = 10'h1dc;
              4'hd: pos_low = 10'h1dd;
              4'he: pos_low = 10'h1de;
              4'hf: pos_low = 10'h1df;
              default: pos_low = 10'h000;
            endcase
          end
          6'h1e: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h1e0;
              4'h1: pos_low = 10'h1e1;
              4'h2: pos_low = 10'h1e2;
              4'h3: pos_low = 10'h1e3;
              4'h4: pos_low = 10'h1e4;
              4'h5: pos_low = 10'h1e5;
              4'h6: pos_low = 10'h1e6;
              4'h7: pos_low = 10'h1e7;
              4'h8: pos_low = 10'h1e8;
              4'h9: pos_low = 10'h1e9;
              4'ha: pos_low = 10'h1ea;
              4'hb: pos_low = 10'h1eb;
              4'hc: pos_low = 10'h1ec;
              4'hd: pos_low = 10'h1ed;
              4'he: pos_low = 10'h1ee;
              4'hf: pos_low = 10'h1ef;
              default: pos_low = 10'h000;
            endcase
          end
          6'h1f: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h1f0;
              4'h1: pos_low = 10'h1f1;
              4'h2: pos_low = 10'h1f2;
              4'h3: pos_low = 10'h1f3;
              4'h4: pos_low = 10'h1f4;
              4'h5: pos_low = 10'h1f5;
              4'h6: pos_low = 10'h1f6;
              4'h7: pos_low = 10'h1f7;
              4'h8: pos_low = 10'h1f8;
              4'h9: pos_low = 10'h1f9;
              4'ha: pos_low = 10'h1fa;
              4'hb: pos_low = 10'h1fb;
              4'hc: pos_low = 10'h1fc;
              4'hd: pos_low = 10'h1fd;
              4'he: pos_low = 10'h1fe;
              4'hf: pos_low = 10'h1ff;
              default: pos_low = 10'h000;
            endcase
          end
          6'h20: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h200;
              4'h1: pos_low = 10'h201;
              4'h2: pos_low = 10'h202;
              4'h3: pos_low = 10'h203;
              4'h4: pos_low = 10'h204;
              4'h5: pos_low = 10'h205;
              4'h6: pos_low = 10'h206;
              4'h7: pos_low = 10'h207;
              4'h8: pos_low = 10'h208;
              4'h9: pos_low = 10'h209;
              4'ha: pos_low = 10'h20a;
              4'hb: pos_low = 10'h20b;
              4'hc: pos_low = 10'h20c;
              4'hd: pos_low = 10'h20d;
              4'he: pos_low = 10'h20e;
              4'hf: pos_low = 10'h20f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h21: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h210;
              4'h1: pos_low = 10'h211;
              4'h2: pos_low = 10'h212;
              4'h3: pos_low = 10'h213;
              4'h4: pos_low = 10'h214;
              4'h5: pos_low = 10'h215;
              4'h6: pos_low = 10'h216;
              4'h7: pos_low = 10'h217;
              4'h8: pos_low = 10'h218;
              4'h9: pos_low = 10'h219;
              4'ha: pos_low = 10'h21a;
              4'hb: pos_low = 10'h21b;
              4'hc: pos_low = 10'h21c;
              4'hd: pos_low = 10'h21d;
              4'he: pos_low = 10'h21e;
              4'hf: pos_low = 10'h21f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h22: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h220;
              4'h1: pos_low = 10'h221;
              4'h2: pos_low = 10'h222;
              4'h3: pos_low = 10'h223;
              4'h4: pos_low = 10'h224;
              4'h5: pos_low = 10'h225;
              4'h6: pos_low = 10'h226;
              4'h7: pos_low = 10'h227;
              4'h8: pos_low = 10'h228;
              4'h9: pos_low = 10'h229;
              4'ha: pos_low = 10'h22a;
              4'hb: pos_low = 10'h22b;
              4'hc: pos_low = 10'h22c;
              4'hd: pos_low = 10'h22d;
              4'he: pos_low = 10'h22e;
              4'hf: pos_low = 10'h22f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h23: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h230;
              4'h1: pos_low = 10'h231;
              4'h2: pos_low = 10'h232;
              4'h3: pos_low = 10'h233;
              4'h4: pos_low = 10'h234;
              4'h5: pos_low = 10'h235;
              4'h6: pos_low = 10'h236;
              4'h7: pos_low = 10'h237;
              4'h8: pos_low = 10'h238;
              4'h9: pos_low = 10'h239;
              4'ha: pos_low = 10'h23a;
              4'hb: pos_low = 10'h23b;
              4'hc: pos_low = 10'h23c;
              4'hd: pos_low = 10'h23d;
              4'he: pos_low = 10'h23e;
              4'hf: pos_low = 10'h23f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h24: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h240;
              4'h1: pos_low = 10'h241;
              4'h2: pos_low = 10'h242;
              4'h3: pos_low = 10'h243;
              4'h4: pos_low = 10'h244;
              4'h5: pos_low = 10'h245;
              4'h6: pos_low = 10'h246;
              4'h7: pos_low = 10'h247;
              4'h8: pos_low = 10'h248;
              4'h9: pos_low = 10'h249;
              4'ha: pos_low = 10'h24a;
              4'hb: pos_low = 10'h24b;
              4'hc: pos_low = 10'h24c;
              4'hd: pos_low = 10'h24d;
              4'he: pos_low = 10'h24e;
              4'hf: pos_low = 10'h24f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h25: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h250;
              4'h1: pos_low = 10'h251;
              4'h2: pos_low = 10'h252;
              4'h3: pos_low = 10'h253;
              4'h4: pos_low = 10'h254;
              4'h5: pos_low = 10'h255;
              4'h6: pos_low = 10'h256;
              4'h7: pos_low = 10'h257;
              4'h8: pos_low = 10'h258;
              4'h9: pos_low = 10'h259;
              4'ha: pos_low = 10'h25a;
              4'hb: pos_low = 10'h25b;
              4'hc: pos_low = 10'h25c;
              4'hd: pos_low = 10'h25d;
              4'he: pos_low = 10'h25e;
              4'hf: pos_low = 10'h25f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h26: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h260;
              4'h1: pos_low = 10'h261;
              4'h2: pos_low = 10'h262;
              4'h3: pos_low = 10'h263;
              4'h4: pos_low = 10'h264;
              4'h5: pos_low = 10'h265;
              4'h6: pos_low = 10'h266;
              4'h7: pos_low = 10'h267;
              4'h8: pos_low = 10'h268;
              4'h9: pos_low = 10'h269;
              4'ha: pos_low = 10'h26a;
              4'hb: pos_low = 10'h26b;
              4'hc: pos_low = 10'h26c;
              4'hd: pos_low = 10'h26d;
              4'he: pos_low = 10'h26e;
              4'hf: pos_low = 10'h26f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h27: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h270;
              4'h1: pos_low = 10'h271;
              4'h2: pos_low = 10'h272;
              4'h3: pos_low = 10'h273;
              4'h4: pos_low = 10'h274;
              4'h5: pos_low = 10'h275;
              4'h6: pos_low = 10'h276;
              4'h7: pos_low = 10'h277;
              4'h8: pos_low = 10'h278;
              4'h9: pos_low = 10'h279;
              4'ha: pos_low = 10'h27a;
              4'hb: pos_low = 10'h27b;
              4'hc: pos_low = 10'h27c;
              4'hd: pos_low = 10'h27d;
              4'he: pos_low = 10'h27e;
              4'hf: pos_low = 10'h27f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h28: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h280;
              4'h1: pos_low = 10'h281;
              4'h2: pos_low = 10'h282;
              4'h3: pos_low = 10'h283;
              4'h4: pos_low = 10'h284;
              4'h5: pos_low = 10'h285;
              4'h6: pos_low = 10'h286;
              4'h7: pos_low = 10'h287;
              4'h8: pos_low = 10'h288;
              4'h9: pos_low = 10'h289;
              4'ha: pos_low = 10'h28a;
              4'hb: pos_low = 10'h28b;
              4'hc: pos_low = 10'h28c;
              4'hd: pos_low = 10'h28d;
              4'he: pos_low = 10'h28e;
              4'hf: pos_low = 10'h28f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h29: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h290;
              4'h1: pos_low = 10'h291;
              4'h2: pos_low = 10'h292;
              4'h3: pos_low = 10'h293;
              4'h4: pos_low = 10'h294;
              4'h5: pos_low = 10'h295;
              4'h6: pos_low = 10'h296;
              4'h7: pos_low = 10'h297;
              4'h8: pos_low = 10'h298;
              4'h9: pos_low = 10'h299;
              4'ha: pos_low = 10'h29a;
              4'hb: pos_low = 10'h29b;
              4'hc: pos_low = 10'h29c;
              4'hd: pos_low = 10'h29d;
              4'he: pos_low = 10'h29e;
              4'hf: pos_low = 10'h29f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h2a: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h2a0;
              4'h1: pos_low = 10'h2a1;
              4'h2: pos_low = 10'h2a2;
              4'h3: pos_low = 10'h2a3;
              4'h4: pos_low = 10'h2a4;
              4'h5: pos_low = 10'h2a5;
              4'h6: pos_low = 10'h2a6;
              4'h7: pos_low = 10'h2a7;
              4'h8: pos_low = 10'h2a8;
              4'h9: pos_low = 10'h2a9;
              4'ha: pos_low = 10'h2aa;
              4'hb: pos_low = 10'h2ab;
              4'hc: pos_low = 10'h2ac;
              4'hd: pos_low = 10'h2ad;
              4'he: pos_low = 10'h2ae;
              4'hf: pos_low = 10'h2af;
              default: pos_low = 10'h000;
            endcase
          end
          6'h2b: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h2b0;
              4'h1: pos_low = 10'h2b1;
              4'h2: pos_low = 10'h2b2;
              4'h3: pos_low = 10'h2b3;
              4'h4: pos_low = 10'h2b4;
              4'h5: pos_low = 10'h2b5;
              4'h6: pos_low = 10'h2b6;
              4'h7: pos_low = 10'h2b7;
              4'h8: pos_low = 10'h2b8;
              4'h9: pos_low = 10'h2b9;
              4'ha: pos_low = 10'h2ba;
              4'hb: pos_low = 10'h2bb;
              4'hc: pos_low = 10'h2bc;
              4'hd: pos_low = 10'h2bd;
              4'he: pos_low = 10'h2be;
              4'hf: pos_low = 10'h2bf;
              default: pos_low = 10'h000;
            endcase
          end
          6'h2c: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h2c0;
              4'h1: pos_low = 10'h2c1;
              4'h2: pos_low = 10'h2c2;
              4'h3: pos_low = 10'h2c3;
              4'h4: pos_low = 10'h2c4;
              4'h5: pos_low = 10'h2c5;
              4'h6: pos_low = 10'h2c6;
              4'h7: pos_low = 10'h2c7;
              4'h8: pos_low = 10'h2c8;
              4'h9: pos_low = 10'h2c9;
              4'ha: pos_low = 10'h2ca;
              4'hb: pos_low = 10'h2cb;
              4'hc: pos_low = 10'h2cc;
              4'hd: pos_low = 10'h2cd;
              4'he: pos_low = 10'h2ce;
              4'hf: pos_low = 10'h2cf;
              default: pos_low = 10'h000;
            endcase
          end
          6'h2d: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h2d0;
              4'h1: pos_low = 10'h2d1;
              4'h2: pos_low = 10'h2d2;
              4'h3: pos_low = 10'h2d3;
              4'h4: pos_low = 10'h2d4;
              4'h5: pos_low = 10'h2d5;
              4'h6: pos_low = 10'h2d6;
              4'h7: pos_low = 10'h2d7;
              4'h8: pos_low = 10'h2d8;
              4'h9: pos_low = 10'h2d9;
              4'ha: pos_low = 10'h2da;
              4'hb: pos_low = 10'h2db;
              4'hc: pos_low = 10'h2dc;
              4'hd: pos_low = 10'h2dd;
              4'he: pos_low = 10'h2de;
              4'hf: pos_low = 10'h2df;
              default: pos_low = 10'h000;
            endcase
          end
          6'h2e: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h2e0;
              4'h1: pos_low = 10'h2e1;
              4'h2: pos_low = 10'h2e2;
              4'h3: pos_low = 10'h2e3;
              4'h4: pos_low = 10'h2e4;
              4'h5: pos_low = 10'h2e5;
              4'h6: pos_low = 10'h2e6;
              4'h7: pos_low = 10'h2e7;
              4'h8: pos_low = 10'h2e8;
              4'h9: pos_low = 10'h2e9;
              4'ha: pos_low = 10'h2ea;
              4'hb: pos_low = 10'h2eb;
              4'hc: pos_low = 10'h2ec;
              4'hd: pos_low = 10'h2ed;
              4'he: pos_low = 10'h2ee;
              4'hf: pos_low = 10'h2ef;
              default: pos_low = 10'h000;
            endcase
          end
          6'h2f: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h2f0;
              4'h1: pos_low = 10'h2f1;
              4'h2: pos_low = 10'h2f2;
              4'h3: pos_low = 10'h2f3;
              4'h4: pos_low = 10'h2f4;
              4'h5: pos_low = 10'h2f5;
              4'h6: pos_low = 10'h2f6;
              4'h7: pos_low = 10'h2f7;
              4'h8: pos_low = 10'h2f8;
              4'h9: pos_low = 10'h2f9;
              4'ha: pos_low = 10'h2fa;
              4'hb: pos_low = 10'h2fb;
              4'hc: pos_low = 10'h2fc;
              4'hd: pos_low = 10'h2fd;
              4'he: pos_low = 10'h2fe;
              4'hf: pos_low = 10'h2ff;
              default: pos_low = 10'h000;
            endcase
          end
          6'h30: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h300;
              4'h1: pos_low = 10'h301;
              4'h2: pos_low = 10'h302;
              4'h3: pos_low = 10'h303;
              4'h4: pos_low = 10'h304;
              4'h5: pos_low = 10'h305;
              4'h6: pos_low = 10'h306;
              4'h7: pos_low = 10'h307;
              4'h8: pos_low = 10'h308;
              4'h9: pos_low = 10'h309;
              4'ha: pos_low = 10'h30a;
              4'hb: pos_low = 10'h30b;
              4'hc: pos_low = 10'h30c;
              4'hd: pos_low = 10'h30d;
              4'he: pos_low = 10'h30e;
              4'hf: pos_low = 10'h30f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h31: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h310;
              4'h1: pos_low = 10'h311;
              4'h2: pos_low = 10'h312;
              4'h3: pos_low = 10'h313;
              4'h4: pos_low = 10'h314;
              4'h5: pos_low = 10'h315;
              4'h6: pos_low = 10'h316;
              4'h7: pos_low = 10'h317;
              4'h8: pos_low = 10'h318;
              4'h9: pos_low = 10'h319;
              4'ha: pos_low = 10'h31a;
              4'hb: pos_low = 10'h31b;
              4'hc: pos_low = 10'h31c;
              4'hd: pos_low = 10'h31d;
              4'he: pos_low = 10'h31e;
              4'hf: pos_low = 10'h31f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h32: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h320;
              4'h1: pos_low = 10'h321;
              4'h2: pos_low = 10'h322;
              4'h3: pos_low = 10'h323;
              4'h4: pos_low = 10'h324;
              4'h5: pos_low = 10'h325;
              4'h6: pos_low = 10'h326;
              4'h7: pos_low = 10'h327;
              4'h8: pos_low = 10'h328;
              4'h9: pos_low = 10'h329;
              4'ha: pos_low = 10'h32a;
              4'hb: pos_low = 10'h32b;
              4'hc: pos_low = 10'h32c;
              4'hd: pos_low = 10'h32d;
              4'he: pos_low = 10'h32e;
              4'hf: pos_low = 10'h32f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h33: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h330;
              4'h1: pos_low = 10'h331;
              4'h2: pos_low = 10'h332;
              4'h3: pos_low = 10'h333;
              4'h4: pos_low = 10'h334;
              4'h5: pos_low = 10'h335;
              4'h6: pos_low = 10'h336;
              4'h7: pos_low = 10'h337;
              4'h8: pos_low = 10'h338;
              4'h9: pos_low = 10'h339;
              4'ha: pos_low = 10'h33a;
              4'hb: pos_low = 10'h33b;
              4'hc: pos_low = 10'h33c;
              4'hd: pos_low = 10'h33d;
              4'he: pos_low = 10'h33e;
              4'hf: pos_low = 10'h33f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h34: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h340;
              4'h1: pos_low = 10'h341;
              4'h2: pos_low = 10'h342;
              4'h3: pos_low = 10'h343;
              4'h4: pos_low = 10'h344;
              4'h5: pos_low = 10'h344;
              4'h6: pos_low = 10'h345;
              4'h7: pos_low = 10'h346;
              4'h8: pos_low = 10'h347;
              4'h9: pos_low = 10'h348;
              4'ha: pos_low = 10'h349;
              4'hb: pos_low = 10'h34a;
              4'hc: pos_low = 10'h34b;
              4'hd: pos_low = 10'h34c;
              4'he: pos_low = 10'h34d;
              4'hf: pos_low = 10'h34e;
              default: pos_low = 10'h000;
            endcase
          end
          6'h35: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h34f;
              4'h1: pos_low = 10'h350;
              4'h2: pos_low = 10'h351;
              4'h3: pos_low = 10'h352;
              4'h4: pos_low = 10'h353;
              4'h5: pos_low = 10'h354;
              4'h6: pos_low = 10'h355;
              4'h7: pos_low = 10'h356;
              4'h8: pos_low = 10'h357;
              4'h9: pos_low = 10'h358;
              4'ha: pos_low = 10'h359;
              4'hb: pos_low = 10'h35a;
              4'hc: pos_low = 10'h35b;
              4'hd: pos_low = 10'h35c;
              4'he: pos_low = 10'h35d;
              4'hf: pos_low = 10'h35e;
              default: pos_low = 10'h000;
            endcase
          end
          6'h36: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h35f;
              4'h1: pos_low = 10'h360;
              4'h2: pos_low = 10'h361;
              4'h3: pos_low = 10'h362;
              4'h4: pos_low = 10'h363;
              4'h5: pos_low = 10'h364;
              4'h6: pos_low = 10'h365;
              4'h7: pos_low = 10'h366;
              4'h8: pos_low = 10'h367;
              4'h9: pos_low = 10'h368;
              4'ha: pos_low = 10'h369;
              4'hb: pos_low = 10'h36a;
              4'hc: pos_low = 10'h36b;
              4'hd: pos_low = 10'h36c;
              4'he: pos_low = 10'h36d;
              4'hf: pos_low = 10'h36e;
              default: pos_low = 10'h000;
            endcase
          end
          6'h37: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h36f;
              4'h1: pos_low = 10'h370;
              4'h2: pos_low = 10'h371;
              4'h3: pos_low = 10'h372;
              4'h4: pos_low = 10'h373;
              4'h5: pos_low = 10'h374;
              4'h6: pos_low = 10'h375;
              4'h7: pos_low = 10'h376;
              4'h8: pos_low = 10'h377;
              4'h9: pos_low = 10'h378;
              4'ha: pos_low = 10'h379;
              4'hb: pos_low = 10'h37a;
              4'hc: pos_low = 10'h37b;
              4'hd: pos_low = 10'h37c;
              4'he: pos_low = 10'h37d;
              4'hf: pos_low = 10'h37e;
              default: pos_low = 10'h000;
            endcase
          end
          6'h38: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h37f;
              4'h1: pos_low = 10'h380;
              4'h2: pos_low = 10'h381;
              4'h3: pos_low = 10'h382;
              4'h4: pos_low = 10'h383;
              4'h5: pos_low = 10'h384;
              4'h6: pos_low = 10'h385;
              4'h7: pos_low = 10'h386;
              4'h8: pos_low = 10'h387;
              4'h9: pos_low = 10'h388;
              4'ha: pos_low = 10'h389;
              4'hb: pos_low = 10'h38a;
              4'hc: pos_low = 10'h38b;
              4'hd: pos_low = 10'h38c;
              4'he: pos_low = 10'h38d;
              4'hf: pos_low = 10'h38e;
              default: pos_low = 10'h000;
            endcase
          end
          6'h39: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h38f;
              4'h1: pos_low = 10'h390;
              4'h2: pos_low = 10'h391;
              4'h3: pos_low = 10'h392;
              4'h4: pos_low = 10'h393;
              4'h5: pos_low = 10'h394;
              4'h6: pos_low = 10'h395;
              4'h7: pos_low = 10'h396;
              4'h8: pos_low = 10'h397;
              4'h9: pos_low = 10'h398;
              4'ha: pos_low = 10'h399;
              4'hb: pos_low = 10'h39a;
              4'hc: pos_low = 10'h39b;
              4'hd: pos_low = 10'h39c;
              4'he: pos_low = 10'h39d;
              4'hf: pos_low = 10'h39e;
              default: pos_low = 10'h000;
            endcase
          end
          6'h3a: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h39f;
              4'h1: pos_low = 10'h3a0;
              4'h2: pos_low = 10'h3a1;
              4'h3: pos_low = 10'h3a2;
              4'h4: pos_low = 10'h3a3;
              4'h5: pos_low = 10'h3a4;
              4'h6: pos_low = 10'h3a5;
              4'h7: pos_low = 10'h3a6;
              4'h8: pos_low = 10'h3a7;
              4'h9: pos_low = 10'h3a8;
              4'ha: pos_low = 10'h3a9;
              4'hb: pos_low = 10'h3aa;
              4'hc: pos_low = 10'h3ab;
              4'hd: pos_low = 10'h3ac;
              4'he: pos_low = 10'h3ad;
              4'hf: pos_low = 10'h3ae;
              default: pos_low = 10'h000;
            endcase
          end
          6'h3b: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3af;
              4'h1: pos_low = 10'h3b0;
              4'h2: pos_low = 10'h3b1;
              4'h3: pos_low = 10'h3b2;
              4'h4: pos_low = 10'h3b3;
              4'h5: pos_low = 10'h3b4;
              4'h6: pos_low = 10'h3b5;
              4'h7: pos_low = 10'h3b6;
              4'h8: pos_low = 10'h3b7;
              4'h9: pos_low = 10'h3b8;
              4'ha: pos_low = 10'h3b9;
              4'hb: pos_low = 10'h3ba;
              4'hc: pos_low = 10'h3bb;
              4'hd: pos_low = 10'h3bc;
              4'he: pos_low = 10'h3bd;
              4'hf: pos_low = 10'h3be;
              default: pos_low = 10'h000;
            endcase
          end
          6'h3c: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3bf;
              4'h1: pos_low = 10'h3c0;
              4'h2: pos_low = 10'h3c1;
              4'h3: pos_low = 10'h3c2;
              4'h4: pos_low = 10'h3c3;
              4'h5: pos_low = 10'h3c4;
              4'h6: pos_low = 10'h3c5;
              4'h7: pos_low = 10'h3c6;
              4'h8: pos_low = 10'h3c7;
              4'h9: pos_low = 10'h3c8;
              4'ha: pos_low = 10'h3c9;
              4'hb: pos_low = 10'h3ca;
              4'hc: pos_low = 10'h3cb;
              4'hd: pos_low = 10'h3cc;
              4'he: pos_low = 10'h3cd;
              4'hf: pos_low = 10'h3ce;
              default: pos_low = 10'h000;
            endcase
          end
          6'h3d: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3cf;
              4'h1: pos_low = 10'h3d0;
              4'h2: pos_low = 10'h3d1;
              4'h3: pos_low = 10'h3d2;
              4'h4: pos_low = 10'h3d3;
              4'h5: pos_low = 10'h3d4;
              4'h6: pos_low = 10'h3d5;
              4'h7: pos_low = 10'h3d6;
              4'h8: pos_low = 10'h3d7;
              4'h9: pos_low = 10'h3d8;
              4'ha: pos_low = 10'h3d9;
              4'hb: pos_low = 10'h3da;
              4'hc: pos_low = 10'h3db;
              4'hd: pos_low = 10'h3dc;
              4'he: pos_low = 10'h3dd;
              4'hf: pos_low = 10'h3de;
              default: pos_low = 10'h000;
            endcase
          end
          6'h3e: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3df;
              4'h1: pos_low = 10'h3e0;
              4'h2: pos_low = 10'h3e1;
              4'h3: pos_low = 10'h3e2;
              4'h4: pos_low = 10'h3e3;
              4'h5: pos_low = 10'h3e4;
              4'h6: pos_low = 10'h3e5;
              4'h7: pos_low = 10'h3e6;
              4'h8: pos_low = 10'h3e7;
              4'h9: pos_low = 10'h3e8;
              4'ha: pos_low = 10'h3e9;
              4'hb: pos_low = 10'h3ea;
              4'hc: pos_low = 10'h3eb;
              4'hd: pos_low = 10'h3ec;
              4'he: pos_low = 10'h3ed;
              4'hf: pos_low = 10'h3ee;
              default: pos_low = 10'h000;
            endcase
          end
          6'h3f: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3ef;
              4'h1: pos_low = 10'h3f0;
              4'h2: pos_low = 10'h3f1;
              4'h3: pos_low = 10'h3f2;
              4'h4: pos_low = 10'h3f3;
              4'h5: pos_low = 10'h3f4;
              4'h6: pos_low = 10'h3f5;
              4'h7: pos_low = 10'h3f6;
              4'h8: pos_low = 10'h3f7;
              4'h9: pos_low = 10'h3f8;
              4'ha: pos_low = 10'h3f9;
              4'hb: pos_low = 10'h3fa;
              4'hc: pos_low = 10'h3fb;
              4'hd: pos_low = 10'h3fc;
              4'he: pos_low = 10'h3fd;
              4'hf: pos_low = 10'h3fe;
              default: pos_low = 10'h000;
            endcase
          end
          default: begin end
        endcase
      end
      5'h0a: begin
        case (mant[9:4])
          6'h00: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3ff;
              4'h1: pos_low = 10'h001;
              4'h2: pos_low = 10'h002;
              4'h3: pos_low = 10'h003;
              4'h4: pos_low = 10'h004;
              4'h5: pos_low = 10'h005;
              4'h6: pos_low = 10'h006;
              4'h7: pos_low = 10'h007;
              4'h8: pos_low = 10'h008;
              4'h9: pos_low = 10'h009;
              4'ha: pos_low = 10'h00a;
              4'hb: pos_low = 10'h00b;
              4'hc: pos_low = 10'h00c;
              4'hd: pos_low = 10'h00d;
              4'he: pos_low = 10'h00e;
              4'hf: pos_low = 10'h00f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h01: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h010;
              4'h1: pos_low = 10'h011;
              4'h2: pos_low = 10'h012;
              4'h3: pos_low = 10'h013;
              4'h4: pos_low = 10'h014;
              4'h5: pos_low = 10'h015;
              4'h6: pos_low = 10'h016;
              4'h7: pos_low = 10'h017;
              4'h8: pos_low = 10'h018;
              4'h9: pos_low = 10'h019;
              4'ha: pos_low = 10'h01a;
              4'hb: pos_low = 10'h01b;
              4'hc: pos_low = 10'h01c;
              4'hd: pos_low = 10'h01d;
              4'he: pos_low = 10'h01e;
              4'hf: pos_low = 10'h01f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h02: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h020;
              4'h1: pos_low = 10'h021;
              4'h2: pos_low = 10'h022;
              4'h3: pos_low = 10'h023;
              4'h4: pos_low = 10'h024;
              4'h5: pos_low = 10'h025;
              4'h6: pos_low = 10'h026;
              4'h7: pos_low = 10'h027;
              4'h8: pos_low = 10'h028;
              4'h9: pos_low = 10'h029;
              4'ha: pos_low = 10'h02a;
              4'hb: pos_low = 10'h02b;
              4'hc: pos_low = 10'h02c;
              4'hd: pos_low = 10'h02d;
              4'he: pos_low = 10'h02e;
              4'hf: pos_low = 10'h02f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h03: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h030;
              4'h1: pos_low = 10'h031;
              4'h2: pos_low = 10'h032;
              4'h3: pos_low = 10'h033;
              4'h4: pos_low = 10'h034;
              4'h5: pos_low = 10'h035;
              4'h6: pos_low = 10'h036;
              4'h7: pos_low = 10'h037;
              4'h8: pos_low = 10'h038;
              4'h9: pos_low = 10'h039;
              4'ha: pos_low = 10'h03a;
              4'hb: pos_low = 10'h03b;
              4'hc: pos_low = 10'h03c;
              4'hd: pos_low = 10'h03d;
              4'he: pos_low = 10'h03e;
              4'hf: pos_low = 10'h03f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h04: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h040;
              4'h1: pos_low = 10'h041;
              4'h2: pos_low = 10'h042;
              4'h3: pos_low = 10'h043;
              4'h4: pos_low = 10'h044;
              4'h5: pos_low = 10'h045;
              4'h6: pos_low = 10'h046;
              4'h7: pos_low = 10'h047;
              4'h8: pos_low = 10'h048;
              4'h9: pos_low = 10'h049;
              4'ha: pos_low = 10'h04a;
              4'hb: pos_low = 10'h04b;
              4'hc: pos_low = 10'h04c;
              4'hd: pos_low = 10'h04d;
              4'he: pos_low = 10'h04e;
              4'hf: pos_low = 10'h04f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h05: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h050;
              4'h1: pos_low = 10'h051;
              4'h2: pos_low = 10'h052;
              4'h3: pos_low = 10'h053;
              4'h4: pos_low = 10'h054;
              4'h5: pos_low = 10'h055;
              4'h6: pos_low = 10'h056;
              4'h7: pos_low = 10'h057;
              4'h8: pos_low = 10'h058;
              4'h9: pos_low = 10'h059;
              4'ha: pos_low = 10'h05a;
              4'hb: pos_low = 10'h05b;
              4'hc: pos_low = 10'h05c;
              4'hd: pos_low = 10'h05d;
              4'he: pos_low = 10'h05e;
              4'hf: pos_low = 10'h05f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h06: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h060;
              4'h1: pos_low = 10'h061;
              4'h2: pos_low = 10'h062;
              4'h3: pos_low = 10'h063;
              4'h4: pos_low = 10'h064;
              4'h5: pos_low = 10'h065;
              4'h6: pos_low = 10'h066;
              4'h7: pos_low = 10'h067;
              4'h8: pos_low = 10'h068;
              4'h9: pos_low = 10'h069;
              4'ha: pos_low = 10'h06a;
              4'hb: pos_low = 10'h06b;
              4'hc: pos_low = 10'h06c;
              4'hd: pos_low = 10'h06d;
              4'he: pos_low = 10'h06e;
              4'hf: pos_low = 10'h06f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h07: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h070;
              4'h1: pos_low = 10'h071;
              4'h2: pos_low = 10'h072;
              4'h3: pos_low = 10'h073;
              4'h4: pos_low = 10'h074;
              4'h5: pos_low = 10'h075;
              4'h6: pos_low = 10'h076;
              4'h7: pos_low = 10'h077;
              4'h8: pos_low = 10'h078;
              4'h9: pos_low = 10'h079;
              4'ha: pos_low = 10'h07a;
              4'hb: pos_low = 10'h07b;
              4'hc: pos_low = 10'h07c;
              4'hd: pos_low = 10'h07d;
              4'he: pos_low = 10'h07e;
              4'hf: pos_low = 10'h07f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h08: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h080;
              4'h1: pos_low = 10'h081;
              4'h2: pos_low = 10'h082;
              4'h3: pos_low = 10'h083;
              4'h4: pos_low = 10'h084;
              4'h5: pos_low = 10'h085;
              4'h6: pos_low = 10'h086;
              4'h7: pos_low = 10'h087;
              4'h8: pos_low = 10'h088;
              4'h9: pos_low = 10'h089;
              4'ha: pos_low = 10'h08a;
              4'hb: pos_low = 10'h08b;
              4'hc: pos_low = 10'h08c;
              4'hd: pos_low = 10'h08d;
              4'he: pos_low = 10'h08e;
              4'hf: pos_low = 10'h08f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h09: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h090;
              4'h1: pos_low = 10'h091;
              4'h2: pos_low = 10'h092;
              4'h3: pos_low = 10'h093;
              4'h4: pos_low = 10'h094;
              4'h5: pos_low = 10'h094;
              4'h6: pos_low = 10'h095;
              4'h7: pos_low = 10'h096;
              4'h8: pos_low = 10'h097;
              4'h9: pos_low = 10'h098;
              4'ha: pos_low = 10'h099;
              4'hb: pos_low = 10'h09a;
              4'hc: pos_low = 10'h09b;
              4'hd: pos_low = 10'h09c;
              4'he: pos_low = 10'h09d;
              4'hf: pos_low = 10'h09e;
              default: pos_low = 10'h000;
            endcase
          end
          6'h0a: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h09f;
              4'h1: pos_low = 10'h0a0;
              4'h2: pos_low = 10'h0a1;
              4'h3: pos_low = 10'h0a2;
              4'h4: pos_low = 10'h0a3;
              4'h5: pos_low = 10'h0a4;
              4'h6: pos_low = 10'h0a5;
              4'h7: pos_low = 10'h0a6;
              4'h8: pos_low = 10'h0a7;
              4'h9: pos_low = 10'h0a8;
              4'ha: pos_low = 10'h0a9;
              4'hb: pos_low = 10'h0aa;
              4'hc: pos_low = 10'h0ab;
              4'hd: pos_low = 10'h0ac;
              4'he: pos_low = 10'h0ad;
              4'hf: pos_low = 10'h0ae;
              default: pos_low = 10'h000;
            endcase
          end
          6'h0b: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h0af;
              4'h1: pos_low = 10'h0b0;
              4'h2: pos_low = 10'h0b1;
              4'h3: pos_low = 10'h0b2;
              4'h4: pos_low = 10'h0b3;
              4'h5: pos_low = 10'h0b4;
              4'h6: pos_low = 10'h0b5;
              4'h7: pos_low = 10'h0b6;
              4'h8: pos_low = 10'h0b7;
              4'h9: pos_low = 10'h0b8;
              4'ha: pos_low = 10'h0b9;
              4'hb: pos_low = 10'h0ba;
              4'hc: pos_low = 10'h0bb;
              4'hd: pos_low = 10'h0bc;
              4'he: pos_low = 10'h0bd;
              4'hf: pos_low = 10'h0be;
              default: pos_low = 10'h000;
            endcase
          end
          6'h0c: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h0bf;
              4'h1: pos_low = 10'h0c0;
              4'h2: pos_low = 10'h0c1;
              4'h3: pos_low = 10'h0c2;
              4'h4: pos_low = 10'h0c3;
              4'h5: pos_low = 10'h0c4;
              4'h6: pos_low = 10'h0c5;
              4'h7: pos_low = 10'h0c6;
              4'h8: pos_low = 10'h0c7;
              4'h9: pos_low = 10'h0c8;
              4'ha: pos_low = 10'h0c9;
              4'hb: pos_low = 10'h0ca;
              4'hc: pos_low = 10'h0cb;
              4'hd: pos_low = 10'h0cc;
              4'he: pos_low = 10'h0cd;
              4'hf: pos_low = 10'h0ce;
              default: pos_low = 10'h000;
            endcase
          end
          6'h0d: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h0cf;
              4'h1: pos_low = 10'h0d0;
              4'h2: pos_low = 10'h0d1;
              4'h3: pos_low = 10'h0d2;
              4'h4: pos_low = 10'h0d3;
              4'h5: pos_low = 10'h0d4;
              4'h6: pos_low = 10'h0d5;
              4'h7: pos_low = 10'h0d6;
              4'h8: pos_low = 10'h0d7;
              4'h9: pos_low = 10'h0d8;
              4'ha: pos_low = 10'h0d9;
              4'hb: pos_low = 10'h0da;
              4'hc: pos_low = 10'h0db;
              4'hd: pos_low = 10'h0dc;
              4'he: pos_low = 10'h0dd;
              4'hf: pos_low = 10'h0de;
              default: pos_low = 10'h000;
            endcase
          end
          6'h0e: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h0df;
              4'h1: pos_low = 10'h0e0;
              4'h2: pos_low = 10'h0e1;
              4'h3: pos_low = 10'h0e2;
              4'h4: pos_low = 10'h0e3;
              4'h5: pos_low = 10'h0e4;
              4'h6: pos_low = 10'h0e5;
              4'h7: pos_low = 10'h0e6;
              4'h8: pos_low = 10'h0e7;
              4'h9: pos_low = 10'h0e8;
              4'ha: pos_low = 10'h0e9;
              4'hb: pos_low = 10'h0ea;
              4'hc: pos_low = 10'h0eb;
              4'hd: pos_low = 10'h0ec;
              4'he: pos_low = 10'h0ed;
              4'hf: pos_low = 10'h0ee;
              default: pos_low = 10'h000;
            endcase
          end
          6'h0f: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h0ef;
              4'h1: pos_low = 10'h0f0;
              4'h2: pos_low = 10'h0f1;
              4'h3: pos_low = 10'h0f2;
              4'h4: pos_low = 10'h0f3;
              4'h5: pos_low = 10'h0f4;
              4'h6: pos_low = 10'h0f5;
              4'h7: pos_low = 10'h0f6;
              4'h8: pos_low = 10'h0f7;
              4'h9: pos_low = 10'h0f8;
              4'ha: pos_low = 10'h0f9;
              4'hb: pos_low = 10'h0fa;
              4'hc: pos_low = 10'h0fb;
              4'hd: pos_low = 10'h0fc;
              4'he: pos_low = 10'h0fd;
              4'hf: pos_low = 10'h0fe;
              default: pos_low = 10'h000;
            endcase
          end
          6'h10: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h0ff;
              4'h1: pos_low = 10'h100;
              4'h2: pos_low = 10'h101;
              4'h3: pos_low = 10'h102;
              4'h4: pos_low = 10'h103;
              4'h5: pos_low = 10'h104;
              4'h6: pos_low = 10'h105;
              4'h7: pos_low = 10'h106;
              4'h8: pos_low = 10'h107;
              4'h9: pos_low = 10'h108;
              4'ha: pos_low = 10'h109;
              4'hb: pos_low = 10'h10a;
              4'hc: pos_low = 10'h10b;
              4'hd: pos_low = 10'h10c;
              4'he: pos_low = 10'h10d;
              4'hf: pos_low = 10'h10e;
              default: pos_low = 10'h000;
            endcase
          end
          6'h11: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h10f;
              4'h1: pos_low = 10'h110;
              4'h2: pos_low = 10'h111;
              4'h3: pos_low = 10'h112;
              4'h4: pos_low = 10'h113;
              4'h5: pos_low = 10'h114;
              4'h6: pos_low = 10'h115;
              4'h7: pos_low = 10'h116;
              4'h8: pos_low = 10'h117;
              4'h9: pos_low = 10'h118;
              4'ha: pos_low = 10'h119;
              4'hb: pos_low = 10'h11a;
              4'hc: pos_low = 10'h11b;
              4'hd: pos_low = 10'h11c;
              4'he: pos_low = 10'h11d;
              4'hf: pos_low = 10'h11e;
              default: pos_low = 10'h000;
            endcase
          end
          6'h12: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h11f;
              4'h1: pos_low = 10'h120;
              4'h2: pos_low = 10'h121;
              4'h3: pos_low = 10'h122;
              4'h4: pos_low = 10'h123;
              4'h5: pos_low = 10'h124;
              4'h6: pos_low = 10'h125;
              4'h7: pos_low = 10'h126;
              4'h8: pos_low = 10'h127;
              4'h9: pos_low = 10'h128;
              4'ha: pos_low = 10'h129;
              4'hb: pos_low = 10'h12a;
              4'hc: pos_low = 10'h12b;
              4'hd: pos_low = 10'h12c;
              4'he: pos_low = 10'h12d;
              4'hf: pos_low = 10'h12e;
              default: pos_low = 10'h000;
            endcase
          end
          6'h13: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h12f;
              4'h1: pos_low = 10'h130;
              4'h2: pos_low = 10'h131;
              4'h3: pos_low = 10'h132;
              4'h4: pos_low = 10'h133;
              4'h5: pos_low = 10'h134;
              4'h6: pos_low = 10'h135;
              4'h7: pos_low = 10'h136;
              4'h8: pos_low = 10'h137;
              4'h9: pos_low = 10'h138;
              4'ha: pos_low = 10'h139;
              4'hb: pos_low = 10'h13a;
              4'hc: pos_low = 10'h13b;
              4'hd: pos_low = 10'h13c;
              4'he: pos_low = 10'h13d;
              4'hf: pos_low = 10'h13e;
              default: pos_low = 10'h000;
            endcase
          end
          6'h14: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h13f;
              4'h1: pos_low = 10'h140;
              4'h2: pos_low = 10'h141;
              4'h3: pos_low = 10'h142;
              4'h4: pos_low = 10'h143;
              4'h5: pos_low = 10'h144;
              4'h6: pos_low = 10'h145;
              4'h7: pos_low = 10'h146;
              4'h8: pos_low = 10'h147;
              4'h9: pos_low = 10'h148;
              4'ha: pos_low = 10'h149;
              4'hb: pos_low = 10'h14a;
              4'hc: pos_low = 10'h14b;
              4'hd: pos_low = 10'h14c;
              4'he: pos_low = 10'h14d;
              4'hf: pos_low = 10'h14e;
              default: pos_low = 10'h000;
            endcase
          end
          6'h15: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h14f;
              4'h1: pos_low = 10'h150;
              4'h2: pos_low = 10'h151;
              4'h3: pos_low = 10'h152;
              4'h4: pos_low = 10'h153;
              4'h5: pos_low = 10'h154;
              4'h6: pos_low = 10'h155;
              4'h7: pos_low = 10'h156;
              4'h8: pos_low = 10'h157;
              4'h9: pos_low = 10'h158;
              4'ha: pos_low = 10'h159;
              4'hb: pos_low = 10'h15a;
              4'hc: pos_low = 10'h15b;
              4'hd: pos_low = 10'h15c;
              4'he: pos_low = 10'h15d;
              4'hf: pos_low = 10'h15e;
              default: pos_low = 10'h000;
            endcase
          end
          6'h16: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h15f;
              4'h1: pos_low = 10'h160;
              4'h2: pos_low = 10'h161;
              4'h3: pos_low = 10'h162;
              4'h4: pos_low = 10'h163;
              4'h5: pos_low = 10'h164;
              4'h6: pos_low = 10'h165;
              4'h7: pos_low = 10'h166;
              4'h8: pos_low = 10'h167;
              4'h9: pos_low = 10'h168;
              4'ha: pos_low = 10'h169;
              4'hb: pos_low = 10'h16a;
              4'hc: pos_low = 10'h16b;
              4'hd: pos_low = 10'h16c;
              4'he: pos_low = 10'h16d;
              4'hf: pos_low = 10'h16e;
              default: pos_low = 10'h000;
            endcase
          end
          6'h17: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h16f;
              4'h1: pos_low = 10'h170;
              4'h2: pos_low = 10'h171;
              4'h3: pos_low = 10'h172;
              4'h4: pos_low = 10'h173;
              4'h5: pos_low = 10'h174;
              4'h6: pos_low = 10'h175;
              4'h7: pos_low = 10'h176;
              4'h8: pos_low = 10'h177;
              4'h9: pos_low = 10'h178;
              4'ha: pos_low = 10'h179;
              4'hb: pos_low = 10'h17a;
              4'hc: pos_low = 10'h17b;
              4'hd: pos_low = 10'h17c;
              4'he: pos_low = 10'h17d;
              4'hf: pos_low = 10'h17e;
              default: pos_low = 10'h000;
            endcase
          end
          6'h18: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h17f;
              4'h1: pos_low = 10'h180;
              4'h2: pos_low = 10'h181;
              4'h3: pos_low = 10'h182;
              4'h4: pos_low = 10'h183;
              4'h5: pos_low = 10'h184;
              4'h6: pos_low = 10'h185;
              4'h7: pos_low = 10'h186;
              4'h8: pos_low = 10'h187;
              4'h9: pos_low = 10'h188;
              4'ha: pos_low = 10'h189;
              4'hb: pos_low = 10'h18a;
              4'hc: pos_low = 10'h18b;
              4'hd: pos_low = 10'h18c;
              4'he: pos_low = 10'h18d;
              4'hf: pos_low = 10'h18e;
              default: pos_low = 10'h000;
            endcase
          end
          6'h19: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h18f;
              4'h1: pos_low = 10'h190;
              4'h2: pos_low = 10'h191;
              4'h3: pos_low = 10'h192;
              4'h4: pos_low = 10'h193;
              4'h5: pos_low = 10'h194;
              4'h6: pos_low = 10'h195;
              4'h7: pos_low = 10'h196;
              4'h8: pos_low = 10'h197;
              4'h9: pos_low = 10'h198;
              4'ha: pos_low = 10'h199;
              4'hb: pos_low = 10'h19a;
              4'hc: pos_low = 10'h19b;
              4'hd: pos_low = 10'h19c;
              4'he: pos_low = 10'h19d;
              4'hf: pos_low = 10'h19e;
              default: pos_low = 10'h000;
            endcase
          end
          6'h1a: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h19f;
              4'h1: pos_low = 10'h1a0;
              4'h2: pos_low = 10'h1a1;
              4'h3: pos_low = 10'h1a2;
              4'h4: pos_low = 10'h1a3;
              4'h5: pos_low = 10'h1a4;
              4'h6: pos_low = 10'h1a5;
              4'h7: pos_low = 10'h1a6;
              4'h8: pos_low = 10'h1a7;
              4'h9: pos_low = 10'h1a8;
              4'ha: pos_low = 10'h1a9;
              4'hb: pos_low = 10'h1aa;
              4'hc: pos_low = 10'h1ab;
              4'hd: pos_low = 10'h1ac;
              4'he: pos_low = 10'h1ad;
              4'hf: pos_low = 10'h1ae;
              default: pos_low = 10'h000;
            endcase
          end
          6'h1b: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h1af;
              4'h1: pos_low = 10'h1b0;
              4'h2: pos_low = 10'h1b1;
              4'h3: pos_low = 10'h1b2;
              4'h4: pos_low = 10'h1b3;
              4'h5: pos_low = 10'h1b4;
              4'h6: pos_low = 10'h1b5;
              4'h7: pos_low = 10'h1b6;
              4'h8: pos_low = 10'h1b7;
              4'h9: pos_low = 10'h1b8;
              4'ha: pos_low = 10'h1b9;
              4'hb: pos_low = 10'h1ba;
              4'hc: pos_low = 10'h1bb;
              4'hd: pos_low = 10'h1bc;
              4'he: pos_low = 10'h1bd;
              4'hf: pos_low = 10'h1be;
              default: pos_low = 10'h000;
            endcase
          end
          6'h1c: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h1bf;
              4'h1: pos_low = 10'h1c0;
              4'h2: pos_low = 10'h1c1;
              4'h3: pos_low = 10'h1c2;
              4'h4: pos_low = 10'h1c3;
              4'h5: pos_low = 10'h1c4;
              4'h6: pos_low = 10'h1c5;
              4'h7: pos_low = 10'h1c6;
              4'h8: pos_low = 10'h1c7;
              4'h9: pos_low = 10'h1c8;
              4'ha: pos_low = 10'h1c9;
              4'hb: pos_low = 10'h1ca;
              4'hc: pos_low = 10'h1cb;
              4'hd: pos_low = 10'h1cc;
              4'he: pos_low = 10'h1cd;
              4'hf: pos_low = 10'h1ce;
              default: pos_low = 10'h000;
            endcase
          end
          6'h1d: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h1cf;
              4'h1: pos_low = 10'h1d0;
              4'h2: pos_low = 10'h1d1;
              4'h3: pos_low = 10'h1d2;
              4'h4: pos_low = 10'h1d3;
              4'h5: pos_low = 10'h1d4;
              4'h6: pos_low = 10'h1d5;
              4'h7: pos_low = 10'h1d6;
              4'h8: pos_low = 10'h1d7;
              4'h9: pos_low = 10'h1d8;
              4'ha: pos_low = 10'h1d9;
              4'hb: pos_low = 10'h1da;
              4'hc: pos_low = 10'h1db;
              4'hd: pos_low = 10'h1dc;
              4'he: pos_low = 10'h1dd;
              4'hf: pos_low = 10'h1de;
              default: pos_low = 10'h000;
            endcase
          end
          6'h1e: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h1df;
              4'h1: pos_low = 10'h1e0;
              4'h2: pos_low = 10'h1e1;
              4'h3: pos_low = 10'h1e2;
              4'h4: pos_low = 10'h1e3;
              4'h5: pos_low = 10'h1e4;
              4'h6: pos_low = 10'h1e5;
              4'h7: pos_low = 10'h1e6;
              4'h8: pos_low = 10'h1e7;
              4'h9: pos_low = 10'h1e8;
              4'ha: pos_low = 10'h1e9;
              4'hb: pos_low = 10'h1ea;
              4'hc: pos_low = 10'h1eb;
              4'hd: pos_low = 10'h1ec;
              4'he: pos_low = 10'h1ed;
              4'hf: pos_low = 10'h1ee;
              default: pos_low = 10'h000;
            endcase
          end
          6'h1f: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h1ef;
              4'h1: pos_low = 10'h1f0;
              4'h2: pos_low = 10'h1f1;
              4'h3: pos_low = 10'h1f2;
              4'h4: pos_low = 10'h1f3;
              4'h5: pos_low = 10'h1f4;
              4'h6: pos_low = 10'h1f5;
              4'h7: pos_low = 10'h1f6;
              4'h8: pos_low = 10'h1f7;
              4'h9: pos_low = 10'h1f8;
              4'ha: pos_low = 10'h1f9;
              4'hb: pos_low = 10'h1fa;
              4'hc: pos_low = 10'h1fb;
              4'hd: pos_low = 10'h1fc;
              4'he: pos_low = 10'h1fd;
              4'hf: pos_low = 10'h1fe;
              default: pos_low = 10'h000;
            endcase
          end
          6'h20: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h1ff;
              4'h1: pos_low = 10'h200;
              4'h2: pos_low = 10'h201;
              4'h3: pos_low = 10'h202;
              4'h4: pos_low = 10'h203;
              4'h5: pos_low = 10'h204;
              4'h6: pos_low = 10'h205;
              4'h7: pos_low = 10'h206;
              4'h8: pos_low = 10'h207;
              4'h9: pos_low = 10'h208;
              4'ha: pos_low = 10'h209;
              4'hb: pos_low = 10'h20a;
              4'hc: pos_low = 10'h20b;
              4'hd: pos_low = 10'h20c;
              4'he: pos_low = 10'h20d;
              4'hf: pos_low = 10'h20e;
              default: pos_low = 10'h000;
            endcase
          end
          6'h21: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h20f;
              4'h1: pos_low = 10'h210;
              4'h2: pos_low = 10'h211;
              4'h3: pos_low = 10'h212;
              4'h4: pos_low = 10'h213;
              4'h5: pos_low = 10'h214;
              4'h6: pos_low = 10'h215;
              4'h7: pos_low = 10'h216;
              4'h8: pos_low = 10'h217;
              4'h9: pos_low = 10'h218;
              4'ha: pos_low = 10'h219;
              4'hb: pos_low = 10'h21a;
              4'hc: pos_low = 10'h21b;
              4'hd: pos_low = 10'h21c;
              4'he: pos_low = 10'h21d;
              4'hf: pos_low = 10'h21e;
              default: pos_low = 10'h000;
            endcase
          end
          6'h22: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h21f;
              4'h1: pos_low = 10'h220;
              4'h2: pos_low = 10'h221;
              4'h3: pos_low = 10'h222;
              4'h4: pos_low = 10'h223;
              4'h5: pos_low = 10'h224;
              4'h6: pos_low = 10'h225;
              4'h7: pos_low = 10'h226;
              4'h8: pos_low = 10'h227;
              4'h9: pos_low = 10'h228;
              4'ha: pos_low = 10'h229;
              4'hb: pos_low = 10'h22a;
              4'hc: pos_low = 10'h22b;
              4'hd: pos_low = 10'h22c;
              4'he: pos_low = 10'h22d;
              4'hf: pos_low = 10'h22e;
              default: pos_low = 10'h000;
            endcase
          end
          6'h23: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h22f;
              4'h1: pos_low = 10'h230;
              4'h2: pos_low = 10'h231;
              4'h3: pos_low = 10'h232;
              4'h4: pos_low = 10'h233;
              4'h5: pos_low = 10'h234;
              4'h6: pos_low = 10'h235;
              4'h7: pos_low = 10'h236;
              4'h8: pos_low = 10'h237;
              4'h9: pos_low = 10'h238;
              4'ha: pos_low = 10'h239;
              4'hb: pos_low = 10'h23a;
              4'hc: pos_low = 10'h23b;
              4'hd: pos_low = 10'h23c;
              4'he: pos_low = 10'h23d;
              4'hf: pos_low = 10'h23e;
              default: pos_low = 10'h000;
            endcase
          end
          6'h24: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h23f;
              4'h1: pos_low = 10'h240;
              4'h2: pos_low = 10'h241;
              4'h3: pos_low = 10'h242;
              4'h4: pos_low = 10'h243;
              4'h5: pos_low = 10'h244;
              4'h6: pos_low = 10'h245;
              4'h7: pos_low = 10'h246;
              4'h8: pos_low = 10'h247;
              4'h9: pos_low = 10'h248;
              4'ha: pos_low = 10'h249;
              4'hb: pos_low = 10'h24a;
              4'hc: pos_low = 10'h24b;
              4'hd: pos_low = 10'h24c;
              4'he: pos_low = 10'h24d;
              4'hf: pos_low = 10'h24e;
              default: pos_low = 10'h000;
            endcase
          end
          6'h25: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h24f;
              4'h1: pos_low = 10'h250;
              4'h2: pos_low = 10'h251;
              4'h3: pos_low = 10'h252;
              4'h4: pos_low = 10'h253;
              4'h5: pos_low = 10'h254;
              4'h6: pos_low = 10'h255;
              4'h7: pos_low = 10'h256;
              4'h8: pos_low = 10'h257;
              4'h9: pos_low = 10'h258;
              4'ha: pos_low = 10'h259;
              4'hb: pos_low = 10'h25a;
              4'hc: pos_low = 10'h25b;
              4'hd: pos_low = 10'h25c;
              4'he: pos_low = 10'h25d;
              4'hf: pos_low = 10'h25e;
              default: pos_low = 10'h000;
            endcase
          end
          6'h26: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h25f;
              4'h1: pos_low = 10'h260;
              4'h2: pos_low = 10'h261;
              4'h3: pos_low = 10'h262;
              4'h4: pos_low = 10'h263;
              4'h5: pos_low = 10'h264;
              4'h6: pos_low = 10'h265;
              4'h7: pos_low = 10'h266;
              4'h8: pos_low = 10'h267;
              4'h9: pos_low = 10'h268;
              4'ha: pos_low = 10'h269;
              4'hb: pos_low = 10'h26a;
              4'hc: pos_low = 10'h26b;
              4'hd: pos_low = 10'h26c;
              4'he: pos_low = 10'h26d;
              4'hf: pos_low = 10'h26e;
              default: pos_low = 10'h000;
            endcase
          end
          6'h27: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h26f;
              4'h1: pos_low = 10'h270;
              4'h2: pos_low = 10'h271;
              4'h3: pos_low = 10'h272;
              4'h4: pos_low = 10'h273;
              4'h5: pos_low = 10'h274;
              4'h6: pos_low = 10'h275;
              4'h7: pos_low = 10'h276;
              4'h8: pos_low = 10'h277;
              4'h9: pos_low = 10'h278;
              4'ha: pos_low = 10'h279;
              4'hb: pos_low = 10'h27a;
              4'hc: pos_low = 10'h27b;
              4'hd: pos_low = 10'h27c;
              4'he: pos_low = 10'h27d;
              4'hf: pos_low = 10'h27e;
              default: pos_low = 10'h000;
            endcase
          end
          6'h28: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h27f;
              4'h1: pos_low = 10'h280;
              4'h2: pos_low = 10'h281;
              4'h3: pos_low = 10'h282;
              4'h4: pos_low = 10'h283;
              4'h5: pos_low = 10'h284;
              4'h6: pos_low = 10'h285;
              4'h7: pos_low = 10'h286;
              4'h8: pos_low = 10'h287;
              4'h9: pos_low = 10'h288;
              4'ha: pos_low = 10'h289;
              4'hb: pos_low = 10'h28a;
              4'hc: pos_low = 10'h28b;
              4'hd: pos_low = 10'h28c;
              4'he: pos_low = 10'h28d;
              4'hf: pos_low = 10'h28e;
              default: pos_low = 10'h000;
            endcase
          end
          6'h29: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h28f;
              4'h1: pos_low = 10'h290;
              4'h2: pos_low = 10'h291;
              4'h3: pos_low = 10'h292;
              4'h4: pos_low = 10'h293;
              4'h5: pos_low = 10'h294;
              4'h6: pos_low = 10'h295;
              4'h7: pos_low = 10'h296;
              4'h8: pos_low = 10'h297;
              4'h9: pos_low = 10'h298;
              4'ha: pos_low = 10'h299;
              4'hb: pos_low = 10'h29a;
              4'hc: pos_low = 10'h29a;
              4'hd: pos_low = 10'h29b;
              4'he: pos_low = 10'h29c;
              4'hf: pos_low = 10'h29d;
              default: pos_low = 10'h000;
            endcase
          end
          6'h2a: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h29e;
              4'h1: pos_low = 10'h29f;
              4'h2: pos_low = 10'h2a0;
              4'h3: pos_low = 10'h2a1;
              4'h4: pos_low = 10'h2a2;
              4'h5: pos_low = 10'h2a3;
              4'h6: pos_low = 10'h2a4;
              4'h7: pos_low = 10'h2a5;
              4'h8: pos_low = 10'h2a6;
              4'h9: pos_low = 10'h2a7;
              4'ha: pos_low = 10'h2a8;
              4'hb: pos_low = 10'h2a9;
              4'hc: pos_low = 10'h2aa;
              4'hd: pos_low = 10'h2ab;
              4'he: pos_low = 10'h2ac;
              4'hf: pos_low = 10'h2ad;
              default: pos_low = 10'h000;
            endcase
          end
          6'h2b: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h2ae;
              4'h1: pos_low = 10'h2af;
              4'h2: pos_low = 10'h2b0;
              4'h3: pos_low = 10'h2b1;
              4'h4: pos_low = 10'h2b2;
              4'h5: pos_low = 10'h2b3;
              4'h6: pos_low = 10'h2b4;
              4'h7: pos_low = 10'h2b5;
              4'h8: pos_low = 10'h2b6;
              4'h9: pos_low = 10'h2b7;
              4'ha: pos_low = 10'h2b8;
              4'hb: pos_low = 10'h2b9;
              4'hc: pos_low = 10'h2ba;
              4'hd: pos_low = 10'h2bb;
              4'he: pos_low = 10'h2bc;
              4'hf: pos_low = 10'h2bd;
              default: pos_low = 10'h000;
            endcase
          end
          6'h2c: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h2be;
              4'h1: pos_low = 10'h2bf;
              4'h2: pos_low = 10'h2c0;
              4'h3: pos_low = 10'h2c1;
              4'h4: pos_low = 10'h2c2;
              4'h5: pos_low = 10'h2c3;
              4'h6: pos_low = 10'h2c4;
              4'h7: pos_low = 10'h2c5;
              4'h8: pos_low = 10'h2c6;
              4'h9: pos_low = 10'h2c7;
              4'ha: pos_low = 10'h2c8;
              4'hb: pos_low = 10'h2c9;
              4'hc: pos_low = 10'h2ca;
              4'hd: pos_low = 10'h2cb;
              4'he: pos_low = 10'h2cc;
              4'hf: pos_low = 10'h2cd;
              default: pos_low = 10'h000;
            endcase
          end
          6'h2d: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h2ce;
              4'h1: pos_low = 10'h2cf;
              4'h2: pos_low = 10'h2d0;
              4'h3: pos_low = 10'h2d1;
              4'h4: pos_low = 10'h2d2;
              4'h5: pos_low = 10'h2d3;
              4'h6: pos_low = 10'h2d4;
              4'h7: pos_low = 10'h2d5;
              4'h8: pos_low = 10'h2d6;
              4'h9: pos_low = 10'h2d7;
              4'ha: pos_low = 10'h2d8;
              4'hb: pos_low = 10'h2d9;
              4'hc: pos_low = 10'h2da;
              4'hd: pos_low = 10'h2db;
              4'he: pos_low = 10'h2dc;
              4'hf: pos_low = 10'h2dd;
              default: pos_low = 10'h000;
            endcase
          end
          6'h2e: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h2de;
              4'h1: pos_low = 10'h2df;
              4'h2: pos_low = 10'h2e0;
              4'h3: pos_low = 10'h2e1;
              4'h4: pos_low = 10'h2e2;
              4'h5: pos_low = 10'h2e3;
              4'h6: pos_low = 10'h2e4;
              4'h7: pos_low = 10'h2e5;
              4'h8: pos_low = 10'h2e6;
              4'h9: pos_low = 10'h2e7;
              4'ha: pos_low = 10'h2e8;
              4'hb: pos_low = 10'h2e9;
              4'hc: pos_low = 10'h2ea;
              4'hd: pos_low = 10'h2eb;
              4'he: pos_low = 10'h2ec;
              4'hf: pos_low = 10'h2ed;
              default: pos_low = 10'h000;
            endcase
          end
          6'h2f: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h2ee;
              4'h1: pos_low = 10'h2ef;
              4'h2: pos_low = 10'h2f0;
              4'h3: pos_low = 10'h2f1;
              4'h4: pos_low = 10'h2f2;
              4'h5: pos_low = 10'h2f3;
              4'h6: pos_low = 10'h2f4;
              4'h7: pos_low = 10'h2f5;
              4'h8: pos_low = 10'h2f6;
              4'h9: pos_low = 10'h2f7;
              4'ha: pos_low = 10'h2f8;
              4'hb: pos_low = 10'h2f9;
              4'hc: pos_low = 10'h2fa;
              4'hd: pos_low = 10'h2fb;
              4'he: pos_low = 10'h2fc;
              4'hf: pos_low = 10'h2fd;
              default: pos_low = 10'h000;
            endcase
          end
          6'h30: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h2fe;
              4'h1: pos_low = 10'h2ff;
              4'h2: pos_low = 10'h300;
              4'h3: pos_low = 10'h301;
              4'h4: pos_low = 10'h302;
              4'h5: pos_low = 10'h303;
              4'h6: pos_low = 10'h304;
              4'h7: pos_low = 10'h305;
              4'h8: pos_low = 10'h306;
              4'h9: pos_low = 10'h307;
              4'ha: pos_low = 10'h308;
              4'hb: pos_low = 10'h309;
              4'hc: pos_low = 10'h30a;
              4'hd: pos_low = 10'h30b;
              4'he: pos_low = 10'h30c;
              4'hf: pos_low = 10'h30d;
              default: pos_low = 10'h000;
            endcase
          end
          6'h31: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h30e;
              4'h1: pos_low = 10'h30f;
              4'h2: pos_low = 10'h310;
              4'h3: pos_low = 10'h311;
              4'h4: pos_low = 10'h312;
              4'h5: pos_low = 10'h313;
              4'h6: pos_low = 10'h314;
              4'h7: pos_low = 10'h315;
              4'h8: pos_low = 10'h316;
              4'h9: pos_low = 10'h317;
              4'ha: pos_low = 10'h318;
              4'hb: pos_low = 10'h319;
              4'hc: pos_low = 10'h31a;
              4'hd: pos_low = 10'h31b;
              4'he: pos_low = 10'h31c;
              4'hf: pos_low = 10'h31d;
              default: pos_low = 10'h000;
            endcase
          end
          6'h32: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h31e;
              4'h1: pos_low = 10'h31f;
              4'h2: pos_low = 10'h320;
              4'h3: pos_low = 10'h321;
              4'h4: pos_low = 10'h322;
              4'h5: pos_low = 10'h323;
              4'h6: pos_low = 10'h324;
              4'h7: pos_low = 10'h325;
              4'h8: pos_low = 10'h326;
              4'h9: pos_low = 10'h327;
              4'ha: pos_low = 10'h328;
              4'hb: pos_low = 10'h329;
              4'hc: pos_low = 10'h32a;
              4'hd: pos_low = 10'h32b;
              4'he: pos_low = 10'h32c;
              4'hf: pos_low = 10'h32d;
              default: pos_low = 10'h000;
            endcase
          end
          6'h33: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h32e;
              4'h1: pos_low = 10'h32f;
              4'h2: pos_low = 10'h330;
              4'h3: pos_low = 10'h331;
              4'h4: pos_low = 10'h332;
              4'h5: pos_low = 10'h333;
              4'h6: pos_low = 10'h334;
              4'h7: pos_low = 10'h335;
              4'h8: pos_low = 10'h336;
              4'h9: pos_low = 10'h337;
              4'ha: pos_low = 10'h338;
              4'hb: pos_low = 10'h339;
              4'hc: pos_low = 10'h33a;
              4'hd: pos_low = 10'h33b;
              4'he: pos_low = 10'h33c;
              4'hf: pos_low = 10'h33d;
              default: pos_low = 10'h000;
            endcase
          end
          6'h34: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h33e;
              4'h1: pos_low = 10'h33f;
              4'h2: pos_low = 10'h340;
              4'h3: pos_low = 10'h341;
              4'h4: pos_low = 10'h342;
              4'h5: pos_low = 10'h343;
              4'h6: pos_low = 10'h344;
              4'h7: pos_low = 10'h345;
              4'h8: pos_low = 10'h346;
              4'h9: pos_low = 10'h347;
              4'ha: pos_low = 10'h348;
              4'hb: pos_low = 10'h349;
              4'hc: pos_low = 10'h34a;
              4'hd: pos_low = 10'h34b;
              4'he: pos_low = 10'h34c;
              4'hf: pos_low = 10'h34d;
              default: pos_low = 10'h000;
            endcase
          end
          6'h35: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h34e;
              4'h1: pos_low = 10'h34f;
              4'h2: pos_low = 10'h350;
              4'h3: pos_low = 10'h351;
              4'h4: pos_low = 10'h352;
              4'h5: pos_low = 10'h353;
              4'h6: pos_low = 10'h354;
              4'h7: pos_low = 10'h355;
              4'h8: pos_low = 10'h356;
              4'h9: pos_low = 10'h357;
              4'ha: pos_low = 10'h358;
              4'hb: pos_low = 10'h359;
              4'hc: pos_low = 10'h35a;
              4'hd: pos_low = 10'h35b;
              4'he: pos_low = 10'h35c;
              4'hf: pos_low = 10'h35d;
              default: pos_low = 10'h000;
            endcase
          end
          6'h36: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h35e;
              4'h1: pos_low = 10'h35f;
              4'h2: pos_low = 10'h360;
              4'h3: pos_low = 10'h361;
              4'h4: pos_low = 10'h362;
              4'h5: pos_low = 10'h363;
              4'h6: pos_low = 10'h364;
              4'h7: pos_low = 10'h365;
              4'h8: pos_low = 10'h366;
              4'h9: pos_low = 10'h367;
              4'ha: pos_low = 10'h368;
              4'hb: pos_low = 10'h369;
              4'hc: pos_low = 10'h36a;
              4'hd: pos_low = 10'h36b;
              4'he: pos_low = 10'h36c;
              4'hf: pos_low = 10'h36d;
              default: pos_low = 10'h000;
            endcase
          end
          6'h37: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h36e;
              4'h1: pos_low = 10'h36f;
              4'h2: pos_low = 10'h370;
              4'h3: pos_low = 10'h371;
              4'h4: pos_low = 10'h372;
              4'h5: pos_low = 10'h373;
              4'h6: pos_low = 10'h374;
              4'h7: pos_low = 10'h375;
              4'h8: pos_low = 10'h376;
              4'h9: pos_low = 10'h377;
              4'ha: pos_low = 10'h378;
              4'hb: pos_low = 10'h379;
              4'hc: pos_low = 10'h37a;
              4'hd: pos_low = 10'h37b;
              4'he: pos_low = 10'h37c;
              4'hf: pos_low = 10'h37d;
              default: pos_low = 10'h000;
            endcase
          end
          6'h38: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h37e;
              4'h1: pos_low = 10'h37f;
              4'h2: pos_low = 10'h380;
              4'h3: pos_low = 10'h381;
              4'h4: pos_low = 10'h382;
              4'h5: pos_low = 10'h383;
              4'h6: pos_low = 10'h384;
              4'h7: pos_low = 10'h385;
              4'h8: pos_low = 10'h386;
              4'h9: pos_low = 10'h387;
              4'ha: pos_low = 10'h388;
              4'hb: pos_low = 10'h389;
              4'hc: pos_low = 10'h38a;
              4'hd: pos_low = 10'h38b;
              4'he: pos_low = 10'h38c;
              4'hf: pos_low = 10'h38d;
              default: pos_low = 10'h000;
            endcase
          end
          6'h39: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h38e;
              4'h1: pos_low = 10'h38f;
              4'h2: pos_low = 10'h390;
              4'h3: pos_low = 10'h391;
              4'h4: pos_low = 10'h392;
              4'h5: pos_low = 10'h393;
              4'h6: pos_low = 10'h394;
              4'h7: pos_low = 10'h395;
              4'h8: pos_low = 10'h396;
              4'h9: pos_low = 10'h397;
              4'ha: pos_low = 10'h398;
              4'hb: pos_low = 10'h399;
              4'hc: pos_low = 10'h39a;
              4'hd: pos_low = 10'h39b;
              4'he: pos_low = 10'h39c;
              4'hf: pos_low = 10'h39d;
              default: pos_low = 10'h000;
            endcase
          end
          6'h3a: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h39e;
              4'h1: pos_low = 10'h39f;
              4'h2: pos_low = 10'h3a0;
              4'h3: pos_low = 10'h3a1;
              4'h4: pos_low = 10'h3a2;
              4'h5: pos_low = 10'h3a3;
              4'h6: pos_low = 10'h3a4;
              4'h7: pos_low = 10'h3a5;
              4'h8: pos_low = 10'h3a6;
              4'h9: pos_low = 10'h3a7;
              4'ha: pos_low = 10'h3a8;
              4'hb: pos_low = 10'h3a9;
              4'hc: pos_low = 10'h3aa;
              4'hd: pos_low = 10'h3ab;
              4'he: pos_low = 10'h3ac;
              4'hf: pos_low = 10'h3ad;
              default: pos_low = 10'h000;
            endcase
          end
          6'h3b: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3ae;
              4'h1: pos_low = 10'h3af;
              4'h2: pos_low = 10'h3b0;
              4'h3: pos_low = 10'h3b1;
              4'h4: pos_low = 10'h3b2;
              4'h5: pos_low = 10'h3b3;
              4'h6: pos_low = 10'h3b4;
              4'h7: pos_low = 10'h3b5;
              4'h8: pos_low = 10'h3b6;
              4'h9: pos_low = 10'h3b7;
              4'ha: pos_low = 10'h3b8;
              4'hb: pos_low = 10'h3b9;
              4'hc: pos_low = 10'h3ba;
              4'hd: pos_low = 10'h3bb;
              4'he: pos_low = 10'h3bc;
              4'hf: pos_low = 10'h3bd;
              default: pos_low = 10'h000;
            endcase
          end
          6'h3c: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3be;
              4'h1: pos_low = 10'h3bf;
              4'h2: pos_low = 10'h3c0;
              4'h3: pos_low = 10'h3c1;
              4'h4: pos_low = 10'h3c2;
              4'h5: pos_low = 10'h3c3;
              4'h6: pos_low = 10'h3c4;
              4'h7: pos_low = 10'h3c5;
              4'h8: pos_low = 10'h3c6;
              4'h9: pos_low = 10'h3c7;
              4'ha: pos_low = 10'h3c8;
              4'hb: pos_low = 10'h3c9;
              4'hc: pos_low = 10'h3ca;
              4'hd: pos_low = 10'h3cb;
              4'he: pos_low = 10'h3cc;
              4'hf: pos_low = 10'h3cd;
              default: pos_low = 10'h000;
            endcase
          end
          6'h3d: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3ce;
              4'h1: pos_low = 10'h3cf;
              4'h2: pos_low = 10'h3d0;
              4'h3: pos_low = 10'h3d1;
              4'h4: pos_low = 10'h3d2;
              4'h5: pos_low = 10'h3d3;
              4'h6: pos_low = 10'h3d3;
              4'h7: pos_low = 10'h3d4;
              4'h8: pos_low = 10'h3d5;
              4'h9: pos_low = 10'h3d6;
              4'ha: pos_low = 10'h3d7;
              4'hb: pos_low = 10'h3d8;
              4'hc: pos_low = 10'h3d9;
              4'hd: pos_low = 10'h3da;
              4'he: pos_low = 10'h3db;
              4'hf: pos_low = 10'h3dc;
              default: pos_low = 10'h000;
            endcase
          end
          6'h3e: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3dd;
              4'h1: pos_low = 10'h3de;
              4'h2: pos_low = 10'h3df;
              4'h3: pos_low = 10'h3e0;
              4'h4: pos_low = 10'h3e1;
              4'h5: pos_low = 10'h3e2;
              4'h6: pos_low = 10'h3e3;
              4'h7: pos_low = 10'h3e4;
              4'h8: pos_low = 10'h3e5;
              4'h9: pos_low = 10'h3e6;
              4'ha: pos_low = 10'h3e7;
              4'hb: pos_low = 10'h3e8;
              4'hc: pos_low = 10'h3e9;
              4'hd: pos_low = 10'h3ea;
              4'he: pos_low = 10'h3eb;
              4'hf: pos_low = 10'h3ec;
              default: pos_low = 10'h000;
            endcase
          end
          6'h3f: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3ed;
              4'h1: pos_low = 10'h3ee;
              4'h2: pos_low = 10'h3ef;
              4'h3: pos_low = 10'h3f0;
              4'h4: pos_low = 10'h3f1;
              4'h5: pos_low = 10'h3f2;
              4'h6: pos_low = 10'h3f3;
              4'h7: pos_low = 10'h3f4;
              4'h8: pos_low = 10'h3f5;
              4'h9: pos_low = 10'h3f6;
              4'ha: pos_low = 10'h3f7;
              4'hb: pos_low = 10'h3f8;
              4'hc: pos_low = 10'h3f9;
              4'hd: pos_low = 10'h3fa;
              4'he: pos_low = 10'h3fb;
              4'hf: pos_low = 10'h3fc;
              default: pos_low = 10'h000;
            endcase
          end
          default: begin end
        endcase
      end
      5'h0b: begin
        case (mant[9:4])
          6'h00: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3fd;
              4'h1: pos_low = 10'h3ff;
              4'h2: pos_low = 10'h001;
              4'h3: pos_low = 10'h002;
              4'h4: pos_low = 10'h003;
              4'h5: pos_low = 10'h004;
              4'h6: pos_low = 10'h005;
              4'h7: pos_low = 10'h006;
              4'h8: pos_low = 10'h007;
              4'h9: pos_low = 10'h008;
              4'ha: pos_low = 10'h009;
              4'hb: pos_low = 10'h00a;
              4'hc: pos_low = 10'h00b;
              4'hd: pos_low = 10'h00c;
              4'he: pos_low = 10'h00d;
              4'hf: pos_low = 10'h00e;
              default: pos_low = 10'h000;
            endcase
          end
          6'h01: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h00f;
              4'h1: pos_low = 10'h010;
              4'h2: pos_low = 10'h011;
              4'h3: pos_low = 10'h012;
              4'h4: pos_low = 10'h013;
              4'h5: pos_low = 10'h014;
              4'h6: pos_low = 10'h015;
              4'h7: pos_low = 10'h016;
              4'h8: pos_low = 10'h017;
              4'h9: pos_low = 10'h018;
              4'ha: pos_low = 10'h019;
              4'hb: pos_low = 10'h01a;
              4'hc: pos_low = 10'h01b;
              4'hd: pos_low = 10'h01c;
              4'he: pos_low = 10'h01d;
              4'hf: pos_low = 10'h01e;
              default: pos_low = 10'h000;
            endcase
          end
          6'h02: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h01f;
              4'h1: pos_low = 10'h020;
              4'h2: pos_low = 10'h021;
              4'h3: pos_low = 10'h022;
              4'h4: pos_low = 10'h023;
              4'h5: pos_low = 10'h024;
              4'h6: pos_low = 10'h025;
              4'h7: pos_low = 10'h026;
              4'h8: pos_low = 10'h027;
              4'h9: pos_low = 10'h028;
              4'ha: pos_low = 10'h028;
              4'hb: pos_low = 10'h029;
              4'hc: pos_low = 10'h02a;
              4'hd: pos_low = 10'h02b;
              4'he: pos_low = 10'h02c;
              4'hf: pos_low = 10'h02d;
              default: pos_low = 10'h000;
            endcase
          end
          6'h03: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h02e;
              4'h1: pos_low = 10'h02f;
              4'h2: pos_low = 10'h030;
              4'h3: pos_low = 10'h031;
              4'h4: pos_low = 10'h032;
              4'h5: pos_low = 10'h033;
              4'h6: pos_low = 10'h034;
              4'h7: pos_low = 10'h035;
              4'h8: pos_low = 10'h036;
              4'h9: pos_low = 10'h037;
              4'ha: pos_low = 10'h038;
              4'hb: pos_low = 10'h039;
              4'hc: pos_low = 10'h03a;
              4'hd: pos_low = 10'h03b;
              4'he: pos_low = 10'h03c;
              4'hf: pos_low = 10'h03d;
              default: pos_low = 10'h000;
            endcase
          end
          6'h04: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h03e;
              4'h1: pos_low = 10'h03f;
              4'h2: pos_low = 10'h040;
              4'h3: pos_low = 10'h041;
              4'h4: pos_low = 10'h042;
              4'h5: pos_low = 10'h043;
              4'h6: pos_low = 10'h044;
              4'h7: pos_low = 10'h045;
              4'h8: pos_low = 10'h046;
              4'h9: pos_low = 10'h047;
              4'ha: pos_low = 10'h048;
              4'hb: pos_low = 10'h049;
              4'hc: pos_low = 10'h04a;
              4'hd: pos_low = 10'h04b;
              4'he: pos_low = 10'h04c;
              4'hf: pos_low = 10'h04d;
              default: pos_low = 10'h000;
            endcase
          end
          6'h05: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h04e;
              4'h1: pos_low = 10'h04f;
              4'h2: pos_low = 10'h050;
              4'h3: pos_low = 10'h051;
              4'h4: pos_low = 10'h052;
              4'h5: pos_low = 10'h053;
              4'h6: pos_low = 10'h054;
              4'h7: pos_low = 10'h055;
              4'h8: pos_low = 10'h056;
              4'h9: pos_low = 10'h057;
              4'ha: pos_low = 10'h058;
              4'hb: pos_low = 10'h059;
              4'hc: pos_low = 10'h05a;
              4'hd: pos_low = 10'h05b;
              4'he: pos_low = 10'h05c;
              4'hf: pos_low = 10'h05d;
              default: pos_low = 10'h000;
            endcase
          end
          6'h06: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h05e;
              4'h1: pos_low = 10'h05f;
              4'h2: pos_low = 10'h060;
              4'h3: pos_low = 10'h061;
              4'h4: pos_low = 10'h062;
              4'h5: pos_low = 10'h063;
              4'h6: pos_low = 10'h064;
              4'h7: pos_low = 10'h065;
              4'h8: pos_low = 10'h066;
              4'h9: pos_low = 10'h067;
              4'ha: pos_low = 10'h068;
              4'hb: pos_low = 10'h069;
              4'hc: pos_low = 10'h06a;
              4'hd: pos_low = 10'h06b;
              4'he: pos_low = 10'h06c;
              4'hf: pos_low = 10'h06d;
              default: pos_low = 10'h000;
            endcase
          end
          6'h07: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h06e;
              4'h1: pos_low = 10'h06f;
              4'h2: pos_low = 10'h070;
              4'h3: pos_low = 10'h071;
              4'h4: pos_low = 10'h072;
              4'h5: pos_low = 10'h073;
              4'h6: pos_low = 10'h074;
              4'h7: pos_low = 10'h075;
              4'h8: pos_low = 10'h076;
              4'h9: pos_low = 10'h077;
              4'ha: pos_low = 10'h078;
              4'hb: pos_low = 10'h079;
              4'hc: pos_low = 10'h07a;
              4'hd: pos_low = 10'h07b;
              4'he: pos_low = 10'h07c;
              4'hf: pos_low = 10'h07d;
              default: pos_low = 10'h000;
            endcase
          end
          6'h08: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h07e;
              4'h1: pos_low = 10'h07f;
              4'h2: pos_low = 10'h080;
              4'h3: pos_low = 10'h081;
              4'h4: pos_low = 10'h082;
              4'h5: pos_low = 10'h083;
              4'h6: pos_low = 10'h084;
              4'h7: pos_low = 10'h085;
              4'h8: pos_low = 10'h086;
              4'h9: pos_low = 10'h087;
              4'ha: pos_low = 10'h088;
              4'hb: pos_low = 10'h089;
              4'hc: pos_low = 10'h08a;
              4'hd: pos_low = 10'h08b;
              4'he: pos_low = 10'h08c;
              4'hf: pos_low = 10'h08d;
              default: pos_low = 10'h000;
            endcase
          end
          6'h09: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h08e;
              4'h1: pos_low = 10'h08f;
              4'h2: pos_low = 10'h090;
              4'h3: pos_low = 10'h091;
              4'h4: pos_low = 10'h092;
              4'h5: pos_low = 10'h093;
              4'h6: pos_low = 10'h094;
              4'h7: pos_low = 10'h095;
              4'h8: pos_low = 10'h096;
              4'h9: pos_low = 10'h097;
              4'ha: pos_low = 10'h098;
              4'hb: pos_low = 10'h099;
              4'hc: pos_low = 10'h09a;
              4'hd: pos_low = 10'h09b;
              4'he: pos_low = 10'h09c;
              4'hf: pos_low = 10'h09d;
              default: pos_low = 10'h000;
            endcase
          end
          6'h0a: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h09e;
              4'h1: pos_low = 10'h09f;
              4'h2: pos_low = 10'h0a0;
              4'h3: pos_low = 10'h0a1;
              4'h4: pos_low = 10'h0a2;
              4'h5: pos_low = 10'h0a3;
              4'h6: pos_low = 10'h0a4;
              4'h7: pos_low = 10'h0a5;
              4'h8: pos_low = 10'h0a6;
              4'h9: pos_low = 10'h0a7;
              4'ha: pos_low = 10'h0a8;
              4'hb: pos_low = 10'h0a9;
              4'hc: pos_low = 10'h0aa;
              4'hd: pos_low = 10'h0ab;
              4'he: pos_low = 10'h0ac;
              4'hf: pos_low = 10'h0ad;
              default: pos_low = 10'h000;
            endcase
          end
          6'h0b: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h0ae;
              4'h1: pos_low = 10'h0af;
              4'h2: pos_low = 10'h0b0;
              4'h3: pos_low = 10'h0b1;
              4'h4: pos_low = 10'h0b2;
              4'h5: pos_low = 10'h0b3;
              4'h6: pos_low = 10'h0b4;
              4'h7: pos_low = 10'h0b5;
              4'h8: pos_low = 10'h0b6;
              4'h9: pos_low = 10'h0b7;
              4'ha: pos_low = 10'h0b8;
              4'hb: pos_low = 10'h0b9;
              4'hc: pos_low = 10'h0ba;
              4'hd: pos_low = 10'h0bb;
              4'he: pos_low = 10'h0bc;
              4'hf: pos_low = 10'h0bd;
              default: pos_low = 10'h000;
            endcase
          end
          6'h0c: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h0be;
              4'h1: pos_low = 10'h0bf;
              4'h2: pos_low = 10'h0c0;
              4'h3: pos_low = 10'h0c1;
              4'h4: pos_low = 10'h0c2;
              4'h5: pos_low = 10'h0c3;
              4'h6: pos_low = 10'h0c4;
              4'h7: pos_low = 10'h0c5;
              4'h8: pos_low = 10'h0c6;
              4'h9: pos_low = 10'h0c7;
              4'ha: pos_low = 10'h0c8;
              4'hb: pos_low = 10'h0c9;
              4'hc: pos_low = 10'h0ca;
              4'hd: pos_low = 10'h0cb;
              4'he: pos_low = 10'h0cc;
              4'hf: pos_low = 10'h0cd;
              default: pos_low = 10'h000;
            endcase
          end
          6'h0d: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h0ce;
              4'h1: pos_low = 10'h0cf;
              4'h2: pos_low = 10'h0d0;
              4'h3: pos_low = 10'h0d1;
              4'h4: pos_low = 10'h0d2;
              4'h5: pos_low = 10'h0d3;
              4'h6: pos_low = 10'h0d4;
              4'h7: pos_low = 10'h0d5;
              4'h8: pos_low = 10'h0d6;
              4'h9: pos_low = 10'h0d7;
              4'ha: pos_low = 10'h0d8;
              4'hb: pos_low = 10'h0d9;
              4'hc: pos_low = 10'h0da;
              4'hd: pos_low = 10'h0db;
              4'he: pos_low = 10'h0dc;
              4'hf: pos_low = 10'h0dd;
              default: pos_low = 10'h000;
            endcase
          end
          6'h0e: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h0de;
              4'h1: pos_low = 10'h0df;
              4'h2: pos_low = 10'h0e0;
              4'h3: pos_low = 10'h0e1;
              4'h4: pos_low = 10'h0e2;
              4'h5: pos_low = 10'h0e3;
              4'h6: pos_low = 10'h0e4;
              4'h7: pos_low = 10'h0e5;
              4'h8: pos_low = 10'h0e6;
              4'h9: pos_low = 10'h0e7;
              4'ha: pos_low = 10'h0e8;
              4'hb: pos_low = 10'h0e9;
              4'hc: pos_low = 10'h0ea;
              4'hd: pos_low = 10'h0eb;
              4'he: pos_low = 10'h0ec;
              4'hf: pos_low = 10'h0ed;
              default: pos_low = 10'h000;
            endcase
          end
          6'h0f: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h0ed;
              4'h1: pos_low = 10'h0ee;
              4'h2: pos_low = 10'h0ef;
              4'h3: pos_low = 10'h0f0;
              4'h4: pos_low = 10'h0f1;
              4'h5: pos_low = 10'h0f2;
              4'h6: pos_low = 10'h0f3;
              4'h7: pos_low = 10'h0f4;
              4'h8: pos_low = 10'h0f5;
              4'h9: pos_low = 10'h0f6;
              4'ha: pos_low = 10'h0f7;
              4'hb: pos_low = 10'h0f8;
              4'hc: pos_low = 10'h0f9;
              4'hd: pos_low = 10'h0fa;
              4'he: pos_low = 10'h0fb;
              4'hf: pos_low = 10'h0fc;
              default: pos_low = 10'h000;
            endcase
          end
          6'h10: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h0fd;
              4'h1: pos_low = 10'h0fe;
              4'h2: pos_low = 10'h0ff;
              4'h3: pos_low = 10'h100;
              4'h4: pos_low = 10'h101;
              4'h5: pos_low = 10'h102;
              4'h6: pos_low = 10'h103;
              4'h7: pos_low = 10'h104;
              4'h8: pos_low = 10'h105;
              4'h9: pos_low = 10'h106;
              4'ha: pos_low = 10'h107;
              4'hb: pos_low = 10'h108;
              4'hc: pos_low = 10'h109;
              4'hd: pos_low = 10'h10a;
              4'he: pos_low = 10'h10b;
              4'hf: pos_low = 10'h10c;
              default: pos_low = 10'h000;
            endcase
          end
          6'h11: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h10d;
              4'h1: pos_low = 10'h10e;
              4'h2: pos_low = 10'h10f;
              4'h3: pos_low = 10'h110;
              4'h4: pos_low = 10'h111;
              4'h5: pos_low = 10'h112;
              4'h6: pos_low = 10'h113;
              4'h7: pos_low = 10'h114;
              4'h8: pos_low = 10'h115;
              4'h9: pos_low = 10'h116;
              4'ha: pos_low = 10'h117;
              4'hb: pos_low = 10'h118;
              4'hc: pos_low = 10'h119;
              4'hd: pos_low = 10'h11a;
              4'he: pos_low = 10'h11b;
              4'hf: pos_low = 10'h11c;
              default: pos_low = 10'h000;
            endcase
          end
          6'h12: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h11d;
              4'h1: pos_low = 10'h11e;
              4'h2: pos_low = 10'h11f;
              4'h3: pos_low = 10'h120;
              4'h4: pos_low = 10'h121;
              4'h5: pos_low = 10'h122;
              4'h6: pos_low = 10'h123;
              4'h7: pos_low = 10'h124;
              4'h8: pos_low = 10'h125;
              4'h9: pos_low = 10'h126;
              4'ha: pos_low = 10'h127;
              4'hb: pos_low = 10'h128;
              4'hc: pos_low = 10'h129;
              4'hd: pos_low = 10'h12a;
              4'he: pos_low = 10'h12b;
              4'hf: pos_low = 10'h12c;
              default: pos_low = 10'h000;
            endcase
          end
          6'h13: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h12d;
              4'h1: pos_low = 10'h12e;
              4'h2: pos_low = 10'h12f;
              4'h3: pos_low = 10'h130;
              4'h4: pos_low = 10'h131;
              4'h5: pos_low = 10'h132;
              4'h6: pos_low = 10'h133;
              4'h7: pos_low = 10'h134;
              4'h8: pos_low = 10'h135;
              4'h9: pos_low = 10'h136;
              4'ha: pos_low = 10'h137;
              4'hb: pos_low = 10'h138;
              4'hc: pos_low = 10'h139;
              4'hd: pos_low = 10'h13a;
              4'he: pos_low = 10'h13b;
              4'hf: pos_low = 10'h13c;
              default: pos_low = 10'h000;
            endcase
          end
          6'h14: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h13d;
              4'h1: pos_low = 10'h13e;
              4'h2: pos_low = 10'h13f;
              4'h3: pos_low = 10'h140;
              4'h4: pos_low = 10'h141;
              4'h5: pos_low = 10'h142;
              4'h6: pos_low = 10'h143;
              4'h7: pos_low = 10'h144;
              4'h8: pos_low = 10'h145;
              4'h9: pos_low = 10'h146;
              4'ha: pos_low = 10'h147;
              4'hb: pos_low = 10'h148;
              4'hc: pos_low = 10'h149;
              4'hd: pos_low = 10'h14a;
              4'he: pos_low = 10'h14b;
              4'hf: pos_low = 10'h14c;
              default: pos_low = 10'h000;
            endcase
          end
          6'h15: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h14d;
              4'h1: pos_low = 10'h14e;
              4'h2: pos_low = 10'h14f;
              4'h3: pos_low = 10'h150;
              4'h4: pos_low = 10'h151;
              4'h5: pos_low = 10'h152;
              4'h6: pos_low = 10'h153;
              4'h7: pos_low = 10'h154;
              4'h8: pos_low = 10'h155;
              4'h9: pos_low = 10'h156;
              4'ha: pos_low = 10'h157;
              4'hb: pos_low = 10'h158;
              4'hc: pos_low = 10'h159;
              4'hd: pos_low = 10'h15a;
              4'he: pos_low = 10'h15b;
              4'hf: pos_low = 10'h15c;
              default: pos_low = 10'h000;
            endcase
          end
          6'h16: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h15d;
              4'h1: pos_low = 10'h15e;
              4'h2: pos_low = 10'h15f;
              4'h3: pos_low = 10'h160;
              4'h4: pos_low = 10'h161;
              4'h5: pos_low = 10'h162;
              4'h6: pos_low = 10'h163;
              4'h7: pos_low = 10'h164;
              4'h8: pos_low = 10'h165;
              4'h9: pos_low = 10'h166;
              4'ha: pos_low = 10'h167;
              4'hb: pos_low = 10'h168;
              4'hc: pos_low = 10'h169;
              4'hd: pos_low = 10'h16a;
              4'he: pos_low = 10'h16b;
              4'hf: pos_low = 10'h16c;
              default: pos_low = 10'h000;
            endcase
          end
          6'h17: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h16d;
              4'h1: pos_low = 10'h16e;
              4'h2: pos_low = 10'h16f;
              4'h3: pos_low = 10'h170;
              4'h4: pos_low = 10'h171;
              4'h5: pos_low = 10'h172;
              4'h6: pos_low = 10'h173;
              4'h7: pos_low = 10'h174;
              4'h8: pos_low = 10'h175;
              4'h9: pos_low = 10'h176;
              4'ha: pos_low = 10'h177;
              4'hb: pos_low = 10'h178;
              4'hc: pos_low = 10'h179;
              4'hd: pos_low = 10'h17a;
              4'he: pos_low = 10'h17b;
              4'hf: pos_low = 10'h17c;
              default: pos_low = 10'h000;
            endcase
          end
          6'h18: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h17d;
              4'h1: pos_low = 10'h17e;
              4'h2: pos_low = 10'h17f;
              4'h3: pos_low = 10'h180;
              4'h4: pos_low = 10'h181;
              4'h5: pos_low = 10'h182;
              4'h6: pos_low = 10'h182;
              4'h7: pos_low = 10'h183;
              4'h8: pos_low = 10'h184;
              4'h9: pos_low = 10'h185;
              4'ha: pos_low = 10'h186;
              4'hb: pos_low = 10'h187;
              4'hc: pos_low = 10'h188;
              4'hd: pos_low = 10'h189;
              4'he: pos_low = 10'h18a;
              4'hf: pos_low = 10'h18b;
              default: pos_low = 10'h000;
            endcase
          end
          6'h19: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h18c;
              4'h1: pos_low = 10'h18d;
              4'h2: pos_low = 10'h18e;
              4'h3: pos_low = 10'h18f;
              4'h4: pos_low = 10'h190;
              4'h5: pos_low = 10'h191;
              4'h6: pos_low = 10'h192;
              4'h7: pos_low = 10'h193;
              4'h8: pos_low = 10'h194;
              4'h9: pos_low = 10'h195;
              4'ha: pos_low = 10'h196;
              4'hb: pos_low = 10'h197;
              4'hc: pos_low = 10'h198;
              4'hd: pos_low = 10'h199;
              4'he: pos_low = 10'h19a;
              4'hf: pos_low = 10'h19b;
              default: pos_low = 10'h000;
            endcase
          end
          6'h1a: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h19c;
              4'h1: pos_low = 10'h19d;
              4'h2: pos_low = 10'h19e;
              4'h3: pos_low = 10'h19f;
              4'h4: pos_low = 10'h1a0;
              4'h5: pos_low = 10'h1a1;
              4'h6: pos_low = 10'h1a2;
              4'h7: pos_low = 10'h1a3;
              4'h8: pos_low = 10'h1a4;
              4'h9: pos_low = 10'h1a5;
              4'ha: pos_low = 10'h1a6;
              4'hb: pos_low = 10'h1a7;
              4'hc: pos_low = 10'h1a8;
              4'hd: pos_low = 10'h1a9;
              4'he: pos_low = 10'h1aa;
              4'hf: pos_low = 10'h1ab;
              default: pos_low = 10'h000;
            endcase
          end
          6'h1b: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h1ac;
              4'h1: pos_low = 10'h1ad;
              4'h2: pos_low = 10'h1ae;
              4'h3: pos_low = 10'h1af;
              4'h4: pos_low = 10'h1b0;
              4'h5: pos_low = 10'h1b1;
              4'h6: pos_low = 10'h1b2;
              4'h7: pos_low = 10'h1b3;
              4'h8: pos_low = 10'h1b4;
              4'h9: pos_low = 10'h1b5;
              4'ha: pos_low = 10'h1b6;
              4'hb: pos_low = 10'h1b7;
              4'hc: pos_low = 10'h1b8;
              4'hd: pos_low = 10'h1b9;
              4'he: pos_low = 10'h1ba;
              4'hf: pos_low = 10'h1bb;
              default: pos_low = 10'h000;
            endcase
          end
          6'h1c: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h1bc;
              4'h1: pos_low = 10'h1bd;
              4'h2: pos_low = 10'h1be;
              4'h3: pos_low = 10'h1bf;
              4'h4: pos_low = 10'h1c0;
              4'h5: pos_low = 10'h1c1;
              4'h6: pos_low = 10'h1c2;
              4'h7: pos_low = 10'h1c3;
              4'h8: pos_low = 10'h1c4;
              4'h9: pos_low = 10'h1c5;
              4'ha: pos_low = 10'h1c6;
              4'hb: pos_low = 10'h1c7;
              4'hc: pos_low = 10'h1c8;
              4'hd: pos_low = 10'h1c9;
              4'he: pos_low = 10'h1ca;
              4'hf: pos_low = 10'h1cb;
              default: pos_low = 10'h000;
            endcase
          end
          6'h1d: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h1cc;
              4'h1: pos_low = 10'h1cd;
              4'h2: pos_low = 10'h1ce;
              4'h3: pos_low = 10'h1cf;
              4'h4: pos_low = 10'h1d0;
              4'h5: pos_low = 10'h1d1;
              4'h6: pos_low = 10'h1d2;
              4'h7: pos_low = 10'h1d3;
              4'h8: pos_low = 10'h1d4;
              4'h9: pos_low = 10'h1d5;
              4'ha: pos_low = 10'h1d6;
              4'hb: pos_low = 10'h1d7;
              4'hc: pos_low = 10'h1d8;
              4'hd: pos_low = 10'h1d9;
              4'he: pos_low = 10'h1da;
              4'hf: pos_low = 10'h1db;
              default: pos_low = 10'h000;
            endcase
          end
          6'h1e: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h1dc;
              4'h1: pos_low = 10'h1dd;
              4'h2: pos_low = 10'h1de;
              4'h3: pos_low = 10'h1df;
              4'h4: pos_low = 10'h1e0;
              4'h5: pos_low = 10'h1e1;
              4'h6: pos_low = 10'h1e2;
              4'h7: pos_low = 10'h1e3;
              4'h8: pos_low = 10'h1e4;
              4'h9: pos_low = 10'h1e5;
              4'ha: pos_low = 10'h1e6;
              4'hb: pos_low = 10'h1e7;
              4'hc: pos_low = 10'h1e8;
              4'hd: pos_low = 10'h1e9;
              4'he: pos_low = 10'h1ea;
              4'hf: pos_low = 10'h1eb;
              default: pos_low = 10'h000;
            endcase
          end
          6'h1f: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h1ec;
              4'h1: pos_low = 10'h1ed;
              4'h2: pos_low = 10'h1ee;
              4'h3: pos_low = 10'h1ef;
              4'h4: pos_low = 10'h1f0;
              4'h5: pos_low = 10'h1f1;
              4'h6: pos_low = 10'h1f2;
              4'h7: pos_low = 10'h1f3;
              4'h8: pos_low = 10'h1f4;
              4'h9: pos_low = 10'h1f5;
              4'ha: pos_low = 10'h1f6;
              4'hb: pos_low = 10'h1f7;
              4'hc: pos_low = 10'h1f8;
              4'hd: pos_low = 10'h1f9;
              4'he: pos_low = 10'h1fa;
              4'hf: pos_low = 10'h1fb;
              default: pos_low = 10'h000;
            endcase
          end
          6'h20: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h1fc;
              4'h1: pos_low = 10'h1fd;
              4'h2: pos_low = 10'h1fd;
              4'h3: pos_low = 10'h1fe;
              4'h4: pos_low = 10'h1ff;
              4'h5: pos_low = 10'h200;
              4'h6: pos_low = 10'h201;
              4'h7: pos_low = 10'h202;
              4'h8: pos_low = 10'h203;
              4'h9: pos_low = 10'h204;
              4'ha: pos_low = 10'h205;
              4'hb: pos_low = 10'h206;
              4'hc: pos_low = 10'h207;
              4'hd: pos_low = 10'h208;
              4'he: pos_low = 10'h209;
              4'hf: pos_low = 10'h20a;
              default: pos_low = 10'h000;
            endcase
          end
          6'h21: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h20b;
              4'h1: pos_low = 10'h20c;
              4'h2: pos_low = 10'h20d;
              4'h3: pos_low = 10'h20e;
              4'h4: pos_low = 10'h20f;
              4'h5: pos_low = 10'h210;
              4'h6: pos_low = 10'h211;
              4'h7: pos_low = 10'h212;
              4'h8: pos_low = 10'h213;
              4'h9: pos_low = 10'h214;
              4'ha: pos_low = 10'h215;
              4'hb: pos_low = 10'h216;
              4'hc: pos_low = 10'h217;
              4'hd: pos_low = 10'h218;
              4'he: pos_low = 10'h219;
              4'hf: pos_low = 10'h21a;
              default: pos_low = 10'h000;
            endcase
          end
          6'h22: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h21b;
              4'h1: pos_low = 10'h21c;
              4'h2: pos_low = 10'h21d;
              4'h3: pos_low = 10'h21e;
              4'h4: pos_low = 10'h21f;
              4'h5: pos_low = 10'h220;
              4'h6: pos_low = 10'h221;
              4'h7: pos_low = 10'h222;
              4'h8: pos_low = 10'h223;
              4'h9: pos_low = 10'h224;
              4'ha: pos_low = 10'h225;
              4'hb: pos_low = 10'h226;
              4'hc: pos_low = 10'h227;
              4'hd: pos_low = 10'h228;
              4'he: pos_low = 10'h229;
              4'hf: pos_low = 10'h22a;
              default: pos_low = 10'h000;
            endcase
          end
          6'h23: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h22b;
              4'h1: pos_low = 10'h22c;
              4'h2: pos_low = 10'h22d;
              4'h3: pos_low = 10'h22e;
              4'h4: pos_low = 10'h22f;
              4'h5: pos_low = 10'h230;
              4'h6: pos_low = 10'h231;
              4'h7: pos_low = 10'h232;
              4'h8: pos_low = 10'h233;
              4'h9: pos_low = 10'h234;
              4'ha: pos_low = 10'h235;
              4'hb: pos_low = 10'h236;
              4'hc: pos_low = 10'h237;
              4'hd: pos_low = 10'h238;
              4'he: pos_low = 10'h239;
              4'hf: pos_low = 10'h23a;
              default: pos_low = 10'h000;
            endcase
          end
          6'h24: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h23b;
              4'h1: pos_low = 10'h23c;
              4'h2: pos_low = 10'h23d;
              4'h3: pos_low = 10'h23e;
              4'h4: pos_low = 10'h23f;
              4'h5: pos_low = 10'h240;
              4'h6: pos_low = 10'h241;
              4'h7: pos_low = 10'h242;
              4'h8: pos_low = 10'h243;
              4'h9: pos_low = 10'h244;
              4'ha: pos_low = 10'h245;
              4'hb: pos_low = 10'h246;
              4'hc: pos_low = 10'h247;
              4'hd: pos_low = 10'h248;
              4'he: pos_low = 10'h249;
              4'hf: pos_low = 10'h24a;
              default: pos_low = 10'h000;
            endcase
          end
          6'h25: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h24b;
              4'h1: pos_low = 10'h24c;
              4'h2: pos_low = 10'h24d;
              4'h3: pos_low = 10'h24e;
              4'h4: pos_low = 10'h24f;
              4'h5: pos_low = 10'h250;
              4'h6: pos_low = 10'h251;
              4'h7: pos_low = 10'h252;
              4'h8: pos_low = 10'h253;
              4'h9: pos_low = 10'h254;
              4'ha: pos_low = 10'h255;
              4'hb: pos_low = 10'h256;
              4'hc: pos_low = 10'h257;
              4'hd: pos_low = 10'h258;
              4'he: pos_low = 10'h259;
              4'hf: pos_low = 10'h25a;
              default: pos_low = 10'h000;
            endcase
          end
          6'h26: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h25b;
              4'h1: pos_low = 10'h25c;
              4'h2: pos_low = 10'h25d;
              4'h3: pos_low = 10'h25e;
              4'h4: pos_low = 10'h25f;
              4'h5: pos_low = 10'h260;
              4'h6: pos_low = 10'h261;
              4'h7: pos_low = 10'h262;
              4'h8: pos_low = 10'h263;
              4'h9: pos_low = 10'h264;
              4'ha: pos_low = 10'h265;
              4'hb: pos_low = 10'h266;
              4'hc: pos_low = 10'h267;
              4'hd: pos_low = 10'h267;
              4'he: pos_low = 10'h268;
              4'hf: pos_low = 10'h269;
              default: pos_low = 10'h000;
            endcase
          end
          6'h27: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h26a;
              4'h1: pos_low = 10'h26b;
              4'h2: pos_low = 10'h26c;
              4'h3: pos_low = 10'h26d;
              4'h4: pos_low = 10'h26e;
              4'h5: pos_low = 10'h26f;
              4'h6: pos_low = 10'h270;
              4'h7: pos_low = 10'h271;
              4'h8: pos_low = 10'h272;
              4'h9: pos_low = 10'h273;
              4'ha: pos_low = 10'h274;
              4'hb: pos_low = 10'h275;
              4'hc: pos_low = 10'h276;
              4'hd: pos_low = 10'h277;
              4'he: pos_low = 10'h278;
              4'hf: pos_low = 10'h279;
              default: pos_low = 10'h000;
            endcase
          end
          6'h28: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h27a;
              4'h1: pos_low = 10'h27b;
              4'h2: pos_low = 10'h27c;
              4'h3: pos_low = 10'h27d;
              4'h4: pos_low = 10'h27e;
              4'h5: pos_low = 10'h27f;
              4'h6: pos_low = 10'h280;
              4'h7: pos_low = 10'h281;
              4'h8: pos_low = 10'h282;
              4'h9: pos_low = 10'h283;
              4'ha: pos_low = 10'h284;
              4'hb: pos_low = 10'h285;
              4'hc: pos_low = 10'h286;
              4'hd: pos_low = 10'h287;
              4'he: pos_low = 10'h288;
              4'hf: pos_low = 10'h289;
              default: pos_low = 10'h000;
            endcase
          end
          6'h29: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h28a;
              4'h1: pos_low = 10'h28b;
              4'h2: pos_low = 10'h28c;
              4'h3: pos_low = 10'h28d;
              4'h4: pos_low = 10'h28e;
              4'h5: pos_low = 10'h28f;
              4'h6: pos_low = 10'h290;
              4'h7: pos_low = 10'h291;
              4'h8: pos_low = 10'h292;
              4'h9: pos_low = 10'h293;
              4'ha: pos_low = 10'h294;
              4'hb: pos_low = 10'h295;
              4'hc: pos_low = 10'h296;
              4'hd: pos_low = 10'h297;
              4'he: pos_low = 10'h298;
              4'hf: pos_low = 10'h299;
              default: pos_low = 10'h000;
            endcase
          end
          6'h2a: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h29a;
              4'h1: pos_low = 10'h29b;
              4'h2: pos_low = 10'h29c;
              4'h3: pos_low = 10'h29d;
              4'h4: pos_low = 10'h29e;
              4'h5: pos_low = 10'h29f;
              4'h6: pos_low = 10'h2a0;
              4'h7: pos_low = 10'h2a1;
              4'h8: pos_low = 10'h2a2;
              4'h9: pos_low = 10'h2a3;
              4'ha: pos_low = 10'h2a4;
              4'hb: pos_low = 10'h2a5;
              4'hc: pos_low = 10'h2a6;
              4'hd: pos_low = 10'h2a7;
              4'he: pos_low = 10'h2a8;
              4'hf: pos_low = 10'h2a9;
              default: pos_low = 10'h000;
            endcase
          end
          6'h2b: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h2aa;
              4'h1: pos_low = 10'h2ab;
              4'h2: pos_low = 10'h2ac;
              4'h3: pos_low = 10'h2ad;
              4'h4: pos_low = 10'h2ae;
              4'h5: pos_low = 10'h2af;
              4'h6: pos_low = 10'h2b0;
              4'h7: pos_low = 10'h2b1;
              4'h8: pos_low = 10'h2b2;
              4'h9: pos_low = 10'h2b3;
              4'ha: pos_low = 10'h2b4;
              4'hb: pos_low = 10'h2b5;
              4'hc: pos_low = 10'h2b6;
              4'hd: pos_low = 10'h2b7;
              4'he: pos_low = 10'h2b8;
              4'hf: pos_low = 10'h2b9;
              default: pos_low = 10'h000;
            endcase
          end
          6'h2c: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h2ba;
              4'h1: pos_low = 10'h2bb;
              4'h2: pos_low = 10'h2bc;
              4'h3: pos_low = 10'h2bd;
              4'h4: pos_low = 10'h2be;
              4'h5: pos_low = 10'h2bf;
              4'h6: pos_low = 10'h2c0;
              4'h7: pos_low = 10'h2c1;
              4'h8: pos_low = 10'h2c2;
              4'h9: pos_low = 10'h2c3;
              4'ha: pos_low = 10'h2c4;
              4'hb: pos_low = 10'h2c4;
              4'hc: pos_low = 10'h2c5;
              4'hd: pos_low = 10'h2c6;
              4'he: pos_low = 10'h2c7;
              4'hf: pos_low = 10'h2c8;
              default: pos_low = 10'h000;
            endcase
          end
          6'h2d: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h2c9;
              4'h1: pos_low = 10'h2ca;
              4'h2: pos_low = 10'h2cb;
              4'h3: pos_low = 10'h2cc;
              4'h4: pos_low = 10'h2cd;
              4'h5: pos_low = 10'h2ce;
              4'h6: pos_low = 10'h2cf;
              4'h7: pos_low = 10'h2d0;
              4'h8: pos_low = 10'h2d1;
              4'h9: pos_low = 10'h2d2;
              4'ha: pos_low = 10'h2d3;
              4'hb: pos_low = 10'h2d4;
              4'hc: pos_low = 10'h2d5;
              4'hd: pos_low = 10'h2d6;
              4'he: pos_low = 10'h2d7;
              4'hf: pos_low = 10'h2d8;
              default: pos_low = 10'h000;
            endcase
          end
          6'h2e: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h2d9;
              4'h1: pos_low = 10'h2da;
              4'h2: pos_low = 10'h2db;
              4'h3: pos_low = 10'h2dc;
              4'h4: pos_low = 10'h2dd;
              4'h5: pos_low = 10'h2de;
              4'h6: pos_low = 10'h2df;
              4'h7: pos_low = 10'h2e0;
              4'h8: pos_low = 10'h2e1;
              4'h9: pos_low = 10'h2e2;
              4'ha: pos_low = 10'h2e3;
              4'hb: pos_low = 10'h2e4;
              4'hc: pos_low = 10'h2e5;
              4'hd: pos_low = 10'h2e6;
              4'he: pos_low = 10'h2e7;
              4'hf: pos_low = 10'h2e8;
              default: pos_low = 10'h000;
            endcase
          end
          6'h2f: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h2e9;
              4'h1: pos_low = 10'h2ea;
              4'h2: pos_low = 10'h2eb;
              4'h3: pos_low = 10'h2ec;
              4'h4: pos_low = 10'h2ed;
              4'h5: pos_low = 10'h2ee;
              4'h6: pos_low = 10'h2ef;
              4'h7: pos_low = 10'h2f0;
              4'h8: pos_low = 10'h2f1;
              4'h9: pos_low = 10'h2f2;
              4'ha: pos_low = 10'h2f3;
              4'hb: pos_low = 10'h2f4;
              4'hc: pos_low = 10'h2f5;
              4'hd: pos_low = 10'h2f6;
              4'he: pos_low = 10'h2f7;
              4'hf: pos_low = 10'h2f8;
              default: pos_low = 10'h000;
            endcase
          end
          6'h30: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h2f9;
              4'h1: pos_low = 10'h2fa;
              4'h2: pos_low = 10'h2fb;
              4'h3: pos_low = 10'h2fc;
              4'h4: pos_low = 10'h2fd;
              4'h5: pos_low = 10'h2fe;
              4'h6: pos_low = 10'h2ff;
              4'h7: pos_low = 10'h300;
              4'h8: pos_low = 10'h301;
              4'h9: pos_low = 10'h302;
              4'ha: pos_low = 10'h303;
              4'hb: pos_low = 10'h304;
              4'hc: pos_low = 10'h305;
              4'hd: pos_low = 10'h306;
              4'he: pos_low = 10'h307;
              4'hf: pos_low = 10'h308;
              default: pos_low = 10'h000;
            endcase
          end
          6'h31: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h309;
              4'h1: pos_low = 10'h30a;
              4'h2: pos_low = 10'h30b;
              4'h3: pos_low = 10'h30c;
              4'h4: pos_low = 10'h30d;
              4'h5: pos_low = 10'h30e;
              4'h6: pos_low = 10'h30f;
              4'h7: pos_low = 10'h310;
              4'h8: pos_low = 10'h311;
              4'h9: pos_low = 10'h312;
              4'ha: pos_low = 10'h313;
              4'hb: pos_low = 10'h314;
              4'hc: pos_low = 10'h315;
              4'hd: pos_low = 10'h316;
              4'he: pos_low = 10'h317;
              4'hf: pos_low = 10'h318;
              default: pos_low = 10'h000;
            endcase
          end
          6'h32: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h319;
              4'h1: pos_low = 10'h319;
              4'h2: pos_low = 10'h31a;
              4'h3: pos_low = 10'h31b;
              4'h4: pos_low = 10'h31c;
              4'h5: pos_low = 10'h31d;
              4'h6: pos_low = 10'h31e;
              4'h7: pos_low = 10'h31f;
              4'h8: pos_low = 10'h320;
              4'h9: pos_low = 10'h321;
              4'ha: pos_low = 10'h322;
              4'hb: pos_low = 10'h323;
              4'hc: pos_low = 10'h324;
              4'hd: pos_low = 10'h325;
              4'he: pos_low = 10'h326;
              4'hf: pos_low = 10'h327;
              default: pos_low = 10'h000;
            endcase
          end
          6'h33: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h328;
              4'h1: pos_low = 10'h329;
              4'h2: pos_low = 10'h32a;
              4'h3: pos_low = 10'h32b;
              4'h4: pos_low = 10'h32c;
              4'h5: pos_low = 10'h32d;
              4'h6: pos_low = 10'h32e;
              4'h7: pos_low = 10'h32f;
              4'h8: pos_low = 10'h330;
              4'h9: pos_low = 10'h331;
              4'ha: pos_low = 10'h332;
              4'hb: pos_low = 10'h333;
              4'hc: pos_low = 10'h334;
              4'hd: pos_low = 10'h335;
              4'he: pos_low = 10'h336;
              4'hf: pos_low = 10'h337;
              default: pos_low = 10'h000;
            endcase
          end
          6'h34: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h338;
              4'h1: pos_low = 10'h339;
              4'h2: pos_low = 10'h33a;
              4'h3: pos_low = 10'h33b;
              4'h4: pos_low = 10'h33c;
              4'h5: pos_low = 10'h33d;
              4'h6: pos_low = 10'h33e;
              4'h7: pos_low = 10'h33f;
              4'h8: pos_low = 10'h340;
              4'h9: pos_low = 10'h341;
              4'ha: pos_low = 10'h342;
              4'hb: pos_low = 10'h343;
              4'hc: pos_low = 10'h344;
              4'hd: pos_low = 10'h345;
              4'he: pos_low = 10'h346;
              4'hf: pos_low = 10'h347;
              default: pos_low = 10'h000;
            endcase
          end
          6'h35: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h348;
              4'h1: pos_low = 10'h349;
              4'h2: pos_low = 10'h34a;
              4'h3: pos_low = 10'h34b;
              4'h4: pos_low = 10'h34c;
              4'h5: pos_low = 10'h34d;
              4'h6: pos_low = 10'h34e;
              4'h7: pos_low = 10'h34f;
              4'h8: pos_low = 10'h350;
              4'h9: pos_low = 10'h351;
              4'ha: pos_low = 10'h352;
              4'hb: pos_low = 10'h353;
              4'hc: pos_low = 10'h354;
              4'hd: pos_low = 10'h355;
              4'he: pos_low = 10'h356;
              4'hf: pos_low = 10'h357;
              default: pos_low = 10'h000;
            endcase
          end
          6'h36: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h358;
              4'h1: pos_low = 10'h359;
              4'h2: pos_low = 10'h35a;
              4'h3: pos_low = 10'h35b;
              4'h4: pos_low = 10'h35c;
              4'h5: pos_low = 10'h35d;
              4'h6: pos_low = 10'h35e;
              4'h7: pos_low = 10'h35f;
              4'h8: pos_low = 10'h360;
              4'h9: pos_low = 10'h361;
              4'ha: pos_low = 10'h362;
              4'hb: pos_low = 10'h363;
              4'hc: pos_low = 10'h364;
              4'hd: pos_low = 10'h365;
              4'he: pos_low = 10'h366;
              4'hf: pos_low = 10'h366;
              default: pos_low = 10'h000;
            endcase
          end
          6'h37: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h367;
              4'h1: pos_low = 10'h368;
              4'h2: pos_low = 10'h369;
              4'h3: pos_low = 10'h36a;
              4'h4: pos_low = 10'h36b;
              4'h5: pos_low = 10'h36c;
              4'h6: pos_low = 10'h36d;
              4'h7: pos_low = 10'h36e;
              4'h8: pos_low = 10'h36f;
              4'h9: pos_low = 10'h370;
              4'ha: pos_low = 10'h371;
              4'hb: pos_low = 10'h372;
              4'hc: pos_low = 10'h373;
              4'hd: pos_low = 10'h374;
              4'he: pos_low = 10'h375;
              4'hf: pos_low = 10'h376;
              default: pos_low = 10'h000;
            endcase
          end
          6'h38: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h377;
              4'h1: pos_low = 10'h378;
              4'h2: pos_low = 10'h379;
              4'h3: pos_low = 10'h37a;
              4'h4: pos_low = 10'h37b;
              4'h5: pos_low = 10'h37c;
              4'h6: pos_low = 10'h37d;
              4'h7: pos_low = 10'h37e;
              4'h8: pos_low = 10'h37f;
              4'h9: pos_low = 10'h380;
              4'ha: pos_low = 10'h381;
              4'hb: pos_low = 10'h382;
              4'hc: pos_low = 10'h383;
              4'hd: pos_low = 10'h384;
              4'he: pos_low = 10'h385;
              4'hf: pos_low = 10'h386;
              default: pos_low = 10'h000;
            endcase
          end
          6'h39: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h387;
              4'h1: pos_low = 10'h388;
              4'h2: pos_low = 10'h389;
              4'h3: pos_low = 10'h38a;
              4'h4: pos_low = 10'h38b;
              4'h5: pos_low = 10'h38c;
              4'h6: pos_low = 10'h38d;
              4'h7: pos_low = 10'h38e;
              4'h8: pos_low = 10'h38f;
              4'h9: pos_low = 10'h390;
              4'ha: pos_low = 10'h391;
              4'hb: pos_low = 10'h392;
              4'hc: pos_low = 10'h393;
              4'hd: pos_low = 10'h394;
              4'he: pos_low = 10'h395;
              4'hf: pos_low = 10'h396;
              default: pos_low = 10'h000;
            endcase
          end
          6'h3a: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h397;
              4'h1: pos_low = 10'h398;
              4'h2: pos_low = 10'h399;
              4'h3: pos_low = 10'h39a;
              4'h4: pos_low = 10'h39b;
              4'h5: pos_low = 10'h39c;
              4'h6: pos_low = 10'h39d;
              4'h7: pos_low = 10'h39e;
              4'h8: pos_low = 10'h39f;
              4'h9: pos_low = 10'h3a0;
              4'ha: pos_low = 10'h3a1;
              4'hb: pos_low = 10'h3a2;
              4'hc: pos_low = 10'h3a3;
              4'hd: pos_low = 10'h3a4;
              4'he: pos_low = 10'h3a5;
              4'hf: pos_low = 10'h3a6;
              default: pos_low = 10'h000;
            endcase
          end
          6'h3b: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3a7;
              4'h1: pos_low = 10'h3a8;
              4'h2: pos_low = 10'h3a9;
              4'h3: pos_low = 10'h3aa;
              4'h4: pos_low = 10'h3ab;
              4'h5: pos_low = 10'h3ac;
              4'h6: pos_low = 10'h3ad;
              4'h7: pos_low = 10'h3ad;
              4'h8: pos_low = 10'h3ae;
              4'h9: pos_low = 10'h3af;
              4'ha: pos_low = 10'h3b0;
              4'hb: pos_low = 10'h3b1;
              4'hc: pos_low = 10'h3b2;
              4'hd: pos_low = 10'h3b3;
              4'he: pos_low = 10'h3b4;
              4'hf: pos_low = 10'h3b5;
              default: pos_low = 10'h000;
            endcase
          end
          6'h3c: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3b6;
              4'h1: pos_low = 10'h3b7;
              4'h2: pos_low = 10'h3b8;
              4'h3: pos_low = 10'h3b9;
              4'h4: pos_low = 10'h3ba;
              4'h5: pos_low = 10'h3bb;
              4'h6: pos_low = 10'h3bc;
              4'h7: pos_low = 10'h3bd;
              4'h8: pos_low = 10'h3be;
              4'h9: pos_low = 10'h3bf;
              4'ha: pos_low = 10'h3c0;
              4'hb: pos_low = 10'h3c1;
              4'hc: pos_low = 10'h3c2;
              4'hd: pos_low = 10'h3c3;
              4'he: pos_low = 10'h3c4;
              4'hf: pos_low = 10'h3c5;
              default: pos_low = 10'h000;
            endcase
          end
          6'h3d: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3c6;
              4'h1: pos_low = 10'h3c7;
              4'h2: pos_low = 10'h3c8;
              4'h3: pos_low = 10'h3c9;
              4'h4: pos_low = 10'h3ca;
              4'h5: pos_low = 10'h3cb;
              4'h6: pos_low = 10'h3cc;
              4'h7: pos_low = 10'h3cd;
              4'h8: pos_low = 10'h3ce;
              4'h9: pos_low = 10'h3cf;
              4'ha: pos_low = 10'h3d0;
              4'hb: pos_low = 10'h3d1;
              4'hc: pos_low = 10'h3d2;
              4'hd: pos_low = 10'h3d3;
              4'he: pos_low = 10'h3d4;
              4'hf: pos_low = 10'h3d5;
              default: pos_low = 10'h000;
            endcase
          end
          6'h3e: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3d6;
              4'h1: pos_low = 10'h3d7;
              4'h2: pos_low = 10'h3d8;
              4'h3: pos_low = 10'h3d9;
              4'h4: pos_low = 10'h3da;
              4'h5: pos_low = 10'h3db;
              4'h6: pos_low = 10'h3dc;
              4'h7: pos_low = 10'h3dd;
              4'h8: pos_low = 10'h3de;
              4'h9: pos_low = 10'h3df;
              4'ha: pos_low = 10'h3e0;
              4'hb: pos_low = 10'h3e1;
              4'hc: pos_low = 10'h3e2;
              4'hd: pos_low = 10'h3e3;
              4'he: pos_low = 10'h3e4;
              4'hf: pos_low = 10'h3e5;
              default: pos_low = 10'h000;
            endcase
          end
          6'h3f: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3e6;
              4'h1: pos_low = 10'h3e7;
              4'h2: pos_low = 10'h3e8;
              4'h3: pos_low = 10'h3e9;
              4'h4: pos_low = 10'h3ea;
              4'h5: pos_low = 10'h3eb;
              4'h6: pos_low = 10'h3ec;
              4'h7: pos_low = 10'h3ed;
              4'h8: pos_low = 10'h3ee;
              4'h9: pos_low = 10'h3ef;
              4'ha: pos_low = 10'h3ef;
              4'hb: pos_low = 10'h3f0;
              4'hc: pos_low = 10'h3f1;
              4'hd: pos_low = 10'h3f2;
              4'he: pos_low = 10'h3f3;
              4'hf: pos_low = 10'h3f4;
              default: pos_low = 10'h000;
            endcase
          end
          default: begin end
        endcase
      end
      5'h0c: begin
        case (mant[9:4])
          6'h00: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3f5;
              4'h1: pos_low = 10'h3f7;
              4'h2: pos_low = 10'h3f9;
              4'h3: pos_low = 10'h3fb;
              4'h4: pos_low = 10'h3fd;
              4'h5: pos_low = 10'h3ff;
              4'h6: pos_low = 10'h001;
              4'h7: pos_low = 10'h002;
              4'h8: pos_low = 10'h003;
              4'h9: pos_low = 10'h004;
              4'ha: pos_low = 10'h005;
              4'hb: pos_low = 10'h006;
              4'hc: pos_low = 10'h007;
              4'hd: pos_low = 10'h007;
              4'he: pos_low = 10'h008;
              4'hf: pos_low = 10'h009;
              default: pos_low = 10'h000;
            endcase
          end
          6'h01: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h00a;
              4'h1: pos_low = 10'h00b;
              4'h2: pos_low = 10'h00c;
              4'h3: pos_low = 10'h00d;
              4'h4: pos_low = 10'h00e;
              4'h5: pos_low = 10'h00f;
              4'h6: pos_low = 10'h010;
              4'h7: pos_low = 10'h011;
              4'h8: pos_low = 10'h012;
              4'h9: pos_low = 10'h013;
              4'ha: pos_low = 10'h014;
              4'hb: pos_low = 10'h015;
              4'hc: pos_low = 10'h016;
              4'hd: pos_low = 10'h017;
              4'he: pos_low = 10'h018;
              4'hf: pos_low = 10'h019;
              default: pos_low = 10'h000;
            endcase
          end
          6'h02: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h01a;
              4'h1: pos_low = 10'h01b;
              4'h2: pos_low = 10'h01c;
              4'h3: pos_low = 10'h01d;
              4'h4: pos_low = 10'h01e;
              4'h5: pos_low = 10'h01f;
              4'h6: pos_low = 10'h020;
              4'h7: pos_low = 10'h021;
              4'h8: pos_low = 10'h022;
              4'h9: pos_low = 10'h023;
              4'ha: pos_low = 10'h024;
              4'hb: pos_low = 10'h025;
              4'hc: pos_low = 10'h026;
              4'hd: pos_low = 10'h027;
              4'he: pos_low = 10'h028;
              4'hf: pos_low = 10'h029;
              default: pos_low = 10'h000;
            endcase
          end
          6'h03: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h02a;
              4'h1: pos_low = 10'h02b;
              4'h2: pos_low = 10'h02c;
              4'h3: pos_low = 10'h02d;
              4'h4: pos_low = 10'h02e;
              4'h5: pos_low = 10'h02f;
              4'h6: pos_low = 10'h030;
              4'h7: pos_low = 10'h031;
              4'h8: pos_low = 10'h032;
              4'h9: pos_low = 10'h033;
              4'ha: pos_low = 10'h034;
              4'hb: pos_low = 10'h035;
              4'hc: pos_low = 10'h036;
              4'hd: pos_low = 10'h037;
              4'he: pos_low = 10'h038;
              4'hf: pos_low = 10'h039;
              default: pos_low = 10'h000;
            endcase
          end
          6'h04: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h03a;
              4'h1: pos_low = 10'h03b;
              4'h2: pos_low = 10'h03c;
              4'h3: pos_low = 10'h03d;
              4'h4: pos_low = 10'h03e;
              4'h5: pos_low = 10'h03f;
              4'h6: pos_low = 10'h040;
              4'h7: pos_low = 10'h041;
              4'h8: pos_low = 10'h042;
              4'h9: pos_low = 10'h042;
              4'ha: pos_low = 10'h043;
              4'hb: pos_low = 10'h044;
              4'hc: pos_low = 10'h045;
              4'hd: pos_low = 10'h046;
              4'he: pos_low = 10'h047;
              4'hf: pos_low = 10'h048;
              default: pos_low = 10'h000;
            endcase
          end
          6'h05: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h049;
              4'h1: pos_low = 10'h04a;
              4'h2: pos_low = 10'h04b;
              4'h3: pos_low = 10'h04c;
              4'h4: pos_low = 10'h04d;
              4'h5: pos_low = 10'h04e;
              4'h6: pos_low = 10'h04f;
              4'h7: pos_low = 10'h050;
              4'h8: pos_low = 10'h051;
              4'h9: pos_low = 10'h052;
              4'ha: pos_low = 10'h053;
              4'hb: pos_low = 10'h054;
              4'hc: pos_low = 10'h055;
              4'hd: pos_low = 10'h056;
              4'he: pos_low = 10'h057;
              4'hf: pos_low = 10'h058;
              default: pos_low = 10'h000;
            endcase
          end
          6'h06: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h059;
              4'h1: pos_low = 10'h05a;
              4'h2: pos_low = 10'h05b;
              4'h3: pos_low = 10'h05c;
              4'h4: pos_low = 10'h05d;
              4'h5: pos_low = 10'h05e;
              4'h6: pos_low = 10'h05f;
              4'h7: pos_low = 10'h060;
              4'h8: pos_low = 10'h061;
              4'h9: pos_low = 10'h062;
              4'ha: pos_low = 10'h063;
              4'hb: pos_low = 10'h064;
              4'hc: pos_low = 10'h065;
              4'hd: pos_low = 10'h066;
              4'he: pos_low = 10'h067;
              4'hf: pos_low = 10'h068;
              default: pos_low = 10'h000;
            endcase
          end
          6'h07: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h069;
              4'h1: pos_low = 10'h06a;
              4'h2: pos_low = 10'h06b;
              4'h3: pos_low = 10'h06c;
              4'h4: pos_low = 10'h06d;
              4'h5: pos_low = 10'h06e;
              4'h6: pos_low = 10'h06f;
              4'h7: pos_low = 10'h070;
              4'h8: pos_low = 10'h071;
              4'h9: pos_low = 10'h072;
              4'ha: pos_low = 10'h073;
              4'hb: pos_low = 10'h074;
              4'hc: pos_low = 10'h075;
              4'hd: pos_low = 10'h076;
              4'he: pos_low = 10'h077;
              4'hf: pos_low = 10'h077;
              default: pos_low = 10'h000;
            endcase
          end
          6'h08: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h078;
              4'h1: pos_low = 10'h079;
              4'h2: pos_low = 10'h07a;
              4'h3: pos_low = 10'h07b;
              4'h4: pos_low = 10'h07c;
              4'h5: pos_low = 10'h07d;
              4'h6: pos_low = 10'h07e;
              4'h7: pos_low = 10'h07f;
              4'h8: pos_low = 10'h080;
              4'h9: pos_low = 10'h081;
              4'ha: pos_low = 10'h082;
              4'hb: pos_low = 10'h083;
              4'hc: pos_low = 10'h084;
              4'hd: pos_low = 10'h085;
              4'he: pos_low = 10'h086;
              4'hf: pos_low = 10'h087;
              default: pos_low = 10'h000;
            endcase
          end
          6'h09: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h088;
              4'h1: pos_low = 10'h089;
              4'h2: pos_low = 10'h08a;
              4'h3: pos_low = 10'h08b;
              4'h4: pos_low = 10'h08c;
              4'h5: pos_low = 10'h08d;
              4'h6: pos_low = 10'h08e;
              4'h7: pos_low = 10'h08f;
              4'h8: pos_low = 10'h090;
              4'h9: pos_low = 10'h091;
              4'ha: pos_low = 10'h092;
              4'hb: pos_low = 10'h093;
              4'hc: pos_low = 10'h094;
              4'hd: pos_low = 10'h095;
              4'he: pos_low = 10'h096;
              4'hf: pos_low = 10'h097;
              default: pos_low = 10'h000;
            endcase
          end
          6'h0a: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h098;
              4'h1: pos_low = 10'h099;
              4'h2: pos_low = 10'h09a;
              4'h3: pos_low = 10'h09b;
              4'h4: pos_low = 10'h09c;
              4'h5: pos_low = 10'h09d;
              4'h6: pos_low = 10'h09e;
              4'h7: pos_low = 10'h09f;
              4'h8: pos_low = 10'h0a0;
              4'h9: pos_low = 10'h0a1;
              4'ha: pos_low = 10'h0a2;
              4'hb: pos_low = 10'h0a3;
              4'hc: pos_low = 10'h0a4;
              4'hd: pos_low = 10'h0a5;
              4'he: pos_low = 10'h0a6;
              4'hf: pos_low = 10'h0a7;
              default: pos_low = 10'h000;
            endcase
          end
          6'h0b: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h0a7;
              4'h1: pos_low = 10'h0a8;
              4'h2: pos_low = 10'h0a9;
              4'h3: pos_low = 10'h0aa;
              4'h4: pos_low = 10'h0ab;
              4'h5: pos_low = 10'h0ac;
              4'h6: pos_low = 10'h0ad;
              4'h7: pos_low = 10'h0ae;
              4'h8: pos_low = 10'h0af;
              4'h9: pos_low = 10'h0b0;
              4'ha: pos_low = 10'h0b1;
              4'hb: pos_low = 10'h0b2;
              4'hc: pos_low = 10'h0b3;
              4'hd: pos_low = 10'h0b4;
              4'he: pos_low = 10'h0b5;
              4'hf: pos_low = 10'h0b6;
              default: pos_low = 10'h000;
            endcase
          end
          6'h0c: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h0b7;
              4'h1: pos_low = 10'h0b8;
              4'h2: pos_low = 10'h0b9;
              4'h3: pos_low = 10'h0ba;
              4'h4: pos_low = 10'h0bb;
              4'h5: pos_low = 10'h0bc;
              4'h6: pos_low = 10'h0bd;
              4'h7: pos_low = 10'h0be;
              4'h8: pos_low = 10'h0bf;
              4'h9: pos_low = 10'h0c0;
              4'ha: pos_low = 10'h0c1;
              4'hb: pos_low = 10'h0c2;
              4'hc: pos_low = 10'h0c3;
              4'hd: pos_low = 10'h0c4;
              4'he: pos_low = 10'h0c5;
              4'hf: pos_low = 10'h0c6;
              default: pos_low = 10'h000;
            endcase
          end
          6'h0d: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h0c7;
              4'h1: pos_low = 10'h0c8;
              4'h2: pos_low = 10'h0c9;
              4'h3: pos_low = 10'h0ca;
              4'h4: pos_low = 10'h0cb;
              4'h5: pos_low = 10'h0cc;
              4'h6: pos_low = 10'h0cd;
              4'h7: pos_low = 10'h0ce;
              4'h8: pos_low = 10'h0cf;
              4'h9: pos_low = 10'h0d0;
              4'ha: pos_low = 10'h0d1;
              4'hb: pos_low = 10'h0d2;
              4'hc: pos_low = 10'h0d3;
              4'hd: pos_low = 10'h0d4;
              4'he: pos_low = 10'h0d4;
              4'hf: pos_low = 10'h0d5;
              default: pos_low = 10'h000;
            endcase
          end
          6'h0e: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h0d6;
              4'h1: pos_low = 10'h0d7;
              4'h2: pos_low = 10'h0d8;
              4'h3: pos_low = 10'h0d9;
              4'h4: pos_low = 10'h0da;
              4'h5: pos_low = 10'h0db;
              4'h6: pos_low = 10'h0dc;
              4'h7: pos_low = 10'h0dd;
              4'h8: pos_low = 10'h0de;
              4'h9: pos_low = 10'h0df;
              4'ha: pos_low = 10'h0e0;
              4'hb: pos_low = 10'h0e1;
              4'hc: pos_low = 10'h0e2;
              4'hd: pos_low = 10'h0e3;
              4'he: pos_low = 10'h0e4;
              4'hf: pos_low = 10'h0e5;
              default: pos_low = 10'h000;
            endcase
          end
          6'h0f: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h0e6;
              4'h1: pos_low = 10'h0e7;
              4'h2: pos_low = 10'h0e8;
              4'h3: pos_low = 10'h0e9;
              4'h4: pos_low = 10'h0ea;
              4'h5: pos_low = 10'h0eb;
              4'h6: pos_low = 10'h0ec;
              4'h7: pos_low = 10'h0ed;
              4'h8: pos_low = 10'h0ee;
              4'h9: pos_low = 10'h0ef;
              4'ha: pos_low = 10'h0f0;
              4'hb: pos_low = 10'h0f1;
              4'hc: pos_low = 10'h0f2;
              4'hd: pos_low = 10'h0f3;
              4'he: pos_low = 10'h0f4;
              4'hf: pos_low = 10'h0f5;
              default: pos_low = 10'h000;
            endcase
          end
          6'h10: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h0f6;
              4'h1: pos_low = 10'h0f7;
              4'h2: pos_low = 10'h0f8;
              4'h3: pos_low = 10'h0f9;
              4'h4: pos_low = 10'h0fa;
              4'h5: pos_low = 10'h0fb;
              4'h6: pos_low = 10'h0fc;
              4'h7: pos_low = 10'h0fd;
              4'h8: pos_low = 10'h0fd;
              4'h9: pos_low = 10'h0fe;
              4'ha: pos_low = 10'h0ff;
              4'hb: pos_low = 10'h100;
              4'hc: pos_low = 10'h101;
              4'hd: pos_low = 10'h102;
              4'he: pos_low = 10'h103;
              4'hf: pos_low = 10'h104;
              default: pos_low = 10'h000;
            endcase
          end
          6'h11: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h105;
              4'h1: pos_low = 10'h106;
              4'h2: pos_low = 10'h107;
              4'h3: pos_low = 10'h108;
              4'h4: pos_low = 10'h109;
              4'h5: pos_low = 10'h10a;
              4'h6: pos_low = 10'h10b;
              4'h7: pos_low = 10'h10c;
              4'h8: pos_low = 10'h10d;
              4'h9: pos_low = 10'h10e;
              4'ha: pos_low = 10'h10f;
              4'hb: pos_low = 10'h110;
              4'hc: pos_low = 10'h111;
              4'hd: pos_low = 10'h112;
              4'he: pos_low = 10'h113;
              4'hf: pos_low = 10'h114;
              default: pos_low = 10'h000;
            endcase
          end
          6'h12: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h115;
              4'h1: pos_low = 10'h116;
              4'h2: pos_low = 10'h117;
              4'h3: pos_low = 10'h118;
              4'h4: pos_low = 10'h119;
              4'h5: pos_low = 10'h11a;
              4'h6: pos_low = 10'h11b;
              4'h7: pos_low = 10'h11c;
              4'h8: pos_low = 10'h11d;
              4'h9: pos_low = 10'h11e;
              4'ha: pos_low = 10'h11f;
              4'hb: pos_low = 10'h120;
              4'hc: pos_low = 10'h121;
              4'hd: pos_low = 10'h122;
              4'he: pos_low = 10'h123;
              4'hf: pos_low = 10'h124;
              default: pos_low = 10'h000;
            endcase
          end
          6'h13: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h124;
              4'h1: pos_low = 10'h125;
              4'h2: pos_low = 10'h126;
              4'h3: pos_low = 10'h127;
              4'h4: pos_low = 10'h128;
              4'h5: pos_low = 10'h129;
              4'h6: pos_low = 10'h12a;
              4'h7: pos_low = 10'h12b;
              4'h8: pos_low = 10'h12c;
              4'h9: pos_low = 10'h12d;
              4'ha: pos_low = 10'h12e;
              4'hb: pos_low = 10'h12f;
              4'hc: pos_low = 10'h130;
              4'hd: pos_low = 10'h131;
              4'he: pos_low = 10'h132;
              4'hf: pos_low = 10'h133;
              default: pos_low = 10'h000;
            endcase
          end
          6'h14: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h134;
              4'h1: pos_low = 10'h135;
              4'h2: pos_low = 10'h136;
              4'h3: pos_low = 10'h137;
              4'h4: pos_low = 10'h138;
              4'h5: pos_low = 10'h139;
              4'h6: pos_low = 10'h13a;
              4'h7: pos_low = 10'h13b;
              4'h8: pos_low = 10'h13c;
              4'h9: pos_low = 10'h13d;
              4'ha: pos_low = 10'h13e;
              4'hb: pos_low = 10'h13f;
              4'hc: pos_low = 10'h140;
              4'hd: pos_low = 10'h141;
              4'he: pos_low = 10'h142;
              4'hf: pos_low = 10'h143;
              default: pos_low = 10'h000;
            endcase
          end
          6'h15: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h144;
              4'h1: pos_low = 10'h145;
              4'h2: pos_low = 10'h146;
              4'h3: pos_low = 10'h147;
              4'h4: pos_low = 10'h148;
              4'h5: pos_low = 10'h149;
              4'h6: pos_low = 10'h149;
              4'h7: pos_low = 10'h14a;
              4'h8: pos_low = 10'h14b;
              4'h9: pos_low = 10'h14c;
              4'ha: pos_low = 10'h14d;
              4'hb: pos_low = 10'h14e;
              4'hc: pos_low = 10'h14f;
              4'hd: pos_low = 10'h150;
              4'he: pos_low = 10'h151;
              4'hf: pos_low = 10'h152;
              default: pos_low = 10'h000;
            endcase
          end
          6'h16: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h153;
              4'h1: pos_low = 10'h154;
              4'h2: pos_low = 10'h155;
              4'h3: pos_low = 10'h156;
              4'h4: pos_low = 10'h157;
              4'h5: pos_low = 10'h158;
              4'h6: pos_low = 10'h159;
              4'h7: pos_low = 10'h15a;
              4'h8: pos_low = 10'h15b;
              4'h9: pos_low = 10'h15c;
              4'ha: pos_low = 10'h15d;
              4'hb: pos_low = 10'h15e;
              4'hc: pos_low = 10'h15f;
              4'hd: pos_low = 10'h160;
              4'he: pos_low = 10'h161;
              4'hf: pos_low = 10'h162;
              default: pos_low = 10'h000;
            endcase
          end
          6'h17: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h163;
              4'h1: pos_low = 10'h164;
              4'h2: pos_low = 10'h165;
              4'h3: pos_low = 10'h166;
              4'h4: pos_low = 10'h167;
              4'h5: pos_low = 10'h168;
              4'h6: pos_low = 10'h169;
              4'h7: pos_low = 10'h16a;
              4'h8: pos_low = 10'h16b;
              4'h9: pos_low = 10'h16b;
              4'ha: pos_low = 10'h16c;
              4'hb: pos_low = 10'h16d;
              4'hc: pos_low = 10'h16e;
              4'hd: pos_low = 10'h16f;
              4'he: pos_low = 10'h170;
              4'hf: pos_low = 10'h171;
              default: pos_low = 10'h000;
            endcase
          end
          6'h18: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h172;
              4'h1: pos_low = 10'h173;
              4'h2: pos_low = 10'h174;
              4'h3: pos_low = 10'h175;
              4'h4: pos_low = 10'h176;
              4'h5: pos_low = 10'h177;
              4'h6: pos_low = 10'h178;
              4'h7: pos_low = 10'h179;
              4'h8: pos_low = 10'h17a;
              4'h9: pos_low = 10'h17b;
              4'ha: pos_low = 10'h17c;
              4'hb: pos_low = 10'h17d;
              4'hc: pos_low = 10'h17e;
              4'hd: pos_low = 10'h17f;
              4'he: pos_low = 10'h180;
              4'hf: pos_low = 10'h181;
              default: pos_low = 10'h000;
            endcase
          end
          6'h19: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h182;
              4'h1: pos_low = 10'h183;
              4'h2: pos_low = 10'h184;
              4'h3: pos_low = 10'h185;
              4'h4: pos_low = 10'h186;
              4'h5: pos_low = 10'h187;
              4'h6: pos_low = 10'h188;
              4'h7: pos_low = 10'h189;
              4'h8: pos_low = 10'h18a;
              4'h9: pos_low = 10'h18b;
              4'ha: pos_low = 10'h18c;
              4'hb: pos_low = 10'h18d;
              4'hc: pos_low = 10'h18d;
              4'hd: pos_low = 10'h18e;
              4'he: pos_low = 10'h18f;
              4'hf: pos_low = 10'h190;
              default: pos_low = 10'h000;
            endcase
          end
          6'h1a: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h191;
              4'h1: pos_low = 10'h192;
              4'h2: pos_low = 10'h193;
              4'h3: pos_low = 10'h194;
              4'h4: pos_low = 10'h195;
              4'h5: pos_low = 10'h196;
              4'h6: pos_low = 10'h197;
              4'h7: pos_low = 10'h198;
              4'h8: pos_low = 10'h199;
              4'h9: pos_low = 10'h19a;
              4'ha: pos_low = 10'h19b;
              4'hb: pos_low = 10'h19c;
              4'hc: pos_low = 10'h19d;
              4'hd: pos_low = 10'h19e;
              4'he: pos_low = 10'h19f;
              4'hf: pos_low = 10'h1a0;
              default: pos_low = 10'h000;
            endcase
          end
          6'h1b: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h1a1;
              4'h1: pos_low = 10'h1a2;
              4'h2: pos_low = 10'h1a3;
              4'h3: pos_low = 10'h1a4;
              4'h4: pos_low = 10'h1a5;
              4'h5: pos_low = 10'h1a6;
              4'h6: pos_low = 10'h1a7;
              4'h7: pos_low = 10'h1a8;
              4'h8: pos_low = 10'h1a9;
              4'h9: pos_low = 10'h1aa;
              4'ha: pos_low = 10'h1ab;
              4'hb: pos_low = 10'h1ac;
              4'hc: pos_low = 10'h1ac;
              4'hd: pos_low = 10'h1ad;
              4'he: pos_low = 10'h1ae;
              4'hf: pos_low = 10'h1af;
              default: pos_low = 10'h000;
            endcase
          end
          6'h1c: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h1b0;
              4'h1: pos_low = 10'h1b1;
              4'h2: pos_low = 10'h1b2;
              4'h3: pos_low = 10'h1b3;
              4'h4: pos_low = 10'h1b4;
              4'h5: pos_low = 10'h1b5;
              4'h6: pos_low = 10'h1b6;
              4'h7: pos_low = 10'h1b7;
              4'h8: pos_low = 10'h1b8;
              4'h9: pos_low = 10'h1b9;
              4'ha: pos_low = 10'h1ba;
              4'hb: pos_low = 10'h1bb;
              4'hc: pos_low = 10'h1bc;
              4'hd: pos_low = 10'h1bd;
              4'he: pos_low = 10'h1be;
              4'hf: pos_low = 10'h1bf;
              default: pos_low = 10'h000;
            endcase
          end
          6'h1d: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h1c0;
              4'h1: pos_low = 10'h1c1;
              4'h2: pos_low = 10'h1c2;
              4'h3: pos_low = 10'h1c3;
              4'h4: pos_low = 10'h1c4;
              4'h5: pos_low = 10'h1c5;
              4'h6: pos_low = 10'h1c6;
              4'h7: pos_low = 10'h1c7;
              4'h8: pos_low = 10'h1c8;
              4'h9: pos_low = 10'h1c9;
              4'ha: pos_low = 10'h1ca;
              4'hb: pos_low = 10'h1ca;
              4'hc: pos_low = 10'h1cb;
              4'hd: pos_low = 10'h1cc;
              4'he: pos_low = 10'h1cd;
              4'hf: pos_low = 10'h1ce;
              default: pos_low = 10'h000;
            endcase
          end
          6'h1e: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h1cf;
              4'h1: pos_low = 10'h1d0;
              4'h2: pos_low = 10'h1d1;
              4'h3: pos_low = 10'h1d2;
              4'h4: pos_low = 10'h1d3;
              4'h5: pos_low = 10'h1d4;
              4'h6: pos_low = 10'h1d5;
              4'h7: pos_low = 10'h1d6;
              4'h8: pos_low = 10'h1d7;
              4'h9: pos_low = 10'h1d8;
              4'ha: pos_low = 10'h1d9;
              4'hb: pos_low = 10'h1da;
              4'hc: pos_low = 10'h1db;
              4'hd: pos_low = 10'h1dc;
              4'he: pos_low = 10'h1dd;
              4'hf: pos_low = 10'h1de;
              default: pos_low = 10'h000;
            endcase
          end
          6'h1f: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h1df;
              4'h1: pos_low = 10'h1e0;
              4'h2: pos_low = 10'h1e1;
              4'h3: pos_low = 10'h1e2;
              4'h4: pos_low = 10'h1e3;
              4'h5: pos_low = 10'h1e4;
              4'h6: pos_low = 10'h1e5;
              4'h7: pos_low = 10'h1e6;
              4'h8: pos_low = 10'h1e7;
              4'h9: pos_low = 10'h1e7;
              4'ha: pos_low = 10'h1e8;
              4'hb: pos_low = 10'h1e9;
              4'hc: pos_low = 10'h1ea;
              4'hd: pos_low = 10'h1eb;
              4'he: pos_low = 10'h1ec;
              4'hf: pos_low = 10'h1ed;
              default: pos_low = 10'h000;
            endcase
          end
          6'h20: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h1ee;
              4'h1: pos_low = 10'h1ef;
              4'h2: pos_low = 10'h1f0;
              4'h3: pos_low = 10'h1f1;
              4'h4: pos_low = 10'h1f2;
              4'h5: pos_low = 10'h1f3;
              4'h6: pos_low = 10'h1f4;
              4'h7: pos_low = 10'h1f5;
              4'h8: pos_low = 10'h1f6;
              4'h9: pos_low = 10'h1f7;
              4'ha: pos_low = 10'h1f8;
              4'hb: pos_low = 10'h1f9;
              4'hc: pos_low = 10'h1fa;
              4'hd: pos_low = 10'h1fb;
              4'he: pos_low = 10'h1fc;
              4'hf: pos_low = 10'h1fd;
              default: pos_low = 10'h000;
            endcase
          end
          6'h21: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h1fe;
              4'h1: pos_low = 10'h1ff;
              4'h2: pos_low = 10'h200;
              4'h3: pos_low = 10'h201;
              4'h4: pos_low = 10'h202;
              4'h5: pos_low = 10'h203;
              4'h6: pos_low = 10'h203;
              4'h7: pos_low = 10'h204;
              4'h8: pos_low = 10'h205;
              4'h9: pos_low = 10'h206;
              4'ha: pos_low = 10'h207;
              4'hb: pos_low = 10'h208;
              4'hc: pos_low = 10'h209;
              4'hd: pos_low = 10'h20a;
              4'he: pos_low = 10'h20b;
              4'hf: pos_low = 10'h20c;
              default: pos_low = 10'h000;
            endcase
          end
          6'h22: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h20d;
              4'h1: pos_low = 10'h20e;
              4'h2: pos_low = 10'h20f;
              4'h3: pos_low = 10'h210;
              4'h4: pos_low = 10'h211;
              4'h5: pos_low = 10'h212;
              4'h6: pos_low = 10'h213;
              4'h7: pos_low = 10'h214;
              4'h8: pos_low = 10'h215;
              4'h9: pos_low = 10'h216;
              4'ha: pos_low = 10'h217;
              4'hb: pos_low = 10'h218;
              4'hc: pos_low = 10'h219;
              4'hd: pos_low = 10'h21a;
              4'he: pos_low = 10'h21b;
              4'hf: pos_low = 10'h21c;
              default: pos_low = 10'h000;
            endcase
          end
          6'h23: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h21d;
              4'h1: pos_low = 10'h21e;
              4'h2: pos_low = 10'h21e;
              4'h3: pos_low = 10'h21f;
              4'h4: pos_low = 10'h220;
              4'h5: pos_low = 10'h221;
              4'h6: pos_low = 10'h222;
              4'h7: pos_low = 10'h223;
              4'h8: pos_low = 10'h224;
              4'h9: pos_low = 10'h225;
              4'ha: pos_low = 10'h226;
              4'hb: pos_low = 10'h227;
              4'hc: pos_low = 10'h228;
              4'hd: pos_low = 10'h229;
              4'he: pos_low = 10'h22a;
              4'hf: pos_low = 10'h22b;
              default: pos_low = 10'h000;
            endcase
          end
          6'h24: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h22c;
              4'h1: pos_low = 10'h22d;
              4'h2: pos_low = 10'h22e;
              4'h3: pos_low = 10'h22f;
              4'h4: pos_low = 10'h230;
              4'h5: pos_low = 10'h231;
              4'h6: pos_low = 10'h232;
              4'h7: pos_low = 10'h233;
              4'h8: pos_low = 10'h234;
              4'h9: pos_low = 10'h235;
              4'ha: pos_low = 10'h236;
              4'hb: pos_low = 10'h237;
              4'hc: pos_low = 10'h238;
              4'hd: pos_low = 10'h238;
              4'he: pos_low = 10'h239;
              4'hf: pos_low = 10'h23a;
              default: pos_low = 10'h000;
            endcase
          end
          6'h25: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h23b;
              4'h1: pos_low = 10'h23c;
              4'h2: pos_low = 10'h23d;
              4'h3: pos_low = 10'h23e;
              4'h4: pos_low = 10'h23f;
              4'h5: pos_low = 10'h240;
              4'h6: pos_low = 10'h241;
              4'h7: pos_low = 10'h242;
              4'h8: pos_low = 10'h243;
              4'h9: pos_low = 10'h244;
              4'ha: pos_low = 10'h245;
              4'hb: pos_low = 10'h246;
              4'hc: pos_low = 10'h247;
              4'hd: pos_low = 10'h248;
              4'he: pos_low = 10'h249;
              4'hf: pos_low = 10'h24a;
              default: pos_low = 10'h000;
            endcase
          end
          6'h26: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h24b;
              4'h1: pos_low = 10'h24c;
              4'h2: pos_low = 10'h24d;
              4'h3: pos_low = 10'h24e;
              4'h4: pos_low = 10'h24f;
              4'h5: pos_low = 10'h250;
              4'h6: pos_low = 10'h251;
              4'h7: pos_low = 10'h251;
              4'h8: pos_low = 10'h252;
              4'h9: pos_low = 10'h253;
              4'ha: pos_low = 10'h254;
              4'hb: pos_low = 10'h255;
              4'hc: pos_low = 10'h256;
              4'hd: pos_low = 10'h257;
              4'he: pos_low = 10'h258;
              4'hf: pos_low = 10'h259;
              default: pos_low = 10'h000;
            endcase
          end
          6'h27: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h25a;
              4'h1: pos_low = 10'h25b;
              4'h2: pos_low = 10'h25c;
              4'h3: pos_low = 10'h25d;
              4'h4: pos_low = 10'h25e;
              4'h5: pos_low = 10'h25f;
              4'h6: pos_low = 10'h260;
              4'h7: pos_low = 10'h261;
              4'h8: pos_low = 10'h262;
              4'h9: pos_low = 10'h263;
              4'ha: pos_low = 10'h264;
              4'hb: pos_low = 10'h265;
              4'hc: pos_low = 10'h266;
              4'hd: pos_low = 10'h267;
              4'he: pos_low = 10'h268;
              4'hf: pos_low = 10'h269;
              default: pos_low = 10'h000;
            endcase
          end
          6'h28: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h269;
              4'h1: pos_low = 10'h26a;
              4'h2: pos_low = 10'h26b;
              4'h3: pos_low = 10'h26c;
              4'h4: pos_low = 10'h26d;
              4'h5: pos_low = 10'h26e;
              4'h6: pos_low = 10'h26f;
              4'h7: pos_low = 10'h270;
              4'h8: pos_low = 10'h271;
              4'h9: pos_low = 10'h272;
              4'ha: pos_low = 10'h273;
              4'hb: pos_low = 10'h274;
              4'hc: pos_low = 10'h275;
              4'hd: pos_low = 10'h276;
              4'he: pos_low = 10'h277;
              4'hf: pos_low = 10'h278;
              default: pos_low = 10'h000;
            endcase
          end
          6'h29: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h279;
              4'h1: pos_low = 10'h27a;
              4'h2: pos_low = 10'h27b;
              4'h3: pos_low = 10'h27c;
              4'h4: pos_low = 10'h27d;
              4'h5: pos_low = 10'h27e;
              4'h6: pos_low = 10'h27f;
              4'h7: pos_low = 10'h280;
              4'h8: pos_low = 10'h281;
              4'h9: pos_low = 10'h281;
              4'ha: pos_low = 10'h282;
              4'hb: pos_low = 10'h283;
              4'hc: pos_low = 10'h284;
              4'hd: pos_low = 10'h285;
              4'he: pos_low = 10'h286;
              4'hf: pos_low = 10'h287;
              default: pos_low = 10'h000;
            endcase
          end
          6'h2a: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h288;
              4'h1: pos_low = 10'h289;
              4'h2: pos_low = 10'h28a;
              4'h3: pos_low = 10'h28b;
              4'h4: pos_low = 10'h28c;
              4'h5: pos_low = 10'h28d;
              4'h6: pos_low = 10'h28e;
              4'h7: pos_low = 10'h28f;
              4'h8: pos_low = 10'h290;
              4'h9: pos_low = 10'h291;
              4'ha: pos_low = 10'h292;
              4'hb: pos_low = 10'h293;
              4'hc: pos_low = 10'h294;
              4'hd: pos_low = 10'h295;
              4'he: pos_low = 10'h296;
              4'hf: pos_low = 10'h297;
              default: pos_low = 10'h000;
            endcase
          end
          6'h2b: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h298;
              4'h1: pos_low = 10'h298;
              4'h2: pos_low = 10'h299;
              4'h3: pos_low = 10'h29a;
              4'h4: pos_low = 10'h29b;
              4'h5: pos_low = 10'h29c;
              4'h6: pos_low = 10'h29d;
              4'h7: pos_low = 10'h29e;
              4'h8: pos_low = 10'h29f;
              4'h9: pos_low = 10'h2a0;
              4'ha: pos_low = 10'h2a1;
              4'hb: pos_low = 10'h2a2;
              4'hc: pos_low = 10'h2a3;
              4'hd: pos_low = 10'h2a4;
              4'he: pos_low = 10'h2a5;
              4'hf: pos_low = 10'h2a6;
              default: pos_low = 10'h000;
            endcase
          end
          6'h2c: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h2a7;
              4'h1: pos_low = 10'h2a8;
              4'h2: pos_low = 10'h2a9;
              4'h3: pos_low = 10'h2aa;
              4'h4: pos_low = 10'h2ab;
              4'h5: pos_low = 10'h2ac;
              4'h6: pos_low = 10'h2ad;
              4'h7: pos_low = 10'h2ae;
              4'h8: pos_low = 10'h2ae;
              4'h9: pos_low = 10'h2af;
              4'ha: pos_low = 10'h2b0;
              4'hb: pos_low = 10'h2b1;
              4'hc: pos_low = 10'h2b2;
              4'hd: pos_low = 10'h2b3;
              4'he: pos_low = 10'h2b4;
              4'hf: pos_low = 10'h2b5;
              default: pos_low = 10'h000;
            endcase
          end
          6'h2d: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h2b6;
              4'h1: pos_low = 10'h2b7;
              4'h2: pos_low = 10'h2b8;
              4'h3: pos_low = 10'h2b9;
              4'h4: pos_low = 10'h2ba;
              4'h5: pos_low = 10'h2bb;
              4'h6: pos_low = 10'h2bc;
              4'h7: pos_low = 10'h2bd;
              4'h8: pos_low = 10'h2be;
              4'h9: pos_low = 10'h2bf;
              4'ha: pos_low = 10'h2c0;
              4'hb: pos_low = 10'h2c1;
              4'hc: pos_low = 10'h2c2;
              4'hd: pos_low = 10'h2c3;
              4'he: pos_low = 10'h2c4;
              4'hf: pos_low = 10'h2c4;
              default: pos_low = 10'h000;
            endcase
          end
          6'h2e: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h2c5;
              4'h1: pos_low = 10'h2c6;
              4'h2: pos_low = 10'h2c7;
              4'h3: pos_low = 10'h2c8;
              4'h4: pos_low = 10'h2c9;
              4'h5: pos_low = 10'h2ca;
              4'h6: pos_low = 10'h2cb;
              4'h7: pos_low = 10'h2cc;
              4'h8: pos_low = 10'h2cd;
              4'h9: pos_low = 10'h2ce;
              4'ha: pos_low = 10'h2cf;
              4'hb: pos_low = 10'h2d0;
              4'hc: pos_low = 10'h2d1;
              4'hd: pos_low = 10'h2d2;
              4'he: pos_low = 10'h2d3;
              4'hf: pos_low = 10'h2d4;
              default: pos_low = 10'h000;
            endcase
          end
          6'h2f: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h2d5;
              4'h1: pos_low = 10'h2d6;
              4'h2: pos_low = 10'h2d7;
              4'h3: pos_low = 10'h2d8;
              4'h4: pos_low = 10'h2d9;
              4'h5: pos_low = 10'h2d9;
              4'h6: pos_low = 10'h2da;
              4'h7: pos_low = 10'h2db;
              4'h8: pos_low = 10'h2dc;
              4'h9: pos_low = 10'h2dd;
              4'ha: pos_low = 10'h2de;
              4'hb: pos_low = 10'h2df;
              4'hc: pos_low = 10'h2e0;
              4'hd: pos_low = 10'h2e1;
              4'he: pos_low = 10'h2e2;
              4'hf: pos_low = 10'h2e3;
              default: pos_low = 10'h000;
            endcase
          end
          6'h30: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h2e4;
              4'h1: pos_low = 10'h2e5;
              4'h2: pos_low = 10'h2e6;
              4'h3: pos_low = 10'h2e7;
              4'h4: pos_low = 10'h2e8;
              4'h5: pos_low = 10'h2e9;
              4'h6: pos_low = 10'h2ea;
              4'h7: pos_low = 10'h2eb;
              4'h8: pos_low = 10'h2ec;
              4'h9: pos_low = 10'h2ed;
              4'ha: pos_low = 10'h2ed;
              4'hb: pos_low = 10'h2ee;
              4'hc: pos_low = 10'h2ef;
              4'hd: pos_low = 10'h2f0;
              4'he: pos_low = 10'h2f1;
              4'hf: pos_low = 10'h2f2;
              default: pos_low = 10'h000;
            endcase
          end
          6'h31: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h2f3;
              4'h1: pos_low = 10'h2f4;
              4'h2: pos_low = 10'h2f5;
              4'h3: pos_low = 10'h2f6;
              4'h4: pos_low = 10'h2f7;
              4'h5: pos_low = 10'h2f8;
              4'h6: pos_low = 10'h2f9;
              4'h7: pos_low = 10'h2fa;
              4'h8: pos_low = 10'h2fb;
              4'h9: pos_low = 10'h2fc;
              4'ha: pos_low = 10'h2fd;
              4'hb: pos_low = 10'h2fe;
              4'hc: pos_low = 10'h2ff;
              4'hd: pos_low = 10'h300;
              4'he: pos_low = 10'h301;
              4'hf: pos_low = 10'h301;
              default: pos_low = 10'h000;
            endcase
          end
          6'h32: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h302;
              4'h1: pos_low = 10'h303;
              4'h2: pos_low = 10'h304;
              4'h3: pos_low = 10'h305;
              4'h4: pos_low = 10'h306;
              4'h5: pos_low = 10'h307;
              4'h6: pos_low = 10'h308;
              4'h7: pos_low = 10'h309;
              4'h8: pos_low = 10'h30a;
              4'h9: pos_low = 10'h30b;
              4'ha: pos_low = 10'h30c;
              4'hb: pos_low = 10'h30d;
              4'hc: pos_low = 10'h30e;
              4'hd: pos_low = 10'h30f;
              4'he: pos_low = 10'h310;
              4'hf: pos_low = 10'h311;
              default: pos_low = 10'h000;
            endcase
          end
          6'h33: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h312;
              4'h1: pos_low = 10'h313;
              4'h2: pos_low = 10'h314;
              4'h3: pos_low = 10'h315;
              4'h4: pos_low = 10'h315;
              4'h5: pos_low = 10'h316;
              4'h6: pos_low = 10'h317;
              4'h7: pos_low = 10'h318;
              4'h8: pos_low = 10'h319;
              4'h9: pos_low = 10'h31a;
              4'ha: pos_low = 10'h31b;
              4'hb: pos_low = 10'h31c;
              4'hc: pos_low = 10'h31d;
              4'hd: pos_low = 10'h31e;
              4'he: pos_low = 10'h31f;
              4'hf: pos_low = 10'h320;
              default: pos_low = 10'h000;
            endcase
          end
          6'h34: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h321;
              4'h1: pos_low = 10'h322;
              4'h2: pos_low = 10'h323;
              4'h3: pos_low = 10'h324;
              4'h4: pos_low = 10'h325;
              4'h5: pos_low = 10'h326;
              4'h6: pos_low = 10'h327;
              4'h7: pos_low = 10'h328;
              4'h8: pos_low = 10'h328;
              4'h9: pos_low = 10'h329;
              4'ha: pos_low = 10'h32a;
              4'hb: pos_low = 10'h32b;
              4'hc: pos_low = 10'h32c;
              4'hd: pos_low = 10'h32d;
              4'he: pos_low = 10'h32e;
              4'hf: pos_low = 10'h32f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h35: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h330;
              4'h1: pos_low = 10'h331;
              4'h2: pos_low = 10'h332;
              4'h3: pos_low = 10'h333;
              4'h4: pos_low = 10'h334;
              4'h5: pos_low = 10'h335;
              4'h6: pos_low = 10'h336;
              4'h7: pos_low = 10'h337;
              4'h8: pos_low = 10'h338;
              4'h9: pos_low = 10'h339;
              4'ha: pos_low = 10'h33a;
              4'hb: pos_low = 10'h33b;
              4'hc: pos_low = 10'h33b;
              4'hd: pos_low = 10'h33c;
              4'he: pos_low = 10'h33d;
              4'hf: pos_low = 10'h33e;
              default: pos_low = 10'h000;
            endcase
          end
          6'h36: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h33f;
              4'h1: pos_low = 10'h340;
              4'h2: pos_low = 10'h341;
              4'h3: pos_low = 10'h342;
              4'h4: pos_low = 10'h343;
              4'h5: pos_low = 10'h344;
              4'h6: pos_low = 10'h345;
              4'h7: pos_low = 10'h346;
              4'h8: pos_low = 10'h347;
              4'h9: pos_low = 10'h348;
              4'ha: pos_low = 10'h349;
              4'hb: pos_low = 10'h34a;
              4'hc: pos_low = 10'h34b;
              4'hd: pos_low = 10'h34c;
              4'he: pos_low = 10'h34d;
              4'hf: pos_low = 10'h34d;
              default: pos_low = 10'h000;
            endcase
          end
          6'h37: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h34e;
              4'h1: pos_low = 10'h34f;
              4'h2: pos_low = 10'h350;
              4'h3: pos_low = 10'h351;
              4'h4: pos_low = 10'h352;
              4'h5: pos_low = 10'h353;
              4'h6: pos_low = 10'h354;
              4'h7: pos_low = 10'h355;
              4'h8: pos_low = 10'h356;
              4'h9: pos_low = 10'h357;
              4'ha: pos_low = 10'h358;
              4'hb: pos_low = 10'h359;
              4'hc: pos_low = 10'h35a;
              4'hd: pos_low = 10'h35b;
              4'he: pos_low = 10'h35c;
              4'hf: pos_low = 10'h35d;
              default: pos_low = 10'h000;
            endcase
          end
          6'h38: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h35e;
              4'h1: pos_low = 10'h35f;
              4'h2: pos_low = 10'h35f;
              4'h3: pos_low = 10'h360;
              4'h4: pos_low = 10'h361;
              4'h5: pos_low = 10'h362;
              4'h6: pos_low = 10'h363;
              4'h7: pos_low = 10'h364;
              4'h8: pos_low = 10'h365;
              4'h9: pos_low = 10'h366;
              4'ha: pos_low = 10'h367;
              4'hb: pos_low = 10'h368;
              4'hc: pos_low = 10'h369;
              4'hd: pos_low = 10'h36a;
              4'he: pos_low = 10'h36b;
              4'hf: pos_low = 10'h36c;
              default: pos_low = 10'h000;
            endcase
          end
          6'h39: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h36d;
              4'h1: pos_low = 10'h36e;
              4'h2: pos_low = 10'h36f;
              4'h3: pos_low = 10'h370;
              4'h4: pos_low = 10'h371;
              4'h5: pos_low = 10'h371;
              4'h6: pos_low = 10'h372;
              4'h7: pos_low = 10'h373;
              4'h8: pos_low = 10'h374;
              4'h9: pos_low = 10'h375;
              4'ha: pos_low = 10'h376;
              4'hb: pos_low = 10'h377;
              4'hc: pos_low = 10'h378;
              4'hd: pos_low = 10'h379;
              4'he: pos_low = 10'h37a;
              4'hf: pos_low = 10'h37b;
              default: pos_low = 10'h000;
            endcase
          end
          6'h3a: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h37c;
              4'h1: pos_low = 10'h37d;
              4'h2: pos_low = 10'h37e;
              4'h3: pos_low = 10'h37f;
              4'h4: pos_low = 10'h380;
              4'h5: pos_low = 10'h381;
              4'h6: pos_low = 10'h382;
              4'h7: pos_low = 10'h382;
              4'h8: pos_low = 10'h383;
              4'h9: pos_low = 10'h384;
              4'ha: pos_low = 10'h385;
              4'hb: pos_low = 10'h386;
              4'hc: pos_low = 10'h387;
              4'hd: pos_low = 10'h388;
              4'he: pos_low = 10'h389;
              4'hf: pos_low = 10'h38a;
              default: pos_low = 10'h000;
            endcase
          end
          6'h3b: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h38b;
              4'h1: pos_low = 10'h38c;
              4'h2: pos_low = 10'h38d;
              4'h3: pos_low = 10'h38e;
              4'h4: pos_low = 10'h38f;
              4'h5: pos_low = 10'h390;
              4'h6: pos_low = 10'h391;
              4'h7: pos_low = 10'h392;
              4'h8: pos_low = 10'h393;
              4'h9: pos_low = 10'h393;
              4'ha: pos_low = 10'h394;
              4'hb: pos_low = 10'h395;
              4'hc: pos_low = 10'h396;
              4'hd: pos_low = 10'h397;
              4'he: pos_low = 10'h398;
              4'hf: pos_low = 10'h399;
              default: pos_low = 10'h000;
            endcase
          end
          6'h3c: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h39a;
              4'h1: pos_low = 10'h39b;
              4'h2: pos_low = 10'h39c;
              4'h3: pos_low = 10'h39d;
              4'h4: pos_low = 10'h39e;
              4'h5: pos_low = 10'h39f;
              4'h6: pos_low = 10'h3a0;
              4'h7: pos_low = 10'h3a1;
              4'h8: pos_low = 10'h3a2;
              4'h9: pos_low = 10'h3a3;
              4'ha: pos_low = 10'h3a4;
              4'hb: pos_low = 10'h3a4;
              4'hc: pos_low = 10'h3a5;
              4'hd: pos_low = 10'h3a6;
              4'he: pos_low = 10'h3a7;
              4'hf: pos_low = 10'h3a8;
              default: pos_low = 10'h000;
            endcase
          end
          6'h3d: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3a9;
              4'h1: pos_low = 10'h3aa;
              4'h2: pos_low = 10'h3ab;
              4'h3: pos_low = 10'h3ac;
              4'h4: pos_low = 10'h3ad;
              4'h5: pos_low = 10'h3ae;
              4'h6: pos_low = 10'h3af;
              4'h7: pos_low = 10'h3b0;
              4'h8: pos_low = 10'h3b1;
              4'h9: pos_low = 10'h3b2;
              4'ha: pos_low = 10'h3b3;
              4'hb: pos_low = 10'h3b4;
              4'hc: pos_low = 10'h3b4;
              4'hd: pos_low = 10'h3b5;
              4'he: pos_low = 10'h3b6;
              4'hf: pos_low = 10'h3b7;
              default: pos_low = 10'h000;
            endcase
          end
          6'h3e: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3b8;
              4'h1: pos_low = 10'h3b9;
              4'h2: pos_low = 10'h3ba;
              4'h3: pos_low = 10'h3bb;
              4'h4: pos_low = 10'h3bc;
              4'h5: pos_low = 10'h3bd;
              4'h6: pos_low = 10'h3be;
              4'h7: pos_low = 10'h3bf;
              4'h8: pos_low = 10'h3c0;
              4'h9: pos_low = 10'h3c1;
              4'ha: pos_low = 10'h3c2;
              4'hb: pos_low = 10'h3c3;
              4'hc: pos_low = 10'h3c4;
              4'hd: pos_low = 10'h3c5;
              4'he: pos_low = 10'h3c5;
              4'hf: pos_low = 10'h3c6;
              default: pos_low = 10'h000;
            endcase
          end
          6'h3f: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3c7;
              4'h1: pos_low = 10'h3c8;
              4'h2: pos_low = 10'h3c9;
              4'h3: pos_low = 10'h3ca;
              4'h4: pos_low = 10'h3cb;
              4'h5: pos_low = 10'h3cc;
              4'h6: pos_low = 10'h3cd;
              4'h7: pos_low = 10'h3ce;
              4'h8: pos_low = 10'h3cf;
              4'h9: pos_low = 10'h3d0;
              4'ha: pos_low = 10'h3d1;
              4'hb: pos_low = 10'h3d2;
              4'hc: pos_low = 10'h3d3;
              4'hd: pos_low = 10'h3d4;
              4'he: pos_low = 10'h3d4;
              4'hf: pos_low = 10'h3d5;
              default: pos_low = 10'h000;
            endcase
          end
          default: begin end
        endcase
      end
      5'h0d: begin
        case (mant[9:4])
          6'h00: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3d6;
              4'h1: pos_low = 10'h3d8;
              4'h2: pos_low = 10'h3da;
              4'h3: pos_low = 10'h3dc;
              4'h4: pos_low = 10'h3de;
              4'h5: pos_low = 10'h3e0;
              4'h6: pos_low = 10'h3e2;
              4'h7: pos_low = 10'h3e4;
              4'h8: pos_low = 10'h3e5;
              4'h9: pos_low = 10'h3e7;
              4'ha: pos_low = 10'h3e9;
              4'hb: pos_low = 10'h3eb;
              4'hc: pos_low = 10'h3ed;
              4'hd: pos_low = 10'h3ef;
              4'he: pos_low = 10'h3f1;
              4'hf: pos_low = 10'h3f3;
              default: pos_low = 10'h000;
            endcase
          end
          6'h01: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3f4;
              4'h1: pos_low = 10'h3f6;
              4'h2: pos_low = 10'h3f8;
              4'h3: pos_low = 10'h3fa;
              4'h4: pos_low = 10'h3fc;
              4'h5: pos_low = 10'h3fe;
              4'h6: pos_low = 10'h000;
              4'h7: pos_low = 10'h001;
              4'h8: pos_low = 10'h002;
              4'h9: pos_low = 10'h003;
              4'ha: pos_low = 10'h004;
              4'hb: pos_low = 10'h005;
              4'hc: pos_low = 10'h005;
              4'hd: pos_low = 10'h006;
              4'he: pos_low = 10'h007;
              4'hf: pos_low = 10'h008;
              default: pos_low = 10'h000;
            endcase
          end
          6'h02: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h009;
              4'h1: pos_low = 10'h00a;
              4'h2: pos_low = 10'h00b;
              4'h3: pos_low = 10'h00c;
              4'h4: pos_low = 10'h00d;
              4'h5: pos_low = 10'h00e;
              4'h6: pos_low = 10'h00f;
              4'h7: pos_low = 10'h010;
              4'h8: pos_low = 10'h011;
              4'h9: pos_low = 10'h012;
              4'ha: pos_low = 10'h013;
              4'hb: pos_low = 10'h014;
              4'hc: pos_low = 10'h014;
              4'hd: pos_low = 10'h015;
              4'he: pos_low = 10'h016;
              4'hf: pos_low = 10'h017;
              default: pos_low = 10'h000;
            endcase
          end
          6'h03: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h018;
              4'h1: pos_low = 10'h019;
              4'h2: pos_low = 10'h01a;
              4'h3: pos_low = 10'h01b;
              4'h4: pos_low = 10'h01c;
              4'h5: pos_low = 10'h01d;
              4'h6: pos_low = 10'h01e;
              4'h7: pos_low = 10'h01f;
              4'h8: pos_low = 10'h020;
              4'h9: pos_low = 10'h021;
              4'ha: pos_low = 10'h022;
              4'hb: pos_low = 10'h022;
              4'hc: pos_low = 10'h023;
              4'hd: pos_low = 10'h024;
              4'he: pos_low = 10'h025;
              4'hf: pos_low = 10'h026;
              default: pos_low = 10'h000;
            endcase
          end
          6'h04: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h027;
              4'h1: pos_low = 10'h028;
              4'h2: pos_low = 10'h029;
              4'h3: pos_low = 10'h02a;
              4'h4: pos_low = 10'h02b;
              4'h5: pos_low = 10'h02c;
              4'h6: pos_low = 10'h02d;
              4'h7: pos_low = 10'h02e;
              4'h8: pos_low = 10'h02f;
              4'h9: pos_low = 10'h030;
              4'ha: pos_low = 10'h030;
              4'hb: pos_low = 10'h031;
              4'hc: pos_low = 10'h032;
              4'hd: pos_low = 10'h033;
              4'he: pos_low = 10'h034;
              4'hf: pos_low = 10'h035;
              default: pos_low = 10'h000;
            endcase
          end
          6'h05: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h036;
              4'h1: pos_low = 10'h037;
              4'h2: pos_low = 10'h038;
              4'h3: pos_low = 10'h039;
              4'h4: pos_low = 10'h03a;
              4'h5: pos_low = 10'h03b;
              4'h6: pos_low = 10'h03c;
              4'h7: pos_low = 10'h03d;
              4'h8: pos_low = 10'h03d;
              4'h9: pos_low = 10'h03e;
              4'ha: pos_low = 10'h03f;
              4'hb: pos_low = 10'h040;
              4'hc: pos_low = 10'h041;
              4'hd: pos_low = 10'h042;
              4'he: pos_low = 10'h043;
              4'hf: pos_low = 10'h044;
              default: pos_low = 10'h000;
            endcase
          end
          6'h06: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h045;
              4'h1: pos_low = 10'h046;
              4'h2: pos_low = 10'h047;
              4'h3: pos_low = 10'h048;
              4'h4: pos_low = 10'h049;
              4'h5: pos_low = 10'h04a;
              4'h6: pos_low = 10'h04a;
              4'h7: pos_low = 10'h04b;
              4'h8: pos_low = 10'h04c;
              4'h9: pos_low = 10'h04d;
              4'ha: pos_low = 10'h04e;
              4'hb: pos_low = 10'h04f;
              4'hc: pos_low = 10'h050;
              4'hd: pos_low = 10'h051;
              4'he: pos_low = 10'h052;
              4'hf: pos_low = 10'h053;
              default: pos_low = 10'h000;
            endcase
          end
          6'h07: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h054;
              4'h1: pos_low = 10'h055;
              4'h2: pos_low = 10'h056;
              4'h3: pos_low = 10'h057;
              4'h4: pos_low = 10'h057;
              4'h5: pos_low = 10'h058;
              4'h6: pos_low = 10'h059;
              4'h7: pos_low = 10'h05a;
              4'h8: pos_low = 10'h05b;
              4'h9: pos_low = 10'h05c;
              4'ha: pos_low = 10'h05d;
              4'hb: pos_low = 10'h05e;
              4'hc: pos_low = 10'h05f;
              4'hd: pos_low = 10'h060;
              4'he: pos_low = 10'h061;
              4'hf: pos_low = 10'h062;
              default: pos_low = 10'h000;
            endcase
          end
          6'h08: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h063;
              4'h1: pos_low = 10'h063;
              4'h2: pos_low = 10'h064;
              4'h3: pos_low = 10'h065;
              4'h4: pos_low = 10'h066;
              4'h5: pos_low = 10'h067;
              4'h6: pos_low = 10'h068;
              4'h7: pos_low = 10'h069;
              4'h8: pos_low = 10'h06a;
              4'h9: pos_low = 10'h06b;
              4'ha: pos_low = 10'h06c;
              4'hb: pos_low = 10'h06d;
              4'hc: pos_low = 10'h06e;
              4'hd: pos_low = 10'h06f;
              4'he: pos_low = 10'h06f;
              4'hf: pos_low = 10'h070;
              default: pos_low = 10'h000;
            endcase
          end
          6'h09: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h071;
              4'h1: pos_low = 10'h072;
              4'h2: pos_low = 10'h073;
              4'h3: pos_low = 10'h074;
              4'h4: pos_low = 10'h075;
              4'h5: pos_low = 10'h076;
              4'h6: pos_low = 10'h077;
              4'h7: pos_low = 10'h078;
              4'h8: pos_low = 10'h079;
              4'h9: pos_low = 10'h07a;
              4'ha: pos_low = 10'h07b;
              4'hb: pos_low = 10'h07b;
              4'hc: pos_low = 10'h07c;
              4'hd: pos_low = 10'h07d;
              4'he: pos_low = 10'h07e;
              4'hf: pos_low = 10'h07f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h0a: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h080;
              4'h1: pos_low = 10'h081;
              4'h2: pos_low = 10'h082;
              4'h3: pos_low = 10'h083;
              4'h4: pos_low = 10'h084;
              4'h5: pos_low = 10'h085;
              4'h6: pos_low = 10'h086;
              4'h7: pos_low = 10'h087;
              4'h8: pos_low = 10'h087;
              4'h9: pos_low = 10'h088;
              4'ha: pos_low = 10'h089;
              4'hb: pos_low = 10'h08a;
              4'hc: pos_low = 10'h08b;
              4'hd: pos_low = 10'h08c;
              4'he: pos_low = 10'h08d;
              4'hf: pos_low = 10'h08e;
              default: pos_low = 10'h000;
            endcase
          end
          6'h0b: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h08f;
              4'h1: pos_low = 10'h090;
              4'h2: pos_low = 10'h091;
              4'h3: pos_low = 10'h092;
              4'h4: pos_low = 10'h092;
              4'h5: pos_low = 10'h093;
              4'h6: pos_low = 10'h094;
              4'h7: pos_low = 10'h095;
              4'h8: pos_low = 10'h096;
              4'h9: pos_low = 10'h097;
              4'ha: pos_low = 10'h098;
              4'hb: pos_low = 10'h099;
              4'hc: pos_low = 10'h09a;
              4'hd: pos_low = 10'h09b;
              4'he: pos_low = 10'h09c;
              4'hf: pos_low = 10'h09d;
              default: pos_low = 10'h000;
            endcase
          end
          6'h0c: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h09d;
              4'h1: pos_low = 10'h09e;
              4'h2: pos_low = 10'h09f;
              4'h3: pos_low = 10'h0a0;
              4'h4: pos_low = 10'h0a1;
              4'h5: pos_low = 10'h0a2;
              4'h6: pos_low = 10'h0a3;
              4'h7: pos_low = 10'h0a4;
              4'h8: pos_low = 10'h0a5;
              4'h9: pos_low = 10'h0a6;
              4'ha: pos_low = 10'h0a7;
              4'hb: pos_low = 10'h0a8;
              4'hc: pos_low = 10'h0a8;
              4'hd: pos_low = 10'h0a9;
              4'he: pos_low = 10'h0aa;
              4'hf: pos_low = 10'h0ab;
              default: pos_low = 10'h000;
            endcase
          end
          6'h0d: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h0ac;
              4'h1: pos_low = 10'h0ad;
              4'h2: pos_low = 10'h0ae;
              4'h3: pos_low = 10'h0af;
              4'h4: pos_low = 10'h0b0;
              4'h5: pos_low = 10'h0b1;
              4'h6: pos_low = 10'h0b2;
              4'h7: pos_low = 10'h0b3;
              4'h8: pos_low = 10'h0b3;
              4'h9: pos_low = 10'h0b4;
              4'ha: pos_low = 10'h0b5;
              4'hb: pos_low = 10'h0b6;
              4'hc: pos_low = 10'h0b7;
              4'hd: pos_low = 10'h0b8;
              4'he: pos_low = 10'h0b9;
              4'hf: pos_low = 10'h0ba;
              default: pos_low = 10'h000;
            endcase
          end
          6'h0e: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h0bb;
              4'h1: pos_low = 10'h0bc;
              4'h2: pos_low = 10'h0bd;
              4'h3: pos_low = 10'h0be;
              4'h4: pos_low = 10'h0be;
              4'h5: pos_low = 10'h0bf;
              4'h6: pos_low = 10'h0c0;
              4'h7: pos_low = 10'h0c1;
              4'h8: pos_low = 10'h0c2;
              4'h9: pos_low = 10'h0c3;
              4'ha: pos_low = 10'h0c4;
              4'hb: pos_low = 10'h0c5;
              4'hc: pos_low = 10'h0c6;
              4'hd: pos_low = 10'h0c7;
              4'he: pos_low = 10'h0c8;
              4'hf: pos_low = 10'h0c8;
              default: pos_low = 10'h000;
            endcase
          end
          6'h0f: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h0c9;
              4'h1: pos_low = 10'h0ca;
              4'h2: pos_low = 10'h0cb;
              4'h3: pos_low = 10'h0cc;
              4'h4: pos_low = 10'h0cd;
              4'h5: pos_low = 10'h0ce;
              4'h6: pos_low = 10'h0cf;
              4'h7: pos_low = 10'h0d0;
              4'h8: pos_low = 10'h0d1;
              4'h9: pos_low = 10'h0d2;
              4'ha: pos_low = 10'h0d2;
              4'hb: pos_low = 10'h0d3;
              4'hc: pos_low = 10'h0d4;
              4'hd: pos_low = 10'h0d5;
              4'he: pos_low = 10'h0d6;
              4'hf: pos_low = 10'h0d7;
              default: pos_low = 10'h000;
            endcase
          end
          6'h10: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h0d8;
              4'h1: pos_low = 10'h0d9;
              4'h2: pos_low = 10'h0da;
              4'h3: pos_low = 10'h0db;
              4'h4: pos_low = 10'h0dc;
              4'h5: pos_low = 10'h0dc;
              4'h6: pos_low = 10'h0dd;
              4'h7: pos_low = 10'h0de;
              4'h8: pos_low = 10'h0df;
              4'h9: pos_low = 10'h0e0;
              4'ha: pos_low = 10'h0e1;
              4'hb: pos_low = 10'h0e2;
              4'hc: pos_low = 10'h0e3;
              4'hd: pos_low = 10'h0e4;
              4'he: pos_low = 10'h0e5;
              4'hf: pos_low = 10'h0e6;
              default: pos_low = 10'h000;
            endcase
          end
          6'h11: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h0e6;
              4'h1: pos_low = 10'h0e7;
              4'h2: pos_low = 10'h0e8;
              4'h3: pos_low = 10'h0e9;
              4'h4: pos_low = 10'h0ea;
              4'h5: pos_low = 10'h0eb;
              4'h6: pos_low = 10'h0ec;
              4'h7: pos_low = 10'h0ed;
              4'h8: pos_low = 10'h0ee;
              4'h9: pos_low = 10'h0ef;
              4'ha: pos_low = 10'h0ef;
              4'hb: pos_low = 10'h0f0;
              4'hc: pos_low = 10'h0f1;
              4'hd: pos_low = 10'h0f2;
              4'he: pos_low = 10'h0f3;
              4'hf: pos_low = 10'h0f4;
              default: pos_low = 10'h000;
            endcase
          end
          6'h12: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h0f5;
              4'h1: pos_low = 10'h0f6;
              4'h2: pos_low = 10'h0f7;
              4'h3: pos_low = 10'h0f8;
              4'h4: pos_low = 10'h0f9;
              4'h5: pos_low = 10'h0f9;
              4'h6: pos_low = 10'h0fa;
              4'h7: pos_low = 10'h0fb;
              4'h8: pos_low = 10'h0fc;
              4'h9: pos_low = 10'h0fd;
              4'ha: pos_low = 10'h0fe;
              4'hb: pos_low = 10'h0ff;
              4'hc: pos_low = 10'h100;
              4'hd: pos_low = 10'h101;
              4'he: pos_low = 10'h102;
              4'hf: pos_low = 10'h102;
              default: pos_low = 10'h000;
            endcase
          end
          6'h13: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h103;
              4'h1: pos_low = 10'h104;
              4'h2: pos_low = 10'h105;
              4'h3: pos_low = 10'h106;
              4'h4: pos_low = 10'h107;
              4'h5: pos_low = 10'h108;
              4'h6: pos_low = 10'h109;
              4'h7: pos_low = 10'h10a;
              4'h8: pos_low = 10'h10b;
              4'h9: pos_low = 10'h10b;
              4'ha: pos_low = 10'h10c;
              4'hb: pos_low = 10'h10d;
              4'hc: pos_low = 10'h10e;
              4'hd: pos_low = 10'h10f;
              4'he: pos_low = 10'h110;
              4'hf: pos_low = 10'h111;
              default: pos_low = 10'h000;
            endcase
          end
          6'h14: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h112;
              4'h1: pos_low = 10'h113;
              4'h2: pos_low = 10'h114;
              4'h3: pos_low = 10'h114;
              4'h4: pos_low = 10'h115;
              4'h5: pos_low = 10'h116;
              4'h6: pos_low = 10'h117;
              4'h7: pos_low = 10'h118;
              4'h8: pos_low = 10'h119;
              4'h9: pos_low = 10'h11a;
              4'ha: pos_low = 10'h11b;
              4'hb: pos_low = 10'h11c;
              4'hc: pos_low = 10'h11d;
              4'hd: pos_low = 10'h11d;
              4'he: pos_low = 10'h11e;
              4'hf: pos_low = 10'h11f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h15: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h120;
              4'h1: pos_low = 10'h121;
              4'h2: pos_low = 10'h122;
              4'h3: pos_low = 10'h123;
              4'h4: pos_low = 10'h124;
              4'h5: pos_low = 10'h125;
              4'h6: pos_low = 10'h126;
              4'h7: pos_low = 10'h126;
              4'h8: pos_low = 10'h127;
              4'h9: pos_low = 10'h128;
              4'ha: pos_low = 10'h129;
              4'hb: pos_low = 10'h12a;
              4'hc: pos_low = 10'h12b;
              4'hd: pos_low = 10'h12c;
              4'he: pos_low = 10'h12d;
              4'hf: pos_low = 10'h12e;
              default: pos_low = 10'h000;
            endcase
          end
          6'h16: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h12e;
              4'h1: pos_low = 10'h12f;
              4'h2: pos_low = 10'h130;
              4'h3: pos_low = 10'h131;
              4'h4: pos_low = 10'h132;
              4'h5: pos_low = 10'h133;
              4'h6: pos_low = 10'h134;
              4'h7: pos_low = 10'h135;
              4'h8: pos_low = 10'h136;
              4'h9: pos_low = 10'h137;
              4'ha: pos_low = 10'h137;
              4'hb: pos_low = 10'h138;
              4'hc: pos_low = 10'h139;
              4'hd: pos_low = 10'h13a;
              4'he: pos_low = 10'h13b;
              4'hf: pos_low = 10'h13c;
              default: pos_low = 10'h000;
            endcase
          end
          6'h17: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h13d;
              4'h1: pos_low = 10'h13e;
              4'h2: pos_low = 10'h13f;
              4'h3: pos_low = 10'h13f;
              4'h4: pos_low = 10'h140;
              4'h5: pos_low = 10'h141;
              4'h6: pos_low = 10'h142;
              4'h7: pos_low = 10'h143;
              4'h8: pos_low = 10'h144;
              4'h9: pos_low = 10'h145;
              4'ha: pos_low = 10'h146;
              4'hb: pos_low = 10'h147;
              4'hc: pos_low = 10'h147;
              4'hd: pos_low = 10'h148;
              4'he: pos_low = 10'h149;
              4'hf: pos_low = 10'h14a;
              default: pos_low = 10'h000;
            endcase
          end
          6'h18: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h14b;
              4'h1: pos_low = 10'h14c;
              4'h2: pos_low = 10'h14d;
              4'h3: pos_low = 10'h14e;
              4'h4: pos_low = 10'h14f;
              4'h5: pos_low = 10'h14f;
              4'h6: pos_low = 10'h150;
              4'h7: pos_low = 10'h151;
              4'h8: pos_low = 10'h152;
              4'h9: pos_low = 10'h153;
              4'ha: pos_low = 10'h154;
              4'hb: pos_low = 10'h155;
              4'hc: pos_low = 10'h156;
              4'hd: pos_low = 10'h157;
              4'he: pos_low = 10'h157;
              4'hf: pos_low = 10'h158;
              default: pos_low = 10'h000;
            endcase
          end
          6'h19: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h159;
              4'h1: pos_low = 10'h15a;
              4'h2: pos_low = 10'h15b;
              4'h3: pos_low = 10'h15c;
              4'h4: pos_low = 10'h15d;
              4'h5: pos_low = 10'h15e;
              4'h6: pos_low = 10'h15f;
              4'h7: pos_low = 10'h15f;
              4'h8: pos_low = 10'h160;
              4'h9: pos_low = 10'h161;
              4'ha: pos_low = 10'h162;
              4'hb: pos_low = 10'h163;
              4'hc: pos_low = 10'h164;
              4'hd: pos_low = 10'h165;
              4'he: pos_low = 10'h166;
              4'hf: pos_low = 10'h167;
              default: pos_low = 10'h000;
            endcase
          end
          6'h1a: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h167;
              4'h1: pos_low = 10'h168;
              4'h2: pos_low = 10'h169;
              4'h3: pos_low = 10'h16a;
              4'h4: pos_low = 10'h16b;
              4'h5: pos_low = 10'h16c;
              4'h6: pos_low = 10'h16d;
              4'h7: pos_low = 10'h16e;
              4'h8: pos_low = 10'h16f;
              4'h9: pos_low = 10'h16f;
              4'ha: pos_low = 10'h170;
              4'hb: pos_low = 10'h171;
              4'hc: pos_low = 10'h172;
              4'hd: pos_low = 10'h173;
              4'he: pos_low = 10'h174;
              4'hf: pos_low = 10'h175;
              default: pos_low = 10'h000;
            endcase
          end
          6'h1b: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h176;
              4'h1: pos_low = 10'h177;
              4'h2: pos_low = 10'h177;
              4'h3: pos_low = 10'h178;
              4'h4: pos_low = 10'h179;
              4'h5: pos_low = 10'h17a;
              4'h6: pos_low = 10'h17b;
              4'h7: pos_low = 10'h17c;
              4'h8: pos_low = 10'h17d;
              4'h9: pos_low = 10'h17e;
              4'ha: pos_low = 10'h17e;
              4'hb: pos_low = 10'h17f;
              4'hc: pos_low = 10'h180;
              4'hd: pos_low = 10'h181;
              4'he: pos_low = 10'h182;
              4'hf: pos_low = 10'h183;
              default: pos_low = 10'h000;
            endcase
          end
          6'h1c: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h184;
              4'h1: pos_low = 10'h185;
              4'h2: pos_low = 10'h186;
              4'h3: pos_low = 10'h186;
              4'h4: pos_low = 10'h187;
              4'h5: pos_low = 10'h188;
              4'h6: pos_low = 10'h189;
              4'h7: pos_low = 10'h18a;
              4'h8: pos_low = 10'h18b;
              4'h9: pos_low = 10'h18c;
              4'ha: pos_low = 10'h18d;
              4'hb: pos_low = 10'h18d;
              4'hc: pos_low = 10'h18e;
              4'hd: pos_low = 10'h18f;
              4'he: pos_low = 10'h190;
              4'hf: pos_low = 10'h191;
              default: pos_low = 10'h000;
            endcase
          end
          6'h1d: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h192;
              4'h1: pos_low = 10'h193;
              4'h2: pos_low = 10'h194;
              4'h3: pos_low = 10'h194;
              4'h4: pos_low = 10'h195;
              4'h5: pos_low = 10'h196;
              4'h6: pos_low = 10'h197;
              4'h7: pos_low = 10'h198;
              4'h8: pos_low = 10'h199;
              4'h9: pos_low = 10'h19a;
              4'ha: pos_low = 10'h19b;
              4'hb: pos_low = 10'h19b;
              4'hc: pos_low = 10'h19c;
              4'hd: pos_low = 10'h19d;
              4'he: pos_low = 10'h19e;
              4'hf: pos_low = 10'h19f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h1e: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h1a0;
              4'h1: pos_low = 10'h1a1;
              4'h2: pos_low = 10'h1a2;
              4'h3: pos_low = 10'h1a2;
              4'h4: pos_low = 10'h1a3;
              4'h5: pos_low = 10'h1a4;
              4'h6: pos_low = 10'h1a5;
              4'h7: pos_low = 10'h1a6;
              4'h8: pos_low = 10'h1a7;
              4'h9: pos_low = 10'h1a8;
              4'ha: pos_low = 10'h1a9;
              4'hb: pos_low = 10'h1a9;
              4'hc: pos_low = 10'h1aa;
              4'hd: pos_low = 10'h1ab;
              4'he: pos_low = 10'h1ac;
              4'hf: pos_low = 10'h1ad;
              default: pos_low = 10'h000;
            endcase
          end
          6'h1f: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h1ae;
              4'h1: pos_low = 10'h1af;
              4'h2: pos_low = 10'h1b0;
              4'h3: pos_low = 10'h1b0;
              4'h4: pos_low = 10'h1b1;
              4'h5: pos_low = 10'h1b2;
              4'h6: pos_low = 10'h1b3;
              4'h7: pos_low = 10'h1b4;
              4'h8: pos_low = 10'h1b5;
              4'h9: pos_low = 10'h1b6;
              4'ha: pos_low = 10'h1b7;
              4'hb: pos_low = 10'h1b7;
              4'hc: pos_low = 10'h1b8;
              4'hd: pos_low = 10'h1b9;
              4'he: pos_low = 10'h1ba;
              4'hf: pos_low = 10'h1bb;
              default: pos_low = 10'h000;
            endcase
          end
          6'h20: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h1bc;
              4'h1: pos_low = 10'h1bd;
              4'h2: pos_low = 10'h1be;
              4'h3: pos_low = 10'h1be;
              4'h4: pos_low = 10'h1bf;
              4'h5: pos_low = 10'h1c0;
              4'h6: pos_low = 10'h1c1;
              4'h7: pos_low = 10'h1c2;
              4'h8: pos_low = 10'h1c3;
              4'h9: pos_low = 10'h1c4;
              4'ha: pos_low = 10'h1c5;
              4'hb: pos_low = 10'h1c5;
              4'hc: pos_low = 10'h1c6;
              4'hd: pos_low = 10'h1c7;
              4'he: pos_low = 10'h1c8;
              4'hf: pos_low = 10'h1c9;
              default: pos_low = 10'h000;
            endcase
          end
          6'h21: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h1ca;
              4'h1: pos_low = 10'h1cb;
              4'h2: pos_low = 10'h1cb;
              4'h3: pos_low = 10'h1cc;
              4'h4: pos_low = 10'h1cd;
              4'h5: pos_low = 10'h1ce;
              4'h6: pos_low = 10'h1cf;
              4'h7: pos_low = 10'h1d0;
              4'h8: pos_low = 10'h1d1;
              4'h9: pos_low = 10'h1d2;
              4'ha: pos_low = 10'h1d2;
              4'hb: pos_low = 10'h1d3;
              4'hc: pos_low = 10'h1d4;
              4'hd: pos_low = 10'h1d5;
              4'he: pos_low = 10'h1d6;
              4'hf: pos_low = 10'h1d7;
              default: pos_low = 10'h000;
            endcase
          end
          6'h22: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h1d8;
              4'h1: pos_low = 10'h1d9;
              4'h2: pos_low = 10'h1d9;
              4'h3: pos_low = 10'h1da;
              4'h4: pos_low = 10'h1db;
              4'h5: pos_low = 10'h1dc;
              4'h6: pos_low = 10'h1dd;
              4'h7: pos_low = 10'h1de;
              4'h8: pos_low = 10'h1df;
              4'h9: pos_low = 10'h1df;
              4'ha: pos_low = 10'h1e0;
              4'hb: pos_low = 10'h1e1;
              4'hc: pos_low = 10'h1e2;
              4'hd: pos_low = 10'h1e3;
              4'he: pos_low = 10'h1e4;
              4'hf: pos_low = 10'h1e5;
              default: pos_low = 10'h000;
            endcase
          end
          6'h23: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h1e5;
              4'h1: pos_low = 10'h1e6;
              4'h2: pos_low = 10'h1e7;
              4'h3: pos_low = 10'h1e8;
              4'h4: pos_low = 10'h1e9;
              4'h5: pos_low = 10'h1ea;
              4'h6: pos_low = 10'h1eb;
              4'h7: pos_low = 10'h1ec;
              4'h8: pos_low = 10'h1ec;
              4'h9: pos_low = 10'h1ed;
              4'ha: pos_low = 10'h1ee;
              4'hb: pos_low = 10'h1ef;
              4'hc: pos_low = 10'h1f0;
              4'hd: pos_low = 10'h1f1;
              4'he: pos_low = 10'h1f2;
              4'hf: pos_low = 10'h1f2;
              default: pos_low = 10'h000;
            endcase
          end
          6'h24: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h1f3;
              4'h1: pos_low = 10'h1f4;
              4'h2: pos_low = 10'h1f5;
              4'h3: pos_low = 10'h1f6;
              4'h4: pos_low = 10'h1f7;
              4'h5: pos_low = 10'h1f8;
              4'h6: pos_low = 10'h1f8;
              4'h7: pos_low = 10'h1f9;
              4'h8: pos_low = 10'h1fa;
              4'h9: pos_low = 10'h1fb;
              4'ha: pos_low = 10'h1fc;
              4'hb: pos_low = 10'h1fd;
              4'hc: pos_low = 10'h1fe;
              4'hd: pos_low = 10'h1fe;
              4'he: pos_low = 10'h1ff;
              4'hf: pos_low = 10'h200;
              default: pos_low = 10'h000;
            endcase
          end
          6'h25: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h201;
              4'h1: pos_low = 10'h202;
              4'h2: pos_low = 10'h203;
              4'h3: pos_low = 10'h204;
              4'h4: pos_low = 10'h205;
              4'h5: pos_low = 10'h205;
              4'h6: pos_low = 10'h206;
              4'h7: pos_low = 10'h207;
              4'h8: pos_low = 10'h208;
              4'h9: pos_low = 10'h209;
              4'ha: pos_low = 10'h20a;
              4'hb: pos_low = 10'h20b;
              4'hc: pos_low = 10'h20b;
              4'hd: pos_low = 10'h20c;
              4'he: pos_low = 10'h20d;
              4'hf: pos_low = 10'h20e;
              default: pos_low = 10'h000;
            endcase
          end
          6'h26: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h20f;
              4'h1: pos_low = 10'h210;
              4'h2: pos_low = 10'h211;
              4'h3: pos_low = 10'h211;
              4'h4: pos_low = 10'h212;
              4'h5: pos_low = 10'h213;
              4'h6: pos_low = 10'h214;
              4'h7: pos_low = 10'h215;
              4'h8: pos_low = 10'h216;
              4'h9: pos_low = 10'h216;
              4'ha: pos_low = 10'h217;
              4'hb: pos_low = 10'h218;
              4'hc: pos_low = 10'h219;
              4'hd: pos_low = 10'h21a;
              4'he: pos_low = 10'h21b;
              4'hf: pos_low = 10'h21c;
              default: pos_low = 10'h000;
            endcase
          end
          6'h27: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h21c;
              4'h1: pos_low = 10'h21d;
              4'h2: pos_low = 10'h21e;
              4'h3: pos_low = 10'h21f;
              4'h4: pos_low = 10'h220;
              4'h5: pos_low = 10'h221;
              4'h6: pos_low = 10'h222;
              4'h7: pos_low = 10'h222;
              4'h8: pos_low = 10'h223;
              4'h9: pos_low = 10'h224;
              4'ha: pos_low = 10'h225;
              4'hb: pos_low = 10'h226;
              4'hc: pos_low = 10'h227;
              4'hd: pos_low = 10'h228;
              4'he: pos_low = 10'h228;
              4'hf: pos_low = 10'h229;
              default: pos_low = 10'h000;
            endcase
          end
          6'h28: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h22a;
              4'h1: pos_low = 10'h22b;
              4'h2: pos_low = 10'h22c;
              4'h3: pos_low = 10'h22d;
              4'h4: pos_low = 10'h22e;
              4'h5: pos_low = 10'h22e;
              4'h6: pos_low = 10'h22f;
              4'h7: pos_low = 10'h230;
              4'h8: pos_low = 10'h231;
              4'h9: pos_low = 10'h232;
              4'ha: pos_low = 10'h233;
              4'hb: pos_low = 10'h233;
              4'hc: pos_low = 10'h234;
              4'hd: pos_low = 10'h235;
              4'he: pos_low = 10'h236;
              4'hf: pos_low = 10'h237;
              default: pos_low = 10'h000;
            endcase
          end
          6'h29: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h238;
              4'h1: pos_low = 10'h239;
              4'h2: pos_low = 10'h239;
              4'h3: pos_low = 10'h23a;
              4'h4: pos_low = 10'h23b;
              4'h5: pos_low = 10'h23c;
              4'h6: pos_low = 10'h23d;
              4'h7: pos_low = 10'h23e;
              4'h8: pos_low = 10'h23f;
              4'h9: pos_low = 10'h23f;
              4'ha: pos_low = 10'h240;
              4'hb: pos_low = 10'h241;
              4'hc: pos_low = 10'h242;
              4'hd: pos_low = 10'h243;
              4'he: pos_low = 10'h244;
              4'hf: pos_low = 10'h244;
              default: pos_low = 10'h000;
            endcase
          end
          6'h2a: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h245;
              4'h1: pos_low = 10'h246;
              4'h2: pos_low = 10'h247;
              4'h3: pos_low = 10'h248;
              4'h4: pos_low = 10'h249;
              4'h5: pos_low = 10'h24a;
              4'h6: pos_low = 10'h24a;
              4'h7: pos_low = 10'h24b;
              4'h8: pos_low = 10'h24c;
              4'h9: pos_low = 10'h24d;
              4'ha: pos_low = 10'h24e;
              4'hb: pos_low = 10'h24f;
              4'hc: pos_low = 10'h24f;
              4'hd: pos_low = 10'h250;
              4'he: pos_low = 10'h251;
              4'hf: pos_low = 10'h252;
              default: pos_low = 10'h000;
            endcase
          end
          6'h2b: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h253;
              4'h1: pos_low = 10'h254;
              4'h2: pos_low = 10'h254;
              4'h3: pos_low = 10'h255;
              4'h4: pos_low = 10'h256;
              4'h5: pos_low = 10'h257;
              4'h6: pos_low = 10'h258;
              4'h7: pos_low = 10'h259;
              4'h8: pos_low = 10'h25a;
              4'h9: pos_low = 10'h25a;
              4'ha: pos_low = 10'h25b;
              4'hb: pos_low = 10'h25c;
              4'hc: pos_low = 10'h25d;
              4'hd: pos_low = 10'h25e;
              4'he: pos_low = 10'h25f;
              4'hf: pos_low = 10'h25f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h2c: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h260;
              4'h1: pos_low = 10'h261;
              4'h2: pos_low = 10'h262;
              4'h3: pos_low = 10'h263;
              4'h4: pos_low = 10'h264;
              4'h5: pos_low = 10'h264;
              4'h6: pos_low = 10'h265;
              4'h7: pos_low = 10'h266;
              4'h8: pos_low = 10'h267;
              4'h9: pos_low = 10'h268;
              4'ha: pos_low = 10'h269;
              4'hb: pos_low = 10'h26a;
              4'hc: pos_low = 10'h26a;
              4'hd: pos_low = 10'h26b;
              4'he: pos_low = 10'h26c;
              4'hf: pos_low = 10'h26d;
              default: pos_low = 10'h000;
            endcase
          end
          6'h2d: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h26e;
              4'h1: pos_low = 10'h26f;
              4'h2: pos_low = 10'h26f;
              4'h3: pos_low = 10'h270;
              4'h4: pos_low = 10'h271;
              4'h5: pos_low = 10'h272;
              4'h6: pos_low = 10'h273;
              4'h7: pos_low = 10'h274;
              4'h8: pos_low = 10'h274;
              4'h9: pos_low = 10'h275;
              4'ha: pos_low = 10'h276;
              4'hb: pos_low = 10'h277;
              4'hc: pos_low = 10'h278;
              4'hd: pos_low = 10'h279;
              4'he: pos_low = 10'h279;
              4'hf: pos_low = 10'h27a;
              default: pos_low = 10'h000;
            endcase
          end
          6'h2e: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h27b;
              4'h1: pos_low = 10'h27c;
              4'h2: pos_low = 10'h27d;
              4'h3: pos_low = 10'h27e;
              4'h4: pos_low = 10'h27e;
              4'h5: pos_low = 10'h27f;
              4'h6: pos_low = 10'h280;
              4'h7: pos_low = 10'h281;
              4'h8: pos_low = 10'h282;
              4'h9: pos_low = 10'h283;
              4'ha: pos_low = 10'h283;
              4'hb: pos_low = 10'h284;
              4'hc: pos_low = 10'h285;
              4'hd: pos_low = 10'h286;
              4'he: pos_low = 10'h287;
              4'hf: pos_low = 10'h288;
              default: pos_low = 10'h000;
            endcase
          end
          6'h2f: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h288;
              4'h1: pos_low = 10'h289;
              4'h2: pos_low = 10'h28a;
              4'h3: pos_low = 10'h28b;
              4'h4: pos_low = 10'h28c;
              4'h5: pos_low = 10'h28d;
              4'h6: pos_low = 10'h28d;
              4'h7: pos_low = 10'h28e;
              4'h8: pos_low = 10'h28f;
              4'h9: pos_low = 10'h290;
              4'ha: pos_low = 10'h291;
              4'hb: pos_low = 10'h292;
              4'hc: pos_low = 10'h292;
              4'hd: pos_low = 10'h293;
              4'he: pos_low = 10'h294;
              4'hf: pos_low = 10'h295;
              default: pos_low = 10'h000;
            endcase
          end
          6'h30: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h296;
              4'h1: pos_low = 10'h297;
              4'h2: pos_low = 10'h297;
              4'h3: pos_low = 10'h298;
              4'h4: pos_low = 10'h299;
              4'h5: pos_low = 10'h29a;
              4'h6: pos_low = 10'h29b;
              4'h7: pos_low = 10'h29c;
              4'h8: pos_low = 10'h29c;
              4'h9: pos_low = 10'h29d;
              4'ha: pos_low = 10'h29e;
              4'hb: pos_low = 10'h29f;
              4'hc: pos_low = 10'h2a0;
              4'hd: pos_low = 10'h2a1;
              4'he: pos_low = 10'h2a1;
              4'hf: pos_low = 10'h2a2;
              default: pos_low = 10'h000;
            endcase
          end
          6'h31: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h2a3;
              4'h1: pos_low = 10'h2a4;
              4'h2: pos_low = 10'h2a5;
              4'h3: pos_low = 10'h2a6;
              4'h4: pos_low = 10'h2a6;
              4'h5: pos_low = 10'h2a7;
              4'h6: pos_low = 10'h2a8;
              4'h7: pos_low = 10'h2a9;
              4'h8: pos_low = 10'h2aa;
              4'h9: pos_low = 10'h2ab;
              4'ha: pos_low = 10'h2ab;
              4'hb: pos_low = 10'h2ac;
              4'hc: pos_low = 10'h2ad;
              4'hd: pos_low = 10'h2ae;
              4'he: pos_low = 10'h2af;
              4'hf: pos_low = 10'h2af;
              default: pos_low = 10'h000;
            endcase
          end
          6'h32: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h2b0;
              4'h1: pos_low = 10'h2b1;
              4'h2: pos_low = 10'h2b2;
              4'h3: pos_low = 10'h2b3;
              4'h4: pos_low = 10'h2b4;
              4'h5: pos_low = 10'h2b4;
              4'h6: pos_low = 10'h2b5;
              4'h7: pos_low = 10'h2b6;
              4'h8: pos_low = 10'h2b7;
              4'h9: pos_low = 10'h2b8;
              4'ha: pos_low = 10'h2b9;
              4'hb: pos_low = 10'h2b9;
              4'hc: pos_low = 10'h2ba;
              4'hd: pos_low = 10'h2bb;
              4'he: pos_low = 10'h2bc;
              4'hf: pos_low = 10'h2bd;
              default: pos_low = 10'h000;
            endcase
          end
          6'h33: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h2bd;
              4'h1: pos_low = 10'h2be;
              4'h2: pos_low = 10'h2bf;
              4'h3: pos_low = 10'h2c0;
              4'h4: pos_low = 10'h2c1;
              4'h5: pos_low = 10'h2c2;
              4'h6: pos_low = 10'h2c2;
              4'h7: pos_low = 10'h2c3;
              4'h8: pos_low = 10'h2c4;
              4'h9: pos_low = 10'h2c5;
              4'ha: pos_low = 10'h2c6;
              4'hb: pos_low = 10'h2c7;
              4'hc: pos_low = 10'h2c7;
              4'hd: pos_low = 10'h2c8;
              4'he: pos_low = 10'h2c9;
              4'hf: pos_low = 10'h2ca;
              default: pos_low = 10'h000;
            endcase
          end
          6'h34: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h2cb;
              4'h1: pos_low = 10'h2cb;
              4'h2: pos_low = 10'h2cc;
              4'h3: pos_low = 10'h2cd;
              4'h4: pos_low = 10'h2ce;
              4'h5: pos_low = 10'h2cf;
              4'h6: pos_low = 10'h2d0;
              4'h7: pos_low = 10'h2d0;
              4'h8: pos_low = 10'h2d1;
              4'h9: pos_low = 10'h2d2;
              4'ha: pos_low = 10'h2d3;
              4'hb: pos_low = 10'h2d4;
              4'hc: pos_low = 10'h2d4;
              4'hd: pos_low = 10'h2d5;
              4'he: pos_low = 10'h2d6;
              4'hf: pos_low = 10'h2d7;
              default: pos_low = 10'h000;
            endcase
          end
          6'h35: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h2d8;
              4'h1: pos_low = 10'h2d9;
              4'h2: pos_low = 10'h2d9;
              4'h3: pos_low = 10'h2da;
              4'h4: pos_low = 10'h2db;
              4'h5: pos_low = 10'h2dc;
              4'h6: pos_low = 10'h2dd;
              4'h7: pos_low = 10'h2dd;
              4'h8: pos_low = 10'h2de;
              4'h9: pos_low = 10'h2df;
              4'ha: pos_low = 10'h2e0;
              4'hb: pos_low = 10'h2e1;
              4'hc: pos_low = 10'h2e1;
              4'hd: pos_low = 10'h2e2;
              4'he: pos_low = 10'h2e3;
              4'hf: pos_low = 10'h2e4;
              default: pos_low = 10'h000;
            endcase
          end
          6'h36: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h2e5;
              4'h1: pos_low = 10'h2e6;
              4'h2: pos_low = 10'h2e6;
              4'h3: pos_low = 10'h2e7;
              4'h4: pos_low = 10'h2e8;
              4'h5: pos_low = 10'h2e9;
              4'h6: pos_low = 10'h2ea;
              4'h7: pos_low = 10'h2ea;
              4'h8: pos_low = 10'h2eb;
              4'h9: pos_low = 10'h2ec;
              4'ha: pos_low = 10'h2ed;
              4'hb: pos_low = 10'h2ee;
              4'hc: pos_low = 10'h2ef;
              4'hd: pos_low = 10'h2ef;
              4'he: pos_low = 10'h2f0;
              4'hf: pos_low = 10'h2f1;
              default: pos_low = 10'h000;
            endcase
          end
          6'h37: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h2f2;
              4'h1: pos_low = 10'h2f3;
              4'h2: pos_low = 10'h2f3;
              4'h3: pos_low = 10'h2f4;
              4'h4: pos_low = 10'h2f5;
              4'h5: pos_low = 10'h2f6;
              4'h6: pos_low = 10'h2f7;
              4'h7: pos_low = 10'h2f7;
              4'h8: pos_low = 10'h2f8;
              4'h9: pos_low = 10'h2f9;
              4'ha: pos_low = 10'h2fa;
              4'hb: pos_low = 10'h2fb;
              4'hc: pos_low = 10'h2fb;
              4'hd: pos_low = 10'h2fc;
              4'he: pos_low = 10'h2fd;
              4'hf: pos_low = 10'h2fe;
              default: pos_low = 10'h000;
            endcase
          end
          6'h38: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h2ff;
              4'h1: pos_low = 10'h300;
              4'h2: pos_low = 10'h300;
              4'h3: pos_low = 10'h301;
              4'h4: pos_low = 10'h302;
              4'h5: pos_low = 10'h303;
              4'h6: pos_low = 10'h304;
              4'h7: pos_low = 10'h304;
              4'h8: pos_low = 10'h305;
              4'h9: pos_low = 10'h306;
              4'ha: pos_low = 10'h307;
              4'hb: pos_low = 10'h308;
              4'hc: pos_low = 10'h308;
              4'hd: pos_low = 10'h309;
              4'he: pos_low = 10'h30a;
              4'hf: pos_low = 10'h30b;
              default: pos_low = 10'h000;
            endcase
          end
          6'h39: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h30c;
              4'h1: pos_low = 10'h30c;
              4'h2: pos_low = 10'h30d;
              4'h3: pos_low = 10'h30e;
              4'h4: pos_low = 10'h30f;
              4'h5: pos_low = 10'h310;
              4'h6: pos_low = 10'h310;
              4'h7: pos_low = 10'h311;
              4'h8: pos_low = 10'h312;
              4'h9: pos_low = 10'h313;
              4'ha: pos_low = 10'h314;
              4'hb: pos_low = 10'h315;
              4'hc: pos_low = 10'h315;
              4'hd: pos_low = 10'h316;
              4'he: pos_low = 10'h317;
              4'hf: pos_low = 10'h318;
              default: pos_low = 10'h000;
            endcase
          end
          6'h3a: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h319;
              4'h1: pos_low = 10'h319;
              4'h2: pos_low = 10'h31a;
              4'h3: pos_low = 10'h31b;
              4'h4: pos_low = 10'h31c;
              4'h5: pos_low = 10'h31d;
              4'h6: pos_low = 10'h31d;
              4'h7: pos_low = 10'h31e;
              4'h8: pos_low = 10'h31f;
              4'h9: pos_low = 10'h320;
              4'ha: pos_low = 10'h321;
              4'hb: pos_low = 10'h321;
              4'hc: pos_low = 10'h322;
              4'hd: pos_low = 10'h323;
              4'he: pos_low = 10'h324;
              4'hf: pos_low = 10'h325;
              default: pos_low = 10'h000;
            endcase
          end
          6'h3b: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h325;
              4'h1: pos_low = 10'h326;
              4'h2: pos_low = 10'h327;
              4'h3: pos_low = 10'h328;
              4'h4: pos_low = 10'h329;
              4'h5: pos_low = 10'h329;
              4'h6: pos_low = 10'h32a;
              4'h7: pos_low = 10'h32b;
              4'h8: pos_low = 10'h32c;
              4'h9: pos_low = 10'h32d;
              4'ha: pos_low = 10'h32d;
              4'hb: pos_low = 10'h32e;
              4'hc: pos_low = 10'h32f;
              4'hd: pos_low = 10'h330;
              4'he: pos_low = 10'h331;
              4'hf: pos_low = 10'h331;
              default: pos_low = 10'h000;
            endcase
          end
          6'h3c: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h332;
              4'h1: pos_low = 10'h333;
              4'h2: pos_low = 10'h334;
              4'h3: pos_low = 10'h335;
              4'h4: pos_low = 10'h335;
              4'h5: pos_low = 10'h336;
              4'h6: pos_low = 10'h337;
              4'h7: pos_low = 10'h338;
              4'h8: pos_low = 10'h339;
              4'h9: pos_low = 10'h339;
              4'ha: pos_low = 10'h33a;
              4'hb: pos_low = 10'h33b;
              4'hc: pos_low = 10'h33c;
              4'hd: pos_low = 10'h33c;
              4'he: pos_low = 10'h33d;
              4'hf: pos_low = 10'h33e;
              default: pos_low = 10'h000;
            endcase
          end
          6'h3d: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h33f;
              4'h1: pos_low = 10'h340;
              4'h2: pos_low = 10'h340;
              4'h3: pos_low = 10'h341;
              4'h4: pos_low = 10'h342;
              4'h5: pos_low = 10'h343;
              4'h6: pos_low = 10'h344;
              4'h7: pos_low = 10'h344;
              4'h8: pos_low = 10'h345;
              4'h9: pos_low = 10'h346;
              4'ha: pos_low = 10'h347;
              4'hb: pos_low = 10'h348;
              4'hc: pos_low = 10'h348;
              4'hd: pos_low = 10'h349;
              4'he: pos_low = 10'h34a;
              4'hf: pos_low = 10'h34b;
              default: pos_low = 10'h000;
            endcase
          end
          6'h3e: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h34c;
              4'h1: pos_low = 10'h34c;
              4'h2: pos_low = 10'h34d;
              4'h3: pos_low = 10'h34e;
              4'h4: pos_low = 10'h34f;
              4'h5: pos_low = 10'h350;
              4'h6: pos_low = 10'h350;
              4'h7: pos_low = 10'h351;
              4'h8: pos_low = 10'h352;
              4'h9: pos_low = 10'h353;
              4'ha: pos_low = 10'h353;
              4'hb: pos_low = 10'h354;
              4'hc: pos_low = 10'h355;
              4'hd: pos_low = 10'h356;
              4'he: pos_low = 10'h357;
              4'hf: pos_low = 10'h357;
              default: pos_low = 10'h000;
            endcase
          end
          6'h3f: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h358;
              4'h1: pos_low = 10'h359;
              4'h2: pos_low = 10'h35a;
              4'h3: pos_low = 10'h35b;
              4'h4: pos_low = 10'h35b;
              4'h5: pos_low = 10'h35c;
              4'h6: pos_low = 10'h35d;
              4'h7: pos_low = 10'h35e;
              4'h8: pos_low = 10'h35f;
              4'h9: pos_low = 10'h35f;
              4'ha: pos_low = 10'h360;
              4'hb: pos_low = 10'h361;
              4'hc: pos_low = 10'h362;
              4'hd: pos_low = 10'h362;
              4'he: pos_low = 10'h363;
              4'hf: pos_low = 10'h364;
              default: pos_low = 10'h000;
            endcase
          end
          default: begin end
        endcase
      end
      5'h0e: begin
        case (mant[9:4])
          6'h00: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h365;
              4'h1: pos_low = 10'h366;
              4'h2: pos_low = 10'h368;
              4'h3: pos_low = 10'h36a;
              4'h4: pos_low = 10'h36b;
              4'h5: pos_low = 10'h36d;
              4'h6: pos_low = 10'h36e;
              4'h7: pos_low = 10'h370;
              4'h8: pos_low = 10'h371;
              4'h9: pos_low = 10'h373;
              4'ha: pos_low = 10'h375;
              4'hb: pos_low = 10'h376;
              4'hc: pos_low = 10'h378;
              4'hd: pos_low = 10'h379;
              4'he: pos_low = 10'h37b;
              4'hf: pos_low = 10'h37c;
              default: pos_low = 10'h000;
            endcase
          end
          6'h01: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h37e;
              4'h1: pos_low = 10'h37f;
              4'h2: pos_low = 10'h381;
              4'h3: pos_low = 10'h383;
              4'h4: pos_low = 10'h384;
              4'h5: pos_low = 10'h386;
              4'h6: pos_low = 10'h387;
              4'h7: pos_low = 10'h389;
              4'h8: pos_low = 10'h38a;
              4'h9: pos_low = 10'h38c;
              4'ha: pos_low = 10'h38d;
              4'hb: pos_low = 10'h38f;
              4'hc: pos_low = 10'h391;
              4'hd: pos_low = 10'h392;
              4'he: pos_low = 10'h394;
              4'hf: pos_low = 10'h395;
              default: pos_low = 10'h000;
            endcase
          end
          6'h02: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h397;
              4'h1: pos_low = 10'h398;
              4'h2: pos_low = 10'h39a;
              4'h3: pos_low = 10'h39b;
              4'h4: pos_low = 10'h39d;
              4'h5: pos_low = 10'h39f;
              4'h6: pos_low = 10'h3a0;
              4'h7: pos_low = 10'h3a2;
              4'h8: pos_low = 10'h3a3;
              4'h9: pos_low = 10'h3a5;
              4'ha: pos_low = 10'h3a6;
              4'hb: pos_low = 10'h3a8;
              4'hc: pos_low = 10'h3a9;
              4'hd: pos_low = 10'h3ab;
              4'he: pos_low = 10'h3ac;
              4'hf: pos_low = 10'h3ae;
              default: pos_low = 10'h000;
            endcase
          end
          6'h03: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3b0;
              4'h1: pos_low = 10'h3b1;
              4'h2: pos_low = 10'h3b3;
              4'h3: pos_low = 10'h3b4;
              4'h4: pos_low = 10'h3b6;
              4'h5: pos_low = 10'h3b7;
              4'h6: pos_low = 10'h3b9;
              4'h7: pos_low = 10'h3ba;
              4'h8: pos_low = 10'h3bc;
              4'h9: pos_low = 10'h3bd;
              4'ha: pos_low = 10'h3bf;
              4'hb: pos_low = 10'h3c0;
              4'hc: pos_low = 10'h3c2;
              4'hd: pos_low = 10'h3c3;
              4'he: pos_low = 10'h3c5;
              4'hf: pos_low = 10'h3c7;
              default: pos_low = 10'h000;
            endcase
          end
          6'h04: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3c8;
              4'h1: pos_low = 10'h3ca;
              4'h2: pos_low = 10'h3cb;
              4'h3: pos_low = 10'h3cd;
              4'h4: pos_low = 10'h3ce;
              4'h5: pos_low = 10'h3d0;
              4'h6: pos_low = 10'h3d1;
              4'h7: pos_low = 10'h3d3;
              4'h8: pos_low = 10'h3d4;
              4'h9: pos_low = 10'h3d6;
              4'ha: pos_low = 10'h3d7;
              4'hb: pos_low = 10'h3d9;
              4'hc: pos_low = 10'h3da;
              4'hd: pos_low = 10'h3dc;
              4'he: pos_low = 10'h3dd;
              4'hf: pos_low = 10'h3df;
              default: pos_low = 10'h000;
            endcase
          end
          6'h05: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3e0;
              4'h1: pos_low = 10'h3e2;
              4'h2: pos_low = 10'h3e3;
              4'h3: pos_low = 10'h3e5;
              4'h4: pos_low = 10'h3e6;
              4'h5: pos_low = 10'h3e8;
              4'h6: pos_low = 10'h3e9;
              4'h7: pos_low = 10'h3eb;
              4'h8: pos_low = 10'h3ec;
              4'h9: pos_low = 10'h3ee;
              4'ha: pos_low = 10'h3ef;
              4'hb: pos_low = 10'h3f1;
              4'hc: pos_low = 10'h3f3;
              4'hd: pos_low = 10'h3f4;
              4'he: pos_low = 10'h3f6;
              4'hf: pos_low = 10'h3f7;
              default: pos_low = 10'h000;
            endcase
          end
          6'h06: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3f9;
              4'h1: pos_low = 10'h3fa;
              4'h2: pos_low = 10'h3fc;
              4'h3: pos_low = 10'h3fd;
              4'h4: pos_low = 10'h3ff;
              4'h5: pos_low = 10'h000;
              4'h6: pos_low = 10'h001;
              4'h7: pos_low = 10'h002;
              4'h8: pos_low = 10'h002;
              4'h9: pos_low = 10'h003;
              4'ha: pos_low = 10'h004;
              4'hb: pos_low = 10'h005;
              4'hc: pos_low = 10'h005;
              4'hd: pos_low = 10'h006;
              4'he: pos_low = 10'h007;
              4'hf: pos_low = 10'h007;
              default: pos_low = 10'h000;
            endcase
          end
          6'h07: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h008;
              4'h1: pos_low = 10'h009;
              4'h2: pos_low = 10'h00a;
              4'h3: pos_low = 10'h00a;
              4'h4: pos_low = 10'h00b;
              4'h5: pos_low = 10'h00c;
              4'h6: pos_low = 10'h00d;
              4'h7: pos_low = 10'h00d;
              4'h8: pos_low = 10'h00e;
              4'h9: pos_low = 10'h00f;
              4'ha: pos_low = 10'h010;
              4'hb: pos_low = 10'h010;
              4'hc: pos_low = 10'h011;
              4'hd: pos_low = 10'h012;
              4'he: pos_low = 10'h013;
              4'hf: pos_low = 10'h013;
              default: pos_low = 10'h000;
            endcase
          end
          6'h08: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h014;
              4'h1: pos_low = 10'h015;
              4'h2: pos_low = 10'h016;
              4'h3: pos_low = 10'h016;
              4'h4: pos_low = 10'h017;
              4'h5: pos_low = 10'h018;
              4'h6: pos_low = 10'h019;
              4'h7: pos_low = 10'h019;
              4'h8: pos_low = 10'h01a;
              4'h9: pos_low = 10'h01b;
              4'ha: pos_low = 10'h01c;
              4'hb: pos_low = 10'h01c;
              4'hc: pos_low = 10'h01d;
              4'hd: pos_low = 10'h01e;
              4'he: pos_low = 10'h01e;
              4'hf: pos_low = 10'h01f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h09: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h020;
              4'h1: pos_low = 10'h021;
              4'h2: pos_low = 10'h021;
              4'h3: pos_low = 10'h022;
              4'h4: pos_low = 10'h023;
              4'h5: pos_low = 10'h024;
              4'h6: pos_low = 10'h024;
              4'h7: pos_low = 10'h025;
              4'h8: pos_low = 10'h026;
              4'h9: pos_low = 10'h027;
              4'ha: pos_low = 10'h027;
              4'hb: pos_low = 10'h028;
              4'hc: pos_low = 10'h029;
              4'hd: pos_low = 10'h029;
              4'he: pos_low = 10'h02a;
              4'hf: pos_low = 10'h02b;
              default: pos_low = 10'h000;
            endcase
          end
          6'h0a: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h02c;
              4'h1: pos_low = 10'h02c;
              4'h2: pos_low = 10'h02d;
              4'h3: pos_low = 10'h02e;
              4'h4: pos_low = 10'h02f;
              4'h5: pos_low = 10'h02f;
              4'h6: pos_low = 10'h030;
              4'h7: pos_low = 10'h031;
              4'h8: pos_low = 10'h031;
              4'h9: pos_low = 10'h032;
              4'ha: pos_low = 10'h033;
              4'hb: pos_low = 10'h034;
              4'hc: pos_low = 10'h034;
              4'hd: pos_low = 10'h035;
              4'he: pos_low = 10'h036;
              4'hf: pos_low = 10'h037;
              default: pos_low = 10'h000;
            endcase
          end
          6'h0b: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h037;
              4'h1: pos_low = 10'h038;
              4'h2: pos_low = 10'h039;
              4'h3: pos_low = 10'h039;
              4'h4: pos_low = 10'h03a;
              4'h5: pos_low = 10'h03b;
              4'h6: pos_low = 10'h03c;
              4'h7: pos_low = 10'h03c;
              4'h8: pos_low = 10'h03d;
              4'h9: pos_low = 10'h03e;
              4'ha: pos_low = 10'h03e;
              4'hb: pos_low = 10'h03f;
              4'hc: pos_low = 10'h040;
              4'hd: pos_low = 10'h041;
              4'he: pos_low = 10'h041;
              4'hf: pos_low = 10'h042;
              default: pos_low = 10'h000;
            endcase
          end
          6'h0c: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h043;
              4'h1: pos_low = 10'h043;
              4'h2: pos_low = 10'h044;
              4'h3: pos_low = 10'h045;
              4'h4: pos_low = 10'h046;
              4'h5: pos_low = 10'h046;
              4'h6: pos_low = 10'h047;
              4'h7: pos_low = 10'h048;
              4'h8: pos_low = 10'h048;
              4'h9: pos_low = 10'h049;
              4'ha: pos_low = 10'h04a;
              4'hb: pos_low = 10'h04b;
              4'hc: pos_low = 10'h04b;
              4'hd: pos_low = 10'h04c;
              4'he: pos_low = 10'h04d;
              4'hf: pos_low = 10'h04d;
              default: pos_low = 10'h000;
            endcase
          end
          6'h0d: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h04e;
              4'h1: pos_low = 10'h04f;
              4'h2: pos_low = 10'h050;
              4'h3: pos_low = 10'h050;
              4'h4: pos_low = 10'h051;
              4'h5: pos_low = 10'h052;
              4'h6: pos_low = 10'h052;
              4'h7: pos_low = 10'h053;
              4'h8: pos_low = 10'h054;
              4'h9: pos_low = 10'h055;
              4'ha: pos_low = 10'h055;
              4'hb: pos_low = 10'h056;
              4'hc: pos_low = 10'h057;
              4'hd: pos_low = 10'h057;
              4'he: pos_low = 10'h058;
              4'hf: pos_low = 10'h059;
              default: pos_low = 10'h000;
            endcase
          end
          6'h0e: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h059;
              4'h1: pos_low = 10'h05a;
              4'h2: pos_low = 10'h05b;
              4'h3: pos_low = 10'h05c;
              4'h4: pos_low = 10'h05c;
              4'h5: pos_low = 10'h05d;
              4'h6: pos_low = 10'h05e;
              4'h7: pos_low = 10'h05e;
              4'h8: pos_low = 10'h05f;
              4'h9: pos_low = 10'h060;
              4'ha: pos_low = 10'h060;
              4'hb: pos_low = 10'h061;
              4'hc: pos_low = 10'h062;
              4'hd: pos_low = 10'h063;
              4'he: pos_low = 10'h063;
              4'hf: pos_low = 10'h064;
              default: pos_low = 10'h000;
            endcase
          end
          6'h0f: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h065;
              4'h1: pos_low = 10'h065;
              4'h2: pos_low = 10'h066;
              4'h3: pos_low = 10'h067;
              4'h4: pos_low = 10'h067;
              4'h5: pos_low = 10'h068;
              4'h6: pos_low = 10'h069;
              4'h7: pos_low = 10'h06a;
              4'h8: pos_low = 10'h06a;
              4'h9: pos_low = 10'h06b;
              4'ha: pos_low = 10'h06c;
              4'hb: pos_low = 10'h06c;
              4'hc: pos_low = 10'h06d;
              4'hd: pos_low = 10'h06e;
              4'he: pos_low = 10'h06e;
              4'hf: pos_low = 10'h06f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h10: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h070;
              4'h1: pos_low = 10'h071;
              4'h2: pos_low = 10'h071;
              4'h3: pos_low = 10'h072;
              4'h4: pos_low = 10'h073;
              4'h5: pos_low = 10'h073;
              4'h6: pos_low = 10'h074;
              4'h7: pos_low = 10'h075;
              4'h8: pos_low = 10'h075;
              4'h9: pos_low = 10'h076;
              4'ha: pos_low = 10'h077;
              4'hb: pos_low = 10'h077;
              4'hc: pos_low = 10'h078;
              4'hd: pos_low = 10'h079;
              4'he: pos_low = 10'h079;
              4'hf: pos_low = 10'h07a;
              default: pos_low = 10'h000;
            endcase
          end
          6'h11: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h07b;
              4'h1: pos_low = 10'h07c;
              4'h2: pos_low = 10'h07c;
              4'h3: pos_low = 10'h07d;
              4'h4: pos_low = 10'h07e;
              4'h5: pos_low = 10'h07e;
              4'h6: pos_low = 10'h07f;
              4'h7: pos_low = 10'h080;
              4'h8: pos_low = 10'h080;
              4'h9: pos_low = 10'h081;
              4'ha: pos_low = 10'h082;
              4'hb: pos_low = 10'h082;
              4'hc: pos_low = 10'h083;
              4'hd: pos_low = 10'h084;
              4'he: pos_low = 10'h084;
              4'hf: pos_low = 10'h085;
              default: pos_low = 10'h000;
            endcase
          end
          6'h12: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h086;
              4'h1: pos_low = 10'h086;
              4'h2: pos_low = 10'h087;
              4'h3: pos_low = 10'h088;
              4'h4: pos_low = 10'h089;
              4'h5: pos_low = 10'h089;
              4'h6: pos_low = 10'h08a;
              4'h7: pos_low = 10'h08b;
              4'h8: pos_low = 10'h08b;
              4'h9: pos_low = 10'h08c;
              4'ha: pos_low = 10'h08d;
              4'hb: pos_low = 10'h08d;
              4'hc: pos_low = 10'h08e;
              4'hd: pos_low = 10'h08f;
              4'he: pos_low = 10'h08f;
              4'hf: pos_low = 10'h090;
              default: pos_low = 10'h000;
            endcase
          end
          6'h13: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h091;
              4'h1: pos_low = 10'h091;
              4'h2: pos_low = 10'h092;
              4'h3: pos_low = 10'h093;
              4'h4: pos_low = 10'h093;
              4'h5: pos_low = 10'h094;
              4'h6: pos_low = 10'h095;
              4'h7: pos_low = 10'h095;
              4'h8: pos_low = 10'h096;
              4'h9: pos_low = 10'h097;
              4'ha: pos_low = 10'h097;
              4'hb: pos_low = 10'h098;
              4'hc: pos_low = 10'h099;
              4'hd: pos_low = 10'h099;
              4'he: pos_low = 10'h09a;
              4'hf: pos_low = 10'h09b;
              default: pos_low = 10'h000;
            endcase
          end
          6'h14: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h09b;
              4'h1: pos_low = 10'h09c;
              4'h2: pos_low = 10'h09d;
              4'h3: pos_low = 10'h09d;
              4'h4: pos_low = 10'h09e;
              4'h5: pos_low = 10'h09f;
              4'h6: pos_low = 10'h09f;
              4'h7: pos_low = 10'h0a0;
              4'h8: pos_low = 10'h0a1;
              4'h9: pos_low = 10'h0a1;
              4'ha: pos_low = 10'h0a2;
              4'hb: pos_low = 10'h0a3;
              4'hc: pos_low = 10'h0a3;
              4'hd: pos_low = 10'h0a4;
              4'he: pos_low = 10'h0a5;
              4'hf: pos_low = 10'h0a5;
              default: pos_low = 10'h000;
            endcase
          end
          6'h15: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h0a6;
              4'h1: pos_low = 10'h0a7;
              4'h2: pos_low = 10'h0a7;
              4'h3: pos_low = 10'h0a8;
              4'h4: pos_low = 10'h0a9;
              4'h5: pos_low = 10'h0a9;
              4'h6: pos_low = 10'h0aa;
              4'h7: pos_low = 10'h0ab;
              4'h8: pos_low = 10'h0ab;
              4'h9: pos_low = 10'h0ac;
              4'ha: pos_low = 10'h0ad;
              4'hb: pos_low = 10'h0ad;
              4'hc: pos_low = 10'h0ae;
              4'hd: pos_low = 10'h0af;
              4'he: pos_low = 10'h0af;
              4'hf: pos_low = 10'h0b0;
              default: pos_low = 10'h000;
            endcase
          end
          6'h16: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h0b1;
              4'h1: pos_low = 10'h0b1;
              4'h2: pos_low = 10'h0b2;
              4'h3: pos_low = 10'h0b3;
              4'h4: pos_low = 10'h0b3;
              4'h5: pos_low = 10'h0b4;
              4'h6: pos_low = 10'h0b4;
              4'h7: pos_low = 10'h0b5;
              4'h8: pos_low = 10'h0b6;
              4'h9: pos_low = 10'h0b6;
              4'ha: pos_low = 10'h0b7;
              4'hb: pos_low = 10'h0b8;
              4'hc: pos_low = 10'h0b8;
              4'hd: pos_low = 10'h0b9;
              4'he: pos_low = 10'h0ba;
              4'hf: pos_low = 10'h0ba;
              default: pos_low = 10'h000;
            endcase
          end
          6'h17: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h0bb;
              4'h1: pos_low = 10'h0bc;
              4'h2: pos_low = 10'h0bc;
              4'h3: pos_low = 10'h0bd;
              4'h4: pos_low = 10'h0be;
              4'h5: pos_low = 10'h0be;
              4'h6: pos_low = 10'h0bf;
              4'h7: pos_low = 10'h0c0;
              4'h8: pos_low = 10'h0c0;
              4'h9: pos_low = 10'h0c1;
              4'ha: pos_low = 10'h0c2;
              4'hb: pos_low = 10'h0c2;
              4'hc: pos_low = 10'h0c3;
              4'hd: pos_low = 10'h0c3;
              4'he: pos_low = 10'h0c4;
              4'hf: pos_low = 10'h0c5;
              default: pos_low = 10'h000;
            endcase
          end
          6'h18: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h0c5;
              4'h1: pos_low = 10'h0c6;
              4'h2: pos_low = 10'h0c7;
              4'h3: pos_low = 10'h0c7;
              4'h4: pos_low = 10'h0c8;
              4'h5: pos_low = 10'h0c9;
              4'h6: pos_low = 10'h0c9;
              4'h7: pos_low = 10'h0ca;
              4'h8: pos_low = 10'h0cb;
              4'h9: pos_low = 10'h0cb;
              4'ha: pos_low = 10'h0cc;
              4'hb: pos_low = 10'h0cc;
              4'hc: pos_low = 10'h0cd;
              4'hd: pos_low = 10'h0ce;
              4'he: pos_low = 10'h0ce;
              4'hf: pos_low = 10'h0cf;
              default: pos_low = 10'h000;
            endcase
          end
          6'h19: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h0d0;
              4'h1: pos_low = 10'h0d0;
              4'h2: pos_low = 10'h0d1;
              4'h3: pos_low = 10'h0d2;
              4'h4: pos_low = 10'h0d2;
              4'h5: pos_low = 10'h0d3;
              4'h6: pos_low = 10'h0d3;
              4'h7: pos_low = 10'h0d4;
              4'h8: pos_low = 10'h0d5;
              4'h9: pos_low = 10'h0d5;
              4'ha: pos_low = 10'h0d6;
              4'hb: pos_low = 10'h0d7;
              4'hc: pos_low = 10'h0d7;
              4'hd: pos_low = 10'h0d8;
              4'he: pos_low = 10'h0d9;
              4'hf: pos_low = 10'h0d9;
              default: pos_low = 10'h000;
            endcase
          end
          6'h1a: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h0da;
              4'h1: pos_low = 10'h0da;
              4'h2: pos_low = 10'h0db;
              4'h3: pos_low = 10'h0dc;
              4'h4: pos_low = 10'h0dc;
              4'h5: pos_low = 10'h0dd;
              4'h6: pos_low = 10'h0de;
              4'h7: pos_low = 10'h0de;
              4'h8: pos_low = 10'h0df;
              4'h9: pos_low = 10'h0df;
              4'ha: pos_low = 10'h0e0;
              4'hb: pos_low = 10'h0e1;
              4'hc: pos_low = 10'h0e1;
              4'hd: pos_low = 10'h0e2;
              4'he: pos_low = 10'h0e3;
              4'hf: pos_low = 10'h0e3;
              default: pos_low = 10'h000;
            endcase
          end
          6'h1b: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h0e4;
              4'h1: pos_low = 10'h0e4;
              4'h2: pos_low = 10'h0e5;
              4'h3: pos_low = 10'h0e6;
              4'h4: pos_low = 10'h0e6;
              4'h5: pos_low = 10'h0e7;
              4'h6: pos_low = 10'h0e8;
              4'h7: pos_low = 10'h0e8;
              4'h8: pos_low = 10'h0e9;
              4'h9: pos_low = 10'h0e9;
              4'ha: pos_low = 10'h0ea;
              4'hb: pos_low = 10'h0eb;
              4'hc: pos_low = 10'h0eb;
              4'hd: pos_low = 10'h0ec;
              4'he: pos_low = 10'h0ed;
              4'hf: pos_low = 10'h0ed;
              default: pos_low = 10'h000;
            endcase
          end
          6'h1c: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h0ee;
              4'h1: pos_low = 10'h0ee;
              4'h2: pos_low = 10'h0ef;
              4'h3: pos_low = 10'h0f0;
              4'h4: pos_low = 10'h0f0;
              4'h5: pos_low = 10'h0f1;
              4'h6: pos_low = 10'h0f2;
              4'h7: pos_low = 10'h0f2;
              4'h8: pos_low = 10'h0f3;
              4'h9: pos_low = 10'h0f3;
              4'ha: pos_low = 10'h0f4;
              4'hb: pos_low = 10'h0f5;
              4'hc: pos_low = 10'h0f5;
              4'hd: pos_low = 10'h0f6;
              4'he: pos_low = 10'h0f6;
              4'hf: pos_low = 10'h0f7;
              default: pos_low = 10'h000;
            endcase
          end
          6'h1d: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h0f8;
              4'h1: pos_low = 10'h0f8;
              4'h2: pos_low = 10'h0f9;
              4'h3: pos_low = 10'h0fa;
              4'h4: pos_low = 10'h0fa;
              4'h5: pos_low = 10'h0fb;
              4'h6: pos_low = 10'h0fb;
              4'h7: pos_low = 10'h0fc;
              4'h8: pos_low = 10'h0fd;
              4'h9: pos_low = 10'h0fd;
              4'ha: pos_low = 10'h0fe;
              4'hb: pos_low = 10'h0fe;
              4'hc: pos_low = 10'h0ff;
              4'hd: pos_low = 10'h100;
              4'he: pos_low = 10'h100;
              4'hf: pos_low = 10'h101;
              default: pos_low = 10'h000;
            endcase
          end
          6'h1e: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h102;
              4'h1: pos_low = 10'h102;
              4'h2: pos_low = 10'h103;
              4'h3: pos_low = 10'h103;
              4'h4: pos_low = 10'h104;
              4'h5: pos_low = 10'h105;
              4'h6: pos_low = 10'h105;
              4'h7: pos_low = 10'h106;
              4'h8: pos_low = 10'h106;
              4'h9: pos_low = 10'h107;
              4'ha: pos_low = 10'h108;
              4'hb: pos_low = 10'h108;
              4'hc: pos_low = 10'h109;
              4'hd: pos_low = 10'h109;
              4'he: pos_low = 10'h10a;
              4'hf: pos_low = 10'h10b;
              default: pos_low = 10'h000;
            endcase
          end
          6'h1f: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h10b;
              4'h1: pos_low = 10'h10c;
              4'h2: pos_low = 10'h10c;
              4'h3: pos_low = 10'h10d;
              4'h4: pos_low = 10'h10e;
              4'h5: pos_low = 10'h10e;
              4'h6: pos_low = 10'h10f;
              4'h7: pos_low = 10'h10f;
              4'h8: pos_low = 10'h110;
              4'h9: pos_low = 10'h111;
              4'ha: pos_low = 10'h111;
              4'hb: pos_low = 10'h112;
              4'hc: pos_low = 10'h112;
              4'hd: pos_low = 10'h113;
              4'he: pos_low = 10'h114;
              4'hf: pos_low = 10'h114;
              default: pos_low = 10'h000;
            endcase
          end
          6'h20: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h115;
              4'h1: pos_low = 10'h115;
              4'h2: pos_low = 10'h116;
              4'h3: pos_low = 10'h117;
              4'h4: pos_low = 10'h117;
              4'h5: pos_low = 10'h118;
              4'h6: pos_low = 10'h118;
              4'h7: pos_low = 10'h119;
              4'h8: pos_low = 10'h11a;
              4'h9: pos_low = 10'h11a;
              4'ha: pos_low = 10'h11b;
              4'hb: pos_low = 10'h11b;
              4'hc: pos_low = 10'h11c;
              4'hd: pos_low = 10'h11d;
              4'he: pos_low = 10'h11d;
              4'hf: pos_low = 10'h11e;
              default: pos_low = 10'h000;
            endcase
          end
          6'h21: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h11e;
              4'h1: pos_low = 10'h11f;
              4'h2: pos_low = 10'h11f;
              4'h3: pos_low = 10'h120;
              4'h4: pos_low = 10'h121;
              4'h5: pos_low = 10'h121;
              4'h6: pos_low = 10'h122;
              4'h7: pos_low = 10'h122;
              4'h8: pos_low = 10'h123;
              4'h9: pos_low = 10'h124;
              4'ha: pos_low = 10'h124;
              4'hb: pos_low = 10'h125;
              4'hc: pos_low = 10'h125;
              4'hd: pos_low = 10'h126;
              4'he: pos_low = 10'h127;
              4'hf: pos_low = 10'h127;
              default: pos_low = 10'h000;
            endcase
          end
          6'h22: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h128;
              4'h1: pos_low = 10'h128;
              4'h2: pos_low = 10'h129;
              4'h3: pos_low = 10'h129;
              4'h4: pos_low = 10'h12a;
              4'h5: pos_low = 10'h12b;
              4'h6: pos_low = 10'h12b;
              4'h7: pos_low = 10'h12c;
              4'h8: pos_low = 10'h12c;
              4'h9: pos_low = 10'h12d;
              4'ha: pos_low = 10'h12e;
              4'hb: pos_low = 10'h12e;
              4'hc: pos_low = 10'h12f;
              4'hd: pos_low = 10'h12f;
              4'he: pos_low = 10'h130;
              4'hf: pos_low = 10'h130;
              default: pos_low = 10'h000;
            endcase
          end
          6'h23: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h131;
              4'h1: pos_low = 10'h132;
              4'h2: pos_low = 10'h132;
              4'h3: pos_low = 10'h133;
              4'h4: pos_low = 10'h133;
              4'h5: pos_low = 10'h134;
              4'h6: pos_low = 10'h134;
              4'h7: pos_low = 10'h135;
              4'h8: pos_low = 10'h136;
              4'h9: pos_low = 10'h136;
              4'ha: pos_low = 10'h137;
              4'hb: pos_low = 10'h137;
              4'hc: pos_low = 10'h138;
              4'hd: pos_low = 10'h138;
              4'he: pos_low = 10'h139;
              4'hf: pos_low = 10'h13a;
              default: pos_low = 10'h000;
            endcase
          end
          6'h24: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h13a;
              4'h1: pos_low = 10'h13b;
              4'h2: pos_low = 10'h13b;
              4'h3: pos_low = 10'h13c;
              4'h4: pos_low = 10'h13d;
              4'h5: pos_low = 10'h13d;
              4'h6: pos_low = 10'h13e;
              4'h7: pos_low = 10'h13e;
              4'h8: pos_low = 10'h13f;
              4'h9: pos_low = 10'h13f;
              4'ha: pos_low = 10'h140;
              4'hb: pos_low = 10'h140;
              4'hc: pos_low = 10'h141;
              4'hd: pos_low = 10'h142;
              4'he: pos_low = 10'h142;
              4'hf: pos_low = 10'h143;
              default: pos_low = 10'h000;
            endcase
          end
          6'h25: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h143;
              4'h1: pos_low = 10'h144;
              4'h2: pos_low = 10'h144;
              4'h3: pos_low = 10'h145;
              4'h4: pos_low = 10'h146;
              4'h5: pos_low = 10'h146;
              4'h6: pos_low = 10'h147;
              4'h7: pos_low = 10'h147;
              4'h8: pos_low = 10'h148;
              4'h9: pos_low = 10'h148;
              4'ha: pos_low = 10'h149;
              4'hb: pos_low = 10'h14a;
              4'hc: pos_low = 10'h14a;
              4'hd: pos_low = 10'h14b;
              4'he: pos_low = 10'h14b;
              4'hf: pos_low = 10'h14c;
              default: pos_low = 10'h000;
            endcase
          end
          6'h26: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h14c;
              4'h1: pos_low = 10'h14d;
              4'h2: pos_low = 10'h14d;
              4'h3: pos_low = 10'h14e;
              4'h4: pos_low = 10'h14f;
              4'h5: pos_low = 10'h14f;
              4'h6: pos_low = 10'h150;
              4'h7: pos_low = 10'h150;
              4'h8: pos_low = 10'h151;
              4'h9: pos_low = 10'h151;
              4'ha: pos_low = 10'h152;
              4'hb: pos_low = 10'h153;
              4'hc: pos_low = 10'h153;
              4'hd: pos_low = 10'h154;
              4'he: pos_low = 10'h154;
              4'hf: pos_low = 10'h155;
              default: pos_low = 10'h000;
            endcase
          end
          6'h27: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h155;
              4'h1: pos_low = 10'h156;
              4'h2: pos_low = 10'h156;
              4'h3: pos_low = 10'h157;
              4'h4: pos_low = 10'h158;
              4'h5: pos_low = 10'h158;
              4'h6: pos_low = 10'h159;
              4'h7: pos_low = 10'h159;
              4'h8: pos_low = 10'h15a;
              4'h9: pos_low = 10'h15a;
              4'ha: pos_low = 10'h15b;
              4'hb: pos_low = 10'h15b;
              4'hc: pos_low = 10'h15c;
              4'hd: pos_low = 10'h15c;
              4'he: pos_low = 10'h15d;
              4'hf: pos_low = 10'h15e;
              default: pos_low = 10'h000;
            endcase
          end
          6'h28: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h15e;
              4'h1: pos_low = 10'h15f;
              4'h2: pos_low = 10'h15f;
              4'h3: pos_low = 10'h160;
              4'h4: pos_low = 10'h160;
              4'h5: pos_low = 10'h161;
              4'h6: pos_low = 10'h161;
              4'h7: pos_low = 10'h162;
              4'h8: pos_low = 10'h163;
              4'h9: pos_low = 10'h163;
              4'ha: pos_low = 10'h164;
              4'hb: pos_low = 10'h164;
              4'hc: pos_low = 10'h165;
              4'hd: pos_low = 10'h165;
              4'he: pos_low = 10'h166;
              4'hf: pos_low = 10'h166;
              default: pos_low = 10'h000;
            endcase
          end
          6'h29: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h167;
              4'h1: pos_low = 10'h167;
              4'h2: pos_low = 10'h168;
              4'h3: pos_low = 10'h169;
              4'h4: pos_low = 10'h169;
              4'h5: pos_low = 10'h16a;
              4'h6: pos_low = 10'h16a;
              4'h7: pos_low = 10'h16b;
              4'h8: pos_low = 10'h16b;
              4'h9: pos_low = 10'h16c;
              4'ha: pos_low = 10'h16c;
              4'hb: pos_low = 10'h16d;
              4'hc: pos_low = 10'h16d;
              4'hd: pos_low = 10'h16e;
              4'he: pos_low = 10'h16e;
              4'hf: pos_low = 10'h16f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h2a: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h170;
              4'h1: pos_low = 10'h170;
              4'h2: pos_low = 10'h171;
              4'h3: pos_low = 10'h171;
              4'h4: pos_low = 10'h172;
              4'h5: pos_low = 10'h172;
              4'h6: pos_low = 10'h173;
              4'h7: pos_low = 10'h173;
              4'h8: pos_low = 10'h174;
              4'h9: pos_low = 10'h174;
              4'ha: pos_low = 10'h175;
              4'hb: pos_low = 10'h175;
              4'hc: pos_low = 10'h176;
              4'hd: pos_low = 10'h177;
              4'he: pos_low = 10'h177;
              4'hf: pos_low = 10'h178;
              default: pos_low = 10'h000;
            endcase
          end
          6'h2b: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h178;
              4'h1: pos_low = 10'h179;
              4'h2: pos_low = 10'h179;
              4'h3: pos_low = 10'h17a;
              4'h4: pos_low = 10'h17a;
              4'h5: pos_low = 10'h17b;
              4'h6: pos_low = 10'h17b;
              4'h7: pos_low = 10'h17c;
              4'h8: pos_low = 10'h17c;
              4'h9: pos_low = 10'h17d;
              4'ha: pos_low = 10'h17d;
              4'hb: pos_low = 10'h17e;
              4'hc: pos_low = 10'h17e;
              4'hd: pos_low = 10'h17f;
              4'he: pos_low = 10'h180;
              4'hf: pos_low = 10'h180;
              default: pos_low = 10'h000;
            endcase
          end
          6'h2c: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h181;
              4'h1: pos_low = 10'h181;
              4'h2: pos_low = 10'h182;
              4'h3: pos_low = 10'h182;
              4'h4: pos_low = 10'h183;
              4'h5: pos_low = 10'h183;
              4'h6: pos_low = 10'h184;
              4'h7: pos_low = 10'h184;
              4'h8: pos_low = 10'h185;
              4'h9: pos_low = 10'h185;
              4'ha: pos_low = 10'h186;
              4'hb: pos_low = 10'h186;
              4'hc: pos_low = 10'h187;
              4'hd: pos_low = 10'h187;
              4'he: pos_low = 10'h188;
              4'hf: pos_low = 10'h188;
              default: pos_low = 10'h000;
            endcase
          end
          6'h2d: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h189;
              4'h1: pos_low = 10'h18a;
              4'h2: pos_low = 10'h18a;
              4'h3: pos_low = 10'h18b;
              4'h4: pos_low = 10'h18b;
              4'h5: pos_low = 10'h18c;
              4'h6: pos_low = 10'h18c;
              4'h7: pos_low = 10'h18d;
              4'h8: pos_low = 10'h18d;
              4'h9: pos_low = 10'h18e;
              4'ha: pos_low = 10'h18e;
              4'hb: pos_low = 10'h18f;
              4'hc: pos_low = 10'h18f;
              4'hd: pos_low = 10'h190;
              4'he: pos_low = 10'h190;
              4'hf: pos_low = 10'h191;
              default: pos_low = 10'h000;
            endcase
          end
          6'h2e: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h191;
              4'h1: pos_low = 10'h192;
              4'h2: pos_low = 10'h192;
              4'h3: pos_low = 10'h193;
              4'h4: pos_low = 10'h193;
              4'h5: pos_low = 10'h194;
              4'h6: pos_low = 10'h194;
              4'h7: pos_low = 10'h195;
              4'h8: pos_low = 10'h195;
              4'h9: pos_low = 10'h196;
              4'ha: pos_low = 10'h196;
              4'hb: pos_low = 10'h197;
              4'hc: pos_low = 10'h197;
              4'hd: pos_low = 10'h198;
              4'he: pos_low = 10'h198;
              4'hf: pos_low = 10'h199;
              default: pos_low = 10'h000;
            endcase
          end
          6'h2f: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h199;
              4'h1: pos_low = 10'h19a;
              4'h2: pos_low = 10'h19b;
              4'h3: pos_low = 10'h19b;
              4'h4: pos_low = 10'h19c;
              4'h5: pos_low = 10'h19c;
              4'h6: pos_low = 10'h19d;
              4'h7: pos_low = 10'h19d;
              4'h8: pos_low = 10'h19e;
              4'h9: pos_low = 10'h19e;
              4'ha: pos_low = 10'h19f;
              4'hb: pos_low = 10'h19f;
              4'hc: pos_low = 10'h1a0;
              4'hd: pos_low = 10'h1a0;
              4'he: pos_low = 10'h1a1;
              4'hf: pos_low = 10'h1a1;
              default: pos_low = 10'h000;
            endcase
          end
          6'h30: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h1a2;
              4'h1: pos_low = 10'h1a2;
              4'h2: pos_low = 10'h1a3;
              4'h3: pos_low = 10'h1a3;
              4'h4: pos_low = 10'h1a4;
              4'h5: pos_low = 10'h1a4;
              4'h6: pos_low = 10'h1a5;
              4'h7: pos_low = 10'h1a5;
              4'h8: pos_low = 10'h1a6;
              4'h9: pos_low = 10'h1a6;
              4'ha: pos_low = 10'h1a7;
              4'hb: pos_low = 10'h1a7;
              4'hc: pos_low = 10'h1a8;
              4'hd: pos_low = 10'h1a8;
              4'he: pos_low = 10'h1a9;
              4'hf: pos_low = 10'h1a9;
              default: pos_low = 10'h000;
            endcase
          end
          6'h31: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h1aa;
              4'h1: pos_low = 10'h1aa;
              4'h2: pos_low = 10'h1ab;
              4'h3: pos_low = 10'h1ab;
              4'h4: pos_low = 10'h1ac;
              4'h5: pos_low = 10'h1ac;
              4'h6: pos_low = 10'h1ad;
              4'h7: pos_low = 10'h1ad;
              4'h8: pos_low = 10'h1ae;
              4'h9: pos_low = 10'h1ae;
              4'ha: pos_low = 10'h1af;
              4'hb: pos_low = 10'h1af;
              4'hc: pos_low = 10'h1b0;
              4'hd: pos_low = 10'h1b0;
              4'he: pos_low = 10'h1b1;
              4'hf: pos_low = 10'h1b1;
              default: pos_low = 10'h000;
            endcase
          end
          6'h32: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h1b2;
              4'h1: pos_low = 10'h1b2;
              4'h2: pos_low = 10'h1b3;
              4'h3: pos_low = 10'h1b3;
              4'h4: pos_low = 10'h1b4;
              4'h5: pos_low = 10'h1b4;
              4'h6: pos_low = 10'h1b5;
              4'h7: pos_low = 10'h1b5;
              4'h8: pos_low = 10'h1b6;
              4'h9: pos_low = 10'h1b6;
              4'ha: pos_low = 10'h1b6;
              4'hb: pos_low = 10'h1b7;
              4'hc: pos_low = 10'h1b7;
              4'hd: pos_low = 10'h1b8;
              4'he: pos_low = 10'h1b8;
              4'hf: pos_low = 10'h1b9;
              default: pos_low = 10'h000;
            endcase
          end
          6'h33: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h1b9;
              4'h1: pos_low = 10'h1ba;
              4'h2: pos_low = 10'h1ba;
              4'h3: pos_low = 10'h1bb;
              4'h4: pos_low = 10'h1bb;
              4'h5: pos_low = 10'h1bc;
              4'h6: pos_low = 10'h1bc;
              4'h7: pos_low = 10'h1bd;
              4'h8: pos_low = 10'h1bd;
              4'h9: pos_low = 10'h1be;
              4'ha: pos_low = 10'h1be;
              4'hb: pos_low = 10'h1bf;
              4'hc: pos_low = 10'h1bf;
              4'hd: pos_low = 10'h1c0;
              4'he: pos_low = 10'h1c0;
              4'hf: pos_low = 10'h1c1;
              default: pos_low = 10'h000;
            endcase
          end
          6'h34: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h1c1;
              4'h1: pos_low = 10'h1c2;
              4'h2: pos_low = 10'h1c2;
              4'h3: pos_low = 10'h1c3;
              4'h4: pos_low = 10'h1c3;
              4'h5: pos_low = 10'h1c4;
              4'h6: pos_low = 10'h1c4;
              4'h7: pos_low = 10'h1c5;
              4'h8: pos_low = 10'h1c5;
              4'h9: pos_low = 10'h1c6;
              4'ha: pos_low = 10'h1c6;
              4'hb: pos_low = 10'h1c6;
              4'hc: pos_low = 10'h1c7;
              4'hd: pos_low = 10'h1c7;
              4'he: pos_low = 10'h1c8;
              4'hf: pos_low = 10'h1c8;
              default: pos_low = 10'h000;
            endcase
          end
          6'h35: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h1c9;
              4'h1: pos_low = 10'h1c9;
              4'h2: pos_low = 10'h1ca;
              4'h3: pos_low = 10'h1ca;
              4'h4: pos_low = 10'h1cb;
              4'h5: pos_low = 10'h1cb;
              4'h6: pos_low = 10'h1cc;
              4'h7: pos_low = 10'h1cc;
              4'h8: pos_low = 10'h1cd;
              4'h9: pos_low = 10'h1cd;
              4'ha: pos_low = 10'h1ce;
              4'hb: pos_low = 10'h1ce;
              4'hc: pos_low = 10'h1cf;
              4'hd: pos_low = 10'h1cf;
              4'he: pos_low = 10'h1d0;
              4'hf: pos_low = 10'h1d0;
              default: pos_low = 10'h000;
            endcase
          end
          6'h36: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h1d0;
              4'h1: pos_low = 10'h1d1;
              4'h2: pos_low = 10'h1d1;
              4'h3: pos_low = 10'h1d2;
              4'h4: pos_low = 10'h1d2;
              4'h5: pos_low = 10'h1d3;
              4'h6: pos_low = 10'h1d3;
              4'h7: pos_low = 10'h1d4;
              4'h8: pos_low = 10'h1d4;
              4'h9: pos_low = 10'h1d5;
              4'ha: pos_low = 10'h1d5;
              4'hb: pos_low = 10'h1d6;
              4'hc: pos_low = 10'h1d6;
              4'hd: pos_low = 10'h1d7;
              4'he: pos_low = 10'h1d7;
              4'hf: pos_low = 10'h1d7;
              default: pos_low = 10'h000;
            endcase
          end
          6'h37: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h1d8;
              4'h1: pos_low = 10'h1d8;
              4'h2: pos_low = 10'h1d9;
              4'h3: pos_low = 10'h1d9;
              4'h4: pos_low = 10'h1da;
              4'h5: pos_low = 10'h1da;
              4'h6: pos_low = 10'h1db;
              4'h7: pos_low = 10'h1db;
              4'h8: pos_low = 10'h1dc;
              4'h9: pos_low = 10'h1dc;
              4'ha: pos_low = 10'h1dd;
              4'hb: pos_low = 10'h1dd;
              4'hc: pos_low = 10'h1de;
              4'hd: pos_low = 10'h1de;
              4'he: pos_low = 10'h1de;
              4'hf: pos_low = 10'h1df;
              default: pos_low = 10'h000;
            endcase
          end
          6'h38: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h1df;
              4'h1: pos_low = 10'h1e0;
              4'h2: pos_low = 10'h1e0;
              4'h3: pos_low = 10'h1e1;
              4'h4: pos_low = 10'h1e1;
              4'h5: pos_low = 10'h1e2;
              4'h6: pos_low = 10'h1e2;
              4'h7: pos_low = 10'h1e3;
              4'h8: pos_low = 10'h1e3;
              4'h9: pos_low = 10'h1e4;
              4'ha: pos_low = 10'h1e4;
              4'hb: pos_low = 10'h1e4;
              4'hc: pos_low = 10'h1e5;
              4'hd: pos_low = 10'h1e5;
              4'he: pos_low = 10'h1e6;
              4'hf: pos_low = 10'h1e6;
              default: pos_low = 10'h000;
            endcase
          end
          6'h39: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h1e7;
              4'h1: pos_low = 10'h1e7;
              4'h2: pos_low = 10'h1e8;
              4'h3: pos_low = 10'h1e8;
              4'h4: pos_low = 10'h1e9;
              4'h5: pos_low = 10'h1e9;
              4'h6: pos_low = 10'h1e9;
              4'h7: pos_low = 10'h1ea;
              4'h8: pos_low = 10'h1ea;
              4'h9: pos_low = 10'h1eb;
              4'ha: pos_low = 10'h1eb;
              4'hb: pos_low = 10'h1ec;
              4'hc: pos_low = 10'h1ec;
              4'hd: pos_low = 10'h1ed;
              4'he: pos_low = 10'h1ed;
              4'hf: pos_low = 10'h1ee;
              default: pos_low = 10'h000;
            endcase
          end
          6'h3a: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h1ee;
              4'h1: pos_low = 10'h1ee;
              4'h2: pos_low = 10'h1ef;
              4'h3: pos_low = 10'h1ef;
              4'h4: pos_low = 10'h1f0;
              4'h5: pos_low = 10'h1f0;
              4'h6: pos_low = 10'h1f1;
              4'h7: pos_low = 10'h1f1;
              4'h8: pos_low = 10'h1f2;
              4'h9: pos_low = 10'h1f2;
              4'ha: pos_low = 10'h1f2;
              4'hb: pos_low = 10'h1f3;
              4'hc: pos_low = 10'h1f3;
              4'hd: pos_low = 10'h1f4;
              4'he: pos_low = 10'h1f4;
              4'hf: pos_low = 10'h1f5;
              default: pos_low = 10'h000;
            endcase
          end
          6'h3b: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h1f5;
              4'h1: pos_low = 10'h1f6;
              4'h2: pos_low = 10'h1f6;
              4'h3: pos_low = 10'h1f6;
              4'h4: pos_low = 10'h1f7;
              4'h5: pos_low = 10'h1f7;
              4'h6: pos_low = 10'h1f8;
              4'h7: pos_low = 10'h1f8;
              4'h8: pos_low = 10'h1f9;
              4'h9: pos_low = 10'h1f9;
              4'ha: pos_low = 10'h1fa;
              4'hb: pos_low = 10'h1fa;
              4'hc: pos_low = 10'h1fa;
              4'hd: pos_low = 10'h1fb;
              4'he: pos_low = 10'h1fb;
              4'hf: pos_low = 10'h1fc;
              default: pos_low = 10'h000;
            endcase
          end
          6'h3c: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h1fc;
              4'h1: pos_low = 10'h1fd;
              4'h2: pos_low = 10'h1fd;
              4'h3: pos_low = 10'h1fe;
              4'h4: pos_low = 10'h1fe;
              4'h5: pos_low = 10'h1fe;
              4'h6: pos_low = 10'h1ff;
              4'h7: pos_low = 10'h1ff;
              4'h8: pos_low = 10'h200;
              4'h9: pos_low = 10'h200;
              4'ha: pos_low = 10'h201;
              4'hb: pos_low = 10'h201;
              4'hc: pos_low = 10'h201;
              4'hd: pos_low = 10'h202;
              4'he: pos_low = 10'h202;
              4'hf: pos_low = 10'h203;
              default: pos_low = 10'h000;
            endcase
          end
          6'h3d: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h203;
              4'h1: pos_low = 10'h204;
              4'h2: pos_low = 10'h204;
              4'h3: pos_low = 10'h205;
              4'h4: pos_low = 10'h205;
              4'h5: pos_low = 10'h205;
              4'h6: pos_low = 10'h206;
              4'h7: pos_low = 10'h206;
              4'h8: pos_low = 10'h207;
              4'h9: pos_low = 10'h207;
              4'ha: pos_low = 10'h208;
              4'hb: pos_low = 10'h208;
              4'hc: pos_low = 10'h208;
              4'hd: pos_low = 10'h209;
              4'he: pos_low = 10'h209;
              4'hf: pos_low = 10'h20a;
              default: pos_low = 10'h000;
            endcase
          end
          6'h3e: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h20a;
              4'h1: pos_low = 10'h20b;
              4'h2: pos_low = 10'h20b;
              4'h3: pos_low = 10'h20b;
              4'h4: pos_low = 10'h20c;
              4'h5: pos_low = 10'h20c;
              4'h6: pos_low = 10'h20d;
              4'h7: pos_low = 10'h20d;
              4'h8: pos_low = 10'h20e;
              4'h9: pos_low = 10'h20e;
              4'ha: pos_low = 10'h20e;
              4'hb: pos_low = 10'h20f;
              4'hc: pos_low = 10'h20f;
              4'hd: pos_low = 10'h210;
              4'he: pos_low = 10'h210;
              4'hf: pos_low = 10'h211;
              default: pos_low = 10'h000;
            endcase
          end
          6'h3f: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h211;
              4'h1: pos_low = 10'h211;
              4'h2: pos_low = 10'h212;
              4'h3: pos_low = 10'h212;
              4'h4: pos_low = 10'h213;
              4'h5: pos_low = 10'h213;
              4'h6: pos_low = 10'h214;
              4'h7: pos_low = 10'h214;
              4'h8: pos_low = 10'h214;
              4'h9: pos_low = 10'h215;
              4'ha: pos_low = 10'h215;
              4'hb: pos_low = 10'h216;
              4'hc: pos_low = 10'h216;
              4'hd: pos_low = 10'h216;
              4'he: pos_low = 10'h217;
              4'hf: pos_low = 10'h217;
              default: pos_low = 10'h000;
            endcase
          end
          default: begin end
        endcase
      end
      5'h0f: begin
        case (mant[9:4])
          6'h00: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h218;
              4'h1: pos_low = 10'h219;
              4'h2: pos_low = 10'h219;
              4'h3: pos_low = 10'h21a;
              4'h4: pos_low = 10'h21b;
              4'h5: pos_low = 10'h21c;
              4'h6: pos_low = 10'h21d;
              4'h7: pos_low = 10'h21e;
              4'h8: pos_low = 10'h21e;
              4'h9: pos_low = 10'h21f;
              4'ha: pos_low = 10'h220;
              4'hb: pos_low = 10'h221;
              4'hc: pos_low = 10'h222;
              4'hd: pos_low = 10'h223;
              4'he: pos_low = 10'h223;
              4'hf: pos_low = 10'h224;
              default: pos_low = 10'h000;
            endcase
          end
          6'h01: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h225;
              4'h1: pos_low = 10'h226;
              4'h2: pos_low = 10'h227;
              4'h3: pos_low = 10'h227;
              4'h4: pos_low = 10'h228;
              4'h5: pos_low = 10'h229;
              4'h6: pos_low = 10'h22a;
              4'h7: pos_low = 10'h22b;
              4'h8: pos_low = 10'h22c;
              4'h9: pos_low = 10'h22c;
              4'ha: pos_low = 10'h22d;
              4'hb: pos_low = 10'h22e;
              4'hc: pos_low = 10'h22f;
              4'hd: pos_low = 10'h230;
              4'he: pos_low = 10'h230;
              4'hf: pos_low = 10'h231;
              default: pos_low = 10'h000;
            endcase
          end
          6'h02: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h232;
              4'h1: pos_low = 10'h233;
              4'h2: pos_low = 10'h234;
              4'h3: pos_low = 10'h234;
              4'h4: pos_low = 10'h235;
              4'h5: pos_low = 10'h236;
              4'h6: pos_low = 10'h237;
              4'h7: pos_low = 10'h238;
              4'h8: pos_low = 10'h238;
              4'h9: pos_low = 10'h239;
              4'ha: pos_low = 10'h23a;
              4'hb: pos_low = 10'h23b;
              4'hc: pos_low = 10'h23c;
              4'hd: pos_low = 10'h23c;
              4'he: pos_low = 10'h23d;
              4'hf: pos_low = 10'h23e;
              default: pos_low = 10'h000;
            endcase
          end
          6'h03: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h23f;
              4'h1: pos_low = 10'h23f;
              4'h2: pos_low = 10'h240;
              4'h3: pos_low = 10'h241;
              4'h4: pos_low = 10'h242;
              4'h5: pos_low = 10'h243;
              4'h6: pos_low = 10'h243;
              4'h7: pos_low = 10'h244;
              4'h8: pos_low = 10'h245;
              4'h9: pos_low = 10'h246;
              4'ha: pos_low = 10'h246;
              4'hb: pos_low = 10'h247;
              4'hc: pos_low = 10'h248;
              4'hd: pos_low = 10'h249;
              4'he: pos_low = 10'h249;
              4'hf: pos_low = 10'h24a;
              default: pos_low = 10'h000;
            endcase
          end
          6'h04: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h24b;
              4'h1: pos_low = 10'h24c;
              4'h2: pos_low = 10'h24d;
              4'h3: pos_low = 10'h24d;
              4'h4: pos_low = 10'h24e;
              4'h5: pos_low = 10'h24f;
              4'h6: pos_low = 10'h250;
              4'h7: pos_low = 10'h250;
              4'h8: pos_low = 10'h251;
              4'h9: pos_low = 10'h252;
              4'ha: pos_low = 10'h253;
              4'hb: pos_low = 10'h253;
              4'hc: pos_low = 10'h254;
              4'hd: pos_low = 10'h255;
              4'he: pos_low = 10'h256;
              4'hf: pos_low = 10'h256;
              default: pos_low = 10'h000;
            endcase
          end
          6'h05: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h257;
              4'h1: pos_low = 10'h258;
              4'h2: pos_low = 10'h259;
              4'h3: pos_low = 10'h259;
              4'h4: pos_low = 10'h25a;
              4'h5: pos_low = 10'h25b;
              4'h6: pos_low = 10'h25b;
              4'h7: pos_low = 10'h25c;
              4'h8: pos_low = 10'h25d;
              4'h9: pos_low = 10'h25e;
              4'ha: pos_low = 10'h25e;
              4'hb: pos_low = 10'h25f;
              4'hc: pos_low = 10'h260;
              4'hd: pos_low = 10'h261;
              4'he: pos_low = 10'h261;
              4'hf: pos_low = 10'h262;
              default: pos_low = 10'h000;
            endcase
          end
          6'h06: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h263;
              4'h1: pos_low = 10'h264;
              4'h2: pos_low = 10'h264;
              4'h3: pos_low = 10'h265;
              4'h4: pos_low = 10'h266;
              4'h5: pos_low = 10'h266;
              4'h6: pos_low = 10'h267;
              4'h7: pos_low = 10'h268;
              4'h8: pos_low = 10'h269;
              4'h9: pos_low = 10'h269;
              4'ha: pos_low = 10'h26a;
              4'hb: pos_low = 10'h26b;
              4'hc: pos_low = 10'h26b;
              4'hd: pos_low = 10'h26c;
              4'he: pos_low = 10'h26d;
              4'hf: pos_low = 10'h26e;
              default: pos_low = 10'h000;
            endcase
          end
          6'h07: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h26e;
              4'h1: pos_low = 10'h26f;
              4'h2: pos_low = 10'h270;
              4'h3: pos_low = 10'h270;
              4'h4: pos_low = 10'h271;
              4'h5: pos_low = 10'h272;
              4'h6: pos_low = 10'h272;
              4'h7: pos_low = 10'h273;
              4'h8: pos_low = 10'h274;
              4'h9: pos_low = 10'h275;
              4'ha: pos_low = 10'h275;
              4'hb: pos_low = 10'h276;
              4'hc: pos_low = 10'h277;
              4'hd: pos_low = 10'h277;
              4'he: pos_low = 10'h278;
              4'hf: pos_low = 10'h279;
              default: pos_low = 10'h000;
            endcase
          end
          6'h08: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h279;
              4'h1: pos_low = 10'h27a;
              4'h2: pos_low = 10'h27b;
              4'h3: pos_low = 10'h27c;
              4'h4: pos_low = 10'h27c;
              4'h5: pos_low = 10'h27d;
              4'h6: pos_low = 10'h27e;
              4'h7: pos_low = 10'h27e;
              4'h8: pos_low = 10'h27f;
              4'h9: pos_low = 10'h280;
              4'ha: pos_low = 10'h280;
              4'hb: pos_low = 10'h281;
              4'hc: pos_low = 10'h282;
              4'hd: pos_low = 10'h282;
              4'he: pos_low = 10'h283;
              4'hf: pos_low = 10'h284;
              default: pos_low = 10'h000;
            endcase
          end
          6'h09: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h284;
              4'h1: pos_low = 10'h285;
              4'h2: pos_low = 10'h286;
              4'h3: pos_low = 10'h286;
              4'h4: pos_low = 10'h287;
              4'h5: pos_low = 10'h288;
              4'h6: pos_low = 10'h288;
              4'h7: pos_low = 10'h289;
              4'h8: pos_low = 10'h28a;
              4'h9: pos_low = 10'h28a;
              4'ha: pos_low = 10'h28b;
              4'hb: pos_low = 10'h28c;
              4'hc: pos_low = 10'h28c;
              4'hd: pos_low = 10'h28d;
              4'he: pos_low = 10'h28e;
              4'hf: pos_low = 10'h28e;
              default: pos_low = 10'h000;
            endcase
          end
          6'h0a: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h28f;
              4'h1: pos_low = 10'h290;
              4'h2: pos_low = 10'h290;
              4'h3: pos_low = 10'h291;
              4'h4: pos_low = 10'h292;
              4'h5: pos_low = 10'h292;
              4'h6: pos_low = 10'h293;
              4'h7: pos_low = 10'h294;
              4'h8: pos_low = 10'h294;
              4'h9: pos_low = 10'h295;
              4'ha: pos_low = 10'h295;
              4'hb: pos_low = 10'h296;
              4'hc: pos_low = 10'h297;
              4'hd: pos_low = 10'h297;
              4'he: pos_low = 10'h298;
              4'hf: pos_low = 10'h299;
              default: pos_low = 10'h000;
            endcase
          end
          6'h0b: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h299;
              4'h1: pos_low = 10'h29a;
              4'h2: pos_low = 10'h29b;
              4'h3: pos_low = 10'h29b;
              4'h4: pos_low = 10'h29c;
              4'h5: pos_low = 10'h29d;
              4'h6: pos_low = 10'h29d;
              4'h7: pos_low = 10'h29e;
              4'h8: pos_low = 10'h29e;
              4'h9: pos_low = 10'h29f;
              4'ha: pos_low = 10'h2a0;
              4'hb: pos_low = 10'h2a0;
              4'hc: pos_low = 10'h2a1;
              4'hd: pos_low = 10'h2a2;
              4'he: pos_low = 10'h2a2;
              4'hf: pos_low = 10'h2a3;
              default: pos_low = 10'h000;
            endcase
          end
          6'h0c: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h2a3;
              4'h1: pos_low = 10'h2a4;
              4'h2: pos_low = 10'h2a5;
              4'h3: pos_low = 10'h2a5;
              4'h4: pos_low = 10'h2a6;
              4'h5: pos_low = 10'h2a7;
              4'h6: pos_low = 10'h2a7;
              4'h7: pos_low = 10'h2a8;
              4'h8: pos_low = 10'h2a8;
              4'h9: pos_low = 10'h2a9;
              4'ha: pos_low = 10'h2aa;
              4'hb: pos_low = 10'h2aa;
              4'hc: pos_low = 10'h2ab;
              4'hd: pos_low = 10'h2ab;
              4'he: pos_low = 10'h2ac;
              4'hf: pos_low = 10'h2ad;
              default: pos_low = 10'h000;
            endcase
          end
          6'h0d: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h2ad;
              4'h1: pos_low = 10'h2ae;
              4'h2: pos_low = 10'h2ae;
              4'h3: pos_low = 10'h2af;
              4'h4: pos_low = 10'h2b0;
              4'h5: pos_low = 10'h2b0;
              4'h6: pos_low = 10'h2b1;
              4'h7: pos_low = 10'h2b1;
              4'h8: pos_low = 10'h2b2;
              4'h9: pos_low = 10'h2b3;
              4'ha: pos_low = 10'h2b3;
              4'hb: pos_low = 10'h2b4;
              4'hc: pos_low = 10'h2b4;
              4'hd: pos_low = 10'h2b5;
              4'he: pos_low = 10'h2b6;
              4'hf: pos_low = 10'h2b6;
              default: pos_low = 10'h000;
            endcase
          end
          6'h0e: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h2b7;
              4'h1: pos_low = 10'h2b7;
              4'h2: pos_low = 10'h2b8;
              4'h3: pos_low = 10'h2b9;
              4'h4: pos_low = 10'h2b9;
              4'h5: pos_low = 10'h2ba;
              4'h6: pos_low = 10'h2ba;
              4'h7: pos_low = 10'h2bb;
              4'h8: pos_low = 10'h2bc;
              4'h9: pos_low = 10'h2bc;
              4'ha: pos_low = 10'h2bd;
              4'hb: pos_low = 10'h2bd;
              4'hc: pos_low = 10'h2be;
              4'hd: pos_low = 10'h2be;
              4'he: pos_low = 10'h2bf;
              4'hf: pos_low = 10'h2c0;
              default: pos_low = 10'h000;
            endcase
          end
          6'h0f: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h2c0;
              4'h1: pos_low = 10'h2c1;
              4'h2: pos_low = 10'h2c1;
              4'h3: pos_low = 10'h2c2;
              4'h4: pos_low = 10'h2c2;
              4'h5: pos_low = 10'h2c3;
              4'h6: pos_low = 10'h2c4;
              4'h7: pos_low = 10'h2c4;
              4'h8: pos_low = 10'h2c5;
              4'h9: pos_low = 10'h2c5;
              4'ha: pos_low = 10'h2c6;
              4'hb: pos_low = 10'h2c6;
              4'hc: pos_low = 10'h2c7;
              4'hd: pos_low = 10'h2c8;
              4'he: pos_low = 10'h2c8;
              4'hf: pos_low = 10'h2c9;
              default: pos_low = 10'h000;
            endcase
          end
          6'h10: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h2c9;
              4'h1: pos_low = 10'h2ca;
              4'h2: pos_low = 10'h2ca;
              4'h3: pos_low = 10'h2cb;
              4'h4: pos_low = 10'h2cc;
              4'h5: pos_low = 10'h2cc;
              4'h6: pos_low = 10'h2cd;
              4'h7: pos_low = 10'h2cd;
              4'h8: pos_low = 10'h2ce;
              4'h9: pos_low = 10'h2ce;
              4'ha: pos_low = 10'h2cf;
              4'hb: pos_low = 10'h2cf;
              4'hc: pos_low = 10'h2d0;
              4'hd: pos_low = 10'h2d0;
              4'he: pos_low = 10'h2d1;
              4'hf: pos_low = 10'h2d2;
              default: pos_low = 10'h000;
            endcase
          end
          6'h11: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h2d2;
              4'h1: pos_low = 10'h2d3;
              4'h2: pos_low = 10'h2d3;
              4'h3: pos_low = 10'h2d4;
              4'h4: pos_low = 10'h2d4;
              4'h5: pos_low = 10'h2d5;
              4'h6: pos_low = 10'h2d5;
              4'h7: pos_low = 10'h2d6;
              4'h8: pos_low = 10'h2d6;
              4'h9: pos_low = 10'h2d7;
              4'ha: pos_low = 10'h2d8;
              4'hb: pos_low = 10'h2d8;
              4'hc: pos_low = 10'h2d9;
              4'hd: pos_low = 10'h2d9;
              4'he: pos_low = 10'h2da;
              4'hf: pos_low = 10'h2da;
              default: pos_low = 10'h000;
            endcase
          end
          6'h12: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h2db;
              4'h1: pos_low = 10'h2db;
              4'h2: pos_low = 10'h2dc;
              4'h3: pos_low = 10'h2dc;
              4'h4: pos_low = 10'h2dd;
              4'h5: pos_low = 10'h2dd;
              4'h6: pos_low = 10'h2de;
              4'h7: pos_low = 10'h2de;
              4'h8: pos_low = 10'h2df;
              4'h9: pos_low = 10'h2e0;
              4'ha: pos_low = 10'h2e0;
              4'hb: pos_low = 10'h2e1;
              4'hc: pos_low = 10'h2e1;
              4'hd: pos_low = 10'h2e2;
              4'he: pos_low = 10'h2e2;
              4'hf: pos_low = 10'h2e3;
              default: pos_low = 10'h000;
            endcase
          end
          6'h13: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h2e3;
              4'h1: pos_low = 10'h2e4;
              4'h2: pos_low = 10'h2e4;
              4'h3: pos_low = 10'h2e5;
              4'h4: pos_low = 10'h2e5;
              4'h5: pos_low = 10'h2e6;
              4'h6: pos_low = 10'h2e6;
              4'h7: pos_low = 10'h2e7;
              4'h8: pos_low = 10'h2e7;
              4'h9: pos_low = 10'h2e8;
              4'ha: pos_low = 10'h2e8;
              4'hb: pos_low = 10'h2e9;
              4'hc: pos_low = 10'h2e9;
              4'hd: pos_low = 10'h2ea;
              4'he: pos_low = 10'h2ea;
              4'hf: pos_low = 10'h2eb;
              default: pos_low = 10'h000;
            endcase
          end
          6'h14: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h2eb;
              4'h1: pos_low = 10'h2ec;
              4'h2: pos_low = 10'h2ec;
              4'h3: pos_low = 10'h2ed;
              4'h4: pos_low = 10'h2ed;
              4'h5: pos_low = 10'h2ee;
              4'h6: pos_low = 10'h2ee;
              4'h7: pos_low = 10'h2ef;
              4'h8: pos_low = 10'h2ef;
              4'h9: pos_low = 10'h2f0;
              4'ha: pos_low = 10'h2f0;
              4'hb: pos_low = 10'h2f1;
              4'hc: pos_low = 10'h2f1;
              4'hd: pos_low = 10'h2f2;
              4'he: pos_low = 10'h2f2;
              4'hf: pos_low = 10'h2f3;
              default: pos_low = 10'h000;
            endcase
          end
          6'h15: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h2f3;
              4'h1: pos_low = 10'h2f4;
              4'h2: pos_low = 10'h2f4;
              4'h3: pos_low = 10'h2f5;
              4'h4: pos_low = 10'h2f5;
              4'h5: pos_low = 10'h2f6;
              4'h6: pos_low = 10'h2f6;
              4'h7: pos_low = 10'h2f7;
              4'h8: pos_low = 10'h2f7;
              4'h9: pos_low = 10'h2f8;
              4'ha: pos_low = 10'h2f8;
              4'hb: pos_low = 10'h2f9;
              4'hc: pos_low = 10'h2f9;
              4'hd: pos_low = 10'h2fa;
              4'he: pos_low = 10'h2fa;
              4'hf: pos_low = 10'h2fb;
              default: pos_low = 10'h000;
            endcase
          end
          6'h16: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h2fb;
              4'h1: pos_low = 10'h2fc;
              4'h2: pos_low = 10'h2fc;
              4'h3: pos_low = 10'h2fc;
              4'h4: pos_low = 10'h2fd;
              4'h5: pos_low = 10'h2fd;
              4'h6: pos_low = 10'h2fe;
              4'h7: pos_low = 10'h2fe;
              4'h8: pos_low = 10'h2ff;
              4'h9: pos_low = 10'h2ff;
              4'ha: pos_low = 10'h300;
              4'hb: pos_low = 10'h300;
              4'hc: pos_low = 10'h301;
              4'hd: pos_low = 10'h301;
              4'he: pos_low = 10'h302;
              4'hf: pos_low = 10'h302;
              default: pos_low = 10'h000;
            endcase
          end
          6'h17: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h303;
              4'h1: pos_low = 10'h303;
              4'h2: pos_low = 10'h303;
              4'h3: pos_low = 10'h304;
              4'h4: pos_low = 10'h304;
              4'h5: pos_low = 10'h305;
              4'h6: pos_low = 10'h305;
              4'h7: pos_low = 10'h306;
              4'h8: pos_low = 10'h306;
              4'h9: pos_low = 10'h307;
              4'ha: pos_low = 10'h307;
              4'hb: pos_low = 10'h308;
              4'hc: pos_low = 10'h308;
              4'hd: pos_low = 10'h309;
              4'he: pos_low = 10'h309;
              4'hf: pos_low = 10'h309;
              default: pos_low = 10'h000;
            endcase
          end
          6'h18: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h30a;
              4'h1: pos_low = 10'h30a;
              4'h2: pos_low = 10'h30b;
              4'h3: pos_low = 10'h30b;
              4'h4: pos_low = 10'h30c;
              4'h5: pos_low = 10'h30c;
              4'h6: pos_low = 10'h30d;
              4'h7: pos_low = 10'h30d;
              4'h8: pos_low = 10'h30d;
              4'h9: pos_low = 10'h30e;
              4'ha: pos_low = 10'h30e;
              4'hb: pos_low = 10'h30f;
              4'hc: pos_low = 10'h30f;
              4'hd: pos_low = 10'h310;
              4'he: pos_low = 10'h310;
              4'hf: pos_low = 10'h311;
              default: pos_low = 10'h000;
            endcase
          end
          6'h19: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h311;
              4'h1: pos_low = 10'h311;
              4'h2: pos_low = 10'h312;
              4'h3: pos_low = 10'h312;
              4'h4: pos_low = 10'h313;
              4'h5: pos_low = 10'h313;
              4'h6: pos_low = 10'h314;
              4'h7: pos_low = 10'h314;
              4'h8: pos_low = 10'h315;
              4'h9: pos_low = 10'h315;
              4'ha: pos_low = 10'h315;
              4'hb: pos_low = 10'h316;
              4'hc: pos_low = 10'h316;
              4'hd: pos_low = 10'h317;
              4'he: pos_low = 10'h317;
              4'hf: pos_low = 10'h318;
              default: pos_low = 10'h000;
            endcase
          end
          6'h1a: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h318;
              4'h1: pos_low = 10'h318;
              4'h2: pos_low = 10'h319;
              4'h3: pos_low = 10'h319;
              4'h4: pos_low = 10'h31a;
              4'h5: pos_low = 10'h31a;
              4'h6: pos_low = 10'h31b;
              4'h7: pos_low = 10'h31b;
              4'h8: pos_low = 10'h31b;
              4'h9: pos_low = 10'h31c;
              4'ha: pos_low = 10'h31c;
              4'hb: pos_low = 10'h31d;
              4'hc: pos_low = 10'h31d;
              4'hd: pos_low = 10'h31d;
              4'he: pos_low = 10'h31e;
              4'hf: pos_low = 10'h31e;
              default: pos_low = 10'h000;
            endcase
          end
          6'h1b: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h31f;
              4'h1: pos_low = 10'h31f;
              4'h2: pos_low = 10'h320;
              4'h3: pos_low = 10'h320;
              4'h4: pos_low = 10'h320;
              4'h5: pos_low = 10'h321;
              4'h6: pos_low = 10'h321;
              4'h7: pos_low = 10'h322;
              4'h8: pos_low = 10'h322;
              4'h9: pos_low = 10'h322;
              4'ha: pos_low = 10'h323;
              4'hb: pos_low = 10'h323;
              4'hc: pos_low = 10'h324;
              4'hd: pos_low = 10'h324;
              4'he: pos_low = 10'h324;
              4'hf: pos_low = 10'h325;
              default: pos_low = 10'h000;
            endcase
          end
          6'h1c: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h325;
              4'h1: pos_low = 10'h326;
              4'h2: pos_low = 10'h326;
              4'h3: pos_low = 10'h326;
              4'h4: pos_low = 10'h327;
              4'h5: pos_low = 10'h327;
              4'h6: pos_low = 10'h328;
              4'h7: pos_low = 10'h328;
              4'h8: pos_low = 10'h328;
              4'h9: pos_low = 10'h329;
              4'ha: pos_low = 10'h329;
              4'hb: pos_low = 10'h32a;
              4'hc: pos_low = 10'h32a;
              4'hd: pos_low = 10'h32a;
              4'he: pos_low = 10'h32b;
              4'hf: pos_low = 10'h32b;
              default: pos_low = 10'h000;
            endcase
          end
          6'h1d: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h32c;
              4'h1: pos_low = 10'h32c;
              4'h2: pos_low = 10'h32c;
              4'h3: pos_low = 10'h32d;
              4'h4: pos_low = 10'h32d;
              4'h5: pos_low = 10'h32e;
              4'h6: pos_low = 10'h32e;
              4'h7: pos_low = 10'h32e;
              4'h8: pos_low = 10'h32f;
              4'h9: pos_low = 10'h32f;
              4'ha: pos_low = 10'h330;
              4'hb: pos_low = 10'h330;
              4'hc: pos_low = 10'h330;
              4'hd: pos_low = 10'h331;
              4'he: pos_low = 10'h331;
              4'hf: pos_low = 10'h331;
              default: pos_low = 10'h000;
            endcase
          end
          6'h1e: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h332;
              4'h1: pos_low = 10'h332;
              4'h2: pos_low = 10'h333;
              4'h3: pos_low = 10'h333;
              4'h4: pos_low = 10'h333;
              4'h5: pos_low = 10'h334;
              4'h6: pos_low = 10'h334;
              4'h7: pos_low = 10'h335;
              4'h8: pos_low = 10'h335;
              4'h9: pos_low = 10'h335;
              4'ha: pos_low = 10'h336;
              4'hb: pos_low = 10'h336;
              4'hc: pos_low = 10'h336;
              4'hd: pos_low = 10'h337;
              4'he: pos_low = 10'h337;
              4'hf: pos_low = 10'h338;
              default: pos_low = 10'h000;
            endcase
          end
          6'h1f: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h338;
              4'h1: pos_low = 10'h338;
              4'h2: pos_low = 10'h339;
              4'h3: pos_low = 10'h339;
              4'h4: pos_low = 10'h339;
              4'h5: pos_low = 10'h33a;
              4'h6: pos_low = 10'h33a;
              4'h7: pos_low = 10'h33a;
              4'h8: pos_low = 10'h33b;
              4'h9: pos_low = 10'h33b;
              4'ha: pos_low = 10'h33c;
              4'hb: pos_low = 10'h33c;
              4'hc: pos_low = 10'h33c;
              4'hd: pos_low = 10'h33d;
              4'he: pos_low = 10'h33d;
              4'hf: pos_low = 10'h33d;
              default: pos_low = 10'h000;
            endcase
          end
          6'h20: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h33e;
              4'h1: pos_low = 10'h33e;
              4'h2: pos_low = 10'h33e;
              4'h3: pos_low = 10'h33f;
              4'h4: pos_low = 10'h33f;
              4'h5: pos_low = 10'h340;
              4'h6: pos_low = 10'h340;
              4'h7: pos_low = 10'h340;
              4'h8: pos_low = 10'h341;
              4'h9: pos_low = 10'h341;
              4'ha: pos_low = 10'h341;
              4'hb: pos_low = 10'h342;
              4'hc: pos_low = 10'h342;
              4'hd: pos_low = 10'h342;
              4'he: pos_low = 10'h343;
              4'hf: pos_low = 10'h343;
              default: pos_low = 10'h000;
            endcase
          end
          6'h21: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h343;
              4'h1: pos_low = 10'h344;
              4'h2: pos_low = 10'h344;
              4'h3: pos_low = 10'h344;
              4'h4: pos_low = 10'h345;
              4'h5: pos_low = 10'h345;
              4'h6: pos_low = 10'h346;
              4'h7: pos_low = 10'h346;
              4'h8: pos_low = 10'h346;
              4'h9: pos_low = 10'h347;
              4'ha: pos_low = 10'h347;
              4'hb: pos_low = 10'h347;
              4'hc: pos_low = 10'h348;
              4'hd: pos_low = 10'h348;
              4'he: pos_low = 10'h348;
              4'hf: pos_low = 10'h349;
              default: pos_low = 10'h000;
            endcase
          end
          6'h22: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h349;
              4'h1: pos_low = 10'h349;
              4'h2: pos_low = 10'h34a;
              4'h3: pos_low = 10'h34a;
              4'h4: pos_low = 10'h34a;
              4'h5: pos_low = 10'h34b;
              4'h6: pos_low = 10'h34b;
              4'h7: pos_low = 10'h34b;
              4'h8: pos_low = 10'h34c;
              4'h9: pos_low = 10'h34c;
              4'ha: pos_low = 10'h34c;
              4'hb: pos_low = 10'h34d;
              4'hc: pos_low = 10'h34d;
              4'hd: pos_low = 10'h34d;
              4'he: pos_low = 10'h34e;
              4'hf: pos_low = 10'h34e;
              default: pos_low = 10'h000;
            endcase
          end
          6'h23: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h34e;
              4'h1: pos_low = 10'h34f;
              4'h2: pos_low = 10'h34f;
              4'h3: pos_low = 10'h34f;
              4'h4: pos_low = 10'h350;
              4'h5: pos_low = 10'h350;
              4'h6: pos_low = 10'h350;
              4'h7: pos_low = 10'h351;
              4'h8: pos_low = 10'h351;
              4'h9: pos_low = 10'h351;
              4'ha: pos_low = 10'h352;
              4'hb: pos_low = 10'h352;
              4'hc: pos_low = 10'h352;
              4'hd: pos_low = 10'h353;
              4'he: pos_low = 10'h353;
              4'hf: pos_low = 10'h353;
              default: pos_low = 10'h000;
            endcase
          end
          6'h24: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h354;
              4'h1: pos_low = 10'h354;
              4'h2: pos_low = 10'h354;
              4'h3: pos_low = 10'h355;
              4'h4: pos_low = 10'h355;
              4'h5: pos_low = 10'h355;
              4'h6: pos_low = 10'h356;
              4'h7: pos_low = 10'h356;
              4'h8: pos_low = 10'h356;
              4'h9: pos_low = 10'h356;
              4'ha: pos_low = 10'h357;
              4'hb: pos_low = 10'h357;
              4'hc: pos_low = 10'h357;
              4'hd: pos_low = 10'h358;
              4'he: pos_low = 10'h358;
              4'hf: pos_low = 10'h358;
              default: pos_low = 10'h000;
            endcase
          end
          6'h25: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h359;
              4'h1: pos_low = 10'h359;
              4'h2: pos_low = 10'h359;
              4'h3: pos_low = 10'h35a;
              4'h4: pos_low = 10'h35a;
              4'h5: pos_low = 10'h35a;
              4'h6: pos_low = 10'h35b;
              4'h7: pos_low = 10'h35b;
              4'h8: pos_low = 10'h35b;
              4'h9: pos_low = 10'h35b;
              4'ha: pos_low = 10'h35c;
              4'hb: pos_low = 10'h35c;
              4'hc: pos_low = 10'h35c;
              4'hd: pos_low = 10'h35d;
              4'he: pos_low = 10'h35d;
              4'hf: pos_low = 10'h35d;
              default: pos_low = 10'h000;
            endcase
          end
          6'h26: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h35e;
              4'h1: pos_low = 10'h35e;
              4'h2: pos_low = 10'h35e;
              4'h3: pos_low = 10'h35f;
              4'h4: pos_low = 10'h35f;
              4'h5: pos_low = 10'h35f;
              4'h6: pos_low = 10'h35f;
              4'h7: pos_low = 10'h360;
              4'h8: pos_low = 10'h360;
              4'h9: pos_low = 10'h360;
              4'ha: pos_low = 10'h361;
              4'hb: pos_low = 10'h361;
              4'hc: pos_low = 10'h361;
              4'hd: pos_low = 10'h362;
              4'he: pos_low = 10'h362;
              4'hf: pos_low = 10'h362;
              default: pos_low = 10'h000;
            endcase
          end
          6'h27: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h362;
              4'h1: pos_low = 10'h363;
              4'h2: pos_low = 10'h363;
              4'h3: pos_low = 10'h363;
              4'h4: pos_low = 10'h364;
              4'h5: pos_low = 10'h364;
              4'h6: pos_low = 10'h364;
              4'h7: pos_low = 10'h365;
              4'h8: pos_low = 10'h365;
              4'h9: pos_low = 10'h365;
              4'ha: pos_low = 10'h365;
              4'hb: pos_low = 10'h366;
              4'hc: pos_low = 10'h366;
              4'hd: pos_low = 10'h366;
              4'he: pos_low = 10'h367;
              4'hf: pos_low = 10'h367;
              default: pos_low = 10'h000;
            endcase
          end
          6'h28: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h367;
              4'h1: pos_low = 10'h367;
              4'h2: pos_low = 10'h368;
              4'h3: pos_low = 10'h368;
              4'h4: pos_low = 10'h368;
              4'h5: pos_low = 10'h369;
              4'h6: pos_low = 10'h369;
              4'h7: pos_low = 10'h369;
              4'h8: pos_low = 10'h369;
              4'h9: pos_low = 10'h36a;
              4'ha: pos_low = 10'h36a;
              4'hb: pos_low = 10'h36a;
              4'hc: pos_low = 10'h36b;
              4'hd: pos_low = 10'h36b;
              4'he: pos_low = 10'h36b;
              4'hf: pos_low = 10'h36b;
              default: pos_low = 10'h000;
            endcase
          end
          6'h29: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h36c;
              4'h1: pos_low = 10'h36c;
              4'h2: pos_low = 10'h36c;
              4'h3: pos_low = 10'h36c;
              4'h4: pos_low = 10'h36d;
              4'h5: pos_low = 10'h36d;
              4'h6: pos_low = 10'h36d;
              4'h7: pos_low = 10'h36e;
              4'h8: pos_low = 10'h36e;
              4'h9: pos_low = 10'h36e;
              4'ha: pos_low = 10'h36e;
              4'hb: pos_low = 10'h36f;
              4'hc: pos_low = 10'h36f;
              4'hd: pos_low = 10'h36f;
              4'he: pos_low = 10'h370;
              4'hf: pos_low = 10'h370;
              default: pos_low = 10'h000;
            endcase
          end
          6'h2a: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h370;
              4'h1: pos_low = 10'h370;
              4'h2: pos_low = 10'h371;
              4'h3: pos_low = 10'h371;
              4'h4: pos_low = 10'h371;
              4'h5: pos_low = 10'h371;
              4'h6: pos_low = 10'h372;
              4'h7: pos_low = 10'h372;
              4'h8: pos_low = 10'h372;
              4'h9: pos_low = 10'h372;
              4'ha: pos_low = 10'h373;
              4'hb: pos_low = 10'h373;
              4'hc: pos_low = 10'h373;
              4'hd: pos_low = 10'h374;
              4'he: pos_low = 10'h374;
              4'hf: pos_low = 10'h374;
              default: pos_low = 10'h000;
            endcase
          end
          6'h2b: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h374;
              4'h1: pos_low = 10'h375;
              4'h2: pos_low = 10'h375;
              4'h3: pos_low = 10'h375;
              4'h4: pos_low = 10'h375;
              4'h5: pos_low = 10'h376;
              4'h6: pos_low = 10'h376;
              4'h7: pos_low = 10'h376;
              4'h8: pos_low = 10'h376;
              4'h9: pos_low = 10'h377;
              4'ha: pos_low = 10'h377;
              4'hb: pos_low = 10'h377;
              4'hc: pos_low = 10'h377;
              4'hd: pos_low = 10'h378;
              4'he: pos_low = 10'h378;
              4'hf: pos_low = 10'h378;
              default: pos_low = 10'h000;
            endcase
          end
          6'h2c: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h378;
              4'h1: pos_low = 10'h379;
              4'h2: pos_low = 10'h379;
              4'h3: pos_low = 10'h379;
              4'h4: pos_low = 10'h379;
              4'h5: pos_low = 10'h37a;
              4'h6: pos_low = 10'h37a;
              4'h7: pos_low = 10'h37a;
              4'h8: pos_low = 10'h37b;
              4'h9: pos_low = 10'h37b;
              4'ha: pos_low = 10'h37b;
              4'hb: pos_low = 10'h37b;
              4'hc: pos_low = 10'h37c;
              4'hd: pos_low = 10'h37c;
              4'he: pos_low = 10'h37c;
              4'hf: pos_low = 10'h37c;
              default: pos_low = 10'h000;
            endcase
          end
          6'h2d: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h37d;
              4'h1: pos_low = 10'h37d;
              4'h2: pos_low = 10'h37d;
              4'h3: pos_low = 10'h37d;
              4'h4: pos_low = 10'h37e;
              4'h5: pos_low = 10'h37e;
              4'h6: pos_low = 10'h37e;
              4'h7: pos_low = 10'h37e;
              4'h8: pos_low = 10'h37e;
              4'h9: pos_low = 10'h37f;
              4'ha: pos_low = 10'h37f;
              4'hb: pos_low = 10'h37f;
              4'hc: pos_low = 10'h37f;
              4'hd: pos_low = 10'h380;
              4'he: pos_low = 10'h380;
              4'hf: pos_low = 10'h380;
              default: pos_low = 10'h000;
            endcase
          end
          6'h2e: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h380;
              4'h1: pos_low = 10'h381;
              4'h2: pos_low = 10'h381;
              4'h3: pos_low = 10'h381;
              4'h4: pos_low = 10'h381;
              4'h5: pos_low = 10'h382;
              4'h6: pos_low = 10'h382;
              4'h7: pos_low = 10'h382;
              4'h8: pos_low = 10'h382;
              4'h9: pos_low = 10'h383;
              4'ha: pos_low = 10'h383;
              4'hb: pos_low = 10'h383;
              4'hc: pos_low = 10'h383;
              4'hd: pos_low = 10'h384;
              4'he: pos_low = 10'h384;
              4'hf: pos_low = 10'h384;
              default: pos_low = 10'h000;
            endcase
          end
          6'h2f: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h384;
              4'h1: pos_low = 10'h384;
              4'h2: pos_low = 10'h385;
              4'h3: pos_low = 10'h385;
              4'h4: pos_low = 10'h385;
              4'h5: pos_low = 10'h385;
              4'h6: pos_low = 10'h386;
              4'h7: pos_low = 10'h386;
              4'h8: pos_low = 10'h386;
              4'h9: pos_low = 10'h386;
              4'ha: pos_low = 10'h387;
              4'hb: pos_low = 10'h387;
              4'hc: pos_low = 10'h387;
              4'hd: pos_low = 10'h387;
              4'he: pos_low = 10'h387;
              4'hf: pos_low = 10'h388;
              default: pos_low = 10'h000;
            endcase
          end
          6'h30: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h388;
              4'h1: pos_low = 10'h388;
              4'h2: pos_low = 10'h388;
              4'h3: pos_low = 10'h389;
              4'h4: pos_low = 10'h389;
              4'h5: pos_low = 10'h389;
              4'h6: pos_low = 10'h389;
              4'h7: pos_low = 10'h38a;
              4'h8: pos_low = 10'h38a;
              4'h9: pos_low = 10'h38a;
              4'ha: pos_low = 10'h38a;
              4'hb: pos_low = 10'h38a;
              4'hc: pos_low = 10'h38b;
              4'hd: pos_low = 10'h38b;
              4'he: pos_low = 10'h38b;
              4'hf: pos_low = 10'h38b;
              default: pos_low = 10'h000;
            endcase
          end
          6'h31: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h38c;
              4'h1: pos_low = 10'h38c;
              4'h2: pos_low = 10'h38c;
              4'h3: pos_low = 10'h38c;
              4'h4: pos_low = 10'h38c;
              4'h5: pos_low = 10'h38d;
              4'h6: pos_low = 10'h38d;
              4'h7: pos_low = 10'h38d;
              4'h8: pos_low = 10'h38d;
              4'h9: pos_low = 10'h38d;
              4'ha: pos_low = 10'h38e;
              4'hb: pos_low = 10'h38e;
              4'hc: pos_low = 10'h38e;
              4'hd: pos_low = 10'h38e;
              4'he: pos_low = 10'h38f;
              4'hf: pos_low = 10'h38f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h32: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h38f;
              4'h1: pos_low = 10'h38f;
              4'h2: pos_low = 10'h38f;
              4'h3: pos_low = 10'h390;
              4'h4: pos_low = 10'h390;
              4'h5: pos_low = 10'h390;
              4'h6: pos_low = 10'h390;
              4'h7: pos_low = 10'h391;
              4'h8: pos_low = 10'h391;
              4'h9: pos_low = 10'h391;
              4'ha: pos_low = 10'h391;
              4'hb: pos_low = 10'h391;
              4'hc: pos_low = 10'h392;
              4'hd: pos_low = 10'h392;
              4'he: pos_low = 10'h392;
              4'hf: pos_low = 10'h392;
              default: pos_low = 10'h000;
            endcase
          end
          6'h33: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h392;
              4'h1: pos_low = 10'h393;
              4'h2: pos_low = 10'h393;
              4'h3: pos_low = 10'h393;
              4'h4: pos_low = 10'h393;
              4'h5: pos_low = 10'h393;
              4'h6: pos_low = 10'h394;
              4'h7: pos_low = 10'h394;
              4'h8: pos_low = 10'h394;
              4'h9: pos_low = 10'h394;
              4'ha: pos_low = 10'h394;
              4'hb: pos_low = 10'h395;
              4'hc: pos_low = 10'h395;
              4'hd: pos_low = 10'h395;
              4'he: pos_low = 10'h395;
              4'hf: pos_low = 10'h395;
              default: pos_low = 10'h000;
            endcase
          end
          6'h34: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h396;
              4'h1: pos_low = 10'h396;
              4'h2: pos_low = 10'h396;
              4'h3: pos_low = 10'h396;
              4'h4: pos_low = 10'h396;
              4'h5: pos_low = 10'h397;
              4'h6: pos_low = 10'h397;
              4'h7: pos_low = 10'h397;
              4'h8: pos_low = 10'h397;
              4'h9: pos_low = 10'h397;
              4'ha: pos_low = 10'h398;
              4'hb: pos_low = 10'h398;
              4'hc: pos_low = 10'h398;
              4'hd: pos_low = 10'h398;
              4'he: pos_low = 10'h398;
              4'hf: pos_low = 10'h399;
              default: pos_low = 10'h000;
            endcase
          end
          6'h35: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h399;
              4'h1: pos_low = 10'h399;
              4'h2: pos_low = 10'h399;
              4'h3: pos_low = 10'h399;
              4'h4: pos_low = 10'h39a;
              4'h5: pos_low = 10'h39a;
              4'h6: pos_low = 10'h39a;
              4'h7: pos_low = 10'h39a;
              4'h8: pos_low = 10'h39a;
              4'h9: pos_low = 10'h39b;
              4'ha: pos_low = 10'h39b;
              4'hb: pos_low = 10'h39b;
              4'hc: pos_low = 10'h39b;
              4'hd: pos_low = 10'h39b;
              4'he: pos_low = 10'h39c;
              4'hf: pos_low = 10'h39c;
              default: pos_low = 10'h000;
            endcase
          end
          6'h36: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h39c;
              4'h1: pos_low = 10'h39c;
              4'h2: pos_low = 10'h39c;
              4'h3: pos_low = 10'h39d;
              4'h4: pos_low = 10'h39d;
              4'h5: pos_low = 10'h39d;
              4'h6: pos_low = 10'h39d;
              4'h7: pos_low = 10'h39d;
              4'h8: pos_low = 10'h39d;
              4'h9: pos_low = 10'h39e;
              4'ha: pos_low = 10'h39e;
              4'hb: pos_low = 10'h39e;
              4'hc: pos_low = 10'h39e;
              4'hd: pos_low = 10'h39e;
              4'he: pos_low = 10'h39f;
              4'hf: pos_low = 10'h39f;
              default: pos_low = 10'h000;
            endcase
          end
          6'h37: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h39f;
              4'h1: pos_low = 10'h39f;
              4'h2: pos_low = 10'h39f;
              4'h3: pos_low = 10'h3a0;
              4'h4: pos_low = 10'h3a0;
              4'h5: pos_low = 10'h3a0;
              4'h6: pos_low = 10'h3a0;
              4'h7: pos_low = 10'h3a0;
              4'h8: pos_low = 10'h3a0;
              4'h9: pos_low = 10'h3a1;
              4'ha: pos_low = 10'h3a1;
              4'hb: pos_low = 10'h3a1;
              4'hc: pos_low = 10'h3a1;
              4'hd: pos_low = 10'h3a1;
              4'he: pos_low = 10'h3a2;
              4'hf: pos_low = 10'h3a2;
              default: pos_low = 10'h000;
            endcase
          end
          6'h38: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3a2;
              4'h1: pos_low = 10'h3a2;
              4'h2: pos_low = 10'h3a2;
              4'h3: pos_low = 10'h3a2;
              4'h4: pos_low = 10'h3a3;
              4'h5: pos_low = 10'h3a3;
              4'h6: pos_low = 10'h3a3;
              4'h7: pos_low = 10'h3a3;
              4'h8: pos_low = 10'h3a3;
              4'h9: pos_low = 10'h3a3;
              4'ha: pos_low = 10'h3a4;
              4'hb: pos_low = 10'h3a4;
              4'hc: pos_low = 10'h3a4;
              4'hd: pos_low = 10'h3a4;
              4'he: pos_low = 10'h3a4;
              4'hf: pos_low = 10'h3a5;
              default: pos_low = 10'h000;
            endcase
          end
          6'h39: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3a5;
              4'h1: pos_low = 10'h3a5;
              4'h2: pos_low = 10'h3a5;
              4'h3: pos_low = 10'h3a5;
              4'h4: pos_low = 10'h3a5;
              4'h5: pos_low = 10'h3a6;
              4'h6: pos_low = 10'h3a6;
              4'h7: pos_low = 10'h3a6;
              4'h8: pos_low = 10'h3a6;
              4'h9: pos_low = 10'h3a6;
              4'ha: pos_low = 10'h3a6;
              4'hb: pos_low = 10'h3a7;
              4'hc: pos_low = 10'h3a7;
              4'hd: pos_low = 10'h3a7;
              4'he: pos_low = 10'h3a7;
              4'hf: pos_low = 10'h3a7;
              default: pos_low = 10'h000;
            endcase
          end
          6'h3a: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3a7;
              4'h1: pos_low = 10'h3a8;
              4'h2: pos_low = 10'h3a8;
              4'h3: pos_low = 10'h3a8;
              4'h4: pos_low = 10'h3a8;
              4'h5: pos_low = 10'h3a8;
              4'h6: pos_low = 10'h3a8;
              4'h7: pos_low = 10'h3a9;
              4'h8: pos_low = 10'h3a9;
              4'h9: pos_low = 10'h3a9;
              4'ha: pos_low = 10'h3a9;
              4'hb: pos_low = 10'h3a9;
              4'hc: pos_low = 10'h3a9;
              4'hd: pos_low = 10'h3aa;
              4'he: pos_low = 10'h3aa;
              4'hf: pos_low = 10'h3aa;
              default: pos_low = 10'h000;
            endcase
          end
          6'h3b: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3aa;
              4'h1: pos_low = 10'h3aa;
              4'h2: pos_low = 10'h3aa;
              4'h3: pos_low = 10'h3ab;
              4'h4: pos_low = 10'h3ab;
              4'h5: pos_low = 10'h3ab;
              4'h6: pos_low = 10'h3ab;
              4'h7: pos_low = 10'h3ab;
              4'h8: pos_low = 10'h3ab;
              4'h9: pos_low = 10'h3ac;
              4'ha: pos_low = 10'h3ac;
              4'hb: pos_low = 10'h3ac;
              4'hc: pos_low = 10'h3ac;
              4'hd: pos_low = 10'h3ac;
              4'he: pos_low = 10'h3ac;
              4'hf: pos_low = 10'h3ad;
              default: pos_low = 10'h000;
            endcase
          end
          6'h3c: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3ad;
              4'h1: pos_low = 10'h3ad;
              4'h2: pos_low = 10'h3ad;
              4'h3: pos_low = 10'h3ad;
              4'h4: pos_low = 10'h3ad;
              4'h5: pos_low = 10'h3ae;
              4'h6: pos_low = 10'h3ae;
              4'h7: pos_low = 10'h3ae;
              4'h8: pos_low = 10'h3ae;
              4'h9: pos_low = 10'h3ae;
              4'ha: pos_low = 10'h3ae;
              4'hb: pos_low = 10'h3ae;
              4'hc: pos_low = 10'h3af;
              4'hd: pos_low = 10'h3af;
              4'he: pos_low = 10'h3af;
              4'hf: pos_low = 10'h3af;
              default: pos_low = 10'h000;
            endcase
          end
          6'h3d: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3af;
              4'h1: pos_low = 10'h3af;
              4'h2: pos_low = 10'h3b0;
              4'h3: pos_low = 10'h3b0;
              4'h4: pos_low = 10'h3b0;
              4'h5: pos_low = 10'h3b0;
              4'h6: pos_low = 10'h3b0;
              4'h7: pos_low = 10'h3b0;
              4'h8: pos_low = 10'h3b0;
              4'h9: pos_low = 10'h3b1;
              4'ha: pos_low = 10'h3b1;
              4'hb: pos_low = 10'h3b1;
              4'hc: pos_low = 10'h3b1;
              4'hd: pos_low = 10'h3b1;
              4'he: pos_low = 10'h3b1;
              4'hf: pos_low = 10'h3b2;
              default: pos_low = 10'h000;
            endcase
          end
          6'h3e: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3b2;
              4'h1: pos_low = 10'h3b2;
              4'h2: pos_low = 10'h3b2;
              4'h3: pos_low = 10'h3b2;
              4'h4: pos_low = 10'h3b2;
              4'h5: pos_low = 10'h3b2;
              4'h6: pos_low = 10'h3b3;
              4'h7: pos_low = 10'h3b3;
              4'h8: pos_low = 10'h3b3;
              4'h9: pos_low = 10'h3b3;
              4'ha: pos_low = 10'h3b3;
              4'hb: pos_low = 10'h3b3;
              4'hc: pos_low = 10'h3b3;
              4'hd: pos_low = 10'h3b4;
              4'he: pos_low = 10'h3b4;
              4'hf: pos_low = 10'h3b4;
              default: pos_low = 10'h000;
            endcase
          end
          6'h3f: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3b4;
              4'h1: pos_low = 10'h3b4;
              4'h2: pos_low = 10'h3b4;
              4'h3: pos_low = 10'h3b4;
              4'h4: pos_low = 10'h3b5;
              4'h5: pos_low = 10'h3b5;
              4'h6: pos_low = 10'h3b5;
              4'h7: pos_low = 10'h3b5;
              4'h8: pos_low = 10'h3b5;
              4'h9: pos_low = 10'h3b5;
              4'ha: pos_low = 10'h3b5;
              4'hb: pos_low = 10'h3b6;
              4'hc: pos_low = 10'h3b6;
              4'hd: pos_low = 10'h3b6;
              4'he: pos_low = 10'h3b6;
              4'hf: pos_low = 10'h3b6;
              default: pos_low = 10'h000;
            endcase
          end
          default: begin end
        endcase
      end
      5'h10: begin
        case (mant[9:4])
          6'h00: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3b6;
              4'h1: pos_low = 10'h3b7;
              4'h2: pos_low = 10'h3b7;
              4'h3: pos_low = 10'h3b7;
              4'h4: pos_low = 10'h3b7;
              4'h5: pos_low = 10'h3b8;
              4'h6: pos_low = 10'h3b8;
              4'h7: pos_low = 10'h3b8;
              4'h8: pos_low = 10'h3b9;
              4'h9: pos_low = 10'h3b9;
              4'ha: pos_low = 10'h3b9;
              4'hb: pos_low = 10'h3b9;
              4'hc: pos_low = 10'h3ba;
              4'hd: pos_low = 10'h3ba;
              4'he: pos_low = 10'h3ba;
              4'hf: pos_low = 10'h3ba;
              default: pos_low = 10'h000;
            endcase
          end
          6'h01: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3bb;
              4'h1: pos_low = 10'h3bb;
              4'h2: pos_low = 10'h3bb;
              4'h3: pos_low = 10'h3bc;
              4'h4: pos_low = 10'h3bc;
              4'h5: pos_low = 10'h3bc;
              4'h6: pos_low = 10'h3bc;
              4'h7: pos_low = 10'h3bd;
              4'h8: pos_low = 10'h3bd;
              4'h9: pos_low = 10'h3bd;
              4'ha: pos_low = 10'h3bd;
              4'hb: pos_low = 10'h3be;
              4'hc: pos_low = 10'h3be;
              4'hd: pos_low = 10'h3be;
              4'he: pos_low = 10'h3be;
              4'hf: pos_low = 10'h3bf;
              default: pos_low = 10'h000;
            endcase
          end
          6'h02: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3bf;
              4'h1: pos_low = 10'h3bf;
              4'h2: pos_low = 10'h3bf;
              4'h3: pos_low = 10'h3c0;
              4'h4: pos_low = 10'h3c0;
              4'h5: pos_low = 10'h3c0;
              4'h6: pos_low = 10'h3c0;
              4'h7: pos_low = 10'h3c1;
              4'h8: pos_low = 10'h3c1;
              4'h9: pos_low = 10'h3c1;
              4'ha: pos_low = 10'h3c1;
              4'hb: pos_low = 10'h3c2;
              4'hc: pos_low = 10'h3c2;
              4'hd: pos_low = 10'h3c2;
              4'he: pos_low = 10'h3c2;
              4'hf: pos_low = 10'h3c2;
              default: pos_low = 10'h000;
            endcase
          end
          6'h03: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3c3;
              4'h1: pos_low = 10'h3c3;
              4'h2: pos_low = 10'h3c3;
              4'h3: pos_low = 10'h3c3;
              4'h4: pos_low = 10'h3c4;
              4'h5: pos_low = 10'h3c4;
              4'h6: pos_low = 10'h3c4;
              4'h7: pos_low = 10'h3c4;
              4'h8: pos_low = 10'h3c5;
              4'h9: pos_low = 10'h3c5;
              4'ha: pos_low = 10'h3c5;
              4'hb: pos_low = 10'h3c5;
              4'hc: pos_low = 10'h3c6;
              4'hd: pos_low = 10'h3c6;
              4'he: pos_low = 10'h3c6;
              4'hf: pos_low = 10'h3c6;
              default: pos_low = 10'h000;
            endcase
          end
          6'h04: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3c6;
              4'h1: pos_low = 10'h3c7;
              4'h2: pos_low = 10'h3c7;
              4'h3: pos_low = 10'h3c7;
              4'h4: pos_low = 10'h3c7;
              4'h5: pos_low = 10'h3c7;
              4'h6: pos_low = 10'h3c8;
              4'h7: pos_low = 10'h3c8;
              4'h8: pos_low = 10'h3c8;
              4'h9: pos_low = 10'h3c8;
              4'ha: pos_low = 10'h3c9;
              4'hb: pos_low = 10'h3c9;
              4'hc: pos_low = 10'h3c9;
              4'hd: pos_low = 10'h3c9;
              4'he: pos_low = 10'h3c9;
              4'hf: pos_low = 10'h3ca;
              default: pos_low = 10'h000;
            endcase
          end
          6'h05: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3ca;
              4'h1: pos_low = 10'h3ca;
              4'h2: pos_low = 10'h3ca;
              4'h3: pos_low = 10'h3ca;
              4'h4: pos_low = 10'h3cb;
              4'h5: pos_low = 10'h3cb;
              4'h6: pos_low = 10'h3cb;
              4'h7: pos_low = 10'h3cb;
              4'h8: pos_low = 10'h3cb;
              4'h9: pos_low = 10'h3cc;
              4'ha: pos_low = 10'h3cc;
              4'hb: pos_low = 10'h3cc;
              4'hc: pos_low = 10'h3cc;
              4'hd: pos_low = 10'h3cc;
              4'he: pos_low = 10'h3cd;
              4'hf: pos_low = 10'h3cd;
              default: pos_low = 10'h000;
            endcase
          end
          6'h06: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3cd;
              4'h1: pos_low = 10'h3cd;
              4'h2: pos_low = 10'h3cd;
              4'h3: pos_low = 10'h3ce;
              4'h4: pos_low = 10'h3ce;
              4'h5: pos_low = 10'h3ce;
              4'h6: pos_low = 10'h3ce;
              4'h7: pos_low = 10'h3ce;
              4'h8: pos_low = 10'h3cf;
              4'h9: pos_low = 10'h3cf;
              4'ha: pos_low = 10'h3cf;
              4'hb: pos_low = 10'h3cf;
              4'hc: pos_low = 10'h3cf;
              4'hd: pos_low = 10'h3d0;
              4'he: pos_low = 10'h3d0;
              4'hf: pos_low = 10'h3d0;
              default: pos_low = 10'h000;
            endcase
          end
          6'h07: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3d0;
              4'h1: pos_low = 10'h3d0;
              4'h2: pos_low = 10'h3d0;
              4'h3: pos_low = 10'h3d1;
              4'h4: pos_low = 10'h3d1;
              4'h5: pos_low = 10'h3d1;
              4'h6: pos_low = 10'h3d1;
              4'h7: pos_low = 10'h3d1;
              4'h8: pos_low = 10'h3d2;
              4'h9: pos_low = 10'h3d2;
              4'ha: pos_low = 10'h3d2;
              4'hb: pos_low = 10'h3d2;
              4'hc: pos_low = 10'h3d2;
              4'hd: pos_low = 10'h3d2;
              4'he: pos_low = 10'h3d3;
              4'hf: pos_low = 10'h3d3;
              default: pos_low = 10'h000;
            endcase
          end
          6'h08: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3d3;
              4'h1: pos_low = 10'h3d3;
              4'h2: pos_low = 10'h3d3;
              4'h3: pos_low = 10'h3d4;
              4'h4: pos_low = 10'h3d4;
              4'h5: pos_low = 10'h3d4;
              4'h6: pos_low = 10'h3d4;
              4'h7: pos_low = 10'h3d4;
              4'h8: pos_low = 10'h3d4;
              4'h9: pos_low = 10'h3d5;
              4'ha: pos_low = 10'h3d5;
              4'hb: pos_low = 10'h3d5;
              4'hc: pos_low = 10'h3d5;
              4'hd: pos_low = 10'h3d5;
              4'he: pos_low = 10'h3d5;
              4'hf: pos_low = 10'h3d6;
              default: pos_low = 10'h000;
            endcase
          end
          6'h09: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3d6;
              4'h1: pos_low = 10'h3d6;
              4'h2: pos_low = 10'h3d6;
              4'h3: pos_low = 10'h3d6;
              4'h4: pos_low = 10'h3d6;
              4'h5: pos_low = 10'h3d7;
              4'h6: pos_low = 10'h3d7;
              4'h7: pos_low = 10'h3d7;
              4'h8: pos_low = 10'h3d7;
              4'h9: pos_low = 10'h3d7;
              4'ha: pos_low = 10'h3d7;
              4'hb: pos_low = 10'h3d7;
              4'hc: pos_low = 10'h3d8;
              4'hd: pos_low = 10'h3d8;
              4'he: pos_low = 10'h3d8;
              4'hf: pos_low = 10'h3d8;
              default: pos_low = 10'h000;
            endcase
          end
          6'h0a: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3d8;
              4'h1: pos_low = 10'h3d8;
              4'h2: pos_low = 10'h3d9;
              4'h3: pos_low = 10'h3d9;
              4'h4: pos_low = 10'h3d9;
              4'h5: pos_low = 10'h3d9;
              4'h6: pos_low = 10'h3d9;
              4'h7: pos_low = 10'h3d9;
              4'h8: pos_low = 10'h3d9;
              4'h9: pos_low = 10'h3da;
              4'ha: pos_low = 10'h3da;
              4'hb: pos_low = 10'h3da;
              4'hc: pos_low = 10'h3da;
              4'hd: pos_low = 10'h3da;
              4'he: pos_low = 10'h3da;
              4'hf: pos_low = 10'h3da;
              default: pos_low = 10'h000;
            endcase
          end
          6'h0b: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3db;
              4'h1: pos_low = 10'h3db;
              4'h2: pos_low = 10'h3db;
              4'h3: pos_low = 10'h3db;
              4'h4: pos_low = 10'h3db;
              4'h5: pos_low = 10'h3db;
              4'h6: pos_low = 10'h3db;
              4'h7: pos_low = 10'h3dc;
              4'h8: pos_low = 10'h3dc;
              4'h9: pos_low = 10'h3dc;
              4'ha: pos_low = 10'h3dc;
              4'hb: pos_low = 10'h3dc;
              4'hc: pos_low = 10'h3dc;
              4'hd: pos_low = 10'h3dc;
              4'he: pos_low = 10'h3dd;
              4'hf: pos_low = 10'h3dd;
              default: pos_low = 10'h000;
            endcase
          end
          6'h0c: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3dd;
              4'h1: pos_low = 10'h3dd;
              4'h2: pos_low = 10'h3dd;
              4'h3: pos_low = 10'h3dd;
              4'h4: pos_low = 10'h3dd;
              4'h5: pos_low = 10'h3de;
              4'h6: pos_low = 10'h3de;
              4'h7: pos_low = 10'h3de;
              4'h8: pos_low = 10'h3de;
              4'h9: pos_low = 10'h3de;
              4'ha: pos_low = 10'h3de;
              4'hb: pos_low = 10'h3de;
              4'hc: pos_low = 10'h3de;
              4'hd: pos_low = 10'h3df;
              4'he: pos_low = 10'h3df;
              4'hf: pos_low = 10'h3df;
              default: pos_low = 10'h000;
            endcase
          end
          6'h0d: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3df;
              4'h1: pos_low = 10'h3df;
              4'h2: pos_low = 10'h3df;
              4'h3: pos_low = 10'h3df;
              4'h4: pos_low = 10'h3df;
              4'h5: pos_low = 10'h3e0;
              4'h6: pos_low = 10'h3e0;
              4'h7: pos_low = 10'h3e0;
              4'h8: pos_low = 10'h3e0;
              4'h9: pos_low = 10'h3e0;
              4'ha: pos_low = 10'h3e0;
              4'hb: pos_low = 10'h3e0;
              4'hc: pos_low = 10'h3e0;
              4'hd: pos_low = 10'h3e1;
              4'he: pos_low = 10'h3e1;
              4'hf: pos_low = 10'h3e1;
              default: pos_low = 10'h000;
            endcase
          end
          6'h0e: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3e1;
              4'h1: pos_low = 10'h3e1;
              4'h2: pos_low = 10'h3e1;
              4'h3: pos_low = 10'h3e1;
              4'h4: pos_low = 10'h3e1;
              4'h5: pos_low = 10'h3e2;
              4'h6: pos_low = 10'h3e2;
              4'h7: pos_low = 10'h3e2;
              4'h8: pos_low = 10'h3e2;
              4'h9: pos_low = 10'h3e2;
              4'ha: pos_low = 10'h3e2;
              4'hb: pos_low = 10'h3e2;
              4'hc: pos_low = 10'h3e2;
              4'hd: pos_low = 10'h3e2;
              4'he: pos_low = 10'h3e3;
              4'hf: pos_low = 10'h3e3;
              default: pos_low = 10'h000;
            endcase
          end
          6'h0f: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3e3;
              4'h1: pos_low = 10'h3e3;
              4'h2: pos_low = 10'h3e3;
              4'h3: pos_low = 10'h3e3;
              4'h4: pos_low = 10'h3e3;
              4'h5: pos_low = 10'h3e3;
              4'h6: pos_low = 10'h3e4;
              4'h7: pos_low = 10'h3e4;
              4'h8: pos_low = 10'h3e4;
              4'h9: pos_low = 10'h3e4;
              4'ha: pos_low = 10'h3e4;
              4'hb: pos_low = 10'h3e4;
              4'hc: pos_low = 10'h3e4;
              4'hd: pos_low = 10'h3e4;
              4'he: pos_low = 10'h3e4;
              4'hf: pos_low = 10'h3e4;
              default: pos_low = 10'h000;
            endcase
          end
          6'h10: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3e5;
              4'h1: pos_low = 10'h3e5;
              4'h2: pos_low = 10'h3e5;
              4'h3: pos_low = 10'h3e5;
              4'h4: pos_low = 10'h3e5;
              4'h5: pos_low = 10'h3e5;
              4'h6: pos_low = 10'h3e5;
              4'h7: pos_low = 10'h3e5;
              4'h8: pos_low = 10'h3e5;
              4'h9: pos_low = 10'h3e6;
              4'ha: pos_low = 10'h3e6;
              4'hb: pos_low = 10'h3e6;
              4'hc: pos_low = 10'h3e6;
              4'hd: pos_low = 10'h3e6;
              4'he: pos_low = 10'h3e6;
              4'hf: pos_low = 10'h3e6;
              default: pos_low = 10'h000;
            endcase
          end
          6'h11: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3e6;
              4'h1: pos_low = 10'h3e6;
              4'h2: pos_low = 10'h3e6;
              4'h3: pos_low = 10'h3e7;
              4'h4: pos_low = 10'h3e7;
              4'h5: pos_low = 10'h3e7;
              4'h6: pos_low = 10'h3e7;
              4'h7: pos_low = 10'h3e7;
              4'h8: pos_low = 10'h3e7;
              4'h9: pos_low = 10'h3e7;
              4'ha: pos_low = 10'h3e7;
              4'hb: pos_low = 10'h3e7;
              4'hc: pos_low = 10'h3e7;
              4'hd: pos_low = 10'h3e8;
              4'he: pos_low = 10'h3e8;
              4'hf: pos_low = 10'h3e8;
              default: pos_low = 10'h000;
            endcase
          end
          6'h12: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3e8;
              4'h1: pos_low = 10'h3e8;
              4'h2: pos_low = 10'h3e8;
              4'h3: pos_low = 10'h3e8;
              4'h4: pos_low = 10'h3e8;
              4'h5: pos_low = 10'h3e8;
              4'h6: pos_low = 10'h3e8;
              4'h7: pos_low = 10'h3e8;
              4'h8: pos_low = 10'h3e9;
              4'h9: pos_low = 10'h3e9;
              4'ha: pos_low = 10'h3e9;
              4'hb: pos_low = 10'h3e9;
              4'hc: pos_low = 10'h3e9;
              4'hd: pos_low = 10'h3e9;
              4'he: pos_low = 10'h3e9;
              4'hf: pos_low = 10'h3e9;
              default: pos_low = 10'h000;
            endcase
          end
          6'h13: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3e9;
              4'h1: pos_low = 10'h3e9;
              4'h2: pos_low = 10'h3e9;
              4'h3: pos_low = 10'h3ea;
              4'h4: pos_low = 10'h3ea;
              4'h5: pos_low = 10'h3ea;
              4'h6: pos_low = 10'h3ea;
              4'h7: pos_low = 10'h3ea;
              4'h8: pos_low = 10'h3ea;
              4'h9: pos_low = 10'h3ea;
              4'ha: pos_low = 10'h3ea;
              4'hb: pos_low = 10'h3ea;
              4'hc: pos_low = 10'h3ea;
              4'hd: pos_low = 10'h3ea;
              4'he: pos_low = 10'h3ea;
              4'hf: pos_low = 10'h3eb;
              default: pos_low = 10'h000;
            endcase
          end
          6'h14: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3eb;
              4'h1: pos_low = 10'h3eb;
              4'h2: pos_low = 10'h3eb;
              4'h3: pos_low = 10'h3eb;
              4'h4: pos_low = 10'h3eb;
              4'h5: pos_low = 10'h3eb;
              4'h6: pos_low = 10'h3eb;
              4'h7: pos_low = 10'h3eb;
              4'h8: pos_low = 10'h3eb;
              4'h9: pos_low = 10'h3eb;
              4'ha: pos_low = 10'h3eb;
              4'hb: pos_low = 10'h3ec;
              4'hc: pos_low = 10'h3ec;
              4'hd: pos_low = 10'h3ec;
              4'he: pos_low = 10'h3ec;
              4'hf: pos_low = 10'h3ec;
              default: pos_low = 10'h000;
            endcase
          end
          6'h15: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3ec;
              4'h1: pos_low = 10'h3ec;
              4'h2: pos_low = 10'h3ec;
              4'h3: pos_low = 10'h3ec;
              4'h4: pos_low = 10'h3ec;
              4'h5: pos_low = 10'h3ec;
              4'h6: pos_low = 10'h3ec;
              4'h7: pos_low = 10'h3ec;
              4'h8: pos_low = 10'h3ed;
              4'h9: pos_low = 10'h3ed;
              4'ha: pos_low = 10'h3ed;
              4'hb: pos_low = 10'h3ed;
              4'hc: pos_low = 10'h3ed;
              4'hd: pos_low = 10'h3ed;
              4'he: pos_low = 10'h3ed;
              4'hf: pos_low = 10'h3ed;
              default: pos_low = 10'h000;
            endcase
          end
          6'h16: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3ed;
              4'h1: pos_low = 10'h3ed;
              4'h2: pos_low = 10'h3ed;
              4'h3: pos_low = 10'h3ed;
              4'h4: pos_low = 10'h3ed;
              4'h5: pos_low = 10'h3ed;
              4'h6: pos_low = 10'h3ee;
              4'h7: pos_low = 10'h3ee;
              4'h8: pos_low = 10'h3ee;
              4'h9: pos_low = 10'h3ee;
              4'ha: pos_low = 10'h3ee;
              4'hb: pos_low = 10'h3ee;
              4'hc: pos_low = 10'h3ee;
              4'hd: pos_low = 10'h3ee;
              4'he: pos_low = 10'h3ee;
              4'hf: pos_low = 10'h3ee;
              default: pos_low = 10'h000;
            endcase
          end
          6'h17: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3ee;
              4'h1: pos_low = 10'h3ee;
              4'h2: pos_low = 10'h3ee;
              4'h3: pos_low = 10'h3ee;
              4'h4: pos_low = 10'h3ef;
              4'h5: pos_low = 10'h3ef;
              4'h6: pos_low = 10'h3ef;
              4'h7: pos_low = 10'h3ef;
              4'h8: pos_low = 10'h3ef;
              4'h9: pos_low = 10'h3ef;
              4'ha: pos_low = 10'h3ef;
              4'hb: pos_low = 10'h3ef;
              4'hc: pos_low = 10'h3ef;
              4'hd: pos_low = 10'h3ef;
              4'he: pos_low = 10'h3ef;
              4'hf: pos_low = 10'h3ef;
              default: pos_low = 10'h000;
            endcase
          end
          6'h18: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3ef;
              4'h1: pos_low = 10'h3ef;
              4'h2: pos_low = 10'h3ef;
              4'h3: pos_low = 10'h3f0;
              4'h4: pos_low = 10'h3f0;
              4'h5: pos_low = 10'h3f0;
              4'h6: pos_low = 10'h3f0;
              4'h7: pos_low = 10'h3f0;
              4'h8: pos_low = 10'h3f0;
              4'h9: pos_low = 10'h3f0;
              4'ha: pos_low = 10'h3f0;
              4'hb: pos_low = 10'h3f0;
              4'hc: pos_low = 10'h3f0;
              4'hd: pos_low = 10'h3f0;
              4'he: pos_low = 10'h3f0;
              4'hf: pos_low = 10'h3f0;
              default: pos_low = 10'h000;
            endcase
          end
          6'h19: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3f0;
              4'h1: pos_low = 10'h3f0;
              4'h2: pos_low = 10'h3f0;
              4'h3: pos_low = 10'h3f1;
              4'h4: pos_low = 10'h3f1;
              4'h5: pos_low = 10'h3f1;
              4'h6: pos_low = 10'h3f1;
              4'h7: pos_low = 10'h3f1;
              4'h8: pos_low = 10'h3f1;
              4'h9: pos_low = 10'h3f1;
              4'ha: pos_low = 10'h3f1;
              4'hb: pos_low = 10'h3f1;
              4'hc: pos_low = 10'h3f1;
              4'hd: pos_low = 10'h3f1;
              4'he: pos_low = 10'h3f1;
              4'hf: pos_low = 10'h3f1;
              default: pos_low = 10'h000;
            endcase
          end
          6'h1a: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3f1;
              4'h1: pos_low = 10'h3f1;
              4'h2: pos_low = 10'h3f1;
              4'h3: pos_low = 10'h3f1;
              4'h4: pos_low = 10'h3f2;
              4'h5: pos_low = 10'h3f2;
              4'h6: pos_low = 10'h3f2;
              4'h7: pos_low = 10'h3f2;
              4'h8: pos_low = 10'h3f2;
              4'h9: pos_low = 10'h3f2;
              4'ha: pos_low = 10'h3f2;
              4'hb: pos_low = 10'h3f2;
              4'hc: pos_low = 10'h3f2;
              4'hd: pos_low = 10'h3f2;
              4'he: pos_low = 10'h3f2;
              4'hf: pos_low = 10'h3f2;
              default: pos_low = 10'h000;
            endcase
          end
          6'h1b: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3f2;
              4'h1: pos_low = 10'h3f2;
              4'h2: pos_low = 10'h3f2;
              4'h3: pos_low = 10'h3f2;
              4'h4: pos_low = 10'h3f2;
              4'h5: pos_low = 10'h3f2;
              4'h6: pos_low = 10'h3f2;
              4'h7: pos_low = 10'h3f3;
              4'h8: pos_low = 10'h3f3;
              4'h9: pos_low = 10'h3f3;
              4'ha: pos_low = 10'h3f3;
              4'hb: pos_low = 10'h3f3;
              4'hc: pos_low = 10'h3f3;
              4'hd: pos_low = 10'h3f3;
              4'he: pos_low = 10'h3f3;
              4'hf: pos_low = 10'h3f3;
              default: pos_low = 10'h000;
            endcase
          end
          6'h1c: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3f3;
              4'h1: pos_low = 10'h3f3;
              4'h2: pos_low = 10'h3f3;
              4'h3: pos_low = 10'h3f3;
              4'h4: pos_low = 10'h3f3;
              4'h5: pos_low = 10'h3f3;
              4'h6: pos_low = 10'h3f3;
              4'h7: pos_low = 10'h3f3;
              4'h8: pos_low = 10'h3f3;
              4'h9: pos_low = 10'h3f3;
              4'ha: pos_low = 10'h3f4;
              4'hb: pos_low = 10'h3f4;
              4'hc: pos_low = 10'h3f4;
              4'hd: pos_low = 10'h3f4;
              4'he: pos_low = 10'h3f4;
              4'hf: pos_low = 10'h3f4;
              default: pos_low = 10'h000;
            endcase
          end
          6'h1d: pos_low = 10'h3f4;
          6'h1e: pos_low = 10'h3f5;
          6'h1f: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3f5;
              4'h1: pos_low = 10'h3f5;
              4'h2: pos_low = 10'h3f5;
              4'h3: pos_low = 10'h3f5;
              4'h4: pos_low = 10'h3f5;
              4'h5: pos_low = 10'h3f5;
              4'h6: pos_low = 10'h3f5;
              4'h7: pos_low = 10'h3f6;
              4'h8: pos_low = 10'h3f6;
              4'h9: pos_low = 10'h3f6;
              4'ha: pos_low = 10'h3f6;
              4'hb: pos_low = 10'h3f6;
              4'hc: pos_low = 10'h3f6;
              4'hd: pos_low = 10'h3f6;
              4'he: pos_low = 10'h3f6;
              4'hf: pos_low = 10'h3f6;
              default: pos_low = 10'h000;
            endcase
          end
          6'h20: pos_low = 10'h3f6;
          6'h21: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3f6;
              4'h1: pos_low = 10'h3f7;
              4'h2: pos_low = 10'h3f7;
              4'h3: pos_low = 10'h3f7;
              4'h4: pos_low = 10'h3f7;
              4'h5: pos_low = 10'h3f7;
              4'h6: pos_low = 10'h3f7;
              4'h7: pos_low = 10'h3f7;
              4'h8: pos_low = 10'h3f7;
              4'h9: pos_low = 10'h3f7;
              4'ha: pos_low = 10'h3f7;
              4'hb: pos_low = 10'h3f7;
              4'hc: pos_low = 10'h3f7;
              4'hd: pos_low = 10'h3f7;
              4'he: pos_low = 10'h3f7;
              4'hf: pos_low = 10'h3f7;
              default: pos_low = 10'h000;
            endcase
          end
          6'h22: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3f7;
              4'h1: pos_low = 10'h3f7;
              4'h2: pos_low = 10'h3f7;
              4'h3: pos_low = 10'h3f7;
              4'h4: pos_low = 10'h3f7;
              4'h5: pos_low = 10'h3f7;
              4'h6: pos_low = 10'h3f7;
              4'h7: pos_low = 10'h3f7;
              4'h8: pos_low = 10'h3f7;
              4'h9: pos_low = 10'h3f7;
              4'ha: pos_low = 10'h3f7;
              4'hb: pos_low = 10'h3f7;
              4'hc: pos_low = 10'h3f7;
              4'hd: pos_low = 10'h3f8;
              4'he: pos_low = 10'h3f8;
              4'hf: pos_low = 10'h3f8;
              default: pos_low = 10'h000;
            endcase
          end
          6'h23: pos_low = 10'h3f8;
          6'h24: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3f8;
              4'h1: pos_low = 10'h3f8;
              4'h2: pos_low = 10'h3f8;
              4'h3: pos_low = 10'h3f8;
              4'h4: pos_low = 10'h3f8;
              4'h5: pos_low = 10'h3f8;
              4'h6: pos_low = 10'h3f8;
              4'h7: pos_low = 10'h3f8;
              4'h8: pos_low = 10'h3f8;
              4'h9: pos_low = 10'h3f8;
              4'ha: pos_low = 10'h3f8;
              4'hb: pos_low = 10'h3f8;
              4'hc: pos_low = 10'h3f8;
              4'hd: pos_low = 10'h3f8;
              4'he: pos_low = 10'h3f9;
              4'hf: pos_low = 10'h3f9;
              default: pos_low = 10'h000;
            endcase
          end
          6'h25: pos_low = 10'h3f9;
          6'h26: pos_low = 10'h3f9;
          6'h27: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3f9;
              4'h1: pos_low = 10'h3f9;
              4'h2: pos_low = 10'h3fa;
              4'h3: pos_low = 10'h3fa;
              4'h4: pos_low = 10'h3fa;
              4'h5: pos_low = 10'h3fa;
              4'h6: pos_low = 10'h3fa;
              4'h7: pos_low = 10'h3fa;
              4'h8: pos_low = 10'h3fa;
              4'h9: pos_low = 10'h3fa;
              4'ha: pos_low = 10'h3fa;
              4'hb: pos_low = 10'h3fa;
              4'hc: pos_low = 10'h3fa;
              4'hd: pos_low = 10'h3fa;
              4'he: pos_low = 10'h3fa;
              4'hf: pos_low = 10'h3fa;
              default: pos_low = 10'h000;
            endcase
          end
          6'h28: pos_low = 10'h3fa;
          6'h29: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3fa;
              4'h1: pos_low = 10'h3fa;
              4'h2: pos_low = 10'h3fa;
              4'h3: pos_low = 10'h3fa;
              4'h4: pos_low = 10'h3fa;
              4'h5: pos_low = 10'h3fa;
              4'h6: pos_low = 10'h3fa;
              4'h7: pos_low = 10'h3fa;
              4'h8: pos_low = 10'h3fa;
              4'h9: pos_low = 10'h3fa;
              4'ha: pos_low = 10'h3fa;
              4'hb: pos_low = 10'h3fa;
              4'hc: pos_low = 10'h3fa;
              4'hd: pos_low = 10'h3fb;
              4'he: pos_low = 10'h3fb;
              4'hf: pos_low = 10'h3fb;
              default: pos_low = 10'h000;
            endcase
          end
          6'h2a: pos_low = 10'h3fb;
          6'h2b: pos_low = 10'h3fb;
          6'h2c: pos_low = 10'h3fb;
          6'h2d: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3fb;
              4'h1: pos_low = 10'h3fc;
              4'h2: pos_low = 10'h3fc;
              4'h3: pos_low = 10'h3fc;
              4'h4: pos_low = 10'h3fc;
              4'h5: pos_low = 10'h3fc;
              4'h6: pos_low = 10'h3fc;
              4'h7: pos_low = 10'h3fc;
              4'h8: pos_low = 10'h3fc;
              4'h9: pos_low = 10'h3fc;
              4'ha: pos_low = 10'h3fc;
              4'hb: pos_low = 10'h3fc;
              4'hc: pos_low = 10'h3fc;
              4'hd: pos_low = 10'h3fc;
              4'he: pos_low = 10'h3fc;
              4'hf: pos_low = 10'h3fc;
              default: pos_low = 10'h000;
            endcase
          end
          6'h2e: pos_low = 10'h3fc;
          6'h2f: pos_low = 10'h3fc;
          6'h30: pos_low = 10'h3fc;
          6'h31: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3fc;
              4'h1: pos_low = 10'h3fd;
              4'h2: pos_low = 10'h3fd;
              4'h3: pos_low = 10'h3fd;
              4'h4: pos_low = 10'h3fd;
              4'h5: pos_low = 10'h3fd;
              4'h6: pos_low = 10'h3fd;
              4'h7: pos_low = 10'h3fd;
              4'h8: pos_low = 10'h3fd;
              4'h9: pos_low = 10'h3fd;
              4'ha: pos_low = 10'h3fd;
              4'hb: pos_low = 10'h3fd;
              4'hc: pos_low = 10'h3fd;
              4'hd: pos_low = 10'h3fd;
              4'he: pos_low = 10'h3fd;
              4'hf: pos_low = 10'h3fd;
              default: pos_low = 10'h000;
            endcase
          end
          6'h32: pos_low = 10'h3fd;
          6'h33: pos_low = 10'h3fd;
          6'h34: pos_low = 10'h3fd;
          6'h35: pos_low = 10'h3fd;
          6'h36: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3fd;
              4'h1: pos_low = 10'h3fd;
              4'h2: pos_low = 10'h3fd;
              4'h3: pos_low = 10'h3fd;
              4'h4: pos_low = 10'h3fd;
              4'h5: pos_low = 10'h3fd;
              4'h6: pos_low = 10'h3fd;
              4'h7: pos_low = 10'h3fe;
              4'h8: pos_low = 10'h3fe;
              4'h9: pos_low = 10'h3fe;
              4'ha: pos_low = 10'h3fe;
              4'hb: pos_low = 10'h3fe;
              4'hc: pos_low = 10'h3fe;
              4'hd: pos_low = 10'h3fe;
              4'he: pos_low = 10'h3fe;
              4'hf: pos_low = 10'h3fe;
              default: pos_low = 10'h000;
            endcase
          end
          6'h37: pos_low = 10'h3fe;
          6'h38: pos_low = 10'h3fe;
          6'h39: pos_low = 10'h3fe;
          6'h3a: pos_low = 10'h3fe;
          6'h3b: pos_low = 10'h3fe;
          6'h3c: pos_low = 10'h3fe;
          6'h3d: pos_low = 10'h3fe;
          6'h3e: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3fe;
              4'h1: pos_low = 10'h3fe;
              4'h2: pos_low = 10'h3fe;
              4'h3: pos_low = 10'h3fe;
              4'h4: pos_low = 10'h3fe;
              4'h5: pos_low = 10'h3fe;
              4'h6: pos_low = 10'h3fe;
              4'h7: pos_low = 10'h3fe;
              4'h8: pos_low = 10'h3fe;
              4'h9: pos_low = 10'h3fe;
              4'ha: pos_low = 10'h3ff;
              4'hb: pos_low = 10'h3ff;
              4'hc: pos_low = 10'h3ff;
              4'hd: pos_low = 10'h3ff;
              4'he: pos_low = 10'h3ff;
              4'hf: pos_low = 10'h3ff;
              default: pos_low = 10'h000;
            endcase
          end
          6'h3f: pos_low = 10'h3ff;
          default: begin end
        endcase
      end
      5'h11: begin
        case (mant[9:4])
          6'h00: pos_low = 10'h3ff;
          6'h01: pos_low = 10'h3ff;
          6'h02: pos_low = 10'h3ff;
          6'h03: pos_low = 10'h3ff;
          6'h04: pos_low = 10'h3ff;
          6'h05: pos_low = 10'h3ff;
          6'h06: pos_low = 10'h3ff;
          6'h07: pos_low = 10'h3ff;
          6'h08: begin
            case (mant[3:0])
              4'h0: pos_low = 10'h3ff;
              4'h1: pos_low = 10'h3ff;
              4'h2: pos_low = 10'h000;
              4'h3: pos_low = 10'h000;
              4'h4: pos_low = 10'h000;
              4'h5: pos_low = 10'h000;
              4'h6: pos_low = 10'h000;
              4'h7: pos_low = 10'h000;
              4'h8: pos_low = 10'h000;
              4'h9: pos_low = 10'h000;
              4'ha: pos_low = 10'h000;
              4'hb: pos_low = 10'h000;
              4'hc: pos_low = 10'h000;
              4'hd: pos_low = 10'h000;
              4'he: pos_low = 10'h000;
              4'hf: pos_low = 10'h000;
              default: pos_low = 10'h000;
            endcase
          end
          6'h09: pos_low = 10'h000;
          6'h0a: pos_low = 10'h000;
          6'h0b: pos_low = 10'h000;
          6'h0c: pos_low = 10'h000;
          6'h0d: pos_low = 10'h000;
          6'h0e: pos_low = 10'h000;
          6'h0f: pos_low = 10'h000;
          6'h10: pos_low = 10'h000;
          6'h11: pos_low = 10'h000;
          6'h12: pos_low = 10'h000;
          6'h13: pos_low = 10'h000;
          6'h14: pos_low = 10'h000;
          6'h15: pos_low = 10'h000;
          6'h16: pos_low = 10'h000;
          6'h17: pos_low = 10'h000;
          6'h18: pos_low = 10'h000;
          6'h19: pos_low = 10'h000;
          6'h1a: pos_low = 10'h000;
          6'h1b: pos_low = 10'h000;
          6'h1c: pos_low = 10'h000;
          6'h1d: pos_low = 10'h000;
          6'h1e: pos_low = 10'h000;
          6'h1f: pos_low = 10'h000;
          6'h20: pos_low = 10'h000;
          6'h21: pos_low = 10'h000;
          6'h22: pos_low = 10'h000;
          6'h23: pos_low = 10'h000;
          6'h24: pos_low = 10'h000;
          6'h25: pos_low = 10'h000;
          6'h26: pos_low = 10'h000;
          6'h27: pos_low = 10'h000;
          6'h28: pos_low = 10'h000;
          6'h29: pos_low = 10'h000;
          6'h2a: pos_low = 10'h000;
          6'h2b: pos_low = 10'h000;
          6'h2c: pos_low = 10'h000;
          6'h2d: pos_low = 10'h000;
          6'h2e: pos_low = 10'h000;
          6'h2f: pos_low = 10'h000;
          6'h30: pos_low = 10'h000;
          6'h31: pos_low = 10'h000;
          6'h32: pos_low = 10'h000;
          6'h33: pos_low = 10'h000;
          6'h34: pos_low = 10'h000;
          6'h35: pos_low = 10'h000;
          6'h36: pos_low = 10'h000;
          6'h37: pos_low = 10'h000;
          6'h38: pos_low = 10'h000;
          6'h39: pos_low = 10'h000;
          6'h3a: pos_low = 10'h000;
          6'h3b: pos_low = 10'h000;
          6'h3c: pos_low = 10'h000;
          6'h3d: pos_low = 10'h000;
          6'h3e: pos_low = 10'h000;
          6'h3f: pos_low = 10'h000;
          default: begin end
        endcase
      end
      default: begin end
    endcase
  end
  reg pos_b15;
  always @* begin
    pos_b15 = 1'b0;
    case (exp)
      5'h01: begin
        pos_b15 = 0;
      end
      5'h02: begin
        pos_b15 = 0;
      end
      5'h03: begin
        pos_b15 = 0;
      end
      5'h04: begin
        pos_b15 = 0;
      end
      5'h05: begin
        pos_b15 = 0;
      end
      5'h06: begin
        pos_b15 = 0;
      end
      5'h07: begin
        pos_b15 = 0;
      end
      5'h08: begin
        pos_b15 = 0;
      end
      5'h09: begin
        pos_b15 = 0;
      end
      5'h0a: begin
        pos_b15 = 0;
      end
      5'h0b: begin
        pos_b15 = 0;
      end
      5'h0c: begin
        pos_b15 = 0;
      end
      5'h0d: begin
        pos_b15 = 0;
      end
      5'h0e: begin
        pos_b15 = 0;
      end
      5'h0f: begin
        pos_b15 = 0;
      end
      5'h10: begin
        pos_b15 = 0;
      end
      5'h11: begin
        pos_b15 = 0;
      end
      default: begin end
    endcase
  end
  reg pos_b14;
  always @* begin
    pos_b14 = 1'b0;
    case (exp)
      5'h01: begin
        pos_b14 = 0;
      end
      5'h02: begin
        pos_b14 = 0;
      end
      5'h03: begin
        pos_b14 = 0;
      end
      5'h04: begin
        pos_b14 = 0;
      end
      5'h05: begin
        pos_b14 = 0;
      end
      5'h06: begin
        pos_b14 = 0;
      end
      5'h07: begin
        pos_b14 = 0;
      end
      5'h08: begin
        pos_b14 = 0;
      end
      5'h09: begin
        pos_b14 = 0;
      end
      5'h0a: begin
        pos_b14 = 0;
      end
      5'h0b: begin
        pos_b14 = 0;
      end
      5'h0c: begin
        pos_b14 = 0;
      end
      5'h0d: begin
        pos_b14 = 0;
      end
      5'h0e: begin
        pos_b14 = 0;
      end
      5'h0f: begin
        pos_b14 = 0;
      end
      5'h10: begin
        pos_b14 = 0;
      end
      5'h11: begin
        pos_b14 = 0;
      end
      default: begin end
    endcase
  end
  reg pos_b13;
  always @* begin
    pos_b13 = 1'b0;
    case (exp)
      5'h01: begin
        pos_b13 = 0;
      end
      5'h02: begin
        pos_b13 = 0;
      end
      5'h03: begin
        pos_b13 = 0;
      end
      5'h04: begin
        pos_b13 = 0;
      end
      5'h05: begin
        pos_b13 = 0;
      end
      5'h06: begin
        pos_b13 = 0;
      end
      5'h07: begin
        pos_b13 = 0;
      end
      5'h08: begin
        pos_b13 = 1;
      end
      5'h09: begin
        pos_b13 = 1;
      end
      5'h0a: begin
        pos_b13 = 1;
      end
      5'h0b: begin
        pos_b13 = 1;
      end
      5'h0c: begin
        pos_b13 = 1;
      end
      5'h0d: begin
        pos_b13 = 1;
      end
      5'h0e: begin
        pos_b13 = 1;
      end
      5'h0f: begin
        pos_b13 = 1;
      end
      5'h10: begin
        pos_b13 = 1;
      end
      5'h11: begin
        pos_b13 = 1;
      end
      default: begin end
    endcase
  end
  reg pos_b12;
  always @* begin
    pos_b12 = 1'b0;
    case (exp)
      5'h01: begin
        pos_b12 = 0;
      end
      5'h02: begin
        pos_b12 = 0;
      end
      5'h03: begin
        pos_b12 = 0;
      end
      5'h04: begin
        pos_b12 = 1;
      end
      5'h05: begin
        pos_b12 = 1;
      end
      5'h06: begin
        pos_b12 = 1;
      end
      5'h07: begin
        pos_b12 = 1;
      end
      5'h08: begin
        pos_b12 = 0;
      end
      5'h09: begin
        pos_b12 = 0;
      end
      5'h0a: begin
        pos_b12 = 0;
      end
      5'h0b: begin
        pos_b12 = 0;
      end
      5'h0c: begin
        if (mant <= 10'h005) begin
          pos_b12 = 0;
        end else begin
          pos_b12 = 1;
        end
      end
      5'h0d: begin
        pos_b12 = 1;
      end
      5'h0e: begin
        pos_b12 = 1;
      end
      5'h0f: begin
        pos_b12 = 1;
      end
      5'h10: begin
        pos_b12 = 1;
      end
      5'h11: begin
        pos_b12 = 1;
      end
      default: begin end
    endcase
  end
  reg pos_b11;
  always @* begin
    pos_b11 = 1'b0;
    case (exp)
      5'h01: begin
        pos_b11 = 0;
      end
      5'h02: begin
        pos_b11 = 1;
      end
      5'h03: begin
        pos_b11 = 1;
      end
      5'h04: begin
        pos_b11 = 0;
      end
      5'h05: begin
        pos_b11 = 0;
      end
      5'h06: begin
        pos_b11 = 1;
      end
      5'h07: begin
        pos_b11 = 1;
      end
      5'h08: begin
        pos_b11 = 0;
      end
      5'h09: begin
        pos_b11 = 0;
      end
      5'h0a: begin
        if (mant <= 10'h000) begin
          pos_b11 = 0;
        end else begin
          pos_b11 = 1;
        end
      end
      5'h0b: begin
        pos_b11 = 1;
      end
      5'h0c: begin
        if (mant <= 10'h005) begin
          pos_b11 = 1;
        end else begin
          pos_b11 = 0;
        end
      end
      5'h0d: begin
        pos_b11 = 0;
      end
      5'h0e: begin
        if (mant <= 10'h064) begin
          pos_b11 = 0;
        end else begin
          pos_b11 = 1;
        end
      end
      5'h0f: begin
        pos_b11 = 1;
      end
      5'h10: begin
        pos_b11 = 1;
      end
      5'h11: begin
        pos_b11 = 1;
      end
      default: begin end
    endcase
  end
  reg pos_b10;
  always @* begin
    pos_b10 = 1'b0;
    case (exp)
      5'h01: begin
        pos_b10 = 1;
      end
      5'h02: begin
        pos_b10 = 0;
      end
      5'h03: begin
        pos_b10 = 1;
      end
      5'h04: begin
        pos_b10 = 0;
      end
      5'h05: begin
        pos_b10 = 1;
      end
      5'h06: begin
        pos_b10 = 0;
      end
      5'h07: begin
        pos_b10 = 1;
      end
      5'h08: begin
        pos_b10 = 0;
      end
      5'h09: begin
        pos_b10 = 1;
      end
      5'h0a: begin
        if (mant <= 10'h000) begin
          pos_b10 = 1;
        end else begin
          pos_b10 = 0;
        end
      end
      5'h0b: begin
        if (mant <= 10'h001) begin
          pos_b10 = 0;
        end else begin
          pos_b10 = 1;
        end
      end
      5'h0c: begin
        if (mant <= 10'h005) begin
          pos_b10 = 1;
        end else begin
          pos_b10 = 0;
        end
      end
      5'h0d: begin
        if (mant <= 10'h015) begin
          pos_b10 = 0;
        end else begin
          pos_b10 = 1;
        end
      end
      5'h0e: begin
        if (mant <= 10'h064) begin
          pos_b10 = 1;
        end else begin
          pos_b10 = 0;
        end
      end
      5'h0f: begin
        pos_b10 = 0;
      end
      5'h10: begin
        pos_b10 = 0;
      end
      5'h11: begin
        if (mant <= 10'h081) begin
          pos_b10 = 0;
        end else begin
          pos_b10 = 1;
        end
      end
      default: begin end
    endcase
  end
  wire [15:0] pos_normal = {pos_b15, pos_b14, pos_b13, pos_b12, pos_b11, pos_b10, pos_low};
  wire [15:0] pos_out = active_exp ? pos_normal : pos_special;
  wire [15:0] neg_out = (pos_out == 16'h7e00) ? 16'h7e00 : (pos_out ^ 16'h8000);
  assign out = sign ? neg_out : pos_out;
endmodule
