module ex212_bf16_square_arith_semantic_fields(in, out);
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
    base_exp = (exp_s <<< 1) - 11'sd127;
  end
  always @* begin
    exp_delta = 4'sd0;
    norm_mant = 7'h00;
    case (mant)
      7'h01: begin exp_delta = 4'sd0; norm_mant = 7'h02; end
      7'h02: begin exp_delta = 4'sd0; norm_mant = 7'h04; end
      7'h03: begin exp_delta = 4'sd0; norm_mant = 7'h06; end
      7'h04: begin exp_delta = 4'sd0; norm_mant = 7'h08; end
      7'h05: begin exp_delta = 4'sd0; norm_mant = 7'h0a; end
      7'h06: begin exp_delta = 4'sd0; norm_mant = 7'h0c; end
      7'h07: begin exp_delta = 4'sd0; norm_mant = 7'h0e; end
      7'h08: begin exp_delta = 4'sd0; norm_mant = 7'h10; end
      7'h09: begin exp_delta = 4'sd0; norm_mant = 7'h13; end
      7'h0a: begin exp_delta = 4'sd0; norm_mant = 7'h15; end
      7'h0b: begin exp_delta = 4'sd0; norm_mant = 7'h17; end
      7'h0c: begin exp_delta = 4'sd0; norm_mant = 7'h19; end
      7'h0d: begin exp_delta = 4'sd0; norm_mant = 7'h1b; end
      7'h0e: begin exp_delta = 4'sd0; norm_mant = 7'h1e; end
      7'h0f: begin exp_delta = 4'sd0; norm_mant = 7'h20; end
      7'h10: begin exp_delta = 4'sd0; norm_mant = 7'h22; end
      7'h11: begin exp_delta = 4'sd0; norm_mant = 7'h24; end
      7'h12: begin exp_delta = 4'sd0; norm_mant = 7'h27; end
      7'h13: begin exp_delta = 4'sd0; norm_mant = 7'h29; end
      7'h14: begin exp_delta = 4'sd0; norm_mant = 7'h2b; end
      7'h15: begin exp_delta = 4'sd0; norm_mant = 7'h2d; end
      7'h16: begin exp_delta = 4'sd0; norm_mant = 7'h30; end
      7'h17: begin exp_delta = 4'sd0; norm_mant = 7'h32; end
      7'h18: begin exp_delta = 4'sd0; norm_mant = 7'h34; end
      7'h19: begin exp_delta = 4'sd0; norm_mant = 7'h37; end
      7'h1a: begin exp_delta = 4'sd0; norm_mant = 7'h39; end
      7'h1b: begin exp_delta = 4'sd0; norm_mant = 7'h3c; end
      7'h1c: begin exp_delta = 4'sd0; norm_mant = 7'h3e; end
      7'h1d: begin exp_delta = 4'sd0; norm_mant = 7'h41; end
      7'h1e: begin exp_delta = 4'sd0; norm_mant = 7'h43; end
      7'h1f: begin exp_delta = 4'sd0; norm_mant = 7'h46; end
      7'h20: begin exp_delta = 4'sd0; norm_mant = 7'h48; end
      7'h21: begin exp_delta = 4'sd0; norm_mant = 7'h4b; end
      7'h22: begin exp_delta = 4'sd0; norm_mant = 7'h4d; end
      7'h23: begin exp_delta = 4'sd0; norm_mant = 7'h50; end
      7'h24: begin exp_delta = 4'sd0; norm_mant = 7'h52; end
      7'h25: begin exp_delta = 4'sd0; norm_mant = 7'h55; end
      7'h26: begin exp_delta = 4'sd0; norm_mant = 7'h57; end
      7'h27: begin exp_delta = 4'sd0; norm_mant = 7'h5a; end
      7'h28: begin exp_delta = 4'sd0; norm_mant = 7'h5c; end
      7'h29: begin exp_delta = 4'sd0; norm_mant = 7'h5f; end
      7'h2a: begin exp_delta = 4'sd0; norm_mant = 7'h62; end
      7'h2b: begin exp_delta = 4'sd0; norm_mant = 7'h64; end
      7'h2c: begin exp_delta = 4'sd0; norm_mant = 7'h67; end
      7'h2d: begin exp_delta = 4'sd0; norm_mant = 7'h6a; end
      7'h2e: begin exp_delta = 4'sd0; norm_mant = 7'h6d; end
      7'h2f: begin exp_delta = 4'sd0; norm_mant = 7'h6f; end
      7'h30: begin exp_delta = 4'sd0; norm_mant = 7'h72; end
      7'h31: begin exp_delta = 4'sd0; norm_mant = 7'h75; end
      7'h32: begin exp_delta = 4'sd0; norm_mant = 7'h78; end
      7'h33: begin exp_delta = 4'sd0; norm_mant = 7'h7a; end
      7'h34: begin exp_delta = 4'sd0; norm_mant = 7'h7d; end
      7'h35: begin exp_delta = 4'sd1; norm_mant = 7'h00; end
      7'h36: begin exp_delta = 4'sd1; norm_mant = 7'h01; end
      7'h37: begin exp_delta = 4'sd1; norm_mant = 7'h03; end
      7'h38: begin exp_delta = 4'sd1; norm_mant = 7'h04; end
      7'h39: begin exp_delta = 4'sd1; norm_mant = 7'h06; end
      7'h3a: begin exp_delta = 4'sd1; norm_mant = 7'h07; end
      7'h3b: begin exp_delta = 4'sd1; norm_mant = 7'h09; end
      7'h3c: begin exp_delta = 4'sd1; norm_mant = 7'h0a; end
      7'h3d: begin exp_delta = 4'sd1; norm_mant = 7'h0c; end
      7'h3e: begin exp_delta = 4'sd1; norm_mant = 7'h0d; end
      7'h3f: begin exp_delta = 4'sd1; norm_mant = 7'h0f; end
      7'h40: begin exp_delta = 4'sd1; norm_mant = 7'h10; end
      7'h41: begin exp_delta = 4'sd1; norm_mant = 7'h12; end
      7'h42: begin exp_delta = 4'sd1; norm_mant = 7'h13; end
      7'h43: begin exp_delta = 4'sd1; norm_mant = 7'h15; end
      7'h44: begin exp_delta = 4'sd1; norm_mant = 7'h16; end
      7'h45: begin exp_delta = 4'sd1; norm_mant = 7'h18; end
      7'h46: begin exp_delta = 4'sd1; norm_mant = 7'h19; end
      7'h47: begin exp_delta = 4'sd1; norm_mant = 7'h1b; end
      7'h48: begin exp_delta = 4'sd1; norm_mant = 7'h1c; end
      7'h49: begin exp_delta = 4'sd1; norm_mant = 7'h1e; end
      7'h4a: begin exp_delta = 4'sd1; norm_mant = 7'h1f; end
      7'h4b: begin exp_delta = 4'sd1; norm_mant = 7'h21; end
      7'h4c: begin exp_delta = 4'sd1; norm_mant = 7'h23; end
      7'h4d: begin exp_delta = 4'sd1; norm_mant = 7'h24; end
      7'h4e: begin exp_delta = 4'sd1; norm_mant = 7'h26; end
      7'h4f: begin exp_delta = 4'sd1; norm_mant = 7'h27; end
      7'h50: begin exp_delta = 4'sd1; norm_mant = 7'h29; end
      7'h51: begin exp_delta = 4'sd1; norm_mant = 7'h2b; end
      7'h52: begin exp_delta = 4'sd1; norm_mant = 7'h2c; end
      7'h53: begin exp_delta = 4'sd1; norm_mant = 7'h2e; end
      7'h54: begin exp_delta = 4'sd1; norm_mant = 7'h30; end
      7'h55: begin exp_delta = 4'sd1; norm_mant = 7'h31; end
      7'h56: begin exp_delta = 4'sd1; norm_mant = 7'h33; end
      7'h57: begin exp_delta = 4'sd1; norm_mant = 7'h35; end
      7'h58: begin exp_delta = 4'sd1; norm_mant = 7'h36; end
      7'h59: begin exp_delta = 4'sd1; norm_mant = 7'h38; end
      7'h5a: begin exp_delta = 4'sd1; norm_mant = 7'h3a; end
      7'h5b: begin exp_delta = 4'sd1; norm_mant = 7'h3b; end
      7'h5c: begin exp_delta = 4'sd1; norm_mant = 7'h3d; end
      7'h5d: begin exp_delta = 4'sd1; norm_mant = 7'h3f; end
      7'h5e: begin exp_delta = 4'sd1; norm_mant = 7'h41; end
      7'h5f: begin exp_delta = 4'sd1; norm_mant = 7'h42; end
      7'h60: begin exp_delta = 4'sd1; norm_mant = 7'h44; end
      7'h61: begin exp_delta = 4'sd1; norm_mant = 7'h46; end
      7'h62: begin exp_delta = 4'sd1; norm_mant = 7'h48; end
      7'h63: begin exp_delta = 4'sd1; norm_mant = 7'h49; end
      7'h64: begin exp_delta = 4'sd1; norm_mant = 7'h4b; end
      7'h65: begin exp_delta = 4'sd1; norm_mant = 7'h4d; end
      7'h66: begin exp_delta = 4'sd1; norm_mant = 7'h4f; end
      7'h67: begin exp_delta = 4'sd1; norm_mant = 7'h50; end
      7'h68: begin exp_delta = 4'sd1; norm_mant = 7'h52; end
      7'h69: begin exp_delta = 4'sd1; norm_mant = 7'h54; end
      7'h6a: begin exp_delta = 4'sd1; norm_mant = 7'h56; end
      7'h6b: begin exp_delta = 4'sd1; norm_mant = 7'h58; end
      7'h6c: begin exp_delta = 4'sd1; norm_mant = 7'h5a; end
      7'h6d: begin exp_delta = 4'sd1; norm_mant = 7'h5b; end
      7'h6e: begin exp_delta = 4'sd1; norm_mant = 7'h5d; end
      7'h6f: begin exp_delta = 4'sd1; norm_mant = 7'h5f; end
      7'h70: begin exp_delta = 4'sd1; norm_mant = 7'h61; end
      7'h71: begin exp_delta = 4'sd1; norm_mant = 7'h63; end
      7'h72: begin exp_delta = 4'sd1; norm_mant = 7'h65; end
      7'h73: begin exp_delta = 4'sd1; norm_mant = 7'h67; end
      7'h74: begin exp_delta = 4'sd1; norm_mant = 7'h69; end
      7'h75: begin exp_delta = 4'sd1; norm_mant = 7'h6a; end
      7'h76: begin exp_delta = 4'sd1; norm_mant = 7'h6c; end
      7'h77: begin exp_delta = 4'sd1; norm_mant = 7'h6e; end
      7'h78: begin exp_delta = 4'sd1; norm_mant = 7'h70; end
      7'h79: begin exp_delta = 4'sd1; norm_mant = 7'h72; end
      7'h7a: begin exp_delta = 4'sd1; norm_mant = 7'h74; end
      7'h7b: begin exp_delta = 4'sd1; norm_mant = 7'h76; end
      7'h7c: begin exp_delta = 4'sd1; norm_mant = 7'h78; end
      7'h7d: begin exp_delta = 4'sd1; norm_mant = 7'h7a; end
      7'h7e: begin exp_delta = 4'sd1; norm_mant = 7'h7c; end
      7'h7f: begin exp_delta = 4'sd1; norm_mant = 7'h7e; end
      default: begin end
    endcase
  end
  wire signed [10:0] norm_exp_s = base_exp + exp_delta;
  wire [15:0] normal_pos = {1'b0, norm_exp_s[7:0], norm_mant};
  reg [15:0] pos_out;
  always @* begin
    if ((exp >= 8'd1 && exp <= 8'd63))
      pos_out = 16'h0000;
    else if ((exp >= 8'd191 && exp <= 8'd254))
      pos_out = 16'h7f80;
    else
      pos_out = normal_pos;
  end
  reg [15:0] out_r;
  always @* begin
    if (exp == 8'h00)
      out_r = sign ? 16'h0000 : 16'h0000;
    else if (exp == 8'hff && mant != 7'h00)
      out_r = 16'h7fc0;
    else if (exp == 8'hff)
      out_r = sign ? 16'h7f80 : 16'h7f80;
    else
      out_r = sign ? (pos_out) : pos_out;
  end
  assign out = out_r;
endmodule
