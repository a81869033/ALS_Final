module ex295_r11_bitplane_symbol_split_abc_g_aig_d14(in, out);
  input [11:0] in;
  output [11:0] out;
  wire [5:0] sel = {in[10], in[8], in[6], in[4], in[2], in[0]};
  wire [5:0] inner = {in[11], in[9], in[7], in[5], in[3], in[1]};
  reg [11:0] out_r;
  always @* begin
    out_r = 12'h000;
    case (sel)
      6'h00: begin
        out_r = 12'h000;
        case (inner)
          6'h01: out_r[1] = 1'b1;
          6'h03: out_r[1] = 1'b1;
          6'h05: out_r[1] = 1'b1;
          6'h07: out_r[1] = 1'b1;
          6'h09: out_r[1] = 1'b1;
          6'h0b: out_r[1] = 1'b1;
          6'h0d: out_r[1] = 1'b1;
          6'h0f: out_r[1] = 1'b1;
          6'h11: out_r[1] = 1'b1;
          6'h13: out_r[1] = 1'b1;
          6'h15: out_r[1] = 1'b1;
          6'h17: out_r[1] = 1'b1;
          6'h19: out_r[1] = 1'b1;
          6'h1b: out_r[1] = 1'b1;
          6'h1d: out_r[1] = 1'b1;
          6'h1f: out_r[1] = 1'b1;
          6'h21: out_r[1] = 1'b1;
          6'h23: out_r[1] = 1'b1;
          6'h25: out_r[1] = 1'b1;
          6'h27: out_r[1] = 1'b1;
          6'h29: out_r[1] = 1'b1;
          6'h2b: out_r[1] = 1'b1;
          6'h2d: out_r[1] = 1'b1;
          6'h2f: out_r[1] = 1'b1;
          6'h31: out_r[1] = 1'b1;
          6'h33: out_r[1] = 1'b1;
          6'h35: out_r[1] = 1'b1;
          6'h37: out_r[1] = 1'b1;
          6'h39: out_r[1] = 1'b1;
          6'h3b: out_r[1] = 1'b1;
          6'h3d: out_r[1] = 1'b1;
          6'h3f: out_r[1] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h02: out_r[3] = 1'b1;
          6'h03: out_r[3] = 1'b1;
          6'h06: out_r[3] = 1'b1;
          6'h07: out_r[3] = 1'b1;
          6'h0a: out_r[3] = 1'b1;
          6'h0b: out_r[3] = 1'b1;
          6'h0e: out_r[3] = 1'b1;
          6'h0f: out_r[3] = 1'b1;
          6'h12: out_r[3] = 1'b1;
          6'h13: out_r[3] = 1'b1;
          6'h16: out_r[3] = 1'b1;
          6'h17: out_r[3] = 1'b1;
          6'h1a: out_r[3] = 1'b1;
          6'h1b: out_r[3] = 1'b1;
          6'h1e: out_r[3] = 1'b1;
          6'h1f: out_r[3] = 1'b1;
          6'h22: out_r[3] = 1'b1;
          6'h23: out_r[3] = 1'b1;
          6'h26: out_r[3] = 1'b1;
          6'h27: out_r[3] = 1'b1;
          6'h2a: out_r[3] = 1'b1;
          6'h2b: out_r[3] = 1'b1;
          6'h2e: out_r[3] = 1'b1;
          6'h2f: out_r[3] = 1'b1;
          6'h32: out_r[3] = 1'b1;
          6'h33: out_r[3] = 1'b1;
          6'h36: out_r[3] = 1'b1;
          6'h37: out_r[3] = 1'b1;
          6'h3a: out_r[3] = 1'b1;
          6'h3b: out_r[3] = 1'b1;
          6'h3e: out_r[3] = 1'b1;
          6'h3f: out_r[3] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h04: out_r[5] = 1'b1;
          6'h05: out_r[5] = 1'b1;
          6'h06: out_r[5] = 1'b1;
          6'h07: out_r[5] = 1'b1;
          6'h0c: out_r[5] = 1'b1;
          6'h0d: out_r[5] = 1'b1;
          6'h0e: out_r[5] = 1'b1;
          6'h0f: out_r[5] = 1'b1;
          6'h14: out_r[5] = 1'b1;
          6'h15: out_r[5] = 1'b1;
          6'h16: out_r[5] = 1'b1;
          6'h17: out_r[5] = 1'b1;
          6'h1c: out_r[5] = 1'b1;
          6'h1d: out_r[5] = 1'b1;
          6'h1e: out_r[5] = 1'b1;
          6'h1f: out_r[5] = 1'b1;
          6'h24: out_r[5] = 1'b1;
          6'h25: out_r[5] = 1'b1;
          6'h26: out_r[5] = 1'b1;
          6'h27: out_r[5] = 1'b1;
          6'h2c: out_r[5] = 1'b1;
          6'h2d: out_r[5] = 1'b1;
          6'h2e: out_r[5] = 1'b1;
          6'h2f: out_r[5] = 1'b1;
          6'h34: out_r[5] = 1'b1;
          6'h35: out_r[5] = 1'b1;
          6'h36: out_r[5] = 1'b1;
          6'h37: out_r[5] = 1'b1;
          6'h3c: out_r[5] = 1'b1;
          6'h3d: out_r[5] = 1'b1;
          6'h3e: out_r[5] = 1'b1;
          6'h3f: out_r[5] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h08: out_r[7] = 1'b1;
          6'h09: out_r[7] = 1'b1;
          6'h0a: out_r[7] = 1'b1;
          6'h0b: out_r[7] = 1'b1;
          6'h0c: out_r[7] = 1'b1;
          6'h0d: out_r[7] = 1'b1;
          6'h0e: out_r[7] = 1'b1;
          6'h0f: out_r[7] = 1'b1;
          6'h18: out_r[7] = 1'b1;
          6'h19: out_r[7] = 1'b1;
          6'h1a: out_r[7] = 1'b1;
          6'h1b: out_r[7] = 1'b1;
          6'h1c: out_r[7] = 1'b1;
          6'h1d: out_r[7] = 1'b1;
          6'h1e: out_r[7] = 1'b1;
          6'h1f: out_r[7] = 1'b1;
          6'h28: out_r[7] = 1'b1;
          6'h29: out_r[7] = 1'b1;
          6'h2a: out_r[7] = 1'b1;
          6'h2b: out_r[7] = 1'b1;
          6'h2c: out_r[7] = 1'b1;
          6'h2d: out_r[7] = 1'b1;
          6'h2e: out_r[7] = 1'b1;
          6'h2f: out_r[7] = 1'b1;
          6'h38: out_r[7] = 1'b1;
          6'h39: out_r[7] = 1'b1;
          6'h3a: out_r[7] = 1'b1;
          6'h3b: out_r[7] = 1'b1;
          6'h3c: out_r[7] = 1'b1;
          6'h3d: out_r[7] = 1'b1;
          6'h3e: out_r[7] = 1'b1;
          6'h3f: out_r[7] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h10: out_r[9] = 1'b1;
          6'h11: out_r[9] = 1'b1;
          6'h12: out_r[9] = 1'b1;
          6'h13: out_r[9] = 1'b1;
          6'h14: out_r[9] = 1'b1;
          6'h15: out_r[9] = 1'b1;
          6'h16: out_r[9] = 1'b1;
          6'h17: out_r[9] = 1'b1;
          6'h18: out_r[9] = 1'b1;
          6'h19: out_r[9] = 1'b1;
          6'h1a: out_r[9] = 1'b1;
          6'h1b: out_r[9] = 1'b1;
          6'h1c: out_r[9] = 1'b1;
          6'h1d: out_r[9] = 1'b1;
          6'h1e: out_r[9] = 1'b1;
          6'h1f: out_r[9] = 1'b1;
          6'h30: out_r[9] = 1'b1;
          6'h31: out_r[9] = 1'b1;
          6'h32: out_r[9] = 1'b1;
          6'h33: out_r[9] = 1'b1;
          6'h34: out_r[9] = 1'b1;
          6'h35: out_r[9] = 1'b1;
          6'h36: out_r[9] = 1'b1;
          6'h37: out_r[9] = 1'b1;
          6'h38: out_r[9] = 1'b1;
          6'h39: out_r[9] = 1'b1;
          6'h3a: out_r[9] = 1'b1;
          6'h3b: out_r[9] = 1'b1;
          6'h3c: out_r[9] = 1'b1;
          6'h3d: out_r[9] = 1'b1;
          6'h3e: out_r[9] = 1'b1;
          6'h3f: out_r[9] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h20: out_r[11] = 1'b1;
          6'h21: out_r[11] = 1'b1;
          6'h22: out_r[11] = 1'b1;
          6'h23: out_r[11] = 1'b1;
          6'h24: out_r[11] = 1'b1;
          6'h25: out_r[11] = 1'b1;
          6'h26: out_r[11] = 1'b1;
          6'h27: out_r[11] = 1'b1;
          6'h28: out_r[11] = 1'b1;
          6'h29: out_r[11] = 1'b1;
          6'h2a: out_r[11] = 1'b1;
          6'h2b: out_r[11] = 1'b1;
          6'h2c: out_r[11] = 1'b1;
          6'h2d: out_r[11] = 1'b1;
          6'h2e: out_r[11] = 1'b1;
          6'h2f: out_r[11] = 1'b1;
          6'h30: out_r[11] = 1'b1;
          6'h31: out_r[11] = 1'b1;
          6'h32: out_r[11] = 1'b1;
          6'h33: out_r[11] = 1'b1;
          6'h34: out_r[11] = 1'b1;
          6'h35: out_r[11] = 1'b1;
          6'h36: out_r[11] = 1'b1;
          6'h37: out_r[11] = 1'b1;
          6'h38: out_r[11] = 1'b1;
          6'h39: out_r[11] = 1'b1;
          6'h3a: out_r[11] = 1'b1;
          6'h3b: out_r[11] = 1'b1;
          6'h3c: out_r[11] = 1'b1;
          6'h3d: out_r[11] = 1'b1;
          6'h3e: out_r[11] = 1'b1;
          6'h3f: out_r[11] = 1'b1;
          default: begin end
        endcase
      end
      6'h01: begin
        out_r = 12'h041;
        case (inner)
          6'h09: out_r[0] = 1'b0;
          6'h0b: out_r[0] = 1'b0;
          6'h0d: out_r[0] = 1'b0;
          6'h13: out_r[0] = 1'b0;
          6'h19: out_r[0] = 1'b0;
          6'h1d: out_r[0] = 1'b0;
          6'h22: out_r[0] = 1'b0;
          6'h24: out_r[0] = 1'b0;
          6'h28: out_r[0] = 1'b0;
          6'h29: out_r[0] = 1'b0;
          6'h2b: out_r[0] = 1'b0;
          6'h2d: out_r[0] = 1'b0;
          6'h2e: out_r[0] = 1'b0;
          6'h30: out_r[0] = 1'b0;
          6'h33: out_r[0] = 1'b0;
          6'h35: out_r[0] = 1'b0;
          6'h39: out_r[0] = 1'b0;
          6'h3b: out_r[0] = 1'b0;
          6'h3e: out_r[0] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h01: out_r[1] = 1'b1;
          6'h03: out_r[1] = 1'b1;
          6'h05: out_r[1] = 1'b1;
          6'h07: out_r[1] = 1'b1;
          6'h11: out_r[1] = 1'b1;
          6'h15: out_r[1] = 1'b1;
          6'h20: out_r[1] = 1'b1;
          6'h21: out_r[1] = 1'b1;
          6'h22: out_r[1] = 1'b1;
          6'h23: out_r[1] = 1'b1;
          6'h24: out_r[1] = 1'b1;
          6'h25: out_r[1] = 1'b1;
          6'h27: out_r[1] = 1'b1;
          6'h28: out_r[1] = 1'b1;
          6'h2a: out_r[1] = 1'b1;
          6'h2e: out_r[1] = 1'b1;
          6'h30: out_r[1] = 1'b1;
          6'h31: out_r[1] = 1'b1;
          6'h32: out_r[1] = 1'b1;
          6'h33: out_r[1] = 1'b1;
          6'h34: out_r[1] = 1'b1;
          6'h35: out_r[1] = 1'b1;
          6'h39: out_r[1] = 1'b1;
          6'h3b: out_r[1] = 1'b1;
          6'h3e: out_r[1] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h07: out_r[2] = 1'b1;
          6'h0f: out_r[2] = 1'b1;
          6'h15: out_r[2] = 1'b1;
          6'h17: out_r[2] = 1'b1;
          6'h1d: out_r[2] = 1'b1;
          6'h1f: out_r[2] = 1'b1;
          6'h20: out_r[2] = 1'b1;
          6'h22: out_r[2] = 1'b1;
          6'h24: out_r[2] = 1'b1;
          6'h27: out_r[2] = 1'b1;
          6'h28: out_r[2] = 1'b1;
          6'h2a: out_r[2] = 1'b1;
          6'h2e: out_r[2] = 1'b1;
          6'h2f: out_r[2] = 1'b1;
          6'h30: out_r[2] = 1'b1;
          6'h32: out_r[2] = 1'b1;
          6'h33: out_r[2] = 1'b1;
          6'h34: out_r[2] = 1'b1;
          6'h35: out_r[2] = 1'b1;
          6'h39: out_r[2] = 1'b1;
          6'h3b: out_r[2] = 1'b1;
          6'h3e: out_r[2] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h02: out_r[3] = 1'b1;
          6'h03: out_r[3] = 1'b1;
          6'h06: out_r[3] = 1'b1;
          6'h0a: out_r[3] = 1'b1;
          6'h0b: out_r[3] = 1'b1;
          6'h0e: out_r[3] = 1'b1;
          6'h11: out_r[3] = 1'b1;
          6'h12: out_r[3] = 1'b1;
          6'h15: out_r[3] = 1'b1;
          6'h16: out_r[3] = 1'b1;
          6'h1a: out_r[3] = 1'b1;
          6'h1d: out_r[3] = 1'b1;
          6'h1e: out_r[3] = 1'b1;
          6'h23: out_r[3] = 1'b1;
          6'h2b: out_r[3] = 1'b1;
          6'h2c: out_r[3] = 1'b1;
          6'h2e: out_r[3] = 1'b1;
          6'h31: out_r[3] = 1'b1;
          6'h33: out_r[3] = 1'b1;
          6'h35: out_r[3] = 1'b1;
          6'h39: out_r[3] = 1'b1;
          6'h3a: out_r[3] = 1'b1;
          6'h3b: out_r[3] = 1'b1;
          6'h3e: out_r[3] = 1'b1;
          6'h3f: out_r[3] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h05: out_r[4] = 1'b1;
          6'h07: out_r[4] = 1'b1;
          6'h0d: out_r[4] = 1'b1;
          6'h0f: out_r[4] = 1'b1;
          6'h15: out_r[4] = 1'b1;
          6'h17: out_r[4] = 1'b1;
          6'h1d: out_r[4] = 1'b1;
          6'h1f: out_r[4] = 1'b1;
          6'h20: out_r[4] = 1'b1;
          6'h22: out_r[4] = 1'b1;
          6'h24: out_r[4] = 1'b1;
          6'h25: out_r[4] = 1'b1;
          6'h26: out_r[4] = 1'b1;
          6'h27: out_r[4] = 1'b1;
          6'h28: out_r[4] = 1'b1;
          6'h2a: out_r[4] = 1'b1;
          6'h2d: out_r[4] = 1'b1;
          6'h2f: out_r[4] = 1'b1;
          6'h30: out_r[4] = 1'b1;
          6'h32: out_r[4] = 1'b1;
          6'h34: out_r[4] = 1'b1;
          6'h36: out_r[4] = 1'b1;
          6'h3c: out_r[4] = 1'b1;
          6'h3d: out_r[4] = 1'b1;
          6'h3e: out_r[4] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h04: out_r[5] = 1'b1;
          6'h05: out_r[5] = 1'b1;
          6'h06: out_r[5] = 1'b1;
          6'h07: out_r[5] = 1'b1;
          6'h0c: out_r[5] = 1'b1;
          6'h0d: out_r[5] = 1'b1;
          6'h0e: out_r[5] = 1'b1;
          6'h0f: out_r[5] = 1'b1;
          6'h14: out_r[5] = 1'b1;
          6'h15: out_r[5] = 1'b1;
          6'h16: out_r[5] = 1'b1;
          6'h17: out_r[5] = 1'b1;
          6'h1c: out_r[5] = 1'b1;
          6'h1d: out_r[5] = 1'b1;
          6'h1e: out_r[5] = 1'b1;
          6'h1f: out_r[5] = 1'b1;
          6'h25: out_r[5] = 1'b1;
          6'h27: out_r[5] = 1'b1;
          6'h2d: out_r[5] = 1'b1;
          6'h2f: out_r[5] = 1'b1;
          6'h31: out_r[5] = 1'b1;
          6'h38: out_r[5] = 1'b1;
          6'h3a: out_r[5] = 1'b1;
          6'h3b: out_r[5] = 1'b1;
          6'h3c: out_r[5] = 1'b1;
          6'h3d: out_r[5] = 1'b1;
          6'h3e: out_r[5] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[6] = 1'b0;
          6'h02: out_r[6] = 1'b0;
          6'h04: out_r[6] = 1'b0;
          6'h06: out_r[6] = 1'b0;
          6'h08: out_r[6] = 1'b0;
          6'h09: out_r[6] = 1'b0;
          6'h0a: out_r[6] = 1'b0;
          6'h0c: out_r[6] = 1'b0;
          6'h0e: out_r[6] = 1'b0;
          6'h10: out_r[6] = 1'b0;
          6'h12: out_r[6] = 1'b0;
          6'h14: out_r[6] = 1'b0;
          6'h16: out_r[6] = 1'b0;
          6'h18: out_r[6] = 1'b0;
          6'h19: out_r[6] = 1'b0;
          6'h1a: out_r[6] = 1'b0;
          6'h1c: out_r[6] = 1'b0;
          6'h1e: out_r[6] = 1'b0;
          6'h29: out_r[6] = 1'b0;
          6'h38: out_r[6] = 1'b0;
          6'h39: out_r[6] = 1'b0;
          6'h3a: out_r[6] = 1'b0;
          6'h3b: out_r[6] = 1'b0;
          6'h3c: out_r[6] = 1'b0;
          6'h3d: out_r[6] = 1'b0;
          6'h3e: out_r[6] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h01: out_r[7] = 1'b1;
          6'h03: out_r[7] = 1'b1;
          6'h05: out_r[7] = 1'b1;
          6'h07: out_r[7] = 1'b1;
          6'h08: out_r[7] = 1'b1;
          6'h0a: out_r[7] = 1'b1;
          6'h0b: out_r[7] = 1'b1;
          6'h0c: out_r[7] = 1'b1;
          6'h0d: out_r[7] = 1'b1;
          6'h0e: out_r[7] = 1'b1;
          6'h0f: out_r[7] = 1'b1;
          6'h11: out_r[7] = 1'b1;
          6'h13: out_r[7] = 1'b1;
          6'h15: out_r[7] = 1'b1;
          6'h17: out_r[7] = 1'b1;
          6'h18: out_r[7] = 1'b1;
          6'h1a: out_r[7] = 1'b1;
          6'h1b: out_r[7] = 1'b1;
          6'h1c: out_r[7] = 1'b1;
          6'h1d: out_r[7] = 1'b1;
          6'h1e: out_r[7] = 1'b1;
          6'h1f: out_r[7] = 1'b1;
          6'h21: out_r[7] = 1'b1;
          6'h23: out_r[7] = 1'b1;
          6'h25: out_r[7] = 1'b1;
          6'h27: out_r[7] = 1'b1;
          6'h2b: out_r[7] = 1'b1;
          6'h2d: out_r[7] = 1'b1;
          6'h2f: out_r[7] = 1'b1;
          6'h33: out_r[7] = 1'b1;
          6'h3f: out_r[7] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h20: out_r[8] = 1'b1;
          6'h22: out_r[8] = 1'b1;
          6'h24: out_r[8] = 1'b1;
          6'h26: out_r[8] = 1'b1;
          6'h28: out_r[8] = 1'b1;
          6'h2a: out_r[8] = 1'b1;
          6'h2c: out_r[8] = 1'b1;
          6'h2e: out_r[8] = 1'b1;
          6'h30: out_r[8] = 1'b1;
          6'h31: out_r[8] = 1'b1;
          6'h32: out_r[8] = 1'b1;
          6'h33: out_r[8] = 1'b1;
          6'h34: out_r[8] = 1'b1;
          6'h35: out_r[8] = 1'b1;
          6'h36: out_r[8] = 1'b1;
          6'h37: out_r[8] = 1'b1;
          6'h38: out_r[8] = 1'b1;
          6'h39: out_r[8] = 1'b1;
          6'h3a: out_r[8] = 1'b1;
          6'h3b: out_r[8] = 1'b1;
          6'h3c: out_r[8] = 1'b1;
          6'h3d: out_r[8] = 1'b1;
          6'h3e: out_r[8] = 1'b1;
          6'h3f: out_r[8] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h0b: out_r[9] = 1'b1;
          6'h0d: out_r[9] = 1'b1;
          6'h10: out_r[9] = 1'b1;
          6'h11: out_r[9] = 1'b1;
          6'h12: out_r[9] = 1'b1;
          6'h13: out_r[9] = 1'b1;
          6'h14: out_r[9] = 1'b1;
          6'h15: out_r[9] = 1'b1;
          6'h16: out_r[9] = 1'b1;
          6'h18: out_r[9] = 1'b1;
          6'h1a: out_r[9] = 1'b1;
          6'h1b: out_r[9] = 1'b1;
          6'h1c: out_r[9] = 1'b1;
          6'h1d: out_r[9] = 1'b1;
          6'h1e: out_r[9] = 1'b1;
          6'h2a: out_r[9] = 1'b1;
          6'h2b: out_r[9] = 1'b1;
          6'h2d: out_r[9] = 1'b1;
          6'h31: out_r[9] = 1'b1;
          6'h32: out_r[9] = 1'b1;
          6'h33: out_r[9] = 1'b1;
          6'h34: out_r[9] = 1'b1;
          6'h35: out_r[9] = 1'b1;
          6'h37: out_r[9] = 1'b1;
          6'h39: out_r[9] = 1'b1;
          6'h3b: out_r[9] = 1'b1;
          6'h3d: out_r[9] = 1'b1;
          6'h3f: out_r[9] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h0f: out_r[10] = 1'b1;
          6'h17: out_r[10] = 1'b1;
          6'h1f: out_r[10] = 1'b1;
          6'h20: out_r[10] = 1'b1;
          6'h22: out_r[10] = 1'b1;
          6'h24: out_r[10] = 1'b1;
          6'h26: out_r[10] = 1'b1;
          6'h28: out_r[10] = 1'b1;
          6'h2a: out_r[10] = 1'b1;
          6'h2c: out_r[10] = 1'b1;
          6'h2e: out_r[10] = 1'b1;
          6'h2f: out_r[10] = 1'b1;
          6'h30: out_r[10] = 1'b1;
          6'h32: out_r[10] = 1'b1;
          6'h33: out_r[10] = 1'b1;
          6'h34: out_r[10] = 1'b1;
          6'h36: out_r[10] = 1'b1;
          6'h38: out_r[10] = 1'b1;
          6'h39: out_r[10] = 1'b1;
          6'h3a: out_r[10] = 1'b1;
          6'h3b: out_r[10] = 1'b1;
          6'h3c: out_r[10] = 1'b1;
          6'h3e: out_r[10] = 1'b1;
          6'h3f: out_r[10] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h0d: out_r[11] = 1'b1;
          6'h1d: out_r[11] = 1'b1;
          6'h22: out_r[11] = 1'b1;
          6'h24: out_r[11] = 1'b1;
          6'h28: out_r[11] = 1'b1;
          6'h2a: out_r[11] = 1'b1;
          6'h2d: out_r[11] = 1'b1;
          6'h30: out_r[11] = 1'b1;
          6'h32: out_r[11] = 1'b1;
          6'h33: out_r[11] = 1'b1;
          6'h34: out_r[11] = 1'b1;
          6'h39: out_r[11] = 1'b1;
          6'h3b: out_r[11] = 1'b1;
          default: begin end
        endcase
      end
      6'h02: begin
        out_r = 12'h104;
        case (inner)
          6'h01: out_r[0] = 1'b1;
          6'h05: out_r[0] = 1'b1;
          6'h09: out_r[0] = 1'b1;
          6'h0d: out_r[0] = 1'b1;
          6'h11: out_r[0] = 1'b1;
          6'h15: out_r[0] = 1'b1;
          6'h19: out_r[0] = 1'b1;
          6'h1d: out_r[0] = 1'b1;
          6'h1e: out_r[0] = 1'b1;
          6'h1f: out_r[0] = 1'b1;
          6'h21: out_r[0] = 1'b1;
          6'h25: out_r[0] = 1'b1;
          6'h27: out_r[0] = 1'b1;
          6'h29: out_r[0] = 1'b1;
          6'h2d: out_r[0] = 1'b1;
          6'h2e: out_r[0] = 1'b1;
          6'h31: out_r[0] = 1'b1;
          6'h33: out_r[0] = 1'b1;
          6'h35: out_r[0] = 1'b1;
          6'h37: out_r[0] = 1'b1;
          6'h39: out_r[0] = 1'b1;
          6'h3d: out_r[0] = 1'b1;
          6'h3e: out_r[0] = 1'b1;
          6'h3f: out_r[0] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h05: out_r[1] = 1'b1;
          6'h09: out_r[1] = 1'b1;
          6'h11: out_r[1] = 1'b1;
          6'h15: out_r[1] = 1'b1;
          6'h1a: out_r[1] = 1'b1;
          6'h1b: out_r[1] = 1'b1;
          6'h21: out_r[1] = 1'b1;
          6'h25: out_r[1] = 1'b1;
          6'h27: out_r[1] = 1'b1;
          6'h29: out_r[1] = 1'b1;
          6'h33: out_r[1] = 1'b1;
          6'h37: out_r[1] = 1'b1;
          6'h3a: out_r[1] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h05: out_r[2] = 1'b0;
          6'h09: out_r[2] = 1'b0;
          6'h11: out_r[2] = 1'b0;
          6'h12: out_r[2] = 1'b0;
          6'h13: out_r[2] = 1'b0;
          6'h16: out_r[2] = 1'b0;
          6'h17: out_r[2] = 1'b0;
          6'h1a: out_r[2] = 1'b0;
          6'h1b: out_r[2] = 1'b0;
          6'h1d: out_r[2] = 1'b0;
          6'h21: out_r[2] = 1'b0;
          6'h26: out_r[2] = 1'b0;
          6'h27: out_r[2] = 1'b0;
          6'h2b: out_r[2] = 1'b0;
          6'h32: out_r[2] = 1'b0;
          6'h33: out_r[2] = 1'b0;
          6'h37: out_r[2] = 1'b0;
          6'h3a: out_r[2] = 1'b0;
          6'h3d: out_r[2] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h01: out_r[3] = 1'b1;
          6'h02: out_r[3] = 1'b1;
          6'h03: out_r[3] = 1'b1;
          6'h05: out_r[3] = 1'b1;
          6'h06: out_r[3] = 1'b1;
          6'h07: out_r[3] = 1'b1;
          6'h09: out_r[3] = 1'b1;
          6'h0a: out_r[3] = 1'b1;
          6'h0b: out_r[3] = 1'b1;
          6'h0e: out_r[3] = 1'b1;
          6'h0f: out_r[3] = 1'b1;
          6'h11: out_r[3] = 1'b1;
          6'h15: out_r[3] = 1'b1;
          6'h1d: out_r[3] = 1'b1;
          6'h21: out_r[3] = 1'b1;
          6'h22: out_r[3] = 1'b1;
          6'h23: out_r[3] = 1'b1;
          6'h25: out_r[3] = 1'b1;
          6'h27: out_r[3] = 1'b1;
          6'h29: out_r[3] = 1'b1;
          6'h2a: out_r[3] = 1'b1;
          6'h2b: out_r[3] = 1'b1;
          6'h33: out_r[3] = 1'b1;
          6'h37: out_r[3] = 1'b1;
          6'h3d: out_r[3] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h01: out_r[4] = 1'b1;
          6'h05: out_r[4] = 1'b1;
          6'h09: out_r[4] = 1'b1;
          6'h0e: out_r[4] = 1'b1;
          6'h0f: out_r[4] = 1'b1;
          6'h11: out_r[4] = 1'b1;
          6'h15: out_r[4] = 1'b1;
          6'h1d: out_r[4] = 1'b1;
          6'h1e: out_r[4] = 1'b1;
          6'h1f: out_r[4] = 1'b1;
          6'h21: out_r[4] = 1'b1;
          6'h25: out_r[4] = 1'b1;
          6'h27: out_r[4] = 1'b1;
          6'h29: out_r[4] = 1'b1;
          6'h2a: out_r[4] = 1'b1;
          6'h2b: out_r[4] = 1'b1;
          6'h2e: out_r[4] = 1'b1;
          6'h33: out_r[4] = 1'b1;
          6'h37: out_r[4] = 1'b1;
          6'h3a: out_r[4] = 1'b1;
          6'h3d: out_r[4] = 1'b1;
          6'h3e: out_r[4] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h04: out_r[5] = 1'b1;
          6'h06: out_r[5] = 1'b1;
          6'h07: out_r[5] = 1'b1;
          6'h0c: out_r[5] = 1'b1;
          6'h14: out_r[5] = 1'b1;
          6'h16: out_r[5] = 1'b1;
          6'h17: out_r[5] = 1'b1;
          6'h19: out_r[5] = 1'b1;
          6'h1c: out_r[5] = 1'b1;
          6'h1d: out_r[5] = 1'b1;
          6'h22: out_r[5] = 1'b1;
          6'h23: out_r[5] = 1'b1;
          6'h24: out_r[5] = 1'b1;
          6'h27: out_r[5] = 1'b1;
          6'h2a: out_r[5] = 1'b1;
          6'h2b: out_r[5] = 1'b1;
          6'h2c: out_r[5] = 1'b1;
          6'h33: out_r[5] = 1'b1;
          6'h34: out_r[5] = 1'b1;
          6'h35: out_r[5] = 1'b1;
          6'h37: out_r[5] = 1'b1;
          6'h3a: out_r[5] = 1'b1;
          6'h3c: out_r[5] = 1'b1;
          6'h3d: out_r[5] = 1'b1;
          6'h3f: out_r[5] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h01: out_r[6] = 1'b1;
          6'h05: out_r[6] = 1'b1;
          6'h09: out_r[6] = 1'b1;
          6'h0a: out_r[6] = 1'b1;
          6'h0b: out_r[6] = 1'b1;
          6'h0d: out_r[6] = 1'b1;
          6'h0e: out_r[6] = 1'b1;
          6'h0f: out_r[6] = 1'b1;
          6'h11: out_r[6] = 1'b1;
          6'h15: out_r[6] = 1'b1;
          6'h1a: out_r[6] = 1'b1;
          6'h1b: out_r[6] = 1'b1;
          6'h1e: out_r[6] = 1'b1;
          6'h1f: out_r[6] = 1'b1;
          6'h21: out_r[6] = 1'b1;
          6'h25: out_r[6] = 1'b1;
          6'h29: out_r[6] = 1'b1;
          6'h2a: out_r[6] = 1'b1;
          6'h2d: out_r[6] = 1'b1;
          6'h2e: out_r[6] = 1'b1;
          6'h39: out_r[6] = 1'b1;
          6'h3a: out_r[6] = 1'b1;
          6'h3b: out_r[6] = 1'b1;
          6'h3d: out_r[6] = 1'b1;
          6'h3e: out_r[6] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h08: out_r[7] = 1'b1;
          6'h0a: out_r[7] = 1'b1;
          6'h0b: out_r[7] = 1'b1;
          6'h0c: out_r[7] = 1'b1;
          6'h0e: out_r[7] = 1'b1;
          6'h0f: out_r[7] = 1'b1;
          6'h18: out_r[7] = 1'b1;
          6'h1a: out_r[7] = 1'b1;
          6'h1b: out_r[7] = 1'b1;
          6'h1c: out_r[7] = 1'b1;
          6'h1e: out_r[7] = 1'b1;
          6'h1f: out_r[7] = 1'b1;
          6'h23: out_r[7] = 1'b1;
          6'h28: out_r[7] = 1'b1;
          6'h2a: out_r[7] = 1'b1;
          6'h2c: out_r[7] = 1'b1;
          6'h2e: out_r[7] = 1'b1;
          6'h31: out_r[7] = 1'b1;
          6'h35: out_r[7] = 1'b1;
          6'h37: out_r[7] = 1'b1;
          6'h38: out_r[7] = 1'b1;
          6'h39: out_r[7] = 1'b1;
          6'h3a: out_r[7] = 1'b1;
          6'h3b: out_r[7] = 1'b1;
          6'h3c: out_r[7] = 1'b1;
          6'h3d: out_r[7] = 1'b1;
          6'h3e: out_r[7] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[8] = 1'b0;
          6'h04: out_r[8] = 1'b0;
          6'h08: out_r[8] = 1'b0;
          6'h0c: out_r[8] = 1'b0;
          6'h10: out_r[8] = 1'b0;
          6'h12: out_r[8] = 1'b0;
          6'h13: out_r[8] = 1'b0;
          6'h14: out_r[8] = 1'b0;
          6'h18: out_r[8] = 1'b0;
          6'h1c: out_r[8] = 1'b0;
          6'h20: out_r[8] = 1'b0;
          6'h24: out_r[8] = 1'b0;
          6'h28: out_r[8] = 1'b0;
          6'h2c: out_r[8] = 1'b0;
          6'h30: out_r[8] = 1'b0;
          6'h31: out_r[8] = 1'b0;
          6'h32: out_r[8] = 1'b0;
          6'h33: out_r[8] = 1'b0;
          6'h34: out_r[8] = 1'b0;
          6'h35: out_r[8] = 1'b0;
          6'h37: out_r[8] = 1'b0;
          6'h38: out_r[8] = 1'b0;
          6'h39: out_r[8] = 1'b0;
          6'h3b: out_r[8] = 1'b0;
          6'h3c: out_r[8] = 1'b0;
          6'h3d: out_r[8] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h02: out_r[9] = 1'b1;
          6'h03: out_r[9] = 1'b1;
          6'h06: out_r[9] = 1'b1;
          6'h07: out_r[9] = 1'b1;
          6'h0a: out_r[9] = 1'b1;
          6'h0b: out_r[9] = 1'b1;
          6'h0e: out_r[9] = 1'b1;
          6'h0f: out_r[9] = 1'b1;
          6'h10: out_r[9] = 1'b1;
          6'h14: out_r[9] = 1'b1;
          6'h16: out_r[9] = 1'b1;
          6'h17: out_r[9] = 1'b1;
          6'h18: out_r[9] = 1'b1;
          6'h1a: out_r[9] = 1'b1;
          6'h1b: out_r[9] = 1'b1;
          6'h1c: out_r[9] = 1'b1;
          6'h1e: out_r[9] = 1'b1;
          6'h1f: out_r[9] = 1'b1;
          6'h22: out_r[9] = 1'b1;
          6'h26: out_r[9] = 1'b1;
          6'h27: out_r[9] = 1'b1;
          6'h2a: out_r[9] = 1'b1;
          6'h2e: out_r[9] = 1'b1;
          6'h30: out_r[9] = 1'b1;
          6'h34: out_r[9] = 1'b1;
          6'h36: out_r[9] = 1'b1;
          6'h38: out_r[9] = 1'b1;
          6'h3a: out_r[9] = 1'b1;
          6'h3c: out_r[9] = 1'b1;
          6'h3e: out_r[9] = 1'b1;
          6'h3f: out_r[9] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h01: out_r[10] = 1'b1;
          6'h05: out_r[10] = 1'b1;
          6'h09: out_r[10] = 1'b1;
          6'h0d: out_r[10] = 1'b1;
          6'h11: out_r[10] = 1'b1;
          6'h15: out_r[10] = 1'b1;
          6'h19: out_r[10] = 1'b1;
          6'h1d: out_r[10] = 1'b1;
          6'h21: out_r[10] = 1'b1;
          6'h23: out_r[10] = 1'b1;
          6'h25: out_r[10] = 1'b1;
          6'h27: out_r[10] = 1'b1;
          6'h29: out_r[10] = 1'b1;
          6'h2b: out_r[10] = 1'b1;
          6'h2d: out_r[10] = 1'b1;
          6'h2f: out_r[10] = 1'b1;
          6'h31: out_r[10] = 1'b1;
          6'h33: out_r[10] = 1'b1;
          6'h35: out_r[10] = 1'b1;
          6'h37: out_r[10] = 1'b1;
          6'h39: out_r[10] = 1'b1;
          6'h3b: out_r[10] = 1'b1;
          6'h3d: out_r[10] = 1'b1;
          6'h3f: out_r[10] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h15: out_r[11] = 1'b1;
          6'h16: out_r[11] = 1'b1;
          6'h17: out_r[11] = 1'b1;
          6'h1a: out_r[11] = 1'b1;
          6'h1b: out_r[11] = 1'b1;
          6'h20: out_r[11] = 1'b1;
          6'h22: out_r[11] = 1'b1;
          6'h23: out_r[11] = 1'b1;
          6'h24: out_r[11] = 1'b1;
          6'h25: out_r[11] = 1'b1;
          6'h26: out_r[11] = 1'b1;
          6'h27: out_r[11] = 1'b1;
          6'h28: out_r[11] = 1'b1;
          6'h29: out_r[11] = 1'b1;
          6'h2a: out_r[11] = 1'b1;
          6'h2b: out_r[11] = 1'b1;
          6'h2c: out_r[11] = 1'b1;
          6'h2f: out_r[11] = 1'b1;
          6'h30: out_r[11] = 1'b1;
          6'h33: out_r[11] = 1'b1;
          6'h34: out_r[11] = 1'b1;
          6'h36: out_r[11] = 1'b1;
          6'h37: out_r[11] = 1'b1;
          6'h38: out_r[11] = 1'b1;
          6'h3a: out_r[11] = 1'b1;
          6'h3b: out_r[11] = 1'b1;
          6'h3c: out_r[11] = 1'b1;
          6'h3f: out_r[11] = 1'b1;
          default: begin end
        endcase
      end
      6'h03: begin
        out_r = 12'h40e;
        case (inner)
          6'h00: out_r[0] = 1'b1;
          6'h0d: out_r[0] = 1'b1;
          6'h10: out_r[0] = 1'b1;
          6'h11: out_r[0] = 1'b1;
          6'h12: out_r[0] = 1'b1;
          6'h13: out_r[0] = 1'b1;
          6'h14: out_r[0] = 1'b1;
          6'h18: out_r[0] = 1'b1;
          6'h19: out_r[0] = 1'b1;
          6'h1a: out_r[0] = 1'b1;
          6'h1b: out_r[0] = 1'b1;
          6'h1c: out_r[0] = 1'b1;
          6'h1d: out_r[0] = 1'b1;
          6'h1e: out_r[0] = 1'b1;
          6'h1f: out_r[0] = 1'b1;
          6'h24: out_r[0] = 1'b1;
          6'h2d: out_r[0] = 1'b1;
          6'h30: out_r[0] = 1'b1;
          6'h31: out_r[0] = 1'b1;
          6'h32: out_r[0] = 1'b1;
          6'h33: out_r[0] = 1'b1;
          6'h34: out_r[0] = 1'b1;
          6'h39: out_r[0] = 1'b1;
          6'h3a: out_r[0] = 1'b1;
          6'h3b: out_r[0] = 1'b1;
          6'h3e: out_r[0] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h12: out_r[1] = 1'b0;
          6'h13: out_r[1] = 1'b0;
          6'h16: out_r[1] = 1'b0;
          6'h17: out_r[1] = 1'b0;
          6'h1a: out_r[1] = 1'b0;
          6'h1b: out_r[1] = 1'b0;
          6'h1e: out_r[1] = 1'b0;
          6'h1f: out_r[1] = 1'b0;
          6'h32: out_r[1] = 1'b0;
          6'h33: out_r[1] = 1'b0;
          6'h37: out_r[1] = 1'b0;
          6'h3a: out_r[1] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h01: out_r[2] = 1'b0;
          6'h05: out_r[2] = 1'b0;
          6'h0d: out_r[2] = 1'b0;
          6'h11: out_r[2] = 1'b0;
          6'h12: out_r[2] = 1'b0;
          6'h13: out_r[2] = 1'b0;
          6'h14: out_r[2] = 1'b0;
          6'h16: out_r[2] = 1'b0;
          6'h18: out_r[2] = 1'b0;
          6'h19: out_r[2] = 1'b0;
          6'h1a: out_r[2] = 1'b0;
          6'h1b: out_r[2] = 1'b0;
          6'h1e: out_r[2] = 1'b0;
          6'h1f: out_r[2] = 1'b0;
          6'h20: out_r[2] = 1'b0;
          6'h21: out_r[2] = 1'b0;
          6'h25: out_r[2] = 1'b0;
          6'h2c: out_r[2] = 1'b0;
          6'h2d: out_r[2] = 1'b0;
          6'h30: out_r[2] = 1'b0;
          6'h31: out_r[2] = 1'b0;
          6'h32: out_r[2] = 1'b0;
          6'h33: out_r[2] = 1'b0;
          6'h39: out_r[2] = 1'b0;
          6'h3c: out_r[2] = 1'b0;
          6'h3d: out_r[2] = 1'b0;
          6'h3e: out_r[2] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[3] = 1'b0;
          6'h04: out_r[3] = 1'b0;
          6'h08: out_r[3] = 1'b0;
          6'h09: out_r[3] = 1'b0;
          6'h0c: out_r[3] = 1'b0;
          6'h10: out_r[3] = 1'b0;
          6'h12: out_r[3] = 1'b0;
          6'h13: out_r[3] = 1'b0;
          6'h15: out_r[3] = 1'b0;
          6'h1a: out_r[3] = 1'b0;
          6'h1b: out_r[3] = 1'b0;
          6'h1c: out_r[3] = 1'b0;
          6'h1d: out_r[3] = 1'b0;
          6'h1e: out_r[3] = 1'b0;
          6'h1f: out_r[3] = 1'b0;
          6'h24: out_r[3] = 1'b0;
          6'h28: out_r[3] = 1'b0;
          6'h29: out_r[3] = 1'b0;
          6'h32: out_r[3] = 1'b0;
          6'h33: out_r[3] = 1'b0;
          6'h34: out_r[3] = 1'b0;
          6'h35: out_r[3] = 1'b0;
          6'h36: out_r[3] = 1'b0;
          6'h38: out_r[3] = 1'b0;
          6'h3a: out_r[3] = 1'b0;
          6'h3b: out_r[3] = 1'b0;
          6'h3f: out_r[3] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[4] = 1'b1;
          6'h01: out_r[4] = 1'b1;
          6'h05: out_r[4] = 1'b1;
          6'h0c: out_r[4] = 1'b1;
          6'h0d: out_r[4] = 1'b1;
          6'h11: out_r[4] = 1'b1;
          6'h12: out_r[4] = 1'b1;
          6'h13: out_r[4] = 1'b1;
          6'h14: out_r[4] = 1'b1;
          6'h15: out_r[4] = 1'b1;
          6'h16: out_r[4] = 1'b1;
          6'h17: out_r[4] = 1'b1;
          6'h18: out_r[4] = 1'b1;
          6'h19: out_r[4] = 1'b1;
          6'h1a: out_r[4] = 1'b1;
          6'h1b: out_r[4] = 1'b1;
          6'h20: out_r[4] = 1'b1;
          6'h21: out_r[4] = 1'b1;
          6'h24: out_r[4] = 1'b1;
          6'h25: out_r[4] = 1'b1;
          6'h2c: out_r[4] = 1'b1;
          6'h2d: out_r[4] = 1'b1;
          6'h30: out_r[4] = 1'b1;
          6'h31: out_r[4] = 1'b1;
          6'h33: out_r[4] = 1'b1;
          6'h34: out_r[4] = 1'b1;
          6'h35: out_r[4] = 1'b1;
          6'h37: out_r[4] = 1'b1;
          6'h39: out_r[4] = 1'b1;
          6'h3c: out_r[4] = 1'b1;
          6'h3d: out_r[4] = 1'b1;
          6'h3e: out_r[4] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h01: out_r[5] = 1'b1;
          6'h05: out_r[5] = 1'b1;
          6'h06: out_r[5] = 1'b1;
          6'h07: out_r[5] = 1'b1;
          6'h0d: out_r[5] = 1'b1;
          6'h0e: out_r[5] = 1'b1;
          6'h0f: out_r[5] = 1'b1;
          6'h11: out_r[5] = 1'b1;
          6'h14: out_r[5] = 1'b1;
          6'h18: out_r[5] = 1'b1;
          6'h19: out_r[5] = 1'b1;
          6'h1c: out_r[5] = 1'b1;
          6'h1d: out_r[5] = 1'b1;
          6'h20: out_r[5] = 1'b1;
          6'h21: out_r[5] = 1'b1;
          6'h25: out_r[5] = 1'b1;
          6'h26: out_r[5] = 1'b1;
          6'h27: out_r[5] = 1'b1;
          6'h28: out_r[5] = 1'b1;
          6'h2c: out_r[5] = 1'b1;
          6'h2d: out_r[5] = 1'b1;
          6'h2e: out_r[5] = 1'b1;
          6'h2f: out_r[5] = 1'b1;
          6'h30: out_r[5] = 1'b1;
          6'h31: out_r[5] = 1'b1;
          6'h32: out_r[5] = 1'b1;
          6'h39: out_r[5] = 1'b1;
          6'h3c: out_r[5] = 1'b1;
          6'h3d: out_r[5] = 1'b1;
          6'h3e: out_r[5] = 1'b1;
          6'h3f: out_r[5] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[6] = 1'b1;
          6'h04: out_r[6] = 1'b1;
          6'h05: out_r[6] = 1'b1;
          6'h09: out_r[6] = 1'b1;
          6'h0c: out_r[6] = 1'b1;
          6'h0d: out_r[6] = 1'b1;
          6'h10: out_r[6] = 1'b1;
          6'h11: out_r[6] = 1'b1;
          6'h12: out_r[6] = 1'b1;
          6'h13: out_r[6] = 1'b1;
          6'h14: out_r[6] = 1'b1;
          6'h15: out_r[6] = 1'b1;
          6'h16: out_r[6] = 1'b1;
          6'h17: out_r[6] = 1'b1;
          6'h1a: out_r[6] = 1'b1;
          6'h1b: out_r[6] = 1'b1;
          6'h1e: out_r[6] = 1'b1;
          6'h1f: out_r[6] = 1'b1;
          6'h24: out_r[6] = 1'b1;
          6'h25: out_r[6] = 1'b1;
          6'h29: out_r[6] = 1'b1;
          6'h2c: out_r[6] = 1'b1;
          6'h2d: out_r[6] = 1'b1;
          6'h30: out_r[6] = 1'b1;
          6'h31: out_r[6] = 1'b1;
          6'h32: out_r[6] = 1'b1;
          6'h33: out_r[6] = 1'b1;
          6'h34: out_r[6] = 1'b1;
          6'h35: out_r[6] = 1'b1;
          6'h36: out_r[6] = 1'b1;
          6'h37: out_r[6] = 1'b1;
          6'h3e: out_r[6] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[7] = 1'b1;
          6'h04: out_r[7] = 1'b1;
          6'h05: out_r[7] = 1'b1;
          6'h09: out_r[7] = 1'b1;
          6'h0a: out_r[7] = 1'b1;
          6'h0b: out_r[7] = 1'b1;
          6'h0c: out_r[7] = 1'b1;
          6'h0e: out_r[7] = 1'b1;
          6'h0f: out_r[7] = 1'b1;
          6'h10: out_r[7] = 1'b1;
          6'h11: out_r[7] = 1'b1;
          6'h14: out_r[7] = 1'b1;
          6'h15: out_r[7] = 1'b1;
          6'h17: out_r[7] = 1'b1;
          6'h24: out_r[7] = 1'b1;
          6'h25: out_r[7] = 1'b1;
          6'h28: out_r[7] = 1'b1;
          6'h29: out_r[7] = 1'b1;
          6'h2a: out_r[7] = 1'b1;
          6'h2b: out_r[7] = 1'b1;
          6'h2e: out_r[7] = 1'b1;
          6'h2f: out_r[7] = 1'b1;
          6'h30: out_r[7] = 1'b1;
          6'h31: out_r[7] = 1'b1;
          6'h34: out_r[7] = 1'b1;
          6'h35: out_r[7] = 1'b1;
          6'h37: out_r[7] = 1'b1;
          6'h39: out_r[7] = 1'b1;
          6'h3b: out_r[7] = 1'b1;
          6'h3f: out_r[7] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[8] = 1'b1;
          6'h04: out_r[8] = 1'b1;
          6'h08: out_r[8] = 1'b1;
          6'h09: out_r[8] = 1'b1;
          6'h0c: out_r[8] = 1'b1;
          6'h0d: out_r[8] = 1'b1;
          6'h12: out_r[8] = 1'b1;
          6'h13: out_r[8] = 1'b1;
          6'h16: out_r[8] = 1'b1;
          6'h17: out_r[8] = 1'b1;
          6'h19: out_r[8] = 1'b1;
          6'h1a: out_r[8] = 1'b1;
          6'h1b: out_r[8] = 1'b1;
          6'h1e: out_r[8] = 1'b1;
          6'h1f: out_r[8] = 1'b1;
          6'h28: out_r[8] = 1'b1;
          6'h29: out_r[8] = 1'b1;
          6'h2c: out_r[8] = 1'b1;
          6'h2d: out_r[8] = 1'b1;
          6'h30: out_r[8] = 1'b1;
          6'h32: out_r[8] = 1'b1;
          6'h33: out_r[8] = 1'b1;
          6'h34: out_r[8] = 1'b1;
          6'h36: out_r[8] = 1'b1;
          6'h37: out_r[8] = 1'b1;
          6'h38: out_r[8] = 1'b1;
          6'h3a: out_r[8] = 1'b1;
          6'h3e: out_r[8] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[9] = 1'b1;
          6'h08: out_r[9] = 1'b1;
          6'h09: out_r[9] = 1'b1;
          6'h0c: out_r[9] = 1'b1;
          6'h0d: out_r[9] = 1'b1;
          6'h11: out_r[9] = 1'b1;
          6'h15: out_r[9] = 1'b1;
          6'h16: out_r[9] = 1'b1;
          6'h17: out_r[9] = 1'b1;
          6'h18: out_r[9] = 1'b1;
          6'h19: out_r[9] = 1'b1;
          6'h22: out_r[9] = 1'b1;
          6'h26: out_r[9] = 1'b1;
          6'h29: out_r[9] = 1'b1;
          6'h2a: out_r[9] = 1'b1;
          6'h2c: out_r[9] = 1'b1;
          6'h2d: out_r[9] = 1'b1;
          6'h2e: out_r[9] = 1'b1;
          6'h30: out_r[9] = 1'b1;
          6'h31: out_r[9] = 1'b1;
          6'h32: out_r[9] = 1'b1;
          6'h35: out_r[9] = 1'b1;
          6'h36: out_r[9] = 1'b1;
          6'h37: out_r[9] = 1'b1;
          6'h38: out_r[9] = 1'b1;
          6'h39: out_r[9] = 1'b1;
          6'h3a: out_r[9] = 1'b1;
          6'h3e: out_r[9] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h01: out_r[10] = 1'b0;
          6'h05: out_r[10] = 1'b0;
          6'h08: out_r[10] = 1'b0;
          6'h09: out_r[10] = 1'b0;
          6'h0c: out_r[10] = 1'b0;
          6'h11: out_r[10] = 1'b0;
          6'h15: out_r[10] = 1'b0;
          6'h16: out_r[10] = 1'b0;
          6'h17: out_r[10] = 1'b0;
          6'h18: out_r[10] = 1'b0;
          6'h1c: out_r[10] = 1'b0;
          6'h20: out_r[10] = 1'b0;
          6'h21: out_r[10] = 1'b0;
          6'h22: out_r[10] = 1'b0;
          6'h24: out_r[10] = 1'b0;
          6'h25: out_r[10] = 1'b0;
          6'h26: out_r[10] = 1'b0;
          6'h29: out_r[10] = 1'b0;
          6'h2a: out_r[10] = 1'b0;
          6'h2c: out_r[10] = 1'b0;
          6'h2e: out_r[10] = 1'b0;
          6'h31: out_r[10] = 1'b0;
          6'h32: out_r[10] = 1'b0;
          6'h35: out_r[10] = 1'b0;
          6'h36: out_r[10] = 1'b0;
          6'h37: out_r[10] = 1'b0;
          6'h38: out_r[10] = 1'b0;
          6'h3a: out_r[10] = 1'b0;
          6'h3c: out_r[10] = 1'b0;
          6'h3d: out_r[10] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[11] = 1'b1;
          6'h04: out_r[11] = 1'b1;
          6'h09: out_r[11] = 1'b1;
          6'h10: out_r[11] = 1'b1;
          6'h14: out_r[11] = 1'b1;
          6'h15: out_r[11] = 1'b1;
          6'h19: out_r[11] = 1'b1;
          6'h28: out_r[11] = 1'b1;
          6'h29: out_r[11] = 1'b1;
          6'h34: out_r[11] = 1'b1;
          6'h35: out_r[11] = 1'b1;
          6'h38: out_r[11] = 1'b1;
          6'h3f: out_r[11] = 1'b1;
          default: begin end
        endcase
      end
      6'h04: begin
        out_r = 12'h410;
        case (inner)
          6'h02: out_r[0] = 1'b1;
          6'h03: out_r[0] = 1'b1;
          6'h07: out_r[0] = 1'b1;
          6'h0a: out_r[0] = 1'b1;
          6'h0b: out_r[0] = 1'b1;
          6'h0f: out_r[0] = 1'b1;
          6'h12: out_r[0] = 1'b1;
          6'h13: out_r[0] = 1'b1;
          6'h17: out_r[0] = 1'b1;
          6'h1a: out_r[0] = 1'b1;
          6'h1b: out_r[0] = 1'b1;
          6'h1f: out_r[0] = 1'b1;
          6'h22: out_r[0] = 1'b1;
          6'h23: out_r[0] = 1'b1;
          6'h27: out_r[0] = 1'b1;
          6'h2a: out_r[0] = 1'b1;
          6'h2b: out_r[0] = 1'b1;
          6'h2f: out_r[0] = 1'b1;
          6'h32: out_r[0] = 1'b1;
          6'h33: out_r[0] = 1'b1;
          6'h37: out_r[0] = 1'b1;
          6'h3a: out_r[0] = 1'b1;
          6'h3b: out_r[0] = 1'b1;
          6'h3f: out_r[0] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h01: out_r[1] = 1'b1;
          6'h05: out_r[1] = 1'b1;
          6'h07: out_r[1] = 1'b1;
          6'h09: out_r[1] = 1'b1;
          6'h0b: out_r[1] = 1'b1;
          6'h0d: out_r[1] = 1'b1;
          6'h0f: out_r[1] = 1'b1;
          6'h11: out_r[1] = 1'b1;
          6'h13: out_r[1] = 1'b1;
          6'h15: out_r[1] = 1'b1;
          6'h17: out_r[1] = 1'b1;
          6'h19: out_r[1] = 1'b1;
          6'h1f: out_r[1] = 1'b1;
          6'h21: out_r[1] = 1'b1;
          6'h27: out_r[1] = 1'b1;
          6'h29: out_r[1] = 1'b1;
          6'h2a: out_r[1] = 1'b1;
          6'h2c: out_r[1] = 1'b1;
          6'h2d: out_r[1] = 1'b1;
          6'h2e: out_r[1] = 1'b1;
          6'h2f: out_r[1] = 1'b1;
          6'h31: out_r[1] = 1'b1;
          6'h34: out_r[1] = 1'b1;
          6'h35: out_r[1] = 1'b1;
          6'h36: out_r[1] = 1'b1;
          6'h37: out_r[1] = 1'b1;
          6'h39: out_r[1] = 1'b1;
          6'h3f: out_r[1] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h02: out_r[2] = 1'b1;
          6'h03: out_r[2] = 1'b1;
          6'h0a: out_r[2] = 1'b1;
          6'h0b: out_r[2] = 1'b1;
          6'h0f: out_r[2] = 1'b1;
          6'h12: out_r[2] = 1'b1;
          6'h13: out_r[2] = 1'b1;
          6'h1a: out_r[2] = 1'b1;
          6'h1b: out_r[2] = 1'b1;
          6'h1d: out_r[2] = 1'b1;
          6'h22: out_r[2] = 1'b1;
          6'h23: out_r[2] = 1'b1;
          6'h27: out_r[2] = 1'b1;
          6'h2a: out_r[2] = 1'b1;
          6'h2b: out_r[2] = 1'b1;
          6'h2f: out_r[2] = 1'b1;
          6'h32: out_r[2] = 1'b1;
          6'h33: out_r[2] = 1'b1;
          6'h3a: out_r[2] = 1'b1;
          6'h3b: out_r[2] = 1'b1;
          6'h3c: out_r[2] = 1'b1;
          6'h3d: out_r[2] = 1'b1;
          6'h3e: out_r[2] = 1'b1;
          6'h3f: out_r[2] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h03: out_r[3] = 1'b1;
          6'h0a: out_r[3] = 1'b1;
          6'h0b: out_r[3] = 1'b1;
          6'h0f: out_r[3] = 1'b1;
          6'h12: out_r[3] = 1'b1;
          6'h13: out_r[3] = 1'b1;
          6'h22: out_r[3] = 1'b1;
          6'h27: out_r[3] = 1'b1;
          6'h2a: out_r[3] = 1'b1;
          6'h2f: out_r[3] = 1'b1;
          6'h34: out_r[3] = 1'b1;
          6'h35: out_r[3] = 1'b1;
          6'h36: out_r[3] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h03: out_r[4] = 1'b0;
          6'h0a: out_r[4] = 1'b0;
          6'h0d: out_r[4] = 1'b0;
          6'h0f: out_r[4] = 1'b0;
          6'h12: out_r[4] = 1'b0;
          6'h17: out_r[4] = 1'b0;
          6'h22: out_r[4] = 1'b0;
          6'h24: out_r[4] = 1'b0;
          6'h25: out_r[4] = 1'b0;
          6'h26: out_r[4] = 1'b0;
          6'h27: out_r[4] = 1'b0;
          6'h2c: out_r[4] = 1'b0;
          6'h2e: out_r[4] = 1'b0;
          6'h2f: out_r[4] = 1'b0;
          6'h34: out_r[4] = 1'b0;
          6'h35: out_r[4] = 1'b0;
          6'h36: out_r[4] = 1'b0;
          6'h3a: out_r[4] = 1'b0;
          6'h3b: out_r[4] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h02: out_r[5] = 1'b1;
          6'h03: out_r[5] = 1'b1;
          6'h04: out_r[5] = 1'b1;
          6'h05: out_r[5] = 1'b1;
          6'h06: out_r[5] = 1'b1;
          6'h07: out_r[5] = 1'b1;
          6'h0a: out_r[5] = 1'b1;
          6'h0b: out_r[5] = 1'b1;
          6'h0c: out_r[5] = 1'b1;
          6'h0e: out_r[5] = 1'b1;
          6'h0f: out_r[5] = 1'b1;
          6'h12: out_r[5] = 1'b1;
          6'h13: out_r[5] = 1'b1;
          6'h14: out_r[5] = 1'b1;
          6'h15: out_r[5] = 1'b1;
          6'h16: out_r[5] = 1'b1;
          6'h17: out_r[5] = 1'b1;
          6'h1c: out_r[5] = 1'b1;
          6'h1e: out_r[5] = 1'b1;
          6'h22: out_r[5] = 1'b1;
          6'h27: out_r[5] = 1'b1;
          6'h2a: out_r[5] = 1'b1;
          6'h2f: out_r[5] = 1'b1;
          6'h3a: out_r[5] = 1'b1;
          6'h3b: out_r[5] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h02: out_r[6] = 1'b1;
          6'h03: out_r[6] = 1'b1;
          6'h0a: out_r[6] = 1'b1;
          6'h0b: out_r[6] = 1'b1;
          6'h0f: out_r[6] = 1'b1;
          6'h12: out_r[6] = 1'b1;
          6'h13: out_r[6] = 1'b1;
          6'h15: out_r[6] = 1'b1;
          6'h17: out_r[6] = 1'b1;
          6'h1c: out_r[6] = 1'b1;
          6'h1d: out_r[6] = 1'b1;
          6'h1e: out_r[6] = 1'b1;
          6'h22: out_r[6] = 1'b1;
          6'h27: out_r[6] = 1'b1;
          6'h2a: out_r[6] = 1'b1;
          6'h2f: out_r[6] = 1'b1;
          6'h35: out_r[6] = 1'b1;
          6'h3a: out_r[6] = 1'b1;
          6'h3b: out_r[6] = 1'b1;
          6'h3c: out_r[6] = 1'b1;
          6'h3d: out_r[6] = 1'b1;
          6'h3e: out_r[6] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h05: out_r[7] = 1'b1;
          6'h07: out_r[7] = 1'b1;
          6'h08: out_r[7] = 1'b1;
          6'h09: out_r[7] = 1'b1;
          6'h0c: out_r[7] = 1'b1;
          6'h0e: out_r[7] = 1'b1;
          6'h0f: out_r[7] = 1'b1;
          6'h15: out_r[7] = 1'b1;
          6'h17: out_r[7] = 1'b1;
          6'h18: out_r[7] = 1'b1;
          6'h19: out_r[7] = 1'b1;
          6'h27: out_r[7] = 1'b1;
          6'h28: out_r[7] = 1'b1;
          6'h29: out_r[7] = 1'b1;
          6'h2b: out_r[7] = 1'b1;
          6'h2c: out_r[7] = 1'b1;
          6'h2e: out_r[7] = 1'b1;
          6'h2f: out_r[7] = 1'b1;
          6'h32: out_r[7] = 1'b1;
          6'h35: out_r[7] = 1'b1;
          6'h38: out_r[7] = 1'b1;
          6'h39: out_r[7] = 1'b1;
          6'h3a: out_r[7] = 1'b1;
          6'h3b: out_r[7] = 1'b1;
          6'h3f: out_r[7] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h02: out_r[8] = 1'b1;
          6'h03: out_r[8] = 1'b1;
          6'h0a: out_r[8] = 1'b1;
          6'h0b: out_r[8] = 1'b1;
          6'h12: out_r[8] = 1'b1;
          6'h13: out_r[8] = 1'b1;
          6'h14: out_r[8] = 1'b1;
          6'h15: out_r[8] = 1'b1;
          6'h16: out_r[8] = 1'b1;
          6'h1a: out_r[8] = 1'b1;
          6'h1b: out_r[8] = 1'b1;
          6'h1c: out_r[8] = 1'b1;
          6'h1d: out_r[8] = 1'b1;
          6'h1e: out_r[8] = 1'b1;
          6'h22: out_r[8] = 1'b1;
          6'h2a: out_r[8] = 1'b1;
          6'h33: out_r[8] = 1'b1;
          6'h34: out_r[8] = 1'b1;
          6'h35: out_r[8] = 1'b1;
          6'h36: out_r[8] = 1'b1;
          6'h37: out_r[8] = 1'b1;
          6'h3b: out_r[8] = 1'b1;
          6'h3c: out_r[8] = 1'b1;
          6'h3d: out_r[8] = 1'b1;
          6'h3e: out_r[8] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h07: out_r[9] = 1'b1;
          6'h10: out_r[9] = 1'b1;
          6'h11: out_r[9] = 1'b1;
          6'h14: out_r[9] = 1'b1;
          6'h15: out_r[9] = 1'b1;
          6'h16: out_r[9] = 1'b1;
          6'h18: out_r[9] = 1'b1;
          6'h19: out_r[9] = 1'b1;
          6'h1c: out_r[9] = 1'b1;
          6'h1d: out_r[9] = 1'b1;
          6'h1e: out_r[9] = 1'b1;
          6'h23: out_r[9] = 1'b1;
          6'h2b: out_r[9] = 1'b1;
          6'h2f: out_r[9] = 1'b1;
          6'h30: out_r[9] = 1'b1;
          6'h31: out_r[9] = 1'b1;
          6'h33: out_r[9] = 1'b1;
          6'h34: out_r[9] = 1'b1;
          6'h35: out_r[9] = 1'b1;
          6'h36: out_r[9] = 1'b1;
          6'h37: out_r[9] = 1'b1;
          6'h38: out_r[9] = 1'b1;
          6'h39: out_r[9] = 1'b1;
          6'h3b: out_r[9] = 1'b1;
          6'h3c: out_r[9] = 1'b1;
          6'h3d: out_r[9] = 1'b1;
          6'h3e: out_r[9] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[10] = 1'b0;
          6'h01: out_r[10] = 1'b0;
          6'h08: out_r[10] = 1'b0;
          6'h09: out_r[10] = 1'b0;
          6'h10: out_r[10] = 1'b0;
          6'h11: out_r[10] = 1'b0;
          6'h18: out_r[10] = 1'b0;
          6'h19: out_r[10] = 1'b0;
          6'h20: out_r[10] = 1'b0;
          6'h21: out_r[10] = 1'b0;
          6'h23: out_r[10] = 1'b0;
          6'h24: out_r[10] = 1'b0;
          6'h25: out_r[10] = 1'b0;
          6'h26: out_r[10] = 1'b0;
          6'h27: out_r[10] = 1'b0;
          6'h28: out_r[10] = 1'b0;
          6'h29: out_r[10] = 1'b0;
          6'h2b: out_r[10] = 1'b0;
          6'h2f: out_r[10] = 1'b0;
          6'h30: out_r[10] = 1'b0;
          6'h31: out_r[10] = 1'b0;
          6'h33: out_r[10] = 1'b0;
          6'h37: out_r[10] = 1'b0;
          6'h38: out_r[10] = 1'b0;
          6'h39: out_r[10] = 1'b0;
          6'h3b: out_r[10] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h04: out_r[11] = 1'b1;
          6'h05: out_r[11] = 1'b1;
          6'h06: out_r[11] = 1'b1;
          6'h0c: out_r[11] = 1'b1;
          6'h0d: out_r[11] = 1'b1;
          6'h0e: out_r[11] = 1'b1;
          6'h0f: out_r[11] = 1'b1;
          6'h14: out_r[11] = 1'b1;
          6'h15: out_r[11] = 1'b1;
          6'h16: out_r[11] = 1'b1;
          6'h1c: out_r[11] = 1'b1;
          6'h1d: out_r[11] = 1'b1;
          6'h1e: out_r[11] = 1'b1;
          6'h20: out_r[11] = 1'b1;
          6'h21: out_r[11] = 1'b1;
          6'h28: out_r[11] = 1'b1;
          6'h29: out_r[11] = 1'b1;
          6'h2c: out_r[11] = 1'b1;
          6'h2d: out_r[11] = 1'b1;
          6'h2e: out_r[11] = 1'b1;
          6'h30: out_r[11] = 1'b1;
          6'h31: out_r[11] = 1'b1;
          6'h34: out_r[11] = 1'b1;
          6'h35: out_r[11] = 1'b1;
          6'h36: out_r[11] = 1'b1;
          6'h38: out_r[11] = 1'b1;
          6'h39: out_r[11] = 1'b1;
          6'h3c: out_r[11] = 1'b1;
          6'h3d: out_r[11] = 1'b1;
          6'h3e: out_r[11] = 1'b1;
          6'h3f: out_r[11] = 1'b1;
          default: begin end
        endcase
      end
      6'h05: begin
        out_r = 12'h501;
        case (inner)
          6'h03: out_r[0] = 1'b0;
          6'h0b: out_r[0] = 1'b0;
          6'h0d: out_r[0] = 1'b0;
          6'h0e: out_r[0] = 1'b0;
          6'h0f: out_r[0] = 1'b0;
          6'h13: out_r[0] = 1'b0;
          6'h15: out_r[0] = 1'b0;
          6'h16: out_r[0] = 1'b0;
          6'h17: out_r[0] = 1'b0;
          6'h1b: out_r[0] = 1'b0;
          6'h20: out_r[0] = 1'b0;
          6'h23: out_r[0] = 1'b0;
          6'h26: out_r[0] = 1'b0;
          6'h2b: out_r[0] = 1'b0;
          6'h2d: out_r[0] = 1'b0;
          6'h2e: out_r[0] = 1'b0;
          6'h2f: out_r[0] = 1'b0;
          6'h33: out_r[0] = 1'b0;
          6'h34: out_r[0] = 1'b0;
          6'h3b: out_r[0] = 1'b0;
          6'h3e: out_r[0] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h01: out_r[1] = 1'b1;
          6'h02: out_r[1] = 1'b1;
          6'h09: out_r[1] = 1'b1;
          6'h0a: out_r[1] = 1'b1;
          6'h0d: out_r[1] = 1'b1;
          6'h0e: out_r[1] = 1'b1;
          6'h0f: out_r[1] = 1'b1;
          6'h11: out_r[1] = 1'b1;
          6'h12: out_r[1] = 1'b1;
          6'h15: out_r[1] = 1'b1;
          6'h16: out_r[1] = 1'b1;
          6'h17: out_r[1] = 1'b1;
          6'h19: out_r[1] = 1'b1;
          6'h1a: out_r[1] = 1'b1;
          6'h20: out_r[1] = 1'b1;
          6'h21: out_r[1] = 1'b1;
          6'h22: out_r[1] = 1'b1;
          6'h26: out_r[1] = 1'b1;
          6'h29: out_r[1] = 1'b1;
          6'h2a: out_r[1] = 1'b1;
          6'h2d: out_r[1] = 1'b1;
          6'h2e: out_r[1] = 1'b1;
          6'h2f: out_r[1] = 1'b1;
          6'h31: out_r[1] = 1'b1;
          6'h32: out_r[1] = 1'b1;
          6'h34: out_r[1] = 1'b1;
          6'h39: out_r[1] = 1'b1;
          6'h3a: out_r[1] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h02: out_r[2] = 1'b1;
          6'h03: out_r[2] = 1'b1;
          6'h0a: out_r[2] = 1'b1;
          6'h0b: out_r[2] = 1'b1;
          6'h0d: out_r[2] = 1'b1;
          6'h0e: out_r[2] = 1'b1;
          6'h0f: out_r[2] = 1'b1;
          6'h12: out_r[2] = 1'b1;
          6'h13: out_r[2] = 1'b1;
          6'h15: out_r[2] = 1'b1;
          6'h16: out_r[2] = 1'b1;
          6'h17: out_r[2] = 1'b1;
          6'h1a: out_r[2] = 1'b1;
          6'h1b: out_r[2] = 1'b1;
          6'h20: out_r[2] = 1'b1;
          6'h22: out_r[2] = 1'b1;
          6'h23: out_r[2] = 1'b1;
          6'h26: out_r[2] = 1'b1;
          6'h2a: out_r[2] = 1'b1;
          6'h2b: out_r[2] = 1'b1;
          6'h2d: out_r[2] = 1'b1;
          6'h2e: out_r[2] = 1'b1;
          6'h2f: out_r[2] = 1'b1;
          6'h32: out_r[2] = 1'b1;
          6'h33: out_r[2] = 1'b1;
          6'h34: out_r[2] = 1'b1;
          6'h3a: out_r[2] = 1'b1;
          6'h3b: out_r[2] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h05: out_r[3] = 1'b1;
          6'h07: out_r[3] = 1'b1;
          6'h0d: out_r[3] = 1'b1;
          6'h0f: out_r[3] = 1'b1;
          6'h15: out_r[3] = 1'b1;
          6'h16: out_r[3] = 1'b1;
          6'h17: out_r[3] = 1'b1;
          6'h20: out_r[3] = 1'b1;
          6'h25: out_r[3] = 1'b1;
          6'h27: out_r[3] = 1'b1;
          6'h2d: out_r[3] = 1'b1;
          6'h2f: out_r[3] = 1'b1;
          6'h34: out_r[3] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[4] = 1'b1;
          6'h02: out_r[4] = 1'b1;
          6'h03: out_r[4] = 1'b1;
          6'h04: out_r[4] = 1'b1;
          6'h08: out_r[4] = 1'b1;
          6'h09: out_r[4] = 1'b1;
          6'h0b: out_r[4] = 1'b1;
          6'h0c: out_r[4] = 1'b1;
          6'h10: out_r[4] = 1'b1;
          6'h12: out_r[4] = 1'b1;
          6'h13: out_r[4] = 1'b1;
          6'h14: out_r[4] = 1'b1;
          6'h18: out_r[4] = 1'b1;
          6'h19: out_r[4] = 1'b1;
          6'h1c: out_r[4] = 1'b1;
          6'h1d: out_r[4] = 1'b1;
          6'h1f: out_r[4] = 1'b1;
          6'h20: out_r[4] = 1'b1;
          6'h23: out_r[4] = 1'b1;
          6'h26: out_r[4] = 1'b1;
          6'h29: out_r[4] = 1'b1;
          6'h2a: out_r[4] = 1'b1;
          6'h2b: out_r[4] = 1'b1;
          6'h31: out_r[4] = 1'b1;
          6'h32: out_r[4] = 1'b1;
          6'h35: out_r[4] = 1'b1;
          6'h36: out_r[4] = 1'b1;
          6'h37: out_r[4] = 1'b1;
          6'h38: out_r[4] = 1'b1;
          6'h39: out_r[4] = 1'b1;
          6'h3b: out_r[4] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h01: out_r[5] = 1'b1;
          6'h04: out_r[5] = 1'b1;
          6'h0a: out_r[5] = 1'b1;
          6'h0c: out_r[5] = 1'b1;
          6'h0e: out_r[5] = 1'b1;
          6'h11: out_r[5] = 1'b1;
          6'h14: out_r[5] = 1'b1;
          6'h15: out_r[5] = 1'b1;
          6'h17: out_r[5] = 1'b1;
          6'h1a: out_r[5] = 1'b1;
          6'h1b: out_r[5] = 1'b1;
          6'h1c: out_r[5] = 1'b1;
          6'h20: out_r[5] = 1'b1;
          6'h21: out_r[5] = 1'b1;
          6'h22: out_r[5] = 1'b1;
          6'h28: out_r[5] = 1'b1;
          6'h2c: out_r[5] = 1'b1;
          6'h2e: out_r[5] = 1'b1;
          6'h30: out_r[5] = 1'b1;
          6'h33: out_r[5] = 1'b1;
          6'h35: out_r[5] = 1'b1;
          6'h36: out_r[5] = 1'b1;
          6'h37: out_r[5] = 1'b1;
          6'h3a: out_r[5] = 1'b1;
          6'h3d: out_r[5] = 1'b1;
          6'h3f: out_r[5] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h01: out_r[6] = 1'b1;
          6'h05: out_r[6] = 1'b1;
          6'h06: out_r[6] = 1'b1;
          6'h07: out_r[6] = 1'b1;
          6'h0a: out_r[6] = 1'b1;
          6'h0e: out_r[6] = 1'b1;
          6'h11: out_r[6] = 1'b1;
          6'h15: out_r[6] = 1'b1;
          6'h16: out_r[6] = 1'b1;
          6'h17: out_r[6] = 1'b1;
          6'h1a: out_r[6] = 1'b1;
          6'h1b: out_r[6] = 1'b1;
          6'h20: out_r[6] = 1'b1;
          6'h21: out_r[6] = 1'b1;
          6'h22: out_r[6] = 1'b1;
          6'h24: out_r[6] = 1'b1;
          6'h25: out_r[6] = 1'b1;
          6'h27: out_r[6] = 1'b1;
          6'h28: out_r[6] = 1'b1;
          6'h2c: out_r[6] = 1'b1;
          6'h2e: out_r[6] = 1'b1;
          6'h30: out_r[6] = 1'b1;
          6'h31: out_r[6] = 1'b1;
          6'h33: out_r[6] = 1'b1;
          6'h34: out_r[6] = 1'b1;
          6'h3a: out_r[6] = 1'b1;
          6'h3b: out_r[6] = 1'b1;
          6'h3d: out_r[6] = 1'b1;
          6'h3f: out_r[6] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h01: out_r[7] = 1'b1;
          6'h03: out_r[7] = 1'b1;
          6'h08: out_r[7] = 1'b1;
          6'h0a: out_r[7] = 1'b1;
          6'h0c: out_r[7] = 1'b1;
          6'h11: out_r[7] = 1'b1;
          6'h12: out_r[7] = 1'b1;
          6'h18: out_r[7] = 1'b1;
          6'h1a: out_r[7] = 1'b1;
          6'h1b: out_r[7] = 1'b1;
          6'h1c: out_r[7] = 1'b1;
          6'h21: out_r[7] = 1'b1;
          6'h22: out_r[7] = 1'b1;
          6'h23: out_r[7] = 1'b1;
          6'h2a: out_r[7] = 1'b1;
          6'h2c: out_r[7] = 1'b1;
          6'h2e: out_r[7] = 1'b1;
          6'h33: out_r[7] = 1'b1;
          6'h35: out_r[7] = 1'b1;
          6'h36: out_r[7] = 1'b1;
          6'h37: out_r[7] = 1'b1;
          6'h3a: out_r[7] = 1'b1;
          6'h3d: out_r[7] = 1'b1;
          6'h3f: out_r[7] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[8] = 1'b0;
          6'h01: out_r[8] = 1'b0;
          6'h04: out_r[8] = 1'b0;
          6'h08: out_r[8] = 1'b0;
          6'h09: out_r[8] = 1'b0;
          6'h0c: out_r[8] = 1'b0;
          6'h10: out_r[8] = 1'b0;
          6'h11: out_r[8] = 1'b0;
          6'h12: out_r[8] = 1'b0;
          6'h13: out_r[8] = 1'b0;
          6'h14: out_r[8] = 1'b0;
          6'h18: out_r[8] = 1'b0;
          6'h19: out_r[8] = 1'b0;
          6'h1a: out_r[8] = 1'b0;
          6'h1b: out_r[8] = 1'b0;
          6'h1c: out_r[8] = 1'b0;
          6'h21: out_r[8] = 1'b0;
          6'h29: out_r[8] = 1'b0;
          6'h35: out_r[8] = 1'b0;
          6'h36: out_r[8] = 1'b0;
          6'h37: out_r[8] = 1'b0;
          6'h3d: out_r[8] = 1'b0;
          6'h3e: out_r[8] = 1'b0;
          6'h3f: out_r[8] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h02: out_r[9] = 1'b1;
          6'h0a: out_r[9] = 1'b1;
          6'h10: out_r[9] = 1'b1;
          6'h11: out_r[9] = 1'b1;
          6'h12: out_r[9] = 1'b1;
          6'h14: out_r[9] = 1'b1;
          6'h18: out_r[9] = 1'b1;
          6'h19: out_r[9] = 1'b1;
          6'h1a: out_r[9] = 1'b1;
          6'h1c: out_r[9] = 1'b1;
          6'h2c: out_r[9] = 1'b1;
          6'h2e: out_r[9] = 1'b1;
          6'h31: out_r[9] = 1'b1;
          6'h32: out_r[9] = 1'b1;
          6'h33: out_r[9] = 1'b1;
          6'h39: out_r[9] = 1'b1;
          6'h3a: out_r[9] = 1'b1;
          6'h3b: out_r[9] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[10] = 1'b0;
          6'h01: out_r[10] = 1'b0;
          6'h04: out_r[10] = 1'b0;
          6'h08: out_r[10] = 1'b0;
          6'h09: out_r[10] = 1'b0;
          6'h0c: out_r[10] = 1'b0;
          6'h10: out_r[10] = 1'b0;
          6'h11: out_r[10] = 1'b0;
          6'h14: out_r[10] = 1'b0;
          6'h18: out_r[10] = 1'b0;
          6'h19: out_r[10] = 1'b0;
          6'h1c: out_r[10] = 1'b0;
          6'h21: out_r[10] = 1'b0;
          6'h29: out_r[10] = 1'b0;
          6'h2e: out_r[10] = 1'b0;
          6'h31: out_r[10] = 1'b0;
          6'h36: out_r[10] = 1'b0;
          6'h39: out_r[10] = 1'b0;
          6'h3e: out_r[10] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h03: out_r[11] = 1'b1;
          6'h0b: out_r[11] = 1'b1;
          6'h13: out_r[11] = 1'b1;
          6'h1b: out_r[11] = 1'b1;
          6'h22: out_r[11] = 1'b1;
          6'h23: out_r[11] = 1'b1;
          6'h26: out_r[11] = 1'b1;
          6'h2a: out_r[11] = 1'b1;
          6'h2b: out_r[11] = 1'b1;
          6'h2e: out_r[11] = 1'b1;
          6'h32: out_r[11] = 1'b1;
          6'h33: out_r[11] = 1'b1;
          6'h3a: out_r[11] = 1'b1;
          6'h3b: out_r[11] = 1'b1;
          default: begin end
        endcase
      end
      6'h06: begin
        out_r = 12'h039;
        case (inner)
          6'h01: out_r[0] = 1'b0;
          6'h02: out_r[0] = 1'b0;
          6'h03: out_r[0] = 1'b0;
          6'h05: out_r[0] = 1'b0;
          6'h09: out_r[0] = 1'b0;
          6'h0a: out_r[0] = 1'b0;
          6'h0b: out_r[0] = 1'b0;
          6'h0d: out_r[0] = 1'b0;
          6'h10: out_r[0] = 1'b0;
          6'h12: out_r[0] = 1'b0;
          6'h13: out_r[0] = 1'b0;
          6'h15: out_r[0] = 1'b0;
          6'h18: out_r[0] = 1'b0;
          6'h19: out_r[0] = 1'b0;
          6'h1d: out_r[0] = 1'b0;
          6'h22: out_r[0] = 1'b0;
          6'h23: out_r[0] = 1'b0;
          6'h25: out_r[0] = 1'b0;
          6'h2a: out_r[0] = 1'b0;
          6'h2b: out_r[0] = 1'b0;
          6'h2c: out_r[0] = 1'b0;
          6'h2d: out_r[0] = 1'b0;
          6'h2e: out_r[0] = 1'b0;
          6'h2f: out_r[0] = 1'b0;
          6'h30: out_r[0] = 1'b0;
          6'h31: out_r[0] = 1'b0;
          6'h35: out_r[0] = 1'b0;
          6'h38: out_r[0] = 1'b0;
          6'h39: out_r[0] = 1'b0;
          6'h3b: out_r[0] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[1] = 1'b1;
          6'h08: out_r[1] = 1'b1;
          6'h11: out_r[1] = 1'b1;
          6'h12: out_r[1] = 1'b1;
          6'h13: out_r[1] = 1'b1;
          6'h20: out_r[1] = 1'b1;
          6'h28: out_r[1] = 1'b1;
          6'h29: out_r[1] = 1'b1;
          6'h2a: out_r[1] = 1'b1;
          6'h2b: out_r[1] = 1'b1;
          6'h31: out_r[1] = 1'b1;
          6'h32: out_r[1] = 1'b1;
          6'h3f: out_r[1] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[2] = 1'b1;
          6'h09: out_r[2] = 1'b1;
          6'h1a: out_r[2] = 1'b1;
          6'h1b: out_r[2] = 1'b1;
          6'h20: out_r[2] = 1'b1;
          6'h21: out_r[2] = 1'b1;
          6'h22: out_r[2] = 1'b1;
          6'h23: out_r[2] = 1'b1;
          6'h24: out_r[2] = 1'b1;
          6'h25: out_r[2] = 1'b1;
          6'h26: out_r[2] = 1'b1;
          6'h27: out_r[2] = 1'b1;
          6'h28: out_r[2] = 1'b1;
          6'h29: out_r[2] = 1'b1;
          6'h30: out_r[2] = 1'b1;
          6'h32: out_r[2] = 1'b1;
          6'h33: out_r[2] = 1'b1;
          6'h34: out_r[2] = 1'b1;
          6'h35: out_r[2] = 1'b1;
          6'h36: out_r[2] = 1'b1;
          6'h37: out_r[2] = 1'b1;
          6'h38: out_r[2] = 1'b1;
          6'h3a: out_r[2] = 1'b1;
          6'h3c: out_r[2] = 1'b1;
          6'h3d: out_r[2] = 1'b1;
          6'h3e: out_r[2] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h24: out_r[3] = 1'b0;
          6'h25: out_r[3] = 1'b0;
          6'h26: out_r[3] = 1'b0;
          6'h27: out_r[3] = 1'b0;
          6'h2c: out_r[3] = 1'b0;
          6'h2e: out_r[3] = 1'b0;
          6'h2f: out_r[3] = 1'b0;
          6'h34: out_r[3] = 1'b0;
          6'h35: out_r[3] = 1'b0;
          6'h36: out_r[3] = 1'b0;
          6'h3c: out_r[3] = 1'b0;
          6'h3e: out_r[3] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h01: out_r[4] = 1'b0;
          6'h02: out_r[4] = 1'b0;
          6'h03: out_r[4] = 1'b0;
          6'h0a: out_r[4] = 1'b0;
          6'h0b: out_r[4] = 1'b0;
          6'h19: out_r[4] = 1'b0;
          6'h1a: out_r[4] = 1'b0;
          6'h1b: out_r[4] = 1'b0;
          6'h21: out_r[4] = 1'b0;
          6'h22: out_r[4] = 1'b0;
          6'h23: out_r[4] = 1'b0;
          6'h24: out_r[4] = 1'b0;
          6'h25: out_r[4] = 1'b0;
          6'h26: out_r[4] = 1'b0;
          6'h27: out_r[4] = 1'b0;
          6'h28: out_r[4] = 1'b0;
          6'h2c: out_r[4] = 1'b0;
          6'h30: out_r[4] = 1'b0;
          6'h32: out_r[4] = 1'b0;
          6'h33: out_r[4] = 1'b0;
          6'h34: out_r[4] = 1'b0;
          6'h36: out_r[4] = 1'b0;
          6'h39: out_r[4] = 1'b0;
          6'h3b: out_r[4] = 1'b0;
          6'h3c: out_r[4] = 1'b0;
          6'h3d: out_r[4] = 1'b0;
          6'h3e: out_r[4] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[5] = 1'b0;
          6'h08: out_r[5] = 1'b0;
          6'h09: out_r[5] = 1'b0;
          6'h10: out_r[5] = 1'b0;
          6'h11: out_r[5] = 1'b0;
          6'h12: out_r[5] = 1'b0;
          6'h13: out_r[5] = 1'b0;
          6'h18: out_r[5] = 1'b0;
          6'h20: out_r[5] = 1'b0;
          6'h24: out_r[5] = 1'b0;
          6'h25: out_r[5] = 1'b0;
          6'h26: out_r[5] = 1'b0;
          6'h27: out_r[5] = 1'b0;
          6'h29: out_r[5] = 1'b0;
          6'h2a: out_r[5] = 1'b0;
          6'h2b: out_r[5] = 1'b0;
          6'h2d: out_r[5] = 1'b0;
          6'h31: out_r[5] = 1'b0;
          6'h34: out_r[5] = 1'b0;
          6'h35: out_r[5] = 1'b0;
          6'h36: out_r[5] = 1'b0;
          6'h37: out_r[5] = 1'b0;
          6'h38: out_r[5] = 1'b0;
          6'h3a: out_r[5] = 1'b0;
          6'h3c: out_r[5] = 1'b0;
          6'h3e: out_r[5] = 1'b0;
          6'h3f: out_r[5] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[6] = 1'b1;
          6'h01: out_r[6] = 1'b1;
          6'h02: out_r[6] = 1'b1;
          6'h03: out_r[6] = 1'b1;
          6'h09: out_r[6] = 1'b1;
          6'h0a: out_r[6] = 1'b1;
          6'h0b: out_r[6] = 1'b1;
          6'h18: out_r[6] = 1'b1;
          6'h19: out_r[6] = 1'b1;
          6'h1a: out_r[6] = 1'b1;
          6'h1b: out_r[6] = 1'b1;
          6'h21: out_r[6] = 1'b1;
          6'h22: out_r[6] = 1'b1;
          6'h23: out_r[6] = 1'b1;
          6'h24: out_r[6] = 1'b1;
          6'h26: out_r[6] = 1'b1;
          6'h27: out_r[6] = 1'b1;
          6'h28: out_r[6] = 1'b1;
          6'h29: out_r[6] = 1'b1;
          6'h2a: out_r[6] = 1'b1;
          6'h2b: out_r[6] = 1'b1;
          6'h2c: out_r[6] = 1'b1;
          6'h2e: out_r[6] = 1'b1;
          6'h2f: out_r[6] = 1'b1;
          6'h30: out_r[6] = 1'b1;
          6'h32: out_r[6] = 1'b1;
          6'h33: out_r[6] = 1'b1;
          6'h34: out_r[6] = 1'b1;
          6'h36: out_r[6] = 1'b1;
          6'h39: out_r[6] = 1'b1;
          6'h3b: out_r[6] = 1'b1;
          6'h3d: out_r[6] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h01: out_r[7] = 1'b1;
          6'h02: out_r[7] = 1'b1;
          6'h03: out_r[7] = 1'b1;
          6'h0a: out_r[7] = 1'b1;
          6'h0b: out_r[7] = 1'b1;
          6'h0c: out_r[7] = 1'b1;
          6'h0d: out_r[7] = 1'b1;
          6'h0e: out_r[7] = 1'b1;
          6'h0f: out_r[7] = 1'b1;
          6'h11: out_r[7] = 1'b1;
          6'h19: out_r[7] = 1'b1;
          6'h1a: out_r[7] = 1'b1;
          6'h1b: out_r[7] = 1'b1;
          6'h1c: out_r[7] = 1'b1;
          6'h1d: out_r[7] = 1'b1;
          6'h1e: out_r[7] = 1'b1;
          6'h1f: out_r[7] = 1'b1;
          6'h21: out_r[7] = 1'b1;
          6'h22: out_r[7] = 1'b1;
          6'h23: out_r[7] = 1'b1;
          6'h25: out_r[7] = 1'b1;
          6'h28: out_r[7] = 1'b1;
          6'h30: out_r[7] = 1'b1;
          6'h32: out_r[7] = 1'b1;
          6'h33: out_r[7] = 1'b1;
          6'h38: out_r[7] = 1'b1;
          6'h39: out_r[7] = 1'b1;
          6'h3a: out_r[7] = 1'b1;
          6'h3b: out_r[7] = 1'b1;
          6'h3d: out_r[7] = 1'b1;
          6'h3f: out_r[7] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[8] = 1'b1;
          6'h08: out_r[8] = 1'b1;
          6'h09: out_r[8] = 1'b1;
          6'h0a: out_r[8] = 1'b1;
          6'h0b: out_r[8] = 1'b1;
          6'h12: out_r[8] = 1'b1;
          6'h13: out_r[8] = 1'b1;
          6'h18: out_r[8] = 1'b1;
          6'h19: out_r[8] = 1'b1;
          6'h1a: out_r[8] = 1'b1;
          6'h1b: out_r[8] = 1'b1;
          6'h20: out_r[8] = 1'b1;
          6'h21: out_r[8] = 1'b1;
          6'h22: out_r[8] = 1'b1;
          6'h23: out_r[8] = 1'b1;
          6'h24: out_r[8] = 1'b1;
          6'h25: out_r[8] = 1'b1;
          6'h26: out_r[8] = 1'b1;
          6'h27: out_r[8] = 1'b1;
          6'h28: out_r[8] = 1'b1;
          6'h29: out_r[8] = 1'b1;
          6'h2a: out_r[8] = 1'b1;
          6'h2b: out_r[8] = 1'b1;
          6'h2c: out_r[8] = 1'b1;
          6'h2d: out_r[8] = 1'b1;
          6'h2e: out_r[8] = 1'b1;
          6'h2f: out_r[8] = 1'b1;
          6'h34: out_r[8] = 1'b1;
          6'h36: out_r[8] = 1'b1;
          6'h3c: out_r[8] = 1'b1;
          6'h3d: out_r[8] = 1'b1;
          6'h3e: out_r[8] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[9] = 1'b1;
          6'h08: out_r[9] = 1'b1;
          6'h09: out_r[9] = 1'b1;
          6'h0a: out_r[9] = 1'b1;
          6'h0b: out_r[9] = 1'b1;
          6'h11: out_r[9] = 1'b1;
          6'h12: out_r[9] = 1'b1;
          6'h13: out_r[9] = 1'b1;
          6'h14: out_r[9] = 1'b1;
          6'h15: out_r[9] = 1'b1;
          6'h16: out_r[9] = 1'b1;
          6'h17: out_r[9] = 1'b1;
          6'h18: out_r[9] = 1'b1;
          6'h1c: out_r[9] = 1'b1;
          6'h1d: out_r[9] = 1'b1;
          6'h1e: out_r[9] = 1'b1;
          6'h1f: out_r[9] = 1'b1;
          6'h20: out_r[9] = 1'b1;
          6'h21: out_r[9] = 1'b1;
          6'h22: out_r[9] = 1'b1;
          6'h23: out_r[9] = 1'b1;
          6'h28: out_r[9] = 1'b1;
          6'h29: out_r[9] = 1'b1;
          6'h2a: out_r[9] = 1'b1;
          6'h2b: out_r[9] = 1'b1;
          6'h2e: out_r[9] = 1'b1;
          6'h2f: out_r[9] = 1'b1;
          6'h33: out_r[9] = 1'b1;
          6'h37: out_r[9] = 1'b1;
          6'h3f: out_r[9] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[10] = 1'b1;
          6'h08: out_r[10] = 1'b1;
          6'h10: out_r[10] = 1'b1;
          6'h11: out_r[10] = 1'b1;
          6'h12: out_r[10] = 1'b1;
          6'h13: out_r[10] = 1'b1;
          6'h18: out_r[10] = 1'b1;
          6'h19: out_r[10] = 1'b1;
          6'h1a: out_r[10] = 1'b1;
          6'h1b: out_r[10] = 1'b1;
          6'h21: out_r[10] = 1'b1;
          6'h24: out_r[10] = 1'b1;
          6'h25: out_r[10] = 1'b1;
          6'h26: out_r[10] = 1'b1;
          6'h27: out_r[10] = 1'b1;
          6'h29: out_r[10] = 1'b1;
          6'h2c: out_r[10] = 1'b1;
          6'h2d: out_r[10] = 1'b1;
          6'h2e: out_r[10] = 1'b1;
          6'h2f: out_r[10] = 1'b1;
          6'h31: out_r[10] = 1'b1;
          6'h32: out_r[10] = 1'b1;
          6'h34: out_r[10] = 1'b1;
          6'h35: out_r[10] = 1'b1;
          6'h36: out_r[10] = 1'b1;
          6'h3c: out_r[10] = 1'b1;
          6'h3d: out_r[10] = 1'b1;
          6'h3e: out_r[10] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[11] = 1'b1;
          6'h05: out_r[11] = 1'b1;
          6'h0d: out_r[11] = 1'b1;
          6'h10: out_r[11] = 1'b1;
          6'h12: out_r[11] = 1'b1;
          6'h13: out_r[11] = 1'b1;
          6'h15: out_r[11] = 1'b1;
          6'h18: out_r[11] = 1'b1;
          6'h19: out_r[11] = 1'b1;
          6'h1a: out_r[11] = 1'b1;
          6'h1b: out_r[11] = 1'b1;
          6'h1d: out_r[11] = 1'b1;
          6'h21: out_r[11] = 1'b1;
          6'h22: out_r[11] = 1'b1;
          6'h23: out_r[11] = 1'b1;
          6'h25: out_r[11] = 1'b1;
          6'h2a: out_r[11] = 1'b1;
          6'h2b: out_r[11] = 1'b1;
          6'h2c: out_r[11] = 1'b1;
          6'h2d: out_r[11] = 1'b1;
          6'h2e: out_r[11] = 1'b1;
          6'h2f: out_r[11] = 1'b1;
          6'h30: out_r[11] = 1'b1;
          6'h31: out_r[11] = 1'b1;
          6'h32: out_r[11] = 1'b1;
          6'h33: out_r[11] = 1'b1;
          6'h35: out_r[11] = 1'b1;
          6'h3d: out_r[11] = 1'b1;
          default: begin end
        endcase
      end
      6'h07: begin
        out_r = 12'h43a;
        case (inner)
          6'h06: out_r[0] = 1'b1;
          6'h0a: out_r[0] = 1'b1;
          6'h0b: out_r[0] = 1'b1;
          6'h0e: out_r[0] = 1'b1;
          6'h11: out_r[0] = 1'b1;
          6'h12: out_r[0] = 1'b1;
          6'h15: out_r[0] = 1'b1;
          6'h16: out_r[0] = 1'b1;
          6'h1a: out_r[0] = 1'b1;
          6'h1b: out_r[0] = 1'b1;
          6'h1d: out_r[0] = 1'b1;
          6'h1e: out_r[0] = 1'b1;
          6'h24: out_r[0] = 1'b1;
          6'h28: out_r[0] = 1'b1;
          6'h2a: out_r[0] = 1'b1;
          6'h2b: out_r[0] = 1'b1;
          6'h30: out_r[0] = 1'b1;
          6'h31: out_r[0] = 1'b1;
          6'h32: out_r[0] = 1'b1;
          6'h35: out_r[0] = 1'b1;
          6'h38: out_r[0] = 1'b1;
          6'h39: out_r[0] = 1'b1;
          6'h3a: out_r[0] = 1'b1;
          6'h3d: out_r[0] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h07: out_r[1] = 1'b0;
          6'h0a: out_r[1] = 1'b0;
          6'h0b: out_r[1] = 1'b0;
          6'h0e: out_r[1] = 1'b0;
          6'h0f: out_r[1] = 1'b0;
          6'h12: out_r[1] = 1'b0;
          6'h16: out_r[1] = 1'b0;
          6'h17: out_r[1] = 1'b0;
          6'h1a: out_r[1] = 1'b0;
          6'h1b: out_r[1] = 1'b0;
          6'h1d: out_r[1] = 1'b0;
          6'h1e: out_r[1] = 1'b0;
          6'h1f: out_r[1] = 1'b0;
          6'h27: out_r[1] = 1'b0;
          6'h28: out_r[1] = 1'b0;
          6'h2a: out_r[1] = 1'b0;
          6'h2b: out_r[1] = 1'b0;
          6'h2f: out_r[1] = 1'b0;
          6'h37: out_r[1] = 1'b0;
          6'h39: out_r[1] = 1'b0;
          6'h3a: out_r[1] = 1'b0;
          6'h3d: out_r[1] = 1'b0;
          6'h3f: out_r[1] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[2] = 1'b1;
          6'h01: out_r[2] = 1'b1;
          6'h02: out_r[2] = 1'b1;
          6'h03: out_r[2] = 1'b1;
          6'h08: out_r[2] = 1'b1;
          6'h09: out_r[2] = 1'b1;
          6'h10: out_r[2] = 1'b1;
          6'h11: out_r[2] = 1'b1;
          6'h13: out_r[2] = 1'b1;
          6'h18: out_r[2] = 1'b1;
          6'h20: out_r[2] = 1'b1;
          6'h21: out_r[2] = 1'b1;
          6'h22: out_r[2] = 1'b1;
          6'h23: out_r[2] = 1'b1;
          6'h29: out_r[2] = 1'b1;
          6'h2c: out_r[2] = 1'b1;
          6'h2e: out_r[2] = 1'b1;
          6'h30: out_r[2] = 1'b1;
          6'h31: out_r[2] = 1'b1;
          6'h33: out_r[2] = 1'b1;
          6'h36: out_r[2] = 1'b1;
          6'h3b: out_r[2] = 1'b1;
          6'h3e: out_r[2] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h03: out_r[3] = 1'b0;
          6'h11: out_r[3] = 1'b0;
          6'h1d: out_r[3] = 1'b0;
          6'h23: out_r[3] = 1'b0;
          6'h2c: out_r[3] = 1'b0;
          6'h30: out_r[3] = 1'b0;
          6'h31: out_r[3] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h03: out_r[4] = 1'b0;
          6'h0e: out_r[4] = 1'b0;
          6'h11: out_r[4] = 1'b0;
          6'h15: out_r[4] = 1'b0;
          6'h16: out_r[4] = 1'b0;
          6'h23: out_r[4] = 1'b0;
          6'h24: out_r[4] = 1'b0;
          6'h26: out_r[4] = 1'b0;
          6'h2c: out_r[4] = 1'b0;
          6'h30: out_r[4] = 1'b0;
          6'h31: out_r[4] = 1'b0;
          6'h35: out_r[4] = 1'b0;
          6'h36: out_r[4] = 1'b0;
          6'h3a: out_r[4] = 1'b0;
          6'h3d: out_r[4] = 1'b0;
          6'h3f: out_r[4] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[5] = 1'b0;
          6'h01: out_r[5] = 1'b0;
          6'h02: out_r[5] = 1'b0;
          6'h08: out_r[5] = 1'b0;
          6'h09: out_r[5] = 1'b0;
          6'h0a: out_r[5] = 1'b0;
          6'h0b: out_r[5] = 1'b0;
          6'h10: out_r[5] = 1'b0;
          6'h12: out_r[5] = 1'b0;
          6'h13: out_r[5] = 1'b0;
          6'h18: out_r[5] = 1'b0;
          6'h1a: out_r[5] = 1'b0;
          6'h1b: out_r[5] = 1'b0;
          6'h1d: out_r[5] = 1'b0;
          6'h1e: out_r[5] = 1'b0;
          6'h20: out_r[5] = 1'b0;
          6'h21: out_r[5] = 1'b0;
          6'h22: out_r[5] = 1'b0;
          6'h28: out_r[5] = 1'b0;
          6'h29: out_r[5] = 1'b0;
          6'h2a: out_r[5] = 1'b0;
          6'h2b: out_r[5] = 1'b0;
          6'h2c: out_r[5] = 1'b0;
          6'h2e: out_r[5] = 1'b0;
          6'h33: out_r[5] = 1'b0;
          6'h39: out_r[5] = 1'b0;
          6'h3b: out_r[5] = 1'b0;
          6'h3c: out_r[5] = 1'b0;
          6'h3e: out_r[5] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h03: out_r[6] = 1'b1;
          6'h06: out_r[6] = 1'b1;
          6'h0e: out_r[6] = 1'b1;
          6'h11: out_r[6] = 1'b1;
          6'h15: out_r[6] = 1'b1;
          6'h16: out_r[6] = 1'b1;
          6'h19: out_r[6] = 1'b1;
          6'h23: out_r[6] = 1'b1;
          6'h24: out_r[6] = 1'b1;
          6'h26: out_r[6] = 1'b1;
          6'h30: out_r[6] = 1'b1;
          6'h31: out_r[6] = 1'b1;
          6'h32: out_r[6] = 1'b1;
          6'h35: out_r[6] = 1'b1;
          6'h36: out_r[6] = 1'b1;
          6'h38: out_r[6] = 1'b1;
          6'h3a: out_r[6] = 1'b1;
          6'h3d: out_r[6] = 1'b1;
          6'h3f: out_r[6] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h02: out_r[7] = 1'b1;
          6'h08: out_r[7] = 1'b1;
          6'h09: out_r[7] = 1'b1;
          6'h0c: out_r[7] = 1'b1;
          6'h0d: out_r[7] = 1'b1;
          6'h0e: out_r[7] = 1'b1;
          6'h0f: out_r[7] = 1'b1;
          6'h13: out_r[7] = 1'b1;
          6'h15: out_r[7] = 1'b1;
          6'h16: out_r[7] = 1'b1;
          6'h18: out_r[7] = 1'b1;
          6'h1c: out_r[7] = 1'b1;
          6'h1f: out_r[7] = 1'b1;
          6'h20: out_r[7] = 1'b1;
          6'h22: out_r[7] = 1'b1;
          6'h24: out_r[7] = 1'b1;
          6'h26: out_r[7] = 1'b1;
          6'h29: out_r[7] = 1'b1;
          6'h2c: out_r[7] = 1'b1;
          6'h2d: out_r[7] = 1'b1;
          6'h2f: out_r[7] = 1'b1;
          6'h33: out_r[7] = 1'b1;
          6'h34: out_r[7] = 1'b1;
          6'h35: out_r[7] = 1'b1;
          6'h36: out_r[7] = 1'b1;
          6'h3c: out_r[7] = 1'b1;
          6'h3d: out_r[7] = 1'b1;
          6'h3e: out_r[7] = 1'b1;
          6'h3f: out_r[7] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h03: out_r[8] = 1'b1;
          6'h06: out_r[8] = 1'b1;
          6'h0b: out_r[8] = 1'b1;
          6'h0e: out_r[8] = 1'b1;
          6'h11: out_r[8] = 1'b1;
          6'h12: out_r[8] = 1'b1;
          6'h19: out_r[8] = 1'b1;
          6'h1a: out_r[8] = 1'b1;
          6'h1d: out_r[8] = 1'b1;
          6'h1e: out_r[8] = 1'b1;
          6'h23: out_r[8] = 1'b1;
          6'h2b: out_r[8] = 1'b1;
          6'h2e: out_r[8] = 1'b1;
          6'h30: out_r[8] = 1'b1;
          6'h31: out_r[8] = 1'b1;
          6'h32: out_r[8] = 1'b1;
          6'h36: out_r[8] = 1'b1;
          6'h38: out_r[8] = 1'b1;
          6'h39: out_r[8] = 1'b1;
          6'h3a: out_r[8] = 1'b1;
          6'h3b: out_r[8] = 1'b1;
          6'h3c: out_r[8] = 1'b1;
          6'h3d: out_r[8] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h06: out_r[9] = 1'b1;
          6'h0e: out_r[9] = 1'b1;
          6'h10: out_r[9] = 1'b1;
          6'h14: out_r[9] = 1'b1;
          6'h15: out_r[9] = 1'b1;
          6'h17: out_r[9] = 1'b1;
          6'h18: out_r[9] = 1'b1;
          6'h1c: out_r[9] = 1'b1;
          6'h1d: out_r[9] = 1'b1;
          6'h1f: out_r[9] = 1'b1;
          6'h24: out_r[9] = 1'b1;
          6'h35: out_r[9] = 1'b1;
          6'h36: out_r[9] = 1'b1;
          6'h37: out_r[9] = 1'b1;
          6'h3d: out_r[9] = 1'b1;
          6'h3f: out_r[9] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[10] = 1'b0;
          6'h04: out_r[10] = 1'b0;
          6'h05: out_r[10] = 1'b0;
          6'h07: out_r[10] = 1'b0;
          6'h08: out_r[10] = 1'b0;
          6'h0c: out_r[10] = 1'b0;
          6'h0d: out_r[10] = 1'b0;
          6'h0f: out_r[10] = 1'b0;
          6'h10: out_r[10] = 1'b0;
          6'h14: out_r[10] = 1'b0;
          6'h16: out_r[10] = 1'b0;
          6'h17: out_r[10] = 1'b0;
          6'h18: out_r[10] = 1'b0;
          6'h1c: out_r[10] = 1'b0;
          6'h1d: out_r[10] = 1'b0;
          6'h1f: out_r[10] = 1'b0;
          6'h25: out_r[10] = 1'b0;
          6'h26: out_r[10] = 1'b0;
          6'h27: out_r[10] = 1'b0;
          6'h2d: out_r[10] = 1'b0;
          6'h2f: out_r[10] = 1'b0;
          6'h34: out_r[10] = 1'b0;
          6'h36: out_r[10] = 1'b0;
          6'h37: out_r[10] = 1'b0;
          6'h3d: out_r[10] = 1'b0;
          6'h3f: out_r[10] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h05: out_r[11] = 1'b1;
          6'h06: out_r[11] = 1'b1;
          6'h07: out_r[11] = 1'b1;
          6'h0d: out_r[11] = 1'b1;
          6'h0f: out_r[11] = 1'b1;
          6'h11: out_r[11] = 1'b1;
          6'h16: out_r[11] = 1'b1;
          6'h17: out_r[11] = 1'b1;
          6'h1f: out_r[11] = 1'b1;
          6'h25: out_r[11] = 1'b1;
          6'h26: out_r[11] = 1'b1;
          6'h27: out_r[11] = 1'b1;
          6'h2c: out_r[11] = 1'b1;
          6'h2d: out_r[11] = 1'b1;
          6'h2f: out_r[11] = 1'b1;
          6'h30: out_r[11] = 1'b1;
          6'h31: out_r[11] = 1'b1;
          6'h34: out_r[11] = 1'b1;
          6'h37: out_r[11] = 1'b1;
          6'h3c: out_r[11] = 1'b1;
          6'h3f: out_r[11] = 1'b1;
          default: begin end
        endcase
      end
      6'h08: begin
        out_r = 12'h041;
        case (inner)
          6'h00: out_r[0] = 1'b0;
          6'h01: out_r[0] = 1'b0;
          6'h02: out_r[0] = 1'b0;
          6'h03: out_r[0] = 1'b0;
          6'h07: out_r[0] = 1'b0;
          6'h09: out_r[0] = 1'b0;
          6'h0b: out_r[0] = 1'b0;
          6'h0d: out_r[0] = 1'b0;
          6'h0f: out_r[0] = 1'b0;
          6'h10: out_r[0] = 1'b0;
          6'h11: out_r[0] = 1'b0;
          6'h12: out_r[0] = 1'b0;
          6'h13: out_r[0] = 1'b0;
          6'h17: out_r[0] = 1'b0;
          6'h1f: out_r[0] = 1'b0;
          6'h20: out_r[0] = 1'b0;
          6'h21: out_r[0] = 1'b0;
          6'h22: out_r[0] = 1'b0;
          6'h23: out_r[0] = 1'b0;
          6'h27: out_r[0] = 1'b0;
          6'h2f: out_r[0] = 1'b0;
          6'h30: out_r[0] = 1'b0;
          6'h31: out_r[0] = 1'b0;
          6'h32: out_r[0] = 1'b0;
          6'h33: out_r[0] = 1'b0;
          6'h37: out_r[0] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h01: out_r[1] = 1'b1;
          6'h03: out_r[1] = 1'b1;
          6'h08: out_r[1] = 1'b1;
          6'h0a: out_r[1] = 1'b1;
          6'h0c: out_r[1] = 1'b1;
          6'h11: out_r[1] = 1'b1;
          6'h13: out_r[1] = 1'b1;
          6'h18: out_r[1] = 1'b1;
          6'h19: out_r[1] = 1'b1;
          6'h1a: out_r[1] = 1'b1;
          6'h1b: out_r[1] = 1'b1;
          6'h1c: out_r[1] = 1'b1;
          6'h1d: out_r[1] = 1'b1;
          6'h1e: out_r[1] = 1'b1;
          6'h21: out_r[1] = 1'b1;
          6'h23: out_r[1] = 1'b1;
          6'h28: out_r[1] = 1'b1;
          6'h29: out_r[1] = 1'b1;
          6'h2a: out_r[1] = 1'b1;
          6'h2b: out_r[1] = 1'b1;
          6'h2c: out_r[1] = 1'b1;
          6'h2d: out_r[1] = 1'b1;
          6'h31: out_r[1] = 1'b1;
          6'h33: out_r[1] = 1'b1;
          6'h38: out_r[1] = 1'b1;
          6'h39: out_r[1] = 1'b1;
          6'h3a: out_r[1] = 1'b1;
          6'h3b: out_r[1] = 1'b1;
          6'h3c: out_r[1] = 1'b1;
          6'h3d: out_r[1] = 1'b1;
          6'h3f: out_r[1] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h04: out_r[2] = 1'b1;
          6'h05: out_r[2] = 1'b1;
          6'h06: out_r[2] = 1'b1;
          6'h07: out_r[2] = 1'b1;
          6'h0e: out_r[2] = 1'b1;
          6'h0f: out_r[2] = 1'b1;
          6'h14: out_r[2] = 1'b1;
          6'h15: out_r[2] = 1'b1;
          6'h16: out_r[2] = 1'b1;
          6'h17: out_r[2] = 1'b1;
          6'h1e: out_r[2] = 1'b1;
          6'h1f: out_r[2] = 1'b1;
          6'h24: out_r[2] = 1'b1;
          6'h25: out_r[2] = 1'b1;
          6'h26: out_r[2] = 1'b1;
          6'h27: out_r[2] = 1'b1;
          6'h2e: out_r[2] = 1'b1;
          6'h2f: out_r[2] = 1'b1;
          6'h34: out_r[2] = 1'b1;
          6'h35: out_r[2] = 1'b1;
          6'h36: out_r[2] = 1'b1;
          6'h37: out_r[2] = 1'b1;
          6'h3e: out_r[2] = 1'b1;
          6'h3f: out_r[2] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h02: out_r[3] = 1'b1;
          6'h03: out_r[3] = 1'b1;
          6'h0a: out_r[3] = 1'b1;
          6'h0e: out_r[3] = 1'b1;
          6'h0f: out_r[3] = 1'b1;
          6'h12: out_r[3] = 1'b1;
          6'h13: out_r[3] = 1'b1;
          6'h15: out_r[3] = 1'b1;
          6'h16: out_r[3] = 1'b1;
          6'h19: out_r[3] = 1'b1;
          6'h1a: out_r[3] = 1'b1;
          6'h1b: out_r[3] = 1'b1;
          6'h1d: out_r[3] = 1'b1;
          6'h1e: out_r[3] = 1'b1;
          6'h1f: out_r[3] = 1'b1;
          6'h22: out_r[3] = 1'b1;
          6'h23: out_r[3] = 1'b1;
          6'h26: out_r[3] = 1'b1;
          6'h29: out_r[3] = 1'b1;
          6'h2a: out_r[3] = 1'b1;
          6'h2b: out_r[3] = 1'b1;
          6'h2d: out_r[3] = 1'b1;
          6'h2e: out_r[3] = 1'b1;
          6'h2f: out_r[3] = 1'b1;
          6'h32: out_r[3] = 1'b1;
          6'h33: out_r[3] = 1'b1;
          6'h3e: out_r[3] = 1'b1;
          6'h3f: out_r[3] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h04: out_r[4] = 1'b1;
          6'h05: out_r[4] = 1'b1;
          6'h06: out_r[4] = 1'b1;
          6'h07: out_r[4] = 1'b1;
          6'h0f: out_r[4] = 1'b1;
          6'h14: out_r[4] = 1'b1;
          6'h15: out_r[4] = 1'b1;
          6'h16: out_r[4] = 1'b1;
          6'h17: out_r[4] = 1'b1;
          6'h1e: out_r[4] = 1'b1;
          6'h1f: out_r[4] = 1'b1;
          6'h24: out_r[4] = 1'b1;
          6'h25: out_r[4] = 1'b1;
          6'h26: out_r[4] = 1'b1;
          6'h27: out_r[4] = 1'b1;
          6'h34: out_r[4] = 1'b1;
          6'h35: out_r[4] = 1'b1;
          6'h36: out_r[4] = 1'b1;
          6'h37: out_r[4] = 1'b1;
          6'h39: out_r[4] = 1'b1;
          6'h3a: out_r[4] = 1'b1;
          6'h3b: out_r[4] = 1'b1;
          6'h3d: out_r[4] = 1'b1;
          6'h3f: out_r[4] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h05: out_r[5] = 1'b1;
          6'h06: out_r[5] = 1'b1;
          6'h0f: out_r[5] = 1'b1;
          6'h14: out_r[5] = 1'b1;
          6'h15: out_r[5] = 1'b1;
          6'h16: out_r[5] = 1'b1;
          6'h1e: out_r[5] = 1'b1;
          6'h1f: out_r[5] = 1'b1;
          6'h24: out_r[5] = 1'b1;
          6'h26: out_r[5] = 1'b1;
          6'h29: out_r[5] = 1'b1;
          6'h2b: out_r[5] = 1'b1;
          6'h2d: out_r[5] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h05: out_r[6] = 1'b0;
          6'h06: out_r[6] = 1'b0;
          6'h09: out_r[6] = 1'b0;
          6'h0b: out_r[6] = 1'b0;
          6'h0d: out_r[6] = 1'b0;
          6'h0f: out_r[6] = 1'b0;
          6'h14: out_r[6] = 1'b0;
          6'h19: out_r[6] = 1'b0;
          6'h1a: out_r[6] = 1'b0;
          6'h1d: out_r[6] = 1'b0;
          6'h1e: out_r[6] = 1'b0;
          6'h1f: out_r[6] = 1'b0;
          6'h24: out_r[6] = 1'b0;
          6'h29: out_r[6] = 1'b0;
          6'h2b: out_r[6] = 1'b0;
          6'h2d: out_r[6] = 1'b0;
          6'h2e: out_r[6] = 1'b0;
          6'h35: out_r[6] = 1'b0;
          6'h37: out_r[6] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h04: out_r[7] = 1'b1;
          6'h05: out_r[7] = 1'b1;
          6'h06: out_r[7] = 1'b1;
          6'h08: out_r[7] = 1'b1;
          6'h0a: out_r[7] = 1'b1;
          6'h0c: out_r[7] = 1'b1;
          6'h0e: out_r[7] = 1'b1;
          6'h0f: out_r[7] = 1'b1;
          6'h14: out_r[7] = 1'b1;
          6'h15: out_r[7] = 1'b1;
          6'h16: out_r[7] = 1'b1;
          6'h18: out_r[7] = 1'b1;
          6'h1c: out_r[7] = 1'b1;
          6'h1e: out_r[7] = 1'b1;
          6'h1f: out_r[7] = 1'b1;
          6'h24: out_r[7] = 1'b1;
          6'h26: out_r[7] = 1'b1;
          6'h28: out_r[7] = 1'b1;
          6'h2a: out_r[7] = 1'b1;
          6'h2c: out_r[7] = 1'b1;
          6'h2e: out_r[7] = 1'b1;
          6'h35: out_r[7] = 1'b1;
          6'h37: out_r[7] = 1'b1;
          6'h38: out_r[7] = 1'b1;
          6'h3c: out_r[7] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h04: out_r[8] = 1'b1;
          6'h05: out_r[8] = 1'b1;
          6'h06: out_r[8] = 1'b1;
          6'h0f: out_r[8] = 1'b1;
          6'h14: out_r[8] = 1'b1;
          6'h15: out_r[8] = 1'b1;
          6'h16: out_r[8] = 1'b1;
          6'h1e: out_r[8] = 1'b1;
          6'h1f: out_r[8] = 1'b1;
          6'h24: out_r[8] = 1'b1;
          6'h26: out_r[8] = 1'b1;
          6'h2a: out_r[8] = 1'b1;
          6'h2b: out_r[8] = 1'b1;
          6'h2e: out_r[8] = 1'b1;
          6'h35: out_r[8] = 1'b1;
          6'h37: out_r[8] = 1'b1;
          6'h38: out_r[8] = 1'b1;
          6'h39: out_r[8] = 1'b1;
          6'h3a: out_r[8] = 1'b1;
          6'h3b: out_r[8] = 1'b1;
          6'h3c: out_r[8] = 1'b1;
          6'h3d: out_r[8] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h0a: out_r[9] = 1'b1;
          6'h0e: out_r[9] = 1'b1;
          6'h0f: out_r[9] = 1'b1;
          6'h10: out_r[9] = 1'b1;
          6'h11: out_r[9] = 1'b1;
          6'h12: out_r[9] = 1'b1;
          6'h13: out_r[9] = 1'b1;
          6'h17: out_r[9] = 1'b1;
          6'h18: out_r[9] = 1'b1;
          6'h19: out_r[9] = 1'b1;
          6'h1c: out_r[9] = 1'b1;
          6'h1d: out_r[9] = 1'b1;
          6'h1e: out_r[9] = 1'b1;
          6'h1f: out_r[9] = 1'b1;
          6'h25: out_r[9] = 1'b1;
          6'h2a: out_r[9] = 1'b1;
          6'h2b: out_r[9] = 1'b1;
          6'h2e: out_r[9] = 1'b1;
          6'h30: out_r[9] = 1'b1;
          6'h31: out_r[9] = 1'b1;
          6'h32: out_r[9] = 1'b1;
          6'h33: out_r[9] = 1'b1;
          6'h35: out_r[9] = 1'b1;
          6'h37: out_r[9] = 1'b1;
          6'h3f: out_r[9] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h04: out_r[10] = 1'b1;
          6'h05: out_r[10] = 1'b1;
          6'h06: out_r[10] = 1'b1;
          6'h14: out_r[10] = 1'b1;
          6'h15: out_r[10] = 1'b1;
          6'h16: out_r[10] = 1'b1;
          6'h24: out_r[10] = 1'b1;
          6'h26: out_r[10] = 1'b1;
          6'h27: out_r[10] = 1'b1;
          6'h28: out_r[10] = 1'b1;
          6'h29: out_r[10] = 1'b1;
          6'h2a: out_r[10] = 1'b1;
          6'h2b: out_r[10] = 1'b1;
          6'h2c: out_r[10] = 1'b1;
          6'h2d: out_r[10] = 1'b1;
          6'h2f: out_r[10] = 1'b1;
          6'h34: out_r[10] = 1'b1;
          6'h36: out_r[10] = 1'b1;
          6'h37: out_r[10] = 1'b1;
          6'h38: out_r[10] = 1'b1;
          6'h39: out_r[10] = 1'b1;
          6'h3a: out_r[10] = 1'b1;
          6'h3b: out_r[10] = 1'b1;
          6'h3c: out_r[10] = 1'b1;
          6'h3d: out_r[10] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h07: out_r[11] = 1'b1;
          6'h0e: out_r[11] = 1'b1;
          6'h17: out_r[11] = 1'b1;
          6'h1f: out_r[11] = 1'b1;
          6'h20: out_r[11] = 1'b1;
          6'h21: out_r[11] = 1'b1;
          6'h22: out_r[11] = 1'b1;
          6'h23: out_r[11] = 1'b1;
          6'h27: out_r[11] = 1'b1;
          6'h28: out_r[11] = 1'b1;
          6'h29: out_r[11] = 1'b1;
          6'h2a: out_r[11] = 1'b1;
          6'h2b: out_r[11] = 1'b1;
          6'h2c: out_r[11] = 1'b1;
          6'h2d: out_r[11] = 1'b1;
          6'h2f: out_r[11] = 1'b1;
          6'h30: out_r[11] = 1'b1;
          6'h31: out_r[11] = 1'b1;
          6'h32: out_r[11] = 1'b1;
          6'h33: out_r[11] = 1'b1;
          6'h37: out_r[11] = 1'b1;
          6'h38: out_r[11] = 1'b1;
          6'h39: out_r[11] = 1'b1;
          6'h3a: out_r[11] = 1'b1;
          6'h3b: out_r[11] = 1'b1;
          6'h3c: out_r[11] = 1'b1;
          6'h3d: out_r[11] = 1'b1;
          default: begin end
        endcase
      end
      6'h09: begin
        out_r = 12'h041;
        case (inner)
          6'h05: out_r[0] = 1'b0;
          6'h06: out_r[0] = 1'b0;
          6'h07: out_r[0] = 1'b0;
          6'h09: out_r[0] = 1'b0;
          6'h0d: out_r[0] = 1'b0;
          6'h15: out_r[0] = 1'b0;
          6'h16: out_r[0] = 1'b0;
          6'h17: out_r[0] = 1'b0;
          6'h1b: out_r[0] = 1'b0;
          6'h1e: out_r[0] = 1'b0;
          6'h1f: out_r[0] = 1'b0;
          6'h20: out_r[0] = 1'b0;
          6'h24: out_r[0] = 1'b0;
          6'h25: out_r[0] = 1'b0;
          6'h27: out_r[0] = 1'b0;
          6'h29: out_r[0] = 1'b0;
          6'h2d: out_r[0] = 1'b0;
          6'h30: out_r[0] = 1'b0;
          6'h33: out_r[0] = 1'b0;
          6'h36: out_r[0] = 1'b0;
          6'h38: out_r[0] = 1'b0;
          6'h39: out_r[0] = 1'b0;
          6'h3b: out_r[0] = 1'b0;
          6'h3c: out_r[0] = 1'b0;
          6'h3d: out_r[0] = 1'b0;
          6'h3f: out_r[0] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h01: out_r[1] = 1'b1;
          6'h03: out_r[1] = 1'b1;
          6'h04: out_r[1] = 1'b1;
          6'h06: out_r[1] = 1'b1;
          6'h0f: out_r[1] = 1'b1;
          6'h11: out_r[1] = 1'b1;
          6'h13: out_r[1] = 1'b1;
          6'h14: out_r[1] = 1'b1;
          6'h16: out_r[1] = 1'b1;
          6'h17: out_r[1] = 1'b1;
          6'h19: out_r[1] = 1'b1;
          6'h1d: out_r[1] = 1'b1;
          6'h1e: out_r[1] = 1'b1;
          6'h1f: out_r[1] = 1'b1;
          6'h20: out_r[1] = 1'b1;
          6'h21: out_r[1] = 1'b1;
          6'h23: out_r[1] = 1'b1;
          6'h2f: out_r[1] = 1'b1;
          6'h30: out_r[1] = 1'b1;
          6'h33: out_r[1] = 1'b1;
          6'h39: out_r[1] = 1'b1;
          6'h3d: out_r[1] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h04: out_r[2] = 1'b1;
          6'h05: out_r[2] = 1'b1;
          6'h06: out_r[2] = 1'b1;
          6'h07: out_r[2] = 1'b1;
          6'h0f: out_r[2] = 1'b1;
          6'h14: out_r[2] = 1'b1;
          6'h15: out_r[2] = 1'b1;
          6'h16: out_r[2] = 1'b1;
          6'h17: out_r[2] = 1'b1;
          6'h1e: out_r[2] = 1'b1;
          6'h1f: out_r[2] = 1'b1;
          6'h20: out_r[2] = 1'b1;
          6'h25: out_r[2] = 1'b1;
          6'h27: out_r[2] = 1'b1;
          6'h2f: out_r[2] = 1'b1;
          6'h30: out_r[2] = 1'b1;
          6'h33: out_r[2] = 1'b1;
          6'h37: out_r[2] = 1'b1;
          6'h39: out_r[2] = 1'b1;
          6'h3d: out_r[2] = 1'b1;
          6'h3e: out_r[2] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h02: out_r[3] = 1'b1;
          6'h03: out_r[3] = 1'b1;
          6'h07: out_r[3] = 1'b1;
          6'h0a: out_r[3] = 1'b1;
          6'h0b: out_r[3] = 1'b1;
          6'h12: out_r[3] = 1'b1;
          6'h13: out_r[3] = 1'b1;
          6'h19: out_r[3] = 1'b1;
          6'h1a: out_r[3] = 1'b1;
          6'h1d: out_r[3] = 1'b1;
          6'h1f: out_r[3] = 1'b1;
          6'h20: out_r[3] = 1'b1;
          6'h22: out_r[3] = 1'b1;
          6'h23: out_r[3] = 1'b1;
          6'h27: out_r[3] = 1'b1;
          6'h28: out_r[3] = 1'b1;
          6'h2b: out_r[3] = 1'b1;
          6'h2c: out_r[3] = 1'b1;
          6'h30: out_r[3] = 1'b1;
          6'h32: out_r[3] = 1'b1;
          6'h39: out_r[3] = 1'b1;
          6'h3b: out_r[3] = 1'b1;
          6'h3d: out_r[3] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h04: out_r[4] = 1'b1;
          6'h05: out_r[4] = 1'b1;
          6'h06: out_r[4] = 1'b1;
          6'h07: out_r[4] = 1'b1;
          6'h0e: out_r[4] = 1'b1;
          6'h0f: out_r[4] = 1'b1;
          6'h14: out_r[4] = 1'b1;
          6'h15: out_r[4] = 1'b1;
          6'h16: out_r[4] = 1'b1;
          6'h17: out_r[4] = 1'b1;
          6'h1e: out_r[4] = 1'b1;
          6'h25: out_r[4] = 1'b1;
          6'h26: out_r[4] = 1'b1;
          6'h27: out_r[4] = 1'b1;
          6'h2e: out_r[4] = 1'b1;
          6'h2f: out_r[4] = 1'b1;
          6'h31: out_r[4] = 1'b1;
          6'h33: out_r[4] = 1'b1;
          6'h35: out_r[4] = 1'b1;
          6'h37: out_r[4] = 1'b1;
          6'h39: out_r[4] = 1'b1;
          6'h3a: out_r[4] = 1'b1;
          6'h3d: out_r[4] = 1'b1;
          6'h3e: out_r[4] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h07: out_r[5] = 1'b1;
          6'h27: out_r[5] = 1'b1;
          6'h28: out_r[5] = 1'b1;
          6'h2a: out_r[5] = 1'b1;
          6'h2c: out_r[5] = 1'b1;
          6'h30: out_r[5] = 1'b1;
          6'h32: out_r[5] = 1'b1;
          6'h33: out_r[5] = 1'b1;
          6'h38: out_r[5] = 1'b1;
          6'h39: out_r[5] = 1'b1;
          6'h3a: out_r[5] = 1'b1;
          6'h3c: out_r[5] = 1'b1;
          6'h3d: out_r[5] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h04: out_r[6] = 1'b0;
          6'h06: out_r[6] = 1'b0;
          6'h07: out_r[6] = 1'b0;
          6'h09: out_r[6] = 1'b0;
          6'h0d: out_r[6] = 1'b0;
          6'h0f: out_r[6] = 1'b0;
          6'h1b: out_r[6] = 1'b0;
          6'h1e: out_r[6] = 1'b0;
          6'h1f: out_r[6] = 1'b0;
          6'h24: out_r[6] = 1'b0;
          6'h27: out_r[6] = 1'b0;
          6'h28: out_r[6] = 1'b0;
          6'h29: out_r[6] = 1'b0;
          6'h2a: out_r[6] = 1'b0;
          6'h2c: out_r[6] = 1'b0;
          6'h2d: out_r[6] = 1'b0;
          6'h2f: out_r[6] = 1'b0;
          6'h30: out_r[6] = 1'b0;
          6'h32: out_r[6] = 1'b0;
          6'h33: out_r[6] = 1'b0;
          6'h36: out_r[6] = 1'b0;
          6'h38: out_r[6] = 1'b0;
          6'h3a: out_r[6] = 1'b0;
          6'h3b: out_r[6] = 1'b0;
          6'h3c: out_r[6] = 1'b0;
          6'h3f: out_r[6] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h04: out_r[7] = 1'b1;
          6'h06: out_r[7] = 1'b1;
          6'h08: out_r[7] = 1'b1;
          6'h0a: out_r[7] = 1'b1;
          6'h0b: out_r[7] = 1'b1;
          6'h0c: out_r[7] = 1'b1;
          6'h0f: out_r[7] = 1'b1;
          6'h18: out_r[7] = 1'b1;
          6'h1a: out_r[7] = 1'b1;
          6'h1c: out_r[7] = 1'b1;
          6'h1e: out_r[7] = 1'b1;
          6'h20: out_r[7] = 1'b1;
          6'h22: out_r[7] = 1'b1;
          6'h2b: out_r[7] = 1'b1;
          6'h2f: out_r[7] = 1'b1;
          6'h30: out_r[7] = 1'b1;
          6'h32: out_r[7] = 1'b1;
          6'h33: out_r[7] = 1'b1;
          6'h39: out_r[7] = 1'b1;
          6'h3a: out_r[7] = 1'b1;
          6'h3b: out_r[7] = 1'b1;
          6'h3d: out_r[7] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h04: out_r[8] = 1'b1;
          6'h06: out_r[8] = 1'b1;
          6'h0f: out_r[8] = 1'b1;
          6'h1e: out_r[8] = 1'b1;
          6'h20: out_r[8] = 1'b1;
          6'h22: out_r[8] = 1'b1;
          6'h28: out_r[8] = 1'b1;
          6'h2a: out_r[8] = 1'b1;
          6'h2c: out_r[8] = 1'b1;
          6'h2f: out_r[8] = 1'b1;
          6'h30: out_r[8] = 1'b1;
          6'h32: out_r[8] = 1'b1;
          6'h33: out_r[8] = 1'b1;
          6'h37: out_r[8] = 1'b1;
          6'h38: out_r[8] = 1'b1;
          6'h39: out_r[8] = 1'b1;
          6'h3a: out_r[8] = 1'b1;
          6'h3b: out_r[8] = 1'b1;
          6'h3c: out_r[8] = 1'b1;
          6'h3d: out_r[8] = 1'b1;
          6'h3e: out_r[8] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h04: out_r[9] = 1'b1;
          6'h05: out_r[9] = 1'b1;
          6'h06: out_r[9] = 1'b1;
          6'h0b: out_r[9] = 1'b1;
          6'h0f: out_r[9] = 1'b1;
          6'h10: out_r[9] = 1'b1;
          6'h11: out_r[9] = 1'b1;
          6'h12: out_r[9] = 1'b1;
          6'h13: out_r[9] = 1'b1;
          6'h14: out_r[9] = 1'b1;
          6'h16: out_r[9] = 1'b1;
          6'h18: out_r[9] = 1'b1;
          6'h19: out_r[9] = 1'b1;
          6'h1a: out_r[9] = 1'b1;
          6'h1c: out_r[9] = 1'b1;
          6'h1d: out_r[9] = 1'b1;
          6'h1f: out_r[9] = 1'b1;
          6'h25: out_r[9] = 1'b1;
          6'h2b: out_r[9] = 1'b1;
          6'h2f: out_r[9] = 1'b1;
          6'h38: out_r[9] = 1'b1;
          6'h3b: out_r[9] = 1'b1;
          6'h3c: out_r[9] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h0e: out_r[10] = 1'b1;
          6'h0f: out_r[10] = 1'b1;
          6'h17: out_r[10] = 1'b1;
          6'h1e: out_r[10] = 1'b1;
          6'h20: out_r[10] = 1'b1;
          6'h22: out_r[10] = 1'b1;
          6'h28: out_r[10] = 1'b1;
          6'h2a: out_r[10] = 1'b1;
          6'h2c: out_r[10] = 1'b1;
          6'h2e: out_r[10] = 1'b1;
          6'h2f: out_r[10] = 1'b1;
          6'h30: out_r[10] = 1'b1;
          6'h31: out_r[10] = 1'b1;
          6'h32: out_r[10] = 1'b1;
          6'h33: out_r[10] = 1'b1;
          6'h34: out_r[10] = 1'b1;
          6'h35: out_r[10] = 1'b1;
          6'h37: out_r[10] = 1'b1;
          6'h38: out_r[10] = 1'b1;
          6'h39: out_r[10] = 1'b1;
          6'h3a: out_r[10] = 1'b1;
          6'h3c: out_r[10] = 1'b1;
          6'h3d: out_r[10] = 1'b1;
          6'h3e: out_r[10] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h05: out_r[11] = 1'b1;
          6'h06: out_r[11] = 1'b1;
          6'h07: out_r[11] = 1'b1;
          6'h0f: out_r[11] = 1'b1;
          6'h15: out_r[11] = 1'b1;
          6'h16: out_r[11] = 1'b1;
          6'h17: out_r[11] = 1'b1;
          6'h1e: out_r[11] = 1'b1;
          6'h25: out_r[11] = 1'b1;
          6'h27: out_r[11] = 1'b1;
          6'h2f: out_r[11] = 1'b1;
          6'h38: out_r[11] = 1'b1;
          6'h3c: out_r[11] = 1'b1;
          default: begin end
        endcase
      end
      6'h0a: begin
        out_r = 12'h405;
        case (inner)
          6'h00: out_r[0] = 1'b0;
          6'h02: out_r[0] = 1'b0;
          6'h03: out_r[0] = 1'b0;
          6'h08: out_r[0] = 1'b0;
          6'h10: out_r[0] = 1'b0;
          6'h12: out_r[0] = 1'b0;
          6'h13: out_r[0] = 1'b0;
          6'h18: out_r[0] = 1'b0;
          6'h1d: out_r[0] = 1'b0;
          6'h20: out_r[0] = 1'b0;
          6'h22: out_r[0] = 1'b0;
          6'h23: out_r[0] = 1'b0;
          6'h28: out_r[0] = 1'b0;
          6'h2d: out_r[0] = 1'b0;
          6'h30: out_r[0] = 1'b0;
          6'h32: out_r[0] = 1'b0;
          6'h33: out_r[0] = 1'b0;
          6'h38: out_r[0] = 1'b0;
          6'h3d: out_r[0] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h05: out_r[1] = 1'b1;
          6'h06: out_r[1] = 1'b1;
          6'h07: out_r[1] = 1'b1;
          6'h0d: out_r[1] = 1'b1;
          6'h15: out_r[1] = 1'b1;
          6'h16: out_r[1] = 1'b1;
          6'h17: out_r[1] = 1'b1;
          6'h1d: out_r[1] = 1'b1;
          6'h25: out_r[1] = 1'b1;
          6'h26: out_r[1] = 1'b1;
          6'h27: out_r[1] = 1'b1;
          6'h35: out_r[1] = 1'b1;
          6'h36: out_r[1] = 1'b1;
          6'h37: out_r[1] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h01: out_r[2] = 1'b0;
          6'h06: out_r[2] = 1'b0;
          6'h07: out_r[2] = 1'b0;
          6'h0d: out_r[2] = 1'b0;
          6'h16: out_r[2] = 1'b0;
          6'h17: out_r[2] = 1'b0;
          6'h1a: out_r[2] = 1'b0;
          6'h1b: out_r[2] = 1'b0;
          6'h1c: out_r[2] = 1'b0;
          6'h1d: out_r[2] = 1'b0;
          6'h1e: out_r[2] = 1'b0;
          6'h1f: out_r[2] = 1'b0;
          6'h26: out_r[2] = 1'b0;
          6'h27: out_r[2] = 1'b0;
          6'h29: out_r[2] = 1'b0;
          6'h2a: out_r[2] = 1'b0;
          6'h2c: out_r[2] = 1'b0;
          6'h2e: out_r[2] = 1'b0;
          6'h36: out_r[2] = 1'b0;
          6'h37: out_r[2] = 1'b0;
          6'h3d: out_r[2] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h01: out_r[3] = 1'b1;
          6'h02: out_r[3] = 1'b1;
          6'h03: out_r[3] = 1'b1;
          6'h04: out_r[3] = 1'b1;
          6'h05: out_r[3] = 1'b1;
          6'h0d: out_r[3] = 1'b1;
          6'h12: out_r[3] = 1'b1;
          6'h13: out_r[3] = 1'b1;
          6'h14: out_r[3] = 1'b1;
          6'h15: out_r[3] = 1'b1;
          6'h1a: out_r[3] = 1'b1;
          6'h1b: out_r[3] = 1'b1;
          6'h1c: out_r[3] = 1'b1;
          6'h1d: out_r[3] = 1'b1;
          6'h1e: out_r[3] = 1'b1;
          6'h1f: out_r[3] = 1'b1;
          6'h22: out_r[3] = 1'b1;
          6'h23: out_r[3] = 1'b1;
          6'h24: out_r[3] = 1'b1;
          6'h25: out_r[3] = 1'b1;
          6'h29: out_r[3] = 1'b1;
          6'h2a: out_r[3] = 1'b1;
          6'h2c: out_r[3] = 1'b1;
          6'h2e: out_r[3] = 1'b1;
          6'h32: out_r[3] = 1'b1;
          6'h33: out_r[3] = 1'b1;
          6'h34: out_r[3] = 1'b1;
          6'h35: out_r[3] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h01: out_r[4] = 1'b1;
          6'h04: out_r[4] = 1'b1;
          6'h05: out_r[4] = 1'b1;
          6'h06: out_r[4] = 1'b1;
          6'h07: out_r[4] = 1'b1;
          6'h0d: out_r[4] = 1'b1;
          6'h14: out_r[4] = 1'b1;
          6'h15: out_r[4] = 1'b1;
          6'h16: out_r[4] = 1'b1;
          6'h17: out_r[4] = 1'b1;
          6'h1a: out_r[4] = 1'b1;
          6'h1b: out_r[4] = 1'b1;
          6'h1c: out_r[4] = 1'b1;
          6'h1d: out_r[4] = 1'b1;
          6'h1e: out_r[4] = 1'b1;
          6'h1f: out_r[4] = 1'b1;
          6'h24: out_r[4] = 1'b1;
          6'h25: out_r[4] = 1'b1;
          6'h26: out_r[4] = 1'b1;
          6'h27: out_r[4] = 1'b1;
          6'h29: out_r[4] = 1'b1;
          6'h2a: out_r[4] = 1'b1;
          6'h2c: out_r[4] = 1'b1;
          6'h2e: out_r[4] = 1'b1;
          6'h34: out_r[4] = 1'b1;
          6'h35: out_r[4] = 1'b1;
          6'h36: out_r[4] = 1'b1;
          6'h37: out_r[4] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h01: out_r[5] = 1'b1;
          6'h0a: out_r[5] = 1'b1;
          6'h0b: out_r[5] = 1'b1;
          6'h0e: out_r[5] = 1'b1;
          6'h0f: out_r[5] = 1'b1;
          6'h1a: out_r[5] = 1'b1;
          6'h1b: out_r[5] = 1'b1;
          6'h1e: out_r[5] = 1'b1;
          6'h1f: out_r[5] = 1'b1;
          6'h29: out_r[5] = 1'b1;
          6'h2a: out_r[5] = 1'b1;
          6'h2c: out_r[5] = 1'b1;
          6'h2e: out_r[5] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[6] = 1'b1;
          6'h01: out_r[6] = 1'b1;
          6'h04: out_r[6] = 1'b1;
          6'h06: out_r[6] = 1'b1;
          6'h07: out_r[6] = 1'b1;
          6'h08: out_r[6] = 1'b1;
          6'h0d: out_r[6] = 1'b1;
          6'h10: out_r[6] = 1'b1;
          6'h12: out_r[6] = 1'b1;
          6'h13: out_r[6] = 1'b1;
          6'h15: out_r[6] = 1'b1;
          6'h16: out_r[6] = 1'b1;
          6'h17: out_r[6] = 1'b1;
          6'h18: out_r[6] = 1'b1;
          6'h20: out_r[6] = 1'b1;
          6'h23: out_r[6] = 1'b1;
          6'h24: out_r[6] = 1'b1;
          6'h25: out_r[6] = 1'b1;
          6'h26: out_r[6] = 1'b1;
          6'h28: out_r[6] = 1'b1;
          6'h2b: out_r[6] = 1'b1;
          6'h2d: out_r[6] = 1'b1;
          6'h2f: out_r[6] = 1'b1;
          6'h30: out_r[6] = 1'b1;
          6'h31: out_r[6] = 1'b1;
          6'h32: out_r[6] = 1'b1;
          6'h33: out_r[6] = 1'b1;
          6'h37: out_r[6] = 1'b1;
          6'h38: out_r[6] = 1'b1;
          6'h3a: out_r[6] = 1'b1;
          6'h3e: out_r[6] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h01: out_r[7] = 1'b1;
          6'h02: out_r[7] = 1'b1;
          6'h03: out_r[7] = 1'b1;
          6'h05: out_r[7] = 1'b1;
          6'h08: out_r[7] = 1'b1;
          6'h11: out_r[7] = 1'b1;
          6'h14: out_r[7] = 1'b1;
          6'h18: out_r[7] = 1'b1;
          6'h19: out_r[7] = 1'b1;
          6'h1c: out_r[7] = 1'b1;
          6'h1d: out_r[7] = 1'b1;
          6'h21: out_r[7] = 1'b1;
          6'h22: out_r[7] = 1'b1;
          6'h27: out_r[7] = 1'b1;
          6'h28: out_r[7] = 1'b1;
          6'h2a: out_r[7] = 1'b1;
          6'h2b: out_r[7] = 1'b1;
          6'h2d: out_r[7] = 1'b1;
          6'h2e: out_r[7] = 1'b1;
          6'h2f: out_r[7] = 1'b1;
          6'h34: out_r[7] = 1'b1;
          6'h35: out_r[7] = 1'b1;
          6'h36: out_r[7] = 1'b1;
          6'h38: out_r[7] = 1'b1;
          6'h3b: out_r[7] = 1'b1;
          6'h3f: out_r[7] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h01: out_r[8] = 1'b1;
          6'h02: out_r[8] = 1'b1;
          6'h03: out_r[8] = 1'b1;
          6'h05: out_r[8] = 1'b1;
          6'h09: out_r[8] = 1'b1;
          6'h0a: out_r[8] = 1'b1;
          6'h0b: out_r[8] = 1'b1;
          6'h0c: out_r[8] = 1'b1;
          6'h0e: out_r[8] = 1'b1;
          6'h0f: out_r[8] = 1'b1;
          6'h11: out_r[8] = 1'b1;
          6'h14: out_r[8] = 1'b1;
          6'h19: out_r[8] = 1'b1;
          6'h1c: out_r[8] = 1'b1;
          6'h1d: out_r[8] = 1'b1;
          6'h21: out_r[8] = 1'b1;
          6'h22: out_r[8] = 1'b1;
          6'h23: out_r[8] = 1'b1;
          6'h27: out_r[8] = 1'b1;
          6'h29: out_r[8] = 1'b1;
          6'h2a: out_r[8] = 1'b1;
          6'h2c: out_r[8] = 1'b1;
          6'h2e: out_r[8] = 1'b1;
          6'h34: out_r[8] = 1'b1;
          6'h35: out_r[8] = 1'b1;
          6'h36: out_r[8] = 1'b1;
          6'h37: out_r[8] = 1'b1;
          6'h3b: out_r[8] = 1'b1;
          6'h3f: out_r[8] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h02: out_r[9] = 1'b1;
          6'h03: out_r[9] = 1'b1;
          6'h05: out_r[9] = 1'b1;
          6'h06: out_r[9] = 1'b1;
          6'h07: out_r[9] = 1'b1;
          6'h10: out_r[9] = 1'b1;
          6'h14: out_r[9] = 1'b1;
          6'h15: out_r[9] = 1'b1;
          6'h18: out_r[9] = 1'b1;
          6'h19: out_r[9] = 1'b1;
          6'h1d: out_r[9] = 1'b1;
          6'h22: out_r[9] = 1'b1;
          6'h24: out_r[9] = 1'b1;
          6'h27: out_r[9] = 1'b1;
          6'h2b: out_r[9] = 1'b1;
          6'h2d: out_r[9] = 1'b1;
          6'h2f: out_r[9] = 1'b1;
          6'h30: out_r[9] = 1'b1;
          6'h34: out_r[9] = 1'b1;
          6'h35: out_r[9] = 1'b1;
          6'h36: out_r[9] = 1'b1;
          6'h38: out_r[9] = 1'b1;
          6'h3b: out_r[9] = 1'b1;
          6'h3f: out_r[9] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[10] = 1'b0;
          6'h02: out_r[10] = 1'b0;
          6'h03: out_r[10] = 1'b0;
          6'h08: out_r[10] = 1'b0;
          6'h10: out_r[10] = 1'b0;
          6'h12: out_r[10] = 1'b0;
          6'h13: out_r[10] = 1'b0;
          6'h18: out_r[10] = 1'b0;
          6'h20: out_r[10] = 1'b0;
          6'h22: out_r[10] = 1'b0;
          6'h24: out_r[10] = 1'b0;
          6'h26: out_r[10] = 1'b0;
          6'h28: out_r[10] = 1'b0;
          6'h2b: out_r[10] = 1'b0;
          6'h2d: out_r[10] = 1'b0;
          6'h2f: out_r[10] = 1'b0;
          6'h30: out_r[10] = 1'b0;
          6'h32: out_r[10] = 1'b0;
          6'h34: out_r[10] = 1'b0;
          6'h36: out_r[10] = 1'b0;
          6'h38: out_r[10] = 1'b0;
          6'h3b: out_r[10] = 1'b0;
          6'h3d: out_r[10] = 1'b0;
          6'h3f: out_r[10] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h04: out_r[11] = 1'b1;
          6'h14: out_r[11] = 1'b1;
          6'h19: out_r[11] = 1'b1;
          6'h1d: out_r[11] = 1'b1;
          6'h20: out_r[11] = 1'b1;
          6'h22: out_r[11] = 1'b1;
          6'h23: out_r[11] = 1'b1;
          6'h24: out_r[11] = 1'b1;
          6'h25: out_r[11] = 1'b1;
          6'h27: out_r[11] = 1'b1;
          6'h28: out_r[11] = 1'b1;
          6'h30: out_r[11] = 1'b1;
          6'h32: out_r[11] = 1'b1;
          6'h33: out_r[11] = 1'b1;
          6'h34: out_r[11] = 1'b1;
          6'h35: out_r[11] = 1'b1;
          6'h37: out_r[11] = 1'b1;
          6'h38: out_r[11] = 1'b1;
          default: begin end
        endcase
      end
      6'h0b: begin
        out_r = 12'h046;
        case (inner)
          6'h00: out_r[0] = 1'b1;
          6'h01: out_r[0] = 1'b1;
          6'h07: out_r[0] = 1'b1;
          6'h08: out_r[0] = 1'b1;
          6'h09: out_r[0] = 1'b1;
          6'h0c: out_r[0] = 1'b1;
          6'h0d: out_r[0] = 1'b1;
          6'h10: out_r[0] = 1'b1;
          6'h11: out_r[0] = 1'b1;
          6'h1b: out_r[0] = 1'b1;
          6'h1c: out_r[0] = 1'b1;
          6'h1f: out_r[0] = 1'b1;
          6'h20: out_r[0] = 1'b1;
          6'h21: out_r[0] = 1'b1;
          6'h27: out_r[0] = 1'b1;
          6'h29: out_r[0] = 1'b1;
          6'h2c: out_r[0] = 1'b1;
          6'h2d: out_r[0] = 1'b1;
          6'h30: out_r[0] = 1'b1;
          6'h31: out_r[0] = 1'b1;
          6'h39: out_r[0] = 1'b1;
          6'h3c: out_r[0] = 1'b1;
          6'h3d: out_r[0] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h06: out_r[1] = 1'b0;
          6'h0a: out_r[1] = 1'b0;
          6'h0e: out_r[1] = 1'b0;
          6'h16: out_r[1] = 1'b0;
          6'h1a: out_r[1] = 1'b0;
          6'h1b: out_r[1] = 1'b0;
          6'h1e: out_r[1] = 1'b0;
          6'h1f: out_r[1] = 1'b0;
          6'h26: out_r[1] = 1'b0;
          6'h2a: out_r[1] = 1'b0;
          6'h2c: out_r[1] = 1'b0;
          6'h2e: out_r[1] = 1'b0;
          6'h36: out_r[1] = 1'b0;
          6'h37: out_r[1] = 1'b0;
          6'h39: out_r[1] = 1'b0;
          6'h3a: out_r[1] = 1'b0;
          6'h3c: out_r[1] = 1'b0;
          6'h3d: out_r[1] = 1'b0;
          6'h3e: out_r[1] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h06: out_r[2] = 1'b0;
          6'h09: out_r[2] = 1'b0;
          6'h0b: out_r[2] = 1'b0;
          6'h0f: out_r[2] = 1'b0;
          6'h12: out_r[2] = 1'b0;
          6'h16: out_r[2] = 1'b0;
          6'h1b: out_r[2] = 1'b0;
          6'h1c: out_r[2] = 1'b0;
          6'h1d: out_r[2] = 1'b0;
          6'h1f: out_r[2] = 1'b0;
          6'h26: out_r[2] = 1'b0;
          6'h29: out_r[2] = 1'b0;
          6'h2b: out_r[2] = 1'b0;
          6'h2c: out_r[2] = 1'b0;
          6'h2f: out_r[2] = 1'b0;
          6'h36: out_r[2] = 1'b0;
          6'h39: out_r[2] = 1'b0;
          6'h3a: out_r[2] = 1'b0;
          6'h3c: out_r[2] = 1'b0;
          6'h3d: out_r[2] = 1'b0;
          6'h3e: out_r[2] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h02: out_r[3] = 1'b1;
          6'h03: out_r[3] = 1'b1;
          6'h04: out_r[3] = 1'b1;
          6'h05: out_r[3] = 1'b1;
          6'h09: out_r[3] = 1'b1;
          6'h0b: out_r[3] = 1'b1;
          6'h0f: out_r[3] = 1'b1;
          6'h12: out_r[3] = 1'b1;
          6'h14: out_r[3] = 1'b1;
          6'h15: out_r[3] = 1'b1;
          6'h18: out_r[3] = 1'b1;
          6'h1b: out_r[3] = 1'b1;
          6'h1c: out_r[3] = 1'b1;
          6'h1d: out_r[3] = 1'b1;
          6'h1f: out_r[3] = 1'b1;
          6'h22: out_r[3] = 1'b1;
          6'h23: out_r[3] = 1'b1;
          6'h24: out_r[3] = 1'b1;
          6'h25: out_r[3] = 1'b1;
          6'h29: out_r[3] = 1'b1;
          6'h2b: out_r[3] = 1'b1;
          6'h2f: out_r[3] = 1'b1;
          6'h32: out_r[3] = 1'b1;
          6'h34: out_r[3] = 1'b1;
          6'h35: out_r[3] = 1'b1;
          6'h38: out_r[3] = 1'b1;
          6'h39: out_r[3] = 1'b1;
          6'h3a: out_r[3] = 1'b1;
          6'h3b: out_r[3] = 1'b1;
          6'h3c: out_r[3] = 1'b1;
          6'h3e: out_r[3] = 1'b1;
          6'h3f: out_r[3] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h04: out_r[4] = 1'b1;
          6'h05: out_r[4] = 1'b1;
          6'h06: out_r[4] = 1'b1;
          6'h09: out_r[4] = 1'b1;
          6'h0b: out_r[4] = 1'b1;
          6'h0f: out_r[4] = 1'b1;
          6'h12: out_r[4] = 1'b1;
          6'h14: out_r[4] = 1'b1;
          6'h15: out_r[4] = 1'b1;
          6'h16: out_r[4] = 1'b1;
          6'h18: out_r[4] = 1'b1;
          6'h19: out_r[4] = 1'b1;
          6'h1b: out_r[4] = 1'b1;
          6'h1c: out_r[4] = 1'b1;
          6'h1d: out_r[4] = 1'b1;
          6'h1f: out_r[4] = 1'b1;
          6'h24: out_r[4] = 1'b1;
          6'h25: out_r[4] = 1'b1;
          6'h26: out_r[4] = 1'b1;
          6'h29: out_r[4] = 1'b1;
          6'h2b: out_r[4] = 1'b1;
          6'h2f: out_r[4] = 1'b1;
          6'h34: out_r[4] = 1'b1;
          6'h35: out_r[4] = 1'b1;
          6'h36: out_r[4] = 1'b1;
          6'h38: out_r[4] = 1'b1;
          6'h39: out_r[4] = 1'b1;
          6'h3a: out_r[4] = 1'b1;
          6'h3b: out_r[4] = 1'b1;
          6'h3c: out_r[4] = 1'b1;
          6'h3e: out_r[4] = 1'b1;
          6'h3f: out_r[4] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h09: out_r[5] = 1'b1;
          6'h0b: out_r[5] = 1'b1;
          6'h0f: out_r[5] = 1'b1;
          6'h12: out_r[5] = 1'b1;
          6'h14: out_r[5] = 1'b1;
          6'h17: out_r[5] = 1'b1;
          6'h1c: out_r[5] = 1'b1;
          6'h1d: out_r[5] = 1'b1;
          6'h29: out_r[5] = 1'b1;
          6'h2b: out_r[5] = 1'b1;
          6'h2f: out_r[5] = 1'b1;
          6'h3a: out_r[5] = 1'b1;
          6'h3c: out_r[5] = 1'b1;
          6'h3e: out_r[5] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[6] = 1'b0;
          6'h0b: out_r[6] = 1'b0;
          6'h0c: out_r[6] = 1'b0;
          6'h0f: out_r[6] = 1'b0;
          6'h13: out_r[6] = 1'b0;
          6'h14: out_r[6] = 1'b0;
          6'h17: out_r[6] = 1'b0;
          6'h19: out_r[6] = 1'b0;
          6'h1c: out_r[6] = 1'b0;
          6'h1d: out_r[6] = 1'b0;
          6'h24: out_r[6] = 1'b0;
          6'h2b: out_r[6] = 1'b0;
          6'h2f: out_r[6] = 1'b0;
          6'h30: out_r[6] = 1'b0;
          6'h32: out_r[6] = 1'b0;
          6'h33: out_r[6] = 1'b0;
          6'h36: out_r[6] = 1'b0;
          6'h37: out_r[6] = 1'b0;
          6'h3a: out_r[6] = 1'b0;
          6'h3c: out_r[6] = 1'b0;
          6'h3d: out_r[6] = 1'b0;
          6'h3e: out_r[6] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[7] = 1'b1;
          6'h07: out_r[7] = 1'b1;
          6'h0a: out_r[7] = 1'b1;
          6'h0b: out_r[7] = 1'b1;
          6'h0c: out_r[7] = 1'b1;
          6'h0d: out_r[7] = 1'b1;
          6'h0e: out_r[7] = 1'b1;
          6'h0f: out_r[7] = 1'b1;
          6'h12: out_r[7] = 1'b1;
          6'h13: out_r[7] = 1'b1;
          6'h14: out_r[7] = 1'b1;
          6'h17: out_r[7] = 1'b1;
          6'h19: out_r[7] = 1'b1;
          6'h1a: out_r[7] = 1'b1;
          6'h1e: out_r[7] = 1'b1;
          6'h24: out_r[7] = 1'b1;
          6'h27: out_r[7] = 1'b1;
          6'h2a: out_r[7] = 1'b1;
          6'h2b: out_r[7] = 1'b1;
          6'h2d: out_r[7] = 1'b1;
          6'h2e: out_r[7] = 1'b1;
          6'h2f: out_r[7] = 1'b1;
          6'h30: out_r[7] = 1'b1;
          6'h32: out_r[7] = 1'b1;
          6'h33: out_r[7] = 1'b1;
          6'h36: out_r[7] = 1'b1;
          6'h37: out_r[7] = 1'b1;
          6'h3a: out_r[7] = 1'b1;
          6'h3c: out_r[7] = 1'b1;
          6'h3e: out_r[7] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[8] = 1'b1;
          6'h07: out_r[8] = 1'b1;
          6'h0b: out_r[8] = 1'b1;
          6'h0c: out_r[8] = 1'b1;
          6'h0f: out_r[8] = 1'b1;
          6'h12: out_r[8] = 1'b1;
          6'h13: out_r[8] = 1'b1;
          6'h14: out_r[8] = 1'b1;
          6'h17: out_r[8] = 1'b1;
          6'h18: out_r[8] = 1'b1;
          6'h19: out_r[8] = 1'b1;
          6'h24: out_r[8] = 1'b1;
          6'h27: out_r[8] = 1'b1;
          6'h2b: out_r[8] = 1'b1;
          6'h2f: out_r[8] = 1'b1;
          6'h30: out_r[8] = 1'b1;
          6'h32: out_r[8] = 1'b1;
          6'h33: out_r[8] = 1'b1;
          6'h36: out_r[8] = 1'b1;
          6'h37: out_r[8] = 1'b1;
          6'h3a: out_r[8] = 1'b1;
          6'h3c: out_r[8] = 1'b1;
          6'h3d: out_r[8] = 1'b1;
          6'h3e: out_r[8] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[9] = 1'b1;
          6'h05: out_r[9] = 1'b1;
          6'h0b: out_r[9] = 1'b1;
          6'h0c: out_r[9] = 1'b1;
          6'h0d: out_r[9] = 1'b1;
          6'h0f: out_r[9] = 1'b1;
          6'h11: out_r[9] = 1'b1;
          6'h16: out_r[9] = 1'b1;
          6'h19: out_r[9] = 1'b1;
          6'h1a: out_r[9] = 1'b1;
          6'h1c: out_r[9] = 1'b1;
          6'h1d: out_r[9] = 1'b1;
          6'h1e: out_r[9] = 1'b1;
          6'h22: out_r[9] = 1'b1;
          6'h25: out_r[9] = 1'b1;
          6'h26: out_r[9] = 1'b1;
          6'h2a: out_r[9] = 1'b1;
          6'h2b: out_r[9] = 1'b1;
          6'h2d: out_r[9] = 1'b1;
          6'h2e: out_r[9] = 1'b1;
          6'h2f: out_r[9] = 1'b1;
          6'h30: out_r[9] = 1'b1;
          6'h31: out_r[9] = 1'b1;
          6'h32: out_r[9] = 1'b1;
          6'h36: out_r[9] = 1'b1;
          6'h37: out_r[9] = 1'b1;
          6'h3a: out_r[9] = 1'b1;
          6'h3e: out_r[9] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[10] = 1'b1;
          6'h02: out_r[10] = 1'b1;
          6'h03: out_r[10] = 1'b1;
          6'h04: out_r[10] = 1'b1;
          6'h07: out_r[10] = 1'b1;
          6'h0d: out_r[10] = 1'b1;
          6'h10: out_r[10] = 1'b1;
          6'h12: out_r[10] = 1'b1;
          6'h14: out_r[10] = 1'b1;
          6'h17: out_r[10] = 1'b1;
          6'h18: out_r[10] = 1'b1;
          6'h1b: out_r[10] = 1'b1;
          6'h1f: out_r[10] = 1'b1;
          6'h20: out_r[10] = 1'b1;
          6'h23: out_r[10] = 1'b1;
          6'h24: out_r[10] = 1'b1;
          6'h27: out_r[10] = 1'b1;
          6'h28: out_r[10] = 1'b1;
          6'h2c: out_r[10] = 1'b1;
          6'h2d: out_r[10] = 1'b1;
          6'h30: out_r[10] = 1'b1;
          6'h34: out_r[10] = 1'b1;
          6'h35: out_r[10] = 1'b1;
          6'h38: out_r[10] = 1'b1;
          6'h39: out_r[10] = 1'b1;
          6'h3b: out_r[10] = 1'b1;
          6'h3c: out_r[10] = 1'b1;
          6'h3d: out_r[10] = 1'b1;
          6'h3f: out_r[10] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[11] = 1'b1;
          6'h06: out_r[11] = 1'b1;
          6'h0a: out_r[11] = 1'b1;
          6'h0e: out_r[11] = 1'b1;
          6'h10: out_r[11] = 1'b1;
          6'h13: out_r[11] = 1'b1;
          6'h16: out_r[11] = 1'b1;
          6'h17: out_r[11] = 1'b1;
          6'h18: out_r[11] = 1'b1;
          6'h19: out_r[11] = 1'b1;
          6'h1a: out_r[11] = 1'b1;
          6'h1d: out_r[11] = 1'b1;
          6'h1e: out_r[11] = 1'b1;
          6'h28: out_r[11] = 1'b1;
          6'h33: out_r[11] = 1'b1;
          default: begin end
        endcase
      end
      6'h0c: begin
        out_r = 12'h0e4;
        case (inner)
          6'h00: out_r[0] = 1'b1;
          6'h03: out_r[0] = 1'b1;
          6'h09: out_r[0] = 1'b1;
          6'h0b: out_r[0] = 1'b1;
          6'h0d: out_r[0] = 1'b1;
          6'h0f: out_r[0] = 1'b1;
          6'h10: out_r[0] = 1'b1;
          6'h13: out_r[0] = 1'b1;
          6'h19: out_r[0] = 1'b1;
          6'h1b: out_r[0] = 1'b1;
          6'h1d: out_r[0] = 1'b1;
          6'h1f: out_r[0] = 1'b1;
          6'h20: out_r[0] = 1'b1;
          6'h22: out_r[0] = 1'b1;
          6'h23: out_r[0] = 1'b1;
          6'h24: out_r[0] = 1'b1;
          6'h25: out_r[0] = 1'b1;
          6'h26: out_r[0] = 1'b1;
          6'h29: out_r[0] = 1'b1;
          6'h2b: out_r[0] = 1'b1;
          6'h2d: out_r[0] = 1'b1;
          6'h30: out_r[0] = 1'b1;
          6'h32: out_r[0] = 1'b1;
          6'h34: out_r[0] = 1'b1;
          6'h36: out_r[0] = 1'b1;
          6'h39: out_r[0] = 1'b1;
          6'h3b: out_r[0] = 1'b1;
          6'h3d: out_r[0] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[1] = 1'b1;
          6'h03: out_r[1] = 1'b1;
          6'h05: out_r[1] = 1'b1;
          6'h07: out_r[1] = 1'b1;
          6'h0a: out_r[1] = 1'b1;
          6'h0b: out_r[1] = 1'b1;
          6'h15: out_r[1] = 1'b1;
          6'h17: out_r[1] = 1'b1;
          6'h19: out_r[1] = 1'b1;
          6'h1a: out_r[1] = 1'b1;
          6'h1b: out_r[1] = 1'b1;
          6'h1d: out_r[1] = 1'b1;
          6'h1f: out_r[1] = 1'b1;
          6'h20: out_r[1] = 1'b1;
          6'h21: out_r[1] = 1'b1;
          6'h23: out_r[1] = 1'b1;
          6'h24: out_r[1] = 1'b1;
          6'h25: out_r[1] = 1'b1;
          6'h26: out_r[1] = 1'b1;
          6'h27: out_r[1] = 1'b1;
          6'h2a: out_r[1] = 1'b1;
          6'h2b: out_r[1] = 1'b1;
          6'h30: out_r[1] = 1'b1;
          6'h32: out_r[1] = 1'b1;
          6'h34: out_r[1] = 1'b1;
          6'h36: out_r[1] = 1'b1;
          6'h3a: out_r[1] = 1'b1;
          6'h3b: out_r[1] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h02: out_r[2] = 1'b0;
          6'h04: out_r[2] = 1'b0;
          6'h05: out_r[2] = 1'b0;
          6'h06: out_r[2] = 1'b0;
          6'h07: out_r[2] = 1'b0;
          6'h0a: out_r[2] = 1'b0;
          6'h0b: out_r[2] = 1'b0;
          6'h12: out_r[2] = 1'b0;
          6'h14: out_r[2] = 1'b0;
          6'h15: out_r[2] = 1'b0;
          6'h16: out_r[2] = 1'b0;
          6'h17: out_r[2] = 1'b0;
          6'h19: out_r[2] = 1'b0;
          6'h1a: out_r[2] = 1'b0;
          6'h1b: out_r[2] = 1'b0;
          6'h1d: out_r[2] = 1'b0;
          6'h1f: out_r[2] = 1'b0;
          6'h20: out_r[2] = 1'b0;
          6'h21: out_r[2] = 1'b0;
          6'h23: out_r[2] = 1'b0;
          6'h24: out_r[2] = 1'b0;
          6'h26: out_r[2] = 1'b0;
          6'h2a: out_r[2] = 1'b0;
          6'h2b: out_r[2] = 1'b0;
          6'h30: out_r[2] = 1'b0;
          6'h31: out_r[2] = 1'b0;
          6'h32: out_r[2] = 1'b0;
          6'h33: out_r[2] = 1'b0;
          6'h37: out_r[2] = 1'b0;
          6'h3a: out_r[2] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[3] = 1'b1;
          6'h01: out_r[3] = 1'b1;
          6'h10: out_r[3] = 1'b1;
          6'h11: out_r[3] = 1'b1;
          6'h13: out_r[3] = 1'b1;
          6'h15: out_r[3] = 1'b1;
          6'h17: out_r[3] = 1'b1;
          6'h22: out_r[3] = 1'b1;
          6'h23: out_r[3] = 1'b1;
          6'h24: out_r[3] = 1'b1;
          6'h25: out_r[3] = 1'b1;
          6'h26: out_r[3] = 1'b1;
          6'h3f: out_r[3] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[4] = 1'b1;
          6'h01: out_r[4] = 1'b1;
          6'h03: out_r[4] = 1'b1;
          6'h05: out_r[4] = 1'b1;
          6'h07: out_r[4] = 1'b1;
          6'h09: out_r[4] = 1'b1;
          6'h0b: out_r[4] = 1'b1;
          6'h0d: out_r[4] = 1'b1;
          6'h0f: out_r[4] = 1'b1;
          6'h11: out_r[4] = 1'b1;
          6'h12: out_r[4] = 1'b1;
          6'h13: out_r[4] = 1'b1;
          6'h21: out_r[4] = 1'b1;
          6'h25: out_r[4] = 1'b1;
          6'h27: out_r[4] = 1'b1;
          6'h29: out_r[4] = 1'b1;
          6'h2b: out_r[4] = 1'b1;
          6'h2d: out_r[4] = 1'b1;
          6'h2f: out_r[4] = 1'b1;
          6'h31: out_r[4] = 1'b1;
          6'h34: out_r[4] = 1'b1;
          6'h35: out_r[4] = 1'b1;
          6'h36: out_r[4] = 1'b1;
          6'h39: out_r[4] = 1'b1;
          6'h3b: out_r[4] = 1'b1;
          6'h3d: out_r[4] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h09: out_r[5] = 1'b0;
          6'h0b: out_r[5] = 1'b0;
          6'h0d: out_r[5] = 1'b0;
          6'h0f: out_r[5] = 1'b0;
          6'h19: out_r[5] = 1'b0;
          6'h1d: out_r[5] = 1'b0;
          6'h1f: out_r[5] = 1'b0;
          6'h29: out_r[5] = 1'b0;
          6'h2b: out_r[5] = 1'b0;
          6'h2d: out_r[5] = 1'b0;
          6'h39: out_r[5] = 1'b0;
          6'h3d: out_r[5] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h02: out_r[6] = 1'b0;
          6'h03: out_r[6] = 1'b0;
          6'h04: out_r[6] = 1'b0;
          6'h05: out_r[6] = 1'b0;
          6'h06: out_r[6] = 1'b0;
          6'h07: out_r[6] = 1'b0;
          6'h09: out_r[6] = 1'b0;
          6'h0b: out_r[6] = 1'b0;
          6'h0d: out_r[6] = 1'b0;
          6'h0f: out_r[6] = 1'b0;
          6'h11: out_r[6] = 1'b0;
          6'h14: out_r[6] = 1'b0;
          6'h16: out_r[6] = 1'b0;
          6'h19: out_r[6] = 1'b0;
          6'h21: out_r[6] = 1'b0;
          6'h25: out_r[6] = 1'b0;
          6'h27: out_r[6] = 1'b0;
          6'h29: out_r[6] = 1'b0;
          6'h2d: out_r[6] = 1'b0;
          6'h32: out_r[6] = 1'b0;
          6'h33: out_r[6] = 1'b0;
          6'h34: out_r[6] = 1'b0;
          6'h36: out_r[6] = 1'b0;
          6'h37: out_r[6] = 1'b0;
          6'h39: out_r[6] = 1'b0;
          6'h3b: out_r[6] = 1'b0;
          6'h3d: out_r[6] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[7] = 1'b0;
          6'h01: out_r[7] = 1'b0;
          6'h09: out_r[7] = 1'b0;
          6'h0b: out_r[7] = 1'b0;
          6'h0d: out_r[7] = 1'b0;
          6'h0f: out_r[7] = 1'b0;
          6'h10: out_r[7] = 1'b0;
          6'h12: out_r[7] = 1'b0;
          6'h13: out_r[7] = 1'b0;
          6'h15: out_r[7] = 1'b0;
          6'h17: out_r[7] = 1'b0;
          6'h1b: out_r[7] = 1'b0;
          6'h20: out_r[7] = 1'b0;
          6'h22: out_r[7] = 1'b0;
          6'h23: out_r[7] = 1'b0;
          6'h24: out_r[7] = 1'b0;
          6'h26: out_r[7] = 1'b0;
          6'h29: out_r[7] = 1'b0;
          6'h2b: out_r[7] = 1'b0;
          6'h2d: out_r[7] = 1'b0;
          6'h2f: out_r[7] = 1'b0;
          6'h30: out_r[7] = 1'b0;
          6'h31: out_r[7] = 1'b0;
          6'h35: out_r[7] = 1'b0;
          6'h39: out_r[7] = 1'b0;
          6'h3d: out_r[7] = 1'b0;
          6'h3f: out_r[7] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[8] = 1'b1;
          6'h02: out_r[8] = 1'b1;
          6'h03: out_r[8] = 1'b1;
          6'h04: out_r[8] = 1'b1;
          6'h05: out_r[8] = 1'b1;
          6'h06: out_r[8] = 1'b1;
          6'h07: out_r[8] = 1'b1;
          6'h09: out_r[8] = 1'b1;
          6'h0d: out_r[8] = 1'b1;
          6'h0f: out_r[8] = 1'b1;
          6'h11: out_r[8] = 1'b1;
          6'h12: out_r[8] = 1'b1;
          6'h13: out_r[8] = 1'b1;
          6'h14: out_r[8] = 1'b1;
          6'h15: out_r[8] = 1'b1;
          6'h16: out_r[8] = 1'b1;
          6'h17: out_r[8] = 1'b1;
          6'h19: out_r[8] = 1'b1;
          6'h1d: out_r[8] = 1'b1;
          6'h1f: out_r[8] = 1'b1;
          6'h21: out_r[8] = 1'b1;
          6'h25: out_r[8] = 1'b1;
          6'h27: out_r[8] = 1'b1;
          6'h29: out_r[8] = 1'b1;
          6'h2d: out_r[8] = 1'b1;
          6'h30: out_r[8] = 1'b1;
          6'h32: out_r[8] = 1'b1;
          6'h33: out_r[8] = 1'b1;
          6'h34: out_r[8] = 1'b1;
          6'h36: out_r[8] = 1'b1;
          6'h37: out_r[8] = 1'b1;
          6'h3b: out_r[8] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h02: out_r[9] = 1'b1;
          6'h03: out_r[9] = 1'b1;
          6'h04: out_r[9] = 1'b1;
          6'h05: out_r[9] = 1'b1;
          6'h06: out_r[9] = 1'b1;
          6'h07: out_r[9] = 1'b1;
          6'h0b: out_r[9] = 1'b1;
          6'h11: out_r[9] = 1'b1;
          6'h14: out_r[9] = 1'b1;
          6'h16: out_r[9] = 1'b1;
          6'h18: out_r[9] = 1'b1;
          6'h1a: out_r[9] = 1'b1;
          6'h1c: out_r[9] = 1'b1;
          6'h1e: out_r[9] = 1'b1;
          6'h21: out_r[9] = 1'b1;
          6'h22: out_r[9] = 1'b1;
          6'h25: out_r[9] = 1'b1;
          6'h27: out_r[9] = 1'b1;
          6'h31: out_r[9] = 1'b1;
          6'h32: out_r[9] = 1'b1;
          6'h33: out_r[9] = 1'b1;
          6'h34: out_r[9] = 1'b1;
          6'h35: out_r[9] = 1'b1;
          6'h36: out_r[9] = 1'b1;
          6'h37: out_r[9] = 1'b1;
          6'h38: out_r[9] = 1'b1;
          6'h3a: out_r[9] = 1'b1;
          6'h3b: out_r[9] = 1'b1;
          6'h3c: out_r[9] = 1'b1;
          6'h3e: out_r[9] = 1'b1;
          6'h3f: out_r[9] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[10] = 1'b1;
          6'h01: out_r[10] = 1'b1;
          6'h03: out_r[10] = 1'b1;
          6'h05: out_r[10] = 1'b1;
          6'h07: out_r[10] = 1'b1;
          6'h09: out_r[10] = 1'b1;
          6'h0b: out_r[10] = 1'b1;
          6'h0d: out_r[10] = 1'b1;
          6'h0f: out_r[10] = 1'b1;
          6'h10: out_r[10] = 1'b1;
          6'h11: out_r[10] = 1'b1;
          6'h12: out_r[10] = 1'b1;
          6'h13: out_r[10] = 1'b1;
          6'h14: out_r[10] = 1'b1;
          6'h15: out_r[10] = 1'b1;
          6'h16: out_r[10] = 1'b1;
          6'h17: out_r[10] = 1'b1;
          6'h19: out_r[10] = 1'b1;
          6'h1b: out_r[10] = 1'b1;
          6'h1d: out_r[10] = 1'b1;
          6'h1f: out_r[10] = 1'b1;
          6'h24: out_r[10] = 1'b1;
          6'h26: out_r[10] = 1'b1;
          6'h29: out_r[10] = 1'b1;
          6'h2d: out_r[10] = 1'b1;
          6'h30: out_r[10] = 1'b1;
          6'h32: out_r[10] = 1'b1;
          6'h34: out_r[10] = 1'b1;
          6'h36: out_r[10] = 1'b1;
          6'h39: out_r[10] = 1'b1;
          6'h3b: out_r[10] = 1'b1;
          6'h3d: out_r[10] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[11] = 1'b1;
          6'h01: out_r[11] = 1'b1;
          6'h03: out_r[11] = 1'b1;
          6'h05: out_r[11] = 1'b1;
          6'h07: out_r[11] = 1'b1;
          6'h10: out_r[11] = 1'b1;
          6'h11: out_r[11] = 1'b1;
          6'h12: out_r[11] = 1'b1;
          6'h13: out_r[11] = 1'b1;
          6'h14: out_r[11] = 1'b1;
          6'h15: out_r[11] = 1'b1;
          6'h16: out_r[11] = 1'b1;
          6'h17: out_r[11] = 1'b1;
          6'h1d: out_r[11] = 1'b1;
          6'h1f: out_r[11] = 1'b1;
          6'h22: out_r[11] = 1'b1;
          6'h24: out_r[11] = 1'b1;
          6'h26: out_r[11] = 1'b1;
          6'h27: out_r[11] = 1'b1;
          6'h28: out_r[11] = 1'b1;
          6'h2a: out_r[11] = 1'b1;
          6'h2c: out_r[11] = 1'b1;
          6'h2e: out_r[11] = 1'b1;
          6'h2f: out_r[11] = 1'b1;
          6'h30: out_r[11] = 1'b1;
          6'h38: out_r[11] = 1'b1;
          6'h3a: out_r[11] = 1'b1;
          6'h3c: out_r[11] = 1'b1;
          6'h3e: out_r[11] = 1'b1;
          6'h3f: out_r[11] = 1'b1;
          default: begin end
        endcase
      end
      6'h0d: begin
        out_r = 12'h471;
        case (inner)
          6'h00: out_r[0] = 1'b0;
          6'h03: out_r[0] = 1'b0;
          6'h0b: out_r[0] = 1'b0;
          6'h0c: out_r[0] = 1'b0;
          6'h0d: out_r[0] = 1'b0;
          6'h0e: out_r[0] = 1'b0;
          6'h0f: out_r[0] = 1'b0;
          6'h10: out_r[0] = 1'b0;
          6'h1c: out_r[0] = 1'b0;
          6'h1e: out_r[0] = 1'b0;
          6'h23: out_r[0] = 1'b0;
          6'h2b: out_r[0] = 1'b0;
          6'h2c: out_r[0] = 1'b0;
          6'h2d: out_r[0] = 1'b0;
          6'h2f: out_r[0] = 1'b0;
          6'h30: out_r[0] = 1'b0;
          6'h38: out_r[0] = 1'b0;
          6'h39: out_r[0] = 1'b0;
          6'h3b: out_r[0] = 1'b0;
          6'h3c: out_r[0] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[1] = 1'b1;
          6'h03: out_r[1] = 1'b1;
          6'h08: out_r[1] = 1'b1;
          6'h09: out_r[1] = 1'b1;
          6'h0b: out_r[1] = 1'b1;
          6'h0c: out_r[1] = 1'b1;
          6'h0d: out_r[1] = 1'b1;
          6'h0e: out_r[1] = 1'b1;
          6'h0f: out_r[1] = 1'b1;
          6'h10: out_r[1] = 1'b1;
          6'h18: out_r[1] = 1'b1;
          6'h1c: out_r[1] = 1'b1;
          6'h1d: out_r[1] = 1'b1;
          6'h1e: out_r[1] = 1'b1;
          6'h1f: out_r[1] = 1'b1;
          6'h23: out_r[1] = 1'b1;
          6'h28: out_r[1] = 1'b1;
          6'h29: out_r[1] = 1'b1;
          6'h2a: out_r[1] = 1'b1;
          6'h2b: out_r[1] = 1'b1;
          6'h2d: out_r[1] = 1'b1;
          6'h2f: out_r[1] = 1'b1;
          6'h30: out_r[1] = 1'b1;
          6'h31: out_r[1] = 1'b1;
          6'h38: out_r[1] = 1'b1;
          6'h3b: out_r[1] = 1'b1;
          6'h3c: out_r[1] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[2] = 1'b1;
          6'h01: out_r[2] = 1'b1;
          6'h02: out_r[2] = 1'b1;
          6'h03: out_r[2] = 1'b1;
          6'h08: out_r[2] = 1'b1;
          6'h09: out_r[2] = 1'b1;
          6'h0b: out_r[2] = 1'b1;
          6'h0d: out_r[2] = 1'b1;
          6'h0f: out_r[2] = 1'b1;
          6'h10: out_r[2] = 1'b1;
          6'h12: out_r[2] = 1'b1;
          6'h18: out_r[2] = 1'b1;
          6'h1c: out_r[2] = 1'b1;
          6'h1e: out_r[2] = 1'b1;
          6'h21: out_r[2] = 1'b1;
          6'h23: out_r[2] = 1'b1;
          6'h24: out_r[2] = 1'b1;
          6'h26: out_r[2] = 1'b1;
          6'h28: out_r[2] = 1'b1;
          6'h29: out_r[2] = 1'b1;
          6'h2a: out_r[2] = 1'b1;
          6'h2b: out_r[2] = 1'b1;
          6'h2c: out_r[2] = 1'b1;
          6'h2d: out_r[2] = 1'b1;
          6'h2f: out_r[2] = 1'b1;
          6'h30: out_r[2] = 1'b1;
          6'h31: out_r[2] = 1'b1;
          6'h38: out_r[2] = 1'b1;
          6'h3b: out_r[2] = 1'b1;
          6'h3c: out_r[2] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[3] = 1'b1;
          6'h0b: out_r[3] = 1'b1;
          6'h0c: out_r[3] = 1'b1;
          6'h0e: out_r[3] = 1'b1;
          6'h10: out_r[3] = 1'b1;
          6'h15: out_r[3] = 1'b1;
          6'h17: out_r[3] = 1'b1;
          6'h1d: out_r[3] = 1'b1;
          6'h1f: out_r[3] = 1'b1;
          6'h22: out_r[3] = 1'b1;
          6'h28: out_r[3] = 1'b1;
          6'h2b: out_r[3] = 1'b1;
          6'h2c: out_r[3] = 1'b1;
          6'h33: out_r[3] = 1'b1;
          6'h36: out_r[3] = 1'b1;
          6'h39: out_r[3] = 1'b1;
          6'h3b: out_r[3] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h08: out_r[4] = 1'b0;
          6'h0a: out_r[4] = 1'b0;
          6'h0c: out_r[4] = 1'b0;
          6'h0e: out_r[4] = 1'b0;
          6'h11: out_r[4] = 1'b0;
          6'h13: out_r[4] = 1'b0;
          6'h15: out_r[4] = 1'b0;
          6'h17: out_r[4] = 1'b0;
          6'h19: out_r[4] = 1'b0;
          6'h1a: out_r[4] = 1'b0;
          6'h1d: out_r[4] = 1'b0;
          6'h1f: out_r[4] = 1'b0;
          6'h20: out_r[4] = 1'b0;
          6'h22: out_r[4] = 1'b0;
          6'h24: out_r[4] = 1'b0;
          6'h26: out_r[4] = 1'b0;
          6'h28: out_r[4] = 1'b0;
          6'h2a: out_r[4] = 1'b0;
          6'h2e: out_r[4] = 1'b0;
          6'h31: out_r[4] = 1'b0;
          6'h32: out_r[4] = 1'b0;
          6'h33: out_r[4] = 1'b0;
          6'h35: out_r[4] = 1'b0;
          6'h36: out_r[4] = 1'b0;
          6'h37: out_r[4] = 1'b0;
          6'h39: out_r[4] = 1'b0;
          6'h3a: out_r[4] = 1'b0;
          6'h3d: out_r[4] = 1'b0;
          6'h3f: out_r[4] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h03: out_r[5] = 1'b0;
          6'h09: out_r[5] = 1'b0;
          6'h0d: out_r[5] = 1'b0;
          6'h0f: out_r[5] = 1'b0;
          6'h18: out_r[5] = 1'b0;
          6'h1c: out_r[5] = 1'b0;
          6'h1e: out_r[5] = 1'b0;
          6'h23: out_r[5] = 1'b0;
          6'h29: out_r[5] = 1'b0;
          6'h2d: out_r[5] = 1'b0;
          6'h2e: out_r[5] = 1'b0;
          6'h2f: out_r[5] = 1'b0;
          6'h30: out_r[5] = 1'b0;
          6'h33: out_r[5] = 1'b0;
          6'h34: out_r[5] = 1'b0;
          6'h35: out_r[5] = 1'b0;
          6'h37: out_r[5] = 1'b0;
          6'h38: out_r[5] = 1'b0;
          6'h3a: out_r[5] = 1'b0;
          6'h3c: out_r[5] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h03: out_r[6] = 1'b0;
          6'h08: out_r[6] = 1'b0;
          6'h0c: out_r[6] = 1'b0;
          6'h0d: out_r[6] = 1'b0;
          6'h0e: out_r[6] = 1'b0;
          6'h0f: out_r[6] = 1'b0;
          6'h18: out_r[6] = 1'b0;
          6'h1c: out_r[6] = 1'b0;
          6'h1e: out_r[6] = 1'b0;
          6'h23: out_r[6] = 1'b0;
          6'h2d: out_r[6] = 1'b0;
          6'h2f: out_r[6] = 1'b0;
          6'h30: out_r[6] = 1'b0;
          6'h33: out_r[6] = 1'b0;
          6'h34: out_r[6] = 1'b0;
          6'h35: out_r[6] = 1'b0;
          6'h37: out_r[6] = 1'b0;
          6'h38: out_r[6] = 1'b0;
          6'h39: out_r[6] = 1'b0;
          6'h3b: out_r[6] = 1'b0;
          6'h3c: out_r[6] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h03: out_r[7] = 1'b1;
          6'h08: out_r[7] = 1'b1;
          6'h0a: out_r[7] = 1'b1;
          6'h0c: out_r[7] = 1'b1;
          6'h0e: out_r[7] = 1'b1;
          6'h13: out_r[7] = 1'b1;
          6'h1a: out_r[7] = 1'b1;
          6'h20: out_r[7] = 1'b1;
          6'h23: out_r[7] = 1'b1;
          6'h24: out_r[7] = 1'b1;
          6'h26: out_r[7] = 1'b1;
          6'h2a: out_r[7] = 1'b1;
          6'h31: out_r[7] = 1'b1;
          6'h32: out_r[7] = 1'b1;
          6'h34: out_r[7] = 1'b1;
          6'h35: out_r[7] = 1'b1;
          6'h37: out_r[7] = 1'b1;
          6'h38: out_r[7] = 1'b1;
          6'h39: out_r[7] = 1'b1;
          6'h3b: out_r[7] = 1'b1;
          6'h3c: out_r[7] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h03: out_r[8] = 1'b1;
          6'h08: out_r[8] = 1'b1;
          6'h0b: out_r[8] = 1'b1;
          6'h0c: out_r[8] = 1'b1;
          6'h0d: out_r[8] = 1'b1;
          6'h0e: out_r[8] = 1'b1;
          6'h0f: out_r[8] = 1'b1;
          6'h13: out_r[8] = 1'b1;
          6'h19: out_r[8] = 1'b1;
          6'h1d: out_r[8] = 1'b1;
          6'h1f: out_r[8] = 1'b1;
          6'h20: out_r[8] = 1'b1;
          6'h23: out_r[8] = 1'b1;
          6'h24: out_r[8] = 1'b1;
          6'h26: out_r[8] = 1'b1;
          6'h2a: out_r[8] = 1'b1;
          6'h2b: out_r[8] = 1'b1;
          6'h2d: out_r[8] = 1'b1;
          6'h2f: out_r[8] = 1'b1;
          6'h31: out_r[8] = 1'b1;
          6'h32: out_r[8] = 1'b1;
          6'h34: out_r[8] = 1'b1;
          6'h35: out_r[8] = 1'b1;
          6'h37: out_r[8] = 1'b1;
          6'h38: out_r[8] = 1'b1;
          6'h39: out_r[8] = 1'b1;
          6'h3b: out_r[8] = 1'b1;
          6'h3c: out_r[8] = 1'b1;
          6'h3d: out_r[8] = 1'b1;
          6'h3f: out_r[8] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h05: out_r[9] = 1'b1;
          6'h07: out_r[9] = 1'b1;
          6'h08: out_r[9] = 1'b1;
          6'h0c: out_r[9] = 1'b1;
          6'h0d: out_r[9] = 1'b1;
          6'h0e: out_r[9] = 1'b1;
          6'h0f: out_r[9] = 1'b1;
          6'h10: out_r[9] = 1'b1;
          6'h12: out_r[9] = 1'b1;
          6'h14: out_r[9] = 1'b1;
          6'h16: out_r[9] = 1'b1;
          6'h18: out_r[9] = 1'b1;
          6'h1a: out_r[9] = 1'b1;
          6'h1c: out_r[9] = 1'b1;
          6'h1e: out_r[9] = 1'b1;
          6'h25: out_r[9] = 1'b1;
          6'h27: out_r[9] = 1'b1;
          6'h2d: out_r[9] = 1'b1;
          6'h2f: out_r[9] = 1'b1;
          6'h35: out_r[9] = 1'b1;
          6'h37: out_r[9] = 1'b1;
          6'h39: out_r[9] = 1'b1;
          6'h3b: out_r[9] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[10] = 1'b0;
          6'h02: out_r[10] = 1'b0;
          6'h04: out_r[10] = 1'b0;
          6'h05: out_r[10] = 1'b0;
          6'h06: out_r[10] = 1'b0;
          6'h07: out_r[10] = 1'b0;
          6'h08: out_r[10] = 1'b0;
          6'h0a: out_r[10] = 1'b0;
          6'h0c: out_r[10] = 1'b0;
          6'h0e: out_r[10] = 1'b0;
          6'h10: out_r[10] = 1'b0;
          6'h12: out_r[10] = 1'b0;
          6'h14: out_r[10] = 1'b0;
          6'h15: out_r[10] = 1'b0;
          6'h16: out_r[10] = 1'b0;
          6'h17: out_r[10] = 1'b0;
          6'h18: out_r[10] = 1'b0;
          6'h1a: out_r[10] = 1'b0;
          6'h1c: out_r[10] = 1'b0;
          6'h1e: out_r[10] = 1'b0;
          6'h25: out_r[10] = 1'b0;
          6'h27: out_r[10] = 1'b0;
          6'h30: out_r[10] = 1'b0;
          6'h35: out_r[10] = 1'b0;
          6'h37: out_r[10] = 1'b0;
          6'h39: out_r[10] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h03: out_r[11] = 1'b1;
          6'h09: out_r[11] = 1'b1;
          6'h0b: out_r[11] = 1'b1;
          6'h0c: out_r[11] = 1'b1;
          6'h0d: out_r[11] = 1'b1;
          6'h0e: out_r[11] = 1'b1;
          6'h0f: out_r[11] = 1'b1;
          6'h19: out_r[11] = 1'b1;
          6'h1b: out_r[11] = 1'b1;
          6'h1c: out_r[11] = 1'b1;
          6'h1d: out_r[11] = 1'b1;
          6'h1e: out_r[11] = 1'b1;
          6'h1f: out_r[11] = 1'b1;
          6'h23: out_r[11] = 1'b1;
          6'h29: out_r[11] = 1'b1;
          6'h2b: out_r[11] = 1'b1;
          6'h2c: out_r[11] = 1'b1;
          6'h2d: out_r[11] = 1'b1;
          6'h2f: out_r[11] = 1'b1;
          6'h38: out_r[11] = 1'b1;
          6'h3b: out_r[11] = 1'b1;
          default: begin end
        endcase
      end
      6'h0e: begin
        out_r = 12'h0e9;
        case (inner)
          6'h00: out_r[0] = 1'b0;
          6'h08: out_r[0] = 1'b0;
          6'h0a: out_r[0] = 1'b0;
          6'h0b: out_r[0] = 1'b0;
          6'h0d: out_r[0] = 1'b0;
          6'h0e: out_r[0] = 1'b0;
          6'h0f: out_r[0] = 1'b0;
          6'h10: out_r[0] = 1'b0;
          6'h18: out_r[0] = 1'b0;
          6'h1a: out_r[0] = 1'b0;
          6'h1b: out_r[0] = 1'b0;
          6'h1e: out_r[0] = 1'b0;
          6'h1f: out_r[0] = 1'b0;
          6'h20: out_r[0] = 1'b0;
          6'h28: out_r[0] = 1'b0;
          6'h29: out_r[0] = 1'b0;
          6'h2c: out_r[0] = 1'b0;
          6'h2d: out_r[0] = 1'b0;
          6'h2e: out_r[0] = 1'b0;
          6'h2f: out_r[0] = 1'b0;
          6'h30: out_r[0] = 1'b0;
          6'h38: out_r[0] = 1'b0;
          6'h3a: out_r[0] = 1'b0;
          6'h3b: out_r[0] = 1'b0;
          6'h3e: out_r[0] = 1'b0;
          6'h3f: out_r[0] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h0a: out_r[1] = 1'b1;
          6'h0b: out_r[1] = 1'b1;
          6'h0c: out_r[1] = 1'b1;
          6'h0d: out_r[1] = 1'b1;
          6'h0e: out_r[1] = 1'b1;
          6'h0f: out_r[1] = 1'b1;
          6'h19: out_r[1] = 1'b1;
          6'h1a: out_r[1] = 1'b1;
          6'h1b: out_r[1] = 1'b1;
          6'h1e: out_r[1] = 1'b1;
          6'h1f: out_r[1] = 1'b1;
          6'h21: out_r[1] = 1'b1;
          6'h22: out_r[1] = 1'b1;
          6'h23: out_r[1] = 1'b1;
          6'h29: out_r[1] = 1'b1;
          6'h2c: out_r[1] = 1'b1;
          6'h2e: out_r[1] = 1'b1;
          6'h2f: out_r[1] = 1'b1;
          6'h39: out_r[1] = 1'b1;
          6'h3e: out_r[1] = 1'b1;
          6'h3f: out_r[1] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h09: out_r[2] = 1'b1;
          6'h0c: out_r[2] = 1'b1;
          6'h11: out_r[2] = 1'b1;
          6'h14: out_r[2] = 1'b1;
          6'h15: out_r[2] = 1'b1;
          6'h16: out_r[2] = 1'b1;
          6'h17: out_r[2] = 1'b1;
          6'h1c: out_r[2] = 1'b1;
          6'h21: out_r[2] = 1'b1;
          6'h22: out_r[2] = 1'b1;
          6'h23: out_r[2] = 1'b1;
          6'h24: out_r[2] = 1'b1;
          6'h25: out_r[2] = 1'b1;
          6'h2a: out_r[2] = 1'b1;
          6'h2b: out_r[2] = 1'b1;
          6'h2c: out_r[2] = 1'b1;
          6'h31: out_r[2] = 1'b1;
          6'h33: out_r[2] = 1'b1;
          6'h34: out_r[2] = 1'b1;
          6'h35: out_r[2] = 1'b1;
          6'h36: out_r[2] = 1'b1;
          6'h3a: out_r[2] = 1'b1;
          6'h3b: out_r[2] = 1'b1;
          6'h3c: out_r[2] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h0e: out_r[3] = 1'b0;
          6'h0f: out_r[3] = 1'b0;
          6'h11: out_r[3] = 1'b0;
          6'h14: out_r[3] = 1'b0;
          6'h15: out_r[3] = 1'b0;
          6'h16: out_r[3] = 1'b0;
          6'h17: out_r[3] = 1'b0;
          6'h1c: out_r[3] = 1'b0;
          6'h1e: out_r[3] = 1'b0;
          6'h1f: out_r[3] = 1'b0;
          6'h24: out_r[3] = 1'b0;
          6'h2c: out_r[3] = 1'b0;
          6'h2e: out_r[3] = 1'b0;
          6'h2f: out_r[3] = 1'b0;
          6'h33: out_r[3] = 1'b0;
          6'h34: out_r[3] = 1'b0;
          6'h35: out_r[3] = 1'b0;
          6'h36: out_r[3] = 1'b0;
          6'h3a: out_r[3] = 1'b0;
          6'h3b: out_r[3] = 1'b0;
          6'h3c: out_r[3] = 1'b0;
          6'h3e: out_r[3] = 1'b0;
          6'h3f: out_r[3] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[4] = 1'b1;
          6'h01: out_r[4] = 1'b1;
          6'h02: out_r[4] = 1'b1;
          6'h03: out_r[4] = 1'b1;
          6'h04: out_r[4] = 1'b1;
          6'h05: out_r[4] = 1'b1;
          6'h06: out_r[4] = 1'b1;
          6'h07: out_r[4] = 1'b1;
          6'h10: out_r[4] = 1'b1;
          6'h12: out_r[4] = 1'b1;
          6'h13: out_r[4] = 1'b1;
          6'h19: out_r[4] = 1'b1;
          6'h1d: out_r[4] = 1'b1;
          6'h20: out_r[4] = 1'b1;
          6'h21: out_r[4] = 1'b1;
          6'h22: out_r[4] = 1'b1;
          6'h23: out_r[4] = 1'b1;
          6'h26: out_r[4] = 1'b1;
          6'h27: out_r[4] = 1'b1;
          6'h2d: out_r[4] = 1'b1;
          6'h30: out_r[4] = 1'b1;
          6'h37: out_r[4] = 1'b1;
          6'h3d: out_r[4] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h06: out_r[5] = 1'b0;
          6'h07: out_r[5] = 1'b0;
          6'h19: out_r[5] = 1'b0;
          6'h21: out_r[5] = 1'b0;
          6'h22: out_r[5] = 1'b0;
          6'h23: out_r[5] = 1'b0;
          6'h3a: out_r[5] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h06: out_r[6] = 1'b0;
          6'h07: out_r[6] = 1'b0;
          6'h09: out_r[6] = 1'b0;
          6'h0d: out_r[6] = 1'b0;
          6'h19: out_r[6] = 1'b0;
          6'h1c: out_r[6] = 1'b0;
          6'h21: out_r[6] = 1'b0;
          6'h22: out_r[6] = 1'b0;
          6'h23: out_r[6] = 1'b0;
          6'h2a: out_r[6] = 1'b0;
          6'h2b: out_r[6] = 1'b0;
          6'h2c: out_r[6] = 1'b0;
          6'h2d: out_r[6] = 1'b0;
          6'h35: out_r[6] = 1'b0;
          6'h3b: out_r[6] = 1'b0;
          6'h3f: out_r[6] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[7] = 1'b0;
          6'h01: out_r[7] = 1'b0;
          6'h02: out_r[7] = 1'b0;
          6'h03: out_r[7] = 1'b0;
          6'h04: out_r[7] = 1'b0;
          6'h05: out_r[7] = 1'b0;
          6'h10: out_r[7] = 1'b0;
          6'h11: out_r[7] = 1'b0;
          6'h12: out_r[7] = 1'b0;
          6'h13: out_r[7] = 1'b0;
          6'h14: out_r[7] = 1'b0;
          6'h15: out_r[7] = 1'b0;
          6'h16: out_r[7] = 1'b0;
          6'h17: out_r[7] = 1'b0;
          6'h19: out_r[7] = 1'b0;
          6'h1d: out_r[7] = 1'b0;
          6'h20: out_r[7] = 1'b0;
          6'h24: out_r[7] = 1'b0;
          6'h26: out_r[7] = 1'b0;
          6'h27: out_r[7] = 1'b0;
          6'h30: out_r[7] = 1'b0;
          6'h33: out_r[7] = 1'b0;
          6'h34: out_r[7] = 1'b0;
          6'h36: out_r[7] = 1'b0;
          6'h37: out_r[7] = 1'b0;
          6'h39: out_r[7] = 1'b0;
          6'h3a: out_r[7] = 1'b0;
          6'h3c: out_r[7] = 1'b0;
          6'h3d: out_r[7] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h06: out_r[8] = 1'b1;
          6'h07: out_r[8] = 1'b1;
          6'h09: out_r[8] = 1'b1;
          6'h0c: out_r[8] = 1'b1;
          6'h0d: out_r[8] = 1'b1;
          6'h1c: out_r[8] = 1'b1;
          6'h21: out_r[8] = 1'b1;
          6'h22: out_r[8] = 1'b1;
          6'h23: out_r[8] = 1'b1;
          6'h25: out_r[8] = 1'b1;
          6'h2a: out_r[8] = 1'b1;
          6'h2b: out_r[8] = 1'b1;
          6'h2c: out_r[8] = 1'b1;
          6'h2d: out_r[8] = 1'b1;
          6'h31: out_r[8] = 1'b1;
          6'h32: out_r[8] = 1'b1;
          6'h35: out_r[8] = 1'b1;
          6'h3b: out_r[8] = 1'b1;
          6'h3f: out_r[8] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h01: out_r[9] = 1'b1;
          6'h04: out_r[9] = 1'b1;
          6'h05: out_r[9] = 1'b1;
          6'h09: out_r[9] = 1'b1;
          6'h0d: out_r[9] = 1'b1;
          6'h10: out_r[9] = 1'b1;
          6'h12: out_r[9] = 1'b1;
          6'h13: out_r[9] = 1'b1;
          6'h18: out_r[9] = 1'b1;
          6'h19: out_r[9] = 1'b1;
          6'h1a: out_r[9] = 1'b1;
          6'h1b: out_r[9] = 1'b1;
          6'h1c: out_r[9] = 1'b1;
          6'h1e: out_r[9] = 1'b1;
          6'h1f: out_r[9] = 1'b1;
          6'h26: out_r[9] = 1'b1;
          6'h27: out_r[9] = 1'b1;
          6'h29: out_r[9] = 1'b1;
          6'h2a: out_r[9] = 1'b1;
          6'h2b: out_r[9] = 1'b1;
          6'h2c: out_r[9] = 1'b1;
          6'h2d: out_r[9] = 1'b1;
          6'h30: out_r[9] = 1'b1;
          6'h38: out_r[9] = 1'b1;
          6'h39: out_r[9] = 1'b1;
          6'h3b: out_r[9] = 1'b1;
          6'h3d: out_r[9] = 1'b1;
          6'h3e: out_r[9] = 1'b1;
          6'h3f: out_r[9] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h06: out_r[10] = 1'b1;
          6'h07: out_r[10] = 1'b1;
          6'h0c: out_r[10] = 1'b1;
          6'h16: out_r[10] = 1'b1;
          6'h17: out_r[10] = 1'b1;
          6'h1c: out_r[10] = 1'b1;
          6'h1d: out_r[10] = 1'b1;
          6'h21: out_r[10] = 1'b1;
          6'h22: out_r[10] = 1'b1;
          6'h23: out_r[10] = 1'b1;
          6'h24: out_r[10] = 1'b1;
          6'h25: out_r[10] = 1'b1;
          6'h2d: out_r[10] = 1'b1;
          6'h31: out_r[10] = 1'b1;
          6'h32: out_r[10] = 1'b1;
          6'h33: out_r[10] = 1'b1;
          6'h34: out_r[10] = 1'b1;
          6'h35: out_r[10] = 1'b1;
          6'h37: out_r[10] = 1'b1;
          6'h39: out_r[10] = 1'b1;
          6'h3a: out_r[10] = 1'b1;
          6'h3b: out_r[10] = 1'b1;
          6'h3c: out_r[10] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h09: out_r[11] = 1'b1;
          6'h0c: out_r[11] = 1'b1;
          6'h1c: out_r[11] = 1'b1;
          6'h20: out_r[11] = 1'b1;
          6'h28: out_r[11] = 1'b1;
          6'h2a: out_r[11] = 1'b1;
          6'h2b: out_r[11] = 1'b1;
          6'h2d: out_r[11] = 1'b1;
          6'h2e: out_r[11] = 1'b1;
          6'h2f: out_r[11] = 1'b1;
          6'h30: out_r[11] = 1'b1;
          6'h38: out_r[11] = 1'b1;
          6'h3a: out_r[11] = 1'b1;
          6'h3b: out_r[11] = 1'b1;
          6'h3e: out_r[11] = 1'b1;
          6'h3f: out_r[11] = 1'b1;
          default: begin end
        endcase
      end
      6'h0f: begin
        out_r = 12'hc7a;
        case (inner)
          6'h02: out_r[0] = 1'b1;
          6'h04: out_r[0] = 1'b1;
          6'h05: out_r[0] = 1'b1;
          6'h06: out_r[0] = 1'b1;
          6'h09: out_r[0] = 1'b1;
          6'h0e: out_r[0] = 1'b1;
          6'h15: out_r[0] = 1'b1;
          6'h1a: out_r[0] = 1'b1;
          6'h1e: out_r[0] = 1'b1;
          6'h20: out_r[0] = 1'b1;
          6'h22: out_r[0] = 1'b1;
          6'h25: out_r[0] = 1'b1;
          6'h26: out_r[0] = 1'b1;
          6'h28: out_r[0] = 1'b1;
          6'h29: out_r[0] = 1'b1;
          6'h2a: out_r[0] = 1'b1;
          6'h2e: out_r[0] = 1'b1;
          6'h35: out_r[0] = 1'b1;
          6'h3a: out_r[0] = 1'b1;
          6'h3c: out_r[0] = 1'b1;
          6'h3e: out_r[0] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h03: out_r[1] = 1'b0;
          6'h07: out_r[1] = 1'b0;
          6'h0b: out_r[1] = 1'b0;
          6'h0f: out_r[1] = 1'b0;
          6'h13: out_r[1] = 1'b0;
          6'h17: out_r[1] = 1'b0;
          6'h1a: out_r[1] = 1'b0;
          6'h1b: out_r[1] = 1'b0;
          6'h1f: out_r[1] = 1'b0;
          6'h23: out_r[1] = 1'b0;
          6'h27: out_r[1] = 1'b0;
          6'h2a: out_r[1] = 1'b0;
          6'h2b: out_r[1] = 1'b0;
          6'h2f: out_r[1] = 1'b0;
          6'h33: out_r[1] = 1'b0;
          6'h35: out_r[1] = 1'b0;
          6'h37: out_r[1] = 1'b0;
          6'h3b: out_r[1] = 1'b0;
          6'h3f: out_r[1] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[2] = 1'b1;
          6'h08: out_r[2] = 1'b1;
          6'h09: out_r[2] = 1'b1;
          6'h0c: out_r[2] = 1'b1;
          6'h0d: out_r[2] = 1'b1;
          6'h14: out_r[2] = 1'b1;
          6'h15: out_r[2] = 1'b1;
          6'h18: out_r[2] = 1'b1;
          6'h19: out_r[2] = 1'b1;
          6'h1c: out_r[2] = 1'b1;
          6'h1d: out_r[2] = 1'b1;
          6'h20: out_r[2] = 1'b1;
          6'h24: out_r[2] = 1'b1;
          6'h29: out_r[2] = 1'b1;
          6'h2c: out_r[2] = 1'b1;
          6'h2d: out_r[2] = 1'b1;
          6'h31: out_r[2] = 1'b1;
          6'h33: out_r[2] = 1'b1;
          6'h34: out_r[2] = 1'b1;
          6'h37: out_r[2] = 1'b1;
          6'h38: out_r[2] = 1'b1;
          6'h39: out_r[2] = 1'b1;
          6'h3a: out_r[2] = 1'b1;
          6'h3b: out_r[2] = 1'b1;
          6'h3c: out_r[2] = 1'b1;
          6'h3d: out_r[2] = 1'b1;
          6'h3f: out_r[2] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[3] = 1'b0;
          6'h09: out_r[3] = 1'b0;
          6'h0e: out_r[3] = 1'b0;
          6'h0f: out_r[3] = 1'b0;
          6'h14: out_r[3] = 1'b0;
          6'h18: out_r[3] = 1'b0;
          6'h1e: out_r[3] = 1'b0;
          6'h1f: out_r[3] = 1'b0;
          6'h20: out_r[3] = 1'b0;
          6'h24: out_r[3] = 1'b0;
          6'h29: out_r[3] = 1'b0;
          6'h2c: out_r[3] = 1'b0;
          6'h2e: out_r[3] = 1'b0;
          6'h2f: out_r[3] = 1'b0;
          6'h31: out_r[3] = 1'b0;
          6'h33: out_r[3] = 1'b0;
          6'h34: out_r[3] = 1'b0;
          6'h37: out_r[3] = 1'b0;
          6'h38: out_r[3] = 1'b0;
          6'h39: out_r[3] = 1'b0;
          6'h3a: out_r[3] = 1'b0;
          6'h3b: out_r[3] = 1'b0;
          6'h3c: out_r[3] = 1'b0;
          6'h3f: out_r[3] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[4] = 1'b0;
          6'h0b: out_r[4] = 1'b0;
          6'h0c: out_r[4] = 1'b0;
          6'h0d: out_r[4] = 1'b0;
          6'h0f: out_r[4] = 1'b0;
          6'h14: out_r[4] = 1'b0;
          6'h18: out_r[4] = 1'b0;
          6'h19: out_r[4] = 1'b0;
          6'h1a: out_r[4] = 1'b0;
          6'h1b: out_r[4] = 1'b0;
          6'h1c: out_r[4] = 1'b0;
          6'h1f: out_r[4] = 1'b0;
          6'h20: out_r[4] = 1'b0;
          6'h24: out_r[4] = 1'b0;
          6'h2a: out_r[4] = 1'b0;
          6'h2b: out_r[4] = 1'b0;
          6'h2c: out_r[4] = 1'b0;
          6'h2d: out_r[4] = 1'b0;
          6'h2e: out_r[4] = 1'b0;
          6'h2f: out_r[4] = 1'b0;
          6'h31: out_r[4] = 1'b0;
          6'h33: out_r[4] = 1'b0;
          6'h34: out_r[4] = 1'b0;
          6'h37: out_r[4] = 1'b0;
          6'h38: out_r[4] = 1'b0;
          6'h39: out_r[4] = 1'b0;
          6'h3a: out_r[4] = 1'b0;
          6'h3b: out_r[4] = 1'b0;
          6'h3c: out_r[4] = 1'b0;
          6'h3d: out_r[4] = 1'b0;
          6'h3f: out_r[4] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h08: out_r[5] = 1'b0;
          6'h09: out_r[5] = 1'b0;
          6'h0e: out_r[5] = 1'b0;
          6'h15: out_r[5] = 1'b0;
          6'h18: out_r[5] = 1'b0;
          6'h1d: out_r[5] = 1'b0;
          6'h20: out_r[5] = 1'b0;
          6'h29: out_r[5] = 1'b0;
          6'h2c: out_r[5] = 1'b0;
          6'h35: out_r[5] = 1'b0;
          6'h38: out_r[5] = 1'b0;
          6'h39: out_r[5] = 1'b0;
          6'h3a: out_r[5] = 1'b0;
          6'h3b: out_r[5] = 1'b0;
          6'h3c: out_r[5] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h04: out_r[6] = 1'b0;
          6'h08: out_r[6] = 1'b0;
          6'h09: out_r[6] = 1'b0;
          6'h0e: out_r[6] = 1'b0;
          6'h15: out_r[6] = 1'b0;
          6'h1d: out_r[6] = 1'b0;
          6'h20: out_r[6] = 1'b0;
          6'h22: out_r[6] = 1'b0;
          6'h26: out_r[6] = 1'b0;
          6'h29: out_r[6] = 1'b0;
          6'h2c: out_r[6] = 1'b0;
          6'h34: out_r[6] = 1'b0;
          6'h3c: out_r[6] = 1'b0;
          6'h3e: out_r[6] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h04: out_r[7] = 1'b1;
          6'h09: out_r[7] = 1'b1;
          6'h0b: out_r[7] = 1'b1;
          6'h0c: out_r[7] = 1'b1;
          6'h0d: out_r[7] = 1'b1;
          6'h0f: out_r[7] = 1'b1;
          6'h18: out_r[7] = 1'b1;
          6'h19: out_r[7] = 1'b1;
          6'h1b: out_r[7] = 1'b1;
          6'h1c: out_r[7] = 1'b1;
          6'h1f: out_r[7] = 1'b1;
          6'h20: out_r[7] = 1'b1;
          6'h22: out_r[7] = 1'b1;
          6'h26: out_r[7] = 1'b1;
          6'h29: out_r[7] = 1'b1;
          6'h2b: out_r[7] = 1'b1;
          6'h2d: out_r[7] = 1'b1;
          6'h2f: out_r[7] = 1'b1;
          6'h34: out_r[7] = 1'b1;
          6'h3c: out_r[7] = 1'b1;
          6'h3e: out_r[7] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[8] = 1'b1;
          6'h04: out_r[8] = 1'b1;
          6'h08: out_r[8] = 1'b1;
          6'h09: out_r[8] = 1'b1;
          6'h0a: out_r[8] = 1'b1;
          6'h0e: out_r[8] = 1'b1;
          6'h14: out_r[8] = 1'b1;
          6'h18: out_r[8] = 1'b1;
          6'h19: out_r[8] = 1'b1;
          6'h1d: out_r[8] = 1'b1;
          6'h20: out_r[8] = 1'b1;
          6'h22: out_r[8] = 1'b1;
          6'h26: out_r[8] = 1'b1;
          6'h29: out_r[8] = 1'b1;
          6'h2c: out_r[8] = 1'b1;
          6'h31: out_r[8] = 1'b1;
          6'h34: out_r[8] = 1'b1;
          6'h35: out_r[8] = 1'b1;
          6'h3a: out_r[8] = 1'b1;
          6'h3c: out_r[8] = 1'b1;
          6'h3e: out_r[8] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h04: out_r[9] = 1'b1;
          6'h05: out_r[9] = 1'b1;
          6'h0e: out_r[9] = 1'b1;
          6'h13: out_r[9] = 1'b1;
          6'h17: out_r[9] = 1'b1;
          6'h1b: out_r[9] = 1'b1;
          6'h1c: out_r[9] = 1'b1;
          6'h1f: out_r[9] = 1'b1;
          6'h20: out_r[9] = 1'b1;
          6'h22: out_r[9] = 1'b1;
          6'h24: out_r[9] = 1'b1;
          6'h25: out_r[9] = 1'b1;
          6'h26: out_r[9] = 1'b1;
          6'h2c: out_r[9] = 1'b1;
          6'h33: out_r[9] = 1'b1;
          6'h34: out_r[9] = 1'b1;
          6'h37: out_r[9] = 1'b1;
          6'h38: out_r[9] = 1'b1;
          6'h39: out_r[9] = 1'b1;
          6'h3b: out_r[9] = 1'b1;
          6'h3c: out_r[9] = 1'b1;
          6'h3e: out_r[9] = 1'b1;
          6'h3f: out_r[9] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h02: out_r[10] = 1'b0;
          6'h03: out_r[10] = 1'b0;
          6'h05: out_r[10] = 1'b0;
          6'h06: out_r[10] = 1'b0;
          6'h07: out_r[10] = 1'b0;
          6'h0a: out_r[10] = 1'b0;
          6'h0b: out_r[10] = 1'b0;
          6'h0c: out_r[10] = 1'b0;
          6'h0f: out_r[10] = 1'b0;
          6'h13: out_r[10] = 1'b0;
          6'h17: out_r[10] = 1'b0;
          6'h19: out_r[10] = 1'b0;
          6'h1b: out_r[10] = 1'b0;
          6'h1c: out_r[10] = 1'b0;
          6'h1f: out_r[10] = 1'b0;
          6'h23: out_r[10] = 1'b0;
          6'h24: out_r[10] = 1'b0;
          6'h25: out_r[10] = 1'b0;
          6'h27: out_r[10] = 1'b0;
          6'h28: out_r[10] = 1'b0;
          6'h2b: out_r[10] = 1'b0;
          6'h2c: out_r[10] = 1'b0;
          6'h2f: out_r[10] = 1'b0;
          6'h33: out_r[10] = 1'b0;
          6'h34: out_r[10] = 1'b0;
          6'h37: out_r[10] = 1'b0;
          6'h38: out_r[10] = 1'b0;
          6'h39: out_r[10] = 1'b0;
          6'h3b: out_r[10] = 1'b0;
          6'h3c: out_r[10] = 1'b0;
          6'h3f: out_r[10] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h02: out_r[11] = 1'b0;
          6'h05: out_r[11] = 1'b0;
          6'h06: out_r[11] = 1'b0;
          6'h08: out_r[11] = 1'b0;
          6'h09: out_r[11] = 1'b0;
          6'h0c: out_r[11] = 1'b0;
          6'h0d: out_r[11] = 1'b0;
          6'h15: out_r[11] = 1'b0;
          6'h18: out_r[11] = 1'b0;
          6'h1a: out_r[11] = 1'b0;
          6'h1c: out_r[11] = 1'b0;
          6'h1d: out_r[11] = 1'b0;
          6'h20: out_r[11] = 1'b0;
          6'h24: out_r[11] = 1'b0;
          6'h25: out_r[11] = 1'b0;
          6'h28: out_r[11] = 1'b0;
          6'h29: out_r[11] = 1'b0;
          6'h2a: out_r[11] = 1'b0;
          6'h2c: out_r[11] = 1'b0;
          6'h2d: out_r[11] = 1'b0;
          6'h2e: out_r[11] = 1'b0;
          6'h35: out_r[11] = 1'b0;
          6'h39: out_r[11] = 1'b0;
          6'h3c: out_r[11] = 1'b0;
          6'h3d: out_r[11] = 1'b0;
          default: begin end
        endcase
      end
      6'h10: begin
        out_r = 12'h104;
        case (inner)
          6'h08: out_r[0] = 1'b1;
          6'h09: out_r[0] = 1'b1;
          6'h0a: out_r[0] = 1'b1;
          6'h0c: out_r[0] = 1'b1;
          6'h0d: out_r[0] = 1'b1;
          6'h0f: out_r[0] = 1'b1;
          6'h11: out_r[0] = 1'b1;
          6'h13: out_r[0] = 1'b1;
          6'h15: out_r[0] = 1'b1;
          6'h17: out_r[0] = 1'b1;
          6'h19: out_r[0] = 1'b1;
          6'h1b: out_r[0] = 1'b1;
          6'h1f: out_r[0] = 1'b1;
          6'h28: out_r[0] = 1'b1;
          6'h29: out_r[0] = 1'b1;
          6'h2a: out_r[0] = 1'b1;
          6'h2c: out_r[0] = 1'b1;
          6'h2d: out_r[0] = 1'b1;
          6'h2f: out_r[0] = 1'b1;
          6'h31: out_r[0] = 1'b1;
          6'h33: out_r[0] = 1'b1;
          6'h35: out_r[0] = 1'b1;
          6'h37: out_r[0] = 1'b1;
          6'h39: out_r[0] = 1'b1;
          6'h3b: out_r[0] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h01: out_r[1] = 1'b1;
          6'h03: out_r[1] = 1'b1;
          6'h05: out_r[1] = 1'b1;
          6'h07: out_r[1] = 1'b1;
          6'h0e: out_r[1] = 1'b1;
          6'h0f: out_r[1] = 1'b1;
          6'h11: out_r[1] = 1'b1;
          6'h13: out_r[1] = 1'b1;
          6'h15: out_r[1] = 1'b1;
          6'h17: out_r[1] = 1'b1;
          6'h19: out_r[1] = 1'b1;
          6'h1b: out_r[1] = 1'b1;
          6'h1c: out_r[1] = 1'b1;
          6'h1f: out_r[1] = 1'b1;
          6'h21: out_r[1] = 1'b1;
          6'h23: out_r[1] = 1'b1;
          6'h25: out_r[1] = 1'b1;
          6'h27: out_r[1] = 1'b1;
          6'h2e: out_r[1] = 1'b1;
          6'h2f: out_r[1] = 1'b1;
          6'h31: out_r[1] = 1'b1;
          6'h33: out_r[1] = 1'b1;
          6'h35: out_r[1] = 1'b1;
          6'h37: out_r[1] = 1'b1;
          6'h39: out_r[1] = 1'b1;
          6'h3b: out_r[1] = 1'b1;
          6'h3e: out_r[1] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[2] = 1'b0;
          6'h01: out_r[2] = 1'b0;
          6'h02: out_r[2] = 1'b0;
          6'h03: out_r[2] = 1'b0;
          6'h04: out_r[2] = 1'b0;
          6'h05: out_r[2] = 1'b0;
          6'h06: out_r[2] = 1'b0;
          6'h07: out_r[2] = 1'b0;
          6'h0e: out_r[2] = 1'b0;
          6'h0f: out_r[2] = 1'b0;
          6'h12: out_r[2] = 1'b0;
          6'h16: out_r[2] = 1'b0;
          6'h1a: out_r[2] = 1'b0;
          6'h1e: out_r[2] = 1'b0;
          6'h1f: out_r[2] = 1'b0;
          6'h20: out_r[2] = 1'b0;
          6'h21: out_r[2] = 1'b0;
          6'h22: out_r[2] = 1'b0;
          6'h23: out_r[2] = 1'b0;
          6'h24: out_r[2] = 1'b0;
          6'h25: out_r[2] = 1'b0;
          6'h26: out_r[2] = 1'b0;
          6'h27: out_r[2] = 1'b0;
          6'h2e: out_r[2] = 1'b0;
          6'h2f: out_r[2] = 1'b0;
          6'h3e: out_r[2] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h02: out_r[3] = 1'b1;
          6'h03: out_r[3] = 1'b1;
          6'h06: out_r[3] = 1'b1;
          6'h07: out_r[3] = 1'b1;
          6'h10: out_r[3] = 1'b1;
          6'h11: out_r[3] = 1'b1;
          6'h13: out_r[3] = 1'b1;
          6'h14: out_r[3] = 1'b1;
          6'h15: out_r[3] = 1'b1;
          6'h17: out_r[3] = 1'b1;
          6'h18: out_r[3] = 1'b1;
          6'h19: out_r[3] = 1'b1;
          6'h1b: out_r[3] = 1'b1;
          6'h22: out_r[3] = 1'b1;
          6'h23: out_r[3] = 1'b1;
          6'h26: out_r[3] = 1'b1;
          6'h27: out_r[3] = 1'b1;
          6'h30: out_r[3] = 1'b1;
          6'h31: out_r[3] = 1'b1;
          6'h32: out_r[3] = 1'b1;
          6'h33: out_r[3] = 1'b1;
          6'h34: out_r[3] = 1'b1;
          6'h35: out_r[3] = 1'b1;
          6'h36: out_r[3] = 1'b1;
          6'h37: out_r[3] = 1'b1;
          6'h38: out_r[3] = 1'b1;
          6'h39: out_r[3] = 1'b1;
          6'h3a: out_r[3] = 1'b1;
          6'h3b: out_r[3] = 1'b1;
          6'h3c: out_r[3] = 1'b1;
          6'h3f: out_r[3] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h08: out_r[4] = 1'b1;
          6'h09: out_r[4] = 1'b1;
          6'h0a: out_r[4] = 1'b1;
          6'h0b: out_r[4] = 1'b1;
          6'h0c: out_r[4] = 1'b1;
          6'h0d: out_r[4] = 1'b1;
          6'h0e: out_r[4] = 1'b1;
          6'h0f: out_r[4] = 1'b1;
          6'h1c: out_r[4] = 1'b1;
          6'h1d: out_r[4] = 1'b1;
          6'h1e: out_r[4] = 1'b1;
          6'h1f: out_r[4] = 1'b1;
          6'h28: out_r[4] = 1'b1;
          6'h29: out_r[4] = 1'b1;
          6'h2a: out_r[4] = 1'b1;
          6'h2b: out_r[4] = 1'b1;
          6'h2c: out_r[4] = 1'b1;
          6'h2d: out_r[4] = 1'b1;
          6'h2e: out_r[4] = 1'b1;
          6'h2f: out_r[4] = 1'b1;
          6'h3c: out_r[4] = 1'b1;
          6'h3d: out_r[4] = 1'b1;
          6'h3e: out_r[4] = 1'b1;
          6'h3f: out_r[4] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h04: out_r[5] = 1'b1;
          6'h05: out_r[5] = 1'b1;
          6'h06: out_r[5] = 1'b1;
          6'h07: out_r[5] = 1'b1;
          6'h0d: out_r[5] = 1'b1;
          6'h13: out_r[5] = 1'b1;
          6'h14: out_r[5] = 1'b1;
          6'h15: out_r[5] = 1'b1;
          6'h17: out_r[5] = 1'b1;
          6'h1b: out_r[5] = 1'b1;
          6'h1c: out_r[5] = 1'b1;
          6'h1d: out_r[5] = 1'b1;
          6'h1e: out_r[5] = 1'b1;
          6'h1f: out_r[5] = 1'b1;
          6'h24: out_r[5] = 1'b1;
          6'h25: out_r[5] = 1'b1;
          6'h26: out_r[5] = 1'b1;
          6'h27: out_r[5] = 1'b1;
          6'h2a: out_r[5] = 1'b1;
          6'h2c: out_r[5] = 1'b1;
          6'h32: out_r[5] = 1'b1;
          6'h34: out_r[5] = 1'b1;
          6'h36: out_r[5] = 1'b1;
          6'h3a: out_r[5] = 1'b1;
          6'h3c: out_r[5] = 1'b1;
          6'h3d: out_r[5] = 1'b1;
          6'h3e: out_r[5] = 1'b1;
          6'h3f: out_r[5] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h08: out_r[6] = 1'b1;
          6'h09: out_r[6] = 1'b1;
          6'h0a: out_r[6] = 1'b1;
          6'h0b: out_r[6] = 1'b1;
          6'h0c: out_r[6] = 1'b1;
          6'h0d: out_r[6] = 1'b1;
          6'h0e: out_r[6] = 1'b1;
          6'h0f: out_r[6] = 1'b1;
          6'h1e: out_r[6] = 1'b1;
          6'h28: out_r[6] = 1'b1;
          6'h29: out_r[6] = 1'b1;
          6'h2a: out_r[6] = 1'b1;
          6'h2b: out_r[6] = 1'b1;
          6'h2c: out_r[6] = 1'b1;
          6'h2d: out_r[6] = 1'b1;
          6'h2e: out_r[6] = 1'b1;
          6'h2f: out_r[6] = 1'b1;
          6'h33: out_r[6] = 1'b1;
          6'h35: out_r[6] = 1'b1;
          6'h37: out_r[6] = 1'b1;
          6'h3b: out_r[6] = 1'b1;
          6'h3c: out_r[6] = 1'b1;
          6'h3e: out_r[6] = 1'b1;
          6'h3f: out_r[6] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h09: out_r[7] = 1'b1;
          6'h0a: out_r[7] = 1'b1;
          6'h0c: out_r[7] = 1'b1;
          6'h0d: out_r[7] = 1'b1;
          6'h13: out_r[7] = 1'b1;
          6'h17: out_r[7] = 1'b1;
          6'h1b: out_r[7] = 1'b1;
          6'h1e: out_r[7] = 1'b1;
          6'h28: out_r[7] = 1'b1;
          6'h2a: out_r[7] = 1'b1;
          6'h2c: out_r[7] = 1'b1;
          6'h3c: out_r[7] = 1'b1;
          6'h3e: out_r[7] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h09: out_r[8] = 1'b0;
          6'h0a: out_r[8] = 1'b0;
          6'h0c: out_r[8] = 1'b0;
          6'h12: out_r[8] = 1'b0;
          6'h13: out_r[8] = 1'b0;
          6'h16: out_r[8] = 1'b0;
          6'h17: out_r[8] = 1'b0;
          6'h1a: out_r[8] = 1'b0;
          6'h1b: out_r[8] = 1'b0;
          6'h1d: out_r[8] = 1'b0;
          6'h1e: out_r[8] = 1'b0;
          6'h28: out_r[8] = 1'b0;
          6'h2b: out_r[8] = 1'b0;
          6'h2f: out_r[8] = 1'b0;
          6'h32: out_r[8] = 1'b0;
          6'h34: out_r[8] = 1'b0;
          6'h3a: out_r[8] = 1'b0;
          6'h3c: out_r[8] = 1'b0;
          6'h3e: out_r[8] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h08: out_r[9] = 1'b1;
          6'h09: out_r[9] = 1'b1;
          6'h0a: out_r[9] = 1'b1;
          6'h0c: out_r[9] = 1'b1;
          6'h0d: out_r[9] = 1'b1;
          6'h10: out_r[9] = 1'b1;
          6'h11: out_r[9] = 1'b1;
          6'h14: out_r[9] = 1'b1;
          6'h15: out_r[9] = 1'b1;
          6'h18: out_r[9] = 1'b1;
          6'h19: out_r[9] = 1'b1;
          6'h1c: out_r[9] = 1'b1;
          6'h1d: out_r[9] = 1'b1;
          6'h1e: out_r[9] = 1'b1;
          6'h28: out_r[9] = 1'b1;
          6'h2a: out_r[9] = 1'b1;
          6'h2b: out_r[9] = 1'b1;
          6'h2c: out_r[9] = 1'b1;
          6'h2f: out_r[9] = 1'b1;
          6'h30: out_r[9] = 1'b1;
          6'h31: out_r[9] = 1'b1;
          6'h38: out_r[9] = 1'b1;
          6'h39: out_r[9] = 1'b1;
          6'h3c: out_r[9] = 1'b1;
          6'h3e: out_r[9] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h08: out_r[10] = 1'b1;
          6'h09: out_r[10] = 1'b1;
          6'h0a: out_r[10] = 1'b1;
          6'h0c: out_r[10] = 1'b1;
          6'h0d: out_r[10] = 1'b1;
          6'h15: out_r[10] = 1'b1;
          6'h17: out_r[10] = 1'b1;
          6'h1d: out_r[10] = 1'b1;
          6'h1e: out_r[10] = 1'b1;
          6'h28: out_r[10] = 1'b1;
          6'h2a: out_r[10] = 1'b1;
          6'h2b: out_r[10] = 1'b1;
          6'h2c: out_r[10] = 1'b1;
          6'h2f: out_r[10] = 1'b1;
          6'h31: out_r[10] = 1'b1;
          6'h33: out_r[10] = 1'b1;
          6'h35: out_r[10] = 1'b1;
          6'h37: out_r[10] = 1'b1;
          6'h39: out_r[10] = 1'b1;
          6'h3b: out_r[10] = 1'b1;
          6'h3c: out_r[10] = 1'b1;
          6'h3e: out_r[10] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h0b: out_r[11] = 1'b1;
          6'h14: out_r[11] = 1'b1;
          6'h15: out_r[11] = 1'b1;
          6'h17: out_r[11] = 1'b1;
          6'h1c: out_r[11] = 1'b1;
          6'h1d: out_r[11] = 1'b1;
          6'h1e: out_r[11] = 1'b1;
          6'h20: out_r[11] = 1'b1;
          6'h21: out_r[11] = 1'b1;
          6'h22: out_r[11] = 1'b1;
          6'h23: out_r[11] = 1'b1;
          6'h24: out_r[11] = 1'b1;
          6'h25: out_r[11] = 1'b1;
          6'h26: out_r[11] = 1'b1;
          6'h27: out_r[11] = 1'b1;
          6'h2b: out_r[11] = 1'b1;
          6'h2e: out_r[11] = 1'b1;
          6'h2f: out_r[11] = 1'b1;
          6'h30: out_r[11] = 1'b1;
          6'h32: out_r[11] = 1'b1;
          6'h38: out_r[11] = 1'b1;
          6'h3a: out_r[11] = 1'b1;
          6'h3c: out_r[11] = 1'b1;
          6'h3e: out_r[11] = 1'b1;
          6'h3f: out_r[11] = 1'b1;
          default: begin end
        endcase
      end
      6'h11: begin
        out_r = 12'h150;
        case (inner)
          6'h00: out_r[0] = 1'b1;
          6'h01: out_r[0] = 1'b1;
          6'h02: out_r[0] = 1'b1;
          6'h03: out_r[0] = 1'b1;
          6'h04: out_r[0] = 1'b1;
          6'h05: out_r[0] = 1'b1;
          6'h06: out_r[0] = 1'b1;
          6'h07: out_r[0] = 1'b1;
          6'h08: out_r[0] = 1'b1;
          6'h0e: out_r[0] = 1'b1;
          6'h12: out_r[0] = 1'b1;
          6'h16: out_r[0] = 1'b1;
          6'h17: out_r[0] = 1'b1;
          6'h1a: out_r[0] = 1'b1;
          6'h1c: out_r[0] = 1'b1;
          6'h1d: out_r[0] = 1'b1;
          6'h1e: out_r[0] = 1'b1;
          6'h20: out_r[0] = 1'b1;
          6'h24: out_r[0] = 1'b1;
          6'h29: out_r[0] = 1'b1;
          6'h2a: out_r[0] = 1'b1;
          6'h2c: out_r[0] = 1'b1;
          6'h2d: out_r[0] = 1'b1;
          6'h30: out_r[0] = 1'b1;
          6'h32: out_r[0] = 1'b1;
          6'h34: out_r[0] = 1'b1;
          6'h37: out_r[0] = 1'b1;
          6'h38: out_r[0] = 1'b1;
          6'h3a: out_r[0] = 1'b1;
          6'h3d: out_r[0] = 1'b1;
          6'h3e: out_r[0] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h01: out_r[1] = 1'b1;
          6'h03: out_r[1] = 1'b1;
          6'h05: out_r[1] = 1'b1;
          6'h07: out_r[1] = 1'b1;
          6'h08: out_r[1] = 1'b1;
          6'h0a: out_r[1] = 1'b1;
          6'h0b: out_r[1] = 1'b1;
          6'h0c: out_r[1] = 1'b1;
          6'h10: out_r[1] = 1'b1;
          6'h14: out_r[1] = 1'b1;
          6'h15: out_r[1] = 1'b1;
          6'h18: out_r[1] = 1'b1;
          6'h1d: out_r[1] = 1'b1;
          6'h1f: out_r[1] = 1'b1;
          6'h22: out_r[1] = 1'b1;
          6'h23: out_r[1] = 1'b1;
          6'h26: out_r[1] = 1'b1;
          6'h28: out_r[1] = 1'b1;
          6'h2b: out_r[1] = 1'b1;
          6'h2d: out_r[1] = 1'b1;
          6'h2e: out_r[1] = 1'b1;
          6'h35: out_r[1] = 1'b1;
          6'h36: out_r[1] = 1'b1;
          6'h3c: out_r[1] = 1'b1;
          6'h3d: out_r[1] = 1'b1;
          6'h3f: out_r[1] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h08: out_r[2] = 1'b1;
          6'h09: out_r[2] = 1'b1;
          6'h0a: out_r[2] = 1'b1;
          6'h0b: out_r[2] = 1'b1;
          6'h0c: out_r[2] = 1'b1;
          6'h0d: out_r[2] = 1'b1;
          6'h10: out_r[2] = 1'b1;
          6'h11: out_r[2] = 1'b1;
          6'h14: out_r[2] = 1'b1;
          6'h15: out_r[2] = 1'b1;
          6'h18: out_r[2] = 1'b1;
          6'h19: out_r[2] = 1'b1;
          6'h1c: out_r[2] = 1'b1;
          6'h1f: out_r[2] = 1'b1;
          6'h21: out_r[2] = 1'b1;
          6'h22: out_r[2] = 1'b1;
          6'h23: out_r[2] = 1'b1;
          6'h25: out_r[2] = 1'b1;
          6'h26: out_r[2] = 1'b1;
          6'h28: out_r[2] = 1'b1;
          6'h2b: out_r[2] = 1'b1;
          6'h2e: out_r[2] = 1'b1;
          6'h31: out_r[2] = 1'b1;
          6'h35: out_r[2] = 1'b1;
          6'h36: out_r[2] = 1'b1;
          6'h39: out_r[2] = 1'b1;
          6'h3c: out_r[2] = 1'b1;
          6'h3e: out_r[2] = 1'b1;
          6'h3f: out_r[2] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h02: out_r[3] = 1'b1;
          6'h03: out_r[3] = 1'b1;
          6'h06: out_r[3] = 1'b1;
          6'h07: out_r[3] = 1'b1;
          6'h0b: out_r[3] = 1'b1;
          6'h10: out_r[3] = 1'b1;
          6'h14: out_r[3] = 1'b1;
          6'h18: out_r[3] = 1'b1;
          6'h1d: out_r[3] = 1'b1;
          6'h1f: out_r[3] = 1'b1;
          6'h22: out_r[3] = 1'b1;
          6'h24: out_r[3] = 1'b1;
          6'h26: out_r[3] = 1'b1;
          6'h28: out_r[3] = 1'b1;
          6'h2a: out_r[3] = 1'b1;
          6'h2b: out_r[3] = 1'b1;
          6'h2d: out_r[3] = 1'b1;
          6'h2e: out_r[3] = 1'b1;
          6'h30: out_r[3] = 1'b1;
          6'h36: out_r[3] = 1'b1;
          6'h38: out_r[3] = 1'b1;
          6'h3c: out_r[3] = 1'b1;
          6'h3d: out_r[3] = 1'b1;
          6'h3f: out_r[3] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[4] = 1'b0;
          6'h01: out_r[4] = 1'b0;
          6'h02: out_r[4] = 1'b0;
          6'h03: out_r[4] = 1'b0;
          6'h04: out_r[4] = 1'b0;
          6'h05: out_r[4] = 1'b0;
          6'h06: out_r[4] = 1'b0;
          6'h07: out_r[4] = 1'b0;
          6'h10: out_r[4] = 1'b0;
          6'h12: out_r[4] = 1'b0;
          6'h14: out_r[4] = 1'b0;
          6'h16: out_r[4] = 1'b0;
          6'h18: out_r[4] = 1'b0;
          6'h1a: out_r[4] = 1'b0;
          6'h1d: out_r[4] = 1'b0;
          6'h1f: out_r[4] = 1'b0;
          6'h24: out_r[4] = 1'b0;
          6'h26: out_r[4] = 1'b0;
          6'h2d: out_r[4] = 1'b0;
          6'h2f: out_r[4] = 1'b0;
          6'h34: out_r[4] = 1'b0;
          6'h36: out_r[4] = 1'b0;
          6'h3d: out_r[4] = 1'b0;
          6'h3f: out_r[4] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h04: out_r[5] = 1'b1;
          6'h05: out_r[5] = 1'b1;
          6'h06: out_r[5] = 1'b1;
          6'h07: out_r[5] = 1'b1;
          6'h0b: out_r[5] = 1'b1;
          6'h14: out_r[5] = 1'b1;
          6'h16: out_r[5] = 1'b1;
          6'h1c: out_r[5] = 1'b1;
          6'h1e: out_r[5] = 1'b1;
          6'h20: out_r[5] = 1'b1;
          6'h22: out_r[5] = 1'b1;
          6'h24: out_r[5] = 1'b1;
          6'h26: out_r[5] = 1'b1;
          6'h2b: out_r[5] = 1'b1;
          6'h2c: out_r[5] = 1'b1;
          6'h2e: out_r[5] = 1'b1;
          6'h3c: out_r[5] = 1'b1;
          6'h3e: out_r[5] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[6] = 1'b0;
          6'h01: out_r[6] = 1'b0;
          6'h02: out_r[6] = 1'b0;
          6'h03: out_r[6] = 1'b0;
          6'h04: out_r[6] = 1'b0;
          6'h05: out_r[6] = 1'b0;
          6'h06: out_r[6] = 1'b0;
          6'h07: out_r[6] = 1'b0;
          6'h10: out_r[6] = 1'b0;
          6'h12: out_r[6] = 1'b0;
          6'h14: out_r[6] = 1'b0;
          6'h16: out_r[6] = 1'b0;
          6'h18: out_r[6] = 1'b0;
          6'h1a: out_r[6] = 1'b0;
          6'h1c: out_r[6] = 1'b0;
          6'h1e: out_r[6] = 1'b0;
          6'h2b: out_r[6] = 1'b0;
          6'h2d: out_r[6] = 1'b0;
          6'h2f: out_r[6] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h28: out_r[7] = 1'b1;
          6'h29: out_r[7] = 1'b1;
          6'h2a: out_r[7] = 1'b1;
          6'h2b: out_r[7] = 1'b1;
          6'h2c: out_r[7] = 1'b1;
          6'h2e: out_r[7] = 1'b1;
          6'h30: out_r[7] = 1'b1;
          6'h32: out_r[7] = 1'b1;
          6'h34: out_r[7] = 1'b1;
          6'h36: out_r[7] = 1'b1;
          6'h38: out_r[7] = 1'b1;
          6'h3a: out_r[7] = 1'b1;
          6'h3c: out_r[7] = 1'b1;
          6'h3e: out_r[7] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h08: out_r[8] = 1'b0;
          6'h0d: out_r[8] = 1'b0;
          6'h13: out_r[8] = 1'b0;
          6'h15: out_r[8] = 1'b0;
          6'h1b: out_r[8] = 1'b0;
          6'h23: out_r[8] = 1'b0;
          6'h25: out_r[8] = 1'b0;
          6'h29: out_r[8] = 1'b0;
          6'h2b: out_r[8] = 1'b0;
          6'h2f: out_r[8] = 1'b0;
          6'h30: out_r[8] = 1'b0;
          6'h32: out_r[8] = 1'b0;
          6'h33: out_r[8] = 1'b0;
          6'h34: out_r[8] = 1'b0;
          6'h35: out_r[8] = 1'b0;
          6'h36: out_r[8] = 1'b0;
          6'h38: out_r[8] = 1'b0;
          6'h3a: out_r[8] = 1'b0;
          6'h3b: out_r[8] = 1'b0;
          6'h3c: out_r[8] = 1'b0;
          6'h3e: out_r[8] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h08: out_r[9] = 1'b1;
          6'h0d: out_r[9] = 1'b1;
          6'h10: out_r[9] = 1'b1;
          6'h12: out_r[9] = 1'b1;
          6'h13: out_r[9] = 1'b1;
          6'h14: out_r[9] = 1'b1;
          6'h15: out_r[9] = 1'b1;
          6'h16: out_r[9] = 1'b1;
          6'h18: out_r[9] = 1'b1;
          6'h1a: out_r[9] = 1'b1;
          6'h1b: out_r[9] = 1'b1;
          6'h1c: out_r[9] = 1'b1;
          6'h1e: out_r[9] = 1'b1;
          6'h20: out_r[9] = 1'b1;
          6'h22: out_r[9] = 1'b1;
          6'h23: out_r[9] = 1'b1;
          6'h24: out_r[9] = 1'b1;
          6'h25: out_r[9] = 1'b1;
          6'h26: out_r[9] = 1'b1;
          6'h28: out_r[9] = 1'b1;
          6'h29: out_r[9] = 1'b1;
          6'h2a: out_r[9] = 1'b1;
          6'h2b: out_r[9] = 1'b1;
          6'h2c: out_r[9] = 1'b1;
          6'h2e: out_r[9] = 1'b1;
          6'h33: out_r[9] = 1'b1;
          6'h35: out_r[9] = 1'b1;
          6'h3b: out_r[9] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h08: out_r[10] = 1'b1;
          6'h0d: out_r[10] = 1'b1;
          6'h13: out_r[10] = 1'b1;
          6'h15: out_r[10] = 1'b1;
          6'h1b: out_r[10] = 1'b1;
          6'h20: out_r[10] = 1'b1;
          6'h22: out_r[10] = 1'b1;
          6'h23: out_r[10] = 1'b1;
          6'h24: out_r[10] = 1'b1;
          6'h25: out_r[10] = 1'b1;
          6'h26: out_r[10] = 1'b1;
          6'h28: out_r[10] = 1'b1;
          6'h29: out_r[10] = 1'b1;
          6'h2a: out_r[10] = 1'b1;
          6'h2b: out_r[10] = 1'b1;
          6'h2c: out_r[10] = 1'b1;
          6'h2e: out_r[10] = 1'b1;
          6'h30: out_r[10] = 1'b1;
          6'h32: out_r[10] = 1'b1;
          6'h33: out_r[10] = 1'b1;
          6'h34: out_r[10] = 1'b1;
          6'h35: out_r[10] = 1'b1;
          6'h36: out_r[10] = 1'b1;
          6'h38: out_r[10] = 1'b1;
          6'h3a: out_r[10] = 1'b1;
          6'h3b: out_r[10] = 1'b1;
          6'h3c: out_r[10] = 1'b1;
          6'h3e: out_r[10] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h08: out_r[11] = 1'b1;
          6'h0d: out_r[11] = 1'b1;
          6'h11: out_r[11] = 1'b1;
          6'h13: out_r[11] = 1'b1;
          6'h15: out_r[11] = 1'b1;
          6'h19: out_r[11] = 1'b1;
          6'h1b: out_r[11] = 1'b1;
          6'h25: out_r[11] = 1'b1;
          6'h31: out_r[11] = 1'b1;
          6'h33: out_r[11] = 1'b1;
          6'h35: out_r[11] = 1'b1;
          6'h39: out_r[11] = 1'b1;
          6'h3b: out_r[11] = 1'b1;
          default: begin end
        endcase
      end
      6'h12: begin
        out_r = 12'h104;
        case (inner)
          6'h01: out_r[0] = 1'b1;
          6'h05: out_r[0] = 1'b1;
          6'h11: out_r[0] = 1'b1;
          6'h15: out_r[0] = 1'b1;
          6'h19: out_r[0] = 1'b1;
          6'h1c: out_r[0] = 1'b1;
          6'h1d: out_r[0] = 1'b1;
          6'h1e: out_r[0] = 1'b1;
          6'h1f: out_r[0] = 1'b1;
          6'h21: out_r[0] = 1'b1;
          6'h23: out_r[0] = 1'b1;
          6'h25: out_r[0] = 1'b1;
          6'h27: out_r[0] = 1'b1;
          6'h29: out_r[0] = 1'b1;
          6'h2b: out_r[0] = 1'b1;
          6'h2e: out_r[0] = 1'b1;
          6'h2f: out_r[0] = 1'b1;
          6'h31: out_r[0] = 1'b1;
          6'h33: out_r[0] = 1'b1;
          6'h35: out_r[0] = 1'b1;
          6'h39: out_r[0] = 1'b1;
          6'h3b: out_r[0] = 1'b1;
          6'h3c: out_r[0] = 1'b1;
          6'h3d: out_r[0] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h0a: out_r[1] = 1'b1;
          6'h0b: out_r[1] = 1'b1;
          6'h0c: out_r[1] = 1'b1;
          6'h0e: out_r[1] = 1'b1;
          6'h0f: out_r[1] = 1'b1;
          6'h1e: out_r[1] = 1'b1;
          6'h1f: out_r[1] = 1'b1;
          6'h2a: out_r[1] = 1'b1;
          6'h2c: out_r[1] = 1'b1;
          6'h2e: out_r[1] = 1'b1;
          6'h31: out_r[1] = 1'b1;
          6'h39: out_r[1] = 1'b1;
          6'h3c: out_r[1] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h01: out_r[2] = 1'b0;
          6'h09: out_r[2] = 1'b0;
          6'h0a: out_r[2] = 1'b0;
          6'h0b: out_r[2] = 1'b0;
          6'h0c: out_r[2] = 1'b0;
          6'h0e: out_r[2] = 1'b0;
          6'h0f: out_r[2] = 1'b0;
          6'h12: out_r[2] = 1'b0;
          6'h13: out_r[2] = 1'b0;
          6'h1a: out_r[2] = 1'b0;
          6'h1b: out_r[2] = 1'b0;
          6'h21: out_r[2] = 1'b0;
          6'h27: out_r[2] = 1'b0;
          6'h2a: out_r[2] = 1'b0;
          6'h2c: out_r[2] = 1'b0;
          6'h2d: out_r[2] = 1'b0;
          6'h2e: out_r[2] = 1'b0;
          6'h31: out_r[2] = 1'b0;
          6'h33: out_r[2] = 1'b0;
          6'h36: out_r[2] = 1'b0;
          6'h37: out_r[2] = 1'b0;
          6'h39: out_r[2] = 1'b0;
          6'h3b: out_r[2] = 1'b0;
          6'h3c: out_r[2] = 1'b0;
          6'h3e: out_r[2] = 1'b0;
          6'h3f: out_r[2] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h01: out_r[3] = 1'b1;
          6'h02: out_r[3] = 1'b1;
          6'h03: out_r[3] = 1'b1;
          6'h06: out_r[3] = 1'b1;
          6'h07: out_r[3] = 1'b1;
          6'h08: out_r[3] = 1'b1;
          6'h0c: out_r[3] = 1'b1;
          6'h1e: out_r[3] = 1'b1;
          6'h1f: out_r[3] = 1'b1;
          6'h21: out_r[3] = 1'b1;
          6'h22: out_r[3] = 1'b1;
          6'h26: out_r[3] = 1'b1;
          6'h27: out_r[3] = 1'b1;
          6'h28: out_r[3] = 1'b1;
          6'h2c: out_r[3] = 1'b1;
          6'h2e: out_r[3] = 1'b1;
          6'h32: out_r[3] = 1'b1;
          6'h33: out_r[3] = 1'b1;
          6'h3a: out_r[3] = 1'b1;
          6'h3b: out_r[3] = 1'b1;
          6'h3c: out_r[3] = 1'b1;
          6'h3e: out_r[3] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h01: out_r[4] = 1'b1;
          6'h08: out_r[4] = 1'b1;
          6'h0a: out_r[4] = 1'b1;
          6'h0b: out_r[4] = 1'b1;
          6'h0c: out_r[4] = 1'b1;
          6'h0e: out_r[4] = 1'b1;
          6'h0f: out_r[4] = 1'b1;
          6'h1e: out_r[4] = 1'b1;
          6'h1f: out_r[4] = 1'b1;
          6'h21: out_r[4] = 1'b1;
          6'h27: out_r[4] = 1'b1;
          6'h28: out_r[4] = 1'b1;
          6'h2a: out_r[4] = 1'b1;
          6'h2c: out_r[4] = 1'b1;
          6'h2e: out_r[4] = 1'b1;
          6'h2f: out_r[4] = 1'b1;
          6'h33: out_r[4] = 1'b1;
          6'h3b: out_r[4] = 1'b1;
          6'h3c: out_r[4] = 1'b1;
          6'h3d: out_r[4] = 1'b1;
          6'h3e: out_r[4] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h01: out_r[5] = 1'b1;
          6'h04: out_r[5] = 1'b1;
          6'h05: out_r[5] = 1'b1;
          6'h06: out_r[5] = 1'b1;
          6'h07: out_r[5] = 1'b1;
          6'h0e: out_r[5] = 1'b1;
          6'h0f: out_r[5] = 1'b1;
          6'h11: out_r[5] = 1'b1;
          6'h14: out_r[5] = 1'b1;
          6'h16: out_r[5] = 1'b1;
          6'h17: out_r[5] = 1'b1;
          6'h19: out_r[5] = 1'b1;
          6'h21: out_r[5] = 1'b1;
          6'h24: out_r[5] = 1'b1;
          6'h25: out_r[5] = 1'b1;
          6'h26: out_r[5] = 1'b1;
          6'h32: out_r[5] = 1'b1;
          6'h33: out_r[5] = 1'b1;
          6'h34: out_r[5] = 1'b1;
          6'h37: out_r[5] = 1'b1;
          6'h3a: out_r[5] = 1'b1;
          6'h3b: out_r[5] = 1'b1;
          6'h3e: out_r[5] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h08: out_r[6] = 1'b1;
          6'h0a: out_r[6] = 1'b1;
          6'h0b: out_r[6] = 1'b1;
          6'h0c: out_r[6] = 1'b1;
          6'h0d: out_r[6] = 1'b1;
          6'h0e: out_r[6] = 1'b1;
          6'h0f: out_r[6] = 1'b1;
          6'h1c: out_r[6] = 1'b1;
          6'h1d: out_r[6] = 1'b1;
          6'h1e: out_r[6] = 1'b1;
          6'h1f: out_r[6] = 1'b1;
          6'h23: out_r[6] = 1'b1;
          6'h27: out_r[6] = 1'b1;
          6'h28: out_r[6] = 1'b1;
          6'h2a: out_r[6] = 1'b1;
          6'h2b: out_r[6] = 1'b1;
          6'h2c: out_r[6] = 1'b1;
          6'h2e: out_r[6] = 1'b1;
          6'h2f: out_r[6] = 1'b1;
          6'h33: out_r[6] = 1'b1;
          6'h35: out_r[6] = 1'b1;
          6'h3b: out_r[6] = 1'b1;
          6'h3c: out_r[6] = 1'b1;
          6'h3d: out_r[6] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h0e: out_r[7] = 1'b1;
          6'h0f: out_r[7] = 1'b1;
          6'h11: out_r[7] = 1'b1;
          6'h15: out_r[7] = 1'b1;
          6'h19: out_r[7] = 1'b1;
          6'h21: out_r[7] = 1'b1;
          6'h25: out_r[7] = 1'b1;
          6'h27: out_r[7] = 1'b1;
          6'h31: out_r[7] = 1'b1;
          6'h33: out_r[7] = 1'b1;
          6'h35: out_r[7] = 1'b1;
          6'h39: out_r[7] = 1'b1;
          6'h3b: out_r[7] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h08: out_r[8] = 1'b0;
          6'h09: out_r[8] = 1'b0;
          6'h0c: out_r[8] = 1'b0;
          6'h0e: out_r[8] = 1'b0;
          6'h0f: out_r[8] = 1'b0;
          6'h11: out_r[8] = 1'b0;
          6'h12: out_r[8] = 1'b0;
          6'h13: out_r[8] = 1'b0;
          6'h15: out_r[8] = 1'b0;
          6'h19: out_r[8] = 1'b0;
          6'h1a: out_r[8] = 1'b0;
          6'h1b: out_r[8] = 1'b0;
          6'h1e: out_r[8] = 1'b0;
          6'h1f: out_r[8] = 1'b0;
          6'h21: out_r[8] = 1'b0;
          6'h25: out_r[8] = 1'b0;
          6'h27: out_r[8] = 1'b0;
          6'h2d: out_r[8] = 1'b0;
          6'h31: out_r[8] = 1'b0;
          6'h35: out_r[8] = 1'b0;
          6'h36: out_r[8] = 1'b0;
          6'h37: out_r[8] = 1'b0;
          6'h39: out_r[8] = 1'b0;
          6'h3c: out_r[8] = 1'b0;
          6'h3e: out_r[8] = 1'b0;
          6'h3f: out_r[8] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h01: out_r[9] = 1'b1;
          6'h05: out_r[9] = 1'b1;
          6'h08: out_r[9] = 1'b1;
          6'h0c: out_r[9] = 1'b1;
          6'h10: out_r[9] = 1'b1;
          6'h14: out_r[9] = 1'b1;
          6'h16: out_r[9] = 1'b1;
          6'h17: out_r[9] = 1'b1;
          6'h18: out_r[9] = 1'b1;
          6'h1e: out_r[9] = 1'b1;
          6'h1f: out_r[9] = 1'b1;
          6'h21: out_r[9] = 1'b1;
          6'h25: out_r[9] = 1'b1;
          6'h27: out_r[9] = 1'b1;
          6'h30: out_r[9] = 1'b1;
          6'h33: out_r[9] = 1'b1;
          6'h34: out_r[9] = 1'b1;
          6'h35: out_r[9] = 1'b1;
          6'h37: out_r[9] = 1'b1;
          6'h38: out_r[9] = 1'b1;
          6'h3b: out_r[9] = 1'b1;
          6'h3c: out_r[9] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h01: out_r[10] = 1'b1;
          6'h05: out_r[10] = 1'b1;
          6'h08: out_r[10] = 1'b1;
          6'h0c: out_r[10] = 1'b1;
          6'h11: out_r[10] = 1'b1;
          6'h15: out_r[10] = 1'b1;
          6'h19: out_r[10] = 1'b1;
          6'h1e: out_r[10] = 1'b1;
          6'h1f: out_r[10] = 1'b1;
          6'h21: out_r[10] = 1'b1;
          6'h25: out_r[10] = 1'b1;
          6'h27: out_r[10] = 1'b1;
          6'h2f: out_r[10] = 1'b1;
          6'h31: out_r[10] = 1'b1;
          6'h33: out_r[10] = 1'b1;
          6'h35: out_r[10] = 1'b1;
          6'h37: out_r[10] = 1'b1;
          6'h39: out_r[10] = 1'b1;
          6'h3b: out_r[10] = 1'b1;
          6'h3c: out_r[10] = 1'b1;
          6'h3d: out_r[10] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h08: out_r[11] = 1'b1;
          6'h0a: out_r[11] = 1'b1;
          6'h0b: out_r[11] = 1'b1;
          6'h0c: out_r[11] = 1'b1;
          6'h16: out_r[11] = 1'b1;
          6'h17: out_r[11] = 1'b1;
          6'h1e: out_r[11] = 1'b1;
          6'h1f: out_r[11] = 1'b1;
          6'h20: out_r[11] = 1'b1;
          6'h22: out_r[11] = 1'b1;
          6'h24: out_r[11] = 1'b1;
          6'h26: out_r[11] = 1'b1;
          6'h28: out_r[11] = 1'b1;
          6'h2c: out_r[11] = 1'b1;
          6'h30: out_r[11] = 1'b1;
          6'h31: out_r[11] = 1'b1;
          6'h32: out_r[11] = 1'b1;
          6'h34: out_r[11] = 1'b1;
          6'h37: out_r[11] = 1'b1;
          6'h38: out_r[11] = 1'b1;
          6'h39: out_r[11] = 1'b1;
          6'h3a: out_r[11] = 1'b1;
          6'h3e: out_r[11] = 1'b1;
          default: begin end
        endcase
      end
      6'h13: begin
        out_r = 12'h147;
        case (inner)
          6'h02: out_r[0] = 1'b0;
          6'h03: out_r[0] = 1'b0;
          6'h08: out_r[0] = 1'b0;
          6'h09: out_r[0] = 1'b0;
          6'h0a: out_r[0] = 1'b0;
          6'h14: out_r[0] = 1'b0;
          6'h15: out_r[0] = 1'b0;
          6'h16: out_r[0] = 1'b0;
          6'h17: out_r[0] = 1'b0;
          6'h1c: out_r[0] = 1'b0;
          6'h1d: out_r[0] = 1'b0;
          6'h1e: out_r[0] = 1'b0;
          6'h1f: out_r[0] = 1'b0;
          6'h22: out_r[0] = 1'b0;
          6'h23: out_r[0] = 1'b0;
          6'h26: out_r[0] = 1'b0;
          6'h28: out_r[0] = 1'b0;
          6'h29: out_r[0] = 1'b0;
          6'h2a: out_r[0] = 1'b0;
          6'h2b: out_r[0] = 1'b0;
          6'h2c: out_r[0] = 1'b0;
          6'h2d: out_r[0] = 1'b0;
          6'h2e: out_r[0] = 1'b0;
          6'h34: out_r[0] = 1'b0;
          6'h35: out_r[0] = 1'b0;
          6'h37: out_r[0] = 1'b0;
          6'h3c: out_r[0] = 1'b0;
          6'h3d: out_r[0] = 1'b0;
          6'h3f: out_r[0] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h06: out_r[1] = 1'b0;
          6'h07: out_r[1] = 1'b0;
          6'h0c: out_r[1] = 1'b0;
          6'h0d: out_r[1] = 1'b0;
          6'h0e: out_r[1] = 1'b0;
          6'h0f: out_r[1] = 1'b0;
          6'h12: out_r[1] = 1'b0;
          6'h13: out_r[1] = 1'b0;
          6'h1a: out_r[1] = 1'b0;
          6'h1b: out_r[1] = 1'b0;
          6'h1d: out_r[1] = 1'b0;
          6'h27: out_r[1] = 1'b0;
          6'h2b: out_r[1] = 1'b0;
          6'h2e: out_r[1] = 1'b0;
          6'h30: out_r[1] = 1'b0;
          6'h33: out_r[1] = 1'b0;
          6'h38: out_r[1] = 1'b0;
          6'h3b: out_r[1] = 1'b0;
          6'h3c: out_r[1] = 1'b0;
          6'h3d: out_r[1] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h02: out_r[2] = 1'b0;
          6'h03: out_r[2] = 1'b0;
          6'h06: out_r[2] = 1'b0;
          6'h07: out_r[2] = 1'b0;
          6'h0c: out_r[2] = 1'b0;
          6'h0d: out_r[2] = 1'b0;
          6'h0e: out_r[2] = 1'b0;
          6'h0f: out_r[2] = 1'b0;
          6'h13: out_r[2] = 1'b0;
          6'h1b: out_r[2] = 1'b0;
          6'h1d: out_r[2] = 1'b0;
          6'h1e: out_r[2] = 1'b0;
          6'h23: out_r[2] = 1'b0;
          6'h27: out_r[2] = 1'b0;
          6'h30: out_r[2] = 1'b0;
          6'h33: out_r[2] = 1'b0;
          6'h38: out_r[2] = 1'b0;
          6'h3b: out_r[2] = 1'b0;
          6'h3c: out_r[2] = 1'b0;
          6'h3d: out_r[2] = 1'b0;
          6'h3e: out_r[2] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h02: out_r[3] = 1'b1;
          6'h03: out_r[3] = 1'b1;
          6'h08: out_r[3] = 1'b1;
          6'h09: out_r[3] = 1'b1;
          6'h0d: out_r[3] = 1'b1;
          6'h0e: out_r[3] = 1'b1;
          6'h0f: out_r[3] = 1'b1;
          6'h1c: out_r[3] = 1'b1;
          6'h1d: out_r[3] = 1'b1;
          6'h1e: out_r[3] = 1'b1;
          6'h22: out_r[3] = 1'b1;
          6'h23: out_r[3] = 1'b1;
          6'h26: out_r[3] = 1'b1;
          6'h29: out_r[3] = 1'b1;
          6'h2a: out_r[3] = 1'b1;
          6'h2c: out_r[3] = 1'b1;
          6'h30: out_r[3] = 1'b1;
          6'h34: out_r[3] = 1'b1;
          6'h38: out_r[3] = 1'b1;
          6'h3d: out_r[3] = 1'b1;
          6'h3e: out_r[3] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h02: out_r[4] = 1'b1;
          6'h03: out_r[4] = 1'b1;
          6'h08: out_r[4] = 1'b1;
          6'h09: out_r[4] = 1'b1;
          6'h0d: out_r[4] = 1'b1;
          6'h0e: out_r[4] = 1'b1;
          6'h0f: out_r[4] = 1'b1;
          6'h13: out_r[4] = 1'b1;
          6'h16: out_r[4] = 1'b1;
          6'h17: out_r[4] = 1'b1;
          6'h1b: out_r[4] = 1'b1;
          6'h1c: out_r[4] = 1'b1;
          6'h1d: out_r[4] = 1'b1;
          6'h1e: out_r[4] = 1'b1;
          6'h1f: out_r[4] = 1'b1;
          6'h23: out_r[4] = 1'b1;
          6'h29: out_r[4] = 1'b1;
          6'h2a: out_r[4] = 1'b1;
          6'h2c: out_r[4] = 1'b1;
          6'h30: out_r[4] = 1'b1;
          6'h32: out_r[4] = 1'b1;
          6'h33: out_r[4] = 1'b1;
          6'h34: out_r[4] = 1'b1;
          6'h37: out_r[4] = 1'b1;
          6'h38: out_r[4] = 1'b1;
          6'h3a: out_r[4] = 1'b1;
          6'h3b: out_r[4] = 1'b1;
          6'h3d: out_r[4] = 1'b1;
          6'h3e: out_r[4] = 1'b1;
          6'h3f: out_r[4] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h02: out_r[5] = 1'b1;
          6'h03: out_r[5] = 1'b1;
          6'h04: out_r[5] = 1'b1;
          6'h05: out_r[5] = 1'b1;
          6'h06: out_r[5] = 1'b1;
          6'h07: out_r[5] = 1'b1;
          6'h11: out_r[5] = 1'b1;
          6'h13: out_r[5] = 1'b1;
          6'h19: out_r[5] = 1'b1;
          6'h1b: out_r[5] = 1'b1;
          6'h1d: out_r[5] = 1'b1;
          6'h1e: out_r[5] = 1'b1;
          6'h23: out_r[5] = 1'b1;
          6'h24: out_r[5] = 1'b1;
          6'h25: out_r[5] = 1'b1;
          6'h26: out_r[5] = 1'b1;
          6'h27: out_r[5] = 1'b1;
          6'h31: out_r[5] = 1'b1;
          6'h33: out_r[5] = 1'b1;
          6'h39: out_r[5] = 1'b1;
          6'h3b: out_r[5] = 1'b1;
          6'h3d: out_r[5] = 1'b1;
          6'h3e: out_r[5] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[6] = 1'b0;
          6'h01: out_r[6] = 1'b0;
          6'h02: out_r[6] = 1'b0;
          6'h03: out_r[6] = 1'b0;
          6'h04: out_r[6] = 1'b0;
          6'h05: out_r[6] = 1'b0;
          6'h06: out_r[6] = 1'b0;
          6'h07: out_r[6] = 1'b0;
          6'h0c: out_r[6] = 1'b0;
          6'h11: out_r[6] = 1'b0;
          6'h15: out_r[6] = 1'b0;
          6'h19: out_r[6] = 1'b0;
          6'h1d: out_r[6] = 1'b0;
          6'h1e: out_r[6] = 1'b0;
          6'h20: out_r[6] = 1'b0;
          6'h21: out_r[6] = 1'b0;
          6'h22: out_r[6] = 1'b0;
          6'h23: out_r[6] = 1'b0;
          6'h24: out_r[6] = 1'b0;
          6'h25: out_r[6] = 1'b0;
          6'h26: out_r[6] = 1'b0;
          6'h27: out_r[6] = 1'b0;
          6'h31: out_r[6] = 1'b0;
          6'h35: out_r[6] = 1'b0;
          6'h39: out_r[6] = 1'b0;
          6'h3d: out_r[6] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h03: out_r[7] = 1'b1;
          6'h07: out_r[7] = 1'b1;
          6'h0b: out_r[7] = 1'b1;
          6'h0e: out_r[7] = 1'b1;
          6'h12: out_r[7] = 1'b1;
          6'h13: out_r[7] = 1'b1;
          6'h16: out_r[7] = 1'b1;
          6'h17: out_r[7] = 1'b1;
          6'h1a: out_r[7] = 1'b1;
          6'h1b: out_r[7] = 1'b1;
          6'h23: out_r[7] = 1'b1;
          6'h27: out_r[7] = 1'b1;
          6'h30: out_r[7] = 1'b1;
          6'h32: out_r[7] = 1'b1;
          6'h33: out_r[7] = 1'b1;
          6'h36: out_r[7] = 1'b1;
          6'h37: out_r[7] = 1'b1;
          6'h38: out_r[7] = 1'b1;
          6'h3a: out_r[7] = 1'b1;
          6'h3b: out_r[7] = 1'b1;
          6'h3e: out_r[7] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[8] = 1'b0;
          6'h03: out_r[8] = 1'b0;
          6'h04: out_r[8] = 1'b0;
          6'h07: out_r[8] = 1'b0;
          6'h0b: out_r[8] = 1'b0;
          6'h0c: out_r[8] = 1'b0;
          6'h0e: out_r[8] = 1'b0;
          6'h0f: out_r[8] = 1'b0;
          6'h13: out_r[8] = 1'b0;
          6'h1b: out_r[8] = 1'b0;
          6'h1e: out_r[8] = 1'b0;
          6'h23: out_r[8] = 1'b0;
          6'h27: out_r[8] = 1'b0;
          6'h30: out_r[8] = 1'b0;
          6'h32: out_r[8] = 1'b0;
          6'h33: out_r[8] = 1'b0;
          6'h38: out_r[8] = 1'b0;
          6'h3a: out_r[8] = 1'b0;
          6'h3b: out_r[8] = 1'b0;
          6'h3e: out_r[8] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[9] = 1'b1;
          6'h02: out_r[9] = 1'b1;
          6'h03: out_r[9] = 1'b1;
          6'h04: out_r[9] = 1'b1;
          6'h06: out_r[9] = 1'b1;
          6'h07: out_r[9] = 1'b1;
          6'h0a: out_r[9] = 1'b1;
          6'h0c: out_r[9] = 1'b1;
          6'h0e: out_r[9] = 1'b1;
          6'h0f: out_r[9] = 1'b1;
          6'h12: out_r[9] = 1'b1;
          6'h13: out_r[9] = 1'b1;
          6'h17: out_r[9] = 1'b1;
          6'h1a: out_r[9] = 1'b1;
          6'h1b: out_r[9] = 1'b1;
          6'h1c: out_r[9] = 1'b1;
          6'h23: out_r[9] = 1'b1;
          6'h27: out_r[9] = 1'b1;
          6'h2a: out_r[9] = 1'b1;
          6'h30: out_r[9] = 1'b1;
          6'h32: out_r[9] = 1'b1;
          6'h33: out_r[9] = 1'b1;
          6'h37: out_r[9] = 1'b1;
          6'h38: out_r[9] = 1'b1;
          6'h3a: out_r[9] = 1'b1;
          6'h3b: out_r[9] = 1'b1;
          6'h3e: out_r[9] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[10] = 1'b1;
          6'h02: out_r[10] = 1'b1;
          6'h04: out_r[10] = 1'b1;
          6'h06: out_r[10] = 1'b1;
          6'h07: out_r[10] = 1'b1;
          6'h09: out_r[10] = 1'b1;
          6'h0a: out_r[10] = 1'b1;
          6'h0b: out_r[10] = 1'b1;
          6'h0c: out_r[10] = 1'b1;
          6'h0e: out_r[10] = 1'b1;
          6'h0f: out_r[10] = 1'b1;
          6'h10: out_r[10] = 1'b1;
          6'h12: out_r[10] = 1'b1;
          6'h13: out_r[10] = 1'b1;
          6'h18: out_r[10] = 1'b1;
          6'h1a: out_r[10] = 1'b1;
          6'h1b: out_r[10] = 1'b1;
          6'h1c: out_r[10] = 1'b1;
          6'h20: out_r[10] = 1'b1;
          6'h24: out_r[10] = 1'b1;
          6'h27: out_r[10] = 1'b1;
          6'h29: out_r[10] = 1'b1;
          6'h2a: out_r[10] = 1'b1;
          6'h30: out_r[10] = 1'b1;
          6'h32: out_r[10] = 1'b1;
          6'h33: out_r[10] = 1'b1;
          6'h38: out_r[10] = 1'b1;
          6'h3a: out_r[10] = 1'b1;
          6'h3b: out_r[10] = 1'b1;
          6'h3e: out_r[10] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[11] = 1'b1;
          6'h03: out_r[11] = 1'b1;
          6'h04: out_r[11] = 1'b1;
          6'h0a: out_r[11] = 1'b1;
          6'h0b: out_r[11] = 1'b1;
          6'h15: out_r[11] = 1'b1;
          6'h17: out_r[11] = 1'b1;
          6'h1e: out_r[11] = 1'b1;
          6'h23: out_r[11] = 1'b1;
          6'h28: out_r[11] = 1'b1;
          6'h2d: out_r[11] = 1'b1;
          6'h32: out_r[11] = 1'b1;
          6'h35: out_r[11] = 1'b1;
          6'h37: out_r[11] = 1'b1;
          6'h3a: out_r[11] = 1'b1;
          6'h3c: out_r[11] = 1'b1;
          6'h3e: out_r[11] = 1'b1;
          default: begin end
        endcase
      end
      6'h14: begin
        out_r = 12'h015;
        case (inner)
          6'h00: out_r[0] = 1'b0;
          6'h01: out_r[0] = 1'b0;
          6'h04: out_r[0] = 1'b0;
          6'h05: out_r[0] = 1'b0;
          6'h06: out_r[0] = 1'b0;
          6'h09: out_r[0] = 1'b0;
          6'h0d: out_r[0] = 1'b0;
          6'h10: out_r[0] = 1'b0;
          6'h11: out_r[0] = 1'b0;
          6'h17: out_r[0] = 1'b0;
          6'h1b: out_r[0] = 1'b0;
          6'h1f: out_r[0] = 1'b0;
          6'h20: out_r[0] = 1'b0;
          6'h21: out_r[0] = 1'b0;
          6'h24: out_r[0] = 1'b0;
          6'h25: out_r[0] = 1'b0;
          6'h26: out_r[0] = 1'b0;
          6'h29: out_r[0] = 1'b0;
          6'h2d: out_r[0] = 1'b0;
          6'h30: out_r[0] = 1'b0;
          6'h31: out_r[0] = 1'b0;
          6'h37: out_r[0] = 1'b0;
          6'h3b: out_r[0] = 1'b0;
          6'h3f: out_r[0] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h01: out_r[1] = 1'b1;
          6'h05: out_r[1] = 1'b1;
          6'h07: out_r[1] = 1'b1;
          6'h08: out_r[1] = 1'b1;
          6'h09: out_r[1] = 1'b1;
          6'h0b: out_r[1] = 1'b1;
          6'h0f: out_r[1] = 1'b1;
          6'h11: out_r[1] = 1'b1;
          6'h21: out_r[1] = 1'b1;
          6'h25: out_r[1] = 1'b1;
          6'h27: out_r[1] = 1'b1;
          6'h28: out_r[1] = 1'b1;
          6'h29: out_r[1] = 1'b1;
          6'h2b: out_r[1] = 1'b1;
          6'h2f: out_r[1] = 1'b1;
          6'h31: out_r[1] = 1'b1;
          6'h32: out_r[1] = 1'b1;
          6'h3a: out_r[1] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[2] = 1'b0;
          6'h01: out_r[2] = 1'b0;
          6'h04: out_r[2] = 1'b0;
          6'h05: out_r[2] = 1'b0;
          6'h06: out_r[2] = 1'b0;
          6'h07: out_r[2] = 1'b0;
          6'h10: out_r[2] = 1'b0;
          6'h11: out_r[2] = 1'b0;
          6'h1b: out_r[2] = 1'b0;
          6'h20: out_r[2] = 1'b0;
          6'h21: out_r[2] = 1'b0;
          6'h24: out_r[2] = 1'b0;
          6'h25: out_r[2] = 1'b0;
          6'h26: out_r[2] = 1'b0;
          6'h27: out_r[2] = 1'b0;
          6'h30: out_r[2] = 1'b0;
          6'h31: out_r[2] = 1'b0;
          6'h3a: out_r[2] = 1'b0;
          6'h3b: out_r[2] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h0a: out_r[3] = 1'b1;
          6'h0b: out_r[3] = 1'b1;
          6'h0c: out_r[3] = 1'b1;
          6'h0d: out_r[3] = 1'b1;
          6'h0e: out_r[3] = 1'b1;
          6'h0f: out_r[3] = 1'b1;
          6'h1a: out_r[3] = 1'b1;
          6'h2a: out_r[3] = 1'b1;
          6'h2b: out_r[3] = 1'b1;
          6'h2c: out_r[3] = 1'b1;
          6'h2d: out_r[3] = 1'b1;
          6'h2e: out_r[3] = 1'b1;
          6'h2f: out_r[3] = 1'b1;
          6'h3a: out_r[3] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h02: out_r[4] = 1'b0;
          6'h0c: out_r[4] = 1'b0;
          6'h0d: out_r[4] = 1'b0;
          6'h0e: out_r[4] = 1'b0;
          6'h0f: out_r[4] = 1'b0;
          6'h13: out_r[4] = 1'b0;
          6'h15: out_r[4] = 1'b0;
          6'h19: out_r[4] = 1'b0;
          6'h1a: out_r[4] = 1'b0;
          6'h1d: out_r[4] = 1'b0;
          6'h2c: out_r[4] = 1'b0;
          6'h2d: out_r[4] = 1'b0;
          6'h2e: out_r[4] = 1'b0;
          6'h2f: out_r[4] = 1'b0;
          6'h34: out_r[4] = 1'b0;
          6'h36: out_r[4] = 1'b0;
          6'h38: out_r[4] = 1'b0;
          6'h3a: out_r[4] = 1'b0;
          6'h3b: out_r[4] = 1'b0;
          6'h3c: out_r[4] = 1'b0;
          6'h3e: out_r[4] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h02: out_r[5] = 1'b1;
          6'h04: out_r[5] = 1'b1;
          6'h05: out_r[5] = 1'b1;
          6'h06: out_r[5] = 1'b1;
          6'h07: out_r[5] = 1'b1;
          6'h08: out_r[5] = 1'b1;
          6'h09: out_r[5] = 1'b1;
          6'h0a: out_r[5] = 1'b1;
          6'h0b: out_r[5] = 1'b1;
          6'h13: out_r[5] = 1'b1;
          6'h15: out_r[5] = 1'b1;
          6'h19: out_r[5] = 1'b1;
          6'h1a: out_r[5] = 1'b1;
          6'h1d: out_r[5] = 1'b1;
          6'h24: out_r[5] = 1'b1;
          6'h25: out_r[5] = 1'b1;
          6'h26: out_r[5] = 1'b1;
          6'h27: out_r[5] = 1'b1;
          6'h28: out_r[5] = 1'b1;
          6'h29: out_r[5] = 1'b1;
          6'h2a: out_r[5] = 1'b1;
          6'h2b: out_r[5] = 1'b1;
          6'h34: out_r[5] = 1'b1;
          6'h36: out_r[5] = 1'b1;
          6'h38: out_r[5] = 1'b1;
          6'h3a: out_r[5] = 1'b1;
          6'h3c: out_r[5] = 1'b1;
          6'h3e: out_r[5] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h02: out_r[6] = 1'b1;
          6'h08: out_r[6] = 1'b1;
          6'h09: out_r[6] = 1'b1;
          6'h0a: out_r[6] = 1'b1;
          6'h0b: out_r[6] = 1'b1;
          6'h0c: out_r[6] = 1'b1;
          6'h0d: out_r[6] = 1'b1;
          6'h0e: out_r[6] = 1'b1;
          6'h0f: out_r[6] = 1'b1;
          6'h13: out_r[6] = 1'b1;
          6'h15: out_r[6] = 1'b1;
          6'h19: out_r[6] = 1'b1;
          6'h1a: out_r[6] = 1'b1;
          6'h1d: out_r[6] = 1'b1;
          6'h28: out_r[6] = 1'b1;
          6'h29: out_r[6] = 1'b1;
          6'h2a: out_r[6] = 1'b1;
          6'h2b: out_r[6] = 1'b1;
          6'h2c: out_r[6] = 1'b1;
          6'h2d: out_r[6] = 1'b1;
          6'h2e: out_r[6] = 1'b1;
          6'h2f: out_r[6] = 1'b1;
          6'h34: out_r[6] = 1'b1;
          6'h36: out_r[6] = 1'b1;
          6'h38: out_r[6] = 1'b1;
          6'h3a: out_r[6] = 1'b1;
          6'h3c: out_r[6] = 1'b1;
          6'h3e: out_r[6] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h02: out_r[7] = 1'b1;
          6'h13: out_r[7] = 1'b1;
          6'h14: out_r[7] = 1'b1;
          6'h15: out_r[7] = 1'b1;
          6'h16: out_r[7] = 1'b1;
          6'h19: out_r[7] = 1'b1;
          6'h1c: out_r[7] = 1'b1;
          6'h1d: out_r[7] = 1'b1;
          6'h1e: out_r[7] = 1'b1;
          6'h34: out_r[7] = 1'b1;
          6'h36: out_r[7] = 1'b1;
          6'h3c: out_r[7] = 1'b1;
          6'h3e: out_r[7] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[8] = 1'b1;
          6'h01: out_r[8] = 1'b1;
          6'h02: out_r[8] = 1'b1;
          6'h07: out_r[8] = 1'b1;
          6'h08: out_r[8] = 1'b1;
          6'h09: out_r[8] = 1'b1;
          6'h0b: out_r[8] = 1'b1;
          6'h0c: out_r[8] = 1'b1;
          6'h0d: out_r[8] = 1'b1;
          6'h0e: out_r[8] = 1'b1;
          6'h10: out_r[8] = 1'b1;
          6'h11: out_r[8] = 1'b1;
          6'h17: out_r[8] = 1'b1;
          6'h1a: out_r[8] = 1'b1;
          6'h1b: out_r[8] = 1'b1;
          6'h1f: out_r[8] = 1'b1;
          6'h20: out_r[8] = 1'b1;
          6'h21: out_r[8] = 1'b1;
          6'h23: out_r[8] = 1'b1;
          6'h24: out_r[8] = 1'b1;
          6'h25: out_r[8] = 1'b1;
          6'h26: out_r[8] = 1'b1;
          6'h27: out_r[8] = 1'b1;
          6'h2a: out_r[8] = 1'b1;
          6'h2c: out_r[8] = 1'b1;
          6'h2e: out_r[8] = 1'b1;
          6'h2f: out_r[8] = 1'b1;
          6'h30: out_r[8] = 1'b1;
          6'h31: out_r[8] = 1'b1;
          6'h35: out_r[8] = 1'b1;
          6'h3d: out_r[8] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h02: out_r[9] = 1'b1;
          6'h03: out_r[9] = 1'b1;
          6'h04: out_r[9] = 1'b1;
          6'h05: out_r[9] = 1'b1;
          6'h06: out_r[9] = 1'b1;
          6'h0a: out_r[9] = 1'b1;
          6'h0f: out_r[9] = 1'b1;
          6'h10: out_r[9] = 1'b1;
          6'h11: out_r[9] = 1'b1;
          6'h15: out_r[9] = 1'b1;
          6'h17: out_r[9] = 1'b1;
          6'h1b: out_r[9] = 1'b1;
          6'h1d: out_r[9] = 1'b1;
          6'h1f: out_r[9] = 1'b1;
          6'h22: out_r[9] = 1'b1;
          6'h28: out_r[9] = 1'b1;
          6'h29: out_r[9] = 1'b1;
          6'h2b: out_r[9] = 1'b1;
          6'h2d: out_r[9] = 1'b1;
          6'h30: out_r[9] = 1'b1;
          6'h31: out_r[9] = 1'b1;
          6'h32: out_r[9] = 1'b1;
          6'h37: out_r[9] = 1'b1;
          6'h38: out_r[9] = 1'b1;
          6'h3a: out_r[9] = 1'b1;
          6'h3f: out_r[9] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h02: out_r[10] = 1'b1;
          6'h03: out_r[10] = 1'b1;
          6'h04: out_r[10] = 1'b1;
          6'h05: out_r[10] = 1'b1;
          6'h06: out_r[10] = 1'b1;
          6'h07: out_r[10] = 1'b1;
          6'h0a: out_r[10] = 1'b1;
          6'h0f: out_r[10] = 1'b1;
          6'h12: out_r[10] = 1'b1;
          6'h13: out_r[10] = 1'b1;
          6'h14: out_r[10] = 1'b1;
          6'h15: out_r[10] = 1'b1;
          6'h16: out_r[10] = 1'b1;
          6'h18: out_r[10] = 1'b1;
          6'h19: out_r[10] = 1'b1;
          6'h1c: out_r[10] = 1'b1;
          6'h1d: out_r[10] = 1'b1;
          6'h1e: out_r[10] = 1'b1;
          6'h22: out_r[10] = 1'b1;
          6'h28: out_r[10] = 1'b1;
          6'h29: out_r[10] = 1'b1;
          6'h2b: out_r[10] = 1'b1;
          6'h2d: out_r[10] = 1'b1;
          6'h2f: out_r[10] = 1'b1;
          6'h32: out_r[10] = 1'b1;
          6'h37: out_r[10] = 1'b1;
          6'h38: out_r[10] = 1'b1;
          6'h3a: out_r[10] = 1'b1;
          6'h3f: out_r[10] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h04: out_r[11] = 1'b1;
          6'h05: out_r[11] = 1'b1;
          6'h06: out_r[11] = 1'b1;
          6'h09: out_r[11] = 1'b1;
          6'h0a: out_r[11] = 1'b1;
          6'h0c: out_r[11] = 1'b1;
          6'h0e: out_r[11] = 1'b1;
          6'h0f: out_r[11] = 1'b1;
          6'h17: out_r[11] = 1'b1;
          6'h1b: out_r[11] = 1'b1;
          6'h1f: out_r[11] = 1'b1;
          6'h20: out_r[11] = 1'b1;
          6'h21: out_r[11] = 1'b1;
          6'h28: out_r[11] = 1'b1;
          6'h29: out_r[11] = 1'b1;
          6'h2a: out_r[11] = 1'b1;
          6'h2b: out_r[11] = 1'b1;
          6'h2d: out_r[11] = 1'b1;
          6'h30: out_r[11] = 1'b1;
          6'h31: out_r[11] = 1'b1;
          6'h32: out_r[11] = 1'b1;
          6'h37: out_r[11] = 1'b1;
          6'h3a: out_r[11] = 1'b1;
          6'h3f: out_r[11] = 1'b1;
          default: begin end
        endcase
      end
      6'h15: begin
        out_r = 12'h777;
        case (inner)
          6'h03: out_r[0] = 1'b0;
          6'h0a: out_r[0] = 1'b0;
          6'h0c: out_r[0] = 1'b0;
          6'h0d: out_r[0] = 1'b0;
          6'h0e: out_r[0] = 1'b0;
          6'h0f: out_r[0] = 1'b0;
          6'h12: out_r[0] = 1'b0;
          6'h13: out_r[0] = 1'b0;
          6'h15: out_r[0] = 1'b0;
          6'h17: out_r[0] = 1'b0;
          6'h19: out_r[0] = 1'b0;
          6'h1b: out_r[0] = 1'b0;
          6'h1d: out_r[0] = 1'b0;
          6'h1f: out_r[0] = 1'b0;
          6'h28: out_r[0] = 1'b0;
          6'h2a: out_r[0] = 1'b0;
          6'h32: out_r[0] = 1'b0;
          6'h33: out_r[0] = 1'b0;
          6'h34: out_r[0] = 1'b0;
          6'h35: out_r[0] = 1'b0;
          6'h37: out_r[0] = 1'b0;
          6'h38: out_r[0] = 1'b0;
          6'h39: out_r[0] = 1'b0;
          6'h3a: out_r[0] = 1'b0;
          6'h3b: out_r[0] = 1'b0;
          6'h3c: out_r[0] = 1'b0;
          6'h3d: out_r[0] = 1'b0;
          6'h3f: out_r[0] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[1] = 1'b0;
          6'h03: out_r[1] = 1'b0;
          6'h04: out_r[1] = 1'b0;
          6'h05: out_r[1] = 1'b0;
          6'h06: out_r[1] = 1'b0;
          6'h07: out_r[1] = 1'b0;
          6'h08: out_r[1] = 1'b0;
          6'h09: out_r[1] = 1'b0;
          6'h0b: out_r[1] = 1'b0;
          6'h10: out_r[1] = 1'b0;
          6'h11: out_r[1] = 1'b0;
          6'h13: out_r[1] = 1'b0;
          6'h1a: out_r[1] = 1'b0;
          6'h20: out_r[1] = 1'b0;
          6'h23: out_r[1] = 1'b0;
          6'h25: out_r[1] = 1'b0;
          6'h26: out_r[1] = 1'b0;
          6'h27: out_r[1] = 1'b0;
          6'h2e: out_r[1] = 1'b0;
          6'h30: out_r[1] = 1'b0;
          6'h31: out_r[1] = 1'b0;
          6'h32: out_r[1] = 1'b0;
          6'h33: out_r[1] = 1'b0;
          6'h36: out_r[1] = 1'b0;
          6'h3e: out_r[1] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[2] = 1'b0;
          6'h01: out_r[2] = 1'b0;
          6'h04: out_r[2] = 1'b0;
          6'h05: out_r[2] = 1'b0;
          6'h06: out_r[2] = 1'b0;
          6'h07: out_r[2] = 1'b0;
          6'h0b: out_r[2] = 1'b0;
          6'h10: out_r[2] = 1'b0;
          6'h11: out_r[2] = 1'b0;
          6'h1a: out_r[2] = 1'b0;
          6'h20: out_r[2] = 1'b0;
          6'h23: out_r[2] = 1'b0;
          6'h25: out_r[2] = 1'b0;
          6'h26: out_r[2] = 1'b0;
          6'h27: out_r[2] = 1'b0;
          6'h29: out_r[2] = 1'b0;
          6'h30: out_r[2] = 1'b0;
          6'h31: out_r[2] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h0a: out_r[3] = 1'b1;
          6'h0b: out_r[3] = 1'b1;
          6'h0c: out_r[3] = 1'b1;
          6'h0d: out_r[3] = 1'b1;
          6'h0f: out_r[3] = 1'b1;
          6'h12: out_r[3] = 1'b1;
          6'h15: out_r[3] = 1'b1;
          6'h17: out_r[3] = 1'b1;
          6'h19: out_r[3] = 1'b1;
          6'h1d: out_r[3] = 1'b1;
          6'h1f: out_r[3] = 1'b1;
          6'h22: out_r[3] = 1'b1;
          6'h23: out_r[3] = 1'b1;
          6'h2a: out_r[3] = 1'b1;
          6'h32: out_r[3] = 1'b1;
          6'h34: out_r[3] = 1'b1;
          6'h35: out_r[3] = 1'b1;
          6'h37: out_r[3] = 1'b1;
          6'h39: out_r[3] = 1'b1;
          6'h3c: out_r[3] = 1'b1;
          6'h3d: out_r[3] = 1'b1;
          6'h3f: out_r[3] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h09: out_r[4] = 1'b0;
          6'h0b: out_r[4] = 1'b0;
          6'h0c: out_r[4] = 1'b0;
          6'h0d: out_r[4] = 1'b0;
          6'h0f: out_r[4] = 1'b0;
          6'h13: out_r[4] = 1'b0;
          6'h15: out_r[4] = 1'b0;
          6'h17: out_r[4] = 1'b0;
          6'h1d: out_r[4] = 1'b0;
          6'h1f: out_r[4] = 1'b0;
          6'h22: out_r[4] = 1'b0;
          6'h23: out_r[4] = 1'b0;
          6'h25: out_r[4] = 1'b0;
          6'h27: out_r[4] = 1'b0;
          6'h28: out_r[4] = 1'b0;
          6'h2a: out_r[4] = 1'b0;
          6'h2b: out_r[4] = 1'b0;
          6'h2d: out_r[4] = 1'b0;
          6'h2f: out_r[4] = 1'b0;
          6'h30: out_r[4] = 1'b0;
          6'h33: out_r[4] = 1'b0;
          6'h34: out_r[4] = 1'b0;
          6'h35: out_r[4] = 1'b0;
          6'h37: out_r[4] = 1'b0;
          6'h38: out_r[4] = 1'b0;
          6'h3c: out_r[4] = 1'b0;
          6'h3d: out_r[4] = 1'b0;
          6'h3f: out_r[4] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[5] = 1'b0;
          6'h01: out_r[5] = 1'b0;
          6'h02: out_r[5] = 1'b0;
          6'h03: out_r[5] = 1'b0;
          6'h05: out_r[5] = 1'b0;
          6'h07: out_r[5] = 1'b0;
          6'h0b: out_r[5] = 1'b0;
          6'h0c: out_r[5] = 1'b0;
          6'h0d: out_r[5] = 1'b0;
          6'h0e: out_r[5] = 1'b0;
          6'h0f: out_r[5] = 1'b0;
          6'h10: out_r[5] = 1'b0;
          6'h14: out_r[5] = 1'b0;
          6'h16: out_r[5] = 1'b0;
          6'h18: out_r[5] = 1'b0;
          6'h1a: out_r[5] = 1'b0;
          6'h1b: out_r[5] = 1'b0;
          6'h1c: out_r[5] = 1'b0;
          6'h1e: out_r[5] = 1'b0;
          6'h20: out_r[5] = 1'b0;
          6'h24: out_r[5] = 1'b0;
          6'h29: out_r[5] = 1'b0;
          6'h2c: out_r[5] = 1'b0;
          6'h3a: out_r[5] = 1'b0;
          6'h3b: out_r[5] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[6] = 1'b0;
          6'h01: out_r[6] = 1'b0;
          6'h02: out_r[6] = 1'b0;
          6'h03: out_r[6] = 1'b0;
          6'h04: out_r[6] = 1'b0;
          6'h05: out_r[6] = 1'b0;
          6'h07: out_r[6] = 1'b0;
          6'h0e: out_r[6] = 1'b0;
          6'h10: out_r[6] = 1'b0;
          6'h14: out_r[6] = 1'b0;
          6'h16: out_r[6] = 1'b0;
          6'h18: out_r[6] = 1'b0;
          6'h1a: out_r[6] = 1'b0;
          6'h1c: out_r[6] = 1'b0;
          6'h1e: out_r[6] = 1'b0;
          6'h26: out_r[6] = 1'b0;
          6'h29: out_r[6] = 1'b0;
          6'h2c: out_r[6] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h09: out_r[7] = 1'b1;
          6'h0a: out_r[7] = 1'b1;
          6'h0b: out_r[7] = 1'b1;
          6'h0e: out_r[7] = 1'b1;
          6'h13: out_r[7] = 1'b1;
          6'h15: out_r[7] = 1'b1;
          6'h17: out_r[7] = 1'b1;
          6'h1d: out_r[7] = 1'b1;
          6'h1f: out_r[7] = 1'b1;
          6'h25: out_r[7] = 1'b1;
          6'h27: out_r[7] = 1'b1;
          6'h28: out_r[7] = 1'b1;
          6'h2a: out_r[7] = 1'b1;
          6'h2c: out_r[7] = 1'b1;
          6'h30: out_r[7] = 1'b1;
          6'h33: out_r[7] = 1'b1;
          6'h34: out_r[7] = 1'b1;
          6'h35: out_r[7] = 1'b1;
          6'h37: out_r[7] = 1'b1;
          6'h3c: out_r[7] = 1'b1;
          6'h3d: out_r[7] = 1'b1;
          6'h3f: out_r[7] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h03: out_r[8] = 1'b0;
          6'h0a: out_r[8] = 1'b0;
          6'h0d: out_r[8] = 1'b0;
          6'h0e: out_r[8] = 1'b0;
          6'h0f: out_r[8] = 1'b0;
          6'h13: out_r[8] = 1'b0;
          6'h15: out_r[8] = 1'b0;
          6'h16: out_r[8] = 1'b0;
          6'h17: out_r[8] = 1'b0;
          6'h1d: out_r[8] = 1'b0;
          6'h1e: out_r[8] = 1'b0;
          6'h1f: out_r[8] = 1'b0;
          6'h22: out_r[8] = 1'b0;
          6'h23: out_r[8] = 1'b0;
          6'h24: out_r[8] = 1'b0;
          6'h2a: out_r[8] = 1'b0;
          6'h2c: out_r[8] = 1'b0;
          6'h2e: out_r[8] = 1'b0;
          6'h30: out_r[8] = 1'b0;
          6'h33: out_r[8] = 1'b0;
          6'h34: out_r[8] = 1'b0;
          6'h35: out_r[8] = 1'b0;
          6'h36: out_r[8] = 1'b0;
          6'h37: out_r[8] = 1'b0;
          6'h3c: out_r[8] = 1'b0;
          6'h3d: out_r[8] = 1'b0;
          6'h3e: out_r[8] = 1'b0;
          6'h3f: out_r[8] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[9] = 1'b0;
          6'h01: out_r[9] = 1'b0;
          6'h02: out_r[9] = 1'b0;
          6'h04: out_r[9] = 1'b0;
          6'h08: out_r[9] = 1'b0;
          6'h0c: out_r[9] = 1'b0;
          6'h11: out_r[9] = 1'b0;
          6'h12: out_r[9] = 1'b0;
          6'h14: out_r[9] = 1'b0;
          6'h19: out_r[9] = 1'b0;
          6'h1c: out_r[9] = 1'b0;
          6'h21: out_r[9] = 1'b0;
          6'h26: out_r[9] = 1'b0;
          6'h29: out_r[9] = 1'b0;
          6'h2b: out_r[9] = 1'b0;
          6'h2c: out_r[9] = 1'b0;
          6'h2d: out_r[9] = 1'b0;
          6'h2f: out_r[9] = 1'b0;
          6'h30: out_r[9] = 1'b0;
          6'h31: out_r[9] = 1'b0;
          6'h32: out_r[9] = 1'b0;
          6'h34: out_r[9] = 1'b0;
          6'h38: out_r[9] = 1'b0;
          6'h39: out_r[9] = 1'b0;
          6'h3c: out_r[9] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[10] = 1'b0;
          6'h01: out_r[10] = 1'b0;
          6'h04: out_r[10] = 1'b0;
          6'h08: out_r[10] = 1'b0;
          6'h0c: out_r[10] = 1'b0;
          6'h10: out_r[10] = 1'b0;
          6'h11: out_r[10] = 1'b0;
          6'h14: out_r[10] = 1'b0;
          6'h19: out_r[10] = 1'b0;
          6'h1a: out_r[10] = 1'b0;
          6'h1c: out_r[10] = 1'b0;
          6'h21: out_r[10] = 1'b0;
          6'h26: out_r[10] = 1'b0;
          6'h29: out_r[10] = 1'b0;
          6'h31: out_r[10] = 1'b0;
          6'h32: out_r[10] = 1'b0;
          6'h38: out_r[10] = 1'b0;
          6'h39: out_r[10] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h03: out_r[11] = 1'b1;
          6'h0d: out_r[11] = 1'b1;
          6'h0f: out_r[11] = 1'b1;
          6'h13: out_r[11] = 1'b1;
          6'h15: out_r[11] = 1'b1;
          6'h16: out_r[11] = 1'b1;
          6'h17: out_r[11] = 1'b1;
          6'h1d: out_r[11] = 1'b1;
          6'h1e: out_r[11] = 1'b1;
          6'h1f: out_r[11] = 1'b1;
          6'h22: out_r[11] = 1'b1;
          6'h24: out_r[11] = 1'b1;
          6'h28: out_r[11] = 1'b1;
          6'h2a: out_r[11] = 1'b1;
          6'h2c: out_r[11] = 1'b1;
          6'h32: out_r[11] = 1'b1;
          6'h33: out_r[11] = 1'b1;
          6'h35: out_r[11] = 1'b1;
          6'h37: out_r[11] = 1'b1;
          6'h38: out_r[11] = 1'b1;
          6'h3d: out_r[11] = 1'b1;
          6'h3f: out_r[11] = 1'b1;
          default: begin end
        endcase
      end
      6'h16: begin
        out_r = 12'h118;
        case (inner)
          6'h00: out_r[0] = 1'b1;
          6'h01: out_r[0] = 1'b1;
          6'h04: out_r[0] = 1'b1;
          6'h06: out_r[0] = 1'b1;
          6'h07: out_r[0] = 1'b1;
          6'h08: out_r[0] = 1'b1;
          6'h09: out_r[0] = 1'b1;
          6'h0e: out_r[0] = 1'b1;
          6'h0f: out_r[0] = 1'b1;
          6'h11: out_r[0] = 1'b1;
          6'h19: out_r[0] = 1'b1;
          6'h1a: out_r[0] = 1'b1;
          6'h1b: out_r[0] = 1'b1;
          6'h20: out_r[0] = 1'b1;
          6'h21: out_r[0] = 1'b1;
          6'h24: out_r[0] = 1'b1;
          6'h28: out_r[0] = 1'b1;
          6'h29: out_r[0] = 1'b1;
          6'h2b: out_r[0] = 1'b1;
          6'h2e: out_r[0] = 1'b1;
          6'h30: out_r[0] = 1'b1;
          6'h31: out_r[0] = 1'b1;
          6'h33: out_r[0] = 1'b1;
          6'h36: out_r[0] = 1'b1;
          6'h37: out_r[0] = 1'b1;
          6'h39: out_r[0] = 1'b1;
          6'h3b: out_r[0] = 1'b1;
          6'h3e: out_r[0] = 1'b1;
          6'h3f: out_r[0] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[1] = 1'b1;
          6'h0c: out_r[1] = 1'b1;
          6'h11: out_r[1] = 1'b1;
          6'h14: out_r[1] = 1'b1;
          6'h1c: out_r[1] = 1'b1;
          6'h20: out_r[1] = 1'b1;
          6'h26: out_r[1] = 1'b1;
          6'h27: out_r[1] = 1'b1;
          6'h2c: out_r[1] = 1'b1;
          6'h2e: out_r[1] = 1'b1;
          6'h30: out_r[1] = 1'b1;
          6'h32: out_r[1] = 1'b1;
          6'h34: out_r[1] = 1'b1;
          6'h3a: out_r[1] = 1'b1;
          6'h3c: out_r[1] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[2] = 1'b1;
          6'h01: out_r[2] = 1'b1;
          6'h02: out_r[2] = 1'b1;
          6'h03: out_r[2] = 1'b1;
          6'h0e: out_r[2] = 1'b1;
          6'h0f: out_r[2] = 1'b1;
          6'h10: out_r[2] = 1'b1;
          6'h12: out_r[2] = 1'b1;
          6'h13: out_r[2] = 1'b1;
          6'h18: out_r[2] = 1'b1;
          6'h19: out_r[2] = 1'b1;
          6'h1a: out_r[2] = 1'b1;
          6'h1b: out_r[2] = 1'b1;
          6'h20: out_r[2] = 1'b1;
          6'h21: out_r[2] = 1'b1;
          6'h22: out_r[2] = 1'b1;
          6'h23: out_r[2] = 1'b1;
          6'h33: out_r[2] = 1'b1;
          6'h36: out_r[2] = 1'b1;
          6'h38: out_r[2] = 1'b1;
          6'h39: out_r[2] = 1'b1;
          6'h3b: out_r[2] = 1'b1;
          6'h3e: out_r[2] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h0c: out_r[3] = 1'b0;
          6'h0d: out_r[3] = 1'b0;
          6'h14: out_r[3] = 1'b0;
          6'h15: out_r[3] = 1'b0;
          6'h19: out_r[3] = 1'b0;
          6'h1c: out_r[3] = 1'b0;
          6'h1d: out_r[3] = 1'b0;
          6'h2c: out_r[3] = 1'b0;
          6'h2d: out_r[3] = 1'b0;
          6'h2f: out_r[3] = 1'b0;
          6'h33: out_r[3] = 1'b0;
          6'h34: out_r[3] = 1'b0;
          6'h35: out_r[3] = 1'b0;
          6'h36: out_r[3] = 1'b0;
          6'h39: out_r[3] = 1'b0;
          6'h3b: out_r[3] = 1'b0;
          6'h3c: out_r[3] = 1'b0;
          6'h3d: out_r[3] = 1'b0;
          6'h3e: out_r[3] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h0c: out_r[4] = 1'b0;
          6'h0d: out_r[4] = 1'b0;
          6'h12: out_r[4] = 1'b0;
          6'h13: out_r[4] = 1'b0;
          6'h16: out_r[4] = 1'b0;
          6'h17: out_r[4] = 1'b0;
          6'h19: out_r[4] = 1'b0;
          6'h1e: out_r[4] = 1'b0;
          6'h1f: out_r[4] = 1'b0;
          6'h24: out_r[4] = 1'b0;
          6'h2c: out_r[4] = 1'b0;
          6'h2d: out_r[4] = 1'b0;
          6'h33: out_r[4] = 1'b0;
          6'h35: out_r[4] = 1'b0;
          6'h36: out_r[4] = 1'b0;
          6'h38: out_r[4] = 1'b0;
          6'h39: out_r[4] = 1'b0;
          6'h3a: out_r[4] = 1'b0;
          6'h3b: out_r[4] = 1'b0;
          6'h3d: out_r[4] = 1'b0;
          6'h3e: out_r[4] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h04: out_r[5] = 1'b1;
          6'h05: out_r[5] = 1'b1;
          6'h06: out_r[5] = 1'b1;
          6'h07: out_r[5] = 1'b1;
          6'h08: out_r[5] = 1'b1;
          6'h09: out_r[5] = 1'b1;
          6'h0a: out_r[5] = 1'b1;
          6'h0b: out_r[5] = 1'b1;
          6'h12: out_r[5] = 1'b1;
          6'h13: out_r[5] = 1'b1;
          6'h16: out_r[5] = 1'b1;
          6'h17: out_r[5] = 1'b1;
          6'h1e: out_r[5] = 1'b1;
          6'h1f: out_r[5] = 1'b1;
          6'h24: out_r[5] = 1'b1;
          6'h25: out_r[5] = 1'b1;
          6'h28: out_r[5] = 1'b1;
          6'h29: out_r[5] = 1'b1;
          6'h2a: out_r[5] = 1'b1;
          6'h2b: out_r[5] = 1'b1;
          6'h30: out_r[5] = 1'b1;
          6'h31: out_r[5] = 1'b1;
          6'h33: out_r[5] = 1'b1;
          6'h35: out_r[5] = 1'b1;
          6'h36: out_r[5] = 1'b1;
          6'h37: out_r[5] = 1'b1;
          6'h38: out_r[5] = 1'b1;
          6'h39: out_r[5] = 1'b1;
          6'h3a: out_r[5] = 1'b1;
          6'h3d: out_r[5] = 1'b1;
          6'h3e: out_r[5] = 1'b1;
          6'h3f: out_r[5] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h08: out_r[6] = 1'b1;
          6'h09: out_r[6] = 1'b1;
          6'h0a: out_r[6] = 1'b1;
          6'h0b: out_r[6] = 1'b1;
          6'h0c: out_r[6] = 1'b1;
          6'h0d: out_r[6] = 1'b1;
          6'h12: out_r[6] = 1'b1;
          6'h13: out_r[6] = 1'b1;
          6'h16: out_r[6] = 1'b1;
          6'h17: out_r[6] = 1'b1;
          6'h1e: out_r[6] = 1'b1;
          6'h1f: out_r[6] = 1'b1;
          6'h24: out_r[6] = 1'b1;
          6'h28: out_r[6] = 1'b1;
          6'h29: out_r[6] = 1'b1;
          6'h2a: out_r[6] = 1'b1;
          6'h2b: out_r[6] = 1'b1;
          6'h2c: out_r[6] = 1'b1;
          6'h2d: out_r[6] = 1'b1;
          6'h30: out_r[6] = 1'b1;
          6'h31: out_r[6] = 1'b1;
          6'h32: out_r[6] = 1'b1;
          6'h33: out_r[6] = 1'b1;
          6'h35: out_r[6] = 1'b1;
          6'h36: out_r[6] = 1'b1;
          6'h37: out_r[6] = 1'b1;
          6'h38: out_r[6] = 1'b1;
          6'h39: out_r[6] = 1'b1;
          6'h3a: out_r[6] = 1'b1;
          6'h3d: out_r[6] = 1'b1;
          6'h3e: out_r[6] = 1'b1;
          6'h3f: out_r[6] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h12: out_r[7] = 1'b1;
          6'h13: out_r[7] = 1'b1;
          6'h16: out_r[7] = 1'b1;
          6'h17: out_r[7] = 1'b1;
          6'h1e: out_r[7] = 1'b1;
          6'h1f: out_r[7] = 1'b1;
          6'h24: out_r[7] = 1'b1;
          6'h28: out_r[7] = 1'b1;
          6'h2e: out_r[7] = 1'b1;
          6'h35: out_r[7] = 1'b1;
          6'h38: out_r[7] = 1'b1;
          6'h39: out_r[7] = 1'b1;
          6'h3a: out_r[7] = 1'b1;
          6'h3d: out_r[7] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[8] = 1'b0;
          6'h09: out_r[8] = 1'b0;
          6'h16: out_r[8] = 1'b0;
          6'h17: out_r[8] = 1'b0;
          6'h18: out_r[8] = 1'b0;
          6'h1e: out_r[8] = 1'b0;
          6'h1f: out_r[8] = 1'b0;
          6'h21: out_r[8] = 1'b0;
          6'h25: out_r[8] = 1'b0;
          6'h26: out_r[8] = 1'b0;
          6'h27: out_r[8] = 1'b0;
          6'h28: out_r[8] = 1'b0;
          6'h2d: out_r[8] = 1'b0;
          6'h2e: out_r[8] = 1'b0;
          6'h2f: out_r[8] = 1'b0;
          6'h32: out_r[8] = 1'b0;
          6'h35: out_r[8] = 1'b0;
          6'h38: out_r[8] = 1'b0;
          6'h39: out_r[8] = 1'b0;
          6'h3a: out_r[8] = 1'b0;
          6'h3b: out_r[8] = 1'b0;
          6'h3d: out_r[8] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[9] = 1'b1;
          6'h09: out_r[9] = 1'b1;
          6'h0e: out_r[9] = 1'b1;
          6'h0f: out_r[9] = 1'b1;
          6'h14: out_r[9] = 1'b1;
          6'h15: out_r[9] = 1'b1;
          6'h16: out_r[9] = 1'b1;
          6'h17: out_r[9] = 1'b1;
          6'h18: out_r[9] = 1'b1;
          6'h1a: out_r[9] = 1'b1;
          6'h1b: out_r[9] = 1'b1;
          6'h1c: out_r[9] = 1'b1;
          6'h1d: out_r[9] = 1'b1;
          6'h1e: out_r[9] = 1'b1;
          6'h1f: out_r[9] = 1'b1;
          6'h21: out_r[9] = 1'b1;
          6'h24: out_r[9] = 1'b1;
          6'h25: out_r[9] = 1'b1;
          6'h26: out_r[9] = 1'b1;
          6'h27: out_r[9] = 1'b1;
          6'h28: out_r[9] = 1'b1;
          6'h2d: out_r[9] = 1'b1;
          6'h2e: out_r[9] = 1'b1;
          6'h2f: out_r[9] = 1'b1;
          6'h32: out_r[9] = 1'b1;
          6'h34: out_r[9] = 1'b1;
          6'h35: out_r[9] = 1'b1;
          6'h39: out_r[9] = 1'b1;
          6'h3c: out_r[9] = 1'b1;
          6'h3d: out_r[9] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[10] = 1'b1;
          6'h09: out_r[10] = 1'b1;
          6'h0e: out_r[10] = 1'b1;
          6'h0f: out_r[10] = 1'b1;
          6'h16: out_r[10] = 1'b1;
          6'h17: out_r[10] = 1'b1;
          6'h18: out_r[10] = 1'b1;
          6'h1e: out_r[10] = 1'b1;
          6'h1f: out_r[10] = 1'b1;
          6'h21: out_r[10] = 1'b1;
          6'h24: out_r[10] = 1'b1;
          6'h25: out_r[10] = 1'b1;
          6'h26: out_r[10] = 1'b1;
          6'h27: out_r[10] = 1'b1;
          6'h28: out_r[10] = 1'b1;
          6'h2d: out_r[10] = 1'b1;
          6'h2e: out_r[10] = 1'b1;
          6'h2f: out_r[10] = 1'b1;
          6'h30: out_r[10] = 1'b1;
          6'h32: out_r[10] = 1'b1;
          6'h35: out_r[10] = 1'b1;
          6'h39: out_r[10] = 1'b1;
          6'h3b: out_r[10] = 1'b1;
          6'h3d: out_r[10] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[11] = 1'b1;
          6'h05: out_r[11] = 1'b1;
          6'h0a: out_r[11] = 1'b1;
          6'h0b: out_r[11] = 1'b1;
          6'h0d: out_r[11] = 1'b1;
          6'h15: out_r[11] = 1'b1;
          6'h16: out_r[11] = 1'b1;
          6'h17: out_r[11] = 1'b1;
          6'h18: out_r[11] = 1'b1;
          6'h1a: out_r[11] = 1'b1;
          6'h1b: out_r[11] = 1'b1;
          6'h1d: out_r[11] = 1'b1;
          6'h1e: out_r[11] = 1'b1;
          6'h1f: out_r[11] = 1'b1;
          6'h21: out_r[11] = 1'b1;
          6'h22: out_r[11] = 1'b1;
          6'h23: out_r[11] = 1'b1;
          6'h25: out_r[11] = 1'b1;
          6'h2c: out_r[11] = 1'b1;
          6'h2d: out_r[11] = 1'b1;
          6'h2f: out_r[11] = 1'b1;
          6'h32: out_r[11] = 1'b1;
          6'h34: out_r[11] = 1'b1;
          6'h35: out_r[11] = 1'b1;
          6'h38: out_r[11] = 1'b1;
          6'h3a: out_r[11] = 1'b1;
          6'h3c: out_r[11] = 1'b1;
          6'h3d: out_r[11] = 1'b1;
          default: begin end
        endcase
      end
      6'h17: begin
        out_r = 12'h778;
        case (inner)
          6'h02: out_r[0] = 1'b1;
          6'h03: out_r[0] = 1'b1;
          6'h06: out_r[0] = 1'b1;
          6'h09: out_r[0] = 1'b1;
          6'h0c: out_r[0] = 1'b1;
          6'h0d: out_r[0] = 1'b1;
          6'h0e: out_r[0] = 1'b1;
          6'h11: out_r[0] = 1'b1;
          6'h12: out_r[0] = 1'b1;
          6'h14: out_r[0] = 1'b1;
          6'h15: out_r[0] = 1'b1;
          6'h16: out_r[0] = 1'b1;
          6'h17: out_r[0] = 1'b1;
          6'h18: out_r[0] = 1'b1;
          6'h1c: out_r[0] = 1'b1;
          6'h1d: out_r[0] = 1'b1;
          6'h1e: out_r[0] = 1'b1;
          6'h1f: out_r[0] = 1'b1;
          6'h23: out_r[0] = 1'b1;
          6'h26: out_r[0] = 1'b1;
          6'h28: out_r[0] = 1'b1;
          6'h2a: out_r[0] = 1'b1;
          6'h31: out_r[0] = 1'b1;
          6'h35: out_r[0] = 1'b1;
          6'h36: out_r[0] = 1'b1;
          6'h37: out_r[0] = 1'b1;
          6'h38: out_r[0] = 1'b1;
          6'h3a: out_r[0] = 1'b1;
          6'h3d: out_r[0] = 1'b1;
          6'h3e: out_r[0] = 1'b1;
          6'h3f: out_r[0] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[1] = 1'b1;
          6'h01: out_r[1] = 1'b1;
          6'h04: out_r[1] = 1'b1;
          6'h05: out_r[1] = 1'b1;
          6'h06: out_r[1] = 1'b1;
          6'h08: out_r[1] = 1'b1;
          6'h09: out_r[1] = 1'b1;
          6'h0a: out_r[1] = 1'b1;
          6'h0b: out_r[1] = 1'b1;
          6'h0e: out_r[1] = 1'b1;
          6'h10: out_r[1] = 1'b1;
          6'h13: out_r[1] = 1'b1;
          6'h18: out_r[1] = 1'b1;
          6'h19: out_r[1] = 1'b1;
          6'h1a: out_r[1] = 1'b1;
          6'h1b: out_r[1] = 1'b1;
          6'h20: out_r[1] = 1'b1;
          6'h21: out_r[1] = 1'b1;
          6'h22: out_r[1] = 1'b1;
          6'h24: out_r[1] = 1'b1;
          6'h25: out_r[1] = 1'b1;
          6'h26: out_r[1] = 1'b1;
          6'h2a: out_r[1] = 1'b1;
          6'h2b: out_r[1] = 1'b1;
          6'h2d: out_r[1] = 1'b1;
          6'h2e: out_r[1] = 1'b1;
          6'h30: out_r[1] = 1'b1;
          6'h32: out_r[1] = 1'b1;
          6'h33: out_r[1] = 1'b1;
          6'h38: out_r[1] = 1'b1;
          6'h39: out_r[1] = 1'b1;
          6'h3b: out_r[1] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[2] = 1'b1;
          6'h01: out_r[2] = 1'b1;
          6'h05: out_r[2] = 1'b1;
          6'h09: out_r[2] = 1'b1;
          6'h0b: out_r[2] = 1'b1;
          6'h0e: out_r[2] = 1'b1;
          6'h0f: out_r[2] = 1'b1;
          6'h10: out_r[2] = 1'b1;
          6'h13: out_r[2] = 1'b1;
          6'h19: out_r[2] = 1'b1;
          6'h1a: out_r[2] = 1'b1;
          6'h1b: out_r[2] = 1'b1;
          6'h20: out_r[2] = 1'b1;
          6'h21: out_r[2] = 1'b1;
          6'h22: out_r[2] = 1'b1;
          6'h24: out_r[2] = 1'b1;
          6'h25: out_r[2] = 1'b1;
          6'h2a: out_r[2] = 1'b1;
          6'h2c: out_r[2] = 1'b1;
          6'h2d: out_r[2] = 1'b1;
          6'h2e: out_r[2] = 1'b1;
          6'h2f: out_r[2] = 1'b1;
          6'h30: out_r[2] = 1'b1;
          6'h32: out_r[2] = 1'b1;
          6'h33: out_r[2] = 1'b1;
          6'h34: out_r[2] = 1'b1;
          6'h38: out_r[2] = 1'b1;
          6'h39: out_r[2] = 1'b1;
          6'h3a: out_r[2] = 1'b1;
          6'h3b: out_r[2] = 1'b1;
          6'h3c: out_r[2] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h05: out_r[3] = 1'b0;
          6'h0c: out_r[3] = 1'b0;
          6'h0d: out_r[3] = 1'b0;
          6'h0e: out_r[3] = 1'b0;
          6'h0f: out_r[3] = 1'b0;
          6'h14: out_r[3] = 1'b0;
          6'h15: out_r[3] = 1'b0;
          6'h19: out_r[3] = 1'b0;
          6'h1a: out_r[3] = 1'b0;
          6'h1c: out_r[3] = 1'b0;
          6'h1d: out_r[3] = 1'b0;
          6'h25: out_r[3] = 1'b0;
          6'h28: out_r[3] = 1'b0;
          6'h2a: out_r[3] = 1'b0;
          6'h2e: out_r[3] = 1'b0;
          6'h2f: out_r[3] = 1'b0;
          6'h35: out_r[3] = 1'b0;
          6'h36: out_r[3] = 1'b0;
          6'h38: out_r[3] = 1'b0;
          6'h39: out_r[3] = 1'b0;
          6'h3a: out_r[3] = 1'b0;
          6'h3d: out_r[3] = 1'b0;
          6'h3e: out_r[3] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h02: out_r[4] = 1'b0;
          6'h03: out_r[4] = 1'b0;
          6'h05: out_r[4] = 1'b0;
          6'h09: out_r[4] = 1'b0;
          6'h0c: out_r[4] = 1'b0;
          6'h0d: out_r[4] = 1'b0;
          6'h0e: out_r[4] = 1'b0;
          6'h0f: out_r[4] = 1'b0;
          6'h11: out_r[4] = 1'b0;
          6'h13: out_r[4] = 1'b0;
          6'h16: out_r[4] = 1'b0;
          6'h19: out_r[4] = 1'b0;
          6'h1a: out_r[4] = 1'b0;
          6'h1b: out_r[4] = 1'b0;
          6'h1e: out_r[4] = 1'b0;
          6'h23: out_r[4] = 1'b0;
          6'h25: out_r[4] = 1'b0;
          6'h28: out_r[4] = 1'b0;
          6'h2a: out_r[4] = 1'b0;
          6'h2c: out_r[4] = 1'b0;
          6'h2e: out_r[4] = 1'b0;
          6'h2f: out_r[4] = 1'b0;
          6'h30: out_r[4] = 1'b0;
          6'h31: out_r[4] = 1'b0;
          6'h32: out_r[4] = 1'b0;
          6'h33: out_r[4] = 1'b0;
          6'h34: out_r[4] = 1'b0;
          6'h39: out_r[4] = 1'b0;
          6'h3a: out_r[4] = 1'b0;
          6'h3b: out_r[4] = 1'b0;
          6'h3c: out_r[4] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[5] = 1'b0;
          6'h01: out_r[5] = 1'b0;
          6'h05: out_r[5] = 1'b0;
          6'h0b: out_r[5] = 1'b0;
          6'h0c: out_r[5] = 1'b0;
          6'h0e: out_r[5] = 1'b0;
          6'h0f: out_r[5] = 1'b0;
          6'h10: out_r[5] = 1'b0;
          6'h12: out_r[5] = 1'b0;
          6'h14: out_r[5] = 1'b0;
          6'h15: out_r[5] = 1'b0;
          6'h17: out_r[5] = 1'b0;
          6'h1a: out_r[5] = 1'b0;
          6'h1c: out_r[5] = 1'b0;
          6'h1d: out_r[5] = 1'b0;
          6'h1f: out_r[5] = 1'b0;
          6'h20: out_r[5] = 1'b0;
          6'h21: out_r[5] = 1'b0;
          6'h22: out_r[5] = 1'b0;
          6'h25: out_r[5] = 1'b0;
          6'h29: out_r[5] = 1'b0;
          6'h2b: out_r[5] = 1'b0;
          6'h35: out_r[5] = 1'b0;
          6'h36: out_r[5] = 1'b0;
          6'h37: out_r[5] = 1'b0;
          6'h38: out_r[5] = 1'b0;
          6'h3d: out_r[5] = 1'b0;
          6'h3e: out_r[5] = 1'b0;
          6'h3f: out_r[5] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[6] = 1'b0;
          6'h01: out_r[6] = 1'b0;
          6'h04: out_r[6] = 1'b0;
          6'h06: out_r[6] = 1'b0;
          6'h07: out_r[6] = 1'b0;
          6'h10: out_r[6] = 1'b0;
          6'h12: out_r[6] = 1'b0;
          6'h14: out_r[6] = 1'b0;
          6'h17: out_r[6] = 1'b0;
          6'h1a: out_r[6] = 1'b0;
          6'h1c: out_r[6] = 1'b0;
          6'h1f: out_r[6] = 1'b0;
          6'h20: out_r[6] = 1'b0;
          6'h21: out_r[6] = 1'b0;
          6'h26: out_r[6] = 1'b0;
          6'h27: out_r[6] = 1'b0;
          6'h2b: out_r[6] = 1'b0;
          6'h36: out_r[6] = 1'b0;
          6'h37: out_r[6] = 1'b0;
          6'h3e: out_r[6] = 1'b0;
          6'h3f: out_r[6] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h01: out_r[7] = 1'b1;
          6'h02: out_r[7] = 1'b1;
          6'h03: out_r[7] = 1'b1;
          6'h0d: out_r[7] = 1'b1;
          6'h11: out_r[7] = 1'b1;
          6'h13: out_r[7] = 1'b1;
          6'h16: out_r[7] = 1'b1;
          6'h17: out_r[7] = 1'b1;
          6'h1b: out_r[7] = 1'b1;
          6'h1e: out_r[7] = 1'b1;
          6'h1f: out_r[7] = 1'b1;
          6'h21: out_r[7] = 1'b1;
          6'h23: out_r[7] = 1'b1;
          6'h28: out_r[7] = 1'b1;
          6'h2b: out_r[7] = 1'b1;
          6'h30: out_r[7] = 1'b1;
          6'h31: out_r[7] = 1'b1;
          6'h32: out_r[7] = 1'b1;
          6'h33: out_r[7] = 1'b1;
          6'h37: out_r[7] = 1'b1;
          6'h3b: out_r[7] = 1'b1;
          6'h3f: out_r[7] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h01: out_r[8] = 1'b0;
          6'h06: out_r[8] = 1'b0;
          6'h08: out_r[8] = 1'b0;
          6'h0a: out_r[8] = 1'b0;
          6'h0b: out_r[8] = 1'b0;
          6'h11: out_r[8] = 1'b0;
          6'h12: out_r[8] = 1'b0;
          6'h17: out_r[8] = 1'b0;
          6'h1f: out_r[8] = 1'b0;
          6'h21: out_r[8] = 1'b0;
          6'h28: out_r[8] = 1'b0;
          6'h2b: out_r[8] = 1'b0;
          6'h30: out_r[8] = 1'b0;
          6'h31: out_r[8] = 1'b0;
          6'h32: out_r[8] = 1'b0;
          6'h37: out_r[8] = 1'b0;
          6'h38: out_r[8] = 1'b0;
          6'h3f: out_r[8] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[9] = 1'b0;
          6'h04: out_r[9] = 1'b0;
          6'h05: out_r[9] = 1'b0;
          6'h07: out_r[9] = 1'b0;
          6'h09: out_r[9] = 1'b0;
          6'h0c: out_r[9] = 1'b0;
          6'h0e: out_r[9] = 1'b0;
          6'h0f: out_r[9] = 1'b0;
          6'h17: out_r[9] = 1'b0;
          6'h19: out_r[9] = 1'b0;
          6'h1a: out_r[9] = 1'b0;
          6'h1f: out_r[9] = 1'b0;
          6'h24: out_r[9] = 1'b0;
          6'h25: out_r[9] = 1'b0;
          6'h26: out_r[9] = 1'b0;
          6'h27: out_r[9] = 1'b0;
          6'h29: out_r[9] = 1'b0;
          6'h2a: out_r[9] = 1'b0;
          6'h2c: out_r[9] = 1'b0;
          6'h2d: out_r[9] = 1'b0;
          6'h2e: out_r[9] = 1'b0;
          6'h2f: out_r[9] = 1'b0;
          6'h32: out_r[9] = 1'b0;
          6'h34: out_r[9] = 1'b0;
          6'h37: out_r[9] = 1'b0;
          6'h39: out_r[9] = 1'b0;
          6'h3a: out_r[9] = 1'b0;
          6'h3c: out_r[9] = 1'b0;
          6'h3f: out_r[9] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[10] = 1'b0;
          6'h04: out_r[10] = 1'b0;
          6'h05: out_r[10] = 1'b0;
          6'h07: out_r[10] = 1'b0;
          6'h09: out_r[10] = 1'b0;
          6'h0c: out_r[10] = 1'b0;
          6'h0e: out_r[10] = 1'b0;
          6'h0f: out_r[10] = 1'b0;
          6'h10: out_r[10] = 1'b0;
          6'h14: out_r[10] = 1'b0;
          6'h19: out_r[10] = 1'b0;
          6'h1a: out_r[10] = 1'b0;
          6'h1c: out_r[10] = 1'b0;
          6'h24: out_r[10] = 1'b0;
          6'h25: out_r[10] = 1'b0;
          6'h27: out_r[10] = 1'b0;
          6'h29: out_r[10] = 1'b0;
          6'h2c: out_r[10] = 1'b0;
          6'h2d: out_r[10] = 1'b0;
          6'h2e: out_r[10] = 1'b0;
          6'h2f: out_r[10] = 1'b0;
          6'h34: out_r[10] = 1'b0;
          6'h39: out_r[10] = 1'b0;
          6'h3a: out_r[10] = 1'b0;
          6'h3c: out_r[10] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h06: out_r[11] = 1'b1;
          6'h07: out_r[11] = 1'b1;
          6'h08: out_r[11] = 1'b1;
          6'h0a: out_r[11] = 1'b1;
          6'h0b: out_r[11] = 1'b1;
          6'h0f: out_r[11] = 1'b1;
          6'h19: out_r[11] = 1'b1;
          6'h1a: out_r[11] = 1'b1;
          6'h27: out_r[11] = 1'b1;
          6'h2b: out_r[11] = 1'b1;
          6'h2f: out_r[11] = 1'b1;
          6'h30: out_r[11] = 1'b1;
          6'h39: out_r[11] = 1'b1;
          default: begin end
        endcase
      end
      6'h18: begin
        out_r = 12'h390;
        case (inner)
          6'h00: out_r[0] = 1'b1;
          6'h02: out_r[0] = 1'b1;
          6'h06: out_r[0] = 1'b1;
          6'h09: out_r[0] = 1'b1;
          6'h0a: out_r[0] = 1'b1;
          6'h0d: out_r[0] = 1'b1;
          6'h0e: out_r[0] = 1'b1;
          6'h12: out_r[0] = 1'b1;
          6'h13: out_r[0] = 1'b1;
          6'h16: out_r[0] = 1'b1;
          6'h1a: out_r[0] = 1'b1;
          6'h1b: out_r[0] = 1'b1;
          6'h1e: out_r[0] = 1'b1;
          6'h20: out_r[0] = 1'b1;
          6'h21: out_r[0] = 1'b1;
          6'h22: out_r[0] = 1'b1;
          6'h24: out_r[0] = 1'b1;
          6'h25: out_r[0] = 1'b1;
          6'h26: out_r[0] = 1'b1;
          6'h28: out_r[0] = 1'b1;
          6'h29: out_r[0] = 1'b1;
          6'h2a: out_r[0] = 1'b1;
          6'h2c: out_r[0] = 1'b1;
          6'h2d: out_r[0] = 1'b1;
          6'h2e: out_r[0] = 1'b1;
          6'h32: out_r[0] = 1'b1;
          6'h33: out_r[0] = 1'b1;
          6'h36: out_r[0] = 1'b1;
          6'h37: out_r[0] = 1'b1;
          6'h3a: out_r[0] = 1'b1;
          6'h3b: out_r[0] = 1'b1;
          6'h3e: out_r[0] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[1] = 1'b1;
          6'h02: out_r[1] = 1'b1;
          6'h05: out_r[1] = 1'b1;
          6'h06: out_r[1] = 1'b1;
          6'h09: out_r[1] = 1'b1;
          6'h0a: out_r[1] = 1'b1;
          6'h0d: out_r[1] = 1'b1;
          6'h0e: out_r[1] = 1'b1;
          6'h0f: out_r[1] = 1'b1;
          6'h11: out_r[1] = 1'b1;
          6'h15: out_r[1] = 1'b1;
          6'h19: out_r[1] = 1'b1;
          6'h1d: out_r[1] = 1'b1;
          6'h1f: out_r[1] = 1'b1;
          6'h20: out_r[1] = 1'b1;
          6'h21: out_r[1] = 1'b1;
          6'h22: out_r[1] = 1'b1;
          6'h24: out_r[1] = 1'b1;
          6'h26: out_r[1] = 1'b1;
          6'h28: out_r[1] = 1'b1;
          6'h2a: out_r[1] = 1'b1;
          6'h2c: out_r[1] = 1'b1;
          6'h2e: out_r[1] = 1'b1;
          6'h31: out_r[1] = 1'b1;
          6'h35: out_r[1] = 1'b1;
          6'h39: out_r[1] = 1'b1;
          6'h3a: out_r[1] = 1'b1;
          6'h3d: out_r[1] = 1'b1;
          6'h3e: out_r[1] = 1'b1;
          6'h3f: out_r[1] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[2] = 1'b1;
          6'h01: out_r[2] = 1'b1;
          6'h05: out_r[2] = 1'b1;
          6'h06: out_r[2] = 1'b1;
          6'h07: out_r[2] = 1'b1;
          6'h09: out_r[2] = 1'b1;
          6'h0b: out_r[2] = 1'b1;
          6'h0d: out_r[2] = 1'b1;
          6'h12: out_r[2] = 1'b1;
          6'h13: out_r[2] = 1'b1;
          6'h16: out_r[2] = 1'b1;
          6'h17: out_r[2] = 1'b1;
          6'h1a: out_r[2] = 1'b1;
          6'h1b: out_r[2] = 1'b1;
          6'h1e: out_r[2] = 1'b1;
          6'h20: out_r[2] = 1'b1;
          6'h21: out_r[2] = 1'b1;
          6'h25: out_r[2] = 1'b1;
          6'h26: out_r[2] = 1'b1;
          6'h29: out_r[2] = 1'b1;
          6'h2d: out_r[2] = 1'b1;
          6'h32: out_r[2] = 1'b1;
          6'h33: out_r[2] = 1'b1;
          6'h36: out_r[2] = 1'b1;
          6'h37: out_r[2] = 1'b1;
          6'h3a: out_r[2] = 1'b1;
          6'h3b: out_r[2] = 1'b1;
          6'h3e: out_r[2] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[3] = 1'b1;
          6'h01: out_r[3] = 1'b1;
          6'h03: out_r[3] = 1'b1;
          6'h06: out_r[3] = 1'b1;
          6'h07: out_r[3] = 1'b1;
          6'h09: out_r[3] = 1'b1;
          6'h0a: out_r[3] = 1'b1;
          6'h0b: out_r[3] = 1'b1;
          6'h0d: out_r[3] = 1'b1;
          6'h0e: out_r[3] = 1'b1;
          6'h0f: out_r[3] = 1'b1;
          6'h14: out_r[3] = 1'b1;
          6'h15: out_r[3] = 1'b1;
          6'h16: out_r[3] = 1'b1;
          6'h17: out_r[3] = 1'b1;
          6'h21: out_r[3] = 1'b1;
          6'h25: out_r[3] = 1'b1;
          6'h29: out_r[3] = 1'b1;
          6'h2a: out_r[3] = 1'b1;
          6'h2d: out_r[3] = 1'b1;
          6'h2e: out_r[3] = 1'b1;
          6'h32: out_r[3] = 1'b1;
          6'h34: out_r[3] = 1'b1;
          6'h35: out_r[3] = 1'b1;
          6'h36: out_r[3] = 1'b1;
          6'h37: out_r[3] = 1'b1;
          6'h3a: out_r[3] = 1'b1;
          6'h3e: out_r[3] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h01: out_r[4] = 1'b0;
          6'h03: out_r[4] = 1'b0;
          6'h04: out_r[4] = 1'b0;
          6'h07: out_r[4] = 1'b0;
          6'h08: out_r[4] = 1'b0;
          6'h09: out_r[4] = 1'b0;
          6'h0a: out_r[4] = 1'b0;
          6'h0c: out_r[4] = 1'b0;
          6'h0d: out_r[4] = 1'b0;
          6'h0e: out_r[4] = 1'b0;
          6'h14: out_r[4] = 1'b0;
          6'h15: out_r[4] = 1'b0;
          6'h16: out_r[4] = 1'b0;
          6'h17: out_r[4] = 1'b0;
          6'h21: out_r[4] = 1'b0;
          6'h23: out_r[4] = 1'b0;
          6'h24: out_r[4] = 1'b0;
          6'h25: out_r[4] = 1'b0;
          6'h27: out_r[4] = 1'b0;
          6'h28: out_r[4] = 1'b0;
          6'h2a: out_r[4] = 1'b0;
          6'h2c: out_r[4] = 1'b0;
          6'h2e: out_r[4] = 1'b0;
          6'h2f: out_r[4] = 1'b0;
          6'h32: out_r[4] = 1'b0;
          6'h34: out_r[4] = 1'b0;
          6'h35: out_r[4] = 1'b0;
          6'h36: out_r[4] = 1'b0;
          6'h3a: out_r[4] = 1'b0;
          6'h3e: out_r[4] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[5] = 1'b1;
          6'h02: out_r[5] = 1'b1;
          6'h05: out_r[5] = 1'b1;
          6'h07: out_r[5] = 1'b1;
          6'h09: out_r[5] = 1'b1;
          6'h0b: out_r[5] = 1'b1;
          6'h0d: out_r[5] = 1'b1;
          6'h20: out_r[5] = 1'b1;
          6'h22: out_r[5] = 1'b1;
          6'h26: out_r[5] = 1'b1;
          6'h2a: out_r[5] = 1'b1;
          6'h2e: out_r[5] = 1'b1;
          6'h3f: out_r[5] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[6] = 1'b1;
          6'h02: out_r[6] = 1'b1;
          6'h03: out_r[6] = 1'b1;
          6'h06: out_r[6] = 1'b1;
          6'h0a: out_r[6] = 1'b1;
          6'h0b: out_r[6] = 1'b1;
          6'h0e: out_r[6] = 1'b1;
          6'h0f: out_r[6] = 1'b1;
          6'h12: out_r[6] = 1'b1;
          6'h13: out_r[6] = 1'b1;
          6'h16: out_r[6] = 1'b1;
          6'h17: out_r[6] = 1'b1;
          6'h1a: out_r[6] = 1'b1;
          6'h1b: out_r[6] = 1'b1;
          6'h1e: out_r[6] = 1'b1;
          6'h1f: out_r[6] = 1'b1;
          6'h22: out_r[6] = 1'b1;
          6'h23: out_r[6] = 1'b1;
          6'h24: out_r[6] = 1'b1;
          6'h26: out_r[6] = 1'b1;
          6'h29: out_r[6] = 1'b1;
          6'h2b: out_r[6] = 1'b1;
          6'h2d: out_r[6] = 1'b1;
          6'h33: out_r[6] = 1'b1;
          6'h37: out_r[6] = 1'b1;
          6'h3b: out_r[6] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h12: out_r[7] = 1'b0;
          6'h13: out_r[7] = 1'b0;
          6'h16: out_r[7] = 1'b0;
          6'h17: out_r[7] = 1'b0;
          6'h1a: out_r[7] = 1'b0;
          6'h1b: out_r[7] = 1'b0;
          6'h1e: out_r[7] = 1'b0;
          6'h32: out_r[7] = 1'b0;
          6'h33: out_r[7] = 1'b0;
          6'h3a: out_r[7] = 1'b0;
          6'h3b: out_r[7] = 1'b0;
          6'h3e: out_r[7] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h03: out_r[8] = 1'b0;
          6'h04: out_r[8] = 1'b0;
          6'h06: out_r[8] = 1'b0;
          6'h08: out_r[8] = 1'b0;
          6'h0a: out_r[8] = 1'b0;
          6'h0b: out_r[8] = 1'b0;
          6'h0c: out_r[8] = 1'b0;
          6'h0e: out_r[8] = 1'b0;
          6'h0f: out_r[8] = 1'b0;
          6'h12: out_r[8] = 1'b0;
          6'h13: out_r[8] = 1'b0;
          6'h16: out_r[8] = 1'b0;
          6'h1a: out_r[8] = 1'b0;
          6'h1b: out_r[8] = 1'b0;
          6'h1e: out_r[8] = 1'b0;
          6'h22: out_r[8] = 1'b0;
          6'h25: out_r[8] = 1'b0;
          6'h27: out_r[8] = 1'b0;
          6'h28: out_r[8] = 1'b0;
          6'h29: out_r[8] = 1'b0;
          6'h2c: out_r[8] = 1'b0;
          6'h2d: out_r[8] = 1'b0;
          6'h2f: out_r[8] = 1'b0;
          6'h32: out_r[8] = 1'b0;
          6'h33: out_r[8] = 1'b0;
          6'h37: out_r[8] = 1'b0;
          6'h3b: out_r[8] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[9] = 1'b0;
          6'h01: out_r[9] = 1'b0;
          6'h02: out_r[9] = 1'b0;
          6'h05: out_r[9] = 1'b0;
          6'h07: out_r[9] = 1'b0;
          6'h09: out_r[9] = 1'b0;
          6'h0d: out_r[9] = 1'b0;
          6'h12: out_r[9] = 1'b0;
          6'h13: out_r[9] = 1'b0;
          6'h16: out_r[9] = 1'b0;
          6'h17: out_r[9] = 1'b0;
          6'h1a: out_r[9] = 1'b0;
          6'h1b: out_r[9] = 1'b0;
          6'h1e: out_r[9] = 1'b0;
          6'h1f: out_r[9] = 1'b0;
          6'h20: out_r[9] = 1'b0;
          6'h21: out_r[9] = 1'b0;
          6'h23: out_r[9] = 1'b0;
          6'h24: out_r[9] = 1'b0;
          6'h26: out_r[9] = 1'b0;
          6'h2a: out_r[9] = 1'b0;
          6'h2b: out_r[9] = 1'b0;
          6'h2e: out_r[9] = 1'b0;
          6'h33: out_r[9] = 1'b0;
          6'h36: out_r[9] = 1'b0;
          6'h3b: out_r[9] = 1'b0;
          6'h3f: out_r[9] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[10] = 1'b1;
          6'h03: out_r[10] = 1'b1;
          6'h04: out_r[10] = 1'b1;
          6'h06: out_r[10] = 1'b1;
          6'h08: out_r[10] = 1'b1;
          6'h0a: out_r[10] = 1'b1;
          6'h0b: out_r[10] = 1'b1;
          6'h0c: out_r[10] = 1'b1;
          6'h0e: out_r[10] = 1'b1;
          6'h0f: out_r[10] = 1'b1;
          6'h12: out_r[10] = 1'b1;
          6'h13: out_r[10] = 1'b1;
          6'h1a: out_r[10] = 1'b1;
          6'h1b: out_r[10] = 1'b1;
          6'h1e: out_r[10] = 1'b1;
          6'h21: out_r[10] = 1'b1;
          6'h22: out_r[10] = 1'b1;
          6'h24: out_r[10] = 1'b1;
          6'h25: out_r[10] = 1'b1;
          6'h26: out_r[10] = 1'b1;
          6'h27: out_r[10] = 1'b1;
          6'h28: out_r[10] = 1'b1;
          6'h29: out_r[10] = 1'b1;
          6'h2a: out_r[10] = 1'b1;
          6'h2c: out_r[10] = 1'b1;
          6'h2d: out_r[10] = 1'b1;
          6'h2e: out_r[10] = 1'b1;
          6'h2f: out_r[10] = 1'b1;
          6'h32: out_r[10] = 1'b1;
          6'h37: out_r[10] = 1'b1;
          6'h3a: out_r[10] = 1'b1;
          6'h3e: out_r[10] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h03: out_r[11] = 1'b1;
          6'h04: out_r[11] = 1'b1;
          6'h05: out_r[11] = 1'b1;
          6'h06: out_r[11] = 1'b1;
          6'h08: out_r[11] = 1'b1;
          6'h0a: out_r[11] = 1'b1;
          6'h0b: out_r[11] = 1'b1;
          6'h0c: out_r[11] = 1'b1;
          6'h0e: out_r[11] = 1'b1;
          6'h0f: out_r[11] = 1'b1;
          6'h16: out_r[11] = 1'b1;
          6'h22: out_r[11] = 1'b1;
          6'h23: out_r[11] = 1'b1;
          6'h25: out_r[11] = 1'b1;
          6'h27: out_r[11] = 1'b1;
          6'h28: out_r[11] = 1'b1;
          6'h29: out_r[11] = 1'b1;
          6'h2b: out_r[11] = 1'b1;
          6'h2c: out_r[11] = 1'b1;
          6'h2d: out_r[11] = 1'b1;
          6'h2f: out_r[11] = 1'b1;
          6'h30: out_r[11] = 1'b1;
          6'h31: out_r[11] = 1'b1;
          6'h34: out_r[11] = 1'b1;
          6'h35: out_r[11] = 1'b1;
          6'h37: out_r[11] = 1'b1;
          6'h38: out_r[11] = 1'b1;
          6'h39: out_r[11] = 1'b1;
          6'h3c: out_r[11] = 1'b1;
          6'h3d: out_r[11] = 1'b1;
          6'h3f: out_r[11] = 1'b1;
          default: begin end
        endcase
      end
      6'h19: begin
        out_r = 12'h181;
        case (inner)
          6'h00: out_r[0] = 1'b0;
          6'h06: out_r[0] = 1'b0;
          6'h0b: out_r[0] = 1'b0;
          6'h16: out_r[0] = 1'b0;
          6'h17: out_r[0] = 1'b0;
          6'h19: out_r[0] = 1'b0;
          6'h1a: out_r[0] = 1'b0;
          6'h1d: out_r[0] = 1'b0;
          6'h1e: out_r[0] = 1'b0;
          6'h21: out_r[0] = 1'b0;
          6'h22: out_r[0] = 1'b0;
          6'h23: out_r[0] = 1'b0;
          6'h24: out_r[0] = 1'b0;
          6'h27: out_r[0] = 1'b0;
          6'h2b: out_r[0] = 1'b0;
          6'h2f: out_r[0] = 1'b0;
          6'h36: out_r[0] = 1'b0;
          6'h37: out_r[0] = 1'b0;
          6'h39: out_r[0] = 1'b0;
          6'h3a: out_r[0] = 1'b0;
          6'h3d: out_r[0] = 1'b0;
          6'h3e: out_r[0] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[1] = 1'b1;
          6'h06: out_r[1] = 1'b1;
          6'h0b: out_r[1] = 1'b1;
          6'h11: out_r[1] = 1'b1;
          6'h12: out_r[1] = 1'b1;
          6'h13: out_r[1] = 1'b1;
          6'h15: out_r[1] = 1'b1;
          6'h16: out_r[1] = 1'b1;
          6'h17: out_r[1] = 1'b1;
          6'h19: out_r[1] = 1'b1;
          6'h1a: out_r[1] = 1'b1;
          6'h1d: out_r[1] = 1'b1;
          6'h1e: out_r[1] = 1'b1;
          6'h21: out_r[1] = 1'b1;
          6'h22: out_r[1] = 1'b1;
          6'h24: out_r[1] = 1'b1;
          6'h27: out_r[1] = 1'b1;
          6'h29: out_r[1] = 1'b1;
          6'h2d: out_r[1] = 1'b1;
          6'h31: out_r[1] = 1'b1;
          6'h33: out_r[1] = 1'b1;
          6'h35: out_r[1] = 1'b1;
          6'h36: out_r[1] = 1'b1;
          6'h37: out_r[1] = 1'b1;
          6'h38: out_r[1] = 1'b1;
          6'h39: out_r[1] = 1'b1;
          6'h3a: out_r[1] = 1'b1;
          6'h3c: out_r[1] = 1'b1;
          6'h3d: out_r[1] = 1'b1;
          6'h3e: out_r[1] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[2] = 1'b1;
          6'h03: out_r[2] = 1'b1;
          6'h06: out_r[2] = 1'b1;
          6'h0b: out_r[2] = 1'b1;
          6'h12: out_r[2] = 1'b1;
          6'h16: out_r[2] = 1'b1;
          6'h17: out_r[2] = 1'b1;
          6'h19: out_r[2] = 1'b1;
          6'h1a: out_r[2] = 1'b1;
          6'h1d: out_r[2] = 1'b1;
          6'h1e: out_r[2] = 1'b1;
          6'h21: out_r[2] = 1'b1;
          6'h22: out_r[2] = 1'b1;
          6'h24: out_r[2] = 1'b1;
          6'h27: out_r[2] = 1'b1;
          6'h2f: out_r[2] = 1'b1;
          6'h36: out_r[2] = 1'b1;
          6'h37: out_r[2] = 1'b1;
          6'h38: out_r[2] = 1'b1;
          6'h39: out_r[2] = 1'b1;
          6'h3a: out_r[2] = 1'b1;
          6'h3c: out_r[2] = 1'b1;
          6'h3d: out_r[2] = 1'b1;
          6'h3e: out_r[2] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[3] = 1'b1;
          6'h06: out_r[3] = 1'b1;
          6'h0a: out_r[3] = 1'b1;
          6'h0b: out_r[3] = 1'b1;
          6'h0e: out_r[3] = 1'b1;
          6'h13: out_r[3] = 1'b1;
          6'h14: out_r[3] = 1'b1;
          6'h15: out_r[3] = 1'b1;
          6'h16: out_r[3] = 1'b1;
          6'h17: out_r[3] = 1'b1;
          6'h19: out_r[3] = 1'b1;
          6'h1d: out_r[3] = 1'b1;
          6'h21: out_r[3] = 1'b1;
          6'h23: out_r[3] = 1'b1;
          6'h28: out_r[3] = 1'b1;
          6'h29: out_r[3] = 1'b1;
          6'h2b: out_r[3] = 1'b1;
          6'h2c: out_r[3] = 1'b1;
          6'h2d: out_r[3] = 1'b1;
          6'h32: out_r[3] = 1'b1;
          6'h33: out_r[3] = 1'b1;
          6'h34: out_r[3] = 1'b1;
          6'h35: out_r[3] = 1'b1;
          6'h36: out_r[3] = 1'b1;
          6'h37: out_r[3] = 1'b1;
          6'h39: out_r[3] = 1'b1;
          6'h3d: out_r[3] = 1'b1;
          6'h3e: out_r[3] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[4] = 1'b1;
          6'h02: out_r[4] = 1'b1;
          6'h03: out_r[4] = 1'b1;
          6'h04: out_r[4] = 1'b1;
          6'h05: out_r[4] = 1'b1;
          6'h06: out_r[4] = 1'b1;
          6'h07: out_r[4] = 1'b1;
          6'h0f: out_r[4] = 1'b1;
          6'h10: out_r[4] = 1'b1;
          6'h12: out_r[4] = 1'b1;
          6'h18: out_r[4] = 1'b1;
          6'h1b: out_r[4] = 1'b1;
          6'h1c: out_r[4] = 1'b1;
          6'h1f: out_r[4] = 1'b1;
          6'h20: out_r[4] = 1'b1;
          6'h22: out_r[4] = 1'b1;
          6'h24: out_r[4] = 1'b1;
          6'h25: out_r[4] = 1'b1;
          6'h26: out_r[4] = 1'b1;
          6'h27: out_r[4] = 1'b1;
          6'h29: out_r[4] = 1'b1;
          6'h2d: out_r[4] = 1'b1;
          6'h2e: out_r[4] = 1'b1;
          6'h2f: out_r[4] = 1'b1;
          6'h38: out_r[4] = 1'b1;
          6'h3a: out_r[4] = 1'b1;
          6'h3b: out_r[4] = 1'b1;
          6'h3c: out_r[4] = 1'b1;
          6'h3f: out_r[4] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[5] = 1'b1;
          6'h02: out_r[5] = 1'b1;
          6'h03: out_r[5] = 1'b1;
          6'h05: out_r[5] = 1'b1;
          6'h0b: out_r[5] = 1'b1;
          6'h11: out_r[5] = 1'b1;
          6'h13: out_r[5] = 1'b1;
          6'h1a: out_r[5] = 1'b1;
          6'h1e: out_r[5] = 1'b1;
          6'h2b: out_r[5] = 1'b1;
          6'h30: out_r[5] = 1'b1;
          6'h31: out_r[5] = 1'b1;
          6'h32: out_r[5] = 1'b1;
          6'h33: out_r[5] = 1'b1;
          6'h3a: out_r[5] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[6] = 1'b1;
          6'h01: out_r[6] = 1'b1;
          6'h02: out_r[6] = 1'b1;
          6'h04: out_r[6] = 1'b1;
          6'h06: out_r[6] = 1'b1;
          6'h08: out_r[6] = 1'b1;
          6'h09: out_r[6] = 1'b1;
          6'h0a: out_r[6] = 1'b1;
          6'h0c: out_r[6] = 1'b1;
          6'h0d: out_r[6] = 1'b1;
          6'h0e: out_r[6] = 1'b1;
          6'h0f: out_r[6] = 1'b1;
          6'h1b: out_r[6] = 1'b1;
          6'h21: out_r[6] = 1'b1;
          6'h23: out_r[6] = 1'b1;
          6'h25: out_r[6] = 1'b1;
          6'h27: out_r[6] = 1'b1;
          6'h29: out_r[6] = 1'b1;
          6'h2d: out_r[6] = 1'b1;
          6'h2f: out_r[6] = 1'b1;
          6'h38: out_r[6] = 1'b1;
          6'h3b: out_r[6] = 1'b1;
          6'h3c: out_r[6] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h0f: out_r[7] = 1'b0;
          6'h11: out_r[7] = 1'b0;
          6'h13: out_r[7] = 1'b0;
          6'h15: out_r[7] = 1'b0;
          6'h17: out_r[7] = 1'b0;
          6'h1b: out_r[7] = 1'b0;
          6'h25: out_r[7] = 1'b0;
          6'h27: out_r[7] = 1'b0;
          6'h2f: out_r[7] = 1'b0;
          6'h30: out_r[7] = 1'b0;
          6'h31: out_r[7] = 1'b0;
          6'h32: out_r[7] = 1'b0;
          6'h33: out_r[7] = 1'b0;
          6'h34: out_r[7] = 1'b0;
          6'h35: out_r[7] = 1'b0;
          6'h36: out_r[7] = 1'b0;
          6'h37: out_r[7] = 1'b0;
          6'h3b: out_r[7] = 1'b0;
          6'h3e: out_r[7] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h09: out_r[8] = 1'b0;
          6'h0d: out_r[8] = 1'b0;
          6'h0f: out_r[8] = 1'b0;
          6'h12: out_r[8] = 1'b0;
          6'h17: out_r[8] = 1'b0;
          6'h19: out_r[8] = 1'b0;
          6'h1b: out_r[8] = 1'b0;
          6'h1d: out_r[8] = 1'b0;
          6'h23: out_r[8] = 1'b0;
          6'h25: out_r[8] = 1'b0;
          6'h27: out_r[8] = 1'b0;
          6'h2b: out_r[8] = 1'b0;
          6'h2f: out_r[8] = 1'b0;
          6'h30: out_r[8] = 1'b0;
          6'h32: out_r[8] = 1'b0;
          6'h34: out_r[8] = 1'b0;
          6'h36: out_r[8] = 1'b0;
          6'h37: out_r[8] = 1'b0;
          6'h39: out_r[8] = 1'b0;
          6'h3b: out_r[8] = 1'b0;
          6'h3d: out_r[8] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h03: out_r[9] = 1'b1;
          6'h07: out_r[9] = 1'b1;
          6'h09: out_r[9] = 1'b1;
          6'h0d: out_r[9] = 1'b1;
          6'h0f: out_r[9] = 1'b1;
          6'h10: out_r[9] = 1'b1;
          6'h12: out_r[9] = 1'b1;
          6'h14: out_r[9] = 1'b1;
          6'h16: out_r[9] = 1'b1;
          6'h17: out_r[9] = 1'b1;
          6'h18: out_r[9] = 1'b1;
          6'h19: out_r[9] = 1'b1;
          6'h1b: out_r[9] = 1'b1;
          6'h1c: out_r[9] = 1'b1;
          6'h1d: out_r[9] = 1'b1;
          6'h1f: out_r[9] = 1'b1;
          6'h20: out_r[9] = 1'b1;
          6'h22: out_r[9] = 1'b1;
          6'h23: out_r[9] = 1'b1;
          6'h24: out_r[9] = 1'b1;
          6'h26: out_r[9] = 1'b1;
          6'h27: out_r[9] = 1'b1;
          6'h28: out_r[9] = 1'b1;
          6'h2a: out_r[9] = 1'b1;
          6'h2b: out_r[9] = 1'b1;
          6'h2c: out_r[9] = 1'b1;
          6'h2e: out_r[9] = 1'b1;
          6'h37: out_r[9] = 1'b1;
          6'h39: out_r[9] = 1'b1;
          6'h3b: out_r[9] = 1'b1;
          6'h3d: out_r[9] = 1'b1;
          6'h3f: out_r[9] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h03: out_r[10] = 1'b1;
          6'h07: out_r[10] = 1'b1;
          6'h09: out_r[10] = 1'b1;
          6'h0b: out_r[10] = 1'b1;
          6'h0d: out_r[10] = 1'b1;
          6'h0f: out_r[10] = 1'b1;
          6'h12: out_r[10] = 1'b1;
          6'h17: out_r[10] = 1'b1;
          6'h19: out_r[10] = 1'b1;
          6'h1b: out_r[10] = 1'b1;
          6'h1d: out_r[10] = 1'b1;
          6'h1f: out_r[10] = 1'b1;
          6'h20: out_r[10] = 1'b1;
          6'h22: out_r[10] = 1'b1;
          6'h23: out_r[10] = 1'b1;
          6'h24: out_r[10] = 1'b1;
          6'h26: out_r[10] = 1'b1;
          6'h27: out_r[10] = 1'b1;
          6'h28: out_r[10] = 1'b1;
          6'h2a: out_r[10] = 1'b1;
          6'h2b: out_r[10] = 1'b1;
          6'h2c: out_r[10] = 1'b1;
          6'h2e: out_r[10] = 1'b1;
          6'h30: out_r[10] = 1'b1;
          6'h32: out_r[10] = 1'b1;
          6'h34: out_r[10] = 1'b1;
          6'h36: out_r[10] = 1'b1;
          6'h37: out_r[10] = 1'b1;
          6'h39: out_r[10] = 1'b1;
          6'h3b: out_r[10] = 1'b1;
          6'h3d: out_r[10] = 1'b1;
          6'h3f: out_r[10] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h09: out_r[11] = 1'b1;
          6'h0d: out_r[11] = 1'b1;
          6'h12: out_r[11] = 1'b1;
          6'h17: out_r[11] = 1'b1;
          6'h19: out_r[11] = 1'b1;
          6'h1d: out_r[11] = 1'b1;
          6'h22: out_r[11] = 1'b1;
          6'h23: out_r[11] = 1'b1;
          6'h27: out_r[11] = 1'b1;
          6'h2b: out_r[11] = 1'b1;
          6'h37: out_r[11] = 1'b1;
          6'h39: out_r[11] = 1'b1;
          6'h3a: out_r[11] = 1'b1;
          6'h3d: out_r[11] = 1'b1;
          default: begin end
        endcase
      end
      6'h1a: begin
        out_r = 12'h1c5;
        case (inner)
          6'h00: out_r[0] = 1'b0;
          6'h04: out_r[0] = 1'b0;
          6'h08: out_r[0] = 1'b0;
          6'h0a: out_r[0] = 1'b0;
          6'h0b: out_r[0] = 1'b0;
          6'h0c: out_r[0] = 1'b0;
          6'h0e: out_r[0] = 1'b0;
          6'h0f: out_r[0] = 1'b0;
          6'h10: out_r[0] = 1'b0;
          6'h14: out_r[0] = 1'b0;
          6'h18: out_r[0] = 1'b0;
          6'h1c: out_r[0] = 1'b0;
          6'h20: out_r[0] = 1'b0;
          6'h21: out_r[0] = 1'b0;
          6'h24: out_r[0] = 1'b0;
          6'h28: out_r[0] = 1'b0;
          6'h2a: out_r[0] = 1'b0;
          6'h2b: out_r[0] = 1'b0;
          6'h2c: out_r[0] = 1'b0;
          6'h2e: out_r[0] = 1'b0;
          6'h2f: out_r[0] = 1'b0;
          6'h30: out_r[0] = 1'b0;
          6'h33: out_r[0] = 1'b0;
          6'h34: out_r[0] = 1'b0;
          6'h38: out_r[0] = 1'b0;
          6'h3c: out_r[0] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h06: out_r[1] = 1'b1;
          6'h07: out_r[1] = 1'b1;
          6'h12: out_r[1] = 1'b1;
          6'h13: out_r[1] = 1'b1;
          6'h16: out_r[1] = 1'b1;
          6'h17: out_r[1] = 1'b1;
          6'h18: out_r[1] = 1'b1;
          6'h19: out_r[1] = 1'b1;
          6'h1a: out_r[1] = 1'b1;
          6'h1b: out_r[1] = 1'b1;
          6'h1c: out_r[1] = 1'b1;
          6'h1e: out_r[1] = 1'b1;
          6'h1f: out_r[1] = 1'b1;
          6'h31: out_r[1] = 1'b1;
          6'h32: out_r[1] = 1'b1;
          6'h36: out_r[1] = 1'b1;
          6'h37: out_r[1] = 1'b1;
          6'h38: out_r[1] = 1'b1;
          6'h3a: out_r[1] = 1'b1;
          6'h3c: out_r[1] = 1'b1;
          6'h3e: out_r[1] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[2] = 1'b0;
          6'h06: out_r[2] = 1'b0;
          6'h07: out_r[2] = 1'b0;
          6'h16: out_r[2] = 1'b0;
          6'h17: out_r[2] = 1'b0;
          6'h18: out_r[2] = 1'b0;
          6'h19: out_r[2] = 1'b0;
          6'h1a: out_r[2] = 1'b0;
          6'h1b: out_r[2] = 1'b0;
          6'h1c: out_r[2] = 1'b0;
          6'h1e: out_r[2] = 1'b0;
          6'h1f: out_r[2] = 1'b0;
          6'h20: out_r[2] = 1'b0;
          6'h21: out_r[2] = 1'b0;
          6'h31: out_r[2] = 1'b0;
          6'h33: out_r[2] = 1'b0;
          6'h37: out_r[2] = 1'b0;
          6'h38: out_r[2] = 1'b0;
          6'h39: out_r[2] = 1'b0;
          6'h3c: out_r[2] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[3] = 1'b1;
          6'h06: out_r[3] = 1'b1;
          6'h07: out_r[3] = 1'b1;
          6'h10: out_r[3] = 1'b1;
          6'h11: out_r[3] = 1'b1;
          6'h12: out_r[3] = 1'b1;
          6'h13: out_r[3] = 1'b1;
          6'h15: out_r[3] = 1'b1;
          6'h16: out_r[3] = 1'b1;
          6'h17: out_r[3] = 1'b1;
          6'h18: out_r[3] = 1'b1;
          6'h1a: out_r[3] = 1'b1;
          6'h1b: out_r[3] = 1'b1;
          6'h1c: out_r[3] = 1'b1;
          6'h1e: out_r[3] = 1'b1;
          6'h1f: out_r[3] = 1'b1;
          6'h20: out_r[3] = 1'b1;
          6'h21: out_r[3] = 1'b1;
          6'h23: out_r[3] = 1'b1;
          6'h30: out_r[3] = 1'b1;
          6'h31: out_r[3] = 1'b1;
          6'h37: out_r[3] = 1'b1;
          6'h38: out_r[3] = 1'b1;
          6'h39: out_r[3] = 1'b1;
          6'h3a: out_r[3] = 1'b1;
          6'h3c: out_r[3] = 1'b1;
          6'h3e: out_r[3] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[4] = 1'b1;
          6'h02: out_r[4] = 1'b1;
          6'h03: out_r[4] = 1'b1;
          6'h04: out_r[4] = 1'b1;
          6'h06: out_r[4] = 1'b1;
          6'h07: out_r[4] = 1'b1;
          6'h09: out_r[4] = 1'b1;
          6'h0d: out_r[4] = 1'b1;
          6'h10: out_r[4] = 1'b1;
          6'h11: out_r[4] = 1'b1;
          6'h12: out_r[4] = 1'b1;
          6'h13: out_r[4] = 1'b1;
          6'h15: out_r[4] = 1'b1;
          6'h16: out_r[4] = 1'b1;
          6'h17: out_r[4] = 1'b1;
          6'h19: out_r[4] = 1'b1;
          6'h1a: out_r[4] = 1'b1;
          6'h1b: out_r[4] = 1'b1;
          6'h1e: out_r[4] = 1'b1;
          6'h1f: out_r[4] = 1'b1;
          6'h20: out_r[4] = 1'b1;
          6'h21: out_r[4] = 1'b1;
          6'h23: out_r[4] = 1'b1;
          6'h24: out_r[4] = 1'b1;
          6'h30: out_r[4] = 1'b1;
          6'h31: out_r[4] = 1'b1;
          6'h37: out_r[4] = 1'b1;
          6'h38: out_r[4] = 1'b1;
          6'h39: out_r[4] = 1'b1;
          6'h3c: out_r[4] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[5] = 1'b1;
          6'h05: out_r[5] = 1'b1;
          6'h11: out_r[5] = 1'b1;
          6'h16: out_r[5] = 1'b1;
          6'h17: out_r[5] = 1'b1;
          6'h18: out_r[5] = 1'b1;
          6'h19: out_r[5] = 1'b1;
          6'h1c: out_r[5] = 1'b1;
          6'h20: out_r[5] = 1'b1;
          6'h27: out_r[5] = 1'b1;
          6'h2a: out_r[5] = 1'b1;
          6'h2d: out_r[5] = 1'b1;
          6'h2e: out_r[5] = 1'b1;
          6'h33: out_r[5] = 1'b1;
          6'h37: out_r[5] = 1'b1;
          6'h3a: out_r[5] = 1'b1;
          6'h3e: out_r[5] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h01: out_r[6] = 1'b0;
          6'h05: out_r[6] = 1'b0;
          6'h09: out_r[6] = 1'b0;
          6'h0d: out_r[6] = 1'b0;
          6'h10: out_r[6] = 1'b0;
          6'h11: out_r[6] = 1'b0;
          6'h14: out_r[6] = 1'b0;
          6'h15: out_r[6] = 1'b0;
          6'h18: out_r[6] = 1'b0;
          6'h1c: out_r[6] = 1'b0;
          6'h1d: out_r[6] = 1'b0;
          6'h22: out_r[6] = 1'b0;
          6'h23: out_r[6] = 1'b0;
          6'h25: out_r[6] = 1'b0;
          6'h26: out_r[6] = 1'b0;
          6'h27: out_r[6] = 1'b0;
          6'h2a: out_r[6] = 1'b0;
          6'h2b: out_r[6] = 1'b0;
          6'h2d: out_r[6] = 1'b0;
          6'h2e: out_r[6] = 1'b0;
          6'h2f: out_r[6] = 1'b0;
          6'h32: out_r[6] = 1'b0;
          6'h33: out_r[6] = 1'b0;
          6'h34: out_r[6] = 1'b0;
          6'h35: out_r[6] = 1'b0;
          6'h3a: out_r[6] = 1'b0;
          6'h3b: out_r[6] = 1'b0;
          6'h3e: out_r[6] = 1'b0;
          6'h3f: out_r[6] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h06: out_r[7] = 1'b0;
          6'h07: out_r[7] = 1'b0;
          6'h12: out_r[7] = 1'b0;
          6'h13: out_r[7] = 1'b0;
          6'h1a: out_r[7] = 1'b0;
          6'h1b: out_r[7] = 1'b0;
          6'h1d: out_r[7] = 1'b0;
          6'h1e: out_r[7] = 1'b0;
          6'h1f: out_r[7] = 1'b0;
          6'h21: out_r[7] = 1'b0;
          6'h27: out_r[7] = 1'b0;
          6'h29: out_r[7] = 1'b0;
          6'h2b: out_r[7] = 1'b0;
          6'h2f: out_r[7] = 1'b0;
          6'h30: out_r[7] = 1'b0;
          6'h31: out_r[7] = 1'b0;
          6'h35: out_r[7] = 1'b0;
          6'h38: out_r[7] = 1'b0;
          6'h39: out_r[7] = 1'b0;
          6'h3c: out_r[7] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h06: out_r[8] = 1'b0;
          6'h07: out_r[8] = 1'b0;
          6'h10: out_r[8] = 1'b0;
          6'h18: out_r[8] = 1'b0;
          6'h1a: out_r[8] = 1'b0;
          6'h1b: out_r[8] = 1'b0;
          6'h1c: out_r[8] = 1'b0;
          6'h1e: out_r[8] = 1'b0;
          6'h1f: out_r[8] = 1'b0;
          6'h21: out_r[8] = 1'b0;
          6'h27: out_r[8] = 1'b0;
          6'h29: out_r[8] = 1'b0;
          6'h2b: out_r[8] = 1'b0;
          6'h2f: out_r[8] = 1'b0;
          6'h30: out_r[8] = 1'b0;
          6'h31: out_r[8] = 1'b0;
          6'h33: out_r[8] = 1'b0;
          6'h37: out_r[8] = 1'b0;
          6'h38: out_r[8] = 1'b0;
          6'h39: out_r[8] = 1'b0;
          6'h3c: out_r[8] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h01: out_r[9] = 1'b1;
          6'h06: out_r[9] = 1'b1;
          6'h07: out_r[9] = 1'b1;
          6'h09: out_r[9] = 1'b1;
          6'h0d: out_r[9] = 1'b1;
          6'h10: out_r[9] = 1'b1;
          6'h14: out_r[9] = 1'b1;
          6'h15: out_r[9] = 1'b1;
          6'h18: out_r[9] = 1'b1;
          6'h1c: out_r[9] = 1'b1;
          6'h23: out_r[9] = 1'b1;
          6'h25: out_r[9] = 1'b1;
          6'h26: out_r[9] = 1'b1;
          6'h29: out_r[9] = 1'b1;
          6'h2b: out_r[9] = 1'b1;
          6'h2f: out_r[9] = 1'b1;
          6'h31: out_r[9] = 1'b1;
          6'h33: out_r[9] = 1'b1;
          6'h34: out_r[9] = 1'b1;
          6'h37: out_r[9] = 1'b1;
          6'h39: out_r[9] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h01: out_r[10] = 1'b1;
          6'h06: out_r[10] = 1'b1;
          6'h07: out_r[10] = 1'b1;
          6'h09: out_r[10] = 1'b1;
          6'h0d: out_r[10] = 1'b1;
          6'h10: out_r[10] = 1'b1;
          6'h15: out_r[10] = 1'b1;
          6'h16: out_r[10] = 1'b1;
          6'h17: out_r[10] = 1'b1;
          6'h18: out_r[10] = 1'b1;
          6'h1a: out_r[10] = 1'b1;
          6'h1b: out_r[10] = 1'b1;
          6'h1c: out_r[10] = 1'b1;
          6'h1e: out_r[10] = 1'b1;
          6'h1f: out_r[10] = 1'b1;
          6'h23: out_r[10] = 1'b1;
          6'h25: out_r[10] = 1'b1;
          6'h26: out_r[10] = 1'b1;
          6'h29: out_r[10] = 1'b1;
          6'h2b: out_r[10] = 1'b1;
          6'h2f: out_r[10] = 1'b1;
          6'h31: out_r[10] = 1'b1;
          6'h32: out_r[10] = 1'b1;
          6'h33: out_r[10] = 1'b1;
          6'h37: out_r[10] = 1'b1;
          6'h39: out_r[10] = 1'b1;
          6'h3a: out_r[10] = 1'b1;
          6'h3b: out_r[10] = 1'b1;
          6'h3e: out_r[10] = 1'b1;
          6'h3f: out_r[10] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h0a: out_r[11] = 1'b1;
          6'h0b: out_r[11] = 1'b1;
          6'h0e: out_r[11] = 1'b1;
          6'h0f: out_r[11] = 1'b1;
          6'h10: out_r[11] = 1'b1;
          6'h18: out_r[11] = 1'b1;
          6'h1a: out_r[11] = 1'b1;
          6'h1b: out_r[11] = 1'b1;
          6'h1c: out_r[11] = 1'b1;
          6'h1e: out_r[11] = 1'b1;
          6'h1f: out_r[11] = 1'b1;
          6'h20: out_r[11] = 1'b1;
          6'h24: out_r[11] = 1'b1;
          6'h28: out_r[11] = 1'b1;
          6'h2b: out_r[11] = 1'b1;
          6'h2c: out_r[11] = 1'b1;
          6'h2f: out_r[11] = 1'b1;
          6'h30: out_r[11] = 1'b1;
          6'h33: out_r[11] = 1'b1;
          6'h34: out_r[11] = 1'b1;
          6'h37: out_r[11] = 1'b1;
          6'h38: out_r[11] = 1'b1;
          6'h3c: out_r[11] = 1'b1;
          default: begin end
        endcase
      end
      6'h1b: begin
        out_r = 12'heba;
        case (inner)
          6'h01: out_r[0] = 1'b1;
          6'h05: out_r[0] = 1'b1;
          6'h07: out_r[0] = 1'b1;
          6'h17: out_r[0] = 1'b1;
          6'h1a: out_r[0] = 1'b1;
          6'h1b: out_r[0] = 1'b1;
          6'h1c: out_r[0] = 1'b1;
          6'h1e: out_r[0] = 1'b1;
          6'h1f: out_r[0] = 1'b1;
          6'h28: out_r[0] = 1'b1;
          6'h2b: out_r[0] = 1'b1;
          6'h2f: out_r[0] = 1'b1;
          6'h30: out_r[0] = 1'b1;
          6'h37: out_r[0] = 1'b1;
          6'h3a: out_r[0] = 1'b1;
          6'h3b: out_r[0] = 1'b1;
          6'h3e: out_r[0] = 1'b1;
          6'h3f: out_r[0] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h02: out_r[1] = 1'b0;
          6'h06: out_r[1] = 1'b0;
          6'h16: out_r[1] = 1'b0;
          6'h17: out_r[1] = 1'b0;
          6'h1a: out_r[1] = 1'b0;
          6'h1b: out_r[1] = 1'b0;
          6'h1e: out_r[1] = 1'b0;
          6'h1f: out_r[1] = 1'b0;
          6'h23: out_r[1] = 1'b0;
          6'h25: out_r[1] = 1'b0;
          6'h26: out_r[1] = 1'b0;
          6'h36: out_r[1] = 1'b0;
          6'h37: out_r[1] = 1'b0;
          6'h38: out_r[1] = 1'b0;
          6'h3a: out_r[1] = 1'b0;
          6'h3b: out_r[1] = 1'b0;
          6'h3e: out_r[1] = 1'b0;
          6'h3f: out_r[1] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h01: out_r[2] = 1'b1;
          6'h02: out_r[2] = 1'b1;
          6'h03: out_r[2] = 1'b1;
          6'h05: out_r[2] = 1'b1;
          6'h06: out_r[2] = 1'b1;
          6'h0b: out_r[2] = 1'b1;
          6'h0f: out_r[2] = 1'b1;
          6'h10: out_r[2] = 1'b1;
          6'h12: out_r[2] = 1'b1;
          6'h13: out_r[2] = 1'b1;
          6'h18: out_r[2] = 1'b1;
          6'h19: out_r[2] = 1'b1;
          6'h1c: out_r[2] = 1'b1;
          6'h26: out_r[2] = 1'b1;
          6'h27: out_r[2] = 1'b1;
          6'h28: out_r[2] = 1'b1;
          6'h2b: out_r[2] = 1'b1;
          6'h2c: out_r[2] = 1'b1;
          6'h2f: out_r[2] = 1'b1;
          6'h30: out_r[2] = 1'b1;
          6'h32: out_r[2] = 1'b1;
          6'h33: out_r[2] = 1'b1;
          6'h34: out_r[2] = 1'b1;
          6'h38: out_r[2] = 1'b1;
          6'h39: out_r[2] = 1'b1;
          6'h3c: out_r[2] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h01: out_r[3] = 1'b0;
          6'h02: out_r[3] = 1'b0;
          6'h03: out_r[3] = 1'b0;
          6'h05: out_r[3] = 1'b0;
          6'h06: out_r[3] = 1'b0;
          6'h0b: out_r[3] = 1'b0;
          6'h0f: out_r[3] = 1'b0;
          6'h10: out_r[3] = 1'b0;
          6'h16: out_r[3] = 1'b0;
          6'h17: out_r[3] = 1'b0;
          6'h18: out_r[3] = 1'b0;
          6'h19: out_r[3] = 1'b0;
          6'h1c: out_r[3] = 1'b0;
          6'h26: out_r[3] = 1'b0;
          6'h27: out_r[3] = 1'b0;
          6'h28: out_r[3] = 1'b0;
          6'h2b: out_r[3] = 1'b0;
          6'h2c: out_r[3] = 1'b0;
          6'h2f: out_r[3] = 1'b0;
          6'h30: out_r[3] = 1'b0;
          6'h34: out_r[3] = 1'b0;
          6'h36: out_r[3] = 1'b0;
          6'h37: out_r[3] = 1'b0;
          6'h38: out_r[3] = 1'b0;
          6'h39: out_r[3] = 1'b0;
          6'h3a: out_r[3] = 1'b0;
          6'h3c: out_r[3] = 1'b0;
          6'h3e: out_r[3] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h01: out_r[4] = 1'b0;
          6'h02: out_r[4] = 1'b0;
          6'h03: out_r[4] = 1'b0;
          6'h05: out_r[4] = 1'b0;
          6'h0b: out_r[4] = 1'b0;
          6'h0f: out_r[4] = 1'b0;
          6'h10: out_r[4] = 1'b0;
          6'h16: out_r[4] = 1'b0;
          6'h17: out_r[4] = 1'b0;
          6'h18: out_r[4] = 1'b0;
          6'h19: out_r[4] = 1'b0;
          6'h1c: out_r[4] = 1'b0;
          6'h26: out_r[4] = 1'b0;
          6'h27: out_r[4] = 1'b0;
          6'h2b: out_r[4] = 1'b0;
          6'h2c: out_r[4] = 1'b0;
          6'h2f: out_r[4] = 1'b0;
          6'h30: out_r[4] = 1'b0;
          6'h32: out_r[4] = 1'b0;
          6'h34: out_r[4] = 1'b0;
          6'h36: out_r[4] = 1'b0;
          6'h37: out_r[4] = 1'b0;
          6'h39: out_r[4] = 1'b0;
          6'h3c: out_r[4] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h02: out_r[5] = 1'b0;
          6'h05: out_r[5] = 1'b0;
          6'h06: out_r[5] = 1'b0;
          6'h0b: out_r[5] = 1'b0;
          6'h0f: out_r[5] = 1'b0;
          6'h10: out_r[5] = 1'b0;
          6'h12: out_r[5] = 1'b0;
          6'h13: out_r[5] = 1'b0;
          6'h16: out_r[5] = 1'b0;
          6'h17: out_r[5] = 1'b0;
          6'h19: out_r[5] = 1'b0;
          6'h1a: out_r[5] = 1'b0;
          6'h1b: out_r[5] = 1'b0;
          6'h1c: out_r[5] = 1'b0;
          6'h1e: out_r[5] = 1'b0;
          6'h1f: out_r[5] = 1'b0;
          6'h28: out_r[5] = 1'b0;
          6'h2b: out_r[5] = 1'b0;
          6'h2c: out_r[5] = 1'b0;
          6'h2f: out_r[5] = 1'b0;
          6'h33: out_r[5] = 1'b0;
          6'h34: out_r[5] = 1'b0;
          6'h36: out_r[5] = 1'b0;
          6'h37: out_r[5] = 1'b0;
          6'h38: out_r[5] = 1'b0;
          6'h39: out_r[5] = 1'b0;
          6'h3a: out_r[5] = 1'b0;
          6'h3b: out_r[5] = 1'b0;
          6'h3e: out_r[5] = 1'b0;
          6'h3f: out_r[5] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h05: out_r[6] = 1'b1;
          6'h06: out_r[6] = 1'b1;
          6'h08: out_r[6] = 1'b1;
          6'h13: out_r[6] = 1'b1;
          6'h17: out_r[6] = 1'b1;
          6'h1b: out_r[6] = 1'b1;
          6'h1d: out_r[6] = 1'b1;
          6'h1f: out_r[6] = 1'b1;
          6'h23: out_r[6] = 1'b1;
          6'h28: out_r[6] = 1'b1;
          6'h33: out_r[6] = 1'b1;
          6'h37: out_r[6] = 1'b1;
          6'h38: out_r[6] = 1'b1;
          6'h3a: out_r[6] = 1'b1;
          6'h3b: out_r[6] = 1'b1;
          6'h3d: out_r[6] = 1'b1;
          6'h3e: out_r[6] = 1'b1;
          6'h3f: out_r[6] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h07: out_r[7] = 1'b0;
          6'h10: out_r[7] = 1'b0;
          6'h13: out_r[7] = 1'b0;
          6'h17: out_r[7] = 1'b0;
          6'h1b: out_r[7] = 1'b0;
          6'h1c: out_r[7] = 1'b0;
          6'h1f: out_r[7] = 1'b0;
          6'h2c: out_r[7] = 1'b0;
          6'h30: out_r[7] = 1'b0;
          6'h32: out_r[7] = 1'b0;
          6'h33: out_r[7] = 1'b0;
          6'h34: out_r[7] = 1'b0;
          6'h36: out_r[7] = 1'b0;
          6'h37: out_r[7] = 1'b0;
          6'h3a: out_r[7] = 1'b0;
          6'h3b: out_r[7] = 1'b0;
          6'h3e: out_r[7] = 1'b0;
          6'h3f: out_r[7] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h02: out_r[8] = 1'b1;
          6'h03: out_r[8] = 1'b1;
          6'h05: out_r[8] = 1'b1;
          6'h06: out_r[8] = 1'b1;
          6'h07: out_r[8] = 1'b1;
          6'h08: out_r[8] = 1'b1;
          6'h0b: out_r[8] = 1'b1;
          6'h0f: out_r[8] = 1'b1;
          6'h10: out_r[8] = 1'b1;
          6'h12: out_r[8] = 1'b1;
          6'h16: out_r[8] = 1'b1;
          6'h18: out_r[8] = 1'b1;
          6'h19: out_r[8] = 1'b1;
          6'h1a: out_r[8] = 1'b1;
          6'h1d: out_r[8] = 1'b1;
          6'h1e: out_r[8] = 1'b1;
          6'h23: out_r[8] = 1'b1;
          6'h25: out_r[8] = 1'b1;
          6'h26: out_r[8] = 1'b1;
          6'h27: out_r[8] = 1'b1;
          6'h28: out_r[8] = 1'b1;
          6'h30: out_r[8] = 1'b1;
          6'h34: out_r[8] = 1'b1;
          6'h39: out_r[8] = 1'b1;
          6'h3c: out_r[8] = 1'b1;
          6'h3d: out_r[8] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h02: out_r[9] = 1'b0;
          6'h03: out_r[9] = 1'b0;
          6'h05: out_r[9] = 1'b0;
          6'h06: out_r[9] = 1'b0;
          6'h07: out_r[9] = 1'b0;
          6'h08: out_r[9] = 1'b0;
          6'h0b: out_r[9] = 1'b0;
          6'h0f: out_r[9] = 1'b0;
          6'h10: out_r[9] = 1'b0;
          6'h17: out_r[9] = 1'b0;
          6'h18: out_r[9] = 1'b0;
          6'h19: out_r[9] = 1'b0;
          6'h1d: out_r[9] = 1'b0;
          6'h23: out_r[9] = 1'b0;
          6'h25: out_r[9] = 1'b0;
          6'h26: out_r[9] = 1'b0;
          6'h27: out_r[9] = 1'b0;
          6'h28: out_r[9] = 1'b0;
          6'h30: out_r[9] = 1'b0;
          6'h32: out_r[9] = 1'b0;
          6'h34: out_r[9] = 1'b0;
          6'h36: out_r[9] = 1'b0;
          6'h37: out_r[9] = 1'b0;
          6'h39: out_r[9] = 1'b0;
          6'h3a: out_r[9] = 1'b0;
          6'h3c: out_r[9] = 1'b0;
          6'h3d: out_r[9] = 1'b0;
          6'h3e: out_r[9] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h02: out_r[10] = 1'b0;
          6'h03: out_r[10] = 1'b0;
          6'h06: out_r[10] = 1'b0;
          6'h08: out_r[10] = 1'b0;
          6'h0b: out_r[10] = 1'b0;
          6'h0f: out_r[10] = 1'b0;
          6'h10: out_r[10] = 1'b0;
          6'h16: out_r[10] = 1'b0;
          6'h18: out_r[10] = 1'b0;
          6'h19: out_r[10] = 1'b0;
          6'h1d: out_r[10] = 1'b0;
          6'h23: out_r[10] = 1'b0;
          6'h25: out_r[10] = 1'b0;
          6'h26: out_r[10] = 1'b0;
          6'h27: out_r[10] = 1'b0;
          6'h28: out_r[10] = 1'b0;
          6'h32: out_r[10] = 1'b0;
          6'h34: out_r[10] = 1'b0;
          6'h36: out_r[10] = 1'b0;
          6'h39: out_r[10] = 1'b0;
          6'h3a: out_r[10] = 1'b0;
          6'h3c: out_r[10] = 1'b0;
          6'h3d: out_r[10] = 1'b0;
          6'h3e: out_r[10] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h02: out_r[11] = 1'b0;
          6'h05: out_r[11] = 1'b0;
          6'h07: out_r[11] = 1'b0;
          6'h0b: out_r[11] = 1'b0;
          6'h0f: out_r[11] = 1'b0;
          6'h10: out_r[11] = 1'b0;
          6'h12: out_r[11] = 1'b0;
          6'h13: out_r[11] = 1'b0;
          6'h17: out_r[11] = 1'b0;
          6'h19: out_r[11] = 1'b0;
          6'h1a: out_r[11] = 1'b0;
          6'h1b: out_r[11] = 1'b0;
          6'h1d: out_r[11] = 1'b0;
          6'h1e: out_r[11] = 1'b0;
          6'h1f: out_r[11] = 1'b0;
          6'h23: out_r[11] = 1'b0;
          6'h25: out_r[11] = 1'b0;
          6'h26: out_r[11] = 1'b0;
          6'h28: out_r[11] = 1'b0;
          6'h30: out_r[11] = 1'b0;
          6'h32: out_r[11] = 1'b0;
          6'h33: out_r[11] = 1'b0;
          6'h36: out_r[11] = 1'b0;
          6'h37: out_r[11] = 1'b0;
          6'h39: out_r[11] = 1'b0;
          6'h3a: out_r[11] = 1'b0;
          6'h3b: out_r[11] = 1'b0;
          6'h3d: out_r[11] = 1'b0;
          6'h3e: out_r[11] = 1'b0;
          6'h3f: out_r[11] = 1'b0;
          default: begin end
        endcase
      end
      6'h1c: begin
        out_r = 12'h3a4;
        case (inner)
          6'h03: out_r[0] = 1'b1;
          6'h05: out_r[0] = 1'b1;
          6'h07: out_r[0] = 1'b1;
          6'h09: out_r[0] = 1'b1;
          6'h0b: out_r[0] = 1'b1;
          6'h0c: out_r[0] = 1'b1;
          6'h0e: out_r[0] = 1'b1;
          6'h18: out_r[0] = 1'b1;
          6'h1b: out_r[0] = 1'b1;
          6'h23: out_r[0] = 1'b1;
          6'h25: out_r[0] = 1'b1;
          6'h27: out_r[0] = 1'b1;
          6'h29: out_r[0] = 1'b1;
          6'h2b: out_r[0] = 1'b1;
          6'h2c: out_r[0] = 1'b1;
          6'h2e: out_r[0] = 1'b1;
          6'h2f: out_r[0] = 1'b1;
          6'h33: out_r[0] = 1'b1;
          6'h35: out_r[0] = 1'b1;
          6'h37: out_r[0] = 1'b1;
          6'h38: out_r[0] = 1'b1;
          6'h39: out_r[0] = 1'b1;
          6'h3a: out_r[0] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h01: out_r[1] = 1'b1;
          6'h11: out_r[1] = 1'b1;
          6'h12: out_r[1] = 1'b1;
          6'h15: out_r[1] = 1'b1;
          6'h17: out_r[1] = 1'b1;
          6'h18: out_r[1] = 1'b1;
          6'h1b: out_r[1] = 1'b1;
          6'h1d: out_r[1] = 1'b1;
          6'h1f: out_r[1] = 1'b1;
          6'h21: out_r[1] = 1'b1;
          6'h31: out_r[1] = 1'b1;
          6'h35: out_r[1] = 1'b1;
          6'h37: out_r[1] = 1'b1;
          6'h38: out_r[1] = 1'b1;
          6'h3d: out_r[1] = 1'b1;
          6'h3f: out_r[1] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[2] = 1'b0;
          6'h01: out_r[2] = 1'b0;
          6'h10: out_r[2] = 1'b0;
          6'h11: out_r[2] = 1'b0;
          6'h13: out_r[2] = 1'b0;
          6'h14: out_r[2] = 1'b0;
          6'h16: out_r[2] = 1'b0;
          6'h19: out_r[2] = 1'b0;
          6'h1a: out_r[2] = 1'b0;
          6'h1b: out_r[2] = 1'b0;
          6'h1c: out_r[2] = 1'b0;
          6'h1d: out_r[2] = 1'b0;
          6'h1e: out_r[2] = 1'b0;
          6'h1f: out_r[2] = 1'b0;
          6'h20: out_r[2] = 1'b0;
          6'h21: out_r[2] = 1'b0;
          6'h30: out_r[2] = 1'b0;
          6'h31: out_r[2] = 1'b0;
          6'h34: out_r[2] = 1'b0;
          6'h35: out_r[2] = 1'b0;
          6'h36: out_r[2] = 1'b0;
          6'h37: out_r[2] = 1'b0;
          6'h3c: out_r[2] = 1'b0;
          6'h3d: out_r[2] = 1'b0;
          6'h3e: out_r[2] = 1'b0;
          6'h3f: out_r[2] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h03: out_r[3] = 1'b1;
          6'h05: out_r[3] = 1'b1;
          6'h07: out_r[3] = 1'b1;
          6'h13: out_r[3] = 1'b1;
          6'h14: out_r[3] = 1'b1;
          6'h16: out_r[3] = 1'b1;
          6'h18: out_r[3] = 1'b1;
          6'h19: out_r[3] = 1'b1;
          6'h1a: out_r[3] = 1'b1;
          6'h1c: out_r[3] = 1'b1;
          6'h1d: out_r[3] = 1'b1;
          6'h1e: out_r[3] = 1'b1;
          6'h1f: out_r[3] = 1'b1;
          6'h32: out_r[3] = 1'b1;
          6'h33: out_r[3] = 1'b1;
          6'h34: out_r[3] = 1'b1;
          6'h36: out_r[3] = 1'b1;
          6'h3c: out_r[3] = 1'b1;
          6'h3d: out_r[3] = 1'b1;
          6'h3e: out_r[3] = 1'b1;
          6'h3f: out_r[3] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h03: out_r[4] = 1'b1;
          6'h05: out_r[4] = 1'b1;
          6'h07: out_r[4] = 1'b1;
          6'h09: out_r[4] = 1'b1;
          6'h0b: out_r[4] = 1'b1;
          6'h12: out_r[4] = 1'b1;
          6'h15: out_r[4] = 1'b1;
          6'h17: out_r[4] = 1'b1;
          6'h18: out_r[4] = 1'b1;
          6'h19: out_r[4] = 1'b1;
          6'h22: out_r[4] = 1'b1;
          6'h23: out_r[4] = 1'b1;
          6'h27: out_r[4] = 1'b1;
          6'h28: out_r[4] = 1'b1;
          6'h29: out_r[4] = 1'b1;
          6'h2a: out_r[4] = 1'b1;
          6'h2b: out_r[4] = 1'b1;
          6'h2c: out_r[4] = 1'b1;
          6'h2d: out_r[4] = 1'b1;
          6'h2e: out_r[4] = 1'b1;
          6'h35: out_r[4] = 1'b1;
          6'h37: out_r[4] = 1'b1;
          6'h38: out_r[4] = 1'b1;
          6'h39: out_r[4] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h09: out_r[5] = 1'b0;
          6'h19: out_r[5] = 1'b0;
          6'h1c: out_r[5] = 1'b0;
          6'h1d: out_r[5] = 1'b0;
          6'h1e: out_r[5] = 1'b0;
          6'h1f: out_r[5] = 1'b0;
          6'h22: out_r[5] = 1'b0;
          6'h27: out_r[5] = 1'b0;
          6'h28: out_r[5] = 1'b0;
          6'h29: out_r[5] = 1'b0;
          6'h2a: out_r[5] = 1'b0;
          6'h2b: out_r[5] = 1'b0;
          6'h2c: out_r[5] = 1'b0;
          6'h2d: out_r[5] = 1'b0;
          6'h2e: out_r[5] = 1'b0;
          6'h35: out_r[5] = 1'b0;
          6'h37: out_r[5] = 1'b0;
          6'h38: out_r[5] = 1'b0;
          6'h39: out_r[5] = 1'b0;
          6'h3c: out_r[5] = 1'b0;
          6'h3d: out_r[5] = 1'b0;
          6'h3e: out_r[5] = 1'b0;
          6'h3f: out_r[5] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[6] = 1'b1;
          6'h01: out_r[6] = 1'b1;
          6'h02: out_r[6] = 1'b1;
          6'h03: out_r[6] = 1'b1;
          6'h04: out_r[6] = 1'b1;
          6'h05: out_r[6] = 1'b1;
          6'h06: out_r[6] = 1'b1;
          6'h07: out_r[6] = 1'b1;
          6'h08: out_r[6] = 1'b1;
          6'h0a: out_r[6] = 1'b1;
          6'h0c: out_r[6] = 1'b1;
          6'h0d: out_r[6] = 1'b1;
          6'h0e: out_r[6] = 1'b1;
          6'h0f: out_r[6] = 1'b1;
          6'h1b: out_r[6] = 1'b1;
          6'h20: out_r[6] = 1'b1;
          6'h21: out_r[6] = 1'b1;
          6'h24: out_r[6] = 1'b1;
          6'h26: out_r[6] = 1'b1;
          6'h2f: out_r[6] = 1'b1;
          6'h32: out_r[6] = 1'b1;
          6'h3a: out_r[6] = 1'b1;
          6'h3b: out_r[6] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h03: out_r[7] = 1'b0;
          6'h05: out_r[7] = 1'b0;
          6'h07: out_r[7] = 1'b0;
          6'h0c: out_r[7] = 1'b0;
          6'h0e: out_r[7] = 1'b0;
          6'h32: out_r[7] = 1'b0;
          6'h35: out_r[7] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h03: out_r[8] = 1'b0;
          6'h05: out_r[8] = 1'b0;
          6'h07: out_r[8] = 1'b0;
          6'h0c: out_r[8] = 1'b0;
          6'h0e: out_r[8] = 1'b0;
          6'h12: out_r[8] = 1'b0;
          6'h15: out_r[8] = 1'b0;
          6'h17: out_r[8] = 1'b0;
          6'h19: out_r[8] = 1'b0;
          6'h1a: out_r[8] = 1'b0;
          6'h1b: out_r[8] = 1'b0;
          6'h2b: out_r[8] = 1'b0;
          6'h32: out_r[8] = 1'b0;
          6'h37: out_r[8] = 1'b0;
          6'h38: out_r[8] = 1'b0;
          6'h3f: out_r[8] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[9] = 1'b0;
          6'h01: out_r[9] = 1'b0;
          6'h02: out_r[9] = 1'b0;
          6'h04: out_r[9] = 1'b0;
          6'h06: out_r[9] = 1'b0;
          6'h08: out_r[9] = 1'b0;
          6'h09: out_r[9] = 1'b0;
          6'h0a: out_r[9] = 1'b0;
          6'h0d: out_r[9] = 1'b0;
          6'h0f: out_r[9] = 1'b0;
          6'h20: out_r[9] = 1'b0;
          6'h21: out_r[9] = 1'b0;
          6'h22: out_r[9] = 1'b0;
          6'h24: out_r[9] = 1'b0;
          6'h26: out_r[9] = 1'b0;
          6'h27: out_r[9] = 1'b0;
          6'h28: out_r[9] = 1'b0;
          6'h29: out_r[9] = 1'b0;
          6'h2a: out_r[9] = 1'b0;
          6'h2c: out_r[9] = 1'b0;
          6'h2d: out_r[9] = 1'b0;
          6'h2e: out_r[9] = 1'b0;
          6'h2f: out_r[9] = 1'b0;
          6'h32: out_r[9] = 1'b0;
          6'h33: out_r[9] = 1'b0;
          6'h35: out_r[9] = 1'b0;
          6'h39: out_r[9] = 1'b0;
          6'h3a: out_r[9] = 1'b0;
          6'h3b: out_r[9] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h03: out_r[10] = 1'b1;
          6'h05: out_r[10] = 1'b1;
          6'h07: out_r[10] = 1'b1;
          6'h0b: out_r[10] = 1'b1;
          6'h0c: out_r[10] = 1'b1;
          6'h0e: out_r[10] = 1'b1;
          6'h12: out_r[10] = 1'b1;
          6'h15: out_r[10] = 1'b1;
          6'h17: out_r[10] = 1'b1;
          6'h18: out_r[10] = 1'b1;
          6'h19: out_r[10] = 1'b1;
          6'h1a: out_r[10] = 1'b1;
          6'h1b: out_r[10] = 1'b1;
          6'h23: out_r[10] = 1'b1;
          6'h25: out_r[10] = 1'b1;
          6'h2b: out_r[10] = 1'b1;
          6'h37: out_r[10] = 1'b1;
          6'h38: out_r[10] = 1'b1;
          6'h3f: out_r[10] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h02: out_r[11] = 1'b1;
          6'h08: out_r[11] = 1'b1;
          6'h0a: out_r[11] = 1'b1;
          6'h0d: out_r[11] = 1'b1;
          6'h0f: out_r[11] = 1'b1;
          6'h12: out_r[11] = 1'b1;
          6'h13: out_r[11] = 1'b1;
          6'h15: out_r[11] = 1'b1;
          6'h17: out_r[11] = 1'b1;
          6'h19: out_r[11] = 1'b1;
          6'h1a: out_r[11] = 1'b1;
          6'h1b: out_r[11] = 1'b1;
          6'h20: out_r[11] = 1'b1;
          6'h21: out_r[11] = 1'b1;
          6'h24: out_r[11] = 1'b1;
          6'h26: out_r[11] = 1'b1;
          6'h30: out_r[11] = 1'b1;
          6'h31: out_r[11] = 1'b1;
          6'h32: out_r[11] = 1'b1;
          6'h33: out_r[11] = 1'b1;
          6'h34: out_r[11] = 1'b1;
          6'h36: out_r[11] = 1'b1;
          6'h37: out_r[11] = 1'b1;
          6'h38: out_r[11] = 1'b1;
          6'h3b: out_r[11] = 1'b1;
          6'h3c: out_r[11] = 1'b1;
          6'h3d: out_r[11] = 1'b1;
          6'h3e: out_r[11] = 1'b1;
          6'h3f: out_r[11] = 1'b1;
          default: begin end
        endcase
      end
      6'h1d: begin
        out_r = 12'h787;
        case (inner)
          6'h03: out_r[0] = 1'b0;
          6'h04: out_r[0] = 1'b0;
          6'h05: out_r[0] = 1'b0;
          6'h06: out_r[0] = 1'b0;
          6'h07: out_r[0] = 1'b0;
          6'h09: out_r[0] = 1'b0;
          6'h0b: out_r[0] = 1'b0;
          6'h18: out_r[0] = 1'b0;
          6'h1d: out_r[0] = 1'b0;
          6'h1f: out_r[0] = 1'b0;
          6'h20: out_r[0] = 1'b0;
          6'h22: out_r[0] = 1'b0;
          6'h23: out_r[0] = 1'b0;
          6'h28: out_r[0] = 1'b0;
          6'h2c: out_r[0] = 1'b0;
          6'h2e: out_r[0] = 1'b0;
          6'h3d: out_r[0] = 1'b0;
          6'h3f: out_r[0] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[1] = 1'b0;
          6'h0b: out_r[1] = 1'b0;
          6'h10: out_r[1] = 1'b0;
          6'h12: out_r[1] = 1'b0;
          6'h13: out_r[1] = 1'b0;
          6'h14: out_r[1] = 1'b0;
          6'h16: out_r[1] = 1'b0;
          6'h1a: out_r[1] = 1'b0;
          6'h1c: out_r[1] = 1'b0;
          6'h1d: out_r[1] = 1'b0;
          6'h1e: out_r[1] = 1'b0;
          6'h1f: out_r[1] = 1'b0;
          6'h24: out_r[1] = 1'b0;
          6'h25: out_r[1] = 1'b0;
          6'h26: out_r[1] = 1'b0;
          6'h27: out_r[1] = 1'b0;
          6'h29: out_r[1] = 1'b0;
          6'h2a: out_r[1] = 1'b0;
          6'h2b: out_r[1] = 1'b0;
          6'h30: out_r[1] = 1'b0;
          6'h32: out_r[1] = 1'b0;
          6'h33: out_r[1] = 1'b0;
          6'h36: out_r[1] = 1'b0;
          6'h38: out_r[1] = 1'b0;
          6'h3a: out_r[1] = 1'b0;
          6'h3c: out_r[1] = 1'b0;
          6'h3d: out_r[1] = 1'b0;
          6'h3e: out_r[1] = 1'b0;
          6'h3f: out_r[1] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[2] = 1'b0;
          6'h01: out_r[2] = 1'b0;
          6'h10: out_r[2] = 1'b0;
          6'h11: out_r[2] = 1'b0;
          6'h12: out_r[2] = 1'b0;
          6'h13: out_r[2] = 1'b0;
          6'h14: out_r[2] = 1'b0;
          6'h16: out_r[2] = 1'b0;
          6'h1c: out_r[2] = 1'b0;
          6'h1e: out_r[2] = 1'b0;
          6'h24: out_r[2] = 1'b0;
          6'h25: out_r[2] = 1'b0;
          6'h26: out_r[2] = 1'b0;
          6'h27: out_r[2] = 1'b0;
          6'h29: out_r[2] = 1'b0;
          6'h2b: out_r[2] = 1'b0;
          6'h30: out_r[2] = 1'b0;
          6'h31: out_r[2] = 1'b0;
          6'h32: out_r[2] = 1'b0;
          6'h33: out_r[2] = 1'b0;
          6'h36: out_r[2] = 1'b0;
          6'h38: out_r[2] = 1'b0;
          6'h3a: out_r[2] = 1'b0;
          6'h3c: out_r[2] = 1'b0;
          6'h3e: out_r[2] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h03: out_r[3] = 1'b1;
          6'h18: out_r[3] = 1'b1;
          6'h1c: out_r[3] = 1'b1;
          6'h1e: out_r[3] = 1'b1;
          6'h20: out_r[3] = 1'b1;
          6'h25: out_r[3] = 1'b1;
          6'h27: out_r[3] = 1'b1;
          6'h28: out_r[3] = 1'b1;
          6'h29: out_r[3] = 1'b1;
          6'h2c: out_r[3] = 1'b1;
          6'h2e: out_r[3] = 1'b1;
          6'h3c: out_r[3] = 1'b1;
          6'h3e: out_r[3] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h05: out_r[4] = 1'b1;
          6'h07: out_r[4] = 1'b1;
          6'h08: out_r[4] = 1'b1;
          6'h09: out_r[4] = 1'b1;
          6'h0c: out_r[4] = 1'b1;
          6'h0e: out_r[4] = 1'b1;
          6'h11: out_r[4] = 1'b1;
          6'h15: out_r[4] = 1'b1;
          6'h17: out_r[4] = 1'b1;
          6'h18: out_r[4] = 1'b1;
          6'h19: out_r[4] = 1'b1;
          6'h1a: out_r[4] = 1'b1;
          6'h1b: out_r[4] = 1'b1;
          6'h1d: out_r[4] = 1'b1;
          6'h1f: out_r[4] = 1'b1;
          6'h21: out_r[4] = 1'b1;
          6'h22: out_r[4] = 1'b1;
          6'h23: out_r[4] = 1'b1;
          6'h24: out_r[4] = 1'b1;
          6'h2a: out_r[4] = 1'b1;
          6'h2b: out_r[4] = 1'b1;
          6'h30: out_r[4] = 1'b1;
          6'h31: out_r[4] = 1'b1;
          6'h34: out_r[4] = 1'b1;
          6'h35: out_r[4] = 1'b1;
          6'h37: out_r[4] = 1'b1;
          6'h38: out_r[4] = 1'b1;
          6'h39: out_r[4] = 1'b1;
          6'h3b: out_r[4] = 1'b1;
          6'h3d: out_r[4] = 1'b1;
          6'h3f: out_r[4] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[5] = 1'b1;
          6'h01: out_r[5] = 1'b1;
          6'h02: out_r[5] = 1'b1;
          6'h03: out_r[5] = 1'b1;
          6'h04: out_r[5] = 1'b1;
          6'h06: out_r[5] = 1'b1;
          6'h0a: out_r[5] = 1'b1;
          6'h0b: out_r[5] = 1'b1;
          6'h0d: out_r[5] = 1'b1;
          6'h0f: out_r[5] = 1'b1;
          6'h10: out_r[5] = 1'b1;
          6'h12: out_r[5] = 1'b1;
          6'h14: out_r[5] = 1'b1;
          6'h16: out_r[5] = 1'b1;
          6'h18: out_r[5] = 1'b1;
          6'h1a: out_r[5] = 1'b1;
          6'h20: out_r[5] = 1'b1;
          6'h21: out_r[5] = 1'b1;
          6'h23: out_r[5] = 1'b1;
          6'h24: out_r[5] = 1'b1;
          6'h25: out_r[5] = 1'b1;
          6'h27: out_r[5] = 1'b1;
          6'h28: out_r[5] = 1'b1;
          6'h29: out_r[5] = 1'b1;
          6'h2a: out_r[5] = 1'b1;
          6'h2c: out_r[5] = 1'b1;
          6'h2d: out_r[5] = 1'b1;
          6'h2e: out_r[5] = 1'b1;
          6'h2f: out_r[5] = 1'b1;
          6'h36: out_r[5] = 1'b1;
          6'h38: out_r[5] = 1'b1;
          6'h3a: out_r[5] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[6] = 1'b1;
          6'h01: out_r[6] = 1'b1;
          6'h02: out_r[6] = 1'b1;
          6'h03: out_r[6] = 1'b1;
          6'h04: out_r[6] = 1'b1;
          6'h06: out_r[6] = 1'b1;
          6'h0a: out_r[6] = 1'b1;
          6'h0b: out_r[6] = 1'b1;
          6'h0d: out_r[6] = 1'b1;
          6'h0f: out_r[6] = 1'b1;
          6'h12: out_r[6] = 1'b1;
          6'h13: out_r[6] = 1'b1;
          6'h14: out_r[6] = 1'b1;
          6'h16: out_r[6] = 1'b1;
          6'h23: out_r[6] = 1'b1;
          6'h24: out_r[6] = 1'b1;
          6'h25: out_r[6] = 1'b1;
          6'h27: out_r[6] = 1'b1;
          6'h29: out_r[6] = 1'b1;
          6'h2a: out_r[6] = 1'b1;
          6'h2b: out_r[6] = 1'b1;
          6'h2c: out_r[6] = 1'b1;
          6'h2d: out_r[6] = 1'b1;
          6'h2f: out_r[6] = 1'b1;
          6'h32: out_r[6] = 1'b1;
          6'h33: out_r[6] = 1'b1;
          6'h36: out_r[6] = 1'b1;
          6'h38: out_r[6] = 1'b1;
          6'h3a: out_r[6] = 1'b1;
          6'h3c: out_r[6] = 1'b1;
          6'h3e: out_r[6] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h11: out_r[7] = 1'b0;
          6'h14: out_r[7] = 1'b0;
          6'h15: out_r[7] = 1'b0;
          6'h16: out_r[7] = 1'b0;
          6'h17: out_r[7] = 1'b0;
          6'h1b: out_r[7] = 1'b0;
          6'h22: out_r[7] = 1'b0;
          6'h23: out_r[7] = 1'b0;
          6'h25: out_r[7] = 1'b0;
          6'h27: out_r[7] = 1'b0;
          6'h29: out_r[7] = 1'b0;
          6'h2a: out_r[7] = 1'b0;
          6'h2b: out_r[7] = 1'b0;
          6'h30: out_r[7] = 1'b0;
          6'h31: out_r[7] = 1'b0;
          6'h34: out_r[7] = 1'b0;
          6'h35: out_r[7] = 1'b0;
          6'h37: out_r[7] = 1'b0;
          6'h38: out_r[7] = 1'b0;
          6'h3a: out_r[7] = 1'b0;
          6'h3b: out_r[7] = 1'b0;
          6'h3c: out_r[7] = 1'b0;
          6'h3e: out_r[7] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h03: out_r[8] = 1'b0;
          6'h05: out_r[8] = 1'b0;
          6'h07: out_r[8] = 1'b0;
          6'h08: out_r[8] = 1'b0;
          6'h0b: out_r[8] = 1'b0;
          6'h0c: out_r[8] = 1'b0;
          6'h0d: out_r[8] = 1'b0;
          6'h0e: out_r[8] = 1'b0;
          6'h0f: out_r[8] = 1'b0;
          6'h13: out_r[8] = 1'b0;
          6'h14: out_r[8] = 1'b0;
          6'h16: out_r[8] = 1'b0;
          6'h19: out_r[8] = 1'b0;
          6'h22: out_r[8] = 1'b0;
          6'h24: out_r[8] = 1'b0;
          6'h25: out_r[8] = 1'b0;
          6'h27: out_r[8] = 1'b0;
          6'h29: out_r[8] = 1'b0;
          6'h2a: out_r[8] = 1'b0;
          6'h2b: out_r[8] = 1'b0;
          6'h2d: out_r[8] = 1'b0;
          6'h2f: out_r[8] = 1'b0;
          6'h30: out_r[8] = 1'b0;
          6'h32: out_r[8] = 1'b0;
          6'h33: out_r[8] = 1'b0;
          6'h34: out_r[8] = 1'b0;
          6'h38: out_r[8] = 1'b0;
          6'h39: out_r[8] = 1'b0;
          6'h3a: out_r[8] = 1'b0;
          6'h3c: out_r[8] = 1'b0;
          6'h3e: out_r[8] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[9] = 1'b0;
          6'h01: out_r[9] = 1'b0;
          6'h02: out_r[9] = 1'b0;
          6'h04: out_r[9] = 1'b0;
          6'h06: out_r[9] = 1'b0;
          6'h09: out_r[9] = 1'b0;
          6'h0a: out_r[9] = 1'b0;
          6'h11: out_r[9] = 1'b0;
          6'h14: out_r[9] = 1'b0;
          6'h15: out_r[9] = 1'b0;
          6'h16: out_r[9] = 1'b0;
          6'h17: out_r[9] = 1'b0;
          6'h1b: out_r[9] = 1'b0;
          6'h1d: out_r[9] = 1'b0;
          6'h1f: out_r[9] = 1'b0;
          6'h23: out_r[9] = 1'b0;
          6'h26: out_r[9] = 1'b0;
          6'h29: out_r[9] = 1'b0;
          6'h2c: out_r[9] = 1'b0;
          6'h2e: out_r[9] = 1'b0;
          6'h30: out_r[9] = 1'b0;
          6'h31: out_r[9] = 1'b0;
          6'h35: out_r[9] = 1'b0;
          6'h37: out_r[9] = 1'b0;
          6'h38: out_r[9] = 1'b0;
          6'h3b: out_r[9] = 1'b0;
          6'h3c: out_r[9] = 1'b0;
          6'h3d: out_r[9] = 1'b0;
          6'h3f: out_r[9] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[10] = 1'b0;
          6'h01: out_r[10] = 1'b0;
          6'h02: out_r[10] = 1'b0;
          6'h04: out_r[10] = 1'b0;
          6'h06: out_r[10] = 1'b0;
          6'h09: out_r[10] = 1'b0;
          6'h10: out_r[10] = 1'b0;
          6'h11: out_r[10] = 1'b0;
          6'h18: out_r[10] = 1'b0;
          6'h1a: out_r[10] = 1'b0;
          6'h1b: out_r[10] = 1'b0;
          6'h1c: out_r[10] = 1'b0;
          6'h1d: out_r[10] = 1'b0;
          6'h1e: out_r[10] = 1'b0;
          6'h1f: out_r[10] = 1'b0;
          6'h29: out_r[10] = 1'b0;
          6'h2e: out_r[10] = 1'b0;
          6'h31: out_r[10] = 1'b0;
          6'h3b: out_r[10] = 1'b0;
          6'h3d: out_r[10] = 1'b0;
          6'h3f: out_r[10] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h03: out_r[11] = 1'b1;
          6'h04: out_r[11] = 1'b1;
          6'h05: out_r[11] = 1'b1;
          6'h06: out_r[11] = 1'b1;
          6'h07: out_r[11] = 1'b1;
          6'h08: out_r[11] = 1'b1;
          6'h0b: out_r[11] = 1'b1;
          6'h0c: out_r[11] = 1'b1;
          6'h0d: out_r[11] = 1'b1;
          6'h0e: out_r[11] = 1'b1;
          6'h0f: out_r[11] = 1'b1;
          6'h19: out_r[11] = 1'b1;
          6'h1d: out_r[11] = 1'b1;
          6'h1f: out_r[11] = 1'b1;
          6'h22: out_r[11] = 1'b1;
          6'h2d: out_r[11] = 1'b1;
          6'h2e: out_r[11] = 1'b1;
          6'h2f: out_r[11] = 1'b1;
          6'h34: out_r[11] = 1'b1;
          6'h39: out_r[11] = 1'b1;
          6'h3d: out_r[11] = 1'b1;
          6'h3f: out_r[11] = 1'b1;
          default: begin end
        endcase
      end
      6'h1e: begin
        out_r = 12'h1eb;
        case (inner)
          6'h04: out_r[0] = 1'b0;
          6'h06: out_r[0] = 1'b0;
          6'h07: out_r[0] = 1'b0;
          6'h09: out_r[0] = 1'b0;
          6'h0a: out_r[0] = 1'b0;
          6'h0b: out_r[0] = 1'b0;
          6'h0c: out_r[0] = 1'b0;
          6'h0e: out_r[0] = 1'b0;
          6'h0f: out_r[0] = 1'b0;
          6'h11: out_r[0] = 1'b0;
          6'h14: out_r[0] = 1'b0;
          6'h16: out_r[0] = 1'b0;
          6'h17: out_r[0] = 1'b0;
          6'h18: out_r[0] = 1'b0;
          6'h19: out_r[0] = 1'b0;
          6'h1e: out_r[0] = 1'b0;
          6'h1f: out_r[0] = 1'b0;
          6'h26: out_r[0] = 1'b0;
          6'h27: out_r[0] = 1'b0;
          6'h29: out_r[0] = 1'b0;
          6'h2e: out_r[0] = 1'b0;
          6'h2f: out_r[0] = 1'b0;
          6'h31: out_r[0] = 1'b0;
          6'h32: out_r[0] = 1'b0;
          6'h33: out_r[0] = 1'b0;
          6'h36: out_r[0] = 1'b0;
          6'h37: out_r[0] = 1'b0;
          6'h38: out_r[0] = 1'b0;
          6'h39: out_r[0] = 1'b0;
          6'h3e: out_r[0] = 1'b0;
          6'h3f: out_r[0] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h01: out_r[1] = 1'b0;
          6'h04: out_r[1] = 1'b0;
          6'h09: out_r[1] = 1'b0;
          6'h0a: out_r[1] = 1'b0;
          6'h0b: out_r[1] = 1'b0;
          6'h0c: out_r[1] = 1'b0;
          6'h10: out_r[1] = 1'b0;
          6'h11: out_r[1] = 1'b0;
          6'h12: out_r[1] = 1'b0;
          6'h13: out_r[1] = 1'b0;
          6'h15: out_r[1] = 1'b0;
          6'h18: out_r[1] = 1'b0;
          6'h19: out_r[1] = 1'b0;
          6'h1a: out_r[1] = 1'b0;
          6'h1b: out_r[1] = 1'b0;
          6'h1d: out_r[1] = 1'b0;
          6'h2a: out_r[1] = 1'b0;
          6'h2b: out_r[1] = 1'b0;
          6'h30: out_r[1] = 1'b0;
          6'h33: out_r[1] = 1'b0;
          6'h34: out_r[1] = 1'b0;
          6'h38: out_r[1] = 1'b0;
          6'h39: out_r[1] = 1'b0;
          6'h3a: out_r[1] = 1'b0;
          6'h3b: out_r[1] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h01: out_r[2] = 1'b1;
          6'h04: out_r[2] = 1'b1;
          6'h05: out_r[2] = 1'b1;
          6'h08: out_r[2] = 1'b1;
          6'h0a: out_r[2] = 1'b1;
          6'h0b: out_r[2] = 1'b1;
          6'h0c: out_r[2] = 1'b1;
          6'h0d: out_r[2] = 1'b1;
          6'h11: out_r[2] = 1'b1;
          6'h12: out_r[2] = 1'b1;
          6'h13: out_r[2] = 1'b1;
          6'h15: out_r[2] = 1'b1;
          6'h1c: out_r[2] = 1'b1;
          6'h1d: out_r[2] = 1'b1;
          6'h2a: out_r[2] = 1'b1;
          6'h2b: out_r[2] = 1'b1;
          6'h34: out_r[2] = 1'b1;
          6'h35: out_r[2] = 1'b1;
          6'h39: out_r[2] = 1'b1;
          6'h3c: out_r[2] = 1'b1;
          6'h3d: out_r[2] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h06: out_r[3] = 1'b0;
          6'h07: out_r[3] = 1'b0;
          6'h0e: out_r[3] = 1'b0;
          6'h0f: out_r[3] = 1'b0;
          6'h15: out_r[3] = 1'b0;
          6'h16: out_r[3] = 1'b0;
          6'h17: out_r[3] = 1'b0;
          6'h1e: out_r[3] = 1'b0;
          6'h1f: out_r[3] = 1'b0;
          6'h26: out_r[3] = 1'b0;
          6'h27: out_r[3] = 1'b0;
          6'h2b: out_r[3] = 1'b0;
          6'h2e: out_r[3] = 1'b0;
          6'h2f: out_r[3] = 1'b0;
          6'h34: out_r[3] = 1'b0;
          6'h36: out_r[3] = 1'b0;
          6'h37: out_r[3] = 1'b0;
          6'h3e: out_r[3] = 1'b0;
          6'h3f: out_r[3] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[4] = 1'b1;
          6'h01: out_r[4] = 1'b1;
          6'h09: out_r[4] = 1'b1;
          6'h10: out_r[4] = 1'b1;
          6'h12: out_r[4] = 1'b1;
          6'h13: out_r[4] = 1'b1;
          6'h18: out_r[4] = 1'b1;
          6'h19: out_r[4] = 1'b1;
          6'h1a: out_r[4] = 1'b1;
          6'h1b: out_r[4] = 1'b1;
          6'h23: out_r[4] = 1'b1;
          6'h27: out_r[4] = 1'b1;
          6'h28: out_r[4] = 1'b1;
          6'h29: out_r[4] = 1'b1;
          6'h2a: out_r[4] = 1'b1;
          6'h2f: out_r[4] = 1'b1;
          6'h30: out_r[4] = 1'b1;
          6'h31: out_r[4] = 1'b1;
          6'h32: out_r[4] = 1'b1;
          6'h33: out_r[4] = 1'b1;
          6'h35: out_r[4] = 1'b1;
          6'h37: out_r[4] = 1'b1;
          6'h38: out_r[4] = 1'b1;
          6'h39: out_r[4] = 1'b1;
          6'h3a: out_r[4] = 1'b1;
          6'h3b: out_r[4] = 1'b1;
          6'h3f: out_r[4] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[5] = 1'b0;
          6'h01: out_r[5] = 1'b0;
          6'h09: out_r[5] = 1'b0;
          6'h12: out_r[5] = 1'b0;
          6'h13: out_r[5] = 1'b0;
          6'h19: out_r[5] = 1'b0;
          6'h1c: out_r[5] = 1'b0;
          6'h1d: out_r[5] = 1'b0;
          6'h1e: out_r[5] = 1'b0;
          6'h1f: out_r[5] = 1'b0;
          6'h23: out_r[5] = 1'b0;
          6'h27: out_r[5] = 1'b0;
          6'h28: out_r[5] = 1'b0;
          6'h29: out_r[5] = 1'b0;
          6'h2f: out_r[5] = 1'b0;
          6'h30: out_r[5] = 1'b0;
          6'h31: out_r[5] = 1'b0;
          6'h33: out_r[5] = 1'b0;
          6'h35: out_r[5] = 1'b0;
          6'h37: out_r[5] = 1'b0;
          6'h39: out_r[5] = 1'b0;
          6'h3c: out_r[5] = 1'b0;
          6'h3e: out_r[5] = 1'b0;
          6'h3f: out_r[5] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[6] = 1'b0;
          6'h01: out_r[6] = 1'b0;
          6'h09: out_r[6] = 1'b0;
          6'h15: out_r[6] = 1'b0;
          6'h16: out_r[6] = 1'b0;
          6'h17: out_r[6] = 1'b0;
          6'h18: out_r[6] = 1'b0;
          6'h19: out_r[6] = 1'b0;
          6'h1a: out_r[6] = 1'b0;
          6'h1b: out_r[6] = 1'b0;
          6'h1d: out_r[6] = 1'b0;
          6'h1e: out_r[6] = 1'b0;
          6'h1f: out_r[6] = 1'b0;
          6'h23: out_r[6] = 1'b0;
          6'h27: out_r[6] = 1'b0;
          6'h28: out_r[6] = 1'b0;
          6'h29: out_r[6] = 1'b0;
          6'h2f: out_r[6] = 1'b0;
          6'h30: out_r[6] = 1'b0;
          6'h31: out_r[6] = 1'b0;
          6'h32: out_r[6] = 1'b0;
          6'h33: out_r[6] = 1'b0;
          6'h34: out_r[6] = 1'b0;
          6'h35: out_r[6] = 1'b0;
          6'h36: out_r[6] = 1'b0;
          6'h37: out_r[6] = 1'b0;
          6'h38: out_r[6] = 1'b0;
          6'h39: out_r[6] = 1'b0;
          6'h3b: out_r[6] = 1'b0;
          6'h3e: out_r[6] = 1'b0;
          6'h3f: out_r[6] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h01: out_r[7] = 1'b0;
          6'h10: out_r[7] = 1'b0;
          6'h12: out_r[7] = 1'b0;
          6'h13: out_r[7] = 1'b0;
          6'h19: out_r[7] = 1'b0;
          6'h1c: out_r[7] = 1'b0;
          6'h2a: out_r[7] = 1'b0;
          6'h2b: out_r[7] = 1'b0;
          6'h30: out_r[7] = 1'b0;
          6'h31: out_r[7] = 1'b0;
          6'h33: out_r[7] = 1'b0;
          6'h35: out_r[7] = 1'b0;
          6'h37: out_r[7] = 1'b0;
          6'h39: out_r[7] = 1'b0;
          6'h3a: out_r[7] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h01: out_r[8] = 1'b0;
          6'h05: out_r[8] = 1'b0;
          6'h08: out_r[8] = 1'b0;
          6'h0d: out_r[8] = 1'b0;
          6'h10: out_r[8] = 1'b0;
          6'h12: out_r[8] = 1'b0;
          6'h13: out_r[8] = 1'b0;
          6'h19: out_r[8] = 1'b0;
          6'h1c: out_r[8] = 1'b0;
          6'h29: out_r[8] = 1'b0;
          6'h2a: out_r[8] = 1'b0;
          6'h39: out_r[8] = 1'b0;
          6'h3a: out_r[8] = 1'b0;
          6'h3d: out_r[8] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h01: out_r[9] = 1'b1;
          6'h05: out_r[9] = 1'b1;
          6'h08: out_r[9] = 1'b1;
          6'h0d: out_r[9] = 1'b1;
          6'h12: out_r[9] = 1'b1;
          6'h13: out_r[9] = 1'b1;
          6'h16: out_r[9] = 1'b1;
          6'h17: out_r[9] = 1'b1;
          6'h18: out_r[9] = 1'b1;
          6'h1a: out_r[9] = 1'b1;
          6'h1b: out_r[9] = 1'b1;
          6'h1e: out_r[9] = 1'b1;
          6'h1f: out_r[9] = 1'b1;
          6'h29: out_r[9] = 1'b1;
          6'h30: out_r[9] = 1'b1;
          6'h32: out_r[9] = 1'b1;
          6'h36: out_r[9] = 1'b1;
          6'h38: out_r[9] = 1'b1;
          6'h39: out_r[9] = 1'b1;
          6'h3d: out_r[9] = 1'b1;
          6'h3e: out_r[9] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[10] = 1'b1;
          6'h01: out_r[10] = 1'b1;
          6'h05: out_r[10] = 1'b1;
          6'h08: out_r[10] = 1'b1;
          6'h0d: out_r[10] = 1'b1;
          6'h10: out_r[10] = 1'b1;
          6'h12: out_r[10] = 1'b1;
          6'h13: out_r[10] = 1'b1;
          6'h14: out_r[10] = 1'b1;
          6'h19: out_r[10] = 1'b1;
          6'h1c: out_r[10] = 1'b1;
          6'h23: out_r[10] = 1'b1;
          6'h28: out_r[10] = 1'b1;
          6'h29: out_r[10] = 1'b1;
          6'h2b: out_r[10] = 1'b1;
          6'h30: out_r[10] = 1'b1;
          6'h32: out_r[10] = 1'b1;
          6'h35: out_r[10] = 1'b1;
          6'h39: out_r[10] = 1'b1;
          6'h3a: out_r[10] = 1'b1;
          6'h3d: out_r[10] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h01: out_r[11] = 1'b1;
          6'h05: out_r[11] = 1'b1;
          6'h08: out_r[11] = 1'b1;
          6'h09: out_r[11] = 1'b1;
          6'h0a: out_r[11] = 1'b1;
          6'h0b: out_r[11] = 1'b1;
          6'h0d: out_r[11] = 1'b1;
          6'h19: out_r[11] = 1'b1;
          6'h1c: out_r[11] = 1'b1;
          6'h26: out_r[11] = 1'b1;
          6'h27: out_r[11] = 1'b1;
          6'h29: out_r[11] = 1'b1;
          6'h2e: out_r[11] = 1'b1;
          6'h2f: out_r[11] = 1'b1;
          6'h31: out_r[11] = 1'b1;
          6'h33: out_r[11] = 1'b1;
          6'h36: out_r[11] = 1'b1;
          6'h37: out_r[11] = 1'b1;
          6'h38: out_r[11] = 1'b1;
          6'h39: out_r[11] = 1'b1;
          6'h3d: out_r[11] = 1'b1;
          6'h3e: out_r[11] = 1'b1;
          6'h3f: out_r[11] = 1'b1;
          default: begin end
        endcase
      end
      6'h1f: begin
        out_r = 12'h3aa;
        case (inner)
          6'h04: out_r[0] = 1'b1;
          6'h05: out_r[0] = 1'b1;
          6'h06: out_r[0] = 1'b1;
          6'h09: out_r[0] = 1'b1;
          6'h0c: out_r[0] = 1'b1;
          6'h0d: out_r[0] = 1'b1;
          6'h0e: out_r[0] = 1'b1;
          6'h10: out_r[0] = 1'b1;
          6'h15: out_r[0] = 1'b1;
          6'h16: out_r[0] = 1'b1;
          6'h1e: out_r[0] = 1'b1;
          6'h21: out_r[0] = 1'b1;
          6'h23: out_r[0] = 1'b1;
          6'h25: out_r[0] = 1'b1;
          6'h26: out_r[0] = 1'b1;
          6'h2b: out_r[0] = 1'b1;
          6'h2e: out_r[0] = 1'b1;
          6'h34: out_r[0] = 1'b1;
          6'h35: out_r[0] = 1'b1;
          6'h36: out_r[0] = 1'b1;
          6'h38: out_r[0] = 1'b1;
          6'h3e: out_r[0] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h04: out_r[1] = 1'b0;
          6'h07: out_r[1] = 1'b0;
          6'h09: out_r[1] = 1'b0;
          6'h0a: out_r[1] = 1'b0;
          6'h0c: out_r[1] = 1'b0;
          6'h0f: out_r[1] = 1'b0;
          6'h17: out_r[1] = 1'b0;
          6'h1b: out_r[1] = 1'b0;
          6'h1f: out_r[1] = 1'b0;
          6'h21: out_r[1] = 1'b0;
          6'h23: out_r[1] = 1'b0;
          6'h27: out_r[1] = 1'b0;
          6'h2a: out_r[1] = 1'b0;
          6'h2b: out_r[1] = 1'b0;
          6'h2f: out_r[1] = 1'b0;
          6'h34: out_r[1] = 1'b0;
          6'h37: out_r[1] = 1'b0;
          6'h3b: out_r[1] = 1'b0;
          6'h3f: out_r[1] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[2] = 1'b1;
          6'h01: out_r[2] = 1'b1;
          6'h02: out_r[2] = 1'b1;
          6'h03: out_r[2] = 1'b1;
          6'h05: out_r[2] = 1'b1;
          6'h08: out_r[2] = 1'b1;
          6'h0a: out_r[2] = 1'b1;
          6'h0b: out_r[2] = 1'b1;
          6'h0d: out_r[2] = 1'b1;
          6'h11: out_r[2] = 1'b1;
          6'h12: out_r[2] = 1'b1;
          6'h14: out_r[2] = 1'b1;
          6'h15: out_r[2] = 1'b1;
          6'h1a: out_r[2] = 1'b1;
          6'h1c: out_r[2] = 1'b1;
          6'h1d: out_r[2] = 1'b1;
          6'h20: out_r[2] = 1'b1;
          6'h22: out_r[2] = 1'b1;
          6'h24: out_r[2] = 1'b1;
          6'h29: out_r[2] = 1'b1;
          6'h2c: out_r[2] = 1'b1;
          6'h2d: out_r[2] = 1'b1;
          6'h30: out_r[2] = 1'b1;
          6'h31: out_r[2] = 1'b1;
          6'h32: out_r[2] = 1'b1;
          6'h34: out_r[2] = 1'b1;
          6'h35: out_r[2] = 1'b1;
          6'h3a: out_r[2] = 1'b1;
          6'h3c: out_r[2] = 1'b1;
          6'h3d: out_r[2] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h03: out_r[3] = 1'b0;
          6'h05: out_r[3] = 1'b0;
          6'h06: out_r[3] = 1'b0;
          6'h07: out_r[3] = 1'b0;
          6'h0d: out_r[3] = 1'b0;
          6'h0e: out_r[3] = 1'b0;
          6'h0f: out_r[3] = 1'b0;
          6'h11: out_r[3] = 1'b0;
          6'h15: out_r[3] = 1'b0;
          6'h16: out_r[3] = 1'b0;
          6'h17: out_r[3] = 1'b0;
          6'h1e: out_r[3] = 1'b0;
          6'h1f: out_r[3] = 1'b0;
          6'h20: out_r[3] = 1'b0;
          6'h21: out_r[3] = 1'b0;
          6'h26: out_r[3] = 1'b0;
          6'h27: out_r[3] = 1'b0;
          6'h2e: out_r[3] = 1'b0;
          6'h2f: out_r[3] = 1'b0;
          6'h30: out_r[3] = 1'b0;
          6'h31: out_r[3] = 1'b0;
          6'h34: out_r[3] = 1'b0;
          6'h35: out_r[3] = 1'b0;
          6'h36: out_r[3] = 1'b0;
          6'h37: out_r[3] = 1'b0;
          6'h3a: out_r[3] = 1'b0;
          6'h3e: out_r[3] = 1'b0;
          6'h3f: out_r[3] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h06: out_r[4] = 1'b1;
          6'h08: out_r[4] = 1'b1;
          6'h0b: out_r[4] = 1'b1;
          6'h0e: out_r[4] = 1'b1;
          6'h10: out_r[4] = 1'b1;
          6'h12: out_r[4] = 1'b1;
          6'h13: out_r[4] = 1'b1;
          6'h16: out_r[4] = 1'b1;
          6'h18: out_r[4] = 1'b1;
          6'h19: out_r[4] = 1'b1;
          6'h1b: out_r[4] = 1'b1;
          6'h1e: out_r[4] = 1'b1;
          6'h21: out_r[4] = 1'b1;
          6'h23: out_r[4] = 1'b1;
          6'h24: out_r[4] = 1'b1;
          6'h25: out_r[4] = 1'b1;
          6'h28: out_r[4] = 1'b1;
          6'h29: out_r[4] = 1'b1;
          6'h2a: out_r[4] = 1'b1;
          6'h2b: out_r[4] = 1'b1;
          6'h33: out_r[4] = 1'b1;
          6'h36: out_r[4] = 1'b1;
          6'h38: out_r[4] = 1'b1;
          6'h39: out_r[4] = 1'b1;
          6'h3a: out_r[4] = 1'b1;
          6'h3b: out_r[4] = 1'b1;
          6'h3e: out_r[4] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h06: out_r[5] = 1'b0;
          6'h08: out_r[5] = 1'b0;
          6'h0b: out_r[5] = 1'b0;
          6'h0e: out_r[5] = 1'b0;
          6'h11: out_r[5] = 1'b0;
          6'h12: out_r[5] = 1'b0;
          6'h13: out_r[5] = 1'b0;
          6'h16: out_r[5] = 1'b0;
          6'h1c: out_r[5] = 1'b0;
          6'h1d: out_r[5] = 1'b0;
          6'h1e: out_r[5] = 1'b0;
          6'h1f: out_r[5] = 1'b0;
          6'h29: out_r[5] = 1'b0;
          6'h2a: out_r[5] = 1'b0;
          6'h2c: out_r[5] = 1'b0;
          6'h2d: out_r[5] = 1'b0;
          6'h31: out_r[5] = 1'b0;
          6'h33: out_r[5] = 1'b0;
          6'h36: out_r[5] = 1'b0;
          6'h38: out_r[5] = 1'b0;
          6'h3a: out_r[5] = 1'b0;
          6'h3c: out_r[5] = 1'b0;
          6'h3d: out_r[5] = 1'b0;
          6'h3e: out_r[5] = 1'b0;
          6'h3f: out_r[5] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[6] = 1'b1;
          6'h04: out_r[6] = 1'b1;
          6'h07: out_r[6] = 1'b1;
          6'h09: out_r[6] = 1'b1;
          6'h0a: out_r[6] = 1'b1;
          6'h0c: out_r[6] = 1'b1;
          6'h0f: out_r[6] = 1'b1;
          6'h11: out_r[6] = 1'b1;
          6'h1a: out_r[6] = 1'b1;
          6'h20: out_r[6] = 1'b1;
          6'h21: out_r[6] = 1'b1;
          6'h22: out_r[6] = 1'b1;
          6'h25: out_r[6] = 1'b1;
          6'h26: out_r[6] = 1'b1;
          6'h27: out_r[6] = 1'b1;
          6'h2e: out_r[6] = 1'b1;
          6'h2f: out_r[6] = 1'b1;
          6'h30: out_r[6] = 1'b1;
          6'h31: out_r[6] = 1'b1;
          6'h32: out_r[6] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h20: out_r[7] = 1'b0;
          6'h21: out_r[7] = 1'b0;
          6'h29: out_r[7] = 1'b0;
          6'h30: out_r[7] = 1'b0;
          6'h32: out_r[7] = 1'b0;
          6'h36: out_r[7] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h06: out_r[8] = 1'b0;
          6'h0e: out_r[8] = 1'b0;
          6'h16: out_r[8] = 1'b0;
          6'h1e: out_r[8] = 1'b0;
          6'h20: out_r[8] = 1'b0;
          6'h21: out_r[8] = 1'b0;
          6'h22: out_r[8] = 1'b0;
          6'h28: out_r[8] = 1'b0;
          6'h2c: out_r[8] = 1'b0;
          6'h30: out_r[8] = 1'b0;
          6'h32: out_r[8] = 1'b0;
          6'h38: out_r[8] = 1'b0;
          6'h3c: out_r[8] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[9] = 1'b0;
          6'h04: out_r[9] = 1'b0;
          6'h05: out_r[9] = 1'b0;
          6'h07: out_r[9] = 1'b0;
          6'h08: out_r[9] = 1'b0;
          6'h09: out_r[9] = 1'b0;
          6'h0a: out_r[9] = 1'b0;
          6'h0c: out_r[9] = 1'b0;
          6'h0d: out_r[9] = 1'b0;
          6'h0f: out_r[9] = 1'b0;
          6'h10: out_r[9] = 1'b0;
          6'h11: out_r[9] = 1'b0;
          6'h12: out_r[9] = 1'b0;
          6'h13: out_r[9] = 1'b0;
          6'h15: out_r[9] = 1'b0;
          6'h1a: out_r[9] = 1'b0;
          6'h25: out_r[9] = 1'b0;
          6'h26: out_r[9] = 1'b0;
          6'h27: out_r[9] = 1'b0;
          6'h2a: out_r[9] = 1'b0;
          6'h2e: out_r[9] = 1'b0;
          6'h2f: out_r[9] = 1'b0;
          6'h31: out_r[9] = 1'b0;
          6'h33: out_r[9] = 1'b0;
          6'h35: out_r[9] = 1'b0;
          6'h36: out_r[9] = 1'b0;
          6'h3a: out_r[9] = 1'b0;
          6'h3e: out_r[9] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h01: out_r[10] = 1'b1;
          6'h02: out_r[10] = 1'b1;
          6'h06: out_r[10] = 1'b1;
          6'h09: out_r[10] = 1'b1;
          6'h0b: out_r[10] = 1'b1;
          6'h0e: out_r[10] = 1'b1;
          6'h16: out_r[10] = 1'b1;
          6'h1d: out_r[10] = 1'b1;
          6'h1e: out_r[10] = 1'b1;
          6'h20: out_r[10] = 1'b1;
          6'h21: out_r[10] = 1'b1;
          6'h22: out_r[10] = 1'b1;
          6'h23: out_r[10] = 1'b1;
          6'h24: out_r[10] = 1'b1;
          6'h25: out_r[10] = 1'b1;
          6'h26: out_r[10] = 1'b1;
          6'h28: out_r[10] = 1'b1;
          6'h29: out_r[10] = 1'b1;
          6'h2b: out_r[10] = 1'b1;
          6'h2c: out_r[10] = 1'b1;
          6'h2d: out_r[10] = 1'b1;
          6'h2e: out_r[10] = 1'b1;
          6'h30: out_r[10] = 1'b1;
          6'h32: out_r[10] = 1'b1;
          6'h34: out_r[10] = 1'b1;
          6'h36: out_r[10] = 1'b1;
          6'h38: out_r[10] = 1'b1;
          6'h3c: out_r[10] = 1'b1;
          6'h3d: out_r[10] = 1'b1;
          6'h3e: out_r[10] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h03: out_r[11] = 1'b1;
          6'h06: out_r[11] = 1'b1;
          6'h07: out_r[11] = 1'b1;
          6'h08: out_r[11] = 1'b1;
          6'h0a: out_r[11] = 1'b1;
          6'h0e: out_r[11] = 1'b1;
          6'h0f: out_r[11] = 1'b1;
          6'h11: out_r[11] = 1'b1;
          6'h13: out_r[11] = 1'b1;
          6'h16: out_r[11] = 1'b1;
          6'h17: out_r[11] = 1'b1;
          6'h19: out_r[11] = 1'b1;
          6'h1b: out_r[11] = 1'b1;
          6'h1e: out_r[11] = 1'b1;
          6'h1f: out_r[11] = 1'b1;
          6'h22: out_r[11] = 1'b1;
          6'h27: out_r[11] = 1'b1;
          6'h28: out_r[11] = 1'b1;
          6'h2a: out_r[11] = 1'b1;
          6'h2c: out_r[11] = 1'b1;
          6'h2f: out_r[11] = 1'b1;
          6'h31: out_r[11] = 1'b1;
          6'h33: out_r[11] = 1'b1;
          6'h37: out_r[11] = 1'b1;
          6'h38: out_r[11] = 1'b1;
          6'h39: out_r[11] = 1'b1;
          6'h3a: out_r[11] = 1'b1;
          6'h3b: out_r[11] = 1'b1;
          6'h3c: out_r[11] = 1'b1;
          6'h3f: out_r[11] = 1'b1;
          default: begin end
        endcase
      end
      6'h20: begin
        out_r = 12'h410;
        case (inner)
          6'h10: out_r[0] = 1'b1;
          6'h11: out_r[0] = 1'b1;
          6'h12: out_r[0] = 1'b1;
          6'h14: out_r[0] = 1'b1;
          6'h15: out_r[0] = 1'b1;
          6'h17: out_r[0] = 1'b1;
          6'h18: out_r[0] = 1'b1;
          6'h19: out_r[0] = 1'b1;
          6'h1a: out_r[0] = 1'b1;
          6'h1f: out_r[0] = 1'b1;
          6'h23: out_r[0] = 1'b1;
          6'h27: out_r[0] = 1'b1;
          6'h2a: out_r[0] = 1'b1;
          6'h2b: out_r[0] = 1'b1;
          6'h2e: out_r[0] = 1'b1;
          6'h2f: out_r[0] = 1'b1;
          6'h33: out_r[0] = 1'b1;
          6'h37: out_r[0] = 1'b1;
          6'h39: out_r[0] = 1'b1;
          6'h3a: out_r[0] = 1'b1;
          6'h3c: out_r[0] = 1'b1;
          6'h3d: out_r[0] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h01: out_r[1] = 1'b1;
          6'h03: out_r[1] = 1'b1;
          6'h05: out_r[1] = 1'b1;
          6'h07: out_r[1] = 1'b1;
          6'h09: out_r[1] = 1'b1;
          6'h0b: out_r[1] = 1'b1;
          6'h0d: out_r[1] = 1'b1;
          6'h0f: out_r[1] = 1'b1;
          6'h16: out_r[1] = 1'b1;
          6'h17: out_r[1] = 1'b1;
          6'h1d: out_r[1] = 1'b1;
          6'h1f: out_r[1] = 1'b1;
          6'h21: out_r[1] = 1'b1;
          6'h25: out_r[1] = 1'b1;
          6'h28: out_r[1] = 1'b1;
          6'h2a: out_r[1] = 1'b1;
          6'h2e: out_r[1] = 1'b1;
          6'h31: out_r[1] = 1'b1;
          6'h35: out_r[1] = 1'b1;
          6'h38: out_r[1] = 1'b1;
          6'h39: out_r[1] = 1'b1;
          6'h3a: out_r[1] = 1'b1;
          6'h3c: out_r[1] = 1'b1;
          6'h3d: out_r[1] = 1'b1;
          6'h3f: out_r[1] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h10: out_r[2] = 1'b1;
          6'h11: out_r[2] = 1'b1;
          6'h12: out_r[2] = 1'b1;
          6'h13: out_r[2] = 1'b1;
          6'h14: out_r[2] = 1'b1;
          6'h15: out_r[2] = 1'b1;
          6'h18: out_r[2] = 1'b1;
          6'h19: out_r[2] = 1'b1;
          6'h1a: out_r[2] = 1'b1;
          6'h1b: out_r[2] = 1'b1;
          6'h1e: out_r[2] = 1'b1;
          6'h1f: out_r[2] = 1'b1;
          6'h22: out_r[2] = 1'b1;
          6'h23: out_r[2] = 1'b1;
          6'h26: out_r[2] = 1'b1;
          6'h27: out_r[2] = 1'b1;
          6'h2a: out_r[2] = 1'b1;
          6'h2b: out_r[2] = 1'b1;
          6'h2e: out_r[2] = 1'b1;
          6'h2f: out_r[2] = 1'b1;
          6'h32: out_r[2] = 1'b1;
          6'h33: out_r[2] = 1'b1;
          6'h36: out_r[2] = 1'b1;
          6'h37: out_r[2] = 1'b1;
          6'h3e: out_r[2] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h02: out_r[3] = 1'b1;
          6'h03: out_r[3] = 1'b1;
          6'h06: out_r[3] = 1'b1;
          6'h07: out_r[3] = 1'b1;
          6'h0a: out_r[3] = 1'b1;
          6'h0b: out_r[3] = 1'b1;
          6'h0e: out_r[3] = 1'b1;
          6'h0f: out_r[3] = 1'b1;
          6'h1c: out_r[3] = 1'b1;
          6'h1d: out_r[3] = 1'b1;
          6'h1e: out_r[3] = 1'b1;
          6'h1f: out_r[3] = 1'b1;
          6'h22: out_r[3] = 1'b1;
          6'h23: out_r[3] = 1'b1;
          6'h26: out_r[3] = 1'b1;
          6'h27: out_r[3] = 1'b1;
          6'h2a: out_r[3] = 1'b1;
          6'h2b: out_r[3] = 1'b1;
          6'h2e: out_r[3] = 1'b1;
          6'h2f: out_r[3] = 1'b1;
          6'h32: out_r[3] = 1'b1;
          6'h33: out_r[3] = 1'b1;
          6'h36: out_r[3] = 1'b1;
          6'h37: out_r[3] = 1'b1;
          6'h38: out_r[3] = 1'b1;
          6'h3d: out_r[3] = 1'b1;
          6'h3e: out_r[3] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[4] = 1'b0;
          6'h01: out_r[4] = 1'b0;
          6'h02: out_r[4] = 1'b0;
          6'h03: out_r[4] = 1'b0;
          6'h04: out_r[4] = 1'b0;
          6'h05: out_r[4] = 1'b0;
          6'h06: out_r[4] = 1'b0;
          6'h07: out_r[4] = 1'b0;
          6'h08: out_r[4] = 1'b0;
          6'h09: out_r[4] = 1'b0;
          6'h0a: out_r[4] = 1'b0;
          6'h0b: out_r[4] = 1'b0;
          6'h0c: out_r[4] = 1'b0;
          6'h0d: out_r[4] = 1'b0;
          6'h0e: out_r[4] = 1'b0;
          6'h0f: out_r[4] = 1'b0;
          6'h1c: out_r[4] = 1'b0;
          6'h1d: out_r[4] = 1'b0;
          6'h1e: out_r[4] = 1'b0;
          6'h1f: out_r[4] = 1'b0;
          6'h24: out_r[4] = 1'b0;
          6'h2c: out_r[4] = 1'b0;
          6'h34: out_r[4] = 1'b0;
          6'h3c: out_r[4] = 1'b0;
          6'h3d: out_r[4] = 1'b0;
          6'h3e: out_r[4] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h04: out_r[5] = 1'b1;
          6'h05: out_r[5] = 1'b1;
          6'h06: out_r[5] = 1'b1;
          6'h07: out_r[5] = 1'b1;
          6'h0c: out_r[5] = 1'b1;
          6'h0d: out_r[5] = 1'b1;
          6'h0e: out_r[5] = 1'b1;
          6'h0f: out_r[5] = 1'b1;
          6'h20: out_r[5] = 1'b1;
          6'h21: out_r[5] = 1'b1;
          6'h22: out_r[5] = 1'b1;
          6'h23: out_r[5] = 1'b1;
          6'h25: out_r[5] = 1'b1;
          6'h26: out_r[5] = 1'b1;
          6'h27: out_r[5] = 1'b1;
          6'h28: out_r[5] = 1'b1;
          6'h29: out_r[5] = 1'b1;
          6'h2a: out_r[5] = 1'b1;
          6'h2b: out_r[5] = 1'b1;
          6'h2d: out_r[5] = 1'b1;
          6'h2e: out_r[5] = 1'b1;
          6'h2f: out_r[5] = 1'b1;
          6'h30: out_r[5] = 1'b1;
          6'h31: out_r[5] = 1'b1;
          6'h32: out_r[5] = 1'b1;
          6'h33: out_r[5] = 1'b1;
          6'h35: out_r[5] = 1'b1;
          6'h36: out_r[5] = 1'b1;
          6'h37: out_r[5] = 1'b1;
          6'h39: out_r[5] = 1'b1;
          6'h3f: out_r[5] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h10: out_r[6] = 1'b1;
          6'h11: out_r[6] = 1'b1;
          6'h12: out_r[6] = 1'b1;
          6'h13: out_r[6] = 1'b1;
          6'h14: out_r[6] = 1'b1;
          6'h15: out_r[6] = 1'b1;
          6'h16: out_r[6] = 1'b1;
          6'h17: out_r[6] = 1'b1;
          6'h18: out_r[6] = 1'b1;
          6'h19: out_r[6] = 1'b1;
          6'h1a: out_r[6] = 1'b1;
          6'h1b: out_r[6] = 1'b1;
          6'h1c: out_r[6] = 1'b1;
          6'h1d: out_r[6] = 1'b1;
          6'h1e: out_r[6] = 1'b1;
          6'h1f: out_r[6] = 1'b1;
          6'h38: out_r[6] = 1'b1;
          6'h39: out_r[6] = 1'b1;
          6'h3a: out_r[6] = 1'b1;
          6'h3b: out_r[6] = 1'b1;
          6'h3c: out_r[6] = 1'b1;
          6'h3d: out_r[6] = 1'b1;
          6'h3e: out_r[6] = 1'b1;
          6'h3f: out_r[6] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h08: out_r[7] = 1'b1;
          6'h09: out_r[7] = 1'b1;
          6'h0a: out_r[7] = 1'b1;
          6'h0b: out_r[7] = 1'b1;
          6'h0c: out_r[7] = 1'b1;
          6'h0d: out_r[7] = 1'b1;
          6'h0e: out_r[7] = 1'b1;
          6'h0f: out_r[7] = 1'b1;
          6'h15: out_r[7] = 1'b1;
          6'h19: out_r[7] = 1'b1;
          6'h1a: out_r[7] = 1'b1;
          6'h25: out_r[7] = 1'b1;
          6'h26: out_r[7] = 1'b1;
          6'h28: out_r[7] = 1'b1;
          6'h29: out_r[7] = 1'b1;
          6'h2a: out_r[7] = 1'b1;
          6'h2d: out_r[7] = 1'b1;
          6'h2e: out_r[7] = 1'b1;
          6'h35: out_r[7] = 1'b1;
          6'h36: out_r[7] = 1'b1;
          6'h38: out_r[7] = 1'b1;
          6'h39: out_r[7] = 1'b1;
          6'h3a: out_r[7] = 1'b1;
          6'h3b: out_r[7] = 1'b1;
          6'h3c: out_r[7] = 1'b1;
          6'h3d: out_r[7] = 1'b1;
          6'h3e: out_r[7] = 1'b1;
          6'h3f: out_r[7] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h10: out_r[8] = 1'b1;
          6'h11: out_r[8] = 1'b1;
          6'h12: out_r[8] = 1'b1;
          6'h13: out_r[8] = 1'b1;
          6'h14: out_r[8] = 1'b1;
          6'h15: out_r[8] = 1'b1;
          6'h16: out_r[8] = 1'b1;
          6'h17: out_r[8] = 1'b1;
          6'h18: out_r[8] = 1'b1;
          6'h19: out_r[8] = 1'b1;
          6'h1a: out_r[8] = 1'b1;
          6'h1b: out_r[8] = 1'b1;
          6'h1c: out_r[8] = 1'b1;
          6'h1d: out_r[8] = 1'b1;
          6'h1e: out_r[8] = 1'b1;
          6'h1f: out_r[8] = 1'b1;
          6'h27: out_r[8] = 1'b1;
          6'h2b: out_r[8] = 1'b1;
          6'h2f: out_r[8] = 1'b1;
          6'h37: out_r[8] = 1'b1;
          6'h39: out_r[8] = 1'b1;
          6'h3c: out_r[8] = 1'b1;
          6'h3d: out_r[8] = 1'b1;
          6'h3f: out_r[8] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h11: out_r[9] = 1'b1;
          6'h12: out_r[9] = 1'b1;
          6'h14: out_r[9] = 1'b1;
          6'h15: out_r[9] = 1'b1;
          6'h18: out_r[9] = 1'b1;
          6'h19: out_r[9] = 1'b1;
          6'h1a: out_r[9] = 1'b1;
          6'h26: out_r[9] = 1'b1;
          6'h2e: out_r[9] = 1'b1;
          6'h36: out_r[9] = 1'b1;
          6'h39: out_r[9] = 1'b1;
          6'h3c: out_r[9] = 1'b1;
          6'h3d: out_r[9] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h11: out_r[10] = 1'b0;
          6'h12: out_r[10] = 1'b0;
          6'h14: out_r[10] = 1'b0;
          6'h17: out_r[10] = 1'b0;
          6'h18: out_r[10] = 1'b0;
          6'h1f: out_r[10] = 1'b0;
          6'h24: out_r[10] = 1'b0;
          6'h25: out_r[10] = 1'b0;
          6'h26: out_r[10] = 1'b0;
          6'h29: out_r[10] = 1'b0;
          6'h2c: out_r[10] = 1'b0;
          6'h2e: out_r[10] = 1'b0;
          6'h34: out_r[10] = 1'b0;
          6'h35: out_r[10] = 1'b0;
          6'h36: out_r[10] = 1'b0;
          6'h39: out_r[10] = 1'b0;
          6'h3a: out_r[10] = 1'b0;
          6'h3c: out_r[10] = 1'b0;
          6'h3d: out_r[10] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h10: out_r[11] = 1'b1;
          6'h11: out_r[11] = 1'b1;
          6'h12: out_r[11] = 1'b1;
          6'h14: out_r[11] = 1'b1;
          6'h15: out_r[11] = 1'b1;
          6'h17: out_r[11] = 1'b1;
          6'h18: out_r[11] = 1'b1;
          6'h19: out_r[11] = 1'b1;
          6'h1a: out_r[11] = 1'b1;
          6'h1f: out_r[11] = 1'b1;
          6'h20: out_r[11] = 1'b1;
          6'h21: out_r[11] = 1'b1;
          6'h22: out_r[11] = 1'b1;
          6'h23: out_r[11] = 1'b1;
          6'h28: out_r[11] = 1'b1;
          6'h2a: out_r[11] = 1'b1;
          6'h30: out_r[11] = 1'b1;
          6'h31: out_r[11] = 1'b1;
          6'h32: out_r[11] = 1'b1;
          6'h33: out_r[11] = 1'b1;
          6'h38: out_r[11] = 1'b1;
          6'h39: out_r[11] = 1'b1;
          6'h3a: out_r[11] = 1'b1;
          6'h3c: out_r[11] = 1'b1;
          6'h3d: out_r[11] = 1'b1;
          default: begin end
        endcase
      end
      6'h21: begin
        out_r = 12'h903;
        case (inner)
          6'h09: out_r[0] = 1'b0;
          6'h0a: out_r[0] = 1'b0;
          6'h0b: out_r[0] = 1'b0;
          6'h0c: out_r[0] = 1'b0;
          6'h0d: out_r[0] = 1'b0;
          6'h0f: out_r[0] = 1'b0;
          6'h10: out_r[0] = 1'b0;
          6'h16: out_r[0] = 1'b0;
          6'h18: out_r[0] = 1'b0;
          6'h19: out_r[0] = 1'b0;
          6'h1e: out_r[0] = 1'b0;
          6'h1f: out_r[0] = 1'b0;
          6'h20: out_r[0] = 1'b0;
          6'h22: out_r[0] = 1'b0;
          6'h26: out_r[0] = 1'b0;
          6'h28: out_r[0] = 1'b0;
          6'h29: out_r[0] = 1'b0;
          6'h2c: out_r[0] = 1'b0;
          6'h2d: out_r[0] = 1'b0;
          6'h2f: out_r[0] = 1'b0;
          6'h30: out_r[0] = 1'b0;
          6'h32: out_r[0] = 1'b0;
          6'h36: out_r[0] = 1'b0;
          6'h38: out_r[0] = 1'b0;
          6'h39: out_r[0] = 1'b0;
          6'h3c: out_r[0] = 1'b0;
          6'h3e: out_r[0] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[1] = 1'b0;
          6'h02: out_r[1] = 1'b0;
          6'h04: out_r[1] = 1'b0;
          6'h06: out_r[1] = 1'b0;
          6'h08: out_r[1] = 1'b0;
          6'h09: out_r[1] = 1'b0;
          6'h0d: out_r[1] = 1'b0;
          6'h0e: out_r[1] = 1'b0;
          6'h0f: out_r[1] = 1'b0;
          6'h12: out_r[1] = 1'b0;
          6'h14: out_r[1] = 1'b0;
          6'h19: out_r[1] = 1'b0;
          6'h1a: out_r[1] = 1'b0;
          6'h1b: out_r[1] = 1'b0;
          6'h1c: out_r[1] = 1'b0;
          6'h1d: out_r[1] = 1'b0;
          6'h24: out_r[1] = 1'b0;
          6'h29: out_r[1] = 1'b0;
          6'h2a: out_r[1] = 1'b0;
          6'h2d: out_r[1] = 1'b0;
          6'h2e: out_r[1] = 1'b0;
          6'h2f: out_r[1] = 1'b0;
          6'h34: out_r[1] = 1'b0;
          6'h39: out_r[1] = 1'b0;
          6'h3a: out_r[1] = 1'b0;
          6'h3d: out_r[1] = 1'b0;
          6'h3f: out_r[1] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[2] = 1'b1;
          6'h06: out_r[2] = 1'b1;
          6'h09: out_r[2] = 1'b1;
          6'h0a: out_r[2] = 1'b1;
          6'h0b: out_r[2] = 1'b1;
          6'h0c: out_r[2] = 1'b1;
          6'h0d: out_r[2] = 1'b1;
          6'h10: out_r[2] = 1'b1;
          6'h12: out_r[2] = 1'b1;
          6'h16: out_r[2] = 1'b1;
          6'h18: out_r[2] = 1'b1;
          6'h1a: out_r[2] = 1'b1;
          6'h1e: out_r[2] = 1'b1;
          6'h1f: out_r[2] = 1'b1;
          6'h20: out_r[2] = 1'b1;
          6'h22: out_r[2] = 1'b1;
          6'h26: out_r[2] = 1'b1;
          6'h28: out_r[2] = 1'b1;
          6'h29: out_r[2] = 1'b1;
          6'h2a: out_r[2] = 1'b1;
          6'h2b: out_r[2] = 1'b1;
          6'h2c: out_r[2] = 1'b1;
          6'h2d: out_r[2] = 1'b1;
          6'h30: out_r[2] = 1'b1;
          6'h32: out_r[2] = 1'b1;
          6'h36: out_r[2] = 1'b1;
          6'h38: out_r[2] = 1'b1;
          6'h39: out_r[2] = 1'b1;
          6'h3a: out_r[2] = 1'b1;
          6'h3b: out_r[2] = 1'b1;
          6'h3c: out_r[2] = 1'b1;
          6'h3e: out_r[2] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h03: out_r[3] = 1'b1;
          6'h07: out_r[3] = 1'b1;
          6'h0a: out_r[3] = 1'b1;
          6'h0c: out_r[3] = 1'b1;
          6'h0e: out_r[3] = 1'b1;
          6'h10: out_r[3] = 1'b1;
          6'h13: out_r[3] = 1'b1;
          6'h14: out_r[3] = 1'b1;
          6'h16: out_r[3] = 1'b1;
          6'h17: out_r[3] = 1'b1;
          6'h18: out_r[3] = 1'b1;
          6'h19: out_r[3] = 1'b1;
          6'h1e: out_r[3] = 1'b1;
          6'h1f: out_r[3] = 1'b1;
          6'h20: out_r[3] = 1'b1;
          6'h22: out_r[3] = 1'b1;
          6'h23: out_r[3] = 1'b1;
          6'h26: out_r[3] = 1'b1;
          6'h27: out_r[3] = 1'b1;
          6'h28: out_r[3] = 1'b1;
          6'h2c: out_r[3] = 1'b1;
          6'h2e: out_r[3] = 1'b1;
          6'h30: out_r[3] = 1'b1;
          6'h32: out_r[3] = 1'b1;
          6'h33: out_r[3] = 1'b1;
          6'h36: out_r[3] = 1'b1;
          6'h37: out_r[3] = 1'b1;
          6'h38: out_r[3] = 1'b1;
          6'h3c: out_r[3] = 1'b1;
          6'h3e: out_r[3] = 1'b1;
          6'h3f: out_r[3] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[4] = 1'b1;
          6'h02: out_r[4] = 1'b1;
          6'h06: out_r[4] = 1'b1;
          6'h08: out_r[4] = 1'b1;
          6'h09: out_r[4] = 1'b1;
          6'h0a: out_r[4] = 1'b1;
          6'h0b: out_r[4] = 1'b1;
          6'h0d: out_r[4] = 1'b1;
          6'h0f: out_r[4] = 1'b1;
          6'h12: out_r[4] = 1'b1;
          6'h16: out_r[4] = 1'b1;
          6'h18: out_r[4] = 1'b1;
          6'h19: out_r[4] = 1'b1;
          6'h1a: out_r[4] = 1'b1;
          6'h1b: out_r[4] = 1'b1;
          6'h1f: out_r[4] = 1'b1;
          6'h22: out_r[4] = 1'b1;
          6'h24: out_r[4] = 1'b1;
          6'h26: out_r[4] = 1'b1;
          6'h28: out_r[4] = 1'b1;
          6'h29: out_r[4] = 1'b1;
          6'h2a: out_r[4] = 1'b1;
          6'h2b: out_r[4] = 1'b1;
          6'h2d: out_r[4] = 1'b1;
          6'h2f: out_r[4] = 1'b1;
          6'h32: out_r[4] = 1'b1;
          6'h34: out_r[4] = 1'b1;
          6'h36: out_r[4] = 1'b1;
          6'h38: out_r[4] = 1'b1;
          6'h39: out_r[4] = 1'b1;
          6'h3a: out_r[4] = 1'b1;
          6'h3b: out_r[4] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[5] = 1'b1;
          6'h02: out_r[5] = 1'b1;
          6'h05: out_r[5] = 1'b1;
          6'h06: out_r[5] = 1'b1;
          6'h07: out_r[5] = 1'b1;
          6'h08: out_r[5] = 1'b1;
          6'h0a: out_r[5] = 1'b1;
          6'h12: out_r[5] = 1'b1;
          6'h14: out_r[5] = 1'b1;
          6'h15: out_r[5] = 1'b1;
          6'h17: out_r[5] = 1'b1;
          6'h18: out_r[5] = 1'b1;
          6'h1a: out_r[5] = 1'b1;
          6'h22: out_r[5] = 1'b1;
          6'h24: out_r[5] = 1'b1;
          6'h25: out_r[5] = 1'b1;
          6'h27: out_r[5] = 1'b1;
          6'h28: out_r[5] = 1'b1;
          6'h2a: out_r[5] = 1'b1;
          6'h2b: out_r[5] = 1'b1;
          6'h32: out_r[5] = 1'b1;
          6'h34: out_r[5] = 1'b1;
          6'h35: out_r[5] = 1'b1;
          6'h37: out_r[5] = 1'b1;
          6'h38: out_r[5] = 1'b1;
          6'h3a: out_r[5] = 1'b1;
          6'h3b: out_r[5] = 1'b1;
          6'h3c: out_r[5] = 1'b1;
          6'h3d: out_r[5] = 1'b1;
          6'h3f: out_r[5] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[6] = 1'b1;
          6'h02: out_r[6] = 1'b1;
          6'h04: out_r[6] = 1'b1;
          6'h06: out_r[6] = 1'b1;
          6'h09: out_r[6] = 1'b1;
          6'h0b: out_r[6] = 1'b1;
          6'h0d: out_r[6] = 1'b1;
          6'h0f: out_r[6] = 1'b1;
          6'h14: out_r[6] = 1'b1;
          6'h16: out_r[6] = 1'b1;
          6'h18: out_r[6] = 1'b1;
          6'h19: out_r[6] = 1'b1;
          6'h1a: out_r[6] = 1'b1;
          6'h1b: out_r[6] = 1'b1;
          6'h1c: out_r[6] = 1'b1;
          6'h1d: out_r[6] = 1'b1;
          6'h1f: out_r[6] = 1'b1;
          6'h24: out_r[6] = 1'b1;
          6'h26: out_r[6] = 1'b1;
          6'h29: out_r[6] = 1'b1;
          6'h2b: out_r[6] = 1'b1;
          6'h2c: out_r[6] = 1'b1;
          6'h2d: out_r[6] = 1'b1;
          6'h2f: out_r[6] = 1'b1;
          6'h34: out_r[6] = 1'b1;
          6'h36: out_r[6] = 1'b1;
          6'h39: out_r[6] = 1'b1;
          6'h3b: out_r[6] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[7] = 1'b1;
          6'h04: out_r[7] = 1'b1;
          6'h06: out_r[7] = 1'b1;
          6'h0b: out_r[7] = 1'b1;
          6'h0c: out_r[7] = 1'b1;
          6'h11: out_r[7] = 1'b1;
          6'h13: out_r[7] = 1'b1;
          6'h15: out_r[7] = 1'b1;
          6'h16: out_r[7] = 1'b1;
          6'h17: out_r[7] = 1'b1;
          6'h18: out_r[7] = 1'b1;
          6'h19: out_r[7] = 1'b1;
          6'h1b: out_r[7] = 1'b1;
          6'h1c: out_r[7] = 1'b1;
          6'h1d: out_r[7] = 1'b1;
          6'h1f: out_r[7] = 1'b1;
          6'h24: out_r[7] = 1'b1;
          6'h26: out_r[7] = 1'b1;
          6'h28: out_r[7] = 1'b1;
          6'h2a: out_r[7] = 1'b1;
          6'h2b: out_r[7] = 1'b1;
          6'h2c: out_r[7] = 1'b1;
          6'h34: out_r[7] = 1'b1;
          6'h36: out_r[7] = 1'b1;
          6'h38: out_r[7] = 1'b1;
          6'h3a: out_r[7] = 1'b1;
          6'h3b: out_r[7] = 1'b1;
          6'h3c: out_r[7] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h04: out_r[8] = 1'b0;
          6'h06: out_r[8] = 1'b0;
          6'h0b: out_r[8] = 1'b0;
          6'h0c: out_r[8] = 1'b0;
          6'h0e: out_r[8] = 1'b0;
          6'h10: out_r[8] = 1'b0;
          6'h11: out_r[8] = 1'b0;
          6'h12: out_r[8] = 1'b0;
          6'h13: out_r[8] = 1'b0;
          6'h15: out_r[8] = 1'b0;
          6'h16: out_r[8] = 1'b0;
          6'h17: out_r[8] = 1'b0;
          6'h19: out_r[8] = 1'b0;
          6'h1b: out_r[8] = 1'b0;
          6'h1c: out_r[8] = 1'b0;
          6'h1d: out_r[8] = 1'b0;
          6'h1e: out_r[8] = 1'b0;
          6'h20: out_r[8] = 1'b0;
          6'h22: out_r[8] = 1'b0;
          6'h24: out_r[8] = 1'b0;
          6'h28: out_r[8] = 1'b0;
          6'h2a: out_r[8] = 1'b0;
          6'h2b: out_r[8] = 1'b0;
          6'h30: out_r[8] = 1'b0;
          6'h32: out_r[8] = 1'b0;
          6'h34: out_r[8] = 1'b0;
          6'h38: out_r[8] = 1'b0;
          6'h3a: out_r[8] = 1'b0;
          6'h3b: out_r[8] = 1'b0;
          6'h3e: out_r[8] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[9] = 1'b1;
          6'h02: out_r[9] = 1'b1;
          6'h08: out_r[9] = 1'b1;
          6'h0a: out_r[9] = 1'b1;
          6'h14: out_r[9] = 1'b1;
          6'h1a: out_r[9] = 1'b1;
          6'h1c: out_r[9] = 1'b1;
          6'h24: out_r[9] = 1'b1;
          6'h2a: out_r[9] = 1'b1;
          6'h2c: out_r[9] = 1'b1;
          6'h34: out_r[9] = 1'b1;
          6'h3a: out_r[9] = 1'b1;
          6'h3f: out_r[9] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[10] = 1'b1;
          6'h08: out_r[10] = 1'b1;
          6'h09: out_r[10] = 1'b1;
          6'h0a: out_r[10] = 1'b1;
          6'h0c: out_r[10] = 1'b1;
          6'h0d: out_r[10] = 1'b1;
          6'h0e: out_r[10] = 1'b1;
          6'h0f: out_r[10] = 1'b1;
          6'h12: out_r[10] = 1'b1;
          6'h18: out_r[10] = 1'b1;
          6'h19: out_r[10] = 1'b1;
          6'h1a: out_r[10] = 1'b1;
          6'h1d: out_r[10] = 1'b1;
          6'h1f: out_r[10] = 1'b1;
          6'h26: out_r[10] = 1'b1;
          6'h28: out_r[10] = 1'b1;
          6'h29: out_r[10] = 1'b1;
          6'h2c: out_r[10] = 1'b1;
          6'h2d: out_r[10] = 1'b1;
          6'h2e: out_r[10] = 1'b1;
          6'h2f: out_r[10] = 1'b1;
          6'h36: out_r[10] = 1'b1;
          6'h38: out_r[10] = 1'b1;
          6'h39: out_r[10] = 1'b1;
          6'h3c: out_r[10] = 1'b1;
          6'h3d: out_r[10] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h09: out_r[11] = 1'b0;
          6'h0b: out_r[11] = 1'b0;
          6'h0d: out_r[11] = 1'b0;
          6'h0f: out_r[11] = 1'b0;
          6'h19: out_r[11] = 1'b0;
          6'h1d: out_r[11] = 1'b0;
          6'h29: out_r[11] = 1'b0;
          6'h2b: out_r[11] = 1'b0;
          6'h2d: out_r[11] = 1'b0;
          6'h2f: out_r[11] = 1'b0;
          6'h39: out_r[11] = 1'b0;
          6'h3b: out_r[11] = 1'b0;
          default: begin end
        endcase
      end
      6'h22: begin
        out_r = 12'h540;
        case (inner)
          6'h01: out_r[0] = 1'b1;
          6'h05: out_r[0] = 1'b1;
          6'h07: out_r[0] = 1'b1;
          6'h09: out_r[0] = 1'b1;
          6'h0b: out_r[0] = 1'b1;
          6'h0d: out_r[0] = 1'b1;
          6'h10: out_r[0] = 1'b1;
          6'h11: out_r[0] = 1'b1;
          6'h13: out_r[0] = 1'b1;
          6'h15: out_r[0] = 1'b1;
          6'h17: out_r[0] = 1'b1;
          6'h19: out_r[0] = 1'b1;
          6'h1a: out_r[0] = 1'b1;
          6'h1d: out_r[0] = 1'b1;
          6'h21: out_r[0] = 1'b1;
          6'h25: out_r[0] = 1'b1;
          6'h26: out_r[0] = 1'b1;
          6'h27: out_r[0] = 1'b1;
          6'h29: out_r[0] = 1'b1;
          6'h2a: out_r[0] = 1'b1;
          6'h2b: out_r[0] = 1'b1;
          6'h2d: out_r[0] = 1'b1;
          6'h31: out_r[0] = 1'b1;
          6'h35: out_r[0] = 1'b1;
          6'h36: out_r[0] = 1'b1;
          6'h37: out_r[0] = 1'b1;
          6'h39: out_r[0] = 1'b1;
          6'h3d: out_r[0] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h0b: out_r[1] = 1'b1;
          6'h10: out_r[1] = 1'b1;
          6'h1a: out_r[1] = 1'b1;
          6'h22: out_r[1] = 1'b1;
          6'h23: out_r[1] = 1'b1;
          6'h26: out_r[1] = 1'b1;
          6'h27: out_r[1] = 1'b1;
          6'h2a: out_r[1] = 1'b1;
          6'h2b: out_r[1] = 1'b1;
          6'h32: out_r[1] = 1'b1;
          6'h33: out_r[1] = 1'b1;
          6'h36: out_r[1] = 1'b1;
          6'h37: out_r[1] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[2] = 1'b1;
          6'h01: out_r[2] = 1'b1;
          6'h02: out_r[2] = 1'b1;
          6'h04: out_r[2] = 1'b1;
          6'h06: out_r[2] = 1'b1;
          6'h08: out_r[2] = 1'b1;
          6'h09: out_r[2] = 1'b1;
          6'h0a: out_r[2] = 1'b1;
          6'h0c: out_r[2] = 1'b1;
          6'h0e: out_r[2] = 1'b1;
          6'h10: out_r[2] = 1'b1;
          6'h13: out_r[2] = 1'b1;
          6'h15: out_r[2] = 1'b1;
          6'h19: out_r[2] = 1'b1;
          6'h1b: out_r[2] = 1'b1;
          6'h1c: out_r[2] = 1'b1;
          6'h21: out_r[2] = 1'b1;
          6'h24: out_r[2] = 1'b1;
          6'h25: out_r[2] = 1'b1;
          6'h29: out_r[2] = 1'b1;
          6'h2c: out_r[2] = 1'b1;
          6'h2e: out_r[2] = 1'b1;
          6'h2f: out_r[2] = 1'b1;
          6'h31: out_r[2] = 1'b1;
          6'h34: out_r[2] = 1'b1;
          6'h35: out_r[2] = 1'b1;
          6'h38: out_r[2] = 1'b1;
          6'h3a: out_r[2] = 1'b1;
          6'h3b: out_r[2] = 1'b1;
          6'h3c: out_r[2] = 1'b1;
          6'h3d: out_r[2] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h02: out_r[3] = 1'b1;
          6'h05: out_r[3] = 1'b1;
          6'h06: out_r[3] = 1'b1;
          6'h07: out_r[3] = 1'b1;
          6'h0a: out_r[3] = 1'b1;
          6'h0d: out_r[3] = 1'b1;
          6'h0e: out_r[3] = 1'b1;
          6'h10: out_r[3] = 1'b1;
          6'h11: out_r[3] = 1'b1;
          6'h14: out_r[3] = 1'b1;
          6'h16: out_r[3] = 1'b1;
          6'h17: out_r[3] = 1'b1;
          6'h18: out_r[3] = 1'b1;
          6'h1b: out_r[3] = 1'b1;
          6'h1d: out_r[3] = 1'b1;
          6'h20: out_r[3] = 1'b1;
          6'h28: out_r[3] = 1'b1;
          6'h2a: out_r[3] = 1'b1;
          6'h2b: out_r[3] = 1'b1;
          6'h2d: out_r[3] = 1'b1;
          6'h30: out_r[3] = 1'b1;
          6'h39: out_r[3] = 1'b1;
          6'h3a: out_r[3] = 1'b1;
          6'h3b: out_r[3] = 1'b1;
          6'h3e: out_r[3] = 1'b1;
          6'h3f: out_r[3] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h03: out_r[4] = 1'b1;
          6'h05: out_r[4] = 1'b1;
          6'h07: out_r[4] = 1'b1;
          6'h0b: out_r[4] = 1'b1;
          6'h0d: out_r[4] = 1'b1;
          6'h10: out_r[4] = 1'b1;
          6'h11: out_r[4] = 1'b1;
          6'h12: out_r[4] = 1'b1;
          6'h14: out_r[4] = 1'b1;
          6'h16: out_r[4] = 1'b1;
          6'h17: out_r[4] = 1'b1;
          6'h18: out_r[4] = 1'b1;
          6'h1a: out_r[4] = 1'b1;
          6'h1d: out_r[4] = 1'b1;
          6'h20: out_r[4] = 1'b1;
          6'h22: out_r[4] = 1'b1;
          6'h23: out_r[4] = 1'b1;
          6'h28: out_r[4] = 1'b1;
          6'h2a: out_r[4] = 1'b1;
          6'h2b: out_r[4] = 1'b1;
          6'h2d: out_r[4] = 1'b1;
          6'h30: out_r[4] = 1'b1;
          6'h32: out_r[4] = 1'b1;
          6'h33: out_r[4] = 1'b1;
          6'h38: out_r[4] = 1'b1;
          6'h39: out_r[4] = 1'b1;
          6'h3d: out_r[4] = 1'b1;
          6'h3e: out_r[4] = 1'b1;
          6'h3f: out_r[4] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h04: out_r[5] = 1'b1;
          6'h05: out_r[5] = 1'b1;
          6'h06: out_r[5] = 1'b1;
          6'h09: out_r[5] = 1'b1;
          6'h0c: out_r[5] = 1'b1;
          6'h0d: out_r[5] = 1'b1;
          6'h0e: out_r[5] = 1'b1;
          6'h11: out_r[5] = 1'b1;
          6'h15: out_r[5] = 1'b1;
          6'h16: out_r[5] = 1'b1;
          6'h17: out_r[5] = 1'b1;
          6'h1b: out_r[5] = 1'b1;
          6'h1d: out_r[5] = 1'b1;
          6'h20: out_r[5] = 1'b1;
          6'h21: out_r[5] = 1'b1;
          6'h28: out_r[5] = 1'b1;
          6'h2d: out_r[5] = 1'b1;
          6'h30: out_r[5] = 1'b1;
          6'h31: out_r[5] = 1'b1;
          6'h39: out_r[5] = 1'b1;
          6'h3a: out_r[5] = 1'b1;
          6'h3b: out_r[5] = 1'b1;
          6'h3e: out_r[5] = 1'b1;
          6'h3f: out_r[5] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[6] = 1'b0;
          6'h02: out_r[6] = 1'b0;
          6'h04: out_r[6] = 1'b0;
          6'h06: out_r[6] = 1'b0;
          6'h08: out_r[6] = 1'b0;
          6'h09: out_r[6] = 1'b0;
          6'h0a: out_r[6] = 1'b0;
          6'h0c: out_r[6] = 1'b0;
          6'h0d: out_r[6] = 1'b0;
          6'h0e: out_r[6] = 1'b0;
          6'h1b: out_r[6] = 1'b0;
          6'h1f: out_r[6] = 1'b0;
          6'h20: out_r[6] = 1'b0;
          6'h24: out_r[6] = 1'b0;
          6'h28: out_r[6] = 1'b0;
          6'h29: out_r[6] = 1'b0;
          6'h2c: out_r[6] = 1'b0;
          6'h2d: out_r[6] = 1'b0;
          6'h30: out_r[6] = 1'b0;
          6'h34: out_r[6] = 1'b0;
          6'h3a: out_r[6] = 1'b0;
          6'h3b: out_r[6] = 1'b0;
          6'h3e: out_r[6] = 1'b0;
          6'h3f: out_r[6] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h01: out_r[7] = 1'b1;
          6'h05: out_r[7] = 1'b1;
          6'h08: out_r[7] = 1'b1;
          6'h09: out_r[7] = 1'b1;
          6'h0a: out_r[7] = 1'b1;
          6'h0c: out_r[7] = 1'b1;
          6'h0d: out_r[7] = 1'b1;
          6'h0e: out_r[7] = 1'b1;
          6'h16: out_r[7] = 1'b1;
          6'h17: out_r[7] = 1'b1;
          6'h19: out_r[7] = 1'b1;
          6'h1d: out_r[7] = 1'b1;
          6'h28: out_r[7] = 1'b1;
          6'h2c: out_r[7] = 1'b1;
          6'h38: out_r[7] = 1'b1;
          6'h39: out_r[7] = 1'b1;
          6'h3c: out_r[7] = 1'b1;
          6'h3d: out_r[7] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[8] = 1'b0;
          6'h02: out_r[8] = 1'b0;
          6'h04: out_r[8] = 1'b0;
          6'h06: out_r[8] = 1'b0;
          6'h08: out_r[8] = 1'b0;
          6'h0a: out_r[8] = 1'b0;
          6'h0c: out_r[8] = 1'b0;
          6'h0e: out_r[8] = 1'b0;
          6'h17: out_r[8] = 1'b0;
          6'h1b: out_r[8] = 1'b0;
          6'h1f: out_r[8] = 1'b0;
          6'h20: out_r[8] = 1'b0;
          6'h24: out_r[8] = 1'b0;
          6'h28: out_r[8] = 1'b0;
          6'h2c: out_r[8] = 1'b0;
          6'h30: out_r[8] = 1'b0;
          6'h34: out_r[8] = 1'b0;
          6'h38: out_r[8] = 1'b0;
          6'h3c: out_r[8] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h11: out_r[9] = 1'b1;
          6'h13: out_r[9] = 1'b1;
          6'h15: out_r[9] = 1'b1;
          6'h17: out_r[9] = 1'b1;
          6'h19: out_r[9] = 1'b1;
          6'h1d: out_r[9] = 1'b1;
          6'h21: out_r[9] = 1'b1;
          6'h25: out_r[9] = 1'b1;
          6'h29: out_r[9] = 1'b1;
          6'h2d: out_r[9] = 1'b1;
          6'h31: out_r[9] = 1'b1;
          6'h35: out_r[9] = 1'b1;
          6'h39: out_r[9] = 1'b1;
          6'h3d: out_r[9] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h07: out_r[10] = 1'b0;
          6'h0b: out_r[10] = 1'b0;
          6'h10: out_r[10] = 1'b0;
          6'h13: out_r[10] = 1'b0;
          6'h17: out_r[10] = 1'b0;
          6'h1a: out_r[10] = 1'b0;
          6'h1f: out_r[10] = 1'b0;
          6'h21: out_r[10] = 1'b0;
          6'h25: out_r[10] = 1'b0;
          6'h26: out_r[10] = 1'b0;
          6'h27: out_r[10] = 1'b0;
          6'h29: out_r[10] = 1'b0;
          6'h2a: out_r[10] = 1'b0;
          6'h2b: out_r[10] = 1'b0;
          6'h2d: out_r[10] = 1'b0;
          6'h31: out_r[10] = 1'b0;
          6'h35: out_r[10] = 1'b0;
          6'h36: out_r[10] = 1'b0;
          6'h37: out_r[10] = 1'b0;
          6'h39: out_r[10] = 1'b0;
          6'h3d: out_r[10] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h01: out_r[11] = 1'b1;
          6'h05: out_r[11] = 1'b1;
          6'h07: out_r[11] = 1'b1;
          6'h09: out_r[11] = 1'b1;
          6'h0b: out_r[11] = 1'b1;
          6'h0d: out_r[11] = 1'b1;
          6'h10: out_r[11] = 1'b1;
          6'h11: out_r[11] = 1'b1;
          6'h13: out_r[11] = 1'b1;
          6'h15: out_r[11] = 1'b1;
          6'h17: out_r[11] = 1'b1;
          6'h19: out_r[11] = 1'b1;
          6'h1a: out_r[11] = 1'b1;
          6'h1d: out_r[11] = 1'b1;
          6'h20: out_r[11] = 1'b1;
          6'h24: out_r[11] = 1'b1;
          6'h26: out_r[11] = 1'b1;
          6'h27: out_r[11] = 1'b1;
          6'h28: out_r[11] = 1'b1;
          6'h2a: out_r[11] = 1'b1;
          6'h2b: out_r[11] = 1'b1;
          6'h2c: out_r[11] = 1'b1;
          6'h30: out_r[11] = 1'b1;
          6'h34: out_r[11] = 1'b1;
          6'h36: out_r[11] = 1'b1;
          6'h37: out_r[11] = 1'b1;
          6'h38: out_r[11] = 1'b1;
          6'h3c: out_r[11] = 1'b1;
          default: begin end
        endcase
      end
      6'h23: begin
        out_r = 12'h90e;
        case (inner)
          6'h00: out_r[0] = 1'b1;
          6'h01: out_r[0] = 1'b1;
          6'h04: out_r[0] = 1'b1;
          6'h08: out_r[0] = 1'b1;
          6'h0c: out_r[0] = 1'b1;
          6'h10: out_r[0] = 1'b1;
          6'h11: out_r[0] = 1'b1;
          6'h16: out_r[0] = 1'b1;
          6'h17: out_r[0] = 1'b1;
          6'h18: out_r[0] = 1'b1;
          6'h1b: out_r[0] = 1'b1;
          6'h1f: out_r[0] = 1'b1;
          6'h20: out_r[0] = 1'b1;
          6'h21: out_r[0] = 1'b1;
          6'h24: out_r[0] = 1'b1;
          6'h28: out_r[0] = 1'b1;
          6'h29: out_r[0] = 1'b1;
          6'h30: out_r[0] = 1'b1;
          6'h31: out_r[0] = 1'b1;
          6'h34: out_r[0] = 1'b1;
          6'h38: out_r[0] = 1'b1;
          6'h39: out_r[0] = 1'b1;
          6'h3d: out_r[0] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h16: out_r[1] = 1'b0;
          6'h18: out_r[1] = 1'b0;
          6'h21: out_r[1] = 1'b0;
          6'h28: out_r[1] = 1'b0;
          6'h2e: out_r[1] = 1'b0;
          6'h31: out_r[1] = 1'b0;
          6'h38: out_r[1] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h07: out_r[2] = 1'b0;
          6'h0b: out_r[2] = 1'b0;
          6'h12: out_r[2] = 1'b0;
          6'h13: out_r[2] = 1'b0;
          6'h16: out_r[2] = 1'b0;
          6'h18: out_r[2] = 1'b0;
          6'h1b: out_r[2] = 1'b0;
          6'h1d: out_r[2] = 1'b0;
          6'h21: out_r[2] = 1'b0;
          6'h28: out_r[2] = 1'b0;
          6'h2a: out_r[2] = 1'b0;
          6'h31: out_r[2] = 1'b0;
          6'h38: out_r[2] = 1'b0;
          6'h3a: out_r[2] = 1'b0;
          6'h3e: out_r[2] = 1'b0;
          6'h3f: out_r[2] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[3] = 1'b0;
          6'h01: out_r[3] = 1'b0;
          6'h04: out_r[3] = 1'b0;
          6'h05: out_r[3] = 1'b0;
          6'h08: out_r[3] = 1'b0;
          6'h09: out_r[3] = 1'b0;
          6'h0c: out_r[3] = 1'b0;
          6'h0d: out_r[3] = 1'b0;
          6'h0f: out_r[3] = 1'b0;
          6'h10: out_r[3] = 1'b0;
          6'h11: out_r[3] = 1'b0;
          6'h14: out_r[3] = 1'b0;
          6'h15: out_r[3] = 1'b0;
          6'h16: out_r[3] = 1'b0;
          6'h17: out_r[3] = 1'b0;
          6'h1e: out_r[3] = 1'b0;
          6'h1f: out_r[3] = 1'b0;
          6'h20: out_r[3] = 1'b0;
          6'h24: out_r[3] = 1'b0;
          6'h25: out_r[3] = 1'b0;
          6'h29: out_r[3] = 1'b0;
          6'h2d: out_r[3] = 1'b0;
          6'h2e: out_r[3] = 1'b0;
          6'h30: out_r[3] = 1'b0;
          6'h34: out_r[3] = 1'b0;
          6'h35: out_r[3] = 1'b0;
          6'h39: out_r[3] = 1'b0;
          6'h3c: out_r[3] = 1'b0;
          6'h3d: out_r[3] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h03: out_r[4] = 1'b1;
          6'h07: out_r[4] = 1'b1;
          6'h0b: out_r[4] = 1'b1;
          6'h12: out_r[4] = 1'b1;
          6'h13: out_r[4] = 1'b1;
          6'h18: out_r[4] = 1'b1;
          6'h19: out_r[4] = 1'b1;
          6'h1b: out_r[4] = 1'b1;
          6'h1c: out_r[4] = 1'b1;
          6'h1d: out_r[4] = 1'b1;
          6'h21: out_r[4] = 1'b1;
          6'h28: out_r[4] = 1'b1;
          6'h2a: out_r[4] = 1'b1;
          6'h2c: out_r[4] = 1'b1;
          6'h31: out_r[4] = 1'b1;
          6'h38: out_r[4] = 1'b1;
          6'h3a: out_r[4] = 1'b1;
          6'h3e: out_r[4] = 1'b1;
          6'h3f: out_r[4] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h01: out_r[5] = 1'b1;
          6'h04: out_r[5] = 1'b1;
          6'h06: out_r[5] = 1'b1;
          6'h07: out_r[5] = 1'b1;
          6'h0b: out_r[5] = 1'b1;
          6'h0c: out_r[5] = 1'b1;
          6'h0e: out_r[5] = 1'b1;
          6'h10: out_r[5] = 1'b1;
          6'h11: out_r[5] = 1'b1;
          6'h12: out_r[5] = 1'b1;
          6'h13: out_r[5] = 1'b1;
          6'h16: out_r[5] = 1'b1;
          6'h1a: out_r[5] = 1'b1;
          6'h1b: out_r[5] = 1'b1;
          6'h1e: out_r[5] = 1'b1;
          6'h1f: out_r[5] = 1'b1;
          6'h24: out_r[5] = 1'b1;
          6'h26: out_r[5] = 1'b1;
          6'h27: out_r[5] = 1'b1;
          6'h29: out_r[5] = 1'b1;
          6'h2a: out_r[5] = 1'b1;
          6'h2f: out_r[5] = 1'b1;
          6'h34: out_r[5] = 1'b1;
          6'h36: out_r[5] = 1'b1;
          6'h37: out_r[5] = 1'b1;
          6'h39: out_r[5] = 1'b1;
          6'h3a: out_r[5] = 1'b1;
          6'h3e: out_r[5] = 1'b1;
          6'h3f: out_r[5] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h03: out_r[6] = 1'b1;
          6'h07: out_r[6] = 1'b1;
          6'h09: out_r[6] = 1'b1;
          6'h0d: out_r[6] = 1'b1;
          6'h0f: out_r[6] = 1'b1;
          6'h17: out_r[6] = 1'b1;
          6'h18: out_r[6] = 1'b1;
          6'h19: out_r[6] = 1'b1;
          6'h1b: out_r[6] = 1'b1;
          6'h1c: out_r[6] = 1'b1;
          6'h1d: out_r[6] = 1'b1;
          6'h1e: out_r[6] = 1'b1;
          6'h21: out_r[6] = 1'b1;
          6'h25: out_r[6] = 1'b1;
          6'h28: out_r[6] = 1'b1;
          6'h2c: out_r[6] = 1'b1;
          6'h2e: out_r[6] = 1'b1;
          6'h31: out_r[6] = 1'b1;
          6'h35: out_r[6] = 1'b1;
          6'h38: out_r[6] = 1'b1;
          6'h3c: out_r[6] = 1'b1;
          6'h3d: out_r[6] = 1'b1;
          6'h3e: out_r[6] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h03: out_r[7] = 1'b1;
          6'h07: out_r[7] = 1'b1;
          6'h08: out_r[7] = 1'b1;
          6'h0a: out_r[7] = 1'b1;
          6'h0c: out_r[7] = 1'b1;
          6'h0e: out_r[7] = 1'b1;
          6'h12: out_r[7] = 1'b1;
          6'h1b: out_r[7] = 1'b1;
          6'h2a: out_r[7] = 1'b1;
          6'h2b: out_r[7] = 1'b1;
          6'h2e: out_r[7] = 1'b1;
          6'h2f: out_r[7] = 1'b1;
          6'h3a: out_r[7] = 1'b1;
          6'h3b: out_r[7] = 1'b1;
          6'h3e: out_r[7] = 1'b1;
          6'h3f: out_r[7] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[8] = 1'b0;
          6'h02: out_r[8] = 1'b0;
          6'h04: out_r[8] = 1'b0;
          6'h06: out_r[8] = 1'b0;
          6'h08: out_r[8] = 1'b0;
          6'h0a: out_r[8] = 1'b0;
          6'h0b: out_r[8] = 1'b0;
          6'h0c: out_r[8] = 1'b0;
          6'h0e: out_r[8] = 1'b0;
          6'h13: out_r[8] = 1'b0;
          6'h1a: out_r[8] = 1'b0;
          6'h1b: out_r[8] = 1'b0;
          6'h22: out_r[8] = 1'b0;
          6'h23: out_r[8] = 1'b0;
          6'h26: out_r[8] = 1'b0;
          6'h27: out_r[8] = 1'b0;
          6'h2b: out_r[8] = 1'b0;
          6'h2e: out_r[8] = 1'b0;
          6'h2f: out_r[8] = 1'b0;
          6'h32: out_r[8] = 1'b0;
          6'h33: out_r[8] = 1'b0;
          6'h36: out_r[8] = 1'b0;
          6'h37: out_r[8] = 1'b0;
          6'h3b: out_r[8] = 1'b0;
          6'h3e: out_r[8] = 1'b0;
          6'h3f: out_r[8] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h03: out_r[9] = 1'b1;
          6'h0b: out_r[9] = 1'b1;
          6'h13: out_r[9] = 1'b1;
          6'h16: out_r[9] = 1'b1;
          6'h18: out_r[9] = 1'b1;
          6'h1a: out_r[9] = 1'b1;
          6'h1e: out_r[9] = 1'b1;
          6'h22: out_r[9] = 1'b1;
          6'h23: out_r[9] = 1'b1;
          6'h26: out_r[9] = 1'b1;
          6'h27: out_r[9] = 1'b1;
          6'h28: out_r[9] = 1'b1;
          6'h2b: out_r[9] = 1'b1;
          6'h2f: out_r[9] = 1'b1;
          6'h32: out_r[9] = 1'b1;
          6'h33: out_r[9] = 1'b1;
          6'h36: out_r[9] = 1'b1;
          6'h37: out_r[9] = 1'b1;
          6'h38: out_r[9] = 1'b1;
          6'h3b: out_r[9] = 1'b1;
          6'h3f: out_r[9] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h03: out_r[10] = 1'b1;
          6'h05: out_r[10] = 1'b1;
          6'h07: out_r[10] = 1'b1;
          6'h09: out_r[10] = 1'b1;
          6'h0b: out_r[10] = 1'b1;
          6'h0d: out_r[10] = 1'b1;
          6'h0f: out_r[10] = 1'b1;
          6'h12: out_r[10] = 1'b1;
          6'h14: out_r[10] = 1'b1;
          6'h15: out_r[10] = 1'b1;
          6'h18: out_r[10] = 1'b1;
          6'h19: out_r[10] = 1'b1;
          6'h1c: out_r[10] = 1'b1;
          6'h1d: out_r[10] = 1'b1;
          6'h25: out_r[10] = 1'b1;
          6'h28: out_r[10] = 1'b1;
          6'h2a: out_r[10] = 1'b1;
          6'h2d: out_r[10] = 1'b1;
          6'h2e: out_r[10] = 1'b1;
          6'h35: out_r[10] = 1'b1;
          6'h38: out_r[10] = 1'b1;
          6'h3a: out_r[10] = 1'b1;
          6'h3c: out_r[10] = 1'b1;
          6'h3e: out_r[10] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h05: out_r[11] = 1'b0;
          6'h07: out_r[11] = 1'b0;
          6'h09: out_r[11] = 1'b0;
          6'h0b: out_r[11] = 1'b0;
          6'h0d: out_r[11] = 1'b0;
          6'h0f: out_r[11] = 1'b0;
          6'h14: out_r[11] = 1'b0;
          6'h15: out_r[11] = 1'b0;
          6'h1d: out_r[11] = 1'b0;
          6'h23: out_r[11] = 1'b0;
          6'h25: out_r[11] = 1'b0;
          6'h27: out_r[11] = 1'b0;
          6'h2b: out_r[11] = 1'b0;
          6'h2d: out_r[11] = 1'b0;
          6'h2e: out_r[11] = 1'b0;
          6'h2f: out_r[11] = 1'b0;
          6'h33: out_r[11] = 1'b0;
          6'h35: out_r[11] = 1'b0;
          6'h37: out_r[11] = 1'b0;
          6'h3b: out_r[11] = 1'b0;
          6'h3c: out_r[11] = 1'b0;
          6'h3e: out_r[11] = 1'b0;
          6'h3f: out_r[11] = 1'b0;
          default: begin end
        endcase
      end
      6'h24: begin
        out_r = 12'h410;
        case (inner)
          6'h02: out_r[0] = 1'b1;
          6'h03: out_r[0] = 1'b1;
          6'h0a: out_r[0] = 1'b1;
          6'h0b: out_r[0] = 1'b1;
          6'h0f: out_r[0] = 1'b1;
          6'h10: out_r[0] = 1'b1;
          6'h18: out_r[0] = 1'b1;
          6'h1f: out_r[0] = 1'b1;
          6'h22: out_r[0] = 1'b1;
          6'h23: out_r[0] = 1'b1;
          6'h27: out_r[0] = 1'b1;
          6'h2a: out_r[0] = 1'b1;
          6'h2b: out_r[0] = 1'b1;
          6'h2f: out_r[0] = 1'b1;
          6'h32: out_r[0] = 1'b1;
          6'h33: out_r[0] = 1'b1;
          6'h37: out_r[0] = 1'b1;
          6'h39: out_r[0] = 1'b1;
          6'h3b: out_r[0] = 1'b1;
          6'h3c: out_r[0] = 1'b1;
          6'h3e: out_r[0] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h01: out_r[1] = 1'b1;
          6'h05: out_r[1] = 1'b1;
          6'h09: out_r[1] = 1'b1;
          6'h0d: out_r[1] = 1'b1;
          6'h10: out_r[1] = 1'b1;
          6'h11: out_r[1] = 1'b1;
          6'h14: out_r[1] = 1'b1;
          6'h16: out_r[1] = 1'b1;
          6'h18: out_r[1] = 1'b1;
          6'h19: out_r[1] = 1'b1;
          6'h21: out_r[1] = 1'b1;
          6'h23: out_r[1] = 1'b1;
          6'h25: out_r[1] = 1'b1;
          6'h29: out_r[1] = 1'b1;
          6'h2c: out_r[1] = 1'b1;
          6'h2e: out_r[1] = 1'b1;
          6'h2f: out_r[1] = 1'b1;
          6'h31: out_r[1] = 1'b1;
          6'h33: out_r[1] = 1'b1;
          6'h35: out_r[1] = 1'b1;
          6'h3c: out_r[1] = 1'b1;
          6'h3d: out_r[1] = 1'b1;
          6'h3e: out_r[1] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h02: out_r[2] = 1'b1;
          6'h03: out_r[2] = 1'b1;
          6'h07: out_r[2] = 1'b1;
          6'h0a: out_r[2] = 1'b1;
          6'h0b: out_r[2] = 1'b1;
          6'h0f: out_r[2] = 1'b1;
          6'h13: out_r[2] = 1'b1;
          6'h17: out_r[2] = 1'b1;
          6'h1d: out_r[2] = 1'b1;
          6'h1f: out_r[2] = 1'b1;
          6'h22: out_r[2] = 1'b1;
          6'h23: out_r[2] = 1'b1;
          6'h27: out_r[2] = 1'b1;
          6'h2a: out_r[2] = 1'b1;
          6'h2b: out_r[2] = 1'b1;
          6'h32: out_r[2] = 1'b1;
          6'h33: out_r[2] = 1'b1;
          6'h37: out_r[2] = 1'b1;
          6'h38: out_r[2] = 1'b1;
          6'h39: out_r[2] = 1'b1;
          6'h3a: out_r[2] = 1'b1;
          6'h3b: out_r[2] = 1'b1;
          6'h3c: out_r[2] = 1'b1;
          6'h3e: out_r[2] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h14: out_r[3] = 1'b1;
          6'h15: out_r[3] = 1'b1;
          6'h16: out_r[3] = 1'b1;
          6'h18: out_r[3] = 1'b1;
          6'h19: out_r[3] = 1'b1;
          6'h1c: out_r[3] = 1'b1;
          6'h1d: out_r[3] = 1'b1;
          6'h1e: out_r[3] = 1'b1;
          6'h23: out_r[3] = 1'b1;
          6'h33: out_r[3] = 1'b1;
          6'h39: out_r[3] = 1'b1;
          6'h3c: out_r[3] = 1'b1;
          6'h3e: out_r[3] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h02: out_r[4] = 1'b0;
          6'h03: out_r[4] = 1'b0;
          6'h0f: out_r[4] = 1'b0;
          6'h12: out_r[4] = 1'b0;
          6'h14: out_r[4] = 1'b0;
          6'h15: out_r[4] = 1'b0;
          6'h16: out_r[4] = 1'b0;
          6'h18: out_r[4] = 1'b0;
          6'h19: out_r[4] = 1'b0;
          6'h1b: out_r[4] = 1'b0;
          6'h1c: out_r[4] = 1'b0;
          6'h1d: out_r[4] = 1'b0;
          6'h1e: out_r[4] = 1'b0;
          6'h23: out_r[4] = 1'b0;
          6'h24: out_r[4] = 1'b0;
          6'h26: out_r[4] = 1'b0;
          6'h27: out_r[4] = 1'b0;
          6'h2d: out_r[4] = 1'b0;
          6'h2f: out_r[4] = 1'b0;
          6'h33: out_r[4] = 1'b0;
          6'h34: out_r[4] = 1'b0;
          6'h36: out_r[4] = 1'b0;
          6'h37: out_r[4] = 1'b0;
          6'h39: out_r[4] = 1'b0;
          6'h3d: out_r[4] = 1'b0;
          6'h3f: out_r[4] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h02: out_r[5] = 1'b1;
          6'h03: out_r[5] = 1'b1;
          6'h04: out_r[5] = 1'b1;
          6'h05: out_r[5] = 1'b1;
          6'h06: out_r[5] = 1'b1;
          6'h0c: out_r[5] = 1'b1;
          6'h0d: out_r[5] = 1'b1;
          6'h0e: out_r[5] = 1'b1;
          6'h0f: out_r[5] = 1'b1;
          6'h10: out_r[5] = 1'b1;
          6'h11: out_r[5] = 1'b1;
          6'h18: out_r[5] = 1'b1;
          6'h19: out_r[5] = 1'b1;
          6'h1d: out_r[5] = 1'b1;
          6'h25: out_r[5] = 1'b1;
          6'h27: out_r[5] = 1'b1;
          6'h35: out_r[5] = 1'b1;
          6'h37: out_r[5] = 1'b1;
          6'h39: out_r[5] = 1'b1;
          6'h3c: out_r[5] = 1'b1;
          6'h3d: out_r[5] = 1'b1;
          6'h3e: out_r[5] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h02: out_r[6] = 1'b1;
          6'h03: out_r[6] = 1'b1;
          6'h0f: out_r[6] = 1'b1;
          6'h10: out_r[6] = 1'b1;
          6'h11: out_r[6] = 1'b1;
          6'h14: out_r[6] = 1'b1;
          6'h15: out_r[6] = 1'b1;
          6'h16: out_r[6] = 1'b1;
          6'h18: out_r[6] = 1'b1;
          6'h19: out_r[6] = 1'b1;
          6'h1c: out_r[6] = 1'b1;
          6'h1d: out_r[6] = 1'b1;
          6'h1e: out_r[6] = 1'b1;
          6'h1f: out_r[6] = 1'b1;
          6'h27: out_r[6] = 1'b1;
          6'h37: out_r[6] = 1'b1;
          6'h39: out_r[6] = 1'b1;
          6'h3b: out_r[6] = 1'b1;
          6'h3c: out_r[6] = 1'b1;
          6'h3d: out_r[6] = 1'b1;
          6'h3e: out_r[6] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h02: out_r[7] = 1'b1;
          6'h03: out_r[7] = 1'b1;
          6'h08: out_r[7] = 1'b1;
          6'h09: out_r[7] = 1'b1;
          6'h0a: out_r[7] = 1'b1;
          6'h0b: out_r[7] = 1'b1;
          6'h0c: out_r[7] = 1'b1;
          6'h0d: out_r[7] = 1'b1;
          6'h0e: out_r[7] = 1'b1;
          6'h1c: out_r[7] = 1'b1;
          6'h1e: out_r[7] = 1'b1;
          6'h22: out_r[7] = 1'b1;
          6'h25: out_r[7] = 1'b1;
          6'h27: out_r[7] = 1'b1;
          6'h28: out_r[7] = 1'b1;
          6'h29: out_r[7] = 1'b1;
          6'h2c: out_r[7] = 1'b1;
          6'h2e: out_r[7] = 1'b1;
          6'h2f: out_r[7] = 1'b1;
          6'h32: out_r[7] = 1'b1;
          6'h35: out_r[7] = 1'b1;
          6'h37: out_r[7] = 1'b1;
          6'h3d: out_r[7] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h07: out_r[8] = 1'b1;
          6'h0f: out_r[8] = 1'b1;
          6'h10: out_r[8] = 1'b1;
          6'h11: out_r[8] = 1'b1;
          6'h14: out_r[8] = 1'b1;
          6'h15: out_r[8] = 1'b1;
          6'h16: out_r[8] = 1'b1;
          6'h17: out_r[8] = 1'b1;
          6'h18: out_r[8] = 1'b1;
          6'h19: out_r[8] = 1'b1;
          6'h1a: out_r[8] = 1'b1;
          6'h1c: out_r[8] = 1'b1;
          6'h1d: out_r[8] = 1'b1;
          6'h1e: out_r[8] = 1'b1;
          6'h1f: out_r[8] = 1'b1;
          6'h27: out_r[8] = 1'b1;
          6'h2b: out_r[8] = 1'b1;
          6'h37: out_r[8] = 1'b1;
          6'h38: out_r[8] = 1'b1;
          6'h39: out_r[8] = 1'b1;
          6'h3a: out_r[8] = 1'b1;
          6'h3b: out_r[8] = 1'b1;
          6'h3c: out_r[8] = 1'b1;
          6'h3e: out_r[8] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h03: out_r[9] = 1'b1;
          6'h0b: out_r[9] = 1'b1;
          6'h0f: out_r[9] = 1'b1;
          6'h1c: out_r[9] = 1'b1;
          6'h1e: out_r[9] = 1'b1;
          6'h22: out_r[9] = 1'b1;
          6'h23: out_r[9] = 1'b1;
          6'h27: out_r[9] = 1'b1;
          6'h2a: out_r[9] = 1'b1;
          6'h2b: out_r[9] = 1'b1;
          6'h32: out_r[9] = 1'b1;
          6'h33: out_r[9] = 1'b1;
          6'h37: out_r[9] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h03: out_r[10] = 1'b0;
          6'h0b: out_r[10] = 1'b0;
          6'h0f: out_r[10] = 1'b0;
          6'h10: out_r[10] = 1'b0;
          6'h12: out_r[10] = 1'b0;
          6'h18: out_r[10] = 1'b0;
          6'h1b: out_r[10] = 1'b0;
          6'h1c: out_r[10] = 1'b0;
          6'h1e: out_r[10] = 1'b0;
          6'h22: out_r[10] = 1'b0;
          6'h23: out_r[10] = 1'b0;
          6'h24: out_r[10] = 1'b0;
          6'h26: out_r[10] = 1'b0;
          6'h2a: out_r[10] = 1'b0;
          6'h2b: out_r[10] = 1'b0;
          6'h2d: out_r[10] = 1'b0;
          6'h2f: out_r[10] = 1'b0;
          6'h32: out_r[10] = 1'b0;
          6'h33: out_r[10] = 1'b0;
          6'h34: out_r[10] = 1'b0;
          6'h36: out_r[10] = 1'b0;
          6'h39: out_r[10] = 1'b0;
          6'h3c: out_r[10] = 1'b0;
          6'h3d: out_r[10] = 1'b0;
          6'h3e: out_r[10] = 1'b0;
          6'h3f: out_r[10] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h02: out_r[11] = 1'b1;
          6'h03: out_r[11] = 1'b1;
          6'h0a: out_r[11] = 1'b1;
          6'h0b: out_r[11] = 1'b1;
          6'h0f: out_r[11] = 1'b1;
          6'h10: out_r[11] = 1'b1;
          6'h18: out_r[11] = 1'b1;
          6'h20: out_r[11] = 1'b1;
          6'h21: out_r[11] = 1'b1;
          6'h27: out_r[11] = 1'b1;
          6'h28: out_r[11] = 1'b1;
          6'h29: out_r[11] = 1'b1;
          6'h2b: out_r[11] = 1'b1;
          6'h2c: out_r[11] = 1'b1;
          6'h2e: out_r[11] = 1'b1;
          6'h2f: out_r[11] = 1'b1;
          6'h30: out_r[11] = 1'b1;
          6'h31: out_r[11] = 1'b1;
          6'h37: out_r[11] = 1'b1;
          6'h39: out_r[11] = 1'b1;
          6'h3c: out_r[11] = 1'b1;
          6'h3e: out_r[11] = 1'b1;
          default: begin end
        endcase
      end
      6'h25: begin
        out_r = 12'h811;
        case (inner)
          6'h03: out_r[0] = 1'b0;
          6'h09: out_r[0] = 1'b0;
          6'h0b: out_r[0] = 1'b0;
          6'h0e: out_r[0] = 1'b0;
          6'h13: out_r[0] = 1'b0;
          6'h16: out_r[0] = 1'b0;
          6'h1b: out_r[0] = 1'b0;
          6'h1d: out_r[0] = 1'b0;
          6'h1e: out_r[0] = 1'b0;
          6'h1f: out_r[0] = 1'b0;
          6'h24: out_r[0] = 1'b0;
          6'h25: out_r[0] = 1'b0;
          6'h27: out_r[0] = 1'b0;
          6'h2d: out_r[0] = 1'b0;
          6'h2e: out_r[0] = 1'b0;
          6'h2f: out_r[0] = 1'b0;
          6'h34: out_r[0] = 1'b0;
          6'h35: out_r[0] = 1'b0;
          6'h37: out_r[0] = 1'b0;
          6'h3c: out_r[0] = 1'b0;
          6'h3e: out_r[0] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h01: out_r[1] = 1'b1;
          6'h02: out_r[1] = 1'b1;
          6'h09: out_r[1] = 1'b1;
          6'h0a: out_r[1] = 1'b1;
          6'h0c: out_r[1] = 1'b1;
          6'h0e: out_r[1] = 1'b1;
          6'h11: out_r[1] = 1'b1;
          6'h12: out_r[1] = 1'b1;
          6'h19: out_r[1] = 1'b1;
          6'h1a: out_r[1] = 1'b1;
          6'h1c: out_r[1] = 1'b1;
          6'h1d: out_r[1] = 1'b1;
          6'h1e: out_r[1] = 1'b1;
          6'h1f: out_r[1] = 1'b1;
          6'h21: out_r[1] = 1'b1;
          6'h22: out_r[1] = 1'b1;
          6'h24: out_r[1] = 1'b1;
          6'h25: out_r[1] = 1'b1;
          6'h27: out_r[1] = 1'b1;
          6'h2a: out_r[1] = 1'b1;
          6'h2d: out_r[1] = 1'b1;
          6'h2e: out_r[1] = 1'b1;
          6'h2f: out_r[1] = 1'b1;
          6'h31: out_r[1] = 1'b1;
          6'h32: out_r[1] = 1'b1;
          6'h34: out_r[1] = 1'b1;
          6'h35: out_r[1] = 1'b1;
          6'h37: out_r[1] = 1'b1;
          6'h3a: out_r[1] = 1'b1;
          6'h3c: out_r[1] = 1'b1;
          6'h3d: out_r[1] = 1'b1;
          6'h3f: out_r[1] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h02: out_r[2] = 1'b1;
          6'h03: out_r[2] = 1'b1;
          6'h09: out_r[2] = 1'b1;
          6'h0a: out_r[2] = 1'b1;
          6'h0b: out_r[2] = 1'b1;
          6'h0c: out_r[2] = 1'b1;
          6'h0e: out_r[2] = 1'b1;
          6'h12: out_r[2] = 1'b1;
          6'h13: out_r[2] = 1'b1;
          6'h1a: out_r[2] = 1'b1;
          6'h1b: out_r[2] = 1'b1;
          6'h1c: out_r[2] = 1'b1;
          6'h1d: out_r[2] = 1'b1;
          6'h1e: out_r[2] = 1'b1;
          6'h1f: out_r[2] = 1'b1;
          6'h22: out_r[2] = 1'b1;
          6'h24: out_r[2] = 1'b1;
          6'h25: out_r[2] = 1'b1;
          6'h27: out_r[2] = 1'b1;
          6'h2a: out_r[2] = 1'b1;
          6'h2c: out_r[2] = 1'b1;
          6'h2d: out_r[2] = 1'b1;
          6'h2e: out_r[2] = 1'b1;
          6'h2f: out_r[2] = 1'b1;
          6'h32: out_r[2] = 1'b1;
          6'h34: out_r[2] = 1'b1;
          6'h35: out_r[2] = 1'b1;
          6'h37: out_r[2] = 1'b1;
          6'h3a: out_r[2] = 1'b1;
          6'h3c: out_r[2] = 1'b1;
          6'h3d: out_r[2] = 1'b1;
          6'h3f: out_r[2] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h09: out_r[3] = 1'b1;
          6'h0a: out_r[3] = 1'b1;
          6'h0e: out_r[3] = 1'b1;
          6'h1d: out_r[3] = 1'b1;
          6'h1e: out_r[3] = 1'b1;
          6'h1f: out_r[3] = 1'b1;
          6'h24: out_r[3] = 1'b1;
          6'h25: out_r[3] = 1'b1;
          6'h27: out_r[3] = 1'b1;
          6'h2b: out_r[3] = 1'b1;
          6'h2e: out_r[3] = 1'b1;
          6'h34: out_r[3] = 1'b1;
          6'h35: out_r[3] = 1'b1;
          6'h37: out_r[3] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[4] = 1'b0;
          6'h06: out_r[4] = 1'b0;
          6'h0a: out_r[4] = 1'b0;
          6'h0e: out_r[4] = 1'b0;
          6'h12: out_r[4] = 1'b0;
          6'h18: out_r[4] = 1'b0;
          6'h19: out_r[4] = 1'b0;
          6'h1b: out_r[4] = 1'b0;
          6'h1d: out_r[4] = 1'b0;
          6'h1e: out_r[4] = 1'b0;
          6'h1f: out_r[4] = 1'b0;
          6'h25: out_r[4] = 1'b0;
          6'h27: out_r[4] = 1'b0;
          6'h29: out_r[4] = 1'b0;
          6'h2b: out_r[4] = 1'b0;
          6'h2c: out_r[4] = 1'b0;
          6'h2e: out_r[4] = 1'b0;
          6'h35: out_r[4] = 1'b0;
          6'h37: out_r[4] = 1'b0;
          6'h39: out_r[4] = 1'b0;
          6'h3b: out_r[4] = 1'b0;
          6'h3e: out_r[4] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[5] = 1'b1;
          6'h05: out_r[5] = 1'b1;
          6'h06: out_r[5] = 1'b1;
          6'h07: out_r[5] = 1'b1;
          6'h09: out_r[5] = 1'b1;
          6'h0a: out_r[5] = 1'b1;
          6'h0d: out_r[5] = 1'b1;
          6'h0f: out_r[5] = 1'b1;
          6'h12: out_r[5] = 1'b1;
          6'h15: out_r[5] = 1'b1;
          6'h17: out_r[5] = 1'b1;
          6'h18: out_r[5] = 1'b1;
          6'h19: out_r[5] = 1'b1;
          6'h1b: out_r[5] = 1'b1;
          6'h1d: out_r[5] = 1'b1;
          6'h1e: out_r[5] = 1'b1;
          6'h1f: out_r[5] = 1'b1;
          6'h23: out_r[5] = 1'b1;
          6'h25: out_r[5] = 1'b1;
          6'h26: out_r[5] = 1'b1;
          6'h27: out_r[5] = 1'b1;
          6'h29: out_r[5] = 1'b1;
          6'h2b: out_r[5] = 1'b1;
          6'h2c: out_r[5] = 1'b1;
          6'h33: out_r[5] = 1'b1;
          6'h35: out_r[5] = 1'b1;
          6'h36: out_r[5] = 1'b1;
          6'h37: out_r[5] = 1'b1;
          6'h39: out_r[5] = 1'b1;
          6'h3b: out_r[5] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[6] = 1'b1;
          6'h06: out_r[6] = 1'b1;
          6'h09: out_r[6] = 1'b1;
          6'h0a: out_r[6] = 1'b1;
          6'h0c: out_r[6] = 1'b1;
          6'h12: out_r[6] = 1'b1;
          6'h18: out_r[6] = 1'b1;
          6'h19: out_r[6] = 1'b1;
          6'h1b: out_r[6] = 1'b1;
          6'h1d: out_r[6] = 1'b1;
          6'h1e: out_r[6] = 1'b1;
          6'h1f: out_r[6] = 1'b1;
          6'h23: out_r[6] = 1'b1;
          6'h25: out_r[6] = 1'b1;
          6'h27: out_r[6] = 1'b1;
          6'h29: out_r[6] = 1'b1;
          6'h2b: out_r[6] = 1'b1;
          6'h2c: out_r[6] = 1'b1;
          6'h33: out_r[6] = 1'b1;
          6'h35: out_r[6] = 1'b1;
          6'h37: out_r[6] = 1'b1;
          6'h39: out_r[6] = 1'b1;
          6'h3b: out_r[6] = 1'b1;
          6'h3e: out_r[6] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[7] = 1'b1;
          6'h06: out_r[7] = 1'b1;
          6'h0b: out_r[7] = 1'b1;
          6'h0d: out_r[7] = 1'b1;
          6'h0e: out_r[7] = 1'b1;
          6'h0f: out_r[7] = 1'b1;
          6'h11: out_r[7] = 1'b1;
          6'h13: out_r[7] = 1'b1;
          6'h15: out_r[7] = 1'b1;
          6'h17: out_r[7] = 1'b1;
          6'h18: out_r[7] = 1'b1;
          6'h19: out_r[7] = 1'b1;
          6'h1b: out_r[7] = 1'b1;
          6'h1d: out_r[7] = 1'b1;
          6'h1f: out_r[7] = 1'b1;
          6'h22: out_r[7] = 1'b1;
          6'h25: out_r[7] = 1'b1;
          6'h26: out_r[7] = 1'b1;
          6'h27: out_r[7] = 1'b1;
          6'h28: out_r[7] = 1'b1;
          6'h2c: out_r[7] = 1'b1;
          6'h2e: out_r[7] = 1'b1;
          6'h32: out_r[7] = 1'b1;
          6'h35: out_r[7] = 1'b1;
          6'h36: out_r[7] = 1'b1;
          6'h37: out_r[7] = 1'b1;
          6'h38: out_r[7] = 1'b1;
          6'h3b: out_r[7] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[8] = 1'b1;
          6'h01: out_r[8] = 1'b1;
          6'h02: out_r[8] = 1'b1;
          6'h08: out_r[8] = 1'b1;
          6'h09: out_r[8] = 1'b1;
          6'h0a: out_r[8] = 1'b1;
          6'h0c: out_r[8] = 1'b1;
          6'h10: out_r[8] = 1'b1;
          6'h12: out_r[8] = 1'b1;
          6'h14: out_r[8] = 1'b1;
          6'h16: out_r[8] = 1'b1;
          6'h18: out_r[8] = 1'b1;
          6'h1a: out_r[8] = 1'b1;
          6'h1c: out_r[8] = 1'b1;
          6'h1e: out_r[8] = 1'b1;
          6'h21: out_r[8] = 1'b1;
          6'h23: out_r[8] = 1'b1;
          6'h26: out_r[8] = 1'b1;
          6'h2b: out_r[8] = 1'b1;
          6'h2d: out_r[8] = 1'b1;
          6'h2f: out_r[8] = 1'b1;
          6'h31: out_r[8] = 1'b1;
          6'h33: out_r[8] = 1'b1;
          6'h36: out_r[8] = 1'b1;
          6'h3a: out_r[8] = 1'b1;
          6'h3c: out_r[8] = 1'b1;
          6'h3d: out_r[8] = 1'b1;
          6'h3e: out_r[8] = 1'b1;
          6'h3f: out_r[8] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[9] = 1'b1;
          6'h03: out_r[9] = 1'b1;
          6'h05: out_r[9] = 1'b1;
          6'h07: out_r[9] = 1'b1;
          6'h08: out_r[9] = 1'b1;
          6'h0b: out_r[9] = 1'b1;
          6'h0c: out_r[9] = 1'b1;
          6'h0d: out_r[9] = 1'b1;
          6'h0f: out_r[9] = 1'b1;
          6'h14: out_r[9] = 1'b1;
          6'h29: out_r[9] = 1'b1;
          6'h2b: out_r[9] = 1'b1;
          6'h2c: out_r[9] = 1'b1;
          6'h2e: out_r[9] = 1'b1;
          6'h39: out_r[9] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[10] = 1'b1;
          6'h04: out_r[10] = 1'b1;
          6'h06: out_r[10] = 1'b1;
          6'h08: out_r[10] = 1'b1;
          6'h0e: out_r[10] = 1'b1;
          6'h10: out_r[10] = 1'b1;
          6'h16: out_r[10] = 1'b1;
          6'h18: out_r[10] = 1'b1;
          6'h1e: out_r[10] = 1'b1;
          6'h20: out_r[10] = 1'b1;
          6'h23: out_r[10] = 1'b1;
          6'h24: out_r[10] = 1'b1;
          6'h26: out_r[10] = 1'b1;
          6'h28: out_r[10] = 1'b1;
          6'h2d: out_r[10] = 1'b1;
          6'h2f: out_r[10] = 1'b1;
          6'h30: out_r[10] = 1'b1;
          6'h33: out_r[10] = 1'b1;
          6'h34: out_r[10] = 1'b1;
          6'h36: out_r[10] = 1'b1;
          6'h38: out_r[10] = 1'b1;
          6'h3c: out_r[10] = 1'b1;
          6'h3e: out_r[10] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h03: out_r[11] = 1'b0;
          6'h05: out_r[11] = 1'b0;
          6'h07: out_r[11] = 1'b0;
          6'h0b: out_r[11] = 1'b0;
          6'h0d: out_r[11] = 1'b0;
          6'h0f: out_r[11] = 1'b0;
          6'h13: out_r[11] = 1'b0;
          6'h15: out_r[11] = 1'b0;
          6'h16: out_r[11] = 1'b0;
          6'h17: out_r[11] = 1'b0;
          6'h1b: out_r[11] = 1'b0;
          6'h1d: out_r[11] = 1'b0;
          6'h1e: out_r[11] = 1'b0;
          6'h1f: out_r[11] = 1'b0;
          6'h2d: out_r[11] = 1'b0;
          6'h2f: out_r[11] = 1'b0;
          6'h3b: out_r[11] = 1'b0;
          6'h3c: out_r[11] = 1'b0;
          6'h3e: out_r[11] = 1'b0;
          default: begin end
        endcase
      end
      6'h26: begin
        out_r = 12'h51c;
        case (inner)
          6'h00: out_r[0] = 1'b1;
          6'h01: out_r[0] = 1'b1;
          6'h04: out_r[0] = 1'b1;
          6'h08: out_r[0] = 1'b1;
          6'h09: out_r[0] = 1'b1;
          6'h0c: out_r[0] = 1'b1;
          6'h0e: out_r[0] = 1'b1;
          6'h0f: out_r[0] = 1'b1;
          6'h12: out_r[0] = 1'b1;
          6'h13: out_r[0] = 1'b1;
          6'h14: out_r[0] = 1'b1;
          6'h15: out_r[0] = 1'b1;
          6'h16: out_r[0] = 1'b1;
          6'h18: out_r[0] = 1'b1;
          6'h1c: out_r[0] = 1'b1;
          6'h1e: out_r[0] = 1'b1;
          6'h20: out_r[0] = 1'b1;
          6'h21: out_r[0] = 1'b1;
          6'h24: out_r[0] = 1'b1;
          6'h25: out_r[0] = 1'b1;
          6'h26: out_r[0] = 1'b1;
          6'h27: out_r[0] = 1'b1;
          6'h30: out_r[0] = 1'b1;
          6'h31: out_r[0] = 1'b1;
          6'h34: out_r[0] = 1'b1;
          6'h35: out_r[0] = 1'b1;
          6'h36: out_r[0] = 1'b1;
          6'h37: out_r[0] = 1'b1;
          6'h38: out_r[0] = 1'b1;
          6'h3d: out_r[0] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[1] = 1'b1;
          6'h06: out_r[1] = 1'b1;
          6'h07: out_r[1] = 1'b1;
          6'h08: out_r[1] = 1'b1;
          6'h11: out_r[1] = 1'b1;
          6'h14: out_r[1] = 1'b1;
          6'h16: out_r[1] = 1'b1;
          6'h1b: out_r[1] = 1'b1;
          6'h25: out_r[1] = 1'b1;
          6'h2a: out_r[1] = 1'b1;
          6'h2b: out_r[1] = 1'b1;
          6'h2e: out_r[1] = 1'b1;
          6'h2f: out_r[1] = 1'b1;
          6'h35: out_r[1] = 1'b1;
          6'h39: out_r[1] = 1'b1;
          6'h3c: out_r[1] = 1'b1;
          6'h3d: out_r[1] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h04: out_r[2] = 1'b0;
          6'h05: out_r[2] = 1'b0;
          6'h06: out_r[2] = 1'b0;
          6'h07: out_r[2] = 1'b0;
          6'h0d: out_r[2] = 1'b0;
          6'h10: out_r[2] = 1'b0;
          6'h11: out_r[2] = 1'b0;
          6'h12: out_r[2] = 1'b0;
          6'h13: out_r[2] = 1'b0;
          6'h14: out_r[2] = 1'b0;
          6'h15: out_r[2] = 1'b0;
          6'h17: out_r[2] = 1'b0;
          6'h19: out_r[2] = 1'b0;
          6'h1b: out_r[2] = 1'b0;
          6'h1d: out_r[2] = 1'b0;
          6'h28: out_r[2] = 1'b0;
          6'h29: out_r[2] = 1'b0;
          6'h2a: out_r[2] = 1'b0;
          6'h2b: out_r[2] = 1'b0;
          6'h2c: out_r[2] = 1'b0;
          6'h2e: out_r[2] = 1'b0;
          6'h2f: out_r[2] = 1'b0;
          6'h38: out_r[2] = 1'b0;
          6'h39: out_r[2] = 1'b0;
          6'h3a: out_r[2] = 1'b0;
          6'h3b: out_r[2] = 1'b0;
          6'h3c: out_r[2] = 1'b0;
          6'h3e: out_r[2] = 1'b0;
          6'h3f: out_r[2] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h0c: out_r[3] = 1'b0;
          6'h0e: out_r[3] = 1'b0;
          6'h0f: out_r[3] = 1'b0;
          6'h17: out_r[3] = 1'b0;
          6'h18: out_r[3] = 1'b0;
          6'h1a: out_r[3] = 1'b0;
          6'h1c: out_r[3] = 1'b0;
          6'h1d: out_r[3] = 1'b0;
          6'h1e: out_r[3] = 1'b0;
          6'h21: out_r[3] = 1'b0;
          6'h24: out_r[3] = 1'b0;
          6'h26: out_r[3] = 1'b0;
          6'h27: out_r[3] = 1'b0;
          6'h31: out_r[3] = 1'b0;
          6'h34: out_r[3] = 1'b0;
          6'h36: out_r[3] = 1'b0;
          6'h37: out_r[3] = 1'b0;
          6'h39: out_r[3] = 1'b0;
          6'h3a: out_r[3] = 1'b0;
          6'h3b: out_r[3] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h04: out_r[4] = 1'b0;
          6'h06: out_r[4] = 1'b0;
          6'h07: out_r[4] = 1'b0;
          6'h0c: out_r[4] = 1'b0;
          6'h0e: out_r[4] = 1'b0;
          6'h0f: out_r[4] = 1'b0;
          6'h18: out_r[4] = 1'b0;
          6'h1a: out_r[4] = 1'b0;
          6'h1c: out_r[4] = 1'b0;
          6'h1e: out_r[4] = 1'b0;
          6'h21: out_r[4] = 1'b0;
          6'h26: out_r[4] = 1'b0;
          6'h27: out_r[4] = 1'b0;
          6'h31: out_r[4] = 1'b0;
          6'h36: out_r[4] = 1'b0;
          6'h37: out_r[4] = 1'b0;
          6'h39: out_r[4] = 1'b0;
          6'h3a: out_r[4] = 1'b0;
          6'h3b: out_r[4] = 1'b0;
          6'h3c: out_r[4] = 1'b0;
          6'h3d: out_r[4] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h04: out_r[5] = 1'b1;
          6'h05: out_r[5] = 1'b1;
          6'h06: out_r[5] = 1'b1;
          6'h07: out_r[5] = 1'b1;
          6'h0d: out_r[5] = 1'b1;
          6'h10: out_r[5] = 1'b1;
          6'h12: out_r[5] = 1'b1;
          6'h13: out_r[5] = 1'b1;
          6'h15: out_r[5] = 1'b1;
          6'h19: out_r[5] = 1'b1;
          6'h1a: out_r[5] = 1'b1;
          6'h1c: out_r[5] = 1'b1;
          6'h1e: out_r[5] = 1'b1;
          6'h21: out_r[5] = 1'b1;
          6'h29: out_r[5] = 1'b1;
          6'h31: out_r[5] = 1'b1;
          6'h38: out_r[5] = 1'b1;
          6'h3a: out_r[5] = 1'b1;
          6'h3b: out_r[5] = 1'b1;
          6'h3c: out_r[5] = 1'b1;
          6'h3d: out_r[5] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h04: out_r[6] = 1'b1;
          6'h06: out_r[6] = 1'b1;
          6'h07: out_r[6] = 1'b1;
          6'h10: out_r[6] = 1'b1;
          6'h12: out_r[6] = 1'b1;
          6'h13: out_r[6] = 1'b1;
          6'h15: out_r[6] = 1'b1;
          6'h19: out_r[6] = 1'b1;
          6'h1a: out_r[6] = 1'b1;
          6'h1c: out_r[6] = 1'b1;
          6'h1e: out_r[6] = 1'b1;
          6'h21: out_r[6] = 1'b1;
          6'h25: out_r[6] = 1'b1;
          6'h26: out_r[6] = 1'b1;
          6'h27: out_r[6] = 1'b1;
          6'h29: out_r[6] = 1'b1;
          6'h2c: out_r[6] = 1'b1;
          6'h2e: out_r[6] = 1'b1;
          6'h2f: out_r[6] = 1'b1;
          6'h31: out_r[6] = 1'b1;
          6'h35: out_r[6] = 1'b1;
          6'h36: out_r[6] = 1'b1;
          6'h37: out_r[6] = 1'b1;
          6'h38: out_r[6] = 1'b1;
          6'h3a: out_r[6] = 1'b1;
          6'h3b: out_r[6] = 1'b1;
          6'h3c: out_r[6] = 1'b1;
          6'h3d: out_r[6] = 1'b1;
          6'h3e: out_r[6] = 1'b1;
          6'h3f: out_r[6] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h04: out_r[7] = 1'b1;
          6'h06: out_r[7] = 1'b1;
          6'h07: out_r[7] = 1'b1;
          6'h08: out_r[7] = 1'b1;
          6'h09: out_r[7] = 1'b1;
          6'h0a: out_r[7] = 1'b1;
          6'h0b: out_r[7] = 1'b1;
          6'h0c: out_r[7] = 1'b1;
          6'h0d: out_r[7] = 1'b1;
          6'h0e: out_r[7] = 1'b1;
          6'h0f: out_r[7] = 1'b1;
          6'h22: out_r[7] = 1'b1;
          6'h23: out_r[7] = 1'b1;
          6'h26: out_r[7] = 1'b1;
          6'h27: out_r[7] = 1'b1;
          6'h32: out_r[7] = 1'b1;
          6'h33: out_r[7] = 1'b1;
          6'h36: out_r[7] = 1'b1;
          6'h37: out_r[7] = 1'b1;
          6'h3a: out_r[7] = 1'b1;
          6'h3b: out_r[7] = 1'b1;
          6'h3c: out_r[7] = 1'b1;
          6'h3d: out_r[7] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[8] = 1'b0;
          6'h01: out_r[8] = 1'b0;
          6'h02: out_r[8] = 1'b0;
          6'h03: out_r[8] = 1'b0;
          6'h04: out_r[8] = 1'b0;
          6'h05: out_r[8] = 1'b0;
          6'h06: out_r[8] = 1'b0;
          6'h07: out_r[8] = 1'b0;
          6'h08: out_r[8] = 1'b0;
          6'h09: out_r[8] = 1'b0;
          6'h0a: out_r[8] = 1'b0;
          6'h0b: out_r[8] = 1'b0;
          6'h0c: out_r[8] = 1'b0;
          6'h0d: out_r[8] = 1'b0;
          6'h0e: out_r[8] = 1'b0;
          6'h0f: out_r[8] = 1'b0;
          6'h18: out_r[8] = 1'b0;
          6'h22: out_r[8] = 1'b0;
          6'h23: out_r[8] = 1'b0;
          6'h2a: out_r[8] = 1'b0;
          6'h2b: out_r[8] = 1'b0;
          6'h32: out_r[8] = 1'b0;
          6'h33: out_r[8] = 1'b0;
          6'h3a: out_r[8] = 1'b0;
          6'h3b: out_r[8] = 1'b0;
          6'h3c: out_r[8] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h06: out_r[9] = 1'b1;
          6'h07: out_r[9] = 1'b1;
          6'h0e: out_r[9] = 1'b1;
          6'h0f: out_r[9] = 1'b1;
          6'h16: out_r[9] = 1'b1;
          6'h1c: out_r[9] = 1'b1;
          6'h21: out_r[9] = 1'b1;
          6'h24: out_r[9] = 1'b1;
          6'h25: out_r[9] = 1'b1;
          6'h26: out_r[9] = 1'b1;
          6'h27: out_r[9] = 1'b1;
          6'h2c: out_r[9] = 1'b1;
          6'h2d: out_r[9] = 1'b1;
          6'h2e: out_r[9] = 1'b1;
          6'h2f: out_r[9] = 1'b1;
          6'h31: out_r[9] = 1'b1;
          6'h34: out_r[9] = 1'b1;
          6'h35: out_r[9] = 1'b1;
          6'h36: out_r[9] = 1'b1;
          6'h37: out_r[9] = 1'b1;
          6'h3d: out_r[9] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[10] = 1'b0;
          6'h06: out_r[10] = 1'b0;
          6'h07: out_r[10] = 1'b0;
          6'h08: out_r[10] = 1'b0;
          6'h0e: out_r[10] = 1'b0;
          6'h0f: out_r[10] = 1'b0;
          6'h16: out_r[10] = 1'b0;
          6'h18: out_r[10] = 1'b0;
          6'h1c: out_r[10] = 1'b0;
          6'h1e: out_r[10] = 1'b0;
          6'h21: out_r[10] = 1'b0;
          6'h25: out_r[10] = 1'b0;
          6'h26: out_r[10] = 1'b0;
          6'h27: out_r[10] = 1'b0;
          6'h31: out_r[10] = 1'b0;
          6'h35: out_r[10] = 1'b0;
          6'h36: out_r[10] = 1'b0;
          6'h37: out_r[10] = 1'b0;
          6'h3c: out_r[10] = 1'b0;
          6'h3d: out_r[10] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[11] = 1'b1;
          6'h04: out_r[11] = 1'b1;
          6'h06: out_r[11] = 1'b1;
          6'h07: out_r[11] = 1'b1;
          6'h08: out_r[11] = 1'b1;
          6'h0c: out_r[11] = 1'b1;
          6'h0e: out_r[11] = 1'b1;
          6'h0f: out_r[11] = 1'b1;
          6'h14: out_r[11] = 1'b1;
          6'h15: out_r[11] = 1'b1;
          6'h18: out_r[11] = 1'b1;
          6'h1c: out_r[11] = 1'b1;
          6'h1e: out_r[11] = 1'b1;
          6'h21: out_r[11] = 1'b1;
          6'h24: out_r[11] = 1'b1;
          6'h25: out_r[11] = 1'b1;
          6'h26: out_r[11] = 1'b1;
          6'h27: out_r[11] = 1'b1;
          6'h2e: out_r[11] = 1'b1;
          6'h2f: out_r[11] = 1'b1;
          6'h31: out_r[11] = 1'b1;
          6'h34: out_r[11] = 1'b1;
          6'h35: out_r[11] = 1'b1;
          6'h36: out_r[11] = 1'b1;
          6'h37: out_r[11] = 1'b1;
          6'h38: out_r[11] = 1'b1;
          6'h3d: out_r[11] = 1'b1;
          default: begin end
        endcase
      end
      6'h27: begin
        out_r = 12'hb1e;
        case (inner)
          6'h00: out_r[0] = 1'b1;
          6'h04: out_r[0] = 1'b1;
          6'h06: out_r[0] = 1'b1;
          6'h0a: out_r[0] = 1'b1;
          6'h0c: out_r[0] = 1'b1;
          6'h0e: out_r[0] = 1'b1;
          6'h10: out_r[0] = 1'b1;
          6'h12: out_r[0] = 1'b1;
          6'h16: out_r[0] = 1'b1;
          6'h1a: out_r[0] = 1'b1;
          6'h1c: out_r[0] = 1'b1;
          6'h1d: out_r[0] = 1'b1;
          6'h1e: out_r[0] = 1'b1;
          6'h24: out_r[0] = 1'b1;
          6'h26: out_r[0] = 1'b1;
          6'h2a: out_r[0] = 1'b1;
          6'h2c: out_r[0] = 1'b1;
          6'h2e: out_r[0] = 1'b1;
          6'h34: out_r[0] = 1'b1;
          6'h36: out_r[0] = 1'b1;
          6'h38: out_r[0] = 1'b1;
          6'h39: out_r[0] = 1'b1;
          6'h3b: out_r[0] = 1'b1;
          6'h3c: out_r[0] = 1'b1;
          6'h3d: out_r[0] = 1'b1;
          6'h3e: out_r[0] = 1'b1;
          6'h3f: out_r[0] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[1] = 1'b0;
          6'h07: out_r[1] = 1'b0;
          6'h0a: out_r[1] = 1'b0;
          6'h0c: out_r[1] = 1'b0;
          6'h0f: out_r[1] = 1'b0;
          6'h10: out_r[1] = 1'b0;
          6'h12: out_r[1] = 1'b0;
          6'h16: out_r[1] = 1'b0;
          6'h17: out_r[1] = 1'b0;
          6'h1a: out_r[1] = 1'b0;
          6'h1c: out_r[1] = 1'b0;
          6'h1d: out_r[1] = 1'b0;
          6'h1e: out_r[1] = 1'b0;
          6'h24: out_r[1] = 1'b0;
          6'h27: out_r[1] = 1'b0;
          6'h2f: out_r[1] = 1'b0;
          6'h34: out_r[1] = 1'b0;
          6'h37: out_r[1] = 1'b0;
          6'h38: out_r[1] = 1'b0;
          6'h39: out_r[1] = 1'b0;
          6'h3b: out_r[1] = 1'b0;
          6'h3c: out_r[1] = 1'b0;
          6'h3d: out_r[1] = 1'b0;
          6'h3f: out_r[1] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[2] = 1'b0;
          6'h06: out_r[2] = 1'b0;
          6'h0a: out_r[2] = 1'b0;
          6'h0c: out_r[2] = 1'b0;
          6'h0d: out_r[2] = 1'b0;
          6'h0e: out_r[2] = 1'b0;
          6'h10: out_r[2] = 1'b0;
          6'h12: out_r[2] = 1'b0;
          6'h15: out_r[2] = 1'b0;
          6'h16: out_r[2] = 1'b0;
          6'h17: out_r[2] = 1'b0;
          6'h1a: out_r[2] = 1'b0;
          6'h1c: out_r[2] = 1'b0;
          6'h1d: out_r[2] = 1'b0;
          6'h1e: out_r[2] = 1'b0;
          6'h25: out_r[2] = 1'b0;
          6'h26: out_r[2] = 1'b0;
          6'h27: out_r[2] = 1'b0;
          6'h2c: out_r[2] = 1'b0;
          6'h2d: out_r[2] = 1'b0;
          6'h2f: out_r[2] = 1'b0;
          6'h35: out_r[2] = 1'b0;
          6'h36: out_r[2] = 1'b0;
          6'h37: out_r[2] = 1'b0;
          6'h38: out_r[2] = 1'b0;
          6'h39: out_r[2] = 1'b0;
          6'h3b: out_r[2] = 1'b0;
          6'h3c: out_r[2] = 1'b0;
          6'h3d: out_r[2] = 1'b0;
          6'h3e: out_r[2] = 1'b0;
          6'h3f: out_r[2] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h04: out_r[3] = 1'b0;
          6'h07: out_r[3] = 1'b0;
          6'h0c: out_r[3] = 1'b0;
          6'h10: out_r[3] = 1'b0;
          6'h16: out_r[3] = 1'b0;
          6'h1c: out_r[3] = 1'b0;
          6'h1d: out_r[3] = 1'b0;
          6'h1e: out_r[3] = 1'b0;
          6'h24: out_r[3] = 1'b0;
          6'h2a: out_r[3] = 1'b0;
          6'h2e: out_r[3] = 1'b0;
          6'h34: out_r[3] = 1'b0;
          6'h3a: out_r[3] = 1'b0;
          6'h3c: out_r[3] = 1'b0;
          6'h3d: out_r[3] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h02: out_r[4] = 1'b0;
          6'h04: out_r[4] = 1'b0;
          6'h07: out_r[4] = 1'b0;
          6'h10: out_r[4] = 1'b0;
          6'h11: out_r[4] = 1'b0;
          6'h13: out_r[4] = 1'b0;
          6'h16: out_r[4] = 1'b0;
          6'h1a: out_r[4] = 1'b0;
          6'h1e: out_r[4] = 1'b0;
          6'h1f: out_r[4] = 1'b0;
          6'h24: out_r[4] = 1'b0;
          6'h2a: out_r[4] = 1'b0;
          6'h2e: out_r[4] = 1'b0;
          6'h34: out_r[4] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h02: out_r[5] = 1'b1;
          6'h06: out_r[5] = 1'b1;
          6'h0c: out_r[5] = 1'b1;
          6'h0e: out_r[5] = 1'b1;
          6'h10: out_r[5] = 1'b1;
          6'h11: out_r[5] = 1'b1;
          6'h13: out_r[5] = 1'b1;
          6'h1a: out_r[5] = 1'b1;
          6'h1e: out_r[5] = 1'b1;
          6'h1f: out_r[5] = 1'b1;
          6'h24: out_r[5] = 1'b1;
          6'h25: out_r[5] = 1'b1;
          6'h26: out_r[5] = 1'b1;
          6'h27: out_r[5] = 1'b1;
          6'h2c: out_r[5] = 1'b1;
          6'h2d: out_r[5] = 1'b1;
          6'h2f: out_r[5] = 1'b1;
          6'h34: out_r[5] = 1'b1;
          6'h35: out_r[5] = 1'b1;
          6'h36: out_r[5] = 1'b1;
          6'h37: out_r[5] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[6] = 1'b1;
          6'h02: out_r[6] = 1'b1;
          6'h04: out_r[6] = 1'b1;
          6'h05: out_r[6] = 1'b1;
          6'h07: out_r[6] = 1'b1;
          6'h0a: out_r[6] = 1'b1;
          6'h0c: out_r[6] = 1'b1;
          6'h10: out_r[6] = 1'b1;
          6'h11: out_r[6] = 1'b1;
          6'h13: out_r[6] = 1'b1;
          6'h16: out_r[6] = 1'b1;
          6'h1a: out_r[6] = 1'b1;
          6'h1d: out_r[6] = 1'b1;
          6'h1e: out_r[6] = 1'b1;
          6'h1f: out_r[6] = 1'b1;
          6'h24: out_r[6] = 1'b1;
          6'h2c: out_r[6] = 1'b1;
          6'h2e: out_r[6] = 1'b1;
          6'h34: out_r[6] = 1'b1;
          6'h38: out_r[6] = 1'b1;
          6'h3a: out_r[6] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h02: out_r[7] = 1'b1;
          6'h07: out_r[7] = 1'b1;
          6'h0e: out_r[7] = 1'b1;
          6'h10: out_r[7] = 1'b1;
          6'h11: out_r[7] = 1'b1;
          6'h12: out_r[7] = 1'b1;
          6'h13: out_r[7] = 1'b1;
          6'h16: out_r[7] = 1'b1;
          6'h1a: out_r[7] = 1'b1;
          6'h1c: out_r[7] = 1'b1;
          6'h1e: out_r[7] = 1'b1;
          6'h1f: out_r[7] = 1'b1;
          6'h22: out_r[7] = 1'b1;
          6'h29: out_r[7] = 1'b1;
          6'h2b: out_r[7] = 1'b1;
          6'h2d: out_r[7] = 1'b1;
          6'h2f: out_r[7] = 1'b1;
          6'h32: out_r[7] = 1'b1;
          6'h39: out_r[7] = 1'b1;
          6'h3b: out_r[7] = 1'b1;
          6'h3c: out_r[7] = 1'b1;
          6'h3d: out_r[7] = 1'b1;
          6'h3f: out_r[7] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h01: out_r[8] = 1'b0;
          6'h03: out_r[8] = 1'b0;
          6'h05: out_r[8] = 1'b0;
          6'h06: out_r[8] = 1'b0;
          6'h0e: out_r[8] = 1'b0;
          6'h12: out_r[8] = 1'b0;
          6'h14: out_r[8] = 1'b0;
          6'h16: out_r[8] = 1'b0;
          6'h1a: out_r[8] = 1'b0;
          6'h1c: out_r[8] = 1'b0;
          6'h1e: out_r[8] = 1'b0;
          6'h21: out_r[8] = 1'b0;
          6'h22: out_r[8] = 1'b0;
          6'h23: out_r[8] = 1'b0;
          6'h25: out_r[8] = 1'b0;
          6'h27: out_r[8] = 1'b0;
          6'h29: out_r[8] = 1'b0;
          6'h2b: out_r[8] = 1'b0;
          6'h2c: out_r[8] = 1'b0;
          6'h2d: out_r[8] = 1'b0;
          6'h2f: out_r[8] = 1'b0;
          6'h31: out_r[8] = 1'b0;
          6'h32: out_r[8] = 1'b0;
          6'h33: out_r[8] = 1'b0;
          6'h35: out_r[8] = 1'b0;
          6'h37: out_r[8] = 1'b0;
          6'h39: out_r[8] = 1'b0;
          6'h3b: out_r[8] = 1'b0;
          6'h3c: out_r[8] = 1'b0;
          6'h3d: out_r[8] = 1'b0;
          6'h3f: out_r[8] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h01: out_r[9] = 1'b0;
          6'h03: out_r[9] = 1'b0;
          6'h04: out_r[9] = 1'b0;
          6'h06: out_r[9] = 1'b0;
          6'h0c: out_r[9] = 1'b0;
          6'h0d: out_r[9] = 1'b0;
          6'h0e: out_r[9] = 1'b0;
          6'h10: out_r[9] = 1'b0;
          6'h12: out_r[9] = 1'b0;
          6'h14: out_r[9] = 1'b0;
          6'h15: out_r[9] = 1'b0;
          6'h16: out_r[9] = 1'b0;
          6'h17: out_r[9] = 1'b0;
          6'h1e: out_r[9] = 1'b0;
          6'h22: out_r[9] = 1'b0;
          6'h24: out_r[9] = 1'b0;
          6'h26: out_r[9] = 1'b0;
          6'h2a: out_r[9] = 1'b0;
          6'h2e: out_r[9] = 1'b0;
          6'h32: out_r[9] = 1'b0;
          6'h34: out_r[9] = 1'b0;
          6'h36: out_r[9] = 1'b0;
          6'h3a: out_r[9] = 1'b0;
          6'h3c: out_r[9] = 1'b0;
          6'h3e: out_r[9] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h01: out_r[10] = 1'b1;
          6'h02: out_r[10] = 1'b1;
          6'h03: out_r[10] = 1'b1;
          6'h07: out_r[10] = 1'b1;
          6'h0d: out_r[10] = 1'b1;
          6'h0f: out_r[10] = 1'b1;
          6'h10: out_r[10] = 1'b1;
          6'h11: out_r[10] = 1'b1;
          6'h13: out_r[10] = 1'b1;
          6'h14: out_r[10] = 1'b1;
          6'h15: out_r[10] = 1'b1;
          6'h17: out_r[10] = 1'b1;
          6'h1d: out_r[10] = 1'b1;
          6'h1e: out_r[10] = 1'b1;
          6'h1f: out_r[10] = 1'b1;
          6'h22: out_r[10] = 1'b1;
          6'h24: out_r[10] = 1'b1;
          6'h2a: out_r[10] = 1'b1;
          6'h32: out_r[10] = 1'b1;
          6'h34: out_r[10] = 1'b1;
          6'h3a: out_r[10] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h0d: out_r[11] = 1'b0;
          6'h15: out_r[11] = 1'b0;
          6'h21: out_r[11] = 1'b0;
          6'h23: out_r[11] = 1'b0;
          6'h25: out_r[11] = 1'b0;
          6'h27: out_r[11] = 1'b0;
          6'h29: out_r[11] = 1'b0;
          6'h2b: out_r[11] = 1'b0;
          6'h2d: out_r[11] = 1'b0;
          6'h2f: out_r[11] = 1'b0;
          6'h31: out_r[11] = 1'b0;
          6'h33: out_r[11] = 1'b0;
          6'h35: out_r[11] = 1'b0;
          6'h37: out_r[11] = 1'b0;
          6'h39: out_r[11] = 1'b0;
          6'h3a: out_r[11] = 1'b0;
          6'h3b: out_r[11] = 1'b0;
          6'h3d: out_r[11] = 1'b0;
          6'h3f: out_r[11] = 1'b0;
          default: begin end
        endcase
      end
      6'h28: begin
        out_r = 12'h054;
        case (inner)
          6'h04: out_r[0] = 1'b1;
          6'h05: out_r[0] = 1'b1;
          6'h06: out_r[0] = 1'b1;
          6'h08: out_r[0] = 1'b1;
          6'h0a: out_r[0] = 1'b1;
          6'h0c: out_r[0] = 1'b1;
          6'h0e: out_r[0] = 1'b1;
          6'h11: out_r[0] = 1'b1;
          6'h13: out_r[0] = 1'b1;
          6'h14: out_r[0] = 1'b1;
          6'h17: out_r[0] = 1'b1;
          6'h1b: out_r[0] = 1'b1;
          6'h1e: out_r[0] = 1'b1;
          6'h1f: out_r[0] = 1'b1;
          6'h24: out_r[0] = 1'b1;
          6'h25: out_r[0] = 1'b1;
          6'h26: out_r[0] = 1'b1;
          6'h28: out_r[0] = 1'b1;
          6'h2a: out_r[0] = 1'b1;
          6'h2c: out_r[0] = 1'b1;
          6'h2f: out_r[0] = 1'b1;
          6'h30: out_r[0] = 1'b1;
          6'h31: out_r[0] = 1'b1;
          6'h32: out_r[0] = 1'b1;
          6'h35: out_r[0] = 1'b1;
          6'h38: out_r[0] = 1'b1;
          6'h3a: out_r[0] = 1'b1;
          6'h3c: out_r[0] = 1'b1;
          6'h3f: out_r[0] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h01: out_r[1] = 1'b1;
          6'h03: out_r[1] = 1'b1;
          6'h08: out_r[1] = 1'b1;
          6'h0a: out_r[1] = 1'b1;
          6'h0c: out_r[1] = 1'b1;
          6'h11: out_r[1] = 1'b1;
          6'h12: out_r[1] = 1'b1;
          6'h13: out_r[1] = 1'b1;
          6'h14: out_r[1] = 1'b1;
          6'h15: out_r[1] = 1'b1;
          6'h17: out_r[1] = 1'b1;
          6'h18: out_r[1] = 1'b1;
          6'h1b: out_r[1] = 1'b1;
          6'h1c: out_r[1] = 1'b1;
          6'h1e: out_r[1] = 1'b1;
          6'h21: out_r[1] = 1'b1;
          6'h23: out_r[1] = 1'b1;
          6'h25: out_r[1] = 1'b1;
          6'h2e: out_r[1] = 1'b1;
          6'h2f: out_r[1] = 1'b1;
          6'h35: out_r[1] = 1'b1;
          6'h36: out_r[1] = 1'b1;
          6'h3e: out_r[1] = 1'b1;
          6'h3f: out_r[1] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[2] = 1'b0;
          6'h01: out_r[2] = 1'b0;
          6'h02: out_r[2] = 1'b0;
          6'h03: out_r[2] = 1'b0;
          6'h08: out_r[2] = 1'b0;
          6'h09: out_r[2] = 1'b0;
          6'h0a: out_r[2] = 1'b0;
          6'h0b: out_r[2] = 1'b0;
          6'h0c: out_r[2] = 1'b0;
          6'h0d: out_r[2] = 1'b0;
          6'h12: out_r[2] = 1'b0;
          6'h13: out_r[2] = 1'b0;
          6'h1a: out_r[2] = 1'b0;
          6'h1b: out_r[2] = 1'b0;
          6'h20: out_r[2] = 1'b0;
          6'h21: out_r[2] = 1'b0;
          6'h22: out_r[2] = 1'b0;
          6'h23: out_r[2] = 1'b0;
          6'h2e: out_r[2] = 1'b0;
          6'h2f: out_r[2] = 1'b0;
          6'h36: out_r[2] = 1'b0;
          6'h37: out_r[2] = 1'b0;
          6'h3e: out_r[2] = 1'b0;
          6'h3f: out_r[2] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h02: out_r[3] = 1'b1;
          6'h03: out_r[3] = 1'b1;
          6'h0a: out_r[3] = 1'b1;
          6'h0b: out_r[3] = 1'b1;
          6'h0e: out_r[3] = 1'b1;
          6'h0f: out_r[3] = 1'b1;
          6'h10: out_r[3] = 1'b1;
          6'h11: out_r[3] = 1'b1;
          6'h12: out_r[3] = 1'b1;
          6'h13: out_r[3] = 1'b1;
          6'h16: out_r[3] = 1'b1;
          6'h17: out_r[3] = 1'b1;
          6'h1e: out_r[3] = 1'b1;
          6'h1f: out_r[3] = 1'b1;
          6'h22: out_r[3] = 1'b1;
          6'h23: out_r[3] = 1'b1;
          6'h25: out_r[3] = 1'b1;
          6'h35: out_r[3] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[4] = 1'b0;
          6'h01: out_r[4] = 1'b0;
          6'h02: out_r[4] = 1'b0;
          6'h03: out_r[4] = 1'b0;
          6'h08: out_r[4] = 1'b0;
          6'h09: out_r[4] = 1'b0;
          6'h0a: out_r[4] = 1'b0;
          6'h0b: out_r[4] = 1'b0;
          6'h0c: out_r[4] = 1'b0;
          6'h0d: out_r[4] = 1'b0;
          6'h0e: out_r[4] = 1'b0;
          6'h0f: out_r[4] = 1'b0;
          6'h20: out_r[4] = 1'b0;
          6'h21: out_r[4] = 1'b0;
          6'h22: out_r[4] = 1'b0;
          6'h23: out_r[4] = 1'b0;
          6'h35: out_r[4] = 1'b0;
          6'h36: out_r[4] = 1'b0;
          6'h37: out_r[4] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h14: out_r[5] = 1'b1;
          6'h15: out_r[5] = 1'b1;
          6'h16: out_r[5] = 1'b1;
          6'h17: out_r[5] = 1'b1;
          6'h18: out_r[5] = 1'b1;
          6'h19: out_r[5] = 1'b1;
          6'h1a: out_r[5] = 1'b1;
          6'h1b: out_r[5] = 1'b1;
          6'h1c: out_r[5] = 1'b1;
          6'h1d: out_r[5] = 1'b1;
          6'h1e: out_r[5] = 1'b1;
          6'h1f: out_r[5] = 1'b1;
          6'h34: out_r[5] = 1'b1;
          6'h35: out_r[5] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h04: out_r[6] = 1'b0;
          6'h18: out_r[6] = 1'b0;
          6'h19: out_r[6] = 1'b0;
          6'h1a: out_r[6] = 1'b0;
          6'h1b: out_r[6] = 1'b0;
          6'h1c: out_r[6] = 1'b0;
          6'h1d: out_r[6] = 1'b0;
          6'h1e: out_r[6] = 1'b0;
          6'h1f: out_r[6] = 1'b0;
          6'h26: out_r[6] = 1'b0;
          6'h29: out_r[6] = 1'b0;
          6'h2a: out_r[6] = 1'b0;
          6'h2d: out_r[6] = 1'b0;
          6'h31: out_r[6] = 1'b0;
          6'h32: out_r[6] = 1'b0;
          6'h34: out_r[6] = 1'b0;
          6'h35: out_r[6] = 1'b0;
          6'h37: out_r[6] = 1'b0;
          6'h39: out_r[6] = 1'b0;
          6'h3a: out_r[6] = 1'b0;
          6'h3d: out_r[6] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h04: out_r[7] = 1'b1;
          6'h08: out_r[7] = 1'b1;
          6'h09: out_r[7] = 1'b1;
          6'h0a: out_r[7] = 1'b1;
          6'h0b: out_r[7] = 1'b1;
          6'h0c: out_r[7] = 1'b1;
          6'h0d: out_r[7] = 1'b1;
          6'h0e: out_r[7] = 1'b1;
          6'h0f: out_r[7] = 1'b1;
          6'h10: out_r[7] = 1'b1;
          6'h11: out_r[7] = 1'b1;
          6'h12: out_r[7] = 1'b1;
          6'h13: out_r[7] = 1'b1;
          6'h14: out_r[7] = 1'b1;
          6'h15: out_r[7] = 1'b1;
          6'h16: out_r[7] = 1'b1;
          6'h17: out_r[7] = 1'b1;
          6'h26: out_r[7] = 1'b1;
          6'h29: out_r[7] = 1'b1;
          6'h2a: out_r[7] = 1'b1;
          6'h2d: out_r[7] = 1'b1;
          6'h31: out_r[7] = 1'b1;
          6'h32: out_r[7] = 1'b1;
          6'h34: out_r[7] = 1'b1;
          6'h35: out_r[7] = 1'b1;
          6'h39: out_r[7] = 1'b1;
          6'h3a: out_r[7] = 1'b1;
          6'h3d: out_r[7] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h04: out_r[8] = 1'b1;
          6'h10: out_r[8] = 1'b1;
          6'h11: out_r[8] = 1'b1;
          6'h12: out_r[8] = 1'b1;
          6'h13: out_r[8] = 1'b1;
          6'h14: out_r[8] = 1'b1;
          6'h15: out_r[8] = 1'b1;
          6'h16: out_r[8] = 1'b1;
          6'h17: out_r[8] = 1'b1;
          6'h18: out_r[8] = 1'b1;
          6'h19: out_r[8] = 1'b1;
          6'h1a: out_r[8] = 1'b1;
          6'h1b: out_r[8] = 1'b1;
          6'h1c: out_r[8] = 1'b1;
          6'h1d: out_r[8] = 1'b1;
          6'h1e: out_r[8] = 1'b1;
          6'h1f: out_r[8] = 1'b1;
          6'h26: out_r[8] = 1'b1;
          6'h29: out_r[8] = 1'b1;
          6'h2a: out_r[8] = 1'b1;
          6'h2d: out_r[8] = 1'b1;
          6'h31: out_r[8] = 1'b1;
          6'h32: out_r[8] = 1'b1;
          6'h34: out_r[8] = 1'b1;
          6'h35: out_r[8] = 1'b1;
          6'h39: out_r[8] = 1'b1;
          6'h3a: out_r[8] = 1'b1;
          6'h3d: out_r[8] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h04: out_r[9] = 1'b1;
          6'h26: out_r[9] = 1'b1;
          6'h28: out_r[9] = 1'b1;
          6'h29: out_r[9] = 1'b1;
          6'h2a: out_r[9] = 1'b1;
          6'h2c: out_r[9] = 1'b1;
          6'h2d: out_r[9] = 1'b1;
          6'h32: out_r[9] = 1'b1;
          6'h38: out_r[9] = 1'b1;
          6'h39: out_r[9] = 1'b1;
          6'h3a: out_r[9] = 1'b1;
          6'h3c: out_r[9] = 1'b1;
          6'h3d: out_r[9] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[10] = 1'b1;
          6'h01: out_r[10] = 1'b1;
          6'h02: out_r[10] = 1'b1;
          6'h03: out_r[10] = 1'b1;
          6'h04: out_r[10] = 1'b1;
          6'h07: out_r[10] = 1'b1;
          6'h09: out_r[10] = 1'b1;
          6'h0b: out_r[10] = 1'b1;
          6'h0d: out_r[10] = 1'b1;
          6'h0e: out_r[10] = 1'b1;
          6'h0f: out_r[10] = 1'b1;
          6'h10: out_r[10] = 1'b1;
          6'h12: out_r[10] = 1'b1;
          6'h15: out_r[10] = 1'b1;
          6'h16: out_r[10] = 1'b1;
          6'h18: out_r[10] = 1'b1;
          6'h19: out_r[10] = 1'b1;
          6'h1a: out_r[10] = 1'b1;
          6'h1c: out_r[10] = 1'b1;
          6'h1d: out_r[10] = 1'b1;
          6'h1f: out_r[10] = 1'b1;
          6'h20: out_r[10] = 1'b1;
          6'h21: out_r[10] = 1'b1;
          6'h22: out_r[10] = 1'b1;
          6'h23: out_r[10] = 1'b1;
          6'h2b: out_r[10] = 1'b1;
          6'h2e: out_r[10] = 1'b1;
          6'h34: out_r[10] = 1'b1;
          6'h36: out_r[10] = 1'b1;
          6'h3b: out_r[10] = 1'b1;
          6'h3e: out_r[10] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h04: out_r[11] = 1'b1;
          6'h05: out_r[11] = 1'b1;
          6'h06: out_r[11] = 1'b1;
          6'h08: out_r[11] = 1'b1;
          6'h0a: out_r[11] = 1'b1;
          6'h0c: out_r[11] = 1'b1;
          6'h11: out_r[11] = 1'b1;
          6'h13: out_r[11] = 1'b1;
          6'h14: out_r[11] = 1'b1;
          6'h17: out_r[11] = 1'b1;
          6'h1b: out_r[11] = 1'b1;
          6'h1e: out_r[11] = 1'b1;
          6'h20: out_r[11] = 1'b1;
          6'h21: out_r[11] = 1'b1;
          6'h22: out_r[11] = 1'b1;
          6'h23: out_r[11] = 1'b1;
          6'h25: out_r[11] = 1'b1;
          6'h2a: out_r[11] = 1'b1;
          6'h2e: out_r[11] = 1'b1;
          6'h2f: out_r[11] = 1'b1;
          6'h31: out_r[11] = 1'b1;
          6'h35: out_r[11] = 1'b1;
          6'h36: out_r[11] = 1'b1;
          6'h3a: out_r[11] = 1'b1;
          6'h3e: out_r[11] = 1'b1;
          6'h3f: out_r[11] = 1'b1;
          default: begin end
        endcase
      end
      6'h29: begin
        out_r = 12'hc51;
        case (inner)
          6'h01: out_r[0] = 1'b0;
          6'h03: out_r[0] = 1'b0;
          6'h06: out_r[0] = 1'b0;
          6'h07: out_r[0] = 1'b0;
          6'h0f: out_r[0] = 1'b0;
          6'h18: out_r[0] = 1'b0;
          6'h1c: out_r[0] = 1'b0;
          6'h1e: out_r[0] = 1'b0;
          6'h1f: out_r[0] = 1'b0;
          6'h21: out_r[0] = 1'b0;
          6'h23: out_r[0] = 1'b0;
          6'h26: out_r[0] = 1'b0;
          6'h27: out_r[0] = 1'b0;
          6'h29: out_r[0] = 1'b0;
          6'h2d: out_r[0] = 1'b0;
          6'h2e: out_r[0] = 1'b0;
          6'h31: out_r[0] = 1'b0;
          6'h33: out_r[0] = 1'b0;
          6'h39: out_r[0] = 1'b0;
          6'h3d: out_r[0] = 1'b0;
          6'h3e: out_r[0] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h01: out_r[1] = 1'b1;
          6'h04: out_r[1] = 1'b1;
          6'h07: out_r[1] = 1'b1;
          6'h0e: out_r[1] = 1'b1;
          6'h0f: out_r[1] = 1'b1;
          6'h11: out_r[1] = 1'b1;
          6'h13: out_r[1] = 1'b1;
          6'h15: out_r[1] = 1'b1;
          6'h16: out_r[1] = 1'b1;
          6'h18: out_r[1] = 1'b1;
          6'h1a: out_r[1] = 1'b1;
          6'h1c: out_r[1] = 1'b1;
          6'h1f: out_r[1] = 1'b1;
          6'h21: out_r[1] = 1'b1;
          6'h24: out_r[1] = 1'b1;
          6'h26: out_r[1] = 1'b1;
          6'h27: out_r[1] = 1'b1;
          6'h2e: out_r[1] = 1'b1;
          6'h31: out_r[1] = 1'b1;
          6'h34: out_r[1] = 1'b1;
          6'h3e: out_r[1] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h01: out_r[2] = 1'b1;
          6'h04: out_r[2] = 1'b1;
          6'h07: out_r[2] = 1'b1;
          6'h0b: out_r[2] = 1'b1;
          6'h0e: out_r[2] = 1'b1;
          6'h0f: out_r[2] = 1'b1;
          6'h15: out_r[2] = 1'b1;
          6'h16: out_r[2] = 1'b1;
          6'h18: out_r[2] = 1'b1;
          6'h19: out_r[2] = 1'b1;
          6'h1a: out_r[2] = 1'b1;
          6'h1c: out_r[2] = 1'b1;
          6'h1d: out_r[2] = 1'b1;
          6'h1f: out_r[2] = 1'b1;
          6'h21: out_r[2] = 1'b1;
          6'h24: out_r[2] = 1'b1;
          6'h26: out_r[2] = 1'b1;
          6'h27: out_r[2] = 1'b1;
          6'h29: out_r[2] = 1'b1;
          6'h2b: out_r[2] = 1'b1;
          6'h2d: out_r[2] = 1'b1;
          6'h2e: out_r[2] = 1'b1;
          6'h2f: out_r[2] = 1'b1;
          6'h31: out_r[2] = 1'b1;
          6'h34: out_r[2] = 1'b1;
          6'h39: out_r[2] = 1'b1;
          6'h3b: out_r[2] = 1'b1;
          6'h3d: out_r[2] = 1'b1;
          6'h3e: out_r[2] = 1'b1;
          6'h3f: out_r[2] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h01: out_r[3] = 1'b1;
          6'h02: out_r[3] = 1'b1;
          6'h03: out_r[3] = 1'b1;
          6'h0f: out_r[3] = 1'b1;
          6'h12: out_r[3] = 1'b1;
          6'h13: out_r[3] = 1'b1;
          6'h1f: out_r[3] = 1'b1;
          6'h21: out_r[3] = 1'b1;
          6'h22: out_r[3] = 1'b1;
          6'h23: out_r[3] = 1'b1;
          6'h28: out_r[3] = 1'b1;
          6'h29: out_r[3] = 1'b1;
          6'h2c: out_r[3] = 1'b1;
          6'h2d: out_r[3] = 1'b1;
          6'h2e: out_r[3] = 1'b1;
          6'h31: out_r[3] = 1'b1;
          6'h32: out_r[3] = 1'b1;
          6'h33: out_r[3] = 1'b1;
          6'h38: out_r[3] = 1'b1;
          6'h39: out_r[3] = 1'b1;
          6'h3c: out_r[3] = 1'b1;
          6'h3d: out_r[3] = 1'b1;
          6'h3e: out_r[3] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[4] = 1'b0;
          6'h01: out_r[4] = 1'b0;
          6'h02: out_r[4] = 1'b0;
          6'h03: out_r[4] = 1'b0;
          6'h06: out_r[4] = 1'b0;
          6'h0f: out_r[4] = 1'b0;
          6'h10: out_r[4] = 1'b0;
          6'h11: out_r[4] = 1'b0;
          6'h12: out_r[4] = 1'b0;
          6'h13: out_r[4] = 1'b0;
          6'h20: out_r[4] = 1'b0;
          6'h21: out_r[4] = 1'b0;
          6'h22: out_r[4] = 1'b0;
          6'h23: out_r[4] = 1'b0;
          6'h28: out_r[4] = 1'b0;
          6'h2a: out_r[4] = 1'b0;
          6'h2c: out_r[4] = 1'b0;
          6'h2e: out_r[4] = 1'b0;
          6'h30: out_r[4] = 1'b0;
          6'h31: out_r[4] = 1'b0;
          6'h32: out_r[4] = 1'b0;
          6'h33: out_r[4] = 1'b0;
          6'h38: out_r[4] = 1'b0;
          6'h3a: out_r[4] = 1'b0;
          6'h3c: out_r[4] = 1'b0;
          6'h3e: out_r[4] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h07: out_r[5] = 1'b1;
          6'h09: out_r[5] = 1'b1;
          6'h0b: out_r[5] = 1'b1;
          6'h0d: out_r[5] = 1'b1;
          6'h18: out_r[5] = 1'b1;
          6'h19: out_r[5] = 1'b1;
          6'h1b: out_r[5] = 1'b1;
          6'h1c: out_r[5] = 1'b1;
          6'h1d: out_r[5] = 1'b1;
          6'h1f: out_r[5] = 1'b1;
          6'h21: out_r[5] = 1'b1;
          6'h23: out_r[5] = 1'b1;
          6'h25: out_r[5] = 1'b1;
          6'h29: out_r[5] = 1'b1;
          6'h2b: out_r[5] = 1'b1;
          6'h2d: out_r[5] = 1'b1;
          6'h31: out_r[5] = 1'b1;
          6'h33: out_r[5] = 1'b1;
          6'h39: out_r[5] = 1'b1;
          6'h3b: out_r[5] = 1'b1;
          6'h3d: out_r[5] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[6] = 1'b0;
          6'h02: out_r[6] = 1'b0;
          6'h06: out_r[6] = 1'b0;
          6'h07: out_r[6] = 1'b0;
          6'h0f: out_r[6] = 1'b0;
          6'h18: out_r[6] = 1'b0;
          6'h19: out_r[6] = 1'b0;
          6'h1c: out_r[6] = 1'b0;
          6'h1d: out_r[6] = 1'b0;
          6'h1f: out_r[6] = 1'b0;
          6'h21: out_r[6] = 1'b0;
          6'h23: out_r[6] = 1'b0;
          6'h25: out_r[6] = 1'b0;
          6'h27: out_r[6] = 1'b0;
          6'h29: out_r[6] = 1'b0;
          6'h2d: out_r[6] = 1'b0;
          6'h31: out_r[6] = 1'b0;
          6'h33: out_r[6] = 1'b0;
          6'h39: out_r[6] = 1'b0;
          6'h3d: out_r[6] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[7] = 1'b1;
          6'h01: out_r[7] = 1'b1;
          6'h02: out_r[7] = 1'b1;
          6'h03: out_r[7] = 1'b1;
          6'h05: out_r[7] = 1'b1;
          6'h06: out_r[7] = 1'b1;
          6'h07: out_r[7] = 1'b1;
          6'h09: out_r[7] = 1'b1;
          6'h0d: out_r[7] = 1'b1;
          6'h0e: out_r[7] = 1'b1;
          6'h15: out_r[7] = 1'b1;
          6'h18: out_r[7] = 1'b1;
          6'h19: out_r[7] = 1'b1;
          6'h1c: out_r[7] = 1'b1;
          6'h1d: out_r[7] = 1'b1;
          6'h1f: out_r[7] = 1'b1;
          6'h21: out_r[7] = 1'b1;
          6'h23: out_r[7] = 1'b1;
          6'h27: out_r[7] = 1'b1;
          6'h29: out_r[7] = 1'b1;
          6'h2b: out_r[7] = 1'b1;
          6'h2d: out_r[7] = 1'b1;
          6'h31: out_r[7] = 1'b1;
          6'h33: out_r[7] = 1'b1;
          6'h39: out_r[7] = 1'b1;
          6'h3b: out_r[7] = 1'b1;
          6'h3d: out_r[7] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[8] = 1'b1;
          6'h01: out_r[8] = 1'b1;
          6'h02: out_r[8] = 1'b1;
          6'h03: out_r[8] = 1'b1;
          6'h05: out_r[8] = 1'b1;
          6'h06: out_r[8] = 1'b1;
          6'h07: out_r[8] = 1'b1;
          6'h08: out_r[8] = 1'b1;
          6'h09: out_r[8] = 1'b1;
          6'h0c: out_r[8] = 1'b1;
          6'h0d: out_r[8] = 1'b1;
          6'h0e: out_r[8] = 1'b1;
          6'h10: out_r[8] = 1'b1;
          6'h12: out_r[8] = 1'b1;
          6'h15: out_r[8] = 1'b1;
          6'h18: out_r[8] = 1'b1;
          6'h19: out_r[8] = 1'b1;
          6'h1c: out_r[8] = 1'b1;
          6'h1d: out_r[8] = 1'b1;
          6'h1f: out_r[8] = 1'b1;
          6'h23: out_r[8] = 1'b1;
          6'h24: out_r[8] = 1'b1;
          6'h25: out_r[8] = 1'b1;
          6'h27: out_r[8] = 1'b1;
          6'h29: out_r[8] = 1'b1;
          6'h2d: out_r[8] = 1'b1;
          6'h33: out_r[8] = 1'b1;
          6'h34: out_r[8] = 1'b1;
          6'h39: out_r[8] = 1'b1;
          6'h3d: out_r[8] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[9] = 1'b1;
          6'h02: out_r[9] = 1'b1;
          6'h05: out_r[9] = 1'b1;
          6'h0f: out_r[9] = 1'b1;
          6'h14: out_r[9] = 1'b1;
          6'h19: out_r[9] = 1'b1;
          6'h1d: out_r[9] = 1'b1;
          6'h1e: out_r[9] = 1'b1;
          6'h1f: out_r[9] = 1'b1;
          6'h21: out_r[9] = 1'b1;
          6'h25: out_r[9] = 1'b1;
          6'h2a: out_r[9] = 1'b1;
          6'h2b: out_r[9] = 1'b1;
          6'h31: out_r[9] = 1'b1;
          6'h36: out_r[9] = 1'b1;
          6'h3a: out_r[9] = 1'b1;
          6'h3b: out_r[9] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h01: out_r[10] = 1'b0;
          6'h04: out_r[10] = 1'b0;
          6'h05: out_r[10] = 1'b0;
          6'h0a: out_r[10] = 1'b0;
          6'h0b: out_r[10] = 1'b0;
          6'h0e: out_r[10] = 1'b0;
          6'h0f: out_r[10] = 1'b0;
          6'h11: out_r[10] = 1'b0;
          6'h13: out_r[10] = 1'b0;
          6'h14: out_r[10] = 1'b0;
          6'h15: out_r[10] = 1'b0;
          6'h16: out_r[10] = 1'b0;
          6'h17: out_r[10] = 1'b0;
          6'h1a: out_r[10] = 1'b0;
          6'h1e: out_r[10] = 1'b0;
          6'h21: out_r[10] = 1'b0;
          6'h24: out_r[10] = 1'b0;
          6'h2a: out_r[10] = 1'b0;
          6'h2b: out_r[10] = 1'b0;
          6'h2e: out_r[10] = 1'b0;
          6'h2f: out_r[10] = 1'b0;
          6'h31: out_r[10] = 1'b0;
          6'h34: out_r[10] = 1'b0;
          6'h35: out_r[10] = 1'b0;
          6'h36: out_r[10] = 1'b0;
          6'h3a: out_r[10] = 1'b0;
          6'h3b: out_r[10] = 1'b0;
          6'h3e: out_r[10] = 1'b0;
          6'h3f: out_r[10] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h03: out_r[11] = 1'b0;
          6'h06: out_r[11] = 1'b0;
          6'h07: out_r[11] = 1'b0;
          6'h09: out_r[11] = 1'b0;
          6'h0d: out_r[11] = 1'b0;
          6'h17: out_r[11] = 1'b0;
          6'h18: out_r[11] = 1'b0;
          6'h1c: out_r[11] = 1'b0;
          6'h1e: out_r[11] = 1'b0;
          6'h23: out_r[11] = 1'b0;
          6'h26: out_r[11] = 1'b0;
          6'h27: out_r[11] = 1'b0;
          6'h29: out_r[11] = 1'b0;
          6'h2d: out_r[11] = 1'b0;
          6'h2e: out_r[11] = 1'b0;
          6'h33: out_r[11] = 1'b0;
          6'h35: out_r[11] = 1'b0;
          6'h39: out_r[11] = 1'b0;
          6'h3d: out_r[11] = 1'b0;
          6'h3e: out_r[11] = 1'b0;
          default: begin end
        endcase
      end
      6'h2a: begin
        out_r = 12'hddd;
        case (inner)
          6'h00: out_r[0] = 1'b0;
          6'h02: out_r[0] = 1'b0;
          6'h03: out_r[0] = 1'b0;
          6'h08: out_r[0] = 1'b0;
          6'h0d: out_r[0] = 1'b0;
          6'h10: out_r[0] = 1'b0;
          6'h13: out_r[0] = 1'b0;
          6'h18: out_r[0] = 1'b0;
          6'h20: out_r[0] = 1'b0;
          6'h22: out_r[0] = 1'b0;
          6'h23: out_r[0] = 1'b0;
          6'h25: out_r[0] = 1'b0;
          6'h28: out_r[0] = 1'b0;
          6'h31: out_r[0] = 1'b0;
          6'h32: out_r[0] = 1'b0;
          6'h33: out_r[0] = 1'b0;
          6'h34: out_r[0] = 1'b0;
          6'h38: out_r[0] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h05: out_r[1] = 1'b1;
          6'h06: out_r[1] = 1'b1;
          6'h09: out_r[1] = 1'b1;
          6'h11: out_r[1] = 1'b1;
          6'h15: out_r[1] = 1'b1;
          6'h19: out_r[1] = 1'b1;
          6'h1a: out_r[1] = 1'b1;
          6'h1e: out_r[1] = 1'b1;
          6'h25: out_r[1] = 1'b1;
          6'h26: out_r[1] = 1'b1;
          6'h27: out_r[1] = 1'b1;
          6'h2a: out_r[1] = 1'b1;
          6'h2b: out_r[1] = 1'b1;
          6'h2c: out_r[1] = 1'b1;
          6'h2e: out_r[1] = 1'b1;
          6'h2f: out_r[1] = 1'b1;
          6'h31: out_r[1] = 1'b1;
          6'h3a: out_r[1] = 1'b1;
          6'h3b: out_r[1] = 1'b1;
          6'h3c: out_r[1] = 1'b1;
          6'h3e: out_r[1] = 1'b1;
          6'h3f: out_r[1] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h06: out_r[2] = 1'b0;
          6'h11: out_r[2] = 1'b0;
          6'h14: out_r[2] = 1'b0;
          6'h15: out_r[2] = 1'b0;
          6'h18: out_r[2] = 1'b0;
          6'h1a: out_r[2] = 1'b0;
          6'h1c: out_r[2] = 1'b0;
          6'h1e: out_r[2] = 1'b0;
          6'h24: out_r[2] = 1'b0;
          6'h25: out_r[2] = 1'b0;
          6'h26: out_r[2] = 1'b0;
          6'h27: out_r[2] = 1'b0;
          6'h29: out_r[2] = 1'b0;
          6'h2a: out_r[2] = 1'b0;
          6'h2b: out_r[2] = 1'b0;
          6'h2e: out_r[2] = 1'b0;
          6'h2f: out_r[2] = 1'b0;
          6'h31: out_r[2] = 1'b0;
          6'h32: out_r[2] = 1'b0;
          6'h33: out_r[2] = 1'b0;
          6'h35: out_r[2] = 1'b0;
          6'h36: out_r[2] = 1'b0;
          6'h37: out_r[2] = 1'b0;
          6'h39: out_r[2] = 1'b0;
          6'h3a: out_r[2] = 1'b0;
          6'h3b: out_r[2] = 1'b0;
          6'h3e: out_r[2] = 1'b0;
          6'h3f: out_r[2] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[3] = 1'b0;
          6'h01: out_r[3] = 1'b0;
          6'h06: out_r[3] = 1'b0;
          6'h07: out_r[3] = 1'b0;
          6'h08: out_r[3] = 1'b0;
          6'h0a: out_r[3] = 1'b0;
          6'h0b: out_r[3] = 1'b0;
          6'h0c: out_r[3] = 1'b0;
          6'h0d: out_r[3] = 1'b0;
          6'h0e: out_r[3] = 1'b0;
          6'h0f: out_r[3] = 1'b0;
          6'h10: out_r[3] = 1'b0;
          6'h12: out_r[3] = 1'b0;
          6'h16: out_r[3] = 1'b0;
          6'h1d: out_r[3] = 1'b0;
          6'h20: out_r[3] = 1'b0;
          6'h21: out_r[3] = 1'b0;
          6'h22: out_r[3] = 1'b0;
          6'h23: out_r[3] = 1'b0;
          6'h25: out_r[3] = 1'b0;
          6'h26: out_r[3] = 1'b0;
          6'h27: out_r[3] = 1'b0;
          6'h2d: out_r[3] = 1'b0;
          6'h34: out_r[3] = 1'b0;
          6'h3d: out_r[3] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[4] = 1'b0;
          6'h01: out_r[4] = 1'b0;
          6'h02: out_r[4] = 1'b0;
          6'h07: out_r[4] = 1'b0;
          6'h08: out_r[4] = 1'b0;
          6'h0a: out_r[4] = 1'b0;
          6'h0b: out_r[4] = 1'b0;
          6'h0c: out_r[4] = 1'b0;
          6'h0d: out_r[4] = 1'b0;
          6'h0e: out_r[4] = 1'b0;
          6'h0f: out_r[4] = 1'b0;
          6'h13: out_r[4] = 1'b0;
          6'h16: out_r[4] = 1'b0;
          6'h20: out_r[4] = 1'b0;
          6'h21: out_r[4] = 1'b0;
          6'h22: out_r[4] = 1'b0;
          6'h23: out_r[4] = 1'b0;
          6'h34: out_r[4] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h05: out_r[5] = 1'b1;
          6'h07: out_r[5] = 1'b1;
          6'h14: out_r[5] = 1'b1;
          6'h15: out_r[5] = 1'b1;
          6'h16: out_r[5] = 1'b1;
          6'h18: out_r[5] = 1'b1;
          6'h1a: out_r[5] = 1'b1;
          6'h1e: out_r[5] = 1'b1;
          6'h24: out_r[5] = 1'b1;
          6'h25: out_r[5] = 1'b1;
          6'h29: out_r[5] = 1'b1;
          6'h2a: out_r[5] = 1'b1;
          6'h2b: out_r[5] = 1'b1;
          6'h2e: out_r[5] = 1'b1;
          6'h2f: out_r[5] = 1'b1;
          6'h32: out_r[5] = 1'b1;
          6'h33: out_r[5] = 1'b1;
          6'h39: out_r[5] = 1'b1;
          6'h3a: out_r[5] = 1'b1;
          6'h3b: out_r[5] = 1'b1;
          6'h3e: out_r[5] = 1'b1;
          6'h3f: out_r[5] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h05: out_r[6] = 1'b0;
          6'h07: out_r[6] = 1'b0;
          6'h0b: out_r[6] = 1'b0;
          6'h0f: out_r[6] = 1'b0;
          6'h11: out_r[6] = 1'b0;
          6'h12: out_r[6] = 1'b0;
          6'h15: out_r[6] = 1'b0;
          6'h16: out_r[6] = 1'b0;
          6'h17: out_r[6] = 1'b0;
          6'h18: out_r[6] = 1'b0;
          6'h1a: out_r[6] = 1'b0;
          6'h1b: out_r[6] = 1'b0;
          6'h1e: out_r[6] = 1'b0;
          6'h1f: out_r[6] = 1'b0;
          6'h21: out_r[6] = 1'b0;
          6'h26: out_r[6] = 1'b0;
          6'h27: out_r[6] = 1'b0;
          6'h29: out_r[6] = 1'b0;
          6'h2a: out_r[6] = 1'b0;
          6'h2b: out_r[6] = 1'b0;
          6'h2e: out_r[6] = 1'b0;
          6'h2f: out_r[6] = 1'b0;
          6'h31: out_r[6] = 1'b0;
          6'h39: out_r[6] = 1'b0;
          6'h3a: out_r[6] = 1'b0;
          6'h3b: out_r[6] = 1'b0;
          6'h3e: out_r[6] = 1'b0;
          6'h3f: out_r[6] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[7] = 1'b0;
          6'h01: out_r[7] = 1'b0;
          6'h02: out_r[7] = 1'b0;
          6'h04: out_r[7] = 1'b0;
          6'h06: out_r[7] = 1'b0;
          6'h09: out_r[7] = 1'b0;
          6'h0a: out_r[7] = 1'b0;
          6'h0e: out_r[7] = 1'b0;
          6'h13: out_r[7] = 1'b0;
          6'h16: out_r[7] = 1'b0;
          6'h18: out_r[7] = 1'b0;
          6'h19: out_r[7] = 1'b0;
          6'h1a: out_r[7] = 1'b0;
          6'h1c: out_r[7] = 1'b0;
          6'h1e: out_r[7] = 1'b0;
          6'h20: out_r[7] = 1'b0;
          6'h28: out_r[7] = 1'b0;
          6'h2c: out_r[7] = 1'b0;
          6'h30: out_r[7] = 1'b0;
          6'h34: out_r[7] = 1'b0;
          6'h35: out_r[7] = 1'b0;
          6'h36: out_r[7] = 1'b0;
          6'h37: out_r[7] = 1'b0;
          6'h38: out_r[7] = 1'b0;
          6'h3c: out_r[7] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[8] = 1'b0;
          6'h02: out_r[8] = 1'b0;
          6'h04: out_r[8] = 1'b0;
          6'h06: out_r[8] = 1'b0;
          6'h08: out_r[8] = 1'b0;
          6'h0a: out_r[8] = 1'b0;
          6'h0d: out_r[8] = 1'b0;
          6'h0e: out_r[8] = 1'b0;
          6'h13: out_r[8] = 1'b0;
          6'h19: out_r[8] = 1'b0;
          6'h1c: out_r[8] = 1'b0;
          6'h20: out_r[8] = 1'b0;
          6'h28: out_r[8] = 1'b0;
          6'h2c: out_r[8] = 1'b0;
          6'h30: out_r[8] = 1'b0;
          6'h34: out_r[8] = 1'b0;
          6'h38: out_r[8] = 1'b0;
          6'h3c: out_r[8] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h0b: out_r[9] = 1'b1;
          6'h0f: out_r[9] = 1'b1;
          6'h11: out_r[9] = 1'b1;
          6'h12: out_r[9] = 1'b1;
          6'h14: out_r[9] = 1'b1;
          6'h15: out_r[9] = 1'b1;
          6'h16: out_r[9] = 1'b1;
          6'h19: out_r[9] = 1'b1;
          6'h1c: out_r[9] = 1'b1;
          6'h21: out_r[9] = 1'b1;
          6'h26: out_r[9] = 1'b1;
          6'h27: out_r[9] = 1'b1;
          6'h29: out_r[9] = 1'b1;
          6'h2a: out_r[9] = 1'b1;
          6'h2b: out_r[9] = 1'b1;
          6'h2e: out_r[9] = 1'b1;
          6'h2f: out_r[9] = 1'b1;
          6'h39: out_r[9] = 1'b1;
          6'h3a: out_r[9] = 1'b1;
          6'h3b: out_r[9] = 1'b1;
          6'h3e: out_r[9] = 1'b1;
          6'h3f: out_r[9] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h05: out_r[10] = 1'b0;
          6'h06: out_r[10] = 1'b0;
          6'h07: out_r[10] = 1'b0;
          6'h09: out_r[10] = 1'b0;
          6'h14: out_r[10] = 1'b0;
          6'h15: out_r[10] = 1'b0;
          6'h19: out_r[10] = 1'b0;
          6'h1a: out_r[10] = 1'b0;
          6'h1c: out_r[10] = 1'b0;
          6'h1d: out_r[10] = 1'b0;
          6'h1e: out_r[10] = 1'b0;
          6'h21: out_r[10] = 1'b0;
          6'h26: out_r[10] = 1'b0;
          6'h27: out_r[10] = 1'b0;
          6'h29: out_r[10] = 1'b0;
          6'h2a: out_r[10] = 1'b0;
          6'h2b: out_r[10] = 1'b0;
          6'h2c: out_r[10] = 1'b0;
          6'h2d: out_r[10] = 1'b0;
          6'h2e: out_r[10] = 1'b0;
          6'h2f: out_r[10] = 1'b0;
          6'h39: out_r[10] = 1'b0;
          6'h3a: out_r[10] = 1'b0;
          6'h3b: out_r[10] = 1'b0;
          6'h3c: out_r[10] = 1'b0;
          6'h3d: out_r[10] = 1'b0;
          6'h3e: out_r[10] = 1'b0;
          6'h3f: out_r[10] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[11] = 1'b0;
          6'h02: out_r[11] = 1'b0;
          6'h03: out_r[11] = 1'b0;
          6'h04: out_r[11] = 1'b0;
          6'h08: out_r[11] = 1'b0;
          6'h0d: out_r[11] = 1'b0;
          6'h10: out_r[11] = 1'b0;
          6'h13: out_r[11] = 1'b0;
          6'h17: out_r[11] = 1'b0;
          6'h18: out_r[11] = 1'b0;
          6'h19: out_r[11] = 1'b0;
          6'h1b: out_r[11] = 1'b0;
          6'h1f: out_r[11] = 1'b0;
          6'h21: out_r[11] = 1'b0;
          6'h22: out_r[11] = 1'b0;
          6'h23: out_r[11] = 1'b0;
          6'h24: out_r[11] = 1'b0;
          6'h25: out_r[11] = 1'b0;
          6'h28: out_r[11] = 1'b0;
          6'h29: out_r[11] = 1'b0;
          6'h31: out_r[11] = 1'b0;
          6'h32: out_r[11] = 1'b0;
          6'h33: out_r[11] = 1'b0;
          6'h38: out_r[11] = 1'b0;
          6'h39: out_r[11] = 1'b0;
          default: begin end
        endcase
      end
      6'h2b: begin
        out_r = 12'h1de;
        case (inner)
          6'h00: out_r[0] = 1'b1;
          6'h07: out_r[0] = 1'b1;
          6'h08: out_r[0] = 1'b1;
          6'h0d: out_r[0] = 1'b1;
          6'h10: out_r[0] = 1'b1;
          6'h11: out_r[0] = 1'b1;
          6'h12: out_r[0] = 1'b1;
          6'h15: out_r[0] = 1'b1;
          6'h16: out_r[0] = 1'b1;
          6'h17: out_r[0] = 1'b1;
          6'h18: out_r[0] = 1'b1;
          6'h19: out_r[0] = 1'b1;
          6'h1a: out_r[0] = 1'b1;
          6'h1c: out_r[0] = 1'b1;
          6'h1d: out_r[0] = 1'b1;
          6'h1e: out_r[0] = 1'b1;
          6'h20: out_r[0] = 1'b1;
          6'h22: out_r[0] = 1'b1;
          6'h24: out_r[0] = 1'b1;
          6'h25: out_r[0] = 1'b1;
          6'h27: out_r[0] = 1'b1;
          6'h29: out_r[0] = 1'b1;
          6'h2c: out_r[0] = 1'b1;
          6'h2d: out_r[0] = 1'b1;
          6'h30: out_r[0] = 1'b1;
          6'h32: out_r[0] = 1'b1;
          6'h36: out_r[0] = 1'b1;
          6'h37: out_r[0] = 1'b1;
          6'h39: out_r[0] = 1'b1;
          6'h3c: out_r[0] = 1'b1;
          6'h3d: out_r[0] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h06: out_r[1] = 1'b0;
          6'h07: out_r[1] = 1'b0;
          6'h0a: out_r[1] = 1'b0;
          6'h0d: out_r[1] = 1'b0;
          6'h0e: out_r[1] = 1'b0;
          6'h14: out_r[1] = 1'b0;
          6'h15: out_r[1] = 1'b0;
          6'h17: out_r[1] = 1'b0;
          6'h1b: out_r[1] = 1'b0;
          6'h1c: out_r[1] = 1'b0;
          6'h1d: out_r[1] = 1'b0;
          6'h1f: out_r[1] = 1'b0;
          6'h22: out_r[1] = 1'b0;
          6'h26: out_r[1] = 1'b0;
          6'h27: out_r[1] = 1'b0;
          6'h2a: out_r[1] = 1'b0;
          6'h2c: out_r[1] = 1'b0;
          6'h2e: out_r[1] = 1'b0;
          6'h32: out_r[1] = 1'b0;
          6'h37: out_r[1] = 1'b0;
          6'h3a: out_r[1] = 1'b0;
          6'h3c: out_r[1] = 1'b0;
          6'h3e: out_r[1] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h01: out_r[2] = 1'b0;
          6'h06: out_r[2] = 1'b0;
          6'h07: out_r[2] = 1'b0;
          6'h0b: out_r[2] = 1'b0;
          6'h0d: out_r[2] = 1'b0;
          6'h0f: out_r[2] = 1'b0;
          6'h14: out_r[2] = 1'b0;
          6'h15: out_r[2] = 1'b0;
          6'h16: out_r[2] = 1'b0;
          6'h17: out_r[2] = 1'b0;
          6'h18: out_r[2] = 1'b0;
          6'h19: out_r[2] = 1'b0;
          6'h1a: out_r[2] = 1'b0;
          6'h1d: out_r[2] = 1'b0;
          6'h1e: out_r[2] = 1'b0;
          6'h21: out_r[2] = 1'b0;
          6'h22: out_r[2] = 1'b0;
          6'h24: out_r[2] = 1'b0;
          6'h26: out_r[2] = 1'b0;
          6'h27: out_r[2] = 1'b0;
          6'h28: out_r[2] = 1'b0;
          6'h29: out_r[2] = 1'b0;
          6'h2c: out_r[2] = 1'b0;
          6'h2d: out_r[2] = 1'b0;
          6'h31: out_r[2] = 1'b0;
          6'h32: out_r[2] = 1'b0;
          6'h37: out_r[2] = 1'b0;
          6'h38: out_r[2] = 1'b0;
          6'h39: out_r[2] = 1'b0;
          6'h3c: out_r[2] = 1'b0;
          6'h3d: out_r[2] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[3] = 1'b0;
          6'h06: out_r[3] = 1'b0;
          6'h07: out_r[3] = 1'b0;
          6'h08: out_r[3] = 1'b0;
          6'h09: out_r[3] = 1'b0;
          6'h0a: out_r[3] = 1'b0;
          6'h0d: out_r[3] = 1'b0;
          6'h0e: out_r[3] = 1'b0;
          6'h10: out_r[3] = 1'b0;
          6'h11: out_r[3] = 1'b0;
          6'h1b: out_r[3] = 1'b0;
          6'h1c: out_r[3] = 1'b0;
          6'h1f: out_r[3] = 1'b0;
          6'h20: out_r[3] = 1'b0;
          6'h22: out_r[3] = 1'b0;
          6'h25: out_r[3] = 1'b0;
          6'h27: out_r[3] = 1'b0;
          6'h2a: out_r[3] = 1'b0;
          6'h2b: out_r[3] = 1'b0;
          6'h2e: out_r[3] = 1'b0;
          6'h2f: out_r[3] = 1'b0;
          6'h30: out_r[3] = 1'b0;
          6'h32: out_r[3] = 1'b0;
          6'h34: out_r[3] = 1'b0;
          6'h35: out_r[3] = 1'b0;
          6'h3a: out_r[3] = 1'b0;
          6'h3b: out_r[3] = 1'b0;
          6'h3e: out_r[3] = 1'b0;
          6'h3f: out_r[3] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[4] = 1'b0;
          6'h02: out_r[4] = 1'b0;
          6'h03: out_r[4] = 1'b0;
          6'h08: out_r[4] = 1'b0;
          6'h09: out_r[4] = 1'b0;
          6'h0a: out_r[4] = 1'b0;
          6'h0d: out_r[4] = 1'b0;
          6'h0e: out_r[4] = 1'b0;
          6'h10: out_r[4] = 1'b0;
          6'h13: out_r[4] = 1'b0;
          6'h1b: out_r[4] = 1'b0;
          6'h1f: out_r[4] = 1'b0;
          6'h20: out_r[4] = 1'b0;
          6'h23: out_r[4] = 1'b0;
          6'h2b: out_r[4] = 1'b0;
          6'h2f: out_r[4] = 1'b0;
          6'h30: out_r[4] = 1'b0;
          6'h33: out_r[4] = 1'b0;
          6'h35: out_r[4] = 1'b0;
          6'h3b: out_r[4] = 1'b0;
          6'h3f: out_r[4] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h01: out_r[5] = 1'b1;
          6'h0b: out_r[5] = 1'b1;
          6'h0f: out_r[5] = 1'b1;
          6'h14: out_r[5] = 1'b1;
          6'h18: out_r[5] = 1'b1;
          6'h19: out_r[5] = 1'b1;
          6'h20: out_r[5] = 1'b1;
          6'h21: out_r[5] = 1'b1;
          6'h26: out_r[5] = 1'b1;
          6'h28: out_r[5] = 1'b1;
          6'h29: out_r[5] = 1'b1;
          6'h2b: out_r[5] = 1'b1;
          6'h2d: out_r[5] = 1'b1;
          6'h2f: out_r[5] = 1'b1;
          6'h30: out_r[5] = 1'b1;
          6'h31: out_r[5] = 1'b1;
          6'h35: out_r[5] = 1'b1;
          6'h38: out_r[5] = 1'b1;
          6'h39: out_r[5] = 1'b1;
          6'h3b: out_r[5] = 1'b1;
          6'h3d: out_r[5] = 1'b1;
          6'h3f: out_r[5] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h03: out_r[6] = 1'b0;
          6'h04: out_r[6] = 1'b0;
          6'h05: out_r[6] = 1'b0;
          6'h09: out_r[6] = 1'b0;
          6'h14: out_r[6] = 1'b0;
          6'h18: out_r[6] = 1'b0;
          6'h19: out_r[6] = 1'b0;
          6'h1c: out_r[6] = 1'b0;
          6'h20: out_r[6] = 1'b0;
          6'h25: out_r[6] = 1'b0;
          6'h28: out_r[6] = 1'b0;
          6'h2b: out_r[6] = 1'b0;
          6'h2f: out_r[6] = 1'b0;
          6'h30: out_r[6] = 1'b0;
          6'h35: out_r[6] = 1'b0;
          6'h38: out_r[6] = 1'b0;
          6'h3b: out_r[6] = 1'b0;
          6'h3f: out_r[6] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[7] = 1'b0;
          6'h02: out_r[7] = 1'b0;
          6'h06: out_r[7] = 1'b0;
          6'h07: out_r[7] = 1'b0;
          6'h0d: out_r[7] = 1'b0;
          6'h12: out_r[7] = 1'b0;
          6'h13: out_r[7] = 1'b0;
          6'h15: out_r[7] = 1'b0;
          6'h16: out_r[7] = 1'b0;
          6'h17: out_r[7] = 1'b0;
          6'h19: out_r[7] = 1'b0;
          6'h1a: out_r[7] = 1'b0;
          6'h1d: out_r[7] = 1'b0;
          6'h1e: out_r[7] = 1'b0;
          6'h22: out_r[7] = 1'b0;
          6'h23: out_r[7] = 1'b0;
          6'h24: out_r[7] = 1'b0;
          6'h27: out_r[7] = 1'b0;
          6'h2b: out_r[7] = 1'b0;
          6'h2c: out_r[7] = 1'b0;
          6'h2f: out_r[7] = 1'b0;
          6'h32: out_r[7] = 1'b0;
          6'h33: out_r[7] = 1'b0;
          6'h34: out_r[7] = 1'b0;
          6'h36: out_r[7] = 1'b0;
          6'h37: out_r[7] = 1'b0;
          6'h3b: out_r[7] = 1'b0;
          6'h3c: out_r[7] = 1'b0;
          6'h3f: out_r[7] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[8] = 1'b0;
          6'h02: out_r[8] = 1'b0;
          6'h06: out_r[8] = 1'b0;
          6'h07: out_r[8] = 1'b0;
          6'h08: out_r[8] = 1'b0;
          6'h0a: out_r[8] = 1'b0;
          6'h0d: out_r[8] = 1'b0;
          6'h0e: out_r[8] = 1'b0;
          6'h12: out_r[8] = 1'b0;
          6'h16: out_r[8] = 1'b0;
          6'h17: out_r[8] = 1'b0;
          6'h1a: out_r[8] = 1'b0;
          6'h1d: out_r[8] = 1'b0;
          6'h1e: out_r[8] = 1'b0;
          6'h22: out_r[8] = 1'b0;
          6'h23: out_r[8] = 1'b0;
          6'h24: out_r[8] = 1'b0;
          6'h27: out_r[8] = 1'b0;
          6'h2c: out_r[8] = 1'b0;
          6'h32: out_r[8] = 1'b0;
          6'h33: out_r[8] = 1'b0;
          6'h34: out_r[8] = 1'b0;
          6'h36: out_r[8] = 1'b0;
          6'h37: out_r[8] = 1'b0;
          6'h3c: out_r[8] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h03: out_r[9] = 1'b1;
          6'h04: out_r[9] = 1'b1;
          6'h05: out_r[9] = 1'b1;
          6'h0d: out_r[9] = 1'b1;
          6'h18: out_r[9] = 1'b1;
          6'h23: out_r[9] = 1'b1;
          6'h25: out_r[9] = 1'b1;
          6'h27: out_r[9] = 1'b1;
          6'h2c: out_r[9] = 1'b1;
          6'h33: out_r[9] = 1'b1;
          6'h35: out_r[9] = 1'b1;
          6'h37: out_r[9] = 1'b1;
          6'h3c: out_r[9] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h01: out_r[10] = 1'b1;
          6'h03: out_r[10] = 1'b1;
          6'h06: out_r[10] = 1'b1;
          6'h07: out_r[10] = 1'b1;
          6'h09: out_r[10] = 1'b1;
          6'h0a: out_r[10] = 1'b1;
          6'h0b: out_r[10] = 1'b1;
          6'h0c: out_r[10] = 1'b1;
          6'h0e: out_r[10] = 1'b1;
          6'h0f: out_r[10] = 1'b1;
          6'h13: out_r[10] = 1'b1;
          6'h14: out_r[10] = 1'b1;
          6'h15: out_r[10] = 1'b1;
          6'h1b: out_r[10] = 1'b1;
          6'h1c: out_r[10] = 1'b1;
          6'h1d: out_r[10] = 1'b1;
          6'h1f: out_r[10] = 1'b1;
          6'h21: out_r[10] = 1'b1;
          6'h24: out_r[10] = 1'b1;
          6'h26: out_r[10] = 1'b1;
          6'h28: out_r[10] = 1'b1;
          6'h2a: out_r[10] = 1'b1;
          6'h2b: out_r[10] = 1'b1;
          6'h2e: out_r[10] = 1'b1;
          6'h2f: out_r[10] = 1'b1;
          6'h31: out_r[10] = 1'b1;
          6'h38: out_r[10] = 1'b1;
          6'h3a: out_r[10] = 1'b1;
          6'h3b: out_r[10] = 1'b1;
          6'h3e: out_r[10] = 1'b1;
          6'h3f: out_r[10] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[11] = 1'b1;
          6'h02: out_r[11] = 1'b1;
          6'h03: out_r[11] = 1'b1;
          6'h04: out_r[11] = 1'b1;
          6'h05: out_r[11] = 1'b1;
          6'h07: out_r[11] = 1'b1;
          6'h08: out_r[11] = 1'b1;
          6'h0c: out_r[11] = 1'b1;
          6'h0d: out_r[11] = 1'b1;
          6'h10: out_r[11] = 1'b1;
          6'h11: out_r[11] = 1'b1;
          6'h12: out_r[11] = 1'b1;
          6'h13: out_r[11] = 1'b1;
          6'h15: out_r[11] = 1'b1;
          6'h17: out_r[11] = 1'b1;
          6'h18: out_r[11] = 1'b1;
          6'h19: out_r[11] = 1'b1;
          6'h1c: out_r[11] = 1'b1;
          6'h20: out_r[11] = 1'b1;
          6'h22: out_r[11] = 1'b1;
          6'h24: out_r[11] = 1'b1;
          6'h25: out_r[11] = 1'b1;
          6'h29: out_r[11] = 1'b1;
          6'h2c: out_r[11] = 1'b1;
          6'h2d: out_r[11] = 1'b1;
          6'h30: out_r[11] = 1'b1;
          6'h32: out_r[11] = 1'b1;
          6'h35: out_r[11] = 1'b1;
          6'h36: out_r[11] = 1'b1;
          6'h39: out_r[11] = 1'b1;
          6'h3c: out_r[11] = 1'b1;
          6'h3d: out_r[11] = 1'b1;
          default: begin end
        endcase
      end
      6'h2c: begin
        out_r = 12'h460;
        case (inner)
          6'h00: out_r[0] = 1'b1;
          6'h03: out_r[0] = 1'b1;
          6'h09: out_r[0] = 1'b1;
          6'h0b: out_r[0] = 1'b1;
          6'h0d: out_r[0] = 1'b1;
          6'h0f: out_r[0] = 1'b1;
          6'h11: out_r[0] = 1'b1;
          6'h12: out_r[0] = 1'b1;
          6'h1b: out_r[0] = 1'b1;
          6'h1c: out_r[0] = 1'b1;
          6'h1d: out_r[0] = 1'b1;
          6'h1e: out_r[0] = 1'b1;
          6'h1f: out_r[0] = 1'b1;
          6'h21: out_r[0] = 1'b1;
          6'h25: out_r[0] = 1'b1;
          6'h2b: out_r[0] = 1'b1;
          6'h2c: out_r[0] = 1'b1;
          6'h2e: out_r[0] = 1'b1;
          6'h30: out_r[0] = 1'b1;
          6'h33: out_r[0] = 1'b1;
          6'h37: out_r[0] = 1'b1;
          6'h3b: out_r[0] = 1'b1;
          6'h3c: out_r[0] = 1'b1;
          6'h3e: out_r[0] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[1] = 1'b1;
          6'h03: out_r[1] = 1'b1;
          6'h05: out_r[1] = 1'b1;
          6'h07: out_r[1] = 1'b1;
          6'h0a: out_r[1] = 1'b1;
          6'h0b: out_r[1] = 1'b1;
          6'h14: out_r[1] = 1'b1;
          6'h16: out_r[1] = 1'b1;
          6'h19: out_r[1] = 1'b1;
          6'h1a: out_r[1] = 1'b1;
          6'h1b: out_r[1] = 1'b1;
          6'h1f: out_r[1] = 1'b1;
          6'h25: out_r[1] = 1'b1;
          6'h29: out_r[1] = 1'b1;
          6'h2a: out_r[1] = 1'b1;
          6'h2b: out_r[1] = 1'b1;
          6'h2c: out_r[1] = 1'b1;
          6'h2e: out_r[1] = 1'b1;
          6'h30: out_r[1] = 1'b1;
          6'h31: out_r[1] = 1'b1;
          6'h34: out_r[1] = 1'b1;
          6'h35: out_r[1] = 1'b1;
          6'h36: out_r[1] = 1'b1;
          6'h39: out_r[1] = 1'b1;
          6'h3a: out_r[1] = 1'b1;
          6'h3b: out_r[1] = 1'b1;
          6'h3c: out_r[1] = 1'b1;
          6'h3e: out_r[1] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[2] = 1'b1;
          6'h01: out_r[2] = 1'b1;
          6'h02: out_r[2] = 1'b1;
          6'h03: out_r[2] = 1'b1;
          6'h08: out_r[2] = 1'b1;
          6'h09: out_r[2] = 1'b1;
          6'h0c: out_r[2] = 1'b1;
          6'h0e: out_r[2] = 1'b1;
          6'h10: out_r[2] = 1'b1;
          6'h11: out_r[2] = 1'b1;
          6'h12: out_r[2] = 1'b1;
          6'h13: out_r[2] = 1'b1;
          6'h17: out_r[2] = 1'b1;
          6'h1c: out_r[2] = 1'b1;
          6'h1d: out_r[2] = 1'b1;
          6'h1e: out_r[2] = 1'b1;
          6'h21: out_r[2] = 1'b1;
          6'h22: out_r[2] = 1'b1;
          6'h23: out_r[2] = 1'b1;
          6'h27: out_r[2] = 1'b1;
          6'h2d: out_r[2] = 1'b1;
          6'h2f: out_r[2] = 1'b1;
          6'h32: out_r[2] = 1'b1;
          6'h33: out_r[2] = 1'b1;
          6'h34: out_r[2] = 1'b1;
          6'h36: out_r[2] = 1'b1;
          6'h37: out_r[2] = 1'b1;
          6'h3d: out_r[2] = 1'b1;
          6'h3f: out_r[2] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[3] = 1'b1;
          6'h01: out_r[3] = 1'b1;
          6'h0d: out_r[3] = 1'b1;
          6'h0f: out_r[3] = 1'b1;
          6'h18: out_r[3] = 1'b1;
          6'h19: out_r[3] = 1'b1;
          6'h1d: out_r[3] = 1'b1;
          6'h21: out_r[3] = 1'b1;
          6'h22: out_r[3] = 1'b1;
          6'h25: out_r[3] = 1'b1;
          6'h28: out_r[3] = 1'b1;
          6'h29: out_r[3] = 1'b1;
          6'h35: out_r[3] = 1'b1;
          6'h38: out_r[3] = 1'b1;
          6'h39: out_r[3] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[4] = 1'b1;
          6'h01: out_r[4] = 1'b1;
          6'h02: out_r[4] = 1'b1;
          6'h03: out_r[4] = 1'b1;
          6'h04: out_r[4] = 1'b1;
          6'h05: out_r[4] = 1'b1;
          6'h06: out_r[4] = 1'b1;
          6'h07: out_r[4] = 1'b1;
          6'h1c: out_r[4] = 1'b1;
          6'h1e: out_r[4] = 1'b1;
          6'h20: out_r[4] = 1'b1;
          6'h24: out_r[4] = 1'b1;
          6'h26: out_r[4] = 1'b1;
          6'h27: out_r[4] = 1'b1;
          6'h2d: out_r[4] = 1'b1;
          6'h30: out_r[4] = 1'b1;
          6'h31: out_r[4] = 1'b1;
          6'h32: out_r[4] = 1'b1;
          6'h33: out_r[4] = 1'b1;
          6'h34: out_r[4] = 1'b1;
          6'h36: out_r[4] = 1'b1;
          6'h37: out_r[4] = 1'b1;
          6'h3d: out_r[4] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h18: out_r[5] = 1'b0;
          6'h19: out_r[5] = 1'b0;
          6'h1a: out_r[5] = 1'b0;
          6'h1b: out_r[5] = 1'b0;
          6'h1f: out_r[5] = 1'b0;
          6'h27: out_r[5] = 1'b0;
          6'h28: out_r[5] = 1'b0;
          6'h29: out_r[5] = 1'b0;
          6'h2a: out_r[5] = 1'b0;
          6'h2b: out_r[5] = 1'b0;
          6'h2d: out_r[5] = 1'b0;
          6'h32: out_r[5] = 1'b0;
          6'h33: out_r[5] = 1'b0;
          6'h37: out_r[5] = 1'b0;
          6'h38: out_r[5] = 1'b0;
          6'h39: out_r[5] = 1'b0;
          6'h3a: out_r[5] = 1'b0;
          6'h3b: out_r[5] = 1'b0;
          6'h3d: out_r[5] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h09: out_r[6] = 1'b0;
          6'h18: out_r[6] = 1'b0;
          6'h19: out_r[6] = 1'b0;
          6'h1a: out_r[6] = 1'b0;
          6'h1b: out_r[6] = 1'b0;
          6'h24: out_r[6] = 1'b0;
          6'h26: out_r[6] = 1'b0;
          6'h27: out_r[6] = 1'b0;
          6'h2b: out_r[6] = 1'b0;
          6'h2c: out_r[6] = 1'b0;
          6'h2d: out_r[6] = 1'b0;
          6'h2e: out_r[6] = 1'b0;
          6'h31: out_r[6] = 1'b0;
          6'h32: out_r[6] = 1'b0;
          6'h33: out_r[6] = 1'b0;
          6'h35: out_r[6] = 1'b0;
          6'h37: out_r[6] = 1'b0;
          6'h3b: out_r[6] = 1'b0;
          6'h3c: out_r[6] = 1'b0;
          6'h3d: out_r[6] = 1'b0;
          6'h3e: out_r[6] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h08: out_r[7] = 1'b1;
          6'h09: out_r[7] = 1'b1;
          6'h0a: out_r[7] = 1'b1;
          6'h0b: out_r[7] = 1'b1;
          6'h0c: out_r[7] = 1'b1;
          6'h0e: out_r[7] = 1'b1;
          6'h10: out_r[7] = 1'b1;
          6'h11: out_r[7] = 1'b1;
          6'h12: out_r[7] = 1'b1;
          6'h13: out_r[7] = 1'b1;
          6'h14: out_r[7] = 1'b1;
          6'h15: out_r[7] = 1'b1;
          6'h16: out_r[7] = 1'b1;
          6'h17: out_r[7] = 1'b1;
          6'h21: out_r[7] = 1'b1;
          6'h23: out_r[7] = 1'b1;
          6'h24: out_r[7] = 1'b1;
          6'h26: out_r[7] = 1'b1;
          6'h27: out_r[7] = 1'b1;
          6'h2b: out_r[7] = 1'b1;
          6'h2c: out_r[7] = 1'b1;
          6'h2d: out_r[7] = 1'b1;
          6'h2e: out_r[7] = 1'b1;
          6'h2f: out_r[7] = 1'b1;
          6'h31: out_r[7] = 1'b1;
          6'h33: out_r[7] = 1'b1;
          6'h35: out_r[7] = 1'b1;
          6'h3b: out_r[7] = 1'b1;
          6'h3c: out_r[7] = 1'b1;
          6'h3d: out_r[7] = 1'b1;
          6'h3e: out_r[7] = 1'b1;
          6'h3f: out_r[7] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h09: out_r[8] = 1'b1;
          6'h10: out_r[8] = 1'b1;
          6'h11: out_r[8] = 1'b1;
          6'h12: out_r[8] = 1'b1;
          6'h13: out_r[8] = 1'b1;
          6'h14: out_r[8] = 1'b1;
          6'h15: out_r[8] = 1'b1;
          6'h16: out_r[8] = 1'b1;
          6'h17: out_r[8] = 1'b1;
          6'h18: out_r[8] = 1'b1;
          6'h19: out_r[8] = 1'b1;
          6'h1a: out_r[8] = 1'b1;
          6'h1b: out_r[8] = 1'b1;
          6'h21: out_r[8] = 1'b1;
          6'h23: out_r[8] = 1'b1;
          6'h24: out_r[8] = 1'b1;
          6'h25: out_r[8] = 1'b1;
          6'h26: out_r[8] = 1'b1;
          6'h27: out_r[8] = 1'b1;
          6'h2b: out_r[8] = 1'b1;
          6'h2c: out_r[8] = 1'b1;
          6'h2d: out_r[8] = 1'b1;
          6'h2e: out_r[8] = 1'b1;
          6'h2f: out_r[8] = 1'b1;
          6'h31: out_r[8] = 1'b1;
          6'h33: out_r[8] = 1'b1;
          6'h35: out_r[8] = 1'b1;
          6'h3b: out_r[8] = 1'b1;
          6'h3c: out_r[8] = 1'b1;
          6'h3d: out_r[8] = 1'b1;
          6'h3e: out_r[8] = 1'b1;
          6'h3f: out_r[8] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h09: out_r[9] = 1'b1;
          6'h11: out_r[9] = 1'b1;
          6'h1d: out_r[9] = 1'b1;
          6'h24: out_r[9] = 1'b1;
          6'h26: out_r[9] = 1'b1;
          6'h2b: out_r[9] = 1'b1;
          6'h2c: out_r[9] = 1'b1;
          6'h2e: out_r[9] = 1'b1;
          6'h31: out_r[9] = 1'b1;
          6'h33: out_r[9] = 1'b1;
          6'h35: out_r[9] = 1'b1;
          6'h3b: out_r[9] = 1'b1;
          6'h3c: out_r[9] = 1'b1;
          6'h3e: out_r[9] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[10] = 1'b0;
          6'h03: out_r[10] = 1'b0;
          6'h0b: out_r[10] = 1'b0;
          6'h0d: out_r[10] = 1'b0;
          6'h0f: out_r[10] = 1'b0;
          6'h11: out_r[10] = 1'b0;
          6'h12: out_r[10] = 1'b0;
          6'h1b: out_r[10] = 1'b0;
          6'h1d: out_r[10] = 1'b0;
          6'h1f: out_r[10] = 1'b0;
          6'h25: out_r[10] = 1'b0;
          6'h2b: out_r[10] = 1'b0;
          6'h2c: out_r[10] = 1'b0;
          6'h2e: out_r[10] = 1'b0;
          6'h30: out_r[10] = 1'b0;
          6'h31: out_r[10] = 1'b0;
          6'h33: out_r[10] = 1'b0;
          6'h35: out_r[10] = 1'b0;
          6'h37: out_r[10] = 1'b0;
          6'h3b: out_r[10] = 1'b0;
          6'h3c: out_r[10] = 1'b0;
          6'h3e: out_r[10] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[11] = 1'b1;
          6'h03: out_r[11] = 1'b1;
          6'h09: out_r[11] = 1'b1;
          6'h0b: out_r[11] = 1'b1;
          6'h0d: out_r[11] = 1'b1;
          6'h0f: out_r[11] = 1'b1;
          6'h11: out_r[11] = 1'b1;
          6'h12: out_r[11] = 1'b1;
          6'h1b: out_r[11] = 1'b1;
          6'h1c: out_r[11] = 1'b1;
          6'h1d: out_r[11] = 1'b1;
          6'h1e: out_r[11] = 1'b1;
          6'h1f: out_r[11] = 1'b1;
          6'h25: out_r[11] = 1'b1;
          6'h28: out_r[11] = 1'b1;
          6'h29: out_r[11] = 1'b1;
          6'h2a: out_r[11] = 1'b1;
          6'h2b: out_r[11] = 1'b1;
          6'h2c: out_r[11] = 1'b1;
          6'h2e: out_r[11] = 1'b1;
          6'h30: out_r[11] = 1'b1;
          6'h33: out_r[11] = 1'b1;
          6'h34: out_r[11] = 1'b1;
          6'h36: out_r[11] = 1'b1;
          6'h38: out_r[11] = 1'b1;
          6'h39: out_r[11] = 1'b1;
          6'h3a: out_r[11] = 1'b1;
          6'h3b: out_r[11] = 1'b1;
          6'h3c: out_r[11] = 1'b1;
          6'h3e: out_r[11] = 1'b1;
          default: begin end
        endcase
      end
      6'h2d: begin
        out_r = 12'hbae;
        case (inner)
          6'h01: out_r[0] = 1'b1;
          6'h03: out_r[0] = 1'b1;
          6'h08: out_r[0] = 1'b1;
          6'h09: out_r[0] = 1'b1;
          6'h0c: out_r[0] = 1'b1;
          6'h0e: out_r[0] = 1'b1;
          6'h13: out_r[0] = 1'b1;
          6'h14: out_r[0] = 1'b1;
          6'h16: out_r[0] = 1'b1;
          6'h18: out_r[0] = 1'b1;
          6'h19: out_r[0] = 1'b1;
          6'h1a: out_r[0] = 1'b1;
          6'h1c: out_r[0] = 1'b1;
          6'h1e: out_r[0] = 1'b1;
          6'h20: out_r[0] = 1'b1;
          6'h21: out_r[0] = 1'b1;
          6'h22: out_r[0] = 1'b1;
          6'h25: out_r[0] = 1'b1;
          6'h27: out_r[0] = 1'b1;
          6'h29: out_r[0] = 1'b1;
          6'h2c: out_r[0] = 1'b1;
          6'h33: out_r[0] = 1'b1;
          6'h35: out_r[0] = 1'b1;
          6'h37: out_r[0] = 1'b1;
          6'h39: out_r[0] = 1'b1;
          6'h3c: out_r[0] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h01: out_r[1] = 1'b0;
          6'h03: out_r[1] = 1'b0;
          6'h08: out_r[1] = 1'b0;
          6'h0b: out_r[1] = 1'b0;
          6'h0c: out_r[1] = 1'b0;
          6'h0e: out_r[1] = 1'b0;
          6'h13: out_r[1] = 1'b0;
          6'h14: out_r[1] = 1'b0;
          6'h16: out_r[1] = 1'b0;
          6'h18: out_r[1] = 1'b0;
          6'h1a: out_r[1] = 1'b0;
          6'h1b: out_r[1] = 1'b0;
          6'h1c: out_r[1] = 1'b0;
          6'h1d: out_r[1] = 1'b0;
          6'h1e: out_r[1] = 1'b0;
          6'h1f: out_r[1] = 1'b0;
          6'h20: out_r[1] = 1'b0;
          6'h21: out_r[1] = 1'b0;
          6'h22: out_r[1] = 1'b0;
          6'h25: out_r[1] = 1'b0;
          6'h27: out_r[1] = 1'b0;
          6'h2b: out_r[1] = 1'b0;
          6'h2c: out_r[1] = 1'b0;
          6'h33: out_r[1] = 1'b0;
          6'h35: out_r[1] = 1'b0;
          6'h37: out_r[1] = 1'b0;
          6'h3b: out_r[1] = 1'b0;
          6'h3c: out_r[1] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h01: out_r[2] = 1'b0;
          6'h08: out_r[2] = 1'b0;
          6'h0b: out_r[2] = 1'b0;
          6'h0c: out_r[2] = 1'b0;
          6'h0e: out_r[2] = 1'b0;
          6'h13: out_r[2] = 1'b0;
          6'h16: out_r[2] = 1'b0;
          6'h18: out_r[2] = 1'b0;
          6'h19: out_r[2] = 1'b0;
          6'h1a: out_r[2] = 1'b0;
          6'h1b: out_r[2] = 1'b0;
          6'h1e: out_r[2] = 1'b0;
          6'h20: out_r[2] = 1'b0;
          6'h21: out_r[2] = 1'b0;
          6'h22: out_r[2] = 1'b0;
          6'h25: out_r[2] = 1'b0;
          6'h27: out_r[2] = 1'b0;
          6'h2b: out_r[2] = 1'b0;
          6'h2c: out_r[2] = 1'b0;
          6'h33: out_r[2] = 1'b0;
          6'h35: out_r[2] = 1'b0;
          6'h37: out_r[2] = 1'b0;
          6'h3b: out_r[2] = 1'b0;
          6'h3c: out_r[2] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h01: out_r[3] = 1'b0;
          6'h03: out_r[3] = 1'b0;
          6'h08: out_r[3] = 1'b0;
          6'h09: out_r[3] = 1'b0;
          6'h0b: out_r[3] = 1'b0;
          6'h0d: out_r[3] = 1'b0;
          6'h0e: out_r[3] = 1'b0;
          6'h0f: out_r[3] = 1'b0;
          6'h14: out_r[3] = 1'b0;
          6'h16: out_r[3] = 1'b0;
          6'h1a: out_r[3] = 1'b0;
          6'h1b: out_r[3] = 1'b0;
          6'h1c: out_r[3] = 1'b0;
          6'h1d: out_r[3] = 1'b0;
          6'h1f: out_r[3] = 1'b0;
          6'h22: out_r[3] = 1'b0;
          6'h25: out_r[3] = 1'b0;
          6'h27: out_r[3] = 1'b0;
          6'h29: out_r[3] = 1'b0;
          6'h2b: out_r[3] = 1'b0;
          6'h2c: out_r[3] = 1'b0;
          6'h2d: out_r[3] = 1'b0;
          6'h2f: out_r[3] = 1'b0;
          6'h35: out_r[3] = 1'b0;
          6'h37: out_r[3] = 1'b0;
          6'h39: out_r[3] = 1'b0;
          6'h3b: out_r[3] = 1'b0;
          6'h3c: out_r[3] = 1'b0;
          6'h3d: out_r[3] = 1'b0;
          6'h3f: out_r[3] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h03: out_r[4] = 1'b1;
          6'h04: out_r[4] = 1'b1;
          6'h14: out_r[4] = 1'b1;
          6'h1c: out_r[4] = 1'b1;
          6'h1d: out_r[4] = 1'b1;
          6'h1f: out_r[4] = 1'b1;
          6'h22: out_r[4] = 1'b1;
          6'h29: out_r[4] = 1'b1;
          6'h2b: out_r[4] = 1'b1;
          6'h2d: out_r[4] = 1'b1;
          6'h2e: out_r[4] = 1'b1;
          6'h2f: out_r[4] = 1'b1;
          6'h31: out_r[4] = 1'b1;
          6'h39: out_r[4] = 1'b1;
          6'h3b: out_r[4] = 1'b1;
          6'h3d: out_r[4] = 1'b1;
          6'h3e: out_r[4] = 1'b1;
          6'h3f: out_r[4] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h08: out_r[5] = 1'b0;
          6'h0e: out_r[5] = 1'b0;
          6'h16: out_r[5] = 1'b0;
          6'h18: out_r[5] = 1'b0;
          6'h19: out_r[5] = 1'b0;
          6'h1a: out_r[5] = 1'b0;
          6'h1b: out_r[5] = 1'b0;
          6'h1d: out_r[5] = 1'b0;
          6'h1f: out_r[5] = 1'b0;
          6'h23: out_r[5] = 1'b0;
          6'h29: out_r[5] = 1'b0;
          6'h2b: out_r[5] = 1'b0;
          6'h2d: out_r[5] = 1'b0;
          6'h2f: out_r[5] = 1'b0;
          6'h39: out_r[5] = 1'b0;
          6'h3b: out_r[5] = 1'b0;
          6'h3d: out_r[5] = 1'b0;
          6'h3f: out_r[5] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h01: out_r[6] = 1'b1;
          6'h03: out_r[6] = 1'b1;
          6'h04: out_r[6] = 1'b1;
          6'h08: out_r[6] = 1'b1;
          6'h09: out_r[6] = 1'b1;
          6'h0b: out_r[6] = 1'b1;
          6'h0c: out_r[6] = 1'b1;
          6'h0d: out_r[6] = 1'b1;
          6'h0f: out_r[6] = 1'b1;
          6'h13: out_r[6] = 1'b1;
          6'h14: out_r[6] = 1'b1;
          6'h18: out_r[6] = 1'b1;
          6'h1a: out_r[6] = 1'b1;
          6'h1e: out_r[6] = 1'b1;
          6'h21: out_r[6] = 1'b1;
          6'h22: out_r[6] = 1'b1;
          6'h23: out_r[6] = 1'b1;
          6'h25: out_r[6] = 1'b1;
          6'h27: out_r[6] = 1'b1;
          6'h2c: out_r[6] = 1'b1;
          6'h2e: out_r[6] = 1'b1;
          6'h31: out_r[6] = 1'b1;
          6'h32: out_r[6] = 1'b1;
          6'h33: out_r[6] = 1'b1;
          6'h3c: out_r[6] = 1'b1;
          6'h3e: out_r[6] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h01: out_r[7] = 1'b0;
          6'h03: out_r[7] = 1'b0;
          6'h04: out_r[7] = 1'b0;
          6'h08: out_r[7] = 1'b0;
          6'h0c: out_r[7] = 1'b0;
          6'h13: out_r[7] = 1'b0;
          6'h14: out_r[7] = 1'b0;
          6'h18: out_r[7] = 1'b0;
          6'h19: out_r[7] = 1'b0;
          6'h1a: out_r[7] = 1'b0;
          6'h1b: out_r[7] = 1'b0;
          6'h1d: out_r[7] = 1'b0;
          6'h1e: out_r[7] = 1'b0;
          6'h1f: out_r[7] = 1'b0;
          6'h21: out_r[7] = 1'b0;
          6'h22: out_r[7] = 1'b0;
          6'h23: out_r[7] = 1'b0;
          6'h25: out_r[7] = 1'b0;
          6'h27: out_r[7] = 1'b0;
          6'h2b: out_r[7] = 1'b0;
          6'h2c: out_r[7] = 1'b0;
          6'h2e: out_r[7] = 1'b0;
          6'h31: out_r[7] = 1'b0;
          6'h32: out_r[7] = 1'b0;
          6'h33: out_r[7] = 1'b0;
          6'h3b: out_r[7] = 1'b0;
          6'h3c: out_r[7] = 1'b0;
          6'h3e: out_r[7] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h01: out_r[8] = 1'b0;
          6'h03: out_r[8] = 1'b0;
          6'h04: out_r[8] = 1'b0;
          6'h08: out_r[8] = 1'b0;
          6'h0b: out_r[8] = 1'b0;
          6'h0c: out_r[8] = 1'b0;
          6'h13: out_r[8] = 1'b0;
          6'h14: out_r[8] = 1'b0;
          6'h19: out_r[8] = 1'b0;
          6'h1a: out_r[8] = 1'b0;
          6'h1b: out_r[8] = 1'b0;
          6'h1d: out_r[8] = 1'b0;
          6'h1e: out_r[8] = 1'b0;
          6'h1f: out_r[8] = 1'b0;
          6'h21: out_r[8] = 1'b0;
          6'h25: out_r[8] = 1'b0;
          6'h27: out_r[8] = 1'b0;
          6'h2c: out_r[8] = 1'b0;
          6'h2e: out_r[8] = 1'b0;
          6'h31: out_r[8] = 1'b0;
          6'h32: out_r[8] = 1'b0;
          6'h33: out_r[8] = 1'b0;
          6'h3c: out_r[8] = 1'b0;
          6'h3e: out_r[8] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h01: out_r[9] = 1'b0;
          6'h08: out_r[9] = 1'b0;
          6'h09: out_r[9] = 1'b0;
          6'h0d: out_r[9] = 1'b0;
          6'h0f: out_r[9] = 1'b0;
          6'h13: out_r[9] = 1'b0;
          6'h14: out_r[9] = 1'b0;
          6'h18: out_r[9] = 1'b0;
          6'h19: out_r[9] = 1'b0;
          6'h1b: out_r[9] = 1'b0;
          6'h1d: out_r[9] = 1'b0;
          6'h1f: out_r[9] = 1'b0;
          6'h22: out_r[9] = 1'b0;
          6'h23: out_r[9] = 1'b0;
          6'h25: out_r[9] = 1'b0;
          6'h27: out_r[9] = 1'b0;
          6'h29: out_r[9] = 1'b0;
          6'h2b: out_r[9] = 1'b0;
          6'h2c: out_r[9] = 1'b0;
          6'h2d: out_r[9] = 1'b0;
          6'h2e: out_r[9] = 1'b0;
          6'h2f: out_r[9] = 1'b0;
          6'h31: out_r[9] = 1'b0;
          6'h32: out_r[9] = 1'b0;
          6'h39: out_r[9] = 1'b0;
          6'h3b: out_r[9] = 1'b0;
          6'h3c: out_r[9] = 1'b0;
          6'h3d: out_r[9] = 1'b0;
          6'h3e: out_r[9] = 1'b0;
          6'h3f: out_r[9] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h0d: out_r[10] = 1'b1;
          6'h0e: out_r[10] = 1'b1;
          6'h0f: out_r[10] = 1'b1;
          6'h14: out_r[10] = 1'b1;
          6'h18: out_r[10] = 1'b1;
          6'h1d: out_r[10] = 1'b1;
          6'h1f: out_r[10] = 1'b1;
          6'h20: out_r[10] = 1'b1;
          6'h22: out_r[10] = 1'b1;
          6'h23: out_r[10] = 1'b1;
          6'h2b: out_r[10] = 1'b1;
          6'h2d: out_r[10] = 1'b1;
          6'h2f: out_r[10] = 1'b1;
          6'h35: out_r[10] = 1'b1;
          6'h37: out_r[10] = 1'b1;
          6'h3b: out_r[10] = 1'b1;
          6'h3d: out_r[10] = 1'b1;
          6'h3f: out_r[10] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h01: out_r[11] = 1'b0;
          6'h03: out_r[11] = 1'b0;
          6'h0b: out_r[11] = 1'b0;
          6'h0d: out_r[11] = 1'b0;
          6'h0f: out_r[11] = 1'b0;
          6'h13: out_r[11] = 1'b0;
          6'h1b: out_r[11] = 1'b0;
          6'h1c: out_r[11] = 1'b0;
          6'h1d: out_r[11] = 1'b0;
          6'h1f: out_r[11] = 1'b0;
          6'h2b: out_r[11] = 1'b0;
          6'h2d: out_r[11] = 1'b0;
          6'h2f: out_r[11] = 1'b0;
          6'h31: out_r[11] = 1'b0;
          6'h32: out_r[11] = 1'b0;
          6'h3b: out_r[11] = 1'b0;
          6'h3d: out_r[11] = 1'b0;
          6'h3f: out_r[11] = 1'b0;
          default: begin end
        endcase
      end
      6'h2e: begin
        out_r = 12'hde1;
        case (inner)
          6'h00: out_r[0] = 1'b0;
          6'h08: out_r[0] = 1'b0;
          6'h09: out_r[0] = 1'b0;
          6'h0a: out_r[0] = 1'b0;
          6'h0b: out_r[0] = 1'b0;
          6'h0e: out_r[0] = 1'b0;
          6'h0f: out_r[0] = 1'b0;
          6'h12: out_r[0] = 1'b0;
          6'h13: out_r[0] = 1'b0;
          6'h18: out_r[0] = 1'b0;
          6'h19: out_r[0] = 1'b0;
          6'h1b: out_r[0] = 1'b0;
          6'h1c: out_r[0] = 1'b0;
          6'h1d: out_r[0] = 1'b0;
          6'h1e: out_r[0] = 1'b0;
          6'h1f: out_r[0] = 1'b0;
          6'h20: out_r[0] = 1'b0;
          6'h28: out_r[0] = 1'b0;
          6'h29: out_r[0] = 1'b0;
          6'h32: out_r[0] = 1'b0;
          6'h33: out_r[0] = 1'b0;
          6'h34: out_r[0] = 1'b0;
          6'h35: out_r[0] = 1'b0;
          6'h38: out_r[0] = 1'b0;
          6'h39: out_r[0] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h0c: out_r[1] = 1'b1;
          6'h0e: out_r[1] = 1'b1;
          6'h0f: out_r[1] = 1'b1;
          6'h10: out_r[1] = 1'b1;
          6'h14: out_r[1] = 1'b1;
          6'h16: out_r[1] = 1'b1;
          6'h17: out_r[1] = 1'b1;
          6'h1e: out_r[1] = 1'b1;
          6'h1f: out_r[1] = 1'b1;
          6'h21: out_r[1] = 1'b1;
          6'h32: out_r[1] = 1'b1;
          6'h33: out_r[1] = 1'b1;
          6'h34: out_r[1] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h04: out_r[2] = 1'b1;
          6'h06: out_r[2] = 1'b1;
          6'h07: out_r[2] = 1'b1;
          6'h0c: out_r[2] = 1'b1;
          6'h0d: out_r[2] = 1'b1;
          6'h11: out_r[2] = 1'b1;
          6'h12: out_r[2] = 1'b1;
          6'h15: out_r[2] = 1'b1;
          6'h18: out_r[2] = 1'b1;
          6'h1a: out_r[2] = 1'b1;
          6'h1c: out_r[2] = 1'b1;
          6'h22: out_r[2] = 1'b1;
          6'h23: out_r[2] = 1'b1;
          6'h24: out_r[2] = 1'b1;
          6'h28: out_r[2] = 1'b1;
          6'h2a: out_r[2] = 1'b1;
          6'h2b: out_r[2] = 1'b1;
          6'h2c: out_r[2] = 1'b1;
          6'h2d: out_r[2] = 1'b1;
          6'h2e: out_r[2] = 1'b1;
          6'h2f: out_r[2] = 1'b1;
          6'h30: out_r[2] = 1'b1;
          6'h31: out_r[2] = 1'b1;
          6'h35: out_r[2] = 1'b1;
          6'h38: out_r[2] = 1'b1;
          6'h3a: out_r[2] = 1'b1;
          6'h3b: out_r[2] = 1'b1;
          6'h3c: out_r[2] = 1'b1;
          6'h3d: out_r[2] = 1'b1;
          6'h3e: out_r[2] = 1'b1;
          6'h3f: out_r[2] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[3] = 1'b1;
          6'h01: out_r[3] = 1'b1;
          6'h02: out_r[3] = 1'b1;
          6'h03: out_r[3] = 1'b1;
          6'h05: out_r[3] = 1'b1;
          6'h08: out_r[3] = 1'b1;
          6'h09: out_r[3] = 1'b1;
          6'h0a: out_r[3] = 1'b1;
          6'h0b: out_r[3] = 1'b1;
          6'h0c: out_r[3] = 1'b1;
          6'h0d: out_r[3] = 1'b1;
          6'h10: out_r[3] = 1'b1;
          6'h12: out_r[3] = 1'b1;
          6'h14: out_r[3] = 1'b1;
          6'h15: out_r[3] = 1'b1;
          6'h16: out_r[3] = 1'b1;
          6'h17: out_r[3] = 1'b1;
          6'h1b: out_r[3] = 1'b1;
          6'h1c: out_r[3] = 1'b1;
          6'h1d: out_r[3] = 1'b1;
          6'h20: out_r[3] = 1'b1;
          6'h21: out_r[3] = 1'b1;
          6'h25: out_r[3] = 1'b1;
          6'h26: out_r[3] = 1'b1;
          6'h27: out_r[3] = 1'b1;
          6'h30: out_r[3] = 1'b1;
          6'h31: out_r[3] = 1'b1;
          6'h32: out_r[3] = 1'b1;
          6'h33: out_r[3] = 1'b1;
          6'h34: out_r[3] = 1'b1;
          6'h36: out_r[3] = 1'b1;
          6'h37: out_r[3] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[4] = 1'b1;
          6'h01: out_r[4] = 1'b1;
          6'h02: out_r[4] = 1'b1;
          6'h03: out_r[4] = 1'b1;
          6'h05: out_r[4] = 1'b1;
          6'h09: out_r[4] = 1'b1;
          6'h0a: out_r[4] = 1'b1;
          6'h0b: out_r[4] = 1'b1;
          6'h12: out_r[4] = 1'b1;
          6'h15: out_r[4] = 1'b1;
          6'h16: out_r[4] = 1'b1;
          6'h19: out_r[4] = 1'b1;
          6'h1b: out_r[4] = 1'b1;
          6'h1c: out_r[4] = 1'b1;
          6'h1d: out_r[4] = 1'b1;
          6'h1e: out_r[4] = 1'b1;
          6'h1f: out_r[4] = 1'b1;
          6'h20: out_r[4] = 1'b1;
          6'h21: out_r[4] = 1'b1;
          6'h25: out_r[4] = 1'b1;
          6'h26: out_r[4] = 1'b1;
          6'h27: out_r[4] = 1'b1;
          6'h29: out_r[4] = 1'b1;
          6'h31: out_r[4] = 1'b1;
          6'h32: out_r[4] = 1'b1;
          6'h33: out_r[4] = 1'b1;
          6'h34: out_r[4] = 1'b1;
          6'h35: out_r[4] = 1'b1;
          6'h36: out_r[4] = 1'b1;
          6'h37: out_r[4] = 1'b1;
          6'h39: out_r[4] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h0a: out_r[5] = 1'b0;
          6'h0b: out_r[5] = 1'b0;
          6'h11: out_r[5] = 1'b0;
          6'h15: out_r[5] = 1'b0;
          6'h18: out_r[5] = 1'b0;
          6'h1a: out_r[5] = 1'b0;
          6'h1c: out_r[5] = 1'b0;
          6'h1d: out_r[5] = 1'b0;
          6'h1e: out_r[5] = 1'b0;
          6'h1f: out_r[5] = 1'b0;
          6'h28: out_r[5] = 1'b0;
          6'h2a: out_r[5] = 1'b0;
          6'h2b: out_r[5] = 1'b0;
          6'h2d: out_r[5] = 1'b0;
          6'h31: out_r[5] = 1'b0;
          6'h32: out_r[5] = 1'b0;
          6'h33: out_r[5] = 1'b0;
          6'h34: out_r[5] = 1'b0;
          6'h35: out_r[5] = 1'b0;
          6'h38: out_r[5] = 1'b0;
          6'h3a: out_r[5] = 1'b0;
          6'h3b: out_r[5] = 1'b0;
          6'h3d: out_r[5] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h04: out_r[6] = 1'b0;
          6'h06: out_r[6] = 1'b0;
          6'h07: out_r[6] = 1'b0;
          6'h0a: out_r[6] = 1'b0;
          6'h0b: out_r[6] = 1'b0;
          6'h11: out_r[6] = 1'b0;
          6'h12: out_r[6] = 1'b0;
          6'h15: out_r[6] = 1'b0;
          6'h18: out_r[6] = 1'b0;
          6'h19: out_r[6] = 1'b0;
          6'h1a: out_r[6] = 1'b0;
          6'h1c: out_r[6] = 1'b0;
          6'h1d: out_r[6] = 1'b0;
          6'h1e: out_r[6] = 1'b0;
          6'h1f: out_r[6] = 1'b0;
          6'h21: out_r[6] = 1'b0;
          6'h22: out_r[6] = 1'b0;
          6'h23: out_r[6] = 1'b0;
          6'h25: out_r[6] = 1'b0;
          6'h26: out_r[6] = 1'b0;
          6'h27: out_r[6] = 1'b0;
          6'h29: out_r[6] = 1'b0;
          6'h2c: out_r[6] = 1'b0;
          6'h32: out_r[6] = 1'b0;
          6'h33: out_r[6] = 1'b0;
          6'h34: out_r[6] = 1'b0;
          6'h35: out_r[6] = 1'b0;
          6'h36: out_r[6] = 1'b0;
          6'h37: out_r[6] = 1'b0;
          6'h39: out_r[6] = 1'b0;
          6'h3c: out_r[6] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[7] = 1'b0;
          6'h01: out_r[7] = 1'b0;
          6'h02: out_r[7] = 1'b0;
          6'h03: out_r[7] = 1'b0;
          6'h05: out_r[7] = 1'b0;
          6'h0a: out_r[7] = 1'b0;
          6'h0b: out_r[7] = 1'b0;
          6'h13: out_r[7] = 1'b0;
          6'h16: out_r[7] = 1'b0;
          6'h17: out_r[7] = 1'b0;
          6'h18: out_r[7] = 1'b0;
          6'h1c: out_r[7] = 1'b0;
          6'h1e: out_r[7] = 1'b0;
          6'h20: out_r[7] = 1'b0;
          6'h24: out_r[7] = 1'b0;
          6'h28: out_r[7] = 1'b0;
          6'h2a: out_r[7] = 1'b0;
          6'h2b: out_r[7] = 1'b0;
          6'h2d: out_r[7] = 1'b0;
          6'h2e: out_r[7] = 1'b0;
          6'h2f: out_r[7] = 1'b0;
          6'h31: out_r[7] = 1'b0;
          6'h34: out_r[7] = 1'b0;
          6'h38: out_r[7] = 1'b0;
          6'h3a: out_r[7] = 1'b0;
          6'h3b: out_r[7] = 1'b0;
          6'h3d: out_r[7] = 1'b0;
          6'h3e: out_r[7] = 1'b0;
          6'h3f: out_r[7] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[8] = 1'b0;
          6'h01: out_r[8] = 1'b0;
          6'h02: out_r[8] = 1'b0;
          6'h03: out_r[8] = 1'b0;
          6'h08: out_r[8] = 1'b0;
          6'h0c: out_r[8] = 1'b0;
          6'h0d: out_r[8] = 1'b0;
          6'h0e: out_r[8] = 1'b0;
          6'h0f: out_r[8] = 1'b0;
          6'h17: out_r[8] = 1'b0;
          6'h20: out_r[8] = 1'b0;
          6'h24: out_r[8] = 1'b0;
          6'h28: out_r[8] = 1'b0;
          6'h2d: out_r[8] = 1'b0;
          6'h2e: out_r[8] = 1'b0;
          6'h2f: out_r[8] = 1'b0;
          6'h34: out_r[8] = 1'b0;
          6'h38: out_r[8] = 1'b0;
          6'h3d: out_r[8] = 1'b0;
          6'h3e: out_r[8] = 1'b0;
          6'h3f: out_r[8] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h02: out_r[9] = 1'b1;
          6'h03: out_r[9] = 1'b1;
          6'h04: out_r[9] = 1'b1;
          6'h06: out_r[9] = 1'b1;
          6'h07: out_r[9] = 1'b1;
          6'h11: out_r[9] = 1'b1;
          6'h17: out_r[9] = 1'b1;
          6'h1a: out_r[9] = 1'b1;
          6'h21: out_r[9] = 1'b1;
          6'h22: out_r[9] = 1'b1;
          6'h23: out_r[9] = 1'b1;
          6'h25: out_r[9] = 1'b1;
          6'h26: out_r[9] = 1'b1;
          6'h27: out_r[9] = 1'b1;
          6'h2c: out_r[9] = 1'b1;
          6'h2e: out_r[9] = 1'b1;
          6'h2f: out_r[9] = 1'b1;
          6'h36: out_r[9] = 1'b1;
          6'h37: out_r[9] = 1'b1;
          6'h3c: out_r[9] = 1'b1;
          6'h3e: out_r[9] = 1'b1;
          6'h3f: out_r[9] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h02: out_r[10] = 1'b0;
          6'h03: out_r[10] = 1'b0;
          6'h0c: out_r[10] = 1'b0;
          6'h10: out_r[10] = 1'b0;
          6'h11: out_r[10] = 1'b0;
          6'h14: out_r[10] = 1'b0;
          6'h16: out_r[10] = 1'b0;
          6'h17: out_r[10] = 1'b0;
          6'h21: out_r[10] = 1'b0;
          6'h22: out_r[10] = 1'b0;
          6'h23: out_r[10] = 1'b0;
          6'h24: out_r[10] = 1'b0;
          6'h25: out_r[10] = 1'b0;
          6'h2e: out_r[10] = 1'b0;
          6'h2f: out_r[10] = 1'b0;
          6'h31: out_r[10] = 1'b0;
          6'h3e: out_r[10] = 1'b0;
          6'h3f: out_r[10] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[11] = 1'b0;
          6'h08: out_r[11] = 1'b0;
          6'h09: out_r[11] = 1'b0;
          6'h0a: out_r[11] = 1'b0;
          6'h0b: out_r[11] = 1'b0;
          6'h0d: out_r[11] = 1'b0;
          6'h0e: out_r[11] = 1'b0;
          6'h0f: out_r[11] = 1'b0;
          6'h12: out_r[11] = 1'b0;
          6'h13: out_r[11] = 1'b0;
          6'h15: out_r[11] = 1'b0;
          6'h18: out_r[11] = 1'b0;
          6'h19: out_r[11] = 1'b0;
          6'h1b: out_r[11] = 1'b0;
          6'h1c: out_r[11] = 1'b0;
          6'h1d: out_r[11] = 1'b0;
          6'h1e: out_r[11] = 1'b0;
          6'h1f: out_r[11] = 1'b0;
          6'h25: out_r[11] = 1'b0;
          6'h29: out_r[11] = 1'b0;
          6'h2e: out_r[11] = 1'b0;
          6'h2f: out_r[11] = 1'b0;
          6'h32: out_r[11] = 1'b0;
          6'h33: out_r[11] = 1'b0;
          6'h34: out_r[11] = 1'b0;
          6'h35: out_r[11] = 1'b0;
          6'h39: out_r[11] = 1'b0;
          6'h3e: out_r[11] = 1'b0;
          6'h3f: out_r[11] = 1'b0;
          default: begin end
        endcase
      end
      6'h2f: begin
        out_r = 12'h8ea;
        case (inner)
          6'h00: out_r[0] = 1'b1;
          6'h01: out_r[0] = 1'b1;
          6'h04: out_r[0] = 1'b1;
          6'h05: out_r[0] = 1'b1;
          6'h09: out_r[0] = 1'b1;
          6'h0a: out_r[0] = 1'b1;
          6'h0d: out_r[0] = 1'b1;
          6'h0e: out_r[0] = 1'b1;
          6'h10: out_r[0] = 1'b1;
          6'h11: out_r[0] = 1'b1;
          6'h12: out_r[0] = 1'b1;
          6'h16: out_r[0] = 1'b1;
          6'h18: out_r[0] = 1'b1;
          6'h19: out_r[0] = 1'b1;
          6'h1a: out_r[0] = 1'b1;
          6'h1d: out_r[0] = 1'b1;
          6'h1e: out_r[0] = 1'b1;
          6'h20: out_r[0] = 1'b1;
          6'h21: out_r[0] = 1'b1;
          6'h22: out_r[0] = 1'b1;
          6'h25: out_r[0] = 1'b1;
          6'h26: out_r[0] = 1'b1;
          6'h28: out_r[0] = 1'b1;
          6'h2a: out_r[0] = 1'b1;
          6'h2e: out_r[0] = 1'b1;
          6'h34: out_r[0] = 1'b1;
          6'h36: out_r[0] = 1'b1;
          6'h38: out_r[0] = 1'b1;
          6'h3a: out_r[0] = 1'b1;
          6'h3e: out_r[0] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h03: out_r[1] = 1'b0;
          6'h07: out_r[1] = 1'b0;
          6'h0b: out_r[1] = 1'b0;
          6'h0f: out_r[1] = 1'b0;
          6'h10: out_r[1] = 1'b0;
          6'h13: out_r[1] = 1'b0;
          6'h17: out_r[1] = 1'b0;
          6'h18: out_r[1] = 1'b0;
          6'h1a: out_r[1] = 1'b0;
          6'h1b: out_r[1] = 1'b0;
          6'h1d: out_r[1] = 1'b0;
          6'h1f: out_r[1] = 1'b0;
          6'h21: out_r[1] = 1'b0;
          6'h22: out_r[1] = 1'b0;
          6'h23: out_r[1] = 1'b0;
          6'h26: out_r[1] = 1'b0;
          6'h27: out_r[1] = 1'b0;
          6'h28: out_r[1] = 1'b0;
          6'h2a: out_r[1] = 1'b0;
          6'h2b: out_r[1] = 1'b0;
          6'h2f: out_r[1] = 1'b0;
          6'h30: out_r[1] = 1'b0;
          6'h33: out_r[1] = 1'b0;
          6'h37: out_r[1] = 1'b0;
          6'h38: out_r[1] = 1'b0;
          6'h3a: out_r[1] = 1'b0;
          6'h3b: out_r[1] = 1'b0;
          6'h3f: out_r[1] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h03: out_r[2] = 1'b1;
          6'h04: out_r[2] = 1'b1;
          6'h07: out_r[2] = 1'b1;
          6'h08: out_r[2] = 1'b1;
          6'h09: out_r[2] = 1'b1;
          6'h0b: out_r[2] = 1'b1;
          6'h0c: out_r[2] = 1'b1;
          6'h0f: out_r[2] = 1'b1;
          6'h12: out_r[2] = 1'b1;
          6'h14: out_r[2] = 1'b1;
          6'h15: out_r[2] = 1'b1;
          6'h1b: out_r[2] = 1'b1;
          6'h1c: out_r[2] = 1'b1;
          6'h1d: out_r[2] = 1'b1;
          6'h1f: out_r[2] = 1'b1;
          6'h25: out_r[2] = 1'b1;
          6'h29: out_r[2] = 1'b1;
          6'h2c: out_r[2] = 1'b1;
          6'h2d: out_r[2] = 1'b1;
          6'h30: out_r[2] = 1'b1;
          6'h31: out_r[2] = 1'b1;
          6'h32: out_r[2] = 1'b1;
          6'h34: out_r[2] = 1'b1;
          6'h35: out_r[2] = 1'b1;
          6'h39: out_r[2] = 1'b1;
          6'h3c: out_r[2] = 1'b1;
          6'h3d: out_r[2] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h03: out_r[3] = 1'b0;
          6'h04: out_r[3] = 1'b0;
          6'h07: out_r[3] = 1'b0;
          6'h09: out_r[3] = 1'b0;
          6'h0b: out_r[3] = 1'b0;
          6'h0e: out_r[3] = 1'b0;
          6'h0f: out_r[3] = 1'b0;
          6'h15: out_r[3] = 1'b0;
          6'h16: out_r[3] = 1'b0;
          6'h1b: out_r[3] = 1'b0;
          6'h1c: out_r[3] = 1'b0;
          6'h1d: out_r[3] = 1'b0;
          6'h1e: out_r[3] = 1'b0;
          6'h1f: out_r[3] = 1'b0;
          6'h25: out_r[3] = 1'b0;
          6'h28: out_r[3] = 1'b0;
          6'h29: out_r[3] = 1'b0;
          6'h2e: out_r[3] = 1'b0;
          6'h2f: out_r[3] = 1'b0;
          6'h34: out_r[3] = 1'b0;
          6'h36: out_r[3] = 1'b0;
          6'h38: out_r[3] = 1'b0;
          6'h39: out_r[3] = 1'b0;
          6'h3e: out_r[3] = 1'b0;
          6'h3f: out_r[3] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[4] = 1'b1;
          6'h02: out_r[4] = 1'b1;
          6'h05: out_r[4] = 1'b1;
          6'h06: out_r[4] = 1'b1;
          6'h0d: out_r[4] = 1'b1;
          6'h10: out_r[4] = 1'b1;
          6'h11: out_r[4] = 1'b1;
          6'h13: out_r[4] = 1'b1;
          6'h17: out_r[4] = 1'b1;
          6'h18: out_r[4] = 1'b1;
          6'h19: out_r[4] = 1'b1;
          6'h23: out_r[4] = 1'b1;
          6'h24: out_r[4] = 1'b1;
          6'h27: out_r[4] = 1'b1;
          6'h28: out_r[4] = 1'b1;
          6'h30: out_r[4] = 1'b1;
          6'h32: out_r[4] = 1'b1;
          6'h33: out_r[4] = 1'b1;
          6'h37: out_r[4] = 1'b1;
          6'h38: out_r[4] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h10: out_r[5] = 1'b0;
          6'h18: out_r[5] = 1'b0;
          6'h19: out_r[5] = 1'b0;
          6'h1b: out_r[5] = 1'b0;
          6'h30: out_r[5] = 1'b0;
          6'h34: out_r[5] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h03: out_r[6] = 1'b0;
          6'h07: out_r[6] = 1'b0;
          6'h0b: out_r[6] = 1'b0;
          6'h0f: out_r[6] = 1'b0;
          6'h10: out_r[6] = 1'b0;
          6'h11: out_r[6] = 1'b0;
          6'h14: out_r[6] = 1'b0;
          6'h16: out_r[6] = 1'b0;
          6'h18: out_r[6] = 1'b0;
          6'h19: out_r[6] = 1'b0;
          6'h1c: out_r[6] = 1'b0;
          6'h1e: out_r[6] = 1'b0;
          6'h30: out_r[6] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[7] = 1'b0;
          6'h02: out_r[7] = 1'b0;
          6'h04: out_r[7] = 1'b0;
          6'h05: out_r[7] = 1'b0;
          6'h06: out_r[7] = 1'b0;
          6'h08: out_r[7] = 1'b0;
          6'h09: out_r[7] = 1'b0;
          6'h0d: out_r[7] = 1'b0;
          6'h13: out_r[7] = 1'b0;
          6'h15: out_r[7] = 1'b0;
          6'h17: out_r[7] = 1'b0;
          6'h1b: out_r[7] = 1'b0;
          6'h1d: out_r[7] = 1'b0;
          6'h1f: out_r[7] = 1'b0;
          6'h22: out_r[7] = 1'b0;
          6'h23: out_r[7] = 1'b0;
          6'h24: out_r[7] = 1'b0;
          6'h26: out_r[7] = 1'b0;
          6'h27: out_r[7] = 1'b0;
          6'h28: out_r[7] = 1'b0;
          6'h29: out_r[7] = 1'b0;
          6'h2a: out_r[7] = 1'b0;
          6'h32: out_r[7] = 1'b0;
          6'h33: out_r[7] = 1'b0;
          6'h37: out_r[7] = 1'b0;
          6'h38: out_r[7] = 1'b0;
          6'h39: out_r[7] = 1'b0;
          6'h3a: out_r[7] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h01: out_r[8] = 1'b1;
          6'h03: out_r[8] = 1'b1;
          6'h07: out_r[8] = 1'b1;
          6'h0b: out_r[8] = 1'b1;
          6'h0f: out_r[8] = 1'b1;
          6'h10: out_r[8] = 1'b1;
          6'h11: out_r[8] = 1'b1;
          6'h12: out_r[8] = 1'b1;
          6'h13: out_r[8] = 1'b1;
          6'h14: out_r[8] = 1'b1;
          6'h16: out_r[8] = 1'b1;
          6'h17: out_r[8] = 1'b1;
          6'h18: out_r[8] = 1'b1;
          6'h19: out_r[8] = 1'b1;
          6'h1a: out_r[8] = 1'b1;
          6'h1b: out_r[8] = 1'b1;
          6'h1c: out_r[8] = 1'b1;
          6'h1e: out_r[8] = 1'b1;
          6'h1f: out_r[8] = 1'b1;
          6'h20: out_r[8] = 1'b1;
          6'h24: out_r[8] = 1'b1;
          6'h25: out_r[8] = 1'b1;
          6'h2e: out_r[8] = 1'b1;
          6'h30: out_r[8] = 1'b1;
          6'h31: out_r[8] = 1'b1;
          6'h32: out_r[8] = 1'b1;
          6'h34: out_r[8] = 1'b1;
          6'h35: out_r[8] = 1'b1;
          6'h36: out_r[8] = 1'b1;
          6'h3e: out_r[8] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h03: out_r[9] = 1'b1;
          6'h04: out_r[9] = 1'b1;
          6'h05: out_r[9] = 1'b1;
          6'h07: out_r[9] = 1'b1;
          6'h0b: out_r[9] = 1'b1;
          6'h0f: out_r[9] = 1'b1;
          6'h11: out_r[9] = 1'b1;
          6'h14: out_r[9] = 1'b1;
          6'h15: out_r[9] = 1'b1;
          6'h16: out_r[9] = 1'b1;
          6'h1c: out_r[9] = 1'b1;
          6'h1d: out_r[9] = 1'b1;
          6'h1e: out_r[9] = 1'b1;
          6'h21: out_r[9] = 1'b1;
          6'h23: out_r[9] = 1'b1;
          6'h27: out_r[9] = 1'b1;
          6'h28: out_r[9] = 1'b1;
          6'h29: out_r[9] = 1'b1;
          6'h2b: out_r[9] = 1'b1;
          6'h2c: out_r[9] = 1'b1;
          6'h2d: out_r[9] = 1'b1;
          6'h2f: out_r[9] = 1'b1;
          6'h33: out_r[9] = 1'b1;
          6'h37: out_r[9] = 1'b1;
          6'h38: out_r[9] = 1'b1;
          6'h39: out_r[9] = 1'b1;
          6'h3b: out_r[9] = 1'b1;
          6'h3c: out_r[9] = 1'b1;
          6'h3d: out_r[9] = 1'b1;
          6'h3f: out_r[9] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h02: out_r[10] = 1'b1;
          6'h03: out_r[10] = 1'b1;
          6'h06: out_r[10] = 1'b1;
          6'h07: out_r[10] = 1'b1;
          6'h08: out_r[10] = 1'b1;
          6'h0b: out_r[10] = 1'b1;
          6'h0f: out_r[10] = 1'b1;
          6'h13: out_r[10] = 1'b1;
          6'h17: out_r[10] = 1'b1;
          6'h1a: out_r[10] = 1'b1;
          6'h1b: out_r[10] = 1'b1;
          6'h1c: out_r[10] = 1'b1;
          6'h1f: out_r[10] = 1'b1;
          6'h22: out_r[10] = 1'b1;
          6'h24: out_r[10] = 1'b1;
          6'h26: out_r[10] = 1'b1;
          6'h2a: out_r[10] = 1'b1;
          6'h30: out_r[10] = 1'b1;
          6'h31: out_r[10] = 1'b1;
          6'h32: out_r[10] = 1'b1;
          6'h35: out_r[10] = 1'b1;
          6'h3a: out_r[10] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h02: out_r[11] = 1'b0;
          6'h05: out_r[11] = 1'b0;
          6'h06: out_r[11] = 1'b0;
          6'h15: out_r[11] = 1'b0;
          6'h1a: out_r[11] = 1'b0;
          6'h23: out_r[11] = 1'b0;
          6'h24: out_r[11] = 1'b0;
          6'h27: out_r[11] = 1'b0;
          6'h2b: out_r[11] = 1'b0;
          6'h2d: out_r[11] = 1'b0;
          6'h2f: out_r[11] = 1'b0;
          6'h30: out_r[11] = 1'b0;
          6'h31: out_r[11] = 1'b0;
          6'h33: out_r[11] = 1'b0;
          6'h35: out_r[11] = 1'b0;
          6'h37: out_r[11] = 1'b0;
          6'h3b: out_r[11] = 1'b0;
          6'h3d: out_r[11] = 1'b0;
          6'h3f: out_r[11] = 1'b0;
          default: begin end
        endcase
      end
      6'h30: begin
        out_r = 12'he40;
        case (inner)
          6'h00: out_r[0] = 1'b1;
          6'h03: out_r[0] = 1'b1;
          6'h05: out_r[0] = 1'b1;
          6'h06: out_r[0] = 1'b1;
          6'h08: out_r[0] = 1'b1;
          6'h09: out_r[0] = 1'b1;
          6'h0b: out_r[0] = 1'b1;
          6'h0c: out_r[0] = 1'b1;
          6'h0d: out_r[0] = 1'b1;
          6'h0f: out_r[0] = 1'b1;
          6'h10: out_r[0] = 1'b1;
          6'h11: out_r[0] = 1'b1;
          6'h13: out_r[0] = 1'b1;
          6'h14: out_r[0] = 1'b1;
          6'h15: out_r[0] = 1'b1;
          6'h16: out_r[0] = 1'b1;
          6'h18: out_r[0] = 1'b1;
          6'h19: out_r[0] = 1'b1;
          6'h1b: out_r[0] = 1'b1;
          6'h1c: out_r[0] = 1'b1;
          6'h1d: out_r[0] = 1'b1;
          6'h1e: out_r[0] = 1'b1;
          6'h1f: out_r[0] = 1'b1;
          6'h24: out_r[0] = 1'b1;
          6'h25: out_r[0] = 1'b1;
          6'h26: out_r[0] = 1'b1;
          6'h2f: out_r[0] = 1'b1;
          6'h34: out_r[0] = 1'b1;
          6'h35: out_r[0] = 1'b1;
          6'h36: out_r[0] = 1'b1;
          6'h3c: out_r[0] = 1'b1;
          6'h3d: out_r[0] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h05: out_r[1] = 1'b1;
          6'h06: out_r[1] = 1'b1;
          6'h07: out_r[1] = 1'b1;
          6'h08: out_r[1] = 1'b1;
          6'h0a: out_r[1] = 1'b1;
          6'h0b: out_r[1] = 1'b1;
          6'h0c: out_r[1] = 1'b1;
          6'h0f: out_r[1] = 1'b1;
          6'h10: out_r[1] = 1'b1;
          6'h11: out_r[1] = 1'b1;
          6'h13: out_r[1] = 1'b1;
          6'h14: out_r[1] = 1'b1;
          6'h16: out_r[1] = 1'b1;
          6'h17: out_r[1] = 1'b1;
          6'h18: out_r[1] = 1'b1;
          6'h19: out_r[1] = 1'b1;
          6'h1b: out_r[1] = 1'b1;
          6'h1c: out_r[1] = 1'b1;
          6'h1e: out_r[1] = 1'b1;
          6'h1f: out_r[1] = 1'b1;
          6'h21: out_r[1] = 1'b1;
          6'h23: out_r[1] = 1'b1;
          6'h29: out_r[1] = 1'b1;
          6'h2b: out_r[1] = 1'b1;
          6'h2c: out_r[1] = 1'b1;
          6'h2f: out_r[1] = 1'b1;
          6'h31: out_r[1] = 1'b1;
          6'h33: out_r[1] = 1'b1;
          6'h39: out_r[1] = 1'b1;
          6'h3b: out_r[1] = 1'b1;
          6'h3f: out_r[1] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[2] = 1'b1;
          6'h01: out_r[2] = 1'b1;
          6'h03: out_r[2] = 1'b1;
          6'h04: out_r[2] = 1'b1;
          6'h05: out_r[2] = 1'b1;
          6'h09: out_r[2] = 1'b1;
          6'h0b: out_r[2] = 1'b1;
          6'h0c: out_r[2] = 1'b1;
          6'h0d: out_r[2] = 1'b1;
          6'h11: out_r[2] = 1'b1;
          6'h12: out_r[2] = 1'b1;
          6'h13: out_r[2] = 1'b1;
          6'h14: out_r[2] = 1'b1;
          6'h15: out_r[2] = 1'b1;
          6'h19: out_r[2] = 1'b1;
          6'h1a: out_r[2] = 1'b1;
          6'h1b: out_r[2] = 1'b1;
          6'h1c: out_r[2] = 1'b1;
          6'h1d: out_r[2] = 1'b1;
          6'h24: out_r[2] = 1'b1;
          6'h25: out_r[2] = 1'b1;
          6'h26: out_r[2] = 1'b1;
          6'h27: out_r[2] = 1'b1;
          6'h2c: out_r[2] = 1'b1;
          6'h2d: out_r[2] = 1'b1;
          6'h2f: out_r[2] = 1'b1;
          6'h34: out_r[2] = 1'b1;
          6'h35: out_r[2] = 1'b1;
          6'h36: out_r[2] = 1'b1;
          6'h37: out_r[2] = 1'b1;
          6'h3c: out_r[2] = 1'b1;
          6'h3d: out_r[2] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[3] = 1'b1;
          6'h01: out_r[3] = 1'b1;
          6'h03: out_r[3] = 1'b1;
          6'h04: out_r[3] = 1'b1;
          6'h05: out_r[3] = 1'b1;
          6'h09: out_r[3] = 1'b1;
          6'h0a: out_r[3] = 1'b1;
          6'h0c: out_r[3] = 1'b1;
          6'h0d: out_r[3] = 1'b1;
          6'h11: out_r[3] = 1'b1;
          6'h12: out_r[3] = 1'b1;
          6'h14: out_r[3] = 1'b1;
          6'h15: out_r[3] = 1'b1;
          6'h19: out_r[3] = 1'b1;
          6'h1a: out_r[3] = 1'b1;
          6'h1c: out_r[3] = 1'b1;
          6'h1d: out_r[3] = 1'b1;
          6'h1e: out_r[3] = 1'b1;
          6'h22: out_r[3] = 1'b1;
          6'h23: out_r[3] = 1'b1;
          6'h2a: out_r[3] = 1'b1;
          6'h2b: out_r[3] = 1'b1;
          6'h32: out_r[3] = 1'b1;
          6'h33: out_r[3] = 1'b1;
          6'h35: out_r[3] = 1'b1;
          6'h3a: out_r[3] = 1'b1;
          6'h3b: out_r[3] = 1'b1;
          6'h3d: out_r[3] = 1'b1;
          6'h3e: out_r[3] = 1'b1;
          6'h3f: out_r[3] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[4] = 1'b1;
          6'h01: out_r[4] = 1'b1;
          6'h02: out_r[4] = 1'b1;
          6'h03: out_r[4] = 1'b1;
          6'h0a: out_r[4] = 1'b1;
          6'h0b: out_r[4] = 1'b1;
          6'h0c: out_r[4] = 1'b1;
          6'h0d: out_r[4] = 1'b1;
          6'h0e: out_r[4] = 1'b1;
          6'h12: out_r[4] = 1'b1;
          6'h13: out_r[4] = 1'b1;
          6'h16: out_r[4] = 1'b1;
          6'h1a: out_r[4] = 1'b1;
          6'h1b: out_r[4] = 1'b1;
          6'h24: out_r[4] = 1'b1;
          6'h25: out_r[4] = 1'b1;
          6'h26: out_r[4] = 1'b1;
          6'h27: out_r[4] = 1'b1;
          6'h2c: out_r[4] = 1'b1;
          6'h2d: out_r[4] = 1'b1;
          6'h2e: out_r[4] = 1'b1;
          6'h2f: out_r[4] = 1'b1;
          6'h34: out_r[4] = 1'b1;
          6'h35: out_r[4] = 1'b1;
          6'h36: out_r[4] = 1'b1;
          6'h37: out_r[4] = 1'b1;
          6'h3c: out_r[4] = 1'b1;
          6'h3d: out_r[4] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[5] = 1'b1;
          6'h02: out_r[5] = 1'b1;
          6'h03: out_r[5] = 1'b1;
          6'h06: out_r[5] = 1'b1;
          6'h0b: out_r[5] = 1'b1;
          6'h0c: out_r[5] = 1'b1;
          6'h0e: out_r[5] = 1'b1;
          6'h12: out_r[5] = 1'b1;
          6'h13: out_r[5] = 1'b1;
          6'h14: out_r[5] = 1'b1;
          6'h15: out_r[5] = 1'b1;
          6'h16: out_r[5] = 1'b1;
          6'h1a: out_r[5] = 1'b1;
          6'h1b: out_r[5] = 1'b1;
          6'h1c: out_r[5] = 1'b1;
          6'h1d: out_r[5] = 1'b1;
          6'h1e: out_r[5] = 1'b1;
          6'h25: out_r[5] = 1'b1;
          6'h28: out_r[5] = 1'b1;
          6'h29: out_r[5] = 1'b1;
          6'h2a: out_r[5] = 1'b1;
          6'h2b: out_r[5] = 1'b1;
          6'h2c: out_r[5] = 1'b1;
          6'h2d: out_r[5] = 1'b1;
          6'h2e: out_r[5] = 1'b1;
          6'h2f: out_r[5] = 1'b1;
          6'h35: out_r[5] = 1'b1;
          6'h3d: out_r[5] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h02: out_r[6] = 1'b0;
          6'h03: out_r[6] = 1'b0;
          6'h06: out_r[6] = 1'b0;
          6'h07: out_r[6] = 1'b0;
          6'h08: out_r[6] = 1'b0;
          6'h09: out_r[6] = 1'b0;
          6'h0b: out_r[6] = 1'b0;
          6'h0e: out_r[6] = 1'b0;
          6'h0f: out_r[6] = 1'b0;
          6'h10: out_r[6] = 1'b0;
          6'h11: out_r[6] = 1'b0;
          6'h12: out_r[6] = 1'b0;
          6'h14: out_r[6] = 1'b0;
          6'h15: out_r[6] = 1'b0;
          6'h18: out_r[6] = 1'b0;
          6'h19: out_r[6] = 1'b0;
          6'h1a: out_r[6] = 1'b0;
          6'h1c: out_r[6] = 1'b0;
          6'h1d: out_r[6] = 1'b0;
          6'h1f: out_r[6] = 1'b0;
          6'h25: out_r[6] = 1'b0;
          6'h28: out_r[6] = 1'b0;
          6'h29: out_r[6] = 1'b0;
          6'h2a: out_r[6] = 1'b0;
          6'h2b: out_r[6] = 1'b0;
          6'h2c: out_r[6] = 1'b0;
          6'h2d: out_r[6] = 1'b0;
          6'h2e: out_r[6] = 1'b0;
          6'h35: out_r[6] = 1'b0;
          6'h3d: out_r[6] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[7] = 1'b1;
          6'h01: out_r[7] = 1'b1;
          6'h04: out_r[7] = 1'b1;
          6'h05: out_r[7] = 1'b1;
          6'h0a: out_r[7] = 1'b1;
          6'h0d: out_r[7] = 1'b1;
          6'h0e: out_r[7] = 1'b1;
          6'h12: out_r[7] = 1'b1;
          6'h15: out_r[7] = 1'b1;
          6'h16: out_r[7] = 1'b1;
          6'h1a: out_r[7] = 1'b1;
          6'h1d: out_r[7] = 1'b1;
          6'h3f: out_r[7] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[8] = 1'b1;
          6'h04: out_r[8] = 1'b1;
          6'h05: out_r[8] = 1'b1;
          6'h06: out_r[8] = 1'b1;
          6'h07: out_r[8] = 1'b1;
          6'h09: out_r[8] = 1'b1;
          6'h0c: out_r[8] = 1'b1;
          6'h0d: out_r[8] = 1'b1;
          6'h13: out_r[8] = 1'b1;
          6'h14: out_r[8] = 1'b1;
          6'h16: out_r[8] = 1'b1;
          6'h17: out_r[8] = 1'b1;
          6'h1b: out_r[8] = 1'b1;
          6'h1c: out_r[8] = 1'b1;
          6'h1e: out_r[8] = 1'b1;
          6'h24: out_r[8] = 1'b1;
          6'h26: out_r[8] = 1'b1;
          6'h27: out_r[8] = 1'b1;
          6'h2c: out_r[8] = 1'b1;
          6'h2e: out_r[8] = 1'b1;
          6'h2f: out_r[8] = 1'b1;
          6'h34: out_r[8] = 1'b1;
          6'h36: out_r[8] = 1'b1;
          6'h37: out_r[8] = 1'b1;
          6'h3c: out_r[8] = 1'b1;
          6'h3e: out_r[8] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h24: out_r[9] = 1'b0;
          6'h25: out_r[9] = 1'b0;
          6'h26: out_r[9] = 1'b0;
          6'h27: out_r[9] = 1'b0;
          6'h2c: out_r[9] = 1'b0;
          6'h2e: out_r[9] = 1'b0;
          6'h34: out_r[9] = 1'b0;
          6'h35: out_r[9] = 1'b0;
          6'h36: out_r[9] = 1'b0;
          6'h37: out_r[9] = 1'b0;
          6'h3c: out_r[9] = 1'b0;
          6'h3d: out_r[9] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h05: out_r[10] = 1'b0;
          6'h06: out_r[10] = 1'b0;
          6'h08: out_r[10] = 1'b0;
          6'h0b: out_r[10] = 1'b0;
          6'h0c: out_r[10] = 1'b0;
          6'h0f: out_r[10] = 1'b0;
          6'h10: out_r[10] = 1'b0;
          6'h11: out_r[10] = 1'b0;
          6'h13: out_r[10] = 1'b0;
          6'h14: out_r[10] = 1'b0;
          6'h16: out_r[10] = 1'b0;
          6'h18: out_r[10] = 1'b0;
          6'h19: out_r[10] = 1'b0;
          6'h1b: out_r[10] = 1'b0;
          6'h1c: out_r[10] = 1'b0;
          6'h1e: out_r[10] = 1'b0;
          6'h1f: out_r[10] = 1'b0;
          6'h24: out_r[10] = 1'b0;
          6'h25: out_r[10] = 1'b0;
          6'h26: out_r[10] = 1'b0;
          6'h27: out_r[10] = 1'b0;
          6'h2c: out_r[10] = 1'b0;
          6'h2f: out_r[10] = 1'b0;
          6'h34: out_r[10] = 1'b0;
          6'h36: out_r[10] = 1'b0;
          6'h37: out_r[10] = 1'b0;
          6'h3c: out_r[10] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[11] = 1'b0;
          6'h01: out_r[11] = 1'b0;
          6'h02: out_r[11] = 1'b0;
          6'h03: out_r[11] = 1'b0;
          6'h04: out_r[11] = 1'b0;
          6'h07: out_r[11] = 1'b0;
          6'h09: out_r[11] = 1'b0;
          6'h0a: out_r[11] = 1'b0;
          6'h0d: out_r[11] = 1'b0;
          6'h0e: out_r[11] = 1'b0;
          6'h12: out_r[11] = 1'b0;
          6'h15: out_r[11] = 1'b0;
          6'h17: out_r[11] = 1'b0;
          6'h1a: out_r[11] = 1'b0;
          6'h1d: out_r[11] = 1'b0;
          6'h24: out_r[11] = 1'b0;
          6'h26: out_r[11] = 1'b0;
          6'h27: out_r[11] = 1'b0;
          6'h2c: out_r[11] = 1'b0;
          6'h2d: out_r[11] = 1'b0;
          6'h2e: out_r[11] = 1'b0;
          6'h34: out_r[11] = 1'b0;
          6'h36: out_r[11] = 1'b0;
          6'h37: out_r[11] = 1'b0;
          6'h3c: out_r[11] = 1'b0;
          6'h3e: out_r[11] = 1'b0;
          6'h3f: out_r[11] = 1'b0;
          default: begin end
        endcase
      end
      6'h31: begin
        out_r = 12'ha43;
        case (inner)
          6'h09: out_r[0] = 1'b0;
          6'h0b: out_r[0] = 1'b0;
          6'h0c: out_r[0] = 1'b0;
          6'h14: out_r[0] = 1'b0;
          6'h15: out_r[0] = 1'b0;
          6'h1c: out_r[0] = 1'b0;
          6'h1d: out_r[0] = 1'b0;
          6'h1f: out_r[0] = 1'b0;
          6'h23: out_r[0] = 1'b0;
          6'h25: out_r[0] = 1'b0;
          6'h29: out_r[0] = 1'b0;
          6'h2d: out_r[0] = 1'b0;
          6'h2e: out_r[0] = 1'b0;
          6'h30: out_r[0] = 1'b0;
          6'h38: out_r[0] = 1'b0;
          6'h3f: out_r[0] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[1] = 1'b0;
          6'h02: out_r[1] = 1'b0;
          6'h04: out_r[1] = 1'b0;
          6'h06: out_r[1] = 1'b0;
          6'h08: out_r[1] = 1'b0;
          6'h0a: out_r[1] = 1'b0;
          6'h0b: out_r[1] = 1'b0;
          6'h0f: out_r[1] = 1'b0;
          6'h10: out_r[1] = 1'b0;
          6'h12: out_r[1] = 1'b0;
          6'h17: out_r[1] = 1'b0;
          6'h18: out_r[1] = 1'b0;
          6'h1a: out_r[1] = 1'b0;
          6'h1e: out_r[1] = 1'b0;
          6'h20: out_r[1] = 1'b0;
          6'h22: out_r[1] = 1'b0;
          6'h24: out_r[1] = 1'b0;
          6'h26: out_r[1] = 1'b0;
          6'h27: out_r[1] = 1'b0;
          6'h28: out_r[1] = 1'b0;
          6'h2a: out_r[1] = 1'b0;
          6'h2b: out_r[1] = 1'b0;
          6'h2f: out_r[1] = 1'b0;
          6'h32: out_r[1] = 1'b0;
          6'h34: out_r[1] = 1'b0;
          6'h36: out_r[1] = 1'b0;
          6'h3a: out_r[1] = 1'b0;
          6'h3c: out_r[1] = 1'b0;
          6'h3e: out_r[1] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h09: out_r[2] = 1'b1;
          6'h0c: out_r[2] = 1'b1;
          6'h0e: out_r[2] = 1'b1;
          6'h14: out_r[2] = 1'b1;
          6'h15: out_r[2] = 1'b1;
          6'h16: out_r[2] = 1'b1;
          6'h1c: out_r[2] = 1'b1;
          6'h1d: out_r[2] = 1'b1;
          6'h1f: out_r[2] = 1'b1;
          6'h21: out_r[2] = 1'b1;
          6'h23: out_r[2] = 1'b1;
          6'h25: out_r[2] = 1'b1;
          6'h29: out_r[2] = 1'b1;
          6'h2c: out_r[2] = 1'b1;
          6'h2d: out_r[2] = 1'b1;
          6'h2e: out_r[2] = 1'b1;
          6'h30: out_r[2] = 1'b1;
          6'h38: out_r[2] = 1'b1;
          6'h3f: out_r[2] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h02: out_r[3] = 1'b1;
          6'h03: out_r[3] = 1'b1;
          6'h06: out_r[3] = 1'b1;
          6'h07: out_r[3] = 1'b1;
          6'h08: out_r[3] = 1'b1;
          6'h09: out_r[3] = 1'b1;
          6'h0b: out_r[3] = 1'b1;
          6'h0d: out_r[3] = 1'b1;
          6'h0f: out_r[3] = 1'b1;
          6'h12: out_r[3] = 1'b1;
          6'h13: out_r[3] = 1'b1;
          6'h15: out_r[3] = 1'b1;
          6'h1a: out_r[3] = 1'b1;
          6'h1b: out_r[3] = 1'b1;
          6'h1d: out_r[3] = 1'b1;
          6'h1f: out_r[3] = 1'b1;
          6'h20: out_r[3] = 1'b1;
          6'h23: out_r[3] = 1'b1;
          6'h25: out_r[3] = 1'b1;
          6'h28: out_r[3] = 1'b1;
          6'h29: out_r[3] = 1'b1;
          6'h2d: out_r[3] = 1'b1;
          6'h2f: out_r[3] = 1'b1;
          6'h33: out_r[3] = 1'b1;
          6'h34: out_r[3] = 1'b1;
          6'h37: out_r[3] = 1'b1;
          6'h3b: out_r[3] = 1'b1;
          6'h3c: out_r[3] = 1'b1;
          6'h3f: out_r[3] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h0c: out_r[4] = 1'b1;
          6'h0e: out_r[4] = 1'b1;
          6'h0f: out_r[4] = 1'b1;
          6'h14: out_r[4] = 1'b1;
          6'h16: out_r[4] = 1'b1;
          6'h17: out_r[4] = 1'b1;
          6'h1c: out_r[4] = 1'b1;
          6'h1e: out_r[4] = 1'b1;
          6'h1f: out_r[4] = 1'b1;
          6'h21: out_r[4] = 1'b1;
          6'h23: out_r[4] = 1'b1;
          6'h24: out_r[4] = 1'b1;
          6'h26: out_r[4] = 1'b1;
          6'h27: out_r[4] = 1'b1;
          6'h2b: out_r[4] = 1'b1;
          6'h2c: out_r[4] = 1'b1;
          6'h2d: out_r[4] = 1'b1;
          6'h2e: out_r[4] = 1'b1;
          6'h30: out_r[4] = 1'b1;
          6'h32: out_r[4] = 1'b1;
          6'h38: out_r[4] = 1'b1;
          6'h3a: out_r[4] = 1'b1;
          6'h3e: out_r[4] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h04: out_r[5] = 1'b1;
          6'h05: out_r[5] = 1'b1;
          6'h06: out_r[5] = 1'b1;
          6'h07: out_r[5] = 1'b1;
          6'h09: out_r[5] = 1'b1;
          6'h15: out_r[5] = 1'b1;
          6'h17: out_r[5] = 1'b1;
          6'h1d: out_r[5] = 1'b1;
          6'h1f: out_r[5] = 1'b1;
          6'h21: out_r[5] = 1'b1;
          6'h23: out_r[5] = 1'b1;
          6'h2d: out_r[5] = 1'b1;
          6'h35: out_r[5] = 1'b1;
          6'h37: out_r[5] = 1'b1;
          6'h3d: out_r[5] = 1'b1;
          6'h3f: out_r[5] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[6] = 1'b0;
          6'h01: out_r[6] = 1'b0;
          6'h02: out_r[6] = 1'b0;
          6'h03: out_r[6] = 1'b0;
          6'h04: out_r[6] = 1'b0;
          6'h05: out_r[6] = 1'b0;
          6'h06: out_r[6] = 1'b0;
          6'h07: out_r[6] = 1'b0;
          6'h0d: out_r[6] = 1'b0;
          6'h11: out_r[6] = 1'b0;
          6'h13: out_r[6] = 1'b0;
          6'h17: out_r[6] = 1'b0;
          6'h19: out_r[6] = 1'b0;
          6'h1b: out_r[6] = 1'b0;
          6'h1f: out_r[6] = 1'b0;
          6'h25: out_r[6] = 1'b0;
          6'h29: out_r[6] = 1'b0;
          6'h2d: out_r[6] = 1'b0;
          6'h31: out_r[6] = 1'b0;
          6'h33: out_r[6] = 1'b0;
          6'h35: out_r[6] = 1'b0;
          6'h37: out_r[6] = 1'b0;
          6'h39: out_r[6] = 1'b0;
          6'h3b: out_r[6] = 1'b0;
          6'h3d: out_r[6] = 1'b0;
          6'h3f: out_r[6] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h0b: out_r[7] = 1'b1;
          6'h0c: out_r[7] = 1'b1;
          6'h0d: out_r[7] = 1'b1;
          6'h0f: out_r[7] = 1'b1;
          6'h11: out_r[7] = 1'b1;
          6'h13: out_r[7] = 1'b1;
          6'h14: out_r[7] = 1'b1;
          6'h19: out_r[7] = 1'b1;
          6'h1b: out_r[7] = 1'b1;
          6'h1c: out_r[7] = 1'b1;
          6'h21: out_r[7] = 1'b1;
          6'h25: out_r[7] = 1'b1;
          6'h29: out_r[7] = 1'b1;
          6'h31: out_r[7] = 1'b1;
          6'h33: out_r[7] = 1'b1;
          6'h35: out_r[7] = 1'b1;
          6'h37: out_r[7] = 1'b1;
          6'h39: out_r[7] = 1'b1;
          6'h3b: out_r[7] = 1'b1;
          6'h3d: out_r[7] = 1'b1;
          6'h3f: out_r[7] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h09: out_r[8] = 1'b1;
          6'h0a: out_r[8] = 1'b1;
          6'h0c: out_r[8] = 1'b1;
          6'h0e: out_r[8] = 1'b1;
          6'h14: out_r[8] = 1'b1;
          6'h15: out_r[8] = 1'b1;
          6'h17: out_r[8] = 1'b1;
          6'h1c: out_r[8] = 1'b1;
          6'h1d: out_r[8] = 1'b1;
          6'h1e: out_r[8] = 1'b1;
          6'h1f: out_r[8] = 1'b1;
          6'h21: out_r[8] = 1'b1;
          6'h22: out_r[8] = 1'b1;
          6'h23: out_r[8] = 1'b1;
          6'h24: out_r[8] = 1'b1;
          6'h25: out_r[8] = 1'b1;
          6'h26: out_r[8] = 1'b1;
          6'h27: out_r[8] = 1'b1;
          6'h2a: out_r[8] = 1'b1;
          6'h2c: out_r[8] = 1'b1;
          6'h2e: out_r[8] = 1'b1;
          6'h32: out_r[8] = 1'b1;
          6'h36: out_r[8] = 1'b1;
          6'h3a: out_r[8] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h0a: out_r[9] = 1'b0;
          6'h17: out_r[9] = 1'b0;
          6'h1e: out_r[9] = 1'b0;
          6'h1f: out_r[9] = 1'b0;
          6'h22: out_r[9] = 1'b0;
          6'h23: out_r[9] = 1'b0;
          6'h24: out_r[9] = 1'b0;
          6'h25: out_r[9] = 1'b0;
          6'h26: out_r[9] = 1'b0;
          6'h27: out_r[9] = 1'b0;
          6'h2a: out_r[9] = 1'b0;
          6'h2e: out_r[9] = 1'b0;
          6'h31: out_r[9] = 1'b0;
          6'h32: out_r[9] = 1'b0;
          6'h33: out_r[9] = 1'b0;
          6'h35: out_r[9] = 1'b0;
          6'h36: out_r[9] = 1'b0;
          6'h37: out_r[9] = 1'b0;
          6'h39: out_r[9] = 1'b0;
          6'h3a: out_r[9] = 1'b0;
          6'h3b: out_r[9] = 1'b0;
          6'h3d: out_r[9] = 1'b0;
          6'h3f: out_r[9] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[10] = 1'b1;
          6'h02: out_r[10] = 1'b1;
          6'h04: out_r[10] = 1'b1;
          6'h06: out_r[10] = 1'b1;
          6'h08: out_r[10] = 1'b1;
          6'h0b: out_r[10] = 1'b1;
          6'h0c: out_r[10] = 1'b1;
          6'h10: out_r[10] = 1'b1;
          6'h12: out_r[10] = 1'b1;
          6'h14: out_r[10] = 1'b1;
          6'h18: out_r[10] = 1'b1;
          6'h1a: out_r[10] = 1'b1;
          6'h1c: out_r[10] = 1'b1;
          6'h20: out_r[10] = 1'b1;
          6'h28: out_r[10] = 1'b1;
          6'h2b: out_r[10] = 1'b1;
          6'h2d: out_r[10] = 1'b1;
          6'h2f: out_r[10] = 1'b1;
          6'h30: out_r[10] = 1'b1;
          6'h34: out_r[10] = 1'b1;
          6'h38: out_r[10] = 1'b1;
          6'h3c: out_r[10] = 1'b1;
          6'h3e: out_r[10] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h0b: out_r[11] = 1'b0;
          6'h0c: out_r[11] = 1'b0;
          6'h14: out_r[11] = 1'b0;
          6'h17: out_r[11] = 1'b0;
          6'h1c: out_r[11] = 1'b0;
          6'h30: out_r[11] = 1'b0;
          6'h38: out_r[11] = 1'b0;
          default: begin end
        endcase
      end
      6'h32: begin
        out_r = 12'h604;
        case (inner)
          6'h01: out_r[0] = 1'b1;
          6'h05: out_r[0] = 1'b1;
          6'h06: out_r[0] = 1'b1;
          6'h07: out_r[0] = 1'b1;
          6'h09: out_r[0] = 1'b1;
          6'h0d: out_r[0] = 1'b1;
          6'h0e: out_r[0] = 1'b1;
          6'h0f: out_r[0] = 1'b1;
          6'h11: out_r[0] = 1'b1;
          6'h12: out_r[0] = 1'b1;
          6'h15: out_r[0] = 1'b1;
          6'h16: out_r[0] = 1'b1;
          6'h17: out_r[0] = 1'b1;
          6'h19: out_r[0] = 1'b1;
          6'h1a: out_r[0] = 1'b1;
          6'h1d: out_r[0] = 1'b1;
          6'h1e: out_r[0] = 1'b1;
          6'h21: out_r[0] = 1'b1;
          6'h24: out_r[0] = 1'b1;
          6'h25: out_r[0] = 1'b1;
          6'h29: out_r[0] = 1'b1;
          6'h2d: out_r[0] = 1'b1;
          6'h2e: out_r[0] = 1'b1;
          6'h2f: out_r[0] = 1'b1;
          6'h32: out_r[0] = 1'b1;
          6'h33: out_r[0] = 1'b1;
          6'h36: out_r[0] = 1'b1;
          6'h37: out_r[0] = 1'b1;
          6'h3a: out_r[0] = 1'b1;
          6'h3b: out_r[0] = 1'b1;
          6'h3e: out_r[0] = 1'b1;
          6'h3f: out_r[0] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h05: out_r[1] = 1'b1;
          6'h07: out_r[1] = 1'b1;
          6'h0f: out_r[1] = 1'b1;
          6'h12: out_r[1] = 1'b1;
          6'h17: out_r[1] = 1'b1;
          6'h1a: out_r[1] = 1'b1;
          6'h24: out_r[1] = 1'b1;
          6'h2e: out_r[1] = 1'b1;
          6'h2f: out_r[1] = 1'b1;
          6'h32: out_r[1] = 1'b1;
          6'h33: out_r[1] = 1'b1;
          6'h35: out_r[1] = 1'b1;
          6'h3a: out_r[1] = 1'b1;
          6'h3b: out_r[1] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[2] = 1'b0;
          6'h03: out_r[2] = 1'b0;
          6'h05: out_r[2] = 1'b0;
          6'h07: out_r[2] = 1'b0;
          6'h09: out_r[2] = 1'b0;
          6'h0c: out_r[2] = 1'b0;
          6'h0f: out_r[2] = 1'b0;
          6'h16: out_r[2] = 1'b0;
          6'h17: out_r[2] = 1'b0;
          6'h1f: out_r[2] = 1'b0;
          6'h2c: out_r[2] = 1'b0;
          6'h2d: out_r[2] = 1'b0;
          6'h2e: out_r[2] = 1'b0;
          6'h2f: out_r[2] = 1'b0;
          6'h32: out_r[2] = 1'b0;
          6'h33: out_r[2] = 1'b0;
          6'h34: out_r[2] = 1'b0;
          6'h35: out_r[2] = 1'b0;
          6'h3a: out_r[2] = 1'b0;
          6'h3b: out_r[2] = 1'b0;
          6'h3c: out_r[2] = 1'b0;
          6'h3d: out_r[2] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[3] = 1'b1;
          6'h03: out_r[3] = 1'b1;
          6'h05: out_r[3] = 1'b1;
          6'h09: out_r[3] = 1'b1;
          6'h0c: out_r[3] = 1'b1;
          6'h0f: out_r[3] = 1'b1;
          6'h13: out_r[3] = 1'b1;
          6'h16: out_r[3] = 1'b1;
          6'h1b: out_r[3] = 1'b1;
          6'h22: out_r[3] = 1'b1;
          6'h23: out_r[3] = 1'b1;
          6'h24: out_r[3] = 1'b1;
          6'h26: out_r[3] = 1'b1;
          6'h27: out_r[3] = 1'b1;
          6'h2a: out_r[3] = 1'b1;
          6'h2b: out_r[3] = 1'b1;
          6'h2c: out_r[3] = 1'b1;
          6'h2d: out_r[3] = 1'b1;
          6'h2e: out_r[3] = 1'b1;
          6'h2f: out_r[3] = 1'b1;
          6'h31: out_r[3] = 1'b1;
          6'h32: out_r[3] = 1'b1;
          6'h33: out_r[3] = 1'b1;
          6'h34: out_r[3] = 1'b1;
          6'h35: out_r[3] = 1'b1;
          6'h39: out_r[3] = 1'b1;
          6'h3a: out_r[3] = 1'b1;
          6'h3b: out_r[3] = 1'b1;
          6'h3c: out_r[3] = 1'b1;
          6'h3d: out_r[3] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[4] = 1'b1;
          6'h03: out_r[4] = 1'b1;
          6'h05: out_r[4] = 1'b1;
          6'h06: out_r[4] = 1'b1;
          6'h09: out_r[4] = 1'b1;
          6'h0c: out_r[4] = 1'b1;
          6'h0f: out_r[4] = 1'b1;
          6'h16: out_r[4] = 1'b1;
          6'h1f: out_r[4] = 1'b1;
          6'h24: out_r[4] = 1'b1;
          6'h2c: out_r[4] = 1'b1;
          6'h2d: out_r[4] = 1'b1;
          6'h2e: out_r[4] = 1'b1;
          6'h2f: out_r[4] = 1'b1;
          6'h31: out_r[4] = 1'b1;
          6'h32: out_r[4] = 1'b1;
          6'h33: out_r[4] = 1'b1;
          6'h34: out_r[4] = 1'b1;
          6'h35: out_r[4] = 1'b1;
          6'h39: out_r[4] = 1'b1;
          6'h3a: out_r[4] = 1'b1;
          6'h3b: out_r[4] = 1'b1;
          6'h3c: out_r[4] = 1'b1;
          6'h3d: out_r[4] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[5] = 1'b1;
          6'h03: out_r[5] = 1'b1;
          6'h07: out_r[5] = 1'b1;
          6'h0c: out_r[5] = 1'b1;
          6'h11: out_r[5] = 1'b1;
          6'h13: out_r[5] = 1'b1;
          6'h14: out_r[5] = 1'b1;
          6'h16: out_r[5] = 1'b1;
          6'h17: out_r[5] = 1'b1;
          6'h19: out_r[5] = 1'b1;
          6'h1b: out_r[5] = 1'b1;
          6'h1c: out_r[5] = 1'b1;
          6'h25: out_r[5] = 1'b1;
          6'h26: out_r[5] = 1'b1;
          6'h27: out_r[5] = 1'b1;
          6'h28: out_r[5] = 1'b1;
          6'h29: out_r[5] = 1'b1;
          6'h2a: out_r[5] = 1'b1;
          6'h2b: out_r[5] = 1'b1;
          6'h2c: out_r[5] = 1'b1;
          6'h2d: out_r[5] = 1'b1;
          6'h2e: out_r[5] = 1'b1;
          6'h2f: out_r[5] = 1'b1;
          6'h32: out_r[5] = 1'b1;
          6'h33: out_r[5] = 1'b1;
          6'h3a: out_r[5] = 1'b1;
          6'h3b: out_r[5] = 1'b1;
          6'h3d: out_r[5] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[6] = 1'b1;
          6'h01: out_r[6] = 1'b1;
          6'h04: out_r[6] = 1'b1;
          6'h05: out_r[6] = 1'b1;
          6'h06: out_r[6] = 1'b1;
          6'h08: out_r[6] = 1'b1;
          6'h09: out_r[6] = 1'b1;
          6'h0a: out_r[6] = 1'b1;
          6'h0b: out_r[6] = 1'b1;
          6'h0c: out_r[6] = 1'b1;
          6'h0d: out_r[6] = 1'b1;
          6'h0e: out_r[6] = 1'b1;
          6'h0f: out_r[6] = 1'b1;
          6'h13: out_r[6] = 1'b1;
          6'h1b: out_r[6] = 1'b1;
          6'h1d: out_r[6] = 1'b1;
          6'h1e: out_r[6] = 1'b1;
          6'h1f: out_r[6] = 1'b1;
          6'h20: out_r[6] = 1'b1;
          6'h24: out_r[6] = 1'b1;
          6'h30: out_r[6] = 1'b1;
          6'h31: out_r[6] = 1'b1;
          6'h35: out_r[6] = 1'b1;
          6'h36: out_r[6] = 1'b1;
          6'h37: out_r[6] = 1'b1;
          6'h38: out_r[6] = 1'b1;
          6'h39: out_r[6] = 1'b1;
          6'h3e: out_r[6] = 1'b1;
          6'h3f: out_r[6] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[7] = 1'b1;
          6'h04: out_r[7] = 1'b1;
          6'h06: out_r[7] = 1'b1;
          6'h0a: out_r[7] = 1'b1;
          6'h16: out_r[7] = 1'b1;
          6'h17: out_r[7] = 1'b1;
          6'h21: out_r[7] = 1'b1;
          6'h22: out_r[7] = 1'b1;
          6'h23: out_r[7] = 1'b1;
          6'h25: out_r[7] = 1'b1;
          6'h26: out_r[7] = 1'b1;
          6'h27: out_r[7] = 1'b1;
          6'h34: out_r[7] = 1'b1;
          6'h35: out_r[7] = 1'b1;
          6'h3c: out_r[7] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[8] = 1'b1;
          6'h02: out_r[8] = 1'b1;
          6'h03: out_r[8] = 1'b1;
          6'h04: out_r[8] = 1'b1;
          6'h07: out_r[8] = 1'b1;
          6'h08: out_r[8] = 1'b1;
          6'h0b: out_r[8] = 1'b1;
          6'h0c: out_r[8] = 1'b1;
          6'h0f: out_r[8] = 1'b1;
          6'h10: out_r[8] = 1'b1;
          6'h12: out_r[8] = 1'b1;
          6'h13: out_r[8] = 1'b1;
          6'h14: out_r[8] = 1'b1;
          6'h18: out_r[8] = 1'b1;
          6'h1a: out_r[8] = 1'b1;
          6'h1b: out_r[8] = 1'b1;
          6'h1c: out_r[8] = 1'b1;
          6'h1e: out_r[8] = 1'b1;
          6'h1f: out_r[8] = 1'b1;
          6'h31: out_r[8] = 1'b1;
          6'h36: out_r[8] = 1'b1;
          6'h37: out_r[8] = 1'b1;
          6'h39: out_r[8] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h0b: out_r[9] = 1'b0;
          6'h0f: out_r[9] = 1'b0;
          6'h1e: out_r[9] = 1'b0;
          6'h1f: out_r[9] = 1'b0;
          6'h21: out_r[9] = 1'b0;
          6'h22: out_r[9] = 1'b0;
          6'h23: out_r[9] = 1'b0;
          6'h25: out_r[9] = 1'b0;
          6'h26: out_r[9] = 1'b0;
          6'h27: out_r[9] = 1'b0;
          6'h29: out_r[9] = 1'b0;
          6'h2a: out_r[9] = 1'b0;
          6'h2b: out_r[9] = 1'b0;
          6'h2d: out_r[9] = 1'b0;
          6'h2e: out_r[9] = 1'b0;
          6'h2f: out_r[9] = 1'b0;
          6'h36: out_r[9] = 1'b0;
          6'h37: out_r[9] = 1'b0;
          6'h3d: out_r[9] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h07: out_r[10] = 1'b0;
          6'h0b: out_r[10] = 1'b0;
          6'h0f: out_r[10] = 1'b0;
          6'h12: out_r[10] = 1'b0;
          6'h17: out_r[10] = 1'b0;
          6'h1a: out_r[10] = 1'b0;
          6'h1e: out_r[10] = 1'b0;
          6'h1f: out_r[10] = 1'b0;
          6'h21: out_r[10] = 1'b0;
          6'h24: out_r[10] = 1'b0;
          6'h25: out_r[10] = 1'b0;
          6'h29: out_r[10] = 1'b0;
          6'h2d: out_r[10] = 1'b0;
          6'h2e: out_r[10] = 1'b0;
          6'h2f: out_r[10] = 1'b0;
          6'h32: out_r[10] = 1'b0;
          6'h33: out_r[10] = 1'b0;
          6'h36: out_r[10] = 1'b0;
          6'h37: out_r[10] = 1'b0;
          6'h3a: out_r[10] = 1'b0;
          6'h3b: out_r[10] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h01: out_r[11] = 1'b1;
          6'h05: out_r[11] = 1'b1;
          6'h06: out_r[11] = 1'b1;
          6'h07: out_r[11] = 1'b1;
          6'h09: out_r[11] = 1'b1;
          6'h0d: out_r[11] = 1'b1;
          6'h0e: out_r[11] = 1'b1;
          6'h0f: out_r[11] = 1'b1;
          6'h11: out_r[11] = 1'b1;
          6'h12: out_r[11] = 1'b1;
          6'h15: out_r[11] = 1'b1;
          6'h17: out_r[11] = 1'b1;
          6'h19: out_r[11] = 1'b1;
          6'h1a: out_r[11] = 1'b1;
          6'h1d: out_r[11] = 1'b1;
          6'h1e: out_r[11] = 1'b1;
          6'h20: out_r[11] = 1'b1;
          6'h24: out_r[11] = 1'b1;
          6'h28: out_r[11] = 1'b1;
          6'h2c: out_r[11] = 1'b1;
          6'h2e: out_r[11] = 1'b1;
          6'h2f: out_r[11] = 1'b1;
          6'h30: out_r[11] = 1'b1;
          6'h32: out_r[11] = 1'b1;
          6'h33: out_r[11] = 1'b1;
          6'h36: out_r[11] = 1'b1;
          6'h37: out_r[11] = 1'b1;
          6'h38: out_r[11] = 1'b1;
          6'h3a: out_r[11] = 1'b1;
          6'h3b: out_r[11] = 1'b1;
          6'h3e: out_r[11] = 1'b1;
          6'h3f: out_r[11] = 1'b1;
          default: begin end
        endcase
      end
      6'h33: begin
        out_r = 12'hac7;
        case (inner)
          6'h00: out_r[0] = 1'b0;
          6'h03: out_r[0] = 1'b0;
          6'h05: out_r[0] = 1'b0;
          6'h06: out_r[0] = 1'b0;
          6'h07: out_r[0] = 1'b0;
          6'h08: out_r[0] = 1'b0;
          6'h09: out_r[0] = 1'b0;
          6'h0b: out_r[0] = 1'b0;
          6'h0d: out_r[0] = 1'b0;
          6'h0e: out_r[0] = 1'b0;
          6'h0f: out_r[0] = 1'b0;
          6'h13: out_r[0] = 1'b0;
          6'h16: out_r[0] = 1'b0;
          6'h1b: out_r[0] = 1'b0;
          6'h1c: out_r[0] = 1'b0;
          6'h1e: out_r[0] = 1'b0;
          6'h1f: out_r[0] = 1'b0;
          6'h26: out_r[0] = 1'b0;
          6'h2a: out_r[0] = 1'b0;
          6'h2b: out_r[0] = 1'b0;
          6'h2e: out_r[0] = 1'b0;
          6'h32: out_r[0] = 1'b0;
          6'h33: out_r[0] = 1'b0;
          6'h36: out_r[0] = 1'b0;
          6'h37: out_r[0] = 1'b0;
          6'h3a: out_r[0] = 1'b0;
          6'h3b: out_r[0] = 1'b0;
          6'h3c: out_r[0] = 1'b0;
          6'h3d: out_r[0] = 1'b0;
          6'h3e: out_r[0] = 1'b0;
          6'h3f: out_r[0] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h02: out_r[1] = 1'b0;
          6'h06: out_r[1] = 1'b0;
          6'h08: out_r[1] = 1'b0;
          6'h0b: out_r[1] = 1'b0;
          6'h0e: out_r[1] = 1'b0;
          6'h0f: out_r[1] = 1'b0;
          6'h12: out_r[1] = 1'b0;
          6'h15: out_r[1] = 1'b0;
          6'h17: out_r[1] = 1'b0;
          6'h1a: out_r[1] = 1'b0;
          6'h1d: out_r[1] = 1'b0;
          6'h1e: out_r[1] = 1'b0;
          6'h23: out_r[1] = 1'b0;
          6'h2e: out_r[1] = 1'b0;
          6'h3e: out_r[1] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h01: out_r[2] = 1'b0;
          6'h02: out_r[2] = 1'b0;
          6'h08: out_r[2] = 1'b0;
          6'h0b: out_r[2] = 1'b0;
          6'h0d: out_r[2] = 1'b0;
          6'h0f: out_r[2] = 1'b0;
          6'h12: out_r[2] = 1'b0;
          6'h15: out_r[2] = 1'b0;
          6'h17: out_r[2] = 1'b0;
          6'h1a: out_r[2] = 1'b0;
          6'h23: out_r[2] = 1'b0;
          6'h28: out_r[2] = 1'b0;
          6'h29: out_r[2] = 1'b0;
          6'h2f: out_r[2] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h01: out_r[3] = 1'b1;
          6'h03: out_r[3] = 1'b1;
          6'h06: out_r[3] = 1'b1;
          6'h07: out_r[3] = 1'b1;
          6'h08: out_r[3] = 1'b1;
          6'h0d: out_r[3] = 1'b1;
          6'h0f: out_r[3] = 1'b1;
          6'h12: out_r[3] = 1'b1;
          6'h13: out_r[3] = 1'b1;
          6'h16: out_r[3] = 1'b1;
          6'h1a: out_r[3] = 1'b1;
          6'h1b: out_r[3] = 1'b1;
          6'h28: out_r[3] = 1'b1;
          6'h29: out_r[3] = 1'b1;
          6'h2f: out_r[3] = 1'b1;
          6'h32: out_r[3] = 1'b1;
          6'h33: out_r[3] = 1'b1;
          6'h36: out_r[3] = 1'b1;
          6'h37: out_r[3] = 1'b1;
          6'h3a: out_r[3] = 1'b1;
          6'h3b: out_r[3] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[4] = 1'b1;
          6'h01: out_r[4] = 1'b1;
          6'h02: out_r[4] = 1'b1;
          6'h05: out_r[4] = 1'b1;
          6'h06: out_r[4] = 1'b1;
          6'h08: out_r[4] = 1'b1;
          6'h0b: out_r[4] = 1'b1;
          6'h0d: out_r[4] = 1'b1;
          6'h0f: out_r[4] = 1'b1;
          6'h12: out_r[4] = 1'b1;
          6'h16: out_r[4] = 1'b1;
          6'h17: out_r[4] = 1'b1;
          6'h1a: out_r[4] = 1'b1;
          6'h1c: out_r[4] = 1'b1;
          6'h1d: out_r[4] = 1'b1;
          6'h22: out_r[4] = 1'b1;
          6'h23: out_r[4] = 1'b1;
          6'h28: out_r[4] = 1'b1;
          6'h29: out_r[4] = 1'b1;
          6'h2e: out_r[4] = 1'b1;
          6'h2f: out_r[4] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h01: out_r[5] = 1'b1;
          6'h07: out_r[5] = 1'b1;
          6'h08: out_r[5] = 1'b1;
          6'h09: out_r[5] = 1'b1;
          6'h0b: out_r[5] = 1'b1;
          6'h0d: out_r[5] = 1'b1;
          6'h0e: out_r[5] = 1'b1;
          6'h0f: out_r[5] = 1'b1;
          6'h11: out_r[5] = 1'b1;
          6'h19: out_r[5] = 1'b1;
          6'h1e: out_r[5] = 1'b1;
          6'h23: out_r[5] = 1'b1;
          6'h28: out_r[5] = 1'b1;
          6'h29: out_r[5] = 1'b1;
          6'h2f: out_r[5] = 1'b1;
          6'h34: out_r[5] = 1'b1;
          6'h35: out_r[5] = 1'b1;
          6'h36: out_r[5] = 1'b1;
          6'h37: out_r[5] = 1'b1;
          6'h3c: out_r[5] = 1'b1;
          6'h3d: out_r[5] = 1'b1;
          6'h3e: out_r[5] = 1'b1;
          6'h3f: out_r[5] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h03: out_r[6] = 1'b0;
          6'h07: out_r[6] = 1'b0;
          6'h09: out_r[6] = 1'b0;
          6'h0a: out_r[6] = 1'b0;
          6'h0b: out_r[6] = 1'b0;
          6'h0d: out_r[6] = 1'b0;
          6'h0e: out_r[6] = 1'b0;
          6'h0f: out_r[6] = 1'b0;
          6'h11: out_r[6] = 1'b0;
          6'h16: out_r[6] = 1'b0;
          6'h19: out_r[6] = 1'b0;
          6'h1e: out_r[6] = 1'b0;
          6'h20: out_r[6] = 1'b0;
          6'h21: out_r[6] = 1'b0;
          6'h22: out_r[6] = 1'b0;
          6'h30: out_r[6] = 1'b0;
          6'h31: out_r[6] = 1'b0;
          6'h32: out_r[6] = 1'b0;
          6'h33: out_r[6] = 1'b0;
          6'h34: out_r[6] = 1'b0;
          6'h35: out_r[6] = 1'b0;
          6'h36: out_r[6] = 1'b0;
          6'h37: out_r[6] = 1'b0;
          6'h38: out_r[6] = 1'b0;
          6'h39: out_r[6] = 1'b0;
          6'h3a: out_r[6] = 1'b0;
          6'h3b: out_r[6] = 1'b0;
          6'h3c: out_r[6] = 1'b0;
          6'h3d: out_r[6] = 1'b0;
          6'h3e: out_r[6] = 1'b0;
          6'h3f: out_r[6] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h02: out_r[7] = 1'b0;
          6'h03: out_r[7] = 1'b0;
          6'h06: out_r[7] = 1'b0;
          6'h07: out_r[7] = 1'b0;
          6'h08: out_r[7] = 1'b0;
          6'h09: out_r[7] = 1'b0;
          6'h0a: out_r[7] = 1'b0;
          6'h0b: out_r[7] = 1'b0;
          6'h0f: out_r[7] = 1'b0;
          6'h11: out_r[7] = 1'b0;
          6'h12: out_r[7] = 1'b0;
          6'h13: out_r[7] = 1'b0;
          6'h15: out_r[7] = 1'b0;
          6'h17: out_r[7] = 1'b0;
          6'h19: out_r[7] = 1'b0;
          6'h1a: out_r[7] = 1'b0;
          6'h1b: out_r[7] = 1'b0;
          6'h1d: out_r[7] = 1'b0;
          6'h1e: out_r[7] = 1'b0;
          6'h1f: out_r[7] = 1'b0;
          6'h20: out_r[7] = 1'b0;
          6'h21: out_r[7] = 1'b0;
          6'h26: out_r[7] = 1'b0;
          6'h2a: out_r[7] = 1'b0;
          6'h2b: out_r[7] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h01: out_r[8] = 1'b1;
          6'h08: out_r[8] = 1'b1;
          6'h0a: out_r[8] = 1'b1;
          6'h0f: out_r[8] = 1'b1;
          6'h11: out_r[8] = 1'b1;
          6'h12: out_r[8] = 1'b1;
          6'h15: out_r[8] = 1'b1;
          6'h19: out_r[8] = 1'b1;
          6'h1a: out_r[8] = 1'b1;
          6'h1d: out_r[8] = 1'b1;
          6'h20: out_r[8] = 1'b1;
          6'h21: out_r[8] = 1'b1;
          6'h23: out_r[8] = 1'b1;
          6'h26: out_r[8] = 1'b1;
          6'h27: out_r[8] = 1'b1;
          6'h28: out_r[8] = 1'b1;
          6'h29: out_r[8] = 1'b1;
          6'h2a: out_r[8] = 1'b1;
          6'h2b: out_r[8] = 1'b1;
          6'h2e: out_r[8] = 1'b1;
          6'h2f: out_r[8] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h1d: out_r[9] = 1'b0;
          6'h26: out_r[9] = 1'b0;
          6'h2a: out_r[9] = 1'b0;
          6'h30: out_r[9] = 1'b0;
          6'h31: out_r[9] = 1'b0;
          6'h32: out_r[9] = 1'b0;
          6'h33: out_r[9] = 1'b0;
          6'h34: out_r[9] = 1'b0;
          6'h35: out_r[9] = 1'b0;
          6'h36: out_r[9] = 1'b0;
          6'h37: out_r[9] = 1'b0;
          6'h38: out_r[9] = 1'b0;
          6'h39: out_r[9] = 1'b0;
          6'h3a: out_r[9] = 1'b0;
          6'h3b: out_r[9] = 1'b0;
          6'h3c: out_r[9] = 1'b0;
          6'h3d: out_r[9] = 1'b0;
          6'h3e: out_r[9] = 1'b0;
          6'h3f: out_r[9] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[10] = 1'b1;
          6'h02: out_r[10] = 1'b1;
          6'h03: out_r[10] = 1'b1;
          6'h05: out_r[10] = 1'b1;
          6'h06: out_r[10] = 1'b1;
          6'h07: out_r[10] = 1'b1;
          6'h08: out_r[10] = 1'b1;
          6'h09: out_r[10] = 1'b1;
          6'h0b: out_r[10] = 1'b1;
          6'h0d: out_r[10] = 1'b1;
          6'h0e: out_r[10] = 1'b1;
          6'h0f: out_r[10] = 1'b1;
          6'h12: out_r[10] = 1'b1;
          6'h13: out_r[10] = 1'b1;
          6'h15: out_r[10] = 1'b1;
          6'h16: out_r[10] = 1'b1;
          6'h17: out_r[10] = 1'b1;
          6'h1a: out_r[10] = 1'b1;
          6'h1b: out_r[10] = 1'b1;
          6'h1c: out_r[10] = 1'b1;
          6'h1e: out_r[10] = 1'b1;
          6'h1f: out_r[10] = 1'b1;
          6'h2e: out_r[10] = 1'b1;
          6'h3c: out_r[10] = 1'b1;
          6'h3d: out_r[10] = 1'b1;
          6'h3e: out_r[10] = 1'b1;
          6'h3f: out_r[10] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[11] = 1'b0;
          6'h05: out_r[11] = 1'b0;
          6'h06: out_r[11] = 1'b0;
          6'h08: out_r[11] = 1'b0;
          6'h09: out_r[11] = 1'b0;
          6'h0b: out_r[11] = 1'b0;
          6'h0d: out_r[11] = 1'b0;
          6'h0e: out_r[11] = 1'b0;
          6'h0f: out_r[11] = 1'b0;
          6'h12: out_r[11] = 1'b0;
          6'h1a: out_r[11] = 1'b0;
          6'h1c: out_r[11] = 1'b0;
          6'h1e: out_r[11] = 1'b0;
          6'h23: out_r[11] = 1'b0;
          6'h27: out_r[11] = 1'b0;
          6'h2b: out_r[11] = 1'b0;
          6'h2e: out_r[11] = 1'b0;
          6'h33: out_r[11] = 1'b0;
          6'h37: out_r[11] = 1'b0;
          6'h3b: out_r[11] = 1'b0;
          6'h3c: out_r[11] = 1'b0;
          6'h3d: out_r[11] = 1'b0;
          6'h3e: out_r[11] = 1'b0;
          6'h3f: out_r[11] = 1'b0;
          default: begin end
        endcase
      end
      6'h34: begin
        out_r = 12'h714;
        case (inner)
          6'h02: out_r[0] = 1'b1;
          6'h07: out_r[0] = 1'b1;
          6'h0b: out_r[0] = 1'b1;
          6'h0c: out_r[0] = 1'b1;
          6'h0d: out_r[0] = 1'b1;
          6'h0e: out_r[0] = 1'b1;
          6'h12: out_r[0] = 1'b1;
          6'h13: out_r[0] = 1'b1;
          6'h17: out_r[0] = 1'b1;
          6'h1a: out_r[0] = 1'b1;
          6'h1f: out_r[0] = 1'b1;
          6'h20: out_r[0] = 1'b1;
          6'h23: out_r[0] = 1'b1;
          6'h25: out_r[0] = 1'b1;
          6'h27: out_r[0] = 1'b1;
          6'h2a: out_r[0] = 1'b1;
          6'h2c: out_r[0] = 1'b1;
          6'h2e: out_r[0] = 1'b1;
          6'h2f: out_r[0] = 1'b1;
          6'h30: out_r[0] = 1'b1;
          6'h33: out_r[0] = 1'b1;
          6'h34: out_r[0] = 1'b1;
          6'h35: out_r[0] = 1'b1;
          6'h36: out_r[0] = 1'b1;
          6'h37: out_r[0] = 1'b1;
          6'h38: out_r[0] = 1'b1;
          6'h3c: out_r[0] = 1'b1;
          6'h3d: out_r[0] = 1'b1;
          6'h3e: out_r[0] = 1'b1;
          6'h3f: out_r[0] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h01: out_r[1] = 1'b1;
          6'h09: out_r[1] = 1'b1;
          6'h11: out_r[1] = 1'b1;
          6'h14: out_r[1] = 1'b1;
          6'h16: out_r[1] = 1'b1;
          6'h17: out_r[1] = 1'b1;
          6'h19: out_r[1] = 1'b1;
          6'h1c: out_r[1] = 1'b1;
          6'h1e: out_r[1] = 1'b1;
          6'h1f: out_r[1] = 1'b1;
          6'h20: out_r[1] = 1'b1;
          6'h21: out_r[1] = 1'b1;
          6'h27: out_r[1] = 1'b1;
          6'h29: out_r[1] = 1'b1;
          6'h2f: out_r[1] = 1'b1;
          6'h30: out_r[1] = 1'b1;
          6'h31: out_r[1] = 1'b1;
          6'h34: out_r[1] = 1'b1;
          6'h36: out_r[1] = 1'b1;
          6'h38: out_r[1] = 1'b1;
          6'h39: out_r[1] = 1'b1;
          6'h3c: out_r[1] = 1'b1;
          6'h3e: out_r[1] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[2] = 1'b0;
          6'h01: out_r[2] = 1'b0;
          6'h03: out_r[2] = 1'b0;
          6'h08: out_r[2] = 1'b0;
          6'h09: out_r[2] = 1'b0;
          6'h10: out_r[2] = 1'b0;
          6'h11: out_r[2] = 1'b0;
          6'h14: out_r[2] = 1'b0;
          6'h15: out_r[2] = 1'b0;
          6'h16: out_r[2] = 1'b0;
          6'h17: out_r[2] = 1'b0;
          6'h18: out_r[2] = 1'b0;
          6'h19: out_r[2] = 1'b0;
          6'h1c: out_r[2] = 1'b0;
          6'h1d: out_r[2] = 1'b0;
          6'h1e: out_r[2] = 1'b0;
          6'h1f: out_r[2] = 1'b0;
          6'h20: out_r[2] = 1'b0;
          6'h21: out_r[2] = 1'b0;
          6'h27: out_r[2] = 1'b0;
          6'h28: out_r[2] = 1'b0;
          6'h29: out_r[2] = 1'b0;
          6'h30: out_r[2] = 1'b0;
          6'h31: out_r[2] = 1'b0;
          6'h38: out_r[2] = 1'b0;
          6'h39: out_r[2] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h0c: out_r[3] = 1'b1;
          6'h0e: out_r[3] = 1'b1;
          6'h23: out_r[3] = 1'b1;
          6'h24: out_r[3] = 1'b1;
          6'h25: out_r[3] = 1'b1;
          6'h26: out_r[3] = 1'b1;
          6'h2c: out_r[3] = 1'b1;
          6'h2d: out_r[3] = 1'b1;
          6'h2e: out_r[3] = 1'b1;
          6'h2f: out_r[3] = 1'b1;
          6'h30: out_r[3] = 1'b1;
          6'h31: out_r[3] = 1'b1;
          6'h32: out_r[3] = 1'b1;
          6'h34: out_r[3] = 1'b1;
          6'h35: out_r[3] = 1'b1;
          6'h36: out_r[3] = 1'b1;
          6'h38: out_r[3] = 1'b1;
          6'h39: out_r[3] = 1'b1;
          6'h3c: out_r[3] = 1'b1;
          6'h3d: out_r[3] = 1'b1;
          6'h3e: out_r[3] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[4] = 1'b0;
          6'h01: out_r[4] = 1'b0;
          6'h03: out_r[4] = 1'b0;
          6'h0c: out_r[4] = 1'b0;
          6'h0e: out_r[4] = 1'b0;
          6'h23: out_r[4] = 1'b0;
          6'h27: out_r[4] = 1'b0;
          6'h2c: out_r[4] = 1'b0;
          6'h2e: out_r[4] = 1'b0;
          6'h2f: out_r[4] = 1'b0;
          6'h30: out_r[4] = 1'b0;
          6'h31: out_r[4] = 1'b0;
          6'h32: out_r[4] = 1'b0;
          6'h33: out_r[4] = 1'b0;
          6'h34: out_r[4] = 1'b0;
          6'h36: out_r[4] = 1'b0;
          6'h38: out_r[4] = 1'b0;
          6'h39: out_r[4] = 1'b0;
          6'h3c: out_r[4] = 1'b0;
          6'h3e: out_r[4] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[5] = 1'b1;
          6'h01: out_r[5] = 1'b1;
          6'h03: out_r[5] = 1'b1;
          6'h07: out_r[5] = 1'b1;
          6'h0c: out_r[5] = 1'b1;
          6'h0e: out_r[5] = 1'b1;
          6'h20: out_r[5] = 1'b1;
          6'h21: out_r[5] = 1'b1;
          6'h22: out_r[5] = 1'b1;
          6'h23: out_r[5] = 1'b1;
          6'h24: out_r[5] = 1'b1;
          6'h26: out_r[5] = 1'b1;
          6'h2a: out_r[5] = 1'b1;
          6'h2c: out_r[5] = 1'b1;
          6'h2e: out_r[5] = 1'b1;
          6'h2f: out_r[5] = 1'b1;
          6'h30: out_r[5] = 1'b1;
          6'h31: out_r[5] = 1'b1;
          6'h33: out_r[5] = 1'b1;
          6'h34: out_r[5] = 1'b1;
          6'h35: out_r[5] = 1'b1;
          6'h36: out_r[5] = 1'b1;
          6'h38: out_r[5] = 1'b1;
          6'h39: out_r[5] = 1'b1;
          6'h3c: out_r[5] = 1'b1;
          6'h3d: out_r[5] = 1'b1;
          6'h3e: out_r[5] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[6] = 1'b1;
          6'h01: out_r[6] = 1'b1;
          6'h03: out_r[6] = 1'b1;
          6'h04: out_r[6] = 1'b1;
          6'h06: out_r[6] = 1'b1;
          6'h07: out_r[6] = 1'b1;
          6'h08: out_r[6] = 1'b1;
          6'h09: out_r[6] = 1'b1;
          6'h0c: out_r[6] = 1'b1;
          6'h0e: out_r[6] = 1'b1;
          6'h12: out_r[6] = 1'b1;
          6'h1a: out_r[6] = 1'b1;
          6'h20: out_r[6] = 1'b1;
          6'h21: out_r[6] = 1'b1;
          6'h22: out_r[6] = 1'b1;
          6'h23: out_r[6] = 1'b1;
          6'h24: out_r[6] = 1'b1;
          6'h26: out_r[6] = 1'b1;
          6'h2a: out_r[6] = 1'b1;
          6'h2c: out_r[6] = 1'b1;
          6'h2e: out_r[6] = 1'b1;
          6'h2f: out_r[6] = 1'b1;
          6'h31: out_r[6] = 1'b1;
          6'h32: out_r[6] = 1'b1;
          6'h33: out_r[6] = 1'b1;
          6'h34: out_r[6] = 1'b1;
          6'h36: out_r[6] = 1'b1;
          6'h39: out_r[6] = 1'b1;
          6'h3c: out_r[6] = 1'b1;
          6'h3e: out_r[6] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[7] = 1'b1;
          6'h01: out_r[7] = 1'b1;
          6'h0a: out_r[7] = 1'b1;
          6'h0f: out_r[7] = 1'b1;
          6'h15: out_r[7] = 1'b1;
          6'h1b: out_r[7] = 1'b1;
          6'h1d: out_r[7] = 1'b1;
          6'h22: out_r[7] = 1'b1;
          6'h27: out_r[7] = 1'b1;
          6'h2c: out_r[7] = 1'b1;
          6'h2e: out_r[7] = 1'b1;
          6'h2f: out_r[7] = 1'b1;
          6'h30: out_r[7] = 1'b1;
          6'h32: out_r[7] = 1'b1;
          6'h35: out_r[7] = 1'b1;
          6'h38: out_r[7] = 1'b1;
          6'h3d: out_r[7] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h02: out_r[8] = 1'b0;
          6'h05: out_r[8] = 1'b0;
          6'h07: out_r[8] = 1'b0;
          6'h0a: out_r[8] = 1'b0;
          6'h0b: out_r[8] = 1'b0;
          6'h0d: out_r[8] = 1'b0;
          6'h0f: out_r[8] = 1'b0;
          6'h12: out_r[8] = 1'b0;
          6'h15: out_r[8] = 1'b0;
          6'h17: out_r[8] = 1'b0;
          6'h1a: out_r[8] = 1'b0;
          6'h1b: out_r[8] = 1'b0;
          6'h1d: out_r[8] = 1'b0;
          6'h1f: out_r[8] = 1'b0;
          6'h20: out_r[8] = 1'b0;
          6'h22: out_r[8] = 1'b0;
          6'h25: out_r[8] = 1'b0;
          6'h27: out_r[8] = 1'b0;
          6'h28: out_r[8] = 1'b0;
          6'h29: out_r[8] = 1'b0;
          6'h2a: out_r[8] = 1'b0;
          6'h2b: out_r[8] = 1'b0;
          6'h30: out_r[8] = 1'b0;
          6'h35: out_r[8] = 1'b0;
          6'h37: out_r[8] = 1'b0;
          6'h38: out_r[8] = 1'b0;
          6'h3a: out_r[8] = 1'b0;
          6'h3d: out_r[8] = 1'b0;
          6'h3f: out_r[8] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h03: out_r[9] = 1'b0;
          6'h0c: out_r[9] = 1'b0;
          6'h0e: out_r[9] = 1'b0;
          6'h0f: out_r[9] = 1'b0;
          6'h13: out_r[9] = 1'b0;
          6'h17: out_r[9] = 1'b0;
          6'h1f: out_r[9] = 1'b0;
          6'h21: out_r[9] = 1'b0;
          6'h23: out_r[9] = 1'b0;
          6'h24: out_r[9] = 1'b0;
          6'h26: out_r[9] = 1'b0;
          6'h2b: out_r[9] = 1'b0;
          6'h31: out_r[9] = 1'b0;
          6'h33: out_r[9] = 1'b0;
          6'h34: out_r[9] = 1'b0;
          6'h36: out_r[9] = 1'b0;
          6'h39: out_r[9] = 1'b0;
          6'h3a: out_r[9] = 1'b0;
          6'h3c: out_r[9] = 1'b0;
          6'h3e: out_r[9] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h03: out_r[10] = 1'b0;
          6'h0c: out_r[10] = 1'b0;
          6'h0e: out_r[10] = 1'b0;
          6'h0f: out_r[10] = 1'b0;
          6'h13: out_r[10] = 1'b0;
          6'h17: out_r[10] = 1'b0;
          6'h1f: out_r[10] = 1'b0;
          6'h20: out_r[10] = 1'b0;
          6'h21: out_r[10] = 1'b0;
          6'h23: out_r[10] = 1'b0;
          6'h27: out_r[10] = 1'b0;
          6'h2f: out_r[10] = 1'b0;
          6'h30: out_r[10] = 1'b0;
          6'h31: out_r[10] = 1'b0;
          6'h33: out_r[10] = 1'b0;
          6'h34: out_r[10] = 1'b0;
          6'h36: out_r[10] = 1'b0;
          6'h38: out_r[10] = 1'b0;
          6'h39: out_r[10] = 1'b0;
          6'h3c: out_r[10] = 1'b0;
          6'h3e: out_r[10] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h02: out_r[11] = 1'b1;
          6'h07: out_r[11] = 1'b1;
          6'h0b: out_r[11] = 1'b1;
          6'h0c: out_r[11] = 1'b1;
          6'h0d: out_r[11] = 1'b1;
          6'h0e: out_r[11] = 1'b1;
          6'h12: out_r[11] = 1'b1;
          6'h13: out_r[11] = 1'b1;
          6'h17: out_r[11] = 1'b1;
          6'h1a: out_r[11] = 1'b1;
          6'h1f: out_r[11] = 1'b1;
          6'h20: out_r[11] = 1'b1;
          6'h23: out_r[11] = 1'b1;
          6'h27: out_r[11] = 1'b1;
          6'h28: out_r[11] = 1'b1;
          6'h29: out_r[11] = 1'b1;
          6'h2a: out_r[11] = 1'b1;
          6'h2f: out_r[11] = 1'b1;
          6'h30: out_r[11] = 1'b1;
          6'h33: out_r[11] = 1'b1;
          6'h38: out_r[11] = 1'b1;
          default: begin end
        endcase
      end
      6'h35: begin
        out_r = 12'h877;
        case (inner)
          6'h03: out_r[0] = 1'b0;
          6'h0a: out_r[0] = 1'b0;
          6'h0b: out_r[0] = 1'b0;
          6'h0c: out_r[0] = 1'b0;
          6'h0d: out_r[0] = 1'b0;
          6'h0f: out_r[0] = 1'b0;
          6'h11: out_r[0] = 1'b0;
          6'h12: out_r[0] = 1'b0;
          6'h13: out_r[0] = 1'b0;
          6'h14: out_r[0] = 1'b0;
          6'h16: out_r[0] = 1'b0;
          6'h19: out_r[0] = 1'b0;
          6'h1c: out_r[0] = 1'b0;
          6'h1e: out_r[0] = 1'b0;
          6'h20: out_r[0] = 1'b0;
          6'h23: out_r[0] = 1'b0;
          6'h25: out_r[0] = 1'b0;
          6'h26: out_r[0] = 1'b0;
          6'h27: out_r[0] = 1'b0;
          6'h2a: out_r[0] = 1'b0;
          6'h2b: out_r[0] = 1'b0;
          6'h2c: out_r[0] = 1'b0;
          6'h2e: out_r[0] = 1'b0;
          6'h30: out_r[0] = 1'b0;
          6'h33: out_r[0] = 1'b0;
          6'h34: out_r[0] = 1'b0;
          6'h36: out_r[0] = 1'b0;
          6'h38: out_r[0] = 1'b0;
          6'h3b: out_r[0] = 1'b0;
          6'h3c: out_r[0] = 1'b0;
          6'h3e: out_r[0] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[1] = 1'b0;
          6'h03: out_r[1] = 1'b0;
          6'h04: out_r[1] = 1'b0;
          6'h05: out_r[1] = 1'b0;
          6'h07: out_r[1] = 1'b0;
          6'h08: out_r[1] = 1'b0;
          6'h0e: out_r[1] = 1'b0;
          6'h10: out_r[1] = 1'b0;
          6'h11: out_r[1] = 1'b0;
          6'h15: out_r[1] = 1'b0;
          6'h17: out_r[1] = 1'b0;
          6'h18: out_r[1] = 1'b0;
          6'h19: out_r[1] = 1'b0;
          6'h1a: out_r[1] = 1'b0;
          6'h1d: out_r[1] = 1'b0;
          6'h1f: out_r[1] = 1'b0;
          6'h23: out_r[1] = 1'b0;
          6'h24: out_r[1] = 1'b0;
          6'h26: out_r[1] = 1'b0;
          6'h28: out_r[1] = 1'b0;
          6'h2d: out_r[1] = 1'b0;
          6'h2f: out_r[1] = 1'b0;
          6'h32: out_r[1] = 1'b0;
          6'h33: out_r[1] = 1'b0;
          6'h35: out_r[1] = 1'b0;
          6'h37: out_r[1] = 1'b0;
          6'h3a: out_r[1] = 1'b0;
          6'h3d: out_r[1] = 1'b0;
          6'h3f: out_r[1] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[2] = 1'b0;
          6'h01: out_r[2] = 1'b0;
          6'h04: out_r[2] = 1'b0;
          6'h05: out_r[2] = 1'b0;
          6'h07: out_r[2] = 1'b0;
          6'h08: out_r[2] = 1'b0;
          6'h10: out_r[2] = 1'b0;
          6'h18: out_r[2] = 1'b0;
          6'h21: out_r[2] = 1'b0;
          6'h24: out_r[2] = 1'b0;
          6'h26: out_r[2] = 1'b0;
          6'h29: out_r[2] = 1'b0;
          6'h2d: out_r[2] = 1'b0;
          6'h2f: out_r[2] = 1'b0;
          6'h31: out_r[2] = 1'b0;
          6'h35: out_r[2] = 1'b0;
          6'h37: out_r[2] = 1'b0;
          6'h39: out_r[2] = 1'b0;
          6'h3a: out_r[2] = 1'b0;
          6'h3d: out_r[2] = 1'b0;
          6'h3f: out_r[2] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h0a: out_r[3] = 1'b1;
          6'h0c: out_r[3] = 1'b1;
          6'h10: out_r[3] = 1'b1;
          6'h13: out_r[3] = 1'b1;
          6'h14: out_r[3] = 1'b1;
          6'h18: out_r[3] = 1'b1;
          6'h1c: out_r[3] = 1'b1;
          6'h20: out_r[3] = 1'b1;
          6'h25: out_r[3] = 1'b1;
          6'h27: out_r[3] = 1'b1;
          6'h2c: out_r[3] = 1'b1;
          6'h30: out_r[3] = 1'b1;
          6'h34: out_r[3] = 1'b1;
          6'h35: out_r[3] = 1'b1;
          6'h36: out_r[3] = 1'b1;
          6'h37: out_r[3] = 1'b1;
          6'h38: out_r[3] = 1'b1;
          6'h3a: out_r[3] = 1'b1;
          6'h3c: out_r[3] = 1'b1;
          6'h3d: out_r[3] = 1'b1;
          6'h3e: out_r[3] = 1'b1;
          6'h3f: out_r[3] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h02: out_r[4] = 1'b0;
          6'h0a: out_r[4] = 1'b0;
          6'h0c: out_r[4] = 1'b0;
          6'h0e: out_r[4] = 1'b0;
          6'h10: out_r[4] = 1'b0;
          6'h14: out_r[4] = 1'b0;
          6'h18: out_r[4] = 1'b0;
          6'h1c: out_r[4] = 1'b0;
          6'h21: out_r[4] = 1'b0;
          6'h22: out_r[4] = 1'b0;
          6'h24: out_r[4] = 1'b0;
          6'h2c: out_r[4] = 1'b0;
          6'h32: out_r[4] = 1'b0;
          6'h35: out_r[4] = 1'b0;
          6'h37: out_r[4] = 1'b0;
          6'h3a: out_r[4] = 1'b0;
          6'h3d: out_r[4] = 1'b0;
          6'h3f: out_r[4] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[5] = 1'b0;
          6'h01: out_r[5] = 1'b0;
          6'h03: out_r[5] = 1'b0;
          6'h09: out_r[5] = 1'b0;
          6'h0b: out_r[5] = 1'b0;
          6'h0d: out_r[5] = 1'b0;
          6'h0f: out_r[5] = 1'b0;
          6'h11: out_r[5] = 1'b0;
          6'h12: out_r[5] = 1'b0;
          6'h16: out_r[5] = 1'b0;
          6'h19: out_r[5] = 1'b0;
          6'h1a: out_r[5] = 1'b0;
          6'h1b: out_r[5] = 1'b0;
          6'h1e: out_r[5] = 1'b0;
          6'h23: out_r[5] = 1'b0;
          6'h26: out_r[5] = 1'b0;
          6'h29: out_r[5] = 1'b0;
          6'h2a: out_r[5] = 1'b0;
          6'h2b: out_r[5] = 1'b0;
          6'h2c: out_r[5] = 1'b0;
          6'h2e: out_r[5] = 1'b0;
          6'h31: out_r[5] = 1'b0;
          6'h33: out_r[5] = 1'b0;
          6'h35: out_r[5] = 1'b0;
          6'h37: out_r[5] = 1'b0;
          6'h39: out_r[5] = 1'b0;
          6'h3b: out_r[5] = 1'b0;
          6'h3d: out_r[5] = 1'b0;
          6'h3f: out_r[5] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[6] = 1'b0;
          6'h01: out_r[6] = 1'b0;
          6'h03: out_r[6] = 1'b0;
          6'h04: out_r[6] = 1'b0;
          6'h05: out_r[6] = 1'b0;
          6'h07: out_r[6] = 1'b0;
          6'h09: out_r[6] = 1'b0;
          6'h0b: out_r[6] = 1'b0;
          6'h0d: out_r[6] = 1'b0;
          6'h0f: out_r[6] = 1'b0;
          6'h11: out_r[6] = 1'b0;
          6'h12: out_r[6] = 1'b0;
          6'h16: out_r[6] = 1'b0;
          6'h19: out_r[6] = 1'b0;
          6'h1a: out_r[6] = 1'b0;
          6'h1b: out_r[6] = 1'b0;
          6'h1e: out_r[6] = 1'b0;
          6'h23: out_r[6] = 1'b0;
          6'h26: out_r[6] = 1'b0;
          6'h2b: out_r[6] = 1'b0;
          6'h2e: out_r[6] = 1'b0;
          6'h31: out_r[6] = 1'b0;
          6'h33: out_r[6] = 1'b0;
          6'h39: out_r[6] = 1'b0;
          6'h3b: out_r[6] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h02: out_r[7] = 1'b1;
          6'h0c: out_r[7] = 1'b1;
          6'h16: out_r[7] = 1'b1;
          6'h1e: out_r[7] = 1'b1;
          6'h21: out_r[7] = 1'b1;
          6'h22: out_r[7] = 1'b1;
          6'h26: out_r[7] = 1'b1;
          6'h31: out_r[7] = 1'b1;
          6'h32: out_r[7] = 1'b1;
          6'h33: out_r[7] = 1'b1;
          6'h39: out_r[7] = 1'b1;
          6'h3a: out_r[7] = 1'b1;
          6'h3b: out_r[7] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h03: out_r[8] = 1'b1;
          6'h05: out_r[8] = 1'b1;
          6'h06: out_r[8] = 1'b1;
          6'h07: out_r[8] = 1'b1;
          6'h0a: out_r[8] = 1'b1;
          6'h0e: out_r[8] = 1'b1;
          6'h12: out_r[8] = 1'b1;
          6'h13: out_r[8] = 1'b1;
          6'h14: out_r[8] = 1'b1;
          6'h15: out_r[8] = 1'b1;
          6'h17: out_r[8] = 1'b1;
          6'h1c: out_r[8] = 1'b1;
          6'h1d: out_r[8] = 1'b1;
          6'h1f: out_r[8] = 1'b1;
          6'h20: out_r[8] = 1'b1;
          6'h21: out_r[8] = 1'b1;
          6'h23: out_r[8] = 1'b1;
          6'h24: out_r[8] = 1'b1;
          6'h25: out_r[8] = 1'b1;
          6'h27: out_r[8] = 1'b1;
          6'h29: out_r[8] = 1'b1;
          6'h2a: out_r[8] = 1'b1;
          6'h2d: out_r[8] = 1'b1;
          6'h2e: out_r[8] = 1'b1;
          6'h2f: out_r[8] = 1'b1;
          6'h30: out_r[8] = 1'b1;
          6'h35: out_r[8] = 1'b1;
          6'h37: out_r[8] = 1'b1;
          6'h38: out_r[8] = 1'b1;
          6'h3d: out_r[8] = 1'b1;
          6'h3f: out_r[8] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[9] = 1'b1;
          6'h01: out_r[9] = 1'b1;
          6'h02: out_r[9] = 1'b1;
          6'h04: out_r[9] = 1'b1;
          6'h06: out_r[9] = 1'b1;
          6'h08: out_r[9] = 1'b1;
          6'h09: out_r[9] = 1'b1;
          6'h0c: out_r[9] = 1'b1;
          6'h0e: out_r[9] = 1'b1;
          6'h10: out_r[9] = 1'b1;
          6'h11: out_r[9] = 1'b1;
          6'h12: out_r[9] = 1'b1;
          6'h16: out_r[9] = 1'b1;
          6'h18: out_r[9] = 1'b1;
          6'h19: out_r[9] = 1'b1;
          6'h1b: out_r[9] = 1'b1;
          6'h1e: out_r[9] = 1'b1;
          6'h21: out_r[9] = 1'b1;
          6'h22: out_r[9] = 1'b1;
          6'h23: out_r[9] = 1'b1;
          6'h26: out_r[9] = 1'b1;
          6'h28: out_r[9] = 1'b1;
          6'h29: out_r[9] = 1'b1;
          6'h2a: out_r[9] = 1'b1;
          6'h2b: out_r[9] = 1'b1;
          6'h2c: out_r[9] = 1'b1;
          6'h32: out_r[9] = 1'b1;
          6'h34: out_r[9] = 1'b1;
          6'h36: out_r[9] = 1'b1;
          6'h3a: out_r[9] = 1'b1;
          6'h3c: out_r[9] = 1'b1;
          6'h3e: out_r[9] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[10] = 1'b1;
          6'h04: out_r[10] = 1'b1;
          6'h08: out_r[10] = 1'b1;
          6'h09: out_r[10] = 1'b1;
          6'h0b: out_r[10] = 1'b1;
          6'h0c: out_r[10] = 1'b1;
          6'h0d: out_r[10] = 1'b1;
          6'h0e: out_r[10] = 1'b1;
          6'h0f: out_r[10] = 1'b1;
          6'h10: out_r[10] = 1'b1;
          6'h11: out_r[10] = 1'b1;
          6'h12: out_r[10] = 1'b1;
          6'h16: out_r[10] = 1'b1;
          6'h18: out_r[10] = 1'b1;
          6'h19: out_r[10] = 1'b1;
          6'h1b: out_r[10] = 1'b1;
          6'h1e: out_r[10] = 1'b1;
          6'h23: out_r[10] = 1'b1;
          6'h26: out_r[10] = 1'b1;
          6'h28: out_r[10] = 1'b1;
          6'h2a: out_r[10] = 1'b1;
          6'h2b: out_r[10] = 1'b1;
          6'h2c: out_r[10] = 1'b1;
          6'h2e: out_r[10] = 1'b1;
          6'h32: out_r[10] = 1'b1;
          6'h33: out_r[10] = 1'b1;
          6'h34: out_r[10] = 1'b1;
          6'h36: out_r[10] = 1'b1;
          6'h3b: out_r[10] = 1'b1;
          6'h3c: out_r[10] = 1'b1;
          6'h3e: out_r[10] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h03: out_r[11] = 1'b0;
          6'h05: out_r[11] = 1'b0;
          6'h07: out_r[11] = 1'b0;
          6'h0a: out_r[11] = 1'b0;
          6'h0e: out_r[11] = 1'b0;
          6'h11: out_r[11] = 1'b0;
          6'h13: out_r[11] = 1'b0;
          6'h15: out_r[11] = 1'b0;
          6'h16: out_r[11] = 1'b0;
          6'h17: out_r[11] = 1'b0;
          6'h19: out_r[11] = 1'b0;
          6'h1d: out_r[11] = 1'b0;
          6'h1e: out_r[11] = 1'b0;
          6'h1f: out_r[11] = 1'b0;
          6'h23: out_r[11] = 1'b0;
          6'h26: out_r[11] = 1'b0;
          6'h2a: out_r[11] = 1'b0;
          6'h2b: out_r[11] = 1'b0;
          6'h2d: out_r[11] = 1'b0;
          6'h2e: out_r[11] = 1'b0;
          6'h2f: out_r[11] = 1'b0;
          6'h33: out_r[11] = 1'b0;
          6'h3b: out_r[11] = 1'b0;
          default: begin end
        endcase
      end
      6'h36: begin
        out_r = 12'haeb;
        case (inner)
          6'h04: out_r[0] = 1'b0;
          6'h06: out_r[0] = 1'b0;
          6'h07: out_r[0] = 1'b0;
          6'h0b: out_r[0] = 1'b0;
          6'h0c: out_r[0] = 1'b0;
          6'h0d: out_r[0] = 1'b0;
          6'h0f: out_r[0] = 1'b0;
          6'h10: out_r[0] = 1'b0;
          6'h11: out_r[0] = 1'b0;
          6'h16: out_r[0] = 1'b0;
          6'h1e: out_r[0] = 1'b0;
          6'h20: out_r[0] = 1'b0;
          6'h25: out_r[0] = 1'b0;
          6'h29: out_r[0] = 1'b0;
          6'h2c: out_r[0] = 1'b0;
          6'h2d: out_r[0] = 1'b0;
          6'h30: out_r[0] = 1'b0;
          6'h32: out_r[0] = 1'b0;
          6'h33: out_r[0] = 1'b0;
          6'h35: out_r[0] = 1'b0;
          6'h39: out_r[0] = 1'b0;
          6'h3a: out_r[0] = 1'b0;
          6'h3b: out_r[0] = 1'b0;
          6'h3d: out_r[0] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h04: out_r[1] = 1'b0;
          6'h07: out_r[1] = 1'b0;
          6'h0a: out_r[1] = 1'b0;
          6'h0b: out_r[1] = 1'b0;
          6'h0d: out_r[1] = 1'b0;
          6'h0e: out_r[1] = 1'b0;
          6'h11: out_r[1] = 1'b0;
          6'h16: out_r[1] = 1'b0;
          6'h1e: out_r[1] = 1'b0;
          6'h20: out_r[1] = 1'b0;
          6'h21: out_r[1] = 1'b0;
          6'h24: out_r[1] = 1'b0;
          6'h25: out_r[1] = 1'b0;
          6'h26: out_r[1] = 1'b0;
          6'h27: out_r[1] = 1'b0;
          6'h2d: out_r[1] = 1'b0;
          6'h2e: out_r[1] = 1'b0;
          6'h2f: out_r[1] = 1'b0;
          6'h32: out_r[1] = 1'b0;
          6'h33: out_r[1] = 1'b0;
          6'h34: out_r[1] = 1'b0;
          6'h35: out_r[1] = 1'b0;
          6'h36: out_r[1] = 1'b0;
          6'h37: out_r[1] = 1'b0;
          6'h3a: out_r[1] = 1'b0;
          6'h3b: out_r[1] = 1'b0;
          6'h3c: out_r[1] = 1'b0;
          6'h3d: out_r[1] = 1'b0;
          6'h3e: out_r[1] = 1'b0;
          6'h3f: out_r[1] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h02: out_r[2] = 1'b1;
          6'h0a: out_r[2] = 1'b1;
          6'h0e: out_r[2] = 1'b1;
          6'h11: out_r[2] = 1'b1;
          6'h17: out_r[2] = 1'b1;
          6'h1f: out_r[2] = 1'b1;
          6'h21: out_r[2] = 1'b1;
          6'h2e: out_r[2] = 1'b1;
          6'h2f: out_r[2] = 1'b1;
          6'h34: out_r[2] = 1'b1;
          6'h35: out_r[2] = 1'b1;
          6'h36: out_r[2] = 1'b1;
          6'h37: out_r[2] = 1'b1;
          6'h38: out_r[2] = 1'b1;
          6'h3c: out_r[2] = 1'b1;
          6'h3d: out_r[2] = 1'b1;
          6'h3e: out_r[2] = 1'b1;
          6'h3f: out_r[2] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h04: out_r[3] = 1'b0;
          6'h07: out_r[3] = 1'b0;
          6'h0b: out_r[3] = 1'b0;
          6'h0c: out_r[3] = 1'b0;
          6'h0d: out_r[3] = 1'b0;
          6'h2c: out_r[3] = 1'b0;
          6'h2d: out_r[3] = 1'b0;
          6'h2e: out_r[3] = 1'b0;
          6'h2f: out_r[3] = 1'b0;
          6'h31: out_r[3] = 1'b0;
          6'h34: out_r[3] = 1'b0;
          6'h35: out_r[3] = 1'b0;
          6'h36: out_r[3] = 1'b0;
          6'h37: out_r[3] = 1'b0;
          6'h3c: out_r[3] = 1'b0;
          6'h3d: out_r[3] = 1'b0;
          6'h3e: out_r[3] = 1'b0;
          6'h3f: out_r[3] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h02: out_r[4] = 1'b1;
          6'h04: out_r[4] = 1'b1;
          6'h06: out_r[4] = 1'b1;
          6'h0a: out_r[4] = 1'b1;
          6'h0c: out_r[4] = 1'b1;
          6'h0d: out_r[4] = 1'b1;
          6'h0f: out_r[4] = 1'b1;
          6'h11: out_r[4] = 1'b1;
          6'h16: out_r[4] = 1'b1;
          6'h17: out_r[4] = 1'b1;
          6'h19: out_r[4] = 1'b1;
          6'h1e: out_r[4] = 1'b1;
          6'h1f: out_r[4] = 1'b1;
          6'h20: out_r[4] = 1'b1;
          6'h21: out_r[4] = 1'b1;
          6'h24: out_r[4] = 1'b1;
          6'h25: out_r[4] = 1'b1;
          6'h26: out_r[4] = 1'b1;
          6'h27: out_r[4] = 1'b1;
          6'h29: out_r[4] = 1'b1;
          6'h30: out_r[4] = 1'b1;
          6'h31: out_r[4] = 1'b1;
          6'h32: out_r[4] = 1'b1;
          6'h33: out_r[4] = 1'b1;
          6'h38: out_r[4] = 1'b1;
          6'h39: out_r[4] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h02: out_r[5] = 1'b0;
          6'h04: out_r[5] = 1'b0;
          6'h06: out_r[5] = 1'b0;
          6'h0a: out_r[5] = 1'b0;
          6'h0c: out_r[5] = 1'b0;
          6'h0d: out_r[5] = 1'b0;
          6'h0f: out_r[5] = 1'b0;
          6'h11: out_r[5] = 1'b0;
          6'h16: out_r[5] = 1'b0;
          6'h17: out_r[5] = 1'b0;
          6'h19: out_r[5] = 1'b0;
          6'h1e: out_r[5] = 1'b0;
          6'h1f: out_r[5] = 1'b0;
          6'h20: out_r[5] = 1'b0;
          6'h21: out_r[5] = 1'b0;
          6'h29: out_r[5] = 1'b0;
          6'h2c: out_r[5] = 1'b0;
          6'h2d: out_r[5] = 1'b0;
          6'h2e: out_r[5] = 1'b0;
          6'h2f: out_r[5] = 1'b0;
          6'h30: out_r[5] = 1'b0;
          6'h31: out_r[5] = 1'b0;
          6'h32: out_r[5] = 1'b0;
          6'h33: out_r[5] = 1'b0;
          6'h35: out_r[5] = 1'b0;
          6'h38: out_r[5] = 1'b0;
          6'h39: out_r[5] = 1'b0;
          6'h3d: out_r[5] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h02: out_r[6] = 1'b0;
          6'h04: out_r[6] = 1'b0;
          6'h06: out_r[6] = 1'b0;
          6'h0a: out_r[6] = 1'b0;
          6'h0d: out_r[6] = 1'b0;
          6'h0f: out_r[6] = 1'b0;
          6'h16: out_r[6] = 1'b0;
          6'h17: out_r[6] = 1'b0;
          6'h19: out_r[6] = 1'b0;
          6'h1e: out_r[6] = 1'b0;
          6'h1f: out_r[6] = 1'b0;
          6'h20: out_r[6] = 1'b0;
          6'h21: out_r[6] = 1'b0;
          6'h25: out_r[6] = 1'b0;
          6'h29: out_r[6] = 1'b0;
          6'h2c: out_r[6] = 1'b0;
          6'h2d: out_r[6] = 1'b0;
          6'h2e: out_r[6] = 1'b0;
          6'h2f: out_r[6] = 1'b0;
          6'h30: out_r[6] = 1'b0;
          6'h32: out_r[6] = 1'b0;
          6'h33: out_r[6] = 1'b0;
          6'h38: out_r[6] = 1'b0;
          6'h39: out_r[6] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h04: out_r[7] = 1'b0;
          6'h0a: out_r[7] = 1'b0;
          6'h0c: out_r[7] = 1'b0;
          6'h11: out_r[7] = 1'b0;
          6'h16: out_r[7] = 1'b0;
          6'h17: out_r[7] = 1'b0;
          6'h19: out_r[7] = 1'b0;
          6'h1e: out_r[7] = 1'b0;
          6'h1f: out_r[7] = 1'b0;
          6'h20: out_r[7] = 1'b0;
          6'h24: out_r[7] = 1'b0;
          6'h26: out_r[7] = 1'b0;
          6'h27: out_r[7] = 1'b0;
          6'h29: out_r[7] = 1'b0;
          6'h2c: out_r[7] = 1'b0;
          6'h2d: out_r[7] = 1'b0;
          6'h2e: out_r[7] = 1'b0;
          6'h2f: out_r[7] = 1'b0;
          6'h31: out_r[7] = 1'b0;
          6'h32: out_r[7] = 1'b0;
          6'h33: out_r[7] = 1'b0;
          6'h34: out_r[7] = 1'b0;
          6'h35: out_r[7] = 1'b0;
          6'h36: out_r[7] = 1'b0;
          6'h37: out_r[7] = 1'b0;
          6'h38: out_r[7] = 1'b0;
          6'h3c: out_r[7] = 1'b0;
          6'h3d: out_r[7] = 1'b0;
          6'h3e: out_r[7] = 1'b0;
          6'h3f: out_r[7] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h07: out_r[8] = 1'b1;
          6'h0a: out_r[8] = 1'b1;
          6'h0c: out_r[8] = 1'b1;
          6'h10: out_r[8] = 1'b1;
          6'h11: out_r[8] = 1'b1;
          6'h26: out_r[8] = 1'b1;
          6'h27: out_r[8] = 1'b1;
          6'h2e: out_r[8] = 1'b1;
          6'h2f: out_r[8] = 1'b1;
          6'h31: out_r[8] = 1'b1;
          6'h35: out_r[8] = 1'b1;
          6'h36: out_r[8] = 1'b1;
          6'h37: out_r[8] = 1'b1;
          6'h3a: out_r[8] = 1'b1;
          6'h3b: out_r[8] = 1'b1;
          6'h3d: out_r[8] = 1'b1;
          6'h3e: out_r[8] = 1'b1;
          6'h3f: out_r[8] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h0e: out_r[9] = 1'b0;
          6'h19: out_r[9] = 1'b0;
          6'h20: out_r[9] = 1'b0;
          6'h21: out_r[9] = 1'b0;
          6'h25: out_r[9] = 1'b0;
          6'h26: out_r[9] = 1'b0;
          6'h27: out_r[9] = 1'b0;
          6'h29: out_r[9] = 1'b0;
          6'h2d: out_r[9] = 1'b0;
          6'h2e: out_r[9] = 1'b0;
          6'h2f: out_r[9] = 1'b0;
          6'h35: out_r[9] = 1'b0;
          6'h36: out_r[9] = 1'b0;
          6'h37: out_r[9] = 1'b0;
          6'h38: out_r[9] = 1'b0;
          6'h3d: out_r[9] = 1'b0;
          6'h3e: out_r[9] = 1'b0;
          6'h3f: out_r[9] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h04: out_r[10] = 1'b1;
          6'h06: out_r[10] = 1'b1;
          6'h07: out_r[10] = 1'b1;
          6'h0a: out_r[10] = 1'b1;
          6'h0b: out_r[10] = 1'b1;
          6'h0c: out_r[10] = 1'b1;
          6'h0d: out_r[10] = 1'b1;
          6'h0e: out_r[10] = 1'b1;
          6'h0f: out_r[10] = 1'b1;
          6'h10: out_r[10] = 1'b1;
          6'h11: out_r[10] = 1'b1;
          6'h16: out_r[10] = 1'b1;
          6'h1e: out_r[10] = 1'b1;
          6'h20: out_r[10] = 1'b1;
          6'h21: out_r[10] = 1'b1;
          6'h24: out_r[10] = 1'b1;
          6'h29: out_r[10] = 1'b1;
          6'h2c: out_r[10] = 1'b1;
          6'h30: out_r[10] = 1'b1;
          6'h32: out_r[10] = 1'b1;
          6'h33: out_r[10] = 1'b1;
          6'h34: out_r[10] = 1'b1;
          6'h39: out_r[10] = 1'b1;
          6'h3a: out_r[10] = 1'b1;
          6'h3b: out_r[10] = 1'b1;
          6'h3c: out_r[10] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h04: out_r[11] = 1'b0;
          6'h06: out_r[11] = 1'b0;
          6'h07: out_r[11] = 1'b0;
          6'h0a: out_r[11] = 1'b0;
          6'h0b: out_r[11] = 1'b0;
          6'h0c: out_r[11] = 1'b0;
          6'h0d: out_r[11] = 1'b0;
          6'h0e: out_r[11] = 1'b0;
          6'h0f: out_r[11] = 1'b0;
          6'h10: out_r[11] = 1'b0;
          6'h11: out_r[11] = 1'b0;
          6'h16: out_r[11] = 1'b0;
          6'h1e: out_r[11] = 1'b0;
          6'h20: out_r[11] = 1'b0;
          6'h21: out_r[11] = 1'b0;
          6'h25: out_r[11] = 1'b0;
          6'h29: out_r[11] = 1'b0;
          6'h2d: out_r[11] = 1'b0;
          6'h2e: out_r[11] = 1'b0;
          6'h2f: out_r[11] = 1'b0;
          6'h30: out_r[11] = 1'b0;
          6'h32: out_r[11] = 1'b0;
          6'h33: out_r[11] = 1'b0;
          6'h35: out_r[11] = 1'b0;
          6'h39: out_r[11] = 1'b0;
          6'h3a: out_r[11] = 1'b0;
          6'h3b: out_r[11] = 1'b0;
          6'h3d: out_r[11] = 1'b0;
          default: begin end
        endcase
      end
      6'h37: begin
        out_r = 12'ha3a;
        case (inner)
          6'h02: out_r[0] = 1'b1;
          6'h04: out_r[0] = 1'b1;
          6'h06: out_r[0] = 1'b1;
          6'h09: out_r[0] = 1'b1;
          6'h0a: out_r[0] = 1'b1;
          6'h0e: out_r[0] = 1'b1;
          6'h16: out_r[0] = 1'b1;
          6'h18: out_r[0] = 1'b1;
          6'h19: out_r[0] = 1'b1;
          6'h1a: out_r[0] = 1'b1;
          6'h1e: out_r[0] = 1'b1;
          6'h21: out_r[0] = 1'b1;
          6'h23: out_r[0] = 1'b1;
          6'h24: out_r[0] = 1'b1;
          6'h25: out_r[0] = 1'b1;
          6'h27: out_r[0] = 1'b1;
          6'h2a: out_r[0] = 1'b1;
          6'h2d: out_r[0] = 1'b1;
          6'h2e: out_r[0] = 1'b1;
          6'h2f: out_r[0] = 1'b1;
          6'h32: out_r[0] = 1'b1;
          6'h34: out_r[0] = 1'b1;
          6'h36: out_r[0] = 1'b1;
          6'h38: out_r[0] = 1'b1;
          6'h3a: out_r[0] = 1'b1;
          6'h3c: out_r[0] = 1'b1;
          6'h3e: out_r[0] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h02: out_r[1] = 1'b0;
          6'h07: out_r[1] = 1'b0;
          6'h0b: out_r[1] = 1'b0;
          6'h0e: out_r[1] = 1'b0;
          6'h0f: out_r[1] = 1'b0;
          6'h14: out_r[1] = 1'b0;
          6'h17: out_r[1] = 1'b0;
          6'h1a: out_r[1] = 1'b0;
          6'h1b: out_r[1] = 1'b0;
          6'h1c: out_r[1] = 1'b0;
          6'h1f: out_r[1] = 1'b0;
          6'h21: out_r[1] = 1'b0;
          6'h23: out_r[1] = 1'b0;
          6'h24: out_r[1] = 1'b0;
          6'h25: out_r[1] = 1'b0;
          6'h27: out_r[1] = 1'b0;
          6'h2a: out_r[1] = 1'b0;
          6'h2d: out_r[1] = 1'b0;
          6'h2e: out_r[1] = 1'b0;
          6'h2f: out_r[1] = 1'b0;
          6'h32: out_r[1] = 1'b0;
          6'h34: out_r[1] = 1'b0;
          6'h37: out_r[1] = 1'b0;
          6'h3c: out_r[1] = 1'b0;
          6'h3f: out_r[1] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[2] = 1'b1;
          6'h01: out_r[2] = 1'b1;
          6'h03: out_r[2] = 1'b1;
          6'h08: out_r[2] = 1'b1;
          6'h0c: out_r[2] = 1'b1;
          6'h12: out_r[2] = 1'b1;
          6'h14: out_r[2] = 1'b1;
          6'h18: out_r[2] = 1'b1;
          6'h19: out_r[2] = 1'b1;
          6'h1c: out_r[2] = 1'b1;
          6'h22: out_r[2] = 1'b1;
          6'h26: out_r[2] = 1'b1;
          6'h28: out_r[2] = 1'b1;
          6'h29: out_r[2] = 1'b1;
          6'h2b: out_r[2] = 1'b1;
          6'h2c: out_r[2] = 1'b1;
          6'h31: out_r[2] = 1'b1;
          6'h33: out_r[2] = 1'b1;
          6'h39: out_r[2] = 1'b1;
          6'h3b: out_r[2] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h08: out_r[3] = 1'b0;
          6'h0c: out_r[3] = 1'b0;
          6'h18: out_r[3] = 1'b0;
          6'h1a: out_r[3] = 1'b0;
          6'h2c: out_r[3] = 1'b0;
          6'h2d: out_r[3] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h08: out_r[4] = 1'b0;
          6'h0a: out_r[4] = 1'b0;
          6'h0b: out_r[4] = 1'b0;
          6'h0c: out_r[4] = 1'b0;
          6'h0e: out_r[4] = 1'b0;
          6'h0f: out_r[4] = 1'b0;
          6'h18: out_r[4] = 1'b0;
          6'h21: out_r[4] = 1'b0;
          6'h23: out_r[4] = 1'b0;
          6'h25: out_r[4] = 1'b0;
          6'h27: out_r[4] = 1'b0;
          6'h28: out_r[4] = 1'b0;
          6'h2c: out_r[4] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[5] = 1'b0;
          6'h01: out_r[5] = 1'b0;
          6'h02: out_r[5] = 1'b0;
          6'h03: out_r[5] = 1'b0;
          6'h04: out_r[5] = 1'b0;
          6'h11: out_r[5] = 1'b0;
          6'h12: out_r[5] = 1'b0;
          6'h13: out_r[5] = 1'b0;
          6'h14: out_r[5] = 1'b0;
          6'h15: out_r[5] = 1'b0;
          6'h19: out_r[5] = 1'b0;
          6'h1c: out_r[5] = 1'b0;
          6'h1d: out_r[5] = 1'b0;
          6'h22: out_r[5] = 1'b0;
          6'h24: out_r[5] = 1'b0;
          6'h26: out_r[5] = 1'b0;
          6'h29: out_r[5] = 1'b0;
          6'h2a: out_r[5] = 1'b0;
          6'h2b: out_r[5] = 1'b0;
          6'h2d: out_r[5] = 1'b0;
          6'h2e: out_r[5] = 1'b0;
          6'h2f: out_r[5] = 1'b0;
          6'h31: out_r[5] = 1'b0;
          6'h33: out_r[5] = 1'b0;
          6'h34: out_r[5] = 1'b0;
          6'h39: out_r[5] = 1'b0;
          6'h3b: out_r[5] = 1'b0;
          6'h3c: out_r[5] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h08: out_r[6] = 1'b1;
          6'h09: out_r[6] = 1'b1;
          6'h0a: out_r[6] = 1'b1;
          6'h0b: out_r[6] = 1'b1;
          6'h0c: out_r[6] = 1'b1;
          6'h0d: out_r[6] = 1'b1;
          6'h0e: out_r[6] = 1'b1;
          6'h0f: out_r[6] = 1'b1;
          6'h10: out_r[6] = 1'b1;
          6'h12: out_r[6] = 1'b1;
          6'h17: out_r[6] = 1'b1;
          6'h18: out_r[6] = 1'b1;
          6'h19: out_r[6] = 1'b1;
          6'h1a: out_r[6] = 1'b1;
          6'h1b: out_r[6] = 1'b1;
          6'h1f: out_r[6] = 1'b1;
          6'h20: out_r[6] = 1'b1;
          6'h21: out_r[6] = 1'b1;
          6'h23: out_r[6] = 1'b1;
          6'h25: out_r[6] = 1'b1;
          6'h27: out_r[6] = 1'b1;
          6'h28: out_r[6] = 1'b1;
          6'h29: out_r[6] = 1'b1;
          6'h2b: out_r[6] = 1'b1;
          6'h2c: out_r[6] = 1'b1;
          6'h2d: out_r[6] = 1'b1;
          6'h2f: out_r[6] = 1'b1;
          6'h32: out_r[6] = 1'b1;
          6'h38: out_r[6] = 1'b1;
          6'h3a: out_r[6] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h02: out_r[7] = 1'b1;
          6'h0a: out_r[7] = 1'b1;
          6'h0b: out_r[7] = 1'b1;
          6'h0e: out_r[7] = 1'b1;
          6'h0f: out_r[7] = 1'b1;
          6'h14: out_r[7] = 1'b1;
          6'h16: out_r[7] = 1'b1;
          6'h1c: out_r[7] = 1'b1;
          6'h1e: out_r[7] = 1'b1;
          6'h21: out_r[7] = 1'b1;
          6'h22: out_r[7] = 1'b1;
          6'h23: out_r[7] = 1'b1;
          6'h25: out_r[7] = 1'b1;
          6'h27: out_r[7] = 1'b1;
          6'h28: out_r[7] = 1'b1;
          6'h2a: out_r[7] = 1'b1;
          6'h2e: out_r[7] = 1'b1;
          6'h30: out_r[7] = 1'b1;
          6'h31: out_r[7] = 1'b1;
          6'h33: out_r[7] = 1'b1;
          6'h34: out_r[7] = 1'b1;
          6'h35: out_r[7] = 1'b1;
          6'h36: out_r[7] = 1'b1;
          6'h37: out_r[7] = 1'b1;
          6'h39: out_r[7] = 1'b1;
          6'h3b: out_r[7] = 1'b1;
          6'h3c: out_r[7] = 1'b1;
          6'h3d: out_r[7] = 1'b1;
          6'h3e: out_r[7] = 1'b1;
          6'h3f: out_r[7] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h01: out_r[8] = 1'b1;
          6'h03: out_r[8] = 1'b1;
          6'h04: out_r[8] = 1'b1;
          6'h0d: out_r[8] = 1'b1;
          6'h0e: out_r[8] = 1'b1;
          6'h11: out_r[8] = 1'b1;
          6'h12: out_r[8] = 1'b1;
          6'h13: out_r[8] = 1'b1;
          6'h15: out_r[8] = 1'b1;
          6'h18: out_r[8] = 1'b1;
          6'h19: out_r[8] = 1'b1;
          6'h1d: out_r[8] = 1'b1;
          6'h21: out_r[8] = 1'b1;
          6'h23: out_r[8] = 1'b1;
          6'h25: out_r[8] = 1'b1;
          6'h27: out_r[8] = 1'b1;
          6'h29: out_r[8] = 1'b1;
          6'h2b: out_r[8] = 1'b1;
          6'h2d: out_r[8] = 1'b1;
          6'h2f: out_r[8] = 1'b1;
          6'h38: out_r[8] = 1'b1;
          6'h3a: out_r[8] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h01: out_r[9] = 1'b0;
          6'h03: out_r[9] = 1'b0;
          6'h0d: out_r[9] = 1'b0;
          6'h12: out_r[9] = 1'b0;
          6'h18: out_r[9] = 1'b0;
          6'h22: out_r[9] = 1'b0;
          6'h2a: out_r[9] = 1'b0;
          6'h31: out_r[9] = 1'b0;
          6'h33: out_r[9] = 1'b0;
          6'h35: out_r[9] = 1'b0;
          6'h36: out_r[9] = 1'b0;
          6'h37: out_r[9] = 1'b0;
          6'h38: out_r[9] = 1'b0;
          6'h39: out_r[9] = 1'b0;
          6'h3a: out_r[9] = 1'b0;
          6'h3b: out_r[9] = 1'b0;
          6'h3d: out_r[9] = 1'b0;
          6'h3e: out_r[9] = 1'b0;
          6'h3f: out_r[9] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[10] = 1'b1;
          6'h02: out_r[10] = 1'b1;
          6'h05: out_r[10] = 1'b1;
          6'h07: out_r[10] = 1'b1;
          6'h08: out_r[10] = 1'b1;
          6'h09: out_r[10] = 1'b1;
          6'h0b: out_r[10] = 1'b1;
          6'h0c: out_r[10] = 1'b1;
          6'h0d: out_r[10] = 1'b1;
          6'h0f: out_r[10] = 1'b1;
          6'h10: out_r[10] = 1'b1;
          6'h11: out_r[10] = 1'b1;
          6'h13: out_r[10] = 1'b1;
          6'h14: out_r[10] = 1'b1;
          6'h15: out_r[10] = 1'b1;
          6'h17: out_r[10] = 1'b1;
          6'h1a: out_r[10] = 1'b1;
          6'h1b: out_r[10] = 1'b1;
          6'h1c: out_r[10] = 1'b1;
          6'h1d: out_r[10] = 1'b1;
          6'h1f: out_r[10] = 1'b1;
          6'h20: out_r[10] = 1'b1;
          6'h22: out_r[10] = 1'b1;
          6'h24: out_r[10] = 1'b1;
          6'h26: out_r[10] = 1'b1;
          6'h28: out_r[10] = 1'b1;
          6'h2c: out_r[10] = 1'b1;
          6'h2e: out_r[10] = 1'b1;
          6'h30: out_r[10] = 1'b1;
          6'h32: out_r[10] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h08: out_r[11] = 1'b0;
          6'h0c: out_r[11] = 1'b0;
          6'h0d: out_r[11] = 1'b0;
          6'h11: out_r[11] = 1'b0;
          6'h13: out_r[11] = 1'b0;
          6'h14: out_r[11] = 1'b0;
          6'h15: out_r[11] = 1'b0;
          6'h18: out_r[11] = 1'b0;
          6'h1c: out_r[11] = 1'b0;
          6'h1d: out_r[11] = 1'b0;
          6'h21: out_r[11] = 1'b0;
          6'h23: out_r[11] = 1'b0;
          6'h25: out_r[11] = 1'b0;
          6'h27: out_r[11] = 1'b0;
          6'h29: out_r[11] = 1'b0;
          6'h2b: out_r[11] = 1'b0;
          6'h2d: out_r[11] = 1'b0;
          6'h2e: out_r[11] = 1'b0;
          6'h2f: out_r[11] = 1'b0;
          6'h30: out_r[11] = 1'b0;
          6'h31: out_r[11] = 1'b0;
          6'h33: out_r[11] = 1'b0;
          6'h35: out_r[11] = 1'b0;
          6'h37: out_r[11] = 1'b0;
          6'h39: out_r[11] = 1'b0;
          6'h3b: out_r[11] = 1'b0;
          6'h3d: out_r[11] = 1'b0;
          6'h3f: out_r[11] = 1'b0;
          default: begin end
        endcase
      end
      6'h38: begin
        out_r = 12'he90;
        case (inner)
          6'h06: out_r[0] = 1'b1;
          6'h07: out_r[0] = 1'b1;
          6'h0a: out_r[0] = 1'b1;
          6'h0b: out_r[0] = 1'b1;
          6'h0e: out_r[0] = 1'b1;
          6'h16: out_r[0] = 1'b1;
          6'h17: out_r[0] = 1'b1;
          6'h18: out_r[0] = 1'b1;
          6'h1c: out_r[0] = 1'b1;
          6'h24: out_r[0] = 1'b1;
          6'h2a: out_r[0] = 1'b1;
          6'h2e: out_r[0] = 1'b1;
          6'h2f: out_r[0] = 1'b1;
          6'h30: out_r[0] = 1'b1;
          6'h31: out_r[0] = 1'b1;
          6'h32: out_r[0] = 1'b1;
          6'h34: out_r[0] = 1'b1;
          6'h36: out_r[0] = 1'b1;
          6'h3f: out_r[0] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h01: out_r[1] = 1'b1;
          6'h03: out_r[1] = 1'b1;
          6'h04: out_r[1] = 1'b1;
          6'h09: out_r[1] = 1'b1;
          6'h0d: out_r[1] = 1'b1;
          6'h10: out_r[1] = 1'b1;
          6'h14: out_r[1] = 1'b1;
          6'h1a: out_r[1] = 1'b1;
          6'h1e: out_r[1] = 1'b1;
          6'h21: out_r[1] = 1'b1;
          6'h23: out_r[1] = 1'b1;
          6'h24: out_r[1] = 1'b1;
          6'h25: out_r[1] = 1'b1;
          6'h26: out_r[1] = 1'b1;
          6'h27: out_r[1] = 1'b1;
          6'h29: out_r[1] = 1'b1;
          6'h2a: out_r[1] = 1'b1;
          6'h2d: out_r[1] = 1'b1;
          6'h2e: out_r[1] = 1'b1;
          6'h2f: out_r[1] = 1'b1;
          6'h31: out_r[1] = 1'b1;
          6'h32: out_r[1] = 1'b1;
          6'h34: out_r[1] = 1'b1;
          6'h36: out_r[1] = 1'b1;
          6'h37: out_r[1] = 1'b1;
          6'h39: out_r[1] = 1'b1;
          6'h3b: out_r[1] = 1'b1;
          6'h3d: out_r[1] = 1'b1;
          6'h3f: out_r[1] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h06: out_r[2] = 1'b1;
          6'h07: out_r[2] = 1'b1;
          6'h0a: out_r[2] = 1'b1;
          6'h0b: out_r[2] = 1'b1;
          6'h0e: out_r[2] = 1'b1;
          6'h0f: out_r[2] = 1'b1;
          6'h12: out_r[2] = 1'b1;
          6'h13: out_r[2] = 1'b1;
          6'h16: out_r[2] = 1'b1;
          6'h17: out_r[2] = 1'b1;
          6'h18: out_r[2] = 1'b1;
          6'h19: out_r[2] = 1'b1;
          6'h1c: out_r[2] = 1'b1;
          6'h1d: out_r[2] = 1'b1;
          6'h1f: out_r[2] = 1'b1;
          6'h27: out_r[2] = 1'b1;
          6'h2b: out_r[2] = 1'b1;
          6'h2f: out_r[2] = 1'b1;
          6'h30: out_r[2] = 1'b1;
          6'h31: out_r[2] = 1'b1;
          6'h33: out_r[2] = 1'b1;
          6'h35: out_r[2] = 1'b1;
          6'h36: out_r[2] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h02: out_r[3] = 1'b1;
          6'h03: out_r[3] = 1'b1;
          6'h22: out_r[3] = 1'b1;
          6'h23: out_r[3] = 1'b1;
          6'h24: out_r[3] = 1'b1;
          6'h2a: out_r[3] = 1'b1;
          6'h2b: out_r[3] = 1'b1;
          6'h2e: out_r[3] = 1'b1;
          6'h2f: out_r[3] = 1'b1;
          6'h30: out_r[3] = 1'b1;
          6'h31: out_r[3] = 1'b1;
          6'h36: out_r[3] = 1'b1;
          6'h3a: out_r[3] = 1'b1;
          6'h3b: out_r[3] = 1'b1;
          6'h3e: out_r[3] = 1'b1;
          6'h3f: out_r[3] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[4] = 1'b0;
          6'h01: out_r[4] = 1'b0;
          6'h02: out_r[4] = 1'b0;
          6'h03: out_r[4] = 1'b0;
          6'h20: out_r[4] = 1'b0;
          6'h21: out_r[4] = 1'b0;
          6'h22: out_r[4] = 1'b0;
          6'h23: out_r[4] = 1'b0;
          6'h26: out_r[4] = 1'b0;
          6'h28: out_r[4] = 1'b0;
          6'h29: out_r[4] = 1'b0;
          6'h2b: out_r[4] = 1'b0;
          6'h2c: out_r[4] = 1'b0;
          6'h2d: out_r[4] = 1'b0;
          6'h2f: out_r[4] = 1'b0;
          6'h32: out_r[4] = 1'b0;
          6'h34: out_r[4] = 1'b0;
          6'h36: out_r[4] = 1'b0;
          6'h38: out_r[4] = 1'b0;
          6'h39: out_r[4] = 1'b0;
          6'h3a: out_r[4] = 1'b0;
          6'h3b: out_r[4] = 1'b0;
          6'h3c: out_r[4] = 1'b0;
          6'h3d: out_r[4] = 1'b0;
          6'h3e: out_r[4] = 1'b0;
          6'h3f: out_r[4] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h06: out_r[5] = 1'b1;
          6'h0a: out_r[5] = 1'b1;
          6'h0e: out_r[5] = 1'b1;
          6'h25: out_r[5] = 1'b1;
          6'h26: out_r[5] = 1'b1;
          6'h27: out_r[5] = 1'b1;
          6'h28: out_r[5] = 1'b1;
          6'h29: out_r[5] = 1'b1;
          6'h2c: out_r[5] = 1'b1;
          6'h2d: out_r[5] = 1'b1;
          6'h30: out_r[5] = 1'b1;
          6'h32: out_r[5] = 1'b1;
          6'h34: out_r[5] = 1'b1;
          6'h38: out_r[5] = 1'b1;
          6'h39: out_r[5] = 1'b1;
          6'h3a: out_r[5] = 1'b1;
          6'h3b: out_r[5] = 1'b1;
          6'h3c: out_r[5] = 1'b1;
          6'h3d: out_r[5] = 1'b1;
          6'h3e: out_r[5] = 1'b1;
          6'h3f: out_r[5] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h05: out_r[6] = 1'b1;
          6'h06: out_r[6] = 1'b1;
          6'h07: out_r[6] = 1'b1;
          6'h0a: out_r[6] = 1'b1;
          6'h0e: out_r[6] = 1'b1;
          6'h0f: out_r[6] = 1'b1;
          6'h11: out_r[6] = 1'b1;
          6'h12: out_r[6] = 1'b1;
          6'h13: out_r[6] = 1'b1;
          6'h15: out_r[6] = 1'b1;
          6'h16: out_r[6] = 1'b1;
          6'h17: out_r[6] = 1'b1;
          6'h19: out_r[6] = 1'b1;
          6'h1b: out_r[6] = 1'b1;
          6'h1d: out_r[6] = 1'b1;
          6'h24: out_r[6] = 1'b1;
          6'h2a: out_r[6] = 1'b1;
          6'h2b: out_r[6] = 1'b1;
          6'h2e: out_r[6] = 1'b1;
          6'h2f: out_r[6] = 1'b1;
          6'h30: out_r[6] = 1'b1;
          6'h31: out_r[6] = 1'b1;
          6'h32: out_r[6] = 1'b1;
          6'h33: out_r[6] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h05: out_r[7] = 1'b0;
          6'h0f: out_r[7] = 1'b0;
          6'h11: out_r[7] = 1'b0;
          6'h12: out_r[7] = 1'b0;
          6'h13: out_r[7] = 1'b0;
          6'h15: out_r[7] = 1'b0;
          6'h17: out_r[7] = 1'b0;
          6'h19: out_r[7] = 1'b0;
          6'h1b: out_r[7] = 1'b0;
          6'h1d: out_r[7] = 1'b0;
          6'h2b: out_r[7] = 1'b0;
          6'h2f: out_r[7] = 1'b0;
          6'h31: out_r[7] = 1'b0;
          6'h32: out_r[7] = 1'b0;
          6'h33: out_r[7] = 1'b0;
          6'h38: out_r[7] = 1'b0;
          6'h39: out_r[7] = 1'b0;
          6'h3a: out_r[7] = 1'b0;
          6'h3b: out_r[7] = 1'b0;
          6'h3c: out_r[7] = 1'b0;
          6'h3d: out_r[7] = 1'b0;
          6'h3e: out_r[7] = 1'b0;
          6'h3f: out_r[7] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[8] = 1'b1;
          6'h01: out_r[8] = 1'b1;
          6'h02: out_r[8] = 1'b1;
          6'h03: out_r[8] = 1'b1;
          6'h04: out_r[8] = 1'b1;
          6'h06: out_r[8] = 1'b1;
          6'h08: out_r[8] = 1'b1;
          6'h09: out_r[8] = 1'b1;
          6'h0a: out_r[8] = 1'b1;
          6'h0c: out_r[8] = 1'b1;
          6'h0d: out_r[8] = 1'b1;
          6'h0e: out_r[8] = 1'b1;
          6'h10: out_r[8] = 1'b1;
          6'h14: out_r[8] = 1'b1;
          6'h18: out_r[8] = 1'b1;
          6'h1a: out_r[8] = 1'b1;
          6'h1c: out_r[8] = 1'b1;
          6'h1e: out_r[8] = 1'b1;
          6'h1f: out_r[8] = 1'b1;
          6'h25: out_r[8] = 1'b1;
          6'h35: out_r[8] = 1'b1;
          6'h36: out_r[8] = 1'b1;
          6'h37: out_r[8] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h06: out_r[9] = 1'b0;
          6'h0a: out_r[9] = 1'b0;
          6'h0e: out_r[9] = 1'b0;
          6'h18: out_r[9] = 1'b0;
          6'h1c: out_r[9] = 1'b0;
          6'h25: out_r[9] = 1'b0;
          6'h2b: out_r[9] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h06: out_r[10] = 1'b0;
          6'h0a: out_r[10] = 1'b0;
          6'h0e: out_r[10] = 1'b0;
          6'h17: out_r[10] = 1'b0;
          6'h18: out_r[10] = 1'b0;
          6'h1c: out_r[10] = 1'b0;
          6'h24: out_r[10] = 1'b0;
          6'h25: out_r[10] = 1'b0;
          6'h2a: out_r[10] = 1'b0;
          6'h2e: out_r[10] = 1'b0;
          6'h2f: out_r[10] = 1'b0;
          6'h31: out_r[10] = 1'b0;
          6'h32: out_r[10] = 1'b0;
          6'h34: out_r[10] = 1'b0;
          6'h36: out_r[10] = 1'b0;
          6'h3f: out_r[10] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[11] = 1'b0;
          6'h01: out_r[11] = 1'b0;
          6'h02: out_r[11] = 1'b0;
          6'h03: out_r[11] = 1'b0;
          6'h04: out_r[11] = 1'b0;
          6'h05: out_r[11] = 1'b0;
          6'h08: out_r[11] = 1'b0;
          6'h09: out_r[11] = 1'b0;
          6'h0c: out_r[11] = 1'b0;
          6'h0d: out_r[11] = 1'b0;
          6'h0f: out_r[11] = 1'b0;
          6'h10: out_r[11] = 1'b0;
          6'h11: out_r[11] = 1'b0;
          6'h12: out_r[11] = 1'b0;
          6'h13: out_r[11] = 1'b0;
          6'h14: out_r[11] = 1'b0;
          6'h15: out_r[11] = 1'b0;
          6'h19: out_r[11] = 1'b0;
          6'h1a: out_r[11] = 1'b0;
          6'h1b: out_r[11] = 1'b0;
          6'h1d: out_r[11] = 1'b0;
          6'h1e: out_r[11] = 1'b0;
          6'h1f: out_r[11] = 1'b0;
          6'h25: out_r[11] = 1'b0;
          6'h27: out_r[11] = 1'b0;
          6'h2b: out_r[11] = 1'b0;
          6'h33: out_r[11] = 1'b0;
          6'h35: out_r[11] = 1'b0;
          6'h37: out_r[11] = 1'b0;
          default: begin end
        endcase
      end
      6'h39: begin
        out_r = 12'heb1;
        case (inner)
          6'h01: out_r[0] = 1'b0;
          6'h04: out_r[0] = 1'b0;
          6'h09: out_r[0] = 1'b0;
          6'h0d: out_r[0] = 1'b0;
          6'h14: out_r[0] = 1'b0;
          6'h20: out_r[0] = 1'b0;
          6'h25: out_r[0] = 1'b0;
          6'h26: out_r[0] = 1'b0;
          6'h27: out_r[0] = 1'b0;
          6'h2a: out_r[0] = 1'b0;
          6'h2b: out_r[0] = 1'b0;
          6'h31: out_r[0] = 1'b0;
          6'h34: out_r[0] = 1'b0;
          6'h37: out_r[0] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h03: out_r[1] = 1'b1;
          6'h04: out_r[1] = 1'b1;
          6'h09: out_r[1] = 1'b1;
          6'h0b: out_r[1] = 1'b1;
          6'h0d: out_r[1] = 1'b1;
          6'h14: out_r[1] = 1'b1;
          6'h19: out_r[1] = 1'b1;
          6'h1b: out_r[1] = 1'b1;
          6'h1d: out_r[1] = 1'b1;
          6'h20: out_r[1] = 1'b1;
          6'h21: out_r[1] = 1'b1;
          6'h23: out_r[1] = 1'b1;
          6'h26: out_r[1] = 1'b1;
          6'h27: out_r[1] = 1'b1;
          6'h29: out_r[1] = 1'b1;
          6'h2d: out_r[1] = 1'b1;
          6'h34: out_r[1] = 1'b1;
          6'h37: out_r[1] = 1'b1;
          6'h39: out_r[1] = 1'b1;
          6'h3b: out_r[1] = 1'b1;
          6'h3d: out_r[1] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[2] = 1'b1;
          6'h01: out_r[2] = 1'b1;
          6'h03: out_r[2] = 1'b1;
          6'h04: out_r[2] = 1'b1;
          6'h09: out_r[2] = 1'b1;
          6'h0b: out_r[2] = 1'b1;
          6'h0d: out_r[2] = 1'b1;
          6'h0e: out_r[2] = 1'b1;
          6'h11: out_r[2] = 1'b1;
          6'h14: out_r[2] = 1'b1;
          6'h17: out_r[2] = 1'b1;
          6'h20: out_r[2] = 1'b1;
          6'h22: out_r[2] = 1'b1;
          6'h25: out_r[2] = 1'b1;
          6'h26: out_r[2] = 1'b1;
          6'h27: out_r[2] = 1'b1;
          6'h2b: out_r[2] = 1'b1;
          6'h2e: out_r[2] = 1'b1;
          6'h31: out_r[2] = 1'b1;
          6'h34: out_r[2] = 1'b1;
          6'h37: out_r[2] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h04: out_r[3] = 1'b1;
          6'h07: out_r[3] = 1'b1;
          6'h0f: out_r[3] = 1'b1;
          6'h14: out_r[3] = 1'b1;
          6'h1a: out_r[3] = 1'b1;
          6'h1b: out_r[3] = 1'b1;
          6'h1e: out_r[3] = 1'b1;
          6'h1f: out_r[3] = 1'b1;
          6'h20: out_r[3] = 1'b1;
          6'h23: out_r[3] = 1'b1;
          6'h24: out_r[3] = 1'b1;
          6'h25: out_r[3] = 1'b1;
          6'h26: out_r[3] = 1'b1;
          6'h27: out_r[3] = 1'b1;
          6'h28: out_r[3] = 1'b1;
          6'h2c: out_r[3] = 1'b1;
          6'h31: out_r[3] = 1'b1;
          6'h34: out_r[3] = 1'b1;
          6'h37: out_r[3] = 1'b1;
          6'h3a: out_r[3] = 1'b1;
          6'h3b: out_r[3] = 1'b1;
          6'h3e: out_r[3] = 1'b1;
          6'h3f: out_r[3] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h05: out_r[4] = 1'b0;
          6'h07: out_r[4] = 1'b0;
          6'h0b: out_r[4] = 1'b0;
          6'h0f: out_r[4] = 1'b0;
          6'h10: out_r[4] = 1'b0;
          6'h11: out_r[4] = 1'b0;
          6'h18: out_r[4] = 1'b0;
          6'h19: out_r[4] = 1'b0;
          6'h1a: out_r[4] = 1'b0;
          6'h1b: out_r[4] = 1'b0;
          6'h1c: out_r[4] = 1'b0;
          6'h1d: out_r[4] = 1'b0;
          6'h1e: out_r[4] = 1'b0;
          6'h1f: out_r[4] = 1'b0;
          6'h21: out_r[4] = 1'b0;
          6'h23: out_r[4] = 1'b0;
          6'h24: out_r[4] = 1'b0;
          6'h25: out_r[4] = 1'b0;
          6'h26: out_r[4] = 1'b0;
          6'h27: out_r[4] = 1'b0;
          6'h28: out_r[4] = 1'b0;
          6'h2c: out_r[4] = 1'b0;
          6'h30: out_r[4] = 1'b0;
          6'h38: out_r[4] = 1'b0;
          6'h39: out_r[4] = 1'b0;
          6'h3a: out_r[4] = 1'b0;
          6'h3b: out_r[4] = 1'b0;
          6'h3c: out_r[4] = 1'b0;
          6'h3d: out_r[4] = 1'b0;
          6'h3e: out_r[4] = 1'b0;
          6'h3f: out_r[4] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h01: out_r[5] = 1'b0;
          6'h03: out_r[5] = 1'b0;
          6'h04: out_r[5] = 1'b0;
          6'h05: out_r[5] = 1'b0;
          6'h09: out_r[5] = 1'b0;
          6'h0d: out_r[5] = 1'b0;
          6'h0f: out_r[5] = 1'b0;
          6'h10: out_r[5] = 1'b0;
          6'h13: out_r[5] = 1'b0;
          6'h15: out_r[5] = 1'b0;
          6'h21: out_r[5] = 1'b0;
          6'h23: out_r[5] = 1'b0;
          6'h24: out_r[5] = 1'b0;
          6'h25: out_r[5] = 1'b0;
          6'h27: out_r[5] = 1'b0;
          6'h28: out_r[5] = 1'b0;
          6'h29: out_r[5] = 1'b0;
          6'h2a: out_r[5] = 1'b0;
          6'h2b: out_r[5] = 1'b0;
          6'h2c: out_r[5] = 1'b0;
          6'h2d: out_r[5] = 1'b0;
          6'h2e: out_r[5] = 1'b0;
          6'h2f: out_r[5] = 1'b0;
          6'h30: out_r[5] = 1'b0;
          6'h35: out_r[5] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h04: out_r[6] = 1'b1;
          6'h05: out_r[6] = 1'b1;
          6'h09: out_r[6] = 1'b1;
          6'h0d: out_r[6] = 1'b1;
          6'h10: out_r[6] = 1'b1;
          6'h13: out_r[6] = 1'b1;
          6'h14: out_r[6] = 1'b1;
          6'h15: out_r[6] = 1'b1;
          6'h17: out_r[6] = 1'b1;
          6'h20: out_r[6] = 1'b1;
          6'h27: out_r[6] = 1'b1;
          6'h28: out_r[6] = 1'b1;
          6'h2a: out_r[6] = 1'b1;
          6'h2c: out_r[6] = 1'b1;
          6'h2e: out_r[6] = 1'b1;
          6'h30: out_r[6] = 1'b1;
          6'h31: out_r[6] = 1'b1;
          6'h33: out_r[6] = 1'b1;
          6'h34: out_r[6] = 1'b1;
          6'h35: out_r[6] = 1'b1;
          6'h37: out_r[6] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h13: out_r[7] = 1'b0;
          6'h15: out_r[7] = 1'b0;
          6'h18: out_r[7] = 1'b0;
          6'h19: out_r[7] = 1'b0;
          6'h1a: out_r[7] = 1'b0;
          6'h1b: out_r[7] = 1'b0;
          6'h1c: out_r[7] = 1'b0;
          6'h1d: out_r[7] = 1'b0;
          6'h1e: out_r[7] = 1'b0;
          6'h1f: out_r[7] = 1'b0;
          6'h2e: out_r[7] = 1'b0;
          6'h38: out_r[7] = 1'b0;
          6'h39: out_r[7] = 1'b0;
          6'h3a: out_r[7] = 1'b0;
          6'h3b: out_r[7] = 1'b0;
          6'h3c: out_r[7] = 1'b0;
          6'h3d: out_r[7] = 1'b0;
          6'h3e: out_r[7] = 1'b0;
          6'h3f: out_r[7] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[8] = 1'b1;
          6'h01: out_r[8] = 1'b1;
          6'h03: out_r[8] = 1'b1;
          6'h04: out_r[8] = 1'b1;
          6'h07: out_r[8] = 1'b1;
          6'h09: out_r[8] = 1'b1;
          6'h0b: out_r[8] = 1'b1;
          6'h0d: out_r[8] = 1'b1;
          6'h0e: out_r[8] = 1'b1;
          6'h0f: out_r[8] = 1'b1;
          6'h17: out_r[8] = 1'b1;
          6'h1e: out_r[8] = 1'b1;
          6'h1f: out_r[8] = 1'b1;
          6'h21: out_r[8] = 1'b1;
          6'h22: out_r[8] = 1'b1;
          6'h23: out_r[8] = 1'b1;
          6'h24: out_r[8] = 1'b1;
          6'h25: out_r[8] = 1'b1;
          6'h26: out_r[8] = 1'b1;
          6'h27: out_r[8] = 1'b1;
          6'h29: out_r[8] = 1'b1;
          6'h2a: out_r[8] = 1'b1;
          6'h2b: out_r[8] = 1'b1;
          6'h2d: out_r[8] = 1'b1;
          6'h2f: out_r[8] = 1'b1;
          6'h3e: out_r[8] = 1'b1;
          6'h3f: out_r[8] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[9] = 1'b0;
          6'h03: out_r[9] = 1'b0;
          6'h04: out_r[9] = 1'b0;
          6'h07: out_r[9] = 1'b0;
          6'h09: out_r[9] = 1'b0;
          6'h0d: out_r[9] = 1'b0;
          6'h0e: out_r[9] = 1'b0;
          6'h0f: out_r[9] = 1'b0;
          6'h17: out_r[9] = 1'b0;
          6'h1e: out_r[9] = 1'b0;
          6'h1f: out_r[9] = 1'b0;
          6'h22: out_r[9] = 1'b0;
          6'h24: out_r[9] = 1'b0;
          6'h25: out_r[9] = 1'b0;
          6'h26: out_r[9] = 1'b0;
          6'h27: out_r[9] = 1'b0;
          6'h31: out_r[9] = 1'b0;
          6'h33: out_r[9] = 1'b0;
          6'h35: out_r[9] = 1'b0;
          6'h39: out_r[9] = 1'b0;
          6'h3b: out_r[9] = 1'b0;
          6'h3d: out_r[9] = 1'b0;
          6'h3e: out_r[9] = 1'b0;
          6'h3f: out_r[9] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[10] = 1'b0;
          6'h03: out_r[10] = 1'b0;
          6'h04: out_r[10] = 1'b0;
          6'h07: out_r[10] = 1'b0;
          6'h0b: out_r[10] = 1'b0;
          6'h0e: out_r[10] = 1'b0;
          6'h0f: out_r[10] = 1'b0;
          6'h13: out_r[10] = 1'b0;
          6'h15: out_r[10] = 1'b0;
          6'h17: out_r[10] = 1'b0;
          6'h19: out_r[10] = 1'b0;
          6'h1b: out_r[10] = 1'b0;
          6'h1d: out_r[10] = 1'b0;
          6'h1e: out_r[10] = 1'b0;
          6'h1f: out_r[10] = 1'b0;
          6'h21: out_r[10] = 1'b0;
          6'h22: out_r[10] = 1'b0;
          6'h23: out_r[10] = 1'b0;
          6'h24: out_r[10] = 1'b0;
          6'h25: out_r[10] = 1'b0;
          6'h26: out_r[10] = 1'b0;
          6'h27: out_r[10] = 1'b0;
          6'h29: out_r[10] = 1'b0;
          6'h2d: out_r[10] = 1'b0;
          6'h2f: out_r[10] = 1'b0;
          6'h35: out_r[10] = 1'b0;
          6'h39: out_r[10] = 1'b0;
          6'h3b: out_r[10] = 1'b0;
          6'h3d: out_r[10] = 1'b0;
          6'h3e: out_r[10] = 1'b0;
          6'h3f: out_r[10] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h01: out_r[11] = 1'b0;
          6'h03: out_r[11] = 1'b0;
          6'h04: out_r[11] = 1'b0;
          6'h07: out_r[11] = 1'b0;
          6'h09: out_r[11] = 1'b0;
          6'h0d: out_r[11] = 1'b0;
          6'h0f: out_r[11] = 1'b0;
          6'h17: out_r[11] = 1'b0;
          6'h1f: out_r[11] = 1'b0;
          6'h25: out_r[11] = 1'b0;
          6'h27: out_r[11] = 1'b0;
          6'h2a: out_r[11] = 1'b0;
          6'h2b: out_r[11] = 1'b0;
          6'h2e: out_r[11] = 1'b0;
          6'h31: out_r[11] = 1'b0;
          default: begin end
        endcase
      end
      6'h3a: begin
        out_r = 12'he1d;
        case (inner)
          6'h00: out_r[0] = 1'b0;
          6'h02: out_r[0] = 1'b0;
          6'h04: out_r[0] = 1'b0;
          6'h08: out_r[0] = 1'b0;
          6'h0c: out_r[0] = 1'b0;
          6'h12: out_r[0] = 1'b0;
          6'h13: out_r[0] = 1'b0;
          6'h1d: out_r[0] = 1'b0;
          6'h20: out_r[0] = 1'b0;
          6'h22: out_r[0] = 1'b0;
          6'h23: out_r[0] = 1'b0;
          6'h30: out_r[0] = 1'b0;
          6'h34: out_r[0] = 1'b0;
          6'h36: out_r[0] = 1'b0;
          6'h37: out_r[0] = 1'b0;
          6'h38: out_r[0] = 1'b0;
          6'h3a: out_r[0] = 1'b0;
          6'h3b: out_r[0] = 1'b0;
          6'h3c: out_r[0] = 1'b0;
          6'h3e: out_r[0] = 1'b0;
          6'h3f: out_r[0] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h05: out_r[1] = 1'b1;
          6'h06: out_r[1] = 1'b1;
          6'h08: out_r[1] = 1'b1;
          6'h0a: out_r[1] = 1'b1;
          6'h0c: out_r[1] = 1'b1;
          6'h0e: out_r[1] = 1'b1;
          6'h10: out_r[1] = 1'b1;
          6'h16: out_r[1] = 1'b1;
          6'h18: out_r[1] = 1'b1;
          6'h1a: out_r[1] = 1'b1;
          6'h1b: out_r[1] = 1'b1;
          6'h1c: out_r[1] = 1'b1;
          6'h1d: out_r[1] = 1'b1;
          6'h1e: out_r[1] = 1'b1;
          6'h1f: out_r[1] = 1'b1;
          6'h29: out_r[1] = 1'b1;
          6'h32: out_r[1] = 1'b1;
          6'h33: out_r[1] = 1'b1;
          6'h3a: out_r[1] = 1'b1;
          6'h3b: out_r[1] = 1'b1;
          6'h3e: out_r[1] = 1'b1;
          6'h3f: out_r[1] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h01: out_r[2] = 1'b0;
          6'h05: out_r[2] = 1'b0;
          6'h06: out_r[2] = 1'b0;
          6'h07: out_r[2] = 1'b0;
          6'h08: out_r[2] = 1'b0;
          6'h0a: out_r[2] = 1'b0;
          6'h0c: out_r[2] = 1'b0;
          6'h0e: out_r[2] = 1'b0;
          6'h11: out_r[2] = 1'b0;
          6'h12: out_r[2] = 1'b0;
          6'h16: out_r[2] = 1'b0;
          6'h19: out_r[2] = 1'b0;
          6'h1d: out_r[2] = 1'b0;
          6'h30: out_r[2] = 1'b0;
          6'h3a: out_r[2] = 1'b0;
          6'h3b: out_r[2] = 1'b0;
          6'h3e: out_r[2] = 1'b0;
          6'h3f: out_r[2] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[3] = 1'b0;
          6'h09: out_r[3] = 1'b0;
          6'h0b: out_r[3] = 1'b0;
          6'h0d: out_r[3] = 1'b0;
          6'h0f: out_r[3] = 1'b0;
          6'h13: out_r[3] = 1'b0;
          6'h15: out_r[3] = 1'b0;
          6'h16: out_r[3] = 1'b0;
          6'h17: out_r[3] = 1'b0;
          6'h20: out_r[3] = 1'b0;
          6'h21: out_r[3] = 1'b0;
          6'h24: out_r[3] = 1'b0;
          6'h25: out_r[3] = 1'b0;
          6'h26: out_r[3] = 1'b0;
          6'h27: out_r[3] = 1'b0;
          6'h28: out_r[3] = 1'b0;
          6'h2c: out_r[3] = 1'b0;
          6'h2d: out_r[3] = 1'b0;
          6'h31: out_r[3] = 1'b0;
          6'h34: out_r[3] = 1'b0;
          6'h35: out_r[3] = 1'b0;
          6'h38: out_r[3] = 1'b0;
          6'h39: out_r[3] = 1'b0;
          6'h3a: out_r[3] = 1'b0;
          6'h3b: out_r[3] = 1'b0;
          6'h3c: out_r[3] = 1'b0;
          6'h3d: out_r[3] = 1'b0;
          6'h3e: out_r[3] = 1'b0;
          6'h3f: out_r[3] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[4] = 1'b0;
          6'h02: out_r[4] = 1'b0;
          6'h09: out_r[4] = 1'b0;
          6'h0b: out_r[4] = 1'b0;
          6'h0d: out_r[4] = 1'b0;
          6'h0f: out_r[4] = 1'b0;
          6'h13: out_r[4] = 1'b0;
          6'h17: out_r[4] = 1'b0;
          6'h20: out_r[4] = 1'b0;
          6'h21: out_r[4] = 1'b0;
          6'h22: out_r[4] = 1'b0;
          6'h23: out_r[4] = 1'b0;
          6'h24: out_r[4] = 1'b0;
          6'h25: out_r[4] = 1'b0;
          6'h26: out_r[4] = 1'b0;
          6'h27: out_r[4] = 1'b0;
          6'h28: out_r[4] = 1'b0;
          6'h2c: out_r[4] = 1'b0;
          6'h2d: out_r[4] = 1'b0;
          6'h31: out_r[4] = 1'b0;
          6'h35: out_r[4] = 1'b0;
          6'h38: out_r[4] = 1'b0;
          6'h39: out_r[4] = 1'b0;
          6'h3c: out_r[4] = 1'b0;
          6'h3d: out_r[4] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h01: out_r[5] = 1'b1;
          6'h06: out_r[5] = 1'b1;
          6'h0b: out_r[5] = 1'b1;
          6'h0f: out_r[5] = 1'b1;
          6'h11: out_r[5] = 1'b1;
          6'h13: out_r[5] = 1'b1;
          6'h19: out_r[5] = 1'b1;
          6'h1d: out_r[5] = 1'b1;
          6'h30: out_r[5] = 1'b1;
          6'h38: out_r[5] = 1'b1;
          6'h39: out_r[5] = 1'b1;
          6'h3c: out_r[5] = 1'b1;
          6'h3d: out_r[5] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h03: out_r[6] = 1'b1;
          6'h05: out_r[6] = 1'b1;
          6'h07: out_r[6] = 1'b1;
          6'h09: out_r[6] = 1'b1;
          6'h0a: out_r[6] = 1'b1;
          6'h0e: out_r[6] = 1'b1;
          6'h10: out_r[6] = 1'b1;
          6'h12: out_r[6] = 1'b1;
          6'h15: out_r[6] = 1'b1;
          6'h17: out_r[6] = 1'b1;
          6'h18: out_r[6] = 1'b1;
          6'h1c: out_r[6] = 1'b1;
          6'h21: out_r[6] = 1'b1;
          6'h22: out_r[6] = 1'b1;
          6'h23: out_r[6] = 1'b1;
          6'h29: out_r[6] = 1'b1;
          6'h2a: out_r[6] = 1'b1;
          6'h2b: out_r[6] = 1'b1;
          6'h2e: out_r[6] = 1'b1;
          6'h2f: out_r[6] = 1'b1;
          6'h30: out_r[6] = 1'b1;
          6'h31: out_r[6] = 1'b1;
          6'h32: out_r[6] = 1'b1;
          6'h33: out_r[6] = 1'b1;
          6'h34: out_r[6] = 1'b1;
          6'h36: out_r[6] = 1'b1;
          6'h37: out_r[6] = 1'b1;
          6'h3a: out_r[6] = 1'b1;
          6'h3b: out_r[6] = 1'b1;
          6'h3e: out_r[6] = 1'b1;
          6'h3f: out_r[6] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[7] = 1'b1;
          6'h01: out_r[7] = 1'b1;
          6'h02: out_r[7] = 1'b1;
          6'h03: out_r[7] = 1'b1;
          6'h04: out_r[7] = 1'b1;
          6'h06: out_r[7] = 1'b1;
          6'h07: out_r[7] = 1'b1;
          6'h08: out_r[7] = 1'b1;
          6'h09: out_r[7] = 1'b1;
          6'h0b: out_r[7] = 1'b1;
          6'h0c: out_r[7] = 1'b1;
          6'h0f: out_r[7] = 1'b1;
          6'h11: out_r[7] = 1'b1;
          6'h13: out_r[7] = 1'b1;
          6'h14: out_r[7] = 1'b1;
          6'h15: out_r[7] = 1'b1;
          6'h16: out_r[7] = 1'b1;
          6'h19: out_r[7] = 1'b1;
          6'h1a: out_r[7] = 1'b1;
          6'h1b: out_r[7] = 1'b1;
          6'h1d: out_r[7] = 1'b1;
          6'h1e: out_r[7] = 1'b1;
          6'h1f: out_r[7] = 1'b1;
          6'h20: out_r[7] = 1'b1;
          6'h24: out_r[7] = 1'b1;
          6'h28: out_r[7] = 1'b1;
          6'h2c: out_r[7] = 1'b1;
          6'h2d: out_r[7] = 1'b1;
          6'h30: out_r[7] = 1'b1;
          6'h31: out_r[7] = 1'b1;
          6'h34: out_r[7] = 1'b1;
          6'h35: out_r[7] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[8] = 1'b1;
          6'h02: out_r[8] = 1'b1;
          6'h04: out_r[8] = 1'b1;
          6'h06: out_r[8] = 1'b1;
          6'h07: out_r[8] = 1'b1;
          6'h08: out_r[8] = 1'b1;
          6'h09: out_r[8] = 1'b1;
          6'h0b: out_r[8] = 1'b1;
          6'h0c: out_r[8] = 1'b1;
          6'h0f: out_r[8] = 1'b1;
          6'h13: out_r[8] = 1'b1;
          6'h14: out_r[8] = 1'b1;
          6'h15: out_r[8] = 1'b1;
          6'h16: out_r[8] = 1'b1;
          6'h17: out_r[8] = 1'b1;
          6'h19: out_r[8] = 1'b1;
          6'h1a: out_r[8] = 1'b1;
          6'h1b: out_r[8] = 1'b1;
          6'h1e: out_r[8] = 1'b1;
          6'h1f: out_r[8] = 1'b1;
          6'h24: out_r[8] = 1'b1;
          6'h25: out_r[8] = 1'b1;
          6'h26: out_r[8] = 1'b1;
          6'h27: out_r[8] = 1'b1;
          6'h28: out_r[8] = 1'b1;
          6'h2c: out_r[8] = 1'b1;
          6'h2d: out_r[8] = 1'b1;
          6'h31: out_r[8] = 1'b1;
          6'h35: out_r[8] = 1'b1;
          6'h39: out_r[8] = 1'b1;
          6'h3d: out_r[8] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h05: out_r[9] = 1'b0;
          6'h07: out_r[9] = 1'b0;
          6'h0b: out_r[9] = 1'b0;
          6'h0f: out_r[9] = 1'b0;
          6'h13: out_r[9] = 1'b0;
          6'h15: out_r[9] = 1'b0;
          6'h17: out_r[9] = 1'b0;
          6'h21: out_r[9] = 1'b0;
          6'h22: out_r[9] = 1'b0;
          6'h23: out_r[9] = 1'b0;
          6'h28: out_r[9] = 1'b0;
          6'h29: out_r[9] = 1'b0;
          6'h2a: out_r[9] = 1'b0;
          6'h2b: out_r[9] = 1'b0;
          6'h2c: out_r[9] = 1'b0;
          6'h2e: out_r[9] = 1'b0;
          6'h2f: out_r[9] = 1'b0;
          6'h31: out_r[9] = 1'b0;
          6'h35: out_r[9] = 1'b0;
          6'h36: out_r[9] = 1'b0;
          6'h37: out_r[9] = 1'b0;
          6'h39: out_r[9] = 1'b0;
          6'h3d: out_r[9] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h05: out_r[10] = 1'b0;
          6'h06: out_r[10] = 1'b0;
          6'h09: out_r[10] = 1'b0;
          6'h0a: out_r[10] = 1'b0;
          6'h0b: out_r[10] = 1'b0;
          6'h0e: out_r[10] = 1'b0;
          6'h0f: out_r[10] = 1'b0;
          6'h10: out_r[10] = 1'b0;
          6'h13: out_r[10] = 1'b0;
          6'h15: out_r[10] = 1'b0;
          6'h16: out_r[10] = 1'b0;
          6'h17: out_r[10] = 1'b0;
          6'h18: out_r[10] = 1'b0;
          6'h1a: out_r[10] = 1'b0;
          6'h1b: out_r[10] = 1'b0;
          6'h1c: out_r[10] = 1'b0;
          6'h1e: out_r[10] = 1'b0;
          6'h1f: out_r[10] = 1'b0;
          6'h21: out_r[10] = 1'b0;
          6'h25: out_r[10] = 1'b0;
          6'h26: out_r[10] = 1'b0;
          6'h27: out_r[10] = 1'b0;
          6'h28: out_r[10] = 1'b0;
          6'h29: out_r[10] = 1'b0;
          6'h2c: out_r[10] = 1'b0;
          6'h31: out_r[10] = 1'b0;
          6'h32: out_r[10] = 1'b0;
          6'h33: out_r[10] = 1'b0;
          6'h35: out_r[10] = 1'b0;
          6'h39: out_r[10] = 1'b0;
          6'h3d: out_r[10] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[11] = 1'b0;
          6'h02: out_r[11] = 1'b0;
          6'h04: out_r[11] = 1'b0;
          6'h07: out_r[11] = 1'b0;
          6'h08: out_r[11] = 1'b0;
          6'h0c: out_r[11] = 1'b0;
          6'h0d: out_r[11] = 1'b0;
          6'h12: out_r[11] = 1'b0;
          6'h13: out_r[11] = 1'b0;
          6'h14: out_r[11] = 1'b0;
          6'h19: out_r[11] = 1'b0;
          6'h1d: out_r[11] = 1'b0;
          6'h21: out_r[11] = 1'b0;
          6'h22: out_r[11] = 1'b0;
          6'h23: out_r[11] = 1'b0;
          6'h28: out_r[11] = 1'b0;
          6'h2a: out_r[11] = 1'b0;
          6'h2b: out_r[11] = 1'b0;
          6'h2c: out_r[11] = 1'b0;
          6'h2e: out_r[11] = 1'b0;
          6'h2f: out_r[11] = 1'b0;
          6'h31: out_r[11] = 1'b0;
          6'h36: out_r[11] = 1'b0;
          6'h37: out_r[11] = 1'b0;
          6'h39: out_r[11] = 1'b0;
          6'h3a: out_r[11] = 1'b0;
          6'h3b: out_r[11] = 1'b0;
          6'h3e: out_r[11] = 1'b0;
          6'h3f: out_r[11] = 1'b0;
          default: begin end
        endcase
      end
      6'h3b: begin
        out_r = 12'ha8e;
        case (inner)
          6'h00: out_r[0] = 1'b1;
          6'h04: out_r[0] = 1'b1;
          6'h06: out_r[0] = 1'b1;
          6'h09: out_r[0] = 1'b1;
          6'h0a: out_r[0] = 1'b1;
          6'h0c: out_r[0] = 1'b1;
          6'h0e: out_r[0] = 1'b1;
          6'h11: out_r[0] = 1'b1;
          6'h13: out_r[0] = 1'b1;
          6'h14: out_r[0] = 1'b1;
          6'h16: out_r[0] = 1'b1;
          6'h20: out_r[0] = 1'b1;
          6'h21: out_r[0] = 1'b1;
          6'h2c: out_r[0] = 1'b1;
          6'h34: out_r[0] = 1'b1;
          6'h35: out_r[0] = 1'b1;
          6'h38: out_r[0] = 1'b1;
          6'h39: out_r[0] = 1'b1;
          6'h3c: out_r[0] = 1'b1;
          6'h3d: out_r[0] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h04: out_r[1] = 1'b0;
          6'h06: out_r[1] = 1'b0;
          6'h0c: out_r[1] = 1'b0;
          6'h0d: out_r[1] = 1'b0;
          6'h16: out_r[1] = 1'b0;
          6'h36: out_r[1] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h04: out_r[2] = 1'b0;
          6'h05: out_r[2] = 1'b0;
          6'h06: out_r[2] = 1'b0;
          6'h07: out_r[2] = 1'b0;
          6'h0c: out_r[2] = 1'b0;
          6'h14: out_r[2] = 1'b0;
          6'h16: out_r[2] = 1'b0;
          6'h25: out_r[2] = 1'b0;
          6'h27: out_r[2] = 1'b0;
          6'h30: out_r[2] = 1'b0;
          6'h31: out_r[2] = 1'b0;
          6'h32: out_r[2] = 1'b0;
          6'h33: out_r[2] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[3] = 1'b0;
          6'h01: out_r[3] = 1'b0;
          6'h02: out_r[3] = 1'b0;
          6'h09: out_r[3] = 1'b0;
          6'h0a: out_r[3] = 1'b0;
          6'h0e: out_r[3] = 1'b0;
          6'h11: out_r[3] = 1'b0;
          6'h12: out_r[3] = 1'b0;
          6'h13: out_r[3] = 1'b0;
          6'h15: out_r[3] = 1'b0;
          6'h17: out_r[3] = 1'b0;
          6'h1a: out_r[3] = 1'b0;
          6'h1e: out_r[3] = 1'b0;
          6'h20: out_r[3] = 1'b0;
          6'h21: out_r[3] = 1'b0;
          6'h28: out_r[3] = 1'b0;
          6'h29: out_r[3] = 1'b0;
          6'h2a: out_r[3] = 1'b0;
          6'h2c: out_r[3] = 1'b0;
          6'h2e: out_r[3] = 1'b0;
          6'h34: out_r[3] = 1'b0;
          6'h35: out_r[3] = 1'b0;
          6'h36: out_r[3] = 1'b0;
          6'h37: out_r[3] = 1'b0;
          6'h38: out_r[3] = 1'b0;
          6'h39: out_r[3] = 1'b0;
          6'h3c: out_r[3] = 1'b0;
          6'h3d: out_r[3] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h04: out_r[4] = 1'b1;
          6'h05: out_r[4] = 1'b1;
          6'h06: out_r[4] = 1'b1;
          6'h07: out_r[4] = 1'b1;
          6'h08: out_r[4] = 1'b1;
          6'h09: out_r[4] = 1'b1;
          6'h0c: out_r[4] = 1'b1;
          6'h0d: out_r[4] = 1'b1;
          6'h10: out_r[4] = 1'b1;
          6'h14: out_r[4] = 1'b1;
          6'h16: out_r[4] = 1'b1;
          6'h19: out_r[4] = 1'b1;
          6'h1c: out_r[4] = 1'b1;
          6'h1d: out_r[4] = 1'b1;
          6'h24: out_r[4] = 1'b1;
          6'h25: out_r[4] = 1'b1;
          6'h26: out_r[4] = 1'b1;
          6'h27: out_r[4] = 1'b1;
          6'h2b: out_r[4] = 1'b1;
          6'h2c: out_r[4] = 1'b1;
          6'h2d: out_r[4] = 1'b1;
          6'h2f: out_r[4] = 1'b1;
          6'h30: out_r[4] = 1'b1;
          6'h31: out_r[4] = 1'b1;
          6'h32: out_r[4] = 1'b1;
          6'h33: out_r[4] = 1'b1;
          6'h34: out_r[4] = 1'b1;
          6'h35: out_r[4] = 1'b1;
          6'h36: out_r[4] = 1'b1;
          6'h37: out_r[4] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h01: out_r[5] = 1'b1;
          6'h05: out_r[5] = 1'b1;
          6'h07: out_r[5] = 1'b1;
          6'h0a: out_r[5] = 1'b1;
          6'h0b: out_r[5] = 1'b1;
          6'h0e: out_r[5] = 1'b1;
          6'h0f: out_r[5] = 1'b1;
          6'h11: out_r[5] = 1'b1;
          6'h14: out_r[5] = 1'b1;
          6'h15: out_r[5] = 1'b1;
          6'h17: out_r[5] = 1'b1;
          6'h18: out_r[5] = 1'b1;
          6'h1a: out_r[5] = 1'b1;
          6'h1b: out_r[5] = 1'b1;
          6'h1e: out_r[5] = 1'b1;
          6'h1f: out_r[5] = 1'b1;
          6'h25: out_r[5] = 1'b1;
          6'h27: out_r[5] = 1'b1;
          6'h30: out_r[5] = 1'b1;
          6'h31: out_r[5] = 1'b1;
          6'h32: out_r[5] = 1'b1;
          6'h33: out_r[5] = 1'b1;
          6'h38: out_r[5] = 1'b1;
          6'h39: out_r[5] = 1'b1;
          6'h3a: out_r[5] = 1'b1;
          6'h3b: out_r[5] = 1'b1;
          6'h3c: out_r[5] = 1'b1;
          6'h3d: out_r[5] = 1'b1;
          6'h3e: out_r[5] = 1'b1;
          6'h3f: out_r[5] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h02: out_r[6] = 1'b1;
          6'h07: out_r[6] = 1'b1;
          6'h09: out_r[6] = 1'b1;
          6'h0c: out_r[6] = 1'b1;
          6'h1c: out_r[6] = 1'b1;
          6'h1d: out_r[6] = 1'b1;
          6'h20: out_r[6] = 1'b1;
          6'h21: out_r[6] = 1'b1;
          6'h26: out_r[6] = 1'b1;
          6'h28: out_r[6] = 1'b1;
          6'h29: out_r[6] = 1'b1;
          6'h2a: out_r[6] = 1'b1;
          6'h2c: out_r[6] = 1'b1;
          6'h2e: out_r[6] = 1'b1;
          6'h30: out_r[6] = 1'b1;
          6'h31: out_r[6] = 1'b1;
          6'h32: out_r[6] = 1'b1;
          6'h33: out_r[6] = 1'b1;
          6'h34: out_r[6] = 1'b1;
          6'h35: out_r[6] = 1'b1;
          6'h36: out_r[6] = 1'b1;
          6'h37: out_r[6] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h09: out_r[7] = 1'b0;
          6'h0c: out_r[7] = 1'b0;
          6'h11: out_r[7] = 1'b0;
          6'h15: out_r[7] = 1'b0;
          6'h1b: out_r[7] = 1'b0;
          6'h1c: out_r[7] = 1'b0;
          6'h1d: out_r[7] = 1'b0;
          6'h1f: out_r[7] = 1'b0;
          6'h20: out_r[7] = 1'b0;
          6'h21: out_r[7] = 1'b0;
          6'h26: out_r[7] = 1'b0;
          6'h38: out_r[7] = 1'b0;
          6'h39: out_r[7] = 1'b0;
          6'h3a: out_r[7] = 1'b0;
          6'h3b: out_r[7] = 1'b0;
          6'h3c: out_r[7] = 1'b0;
          6'h3d: out_r[7] = 1'b0;
          6'h3e: out_r[7] = 1'b0;
          6'h3f: out_r[7] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[8] = 1'b1;
          6'h01: out_r[8] = 1'b1;
          6'h04: out_r[8] = 1'b1;
          6'h06: out_r[8] = 1'b1;
          6'h08: out_r[8] = 1'b1;
          6'h0a: out_r[8] = 1'b1;
          6'h0d: out_r[8] = 1'b1;
          6'h0e: out_r[8] = 1'b1;
          6'h10: out_r[8] = 1'b1;
          6'h11: out_r[8] = 1'b1;
          6'h12: out_r[8] = 1'b1;
          6'h13: out_r[8] = 1'b1;
          6'h14: out_r[8] = 1'b1;
          6'h16: out_r[8] = 1'b1;
          6'h17: out_r[8] = 1'b1;
          6'h18: out_r[8] = 1'b1;
          6'h19: out_r[8] = 1'b1;
          6'h22: out_r[8] = 1'b1;
          6'h23: out_r[8] = 1'b1;
          6'h24: out_r[8] = 1'b1;
          6'h25: out_r[8] = 1'b1;
          6'h26: out_r[8] = 1'b1;
          6'h27: out_r[8] = 1'b1;
          6'h28: out_r[8] = 1'b1;
          6'h29: out_r[8] = 1'b1;
          6'h2a: out_r[8] = 1'b1;
          6'h2b: out_r[8] = 1'b1;
          6'h2d: out_r[8] = 1'b1;
          6'h2e: out_r[8] = 1'b1;
          6'h2f: out_r[8] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h04: out_r[9] = 1'b0;
          6'h06: out_r[9] = 1'b0;
          6'h0a: out_r[9] = 1'b0;
          6'h0c: out_r[9] = 1'b0;
          6'h0e: out_r[9] = 1'b0;
          6'h17: out_r[9] = 1'b0;
          6'h18: out_r[9] = 1'b0;
          6'h26: out_r[9] = 1'b0;
          6'h28: out_r[9] = 1'b0;
          6'h29: out_r[9] = 1'b0;
          6'h2a: out_r[9] = 1'b0;
          6'h2e: out_r[9] = 1'b0;
          6'h30: out_r[9] = 1'b0;
          6'h31: out_r[9] = 1'b0;
          6'h32: out_r[9] = 1'b0;
          6'h33: out_r[9] = 1'b0;
          6'h34: out_r[9] = 1'b0;
          6'h35: out_r[9] = 1'b0;
          6'h36: out_r[9] = 1'b0;
          6'h37: out_r[9] = 1'b0;
          6'h38: out_r[9] = 1'b0;
          6'h39: out_r[9] = 1'b0;
          6'h3a: out_r[9] = 1'b0;
          6'h3b: out_r[9] = 1'b0;
          6'h3c: out_r[9] = 1'b0;
          6'h3d: out_r[9] = 1'b0;
          6'h3e: out_r[9] = 1'b0;
          6'h3f: out_r[9] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h01: out_r[10] = 1'b1;
          6'h02: out_r[10] = 1'b1;
          6'h03: out_r[10] = 1'b1;
          6'h05: out_r[10] = 1'b1;
          6'h07: out_r[10] = 1'b1;
          6'h0b: out_r[10] = 1'b1;
          6'h0c: out_r[10] = 1'b1;
          6'h0d: out_r[10] = 1'b1;
          6'h0f: out_r[10] = 1'b1;
          6'h12: out_r[10] = 1'b1;
          6'h15: out_r[10] = 1'b1;
          6'h17: out_r[10] = 1'b1;
          6'h19: out_r[10] = 1'b1;
          6'h1a: out_r[10] = 1'b1;
          6'h1b: out_r[10] = 1'b1;
          6'h1c: out_r[10] = 1'b1;
          6'h1d: out_r[10] = 1'b1;
          6'h1e: out_r[10] = 1'b1;
          6'h1f: out_r[10] = 1'b1;
          6'h24: out_r[10] = 1'b1;
          6'h2c: out_r[10] = 1'b1;
          6'h30: out_r[10] = 1'b1;
          6'h31: out_r[10] = 1'b1;
          6'h32: out_r[10] = 1'b1;
          6'h33: out_r[10] = 1'b1;
          6'h36: out_r[10] = 1'b1;
          6'h37: out_r[10] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h01: out_r[11] = 1'b0;
          6'h07: out_r[11] = 1'b0;
          6'h0a: out_r[11] = 1'b0;
          6'h0d: out_r[11] = 1'b0;
          6'h0e: out_r[11] = 1'b0;
          6'h12: out_r[11] = 1'b0;
          6'h15: out_r[11] = 1'b0;
          6'h17: out_r[11] = 1'b0;
          6'h19: out_r[11] = 1'b0;
          6'h1a: out_r[11] = 1'b0;
          6'h1e: out_r[11] = 1'b0;
          6'h23: out_r[11] = 1'b0;
          6'h25: out_r[11] = 1'b0;
          6'h27: out_r[11] = 1'b0;
          6'h2b: out_r[11] = 1'b0;
          6'h2d: out_r[11] = 1'b0;
          6'h2f: out_r[11] = 1'b0;
          6'h30: out_r[11] = 1'b0;
          6'h31: out_r[11] = 1'b0;
          6'h32: out_r[11] = 1'b0;
          6'h33: out_r[11] = 1'b0;
          6'h36: out_r[11] = 1'b0;
          6'h37: out_r[11] = 1'b0;
          6'h3b: out_r[11] = 1'b0;
          6'h3f: out_r[11] = 1'b0;
          default: begin end
        endcase
      end
      6'h3c: begin
        out_r = 12'h7ac;
        case (inner)
          6'h00: out_r[0] = 1'b1;
          6'h02: out_r[0] = 1'b1;
          6'h07: out_r[0] = 1'b1;
          6'h0a: out_r[0] = 1'b1;
          6'h10: out_r[0] = 1'b1;
          6'h11: out_r[0] = 1'b1;
          6'h13: out_r[0] = 1'b1;
          6'h17: out_r[0] = 1'b1;
          6'h1a: out_r[0] = 1'b1;
          6'h20: out_r[0] = 1'b1;
          6'h21: out_r[0] = 1'b1;
          6'h24: out_r[0] = 1'b1;
          6'h25: out_r[0] = 1'b1;
          6'h26: out_r[0] = 1'b1;
          6'h28: out_r[0] = 1'b1;
          6'h2b: out_r[0] = 1'b1;
          6'h32: out_r[0] = 1'b1;
          6'h33: out_r[0] = 1'b1;
          6'h35: out_r[0] = 1'b1;
          6'h38: out_r[0] = 1'b1;
          6'h3b: out_r[0] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h02: out_r[1] = 1'b1;
          6'h0a: out_r[1] = 1'b1;
          6'h0d: out_r[1] = 1'b1;
          6'h0f: out_r[1] = 1'b1;
          6'h10: out_r[1] = 1'b1;
          6'h12: out_r[1] = 1'b1;
          6'h13: out_r[1] = 1'b1;
          6'h14: out_r[1] = 1'b1;
          6'h16: out_r[1] = 1'b1;
          6'h1a: out_r[1] = 1'b1;
          6'h1d: out_r[1] = 1'b1;
          6'h1f: out_r[1] = 1'b1;
          6'h23: out_r[1] = 1'b1;
          6'h27: out_r[1] = 1'b1;
          6'h2d: out_r[1] = 1'b1;
          6'h2f: out_r[1] = 1'b1;
          6'h31: out_r[1] = 1'b1;
          6'h32: out_r[1] = 1'b1;
          6'h33: out_r[1] = 1'b1;
          6'h38: out_r[1] = 1'b1;
          6'h3b: out_r[1] = 1'b1;
          6'h3d: out_r[1] = 1'b1;
          6'h3f: out_r[1] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h08: out_r[2] = 1'b0;
          6'h0c: out_r[2] = 1'b0;
          6'h0d: out_r[2] = 1'b0;
          6'h0e: out_r[2] = 1'b0;
          6'h0f: out_r[2] = 1'b0;
          6'h12: out_r[2] = 1'b0;
          6'h13: out_r[2] = 1'b0;
          6'h14: out_r[2] = 1'b0;
          6'h16: out_r[2] = 1'b0;
          6'h18: out_r[2] = 1'b0;
          6'h1c: out_r[2] = 1'b0;
          6'h1d: out_r[2] = 1'b0;
          6'h1e: out_r[2] = 1'b0;
          6'h1f: out_r[2] = 1'b0;
          6'h22: out_r[2] = 1'b0;
          6'h23: out_r[2] = 1'b0;
          6'h25: out_r[2] = 1'b0;
          6'h27: out_r[2] = 1'b0;
          6'h28: out_r[2] = 1'b0;
          6'h2c: out_r[2] = 1'b0;
          6'h2d: out_r[2] = 1'b0;
          6'h2e: out_r[2] = 1'b0;
          6'h2f: out_r[2] = 1'b0;
          6'h30: out_r[2] = 1'b0;
          6'h31: out_r[2] = 1'b0;
          6'h32: out_r[2] = 1'b0;
          6'h33: out_r[2] = 1'b0;
          6'h3c: out_r[2] = 1'b0;
          6'h3d: out_r[2] = 1'b0;
          6'h3e: out_r[2] = 1'b0;
          6'h3f: out_r[2] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h02: out_r[3] = 1'b0;
          6'h08: out_r[3] = 1'b0;
          6'h12: out_r[3] = 1'b0;
          6'h14: out_r[3] = 1'b0;
          6'h15: out_r[3] = 1'b0;
          6'h16: out_r[3] = 1'b0;
          6'h17: out_r[3] = 1'b0;
          6'h18: out_r[3] = 1'b0;
          6'h20: out_r[3] = 1'b0;
          6'h21: out_r[3] = 1'b0;
          6'h22: out_r[3] = 1'b0;
          6'h24: out_r[3] = 1'b0;
          6'h26: out_r[3] = 1'b0;
          6'h27: out_r[3] = 1'b0;
          6'h29: out_r[3] = 1'b0;
          6'h2a: out_r[3] = 1'b0;
          6'h30: out_r[3] = 1'b0;
          6'h31: out_r[3] = 1'b0;
          6'h32: out_r[3] = 1'b0;
          6'h33: out_r[3] = 1'b0;
          6'h34: out_r[3] = 1'b0;
          6'h35: out_r[3] = 1'b0;
          6'h36: out_r[3] = 1'b0;
          6'h37: out_r[3] = 1'b0;
          6'h3a: out_r[3] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h02: out_r[4] = 1'b1;
          6'h08: out_r[4] = 1'b1;
          6'h0a: out_r[4] = 1'b1;
          6'h10: out_r[4] = 1'b1;
          6'h14: out_r[4] = 1'b1;
          6'h15: out_r[4] = 1'b1;
          6'h16: out_r[4] = 1'b1;
          6'h17: out_r[4] = 1'b1;
          6'h18: out_r[4] = 1'b1;
          6'h1a: out_r[4] = 1'b1;
          6'h22: out_r[4] = 1'b1;
          6'h24: out_r[4] = 1'b1;
          6'h26: out_r[4] = 1'b1;
          6'h29: out_r[4] = 1'b1;
          6'h2a: out_r[4] = 1'b1;
          6'h2b: out_r[4] = 1'b1;
          6'h33: out_r[4] = 1'b1;
          6'h38: out_r[4] = 1'b1;
          6'h39: out_r[4] = 1'b1;
          6'h3a: out_r[4] = 1'b1;
          6'h3b: out_r[4] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h0c: out_r[5] = 1'b0;
          6'h0d: out_r[5] = 1'b0;
          6'h0e: out_r[5] = 1'b0;
          6'h0f: out_r[5] = 1'b0;
          6'h17: out_r[5] = 1'b0;
          6'h1c: out_r[5] = 1'b0;
          6'h1d: out_r[5] = 1'b0;
          6'h1e: out_r[5] = 1'b0;
          6'h1f: out_r[5] = 1'b0;
          6'h29: out_r[5] = 1'b0;
          6'h2a: out_r[5] = 1'b0;
          6'h2c: out_r[5] = 1'b0;
          6'h2d: out_r[5] = 1'b0;
          6'h2e: out_r[5] = 1'b0;
          6'h2f: out_r[5] = 1'b0;
          6'h3c: out_r[5] = 1'b0;
          6'h3d: out_r[5] = 1'b0;
          6'h3e: out_r[5] = 1'b0;
          6'h3f: out_r[5] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[6] = 1'b1;
          6'h02: out_r[6] = 1'b1;
          6'h07: out_r[6] = 1'b1;
          6'h0f: out_r[6] = 1'b1;
          6'h11: out_r[6] = 1'b1;
          6'h12: out_r[6] = 1'b1;
          6'h13: out_r[6] = 1'b1;
          6'h15: out_r[6] = 1'b1;
          6'h1f: out_r[6] = 1'b1;
          6'h20: out_r[6] = 1'b1;
          6'h21: out_r[6] = 1'b1;
          6'h23: out_r[6] = 1'b1;
          6'h24: out_r[6] = 1'b1;
          6'h25: out_r[6] = 1'b1;
          6'h26: out_r[6] = 1'b1;
          6'h27: out_r[6] = 1'b1;
          6'h2b: out_r[6] = 1'b1;
          6'h2f: out_r[6] = 1'b1;
          6'h30: out_r[6] = 1'b1;
          6'h31: out_r[6] = 1'b1;
          6'h32: out_r[6] = 1'b1;
          6'h33: out_r[6] = 1'b1;
          6'h34: out_r[6] = 1'b1;
          6'h35: out_r[6] = 1'b1;
          6'h36: out_r[6] = 1'b1;
          6'h37: out_r[6] = 1'b1;
          6'h3f: out_r[6] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[7] = 1'b0;
          6'h02: out_r[7] = 1'b0;
          6'h07: out_r[7] = 1'b0;
          6'h0f: out_r[7] = 1'b0;
          6'h11: out_r[7] = 1'b0;
          6'h12: out_r[7] = 1'b0;
          6'h13: out_r[7] = 1'b0;
          6'h1f: out_r[7] = 1'b0;
          6'h21: out_r[7] = 1'b0;
          6'h23: out_r[7] = 1'b0;
          6'h24: out_r[7] = 1'b0;
          6'h26: out_r[7] = 1'b0;
          6'h27: out_r[7] = 1'b0;
          6'h2b: out_r[7] = 1'b0;
          6'h2f: out_r[7] = 1'b0;
          6'h32: out_r[7] = 1'b0;
          6'h33: out_r[7] = 1'b0;
          6'h38: out_r[7] = 1'b0;
          6'h39: out_r[7] = 1'b0;
          6'h3a: out_r[7] = 1'b0;
          6'h3c: out_r[7] = 1'b0;
          6'h3d: out_r[7] = 1'b0;
          6'h3e: out_r[7] = 1'b0;
          6'h3f: out_r[7] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[8] = 1'b0;
          6'h02: out_r[8] = 1'b0;
          6'h07: out_r[8] = 1'b0;
          6'h0f: out_r[8] = 1'b0;
          6'h11: out_r[8] = 1'b0;
          6'h12: out_r[8] = 1'b0;
          6'h13: out_r[8] = 1'b0;
          6'h1f: out_r[8] = 1'b0;
          6'h21: out_r[8] = 1'b0;
          6'h23: out_r[8] = 1'b0;
          6'h25: out_r[8] = 1'b0;
          6'h27: out_r[8] = 1'b0;
          6'h29: out_r[8] = 1'b0;
          6'h2a: out_r[8] = 1'b0;
          6'h2b: out_r[8] = 1'b0;
          6'h2c: out_r[8] = 1'b0;
          6'h2d: out_r[8] = 1'b0;
          6'h2e: out_r[8] = 1'b0;
          6'h2f: out_r[8] = 1'b0;
          6'h30: out_r[8] = 1'b0;
          6'h31: out_r[8] = 1'b0;
          6'h32: out_r[8] = 1'b0;
          6'h33: out_r[8] = 1'b0;
          6'h34: out_r[8] = 1'b0;
          6'h36: out_r[8] = 1'b0;
          6'h37: out_r[8] = 1'b0;
          6'h3a: out_r[8] = 1'b0;
          6'h3c: out_r[8] = 1'b0;
          6'h3d: out_r[8] = 1'b0;
          6'h3e: out_r[8] = 1'b0;
          6'h3f: out_r[8] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h02: out_r[9] = 1'b0;
          6'h15: out_r[9] = 1'b0;
          6'h17: out_r[9] = 1'b0;
          6'h20: out_r[9] = 1'b0;
          6'h21: out_r[9] = 1'b0;
          6'h23: out_r[9] = 1'b0;
          6'h24: out_r[9] = 1'b0;
          6'h26: out_r[9] = 1'b0;
          6'h27: out_r[9] = 1'b0;
          6'h2b: out_r[9] = 1'b0;
          6'h2f: out_r[9] = 1'b0;
          6'h32: out_r[9] = 1'b0;
          6'h33: out_r[9] = 1'b0;
          6'h35: out_r[9] = 1'b0;
          6'h38: out_r[9] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h02: out_r[10] = 1'b0;
          6'h0a: out_r[10] = 1'b0;
          6'h10: out_r[10] = 1'b0;
          6'h13: out_r[10] = 1'b0;
          6'h15: out_r[10] = 1'b0;
          6'h1a: out_r[10] = 1'b0;
          6'h20: out_r[10] = 1'b0;
          6'h24: out_r[10] = 1'b0;
          6'h26: out_r[10] = 1'b0;
          6'h32: out_r[10] = 1'b0;
          6'h33: out_r[10] = 1'b0;
          6'h35: out_r[10] = 1'b0;
          6'h38: out_r[10] = 1'b0;
          6'h3b: out_r[10] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h02: out_r[11] = 1'b1;
          6'h0a: out_r[11] = 1'b1;
          6'h10: out_r[11] = 1'b1;
          6'h13: out_r[11] = 1'b1;
          6'h1a: out_r[11] = 1'b1;
          6'h21: out_r[11] = 1'b1;
          6'h24: out_r[11] = 1'b1;
          6'h25: out_r[11] = 1'b1;
          6'h26: out_r[11] = 1'b1;
          6'h2c: out_r[11] = 1'b1;
          6'h2d: out_r[11] = 1'b1;
          6'h2e: out_r[11] = 1'b1;
          6'h30: out_r[11] = 1'b1;
          6'h31: out_r[11] = 1'b1;
          6'h33: out_r[11] = 1'b1;
          6'h34: out_r[11] = 1'b1;
          6'h36: out_r[11] = 1'b1;
          6'h3b: out_r[11] = 1'b1;
          6'h3c: out_r[11] = 1'b1;
          6'h3d: out_r[11] = 1'b1;
          6'h3e: out_r[11] = 1'b1;
          default: begin end
        endcase
      end
      6'h3d: begin
        out_r = 12'haa3;
        case (inner)
          6'h02: out_r[0] = 1'b0;
          6'h03: out_r[0] = 1'b0;
          6'h06: out_r[0] = 1'b0;
          6'h0a: out_r[0] = 1'b0;
          6'h0b: out_r[0] = 1'b0;
          6'h18: out_r[0] = 1'b0;
          6'h19: out_r[0] = 1'b0;
          6'h22: out_r[0] = 1'b0;
          6'h23: out_r[0] = 1'b0;
          6'h32: out_r[0] = 1'b0;
          6'h33: out_r[0] = 1'b0;
          6'h38: out_r[0] = 1'b0;
          6'h39: out_r[0] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[1] = 1'b0;
          6'h01: out_r[1] = 1'b0;
          6'h05: out_r[1] = 1'b0;
          6'h07: out_r[1] = 1'b0;
          6'h09: out_r[1] = 1'b0;
          6'h0d: out_r[1] = 1'b0;
          6'h0f: out_r[1] = 1'b0;
          6'h10: out_r[1] = 1'b0;
          6'h14: out_r[1] = 1'b0;
          6'h15: out_r[1] = 1'b0;
          6'h16: out_r[1] = 1'b0;
          6'h17: out_r[1] = 1'b0;
          6'h1a: out_r[1] = 1'b0;
          6'h1b: out_r[1] = 1'b0;
          6'h1c: out_r[1] = 1'b0;
          6'h1e: out_r[1] = 1'b0;
          6'h20: out_r[1] = 1'b0;
          6'h24: out_r[1] = 1'b0;
          6'h28: out_r[1] = 1'b0;
          6'h29: out_r[1] = 1'b0;
          6'h2a: out_r[1] = 1'b0;
          6'h2b: out_r[1] = 1'b0;
          6'h30: out_r[1] = 1'b0;
          6'h34: out_r[1] = 1'b0;
          6'h3a: out_r[1] = 1'b0;
          6'h3b: out_r[1] = 1'b0;
          6'h3c: out_r[1] = 1'b0;
          6'h3e: out_r[1] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h02: out_r[2] = 1'b1;
          6'h03: out_r[2] = 1'b1;
          6'h04: out_r[2] = 1'b1;
          6'h06: out_r[2] = 1'b1;
          6'h08: out_r[2] = 1'b1;
          6'h0a: out_r[2] = 1'b1;
          6'h0b: out_r[2] = 1'b1;
          6'h0e: out_r[2] = 1'b1;
          6'h12: out_r[2] = 1'b1;
          6'h13: out_r[2] = 1'b1;
          6'h16: out_r[2] = 1'b1;
          6'h18: out_r[2] = 1'b1;
          6'h19: out_r[2] = 1'b1;
          6'h1a: out_r[2] = 1'b1;
          6'h1b: out_r[2] = 1'b1;
          6'h22: out_r[2] = 1'b1;
          6'h23: out_r[2] = 1'b1;
          6'h24: out_r[2] = 1'b1;
          6'h26: out_r[2] = 1'b1;
          6'h2c: out_r[2] = 1'b1;
          6'h2e: out_r[2] = 1'b1;
          6'h32: out_r[2] = 1'b1;
          6'h33: out_r[2] = 1'b1;
          6'h35: out_r[2] = 1'b1;
          6'h36: out_r[2] = 1'b1;
          6'h37: out_r[2] = 1'b1;
          6'h38: out_r[2] = 1'b1;
          6'h39: out_r[2] = 1'b1;
          6'h3a: out_r[2] = 1'b1;
          6'h3b: out_r[2] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h05: out_r[3] = 1'b1;
          6'h07: out_r[3] = 1'b1;
          6'h0a: out_r[3] = 1'b1;
          6'h0c: out_r[3] = 1'b1;
          6'h0d: out_r[3] = 1'b1;
          6'h0f: out_r[3] = 1'b1;
          6'h18: out_r[3] = 1'b1;
          6'h19: out_r[3] = 1'b1;
          6'h1c: out_r[3] = 1'b1;
          6'h1d: out_r[3] = 1'b1;
          6'h1e: out_r[3] = 1'b1;
          6'h1f: out_r[3] = 1'b1;
          6'h20: out_r[3] = 1'b1;
          6'h22: out_r[3] = 1'b1;
          6'h23: out_r[3] = 1'b1;
          6'h25: out_r[3] = 1'b1;
          6'h27: out_r[3] = 1'b1;
          6'h28: out_r[3] = 1'b1;
          6'h2a: out_r[3] = 1'b1;
          6'h2b: out_r[3] = 1'b1;
          6'h2d: out_r[3] = 1'b1;
          6'h2f: out_r[3] = 1'b1;
          6'h32: out_r[3] = 1'b1;
          6'h33: out_r[3] = 1'b1;
          6'h38: out_r[3] = 1'b1;
          6'h39: out_r[3] = 1'b1;
          6'h3c: out_r[3] = 1'b1;
          6'h3d: out_r[3] = 1'b1;
          6'h3e: out_r[3] = 1'b1;
          6'h3f: out_r[3] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h01: out_r[4] = 1'b1;
          6'h06: out_r[4] = 1'b1;
          6'h0e: out_r[4] = 1'b1;
          6'h10: out_r[4] = 1'b1;
          6'h13: out_r[4] = 1'b1;
          6'h14: out_r[4] = 1'b1;
          6'h15: out_r[4] = 1'b1;
          6'h16: out_r[4] = 1'b1;
          6'h17: out_r[4] = 1'b1;
          6'h18: out_r[4] = 1'b1;
          6'h19: out_r[4] = 1'b1;
          6'h1a: out_r[4] = 1'b1;
          6'h1b: out_r[4] = 1'b1;
          6'h23: out_r[4] = 1'b1;
          6'h24: out_r[4] = 1'b1;
          6'h2e: out_r[4] = 1'b1;
          6'h30: out_r[4] = 1'b1;
          6'h34: out_r[4] = 1'b1;
          6'h38: out_r[4] = 1'b1;
          6'h39: out_r[4] = 1'b1;
          6'h3a: out_r[4] = 1'b1;
          6'h3b: out_r[4] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h06: out_r[5] = 1'b0;
          6'h0e: out_r[5] = 1'b0;
          6'h10: out_r[5] = 1'b0;
          6'h13: out_r[5] = 1'b0;
          6'h1c: out_r[5] = 1'b0;
          6'h1d: out_r[5] = 1'b0;
          6'h1e: out_r[5] = 1'b0;
          6'h1f: out_r[5] = 1'b0;
          6'h24: out_r[5] = 1'b0;
          6'h28: out_r[5] = 1'b0;
          6'h2a: out_r[5] = 1'b0;
          6'h2d: out_r[5] = 1'b0;
          6'h2e: out_r[5] = 1'b0;
          6'h2f: out_r[5] = 1'b0;
          6'h30: out_r[5] = 1'b0;
          6'h3c: out_r[5] = 1'b0;
          6'h3d: out_r[5] = 1'b0;
          6'h3e: out_r[5] = 1'b0;
          6'h3f: out_r[5] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[6] = 1'b1;
          6'h02: out_r[6] = 1'b1;
          6'h03: out_r[6] = 1'b1;
          6'h04: out_r[6] = 1'b1;
          6'h05: out_r[6] = 1'b1;
          6'h07: out_r[6] = 1'b1;
          6'h08: out_r[6] = 1'b1;
          6'h09: out_r[6] = 1'b1;
          6'h0a: out_r[6] = 1'b1;
          6'h0b: out_r[6] = 1'b1;
          6'h0c: out_r[6] = 1'b1;
          6'h11: out_r[6] = 1'b1;
          6'h12: out_r[6] = 1'b1;
          6'h13: out_r[6] = 1'b1;
          6'h14: out_r[6] = 1'b1;
          6'h15: out_r[6] = 1'b1;
          6'h17: out_r[6] = 1'b1;
          6'h20: out_r[6] = 1'b1;
          6'h26: out_r[6] = 1'b1;
          6'h28: out_r[6] = 1'b1;
          6'h29: out_r[6] = 1'b1;
          6'h2b: out_r[6] = 1'b1;
          6'h2c: out_r[6] = 1'b1;
          6'h31: out_r[6] = 1'b1;
          6'h32: out_r[6] = 1'b1;
          6'h33: out_r[6] = 1'b1;
          6'h34: out_r[6] = 1'b1;
          6'h35: out_r[6] = 1'b1;
          6'h36: out_r[6] = 1'b1;
          6'h37: out_r[6] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h02: out_r[7] = 1'b0;
          6'h03: out_r[7] = 1'b0;
          6'h05: out_r[7] = 1'b0;
          6'h06: out_r[7] = 1'b0;
          6'h07: out_r[7] = 1'b0;
          6'h0c: out_r[7] = 1'b0;
          6'h13: out_r[7] = 1'b0;
          6'h14: out_r[7] = 1'b0;
          6'h15: out_r[7] = 1'b0;
          6'h17: out_r[7] = 1'b0;
          6'h18: out_r[7] = 1'b0;
          6'h19: out_r[7] = 1'b0;
          6'h1a: out_r[7] = 1'b0;
          6'h1b: out_r[7] = 1'b0;
          6'h1c: out_r[7] = 1'b0;
          6'h1d: out_r[7] = 1'b0;
          6'h1e: out_r[7] = 1'b0;
          6'h1f: out_r[7] = 1'b0;
          6'h2b: out_r[7] = 1'b0;
          6'h34: out_r[7] = 1'b0;
          6'h38: out_r[7] = 1'b0;
          6'h39: out_r[7] = 1'b0;
          6'h3a: out_r[7] = 1'b0;
          6'h3b: out_r[7] = 1'b0;
          6'h3c: out_r[7] = 1'b0;
          6'h3d: out_r[7] = 1'b0;
          6'h3e: out_r[7] = 1'b0;
          6'h3f: out_r[7] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h01: out_r[8] = 1'b1;
          6'h06: out_r[8] = 1'b1;
          6'h09: out_r[8] = 1'b1;
          6'h0d: out_r[8] = 1'b1;
          6'h0e: out_r[8] = 1'b1;
          6'h0f: out_r[8] = 1'b1;
          6'h12: out_r[8] = 1'b1;
          6'h16: out_r[8] = 1'b1;
          6'h18: out_r[8] = 1'b1;
          6'h19: out_r[8] = 1'b1;
          6'h1b: out_r[8] = 1'b1;
          6'h20: out_r[8] = 1'b1;
          6'h21: out_r[8] = 1'b1;
          6'h22: out_r[8] = 1'b1;
          6'h23: out_r[8] = 1'b1;
          6'h25: out_r[8] = 1'b1;
          6'h26: out_r[8] = 1'b1;
          6'h27: out_r[8] = 1'b1;
          6'h2a: out_r[8] = 1'b1;
          6'h2b: out_r[8] = 1'b1;
          6'h2c: out_r[8] = 1'b1;
          6'h2d: out_r[8] = 1'b1;
          6'h2e: out_r[8] = 1'b1;
          6'h2f: out_r[8] = 1'b1;
          6'h38: out_r[8] = 1'b1;
          6'h39: out_r[8] = 1'b1;
          6'h3b: out_r[8] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h05: out_r[9] = 1'b0;
          6'h07: out_r[9] = 1'b0;
          6'h09: out_r[9] = 1'b0;
          6'h0d: out_r[9] = 1'b0;
          6'h0f: out_r[9] = 1'b0;
          6'h18: out_r[9] = 1'b0;
          6'h19: out_r[9] = 1'b0;
          6'h1b: out_r[9] = 1'b0;
          6'h20: out_r[9] = 1'b0;
          6'h23: out_r[9] = 1'b0;
          6'h26: out_r[9] = 1'b0;
          6'h2a: out_r[9] = 1'b0;
          6'h2b: out_r[9] = 1'b0;
          6'h2c: out_r[9] = 1'b0;
          6'h31: out_r[9] = 1'b0;
          6'h32: out_r[9] = 1'b0;
          6'h33: out_r[9] = 1'b0;
          6'h35: out_r[9] = 1'b0;
          6'h36: out_r[9] = 1'b0;
          6'h37: out_r[9] = 1'b0;
          6'h38: out_r[9] = 1'b0;
          6'h39: out_r[9] = 1'b0;
          6'h3b: out_r[9] = 1'b0;
          6'h3d: out_r[9] = 1'b0;
          6'h3f: out_r[9] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[10] = 1'b1;
          6'h02: out_r[10] = 1'b1;
          6'h03: out_r[10] = 1'b1;
          6'h05: out_r[10] = 1'b1;
          6'h06: out_r[10] = 1'b1;
          6'h07: out_r[10] = 1'b1;
          6'h0a: out_r[10] = 1'b1;
          6'h0b: out_r[10] = 1'b1;
          6'h10: out_r[10] = 1'b1;
          6'h16: out_r[10] = 1'b1;
          6'h1a: out_r[10] = 1'b1;
          6'h1c: out_r[10] = 1'b1;
          6'h1e: out_r[10] = 1'b1;
          6'h24: out_r[10] = 1'b1;
          6'h28: out_r[10] = 1'b1;
          6'h29: out_r[10] = 1'b1;
          6'h30: out_r[10] = 1'b1;
          6'h3a: out_r[10] = 1'b1;
          6'h3c: out_r[10] = 1'b1;
          6'h3e: out_r[10] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h02: out_r[11] = 1'b0;
          6'h03: out_r[11] = 1'b0;
          6'h06: out_r[11] = 1'b0;
          6'h0b: out_r[11] = 1'b0;
          6'h1b: out_r[11] = 1'b0;
          6'h26: out_r[11] = 1'b0;
          default: begin end
        endcase
      end
      6'h3e: begin
        out_r = 12'hea8;
        case (inner)
          6'h01: out_r[0] = 1'b1;
          6'h02: out_r[0] = 1'b1;
          6'h03: out_r[0] = 1'b1;
          6'h04: out_r[0] = 1'b1;
          6'h05: out_r[0] = 1'b1;
          6'h07: out_r[0] = 1'b1;
          6'h09: out_r[0] = 1'b1;
          6'h0b: out_r[0] = 1'b1;
          6'h0c: out_r[0] = 1'b1;
          6'h0d: out_r[0] = 1'b1;
          6'h11: out_r[0] = 1'b1;
          6'h12: out_r[0] = 1'b1;
          6'h13: out_r[0] = 1'b1;
          6'h16: out_r[0] = 1'b1;
          6'h17: out_r[0] = 1'b1;
          6'h19: out_r[0] = 1'b1;
          6'h1b: out_r[0] = 1'b1;
          6'h1c: out_r[0] = 1'b1;
          6'h1d: out_r[0] = 1'b1;
          6'h21: out_r[0] = 1'b1;
          6'h25: out_r[0] = 1'b1;
          6'h29: out_r[0] = 1'b1;
          6'h2c: out_r[0] = 1'b1;
          6'h2d: out_r[0] = 1'b1;
          6'h31: out_r[0] = 1'b1;
          6'h39: out_r[0] = 1'b1;
          6'h3a: out_r[0] = 1'b1;
          6'h3b: out_r[0] = 1'b1;
          6'h3c: out_r[0] = 1'b1;
          6'h3d: out_r[0] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h05: out_r[1] = 1'b1;
          6'h06: out_r[1] = 1'b1;
          6'h0c: out_r[1] = 1'b1;
          6'h0e: out_r[1] = 1'b1;
          6'h0f: out_r[1] = 1'b1;
          6'h10: out_r[1] = 1'b1;
          6'h11: out_r[1] = 1'b1;
          6'h14: out_r[1] = 1'b1;
          6'h15: out_r[1] = 1'b1;
          6'h19: out_r[1] = 1'b1;
          6'h1c: out_r[1] = 1'b1;
          6'h1e: out_r[1] = 1'b1;
          6'h1f: out_r[1] = 1'b1;
          6'h22: out_r[1] = 1'b1;
          6'h23: out_r[1] = 1'b1;
          6'h26: out_r[1] = 1'b1;
          6'h27: out_r[1] = 1'b1;
          6'h2c: out_r[1] = 1'b1;
          6'h2e: out_r[1] = 1'b1;
          6'h2f: out_r[1] = 1'b1;
          6'h31: out_r[1] = 1'b1;
          6'h32: out_r[1] = 1'b1;
          6'h33: out_r[1] = 1'b1;
          6'h35: out_r[1] = 1'b1;
          6'h36: out_r[1] = 1'b1;
          6'h37: out_r[1] = 1'b1;
          6'h39: out_r[1] = 1'b1;
          6'h3c: out_r[1] = 1'b1;
          6'h3e: out_r[1] = 1'b1;
          6'h3f: out_r[1] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h03: out_r[2] = 1'b1;
          6'h07: out_r[2] = 1'b1;
          6'h08: out_r[2] = 1'b1;
          6'h0a: out_r[2] = 1'b1;
          6'h0b: out_r[2] = 1'b1;
          6'h0c: out_r[2] = 1'b1;
          6'h0d: out_r[2] = 1'b1;
          6'h12: out_r[2] = 1'b1;
          6'h17: out_r[2] = 1'b1;
          6'h18: out_r[2] = 1'b1;
          6'h1a: out_r[2] = 1'b1;
          6'h1c: out_r[2] = 1'b1;
          6'h1d: out_r[2] = 1'b1;
          6'h20: out_r[2] = 1'b1;
          6'h29: out_r[2] = 1'b1;
          6'h2a: out_r[2] = 1'b1;
          6'h2b: out_r[2] = 1'b1;
          6'h2c: out_r[2] = 1'b1;
          6'h2d: out_r[2] = 1'b1;
          6'h31: out_r[2] = 1'b1;
          6'h3c: out_r[2] = 1'b1;
          6'h3d: out_r[2] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h03: out_r[3] = 1'b0;
          6'h07: out_r[3] = 1'b0;
          6'h08: out_r[3] = 1'b0;
          6'h0e: out_r[3] = 1'b0;
          6'h0f: out_r[3] = 1'b0;
          6'h12: out_r[3] = 1'b0;
          6'h14: out_r[3] = 1'b0;
          6'h15: out_r[3] = 1'b0;
          6'h17: out_r[3] = 1'b0;
          6'h18: out_r[3] = 1'b0;
          6'h1e: out_r[3] = 1'b0;
          6'h1f: out_r[3] = 1'b0;
          6'h29: out_r[3] = 1'b0;
          6'h2e: out_r[3] = 1'b0;
          6'h2f: out_r[3] = 1'b0;
          6'h36: out_r[3] = 1'b0;
          6'h37: out_r[3] = 1'b0;
          6'h3e: out_r[3] = 1'b0;
          6'h3f: out_r[3] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[4] = 1'b1;
          6'h01: out_r[4] = 1'b1;
          6'h02: out_r[4] = 1'b1;
          6'h04: out_r[4] = 1'b1;
          6'h05: out_r[4] = 1'b1;
          6'h06: out_r[4] = 1'b1;
          6'h09: out_r[4] = 1'b1;
          6'h0a: out_r[4] = 1'b1;
          6'h10: out_r[4] = 1'b1;
          6'h13: out_r[4] = 1'b1;
          6'h14: out_r[4] = 1'b1;
          6'h16: out_r[4] = 1'b1;
          6'h19: out_r[4] = 1'b1;
          6'h1a: out_r[4] = 1'b1;
          6'h1b: out_r[4] = 1'b1;
          6'h21: out_r[4] = 1'b1;
          6'h22: out_r[4] = 1'b1;
          6'h23: out_r[4] = 1'b1;
          6'h24: out_r[4] = 1'b1;
          6'h25: out_r[4] = 1'b1;
          6'h28: out_r[4] = 1'b1;
          6'h29: out_r[4] = 1'b1;
          6'h2a: out_r[4] = 1'b1;
          6'h2b: out_r[4] = 1'b1;
          6'h34: out_r[4] = 1'b1;
          6'h35: out_r[4] = 1'b1;
          6'h38: out_r[4] = 1'b1;
          6'h39: out_r[4] = 1'b1;
          6'h3a: out_r[4] = 1'b1;
          6'h3b: out_r[4] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h01: out_r[5] = 1'b0;
          6'h03: out_r[5] = 1'b0;
          6'h06: out_r[5] = 1'b0;
          6'h0a: out_r[5] = 1'b0;
          6'h0c: out_r[5] = 1'b0;
          6'h0d: out_r[5] = 1'b0;
          6'h0e: out_r[5] = 1'b0;
          6'h0f: out_r[5] = 1'b0;
          6'h1a: out_r[5] = 1'b0;
          6'h1c: out_r[5] = 1'b0;
          6'h1d: out_r[5] = 1'b0;
          6'h1e: out_r[5] = 1'b0;
          6'h1f: out_r[5] = 1'b0;
          6'h21: out_r[5] = 1'b0;
          6'h22: out_r[5] = 1'b0;
          6'h23: out_r[5] = 1'b0;
          6'h29: out_r[5] = 1'b0;
          6'h2a: out_r[5] = 1'b0;
          6'h2b: out_r[5] = 1'b0;
          6'h2c: out_r[5] = 1'b0;
          6'h2d: out_r[5] = 1'b0;
          6'h2e: out_r[5] = 1'b0;
          6'h2f: out_r[5] = 1'b0;
          6'h35: out_r[5] = 1'b0;
          6'h3c: out_r[5] = 1'b0;
          6'h3d: out_r[5] = 1'b0;
          6'h3e: out_r[5] = 1'b0;
          6'h3f: out_r[5] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h03: out_r[6] = 1'b1;
          6'h07: out_r[6] = 1'b1;
          6'h09: out_r[6] = 1'b1;
          6'h0b: out_r[6] = 1'b1;
          6'h0c: out_r[6] = 1'b1;
          6'h10: out_r[6] = 1'b1;
          6'h11: out_r[6] = 1'b1;
          6'h13: out_r[6] = 1'b1;
          6'h15: out_r[6] = 1'b1;
          6'h16: out_r[6] = 1'b1;
          6'h17: out_r[6] = 1'b1;
          6'h1c: out_r[6] = 1'b1;
          6'h20: out_r[6] = 1'b1;
          6'h24: out_r[6] = 1'b1;
          6'h26: out_r[6] = 1'b1;
          6'h27: out_r[6] = 1'b1;
          6'h2c: out_r[6] = 1'b1;
          6'h2d: out_r[6] = 1'b1;
          6'h30: out_r[6] = 1'b1;
          6'h31: out_r[6] = 1'b1;
          6'h32: out_r[6] = 1'b1;
          6'h33: out_r[6] = 1'b1;
          6'h35: out_r[6] = 1'b1;
          6'h36: out_r[6] = 1'b1;
          6'h37: out_r[6] = 1'b1;
          6'h3c: out_r[6] = 1'b1;
          6'h3d: out_r[6] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h0c: out_r[7] = 1'b0;
          6'h10: out_r[7] = 1'b0;
          6'h13: out_r[7] = 1'b0;
          6'h15: out_r[7] = 1'b0;
          6'h16: out_r[7] = 1'b0;
          6'h19: out_r[7] = 1'b0;
          6'h1b: out_r[7] = 1'b0;
          6'h1c: out_r[7] = 1'b0;
          6'h22: out_r[7] = 1'b0;
          6'h23: out_r[7] = 1'b0;
          6'h24: out_r[7] = 1'b0;
          6'h26: out_r[7] = 1'b0;
          6'h27: out_r[7] = 1'b0;
          6'h2c: out_r[7] = 1'b0;
          6'h2d: out_r[7] = 1'b0;
          6'h31: out_r[7] = 1'b0;
          6'h35: out_r[7] = 1'b0;
          6'h38: out_r[7] = 1'b0;
          6'h39: out_r[7] = 1'b0;
          6'h3a: out_r[7] = 1'b0;
          6'h3b: out_r[7] = 1'b0;
          6'h3c: out_r[7] = 1'b0;
          6'h3d: out_r[7] = 1'b0;
          6'h3e: out_r[7] = 1'b0;
          6'h3f: out_r[7] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[8] = 1'b1;
          6'h01: out_r[8] = 1'b1;
          6'h03: out_r[8] = 1'b1;
          6'h05: out_r[8] = 1'b1;
          6'h08: out_r[8] = 1'b1;
          6'h0b: out_r[8] = 1'b1;
          6'h0d: out_r[8] = 1'b1;
          6'h0e: out_r[8] = 1'b1;
          6'h0f: out_r[8] = 1'b1;
          6'h12: out_r[8] = 1'b1;
          6'h14: out_r[8] = 1'b1;
          6'h18: out_r[8] = 1'b1;
          6'h1d: out_r[8] = 1'b1;
          6'h1e: out_r[8] = 1'b1;
          6'h1f: out_r[8] = 1'b1;
          6'h21: out_r[8] = 1'b1;
          6'h22: out_r[8] = 1'b1;
          6'h23: out_r[8] = 1'b1;
          6'h25: out_r[8] = 1'b1;
          6'h34: out_r[8] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h01: out_r[9] = 1'b0;
          6'h03: out_r[9] = 1'b0;
          6'h13: out_r[9] = 1'b0;
          6'h21: out_r[9] = 1'b0;
          6'h25: out_r[9] = 1'b0;
          6'h2d: out_r[9] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h01: out_r[10] = 1'b0;
          6'h03: out_r[10] = 1'b0;
          6'h05: out_r[10] = 1'b0;
          6'h0c: out_r[10] = 1'b0;
          6'h11: out_r[10] = 1'b0;
          6'h19: out_r[10] = 1'b0;
          6'h1c: out_r[10] = 1'b0;
          6'h21: out_r[10] = 1'b0;
          6'h25: out_r[10] = 1'b0;
          6'h2c: out_r[10] = 1'b0;
          6'h31: out_r[10] = 1'b0;
          6'h39: out_r[10] = 1'b0;
          6'h3c: out_r[10] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[11] = 1'b0;
          6'h08: out_r[11] = 1'b0;
          6'h0a: out_r[11] = 1'b0;
          6'h0b: out_r[11] = 1'b0;
          6'h0d: out_r[11] = 1'b0;
          6'h0e: out_r[11] = 1'b0;
          6'h0f: out_r[11] = 1'b0;
          6'h10: out_r[11] = 1'b0;
          6'h12: out_r[11] = 1'b0;
          6'h14: out_r[11] = 1'b0;
          6'h15: out_r[11] = 1'b0;
          6'h18: out_r[11] = 1'b0;
          6'h1a: out_r[11] = 1'b0;
          6'h1d: out_r[11] = 1'b0;
          6'h1e: out_r[11] = 1'b0;
          6'h1f: out_r[11] = 1'b0;
          6'h20: out_r[11] = 1'b0;
          6'h22: out_r[11] = 1'b0;
          6'h23: out_r[11] = 1'b0;
          6'h24: out_r[11] = 1'b0;
          6'h26: out_r[11] = 1'b0;
          6'h27: out_r[11] = 1'b0;
          6'h2a: out_r[11] = 1'b0;
          6'h2b: out_r[11] = 1'b0;
          6'h2d: out_r[11] = 1'b0;
          6'h34: out_r[11] = 1'b0;
          6'h35: out_r[11] = 1'b0;
          6'h3d: out_r[11] = 1'b0;
          default: begin end
        endcase
      end
      6'h3f: begin
        out_r = 12'haaa;
        case (inner)
          6'h00: out_r[0] = 1'b1;
          6'h01: out_r[0] = 1'b1;
          6'h02: out_r[0] = 1'b1;
          6'h05: out_r[0] = 1'b1;
          6'h0a: out_r[0] = 1'b1;
          6'h0c: out_r[0] = 1'b1;
          6'h0e: out_r[0] = 1'b1;
          6'h10: out_r[0] = 1'b1;
          6'h11: out_r[0] = 1'b1;
          6'h12: out_r[0] = 1'b1;
          6'h16: out_r[0] = 1'b1;
          6'h1a: out_r[0] = 1'b1;
          6'h1e: out_r[0] = 1'b1;
          6'h21: out_r[0] = 1'b1;
          6'h26: out_r[0] = 1'b1;
          6'h2a: out_r[0] = 1'b1;
          6'h2e: out_r[0] = 1'b1;
          6'h30: out_r[0] = 1'b1;
          6'h31: out_r[0] = 1'b1;
          6'h32: out_r[0] = 1'b1;
          6'h36: out_r[0] = 1'b1;
          6'h3a: out_r[0] = 1'b1;
          6'h3e: out_r[0] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[1] = 1'b0;
          6'h01: out_r[1] = 1'b0;
          6'h05: out_r[1] = 1'b0;
          6'h07: out_r[1] = 1'b0;
          6'h0b: out_r[1] = 1'b0;
          6'h0c: out_r[1] = 1'b0;
          6'h0f: out_r[1] = 1'b0;
          6'h10: out_r[1] = 1'b0;
          6'h11: out_r[1] = 1'b0;
          6'h13: out_r[1] = 1'b0;
          6'h17: out_r[1] = 1'b0;
          6'h1b: out_r[1] = 1'b0;
          6'h1f: out_r[1] = 1'b0;
          6'h23: out_r[1] = 1'b0;
          6'h27: out_r[1] = 1'b0;
          6'h2b: out_r[1] = 1'b0;
          6'h2f: out_r[1] = 1'b0;
          6'h30: out_r[1] = 1'b0;
          6'h31: out_r[1] = 1'b0;
          6'h33: out_r[1] = 1'b0;
          6'h37: out_r[1] = 1'b0;
          6'h3b: out_r[1] = 1'b0;
          6'h3f: out_r[1] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[2] = 1'b1;
          6'h02: out_r[2] = 1'b1;
          6'h03: out_r[2] = 1'b1;
          6'h04: out_r[2] = 1'b1;
          6'h0a: out_r[2] = 1'b1;
          6'h0d: out_r[2] = 1'b1;
          6'h14: out_r[2] = 1'b1;
          6'h15: out_r[2] = 1'b1;
          6'h18: out_r[2] = 1'b1;
          6'h1c: out_r[2] = 1'b1;
          6'h1d: out_r[2] = 1'b1;
          6'h20: out_r[2] = 1'b1;
          6'h21: out_r[2] = 1'b1;
          6'h22: out_r[2] = 1'b1;
          6'h23: out_r[2] = 1'b1;
          6'h24: out_r[2] = 1'b1;
          6'h25: out_r[2] = 1'b1;
          6'h2c: out_r[2] = 1'b1;
          6'h2d: out_r[2] = 1'b1;
          6'h34: out_r[2] = 1'b1;
          6'h35: out_r[2] = 1'b1;
          6'h3c: out_r[2] = 1'b1;
          6'h3d: out_r[2] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[3] = 1'b0;
          6'h02: out_r[3] = 1'b0;
          6'h07: out_r[3] = 1'b0;
          6'h0a: out_r[3] = 1'b0;
          6'h0e: out_r[3] = 1'b0;
          6'h0f: out_r[3] = 1'b0;
          6'h16: out_r[3] = 1'b0;
          6'h17: out_r[3] = 1'b0;
          6'h18: out_r[3] = 1'b0;
          6'h1e: out_r[3] = 1'b0;
          6'h1f: out_r[3] = 1'b0;
          6'h20: out_r[3] = 1'b0;
          6'h21: out_r[3] = 1'b0;
          6'h22: out_r[3] = 1'b0;
          6'h23: out_r[3] = 1'b0;
          6'h26: out_r[3] = 1'b0;
          6'h27: out_r[3] = 1'b0;
          6'h2e: out_r[3] = 1'b0;
          6'h2f: out_r[3] = 1'b0;
          6'h36: out_r[3] = 1'b0;
          6'h37: out_r[3] = 1'b0;
          6'h3e: out_r[3] = 1'b0;
          6'h3f: out_r[3] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[4] = 1'b1;
          6'h01: out_r[4] = 1'b1;
          6'h03: out_r[4] = 1'b1;
          6'h04: out_r[4] = 1'b1;
          6'h05: out_r[4] = 1'b1;
          6'h06: out_r[4] = 1'b1;
          6'h07: out_r[4] = 1'b1;
          6'h08: out_r[4] = 1'b1;
          6'h09: out_r[4] = 1'b1;
          6'h0b: out_r[4] = 1'b1;
          6'h14: out_r[4] = 1'b1;
          6'h19: out_r[4] = 1'b1;
          6'h1a: out_r[4] = 1'b1;
          6'h1b: out_r[4] = 1'b1;
          6'h28: out_r[4] = 1'b1;
          6'h29: out_r[4] = 1'b1;
          6'h2a: out_r[4] = 1'b1;
          6'h2b: out_r[4] = 1'b1;
          6'h30: out_r[4] = 1'b1;
          6'h38: out_r[4] = 1'b1;
          6'h39: out_r[4] = 1'b1;
          6'h3a: out_r[4] = 1'b1;
          6'h3b: out_r[4] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[5] = 1'b0;
          6'h01: out_r[5] = 1'b0;
          6'h03: out_r[5] = 1'b0;
          6'h04: out_r[5] = 1'b0;
          6'h05: out_r[5] = 1'b0;
          6'h07: out_r[5] = 1'b0;
          6'h0d: out_r[5] = 1'b0;
          6'h0e: out_r[5] = 1'b0;
          6'h0f: out_r[5] = 1'b0;
          6'h14: out_r[5] = 1'b0;
          6'h1c: out_r[5] = 1'b0;
          6'h1d: out_r[5] = 1'b0;
          6'h1e: out_r[5] = 1'b0;
          6'h1f: out_r[5] = 1'b0;
          6'h2c: out_r[5] = 1'b0;
          6'h2d: out_r[5] = 1'b0;
          6'h2e: out_r[5] = 1'b0;
          6'h2f: out_r[5] = 1'b0;
          6'h30: out_r[5] = 1'b0;
          6'h3c: out_r[5] = 1'b0;
          6'h3d: out_r[5] = 1'b0;
          6'h3e: out_r[5] = 1'b0;
          6'h3f: out_r[5] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[6] = 1'b1;
          6'h02: out_r[6] = 1'b1;
          6'h06: out_r[6] = 1'b1;
          6'h08: out_r[6] = 1'b1;
          6'h0a: out_r[6] = 1'b1;
          6'h0c: out_r[6] = 1'b1;
          6'h0e: out_r[6] = 1'b1;
          6'h10: out_r[6] = 1'b1;
          6'h11: out_r[6] = 1'b1;
          6'h12: out_r[6] = 1'b1;
          6'h13: out_r[6] = 1'b1;
          6'h15: out_r[6] = 1'b1;
          6'h16: out_r[6] = 1'b1;
          6'h17: out_r[6] = 1'b1;
          6'h21: out_r[6] = 1'b1;
          6'h28: out_r[6] = 1'b1;
          6'h31: out_r[6] = 1'b1;
          6'h32: out_r[6] = 1'b1;
          6'h33: out_r[6] = 1'b1;
          6'h34: out_r[6] = 1'b1;
          6'h35: out_r[6] = 1'b1;
          6'h36: out_r[6] = 1'b1;
          6'h37: out_r[6] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[7] = 1'b0;
          6'h02: out_r[7] = 1'b0;
          6'h06: out_r[7] = 1'b0;
          6'h08: out_r[7] = 1'b0;
          6'h0a: out_r[7] = 1'b0;
          6'h0e: out_r[7] = 1'b0;
          6'h19: out_r[7] = 1'b0;
          6'h1a: out_r[7] = 1'b0;
          6'h1b: out_r[7] = 1'b0;
          6'h1c: out_r[7] = 1'b0;
          6'h1d: out_r[7] = 1'b0;
          6'h1e: out_r[7] = 1'b0;
          6'h1f: out_r[7] = 1'b0;
          6'h21: out_r[7] = 1'b0;
          6'h28: out_r[7] = 1'b0;
          6'h38: out_r[7] = 1'b0;
          6'h39: out_r[7] = 1'b0;
          6'h3a: out_r[7] = 1'b0;
          6'h3b: out_r[7] = 1'b0;
          6'h3c: out_r[7] = 1'b0;
          6'h3d: out_r[7] = 1'b0;
          6'h3e: out_r[7] = 1'b0;
          6'h3f: out_r[7] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[8] = 1'b1;
          6'h03: out_r[8] = 1'b1;
          6'h04: out_r[8] = 1'b1;
          6'h0c: out_r[8] = 1'b1;
          6'h10: out_r[8] = 1'b1;
          6'h11: out_r[8] = 1'b1;
          6'h14: out_r[8] = 1'b1;
          6'h18: out_r[8] = 1'b1;
          6'h1c: out_r[8] = 1'b1;
          6'h20: out_r[8] = 1'b1;
          6'h22: out_r[8] = 1'b1;
          6'h23: out_r[8] = 1'b1;
          6'h24: out_r[8] = 1'b1;
          6'h25: out_r[8] = 1'b1;
          6'h26: out_r[8] = 1'b1;
          6'h27: out_r[8] = 1'b1;
          6'h29: out_r[8] = 1'b1;
          6'h2a: out_r[8] = 1'b1;
          6'h2b: out_r[8] = 1'b1;
          6'h2c: out_r[8] = 1'b1;
          6'h2d: out_r[8] = 1'b1;
          6'h2e: out_r[8] = 1'b1;
          6'h2f: out_r[8] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[9] = 1'b0;
          6'h03: out_r[9] = 1'b0;
          6'h04: out_r[9] = 1'b0;
          6'h0c: out_r[9] = 1'b0;
          6'h10: out_r[9] = 1'b0;
          6'h11: out_r[9] = 1'b0;
          6'h14: out_r[9] = 1'b0;
          6'h1c: out_r[9] = 1'b0;
          6'h31: out_r[9] = 1'b0;
          6'h32: out_r[9] = 1'b0;
          6'h33: out_r[9] = 1'b0;
          6'h34: out_r[9] = 1'b0;
          6'h35: out_r[9] = 1'b0;
          6'h36: out_r[9] = 1'b0;
          6'h37: out_r[9] = 1'b0;
          6'h38: out_r[9] = 1'b0;
          6'h39: out_r[9] = 1'b0;
          6'h3a: out_r[9] = 1'b0;
          6'h3b: out_r[9] = 1'b0;
          6'h3c: out_r[9] = 1'b0;
          6'h3d: out_r[9] = 1'b0;
          6'h3e: out_r[9] = 1'b0;
          6'h3f: out_r[9] = 1'b0;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[10] = 1'b1;
          6'h01: out_r[10] = 1'b1;
          6'h05: out_r[10] = 1'b1;
          6'h06: out_r[10] = 1'b1;
          6'h07: out_r[10] = 1'b1;
          6'h08: out_r[10] = 1'b1;
          6'h09: out_r[10] = 1'b1;
          6'h0b: out_r[10] = 1'b1;
          6'h0d: out_r[10] = 1'b1;
          6'h0f: out_r[10] = 1'b1;
          6'h13: out_r[10] = 1'b1;
          6'h15: out_r[10] = 1'b1;
          6'h17: out_r[10] = 1'b1;
          6'h18: out_r[10] = 1'b1;
          6'h19: out_r[10] = 1'b1;
          6'h1b: out_r[10] = 1'b1;
          6'h1d: out_r[10] = 1'b1;
          6'h1f: out_r[10] = 1'b1;
          6'h20: out_r[10] = 1'b1;
          6'h22: out_r[10] = 1'b1;
          6'h28: out_r[10] = 1'b1;
          6'h30: out_r[10] = 1'b1;
          6'h38: out_r[10] = 1'b1;
          default: begin end
        endcase
        case (inner)
          6'h00: out_r[11] = 1'b0;
          6'h06: out_r[11] = 1'b0;
          6'h08: out_r[11] = 1'b0;
          6'h18: out_r[11] = 1'b0;
          6'h20: out_r[11] = 1'b0;
          6'h22: out_r[11] = 1'b0;
          6'h23: out_r[11] = 1'b0;
          6'h25: out_r[11] = 1'b0;
          6'h27: out_r[11] = 1'b0;
          6'h28: out_r[11] = 1'b0;
          6'h29: out_r[11] = 1'b0;
          6'h2b: out_r[11] = 1'b0;
          6'h2d: out_r[11] = 1'b0;
          6'h2f: out_r[11] = 1'b0;
          6'h31: out_r[11] = 1'b0;
          6'h33: out_r[11] = 1'b0;
          6'h35: out_r[11] = 1'b0;
          6'h37: out_r[11] = 1'b0;
          6'h38: out_r[11] = 1'b0;
          6'h39: out_r[11] = 1'b0;
          6'h3b: out_r[11] = 1'b0;
          6'h3d: out_r[11] = 1'b0;
          6'h3f: out_r[11] = 1'b0;
          default: begin end
        endcase
      end
      default: begin end
    endcase
  end
  assign out = out_r;
endmodule
