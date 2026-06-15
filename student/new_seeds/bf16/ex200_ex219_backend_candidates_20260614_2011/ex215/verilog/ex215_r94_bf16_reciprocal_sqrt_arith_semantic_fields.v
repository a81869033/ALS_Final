module ex215_r94_bf16_reciprocal_sqrt_arith_semantic_fields(in, out);
  input [15:0] in;
  output [15:0] out;
  wire sign = in[15];
  wire [7:0] exp = in[14:7];
  wire [6:0] mant = in[6:0];
  wire signed [10:0] exp_s = $signed({3'b000, exp});
  reg signed [10:0] base_exp;
  reg [1:0] exp_class;
  reg signed [3:0] exp_delta;
  reg [6:0] norm_mant;
  always @* begin
    base_exp = 11'sd0;
    exp_class = 2'd0;
    base_exp = (11'sd381 - exp_s) >>> 1;
    exp_class = {1'b0, exp[0]};
  end
  always @* begin
    exp_delta = 4'sd0;
    norm_mant = 7'h00;
    case ({exp_class, mant})
      9'h000: begin exp_delta = 4'sd0; norm_mant = 7'h35; end
      9'h001: begin exp_delta = 4'sd0; norm_mant = 7'h34; end
      9'h002: begin exp_delta = 4'sd0; norm_mant = 7'h34; end
      9'h003: begin exp_delta = 4'sd0; norm_mant = 7'h33; end
      9'h004: begin exp_delta = 4'sd0; norm_mant = 7'h32; end
      9'h005: begin exp_delta = 4'sd0; norm_mant = 7'h32; end
      9'h006: begin exp_delta = 4'sd0; norm_mant = 7'h31; end
      9'h007: begin exp_delta = 4'sd0; norm_mant = 7'h30; end
      9'h008: begin exp_delta = 4'sd0; norm_mant = 7'h30; end
      9'h009: begin exp_delta = 4'sd0; norm_mant = 7'h2f; end
      9'h00a: begin exp_delta = 4'sd0; norm_mant = 7'h2e; end
      9'h00b: begin exp_delta = 4'sd0; norm_mant = 7'h2e; end
      9'h00c: begin exp_delta = 4'sd0; norm_mant = 7'h2d; end
      9'h00d: begin exp_delta = 4'sd0; norm_mant = 7'h2c; end
      9'h00e: begin exp_delta = 4'sd0; norm_mant = 7'h2c; end
      9'h00f: begin exp_delta = 4'sd0; norm_mant = 7'h2b; end
      9'h010: begin exp_delta = 4'sd0; norm_mant = 7'h2b; end
      9'h011: begin exp_delta = 4'sd0; norm_mant = 7'h2a; end
      9'h012: begin exp_delta = 4'sd0; norm_mant = 7'h29; end
      9'h013: begin exp_delta = 4'sd0; norm_mant = 7'h29; end
      9'h014: begin exp_delta = 4'sd0; norm_mant = 7'h28; end
      9'h015: begin exp_delta = 4'sd0; norm_mant = 7'h28; end
      9'h016: begin exp_delta = 4'sd0; norm_mant = 7'h27; end
      9'h017: begin exp_delta = 4'sd0; norm_mant = 7'h27; end
      9'h018: begin exp_delta = 4'sd0; norm_mant = 7'h26; end
      9'h019: begin exp_delta = 4'sd0; norm_mant = 7'h26; end
      9'h01a: begin exp_delta = 4'sd0; norm_mant = 7'h25; end
      9'h01b: begin exp_delta = 4'sd0; norm_mant = 7'h24; end
      9'h01c: begin exp_delta = 4'sd0; norm_mant = 7'h24; end
      9'h01d: begin exp_delta = 4'sd0; norm_mant = 7'h23; end
      9'h01e: begin exp_delta = 4'sd0; norm_mant = 7'h23; end
      9'h01f: begin exp_delta = 4'sd0; norm_mant = 7'h22; end
      9'h020: begin exp_delta = 4'sd0; norm_mant = 7'h22; end
      9'h021: begin exp_delta = 4'sd0; norm_mant = 7'h21; end
      9'h022: begin exp_delta = 4'sd0; norm_mant = 7'h21; end
      9'h023: begin exp_delta = 4'sd0; norm_mant = 7'h20; end
      9'h024: begin exp_delta = 4'sd0; norm_mant = 7'h20; end
      9'h025: begin exp_delta = 4'sd0; norm_mant = 7'h1f; end
      9'h026: begin exp_delta = 4'sd0; norm_mant = 7'h1f; end
      9'h027: begin exp_delta = 4'sd0; norm_mant = 7'h1e; end
      9'h028: begin exp_delta = 4'sd0; norm_mant = 7'h1e; end
      9'h029: begin exp_delta = 4'sd0; norm_mant = 7'h1e; end
      9'h02a: begin exp_delta = 4'sd0; norm_mant = 7'h1d; end
      9'h02b: begin exp_delta = 4'sd0; norm_mant = 7'h1d; end
      9'h02c: begin exp_delta = 4'sd0; norm_mant = 7'h1c; end
      9'h02d: begin exp_delta = 4'sd0; norm_mant = 7'h1c; end
      9'h02e: begin exp_delta = 4'sd0; norm_mant = 7'h1b; end
      9'h02f: begin exp_delta = 4'sd0; norm_mant = 7'h1b; end
      9'h030: begin exp_delta = 4'sd0; norm_mant = 7'h1a; end
      9'h031: begin exp_delta = 4'sd0; norm_mant = 7'h1a; end
      9'h032: begin exp_delta = 4'sd0; norm_mant = 7'h1a; end
      9'h033: begin exp_delta = 4'sd0; norm_mant = 7'h19; end
      9'h034: begin exp_delta = 4'sd0; norm_mant = 7'h19; end
      9'h035: begin exp_delta = 4'sd0; norm_mant = 7'h18; end
      9'h036: begin exp_delta = 4'sd0; norm_mant = 7'h18; end
      9'h037: begin exp_delta = 4'sd0; norm_mant = 7'h17; end
      9'h038: begin exp_delta = 4'sd0; norm_mant = 7'h17; end
      9'h039: begin exp_delta = 4'sd0; norm_mant = 7'h17; end
      9'h03a: begin exp_delta = 4'sd0; norm_mant = 7'h16; end
      9'h03b: begin exp_delta = 4'sd0; norm_mant = 7'h16; end
      9'h03c: begin exp_delta = 4'sd0; norm_mant = 7'h15; end
      9'h03d: begin exp_delta = 4'sd0; norm_mant = 7'h15; end
      9'h03e: begin exp_delta = 4'sd0; norm_mant = 7'h15; end
      9'h03f: begin exp_delta = 4'sd0; norm_mant = 7'h14; end
      9'h040: begin exp_delta = 4'sd0; norm_mant = 7'h14; end
      9'h041: begin exp_delta = 4'sd0; norm_mant = 7'h13; end
      9'h042: begin exp_delta = 4'sd0; norm_mant = 7'h13; end
      9'h043: begin exp_delta = 4'sd0; norm_mant = 7'h13; end
      9'h044: begin exp_delta = 4'sd0; norm_mant = 7'h12; end
      9'h045: begin exp_delta = 4'sd0; norm_mant = 7'h12; end
      9'h046: begin exp_delta = 4'sd0; norm_mant = 7'h12; end
      9'h047: begin exp_delta = 4'sd0; norm_mant = 7'h11; end
      9'h048: begin exp_delta = 4'sd0; norm_mant = 7'h11; end
      9'h049: begin exp_delta = 4'sd0; norm_mant = 7'h10; end
      9'h04a: begin exp_delta = 4'sd0; norm_mant = 7'h10; end
      9'h04b: begin exp_delta = 4'sd0; norm_mant = 7'h10; end
      9'h04c: begin exp_delta = 4'sd0; norm_mant = 7'h0f; end
      9'h04d: begin exp_delta = 4'sd0; norm_mant = 7'h0f; end
      9'h04e: begin exp_delta = 4'sd0; norm_mant = 7'h0f; end
      9'h04f: begin exp_delta = 4'sd0; norm_mant = 7'h0e; end
      9'h050: begin exp_delta = 4'sd0; norm_mant = 7'h0e; end
      9'h051: begin exp_delta = 4'sd0; norm_mant = 7'h0e; end
      9'h052: begin exp_delta = 4'sd0; norm_mant = 7'h0d; end
      9'h053: begin exp_delta = 4'sd0; norm_mant = 7'h0d; end
      9'h054: begin exp_delta = 4'sd0; norm_mant = 7'h0d; end
      9'h055: begin exp_delta = 4'sd0; norm_mant = 7'h0c; end
      9'h056: begin exp_delta = 4'sd0; norm_mant = 7'h0c; end
      9'h057: begin exp_delta = 4'sd0; norm_mant = 7'h0c; end
      9'h058: begin exp_delta = 4'sd0; norm_mant = 7'h0b; end
      9'h059: begin exp_delta = 4'sd0; norm_mant = 7'h0b; end
      9'h05a: begin exp_delta = 4'sd0; norm_mant = 7'h0b; end
      9'h05b: begin exp_delta = 4'sd0; norm_mant = 7'h0a; end
      9'h05c: begin exp_delta = 4'sd0; norm_mant = 7'h0a; end
      9'h05d: begin exp_delta = 4'sd0; norm_mant = 7'h0a; end
      9'h05e: begin exp_delta = 4'sd0; norm_mant = 7'h09; end
      9'h05f: begin exp_delta = 4'sd0; norm_mant = 7'h09; end
      9'h060: begin exp_delta = 4'sd0; norm_mant = 7'h09; end
      9'h061: begin exp_delta = 4'sd0; norm_mant = 7'h09; end
      9'h062: begin exp_delta = 4'sd0; norm_mant = 7'h08; end
      9'h063: begin exp_delta = 4'sd0; norm_mant = 7'h08; end
      9'h064: begin exp_delta = 4'sd0; norm_mant = 7'h08; end
      9'h065: begin exp_delta = 4'sd0; norm_mant = 7'h07; end
      9'h066: begin exp_delta = 4'sd0; norm_mant = 7'h07; end
      9'h067: begin exp_delta = 4'sd0; norm_mant = 7'h07; end
      9'h068: begin exp_delta = 4'sd0; norm_mant = 7'h06; end
      9'h069: begin exp_delta = 4'sd0; norm_mant = 7'h06; end
      9'h06a: begin exp_delta = 4'sd0; norm_mant = 7'h06; end
      9'h06b: begin exp_delta = 4'sd0; norm_mant = 7'h06; end
      9'h06c: begin exp_delta = 4'sd0; norm_mant = 7'h05; end
      9'h06d: begin exp_delta = 4'sd0; norm_mant = 7'h05; end
      9'h06e: begin exp_delta = 4'sd0; norm_mant = 7'h05; end
      9'h06f: begin exp_delta = 4'sd0; norm_mant = 7'h04; end
      9'h070: begin exp_delta = 4'sd0; norm_mant = 7'h04; end
      9'h071: begin exp_delta = 4'sd0; norm_mant = 7'h04; end
      9'h072: begin exp_delta = 4'sd0; norm_mant = 7'h04; end
      9'h073: begin exp_delta = 4'sd0; norm_mant = 7'h03; end
      9'h074: begin exp_delta = 4'sd0; norm_mant = 7'h03; end
      9'h075: begin exp_delta = 4'sd0; norm_mant = 7'h03; end
      9'h076: begin exp_delta = 4'sd0; norm_mant = 7'h03; end
      9'h077: begin exp_delta = 4'sd0; norm_mant = 7'h02; end
      9'h078: begin exp_delta = 4'sd0; norm_mant = 7'h02; end
      9'h079: begin exp_delta = 4'sd0; norm_mant = 7'h02; end
      9'h07a: begin exp_delta = 4'sd0; norm_mant = 7'h02; end
      9'h07b: begin exp_delta = 4'sd0; norm_mant = 7'h01; end
      9'h07c: begin exp_delta = 4'sd0; norm_mant = 7'h01; end
      9'h07d: begin exp_delta = 4'sd0; norm_mant = 7'h01; end
      9'h07e: begin exp_delta = 4'sd0; norm_mant = 7'h01; end
      9'h081: begin exp_delta = -4'sd1; norm_mant = 7'h7f; end
      9'h082: begin exp_delta = -4'sd1; norm_mant = 7'h7e; end
      9'h083: begin exp_delta = -4'sd1; norm_mant = 7'h7d; end
      9'h084: begin exp_delta = -4'sd1; norm_mant = 7'h7c; end
      9'h085: begin exp_delta = -4'sd1; norm_mant = 7'h7b; end
      9'h086: begin exp_delta = -4'sd1; norm_mant = 7'h7a; end
      9'h087: begin exp_delta = -4'sd1; norm_mant = 7'h79; end
      9'h088: begin exp_delta = -4'sd1; norm_mant = 7'h78; end
      9'h089: begin exp_delta = -4'sd1; norm_mant = 7'h77; end
      9'h08a: begin exp_delta = -4'sd1; norm_mant = 7'h77; end
      9'h08b: begin exp_delta = -4'sd1; norm_mant = 7'h76; end
      9'h08c: begin exp_delta = -4'sd1; norm_mant = 7'h75; end
      9'h08d: begin exp_delta = -4'sd1; norm_mant = 7'h74; end
      9'h08e: begin exp_delta = -4'sd1; norm_mant = 7'h73; end
      9'h08f: begin exp_delta = -4'sd1; norm_mant = 7'h72; end
      9'h090: begin exp_delta = -4'sd1; norm_mant = 7'h71; end
      9'h091: begin exp_delta = -4'sd1; norm_mant = 7'h71; end
      9'h092: begin exp_delta = -4'sd1; norm_mant = 7'h70; end
      9'h093: begin exp_delta = -4'sd1; norm_mant = 7'h6f; end
      9'h094: begin exp_delta = -4'sd1; norm_mant = 7'h6e; end
      9'h095: begin exp_delta = -4'sd1; norm_mant = 7'h6d; end
      9'h096: begin exp_delta = -4'sd1; norm_mant = 7'h6c; end
      9'h097: begin exp_delta = -4'sd1; norm_mant = 7'h6c; end
      9'h098: begin exp_delta = -4'sd1; norm_mant = 7'h6b; end
      9'h099: begin exp_delta = -4'sd1; norm_mant = 7'h6a; end
      9'h09a: begin exp_delta = -4'sd1; norm_mant = 7'h69; end
      9'h09b: begin exp_delta = -4'sd1; norm_mant = 7'h69; end
      9'h09c: begin exp_delta = -4'sd1; norm_mant = 7'h68; end
      9'h09d: begin exp_delta = -4'sd1; norm_mant = 7'h67; end
      9'h09e: begin exp_delta = -4'sd1; norm_mant = 7'h66; end
      9'h09f: begin exp_delta = -4'sd1; norm_mant = 7'h66; end
      9'h0a0: begin exp_delta = -4'sd1; norm_mant = 7'h65; end
      9'h0a1: begin exp_delta = -4'sd1; norm_mant = 7'h64; end
      9'h0a2: begin exp_delta = -4'sd1; norm_mant = 7'h64; end
      9'h0a3: begin exp_delta = -4'sd1; norm_mant = 7'h63; end
      9'h0a4: begin exp_delta = -4'sd1; norm_mant = 7'h62; end
      9'h0a5: begin exp_delta = -4'sd1; norm_mant = 7'h61; end
      9'h0a6: begin exp_delta = -4'sd1; norm_mant = 7'h61; end
      9'h0a7: begin exp_delta = -4'sd1; norm_mant = 7'h60; end
      9'h0a8: begin exp_delta = -4'sd1; norm_mant = 7'h5f; end
      9'h0a9: begin exp_delta = -4'sd1; norm_mant = 7'h5f; end
      9'h0aa: begin exp_delta = -4'sd1; norm_mant = 7'h5e; end
      9'h0ab: begin exp_delta = -4'sd1; norm_mant = 7'h5d; end
      9'h0ac: begin exp_delta = -4'sd1; norm_mant = 7'h5d; end
      9'h0ad: begin exp_delta = -4'sd1; norm_mant = 7'h5c; end
      9'h0ae: begin exp_delta = -4'sd1; norm_mant = 7'h5c; end
      9'h0af: begin exp_delta = -4'sd1; norm_mant = 7'h5b; end
      9'h0b0: begin exp_delta = -4'sd1; norm_mant = 7'h5a; end
      9'h0b1: begin exp_delta = -4'sd1; norm_mant = 7'h5a; end
      9'h0b2: begin exp_delta = -4'sd1; norm_mant = 7'h59; end
      9'h0b3: begin exp_delta = -4'sd1; norm_mant = 7'h58; end
      9'h0b4: begin exp_delta = -4'sd1; norm_mant = 7'h58; end
      9'h0b5: begin exp_delta = -4'sd1; norm_mant = 7'h57; end
      9'h0b6: begin exp_delta = -4'sd1; norm_mant = 7'h57; end
      9'h0b7: begin exp_delta = -4'sd1; norm_mant = 7'h56; end
      9'h0b8: begin exp_delta = -4'sd1; norm_mant = 7'h56; end
      9'h0b9: begin exp_delta = -4'sd1; norm_mant = 7'h55; end
      9'h0ba: begin exp_delta = -4'sd1; norm_mant = 7'h54; end
      9'h0bb: begin exp_delta = -4'sd1; norm_mant = 7'h54; end
      9'h0bc: begin exp_delta = -4'sd1; norm_mant = 7'h53; end
      9'h0bd: begin exp_delta = -4'sd1; norm_mant = 7'h53; end
      9'h0be: begin exp_delta = -4'sd1; norm_mant = 7'h52; end
      9'h0bf: begin exp_delta = -4'sd1; norm_mant = 7'h52; end
      9'h0c0: begin exp_delta = -4'sd1; norm_mant = 7'h51; end
      9'h0c1: begin exp_delta = -4'sd1; norm_mant = 7'h50; end
      9'h0c2: begin exp_delta = -4'sd1; norm_mant = 7'h50; end
      9'h0c3: begin exp_delta = -4'sd1; norm_mant = 7'h4f; end
      9'h0c4: begin exp_delta = -4'sd1; norm_mant = 7'h4f; end
      9'h0c5: begin exp_delta = -4'sd1; norm_mant = 7'h4e; end
      9'h0c6: begin exp_delta = -4'sd1; norm_mant = 7'h4e; end
      9'h0c7: begin exp_delta = -4'sd1; norm_mant = 7'h4d; end
      9'h0c8: begin exp_delta = -4'sd1; norm_mant = 7'h4d; end
      9'h0c9: begin exp_delta = -4'sd1; norm_mant = 7'h4c; end
      9'h0ca: begin exp_delta = -4'sd1; norm_mant = 7'h4c; end
      9'h0cb: begin exp_delta = -4'sd1; norm_mant = 7'h4b; end
      9'h0cc: begin exp_delta = -4'sd1; norm_mant = 7'h4b; end
      9'h0cd: begin exp_delta = -4'sd1; norm_mant = 7'h4a; end
      9'h0ce: begin exp_delta = -4'sd1; norm_mant = 7'h4a; end
      9'h0cf: begin exp_delta = -4'sd1; norm_mant = 7'h49; end
      9'h0d0: begin exp_delta = -4'sd1; norm_mant = 7'h49; end
      9'h0d1: begin exp_delta = -4'sd1; norm_mant = 7'h48; end
      9'h0d2: begin exp_delta = -4'sd1; norm_mant = 7'h48; end
      9'h0d3: begin exp_delta = -4'sd1; norm_mant = 7'h47; end
      9'h0d4: begin exp_delta = -4'sd1; norm_mant = 7'h47; end
      9'h0d5: begin exp_delta = -4'sd1; norm_mant = 7'h46; end
      9'h0d6: begin exp_delta = -4'sd1; norm_mant = 7'h46; end
      9'h0d7: begin exp_delta = -4'sd1; norm_mant = 7'h46; end
      9'h0d8: begin exp_delta = -4'sd1; norm_mant = 7'h45; end
      9'h0d9: begin exp_delta = -4'sd1; norm_mant = 7'h45; end
      9'h0da: begin exp_delta = -4'sd1; norm_mant = 7'h44; end
      9'h0db: begin exp_delta = -4'sd1; norm_mant = 7'h44; end
      9'h0dc: begin exp_delta = -4'sd1; norm_mant = 7'h43; end
      9'h0dd: begin exp_delta = -4'sd1; norm_mant = 7'h43; end
      9'h0de: begin exp_delta = -4'sd1; norm_mant = 7'h42; end
      9'h0df: begin exp_delta = -4'sd1; norm_mant = 7'h42; end
      9'h0e0: begin exp_delta = -4'sd1; norm_mant = 7'h42; end
      9'h0e1: begin exp_delta = -4'sd1; norm_mant = 7'h41; end
      9'h0e2: begin exp_delta = -4'sd1; norm_mant = 7'h41; end
      9'h0e3: begin exp_delta = -4'sd1; norm_mant = 7'h40; end
      9'h0e4: begin exp_delta = -4'sd1; norm_mant = 7'h40; end
      9'h0e5: begin exp_delta = -4'sd1; norm_mant = 7'h3f; end
      9'h0e6: begin exp_delta = -4'sd1; norm_mant = 7'h3f; end
      9'h0e7: begin exp_delta = -4'sd1; norm_mant = 7'h3f; end
      9'h0e8: begin exp_delta = -4'sd1; norm_mant = 7'h3e; end
      9'h0e9: begin exp_delta = -4'sd1; norm_mant = 7'h3e; end
      9'h0ea: begin exp_delta = -4'sd1; norm_mant = 7'h3d; end
      9'h0eb: begin exp_delta = -4'sd1; norm_mant = 7'h3d; end
      9'h0ec: begin exp_delta = -4'sd1; norm_mant = 7'h3d; end
      9'h0ed: begin exp_delta = -4'sd1; norm_mant = 7'h3c; end
      9'h0ee: begin exp_delta = -4'sd1; norm_mant = 7'h3c; end
      9'h0ef: begin exp_delta = -4'sd1; norm_mant = 7'h3b; end
      9'h0f0: begin exp_delta = -4'sd1; norm_mant = 7'h3b; end
      9'h0f1: begin exp_delta = -4'sd1; norm_mant = 7'h3b; end
      9'h0f2: begin exp_delta = -4'sd1; norm_mant = 7'h3a; end
      9'h0f3: begin exp_delta = -4'sd1; norm_mant = 7'h3a; end
      9'h0f4: begin exp_delta = -4'sd1; norm_mant = 7'h39; end
      9'h0f5: begin exp_delta = -4'sd1; norm_mant = 7'h39; end
      9'h0f6: begin exp_delta = -4'sd1; norm_mant = 7'h39; end
      9'h0f7: begin exp_delta = -4'sd1; norm_mant = 7'h38; end
      9'h0f8: begin exp_delta = -4'sd1; norm_mant = 7'h38; end
      9'h0f9: begin exp_delta = -4'sd1; norm_mant = 7'h38; end
      9'h0fa: begin exp_delta = -4'sd1; norm_mant = 7'h37; end
      9'h0fb: begin exp_delta = -4'sd1; norm_mant = 7'h37; end
      9'h0fc: begin exp_delta = -4'sd1; norm_mant = 7'h36; end
      9'h0fd: begin exp_delta = -4'sd1; norm_mant = 7'h36; end
      9'h0fe: begin exp_delta = -4'sd1; norm_mant = 7'h36; end
      9'h0ff: begin exp_delta = -4'sd1; norm_mant = 7'h35; end
      default: begin end
    endcase
  end
  wire signed [10:0] norm_exp_s = base_exp + exp_delta;
  wire [15:0] normal_pos = {1'b0, norm_exp_s[7:0], norm_mant};
  reg [15:0] pos_out;
  always @* begin
    if (1'b0)
      pos_out = 16'h0000;
    else if (1'b0)
      pos_out = 16'h7f80;
    else
      pos_out = normal_pos;
  end
  reg [15:0] out_r;
  always @* begin
    if (exp == 8'h00)
      out_r = sign ? 16'hff80 : 16'h7f80;
    else if (exp == 8'hff && mant != 7'h00)
      out_r = 16'h7fc0;
    else if (exp == 8'hff)
      out_r = sign ? 16'h7fc0 : 16'h0000;
    else
      out_r = sign ? (16'h7fc0) : pos_out;
  end
  assign out = out_r;
endmodule
