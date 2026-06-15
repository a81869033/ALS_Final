module ex221_varying_signexp_nested_low9_hi6(in, out);
  input [15:0] in;
  output [15:0] out;
  wire [5:0] sign_exp = in[15:10];
  wire [9:0] mant = in[9:0];
  reg [15:0] special_out;
  always @* begin
    special_out = 16'h0000;
    case (sign_exp)
      6'h00: special_out = 16'h3c00;
      6'h01: special_out = 16'h3c00;
      6'h02: special_out = 16'h3c00;
      6'h03: special_out = 16'h3c00;
      6'h05: special_out = 16'h3c01;
      6'h13: special_out = 16'h7c00;
      6'h14: special_out = 16'h7c00;
      6'h15: special_out = 16'h7c00;
      6'h16: special_out = 16'h7c00;
      6'h17: special_out = 16'h7c00;
      6'h18: special_out = 16'h7c00;
      6'h19: special_out = 16'h7c00;
      6'h1a: special_out = 16'h7c00;
      6'h1b: special_out = 16'h7c00;
      6'h1c: special_out = 16'h7c00;
      6'h1d: special_out = 16'h7c00;
      6'h1e: special_out = 16'h7c00;
      6'h20: special_out = 16'h3c00;
      6'h21: special_out = 16'h3c00;
      6'h22: special_out = 16'h3c00;
      6'h24: special_out = 16'h3bff;
      6'h33: special_out = 16'h0000;
      6'h34: special_out = 16'h0000;
      6'h35: special_out = 16'h0000;
      6'h36: special_out = 16'h0000;
      6'h37: special_out = 16'h0000;
      6'h38: special_out = 16'h0000;
      6'h39: special_out = 16'h0000;
      6'h3a: special_out = 16'h0000;
      6'h3b: special_out = 16'h0000;
      6'h3c: special_out = 16'h0000;
      6'h3d: special_out = 16'h0000;
      6'h3e: special_out = 16'h0000;
      default: special_out = 16'h0000;
    endcase
  end
  reg active_group;
  always @* begin
    active_group = 1'b0;
    case (sign_exp)
      6'h04: active_group = 1'b1;
      6'h06: active_group = 1'b1;
      6'h07: active_group = 1'b1;
      6'h08: active_group = 1'b1;
      6'h09: active_group = 1'b1;
      6'h0a: active_group = 1'b1;
      6'h0b: active_group = 1'b1;
      6'h0c: active_group = 1'b1;
      6'h0d: active_group = 1'b1;
      6'h0e: active_group = 1'b1;
      6'h0f: active_group = 1'b1;
      6'h10: active_group = 1'b1;
      6'h11: active_group = 1'b1;
      6'h12: active_group = 1'b1;
      6'h1f: active_group = 1'b1;
      6'h23: active_group = 1'b1;
      6'h25: active_group = 1'b1;
      6'h26: active_group = 1'b1;
      6'h27: active_group = 1'b1;
      6'h28: active_group = 1'b1;
      6'h29: active_group = 1'b1;
      6'h2a: active_group = 1'b1;
      6'h2b: active_group = 1'b1;
      6'h2c: active_group = 1'b1;
      6'h2d: active_group = 1'b1;
      6'h2e: active_group = 1'b1;
      6'h2f: active_group = 1'b1;
      6'h30: active_group = 1'b1;
      6'h31: active_group = 1'b1;
      6'h32: active_group = 1'b1;
      6'h3f: active_group = 1'b1;
      default: begin end
    endcase
  end
  reg [8:0] out_low;
  always @* begin
    out_low = 9'h000;
    case (sign_exp)
      6'h04: begin
        case (mant[9:4])
          6'h00: out_low = 9'h000;
          6'h01: out_low = 9'h000;
          6'h02: out_low = 9'h000;
          6'h03: out_low = 9'h000;
          6'h04: out_low = 9'h000;
          6'h05: out_low = 9'h000;
          6'h06: out_low = 9'h000;
          6'h07: out_low = 9'h000;
          6'h08: out_low = 9'h000;
          6'h09: out_low = 9'h000;
          6'h0a: out_low = 9'h000;
          6'h0b: out_low = 9'h000;
          6'h0c: out_low = 9'h000;
          6'h0d: out_low = 9'h000;
          6'h0e: out_low = 9'h000;
          6'h0f: out_low = 9'h000;
          6'h10: out_low = 9'h000;
          6'h11: out_low = 9'h000;
          6'h12: out_low = 9'h000;
          6'h13: out_low = 9'h000;
          6'h14: out_low = 9'h000;
          6'h15: out_low = 9'h000;
          6'h16: out_low = 9'h000;
          6'h17: out_low = 9'h000;
          6'h18: out_low = 9'h000;
          6'h19: out_low = 9'h000;
          6'h1a: out_low = 9'h000;
          6'h1b: out_low = 9'h000;
          6'h1c: begin
            case (mant[3:0])
              4'h0: out_low = 9'h000;
              4'h1: out_low = 9'h000;
              4'h2: out_low = 9'h000;
              4'h3: out_low = 9'h000;
              4'h4: out_low = 9'h000;
              4'h5: out_low = 9'h000;
              4'h6: out_low = 9'h001;
              4'h7: out_low = 9'h001;
              4'h8: out_low = 9'h001;
              4'h9: out_low = 9'h001;
              4'ha: out_low = 9'h001;
              4'hb: out_low = 9'h001;
              4'hc: out_low = 9'h001;
              4'hd: out_low = 9'h001;
              4'he: out_low = 9'h001;
              4'hf: out_low = 9'h001;
              default: out_low = 9'h000;
            endcase
          end
          6'h1d: out_low = 9'h001;
          6'h1e: out_low = 9'h001;
          6'h1f: out_low = 9'h001;
          6'h20: out_low = 9'h001;
          6'h21: out_low = 9'h001;
          6'h22: out_low = 9'h001;
          6'h23: out_low = 9'h001;
          6'h24: out_low = 9'h001;
          6'h25: out_low = 9'h001;
          6'h26: out_low = 9'h001;
          6'h27: out_low = 9'h001;
          6'h28: out_low = 9'h001;
          6'h29: out_low = 9'h001;
          6'h2a: out_low = 9'h001;
          6'h2b: out_low = 9'h001;
          6'h2c: out_low = 9'h001;
          6'h2d: out_low = 9'h001;
          6'h2e: out_low = 9'h001;
          6'h2f: out_low = 9'h001;
          6'h30: out_low = 9'h001;
          6'h31: out_low = 9'h001;
          6'h32: out_low = 9'h001;
          6'h33: out_low = 9'h001;
          6'h34: out_low = 9'h001;
          6'h35: out_low = 9'h001;
          6'h36: out_low = 9'h001;
          6'h37: out_low = 9'h001;
          6'h38: out_low = 9'h001;
          6'h39: out_low = 9'h001;
          6'h3a: out_low = 9'h001;
          6'h3b: out_low = 9'h001;
          6'h3c: out_low = 9'h001;
          6'h3d: out_low = 9'h001;
          6'h3e: out_low = 9'h001;
          6'h3f: out_low = 9'h001;
          default: out_low = 9'h000;
        endcase
      end
      6'h06: begin
        case (mant[9:4])
          6'h00: out_low = 9'h001;
          6'h01: out_low = 9'h001;
          6'h02: out_low = 9'h001;
          6'h03: out_low = 9'h001;
          6'h04: out_low = 9'h001;
          6'h05: begin
            case (mant[3:0])
              4'h0: out_low = 9'h001;
              4'h1: out_low = 9'h001;
              4'h2: out_low = 9'h001;
              4'h3: out_low = 9'h001;
              4'h4: out_low = 9'h002;
              4'h5: out_low = 9'h002;
              4'h6: out_low = 9'h002;
              4'h7: out_low = 9'h002;
              4'h8: out_low = 9'h002;
              4'h9: out_low = 9'h002;
              4'ha: out_low = 9'h002;
              4'hb: out_low = 9'h002;
              4'hc: out_low = 9'h002;
              4'hd: out_low = 9'h002;
              4'he: out_low = 9'h002;
              4'hf: out_low = 9'h002;
              default: out_low = 9'h000;
            endcase
          end
          6'h06: out_low = 9'h002;
          6'h07: out_low = 9'h002;
          6'h08: out_low = 9'h002;
          6'h09: out_low = 9'h002;
          6'h0a: out_low = 9'h002;
          6'h0b: out_low = 9'h002;
          6'h0c: out_low = 9'h002;
          6'h0d: out_low = 9'h002;
          6'h0e: out_low = 9'h002;
          6'h0f: out_low = 9'h002;
          6'h10: out_low = 9'h002;
          6'h11: out_low = 9'h002;
          6'h12: out_low = 9'h002;
          6'h13: out_low = 9'h002;
          6'h14: out_low = 9'h002;
          6'h15: out_low = 9'h002;
          6'h16: out_low = 9'h002;
          6'h17: out_low = 9'h002;
          6'h18: out_low = 9'h002;
          6'h19: out_low = 9'h002;
          6'h1a: out_low = 9'h002;
          6'h1b: out_low = 9'h002;
          6'h1c: out_low = 9'h002;
          6'h1d: out_low = 9'h002;
          6'h1e: out_low = 9'h002;
          6'h1f: out_low = 9'h002;
          6'h20: out_low = 9'h002;
          6'h21: out_low = 9'h002;
          6'h22: out_low = 9'h002;
          6'h23: out_low = 9'h002;
          6'h24: out_low = 9'h002;
          6'h25: out_low = 9'h002;
          6'h26: out_low = 9'h002;
          6'h27: out_low = 9'h002;
          6'h28: out_low = 9'h002;
          6'h29: out_low = 9'h002;
          6'h2a: out_low = 9'h002;
          6'h2b: out_low = 9'h002;
          6'h2c: out_low = 9'h002;
          6'h2d: out_low = 9'h002;
          6'h2e: out_low = 9'h002;
          6'h2f: out_low = 9'h002;
          6'h30: out_low = 9'h002;
          6'h31: out_low = 9'h002;
          6'h32: out_low = 9'h002;
          6'h33: begin
            case (mant[3:0])
              4'h0: out_low = 9'h002;
              4'h1: out_low = 9'h002;
              4'h2: out_low = 9'h002;
              4'h3: out_low = 9'h002;
              4'h4: out_low = 9'h002;
              4'h5: out_low = 9'h003;
              4'h6: out_low = 9'h003;
              4'h7: out_low = 9'h003;
              4'h8: out_low = 9'h003;
              4'h9: out_low = 9'h003;
              4'ha: out_low = 9'h003;
              4'hb: out_low = 9'h003;
              4'hc: out_low = 9'h003;
              4'hd: out_low = 9'h003;
              4'he: out_low = 9'h003;
              4'hf: out_low = 9'h003;
              default: out_low = 9'h000;
            endcase
          end
          6'h34: out_low = 9'h003;
          6'h35: out_low = 9'h003;
          6'h36: out_low = 9'h003;
          6'h37: out_low = 9'h003;
          6'h38: out_low = 9'h003;
          6'h39: out_low = 9'h003;
          6'h3a: out_low = 9'h003;
          6'h3b: out_low = 9'h003;
          6'h3c: out_low = 9'h003;
          6'h3d: out_low = 9'h003;
          6'h3e: out_low = 9'h003;
          6'h3f: out_low = 9'h003;
          default: out_low = 9'h000;
        endcase
      end
      6'h07: begin
        case (mant[9:4])
          6'h00: out_low = 9'h003;
          6'h01: out_low = 9'h003;
          6'h02: out_low = 9'h003;
          6'h03: out_low = 9'h003;
          6'h04: out_low = 9'h003;
          6'h05: out_low = 9'h003;
          6'h06: out_low = 9'h003;
          6'h07: out_low = 9'h003;
          6'h08: out_low = 9'h003;
          6'h09: out_low = 9'h003;
          6'h0a: out_low = 9'h003;
          6'h0b: out_low = 9'h003;
          6'h0c: out_low = 9'h003;
          6'h0d: out_low = 9'h003;
          6'h0e: out_low = 9'h003;
          6'h0f: out_low = 9'h003;
          6'h10: begin
            case (mant[3:0])
              4'h0: out_low = 9'h003;
              4'h1: out_low = 9'h003;
              4'h2: out_low = 9'h003;
              4'h3: out_low = 9'h003;
              4'h4: out_low = 9'h003;
              4'h5: out_low = 9'h003;
              4'h6: out_low = 9'h003;
              4'h7: out_low = 9'h003;
              4'h8: out_low = 9'h003;
              4'h9: out_low = 9'h003;
              4'ha: out_low = 9'h003;
              4'hb: out_low = 9'h004;
              4'hc: out_low = 9'h004;
              4'hd: out_low = 9'h004;
              4'he: out_low = 9'h004;
              4'hf: out_low = 9'h004;
              default: out_low = 9'h000;
            endcase
          end
          6'h11: out_low = 9'h004;
          6'h12: out_low = 9'h004;
          6'h13: out_low = 9'h004;
          6'h14: out_low = 9'h004;
          6'h15: out_low = 9'h004;
          6'h16: out_low = 9'h004;
          6'h17: out_low = 9'h004;
          6'h18: out_low = 9'h004;
          6'h19: out_low = 9'h004;
          6'h1a: out_low = 9'h004;
          6'h1b: out_low = 9'h004;
          6'h1c: out_low = 9'h004;
          6'h1d: out_low = 9'h004;
          6'h1e: out_low = 9'h004;
          6'h1f: out_low = 9'h004;
          6'h20: out_low = 9'h004;
          6'h21: out_low = 9'h004;
          6'h22: out_low = 9'h004;
          6'h23: out_low = 9'h004;
          6'h24: out_low = 9'h004;
          6'h25: out_low = 9'h004;
          6'h26: out_low = 9'h004;
          6'h27: begin
            case (mant[3:0])
              4'h0: out_low = 9'h004;
              4'h1: out_low = 9'h004;
              4'h2: out_low = 9'h004;
              4'h3: out_low = 9'h004;
              4'h4: out_low = 9'h004;
              4'h5: out_low = 9'h004;
              4'h6: out_low = 9'h004;
              4'h7: out_low = 9'h004;
              4'h8: out_low = 9'h004;
              4'h9: out_low = 9'h004;
              4'ha: out_low = 9'h004;
              4'hb: out_low = 9'h005;
              4'hc: out_low = 9'h005;
              4'hd: out_low = 9'h005;
              4'he: out_low = 9'h005;
              4'hf: out_low = 9'h005;
              default: out_low = 9'h000;
            endcase
          end
          6'h28: out_low = 9'h005;
          6'h29: out_low = 9'h005;
          6'h2a: out_low = 9'h005;
          6'h2b: out_low = 9'h005;
          6'h2c: out_low = 9'h005;
          6'h2d: out_low = 9'h005;
          6'h2e: out_low = 9'h005;
          6'h2f: out_low = 9'h005;
          6'h30: out_low = 9'h005;
          6'h31: out_low = 9'h005;
          6'h32: out_low = 9'h005;
          6'h33: out_low = 9'h005;
          6'h34: out_low = 9'h005;
          6'h35: out_low = 9'h005;
          6'h36: out_low = 9'h005;
          6'h37: out_low = 9'h005;
          6'h38: out_low = 9'h005;
          6'h39: out_low = 9'h005;
          6'h3a: out_low = 9'h005;
          6'h3b: out_low = 9'h005;
          6'h3c: out_low = 9'h005;
          6'h3d: out_low = 9'h005;
          6'h3e: begin
            case (mant[3:0])
              4'h0: out_low = 9'h005;
              4'h1: out_low = 9'h005;
              4'h2: out_low = 9'h005;
              4'h3: out_low = 9'h005;
              4'h4: out_low = 9'h005;
              4'h5: out_low = 9'h005;
              4'h6: out_low = 9'h005;
              4'h7: out_low = 9'h005;
              4'h8: out_low = 9'h005;
              4'h9: out_low = 9'h005;
              4'ha: out_low = 9'h006;
              4'hb: out_low = 9'h006;
              4'hc: out_low = 9'h006;
              4'hd: out_low = 9'h006;
              4'he: out_low = 9'h006;
              4'hf: out_low = 9'h006;
              default: out_low = 9'h000;
            endcase
          end
          6'h3f: out_low = 9'h006;
          default: out_low = 9'h000;
        endcase
      end
      6'h08: begin
        case (mant[9:4])
          6'h00: out_low = 9'h006;
          6'h01: out_low = 9'h006;
          6'h02: out_low = 9'h006;
          6'h03: out_low = 9'h006;
          6'h04: out_low = 9'h006;
          6'h05: out_low = 9'h006;
          6'h06: out_low = 9'h006;
          6'h07: out_low = 9'h006;
          6'h08: out_low = 9'h006;
          6'h09: out_low = 9'h006;
          6'h0a: begin
            case (mant[3:0])
              4'h0: out_low = 9'h006;
              4'h1: out_low = 9'h006;
              4'h2: out_low = 9'h006;
              4'h3: out_low = 9'h006;
              4'h4: out_low = 9'h006;
              4'h5: out_low = 9'h006;
              4'h6: out_low = 9'h006;
              4'h7: out_low = 9'h006;
              4'h8: out_low = 9'h006;
              4'h9: out_low = 9'h006;
              4'ha: out_low = 9'h006;
              4'hb: out_low = 9'h006;
              4'hc: out_low = 9'h006;
              4'hd: out_low = 9'h007;
              4'he: out_low = 9'h007;
              4'hf: out_low = 9'h007;
              default: out_low = 9'h000;
            endcase
          end
          6'h0b: out_low = 9'h007;
          6'h0c: out_low = 9'h007;
          6'h0d: out_low = 9'h007;
          6'h0e: out_low = 9'h007;
          6'h0f: out_low = 9'h007;
          6'h10: out_low = 9'h007;
          6'h11: out_low = 9'h007;
          6'h12: out_low = 9'h007;
          6'h13: out_low = 9'h007;
          6'h14: out_low = 9'h007;
          6'h15: out_low = 9'h007;
          6'h16: begin
            case (mant[3:0])
              4'h0: out_low = 9'h007;
              4'h1: out_low = 9'h007;
              4'h2: out_low = 9'h007;
              4'h3: out_low = 9'h007;
              4'h4: out_low = 9'h008;
              4'h5: out_low = 9'h008;
              4'h6: out_low = 9'h008;
              4'h7: out_low = 9'h008;
              4'h8: out_low = 9'h008;
              4'h9: out_low = 9'h008;
              4'ha: out_low = 9'h008;
              4'hb: out_low = 9'h008;
              4'hc: out_low = 9'h008;
              4'hd: out_low = 9'h008;
              4'he: out_low = 9'h008;
              4'hf: out_low = 9'h008;
              default: out_low = 9'h000;
            endcase
          end
          6'h17: out_low = 9'h008;
          6'h18: out_low = 9'h008;
          6'h19: out_low = 9'h008;
          6'h1a: out_low = 9'h008;
          6'h1b: out_low = 9'h008;
          6'h1c: out_low = 9'h008;
          6'h1d: out_low = 9'h008;
          6'h1e: out_low = 9'h008;
          6'h1f: out_low = 9'h008;
          6'h20: out_low = 9'h008;
          6'h21: begin
            case (mant[3:0])
              4'h0: out_low = 9'h008;
              4'h1: out_low = 9'h008;
              4'h2: out_low = 9'h008;
              4'h3: out_low = 9'h008;
              4'h4: out_low = 9'h008;
              4'h5: out_low = 9'h008;
              4'h6: out_low = 9'h008;
              4'h7: out_low = 9'h008;
              4'h8: out_low = 9'h008;
              4'h9: out_low = 9'h008;
              4'ha: out_low = 9'h008;
              4'hb: out_low = 9'h008;
              4'hc: out_low = 9'h009;
              4'hd: out_low = 9'h009;
              4'he: out_low = 9'h009;
              4'hf: out_low = 9'h009;
              default: out_low = 9'h000;
            endcase
          end
          6'h22: out_low = 9'h009;
          6'h23: out_low = 9'h009;
          6'h24: out_low = 9'h009;
          6'h25: out_low = 9'h009;
          6'h26: out_low = 9'h009;
          6'h27: out_low = 9'h009;
          6'h28: out_low = 9'h009;
          6'h29: out_low = 9'h009;
          6'h2a: out_low = 9'h009;
          6'h2b: out_low = 9'h009;
          6'h2c: out_low = 9'h009;
          6'h2d: begin
            case (mant[3:0])
              4'h0: out_low = 9'h009;
              4'h1: out_low = 9'h009;
              4'h2: out_low = 9'h009;
              4'h3: out_low = 9'h00a;
              4'h4: out_low = 9'h00a;
              4'h5: out_low = 9'h00a;
              4'h6: out_low = 9'h00a;
              4'h7: out_low = 9'h00a;
              4'h8: out_low = 9'h00a;
              4'h9: out_low = 9'h00a;
              4'ha: out_low = 9'h00a;
              4'hb: out_low = 9'h00a;
              4'hc: out_low = 9'h00a;
              4'hd: out_low = 9'h00a;
              4'he: out_low = 9'h00a;
              4'hf: out_low = 9'h00a;
              default: out_low = 9'h000;
            endcase
          end
          6'h2e: out_low = 9'h00a;
          6'h2f: out_low = 9'h00a;
          6'h30: out_low = 9'h00a;
          6'h31: out_low = 9'h00a;
          6'h32: out_low = 9'h00a;
          6'h33: out_low = 9'h00a;
          6'h34: out_low = 9'h00a;
          6'h35: out_low = 9'h00a;
          6'h36: out_low = 9'h00a;
          6'h37: out_low = 9'h00a;
          6'h38: begin
            case (mant[3:0])
              4'h0: out_low = 9'h00a;
              4'h1: out_low = 9'h00a;
              4'h2: out_low = 9'h00a;
              4'h3: out_low = 9'h00a;
              4'h4: out_low = 9'h00a;
              4'h5: out_low = 9'h00a;
              4'h6: out_low = 9'h00a;
              4'h7: out_low = 9'h00a;
              4'h8: out_low = 9'h00a;
              4'h9: out_low = 9'h00a;
              4'ha: out_low = 9'h00b;
              4'hb: out_low = 9'h00b;
              4'hc: out_low = 9'h00b;
              4'hd: out_low = 9'h00b;
              4'he: out_low = 9'h00b;
              4'hf: out_low = 9'h00b;
              default: out_low = 9'h000;
            endcase
          end
          6'h39: out_low = 9'h00b;
          6'h3a: out_low = 9'h00b;
          6'h3b: out_low = 9'h00b;
          6'h3c: out_low = 9'h00b;
          6'h3d: out_low = 9'h00b;
          6'h3e: out_low = 9'h00b;
          6'h3f: out_low = 9'h00b;
          default: out_low = 9'h000;
        endcase
      end
      6'h09: begin
        case (mant[9:4])
          6'h00: out_low = 9'h00b;
          6'h01: out_low = 9'h00b;
          6'h02: out_low = 9'h00c;
          6'h03: out_low = 9'h00c;
          6'h04: out_low = 9'h00c;
          6'h05: out_low = 9'h00c;
          6'h06: out_low = 9'h00c;
          6'h07: begin
            case (mant[3:0])
              4'h0: out_low = 9'h00c;
              4'h1: out_low = 9'h00c;
              4'h2: out_low = 9'h00c;
              4'h3: out_low = 9'h00c;
              4'h4: out_low = 9'h00c;
              4'h5: out_low = 9'h00c;
              4'h6: out_low = 9'h00c;
              4'h7: out_low = 9'h00c;
              4'h8: out_low = 9'h00c;
              4'h9: out_low = 9'h00c;
              4'ha: out_low = 9'h00c;
              4'hb: out_low = 9'h00c;
              4'hc: out_low = 9'h00d;
              4'hd: out_low = 9'h00d;
              4'he: out_low = 9'h00d;
              4'hf: out_low = 9'h00d;
              default: out_low = 9'h000;
            endcase
          end
          6'h08: out_low = 9'h00d;
          6'h09: out_low = 9'h00d;
          6'h0a: out_low = 9'h00d;
          6'h0b: out_low = 9'h00d;
          6'h0c: out_low = 9'h00d;
          6'h0d: begin
            case (mant[3:0])
              4'h0: out_low = 9'h00d;
              4'h1: out_low = 9'h00d;
              4'h2: out_low = 9'h00d;
              4'h3: out_low = 9'h00d;
              4'h4: out_low = 9'h00d;
              4'h5: out_low = 9'h00d;
              4'h6: out_low = 9'h00d;
              4'h7: out_low = 9'h00e;
              4'h8: out_low = 9'h00e;
              4'h9: out_low = 9'h00e;
              4'ha: out_low = 9'h00e;
              4'hb: out_low = 9'h00e;
              4'hc: out_low = 9'h00e;
              4'hd: out_low = 9'h00e;
              4'he: out_low = 9'h00e;
              4'hf: out_low = 9'h00e;
              default: out_low = 9'h000;
            endcase
          end
          6'h0e: out_low = 9'h00e;
          6'h0f: out_low = 9'h00e;
          6'h10: out_low = 9'h00e;
          6'h11: out_low = 9'h00e;
          6'h12: out_low = 9'h00e;
          6'h13: begin
            case (mant[3:0])
              4'h0: out_low = 9'h00e;
              4'h1: out_low = 9'h00e;
              4'h2: out_low = 9'h00f;
              4'h3: out_low = 9'h00f;
              4'h4: out_low = 9'h00f;
              4'h5: out_low = 9'h00f;
              4'h6: out_low = 9'h00f;
              4'h7: out_low = 9'h00f;
              4'h8: out_low = 9'h00f;
              4'h9: out_low = 9'h00f;
              4'ha: out_low = 9'h00f;
              4'hb: out_low = 9'h00f;
              4'hc: out_low = 9'h00f;
              4'hd: out_low = 9'h00f;
              4'he: out_low = 9'h00f;
              4'hf: out_low = 9'h00f;
              default: out_low = 9'h000;
            endcase
          end
          6'h14: out_low = 9'h00f;
          6'h15: out_low = 9'h00f;
          6'h16: out_low = 9'h00f;
          6'h17: out_low = 9'h00f;
          6'h18: begin
            case (mant[3:0])
              4'h0: out_low = 9'h00f;
              4'h1: out_low = 9'h00f;
              4'h2: out_low = 9'h00f;
              4'h3: out_low = 9'h00f;
              4'h4: out_low = 9'h00f;
              4'h5: out_low = 9'h00f;
              4'h6: out_low = 9'h00f;
              4'h7: out_low = 9'h00f;
              4'h8: out_low = 9'h00f;
              4'h9: out_low = 9'h00f;
              4'ha: out_low = 9'h00f;
              4'hb: out_low = 9'h00f;
              4'hc: out_low = 9'h00f;
              4'hd: out_low = 9'h010;
              4'he: out_low = 9'h010;
              4'hf: out_low = 9'h010;
              default: out_low = 9'h000;
            endcase
          end
          6'h19: out_low = 9'h010;
          6'h1a: out_low = 9'h010;
          6'h1b: out_low = 9'h010;
          6'h1c: out_low = 9'h010;
          6'h1d: out_low = 9'h010;
          6'h1e: begin
            case (mant[3:0])
              4'h0: out_low = 9'h010;
              4'h1: out_low = 9'h010;
              4'h2: out_low = 9'h010;
              4'h3: out_low = 9'h010;
              4'h4: out_low = 9'h010;
              4'h5: out_low = 9'h010;
              4'h6: out_low = 9'h010;
              4'h7: out_low = 9'h010;
              4'h8: out_low = 9'h011;
              4'h9: out_low = 9'h011;
              4'ha: out_low = 9'h011;
              4'hb: out_low = 9'h011;
              4'hc: out_low = 9'h011;
              4'hd: out_low = 9'h011;
              4'he: out_low = 9'h011;
              4'hf: out_low = 9'h011;
              default: out_low = 9'h000;
            endcase
          end
          6'h1f: out_low = 9'h011;
          6'h20: out_low = 9'h011;
          6'h21: out_low = 9'h011;
          6'h22: out_low = 9'h011;
          6'h23: out_low = 9'h011;
          6'h24: begin
            case (mant[3:0])
              4'h0: out_low = 9'h011;
              4'h1: out_low = 9'h011;
              4'h2: out_low = 9'h011;
              4'h3: out_low = 9'h012;
              4'h4: out_low = 9'h012;
              4'h5: out_low = 9'h012;
              4'h6: out_low = 9'h012;
              4'h7: out_low = 9'h012;
              4'h8: out_low = 9'h012;
              4'h9: out_low = 9'h012;
              4'ha: out_low = 9'h012;
              4'hb: out_low = 9'h012;
              4'hc: out_low = 9'h012;
              4'hd: out_low = 9'h012;
              4'he: out_low = 9'h012;
              4'hf: out_low = 9'h012;
              default: out_low = 9'h000;
            endcase
          end
          6'h25: out_low = 9'h012;
          6'h26: out_low = 9'h012;
          6'h27: out_low = 9'h012;
          6'h28: out_low = 9'h012;
          6'h29: begin
            case (mant[3:0])
              4'h0: out_low = 9'h012;
              4'h1: out_low = 9'h012;
              4'h2: out_low = 9'h012;
              4'h3: out_low = 9'h012;
              4'h4: out_low = 9'h012;
              4'h5: out_low = 9'h012;
              4'h6: out_low = 9'h012;
              4'h7: out_low = 9'h012;
              4'h8: out_low = 9'h012;
              4'h9: out_low = 9'h012;
              4'ha: out_low = 9'h012;
              4'hb: out_low = 9'h012;
              4'hc: out_low = 9'h012;
              4'hd: out_low = 9'h013;
              4'he: out_low = 9'h013;
              4'hf: out_low = 9'h013;
              default: out_low = 9'h000;
            endcase
          end
          6'h2a: out_low = 9'h013;
          6'h2b: out_low = 9'h013;
          6'h2c: out_low = 9'h013;
          6'h2d: out_low = 9'h013;
          6'h2e: out_low = 9'h013;
          6'h2f: begin
            case (mant[3:0])
              4'h0: out_low = 9'h013;
              4'h1: out_low = 9'h013;
              4'h2: out_low = 9'h013;
              4'h3: out_low = 9'h013;
              4'h4: out_low = 9'h013;
              4'h5: out_low = 9'h013;
              4'h6: out_low = 9'h013;
              4'h7: out_low = 9'h013;
              4'h8: out_low = 9'h014;
              4'h9: out_low = 9'h014;
              4'ha: out_low = 9'h014;
              4'hb: out_low = 9'h014;
              4'hc: out_low = 9'h014;
              4'hd: out_low = 9'h014;
              4'he: out_low = 9'h014;
              4'hf: out_low = 9'h014;
              default: out_low = 9'h000;
            endcase
          end
          6'h30: out_low = 9'h014;
          6'h31: out_low = 9'h014;
          6'h32: out_low = 9'h014;
          6'h33: out_low = 9'h014;
          6'h34: out_low = 9'h014;
          6'h35: begin
            case (mant[3:0])
              4'h0: out_low = 9'h014;
              4'h1: out_low = 9'h014;
              4'h2: out_low = 9'h014;
              4'h3: out_low = 9'h015;
              4'h4: out_low = 9'h015;
              4'h5: out_low = 9'h015;
              4'h6: out_low = 9'h015;
              4'h7: out_low = 9'h015;
              4'h8: out_low = 9'h015;
              4'h9: out_low = 9'h015;
              4'ha: out_low = 9'h015;
              4'hb: out_low = 9'h015;
              4'hc: out_low = 9'h015;
              4'hd: out_low = 9'h015;
              4'he: out_low = 9'h015;
              4'hf: out_low = 9'h015;
              default: out_low = 9'h000;
            endcase
          end
          6'h36: out_low = 9'h015;
          6'h37: out_low = 9'h015;
          6'h38: out_low = 9'h015;
          6'h39: out_low = 9'h015;
          6'h3a: begin
            case (mant[3:0])
              4'h0: out_low = 9'h015;
              4'h1: out_low = 9'h015;
              4'h2: out_low = 9'h015;
              4'h3: out_low = 9'h015;
              4'h4: out_low = 9'h015;
              4'h5: out_low = 9'h015;
              4'h6: out_low = 9'h015;
              4'h7: out_low = 9'h015;
              4'h8: out_low = 9'h015;
              4'h9: out_low = 9'h015;
              4'ha: out_low = 9'h015;
              4'hb: out_low = 9'h015;
              4'hc: out_low = 9'h015;
              4'hd: out_low = 9'h016;
              4'he: out_low = 9'h016;
              4'hf: out_low = 9'h016;
              default: out_low = 9'h000;
            endcase
          end
          6'h3b: out_low = 9'h016;
          6'h3c: out_low = 9'h016;
          6'h3d: out_low = 9'h016;
          6'h3e: out_low = 9'h016;
          6'h3f: out_low = 9'h016;
          default: out_low = 9'h000;
        endcase
      end
      6'h0a: begin
        case (mant[9:4])
          6'h00: begin
            case (mant[3:0])
              4'h0: out_low = 9'h016;
              4'h1: out_low = 9'h016;
              4'h2: out_low = 9'h016;
              4'h3: out_low = 9'h016;
              4'h4: out_low = 9'h017;
              4'h5: out_low = 9'h017;
              4'h6: out_low = 9'h017;
              4'h7: out_low = 9'h017;
              4'h8: out_low = 9'h017;
              4'h9: out_low = 9'h017;
              4'ha: out_low = 9'h017;
              4'hb: out_low = 9'h017;
              4'hc: out_low = 9'h017;
              4'hd: out_low = 9'h017;
              4'he: out_low = 9'h017;
              4'hf: out_low = 9'h017;
              default: out_low = 9'h000;
            endcase
          end
          6'h01: out_low = 9'h017;
          6'h02: out_low = 9'h017;
          6'h03: begin
            case (mant[3:0])
              4'h0: out_low = 9'h017;
              4'h1: out_low = 9'h018;
              4'h2: out_low = 9'h018;
              4'h3: out_low = 9'h018;
              4'h4: out_low = 9'h018;
              4'h5: out_low = 9'h018;
              4'h6: out_low = 9'h018;
              4'h7: out_low = 9'h018;
              4'h8: out_low = 9'h018;
              4'h9: out_low = 9'h018;
              4'ha: out_low = 9'h018;
              4'hb: out_low = 9'h018;
              4'hc: out_low = 9'h018;
              4'hd: out_low = 9'h018;
              4'he: out_low = 9'h018;
              4'hf: out_low = 9'h018;
              default: out_low = 9'h000;
            endcase
          end
          6'h04: out_low = 9'h018;
          6'h05: begin
            case (mant[3:0])
              4'h0: out_low = 9'h018;
              4'h1: out_low = 9'h018;
              4'h2: out_low = 9'h018;
              4'h3: out_low = 9'h018;
              4'h4: out_low = 9'h018;
              4'h5: out_low = 9'h018;
              4'h6: out_low = 9'h018;
              4'h7: out_low = 9'h018;
              4'h8: out_low = 9'h018;
              4'h9: out_low = 9'h018;
              4'ha: out_low = 9'h018;
              4'hb: out_low = 9'h018;
              4'hc: out_low = 9'h018;
              4'hd: out_low = 9'h018;
              4'he: out_low = 9'h019;
              4'hf: out_low = 9'h019;
              default: out_low = 9'h000;
            endcase
          end
          6'h06: out_low = 9'h019;
          6'h07: out_low = 9'h019;
          6'h08: begin
            case (mant[3:0])
              4'h0: out_low = 9'h019;
              4'h1: out_low = 9'h019;
              4'h2: out_low = 9'h019;
              4'h3: out_low = 9'h019;
              4'h4: out_low = 9'h019;
              4'h5: out_low = 9'h019;
              4'h6: out_low = 9'h019;
              4'h7: out_low = 9'h019;
              4'h8: out_low = 9'h019;
              4'h9: out_low = 9'h019;
              4'ha: out_low = 9'h019;
              4'hb: out_low = 9'h01a;
              4'hc: out_low = 9'h01a;
              4'hd: out_low = 9'h01a;
              4'he: out_low = 9'h01a;
              4'hf: out_low = 9'h01a;
              default: out_low = 9'h000;
            endcase
          end
          6'h09: out_low = 9'h01a;
          6'h0a: out_low = 9'h01a;
          6'h0b: begin
            case (mant[3:0])
              4'h0: out_low = 9'h01a;
              4'h1: out_low = 9'h01a;
              4'h2: out_low = 9'h01a;
              4'h3: out_low = 9'h01a;
              4'h4: out_low = 9'h01a;
              4'h5: out_low = 9'h01a;
              4'h6: out_low = 9'h01a;
              4'h7: out_low = 9'h01a;
              4'h8: out_low = 9'h01b;
              4'h9: out_low = 9'h01b;
              4'ha: out_low = 9'h01b;
              4'hb: out_low = 9'h01b;
              4'hc: out_low = 9'h01b;
              4'hd: out_low = 9'h01b;
              4'he: out_low = 9'h01b;
              4'hf: out_low = 9'h01b;
              default: out_low = 9'h000;
            endcase
          end
          6'h0c: out_low = 9'h01b;
          6'h0d: out_low = 9'h01b;
          6'h0e: begin
            case (mant[3:0])
              4'h0: out_low = 9'h01b;
              4'h1: out_low = 9'h01b;
              4'h2: out_low = 9'h01b;
              4'h3: out_low = 9'h01b;
              4'h4: out_low = 9'h01b;
              4'h5: out_low = 9'h01c;
              4'h6: out_low = 9'h01c;
              4'h7: out_low = 9'h01c;
              4'h8: out_low = 9'h01c;
              4'h9: out_low = 9'h01c;
              4'ha: out_low = 9'h01c;
              4'hb: out_low = 9'h01c;
              4'hc: out_low = 9'h01c;
              4'hd: out_low = 9'h01c;
              4'he: out_low = 9'h01c;
              4'hf: out_low = 9'h01c;
              default: out_low = 9'h000;
            endcase
          end
          6'h0f: out_low = 9'h01c;
          6'h10: out_low = 9'h01c;
          6'h11: begin
            case (mant[3:0])
              4'h0: out_low = 9'h01c;
              4'h1: out_low = 9'h01c;
              4'h2: out_low = 9'h01d;
              4'h3: out_low = 9'h01d;
              4'h4: out_low = 9'h01d;
              4'h5: out_low = 9'h01d;
              4'h6: out_low = 9'h01d;
              4'h7: out_low = 9'h01d;
              4'h8: out_low = 9'h01d;
              4'h9: out_low = 9'h01d;
              4'ha: out_low = 9'h01d;
              4'hb: out_low = 9'h01d;
              4'hc: out_low = 9'h01d;
              4'hd: out_low = 9'h01d;
              4'he: out_low = 9'h01d;
              4'hf: out_low = 9'h01d;
              default: out_low = 9'h000;
            endcase
          end
          6'h12: out_low = 9'h01d;
          6'h13: begin
            case (mant[3:0])
              4'h0: out_low = 9'h01d;
              4'h1: out_low = 9'h01d;
              4'h2: out_low = 9'h01d;
              4'h3: out_low = 9'h01d;
              4'h4: out_low = 9'h01d;
              4'h5: out_low = 9'h01d;
              4'h6: out_low = 9'h01d;
              4'h7: out_low = 9'h01d;
              4'h8: out_low = 9'h01d;
              4'h9: out_low = 9'h01d;
              4'ha: out_low = 9'h01d;
              4'hb: out_low = 9'h01d;
              4'hc: out_low = 9'h01d;
              4'hd: out_low = 9'h01d;
              4'he: out_low = 9'h01d;
              4'hf: out_low = 9'h01e;
              default: out_low = 9'h000;
            endcase
          end
          6'h14: out_low = 9'h01e;
          6'h15: out_low = 9'h01e;
          6'h16: begin
            case (mant[3:0])
              4'h0: out_low = 9'h01e;
              4'h1: out_low = 9'h01e;
              4'h2: out_low = 9'h01e;
              4'h3: out_low = 9'h01e;
              4'h4: out_low = 9'h01e;
              4'h5: out_low = 9'h01e;
              4'h6: out_low = 9'h01e;
              4'h7: out_low = 9'h01e;
              4'h8: out_low = 9'h01e;
              4'h9: out_low = 9'h01e;
              4'ha: out_low = 9'h01e;
              4'hb: out_low = 9'h01e;
              4'hc: out_low = 9'h01f;
              4'hd: out_low = 9'h01f;
              4'he: out_low = 9'h01f;
              4'hf: out_low = 9'h01f;
              default: out_low = 9'h000;
            endcase
          end
          6'h17: out_low = 9'h01f;
          6'h18: out_low = 9'h01f;
          6'h19: begin
            case (mant[3:0])
              4'h0: out_low = 9'h01f;
              4'h1: out_low = 9'h01f;
              4'h2: out_low = 9'h01f;
              4'h3: out_low = 9'h01f;
              4'h4: out_low = 9'h01f;
              4'h5: out_low = 9'h01f;
              4'h6: out_low = 9'h01f;
              4'h7: out_low = 9'h01f;
              4'h8: out_low = 9'h01f;
              4'h9: out_low = 9'h020;
              4'ha: out_low = 9'h020;
              4'hb: out_low = 9'h020;
              4'hc: out_low = 9'h020;
              4'hd: out_low = 9'h020;
              4'he: out_low = 9'h020;
              4'hf: out_low = 9'h020;
              default: out_low = 9'h000;
            endcase
          end
          6'h1a: out_low = 9'h020;
          6'h1b: out_low = 9'h020;
          6'h1c: begin
            case (mant[3:0])
              4'h0: out_low = 9'h020;
              4'h1: out_low = 9'h020;
              4'h2: out_low = 9'h020;
              4'h3: out_low = 9'h020;
              4'h4: out_low = 9'h020;
              4'h5: out_low = 9'h020;
              4'h6: out_low = 9'h021;
              4'h7: out_low = 9'h021;
              4'h8: out_low = 9'h021;
              4'h9: out_low = 9'h021;
              4'ha: out_low = 9'h021;
              4'hb: out_low = 9'h021;
              4'hc: out_low = 9'h021;
              4'hd: out_low = 9'h021;
              4'he: out_low = 9'h021;
              4'hf: out_low = 9'h021;
              default: out_low = 9'h000;
            endcase
          end
          6'h1d: out_low = 9'h021;
          6'h1e: out_low = 9'h021;
          6'h1f: begin
            case (mant[3:0])
              4'h0: out_low = 9'h021;
              4'h1: out_low = 9'h021;
              4'h2: out_low = 9'h022;
              4'h3: out_low = 9'h022;
              4'h4: out_low = 9'h022;
              4'h5: out_low = 9'h022;
              4'h6: out_low = 9'h022;
              4'h7: out_low = 9'h022;
              4'h8: out_low = 9'h022;
              4'h9: out_low = 9'h022;
              4'ha: out_low = 9'h022;
              4'hb: out_low = 9'h022;
              4'hc: out_low = 9'h022;
              4'hd: out_low = 9'h022;
              4'he: out_low = 9'h022;
              4'hf: out_low = 9'h022;
              default: out_low = 9'h000;
            endcase
          end
          6'h20: out_low = 9'h022;
          6'h21: begin
            case (mant[3:0])
              4'h0: out_low = 9'h022;
              4'h1: out_low = 9'h022;
              4'h2: out_low = 9'h022;
              4'h3: out_low = 9'h022;
              4'h4: out_low = 9'h022;
              4'h5: out_low = 9'h022;
              4'h6: out_low = 9'h022;
              4'h7: out_low = 9'h022;
              4'h8: out_low = 9'h022;
              4'h9: out_low = 9'h022;
              4'ha: out_low = 9'h022;
              4'hb: out_low = 9'h022;
              4'hc: out_low = 9'h022;
              4'hd: out_low = 9'h022;
              4'he: out_low = 9'h022;
              4'hf: out_low = 9'h023;
              default: out_low = 9'h000;
            endcase
          end
          6'h22: out_low = 9'h023;
          6'h23: out_low = 9'h023;
          6'h24: begin
            case (mant[3:0])
              4'h0: out_low = 9'h023;
              4'h1: out_low = 9'h023;
              4'h2: out_low = 9'h023;
              4'h3: out_low = 9'h023;
              4'h4: out_low = 9'h023;
              4'h5: out_low = 9'h023;
              4'h6: out_low = 9'h023;
              4'h7: out_low = 9'h023;
              4'h8: out_low = 9'h023;
              4'h9: out_low = 9'h023;
              4'ha: out_low = 9'h023;
              4'hb: out_low = 9'h023;
              4'hc: out_low = 9'h024;
              4'hd: out_low = 9'h024;
              4'he: out_low = 9'h024;
              4'hf: out_low = 9'h024;
              default: out_low = 9'h000;
            endcase
          end
          6'h25: out_low = 9'h024;
          6'h26: out_low = 9'h024;
          6'h27: begin
            case (mant[3:0])
              4'h0: out_low = 9'h024;
              4'h1: out_low = 9'h024;
              4'h2: out_low = 9'h024;
              4'h3: out_low = 9'h024;
              4'h4: out_low = 9'h024;
              4'h5: out_low = 9'h024;
              4'h6: out_low = 9'h024;
              4'h7: out_low = 9'h024;
              4'h8: out_low = 9'h025;
              4'h9: out_low = 9'h025;
              4'ha: out_low = 9'h025;
              4'hb: out_low = 9'h025;
              4'hc: out_low = 9'h025;
              4'hd: out_low = 9'h025;
              4'he: out_low = 9'h025;
              4'hf: out_low = 9'h025;
              default: out_low = 9'h000;
            endcase
          end
          6'h28: out_low = 9'h025;
          6'h29: out_low = 9'h025;
          6'h2a: begin
            case (mant[3:0])
              4'h0: out_low = 9'h025;
              4'h1: out_low = 9'h025;
              4'h2: out_low = 9'h025;
              4'h3: out_low = 9'h025;
              4'h4: out_low = 9'h025;
              4'h5: out_low = 9'h026;
              4'h6: out_low = 9'h026;
              4'h7: out_low = 9'h026;
              4'h8: out_low = 9'h026;
              4'h9: out_low = 9'h026;
              4'ha: out_low = 9'h026;
              4'hb: out_low = 9'h026;
              4'hc: out_low = 9'h026;
              4'hd: out_low = 9'h026;
              4'he: out_low = 9'h026;
              4'hf: out_low = 9'h026;
              default: out_low = 9'h000;
            endcase
          end
          6'h2b: out_low = 9'h026;
          6'h2c: out_low = 9'h026;
          6'h2d: begin
            case (mant[3:0])
              4'h0: out_low = 9'h026;
              4'h1: out_low = 9'h027;
              4'h2: out_low = 9'h027;
              4'h3: out_low = 9'h027;
              4'h4: out_low = 9'h027;
              4'h5: out_low = 9'h027;
              4'h6: out_low = 9'h027;
              4'h7: out_low = 9'h027;
              4'h8: out_low = 9'h027;
              4'h9: out_low = 9'h027;
              4'ha: out_low = 9'h027;
              4'hb: out_low = 9'h027;
              4'hc: out_low = 9'h027;
              4'hd: out_low = 9'h027;
              4'he: out_low = 9'h027;
              4'hf: out_low = 9'h027;
              default: out_low = 9'h000;
            endcase
          end
          6'h2e: out_low = 9'h027;
          6'h2f: begin
            case (mant[3:0])
              4'h0: out_low = 9'h027;
              4'h1: out_low = 9'h027;
              4'h2: out_low = 9'h027;
              4'h3: out_low = 9'h027;
              4'h4: out_low = 9'h027;
              4'h5: out_low = 9'h027;
              4'h6: out_low = 9'h027;
              4'h7: out_low = 9'h027;
              4'h8: out_low = 9'h027;
              4'h9: out_low = 9'h027;
              4'ha: out_low = 9'h027;
              4'hb: out_low = 9'h027;
              4'hc: out_low = 9'h027;
              4'hd: out_low = 9'h027;
              4'he: out_low = 9'h028;
              4'hf: out_low = 9'h028;
              default: out_low = 9'h000;
            endcase
          end
          6'h30: out_low = 9'h028;
          6'h31: out_low = 9'h028;
          6'h32: begin
            case (mant[3:0])
              4'h0: out_low = 9'h028;
              4'h1: out_low = 9'h028;
              4'h2: out_low = 9'h028;
              4'h3: out_low = 9'h028;
              4'h4: out_low = 9'h028;
              4'h5: out_low = 9'h028;
              4'h6: out_low = 9'h028;
              4'h7: out_low = 9'h028;
              4'h8: out_low = 9'h028;
              4'h9: out_low = 9'h028;
              4'ha: out_low = 9'h029;
              4'hb: out_low = 9'h029;
              4'hc: out_low = 9'h029;
              4'hd: out_low = 9'h029;
              4'he: out_low = 9'h029;
              4'hf: out_low = 9'h029;
              default: out_low = 9'h000;
            endcase
          end
          6'h33: out_low = 9'h029;
          6'h34: out_low = 9'h029;
          6'h35: begin
            case (mant[3:0])
              4'h0: out_low = 9'h029;
              4'h1: out_low = 9'h029;
              4'h2: out_low = 9'h029;
              4'h3: out_low = 9'h029;
              4'h4: out_low = 9'h029;
              4'h5: out_low = 9'h029;
              4'h6: out_low = 9'h029;
              4'h7: out_low = 9'h02a;
              4'h8: out_low = 9'h02a;
              4'h9: out_low = 9'h02a;
              4'ha: out_low = 9'h02a;
              4'hb: out_low = 9'h02a;
              4'hc: out_low = 9'h02a;
              4'hd: out_low = 9'h02a;
              4'he: out_low = 9'h02a;
              4'hf: out_low = 9'h02a;
              default: out_low = 9'h000;
            endcase
          end
          6'h36: out_low = 9'h02a;
          6'h37: out_low = 9'h02a;
          6'h38: begin
            case (mant[3:0])
              4'h0: out_low = 9'h02a;
              4'h1: out_low = 9'h02a;
              4'h2: out_low = 9'h02a;
              4'h3: out_low = 9'h02b;
              4'h4: out_low = 9'h02b;
              4'h5: out_low = 9'h02b;
              4'h6: out_low = 9'h02b;
              4'h7: out_low = 9'h02b;
              4'h8: out_low = 9'h02b;
              4'h9: out_low = 9'h02b;
              4'ha: out_low = 9'h02b;
              4'hb: out_low = 9'h02b;
              4'hc: out_low = 9'h02b;
              4'hd: out_low = 9'h02b;
              4'he: out_low = 9'h02b;
              4'hf: out_low = 9'h02b;
              default: out_low = 9'h000;
            endcase
          end
          6'h39: out_low = 9'h02b;
          6'h3a: begin
            case (mant[3:0])
              4'h0: out_low = 9'h02b;
              4'h1: out_low = 9'h02b;
              4'h2: out_low = 9'h02b;
              4'h3: out_low = 9'h02b;
              4'h4: out_low = 9'h02b;
              4'h5: out_low = 9'h02b;
              4'h6: out_low = 9'h02b;
              4'h7: out_low = 9'h02b;
              4'h8: out_low = 9'h02b;
              4'h9: out_low = 9'h02b;
              4'ha: out_low = 9'h02b;
              4'hb: out_low = 9'h02b;
              4'hc: out_low = 9'h02b;
              4'hd: out_low = 9'h02b;
              4'he: out_low = 9'h02b;
              4'hf: out_low = 9'h02c;
              default: out_low = 9'h000;
            endcase
          end
          6'h3b: out_low = 9'h02c;
          6'h3c: out_low = 9'h02c;
          6'h3d: begin
            case (mant[3:0])
              4'h0: out_low = 9'h02c;
              4'h1: out_low = 9'h02c;
              4'h2: out_low = 9'h02c;
              4'h3: out_low = 9'h02c;
              4'h4: out_low = 9'h02c;
              4'h5: out_low = 9'h02c;
              4'h6: out_low = 9'h02c;
              4'h7: out_low = 9'h02c;
              4'h8: out_low = 9'h02c;
              4'h9: out_low = 9'h02c;
              4'ha: out_low = 9'h02c;
              4'hb: out_low = 9'h02c;
              4'hc: out_low = 9'h02d;
              4'hd: out_low = 9'h02d;
              4'he: out_low = 9'h02d;
              4'hf: out_low = 9'h02d;
              default: out_low = 9'h000;
            endcase
          end
          6'h3e: out_low = 9'h02d;
          6'h3f: out_low = 9'h02d;
          default: out_low = 9'h000;
        endcase
      end
      6'h0b: begin
        case (mant[9:4])
          6'h00: begin
            case (mant[3:0])
              4'h0: out_low = 9'h02d;
              4'h1: out_low = 9'h02d;
              4'h2: out_low = 9'h02d;
              4'h3: out_low = 9'h02d;
              4'h4: out_low = 9'h02e;
              4'h5: out_low = 9'h02e;
              4'h6: out_low = 9'h02e;
              4'h7: out_low = 9'h02e;
              4'h8: out_low = 9'h02e;
              4'h9: out_low = 9'h02e;
              4'ha: out_low = 9'h02e;
              4'hb: out_low = 9'h02e;
              4'hc: out_low = 9'h02e;
              4'hd: out_low = 9'h02e;
              4'he: out_low = 9'h02e;
              4'hf: out_low = 9'h02e;
              default: out_low = 9'h000;
            endcase
          end
          6'h01: begin
            case (mant[3:0])
              4'h0: out_low = 9'h02e;
              4'h1: out_low = 9'h02e;
              4'h2: out_low = 9'h02e;
              4'h3: out_low = 9'h02e;
              4'h4: out_low = 9'h02e;
              4'h5: out_low = 9'h02e;
              4'h6: out_low = 9'h02e;
              4'h7: out_low = 9'h02e;
              4'h8: out_low = 9'h02e;
              4'h9: out_low = 9'h02e;
              4'ha: out_low = 9'h02f;
              4'hb: out_low = 9'h02f;
              4'hc: out_low = 9'h02f;
              4'hd: out_low = 9'h02f;
              4'he: out_low = 9'h02f;
              4'hf: out_low = 9'h02f;
              default: out_low = 9'h000;
            endcase
          end
          6'h02: out_low = 9'h02f;
          6'h03: out_low = 9'h030;
          6'h04: begin
            case (mant[3:0])
              4'h0: out_low = 9'h030;
              4'h1: out_low = 9'h030;
              4'h2: out_low = 9'h030;
              4'h3: out_low = 9'h030;
              4'h4: out_low = 9'h030;
              4'h5: out_low = 9'h030;
              4'h6: out_low = 9'h031;
              4'h7: out_low = 9'h031;
              4'h8: out_low = 9'h031;
              4'h9: out_low = 9'h031;
              4'ha: out_low = 9'h031;
              4'hb: out_low = 9'h031;
              4'hc: out_low = 9'h031;
              4'hd: out_low = 9'h031;
              4'he: out_low = 9'h031;
              4'hf: out_low = 9'h031;
              default: out_low = 9'h000;
            endcase
          end
          6'h05: begin
            case (mant[3:0])
              4'h0: out_low = 9'h031;
              4'h1: out_low = 9'h031;
              4'h2: out_low = 9'h031;
              4'h3: out_low = 9'h031;
              4'h4: out_low = 9'h031;
              4'h5: out_low = 9'h031;
              4'h6: out_low = 9'h031;
              4'h7: out_low = 9'h031;
              4'h8: out_low = 9'h031;
              4'h9: out_low = 9'h031;
              4'ha: out_low = 9'h031;
              4'hb: out_low = 9'h031;
              4'hc: out_low = 9'h032;
              4'hd: out_low = 9'h032;
              4'he: out_low = 9'h032;
              4'hf: out_low = 9'h032;
              default: out_low = 9'h000;
            endcase
          end
          6'h06: out_low = 9'h032;
          6'h07: begin
            case (mant[3:0])
              4'h0: out_low = 9'h032;
              4'h1: out_low = 9'h032;
              4'h2: out_low = 9'h033;
              4'h3: out_low = 9'h033;
              4'h4: out_low = 9'h033;
              4'h5: out_low = 9'h033;
              4'h6: out_low = 9'h033;
              4'h7: out_low = 9'h033;
              4'h8: out_low = 9'h033;
              4'h9: out_low = 9'h033;
              4'ha: out_low = 9'h033;
              4'hb: out_low = 9'h033;
              4'hc: out_low = 9'h033;
              4'hd: out_low = 9'h033;
              4'he: out_low = 9'h033;
              4'hf: out_low = 9'h033;
              default: out_low = 9'h000;
            endcase
          end
          6'h08: begin
            case (mant[3:0])
              4'h0: out_low = 9'h033;
              4'h1: out_low = 9'h033;
              4'h2: out_low = 9'h033;
              4'h3: out_low = 9'h033;
              4'h4: out_low = 9'h033;
              4'h5: out_low = 9'h033;
              4'h6: out_low = 9'h033;
              4'h7: out_low = 9'h033;
              4'h8: out_low = 9'h034;
              4'h9: out_low = 9'h034;
              4'ha: out_low = 9'h034;
              4'hb: out_low = 9'h034;
              4'hc: out_low = 9'h034;
              4'hd: out_low = 9'h034;
              4'he: out_low = 9'h034;
              4'hf: out_low = 9'h034;
              default: out_low = 9'h000;
            endcase
          end
          6'h09: begin
            case (mant[3:0])
              4'h0: out_low = 9'h034;
              4'h1: out_low = 9'h034;
              4'h2: out_low = 9'h034;
              4'h3: out_low = 9'h034;
              4'h4: out_low = 9'h034;
              4'h5: out_low = 9'h034;
              4'h6: out_low = 9'h034;
              4'h7: out_low = 9'h034;
              4'h8: out_low = 9'h034;
              4'h9: out_low = 9'h034;
              4'ha: out_low = 9'h034;
              4'hb: out_low = 9'h034;
              4'hc: out_low = 9'h034;
              4'hd: out_low = 9'h034;
              4'he: out_low = 9'h035;
              4'hf: out_low = 9'h035;
              default: out_low = 9'h000;
            endcase
          end
          6'h0a: out_low = 9'h035;
          6'h0b: begin
            case (mant[3:0])
              4'h0: out_low = 9'h035;
              4'h1: out_low = 9'h035;
              4'h2: out_low = 9'h035;
              4'h3: out_low = 9'h035;
              4'h4: out_low = 9'h036;
              4'h5: out_low = 9'h036;
              4'h6: out_low = 9'h036;
              4'h7: out_low = 9'h036;
              4'h8: out_low = 9'h036;
              4'h9: out_low = 9'h036;
              4'ha: out_low = 9'h036;
              4'hb: out_low = 9'h036;
              4'hc: out_low = 9'h036;
              4'hd: out_low = 9'h036;
              4'he: out_low = 9'h036;
              4'hf: out_low = 9'h036;
              default: out_low = 9'h000;
            endcase
          end
          6'h0c: begin
            case (mant[3:0])
              4'h0: out_low = 9'h036;
              4'h1: out_low = 9'h036;
              4'h2: out_low = 9'h036;
              4'h3: out_low = 9'h036;
              4'h4: out_low = 9'h036;
              4'h5: out_low = 9'h036;
              4'h6: out_low = 9'h036;
              4'h7: out_low = 9'h036;
              4'h8: out_low = 9'h036;
              4'h9: out_low = 9'h036;
              4'ha: out_low = 9'h037;
              4'hb: out_low = 9'h037;
              4'hc: out_low = 9'h037;
              4'hd: out_low = 9'h037;
              4'he: out_low = 9'h037;
              4'hf: out_low = 9'h037;
              default: out_low = 9'h000;
            endcase
          end
          6'h0d: out_low = 9'h037;
          6'h0e: out_low = 9'h038;
          6'h0f: begin
            case (mant[3:0])
              4'h0: out_low = 9'h038;
              4'h1: out_low = 9'h038;
              4'h2: out_low = 9'h038;
              4'h3: out_low = 9'h038;
              4'h4: out_low = 9'h038;
              4'h5: out_low = 9'h038;
              4'h6: out_low = 9'h039;
              4'h7: out_low = 9'h039;
              4'h8: out_low = 9'h039;
              4'h9: out_low = 9'h039;
              4'ha: out_low = 9'h039;
              4'hb: out_low = 9'h039;
              4'hc: out_low = 9'h039;
              4'hd: out_low = 9'h039;
              4'he: out_low = 9'h039;
              4'hf: out_low = 9'h039;
              default: out_low = 9'h000;
            endcase
          end
          6'h10: begin
            case (mant[3:0])
              4'h0: out_low = 9'h039;
              4'h1: out_low = 9'h039;
              4'h2: out_low = 9'h039;
              4'h3: out_low = 9'h039;
              4'h4: out_low = 9'h039;
              4'h5: out_low = 9'h039;
              4'h6: out_low = 9'h039;
              4'h7: out_low = 9'h039;
              4'h8: out_low = 9'h039;
              4'h9: out_low = 9'h039;
              4'ha: out_low = 9'h039;
              4'hb: out_low = 9'h039;
              4'hc: out_low = 9'h03a;
              4'hd: out_low = 9'h03a;
              4'he: out_low = 9'h03a;
              4'hf: out_low = 9'h03a;
              default: out_low = 9'h000;
            endcase
          end
          6'h11: out_low = 9'h03a;
          6'h12: begin
            case (mant[3:0])
              4'h0: out_low = 9'h03a;
              4'h1: out_low = 9'h03a;
              4'h2: out_low = 9'h03b;
              4'h3: out_low = 9'h03b;
              4'h4: out_low = 9'h03b;
              4'h5: out_low = 9'h03b;
              4'h6: out_low = 9'h03b;
              4'h7: out_low = 9'h03b;
              4'h8: out_low = 9'h03b;
              4'h9: out_low = 9'h03b;
              4'ha: out_low = 9'h03b;
              4'hb: out_low = 9'h03b;
              4'hc: out_low = 9'h03b;
              4'hd: out_low = 9'h03b;
              4'he: out_low = 9'h03b;
              4'hf: out_low = 9'h03b;
              default: out_low = 9'h000;
            endcase
          end
          6'h13: begin
            case (mant[3:0])
              4'h0: out_low = 9'h03b;
              4'h1: out_low = 9'h03b;
              4'h2: out_low = 9'h03b;
              4'h3: out_low = 9'h03b;
              4'h4: out_low = 9'h03b;
              4'h5: out_low = 9'h03b;
              4'h6: out_low = 9'h03b;
              4'h7: out_low = 9'h03b;
              4'h8: out_low = 9'h03c;
              4'h9: out_low = 9'h03c;
              4'ha: out_low = 9'h03c;
              4'hb: out_low = 9'h03c;
              4'hc: out_low = 9'h03c;
              4'hd: out_low = 9'h03c;
              4'he: out_low = 9'h03c;
              4'hf: out_low = 9'h03c;
              default: out_low = 9'h000;
            endcase
          end
          6'h14: begin
            case (mant[3:0])
              4'h0: out_low = 9'h03c;
              4'h1: out_low = 9'h03c;
              4'h2: out_low = 9'h03c;
              4'h3: out_low = 9'h03c;
              4'h4: out_low = 9'h03c;
              4'h5: out_low = 9'h03c;
              4'h6: out_low = 9'h03c;
              4'h7: out_low = 9'h03c;
              4'h8: out_low = 9'h03c;
              4'h9: out_low = 9'h03c;
              4'ha: out_low = 9'h03c;
              4'hb: out_low = 9'h03c;
              4'hc: out_low = 9'h03c;
              4'hd: out_low = 9'h03d;
              4'he: out_low = 9'h03d;
              4'hf: out_low = 9'h03d;
              default: out_low = 9'h000;
            endcase
          end
          6'h15: out_low = 9'h03d;
          6'h16: begin
            case (mant[3:0])
              4'h0: out_low = 9'h03d;
              4'h1: out_low = 9'h03d;
              4'h2: out_low = 9'h03d;
              4'h3: out_low = 9'h03e;
              4'h4: out_low = 9'h03e;
              4'h5: out_low = 9'h03e;
              4'h6: out_low = 9'h03e;
              4'h7: out_low = 9'h03e;
              4'h8: out_low = 9'h03e;
              4'h9: out_low = 9'h03e;
              4'ha: out_low = 9'h03e;
              4'hb: out_low = 9'h03e;
              4'hc: out_low = 9'h03e;
              4'hd: out_low = 9'h03e;
              4'he: out_low = 9'h03e;
              4'hf: out_low = 9'h03e;
              default: out_low = 9'h000;
            endcase
          end
          6'h17: begin
            case (mant[3:0])
              4'h0: out_low = 9'h03e;
              4'h1: out_low = 9'h03e;
              4'h2: out_low = 9'h03e;
              4'h3: out_low = 9'h03e;
              4'h4: out_low = 9'h03e;
              4'h5: out_low = 9'h03e;
              4'h6: out_low = 9'h03e;
              4'h7: out_low = 9'h03e;
              4'h8: out_low = 9'h03e;
              4'h9: out_low = 9'h03f;
              4'ha: out_low = 9'h03f;
              4'hb: out_low = 9'h03f;
              4'hc: out_low = 9'h03f;
              4'hd: out_low = 9'h03f;
              4'he: out_low = 9'h03f;
              4'hf: out_low = 9'h03f;
              default: out_low = 9'h000;
            endcase
          end
          6'h18: begin
            case (mant[3:0])
              4'h0: out_low = 9'h03f;
              4'h1: out_low = 9'h03f;
              4'h2: out_low = 9'h03f;
              4'h3: out_low = 9'h03f;
              4'h4: out_low = 9'h03f;
              4'h5: out_low = 9'h03f;
              4'h6: out_low = 9'h03f;
              4'h7: out_low = 9'h03f;
              4'h8: out_low = 9'h03f;
              4'h9: out_low = 9'h03f;
              4'ha: out_low = 9'h03f;
              4'hb: out_low = 9'h03f;
              4'hc: out_low = 9'h03f;
              4'hd: out_low = 9'h03f;
              4'he: out_low = 9'h03f;
              4'hf: out_low = 9'h040;
              default: out_low = 9'h000;
            endcase
          end
          6'h19: out_low = 9'h040;
          6'h1a: begin
            case (mant[3:0])
              4'h0: out_low = 9'h040;
              4'h1: out_low = 9'h040;
              4'h2: out_low = 9'h040;
              4'h3: out_low = 9'h040;
              4'h4: out_low = 9'h041;
              4'h5: out_low = 9'h041;
              4'h6: out_low = 9'h041;
              4'h7: out_low = 9'h041;
              4'h8: out_low = 9'h041;
              4'h9: out_low = 9'h041;
              4'ha: out_low = 9'h041;
              4'hb: out_low = 9'h041;
              4'hc: out_low = 9'h041;
              4'hd: out_low = 9'h041;
              4'he: out_low = 9'h041;
              4'hf: out_low = 9'h041;
              default: out_low = 9'h000;
            endcase
          end
          6'h1b: begin
            case (mant[3:0])
              4'h0: out_low = 9'h041;
              4'h1: out_low = 9'h041;
              4'h2: out_low = 9'h041;
              4'h3: out_low = 9'h041;
              4'h4: out_low = 9'h041;
              4'h5: out_low = 9'h041;
              4'h6: out_low = 9'h041;
              4'h7: out_low = 9'h041;
              4'h8: out_low = 9'h041;
              4'h9: out_low = 9'h041;
              4'ha: out_low = 9'h042;
              4'hb: out_low = 9'h042;
              4'hc: out_low = 9'h042;
              4'hd: out_low = 9'h042;
              4'he: out_low = 9'h042;
              4'hf: out_low = 9'h042;
              default: out_low = 9'h000;
            endcase
          end
          6'h1c: out_low = 9'h042;
          6'h1d: out_low = 9'h043;
          6'h1e: begin
            case (mant[3:0])
              4'h0: out_low = 9'h043;
              4'h1: out_low = 9'h043;
              4'h2: out_low = 9'h043;
              4'h3: out_low = 9'h043;
              4'h4: out_low = 9'h043;
              4'h5: out_low = 9'h044;
              4'h6: out_low = 9'h044;
              4'h7: out_low = 9'h044;
              4'h8: out_low = 9'h044;
              4'h9: out_low = 9'h044;
              4'ha: out_low = 9'h044;
              4'hb: out_low = 9'h044;
              4'hc: out_low = 9'h044;
              4'hd: out_low = 9'h044;
              4'he: out_low = 9'h044;
              4'hf: out_low = 9'h044;
              default: out_low = 9'h000;
            endcase
          end
          6'h1f: begin
            case (mant[3:0])
              4'h0: out_low = 9'h044;
              4'h1: out_low = 9'h044;
              4'h2: out_low = 9'h044;
              4'h3: out_low = 9'h044;
              4'h4: out_low = 9'h044;
              4'h5: out_low = 9'h044;
              4'h6: out_low = 9'h044;
              4'h7: out_low = 9'h044;
              4'h8: out_low = 9'h044;
              4'h9: out_low = 9'h044;
              4'ha: out_low = 9'h044;
              4'hb: out_low = 9'h045;
              4'hc: out_low = 9'h045;
              4'hd: out_low = 9'h045;
              4'he: out_low = 9'h045;
              4'hf: out_low = 9'h045;
              default: out_low = 9'h000;
            endcase
          end
          6'h20: out_low = 9'h045;
          6'h21: begin
            case (mant[3:0])
              4'h0: out_low = 9'h045;
              4'h1: out_low = 9'h046;
              4'h2: out_low = 9'h046;
              4'h3: out_low = 9'h046;
              4'h4: out_low = 9'h046;
              4'h5: out_low = 9'h046;
              4'h6: out_low = 9'h046;
              4'h7: out_low = 9'h046;
              4'h8: out_low = 9'h046;
              4'h9: out_low = 9'h046;
              4'ha: out_low = 9'h046;
              4'hb: out_low = 9'h046;
              4'hc: out_low = 9'h046;
              4'hd: out_low = 9'h046;
              4'he: out_low = 9'h046;
              4'hf: out_low = 9'h046;
              default: out_low = 9'h000;
            endcase
          end
          6'h22: begin
            case (mant[3:0])
              4'h0: out_low = 9'h046;
              4'h1: out_low = 9'h046;
              4'h2: out_low = 9'h046;
              4'h3: out_low = 9'h046;
              4'h4: out_low = 9'h046;
              4'h5: out_low = 9'h046;
              4'h6: out_low = 9'h047;
              4'h7: out_low = 9'h047;
              4'h8: out_low = 9'h047;
              4'h9: out_low = 9'h047;
              4'ha: out_low = 9'h047;
              4'hb: out_low = 9'h047;
              4'hc: out_low = 9'h047;
              4'hd: out_low = 9'h047;
              4'he: out_low = 9'h047;
              4'hf: out_low = 9'h047;
              default: out_low = 9'h000;
            endcase
          end
          6'h23: begin
            case (mant[3:0])
              4'h0: out_low = 9'h047;
              4'h1: out_low = 9'h047;
              4'h2: out_low = 9'h047;
              4'h3: out_low = 9'h047;
              4'h4: out_low = 9'h047;
              4'h5: out_low = 9'h047;
              4'h6: out_low = 9'h047;
              4'h7: out_low = 9'h047;
              4'h8: out_low = 9'h047;
              4'h9: out_low = 9'h047;
              4'ha: out_low = 9'h047;
              4'hb: out_low = 9'h047;
              4'hc: out_low = 9'h048;
              4'hd: out_low = 9'h048;
              4'he: out_low = 9'h048;
              4'hf: out_low = 9'h048;
              default: out_low = 9'h000;
            endcase
          end
          6'h24: out_low = 9'h048;
          6'h25: begin
            case (mant[3:0])
              4'h0: out_low = 9'h048;
              4'h1: out_low = 9'h049;
              4'h2: out_low = 9'h049;
              4'h3: out_low = 9'h049;
              4'h4: out_low = 9'h049;
              4'h5: out_low = 9'h049;
              4'h6: out_low = 9'h049;
              4'h7: out_low = 9'h049;
              4'h8: out_low = 9'h049;
              4'h9: out_low = 9'h049;
              4'ha: out_low = 9'h049;
              4'hb: out_low = 9'h049;
              4'hc: out_low = 9'h049;
              4'hd: out_low = 9'h049;
              4'he: out_low = 9'h049;
              4'hf: out_low = 9'h049;
              default: out_low = 9'h000;
            endcase
          end
          6'h26: begin
            case (mant[3:0])
              4'h0: out_low = 9'h049;
              4'h1: out_low = 9'h049;
              4'h2: out_low = 9'h049;
              4'h3: out_low = 9'h049;
              4'h4: out_low = 9'h049;
              4'h5: out_low = 9'h049;
              4'h6: out_low = 9'h049;
              4'h7: out_low = 9'h04a;
              4'h8: out_low = 9'h04a;
              4'h9: out_low = 9'h04a;
              4'ha: out_low = 9'h04a;
              4'hb: out_low = 9'h04a;
              4'hc: out_low = 9'h04a;
              4'hd: out_low = 9'h04a;
              4'he: out_low = 9'h04a;
              4'hf: out_low = 9'h04a;
              default: out_low = 9'h000;
            endcase
          end
          6'h27: begin
            case (mant[3:0])
              4'h0: out_low = 9'h04a;
              4'h1: out_low = 9'h04a;
              4'h2: out_low = 9'h04a;
              4'h3: out_low = 9'h04a;
              4'h4: out_low = 9'h04a;
              4'h5: out_low = 9'h04a;
              4'h6: out_low = 9'h04a;
              4'h7: out_low = 9'h04a;
              4'h8: out_low = 9'h04a;
              4'h9: out_low = 9'h04a;
              4'ha: out_low = 9'h04a;
              4'hb: out_low = 9'h04a;
              4'hc: out_low = 9'h04a;
              4'hd: out_low = 9'h04b;
              4'he: out_low = 9'h04b;
              4'hf: out_low = 9'h04b;
              default: out_low = 9'h000;
            endcase
          end
          6'h28: out_low = 9'h04b;
          6'h29: begin
            case (mant[3:0])
              4'h0: out_low = 9'h04b;
              4'h1: out_low = 9'h04b;
              4'h2: out_low = 9'h04c;
              4'h3: out_low = 9'h04c;
              4'h4: out_low = 9'h04c;
              4'h5: out_low = 9'h04c;
              4'h6: out_low = 9'h04c;
              4'h7: out_low = 9'h04c;
              4'h8: out_low = 9'h04c;
              4'h9: out_low = 9'h04c;
              4'ha: out_low = 9'h04c;
              4'hb: out_low = 9'h04c;
              4'hc: out_low = 9'h04c;
              4'hd: out_low = 9'h04c;
              4'he: out_low = 9'h04c;
              4'hf: out_low = 9'h04c;
              default: out_low = 9'h000;
            endcase
          end
          6'h2a: begin
            case (mant[3:0])
              4'h0: out_low = 9'h04c;
              4'h1: out_low = 9'h04c;
              4'h2: out_low = 9'h04c;
              4'h3: out_low = 9'h04c;
              4'h4: out_low = 9'h04c;
              4'h5: out_low = 9'h04c;
              4'h6: out_low = 9'h04c;
              4'h7: out_low = 9'h04c;
              4'h8: out_low = 9'h04d;
              4'h9: out_low = 9'h04d;
              4'ha: out_low = 9'h04d;
              4'hb: out_low = 9'h04d;
              4'hc: out_low = 9'h04d;
              4'hd: out_low = 9'h04d;
              4'he: out_low = 9'h04d;
              4'hf: out_low = 9'h04d;
              default: out_low = 9'h000;
            endcase
          end
          6'h2b: begin
            case (mant[3:0])
              4'h0: out_low = 9'h04d;
              4'h1: out_low = 9'h04d;
              4'h2: out_low = 9'h04d;
              4'h3: out_low = 9'h04d;
              4'h4: out_low = 9'h04d;
              4'h5: out_low = 9'h04d;
              4'h6: out_low = 9'h04d;
              4'h7: out_low = 9'h04d;
              4'h8: out_low = 9'h04d;
              4'h9: out_low = 9'h04d;
              4'ha: out_low = 9'h04d;
              4'hb: out_low = 9'h04d;
              4'hc: out_low = 9'h04d;
              4'hd: out_low = 9'h04e;
              4'he: out_low = 9'h04e;
              4'hf: out_low = 9'h04e;
              default: out_low = 9'h000;
            endcase
          end
          6'h2c: out_low = 9'h04e;
          6'h2d: begin
            case (mant[3:0])
              4'h0: out_low = 9'h04e;
              4'h1: out_low = 9'h04e;
              4'h2: out_low = 9'h04f;
              4'h3: out_low = 9'h04f;
              4'h4: out_low = 9'h04f;
              4'h5: out_low = 9'h04f;
              4'h6: out_low = 9'h04f;
              4'h7: out_low = 9'h04f;
              4'h8: out_low = 9'h04f;
              4'h9: out_low = 9'h04f;
              4'ha: out_low = 9'h04f;
              4'hb: out_low = 9'h04f;
              4'hc: out_low = 9'h04f;
              4'hd: out_low = 9'h04f;
              4'he: out_low = 9'h04f;
              4'hf: out_low = 9'h04f;
              default: out_low = 9'h000;
            endcase
          end
          6'h2e: begin
            case (mant[3:0])
              4'h0: out_low = 9'h04f;
              4'h1: out_low = 9'h04f;
              4'h2: out_low = 9'h04f;
              4'h3: out_low = 9'h04f;
              4'h4: out_low = 9'h04f;
              4'h5: out_low = 9'h04f;
              4'h6: out_low = 9'h04f;
              4'h7: out_low = 9'h04f;
              4'h8: out_low = 9'h050;
              4'h9: out_low = 9'h050;
              4'ha: out_low = 9'h050;
              4'hb: out_low = 9'h050;
              4'hc: out_low = 9'h050;
              4'hd: out_low = 9'h050;
              4'he: out_low = 9'h050;
              4'hf: out_low = 9'h050;
              default: out_low = 9'h000;
            endcase
          end
          6'h2f: begin
            case (mant[3:0])
              4'h0: out_low = 9'h050;
              4'h1: out_low = 9'h050;
              4'h2: out_low = 9'h050;
              4'h3: out_low = 9'h050;
              4'h4: out_low = 9'h050;
              4'h5: out_low = 9'h050;
              4'h6: out_low = 9'h050;
              4'h7: out_low = 9'h050;
              4'h8: out_low = 9'h050;
              4'h9: out_low = 9'h050;
              4'ha: out_low = 9'h050;
              4'hb: out_low = 9'h050;
              4'hc: out_low = 9'h050;
              4'hd: out_low = 9'h051;
              4'he: out_low = 9'h051;
              4'hf: out_low = 9'h051;
              default: out_low = 9'h000;
            endcase
          end
          6'h30: out_low = 9'h051;
          6'h31: begin
            case (mant[3:0])
              4'h0: out_low = 9'h051;
              4'h1: out_low = 9'h051;
              4'h2: out_low = 9'h051;
              4'h3: out_low = 9'h052;
              4'h4: out_low = 9'h052;
              4'h5: out_low = 9'h052;
              4'h6: out_low = 9'h052;
              4'h7: out_low = 9'h052;
              4'h8: out_low = 9'h052;
              4'h9: out_low = 9'h052;
              4'ha: out_low = 9'h052;
              4'hb: out_low = 9'h052;
              4'hc: out_low = 9'h052;
              4'hd: out_low = 9'h052;
              4'he: out_low = 9'h052;
              4'hf: out_low = 9'h052;
              default: out_low = 9'h000;
            endcase
          end
          6'h32: begin
            case (mant[3:0])
              4'h0: out_low = 9'h052;
              4'h1: out_low = 9'h052;
              4'h2: out_low = 9'h052;
              4'h3: out_low = 9'h052;
              4'h4: out_low = 9'h052;
              4'h5: out_low = 9'h052;
              4'h6: out_low = 9'h052;
              4'h7: out_low = 9'h052;
              4'h8: out_low = 9'h053;
              4'h9: out_low = 9'h053;
              4'ha: out_low = 9'h053;
              4'hb: out_low = 9'h053;
              4'hc: out_low = 9'h053;
              4'hd: out_low = 9'h053;
              4'he: out_low = 9'h053;
              4'hf: out_low = 9'h053;
              default: out_low = 9'h000;
            endcase
          end
          6'h33: begin
            case (mant[3:0])
              4'h0: out_low = 9'h053;
              4'h1: out_low = 9'h053;
              4'h2: out_low = 9'h053;
              4'h3: out_low = 9'h053;
              4'h4: out_low = 9'h053;
              4'h5: out_low = 9'h053;
              4'h6: out_low = 9'h053;
              4'h7: out_low = 9'h053;
              4'h8: out_low = 9'h053;
              4'h9: out_low = 9'h053;
              4'ha: out_low = 9'h053;
              4'hb: out_low = 9'h053;
              4'hc: out_low = 9'h053;
              4'hd: out_low = 9'h054;
              4'he: out_low = 9'h054;
              4'hf: out_low = 9'h054;
              default: out_low = 9'h000;
            endcase
          end
          6'h34: out_low = 9'h054;
          6'h35: begin
            case (mant[3:0])
              4'h0: out_low = 9'h054;
              4'h1: out_low = 9'h054;
              4'h2: out_low = 9'h054;
              4'h3: out_low = 9'h055;
              4'h4: out_low = 9'h055;
              4'h5: out_low = 9'h055;
              4'h6: out_low = 9'h055;
              4'h7: out_low = 9'h055;
              4'h8: out_low = 9'h055;
              4'h9: out_low = 9'h055;
              4'ha: out_low = 9'h055;
              4'hb: out_low = 9'h055;
              4'hc: out_low = 9'h055;
              4'hd: out_low = 9'h055;
              4'he: out_low = 9'h055;
              4'hf: out_low = 9'h055;
              default: out_low = 9'h000;
            endcase
          end
          6'h36: begin
            case (mant[3:0])
              4'h0: out_low = 9'h055;
              4'h1: out_low = 9'h055;
              4'h2: out_low = 9'h055;
              4'h3: out_low = 9'h055;
              4'h4: out_low = 9'h055;
              4'h5: out_low = 9'h055;
              4'h6: out_low = 9'h055;
              4'h7: out_low = 9'h055;
              4'h8: out_low = 9'h056;
              4'h9: out_low = 9'h056;
              4'ha: out_low = 9'h056;
              4'hb: out_low = 9'h056;
              4'hc: out_low = 9'h056;
              4'hd: out_low = 9'h056;
              4'he: out_low = 9'h056;
              4'hf: out_low = 9'h056;
              default: out_low = 9'h000;
            endcase
          end
          6'h37: begin
            case (mant[3:0])
              4'h0: out_low = 9'h056;
              4'h1: out_low = 9'h056;
              4'h2: out_low = 9'h056;
              4'h3: out_low = 9'h056;
              4'h4: out_low = 9'h056;
              4'h5: out_low = 9'h056;
              4'h6: out_low = 9'h056;
              4'h7: out_low = 9'h056;
              4'h8: out_low = 9'h056;
              4'h9: out_low = 9'h056;
              4'ha: out_low = 9'h056;
              4'hb: out_low = 9'h056;
              4'hc: out_low = 9'h056;
              4'hd: out_low = 9'h057;
              4'he: out_low = 9'h057;
              4'hf: out_low = 9'h057;
              default: out_low = 9'h000;
            endcase
          end
          6'h38: out_low = 9'h057;
          6'h39: begin
            case (mant[3:0])
              4'h0: out_low = 9'h057;
              4'h1: out_low = 9'h057;
              4'h2: out_low = 9'h057;
              4'h3: out_low = 9'h058;
              4'h4: out_low = 9'h058;
              4'h5: out_low = 9'h058;
              4'h6: out_low = 9'h058;
              4'h7: out_low = 9'h058;
              4'h8: out_low = 9'h058;
              4'h9: out_low = 9'h058;
              4'ha: out_low = 9'h058;
              4'hb: out_low = 9'h058;
              4'hc: out_low = 9'h058;
              4'hd: out_low = 9'h058;
              4'he: out_low = 9'h058;
              4'hf: out_low = 9'h058;
              default: out_low = 9'h000;
            endcase
          end
          6'h3a: begin
            case (mant[3:0])
              4'h0: out_low = 9'h058;
              4'h1: out_low = 9'h058;
              4'h2: out_low = 9'h058;
              4'h3: out_low = 9'h058;
              4'h4: out_low = 9'h058;
              4'h5: out_low = 9'h058;
              4'h6: out_low = 9'h058;
              4'h7: out_low = 9'h058;
              4'h8: out_low = 9'h059;
              4'h9: out_low = 9'h059;
              4'ha: out_low = 9'h059;
              4'hb: out_low = 9'h059;
              4'hc: out_low = 9'h059;
              4'hd: out_low = 9'h059;
              4'he: out_low = 9'h059;
              4'hf: out_low = 9'h059;
              default: out_low = 9'h000;
            endcase
          end
          6'h3b: begin
            case (mant[3:0])
              4'h0: out_low = 9'h059;
              4'h1: out_low = 9'h059;
              4'h2: out_low = 9'h059;
              4'h3: out_low = 9'h059;
              4'h4: out_low = 9'h059;
              4'h5: out_low = 9'h059;
              4'h6: out_low = 9'h059;
              4'h7: out_low = 9'h059;
              4'h8: out_low = 9'h059;
              4'h9: out_low = 9'h059;
              4'ha: out_low = 9'h059;
              4'hb: out_low = 9'h059;
              4'hc: out_low = 9'h059;
              4'hd: out_low = 9'h05a;
              4'he: out_low = 9'h05a;
              4'hf: out_low = 9'h05a;
              default: out_low = 9'h000;
            endcase
          end
          6'h3c: out_low = 9'h05a;
          6'h3d: begin
            case (mant[3:0])
              4'h0: out_low = 9'h05a;
              4'h1: out_low = 9'h05a;
              4'h2: out_low = 9'h05b;
              4'h3: out_low = 9'h05b;
              4'h4: out_low = 9'h05b;
              4'h5: out_low = 9'h05b;
              4'h6: out_low = 9'h05b;
              4'h7: out_low = 9'h05b;
              4'h8: out_low = 9'h05b;
              4'h9: out_low = 9'h05b;
              4'ha: out_low = 9'h05b;
              4'hb: out_low = 9'h05b;
              4'hc: out_low = 9'h05b;
              4'hd: out_low = 9'h05b;
              4'he: out_low = 9'h05b;
              4'hf: out_low = 9'h05b;
              default: out_low = 9'h000;
            endcase
          end
          6'h3e: begin
            case (mant[3:0])
              4'h0: out_low = 9'h05b;
              4'h1: out_low = 9'h05b;
              4'h2: out_low = 9'h05b;
              4'h3: out_low = 9'h05b;
              4'h4: out_low = 9'h05b;
              4'h5: out_low = 9'h05b;
              4'h6: out_low = 9'h05b;
              4'h7: out_low = 9'h05b;
              4'h8: out_low = 9'h05c;
              4'h9: out_low = 9'h05c;
              4'ha: out_low = 9'h05c;
              4'hb: out_low = 9'h05c;
              4'hc: out_low = 9'h05c;
              4'hd: out_low = 9'h05c;
              4'he: out_low = 9'h05c;
              4'hf: out_low = 9'h05c;
              default: out_low = 9'h000;
            endcase
          end
          6'h3f: begin
            case (mant[3:0])
              4'h0: out_low = 9'h05c;
              4'h1: out_low = 9'h05c;
              4'h2: out_low = 9'h05c;
              4'h3: out_low = 9'h05c;
              4'h4: out_low = 9'h05c;
              4'h5: out_low = 9'h05c;
              4'h6: out_low = 9'h05c;
              4'h7: out_low = 9'h05c;
              4'h8: out_low = 9'h05c;
              4'h9: out_low = 9'h05c;
              4'ha: out_low = 9'h05c;
              4'hb: out_low = 9'h05c;
              4'hc: out_low = 9'h05c;
              4'hd: out_low = 9'h05d;
              4'he: out_low = 9'h05d;
              4'hf: out_low = 9'h05d;
              default: out_low = 9'h000;
            endcase
          end
          default: out_low = 9'h000;
        endcase
      end
      6'h0c: begin
        case (mant[9:4])
          6'h00: begin
            case (mant[3:0])
              4'h0: out_low = 9'h05d;
              4'h1: out_low = 9'h05d;
              4'h2: out_low = 9'h05d;
              4'h3: out_low = 9'h05d;
              4'h4: out_low = 9'h05d;
              4'h5: out_low = 9'h05d;
              4'h6: out_low = 9'h05d;
              4'h7: out_low = 9'h05d;
              4'h8: out_low = 9'h05d;
              4'h9: out_low = 9'h05e;
              4'ha: out_low = 9'h05e;
              4'hb: out_low = 9'h05e;
              4'hc: out_low = 9'h05e;
              4'hd: out_low = 9'h05e;
              4'he: out_low = 9'h05e;
              4'hf: out_low = 9'h05e;
              default: out_low = 9'h000;
            endcase
          end
          6'h01: begin
            case (mant[3:0])
              4'h0: out_low = 9'h05e;
              4'h1: out_low = 9'h05e;
              4'h2: out_low = 9'h05e;
              4'h3: out_low = 9'h05e;
              4'h4: out_low = 9'h05f;
              4'h5: out_low = 9'h05f;
              4'h6: out_low = 9'h05f;
              4'h7: out_low = 9'h05f;
              4'h8: out_low = 9'h05f;
              4'h9: out_low = 9'h05f;
              4'ha: out_low = 9'h05f;
              4'hb: out_low = 9'h05f;
              4'hc: out_low = 9'h05f;
              4'hd: out_low = 9'h05f;
              4'he: out_low = 9'h060;
              4'hf: out_low = 9'h060;
              default: out_low = 9'h000;
            endcase
          end
          6'h02: begin
            case (mant[3:0])
              4'h0: out_low = 9'h060;
              4'h1: out_low = 9'h060;
              4'h2: out_low = 9'h060;
              4'h3: out_low = 9'h060;
              4'h4: out_low = 9'h060;
              4'h5: out_low = 9'h060;
              4'h6: out_low = 9'h060;
              4'h7: out_low = 9'h060;
              4'h8: out_low = 9'h060;
              4'h9: out_low = 9'h061;
              4'ha: out_low = 9'h061;
              4'hb: out_low = 9'h061;
              4'hc: out_low = 9'h061;
              4'hd: out_low = 9'h061;
              4'he: out_low = 9'h061;
              4'hf: out_low = 9'h061;
              default: out_low = 9'h000;
            endcase
          end
          6'h03: begin
            case (mant[3:0])
              4'h0: out_low = 9'h061;
              4'h1: out_low = 9'h061;
              4'h2: out_low = 9'h061;
              4'h3: out_low = 9'h062;
              4'h4: out_low = 9'h062;
              4'h5: out_low = 9'h062;
              4'h6: out_low = 9'h062;
              4'h7: out_low = 9'h062;
              4'h8: out_low = 9'h062;
              4'h9: out_low = 9'h062;
              4'ha: out_low = 9'h062;
              4'hb: out_low = 9'h062;
              4'hc: out_low = 9'h062;
              4'hd: out_low = 9'h062;
              4'he: out_low = 9'h063;
              4'hf: out_low = 9'h063;
              default: out_low = 9'h000;
            endcase
          end
          6'h04: begin
            case (mant[3:0])
              4'h0: out_low = 9'h063;
              4'h1: out_low = 9'h063;
              4'h2: out_low = 9'h063;
              4'h3: out_low = 9'h063;
              4'h4: out_low = 9'h063;
              4'h5: out_low = 9'h063;
              4'h6: out_low = 9'h063;
              4'h7: out_low = 9'h063;
              4'h8: out_low = 9'h064;
              4'h9: out_low = 9'h064;
              4'ha: out_low = 9'h064;
              4'hb: out_low = 9'h064;
              4'hc: out_low = 9'h064;
              4'hd: out_low = 9'h064;
              4'he: out_low = 9'h064;
              4'hf: out_low = 9'h064;
              default: out_low = 9'h000;
            endcase
          end
          6'h05: begin
            case (mant[3:0])
              4'h0: out_low = 9'h064;
              4'h1: out_low = 9'h064;
              4'h2: out_low = 9'h064;
              4'h3: out_low = 9'h065;
              4'h4: out_low = 9'h065;
              4'h5: out_low = 9'h065;
              4'h6: out_low = 9'h065;
              4'h7: out_low = 9'h065;
              4'h8: out_low = 9'h065;
              4'h9: out_low = 9'h065;
              4'ha: out_low = 9'h065;
              4'hb: out_low = 9'h065;
              4'hc: out_low = 9'h065;
              4'hd: out_low = 9'h066;
              4'he: out_low = 9'h066;
              4'hf: out_low = 9'h066;
              default: out_low = 9'h000;
            endcase
          end
          6'h06: begin
            case (mant[3:0])
              4'h0: out_low = 9'h066;
              4'h1: out_low = 9'h066;
              4'h2: out_low = 9'h066;
              4'h3: out_low = 9'h066;
              4'h4: out_low = 9'h066;
              4'h5: out_low = 9'h066;
              4'h6: out_low = 9'h066;
              4'h7: out_low = 9'h066;
              4'h8: out_low = 9'h067;
              4'h9: out_low = 9'h067;
              4'ha: out_low = 9'h067;
              4'hb: out_low = 9'h067;
              4'hc: out_low = 9'h067;
              4'hd: out_low = 9'h067;
              4'he: out_low = 9'h067;
              4'hf: out_low = 9'h067;
              default: out_low = 9'h000;
            endcase
          end
          6'h07: begin
            case (mant[3:0])
              4'h0: out_low = 9'h067;
              4'h1: out_low = 9'h067;
              4'h2: out_low = 9'h068;
              4'h3: out_low = 9'h068;
              4'h4: out_low = 9'h068;
              4'h5: out_low = 9'h068;
              4'h6: out_low = 9'h068;
              4'h7: out_low = 9'h068;
              4'h8: out_low = 9'h068;
              4'h9: out_low = 9'h068;
              4'ha: out_low = 9'h068;
              4'hb: out_low = 9'h068;
              4'hc: out_low = 9'h068;
              4'hd: out_low = 9'h069;
              4'he: out_low = 9'h069;
              4'hf: out_low = 9'h069;
              default: out_low = 9'h000;
            endcase
          end
          6'h08: begin
            case (mant[3:0])
              4'h0: out_low = 9'h069;
              4'h1: out_low = 9'h069;
              4'h2: out_low = 9'h069;
              4'h3: out_low = 9'h069;
              4'h4: out_low = 9'h069;
              4'h5: out_low = 9'h069;
              4'h6: out_low = 9'h069;
              4'h7: out_low = 9'h06a;
              4'h8: out_low = 9'h06a;
              4'h9: out_low = 9'h06a;
              4'ha: out_low = 9'h06a;
              4'hb: out_low = 9'h06a;
              4'hc: out_low = 9'h06a;
              4'hd: out_low = 9'h06a;
              4'he: out_low = 9'h06a;
              4'hf: out_low = 9'h06a;
              default: out_low = 9'h000;
            endcase
          end
          6'h09: begin
            case (mant[3:0])
              4'h0: out_low = 9'h06a;
              4'h1: out_low = 9'h06a;
              4'h2: out_low = 9'h06b;
              4'h3: out_low = 9'h06b;
              4'h4: out_low = 9'h06b;
              4'h5: out_low = 9'h06b;
              4'h6: out_low = 9'h06b;
              4'h7: out_low = 9'h06b;
              4'h8: out_low = 9'h06b;
              4'h9: out_low = 9'h06b;
              4'ha: out_low = 9'h06b;
              4'hb: out_low = 9'h06b;
              4'hc: out_low = 9'h06c;
              4'hd: out_low = 9'h06c;
              4'he: out_low = 9'h06c;
              4'hf: out_low = 9'h06c;
              default: out_low = 9'h000;
            endcase
          end
          6'h0a: begin
            case (mant[3:0])
              4'h0: out_low = 9'h06c;
              4'h1: out_low = 9'h06c;
              4'h2: out_low = 9'h06c;
              4'h3: out_low = 9'h06c;
              4'h4: out_low = 9'h06c;
              4'h5: out_low = 9'h06c;
              4'h6: out_low = 9'h06c;
              4'h7: out_low = 9'h06d;
              4'h8: out_low = 9'h06d;
              4'h9: out_low = 9'h06d;
              4'ha: out_low = 9'h06d;
              4'hb: out_low = 9'h06d;
              4'hc: out_low = 9'h06d;
              4'hd: out_low = 9'h06d;
              4'he: out_low = 9'h06d;
              4'hf: out_low = 9'h06d;
              default: out_low = 9'h000;
            endcase
          end
          6'h0b: begin
            case (mant[3:0])
              4'h0: out_low = 9'h06d;
              4'h1: out_low = 9'h06e;
              4'h2: out_low = 9'h06e;
              4'h3: out_low = 9'h06e;
              4'h4: out_low = 9'h06e;
              4'h5: out_low = 9'h06e;
              4'h6: out_low = 9'h06e;
              4'h7: out_low = 9'h06e;
              4'h8: out_low = 9'h06e;
              4'h9: out_low = 9'h06e;
              4'ha: out_low = 9'h06e;
              4'hb: out_low = 9'h06e;
              4'hc: out_low = 9'h06f;
              4'hd: out_low = 9'h06f;
              4'he: out_low = 9'h06f;
              4'hf: out_low = 9'h06f;
              default: out_low = 9'h000;
            endcase
          end
          6'h0c: begin
            case (mant[3:0])
              4'h0: out_low = 9'h06f;
              4'h1: out_low = 9'h06f;
              4'h2: out_low = 9'h06f;
              4'h3: out_low = 9'h06f;
              4'h4: out_low = 9'h06f;
              4'h5: out_low = 9'h06f;
              4'h6: out_low = 9'h070;
              4'h7: out_low = 9'h070;
              4'h8: out_low = 9'h070;
              4'h9: out_low = 9'h070;
              4'ha: out_low = 9'h070;
              4'hb: out_low = 9'h070;
              4'hc: out_low = 9'h070;
              4'hd: out_low = 9'h070;
              4'he: out_low = 9'h070;
              4'hf: out_low = 9'h070;
              default: out_low = 9'h000;
            endcase
          end
          6'h0d: begin
            case (mant[3:0])
              4'h0: out_low = 9'h071;
              4'h1: out_low = 9'h071;
              4'h2: out_low = 9'h071;
              4'h3: out_low = 9'h071;
              4'h4: out_low = 9'h071;
              4'h5: out_low = 9'h071;
              4'h6: out_low = 9'h071;
              4'h7: out_low = 9'h071;
              4'h8: out_low = 9'h071;
              4'h9: out_low = 9'h071;
              4'ha: out_low = 9'h071;
              4'hb: out_low = 9'h072;
              4'hc: out_low = 9'h072;
              4'hd: out_low = 9'h072;
              4'he: out_low = 9'h072;
              4'hf: out_low = 9'h072;
              default: out_low = 9'h000;
            endcase
          end
          6'h0e: begin
            case (mant[3:0])
              4'h0: out_low = 9'h072;
              4'h1: out_low = 9'h072;
              4'h2: out_low = 9'h072;
              4'h3: out_low = 9'h072;
              4'h4: out_low = 9'h072;
              4'h5: out_low = 9'h073;
              4'h6: out_low = 9'h073;
              4'h7: out_low = 9'h073;
              4'h8: out_low = 9'h073;
              4'h9: out_low = 9'h073;
              4'ha: out_low = 9'h073;
              4'hb: out_low = 9'h073;
              4'hc: out_low = 9'h073;
              4'hd: out_low = 9'h073;
              4'he: out_low = 9'h073;
              4'hf: out_low = 9'h073;
              default: out_low = 9'h000;
            endcase
          end
          6'h0f: begin
            case (mant[3:0])
              4'h0: out_low = 9'h074;
              4'h1: out_low = 9'h074;
              4'h2: out_low = 9'h074;
              4'h3: out_low = 9'h074;
              4'h4: out_low = 9'h074;
              4'h5: out_low = 9'h074;
              4'h6: out_low = 9'h074;
              4'h7: out_low = 9'h074;
              4'h8: out_low = 9'h074;
              4'h9: out_low = 9'h074;
              4'ha: out_low = 9'h075;
              4'hb: out_low = 9'h075;
              4'hc: out_low = 9'h075;
              4'hd: out_low = 9'h075;
              4'he: out_low = 9'h075;
              4'hf: out_low = 9'h075;
              default: out_low = 9'h000;
            endcase
          end
          6'h10: begin
            case (mant[3:0])
              4'h0: out_low = 9'h075;
              4'h1: out_low = 9'h075;
              4'h2: out_low = 9'h075;
              4'h3: out_low = 9'h075;
              4'h4: out_low = 9'h076;
              4'h5: out_low = 9'h076;
              4'h6: out_low = 9'h076;
              4'h7: out_low = 9'h076;
              4'h8: out_low = 9'h076;
              4'h9: out_low = 9'h076;
              4'ha: out_low = 9'h076;
              4'hb: out_low = 9'h076;
              4'hc: out_low = 9'h076;
              4'hd: out_low = 9'h076;
              4'he: out_low = 9'h076;
              4'hf: out_low = 9'h077;
              default: out_low = 9'h000;
            endcase
          end
          6'h11: begin
            case (mant[3:0])
              4'h0: out_low = 9'h077;
              4'h1: out_low = 9'h077;
              4'h2: out_low = 9'h077;
              4'h3: out_low = 9'h077;
              4'h4: out_low = 9'h077;
              4'h5: out_low = 9'h077;
              4'h6: out_low = 9'h077;
              4'h7: out_low = 9'h077;
              4'h8: out_low = 9'h077;
              4'h9: out_low = 9'h078;
              4'ha: out_low = 9'h078;
              4'hb: out_low = 9'h078;
              4'hc: out_low = 9'h078;
              4'hd: out_low = 9'h078;
              4'he: out_low = 9'h078;
              4'hf: out_low = 9'h078;
              default: out_low = 9'h000;
            endcase
          end
          6'h12: begin
            case (mant[3:0])
              4'h0: out_low = 9'h078;
              4'h1: out_low = 9'h078;
              4'h2: out_low = 9'h078;
              4'h3: out_low = 9'h079;
              4'h4: out_low = 9'h079;
              4'h5: out_low = 9'h079;
              4'h6: out_low = 9'h079;
              4'h7: out_low = 9'h079;
              4'h8: out_low = 9'h079;
              4'h9: out_low = 9'h079;
              4'ha: out_low = 9'h079;
              4'hb: out_low = 9'h079;
              4'hc: out_low = 9'h079;
              4'hd: out_low = 9'h079;
              4'he: out_low = 9'h07a;
              4'hf: out_low = 9'h07a;
              default: out_low = 9'h000;
            endcase
          end
          6'h13: begin
            case (mant[3:0])
              4'h0: out_low = 9'h07a;
              4'h1: out_low = 9'h07a;
              4'h2: out_low = 9'h07a;
              4'h3: out_low = 9'h07a;
              4'h4: out_low = 9'h07a;
              4'h5: out_low = 9'h07a;
              4'h6: out_low = 9'h07a;
              4'h7: out_low = 9'h07a;
              4'h8: out_low = 9'h07b;
              4'h9: out_low = 9'h07b;
              4'ha: out_low = 9'h07b;
              4'hb: out_low = 9'h07b;
              4'hc: out_low = 9'h07b;
              4'hd: out_low = 9'h07b;
              4'he: out_low = 9'h07b;
              4'hf: out_low = 9'h07b;
              default: out_low = 9'h000;
            endcase
          end
          6'h14: begin
            case (mant[3:0])
              4'h0: out_low = 9'h07b;
              4'h1: out_low = 9'h07b;
              4'h2: out_low = 9'h07c;
              4'h3: out_low = 9'h07c;
              4'h4: out_low = 9'h07c;
              4'h5: out_low = 9'h07c;
              4'h6: out_low = 9'h07c;
              4'h7: out_low = 9'h07c;
              4'h8: out_low = 9'h07c;
              4'h9: out_low = 9'h07c;
              4'ha: out_low = 9'h07c;
              4'hb: out_low = 9'h07c;
              4'hc: out_low = 9'h07c;
              4'hd: out_low = 9'h07d;
              4'he: out_low = 9'h07d;
              4'hf: out_low = 9'h07d;
              default: out_low = 9'h000;
            endcase
          end
          6'h15: begin
            case (mant[3:0])
              4'h0: out_low = 9'h07d;
              4'h1: out_low = 9'h07d;
              4'h2: out_low = 9'h07d;
              4'h3: out_low = 9'h07d;
              4'h4: out_low = 9'h07d;
              4'h5: out_low = 9'h07d;
              4'h6: out_low = 9'h07d;
              4'h7: out_low = 9'h07e;
              4'h8: out_low = 9'h07e;
              4'h9: out_low = 9'h07e;
              4'ha: out_low = 9'h07e;
              4'hb: out_low = 9'h07e;
              4'hc: out_low = 9'h07e;
              4'hd: out_low = 9'h07e;
              4'he: out_low = 9'h07e;
              4'hf: out_low = 9'h07e;
              default: out_low = 9'h000;
            endcase
          end
          6'h16: begin
            case (mant[3:0])
              4'h0: out_low = 9'h07e;
              4'h1: out_low = 9'h07f;
              4'h2: out_low = 9'h07f;
              4'h3: out_low = 9'h07f;
              4'h4: out_low = 9'h07f;
              4'h5: out_low = 9'h07f;
              4'h6: out_low = 9'h07f;
              4'h7: out_low = 9'h07f;
              4'h8: out_low = 9'h07f;
              4'h9: out_low = 9'h07f;
              4'ha: out_low = 9'h07f;
              4'hb: out_low = 9'h080;
              4'hc: out_low = 9'h080;
              4'hd: out_low = 9'h080;
              4'he: out_low = 9'h080;
              4'hf: out_low = 9'h080;
              default: out_low = 9'h000;
            endcase
          end
          6'h17: begin
            case (mant[3:0])
              4'h0: out_low = 9'h080;
              4'h1: out_low = 9'h080;
              4'h2: out_low = 9'h080;
              4'h3: out_low = 9'h080;
              4'h4: out_low = 9'h080;
              4'h5: out_low = 9'h080;
              4'h6: out_low = 9'h081;
              4'h7: out_low = 9'h081;
              4'h8: out_low = 9'h081;
              4'h9: out_low = 9'h081;
              4'ha: out_low = 9'h081;
              4'hb: out_low = 9'h081;
              4'hc: out_low = 9'h081;
              4'hd: out_low = 9'h081;
              4'he: out_low = 9'h081;
              4'hf: out_low = 9'h081;
              default: out_low = 9'h000;
            endcase
          end
          6'h18: begin
            case (mant[3:0])
              4'h0: out_low = 9'h082;
              4'h1: out_low = 9'h082;
              4'h2: out_low = 9'h082;
              4'h3: out_low = 9'h082;
              4'h4: out_low = 9'h082;
              4'h5: out_low = 9'h082;
              4'h6: out_low = 9'h082;
              4'h7: out_low = 9'h082;
              4'h8: out_low = 9'h082;
              4'h9: out_low = 9'h082;
              4'ha: out_low = 9'h083;
              4'hb: out_low = 9'h083;
              4'hc: out_low = 9'h083;
              4'hd: out_low = 9'h083;
              4'he: out_low = 9'h083;
              4'hf: out_low = 9'h083;
              default: out_low = 9'h000;
            endcase
          end
          6'h19: begin
            case (mant[3:0])
              4'h0: out_low = 9'h083;
              4'h1: out_low = 9'h083;
              4'h2: out_low = 9'h083;
              4'h3: out_low = 9'h083;
              4'h4: out_low = 9'h084;
              4'h5: out_low = 9'h084;
              4'h6: out_low = 9'h084;
              4'h7: out_low = 9'h084;
              4'h8: out_low = 9'h084;
              4'h9: out_low = 9'h084;
              4'ha: out_low = 9'h084;
              4'hb: out_low = 9'h084;
              4'hc: out_low = 9'h084;
              4'hd: out_low = 9'h084;
              4'he: out_low = 9'h084;
              4'hf: out_low = 9'h085;
              default: out_low = 9'h000;
            endcase
          end
          6'h1a: begin
            case (mant[3:0])
              4'h0: out_low = 9'h085;
              4'h1: out_low = 9'h085;
              4'h2: out_low = 9'h085;
              4'h3: out_low = 9'h085;
              4'h4: out_low = 9'h085;
              4'h5: out_low = 9'h085;
              4'h6: out_low = 9'h085;
              4'h7: out_low = 9'h085;
              4'h8: out_low = 9'h085;
              4'h9: out_low = 9'h086;
              4'ha: out_low = 9'h086;
              4'hb: out_low = 9'h086;
              4'hc: out_low = 9'h086;
              4'hd: out_low = 9'h086;
              4'he: out_low = 9'h086;
              4'hf: out_low = 9'h086;
              default: out_low = 9'h000;
            endcase
          end
          6'h1b: begin
            case (mant[3:0])
              4'h0: out_low = 9'h086;
              4'h1: out_low = 9'h086;
              4'h2: out_low = 9'h086;
              4'h3: out_low = 9'h087;
              4'h4: out_low = 9'h087;
              4'h5: out_low = 9'h087;
              4'h6: out_low = 9'h087;
              4'h7: out_low = 9'h087;
              4'h8: out_low = 9'h087;
              4'h9: out_low = 9'h087;
              4'ha: out_low = 9'h087;
              4'hb: out_low = 9'h087;
              4'hc: out_low = 9'h087;
              4'hd: out_low = 9'h088;
              4'he: out_low = 9'h088;
              4'hf: out_low = 9'h088;
              default: out_low = 9'h000;
            endcase
          end
          6'h1c: begin
            case (mant[3:0])
              4'h0: out_low = 9'h088;
              4'h1: out_low = 9'h088;
              4'h2: out_low = 9'h088;
              4'h3: out_low = 9'h088;
              4'h4: out_low = 9'h088;
              4'h5: out_low = 9'h088;
              4'h6: out_low = 9'h088;
              4'h7: out_low = 9'h089;
              4'h8: out_low = 9'h089;
              4'h9: out_low = 9'h089;
              4'ha: out_low = 9'h089;
              4'hb: out_low = 9'h089;
              4'hc: out_low = 9'h089;
              4'hd: out_low = 9'h089;
              4'he: out_low = 9'h089;
              4'hf: out_low = 9'h089;
              default: out_low = 9'h000;
            endcase
          end
          6'h1d: begin
            case (mant[3:0])
              4'h0: out_low = 9'h089;
              4'h1: out_low = 9'h089;
              4'h2: out_low = 9'h08a;
              4'h3: out_low = 9'h08a;
              4'h4: out_low = 9'h08a;
              4'h5: out_low = 9'h08a;
              4'h6: out_low = 9'h08a;
              4'h7: out_low = 9'h08a;
              4'h8: out_low = 9'h08a;
              4'h9: out_low = 9'h08a;
              4'ha: out_low = 9'h08a;
              4'hb: out_low = 9'h08a;
              4'hc: out_low = 9'h08b;
              4'hd: out_low = 9'h08b;
              4'he: out_low = 9'h08b;
              4'hf: out_low = 9'h08b;
              default: out_low = 9'h000;
            endcase
          end
          6'h1e: begin
            case (mant[3:0])
              4'h0: out_low = 9'h08b;
              4'h1: out_low = 9'h08b;
              4'h2: out_low = 9'h08b;
              4'h3: out_low = 9'h08b;
              4'h4: out_low = 9'h08b;
              4'h5: out_low = 9'h08b;
              4'h6: out_low = 9'h08c;
              4'h7: out_low = 9'h08c;
              4'h8: out_low = 9'h08c;
              4'h9: out_low = 9'h08c;
              4'ha: out_low = 9'h08c;
              4'hb: out_low = 9'h08c;
              4'hc: out_low = 9'h08c;
              4'hd: out_low = 9'h08c;
              4'he: out_low = 9'h08c;
              4'hf: out_low = 9'h08c;
              default: out_low = 9'h000;
            endcase
          end
          6'h1f: begin
            case (mant[3:0])
              4'h0: out_low = 9'h08d;
              4'h1: out_low = 9'h08d;
              4'h2: out_low = 9'h08d;
              4'h3: out_low = 9'h08d;
              4'h4: out_low = 9'h08d;
              4'h5: out_low = 9'h08d;
              4'h6: out_low = 9'h08d;
              4'h7: out_low = 9'h08d;
              4'h8: out_low = 9'h08d;
              4'h9: out_low = 9'h08d;
              4'ha: out_low = 9'h08e;
              4'hb: out_low = 9'h08e;
              4'hc: out_low = 9'h08e;
              4'hd: out_low = 9'h08e;
              4'he: out_low = 9'h08e;
              4'hf: out_low = 9'h08e;
              default: out_low = 9'h000;
            endcase
          end
          6'h20: begin
            case (mant[3:0])
              4'h0: out_low = 9'h08e;
              4'h1: out_low = 9'h08e;
              4'h2: out_low = 9'h08e;
              4'h3: out_low = 9'h08e;
              4'h4: out_low = 9'h08f;
              4'h5: out_low = 9'h08f;
              4'h6: out_low = 9'h08f;
              4'h7: out_low = 9'h08f;
              4'h8: out_low = 9'h08f;
              4'h9: out_low = 9'h08f;
              4'ha: out_low = 9'h08f;
              4'hb: out_low = 9'h08f;
              4'hc: out_low = 9'h08f;
              4'hd: out_low = 9'h08f;
              4'he: out_low = 9'h090;
              4'hf: out_low = 9'h090;
              default: out_low = 9'h000;
            endcase
          end
          6'h21: begin
            case (mant[3:0])
              4'h0: out_low = 9'h090;
              4'h1: out_low = 9'h090;
              4'h2: out_low = 9'h090;
              4'h3: out_low = 9'h090;
              4'h4: out_low = 9'h090;
              4'h5: out_low = 9'h090;
              4'h6: out_low = 9'h090;
              4'h7: out_low = 9'h090;
              4'h8: out_low = 9'h090;
              4'h9: out_low = 9'h091;
              4'ha: out_low = 9'h091;
              4'hb: out_low = 9'h091;
              4'hc: out_low = 9'h091;
              4'hd: out_low = 9'h091;
              4'he: out_low = 9'h091;
              4'hf: out_low = 9'h091;
              default: out_low = 9'h000;
            endcase
          end
          6'h22: begin
            case (mant[3:0])
              4'h0: out_low = 9'h091;
              4'h1: out_low = 9'h091;
              4'h2: out_low = 9'h091;
              4'h3: out_low = 9'h092;
              4'h4: out_low = 9'h092;
              4'h5: out_low = 9'h092;
              4'h6: out_low = 9'h092;
              4'h7: out_low = 9'h092;
              4'h8: out_low = 9'h092;
              4'h9: out_low = 9'h092;
              4'ha: out_low = 9'h092;
              4'hb: out_low = 9'h092;
              4'hc: out_low = 9'h092;
              4'hd: out_low = 9'h093;
              4'he: out_low = 9'h093;
              4'hf: out_low = 9'h093;
              default: out_low = 9'h000;
            endcase
          end
          6'h23: begin
            case (mant[3:0])
              4'h0: out_low = 9'h093;
              4'h1: out_low = 9'h093;
              4'h2: out_low = 9'h093;
              4'h3: out_low = 9'h093;
              4'h4: out_low = 9'h093;
              4'h5: out_low = 9'h093;
              4'h6: out_low = 9'h093;
              4'h7: out_low = 9'h094;
              4'h8: out_low = 9'h094;
              4'h9: out_low = 9'h094;
              4'ha: out_low = 9'h094;
              4'hb: out_low = 9'h094;
              4'hc: out_low = 9'h094;
              4'hd: out_low = 9'h094;
              4'he: out_low = 9'h094;
              4'hf: out_low = 9'h094;
              default: out_low = 9'h000;
            endcase
          end
          6'h24: begin
            case (mant[3:0])
              4'h0: out_low = 9'h094;
              4'h1: out_low = 9'h095;
              4'h2: out_low = 9'h095;
              4'h3: out_low = 9'h095;
              4'h4: out_low = 9'h095;
              4'h5: out_low = 9'h095;
              4'h6: out_low = 9'h095;
              4'h7: out_low = 9'h095;
              4'h8: out_low = 9'h095;
              4'h9: out_low = 9'h095;
              4'ha: out_low = 9'h095;
              4'hb: out_low = 9'h096;
              4'hc: out_low = 9'h096;
              4'hd: out_low = 9'h096;
              4'he: out_low = 9'h096;
              4'hf: out_low = 9'h096;
              default: out_low = 9'h000;
            endcase
          end
          6'h25: begin
            case (mant[3:0])
              4'h0: out_low = 9'h096;
              4'h1: out_low = 9'h096;
              4'h2: out_low = 9'h096;
              4'h3: out_low = 9'h096;
              4'h4: out_low = 9'h096;
              4'h5: out_low = 9'h097;
              4'h6: out_low = 9'h097;
              4'h7: out_low = 9'h097;
              4'h8: out_low = 9'h097;
              4'h9: out_low = 9'h097;
              4'ha: out_low = 9'h097;
              4'hb: out_low = 9'h097;
              4'hc: out_low = 9'h097;
              4'hd: out_low = 9'h097;
              4'he: out_low = 9'h097;
              4'hf: out_low = 9'h098;
              default: out_low = 9'h000;
            endcase
          end
          6'h26: begin
            case (mant[3:0])
              4'h0: out_low = 9'h098;
              4'h1: out_low = 9'h098;
              4'h2: out_low = 9'h098;
              4'h3: out_low = 9'h098;
              4'h4: out_low = 9'h098;
              4'h5: out_low = 9'h098;
              4'h6: out_low = 9'h098;
              4'h7: out_low = 9'h098;
              4'h8: out_low = 9'h098;
              4'h9: out_low = 9'h099;
              4'ha: out_low = 9'h099;
              4'hb: out_low = 9'h099;
              4'hc: out_low = 9'h099;
              4'hd: out_low = 9'h099;
              4'he: out_low = 9'h099;
              4'hf: out_low = 9'h099;
              default: out_low = 9'h000;
            endcase
          end
          6'h27: begin
            case (mant[3:0])
              4'h0: out_low = 9'h099;
              4'h1: out_low = 9'h099;
              4'h2: out_low = 9'h099;
              4'h3: out_low = 9'h09a;
              4'h4: out_low = 9'h09a;
              4'h5: out_low = 9'h09a;
              4'h6: out_low = 9'h09a;
              4'h7: out_low = 9'h09a;
              4'h8: out_low = 9'h09a;
              4'h9: out_low = 9'h09a;
              4'ha: out_low = 9'h09a;
              4'hb: out_low = 9'h09a;
              4'hc: out_low = 9'h09a;
              4'hd: out_low = 9'h09b;
              4'he: out_low = 9'h09b;
              4'hf: out_low = 9'h09b;
              default: out_low = 9'h000;
            endcase
          end
          6'h28: begin
            case (mant[3:0])
              4'h0: out_low = 9'h09b;
              4'h1: out_low = 9'h09b;
              4'h2: out_low = 9'h09b;
              4'h3: out_low = 9'h09b;
              4'h4: out_low = 9'h09b;
              4'h5: out_low = 9'h09b;
              4'h6: out_low = 9'h09b;
              4'h7: out_low = 9'h09c;
              4'h8: out_low = 9'h09c;
              4'h9: out_low = 9'h09c;
              4'ha: out_low = 9'h09c;
              4'hb: out_low = 9'h09c;
              4'hc: out_low = 9'h09c;
              4'hd: out_low = 9'h09c;
              4'he: out_low = 9'h09c;
              4'hf: out_low = 9'h09c;
              default: out_low = 9'h000;
            endcase
          end
          6'h29: begin
            case (mant[3:0])
              4'h0: out_low = 9'h09c;
              4'h1: out_low = 9'h09d;
              4'h2: out_low = 9'h09d;
              4'h3: out_low = 9'h09d;
              4'h4: out_low = 9'h09d;
              4'h5: out_low = 9'h09d;
              4'h6: out_low = 9'h09d;
              4'h7: out_low = 9'h09d;
              4'h8: out_low = 9'h09d;
              4'h9: out_low = 9'h09d;
              4'ha: out_low = 9'h09d;
              4'hb: out_low = 9'h09e;
              4'hc: out_low = 9'h09e;
              4'hd: out_low = 9'h09e;
              4'he: out_low = 9'h09e;
              4'hf: out_low = 9'h09e;
              default: out_low = 9'h000;
            endcase
          end
          6'h2a: begin
            case (mant[3:0])
              4'h0: out_low = 9'h09e;
              4'h1: out_low = 9'h09e;
              4'h2: out_low = 9'h09e;
              4'h3: out_low = 9'h09e;
              4'h4: out_low = 9'h09e;
              4'h5: out_low = 9'h09f;
              4'h6: out_low = 9'h09f;
              4'h7: out_low = 9'h09f;
              4'h8: out_low = 9'h09f;
              4'h9: out_low = 9'h09f;
              4'ha: out_low = 9'h09f;
              4'hb: out_low = 9'h09f;
              4'hc: out_low = 9'h09f;
              4'hd: out_low = 9'h09f;
              4'he: out_low = 9'h09f;
              4'hf: out_low = 9'h0a0;
              default: out_low = 9'h000;
            endcase
          end
          6'h2b: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0a0;
              4'h1: out_low = 9'h0a0;
              4'h2: out_low = 9'h0a0;
              4'h3: out_low = 9'h0a0;
              4'h4: out_low = 9'h0a0;
              4'h5: out_low = 9'h0a0;
              4'h6: out_low = 9'h0a0;
              4'h7: out_low = 9'h0a0;
              4'h8: out_low = 9'h0a0;
              4'h9: out_low = 9'h0a1;
              4'ha: out_low = 9'h0a1;
              4'hb: out_low = 9'h0a1;
              4'hc: out_low = 9'h0a1;
              4'hd: out_low = 9'h0a1;
              4'he: out_low = 9'h0a1;
              4'hf: out_low = 9'h0a1;
              default: out_low = 9'h000;
            endcase
          end
          6'h2c: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0a1;
              4'h1: out_low = 9'h0a1;
              4'h2: out_low = 9'h0a1;
              4'h3: out_low = 9'h0a2;
              4'h4: out_low = 9'h0a2;
              4'h5: out_low = 9'h0a2;
              4'h6: out_low = 9'h0a2;
              4'h7: out_low = 9'h0a2;
              4'h8: out_low = 9'h0a2;
              4'h9: out_low = 9'h0a2;
              4'ha: out_low = 9'h0a2;
              4'hb: out_low = 9'h0a2;
              4'hc: out_low = 9'h0a2;
              4'hd: out_low = 9'h0a3;
              4'he: out_low = 9'h0a3;
              4'hf: out_low = 9'h0a3;
              default: out_low = 9'h000;
            endcase
          end
          6'h2d: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0a3;
              4'h1: out_low = 9'h0a3;
              4'h2: out_low = 9'h0a3;
              4'h3: out_low = 9'h0a3;
              4'h4: out_low = 9'h0a3;
              4'h5: out_low = 9'h0a3;
              4'h6: out_low = 9'h0a3;
              4'h7: out_low = 9'h0a4;
              4'h8: out_low = 9'h0a4;
              4'h9: out_low = 9'h0a4;
              4'ha: out_low = 9'h0a4;
              4'hb: out_low = 9'h0a4;
              4'hc: out_low = 9'h0a4;
              4'hd: out_low = 9'h0a4;
              4'he: out_low = 9'h0a4;
              4'hf: out_low = 9'h0a4;
              default: out_low = 9'h000;
            endcase
          end
          6'h2e: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0a4;
              4'h1: out_low = 9'h0a5;
              4'h2: out_low = 9'h0a5;
              4'h3: out_low = 9'h0a5;
              4'h4: out_low = 9'h0a5;
              4'h5: out_low = 9'h0a5;
              4'h6: out_low = 9'h0a5;
              4'h7: out_low = 9'h0a5;
              4'h8: out_low = 9'h0a5;
              4'h9: out_low = 9'h0a5;
              4'ha: out_low = 9'h0a5;
              4'hb: out_low = 9'h0a6;
              4'hc: out_low = 9'h0a6;
              4'hd: out_low = 9'h0a6;
              4'he: out_low = 9'h0a6;
              4'hf: out_low = 9'h0a6;
              default: out_low = 9'h000;
            endcase
          end
          6'h2f: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0a6;
              4'h1: out_low = 9'h0a6;
              4'h2: out_low = 9'h0a6;
              4'h3: out_low = 9'h0a6;
              4'h4: out_low = 9'h0a6;
              4'h5: out_low = 9'h0a7;
              4'h6: out_low = 9'h0a7;
              4'h7: out_low = 9'h0a7;
              4'h8: out_low = 9'h0a7;
              4'h9: out_low = 9'h0a7;
              4'ha: out_low = 9'h0a7;
              4'hb: out_low = 9'h0a7;
              4'hc: out_low = 9'h0a7;
              4'hd: out_low = 9'h0a7;
              4'he: out_low = 9'h0a7;
              4'hf: out_low = 9'h0a8;
              default: out_low = 9'h000;
            endcase
          end
          6'h30: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0a8;
              4'h1: out_low = 9'h0a8;
              4'h2: out_low = 9'h0a8;
              4'h3: out_low = 9'h0a8;
              4'h4: out_low = 9'h0a8;
              4'h5: out_low = 9'h0a8;
              4'h6: out_low = 9'h0a8;
              4'h7: out_low = 9'h0a8;
              4'h8: out_low = 9'h0a8;
              4'h9: out_low = 9'h0a9;
              4'ha: out_low = 9'h0a9;
              4'hb: out_low = 9'h0a9;
              4'hc: out_low = 9'h0a9;
              4'hd: out_low = 9'h0a9;
              4'he: out_low = 9'h0a9;
              4'hf: out_low = 9'h0a9;
              default: out_low = 9'h000;
            endcase
          end
          6'h31: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0a9;
              4'h1: out_low = 9'h0a9;
              4'h2: out_low = 9'h0a9;
              4'h3: out_low = 9'h0aa;
              4'h4: out_low = 9'h0aa;
              4'h5: out_low = 9'h0aa;
              4'h6: out_low = 9'h0aa;
              4'h7: out_low = 9'h0aa;
              4'h8: out_low = 9'h0aa;
              4'h9: out_low = 9'h0aa;
              4'ha: out_low = 9'h0aa;
              4'hb: out_low = 9'h0aa;
              4'hc: out_low = 9'h0aa;
              4'hd: out_low = 9'h0ab;
              4'he: out_low = 9'h0ab;
              4'hf: out_low = 9'h0ab;
              default: out_low = 9'h000;
            endcase
          end
          6'h32: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0ab;
              4'h1: out_low = 9'h0ab;
              4'h2: out_low = 9'h0ab;
              4'h3: out_low = 9'h0ab;
              4'h4: out_low = 9'h0ab;
              4'h5: out_low = 9'h0ab;
              4'h6: out_low = 9'h0ab;
              4'h7: out_low = 9'h0ac;
              4'h8: out_low = 9'h0ac;
              4'h9: out_low = 9'h0ac;
              4'ha: out_low = 9'h0ac;
              4'hb: out_low = 9'h0ac;
              4'hc: out_low = 9'h0ac;
              4'hd: out_low = 9'h0ac;
              4'he: out_low = 9'h0ac;
              4'hf: out_low = 9'h0ac;
              default: out_low = 9'h000;
            endcase
          end
          6'h33: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0ad;
              4'h1: out_low = 9'h0ad;
              4'h2: out_low = 9'h0ad;
              4'h3: out_low = 9'h0ad;
              4'h4: out_low = 9'h0ad;
              4'h5: out_low = 9'h0ad;
              4'h6: out_low = 9'h0ad;
              4'h7: out_low = 9'h0ad;
              4'h8: out_low = 9'h0ad;
              4'h9: out_low = 9'h0ad;
              4'ha: out_low = 9'h0ae;
              4'hb: out_low = 9'h0ae;
              4'hc: out_low = 9'h0ae;
              4'hd: out_low = 9'h0ae;
              4'he: out_low = 9'h0ae;
              4'hf: out_low = 9'h0ae;
              default: out_low = 9'h000;
            endcase
          end
          6'h34: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0ae;
              4'h1: out_low = 9'h0ae;
              4'h2: out_low = 9'h0ae;
              4'h3: out_low = 9'h0ae;
              4'h4: out_low = 9'h0af;
              4'h5: out_low = 9'h0af;
              4'h6: out_low = 9'h0af;
              4'h7: out_low = 9'h0af;
              4'h8: out_low = 9'h0af;
              4'h9: out_low = 9'h0af;
              4'ha: out_low = 9'h0af;
              4'hb: out_low = 9'h0af;
              4'hc: out_low = 9'h0af;
              4'hd: out_low = 9'h0af;
              4'he: out_low = 9'h0b0;
              4'hf: out_low = 9'h0b0;
              default: out_low = 9'h000;
            endcase
          end
          6'h35: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0b0;
              4'h1: out_low = 9'h0b0;
              4'h2: out_low = 9'h0b0;
              4'h3: out_low = 9'h0b0;
              4'h4: out_low = 9'h0b0;
              4'h5: out_low = 9'h0b0;
              4'h6: out_low = 9'h0b0;
              4'h7: out_low = 9'h0b0;
              4'h8: out_low = 9'h0b1;
              4'h9: out_low = 9'h0b1;
              4'ha: out_low = 9'h0b1;
              4'hb: out_low = 9'h0b1;
              4'hc: out_low = 9'h0b1;
              4'hd: out_low = 9'h0b1;
              4'he: out_low = 9'h0b1;
              4'hf: out_low = 9'h0b1;
              default: out_low = 9'h000;
            endcase
          end
          6'h36: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0b1;
              4'h1: out_low = 9'h0b1;
              4'h2: out_low = 9'h0b2;
              4'h3: out_low = 9'h0b2;
              4'h4: out_low = 9'h0b2;
              4'h5: out_low = 9'h0b2;
              4'h6: out_low = 9'h0b2;
              4'h7: out_low = 9'h0b2;
              4'h8: out_low = 9'h0b2;
              4'h9: out_low = 9'h0b2;
              4'ha: out_low = 9'h0b2;
              4'hb: out_low = 9'h0b2;
              4'hc: out_low = 9'h0b3;
              4'hd: out_low = 9'h0b3;
              4'he: out_low = 9'h0b3;
              4'hf: out_low = 9'h0b3;
              default: out_low = 9'h000;
            endcase
          end
          6'h37: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0b3;
              4'h1: out_low = 9'h0b3;
              4'h2: out_low = 9'h0b3;
              4'h3: out_low = 9'h0b3;
              4'h4: out_low = 9'h0b3;
              4'h5: out_low = 9'h0b4;
              4'h6: out_low = 9'h0b4;
              4'h7: out_low = 9'h0b4;
              4'h8: out_low = 9'h0b4;
              4'h9: out_low = 9'h0b4;
              4'ha: out_low = 9'h0b4;
              4'hb: out_low = 9'h0b4;
              4'hc: out_low = 9'h0b4;
              4'hd: out_low = 9'h0b4;
              4'he: out_low = 9'h0b4;
              4'hf: out_low = 9'h0b5;
              default: out_low = 9'h000;
            endcase
          end
          6'h38: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0b5;
              4'h1: out_low = 9'h0b5;
              4'h2: out_low = 9'h0b5;
              4'h3: out_low = 9'h0b5;
              4'h4: out_low = 9'h0b5;
              4'h5: out_low = 9'h0b5;
              4'h6: out_low = 9'h0b5;
              4'h7: out_low = 9'h0b5;
              4'h8: out_low = 9'h0b5;
              4'h9: out_low = 9'h0b6;
              4'ha: out_low = 9'h0b6;
              4'hb: out_low = 9'h0b6;
              4'hc: out_low = 9'h0b6;
              4'hd: out_low = 9'h0b6;
              4'he: out_low = 9'h0b6;
              4'hf: out_low = 9'h0b6;
              default: out_low = 9'h000;
            endcase
          end
          6'h39: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0b6;
              4'h1: out_low = 9'h0b6;
              4'h2: out_low = 9'h0b6;
              4'h3: out_low = 9'h0b7;
              4'h4: out_low = 9'h0b7;
              4'h5: out_low = 9'h0b7;
              4'h6: out_low = 9'h0b7;
              4'h7: out_low = 9'h0b7;
              4'h8: out_low = 9'h0b7;
              4'h9: out_low = 9'h0b7;
              4'ha: out_low = 9'h0b7;
              4'hb: out_low = 9'h0b7;
              4'hc: out_low = 9'h0b7;
              4'hd: out_low = 9'h0b8;
              4'he: out_low = 9'h0b8;
              4'hf: out_low = 9'h0b8;
              default: out_low = 9'h000;
            endcase
          end
          6'h3a: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0b8;
              4'h1: out_low = 9'h0b8;
              4'h2: out_low = 9'h0b8;
              4'h3: out_low = 9'h0b8;
              4'h4: out_low = 9'h0b8;
              4'h5: out_low = 9'h0b8;
              4'h6: out_low = 9'h0b9;
              4'h7: out_low = 9'h0b9;
              4'h8: out_low = 9'h0b9;
              4'h9: out_low = 9'h0b9;
              4'ha: out_low = 9'h0b9;
              4'hb: out_low = 9'h0b9;
              4'hc: out_low = 9'h0b9;
              4'hd: out_low = 9'h0b9;
              4'he: out_low = 9'h0b9;
              4'hf: out_low = 9'h0b9;
              default: out_low = 9'h000;
            endcase
          end
          6'h3b: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0ba;
              4'h1: out_low = 9'h0ba;
              4'h2: out_low = 9'h0ba;
              4'h3: out_low = 9'h0ba;
              4'h4: out_low = 9'h0ba;
              4'h5: out_low = 9'h0ba;
              4'h6: out_low = 9'h0ba;
              4'h7: out_low = 9'h0ba;
              4'h8: out_low = 9'h0ba;
              4'h9: out_low = 9'h0ba;
              4'ha: out_low = 9'h0bb;
              4'hb: out_low = 9'h0bb;
              4'hc: out_low = 9'h0bb;
              4'hd: out_low = 9'h0bb;
              4'he: out_low = 9'h0bb;
              4'hf: out_low = 9'h0bb;
              default: out_low = 9'h000;
            endcase
          end
          6'h3c: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0bb;
              4'h1: out_low = 9'h0bb;
              4'h2: out_low = 9'h0bb;
              4'h3: out_low = 9'h0bb;
              4'h4: out_low = 9'h0bc;
              4'h5: out_low = 9'h0bc;
              4'h6: out_low = 9'h0bc;
              4'h7: out_low = 9'h0bc;
              4'h8: out_low = 9'h0bc;
              4'h9: out_low = 9'h0bc;
              4'ha: out_low = 9'h0bc;
              4'hb: out_low = 9'h0bc;
              4'hc: out_low = 9'h0bc;
              4'hd: out_low = 9'h0bd;
              4'he: out_low = 9'h0bd;
              4'hf: out_low = 9'h0bd;
              default: out_low = 9'h000;
            endcase
          end
          6'h3d: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0bd;
              4'h1: out_low = 9'h0bd;
              4'h2: out_low = 9'h0bd;
              4'h3: out_low = 9'h0bd;
              4'h4: out_low = 9'h0bd;
              4'h5: out_low = 9'h0bd;
              4'h6: out_low = 9'h0bd;
              4'h7: out_low = 9'h0be;
              4'h8: out_low = 9'h0be;
              4'h9: out_low = 9'h0be;
              4'ha: out_low = 9'h0be;
              4'hb: out_low = 9'h0be;
              4'hc: out_low = 9'h0be;
              4'hd: out_low = 9'h0be;
              4'he: out_low = 9'h0be;
              4'hf: out_low = 9'h0be;
              default: out_low = 9'h000;
            endcase
          end
          6'h3e: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0be;
              4'h1: out_low = 9'h0bf;
              4'h2: out_low = 9'h0bf;
              4'h3: out_low = 9'h0bf;
              4'h4: out_low = 9'h0bf;
              4'h5: out_low = 9'h0bf;
              4'h6: out_low = 9'h0bf;
              4'h7: out_low = 9'h0bf;
              4'h8: out_low = 9'h0bf;
              4'h9: out_low = 9'h0bf;
              4'ha: out_low = 9'h0bf;
              4'hb: out_low = 9'h0c0;
              4'hc: out_low = 9'h0c0;
              4'hd: out_low = 9'h0c0;
              4'he: out_low = 9'h0c0;
              4'hf: out_low = 9'h0c0;
              default: out_low = 9'h000;
            endcase
          end
          6'h3f: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0c0;
              4'h1: out_low = 9'h0c0;
              4'h2: out_low = 9'h0c0;
              4'h3: out_low = 9'h0c0;
              4'h4: out_low = 9'h0c1;
              4'h5: out_low = 9'h0c1;
              4'h6: out_low = 9'h0c1;
              4'h7: out_low = 9'h0c1;
              4'h8: out_low = 9'h0c1;
              4'h9: out_low = 9'h0c1;
              4'ha: out_low = 9'h0c1;
              4'hb: out_low = 9'h0c1;
              4'hc: out_low = 9'h0c1;
              4'hd: out_low = 9'h0c1;
              4'he: out_low = 9'h0c2;
              4'hf: out_low = 9'h0c2;
              default: out_low = 9'h000;
            endcase
          end
          default: out_low = 9'h000;
        endcase
      end
      6'h0d: begin
        case (mant[9:4])
          6'h00: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0c2;
              4'h1: out_low = 9'h0c2;
              4'h2: out_low = 9'h0c2;
              4'h3: out_low = 9'h0c2;
              4'h4: out_low = 9'h0c3;
              4'h5: out_low = 9'h0c3;
              4'h6: out_low = 9'h0c3;
              4'h7: out_low = 9'h0c3;
              4'h8: out_low = 9'h0c3;
              4'h9: out_low = 9'h0c4;
              4'ha: out_low = 9'h0c4;
              4'hb: out_low = 9'h0c4;
              4'hc: out_low = 9'h0c4;
              4'hd: out_low = 9'h0c4;
              4'he: out_low = 9'h0c5;
              4'hf: out_low = 9'h0c5;
              default: out_low = 9'h000;
            endcase
          end
          6'h01: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0c5;
              4'h1: out_low = 9'h0c5;
              4'h2: out_low = 9'h0c5;
              4'h3: out_low = 9'h0c6;
              4'h4: out_low = 9'h0c6;
              4'h5: out_low = 9'h0c6;
              4'h6: out_low = 9'h0c6;
              4'h7: out_low = 9'h0c6;
              4'h8: out_low = 9'h0c7;
              4'h9: out_low = 9'h0c7;
              4'ha: out_low = 9'h0c7;
              4'hb: out_low = 9'h0c7;
              4'hc: out_low = 9'h0c8;
              4'hd: out_low = 9'h0c8;
              4'he: out_low = 9'h0c8;
              4'hf: out_low = 9'h0c8;
              default: out_low = 9'h000;
            endcase
          end
          6'h02: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0c8;
              4'h1: out_low = 9'h0c9;
              4'h2: out_low = 9'h0c9;
              4'h3: out_low = 9'h0c9;
              4'h4: out_low = 9'h0c9;
              4'h5: out_low = 9'h0c9;
              4'h6: out_low = 9'h0ca;
              4'h7: out_low = 9'h0ca;
              4'h8: out_low = 9'h0ca;
              4'h9: out_low = 9'h0ca;
              4'ha: out_low = 9'h0ca;
              4'hb: out_low = 9'h0cb;
              4'hc: out_low = 9'h0cb;
              4'hd: out_low = 9'h0cb;
              4'he: out_low = 9'h0cb;
              4'hf: out_low = 9'h0cb;
              default: out_low = 9'h000;
            endcase
          end
          6'h03: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0cc;
              4'h1: out_low = 9'h0cc;
              4'h2: out_low = 9'h0cc;
              4'h3: out_low = 9'h0cc;
              4'h4: out_low = 9'h0cd;
              4'h5: out_low = 9'h0cd;
              4'h6: out_low = 9'h0cd;
              4'h7: out_low = 9'h0cd;
              4'h8: out_low = 9'h0cd;
              4'h9: out_low = 9'h0ce;
              4'ha: out_low = 9'h0ce;
              4'hb: out_low = 9'h0ce;
              4'hc: out_low = 9'h0ce;
              4'hd: out_low = 9'h0ce;
              4'he: out_low = 9'h0cf;
              4'hf: out_low = 9'h0cf;
              default: out_low = 9'h000;
            endcase
          end
          6'h04: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0cf;
              4'h1: out_low = 9'h0cf;
              4'h2: out_low = 9'h0cf;
              4'h3: out_low = 9'h0d0;
              4'h4: out_low = 9'h0d0;
              4'h5: out_low = 9'h0d0;
              4'h6: out_low = 9'h0d0;
              4'h7: out_low = 9'h0d0;
              4'h8: out_low = 9'h0d1;
              4'h9: out_low = 9'h0d1;
              4'ha: out_low = 9'h0d1;
              4'hb: out_low = 9'h0d1;
              4'hc: out_low = 9'h0d2;
              4'hd: out_low = 9'h0d2;
              4'he: out_low = 9'h0d2;
              4'hf: out_low = 9'h0d2;
              default: out_low = 9'h000;
            endcase
          end
          6'h05: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0d2;
              4'h1: out_low = 9'h0d3;
              4'h2: out_low = 9'h0d3;
              4'h3: out_low = 9'h0d3;
              4'h4: out_low = 9'h0d3;
              4'h5: out_low = 9'h0d3;
              4'h6: out_low = 9'h0d4;
              4'h7: out_low = 9'h0d4;
              4'h8: out_low = 9'h0d4;
              4'h9: out_low = 9'h0d4;
              4'ha: out_low = 9'h0d4;
              4'hb: out_low = 9'h0d5;
              4'hc: out_low = 9'h0d5;
              4'hd: out_low = 9'h0d5;
              4'he: out_low = 9'h0d5;
              4'hf: out_low = 9'h0d5;
              default: out_low = 9'h000;
            endcase
          end
          6'h06: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0d6;
              4'h1: out_low = 9'h0d6;
              4'h2: out_low = 9'h0d6;
              4'h3: out_low = 9'h0d6;
              4'h4: out_low = 9'h0d7;
              4'h5: out_low = 9'h0d7;
              4'h6: out_low = 9'h0d7;
              4'h7: out_low = 9'h0d7;
              4'h8: out_low = 9'h0d7;
              4'h9: out_low = 9'h0d8;
              4'ha: out_low = 9'h0d8;
              4'hb: out_low = 9'h0d8;
              4'hc: out_low = 9'h0d8;
              4'hd: out_low = 9'h0d8;
              4'he: out_low = 9'h0d9;
              4'hf: out_low = 9'h0d9;
              default: out_low = 9'h000;
            endcase
          end
          6'h07: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0d9;
              4'h1: out_low = 9'h0d9;
              4'h2: out_low = 9'h0d9;
              4'h3: out_low = 9'h0da;
              4'h4: out_low = 9'h0da;
              4'h5: out_low = 9'h0da;
              4'h6: out_low = 9'h0da;
              4'h7: out_low = 9'h0db;
              4'h8: out_low = 9'h0db;
              4'h9: out_low = 9'h0db;
              4'ha: out_low = 9'h0db;
              4'hb: out_low = 9'h0db;
              4'hc: out_low = 9'h0dc;
              4'hd: out_low = 9'h0dc;
              4'he: out_low = 9'h0dc;
              4'hf: out_low = 9'h0dc;
              default: out_low = 9'h000;
            endcase
          end
          6'h08: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0dc;
              4'h1: out_low = 9'h0dd;
              4'h2: out_low = 9'h0dd;
              4'h3: out_low = 9'h0dd;
              4'h4: out_low = 9'h0dd;
              4'h5: out_low = 9'h0dd;
              4'h6: out_low = 9'h0de;
              4'h7: out_low = 9'h0de;
              4'h8: out_low = 9'h0de;
              4'h9: out_low = 9'h0de;
              4'ha: out_low = 9'h0df;
              4'hb: out_low = 9'h0df;
              4'hc: out_low = 9'h0df;
              4'hd: out_low = 9'h0df;
              4'he: out_low = 9'h0df;
              4'hf: out_low = 9'h0e0;
              default: out_low = 9'h000;
            endcase
          end
          6'h09: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0e0;
              4'h1: out_low = 9'h0e0;
              4'h2: out_low = 9'h0e0;
              4'h3: out_low = 9'h0e0;
              4'h4: out_low = 9'h0e1;
              4'h5: out_low = 9'h0e1;
              4'h6: out_low = 9'h0e1;
              4'h7: out_low = 9'h0e1;
              4'h8: out_low = 9'h0e1;
              4'h9: out_low = 9'h0e2;
              4'ha: out_low = 9'h0e2;
              4'hb: out_low = 9'h0e2;
              4'hc: out_low = 9'h0e2;
              4'hd: out_low = 9'h0e3;
              4'he: out_low = 9'h0e3;
              4'hf: out_low = 9'h0e3;
              default: out_low = 9'h000;
            endcase
          end
          6'h0a: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0e3;
              4'h1: out_low = 9'h0e3;
              4'h2: out_low = 9'h0e4;
              4'h3: out_low = 9'h0e4;
              4'h4: out_low = 9'h0e4;
              4'h5: out_low = 9'h0e4;
              4'h6: out_low = 9'h0e4;
              4'h7: out_low = 9'h0e5;
              4'h8: out_low = 9'h0e5;
              4'h9: out_low = 9'h0e5;
              4'ha: out_low = 9'h0e5;
              4'hb: out_low = 9'h0e6;
              4'hc: out_low = 9'h0e6;
              4'hd: out_low = 9'h0e6;
              4'he: out_low = 9'h0e6;
              4'hf: out_low = 9'h0e6;
              default: out_low = 9'h000;
            endcase
          end
          6'h0b: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0e7;
              4'h1: out_low = 9'h0e7;
              4'h2: out_low = 9'h0e7;
              4'h3: out_low = 9'h0e7;
              4'h4: out_low = 9'h0e7;
              4'h5: out_low = 9'h0e8;
              4'h6: out_low = 9'h0e8;
              4'h7: out_low = 9'h0e8;
              4'h8: out_low = 9'h0e8;
              4'h9: out_low = 9'h0e8;
              4'ha: out_low = 9'h0e9;
              4'hb: out_low = 9'h0e9;
              4'hc: out_low = 9'h0e9;
              4'hd: out_low = 9'h0e9;
              4'he: out_low = 9'h0ea;
              4'hf: out_low = 9'h0ea;
              default: out_low = 9'h000;
            endcase
          end
          6'h0c: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0ea;
              4'h1: out_low = 9'h0ea;
              4'h2: out_low = 9'h0ea;
              4'h3: out_low = 9'h0eb;
              4'h4: out_low = 9'h0eb;
              4'h5: out_low = 9'h0eb;
              4'h6: out_low = 9'h0eb;
              4'h7: out_low = 9'h0eb;
              4'h8: out_low = 9'h0ec;
              4'h9: out_low = 9'h0ec;
              4'ha: out_low = 9'h0ec;
              4'hb: out_low = 9'h0ec;
              4'hc: out_low = 9'h0ed;
              4'hd: out_low = 9'h0ed;
              4'he: out_low = 9'h0ed;
              4'hf: out_low = 9'h0ed;
              default: out_low = 9'h000;
            endcase
          end
          6'h0d: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0ed;
              4'h1: out_low = 9'h0ee;
              4'h2: out_low = 9'h0ee;
              4'h3: out_low = 9'h0ee;
              4'h4: out_low = 9'h0ee;
              4'h5: out_low = 9'h0ee;
              4'h6: out_low = 9'h0ef;
              4'h7: out_low = 9'h0ef;
              4'h8: out_low = 9'h0ef;
              4'h9: out_low = 9'h0ef;
              4'ha: out_low = 9'h0f0;
              4'hb: out_low = 9'h0f0;
              4'hc: out_low = 9'h0f0;
              4'hd: out_low = 9'h0f0;
              4'he: out_low = 9'h0f0;
              4'hf: out_low = 9'h0f1;
              default: out_low = 9'h000;
            endcase
          end
          6'h0e: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0f1;
              4'h1: out_low = 9'h0f1;
              4'h2: out_low = 9'h0f1;
              4'h3: out_low = 9'h0f1;
              4'h4: out_low = 9'h0f2;
              4'h5: out_low = 9'h0f2;
              4'h6: out_low = 9'h0f2;
              4'h7: out_low = 9'h0f2;
              4'h8: out_low = 9'h0f3;
              4'h9: out_low = 9'h0f3;
              4'ha: out_low = 9'h0f3;
              4'hb: out_low = 9'h0f3;
              4'hc: out_low = 9'h0f3;
              4'hd: out_low = 9'h0f4;
              4'he: out_low = 9'h0f4;
              4'hf: out_low = 9'h0f4;
              default: out_low = 9'h000;
            endcase
          end
          6'h0f: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0f4;
              4'h1: out_low = 9'h0f4;
              4'h2: out_low = 9'h0f5;
              4'h3: out_low = 9'h0f5;
              4'h4: out_low = 9'h0f5;
              4'h5: out_low = 9'h0f5;
              4'h6: out_low = 9'h0f6;
              4'h7: out_low = 9'h0f6;
              4'h8: out_low = 9'h0f6;
              4'h9: out_low = 9'h0f6;
              4'ha: out_low = 9'h0f6;
              4'hb: out_low = 9'h0f7;
              4'hc: out_low = 9'h0f7;
              4'hd: out_low = 9'h0f7;
              4'he: out_low = 9'h0f7;
              4'hf: out_low = 9'h0f7;
              default: out_low = 9'h000;
            endcase
          end
          6'h10: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0f8;
              4'h1: out_low = 9'h0f8;
              4'h2: out_low = 9'h0f8;
              4'h3: out_low = 9'h0f8;
              4'h4: out_low = 9'h0f9;
              4'h5: out_low = 9'h0f9;
              4'h6: out_low = 9'h0f9;
              4'h7: out_low = 9'h0f9;
              4'h8: out_low = 9'h0f9;
              4'h9: out_low = 9'h0fa;
              4'ha: out_low = 9'h0fa;
              4'hb: out_low = 9'h0fa;
              4'hc: out_low = 9'h0fa;
              4'hd: out_low = 9'h0fa;
              4'he: out_low = 9'h0fb;
              4'hf: out_low = 9'h0fb;
              default: out_low = 9'h000;
            endcase
          end
          6'h11: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0fb;
              4'h1: out_low = 9'h0fb;
              4'h2: out_low = 9'h0fc;
              4'h3: out_low = 9'h0fc;
              4'h4: out_low = 9'h0fc;
              4'h5: out_low = 9'h0fc;
              4'h6: out_low = 9'h0fc;
              4'h7: out_low = 9'h0fd;
              4'h8: out_low = 9'h0fd;
              4'h9: out_low = 9'h0fd;
              4'ha: out_low = 9'h0fd;
              4'hb: out_low = 9'h0fd;
              4'hc: out_low = 9'h0fe;
              4'hd: out_low = 9'h0fe;
              4'he: out_low = 9'h0fe;
              4'hf: out_low = 9'h0fe;
              default: out_low = 9'h000;
            endcase
          end
          6'h12: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0ff;
              4'h1: out_low = 9'h0ff;
              4'h2: out_low = 9'h0ff;
              4'h3: out_low = 9'h0ff;
              4'h4: out_low = 9'h0ff;
              4'h5: out_low = 9'h100;
              4'h6: out_low = 9'h100;
              4'h7: out_low = 9'h100;
              4'h8: out_low = 9'h100;
              4'h9: out_low = 9'h101;
              4'ha: out_low = 9'h101;
              4'hb: out_low = 9'h101;
              4'hc: out_low = 9'h101;
              4'hd: out_low = 9'h101;
              4'he: out_low = 9'h102;
              4'hf: out_low = 9'h102;
              default: out_low = 9'h000;
            endcase
          end
          6'h13: begin
            case (mant[3:0])
              4'h0: out_low = 9'h102;
              4'h1: out_low = 9'h102;
              4'h2: out_low = 9'h102;
              4'h3: out_low = 9'h103;
              4'h4: out_low = 9'h103;
              4'h5: out_low = 9'h103;
              4'h6: out_low = 9'h103;
              4'h7: out_low = 9'h104;
              4'h8: out_low = 9'h104;
              4'h9: out_low = 9'h104;
              4'ha: out_low = 9'h104;
              4'hb: out_low = 9'h104;
              4'hc: out_low = 9'h105;
              4'hd: out_low = 9'h105;
              4'he: out_low = 9'h105;
              4'hf: out_low = 9'h105;
              default: out_low = 9'h000;
            endcase
          end
          6'h14: begin
            case (mant[3:0])
              4'h0: out_low = 9'h106;
              4'h1: out_low = 9'h106;
              4'h2: out_low = 9'h106;
              4'h3: out_low = 9'h106;
              4'h4: out_low = 9'h106;
              4'h5: out_low = 9'h107;
              4'h6: out_low = 9'h107;
              4'h7: out_low = 9'h107;
              4'h8: out_low = 9'h107;
              4'h9: out_low = 9'h107;
              4'ha: out_low = 9'h108;
              4'hb: out_low = 9'h108;
              4'hc: out_low = 9'h108;
              4'hd: out_low = 9'h108;
              4'he: out_low = 9'h109;
              4'hf: out_low = 9'h109;
              default: out_low = 9'h000;
            endcase
          end
          6'h15: begin
            case (mant[3:0])
              4'h0: out_low = 9'h109;
              4'h1: out_low = 9'h109;
              4'h2: out_low = 9'h109;
              4'h3: out_low = 9'h10a;
              4'h4: out_low = 9'h10a;
              4'h5: out_low = 9'h10a;
              4'h6: out_low = 9'h10a;
              4'h7: out_low = 9'h10b;
              4'h8: out_low = 9'h10b;
              4'h9: out_low = 9'h10b;
              4'ha: out_low = 9'h10b;
              4'hb: out_low = 9'h10b;
              4'hc: out_low = 9'h10c;
              4'hd: out_low = 9'h10c;
              4'he: out_low = 9'h10c;
              4'hf: out_low = 9'h10c;
              default: out_low = 9'h000;
            endcase
          end
          6'h16: begin
            case (mant[3:0])
              4'h0: out_low = 9'h10c;
              4'h1: out_low = 9'h10d;
              4'h2: out_low = 9'h10d;
              4'h3: out_low = 9'h10d;
              4'h4: out_low = 9'h10d;
              4'h5: out_low = 9'h10e;
              4'h6: out_low = 9'h10e;
              4'h7: out_low = 9'h10e;
              4'h8: out_low = 9'h10e;
              4'h9: out_low = 9'h10e;
              4'ha: out_low = 9'h10f;
              4'hb: out_low = 9'h10f;
              4'hc: out_low = 9'h10f;
              4'hd: out_low = 9'h10f;
              4'he: out_low = 9'h110;
              4'hf: out_low = 9'h110;
              default: out_low = 9'h000;
            endcase
          end
          6'h17: begin
            case (mant[3:0])
              4'h0: out_low = 9'h110;
              4'h1: out_low = 9'h110;
              4'h2: out_low = 9'h110;
              4'h3: out_low = 9'h111;
              4'h4: out_low = 9'h111;
              4'h5: out_low = 9'h111;
              4'h6: out_low = 9'h111;
              4'h7: out_low = 9'h112;
              4'h8: out_low = 9'h112;
              4'h9: out_low = 9'h112;
              4'ha: out_low = 9'h112;
              4'hb: out_low = 9'h112;
              4'hc: out_low = 9'h113;
              4'hd: out_low = 9'h113;
              4'he: out_low = 9'h113;
              4'hf: out_low = 9'h113;
              default: out_low = 9'h000;
            endcase
          end
          6'h18: begin
            case (mant[3:0])
              4'h0: out_low = 9'h114;
              4'h1: out_low = 9'h114;
              4'h2: out_low = 9'h114;
              4'h3: out_low = 9'h114;
              4'h4: out_low = 9'h114;
              4'h5: out_low = 9'h115;
              4'h6: out_low = 9'h115;
              4'h7: out_low = 9'h115;
              4'h8: out_low = 9'h115;
              4'h9: out_low = 9'h115;
              4'ha: out_low = 9'h116;
              4'hb: out_low = 9'h116;
              4'hc: out_low = 9'h116;
              4'hd: out_low = 9'h116;
              4'he: out_low = 9'h117;
              4'hf: out_low = 9'h117;
              default: out_low = 9'h000;
            endcase
          end
          6'h19: begin
            case (mant[3:0])
              4'h0: out_low = 9'h117;
              4'h1: out_low = 9'h117;
              4'h2: out_low = 9'h117;
              4'h3: out_low = 9'h118;
              4'h4: out_low = 9'h118;
              4'h5: out_low = 9'h118;
              4'h6: out_low = 9'h118;
              4'h7: out_low = 9'h119;
              4'h8: out_low = 9'h119;
              4'h9: out_low = 9'h119;
              4'ha: out_low = 9'h119;
              4'hb: out_low = 9'h119;
              4'hc: out_low = 9'h11a;
              4'hd: out_low = 9'h11a;
              4'he: out_low = 9'h11a;
              4'hf: out_low = 9'h11a;
              default: out_low = 9'h000;
            endcase
          end
          6'h1a: begin
            case (mant[3:0])
              4'h0: out_low = 9'h11b;
              4'h1: out_low = 9'h11b;
              4'h2: out_low = 9'h11b;
              4'h3: out_low = 9'h11b;
              4'h4: out_low = 9'h11b;
              4'h5: out_low = 9'h11c;
              4'h6: out_low = 9'h11c;
              4'h7: out_low = 9'h11c;
              4'h8: out_low = 9'h11c;
              4'h9: out_low = 9'h11d;
              4'ha: out_low = 9'h11d;
              4'hb: out_low = 9'h11d;
              4'hc: out_low = 9'h11d;
              4'hd: out_low = 9'h11d;
              4'he: out_low = 9'h11e;
              4'hf: out_low = 9'h11e;
              default: out_low = 9'h000;
            endcase
          end
          6'h1b: begin
            case (mant[3:0])
              4'h0: out_low = 9'h11e;
              4'h1: out_low = 9'h11e;
              4'h2: out_low = 9'h11f;
              4'h3: out_low = 9'h11f;
              4'h4: out_low = 9'h11f;
              4'h5: out_low = 9'h11f;
              4'h6: out_low = 9'h11f;
              4'h7: out_low = 9'h120;
              4'h8: out_low = 9'h120;
              4'h9: out_low = 9'h120;
              4'ha: out_low = 9'h120;
              4'hb: out_low = 9'h121;
              4'hc: out_low = 9'h121;
              4'hd: out_low = 9'h121;
              4'he: out_low = 9'h121;
              4'hf: out_low = 9'h121;
              default: out_low = 9'h000;
            endcase
          end
          6'h1c: begin
            case (mant[3:0])
              4'h0: out_low = 9'h122;
              4'h1: out_low = 9'h122;
              4'h2: out_low = 9'h122;
              4'h3: out_low = 9'h122;
              4'h4: out_low = 9'h123;
              4'h5: out_low = 9'h123;
              4'h6: out_low = 9'h123;
              4'h7: out_low = 9'h123;
              4'h8: out_low = 9'h123;
              4'h9: out_low = 9'h124;
              4'ha: out_low = 9'h124;
              4'hb: out_low = 9'h124;
              4'hc: out_low = 9'h124;
              4'hd: out_low = 9'h125;
              4'he: out_low = 9'h125;
              4'hf: out_low = 9'h125;
              default: out_low = 9'h000;
            endcase
          end
          6'h1d: begin
            case (mant[3:0])
              4'h0: out_low = 9'h125;
              4'h1: out_low = 9'h125;
              4'h2: out_low = 9'h126;
              4'h3: out_low = 9'h126;
              4'h4: out_low = 9'h126;
              4'h5: out_low = 9'h126;
              4'h6: out_low = 9'h127;
              4'h7: out_low = 9'h127;
              4'h8: out_low = 9'h127;
              4'h9: out_low = 9'h127;
              4'ha: out_low = 9'h127;
              4'hb: out_low = 9'h128;
              4'hc: out_low = 9'h128;
              4'hd: out_low = 9'h128;
              4'he: out_low = 9'h128;
              4'hf: out_low = 9'h129;
              default: out_low = 9'h000;
            endcase
          end
          6'h1e: begin
            case (mant[3:0])
              4'h0: out_low = 9'h129;
              4'h1: out_low = 9'h129;
              4'h2: out_low = 9'h129;
              4'h3: out_low = 9'h129;
              4'h4: out_low = 9'h12a;
              4'h5: out_low = 9'h12a;
              4'h6: out_low = 9'h12a;
              4'h7: out_low = 9'h12a;
              4'h8: out_low = 9'h12b;
              4'h9: out_low = 9'h12b;
              4'ha: out_low = 9'h12b;
              4'hb: out_low = 9'h12b;
              4'hc: out_low = 9'h12b;
              4'hd: out_low = 9'h12c;
              4'he: out_low = 9'h12c;
              4'hf: out_low = 9'h12c;
              default: out_low = 9'h000;
            endcase
          end
          6'h1f: begin
            case (mant[3:0])
              4'h0: out_low = 9'h12c;
              4'h1: out_low = 9'h12d;
              4'h2: out_low = 9'h12d;
              4'h3: out_low = 9'h12d;
              4'h4: out_low = 9'h12d;
              4'h5: out_low = 9'h12d;
              4'h6: out_low = 9'h12e;
              4'h7: out_low = 9'h12e;
              4'h8: out_low = 9'h12e;
              4'h9: out_low = 9'h12e;
              4'ha: out_low = 9'h12f;
              4'hb: out_low = 9'h12f;
              4'hc: out_low = 9'h12f;
              4'hd: out_low = 9'h12f;
              4'he: out_low = 9'h130;
              4'hf: out_low = 9'h130;
              default: out_low = 9'h000;
            endcase
          end
          6'h20: begin
            case (mant[3:0])
              4'h0: out_low = 9'h130;
              4'h1: out_low = 9'h130;
              4'h2: out_low = 9'h130;
              4'h3: out_low = 9'h131;
              4'h4: out_low = 9'h131;
              4'h5: out_low = 9'h131;
              4'h6: out_low = 9'h131;
              4'h7: out_low = 9'h132;
              4'h8: out_low = 9'h132;
              4'h9: out_low = 9'h132;
              4'ha: out_low = 9'h132;
              4'hb: out_low = 9'h132;
              4'hc: out_low = 9'h133;
              4'hd: out_low = 9'h133;
              4'he: out_low = 9'h133;
              4'hf: out_low = 9'h133;
              default: out_low = 9'h000;
            endcase
          end
          6'h21: begin
            case (mant[3:0])
              4'h0: out_low = 9'h134;
              4'h1: out_low = 9'h134;
              4'h2: out_low = 9'h134;
              4'h3: out_low = 9'h134;
              4'h4: out_low = 9'h134;
              4'h5: out_low = 9'h135;
              4'h6: out_low = 9'h135;
              4'h7: out_low = 9'h135;
              4'h8: out_low = 9'h135;
              4'h9: out_low = 9'h136;
              4'ha: out_low = 9'h136;
              4'hb: out_low = 9'h136;
              4'hc: out_low = 9'h136;
              4'hd: out_low = 9'h136;
              4'he: out_low = 9'h137;
              4'hf: out_low = 9'h137;
              default: out_low = 9'h000;
            endcase
          end
          6'h22: begin
            case (mant[3:0])
              4'h0: out_low = 9'h137;
              4'h1: out_low = 9'h137;
              4'h2: out_low = 9'h138;
              4'h3: out_low = 9'h138;
              4'h4: out_low = 9'h138;
              4'h5: out_low = 9'h138;
              4'h6: out_low = 9'h139;
              4'h7: out_low = 9'h139;
              4'h8: out_low = 9'h139;
              4'h9: out_low = 9'h139;
              4'ha: out_low = 9'h139;
              4'hb: out_low = 9'h13a;
              4'hc: out_low = 9'h13a;
              4'hd: out_low = 9'h13a;
              4'he: out_low = 9'h13a;
              4'hf: out_low = 9'h13b;
              default: out_low = 9'h000;
            endcase
          end
          6'h23: begin
            case (mant[3:0])
              4'h0: out_low = 9'h13b;
              4'h1: out_low = 9'h13b;
              4'h2: out_low = 9'h13b;
              4'h3: out_low = 9'h13b;
              4'h4: out_low = 9'h13c;
              4'h5: out_low = 9'h13c;
              4'h6: out_low = 9'h13c;
              4'h7: out_low = 9'h13c;
              4'h8: out_low = 9'h13d;
              4'h9: out_low = 9'h13d;
              4'ha: out_low = 9'h13d;
              4'hb: out_low = 9'h13d;
              4'hc: out_low = 9'h13e;
              4'hd: out_low = 9'h13e;
              4'he: out_low = 9'h13e;
              4'hf: out_low = 9'h13e;
              default: out_low = 9'h000;
            endcase
          end
          6'h24: begin
            case (mant[3:0])
              4'h0: out_low = 9'h13e;
              4'h1: out_low = 9'h13f;
              4'h2: out_low = 9'h13f;
              4'h3: out_low = 9'h13f;
              4'h4: out_low = 9'h13f;
              4'h5: out_low = 9'h140;
              4'h6: out_low = 9'h140;
              4'h7: out_low = 9'h140;
              4'h8: out_low = 9'h140;
              4'h9: out_low = 9'h140;
              4'ha: out_low = 9'h141;
              4'hb: out_low = 9'h141;
              4'hc: out_low = 9'h141;
              4'hd: out_low = 9'h141;
              4'he: out_low = 9'h142;
              4'hf: out_low = 9'h142;
              default: out_low = 9'h000;
            endcase
          end
          6'h25: begin
            case (mant[3:0])
              4'h0: out_low = 9'h142;
              4'h1: out_low = 9'h142;
              4'h2: out_low = 9'h143;
              4'h3: out_low = 9'h143;
              4'h4: out_low = 9'h143;
              4'h5: out_low = 9'h143;
              4'h6: out_low = 9'h143;
              4'h7: out_low = 9'h144;
              4'h8: out_low = 9'h144;
              4'h9: out_low = 9'h144;
              4'ha: out_low = 9'h144;
              4'hb: out_low = 9'h145;
              4'hc: out_low = 9'h145;
              4'hd: out_low = 9'h145;
              4'he: out_low = 9'h145;
              4'hf: out_low = 9'h145;
              default: out_low = 9'h000;
            endcase
          end
          6'h26: begin
            case (mant[3:0])
              4'h0: out_low = 9'h146;
              4'h1: out_low = 9'h146;
              4'h2: out_low = 9'h146;
              4'h3: out_low = 9'h146;
              4'h4: out_low = 9'h147;
              4'h5: out_low = 9'h147;
              4'h6: out_low = 9'h147;
              4'h7: out_low = 9'h147;
              4'h8: out_low = 9'h148;
              4'h9: out_low = 9'h148;
              4'ha: out_low = 9'h148;
              4'hb: out_low = 9'h148;
              4'hc: out_low = 9'h148;
              4'hd: out_low = 9'h149;
              4'he: out_low = 9'h149;
              4'hf: out_low = 9'h149;
              default: out_low = 9'h000;
            endcase
          end
          6'h27: begin
            case (mant[3:0])
              4'h0: out_low = 9'h149;
              4'h1: out_low = 9'h14a;
              4'h2: out_low = 9'h14a;
              4'h3: out_low = 9'h14a;
              4'h4: out_low = 9'h14a;
              4'h5: out_low = 9'h14b;
              4'h6: out_low = 9'h14b;
              4'h7: out_low = 9'h14b;
              4'h8: out_low = 9'h14b;
              4'h9: out_low = 9'h14b;
              4'ha: out_low = 9'h14c;
              4'hb: out_low = 9'h14c;
              4'hc: out_low = 9'h14c;
              4'hd: out_low = 9'h14c;
              4'he: out_low = 9'h14d;
              4'hf: out_low = 9'h14d;
              default: out_low = 9'h000;
            endcase
          end
          6'h28: begin
            case (mant[3:0])
              4'h0: out_low = 9'h14d;
              4'h1: out_low = 9'h14d;
              4'h2: out_low = 9'h14e;
              4'h3: out_low = 9'h14e;
              4'h4: out_low = 9'h14e;
              4'h5: out_low = 9'h14e;
              4'h6: out_low = 9'h14e;
              4'h7: out_low = 9'h14f;
              4'h8: out_low = 9'h14f;
              4'h9: out_low = 9'h14f;
              4'ha: out_low = 9'h14f;
              4'hb: out_low = 9'h150;
              4'hc: out_low = 9'h150;
              4'hd: out_low = 9'h150;
              4'he: out_low = 9'h150;
              4'hf: out_low = 9'h150;
              default: out_low = 9'h000;
            endcase
          end
          6'h29: begin
            case (mant[3:0])
              4'h0: out_low = 9'h151;
              4'h1: out_low = 9'h151;
              4'h2: out_low = 9'h151;
              4'h3: out_low = 9'h151;
              4'h4: out_low = 9'h152;
              4'h5: out_low = 9'h152;
              4'h6: out_low = 9'h152;
              4'h7: out_low = 9'h152;
              4'h8: out_low = 9'h153;
              4'h9: out_low = 9'h153;
              4'ha: out_low = 9'h153;
              4'hb: out_low = 9'h153;
              4'hc: out_low = 9'h153;
              4'hd: out_low = 9'h154;
              4'he: out_low = 9'h154;
              4'hf: out_low = 9'h154;
              default: out_low = 9'h000;
            endcase
          end
          6'h2a: begin
            case (mant[3:0])
              4'h0: out_low = 9'h154;
              4'h1: out_low = 9'h155;
              4'h2: out_low = 9'h155;
              4'h3: out_low = 9'h155;
              4'h4: out_low = 9'h155;
              4'h5: out_low = 9'h156;
              4'h6: out_low = 9'h156;
              4'h7: out_low = 9'h156;
              4'h8: out_low = 9'h156;
              4'h9: out_low = 9'h156;
              4'ha: out_low = 9'h157;
              4'hb: out_low = 9'h157;
              4'hc: out_low = 9'h157;
              4'hd: out_low = 9'h157;
              4'he: out_low = 9'h158;
              4'hf: out_low = 9'h158;
              default: out_low = 9'h000;
            endcase
          end
          6'h2b: begin
            case (mant[3:0])
              4'h0: out_low = 9'h158;
              4'h1: out_low = 9'h158;
              4'h2: out_low = 9'h159;
              4'h3: out_low = 9'h159;
              4'h4: out_low = 9'h159;
              4'h5: out_low = 9'h159;
              4'h6: out_low = 9'h15a;
              4'h7: out_low = 9'h15a;
              4'h8: out_low = 9'h15a;
              4'h9: out_low = 9'h15a;
              4'ha: out_low = 9'h15a;
              4'hb: out_low = 9'h15b;
              4'hc: out_low = 9'h15b;
              4'hd: out_low = 9'h15b;
              4'he: out_low = 9'h15b;
              4'hf: out_low = 9'h15c;
              default: out_low = 9'h000;
            endcase
          end
          6'h2c: begin
            case (mant[3:0])
              4'h0: out_low = 9'h15c;
              4'h1: out_low = 9'h15c;
              4'h2: out_low = 9'h15c;
              4'h3: out_low = 9'h15d;
              4'h4: out_low = 9'h15d;
              4'h5: out_low = 9'h15d;
              4'h6: out_low = 9'h15d;
              4'h7: out_low = 9'h15d;
              4'h8: out_low = 9'h15e;
              4'h9: out_low = 9'h15e;
              4'ha: out_low = 9'h15e;
              4'hb: out_low = 9'h15e;
              4'hc: out_low = 9'h15f;
              4'hd: out_low = 9'h15f;
              4'he: out_low = 9'h15f;
              4'hf: out_low = 9'h15f;
              default: out_low = 9'h000;
            endcase
          end
          6'h2d: begin
            case (mant[3:0])
              4'h0: out_low = 9'h160;
              4'h1: out_low = 9'h160;
              4'h2: out_low = 9'h160;
              4'h3: out_low = 9'h160;
              4'h4: out_low = 9'h160;
              4'h5: out_low = 9'h161;
              4'h6: out_low = 9'h161;
              4'h7: out_low = 9'h161;
              4'h8: out_low = 9'h161;
              4'h9: out_low = 9'h162;
              4'ha: out_low = 9'h162;
              4'hb: out_low = 9'h162;
              4'hc: out_low = 9'h162;
              4'hd: out_low = 9'h163;
              4'he: out_low = 9'h163;
              4'hf: out_low = 9'h163;
              default: out_low = 9'h000;
            endcase
          end
          6'h2e: begin
            case (mant[3:0])
              4'h0: out_low = 9'h163;
              4'h1: out_low = 9'h164;
              4'h2: out_low = 9'h164;
              4'h3: out_low = 9'h164;
              4'h4: out_low = 9'h164;
              4'h5: out_low = 9'h164;
              4'h6: out_low = 9'h165;
              4'h7: out_low = 9'h165;
              4'h8: out_low = 9'h165;
              4'h9: out_low = 9'h165;
              4'ha: out_low = 9'h166;
              4'hb: out_low = 9'h166;
              4'hc: out_low = 9'h166;
              4'hd: out_low = 9'h166;
              4'he: out_low = 9'h167;
              4'hf: out_low = 9'h167;
              default: out_low = 9'h000;
            endcase
          end
          6'h2f: begin
            case (mant[3:0])
              4'h0: out_low = 9'h167;
              4'h1: out_low = 9'h167;
              4'h2: out_low = 9'h167;
              4'h3: out_low = 9'h168;
              4'h4: out_low = 9'h168;
              4'h5: out_low = 9'h168;
              4'h6: out_low = 9'h168;
              4'h7: out_low = 9'h169;
              4'h8: out_low = 9'h169;
              4'h9: out_low = 9'h169;
              4'ha: out_low = 9'h169;
              4'hb: out_low = 9'h16a;
              4'hc: out_low = 9'h16a;
              4'hd: out_low = 9'h16a;
              4'he: out_low = 9'h16a;
              4'hf: out_low = 9'h16b;
              default: out_low = 9'h000;
            endcase
          end
          6'h30: begin
            case (mant[3:0])
              4'h0: out_low = 9'h16b;
              4'h1: out_low = 9'h16b;
              4'h2: out_low = 9'h16b;
              4'h3: out_low = 9'h16b;
              4'h4: out_low = 9'h16c;
              4'h5: out_low = 9'h16c;
              4'h6: out_low = 9'h16c;
              4'h7: out_low = 9'h16c;
              4'h8: out_low = 9'h16d;
              4'h9: out_low = 9'h16d;
              4'ha: out_low = 9'h16d;
              4'hb: out_low = 9'h16d;
              4'hc: out_low = 9'h16e;
              4'hd: out_low = 9'h16e;
              4'he: out_low = 9'h16e;
              4'hf: out_low = 9'h16e;
              default: out_low = 9'h000;
            endcase
          end
          6'h31: begin
            case (mant[3:0])
              4'h0: out_low = 9'h16f;
              4'h1: out_low = 9'h16f;
              4'h2: out_low = 9'h16f;
              4'h3: out_low = 9'h16f;
              4'h4: out_low = 9'h16f;
              4'h5: out_low = 9'h170;
              4'h6: out_low = 9'h170;
              4'h7: out_low = 9'h170;
              4'h8: out_low = 9'h170;
              4'h9: out_low = 9'h171;
              4'ha: out_low = 9'h171;
              4'hb: out_low = 9'h171;
              4'hc: out_low = 9'h171;
              4'hd: out_low = 9'h172;
              4'he: out_low = 9'h172;
              4'hf: out_low = 9'h172;
              default: out_low = 9'h000;
            endcase
          end
          6'h32: begin
            case (mant[3:0])
              4'h0: out_low = 9'h172;
              4'h1: out_low = 9'h173;
              4'h2: out_low = 9'h173;
              4'h3: out_low = 9'h173;
              4'h4: out_low = 9'h173;
              4'h5: out_low = 9'h173;
              4'h6: out_low = 9'h174;
              4'h7: out_low = 9'h174;
              4'h8: out_low = 9'h174;
              4'h9: out_low = 9'h174;
              4'ha: out_low = 9'h175;
              4'hb: out_low = 9'h175;
              4'hc: out_low = 9'h175;
              4'hd: out_low = 9'h175;
              4'he: out_low = 9'h176;
              4'hf: out_low = 9'h176;
              default: out_low = 9'h000;
            endcase
          end
          6'h33: begin
            case (mant[3:0])
              4'h0: out_low = 9'h176;
              4'h1: out_low = 9'h176;
              4'h2: out_low = 9'h177;
              4'h3: out_low = 9'h177;
              4'h4: out_low = 9'h177;
              4'h5: out_low = 9'h177;
              4'h6: out_low = 9'h177;
              4'h7: out_low = 9'h178;
              4'h8: out_low = 9'h178;
              4'h9: out_low = 9'h178;
              4'ha: out_low = 9'h178;
              4'hb: out_low = 9'h179;
              4'hc: out_low = 9'h179;
              4'hd: out_low = 9'h179;
              4'he: out_low = 9'h179;
              4'hf: out_low = 9'h17a;
              default: out_low = 9'h000;
            endcase
          end
          6'h34: begin
            case (mant[3:0])
              4'h0: out_low = 9'h17a;
              4'h1: out_low = 9'h17a;
              4'h2: out_low = 9'h17a;
              4'h3: out_low = 9'h17b;
              4'h4: out_low = 9'h17b;
              4'h5: out_low = 9'h17b;
              4'h6: out_low = 9'h17b;
              4'h7: out_low = 9'h17c;
              4'h8: out_low = 9'h17c;
              4'h9: out_low = 9'h17c;
              4'ha: out_low = 9'h17c;
              4'hb: out_low = 9'h17c;
              4'hc: out_low = 9'h17d;
              4'hd: out_low = 9'h17d;
              4'he: out_low = 9'h17d;
              4'hf: out_low = 9'h17d;
              default: out_low = 9'h000;
            endcase
          end
          6'h35: begin
            case (mant[3:0])
              4'h0: out_low = 9'h17e;
              4'h1: out_low = 9'h17e;
              4'h2: out_low = 9'h17e;
              4'h3: out_low = 9'h17e;
              4'h4: out_low = 9'h17f;
              4'h5: out_low = 9'h17f;
              4'h6: out_low = 9'h17f;
              4'h7: out_low = 9'h17f;
              4'h8: out_low = 9'h180;
              4'h9: out_low = 9'h180;
              4'ha: out_low = 9'h180;
              4'hb: out_low = 9'h180;
              4'hc: out_low = 9'h181;
              4'hd: out_low = 9'h181;
              4'he: out_low = 9'h181;
              4'hf: out_low = 9'h181;
              default: out_low = 9'h000;
            endcase
          end
          6'h36: begin
            case (mant[3:0])
              4'h0: out_low = 9'h181;
              4'h1: out_low = 9'h182;
              4'h2: out_low = 9'h182;
              4'h3: out_low = 9'h182;
              4'h4: out_low = 9'h182;
              4'h5: out_low = 9'h183;
              4'h6: out_low = 9'h183;
              4'h7: out_low = 9'h183;
              4'h8: out_low = 9'h183;
              4'h9: out_low = 9'h184;
              4'ha: out_low = 9'h184;
              4'hb: out_low = 9'h184;
              4'hc: out_low = 9'h184;
              4'hd: out_low = 9'h185;
              4'he: out_low = 9'h185;
              4'hf: out_low = 9'h185;
              default: out_low = 9'h000;
            endcase
          end
          6'h37: begin
            case (mant[3:0])
              4'h0: out_low = 9'h185;
              4'h1: out_low = 9'h186;
              4'h2: out_low = 9'h186;
              4'h3: out_low = 9'h186;
              4'h4: out_low = 9'h186;
              4'h5: out_low = 9'h186;
              4'h6: out_low = 9'h187;
              4'h7: out_low = 9'h187;
              4'h8: out_low = 9'h187;
              4'h9: out_low = 9'h187;
              4'ha: out_low = 9'h188;
              4'hb: out_low = 9'h188;
              4'hc: out_low = 9'h188;
              4'hd: out_low = 9'h188;
              4'he: out_low = 9'h189;
              4'hf: out_low = 9'h189;
              default: out_low = 9'h000;
            endcase
          end
          6'h38: begin
            case (mant[3:0])
              4'h0: out_low = 9'h189;
              4'h1: out_low = 9'h189;
              4'h2: out_low = 9'h18a;
              4'h3: out_low = 9'h18a;
              4'h4: out_low = 9'h18a;
              4'h5: out_low = 9'h18a;
              4'h6: out_low = 9'h18b;
              4'h7: out_low = 9'h18b;
              4'h8: out_low = 9'h18b;
              4'h9: out_low = 9'h18b;
              4'ha: out_low = 9'h18c;
              4'hb: out_low = 9'h18c;
              4'hc: out_low = 9'h18c;
              4'hd: out_low = 9'h18c;
              4'he: out_low = 9'h18c;
              4'hf: out_low = 9'h18d;
              default: out_low = 9'h000;
            endcase
          end
          6'h39: begin
            case (mant[3:0])
              4'h0: out_low = 9'h18d;
              4'h1: out_low = 9'h18d;
              4'h2: out_low = 9'h18d;
              4'h3: out_low = 9'h18e;
              4'h4: out_low = 9'h18e;
              4'h5: out_low = 9'h18e;
              4'h6: out_low = 9'h18e;
              4'h7: out_low = 9'h18f;
              4'h8: out_low = 9'h18f;
              4'h9: out_low = 9'h18f;
              4'ha: out_low = 9'h18f;
              4'hb: out_low = 9'h190;
              4'hc: out_low = 9'h190;
              4'hd: out_low = 9'h190;
              4'he: out_low = 9'h190;
              4'hf: out_low = 9'h191;
              default: out_low = 9'h000;
            endcase
          end
          6'h3a: begin
            case (mant[3:0])
              4'h0: out_low = 9'h191;
              4'h1: out_low = 9'h191;
              4'h2: out_low = 9'h191;
              4'h3: out_low = 9'h192;
              4'h4: out_low = 9'h192;
              4'h5: out_low = 9'h192;
              4'h6: out_low = 9'h192;
              4'h7: out_low = 9'h193;
              4'h8: out_low = 9'h193;
              4'h9: out_low = 9'h193;
              4'ha: out_low = 9'h193;
              4'hb: out_low = 9'h193;
              4'hc: out_low = 9'h194;
              4'hd: out_low = 9'h194;
              4'he: out_low = 9'h194;
              4'hf: out_low = 9'h194;
              default: out_low = 9'h000;
            endcase
          end
          6'h3b: begin
            case (mant[3:0])
              4'h0: out_low = 9'h195;
              4'h1: out_low = 9'h195;
              4'h2: out_low = 9'h195;
              4'h3: out_low = 9'h195;
              4'h4: out_low = 9'h196;
              4'h5: out_low = 9'h196;
              4'h6: out_low = 9'h196;
              4'h7: out_low = 9'h196;
              4'h8: out_low = 9'h197;
              4'h9: out_low = 9'h197;
              4'ha: out_low = 9'h197;
              4'hb: out_low = 9'h197;
              4'hc: out_low = 9'h198;
              4'hd: out_low = 9'h198;
              4'he: out_low = 9'h198;
              4'hf: out_low = 9'h198;
              default: out_low = 9'h000;
            endcase
          end
          6'h3c: begin
            case (mant[3:0])
              4'h0: out_low = 9'h199;
              4'h1: out_low = 9'h199;
              4'h2: out_low = 9'h199;
              4'h3: out_low = 9'h199;
              4'h4: out_low = 9'h19a;
              4'h5: out_low = 9'h19a;
              4'h6: out_low = 9'h19a;
              4'h7: out_low = 9'h19a;
              4'h8: out_low = 9'h19a;
              4'h9: out_low = 9'h19b;
              4'ha: out_low = 9'h19b;
              4'hb: out_low = 9'h19b;
              4'hc: out_low = 9'h19b;
              4'hd: out_low = 9'h19c;
              4'he: out_low = 9'h19c;
              4'hf: out_low = 9'h19c;
              default: out_low = 9'h000;
            endcase
          end
          6'h3d: begin
            case (mant[3:0])
              4'h0: out_low = 9'h19c;
              4'h1: out_low = 9'h19d;
              4'h2: out_low = 9'h19d;
              4'h3: out_low = 9'h19d;
              4'h4: out_low = 9'h19d;
              4'h5: out_low = 9'h19e;
              4'h6: out_low = 9'h19e;
              4'h7: out_low = 9'h19e;
              4'h8: out_low = 9'h19e;
              4'h9: out_low = 9'h19f;
              4'ha: out_low = 9'h19f;
              4'hb: out_low = 9'h19f;
              4'hc: out_low = 9'h19f;
              4'hd: out_low = 9'h1a0;
              4'he: out_low = 9'h1a0;
              4'hf: out_low = 9'h1a0;
              default: out_low = 9'h000;
            endcase
          end
          6'h3e: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1a0;
              4'h1: out_low = 9'h1a1;
              4'h2: out_low = 9'h1a1;
              4'h3: out_low = 9'h1a1;
              4'h4: out_low = 9'h1a1;
              4'h5: out_low = 9'h1a2;
              4'h6: out_low = 9'h1a2;
              4'h7: out_low = 9'h1a2;
              4'h8: out_low = 9'h1a2;
              4'h9: out_low = 9'h1a3;
              4'ha: out_low = 9'h1a3;
              4'hb: out_low = 9'h1a3;
              4'hc: out_low = 9'h1a3;
              4'hd: out_low = 9'h1a4;
              4'he: out_low = 9'h1a4;
              4'hf: out_low = 9'h1a4;
              default: out_low = 9'h000;
            endcase
          end
          6'h3f: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1a4;
              4'h1: out_low = 9'h1a4;
              4'h2: out_low = 9'h1a5;
              4'h3: out_low = 9'h1a5;
              4'h4: out_low = 9'h1a5;
              4'h5: out_low = 9'h1a5;
              4'h6: out_low = 9'h1a6;
              4'h7: out_low = 9'h1a6;
              4'h8: out_low = 9'h1a6;
              4'h9: out_low = 9'h1a6;
              4'ha: out_low = 9'h1a7;
              4'hb: out_low = 9'h1a7;
              4'hc: out_low = 9'h1a7;
              4'hd: out_low = 9'h1a7;
              4'he: out_low = 9'h1a8;
              4'hf: out_low = 9'h1a8;
              default: out_low = 9'h000;
            endcase
          end
          default: out_low = 9'h000;
        endcase
      end
      6'h0e: begin
        case (mant[9:4])
          6'h00: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1a8;
              4'h1: out_low = 9'h1a9;
              4'h2: out_low = 9'h1a9;
              4'h3: out_low = 9'h1aa;
              4'h4: out_low = 9'h1aa;
              4'h5: out_low = 9'h1ab;
              4'h6: out_low = 9'h1ab;
              4'h7: out_low = 9'h1ac;
              4'h8: out_low = 9'h1ac;
              4'h9: out_low = 9'h1ad;
              4'ha: out_low = 9'h1ad;
              4'hb: out_low = 9'h1ae;
              4'hc: out_low = 9'h1ae;
              4'hd: out_low = 9'h1af;
              4'he: out_low = 9'h1af;
              4'hf: out_low = 9'h1b0;
              default: out_low = 9'h000;
            endcase
          end
          6'h01: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1b0;
              4'h1: out_low = 9'h1b1;
              4'h2: out_low = 9'h1b1;
              4'h3: out_low = 9'h1b1;
              4'h4: out_low = 9'h1b2;
              4'h5: out_low = 9'h1b2;
              4'h6: out_low = 9'h1b3;
              4'h7: out_low = 9'h1b3;
              4'h8: out_low = 9'h1b4;
              4'h9: out_low = 9'h1b4;
              4'ha: out_low = 9'h1b5;
              4'hb: out_low = 9'h1b5;
              4'hc: out_low = 9'h1b6;
              4'hd: out_low = 9'h1b6;
              4'he: out_low = 9'h1b7;
              4'hf: out_low = 9'h1b7;
              default: out_low = 9'h000;
            endcase
          end
          6'h02: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1b8;
              4'h1: out_low = 9'h1b8;
              4'h2: out_low = 9'h1b9;
              4'h3: out_low = 9'h1b9;
              4'h4: out_low = 9'h1ba;
              4'h5: out_low = 9'h1ba;
              4'h6: out_low = 9'h1bb;
              4'h7: out_low = 9'h1bb;
              4'h8: out_low = 9'h1bc;
              4'h9: out_low = 9'h1bc;
              4'ha: out_low = 9'h1bd;
              4'hb: out_low = 9'h1bd;
              4'hc: out_low = 9'h1be;
              4'hd: out_low = 9'h1be;
              4'he: out_low = 9'h1bf;
              4'hf: out_low = 9'h1bf;
              default: out_low = 9'h000;
            endcase
          end
          6'h03: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1c0;
              4'h1: out_low = 9'h1c0;
              4'h2: out_low = 9'h1c1;
              4'h3: out_low = 9'h1c1;
              4'h4: out_low = 9'h1c2;
              4'h5: out_low = 9'h1c2;
              4'h6: out_low = 9'h1c3;
              4'h7: out_low = 9'h1c3;
              4'h8: out_low = 9'h1c4;
              4'h9: out_low = 9'h1c4;
              4'ha: out_low = 9'h1c5;
              4'hb: out_low = 9'h1c5;
              4'hc: out_low = 9'h1c6;
              4'hd: out_low = 9'h1c6;
              4'he: out_low = 9'h1c7;
              4'hf: out_low = 9'h1c7;
              default: out_low = 9'h000;
            endcase
          end
          6'h04: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1c8;
              4'h1: out_low = 9'h1c8;
              4'h2: out_low = 9'h1c9;
              4'h3: out_low = 9'h1c9;
              4'h4: out_low = 9'h1ca;
              4'h5: out_low = 9'h1ca;
              4'h6: out_low = 9'h1cb;
              4'h7: out_low = 9'h1cb;
              4'h8: out_low = 9'h1cc;
              4'h9: out_low = 9'h1cc;
              4'ha: out_low = 9'h1cd;
              4'hb: out_low = 9'h1cd;
              4'hc: out_low = 9'h1ce;
              4'hd: out_low = 9'h1ce;
              4'he: out_low = 9'h1cf;
              4'hf: out_low = 9'h1cf;
              default: out_low = 9'h000;
            endcase
          end
          6'h05: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1d0;
              4'h1: out_low = 9'h1d0;
              4'h2: out_low = 9'h1d1;
              4'h3: out_low = 9'h1d1;
              4'h4: out_low = 9'h1d2;
              4'h5: out_low = 9'h1d2;
              4'h6: out_low = 9'h1d3;
              4'h7: out_low = 9'h1d3;
              4'h8: out_low = 9'h1d4;
              4'h9: out_low = 9'h1d4;
              4'ha: out_low = 9'h1d5;
              4'hb: out_low = 9'h1d5;
              4'hc: out_low = 9'h1d6;
              4'hd: out_low = 9'h1d6;
              4'he: out_low = 9'h1d7;
              4'hf: out_low = 9'h1d7;
              default: out_low = 9'h000;
            endcase
          end
          6'h06: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1d8;
              4'h1: out_low = 9'h1d8;
              4'h2: out_low = 9'h1d9;
              4'h3: out_low = 9'h1d9;
              4'h4: out_low = 9'h1da;
              4'h5: out_low = 9'h1db;
              4'h6: out_low = 9'h1db;
              4'h7: out_low = 9'h1dc;
              4'h8: out_low = 9'h1dc;
              4'h9: out_low = 9'h1dd;
              4'ha: out_low = 9'h1dd;
              4'hb: out_low = 9'h1de;
              4'hc: out_low = 9'h1de;
              4'hd: out_low = 9'h1df;
              4'he: out_low = 9'h1df;
              4'hf: out_low = 9'h1e0;
              default: out_low = 9'h000;
            endcase
          end
          6'h07: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1e0;
              4'h1: out_low = 9'h1e1;
              4'h2: out_low = 9'h1e1;
              4'h3: out_low = 9'h1e2;
              4'h4: out_low = 9'h1e2;
              4'h5: out_low = 9'h1e3;
              4'h6: out_low = 9'h1e3;
              4'h7: out_low = 9'h1e4;
              4'h8: out_low = 9'h1e4;
              4'h9: out_low = 9'h1e5;
              4'ha: out_low = 9'h1e5;
              4'hb: out_low = 9'h1e6;
              4'hc: out_low = 9'h1e6;
              4'hd: out_low = 9'h1e7;
              4'he: out_low = 9'h1e7;
              4'hf: out_low = 9'h1e8;
              default: out_low = 9'h000;
            endcase
          end
          6'h08: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1e8;
              4'h1: out_low = 9'h1e9;
              4'h2: out_low = 9'h1e9;
              4'h3: out_low = 9'h1ea;
              4'h4: out_low = 9'h1ea;
              4'h5: out_low = 9'h1eb;
              4'h6: out_low = 9'h1eb;
              4'h7: out_low = 9'h1ec;
              4'h8: out_low = 9'h1ec;
              4'h9: out_low = 9'h1ed;
              4'ha: out_low = 9'h1ed;
              4'hb: out_low = 9'h1ee;
              4'hc: out_low = 9'h1ee;
              4'hd: out_low = 9'h1ef;
              4'he: out_low = 9'h1ef;
              4'hf: out_low = 9'h1f0;
              default: out_low = 9'h000;
            endcase
          end
          6'h09: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1f0;
              4'h1: out_low = 9'h1f1;
              4'h2: out_low = 9'h1f2;
              4'h3: out_low = 9'h1f2;
              4'h4: out_low = 9'h1f3;
              4'h5: out_low = 9'h1f3;
              4'h6: out_low = 9'h1f4;
              4'h7: out_low = 9'h1f4;
              4'h8: out_low = 9'h1f5;
              4'h9: out_low = 9'h1f5;
              4'ha: out_low = 9'h1f6;
              4'hb: out_low = 9'h1f6;
              4'hc: out_low = 9'h1f7;
              4'hd: out_low = 9'h1f7;
              4'he: out_low = 9'h1f8;
              4'hf: out_low = 9'h1f8;
              default: out_low = 9'h000;
            endcase
          end
          6'h0a: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1f9;
              4'h1: out_low = 9'h1f9;
              4'h2: out_low = 9'h1fa;
              4'h3: out_low = 9'h1fa;
              4'h4: out_low = 9'h1fb;
              4'h5: out_low = 9'h1fb;
              4'h6: out_low = 9'h1fc;
              4'h7: out_low = 9'h1fc;
              4'h8: out_low = 9'h1fd;
              4'h9: out_low = 9'h1fd;
              4'ha: out_low = 9'h1fe;
              4'hb: out_low = 9'h1fe;
              4'hc: out_low = 9'h1ff;
              4'hd: out_low = 9'h1ff;
              4'he: out_low = 9'h000;
              4'hf: out_low = 9'h001;
              default: out_low = 9'h000;
            endcase
          end
          6'h0b: begin
            case (mant[3:0])
              4'h0: out_low = 9'h001;
              4'h1: out_low = 9'h002;
              4'h2: out_low = 9'h002;
              4'h3: out_low = 9'h003;
              4'h4: out_low = 9'h003;
              4'h5: out_low = 9'h004;
              4'h6: out_low = 9'h004;
              4'h7: out_low = 9'h005;
              4'h8: out_low = 9'h005;
              4'h9: out_low = 9'h006;
              4'ha: out_low = 9'h006;
              4'hb: out_low = 9'h007;
              4'hc: out_low = 9'h007;
              4'hd: out_low = 9'h008;
              4'he: out_low = 9'h008;
              4'hf: out_low = 9'h009;
              default: out_low = 9'h000;
            endcase
          end
          6'h0c: begin
            case (mant[3:0])
              4'h0: out_low = 9'h009;
              4'h1: out_low = 9'h00a;
              4'h2: out_low = 9'h00a;
              4'h3: out_low = 9'h00b;
              4'h4: out_low = 9'h00b;
              4'h5: out_low = 9'h00c;
              4'h6: out_low = 9'h00d;
              4'h7: out_low = 9'h00d;
              4'h8: out_low = 9'h00e;
              4'h9: out_low = 9'h00e;
              4'ha: out_low = 9'h00f;
              4'hb: out_low = 9'h00f;
              4'hc: out_low = 9'h010;
              4'hd: out_low = 9'h010;
              4'he: out_low = 9'h011;
              4'hf: out_low = 9'h011;
              default: out_low = 9'h000;
            endcase
          end
          6'h0d: begin
            case (mant[3:0])
              4'h0: out_low = 9'h012;
              4'h1: out_low = 9'h012;
              4'h2: out_low = 9'h013;
              4'h3: out_low = 9'h013;
              4'h4: out_low = 9'h014;
              4'h5: out_low = 9'h014;
              4'h6: out_low = 9'h015;
              4'h7: out_low = 9'h015;
              4'h8: out_low = 9'h016;
              4'h9: out_low = 9'h017;
              4'ha: out_low = 9'h017;
              4'hb: out_low = 9'h018;
              4'hc: out_low = 9'h018;
              4'hd: out_low = 9'h019;
              4'he: out_low = 9'h019;
              4'hf: out_low = 9'h01a;
              default: out_low = 9'h000;
            endcase
          end
          6'h0e: begin
            case (mant[3:0])
              4'h0: out_low = 9'h01a;
              4'h1: out_low = 9'h01b;
              4'h2: out_low = 9'h01b;
              4'h3: out_low = 9'h01c;
              4'h4: out_low = 9'h01c;
              4'h5: out_low = 9'h01d;
              4'h6: out_low = 9'h01d;
              4'h7: out_low = 9'h01e;
              4'h8: out_low = 9'h01e;
              4'h9: out_low = 9'h01f;
              4'ha: out_low = 9'h020;
              4'hb: out_low = 9'h020;
              4'hc: out_low = 9'h021;
              4'hd: out_low = 9'h021;
              4'he: out_low = 9'h022;
              4'hf: out_low = 9'h022;
              default: out_low = 9'h000;
            endcase
          end
          6'h0f: begin
            case (mant[3:0])
              4'h0: out_low = 9'h023;
              4'h1: out_low = 9'h023;
              4'h2: out_low = 9'h024;
              4'h3: out_low = 9'h024;
              4'h4: out_low = 9'h025;
              4'h5: out_low = 9'h025;
              4'h6: out_low = 9'h026;
              4'h7: out_low = 9'h026;
              4'h8: out_low = 9'h027;
              4'h9: out_low = 9'h027;
              4'ha: out_low = 9'h028;
              4'hb: out_low = 9'h029;
              4'hc: out_low = 9'h029;
              4'hd: out_low = 9'h02a;
              4'he: out_low = 9'h02a;
              4'hf: out_low = 9'h02b;
              default: out_low = 9'h000;
            endcase
          end
          6'h10: begin
            case (mant[3:0])
              4'h0: out_low = 9'h02b;
              4'h1: out_low = 9'h02c;
              4'h2: out_low = 9'h02c;
              4'h3: out_low = 9'h02d;
              4'h4: out_low = 9'h02d;
              4'h5: out_low = 9'h02e;
              4'h6: out_low = 9'h02e;
              4'h7: out_low = 9'h02f;
              4'h8: out_low = 9'h030;
              4'h9: out_low = 9'h030;
              4'ha: out_low = 9'h031;
              4'hb: out_low = 9'h031;
              4'hc: out_low = 9'h032;
              4'hd: out_low = 9'h032;
              4'he: out_low = 9'h033;
              4'hf: out_low = 9'h033;
              default: out_low = 9'h000;
            endcase
          end
          6'h11: begin
            case (mant[3:0])
              4'h0: out_low = 9'h034;
              4'h1: out_low = 9'h034;
              4'h2: out_low = 9'h035;
              4'h3: out_low = 9'h035;
              4'h4: out_low = 9'h036;
              4'h5: out_low = 9'h036;
              4'h6: out_low = 9'h037;
              4'h7: out_low = 9'h038;
              4'h8: out_low = 9'h038;
              4'h9: out_low = 9'h039;
              4'ha: out_low = 9'h039;
              4'hb: out_low = 9'h03a;
              4'hc: out_low = 9'h03a;
              4'hd: out_low = 9'h03b;
              4'he: out_low = 9'h03b;
              4'hf: out_low = 9'h03c;
              default: out_low = 9'h000;
            endcase
          end
          6'h12: begin
            case (mant[3:0])
              4'h0: out_low = 9'h03c;
              4'h1: out_low = 9'h03d;
              4'h2: out_low = 9'h03e;
              4'h3: out_low = 9'h03e;
              4'h4: out_low = 9'h03f;
              4'h5: out_low = 9'h03f;
              4'h6: out_low = 9'h040;
              4'h7: out_low = 9'h040;
              4'h8: out_low = 9'h041;
              4'h9: out_low = 9'h041;
              4'ha: out_low = 9'h042;
              4'hb: out_low = 9'h042;
              4'hc: out_low = 9'h043;
              4'hd: out_low = 9'h043;
              4'he: out_low = 9'h044;
              4'hf: out_low = 9'h045;
              default: out_low = 9'h000;
            endcase
          end
          6'h13: begin
            case (mant[3:0])
              4'h0: out_low = 9'h045;
              4'h1: out_low = 9'h046;
              4'h2: out_low = 9'h046;
              4'h3: out_low = 9'h047;
              4'h4: out_low = 9'h047;
              4'h5: out_low = 9'h048;
              4'h6: out_low = 9'h048;
              4'h7: out_low = 9'h049;
              4'h8: out_low = 9'h049;
              4'h9: out_low = 9'h04a;
              4'ha: out_low = 9'h04b;
              4'hb: out_low = 9'h04b;
              4'hc: out_low = 9'h04c;
              4'hd: out_low = 9'h04c;
              4'he: out_low = 9'h04d;
              4'hf: out_low = 9'h04d;
              default: out_low = 9'h000;
            endcase
          end
          6'h14: begin
            case (mant[3:0])
              4'h0: out_low = 9'h04e;
              4'h1: out_low = 9'h04e;
              4'h2: out_low = 9'h04f;
              4'h3: out_low = 9'h04f;
              4'h4: out_low = 9'h050;
              4'h5: out_low = 9'h051;
              4'h6: out_low = 9'h051;
              4'h7: out_low = 9'h052;
              4'h8: out_low = 9'h052;
              4'h9: out_low = 9'h053;
              4'ha: out_low = 9'h053;
              4'hb: out_low = 9'h054;
              4'hc: out_low = 9'h054;
              4'hd: out_low = 9'h055;
              4'he: out_low = 9'h055;
              4'hf: out_low = 9'h056;
              default: out_low = 9'h000;
            endcase
          end
          6'h15: begin
            case (mant[3:0])
              4'h0: out_low = 9'h057;
              4'h1: out_low = 9'h057;
              4'h2: out_low = 9'h058;
              4'h3: out_low = 9'h058;
              4'h4: out_low = 9'h059;
              4'h5: out_low = 9'h059;
              4'h6: out_low = 9'h05a;
              4'h7: out_low = 9'h05a;
              4'h8: out_low = 9'h05b;
              4'h9: out_low = 9'h05c;
              4'ha: out_low = 9'h05c;
              4'hb: out_low = 9'h05d;
              4'hc: out_low = 9'h05d;
              4'hd: out_low = 9'h05e;
              4'he: out_low = 9'h05e;
              4'hf: out_low = 9'h05f;
              default: out_low = 9'h000;
            endcase
          end
          6'h16: begin
            case (mant[3:0])
              4'h0: out_low = 9'h05f;
              4'h1: out_low = 9'h060;
              4'h2: out_low = 9'h060;
              4'h3: out_low = 9'h061;
              4'h4: out_low = 9'h062;
              4'h5: out_low = 9'h062;
              4'h6: out_low = 9'h063;
              4'h7: out_low = 9'h063;
              4'h8: out_low = 9'h064;
              4'h9: out_low = 9'h064;
              4'ha: out_low = 9'h065;
              4'hb: out_low = 9'h065;
              4'hc: out_low = 9'h066;
              4'hd: out_low = 9'h067;
              4'he: out_low = 9'h067;
              4'hf: out_low = 9'h068;
              default: out_low = 9'h000;
            endcase
          end
          6'h17: begin
            case (mant[3:0])
              4'h0: out_low = 9'h068;
              4'h1: out_low = 9'h069;
              4'h2: out_low = 9'h069;
              4'h3: out_low = 9'h06a;
              4'h4: out_low = 9'h06a;
              4'h5: out_low = 9'h06b;
              4'h6: out_low = 9'h06c;
              4'h7: out_low = 9'h06c;
              4'h8: out_low = 9'h06d;
              4'h9: out_low = 9'h06d;
              4'ha: out_low = 9'h06e;
              4'hb: out_low = 9'h06e;
              4'hc: out_low = 9'h06f;
              4'hd: out_low = 9'h06f;
              4'he: out_low = 9'h070;
              4'hf: out_low = 9'h071;
              default: out_low = 9'h000;
            endcase
          end
          6'h18: begin
            case (mant[3:0])
              4'h0: out_low = 9'h071;
              4'h1: out_low = 9'h072;
              4'h2: out_low = 9'h072;
              4'h3: out_low = 9'h073;
              4'h4: out_low = 9'h073;
              4'h5: out_low = 9'h074;
              4'h6: out_low = 9'h074;
              4'h7: out_low = 9'h075;
              4'h8: out_low = 9'h076;
              4'h9: out_low = 9'h076;
              4'ha: out_low = 9'h077;
              4'hb: out_low = 9'h077;
              4'hc: out_low = 9'h078;
              4'hd: out_low = 9'h078;
              4'he: out_low = 9'h079;
              4'hf: out_low = 9'h07a;
              default: out_low = 9'h000;
            endcase
          end
          6'h19: begin
            case (mant[3:0])
              4'h0: out_low = 9'h07a;
              4'h1: out_low = 9'h07b;
              4'h2: out_low = 9'h07b;
              4'h3: out_low = 9'h07c;
              4'h4: out_low = 9'h07c;
              4'h5: out_low = 9'h07d;
              4'h6: out_low = 9'h07d;
              4'h7: out_low = 9'h07e;
              4'h8: out_low = 9'h07f;
              4'h9: out_low = 9'h07f;
              4'ha: out_low = 9'h080;
              4'hb: out_low = 9'h080;
              4'hc: out_low = 9'h081;
              4'hd: out_low = 9'h081;
              4'he: out_low = 9'h082;
              4'hf: out_low = 9'h083;
              default: out_low = 9'h000;
            endcase
          end
          6'h1a: begin
            case (mant[3:0])
              4'h0: out_low = 9'h083;
              4'h1: out_low = 9'h084;
              4'h2: out_low = 9'h084;
              4'h3: out_low = 9'h085;
              4'h4: out_low = 9'h085;
              4'h5: out_low = 9'h086;
              4'h6: out_low = 9'h086;
              4'h7: out_low = 9'h087;
              4'h8: out_low = 9'h088;
              4'h9: out_low = 9'h088;
              4'ha: out_low = 9'h089;
              4'hb: out_low = 9'h089;
              4'hc: out_low = 9'h08a;
              4'hd: out_low = 9'h08a;
              4'he: out_low = 9'h08b;
              4'hf: out_low = 9'h08c;
              default: out_low = 9'h000;
            endcase
          end
          6'h1b: begin
            case (mant[3:0])
              4'h0: out_low = 9'h08c;
              4'h1: out_low = 9'h08d;
              4'h2: out_low = 9'h08d;
              4'h3: out_low = 9'h08e;
              4'h4: out_low = 9'h08e;
              4'h5: out_low = 9'h08f;
              4'h6: out_low = 9'h090;
              4'h7: out_low = 9'h090;
              4'h8: out_low = 9'h091;
              4'h9: out_low = 9'h091;
              4'ha: out_low = 9'h092;
              4'hb: out_low = 9'h092;
              4'hc: out_low = 9'h093;
              4'hd: out_low = 9'h094;
              4'he: out_low = 9'h094;
              4'hf: out_low = 9'h095;
              default: out_low = 9'h000;
            endcase
          end
          6'h1c: begin
            case (mant[3:0])
              4'h0: out_low = 9'h095;
              4'h1: out_low = 9'h096;
              4'h2: out_low = 9'h096;
              4'h3: out_low = 9'h097;
              4'h4: out_low = 9'h098;
              4'h5: out_low = 9'h098;
              4'h6: out_low = 9'h099;
              4'h7: out_low = 9'h099;
              4'h8: out_low = 9'h09a;
              4'h9: out_low = 9'h09a;
              4'ha: out_low = 9'h09b;
              4'hb: out_low = 9'h09c;
              4'hc: out_low = 9'h09c;
              4'hd: out_low = 9'h09d;
              4'he: out_low = 9'h09d;
              4'hf: out_low = 9'h09e;
              default: out_low = 9'h000;
            endcase
          end
          6'h1d: begin
            case (mant[3:0])
              4'h0: out_low = 9'h09e;
              4'h1: out_low = 9'h09f;
              4'h2: out_low = 9'h0a0;
              4'h3: out_low = 9'h0a0;
              4'h4: out_low = 9'h0a1;
              4'h5: out_low = 9'h0a1;
              4'h6: out_low = 9'h0a2;
              4'h7: out_low = 9'h0a2;
              4'h8: out_low = 9'h0a3;
              4'h9: out_low = 9'h0a4;
              4'ha: out_low = 9'h0a4;
              4'hb: out_low = 9'h0a5;
              4'hc: out_low = 9'h0a5;
              4'hd: out_low = 9'h0a6;
              4'he: out_low = 9'h0a6;
              4'hf: out_low = 9'h0a7;
              default: out_low = 9'h000;
            endcase
          end
          6'h1e: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0a8;
              4'h1: out_low = 9'h0a8;
              4'h2: out_low = 9'h0a9;
              4'h3: out_low = 9'h0a9;
              4'h4: out_low = 9'h0aa;
              4'h5: out_low = 9'h0aa;
              4'h6: out_low = 9'h0ab;
              4'h7: out_low = 9'h0ac;
              4'h8: out_low = 9'h0ac;
              4'h9: out_low = 9'h0ad;
              4'ha: out_low = 9'h0ad;
              4'hb: out_low = 9'h0ae;
              4'hc: out_low = 9'h0af;
              4'hd: out_low = 9'h0af;
              4'he: out_low = 9'h0b0;
              4'hf: out_low = 9'h0b0;
              default: out_low = 9'h000;
            endcase
          end
          6'h1f: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0b1;
              4'h1: out_low = 9'h0b1;
              4'h2: out_low = 9'h0b2;
              4'h3: out_low = 9'h0b3;
              4'h4: out_low = 9'h0b3;
              4'h5: out_low = 9'h0b4;
              4'h6: out_low = 9'h0b4;
              4'h7: out_low = 9'h0b5;
              4'h8: out_low = 9'h0b5;
              4'h9: out_low = 9'h0b6;
              4'ha: out_low = 9'h0b7;
              4'hb: out_low = 9'h0b7;
              4'hc: out_low = 9'h0b8;
              4'hd: out_low = 9'h0b8;
              4'he: out_low = 9'h0b9;
              4'hf: out_low = 9'h0ba;
              default: out_low = 9'h000;
            endcase
          end
          6'h20: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0ba;
              4'h1: out_low = 9'h0bb;
              4'h2: out_low = 9'h0bb;
              4'h3: out_low = 9'h0bc;
              4'h4: out_low = 9'h0bc;
              4'h5: out_low = 9'h0bd;
              4'h6: out_low = 9'h0be;
              4'h7: out_low = 9'h0be;
              4'h8: out_low = 9'h0bf;
              4'h9: out_low = 9'h0bf;
              4'ha: out_low = 9'h0c0;
              4'hb: out_low = 9'h0c1;
              4'hc: out_low = 9'h0c1;
              4'hd: out_low = 9'h0c2;
              4'he: out_low = 9'h0c2;
              4'hf: out_low = 9'h0c3;
              default: out_low = 9'h000;
            endcase
          end
          6'h21: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0c4;
              4'h1: out_low = 9'h0c4;
              4'h2: out_low = 9'h0c5;
              4'h3: out_low = 9'h0c5;
              4'h4: out_low = 9'h0c6;
              4'h5: out_low = 9'h0c6;
              4'h6: out_low = 9'h0c7;
              4'h7: out_low = 9'h0c8;
              4'h8: out_low = 9'h0c8;
              4'h9: out_low = 9'h0c9;
              4'ha: out_low = 9'h0c9;
              4'hb: out_low = 9'h0ca;
              4'hc: out_low = 9'h0cb;
              4'hd: out_low = 9'h0cb;
              4'he: out_low = 9'h0cc;
              4'hf: out_low = 9'h0cc;
              default: out_low = 9'h000;
            endcase
          end
          6'h22: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0cd;
              4'h1: out_low = 9'h0cd;
              4'h2: out_low = 9'h0ce;
              4'h3: out_low = 9'h0cf;
              4'h4: out_low = 9'h0cf;
              4'h5: out_low = 9'h0d0;
              4'h6: out_low = 9'h0d0;
              4'h7: out_low = 9'h0d1;
              4'h8: out_low = 9'h0d2;
              4'h9: out_low = 9'h0d2;
              4'ha: out_low = 9'h0d3;
              4'hb: out_low = 9'h0d3;
              4'hc: out_low = 9'h0d4;
              4'hd: out_low = 9'h0d5;
              4'he: out_low = 9'h0d5;
              4'hf: out_low = 9'h0d6;
              default: out_low = 9'h000;
            endcase
          end
          6'h23: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0d6;
              4'h1: out_low = 9'h0d7;
              4'h2: out_low = 9'h0d8;
              4'h3: out_low = 9'h0d8;
              4'h4: out_low = 9'h0d9;
              4'h5: out_low = 9'h0d9;
              4'h6: out_low = 9'h0da;
              4'h7: out_low = 9'h0db;
              4'h8: out_low = 9'h0db;
              4'h9: out_low = 9'h0dc;
              4'ha: out_low = 9'h0dc;
              4'hb: out_low = 9'h0dd;
              4'hc: out_low = 9'h0dd;
              4'hd: out_low = 9'h0de;
              4'he: out_low = 9'h0df;
              4'hf: out_low = 9'h0df;
              default: out_low = 9'h000;
            endcase
          end
          6'h24: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0e0;
              4'h1: out_low = 9'h0e0;
              4'h2: out_low = 9'h0e1;
              4'h3: out_low = 9'h0e2;
              4'h4: out_low = 9'h0e2;
              4'h5: out_low = 9'h0e3;
              4'h6: out_low = 9'h0e3;
              4'h7: out_low = 9'h0e4;
              4'h8: out_low = 9'h0e5;
              4'h9: out_low = 9'h0e5;
              4'ha: out_low = 9'h0e6;
              4'hb: out_low = 9'h0e6;
              4'hc: out_low = 9'h0e7;
              4'hd: out_low = 9'h0e8;
              4'he: out_low = 9'h0e8;
              4'hf: out_low = 9'h0e9;
              default: out_low = 9'h000;
            endcase
          end
          6'h25: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0e9;
              4'h1: out_low = 9'h0ea;
              4'h2: out_low = 9'h0eb;
              4'h3: out_low = 9'h0eb;
              4'h4: out_low = 9'h0ec;
              4'h5: out_low = 9'h0ec;
              4'h6: out_low = 9'h0ed;
              4'h7: out_low = 9'h0ee;
              4'h8: out_low = 9'h0ee;
              4'h9: out_low = 9'h0ef;
              4'ha: out_low = 9'h0ef;
              4'hb: out_low = 9'h0f0;
              4'hc: out_low = 9'h0f1;
              4'hd: out_low = 9'h0f1;
              4'he: out_low = 9'h0f2;
              4'hf: out_low = 9'h0f2;
              default: out_low = 9'h000;
            endcase
          end
          6'h26: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0f3;
              4'h1: out_low = 9'h0f4;
              4'h2: out_low = 9'h0f4;
              4'h3: out_low = 9'h0f5;
              4'h4: out_low = 9'h0f5;
              4'h5: out_low = 9'h0f6;
              4'h6: out_low = 9'h0f7;
              4'h7: out_low = 9'h0f7;
              4'h8: out_low = 9'h0f8;
              4'h9: out_low = 9'h0f8;
              4'ha: out_low = 9'h0f9;
              4'hb: out_low = 9'h0fa;
              4'hc: out_low = 9'h0fa;
              4'hd: out_low = 9'h0fb;
              4'he: out_low = 9'h0fb;
              4'hf: out_low = 9'h0fc;
              default: out_low = 9'h000;
            endcase
          end
          6'h27: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0fd;
              4'h1: out_low = 9'h0fd;
              4'h2: out_low = 9'h0fe;
              4'h3: out_low = 9'h0ff;
              4'h4: out_low = 9'h0ff;
              4'h5: out_low = 9'h100;
              4'h6: out_low = 9'h100;
              4'h7: out_low = 9'h101;
              4'h8: out_low = 9'h102;
              4'h9: out_low = 9'h102;
              4'ha: out_low = 9'h103;
              4'hb: out_low = 9'h103;
              4'hc: out_low = 9'h104;
              4'hd: out_low = 9'h105;
              4'he: out_low = 9'h105;
              4'hf: out_low = 9'h106;
              default: out_low = 9'h000;
            endcase
          end
          6'h28: begin
            case (mant[3:0])
              4'h0: out_low = 9'h106;
              4'h1: out_low = 9'h107;
              4'h2: out_low = 9'h108;
              4'h3: out_low = 9'h108;
              4'h4: out_low = 9'h109;
              4'h5: out_low = 9'h109;
              4'h6: out_low = 9'h10a;
              4'h7: out_low = 9'h10b;
              4'h8: out_low = 9'h10b;
              4'h9: out_low = 9'h10c;
              4'ha: out_low = 9'h10c;
              4'hb: out_low = 9'h10d;
              4'hc: out_low = 9'h10e;
              4'hd: out_low = 9'h10e;
              4'he: out_low = 9'h10f;
              4'hf: out_low = 9'h110;
              default: out_low = 9'h000;
            endcase
          end
          6'h29: begin
            case (mant[3:0])
              4'h0: out_low = 9'h110;
              4'h1: out_low = 9'h111;
              4'h2: out_low = 9'h111;
              4'h3: out_low = 9'h112;
              4'h4: out_low = 9'h113;
              4'h5: out_low = 9'h113;
              4'h6: out_low = 9'h114;
              4'h7: out_low = 9'h114;
              4'h8: out_low = 9'h115;
              4'h9: out_low = 9'h116;
              4'ha: out_low = 9'h116;
              4'hb: out_low = 9'h117;
              4'hc: out_low = 9'h118;
              4'hd: out_low = 9'h118;
              4'he: out_low = 9'h119;
              4'hf: out_low = 9'h119;
              default: out_low = 9'h000;
            endcase
          end
          6'h2a: begin
            case (mant[3:0])
              4'h0: out_low = 9'h11a;
              4'h1: out_low = 9'h11b;
              4'h2: out_low = 9'h11b;
              4'h3: out_low = 9'h11c;
              4'h4: out_low = 9'h11c;
              4'h5: out_low = 9'h11d;
              4'h6: out_low = 9'h11e;
              4'h7: out_low = 9'h11e;
              4'h8: out_low = 9'h11f;
              4'h9: out_low = 9'h120;
              4'ha: out_low = 9'h120;
              4'hb: out_low = 9'h121;
              4'hc: out_low = 9'h121;
              4'hd: out_low = 9'h122;
              4'he: out_low = 9'h123;
              4'hf: out_low = 9'h123;
              default: out_low = 9'h000;
            endcase
          end
          6'h2b: begin
            case (mant[3:0])
              4'h0: out_low = 9'h124;
              4'h1: out_low = 9'h124;
              4'h2: out_low = 9'h125;
              4'h3: out_low = 9'h126;
              4'h4: out_low = 9'h126;
              4'h5: out_low = 9'h127;
              4'h6: out_low = 9'h128;
              4'h7: out_low = 9'h128;
              4'h8: out_low = 9'h129;
              4'h9: out_low = 9'h129;
              4'ha: out_low = 9'h12a;
              4'hb: out_low = 9'h12b;
              4'hc: out_low = 9'h12b;
              4'hd: out_low = 9'h12c;
              4'he: out_low = 9'h12d;
              4'hf: out_low = 9'h12d;
              default: out_low = 9'h000;
            endcase
          end
          6'h2c: begin
            case (mant[3:0])
              4'h0: out_low = 9'h12e;
              4'h1: out_low = 9'h12e;
              4'h2: out_low = 9'h12f;
              4'h3: out_low = 9'h130;
              4'h4: out_low = 9'h130;
              4'h5: out_low = 9'h131;
              4'h6: out_low = 9'h132;
              4'h7: out_low = 9'h132;
              4'h8: out_low = 9'h133;
              4'h9: out_low = 9'h133;
              4'ha: out_low = 9'h134;
              4'hb: out_low = 9'h135;
              4'hc: out_low = 9'h135;
              4'hd: out_low = 9'h136;
              4'he: out_low = 9'h137;
              4'hf: out_low = 9'h137;
              default: out_low = 9'h000;
            endcase
          end
          6'h2d: begin
            case (mant[3:0])
              4'h0: out_low = 9'h138;
              4'h1: out_low = 9'h138;
              4'h2: out_low = 9'h139;
              4'h3: out_low = 9'h13a;
              4'h4: out_low = 9'h13a;
              4'h5: out_low = 9'h13b;
              4'h6: out_low = 9'h13c;
              4'h7: out_low = 9'h13c;
              4'h8: out_low = 9'h13d;
              4'h9: out_low = 9'h13d;
              4'ha: out_low = 9'h13e;
              4'hb: out_low = 9'h13f;
              4'hc: out_low = 9'h13f;
              4'hd: out_low = 9'h140;
              4'he: out_low = 9'h141;
              4'hf: out_low = 9'h141;
              default: out_low = 9'h000;
            endcase
          end
          6'h2e: begin
            case (mant[3:0])
              4'h0: out_low = 9'h142;
              4'h1: out_low = 9'h142;
              4'h2: out_low = 9'h143;
              4'h3: out_low = 9'h144;
              4'h4: out_low = 9'h144;
              4'h5: out_low = 9'h145;
              4'h6: out_low = 9'h146;
              4'h7: out_low = 9'h146;
              4'h8: out_low = 9'h147;
              4'h9: out_low = 9'h147;
              4'ha: out_low = 9'h148;
              4'hb: out_low = 9'h149;
              4'hc: out_low = 9'h149;
              4'hd: out_low = 9'h14a;
              4'he: out_low = 9'h14b;
              4'hf: out_low = 9'h14b;
              default: out_low = 9'h000;
            endcase
          end
          6'h2f: begin
            case (mant[3:0])
              4'h0: out_low = 9'h14c;
              4'h1: out_low = 9'h14d;
              4'h2: out_low = 9'h14d;
              4'h3: out_low = 9'h14e;
              4'h4: out_low = 9'h14e;
              4'h5: out_low = 9'h14f;
              4'h6: out_low = 9'h150;
              4'h7: out_low = 9'h150;
              4'h8: out_low = 9'h151;
              4'h9: out_low = 9'h152;
              4'ha: out_low = 9'h152;
              4'hb: out_low = 9'h153;
              4'hc: out_low = 9'h153;
              4'hd: out_low = 9'h154;
              4'he: out_low = 9'h155;
              4'hf: out_low = 9'h155;
              default: out_low = 9'h000;
            endcase
          end
          6'h30: begin
            case (mant[3:0])
              4'h0: out_low = 9'h156;
              4'h1: out_low = 9'h157;
              4'h2: out_low = 9'h157;
              4'h3: out_low = 9'h158;
              4'h4: out_low = 9'h159;
              4'h5: out_low = 9'h159;
              4'h6: out_low = 9'h15a;
              4'h7: out_low = 9'h15a;
              4'h8: out_low = 9'h15b;
              4'h9: out_low = 9'h15c;
              4'ha: out_low = 9'h15c;
              4'hb: out_low = 9'h15d;
              4'hc: out_low = 9'h15e;
              4'hd: out_low = 9'h15e;
              4'he: out_low = 9'h15f;
              4'hf: out_low = 9'h160;
              default: out_low = 9'h000;
            endcase
          end
          6'h31: begin
            case (mant[3:0])
              4'h0: out_low = 9'h160;
              4'h1: out_low = 9'h161;
              4'h2: out_low = 9'h162;
              4'h3: out_low = 9'h162;
              4'h4: out_low = 9'h163;
              4'h5: out_low = 9'h163;
              4'h6: out_low = 9'h164;
              4'h7: out_low = 9'h165;
              4'h8: out_low = 9'h165;
              4'h9: out_low = 9'h166;
              4'ha: out_low = 9'h167;
              4'hb: out_low = 9'h167;
              4'hc: out_low = 9'h168;
              4'hd: out_low = 9'h169;
              4'he: out_low = 9'h169;
              4'hf: out_low = 9'h16a;
              default: out_low = 9'h000;
            endcase
          end
          6'h32: begin
            case (mant[3:0])
              4'h0: out_low = 9'h16a;
              4'h1: out_low = 9'h16b;
              4'h2: out_low = 9'h16c;
              4'h3: out_low = 9'h16c;
              4'h4: out_low = 9'h16d;
              4'h5: out_low = 9'h16e;
              4'h6: out_low = 9'h16e;
              4'h7: out_low = 9'h16f;
              4'h8: out_low = 9'h170;
              4'h9: out_low = 9'h170;
              4'ha: out_low = 9'h171;
              4'hb: out_low = 9'h172;
              4'hc: out_low = 9'h172;
              4'hd: out_low = 9'h173;
              4'he: out_low = 9'h173;
              4'hf: out_low = 9'h174;
              default: out_low = 9'h000;
            endcase
          end
          6'h33: begin
            case (mant[3:0])
              4'h0: out_low = 9'h175;
              4'h1: out_low = 9'h175;
              4'h2: out_low = 9'h176;
              4'h3: out_low = 9'h177;
              4'h4: out_low = 9'h177;
              4'h5: out_low = 9'h178;
              4'h6: out_low = 9'h179;
              4'h7: out_low = 9'h179;
              4'h8: out_low = 9'h17a;
              4'h9: out_low = 9'h17b;
              4'ha: out_low = 9'h17b;
              4'hb: out_low = 9'h17c;
              4'hc: out_low = 9'h17d;
              4'hd: out_low = 9'h17d;
              4'he: out_low = 9'h17e;
              4'hf: out_low = 9'h17e;
              default: out_low = 9'h000;
            endcase
          end
          6'h34: begin
            case (mant[3:0])
              4'h0: out_low = 9'h17f;
              4'h1: out_low = 9'h180;
              4'h2: out_low = 9'h180;
              4'h3: out_low = 9'h181;
              4'h4: out_low = 9'h182;
              4'h5: out_low = 9'h182;
              4'h6: out_low = 9'h183;
              4'h7: out_low = 9'h184;
              4'h8: out_low = 9'h184;
              4'h9: out_low = 9'h185;
              4'ha: out_low = 9'h186;
              4'hb: out_low = 9'h186;
              4'hc: out_low = 9'h187;
              4'hd: out_low = 9'h188;
              4'he: out_low = 9'h188;
              4'hf: out_low = 9'h189;
              default: out_low = 9'h000;
            endcase
          end
          6'h35: begin
            case (mant[3:0])
              4'h0: out_low = 9'h18a;
              4'h1: out_low = 9'h18a;
              4'h2: out_low = 9'h18b;
              4'h3: out_low = 9'h18c;
              4'h4: out_low = 9'h18c;
              4'h5: out_low = 9'h18d;
              4'h6: out_low = 9'h18d;
              4'h7: out_low = 9'h18e;
              4'h8: out_low = 9'h18f;
              4'h9: out_low = 9'h18f;
              4'ha: out_low = 9'h190;
              4'hb: out_low = 9'h191;
              4'hc: out_low = 9'h191;
              4'hd: out_low = 9'h192;
              4'he: out_low = 9'h193;
              4'hf: out_low = 9'h193;
              default: out_low = 9'h000;
            endcase
          end
          6'h36: begin
            case (mant[3:0])
              4'h0: out_low = 9'h194;
              4'h1: out_low = 9'h195;
              4'h2: out_low = 9'h195;
              4'h3: out_low = 9'h196;
              4'h4: out_low = 9'h197;
              4'h5: out_low = 9'h197;
              4'h6: out_low = 9'h198;
              4'h7: out_low = 9'h199;
              4'h8: out_low = 9'h199;
              4'h9: out_low = 9'h19a;
              4'ha: out_low = 9'h19b;
              4'hb: out_low = 9'h19b;
              4'hc: out_low = 9'h19c;
              4'hd: out_low = 9'h19d;
              4'he: out_low = 9'h19d;
              4'hf: out_low = 9'h19e;
              default: out_low = 9'h000;
            endcase
          end
          6'h37: begin
            case (mant[3:0])
              4'h0: out_low = 9'h19f;
              4'h1: out_low = 9'h19f;
              4'h2: out_low = 9'h1a0;
              4'h3: out_low = 9'h1a1;
              4'h4: out_low = 9'h1a1;
              4'h5: out_low = 9'h1a2;
              4'h6: out_low = 9'h1a3;
              4'h7: out_low = 9'h1a3;
              4'h8: out_low = 9'h1a4;
              4'h9: out_low = 9'h1a5;
              4'ha: out_low = 9'h1a5;
              4'hb: out_low = 9'h1a6;
              4'hc: out_low = 9'h1a7;
              4'hd: out_low = 9'h1a7;
              4'he: out_low = 9'h1a8;
              4'hf: out_low = 9'h1a9;
              default: out_low = 9'h000;
            endcase
          end
          6'h38: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1a9;
              4'h1: out_low = 9'h1aa;
              4'h2: out_low = 9'h1aa;
              4'h3: out_low = 9'h1ab;
              4'h4: out_low = 9'h1ac;
              4'h5: out_low = 9'h1ac;
              4'h6: out_low = 9'h1ad;
              4'h7: out_low = 9'h1ae;
              4'h8: out_low = 9'h1ae;
              4'h9: out_low = 9'h1af;
              4'ha: out_low = 9'h1b0;
              4'hb: out_low = 9'h1b0;
              4'hc: out_low = 9'h1b1;
              4'hd: out_low = 9'h1b2;
              4'he: out_low = 9'h1b2;
              4'hf: out_low = 9'h1b3;
              default: out_low = 9'h000;
            endcase
          end
          6'h39: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1b4;
              4'h1: out_low = 9'h1b4;
              4'h2: out_low = 9'h1b5;
              4'h3: out_low = 9'h1b6;
              4'h4: out_low = 9'h1b6;
              4'h5: out_low = 9'h1b7;
              4'h6: out_low = 9'h1b8;
              4'h7: out_low = 9'h1b8;
              4'h8: out_low = 9'h1b9;
              4'h9: out_low = 9'h1ba;
              4'ha: out_low = 9'h1bb;
              4'hb: out_low = 9'h1bb;
              4'hc: out_low = 9'h1bc;
              4'hd: out_low = 9'h1bd;
              4'he: out_low = 9'h1bd;
              4'hf: out_low = 9'h1be;
              default: out_low = 9'h000;
            endcase
          end
          6'h3a: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1bf;
              4'h1: out_low = 9'h1bf;
              4'h2: out_low = 9'h1c0;
              4'h3: out_low = 9'h1c1;
              4'h4: out_low = 9'h1c1;
              4'h5: out_low = 9'h1c2;
              4'h6: out_low = 9'h1c3;
              4'h7: out_low = 9'h1c3;
              4'h8: out_low = 9'h1c4;
              4'h9: out_low = 9'h1c5;
              4'ha: out_low = 9'h1c5;
              4'hb: out_low = 9'h1c6;
              4'hc: out_low = 9'h1c7;
              4'hd: out_low = 9'h1c7;
              4'he: out_low = 9'h1c8;
              4'hf: out_low = 9'h1c9;
              default: out_low = 9'h000;
            endcase
          end
          6'h3b: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1c9;
              4'h1: out_low = 9'h1ca;
              4'h2: out_low = 9'h1cb;
              4'h3: out_low = 9'h1cb;
              4'h4: out_low = 9'h1cc;
              4'h5: out_low = 9'h1cd;
              4'h6: out_low = 9'h1cd;
              4'h7: out_low = 9'h1ce;
              4'h8: out_low = 9'h1cf;
              4'h9: out_low = 9'h1cf;
              4'ha: out_low = 9'h1d0;
              4'hb: out_low = 9'h1d1;
              4'hc: out_low = 9'h1d1;
              4'hd: out_low = 9'h1d2;
              4'he: out_low = 9'h1d3;
              4'hf: out_low = 9'h1d3;
              default: out_low = 9'h000;
            endcase
          end
          6'h3c: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1d4;
              4'h1: out_low = 9'h1d5;
              4'h2: out_low = 9'h1d5;
              4'h3: out_low = 9'h1d6;
              4'h4: out_low = 9'h1d7;
              4'h5: out_low = 9'h1d8;
              4'h6: out_low = 9'h1d8;
              4'h7: out_low = 9'h1d9;
              4'h8: out_low = 9'h1da;
              4'h9: out_low = 9'h1da;
              4'ha: out_low = 9'h1db;
              4'hb: out_low = 9'h1dc;
              4'hc: out_low = 9'h1dc;
              4'hd: out_low = 9'h1dd;
              4'he: out_low = 9'h1de;
              4'hf: out_low = 9'h1de;
              default: out_low = 9'h000;
            endcase
          end
          6'h3d: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1df;
              4'h1: out_low = 9'h1e0;
              4'h2: out_low = 9'h1e0;
              4'h3: out_low = 9'h1e1;
              4'h4: out_low = 9'h1e2;
              4'h5: out_low = 9'h1e2;
              4'h6: out_low = 9'h1e3;
              4'h7: out_low = 9'h1e4;
              4'h8: out_low = 9'h1e4;
              4'h9: out_low = 9'h1e5;
              4'ha: out_low = 9'h1e6;
              4'hb: out_low = 9'h1e7;
              4'hc: out_low = 9'h1e7;
              4'hd: out_low = 9'h1e8;
              4'he: out_low = 9'h1e9;
              4'hf: out_low = 9'h1e9;
              default: out_low = 9'h000;
            endcase
          end
          6'h3e: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1ea;
              4'h1: out_low = 9'h1eb;
              4'h2: out_low = 9'h1eb;
              4'h3: out_low = 9'h1ec;
              4'h4: out_low = 9'h1ed;
              4'h5: out_low = 9'h1ed;
              4'h6: out_low = 9'h1ee;
              4'h7: out_low = 9'h1ef;
              4'h8: out_low = 9'h1ef;
              4'h9: out_low = 9'h1f0;
              4'ha: out_low = 9'h1f1;
              4'hb: out_low = 9'h1f1;
              4'hc: out_low = 9'h1f2;
              4'hd: out_low = 9'h1f3;
              4'he: out_low = 9'h1f4;
              4'hf: out_low = 9'h1f4;
              default: out_low = 9'h000;
            endcase
          end
          6'h3f: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1f5;
              4'h1: out_low = 9'h1f6;
              4'h2: out_low = 9'h1f6;
              4'h3: out_low = 9'h1f7;
              4'h4: out_low = 9'h1f8;
              4'h5: out_low = 9'h1f8;
              4'h6: out_low = 9'h1f9;
              4'h7: out_low = 9'h1fa;
              4'h8: out_low = 9'h1fa;
              4'h9: out_low = 9'h1fb;
              4'ha: out_low = 9'h1fc;
              4'hb: out_low = 9'h1fd;
              4'hc: out_low = 9'h1fd;
              4'hd: out_low = 9'h1fe;
              4'he: out_low = 9'h1ff;
              4'hf: out_low = 9'h1ff;
              default: out_low = 9'h000;
            endcase
          end
          default: out_low = 9'h000;
        endcase
      end
      6'h0f: begin
        case (mant[9:4])
          6'h00: begin
            case (mant[3:0])
              4'h0: out_low = 9'h000;
              4'h1: out_low = 9'h001;
              4'h2: out_low = 9'h001;
              4'h3: out_low = 9'h002;
              4'h4: out_low = 9'h003;
              4'h5: out_low = 9'h003;
              4'h6: out_low = 9'h004;
              4'h7: out_low = 9'h005;
              4'h8: out_low = 9'h006;
              4'h9: out_low = 9'h006;
              4'ha: out_low = 9'h007;
              4'hb: out_low = 9'h008;
              4'hc: out_low = 9'h008;
              4'hd: out_low = 9'h009;
              4'he: out_low = 9'h00a;
              4'hf: out_low = 9'h00a;
              default: out_low = 9'h000;
            endcase
          end
          6'h01: begin
            case (mant[3:0])
              4'h0: out_low = 9'h00b;
              4'h1: out_low = 9'h00c;
              4'h2: out_low = 9'h00d;
              4'h3: out_low = 9'h00d;
              4'h4: out_low = 9'h00e;
              4'h5: out_low = 9'h00f;
              4'h6: out_low = 9'h00f;
              4'h7: out_low = 9'h010;
              4'h8: out_low = 9'h011;
              4'h9: out_low = 9'h011;
              4'ha: out_low = 9'h012;
              4'hb: out_low = 9'h013;
              4'hc: out_low = 9'h014;
              4'hd: out_low = 9'h014;
              4'he: out_low = 9'h015;
              4'hf: out_low = 9'h016;
              default: out_low = 9'h000;
            endcase
          end
          6'h02: begin
            case (mant[3:0])
              4'h0: out_low = 9'h016;
              4'h1: out_low = 9'h017;
              4'h2: out_low = 9'h018;
              4'h3: out_low = 9'h019;
              4'h4: out_low = 9'h019;
              4'h5: out_low = 9'h01a;
              4'h6: out_low = 9'h01b;
              4'h7: out_low = 9'h01b;
              4'h8: out_low = 9'h01c;
              4'h9: out_low = 9'h01d;
              4'ha: out_low = 9'h01e;
              4'hb: out_low = 9'h01e;
              4'hc: out_low = 9'h01f;
              4'hd: out_low = 9'h020;
              4'he: out_low = 9'h020;
              4'hf: out_low = 9'h021;
              default: out_low = 9'h000;
            endcase
          end
          6'h03: begin
            case (mant[3:0])
              4'h0: out_low = 9'h022;
              4'h1: out_low = 9'h023;
              4'h2: out_low = 9'h023;
              4'h3: out_low = 9'h024;
              4'h4: out_low = 9'h025;
              4'h5: out_low = 9'h025;
              4'h6: out_low = 9'h026;
              4'h7: out_low = 9'h027;
              4'h8: out_low = 9'h028;
              4'h9: out_low = 9'h028;
              4'ha: out_low = 9'h029;
              4'hb: out_low = 9'h02a;
              4'hc: out_low = 9'h02a;
              4'hd: out_low = 9'h02b;
              4'he: out_low = 9'h02c;
              4'hf: out_low = 9'h02d;
              default: out_low = 9'h000;
            endcase
          end
          6'h04: begin
            case (mant[3:0])
              4'h0: out_low = 9'h02d;
              4'h1: out_low = 9'h02e;
              4'h2: out_low = 9'h02f;
              4'h3: out_low = 9'h030;
              4'h4: out_low = 9'h030;
              4'h5: out_low = 9'h031;
              4'h6: out_low = 9'h032;
              4'h7: out_low = 9'h032;
              4'h8: out_low = 9'h033;
              4'h9: out_low = 9'h034;
              4'ha: out_low = 9'h035;
              4'hb: out_low = 9'h035;
              4'hc: out_low = 9'h036;
              4'hd: out_low = 9'h037;
              4'he: out_low = 9'h038;
              4'hf: out_low = 9'h038;
              default: out_low = 9'h000;
            endcase
          end
          6'h05: begin
            case (mant[3:0])
              4'h0: out_low = 9'h039;
              4'h1: out_low = 9'h03a;
              4'h2: out_low = 9'h03a;
              4'h3: out_low = 9'h03b;
              4'h4: out_low = 9'h03c;
              4'h5: out_low = 9'h03d;
              4'h6: out_low = 9'h03d;
              4'h7: out_low = 9'h03e;
              4'h8: out_low = 9'h03f;
              4'h9: out_low = 9'h040;
              4'ha: out_low = 9'h040;
              4'hb: out_low = 9'h041;
              4'hc: out_low = 9'h042;
              4'hd: out_low = 9'h043;
              4'he: out_low = 9'h043;
              4'hf: out_low = 9'h044;
              default: out_low = 9'h000;
            endcase
          end
          6'h06: begin
            case (mant[3:0])
              4'h0: out_low = 9'h045;
              4'h1: out_low = 9'h045;
              4'h2: out_low = 9'h046;
              4'h3: out_low = 9'h047;
              4'h4: out_low = 9'h048;
              4'h5: out_low = 9'h048;
              4'h6: out_low = 9'h049;
              4'h7: out_low = 9'h04a;
              4'h8: out_low = 9'h04b;
              4'h9: out_low = 9'h04b;
              4'ha: out_low = 9'h04c;
              4'hb: out_low = 9'h04d;
              4'hc: out_low = 9'h04e;
              4'hd: out_low = 9'h04e;
              4'he: out_low = 9'h04f;
              4'hf: out_low = 9'h050;
              default: out_low = 9'h000;
            endcase
          end
          6'h07: begin
            case (mant[3:0])
              4'h0: out_low = 9'h051;
              4'h1: out_low = 9'h051;
              4'h2: out_low = 9'h052;
              4'h3: out_low = 9'h053;
              4'h4: out_low = 9'h054;
              4'h5: out_low = 9'h054;
              4'h6: out_low = 9'h055;
              4'h7: out_low = 9'h056;
              4'h8: out_low = 9'h057;
              4'h9: out_low = 9'h057;
              4'ha: out_low = 9'h058;
              4'hb: out_low = 9'h059;
              4'hc: out_low = 9'h05a;
              4'hd: out_low = 9'h05a;
              4'he: out_low = 9'h05b;
              4'hf: out_low = 9'h05c;
              default: out_low = 9'h000;
            endcase
          end
          6'h08: begin
            case (mant[3:0])
              4'h0: out_low = 9'h05d;
              4'h1: out_low = 9'h05d;
              4'h2: out_low = 9'h05e;
              4'h3: out_low = 9'h05f;
              4'h4: out_low = 9'h060;
              4'h5: out_low = 9'h060;
              4'h6: out_low = 9'h061;
              4'h7: out_low = 9'h062;
              4'h8: out_low = 9'h063;
              4'h9: out_low = 9'h064;
              4'ha: out_low = 9'h064;
              4'hb: out_low = 9'h065;
              4'hc: out_low = 9'h066;
              4'hd: out_low = 9'h067;
              4'he: out_low = 9'h067;
              4'hf: out_low = 9'h068;
              default: out_low = 9'h000;
            endcase
          end
          6'h09: begin
            case (mant[3:0])
              4'h0: out_low = 9'h069;
              4'h1: out_low = 9'h06a;
              4'h2: out_low = 9'h06a;
              4'h3: out_low = 9'h06b;
              4'h4: out_low = 9'h06c;
              4'h5: out_low = 9'h06d;
              4'h6: out_low = 9'h06d;
              4'h7: out_low = 9'h06e;
              4'h8: out_low = 9'h06f;
              4'h9: out_low = 9'h070;
              4'ha: out_low = 9'h071;
              4'hb: out_low = 9'h071;
              4'hc: out_low = 9'h072;
              4'hd: out_low = 9'h073;
              4'he: out_low = 9'h074;
              4'hf: out_low = 9'h074;
              default: out_low = 9'h000;
            endcase
          end
          6'h0a: begin
            case (mant[3:0])
              4'h0: out_low = 9'h075;
              4'h1: out_low = 9'h076;
              4'h2: out_low = 9'h077;
              4'h3: out_low = 9'h077;
              4'h4: out_low = 9'h078;
              4'h5: out_low = 9'h079;
              4'h6: out_low = 9'h07a;
              4'h7: out_low = 9'h07b;
              4'h8: out_low = 9'h07b;
              4'h9: out_low = 9'h07c;
              4'ha: out_low = 9'h07d;
              4'hb: out_low = 9'h07e;
              4'hc: out_low = 9'h07e;
              4'hd: out_low = 9'h07f;
              4'he: out_low = 9'h080;
              4'hf: out_low = 9'h081;
              default: out_low = 9'h000;
            endcase
          end
          6'h0b: begin
            case (mant[3:0])
              4'h0: out_low = 9'h082;
              4'h1: out_low = 9'h082;
              4'h2: out_low = 9'h083;
              4'h3: out_low = 9'h084;
              4'h4: out_low = 9'h085;
              4'h5: out_low = 9'h085;
              4'h6: out_low = 9'h086;
              4'h7: out_low = 9'h087;
              4'h8: out_low = 9'h088;
              4'h9: out_low = 9'h089;
              4'ha: out_low = 9'h089;
              4'hb: out_low = 9'h08a;
              4'hc: out_low = 9'h08b;
              4'hd: out_low = 9'h08c;
              4'he: out_low = 9'h08d;
              4'hf: out_low = 9'h08d;
              default: out_low = 9'h000;
            endcase
          end
          6'h0c: begin
            case (mant[3:0])
              4'h0: out_low = 9'h08e;
              4'h1: out_low = 9'h08f;
              4'h2: out_low = 9'h090;
              4'h3: out_low = 9'h090;
              4'h4: out_low = 9'h091;
              4'h5: out_low = 9'h092;
              4'h6: out_low = 9'h093;
              4'h7: out_low = 9'h094;
              4'h8: out_low = 9'h094;
              4'h9: out_low = 9'h095;
              4'ha: out_low = 9'h096;
              4'hb: out_low = 9'h097;
              4'hc: out_low = 9'h098;
              4'hd: out_low = 9'h098;
              4'he: out_low = 9'h099;
              4'hf: out_low = 9'h09a;
              default: out_low = 9'h000;
            endcase
          end
          6'h0d: begin
            case (mant[3:0])
              4'h0: out_low = 9'h09b;
              4'h1: out_low = 9'h09c;
              4'h2: out_low = 9'h09c;
              4'h3: out_low = 9'h09d;
              4'h4: out_low = 9'h09e;
              4'h5: out_low = 9'h09f;
              4'h6: out_low = 9'h0a0;
              4'h7: out_low = 9'h0a0;
              4'h8: out_low = 9'h0a1;
              4'h9: out_low = 9'h0a2;
              4'ha: out_low = 9'h0a3;
              4'hb: out_low = 9'h0a4;
              4'hc: out_low = 9'h0a4;
              4'hd: out_low = 9'h0a5;
              4'he: out_low = 9'h0a6;
              4'hf: out_low = 9'h0a7;
              default: out_low = 9'h000;
            endcase
          end
          6'h0e: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0a8;
              4'h1: out_low = 9'h0a8;
              4'h2: out_low = 9'h0a9;
              4'h3: out_low = 9'h0aa;
              4'h4: out_low = 9'h0ab;
              4'h5: out_low = 9'h0ac;
              4'h6: out_low = 9'h0ad;
              4'h7: out_low = 9'h0ad;
              4'h8: out_low = 9'h0ae;
              4'h9: out_low = 9'h0af;
              4'ha: out_low = 9'h0b0;
              4'hb: out_low = 9'h0b1;
              4'hc: out_low = 9'h0b1;
              4'hd: out_low = 9'h0b2;
              4'he: out_low = 9'h0b3;
              4'hf: out_low = 9'h0b4;
              default: out_low = 9'h000;
            endcase
          end
          6'h0f: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0b5;
              4'h1: out_low = 9'h0b5;
              4'h2: out_low = 9'h0b6;
              4'h3: out_low = 9'h0b7;
              4'h4: out_low = 9'h0b8;
              4'h5: out_low = 9'h0b9;
              4'h6: out_low = 9'h0ba;
              4'h7: out_low = 9'h0ba;
              4'h8: out_low = 9'h0bb;
              4'h9: out_low = 9'h0bc;
              4'ha: out_low = 9'h0bd;
              4'hb: out_low = 9'h0be;
              4'hc: out_low = 9'h0be;
              4'hd: out_low = 9'h0bf;
              4'he: out_low = 9'h0c0;
              4'hf: out_low = 9'h0c1;
              default: out_low = 9'h000;
            endcase
          end
          6'h10: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0c2;
              4'h1: out_low = 9'h0c3;
              4'h2: out_low = 9'h0c3;
              4'h3: out_low = 9'h0c4;
              4'h4: out_low = 9'h0c5;
              4'h5: out_low = 9'h0c6;
              4'h6: out_low = 9'h0c7;
              4'h7: out_low = 9'h0c8;
              4'h8: out_low = 9'h0c8;
              4'h9: out_low = 9'h0c9;
              4'ha: out_low = 9'h0ca;
              4'hb: out_low = 9'h0cb;
              4'hc: out_low = 9'h0cc;
              4'hd: out_low = 9'h0cd;
              4'he: out_low = 9'h0cd;
              4'hf: out_low = 9'h0ce;
              default: out_low = 9'h000;
            endcase
          end
          6'h11: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0cf;
              4'h1: out_low = 9'h0d0;
              4'h2: out_low = 9'h0d1;
              4'h3: out_low = 9'h0d2;
              4'h4: out_low = 9'h0d2;
              4'h5: out_low = 9'h0d3;
              4'h6: out_low = 9'h0d4;
              4'h7: out_low = 9'h0d5;
              4'h8: out_low = 9'h0d6;
              4'h9: out_low = 9'h0d7;
              4'ha: out_low = 9'h0d7;
              4'hb: out_low = 9'h0d8;
              4'hc: out_low = 9'h0d9;
              4'hd: out_low = 9'h0da;
              4'he: out_low = 9'h0db;
              4'hf: out_low = 9'h0dc;
              default: out_low = 9'h000;
            endcase
          end
          6'h12: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0dc;
              4'h1: out_low = 9'h0dd;
              4'h2: out_low = 9'h0de;
              4'h3: out_low = 9'h0df;
              4'h4: out_low = 9'h0e0;
              4'h5: out_low = 9'h0e1;
              4'h6: out_low = 9'h0e1;
              4'h7: out_low = 9'h0e2;
              4'h8: out_low = 9'h0e3;
              4'h9: out_low = 9'h0e4;
              4'ha: out_low = 9'h0e5;
              4'hb: out_low = 9'h0e6;
              4'hc: out_low = 9'h0e7;
              4'hd: out_low = 9'h0e7;
              4'he: out_low = 9'h0e8;
              4'hf: out_low = 9'h0e9;
              default: out_low = 9'h000;
            endcase
          end
          6'h13: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0ea;
              4'h1: out_low = 9'h0eb;
              4'h2: out_low = 9'h0ec;
              4'h3: out_low = 9'h0ed;
              4'h4: out_low = 9'h0ed;
              4'h5: out_low = 9'h0ee;
              4'h6: out_low = 9'h0ef;
              4'h7: out_low = 9'h0f0;
              4'h8: out_low = 9'h0f1;
              4'h9: out_low = 9'h0f2;
              4'ha: out_low = 9'h0f3;
              4'hb: out_low = 9'h0f3;
              4'hc: out_low = 9'h0f4;
              4'hd: out_low = 9'h0f5;
              4'he: out_low = 9'h0f6;
              4'hf: out_low = 9'h0f7;
              default: out_low = 9'h000;
            endcase
          end
          6'h14: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0f8;
              4'h1: out_low = 9'h0f9;
              4'h2: out_low = 9'h0f9;
              4'h3: out_low = 9'h0fa;
              4'h4: out_low = 9'h0fb;
              4'h5: out_low = 9'h0fc;
              4'h6: out_low = 9'h0fd;
              4'h7: out_low = 9'h0fe;
              4'h8: out_low = 9'h0ff;
              4'h9: out_low = 9'h0ff;
              4'ha: out_low = 9'h100;
              4'hb: out_low = 9'h101;
              4'hc: out_low = 9'h102;
              4'hd: out_low = 9'h103;
              4'he: out_low = 9'h104;
              4'hf: out_low = 9'h105;
              default: out_low = 9'h000;
            endcase
          end
          6'h15: begin
            case (mant[3:0])
              4'h0: out_low = 9'h106;
              4'h1: out_low = 9'h106;
              4'h2: out_low = 9'h107;
              4'h3: out_low = 9'h108;
              4'h4: out_low = 9'h109;
              4'h5: out_low = 9'h10a;
              4'h6: out_low = 9'h10b;
              4'h7: out_low = 9'h10c;
              4'h8: out_low = 9'h10c;
              4'h9: out_low = 9'h10d;
              4'ha: out_low = 9'h10e;
              4'hb: out_low = 9'h10f;
              4'hc: out_low = 9'h110;
              4'hd: out_low = 9'h111;
              4'he: out_low = 9'h112;
              4'hf: out_low = 9'h113;
              default: out_low = 9'h000;
            endcase
          end
          6'h16: begin
            case (mant[3:0])
              4'h0: out_low = 9'h114;
              4'h1: out_low = 9'h114;
              4'h2: out_low = 9'h115;
              4'h3: out_low = 9'h116;
              4'h4: out_low = 9'h117;
              4'h5: out_low = 9'h118;
              4'h6: out_low = 9'h119;
              4'h7: out_low = 9'h11a;
              4'h8: out_low = 9'h11b;
              4'h9: out_low = 9'h11b;
              4'ha: out_low = 9'h11c;
              4'hb: out_low = 9'h11d;
              4'hc: out_low = 9'h11e;
              4'hd: out_low = 9'h11f;
              4'he: out_low = 9'h120;
              4'hf: out_low = 9'h121;
              default: out_low = 9'h000;
            endcase
          end
          6'h17: begin
            case (mant[3:0])
              4'h0: out_low = 9'h122;
              4'h1: out_low = 9'h123;
              4'h2: out_low = 9'h123;
              4'h3: out_low = 9'h124;
              4'h4: out_low = 9'h125;
              4'h5: out_low = 9'h126;
              4'h6: out_low = 9'h127;
              4'h7: out_low = 9'h128;
              4'h8: out_low = 9'h129;
              4'h9: out_low = 9'h12a;
              4'ha: out_low = 9'h12b;
              4'hb: out_low = 9'h12b;
              4'hc: out_low = 9'h12c;
              4'hd: out_low = 9'h12d;
              4'he: out_low = 9'h12e;
              4'hf: out_low = 9'h12f;
              default: out_low = 9'h000;
            endcase
          end
          6'h18: begin
            case (mant[3:0])
              4'h0: out_low = 9'h130;
              4'h1: out_low = 9'h131;
              4'h2: out_low = 9'h132;
              4'h3: out_low = 9'h133;
              4'h4: out_low = 9'h134;
              4'h5: out_low = 9'h134;
              4'h6: out_low = 9'h135;
              4'h7: out_low = 9'h136;
              4'h8: out_low = 9'h137;
              4'h9: out_low = 9'h138;
              4'ha: out_low = 9'h139;
              4'hb: out_low = 9'h13a;
              4'hc: out_low = 9'h13b;
              4'hd: out_low = 9'h13c;
              4'he: out_low = 9'h13d;
              4'hf: out_low = 9'h13e;
              default: out_low = 9'h000;
            endcase
          end
          6'h19: begin
            case (mant[3:0])
              4'h0: out_low = 9'h13e;
              4'h1: out_low = 9'h13f;
              4'h2: out_low = 9'h140;
              4'h3: out_low = 9'h141;
              4'h4: out_low = 9'h142;
              4'h5: out_low = 9'h143;
              4'h6: out_low = 9'h144;
              4'h7: out_low = 9'h145;
              4'h8: out_low = 9'h146;
              4'h9: out_low = 9'h147;
              4'ha: out_low = 9'h148;
              4'hb: out_low = 9'h148;
              4'hc: out_low = 9'h149;
              4'hd: out_low = 9'h14a;
              4'he: out_low = 9'h14b;
              4'hf: out_low = 9'h14c;
              default: out_low = 9'h000;
            endcase
          end
          6'h1a: begin
            case (mant[3:0])
              4'h0: out_low = 9'h14d;
              4'h1: out_low = 9'h14e;
              4'h2: out_low = 9'h14f;
              4'h3: out_low = 9'h150;
              4'h4: out_low = 9'h151;
              4'h5: out_low = 9'h152;
              4'h6: out_low = 9'h153;
              4'h7: out_low = 9'h153;
              4'h8: out_low = 9'h154;
              4'h9: out_low = 9'h155;
              4'ha: out_low = 9'h156;
              4'hb: out_low = 9'h157;
              4'hc: out_low = 9'h158;
              4'hd: out_low = 9'h159;
              4'he: out_low = 9'h15a;
              4'hf: out_low = 9'h15b;
              default: out_low = 9'h000;
            endcase
          end
          6'h1b: begin
            case (mant[3:0])
              4'h0: out_low = 9'h15c;
              4'h1: out_low = 9'h15d;
              4'h2: out_low = 9'h15e;
              4'h3: out_low = 9'h15f;
              4'h4: out_low = 9'h160;
              4'h5: out_low = 9'h160;
              4'h6: out_low = 9'h161;
              4'h7: out_low = 9'h162;
              4'h8: out_low = 9'h163;
              4'h9: out_low = 9'h164;
              4'ha: out_low = 9'h165;
              4'hb: out_low = 9'h166;
              4'hc: out_low = 9'h167;
              4'hd: out_low = 9'h168;
              4'he: out_low = 9'h169;
              4'hf: out_low = 9'h16a;
              default: out_low = 9'h000;
            endcase
          end
          6'h1c: begin
            case (mant[3:0])
              4'h0: out_low = 9'h16b;
              4'h1: out_low = 9'h16c;
              4'h2: out_low = 9'h16d;
              4'h3: out_low = 9'h16e;
              4'h4: out_low = 9'h16f;
              4'h5: out_low = 9'h16f;
              4'h6: out_low = 9'h170;
              4'h7: out_low = 9'h171;
              4'h8: out_low = 9'h172;
              4'h9: out_low = 9'h173;
              4'ha: out_low = 9'h174;
              4'hb: out_low = 9'h175;
              4'hc: out_low = 9'h176;
              4'hd: out_low = 9'h177;
              4'he: out_low = 9'h178;
              4'hf: out_low = 9'h179;
              default: out_low = 9'h000;
            endcase
          end
          6'h1d: begin
            case (mant[3:0])
              4'h0: out_low = 9'h17a;
              4'h1: out_low = 9'h17b;
              4'h2: out_low = 9'h17c;
              4'h3: out_low = 9'h17d;
              4'h4: out_low = 9'h17e;
              4'h5: out_low = 9'h17f;
              4'h6: out_low = 9'h180;
              4'h7: out_low = 9'h181;
              4'h8: out_low = 9'h181;
              4'h9: out_low = 9'h182;
              4'ha: out_low = 9'h183;
              4'hb: out_low = 9'h184;
              4'hc: out_low = 9'h185;
              4'hd: out_low = 9'h186;
              4'he: out_low = 9'h187;
              4'hf: out_low = 9'h188;
              default: out_low = 9'h000;
            endcase
          end
          6'h1e: begin
            case (mant[3:0])
              4'h0: out_low = 9'h189;
              4'h1: out_low = 9'h18a;
              4'h2: out_low = 9'h18b;
              4'h3: out_low = 9'h18c;
              4'h4: out_low = 9'h18d;
              4'h5: out_low = 9'h18e;
              4'h6: out_low = 9'h18f;
              4'h7: out_low = 9'h190;
              4'h8: out_low = 9'h191;
              4'h9: out_low = 9'h192;
              4'ha: out_low = 9'h193;
              4'hb: out_low = 9'h194;
              4'hc: out_low = 9'h195;
              4'hd: out_low = 9'h196;
              4'he: out_low = 9'h197;
              4'hf: out_low = 9'h198;
              default: out_low = 9'h000;
            endcase
          end
          6'h1f: begin
            case (mant[3:0])
              4'h0: out_low = 9'h199;
              4'h1: out_low = 9'h19a;
              4'h2: out_low = 9'h19a;
              4'h3: out_low = 9'h19b;
              4'h4: out_low = 9'h19c;
              4'h5: out_low = 9'h19d;
              4'h6: out_low = 9'h19e;
              4'h7: out_low = 9'h19f;
              4'h8: out_low = 9'h1a0;
              4'h9: out_low = 9'h1a1;
              4'ha: out_low = 9'h1a2;
              4'hb: out_low = 9'h1a3;
              4'hc: out_low = 9'h1a4;
              4'hd: out_low = 9'h1a5;
              4'he: out_low = 9'h1a6;
              4'hf: out_low = 9'h1a7;
              default: out_low = 9'h000;
            endcase
          end
          6'h20: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1a8;
              4'h1: out_low = 9'h1a9;
              4'h2: out_low = 9'h1aa;
              4'h3: out_low = 9'h1ab;
              4'h4: out_low = 9'h1ac;
              4'h5: out_low = 9'h1ad;
              4'h6: out_low = 9'h1ae;
              4'h7: out_low = 9'h1af;
              4'h8: out_low = 9'h1b0;
              4'h9: out_low = 9'h1b1;
              4'ha: out_low = 9'h1b2;
              4'hb: out_low = 9'h1b3;
              4'hc: out_low = 9'h1b4;
              4'hd: out_low = 9'h1b5;
              4'he: out_low = 9'h1b6;
              4'hf: out_low = 9'h1b7;
              default: out_low = 9'h000;
            endcase
          end
          6'h21: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1b8;
              4'h1: out_low = 9'h1b9;
              4'h2: out_low = 9'h1ba;
              4'h3: out_low = 9'h1bb;
              4'h4: out_low = 9'h1bc;
              4'h5: out_low = 9'h1bd;
              4'h6: out_low = 9'h1be;
              4'h7: out_low = 9'h1bf;
              4'h8: out_low = 9'h1c0;
              4'h9: out_low = 9'h1c1;
              4'ha: out_low = 9'h1c2;
              4'hb: out_low = 9'h1c3;
              4'hc: out_low = 9'h1c4;
              4'hd: out_low = 9'h1c5;
              4'he: out_low = 9'h1c6;
              4'hf: out_low = 9'h1c7;
              default: out_low = 9'h000;
            endcase
          end
          6'h22: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1c8;
              4'h1: out_low = 9'h1c9;
              4'h2: out_low = 9'h1ca;
              4'h3: out_low = 9'h1cb;
              4'h4: out_low = 9'h1cc;
              4'h5: out_low = 9'h1cd;
              4'h6: out_low = 9'h1ce;
              4'h7: out_low = 9'h1cf;
              4'h8: out_low = 9'h1d0;
              4'h9: out_low = 9'h1d1;
              4'ha: out_low = 9'h1d2;
              4'hb: out_low = 9'h1d3;
              4'hc: out_low = 9'h1d4;
              4'hd: out_low = 9'h1d5;
              4'he: out_low = 9'h1d6;
              4'hf: out_low = 9'h1d7;
              default: out_low = 9'h000;
            endcase
          end
          6'h23: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1d8;
              4'h1: out_low = 9'h1d9;
              4'h2: out_low = 9'h1da;
              4'h3: out_low = 9'h1db;
              4'h4: out_low = 9'h1dc;
              4'h5: out_low = 9'h1dd;
              4'h6: out_low = 9'h1de;
              4'h7: out_low = 9'h1df;
              4'h8: out_low = 9'h1e0;
              4'h9: out_low = 9'h1e1;
              4'ha: out_low = 9'h1e2;
              4'hb: out_low = 9'h1e3;
              4'hc: out_low = 9'h1e4;
              4'hd: out_low = 9'h1e5;
              4'he: out_low = 9'h1e6;
              4'hf: out_low = 9'h1e7;
              default: out_low = 9'h000;
            endcase
          end
          6'h24: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1e8;
              4'h1: out_low = 9'h1e9;
              4'h2: out_low = 9'h1ea;
              4'h3: out_low = 9'h1eb;
              4'h4: out_low = 9'h1ec;
              4'h5: out_low = 9'h1ed;
              4'h6: out_low = 9'h1ee;
              4'h7: out_low = 9'h1ef;
              4'h8: out_low = 9'h1f0;
              4'h9: out_low = 9'h1f2;
              4'ha: out_low = 9'h1f3;
              4'hb: out_low = 9'h1f4;
              4'hc: out_low = 9'h1f5;
              4'hd: out_low = 9'h1f6;
              4'he: out_low = 9'h1f7;
              4'hf: out_low = 9'h1f8;
              default: out_low = 9'h000;
            endcase
          end
          6'h25: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1f9;
              4'h1: out_low = 9'h1fa;
              4'h2: out_low = 9'h1fb;
              4'h3: out_low = 9'h1fc;
              4'h4: out_low = 9'h1fd;
              4'h5: out_low = 9'h1fe;
              4'h6: out_low = 9'h1ff;
              4'h7: out_low = 9'h000;
              4'h8: out_low = 9'h001;
              4'h9: out_low = 9'h002;
              4'ha: out_low = 9'h003;
              4'hb: out_low = 9'h004;
              4'hc: out_low = 9'h005;
              4'hd: out_low = 9'h006;
              4'he: out_low = 9'h007;
              4'hf: out_low = 9'h008;
              default: out_low = 9'h000;
            endcase
          end
          6'h26: begin
            case (mant[3:0])
              4'h0: out_low = 9'h009;
              4'h1: out_low = 9'h00a;
              4'h2: out_low = 9'h00b;
              4'h3: out_low = 9'h00d;
              4'h4: out_low = 9'h00e;
              4'h5: out_low = 9'h00f;
              4'h6: out_low = 9'h010;
              4'h7: out_low = 9'h011;
              4'h8: out_low = 9'h012;
              4'h9: out_low = 9'h013;
              4'ha: out_low = 9'h014;
              4'hb: out_low = 9'h015;
              4'hc: out_low = 9'h016;
              4'hd: out_low = 9'h017;
              4'he: out_low = 9'h018;
              4'hf: out_low = 9'h019;
              default: out_low = 9'h000;
            endcase
          end
          6'h27: begin
            case (mant[3:0])
              4'h0: out_low = 9'h01a;
              4'h1: out_low = 9'h01b;
              4'h2: out_low = 9'h01c;
              4'h3: out_low = 9'h01d;
              4'h4: out_low = 9'h01e;
              4'h5: out_low = 9'h020;
              4'h6: out_low = 9'h021;
              4'h7: out_low = 9'h022;
              4'h8: out_low = 9'h023;
              4'h9: out_low = 9'h024;
              4'ha: out_low = 9'h025;
              4'hb: out_low = 9'h026;
              4'hc: out_low = 9'h027;
              4'hd: out_low = 9'h028;
              4'he: out_low = 9'h029;
              4'hf: out_low = 9'h02a;
              default: out_low = 9'h000;
            endcase
          end
          6'h28: begin
            case (mant[3:0])
              4'h0: out_low = 9'h02b;
              4'h1: out_low = 9'h02c;
              4'h2: out_low = 9'h02d;
              4'h3: out_low = 9'h02e;
              4'h4: out_low = 9'h030;
              4'h5: out_low = 9'h031;
              4'h6: out_low = 9'h032;
              4'h7: out_low = 9'h033;
              4'h8: out_low = 9'h034;
              4'h9: out_low = 9'h035;
              4'ha: out_low = 9'h036;
              4'hb: out_low = 9'h037;
              4'hc: out_low = 9'h038;
              4'hd: out_low = 9'h039;
              4'he: out_low = 9'h03a;
              4'hf: out_low = 9'h03b;
              default: out_low = 9'h000;
            endcase
          end
          6'h29: begin
            case (mant[3:0])
              4'h0: out_low = 9'h03c;
              4'h1: out_low = 9'h03e;
              4'h2: out_low = 9'h03f;
              4'h3: out_low = 9'h040;
              4'h4: out_low = 9'h041;
              4'h5: out_low = 9'h042;
              4'h6: out_low = 9'h043;
              4'h7: out_low = 9'h044;
              4'h8: out_low = 9'h045;
              4'h9: out_low = 9'h046;
              4'ha: out_low = 9'h047;
              4'hb: out_low = 9'h048;
              4'hc: out_low = 9'h049;
              4'hd: out_low = 9'h04b;
              4'he: out_low = 9'h04c;
              4'hf: out_low = 9'h04d;
              default: out_low = 9'h000;
            endcase
          end
          6'h2a: begin
            case (mant[3:0])
              4'h0: out_low = 9'h04e;
              4'h1: out_low = 9'h04f;
              4'h2: out_low = 9'h050;
              4'h3: out_low = 9'h051;
              4'h4: out_low = 9'h052;
              4'h5: out_low = 9'h053;
              4'h6: out_low = 9'h054;
              4'h7: out_low = 9'h055;
              4'h8: out_low = 9'h057;
              4'h9: out_low = 9'h058;
              4'ha: out_low = 9'h059;
              4'hb: out_low = 9'h05a;
              4'hc: out_low = 9'h05b;
              4'hd: out_low = 9'h05c;
              4'he: out_low = 9'h05d;
              4'hf: out_low = 9'h05e;
              default: out_low = 9'h000;
            endcase
          end
          6'h2b: begin
            case (mant[3:0])
              4'h0: out_low = 9'h05f;
              4'h1: out_low = 9'h060;
              4'h2: out_low = 9'h062;
              4'h3: out_low = 9'h063;
              4'h4: out_low = 9'h064;
              4'h5: out_low = 9'h065;
              4'h6: out_low = 9'h066;
              4'h7: out_low = 9'h067;
              4'h8: out_low = 9'h068;
              4'h9: out_low = 9'h069;
              4'ha: out_low = 9'h06a;
              4'hb: out_low = 9'h06c;
              4'hc: out_low = 9'h06d;
              4'hd: out_low = 9'h06e;
              4'he: out_low = 9'h06f;
              4'hf: out_low = 9'h070;
              default: out_low = 9'h000;
            endcase
          end
          6'h2c: begin
            case (mant[3:0])
              4'h0: out_low = 9'h071;
              4'h1: out_low = 9'h072;
              4'h2: out_low = 9'h073;
              4'h3: out_low = 9'h074;
              4'h4: out_low = 9'h076;
              4'h5: out_low = 9'h077;
              4'h6: out_low = 9'h078;
              4'h7: out_low = 9'h079;
              4'h8: out_low = 9'h07a;
              4'h9: out_low = 9'h07b;
              4'ha: out_low = 9'h07c;
              4'hb: out_low = 9'h07d;
              4'hc: out_low = 9'h07f;
              4'hd: out_low = 9'h080;
              4'he: out_low = 9'h081;
              4'hf: out_low = 9'h082;
              default: out_low = 9'h000;
            endcase
          end
          6'h2d: begin
            case (mant[3:0])
              4'h0: out_low = 9'h083;
              4'h1: out_low = 9'h084;
              4'h2: out_low = 9'h085;
              4'h3: out_low = 9'h086;
              4'h4: out_low = 9'h088;
              4'h5: out_low = 9'h089;
              4'h6: out_low = 9'h08a;
              4'h7: out_low = 9'h08b;
              4'h8: out_low = 9'h08c;
              4'h9: out_low = 9'h08d;
              4'ha: out_low = 9'h08e;
              4'hb: out_low = 9'h090;
              4'hc: out_low = 9'h091;
              4'hd: out_low = 9'h092;
              4'he: out_low = 9'h093;
              4'hf: out_low = 9'h094;
              default: out_low = 9'h000;
            endcase
          end
          6'h2e: begin
            case (mant[3:0])
              4'h0: out_low = 9'h095;
              4'h1: out_low = 9'h096;
              4'h2: out_low = 9'h098;
              4'h3: out_low = 9'h099;
              4'h4: out_low = 9'h09a;
              4'h5: out_low = 9'h09b;
              4'h6: out_low = 9'h09c;
              4'h7: out_low = 9'h09d;
              4'h8: out_low = 9'h09e;
              4'h9: out_low = 9'h0a0;
              4'ha: out_low = 9'h0a1;
              4'hb: out_low = 9'h0a2;
              4'hc: out_low = 9'h0a3;
              4'hd: out_low = 9'h0a4;
              4'he: out_low = 9'h0a5;
              4'hf: out_low = 9'h0a6;
              default: out_low = 9'h000;
            endcase
          end
          6'h2f: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0a8;
              4'h1: out_low = 9'h0a9;
              4'h2: out_low = 9'h0aa;
              4'h3: out_low = 9'h0ab;
              4'h4: out_low = 9'h0ac;
              4'h5: out_low = 9'h0ad;
              4'h6: out_low = 9'h0af;
              4'h7: out_low = 9'h0b0;
              4'h8: out_low = 9'h0b1;
              4'h9: out_low = 9'h0b2;
              4'ha: out_low = 9'h0b3;
              4'hb: out_low = 9'h0b4;
              4'hc: out_low = 9'h0b5;
              4'hd: out_low = 9'h0b7;
              4'he: out_low = 9'h0b8;
              4'hf: out_low = 9'h0b9;
              default: out_low = 9'h000;
            endcase
          end
          6'h30: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0ba;
              4'h1: out_low = 9'h0bb;
              4'h2: out_low = 9'h0bc;
              4'h3: out_low = 9'h0be;
              4'h4: out_low = 9'h0bf;
              4'h5: out_low = 9'h0c0;
              4'h6: out_low = 9'h0c1;
              4'h7: out_low = 9'h0c2;
              4'h8: out_low = 9'h0c4;
              4'h9: out_low = 9'h0c5;
              4'ha: out_low = 9'h0c6;
              4'hb: out_low = 9'h0c7;
              4'hc: out_low = 9'h0c8;
              4'hd: out_low = 9'h0c9;
              4'he: out_low = 9'h0cb;
              4'hf: out_low = 9'h0cc;
              default: out_low = 9'h000;
            endcase
          end
          6'h31: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0cd;
              4'h1: out_low = 9'h0ce;
              4'h2: out_low = 9'h0cf;
              4'h3: out_low = 9'h0d0;
              4'h4: out_low = 9'h0d2;
              4'h5: out_low = 9'h0d3;
              4'h6: out_low = 9'h0d4;
              4'h7: out_low = 9'h0d5;
              4'h8: out_low = 9'h0d6;
              4'h9: out_low = 9'h0d8;
              4'ha: out_low = 9'h0d9;
              4'hb: out_low = 9'h0da;
              4'hc: out_low = 9'h0db;
              4'hd: out_low = 9'h0dc;
              4'he: out_low = 9'h0dd;
              4'hf: out_low = 9'h0df;
              default: out_low = 9'h000;
            endcase
          end
          6'h32: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0e0;
              4'h1: out_low = 9'h0e1;
              4'h2: out_low = 9'h0e2;
              4'h3: out_low = 9'h0e3;
              4'h4: out_low = 9'h0e5;
              4'h5: out_low = 9'h0e6;
              4'h6: out_low = 9'h0e7;
              4'h7: out_low = 9'h0e8;
              4'h8: out_low = 9'h0e9;
              4'h9: out_low = 9'h0eb;
              4'ha: out_low = 9'h0ec;
              4'hb: out_low = 9'h0ed;
              4'hc: out_low = 9'h0ee;
              4'hd: out_low = 9'h0ef;
              4'he: out_low = 9'h0f1;
              4'hf: out_low = 9'h0f2;
              default: out_low = 9'h000;
            endcase
          end
          6'h33: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0f3;
              4'h1: out_low = 9'h0f4;
              4'h2: out_low = 9'h0f5;
              4'h3: out_low = 9'h0f7;
              4'h4: out_low = 9'h0f8;
              4'h5: out_low = 9'h0f9;
              4'h6: out_low = 9'h0fa;
              4'h7: out_low = 9'h0fb;
              4'h8: out_low = 9'h0fd;
              4'h9: out_low = 9'h0fe;
              4'ha: out_low = 9'h0ff;
              4'hb: out_low = 9'h100;
              4'hc: out_low = 9'h102;
              4'hd: out_low = 9'h103;
              4'he: out_low = 9'h104;
              4'hf: out_low = 9'h105;
              default: out_low = 9'h000;
            endcase
          end
          6'h34: begin
            case (mant[3:0])
              4'h0: out_low = 9'h106;
              4'h1: out_low = 9'h108;
              4'h2: out_low = 9'h109;
              4'h3: out_low = 9'h10a;
              4'h4: out_low = 9'h10b;
              4'h5: out_low = 9'h10c;
              4'h6: out_low = 9'h10e;
              4'h7: out_low = 9'h10f;
              4'h8: out_low = 9'h110;
              4'h9: out_low = 9'h111;
              4'ha: out_low = 9'h113;
              4'hb: out_low = 9'h114;
              4'hc: out_low = 9'h115;
              4'hd: out_low = 9'h116;
              4'he: out_low = 9'h118;
              4'hf: out_low = 9'h119;
              default: out_low = 9'h000;
            endcase
          end
          6'h35: begin
            case (mant[3:0])
              4'h0: out_low = 9'h11a;
              4'h1: out_low = 9'h11b;
              4'h2: out_low = 9'h11c;
              4'h3: out_low = 9'h11e;
              4'h4: out_low = 9'h11f;
              4'h5: out_low = 9'h120;
              4'h6: out_low = 9'h121;
              4'h7: out_low = 9'h123;
              4'h8: out_low = 9'h124;
              4'h9: out_low = 9'h125;
              4'ha: out_low = 9'h126;
              4'hb: out_low = 9'h128;
              4'hc: out_low = 9'h129;
              4'hd: out_low = 9'h12a;
              4'he: out_low = 9'h12b;
              4'hf: out_low = 9'h12d;
              default: out_low = 9'h000;
            endcase
          end
          6'h36: begin
            case (mant[3:0])
              4'h0: out_low = 9'h12e;
              4'h1: out_low = 9'h12f;
              4'h2: out_low = 9'h130;
              4'h3: out_low = 9'h132;
              4'h4: out_low = 9'h133;
              4'h5: out_low = 9'h134;
              4'h6: out_low = 9'h135;
              4'h7: out_low = 9'h137;
              4'h8: out_low = 9'h138;
              4'h9: out_low = 9'h139;
              4'ha: out_low = 9'h13a;
              4'hb: out_low = 9'h13c;
              4'hc: out_low = 9'h13d;
              4'hd: out_low = 9'h13e;
              4'he: out_low = 9'h13f;
              4'hf: out_low = 9'h141;
              default: out_low = 9'h000;
            endcase
          end
          6'h37: begin
            case (mant[3:0])
              4'h0: out_low = 9'h142;
              4'h1: out_low = 9'h143;
              4'h2: out_low = 9'h144;
              4'h3: out_low = 9'h146;
              4'h4: out_low = 9'h147;
              4'h5: out_low = 9'h148;
              4'h6: out_low = 9'h149;
              4'h7: out_low = 9'h14b;
              4'h8: out_low = 9'h14c;
              4'h9: out_low = 9'h14d;
              4'ha: out_low = 9'h14e;
              4'hb: out_low = 9'h150;
              4'hc: out_low = 9'h151;
              4'hd: out_low = 9'h152;
              4'he: out_low = 9'h153;
              4'hf: out_low = 9'h155;
              default: out_low = 9'h000;
            endcase
          end
          6'h38: begin
            case (mant[3:0])
              4'h0: out_low = 9'h156;
              4'h1: out_low = 9'h157;
              4'h2: out_low = 9'h159;
              4'h3: out_low = 9'h15a;
              4'h4: out_low = 9'h15b;
              4'h5: out_low = 9'h15c;
              4'h6: out_low = 9'h15e;
              4'h7: out_low = 9'h15f;
              4'h8: out_low = 9'h160;
              4'h9: out_low = 9'h162;
              4'ha: out_low = 9'h163;
              4'hb: out_low = 9'h164;
              4'hc: out_low = 9'h165;
              4'hd: out_low = 9'h167;
              4'he: out_low = 9'h168;
              4'hf: out_low = 9'h169;
              default: out_low = 9'h000;
            endcase
          end
          6'h39: begin
            case (mant[3:0])
              4'h0: out_low = 9'h16a;
              4'h1: out_low = 9'h16c;
              4'h2: out_low = 9'h16d;
              4'h3: out_low = 9'h16e;
              4'h4: out_low = 9'h170;
              4'h5: out_low = 9'h171;
              4'h6: out_low = 9'h172;
              4'h7: out_low = 9'h173;
              4'h8: out_low = 9'h175;
              4'h9: out_low = 9'h176;
              4'ha: out_low = 9'h177;
              4'hb: out_low = 9'h179;
              4'hc: out_low = 9'h17a;
              4'hd: out_low = 9'h17b;
              4'he: out_low = 9'h17d;
              4'hf: out_low = 9'h17e;
              default: out_low = 9'h000;
            endcase
          end
          6'h3a: begin
            case (mant[3:0])
              4'h0: out_low = 9'h17f;
              4'h1: out_low = 9'h180;
              4'h2: out_low = 9'h182;
              4'h3: out_low = 9'h183;
              4'h4: out_low = 9'h184;
              4'h5: out_low = 9'h186;
              4'h6: out_low = 9'h187;
              4'h7: out_low = 9'h188;
              4'h8: out_low = 9'h18a;
              4'h9: out_low = 9'h18b;
              4'ha: out_low = 9'h18c;
              4'hb: out_low = 9'h18d;
              4'hc: out_low = 9'h18f;
              4'hd: out_low = 9'h190;
              4'he: out_low = 9'h191;
              4'hf: out_low = 9'h193;
              default: out_low = 9'h000;
            endcase
          end
          6'h3b: begin
            case (mant[3:0])
              4'h0: out_low = 9'h194;
              4'h1: out_low = 9'h195;
              4'h2: out_low = 9'h197;
              4'h3: out_low = 9'h198;
              4'h4: out_low = 9'h199;
              4'h5: out_low = 9'h19b;
              4'h6: out_low = 9'h19c;
              4'h7: out_low = 9'h19d;
              4'h8: out_low = 9'h19f;
              4'h9: out_low = 9'h1a0;
              4'ha: out_low = 9'h1a1;
              4'hb: out_low = 9'h1a3;
              4'hc: out_low = 9'h1a4;
              4'hd: out_low = 9'h1a5;
              4'he: out_low = 9'h1a7;
              4'hf: out_low = 9'h1a8;
              default: out_low = 9'h000;
            endcase
          end
          6'h3c: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1a9;
              4'h1: out_low = 9'h1aa;
              4'h2: out_low = 9'h1ac;
              4'h3: out_low = 9'h1ad;
              4'h4: out_low = 9'h1ae;
              4'h5: out_low = 9'h1b0;
              4'h6: out_low = 9'h1b1;
              4'h7: out_low = 9'h1b2;
              4'h8: out_low = 9'h1b4;
              4'h9: out_low = 9'h1b5;
              4'ha: out_low = 9'h1b6;
              4'hb: out_low = 9'h1b8;
              4'hc: out_low = 9'h1b9;
              4'hd: out_low = 9'h1bb;
              4'he: out_low = 9'h1bc;
              4'hf: out_low = 9'h1bd;
              default: out_low = 9'h000;
            endcase
          end
          6'h3d: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1bf;
              4'h1: out_low = 9'h1c0;
              4'h2: out_low = 9'h1c1;
              4'h3: out_low = 9'h1c3;
              4'h4: out_low = 9'h1c4;
              4'h5: out_low = 9'h1c5;
              4'h6: out_low = 9'h1c7;
              4'h7: out_low = 9'h1c8;
              4'h8: out_low = 9'h1c9;
              4'h9: out_low = 9'h1cb;
              4'ha: out_low = 9'h1cc;
              4'hb: out_low = 9'h1cd;
              4'hc: out_low = 9'h1cf;
              4'hd: out_low = 9'h1d0;
              4'he: out_low = 9'h1d1;
              4'hf: out_low = 9'h1d3;
              default: out_low = 9'h000;
            endcase
          end
          6'h3e: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1d4;
              4'h1: out_low = 9'h1d5;
              4'h2: out_low = 9'h1d7;
              4'h3: out_low = 9'h1d8;
              4'h4: out_low = 9'h1da;
              4'h5: out_low = 9'h1db;
              4'h6: out_low = 9'h1dc;
              4'h7: out_low = 9'h1de;
              4'h8: out_low = 9'h1df;
              4'h9: out_low = 9'h1e0;
              4'ha: out_low = 9'h1e2;
              4'hb: out_low = 9'h1e3;
              4'hc: out_low = 9'h1e4;
              4'hd: out_low = 9'h1e6;
              4'he: out_low = 9'h1e7;
              4'hf: out_low = 9'h1e9;
              default: out_low = 9'h000;
            endcase
          end
          6'h3f: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1ea;
              4'h1: out_low = 9'h1eb;
              4'h2: out_low = 9'h1ed;
              4'h3: out_low = 9'h1ee;
              4'h4: out_low = 9'h1ef;
              4'h5: out_low = 9'h1f1;
              4'h6: out_low = 9'h1f2;
              4'h7: out_low = 9'h1f4;
              4'h8: out_low = 9'h1f5;
              4'h9: out_low = 9'h1f6;
              4'ha: out_low = 9'h1f8;
              4'hb: out_low = 9'h1f9;
              4'hc: out_low = 9'h1fa;
              4'hd: out_low = 9'h1fc;
              4'he: out_low = 9'h1fd;
              4'hf: out_low = 9'h1ff;
              default: out_low = 9'h000;
            endcase
          end
          default: out_low = 9'h000;
        endcase
      end
      6'h10: begin
        case (mant[9:4])
          6'h00: begin
            case (mant[3:0])
              4'h0: out_low = 9'h000;
              4'h1: out_low = 9'h001;
              4'h2: out_low = 9'h003;
              4'h3: out_low = 9'h004;
              4'h4: out_low = 9'h006;
              4'h5: out_low = 9'h007;
              4'h6: out_low = 9'h008;
              4'h7: out_low = 9'h00a;
              4'h8: out_low = 9'h00b;
              4'h9: out_low = 9'h00d;
              4'ha: out_low = 9'h00e;
              4'hb: out_low = 9'h00f;
              4'hc: out_low = 9'h011;
              4'hd: out_low = 9'h012;
              4'he: out_low = 9'h014;
              4'hf: out_low = 9'h015;
              default: out_low = 9'h000;
            endcase
          end
          6'h01: begin
            case (mant[3:0])
              4'h0: out_low = 9'h016;
              4'h1: out_low = 9'h018;
              4'h2: out_low = 9'h019;
              4'h3: out_low = 9'h01b;
              4'h4: out_low = 9'h01c;
              4'h5: out_low = 9'h01e;
              4'h6: out_low = 9'h01f;
              4'h7: out_low = 9'h020;
              4'h8: out_low = 9'h022;
              4'h9: out_low = 9'h023;
              4'ha: out_low = 9'h025;
              4'hb: out_low = 9'h026;
              4'hc: out_low = 9'h028;
              4'hd: out_low = 9'h029;
              4'he: out_low = 9'h02a;
              4'hf: out_low = 9'h02c;
              default: out_low = 9'h000;
            endcase
          end
          6'h02: begin
            case (mant[3:0])
              4'h0: out_low = 9'h02d;
              4'h1: out_low = 9'h02f;
              4'h2: out_low = 9'h030;
              4'h3: out_low = 9'h032;
              4'h4: out_low = 9'h033;
              4'h5: out_low = 9'h035;
              4'h6: out_low = 9'h036;
              4'h7: out_low = 9'h038;
              4'h8: out_low = 9'h039;
              4'h9: out_low = 9'h03a;
              4'ha: out_low = 9'h03c;
              4'hb: out_low = 9'h03d;
              4'hc: out_low = 9'h03f;
              4'hd: out_low = 9'h040;
              4'he: out_low = 9'h042;
              4'hf: out_low = 9'h043;
              default: out_low = 9'h000;
            endcase
          end
          6'h03: begin
            case (mant[3:0])
              4'h0: out_low = 9'h045;
              4'h1: out_low = 9'h046;
              4'h2: out_low = 9'h048;
              4'h3: out_low = 9'h049;
              4'h4: out_low = 9'h04b;
              4'h5: out_low = 9'h04c;
              4'h6: out_low = 9'h04e;
              4'h7: out_low = 9'h04f;
              4'h8: out_low = 9'h051;
              4'h9: out_low = 9'h052;
              4'ha: out_low = 9'h054;
              4'hb: out_low = 9'h055;
              4'hc: out_low = 9'h057;
              4'hd: out_low = 9'h058;
              4'he: out_low = 9'h05a;
              4'hf: out_low = 9'h05b;
              default: out_low = 9'h000;
            endcase
          end
          6'h04: begin
            case (mant[3:0])
              4'h0: out_low = 9'h05d;
              4'h1: out_low = 9'h05e;
              4'h2: out_low = 9'h060;
              4'h3: out_low = 9'h061;
              4'h4: out_low = 9'h063;
              4'h5: out_low = 9'h064;
              4'h6: out_low = 9'h066;
              4'h7: out_low = 9'h067;
              4'h8: out_low = 9'h069;
              4'h9: out_low = 9'h06a;
              4'ha: out_low = 9'h06c;
              4'hb: out_low = 9'h06d;
              4'hc: out_low = 9'h06f;
              4'hd: out_low = 9'h071;
              4'he: out_low = 9'h072;
              4'hf: out_low = 9'h074;
              default: out_low = 9'h000;
            endcase
          end
          6'h05: begin
            case (mant[3:0])
              4'h0: out_low = 9'h075;
              4'h1: out_low = 9'h077;
              4'h2: out_low = 9'h078;
              4'h3: out_low = 9'h07a;
              4'h4: out_low = 9'h07b;
              4'h5: out_low = 9'h07d;
              4'h6: out_low = 9'h07e;
              4'h7: out_low = 9'h080;
              4'h8: out_low = 9'h082;
              4'h9: out_low = 9'h083;
              4'ha: out_low = 9'h085;
              4'hb: out_low = 9'h086;
              4'hc: out_low = 9'h088;
              4'hd: out_low = 9'h089;
              4'he: out_low = 9'h08b;
              4'hf: out_low = 9'h08d;
              default: out_low = 9'h000;
            endcase
          end
          6'h06: begin
            case (mant[3:0])
              4'h0: out_low = 9'h08e;
              4'h1: out_low = 9'h090;
              4'h2: out_low = 9'h091;
              4'h3: out_low = 9'h093;
              4'h4: out_low = 9'h094;
              4'h5: out_low = 9'h096;
              4'h6: out_low = 9'h098;
              4'h7: out_low = 9'h099;
              4'h8: out_low = 9'h09b;
              4'h9: out_low = 9'h09c;
              4'ha: out_low = 9'h09e;
              4'hb: out_low = 9'h0a0;
              4'hc: out_low = 9'h0a1;
              4'hd: out_low = 9'h0a3;
              4'he: out_low = 9'h0a4;
              4'hf: out_low = 9'h0a6;
              default: out_low = 9'h000;
            endcase
          end
          6'h07: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0a8;
              4'h1: out_low = 9'h0a9;
              4'h2: out_low = 9'h0ab;
              4'h3: out_low = 9'h0ad;
              4'h4: out_low = 9'h0ae;
              4'h5: out_low = 9'h0b0;
              4'h6: out_low = 9'h0b1;
              4'h7: out_low = 9'h0b3;
              4'h8: out_low = 9'h0b5;
              4'h9: out_low = 9'h0b6;
              4'ha: out_low = 9'h0b8;
              4'hb: out_low = 9'h0ba;
              4'hc: out_low = 9'h0bb;
              4'hd: out_low = 9'h0bd;
              4'he: out_low = 9'h0be;
              4'hf: out_low = 9'h0c0;
              default: out_low = 9'h000;
            endcase
          end
          6'h08: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0c2;
              4'h1: out_low = 9'h0c3;
              4'h2: out_low = 9'h0c5;
              4'h3: out_low = 9'h0c7;
              4'h4: out_low = 9'h0c8;
              4'h5: out_low = 9'h0ca;
              4'h6: out_low = 9'h0cc;
              4'h7: out_low = 9'h0cd;
              4'h8: out_low = 9'h0cf;
              4'h9: out_low = 9'h0d1;
              4'ha: out_low = 9'h0d2;
              4'hb: out_low = 9'h0d4;
              4'hc: out_low = 9'h0d6;
              4'hd: out_low = 9'h0d7;
              4'he: out_low = 9'h0d9;
              4'hf: out_low = 9'h0db;
              default: out_low = 9'h000;
            endcase
          end
          6'h09: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0dc;
              4'h1: out_low = 9'h0de;
              4'h2: out_low = 9'h0e0;
              4'h3: out_low = 9'h0e1;
              4'h4: out_low = 9'h0e3;
              4'h5: out_low = 9'h0e5;
              4'h6: out_low = 9'h0e7;
              4'h7: out_low = 9'h0e8;
              4'h8: out_low = 9'h0ea;
              4'h9: out_low = 9'h0ec;
              4'ha: out_low = 9'h0ed;
              4'hb: out_low = 9'h0ef;
              4'hc: out_low = 9'h0f1;
              4'hd: out_low = 9'h0f3;
              4'he: out_low = 9'h0f4;
              4'hf: out_low = 9'h0f6;
              default: out_low = 9'h000;
            endcase
          end
          6'h0a: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0f8;
              4'h1: out_low = 9'h0f9;
              4'h2: out_low = 9'h0fb;
              4'h3: out_low = 9'h0fd;
              4'h4: out_low = 9'h0ff;
              4'h5: out_low = 9'h100;
              4'h6: out_low = 9'h102;
              4'h7: out_low = 9'h104;
              4'h8: out_low = 9'h106;
              4'h9: out_low = 9'h107;
              4'ha: out_low = 9'h109;
              4'hb: out_low = 9'h10b;
              4'hc: out_low = 9'h10c;
              4'hd: out_low = 9'h10e;
              4'he: out_low = 9'h110;
              4'hf: out_low = 9'h112;
              default: out_low = 9'h000;
            endcase
          end
          6'h0b: begin
            case (mant[3:0])
              4'h0: out_low = 9'h114;
              4'h1: out_low = 9'h115;
              4'h2: out_low = 9'h117;
              4'h3: out_low = 9'h119;
              4'h4: out_low = 9'h11b;
              4'h5: out_low = 9'h11c;
              4'h6: out_low = 9'h11e;
              4'h7: out_low = 9'h120;
              4'h8: out_low = 9'h122;
              4'h9: out_low = 9'h123;
              4'ha: out_low = 9'h125;
              4'hb: out_low = 9'h127;
              4'hc: out_low = 9'h129;
              4'hd: out_low = 9'h12b;
              4'he: out_low = 9'h12c;
              4'hf: out_low = 9'h12e;
              default: out_low = 9'h000;
            endcase
          end
          6'h0c: begin
            case (mant[3:0])
              4'h0: out_low = 9'h130;
              4'h1: out_low = 9'h132;
              4'h2: out_low = 9'h134;
              4'h3: out_low = 9'h135;
              4'h4: out_low = 9'h137;
              4'h5: out_low = 9'h139;
              4'h6: out_low = 9'h13b;
              4'h7: out_low = 9'h13d;
              4'h8: out_low = 9'h13e;
              4'h9: out_low = 9'h140;
              4'ha: out_low = 9'h142;
              4'hb: out_low = 9'h144;
              4'hc: out_low = 9'h146;
              4'hd: out_low = 9'h148;
              4'he: out_low = 9'h149;
              4'hf: out_low = 9'h14b;
              default: out_low = 9'h000;
            endcase
          end
          6'h0d: begin
            case (mant[3:0])
              4'h0: out_low = 9'h14d;
              4'h1: out_low = 9'h14f;
              4'h2: out_low = 9'h151;
              4'h3: out_low = 9'h153;
              4'h4: out_low = 9'h154;
              4'h5: out_low = 9'h156;
              4'h6: out_low = 9'h158;
              4'h7: out_low = 9'h15a;
              4'h8: out_low = 9'h15c;
              4'h9: out_low = 9'h15e;
              4'ha: out_low = 9'h160;
              4'hb: out_low = 9'h161;
              4'hc: out_low = 9'h163;
              4'hd: out_low = 9'h165;
              4'he: out_low = 9'h167;
              4'hf: out_low = 9'h169;
              default: out_low = 9'h000;
            endcase
          end
          6'h0e: begin
            case (mant[3:0])
              4'h0: out_low = 9'h16b;
              4'h1: out_low = 9'h16d;
              4'h2: out_low = 9'h16f;
              4'h3: out_low = 9'h170;
              4'h4: out_low = 9'h172;
              4'h5: out_low = 9'h174;
              4'h6: out_low = 9'h176;
              4'h7: out_low = 9'h178;
              4'h8: out_low = 9'h17a;
              4'h9: out_low = 9'h17c;
              4'ha: out_low = 9'h17e;
              4'hb: out_low = 9'h180;
              4'hc: out_low = 9'h181;
              4'hd: out_low = 9'h183;
              4'he: out_low = 9'h185;
              4'hf: out_low = 9'h187;
              default: out_low = 9'h000;
            endcase
          end
          6'h0f: begin
            case (mant[3:0])
              4'h0: out_low = 9'h189;
              4'h1: out_low = 9'h18b;
              4'h2: out_low = 9'h18d;
              4'h3: out_low = 9'h18f;
              4'h4: out_low = 9'h191;
              4'h5: out_low = 9'h193;
              4'h6: out_low = 9'h195;
              4'h7: out_low = 9'h197;
              4'h8: out_low = 9'h199;
              4'h9: out_low = 9'h19a;
              4'ha: out_low = 9'h19c;
              4'hb: out_low = 9'h19e;
              4'hc: out_low = 9'h1a0;
              4'hd: out_low = 9'h1a2;
              4'he: out_low = 9'h1a4;
              4'hf: out_low = 9'h1a6;
              default: out_low = 9'h000;
            endcase
          end
          6'h10: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1a8;
              4'h1: out_low = 9'h1aa;
              4'h2: out_low = 9'h1ac;
              4'h3: out_low = 9'h1ae;
              4'h4: out_low = 9'h1b0;
              4'h5: out_low = 9'h1b2;
              4'h6: out_low = 9'h1b4;
              4'h7: out_low = 9'h1b6;
              4'h8: out_low = 9'h1b8;
              4'h9: out_low = 9'h1ba;
              4'ha: out_low = 9'h1bc;
              4'hb: out_low = 9'h1be;
              4'hc: out_low = 9'h1c0;
              4'hd: out_low = 9'h1c2;
              4'he: out_low = 9'h1c4;
              4'hf: out_low = 9'h1c6;
              default: out_low = 9'h000;
            endcase
          end
          6'h11: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1c8;
              4'h1: out_low = 9'h1ca;
              4'h2: out_low = 9'h1cc;
              4'h3: out_low = 9'h1ce;
              4'h4: out_low = 9'h1d0;
              4'h5: out_low = 9'h1d2;
              4'h6: out_low = 9'h1d4;
              4'h7: out_low = 9'h1d6;
              4'h8: out_low = 9'h1d8;
              4'h9: out_low = 9'h1da;
              4'ha: out_low = 9'h1dc;
              4'hb: out_low = 9'h1de;
              4'hc: out_low = 9'h1e0;
              4'hd: out_low = 9'h1e2;
              4'he: out_low = 9'h1e4;
              4'hf: out_low = 9'h1e6;
              default: out_low = 9'h000;
            endcase
          end
          6'h12: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1e8;
              4'h1: out_low = 9'h1ea;
              4'h2: out_low = 9'h1ec;
              4'h3: out_low = 9'h1ee;
              4'h4: out_low = 9'h1f0;
              4'h5: out_low = 9'h1f3;
              4'h6: out_low = 9'h1f5;
              4'h7: out_low = 9'h1f7;
              4'h8: out_low = 9'h1f9;
              4'h9: out_low = 9'h1fb;
              4'ha: out_low = 9'h1fd;
              4'hb: out_low = 9'h1ff;
              4'hc: out_low = 9'h001;
              4'hd: out_low = 9'h003;
              4'he: out_low = 9'h005;
              4'hf: out_low = 9'h007;
              default: out_low = 9'h000;
            endcase
          end
          6'h13: begin
            case (mant[3:0])
              4'h0: out_low = 9'h009;
              4'h1: out_low = 9'h00b;
              4'h2: out_low = 9'h00e;
              4'h3: out_low = 9'h010;
              4'h4: out_low = 9'h012;
              4'h5: out_low = 9'h014;
              4'h6: out_low = 9'h016;
              4'h7: out_low = 9'h018;
              4'h8: out_low = 9'h01a;
              4'h9: out_low = 9'h01c;
              4'ha: out_low = 9'h01e;
              4'hb: out_low = 9'h021;
              4'hc: out_low = 9'h023;
              4'hd: out_low = 9'h025;
              4'he: out_low = 9'h027;
              4'hf: out_low = 9'h029;
              default: out_low = 9'h000;
            endcase
          end
          6'h14: begin
            case (mant[3:0])
              4'h0: out_low = 9'h02b;
              4'h1: out_low = 9'h02d;
              4'h2: out_low = 9'h030;
              4'h3: out_low = 9'h032;
              4'h4: out_low = 9'h034;
              4'h5: out_low = 9'h036;
              4'h6: out_low = 9'h038;
              4'h7: out_low = 9'h03a;
              4'h8: out_low = 9'h03c;
              4'h9: out_low = 9'h03f;
              4'ha: out_low = 9'h041;
              4'hb: out_low = 9'h043;
              4'hc: out_low = 9'h045;
              4'hd: out_low = 9'h047;
              4'he: out_low = 9'h049;
              4'hf: out_low = 9'h04c;
              default: out_low = 9'h000;
            endcase
          end
          6'h15: begin
            case (mant[3:0])
              4'h0: out_low = 9'h04e;
              4'h1: out_low = 9'h050;
              4'h2: out_low = 9'h052;
              4'h3: out_low = 9'h054;
              4'h4: out_low = 9'h057;
              4'h5: out_low = 9'h059;
              4'h6: out_low = 9'h05b;
              4'h7: out_low = 9'h05d;
              4'h8: out_low = 9'h05f;
              4'h9: out_low = 9'h062;
              4'ha: out_low = 9'h064;
              4'hb: out_low = 9'h066;
              4'hc: out_low = 9'h068;
              4'hd: out_low = 9'h06a;
              4'he: out_low = 9'h06d;
              4'hf: out_low = 9'h06f;
              default: out_low = 9'h000;
            endcase
          end
          6'h16: begin
            case (mant[3:0])
              4'h0: out_low = 9'h071;
              4'h1: out_low = 9'h073;
              4'h2: out_low = 9'h076;
              4'h3: out_low = 9'h078;
              4'h4: out_low = 9'h07a;
              4'h5: out_low = 9'h07c;
              4'h6: out_low = 9'h07f;
              4'h7: out_low = 9'h081;
              4'h8: out_low = 9'h083;
              4'h9: out_low = 9'h085;
              4'ha: out_low = 9'h088;
              4'hb: out_low = 9'h08a;
              4'hc: out_low = 9'h08c;
              4'hd: out_low = 9'h08e;
              4'he: out_low = 9'h091;
              4'hf: out_low = 9'h093;
              default: out_low = 9'h000;
            endcase
          end
          6'h17: begin
            case (mant[3:0])
              4'h0: out_low = 9'h095;
              4'h1: out_low = 9'h098;
              4'h2: out_low = 9'h09a;
              4'h3: out_low = 9'h09c;
              4'h4: out_low = 9'h09e;
              4'h5: out_low = 9'h0a1;
              4'h6: out_low = 9'h0a3;
              4'h7: out_low = 9'h0a5;
              4'h8: out_low = 9'h0a8;
              4'h9: out_low = 9'h0aa;
              4'ha: out_low = 9'h0ac;
              4'hb: out_low = 9'h0af;
              4'hc: out_low = 9'h0b1;
              4'hd: out_low = 9'h0b3;
              4'he: out_low = 9'h0b5;
              4'hf: out_low = 9'h0b8;
              default: out_low = 9'h000;
            endcase
          end
          6'h18: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0ba;
              4'h1: out_low = 9'h0bc;
              4'h2: out_low = 9'h0bf;
              4'h3: out_low = 9'h0c1;
              4'h4: out_low = 9'h0c4;
              4'h5: out_low = 9'h0c6;
              4'h6: out_low = 9'h0c8;
              4'h7: out_low = 9'h0cb;
              4'h8: out_low = 9'h0cd;
              4'h9: out_low = 9'h0cf;
              4'ha: out_low = 9'h0d2;
              4'hb: out_low = 9'h0d4;
              4'hc: out_low = 9'h0d6;
              4'hd: out_low = 9'h0d9;
              4'he: out_low = 9'h0db;
              4'hf: out_low = 9'h0dd;
              default: out_low = 9'h000;
            endcase
          end
          6'h19: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0e0;
              4'h1: out_low = 9'h0e2;
              4'h2: out_low = 9'h0e5;
              4'h3: out_low = 9'h0e7;
              4'h4: out_low = 9'h0e9;
              4'h5: out_low = 9'h0ec;
              4'h6: out_low = 9'h0ee;
              4'h7: out_low = 9'h0f1;
              4'h8: out_low = 9'h0f3;
              4'h9: out_low = 9'h0f5;
              4'ha: out_low = 9'h0f8;
              4'hb: out_low = 9'h0fa;
              4'hc: out_low = 9'h0fd;
              4'hd: out_low = 9'h0ff;
              4'he: out_low = 9'h102;
              4'hf: out_low = 9'h104;
              default: out_low = 9'h000;
            endcase
          end
          6'h1a: begin
            case (mant[3:0])
              4'h0: out_low = 9'h106;
              4'h1: out_low = 9'h109;
              4'h2: out_low = 9'h10b;
              4'h3: out_low = 9'h10e;
              4'h4: out_low = 9'h110;
              4'h5: out_low = 9'h113;
              4'h6: out_low = 9'h115;
              4'h7: out_low = 9'h118;
              4'h8: out_low = 9'h11a;
              4'h9: out_low = 9'h11c;
              4'ha: out_low = 9'h11f;
              4'hb: out_low = 9'h121;
              4'hc: out_low = 9'h124;
              4'hd: out_low = 9'h126;
              4'he: out_low = 9'h129;
              4'hf: out_low = 9'h12b;
              default: out_low = 9'h000;
            endcase
          end
          6'h1b: begin
            case (mant[3:0])
              4'h0: out_low = 9'h12e;
              4'h1: out_low = 9'h130;
              4'h2: out_low = 9'h133;
              4'h3: out_low = 9'h135;
              4'h4: out_low = 9'h138;
              4'h5: out_low = 9'h13a;
              4'h6: out_low = 9'h13d;
              4'h7: out_low = 9'h13f;
              4'h8: out_low = 9'h142;
              4'h9: out_low = 9'h144;
              4'ha: out_low = 9'h147;
              4'hb: out_low = 9'h149;
              4'hc: out_low = 9'h14c;
              4'hd: out_low = 9'h14e;
              4'he: out_low = 9'h151;
              4'hf: out_low = 9'h153;
              default: out_low = 9'h000;
            endcase
          end
          6'h1c: begin
            case (mant[3:0])
              4'h0: out_low = 9'h156;
              4'h1: out_low = 9'h159;
              4'h2: out_low = 9'h15b;
              4'h3: out_low = 9'h15e;
              4'h4: out_low = 9'h160;
              4'h5: out_low = 9'h163;
              4'h6: out_low = 9'h165;
              4'h7: out_low = 9'h168;
              4'h8: out_low = 9'h16a;
              4'h9: out_low = 9'h16d;
              4'ha: out_low = 9'h170;
              4'hb: out_low = 9'h172;
              4'hc: out_low = 9'h175;
              4'hd: out_low = 9'h177;
              4'he: out_low = 9'h17a;
              4'hf: out_low = 9'h17d;
              default: out_low = 9'h000;
            endcase
          end
          6'h1d: begin
            case (mant[3:0])
              4'h0: out_low = 9'h17f;
              4'h1: out_low = 9'h182;
              4'h2: out_low = 9'h184;
              4'h3: out_low = 9'h187;
              4'h4: out_low = 9'h18a;
              4'h5: out_low = 9'h18c;
              4'h6: out_low = 9'h18f;
              4'h7: out_low = 9'h191;
              4'h8: out_low = 9'h194;
              4'h9: out_low = 9'h197;
              4'ha: out_low = 9'h199;
              4'hb: out_low = 9'h19c;
              4'hc: out_low = 9'h19f;
              4'hd: out_low = 9'h1a1;
              4'he: out_low = 9'h1a4;
              4'hf: out_low = 9'h1a7;
              default: out_low = 9'h000;
            endcase
          end
          6'h1e: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1a9;
              4'h1: out_low = 9'h1ac;
              4'h2: out_low = 9'h1ae;
              4'h3: out_low = 9'h1b1;
              4'h4: out_low = 9'h1b4;
              4'h5: out_low = 9'h1b6;
              4'h6: out_low = 9'h1b9;
              4'h7: out_low = 9'h1bc;
              4'h8: out_low = 9'h1bf;
              4'h9: out_low = 9'h1c1;
              4'ha: out_low = 9'h1c4;
              4'hb: out_low = 9'h1c7;
              4'hc: out_low = 9'h1c9;
              4'hd: out_low = 9'h1cc;
              4'he: out_low = 9'h1cf;
              4'hf: out_low = 9'h1d1;
              default: out_low = 9'h000;
            endcase
          end
          6'h1f: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1d4;
              4'h1: out_low = 9'h1d7;
              4'h2: out_low = 9'h1da;
              4'h3: out_low = 9'h1dc;
              4'h4: out_low = 9'h1df;
              4'h5: out_low = 9'h1e2;
              4'h6: out_low = 9'h1e4;
              4'h7: out_low = 9'h1e7;
              4'h8: out_low = 9'h1ea;
              4'h9: out_low = 9'h1ed;
              4'ha: out_low = 9'h1ef;
              4'hb: out_low = 9'h1f2;
              4'hc: out_low = 9'h1f5;
              4'hd: out_low = 9'h1f8;
              4'he: out_low = 9'h1fa;
              4'hf: out_low = 9'h1fd;
              default: out_low = 9'h000;
            endcase
          end
          6'h20: begin
            case (mant[3:0])
              4'h0: out_low = 9'h000;
              4'h1: out_low = 9'h001;
              4'h2: out_low = 9'h003;
              4'h3: out_low = 9'h004;
              4'h4: out_low = 9'h006;
              4'h5: out_low = 9'h007;
              4'h6: out_low = 9'h008;
              4'h7: out_low = 9'h00a;
              4'h8: out_low = 9'h00b;
              4'h9: out_low = 9'h00d;
              4'ha: out_low = 9'h00e;
              4'hb: out_low = 9'h00f;
              4'hc: out_low = 9'h011;
              4'hd: out_low = 9'h012;
              4'he: out_low = 9'h014;
              4'hf: out_low = 9'h015;
              default: out_low = 9'h000;
            endcase
          end
          6'h21: begin
            case (mant[3:0])
              4'h0: out_low = 9'h016;
              4'h1: out_low = 9'h018;
              4'h2: out_low = 9'h019;
              4'h3: out_low = 9'h01b;
              4'h4: out_low = 9'h01c;
              4'h5: out_low = 9'h01e;
              4'h6: out_low = 9'h01f;
              4'h7: out_low = 9'h020;
              4'h8: out_low = 9'h022;
              4'h9: out_low = 9'h023;
              4'ha: out_low = 9'h025;
              4'hb: out_low = 9'h026;
              4'hc: out_low = 9'h028;
              4'hd: out_low = 9'h029;
              4'he: out_low = 9'h02a;
              4'hf: out_low = 9'h02c;
              default: out_low = 9'h000;
            endcase
          end
          6'h22: begin
            case (mant[3:0])
              4'h0: out_low = 9'h02d;
              4'h1: out_low = 9'h02f;
              4'h2: out_low = 9'h030;
              4'h3: out_low = 9'h032;
              4'h4: out_low = 9'h033;
              4'h5: out_low = 9'h035;
              4'h6: out_low = 9'h036;
              4'h7: out_low = 9'h038;
              4'h8: out_low = 9'h039;
              4'h9: out_low = 9'h03a;
              4'ha: out_low = 9'h03c;
              4'hb: out_low = 9'h03d;
              4'hc: out_low = 9'h03f;
              4'hd: out_low = 9'h040;
              4'he: out_low = 9'h042;
              4'hf: out_low = 9'h043;
              default: out_low = 9'h000;
            endcase
          end
          6'h23: begin
            case (mant[3:0])
              4'h0: out_low = 9'h045;
              4'h1: out_low = 9'h046;
              4'h2: out_low = 9'h048;
              4'h3: out_low = 9'h049;
              4'h4: out_low = 9'h04b;
              4'h5: out_low = 9'h04c;
              4'h6: out_low = 9'h04e;
              4'h7: out_low = 9'h04f;
              4'h8: out_low = 9'h051;
              4'h9: out_low = 9'h052;
              4'ha: out_low = 9'h054;
              4'hb: out_low = 9'h055;
              4'hc: out_low = 9'h057;
              4'hd: out_low = 9'h058;
              4'he: out_low = 9'h05a;
              4'hf: out_low = 9'h05b;
              default: out_low = 9'h000;
            endcase
          end
          6'h24: begin
            case (mant[3:0])
              4'h0: out_low = 9'h05d;
              4'h1: out_low = 9'h05e;
              4'h2: out_low = 9'h060;
              4'h3: out_low = 9'h061;
              4'h4: out_low = 9'h063;
              4'h5: out_low = 9'h064;
              4'h6: out_low = 9'h066;
              4'h7: out_low = 9'h067;
              4'h8: out_low = 9'h069;
              4'h9: out_low = 9'h06a;
              4'ha: out_low = 9'h06c;
              4'hb: out_low = 9'h06d;
              4'hc: out_low = 9'h06f;
              4'hd: out_low = 9'h071;
              4'he: out_low = 9'h072;
              4'hf: out_low = 9'h074;
              default: out_low = 9'h000;
            endcase
          end
          6'h25: begin
            case (mant[3:0])
              4'h0: out_low = 9'h075;
              4'h1: out_low = 9'h077;
              4'h2: out_low = 9'h078;
              4'h3: out_low = 9'h07a;
              4'h4: out_low = 9'h07b;
              4'h5: out_low = 9'h07d;
              4'h6: out_low = 9'h07e;
              4'h7: out_low = 9'h080;
              4'h8: out_low = 9'h082;
              4'h9: out_low = 9'h083;
              4'ha: out_low = 9'h085;
              4'hb: out_low = 9'h086;
              4'hc: out_low = 9'h088;
              4'hd: out_low = 9'h089;
              4'he: out_low = 9'h08b;
              4'hf: out_low = 9'h08d;
              default: out_low = 9'h000;
            endcase
          end
          6'h26: begin
            case (mant[3:0])
              4'h0: out_low = 9'h08e;
              4'h1: out_low = 9'h090;
              4'h2: out_low = 9'h091;
              4'h3: out_low = 9'h093;
              4'h4: out_low = 9'h094;
              4'h5: out_low = 9'h096;
              4'h6: out_low = 9'h098;
              4'h7: out_low = 9'h099;
              4'h8: out_low = 9'h09b;
              4'h9: out_low = 9'h09c;
              4'ha: out_low = 9'h09e;
              4'hb: out_low = 9'h0a0;
              4'hc: out_low = 9'h0a1;
              4'hd: out_low = 9'h0a3;
              4'he: out_low = 9'h0a4;
              4'hf: out_low = 9'h0a6;
              default: out_low = 9'h000;
            endcase
          end
          6'h27: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0a8;
              4'h1: out_low = 9'h0a9;
              4'h2: out_low = 9'h0ab;
              4'h3: out_low = 9'h0ad;
              4'h4: out_low = 9'h0ae;
              4'h5: out_low = 9'h0b0;
              4'h6: out_low = 9'h0b1;
              4'h7: out_low = 9'h0b3;
              4'h8: out_low = 9'h0b5;
              4'h9: out_low = 9'h0b6;
              4'ha: out_low = 9'h0b8;
              4'hb: out_low = 9'h0ba;
              4'hc: out_low = 9'h0bb;
              4'hd: out_low = 9'h0bd;
              4'he: out_low = 9'h0be;
              4'hf: out_low = 9'h0c0;
              default: out_low = 9'h000;
            endcase
          end
          6'h28: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0c2;
              4'h1: out_low = 9'h0c3;
              4'h2: out_low = 9'h0c5;
              4'h3: out_low = 9'h0c7;
              4'h4: out_low = 9'h0c8;
              4'h5: out_low = 9'h0ca;
              4'h6: out_low = 9'h0cc;
              4'h7: out_low = 9'h0cd;
              4'h8: out_low = 9'h0cf;
              4'h9: out_low = 9'h0d1;
              4'ha: out_low = 9'h0d2;
              4'hb: out_low = 9'h0d4;
              4'hc: out_low = 9'h0d6;
              4'hd: out_low = 9'h0d7;
              4'he: out_low = 9'h0d9;
              4'hf: out_low = 9'h0db;
              default: out_low = 9'h000;
            endcase
          end
          6'h29: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0dc;
              4'h1: out_low = 9'h0de;
              4'h2: out_low = 9'h0e0;
              4'h3: out_low = 9'h0e1;
              4'h4: out_low = 9'h0e3;
              4'h5: out_low = 9'h0e5;
              4'h6: out_low = 9'h0e7;
              4'h7: out_low = 9'h0e8;
              4'h8: out_low = 9'h0ea;
              4'h9: out_low = 9'h0ec;
              4'ha: out_low = 9'h0ed;
              4'hb: out_low = 9'h0ef;
              4'hc: out_low = 9'h0f1;
              4'hd: out_low = 9'h0f3;
              4'he: out_low = 9'h0f4;
              4'hf: out_low = 9'h0f6;
              default: out_low = 9'h000;
            endcase
          end
          6'h2a: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0f8;
              4'h1: out_low = 9'h0f9;
              4'h2: out_low = 9'h0fb;
              4'h3: out_low = 9'h0fd;
              4'h4: out_low = 9'h0ff;
              4'h5: out_low = 9'h100;
              4'h6: out_low = 9'h102;
              4'h7: out_low = 9'h104;
              4'h8: out_low = 9'h106;
              4'h9: out_low = 9'h107;
              4'ha: out_low = 9'h109;
              4'hb: out_low = 9'h10b;
              4'hc: out_low = 9'h10c;
              4'hd: out_low = 9'h10e;
              4'he: out_low = 9'h110;
              4'hf: out_low = 9'h112;
              default: out_low = 9'h000;
            endcase
          end
          6'h2b: begin
            case (mant[3:0])
              4'h0: out_low = 9'h114;
              4'h1: out_low = 9'h115;
              4'h2: out_low = 9'h117;
              4'h3: out_low = 9'h119;
              4'h4: out_low = 9'h11b;
              4'h5: out_low = 9'h11c;
              4'h6: out_low = 9'h11e;
              4'h7: out_low = 9'h120;
              4'h8: out_low = 9'h122;
              4'h9: out_low = 9'h123;
              4'ha: out_low = 9'h125;
              4'hb: out_low = 9'h127;
              4'hc: out_low = 9'h129;
              4'hd: out_low = 9'h12b;
              4'he: out_low = 9'h12c;
              4'hf: out_low = 9'h12e;
              default: out_low = 9'h000;
            endcase
          end
          6'h2c: begin
            case (mant[3:0])
              4'h0: out_low = 9'h130;
              4'h1: out_low = 9'h132;
              4'h2: out_low = 9'h134;
              4'h3: out_low = 9'h135;
              4'h4: out_low = 9'h137;
              4'h5: out_low = 9'h139;
              4'h6: out_low = 9'h13b;
              4'h7: out_low = 9'h13d;
              4'h8: out_low = 9'h13e;
              4'h9: out_low = 9'h140;
              4'ha: out_low = 9'h142;
              4'hb: out_low = 9'h144;
              4'hc: out_low = 9'h146;
              4'hd: out_low = 9'h148;
              4'he: out_low = 9'h149;
              4'hf: out_low = 9'h14b;
              default: out_low = 9'h000;
            endcase
          end
          6'h2d: begin
            case (mant[3:0])
              4'h0: out_low = 9'h14d;
              4'h1: out_low = 9'h14f;
              4'h2: out_low = 9'h151;
              4'h3: out_low = 9'h153;
              4'h4: out_low = 9'h154;
              4'h5: out_low = 9'h156;
              4'h6: out_low = 9'h158;
              4'h7: out_low = 9'h15a;
              4'h8: out_low = 9'h15c;
              4'h9: out_low = 9'h15e;
              4'ha: out_low = 9'h160;
              4'hb: out_low = 9'h161;
              4'hc: out_low = 9'h163;
              4'hd: out_low = 9'h165;
              4'he: out_low = 9'h167;
              4'hf: out_low = 9'h169;
              default: out_low = 9'h000;
            endcase
          end
          6'h2e: begin
            case (mant[3:0])
              4'h0: out_low = 9'h16b;
              4'h1: out_low = 9'h16d;
              4'h2: out_low = 9'h16f;
              4'h3: out_low = 9'h170;
              4'h4: out_low = 9'h172;
              4'h5: out_low = 9'h174;
              4'h6: out_low = 9'h176;
              4'h7: out_low = 9'h178;
              4'h8: out_low = 9'h17a;
              4'h9: out_low = 9'h17c;
              4'ha: out_low = 9'h17e;
              4'hb: out_low = 9'h180;
              4'hc: out_low = 9'h181;
              4'hd: out_low = 9'h183;
              4'he: out_low = 9'h185;
              4'hf: out_low = 9'h187;
              default: out_low = 9'h000;
            endcase
          end
          6'h2f: begin
            case (mant[3:0])
              4'h0: out_low = 9'h189;
              4'h1: out_low = 9'h18b;
              4'h2: out_low = 9'h18d;
              4'h3: out_low = 9'h18f;
              4'h4: out_low = 9'h191;
              4'h5: out_low = 9'h193;
              4'h6: out_low = 9'h195;
              4'h7: out_low = 9'h197;
              4'h8: out_low = 9'h199;
              4'h9: out_low = 9'h19a;
              4'ha: out_low = 9'h19c;
              4'hb: out_low = 9'h19e;
              4'hc: out_low = 9'h1a0;
              4'hd: out_low = 9'h1a2;
              4'he: out_low = 9'h1a4;
              4'hf: out_low = 9'h1a6;
              default: out_low = 9'h000;
            endcase
          end
          6'h30: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1a8;
              4'h1: out_low = 9'h1aa;
              4'h2: out_low = 9'h1ac;
              4'h3: out_low = 9'h1ae;
              4'h4: out_low = 9'h1b0;
              4'h5: out_low = 9'h1b2;
              4'h6: out_low = 9'h1b4;
              4'h7: out_low = 9'h1b6;
              4'h8: out_low = 9'h1b8;
              4'h9: out_low = 9'h1ba;
              4'ha: out_low = 9'h1bc;
              4'hb: out_low = 9'h1be;
              4'hc: out_low = 9'h1c0;
              4'hd: out_low = 9'h1c2;
              4'he: out_low = 9'h1c4;
              4'hf: out_low = 9'h1c6;
              default: out_low = 9'h000;
            endcase
          end
          6'h31: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1c8;
              4'h1: out_low = 9'h1ca;
              4'h2: out_low = 9'h1cc;
              4'h3: out_low = 9'h1ce;
              4'h4: out_low = 9'h1d0;
              4'h5: out_low = 9'h1d2;
              4'h6: out_low = 9'h1d4;
              4'h7: out_low = 9'h1d6;
              4'h8: out_low = 9'h1d8;
              4'h9: out_low = 9'h1da;
              4'ha: out_low = 9'h1dc;
              4'hb: out_low = 9'h1de;
              4'hc: out_low = 9'h1e0;
              4'hd: out_low = 9'h1e2;
              4'he: out_low = 9'h1e4;
              4'hf: out_low = 9'h1e6;
              default: out_low = 9'h000;
            endcase
          end
          6'h32: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1e8;
              4'h1: out_low = 9'h1ea;
              4'h2: out_low = 9'h1ec;
              4'h3: out_low = 9'h1ee;
              4'h4: out_low = 9'h1f0;
              4'h5: out_low = 9'h1f3;
              4'h6: out_low = 9'h1f5;
              4'h7: out_low = 9'h1f7;
              4'h8: out_low = 9'h1f9;
              4'h9: out_low = 9'h1fb;
              4'ha: out_low = 9'h1fd;
              4'hb: out_low = 9'h1ff;
              4'hc: out_low = 9'h001;
              4'hd: out_low = 9'h003;
              4'he: out_low = 9'h005;
              4'hf: out_low = 9'h007;
              default: out_low = 9'h000;
            endcase
          end
          6'h33: begin
            case (mant[3:0])
              4'h0: out_low = 9'h009;
              4'h1: out_low = 9'h00b;
              4'h2: out_low = 9'h00e;
              4'h3: out_low = 9'h010;
              4'h4: out_low = 9'h012;
              4'h5: out_low = 9'h014;
              4'h6: out_low = 9'h016;
              4'h7: out_low = 9'h018;
              4'h8: out_low = 9'h01a;
              4'h9: out_low = 9'h01c;
              4'ha: out_low = 9'h01e;
              4'hb: out_low = 9'h021;
              4'hc: out_low = 9'h023;
              4'hd: out_low = 9'h025;
              4'he: out_low = 9'h027;
              4'hf: out_low = 9'h029;
              default: out_low = 9'h000;
            endcase
          end
          6'h34: begin
            case (mant[3:0])
              4'h0: out_low = 9'h02b;
              4'h1: out_low = 9'h02d;
              4'h2: out_low = 9'h030;
              4'h3: out_low = 9'h032;
              4'h4: out_low = 9'h034;
              4'h5: out_low = 9'h036;
              4'h6: out_low = 9'h038;
              4'h7: out_low = 9'h03a;
              4'h8: out_low = 9'h03c;
              4'h9: out_low = 9'h03f;
              4'ha: out_low = 9'h041;
              4'hb: out_low = 9'h043;
              4'hc: out_low = 9'h045;
              4'hd: out_low = 9'h047;
              4'he: out_low = 9'h049;
              4'hf: out_low = 9'h04c;
              default: out_low = 9'h000;
            endcase
          end
          6'h35: begin
            case (mant[3:0])
              4'h0: out_low = 9'h04e;
              4'h1: out_low = 9'h050;
              4'h2: out_low = 9'h052;
              4'h3: out_low = 9'h054;
              4'h4: out_low = 9'h057;
              4'h5: out_low = 9'h059;
              4'h6: out_low = 9'h05b;
              4'h7: out_low = 9'h05d;
              4'h8: out_low = 9'h05f;
              4'h9: out_low = 9'h062;
              4'ha: out_low = 9'h064;
              4'hb: out_low = 9'h066;
              4'hc: out_low = 9'h068;
              4'hd: out_low = 9'h06a;
              4'he: out_low = 9'h06d;
              4'hf: out_low = 9'h06f;
              default: out_low = 9'h000;
            endcase
          end
          6'h36: begin
            case (mant[3:0])
              4'h0: out_low = 9'h071;
              4'h1: out_low = 9'h073;
              4'h2: out_low = 9'h076;
              4'h3: out_low = 9'h078;
              4'h4: out_low = 9'h07a;
              4'h5: out_low = 9'h07c;
              4'h6: out_low = 9'h07f;
              4'h7: out_low = 9'h081;
              4'h8: out_low = 9'h083;
              4'h9: out_low = 9'h085;
              4'ha: out_low = 9'h088;
              4'hb: out_low = 9'h08a;
              4'hc: out_low = 9'h08c;
              4'hd: out_low = 9'h08e;
              4'he: out_low = 9'h091;
              4'hf: out_low = 9'h093;
              default: out_low = 9'h000;
            endcase
          end
          6'h37: begin
            case (mant[3:0])
              4'h0: out_low = 9'h095;
              4'h1: out_low = 9'h098;
              4'h2: out_low = 9'h09a;
              4'h3: out_low = 9'h09c;
              4'h4: out_low = 9'h09e;
              4'h5: out_low = 9'h0a1;
              4'h6: out_low = 9'h0a3;
              4'h7: out_low = 9'h0a5;
              4'h8: out_low = 9'h0a8;
              4'h9: out_low = 9'h0aa;
              4'ha: out_low = 9'h0ac;
              4'hb: out_low = 9'h0af;
              4'hc: out_low = 9'h0b1;
              4'hd: out_low = 9'h0b3;
              4'he: out_low = 9'h0b5;
              4'hf: out_low = 9'h0b8;
              default: out_low = 9'h000;
            endcase
          end
          6'h38: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0ba;
              4'h1: out_low = 9'h0bc;
              4'h2: out_low = 9'h0bf;
              4'h3: out_low = 9'h0c1;
              4'h4: out_low = 9'h0c4;
              4'h5: out_low = 9'h0c6;
              4'h6: out_low = 9'h0c8;
              4'h7: out_low = 9'h0cb;
              4'h8: out_low = 9'h0cd;
              4'h9: out_low = 9'h0cf;
              4'ha: out_low = 9'h0d2;
              4'hb: out_low = 9'h0d4;
              4'hc: out_low = 9'h0d6;
              4'hd: out_low = 9'h0d9;
              4'he: out_low = 9'h0db;
              4'hf: out_low = 9'h0dd;
              default: out_low = 9'h000;
            endcase
          end
          6'h39: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0e0;
              4'h1: out_low = 9'h0e2;
              4'h2: out_low = 9'h0e5;
              4'h3: out_low = 9'h0e7;
              4'h4: out_low = 9'h0e9;
              4'h5: out_low = 9'h0ec;
              4'h6: out_low = 9'h0ee;
              4'h7: out_low = 9'h0f1;
              4'h8: out_low = 9'h0f3;
              4'h9: out_low = 9'h0f5;
              4'ha: out_low = 9'h0f8;
              4'hb: out_low = 9'h0fa;
              4'hc: out_low = 9'h0fd;
              4'hd: out_low = 9'h0ff;
              4'he: out_low = 9'h102;
              4'hf: out_low = 9'h104;
              default: out_low = 9'h000;
            endcase
          end
          6'h3a: begin
            case (mant[3:0])
              4'h0: out_low = 9'h106;
              4'h1: out_low = 9'h109;
              4'h2: out_low = 9'h10b;
              4'h3: out_low = 9'h10e;
              4'h4: out_low = 9'h110;
              4'h5: out_low = 9'h113;
              4'h6: out_low = 9'h115;
              4'h7: out_low = 9'h118;
              4'h8: out_low = 9'h11a;
              4'h9: out_low = 9'h11c;
              4'ha: out_low = 9'h11f;
              4'hb: out_low = 9'h121;
              4'hc: out_low = 9'h124;
              4'hd: out_low = 9'h126;
              4'he: out_low = 9'h129;
              4'hf: out_low = 9'h12b;
              default: out_low = 9'h000;
            endcase
          end
          6'h3b: begin
            case (mant[3:0])
              4'h0: out_low = 9'h12e;
              4'h1: out_low = 9'h130;
              4'h2: out_low = 9'h133;
              4'h3: out_low = 9'h135;
              4'h4: out_low = 9'h138;
              4'h5: out_low = 9'h13a;
              4'h6: out_low = 9'h13d;
              4'h7: out_low = 9'h13f;
              4'h8: out_low = 9'h142;
              4'h9: out_low = 9'h144;
              4'ha: out_low = 9'h147;
              4'hb: out_low = 9'h149;
              4'hc: out_low = 9'h14c;
              4'hd: out_low = 9'h14e;
              4'he: out_low = 9'h151;
              4'hf: out_low = 9'h153;
              default: out_low = 9'h000;
            endcase
          end
          6'h3c: begin
            case (mant[3:0])
              4'h0: out_low = 9'h156;
              4'h1: out_low = 9'h159;
              4'h2: out_low = 9'h15b;
              4'h3: out_low = 9'h15e;
              4'h4: out_low = 9'h160;
              4'h5: out_low = 9'h163;
              4'h6: out_low = 9'h165;
              4'h7: out_low = 9'h168;
              4'h8: out_low = 9'h16a;
              4'h9: out_low = 9'h16d;
              4'ha: out_low = 9'h170;
              4'hb: out_low = 9'h172;
              4'hc: out_low = 9'h175;
              4'hd: out_low = 9'h177;
              4'he: out_low = 9'h17a;
              4'hf: out_low = 9'h17d;
              default: out_low = 9'h000;
            endcase
          end
          6'h3d: begin
            case (mant[3:0])
              4'h0: out_low = 9'h17f;
              4'h1: out_low = 9'h182;
              4'h2: out_low = 9'h184;
              4'h3: out_low = 9'h187;
              4'h4: out_low = 9'h18a;
              4'h5: out_low = 9'h18c;
              4'h6: out_low = 9'h18f;
              4'h7: out_low = 9'h191;
              4'h8: out_low = 9'h194;
              4'h9: out_low = 9'h197;
              4'ha: out_low = 9'h199;
              4'hb: out_low = 9'h19c;
              4'hc: out_low = 9'h19f;
              4'hd: out_low = 9'h1a1;
              4'he: out_low = 9'h1a4;
              4'hf: out_low = 9'h1a7;
              default: out_low = 9'h000;
            endcase
          end
          6'h3e: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1a9;
              4'h1: out_low = 9'h1ac;
              4'h2: out_low = 9'h1ae;
              4'h3: out_low = 9'h1b1;
              4'h4: out_low = 9'h1b4;
              4'h5: out_low = 9'h1b6;
              4'h6: out_low = 9'h1b9;
              4'h7: out_low = 9'h1bc;
              4'h8: out_low = 9'h1bf;
              4'h9: out_low = 9'h1c1;
              4'ha: out_low = 9'h1c4;
              4'hb: out_low = 9'h1c7;
              4'hc: out_low = 9'h1c9;
              4'hd: out_low = 9'h1cc;
              4'he: out_low = 9'h1cf;
              4'hf: out_low = 9'h1d1;
              default: out_low = 9'h000;
            endcase
          end
          6'h3f: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1d4;
              4'h1: out_low = 9'h1d7;
              4'h2: out_low = 9'h1da;
              4'h3: out_low = 9'h1dc;
              4'h4: out_low = 9'h1df;
              4'h5: out_low = 9'h1e2;
              4'h6: out_low = 9'h1e4;
              4'h7: out_low = 9'h1e7;
              4'h8: out_low = 9'h1ea;
              4'h9: out_low = 9'h1ed;
              4'ha: out_low = 9'h1ef;
              4'hb: out_low = 9'h1f2;
              4'hc: out_low = 9'h1f5;
              4'hd: out_low = 9'h1f8;
              4'he: out_low = 9'h1fa;
              4'hf: out_low = 9'h1fd;
              default: out_low = 9'h000;
            endcase
          end
          default: out_low = 9'h000;
        endcase
      end
      6'h11: begin
        case (mant[9:4])
          6'h00: begin
            case (mant[3:0])
              4'h0: out_low = 9'h000;
              4'h1: out_low = 9'h003;
              4'h2: out_low = 9'h006;
              4'h3: out_low = 9'h008;
              4'h4: out_low = 9'h00b;
              4'h5: out_low = 9'h00e;
              4'h6: out_low = 9'h011;
              4'h7: out_low = 9'h014;
              4'h8: out_low = 9'h016;
              4'h9: out_low = 9'h019;
              4'ha: out_low = 9'h01c;
              4'hb: out_low = 9'h01f;
              4'hc: out_low = 9'h022;
              4'hd: out_low = 9'h025;
              4'he: out_low = 9'h028;
              4'hf: out_low = 9'h02a;
              default: out_low = 9'h000;
            endcase
          end
          6'h01: begin
            case (mant[3:0])
              4'h0: out_low = 9'h02d;
              4'h1: out_low = 9'h030;
              4'h2: out_low = 9'h033;
              4'h3: out_low = 9'h036;
              4'h4: out_low = 9'h039;
              4'h5: out_low = 9'h03c;
              4'h6: out_low = 9'h03f;
              4'h7: out_low = 9'h042;
              4'h8: out_low = 9'h045;
              4'h9: out_low = 9'h048;
              4'ha: out_low = 9'h04b;
              4'hb: out_low = 9'h04e;
              4'hc: out_low = 9'h051;
              4'hd: out_low = 9'h054;
              4'he: out_low = 9'h057;
              4'hf: out_low = 9'h05a;
              default: out_low = 9'h000;
            endcase
          end
          6'h02: begin
            case (mant[3:0])
              4'h0: out_low = 9'h05d;
              4'h1: out_low = 9'h060;
              4'h2: out_low = 9'h063;
              4'h3: out_low = 9'h066;
              4'h4: out_low = 9'h069;
              4'h5: out_low = 9'h06c;
              4'h6: out_low = 9'h06f;
              4'h7: out_low = 9'h072;
              4'h8: out_low = 9'h075;
              4'h9: out_low = 9'h078;
              4'ha: out_low = 9'h07b;
              4'hb: out_low = 9'h07e;
              4'hc: out_low = 9'h082;
              4'hd: out_low = 9'h085;
              4'he: out_low = 9'h088;
              4'hf: out_low = 9'h08b;
              default: out_low = 9'h000;
            endcase
          end
          6'h03: begin
            case (mant[3:0])
              4'h0: out_low = 9'h08e;
              4'h1: out_low = 9'h091;
              4'h2: out_low = 9'h094;
              4'h3: out_low = 9'h098;
              4'h4: out_low = 9'h09b;
              4'h5: out_low = 9'h09e;
              4'h6: out_low = 9'h0a1;
              4'h7: out_low = 9'h0a4;
              4'h8: out_low = 9'h0a8;
              4'h9: out_low = 9'h0ab;
              4'ha: out_low = 9'h0ae;
              4'hb: out_low = 9'h0b1;
              4'hc: out_low = 9'h0b5;
              4'hd: out_low = 9'h0b8;
              4'he: out_low = 9'h0bb;
              4'hf: out_low = 9'h0be;
              default: out_low = 9'h000;
            endcase
          end
          6'h04: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0c2;
              4'h1: out_low = 9'h0c5;
              4'h2: out_low = 9'h0c8;
              4'h3: out_low = 9'h0cc;
              4'h4: out_low = 9'h0cf;
              4'h5: out_low = 9'h0d2;
              4'h6: out_low = 9'h0d6;
              4'h7: out_low = 9'h0d9;
              4'h8: out_low = 9'h0dc;
              4'h9: out_low = 9'h0e0;
              4'ha: out_low = 9'h0e3;
              4'hb: out_low = 9'h0e7;
              4'hc: out_low = 9'h0ea;
              4'hd: out_low = 9'h0ed;
              4'he: out_low = 9'h0f1;
              4'hf: out_low = 9'h0f4;
              default: out_low = 9'h000;
            endcase
          end
          6'h05: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0f8;
              4'h1: out_low = 9'h0fb;
              4'h2: out_low = 9'h0ff;
              4'h3: out_low = 9'h102;
              4'h4: out_low = 9'h106;
              4'h5: out_low = 9'h109;
              4'h6: out_low = 9'h10c;
              4'h7: out_low = 9'h110;
              4'h8: out_low = 9'h114;
              4'h9: out_low = 9'h117;
              4'ha: out_low = 9'h11b;
              4'hb: out_low = 9'h11e;
              4'hc: out_low = 9'h122;
              4'hd: out_low = 9'h125;
              4'he: out_low = 9'h129;
              4'hf: out_low = 9'h12c;
              default: out_low = 9'h000;
            endcase
          end
          6'h06: begin
            case (mant[3:0])
              4'h0: out_low = 9'h130;
              4'h1: out_low = 9'h134;
              4'h2: out_low = 9'h137;
              4'h3: out_low = 9'h13b;
              4'h4: out_low = 9'h13e;
              4'h5: out_low = 9'h142;
              4'h6: out_low = 9'h146;
              4'h7: out_low = 9'h149;
              4'h8: out_low = 9'h14d;
              4'h9: out_low = 9'h151;
              4'ha: out_low = 9'h154;
              4'hb: out_low = 9'h158;
              4'hc: out_low = 9'h15c;
              4'hd: out_low = 9'h160;
              4'he: out_low = 9'h163;
              4'hf: out_low = 9'h167;
              default: out_low = 9'h000;
            endcase
          end
          6'h07: begin
            case (mant[3:0])
              4'h0: out_low = 9'h16b;
              4'h1: out_low = 9'h16f;
              4'h2: out_low = 9'h172;
              4'h3: out_low = 9'h176;
              4'h4: out_low = 9'h17a;
              4'h5: out_low = 9'h17e;
              4'h6: out_low = 9'h181;
              4'h7: out_low = 9'h185;
              4'h8: out_low = 9'h189;
              4'h9: out_low = 9'h18d;
              4'ha: out_low = 9'h191;
              4'hb: out_low = 9'h195;
              4'hc: out_low = 9'h199;
              4'hd: out_low = 9'h19c;
              4'he: out_low = 9'h1a0;
              4'hf: out_low = 9'h1a4;
              default: out_low = 9'h000;
            endcase
          end
          6'h08: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1a8;
              4'h1: out_low = 9'h1ac;
              4'h2: out_low = 9'h1b0;
              4'h3: out_low = 9'h1b4;
              4'h4: out_low = 9'h1b8;
              4'h5: out_low = 9'h1bc;
              4'h6: out_low = 9'h1c0;
              4'h7: out_low = 9'h1c4;
              4'h8: out_low = 9'h1c8;
              4'h9: out_low = 9'h1cc;
              4'ha: out_low = 9'h1d0;
              4'hb: out_low = 9'h1d4;
              4'hc: out_low = 9'h1d8;
              4'hd: out_low = 9'h1dc;
              4'he: out_low = 9'h1e0;
              4'hf: out_low = 9'h1e4;
              default: out_low = 9'h000;
            endcase
          end
          6'h09: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1e8;
              4'h1: out_low = 9'h1ec;
              4'h2: out_low = 9'h1f0;
              4'h3: out_low = 9'h1f5;
              4'h4: out_low = 9'h1f9;
              4'h5: out_low = 9'h1fd;
              4'h6: out_low = 9'h001;
              4'h7: out_low = 9'h005;
              4'h8: out_low = 9'h009;
              4'h9: out_low = 9'h00e;
              4'ha: out_low = 9'h012;
              4'hb: out_low = 9'h016;
              4'hc: out_low = 9'h01a;
              4'hd: out_low = 9'h01e;
              4'he: out_low = 9'h023;
              4'hf: out_low = 9'h027;
              default: out_low = 9'h000;
            endcase
          end
          6'h0a: begin
            case (mant[3:0])
              4'h0: out_low = 9'h02b;
              4'h1: out_low = 9'h030;
              4'h2: out_low = 9'h034;
              4'h3: out_low = 9'h038;
              4'h4: out_low = 9'h03c;
              4'h5: out_low = 9'h041;
              4'h6: out_low = 9'h045;
              4'h7: out_low = 9'h049;
              4'h8: out_low = 9'h04e;
              4'h9: out_low = 9'h052;
              4'ha: out_low = 9'h057;
              4'hb: out_low = 9'h05b;
              4'hc: out_low = 9'h05f;
              4'hd: out_low = 9'h064;
              4'he: out_low = 9'h068;
              4'hf: out_low = 9'h06d;
              default: out_low = 9'h000;
            endcase
          end
          6'h0b: begin
            case (mant[3:0])
              4'h0: out_low = 9'h071;
              4'h1: out_low = 9'h076;
              4'h2: out_low = 9'h07a;
              4'h3: out_low = 9'h07f;
              4'h4: out_low = 9'h083;
              4'h5: out_low = 9'h088;
              4'h6: out_low = 9'h08c;
              4'h7: out_low = 9'h091;
              4'h8: out_low = 9'h095;
              4'h9: out_low = 9'h09a;
              4'ha: out_low = 9'h09e;
              4'hb: out_low = 9'h0a3;
              4'hc: out_low = 9'h0a8;
              4'hd: out_low = 9'h0ac;
              4'he: out_low = 9'h0b1;
              4'hf: out_low = 9'h0b5;
              default: out_low = 9'h000;
            endcase
          end
          6'h0c: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0ba;
              4'h1: out_low = 9'h0bf;
              4'h2: out_low = 9'h0c4;
              4'h3: out_low = 9'h0c8;
              4'h4: out_low = 9'h0cd;
              4'h5: out_low = 9'h0d2;
              4'h6: out_low = 9'h0d6;
              4'h7: out_low = 9'h0db;
              4'h8: out_low = 9'h0e0;
              4'h9: out_low = 9'h0e5;
              4'ha: out_low = 9'h0e9;
              4'hb: out_low = 9'h0ee;
              4'hc: out_low = 9'h0f3;
              4'hd: out_low = 9'h0f8;
              4'he: out_low = 9'h0fd;
              4'hf: out_low = 9'h102;
              default: out_low = 9'h000;
            endcase
          end
          6'h0d: begin
            case (mant[3:0])
              4'h0: out_low = 9'h106;
              4'h1: out_low = 9'h10b;
              4'h2: out_low = 9'h110;
              4'h3: out_low = 9'h115;
              4'h4: out_low = 9'h11a;
              4'h5: out_low = 9'h11f;
              4'h6: out_low = 9'h124;
              4'h7: out_low = 9'h129;
              4'h8: out_low = 9'h12e;
              4'h9: out_low = 9'h133;
              4'ha: out_low = 9'h138;
              4'hb: out_low = 9'h13d;
              4'hc: out_low = 9'h142;
              4'hd: out_low = 9'h147;
              4'he: out_low = 9'h14c;
              4'hf: out_low = 9'h151;
              default: out_low = 9'h000;
            endcase
          end
          6'h0e: begin
            case (mant[3:0])
              4'h0: out_low = 9'h156;
              4'h1: out_low = 9'h15b;
              4'h2: out_low = 9'h160;
              4'h3: out_low = 9'h165;
              4'h4: out_low = 9'h16a;
              4'h5: out_low = 9'h170;
              4'h6: out_low = 9'h175;
              4'h7: out_low = 9'h17a;
              4'h8: out_low = 9'h17f;
              4'h9: out_low = 9'h184;
              4'ha: out_low = 9'h18a;
              4'hb: out_low = 9'h18f;
              4'hc: out_low = 9'h194;
              4'hd: out_low = 9'h199;
              4'he: out_low = 9'h19f;
              4'hf: out_low = 9'h1a4;
              default: out_low = 9'h000;
            endcase
          end
          6'h0f: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1a9;
              4'h1: out_low = 9'h1ae;
              4'h2: out_low = 9'h1b4;
              4'h3: out_low = 9'h1b9;
              4'h4: out_low = 9'h1bf;
              4'h5: out_low = 9'h1c4;
              4'h6: out_low = 9'h1c9;
              4'h7: out_low = 9'h1cf;
              4'h8: out_low = 9'h1d4;
              4'h9: out_low = 9'h1da;
              4'ha: out_low = 9'h1df;
              4'hb: out_low = 9'h1e4;
              4'hc: out_low = 9'h1ea;
              4'hd: out_low = 9'h1ef;
              4'he: out_low = 9'h1f5;
              4'hf: out_low = 9'h1fa;
              default: out_low = 9'h000;
            endcase
          end
          6'h10: begin
            case (mant[3:0])
              4'h0: out_low = 9'h000;
              4'h1: out_low = 9'h003;
              4'h2: out_low = 9'h006;
              4'h3: out_low = 9'h008;
              4'h4: out_low = 9'h00b;
              4'h5: out_low = 9'h00e;
              4'h6: out_low = 9'h011;
              4'h7: out_low = 9'h014;
              4'h8: out_low = 9'h016;
              4'h9: out_low = 9'h019;
              4'ha: out_low = 9'h01c;
              4'hb: out_low = 9'h01f;
              4'hc: out_low = 9'h022;
              4'hd: out_low = 9'h025;
              4'he: out_low = 9'h028;
              4'hf: out_low = 9'h02a;
              default: out_low = 9'h000;
            endcase
          end
          6'h11: begin
            case (mant[3:0])
              4'h0: out_low = 9'h02d;
              4'h1: out_low = 9'h030;
              4'h2: out_low = 9'h033;
              4'h3: out_low = 9'h036;
              4'h4: out_low = 9'h039;
              4'h5: out_low = 9'h03c;
              4'h6: out_low = 9'h03f;
              4'h7: out_low = 9'h042;
              4'h8: out_low = 9'h045;
              4'h9: out_low = 9'h048;
              4'ha: out_low = 9'h04b;
              4'hb: out_low = 9'h04e;
              4'hc: out_low = 9'h051;
              4'hd: out_low = 9'h054;
              4'he: out_low = 9'h057;
              4'hf: out_low = 9'h05a;
              default: out_low = 9'h000;
            endcase
          end
          6'h12: begin
            case (mant[3:0])
              4'h0: out_low = 9'h05d;
              4'h1: out_low = 9'h060;
              4'h2: out_low = 9'h063;
              4'h3: out_low = 9'h066;
              4'h4: out_low = 9'h069;
              4'h5: out_low = 9'h06c;
              4'h6: out_low = 9'h06f;
              4'h7: out_low = 9'h072;
              4'h8: out_low = 9'h075;
              4'h9: out_low = 9'h078;
              4'ha: out_low = 9'h07b;
              4'hb: out_low = 9'h07e;
              4'hc: out_low = 9'h082;
              4'hd: out_low = 9'h085;
              4'he: out_low = 9'h088;
              4'hf: out_low = 9'h08b;
              default: out_low = 9'h000;
            endcase
          end
          6'h13: begin
            case (mant[3:0])
              4'h0: out_low = 9'h08e;
              4'h1: out_low = 9'h091;
              4'h2: out_low = 9'h094;
              4'h3: out_low = 9'h098;
              4'h4: out_low = 9'h09b;
              4'h5: out_low = 9'h09e;
              4'h6: out_low = 9'h0a1;
              4'h7: out_low = 9'h0a4;
              4'h8: out_low = 9'h0a8;
              4'h9: out_low = 9'h0ab;
              4'ha: out_low = 9'h0ae;
              4'hb: out_low = 9'h0b1;
              4'hc: out_low = 9'h0b5;
              4'hd: out_low = 9'h0b8;
              4'he: out_low = 9'h0bb;
              4'hf: out_low = 9'h0be;
              default: out_low = 9'h000;
            endcase
          end
          6'h14: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0c2;
              4'h1: out_low = 9'h0c5;
              4'h2: out_low = 9'h0c8;
              4'h3: out_low = 9'h0cc;
              4'h4: out_low = 9'h0cf;
              4'h5: out_low = 9'h0d2;
              4'h6: out_low = 9'h0d6;
              4'h7: out_low = 9'h0d9;
              4'h8: out_low = 9'h0dc;
              4'h9: out_low = 9'h0e0;
              4'ha: out_low = 9'h0e3;
              4'hb: out_low = 9'h0e7;
              4'hc: out_low = 9'h0ea;
              4'hd: out_low = 9'h0ed;
              4'he: out_low = 9'h0f1;
              4'hf: out_low = 9'h0f4;
              default: out_low = 9'h000;
            endcase
          end
          6'h15: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0f8;
              4'h1: out_low = 9'h0fb;
              4'h2: out_low = 9'h0ff;
              4'h3: out_low = 9'h102;
              4'h4: out_low = 9'h106;
              4'h5: out_low = 9'h109;
              4'h6: out_low = 9'h10c;
              4'h7: out_low = 9'h110;
              4'h8: out_low = 9'h114;
              4'h9: out_low = 9'h117;
              4'ha: out_low = 9'h11b;
              4'hb: out_low = 9'h11e;
              4'hc: out_low = 9'h122;
              4'hd: out_low = 9'h125;
              4'he: out_low = 9'h129;
              4'hf: out_low = 9'h12c;
              default: out_low = 9'h000;
            endcase
          end
          6'h16: begin
            case (mant[3:0])
              4'h0: out_low = 9'h130;
              4'h1: out_low = 9'h134;
              4'h2: out_low = 9'h137;
              4'h3: out_low = 9'h13b;
              4'h4: out_low = 9'h13e;
              4'h5: out_low = 9'h142;
              4'h6: out_low = 9'h146;
              4'h7: out_low = 9'h149;
              4'h8: out_low = 9'h14d;
              4'h9: out_low = 9'h151;
              4'ha: out_low = 9'h154;
              4'hb: out_low = 9'h158;
              4'hc: out_low = 9'h15c;
              4'hd: out_low = 9'h160;
              4'he: out_low = 9'h163;
              4'hf: out_low = 9'h167;
              default: out_low = 9'h000;
            endcase
          end
          6'h17: begin
            case (mant[3:0])
              4'h0: out_low = 9'h16b;
              4'h1: out_low = 9'h16f;
              4'h2: out_low = 9'h172;
              4'h3: out_low = 9'h176;
              4'h4: out_low = 9'h17a;
              4'h5: out_low = 9'h17e;
              4'h6: out_low = 9'h181;
              4'h7: out_low = 9'h185;
              4'h8: out_low = 9'h189;
              4'h9: out_low = 9'h18d;
              4'ha: out_low = 9'h191;
              4'hb: out_low = 9'h195;
              4'hc: out_low = 9'h199;
              4'hd: out_low = 9'h19c;
              4'he: out_low = 9'h1a0;
              4'hf: out_low = 9'h1a4;
              default: out_low = 9'h000;
            endcase
          end
          6'h18: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1a8;
              4'h1: out_low = 9'h1ac;
              4'h2: out_low = 9'h1b0;
              4'h3: out_low = 9'h1b4;
              4'h4: out_low = 9'h1b8;
              4'h5: out_low = 9'h1bc;
              4'h6: out_low = 9'h1c0;
              4'h7: out_low = 9'h1c4;
              4'h8: out_low = 9'h1c8;
              4'h9: out_low = 9'h1cc;
              4'ha: out_low = 9'h1d0;
              4'hb: out_low = 9'h1d4;
              4'hc: out_low = 9'h1d8;
              4'hd: out_low = 9'h1dc;
              4'he: out_low = 9'h1e0;
              4'hf: out_low = 9'h1e4;
              default: out_low = 9'h000;
            endcase
          end
          6'h19: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1e8;
              4'h1: out_low = 9'h1ec;
              4'h2: out_low = 9'h1f0;
              4'h3: out_low = 9'h1f5;
              4'h4: out_low = 9'h1f9;
              4'h5: out_low = 9'h1fd;
              4'h6: out_low = 9'h001;
              4'h7: out_low = 9'h005;
              4'h8: out_low = 9'h009;
              4'h9: out_low = 9'h00e;
              4'ha: out_low = 9'h012;
              4'hb: out_low = 9'h016;
              4'hc: out_low = 9'h01a;
              4'hd: out_low = 9'h01e;
              4'he: out_low = 9'h023;
              4'hf: out_low = 9'h027;
              default: out_low = 9'h000;
            endcase
          end
          6'h1a: begin
            case (mant[3:0])
              4'h0: out_low = 9'h02b;
              4'h1: out_low = 9'h030;
              4'h2: out_low = 9'h034;
              4'h3: out_low = 9'h038;
              4'h4: out_low = 9'h03c;
              4'h5: out_low = 9'h041;
              4'h6: out_low = 9'h045;
              4'h7: out_low = 9'h049;
              4'h8: out_low = 9'h04e;
              4'h9: out_low = 9'h052;
              4'ha: out_low = 9'h057;
              4'hb: out_low = 9'h05b;
              4'hc: out_low = 9'h05f;
              4'hd: out_low = 9'h064;
              4'he: out_low = 9'h068;
              4'hf: out_low = 9'h06d;
              default: out_low = 9'h000;
            endcase
          end
          6'h1b: begin
            case (mant[3:0])
              4'h0: out_low = 9'h071;
              4'h1: out_low = 9'h076;
              4'h2: out_low = 9'h07a;
              4'h3: out_low = 9'h07f;
              4'h4: out_low = 9'h083;
              4'h5: out_low = 9'h088;
              4'h6: out_low = 9'h08c;
              4'h7: out_low = 9'h091;
              4'h8: out_low = 9'h095;
              4'h9: out_low = 9'h09a;
              4'ha: out_low = 9'h09e;
              4'hb: out_low = 9'h0a3;
              4'hc: out_low = 9'h0a8;
              4'hd: out_low = 9'h0ac;
              4'he: out_low = 9'h0b1;
              4'hf: out_low = 9'h0b5;
              default: out_low = 9'h000;
            endcase
          end
          6'h1c: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0ba;
              4'h1: out_low = 9'h0bf;
              4'h2: out_low = 9'h0c4;
              4'h3: out_low = 9'h0c8;
              4'h4: out_low = 9'h0cd;
              4'h5: out_low = 9'h0d2;
              4'h6: out_low = 9'h0d6;
              4'h7: out_low = 9'h0db;
              4'h8: out_low = 9'h0e0;
              4'h9: out_low = 9'h0e5;
              4'ha: out_low = 9'h0e9;
              4'hb: out_low = 9'h0ee;
              4'hc: out_low = 9'h0f3;
              4'hd: out_low = 9'h0f8;
              4'he: out_low = 9'h0fd;
              4'hf: out_low = 9'h102;
              default: out_low = 9'h000;
            endcase
          end
          6'h1d: begin
            case (mant[3:0])
              4'h0: out_low = 9'h106;
              4'h1: out_low = 9'h10b;
              4'h2: out_low = 9'h110;
              4'h3: out_low = 9'h115;
              4'h4: out_low = 9'h11a;
              4'h5: out_low = 9'h11f;
              4'h6: out_low = 9'h124;
              4'h7: out_low = 9'h129;
              4'h8: out_low = 9'h12e;
              4'h9: out_low = 9'h133;
              4'ha: out_low = 9'h138;
              4'hb: out_low = 9'h13d;
              4'hc: out_low = 9'h142;
              4'hd: out_low = 9'h147;
              4'he: out_low = 9'h14c;
              4'hf: out_low = 9'h151;
              default: out_low = 9'h000;
            endcase
          end
          6'h1e: begin
            case (mant[3:0])
              4'h0: out_low = 9'h156;
              4'h1: out_low = 9'h15b;
              4'h2: out_low = 9'h160;
              4'h3: out_low = 9'h165;
              4'h4: out_low = 9'h16a;
              4'h5: out_low = 9'h170;
              4'h6: out_low = 9'h175;
              4'h7: out_low = 9'h17a;
              4'h8: out_low = 9'h17f;
              4'h9: out_low = 9'h184;
              4'ha: out_low = 9'h18a;
              4'hb: out_low = 9'h18f;
              4'hc: out_low = 9'h194;
              4'hd: out_low = 9'h199;
              4'he: out_low = 9'h19f;
              4'hf: out_low = 9'h1a4;
              default: out_low = 9'h000;
            endcase
          end
          6'h1f: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1a9;
              4'h1: out_low = 9'h1ae;
              4'h2: out_low = 9'h1b4;
              4'h3: out_low = 9'h1b9;
              4'h4: out_low = 9'h1bf;
              4'h5: out_low = 9'h1c4;
              4'h6: out_low = 9'h1c9;
              4'h7: out_low = 9'h1cf;
              4'h8: out_low = 9'h1d4;
              4'h9: out_low = 9'h1da;
              4'ha: out_low = 9'h1df;
              4'hb: out_low = 9'h1e4;
              4'hc: out_low = 9'h1ea;
              4'hd: out_low = 9'h1ef;
              4'he: out_low = 9'h1f5;
              4'hf: out_low = 9'h1fa;
              default: out_low = 9'h000;
            endcase
          end
          6'h20: begin
            case (mant[3:0])
              4'h0: out_low = 9'h000;
              4'h1: out_low = 9'h003;
              4'h2: out_low = 9'h006;
              4'h3: out_low = 9'h008;
              4'h4: out_low = 9'h00b;
              4'h5: out_low = 9'h00e;
              4'h6: out_low = 9'h011;
              4'h7: out_low = 9'h014;
              4'h8: out_low = 9'h016;
              4'h9: out_low = 9'h019;
              4'ha: out_low = 9'h01c;
              4'hb: out_low = 9'h01f;
              4'hc: out_low = 9'h022;
              4'hd: out_low = 9'h025;
              4'he: out_low = 9'h028;
              4'hf: out_low = 9'h02a;
              default: out_low = 9'h000;
            endcase
          end
          6'h21: begin
            case (mant[3:0])
              4'h0: out_low = 9'h02d;
              4'h1: out_low = 9'h030;
              4'h2: out_low = 9'h033;
              4'h3: out_low = 9'h036;
              4'h4: out_low = 9'h039;
              4'h5: out_low = 9'h03c;
              4'h6: out_low = 9'h03f;
              4'h7: out_low = 9'h042;
              4'h8: out_low = 9'h045;
              4'h9: out_low = 9'h048;
              4'ha: out_low = 9'h04b;
              4'hb: out_low = 9'h04e;
              4'hc: out_low = 9'h051;
              4'hd: out_low = 9'h054;
              4'he: out_low = 9'h057;
              4'hf: out_low = 9'h05a;
              default: out_low = 9'h000;
            endcase
          end
          6'h22: begin
            case (mant[3:0])
              4'h0: out_low = 9'h05d;
              4'h1: out_low = 9'h060;
              4'h2: out_low = 9'h063;
              4'h3: out_low = 9'h066;
              4'h4: out_low = 9'h069;
              4'h5: out_low = 9'h06c;
              4'h6: out_low = 9'h06f;
              4'h7: out_low = 9'h072;
              4'h8: out_low = 9'h075;
              4'h9: out_low = 9'h078;
              4'ha: out_low = 9'h07b;
              4'hb: out_low = 9'h07e;
              4'hc: out_low = 9'h082;
              4'hd: out_low = 9'h085;
              4'he: out_low = 9'h088;
              4'hf: out_low = 9'h08b;
              default: out_low = 9'h000;
            endcase
          end
          6'h23: begin
            case (mant[3:0])
              4'h0: out_low = 9'h08e;
              4'h1: out_low = 9'h091;
              4'h2: out_low = 9'h094;
              4'h3: out_low = 9'h098;
              4'h4: out_low = 9'h09b;
              4'h5: out_low = 9'h09e;
              4'h6: out_low = 9'h0a1;
              4'h7: out_low = 9'h0a4;
              4'h8: out_low = 9'h0a8;
              4'h9: out_low = 9'h0ab;
              4'ha: out_low = 9'h0ae;
              4'hb: out_low = 9'h0b1;
              4'hc: out_low = 9'h0b5;
              4'hd: out_low = 9'h0b8;
              4'he: out_low = 9'h0bb;
              4'hf: out_low = 9'h0be;
              default: out_low = 9'h000;
            endcase
          end
          6'h24: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0c2;
              4'h1: out_low = 9'h0c5;
              4'h2: out_low = 9'h0c8;
              4'h3: out_low = 9'h0cc;
              4'h4: out_low = 9'h0cf;
              4'h5: out_low = 9'h0d2;
              4'h6: out_low = 9'h0d6;
              4'h7: out_low = 9'h0d9;
              4'h8: out_low = 9'h0dc;
              4'h9: out_low = 9'h0e0;
              4'ha: out_low = 9'h0e3;
              4'hb: out_low = 9'h0e7;
              4'hc: out_low = 9'h0ea;
              4'hd: out_low = 9'h0ed;
              4'he: out_low = 9'h0f1;
              4'hf: out_low = 9'h0f4;
              default: out_low = 9'h000;
            endcase
          end
          6'h25: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0f8;
              4'h1: out_low = 9'h0fb;
              4'h2: out_low = 9'h0ff;
              4'h3: out_low = 9'h102;
              4'h4: out_low = 9'h106;
              4'h5: out_low = 9'h109;
              4'h6: out_low = 9'h10c;
              4'h7: out_low = 9'h110;
              4'h8: out_low = 9'h114;
              4'h9: out_low = 9'h117;
              4'ha: out_low = 9'h11b;
              4'hb: out_low = 9'h11e;
              4'hc: out_low = 9'h122;
              4'hd: out_low = 9'h125;
              4'he: out_low = 9'h129;
              4'hf: out_low = 9'h12c;
              default: out_low = 9'h000;
            endcase
          end
          6'h26: begin
            case (mant[3:0])
              4'h0: out_low = 9'h130;
              4'h1: out_low = 9'h134;
              4'h2: out_low = 9'h137;
              4'h3: out_low = 9'h13b;
              4'h4: out_low = 9'h13e;
              4'h5: out_low = 9'h142;
              4'h6: out_low = 9'h146;
              4'h7: out_low = 9'h149;
              4'h8: out_low = 9'h14d;
              4'h9: out_low = 9'h151;
              4'ha: out_low = 9'h154;
              4'hb: out_low = 9'h158;
              4'hc: out_low = 9'h15c;
              4'hd: out_low = 9'h160;
              4'he: out_low = 9'h163;
              4'hf: out_low = 9'h167;
              default: out_low = 9'h000;
            endcase
          end
          6'h27: begin
            case (mant[3:0])
              4'h0: out_low = 9'h16b;
              4'h1: out_low = 9'h16f;
              4'h2: out_low = 9'h172;
              4'h3: out_low = 9'h176;
              4'h4: out_low = 9'h17a;
              4'h5: out_low = 9'h17e;
              4'h6: out_low = 9'h181;
              4'h7: out_low = 9'h185;
              4'h8: out_low = 9'h189;
              4'h9: out_low = 9'h18d;
              4'ha: out_low = 9'h191;
              4'hb: out_low = 9'h195;
              4'hc: out_low = 9'h199;
              4'hd: out_low = 9'h19c;
              4'he: out_low = 9'h1a0;
              4'hf: out_low = 9'h1a4;
              default: out_low = 9'h000;
            endcase
          end
          6'h28: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1a8;
              4'h1: out_low = 9'h1ac;
              4'h2: out_low = 9'h1b0;
              4'h3: out_low = 9'h1b4;
              4'h4: out_low = 9'h1b8;
              4'h5: out_low = 9'h1bc;
              4'h6: out_low = 9'h1c0;
              4'h7: out_low = 9'h1c4;
              4'h8: out_low = 9'h1c8;
              4'h9: out_low = 9'h1cc;
              4'ha: out_low = 9'h1d0;
              4'hb: out_low = 9'h1d4;
              4'hc: out_low = 9'h1d8;
              4'hd: out_low = 9'h1dc;
              4'he: out_low = 9'h1e0;
              4'hf: out_low = 9'h1e4;
              default: out_low = 9'h000;
            endcase
          end
          6'h29: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1e8;
              4'h1: out_low = 9'h1ec;
              4'h2: out_low = 9'h1f0;
              4'h3: out_low = 9'h1f5;
              4'h4: out_low = 9'h1f9;
              4'h5: out_low = 9'h1fd;
              4'h6: out_low = 9'h001;
              4'h7: out_low = 9'h005;
              4'h8: out_low = 9'h009;
              4'h9: out_low = 9'h00e;
              4'ha: out_low = 9'h012;
              4'hb: out_low = 9'h016;
              4'hc: out_low = 9'h01a;
              4'hd: out_low = 9'h01e;
              4'he: out_low = 9'h023;
              4'hf: out_low = 9'h027;
              default: out_low = 9'h000;
            endcase
          end
          6'h2a: begin
            case (mant[3:0])
              4'h0: out_low = 9'h02b;
              4'h1: out_low = 9'h030;
              4'h2: out_low = 9'h034;
              4'h3: out_low = 9'h038;
              4'h4: out_low = 9'h03c;
              4'h5: out_low = 9'h041;
              4'h6: out_low = 9'h045;
              4'h7: out_low = 9'h049;
              4'h8: out_low = 9'h04e;
              4'h9: out_low = 9'h052;
              4'ha: out_low = 9'h057;
              4'hb: out_low = 9'h05b;
              4'hc: out_low = 9'h05f;
              4'hd: out_low = 9'h064;
              4'he: out_low = 9'h068;
              4'hf: out_low = 9'h06d;
              default: out_low = 9'h000;
            endcase
          end
          6'h2b: begin
            case (mant[3:0])
              4'h0: out_low = 9'h071;
              4'h1: out_low = 9'h076;
              4'h2: out_low = 9'h07a;
              4'h3: out_low = 9'h07f;
              4'h4: out_low = 9'h083;
              4'h5: out_low = 9'h088;
              4'h6: out_low = 9'h08c;
              4'h7: out_low = 9'h091;
              4'h8: out_low = 9'h095;
              4'h9: out_low = 9'h09a;
              4'ha: out_low = 9'h09e;
              4'hb: out_low = 9'h0a3;
              4'hc: out_low = 9'h0a8;
              4'hd: out_low = 9'h0ac;
              4'he: out_low = 9'h0b1;
              4'hf: out_low = 9'h0b5;
              default: out_low = 9'h000;
            endcase
          end
          6'h2c: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0ba;
              4'h1: out_low = 9'h0bf;
              4'h2: out_low = 9'h0c4;
              4'h3: out_low = 9'h0c8;
              4'h4: out_low = 9'h0cd;
              4'h5: out_low = 9'h0d2;
              4'h6: out_low = 9'h0d6;
              4'h7: out_low = 9'h0db;
              4'h8: out_low = 9'h0e0;
              4'h9: out_low = 9'h0e5;
              4'ha: out_low = 9'h0e9;
              4'hb: out_low = 9'h0ee;
              4'hc: out_low = 9'h0f3;
              4'hd: out_low = 9'h0f8;
              4'he: out_low = 9'h0fd;
              4'hf: out_low = 9'h102;
              default: out_low = 9'h000;
            endcase
          end
          6'h2d: begin
            case (mant[3:0])
              4'h0: out_low = 9'h106;
              4'h1: out_low = 9'h10b;
              4'h2: out_low = 9'h110;
              4'h3: out_low = 9'h115;
              4'h4: out_low = 9'h11a;
              4'h5: out_low = 9'h11f;
              4'h6: out_low = 9'h124;
              4'h7: out_low = 9'h129;
              4'h8: out_low = 9'h12e;
              4'h9: out_low = 9'h133;
              4'ha: out_low = 9'h138;
              4'hb: out_low = 9'h13d;
              4'hc: out_low = 9'h142;
              4'hd: out_low = 9'h147;
              4'he: out_low = 9'h14c;
              4'hf: out_low = 9'h151;
              default: out_low = 9'h000;
            endcase
          end
          6'h2e: begin
            case (mant[3:0])
              4'h0: out_low = 9'h156;
              4'h1: out_low = 9'h15b;
              4'h2: out_low = 9'h160;
              4'h3: out_low = 9'h165;
              4'h4: out_low = 9'h16a;
              4'h5: out_low = 9'h170;
              4'h6: out_low = 9'h175;
              4'h7: out_low = 9'h17a;
              4'h8: out_low = 9'h17f;
              4'h9: out_low = 9'h184;
              4'ha: out_low = 9'h18a;
              4'hb: out_low = 9'h18f;
              4'hc: out_low = 9'h194;
              4'hd: out_low = 9'h199;
              4'he: out_low = 9'h19f;
              4'hf: out_low = 9'h1a4;
              default: out_low = 9'h000;
            endcase
          end
          6'h2f: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1a9;
              4'h1: out_low = 9'h1ae;
              4'h2: out_low = 9'h1b4;
              4'h3: out_low = 9'h1b9;
              4'h4: out_low = 9'h1bf;
              4'h5: out_low = 9'h1c4;
              4'h6: out_low = 9'h1c9;
              4'h7: out_low = 9'h1cf;
              4'h8: out_low = 9'h1d4;
              4'h9: out_low = 9'h1da;
              4'ha: out_low = 9'h1df;
              4'hb: out_low = 9'h1e4;
              4'hc: out_low = 9'h1ea;
              4'hd: out_low = 9'h1ef;
              4'he: out_low = 9'h1f5;
              4'hf: out_low = 9'h1fa;
              default: out_low = 9'h000;
            endcase
          end
          6'h30: begin
            case (mant[3:0])
              4'h0: out_low = 9'h000;
              4'h1: out_low = 9'h003;
              4'h2: out_low = 9'h006;
              4'h3: out_low = 9'h008;
              4'h4: out_low = 9'h00b;
              4'h5: out_low = 9'h00e;
              4'h6: out_low = 9'h011;
              4'h7: out_low = 9'h014;
              4'h8: out_low = 9'h016;
              4'h9: out_low = 9'h019;
              4'ha: out_low = 9'h01c;
              4'hb: out_low = 9'h01f;
              4'hc: out_low = 9'h022;
              4'hd: out_low = 9'h025;
              4'he: out_low = 9'h028;
              4'hf: out_low = 9'h02a;
              default: out_low = 9'h000;
            endcase
          end
          6'h31: begin
            case (mant[3:0])
              4'h0: out_low = 9'h02d;
              4'h1: out_low = 9'h030;
              4'h2: out_low = 9'h033;
              4'h3: out_low = 9'h036;
              4'h4: out_low = 9'h039;
              4'h5: out_low = 9'h03c;
              4'h6: out_low = 9'h03f;
              4'h7: out_low = 9'h042;
              4'h8: out_low = 9'h045;
              4'h9: out_low = 9'h048;
              4'ha: out_low = 9'h04b;
              4'hb: out_low = 9'h04e;
              4'hc: out_low = 9'h051;
              4'hd: out_low = 9'h054;
              4'he: out_low = 9'h057;
              4'hf: out_low = 9'h05a;
              default: out_low = 9'h000;
            endcase
          end
          6'h32: begin
            case (mant[3:0])
              4'h0: out_low = 9'h05d;
              4'h1: out_low = 9'h060;
              4'h2: out_low = 9'h063;
              4'h3: out_low = 9'h066;
              4'h4: out_low = 9'h069;
              4'h5: out_low = 9'h06c;
              4'h6: out_low = 9'h06f;
              4'h7: out_low = 9'h072;
              4'h8: out_low = 9'h075;
              4'h9: out_low = 9'h078;
              4'ha: out_low = 9'h07b;
              4'hb: out_low = 9'h07e;
              4'hc: out_low = 9'h082;
              4'hd: out_low = 9'h085;
              4'he: out_low = 9'h088;
              4'hf: out_low = 9'h08b;
              default: out_low = 9'h000;
            endcase
          end
          6'h33: begin
            case (mant[3:0])
              4'h0: out_low = 9'h08e;
              4'h1: out_low = 9'h091;
              4'h2: out_low = 9'h094;
              4'h3: out_low = 9'h098;
              4'h4: out_low = 9'h09b;
              4'h5: out_low = 9'h09e;
              4'h6: out_low = 9'h0a1;
              4'h7: out_low = 9'h0a4;
              4'h8: out_low = 9'h0a8;
              4'h9: out_low = 9'h0ab;
              4'ha: out_low = 9'h0ae;
              4'hb: out_low = 9'h0b1;
              4'hc: out_low = 9'h0b5;
              4'hd: out_low = 9'h0b8;
              4'he: out_low = 9'h0bb;
              4'hf: out_low = 9'h0be;
              default: out_low = 9'h000;
            endcase
          end
          6'h34: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0c2;
              4'h1: out_low = 9'h0c5;
              4'h2: out_low = 9'h0c8;
              4'h3: out_low = 9'h0cc;
              4'h4: out_low = 9'h0cf;
              4'h5: out_low = 9'h0d2;
              4'h6: out_low = 9'h0d6;
              4'h7: out_low = 9'h0d9;
              4'h8: out_low = 9'h0dc;
              4'h9: out_low = 9'h0e0;
              4'ha: out_low = 9'h0e3;
              4'hb: out_low = 9'h0e7;
              4'hc: out_low = 9'h0ea;
              4'hd: out_low = 9'h0ed;
              4'he: out_low = 9'h0f1;
              4'hf: out_low = 9'h0f4;
              default: out_low = 9'h000;
            endcase
          end
          6'h35: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0f8;
              4'h1: out_low = 9'h0fb;
              4'h2: out_low = 9'h0ff;
              4'h3: out_low = 9'h102;
              4'h4: out_low = 9'h106;
              4'h5: out_low = 9'h109;
              4'h6: out_low = 9'h10c;
              4'h7: out_low = 9'h110;
              4'h8: out_low = 9'h114;
              4'h9: out_low = 9'h117;
              4'ha: out_low = 9'h11b;
              4'hb: out_low = 9'h11e;
              4'hc: out_low = 9'h122;
              4'hd: out_low = 9'h125;
              4'he: out_low = 9'h129;
              4'hf: out_low = 9'h12c;
              default: out_low = 9'h000;
            endcase
          end
          6'h36: begin
            case (mant[3:0])
              4'h0: out_low = 9'h130;
              4'h1: out_low = 9'h134;
              4'h2: out_low = 9'h137;
              4'h3: out_low = 9'h13b;
              4'h4: out_low = 9'h13e;
              4'h5: out_low = 9'h142;
              4'h6: out_low = 9'h146;
              4'h7: out_low = 9'h149;
              4'h8: out_low = 9'h14d;
              4'h9: out_low = 9'h151;
              4'ha: out_low = 9'h154;
              4'hb: out_low = 9'h158;
              4'hc: out_low = 9'h15c;
              4'hd: out_low = 9'h160;
              4'he: out_low = 9'h163;
              4'hf: out_low = 9'h167;
              default: out_low = 9'h000;
            endcase
          end
          6'h37: begin
            case (mant[3:0])
              4'h0: out_low = 9'h16b;
              4'h1: out_low = 9'h16f;
              4'h2: out_low = 9'h172;
              4'h3: out_low = 9'h176;
              4'h4: out_low = 9'h17a;
              4'h5: out_low = 9'h17e;
              4'h6: out_low = 9'h181;
              4'h7: out_low = 9'h185;
              4'h8: out_low = 9'h189;
              4'h9: out_low = 9'h18d;
              4'ha: out_low = 9'h191;
              4'hb: out_low = 9'h195;
              4'hc: out_low = 9'h199;
              4'hd: out_low = 9'h19c;
              4'he: out_low = 9'h1a0;
              4'hf: out_low = 9'h1a4;
              default: out_low = 9'h000;
            endcase
          end
          6'h38: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1a8;
              4'h1: out_low = 9'h1ac;
              4'h2: out_low = 9'h1b0;
              4'h3: out_low = 9'h1b4;
              4'h4: out_low = 9'h1b8;
              4'h5: out_low = 9'h1bc;
              4'h6: out_low = 9'h1c0;
              4'h7: out_low = 9'h1c4;
              4'h8: out_low = 9'h1c8;
              4'h9: out_low = 9'h1cc;
              4'ha: out_low = 9'h1d0;
              4'hb: out_low = 9'h1d4;
              4'hc: out_low = 9'h1d8;
              4'hd: out_low = 9'h1dc;
              4'he: out_low = 9'h1e0;
              4'hf: out_low = 9'h1e4;
              default: out_low = 9'h000;
            endcase
          end
          6'h39: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1e8;
              4'h1: out_low = 9'h1ec;
              4'h2: out_low = 9'h1f0;
              4'h3: out_low = 9'h1f5;
              4'h4: out_low = 9'h1f9;
              4'h5: out_low = 9'h1fd;
              4'h6: out_low = 9'h001;
              4'h7: out_low = 9'h005;
              4'h8: out_low = 9'h009;
              4'h9: out_low = 9'h00e;
              4'ha: out_low = 9'h012;
              4'hb: out_low = 9'h016;
              4'hc: out_low = 9'h01a;
              4'hd: out_low = 9'h01e;
              4'he: out_low = 9'h023;
              4'hf: out_low = 9'h027;
              default: out_low = 9'h000;
            endcase
          end
          6'h3a: begin
            case (mant[3:0])
              4'h0: out_low = 9'h02b;
              4'h1: out_low = 9'h030;
              4'h2: out_low = 9'h034;
              4'h3: out_low = 9'h038;
              4'h4: out_low = 9'h03c;
              4'h5: out_low = 9'h041;
              4'h6: out_low = 9'h045;
              4'h7: out_low = 9'h049;
              4'h8: out_low = 9'h04e;
              4'h9: out_low = 9'h052;
              4'ha: out_low = 9'h057;
              4'hb: out_low = 9'h05b;
              4'hc: out_low = 9'h05f;
              4'hd: out_low = 9'h064;
              4'he: out_low = 9'h068;
              4'hf: out_low = 9'h06d;
              default: out_low = 9'h000;
            endcase
          end
          6'h3b: begin
            case (mant[3:0])
              4'h0: out_low = 9'h071;
              4'h1: out_low = 9'h076;
              4'h2: out_low = 9'h07a;
              4'h3: out_low = 9'h07f;
              4'h4: out_low = 9'h083;
              4'h5: out_low = 9'h088;
              4'h6: out_low = 9'h08c;
              4'h7: out_low = 9'h091;
              4'h8: out_low = 9'h095;
              4'h9: out_low = 9'h09a;
              4'ha: out_low = 9'h09e;
              4'hb: out_low = 9'h0a3;
              4'hc: out_low = 9'h0a8;
              4'hd: out_low = 9'h0ac;
              4'he: out_low = 9'h0b1;
              4'hf: out_low = 9'h0b5;
              default: out_low = 9'h000;
            endcase
          end
          6'h3c: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0ba;
              4'h1: out_low = 9'h0bf;
              4'h2: out_low = 9'h0c4;
              4'h3: out_low = 9'h0c8;
              4'h4: out_low = 9'h0cd;
              4'h5: out_low = 9'h0d2;
              4'h6: out_low = 9'h0d6;
              4'h7: out_low = 9'h0db;
              4'h8: out_low = 9'h0e0;
              4'h9: out_low = 9'h0e5;
              4'ha: out_low = 9'h0e9;
              4'hb: out_low = 9'h0ee;
              4'hc: out_low = 9'h0f3;
              4'hd: out_low = 9'h0f8;
              4'he: out_low = 9'h0fd;
              4'hf: out_low = 9'h102;
              default: out_low = 9'h000;
            endcase
          end
          6'h3d: begin
            case (mant[3:0])
              4'h0: out_low = 9'h106;
              4'h1: out_low = 9'h10b;
              4'h2: out_low = 9'h110;
              4'h3: out_low = 9'h115;
              4'h4: out_low = 9'h11a;
              4'h5: out_low = 9'h11f;
              4'h6: out_low = 9'h124;
              4'h7: out_low = 9'h129;
              4'h8: out_low = 9'h12e;
              4'h9: out_low = 9'h133;
              4'ha: out_low = 9'h138;
              4'hb: out_low = 9'h13d;
              4'hc: out_low = 9'h142;
              4'hd: out_low = 9'h147;
              4'he: out_low = 9'h14c;
              4'hf: out_low = 9'h151;
              default: out_low = 9'h000;
            endcase
          end
          6'h3e: begin
            case (mant[3:0])
              4'h0: out_low = 9'h156;
              4'h1: out_low = 9'h15b;
              4'h2: out_low = 9'h160;
              4'h3: out_low = 9'h165;
              4'h4: out_low = 9'h16a;
              4'h5: out_low = 9'h170;
              4'h6: out_low = 9'h175;
              4'h7: out_low = 9'h17a;
              4'h8: out_low = 9'h17f;
              4'h9: out_low = 9'h184;
              4'ha: out_low = 9'h18a;
              4'hb: out_low = 9'h18f;
              4'hc: out_low = 9'h194;
              4'hd: out_low = 9'h199;
              4'he: out_low = 9'h19f;
              4'hf: out_low = 9'h1a4;
              default: out_low = 9'h000;
            endcase
          end
          6'h3f: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1a9;
              4'h1: out_low = 9'h1ae;
              4'h2: out_low = 9'h1b4;
              4'h3: out_low = 9'h1b9;
              4'h4: out_low = 9'h1bf;
              4'h5: out_low = 9'h1c4;
              4'h6: out_low = 9'h1c9;
              4'h7: out_low = 9'h1cf;
              4'h8: out_low = 9'h1d4;
              4'h9: out_low = 9'h1da;
              4'ha: out_low = 9'h1df;
              4'hb: out_low = 9'h1e4;
              4'hc: out_low = 9'h1ea;
              4'hd: out_low = 9'h1ef;
              4'he: out_low = 9'h1f5;
              4'hf: out_low = 9'h1fa;
              default: out_low = 9'h000;
            endcase
          end
          default: out_low = 9'h000;
        endcase
      end
      6'h12: begin
        case (mant[9:4])
          6'h00: begin
            case (mant[3:0])
              4'h0: out_low = 9'h000;
              4'h1: out_low = 9'h006;
              4'h2: out_low = 9'h00b;
              4'h3: out_low = 9'h011;
              4'h4: out_low = 9'h016;
              4'h5: out_low = 9'h01c;
              4'h6: out_low = 9'h022;
              4'h7: out_low = 9'h028;
              4'h8: out_low = 9'h02d;
              4'h9: out_low = 9'h033;
              4'ha: out_low = 9'h039;
              4'hb: out_low = 9'h03f;
              4'hc: out_low = 9'h045;
              4'hd: out_low = 9'h04b;
              4'he: out_low = 9'h051;
              4'hf: out_low = 9'h057;
              default: out_low = 9'h000;
            endcase
          end
          6'h01: begin
            case (mant[3:0])
              4'h0: out_low = 9'h05d;
              4'h1: out_low = 9'h063;
              4'h2: out_low = 9'h069;
              4'h3: out_low = 9'h06f;
              4'h4: out_low = 9'h075;
              4'h5: out_low = 9'h07b;
              4'h6: out_low = 9'h082;
              4'h7: out_low = 9'h088;
              4'h8: out_low = 9'h08e;
              4'h9: out_low = 9'h094;
              4'ha: out_low = 9'h09b;
              4'hb: out_low = 9'h0a1;
              4'hc: out_low = 9'h0a8;
              4'hd: out_low = 9'h0ae;
              4'he: out_low = 9'h0b5;
              4'hf: out_low = 9'h0bb;
              default: out_low = 9'h000;
            endcase
          end
          6'h02: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0c2;
              4'h1: out_low = 9'h0c8;
              4'h2: out_low = 9'h0cf;
              4'h3: out_low = 9'h0d6;
              4'h4: out_low = 9'h0dc;
              4'h5: out_low = 9'h0e3;
              4'h6: out_low = 9'h0ea;
              4'h7: out_low = 9'h0f1;
              4'h8: out_low = 9'h0f8;
              4'h9: out_low = 9'h0ff;
              4'ha: out_low = 9'h106;
              4'hb: out_low = 9'h10c;
              4'hc: out_low = 9'h114;
              4'hd: out_low = 9'h11b;
              4'he: out_low = 9'h122;
              4'hf: out_low = 9'h129;
              default: out_low = 9'h000;
            endcase
          end
          6'h03: begin
            case (mant[3:0])
              4'h0: out_low = 9'h130;
              4'h1: out_low = 9'h137;
              4'h2: out_low = 9'h13e;
              4'h3: out_low = 9'h146;
              4'h4: out_low = 9'h14d;
              4'h5: out_low = 9'h154;
              4'h6: out_low = 9'h15c;
              4'h7: out_low = 9'h163;
              4'h8: out_low = 9'h16b;
              4'h9: out_low = 9'h172;
              4'ha: out_low = 9'h17a;
              4'hb: out_low = 9'h181;
              4'hc: out_low = 9'h189;
              4'hd: out_low = 9'h191;
              4'he: out_low = 9'h199;
              4'hf: out_low = 9'h1a0;
              default: out_low = 9'h000;
            endcase
          end
          6'h04: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1a8;
              4'h1: out_low = 9'h1b0;
              4'h2: out_low = 9'h1b8;
              4'h3: out_low = 9'h1c0;
              4'h4: out_low = 9'h1c8;
              4'h5: out_low = 9'h1d0;
              4'h6: out_low = 9'h1d8;
              4'h7: out_low = 9'h1e0;
              4'h8: out_low = 9'h1e8;
              4'h9: out_low = 9'h1f0;
              4'ha: out_low = 9'h1f9;
              4'hb: out_low = 9'h001;
              4'hc: out_low = 9'h009;
              4'hd: out_low = 9'h012;
              4'he: out_low = 9'h01a;
              4'hf: out_low = 9'h023;
              default: out_low = 9'h000;
            endcase
          end
          6'h05: begin
            case (mant[3:0])
              4'h0: out_low = 9'h02b;
              4'h1: out_low = 9'h034;
              4'h2: out_low = 9'h03c;
              4'h3: out_low = 9'h045;
              4'h4: out_low = 9'h04e;
              4'h5: out_low = 9'h057;
              4'h6: out_low = 9'h05f;
              4'h7: out_low = 9'h068;
              4'h8: out_low = 9'h071;
              4'h9: out_low = 9'h07a;
              4'ha: out_low = 9'h083;
              4'hb: out_low = 9'h08c;
              4'hc: out_low = 9'h095;
              4'hd: out_low = 9'h09e;
              4'he: out_low = 9'h0a8;
              4'hf: out_low = 9'h0b1;
              default: out_low = 9'h000;
            endcase
          end
          6'h06: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0ba;
              4'h1: out_low = 9'h0c4;
              4'h2: out_low = 9'h0cd;
              4'h3: out_low = 9'h0d6;
              4'h4: out_low = 9'h0e0;
              4'h5: out_low = 9'h0e9;
              4'h6: out_low = 9'h0f3;
              4'h7: out_low = 9'h0fd;
              4'h8: out_low = 9'h106;
              4'h9: out_low = 9'h110;
              4'ha: out_low = 9'h11a;
              4'hb: out_low = 9'h124;
              4'hc: out_low = 9'h12e;
              4'hd: out_low = 9'h138;
              4'he: out_low = 9'h142;
              4'hf: out_low = 9'h14c;
              default: out_low = 9'h000;
            endcase
          end
          6'h07: begin
            case (mant[3:0])
              4'h0: out_low = 9'h156;
              4'h1: out_low = 9'h160;
              4'h2: out_low = 9'h16a;
              4'h3: out_low = 9'h175;
              4'h4: out_low = 9'h17f;
              4'h5: out_low = 9'h18a;
              4'h6: out_low = 9'h194;
              4'h7: out_low = 9'h19f;
              4'h8: out_low = 9'h1a9;
              4'h9: out_low = 9'h1b4;
              4'ha: out_low = 9'h1bf;
              4'hb: out_low = 9'h1c9;
              4'hc: out_low = 9'h1d4;
              4'hd: out_low = 9'h1df;
              4'he: out_low = 9'h1ea;
              4'hf: out_low = 9'h1f5;
              default: out_low = 9'h000;
            endcase
          end
          6'h08: begin
            case (mant[3:0])
              4'h0: out_low = 9'h000;
              4'h1: out_low = 9'h006;
              4'h2: out_low = 9'h00b;
              4'h3: out_low = 9'h011;
              4'h4: out_low = 9'h016;
              4'h5: out_low = 9'h01c;
              4'h6: out_low = 9'h022;
              4'h7: out_low = 9'h028;
              4'h8: out_low = 9'h02d;
              4'h9: out_low = 9'h033;
              4'ha: out_low = 9'h039;
              4'hb: out_low = 9'h03f;
              4'hc: out_low = 9'h045;
              4'hd: out_low = 9'h04b;
              4'he: out_low = 9'h051;
              4'hf: out_low = 9'h057;
              default: out_low = 9'h000;
            endcase
          end
          6'h09: begin
            case (mant[3:0])
              4'h0: out_low = 9'h05d;
              4'h1: out_low = 9'h063;
              4'h2: out_low = 9'h069;
              4'h3: out_low = 9'h06f;
              4'h4: out_low = 9'h075;
              4'h5: out_low = 9'h07b;
              4'h6: out_low = 9'h082;
              4'h7: out_low = 9'h088;
              4'h8: out_low = 9'h08e;
              4'h9: out_low = 9'h094;
              4'ha: out_low = 9'h09b;
              4'hb: out_low = 9'h0a1;
              4'hc: out_low = 9'h0a8;
              4'hd: out_low = 9'h0ae;
              4'he: out_low = 9'h0b5;
              4'hf: out_low = 9'h0bb;
              default: out_low = 9'h000;
            endcase
          end
          6'h0a: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0c2;
              4'h1: out_low = 9'h0c8;
              4'h2: out_low = 9'h0cf;
              4'h3: out_low = 9'h0d6;
              4'h4: out_low = 9'h0dc;
              4'h5: out_low = 9'h0e3;
              4'h6: out_low = 9'h0ea;
              4'h7: out_low = 9'h0f1;
              4'h8: out_low = 9'h0f8;
              4'h9: out_low = 9'h0ff;
              4'ha: out_low = 9'h106;
              4'hb: out_low = 9'h10c;
              4'hc: out_low = 9'h114;
              4'hd: out_low = 9'h11b;
              4'he: out_low = 9'h122;
              4'hf: out_low = 9'h129;
              default: out_low = 9'h000;
            endcase
          end
          6'h0b: begin
            case (mant[3:0])
              4'h0: out_low = 9'h130;
              4'h1: out_low = 9'h137;
              4'h2: out_low = 9'h13e;
              4'h3: out_low = 9'h146;
              4'h4: out_low = 9'h14d;
              4'h5: out_low = 9'h154;
              4'h6: out_low = 9'h15c;
              4'h7: out_low = 9'h163;
              4'h8: out_low = 9'h16b;
              4'h9: out_low = 9'h172;
              4'ha: out_low = 9'h17a;
              4'hb: out_low = 9'h181;
              4'hc: out_low = 9'h189;
              4'hd: out_low = 9'h191;
              4'he: out_low = 9'h199;
              4'hf: out_low = 9'h1a0;
              default: out_low = 9'h000;
            endcase
          end
          6'h0c: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1a8;
              4'h1: out_low = 9'h1b0;
              4'h2: out_low = 9'h1b8;
              4'h3: out_low = 9'h1c0;
              4'h4: out_low = 9'h1c8;
              4'h5: out_low = 9'h1d0;
              4'h6: out_low = 9'h1d8;
              4'h7: out_low = 9'h1e0;
              4'h8: out_low = 9'h1e8;
              4'h9: out_low = 9'h1f0;
              4'ha: out_low = 9'h1f9;
              4'hb: out_low = 9'h001;
              4'hc: out_low = 9'h009;
              4'hd: out_low = 9'h012;
              4'he: out_low = 9'h01a;
              4'hf: out_low = 9'h023;
              default: out_low = 9'h000;
            endcase
          end
          6'h0d: begin
            case (mant[3:0])
              4'h0: out_low = 9'h02b;
              4'h1: out_low = 9'h034;
              4'h2: out_low = 9'h03c;
              4'h3: out_low = 9'h045;
              4'h4: out_low = 9'h04e;
              4'h5: out_low = 9'h057;
              4'h6: out_low = 9'h05f;
              4'h7: out_low = 9'h068;
              4'h8: out_low = 9'h071;
              4'h9: out_low = 9'h07a;
              4'ha: out_low = 9'h083;
              4'hb: out_low = 9'h08c;
              4'hc: out_low = 9'h095;
              4'hd: out_low = 9'h09e;
              4'he: out_low = 9'h0a8;
              4'hf: out_low = 9'h0b1;
              default: out_low = 9'h000;
            endcase
          end
          6'h0e: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0ba;
              4'h1: out_low = 9'h0c4;
              4'h2: out_low = 9'h0cd;
              4'h3: out_low = 9'h0d6;
              4'h4: out_low = 9'h0e0;
              4'h5: out_low = 9'h0e9;
              4'h6: out_low = 9'h0f3;
              4'h7: out_low = 9'h0fd;
              4'h8: out_low = 9'h106;
              4'h9: out_low = 9'h110;
              4'ha: out_low = 9'h11a;
              4'hb: out_low = 9'h124;
              4'hc: out_low = 9'h12e;
              4'hd: out_low = 9'h138;
              4'he: out_low = 9'h142;
              4'hf: out_low = 9'h14c;
              default: out_low = 9'h000;
            endcase
          end
          6'h0f: begin
            case (mant[3:0])
              4'h0: out_low = 9'h156;
              4'h1: out_low = 9'h160;
              4'h2: out_low = 9'h16a;
              4'h3: out_low = 9'h175;
              4'h4: out_low = 9'h17f;
              4'h5: out_low = 9'h18a;
              4'h6: out_low = 9'h194;
              4'h7: out_low = 9'h19f;
              4'h8: out_low = 9'h1a9;
              4'h9: out_low = 9'h1b4;
              4'ha: out_low = 9'h1bf;
              4'hb: out_low = 9'h1c9;
              4'hc: out_low = 9'h1d4;
              4'hd: out_low = 9'h1df;
              4'he: out_low = 9'h1ea;
              4'hf: out_low = 9'h1f5;
              default: out_low = 9'h000;
            endcase
          end
          6'h10: begin
            case (mant[3:0])
              4'h0: out_low = 9'h000;
              4'h1: out_low = 9'h006;
              4'h2: out_low = 9'h00b;
              4'h3: out_low = 9'h011;
              4'h4: out_low = 9'h016;
              4'h5: out_low = 9'h01c;
              4'h6: out_low = 9'h022;
              4'h7: out_low = 9'h028;
              4'h8: out_low = 9'h02d;
              4'h9: out_low = 9'h033;
              4'ha: out_low = 9'h039;
              4'hb: out_low = 9'h03f;
              4'hc: out_low = 9'h045;
              4'hd: out_low = 9'h04b;
              4'he: out_low = 9'h051;
              4'hf: out_low = 9'h057;
              default: out_low = 9'h000;
            endcase
          end
          6'h11: begin
            case (mant[3:0])
              4'h0: out_low = 9'h05d;
              4'h1: out_low = 9'h063;
              4'h2: out_low = 9'h069;
              4'h3: out_low = 9'h06f;
              4'h4: out_low = 9'h075;
              4'h5: out_low = 9'h07b;
              4'h6: out_low = 9'h082;
              4'h7: out_low = 9'h088;
              4'h8: out_low = 9'h08e;
              4'h9: out_low = 9'h094;
              4'ha: out_low = 9'h09b;
              4'hb: out_low = 9'h0a1;
              4'hc: out_low = 9'h0a8;
              4'hd: out_low = 9'h0ae;
              4'he: out_low = 9'h0b5;
              4'hf: out_low = 9'h0bb;
              default: out_low = 9'h000;
            endcase
          end
          6'h12: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0c2;
              4'h1: out_low = 9'h0c8;
              4'h2: out_low = 9'h0cf;
              4'h3: out_low = 9'h0d6;
              4'h4: out_low = 9'h0dc;
              4'h5: out_low = 9'h0e3;
              4'h6: out_low = 9'h0ea;
              4'h7: out_low = 9'h0f1;
              4'h8: out_low = 9'h0f8;
              4'h9: out_low = 9'h0ff;
              4'ha: out_low = 9'h106;
              4'hb: out_low = 9'h10c;
              4'hc: out_low = 9'h114;
              4'hd: out_low = 9'h11b;
              4'he: out_low = 9'h122;
              4'hf: out_low = 9'h129;
              default: out_low = 9'h000;
            endcase
          end
          6'h13: begin
            case (mant[3:0])
              4'h0: out_low = 9'h130;
              4'h1: out_low = 9'h137;
              4'h2: out_low = 9'h13e;
              4'h3: out_low = 9'h146;
              4'h4: out_low = 9'h14d;
              4'h5: out_low = 9'h154;
              4'h6: out_low = 9'h15c;
              4'h7: out_low = 9'h163;
              4'h8: out_low = 9'h16b;
              4'h9: out_low = 9'h172;
              4'ha: out_low = 9'h17a;
              4'hb: out_low = 9'h181;
              4'hc: out_low = 9'h189;
              4'hd: out_low = 9'h191;
              4'he: out_low = 9'h199;
              4'hf: out_low = 9'h1a0;
              default: out_low = 9'h000;
            endcase
          end
          6'h14: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1a8;
              4'h1: out_low = 9'h1b0;
              4'h2: out_low = 9'h1b8;
              4'h3: out_low = 9'h1c0;
              4'h4: out_low = 9'h1c8;
              4'h5: out_low = 9'h1d0;
              4'h6: out_low = 9'h1d8;
              4'h7: out_low = 9'h1e0;
              4'h8: out_low = 9'h1e8;
              4'h9: out_low = 9'h1f0;
              4'ha: out_low = 9'h1f9;
              4'hb: out_low = 9'h001;
              4'hc: out_low = 9'h009;
              4'hd: out_low = 9'h012;
              4'he: out_low = 9'h01a;
              4'hf: out_low = 9'h023;
              default: out_low = 9'h000;
            endcase
          end
          6'h15: begin
            case (mant[3:0])
              4'h0: out_low = 9'h02b;
              4'h1: out_low = 9'h034;
              4'h2: out_low = 9'h03c;
              4'h3: out_low = 9'h045;
              4'h4: out_low = 9'h04e;
              4'h5: out_low = 9'h057;
              4'h6: out_low = 9'h05f;
              4'h7: out_low = 9'h068;
              4'h8: out_low = 9'h071;
              4'h9: out_low = 9'h07a;
              4'ha: out_low = 9'h083;
              4'hb: out_low = 9'h08c;
              4'hc: out_low = 9'h095;
              4'hd: out_low = 9'h09e;
              4'he: out_low = 9'h0a8;
              4'hf: out_low = 9'h0b1;
              default: out_low = 9'h000;
            endcase
          end
          6'h16: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0ba;
              4'h1: out_low = 9'h0c4;
              4'h2: out_low = 9'h0cd;
              4'h3: out_low = 9'h0d6;
              4'h4: out_low = 9'h0e0;
              4'h5: out_low = 9'h0e9;
              4'h6: out_low = 9'h0f3;
              4'h7: out_low = 9'h0fd;
              4'h8: out_low = 9'h106;
              4'h9: out_low = 9'h110;
              4'ha: out_low = 9'h11a;
              4'hb: out_low = 9'h124;
              4'hc: out_low = 9'h12e;
              4'hd: out_low = 9'h138;
              4'he: out_low = 9'h142;
              4'hf: out_low = 9'h14c;
              default: out_low = 9'h000;
            endcase
          end
          6'h17: begin
            case (mant[3:0])
              4'h0: out_low = 9'h156;
              4'h1: out_low = 9'h160;
              4'h2: out_low = 9'h16a;
              4'h3: out_low = 9'h175;
              4'h4: out_low = 9'h17f;
              4'h5: out_low = 9'h18a;
              4'h6: out_low = 9'h194;
              4'h7: out_low = 9'h19f;
              4'h8: out_low = 9'h1a9;
              4'h9: out_low = 9'h1b4;
              4'ha: out_low = 9'h1bf;
              4'hb: out_low = 9'h1c9;
              4'hc: out_low = 9'h1d4;
              4'hd: out_low = 9'h1df;
              4'he: out_low = 9'h1ea;
              4'hf: out_low = 9'h1f5;
              default: out_low = 9'h000;
            endcase
          end
          6'h18: begin
            case (mant[3:0])
              4'h0: out_low = 9'h000;
              4'h1: out_low = 9'h006;
              4'h2: out_low = 9'h00b;
              4'h3: out_low = 9'h011;
              4'h4: out_low = 9'h016;
              4'h5: out_low = 9'h01c;
              4'h6: out_low = 9'h022;
              4'h7: out_low = 9'h028;
              4'h8: out_low = 9'h02d;
              4'h9: out_low = 9'h033;
              4'ha: out_low = 9'h039;
              4'hb: out_low = 9'h03f;
              4'hc: out_low = 9'h045;
              4'hd: out_low = 9'h04b;
              4'he: out_low = 9'h051;
              4'hf: out_low = 9'h057;
              default: out_low = 9'h000;
            endcase
          end
          6'h19: begin
            case (mant[3:0])
              4'h0: out_low = 9'h05d;
              4'h1: out_low = 9'h063;
              4'h2: out_low = 9'h069;
              4'h3: out_low = 9'h06f;
              4'h4: out_low = 9'h075;
              4'h5: out_low = 9'h07b;
              4'h6: out_low = 9'h082;
              4'h7: out_low = 9'h088;
              4'h8: out_low = 9'h08e;
              4'h9: out_low = 9'h094;
              4'ha: out_low = 9'h09b;
              4'hb: out_low = 9'h0a1;
              4'hc: out_low = 9'h0a8;
              4'hd: out_low = 9'h0ae;
              4'he: out_low = 9'h0b5;
              4'hf: out_low = 9'h0bb;
              default: out_low = 9'h000;
            endcase
          end
          6'h1a: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0c2;
              4'h1: out_low = 9'h0c8;
              4'h2: out_low = 9'h0cf;
              4'h3: out_low = 9'h0d6;
              4'h4: out_low = 9'h0dc;
              4'h5: out_low = 9'h0e3;
              4'h6: out_low = 9'h0ea;
              4'h7: out_low = 9'h0f1;
              4'h8: out_low = 9'h0f8;
              4'h9: out_low = 9'h0ff;
              4'ha: out_low = 9'h106;
              4'hb: out_low = 9'h10c;
              4'hc: out_low = 9'h114;
              4'hd: out_low = 9'h11b;
              4'he: out_low = 9'h122;
              4'hf: out_low = 9'h129;
              default: out_low = 9'h000;
            endcase
          end
          6'h1b: begin
            case (mant[3:0])
              4'h0: out_low = 9'h130;
              4'h1: out_low = 9'h137;
              4'h2: out_low = 9'h13e;
              4'h3: out_low = 9'h146;
              4'h4: out_low = 9'h14d;
              4'h5: out_low = 9'h154;
              4'h6: out_low = 9'h15c;
              4'h7: out_low = 9'h163;
              4'h8: out_low = 9'h16b;
              4'h9: out_low = 9'h172;
              4'ha: out_low = 9'h17a;
              4'hb: out_low = 9'h181;
              4'hc: out_low = 9'h189;
              4'hd: out_low = 9'h191;
              4'he: out_low = 9'h199;
              4'hf: out_low = 9'h1a0;
              default: out_low = 9'h000;
            endcase
          end
          6'h1c: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1a8;
              4'h1: out_low = 9'h1b0;
              4'h2: out_low = 9'h1b8;
              4'h3: out_low = 9'h1c0;
              4'h4: out_low = 9'h1c8;
              4'h5: out_low = 9'h1d0;
              4'h6: out_low = 9'h1d8;
              4'h7: out_low = 9'h1e0;
              4'h8: out_low = 9'h1e8;
              4'h9: out_low = 9'h1f0;
              4'ha: out_low = 9'h1f9;
              4'hb: out_low = 9'h001;
              4'hc: out_low = 9'h009;
              4'hd: out_low = 9'h012;
              4'he: out_low = 9'h01a;
              4'hf: out_low = 9'h023;
              default: out_low = 9'h000;
            endcase
          end
          6'h1d: begin
            case (mant[3:0])
              4'h0: out_low = 9'h02b;
              4'h1: out_low = 9'h034;
              4'h2: out_low = 9'h03c;
              4'h3: out_low = 9'h045;
              4'h4: out_low = 9'h04e;
              4'h5: out_low = 9'h057;
              4'h6: out_low = 9'h05f;
              4'h7: out_low = 9'h068;
              4'h8: out_low = 9'h071;
              4'h9: out_low = 9'h07a;
              4'ha: out_low = 9'h083;
              4'hb: out_low = 9'h08c;
              4'hc: out_low = 9'h095;
              4'hd: out_low = 9'h09e;
              4'he: out_low = 9'h0a8;
              4'hf: out_low = 9'h0b1;
              default: out_low = 9'h000;
            endcase
          end
          6'h1e: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0ba;
              4'h1: out_low = 9'h0c4;
              4'h2: out_low = 9'h0cd;
              4'h3: out_low = 9'h0d6;
              4'h4: out_low = 9'h0e0;
              4'h5: out_low = 9'h0e9;
              4'h6: out_low = 9'h0f3;
              4'h7: out_low = 9'h0fd;
              4'h8: out_low = 9'h106;
              4'h9: out_low = 9'h110;
              4'ha: out_low = 9'h11a;
              4'hb: out_low = 9'h124;
              4'hc: out_low = 9'h12e;
              4'hd: out_low = 9'h138;
              4'he: out_low = 9'h142;
              4'hf: out_low = 9'h14c;
              default: out_low = 9'h000;
            endcase
          end
          6'h1f: begin
            case (mant[3:0])
              4'h0: out_low = 9'h156;
              4'h1: out_low = 9'h160;
              4'h2: out_low = 9'h16a;
              4'h3: out_low = 9'h175;
              4'h4: out_low = 9'h17f;
              4'h5: out_low = 9'h18a;
              4'h6: out_low = 9'h194;
              4'h7: out_low = 9'h19f;
              4'h8: out_low = 9'h1a9;
              4'h9: out_low = 9'h1b4;
              4'ha: out_low = 9'h1bf;
              4'hb: out_low = 9'h1c9;
              4'hc: out_low = 9'h1d4;
              4'hd: out_low = 9'h1df;
              4'he: out_low = 9'h1ea;
              4'hf: out_low = 9'h1f5;
              default: out_low = 9'h000;
            endcase
          end
          6'h20: begin
            case (mant[3:0])
              4'h0: out_low = 9'h000;
              4'h1: out_low = 9'h006;
              4'h2: out_low = 9'h00b;
              4'h3: out_low = 9'h011;
              4'h4: out_low = 9'h016;
              4'h5: out_low = 9'h01c;
              4'h6: out_low = 9'h022;
              4'h7: out_low = 9'h028;
              4'h8: out_low = 9'h02d;
              4'h9: out_low = 9'h033;
              4'ha: out_low = 9'h039;
              4'hb: out_low = 9'h03f;
              4'hc: out_low = 9'h045;
              4'hd: out_low = 9'h04b;
              4'he: out_low = 9'h051;
              4'hf: out_low = 9'h057;
              default: out_low = 9'h000;
            endcase
          end
          6'h21: begin
            case (mant[3:0])
              4'h0: out_low = 9'h05d;
              4'h1: out_low = 9'h063;
              4'h2: out_low = 9'h069;
              4'h3: out_low = 9'h06f;
              4'h4: out_low = 9'h075;
              4'h5: out_low = 9'h07b;
              4'h6: out_low = 9'h082;
              4'h7: out_low = 9'h088;
              4'h8: out_low = 9'h08e;
              4'h9: out_low = 9'h094;
              4'ha: out_low = 9'h09b;
              4'hb: out_low = 9'h0a1;
              4'hc: out_low = 9'h0a8;
              4'hd: out_low = 9'h0ae;
              4'he: out_low = 9'h0b5;
              4'hf: out_low = 9'h0bb;
              default: out_low = 9'h000;
            endcase
          end
          6'h22: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0c2;
              4'h1: out_low = 9'h0c8;
              4'h2: out_low = 9'h0cf;
              4'h3: out_low = 9'h0d6;
              4'h4: out_low = 9'h0dc;
              4'h5: out_low = 9'h0e3;
              4'h6: out_low = 9'h0ea;
              4'h7: out_low = 9'h0f1;
              4'h8: out_low = 9'h0f8;
              4'h9: out_low = 9'h0ff;
              4'ha: out_low = 9'h106;
              4'hb: out_low = 9'h10c;
              4'hc: out_low = 9'h114;
              4'hd: out_low = 9'h11b;
              4'he: out_low = 9'h122;
              4'hf: out_low = 9'h129;
              default: out_low = 9'h000;
            endcase
          end
          6'h23: begin
            case (mant[3:0])
              4'h0: out_low = 9'h130;
              4'h1: out_low = 9'h137;
              4'h2: out_low = 9'h13e;
              4'h3: out_low = 9'h146;
              4'h4: out_low = 9'h14d;
              4'h5: out_low = 9'h154;
              4'h6: out_low = 9'h15c;
              4'h7: out_low = 9'h163;
              4'h8: out_low = 9'h16b;
              4'h9: out_low = 9'h172;
              4'ha: out_low = 9'h17a;
              4'hb: out_low = 9'h181;
              4'hc: out_low = 9'h189;
              4'hd: out_low = 9'h191;
              4'he: out_low = 9'h199;
              4'hf: out_low = 9'h1a0;
              default: out_low = 9'h000;
            endcase
          end
          6'h24: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1a8;
              4'h1: out_low = 9'h1b0;
              4'h2: out_low = 9'h1b8;
              4'h3: out_low = 9'h1c0;
              4'h4: out_low = 9'h1c8;
              4'h5: out_low = 9'h1d0;
              4'h6: out_low = 9'h1d8;
              4'h7: out_low = 9'h1e0;
              4'h8: out_low = 9'h1e8;
              4'h9: out_low = 9'h1f0;
              4'ha: out_low = 9'h1f9;
              4'hb: out_low = 9'h001;
              4'hc: out_low = 9'h009;
              4'hd: out_low = 9'h012;
              4'he: out_low = 9'h01a;
              4'hf: out_low = 9'h023;
              default: out_low = 9'h000;
            endcase
          end
          6'h25: begin
            case (mant[3:0])
              4'h0: out_low = 9'h02b;
              4'h1: out_low = 9'h034;
              4'h2: out_low = 9'h03c;
              4'h3: out_low = 9'h045;
              4'h4: out_low = 9'h04e;
              4'h5: out_low = 9'h057;
              4'h6: out_low = 9'h05f;
              4'h7: out_low = 9'h068;
              4'h8: out_low = 9'h071;
              4'h9: out_low = 9'h07a;
              4'ha: out_low = 9'h083;
              4'hb: out_low = 9'h08c;
              4'hc: out_low = 9'h095;
              4'hd: out_low = 9'h09e;
              4'he: out_low = 9'h0a8;
              4'hf: out_low = 9'h0b1;
              default: out_low = 9'h000;
            endcase
          end
          6'h26: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0ba;
              4'h1: out_low = 9'h0c4;
              4'h2: out_low = 9'h0cd;
              4'h3: out_low = 9'h0d6;
              4'h4: out_low = 9'h0e0;
              4'h5: out_low = 9'h0e9;
              4'h6: out_low = 9'h0f3;
              4'h7: out_low = 9'h0fd;
              4'h8: out_low = 9'h106;
              4'h9: out_low = 9'h110;
              4'ha: out_low = 9'h11a;
              4'hb: out_low = 9'h124;
              4'hc: out_low = 9'h12e;
              4'hd: out_low = 9'h138;
              4'he: out_low = 9'h142;
              4'hf: out_low = 9'h14c;
              default: out_low = 9'h000;
            endcase
          end
          6'h27: begin
            case (mant[3:0])
              4'h0: out_low = 9'h156;
              4'h1: out_low = 9'h160;
              4'h2: out_low = 9'h16a;
              4'h3: out_low = 9'h175;
              4'h4: out_low = 9'h17f;
              4'h5: out_low = 9'h18a;
              4'h6: out_low = 9'h194;
              4'h7: out_low = 9'h19f;
              4'h8: out_low = 9'h1a9;
              4'h9: out_low = 9'h1b4;
              4'ha: out_low = 9'h1bf;
              4'hb: out_low = 9'h1c9;
              4'hc: out_low = 9'h1d4;
              4'hd: out_low = 9'h1df;
              4'he: out_low = 9'h1ea;
              4'hf: out_low = 9'h1f5;
              default: out_low = 9'h000;
            endcase
          end
          6'h28: begin
            case (mant[3:0])
              4'h0: out_low = 9'h000;
              4'h1: out_low = 9'h006;
              4'h2: out_low = 9'h00b;
              4'h3: out_low = 9'h011;
              4'h4: out_low = 9'h016;
              4'h5: out_low = 9'h01c;
              4'h6: out_low = 9'h022;
              4'h7: out_low = 9'h028;
              4'h8: out_low = 9'h02d;
              4'h9: out_low = 9'h033;
              4'ha: out_low = 9'h039;
              4'hb: out_low = 9'h03f;
              4'hc: out_low = 9'h045;
              4'hd: out_low = 9'h04b;
              4'he: out_low = 9'h051;
              4'hf: out_low = 9'h057;
              default: out_low = 9'h000;
            endcase
          end
          6'h29: begin
            case (mant[3:0])
              4'h0: out_low = 9'h05d;
              4'h1: out_low = 9'h063;
              4'h2: out_low = 9'h069;
              4'h3: out_low = 9'h06f;
              4'h4: out_low = 9'h075;
              4'h5: out_low = 9'h07b;
              4'h6: out_low = 9'h082;
              4'h7: out_low = 9'h088;
              4'h8: out_low = 9'h08e;
              4'h9: out_low = 9'h094;
              4'ha: out_low = 9'h09b;
              4'hb: out_low = 9'h0a1;
              4'hc: out_low = 9'h0a8;
              4'hd: out_low = 9'h0ae;
              4'he: out_low = 9'h0b5;
              4'hf: out_low = 9'h0bb;
              default: out_low = 9'h000;
            endcase
          end
          6'h2a: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0c2;
              4'h1: out_low = 9'h0c8;
              4'h2: out_low = 9'h0cf;
              4'h3: out_low = 9'h0d6;
              4'h4: out_low = 9'h0dc;
              4'h5: out_low = 9'h0e3;
              4'h6: out_low = 9'h0ea;
              4'h7: out_low = 9'h0f1;
              4'h8: out_low = 9'h0f8;
              4'h9: out_low = 9'h0ff;
              4'ha: out_low = 9'h106;
              4'hb: out_low = 9'h10c;
              4'hc: out_low = 9'h114;
              4'hd: out_low = 9'h11b;
              4'he: out_low = 9'h122;
              4'hf: out_low = 9'h129;
              default: out_low = 9'h000;
            endcase
          end
          6'h2b: begin
            case (mant[3:0])
              4'h0: out_low = 9'h130;
              4'h1: out_low = 9'h137;
              4'h2: out_low = 9'h13e;
              4'h3: out_low = 9'h146;
              4'h4: out_low = 9'h14d;
              4'h5: out_low = 9'h154;
              4'h6: out_low = 9'h15c;
              4'h7: out_low = 9'h163;
              4'h8: out_low = 9'h16b;
              4'h9: out_low = 9'h172;
              4'ha: out_low = 9'h17a;
              4'hb: out_low = 9'h181;
              4'hc: out_low = 9'h189;
              4'hd: out_low = 9'h191;
              4'he: out_low = 9'h199;
              4'hf: out_low = 9'h1a0;
              default: out_low = 9'h000;
            endcase
          end
          6'h2c: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1a8;
              4'h1: out_low = 9'h1b0;
              4'h2: out_low = 9'h1b8;
              4'h3: out_low = 9'h1c0;
              4'h4: out_low = 9'h1c8;
              4'h5: out_low = 9'h1d0;
              4'h6: out_low = 9'h1d8;
              4'h7: out_low = 9'h1e0;
              4'h8: out_low = 9'h1e8;
              4'h9: out_low = 9'h1f0;
              4'ha: out_low = 9'h1f9;
              4'hb: out_low = 9'h001;
              4'hc: out_low = 9'h009;
              4'hd: out_low = 9'h012;
              4'he: out_low = 9'h01a;
              4'hf: out_low = 9'h023;
              default: out_low = 9'h000;
            endcase
          end
          6'h2d: begin
            case (mant[3:0])
              4'h0: out_low = 9'h02b;
              4'h1: out_low = 9'h034;
              4'h2: out_low = 9'h03c;
              4'h3: out_low = 9'h045;
              4'h4: out_low = 9'h04e;
              4'h5: out_low = 9'h057;
              4'h6: out_low = 9'h05f;
              4'h7: out_low = 9'h068;
              4'h8: out_low = 9'h071;
              4'h9: out_low = 9'h07a;
              4'ha: out_low = 9'h083;
              4'hb: out_low = 9'h08c;
              4'hc: out_low = 9'h095;
              4'hd: out_low = 9'h09e;
              4'he: out_low = 9'h0a8;
              4'hf: out_low = 9'h0b1;
              default: out_low = 9'h000;
            endcase
          end
          6'h2e: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0ba;
              4'h1: out_low = 9'h0c4;
              4'h2: out_low = 9'h0cd;
              4'h3: out_low = 9'h0d6;
              4'h4: out_low = 9'h0e0;
              4'h5: out_low = 9'h0e9;
              4'h6: out_low = 9'h0f3;
              4'h7: out_low = 9'h0fd;
              4'h8: out_low = 9'h106;
              4'h9: out_low = 9'h110;
              4'ha: out_low = 9'h11a;
              4'hb: out_low = 9'h124;
              4'hc: out_low = 9'h12e;
              4'hd: out_low = 9'h138;
              4'he: out_low = 9'h142;
              4'hf: out_low = 9'h14c;
              default: out_low = 9'h000;
            endcase
          end
          6'h2f: begin
            case (mant[3:0])
              4'h0: out_low = 9'h156;
              4'h1: out_low = 9'h160;
              4'h2: out_low = 9'h16a;
              4'h3: out_low = 9'h175;
              4'h4: out_low = 9'h17f;
              4'h5: out_low = 9'h18a;
              4'h6: out_low = 9'h194;
              4'h7: out_low = 9'h19f;
              4'h8: out_low = 9'h1a9;
              4'h9: out_low = 9'h1b4;
              4'ha: out_low = 9'h1bf;
              4'hb: out_low = 9'h1c9;
              4'hc: out_low = 9'h1d4;
              4'hd: out_low = 9'h1df;
              4'he: out_low = 9'h1ea;
              4'hf: out_low = 9'h1f5;
              default: out_low = 9'h000;
            endcase
          end
          6'h30: begin
            case (mant[3:0])
              4'h0: out_low = 9'h000;
              4'h1: out_low = 9'h006;
              4'h2: out_low = 9'h00b;
              4'h3: out_low = 9'h011;
              4'h4: out_low = 9'h016;
              4'h5: out_low = 9'h01c;
              4'h6: out_low = 9'h022;
              4'h7: out_low = 9'h028;
              4'h8: out_low = 9'h02d;
              4'h9: out_low = 9'h033;
              4'ha: out_low = 9'h039;
              4'hb: out_low = 9'h03f;
              4'hc: out_low = 9'h045;
              4'hd: out_low = 9'h04b;
              4'he: out_low = 9'h051;
              4'hf: out_low = 9'h057;
              default: out_low = 9'h000;
            endcase
          end
          6'h31: begin
            case (mant[3:0])
              4'h0: out_low = 9'h05d;
              4'h1: out_low = 9'h063;
              4'h2: out_low = 9'h069;
              4'h3: out_low = 9'h06f;
              4'h4: out_low = 9'h075;
              4'h5: out_low = 9'h07b;
              4'h6: out_low = 9'h082;
              4'h7: out_low = 9'h088;
              4'h8: out_low = 9'h08e;
              4'h9: out_low = 9'h094;
              4'ha: out_low = 9'h09b;
              4'hb: out_low = 9'h0a1;
              4'hc: out_low = 9'h0a8;
              4'hd: out_low = 9'h0ae;
              4'he: out_low = 9'h0b5;
              4'hf: out_low = 9'h0bb;
              default: out_low = 9'h000;
            endcase
          end
          6'h32: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0c2;
              4'h1: out_low = 9'h0c8;
              4'h2: out_low = 9'h0cf;
              4'h3: out_low = 9'h0d6;
              4'h4: out_low = 9'h0dc;
              4'h5: out_low = 9'h0e3;
              4'h6: out_low = 9'h0ea;
              4'h7: out_low = 9'h0f1;
              4'h8: out_low = 9'h0f8;
              4'h9: out_low = 9'h0ff;
              4'ha: out_low = 9'h106;
              4'hb: out_low = 9'h10c;
              4'hc: out_low = 9'h114;
              4'hd: out_low = 9'h11b;
              4'he: out_low = 9'h122;
              4'hf: out_low = 9'h129;
              default: out_low = 9'h000;
            endcase
          end
          6'h33: begin
            case (mant[3:0])
              4'h0: out_low = 9'h130;
              4'h1: out_low = 9'h137;
              4'h2: out_low = 9'h13e;
              4'h3: out_low = 9'h146;
              4'h4: out_low = 9'h14d;
              4'h5: out_low = 9'h154;
              4'h6: out_low = 9'h15c;
              4'h7: out_low = 9'h163;
              4'h8: out_low = 9'h16b;
              4'h9: out_low = 9'h172;
              4'ha: out_low = 9'h17a;
              4'hb: out_low = 9'h181;
              4'hc: out_low = 9'h189;
              4'hd: out_low = 9'h191;
              4'he: out_low = 9'h199;
              4'hf: out_low = 9'h1a0;
              default: out_low = 9'h000;
            endcase
          end
          6'h34: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1a8;
              4'h1: out_low = 9'h1b0;
              4'h2: out_low = 9'h1b8;
              4'h3: out_low = 9'h1c0;
              4'h4: out_low = 9'h1c8;
              4'h5: out_low = 9'h1d0;
              4'h6: out_low = 9'h1d8;
              4'h7: out_low = 9'h1e0;
              4'h8: out_low = 9'h1e8;
              4'h9: out_low = 9'h1f0;
              4'ha: out_low = 9'h1f9;
              4'hb: out_low = 9'h001;
              4'hc: out_low = 9'h009;
              4'hd: out_low = 9'h012;
              4'he: out_low = 9'h01a;
              4'hf: out_low = 9'h023;
              default: out_low = 9'h000;
            endcase
          end
          6'h35: begin
            case (mant[3:0])
              4'h0: out_low = 9'h02b;
              4'h1: out_low = 9'h034;
              4'h2: out_low = 9'h03c;
              4'h3: out_low = 9'h045;
              4'h4: out_low = 9'h04e;
              4'h5: out_low = 9'h057;
              4'h6: out_low = 9'h05f;
              4'h7: out_low = 9'h068;
              4'h8: out_low = 9'h071;
              4'h9: out_low = 9'h07a;
              4'ha: out_low = 9'h083;
              4'hb: out_low = 9'h08c;
              4'hc: out_low = 9'h095;
              4'hd: out_low = 9'h09e;
              4'he: out_low = 9'h0a8;
              4'hf: out_low = 9'h0b1;
              default: out_low = 9'h000;
            endcase
          end
          6'h36: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0ba;
              4'h1: out_low = 9'h0c4;
              4'h2: out_low = 9'h0cd;
              4'h3: out_low = 9'h0d6;
              4'h4: out_low = 9'h0e0;
              4'h5: out_low = 9'h0e9;
              4'h6: out_low = 9'h0f3;
              4'h7: out_low = 9'h0fd;
              4'h8: out_low = 9'h106;
              4'h9: out_low = 9'h110;
              4'ha: out_low = 9'h11a;
              4'hb: out_low = 9'h124;
              4'hc: out_low = 9'h12e;
              4'hd: out_low = 9'h138;
              4'he: out_low = 9'h142;
              4'hf: out_low = 9'h14c;
              default: out_low = 9'h000;
            endcase
          end
          6'h37: begin
            case (mant[3:0])
              4'h0: out_low = 9'h156;
              4'h1: out_low = 9'h160;
              4'h2: out_low = 9'h16a;
              4'h3: out_low = 9'h175;
              4'h4: out_low = 9'h17f;
              4'h5: out_low = 9'h18a;
              4'h6: out_low = 9'h194;
              4'h7: out_low = 9'h19f;
              4'h8: out_low = 9'h1a9;
              4'h9: out_low = 9'h1b4;
              4'ha: out_low = 9'h1bf;
              4'hb: out_low = 9'h1c9;
              4'hc: out_low = 9'h1d4;
              4'hd: out_low = 9'h1df;
              4'he: out_low = 9'h1ea;
              4'hf: out_low = 9'h1f5;
              default: out_low = 9'h000;
            endcase
          end
          6'h38: begin
            case (mant[3:0])
              4'h0: out_low = 9'h000;
              4'h1: out_low = 9'h006;
              4'h2: out_low = 9'h00b;
              4'h3: out_low = 9'h011;
              4'h4: out_low = 9'h016;
              4'h5: out_low = 9'h01c;
              4'h6: out_low = 9'h022;
              4'h7: out_low = 9'h028;
              4'h8: out_low = 9'h02d;
              4'h9: out_low = 9'h033;
              4'ha: out_low = 9'h039;
              4'hb: out_low = 9'h03f;
              4'hc: out_low = 9'h045;
              4'hd: out_low = 9'h04b;
              4'he: out_low = 9'h051;
              4'hf: out_low = 9'h057;
              default: out_low = 9'h000;
            endcase
          end
          6'h39: begin
            case (mant[3:0])
              4'h0: out_low = 9'h05d;
              4'h1: out_low = 9'h063;
              4'h2: out_low = 9'h069;
              4'h3: out_low = 9'h06f;
              4'h4: out_low = 9'h075;
              4'h5: out_low = 9'h07b;
              4'h6: out_low = 9'h082;
              4'h7: out_low = 9'h088;
              4'h8: out_low = 9'h08e;
              4'h9: out_low = 9'h094;
              4'ha: out_low = 9'h09b;
              4'hb: out_low = 9'h0a1;
              4'hc: out_low = 9'h0a8;
              4'hd: out_low = 9'h0ae;
              4'he: out_low = 9'h0b5;
              4'hf: out_low = 9'h0bb;
              default: out_low = 9'h000;
            endcase
          end
          6'h3a: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0c2;
              4'h1: out_low = 9'h0c8;
              4'h2: out_low = 9'h0cf;
              4'h3: out_low = 9'h0d6;
              4'h4: out_low = 9'h0dc;
              4'h5: out_low = 9'h0e3;
              4'h6: out_low = 9'h0ea;
              4'h7: out_low = 9'h0f1;
              4'h8: out_low = 9'h0f8;
              4'h9: out_low = 9'h0ff;
              4'ha: out_low = 9'h106;
              4'hb: out_low = 9'h10c;
              4'hc: out_low = 9'h114;
              4'hd: out_low = 9'h11b;
              4'he: out_low = 9'h122;
              4'hf: out_low = 9'h129;
              default: out_low = 9'h000;
            endcase
          end
          6'h3b: begin
            case (mant[3:0])
              4'h0: out_low = 9'h130;
              4'h1: out_low = 9'h137;
              4'h2: out_low = 9'h13e;
              4'h3: out_low = 9'h146;
              4'h4: out_low = 9'h14d;
              4'h5: out_low = 9'h154;
              4'h6: out_low = 9'h15c;
              4'h7: out_low = 9'h163;
              4'h8: out_low = 9'h16b;
              4'h9: out_low = 9'h172;
              4'ha: out_low = 9'h17a;
              4'hb: out_low = 9'h181;
              4'hc: out_low = 9'h189;
              4'hd: out_low = 9'h191;
              4'he: out_low = 9'h199;
              4'hf: out_low = 9'h1a0;
              default: out_low = 9'h000;
            endcase
          end
          6'h3c: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1a8;
              4'h1: out_low = 9'h1b0;
              4'h2: out_low = 9'h1b8;
              4'h3: out_low = 9'h1c0;
              4'h4: out_low = 9'h1c8;
              4'h5: out_low = 9'h1d0;
              4'h6: out_low = 9'h1d8;
              4'h7: out_low = 9'h1e0;
              4'h8: out_low = 9'h1e8;
              4'h9: out_low = 9'h1f0;
              4'ha: out_low = 9'h1f9;
              4'hb: out_low = 9'h001;
              4'hc: out_low = 9'h009;
              4'hd: out_low = 9'h012;
              4'he: out_low = 9'h01a;
              4'hf: out_low = 9'h023;
              default: out_low = 9'h000;
            endcase
          end
          6'h3d: begin
            case (mant[3:0])
              4'h0: out_low = 9'h02b;
              4'h1: out_low = 9'h034;
              4'h2: out_low = 9'h03c;
              4'h3: out_low = 9'h045;
              4'h4: out_low = 9'h04e;
              4'h5: out_low = 9'h057;
              4'h6: out_low = 9'h05f;
              4'h7: out_low = 9'h068;
              4'h8: out_low = 9'h071;
              4'h9: out_low = 9'h07a;
              4'ha: out_low = 9'h083;
              4'hb: out_low = 9'h08c;
              4'hc: out_low = 9'h095;
              4'hd: out_low = 9'h09e;
              4'he: out_low = 9'h0a8;
              4'hf: out_low = 9'h0b1;
              default: out_low = 9'h000;
            endcase
          end
          6'h3e: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0ba;
              4'h1: out_low = 9'h0c4;
              4'h2: out_low = 9'h0cd;
              4'h3: out_low = 9'h0d6;
              4'h4: out_low = 9'h0e0;
              4'h5: out_low = 9'h0e9;
              4'h6: out_low = 9'h0f3;
              4'h7: out_low = 9'h0fd;
              4'h8: out_low = 9'h106;
              4'h9: out_low = 9'h110;
              4'ha: out_low = 9'h11a;
              4'hb: out_low = 9'h124;
              4'hc: out_low = 9'h12e;
              4'hd: out_low = 9'h138;
              4'he: out_low = 9'h142;
              4'hf: out_low = 9'h14c;
              default: out_low = 9'h000;
            endcase
          end
          6'h3f: begin
            case (mant[3:0])
              4'h0: out_low = 9'h156;
              4'h1: out_low = 9'h160;
              4'h2: out_low = 9'h16a;
              4'h3: out_low = 9'h175;
              4'h4: out_low = 9'h17f;
              4'h5: out_low = 9'h18a;
              4'h6: out_low = 9'h194;
              4'h7: out_low = 9'h19f;
              4'h8: out_low = 9'h1a9;
              4'h9: out_low = 9'h1b4;
              4'ha: out_low = 9'h1bf;
              4'hb: out_low = 9'h1c9;
              4'hc: out_low = 9'h1d4;
              4'hd: out_low = 9'h1df;
              4'he: out_low = 9'h1ea;
              4'hf: out_low = 9'h1f5;
              default: out_low = 9'h000;
            endcase
          end
          default: out_low = 9'h000;
        endcase
      end
      6'h1f: begin
        case (mant[9:4])
          6'h00: out_low = 9'h000;
          6'h01: out_low = 9'h000;
          6'h02: out_low = 9'h000;
          6'h03: out_low = 9'h000;
          6'h04: out_low = 9'h000;
          6'h05: out_low = 9'h000;
          6'h06: out_low = 9'h000;
          6'h07: out_low = 9'h000;
          6'h08: out_low = 9'h000;
          6'h09: out_low = 9'h000;
          6'h0a: out_low = 9'h000;
          6'h0b: out_low = 9'h000;
          6'h0c: out_low = 9'h000;
          6'h0d: out_low = 9'h000;
          6'h0e: out_low = 9'h000;
          6'h0f: out_low = 9'h000;
          6'h10: out_low = 9'h000;
          6'h11: out_low = 9'h000;
          6'h12: out_low = 9'h000;
          6'h13: out_low = 9'h000;
          6'h14: out_low = 9'h000;
          6'h15: out_low = 9'h000;
          6'h16: out_low = 9'h000;
          6'h17: out_low = 9'h000;
          6'h18: out_low = 9'h000;
          6'h19: out_low = 9'h000;
          6'h1a: out_low = 9'h000;
          6'h1b: out_low = 9'h000;
          6'h1c: out_low = 9'h000;
          6'h1d: out_low = 9'h000;
          6'h1e: out_low = 9'h000;
          6'h1f: out_low = 9'h000;
          6'h20: out_low = 9'h000;
          6'h21: out_low = 9'h000;
          6'h22: out_low = 9'h000;
          6'h23: out_low = 9'h000;
          6'h24: out_low = 9'h000;
          6'h25: out_low = 9'h000;
          6'h26: out_low = 9'h000;
          6'h27: out_low = 9'h000;
          6'h28: out_low = 9'h000;
          6'h29: out_low = 9'h000;
          6'h2a: out_low = 9'h000;
          6'h2b: out_low = 9'h000;
          6'h2c: out_low = 9'h000;
          6'h2d: out_low = 9'h000;
          6'h2e: out_low = 9'h000;
          6'h2f: out_low = 9'h000;
          6'h30: out_low = 9'h000;
          6'h31: out_low = 9'h000;
          6'h32: out_low = 9'h000;
          6'h33: out_low = 9'h000;
          6'h34: out_low = 9'h000;
          6'h35: out_low = 9'h000;
          6'h36: out_low = 9'h000;
          6'h37: out_low = 9'h000;
          6'h38: out_low = 9'h000;
          6'h39: out_low = 9'h000;
          6'h3a: out_low = 9'h000;
          6'h3b: out_low = 9'h000;
          6'h3c: out_low = 9'h000;
          6'h3d: out_low = 9'h000;
          6'h3e: out_low = 9'h000;
          6'h3f: out_low = 9'h000;
          default: out_low = 9'h000;
        endcase
      end
      6'h23: begin
        case (mant[9:4])
          6'h00: out_low = 9'h000;
          6'h01: out_low = 9'h000;
          6'h02: out_low = 9'h000;
          6'h03: out_low = 9'h000;
          6'h04: out_low = 9'h000;
          6'h05: out_low = 9'h000;
          6'h06: out_low = 9'h000;
          6'h07: out_low = 9'h000;
          6'h08: out_low = 9'h000;
          6'h09: out_low = 9'h000;
          6'h0a: out_low = 9'h000;
          6'h0b: out_low = 9'h000;
          6'h0c: out_low = 9'h000;
          6'h0d: out_low = 9'h000;
          6'h0e: out_low = 9'h000;
          6'h0f: out_low = 9'h000;
          6'h10: out_low = 9'h000;
          6'h11: out_low = 9'h000;
          6'h12: out_low = 9'h000;
          6'h13: out_low = 9'h000;
          6'h14: out_low = 9'h000;
          6'h15: out_low = 9'h000;
          6'h16: out_low = 9'h000;
          6'h17: out_low = 9'h000;
          6'h18: out_low = 9'h000;
          6'h19: out_low = 9'h000;
          6'h1a: out_low = 9'h000;
          6'h1b: out_low = 9'h000;
          6'h1c: begin
            case (mant[3:0])
              4'h0: out_low = 9'h000;
              4'h1: out_low = 9'h000;
              4'h2: out_low = 9'h000;
              4'h3: out_low = 9'h000;
              4'h4: out_low = 9'h000;
              4'h5: out_low = 9'h000;
              4'h6: out_low = 9'h1ff;
              4'h7: out_low = 9'h1ff;
              4'h8: out_low = 9'h1ff;
              4'h9: out_low = 9'h1ff;
              4'ha: out_low = 9'h1ff;
              4'hb: out_low = 9'h1ff;
              4'hc: out_low = 9'h1ff;
              4'hd: out_low = 9'h1ff;
              4'he: out_low = 9'h1ff;
              4'hf: out_low = 9'h1ff;
              default: out_low = 9'h000;
            endcase
          end
          6'h1d: out_low = 9'h1ff;
          6'h1e: out_low = 9'h1ff;
          6'h1f: out_low = 9'h1ff;
          6'h20: out_low = 9'h1ff;
          6'h21: out_low = 9'h1ff;
          6'h22: out_low = 9'h1ff;
          6'h23: out_low = 9'h1ff;
          6'h24: out_low = 9'h1ff;
          6'h25: out_low = 9'h1ff;
          6'h26: out_low = 9'h1ff;
          6'h27: out_low = 9'h1ff;
          6'h28: out_low = 9'h1ff;
          6'h29: out_low = 9'h1ff;
          6'h2a: out_low = 9'h1ff;
          6'h2b: out_low = 9'h1ff;
          6'h2c: out_low = 9'h1ff;
          6'h2d: out_low = 9'h1ff;
          6'h2e: out_low = 9'h1ff;
          6'h2f: out_low = 9'h1ff;
          6'h30: out_low = 9'h1ff;
          6'h31: out_low = 9'h1ff;
          6'h32: out_low = 9'h1ff;
          6'h33: out_low = 9'h1ff;
          6'h34: out_low = 9'h1ff;
          6'h35: out_low = 9'h1ff;
          6'h36: out_low = 9'h1ff;
          6'h37: out_low = 9'h1ff;
          6'h38: out_low = 9'h1ff;
          6'h39: out_low = 9'h1ff;
          6'h3a: out_low = 9'h1ff;
          6'h3b: out_low = 9'h1ff;
          6'h3c: out_low = 9'h1ff;
          6'h3d: out_low = 9'h1ff;
          6'h3e: out_low = 9'h1ff;
          6'h3f: out_low = 9'h1ff;
          default: out_low = 9'h000;
        endcase
      end
      6'h25: begin
        case (mant[9:4])
          6'h00: out_low = 9'h1ff;
          6'h01: out_low = 9'h1ff;
          6'h02: out_low = 9'h1ff;
          6'h03: out_low = 9'h1ff;
          6'h04: out_low = 9'h1ff;
          6'h05: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1ff;
              4'h1: out_low = 9'h1ff;
              4'h2: out_low = 9'h1ff;
              4'h3: out_low = 9'h1ff;
              4'h4: out_low = 9'h1ff;
              4'h5: out_low = 9'h1fe;
              4'h6: out_low = 9'h1fe;
              4'h7: out_low = 9'h1fe;
              4'h8: out_low = 9'h1fe;
              4'h9: out_low = 9'h1fe;
              4'ha: out_low = 9'h1fe;
              4'hb: out_low = 9'h1fe;
              4'hc: out_low = 9'h1fe;
              4'hd: out_low = 9'h1fe;
              4'he: out_low = 9'h1fe;
              4'hf: out_low = 9'h1fe;
              default: out_low = 9'h000;
            endcase
          end
          6'h06: out_low = 9'h1fe;
          6'h07: out_low = 9'h1fe;
          6'h08: out_low = 9'h1fe;
          6'h09: out_low = 9'h1fe;
          6'h0a: out_low = 9'h1fe;
          6'h0b: out_low = 9'h1fe;
          6'h0c: out_low = 9'h1fe;
          6'h0d: out_low = 9'h1fe;
          6'h0e: out_low = 9'h1fe;
          6'h0f: out_low = 9'h1fe;
          6'h10: out_low = 9'h1fe;
          6'h11: out_low = 9'h1fe;
          6'h12: out_low = 9'h1fe;
          6'h13: out_low = 9'h1fe;
          6'h14: out_low = 9'h1fe;
          6'h15: out_low = 9'h1fe;
          6'h16: out_low = 9'h1fe;
          6'h17: out_low = 9'h1fe;
          6'h18: out_low = 9'h1fe;
          6'h19: out_low = 9'h1fe;
          6'h1a: out_low = 9'h1fe;
          6'h1b: out_low = 9'h1fe;
          6'h1c: out_low = 9'h1fe;
          6'h1d: out_low = 9'h1fe;
          6'h1e: out_low = 9'h1fe;
          6'h1f: out_low = 9'h1fe;
          6'h20: out_low = 9'h1fe;
          6'h21: out_low = 9'h1fe;
          6'h22: out_low = 9'h1fe;
          6'h23: out_low = 9'h1fe;
          6'h24: out_low = 9'h1fe;
          6'h25: out_low = 9'h1fe;
          6'h26: out_low = 9'h1fe;
          6'h27: out_low = 9'h1fe;
          6'h28: out_low = 9'h1fe;
          6'h29: out_low = 9'h1fe;
          6'h2a: out_low = 9'h1fe;
          6'h2b: out_low = 9'h1fe;
          6'h2c: out_low = 9'h1fe;
          6'h2d: out_low = 9'h1fe;
          6'h2e: out_low = 9'h1fe;
          6'h2f: out_low = 9'h1fe;
          6'h30: out_low = 9'h1fe;
          6'h31: out_low = 9'h1fe;
          6'h32: out_low = 9'h1fe;
          6'h33: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1fe;
              4'h1: out_low = 9'h1fe;
              4'h2: out_low = 9'h1fe;
              4'h3: out_low = 9'h1fe;
              4'h4: out_low = 9'h1fe;
              4'h5: out_low = 9'h1fe;
              4'h6: out_low = 9'h1fe;
              4'h7: out_low = 9'h1fe;
              4'h8: out_low = 9'h1fd;
              4'h9: out_low = 9'h1fd;
              4'ha: out_low = 9'h1fd;
              4'hb: out_low = 9'h1fd;
              4'hc: out_low = 9'h1fd;
              4'hd: out_low = 9'h1fd;
              4'he: out_low = 9'h1fd;
              4'hf: out_low = 9'h1fd;
              default: out_low = 9'h000;
            endcase
          end
          6'h34: out_low = 9'h1fd;
          6'h35: out_low = 9'h1fd;
          6'h36: out_low = 9'h1fd;
          6'h37: out_low = 9'h1fd;
          6'h38: out_low = 9'h1fd;
          6'h39: out_low = 9'h1fd;
          6'h3a: out_low = 9'h1fd;
          6'h3b: out_low = 9'h1fd;
          6'h3c: out_low = 9'h1fd;
          6'h3d: out_low = 9'h1fd;
          6'h3e: out_low = 9'h1fd;
          6'h3f: out_low = 9'h1fd;
          default: out_low = 9'h000;
        endcase
      end
      6'h26: begin
        case (mant[9:4])
          6'h00: out_low = 9'h1fd;
          6'h01: out_low = 9'h1fd;
          6'h02: out_low = 9'h1fd;
          6'h03: out_low = 9'h1fd;
          6'h04: out_low = 9'h1fd;
          6'h05: out_low = 9'h1fd;
          6'h06: out_low = 9'h1fd;
          6'h07: out_low = 9'h1fd;
          6'h08: out_low = 9'h1fd;
          6'h09: out_low = 9'h1fd;
          6'h0a: out_low = 9'h1fd;
          6'h0b: out_low = 9'h1fd;
          6'h0c: out_low = 9'h1fd;
          6'h0d: out_low = 9'h1fd;
          6'h0e: out_low = 9'h1fd;
          6'h0f: out_low = 9'h1fd;
          6'h10: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1fd;
              4'h1: out_low = 9'h1fd;
              4'h2: out_low = 9'h1fd;
              4'h3: out_low = 9'h1fd;
              4'h4: out_low = 9'h1fd;
              4'h5: out_low = 9'h1fd;
              4'h6: out_low = 9'h1fd;
              4'h7: out_low = 9'h1fd;
              4'h8: out_low = 9'h1fd;
              4'h9: out_low = 9'h1fd;
              4'ha: out_low = 9'h1fd;
              4'hb: out_low = 9'h1fd;
              4'hc: out_low = 9'h1fd;
              4'hd: out_low = 9'h1fd;
              4'he: out_low = 9'h1fc;
              4'hf: out_low = 9'h1fc;
              default: out_low = 9'h000;
            endcase
          end
          6'h11: out_low = 9'h1fc;
          6'h12: out_low = 9'h1fc;
          6'h13: out_low = 9'h1fc;
          6'h14: out_low = 9'h1fc;
          6'h15: out_low = 9'h1fc;
          6'h16: out_low = 9'h1fc;
          6'h17: out_low = 9'h1fc;
          6'h18: out_low = 9'h1fc;
          6'h19: out_low = 9'h1fc;
          6'h1a: out_low = 9'h1fc;
          6'h1b: out_low = 9'h1fc;
          6'h1c: out_low = 9'h1fc;
          6'h1d: out_low = 9'h1fc;
          6'h1e: out_low = 9'h1fc;
          6'h1f: out_low = 9'h1fc;
          6'h20: out_low = 9'h1fc;
          6'h21: out_low = 9'h1fc;
          6'h22: out_low = 9'h1fc;
          6'h23: out_low = 9'h1fc;
          6'h24: out_low = 9'h1fc;
          6'h25: out_low = 9'h1fc;
          6'h26: out_low = 9'h1fc;
          6'h27: out_low = 9'h1fc;
          6'h28: out_low = 9'h1fb;
          6'h29: out_low = 9'h1fb;
          6'h2a: out_low = 9'h1fb;
          6'h2b: out_low = 9'h1fb;
          6'h2c: out_low = 9'h1fb;
          6'h2d: out_low = 9'h1fb;
          6'h2e: out_low = 9'h1fb;
          6'h2f: out_low = 9'h1fb;
          6'h30: out_low = 9'h1fb;
          6'h31: out_low = 9'h1fb;
          6'h32: out_low = 9'h1fb;
          6'h33: out_low = 9'h1fb;
          6'h34: out_low = 9'h1fb;
          6'h35: out_low = 9'h1fb;
          6'h36: out_low = 9'h1fb;
          6'h37: out_low = 9'h1fb;
          6'h38: out_low = 9'h1fb;
          6'h39: out_low = 9'h1fb;
          6'h3a: out_low = 9'h1fb;
          6'h3b: out_low = 9'h1fb;
          6'h3c: out_low = 9'h1fb;
          6'h3d: out_low = 9'h1fb;
          6'h3e: out_low = 9'h1fb;
          6'h3f: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1fb;
              4'h1: out_low = 9'h1fb;
              4'h2: out_low = 9'h1fb;
              4'h3: out_low = 9'h1fa;
              4'h4: out_low = 9'h1fa;
              4'h5: out_low = 9'h1fa;
              4'h6: out_low = 9'h1fa;
              4'h7: out_low = 9'h1fa;
              4'h8: out_low = 9'h1fa;
              4'h9: out_low = 9'h1fa;
              4'ha: out_low = 9'h1fa;
              4'hb: out_low = 9'h1fa;
              4'hc: out_low = 9'h1fa;
              4'hd: out_low = 9'h1fa;
              4'he: out_low = 9'h1fa;
              4'hf: out_low = 9'h1fa;
              default: out_low = 9'h000;
            endcase
          end
          default: out_low = 9'h000;
        endcase
      end
      6'h27: begin
        case (mant[9:4])
          6'h00: out_low = 9'h1fa;
          6'h01: out_low = 9'h1fa;
          6'h02: out_low = 9'h1fa;
          6'h03: out_low = 9'h1fa;
          6'h04: out_low = 9'h1fa;
          6'h05: out_low = 9'h1fa;
          6'h06: out_low = 9'h1fa;
          6'h07: out_low = 9'h1fa;
          6'h08: out_low = 9'h1fa;
          6'h09: out_low = 9'h1fa;
          6'h0a: out_low = 9'h1fa;
          6'h0b: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1fa;
              4'h1: out_low = 9'h1fa;
              4'h2: out_low = 9'h1fa;
              4'h3: out_low = 9'h1f9;
              4'h4: out_low = 9'h1f9;
              4'h5: out_low = 9'h1f9;
              4'h6: out_low = 9'h1f9;
              4'h7: out_low = 9'h1f9;
              4'h8: out_low = 9'h1f9;
              4'h9: out_low = 9'h1f9;
              4'ha: out_low = 9'h1f9;
              4'hb: out_low = 9'h1f9;
              4'hc: out_low = 9'h1f9;
              4'hd: out_low = 9'h1f9;
              4'he: out_low = 9'h1f9;
              4'hf: out_low = 9'h1f9;
              default: out_low = 9'h000;
            endcase
          end
          6'h0c: out_low = 9'h1f9;
          6'h0d: out_low = 9'h1f9;
          6'h0e: out_low = 9'h1f9;
          6'h0f: out_low = 9'h1f9;
          6'h10: out_low = 9'h1f9;
          6'h11: out_low = 9'h1f9;
          6'h12: out_low = 9'h1f9;
          6'h13: out_low = 9'h1f9;
          6'h14: out_low = 9'h1f9;
          6'h15: out_low = 9'h1f9;
          6'h16: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1f9;
              4'h1: out_low = 9'h1f9;
              4'h2: out_low = 9'h1f9;
              4'h3: out_low = 9'h1f9;
              4'h4: out_low = 9'h1f9;
              4'h5: out_low = 9'h1f9;
              4'h6: out_low = 9'h1f9;
              4'h7: out_low = 9'h1f9;
              4'h8: out_low = 9'h1f9;
              4'h9: out_low = 9'h1f9;
              4'ha: out_low = 9'h1f9;
              4'hb: out_low = 9'h1f9;
              4'hc: out_low = 9'h1f8;
              4'hd: out_low = 9'h1f8;
              4'he: out_low = 9'h1f8;
              4'hf: out_low = 9'h1f8;
              default: out_low = 9'h000;
            endcase
          end
          6'h17: out_low = 9'h1f8;
          6'h18: out_low = 9'h1f8;
          6'h19: out_low = 9'h1f8;
          6'h1a: out_low = 9'h1f8;
          6'h1b: out_low = 9'h1f8;
          6'h1c: out_low = 9'h1f8;
          6'h1d: out_low = 9'h1f8;
          6'h1e: out_low = 9'h1f8;
          6'h1f: out_low = 9'h1f8;
          6'h20: out_low = 9'h1f8;
          6'h21: out_low = 9'h1f8;
          6'h22: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1f8;
              4'h1: out_low = 9'h1f8;
              4'h2: out_low = 9'h1f8;
              4'h3: out_low = 9'h1f8;
              4'h4: out_low = 9'h1f8;
              4'h5: out_low = 9'h1f7;
              4'h6: out_low = 9'h1f7;
              4'h7: out_low = 9'h1f7;
              4'h8: out_low = 9'h1f7;
              4'h9: out_low = 9'h1f7;
              4'ha: out_low = 9'h1f7;
              4'hb: out_low = 9'h1f7;
              4'hc: out_low = 9'h1f7;
              4'hd: out_low = 9'h1f7;
              4'he: out_low = 9'h1f7;
              4'hf: out_low = 9'h1f7;
              default: out_low = 9'h000;
            endcase
          end
          6'h23: out_low = 9'h1f7;
          6'h24: out_low = 9'h1f7;
          6'h25: out_low = 9'h1f7;
          6'h26: out_low = 9'h1f7;
          6'h27: out_low = 9'h1f7;
          6'h28: out_low = 9'h1f7;
          6'h29: out_low = 9'h1f7;
          6'h2a: out_low = 9'h1f7;
          6'h2b: out_low = 9'h1f7;
          6'h2c: out_low = 9'h1f7;
          6'h2d: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1f7;
              4'h1: out_low = 9'h1f7;
              4'h2: out_low = 9'h1f7;
              4'h3: out_low = 9'h1f7;
              4'h4: out_low = 9'h1f7;
              4'h5: out_low = 9'h1f7;
              4'h6: out_low = 9'h1f7;
              4'h7: out_low = 9'h1f7;
              4'h8: out_low = 9'h1f7;
              4'h9: out_low = 9'h1f7;
              4'ha: out_low = 9'h1f7;
              4'hb: out_low = 9'h1f7;
              4'hc: out_low = 9'h1f7;
              4'hd: out_low = 9'h1f7;
              4'he: out_low = 9'h1f7;
              4'hf: out_low = 9'h1f6;
              default: out_low = 9'h000;
            endcase
          end
          6'h2e: out_low = 9'h1f6;
          6'h2f: out_low = 9'h1f6;
          6'h30: out_low = 9'h1f6;
          6'h31: out_low = 9'h1f6;
          6'h32: out_low = 9'h1f6;
          6'h33: out_low = 9'h1f6;
          6'h34: out_low = 9'h1f6;
          6'h35: out_low = 9'h1f6;
          6'h36: out_low = 9'h1f6;
          6'h37: out_low = 9'h1f6;
          6'h38: out_low = 9'h1f6;
          6'h39: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1f6;
              4'h1: out_low = 9'h1f6;
              4'h2: out_low = 9'h1f6;
              4'h3: out_low = 9'h1f6;
              4'h4: out_low = 9'h1f6;
              4'h5: out_low = 9'h1f6;
              4'h6: out_low = 9'h1f6;
              4'h7: out_low = 9'h1f6;
              4'h8: out_low = 9'h1f5;
              4'h9: out_low = 9'h1f5;
              4'ha: out_low = 9'h1f5;
              4'hb: out_low = 9'h1f5;
              4'hc: out_low = 9'h1f5;
              4'hd: out_low = 9'h1f5;
              4'he: out_low = 9'h1f5;
              4'hf: out_low = 9'h1f5;
              default: out_low = 9'h000;
            endcase
          end
          6'h3a: out_low = 9'h1f5;
          6'h3b: out_low = 9'h1f5;
          6'h3c: out_low = 9'h1f5;
          6'h3d: out_low = 9'h1f5;
          6'h3e: out_low = 9'h1f5;
          6'h3f: out_low = 9'h1f5;
          default: out_low = 9'h000;
        endcase
      end
      6'h28: begin
        case (mant[9:4])
          6'h00: out_low = 9'h1f5;
          6'h01: out_low = 9'h1f5;
          6'h02: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1f5;
              4'h1: out_low = 9'h1f5;
              4'h2: out_low = 9'h1f5;
              4'h3: out_low = 9'h1f5;
              4'h4: out_low = 9'h1f5;
              4'h5: out_low = 9'h1f5;
              4'h6: out_low = 9'h1f5;
              4'h7: out_low = 9'h1f5;
              4'h8: out_low = 9'h1f5;
              4'h9: out_low = 9'h1f4;
              4'ha: out_low = 9'h1f4;
              4'hb: out_low = 9'h1f4;
              4'hc: out_low = 9'h1f4;
              4'hd: out_low = 9'h1f4;
              4'he: out_low = 9'h1f4;
              4'hf: out_low = 9'h1f4;
              default: out_low = 9'h000;
            endcase
          end
          6'h03: out_low = 9'h1f4;
          6'h04: out_low = 9'h1f4;
          6'h05: out_low = 9'h1f4;
          6'h06: out_low = 9'h1f4;
          6'h07: out_low = 9'h1f4;
          6'h08: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1f4;
              4'h1: out_low = 9'h1f4;
              4'h2: out_low = 9'h1f4;
              4'h3: out_low = 9'h1f4;
              4'h4: out_low = 9'h1f4;
              4'h5: out_low = 9'h1f4;
              4'h6: out_low = 9'h1f3;
              4'h7: out_low = 9'h1f3;
              4'h8: out_low = 9'h1f3;
              4'h9: out_low = 9'h1f3;
              4'ha: out_low = 9'h1f3;
              4'hb: out_low = 9'h1f3;
              4'hc: out_low = 9'h1f3;
              4'hd: out_low = 9'h1f3;
              4'he: out_low = 9'h1f3;
              4'hf: out_low = 9'h1f3;
              default: out_low = 9'h000;
            endcase
          end
          6'h09: out_low = 9'h1f3;
          6'h0a: out_low = 9'h1f3;
          6'h0b: out_low = 9'h1f3;
          6'h0c: out_low = 9'h1f3;
          6'h0d: out_low = 9'h1f3;
          6'h0e: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1f3;
              4'h1: out_low = 9'h1f3;
              4'h2: out_low = 9'h1f3;
              4'h3: out_low = 9'h1f2;
              4'h4: out_low = 9'h1f2;
              4'h5: out_low = 9'h1f2;
              4'h6: out_low = 9'h1f2;
              4'h7: out_low = 9'h1f2;
              4'h8: out_low = 9'h1f2;
              4'h9: out_low = 9'h1f2;
              4'ha: out_low = 9'h1f2;
              4'hb: out_low = 9'h1f2;
              4'hc: out_low = 9'h1f2;
              4'hd: out_low = 9'h1f2;
              4'he: out_low = 9'h1f2;
              4'hf: out_low = 9'h1f2;
              default: out_low = 9'h000;
            endcase
          end
          6'h0f: out_low = 9'h1f2;
          6'h10: out_low = 9'h1f2;
          6'h11: out_low = 9'h1f2;
          6'h12: out_low = 9'h1f2;
          6'h13: out_low = 9'h1f2;
          6'h14: out_low = 9'h1f1;
          6'h15: out_low = 9'h1f1;
          6'h16: out_low = 9'h1f1;
          6'h17: out_low = 9'h1f1;
          6'h18: out_low = 9'h1f1;
          6'h19: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1f1;
              4'h1: out_low = 9'h1f1;
              4'h2: out_low = 9'h1f1;
              4'h3: out_low = 9'h1f1;
              4'h4: out_low = 9'h1f1;
              4'h5: out_low = 9'h1f1;
              4'h6: out_low = 9'h1f1;
              4'h7: out_low = 9'h1f1;
              4'h8: out_low = 9'h1f1;
              4'h9: out_low = 9'h1f1;
              4'ha: out_low = 9'h1f1;
              4'hb: out_low = 9'h1f1;
              4'hc: out_low = 9'h1f1;
              4'hd: out_low = 9'h1f0;
              4'he: out_low = 9'h1f0;
              4'hf: out_low = 9'h1f0;
              default: out_low = 9'h000;
            endcase
          end
          6'h1a: out_low = 9'h1f0;
          6'h1b: out_low = 9'h1f0;
          6'h1c: out_low = 9'h1f0;
          6'h1d: out_low = 9'h1f0;
          6'h1e: out_low = 9'h1f0;
          6'h1f: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1f0;
              4'h1: out_low = 9'h1f0;
              4'h2: out_low = 9'h1f0;
              4'h3: out_low = 9'h1f0;
              4'h4: out_low = 9'h1f0;
              4'h5: out_low = 9'h1f0;
              4'h6: out_low = 9'h1f0;
              4'h7: out_low = 9'h1f0;
              4'h8: out_low = 9'h1f0;
              4'h9: out_low = 9'h1f0;
              4'ha: out_low = 9'h1ef;
              4'hb: out_low = 9'h1ef;
              4'hc: out_low = 9'h1ef;
              4'hd: out_low = 9'h1ef;
              4'he: out_low = 9'h1ef;
              4'hf: out_low = 9'h1ef;
              default: out_low = 9'h000;
            endcase
          end
          6'h20: out_low = 9'h1ef;
          6'h21: out_low = 9'h1ef;
          6'h22: out_low = 9'h1ef;
          6'h23: out_low = 9'h1ef;
          6'h24: out_low = 9'h1ef;
          6'h25: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1ef;
              4'h1: out_low = 9'h1ef;
              4'h2: out_low = 9'h1ef;
              4'h3: out_low = 9'h1ef;
              4'h4: out_low = 9'h1ef;
              4'h5: out_low = 9'h1ef;
              4'h6: out_low = 9'h1ef;
              4'h7: out_low = 9'h1ee;
              4'h8: out_low = 9'h1ee;
              4'h9: out_low = 9'h1ee;
              4'ha: out_low = 9'h1ee;
              4'hb: out_low = 9'h1ee;
              4'hc: out_low = 9'h1ee;
              4'hd: out_low = 9'h1ee;
              4'he: out_low = 9'h1ee;
              4'hf: out_low = 9'h1ee;
              default: out_low = 9'h000;
            endcase
          end
          6'h26: out_low = 9'h1ee;
          6'h27: out_low = 9'h1ee;
          6'h28: out_low = 9'h1ee;
          6'h29: out_low = 9'h1ee;
          6'h2a: out_low = 9'h1ee;
          6'h2b: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1ee;
              4'h1: out_low = 9'h1ee;
              4'h2: out_low = 9'h1ee;
              4'h3: out_low = 9'h1ee;
              4'h4: out_low = 9'h1ed;
              4'h5: out_low = 9'h1ed;
              4'h6: out_low = 9'h1ed;
              4'h7: out_low = 9'h1ed;
              4'h8: out_low = 9'h1ed;
              4'h9: out_low = 9'h1ed;
              4'ha: out_low = 9'h1ed;
              4'hb: out_low = 9'h1ed;
              4'hc: out_low = 9'h1ed;
              4'hd: out_low = 9'h1ed;
              4'he: out_low = 9'h1ed;
              4'hf: out_low = 9'h1ed;
              default: out_low = 9'h000;
            endcase
          end
          6'h2c: out_low = 9'h1ed;
          6'h2d: out_low = 9'h1ed;
          6'h2e: out_low = 9'h1ed;
          6'h2f: out_low = 9'h1ed;
          6'h30: out_low = 9'h1ed;
          6'h31: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1ed;
              4'h1: out_low = 9'h1ed;
              4'h2: out_low = 9'h1ec;
              4'h3: out_low = 9'h1ec;
              4'h4: out_low = 9'h1ec;
              4'h5: out_low = 9'h1ec;
              4'h6: out_low = 9'h1ec;
              4'h7: out_low = 9'h1ec;
              4'h8: out_low = 9'h1ec;
              4'h9: out_low = 9'h1ec;
              4'ha: out_low = 9'h1ec;
              4'hb: out_low = 9'h1ec;
              4'hc: out_low = 9'h1ec;
              4'hd: out_low = 9'h1ec;
              4'he: out_low = 9'h1ec;
              4'hf: out_low = 9'h1ec;
              default: out_low = 9'h000;
            endcase
          end
          6'h32: out_low = 9'h1ec;
          6'h33: out_low = 9'h1ec;
          6'h34: out_low = 9'h1ec;
          6'h35: out_low = 9'h1ec;
          6'h36: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1ec;
              4'h1: out_low = 9'h1ec;
              4'h2: out_low = 9'h1ec;
              4'h3: out_low = 9'h1ec;
              4'h4: out_low = 9'h1ec;
              4'h5: out_low = 9'h1ec;
              4'h6: out_low = 9'h1ec;
              4'h7: out_low = 9'h1ec;
              4'h8: out_low = 9'h1ec;
              4'h9: out_low = 9'h1ec;
              4'ha: out_low = 9'h1ec;
              4'hb: out_low = 9'h1ec;
              4'hc: out_low = 9'h1ec;
              4'hd: out_low = 9'h1ec;
              4'he: out_low = 9'h1ec;
              4'hf: out_low = 9'h1eb;
              default: out_low = 9'h000;
            endcase
          end
          6'h37: out_low = 9'h1eb;
          6'h38: out_low = 9'h1eb;
          6'h39: out_low = 9'h1eb;
          6'h3a: out_low = 9'h1eb;
          6'h3b: out_low = 9'h1eb;
          6'h3c: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1eb;
              4'h1: out_low = 9'h1eb;
              4'h2: out_low = 9'h1eb;
              4'h3: out_low = 9'h1eb;
              4'h4: out_low = 9'h1eb;
              4'h5: out_low = 9'h1eb;
              4'h6: out_low = 9'h1eb;
              4'h7: out_low = 9'h1eb;
              4'h8: out_low = 9'h1eb;
              4'h9: out_low = 9'h1eb;
              4'ha: out_low = 9'h1eb;
              4'hb: out_low = 9'h1eb;
              4'hc: out_low = 9'h1ea;
              4'hd: out_low = 9'h1ea;
              4'he: out_low = 9'h1ea;
              4'hf: out_low = 9'h1ea;
              default: out_low = 9'h000;
            endcase
          end
          6'h3d: out_low = 9'h1ea;
          6'h3e: out_low = 9'h1ea;
          6'h3f: out_low = 9'h1ea;
          default: out_low = 9'h000;
        endcase
      end
      6'h29: begin
        case (mant[9:4])
          6'h00: out_low = 9'h1ea;
          6'h01: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1ea;
              4'h1: out_low = 9'h1ea;
              4'h2: out_low = 9'h1ea;
              4'h3: out_low = 9'h1ea;
              4'h4: out_low = 9'h1ea;
              4'h5: out_low = 9'h1e9;
              4'h6: out_low = 9'h1e9;
              4'h7: out_low = 9'h1e9;
              4'h8: out_low = 9'h1e9;
              4'h9: out_low = 9'h1e9;
              4'ha: out_low = 9'h1e9;
              4'hb: out_low = 9'h1e9;
              4'hc: out_low = 9'h1e9;
              4'hd: out_low = 9'h1e9;
              4'he: out_low = 9'h1e9;
              4'hf: out_low = 9'h1e9;
              default: out_low = 9'h000;
            endcase
          end
          6'h02: out_low = 9'h1e9;
          6'h03: out_low = 9'h1e9;
          6'h04: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1e9;
              4'h1: out_low = 9'h1e9;
              4'h2: out_low = 9'h1e9;
              4'h3: out_low = 9'h1e9;
              4'h4: out_low = 9'h1e8;
              4'h5: out_low = 9'h1e8;
              4'h6: out_low = 9'h1e8;
              4'h7: out_low = 9'h1e8;
              4'h8: out_low = 9'h1e8;
              4'h9: out_low = 9'h1e8;
              4'ha: out_low = 9'h1e8;
              4'hb: out_low = 9'h1e8;
              4'hc: out_low = 9'h1e8;
              4'hd: out_low = 9'h1e8;
              4'he: out_low = 9'h1e8;
              4'hf: out_low = 9'h1e8;
              default: out_low = 9'h000;
            endcase
          end
          6'h05: out_low = 9'h1e8;
          6'h06: out_low = 9'h1e8;
          6'h07: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1e8;
              4'h1: out_low = 9'h1e8;
              4'h2: out_low = 9'h1e7;
              4'h3: out_low = 9'h1e7;
              4'h4: out_low = 9'h1e7;
              4'h5: out_low = 9'h1e7;
              4'h6: out_low = 9'h1e7;
              4'h7: out_low = 9'h1e7;
              4'h8: out_low = 9'h1e7;
              4'h9: out_low = 9'h1e7;
              4'ha: out_low = 9'h1e7;
              4'hb: out_low = 9'h1e7;
              4'hc: out_low = 9'h1e7;
              4'hd: out_low = 9'h1e7;
              4'he: out_low = 9'h1e7;
              4'hf: out_low = 9'h1e7;
              default: out_low = 9'h000;
            endcase
          end
          6'h08: out_low = 9'h1e7;
          6'h09: out_low = 9'h1e7;
          6'h0a: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1e7;
              4'h1: out_low = 9'h1e6;
              4'h2: out_low = 9'h1e6;
              4'h3: out_low = 9'h1e6;
              4'h4: out_low = 9'h1e6;
              4'h5: out_low = 9'h1e6;
              4'h6: out_low = 9'h1e6;
              4'h7: out_low = 9'h1e6;
              4'h8: out_low = 9'h1e6;
              4'h9: out_low = 9'h1e6;
              4'ha: out_low = 9'h1e6;
              4'hb: out_low = 9'h1e6;
              4'hc: out_low = 9'h1e6;
              4'hd: out_low = 9'h1e6;
              4'he: out_low = 9'h1e6;
              4'hf: out_low = 9'h1e6;
              default: out_low = 9'h000;
            endcase
          end
          6'h0b: out_low = 9'h1e6;
          6'h0c: out_low = 9'h1e6;
          6'h0d: out_low = 9'h1e5;
          6'h0e: out_low = 9'h1e5;
          6'h0f: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1e5;
              4'h1: out_low = 9'h1e5;
              4'h2: out_low = 9'h1e5;
              4'h3: out_low = 9'h1e5;
              4'h4: out_low = 9'h1e5;
              4'h5: out_low = 9'h1e5;
              4'h6: out_low = 9'h1e5;
              4'h7: out_low = 9'h1e5;
              4'h8: out_low = 9'h1e5;
              4'h9: out_low = 9'h1e5;
              4'ha: out_low = 9'h1e5;
              4'hb: out_low = 9'h1e5;
              4'hc: out_low = 9'h1e5;
              4'hd: out_low = 9'h1e5;
              4'he: out_low = 9'h1e5;
              4'hf: out_low = 9'h1e4;
              default: out_low = 9'h000;
            endcase
          end
          6'h10: out_low = 9'h1e4;
          6'h11: out_low = 9'h1e4;
          6'h12: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1e4;
              4'h1: out_low = 9'h1e4;
              4'h2: out_low = 9'h1e4;
              4'h3: out_low = 9'h1e4;
              4'h4: out_low = 9'h1e4;
              4'h5: out_low = 9'h1e4;
              4'h6: out_low = 9'h1e4;
              4'h7: out_low = 9'h1e4;
              4'h8: out_low = 9'h1e4;
              4'h9: out_low = 9'h1e4;
              4'ha: out_low = 9'h1e4;
              4'hb: out_low = 9'h1e4;
              4'hc: out_low = 9'h1e4;
              4'hd: out_low = 9'h1e3;
              4'he: out_low = 9'h1e3;
              4'hf: out_low = 9'h1e3;
              default: out_low = 9'h000;
            endcase
          end
          6'h13: out_low = 9'h1e3;
          6'h14: out_low = 9'h1e3;
          6'h15: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1e3;
              4'h1: out_low = 9'h1e3;
              4'h2: out_low = 9'h1e3;
              4'h3: out_low = 9'h1e3;
              4'h4: out_low = 9'h1e3;
              4'h5: out_low = 9'h1e3;
              4'h6: out_low = 9'h1e3;
              4'h7: out_low = 9'h1e3;
              4'h8: out_low = 9'h1e3;
              4'h9: out_low = 9'h1e3;
              4'ha: out_low = 9'h1e3;
              4'hb: out_low = 9'h1e3;
              4'hc: out_low = 9'h1e2;
              4'hd: out_low = 9'h1e2;
              4'he: out_low = 9'h1e2;
              4'hf: out_low = 9'h1e2;
              default: out_low = 9'h000;
            endcase
          end
          6'h16: out_low = 9'h1e2;
          6'h17: out_low = 9'h1e2;
          6'h18: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1e2;
              4'h1: out_low = 9'h1e2;
              4'h2: out_low = 9'h1e2;
              4'h3: out_low = 9'h1e2;
              4'h4: out_low = 9'h1e2;
              4'h5: out_low = 9'h1e2;
              4'h6: out_low = 9'h1e2;
              4'h7: out_low = 9'h1e2;
              4'h8: out_low = 9'h1e2;
              4'h9: out_low = 9'h1e2;
              4'ha: out_low = 9'h1e2;
              4'hb: out_low = 9'h1e1;
              4'hc: out_low = 9'h1e1;
              4'hd: out_low = 9'h1e1;
              4'he: out_low = 9'h1e1;
              4'hf: out_low = 9'h1e1;
              default: out_low = 9'h000;
            endcase
          end
          6'h19: out_low = 9'h1e1;
          6'h1a: out_low = 9'h1e1;
          6'h1b: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1e1;
              4'h1: out_low = 9'h1e1;
              4'h2: out_low = 9'h1e1;
              4'h3: out_low = 9'h1e1;
              4'h4: out_low = 9'h1e1;
              4'h5: out_low = 9'h1e1;
              4'h6: out_low = 9'h1e1;
              4'h7: out_low = 9'h1e1;
              4'h8: out_low = 9'h1e1;
              4'h9: out_low = 9'h1e1;
              4'ha: out_low = 9'h1e0;
              4'hb: out_low = 9'h1e0;
              4'hc: out_low = 9'h1e0;
              4'hd: out_low = 9'h1e0;
              4'he: out_low = 9'h1e0;
              4'hf: out_low = 9'h1e0;
              default: out_low = 9'h000;
            endcase
          end
          6'h1c: out_low = 9'h1e0;
          6'h1d: out_low = 9'h1e0;
          6'h1e: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1e0;
              4'h1: out_low = 9'h1e0;
              4'h2: out_low = 9'h1e0;
              4'h3: out_low = 9'h1e0;
              4'h4: out_low = 9'h1e0;
              4'h5: out_low = 9'h1e0;
              4'h6: out_low = 9'h1e0;
              4'h7: out_low = 9'h1e0;
              4'h8: out_low = 9'h1e0;
              4'h9: out_low = 9'h1df;
              4'ha: out_low = 9'h1df;
              4'hb: out_low = 9'h1df;
              4'hc: out_low = 9'h1df;
              4'hd: out_low = 9'h1df;
              4'he: out_low = 9'h1df;
              4'hf: out_low = 9'h1df;
              default: out_low = 9'h000;
            endcase
          end
          6'h1f: out_low = 9'h1df;
          6'h20: out_low = 9'h1df;
          6'h21: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1df;
              4'h1: out_low = 9'h1df;
              4'h2: out_low = 9'h1df;
              4'h3: out_low = 9'h1df;
              4'h4: out_low = 9'h1df;
              4'h5: out_low = 9'h1df;
              4'h6: out_low = 9'h1df;
              4'h7: out_low = 9'h1df;
              4'h8: out_low = 9'h1de;
              4'h9: out_low = 9'h1de;
              4'ha: out_low = 9'h1de;
              4'hb: out_low = 9'h1de;
              4'hc: out_low = 9'h1de;
              4'hd: out_low = 9'h1de;
              4'he: out_low = 9'h1de;
              4'hf: out_low = 9'h1de;
              default: out_low = 9'h000;
            endcase
          end
          6'h22: out_low = 9'h1de;
          6'h23: out_low = 9'h1de;
          6'h24: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1de;
              4'h1: out_low = 9'h1de;
              4'h2: out_low = 9'h1de;
              4'h3: out_low = 9'h1de;
              4'h4: out_low = 9'h1de;
              4'h5: out_low = 9'h1de;
              4'h6: out_low = 9'h1de;
              4'h7: out_low = 9'h1dd;
              4'h8: out_low = 9'h1dd;
              4'h9: out_low = 9'h1dd;
              4'ha: out_low = 9'h1dd;
              4'hb: out_low = 9'h1dd;
              4'hc: out_low = 9'h1dd;
              4'hd: out_low = 9'h1dd;
              4'he: out_low = 9'h1dd;
              4'hf: out_low = 9'h1dd;
              default: out_low = 9'h000;
            endcase
          end
          6'h25: out_low = 9'h1dd;
          6'h26: out_low = 9'h1dd;
          6'h27: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1dd;
              4'h1: out_low = 9'h1dd;
              4'h2: out_low = 9'h1dd;
              4'h3: out_low = 9'h1dd;
              4'h4: out_low = 9'h1dd;
              4'h5: out_low = 9'h1dd;
              4'h6: out_low = 9'h1dc;
              4'h7: out_low = 9'h1dc;
              4'h8: out_low = 9'h1dc;
              4'h9: out_low = 9'h1dc;
              4'ha: out_low = 9'h1dc;
              4'hb: out_low = 9'h1dc;
              4'hc: out_low = 9'h1dc;
              4'hd: out_low = 9'h1dc;
              4'he: out_low = 9'h1dc;
              4'hf: out_low = 9'h1dc;
              default: out_low = 9'h000;
            endcase
          end
          6'h28: out_low = 9'h1dc;
          6'h29: out_low = 9'h1dc;
          6'h2a: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1dc;
              4'h1: out_low = 9'h1dc;
              4'h2: out_low = 9'h1dc;
              4'h3: out_low = 9'h1dc;
              4'h4: out_low = 9'h1dc;
              4'h5: out_low = 9'h1db;
              4'h6: out_low = 9'h1db;
              4'h7: out_low = 9'h1db;
              4'h8: out_low = 9'h1db;
              4'h9: out_low = 9'h1db;
              4'ha: out_low = 9'h1db;
              4'hb: out_low = 9'h1db;
              4'hc: out_low = 9'h1db;
              4'hd: out_low = 9'h1db;
              4'he: out_low = 9'h1db;
              4'hf: out_low = 9'h1db;
              default: out_low = 9'h000;
            endcase
          end
          6'h2b: out_low = 9'h1db;
          6'h2c: out_low = 9'h1db;
          6'h2d: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1db;
              4'h1: out_low = 9'h1db;
              4'h2: out_low = 9'h1db;
              4'h3: out_low = 9'h1db;
              4'h4: out_low = 9'h1da;
              4'h5: out_low = 9'h1da;
              4'h6: out_low = 9'h1da;
              4'h7: out_low = 9'h1da;
              4'h8: out_low = 9'h1da;
              4'h9: out_low = 9'h1da;
              4'ha: out_low = 9'h1da;
              4'hb: out_low = 9'h1da;
              4'hc: out_low = 9'h1da;
              4'hd: out_low = 9'h1da;
              4'he: out_low = 9'h1da;
              4'hf: out_low = 9'h1da;
              default: out_low = 9'h000;
            endcase
          end
          6'h2e: out_low = 9'h1da;
          6'h2f: out_low = 9'h1da;
          6'h30: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1da;
              4'h1: out_low = 9'h1da;
              4'h2: out_low = 9'h1da;
              4'h3: out_low = 9'h1d9;
              4'h4: out_low = 9'h1d9;
              4'h5: out_low = 9'h1d9;
              4'h6: out_low = 9'h1d9;
              4'h7: out_low = 9'h1d9;
              4'h8: out_low = 9'h1d9;
              4'h9: out_low = 9'h1d9;
              4'ha: out_low = 9'h1d9;
              4'hb: out_low = 9'h1d9;
              4'hc: out_low = 9'h1d9;
              4'hd: out_low = 9'h1d9;
              4'he: out_low = 9'h1d9;
              4'hf: out_low = 9'h1d9;
              default: out_low = 9'h000;
            endcase
          end
          6'h31: out_low = 9'h1d9;
          6'h32: out_low = 9'h1d9;
          6'h33: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1d9;
              4'h1: out_low = 9'h1d9;
              4'h2: out_low = 9'h1d8;
              4'h3: out_low = 9'h1d8;
              4'h4: out_low = 9'h1d8;
              4'h5: out_low = 9'h1d8;
              4'h6: out_low = 9'h1d8;
              4'h7: out_low = 9'h1d8;
              4'h8: out_low = 9'h1d8;
              4'h9: out_low = 9'h1d8;
              4'ha: out_low = 9'h1d8;
              4'hb: out_low = 9'h1d8;
              4'hc: out_low = 9'h1d8;
              4'hd: out_low = 9'h1d8;
              4'he: out_low = 9'h1d8;
              4'hf: out_low = 9'h1d8;
              default: out_low = 9'h000;
            endcase
          end
          6'h34: out_low = 9'h1d8;
          6'h35: out_low = 9'h1d8;
          6'h36: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1d8;
              4'h1: out_low = 9'h1d7;
              4'h2: out_low = 9'h1d7;
              4'h3: out_low = 9'h1d7;
              4'h4: out_low = 9'h1d7;
              4'h5: out_low = 9'h1d7;
              4'h6: out_low = 9'h1d7;
              4'h7: out_low = 9'h1d7;
              4'h8: out_low = 9'h1d7;
              4'h9: out_low = 9'h1d7;
              4'ha: out_low = 9'h1d7;
              4'hb: out_low = 9'h1d7;
              4'hc: out_low = 9'h1d7;
              4'hd: out_low = 9'h1d7;
              4'he: out_low = 9'h1d7;
              4'hf: out_low = 9'h1d7;
              default: out_low = 9'h000;
            endcase
          end
          6'h37: out_low = 9'h1d7;
          6'h38: out_low = 9'h1d7;
          6'h39: out_low = 9'h1d6;
          6'h3a: out_low = 9'h1d6;
          6'h3b: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1d6;
              4'h1: out_low = 9'h1d6;
              4'h2: out_low = 9'h1d6;
              4'h3: out_low = 9'h1d6;
              4'h4: out_low = 9'h1d6;
              4'h5: out_low = 9'h1d6;
              4'h6: out_low = 9'h1d6;
              4'h7: out_low = 9'h1d6;
              4'h8: out_low = 9'h1d6;
              4'h9: out_low = 9'h1d6;
              4'ha: out_low = 9'h1d6;
              4'hb: out_low = 9'h1d6;
              4'hc: out_low = 9'h1d6;
              4'hd: out_low = 9'h1d6;
              4'he: out_low = 9'h1d6;
              4'hf: out_low = 9'h1d5;
              default: out_low = 9'h000;
            endcase
          end
          6'h3c: out_low = 9'h1d5;
          6'h3d: out_low = 9'h1d5;
          6'h3e: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1d5;
              4'h1: out_low = 9'h1d5;
              4'h2: out_low = 9'h1d5;
              4'h3: out_low = 9'h1d5;
              4'h4: out_low = 9'h1d5;
              4'h5: out_low = 9'h1d5;
              4'h6: out_low = 9'h1d5;
              4'h7: out_low = 9'h1d5;
              4'h8: out_low = 9'h1d5;
              4'h9: out_low = 9'h1d5;
              4'ha: out_low = 9'h1d5;
              4'hb: out_low = 9'h1d5;
              4'hc: out_low = 9'h1d5;
              4'hd: out_low = 9'h1d5;
              4'he: out_low = 9'h1d4;
              4'hf: out_low = 9'h1d4;
              default: out_low = 9'h000;
            endcase
          end
          6'h3f: out_low = 9'h1d4;
          default: out_low = 9'h000;
        endcase
      end
      6'h2a: begin
        case (mant[9:4])
          6'h00: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1d4;
              4'h1: out_low = 9'h1d4;
              4'h2: out_low = 9'h1d4;
              4'h3: out_low = 9'h1d4;
              4'h4: out_low = 9'h1d4;
              4'h5: out_low = 9'h1d4;
              4'h6: out_low = 9'h1d4;
              4'h7: out_low = 9'h1d4;
              4'h8: out_low = 9'h1d4;
              4'h9: out_low = 9'h1d4;
              4'ha: out_low = 9'h1d4;
              4'hb: out_low = 9'h1d4;
              4'hc: out_low = 9'h1d4;
              4'hd: out_low = 9'h1d4;
              4'he: out_low = 9'h1d4;
              4'hf: out_low = 9'h1d3;
              default: out_low = 9'h000;
            endcase
          end
          6'h01: out_low = 9'h1d3;
          6'h02: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1d3;
              4'h1: out_low = 9'h1d3;
              4'h2: out_low = 9'h1d3;
              4'h3: out_low = 9'h1d3;
              4'h4: out_low = 9'h1d3;
              4'h5: out_low = 9'h1d3;
              4'h6: out_low = 9'h1d3;
              4'h7: out_low = 9'h1d2;
              4'h8: out_low = 9'h1d2;
              4'h9: out_low = 9'h1d2;
              4'ha: out_low = 9'h1d2;
              4'hb: out_low = 9'h1d2;
              4'hc: out_low = 9'h1d2;
              4'hd: out_low = 9'h1d2;
              4'he: out_low = 9'h1d2;
              4'hf: out_low = 9'h1d2;
              default: out_low = 9'h000;
            endcase
          end
          6'h03: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1d2;
              4'h1: out_low = 9'h1d2;
              4'h2: out_low = 9'h1d2;
              4'h3: out_low = 9'h1d2;
              4'h4: out_low = 9'h1d2;
              4'h5: out_low = 9'h1d2;
              4'h6: out_low = 9'h1d2;
              4'h7: out_low = 9'h1d2;
              4'h8: out_low = 9'h1d2;
              4'h9: out_low = 9'h1d2;
              4'ha: out_low = 9'h1d2;
              4'hb: out_low = 9'h1d2;
              4'hc: out_low = 9'h1d2;
              4'hd: out_low = 9'h1d2;
              4'he: out_low = 9'h1d1;
              4'hf: out_low = 9'h1d1;
              default: out_low = 9'h000;
            endcase
          end
          6'h04: out_low = 9'h1d1;
          6'h05: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1d1;
              4'h1: out_low = 9'h1d1;
              4'h2: out_low = 9'h1d1;
              4'h3: out_low = 9'h1d1;
              4'h4: out_low = 9'h1d1;
              4'h5: out_low = 9'h1d1;
              4'h6: out_low = 9'h1d0;
              4'h7: out_low = 9'h1d0;
              4'h8: out_low = 9'h1d0;
              4'h9: out_low = 9'h1d0;
              4'ha: out_low = 9'h1d0;
              4'hb: out_low = 9'h1d0;
              4'hc: out_low = 9'h1d0;
              4'hd: out_low = 9'h1d0;
              4'he: out_low = 9'h1d0;
              4'hf: out_low = 9'h1d0;
              default: out_low = 9'h000;
            endcase
          end
          6'h06: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1d0;
              4'h1: out_low = 9'h1d0;
              4'h2: out_low = 9'h1d0;
              4'h3: out_low = 9'h1d0;
              4'h4: out_low = 9'h1d0;
              4'h5: out_low = 9'h1d0;
              4'h6: out_low = 9'h1d0;
              4'h7: out_low = 9'h1d0;
              4'h8: out_low = 9'h1d0;
              4'h9: out_low = 9'h1d0;
              4'ha: out_low = 9'h1d0;
              4'hb: out_low = 9'h1d0;
              4'hc: out_low = 9'h1d0;
              4'hd: out_low = 9'h1d0;
              4'he: out_low = 9'h1cf;
              4'hf: out_low = 9'h1cf;
              default: out_low = 9'h000;
            endcase
          end
          6'h07: out_low = 9'h1cf;
          6'h08: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1cf;
              4'h1: out_low = 9'h1cf;
              4'h2: out_low = 9'h1cf;
              4'h3: out_low = 9'h1cf;
              4'h4: out_low = 9'h1cf;
              4'h5: out_low = 9'h1ce;
              4'h6: out_low = 9'h1ce;
              4'h7: out_low = 9'h1ce;
              4'h8: out_low = 9'h1ce;
              4'h9: out_low = 9'h1ce;
              4'ha: out_low = 9'h1ce;
              4'hb: out_low = 9'h1ce;
              4'hc: out_low = 9'h1ce;
              4'hd: out_low = 9'h1ce;
              4'he: out_low = 9'h1ce;
              4'hf: out_low = 9'h1ce;
              default: out_low = 9'h000;
            endcase
          end
          6'h09: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1ce;
              4'h1: out_low = 9'h1ce;
              4'h2: out_low = 9'h1ce;
              4'h3: out_low = 9'h1ce;
              4'h4: out_low = 9'h1ce;
              4'h5: out_low = 9'h1ce;
              4'h6: out_low = 9'h1ce;
              4'h7: out_low = 9'h1ce;
              4'h8: out_low = 9'h1ce;
              4'h9: out_low = 9'h1ce;
              4'ha: out_low = 9'h1ce;
              4'hb: out_low = 9'h1ce;
              4'hc: out_low = 9'h1ce;
              4'hd: out_low = 9'h1cd;
              4'he: out_low = 9'h1cd;
              4'hf: out_low = 9'h1cd;
              default: out_low = 9'h000;
            endcase
          end
          6'h0a: out_low = 9'h1cd;
          6'h0b: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1cd;
              4'h1: out_low = 9'h1cd;
              4'h2: out_low = 9'h1cd;
              4'h3: out_low = 9'h1cd;
              4'h4: out_low = 9'h1cc;
              4'h5: out_low = 9'h1cc;
              4'h6: out_low = 9'h1cc;
              4'h7: out_low = 9'h1cc;
              4'h8: out_low = 9'h1cc;
              4'h9: out_low = 9'h1cc;
              4'ha: out_low = 9'h1cc;
              4'hb: out_low = 9'h1cc;
              4'hc: out_low = 9'h1cc;
              4'hd: out_low = 9'h1cc;
              4'he: out_low = 9'h1cc;
              4'hf: out_low = 9'h1cc;
              default: out_low = 9'h000;
            endcase
          end
          6'h0c: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1cc;
              4'h1: out_low = 9'h1cc;
              4'h2: out_low = 9'h1cc;
              4'h3: out_low = 9'h1cc;
              4'h4: out_low = 9'h1cc;
              4'h5: out_low = 9'h1cc;
              4'h6: out_low = 9'h1cc;
              4'h7: out_low = 9'h1cc;
              4'h8: out_low = 9'h1cc;
              4'h9: out_low = 9'h1cc;
              4'ha: out_low = 9'h1cc;
              4'hb: out_low = 9'h1cc;
              4'hc: out_low = 9'h1cb;
              4'hd: out_low = 9'h1cb;
              4'he: out_low = 9'h1cb;
              4'hf: out_low = 9'h1cb;
              default: out_low = 9'h000;
            endcase
          end
          6'h0d: out_low = 9'h1cb;
          6'h0e: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1cb;
              4'h1: out_low = 9'h1cb;
              4'h2: out_low = 9'h1cb;
              4'h3: out_low = 9'h1cb;
              4'h4: out_low = 9'h1ca;
              4'h5: out_low = 9'h1ca;
              4'h6: out_low = 9'h1ca;
              4'h7: out_low = 9'h1ca;
              4'h8: out_low = 9'h1ca;
              4'h9: out_low = 9'h1ca;
              4'ha: out_low = 9'h1ca;
              4'hb: out_low = 9'h1ca;
              4'hc: out_low = 9'h1ca;
              4'hd: out_low = 9'h1ca;
              4'he: out_low = 9'h1ca;
              4'hf: out_low = 9'h1ca;
              default: out_low = 9'h000;
            endcase
          end
          6'h0f: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1ca;
              4'h1: out_low = 9'h1ca;
              4'h2: out_low = 9'h1ca;
              4'h3: out_low = 9'h1ca;
              4'h4: out_low = 9'h1ca;
              4'h5: out_low = 9'h1ca;
              4'h6: out_low = 9'h1ca;
              4'h7: out_low = 9'h1ca;
              4'h8: out_low = 9'h1ca;
              4'h9: out_low = 9'h1ca;
              4'ha: out_low = 9'h1ca;
              4'hb: out_low = 9'h1ca;
              4'hc: out_low = 9'h1c9;
              4'hd: out_low = 9'h1c9;
              4'he: out_low = 9'h1c9;
              4'hf: out_low = 9'h1c9;
              default: out_low = 9'h000;
            endcase
          end
          6'h10: out_low = 9'h1c9;
          6'h11: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1c9;
              4'h1: out_low = 9'h1c9;
              4'h2: out_low = 9'h1c9;
              4'h3: out_low = 9'h1c8;
              4'h4: out_low = 9'h1c8;
              4'h5: out_low = 9'h1c8;
              4'h6: out_low = 9'h1c8;
              4'h7: out_low = 9'h1c8;
              4'h8: out_low = 9'h1c8;
              4'h9: out_low = 9'h1c8;
              4'ha: out_low = 9'h1c8;
              4'hb: out_low = 9'h1c8;
              4'hc: out_low = 9'h1c8;
              4'hd: out_low = 9'h1c8;
              4'he: out_low = 9'h1c8;
              4'hf: out_low = 9'h1c8;
              default: out_low = 9'h000;
            endcase
          end
          6'h12: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1c8;
              4'h1: out_low = 9'h1c8;
              4'h2: out_low = 9'h1c8;
              4'h3: out_low = 9'h1c8;
              4'h4: out_low = 9'h1c8;
              4'h5: out_low = 9'h1c8;
              4'h6: out_low = 9'h1c8;
              4'h7: out_low = 9'h1c8;
              4'h8: out_low = 9'h1c8;
              4'h9: out_low = 9'h1c8;
              4'ha: out_low = 9'h1c8;
              4'hb: out_low = 9'h1c7;
              4'hc: out_low = 9'h1c7;
              4'hd: out_low = 9'h1c7;
              4'he: out_low = 9'h1c7;
              4'hf: out_low = 9'h1c7;
              default: out_low = 9'h000;
            endcase
          end
          6'h13: out_low = 9'h1c7;
          6'h14: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1c7;
              4'h1: out_low = 9'h1c7;
              4'h2: out_low = 9'h1c7;
              4'h3: out_low = 9'h1c6;
              4'h4: out_low = 9'h1c6;
              4'h5: out_low = 9'h1c6;
              4'h6: out_low = 9'h1c6;
              4'h7: out_low = 9'h1c6;
              4'h8: out_low = 9'h1c6;
              4'h9: out_low = 9'h1c6;
              4'ha: out_low = 9'h1c6;
              4'hb: out_low = 9'h1c6;
              4'hc: out_low = 9'h1c6;
              4'hd: out_low = 9'h1c6;
              4'he: out_low = 9'h1c6;
              4'hf: out_low = 9'h1c6;
              default: out_low = 9'h000;
            endcase
          end
          6'h15: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1c6;
              4'h1: out_low = 9'h1c6;
              4'h2: out_low = 9'h1c6;
              4'h3: out_low = 9'h1c6;
              4'h4: out_low = 9'h1c6;
              4'h5: out_low = 9'h1c6;
              4'h6: out_low = 9'h1c6;
              4'h7: out_low = 9'h1c6;
              4'h8: out_low = 9'h1c6;
              4'h9: out_low = 9'h1c6;
              4'ha: out_low = 9'h1c6;
              4'hb: out_low = 9'h1c5;
              4'hc: out_low = 9'h1c5;
              4'hd: out_low = 9'h1c5;
              4'he: out_low = 9'h1c5;
              4'hf: out_low = 9'h1c5;
              default: out_low = 9'h000;
            endcase
          end
          6'h16: out_low = 9'h1c5;
          6'h17: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1c5;
              4'h1: out_low = 9'h1c5;
              4'h2: out_low = 9'h1c4;
              4'h3: out_low = 9'h1c4;
              4'h4: out_low = 9'h1c4;
              4'h5: out_low = 9'h1c4;
              4'h6: out_low = 9'h1c4;
              4'h7: out_low = 9'h1c4;
              4'h8: out_low = 9'h1c4;
              4'h9: out_low = 9'h1c4;
              4'ha: out_low = 9'h1c4;
              4'hb: out_low = 9'h1c4;
              4'hc: out_low = 9'h1c4;
              4'hd: out_low = 9'h1c4;
              4'he: out_low = 9'h1c4;
              4'hf: out_low = 9'h1c4;
              default: out_low = 9'h000;
            endcase
          end
          6'h18: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1c4;
              4'h1: out_low = 9'h1c4;
              4'h2: out_low = 9'h1c4;
              4'h3: out_low = 9'h1c4;
              4'h4: out_low = 9'h1c4;
              4'h5: out_low = 9'h1c4;
              4'h6: out_low = 9'h1c4;
              4'h7: out_low = 9'h1c4;
              4'h8: out_low = 9'h1c4;
              4'h9: out_low = 9'h1c4;
              4'ha: out_low = 9'h1c3;
              4'hb: out_low = 9'h1c3;
              4'hc: out_low = 9'h1c3;
              4'hd: out_low = 9'h1c3;
              4'he: out_low = 9'h1c3;
              4'hf: out_low = 9'h1c3;
              default: out_low = 9'h000;
            endcase
          end
          6'h19: out_low = 9'h1c3;
          6'h1a: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1c3;
              4'h1: out_low = 9'h1c3;
              4'h2: out_low = 9'h1c2;
              4'h3: out_low = 9'h1c2;
              4'h4: out_low = 9'h1c2;
              4'h5: out_low = 9'h1c2;
              4'h6: out_low = 9'h1c2;
              4'h7: out_low = 9'h1c2;
              4'h8: out_low = 9'h1c2;
              4'h9: out_low = 9'h1c2;
              4'ha: out_low = 9'h1c2;
              4'hb: out_low = 9'h1c2;
              4'hc: out_low = 9'h1c2;
              4'hd: out_low = 9'h1c2;
              4'he: out_low = 9'h1c2;
              4'hf: out_low = 9'h1c2;
              default: out_low = 9'h000;
            endcase
          end
          6'h1b: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1c2;
              4'h1: out_low = 9'h1c2;
              4'h2: out_low = 9'h1c2;
              4'h3: out_low = 9'h1c2;
              4'h4: out_low = 9'h1c2;
              4'h5: out_low = 9'h1c2;
              4'h6: out_low = 9'h1c2;
              4'h7: out_low = 9'h1c2;
              4'h8: out_low = 9'h1c2;
              4'h9: out_low = 9'h1c2;
              4'ha: out_low = 9'h1c1;
              4'hb: out_low = 9'h1c1;
              4'hc: out_low = 9'h1c1;
              4'hd: out_low = 9'h1c1;
              4'he: out_low = 9'h1c1;
              4'hf: out_low = 9'h1c1;
              default: out_low = 9'h000;
            endcase
          end
          6'h1c: out_low = 9'h1c1;
          6'h1d: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1c1;
              4'h1: out_low = 9'h1c0;
              4'h2: out_low = 9'h1c0;
              4'h3: out_low = 9'h1c0;
              4'h4: out_low = 9'h1c0;
              4'h5: out_low = 9'h1c0;
              4'h6: out_low = 9'h1c0;
              4'h7: out_low = 9'h1c0;
              4'h8: out_low = 9'h1c0;
              4'h9: out_low = 9'h1c0;
              4'ha: out_low = 9'h1c0;
              4'hb: out_low = 9'h1c0;
              4'hc: out_low = 9'h1c0;
              4'hd: out_low = 9'h1c0;
              4'he: out_low = 9'h1c0;
              4'hf: out_low = 9'h1c0;
              default: out_low = 9'h000;
            endcase
          end
          6'h1e: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1c0;
              4'h1: out_low = 9'h1c0;
              4'h2: out_low = 9'h1c0;
              4'h3: out_low = 9'h1c0;
              4'h4: out_low = 9'h1c0;
              4'h5: out_low = 9'h1c0;
              4'h6: out_low = 9'h1c0;
              4'h7: out_low = 9'h1c0;
              4'h8: out_low = 9'h1c0;
              4'h9: out_low = 9'h1bf;
              4'ha: out_low = 9'h1bf;
              4'hb: out_low = 9'h1bf;
              4'hc: out_low = 9'h1bf;
              4'hd: out_low = 9'h1bf;
              4'he: out_low = 9'h1bf;
              4'hf: out_low = 9'h1bf;
              default: out_low = 9'h000;
            endcase
          end
          6'h1f: out_low = 9'h1bf;
          6'h20: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1bf;
              4'h1: out_low = 9'h1be;
              4'h2: out_low = 9'h1be;
              4'h3: out_low = 9'h1be;
              4'h4: out_low = 9'h1be;
              4'h5: out_low = 9'h1be;
              4'h6: out_low = 9'h1be;
              4'h7: out_low = 9'h1be;
              4'h8: out_low = 9'h1be;
              4'h9: out_low = 9'h1be;
              4'ha: out_low = 9'h1be;
              4'hb: out_low = 9'h1be;
              4'hc: out_low = 9'h1be;
              4'hd: out_low = 9'h1be;
              4'he: out_low = 9'h1be;
              4'hf: out_low = 9'h1be;
              default: out_low = 9'h000;
            endcase
          end
          6'h21: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1be;
              4'h1: out_low = 9'h1be;
              4'h2: out_low = 9'h1be;
              4'h3: out_low = 9'h1be;
              4'h4: out_low = 9'h1be;
              4'h5: out_low = 9'h1be;
              4'h6: out_low = 9'h1be;
              4'h7: out_low = 9'h1be;
              4'h8: out_low = 9'h1be;
              4'h9: out_low = 9'h1bd;
              4'ha: out_low = 9'h1bd;
              4'hb: out_low = 9'h1bd;
              4'hc: out_low = 9'h1bd;
              4'hd: out_low = 9'h1bd;
              4'he: out_low = 9'h1bd;
              4'hf: out_low = 9'h1bd;
              default: out_low = 9'h000;
            endcase
          end
          6'h22: out_low = 9'h1bd;
          6'h23: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1bd;
              4'h1: out_low = 9'h1bc;
              4'h2: out_low = 9'h1bc;
              4'h3: out_low = 9'h1bc;
              4'h4: out_low = 9'h1bc;
              4'h5: out_low = 9'h1bc;
              4'h6: out_low = 9'h1bc;
              4'h7: out_low = 9'h1bc;
              4'h8: out_low = 9'h1bc;
              4'h9: out_low = 9'h1bc;
              4'ha: out_low = 9'h1bc;
              4'hb: out_low = 9'h1bc;
              4'hc: out_low = 9'h1bc;
              4'hd: out_low = 9'h1bc;
              4'he: out_low = 9'h1bc;
              4'hf: out_low = 9'h1bc;
              default: out_low = 9'h000;
            endcase
          end
          6'h24: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1bc;
              4'h1: out_low = 9'h1bc;
              4'h2: out_low = 9'h1bc;
              4'h3: out_low = 9'h1bc;
              4'h4: out_low = 9'h1bc;
              4'h5: out_low = 9'h1bc;
              4'h6: out_low = 9'h1bc;
              4'h7: out_low = 9'h1bc;
              4'h8: out_low = 9'h1bc;
              4'h9: out_low = 9'h1bb;
              4'ha: out_low = 9'h1bb;
              4'hb: out_low = 9'h1bb;
              4'hc: out_low = 9'h1bb;
              4'hd: out_low = 9'h1bb;
              4'he: out_low = 9'h1bb;
              4'hf: out_low = 9'h1bb;
              default: out_low = 9'h000;
            endcase
          end
          6'h25: out_low = 9'h1bb;
          6'h26: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1bb;
              4'h1: out_low = 9'h1ba;
              4'h2: out_low = 9'h1ba;
              4'h3: out_low = 9'h1ba;
              4'h4: out_low = 9'h1ba;
              4'h5: out_low = 9'h1ba;
              4'h6: out_low = 9'h1ba;
              4'h7: out_low = 9'h1ba;
              4'h8: out_low = 9'h1ba;
              4'h9: out_low = 9'h1ba;
              4'ha: out_low = 9'h1ba;
              4'hb: out_low = 9'h1ba;
              4'hc: out_low = 9'h1ba;
              4'hd: out_low = 9'h1ba;
              4'he: out_low = 9'h1ba;
              4'hf: out_low = 9'h1ba;
              default: out_low = 9'h000;
            endcase
          end
          6'h27: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1ba;
              4'h1: out_low = 9'h1ba;
              4'h2: out_low = 9'h1ba;
              4'h3: out_low = 9'h1ba;
              4'h4: out_low = 9'h1ba;
              4'h5: out_low = 9'h1ba;
              4'h6: out_low = 9'h1ba;
              4'h7: out_low = 9'h1ba;
              4'h8: out_low = 9'h1ba;
              4'h9: out_low = 9'h1b9;
              4'ha: out_low = 9'h1b9;
              4'hb: out_low = 9'h1b9;
              4'hc: out_low = 9'h1b9;
              4'hd: out_low = 9'h1b9;
              4'he: out_low = 9'h1b9;
              4'hf: out_low = 9'h1b9;
              default: out_low = 9'h000;
            endcase
          end
          6'h28: out_low = 9'h1b9;
          6'h29: out_low = 9'h1b8;
          6'h2a: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1b8;
              4'h1: out_low = 9'h1b8;
              4'h2: out_low = 9'h1b8;
              4'h3: out_low = 9'h1b8;
              4'h4: out_low = 9'h1b8;
              4'h5: out_low = 9'h1b8;
              4'h6: out_low = 9'h1b8;
              4'h7: out_low = 9'h1b8;
              4'h8: out_low = 9'h1b7;
              4'h9: out_low = 9'h1b7;
              4'ha: out_low = 9'h1b7;
              4'hb: out_low = 9'h1b7;
              4'hc: out_low = 9'h1b7;
              4'hd: out_low = 9'h1b7;
              4'he: out_low = 9'h1b7;
              4'hf: out_low = 9'h1b7;
              default: out_low = 9'h000;
            endcase
          end
          6'h2b: out_low = 9'h1b7;
          6'h2c: out_low = 9'h1b6;
          6'h2d: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1b6;
              4'h1: out_low = 9'h1b6;
              4'h2: out_low = 9'h1b6;
              4'h3: out_low = 9'h1b6;
              4'h4: out_low = 9'h1b6;
              4'h5: out_low = 9'h1b6;
              4'h6: out_low = 9'h1b6;
              4'h7: out_low = 9'h1b6;
              4'h8: out_low = 9'h1b5;
              4'h9: out_low = 9'h1b5;
              4'ha: out_low = 9'h1b5;
              4'hb: out_low = 9'h1b5;
              4'hc: out_low = 9'h1b5;
              4'hd: out_low = 9'h1b5;
              4'he: out_low = 9'h1b5;
              4'hf: out_low = 9'h1b5;
              default: out_low = 9'h000;
            endcase
          end
          6'h2e: out_low = 9'h1b5;
          6'h2f: out_low = 9'h1b4;
          6'h30: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1b4;
              4'h1: out_low = 9'h1b4;
              4'h2: out_low = 9'h1b4;
              4'h3: out_low = 9'h1b4;
              4'h4: out_low = 9'h1b4;
              4'h5: out_low = 9'h1b4;
              4'h6: out_low = 9'h1b4;
              4'h7: out_low = 9'h1b4;
              4'h8: out_low = 9'h1b3;
              4'h9: out_low = 9'h1b3;
              4'ha: out_low = 9'h1b3;
              4'hb: out_low = 9'h1b3;
              4'hc: out_low = 9'h1b3;
              4'hd: out_low = 9'h1b3;
              4'he: out_low = 9'h1b3;
              4'hf: out_low = 9'h1b3;
              default: out_low = 9'h000;
            endcase
          end
          6'h31: out_low = 9'h1b3;
          6'h32: out_low = 9'h1b2;
          6'h33: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1b2;
              4'h1: out_low = 9'h1b2;
              4'h2: out_low = 9'h1b2;
              4'h3: out_low = 9'h1b2;
              4'h4: out_low = 9'h1b2;
              4'h5: out_low = 9'h1b2;
              4'h6: out_low = 9'h1b2;
              4'h7: out_low = 9'h1b2;
              4'h8: out_low = 9'h1b1;
              4'h9: out_low = 9'h1b1;
              4'ha: out_low = 9'h1b1;
              4'hb: out_low = 9'h1b1;
              4'hc: out_low = 9'h1b1;
              4'hd: out_low = 9'h1b1;
              4'he: out_low = 9'h1b1;
              4'hf: out_low = 9'h1b1;
              default: out_low = 9'h000;
            endcase
          end
          6'h34: out_low = 9'h1b1;
          6'h35: out_low = 9'h1b0;
          6'h36: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1b0;
              4'h1: out_low = 9'h1b0;
              4'h2: out_low = 9'h1b0;
              4'h3: out_low = 9'h1b0;
              4'h4: out_low = 9'h1b0;
              4'h5: out_low = 9'h1b0;
              4'h6: out_low = 9'h1b0;
              4'h7: out_low = 9'h1b0;
              4'h8: out_low = 9'h1af;
              4'h9: out_low = 9'h1af;
              4'ha: out_low = 9'h1af;
              4'hb: out_low = 9'h1af;
              4'hc: out_low = 9'h1af;
              4'hd: out_low = 9'h1af;
              4'he: out_low = 9'h1af;
              4'hf: out_low = 9'h1af;
              default: out_low = 9'h000;
            endcase
          end
          6'h37: out_low = 9'h1af;
          6'h38: out_low = 9'h1ae;
          6'h39: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1ae;
              4'h1: out_low = 9'h1ae;
              4'h2: out_low = 9'h1ae;
              4'h3: out_low = 9'h1ae;
              4'h4: out_low = 9'h1ae;
              4'h5: out_low = 9'h1ae;
              4'h6: out_low = 9'h1ae;
              4'h7: out_low = 9'h1ae;
              4'h8: out_low = 9'h1ad;
              4'h9: out_low = 9'h1ad;
              4'ha: out_low = 9'h1ad;
              4'hb: out_low = 9'h1ad;
              4'hc: out_low = 9'h1ad;
              4'hd: out_low = 9'h1ad;
              4'he: out_low = 9'h1ad;
              4'hf: out_low = 9'h1ad;
              default: out_low = 9'h000;
            endcase
          end
          6'h3a: out_low = 9'h1ad;
          6'h3b: out_low = 9'h1ac;
          6'h3c: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1ac;
              4'h1: out_low = 9'h1ac;
              4'h2: out_low = 9'h1ac;
              4'h3: out_low = 9'h1ac;
              4'h4: out_low = 9'h1ac;
              4'h5: out_low = 9'h1ac;
              4'h6: out_low = 9'h1ac;
              4'h7: out_low = 9'h1ac;
              4'h8: out_low = 9'h1ab;
              4'h9: out_low = 9'h1ab;
              4'ha: out_low = 9'h1ab;
              4'hb: out_low = 9'h1ab;
              4'hc: out_low = 9'h1ab;
              4'hd: out_low = 9'h1ab;
              4'he: out_low = 9'h1ab;
              4'hf: out_low = 9'h1ab;
              default: out_low = 9'h000;
            endcase
          end
          6'h3d: out_low = 9'h1ab;
          6'h3e: out_low = 9'h1aa;
          6'h3f: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1aa;
              4'h1: out_low = 9'h1aa;
              4'h2: out_low = 9'h1aa;
              4'h3: out_low = 9'h1aa;
              4'h4: out_low = 9'h1aa;
              4'h5: out_low = 9'h1aa;
              4'h6: out_low = 9'h1aa;
              4'h7: out_low = 9'h1aa;
              4'h8: out_low = 9'h1aa;
              4'h9: out_low = 9'h1a9;
              4'ha: out_low = 9'h1a9;
              4'hb: out_low = 9'h1a9;
              4'hc: out_low = 9'h1a9;
              4'hd: out_low = 9'h1a9;
              4'he: out_low = 9'h1a9;
              4'hf: out_low = 9'h1a9;
              default: out_low = 9'h000;
            endcase
          end
          default: out_low = 9'h000;
        endcase
      end
      6'h2b: begin
        case (mant[9:4])
          6'h00: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1a9;
              4'h1: out_low = 9'h1a9;
              4'h2: out_low = 9'h1a9;
              4'h3: out_low = 9'h1a9;
              4'h4: out_low = 9'h1a9;
              4'h5: out_low = 9'h1a9;
              4'h6: out_low = 9'h1a9;
              4'h7: out_low = 9'h1a9;
              4'h8: out_low = 9'h1a9;
              4'h9: out_low = 9'h1a8;
              4'ha: out_low = 9'h1a8;
              4'hb: out_low = 9'h1a8;
              4'hc: out_low = 9'h1a8;
              4'hd: out_low = 9'h1a8;
              4'he: out_low = 9'h1a8;
              4'hf: out_low = 9'h1a8;
              default: out_low = 9'h000;
            endcase
          end
          6'h01: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1a8;
              4'h1: out_low = 9'h1a8;
              4'h2: out_low = 9'h1a8;
              4'h3: out_low = 9'h1a8;
              4'h4: out_low = 9'h1a8;
              4'h5: out_low = 9'h1a7;
              4'h6: out_low = 9'h1a7;
              4'h7: out_low = 9'h1a7;
              4'h8: out_low = 9'h1a7;
              4'h9: out_low = 9'h1a7;
              4'ha: out_low = 9'h1a7;
              4'hb: out_low = 9'h1a7;
              4'hc: out_low = 9'h1a7;
              4'hd: out_low = 9'h1a7;
              4'he: out_low = 9'h1a7;
              4'hf: out_low = 9'h1a7;
              default: out_low = 9'h000;
            endcase
          end
          6'h02: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1a7;
              4'h1: out_low = 9'h1a6;
              4'h2: out_low = 9'h1a6;
              4'h3: out_low = 9'h1a6;
              4'h4: out_low = 9'h1a6;
              4'h5: out_low = 9'h1a6;
              4'h6: out_low = 9'h1a6;
              4'h7: out_low = 9'h1a6;
              4'h8: out_low = 9'h1a6;
              4'h9: out_low = 9'h1a6;
              4'ha: out_low = 9'h1a6;
              4'hb: out_low = 9'h1a6;
              4'hc: out_low = 9'h1a6;
              4'hd: out_low = 9'h1a5;
              4'he: out_low = 9'h1a5;
              4'hf: out_low = 9'h1a5;
              default: out_low = 9'h000;
            endcase
          end
          6'h03: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1a5;
              4'h1: out_low = 9'h1a5;
              4'h2: out_low = 9'h1a5;
              4'h3: out_low = 9'h1a5;
              4'h4: out_low = 9'h1a5;
              4'h5: out_low = 9'h1a5;
              4'h6: out_low = 9'h1a5;
              4'h7: out_low = 9'h1a5;
              4'h8: out_low = 9'h1a5;
              4'h9: out_low = 9'h1a4;
              4'ha: out_low = 9'h1a4;
              4'hb: out_low = 9'h1a4;
              4'hc: out_low = 9'h1a4;
              4'hd: out_low = 9'h1a4;
              4'he: out_low = 9'h1a4;
              4'hf: out_low = 9'h1a4;
              default: out_low = 9'h000;
            endcase
          end
          6'h04: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1a4;
              4'h1: out_low = 9'h1a4;
              4'h2: out_low = 9'h1a4;
              4'h3: out_low = 9'h1a4;
              4'h4: out_low = 9'h1a4;
              4'h5: out_low = 9'h1a3;
              4'h6: out_low = 9'h1a3;
              4'h7: out_low = 9'h1a3;
              4'h8: out_low = 9'h1a3;
              4'h9: out_low = 9'h1a3;
              4'ha: out_low = 9'h1a3;
              4'hb: out_low = 9'h1a3;
              4'hc: out_low = 9'h1a3;
              4'hd: out_low = 9'h1a3;
              4'he: out_low = 9'h1a3;
              4'hf: out_low = 9'h1a3;
              default: out_low = 9'h000;
            endcase
          end
          6'h05: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1a3;
              4'h1: out_low = 9'h1a2;
              4'h2: out_low = 9'h1a2;
              4'h3: out_low = 9'h1a2;
              4'h4: out_low = 9'h1a2;
              4'h5: out_low = 9'h1a2;
              4'h6: out_low = 9'h1a2;
              4'h7: out_low = 9'h1a2;
              4'h8: out_low = 9'h1a2;
              4'h9: out_low = 9'h1a2;
              4'ha: out_low = 9'h1a2;
              4'hb: out_low = 9'h1a2;
              4'hc: out_low = 9'h1a2;
              4'hd: out_low = 9'h1a1;
              4'he: out_low = 9'h1a1;
              4'hf: out_low = 9'h1a1;
              default: out_low = 9'h000;
            endcase
          end
          6'h06: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1a1;
              4'h1: out_low = 9'h1a1;
              4'h2: out_low = 9'h1a1;
              4'h3: out_low = 9'h1a1;
              4'h4: out_low = 9'h1a1;
              4'h5: out_low = 9'h1a1;
              4'h6: out_low = 9'h1a1;
              4'h7: out_low = 9'h1a1;
              4'h8: out_low = 9'h1a1;
              4'h9: out_low = 9'h1a0;
              4'ha: out_low = 9'h1a0;
              4'hb: out_low = 9'h1a0;
              4'hc: out_low = 9'h1a0;
              4'hd: out_low = 9'h1a0;
              4'he: out_low = 9'h1a0;
              4'hf: out_low = 9'h1a0;
              default: out_low = 9'h000;
            endcase
          end
          6'h07: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1a0;
              4'h1: out_low = 9'h1a0;
              4'h2: out_low = 9'h1a0;
              4'h3: out_low = 9'h1a0;
              4'h4: out_low = 9'h1a0;
              4'h5: out_low = 9'h19f;
              4'h6: out_low = 9'h19f;
              4'h7: out_low = 9'h19f;
              4'h8: out_low = 9'h19f;
              4'h9: out_low = 9'h19f;
              4'ha: out_low = 9'h19f;
              4'hb: out_low = 9'h19f;
              4'hc: out_low = 9'h19f;
              4'hd: out_low = 9'h19f;
              4'he: out_low = 9'h19f;
              4'hf: out_low = 9'h19f;
              default: out_low = 9'h000;
            endcase
          end
          6'h08: begin
            case (mant[3:0])
              4'h0: out_low = 9'h19f;
              4'h1: out_low = 9'h19e;
              4'h2: out_low = 9'h19e;
              4'h3: out_low = 9'h19e;
              4'h4: out_low = 9'h19e;
              4'h5: out_low = 9'h19e;
              4'h6: out_low = 9'h19e;
              4'h7: out_low = 9'h19e;
              4'h8: out_low = 9'h19e;
              4'h9: out_low = 9'h19e;
              4'ha: out_low = 9'h19e;
              4'hb: out_low = 9'h19e;
              4'hc: out_low = 9'h19e;
              4'hd: out_low = 9'h19e;
              4'he: out_low = 9'h19d;
              4'hf: out_low = 9'h19d;
              default: out_low = 9'h000;
            endcase
          end
          6'h09: begin
            case (mant[3:0])
              4'h0: out_low = 9'h19d;
              4'h1: out_low = 9'h19d;
              4'h2: out_low = 9'h19d;
              4'h3: out_low = 9'h19d;
              4'h4: out_low = 9'h19d;
              4'h5: out_low = 9'h19d;
              4'h6: out_low = 9'h19d;
              4'h7: out_low = 9'h19d;
              4'h8: out_low = 9'h19d;
              4'h9: out_low = 9'h19d;
              4'ha: out_low = 9'h19c;
              4'hb: out_low = 9'h19c;
              4'hc: out_low = 9'h19c;
              4'hd: out_low = 9'h19c;
              4'he: out_low = 9'h19c;
              4'hf: out_low = 9'h19c;
              default: out_low = 9'h000;
            endcase
          end
          6'h0a: begin
            case (mant[3:0])
              4'h0: out_low = 9'h19c;
              4'h1: out_low = 9'h19c;
              4'h2: out_low = 9'h19c;
              4'h3: out_low = 9'h19c;
              4'h4: out_low = 9'h19c;
              4'h5: out_low = 9'h19c;
              4'h6: out_low = 9'h19b;
              4'h7: out_low = 9'h19b;
              4'h8: out_low = 9'h19b;
              4'h9: out_low = 9'h19b;
              4'ha: out_low = 9'h19b;
              4'hb: out_low = 9'h19b;
              4'hc: out_low = 9'h19b;
              4'hd: out_low = 9'h19b;
              4'he: out_low = 9'h19b;
              4'hf: out_low = 9'h19b;
              default: out_low = 9'h000;
            endcase
          end
          6'h0b: begin
            case (mant[3:0])
              4'h0: out_low = 9'h19b;
              4'h1: out_low = 9'h19b;
              4'h2: out_low = 9'h19a;
              4'h3: out_low = 9'h19a;
              4'h4: out_low = 9'h19a;
              4'h5: out_low = 9'h19a;
              4'h6: out_low = 9'h19a;
              4'h7: out_low = 9'h19a;
              4'h8: out_low = 9'h19a;
              4'h9: out_low = 9'h19a;
              4'ha: out_low = 9'h19a;
              4'hb: out_low = 9'h19a;
              4'hc: out_low = 9'h19a;
              4'hd: out_low = 9'h19a;
              4'he: out_low = 9'h199;
              4'hf: out_low = 9'h199;
              default: out_low = 9'h000;
            endcase
          end
          6'h0c: begin
            case (mant[3:0])
              4'h0: out_low = 9'h199;
              4'h1: out_low = 9'h199;
              4'h2: out_low = 9'h199;
              4'h3: out_low = 9'h199;
              4'h4: out_low = 9'h199;
              4'h5: out_low = 9'h199;
              4'h6: out_low = 9'h199;
              4'h7: out_low = 9'h199;
              4'h8: out_low = 9'h199;
              4'h9: out_low = 9'h199;
              4'ha: out_low = 9'h198;
              4'hb: out_low = 9'h198;
              4'hc: out_low = 9'h198;
              4'hd: out_low = 9'h198;
              4'he: out_low = 9'h198;
              4'hf: out_low = 9'h198;
              default: out_low = 9'h000;
            endcase
          end
          6'h0d: begin
            case (mant[3:0])
              4'h0: out_low = 9'h198;
              4'h1: out_low = 9'h198;
              4'h2: out_low = 9'h198;
              4'h3: out_low = 9'h198;
              4'h4: out_low = 9'h198;
              4'h5: out_low = 9'h198;
              4'h6: out_low = 9'h197;
              4'h7: out_low = 9'h197;
              4'h8: out_low = 9'h197;
              4'h9: out_low = 9'h197;
              4'ha: out_low = 9'h197;
              4'hb: out_low = 9'h197;
              4'hc: out_low = 9'h197;
              4'hd: out_low = 9'h197;
              4'he: out_low = 9'h197;
              4'hf: out_low = 9'h197;
              default: out_low = 9'h000;
            endcase
          end
          6'h0e: begin
            case (mant[3:0])
              4'h0: out_low = 9'h197;
              4'h1: out_low = 9'h197;
              4'h2: out_low = 9'h197;
              4'h3: out_low = 9'h196;
              4'h4: out_low = 9'h196;
              4'h5: out_low = 9'h196;
              4'h6: out_low = 9'h196;
              4'h7: out_low = 9'h196;
              4'h8: out_low = 9'h196;
              4'h9: out_low = 9'h196;
              4'ha: out_low = 9'h196;
              4'hb: out_low = 9'h196;
              4'hc: out_low = 9'h196;
              4'hd: out_low = 9'h196;
              4'he: out_low = 9'h196;
              4'hf: out_low = 9'h195;
              default: out_low = 9'h000;
            endcase
          end
          6'h0f: begin
            case (mant[3:0])
              4'h0: out_low = 9'h195;
              4'h1: out_low = 9'h195;
              4'h2: out_low = 9'h195;
              4'h3: out_low = 9'h195;
              4'h4: out_low = 9'h195;
              4'h5: out_low = 9'h195;
              4'h6: out_low = 9'h195;
              4'h7: out_low = 9'h195;
              4'h8: out_low = 9'h195;
              4'h9: out_low = 9'h195;
              4'ha: out_low = 9'h195;
              4'hb: out_low = 9'h194;
              4'hc: out_low = 9'h194;
              4'hd: out_low = 9'h194;
              4'he: out_low = 9'h194;
              4'hf: out_low = 9'h194;
              default: out_low = 9'h000;
            endcase
          end
          6'h10: begin
            case (mant[3:0])
              4'h0: out_low = 9'h194;
              4'h1: out_low = 9'h194;
              4'h2: out_low = 9'h194;
              4'h3: out_low = 9'h194;
              4'h4: out_low = 9'h194;
              4'h5: out_low = 9'h194;
              4'h6: out_low = 9'h194;
              4'h7: out_low = 9'h193;
              4'h8: out_low = 9'h193;
              4'h9: out_low = 9'h193;
              4'ha: out_low = 9'h193;
              4'hb: out_low = 9'h193;
              4'hc: out_low = 9'h193;
              4'hd: out_low = 9'h193;
              4'he: out_low = 9'h193;
              4'hf: out_low = 9'h193;
              default: out_low = 9'h000;
            endcase
          end
          6'h11: begin
            case (mant[3:0])
              4'h0: out_low = 9'h193;
              4'h1: out_low = 9'h193;
              4'h2: out_low = 9'h193;
              4'h3: out_low = 9'h192;
              4'h4: out_low = 9'h192;
              4'h5: out_low = 9'h192;
              4'h6: out_low = 9'h192;
              4'h7: out_low = 9'h192;
              4'h8: out_low = 9'h192;
              4'h9: out_low = 9'h192;
              4'ha: out_low = 9'h192;
              4'hb: out_low = 9'h192;
              4'hc: out_low = 9'h192;
              4'hd: out_low = 9'h192;
              4'he: out_low = 9'h192;
              4'hf: out_low = 9'h192;
              default: out_low = 9'h000;
            endcase
          end
          6'h12: begin
            case (mant[3:0])
              4'h0: out_low = 9'h191;
              4'h1: out_low = 9'h191;
              4'h2: out_low = 9'h191;
              4'h3: out_low = 9'h191;
              4'h4: out_low = 9'h191;
              4'h5: out_low = 9'h191;
              4'h6: out_low = 9'h191;
              4'h7: out_low = 9'h191;
              4'h8: out_low = 9'h191;
              4'h9: out_low = 9'h191;
              4'ha: out_low = 9'h191;
              4'hb: out_low = 9'h191;
              4'hc: out_low = 9'h190;
              4'hd: out_low = 9'h190;
              4'he: out_low = 9'h190;
              4'hf: out_low = 9'h190;
              default: out_low = 9'h000;
            endcase
          end
          6'h13: begin
            case (mant[3:0])
              4'h0: out_low = 9'h190;
              4'h1: out_low = 9'h190;
              4'h2: out_low = 9'h190;
              4'h3: out_low = 9'h190;
              4'h4: out_low = 9'h190;
              4'h5: out_low = 9'h190;
              4'h6: out_low = 9'h190;
              4'h7: out_low = 9'h190;
              4'h8: out_low = 9'h18f;
              4'h9: out_low = 9'h18f;
              4'ha: out_low = 9'h18f;
              4'hb: out_low = 9'h18f;
              4'hc: out_low = 9'h18f;
              4'hd: out_low = 9'h18f;
              4'he: out_low = 9'h18f;
              4'hf: out_low = 9'h18f;
              default: out_low = 9'h000;
            endcase
          end
          6'h14: begin
            case (mant[3:0])
              4'h0: out_low = 9'h18f;
              4'h1: out_low = 9'h18f;
              4'h2: out_low = 9'h18f;
              4'h3: out_low = 9'h18f;
              4'h4: out_low = 9'h18e;
              4'h5: out_low = 9'h18e;
              4'h6: out_low = 9'h18e;
              4'h7: out_low = 9'h18e;
              4'h8: out_low = 9'h18e;
              4'h9: out_low = 9'h18e;
              4'ha: out_low = 9'h18e;
              4'hb: out_low = 9'h18e;
              4'hc: out_low = 9'h18e;
              4'hd: out_low = 9'h18e;
              4'he: out_low = 9'h18e;
              4'hf: out_low = 9'h18e;
              default: out_low = 9'h000;
            endcase
          end
          6'h15: begin
            case (mant[3:0])
              4'h0: out_low = 9'h18d;
              4'h1: out_low = 9'h18d;
              4'h2: out_low = 9'h18d;
              4'h3: out_low = 9'h18d;
              4'h4: out_low = 9'h18d;
              4'h5: out_low = 9'h18d;
              4'h6: out_low = 9'h18d;
              4'h7: out_low = 9'h18d;
              4'h8: out_low = 9'h18d;
              4'h9: out_low = 9'h18d;
              4'ha: out_low = 9'h18d;
              4'hb: out_low = 9'h18d;
              4'hc: out_low = 9'h18d;
              4'hd: out_low = 9'h18c;
              4'he: out_low = 9'h18c;
              4'hf: out_low = 9'h18c;
              default: out_low = 9'h000;
            endcase
          end
          6'h16: begin
            case (mant[3:0])
              4'h0: out_low = 9'h18c;
              4'h1: out_low = 9'h18c;
              4'h2: out_low = 9'h18c;
              4'h3: out_low = 9'h18c;
              4'h4: out_low = 9'h18c;
              4'h5: out_low = 9'h18c;
              4'h6: out_low = 9'h18c;
              4'h7: out_low = 9'h18c;
              4'h8: out_low = 9'h18c;
              4'h9: out_low = 9'h18b;
              4'ha: out_low = 9'h18b;
              4'hb: out_low = 9'h18b;
              4'hc: out_low = 9'h18b;
              4'hd: out_low = 9'h18b;
              4'he: out_low = 9'h18b;
              4'hf: out_low = 9'h18b;
              default: out_low = 9'h000;
            endcase
          end
          6'h17: begin
            case (mant[3:0])
              4'h0: out_low = 9'h18b;
              4'h1: out_low = 9'h18b;
              4'h2: out_low = 9'h18b;
              4'h3: out_low = 9'h18b;
              4'h4: out_low = 9'h18b;
              4'h5: out_low = 9'h18a;
              4'h6: out_low = 9'h18a;
              4'h7: out_low = 9'h18a;
              4'h8: out_low = 9'h18a;
              4'h9: out_low = 9'h18a;
              4'ha: out_low = 9'h18a;
              4'hb: out_low = 9'h18a;
              4'hc: out_low = 9'h18a;
              4'hd: out_low = 9'h18a;
              4'he: out_low = 9'h18a;
              4'hf: out_low = 9'h18a;
              default: out_low = 9'h000;
            endcase
          end
          6'h18: begin
            case (mant[3:0])
              4'h0: out_low = 9'h18a;
              4'h1: out_low = 9'h189;
              4'h2: out_low = 9'h189;
              4'h3: out_low = 9'h189;
              4'h4: out_low = 9'h189;
              4'h5: out_low = 9'h189;
              4'h6: out_low = 9'h189;
              4'h7: out_low = 9'h189;
              4'h8: out_low = 9'h189;
              4'h9: out_low = 9'h189;
              4'ha: out_low = 9'h189;
              4'hb: out_low = 9'h189;
              4'hc: out_low = 9'h189;
              4'hd: out_low = 9'h189;
              4'he: out_low = 9'h188;
              4'hf: out_low = 9'h188;
              default: out_low = 9'h000;
            endcase
          end
          6'h19: begin
            case (mant[3:0])
              4'h0: out_low = 9'h188;
              4'h1: out_low = 9'h188;
              4'h2: out_low = 9'h188;
              4'h3: out_low = 9'h188;
              4'h4: out_low = 9'h188;
              4'h5: out_low = 9'h188;
              4'h6: out_low = 9'h188;
              4'h7: out_low = 9'h188;
              4'h8: out_low = 9'h188;
              4'h9: out_low = 9'h188;
              4'ha: out_low = 9'h187;
              4'hb: out_low = 9'h187;
              4'hc: out_low = 9'h187;
              4'hd: out_low = 9'h187;
              4'he: out_low = 9'h187;
              4'hf: out_low = 9'h187;
              default: out_low = 9'h000;
            endcase
          end
          6'h1a: begin
            case (mant[3:0])
              4'h0: out_low = 9'h187;
              4'h1: out_low = 9'h187;
              4'h2: out_low = 9'h187;
              4'h3: out_low = 9'h187;
              4'h4: out_low = 9'h187;
              4'h5: out_low = 9'h187;
              4'h6: out_low = 9'h186;
              4'h7: out_low = 9'h186;
              4'h8: out_low = 9'h186;
              4'h9: out_low = 9'h186;
              4'ha: out_low = 9'h186;
              4'hb: out_low = 9'h186;
              4'hc: out_low = 9'h186;
              4'hd: out_low = 9'h186;
              4'he: out_low = 9'h186;
              4'hf: out_low = 9'h186;
              default: out_low = 9'h000;
            endcase
          end
          6'h1b: begin
            case (mant[3:0])
              4'h0: out_low = 9'h186;
              4'h1: out_low = 9'h186;
              4'h2: out_low = 9'h185;
              4'h3: out_low = 9'h185;
              4'h4: out_low = 9'h185;
              4'h5: out_low = 9'h185;
              4'h6: out_low = 9'h185;
              4'h7: out_low = 9'h185;
              4'h8: out_low = 9'h185;
              4'h9: out_low = 9'h185;
              4'ha: out_low = 9'h185;
              4'hb: out_low = 9'h185;
              4'hc: out_low = 9'h185;
              4'hd: out_low = 9'h185;
              4'he: out_low = 9'h185;
              4'hf: out_low = 9'h184;
              default: out_low = 9'h000;
            endcase
          end
          6'h1c: begin
            case (mant[3:0])
              4'h0: out_low = 9'h184;
              4'h1: out_low = 9'h184;
              4'h2: out_low = 9'h184;
              4'h3: out_low = 9'h184;
              4'h4: out_low = 9'h184;
              4'h5: out_low = 9'h184;
              4'h6: out_low = 9'h184;
              4'h7: out_low = 9'h184;
              4'h8: out_low = 9'h184;
              4'h9: out_low = 9'h184;
              4'ha: out_low = 9'h184;
              4'hb: out_low = 9'h183;
              4'hc: out_low = 9'h183;
              4'hd: out_low = 9'h183;
              4'he: out_low = 9'h183;
              4'hf: out_low = 9'h183;
              default: out_low = 9'h000;
            endcase
          end
          6'h1d: begin
            case (mant[3:0])
              4'h0: out_low = 9'h183;
              4'h1: out_low = 9'h183;
              4'h2: out_low = 9'h183;
              4'h3: out_low = 9'h183;
              4'h4: out_low = 9'h183;
              4'h5: out_low = 9'h183;
              4'h6: out_low = 9'h183;
              4'h7: out_low = 9'h182;
              4'h8: out_low = 9'h182;
              4'h9: out_low = 9'h182;
              4'ha: out_low = 9'h182;
              4'hb: out_low = 9'h182;
              4'hc: out_low = 9'h182;
              4'hd: out_low = 9'h182;
              4'he: out_low = 9'h182;
              4'hf: out_low = 9'h182;
              default: out_low = 9'h000;
            endcase
          end
          6'h1e: begin
            case (mant[3:0])
              4'h0: out_low = 9'h182;
              4'h1: out_low = 9'h182;
              4'h2: out_low = 9'h182;
              4'h3: out_low = 9'h182;
              4'h4: out_low = 9'h181;
              4'h5: out_low = 9'h181;
              4'h6: out_low = 9'h181;
              4'h7: out_low = 9'h181;
              4'h8: out_low = 9'h181;
              4'h9: out_low = 9'h181;
              4'ha: out_low = 9'h181;
              4'hb: out_low = 9'h181;
              4'hc: out_low = 9'h181;
              4'hd: out_low = 9'h181;
              4'he: out_low = 9'h181;
              4'hf: out_low = 9'h181;
              default: out_low = 9'h000;
            endcase
          end
          6'h1f: begin
            case (mant[3:0])
              4'h0: out_low = 9'h180;
              4'h1: out_low = 9'h180;
              4'h2: out_low = 9'h180;
              4'h3: out_low = 9'h180;
              4'h4: out_low = 9'h180;
              4'h5: out_low = 9'h180;
              4'h6: out_low = 9'h180;
              4'h7: out_low = 9'h180;
              4'h8: out_low = 9'h180;
              4'h9: out_low = 9'h180;
              4'ha: out_low = 9'h180;
              4'hb: out_low = 9'h180;
              4'hc: out_low = 9'h17f;
              4'hd: out_low = 9'h17f;
              4'he: out_low = 9'h17f;
              4'hf: out_low = 9'h17f;
              default: out_low = 9'h000;
            endcase
          end
          6'h20: begin
            case (mant[3:0])
              4'h0: out_low = 9'h17f;
              4'h1: out_low = 9'h17f;
              4'h2: out_low = 9'h17f;
              4'h3: out_low = 9'h17f;
              4'h4: out_low = 9'h17f;
              4'h5: out_low = 9'h17f;
              4'h6: out_low = 9'h17f;
              4'h7: out_low = 9'h17f;
              4'h8: out_low = 9'h17e;
              4'h9: out_low = 9'h17e;
              4'ha: out_low = 9'h17e;
              4'hb: out_low = 9'h17e;
              4'hc: out_low = 9'h17e;
              4'hd: out_low = 9'h17e;
              4'he: out_low = 9'h17e;
              4'hf: out_low = 9'h17e;
              default: out_low = 9'h000;
            endcase
          end
          6'h21: begin
            case (mant[3:0])
              4'h0: out_low = 9'h17e;
              4'h1: out_low = 9'h17e;
              4'h2: out_low = 9'h17e;
              4'h3: out_low = 9'h17e;
              4'h4: out_low = 9'h17e;
              4'h5: out_low = 9'h17d;
              4'h6: out_low = 9'h17d;
              4'h7: out_low = 9'h17d;
              4'h8: out_low = 9'h17d;
              4'h9: out_low = 9'h17d;
              4'ha: out_low = 9'h17d;
              4'hb: out_low = 9'h17d;
              4'hc: out_low = 9'h17d;
              4'hd: out_low = 9'h17d;
              4'he: out_low = 9'h17d;
              4'hf: out_low = 9'h17d;
              default: out_low = 9'h000;
            endcase
          end
          6'h22: begin
            case (mant[3:0])
              4'h0: out_low = 9'h17d;
              4'h1: out_low = 9'h17c;
              4'h2: out_low = 9'h17c;
              4'h3: out_low = 9'h17c;
              4'h4: out_low = 9'h17c;
              4'h5: out_low = 9'h17c;
              4'h6: out_low = 9'h17c;
              4'h7: out_low = 9'h17c;
              4'h8: out_low = 9'h17c;
              4'h9: out_low = 9'h17c;
              4'ha: out_low = 9'h17c;
              4'hb: out_low = 9'h17c;
              4'hc: out_low = 9'h17c;
              4'hd: out_low = 9'h17b;
              4'he: out_low = 9'h17b;
              4'hf: out_low = 9'h17b;
              default: out_low = 9'h000;
            endcase
          end
          6'h23: begin
            case (mant[3:0])
              4'h0: out_low = 9'h17b;
              4'h1: out_low = 9'h17b;
              4'h2: out_low = 9'h17b;
              4'h3: out_low = 9'h17b;
              4'h4: out_low = 9'h17b;
              4'h5: out_low = 9'h17b;
              4'h6: out_low = 9'h17b;
              4'h7: out_low = 9'h17b;
              4'h8: out_low = 9'h17b;
              4'h9: out_low = 9'h17b;
              4'ha: out_low = 9'h17a;
              4'hb: out_low = 9'h17a;
              4'hc: out_low = 9'h17a;
              4'hd: out_low = 9'h17a;
              4'he: out_low = 9'h17a;
              4'hf: out_low = 9'h17a;
              default: out_low = 9'h000;
            endcase
          end
          6'h24: begin
            case (mant[3:0])
              4'h0: out_low = 9'h17a;
              4'h1: out_low = 9'h17a;
              4'h2: out_low = 9'h17a;
              4'h3: out_low = 9'h17a;
              4'h4: out_low = 9'h17a;
              4'h5: out_low = 9'h17a;
              4'h6: out_low = 9'h179;
              4'h7: out_low = 9'h179;
              4'h8: out_low = 9'h179;
              4'h9: out_low = 9'h179;
              4'ha: out_low = 9'h179;
              4'hb: out_low = 9'h179;
              4'hc: out_low = 9'h179;
              4'hd: out_low = 9'h179;
              4'he: out_low = 9'h179;
              4'hf: out_low = 9'h179;
              default: out_low = 9'h000;
            endcase
          end
          6'h25: begin
            case (mant[3:0])
              4'h0: out_low = 9'h179;
              4'h1: out_low = 9'h179;
              4'h2: out_low = 9'h179;
              4'h3: out_low = 9'h178;
              4'h4: out_low = 9'h178;
              4'h5: out_low = 9'h178;
              4'h6: out_low = 9'h178;
              4'h7: out_low = 9'h178;
              4'h8: out_low = 9'h178;
              4'h9: out_low = 9'h178;
              4'ha: out_low = 9'h178;
              4'hb: out_low = 9'h178;
              4'hc: out_low = 9'h178;
              4'hd: out_low = 9'h178;
              4'he: out_low = 9'h178;
              4'hf: out_low = 9'h177;
              default: out_low = 9'h000;
            endcase
          end
          6'h26: begin
            case (mant[3:0])
              4'h0: out_low = 9'h177;
              4'h1: out_low = 9'h177;
              4'h2: out_low = 9'h177;
              4'h3: out_low = 9'h177;
              4'h4: out_low = 9'h177;
              4'h5: out_low = 9'h177;
              4'h6: out_low = 9'h177;
              4'h7: out_low = 9'h177;
              4'h8: out_low = 9'h177;
              4'h9: out_low = 9'h177;
              4'ha: out_low = 9'h177;
              4'hb: out_low = 9'h176;
              4'hc: out_low = 9'h176;
              4'hd: out_low = 9'h176;
              4'he: out_low = 9'h176;
              4'hf: out_low = 9'h176;
              default: out_low = 9'h000;
            endcase
          end
          6'h27: begin
            case (mant[3:0])
              4'h0: out_low = 9'h176;
              4'h1: out_low = 9'h176;
              4'h2: out_low = 9'h176;
              4'h3: out_low = 9'h176;
              4'h4: out_low = 9'h176;
              4'h5: out_low = 9'h176;
              4'h6: out_low = 9'h176;
              4'h7: out_low = 9'h176;
              4'h8: out_low = 9'h175;
              4'h9: out_low = 9'h175;
              4'ha: out_low = 9'h175;
              4'hb: out_low = 9'h175;
              4'hc: out_low = 9'h175;
              4'hd: out_low = 9'h175;
              4'he: out_low = 9'h175;
              4'hf: out_low = 9'h175;
              default: out_low = 9'h000;
            endcase
          end
          6'h28: begin
            case (mant[3:0])
              4'h0: out_low = 9'h175;
              4'h1: out_low = 9'h175;
              4'h2: out_low = 9'h175;
              4'h3: out_low = 9'h175;
              4'h4: out_low = 9'h174;
              4'h5: out_low = 9'h174;
              4'h6: out_low = 9'h174;
              4'h7: out_low = 9'h174;
              4'h8: out_low = 9'h174;
              4'h9: out_low = 9'h174;
              4'ha: out_low = 9'h174;
              4'hb: out_low = 9'h174;
              4'hc: out_low = 9'h174;
              4'hd: out_low = 9'h174;
              4'he: out_low = 9'h174;
              4'hf: out_low = 9'h174;
              default: out_low = 9'h000;
            endcase
          end
          6'h29: begin
            case (mant[3:0])
              4'h0: out_low = 9'h173;
              4'h1: out_low = 9'h173;
              4'h2: out_low = 9'h173;
              4'h3: out_low = 9'h173;
              4'h4: out_low = 9'h173;
              4'h5: out_low = 9'h173;
              4'h6: out_low = 9'h173;
              4'h7: out_low = 9'h173;
              4'h8: out_low = 9'h173;
              4'h9: out_low = 9'h173;
              4'ha: out_low = 9'h173;
              4'hb: out_low = 9'h173;
              4'hc: out_low = 9'h173;
              4'hd: out_low = 9'h172;
              4'he: out_low = 9'h172;
              4'hf: out_low = 9'h172;
              default: out_low = 9'h000;
            endcase
          end
          6'h2a: begin
            case (mant[3:0])
              4'h0: out_low = 9'h172;
              4'h1: out_low = 9'h172;
              4'h2: out_low = 9'h172;
              4'h3: out_low = 9'h172;
              4'h4: out_low = 9'h172;
              4'h5: out_low = 9'h172;
              4'h6: out_low = 9'h172;
              4'h7: out_low = 9'h172;
              4'h8: out_low = 9'h172;
              4'h9: out_low = 9'h171;
              4'ha: out_low = 9'h171;
              4'hb: out_low = 9'h171;
              4'hc: out_low = 9'h171;
              4'hd: out_low = 9'h171;
              4'he: out_low = 9'h171;
              4'hf: out_low = 9'h171;
              default: out_low = 9'h000;
            endcase
          end
          6'h2b: begin
            case (mant[3:0])
              4'h0: out_low = 9'h171;
              4'h1: out_low = 9'h171;
              4'h2: out_low = 9'h171;
              4'h3: out_low = 9'h171;
              4'h4: out_low = 9'h171;
              4'h5: out_low = 9'h171;
              4'h6: out_low = 9'h170;
              4'h7: out_low = 9'h170;
              4'h8: out_low = 9'h170;
              4'h9: out_low = 9'h170;
              4'ha: out_low = 9'h170;
              4'hb: out_low = 9'h170;
              4'hc: out_low = 9'h170;
              4'hd: out_low = 9'h170;
              4'he: out_low = 9'h170;
              4'hf: out_low = 9'h170;
              default: out_low = 9'h000;
            endcase
          end
          6'h2c: begin
            case (mant[3:0])
              4'h0: out_low = 9'h170;
              4'h1: out_low = 9'h170;
              4'h2: out_low = 9'h16f;
              4'h3: out_low = 9'h16f;
              4'h4: out_low = 9'h16f;
              4'h5: out_low = 9'h16f;
              4'h6: out_low = 9'h16f;
              4'h7: out_low = 9'h16f;
              4'h8: out_low = 9'h16f;
              4'h9: out_low = 9'h16f;
              4'ha: out_low = 9'h16f;
              4'hb: out_low = 9'h16f;
              4'hc: out_low = 9'h16f;
              4'hd: out_low = 9'h16f;
              4'he: out_low = 9'h16e;
              4'hf: out_low = 9'h16e;
              default: out_low = 9'h000;
            endcase
          end
          6'h2d: begin
            case (mant[3:0])
              4'h0: out_low = 9'h16e;
              4'h1: out_low = 9'h16e;
              4'h2: out_low = 9'h16e;
              4'h3: out_low = 9'h16e;
              4'h4: out_low = 9'h16e;
              4'h5: out_low = 9'h16e;
              4'h6: out_low = 9'h16e;
              4'h7: out_low = 9'h16e;
              4'h8: out_low = 9'h16e;
              4'h9: out_low = 9'h16e;
              4'ha: out_low = 9'h16e;
              4'hb: out_low = 9'h16d;
              4'hc: out_low = 9'h16d;
              4'hd: out_low = 9'h16d;
              4'he: out_low = 9'h16d;
              4'hf: out_low = 9'h16d;
              default: out_low = 9'h000;
            endcase
          end
          6'h2e: begin
            case (mant[3:0])
              4'h0: out_low = 9'h16d;
              4'h1: out_low = 9'h16d;
              4'h2: out_low = 9'h16d;
              4'h3: out_low = 9'h16d;
              4'h4: out_low = 9'h16d;
              4'h5: out_low = 9'h16d;
              4'h6: out_low = 9'h16d;
              4'h7: out_low = 9'h16c;
              4'h8: out_low = 9'h16c;
              4'h9: out_low = 9'h16c;
              4'ha: out_low = 9'h16c;
              4'hb: out_low = 9'h16c;
              4'hc: out_low = 9'h16c;
              4'hd: out_low = 9'h16c;
              4'he: out_low = 9'h16c;
              4'hf: out_low = 9'h16c;
              default: out_low = 9'h000;
            endcase
          end
          6'h2f: begin
            case (mant[3:0])
              4'h0: out_low = 9'h16c;
              4'h1: out_low = 9'h16c;
              4'h2: out_low = 9'h16c;
              4'h3: out_low = 9'h16c;
              4'h4: out_low = 9'h16b;
              4'h5: out_low = 9'h16b;
              4'h6: out_low = 9'h16b;
              4'h7: out_low = 9'h16b;
              4'h8: out_low = 9'h16b;
              4'h9: out_low = 9'h16b;
              4'ha: out_low = 9'h16b;
              4'hb: out_low = 9'h16b;
              4'hc: out_low = 9'h16b;
              4'hd: out_low = 9'h16b;
              4'he: out_low = 9'h16b;
              4'hf: out_low = 9'h16b;
              default: out_low = 9'h000;
            endcase
          end
          6'h30: begin
            case (mant[3:0])
              4'h0: out_low = 9'h16a;
              4'h1: out_low = 9'h16a;
              4'h2: out_low = 9'h16a;
              4'h3: out_low = 9'h16a;
              4'h4: out_low = 9'h16a;
              4'h5: out_low = 9'h16a;
              4'h6: out_low = 9'h16a;
              4'h7: out_low = 9'h16a;
              4'h8: out_low = 9'h16a;
              4'h9: out_low = 9'h16a;
              4'ha: out_low = 9'h16a;
              4'hb: out_low = 9'h16a;
              4'hc: out_low = 9'h16a;
              4'hd: out_low = 9'h169;
              4'he: out_low = 9'h169;
              4'hf: out_low = 9'h169;
              default: out_low = 9'h000;
            endcase
          end
          6'h31: begin
            case (mant[3:0])
              4'h0: out_low = 9'h169;
              4'h1: out_low = 9'h169;
              4'h2: out_low = 9'h169;
              4'h3: out_low = 9'h169;
              4'h4: out_low = 9'h169;
              4'h5: out_low = 9'h169;
              4'h6: out_low = 9'h169;
              4'h7: out_low = 9'h169;
              4'h8: out_low = 9'h169;
              4'h9: out_low = 9'h168;
              4'ha: out_low = 9'h168;
              4'hb: out_low = 9'h168;
              4'hc: out_low = 9'h168;
              4'hd: out_low = 9'h168;
              4'he: out_low = 9'h168;
              4'hf: out_low = 9'h168;
              default: out_low = 9'h000;
            endcase
          end
          6'h32: begin
            case (mant[3:0])
              4'h0: out_low = 9'h168;
              4'h1: out_low = 9'h168;
              4'h2: out_low = 9'h168;
              4'h3: out_low = 9'h168;
              4'h4: out_low = 9'h168;
              4'h5: out_low = 9'h168;
              4'h6: out_low = 9'h167;
              4'h7: out_low = 9'h167;
              4'h8: out_low = 9'h167;
              4'h9: out_low = 9'h167;
              4'ha: out_low = 9'h167;
              4'hb: out_low = 9'h167;
              4'hc: out_low = 9'h167;
              4'hd: out_low = 9'h167;
              4'he: out_low = 9'h167;
              4'hf: out_low = 9'h167;
              default: out_low = 9'h000;
            endcase
          end
          6'h33: begin
            case (mant[3:0])
              4'h0: out_low = 9'h167;
              4'h1: out_low = 9'h167;
              4'h2: out_low = 9'h166;
              4'h3: out_low = 9'h166;
              4'h4: out_low = 9'h166;
              4'h5: out_low = 9'h166;
              4'h6: out_low = 9'h166;
              4'h7: out_low = 9'h166;
              4'h8: out_low = 9'h166;
              4'h9: out_low = 9'h166;
              4'ha: out_low = 9'h166;
              4'hb: out_low = 9'h166;
              4'hc: out_low = 9'h166;
              4'hd: out_low = 9'h166;
              4'he: out_low = 9'h166;
              4'hf: out_low = 9'h165;
              default: out_low = 9'h000;
            endcase
          end
          6'h34: begin
            case (mant[3:0])
              4'h0: out_low = 9'h165;
              4'h1: out_low = 9'h165;
              4'h2: out_low = 9'h165;
              4'h3: out_low = 9'h165;
              4'h4: out_low = 9'h165;
              4'h5: out_low = 9'h165;
              4'h6: out_low = 9'h165;
              4'h7: out_low = 9'h165;
              4'h8: out_low = 9'h165;
              4'h9: out_low = 9'h165;
              4'ha: out_low = 9'h165;
              4'hb: out_low = 9'h164;
              4'hc: out_low = 9'h164;
              4'hd: out_low = 9'h164;
              4'he: out_low = 9'h164;
              4'hf: out_low = 9'h164;
              default: out_low = 9'h000;
            endcase
          end
          6'h35: begin
            case (mant[3:0])
              4'h0: out_low = 9'h164;
              4'h1: out_low = 9'h164;
              4'h2: out_low = 9'h164;
              4'h3: out_low = 9'h164;
              4'h4: out_low = 9'h164;
              4'h5: out_low = 9'h164;
              4'h6: out_low = 9'h164;
              4'h7: out_low = 9'h163;
              4'h8: out_low = 9'h163;
              4'h9: out_low = 9'h163;
              4'ha: out_low = 9'h163;
              4'hb: out_low = 9'h163;
              4'hc: out_low = 9'h163;
              4'hd: out_low = 9'h163;
              4'he: out_low = 9'h163;
              4'hf: out_low = 9'h163;
              default: out_low = 9'h000;
            endcase
          end
          6'h36: begin
            case (mant[3:0])
              4'h0: out_low = 9'h163;
              4'h1: out_low = 9'h163;
              4'h2: out_low = 9'h163;
              4'h3: out_low = 9'h163;
              4'h4: out_low = 9'h162;
              4'h5: out_low = 9'h162;
              4'h6: out_low = 9'h162;
              4'h7: out_low = 9'h162;
              4'h8: out_low = 9'h162;
              4'h9: out_low = 9'h162;
              4'ha: out_low = 9'h162;
              4'hb: out_low = 9'h162;
              4'hc: out_low = 9'h162;
              4'hd: out_low = 9'h162;
              4'he: out_low = 9'h162;
              4'hf: out_low = 9'h162;
              default: out_low = 9'h000;
            endcase
          end
          6'h37: begin
            case (mant[3:0])
              4'h0: out_low = 9'h162;
              4'h1: out_low = 9'h161;
              4'h2: out_low = 9'h161;
              4'h3: out_low = 9'h161;
              4'h4: out_low = 9'h161;
              4'h5: out_low = 9'h161;
              4'h6: out_low = 9'h161;
              4'h7: out_low = 9'h161;
              4'h8: out_low = 9'h161;
              4'h9: out_low = 9'h161;
              4'ha: out_low = 9'h161;
              4'hb: out_low = 9'h161;
              4'hc: out_low = 9'h161;
              4'hd: out_low = 9'h160;
              4'he: out_low = 9'h160;
              4'hf: out_low = 9'h160;
              default: out_low = 9'h000;
            endcase
          end
          6'h38: begin
            case (mant[3:0])
              4'h0: out_low = 9'h160;
              4'h1: out_low = 9'h160;
              4'h2: out_low = 9'h160;
              4'h3: out_low = 9'h160;
              4'h4: out_low = 9'h160;
              4'h5: out_low = 9'h160;
              4'h6: out_low = 9'h160;
              4'h7: out_low = 9'h160;
              4'h8: out_low = 9'h160;
              4'h9: out_low = 9'h160;
              4'ha: out_low = 9'h15f;
              4'hb: out_low = 9'h15f;
              4'hc: out_low = 9'h15f;
              4'hd: out_low = 9'h15f;
              4'he: out_low = 9'h15f;
              4'hf: out_low = 9'h15f;
              default: out_low = 9'h000;
            endcase
          end
          6'h39: begin
            case (mant[3:0])
              4'h0: out_low = 9'h15f;
              4'h1: out_low = 9'h15f;
              4'h2: out_low = 9'h15f;
              4'h3: out_low = 9'h15f;
              4'h4: out_low = 9'h15f;
              4'h5: out_low = 9'h15f;
              4'h6: out_low = 9'h15e;
              4'h7: out_low = 9'h15e;
              4'h8: out_low = 9'h15e;
              4'h9: out_low = 9'h15e;
              4'ha: out_low = 9'h15e;
              4'hb: out_low = 9'h15e;
              4'hc: out_low = 9'h15e;
              4'hd: out_low = 9'h15e;
              4'he: out_low = 9'h15e;
              4'hf: out_low = 9'h15e;
              default: out_low = 9'h000;
            endcase
          end
          6'h3a: begin
            case (mant[3:0])
              4'h0: out_low = 9'h15e;
              4'h1: out_low = 9'h15e;
              4'h2: out_low = 9'h15e;
              4'h3: out_low = 9'h15d;
              4'h4: out_low = 9'h15d;
              4'h5: out_low = 9'h15d;
              4'h6: out_low = 9'h15d;
              4'h7: out_low = 9'h15d;
              4'h8: out_low = 9'h15d;
              4'h9: out_low = 9'h15d;
              4'ha: out_low = 9'h15d;
              4'hb: out_low = 9'h15d;
              4'hc: out_low = 9'h15d;
              4'hd: out_low = 9'h15d;
              4'he: out_low = 9'h15d;
              4'hf: out_low = 9'h15c;
              default: out_low = 9'h000;
            endcase
          end
          6'h3b: begin
            case (mant[3:0])
              4'h0: out_low = 9'h15c;
              4'h1: out_low = 9'h15c;
              4'h2: out_low = 9'h15c;
              4'h3: out_low = 9'h15c;
              4'h4: out_low = 9'h15c;
              4'h5: out_low = 9'h15c;
              4'h6: out_low = 9'h15c;
              4'h7: out_low = 9'h15c;
              4'h8: out_low = 9'h15c;
              4'h9: out_low = 9'h15c;
              4'ha: out_low = 9'h15c;
              4'hb: out_low = 9'h15c;
              4'hc: out_low = 9'h15b;
              4'hd: out_low = 9'h15b;
              4'he: out_low = 9'h15b;
              4'hf: out_low = 9'h15b;
              default: out_low = 9'h000;
            endcase
          end
          6'h3c: begin
            case (mant[3:0])
              4'h0: out_low = 9'h15b;
              4'h1: out_low = 9'h15b;
              4'h2: out_low = 9'h15b;
              4'h3: out_low = 9'h15b;
              4'h4: out_low = 9'h15b;
              4'h5: out_low = 9'h15b;
              4'h6: out_low = 9'h15b;
              4'h7: out_low = 9'h15b;
              4'h8: out_low = 9'h15a;
              4'h9: out_low = 9'h15a;
              4'ha: out_low = 9'h15a;
              4'hb: out_low = 9'h15a;
              4'hc: out_low = 9'h15a;
              4'hd: out_low = 9'h15a;
              4'he: out_low = 9'h15a;
              4'hf: out_low = 9'h15a;
              default: out_low = 9'h000;
            endcase
          end
          6'h3d: begin
            case (mant[3:0])
              4'h0: out_low = 9'h15a;
              4'h1: out_low = 9'h15a;
              4'h2: out_low = 9'h15a;
              4'h3: out_low = 9'h15a;
              4'h4: out_low = 9'h15a;
              4'h5: out_low = 9'h159;
              4'h6: out_low = 9'h159;
              4'h7: out_low = 9'h159;
              4'h8: out_low = 9'h159;
              4'h9: out_low = 9'h159;
              4'ha: out_low = 9'h159;
              4'hb: out_low = 9'h159;
              4'hc: out_low = 9'h159;
              4'hd: out_low = 9'h159;
              4'he: out_low = 9'h159;
              4'hf: out_low = 9'h159;
              default: out_low = 9'h000;
            endcase
          end
          6'h3e: begin
            case (mant[3:0])
              4'h0: out_low = 9'h159;
              4'h1: out_low = 9'h158;
              4'h2: out_low = 9'h158;
              4'h3: out_low = 9'h158;
              4'h4: out_low = 9'h158;
              4'h5: out_low = 9'h158;
              4'h6: out_low = 9'h158;
              4'h7: out_low = 9'h158;
              4'h8: out_low = 9'h158;
              4'h9: out_low = 9'h158;
              4'ha: out_low = 9'h158;
              4'hb: out_low = 9'h158;
              4'hc: out_low = 9'h158;
              4'hd: out_low = 9'h158;
              4'he: out_low = 9'h157;
              4'hf: out_low = 9'h157;
              default: out_low = 9'h000;
            endcase
          end
          6'h3f: begin
            case (mant[3:0])
              4'h0: out_low = 9'h157;
              4'h1: out_low = 9'h157;
              4'h2: out_low = 9'h157;
              4'h3: out_low = 9'h157;
              4'h4: out_low = 9'h157;
              4'h5: out_low = 9'h157;
              4'h6: out_low = 9'h157;
              4'h7: out_low = 9'h157;
              4'h8: out_low = 9'h157;
              4'h9: out_low = 9'h157;
              4'ha: out_low = 9'h157;
              4'hb: out_low = 9'h156;
              4'hc: out_low = 9'h156;
              4'hd: out_low = 9'h156;
              4'he: out_low = 9'h156;
              4'hf: out_low = 9'h156;
              default: out_low = 9'h000;
            endcase
          end
          default: out_low = 9'h000;
        endcase
      end
      6'h2c: begin
        case (mant[9:4])
          6'h00: begin
            case (mant[3:0])
              4'h0: out_low = 9'h156;
              4'h1: out_low = 9'h156;
              4'h2: out_low = 9'h156;
              4'h3: out_low = 9'h156;
              4'h4: out_low = 9'h155;
              4'h5: out_low = 9'h155;
              4'h6: out_low = 9'h155;
              4'h7: out_low = 9'h155;
              4'h8: out_low = 9'h155;
              4'h9: out_low = 9'h155;
              4'ha: out_low = 9'h154;
              4'hb: out_low = 9'h154;
              4'hc: out_low = 9'h154;
              4'hd: out_low = 9'h154;
              4'he: out_low = 9'h154;
              4'hf: out_low = 9'h154;
              default: out_low = 9'h000;
            endcase
          end
          6'h01: begin
            case (mant[3:0])
              4'h0: out_low = 9'h153;
              4'h1: out_low = 9'h153;
              4'h2: out_low = 9'h153;
              4'h3: out_low = 9'h153;
              4'h4: out_low = 9'h153;
              4'h5: out_low = 9'h153;
              4'h6: out_low = 9'h153;
              4'h7: out_low = 9'h152;
              4'h8: out_low = 9'h152;
              4'h9: out_low = 9'h152;
              4'ha: out_low = 9'h152;
              4'hb: out_low = 9'h152;
              4'hc: out_low = 9'h152;
              4'hd: out_low = 9'h151;
              4'he: out_low = 9'h151;
              4'hf: out_low = 9'h151;
              default: out_low = 9'h000;
            endcase
          end
          6'h02: begin
            case (mant[3:0])
              4'h0: out_low = 9'h151;
              4'h1: out_low = 9'h151;
              4'h2: out_low = 9'h151;
              4'h3: out_low = 9'h150;
              4'h4: out_low = 9'h150;
              4'h5: out_low = 9'h150;
              4'h6: out_low = 9'h150;
              4'h7: out_low = 9'h150;
              4'h8: out_low = 9'h150;
              4'h9: out_low = 9'h150;
              4'ha: out_low = 9'h14f;
              4'hb: out_low = 9'h14f;
              4'hc: out_low = 9'h14f;
              4'hd: out_low = 9'h14f;
              4'he: out_low = 9'h14f;
              4'hf: out_low = 9'h14f;
              default: out_low = 9'h000;
            endcase
          end
          6'h03: begin
            case (mant[3:0])
              4'h0: out_low = 9'h14e;
              4'h1: out_low = 9'h14e;
              4'h2: out_low = 9'h14e;
              4'h3: out_low = 9'h14e;
              4'h4: out_low = 9'h14e;
              4'h5: out_low = 9'h14e;
              4'h6: out_low = 9'h14d;
              4'h7: out_low = 9'h14d;
              4'h8: out_low = 9'h14d;
              4'h9: out_low = 9'h14d;
              4'ha: out_low = 9'h14d;
              4'hb: out_low = 9'h14d;
              4'hc: out_low = 9'h14d;
              4'hd: out_low = 9'h14c;
              4'he: out_low = 9'h14c;
              4'hf: out_low = 9'h14c;
              default: out_low = 9'h000;
            endcase
          end
          6'h04: begin
            case (mant[3:0])
              4'h0: out_low = 9'h14c;
              4'h1: out_low = 9'h14c;
              4'h2: out_low = 9'h14c;
              4'h3: out_low = 9'h14b;
              4'h4: out_low = 9'h14b;
              4'h5: out_low = 9'h14b;
              4'h6: out_low = 9'h14b;
              4'h7: out_low = 9'h14b;
              4'h8: out_low = 9'h14b;
              4'h9: out_low = 9'h14a;
              4'ha: out_low = 9'h14a;
              4'hb: out_low = 9'h14a;
              4'hc: out_low = 9'h14a;
              4'hd: out_low = 9'h14a;
              4'he: out_low = 9'h14a;
              4'hf: out_low = 9'h14a;
              default: out_low = 9'h000;
            endcase
          end
          6'h05: begin
            case (mant[3:0])
              4'h0: out_low = 9'h149;
              4'h1: out_low = 9'h149;
              4'h2: out_low = 9'h149;
              4'h3: out_low = 9'h149;
              4'h4: out_low = 9'h149;
              4'h5: out_low = 9'h149;
              4'h6: out_low = 9'h148;
              4'h7: out_low = 9'h148;
              4'h8: out_low = 9'h148;
              4'h9: out_low = 9'h148;
              4'ha: out_low = 9'h148;
              4'hb: out_low = 9'h148;
              4'hc: out_low = 9'h147;
              4'hd: out_low = 9'h147;
              4'he: out_low = 9'h147;
              4'hf: out_low = 9'h147;
              default: out_low = 9'h000;
            endcase
          end
          6'h06: begin
            case (mant[3:0])
              4'h0: out_low = 9'h147;
              4'h1: out_low = 9'h147;
              4'h2: out_low = 9'h147;
              4'h3: out_low = 9'h146;
              4'h4: out_low = 9'h146;
              4'h5: out_low = 9'h146;
              4'h6: out_low = 9'h146;
              4'h7: out_low = 9'h146;
              4'h8: out_low = 9'h146;
              4'h9: out_low = 9'h145;
              4'ha: out_low = 9'h145;
              4'hb: out_low = 9'h145;
              4'hc: out_low = 9'h145;
              4'hd: out_low = 9'h145;
              4'he: out_low = 9'h145;
              4'hf: out_low = 9'h144;
              default: out_low = 9'h000;
            endcase
          end
          6'h07: begin
            case (mant[3:0])
              4'h0: out_low = 9'h144;
              4'h1: out_low = 9'h144;
              4'h2: out_low = 9'h144;
              4'h3: out_low = 9'h144;
              4'h4: out_low = 9'h144;
              4'h5: out_low = 9'h144;
              4'h6: out_low = 9'h143;
              4'h7: out_low = 9'h143;
              4'h8: out_low = 9'h143;
              4'h9: out_low = 9'h143;
              4'ha: out_low = 9'h143;
              4'hb: out_low = 9'h143;
              4'hc: out_low = 9'h142;
              4'hd: out_low = 9'h142;
              4'he: out_low = 9'h142;
              4'hf: out_low = 9'h142;
              default: out_low = 9'h000;
            endcase
          end
          6'h08: begin
            case (mant[3:0])
              4'h0: out_low = 9'h142;
              4'h1: out_low = 9'h142;
              4'h2: out_low = 9'h141;
              4'h3: out_low = 9'h141;
              4'h4: out_low = 9'h141;
              4'h5: out_low = 9'h141;
              4'h6: out_low = 9'h141;
              4'h7: out_low = 9'h141;
              4'h8: out_low = 9'h141;
              4'h9: out_low = 9'h140;
              4'ha: out_low = 9'h140;
              4'hb: out_low = 9'h140;
              4'hc: out_low = 9'h140;
              4'hd: out_low = 9'h140;
              4'he: out_low = 9'h140;
              4'hf: out_low = 9'h13f;
              default: out_low = 9'h000;
            endcase
          end
          6'h09: begin
            case (mant[3:0])
              4'h0: out_low = 9'h13f;
              4'h1: out_low = 9'h13f;
              4'h2: out_low = 9'h13f;
              4'h3: out_low = 9'h13f;
              4'h4: out_low = 9'h13f;
              4'h5: out_low = 9'h13e;
              4'h6: out_low = 9'h13e;
              4'h7: out_low = 9'h13e;
              4'h8: out_low = 9'h13e;
              4'h9: out_low = 9'h13e;
              4'ha: out_low = 9'h13e;
              4'hb: out_low = 9'h13e;
              4'hc: out_low = 9'h13d;
              4'hd: out_low = 9'h13d;
              4'he: out_low = 9'h13d;
              4'hf: out_low = 9'h13d;
              default: out_low = 9'h000;
            endcase
          end
          6'h0a: begin
            case (mant[3:0])
              4'h0: out_low = 9'h13d;
              4'h1: out_low = 9'h13d;
              4'h2: out_low = 9'h13c;
              4'h3: out_low = 9'h13c;
              4'h4: out_low = 9'h13c;
              4'h5: out_low = 9'h13c;
              4'h6: out_low = 9'h13c;
              4'h7: out_low = 9'h13c;
              4'h8: out_low = 9'h13c;
              4'h9: out_low = 9'h13b;
              4'ha: out_low = 9'h13b;
              4'hb: out_low = 9'h13b;
              4'hc: out_low = 9'h13b;
              4'hd: out_low = 9'h13b;
              4'he: out_low = 9'h13b;
              4'hf: out_low = 9'h13a;
              default: out_low = 9'h000;
            endcase
          end
          6'h0b: begin
            case (mant[3:0])
              4'h0: out_low = 9'h13a;
              4'h1: out_low = 9'h13a;
              4'h2: out_low = 9'h13a;
              4'h3: out_low = 9'h13a;
              4'h4: out_low = 9'h13a;
              4'h5: out_low = 9'h139;
              4'h6: out_low = 9'h139;
              4'h7: out_low = 9'h139;
              4'h8: out_low = 9'h139;
              4'h9: out_low = 9'h139;
              4'ha: out_low = 9'h139;
              4'hb: out_low = 9'h139;
              4'hc: out_low = 9'h138;
              4'hd: out_low = 9'h138;
              4'he: out_low = 9'h138;
              4'hf: out_low = 9'h138;
              default: out_low = 9'h000;
            endcase
          end
          6'h0c: begin
            case (mant[3:0])
              4'h0: out_low = 9'h138;
              4'h1: out_low = 9'h138;
              4'h2: out_low = 9'h137;
              4'h3: out_low = 9'h137;
              4'h4: out_low = 9'h137;
              4'h5: out_low = 9'h137;
              4'h6: out_low = 9'h137;
              4'h7: out_low = 9'h137;
              4'h8: out_low = 9'h137;
              4'h9: out_low = 9'h136;
              4'ha: out_low = 9'h136;
              4'hb: out_low = 9'h136;
              4'hc: out_low = 9'h136;
              4'hd: out_low = 9'h136;
              4'he: out_low = 9'h136;
              4'hf: out_low = 9'h135;
              default: out_low = 9'h000;
            endcase
          end
          6'h0d: begin
            case (mant[3:0])
              4'h0: out_low = 9'h135;
              4'h1: out_low = 9'h135;
              4'h2: out_low = 9'h135;
              4'h3: out_low = 9'h135;
              4'h4: out_low = 9'h135;
              4'h5: out_low = 9'h134;
              4'h6: out_low = 9'h134;
              4'h7: out_low = 9'h134;
              4'h8: out_low = 9'h134;
              4'h9: out_low = 9'h134;
              4'ha: out_low = 9'h134;
              4'hb: out_low = 9'h134;
              4'hc: out_low = 9'h133;
              4'hd: out_low = 9'h133;
              4'he: out_low = 9'h133;
              4'hf: out_low = 9'h133;
              default: out_low = 9'h000;
            endcase
          end
          6'h0e: begin
            case (mant[3:0])
              4'h0: out_low = 9'h133;
              4'h1: out_low = 9'h133;
              4'h2: out_low = 9'h132;
              4'h3: out_low = 9'h132;
              4'h4: out_low = 9'h132;
              4'h5: out_low = 9'h132;
              4'h6: out_low = 9'h132;
              4'h7: out_low = 9'h132;
              4'h8: out_low = 9'h132;
              4'h9: out_low = 9'h131;
              4'ha: out_low = 9'h131;
              4'hb: out_low = 9'h131;
              4'hc: out_low = 9'h131;
              4'hd: out_low = 9'h131;
              4'he: out_low = 9'h131;
              4'hf: out_low = 9'h130;
              default: out_low = 9'h000;
            endcase
          end
          6'h0f: begin
            case (mant[3:0])
              4'h0: out_low = 9'h130;
              4'h1: out_low = 9'h130;
              4'h2: out_low = 9'h130;
              4'h3: out_low = 9'h130;
              4'h4: out_low = 9'h130;
              4'h5: out_low = 9'h12f;
              4'h6: out_low = 9'h12f;
              4'h7: out_low = 9'h12f;
              4'h8: out_low = 9'h12f;
              4'h9: out_low = 9'h12f;
              4'ha: out_low = 9'h12f;
              4'hb: out_low = 9'h12f;
              4'hc: out_low = 9'h12e;
              4'hd: out_low = 9'h12e;
              4'he: out_low = 9'h12e;
              4'hf: out_low = 9'h12e;
              default: out_low = 9'h000;
            endcase
          end
          6'h10: begin
            case (mant[3:0])
              4'h0: out_low = 9'h12e;
              4'h1: out_low = 9'h12e;
              4'h2: out_low = 9'h12d;
              4'h3: out_low = 9'h12d;
              4'h4: out_low = 9'h12d;
              4'h5: out_low = 9'h12d;
              4'h6: out_low = 9'h12d;
              4'h7: out_low = 9'h12d;
              4'h8: out_low = 9'h12d;
              4'h9: out_low = 9'h12c;
              4'ha: out_low = 9'h12c;
              4'hb: out_low = 9'h12c;
              4'hc: out_low = 9'h12c;
              4'hd: out_low = 9'h12c;
              4'he: out_low = 9'h12c;
              4'hf: out_low = 9'h12b;
              default: out_low = 9'h000;
            endcase
          end
          6'h11: begin
            case (mant[3:0])
              4'h0: out_low = 9'h12b;
              4'h1: out_low = 9'h12b;
              4'h2: out_low = 9'h12b;
              4'h3: out_low = 9'h12b;
              4'h4: out_low = 9'h12b;
              4'h5: out_low = 9'h12b;
              4'h6: out_low = 9'h12a;
              4'h7: out_low = 9'h12a;
              4'h8: out_low = 9'h12a;
              4'h9: out_low = 9'h12a;
              4'ha: out_low = 9'h12a;
              4'hb: out_low = 9'h12a;
              4'hc: out_low = 9'h129;
              4'hd: out_low = 9'h129;
              4'he: out_low = 9'h129;
              4'hf: out_low = 9'h129;
              default: out_low = 9'h000;
            endcase
          end
          6'h12: begin
            case (mant[3:0])
              4'h0: out_low = 9'h129;
              4'h1: out_low = 9'h129;
              4'h2: out_low = 9'h129;
              4'h3: out_low = 9'h128;
              4'h4: out_low = 9'h128;
              4'h5: out_low = 9'h128;
              4'h6: out_low = 9'h128;
              4'h7: out_low = 9'h128;
              4'h8: out_low = 9'h128;
              4'h9: out_low = 9'h127;
              4'ha: out_low = 9'h127;
              4'hb: out_low = 9'h127;
              4'hc: out_low = 9'h127;
              4'hd: out_low = 9'h127;
              4'he: out_low = 9'h127;
              4'hf: out_low = 9'h126;
              default: out_low = 9'h000;
            endcase
          end
          6'h13: begin
            case (mant[3:0])
              4'h0: out_low = 9'h126;
              4'h1: out_low = 9'h126;
              4'h2: out_low = 9'h126;
              4'h3: out_low = 9'h126;
              4'h4: out_low = 9'h126;
              4'h5: out_low = 9'h126;
              4'h6: out_low = 9'h125;
              4'h7: out_low = 9'h125;
              4'h8: out_low = 9'h125;
              4'h9: out_low = 9'h125;
              4'ha: out_low = 9'h125;
              4'hb: out_low = 9'h125;
              4'hc: out_low = 9'h124;
              4'hd: out_low = 9'h124;
              4'he: out_low = 9'h124;
              4'hf: out_low = 9'h124;
              default: out_low = 9'h000;
            endcase
          end
          6'h14: begin
            case (mant[3:0])
              4'h0: out_low = 9'h124;
              4'h1: out_low = 9'h124;
              4'h2: out_low = 9'h124;
              4'h3: out_low = 9'h123;
              4'h4: out_low = 9'h123;
              4'h5: out_low = 9'h123;
              4'h6: out_low = 9'h123;
              4'h7: out_low = 9'h123;
              4'h8: out_low = 9'h123;
              4'h9: out_low = 9'h122;
              4'ha: out_low = 9'h122;
              4'hb: out_low = 9'h122;
              4'hc: out_low = 9'h122;
              4'hd: out_low = 9'h122;
              4'he: out_low = 9'h122;
              4'hf: out_low = 9'h122;
              default: out_low = 9'h000;
            endcase
          end
          6'h15: begin
            case (mant[3:0])
              4'h0: out_low = 9'h121;
              4'h1: out_low = 9'h121;
              4'h2: out_low = 9'h121;
              4'h3: out_low = 9'h121;
              4'h4: out_low = 9'h121;
              4'h5: out_low = 9'h121;
              4'h6: out_low = 9'h120;
              4'h7: out_low = 9'h120;
              4'h8: out_low = 9'h120;
              4'h9: out_low = 9'h120;
              4'ha: out_low = 9'h120;
              4'hb: out_low = 9'h120;
              4'hc: out_low = 9'h120;
              4'hd: out_low = 9'h11f;
              4'he: out_low = 9'h11f;
              4'hf: out_low = 9'h11f;
              default: out_low = 9'h000;
            endcase
          end
          6'h16: begin
            case (mant[3:0])
              4'h0: out_low = 9'h11f;
              4'h1: out_low = 9'h11f;
              4'h2: out_low = 9'h11f;
              4'h3: out_low = 9'h11e;
              4'h4: out_low = 9'h11e;
              4'h5: out_low = 9'h11e;
              4'h6: out_low = 9'h11e;
              4'h7: out_low = 9'h11e;
              4'h8: out_low = 9'h11e;
              4'h9: out_low = 9'h11e;
              4'ha: out_low = 9'h11d;
              4'hb: out_low = 9'h11d;
              4'hc: out_low = 9'h11d;
              4'hd: out_low = 9'h11d;
              4'he: out_low = 9'h11d;
              4'hf: out_low = 9'h11d;
              default: out_low = 9'h000;
            endcase
          end
          6'h17: begin
            case (mant[3:0])
              4'h0: out_low = 9'h11c;
              4'h1: out_low = 9'h11c;
              4'h2: out_low = 9'h11c;
              4'h3: out_low = 9'h11c;
              4'h4: out_low = 9'h11c;
              4'h5: out_low = 9'h11c;
              4'h6: out_low = 9'h11c;
              4'h7: out_low = 9'h11b;
              4'h8: out_low = 9'h11b;
              4'h9: out_low = 9'h11b;
              4'ha: out_low = 9'h11b;
              4'hb: out_low = 9'h11b;
              4'hc: out_low = 9'h11b;
              4'hd: out_low = 9'h11a;
              4'he: out_low = 9'h11a;
              4'hf: out_low = 9'h11a;
              default: out_low = 9'h000;
            endcase
          end
          6'h18: begin
            case (mant[3:0])
              4'h0: out_low = 9'h11a;
              4'h1: out_low = 9'h11a;
              4'h2: out_low = 9'h11a;
              4'h3: out_low = 9'h11a;
              4'h4: out_low = 9'h119;
              4'h5: out_low = 9'h119;
              4'h6: out_low = 9'h119;
              4'h7: out_low = 9'h119;
              4'h8: out_low = 9'h119;
              4'h9: out_low = 9'h119;
              4'ha: out_low = 9'h118;
              4'hb: out_low = 9'h118;
              4'hc: out_low = 9'h118;
              4'hd: out_low = 9'h118;
              4'he: out_low = 9'h118;
              4'hf: out_low = 9'h118;
              default: out_low = 9'h000;
            endcase
          end
          6'h19: begin
            case (mant[3:0])
              4'h0: out_low = 9'h118;
              4'h1: out_low = 9'h117;
              4'h2: out_low = 9'h117;
              4'h3: out_low = 9'h117;
              4'h4: out_low = 9'h117;
              4'h5: out_low = 9'h117;
              4'h6: out_low = 9'h117;
              4'h7: out_low = 9'h116;
              4'h8: out_low = 9'h116;
              4'h9: out_low = 9'h116;
              4'ha: out_low = 9'h116;
              4'hb: out_low = 9'h116;
              4'hc: out_low = 9'h116;
              4'hd: out_low = 9'h116;
              4'he: out_low = 9'h115;
              4'hf: out_low = 9'h115;
              default: out_low = 9'h000;
            endcase
          end
          6'h1a: begin
            case (mant[3:0])
              4'h0: out_low = 9'h115;
              4'h1: out_low = 9'h115;
              4'h2: out_low = 9'h115;
              4'h3: out_low = 9'h115;
              4'h4: out_low = 9'h114;
              4'h5: out_low = 9'h114;
              4'h6: out_low = 9'h114;
              4'h7: out_low = 9'h114;
              4'h8: out_low = 9'h114;
              4'h9: out_low = 9'h114;
              4'ha: out_low = 9'h114;
              4'hb: out_low = 9'h113;
              4'hc: out_low = 9'h113;
              4'hd: out_low = 9'h113;
              4'he: out_low = 9'h113;
              4'hf: out_low = 9'h113;
              default: out_low = 9'h000;
            endcase
          end
          6'h1b: begin
            case (mant[3:0])
              4'h0: out_low = 9'h113;
              4'h1: out_low = 9'h112;
              4'h2: out_low = 9'h112;
              4'h3: out_low = 9'h112;
              4'h4: out_low = 9'h112;
              4'h5: out_low = 9'h112;
              4'h6: out_low = 9'h112;
              4'h7: out_low = 9'h112;
              4'h8: out_low = 9'h111;
              4'h9: out_low = 9'h111;
              4'ha: out_low = 9'h111;
              4'hb: out_low = 9'h111;
              4'hc: out_low = 9'h111;
              4'hd: out_low = 9'h111;
              4'he: out_low = 9'h110;
              4'hf: out_low = 9'h110;
              default: out_low = 9'h000;
            endcase
          end
          6'h1c: begin
            case (mant[3:0])
              4'h0: out_low = 9'h110;
              4'h1: out_low = 9'h110;
              4'h2: out_low = 9'h110;
              4'h3: out_low = 9'h110;
              4'h4: out_low = 9'h110;
              4'h5: out_low = 9'h10f;
              4'h6: out_low = 9'h10f;
              4'h7: out_low = 9'h10f;
              4'h8: out_low = 9'h10f;
              4'h9: out_low = 9'h10f;
              4'ha: out_low = 9'h10f;
              4'hb: out_low = 9'h10e;
              4'hc: out_low = 9'h10e;
              4'hd: out_low = 9'h10e;
              4'he: out_low = 9'h10e;
              4'hf: out_low = 9'h10e;
              default: out_low = 9'h000;
            endcase
          end
          6'h1d: begin
            case (mant[3:0])
              4'h0: out_low = 9'h10e;
              4'h1: out_low = 9'h10e;
              4'h2: out_low = 9'h10d;
              4'h3: out_low = 9'h10d;
              4'h4: out_low = 9'h10d;
              4'h5: out_low = 9'h10d;
              4'h6: out_low = 9'h10d;
              4'h7: out_low = 9'h10d;
              4'h8: out_low = 9'h10c;
              4'h9: out_low = 9'h10c;
              4'ha: out_low = 9'h10c;
              4'hb: out_low = 9'h10c;
              4'hc: out_low = 9'h10c;
              4'hd: out_low = 9'h10c;
              4'he: out_low = 9'h10c;
              4'hf: out_low = 9'h10b;
              default: out_low = 9'h000;
            endcase
          end
          6'h1e: begin
            case (mant[3:0])
              4'h0: out_low = 9'h10b;
              4'h1: out_low = 9'h10b;
              4'h2: out_low = 9'h10b;
              4'h3: out_low = 9'h10b;
              4'h4: out_low = 9'h10b;
              4'h5: out_low = 9'h10b;
              4'h6: out_low = 9'h10a;
              4'h7: out_low = 9'h10a;
              4'h8: out_low = 9'h10a;
              4'h9: out_low = 9'h10a;
              4'ha: out_low = 9'h10a;
              4'hb: out_low = 9'h10a;
              4'hc: out_low = 9'h109;
              4'hd: out_low = 9'h109;
              4'he: out_low = 9'h109;
              4'hf: out_low = 9'h109;
              default: out_low = 9'h000;
            endcase
          end
          6'h1f: begin
            case (mant[3:0])
              4'h0: out_low = 9'h109;
              4'h1: out_low = 9'h109;
              4'h2: out_low = 9'h109;
              4'h3: out_low = 9'h108;
              4'h4: out_low = 9'h108;
              4'h5: out_low = 9'h108;
              4'h6: out_low = 9'h108;
              4'h7: out_low = 9'h108;
              4'h8: out_low = 9'h108;
              4'h9: out_low = 9'h107;
              4'ha: out_low = 9'h107;
              4'hb: out_low = 9'h107;
              4'hc: out_low = 9'h107;
              4'hd: out_low = 9'h107;
              4'he: out_low = 9'h107;
              4'hf: out_low = 9'h107;
              default: out_low = 9'h000;
            endcase
          end
          6'h20: begin
            case (mant[3:0])
              4'h0: out_low = 9'h106;
              4'h1: out_low = 9'h106;
              4'h2: out_low = 9'h106;
              4'h3: out_low = 9'h106;
              4'h4: out_low = 9'h106;
              4'h5: out_low = 9'h106;
              4'h6: out_low = 9'h105;
              4'h7: out_low = 9'h105;
              4'h8: out_low = 9'h105;
              4'h9: out_low = 9'h105;
              4'ha: out_low = 9'h105;
              4'hb: out_low = 9'h105;
              4'hc: out_low = 9'h105;
              4'hd: out_low = 9'h104;
              4'he: out_low = 9'h104;
              4'hf: out_low = 9'h104;
              default: out_low = 9'h000;
            endcase
          end
          6'h21: begin
            case (mant[3:0])
              4'h0: out_low = 9'h104;
              4'h1: out_low = 9'h104;
              4'h2: out_low = 9'h104;
              4'h3: out_low = 9'h104;
              4'h4: out_low = 9'h103;
              4'h5: out_low = 9'h103;
              4'h6: out_low = 9'h103;
              4'h7: out_low = 9'h103;
              4'h8: out_low = 9'h103;
              4'h9: out_low = 9'h103;
              4'ha: out_low = 9'h102;
              4'hb: out_low = 9'h102;
              4'hc: out_low = 9'h102;
              4'hd: out_low = 9'h102;
              4'he: out_low = 9'h102;
              4'hf: out_low = 9'h102;
              default: out_low = 9'h000;
            endcase
          end
          6'h22: begin
            case (mant[3:0])
              4'h0: out_low = 9'h102;
              4'h1: out_low = 9'h101;
              4'h2: out_low = 9'h101;
              4'h3: out_low = 9'h101;
              4'h4: out_low = 9'h101;
              4'h5: out_low = 9'h101;
              4'h6: out_low = 9'h101;
              4'h7: out_low = 9'h100;
              4'h8: out_low = 9'h100;
              4'h9: out_low = 9'h100;
              4'ha: out_low = 9'h100;
              4'hb: out_low = 9'h100;
              4'hc: out_low = 9'h100;
              4'hd: out_low = 9'h100;
              4'he: out_low = 9'h0ff;
              4'hf: out_low = 9'h0ff;
              default: out_low = 9'h000;
            endcase
          end
          6'h23: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0ff;
              4'h1: out_low = 9'h0ff;
              4'h2: out_low = 9'h0ff;
              4'h3: out_low = 9'h0ff;
              4'h4: out_low = 9'h0ff;
              4'h5: out_low = 9'h0fe;
              4'h6: out_low = 9'h0fe;
              4'h7: out_low = 9'h0fe;
              4'h8: out_low = 9'h0fe;
              4'h9: out_low = 9'h0fe;
              4'ha: out_low = 9'h0fe;
              4'hb: out_low = 9'h0fd;
              4'hc: out_low = 9'h0fd;
              4'hd: out_low = 9'h0fd;
              4'he: out_low = 9'h0fd;
              4'hf: out_low = 9'h0fd;
              default: out_low = 9'h000;
            endcase
          end
          6'h24: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0fd;
              4'h1: out_low = 9'h0fd;
              4'h2: out_low = 9'h0fc;
              4'h3: out_low = 9'h0fc;
              4'h4: out_low = 9'h0fc;
              4'h5: out_low = 9'h0fc;
              4'h6: out_low = 9'h0fc;
              4'h7: out_low = 9'h0fc;
              4'h8: out_low = 9'h0fb;
              4'h9: out_low = 9'h0fb;
              4'ha: out_low = 9'h0fb;
              4'hb: out_low = 9'h0fb;
              4'hc: out_low = 9'h0fb;
              4'hd: out_low = 9'h0fb;
              4'he: out_low = 9'h0fb;
              4'hf: out_low = 9'h0fa;
              default: out_low = 9'h000;
            endcase
          end
          6'h25: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0fa;
              4'h1: out_low = 9'h0fa;
              4'h2: out_low = 9'h0fa;
              4'h3: out_low = 9'h0fa;
              4'h4: out_low = 9'h0fa;
              4'h5: out_low = 9'h0fa;
              4'h6: out_low = 9'h0f9;
              4'h7: out_low = 9'h0f9;
              4'h8: out_low = 9'h0f9;
              4'h9: out_low = 9'h0f9;
              4'ha: out_low = 9'h0f9;
              4'hb: out_low = 9'h0f9;
              4'hc: out_low = 9'h0f8;
              4'hd: out_low = 9'h0f8;
              4'he: out_low = 9'h0f8;
              4'hf: out_low = 9'h0f8;
              default: out_low = 9'h000;
            endcase
          end
          6'h26: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0f8;
              4'h1: out_low = 9'h0f8;
              4'h2: out_low = 9'h0f8;
              4'h3: out_low = 9'h0f7;
              4'h4: out_low = 9'h0f7;
              4'h5: out_low = 9'h0f7;
              4'h6: out_low = 9'h0f7;
              4'h7: out_low = 9'h0f7;
              4'h8: out_low = 9'h0f7;
              4'h9: out_low = 9'h0f6;
              4'ha: out_low = 9'h0f6;
              4'hb: out_low = 9'h0f6;
              4'hc: out_low = 9'h0f6;
              4'hd: out_low = 9'h0f6;
              4'he: out_low = 9'h0f6;
              4'hf: out_low = 9'h0f6;
              default: out_low = 9'h000;
            endcase
          end
          6'h27: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0f5;
              4'h1: out_low = 9'h0f5;
              4'h2: out_low = 9'h0f5;
              4'h3: out_low = 9'h0f5;
              4'h4: out_low = 9'h0f5;
              4'h5: out_low = 9'h0f5;
              4'h6: out_low = 9'h0f5;
              4'h7: out_low = 9'h0f4;
              4'h8: out_low = 9'h0f4;
              4'h9: out_low = 9'h0f4;
              4'ha: out_low = 9'h0f4;
              4'hb: out_low = 9'h0f4;
              4'hc: out_low = 9'h0f4;
              4'hd: out_low = 9'h0f3;
              4'he: out_low = 9'h0f3;
              4'hf: out_low = 9'h0f3;
              default: out_low = 9'h000;
            endcase
          end
          6'h28: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0f3;
              4'h1: out_low = 9'h0f3;
              4'h2: out_low = 9'h0f3;
              4'h3: out_low = 9'h0f3;
              4'h4: out_low = 9'h0f2;
              4'h5: out_low = 9'h0f2;
              4'h6: out_low = 9'h0f2;
              4'h7: out_low = 9'h0f2;
              4'h8: out_low = 9'h0f2;
              4'h9: out_low = 9'h0f2;
              4'ha: out_low = 9'h0f2;
              4'hb: out_low = 9'h0f1;
              4'hc: out_low = 9'h0f1;
              4'hd: out_low = 9'h0f1;
              4'he: out_low = 9'h0f1;
              4'hf: out_low = 9'h0f1;
              default: out_low = 9'h000;
            endcase
          end
          6'h29: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0f1;
              4'h1: out_low = 9'h0f0;
              4'h2: out_low = 9'h0f0;
              4'h3: out_low = 9'h0f0;
              4'h4: out_low = 9'h0f0;
              4'h5: out_low = 9'h0f0;
              4'h6: out_low = 9'h0f0;
              4'h7: out_low = 9'h0f0;
              4'h8: out_low = 9'h0ef;
              4'h9: out_low = 9'h0ef;
              4'ha: out_low = 9'h0ef;
              4'hb: out_low = 9'h0ef;
              4'hc: out_low = 9'h0ef;
              4'hd: out_low = 9'h0ef;
              4'he: out_low = 9'h0ef;
              4'hf: out_low = 9'h0ee;
              default: out_low = 9'h000;
            endcase
          end
          6'h2a: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0ee;
              4'h1: out_low = 9'h0ee;
              4'h2: out_low = 9'h0ee;
              4'h3: out_low = 9'h0ee;
              4'h4: out_low = 9'h0ee;
              4'h5: out_low = 9'h0ed;
              4'h6: out_low = 9'h0ed;
              4'h7: out_low = 9'h0ed;
              4'h8: out_low = 9'h0ed;
              4'h9: out_low = 9'h0ed;
              4'ha: out_low = 9'h0ed;
              4'hb: out_low = 9'h0ed;
              4'hc: out_low = 9'h0ec;
              4'hd: out_low = 9'h0ec;
              4'he: out_low = 9'h0ec;
              4'hf: out_low = 9'h0ec;
              default: out_low = 9'h000;
            endcase
          end
          6'h2b: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0ec;
              4'h1: out_low = 9'h0ec;
              4'h2: out_low = 9'h0ec;
              4'h3: out_low = 9'h0eb;
              4'h4: out_low = 9'h0eb;
              4'h5: out_low = 9'h0eb;
              4'h6: out_low = 9'h0eb;
              4'h7: out_low = 9'h0eb;
              4'h8: out_low = 9'h0eb;
              4'h9: out_low = 9'h0ea;
              4'ha: out_low = 9'h0ea;
              4'hb: out_low = 9'h0ea;
              4'hc: out_low = 9'h0ea;
              4'hd: out_low = 9'h0ea;
              4'he: out_low = 9'h0ea;
              4'hf: out_low = 9'h0ea;
              default: out_low = 9'h000;
            endcase
          end
          6'h2c: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0e9;
              4'h1: out_low = 9'h0e9;
              4'h2: out_low = 9'h0e9;
              4'h3: out_low = 9'h0e9;
              4'h4: out_low = 9'h0e9;
              4'h5: out_low = 9'h0e9;
              4'h6: out_low = 9'h0e9;
              4'h7: out_low = 9'h0e8;
              4'h8: out_low = 9'h0e8;
              4'h9: out_low = 9'h0e8;
              4'ha: out_low = 9'h0e8;
              4'hb: out_low = 9'h0e8;
              4'hc: out_low = 9'h0e8;
              4'hd: out_low = 9'h0e7;
              4'he: out_low = 9'h0e7;
              4'hf: out_low = 9'h0e7;
              default: out_low = 9'h000;
            endcase
          end
          6'h2d: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0e7;
              4'h1: out_low = 9'h0e7;
              4'h2: out_low = 9'h0e7;
              4'h3: out_low = 9'h0e7;
              4'h4: out_low = 9'h0e6;
              4'h5: out_low = 9'h0e6;
              4'h6: out_low = 9'h0e6;
              4'h7: out_low = 9'h0e6;
              4'h8: out_low = 9'h0e6;
              4'h9: out_low = 9'h0e6;
              4'ha: out_low = 9'h0e6;
              4'hb: out_low = 9'h0e5;
              4'hc: out_low = 9'h0e5;
              4'hd: out_low = 9'h0e5;
              4'he: out_low = 9'h0e5;
              4'hf: out_low = 9'h0e5;
              default: out_low = 9'h000;
            endcase
          end
          6'h2e: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0e5;
              4'h1: out_low = 9'h0e4;
              4'h2: out_low = 9'h0e4;
              4'h3: out_low = 9'h0e4;
              4'h4: out_low = 9'h0e4;
              4'h5: out_low = 9'h0e4;
              4'h6: out_low = 9'h0e4;
              4'h7: out_low = 9'h0e4;
              4'h8: out_low = 9'h0e3;
              4'h9: out_low = 9'h0e3;
              4'ha: out_low = 9'h0e3;
              4'hb: out_low = 9'h0e3;
              4'hc: out_low = 9'h0e3;
              4'hd: out_low = 9'h0e3;
              4'he: out_low = 9'h0e3;
              4'hf: out_low = 9'h0e2;
              default: out_low = 9'h000;
            endcase
          end
          6'h2f: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0e2;
              4'h1: out_low = 9'h0e2;
              4'h2: out_low = 9'h0e2;
              4'h3: out_low = 9'h0e2;
              4'h4: out_low = 9'h0e2;
              4'h5: out_low = 9'h0e2;
              4'h6: out_low = 9'h0e1;
              4'h7: out_low = 9'h0e1;
              4'h8: out_low = 9'h0e1;
              4'h9: out_low = 9'h0e1;
              4'ha: out_low = 9'h0e1;
              4'hb: out_low = 9'h0e1;
              4'hc: out_low = 9'h0e0;
              4'hd: out_low = 9'h0e0;
              4'he: out_low = 9'h0e0;
              4'hf: out_low = 9'h0e0;
              default: out_low = 9'h000;
            endcase
          end
          6'h30: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0e0;
              4'h1: out_low = 9'h0e0;
              4'h2: out_low = 9'h0e0;
              4'h3: out_low = 9'h0df;
              4'h4: out_low = 9'h0df;
              4'h5: out_low = 9'h0df;
              4'h6: out_low = 9'h0df;
              4'h7: out_low = 9'h0df;
              4'h8: out_low = 9'h0df;
              4'h9: out_low = 9'h0df;
              4'ha: out_low = 9'h0de;
              4'hb: out_low = 9'h0de;
              4'hc: out_low = 9'h0de;
              4'hd: out_low = 9'h0de;
              4'he: out_low = 9'h0de;
              4'hf: out_low = 9'h0de;
              default: out_low = 9'h000;
            endcase
          end
          6'h31: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0dd;
              4'h1: out_low = 9'h0dd;
              4'h2: out_low = 9'h0dd;
              4'h3: out_low = 9'h0dd;
              4'h4: out_low = 9'h0dd;
              4'h5: out_low = 9'h0dd;
              4'h6: out_low = 9'h0dd;
              4'h7: out_low = 9'h0dc;
              4'h8: out_low = 9'h0dc;
              4'h9: out_low = 9'h0dc;
              4'ha: out_low = 9'h0dc;
              4'hb: out_low = 9'h0dc;
              4'hc: out_low = 9'h0dc;
              4'hd: out_low = 9'h0dc;
              4'he: out_low = 9'h0db;
              4'hf: out_low = 9'h0db;
              default: out_low = 9'h000;
            endcase
          end
          6'h32: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0db;
              4'h1: out_low = 9'h0db;
              4'h2: out_low = 9'h0db;
              4'h3: out_low = 9'h0db;
              4'h4: out_low = 9'h0db;
              4'h5: out_low = 9'h0da;
              4'h6: out_low = 9'h0da;
              4'h7: out_low = 9'h0da;
              4'h8: out_low = 9'h0da;
              4'h9: out_low = 9'h0da;
              4'ha: out_low = 9'h0da;
              4'hb: out_low = 9'h0d9;
              4'hc: out_low = 9'h0d9;
              4'hd: out_low = 9'h0d9;
              4'he: out_low = 9'h0d9;
              4'hf: out_low = 9'h0d9;
              default: out_low = 9'h000;
            endcase
          end
          6'h33: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0d9;
              4'h1: out_low = 9'h0d9;
              4'h2: out_low = 9'h0d8;
              4'h3: out_low = 9'h0d8;
              4'h4: out_low = 9'h0d8;
              4'h5: out_low = 9'h0d8;
              4'h6: out_low = 9'h0d8;
              4'h7: out_low = 9'h0d8;
              4'h8: out_low = 9'h0d8;
              4'h9: out_low = 9'h0d7;
              4'ha: out_low = 9'h0d7;
              4'hb: out_low = 9'h0d7;
              4'hc: out_low = 9'h0d7;
              4'hd: out_low = 9'h0d7;
              4'he: out_low = 9'h0d7;
              4'hf: out_low = 9'h0d7;
              default: out_low = 9'h000;
            endcase
          end
          6'h34: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0d6;
              4'h1: out_low = 9'h0d6;
              4'h2: out_low = 9'h0d6;
              4'h3: out_low = 9'h0d6;
              4'h4: out_low = 9'h0d6;
              4'h5: out_low = 9'h0d6;
              4'h6: out_low = 9'h0d5;
              4'h7: out_low = 9'h0d5;
              4'h8: out_low = 9'h0d5;
              4'h9: out_low = 9'h0d5;
              4'ha: out_low = 9'h0d5;
              4'hb: out_low = 9'h0d5;
              4'hc: out_low = 9'h0d5;
              4'hd: out_low = 9'h0d4;
              4'he: out_low = 9'h0d4;
              4'hf: out_low = 9'h0d4;
              default: out_low = 9'h000;
            endcase
          end
          6'h35: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0d4;
              4'h1: out_low = 9'h0d4;
              4'h2: out_low = 9'h0d4;
              4'h3: out_low = 9'h0d4;
              4'h4: out_low = 9'h0d3;
              4'h5: out_low = 9'h0d3;
              4'h6: out_low = 9'h0d3;
              4'h7: out_low = 9'h0d3;
              4'h8: out_low = 9'h0d3;
              4'h9: out_low = 9'h0d3;
              4'ha: out_low = 9'h0d3;
              4'hb: out_low = 9'h0d2;
              4'hc: out_low = 9'h0d2;
              4'hd: out_low = 9'h0d2;
              4'he: out_low = 9'h0d2;
              4'hf: out_low = 9'h0d2;
              default: out_low = 9'h000;
            endcase
          end
          6'h36: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0d2;
              4'h1: out_low = 9'h0d1;
              4'h2: out_low = 9'h0d1;
              4'h3: out_low = 9'h0d1;
              4'h4: out_low = 9'h0d1;
              4'h5: out_low = 9'h0d1;
              4'h6: out_low = 9'h0d1;
              4'h7: out_low = 9'h0d1;
              4'h8: out_low = 9'h0d0;
              4'h9: out_low = 9'h0d0;
              4'ha: out_low = 9'h0d0;
              4'hb: out_low = 9'h0d0;
              4'hc: out_low = 9'h0d0;
              4'hd: out_low = 9'h0d0;
              4'he: out_low = 9'h0d0;
              4'hf: out_low = 9'h0cf;
              default: out_low = 9'h000;
            endcase
          end
          6'h37: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0cf;
              4'h1: out_low = 9'h0cf;
              4'h2: out_low = 9'h0cf;
              4'h3: out_low = 9'h0cf;
              4'h4: out_low = 9'h0cf;
              4'h5: out_low = 9'h0cf;
              4'h6: out_low = 9'h0ce;
              4'h7: out_low = 9'h0ce;
              4'h8: out_low = 9'h0ce;
              4'h9: out_low = 9'h0ce;
              4'ha: out_low = 9'h0ce;
              4'hb: out_low = 9'h0ce;
              4'hc: out_low = 9'h0cd;
              4'hd: out_low = 9'h0cd;
              4'he: out_low = 9'h0cd;
              4'hf: out_low = 9'h0cd;
              default: out_low = 9'h000;
            endcase
          end
          6'h38: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0cd;
              4'h1: out_low = 9'h0cd;
              4'h2: out_low = 9'h0cd;
              4'h3: out_low = 9'h0cc;
              4'h4: out_low = 9'h0cc;
              4'h5: out_low = 9'h0cc;
              4'h6: out_low = 9'h0cc;
              4'h7: out_low = 9'h0cc;
              4'h8: out_low = 9'h0cc;
              4'h9: out_low = 9'h0cc;
              4'ha: out_low = 9'h0cb;
              4'hb: out_low = 9'h0cb;
              4'hc: out_low = 9'h0cb;
              4'hd: out_low = 9'h0cb;
              4'he: out_low = 9'h0cb;
              4'hf: out_low = 9'h0cb;
              default: out_low = 9'h000;
            endcase
          end
          6'h39: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0cb;
              4'h1: out_low = 9'h0ca;
              4'h2: out_low = 9'h0ca;
              4'h3: out_low = 9'h0ca;
              4'h4: out_low = 9'h0ca;
              4'h5: out_low = 9'h0ca;
              4'h6: out_low = 9'h0ca;
              4'h7: out_low = 9'h0ca;
              4'h8: out_low = 9'h0c9;
              4'h9: out_low = 9'h0c9;
              4'ha: out_low = 9'h0c9;
              4'hb: out_low = 9'h0c9;
              4'hc: out_low = 9'h0c9;
              4'hd: out_low = 9'h0c9;
              4'he: out_low = 9'h0c8;
              4'hf: out_low = 9'h0c8;
              default: out_low = 9'h000;
            endcase
          end
          6'h3a: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0c8;
              4'h1: out_low = 9'h0c8;
              4'h2: out_low = 9'h0c8;
              4'h3: out_low = 9'h0c8;
              4'h4: out_low = 9'h0c8;
              4'h5: out_low = 9'h0c7;
              4'h6: out_low = 9'h0c7;
              4'h7: out_low = 9'h0c7;
              4'h8: out_low = 9'h0c7;
              4'h9: out_low = 9'h0c7;
              4'ha: out_low = 9'h0c7;
              4'hb: out_low = 9'h0c7;
              4'hc: out_low = 9'h0c6;
              4'hd: out_low = 9'h0c6;
              4'he: out_low = 9'h0c6;
              4'hf: out_low = 9'h0c6;
              default: out_low = 9'h000;
            endcase
          end
          6'h3b: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0c6;
              4'h1: out_low = 9'h0c6;
              4'h2: out_low = 9'h0c6;
              4'h3: out_low = 9'h0c5;
              4'h4: out_low = 9'h0c5;
              4'h5: out_low = 9'h0c5;
              4'h6: out_low = 9'h0c5;
              4'h7: out_low = 9'h0c5;
              4'h8: out_low = 9'h0c5;
              4'h9: out_low = 9'h0c5;
              4'ha: out_low = 9'h0c4;
              4'hb: out_low = 9'h0c4;
              4'hc: out_low = 9'h0c4;
              4'hd: out_low = 9'h0c4;
              4'he: out_low = 9'h0c4;
              4'hf: out_low = 9'h0c4;
              default: out_low = 9'h000;
            endcase
          end
          6'h3c: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0c4;
              4'h1: out_low = 9'h0c3;
              4'h2: out_low = 9'h0c3;
              4'h3: out_low = 9'h0c3;
              4'h4: out_low = 9'h0c3;
              4'h5: out_low = 9'h0c3;
              4'h6: out_low = 9'h0c3;
              4'h7: out_low = 9'h0c2;
              4'h8: out_low = 9'h0c2;
              4'h9: out_low = 9'h0c2;
              4'ha: out_low = 9'h0c2;
              4'hb: out_low = 9'h0c2;
              4'hc: out_low = 9'h0c2;
              4'hd: out_low = 9'h0c2;
              4'he: out_low = 9'h0c1;
              4'hf: out_low = 9'h0c1;
              default: out_low = 9'h000;
            endcase
          end
          6'h3d: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0c1;
              4'h1: out_low = 9'h0c1;
              4'h2: out_low = 9'h0c1;
              4'h3: out_low = 9'h0c1;
              4'h4: out_low = 9'h0c1;
              4'h5: out_low = 9'h0c0;
              4'h6: out_low = 9'h0c0;
              4'h7: out_low = 9'h0c0;
              4'h8: out_low = 9'h0c0;
              4'h9: out_low = 9'h0c0;
              4'ha: out_low = 9'h0c0;
              4'hb: out_low = 9'h0c0;
              4'hc: out_low = 9'h0bf;
              4'hd: out_low = 9'h0bf;
              4'he: out_low = 9'h0bf;
              4'hf: out_low = 9'h0bf;
              default: out_low = 9'h000;
            endcase
          end
          6'h3e: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0bf;
              4'h1: out_low = 9'h0bf;
              4'h2: out_low = 9'h0bf;
              4'h3: out_low = 9'h0be;
              4'h4: out_low = 9'h0be;
              4'h5: out_low = 9'h0be;
              4'h6: out_low = 9'h0be;
              4'h7: out_low = 9'h0be;
              4'h8: out_low = 9'h0be;
              4'h9: out_low = 9'h0be;
              4'ha: out_low = 9'h0bd;
              4'hb: out_low = 9'h0bd;
              4'hc: out_low = 9'h0bd;
              4'hd: out_low = 9'h0bd;
              4'he: out_low = 9'h0bd;
              4'hf: out_low = 9'h0bd;
              default: out_low = 9'h000;
            endcase
          end
          6'h3f: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0bc;
              4'h1: out_low = 9'h0bc;
              4'h2: out_low = 9'h0bc;
              4'h3: out_low = 9'h0bc;
              4'h4: out_low = 9'h0bc;
              4'h5: out_low = 9'h0bc;
              4'h6: out_low = 9'h0bc;
              4'h7: out_low = 9'h0bb;
              4'h8: out_low = 9'h0bb;
              4'h9: out_low = 9'h0bb;
              4'ha: out_low = 9'h0bb;
              4'hb: out_low = 9'h0bb;
              4'hc: out_low = 9'h0bb;
              4'hd: out_low = 9'h0bb;
              4'he: out_low = 9'h0ba;
              4'hf: out_low = 9'h0ba;
              default: out_low = 9'h000;
            endcase
          end
          default: out_low = 9'h000;
        endcase
      end
      6'h2d: begin
        case (mant[9:4])
          6'h00: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0ba;
              4'h1: out_low = 9'h0ba;
              4'h2: out_low = 9'h0ba;
              4'h3: out_low = 9'h0b9;
              4'h4: out_low = 9'h0b9;
              4'h5: out_low = 9'h0b9;
              4'h6: out_low = 9'h0b8;
              4'h7: out_low = 9'h0b8;
              4'h8: out_low = 9'h0b8;
              4'h9: out_low = 9'h0b8;
              4'ha: out_low = 9'h0b7;
              4'hb: out_low = 9'h0b7;
              4'hc: out_low = 9'h0b7;
              4'hd: out_low = 9'h0b6;
              4'he: out_low = 9'h0b6;
              4'hf: out_low = 9'h0b6;
              default: out_low = 9'h000;
            endcase
          end
          6'h01: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0b5;
              4'h1: out_low = 9'h0b5;
              4'h2: out_low = 9'h0b5;
              4'h3: out_low = 9'h0b5;
              4'h4: out_low = 9'h0b4;
              4'h5: out_low = 9'h0b4;
              4'h6: out_low = 9'h0b4;
              4'h7: out_low = 9'h0b3;
              4'h8: out_low = 9'h0b3;
              4'h9: out_low = 9'h0b3;
              4'ha: out_low = 9'h0b3;
              4'hb: out_low = 9'h0b2;
              4'hc: out_low = 9'h0b2;
              4'hd: out_low = 9'h0b2;
              4'he: out_low = 9'h0b1;
              4'hf: out_low = 9'h0b1;
              default: out_low = 9'h000;
            endcase
          end
          6'h02: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0b1;
              4'h1: out_low = 9'h0b1;
              4'h2: out_low = 9'h0b0;
              4'h3: out_low = 9'h0b0;
              4'h4: out_low = 9'h0b0;
              4'h5: out_low = 9'h0af;
              4'h6: out_low = 9'h0af;
              4'h7: out_low = 9'h0af;
              4'h8: out_low = 9'h0af;
              4'h9: out_low = 9'h0ae;
              4'ha: out_low = 9'h0ae;
              4'hb: out_low = 9'h0ae;
              4'hc: out_low = 9'h0ad;
              4'hd: out_low = 9'h0ad;
              4'he: out_low = 9'h0ad;
              4'hf: out_low = 9'h0ad;
              default: out_low = 9'h000;
            endcase
          end
          6'h03: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0ac;
              4'h1: out_low = 9'h0ac;
              4'h2: out_low = 9'h0ac;
              4'h3: out_low = 9'h0ab;
              4'h4: out_low = 9'h0ab;
              4'h5: out_low = 9'h0ab;
              4'h6: out_low = 9'h0aa;
              4'h7: out_low = 9'h0aa;
              4'h8: out_low = 9'h0aa;
              4'h9: out_low = 9'h0aa;
              4'ha: out_low = 9'h0a9;
              4'hb: out_low = 9'h0a9;
              4'hc: out_low = 9'h0a9;
              4'hd: out_low = 9'h0a8;
              4'he: out_low = 9'h0a8;
              4'hf: out_low = 9'h0a8;
              default: out_low = 9'h000;
            endcase
          end
          6'h04: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0a8;
              4'h1: out_low = 9'h0a7;
              4'h2: out_low = 9'h0a7;
              4'h3: out_low = 9'h0a7;
              4'h4: out_low = 9'h0a6;
              4'h5: out_low = 9'h0a6;
              4'h6: out_low = 9'h0a6;
              4'h7: out_low = 9'h0a6;
              4'h8: out_low = 9'h0a5;
              4'h9: out_low = 9'h0a5;
              4'ha: out_low = 9'h0a5;
              4'hb: out_low = 9'h0a4;
              4'hc: out_low = 9'h0a4;
              4'hd: out_low = 9'h0a4;
              4'he: out_low = 9'h0a4;
              4'hf: out_low = 9'h0a3;
              default: out_low = 9'h000;
            endcase
          end
          6'h05: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0a3;
              4'h1: out_low = 9'h0a3;
              4'h2: out_low = 9'h0a2;
              4'h3: out_low = 9'h0a2;
              4'h4: out_low = 9'h0a2;
              4'h5: out_low = 9'h0a2;
              4'h6: out_low = 9'h0a1;
              4'h7: out_low = 9'h0a1;
              4'h8: out_low = 9'h0a1;
              4'h9: out_low = 9'h0a0;
              4'ha: out_low = 9'h0a0;
              4'hb: out_low = 9'h0a0;
              4'hc: out_low = 9'h0a0;
              4'hd: out_low = 9'h09f;
              4'he: out_low = 9'h09f;
              4'hf: out_low = 9'h09f;
              default: out_low = 9'h000;
            endcase
          end
          6'h06: begin
            case (mant[3:0])
              4'h0: out_low = 9'h09e;
              4'h1: out_low = 9'h09e;
              4'h2: out_low = 9'h09e;
              4'h3: out_low = 9'h09e;
              4'h4: out_low = 9'h09d;
              4'h5: out_low = 9'h09d;
              4'h6: out_low = 9'h09d;
              4'h7: out_low = 9'h09c;
              4'h8: out_low = 9'h09c;
              4'h9: out_low = 9'h09c;
              4'ha: out_low = 9'h09c;
              4'hb: out_low = 9'h09b;
              4'hc: out_low = 9'h09b;
              4'hd: out_low = 9'h09b;
              4'he: out_low = 9'h09a;
              4'hf: out_low = 9'h09a;
              default: out_low = 9'h000;
            endcase
          end
          6'h07: begin
            case (mant[3:0])
              4'h0: out_low = 9'h09a;
              4'h1: out_low = 9'h09a;
              4'h2: out_low = 9'h099;
              4'h3: out_low = 9'h099;
              4'h4: out_low = 9'h099;
              4'h5: out_low = 9'h098;
              4'h6: out_low = 9'h098;
              4'h7: out_low = 9'h098;
              4'h8: out_low = 9'h098;
              4'h9: out_low = 9'h097;
              4'ha: out_low = 9'h097;
              4'hb: out_low = 9'h097;
              4'hc: out_low = 9'h096;
              4'hd: out_low = 9'h096;
              4'he: out_low = 9'h096;
              4'hf: out_low = 9'h096;
              default: out_low = 9'h000;
            endcase
          end
          6'h08: begin
            case (mant[3:0])
              4'h0: out_low = 9'h095;
              4'h1: out_low = 9'h095;
              4'h2: out_low = 9'h095;
              4'h3: out_low = 9'h094;
              4'h4: out_low = 9'h094;
              4'h5: out_low = 9'h094;
              4'h6: out_low = 9'h094;
              4'h7: out_low = 9'h093;
              4'h8: out_low = 9'h093;
              4'h9: out_low = 9'h093;
              4'ha: out_low = 9'h092;
              4'hb: out_low = 9'h092;
              4'hc: out_low = 9'h092;
              4'hd: out_low = 9'h092;
              4'he: out_low = 9'h091;
              4'hf: out_low = 9'h091;
              default: out_low = 9'h000;
            endcase
          end
          6'h09: begin
            case (mant[3:0])
              4'h0: out_low = 9'h091;
              4'h1: out_low = 9'h090;
              4'h2: out_low = 9'h090;
              4'h3: out_low = 9'h090;
              4'h4: out_low = 9'h090;
              4'h5: out_low = 9'h08f;
              4'h6: out_low = 9'h08f;
              4'h7: out_low = 9'h08f;
              4'h8: out_low = 9'h08e;
              4'h9: out_low = 9'h08e;
              4'ha: out_low = 9'h08e;
              4'hb: out_low = 9'h08e;
              4'hc: out_low = 9'h08d;
              4'hd: out_low = 9'h08d;
              4'he: out_low = 9'h08d;
              4'hf: out_low = 9'h08c;
              default: out_low = 9'h000;
            endcase
          end
          6'h0a: begin
            case (mant[3:0])
              4'h0: out_low = 9'h08c;
              4'h1: out_low = 9'h08c;
              4'h2: out_low = 9'h08c;
              4'h3: out_low = 9'h08b;
              4'h4: out_low = 9'h08b;
              4'h5: out_low = 9'h08b;
              4'h6: out_low = 9'h08a;
              4'h7: out_low = 9'h08a;
              4'h8: out_low = 9'h08a;
              4'h9: out_low = 9'h08a;
              4'ha: out_low = 9'h089;
              4'hb: out_low = 9'h089;
              4'hc: out_low = 9'h089;
              4'hd: out_low = 9'h088;
              4'he: out_low = 9'h088;
              4'hf: out_low = 9'h088;
              default: out_low = 9'h000;
            endcase
          end
          6'h0b: begin
            case (mant[3:0])
              4'h0: out_low = 9'h088;
              4'h1: out_low = 9'h087;
              4'h2: out_low = 9'h087;
              4'h3: out_low = 9'h087;
              4'h4: out_low = 9'h086;
              4'h5: out_low = 9'h086;
              4'h6: out_low = 9'h086;
              4'h7: out_low = 9'h086;
              4'h8: out_low = 9'h085;
              4'h9: out_low = 9'h085;
              4'ha: out_low = 9'h085;
              4'hb: out_low = 9'h085;
              4'hc: out_low = 9'h084;
              4'hd: out_low = 9'h084;
              4'he: out_low = 9'h084;
              4'hf: out_low = 9'h083;
              default: out_low = 9'h000;
            endcase
          end
          6'h0c: begin
            case (mant[3:0])
              4'h0: out_low = 9'h083;
              4'h1: out_low = 9'h083;
              4'h2: out_low = 9'h083;
              4'h3: out_low = 9'h082;
              4'h4: out_low = 9'h082;
              4'h5: out_low = 9'h082;
              4'h6: out_low = 9'h081;
              4'h7: out_low = 9'h081;
              4'h8: out_low = 9'h081;
              4'h9: out_low = 9'h081;
              4'ha: out_low = 9'h080;
              4'hb: out_low = 9'h080;
              4'hc: out_low = 9'h080;
              4'hd: out_low = 9'h07f;
              4'he: out_low = 9'h07f;
              4'hf: out_low = 9'h07f;
              default: out_low = 9'h000;
            endcase
          end
          6'h0d: begin
            case (mant[3:0])
              4'h0: out_low = 9'h07f;
              4'h1: out_low = 9'h07e;
              4'h2: out_low = 9'h07e;
              4'h3: out_low = 9'h07e;
              4'h4: out_low = 9'h07d;
              4'h5: out_low = 9'h07d;
              4'h6: out_low = 9'h07d;
              4'h7: out_low = 9'h07d;
              4'h8: out_low = 9'h07c;
              4'h9: out_low = 9'h07c;
              4'ha: out_low = 9'h07c;
              4'hb: out_low = 9'h07c;
              4'hc: out_low = 9'h07b;
              4'hd: out_low = 9'h07b;
              4'he: out_low = 9'h07b;
              4'hf: out_low = 9'h07a;
              default: out_low = 9'h000;
            endcase
          end
          6'h0e: begin
            case (mant[3:0])
              4'h0: out_low = 9'h07a;
              4'h1: out_low = 9'h07a;
              4'h2: out_low = 9'h07a;
              4'h3: out_low = 9'h079;
              4'h4: out_low = 9'h079;
              4'h5: out_low = 9'h079;
              4'h6: out_low = 9'h078;
              4'h7: out_low = 9'h078;
              4'h8: out_low = 9'h078;
              4'h9: out_low = 9'h078;
              4'ha: out_low = 9'h077;
              4'hb: out_low = 9'h077;
              4'hc: out_low = 9'h077;
              4'hd: out_low = 9'h076;
              4'he: out_low = 9'h076;
              4'hf: out_low = 9'h076;
              default: out_low = 9'h000;
            endcase
          end
          6'h0f: begin
            case (mant[3:0])
              4'h0: out_low = 9'h076;
              4'h1: out_low = 9'h075;
              4'h2: out_low = 9'h075;
              4'h3: out_low = 9'h075;
              4'h4: out_low = 9'h074;
              4'h5: out_low = 9'h074;
              4'h6: out_low = 9'h074;
              4'h7: out_low = 9'h074;
              4'h8: out_low = 9'h073;
              4'h9: out_low = 9'h073;
              4'ha: out_low = 9'h073;
              4'hb: out_low = 9'h073;
              4'hc: out_low = 9'h072;
              4'hd: out_low = 9'h072;
              4'he: out_low = 9'h072;
              4'hf: out_low = 9'h071;
              default: out_low = 9'h000;
            endcase
          end
          6'h10: begin
            case (mant[3:0])
              4'h0: out_low = 9'h071;
              4'h1: out_low = 9'h071;
              4'h2: out_low = 9'h071;
              4'h3: out_low = 9'h070;
              4'h4: out_low = 9'h070;
              4'h5: out_low = 9'h070;
              4'h6: out_low = 9'h06f;
              4'h7: out_low = 9'h06f;
              4'h8: out_low = 9'h06f;
              4'h9: out_low = 9'h06f;
              4'ha: out_low = 9'h06e;
              4'hb: out_low = 9'h06e;
              4'hc: out_low = 9'h06e;
              4'hd: out_low = 9'h06e;
              4'he: out_low = 9'h06d;
              4'hf: out_low = 9'h06d;
              default: out_low = 9'h000;
            endcase
          end
          6'h11: begin
            case (mant[3:0])
              4'h0: out_low = 9'h06d;
              4'h1: out_low = 9'h06c;
              4'h2: out_low = 9'h06c;
              4'h3: out_low = 9'h06c;
              4'h4: out_low = 9'h06c;
              4'h5: out_low = 9'h06b;
              4'h6: out_low = 9'h06b;
              4'h7: out_low = 9'h06b;
              4'h8: out_low = 9'h06a;
              4'h9: out_low = 9'h06a;
              4'ha: out_low = 9'h06a;
              4'hb: out_low = 9'h06a;
              4'hc: out_low = 9'h069;
              4'hd: out_low = 9'h069;
              4'he: out_low = 9'h069;
              4'hf: out_low = 9'h069;
              default: out_low = 9'h000;
            endcase
          end
          6'h12: begin
            case (mant[3:0])
              4'h0: out_low = 9'h068;
              4'h1: out_low = 9'h068;
              4'h2: out_low = 9'h068;
              4'h3: out_low = 9'h067;
              4'h4: out_low = 9'h067;
              4'h5: out_low = 9'h067;
              4'h6: out_low = 9'h067;
              4'h7: out_low = 9'h066;
              4'h8: out_low = 9'h066;
              4'h9: out_low = 9'h066;
              4'ha: out_low = 9'h065;
              4'hb: out_low = 9'h065;
              4'hc: out_low = 9'h065;
              4'hd: out_low = 9'h065;
              4'he: out_low = 9'h064;
              4'hf: out_low = 9'h064;
              default: out_low = 9'h000;
            endcase
          end
          6'h13: begin
            case (mant[3:0])
              4'h0: out_low = 9'h064;
              4'h1: out_low = 9'h064;
              4'h2: out_low = 9'h063;
              4'h3: out_low = 9'h063;
              4'h4: out_low = 9'h063;
              4'h5: out_low = 9'h062;
              4'h6: out_low = 9'h062;
              4'h7: out_low = 9'h062;
              4'h8: out_low = 9'h062;
              4'h9: out_low = 9'h061;
              4'ha: out_low = 9'h061;
              4'hb: out_low = 9'h061;
              4'hc: out_low = 9'h060;
              4'hd: out_low = 9'h060;
              4'he: out_low = 9'h060;
              4'hf: out_low = 9'h060;
              default: out_low = 9'h000;
            endcase
          end
          6'h14: begin
            case (mant[3:0])
              4'h0: out_low = 9'h05f;
              4'h1: out_low = 9'h05f;
              4'h2: out_low = 9'h05f;
              4'h3: out_low = 9'h05f;
              4'h4: out_low = 9'h05e;
              4'h5: out_low = 9'h05e;
              4'h6: out_low = 9'h05e;
              4'h7: out_low = 9'h05d;
              4'h8: out_low = 9'h05d;
              4'h9: out_low = 9'h05d;
              4'ha: out_low = 9'h05d;
              4'hb: out_low = 9'h05c;
              4'hc: out_low = 9'h05c;
              4'hd: out_low = 9'h05c;
              4'he: out_low = 9'h05c;
              4'hf: out_low = 9'h05b;
              default: out_low = 9'h000;
            endcase
          end
          6'h15: begin
            case (mant[3:0])
              4'h0: out_low = 9'h05b;
              4'h1: out_low = 9'h05b;
              4'h2: out_low = 9'h05a;
              4'h3: out_low = 9'h05a;
              4'h4: out_low = 9'h05a;
              4'h5: out_low = 9'h05a;
              4'h6: out_low = 9'h059;
              4'h7: out_low = 9'h059;
              4'h8: out_low = 9'h059;
              4'h9: out_low = 9'h058;
              4'ha: out_low = 9'h058;
              4'hb: out_low = 9'h058;
              4'hc: out_low = 9'h058;
              4'hd: out_low = 9'h057;
              4'he: out_low = 9'h057;
              4'hf: out_low = 9'h057;
              default: out_low = 9'h000;
            endcase
          end
          6'h16: begin
            case (mant[3:0])
              4'h0: out_low = 9'h057;
              4'h1: out_low = 9'h056;
              4'h2: out_low = 9'h056;
              4'h3: out_low = 9'h056;
              4'h4: out_low = 9'h055;
              4'h5: out_low = 9'h055;
              4'h6: out_low = 9'h055;
              4'h7: out_low = 9'h055;
              4'h8: out_low = 9'h054;
              4'h9: out_low = 9'h054;
              4'ha: out_low = 9'h054;
              4'hb: out_low = 9'h054;
              4'hc: out_low = 9'h053;
              4'hd: out_low = 9'h053;
              4'he: out_low = 9'h053;
              4'hf: out_low = 9'h052;
              default: out_low = 9'h000;
            endcase
          end
          6'h17: begin
            case (mant[3:0])
              4'h0: out_low = 9'h052;
              4'h1: out_low = 9'h052;
              4'h2: out_low = 9'h052;
              4'h3: out_low = 9'h051;
              4'h4: out_low = 9'h051;
              4'h5: out_low = 9'h051;
              4'h6: out_low = 9'h051;
              4'h7: out_low = 9'h050;
              4'h8: out_low = 9'h050;
              4'h9: out_low = 9'h050;
              4'ha: out_low = 9'h04f;
              4'hb: out_low = 9'h04f;
              4'hc: out_low = 9'h04f;
              4'hd: out_low = 9'h04f;
              4'he: out_low = 9'h04e;
              4'hf: out_low = 9'h04e;
              default: out_low = 9'h000;
            endcase
          end
          6'h18: begin
            case (mant[3:0])
              4'h0: out_low = 9'h04e;
              4'h1: out_low = 9'h04e;
              4'h2: out_low = 9'h04d;
              4'h3: out_low = 9'h04d;
              4'h4: out_low = 9'h04d;
              4'h5: out_low = 9'h04c;
              4'h6: out_low = 9'h04c;
              4'h7: out_low = 9'h04c;
              4'h8: out_low = 9'h04c;
              4'h9: out_low = 9'h04b;
              4'ha: out_low = 9'h04b;
              4'hb: out_low = 9'h04b;
              4'hc: out_low = 9'h04b;
              4'hd: out_low = 9'h04a;
              4'he: out_low = 9'h04a;
              4'hf: out_low = 9'h04a;
              default: out_low = 9'h000;
            endcase
          end
          6'h19: begin
            case (mant[3:0])
              4'h0: out_low = 9'h049;
              4'h1: out_low = 9'h049;
              4'h2: out_low = 9'h049;
              4'h3: out_low = 9'h049;
              4'h4: out_low = 9'h048;
              4'h5: out_low = 9'h048;
              4'h6: out_low = 9'h048;
              4'h7: out_low = 9'h048;
              4'h8: out_low = 9'h047;
              4'h9: out_low = 9'h047;
              4'ha: out_low = 9'h047;
              4'hb: out_low = 9'h046;
              4'hc: out_low = 9'h046;
              4'hd: out_low = 9'h046;
              4'he: out_low = 9'h046;
              4'hf: out_low = 9'h045;
              default: out_low = 9'h000;
            endcase
          end
          6'h1a: begin
            case (mant[3:0])
              4'h0: out_low = 9'h045;
              4'h1: out_low = 9'h045;
              4'h2: out_low = 9'h045;
              4'h3: out_low = 9'h044;
              4'h4: out_low = 9'h044;
              4'h5: out_low = 9'h044;
              4'h6: out_low = 9'h043;
              4'h7: out_low = 9'h043;
              4'h8: out_low = 9'h043;
              4'h9: out_low = 9'h043;
              4'ha: out_low = 9'h042;
              4'hb: out_low = 9'h042;
              4'hc: out_low = 9'h042;
              4'hd: out_low = 9'h042;
              4'he: out_low = 9'h041;
              4'hf: out_low = 9'h041;
              default: out_low = 9'h000;
            endcase
          end
          6'h1b: begin
            case (mant[3:0])
              4'h0: out_low = 9'h041;
              4'h1: out_low = 9'h040;
              4'h2: out_low = 9'h040;
              4'h3: out_low = 9'h040;
              4'h4: out_low = 9'h040;
              4'h5: out_low = 9'h03f;
              4'h6: out_low = 9'h03f;
              4'h7: out_low = 9'h03f;
              4'h8: out_low = 9'h03f;
              4'h9: out_low = 9'h03e;
              4'ha: out_low = 9'h03e;
              4'hb: out_low = 9'h03e;
              4'hc: out_low = 9'h03e;
              4'hd: out_low = 9'h03d;
              4'he: out_low = 9'h03d;
              4'hf: out_low = 9'h03d;
              default: out_low = 9'h000;
            endcase
          end
          6'h1c: begin
            case (mant[3:0])
              4'h0: out_low = 9'h03c;
              4'h1: out_low = 9'h03c;
              4'h2: out_low = 9'h03c;
              4'h3: out_low = 9'h03c;
              4'h4: out_low = 9'h03b;
              4'h5: out_low = 9'h03b;
              4'h6: out_low = 9'h03b;
              4'h7: out_low = 9'h03b;
              4'h8: out_low = 9'h03a;
              4'h9: out_low = 9'h03a;
              4'ha: out_low = 9'h03a;
              4'hb: out_low = 9'h039;
              4'hc: out_low = 9'h039;
              4'hd: out_low = 9'h039;
              4'he: out_low = 9'h039;
              4'hf: out_low = 9'h038;
              default: out_low = 9'h000;
            endcase
          end
          6'h1d: begin
            case (mant[3:0])
              4'h0: out_low = 9'h038;
              4'h1: out_low = 9'h038;
              4'h2: out_low = 9'h038;
              4'h3: out_low = 9'h037;
              4'h4: out_low = 9'h037;
              4'h5: out_low = 9'h037;
              4'h6: out_low = 9'h036;
              4'h7: out_low = 9'h036;
              4'h8: out_low = 9'h036;
              4'h9: out_low = 9'h036;
              4'ha: out_low = 9'h035;
              4'hb: out_low = 9'h035;
              4'hc: out_low = 9'h035;
              4'hd: out_low = 9'h035;
              4'he: out_low = 9'h034;
              4'hf: out_low = 9'h034;
              default: out_low = 9'h000;
            endcase
          end
          6'h1e: begin
            case (mant[3:0])
              4'h0: out_low = 9'h034;
              4'h1: out_low = 9'h034;
              4'h2: out_low = 9'h033;
              4'h3: out_low = 9'h033;
              4'h4: out_low = 9'h033;
              4'h5: out_low = 9'h032;
              4'h6: out_low = 9'h032;
              4'h7: out_low = 9'h032;
              4'h8: out_low = 9'h032;
              4'h9: out_low = 9'h031;
              4'ha: out_low = 9'h031;
              4'hb: out_low = 9'h031;
              4'hc: out_low = 9'h031;
              4'hd: out_low = 9'h030;
              4'he: out_low = 9'h030;
              4'hf: out_low = 9'h030;
              default: out_low = 9'h000;
            endcase
          end
          6'h1f: begin
            case (mant[3:0])
              4'h0: out_low = 9'h030;
              4'h1: out_low = 9'h02f;
              4'h2: out_low = 9'h02f;
              4'h3: out_low = 9'h02f;
              4'h4: out_low = 9'h02e;
              4'h5: out_low = 9'h02e;
              4'h6: out_low = 9'h02e;
              4'h7: out_low = 9'h02e;
              4'h8: out_low = 9'h02d;
              4'h9: out_low = 9'h02d;
              4'ha: out_low = 9'h02d;
              4'hb: out_low = 9'h02d;
              4'hc: out_low = 9'h02c;
              4'hd: out_low = 9'h02c;
              4'he: out_low = 9'h02c;
              4'hf: out_low = 9'h02b;
              default: out_low = 9'h000;
            endcase
          end
          6'h20: begin
            case (mant[3:0])
              4'h0: out_low = 9'h02b;
              4'h1: out_low = 9'h02b;
              4'h2: out_low = 9'h02b;
              4'h3: out_low = 9'h02a;
              4'h4: out_low = 9'h02a;
              4'h5: out_low = 9'h02a;
              4'h6: out_low = 9'h02a;
              4'h7: out_low = 9'h029;
              4'h8: out_low = 9'h029;
              4'h9: out_low = 9'h029;
              4'ha: out_low = 9'h029;
              4'hb: out_low = 9'h028;
              4'hc: out_low = 9'h028;
              4'hd: out_low = 9'h028;
              4'he: out_low = 9'h027;
              4'hf: out_low = 9'h027;
              default: out_low = 9'h000;
            endcase
          end
          6'h21: begin
            case (mant[3:0])
              4'h0: out_low = 9'h027;
              4'h1: out_low = 9'h027;
              4'h2: out_low = 9'h026;
              4'h3: out_low = 9'h026;
              4'h4: out_low = 9'h026;
              4'h5: out_low = 9'h026;
              4'h6: out_low = 9'h025;
              4'h7: out_low = 9'h025;
              4'h8: out_low = 9'h025;
              4'h9: out_low = 9'h025;
              4'ha: out_low = 9'h024;
              4'hb: out_low = 9'h024;
              4'hc: out_low = 9'h024;
              4'hd: out_low = 9'h023;
              4'he: out_low = 9'h023;
              4'hf: out_low = 9'h023;
              default: out_low = 9'h000;
            endcase
          end
          6'h22: begin
            case (mant[3:0])
              4'h0: out_low = 9'h023;
              4'h1: out_low = 9'h022;
              4'h2: out_low = 9'h022;
              4'h3: out_low = 9'h022;
              4'h4: out_low = 9'h022;
              4'h5: out_low = 9'h021;
              4'h6: out_low = 9'h021;
              4'h7: out_low = 9'h021;
              4'h8: out_low = 9'h021;
              4'h9: out_low = 9'h020;
              4'ha: out_low = 9'h020;
              4'hb: out_low = 9'h020;
              4'hc: out_low = 9'h020;
              4'hd: out_low = 9'h01f;
              4'he: out_low = 9'h01f;
              4'hf: out_low = 9'h01f;
              default: out_low = 9'h000;
            endcase
          end
          6'h23: begin
            case (mant[3:0])
              4'h0: out_low = 9'h01e;
              4'h1: out_low = 9'h01e;
              4'h2: out_low = 9'h01e;
              4'h3: out_low = 9'h01e;
              4'h4: out_low = 9'h01d;
              4'h5: out_low = 9'h01d;
              4'h6: out_low = 9'h01d;
              4'h7: out_low = 9'h01d;
              4'h8: out_low = 9'h01c;
              4'h9: out_low = 9'h01c;
              4'ha: out_low = 9'h01c;
              4'hb: out_low = 9'h01c;
              4'hc: out_low = 9'h01b;
              4'hd: out_low = 9'h01b;
              4'he: out_low = 9'h01b;
              4'hf: out_low = 9'h01a;
              default: out_low = 9'h000;
            endcase
          end
          6'h24: begin
            case (mant[3:0])
              4'h0: out_low = 9'h01a;
              4'h1: out_low = 9'h01a;
              4'h2: out_low = 9'h01a;
              4'h3: out_low = 9'h019;
              4'h4: out_low = 9'h019;
              4'h5: out_low = 9'h019;
              4'h6: out_low = 9'h019;
              4'h7: out_low = 9'h018;
              4'h8: out_low = 9'h018;
              4'h9: out_low = 9'h018;
              4'ha: out_low = 9'h018;
              4'hb: out_low = 9'h017;
              4'hc: out_low = 9'h017;
              4'hd: out_low = 9'h017;
              4'he: out_low = 9'h017;
              4'hf: out_low = 9'h016;
              default: out_low = 9'h000;
            endcase
          end
          6'h25: begin
            case (mant[3:0])
              4'h0: out_low = 9'h016;
              4'h1: out_low = 9'h016;
              4'h2: out_low = 9'h015;
              4'h3: out_low = 9'h015;
              4'h4: out_low = 9'h015;
              4'h5: out_low = 9'h015;
              4'h6: out_low = 9'h014;
              4'h7: out_low = 9'h014;
              4'h8: out_low = 9'h014;
              4'h9: out_low = 9'h014;
              4'ha: out_low = 9'h013;
              4'hb: out_low = 9'h013;
              4'hc: out_low = 9'h013;
              4'hd: out_low = 9'h013;
              4'he: out_low = 9'h012;
              4'hf: out_low = 9'h012;
              default: out_low = 9'h000;
            endcase
          end
          6'h26: begin
            case (mant[3:0])
              4'h0: out_low = 9'h012;
              4'h1: out_low = 9'h012;
              4'h2: out_low = 9'h011;
              4'h3: out_low = 9'h011;
              4'h4: out_low = 9'h011;
              4'h5: out_low = 9'h010;
              4'h6: out_low = 9'h010;
              4'h7: out_low = 9'h010;
              4'h8: out_low = 9'h010;
              4'h9: out_low = 9'h00f;
              4'ha: out_low = 9'h00f;
              4'hb: out_low = 9'h00f;
              4'hc: out_low = 9'h00f;
              4'hd: out_low = 9'h00e;
              4'he: out_low = 9'h00e;
              4'hf: out_low = 9'h00e;
              default: out_low = 9'h000;
            endcase
          end
          6'h27: begin
            case (mant[3:0])
              4'h0: out_low = 9'h00e;
              4'h1: out_low = 9'h00d;
              4'h2: out_low = 9'h00d;
              4'h3: out_low = 9'h00d;
              4'h4: out_low = 9'h00d;
              4'h5: out_low = 9'h00c;
              4'h6: out_low = 9'h00c;
              4'h7: out_low = 9'h00c;
              4'h8: out_low = 9'h00b;
              4'h9: out_low = 9'h00b;
              4'ha: out_low = 9'h00b;
              4'hb: out_low = 9'h00b;
              4'hc: out_low = 9'h00a;
              4'hd: out_low = 9'h00a;
              4'he: out_low = 9'h00a;
              4'hf: out_low = 9'h00a;
              default: out_low = 9'h000;
            endcase
          end
          6'h28: begin
            case (mant[3:0])
              4'h0: out_low = 9'h009;
              4'h1: out_low = 9'h009;
              4'h2: out_low = 9'h009;
              4'h3: out_low = 9'h009;
              4'h4: out_low = 9'h008;
              4'h5: out_low = 9'h008;
              4'h6: out_low = 9'h008;
              4'h7: out_low = 9'h008;
              4'h8: out_low = 9'h007;
              4'h9: out_low = 9'h007;
              4'ha: out_low = 9'h007;
              4'hb: out_low = 9'h007;
              4'hc: out_low = 9'h006;
              4'hd: out_low = 9'h006;
              4'he: out_low = 9'h006;
              4'hf: out_low = 9'h005;
              default: out_low = 9'h000;
            endcase
          end
          6'h29: begin
            case (mant[3:0])
              4'h0: out_low = 9'h005;
              4'h1: out_low = 9'h005;
              4'h2: out_low = 9'h005;
              4'h3: out_low = 9'h004;
              4'h4: out_low = 9'h004;
              4'h5: out_low = 9'h004;
              4'h6: out_low = 9'h004;
              4'h7: out_low = 9'h003;
              4'h8: out_low = 9'h003;
              4'h9: out_low = 9'h003;
              4'ha: out_low = 9'h003;
              4'hb: out_low = 9'h002;
              4'hc: out_low = 9'h002;
              4'hd: out_low = 9'h002;
              4'he: out_low = 9'h002;
              4'hf: out_low = 9'h001;
              default: out_low = 9'h000;
            endcase
          end
          6'h2a: begin
            case (mant[3:0])
              4'h0: out_low = 9'h001;
              4'h1: out_low = 9'h001;
              4'h2: out_low = 9'h001;
              4'h3: out_low = 9'h000;
              4'h4: out_low = 9'h000;
              4'h5: out_low = 9'h000;
              4'h6: out_low = 9'h1ff;
              4'h7: out_low = 9'h1ff;
              4'h8: out_low = 9'h1ff;
              4'h9: out_low = 9'h1ff;
              4'ha: out_low = 9'h1fe;
              4'hb: out_low = 9'h1fe;
              4'hc: out_low = 9'h1fe;
              4'hd: out_low = 9'h1fe;
              4'he: out_low = 9'h1fd;
              4'hf: out_low = 9'h1fd;
              default: out_low = 9'h000;
            endcase
          end
          6'h2b: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1fd;
              4'h1: out_low = 9'h1fd;
              4'h2: out_low = 9'h1fc;
              4'h3: out_low = 9'h1fc;
              4'h4: out_low = 9'h1fc;
              4'h5: out_low = 9'h1fc;
              4'h6: out_low = 9'h1fb;
              4'h7: out_low = 9'h1fb;
              4'h8: out_low = 9'h1fb;
              4'h9: out_low = 9'h1fb;
              4'ha: out_low = 9'h1fa;
              4'hb: out_low = 9'h1fa;
              4'hc: out_low = 9'h1fa;
              4'hd: out_low = 9'h1fa;
              4'he: out_low = 9'h1f9;
              4'hf: out_low = 9'h1f9;
              default: out_low = 9'h000;
            endcase
          end
          6'h2c: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1f9;
              4'h1: out_low = 9'h1f8;
              4'h2: out_low = 9'h1f8;
              4'h3: out_low = 9'h1f8;
              4'h4: out_low = 9'h1f8;
              4'h5: out_low = 9'h1f7;
              4'h6: out_low = 9'h1f7;
              4'h7: out_low = 9'h1f7;
              4'h8: out_low = 9'h1f7;
              4'h9: out_low = 9'h1f6;
              4'ha: out_low = 9'h1f6;
              4'hb: out_low = 9'h1f6;
              4'hc: out_low = 9'h1f6;
              4'hd: out_low = 9'h1f5;
              4'he: out_low = 9'h1f5;
              4'hf: out_low = 9'h1f5;
              default: out_low = 9'h000;
            endcase
          end
          6'h2d: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1f5;
              4'h1: out_low = 9'h1f4;
              4'h2: out_low = 9'h1f4;
              4'h3: out_low = 9'h1f4;
              4'h4: out_low = 9'h1f4;
              4'h5: out_low = 9'h1f3;
              4'h6: out_low = 9'h1f3;
              4'h7: out_low = 9'h1f3;
              4'h8: out_low = 9'h1f3;
              4'h9: out_low = 9'h1f2;
              4'ha: out_low = 9'h1f2;
              4'hb: out_low = 9'h1f2;
              4'hc: out_low = 9'h1f2;
              4'hd: out_low = 9'h1f1;
              4'he: out_low = 9'h1f1;
              4'hf: out_low = 9'h1f1;
              default: out_low = 9'h000;
            endcase
          end
          6'h2e: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1f0;
              4'h1: out_low = 9'h1f0;
              4'h2: out_low = 9'h1f0;
              4'h3: out_low = 9'h1f0;
              4'h4: out_low = 9'h1ef;
              4'h5: out_low = 9'h1ef;
              4'h6: out_low = 9'h1ef;
              4'h7: out_low = 9'h1ef;
              4'h8: out_low = 9'h1ee;
              4'h9: out_low = 9'h1ee;
              4'ha: out_low = 9'h1ee;
              4'hb: out_low = 9'h1ee;
              4'hc: out_low = 9'h1ed;
              4'hd: out_low = 9'h1ed;
              4'he: out_low = 9'h1ed;
              4'hf: out_low = 9'h1ed;
              default: out_low = 9'h000;
            endcase
          end
          6'h2f: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1ec;
              4'h1: out_low = 9'h1ec;
              4'h2: out_low = 9'h1ec;
              4'h3: out_low = 9'h1ec;
              4'h4: out_low = 9'h1eb;
              4'h5: out_low = 9'h1eb;
              4'h6: out_low = 9'h1eb;
              4'h7: out_low = 9'h1eb;
              4'h8: out_low = 9'h1ea;
              4'h9: out_low = 9'h1ea;
              4'ha: out_low = 9'h1ea;
              4'hb: out_low = 9'h1ea;
              4'hc: out_low = 9'h1e9;
              4'hd: out_low = 9'h1e9;
              4'he: out_low = 9'h1e9;
              4'hf: out_low = 9'h1e9;
              default: out_low = 9'h000;
            endcase
          end
          6'h30: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1e8;
              4'h1: out_low = 9'h1e8;
              4'h2: out_low = 9'h1e8;
              4'h3: out_low = 9'h1e8;
              4'h4: out_low = 9'h1e7;
              4'h5: out_low = 9'h1e7;
              4'h6: out_low = 9'h1e7;
              4'h7: out_low = 9'h1e6;
              4'h8: out_low = 9'h1e6;
              4'h9: out_low = 9'h1e6;
              4'ha: out_low = 9'h1e6;
              4'hb: out_low = 9'h1e5;
              4'hc: out_low = 9'h1e5;
              4'hd: out_low = 9'h1e5;
              4'he: out_low = 9'h1e5;
              4'hf: out_low = 9'h1e4;
              default: out_low = 9'h000;
            endcase
          end
          6'h31: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1e4;
              4'h1: out_low = 9'h1e4;
              4'h2: out_low = 9'h1e4;
              4'h3: out_low = 9'h1e3;
              4'h4: out_low = 9'h1e3;
              4'h5: out_low = 9'h1e3;
              4'h6: out_low = 9'h1e3;
              4'h7: out_low = 9'h1e2;
              4'h8: out_low = 9'h1e2;
              4'h9: out_low = 9'h1e2;
              4'ha: out_low = 9'h1e2;
              4'hb: out_low = 9'h1e1;
              4'hc: out_low = 9'h1e1;
              4'hd: out_low = 9'h1e1;
              4'he: out_low = 9'h1e1;
              4'hf: out_low = 9'h1e0;
              default: out_low = 9'h000;
            endcase
          end
          6'h32: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1e0;
              4'h1: out_low = 9'h1e0;
              4'h2: out_low = 9'h1e0;
              4'h3: out_low = 9'h1df;
              4'h4: out_low = 9'h1df;
              4'h5: out_low = 9'h1df;
              4'h6: out_low = 9'h1df;
              4'h7: out_low = 9'h1de;
              4'h8: out_low = 9'h1de;
              4'h9: out_low = 9'h1de;
              4'ha: out_low = 9'h1de;
              4'hb: out_low = 9'h1dd;
              4'hc: out_low = 9'h1dd;
              4'hd: out_low = 9'h1dd;
              4'he: out_low = 9'h1dd;
              4'hf: out_low = 9'h1dc;
              default: out_low = 9'h000;
            endcase
          end
          6'h33: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1dc;
              4'h1: out_low = 9'h1dc;
              4'h2: out_low = 9'h1dc;
              4'h3: out_low = 9'h1db;
              4'h4: out_low = 9'h1db;
              4'h5: out_low = 9'h1db;
              4'h6: out_low = 9'h1db;
              4'h7: out_low = 9'h1da;
              4'h8: out_low = 9'h1da;
              4'h9: out_low = 9'h1da;
              4'ha: out_low = 9'h1d9;
              4'hb: out_low = 9'h1d9;
              4'hc: out_low = 9'h1d9;
              4'hd: out_low = 9'h1d9;
              4'he: out_low = 9'h1d8;
              4'hf: out_low = 9'h1d8;
              default: out_low = 9'h000;
            endcase
          end
          6'h34: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1d8;
              4'h1: out_low = 9'h1d8;
              4'h2: out_low = 9'h1d7;
              4'h3: out_low = 9'h1d7;
              4'h4: out_low = 9'h1d7;
              4'h5: out_low = 9'h1d7;
              4'h6: out_low = 9'h1d6;
              4'h7: out_low = 9'h1d6;
              4'h8: out_low = 9'h1d6;
              4'h9: out_low = 9'h1d6;
              4'ha: out_low = 9'h1d5;
              4'hb: out_low = 9'h1d5;
              4'hc: out_low = 9'h1d5;
              4'hd: out_low = 9'h1d5;
              4'he: out_low = 9'h1d4;
              4'hf: out_low = 9'h1d4;
              default: out_low = 9'h000;
            endcase
          end
          6'h35: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1d4;
              4'h1: out_low = 9'h1d4;
              4'h2: out_low = 9'h1d3;
              4'h3: out_low = 9'h1d3;
              4'h4: out_low = 9'h1d3;
              4'h5: out_low = 9'h1d3;
              4'h6: out_low = 9'h1d2;
              4'h7: out_low = 9'h1d2;
              4'h8: out_low = 9'h1d2;
              4'h9: out_low = 9'h1d2;
              4'ha: out_low = 9'h1d1;
              4'hb: out_low = 9'h1d1;
              4'hc: out_low = 9'h1d1;
              4'hd: out_low = 9'h1d1;
              4'he: out_low = 9'h1d0;
              4'hf: out_low = 9'h1d0;
              default: out_low = 9'h000;
            endcase
          end
          6'h36: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1d0;
              4'h1: out_low = 9'h1d0;
              4'h2: out_low = 9'h1cf;
              4'h3: out_low = 9'h1cf;
              4'h4: out_low = 9'h1cf;
              4'h5: out_low = 9'h1cf;
              4'h6: out_low = 9'h1ce;
              4'h7: out_low = 9'h1ce;
              4'h8: out_low = 9'h1ce;
              4'h9: out_low = 9'h1ce;
              4'ha: out_low = 9'h1cd;
              4'hb: out_low = 9'h1cd;
              4'hc: out_low = 9'h1cd;
              4'hd: out_low = 9'h1cd;
              4'he: out_low = 9'h1cc;
              4'hf: out_low = 9'h1cc;
              default: out_low = 9'h000;
            endcase
          end
          6'h37: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1cc;
              4'h1: out_low = 9'h1cc;
              4'h2: out_low = 9'h1cb;
              4'h3: out_low = 9'h1cb;
              4'h4: out_low = 9'h1cb;
              4'h5: out_low = 9'h1cb;
              4'h6: out_low = 9'h1ca;
              4'h7: out_low = 9'h1ca;
              4'h8: out_low = 9'h1ca;
              4'h9: out_low = 9'h1ca;
              4'ha: out_low = 9'h1c9;
              4'hb: out_low = 9'h1c9;
              4'hc: out_low = 9'h1c9;
              4'hd: out_low = 9'h1c9;
              4'he: out_low = 9'h1c8;
              4'hf: out_low = 9'h1c8;
              default: out_low = 9'h000;
            endcase
          end
          6'h38: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1c8;
              4'h1: out_low = 9'h1c8;
              4'h2: out_low = 9'h1c7;
              4'h3: out_low = 9'h1c7;
              4'h4: out_low = 9'h1c7;
              4'h5: out_low = 9'h1c7;
              4'h6: out_low = 9'h1c6;
              4'h7: out_low = 9'h1c6;
              4'h8: out_low = 9'h1c6;
              4'h9: out_low = 9'h1c6;
              4'ha: out_low = 9'h1c5;
              4'hb: out_low = 9'h1c5;
              4'hc: out_low = 9'h1c5;
              4'hd: out_low = 9'h1c5;
              4'he: out_low = 9'h1c4;
              4'hf: out_low = 9'h1c4;
              default: out_low = 9'h000;
            endcase
          end
          6'h39: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1c4;
              4'h1: out_low = 9'h1c4;
              4'h2: out_low = 9'h1c3;
              4'h3: out_low = 9'h1c3;
              4'h4: out_low = 9'h1c3;
              4'h5: out_low = 9'h1c3;
              4'h6: out_low = 9'h1c2;
              4'h7: out_low = 9'h1c2;
              4'h8: out_low = 9'h1c2;
              4'h9: out_low = 9'h1c2;
              4'ha: out_low = 9'h1c1;
              4'hb: out_low = 9'h1c1;
              4'hc: out_low = 9'h1c1;
              4'hd: out_low = 9'h1c1;
              4'he: out_low = 9'h1c0;
              4'hf: out_low = 9'h1c0;
              default: out_low = 9'h000;
            endcase
          end
          6'h3a: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1c0;
              4'h1: out_low = 9'h1c0;
              4'h2: out_low = 9'h1bf;
              4'h3: out_low = 9'h1bf;
              4'h4: out_low = 9'h1bf;
              4'h5: out_low = 9'h1bf;
              4'h6: out_low = 9'h1be;
              4'h7: out_low = 9'h1be;
              4'h8: out_low = 9'h1be;
              4'h9: out_low = 9'h1be;
              4'ha: out_low = 9'h1bd;
              4'hb: out_low = 9'h1bd;
              4'hc: out_low = 9'h1bd;
              4'hd: out_low = 9'h1bd;
              4'he: out_low = 9'h1bc;
              4'hf: out_low = 9'h1bc;
              default: out_low = 9'h000;
            endcase
          end
          6'h3b: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1bc;
              4'h1: out_low = 9'h1bc;
              4'h2: out_low = 9'h1bb;
              4'h3: out_low = 9'h1bb;
              4'h4: out_low = 9'h1bb;
              4'h5: out_low = 9'h1bb;
              4'h6: out_low = 9'h1ba;
              4'h7: out_low = 9'h1ba;
              4'h8: out_low = 9'h1ba;
              4'h9: out_low = 9'h1ba;
              4'ha: out_low = 9'h1b9;
              4'hb: out_low = 9'h1b9;
              4'hc: out_low = 9'h1b9;
              4'hd: out_low = 9'h1b9;
              4'he: out_low = 9'h1b8;
              4'hf: out_low = 9'h1b8;
              default: out_low = 9'h000;
            endcase
          end
          6'h3c: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1b8;
              4'h1: out_low = 9'h1b8;
              4'h2: out_low = 9'h1b7;
              4'h3: out_low = 9'h1b7;
              4'h4: out_low = 9'h1b7;
              4'h5: out_low = 9'h1b7;
              4'h6: out_low = 9'h1b6;
              4'h7: out_low = 9'h1b6;
              4'h8: out_low = 9'h1b6;
              4'h9: out_low = 9'h1b6;
              4'ha: out_low = 9'h1b5;
              4'hb: out_low = 9'h1b5;
              4'hc: out_low = 9'h1b5;
              4'hd: out_low = 9'h1b5;
              4'he: out_low = 9'h1b4;
              4'hf: out_low = 9'h1b4;
              default: out_low = 9'h000;
            endcase
          end
          6'h3d: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1b4;
              4'h1: out_low = 9'h1b4;
              4'h2: out_low = 9'h1b3;
              4'h3: out_low = 9'h1b3;
              4'h4: out_low = 9'h1b3;
              4'h5: out_low = 9'h1b3;
              4'h6: out_low = 9'h1b2;
              4'h7: out_low = 9'h1b2;
              4'h8: out_low = 9'h1b2;
              4'h9: out_low = 9'h1b2;
              4'ha: out_low = 9'h1b1;
              4'hb: out_low = 9'h1b1;
              4'hc: out_low = 9'h1b1;
              4'hd: out_low = 9'h1b1;
              4'he: out_low = 9'h1b1;
              4'hf: out_low = 9'h1b0;
              default: out_low = 9'h000;
            endcase
          end
          6'h3e: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1b0;
              4'h1: out_low = 9'h1b0;
              4'h2: out_low = 9'h1b0;
              4'h3: out_low = 9'h1af;
              4'h4: out_low = 9'h1af;
              4'h5: out_low = 9'h1af;
              4'h6: out_low = 9'h1af;
              4'h7: out_low = 9'h1ae;
              4'h8: out_low = 9'h1ae;
              4'h9: out_low = 9'h1ae;
              4'ha: out_low = 9'h1ae;
              4'hb: out_low = 9'h1ad;
              4'hc: out_low = 9'h1ad;
              4'hd: out_low = 9'h1ad;
              4'he: out_low = 9'h1ad;
              4'hf: out_low = 9'h1ac;
              default: out_low = 9'h000;
            endcase
          end
          6'h3f: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1ac;
              4'h1: out_low = 9'h1ac;
              4'h2: out_low = 9'h1ac;
              4'h3: out_low = 9'h1ab;
              4'h4: out_low = 9'h1ab;
              4'h5: out_low = 9'h1ab;
              4'h6: out_low = 9'h1ab;
              4'h7: out_low = 9'h1aa;
              4'h8: out_low = 9'h1aa;
              4'h9: out_low = 9'h1aa;
              4'ha: out_low = 9'h1aa;
              4'hb: out_low = 9'h1a9;
              4'hc: out_low = 9'h1a9;
              4'hd: out_low = 9'h1a9;
              4'he: out_low = 9'h1a9;
              4'hf: out_low = 9'h1a8;
              default: out_low = 9'h000;
            endcase
          end
          default: out_low = 9'h000;
        endcase
      end
      6'h2e: begin
        case (mant[9:4])
          6'h00: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1a8;
              4'h1: out_low = 9'h1a8;
              4'h2: out_low = 9'h1a7;
              4'h3: out_low = 9'h1a7;
              4'h4: out_low = 9'h1a6;
              4'h5: out_low = 9'h1a6;
              4'h6: out_low = 9'h1a5;
              4'h7: out_low = 9'h1a5;
              4'h8: out_low = 9'h1a4;
              4'h9: out_low = 9'h1a4;
              4'ha: out_low = 9'h1a3;
              4'hb: out_low = 9'h1a3;
              4'hc: out_low = 9'h1a2;
              4'hd: out_low = 9'h1a2;
              4'he: out_low = 9'h1a1;
              4'hf: out_low = 9'h1a1;
              default: out_low = 9'h000;
            endcase
          end
          6'h01: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1a0;
              4'h1: out_low = 9'h1a0;
              4'h2: out_low = 9'h19f;
              4'h3: out_low = 9'h19f;
              4'h4: out_low = 9'h19e;
              4'h5: out_low = 9'h19e;
              4'h6: out_low = 9'h19d;
              4'h7: out_low = 9'h19d;
              4'h8: out_low = 9'h19c;
              4'h9: out_low = 9'h19c;
              4'ha: out_low = 9'h19b;
              4'hb: out_low = 9'h19b;
              4'hc: out_low = 9'h19a;
              4'hd: out_low = 9'h19a;
              4'he: out_low = 9'h19a;
              4'hf: out_low = 9'h199;
              default: out_low = 9'h000;
            endcase
          end
          6'h02: begin
            case (mant[3:0])
              4'h0: out_low = 9'h199;
              4'h1: out_low = 9'h198;
              4'h2: out_low = 9'h198;
              4'h3: out_low = 9'h197;
              4'h4: out_low = 9'h197;
              4'h5: out_low = 9'h196;
              4'h6: out_low = 9'h196;
              4'h7: out_low = 9'h195;
              4'h8: out_low = 9'h195;
              4'h9: out_low = 9'h194;
              4'ha: out_low = 9'h194;
              4'hb: out_low = 9'h193;
              4'hc: out_low = 9'h193;
              4'hd: out_low = 9'h192;
              4'he: out_low = 9'h192;
              4'hf: out_low = 9'h191;
              default: out_low = 9'h000;
            endcase
          end
          6'h03: begin
            case (mant[3:0])
              4'h0: out_low = 9'h191;
              4'h1: out_low = 9'h190;
              4'h2: out_low = 9'h190;
              4'h3: out_low = 9'h18f;
              4'h4: out_low = 9'h18f;
              4'h5: out_low = 9'h18e;
              4'h6: out_low = 9'h18e;
              4'h7: out_low = 9'h18d;
              4'h8: out_low = 9'h18d;
              4'h9: out_low = 9'h18c;
              4'ha: out_low = 9'h18c;
              4'hb: out_low = 9'h18c;
              4'hc: out_low = 9'h18b;
              4'hd: out_low = 9'h18b;
              4'he: out_low = 9'h18a;
              4'hf: out_low = 9'h18a;
              default: out_low = 9'h000;
            endcase
          end
          6'h04: begin
            case (mant[3:0])
              4'h0: out_low = 9'h189;
              4'h1: out_low = 9'h189;
              4'h2: out_low = 9'h188;
              4'h3: out_low = 9'h188;
              4'h4: out_low = 9'h187;
              4'h5: out_low = 9'h187;
              4'h6: out_low = 9'h186;
              4'h7: out_low = 9'h186;
              4'h8: out_low = 9'h185;
              4'h9: out_low = 9'h185;
              4'ha: out_low = 9'h184;
              4'hb: out_low = 9'h184;
              4'hc: out_low = 9'h183;
              4'hd: out_low = 9'h183;
              4'he: out_low = 9'h182;
              4'hf: out_low = 9'h182;
              default: out_low = 9'h000;
            endcase
          end
          6'h05: begin
            case (mant[3:0])
              4'h0: out_low = 9'h181;
              4'h1: out_low = 9'h181;
              4'h2: out_low = 9'h181;
              4'h3: out_low = 9'h180;
              4'h4: out_low = 9'h180;
              4'h5: out_low = 9'h17f;
              4'h6: out_low = 9'h17f;
              4'h7: out_low = 9'h17e;
              4'h8: out_low = 9'h17e;
              4'h9: out_low = 9'h17d;
              4'ha: out_low = 9'h17d;
              4'hb: out_low = 9'h17c;
              4'hc: out_low = 9'h17c;
              4'hd: out_low = 9'h17b;
              4'he: out_low = 9'h17b;
              4'hf: out_low = 9'h17a;
              default: out_low = 9'h000;
            endcase
          end
          6'h06: begin
            case (mant[3:0])
              4'h0: out_low = 9'h17a;
              4'h1: out_low = 9'h179;
              4'h2: out_low = 9'h179;
              4'h3: out_low = 9'h178;
              4'h4: out_low = 9'h178;
              4'h5: out_low = 9'h177;
              4'h6: out_low = 9'h177;
              4'h7: out_low = 9'h177;
              4'h8: out_low = 9'h176;
              4'h9: out_low = 9'h176;
              4'ha: out_low = 9'h175;
              4'hb: out_low = 9'h175;
              4'hc: out_low = 9'h174;
              4'hd: out_low = 9'h174;
              4'he: out_low = 9'h173;
              4'hf: out_low = 9'h173;
              default: out_low = 9'h000;
            endcase
          end
          6'h07: begin
            case (mant[3:0])
              4'h0: out_low = 9'h172;
              4'h1: out_low = 9'h172;
              4'h2: out_low = 9'h171;
              4'h3: out_low = 9'h171;
              4'h4: out_low = 9'h170;
              4'h5: out_low = 9'h170;
              4'h6: out_low = 9'h16f;
              4'h7: out_low = 9'h16f;
              4'h8: out_low = 9'h16f;
              4'h9: out_low = 9'h16e;
              4'ha: out_low = 9'h16e;
              4'hb: out_low = 9'h16d;
              4'hc: out_low = 9'h16d;
              4'hd: out_low = 9'h16c;
              4'he: out_low = 9'h16c;
              4'hf: out_low = 9'h16b;
              default: out_low = 9'h000;
            endcase
          end
          6'h08: begin
            case (mant[3:0])
              4'h0: out_low = 9'h16b;
              4'h1: out_low = 9'h16a;
              4'h2: out_low = 9'h16a;
              4'h3: out_low = 9'h169;
              4'h4: out_low = 9'h169;
              4'h5: out_low = 9'h168;
              4'h6: out_low = 9'h168;
              4'h7: out_low = 9'h167;
              4'h8: out_low = 9'h167;
              4'h9: out_low = 9'h167;
              4'ha: out_low = 9'h166;
              4'hb: out_low = 9'h166;
              4'hc: out_low = 9'h165;
              4'hd: out_low = 9'h165;
              4'he: out_low = 9'h164;
              4'hf: out_low = 9'h164;
              default: out_low = 9'h000;
            endcase
          end
          6'h09: begin
            case (mant[3:0])
              4'h0: out_low = 9'h163;
              4'h1: out_low = 9'h163;
              4'h2: out_low = 9'h162;
              4'h3: out_low = 9'h162;
              4'h4: out_low = 9'h161;
              4'h5: out_low = 9'h161;
              4'h6: out_low = 9'h160;
              4'h7: out_low = 9'h160;
              4'h8: out_low = 9'h160;
              4'h9: out_low = 9'h15f;
              4'ha: out_low = 9'h15f;
              4'hb: out_low = 9'h15e;
              4'hc: out_low = 9'h15e;
              4'hd: out_low = 9'h15d;
              4'he: out_low = 9'h15d;
              4'hf: out_low = 9'h15c;
              default: out_low = 9'h000;
            endcase
          end
          6'h0a: begin
            case (mant[3:0])
              4'h0: out_low = 9'h15c;
              4'h1: out_low = 9'h15b;
              4'h2: out_low = 9'h15b;
              4'h3: out_low = 9'h15a;
              4'h4: out_low = 9'h15a;
              4'h5: out_low = 9'h15a;
              4'h6: out_low = 9'h159;
              4'h7: out_low = 9'h159;
              4'h8: out_low = 9'h158;
              4'h9: out_low = 9'h158;
              4'ha: out_low = 9'h157;
              4'hb: out_low = 9'h157;
              4'hc: out_low = 9'h156;
              4'hd: out_low = 9'h156;
              4'he: out_low = 9'h155;
              4'hf: out_low = 9'h155;
              default: out_low = 9'h000;
            endcase
          end
          6'h0b: begin
            case (mant[3:0])
              4'h0: out_low = 9'h154;
              4'h1: out_low = 9'h154;
              4'h2: out_low = 9'h153;
              4'h3: out_low = 9'h153;
              4'h4: out_low = 9'h153;
              4'h5: out_low = 9'h152;
              4'h6: out_low = 9'h152;
              4'h7: out_low = 9'h151;
              4'h8: out_low = 9'h151;
              4'h9: out_low = 9'h150;
              4'ha: out_low = 9'h150;
              4'hb: out_low = 9'h14f;
              4'hc: out_low = 9'h14f;
              4'hd: out_low = 9'h14e;
              4'he: out_low = 9'h14e;
              4'hf: out_low = 9'h14e;
              default: out_low = 9'h000;
            endcase
          end
          6'h0c: begin
            case (mant[3:0])
              4'h0: out_low = 9'h14d;
              4'h1: out_low = 9'h14d;
              4'h2: out_low = 9'h14c;
              4'h3: out_low = 9'h14c;
              4'h4: out_low = 9'h14b;
              4'h5: out_low = 9'h14b;
              4'h6: out_low = 9'h14a;
              4'h7: out_low = 9'h14a;
              4'h8: out_low = 9'h149;
              4'h9: out_low = 9'h149;
              4'ha: out_low = 9'h148;
              4'hb: out_low = 9'h148;
              4'hc: out_low = 9'h148;
              4'hd: out_low = 9'h147;
              4'he: out_low = 9'h147;
              4'hf: out_low = 9'h146;
              default: out_low = 9'h000;
            endcase
          end
          6'h0d: begin
            case (mant[3:0])
              4'h0: out_low = 9'h146;
              4'h1: out_low = 9'h145;
              4'h2: out_low = 9'h145;
              4'h3: out_low = 9'h144;
              4'h4: out_low = 9'h144;
              4'h5: out_low = 9'h143;
              4'h6: out_low = 9'h143;
              4'h7: out_low = 9'h143;
              4'h8: out_low = 9'h142;
              4'h9: out_low = 9'h142;
              4'ha: out_low = 9'h141;
              4'hb: out_low = 9'h141;
              4'hc: out_low = 9'h140;
              4'hd: out_low = 9'h140;
              4'he: out_low = 9'h13f;
              4'hf: out_low = 9'h13f;
              default: out_low = 9'h000;
            endcase
          end
          6'h0e: begin
            case (mant[3:0])
              4'h0: out_low = 9'h13e;
              4'h1: out_low = 9'h13e;
              4'h2: out_low = 9'h13e;
              4'h3: out_low = 9'h13d;
              4'h4: out_low = 9'h13d;
              4'h5: out_low = 9'h13c;
              4'h6: out_low = 9'h13c;
              4'h7: out_low = 9'h13b;
              4'h8: out_low = 9'h13b;
              4'h9: out_low = 9'h13a;
              4'ha: out_low = 9'h13a;
              4'hb: out_low = 9'h139;
              4'hc: out_low = 9'h139;
              4'hd: out_low = 9'h139;
              4'he: out_low = 9'h138;
              4'hf: out_low = 9'h138;
              default: out_low = 9'h000;
            endcase
          end
          6'h0f: begin
            case (mant[3:0])
              4'h0: out_low = 9'h137;
              4'h1: out_low = 9'h137;
              4'h2: out_low = 9'h136;
              4'h3: out_low = 9'h136;
              4'h4: out_low = 9'h135;
              4'h5: out_low = 9'h135;
              4'h6: out_low = 9'h134;
              4'h7: out_low = 9'h134;
              4'h8: out_low = 9'h134;
              4'h9: out_low = 9'h133;
              4'ha: out_low = 9'h133;
              4'hb: out_low = 9'h132;
              4'hc: out_low = 9'h132;
              4'hd: out_low = 9'h131;
              4'he: out_low = 9'h131;
              4'hf: out_low = 9'h130;
              default: out_low = 9'h000;
            endcase
          end
          6'h10: begin
            case (mant[3:0])
              4'h0: out_low = 9'h130;
              4'h1: out_low = 9'h130;
              4'h2: out_low = 9'h12f;
              4'h3: out_low = 9'h12f;
              4'h4: out_low = 9'h12e;
              4'h5: out_low = 9'h12e;
              4'h6: out_low = 9'h12d;
              4'h7: out_low = 9'h12d;
              4'h8: out_low = 9'h12c;
              4'h9: out_low = 9'h12c;
              4'ha: out_low = 9'h12b;
              4'hb: out_low = 9'h12b;
              4'hc: out_low = 9'h12b;
              4'hd: out_low = 9'h12a;
              4'he: out_low = 9'h12a;
              4'hf: out_low = 9'h129;
              default: out_low = 9'h000;
            endcase
          end
          6'h11: begin
            case (mant[3:0])
              4'h0: out_low = 9'h129;
              4'h1: out_low = 9'h128;
              4'h2: out_low = 9'h128;
              4'h3: out_low = 9'h127;
              4'h4: out_low = 9'h127;
              4'h5: out_low = 9'h127;
              4'h6: out_low = 9'h126;
              4'h7: out_low = 9'h126;
              4'h8: out_low = 9'h125;
              4'h9: out_low = 9'h125;
              4'ha: out_low = 9'h124;
              4'hb: out_low = 9'h124;
              4'hc: out_low = 9'h123;
              4'hd: out_low = 9'h123;
              4'he: out_low = 9'h123;
              4'hf: out_low = 9'h122;
              default: out_low = 9'h000;
            endcase
          end
          6'h12: begin
            case (mant[3:0])
              4'h0: out_low = 9'h122;
              4'h1: out_low = 9'h121;
              4'h2: out_low = 9'h121;
              4'h3: out_low = 9'h120;
              4'h4: out_low = 9'h120;
              4'h5: out_low = 9'h11f;
              4'h6: out_low = 9'h11f;
              4'h7: out_low = 9'h11f;
              4'h8: out_low = 9'h11e;
              4'h9: out_low = 9'h11e;
              4'ha: out_low = 9'h11d;
              4'hb: out_low = 9'h11d;
              4'hc: out_low = 9'h11c;
              4'hd: out_low = 9'h11c;
              4'he: out_low = 9'h11b;
              4'hf: out_low = 9'h11b;
              default: out_low = 9'h000;
            endcase
          end
          6'h13: begin
            case (mant[3:0])
              4'h0: out_low = 9'h11b;
              4'h1: out_low = 9'h11a;
              4'h2: out_low = 9'h11a;
              4'h3: out_low = 9'h119;
              4'h4: out_low = 9'h119;
              4'h5: out_low = 9'h118;
              4'h6: out_low = 9'h118;
              4'h7: out_low = 9'h117;
              4'h8: out_low = 9'h117;
              4'h9: out_low = 9'h117;
              4'ha: out_low = 9'h116;
              4'hb: out_low = 9'h116;
              4'hc: out_low = 9'h115;
              4'hd: out_low = 9'h115;
              4'he: out_low = 9'h114;
              4'hf: out_low = 9'h114;
              default: out_low = 9'h000;
            endcase
          end
          6'h14: begin
            case (mant[3:0])
              4'h0: out_low = 9'h114;
              4'h1: out_low = 9'h113;
              4'h2: out_low = 9'h113;
              4'h3: out_low = 9'h112;
              4'h4: out_low = 9'h112;
              4'h5: out_low = 9'h111;
              4'h6: out_low = 9'h111;
              4'h7: out_low = 9'h110;
              4'h8: out_low = 9'h110;
              4'h9: out_low = 9'h110;
              4'ha: out_low = 9'h10f;
              4'hb: out_low = 9'h10f;
              4'hc: out_low = 9'h10e;
              4'hd: out_low = 9'h10e;
              4'he: out_low = 9'h10d;
              4'hf: out_low = 9'h10d;
              default: out_low = 9'h000;
            endcase
          end
          6'h15: begin
            case (mant[3:0])
              4'h0: out_low = 9'h10c;
              4'h1: out_low = 9'h10c;
              4'h2: out_low = 9'h10c;
              4'h3: out_low = 9'h10b;
              4'h4: out_low = 9'h10b;
              4'h5: out_low = 9'h10a;
              4'h6: out_low = 9'h10a;
              4'h7: out_low = 9'h109;
              4'h8: out_low = 9'h109;
              4'h9: out_low = 9'h109;
              4'ha: out_low = 9'h108;
              4'hb: out_low = 9'h108;
              4'hc: out_low = 9'h107;
              4'hd: out_low = 9'h107;
              4'he: out_low = 9'h106;
              4'hf: out_low = 9'h106;
              default: out_low = 9'h000;
            endcase
          end
          6'h16: begin
            case (mant[3:0])
              4'h0: out_low = 9'h106;
              4'h1: out_low = 9'h105;
              4'h2: out_low = 9'h105;
              4'h3: out_low = 9'h104;
              4'h4: out_low = 9'h104;
              4'h5: out_low = 9'h103;
              4'h6: out_low = 9'h103;
              4'h7: out_low = 9'h102;
              4'h8: out_low = 9'h102;
              4'h9: out_low = 9'h102;
              4'ha: out_low = 9'h101;
              4'hb: out_low = 9'h101;
              4'hc: out_low = 9'h100;
              4'hd: out_low = 9'h100;
              4'he: out_low = 9'h0ff;
              4'hf: out_low = 9'h0ff;
              default: out_low = 9'h000;
            endcase
          end
          6'h17: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0ff;
              4'h1: out_low = 9'h0fe;
              4'h2: out_low = 9'h0fe;
              4'h3: out_low = 9'h0fd;
              4'h4: out_low = 9'h0fd;
              4'h5: out_low = 9'h0fc;
              4'h6: out_low = 9'h0fc;
              4'h7: out_low = 9'h0fc;
              4'h8: out_low = 9'h0fb;
              4'h9: out_low = 9'h0fb;
              4'ha: out_low = 9'h0fa;
              4'hb: out_low = 9'h0fa;
              4'hc: out_low = 9'h0f9;
              4'hd: out_low = 9'h0f9;
              4'he: out_low = 9'h0f9;
              4'hf: out_low = 9'h0f8;
              default: out_low = 9'h000;
            endcase
          end
          6'h18: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0f8;
              4'h1: out_low = 9'h0f7;
              4'h2: out_low = 9'h0f7;
              4'h3: out_low = 9'h0f6;
              4'h4: out_low = 9'h0f6;
              4'h5: out_low = 9'h0f6;
              4'h6: out_low = 9'h0f5;
              4'h7: out_low = 9'h0f5;
              4'h8: out_low = 9'h0f4;
              4'h9: out_low = 9'h0f4;
              4'ha: out_low = 9'h0f3;
              4'hb: out_low = 9'h0f3;
              4'hc: out_low = 9'h0f3;
              4'hd: out_low = 9'h0f2;
              4'he: out_low = 9'h0f2;
              4'hf: out_low = 9'h0f1;
              default: out_low = 9'h000;
            endcase
          end
          6'h19: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0f1;
              4'h1: out_low = 9'h0f0;
              4'h2: out_low = 9'h0f0;
              4'h3: out_low = 9'h0f0;
              4'h4: out_low = 9'h0ef;
              4'h5: out_low = 9'h0ef;
              4'h6: out_low = 9'h0ee;
              4'h7: out_low = 9'h0ee;
              4'h8: out_low = 9'h0ed;
              4'h9: out_low = 9'h0ed;
              4'ha: out_low = 9'h0ed;
              4'hb: out_low = 9'h0ec;
              4'hc: out_low = 9'h0ec;
              4'hd: out_low = 9'h0eb;
              4'he: out_low = 9'h0eb;
              4'hf: out_low = 9'h0ea;
              default: out_low = 9'h000;
            endcase
          end
          6'h1a: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0ea;
              4'h1: out_low = 9'h0ea;
              4'h2: out_low = 9'h0e9;
              4'h3: out_low = 9'h0e9;
              4'h4: out_low = 9'h0e8;
              4'h5: out_low = 9'h0e8;
              4'h6: out_low = 9'h0e7;
              4'h7: out_low = 9'h0e7;
              4'h8: out_low = 9'h0e7;
              4'h9: out_low = 9'h0e6;
              4'ha: out_low = 9'h0e6;
              4'hb: out_low = 9'h0e5;
              4'hc: out_low = 9'h0e5;
              4'hd: out_low = 9'h0e4;
              4'he: out_low = 9'h0e4;
              4'hf: out_low = 9'h0e4;
              default: out_low = 9'h000;
            endcase
          end
          6'h1b: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0e3;
              4'h1: out_low = 9'h0e3;
              4'h2: out_low = 9'h0e2;
              4'h3: out_low = 9'h0e2;
              4'h4: out_low = 9'h0e1;
              4'h5: out_low = 9'h0e1;
              4'h6: out_low = 9'h0e1;
              4'h7: out_low = 9'h0e0;
              4'h8: out_low = 9'h0e0;
              4'h9: out_low = 9'h0df;
              4'ha: out_low = 9'h0df;
              4'hb: out_low = 9'h0df;
              4'hc: out_low = 9'h0de;
              4'hd: out_low = 9'h0de;
              4'he: out_low = 9'h0dd;
              4'hf: out_low = 9'h0dd;
              default: out_low = 9'h000;
            endcase
          end
          6'h1c: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0dc;
              4'h1: out_low = 9'h0dc;
              4'h2: out_low = 9'h0dc;
              4'h3: out_low = 9'h0db;
              4'h4: out_low = 9'h0db;
              4'h5: out_low = 9'h0da;
              4'h6: out_low = 9'h0da;
              4'h7: out_low = 9'h0d9;
              4'h8: out_low = 9'h0d9;
              4'h9: out_low = 9'h0d9;
              4'ha: out_low = 9'h0d8;
              4'hb: out_low = 9'h0d8;
              4'hc: out_low = 9'h0d7;
              4'hd: out_low = 9'h0d7;
              4'he: out_low = 9'h0d7;
              4'hf: out_low = 9'h0d6;
              default: out_low = 9'h000;
            endcase
          end
          6'h1d: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0d6;
              4'h1: out_low = 9'h0d5;
              4'h2: out_low = 9'h0d5;
              4'h3: out_low = 9'h0d4;
              4'h4: out_low = 9'h0d4;
              4'h5: out_low = 9'h0d4;
              4'h6: out_low = 9'h0d3;
              4'h7: out_low = 9'h0d3;
              4'h8: out_low = 9'h0d2;
              4'h9: out_low = 9'h0d2;
              4'ha: out_low = 9'h0d2;
              4'hb: out_low = 9'h0d1;
              4'hc: out_low = 9'h0d1;
              4'hd: out_low = 9'h0d0;
              4'he: out_low = 9'h0d0;
              4'hf: out_low = 9'h0cf;
              default: out_low = 9'h000;
            endcase
          end
          6'h1e: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0cf;
              4'h1: out_low = 9'h0cf;
              4'h2: out_low = 9'h0ce;
              4'h3: out_low = 9'h0ce;
              4'h4: out_low = 9'h0cd;
              4'h5: out_low = 9'h0cd;
              4'h6: out_low = 9'h0cd;
              4'h7: out_low = 9'h0cc;
              4'h8: out_low = 9'h0cc;
              4'h9: out_low = 9'h0cb;
              4'ha: out_low = 9'h0cb;
              4'hb: out_low = 9'h0ca;
              4'hc: out_low = 9'h0ca;
              4'hd: out_low = 9'h0ca;
              4'he: out_low = 9'h0c9;
              4'hf: out_low = 9'h0c9;
              default: out_low = 9'h000;
            endcase
          end
          6'h1f: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0c8;
              4'h1: out_low = 9'h0c8;
              4'h2: out_low = 9'h0c8;
              4'h3: out_low = 9'h0c7;
              4'h4: out_low = 9'h0c7;
              4'h5: out_low = 9'h0c6;
              4'h6: out_low = 9'h0c6;
              4'h7: out_low = 9'h0c5;
              4'h8: out_low = 9'h0c5;
              4'h9: out_low = 9'h0c5;
              4'ha: out_low = 9'h0c4;
              4'hb: out_low = 9'h0c4;
              4'hc: out_low = 9'h0c3;
              4'hd: out_low = 9'h0c3;
              4'he: out_low = 9'h0c3;
              4'hf: out_low = 9'h0c2;
              default: out_low = 9'h000;
            endcase
          end
          6'h20: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0c2;
              4'h1: out_low = 9'h0c1;
              4'h2: out_low = 9'h0c1;
              4'h3: out_low = 9'h0c1;
              4'h4: out_low = 9'h0c0;
              4'h5: out_low = 9'h0c0;
              4'h6: out_low = 9'h0bf;
              4'h7: out_low = 9'h0bf;
              4'h8: out_low = 9'h0be;
              4'h9: out_low = 9'h0be;
              4'ha: out_low = 9'h0be;
              4'hb: out_low = 9'h0bd;
              4'hc: out_low = 9'h0bd;
              4'hd: out_low = 9'h0bc;
              4'he: out_low = 9'h0bc;
              4'hf: out_low = 9'h0bc;
              default: out_low = 9'h000;
            endcase
          end
          6'h21: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0bb;
              4'h1: out_low = 9'h0bb;
              4'h2: out_low = 9'h0ba;
              4'h3: out_low = 9'h0ba;
              4'h4: out_low = 9'h0ba;
              4'h5: out_low = 9'h0b9;
              4'h6: out_low = 9'h0b9;
              4'h7: out_low = 9'h0b8;
              4'h8: out_low = 9'h0b8;
              4'h9: out_low = 9'h0b7;
              4'ha: out_low = 9'h0b7;
              4'hb: out_low = 9'h0b7;
              4'hc: out_low = 9'h0b6;
              4'hd: out_low = 9'h0b6;
              4'he: out_low = 9'h0b5;
              4'hf: out_low = 9'h0b5;
              default: out_low = 9'h000;
            endcase
          end
          6'h22: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0b5;
              4'h1: out_low = 9'h0b4;
              4'h2: out_low = 9'h0b4;
              4'h3: out_low = 9'h0b3;
              4'h4: out_low = 9'h0b3;
              4'h5: out_low = 9'h0b3;
              4'h6: out_low = 9'h0b2;
              4'h7: out_low = 9'h0b2;
              4'h8: out_low = 9'h0b1;
              4'h9: out_low = 9'h0b1;
              4'ha: out_low = 9'h0b1;
              4'hb: out_low = 9'h0b0;
              4'hc: out_low = 9'h0b0;
              4'hd: out_low = 9'h0af;
              4'he: out_low = 9'h0af;
              4'hf: out_low = 9'h0af;
              default: out_low = 9'h000;
            endcase
          end
          6'h23: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0ae;
              4'h1: out_low = 9'h0ae;
              4'h2: out_low = 9'h0ad;
              4'h3: out_low = 9'h0ad;
              4'h4: out_low = 9'h0ad;
              4'h5: out_low = 9'h0ac;
              4'h6: out_low = 9'h0ac;
              4'h7: out_low = 9'h0ab;
              4'h8: out_low = 9'h0ab;
              4'h9: out_low = 9'h0aa;
              4'ha: out_low = 9'h0aa;
              4'hb: out_low = 9'h0aa;
              4'hc: out_low = 9'h0a9;
              4'hd: out_low = 9'h0a9;
              4'he: out_low = 9'h0a8;
              4'hf: out_low = 9'h0a8;
              default: out_low = 9'h000;
            endcase
          end
          6'h24: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0a8;
              4'h1: out_low = 9'h0a7;
              4'h2: out_low = 9'h0a7;
              4'h3: out_low = 9'h0a6;
              4'h4: out_low = 9'h0a6;
              4'h5: out_low = 9'h0a6;
              4'h6: out_low = 9'h0a5;
              4'h7: out_low = 9'h0a5;
              4'h8: out_low = 9'h0a4;
              4'h9: out_low = 9'h0a4;
              4'ha: out_low = 9'h0a4;
              4'hb: out_low = 9'h0a3;
              4'hc: out_low = 9'h0a3;
              4'hd: out_low = 9'h0a2;
              4'he: out_low = 9'h0a2;
              4'hf: out_low = 9'h0a2;
              default: out_low = 9'h000;
            endcase
          end
          6'h25: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0a1;
              4'h1: out_low = 9'h0a1;
              4'h2: out_low = 9'h0a0;
              4'h3: out_low = 9'h0a0;
              4'h4: out_low = 9'h0a0;
              4'h5: out_low = 9'h09f;
              4'h6: out_low = 9'h09f;
              4'h7: out_low = 9'h09e;
              4'h8: out_low = 9'h09e;
              4'h9: out_low = 9'h09e;
              4'ha: out_low = 9'h09d;
              4'hb: out_low = 9'h09d;
              4'hc: out_low = 9'h09c;
              4'hd: out_low = 9'h09c;
              4'he: out_low = 9'h09c;
              4'hf: out_low = 9'h09b;
              default: out_low = 9'h000;
            endcase
          end
          6'h26: begin
            case (mant[3:0])
              4'h0: out_low = 9'h09b;
              4'h1: out_low = 9'h09a;
              4'h2: out_low = 9'h09a;
              4'h3: out_low = 9'h09a;
              4'h4: out_low = 9'h099;
              4'h5: out_low = 9'h099;
              4'h6: out_low = 9'h098;
              4'h7: out_low = 9'h098;
              4'h8: out_low = 9'h098;
              4'h9: out_low = 9'h097;
              4'ha: out_low = 9'h097;
              4'hb: out_low = 9'h096;
              4'hc: out_low = 9'h096;
              4'hd: out_low = 9'h096;
              4'he: out_low = 9'h095;
              4'hf: out_low = 9'h095;
              default: out_low = 9'h000;
            endcase
          end
          6'h27: begin
            case (mant[3:0])
              4'h0: out_low = 9'h094;
              4'h1: out_low = 9'h094;
              4'h2: out_low = 9'h094;
              4'h3: out_low = 9'h093;
              4'h4: out_low = 9'h093;
              4'h5: out_low = 9'h092;
              4'h6: out_low = 9'h092;
              4'h7: out_low = 9'h092;
              4'h8: out_low = 9'h091;
              4'h9: out_low = 9'h091;
              4'ha: out_low = 9'h090;
              4'hb: out_low = 9'h090;
              4'hc: out_low = 9'h090;
              4'hd: out_low = 9'h08f;
              4'he: out_low = 9'h08f;
              4'hf: out_low = 9'h08f;
              default: out_low = 9'h000;
            endcase
          end
          6'h28: begin
            case (mant[3:0])
              4'h0: out_low = 9'h08e;
              4'h1: out_low = 9'h08e;
              4'h2: out_low = 9'h08d;
              4'h3: out_low = 9'h08d;
              4'h4: out_low = 9'h08d;
              4'h5: out_low = 9'h08c;
              4'h6: out_low = 9'h08c;
              4'h7: out_low = 9'h08b;
              4'h8: out_low = 9'h08b;
              4'h9: out_low = 9'h08b;
              4'ha: out_low = 9'h08a;
              4'hb: out_low = 9'h08a;
              4'hc: out_low = 9'h089;
              4'hd: out_low = 9'h089;
              4'he: out_low = 9'h089;
              4'hf: out_low = 9'h088;
              default: out_low = 9'h000;
            endcase
          end
          6'h29: begin
            case (mant[3:0])
              4'h0: out_low = 9'h088;
              4'h1: out_low = 9'h087;
              4'h2: out_low = 9'h087;
              4'h3: out_low = 9'h087;
              4'h4: out_low = 9'h086;
              4'h5: out_low = 9'h086;
              4'h6: out_low = 9'h085;
              4'h7: out_low = 9'h085;
              4'h8: out_low = 9'h085;
              4'h9: out_low = 9'h084;
              4'ha: out_low = 9'h084;
              4'hb: out_low = 9'h084;
              4'hc: out_low = 9'h083;
              4'hd: out_low = 9'h083;
              4'he: out_low = 9'h082;
              4'hf: out_low = 9'h082;
              default: out_low = 9'h000;
            endcase
          end
          6'h2a: begin
            case (mant[3:0])
              4'h0: out_low = 9'h082;
              4'h1: out_low = 9'h081;
              4'h2: out_low = 9'h081;
              4'h3: out_low = 9'h080;
              4'h4: out_low = 9'h080;
              4'h5: out_low = 9'h080;
              4'h6: out_low = 9'h07f;
              4'h7: out_low = 9'h07f;
              4'h8: out_low = 9'h07e;
              4'h9: out_low = 9'h07e;
              4'ha: out_low = 9'h07e;
              4'hb: out_low = 9'h07d;
              4'hc: out_low = 9'h07d;
              4'hd: out_low = 9'h07c;
              4'he: out_low = 9'h07c;
              4'hf: out_low = 9'h07c;
              default: out_low = 9'h000;
            endcase
          end
          6'h2b: begin
            case (mant[3:0])
              4'h0: out_low = 9'h07b;
              4'h1: out_low = 9'h07b;
              4'h2: out_low = 9'h07b;
              4'h3: out_low = 9'h07a;
              4'h4: out_low = 9'h07a;
              4'h5: out_low = 9'h079;
              4'h6: out_low = 9'h079;
              4'h7: out_low = 9'h079;
              4'h8: out_low = 9'h078;
              4'h9: out_low = 9'h078;
              4'ha: out_low = 9'h077;
              4'hb: out_low = 9'h077;
              4'hc: out_low = 9'h077;
              4'hd: out_low = 9'h076;
              4'he: out_low = 9'h076;
              4'hf: out_low = 9'h076;
              default: out_low = 9'h000;
            endcase
          end
          6'h2c: begin
            case (mant[3:0])
              4'h0: out_low = 9'h075;
              4'h1: out_low = 9'h075;
              4'h2: out_low = 9'h074;
              4'h3: out_low = 9'h074;
              4'h4: out_low = 9'h074;
              4'h5: out_low = 9'h073;
              4'h6: out_low = 9'h073;
              4'h7: out_low = 9'h072;
              4'h8: out_low = 9'h072;
              4'h9: out_low = 9'h072;
              4'ha: out_low = 9'h071;
              4'hb: out_low = 9'h071;
              4'hc: out_low = 9'h071;
              4'hd: out_low = 9'h070;
              4'he: out_low = 9'h070;
              4'hf: out_low = 9'h06f;
              default: out_low = 9'h000;
            endcase
          end
          6'h2d: begin
            case (mant[3:0])
              4'h0: out_low = 9'h06f;
              4'h1: out_low = 9'h06f;
              4'h2: out_low = 9'h06e;
              4'h3: out_low = 9'h06e;
              4'h4: out_low = 9'h06d;
              4'h5: out_low = 9'h06d;
              4'h6: out_low = 9'h06d;
              4'h7: out_low = 9'h06c;
              4'h8: out_low = 9'h06c;
              4'h9: out_low = 9'h06c;
              4'ha: out_low = 9'h06b;
              4'hb: out_low = 9'h06b;
              4'hc: out_low = 9'h06a;
              4'hd: out_low = 9'h06a;
              4'he: out_low = 9'h06a;
              4'hf: out_low = 9'h069;
              default: out_low = 9'h000;
            endcase
          end
          6'h2e: begin
            case (mant[3:0])
              4'h0: out_low = 9'h069;
              4'h1: out_low = 9'h068;
              4'h2: out_low = 9'h068;
              4'h3: out_low = 9'h068;
              4'h4: out_low = 9'h067;
              4'h5: out_low = 9'h067;
              4'h6: out_low = 9'h067;
              4'h7: out_low = 9'h066;
              4'h8: out_low = 9'h066;
              4'h9: out_low = 9'h065;
              4'ha: out_low = 9'h065;
              4'hb: out_low = 9'h065;
              4'hc: out_low = 9'h064;
              4'hd: out_low = 9'h064;
              4'he: out_low = 9'h064;
              4'hf: out_low = 9'h063;
              default: out_low = 9'h000;
            endcase
          end
          6'h2f: begin
            case (mant[3:0])
              4'h0: out_low = 9'h063;
              4'h1: out_low = 9'h062;
              4'h2: out_low = 9'h062;
              4'h3: out_low = 9'h062;
              4'h4: out_low = 9'h061;
              4'h5: out_low = 9'h061;
              4'h6: out_low = 9'h060;
              4'h7: out_low = 9'h060;
              4'h8: out_low = 9'h060;
              4'h9: out_low = 9'h05f;
              4'ha: out_low = 9'h05f;
              4'hb: out_low = 9'h05f;
              4'hc: out_low = 9'h05e;
              4'hd: out_low = 9'h05e;
              4'he: out_low = 9'h05d;
              4'hf: out_low = 9'h05d;
              default: out_low = 9'h000;
            endcase
          end
          6'h30: begin
            case (mant[3:0])
              4'h0: out_low = 9'h05d;
              4'h1: out_low = 9'h05c;
              4'h2: out_low = 9'h05c;
              4'h3: out_low = 9'h05c;
              4'h4: out_low = 9'h05b;
              4'h5: out_low = 9'h05b;
              4'h6: out_low = 9'h05a;
              4'h7: out_low = 9'h05a;
              4'h8: out_low = 9'h05a;
              4'h9: out_low = 9'h059;
              4'ha: out_low = 9'h059;
              4'hb: out_low = 9'h059;
              4'hc: out_low = 9'h058;
              4'hd: out_low = 9'h058;
              4'he: out_low = 9'h057;
              4'hf: out_low = 9'h057;
              default: out_low = 9'h000;
            endcase
          end
          6'h31: begin
            case (mant[3:0])
              4'h0: out_low = 9'h057;
              4'h1: out_low = 9'h056;
              4'h2: out_low = 9'h056;
              4'h3: out_low = 9'h056;
              4'h4: out_low = 9'h055;
              4'h5: out_low = 9'h055;
              4'h6: out_low = 9'h054;
              4'h7: out_low = 9'h054;
              4'h8: out_low = 9'h054;
              4'h9: out_low = 9'h053;
              4'ha: out_low = 9'h053;
              4'hb: out_low = 9'h053;
              4'hc: out_low = 9'h052;
              4'hd: out_low = 9'h052;
              4'he: out_low = 9'h051;
              4'hf: out_low = 9'h051;
              default: out_low = 9'h000;
            endcase
          end
          6'h32: begin
            case (mant[3:0])
              4'h0: out_low = 9'h051;
              4'h1: out_low = 9'h050;
              4'h2: out_low = 9'h050;
              4'h3: out_low = 9'h050;
              4'h4: out_low = 9'h04f;
              4'h5: out_low = 9'h04f;
              4'h6: out_low = 9'h04e;
              4'h7: out_low = 9'h04e;
              4'h8: out_low = 9'h04e;
              4'h9: out_low = 9'h04d;
              4'ha: out_low = 9'h04d;
              4'hb: out_low = 9'h04d;
              4'hc: out_low = 9'h04c;
              4'hd: out_low = 9'h04c;
              4'he: out_low = 9'h04b;
              4'hf: out_low = 9'h04b;
              default: out_low = 9'h000;
            endcase
          end
          6'h33: begin
            case (mant[3:0])
              4'h0: out_low = 9'h04b;
              4'h1: out_low = 9'h04a;
              4'h2: out_low = 9'h04a;
              4'h3: out_low = 9'h04a;
              4'h4: out_low = 9'h049;
              4'h5: out_low = 9'h049;
              4'h6: out_low = 9'h048;
              4'h7: out_low = 9'h048;
              4'h8: out_low = 9'h048;
              4'h9: out_low = 9'h047;
              4'ha: out_low = 9'h047;
              4'hb: out_low = 9'h047;
              4'hc: out_low = 9'h046;
              4'hd: out_low = 9'h046;
              4'he: out_low = 9'h045;
              4'hf: out_low = 9'h045;
              default: out_low = 9'h000;
            endcase
          end
          6'h34: begin
            case (mant[3:0])
              4'h0: out_low = 9'h045;
              4'h1: out_low = 9'h044;
              4'h2: out_low = 9'h044;
              4'h3: out_low = 9'h044;
              4'h4: out_low = 9'h043;
              4'h5: out_low = 9'h043;
              4'h6: out_low = 9'h043;
              4'h7: out_low = 9'h042;
              4'h8: out_low = 9'h042;
              4'h9: out_low = 9'h041;
              4'ha: out_low = 9'h041;
              4'hb: out_low = 9'h041;
              4'hc: out_low = 9'h040;
              4'hd: out_low = 9'h040;
              4'he: out_low = 9'h040;
              4'hf: out_low = 9'h03f;
              default: out_low = 9'h000;
            endcase
          end
          6'h35: begin
            case (mant[3:0])
              4'h0: out_low = 9'h03f;
              4'h1: out_low = 9'h03e;
              4'h2: out_low = 9'h03e;
              4'h3: out_low = 9'h03e;
              4'h4: out_low = 9'h03d;
              4'h5: out_low = 9'h03d;
              4'h6: out_low = 9'h03d;
              4'h7: out_low = 9'h03c;
              4'h8: out_low = 9'h03c;
              4'h9: out_low = 9'h03c;
              4'ha: out_low = 9'h03b;
              4'hb: out_low = 9'h03b;
              4'hc: out_low = 9'h03a;
              4'hd: out_low = 9'h03a;
              4'he: out_low = 9'h03a;
              4'hf: out_low = 9'h039;
              default: out_low = 9'h000;
            endcase
          end
          6'h36: begin
            case (mant[3:0])
              4'h0: out_low = 9'h039;
              4'h1: out_low = 9'h039;
              4'h2: out_low = 9'h038;
              4'h3: out_low = 9'h038;
              4'h4: out_low = 9'h038;
              4'h5: out_low = 9'h037;
              4'h6: out_low = 9'h037;
              4'h7: out_low = 9'h036;
              4'h8: out_low = 9'h036;
              4'h9: out_low = 9'h036;
              4'ha: out_low = 9'h035;
              4'hb: out_low = 9'h035;
              4'hc: out_low = 9'h035;
              4'hd: out_low = 9'h034;
              4'he: out_low = 9'h034;
              4'hf: out_low = 9'h034;
              default: out_low = 9'h000;
            endcase
          end
          6'h37: begin
            case (mant[3:0])
              4'h0: out_low = 9'h033;
              4'h1: out_low = 9'h033;
              4'h2: out_low = 9'h032;
              4'h3: out_low = 9'h032;
              4'h4: out_low = 9'h032;
              4'h5: out_low = 9'h031;
              4'h6: out_low = 9'h031;
              4'h7: out_low = 9'h031;
              4'h8: out_low = 9'h030;
              4'h9: out_low = 9'h030;
              4'ha: out_low = 9'h030;
              4'hb: out_low = 9'h02f;
              4'hc: out_low = 9'h02f;
              4'hd: out_low = 9'h02e;
              4'he: out_low = 9'h02e;
              4'hf: out_low = 9'h02e;
              default: out_low = 9'h000;
            endcase
          end
          6'h38: begin
            case (mant[3:0])
              4'h0: out_low = 9'h02d;
              4'h1: out_low = 9'h02d;
              4'h2: out_low = 9'h02d;
              4'h3: out_low = 9'h02c;
              4'h4: out_low = 9'h02c;
              4'h5: out_low = 9'h02c;
              4'h6: out_low = 9'h02b;
              4'h7: out_low = 9'h02b;
              4'h8: out_low = 9'h02a;
              4'h9: out_low = 9'h02a;
              4'ha: out_low = 9'h02a;
              4'hb: out_low = 9'h029;
              4'hc: out_low = 9'h029;
              4'hd: out_low = 9'h029;
              4'he: out_low = 9'h028;
              4'hf: out_low = 9'h028;
              default: out_low = 9'h000;
            endcase
          end
          6'h39: begin
            case (mant[3:0])
              4'h0: out_low = 9'h028;
              4'h1: out_low = 9'h027;
              4'h2: out_low = 9'h027;
              4'h3: out_low = 9'h026;
              4'h4: out_low = 9'h026;
              4'h5: out_low = 9'h026;
              4'h6: out_low = 9'h025;
              4'h7: out_low = 9'h025;
              4'h8: out_low = 9'h025;
              4'h9: out_low = 9'h024;
              4'ha: out_low = 9'h024;
              4'hb: out_low = 9'h024;
              4'hc: out_low = 9'h023;
              4'hd: out_low = 9'h023;
              4'he: out_low = 9'h023;
              4'hf: out_low = 9'h022;
              default: out_low = 9'h000;
            endcase
          end
          6'h3a: begin
            case (mant[3:0])
              4'h0: out_low = 9'h022;
              4'h1: out_low = 9'h021;
              4'h2: out_low = 9'h021;
              4'h3: out_low = 9'h021;
              4'h4: out_low = 9'h020;
              4'h5: out_low = 9'h020;
              4'h6: out_low = 9'h020;
              4'h7: out_low = 9'h01f;
              4'h8: out_low = 9'h01f;
              4'h9: out_low = 9'h01f;
              4'ha: out_low = 9'h01e;
              4'hb: out_low = 9'h01e;
              4'hc: out_low = 9'h01e;
              4'hd: out_low = 9'h01d;
              4'he: out_low = 9'h01d;
              4'hf: out_low = 9'h01c;
              default: out_low = 9'h000;
            endcase
          end
          6'h3b: begin
            case (mant[3:0])
              4'h0: out_low = 9'h01c;
              4'h1: out_low = 9'h01c;
              4'h2: out_low = 9'h01b;
              4'h3: out_low = 9'h01b;
              4'h4: out_low = 9'h01b;
              4'h5: out_low = 9'h01a;
              4'h6: out_low = 9'h01a;
              4'h7: out_low = 9'h01a;
              4'h8: out_low = 9'h019;
              4'h9: out_low = 9'h019;
              4'ha: out_low = 9'h019;
              4'hb: out_low = 9'h018;
              4'hc: out_low = 9'h018;
              4'hd: out_low = 9'h017;
              4'he: out_low = 9'h017;
              4'hf: out_low = 9'h017;
              default: out_low = 9'h000;
            endcase
          end
          6'h3c: begin
            case (mant[3:0])
              4'h0: out_low = 9'h016;
              4'h1: out_low = 9'h016;
              4'h2: out_low = 9'h016;
              4'h3: out_low = 9'h015;
              4'h4: out_low = 9'h015;
              4'h5: out_low = 9'h015;
              4'h6: out_low = 9'h014;
              4'h7: out_low = 9'h014;
              4'h8: out_low = 9'h014;
              4'h9: out_low = 9'h013;
              4'ha: out_low = 9'h013;
              4'hb: out_low = 9'h013;
              4'hc: out_low = 9'h012;
              4'hd: out_low = 9'h012;
              4'he: out_low = 9'h011;
              4'hf: out_low = 9'h011;
              default: out_low = 9'h000;
            endcase
          end
          6'h3d: begin
            case (mant[3:0])
              4'h0: out_low = 9'h011;
              4'h1: out_low = 9'h010;
              4'h2: out_low = 9'h010;
              4'h3: out_low = 9'h010;
              4'h4: out_low = 9'h00f;
              4'h5: out_low = 9'h00f;
              4'h6: out_low = 9'h00f;
              4'h7: out_low = 9'h00e;
              4'h8: out_low = 9'h00e;
              4'h9: out_low = 9'h00e;
              4'ha: out_low = 9'h00d;
              4'hb: out_low = 9'h00d;
              4'hc: out_low = 9'h00d;
              4'hd: out_low = 9'h00c;
              4'he: out_low = 9'h00c;
              4'hf: out_low = 9'h00c;
              default: out_low = 9'h000;
            endcase
          end
          6'h3e: begin
            case (mant[3:0])
              4'h0: out_low = 9'h00b;
              4'h1: out_low = 9'h00b;
              4'h2: out_low = 9'h00a;
              4'h3: out_low = 9'h00a;
              4'h4: out_low = 9'h00a;
              4'h5: out_low = 9'h009;
              4'h6: out_low = 9'h009;
              4'h7: out_low = 9'h009;
              4'h8: out_low = 9'h008;
              4'h9: out_low = 9'h008;
              4'ha: out_low = 9'h008;
              4'hb: out_low = 9'h007;
              4'hc: out_low = 9'h007;
              4'hd: out_low = 9'h007;
              4'he: out_low = 9'h006;
              4'hf: out_low = 9'h006;
              default: out_low = 9'h000;
            endcase
          end
          6'h3f: begin
            case (mant[3:0])
              4'h0: out_low = 9'h006;
              4'h1: out_low = 9'h005;
              4'h2: out_low = 9'h005;
              4'h3: out_low = 9'h005;
              4'h4: out_low = 9'h004;
              4'h5: out_low = 9'h004;
              4'h6: out_low = 9'h003;
              4'h7: out_low = 9'h003;
              4'h8: out_low = 9'h003;
              4'h9: out_low = 9'h002;
              4'ha: out_low = 9'h002;
              4'hb: out_low = 9'h002;
              4'hc: out_low = 9'h001;
              4'hd: out_low = 9'h001;
              4'he: out_low = 9'h001;
              4'hf: out_low = 9'h000;
              default: out_low = 9'h000;
            endcase
          end
          default: out_low = 9'h000;
        endcase
      end
      6'h2f: begin
        case (mant[9:4])
          6'h00: begin
            case (mant[3:0])
              4'h0: out_low = 9'h000;
              4'h1: out_low = 9'h1ff;
              4'h2: out_low = 9'h1fd;
              4'h3: out_low = 9'h1fc;
              4'h4: out_low = 9'h1fa;
              4'h5: out_low = 9'h1f9;
              4'h6: out_low = 9'h1f8;
              4'h7: out_low = 9'h1f6;
              4'h8: out_low = 9'h1f5;
              4'h9: out_low = 9'h1f4;
              4'ha: out_low = 9'h1f2;
              4'hb: out_low = 9'h1f1;
              4'hc: out_low = 9'h1ef;
              4'hd: out_low = 9'h1ee;
              4'he: out_low = 9'h1ed;
              4'hf: out_low = 9'h1eb;
              default: out_low = 9'h000;
            endcase
          end
          6'h01: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1ea;
              4'h1: out_low = 9'h1e9;
              4'h2: out_low = 9'h1e7;
              4'h3: out_low = 9'h1e6;
              4'h4: out_low = 9'h1e4;
              4'h5: out_low = 9'h1e3;
              4'h6: out_low = 9'h1e2;
              4'h7: out_low = 9'h1e0;
              4'h8: out_low = 9'h1df;
              4'h9: out_low = 9'h1de;
              4'ha: out_low = 9'h1dc;
              4'hb: out_low = 9'h1db;
              4'hc: out_low = 9'h1da;
              4'hd: out_low = 9'h1d8;
              4'he: out_low = 9'h1d7;
              4'hf: out_low = 9'h1d5;
              default: out_low = 9'h000;
            endcase
          end
          6'h02: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1d4;
              4'h1: out_low = 9'h1d3;
              4'h2: out_low = 9'h1d1;
              4'h3: out_low = 9'h1d0;
              4'h4: out_low = 9'h1cf;
              4'h5: out_low = 9'h1cd;
              4'h6: out_low = 9'h1cc;
              4'h7: out_low = 9'h1cb;
              4'h8: out_low = 9'h1c9;
              4'h9: out_low = 9'h1c8;
              4'ha: out_low = 9'h1c7;
              4'hb: out_low = 9'h1c5;
              4'hc: out_low = 9'h1c4;
              4'hd: out_low = 9'h1c3;
              4'he: out_low = 9'h1c1;
              4'hf: out_low = 9'h1c0;
              default: out_low = 9'h000;
            endcase
          end
          6'h03: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1bf;
              4'h1: out_low = 9'h1bd;
              4'h2: out_low = 9'h1bc;
              4'h3: out_low = 9'h1bb;
              4'h4: out_low = 9'h1b9;
              4'h5: out_low = 9'h1b8;
              4'h6: out_low = 9'h1b6;
              4'h7: out_low = 9'h1b5;
              4'h8: out_low = 9'h1b4;
              4'h9: out_low = 9'h1b2;
              4'ha: out_low = 9'h1b1;
              4'hb: out_low = 9'h1b0;
              4'hc: out_low = 9'h1ae;
              4'hd: out_low = 9'h1ad;
              4'he: out_low = 9'h1ac;
              4'hf: out_low = 9'h1aa;
              default: out_low = 9'h000;
            endcase
          end
          6'h04: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1a9;
              4'h1: out_low = 9'h1a8;
              4'h2: out_low = 9'h1a7;
              4'h3: out_low = 9'h1a5;
              4'h4: out_low = 9'h1a4;
              4'h5: out_low = 9'h1a3;
              4'h6: out_low = 9'h1a1;
              4'h7: out_low = 9'h1a0;
              4'h8: out_low = 9'h19f;
              4'h9: out_low = 9'h19d;
              4'ha: out_low = 9'h19c;
              4'hb: out_low = 9'h19b;
              4'hc: out_low = 9'h199;
              4'hd: out_low = 9'h198;
              4'he: out_low = 9'h197;
              4'hf: out_low = 9'h195;
              default: out_low = 9'h000;
            endcase
          end
          6'h05: begin
            case (mant[3:0])
              4'h0: out_low = 9'h194;
              4'h1: out_low = 9'h193;
              4'h2: out_low = 9'h191;
              4'h3: out_low = 9'h190;
              4'h4: out_low = 9'h18f;
              4'h5: out_low = 9'h18d;
              4'h6: out_low = 9'h18c;
              4'h7: out_low = 9'h18b;
              4'h8: out_low = 9'h18a;
              4'h9: out_low = 9'h188;
              4'ha: out_low = 9'h187;
              4'hb: out_low = 9'h186;
              4'hc: out_low = 9'h184;
              4'hd: out_low = 9'h183;
              4'he: out_low = 9'h182;
              4'hf: out_low = 9'h180;
              default: out_low = 9'h000;
            endcase
          end
          6'h06: begin
            case (mant[3:0])
              4'h0: out_low = 9'h17f;
              4'h1: out_low = 9'h17e;
              4'h2: out_low = 9'h17d;
              4'h3: out_low = 9'h17b;
              4'h4: out_low = 9'h17a;
              4'h5: out_low = 9'h179;
              4'h6: out_low = 9'h177;
              4'h7: out_low = 9'h176;
              4'h8: out_low = 9'h175;
              4'h9: out_low = 9'h173;
              4'ha: out_low = 9'h172;
              4'hb: out_low = 9'h171;
              4'hc: out_low = 9'h170;
              4'hd: out_low = 9'h16e;
              4'he: out_low = 9'h16d;
              4'hf: out_low = 9'h16c;
              default: out_low = 9'h000;
            endcase
          end
          6'h07: begin
            case (mant[3:0])
              4'h0: out_low = 9'h16a;
              4'h1: out_low = 9'h169;
              4'h2: out_low = 9'h168;
              4'h3: out_low = 9'h167;
              4'h4: out_low = 9'h165;
              4'h5: out_low = 9'h164;
              4'h6: out_low = 9'h163;
              4'h7: out_low = 9'h162;
              4'h8: out_low = 9'h160;
              4'h9: out_low = 9'h15f;
              4'ha: out_low = 9'h15e;
              4'hb: out_low = 9'h15c;
              4'hc: out_low = 9'h15b;
              4'hd: out_low = 9'h15a;
              4'he: out_low = 9'h159;
              4'hf: out_low = 9'h157;
              default: out_low = 9'h000;
            endcase
          end
          6'h08: begin
            case (mant[3:0])
              4'h0: out_low = 9'h156;
              4'h1: out_low = 9'h155;
              4'h2: out_low = 9'h153;
              4'h3: out_low = 9'h152;
              4'h4: out_low = 9'h151;
              4'h5: out_low = 9'h150;
              4'h6: out_low = 9'h14e;
              4'h7: out_low = 9'h14d;
              4'h8: out_low = 9'h14c;
              4'h9: out_low = 9'h14b;
              4'ha: out_low = 9'h149;
              4'hb: out_low = 9'h148;
              4'hc: out_low = 9'h147;
              4'hd: out_low = 9'h146;
              4'he: out_low = 9'h144;
              4'hf: out_low = 9'h143;
              default: out_low = 9'h000;
            endcase
          end
          6'h09: begin
            case (mant[3:0])
              4'h0: out_low = 9'h142;
              4'h1: out_low = 9'h141;
              4'h2: out_low = 9'h13f;
              4'h3: out_low = 9'h13e;
              4'h4: out_low = 9'h13d;
              4'h5: out_low = 9'h13c;
              4'h6: out_low = 9'h13a;
              4'h7: out_low = 9'h139;
              4'h8: out_low = 9'h138;
              4'h9: out_low = 9'h137;
              4'ha: out_low = 9'h135;
              4'hb: out_low = 9'h134;
              4'hc: out_low = 9'h133;
              4'hd: out_low = 9'h132;
              4'he: out_low = 9'h130;
              4'hf: out_low = 9'h12f;
              default: out_low = 9'h000;
            endcase
          end
          6'h0a: begin
            case (mant[3:0])
              4'h0: out_low = 9'h12e;
              4'h1: out_low = 9'h12d;
              4'h2: out_low = 9'h12b;
              4'h3: out_low = 9'h12a;
              4'h4: out_low = 9'h129;
              4'h5: out_low = 9'h128;
              4'h6: out_low = 9'h126;
              4'h7: out_low = 9'h125;
              4'h8: out_low = 9'h124;
              4'h9: out_low = 9'h123;
              4'ha: out_low = 9'h121;
              4'hb: out_low = 9'h120;
              4'hc: out_low = 9'h11f;
              4'hd: out_low = 9'h11e;
              4'he: out_low = 9'h11c;
              4'hf: out_low = 9'h11b;
              default: out_low = 9'h000;
            endcase
          end
          6'h0b: begin
            case (mant[3:0])
              4'h0: out_low = 9'h11a;
              4'h1: out_low = 9'h119;
              4'h2: out_low = 9'h118;
              4'h3: out_low = 9'h116;
              4'h4: out_low = 9'h115;
              4'h5: out_low = 9'h114;
              4'h6: out_low = 9'h113;
              4'h7: out_low = 9'h111;
              4'h8: out_low = 9'h110;
              4'h9: out_low = 9'h10f;
              4'ha: out_low = 9'h10e;
              4'hb: out_low = 9'h10c;
              4'hc: out_low = 9'h10b;
              4'hd: out_low = 9'h10a;
              4'he: out_low = 9'h109;
              4'hf: out_low = 9'h108;
              default: out_low = 9'h000;
            endcase
          end
          6'h0c: begin
            case (mant[3:0])
              4'h0: out_low = 9'h106;
              4'h1: out_low = 9'h105;
              4'h2: out_low = 9'h104;
              4'h3: out_low = 9'h103;
              4'h4: out_low = 9'h102;
              4'h5: out_low = 9'h100;
              4'h6: out_low = 9'h0ff;
              4'h7: out_low = 9'h0fe;
              4'h8: out_low = 9'h0fd;
              4'h9: out_low = 9'h0fb;
              4'ha: out_low = 9'h0fa;
              4'hb: out_low = 9'h0f9;
              4'hc: out_low = 9'h0f8;
              4'hd: out_low = 9'h0f7;
              4'he: out_low = 9'h0f5;
              4'hf: out_low = 9'h0f4;
              default: out_low = 9'h000;
            endcase
          end
          6'h0d: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0f3;
              4'h1: out_low = 9'h0f2;
              4'h2: out_low = 9'h0f1;
              4'h3: out_low = 9'h0ef;
              4'h4: out_low = 9'h0ee;
              4'h5: out_low = 9'h0ed;
              4'h6: out_low = 9'h0ec;
              4'h7: out_low = 9'h0eb;
              4'h8: out_low = 9'h0e9;
              4'h9: out_low = 9'h0e8;
              4'ha: out_low = 9'h0e7;
              4'hb: out_low = 9'h0e6;
              4'hc: out_low = 9'h0e5;
              4'hd: out_low = 9'h0e3;
              4'he: out_low = 9'h0e2;
              4'hf: out_low = 9'h0e1;
              default: out_low = 9'h000;
            endcase
          end
          6'h0e: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0e0;
              4'h1: out_low = 9'h0df;
              4'h2: out_low = 9'h0dd;
              4'h3: out_low = 9'h0dc;
              4'h4: out_low = 9'h0db;
              4'h5: out_low = 9'h0da;
              4'h6: out_low = 9'h0d9;
              4'h7: out_low = 9'h0d8;
              4'h8: out_low = 9'h0d6;
              4'h9: out_low = 9'h0d5;
              4'ha: out_low = 9'h0d4;
              4'hb: out_low = 9'h0d3;
              4'hc: out_low = 9'h0d2;
              4'hd: out_low = 9'h0d0;
              4'he: out_low = 9'h0cf;
              4'hf: out_low = 9'h0ce;
              default: out_low = 9'h000;
            endcase
          end
          6'h0f: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0cd;
              4'h1: out_low = 9'h0cc;
              4'h2: out_low = 9'h0cb;
              4'h3: out_low = 9'h0c9;
              4'h4: out_low = 9'h0c8;
              4'h5: out_low = 9'h0c7;
              4'h6: out_low = 9'h0c6;
              4'h7: out_low = 9'h0c5;
              4'h8: out_low = 9'h0c4;
              4'h9: out_low = 9'h0c2;
              4'ha: out_low = 9'h0c1;
              4'hb: out_low = 9'h0c0;
              4'hc: out_low = 9'h0bf;
              4'hd: out_low = 9'h0be;
              4'he: out_low = 9'h0bc;
              4'hf: out_low = 9'h0bb;
              default: out_low = 9'h000;
            endcase
          end
          6'h10: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0ba;
              4'h1: out_low = 9'h0b9;
              4'h2: out_low = 9'h0b8;
              4'h3: out_low = 9'h0b7;
              4'h4: out_low = 9'h0b5;
              4'h5: out_low = 9'h0b4;
              4'h6: out_low = 9'h0b3;
              4'h7: out_low = 9'h0b2;
              4'h8: out_low = 9'h0b1;
              4'h9: out_low = 9'h0b0;
              4'ha: out_low = 9'h0af;
              4'hb: out_low = 9'h0ad;
              4'hc: out_low = 9'h0ac;
              4'hd: out_low = 9'h0ab;
              4'he: out_low = 9'h0aa;
              4'hf: out_low = 9'h0a9;
              default: out_low = 9'h000;
            endcase
          end
          6'h11: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0a8;
              4'h1: out_low = 9'h0a6;
              4'h2: out_low = 9'h0a5;
              4'h3: out_low = 9'h0a4;
              4'h4: out_low = 9'h0a3;
              4'h5: out_low = 9'h0a2;
              4'h6: out_low = 9'h0a1;
              4'h7: out_low = 9'h0a0;
              4'h8: out_low = 9'h09e;
              4'h9: out_low = 9'h09d;
              4'ha: out_low = 9'h09c;
              4'hb: out_low = 9'h09b;
              4'hc: out_low = 9'h09a;
              4'hd: out_low = 9'h099;
              4'he: out_low = 9'h098;
              4'hf: out_low = 9'h096;
              default: out_low = 9'h000;
            endcase
          end
          6'h12: begin
            case (mant[3:0])
              4'h0: out_low = 9'h095;
              4'h1: out_low = 9'h094;
              4'h2: out_low = 9'h093;
              4'h3: out_low = 9'h092;
              4'h4: out_low = 9'h091;
              4'h5: out_low = 9'h090;
              4'h6: out_low = 9'h08e;
              4'h7: out_low = 9'h08d;
              4'h8: out_low = 9'h08c;
              4'h9: out_low = 9'h08b;
              4'ha: out_low = 9'h08a;
              4'hb: out_low = 9'h089;
              4'hc: out_low = 9'h088;
              4'hd: out_low = 9'h086;
              4'he: out_low = 9'h085;
              4'hf: out_low = 9'h084;
              default: out_low = 9'h000;
            endcase
          end
          6'h13: begin
            case (mant[3:0])
              4'h0: out_low = 9'h083;
              4'h1: out_low = 9'h082;
              4'h2: out_low = 9'h081;
              4'h3: out_low = 9'h080;
              4'h4: out_low = 9'h07f;
              4'h5: out_low = 9'h07d;
              4'h6: out_low = 9'h07c;
              4'h7: out_low = 9'h07b;
              4'h8: out_low = 9'h07a;
              4'h9: out_low = 9'h079;
              4'ha: out_low = 9'h078;
              4'hb: out_low = 9'h077;
              4'hc: out_low = 9'h076;
              4'hd: out_low = 9'h074;
              4'he: out_low = 9'h073;
              4'hf: out_low = 9'h072;
              default: out_low = 9'h000;
            endcase
          end
          6'h14: begin
            case (mant[3:0])
              4'h0: out_low = 9'h071;
              4'h1: out_low = 9'h070;
              4'h2: out_low = 9'h06f;
              4'h3: out_low = 9'h06e;
              4'h4: out_low = 9'h06d;
              4'h5: out_low = 9'h06c;
              4'h6: out_low = 9'h06a;
              4'h7: out_low = 9'h069;
              4'h8: out_low = 9'h068;
              4'h9: out_low = 9'h067;
              4'ha: out_low = 9'h066;
              4'hb: out_low = 9'h065;
              4'hc: out_low = 9'h064;
              4'hd: out_low = 9'h063;
              4'he: out_low = 9'h062;
              4'hf: out_low = 9'h060;
              default: out_low = 9'h000;
            endcase
          end
          6'h15: begin
            case (mant[3:0])
              4'h0: out_low = 9'h05f;
              4'h1: out_low = 9'h05e;
              4'h2: out_low = 9'h05d;
              4'h3: out_low = 9'h05c;
              4'h4: out_low = 9'h05b;
              4'h5: out_low = 9'h05a;
              4'h6: out_low = 9'h059;
              4'h7: out_low = 9'h058;
              4'h8: out_low = 9'h057;
              4'h9: out_low = 9'h055;
              4'ha: out_low = 9'h054;
              4'hb: out_low = 9'h053;
              4'hc: out_low = 9'h052;
              4'hd: out_low = 9'h051;
              4'he: out_low = 9'h050;
              4'hf: out_low = 9'h04f;
              default: out_low = 9'h000;
            endcase
          end
          6'h16: begin
            case (mant[3:0])
              4'h0: out_low = 9'h04e;
              4'h1: out_low = 9'h04d;
              4'h2: out_low = 9'h04c;
              4'h3: out_low = 9'h04b;
              4'h4: out_low = 9'h049;
              4'h5: out_low = 9'h048;
              4'h6: out_low = 9'h047;
              4'h7: out_low = 9'h046;
              4'h8: out_low = 9'h045;
              4'h9: out_low = 9'h044;
              4'ha: out_low = 9'h043;
              4'hb: out_low = 9'h042;
              4'hc: out_low = 9'h041;
              4'hd: out_low = 9'h040;
              4'he: out_low = 9'h03f;
              4'hf: out_low = 9'h03e;
              default: out_low = 9'h000;
            endcase
          end
          6'h17: begin
            case (mant[3:0])
              4'h0: out_low = 9'h03c;
              4'h1: out_low = 9'h03b;
              4'h2: out_low = 9'h03a;
              4'h3: out_low = 9'h039;
              4'h4: out_low = 9'h038;
              4'h5: out_low = 9'h037;
              4'h6: out_low = 9'h036;
              4'h7: out_low = 9'h035;
              4'h8: out_low = 9'h034;
              4'h9: out_low = 9'h033;
              4'ha: out_low = 9'h032;
              4'hb: out_low = 9'h031;
              4'hc: out_low = 9'h030;
              4'hd: out_low = 9'h02e;
              4'he: out_low = 9'h02d;
              4'hf: out_low = 9'h02c;
              default: out_low = 9'h000;
            endcase
          end
          6'h18: begin
            case (mant[3:0])
              4'h0: out_low = 9'h02b;
              4'h1: out_low = 9'h02a;
              4'h2: out_low = 9'h029;
              4'h3: out_low = 9'h028;
              4'h4: out_low = 9'h027;
              4'h5: out_low = 9'h026;
              4'h6: out_low = 9'h025;
              4'h7: out_low = 9'h024;
              4'h8: out_low = 9'h023;
              4'h9: out_low = 9'h022;
              4'ha: out_low = 9'h021;
              4'hb: out_low = 9'h020;
              4'hc: out_low = 9'h01e;
              4'hd: out_low = 9'h01d;
              4'he: out_low = 9'h01c;
              4'hf: out_low = 9'h01b;
              default: out_low = 9'h000;
            endcase
          end
          6'h19: begin
            case (mant[3:0])
              4'h0: out_low = 9'h01a;
              4'h1: out_low = 9'h019;
              4'h2: out_low = 9'h018;
              4'h3: out_low = 9'h017;
              4'h4: out_low = 9'h016;
              4'h5: out_low = 9'h015;
              4'h6: out_low = 9'h014;
              4'h7: out_low = 9'h013;
              4'h8: out_low = 9'h012;
              4'h9: out_low = 9'h011;
              4'ha: out_low = 9'h010;
              4'hb: out_low = 9'h00f;
              4'hc: out_low = 9'h00e;
              4'hd: out_low = 9'h00d;
              4'he: out_low = 9'h00b;
              4'hf: out_low = 9'h00a;
              default: out_low = 9'h000;
            endcase
          end
          6'h1a: begin
            case (mant[3:0])
              4'h0: out_low = 9'h009;
              4'h1: out_low = 9'h008;
              4'h2: out_low = 9'h007;
              4'h3: out_low = 9'h006;
              4'h4: out_low = 9'h005;
              4'h5: out_low = 9'h004;
              4'h6: out_low = 9'h003;
              4'h7: out_low = 9'h002;
              4'h8: out_low = 9'h001;
              4'h9: out_low = 9'h000;
              4'ha: out_low = 9'h1ff;
              4'hb: out_low = 9'h1fe;
              4'hc: out_low = 9'h1fd;
              4'hd: out_low = 9'h1fc;
              4'he: out_low = 9'h1fb;
              4'hf: out_low = 9'h1fa;
              default: out_low = 9'h000;
            endcase
          end
          6'h1b: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1f9;
              4'h1: out_low = 9'h1f8;
              4'h2: out_low = 9'h1f7;
              4'h3: out_low = 9'h1f6;
              4'h4: out_low = 9'h1f5;
              4'h5: out_low = 9'h1f4;
              4'h6: out_low = 9'h1f3;
              4'h7: out_low = 9'h1f2;
              4'h8: out_low = 9'h1f0;
              4'h9: out_low = 9'h1ef;
              4'ha: out_low = 9'h1ee;
              4'hb: out_low = 9'h1ed;
              4'hc: out_low = 9'h1ec;
              4'hd: out_low = 9'h1eb;
              4'he: out_low = 9'h1ea;
              4'hf: out_low = 9'h1e9;
              default: out_low = 9'h000;
            endcase
          end
          6'h1c: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1e8;
              4'h1: out_low = 9'h1e7;
              4'h2: out_low = 9'h1e6;
              4'h3: out_low = 9'h1e5;
              4'h4: out_low = 9'h1e4;
              4'h5: out_low = 9'h1e3;
              4'h6: out_low = 9'h1e2;
              4'h7: out_low = 9'h1e1;
              4'h8: out_low = 9'h1e0;
              4'h9: out_low = 9'h1df;
              4'ha: out_low = 9'h1de;
              4'hb: out_low = 9'h1dd;
              4'hc: out_low = 9'h1dc;
              4'hd: out_low = 9'h1db;
              4'he: out_low = 9'h1da;
              4'hf: out_low = 9'h1d9;
              default: out_low = 9'h000;
            endcase
          end
          6'h1d: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1d8;
              4'h1: out_low = 9'h1d7;
              4'h2: out_low = 9'h1d6;
              4'h3: out_low = 9'h1d5;
              4'h4: out_low = 9'h1d4;
              4'h5: out_low = 9'h1d3;
              4'h6: out_low = 9'h1d2;
              4'h7: out_low = 9'h1d1;
              4'h8: out_low = 9'h1d0;
              4'h9: out_low = 9'h1cf;
              4'ha: out_low = 9'h1ce;
              4'hb: out_low = 9'h1cd;
              4'hc: out_low = 9'h1cc;
              4'hd: out_low = 9'h1cb;
              4'he: out_low = 9'h1ca;
              4'hf: out_low = 9'h1c9;
              default: out_low = 9'h000;
            endcase
          end
          6'h1e: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1c8;
              4'h1: out_low = 9'h1c7;
              4'h2: out_low = 9'h1c6;
              4'h3: out_low = 9'h1c5;
              4'h4: out_low = 9'h1c4;
              4'h5: out_low = 9'h1c3;
              4'h6: out_low = 9'h1c2;
              4'h7: out_low = 9'h1c1;
              4'h8: out_low = 9'h1c0;
              4'h9: out_low = 9'h1bf;
              4'ha: out_low = 9'h1be;
              4'hb: out_low = 9'h1bd;
              4'hc: out_low = 9'h1bc;
              4'hd: out_low = 9'h1bb;
              4'he: out_low = 9'h1ba;
              4'hf: out_low = 9'h1b9;
              default: out_low = 9'h000;
            endcase
          end
          6'h1f: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1b8;
              4'h1: out_low = 9'h1b7;
              4'h2: out_low = 9'h1b6;
              4'h3: out_low = 9'h1b5;
              4'h4: out_low = 9'h1b4;
              4'h5: out_low = 9'h1b3;
              4'h6: out_low = 9'h1b2;
              4'h7: out_low = 9'h1b1;
              4'h8: out_low = 9'h1b0;
              4'h9: out_low = 9'h1af;
              4'ha: out_low = 9'h1ae;
              4'hb: out_low = 9'h1ad;
              4'hc: out_low = 9'h1ac;
              4'hd: out_low = 9'h1ab;
              4'he: out_low = 9'h1aa;
              4'hf: out_low = 9'h1a9;
              default: out_low = 9'h000;
            endcase
          end
          6'h20: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1a8;
              4'h1: out_low = 9'h1a7;
              4'h2: out_low = 9'h1a6;
              4'h3: out_low = 9'h1a5;
              4'h4: out_low = 9'h1a4;
              4'h5: out_low = 9'h1a3;
              4'h6: out_low = 9'h1a2;
              4'h7: out_low = 9'h1a1;
              4'h8: out_low = 9'h1a0;
              4'h9: out_low = 9'h19f;
              4'ha: out_low = 9'h19e;
              4'hb: out_low = 9'h19d;
              4'hc: out_low = 9'h19c;
              4'hd: out_low = 9'h19b;
              4'he: out_low = 9'h19a;
              4'hf: out_low = 9'h19a;
              default: out_low = 9'h000;
            endcase
          end
          6'h21: begin
            case (mant[3:0])
              4'h0: out_low = 9'h199;
              4'h1: out_low = 9'h198;
              4'h2: out_low = 9'h197;
              4'h3: out_low = 9'h196;
              4'h4: out_low = 9'h195;
              4'h5: out_low = 9'h194;
              4'h6: out_low = 9'h193;
              4'h7: out_low = 9'h192;
              4'h8: out_low = 9'h191;
              4'h9: out_low = 9'h190;
              4'ha: out_low = 9'h18f;
              4'hb: out_low = 9'h18e;
              4'hc: out_low = 9'h18d;
              4'hd: out_low = 9'h18c;
              4'he: out_low = 9'h18b;
              4'hf: out_low = 9'h18a;
              default: out_low = 9'h000;
            endcase
          end
          6'h22: begin
            case (mant[3:0])
              4'h0: out_low = 9'h189;
              4'h1: out_low = 9'h188;
              4'h2: out_low = 9'h187;
              4'h3: out_low = 9'h186;
              4'h4: out_low = 9'h185;
              4'h5: out_low = 9'h184;
              4'h6: out_low = 9'h183;
              4'h7: out_low = 9'h182;
              4'h8: out_low = 9'h181;
              4'h9: out_low = 9'h181;
              4'ha: out_low = 9'h180;
              4'hb: out_low = 9'h17f;
              4'hc: out_low = 9'h17e;
              4'hd: out_low = 9'h17d;
              4'he: out_low = 9'h17c;
              4'hf: out_low = 9'h17b;
              default: out_low = 9'h000;
            endcase
          end
          6'h23: begin
            case (mant[3:0])
              4'h0: out_low = 9'h17a;
              4'h1: out_low = 9'h179;
              4'h2: out_low = 9'h178;
              4'h3: out_low = 9'h177;
              4'h4: out_low = 9'h176;
              4'h5: out_low = 9'h175;
              4'h6: out_low = 9'h174;
              4'h7: out_low = 9'h173;
              4'h8: out_low = 9'h172;
              4'h9: out_low = 9'h171;
              4'ha: out_low = 9'h170;
              4'hb: out_low = 9'h16f;
              4'hc: out_low = 9'h16f;
              4'hd: out_low = 9'h16e;
              4'he: out_low = 9'h16d;
              4'hf: out_low = 9'h16c;
              default: out_low = 9'h000;
            endcase
          end
          6'h24: begin
            case (mant[3:0])
              4'h0: out_low = 9'h16b;
              4'h1: out_low = 9'h16a;
              4'h2: out_low = 9'h169;
              4'h3: out_low = 9'h168;
              4'h4: out_low = 9'h167;
              4'h5: out_low = 9'h166;
              4'h6: out_low = 9'h165;
              4'h7: out_low = 9'h164;
              4'h8: out_low = 9'h163;
              4'h9: out_low = 9'h162;
              4'ha: out_low = 9'h161;
              4'hb: out_low = 9'h160;
              4'hc: out_low = 9'h160;
              4'hd: out_low = 9'h15f;
              4'he: out_low = 9'h15e;
              4'hf: out_low = 9'h15d;
              default: out_low = 9'h000;
            endcase
          end
          6'h25: begin
            case (mant[3:0])
              4'h0: out_low = 9'h15c;
              4'h1: out_low = 9'h15b;
              4'h2: out_low = 9'h15a;
              4'h3: out_low = 9'h159;
              4'h4: out_low = 9'h158;
              4'h5: out_low = 9'h157;
              4'h6: out_low = 9'h156;
              4'h7: out_low = 9'h155;
              4'h8: out_low = 9'h154;
              4'h9: out_low = 9'h153;
              4'ha: out_low = 9'h153;
              4'hb: out_low = 9'h152;
              4'hc: out_low = 9'h151;
              4'hd: out_low = 9'h150;
              4'he: out_low = 9'h14f;
              4'hf: out_low = 9'h14e;
              default: out_low = 9'h000;
            endcase
          end
          6'h26: begin
            case (mant[3:0])
              4'h0: out_low = 9'h14d;
              4'h1: out_low = 9'h14c;
              4'h2: out_low = 9'h14b;
              4'h3: out_low = 9'h14a;
              4'h4: out_low = 9'h149;
              4'h5: out_low = 9'h148;
              4'h6: out_low = 9'h148;
              4'h7: out_low = 9'h147;
              4'h8: out_low = 9'h146;
              4'h9: out_low = 9'h145;
              4'ha: out_low = 9'h144;
              4'hb: out_low = 9'h143;
              4'hc: out_low = 9'h142;
              4'hd: out_low = 9'h141;
              4'he: out_low = 9'h140;
              4'hf: out_low = 9'h13f;
              default: out_low = 9'h000;
            endcase
          end
          6'h27: begin
            case (mant[3:0])
              4'h0: out_low = 9'h13e;
              4'h1: out_low = 9'h13e;
              4'h2: out_low = 9'h13d;
              4'h3: out_low = 9'h13c;
              4'h4: out_low = 9'h13b;
              4'h5: out_low = 9'h13a;
              4'h6: out_low = 9'h139;
              4'h7: out_low = 9'h138;
              4'h8: out_low = 9'h137;
              4'h9: out_low = 9'h136;
              4'ha: out_low = 9'h135;
              4'hb: out_low = 9'h134;
              4'hc: out_low = 9'h134;
              4'hd: out_low = 9'h133;
              4'he: out_low = 9'h132;
              4'hf: out_low = 9'h131;
              default: out_low = 9'h000;
            endcase
          end
          6'h28: begin
            case (mant[3:0])
              4'h0: out_low = 9'h130;
              4'h1: out_low = 9'h12f;
              4'h2: out_low = 9'h12e;
              4'h3: out_low = 9'h12d;
              4'h4: out_low = 9'h12c;
              4'h5: out_low = 9'h12b;
              4'h6: out_low = 9'h12b;
              4'h7: out_low = 9'h12a;
              4'h8: out_low = 9'h129;
              4'h9: out_low = 9'h128;
              4'ha: out_low = 9'h127;
              4'hb: out_low = 9'h126;
              4'hc: out_low = 9'h125;
              4'hd: out_low = 9'h124;
              4'he: out_low = 9'h123;
              4'hf: out_low = 9'h123;
              default: out_low = 9'h000;
            endcase
          end
          6'h29: begin
            case (mant[3:0])
              4'h0: out_low = 9'h122;
              4'h1: out_low = 9'h121;
              4'h2: out_low = 9'h120;
              4'h3: out_low = 9'h11f;
              4'h4: out_low = 9'h11e;
              4'h5: out_low = 9'h11d;
              4'h6: out_low = 9'h11c;
              4'h7: out_low = 9'h11b;
              4'h8: out_low = 9'h11b;
              4'h9: out_low = 9'h11a;
              4'ha: out_low = 9'h119;
              4'hb: out_low = 9'h118;
              4'hc: out_low = 9'h117;
              4'hd: out_low = 9'h116;
              4'he: out_low = 9'h115;
              4'hf: out_low = 9'h114;
              default: out_low = 9'h000;
            endcase
          end
          6'h2a: begin
            case (mant[3:0])
              4'h0: out_low = 9'h114;
              4'h1: out_low = 9'h113;
              4'h2: out_low = 9'h112;
              4'h3: out_low = 9'h111;
              4'h4: out_low = 9'h110;
              4'h5: out_low = 9'h10f;
              4'h6: out_low = 9'h10e;
              4'h7: out_low = 9'h10d;
              4'h8: out_low = 9'h10c;
              4'h9: out_low = 9'h10c;
              4'ha: out_low = 9'h10b;
              4'hb: out_low = 9'h10a;
              4'hc: out_low = 9'h109;
              4'hd: out_low = 9'h108;
              4'he: out_low = 9'h107;
              4'hf: out_low = 9'h106;
              default: out_low = 9'h000;
            endcase
          end
          6'h2b: begin
            case (mant[3:0])
              4'h0: out_low = 9'h106;
              4'h1: out_low = 9'h105;
              4'h2: out_low = 9'h104;
              4'h3: out_low = 9'h103;
              4'h4: out_low = 9'h102;
              4'h5: out_low = 9'h101;
              4'h6: out_low = 9'h100;
              4'h7: out_low = 9'h0ff;
              4'h8: out_low = 9'h0ff;
              4'h9: out_low = 9'h0fe;
              4'ha: out_low = 9'h0fd;
              4'hb: out_low = 9'h0fc;
              4'hc: out_low = 9'h0fb;
              4'hd: out_low = 9'h0fa;
              4'he: out_low = 9'h0f9;
              4'hf: out_low = 9'h0f9;
              default: out_low = 9'h000;
            endcase
          end
          6'h2c: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0f8;
              4'h1: out_low = 9'h0f7;
              4'h2: out_low = 9'h0f6;
              4'h3: out_low = 9'h0f5;
              4'h4: out_low = 9'h0f4;
              4'h5: out_low = 9'h0f3;
              4'h6: out_low = 9'h0f3;
              4'h7: out_low = 9'h0f2;
              4'h8: out_low = 9'h0f1;
              4'h9: out_low = 9'h0f0;
              4'ha: out_low = 9'h0ef;
              4'hb: out_low = 9'h0ee;
              4'hc: out_low = 9'h0ed;
              4'hd: out_low = 9'h0ed;
              4'he: out_low = 9'h0ec;
              4'hf: out_low = 9'h0eb;
              default: out_low = 9'h000;
            endcase
          end
          6'h2d: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0ea;
              4'h1: out_low = 9'h0e9;
              4'h2: out_low = 9'h0e8;
              4'h3: out_low = 9'h0e7;
              4'h4: out_low = 9'h0e7;
              4'h5: out_low = 9'h0e6;
              4'h6: out_low = 9'h0e5;
              4'h7: out_low = 9'h0e4;
              4'h8: out_low = 9'h0e3;
              4'h9: out_low = 9'h0e2;
              4'ha: out_low = 9'h0e1;
              4'hb: out_low = 9'h0e1;
              4'hc: out_low = 9'h0e0;
              4'hd: out_low = 9'h0df;
              4'he: out_low = 9'h0de;
              4'hf: out_low = 9'h0dd;
              default: out_low = 9'h000;
            endcase
          end
          6'h2e: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0dc;
              4'h1: out_low = 9'h0dc;
              4'h2: out_low = 9'h0db;
              4'h3: out_low = 9'h0da;
              4'h4: out_low = 9'h0d9;
              4'h5: out_low = 9'h0d8;
              4'h6: out_low = 9'h0d7;
              4'h7: out_low = 9'h0d7;
              4'h8: out_low = 9'h0d6;
              4'h9: out_low = 9'h0d5;
              4'ha: out_low = 9'h0d4;
              4'hb: out_low = 9'h0d3;
              4'hc: out_low = 9'h0d2;
              4'hd: out_low = 9'h0d2;
              4'he: out_low = 9'h0d1;
              4'hf: out_low = 9'h0d0;
              default: out_low = 9'h000;
            endcase
          end
          6'h2f: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0cf;
              4'h1: out_low = 9'h0ce;
              4'h2: out_low = 9'h0cd;
              4'h3: out_low = 9'h0cd;
              4'h4: out_low = 9'h0cc;
              4'h5: out_low = 9'h0cb;
              4'h6: out_low = 9'h0ca;
              4'h7: out_low = 9'h0c9;
              4'h8: out_low = 9'h0c8;
              4'h9: out_low = 9'h0c8;
              4'ha: out_low = 9'h0c7;
              4'hb: out_low = 9'h0c6;
              4'hc: out_low = 9'h0c5;
              4'hd: out_low = 9'h0c4;
              4'he: out_low = 9'h0c3;
              4'hf: out_low = 9'h0c3;
              default: out_low = 9'h000;
            endcase
          end
          6'h30: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0c2;
              4'h1: out_low = 9'h0c1;
              4'h2: out_low = 9'h0c0;
              4'h3: out_low = 9'h0bf;
              4'h4: out_low = 9'h0be;
              4'h5: out_low = 9'h0be;
              4'h6: out_low = 9'h0bd;
              4'h7: out_low = 9'h0bc;
              4'h8: out_low = 9'h0bb;
              4'h9: out_low = 9'h0ba;
              4'ha: out_low = 9'h0ba;
              4'hb: out_low = 9'h0b9;
              4'hc: out_low = 9'h0b8;
              4'hd: out_low = 9'h0b7;
              4'he: out_low = 9'h0b6;
              4'hf: out_low = 9'h0b5;
              default: out_low = 9'h000;
            endcase
          end
          6'h31: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0b5;
              4'h1: out_low = 9'h0b4;
              4'h2: out_low = 9'h0b3;
              4'h3: out_low = 9'h0b2;
              4'h4: out_low = 9'h0b1;
              4'h5: out_low = 9'h0b1;
              4'h6: out_low = 9'h0b0;
              4'h7: out_low = 9'h0af;
              4'h8: out_low = 9'h0ae;
              4'h9: out_low = 9'h0ad;
              4'ha: out_low = 9'h0ad;
              4'hb: out_low = 9'h0ac;
              4'hc: out_low = 9'h0ab;
              4'hd: out_low = 9'h0aa;
              4'he: out_low = 9'h0a9;
              4'hf: out_low = 9'h0a8;
              default: out_low = 9'h000;
            endcase
          end
          6'h32: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0a8;
              4'h1: out_low = 9'h0a7;
              4'h2: out_low = 9'h0a6;
              4'h3: out_low = 9'h0a5;
              4'h4: out_low = 9'h0a4;
              4'h5: out_low = 9'h0a4;
              4'h6: out_low = 9'h0a3;
              4'h7: out_low = 9'h0a2;
              4'h8: out_low = 9'h0a1;
              4'h9: out_low = 9'h0a0;
              4'ha: out_low = 9'h0a0;
              4'hb: out_low = 9'h09f;
              4'hc: out_low = 9'h09e;
              4'hd: out_low = 9'h09d;
              4'he: out_low = 9'h09c;
              4'hf: out_low = 9'h09c;
              default: out_low = 9'h000;
            endcase
          end
          6'h33: begin
            case (mant[3:0])
              4'h0: out_low = 9'h09b;
              4'h1: out_low = 9'h09a;
              4'h2: out_low = 9'h099;
              4'h3: out_low = 9'h098;
              4'h4: out_low = 9'h098;
              4'h5: out_low = 9'h097;
              4'h6: out_low = 9'h096;
              4'h7: out_low = 9'h095;
              4'h8: out_low = 9'h094;
              4'h9: out_low = 9'h094;
              4'ha: out_low = 9'h093;
              4'hb: out_low = 9'h092;
              4'hc: out_low = 9'h091;
              4'hd: out_low = 9'h090;
              4'he: out_low = 9'h090;
              4'hf: out_low = 9'h08f;
              default: out_low = 9'h000;
            endcase
          end
          6'h34: begin
            case (mant[3:0])
              4'h0: out_low = 9'h08e;
              4'h1: out_low = 9'h08d;
              4'h2: out_low = 9'h08d;
              4'h3: out_low = 9'h08c;
              4'h4: out_low = 9'h08b;
              4'h5: out_low = 9'h08a;
              4'h6: out_low = 9'h089;
              4'h7: out_low = 9'h089;
              4'h8: out_low = 9'h088;
              4'h9: out_low = 9'h087;
              4'ha: out_low = 9'h086;
              4'hb: out_low = 9'h085;
              4'hc: out_low = 9'h085;
              4'hd: out_low = 9'h084;
              4'he: out_low = 9'h083;
              4'hf: out_low = 9'h082;
              default: out_low = 9'h000;
            endcase
          end
          6'h35: begin
            case (mant[3:0])
              4'h0: out_low = 9'h082;
              4'h1: out_low = 9'h081;
              4'h2: out_low = 9'h080;
              4'h3: out_low = 9'h07f;
              4'h4: out_low = 9'h07e;
              4'h5: out_low = 9'h07e;
              4'h6: out_low = 9'h07d;
              4'h7: out_low = 9'h07c;
              4'h8: out_low = 9'h07b;
              4'h9: out_low = 9'h07b;
              4'ha: out_low = 9'h07a;
              4'hb: out_low = 9'h079;
              4'hc: out_low = 9'h078;
              4'hd: out_low = 9'h077;
              4'he: out_low = 9'h077;
              4'hf: out_low = 9'h076;
              default: out_low = 9'h000;
            endcase
          end
          6'h36: begin
            case (mant[3:0])
              4'h0: out_low = 9'h075;
              4'h1: out_low = 9'h074;
              4'h2: out_low = 9'h074;
              4'h3: out_low = 9'h073;
              4'h4: out_low = 9'h072;
              4'h5: out_low = 9'h071;
              4'h6: out_low = 9'h071;
              4'h7: out_low = 9'h070;
              4'h8: out_low = 9'h06f;
              4'h9: out_low = 9'h06e;
              4'ha: out_low = 9'h06d;
              4'hb: out_low = 9'h06d;
              4'hc: out_low = 9'h06c;
              4'hd: out_low = 9'h06b;
              4'he: out_low = 9'h06a;
              4'hf: out_low = 9'h06a;
              default: out_low = 9'h000;
            endcase
          end
          6'h37: begin
            case (mant[3:0])
              4'h0: out_low = 9'h069;
              4'h1: out_low = 9'h068;
              4'h2: out_low = 9'h067;
              4'h3: out_low = 9'h067;
              4'h4: out_low = 9'h066;
              4'h5: out_low = 9'h065;
              4'h6: out_low = 9'h064;
              4'h7: out_low = 9'h064;
              4'h8: out_low = 9'h063;
              4'h9: out_low = 9'h062;
              4'ha: out_low = 9'h061;
              4'hb: out_low = 9'h060;
              4'hc: out_low = 9'h060;
              4'hd: out_low = 9'h05f;
              4'he: out_low = 9'h05e;
              4'hf: out_low = 9'h05d;
              default: out_low = 9'h000;
            endcase
          end
          6'h38: begin
            case (mant[3:0])
              4'h0: out_low = 9'h05d;
              4'h1: out_low = 9'h05c;
              4'h2: out_low = 9'h05b;
              4'h3: out_low = 9'h05a;
              4'h4: out_low = 9'h05a;
              4'h5: out_low = 9'h059;
              4'h6: out_low = 9'h058;
              4'h7: out_low = 9'h057;
              4'h8: out_low = 9'h057;
              4'h9: out_low = 9'h056;
              4'ha: out_low = 9'h055;
              4'hb: out_low = 9'h054;
              4'hc: out_low = 9'h054;
              4'hd: out_low = 9'h053;
              4'he: out_low = 9'h052;
              4'hf: out_low = 9'h051;
              default: out_low = 9'h000;
            endcase
          end
          6'h39: begin
            case (mant[3:0])
              4'h0: out_low = 9'h051;
              4'h1: out_low = 9'h050;
              4'h2: out_low = 9'h04f;
              4'h3: out_low = 9'h04e;
              4'h4: out_low = 9'h04e;
              4'h5: out_low = 9'h04d;
              4'h6: out_low = 9'h04c;
              4'h7: out_low = 9'h04b;
              4'h8: out_low = 9'h04b;
              4'h9: out_low = 9'h04a;
              4'ha: out_low = 9'h049;
              4'hb: out_low = 9'h048;
              4'hc: out_low = 9'h048;
              4'hd: out_low = 9'h047;
              4'he: out_low = 9'h046;
              4'hf: out_low = 9'h045;
              default: out_low = 9'h000;
            endcase
          end
          6'h3a: begin
            case (mant[3:0])
              4'h0: out_low = 9'h045;
              4'h1: out_low = 9'h044;
              4'h2: out_low = 9'h043;
              4'h3: out_low = 9'h043;
              4'h4: out_low = 9'h042;
              4'h5: out_low = 9'h041;
              4'h6: out_low = 9'h040;
              4'h7: out_low = 9'h040;
              4'h8: out_low = 9'h03f;
              4'h9: out_low = 9'h03e;
              4'ha: out_low = 9'h03d;
              4'hb: out_low = 9'h03d;
              4'hc: out_low = 9'h03c;
              4'hd: out_low = 9'h03b;
              4'he: out_low = 9'h03a;
              4'hf: out_low = 9'h03a;
              default: out_low = 9'h000;
            endcase
          end
          6'h3b: begin
            case (mant[3:0])
              4'h0: out_low = 9'h039;
              4'h1: out_low = 9'h038;
              4'h2: out_low = 9'h038;
              4'h3: out_low = 9'h037;
              4'h4: out_low = 9'h036;
              4'h5: out_low = 9'h035;
              4'h6: out_low = 9'h035;
              4'h7: out_low = 9'h034;
              4'h8: out_low = 9'h033;
              4'h9: out_low = 9'h032;
              4'ha: out_low = 9'h032;
              4'hb: out_low = 9'h031;
              4'hc: out_low = 9'h030;
              4'hd: out_low = 9'h030;
              4'he: out_low = 9'h02f;
              4'hf: out_low = 9'h02e;
              default: out_low = 9'h000;
            endcase
          end
          6'h3c: begin
            case (mant[3:0])
              4'h0: out_low = 9'h02d;
              4'h1: out_low = 9'h02d;
              4'h2: out_low = 9'h02c;
              4'h3: out_low = 9'h02b;
              4'h4: out_low = 9'h02a;
              4'h5: out_low = 9'h02a;
              4'h6: out_low = 9'h029;
              4'h7: out_low = 9'h028;
              4'h8: out_low = 9'h028;
              4'h9: out_low = 9'h027;
              4'ha: out_low = 9'h026;
              4'hb: out_low = 9'h025;
              4'hc: out_low = 9'h025;
              4'hd: out_low = 9'h024;
              4'he: out_low = 9'h023;
              4'hf: out_low = 9'h023;
              default: out_low = 9'h000;
            endcase
          end
          6'h3d: begin
            case (mant[3:0])
              4'h0: out_low = 9'h022;
              4'h1: out_low = 9'h021;
              4'h2: out_low = 9'h020;
              4'h3: out_low = 9'h020;
              4'h4: out_low = 9'h01f;
              4'h5: out_low = 9'h01e;
              4'h6: out_low = 9'h01e;
              4'h7: out_low = 9'h01d;
              4'h8: out_low = 9'h01c;
              4'h9: out_low = 9'h01b;
              4'ha: out_low = 9'h01b;
              4'hb: out_low = 9'h01a;
              4'hc: out_low = 9'h019;
              4'hd: out_low = 9'h019;
              4'he: out_low = 9'h018;
              4'hf: out_low = 9'h017;
              default: out_low = 9'h000;
            endcase
          end
          6'h3e: begin
            case (mant[3:0])
              4'h0: out_low = 9'h016;
              4'h1: out_low = 9'h016;
              4'h2: out_low = 9'h015;
              4'h3: out_low = 9'h014;
              4'h4: out_low = 9'h014;
              4'h5: out_low = 9'h013;
              4'h6: out_low = 9'h012;
              4'h7: out_low = 9'h011;
              4'h8: out_low = 9'h011;
              4'h9: out_low = 9'h010;
              4'ha: out_low = 9'h00f;
              4'hb: out_low = 9'h00f;
              4'hc: out_low = 9'h00e;
              4'hd: out_low = 9'h00d;
              4'he: out_low = 9'h00d;
              4'hf: out_low = 9'h00c;
              default: out_low = 9'h000;
            endcase
          end
          6'h3f: begin
            case (mant[3:0])
              4'h0: out_low = 9'h00b;
              4'h1: out_low = 9'h00a;
              4'h2: out_low = 9'h00a;
              4'h3: out_low = 9'h009;
              4'h4: out_low = 9'h008;
              4'h5: out_low = 9'h008;
              4'h6: out_low = 9'h007;
              4'h7: out_low = 9'h006;
              4'h8: out_low = 9'h006;
              4'h9: out_low = 9'h005;
              4'ha: out_low = 9'h004;
              4'hb: out_low = 9'h003;
              4'hc: out_low = 9'h003;
              4'hd: out_low = 9'h002;
              4'he: out_low = 9'h001;
              4'hf: out_low = 9'h001;
              default: out_low = 9'h000;
            endcase
          end
          default: out_low = 9'h000;
        endcase
      end
      6'h30: begin
        case (mant[9:4])
          6'h00: begin
            case (mant[3:0])
              4'h0: out_low = 9'h000;
              4'h1: out_low = 9'h1fd;
              4'h2: out_low = 9'h1fa;
              4'h3: out_low = 9'h1f8;
              4'h4: out_low = 9'h1f5;
              4'h5: out_low = 9'h1f2;
              4'h6: out_low = 9'h1ef;
              4'h7: out_low = 9'h1ed;
              4'h8: out_low = 9'h1ea;
              4'h9: out_low = 9'h1e7;
              4'ha: out_low = 9'h1e4;
              4'hb: out_low = 9'h1e2;
              4'hc: out_low = 9'h1df;
              4'hd: out_low = 9'h1dc;
              4'he: out_low = 9'h1da;
              4'hf: out_low = 9'h1d7;
              default: out_low = 9'h000;
            endcase
          end
          6'h01: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1d4;
              4'h1: out_low = 9'h1d1;
              4'h2: out_low = 9'h1cf;
              4'h3: out_low = 9'h1cc;
              4'h4: out_low = 9'h1c9;
              4'h5: out_low = 9'h1c7;
              4'h6: out_low = 9'h1c4;
              4'h7: out_low = 9'h1c1;
              4'h8: out_low = 9'h1bf;
              4'h9: out_low = 9'h1bc;
              4'ha: out_low = 9'h1b9;
              4'hb: out_low = 9'h1b6;
              4'hc: out_low = 9'h1b4;
              4'hd: out_low = 9'h1b1;
              4'he: out_low = 9'h1ae;
              4'hf: out_low = 9'h1ac;
              default: out_low = 9'h000;
            endcase
          end
          6'h02: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1a9;
              4'h1: out_low = 9'h1a7;
              4'h2: out_low = 9'h1a4;
              4'h3: out_low = 9'h1a1;
              4'h4: out_low = 9'h19f;
              4'h5: out_low = 9'h19c;
              4'h6: out_low = 9'h199;
              4'h7: out_low = 9'h197;
              4'h8: out_low = 9'h194;
              4'h9: out_low = 9'h191;
              4'ha: out_low = 9'h18f;
              4'hb: out_low = 9'h18c;
              4'hc: out_low = 9'h18a;
              4'hd: out_low = 9'h187;
              4'he: out_low = 9'h184;
              4'hf: out_low = 9'h182;
              default: out_low = 9'h000;
            endcase
          end
          6'h03: begin
            case (mant[3:0])
              4'h0: out_low = 9'h17f;
              4'h1: out_low = 9'h17d;
              4'h2: out_low = 9'h17a;
              4'h3: out_low = 9'h177;
              4'h4: out_low = 9'h175;
              4'h5: out_low = 9'h172;
              4'h6: out_low = 9'h170;
              4'h7: out_low = 9'h16d;
              4'h8: out_low = 9'h16a;
              4'h9: out_low = 9'h168;
              4'ha: out_low = 9'h165;
              4'hb: out_low = 9'h163;
              4'hc: out_low = 9'h160;
              4'hd: out_low = 9'h15e;
              4'he: out_low = 9'h15b;
              4'hf: out_low = 9'h159;
              default: out_low = 9'h000;
            endcase
          end
          6'h04: begin
            case (mant[3:0])
              4'h0: out_low = 9'h156;
              4'h1: out_low = 9'h153;
              4'h2: out_low = 9'h151;
              4'h3: out_low = 9'h14e;
              4'h4: out_low = 9'h14c;
              4'h5: out_low = 9'h149;
              4'h6: out_low = 9'h147;
              4'h7: out_low = 9'h144;
              4'h8: out_low = 9'h142;
              4'h9: out_low = 9'h13f;
              4'ha: out_low = 9'h13d;
              4'hb: out_low = 9'h13a;
              4'hc: out_low = 9'h138;
              4'hd: out_low = 9'h135;
              4'he: out_low = 9'h133;
              4'hf: out_low = 9'h130;
              default: out_low = 9'h000;
            endcase
          end
          6'h05: begin
            case (mant[3:0])
              4'h0: out_low = 9'h12e;
              4'h1: out_low = 9'h12b;
              4'h2: out_low = 9'h129;
              4'h3: out_low = 9'h126;
              4'h4: out_low = 9'h124;
              4'h5: out_low = 9'h121;
              4'h6: out_low = 9'h11f;
              4'h7: out_low = 9'h11c;
              4'h8: out_low = 9'h11a;
              4'h9: out_low = 9'h118;
              4'ha: out_low = 9'h115;
              4'hb: out_low = 9'h113;
              4'hc: out_low = 9'h110;
              4'hd: out_low = 9'h10e;
              4'he: out_low = 9'h10b;
              4'hf: out_low = 9'h109;
              default: out_low = 9'h000;
            endcase
          end
          6'h06: begin
            case (mant[3:0])
              4'h0: out_low = 9'h106;
              4'h1: out_low = 9'h104;
              4'h2: out_low = 9'h102;
              4'h3: out_low = 9'h0ff;
              4'h4: out_low = 9'h0fd;
              4'h5: out_low = 9'h0fa;
              4'h6: out_low = 9'h0f8;
              4'h7: out_low = 9'h0f5;
              4'h8: out_low = 9'h0f3;
              4'h9: out_low = 9'h0f1;
              4'ha: out_low = 9'h0ee;
              4'hb: out_low = 9'h0ec;
              4'hc: out_low = 9'h0e9;
              4'hd: out_low = 9'h0e7;
              4'he: out_low = 9'h0e5;
              4'hf: out_low = 9'h0e2;
              default: out_low = 9'h000;
            endcase
          end
          6'h07: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0e0;
              4'h1: out_low = 9'h0dd;
              4'h2: out_low = 9'h0db;
              4'h3: out_low = 9'h0d9;
              4'h4: out_low = 9'h0d6;
              4'h5: out_low = 9'h0d4;
              4'h6: out_low = 9'h0d2;
              4'h7: out_low = 9'h0cf;
              4'h8: out_low = 9'h0cd;
              4'h9: out_low = 9'h0cb;
              4'ha: out_low = 9'h0c8;
              4'hb: out_low = 9'h0c6;
              4'hc: out_low = 9'h0c4;
              4'hd: out_low = 9'h0c1;
              4'he: out_low = 9'h0bf;
              4'hf: out_low = 9'h0bc;
              default: out_low = 9'h000;
            endcase
          end
          6'h08: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0ba;
              4'h1: out_low = 9'h0b8;
              4'h2: out_low = 9'h0b5;
              4'h3: out_low = 9'h0b3;
              4'h4: out_low = 9'h0b1;
              4'h5: out_low = 9'h0af;
              4'h6: out_low = 9'h0ac;
              4'h7: out_low = 9'h0aa;
              4'h8: out_low = 9'h0a8;
              4'h9: out_low = 9'h0a5;
              4'ha: out_low = 9'h0a3;
              4'hb: out_low = 9'h0a1;
              4'hc: out_low = 9'h09e;
              4'hd: out_low = 9'h09c;
              4'he: out_low = 9'h09a;
              4'hf: out_low = 9'h098;
              default: out_low = 9'h000;
            endcase
          end
          6'h09: begin
            case (mant[3:0])
              4'h0: out_low = 9'h095;
              4'h1: out_low = 9'h093;
              4'h2: out_low = 9'h091;
              4'h3: out_low = 9'h08e;
              4'h4: out_low = 9'h08c;
              4'h5: out_low = 9'h08a;
              4'h6: out_low = 9'h088;
              4'h7: out_low = 9'h085;
              4'h8: out_low = 9'h083;
              4'h9: out_low = 9'h081;
              4'ha: out_low = 9'h07f;
              4'hb: out_low = 9'h07c;
              4'hc: out_low = 9'h07a;
              4'hd: out_low = 9'h078;
              4'he: out_low = 9'h076;
              4'hf: out_low = 9'h073;
              default: out_low = 9'h000;
            endcase
          end
          6'h0a: begin
            case (mant[3:0])
              4'h0: out_low = 9'h071;
              4'h1: out_low = 9'h06f;
              4'h2: out_low = 9'h06d;
              4'h3: out_low = 9'h06a;
              4'h4: out_low = 9'h068;
              4'h5: out_low = 9'h066;
              4'h6: out_low = 9'h064;
              4'h7: out_low = 9'h062;
              4'h8: out_low = 9'h05f;
              4'h9: out_low = 9'h05d;
              4'ha: out_low = 9'h05b;
              4'hb: out_low = 9'h059;
              4'hc: out_low = 9'h057;
              4'hd: out_low = 9'h054;
              4'he: out_low = 9'h052;
              4'hf: out_low = 9'h050;
              default: out_low = 9'h000;
            endcase
          end
          6'h0b: begin
            case (mant[3:0])
              4'h0: out_low = 9'h04e;
              4'h1: out_low = 9'h04c;
              4'h2: out_low = 9'h049;
              4'h3: out_low = 9'h047;
              4'h4: out_low = 9'h045;
              4'h5: out_low = 9'h043;
              4'h6: out_low = 9'h041;
              4'h7: out_low = 9'h03f;
              4'h8: out_low = 9'h03c;
              4'h9: out_low = 9'h03a;
              4'ha: out_low = 9'h038;
              4'hb: out_low = 9'h036;
              4'hc: out_low = 9'h034;
              4'hd: out_low = 9'h032;
              4'he: out_low = 9'h030;
              4'hf: out_low = 9'h02d;
              default: out_low = 9'h000;
            endcase
          end
          6'h0c: begin
            case (mant[3:0])
              4'h0: out_low = 9'h02b;
              4'h1: out_low = 9'h029;
              4'h2: out_low = 9'h027;
              4'h3: out_low = 9'h025;
              4'h4: out_low = 9'h023;
              4'h5: out_low = 9'h021;
              4'h6: out_low = 9'h01e;
              4'h7: out_low = 9'h01c;
              4'h8: out_low = 9'h01a;
              4'h9: out_low = 9'h018;
              4'ha: out_low = 9'h016;
              4'hb: out_low = 9'h014;
              4'hc: out_low = 9'h012;
              4'hd: out_low = 9'h010;
              4'he: out_low = 9'h00e;
              4'hf: out_low = 9'h00b;
              default: out_low = 9'h000;
            endcase
          end
          6'h0d: begin
            case (mant[3:0])
              4'h0: out_low = 9'h009;
              4'h1: out_low = 9'h007;
              4'h2: out_low = 9'h005;
              4'h3: out_low = 9'h003;
              4'h4: out_low = 9'h001;
              4'h5: out_low = 9'h1ff;
              4'h6: out_low = 9'h1fd;
              4'h7: out_low = 9'h1fb;
              4'h8: out_low = 9'h1f9;
              4'h9: out_low = 9'h1f7;
              4'ha: out_low = 9'h1f5;
              4'hb: out_low = 9'h1f3;
              4'hc: out_low = 9'h1f0;
              4'hd: out_low = 9'h1ee;
              4'he: out_low = 9'h1ec;
              4'hf: out_low = 9'h1ea;
              default: out_low = 9'h000;
            endcase
          end
          6'h0e: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1e8;
              4'h1: out_low = 9'h1e6;
              4'h2: out_low = 9'h1e4;
              4'h3: out_low = 9'h1e2;
              4'h4: out_low = 9'h1e0;
              4'h5: out_low = 9'h1de;
              4'h6: out_low = 9'h1dc;
              4'h7: out_low = 9'h1da;
              4'h8: out_low = 9'h1d8;
              4'h9: out_low = 9'h1d6;
              4'ha: out_low = 9'h1d4;
              4'hb: out_low = 9'h1d2;
              4'hc: out_low = 9'h1d0;
              4'hd: out_low = 9'h1ce;
              4'he: out_low = 9'h1cc;
              4'hf: out_low = 9'h1ca;
              default: out_low = 9'h000;
            endcase
          end
          6'h0f: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1c8;
              4'h1: out_low = 9'h1c6;
              4'h2: out_low = 9'h1c4;
              4'h3: out_low = 9'h1c2;
              4'h4: out_low = 9'h1c0;
              4'h5: out_low = 9'h1be;
              4'h6: out_low = 9'h1bc;
              4'h7: out_low = 9'h1ba;
              4'h8: out_low = 9'h1b8;
              4'h9: out_low = 9'h1b6;
              4'ha: out_low = 9'h1b4;
              4'hb: out_low = 9'h1b2;
              4'hc: out_low = 9'h1b0;
              4'hd: out_low = 9'h1ae;
              4'he: out_low = 9'h1ac;
              4'hf: out_low = 9'h1aa;
              default: out_low = 9'h000;
            endcase
          end
          6'h10: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1a8;
              4'h1: out_low = 9'h1a6;
              4'h2: out_low = 9'h1a4;
              4'h3: out_low = 9'h1a2;
              4'h4: out_low = 9'h1a0;
              4'h5: out_low = 9'h19e;
              4'h6: out_low = 9'h19c;
              4'h7: out_low = 9'h19a;
              4'h8: out_low = 9'h199;
              4'h9: out_low = 9'h197;
              4'ha: out_low = 9'h195;
              4'hb: out_low = 9'h193;
              4'hc: out_low = 9'h191;
              4'hd: out_low = 9'h18f;
              4'he: out_low = 9'h18d;
              4'hf: out_low = 9'h18b;
              default: out_low = 9'h000;
            endcase
          end
          6'h11: begin
            case (mant[3:0])
              4'h0: out_low = 9'h189;
              4'h1: out_low = 9'h187;
              4'h2: out_low = 9'h185;
              4'h3: out_low = 9'h183;
              4'h4: out_low = 9'h181;
              4'h5: out_low = 9'h180;
              4'h6: out_low = 9'h17e;
              4'h7: out_low = 9'h17c;
              4'h8: out_low = 9'h17a;
              4'h9: out_low = 9'h178;
              4'ha: out_low = 9'h176;
              4'hb: out_low = 9'h174;
              4'hc: out_low = 9'h172;
              4'hd: out_low = 9'h170;
              4'he: out_low = 9'h16f;
              4'hf: out_low = 9'h16d;
              default: out_low = 9'h000;
            endcase
          end
          6'h12: begin
            case (mant[3:0])
              4'h0: out_low = 9'h16b;
              4'h1: out_low = 9'h169;
              4'h2: out_low = 9'h167;
              4'h3: out_low = 9'h165;
              4'h4: out_low = 9'h163;
              4'h5: out_low = 9'h161;
              4'h6: out_low = 9'h160;
              4'h7: out_low = 9'h15e;
              4'h8: out_low = 9'h15c;
              4'h9: out_low = 9'h15a;
              4'ha: out_low = 9'h158;
              4'hb: out_low = 9'h156;
              4'hc: out_low = 9'h154;
              4'hd: out_low = 9'h153;
              4'he: out_low = 9'h151;
              4'hf: out_low = 9'h14f;
              default: out_low = 9'h000;
            endcase
          end
          6'h13: begin
            case (mant[3:0])
              4'h0: out_low = 9'h14d;
              4'h1: out_low = 9'h14b;
              4'h2: out_low = 9'h149;
              4'h3: out_low = 9'h148;
              4'h4: out_low = 9'h146;
              4'h5: out_low = 9'h144;
              4'h6: out_low = 9'h142;
              4'h7: out_low = 9'h140;
              4'h8: out_low = 9'h13e;
              4'h9: out_low = 9'h13d;
              4'ha: out_low = 9'h13b;
              4'hb: out_low = 9'h139;
              4'hc: out_low = 9'h137;
              4'hd: out_low = 9'h135;
              4'he: out_low = 9'h134;
              4'hf: out_low = 9'h132;
              default: out_low = 9'h000;
            endcase
          end
          6'h14: begin
            case (mant[3:0])
              4'h0: out_low = 9'h130;
              4'h1: out_low = 9'h12e;
              4'h2: out_low = 9'h12c;
              4'h3: out_low = 9'h12b;
              4'h4: out_low = 9'h129;
              4'h5: out_low = 9'h127;
              4'h6: out_low = 9'h125;
              4'h7: out_low = 9'h123;
              4'h8: out_low = 9'h122;
              4'h9: out_low = 9'h120;
              4'ha: out_low = 9'h11e;
              4'hb: out_low = 9'h11c;
              4'hc: out_low = 9'h11b;
              4'hd: out_low = 9'h119;
              4'he: out_low = 9'h117;
              4'hf: out_low = 9'h115;
              default: out_low = 9'h000;
            endcase
          end
          6'h15: begin
            case (mant[3:0])
              4'h0: out_low = 9'h114;
              4'h1: out_low = 9'h112;
              4'h2: out_low = 9'h110;
              4'h3: out_low = 9'h10e;
              4'h4: out_low = 9'h10c;
              4'h5: out_low = 9'h10b;
              4'h6: out_low = 9'h109;
              4'h7: out_low = 9'h107;
              4'h8: out_low = 9'h106;
              4'h9: out_low = 9'h104;
              4'ha: out_low = 9'h102;
              4'hb: out_low = 9'h100;
              4'hc: out_low = 9'h0ff;
              4'hd: out_low = 9'h0fd;
              4'he: out_low = 9'h0fb;
              4'hf: out_low = 9'h0f9;
              default: out_low = 9'h000;
            endcase
          end
          6'h16: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0f8;
              4'h1: out_low = 9'h0f6;
              4'h2: out_low = 9'h0f4;
              4'h3: out_low = 9'h0f3;
              4'h4: out_low = 9'h0f1;
              4'h5: out_low = 9'h0ef;
              4'h6: out_low = 9'h0ed;
              4'h7: out_low = 9'h0ec;
              4'h8: out_low = 9'h0ea;
              4'h9: out_low = 9'h0e8;
              4'ha: out_low = 9'h0e7;
              4'hb: out_low = 9'h0e5;
              4'hc: out_low = 9'h0e3;
              4'hd: out_low = 9'h0e1;
              4'he: out_low = 9'h0e0;
              4'hf: out_low = 9'h0de;
              default: out_low = 9'h000;
            endcase
          end
          6'h17: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0dc;
              4'h1: out_low = 9'h0db;
              4'h2: out_low = 9'h0d9;
              4'h3: out_low = 9'h0d7;
              4'h4: out_low = 9'h0d6;
              4'h5: out_low = 9'h0d4;
              4'h6: out_low = 9'h0d2;
              4'h7: out_low = 9'h0d1;
              4'h8: out_low = 9'h0cf;
              4'h9: out_low = 9'h0cd;
              4'ha: out_low = 9'h0cc;
              4'hb: out_low = 9'h0ca;
              4'hc: out_low = 9'h0c8;
              4'hd: out_low = 9'h0c7;
              4'he: out_low = 9'h0c5;
              4'hf: out_low = 9'h0c3;
              default: out_low = 9'h000;
            endcase
          end
          6'h18: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0c2;
              4'h1: out_low = 9'h0c0;
              4'h2: out_low = 9'h0be;
              4'h3: out_low = 9'h0bd;
              4'h4: out_low = 9'h0bb;
              4'h5: out_low = 9'h0ba;
              4'h6: out_low = 9'h0b8;
              4'h7: out_low = 9'h0b6;
              4'h8: out_low = 9'h0b5;
              4'h9: out_low = 9'h0b3;
              4'ha: out_low = 9'h0b1;
              4'hb: out_low = 9'h0b0;
              4'hc: out_low = 9'h0ae;
              4'hd: out_low = 9'h0ad;
              4'he: out_low = 9'h0ab;
              4'hf: out_low = 9'h0a9;
              default: out_low = 9'h000;
            endcase
          end
          6'h19: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0a8;
              4'h1: out_low = 9'h0a6;
              4'h2: out_low = 9'h0a4;
              4'h3: out_low = 9'h0a3;
              4'h4: out_low = 9'h0a1;
              4'h5: out_low = 9'h0a0;
              4'h6: out_low = 9'h09e;
              4'h7: out_low = 9'h09c;
              4'h8: out_low = 9'h09b;
              4'h9: out_low = 9'h099;
              4'ha: out_low = 9'h098;
              4'hb: out_low = 9'h096;
              4'hc: out_low = 9'h094;
              4'hd: out_low = 9'h093;
              4'he: out_low = 9'h091;
              4'hf: out_low = 9'h090;
              default: out_low = 9'h000;
            endcase
          end
          6'h1a: begin
            case (mant[3:0])
              4'h0: out_low = 9'h08e;
              4'h1: out_low = 9'h08d;
              4'h2: out_low = 9'h08b;
              4'h3: out_low = 9'h089;
              4'h4: out_low = 9'h088;
              4'h5: out_low = 9'h086;
              4'h6: out_low = 9'h085;
              4'h7: out_low = 9'h083;
              4'h8: out_low = 9'h082;
              4'h9: out_low = 9'h080;
              4'ha: out_low = 9'h07e;
              4'hb: out_low = 9'h07d;
              4'hc: out_low = 9'h07b;
              4'hd: out_low = 9'h07a;
              4'he: out_low = 9'h078;
              4'hf: out_low = 9'h077;
              default: out_low = 9'h000;
            endcase
          end
          6'h1b: begin
            case (mant[3:0])
              4'h0: out_low = 9'h075;
              4'h1: out_low = 9'h074;
              4'h2: out_low = 9'h072;
              4'h3: out_low = 9'h071;
              4'h4: out_low = 9'h06f;
              4'h5: out_low = 9'h06d;
              4'h6: out_low = 9'h06c;
              4'h7: out_low = 9'h06a;
              4'h8: out_low = 9'h069;
              4'h9: out_low = 9'h067;
              4'ha: out_low = 9'h066;
              4'hb: out_low = 9'h064;
              4'hc: out_low = 9'h063;
              4'hd: out_low = 9'h061;
              4'he: out_low = 9'h060;
              4'hf: out_low = 9'h05e;
              default: out_low = 9'h000;
            endcase
          end
          6'h1c: begin
            case (mant[3:0])
              4'h0: out_low = 9'h05d;
              4'h1: out_low = 9'h05b;
              4'h2: out_low = 9'h05a;
              4'h3: out_low = 9'h058;
              4'h4: out_low = 9'h057;
              4'h5: out_low = 9'h055;
              4'h6: out_low = 9'h054;
              4'h7: out_low = 9'h052;
              4'h8: out_low = 9'h051;
              4'h9: out_low = 9'h04f;
              4'ha: out_low = 9'h04e;
              4'hb: out_low = 9'h04c;
              4'hc: out_low = 9'h04b;
              4'hd: out_low = 9'h049;
              4'he: out_low = 9'h048;
              4'hf: out_low = 9'h046;
              default: out_low = 9'h000;
            endcase
          end
          6'h1d: begin
            case (mant[3:0])
              4'h0: out_low = 9'h045;
              4'h1: out_low = 9'h043;
              4'h2: out_low = 9'h042;
              4'h3: out_low = 9'h040;
              4'h4: out_low = 9'h03f;
              4'h5: out_low = 9'h03d;
              4'h6: out_low = 9'h03c;
              4'h7: out_low = 9'h03a;
              4'h8: out_low = 9'h039;
              4'h9: out_low = 9'h038;
              4'ha: out_low = 9'h036;
              4'hb: out_low = 9'h035;
              4'hc: out_low = 9'h033;
              4'hd: out_low = 9'h032;
              4'he: out_low = 9'h030;
              4'hf: out_low = 9'h02f;
              default: out_low = 9'h000;
            endcase
          end
          6'h1e: begin
            case (mant[3:0])
              4'h0: out_low = 9'h02d;
              4'h1: out_low = 9'h02c;
              4'h2: out_low = 9'h02a;
              4'h3: out_low = 9'h029;
              4'h4: out_low = 9'h028;
              4'h5: out_low = 9'h026;
              4'h6: out_low = 9'h025;
              4'h7: out_low = 9'h023;
              4'h8: out_low = 9'h022;
              4'h9: out_low = 9'h020;
              4'ha: out_low = 9'h01f;
              4'hb: out_low = 9'h01e;
              4'hc: out_low = 9'h01c;
              4'hd: out_low = 9'h01b;
              4'he: out_low = 9'h019;
              4'hf: out_low = 9'h018;
              default: out_low = 9'h000;
            endcase
          end
          6'h1f: begin
            case (mant[3:0])
              4'h0: out_low = 9'h016;
              4'h1: out_low = 9'h015;
              4'h2: out_low = 9'h014;
              4'h3: out_low = 9'h012;
              4'h4: out_low = 9'h011;
              4'h5: out_low = 9'h00f;
              4'h6: out_low = 9'h00e;
              4'h7: out_low = 9'h00d;
              4'h8: out_low = 9'h00b;
              4'h9: out_low = 9'h00a;
              4'ha: out_low = 9'h008;
              4'hb: out_low = 9'h007;
              4'hc: out_low = 9'h006;
              4'hd: out_low = 9'h004;
              4'he: out_low = 9'h003;
              4'hf: out_low = 9'h001;
              default: out_low = 9'h000;
            endcase
          end
          6'h20: begin
            case (mant[3:0])
              4'h0: out_low = 9'h000;
              4'h1: out_low = 9'h1fd;
              4'h2: out_low = 9'h1fa;
              4'h3: out_low = 9'h1f8;
              4'h4: out_low = 9'h1f5;
              4'h5: out_low = 9'h1f2;
              4'h6: out_low = 9'h1ef;
              4'h7: out_low = 9'h1ed;
              4'h8: out_low = 9'h1ea;
              4'h9: out_low = 9'h1e7;
              4'ha: out_low = 9'h1e4;
              4'hb: out_low = 9'h1e2;
              4'hc: out_low = 9'h1df;
              4'hd: out_low = 9'h1dc;
              4'he: out_low = 9'h1da;
              4'hf: out_low = 9'h1d7;
              default: out_low = 9'h000;
            endcase
          end
          6'h21: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1d4;
              4'h1: out_low = 9'h1d1;
              4'h2: out_low = 9'h1cf;
              4'h3: out_low = 9'h1cc;
              4'h4: out_low = 9'h1c9;
              4'h5: out_low = 9'h1c7;
              4'h6: out_low = 9'h1c4;
              4'h7: out_low = 9'h1c1;
              4'h8: out_low = 9'h1bf;
              4'h9: out_low = 9'h1bc;
              4'ha: out_low = 9'h1b9;
              4'hb: out_low = 9'h1b6;
              4'hc: out_low = 9'h1b4;
              4'hd: out_low = 9'h1b1;
              4'he: out_low = 9'h1ae;
              4'hf: out_low = 9'h1ac;
              default: out_low = 9'h000;
            endcase
          end
          6'h22: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1a9;
              4'h1: out_low = 9'h1a7;
              4'h2: out_low = 9'h1a4;
              4'h3: out_low = 9'h1a1;
              4'h4: out_low = 9'h19f;
              4'h5: out_low = 9'h19c;
              4'h6: out_low = 9'h199;
              4'h7: out_low = 9'h197;
              4'h8: out_low = 9'h194;
              4'h9: out_low = 9'h191;
              4'ha: out_low = 9'h18f;
              4'hb: out_low = 9'h18c;
              4'hc: out_low = 9'h18a;
              4'hd: out_low = 9'h187;
              4'he: out_low = 9'h184;
              4'hf: out_low = 9'h182;
              default: out_low = 9'h000;
            endcase
          end
          6'h23: begin
            case (mant[3:0])
              4'h0: out_low = 9'h17f;
              4'h1: out_low = 9'h17d;
              4'h2: out_low = 9'h17a;
              4'h3: out_low = 9'h177;
              4'h4: out_low = 9'h175;
              4'h5: out_low = 9'h172;
              4'h6: out_low = 9'h170;
              4'h7: out_low = 9'h16d;
              4'h8: out_low = 9'h16a;
              4'h9: out_low = 9'h168;
              4'ha: out_low = 9'h165;
              4'hb: out_low = 9'h163;
              4'hc: out_low = 9'h160;
              4'hd: out_low = 9'h15e;
              4'he: out_low = 9'h15b;
              4'hf: out_low = 9'h159;
              default: out_low = 9'h000;
            endcase
          end
          6'h24: begin
            case (mant[3:0])
              4'h0: out_low = 9'h156;
              4'h1: out_low = 9'h153;
              4'h2: out_low = 9'h151;
              4'h3: out_low = 9'h14e;
              4'h4: out_low = 9'h14c;
              4'h5: out_low = 9'h149;
              4'h6: out_low = 9'h147;
              4'h7: out_low = 9'h144;
              4'h8: out_low = 9'h142;
              4'h9: out_low = 9'h13f;
              4'ha: out_low = 9'h13d;
              4'hb: out_low = 9'h13a;
              4'hc: out_low = 9'h138;
              4'hd: out_low = 9'h135;
              4'he: out_low = 9'h133;
              4'hf: out_low = 9'h130;
              default: out_low = 9'h000;
            endcase
          end
          6'h25: begin
            case (mant[3:0])
              4'h0: out_low = 9'h12e;
              4'h1: out_low = 9'h12b;
              4'h2: out_low = 9'h129;
              4'h3: out_low = 9'h126;
              4'h4: out_low = 9'h124;
              4'h5: out_low = 9'h121;
              4'h6: out_low = 9'h11f;
              4'h7: out_low = 9'h11c;
              4'h8: out_low = 9'h11a;
              4'h9: out_low = 9'h118;
              4'ha: out_low = 9'h115;
              4'hb: out_low = 9'h113;
              4'hc: out_low = 9'h110;
              4'hd: out_low = 9'h10e;
              4'he: out_low = 9'h10b;
              4'hf: out_low = 9'h109;
              default: out_low = 9'h000;
            endcase
          end
          6'h26: begin
            case (mant[3:0])
              4'h0: out_low = 9'h106;
              4'h1: out_low = 9'h104;
              4'h2: out_low = 9'h102;
              4'h3: out_low = 9'h0ff;
              4'h4: out_low = 9'h0fd;
              4'h5: out_low = 9'h0fa;
              4'h6: out_low = 9'h0f8;
              4'h7: out_low = 9'h0f5;
              4'h8: out_low = 9'h0f3;
              4'h9: out_low = 9'h0f1;
              4'ha: out_low = 9'h0ee;
              4'hb: out_low = 9'h0ec;
              4'hc: out_low = 9'h0e9;
              4'hd: out_low = 9'h0e7;
              4'he: out_low = 9'h0e5;
              4'hf: out_low = 9'h0e2;
              default: out_low = 9'h000;
            endcase
          end
          6'h27: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0e0;
              4'h1: out_low = 9'h0dd;
              4'h2: out_low = 9'h0db;
              4'h3: out_low = 9'h0d9;
              4'h4: out_low = 9'h0d6;
              4'h5: out_low = 9'h0d4;
              4'h6: out_low = 9'h0d2;
              4'h7: out_low = 9'h0cf;
              4'h8: out_low = 9'h0cd;
              4'h9: out_low = 9'h0cb;
              4'ha: out_low = 9'h0c8;
              4'hb: out_low = 9'h0c6;
              4'hc: out_low = 9'h0c4;
              4'hd: out_low = 9'h0c1;
              4'he: out_low = 9'h0bf;
              4'hf: out_low = 9'h0bc;
              default: out_low = 9'h000;
            endcase
          end
          6'h28: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0ba;
              4'h1: out_low = 9'h0b8;
              4'h2: out_low = 9'h0b5;
              4'h3: out_low = 9'h0b3;
              4'h4: out_low = 9'h0b1;
              4'h5: out_low = 9'h0af;
              4'h6: out_low = 9'h0ac;
              4'h7: out_low = 9'h0aa;
              4'h8: out_low = 9'h0a8;
              4'h9: out_low = 9'h0a5;
              4'ha: out_low = 9'h0a3;
              4'hb: out_low = 9'h0a1;
              4'hc: out_low = 9'h09e;
              4'hd: out_low = 9'h09c;
              4'he: out_low = 9'h09a;
              4'hf: out_low = 9'h098;
              default: out_low = 9'h000;
            endcase
          end
          6'h29: begin
            case (mant[3:0])
              4'h0: out_low = 9'h095;
              4'h1: out_low = 9'h093;
              4'h2: out_low = 9'h091;
              4'h3: out_low = 9'h08e;
              4'h4: out_low = 9'h08c;
              4'h5: out_low = 9'h08a;
              4'h6: out_low = 9'h088;
              4'h7: out_low = 9'h085;
              4'h8: out_low = 9'h083;
              4'h9: out_low = 9'h081;
              4'ha: out_low = 9'h07f;
              4'hb: out_low = 9'h07c;
              4'hc: out_low = 9'h07a;
              4'hd: out_low = 9'h078;
              4'he: out_low = 9'h076;
              4'hf: out_low = 9'h073;
              default: out_low = 9'h000;
            endcase
          end
          6'h2a: begin
            case (mant[3:0])
              4'h0: out_low = 9'h071;
              4'h1: out_low = 9'h06f;
              4'h2: out_low = 9'h06d;
              4'h3: out_low = 9'h06a;
              4'h4: out_low = 9'h068;
              4'h5: out_low = 9'h066;
              4'h6: out_low = 9'h064;
              4'h7: out_low = 9'h062;
              4'h8: out_low = 9'h05f;
              4'h9: out_low = 9'h05d;
              4'ha: out_low = 9'h05b;
              4'hb: out_low = 9'h059;
              4'hc: out_low = 9'h057;
              4'hd: out_low = 9'h054;
              4'he: out_low = 9'h052;
              4'hf: out_low = 9'h050;
              default: out_low = 9'h000;
            endcase
          end
          6'h2b: begin
            case (mant[3:0])
              4'h0: out_low = 9'h04e;
              4'h1: out_low = 9'h04c;
              4'h2: out_low = 9'h049;
              4'h3: out_low = 9'h047;
              4'h4: out_low = 9'h045;
              4'h5: out_low = 9'h043;
              4'h6: out_low = 9'h041;
              4'h7: out_low = 9'h03f;
              4'h8: out_low = 9'h03c;
              4'h9: out_low = 9'h03a;
              4'ha: out_low = 9'h038;
              4'hb: out_low = 9'h036;
              4'hc: out_low = 9'h034;
              4'hd: out_low = 9'h032;
              4'he: out_low = 9'h030;
              4'hf: out_low = 9'h02d;
              default: out_low = 9'h000;
            endcase
          end
          6'h2c: begin
            case (mant[3:0])
              4'h0: out_low = 9'h02b;
              4'h1: out_low = 9'h029;
              4'h2: out_low = 9'h027;
              4'h3: out_low = 9'h025;
              4'h4: out_low = 9'h023;
              4'h5: out_low = 9'h021;
              4'h6: out_low = 9'h01e;
              4'h7: out_low = 9'h01c;
              4'h8: out_low = 9'h01a;
              4'h9: out_low = 9'h018;
              4'ha: out_low = 9'h016;
              4'hb: out_low = 9'h014;
              4'hc: out_low = 9'h012;
              4'hd: out_low = 9'h010;
              4'he: out_low = 9'h00e;
              4'hf: out_low = 9'h00b;
              default: out_low = 9'h000;
            endcase
          end
          6'h2d: begin
            case (mant[3:0])
              4'h0: out_low = 9'h009;
              4'h1: out_low = 9'h007;
              4'h2: out_low = 9'h005;
              4'h3: out_low = 9'h003;
              4'h4: out_low = 9'h001;
              4'h5: out_low = 9'h1ff;
              4'h6: out_low = 9'h1fd;
              4'h7: out_low = 9'h1fb;
              4'h8: out_low = 9'h1f9;
              4'h9: out_low = 9'h1f7;
              4'ha: out_low = 9'h1f5;
              4'hb: out_low = 9'h1f3;
              4'hc: out_low = 9'h1f0;
              4'hd: out_low = 9'h1ee;
              4'he: out_low = 9'h1ec;
              4'hf: out_low = 9'h1ea;
              default: out_low = 9'h000;
            endcase
          end
          6'h2e: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1e8;
              4'h1: out_low = 9'h1e6;
              4'h2: out_low = 9'h1e4;
              4'h3: out_low = 9'h1e2;
              4'h4: out_low = 9'h1e0;
              4'h5: out_low = 9'h1de;
              4'h6: out_low = 9'h1dc;
              4'h7: out_low = 9'h1da;
              4'h8: out_low = 9'h1d8;
              4'h9: out_low = 9'h1d6;
              4'ha: out_low = 9'h1d4;
              4'hb: out_low = 9'h1d2;
              4'hc: out_low = 9'h1d0;
              4'hd: out_low = 9'h1ce;
              4'he: out_low = 9'h1cc;
              4'hf: out_low = 9'h1ca;
              default: out_low = 9'h000;
            endcase
          end
          6'h2f: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1c8;
              4'h1: out_low = 9'h1c6;
              4'h2: out_low = 9'h1c4;
              4'h3: out_low = 9'h1c2;
              4'h4: out_low = 9'h1c0;
              4'h5: out_low = 9'h1be;
              4'h6: out_low = 9'h1bc;
              4'h7: out_low = 9'h1ba;
              4'h8: out_low = 9'h1b8;
              4'h9: out_low = 9'h1b6;
              4'ha: out_low = 9'h1b4;
              4'hb: out_low = 9'h1b2;
              4'hc: out_low = 9'h1b0;
              4'hd: out_low = 9'h1ae;
              4'he: out_low = 9'h1ac;
              4'hf: out_low = 9'h1aa;
              default: out_low = 9'h000;
            endcase
          end
          6'h30: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1a8;
              4'h1: out_low = 9'h1a6;
              4'h2: out_low = 9'h1a4;
              4'h3: out_low = 9'h1a2;
              4'h4: out_low = 9'h1a0;
              4'h5: out_low = 9'h19e;
              4'h6: out_low = 9'h19c;
              4'h7: out_low = 9'h19a;
              4'h8: out_low = 9'h199;
              4'h9: out_low = 9'h197;
              4'ha: out_low = 9'h195;
              4'hb: out_low = 9'h193;
              4'hc: out_low = 9'h191;
              4'hd: out_low = 9'h18f;
              4'he: out_low = 9'h18d;
              4'hf: out_low = 9'h18b;
              default: out_low = 9'h000;
            endcase
          end
          6'h31: begin
            case (mant[3:0])
              4'h0: out_low = 9'h189;
              4'h1: out_low = 9'h187;
              4'h2: out_low = 9'h185;
              4'h3: out_low = 9'h183;
              4'h4: out_low = 9'h181;
              4'h5: out_low = 9'h180;
              4'h6: out_low = 9'h17e;
              4'h7: out_low = 9'h17c;
              4'h8: out_low = 9'h17a;
              4'h9: out_low = 9'h178;
              4'ha: out_low = 9'h176;
              4'hb: out_low = 9'h174;
              4'hc: out_low = 9'h172;
              4'hd: out_low = 9'h170;
              4'he: out_low = 9'h16f;
              4'hf: out_low = 9'h16d;
              default: out_low = 9'h000;
            endcase
          end
          6'h32: begin
            case (mant[3:0])
              4'h0: out_low = 9'h16b;
              4'h1: out_low = 9'h169;
              4'h2: out_low = 9'h167;
              4'h3: out_low = 9'h165;
              4'h4: out_low = 9'h163;
              4'h5: out_low = 9'h161;
              4'h6: out_low = 9'h160;
              4'h7: out_low = 9'h15e;
              4'h8: out_low = 9'h15c;
              4'h9: out_low = 9'h15a;
              4'ha: out_low = 9'h158;
              4'hb: out_low = 9'h156;
              4'hc: out_low = 9'h154;
              4'hd: out_low = 9'h153;
              4'he: out_low = 9'h151;
              4'hf: out_low = 9'h14f;
              default: out_low = 9'h000;
            endcase
          end
          6'h33: begin
            case (mant[3:0])
              4'h0: out_low = 9'h14d;
              4'h1: out_low = 9'h14b;
              4'h2: out_low = 9'h149;
              4'h3: out_low = 9'h148;
              4'h4: out_low = 9'h146;
              4'h5: out_low = 9'h144;
              4'h6: out_low = 9'h142;
              4'h7: out_low = 9'h140;
              4'h8: out_low = 9'h13e;
              4'h9: out_low = 9'h13d;
              4'ha: out_low = 9'h13b;
              4'hb: out_low = 9'h139;
              4'hc: out_low = 9'h137;
              4'hd: out_low = 9'h135;
              4'he: out_low = 9'h134;
              4'hf: out_low = 9'h132;
              default: out_low = 9'h000;
            endcase
          end
          6'h34: begin
            case (mant[3:0])
              4'h0: out_low = 9'h130;
              4'h1: out_low = 9'h12e;
              4'h2: out_low = 9'h12c;
              4'h3: out_low = 9'h12b;
              4'h4: out_low = 9'h129;
              4'h5: out_low = 9'h127;
              4'h6: out_low = 9'h125;
              4'h7: out_low = 9'h123;
              4'h8: out_low = 9'h122;
              4'h9: out_low = 9'h120;
              4'ha: out_low = 9'h11e;
              4'hb: out_low = 9'h11c;
              4'hc: out_low = 9'h11b;
              4'hd: out_low = 9'h119;
              4'he: out_low = 9'h117;
              4'hf: out_low = 9'h115;
              default: out_low = 9'h000;
            endcase
          end
          6'h35: begin
            case (mant[3:0])
              4'h0: out_low = 9'h114;
              4'h1: out_low = 9'h112;
              4'h2: out_low = 9'h110;
              4'h3: out_low = 9'h10e;
              4'h4: out_low = 9'h10c;
              4'h5: out_low = 9'h10b;
              4'h6: out_low = 9'h109;
              4'h7: out_low = 9'h107;
              4'h8: out_low = 9'h106;
              4'h9: out_low = 9'h104;
              4'ha: out_low = 9'h102;
              4'hb: out_low = 9'h100;
              4'hc: out_low = 9'h0ff;
              4'hd: out_low = 9'h0fd;
              4'he: out_low = 9'h0fb;
              4'hf: out_low = 9'h0f9;
              default: out_low = 9'h000;
            endcase
          end
          6'h36: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0f8;
              4'h1: out_low = 9'h0f6;
              4'h2: out_low = 9'h0f4;
              4'h3: out_low = 9'h0f3;
              4'h4: out_low = 9'h0f1;
              4'h5: out_low = 9'h0ef;
              4'h6: out_low = 9'h0ed;
              4'h7: out_low = 9'h0ec;
              4'h8: out_low = 9'h0ea;
              4'h9: out_low = 9'h0e8;
              4'ha: out_low = 9'h0e7;
              4'hb: out_low = 9'h0e5;
              4'hc: out_low = 9'h0e3;
              4'hd: out_low = 9'h0e1;
              4'he: out_low = 9'h0e0;
              4'hf: out_low = 9'h0de;
              default: out_low = 9'h000;
            endcase
          end
          6'h37: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0dc;
              4'h1: out_low = 9'h0db;
              4'h2: out_low = 9'h0d9;
              4'h3: out_low = 9'h0d7;
              4'h4: out_low = 9'h0d6;
              4'h5: out_low = 9'h0d4;
              4'h6: out_low = 9'h0d2;
              4'h7: out_low = 9'h0d1;
              4'h8: out_low = 9'h0cf;
              4'h9: out_low = 9'h0cd;
              4'ha: out_low = 9'h0cc;
              4'hb: out_low = 9'h0ca;
              4'hc: out_low = 9'h0c8;
              4'hd: out_low = 9'h0c7;
              4'he: out_low = 9'h0c5;
              4'hf: out_low = 9'h0c3;
              default: out_low = 9'h000;
            endcase
          end
          6'h38: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0c2;
              4'h1: out_low = 9'h0c0;
              4'h2: out_low = 9'h0be;
              4'h3: out_low = 9'h0bd;
              4'h4: out_low = 9'h0bb;
              4'h5: out_low = 9'h0ba;
              4'h6: out_low = 9'h0b8;
              4'h7: out_low = 9'h0b6;
              4'h8: out_low = 9'h0b5;
              4'h9: out_low = 9'h0b3;
              4'ha: out_low = 9'h0b1;
              4'hb: out_low = 9'h0b0;
              4'hc: out_low = 9'h0ae;
              4'hd: out_low = 9'h0ad;
              4'he: out_low = 9'h0ab;
              4'hf: out_low = 9'h0a9;
              default: out_low = 9'h000;
            endcase
          end
          6'h39: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0a8;
              4'h1: out_low = 9'h0a6;
              4'h2: out_low = 9'h0a4;
              4'h3: out_low = 9'h0a3;
              4'h4: out_low = 9'h0a1;
              4'h5: out_low = 9'h0a0;
              4'h6: out_low = 9'h09e;
              4'h7: out_low = 9'h09c;
              4'h8: out_low = 9'h09b;
              4'h9: out_low = 9'h099;
              4'ha: out_low = 9'h098;
              4'hb: out_low = 9'h096;
              4'hc: out_low = 9'h094;
              4'hd: out_low = 9'h093;
              4'he: out_low = 9'h091;
              4'hf: out_low = 9'h090;
              default: out_low = 9'h000;
            endcase
          end
          6'h3a: begin
            case (mant[3:0])
              4'h0: out_low = 9'h08e;
              4'h1: out_low = 9'h08d;
              4'h2: out_low = 9'h08b;
              4'h3: out_low = 9'h089;
              4'h4: out_low = 9'h088;
              4'h5: out_low = 9'h086;
              4'h6: out_low = 9'h085;
              4'h7: out_low = 9'h083;
              4'h8: out_low = 9'h082;
              4'h9: out_low = 9'h080;
              4'ha: out_low = 9'h07e;
              4'hb: out_low = 9'h07d;
              4'hc: out_low = 9'h07b;
              4'hd: out_low = 9'h07a;
              4'he: out_low = 9'h078;
              4'hf: out_low = 9'h077;
              default: out_low = 9'h000;
            endcase
          end
          6'h3b: begin
            case (mant[3:0])
              4'h0: out_low = 9'h075;
              4'h1: out_low = 9'h074;
              4'h2: out_low = 9'h072;
              4'h3: out_low = 9'h071;
              4'h4: out_low = 9'h06f;
              4'h5: out_low = 9'h06d;
              4'h6: out_low = 9'h06c;
              4'h7: out_low = 9'h06a;
              4'h8: out_low = 9'h069;
              4'h9: out_low = 9'h067;
              4'ha: out_low = 9'h066;
              4'hb: out_low = 9'h064;
              4'hc: out_low = 9'h063;
              4'hd: out_low = 9'h061;
              4'he: out_low = 9'h060;
              4'hf: out_low = 9'h05e;
              default: out_low = 9'h000;
            endcase
          end
          6'h3c: begin
            case (mant[3:0])
              4'h0: out_low = 9'h05d;
              4'h1: out_low = 9'h05b;
              4'h2: out_low = 9'h05a;
              4'h3: out_low = 9'h058;
              4'h4: out_low = 9'h057;
              4'h5: out_low = 9'h055;
              4'h6: out_low = 9'h054;
              4'h7: out_low = 9'h052;
              4'h8: out_low = 9'h051;
              4'h9: out_low = 9'h04f;
              4'ha: out_low = 9'h04e;
              4'hb: out_low = 9'h04c;
              4'hc: out_low = 9'h04b;
              4'hd: out_low = 9'h049;
              4'he: out_low = 9'h048;
              4'hf: out_low = 9'h046;
              default: out_low = 9'h000;
            endcase
          end
          6'h3d: begin
            case (mant[3:0])
              4'h0: out_low = 9'h045;
              4'h1: out_low = 9'h043;
              4'h2: out_low = 9'h042;
              4'h3: out_low = 9'h040;
              4'h4: out_low = 9'h03f;
              4'h5: out_low = 9'h03d;
              4'h6: out_low = 9'h03c;
              4'h7: out_low = 9'h03a;
              4'h8: out_low = 9'h039;
              4'h9: out_low = 9'h038;
              4'ha: out_low = 9'h036;
              4'hb: out_low = 9'h035;
              4'hc: out_low = 9'h033;
              4'hd: out_low = 9'h032;
              4'he: out_low = 9'h030;
              4'hf: out_low = 9'h02f;
              default: out_low = 9'h000;
            endcase
          end
          6'h3e: begin
            case (mant[3:0])
              4'h0: out_low = 9'h02d;
              4'h1: out_low = 9'h02c;
              4'h2: out_low = 9'h02a;
              4'h3: out_low = 9'h029;
              4'h4: out_low = 9'h028;
              4'h5: out_low = 9'h026;
              4'h6: out_low = 9'h025;
              4'h7: out_low = 9'h023;
              4'h8: out_low = 9'h022;
              4'h9: out_low = 9'h020;
              4'ha: out_low = 9'h01f;
              4'hb: out_low = 9'h01e;
              4'hc: out_low = 9'h01c;
              4'hd: out_low = 9'h01b;
              4'he: out_low = 9'h019;
              4'hf: out_low = 9'h018;
              default: out_low = 9'h000;
            endcase
          end
          6'h3f: begin
            case (mant[3:0])
              4'h0: out_low = 9'h016;
              4'h1: out_low = 9'h015;
              4'h2: out_low = 9'h014;
              4'h3: out_low = 9'h012;
              4'h4: out_low = 9'h011;
              4'h5: out_low = 9'h00f;
              4'h6: out_low = 9'h00e;
              4'h7: out_low = 9'h00d;
              4'h8: out_low = 9'h00b;
              4'h9: out_low = 9'h00a;
              4'ha: out_low = 9'h008;
              4'hb: out_low = 9'h007;
              4'hc: out_low = 9'h006;
              4'hd: out_low = 9'h004;
              4'he: out_low = 9'h003;
              4'hf: out_low = 9'h001;
              default: out_low = 9'h000;
            endcase
          end
          default: out_low = 9'h000;
        endcase
      end
      6'h31: begin
        case (mant[9:4])
          6'h00: begin
            case (mant[3:0])
              4'h0: out_low = 9'h000;
              4'h1: out_low = 9'h1fa;
              4'h2: out_low = 9'h1f5;
              4'h3: out_low = 9'h1ef;
              4'h4: out_low = 9'h1ea;
              4'h5: out_low = 9'h1e4;
              4'h6: out_low = 9'h1df;
              4'h7: out_low = 9'h1da;
              4'h8: out_low = 9'h1d4;
              4'h9: out_low = 9'h1cf;
              4'ha: out_low = 9'h1c9;
              4'hb: out_low = 9'h1c4;
              4'hc: out_low = 9'h1bf;
              4'hd: out_low = 9'h1b9;
              4'he: out_low = 9'h1b4;
              4'hf: out_low = 9'h1ae;
              default: out_low = 9'h000;
            endcase
          end
          6'h01: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1a9;
              4'h1: out_low = 9'h1a4;
              4'h2: out_low = 9'h19f;
              4'h3: out_low = 9'h199;
              4'h4: out_low = 9'h194;
              4'h5: out_low = 9'h18f;
              4'h6: out_low = 9'h18a;
              4'h7: out_low = 9'h184;
              4'h8: out_low = 9'h17f;
              4'h9: out_low = 9'h17a;
              4'ha: out_low = 9'h175;
              4'hb: out_low = 9'h170;
              4'hc: out_low = 9'h16a;
              4'hd: out_low = 9'h165;
              4'he: out_low = 9'h160;
              4'hf: out_low = 9'h15b;
              default: out_low = 9'h000;
            endcase
          end
          6'h02: begin
            case (mant[3:0])
              4'h0: out_low = 9'h156;
              4'h1: out_low = 9'h151;
              4'h2: out_low = 9'h14c;
              4'h3: out_low = 9'h147;
              4'h4: out_low = 9'h142;
              4'h5: out_low = 9'h13d;
              4'h6: out_low = 9'h138;
              4'h7: out_low = 9'h133;
              4'h8: out_low = 9'h12e;
              4'h9: out_low = 9'h129;
              4'ha: out_low = 9'h124;
              4'hb: out_low = 9'h11f;
              4'hc: out_low = 9'h11a;
              4'hd: out_low = 9'h115;
              4'he: out_low = 9'h110;
              4'hf: out_low = 9'h10b;
              default: out_low = 9'h000;
            endcase
          end
          6'h03: begin
            case (mant[3:0])
              4'h0: out_low = 9'h106;
              4'h1: out_low = 9'h102;
              4'h2: out_low = 9'h0fd;
              4'h3: out_low = 9'h0f8;
              4'h4: out_low = 9'h0f3;
              4'h5: out_low = 9'h0ee;
              4'h6: out_low = 9'h0e9;
              4'h7: out_low = 9'h0e5;
              4'h8: out_low = 9'h0e0;
              4'h9: out_low = 9'h0db;
              4'ha: out_low = 9'h0d6;
              4'hb: out_low = 9'h0d2;
              4'hc: out_low = 9'h0cd;
              4'hd: out_low = 9'h0c8;
              4'he: out_low = 9'h0c4;
              4'hf: out_low = 9'h0bf;
              default: out_low = 9'h000;
            endcase
          end
          6'h04: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0ba;
              4'h1: out_low = 9'h0b5;
              4'h2: out_low = 9'h0b1;
              4'h3: out_low = 9'h0ac;
              4'h4: out_low = 9'h0a8;
              4'h5: out_low = 9'h0a3;
              4'h6: out_low = 9'h09e;
              4'h7: out_low = 9'h09a;
              4'h8: out_low = 9'h095;
              4'h9: out_low = 9'h091;
              4'ha: out_low = 9'h08c;
              4'hb: out_low = 9'h088;
              4'hc: out_low = 9'h083;
              4'hd: out_low = 9'h07f;
              4'he: out_low = 9'h07a;
              4'hf: out_low = 9'h076;
              default: out_low = 9'h000;
            endcase
          end
          6'h05: begin
            case (mant[3:0])
              4'h0: out_low = 9'h071;
              4'h1: out_low = 9'h06d;
              4'h2: out_low = 9'h068;
              4'h3: out_low = 9'h064;
              4'h4: out_low = 9'h05f;
              4'h5: out_low = 9'h05b;
              4'h6: out_low = 9'h057;
              4'h7: out_low = 9'h052;
              4'h8: out_low = 9'h04e;
              4'h9: out_low = 9'h049;
              4'ha: out_low = 9'h045;
              4'hb: out_low = 9'h041;
              4'hc: out_low = 9'h03c;
              4'hd: out_low = 9'h038;
              4'he: out_low = 9'h034;
              4'hf: out_low = 9'h030;
              default: out_low = 9'h000;
            endcase
          end
          6'h06: begin
            case (mant[3:0])
              4'h0: out_low = 9'h02b;
              4'h1: out_low = 9'h027;
              4'h2: out_low = 9'h023;
              4'h3: out_low = 9'h01e;
              4'h4: out_low = 9'h01a;
              4'h5: out_low = 9'h016;
              4'h6: out_low = 9'h012;
              4'h7: out_low = 9'h00e;
              4'h8: out_low = 9'h009;
              4'h9: out_low = 9'h005;
              4'ha: out_low = 9'h001;
              4'hb: out_low = 9'h1fd;
              4'hc: out_low = 9'h1f9;
              4'hd: out_low = 9'h1f5;
              4'he: out_low = 9'h1f0;
              4'hf: out_low = 9'h1ec;
              default: out_low = 9'h000;
            endcase
          end
          6'h07: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1e8;
              4'h1: out_low = 9'h1e4;
              4'h2: out_low = 9'h1e0;
              4'h3: out_low = 9'h1dc;
              4'h4: out_low = 9'h1d8;
              4'h5: out_low = 9'h1d4;
              4'h6: out_low = 9'h1d0;
              4'h7: out_low = 9'h1cc;
              4'h8: out_low = 9'h1c8;
              4'h9: out_low = 9'h1c4;
              4'ha: out_low = 9'h1c0;
              4'hb: out_low = 9'h1bc;
              4'hc: out_low = 9'h1b8;
              4'hd: out_low = 9'h1b4;
              4'he: out_low = 9'h1b0;
              4'hf: out_low = 9'h1ac;
              default: out_low = 9'h000;
            endcase
          end
          6'h08: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1a8;
              4'h1: out_low = 9'h1a4;
              4'h2: out_low = 9'h1a0;
              4'h3: out_low = 9'h19c;
              4'h4: out_low = 9'h199;
              4'h5: out_low = 9'h195;
              4'h6: out_low = 9'h191;
              4'h7: out_low = 9'h18d;
              4'h8: out_low = 9'h189;
              4'h9: out_low = 9'h185;
              4'ha: out_low = 9'h181;
              4'hb: out_low = 9'h17e;
              4'hc: out_low = 9'h17a;
              4'hd: out_low = 9'h176;
              4'he: out_low = 9'h172;
              4'hf: out_low = 9'h16f;
              default: out_low = 9'h000;
            endcase
          end
          6'h09: begin
            case (mant[3:0])
              4'h0: out_low = 9'h16b;
              4'h1: out_low = 9'h167;
              4'h2: out_low = 9'h163;
              4'h3: out_low = 9'h160;
              4'h4: out_low = 9'h15c;
              4'h5: out_low = 9'h158;
              4'h6: out_low = 9'h154;
              4'h7: out_low = 9'h151;
              4'h8: out_low = 9'h14d;
              4'h9: out_low = 9'h149;
              4'ha: out_low = 9'h146;
              4'hb: out_low = 9'h142;
              4'hc: out_low = 9'h13e;
              4'hd: out_low = 9'h13b;
              4'he: out_low = 9'h137;
              4'hf: out_low = 9'h134;
              default: out_low = 9'h000;
            endcase
          end
          6'h0a: begin
            case (mant[3:0])
              4'h0: out_low = 9'h130;
              4'h1: out_low = 9'h12c;
              4'h2: out_low = 9'h129;
              4'h3: out_low = 9'h125;
              4'h4: out_low = 9'h122;
              4'h5: out_low = 9'h11e;
              4'h6: out_low = 9'h11b;
              4'h7: out_low = 9'h117;
              4'h8: out_low = 9'h114;
              4'h9: out_low = 9'h110;
              4'ha: out_low = 9'h10c;
              4'hb: out_low = 9'h109;
              4'hc: out_low = 9'h106;
              4'hd: out_low = 9'h102;
              4'he: out_low = 9'h0ff;
              4'hf: out_low = 9'h0fb;
              default: out_low = 9'h000;
            endcase
          end
          6'h0b: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0f8;
              4'h1: out_low = 9'h0f4;
              4'h2: out_low = 9'h0f1;
              4'h3: out_low = 9'h0ed;
              4'h4: out_low = 9'h0ea;
              4'h5: out_low = 9'h0e7;
              4'h6: out_low = 9'h0e3;
              4'h7: out_low = 9'h0e0;
              4'h8: out_low = 9'h0dc;
              4'h9: out_low = 9'h0d9;
              4'ha: out_low = 9'h0d6;
              4'hb: out_low = 9'h0d2;
              4'hc: out_low = 9'h0cf;
              4'hd: out_low = 9'h0cc;
              4'he: out_low = 9'h0c8;
              4'hf: out_low = 9'h0c5;
              default: out_low = 9'h000;
            endcase
          end
          6'h0c: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0c2;
              4'h1: out_low = 9'h0be;
              4'h2: out_low = 9'h0bb;
              4'h3: out_low = 9'h0b8;
              4'h4: out_low = 9'h0b5;
              4'h5: out_low = 9'h0b1;
              4'h6: out_low = 9'h0ae;
              4'h7: out_low = 9'h0ab;
              4'h8: out_low = 9'h0a8;
              4'h9: out_low = 9'h0a4;
              4'ha: out_low = 9'h0a1;
              4'hb: out_low = 9'h09e;
              4'hc: out_low = 9'h09b;
              4'hd: out_low = 9'h098;
              4'he: out_low = 9'h094;
              4'hf: out_low = 9'h091;
              default: out_low = 9'h000;
            endcase
          end
          6'h0d: begin
            case (mant[3:0])
              4'h0: out_low = 9'h08e;
              4'h1: out_low = 9'h08b;
              4'h2: out_low = 9'h088;
              4'h3: out_low = 9'h085;
              4'h4: out_low = 9'h082;
              4'h5: out_low = 9'h07e;
              4'h6: out_low = 9'h07b;
              4'h7: out_low = 9'h078;
              4'h8: out_low = 9'h075;
              4'h9: out_low = 9'h072;
              4'ha: out_low = 9'h06f;
              4'hb: out_low = 9'h06c;
              4'hc: out_low = 9'h069;
              4'hd: out_low = 9'h066;
              4'he: out_low = 9'h063;
              4'hf: out_low = 9'h060;
              default: out_low = 9'h000;
            endcase
          end
          6'h0e: begin
            case (mant[3:0])
              4'h0: out_low = 9'h05d;
              4'h1: out_low = 9'h05a;
              4'h2: out_low = 9'h057;
              4'h3: out_low = 9'h054;
              4'h4: out_low = 9'h051;
              4'h5: out_low = 9'h04e;
              4'h6: out_low = 9'h04b;
              4'h7: out_low = 9'h048;
              4'h8: out_low = 9'h045;
              4'h9: out_low = 9'h042;
              4'ha: out_low = 9'h03f;
              4'hb: out_low = 9'h03c;
              4'hc: out_low = 9'h039;
              4'hd: out_low = 9'h036;
              4'he: out_low = 9'h033;
              4'hf: out_low = 9'h030;
              default: out_low = 9'h000;
            endcase
          end
          6'h0f: begin
            case (mant[3:0])
              4'h0: out_low = 9'h02d;
              4'h1: out_low = 9'h02a;
              4'h2: out_low = 9'h028;
              4'h3: out_low = 9'h025;
              4'h4: out_low = 9'h022;
              4'h5: out_low = 9'h01f;
              4'h6: out_low = 9'h01c;
              4'h7: out_low = 9'h019;
              4'h8: out_low = 9'h016;
              4'h9: out_low = 9'h014;
              4'ha: out_low = 9'h011;
              4'hb: out_low = 9'h00e;
              4'hc: out_low = 9'h00b;
              4'hd: out_low = 9'h008;
              4'he: out_low = 9'h006;
              4'hf: out_low = 9'h003;
              default: out_low = 9'h000;
            endcase
          end
          6'h10: begin
            case (mant[3:0])
              4'h0: out_low = 9'h000;
              4'h1: out_low = 9'h1fa;
              4'h2: out_low = 9'h1f5;
              4'h3: out_low = 9'h1ef;
              4'h4: out_low = 9'h1ea;
              4'h5: out_low = 9'h1e4;
              4'h6: out_low = 9'h1df;
              4'h7: out_low = 9'h1da;
              4'h8: out_low = 9'h1d4;
              4'h9: out_low = 9'h1cf;
              4'ha: out_low = 9'h1c9;
              4'hb: out_low = 9'h1c4;
              4'hc: out_low = 9'h1bf;
              4'hd: out_low = 9'h1b9;
              4'he: out_low = 9'h1b4;
              4'hf: out_low = 9'h1ae;
              default: out_low = 9'h000;
            endcase
          end
          6'h11: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1a9;
              4'h1: out_low = 9'h1a4;
              4'h2: out_low = 9'h19f;
              4'h3: out_low = 9'h199;
              4'h4: out_low = 9'h194;
              4'h5: out_low = 9'h18f;
              4'h6: out_low = 9'h18a;
              4'h7: out_low = 9'h184;
              4'h8: out_low = 9'h17f;
              4'h9: out_low = 9'h17a;
              4'ha: out_low = 9'h175;
              4'hb: out_low = 9'h170;
              4'hc: out_low = 9'h16a;
              4'hd: out_low = 9'h165;
              4'he: out_low = 9'h160;
              4'hf: out_low = 9'h15b;
              default: out_low = 9'h000;
            endcase
          end
          6'h12: begin
            case (mant[3:0])
              4'h0: out_low = 9'h156;
              4'h1: out_low = 9'h151;
              4'h2: out_low = 9'h14c;
              4'h3: out_low = 9'h147;
              4'h4: out_low = 9'h142;
              4'h5: out_low = 9'h13d;
              4'h6: out_low = 9'h138;
              4'h7: out_low = 9'h133;
              4'h8: out_low = 9'h12e;
              4'h9: out_low = 9'h129;
              4'ha: out_low = 9'h124;
              4'hb: out_low = 9'h11f;
              4'hc: out_low = 9'h11a;
              4'hd: out_low = 9'h115;
              4'he: out_low = 9'h110;
              4'hf: out_low = 9'h10b;
              default: out_low = 9'h000;
            endcase
          end
          6'h13: begin
            case (mant[3:0])
              4'h0: out_low = 9'h106;
              4'h1: out_low = 9'h102;
              4'h2: out_low = 9'h0fd;
              4'h3: out_low = 9'h0f8;
              4'h4: out_low = 9'h0f3;
              4'h5: out_low = 9'h0ee;
              4'h6: out_low = 9'h0e9;
              4'h7: out_low = 9'h0e5;
              4'h8: out_low = 9'h0e0;
              4'h9: out_low = 9'h0db;
              4'ha: out_low = 9'h0d6;
              4'hb: out_low = 9'h0d2;
              4'hc: out_low = 9'h0cd;
              4'hd: out_low = 9'h0c8;
              4'he: out_low = 9'h0c4;
              4'hf: out_low = 9'h0bf;
              default: out_low = 9'h000;
            endcase
          end
          6'h14: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0ba;
              4'h1: out_low = 9'h0b5;
              4'h2: out_low = 9'h0b1;
              4'h3: out_low = 9'h0ac;
              4'h4: out_low = 9'h0a8;
              4'h5: out_low = 9'h0a3;
              4'h6: out_low = 9'h09e;
              4'h7: out_low = 9'h09a;
              4'h8: out_low = 9'h095;
              4'h9: out_low = 9'h091;
              4'ha: out_low = 9'h08c;
              4'hb: out_low = 9'h088;
              4'hc: out_low = 9'h083;
              4'hd: out_low = 9'h07f;
              4'he: out_low = 9'h07a;
              4'hf: out_low = 9'h076;
              default: out_low = 9'h000;
            endcase
          end
          6'h15: begin
            case (mant[3:0])
              4'h0: out_low = 9'h071;
              4'h1: out_low = 9'h06d;
              4'h2: out_low = 9'h068;
              4'h3: out_low = 9'h064;
              4'h4: out_low = 9'h05f;
              4'h5: out_low = 9'h05b;
              4'h6: out_low = 9'h057;
              4'h7: out_low = 9'h052;
              4'h8: out_low = 9'h04e;
              4'h9: out_low = 9'h049;
              4'ha: out_low = 9'h045;
              4'hb: out_low = 9'h041;
              4'hc: out_low = 9'h03c;
              4'hd: out_low = 9'h038;
              4'he: out_low = 9'h034;
              4'hf: out_low = 9'h030;
              default: out_low = 9'h000;
            endcase
          end
          6'h16: begin
            case (mant[3:0])
              4'h0: out_low = 9'h02b;
              4'h1: out_low = 9'h027;
              4'h2: out_low = 9'h023;
              4'h3: out_low = 9'h01e;
              4'h4: out_low = 9'h01a;
              4'h5: out_low = 9'h016;
              4'h6: out_low = 9'h012;
              4'h7: out_low = 9'h00e;
              4'h8: out_low = 9'h009;
              4'h9: out_low = 9'h005;
              4'ha: out_low = 9'h001;
              4'hb: out_low = 9'h1fd;
              4'hc: out_low = 9'h1f9;
              4'hd: out_low = 9'h1f5;
              4'he: out_low = 9'h1f0;
              4'hf: out_low = 9'h1ec;
              default: out_low = 9'h000;
            endcase
          end
          6'h17: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1e8;
              4'h1: out_low = 9'h1e4;
              4'h2: out_low = 9'h1e0;
              4'h3: out_low = 9'h1dc;
              4'h4: out_low = 9'h1d8;
              4'h5: out_low = 9'h1d4;
              4'h6: out_low = 9'h1d0;
              4'h7: out_low = 9'h1cc;
              4'h8: out_low = 9'h1c8;
              4'h9: out_low = 9'h1c4;
              4'ha: out_low = 9'h1c0;
              4'hb: out_low = 9'h1bc;
              4'hc: out_low = 9'h1b8;
              4'hd: out_low = 9'h1b4;
              4'he: out_low = 9'h1b0;
              4'hf: out_low = 9'h1ac;
              default: out_low = 9'h000;
            endcase
          end
          6'h18: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1a8;
              4'h1: out_low = 9'h1a4;
              4'h2: out_low = 9'h1a0;
              4'h3: out_low = 9'h19c;
              4'h4: out_low = 9'h199;
              4'h5: out_low = 9'h195;
              4'h6: out_low = 9'h191;
              4'h7: out_low = 9'h18d;
              4'h8: out_low = 9'h189;
              4'h9: out_low = 9'h185;
              4'ha: out_low = 9'h181;
              4'hb: out_low = 9'h17e;
              4'hc: out_low = 9'h17a;
              4'hd: out_low = 9'h176;
              4'he: out_low = 9'h172;
              4'hf: out_low = 9'h16f;
              default: out_low = 9'h000;
            endcase
          end
          6'h19: begin
            case (mant[3:0])
              4'h0: out_low = 9'h16b;
              4'h1: out_low = 9'h167;
              4'h2: out_low = 9'h163;
              4'h3: out_low = 9'h160;
              4'h4: out_low = 9'h15c;
              4'h5: out_low = 9'h158;
              4'h6: out_low = 9'h154;
              4'h7: out_low = 9'h151;
              4'h8: out_low = 9'h14d;
              4'h9: out_low = 9'h149;
              4'ha: out_low = 9'h146;
              4'hb: out_low = 9'h142;
              4'hc: out_low = 9'h13e;
              4'hd: out_low = 9'h13b;
              4'he: out_low = 9'h137;
              4'hf: out_low = 9'h134;
              default: out_low = 9'h000;
            endcase
          end
          6'h1a: begin
            case (mant[3:0])
              4'h0: out_low = 9'h130;
              4'h1: out_low = 9'h12c;
              4'h2: out_low = 9'h129;
              4'h3: out_low = 9'h125;
              4'h4: out_low = 9'h122;
              4'h5: out_low = 9'h11e;
              4'h6: out_low = 9'h11b;
              4'h7: out_low = 9'h117;
              4'h8: out_low = 9'h114;
              4'h9: out_low = 9'h110;
              4'ha: out_low = 9'h10c;
              4'hb: out_low = 9'h109;
              4'hc: out_low = 9'h106;
              4'hd: out_low = 9'h102;
              4'he: out_low = 9'h0ff;
              4'hf: out_low = 9'h0fb;
              default: out_low = 9'h000;
            endcase
          end
          6'h1b: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0f8;
              4'h1: out_low = 9'h0f4;
              4'h2: out_low = 9'h0f1;
              4'h3: out_low = 9'h0ed;
              4'h4: out_low = 9'h0ea;
              4'h5: out_low = 9'h0e7;
              4'h6: out_low = 9'h0e3;
              4'h7: out_low = 9'h0e0;
              4'h8: out_low = 9'h0dc;
              4'h9: out_low = 9'h0d9;
              4'ha: out_low = 9'h0d6;
              4'hb: out_low = 9'h0d2;
              4'hc: out_low = 9'h0cf;
              4'hd: out_low = 9'h0cc;
              4'he: out_low = 9'h0c8;
              4'hf: out_low = 9'h0c5;
              default: out_low = 9'h000;
            endcase
          end
          6'h1c: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0c2;
              4'h1: out_low = 9'h0be;
              4'h2: out_low = 9'h0bb;
              4'h3: out_low = 9'h0b8;
              4'h4: out_low = 9'h0b5;
              4'h5: out_low = 9'h0b1;
              4'h6: out_low = 9'h0ae;
              4'h7: out_low = 9'h0ab;
              4'h8: out_low = 9'h0a8;
              4'h9: out_low = 9'h0a4;
              4'ha: out_low = 9'h0a1;
              4'hb: out_low = 9'h09e;
              4'hc: out_low = 9'h09b;
              4'hd: out_low = 9'h098;
              4'he: out_low = 9'h094;
              4'hf: out_low = 9'h091;
              default: out_low = 9'h000;
            endcase
          end
          6'h1d: begin
            case (mant[3:0])
              4'h0: out_low = 9'h08e;
              4'h1: out_low = 9'h08b;
              4'h2: out_low = 9'h088;
              4'h3: out_low = 9'h085;
              4'h4: out_low = 9'h082;
              4'h5: out_low = 9'h07e;
              4'h6: out_low = 9'h07b;
              4'h7: out_low = 9'h078;
              4'h8: out_low = 9'h075;
              4'h9: out_low = 9'h072;
              4'ha: out_low = 9'h06f;
              4'hb: out_low = 9'h06c;
              4'hc: out_low = 9'h069;
              4'hd: out_low = 9'h066;
              4'he: out_low = 9'h063;
              4'hf: out_low = 9'h060;
              default: out_low = 9'h000;
            endcase
          end
          6'h1e: begin
            case (mant[3:0])
              4'h0: out_low = 9'h05d;
              4'h1: out_low = 9'h05a;
              4'h2: out_low = 9'h057;
              4'h3: out_low = 9'h054;
              4'h4: out_low = 9'h051;
              4'h5: out_low = 9'h04e;
              4'h6: out_low = 9'h04b;
              4'h7: out_low = 9'h048;
              4'h8: out_low = 9'h045;
              4'h9: out_low = 9'h042;
              4'ha: out_low = 9'h03f;
              4'hb: out_low = 9'h03c;
              4'hc: out_low = 9'h039;
              4'hd: out_low = 9'h036;
              4'he: out_low = 9'h033;
              4'hf: out_low = 9'h030;
              default: out_low = 9'h000;
            endcase
          end
          6'h1f: begin
            case (mant[3:0])
              4'h0: out_low = 9'h02d;
              4'h1: out_low = 9'h02a;
              4'h2: out_low = 9'h028;
              4'h3: out_low = 9'h025;
              4'h4: out_low = 9'h022;
              4'h5: out_low = 9'h01f;
              4'h6: out_low = 9'h01c;
              4'h7: out_low = 9'h019;
              4'h8: out_low = 9'h016;
              4'h9: out_low = 9'h014;
              4'ha: out_low = 9'h011;
              4'hb: out_low = 9'h00e;
              4'hc: out_low = 9'h00b;
              4'hd: out_low = 9'h008;
              4'he: out_low = 9'h006;
              4'hf: out_low = 9'h003;
              default: out_low = 9'h000;
            endcase
          end
          6'h20: begin
            case (mant[3:0])
              4'h0: out_low = 9'h000;
              4'h1: out_low = 9'h1fa;
              4'h2: out_low = 9'h1f5;
              4'h3: out_low = 9'h1ef;
              4'h4: out_low = 9'h1ea;
              4'h5: out_low = 9'h1e4;
              4'h6: out_low = 9'h1df;
              4'h7: out_low = 9'h1da;
              4'h8: out_low = 9'h1d4;
              4'h9: out_low = 9'h1cf;
              4'ha: out_low = 9'h1c9;
              4'hb: out_low = 9'h1c4;
              4'hc: out_low = 9'h1bf;
              4'hd: out_low = 9'h1b9;
              4'he: out_low = 9'h1b4;
              4'hf: out_low = 9'h1ae;
              default: out_low = 9'h000;
            endcase
          end
          6'h21: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1a9;
              4'h1: out_low = 9'h1a4;
              4'h2: out_low = 9'h19f;
              4'h3: out_low = 9'h199;
              4'h4: out_low = 9'h194;
              4'h5: out_low = 9'h18f;
              4'h6: out_low = 9'h18a;
              4'h7: out_low = 9'h184;
              4'h8: out_low = 9'h17f;
              4'h9: out_low = 9'h17a;
              4'ha: out_low = 9'h175;
              4'hb: out_low = 9'h170;
              4'hc: out_low = 9'h16a;
              4'hd: out_low = 9'h165;
              4'he: out_low = 9'h160;
              4'hf: out_low = 9'h15b;
              default: out_low = 9'h000;
            endcase
          end
          6'h22: begin
            case (mant[3:0])
              4'h0: out_low = 9'h156;
              4'h1: out_low = 9'h151;
              4'h2: out_low = 9'h14c;
              4'h3: out_low = 9'h147;
              4'h4: out_low = 9'h142;
              4'h5: out_low = 9'h13d;
              4'h6: out_low = 9'h138;
              4'h7: out_low = 9'h133;
              4'h8: out_low = 9'h12e;
              4'h9: out_low = 9'h129;
              4'ha: out_low = 9'h124;
              4'hb: out_low = 9'h11f;
              4'hc: out_low = 9'h11a;
              4'hd: out_low = 9'h115;
              4'he: out_low = 9'h110;
              4'hf: out_low = 9'h10b;
              default: out_low = 9'h000;
            endcase
          end
          6'h23: begin
            case (mant[3:0])
              4'h0: out_low = 9'h106;
              4'h1: out_low = 9'h102;
              4'h2: out_low = 9'h0fd;
              4'h3: out_low = 9'h0f8;
              4'h4: out_low = 9'h0f3;
              4'h5: out_low = 9'h0ee;
              4'h6: out_low = 9'h0e9;
              4'h7: out_low = 9'h0e5;
              4'h8: out_low = 9'h0e0;
              4'h9: out_low = 9'h0db;
              4'ha: out_low = 9'h0d6;
              4'hb: out_low = 9'h0d2;
              4'hc: out_low = 9'h0cd;
              4'hd: out_low = 9'h0c8;
              4'he: out_low = 9'h0c4;
              4'hf: out_low = 9'h0bf;
              default: out_low = 9'h000;
            endcase
          end
          6'h24: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0ba;
              4'h1: out_low = 9'h0b5;
              4'h2: out_low = 9'h0b1;
              4'h3: out_low = 9'h0ac;
              4'h4: out_low = 9'h0a8;
              4'h5: out_low = 9'h0a3;
              4'h6: out_low = 9'h09e;
              4'h7: out_low = 9'h09a;
              4'h8: out_low = 9'h095;
              4'h9: out_low = 9'h091;
              4'ha: out_low = 9'h08c;
              4'hb: out_low = 9'h088;
              4'hc: out_low = 9'h083;
              4'hd: out_low = 9'h07f;
              4'he: out_low = 9'h07a;
              4'hf: out_low = 9'h076;
              default: out_low = 9'h000;
            endcase
          end
          6'h25: begin
            case (mant[3:0])
              4'h0: out_low = 9'h071;
              4'h1: out_low = 9'h06d;
              4'h2: out_low = 9'h068;
              4'h3: out_low = 9'h064;
              4'h4: out_low = 9'h05f;
              4'h5: out_low = 9'h05b;
              4'h6: out_low = 9'h057;
              4'h7: out_low = 9'h052;
              4'h8: out_low = 9'h04e;
              4'h9: out_low = 9'h049;
              4'ha: out_low = 9'h045;
              4'hb: out_low = 9'h041;
              4'hc: out_low = 9'h03c;
              4'hd: out_low = 9'h038;
              4'he: out_low = 9'h034;
              4'hf: out_low = 9'h030;
              default: out_low = 9'h000;
            endcase
          end
          6'h26: begin
            case (mant[3:0])
              4'h0: out_low = 9'h02b;
              4'h1: out_low = 9'h027;
              4'h2: out_low = 9'h023;
              4'h3: out_low = 9'h01e;
              4'h4: out_low = 9'h01a;
              4'h5: out_low = 9'h016;
              4'h6: out_low = 9'h012;
              4'h7: out_low = 9'h00e;
              4'h8: out_low = 9'h009;
              4'h9: out_low = 9'h005;
              4'ha: out_low = 9'h001;
              4'hb: out_low = 9'h1fd;
              4'hc: out_low = 9'h1f9;
              4'hd: out_low = 9'h1f5;
              4'he: out_low = 9'h1f0;
              4'hf: out_low = 9'h1ec;
              default: out_low = 9'h000;
            endcase
          end
          6'h27: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1e8;
              4'h1: out_low = 9'h1e4;
              4'h2: out_low = 9'h1e0;
              4'h3: out_low = 9'h1dc;
              4'h4: out_low = 9'h1d8;
              4'h5: out_low = 9'h1d4;
              4'h6: out_low = 9'h1d0;
              4'h7: out_low = 9'h1cc;
              4'h8: out_low = 9'h1c8;
              4'h9: out_low = 9'h1c4;
              4'ha: out_low = 9'h1c0;
              4'hb: out_low = 9'h1bc;
              4'hc: out_low = 9'h1b8;
              4'hd: out_low = 9'h1b4;
              4'he: out_low = 9'h1b0;
              4'hf: out_low = 9'h1ac;
              default: out_low = 9'h000;
            endcase
          end
          6'h28: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1a8;
              4'h1: out_low = 9'h1a4;
              4'h2: out_low = 9'h1a0;
              4'h3: out_low = 9'h19c;
              4'h4: out_low = 9'h199;
              4'h5: out_low = 9'h195;
              4'h6: out_low = 9'h191;
              4'h7: out_low = 9'h18d;
              4'h8: out_low = 9'h189;
              4'h9: out_low = 9'h185;
              4'ha: out_low = 9'h181;
              4'hb: out_low = 9'h17e;
              4'hc: out_low = 9'h17a;
              4'hd: out_low = 9'h176;
              4'he: out_low = 9'h172;
              4'hf: out_low = 9'h16f;
              default: out_low = 9'h000;
            endcase
          end
          6'h29: begin
            case (mant[3:0])
              4'h0: out_low = 9'h16b;
              4'h1: out_low = 9'h167;
              4'h2: out_low = 9'h163;
              4'h3: out_low = 9'h160;
              4'h4: out_low = 9'h15c;
              4'h5: out_low = 9'h158;
              4'h6: out_low = 9'h154;
              4'h7: out_low = 9'h151;
              4'h8: out_low = 9'h14d;
              4'h9: out_low = 9'h149;
              4'ha: out_low = 9'h146;
              4'hb: out_low = 9'h142;
              4'hc: out_low = 9'h13e;
              4'hd: out_low = 9'h13b;
              4'he: out_low = 9'h137;
              4'hf: out_low = 9'h134;
              default: out_low = 9'h000;
            endcase
          end
          6'h2a: begin
            case (mant[3:0])
              4'h0: out_low = 9'h130;
              4'h1: out_low = 9'h12c;
              4'h2: out_low = 9'h129;
              4'h3: out_low = 9'h125;
              4'h4: out_low = 9'h122;
              4'h5: out_low = 9'h11e;
              4'h6: out_low = 9'h11b;
              4'h7: out_low = 9'h117;
              4'h8: out_low = 9'h114;
              4'h9: out_low = 9'h110;
              4'ha: out_low = 9'h10c;
              4'hb: out_low = 9'h109;
              4'hc: out_low = 9'h106;
              4'hd: out_low = 9'h102;
              4'he: out_low = 9'h0ff;
              4'hf: out_low = 9'h0fb;
              default: out_low = 9'h000;
            endcase
          end
          6'h2b: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0f8;
              4'h1: out_low = 9'h0f4;
              4'h2: out_low = 9'h0f1;
              4'h3: out_low = 9'h0ed;
              4'h4: out_low = 9'h0ea;
              4'h5: out_low = 9'h0e7;
              4'h6: out_low = 9'h0e3;
              4'h7: out_low = 9'h0e0;
              4'h8: out_low = 9'h0dc;
              4'h9: out_low = 9'h0d9;
              4'ha: out_low = 9'h0d6;
              4'hb: out_low = 9'h0d2;
              4'hc: out_low = 9'h0cf;
              4'hd: out_low = 9'h0cc;
              4'he: out_low = 9'h0c8;
              4'hf: out_low = 9'h0c5;
              default: out_low = 9'h000;
            endcase
          end
          6'h2c: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0c2;
              4'h1: out_low = 9'h0be;
              4'h2: out_low = 9'h0bb;
              4'h3: out_low = 9'h0b8;
              4'h4: out_low = 9'h0b5;
              4'h5: out_low = 9'h0b1;
              4'h6: out_low = 9'h0ae;
              4'h7: out_low = 9'h0ab;
              4'h8: out_low = 9'h0a8;
              4'h9: out_low = 9'h0a4;
              4'ha: out_low = 9'h0a1;
              4'hb: out_low = 9'h09e;
              4'hc: out_low = 9'h09b;
              4'hd: out_low = 9'h098;
              4'he: out_low = 9'h094;
              4'hf: out_low = 9'h091;
              default: out_low = 9'h000;
            endcase
          end
          6'h2d: begin
            case (mant[3:0])
              4'h0: out_low = 9'h08e;
              4'h1: out_low = 9'h08b;
              4'h2: out_low = 9'h088;
              4'h3: out_low = 9'h085;
              4'h4: out_low = 9'h082;
              4'h5: out_low = 9'h07e;
              4'h6: out_low = 9'h07b;
              4'h7: out_low = 9'h078;
              4'h8: out_low = 9'h075;
              4'h9: out_low = 9'h072;
              4'ha: out_low = 9'h06f;
              4'hb: out_low = 9'h06c;
              4'hc: out_low = 9'h069;
              4'hd: out_low = 9'h066;
              4'he: out_low = 9'h063;
              4'hf: out_low = 9'h060;
              default: out_low = 9'h000;
            endcase
          end
          6'h2e: begin
            case (mant[3:0])
              4'h0: out_low = 9'h05d;
              4'h1: out_low = 9'h05a;
              4'h2: out_low = 9'h057;
              4'h3: out_low = 9'h054;
              4'h4: out_low = 9'h051;
              4'h5: out_low = 9'h04e;
              4'h6: out_low = 9'h04b;
              4'h7: out_low = 9'h048;
              4'h8: out_low = 9'h045;
              4'h9: out_low = 9'h042;
              4'ha: out_low = 9'h03f;
              4'hb: out_low = 9'h03c;
              4'hc: out_low = 9'h039;
              4'hd: out_low = 9'h036;
              4'he: out_low = 9'h033;
              4'hf: out_low = 9'h030;
              default: out_low = 9'h000;
            endcase
          end
          6'h2f: begin
            case (mant[3:0])
              4'h0: out_low = 9'h02d;
              4'h1: out_low = 9'h02a;
              4'h2: out_low = 9'h028;
              4'h3: out_low = 9'h025;
              4'h4: out_low = 9'h022;
              4'h5: out_low = 9'h01f;
              4'h6: out_low = 9'h01c;
              4'h7: out_low = 9'h019;
              4'h8: out_low = 9'h016;
              4'h9: out_low = 9'h014;
              4'ha: out_low = 9'h011;
              4'hb: out_low = 9'h00e;
              4'hc: out_low = 9'h00b;
              4'hd: out_low = 9'h008;
              4'he: out_low = 9'h006;
              4'hf: out_low = 9'h003;
              default: out_low = 9'h000;
            endcase
          end
          6'h30: begin
            case (mant[3:0])
              4'h0: out_low = 9'h000;
              4'h1: out_low = 9'h1fa;
              4'h2: out_low = 9'h1f5;
              4'h3: out_low = 9'h1ef;
              4'h4: out_low = 9'h1ea;
              4'h5: out_low = 9'h1e4;
              4'h6: out_low = 9'h1df;
              4'h7: out_low = 9'h1da;
              4'h8: out_low = 9'h1d4;
              4'h9: out_low = 9'h1cf;
              4'ha: out_low = 9'h1c9;
              4'hb: out_low = 9'h1c4;
              4'hc: out_low = 9'h1bf;
              4'hd: out_low = 9'h1b9;
              4'he: out_low = 9'h1b4;
              4'hf: out_low = 9'h1ae;
              default: out_low = 9'h000;
            endcase
          end
          6'h31: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1a9;
              4'h1: out_low = 9'h1a4;
              4'h2: out_low = 9'h19f;
              4'h3: out_low = 9'h199;
              4'h4: out_low = 9'h194;
              4'h5: out_low = 9'h18f;
              4'h6: out_low = 9'h18a;
              4'h7: out_low = 9'h184;
              4'h8: out_low = 9'h17f;
              4'h9: out_low = 9'h17a;
              4'ha: out_low = 9'h175;
              4'hb: out_low = 9'h170;
              4'hc: out_low = 9'h16a;
              4'hd: out_low = 9'h165;
              4'he: out_low = 9'h160;
              4'hf: out_low = 9'h15b;
              default: out_low = 9'h000;
            endcase
          end
          6'h32: begin
            case (mant[3:0])
              4'h0: out_low = 9'h156;
              4'h1: out_low = 9'h151;
              4'h2: out_low = 9'h14c;
              4'h3: out_low = 9'h147;
              4'h4: out_low = 9'h142;
              4'h5: out_low = 9'h13d;
              4'h6: out_low = 9'h138;
              4'h7: out_low = 9'h133;
              4'h8: out_low = 9'h12e;
              4'h9: out_low = 9'h129;
              4'ha: out_low = 9'h124;
              4'hb: out_low = 9'h11f;
              4'hc: out_low = 9'h11a;
              4'hd: out_low = 9'h115;
              4'he: out_low = 9'h110;
              4'hf: out_low = 9'h10b;
              default: out_low = 9'h000;
            endcase
          end
          6'h33: begin
            case (mant[3:0])
              4'h0: out_low = 9'h106;
              4'h1: out_low = 9'h102;
              4'h2: out_low = 9'h0fd;
              4'h3: out_low = 9'h0f8;
              4'h4: out_low = 9'h0f3;
              4'h5: out_low = 9'h0ee;
              4'h6: out_low = 9'h0e9;
              4'h7: out_low = 9'h0e5;
              4'h8: out_low = 9'h0e0;
              4'h9: out_low = 9'h0db;
              4'ha: out_low = 9'h0d6;
              4'hb: out_low = 9'h0d2;
              4'hc: out_low = 9'h0cd;
              4'hd: out_low = 9'h0c8;
              4'he: out_low = 9'h0c4;
              4'hf: out_low = 9'h0bf;
              default: out_low = 9'h000;
            endcase
          end
          6'h34: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0ba;
              4'h1: out_low = 9'h0b5;
              4'h2: out_low = 9'h0b1;
              4'h3: out_low = 9'h0ac;
              4'h4: out_low = 9'h0a8;
              4'h5: out_low = 9'h0a3;
              4'h6: out_low = 9'h09e;
              4'h7: out_low = 9'h09a;
              4'h8: out_low = 9'h095;
              4'h9: out_low = 9'h091;
              4'ha: out_low = 9'h08c;
              4'hb: out_low = 9'h088;
              4'hc: out_low = 9'h083;
              4'hd: out_low = 9'h07f;
              4'he: out_low = 9'h07a;
              4'hf: out_low = 9'h076;
              default: out_low = 9'h000;
            endcase
          end
          6'h35: begin
            case (mant[3:0])
              4'h0: out_low = 9'h071;
              4'h1: out_low = 9'h06d;
              4'h2: out_low = 9'h068;
              4'h3: out_low = 9'h064;
              4'h4: out_low = 9'h05f;
              4'h5: out_low = 9'h05b;
              4'h6: out_low = 9'h057;
              4'h7: out_low = 9'h052;
              4'h8: out_low = 9'h04e;
              4'h9: out_low = 9'h049;
              4'ha: out_low = 9'h045;
              4'hb: out_low = 9'h041;
              4'hc: out_low = 9'h03c;
              4'hd: out_low = 9'h038;
              4'he: out_low = 9'h034;
              4'hf: out_low = 9'h030;
              default: out_low = 9'h000;
            endcase
          end
          6'h36: begin
            case (mant[3:0])
              4'h0: out_low = 9'h02b;
              4'h1: out_low = 9'h027;
              4'h2: out_low = 9'h023;
              4'h3: out_low = 9'h01e;
              4'h4: out_low = 9'h01a;
              4'h5: out_low = 9'h016;
              4'h6: out_low = 9'h012;
              4'h7: out_low = 9'h00e;
              4'h8: out_low = 9'h009;
              4'h9: out_low = 9'h005;
              4'ha: out_low = 9'h001;
              4'hb: out_low = 9'h1fd;
              4'hc: out_low = 9'h1f9;
              4'hd: out_low = 9'h1f5;
              4'he: out_low = 9'h1f0;
              4'hf: out_low = 9'h1ec;
              default: out_low = 9'h000;
            endcase
          end
          6'h37: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1e8;
              4'h1: out_low = 9'h1e4;
              4'h2: out_low = 9'h1e0;
              4'h3: out_low = 9'h1dc;
              4'h4: out_low = 9'h1d8;
              4'h5: out_low = 9'h1d4;
              4'h6: out_low = 9'h1d0;
              4'h7: out_low = 9'h1cc;
              4'h8: out_low = 9'h1c8;
              4'h9: out_low = 9'h1c4;
              4'ha: out_low = 9'h1c0;
              4'hb: out_low = 9'h1bc;
              4'hc: out_low = 9'h1b8;
              4'hd: out_low = 9'h1b4;
              4'he: out_low = 9'h1b0;
              4'hf: out_low = 9'h1ac;
              default: out_low = 9'h000;
            endcase
          end
          6'h38: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1a8;
              4'h1: out_low = 9'h1a4;
              4'h2: out_low = 9'h1a0;
              4'h3: out_low = 9'h19c;
              4'h4: out_low = 9'h199;
              4'h5: out_low = 9'h195;
              4'h6: out_low = 9'h191;
              4'h7: out_low = 9'h18d;
              4'h8: out_low = 9'h189;
              4'h9: out_low = 9'h185;
              4'ha: out_low = 9'h181;
              4'hb: out_low = 9'h17e;
              4'hc: out_low = 9'h17a;
              4'hd: out_low = 9'h176;
              4'he: out_low = 9'h172;
              4'hf: out_low = 9'h16f;
              default: out_low = 9'h000;
            endcase
          end
          6'h39: begin
            case (mant[3:0])
              4'h0: out_low = 9'h16b;
              4'h1: out_low = 9'h167;
              4'h2: out_low = 9'h163;
              4'h3: out_low = 9'h160;
              4'h4: out_low = 9'h15c;
              4'h5: out_low = 9'h158;
              4'h6: out_low = 9'h154;
              4'h7: out_low = 9'h151;
              4'h8: out_low = 9'h14d;
              4'h9: out_low = 9'h149;
              4'ha: out_low = 9'h146;
              4'hb: out_low = 9'h142;
              4'hc: out_low = 9'h13e;
              4'hd: out_low = 9'h13b;
              4'he: out_low = 9'h137;
              4'hf: out_low = 9'h134;
              default: out_low = 9'h000;
            endcase
          end
          6'h3a: begin
            case (mant[3:0])
              4'h0: out_low = 9'h130;
              4'h1: out_low = 9'h12c;
              4'h2: out_low = 9'h129;
              4'h3: out_low = 9'h125;
              4'h4: out_low = 9'h122;
              4'h5: out_low = 9'h11e;
              4'h6: out_low = 9'h11b;
              4'h7: out_low = 9'h117;
              4'h8: out_low = 9'h114;
              4'h9: out_low = 9'h110;
              4'ha: out_low = 9'h10c;
              4'hb: out_low = 9'h109;
              4'hc: out_low = 9'h106;
              4'hd: out_low = 9'h102;
              4'he: out_low = 9'h0ff;
              4'hf: out_low = 9'h0fb;
              default: out_low = 9'h000;
            endcase
          end
          6'h3b: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0f8;
              4'h1: out_low = 9'h0f4;
              4'h2: out_low = 9'h0f1;
              4'h3: out_low = 9'h0ed;
              4'h4: out_low = 9'h0ea;
              4'h5: out_low = 9'h0e7;
              4'h6: out_low = 9'h0e3;
              4'h7: out_low = 9'h0e0;
              4'h8: out_low = 9'h0dc;
              4'h9: out_low = 9'h0d9;
              4'ha: out_low = 9'h0d6;
              4'hb: out_low = 9'h0d2;
              4'hc: out_low = 9'h0cf;
              4'hd: out_low = 9'h0cc;
              4'he: out_low = 9'h0c8;
              4'hf: out_low = 9'h0c5;
              default: out_low = 9'h000;
            endcase
          end
          6'h3c: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0c2;
              4'h1: out_low = 9'h0be;
              4'h2: out_low = 9'h0bb;
              4'h3: out_low = 9'h0b8;
              4'h4: out_low = 9'h0b5;
              4'h5: out_low = 9'h0b1;
              4'h6: out_low = 9'h0ae;
              4'h7: out_low = 9'h0ab;
              4'h8: out_low = 9'h0a8;
              4'h9: out_low = 9'h0a4;
              4'ha: out_low = 9'h0a1;
              4'hb: out_low = 9'h09e;
              4'hc: out_low = 9'h09b;
              4'hd: out_low = 9'h098;
              4'he: out_low = 9'h094;
              4'hf: out_low = 9'h091;
              default: out_low = 9'h000;
            endcase
          end
          6'h3d: begin
            case (mant[3:0])
              4'h0: out_low = 9'h08e;
              4'h1: out_low = 9'h08b;
              4'h2: out_low = 9'h088;
              4'h3: out_low = 9'h085;
              4'h4: out_low = 9'h082;
              4'h5: out_low = 9'h07e;
              4'h6: out_low = 9'h07b;
              4'h7: out_low = 9'h078;
              4'h8: out_low = 9'h075;
              4'h9: out_low = 9'h072;
              4'ha: out_low = 9'h06f;
              4'hb: out_low = 9'h06c;
              4'hc: out_low = 9'h069;
              4'hd: out_low = 9'h066;
              4'he: out_low = 9'h063;
              4'hf: out_low = 9'h060;
              default: out_low = 9'h000;
            endcase
          end
          6'h3e: begin
            case (mant[3:0])
              4'h0: out_low = 9'h05d;
              4'h1: out_low = 9'h05a;
              4'h2: out_low = 9'h057;
              4'h3: out_low = 9'h054;
              4'h4: out_low = 9'h051;
              4'h5: out_low = 9'h04e;
              4'h6: out_low = 9'h04b;
              4'h7: out_low = 9'h048;
              4'h8: out_low = 9'h045;
              4'h9: out_low = 9'h042;
              4'ha: out_low = 9'h03f;
              4'hb: out_low = 9'h03c;
              4'hc: out_low = 9'h039;
              4'hd: out_low = 9'h036;
              4'he: out_low = 9'h033;
              4'hf: out_low = 9'h030;
              default: out_low = 9'h000;
            endcase
          end
          6'h3f: begin
            case (mant[3:0])
              4'h0: out_low = 9'h02d;
              4'h1: out_low = 9'h02a;
              4'h2: out_low = 9'h028;
              4'h3: out_low = 9'h025;
              4'h4: out_low = 9'h022;
              4'h5: out_low = 9'h01f;
              4'h6: out_low = 9'h01c;
              4'h7: out_low = 9'h019;
              4'h8: out_low = 9'h016;
              4'h9: out_low = 9'h014;
              4'ha: out_low = 9'h011;
              4'hb: out_low = 9'h00e;
              4'hc: out_low = 9'h00b;
              4'hd: out_low = 9'h008;
              4'he: out_low = 9'h006;
              4'hf: out_low = 9'h003;
              default: out_low = 9'h000;
            endcase
          end
          default: out_low = 9'h000;
        endcase
      end
      6'h32: begin
        case (mant[9:4])
          6'h00: begin
            case (mant[3:0])
              4'h0: out_low = 9'h000;
              4'h1: out_low = 9'h1f5;
              4'h2: out_low = 9'h1ea;
              4'h3: out_low = 9'h1df;
              4'h4: out_low = 9'h1d4;
              4'h5: out_low = 9'h1c9;
              4'h6: out_low = 9'h1bf;
              4'h7: out_low = 9'h1b4;
              4'h8: out_low = 9'h1a9;
              4'h9: out_low = 9'h19f;
              4'ha: out_low = 9'h194;
              4'hb: out_low = 9'h18a;
              4'hc: out_low = 9'h17f;
              4'hd: out_low = 9'h175;
              4'he: out_low = 9'h16a;
              4'hf: out_low = 9'h160;
              default: out_low = 9'h000;
            endcase
          end
          6'h01: begin
            case (mant[3:0])
              4'h0: out_low = 9'h156;
              4'h1: out_low = 9'h14c;
              4'h2: out_low = 9'h142;
              4'h3: out_low = 9'h138;
              4'h4: out_low = 9'h12e;
              4'h5: out_low = 9'h124;
              4'h6: out_low = 9'h11a;
              4'h7: out_low = 9'h110;
              4'h8: out_low = 9'h106;
              4'h9: out_low = 9'h0fd;
              4'ha: out_low = 9'h0f3;
              4'hb: out_low = 9'h0e9;
              4'hc: out_low = 9'h0e0;
              4'hd: out_low = 9'h0d6;
              4'he: out_low = 9'h0cd;
              4'hf: out_low = 9'h0c4;
              default: out_low = 9'h000;
            endcase
          end
          6'h02: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0ba;
              4'h1: out_low = 9'h0b1;
              4'h2: out_low = 9'h0a8;
              4'h3: out_low = 9'h09e;
              4'h4: out_low = 9'h095;
              4'h5: out_low = 9'h08c;
              4'h6: out_low = 9'h083;
              4'h7: out_low = 9'h07a;
              4'h8: out_low = 9'h071;
              4'h9: out_low = 9'h068;
              4'ha: out_low = 9'h05f;
              4'hb: out_low = 9'h057;
              4'hc: out_low = 9'h04e;
              4'hd: out_low = 9'h045;
              4'he: out_low = 9'h03c;
              4'hf: out_low = 9'h034;
              default: out_low = 9'h000;
            endcase
          end
          6'h03: begin
            case (mant[3:0])
              4'h0: out_low = 9'h02b;
              4'h1: out_low = 9'h023;
              4'h2: out_low = 9'h01a;
              4'h3: out_low = 9'h012;
              4'h4: out_low = 9'h009;
              4'h5: out_low = 9'h001;
              4'h6: out_low = 9'h1f9;
              4'h7: out_low = 9'h1f0;
              4'h8: out_low = 9'h1e8;
              4'h9: out_low = 9'h1e0;
              4'ha: out_low = 9'h1d8;
              4'hb: out_low = 9'h1d0;
              4'hc: out_low = 9'h1c8;
              4'hd: out_low = 9'h1c0;
              4'he: out_low = 9'h1b8;
              4'hf: out_low = 9'h1b0;
              default: out_low = 9'h000;
            endcase
          end
          6'h04: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1a8;
              4'h1: out_low = 9'h1a0;
              4'h2: out_low = 9'h199;
              4'h3: out_low = 9'h191;
              4'h4: out_low = 9'h189;
              4'h5: out_low = 9'h181;
              4'h6: out_low = 9'h17a;
              4'h7: out_low = 9'h172;
              4'h8: out_low = 9'h16b;
              4'h9: out_low = 9'h163;
              4'ha: out_low = 9'h15c;
              4'hb: out_low = 9'h154;
              4'hc: out_low = 9'h14d;
              4'hd: out_low = 9'h146;
              4'he: out_low = 9'h13e;
              4'hf: out_low = 9'h137;
              default: out_low = 9'h000;
            endcase
          end
          6'h05: begin
            case (mant[3:0])
              4'h0: out_low = 9'h130;
              4'h1: out_low = 9'h129;
              4'h2: out_low = 9'h122;
              4'h3: out_low = 9'h11b;
              4'h4: out_low = 9'h114;
              4'h5: out_low = 9'h10c;
              4'h6: out_low = 9'h106;
              4'h7: out_low = 9'h0ff;
              4'h8: out_low = 9'h0f8;
              4'h9: out_low = 9'h0f1;
              4'ha: out_low = 9'h0ea;
              4'hb: out_low = 9'h0e3;
              4'hc: out_low = 9'h0dc;
              4'hd: out_low = 9'h0d6;
              4'he: out_low = 9'h0cf;
              4'hf: out_low = 9'h0c8;
              default: out_low = 9'h000;
            endcase
          end
          6'h06: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0c2;
              4'h1: out_low = 9'h0bb;
              4'h2: out_low = 9'h0b5;
              4'h3: out_low = 9'h0ae;
              4'h4: out_low = 9'h0a8;
              4'h5: out_low = 9'h0a1;
              4'h6: out_low = 9'h09b;
              4'h7: out_low = 9'h094;
              4'h8: out_low = 9'h08e;
              4'h9: out_low = 9'h088;
              4'ha: out_low = 9'h082;
              4'hb: out_low = 9'h07b;
              4'hc: out_low = 9'h075;
              4'hd: out_low = 9'h06f;
              4'he: out_low = 9'h069;
              4'hf: out_low = 9'h063;
              default: out_low = 9'h000;
            endcase
          end
          6'h07: begin
            case (mant[3:0])
              4'h0: out_low = 9'h05d;
              4'h1: out_low = 9'h057;
              4'h2: out_low = 9'h051;
              4'h3: out_low = 9'h04b;
              4'h4: out_low = 9'h045;
              4'h5: out_low = 9'h03f;
              4'h6: out_low = 9'h039;
              4'h7: out_low = 9'h033;
              4'h8: out_low = 9'h02d;
              4'h9: out_low = 9'h028;
              4'ha: out_low = 9'h022;
              4'hb: out_low = 9'h01c;
              4'hc: out_low = 9'h016;
              4'hd: out_low = 9'h011;
              4'he: out_low = 9'h00b;
              4'hf: out_low = 9'h006;
              default: out_low = 9'h000;
            endcase
          end
          6'h08: begin
            case (mant[3:0])
              4'h0: out_low = 9'h000;
              4'h1: out_low = 9'h1f5;
              4'h2: out_low = 9'h1ea;
              4'h3: out_low = 9'h1df;
              4'h4: out_low = 9'h1d4;
              4'h5: out_low = 9'h1c9;
              4'h6: out_low = 9'h1bf;
              4'h7: out_low = 9'h1b4;
              4'h8: out_low = 9'h1a9;
              4'h9: out_low = 9'h19f;
              4'ha: out_low = 9'h194;
              4'hb: out_low = 9'h18a;
              4'hc: out_low = 9'h17f;
              4'hd: out_low = 9'h175;
              4'he: out_low = 9'h16a;
              4'hf: out_low = 9'h160;
              default: out_low = 9'h000;
            endcase
          end
          6'h09: begin
            case (mant[3:0])
              4'h0: out_low = 9'h156;
              4'h1: out_low = 9'h14c;
              4'h2: out_low = 9'h142;
              4'h3: out_low = 9'h138;
              4'h4: out_low = 9'h12e;
              4'h5: out_low = 9'h124;
              4'h6: out_low = 9'h11a;
              4'h7: out_low = 9'h110;
              4'h8: out_low = 9'h106;
              4'h9: out_low = 9'h0fd;
              4'ha: out_low = 9'h0f3;
              4'hb: out_low = 9'h0e9;
              4'hc: out_low = 9'h0e0;
              4'hd: out_low = 9'h0d6;
              4'he: out_low = 9'h0cd;
              4'hf: out_low = 9'h0c4;
              default: out_low = 9'h000;
            endcase
          end
          6'h0a: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0ba;
              4'h1: out_low = 9'h0b1;
              4'h2: out_low = 9'h0a8;
              4'h3: out_low = 9'h09e;
              4'h4: out_low = 9'h095;
              4'h5: out_low = 9'h08c;
              4'h6: out_low = 9'h083;
              4'h7: out_low = 9'h07a;
              4'h8: out_low = 9'h071;
              4'h9: out_low = 9'h068;
              4'ha: out_low = 9'h05f;
              4'hb: out_low = 9'h057;
              4'hc: out_low = 9'h04e;
              4'hd: out_low = 9'h045;
              4'he: out_low = 9'h03c;
              4'hf: out_low = 9'h034;
              default: out_low = 9'h000;
            endcase
          end
          6'h0b: begin
            case (mant[3:0])
              4'h0: out_low = 9'h02b;
              4'h1: out_low = 9'h023;
              4'h2: out_low = 9'h01a;
              4'h3: out_low = 9'h012;
              4'h4: out_low = 9'h009;
              4'h5: out_low = 9'h001;
              4'h6: out_low = 9'h1f9;
              4'h7: out_low = 9'h1f0;
              4'h8: out_low = 9'h1e8;
              4'h9: out_low = 9'h1e0;
              4'ha: out_low = 9'h1d8;
              4'hb: out_low = 9'h1d0;
              4'hc: out_low = 9'h1c8;
              4'hd: out_low = 9'h1c0;
              4'he: out_low = 9'h1b8;
              4'hf: out_low = 9'h1b0;
              default: out_low = 9'h000;
            endcase
          end
          6'h0c: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1a8;
              4'h1: out_low = 9'h1a0;
              4'h2: out_low = 9'h199;
              4'h3: out_low = 9'h191;
              4'h4: out_low = 9'h189;
              4'h5: out_low = 9'h181;
              4'h6: out_low = 9'h17a;
              4'h7: out_low = 9'h172;
              4'h8: out_low = 9'h16b;
              4'h9: out_low = 9'h163;
              4'ha: out_low = 9'h15c;
              4'hb: out_low = 9'h154;
              4'hc: out_low = 9'h14d;
              4'hd: out_low = 9'h146;
              4'he: out_low = 9'h13e;
              4'hf: out_low = 9'h137;
              default: out_low = 9'h000;
            endcase
          end
          6'h0d: begin
            case (mant[3:0])
              4'h0: out_low = 9'h130;
              4'h1: out_low = 9'h129;
              4'h2: out_low = 9'h122;
              4'h3: out_low = 9'h11b;
              4'h4: out_low = 9'h114;
              4'h5: out_low = 9'h10c;
              4'h6: out_low = 9'h106;
              4'h7: out_low = 9'h0ff;
              4'h8: out_low = 9'h0f8;
              4'h9: out_low = 9'h0f1;
              4'ha: out_low = 9'h0ea;
              4'hb: out_low = 9'h0e3;
              4'hc: out_low = 9'h0dc;
              4'hd: out_low = 9'h0d6;
              4'he: out_low = 9'h0cf;
              4'hf: out_low = 9'h0c8;
              default: out_low = 9'h000;
            endcase
          end
          6'h0e: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0c2;
              4'h1: out_low = 9'h0bb;
              4'h2: out_low = 9'h0b5;
              4'h3: out_low = 9'h0ae;
              4'h4: out_low = 9'h0a8;
              4'h5: out_low = 9'h0a1;
              4'h6: out_low = 9'h09b;
              4'h7: out_low = 9'h094;
              4'h8: out_low = 9'h08e;
              4'h9: out_low = 9'h088;
              4'ha: out_low = 9'h082;
              4'hb: out_low = 9'h07b;
              4'hc: out_low = 9'h075;
              4'hd: out_low = 9'h06f;
              4'he: out_low = 9'h069;
              4'hf: out_low = 9'h063;
              default: out_low = 9'h000;
            endcase
          end
          6'h0f: begin
            case (mant[3:0])
              4'h0: out_low = 9'h05d;
              4'h1: out_low = 9'h057;
              4'h2: out_low = 9'h051;
              4'h3: out_low = 9'h04b;
              4'h4: out_low = 9'h045;
              4'h5: out_low = 9'h03f;
              4'h6: out_low = 9'h039;
              4'h7: out_low = 9'h033;
              4'h8: out_low = 9'h02d;
              4'h9: out_low = 9'h028;
              4'ha: out_low = 9'h022;
              4'hb: out_low = 9'h01c;
              4'hc: out_low = 9'h016;
              4'hd: out_low = 9'h011;
              4'he: out_low = 9'h00b;
              4'hf: out_low = 9'h006;
              default: out_low = 9'h000;
            endcase
          end
          6'h10: begin
            case (mant[3:0])
              4'h0: out_low = 9'h000;
              4'h1: out_low = 9'h1f5;
              4'h2: out_low = 9'h1ea;
              4'h3: out_low = 9'h1df;
              4'h4: out_low = 9'h1d4;
              4'h5: out_low = 9'h1c9;
              4'h6: out_low = 9'h1bf;
              4'h7: out_low = 9'h1b4;
              4'h8: out_low = 9'h1a9;
              4'h9: out_low = 9'h19f;
              4'ha: out_low = 9'h194;
              4'hb: out_low = 9'h18a;
              4'hc: out_low = 9'h17f;
              4'hd: out_low = 9'h175;
              4'he: out_low = 9'h16a;
              4'hf: out_low = 9'h160;
              default: out_low = 9'h000;
            endcase
          end
          6'h11: begin
            case (mant[3:0])
              4'h0: out_low = 9'h156;
              4'h1: out_low = 9'h14c;
              4'h2: out_low = 9'h142;
              4'h3: out_low = 9'h138;
              4'h4: out_low = 9'h12e;
              4'h5: out_low = 9'h124;
              4'h6: out_low = 9'h11a;
              4'h7: out_low = 9'h110;
              4'h8: out_low = 9'h106;
              4'h9: out_low = 9'h0fd;
              4'ha: out_low = 9'h0f3;
              4'hb: out_low = 9'h0e9;
              4'hc: out_low = 9'h0e0;
              4'hd: out_low = 9'h0d6;
              4'he: out_low = 9'h0cd;
              4'hf: out_low = 9'h0c4;
              default: out_low = 9'h000;
            endcase
          end
          6'h12: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0ba;
              4'h1: out_low = 9'h0b1;
              4'h2: out_low = 9'h0a8;
              4'h3: out_low = 9'h09e;
              4'h4: out_low = 9'h095;
              4'h5: out_low = 9'h08c;
              4'h6: out_low = 9'h083;
              4'h7: out_low = 9'h07a;
              4'h8: out_low = 9'h071;
              4'h9: out_low = 9'h068;
              4'ha: out_low = 9'h05f;
              4'hb: out_low = 9'h057;
              4'hc: out_low = 9'h04e;
              4'hd: out_low = 9'h045;
              4'he: out_low = 9'h03c;
              4'hf: out_low = 9'h034;
              default: out_low = 9'h000;
            endcase
          end
          6'h13: begin
            case (mant[3:0])
              4'h0: out_low = 9'h02b;
              4'h1: out_low = 9'h023;
              4'h2: out_low = 9'h01a;
              4'h3: out_low = 9'h012;
              4'h4: out_low = 9'h009;
              4'h5: out_low = 9'h001;
              4'h6: out_low = 9'h1f9;
              4'h7: out_low = 9'h1f0;
              4'h8: out_low = 9'h1e8;
              4'h9: out_low = 9'h1e0;
              4'ha: out_low = 9'h1d8;
              4'hb: out_low = 9'h1d0;
              4'hc: out_low = 9'h1c8;
              4'hd: out_low = 9'h1c0;
              4'he: out_low = 9'h1b8;
              4'hf: out_low = 9'h1b0;
              default: out_low = 9'h000;
            endcase
          end
          6'h14: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1a8;
              4'h1: out_low = 9'h1a0;
              4'h2: out_low = 9'h199;
              4'h3: out_low = 9'h191;
              4'h4: out_low = 9'h189;
              4'h5: out_low = 9'h181;
              4'h6: out_low = 9'h17a;
              4'h7: out_low = 9'h172;
              4'h8: out_low = 9'h16b;
              4'h9: out_low = 9'h163;
              4'ha: out_low = 9'h15c;
              4'hb: out_low = 9'h154;
              4'hc: out_low = 9'h14d;
              4'hd: out_low = 9'h146;
              4'he: out_low = 9'h13e;
              4'hf: out_low = 9'h137;
              default: out_low = 9'h000;
            endcase
          end
          6'h15: begin
            case (mant[3:0])
              4'h0: out_low = 9'h130;
              4'h1: out_low = 9'h129;
              4'h2: out_low = 9'h122;
              4'h3: out_low = 9'h11b;
              4'h4: out_low = 9'h114;
              4'h5: out_low = 9'h10c;
              4'h6: out_low = 9'h106;
              4'h7: out_low = 9'h0ff;
              4'h8: out_low = 9'h0f8;
              4'h9: out_low = 9'h0f1;
              4'ha: out_low = 9'h0ea;
              4'hb: out_low = 9'h0e3;
              4'hc: out_low = 9'h0dc;
              4'hd: out_low = 9'h0d6;
              4'he: out_low = 9'h0cf;
              4'hf: out_low = 9'h0c8;
              default: out_low = 9'h000;
            endcase
          end
          6'h16: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0c2;
              4'h1: out_low = 9'h0bb;
              4'h2: out_low = 9'h0b5;
              4'h3: out_low = 9'h0ae;
              4'h4: out_low = 9'h0a8;
              4'h5: out_low = 9'h0a1;
              4'h6: out_low = 9'h09b;
              4'h7: out_low = 9'h094;
              4'h8: out_low = 9'h08e;
              4'h9: out_low = 9'h088;
              4'ha: out_low = 9'h082;
              4'hb: out_low = 9'h07b;
              4'hc: out_low = 9'h075;
              4'hd: out_low = 9'h06f;
              4'he: out_low = 9'h069;
              4'hf: out_low = 9'h063;
              default: out_low = 9'h000;
            endcase
          end
          6'h17: begin
            case (mant[3:0])
              4'h0: out_low = 9'h05d;
              4'h1: out_low = 9'h057;
              4'h2: out_low = 9'h051;
              4'h3: out_low = 9'h04b;
              4'h4: out_low = 9'h045;
              4'h5: out_low = 9'h03f;
              4'h6: out_low = 9'h039;
              4'h7: out_low = 9'h033;
              4'h8: out_low = 9'h02d;
              4'h9: out_low = 9'h028;
              4'ha: out_low = 9'h022;
              4'hb: out_low = 9'h01c;
              4'hc: out_low = 9'h016;
              4'hd: out_low = 9'h011;
              4'he: out_low = 9'h00b;
              4'hf: out_low = 9'h006;
              default: out_low = 9'h000;
            endcase
          end
          6'h18: begin
            case (mant[3:0])
              4'h0: out_low = 9'h000;
              4'h1: out_low = 9'h1f5;
              4'h2: out_low = 9'h1ea;
              4'h3: out_low = 9'h1df;
              4'h4: out_low = 9'h1d4;
              4'h5: out_low = 9'h1c9;
              4'h6: out_low = 9'h1bf;
              4'h7: out_low = 9'h1b4;
              4'h8: out_low = 9'h1a9;
              4'h9: out_low = 9'h19f;
              4'ha: out_low = 9'h194;
              4'hb: out_low = 9'h18a;
              4'hc: out_low = 9'h17f;
              4'hd: out_low = 9'h175;
              4'he: out_low = 9'h16a;
              4'hf: out_low = 9'h160;
              default: out_low = 9'h000;
            endcase
          end
          6'h19: begin
            case (mant[3:0])
              4'h0: out_low = 9'h156;
              4'h1: out_low = 9'h14c;
              4'h2: out_low = 9'h142;
              4'h3: out_low = 9'h138;
              4'h4: out_low = 9'h12e;
              4'h5: out_low = 9'h124;
              4'h6: out_low = 9'h11a;
              4'h7: out_low = 9'h110;
              4'h8: out_low = 9'h106;
              4'h9: out_low = 9'h0fd;
              4'ha: out_low = 9'h0f3;
              4'hb: out_low = 9'h0e9;
              4'hc: out_low = 9'h0e0;
              4'hd: out_low = 9'h0d6;
              4'he: out_low = 9'h0cd;
              4'hf: out_low = 9'h0c4;
              default: out_low = 9'h000;
            endcase
          end
          6'h1a: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0ba;
              4'h1: out_low = 9'h0b1;
              4'h2: out_low = 9'h0a8;
              4'h3: out_low = 9'h09e;
              4'h4: out_low = 9'h095;
              4'h5: out_low = 9'h08c;
              4'h6: out_low = 9'h083;
              4'h7: out_low = 9'h07a;
              4'h8: out_low = 9'h071;
              4'h9: out_low = 9'h068;
              4'ha: out_low = 9'h05f;
              4'hb: out_low = 9'h057;
              4'hc: out_low = 9'h04e;
              4'hd: out_low = 9'h045;
              4'he: out_low = 9'h03c;
              4'hf: out_low = 9'h034;
              default: out_low = 9'h000;
            endcase
          end
          6'h1b: begin
            case (mant[3:0])
              4'h0: out_low = 9'h02b;
              4'h1: out_low = 9'h023;
              4'h2: out_low = 9'h01a;
              4'h3: out_low = 9'h012;
              4'h4: out_low = 9'h009;
              4'h5: out_low = 9'h001;
              4'h6: out_low = 9'h1f9;
              4'h7: out_low = 9'h1f0;
              4'h8: out_low = 9'h1e8;
              4'h9: out_low = 9'h1e0;
              4'ha: out_low = 9'h1d8;
              4'hb: out_low = 9'h1d0;
              4'hc: out_low = 9'h1c8;
              4'hd: out_low = 9'h1c0;
              4'he: out_low = 9'h1b8;
              4'hf: out_low = 9'h1b0;
              default: out_low = 9'h000;
            endcase
          end
          6'h1c: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1a8;
              4'h1: out_low = 9'h1a0;
              4'h2: out_low = 9'h199;
              4'h3: out_low = 9'h191;
              4'h4: out_low = 9'h189;
              4'h5: out_low = 9'h181;
              4'h6: out_low = 9'h17a;
              4'h7: out_low = 9'h172;
              4'h8: out_low = 9'h16b;
              4'h9: out_low = 9'h163;
              4'ha: out_low = 9'h15c;
              4'hb: out_low = 9'h154;
              4'hc: out_low = 9'h14d;
              4'hd: out_low = 9'h146;
              4'he: out_low = 9'h13e;
              4'hf: out_low = 9'h137;
              default: out_low = 9'h000;
            endcase
          end
          6'h1d: begin
            case (mant[3:0])
              4'h0: out_low = 9'h130;
              4'h1: out_low = 9'h129;
              4'h2: out_low = 9'h122;
              4'h3: out_low = 9'h11b;
              4'h4: out_low = 9'h114;
              4'h5: out_low = 9'h10c;
              4'h6: out_low = 9'h106;
              4'h7: out_low = 9'h0ff;
              4'h8: out_low = 9'h0f8;
              4'h9: out_low = 9'h0f1;
              4'ha: out_low = 9'h0ea;
              4'hb: out_low = 9'h0e3;
              4'hc: out_low = 9'h0dc;
              4'hd: out_low = 9'h0d6;
              4'he: out_low = 9'h0cf;
              4'hf: out_low = 9'h0c8;
              default: out_low = 9'h000;
            endcase
          end
          6'h1e: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0c2;
              4'h1: out_low = 9'h0bb;
              4'h2: out_low = 9'h0b5;
              4'h3: out_low = 9'h0ae;
              4'h4: out_low = 9'h0a8;
              4'h5: out_low = 9'h0a1;
              4'h6: out_low = 9'h09b;
              4'h7: out_low = 9'h094;
              4'h8: out_low = 9'h08e;
              4'h9: out_low = 9'h088;
              4'ha: out_low = 9'h082;
              4'hb: out_low = 9'h07b;
              4'hc: out_low = 9'h075;
              4'hd: out_low = 9'h06f;
              4'he: out_low = 9'h069;
              4'hf: out_low = 9'h063;
              default: out_low = 9'h000;
            endcase
          end
          6'h1f: begin
            case (mant[3:0])
              4'h0: out_low = 9'h05d;
              4'h1: out_low = 9'h057;
              4'h2: out_low = 9'h051;
              4'h3: out_low = 9'h04b;
              4'h4: out_low = 9'h045;
              4'h5: out_low = 9'h03f;
              4'h6: out_low = 9'h039;
              4'h7: out_low = 9'h033;
              4'h8: out_low = 9'h02d;
              4'h9: out_low = 9'h028;
              4'ha: out_low = 9'h022;
              4'hb: out_low = 9'h01c;
              4'hc: out_low = 9'h016;
              4'hd: out_low = 9'h011;
              4'he: out_low = 9'h00b;
              4'hf: out_low = 9'h006;
              default: out_low = 9'h000;
            endcase
          end
          6'h20: begin
            case (mant[3:0])
              4'h0: out_low = 9'h000;
              4'h1: out_low = 9'h1f5;
              4'h2: out_low = 9'h1ea;
              4'h3: out_low = 9'h1df;
              4'h4: out_low = 9'h1d4;
              4'h5: out_low = 9'h1c9;
              4'h6: out_low = 9'h1bf;
              4'h7: out_low = 9'h1b4;
              4'h8: out_low = 9'h1a9;
              4'h9: out_low = 9'h19f;
              4'ha: out_low = 9'h194;
              4'hb: out_low = 9'h18a;
              4'hc: out_low = 9'h17f;
              4'hd: out_low = 9'h175;
              4'he: out_low = 9'h16a;
              4'hf: out_low = 9'h160;
              default: out_low = 9'h000;
            endcase
          end
          6'h21: begin
            case (mant[3:0])
              4'h0: out_low = 9'h156;
              4'h1: out_low = 9'h14c;
              4'h2: out_low = 9'h142;
              4'h3: out_low = 9'h138;
              4'h4: out_low = 9'h12e;
              4'h5: out_low = 9'h124;
              4'h6: out_low = 9'h11a;
              4'h7: out_low = 9'h110;
              4'h8: out_low = 9'h106;
              4'h9: out_low = 9'h0fd;
              4'ha: out_low = 9'h0f3;
              4'hb: out_low = 9'h0e9;
              4'hc: out_low = 9'h0e0;
              4'hd: out_low = 9'h0d6;
              4'he: out_low = 9'h0cd;
              4'hf: out_low = 9'h0c4;
              default: out_low = 9'h000;
            endcase
          end
          6'h22: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0ba;
              4'h1: out_low = 9'h0b1;
              4'h2: out_low = 9'h0a8;
              4'h3: out_low = 9'h09e;
              4'h4: out_low = 9'h095;
              4'h5: out_low = 9'h08c;
              4'h6: out_low = 9'h083;
              4'h7: out_low = 9'h07a;
              4'h8: out_low = 9'h071;
              4'h9: out_low = 9'h068;
              4'ha: out_low = 9'h05f;
              4'hb: out_low = 9'h057;
              4'hc: out_low = 9'h04e;
              4'hd: out_low = 9'h045;
              4'he: out_low = 9'h03c;
              4'hf: out_low = 9'h034;
              default: out_low = 9'h000;
            endcase
          end
          6'h23: begin
            case (mant[3:0])
              4'h0: out_low = 9'h02b;
              4'h1: out_low = 9'h023;
              4'h2: out_low = 9'h01a;
              4'h3: out_low = 9'h012;
              4'h4: out_low = 9'h009;
              4'h5: out_low = 9'h001;
              4'h6: out_low = 9'h1f9;
              4'h7: out_low = 9'h1f0;
              4'h8: out_low = 9'h1e8;
              4'h9: out_low = 9'h1e0;
              4'ha: out_low = 9'h1d8;
              4'hb: out_low = 9'h1d0;
              4'hc: out_low = 9'h1c8;
              4'hd: out_low = 9'h1c0;
              4'he: out_low = 9'h1b8;
              4'hf: out_low = 9'h1b0;
              default: out_low = 9'h000;
            endcase
          end
          6'h24: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1a8;
              4'h1: out_low = 9'h1a0;
              4'h2: out_low = 9'h199;
              4'h3: out_low = 9'h191;
              4'h4: out_low = 9'h189;
              4'h5: out_low = 9'h181;
              4'h6: out_low = 9'h17a;
              4'h7: out_low = 9'h172;
              4'h8: out_low = 9'h16b;
              4'h9: out_low = 9'h163;
              4'ha: out_low = 9'h15c;
              4'hb: out_low = 9'h154;
              4'hc: out_low = 9'h14d;
              4'hd: out_low = 9'h146;
              4'he: out_low = 9'h13e;
              4'hf: out_low = 9'h137;
              default: out_low = 9'h000;
            endcase
          end
          6'h25: begin
            case (mant[3:0])
              4'h0: out_low = 9'h130;
              4'h1: out_low = 9'h129;
              4'h2: out_low = 9'h122;
              4'h3: out_low = 9'h11b;
              4'h4: out_low = 9'h114;
              4'h5: out_low = 9'h10c;
              4'h6: out_low = 9'h106;
              4'h7: out_low = 9'h0ff;
              4'h8: out_low = 9'h0f8;
              4'h9: out_low = 9'h0f1;
              4'ha: out_low = 9'h0ea;
              4'hb: out_low = 9'h0e3;
              4'hc: out_low = 9'h0dc;
              4'hd: out_low = 9'h0d6;
              4'he: out_low = 9'h0cf;
              4'hf: out_low = 9'h0c8;
              default: out_low = 9'h000;
            endcase
          end
          6'h26: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0c2;
              4'h1: out_low = 9'h0bb;
              4'h2: out_low = 9'h0b5;
              4'h3: out_low = 9'h0ae;
              4'h4: out_low = 9'h0a8;
              4'h5: out_low = 9'h0a1;
              4'h6: out_low = 9'h09b;
              4'h7: out_low = 9'h094;
              4'h8: out_low = 9'h08e;
              4'h9: out_low = 9'h088;
              4'ha: out_low = 9'h082;
              4'hb: out_low = 9'h07b;
              4'hc: out_low = 9'h075;
              4'hd: out_low = 9'h06f;
              4'he: out_low = 9'h069;
              4'hf: out_low = 9'h063;
              default: out_low = 9'h000;
            endcase
          end
          6'h27: begin
            case (mant[3:0])
              4'h0: out_low = 9'h05d;
              4'h1: out_low = 9'h057;
              4'h2: out_low = 9'h051;
              4'h3: out_low = 9'h04b;
              4'h4: out_low = 9'h045;
              4'h5: out_low = 9'h03f;
              4'h6: out_low = 9'h039;
              4'h7: out_low = 9'h033;
              4'h8: out_low = 9'h02d;
              4'h9: out_low = 9'h028;
              4'ha: out_low = 9'h022;
              4'hb: out_low = 9'h01c;
              4'hc: out_low = 9'h016;
              4'hd: out_low = 9'h011;
              4'he: out_low = 9'h00b;
              4'hf: out_low = 9'h006;
              default: out_low = 9'h000;
            endcase
          end
          6'h28: begin
            case (mant[3:0])
              4'h0: out_low = 9'h000;
              4'h1: out_low = 9'h1f5;
              4'h2: out_low = 9'h1ea;
              4'h3: out_low = 9'h1df;
              4'h4: out_low = 9'h1d4;
              4'h5: out_low = 9'h1c9;
              4'h6: out_low = 9'h1bf;
              4'h7: out_low = 9'h1b4;
              4'h8: out_low = 9'h1a9;
              4'h9: out_low = 9'h19f;
              4'ha: out_low = 9'h194;
              4'hb: out_low = 9'h18a;
              4'hc: out_low = 9'h17f;
              4'hd: out_low = 9'h175;
              4'he: out_low = 9'h16a;
              4'hf: out_low = 9'h160;
              default: out_low = 9'h000;
            endcase
          end
          6'h29: begin
            case (mant[3:0])
              4'h0: out_low = 9'h156;
              4'h1: out_low = 9'h14c;
              4'h2: out_low = 9'h142;
              4'h3: out_low = 9'h138;
              4'h4: out_low = 9'h12e;
              4'h5: out_low = 9'h124;
              4'h6: out_low = 9'h11a;
              4'h7: out_low = 9'h110;
              4'h8: out_low = 9'h106;
              4'h9: out_low = 9'h0fd;
              4'ha: out_low = 9'h0f3;
              4'hb: out_low = 9'h0e9;
              4'hc: out_low = 9'h0e0;
              4'hd: out_low = 9'h0d6;
              4'he: out_low = 9'h0cd;
              4'hf: out_low = 9'h0c4;
              default: out_low = 9'h000;
            endcase
          end
          6'h2a: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0ba;
              4'h1: out_low = 9'h0b1;
              4'h2: out_low = 9'h0a8;
              4'h3: out_low = 9'h09e;
              4'h4: out_low = 9'h095;
              4'h5: out_low = 9'h08c;
              4'h6: out_low = 9'h083;
              4'h7: out_low = 9'h07a;
              4'h8: out_low = 9'h071;
              4'h9: out_low = 9'h068;
              4'ha: out_low = 9'h05f;
              4'hb: out_low = 9'h057;
              4'hc: out_low = 9'h04e;
              4'hd: out_low = 9'h045;
              4'he: out_low = 9'h03c;
              4'hf: out_low = 9'h034;
              default: out_low = 9'h000;
            endcase
          end
          6'h2b: begin
            case (mant[3:0])
              4'h0: out_low = 9'h02b;
              4'h1: out_low = 9'h023;
              4'h2: out_low = 9'h01a;
              4'h3: out_low = 9'h012;
              4'h4: out_low = 9'h009;
              4'h5: out_low = 9'h001;
              4'h6: out_low = 9'h1f9;
              4'h7: out_low = 9'h1f0;
              4'h8: out_low = 9'h1e8;
              4'h9: out_low = 9'h1e0;
              4'ha: out_low = 9'h1d8;
              4'hb: out_low = 9'h1d0;
              4'hc: out_low = 9'h1c8;
              4'hd: out_low = 9'h1c0;
              4'he: out_low = 9'h1b8;
              4'hf: out_low = 9'h1b0;
              default: out_low = 9'h000;
            endcase
          end
          6'h2c: begin
            case (mant[3:0])
              4'h0: out_low = 9'h1a8;
              4'h1: out_low = 9'h1a0;
              4'h2: out_low = 9'h199;
              4'h3: out_low = 9'h191;
              4'h4: out_low = 9'h189;
              4'h5: out_low = 9'h181;
              4'h6: out_low = 9'h17a;
              4'h7: out_low = 9'h172;
              4'h8: out_low = 9'h16b;
              4'h9: out_low = 9'h163;
              4'ha: out_low = 9'h15c;
              4'hb: out_low = 9'h154;
              4'hc: out_low = 9'h14d;
              4'hd: out_low = 9'h146;
              4'he: out_low = 9'h13e;
              4'hf: out_low = 9'h137;
              default: out_low = 9'h000;
            endcase
          end
          6'h2d: begin
            case (mant[3:0])
              4'h0: out_low = 9'h130;
              4'h1: out_low = 9'h129;
              4'h2: out_low = 9'h122;
              4'h3: out_low = 9'h11b;
              4'h4: out_low = 9'h114;
              4'h5: out_low = 9'h10c;
              4'h6: out_low = 9'h106;
              4'h7: out_low = 9'h0ff;
              4'h8: out_low = 9'h0f8;
              4'h9: out_low = 9'h0f1;
              4'ha: out_low = 9'h0ea;
              4'hb: out_low = 9'h0e3;
              4'hc: out_low = 9'h0dc;
              4'hd: out_low = 9'h0d6;
              4'he: out_low = 9'h0cf;
              4'hf: out_low = 9'h0c8;
              default: out_low = 9'h000;
            endcase
          end
          6'h2e: begin
            case (mant[3:0])
              4'h0: out_low = 9'h0c2;
              4'h1: out_low = 9'h0bb;
              4'h2: out_low = 9'h0b5;
              4'h3: out_low = 9'h0ae;
              4'h4: out_low = 9'h0a8;
              4'h5: out_low = 9'h0a1;
              4'h6: out_low = 9'h09b;
              4'h7: out_low = 9'h094;
              4'h8: out_low = 9'h08e;
              4'h9: out_low = 9'h088;
              4'ha: out_low = 9'h082;
              4'hb: out_low = 9'h07b;
              4'hc: out_low = 9'h075;
              4'hd: out_low = 9'h06f;
              4'he: out_low = 9'h069;
              4'hf: out_low = 9'h063;
              default: out_low = 9'h000;
            endcase
          end
          6'h2f: begin
            case (mant[3:0])
              4'h0: out_low = 9'h05d;
              4'h1: out_low = 9'h057;
              4'h2: out_low = 9'h051;
              4'h3: out_low = 9'h04b;
              4'h4: out_low = 9'h045;
              4'h5: out_low = 9'h03f;
              4'h6: out_low = 9'h039;
              4'h7: out_low = 9'h033;
              4'h8: out_low = 9'h02d;
              4'h9: out_low = 9'h028;
              4'ha: out_low = 9'h022;
              4'hb: out_low = 9'h01c;
              4'hc: out_low = 9'h016;
              4'hd: out_low = 9'h011;
              4'he: out_low = 9'h00b;
              4'hf: out_low = 9'h006;
              default: out_low = 9'h000;
            endcase
          end
          6'h30: out_low = 9'h000;
          6'h31: out_low = 9'h000;
          6'h32: out_low = 9'h000;
          6'h33: out_low = 9'h000;
          6'h34: out_low = 9'h000;
          6'h35: out_low = 9'h000;
          6'h36: out_low = 9'h000;
          6'h37: out_low = 9'h000;
          6'h38: out_low = 9'h000;
          6'h39: out_low = 9'h000;
          6'h3a: out_low = 9'h000;
          6'h3b: out_low = 9'h000;
          6'h3c: out_low = 9'h000;
          6'h3d: out_low = 9'h000;
          6'h3e: out_low = 9'h000;
          6'h3f: out_low = 9'h000;
          default: out_low = 9'h000;
        endcase
      end
      6'h3f: begin
        case (mant[9:4])
          6'h00: out_low = 9'h000;
          6'h01: out_low = 9'h000;
          6'h02: out_low = 9'h000;
          6'h03: out_low = 9'h000;
          6'h04: out_low = 9'h000;
          6'h05: out_low = 9'h000;
          6'h06: out_low = 9'h000;
          6'h07: out_low = 9'h000;
          6'h08: out_low = 9'h000;
          6'h09: out_low = 9'h000;
          6'h0a: out_low = 9'h000;
          6'h0b: out_low = 9'h000;
          6'h0c: out_low = 9'h000;
          6'h0d: out_low = 9'h000;
          6'h0e: out_low = 9'h000;
          6'h0f: out_low = 9'h000;
          6'h10: out_low = 9'h000;
          6'h11: out_low = 9'h000;
          6'h12: out_low = 9'h000;
          6'h13: out_low = 9'h000;
          6'h14: out_low = 9'h000;
          6'h15: out_low = 9'h000;
          6'h16: out_low = 9'h000;
          6'h17: out_low = 9'h000;
          6'h18: out_low = 9'h000;
          6'h19: out_low = 9'h000;
          6'h1a: out_low = 9'h000;
          6'h1b: out_low = 9'h000;
          6'h1c: out_low = 9'h000;
          6'h1d: out_low = 9'h000;
          6'h1e: out_low = 9'h000;
          6'h1f: out_low = 9'h000;
          6'h20: out_low = 9'h000;
          6'h21: out_low = 9'h000;
          6'h22: out_low = 9'h000;
          6'h23: out_low = 9'h000;
          6'h24: out_low = 9'h000;
          6'h25: out_low = 9'h000;
          6'h26: out_low = 9'h000;
          6'h27: out_low = 9'h000;
          6'h28: out_low = 9'h000;
          6'h29: out_low = 9'h000;
          6'h2a: out_low = 9'h000;
          6'h2b: out_low = 9'h000;
          6'h2c: out_low = 9'h000;
          6'h2d: out_low = 9'h000;
          6'h2e: out_low = 9'h000;
          6'h2f: out_low = 9'h000;
          6'h30: out_low = 9'h000;
          6'h31: out_low = 9'h000;
          6'h32: out_low = 9'h000;
          6'h33: out_low = 9'h000;
          6'h34: out_low = 9'h000;
          6'h35: out_low = 9'h000;
          6'h36: out_low = 9'h000;
          6'h37: out_low = 9'h000;
          6'h38: out_low = 9'h000;
          6'h39: out_low = 9'h000;
          6'h3a: out_low = 9'h000;
          6'h3b: out_low = 9'h000;
          6'h3c: out_low = 9'h000;
          6'h3d: out_low = 9'h000;
          6'h3e: out_low = 9'h000;
          6'h3f: out_low = 9'h000;
          default: out_low = 9'h000;
        endcase
      end
      default: begin end
    endcase
  end
  reg out_b15;
  always @* begin
    out_b15 = 1'b0;
    case (sign_exp)
      6'h04: begin
        out_b15 = 0;
      end
      6'h06: begin
        out_b15 = 0;
      end
      6'h07: begin
        out_b15 = 0;
      end
      6'h08: begin
        out_b15 = 0;
      end
      6'h09: begin
        out_b15 = 0;
      end
      6'h0a: begin
        out_b15 = 0;
      end
      6'h0b: begin
        out_b15 = 0;
      end
      6'h0c: begin
        out_b15 = 0;
      end
      6'h0d: begin
        out_b15 = 0;
      end
      6'h0e: begin
        out_b15 = 0;
      end
      6'h0f: begin
        out_b15 = 0;
      end
      6'h10: begin
        out_b15 = 0;
      end
      6'h11: begin
        out_b15 = 0;
      end
      6'h12: begin
        out_b15 = 0;
      end
      6'h1f: begin
        out_b15 = 0;
      end
      6'h23: begin
        out_b15 = 0;
      end
      6'h25: begin
        out_b15 = 0;
      end
      6'h26: begin
        out_b15 = 0;
      end
      6'h27: begin
        out_b15 = 0;
      end
      6'h28: begin
        out_b15 = 0;
      end
      6'h29: begin
        out_b15 = 0;
      end
      6'h2a: begin
        out_b15 = 0;
      end
      6'h2b: begin
        out_b15 = 0;
      end
      6'h2c: begin
        out_b15 = 0;
      end
      6'h2d: begin
        out_b15 = 0;
      end
      6'h2e: begin
        out_b15 = 0;
      end
      6'h2f: begin
        out_b15 = 0;
      end
      6'h30: begin
        out_b15 = 0;
      end
      6'h31: begin
        out_b15 = 0;
      end
      6'h32: begin
        out_b15 = 0;
      end
      6'h3f: begin
        out_b15 = 0;
      end
      default: begin end
    endcase
  end
  reg out_b14;
  always @* begin
    out_b14 = 1'b0;
    case (sign_exp)
      6'h04: begin
        out_b14 = 0;
      end
      6'h06: begin
        out_b14 = 0;
      end
      6'h07: begin
        out_b14 = 0;
      end
      6'h08: begin
        out_b14 = 0;
      end
      6'h09: begin
        out_b14 = 0;
      end
      6'h0a: begin
        out_b14 = 0;
      end
      6'h0b: begin
        out_b14 = 0;
      end
      6'h0c: begin
        out_b14 = 0;
      end
      6'h0d: begin
        out_b14 = 0;
      end
      6'h0e: begin
        out_b14 = 0;
      end
      6'h0f: begin
        out_b14 = 1;
      end
      6'h10: begin
        out_b14 = 1;
      end
      6'h11: begin
        out_b14 = 1;
      end
      6'h12: begin
        out_b14 = 1;
      end
      6'h1f: begin
        out_b14 = 1;
      end
      6'h23: begin
        out_b14 = 0;
      end
      6'h25: begin
        out_b14 = 0;
      end
      6'h26: begin
        out_b14 = 0;
      end
      6'h27: begin
        out_b14 = 0;
      end
      6'h28: begin
        out_b14 = 0;
      end
      6'h29: begin
        out_b14 = 0;
      end
      6'h2a: begin
        out_b14 = 0;
      end
      6'h2b: begin
        out_b14 = 0;
      end
      6'h2c: begin
        out_b14 = 0;
      end
      6'h2d: begin
        out_b14 = 0;
      end
      6'h2e: begin
        out_b14 = 0;
      end
      6'h2f: begin
        out_b14 = 0;
      end
      6'h30: begin
        out_b14 = 0;
      end
      6'h31: begin
        out_b14 = 0;
      end
      6'h32: begin
        out_b14 = 0;
      end
      6'h3f: begin
        if (mant <= 10'h000) begin
          out_b14 = 0;
        end else begin
          out_b14 = 1;
        end
      end
      default: begin end
    endcase
  end
  reg out_b13;
  always @* begin
    out_b13 = 1'b0;
    case (sign_exp)
      6'h04: begin
        out_b13 = 1;
      end
      6'h06: begin
        out_b13 = 1;
      end
      6'h07: begin
        out_b13 = 1;
      end
      6'h08: begin
        out_b13 = 1;
      end
      6'h09: begin
        out_b13 = 1;
      end
      6'h0a: begin
        out_b13 = 1;
      end
      6'h0b: begin
        out_b13 = 1;
      end
      6'h0c: begin
        out_b13 = 1;
      end
      6'h0d: begin
        out_b13 = 1;
      end
      6'h0e: begin
        out_b13 = 1;
      end
      6'h0f: begin
        out_b13 = 0;
      end
      6'h10: begin
        out_b13 = 0;
      end
      6'h11: begin
        out_b13 = 0;
      end
      6'h12: begin
        if (mant <= 10'h07f) begin
          out_b13 = 0;
        end else begin
          out_b13 = 1;
        end
      end
      6'h1f: begin
        out_b13 = 1;
      end
      6'h23: begin
        out_b13 = 1;
      end
      6'h25: begin
        out_b13 = 1;
      end
      6'h26: begin
        out_b13 = 1;
      end
      6'h27: begin
        out_b13 = 1;
      end
      6'h28: begin
        out_b13 = 1;
      end
      6'h29: begin
        out_b13 = 1;
      end
      6'h2a: begin
        out_b13 = 1;
      end
      6'h2b: begin
        out_b13 = 1;
      end
      6'h2c: begin
        out_b13 = 1;
      end
      6'h2d: begin
        out_b13 = 1;
      end
      6'h2e: begin
        out_b13 = 1;
      end
      6'h2f: begin
        out_b13 = 1;
      end
      6'h30: begin
        out_b13 = 1;
      end
      6'h31: begin
        if (mant <= 10'h300) begin
          out_b13 = 1;
        end else begin
          out_b13 = 0;
        end
      end
      6'h32: begin
        out_b13 = 0;
      end
      6'h3f: begin
        if (mant <= 10'h000) begin
          out_b13 = 0;
        end else begin
          out_b13 = 1;
        end
      end
      default: begin end
    endcase
  end
  reg out_b12;
  always @* begin
    out_b12 = 1'b0;
    case (sign_exp)
      6'h04: begin
        out_b12 = 1;
      end
      6'h06: begin
        out_b12 = 1;
      end
      6'h07: begin
        out_b12 = 1;
      end
      6'h08: begin
        out_b12 = 1;
      end
      6'h09: begin
        out_b12 = 1;
      end
      6'h0a: begin
        out_b12 = 1;
      end
      6'h0b: begin
        out_b12 = 1;
      end
      6'h0c: begin
        out_b12 = 1;
      end
      6'h0d: begin
        out_b12 = 1;
      end
      6'h0e: begin
        out_b12 = 1;
      end
      6'h0f: begin
        out_b12 = 0;
      end
      6'h10: begin
        out_b12 = 0;
      end
      6'h11: begin
        if (mant <= 10'h0ff) begin
          out_b12 = 0;
        end else begin
          out_b12 = 1;
        end
      end
      6'h12: begin
        if (mant <= 10'h07f) begin
          out_b12 = 1;
        end else begin
          if (mant <= 10'h27f) begin
            out_b12 = 0;
          end else begin
            out_b12 = 1;
          end
        end
      end
      6'h1f: begin
        out_b12 = 1;
      end
      6'h23: begin
        out_b12 = 1;
      end
      6'h25: begin
        out_b12 = 1;
      end
      6'h26: begin
        out_b12 = 1;
      end
      6'h27: begin
        out_b12 = 1;
      end
      6'h28: begin
        out_b12 = 1;
      end
      6'h29: begin
        out_b12 = 1;
      end
      6'h2a: begin
        out_b12 = 1;
      end
      6'h2b: begin
        out_b12 = 1;
      end
      6'h2c: begin
        out_b12 = 1;
      end
      6'h2d: begin
        out_b12 = 1;
      end
      6'h2e: begin
        out_b12 = 1;
      end
      6'h2f: begin
        out_b12 = 1;
      end
      6'h30: begin
        if (mant <= 10'h200) begin
          out_b12 = 1;
        end else begin
          out_b12 = 0;
        end
      end
      6'h31: begin
        if (mant <= 10'h300) begin
          out_b12 = 0;
        end else begin
          out_b12 = 1;
        end
      end
      6'h32: begin
        if (mant <= 10'h180) begin
          out_b12 = 1;
        end else begin
          out_b12 = 0;
        end
      end
      6'h3f: begin
        if (mant <= 10'h000) begin
          out_b12 = 0;
        end else begin
          out_b12 = 1;
        end
      end
      default: begin end
    endcase
  end
  reg out_b11;
  always @* begin
    out_b11 = 1'b0;
    case (sign_exp)
      6'h04: begin
        out_b11 = 1;
      end
      6'h06: begin
        out_b11 = 1;
      end
      6'h07: begin
        out_b11 = 1;
      end
      6'h08: begin
        out_b11 = 1;
      end
      6'h09: begin
        out_b11 = 1;
      end
      6'h0a: begin
        out_b11 = 1;
      end
      6'h0b: begin
        out_b11 = 1;
      end
      6'h0c: begin
        out_b11 = 1;
      end
      6'h0d: begin
        out_b11 = 1;
      end
      6'h0e: begin
        out_b11 = 1;
      end
      6'h0f: begin
        out_b11 = 0;
      end
      6'h10: begin
        if (mant <= 10'h1ff) begin
          out_b11 = 0;
        end else begin
          out_b11 = 1;
        end
      end
      6'h11: begin
        if (mant <= 10'h0ff) begin
          out_b11 = 1;
        end else begin
          if (mant <= 10'h2ff) begin
            out_b11 = 0;
          end else begin
            out_b11 = 1;
          end
        end
      end
      6'h12: begin
        if (mant <= 10'h17f) begin
          if (mant <= 10'h07f) begin
            out_b11 = 1;
          end else begin
            out_b11 = 0;
          end
        end else begin
          if (mant <= 10'h27f) begin
            out_b11 = 1;
          end else begin
            if (mant <= 10'h37f) begin
              out_b11 = 0;
            end else begin
              out_b11 = 1;
            end
          end
        end
      end
      6'h1f: begin
        out_b11 = 1;
      end
      6'h23: begin
        out_b11 = 1;
      end
      6'h25: begin
        out_b11 = 1;
      end
      6'h26: begin
        out_b11 = 1;
      end
      6'h27: begin
        out_b11 = 1;
      end
      6'h28: begin
        out_b11 = 1;
      end
      6'h29: begin
        out_b11 = 1;
      end
      6'h2a: begin
        out_b11 = 1;
      end
      6'h2b: begin
        out_b11 = 1;
      end
      6'h2c: begin
        out_b11 = 1;
      end
      6'h2d: begin
        out_b11 = 1;
      end
      6'h2e: begin
        out_b11 = 1;
      end
      6'h2f: begin
        if (mant <= 10'h000) begin
          out_b11 = 1;
        end else begin
          out_b11 = 0;
        end
      end
      6'h30: begin
        if (mant <= 10'h200) begin
          out_b11 = 0;
        end else begin
          out_b11 = 1;
        end
      end
      6'h31: begin
        if (mant <= 10'h100) begin
          out_b11 = 1;
        end else begin
          if (mant <= 10'h300) begin
            out_b11 = 0;
          end else begin
            out_b11 = 1;
          end
        end
      end
      6'h32: begin
        if (mant <= 10'h180) begin
          if (mant <= 10'h080) begin
            out_b11 = 1;
          end else begin
            out_b11 = 0;
          end
        end else begin
          if (mant <= 10'h280) begin
            out_b11 = 1;
          end else begin
            out_b11 = 0;
          end
        end
      end
      6'h3f: begin
        if (mant <= 10'h000) begin
          out_b11 = 0;
        end else begin
          out_b11 = 1;
        end
      end
      default: begin end
    endcase
  end
  reg out_b10;
  always @* begin
    out_b10 = 1'b0;
    case (sign_exp)
      6'h04: begin
        out_b10 = 1;
      end
      6'h06: begin
        out_b10 = 1;
      end
      6'h07: begin
        out_b10 = 1;
      end
      6'h08: begin
        out_b10 = 1;
      end
      6'h09: begin
        out_b10 = 1;
      end
      6'h0a: begin
        out_b10 = 1;
      end
      6'h0b: begin
        out_b10 = 1;
      end
      6'h0c: begin
        out_b10 = 1;
      end
      6'h0d: begin
        out_b10 = 1;
      end
      6'h0e: begin
        out_b10 = 1;
      end
      6'h0f: begin
        out_b10 = 0;
      end
      6'h10: begin
        if (mant <= 10'h1ff) begin
          out_b10 = 1;
        end else begin
          out_b10 = 0;
        end
      end
      6'h11: begin
        if (mant <= 10'h1ff) begin
          if (mant <= 10'h0ff) begin
            out_b10 = 1;
          end else begin
            out_b10 = 0;
          end
        end else begin
          if (mant <= 10'h2ff) begin
            out_b10 = 1;
          end else begin
            out_b10 = 0;
          end
        end
      end
      6'h12: begin
        if (mant <= 10'h1ff) begin
          if (mant <= 10'h0ff) begin
            if (mant <= 10'h07f) begin
              out_b10 = 1;
            end else begin
              out_b10 = 0;
            end
          end else begin
            if (mant <= 10'h17f) begin
              out_b10 = 1;
            end else begin
              out_b10 = 0;
            end
          end
        end else begin
          if (mant <= 10'h2ff) begin
            if (mant <= 10'h27f) begin
              out_b10 = 1;
            end else begin
              out_b10 = 0;
            end
          end else begin
            if (mant <= 10'h37f) begin
              out_b10 = 1;
            end else begin
              out_b10 = 0;
            end
          end
        end
      end
      6'h1f: begin
        out_b10 = 1;
      end
      6'h23: begin
        if (mant <= 10'h1c5) begin
          out_b10 = 1;
        end else begin
          out_b10 = 0;
        end
      end
      6'h25: begin
        out_b10 = 0;
      end
      6'h26: begin
        out_b10 = 0;
      end
      6'h27: begin
        out_b10 = 0;
      end
      6'h28: begin
        out_b10 = 0;
      end
      6'h29: begin
        out_b10 = 0;
      end
      6'h2a: begin
        out_b10 = 0;
      end
      6'h2b: begin
        out_b10 = 0;
      end
      6'h2c: begin
        out_b10 = 0;
      end
      6'h2d: begin
        out_b10 = 0;
      end
      6'h2e: begin
        out_b10 = 0;
      end
      6'h2f: begin
        if (mant <= 10'h000) begin
          out_b10 = 0;
        end else begin
          out_b10 = 1;
        end
      end
      6'h30: begin
        if (mant <= 10'h000) begin
          out_b10 = 1;
        end else begin
          if (mant <= 10'h200) begin
            out_b10 = 0;
          end else begin
            out_b10 = 1;
          end
        end
      end
      6'h31: begin
        if (mant <= 10'h100) begin
          if (mant <= 10'h000) begin
            out_b10 = 1;
          end else begin
            out_b10 = 0;
          end
        end else begin
          if (mant <= 10'h200) begin
            out_b10 = 1;
          end else begin
            if (mant <= 10'h300) begin
              out_b10 = 0;
            end else begin
              out_b10 = 1;
            end
          end
        end
      end
      6'h32: begin
        if (mant <= 10'h180) begin
          if (mant <= 10'h080) begin
            if (mant <= 10'h000) begin
              out_b10 = 1;
            end else begin
              out_b10 = 0;
            end
          end else begin
            if (mant <= 10'h100) begin
              out_b10 = 1;
            end else begin
              out_b10 = 0;
            end
          end
        end else begin
          if (mant <= 10'h280) begin
            if (mant <= 10'h200) begin
              out_b10 = 1;
            end else begin
              out_b10 = 0;
            end
          end else begin
            if (mant <= 10'h300) begin
              out_b10 = 1;
            end else begin
              out_b10 = 0;
            end
          end
        end
      end
      6'h3f: begin
        if (mant <= 10'h000) begin
          out_b10 = 0;
        end else begin
          out_b10 = 1;
        end
      end
      default: begin end
    endcase
  end
  reg out_b9;
  always @* begin
    out_b9 = 1'b0;
    case (sign_exp)
      6'h04: begin
        out_b9 = 0;
      end
      6'h06: begin
        out_b9 = 0;
      end
      6'h07: begin
        out_b9 = 0;
      end
      6'h08: begin
        out_b9 = 0;
      end
      6'h09: begin
        out_b9 = 0;
      end
      6'h0a: begin
        out_b9 = 0;
      end
      6'h0b: begin
        out_b9 = 0;
      end
      6'h0c: begin
        out_b9 = 0;
      end
      6'h0d: begin
        out_b9 = 0;
      end
      6'h0e: begin
        if (mant <= 10'h0ad) begin
          out_b9 = 0;
        end else begin
          out_b9 = 1;
        end
      end
      6'h0f: begin
        if (mant <= 10'h256) begin
          out_b9 = 0;
        end else begin
          out_b9 = 1;
        end
      end
      6'h10: begin
        if (mant <= 10'h1ff) begin
          if (mant <= 10'h12b) begin
            out_b9 = 0;
          end else begin
            out_b9 = 1;
          end
        end else begin
          if (mant <= 10'h32b) begin
            out_b9 = 0;
          end else begin
            out_b9 = 1;
          end
        end
      end
      6'h11: begin
        if (mant <= 10'h1ff) begin
          if (mant <= 10'h0ff) begin
            if (mant <= 10'h095) begin
              out_b9 = 0;
            end else begin
              out_b9 = 1;
            end
          end else begin
            if (mant <= 10'h195) begin
              out_b9 = 0;
            end else begin
              out_b9 = 1;
            end
          end
        end else begin
          if (mant <= 10'h2ff) begin
            if (mant <= 10'h295) begin
              out_b9 = 0;
            end else begin
              out_b9 = 1;
            end
          end else begin
            if (mant <= 10'h395) begin
              out_b9 = 0;
            end else begin
              out_b9 = 1;
            end
          end
        end
      end
      6'h12: begin
        if (mant <= 10'h1ff) begin
          if (mant <= 10'h0ff) begin
            if (mant <= 10'h07f) begin
              if (mant <= 10'h04a) begin
                out_b9 = 0;
              end else begin
                out_b9 = 1;
              end
            end else begin
              if (mant <= 10'h0ca) begin
                out_b9 = 0;
              end else begin
                out_b9 = 1;
              end
            end
          end else begin
            if (mant <= 10'h17f) begin
              if (mant <= 10'h14a) begin
                out_b9 = 0;
              end else begin
                out_b9 = 1;
              end
            end else begin
              if (mant <= 10'h1ca) begin
                out_b9 = 0;
              end else begin
                out_b9 = 1;
              end
            end
          end
        end else begin
          if (mant <= 10'h2ff) begin
            if (mant <= 10'h27f) begin
              if (mant <= 10'h24a) begin
                out_b9 = 0;
              end else begin
                out_b9 = 1;
              end
            end else begin
              if (mant <= 10'h2ca) begin
                out_b9 = 0;
              end else begin
                out_b9 = 1;
              end
            end
          end else begin
            if (mant <= 10'h37f) begin
              if (mant <= 10'h34a) begin
                out_b9 = 0;
              end else begin
                out_b9 = 1;
              end
            end else begin
              if (mant <= 10'h3ca) begin
                out_b9 = 0;
              end else begin
                out_b9 = 1;
              end
            end
          end
        end
      end
      6'h1f: begin
        if (mant <= 10'h000) begin
          out_b9 = 0;
        end else begin
          out_b9 = 1;
        end
      end
      6'h23: begin
        if (mant <= 10'h1c5) begin
          out_b9 = 0;
        end else begin
          out_b9 = 1;
        end
      end
      6'h25: begin
        out_b9 = 1;
      end
      6'h26: begin
        out_b9 = 1;
      end
      6'h27: begin
        out_b9 = 1;
      end
      6'h28: begin
        out_b9 = 1;
      end
      6'h29: begin
        out_b9 = 1;
      end
      6'h2a: begin
        out_b9 = 1;
      end
      6'h2b: begin
        out_b9 = 1;
      end
      6'h2c: begin
        out_b9 = 1;
      end
      6'h2d: begin
        if (mant <= 10'h2a5) begin
          out_b9 = 1;
        end else begin
          out_b9 = 0;
        end
      end
      6'h2e: begin
        out_b9 = 0;
      end
      6'h2f: begin
        if (mant <= 10'h000) begin
          out_b9 = 0;
        end else begin
          if (mant <= 10'h1a9) begin
            out_b9 = 1;
          end else begin
            out_b9 = 0;
          end
        end
      end
      6'h30: begin
        if (mant <= 10'h0d4) begin
          if (mant <= 10'h000) begin
            out_b9 = 0;
          end else begin
            out_b9 = 1;
          end
        end else begin
          if (mant <= 10'h200) begin
            out_b9 = 0;
          end else begin
            if (mant <= 10'h2d4) begin
              out_b9 = 1;
            end else begin
              out_b9 = 0;
            end
          end
        end
      end
      6'h31: begin
        if (mant <= 10'h16a) begin
          if (mant <= 10'h06a) begin
            if (mant <= 10'h000) begin
              out_b9 = 0;
            end else begin
              out_b9 = 1;
            end
          end else begin
            if (mant <= 10'h100) begin
              out_b9 = 0;
            end else begin
              out_b9 = 1;
            end
          end
        end else begin
          if (mant <= 10'h26a) begin
            if (mant <= 10'h200) begin
              out_b9 = 0;
            end else begin
              out_b9 = 1;
            end
          end else begin
            if (mant <= 10'h300) begin
              out_b9 = 0;
            end else begin
              if (mant <= 10'h36a) begin
                out_b9 = 1;
              end else begin
                out_b9 = 0;
              end
            end
          end
        end
      end
      6'h32: begin
        if (mant <= 10'h135) begin
          if (mant <= 10'h080) begin
            if (mant <= 10'h000) begin
              out_b9 = 0;
            end else begin
              if (mant <= 10'h035) begin
                out_b9 = 1;
              end else begin
                out_b9 = 0;
              end
            end
          end else begin
            if (mant <= 10'h0b5) begin
              out_b9 = 1;
            end else begin
              if (mant <= 10'h100) begin
                out_b9 = 0;
              end else begin
                out_b9 = 1;
              end
            end
          end
        end else begin
          if (mant <= 10'h200) begin
            if (mant <= 10'h180) begin
              out_b9 = 0;
            end else begin
              if (mant <= 10'h1b5) begin
                out_b9 = 1;
              end else begin
                out_b9 = 0;
              end
            end
          end else begin
            if (mant <= 10'h280) begin
              if (mant <= 10'h235) begin
                out_b9 = 1;
              end else begin
                out_b9 = 0;
              end
            end else begin
              if (mant <= 10'h2b5) begin
                out_b9 = 1;
              end else begin
                out_b9 = 0;
              end
            end
          end
        end
      end
      6'h3f: begin
        if (mant <= 10'h000) begin
          out_b9 = 0;
        end else begin
          out_b9 = 1;
        end
      end
      default: begin end
    endcase
  end
  wire [15:0] normal_out = {out_b15, out_b14, out_b13, out_b12, out_b11, out_b10, out_b9, out_low};
  assign out = active_group ? normal_out : special_out;
endmodule
