module ex212_r94_bf16_square_hand_square_formula_mant_lut(in, out);
  input [15:0] in;
  output [15:0] out;
  wire [7:0] exp = in[14:7];
  wire [6:0] mant = in[6:0];
  reg delta;
  reg [6:0] sq_mant;
  always @* begin
    case (mant)
      7'h00: begin delta = 1'b0; sq_mant = 7'h00; end
      7'h01: begin delta = 1'b0; sq_mant = 7'h02; end
      7'h02: begin delta = 1'b0; sq_mant = 7'h04; end
      7'h03: begin delta = 1'b0; sq_mant = 7'h06; end
      7'h04: begin delta = 1'b0; sq_mant = 7'h08; end
      7'h05: begin delta = 1'b0; sq_mant = 7'h0a; end
      7'h06: begin delta = 1'b0; sq_mant = 7'h0c; end
      7'h07: begin delta = 1'b0; sq_mant = 7'h0e; end
      7'h08: begin delta = 1'b0; sq_mant = 7'h10; end
      7'h09: begin delta = 1'b0; sq_mant = 7'h13; end
      7'h0a: begin delta = 1'b0; sq_mant = 7'h15; end
      7'h0b: begin delta = 1'b0; sq_mant = 7'h17; end
      7'h0c: begin delta = 1'b0; sq_mant = 7'h19; end
      7'h0d: begin delta = 1'b0; sq_mant = 7'h1b; end
      7'h0e: begin delta = 1'b0; sq_mant = 7'h1e; end
      7'h0f: begin delta = 1'b0; sq_mant = 7'h20; end
      7'h10: begin delta = 1'b0; sq_mant = 7'h22; end
      7'h11: begin delta = 1'b0; sq_mant = 7'h24; end
      7'h12: begin delta = 1'b0; sq_mant = 7'h27; end
      7'h13: begin delta = 1'b0; sq_mant = 7'h29; end
      7'h14: begin delta = 1'b0; sq_mant = 7'h2b; end
      7'h15: begin delta = 1'b0; sq_mant = 7'h2d; end
      7'h16: begin delta = 1'b0; sq_mant = 7'h30; end
      7'h17: begin delta = 1'b0; sq_mant = 7'h32; end
      7'h18: begin delta = 1'b0; sq_mant = 7'h34; end
      7'h19: begin delta = 1'b0; sq_mant = 7'h37; end
      7'h1a: begin delta = 1'b0; sq_mant = 7'h39; end
      7'h1b: begin delta = 1'b0; sq_mant = 7'h3c; end
      7'h1c: begin delta = 1'b0; sq_mant = 7'h3e; end
      7'h1d: begin delta = 1'b0; sq_mant = 7'h41; end
      7'h1e: begin delta = 1'b0; sq_mant = 7'h43; end
      7'h1f: begin delta = 1'b0; sq_mant = 7'h46; end
      7'h20: begin delta = 1'b0; sq_mant = 7'h48; end
      7'h21: begin delta = 1'b0; sq_mant = 7'h4b; end
      7'h22: begin delta = 1'b0; sq_mant = 7'h4d; end
      7'h23: begin delta = 1'b0; sq_mant = 7'h50; end
      7'h24: begin delta = 1'b0; sq_mant = 7'h52; end
      7'h25: begin delta = 1'b0; sq_mant = 7'h55; end
      7'h26: begin delta = 1'b0; sq_mant = 7'h57; end
      7'h27: begin delta = 1'b0; sq_mant = 7'h5a; end
      7'h28: begin delta = 1'b0; sq_mant = 7'h5c; end
      7'h29: begin delta = 1'b0; sq_mant = 7'h5f; end
      7'h2a: begin delta = 1'b0; sq_mant = 7'h62; end
      7'h2b: begin delta = 1'b0; sq_mant = 7'h64; end
      7'h2c: begin delta = 1'b0; sq_mant = 7'h67; end
      7'h2d: begin delta = 1'b0; sq_mant = 7'h6a; end
      7'h2e: begin delta = 1'b0; sq_mant = 7'h6d; end
      7'h2f: begin delta = 1'b0; sq_mant = 7'h6f; end
      7'h30: begin delta = 1'b0; sq_mant = 7'h72; end
      7'h31: begin delta = 1'b0; sq_mant = 7'h75; end
      7'h32: begin delta = 1'b0; sq_mant = 7'h78; end
      7'h33: begin delta = 1'b0; sq_mant = 7'h7a; end
      7'h34: begin delta = 1'b0; sq_mant = 7'h7d; end
      7'h35: begin delta = 1'b1; sq_mant = 7'h00; end
      7'h36: begin delta = 1'b1; sq_mant = 7'h01; end
      7'h37: begin delta = 1'b1; sq_mant = 7'h03; end
      7'h38: begin delta = 1'b1; sq_mant = 7'h04; end
      7'h39: begin delta = 1'b1; sq_mant = 7'h06; end
      7'h3a: begin delta = 1'b1; sq_mant = 7'h07; end
      7'h3b: begin delta = 1'b1; sq_mant = 7'h09; end
      7'h3c: begin delta = 1'b1; sq_mant = 7'h0a; end
      7'h3d: begin delta = 1'b1; sq_mant = 7'h0c; end
      7'h3e: begin delta = 1'b1; sq_mant = 7'h0d; end
      7'h3f: begin delta = 1'b1; sq_mant = 7'h0f; end
      7'h40: begin delta = 1'b1; sq_mant = 7'h10; end
      7'h41: begin delta = 1'b1; sq_mant = 7'h12; end
      7'h42: begin delta = 1'b1; sq_mant = 7'h13; end
      7'h43: begin delta = 1'b1; sq_mant = 7'h15; end
      7'h44: begin delta = 1'b1; sq_mant = 7'h16; end
      7'h45: begin delta = 1'b1; sq_mant = 7'h18; end
      7'h46: begin delta = 1'b1; sq_mant = 7'h19; end
      7'h47: begin delta = 1'b1; sq_mant = 7'h1b; end
      7'h48: begin delta = 1'b1; sq_mant = 7'h1c; end
      7'h49: begin delta = 1'b1; sq_mant = 7'h1e; end
      7'h4a: begin delta = 1'b1; sq_mant = 7'h1f; end
      7'h4b: begin delta = 1'b1; sq_mant = 7'h21; end
      7'h4c: begin delta = 1'b1; sq_mant = 7'h23; end
      7'h4d: begin delta = 1'b1; sq_mant = 7'h24; end
      7'h4e: begin delta = 1'b1; sq_mant = 7'h26; end
      7'h4f: begin delta = 1'b1; sq_mant = 7'h27; end
      7'h50: begin delta = 1'b1; sq_mant = 7'h29; end
      7'h51: begin delta = 1'b1; sq_mant = 7'h2b; end
      7'h52: begin delta = 1'b1; sq_mant = 7'h2c; end
      7'h53: begin delta = 1'b1; sq_mant = 7'h2e; end
      7'h54: begin delta = 1'b1; sq_mant = 7'h30; end
      7'h55: begin delta = 1'b1; sq_mant = 7'h31; end
      7'h56: begin delta = 1'b1; sq_mant = 7'h33; end
      7'h57: begin delta = 1'b1; sq_mant = 7'h35; end
      7'h58: begin delta = 1'b1; sq_mant = 7'h36; end
      7'h59: begin delta = 1'b1; sq_mant = 7'h38; end
      7'h5a: begin delta = 1'b1; sq_mant = 7'h3a; end
      7'h5b: begin delta = 1'b1; sq_mant = 7'h3b; end
      7'h5c: begin delta = 1'b1; sq_mant = 7'h3d; end
      7'h5d: begin delta = 1'b1; sq_mant = 7'h3f; end
      7'h5e: begin delta = 1'b1; sq_mant = 7'h41; end
      7'h5f: begin delta = 1'b1; sq_mant = 7'h42; end
      7'h60: begin delta = 1'b1; sq_mant = 7'h44; end
      7'h61: begin delta = 1'b1; sq_mant = 7'h46; end
      7'h62: begin delta = 1'b1; sq_mant = 7'h48; end
      7'h63: begin delta = 1'b1; sq_mant = 7'h49; end
      7'h64: begin delta = 1'b1; sq_mant = 7'h4b; end
      7'h65: begin delta = 1'b1; sq_mant = 7'h4d; end
      7'h66: begin delta = 1'b1; sq_mant = 7'h4f; end
      7'h67: begin delta = 1'b1; sq_mant = 7'h50; end
      7'h68: begin delta = 1'b1; sq_mant = 7'h52; end
      7'h69: begin delta = 1'b1; sq_mant = 7'h54; end
      7'h6a: begin delta = 1'b1; sq_mant = 7'h56; end
      7'h6b: begin delta = 1'b1; sq_mant = 7'h58; end
      7'h6c: begin delta = 1'b1; sq_mant = 7'h5a; end
      7'h6d: begin delta = 1'b1; sq_mant = 7'h5b; end
      7'h6e: begin delta = 1'b1; sq_mant = 7'h5d; end
      7'h6f: begin delta = 1'b1; sq_mant = 7'h5f; end
      7'h70: begin delta = 1'b1; sq_mant = 7'h61; end
      7'h71: begin delta = 1'b1; sq_mant = 7'h63; end
      7'h72: begin delta = 1'b1; sq_mant = 7'h65; end
      7'h73: begin delta = 1'b1; sq_mant = 7'h67; end
      7'h74: begin delta = 1'b1; sq_mant = 7'h69; end
      7'h75: begin delta = 1'b1; sq_mant = 7'h6a; end
      7'h76: begin delta = 1'b1; sq_mant = 7'h6c; end
      7'h77: begin delta = 1'b1; sq_mant = 7'h6e; end
      7'h78: begin delta = 1'b1; sq_mant = 7'h70; end
      7'h79: begin delta = 1'b1; sq_mant = 7'h72; end
      7'h7a: begin delta = 1'b1; sq_mant = 7'h74; end
      7'h7b: begin delta = 1'b1; sq_mant = 7'h76; end
      7'h7c: begin delta = 1'b1; sq_mant = 7'h78; end
      7'h7d: begin delta = 1'b1; sq_mant = 7'h7a; end
      7'h7e: begin delta = 1'b1; sq_mant = 7'h7c; end
      7'h7f: begin delta = 1'b1; sq_mant = 7'h7e; end
      default: begin delta = 1'b0; sq_mant = 7'h00; end
    endcase
  end
  wire [8:0] normal_exp9 = {exp, 1'b0} - 9'd127 + {8'h00, delta};
  wire [15:0] normal_pos = {1'b0, normal_exp9[7:0], sq_mant};
  wire is_nan = (exp == 8'hff) & (mant != 7'h00);
  wire is_inf = (exp == 8'hff) & (mant == 7'h00);
  wire underflow = (exp < 8'd64);
  wire overflow = (exp > 8'd190);
  assign out = (exp == 8'h00) ? 16'h0000 :
               is_nan ? 16'h7fc0 :
               is_inf ? 16'h7f80 :
               underflow ? 16'h0000 :
               overflow ? 16'h7f80 : normal_pos;
endmodule
