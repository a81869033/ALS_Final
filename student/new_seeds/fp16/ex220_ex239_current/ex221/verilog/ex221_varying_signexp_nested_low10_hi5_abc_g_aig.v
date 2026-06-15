module ex221_varying_signexp_nested_low10_hi5(in, out);
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
  reg [9:0] out_low;
  always @* begin
    out_low = 10'h000;
    case (sign_exp)
      6'h04: begin
        case (mant[9:5])
          5'h00: out_low = 10'h000;
          5'h01: out_low = 10'h000;
          5'h02: out_low = 10'h000;
          5'h03: out_low = 10'h000;
          5'h04: out_low = 10'h000;
          5'h05: out_low = 10'h000;
          5'h06: out_low = 10'h000;
          5'h07: out_low = 10'h000;
          5'h08: out_low = 10'h000;
          5'h09: out_low = 10'h000;
          5'h0a: out_low = 10'h000;
          5'h0b: out_low = 10'h000;
          5'h0c: out_low = 10'h000;
          5'h0d: out_low = 10'h000;
          5'h0e: begin
            case (mant[4:0])
              5'h00: out_low = 10'h000;
              5'h01: out_low = 10'h000;
              5'h02: out_low = 10'h000;
              5'h03: out_low = 10'h000;
              5'h04: out_low = 10'h000;
              5'h05: out_low = 10'h000;
              5'h06: out_low = 10'h001;
              5'h07: out_low = 10'h001;
              5'h08: out_low = 10'h001;
              5'h09: out_low = 10'h001;
              5'h0a: out_low = 10'h001;
              5'h0b: out_low = 10'h001;
              5'h0c: out_low = 10'h001;
              5'h0d: out_low = 10'h001;
              5'h0e: out_low = 10'h001;
              5'h0f: out_low = 10'h001;
              5'h10: out_low = 10'h001;
              5'h11: out_low = 10'h001;
              5'h12: out_low = 10'h001;
              5'h13: out_low = 10'h001;
              5'h14: out_low = 10'h001;
              5'h15: out_low = 10'h001;
              5'h16: out_low = 10'h001;
              5'h17: out_low = 10'h001;
              5'h18: out_low = 10'h001;
              5'h19: out_low = 10'h001;
              5'h1a: out_low = 10'h001;
              5'h1b: out_low = 10'h001;
              5'h1c: out_low = 10'h001;
              5'h1d: out_low = 10'h001;
              5'h1e: out_low = 10'h001;
              5'h1f: out_low = 10'h001;
              default: out_low = 10'h000;
            endcase
          end
          5'h0f: out_low = 10'h001;
          5'h10: out_low = 10'h001;
          5'h11: out_low = 10'h001;
          5'h12: out_low = 10'h001;
          5'h13: out_low = 10'h001;
          5'h14: out_low = 10'h001;
          5'h15: out_low = 10'h001;
          5'h16: out_low = 10'h001;
          5'h17: out_low = 10'h001;
          5'h18: out_low = 10'h001;
          5'h19: out_low = 10'h001;
          5'h1a: out_low = 10'h001;
          5'h1b: out_low = 10'h001;
          5'h1c: out_low = 10'h001;
          5'h1d: out_low = 10'h001;
          5'h1e: out_low = 10'h001;
          5'h1f: out_low = 10'h001;
          default: out_low = 10'h000;
        endcase
      end
      6'h06: begin
        case (mant[9:5])
          5'h00: out_low = 10'h001;
          5'h01: out_low = 10'h001;
          5'h02: begin
            case (mant[4:0])
              5'h00: out_low = 10'h001;
              5'h01: out_low = 10'h001;
              5'h02: out_low = 10'h001;
              5'h03: out_low = 10'h001;
              5'h04: out_low = 10'h001;
              5'h05: out_low = 10'h001;
              5'h06: out_low = 10'h001;
              5'h07: out_low = 10'h001;
              5'h08: out_low = 10'h001;
              5'h09: out_low = 10'h001;
              5'h0a: out_low = 10'h001;
              5'h0b: out_low = 10'h001;
              5'h0c: out_low = 10'h001;
              5'h0d: out_low = 10'h001;
              5'h0e: out_low = 10'h001;
              5'h0f: out_low = 10'h001;
              5'h10: out_low = 10'h001;
              5'h11: out_low = 10'h001;
              5'h12: out_low = 10'h001;
              5'h13: out_low = 10'h001;
              5'h14: out_low = 10'h002;
              5'h15: out_low = 10'h002;
              5'h16: out_low = 10'h002;
              5'h17: out_low = 10'h002;
              5'h18: out_low = 10'h002;
              5'h19: out_low = 10'h002;
              5'h1a: out_low = 10'h002;
              5'h1b: out_low = 10'h002;
              5'h1c: out_low = 10'h002;
              5'h1d: out_low = 10'h002;
              5'h1e: out_low = 10'h002;
              5'h1f: out_low = 10'h002;
              default: out_low = 10'h000;
            endcase
          end
          5'h03: out_low = 10'h002;
          5'h04: out_low = 10'h002;
          5'h05: out_low = 10'h002;
          5'h06: out_low = 10'h002;
          5'h07: out_low = 10'h002;
          5'h08: out_low = 10'h002;
          5'h09: out_low = 10'h002;
          5'h0a: out_low = 10'h002;
          5'h0b: out_low = 10'h002;
          5'h0c: out_low = 10'h002;
          5'h0d: out_low = 10'h002;
          5'h0e: out_low = 10'h002;
          5'h0f: out_low = 10'h002;
          5'h10: out_low = 10'h002;
          5'h11: out_low = 10'h002;
          5'h12: out_low = 10'h002;
          5'h13: out_low = 10'h002;
          5'h14: out_low = 10'h002;
          5'h15: out_low = 10'h002;
          5'h16: out_low = 10'h002;
          5'h17: out_low = 10'h002;
          5'h18: out_low = 10'h002;
          5'h19: begin
            case (mant[4:0])
              5'h00: out_low = 10'h002;
              5'h01: out_low = 10'h002;
              5'h02: out_low = 10'h002;
              5'h03: out_low = 10'h002;
              5'h04: out_low = 10'h002;
              5'h05: out_low = 10'h002;
              5'h06: out_low = 10'h002;
              5'h07: out_low = 10'h002;
              5'h08: out_low = 10'h002;
              5'h09: out_low = 10'h002;
              5'h0a: out_low = 10'h002;
              5'h0b: out_low = 10'h002;
              5'h0c: out_low = 10'h002;
              5'h0d: out_low = 10'h002;
              5'h0e: out_low = 10'h002;
              5'h0f: out_low = 10'h002;
              5'h10: out_low = 10'h002;
              5'h11: out_low = 10'h002;
              5'h12: out_low = 10'h002;
              5'h13: out_low = 10'h002;
              5'h14: out_low = 10'h002;
              5'h15: out_low = 10'h003;
              5'h16: out_low = 10'h003;
              5'h17: out_low = 10'h003;
              5'h18: out_low = 10'h003;
              5'h19: out_low = 10'h003;
              5'h1a: out_low = 10'h003;
              5'h1b: out_low = 10'h003;
              5'h1c: out_low = 10'h003;
              5'h1d: out_low = 10'h003;
              5'h1e: out_low = 10'h003;
              5'h1f: out_low = 10'h003;
              default: out_low = 10'h000;
            endcase
          end
          5'h1a: out_low = 10'h003;
          5'h1b: out_low = 10'h003;
          5'h1c: out_low = 10'h003;
          5'h1d: out_low = 10'h003;
          5'h1e: out_low = 10'h003;
          5'h1f: out_low = 10'h003;
          default: out_low = 10'h000;
        endcase
      end
      6'h07: begin
        case (mant[9:5])
          5'h00: out_low = 10'h003;
          5'h01: out_low = 10'h003;
          5'h02: out_low = 10'h003;
          5'h03: out_low = 10'h003;
          5'h04: out_low = 10'h003;
          5'h05: out_low = 10'h003;
          5'h06: out_low = 10'h003;
          5'h07: out_low = 10'h003;
          5'h08: begin
            case (mant[4:0])
              5'h00: out_low = 10'h003;
              5'h01: out_low = 10'h003;
              5'h02: out_low = 10'h003;
              5'h03: out_low = 10'h003;
              5'h04: out_low = 10'h003;
              5'h05: out_low = 10'h003;
              5'h06: out_low = 10'h003;
              5'h07: out_low = 10'h003;
              5'h08: out_low = 10'h003;
              5'h09: out_low = 10'h003;
              5'h0a: out_low = 10'h003;
              5'h0b: out_low = 10'h004;
              5'h0c: out_low = 10'h004;
              5'h0d: out_low = 10'h004;
              5'h0e: out_low = 10'h004;
              5'h0f: out_low = 10'h004;
              5'h10: out_low = 10'h004;
              5'h11: out_low = 10'h004;
              5'h12: out_low = 10'h004;
              5'h13: out_low = 10'h004;
              5'h14: out_low = 10'h004;
              5'h15: out_low = 10'h004;
              5'h16: out_low = 10'h004;
              5'h17: out_low = 10'h004;
              5'h18: out_low = 10'h004;
              5'h19: out_low = 10'h004;
              5'h1a: out_low = 10'h004;
              5'h1b: out_low = 10'h004;
              5'h1c: out_low = 10'h004;
              5'h1d: out_low = 10'h004;
              5'h1e: out_low = 10'h004;
              5'h1f: out_low = 10'h004;
              default: out_low = 10'h000;
            endcase
          end
          5'h09: out_low = 10'h004;
          5'h0a: out_low = 10'h004;
          5'h0b: out_low = 10'h004;
          5'h0c: out_low = 10'h004;
          5'h0d: out_low = 10'h004;
          5'h0e: out_low = 10'h004;
          5'h0f: out_low = 10'h004;
          5'h10: out_low = 10'h004;
          5'h11: out_low = 10'h004;
          5'h12: out_low = 10'h004;
          5'h13: begin
            case (mant[4:0])
              5'h00: out_low = 10'h004;
              5'h01: out_low = 10'h004;
              5'h02: out_low = 10'h004;
              5'h03: out_low = 10'h004;
              5'h04: out_low = 10'h004;
              5'h05: out_low = 10'h004;
              5'h06: out_low = 10'h004;
              5'h07: out_low = 10'h004;
              5'h08: out_low = 10'h004;
              5'h09: out_low = 10'h004;
              5'h0a: out_low = 10'h004;
              5'h0b: out_low = 10'h004;
              5'h0c: out_low = 10'h004;
              5'h0d: out_low = 10'h004;
              5'h0e: out_low = 10'h004;
              5'h0f: out_low = 10'h004;
              5'h10: out_low = 10'h004;
              5'h11: out_low = 10'h004;
              5'h12: out_low = 10'h004;
              5'h13: out_low = 10'h004;
              5'h14: out_low = 10'h004;
              5'h15: out_low = 10'h004;
              5'h16: out_low = 10'h004;
              5'h17: out_low = 10'h004;
              5'h18: out_low = 10'h004;
              5'h19: out_low = 10'h004;
              5'h1a: out_low = 10'h004;
              5'h1b: out_low = 10'h005;
              5'h1c: out_low = 10'h005;
              5'h1d: out_low = 10'h005;
              5'h1e: out_low = 10'h005;
              5'h1f: out_low = 10'h005;
              default: out_low = 10'h000;
            endcase
          end
          5'h14: out_low = 10'h005;
          5'h15: out_low = 10'h005;
          5'h16: out_low = 10'h005;
          5'h17: out_low = 10'h005;
          5'h18: out_low = 10'h005;
          5'h19: out_low = 10'h005;
          5'h1a: out_low = 10'h005;
          5'h1b: out_low = 10'h005;
          5'h1c: out_low = 10'h005;
          5'h1d: out_low = 10'h005;
          5'h1e: out_low = 10'h005;
          5'h1f: begin
            case (mant[4:0])
              5'h00: out_low = 10'h005;
              5'h01: out_low = 10'h005;
              5'h02: out_low = 10'h005;
              5'h03: out_low = 10'h005;
              5'h04: out_low = 10'h005;
              5'h05: out_low = 10'h005;
              5'h06: out_low = 10'h005;
              5'h07: out_low = 10'h005;
              5'h08: out_low = 10'h005;
              5'h09: out_low = 10'h005;
              5'h0a: out_low = 10'h006;
              5'h0b: out_low = 10'h006;
              5'h0c: out_low = 10'h006;
              5'h0d: out_low = 10'h006;
              5'h0e: out_low = 10'h006;
              5'h0f: out_low = 10'h006;
              5'h10: out_low = 10'h006;
              5'h11: out_low = 10'h006;
              5'h12: out_low = 10'h006;
              5'h13: out_low = 10'h006;
              5'h14: out_low = 10'h006;
              5'h15: out_low = 10'h006;
              5'h16: out_low = 10'h006;
              5'h17: out_low = 10'h006;
              5'h18: out_low = 10'h006;
              5'h19: out_low = 10'h006;
              5'h1a: out_low = 10'h006;
              5'h1b: out_low = 10'h006;
              5'h1c: out_low = 10'h006;
              5'h1d: out_low = 10'h006;
              5'h1e: out_low = 10'h006;
              5'h1f: out_low = 10'h006;
              default: out_low = 10'h000;
            endcase
          end
          default: out_low = 10'h000;
        endcase
      end
      6'h08: begin
        case (mant[9:5])
          5'h00: out_low = 10'h006;
          5'h01: out_low = 10'h006;
          5'h02: out_low = 10'h006;
          5'h03: out_low = 10'h006;
          5'h04: out_low = 10'h006;
          5'h05: begin
            case (mant[4:0])
              5'h00: out_low = 10'h006;
              5'h01: out_low = 10'h006;
              5'h02: out_low = 10'h006;
              5'h03: out_low = 10'h006;
              5'h04: out_low = 10'h006;
              5'h05: out_low = 10'h006;
              5'h06: out_low = 10'h006;
              5'h07: out_low = 10'h006;
              5'h08: out_low = 10'h006;
              5'h09: out_low = 10'h006;
              5'h0a: out_low = 10'h006;
              5'h0b: out_low = 10'h006;
              5'h0c: out_low = 10'h006;
              5'h0d: out_low = 10'h007;
              5'h0e: out_low = 10'h007;
              5'h0f: out_low = 10'h007;
              5'h10: out_low = 10'h007;
              5'h11: out_low = 10'h007;
              5'h12: out_low = 10'h007;
              5'h13: out_low = 10'h007;
              5'h14: out_low = 10'h007;
              5'h15: out_low = 10'h007;
              5'h16: out_low = 10'h007;
              5'h17: out_low = 10'h007;
              5'h18: out_low = 10'h007;
              5'h19: out_low = 10'h007;
              5'h1a: out_low = 10'h007;
              5'h1b: out_low = 10'h007;
              5'h1c: out_low = 10'h007;
              5'h1d: out_low = 10'h007;
              5'h1e: out_low = 10'h007;
              5'h1f: out_low = 10'h007;
              default: out_low = 10'h000;
            endcase
          end
          5'h06: out_low = 10'h007;
          5'h07: out_low = 10'h007;
          5'h08: out_low = 10'h007;
          5'h09: out_low = 10'h007;
          5'h0a: out_low = 10'h007;
          5'h0b: begin
            case (mant[4:0])
              5'h00: out_low = 10'h007;
              5'h01: out_low = 10'h007;
              5'h02: out_low = 10'h007;
              5'h03: out_low = 10'h007;
              5'h04: out_low = 10'h008;
              5'h05: out_low = 10'h008;
              5'h06: out_low = 10'h008;
              5'h07: out_low = 10'h008;
              5'h08: out_low = 10'h008;
              5'h09: out_low = 10'h008;
              5'h0a: out_low = 10'h008;
              5'h0b: out_low = 10'h008;
              5'h0c: out_low = 10'h008;
              5'h0d: out_low = 10'h008;
              5'h0e: out_low = 10'h008;
              5'h0f: out_low = 10'h008;
              5'h10: out_low = 10'h008;
              5'h11: out_low = 10'h008;
              5'h12: out_low = 10'h008;
              5'h13: out_low = 10'h008;
              5'h14: out_low = 10'h008;
              5'h15: out_low = 10'h008;
              5'h16: out_low = 10'h008;
              5'h17: out_low = 10'h008;
              5'h18: out_low = 10'h008;
              5'h19: out_low = 10'h008;
              5'h1a: out_low = 10'h008;
              5'h1b: out_low = 10'h008;
              5'h1c: out_low = 10'h008;
              5'h1d: out_low = 10'h008;
              5'h1e: out_low = 10'h008;
              5'h1f: out_low = 10'h008;
              default: out_low = 10'h000;
            endcase
          end
          5'h0c: out_low = 10'h008;
          5'h0d: out_low = 10'h008;
          5'h0e: out_low = 10'h008;
          5'h0f: out_low = 10'h008;
          5'h10: begin
            case (mant[4:0])
              5'h00: out_low = 10'h008;
              5'h01: out_low = 10'h008;
              5'h02: out_low = 10'h008;
              5'h03: out_low = 10'h008;
              5'h04: out_low = 10'h008;
              5'h05: out_low = 10'h008;
              5'h06: out_low = 10'h008;
              5'h07: out_low = 10'h008;
              5'h08: out_low = 10'h008;
              5'h09: out_low = 10'h008;
              5'h0a: out_low = 10'h008;
              5'h0b: out_low = 10'h008;
              5'h0c: out_low = 10'h008;
              5'h0d: out_low = 10'h008;
              5'h0e: out_low = 10'h008;
              5'h0f: out_low = 10'h008;
              5'h10: out_low = 10'h008;
              5'h11: out_low = 10'h008;
              5'h12: out_low = 10'h008;
              5'h13: out_low = 10'h008;
              5'h14: out_low = 10'h008;
              5'h15: out_low = 10'h008;
              5'h16: out_low = 10'h008;
              5'h17: out_low = 10'h008;
              5'h18: out_low = 10'h008;
              5'h19: out_low = 10'h008;
              5'h1a: out_low = 10'h008;
              5'h1b: out_low = 10'h008;
              5'h1c: out_low = 10'h009;
              5'h1d: out_low = 10'h009;
              5'h1e: out_low = 10'h009;
              5'h1f: out_low = 10'h009;
              default: out_low = 10'h000;
            endcase
          end
          5'h11: out_low = 10'h009;
          5'h12: out_low = 10'h009;
          5'h13: out_low = 10'h009;
          5'h14: out_low = 10'h009;
          5'h15: out_low = 10'h009;
          5'h16: begin
            case (mant[4:0])
              5'h00: out_low = 10'h009;
              5'h01: out_low = 10'h009;
              5'h02: out_low = 10'h009;
              5'h03: out_low = 10'h009;
              5'h04: out_low = 10'h009;
              5'h05: out_low = 10'h009;
              5'h06: out_low = 10'h009;
              5'h07: out_low = 10'h009;
              5'h08: out_low = 10'h009;
              5'h09: out_low = 10'h009;
              5'h0a: out_low = 10'h009;
              5'h0b: out_low = 10'h009;
              5'h0c: out_low = 10'h009;
              5'h0d: out_low = 10'h009;
              5'h0e: out_low = 10'h009;
              5'h0f: out_low = 10'h009;
              5'h10: out_low = 10'h009;
              5'h11: out_low = 10'h009;
              5'h12: out_low = 10'h009;
              5'h13: out_low = 10'h00a;
              5'h14: out_low = 10'h00a;
              5'h15: out_low = 10'h00a;
              5'h16: out_low = 10'h00a;
              5'h17: out_low = 10'h00a;
              5'h18: out_low = 10'h00a;
              5'h19: out_low = 10'h00a;
              5'h1a: out_low = 10'h00a;
              5'h1b: out_low = 10'h00a;
              5'h1c: out_low = 10'h00a;
              5'h1d: out_low = 10'h00a;
              5'h1e: out_low = 10'h00a;
              5'h1f: out_low = 10'h00a;
              default: out_low = 10'h000;
            endcase
          end
          5'h17: out_low = 10'h00a;
          5'h18: out_low = 10'h00a;
          5'h19: out_low = 10'h00a;
          5'h1a: out_low = 10'h00a;
          5'h1b: out_low = 10'h00a;
          5'h1c: begin
            case (mant[4:0])
              5'h00: out_low = 10'h00a;
              5'h01: out_low = 10'h00a;
              5'h02: out_low = 10'h00a;
              5'h03: out_low = 10'h00a;
              5'h04: out_low = 10'h00a;
              5'h05: out_low = 10'h00a;
              5'h06: out_low = 10'h00a;
              5'h07: out_low = 10'h00a;
              5'h08: out_low = 10'h00a;
              5'h09: out_low = 10'h00a;
              5'h0a: out_low = 10'h00b;
              5'h0b: out_low = 10'h00b;
              5'h0c: out_low = 10'h00b;
              5'h0d: out_low = 10'h00b;
              5'h0e: out_low = 10'h00b;
              5'h0f: out_low = 10'h00b;
              5'h10: out_low = 10'h00b;
              5'h11: out_low = 10'h00b;
              5'h12: out_low = 10'h00b;
              5'h13: out_low = 10'h00b;
              5'h14: out_low = 10'h00b;
              5'h15: out_low = 10'h00b;
              5'h16: out_low = 10'h00b;
              5'h17: out_low = 10'h00b;
              5'h18: out_low = 10'h00b;
              5'h19: out_low = 10'h00b;
              5'h1a: out_low = 10'h00b;
              5'h1b: out_low = 10'h00b;
              5'h1c: out_low = 10'h00b;
              5'h1d: out_low = 10'h00b;
              5'h1e: out_low = 10'h00b;
              5'h1f: out_low = 10'h00b;
              default: out_low = 10'h000;
            endcase
          end
          5'h1d: out_low = 10'h00b;
          5'h1e: out_low = 10'h00b;
          5'h1f: out_low = 10'h00b;
          default: out_low = 10'h000;
        endcase
      end
      6'h09: begin
        case (mant[9:5])
          5'h00: out_low = 10'h00b;
          5'h01: out_low = 10'h00c;
          5'h02: out_low = 10'h00c;
          5'h03: begin
            case (mant[4:0])
              5'h00: out_low = 10'h00c;
              5'h01: out_low = 10'h00c;
              5'h02: out_low = 10'h00c;
              5'h03: out_low = 10'h00c;
              5'h04: out_low = 10'h00c;
              5'h05: out_low = 10'h00c;
              5'h06: out_low = 10'h00c;
              5'h07: out_low = 10'h00c;
              5'h08: out_low = 10'h00c;
              5'h09: out_low = 10'h00c;
              5'h0a: out_low = 10'h00c;
              5'h0b: out_low = 10'h00c;
              5'h0c: out_low = 10'h00c;
              5'h0d: out_low = 10'h00c;
              5'h0e: out_low = 10'h00c;
              5'h0f: out_low = 10'h00c;
              5'h10: out_low = 10'h00c;
              5'h11: out_low = 10'h00c;
              5'h12: out_low = 10'h00c;
              5'h13: out_low = 10'h00c;
              5'h14: out_low = 10'h00c;
              5'h15: out_low = 10'h00c;
              5'h16: out_low = 10'h00c;
              5'h17: out_low = 10'h00c;
              5'h18: out_low = 10'h00c;
              5'h19: out_low = 10'h00c;
              5'h1a: out_low = 10'h00c;
              5'h1b: out_low = 10'h00c;
              5'h1c: out_low = 10'h00d;
              5'h1d: out_low = 10'h00d;
              5'h1e: out_low = 10'h00d;
              5'h1f: out_low = 10'h00d;
              default: out_low = 10'h000;
            endcase
          end
          5'h04: out_low = 10'h00d;
          5'h05: out_low = 10'h00d;
          5'h06: begin
            case (mant[4:0])
              5'h00: out_low = 10'h00d;
              5'h01: out_low = 10'h00d;
              5'h02: out_low = 10'h00d;
              5'h03: out_low = 10'h00d;
              5'h04: out_low = 10'h00d;
              5'h05: out_low = 10'h00d;
              5'h06: out_low = 10'h00d;
              5'h07: out_low = 10'h00d;
              5'h08: out_low = 10'h00d;
              5'h09: out_low = 10'h00d;
              5'h0a: out_low = 10'h00d;
              5'h0b: out_low = 10'h00d;
              5'h0c: out_low = 10'h00d;
              5'h0d: out_low = 10'h00d;
              5'h0e: out_low = 10'h00d;
              5'h0f: out_low = 10'h00d;
              5'h10: out_low = 10'h00d;
              5'h11: out_low = 10'h00d;
              5'h12: out_low = 10'h00d;
              5'h13: out_low = 10'h00d;
              5'h14: out_low = 10'h00d;
              5'h15: out_low = 10'h00d;
              5'h16: out_low = 10'h00d;
              5'h17: out_low = 10'h00e;
              5'h18: out_low = 10'h00e;
              5'h19: out_low = 10'h00e;
              5'h1a: out_low = 10'h00e;
              5'h1b: out_low = 10'h00e;
              5'h1c: out_low = 10'h00e;
              5'h1d: out_low = 10'h00e;
              5'h1e: out_low = 10'h00e;
              5'h1f: out_low = 10'h00e;
              default: out_low = 10'h000;
            endcase
          end
          5'h07: out_low = 10'h00e;
          5'h08: out_low = 10'h00e;
          5'h09: begin
            case (mant[4:0])
              5'h00: out_low = 10'h00e;
              5'h01: out_low = 10'h00e;
              5'h02: out_low = 10'h00e;
              5'h03: out_low = 10'h00e;
              5'h04: out_low = 10'h00e;
              5'h05: out_low = 10'h00e;
              5'h06: out_low = 10'h00e;
              5'h07: out_low = 10'h00e;
              5'h08: out_low = 10'h00e;
              5'h09: out_low = 10'h00e;
              5'h0a: out_low = 10'h00e;
              5'h0b: out_low = 10'h00e;
              5'h0c: out_low = 10'h00e;
              5'h0d: out_low = 10'h00e;
              5'h0e: out_low = 10'h00e;
              5'h0f: out_low = 10'h00e;
              5'h10: out_low = 10'h00e;
              5'h11: out_low = 10'h00e;
              5'h12: out_low = 10'h00f;
              5'h13: out_low = 10'h00f;
              5'h14: out_low = 10'h00f;
              5'h15: out_low = 10'h00f;
              5'h16: out_low = 10'h00f;
              5'h17: out_low = 10'h00f;
              5'h18: out_low = 10'h00f;
              5'h19: out_low = 10'h00f;
              5'h1a: out_low = 10'h00f;
              5'h1b: out_low = 10'h00f;
              5'h1c: out_low = 10'h00f;
              5'h1d: out_low = 10'h00f;
              5'h1e: out_low = 10'h00f;
              5'h1f: out_low = 10'h00f;
              default: out_low = 10'h000;
            endcase
          end
          5'h0a: out_low = 10'h00f;
          5'h0b: out_low = 10'h00f;
          5'h0c: begin
            case (mant[4:0])
              5'h00: out_low = 10'h00f;
              5'h01: out_low = 10'h00f;
              5'h02: out_low = 10'h00f;
              5'h03: out_low = 10'h00f;
              5'h04: out_low = 10'h00f;
              5'h05: out_low = 10'h00f;
              5'h06: out_low = 10'h00f;
              5'h07: out_low = 10'h00f;
              5'h08: out_low = 10'h00f;
              5'h09: out_low = 10'h00f;
              5'h0a: out_low = 10'h00f;
              5'h0b: out_low = 10'h00f;
              5'h0c: out_low = 10'h00f;
              5'h0d: out_low = 10'h010;
              5'h0e: out_low = 10'h010;
              5'h0f: out_low = 10'h010;
              5'h10: out_low = 10'h010;
              5'h11: out_low = 10'h010;
              5'h12: out_low = 10'h010;
              5'h13: out_low = 10'h010;
              5'h14: out_low = 10'h010;
              5'h15: out_low = 10'h010;
              5'h16: out_low = 10'h010;
              5'h17: out_low = 10'h010;
              5'h18: out_low = 10'h010;
              5'h19: out_low = 10'h010;
              5'h1a: out_low = 10'h010;
              5'h1b: out_low = 10'h010;
              5'h1c: out_low = 10'h010;
              5'h1d: out_low = 10'h010;
              5'h1e: out_low = 10'h010;
              5'h1f: out_low = 10'h010;
              default: out_low = 10'h000;
            endcase
          end
          5'h0d: out_low = 10'h010;
          5'h0e: out_low = 10'h010;
          5'h0f: begin
            case (mant[4:0])
              5'h00: out_low = 10'h010;
              5'h01: out_low = 10'h010;
              5'h02: out_low = 10'h010;
              5'h03: out_low = 10'h010;
              5'h04: out_low = 10'h010;
              5'h05: out_low = 10'h010;
              5'h06: out_low = 10'h010;
              5'h07: out_low = 10'h010;
              5'h08: out_low = 10'h011;
              5'h09: out_low = 10'h011;
              5'h0a: out_low = 10'h011;
              5'h0b: out_low = 10'h011;
              5'h0c: out_low = 10'h011;
              5'h0d: out_low = 10'h011;
              5'h0e: out_low = 10'h011;
              5'h0f: out_low = 10'h011;
              5'h10: out_low = 10'h011;
              5'h11: out_low = 10'h011;
              5'h12: out_low = 10'h011;
              5'h13: out_low = 10'h011;
              5'h14: out_low = 10'h011;
              5'h15: out_low = 10'h011;
              5'h16: out_low = 10'h011;
              5'h17: out_low = 10'h011;
              5'h18: out_low = 10'h011;
              5'h19: out_low = 10'h011;
              5'h1a: out_low = 10'h011;
              5'h1b: out_low = 10'h011;
              5'h1c: out_low = 10'h011;
              5'h1d: out_low = 10'h011;
              5'h1e: out_low = 10'h011;
              5'h1f: out_low = 10'h011;
              default: out_low = 10'h000;
            endcase
          end
          5'h10: out_low = 10'h011;
          5'h11: out_low = 10'h011;
          5'h12: begin
            case (mant[4:0])
              5'h00: out_low = 10'h011;
              5'h01: out_low = 10'h011;
              5'h02: out_low = 10'h011;
              5'h03: out_low = 10'h012;
              5'h04: out_low = 10'h012;
              5'h05: out_low = 10'h012;
              5'h06: out_low = 10'h012;
              5'h07: out_low = 10'h012;
              5'h08: out_low = 10'h012;
              5'h09: out_low = 10'h012;
              5'h0a: out_low = 10'h012;
              5'h0b: out_low = 10'h012;
              5'h0c: out_low = 10'h012;
              5'h0d: out_low = 10'h012;
              5'h0e: out_low = 10'h012;
              5'h0f: out_low = 10'h012;
              5'h10: out_low = 10'h012;
              5'h11: out_low = 10'h012;
              5'h12: out_low = 10'h012;
              5'h13: out_low = 10'h012;
              5'h14: out_low = 10'h012;
              5'h15: out_low = 10'h012;
              5'h16: out_low = 10'h012;
              5'h17: out_low = 10'h012;
              5'h18: out_low = 10'h012;
              5'h19: out_low = 10'h012;
              5'h1a: out_low = 10'h012;
              5'h1b: out_low = 10'h012;
              5'h1c: out_low = 10'h012;
              5'h1d: out_low = 10'h012;
              5'h1e: out_low = 10'h012;
              5'h1f: out_low = 10'h012;
              default: out_low = 10'h000;
            endcase
          end
          5'h13: out_low = 10'h012;
          5'h14: begin
            case (mant[4:0])
              5'h00: out_low = 10'h012;
              5'h01: out_low = 10'h012;
              5'h02: out_low = 10'h012;
              5'h03: out_low = 10'h012;
              5'h04: out_low = 10'h012;
              5'h05: out_low = 10'h012;
              5'h06: out_low = 10'h012;
              5'h07: out_low = 10'h012;
              5'h08: out_low = 10'h012;
              5'h09: out_low = 10'h012;
              5'h0a: out_low = 10'h012;
              5'h0b: out_low = 10'h012;
              5'h0c: out_low = 10'h012;
              5'h0d: out_low = 10'h012;
              5'h0e: out_low = 10'h012;
              5'h0f: out_low = 10'h012;
              5'h10: out_low = 10'h012;
              5'h11: out_low = 10'h012;
              5'h12: out_low = 10'h012;
              5'h13: out_low = 10'h012;
              5'h14: out_low = 10'h012;
              5'h15: out_low = 10'h012;
              5'h16: out_low = 10'h012;
              5'h17: out_low = 10'h012;
              5'h18: out_low = 10'h012;
              5'h19: out_low = 10'h012;
              5'h1a: out_low = 10'h012;
              5'h1b: out_low = 10'h012;
              5'h1c: out_low = 10'h012;
              5'h1d: out_low = 10'h013;
              5'h1e: out_low = 10'h013;
              5'h1f: out_low = 10'h013;
              default: out_low = 10'h000;
            endcase
          end
          5'h15: out_low = 10'h013;
          5'h16: out_low = 10'h013;
          5'h17: begin
            case (mant[4:0])
              5'h00: out_low = 10'h013;
              5'h01: out_low = 10'h013;
              5'h02: out_low = 10'h013;
              5'h03: out_low = 10'h013;
              5'h04: out_low = 10'h013;
              5'h05: out_low = 10'h013;
              5'h06: out_low = 10'h013;
              5'h07: out_low = 10'h013;
              5'h08: out_low = 10'h013;
              5'h09: out_low = 10'h013;
              5'h0a: out_low = 10'h013;
              5'h0b: out_low = 10'h013;
              5'h0c: out_low = 10'h013;
              5'h0d: out_low = 10'h013;
              5'h0e: out_low = 10'h013;
              5'h0f: out_low = 10'h013;
              5'h10: out_low = 10'h013;
              5'h11: out_low = 10'h013;
              5'h12: out_low = 10'h013;
              5'h13: out_low = 10'h013;
              5'h14: out_low = 10'h013;
              5'h15: out_low = 10'h013;
              5'h16: out_low = 10'h013;
              5'h17: out_low = 10'h013;
              5'h18: out_low = 10'h014;
              5'h19: out_low = 10'h014;
              5'h1a: out_low = 10'h014;
              5'h1b: out_low = 10'h014;
              5'h1c: out_low = 10'h014;
              5'h1d: out_low = 10'h014;
              5'h1e: out_low = 10'h014;
              5'h1f: out_low = 10'h014;
              default: out_low = 10'h000;
            endcase
          end
          5'h18: out_low = 10'h014;
          5'h19: out_low = 10'h014;
          5'h1a: begin
            case (mant[4:0])
              5'h00: out_low = 10'h014;
              5'h01: out_low = 10'h014;
              5'h02: out_low = 10'h014;
              5'h03: out_low = 10'h014;
              5'h04: out_low = 10'h014;
              5'h05: out_low = 10'h014;
              5'h06: out_low = 10'h014;
              5'h07: out_low = 10'h014;
              5'h08: out_low = 10'h014;
              5'h09: out_low = 10'h014;
              5'h0a: out_low = 10'h014;
              5'h0b: out_low = 10'h014;
              5'h0c: out_low = 10'h014;
              5'h0d: out_low = 10'h014;
              5'h0e: out_low = 10'h014;
              5'h0f: out_low = 10'h014;
              5'h10: out_low = 10'h014;
              5'h11: out_low = 10'h014;
              5'h12: out_low = 10'h014;
              5'h13: out_low = 10'h015;
              5'h14: out_low = 10'h015;
              5'h15: out_low = 10'h015;
              5'h16: out_low = 10'h015;
              5'h17: out_low = 10'h015;
              5'h18: out_low = 10'h015;
              5'h19: out_low = 10'h015;
              5'h1a: out_low = 10'h015;
              5'h1b: out_low = 10'h015;
              5'h1c: out_low = 10'h015;
              5'h1d: out_low = 10'h015;
              5'h1e: out_low = 10'h015;
              5'h1f: out_low = 10'h015;
              default: out_low = 10'h000;
            endcase
          end
          5'h1b: out_low = 10'h015;
          5'h1c: out_low = 10'h015;
          5'h1d: begin
            case (mant[4:0])
              5'h00: out_low = 10'h015;
              5'h01: out_low = 10'h015;
              5'h02: out_low = 10'h015;
              5'h03: out_low = 10'h015;
              5'h04: out_low = 10'h015;
              5'h05: out_low = 10'h015;
              5'h06: out_low = 10'h015;
              5'h07: out_low = 10'h015;
              5'h08: out_low = 10'h015;
              5'h09: out_low = 10'h015;
              5'h0a: out_low = 10'h015;
              5'h0b: out_low = 10'h015;
              5'h0c: out_low = 10'h015;
              5'h0d: out_low = 10'h016;
              5'h0e: out_low = 10'h016;
              5'h0f: out_low = 10'h016;
              5'h10: out_low = 10'h016;
              5'h11: out_low = 10'h016;
              5'h12: out_low = 10'h016;
              5'h13: out_low = 10'h016;
              5'h14: out_low = 10'h016;
              5'h15: out_low = 10'h016;
              5'h16: out_low = 10'h016;
              5'h17: out_low = 10'h016;
              5'h18: out_low = 10'h016;
              5'h19: out_low = 10'h016;
              5'h1a: out_low = 10'h016;
              5'h1b: out_low = 10'h016;
              5'h1c: out_low = 10'h016;
              5'h1d: out_low = 10'h016;
              5'h1e: out_low = 10'h016;
              5'h1f: out_low = 10'h016;
              default: out_low = 10'h000;
            endcase
          end
          5'h1e: out_low = 10'h016;
          5'h1f: out_low = 10'h016;
          default: out_low = 10'h000;
        endcase
      end
      6'h0a: begin
        case (mant[9:5])
          5'h00: begin
            case (mant[4:0])
              5'h00: out_low = 10'h016;
              5'h01: out_low = 10'h016;
              5'h02: out_low = 10'h016;
              5'h03: out_low = 10'h016;
              5'h04: out_low = 10'h017;
              5'h05: out_low = 10'h017;
              5'h06: out_low = 10'h017;
              5'h07: out_low = 10'h017;
              5'h08: out_low = 10'h017;
              5'h09: out_low = 10'h017;
              5'h0a: out_low = 10'h017;
              5'h0b: out_low = 10'h017;
              5'h0c: out_low = 10'h017;
              5'h0d: out_low = 10'h017;
              5'h0e: out_low = 10'h017;
              5'h0f: out_low = 10'h017;
              5'h10: out_low = 10'h017;
              5'h11: out_low = 10'h017;
              5'h12: out_low = 10'h017;
              5'h13: out_low = 10'h017;
              5'h14: out_low = 10'h017;
              5'h15: out_low = 10'h017;
              5'h16: out_low = 10'h017;
              5'h17: out_low = 10'h017;
              5'h18: out_low = 10'h017;
              5'h19: out_low = 10'h017;
              5'h1a: out_low = 10'h017;
              5'h1b: out_low = 10'h017;
              5'h1c: out_low = 10'h017;
              5'h1d: out_low = 10'h017;
              5'h1e: out_low = 10'h017;
              5'h1f: out_low = 10'h017;
              default: out_low = 10'h000;
            endcase
          end
          5'h01: begin
            case (mant[4:0])
              5'h00: out_low = 10'h017;
              5'h01: out_low = 10'h017;
              5'h02: out_low = 10'h017;
              5'h03: out_low = 10'h017;
              5'h04: out_low = 10'h017;
              5'h05: out_low = 10'h017;
              5'h06: out_low = 10'h017;
              5'h07: out_low = 10'h017;
              5'h08: out_low = 10'h017;
              5'h09: out_low = 10'h017;
              5'h0a: out_low = 10'h017;
              5'h0b: out_low = 10'h017;
              5'h0c: out_low = 10'h017;
              5'h0d: out_low = 10'h017;
              5'h0e: out_low = 10'h017;
              5'h0f: out_low = 10'h017;
              5'h10: out_low = 10'h017;
              5'h11: out_low = 10'h018;
              5'h12: out_low = 10'h018;
              5'h13: out_low = 10'h018;
              5'h14: out_low = 10'h018;
              5'h15: out_low = 10'h018;
              5'h16: out_low = 10'h018;
              5'h17: out_low = 10'h018;
              5'h18: out_low = 10'h018;
              5'h19: out_low = 10'h018;
              5'h1a: out_low = 10'h018;
              5'h1b: out_low = 10'h018;
              5'h1c: out_low = 10'h018;
              5'h1d: out_low = 10'h018;
              5'h1e: out_low = 10'h018;
              5'h1f: out_low = 10'h018;
              default: out_low = 10'h000;
            endcase
          end
          5'h02: begin
            case (mant[4:0])
              5'h00: out_low = 10'h018;
              5'h01: out_low = 10'h018;
              5'h02: out_low = 10'h018;
              5'h03: out_low = 10'h018;
              5'h04: out_low = 10'h018;
              5'h05: out_low = 10'h018;
              5'h06: out_low = 10'h018;
              5'h07: out_low = 10'h018;
              5'h08: out_low = 10'h018;
              5'h09: out_low = 10'h018;
              5'h0a: out_low = 10'h018;
              5'h0b: out_low = 10'h018;
              5'h0c: out_low = 10'h018;
              5'h0d: out_low = 10'h018;
              5'h0e: out_low = 10'h018;
              5'h0f: out_low = 10'h018;
              5'h10: out_low = 10'h018;
              5'h11: out_low = 10'h018;
              5'h12: out_low = 10'h018;
              5'h13: out_low = 10'h018;
              5'h14: out_low = 10'h018;
              5'h15: out_low = 10'h018;
              5'h16: out_low = 10'h018;
              5'h17: out_low = 10'h018;
              5'h18: out_low = 10'h018;
              5'h19: out_low = 10'h018;
              5'h1a: out_low = 10'h018;
              5'h1b: out_low = 10'h018;
              5'h1c: out_low = 10'h018;
              5'h1d: out_low = 10'h018;
              5'h1e: out_low = 10'h019;
              5'h1f: out_low = 10'h019;
              default: out_low = 10'h000;
            endcase
          end
          5'h03: out_low = 10'h019;
          5'h04: begin
            case (mant[4:0])
              5'h00: out_low = 10'h019;
              5'h01: out_low = 10'h019;
              5'h02: out_low = 10'h019;
              5'h03: out_low = 10'h019;
              5'h04: out_low = 10'h019;
              5'h05: out_low = 10'h019;
              5'h06: out_low = 10'h019;
              5'h07: out_low = 10'h019;
              5'h08: out_low = 10'h019;
              5'h09: out_low = 10'h019;
              5'h0a: out_low = 10'h019;
              5'h0b: out_low = 10'h01a;
              5'h0c: out_low = 10'h01a;
              5'h0d: out_low = 10'h01a;
              5'h0e: out_low = 10'h01a;
              5'h0f: out_low = 10'h01a;
              5'h10: out_low = 10'h01a;
              5'h11: out_low = 10'h01a;
              5'h12: out_low = 10'h01a;
              5'h13: out_low = 10'h01a;
              5'h14: out_low = 10'h01a;
              5'h15: out_low = 10'h01a;
              5'h16: out_low = 10'h01a;
              5'h17: out_low = 10'h01a;
              5'h18: out_low = 10'h01a;
              5'h19: out_low = 10'h01a;
              5'h1a: out_low = 10'h01a;
              5'h1b: out_low = 10'h01a;
              5'h1c: out_low = 10'h01a;
              5'h1d: out_low = 10'h01a;
              5'h1e: out_low = 10'h01a;
              5'h1f: out_low = 10'h01a;
              default: out_low = 10'h000;
            endcase
          end
          5'h05: begin
            case (mant[4:0])
              5'h00: out_low = 10'h01a;
              5'h01: out_low = 10'h01a;
              5'h02: out_low = 10'h01a;
              5'h03: out_low = 10'h01a;
              5'h04: out_low = 10'h01a;
              5'h05: out_low = 10'h01a;
              5'h06: out_low = 10'h01a;
              5'h07: out_low = 10'h01a;
              5'h08: out_low = 10'h01a;
              5'h09: out_low = 10'h01a;
              5'h0a: out_low = 10'h01a;
              5'h0b: out_low = 10'h01a;
              5'h0c: out_low = 10'h01a;
              5'h0d: out_low = 10'h01a;
              5'h0e: out_low = 10'h01a;
              5'h0f: out_low = 10'h01a;
              5'h10: out_low = 10'h01a;
              5'h11: out_low = 10'h01a;
              5'h12: out_low = 10'h01a;
              5'h13: out_low = 10'h01a;
              5'h14: out_low = 10'h01a;
              5'h15: out_low = 10'h01a;
              5'h16: out_low = 10'h01a;
              5'h17: out_low = 10'h01a;
              5'h18: out_low = 10'h01b;
              5'h19: out_low = 10'h01b;
              5'h1a: out_low = 10'h01b;
              5'h1b: out_low = 10'h01b;
              5'h1c: out_low = 10'h01b;
              5'h1d: out_low = 10'h01b;
              5'h1e: out_low = 10'h01b;
              5'h1f: out_low = 10'h01b;
              default: out_low = 10'h000;
            endcase
          end
          5'h06: out_low = 10'h01b;
          5'h07: begin
            case (mant[4:0])
              5'h00: out_low = 10'h01b;
              5'h01: out_low = 10'h01b;
              5'h02: out_low = 10'h01b;
              5'h03: out_low = 10'h01b;
              5'h04: out_low = 10'h01b;
              5'h05: out_low = 10'h01c;
              5'h06: out_low = 10'h01c;
              5'h07: out_low = 10'h01c;
              5'h08: out_low = 10'h01c;
              5'h09: out_low = 10'h01c;
              5'h0a: out_low = 10'h01c;
              5'h0b: out_low = 10'h01c;
              5'h0c: out_low = 10'h01c;
              5'h0d: out_low = 10'h01c;
              5'h0e: out_low = 10'h01c;
              5'h0f: out_low = 10'h01c;
              5'h10: out_low = 10'h01c;
              5'h11: out_low = 10'h01c;
              5'h12: out_low = 10'h01c;
              5'h13: out_low = 10'h01c;
              5'h14: out_low = 10'h01c;
              5'h15: out_low = 10'h01c;
              5'h16: out_low = 10'h01c;
              5'h17: out_low = 10'h01c;
              5'h18: out_low = 10'h01c;
              5'h19: out_low = 10'h01c;
              5'h1a: out_low = 10'h01c;
              5'h1b: out_low = 10'h01c;
              5'h1c: out_low = 10'h01c;
              5'h1d: out_low = 10'h01c;
              5'h1e: out_low = 10'h01c;
              5'h1f: out_low = 10'h01c;
              default: out_low = 10'h000;
            endcase
          end
          5'h08: begin
            case (mant[4:0])
              5'h00: out_low = 10'h01c;
              5'h01: out_low = 10'h01c;
              5'h02: out_low = 10'h01c;
              5'h03: out_low = 10'h01c;
              5'h04: out_low = 10'h01c;
              5'h05: out_low = 10'h01c;
              5'h06: out_low = 10'h01c;
              5'h07: out_low = 10'h01c;
              5'h08: out_low = 10'h01c;
              5'h09: out_low = 10'h01c;
              5'h0a: out_low = 10'h01c;
              5'h0b: out_low = 10'h01c;
              5'h0c: out_low = 10'h01c;
              5'h0d: out_low = 10'h01c;
              5'h0e: out_low = 10'h01c;
              5'h0f: out_low = 10'h01c;
              5'h10: out_low = 10'h01c;
              5'h11: out_low = 10'h01c;
              5'h12: out_low = 10'h01d;
              5'h13: out_low = 10'h01d;
              5'h14: out_low = 10'h01d;
              5'h15: out_low = 10'h01d;
              5'h16: out_low = 10'h01d;
              5'h17: out_low = 10'h01d;
              5'h18: out_low = 10'h01d;
              5'h19: out_low = 10'h01d;
              5'h1a: out_low = 10'h01d;
              5'h1b: out_low = 10'h01d;
              5'h1c: out_low = 10'h01d;
              5'h1d: out_low = 10'h01d;
              5'h1e: out_low = 10'h01d;
              5'h1f: out_low = 10'h01d;
              default: out_low = 10'h000;
            endcase
          end
          5'h09: begin
            case (mant[4:0])
              5'h00: out_low = 10'h01d;
              5'h01: out_low = 10'h01d;
              5'h02: out_low = 10'h01d;
              5'h03: out_low = 10'h01d;
              5'h04: out_low = 10'h01d;
              5'h05: out_low = 10'h01d;
              5'h06: out_low = 10'h01d;
              5'h07: out_low = 10'h01d;
              5'h08: out_low = 10'h01d;
              5'h09: out_low = 10'h01d;
              5'h0a: out_low = 10'h01d;
              5'h0b: out_low = 10'h01d;
              5'h0c: out_low = 10'h01d;
              5'h0d: out_low = 10'h01d;
              5'h0e: out_low = 10'h01d;
              5'h0f: out_low = 10'h01d;
              5'h10: out_low = 10'h01d;
              5'h11: out_low = 10'h01d;
              5'h12: out_low = 10'h01d;
              5'h13: out_low = 10'h01d;
              5'h14: out_low = 10'h01d;
              5'h15: out_low = 10'h01d;
              5'h16: out_low = 10'h01d;
              5'h17: out_low = 10'h01d;
              5'h18: out_low = 10'h01d;
              5'h19: out_low = 10'h01d;
              5'h1a: out_low = 10'h01d;
              5'h1b: out_low = 10'h01d;
              5'h1c: out_low = 10'h01d;
              5'h1d: out_low = 10'h01d;
              5'h1e: out_low = 10'h01d;
              5'h1f: out_low = 10'h01e;
              default: out_low = 10'h000;
            endcase
          end
          5'h0a: out_low = 10'h01e;
          5'h0b: begin
            case (mant[4:0])
              5'h00: out_low = 10'h01e;
              5'h01: out_low = 10'h01e;
              5'h02: out_low = 10'h01e;
              5'h03: out_low = 10'h01e;
              5'h04: out_low = 10'h01e;
              5'h05: out_low = 10'h01e;
              5'h06: out_low = 10'h01e;
              5'h07: out_low = 10'h01e;
              5'h08: out_low = 10'h01e;
              5'h09: out_low = 10'h01e;
              5'h0a: out_low = 10'h01e;
              5'h0b: out_low = 10'h01e;
              5'h0c: out_low = 10'h01f;
              5'h0d: out_low = 10'h01f;
              5'h0e: out_low = 10'h01f;
              5'h0f: out_low = 10'h01f;
              5'h10: out_low = 10'h01f;
              5'h11: out_low = 10'h01f;
              5'h12: out_low = 10'h01f;
              5'h13: out_low = 10'h01f;
              5'h14: out_low = 10'h01f;
              5'h15: out_low = 10'h01f;
              5'h16: out_low = 10'h01f;
              5'h17: out_low = 10'h01f;
              5'h18: out_low = 10'h01f;
              5'h19: out_low = 10'h01f;
              5'h1a: out_low = 10'h01f;
              5'h1b: out_low = 10'h01f;
              5'h1c: out_low = 10'h01f;
              5'h1d: out_low = 10'h01f;
              5'h1e: out_low = 10'h01f;
              5'h1f: out_low = 10'h01f;
              default: out_low = 10'h000;
            endcase
          end
          5'h0c: begin
            case (mant[4:0])
              5'h00: out_low = 10'h01f;
              5'h01: out_low = 10'h01f;
              5'h02: out_low = 10'h01f;
              5'h03: out_low = 10'h01f;
              5'h04: out_low = 10'h01f;
              5'h05: out_low = 10'h01f;
              5'h06: out_low = 10'h01f;
              5'h07: out_low = 10'h01f;
              5'h08: out_low = 10'h01f;
              5'h09: out_low = 10'h01f;
              5'h0a: out_low = 10'h01f;
              5'h0b: out_low = 10'h01f;
              5'h0c: out_low = 10'h01f;
              5'h0d: out_low = 10'h01f;
              5'h0e: out_low = 10'h01f;
              5'h0f: out_low = 10'h01f;
              5'h10: out_low = 10'h01f;
              5'h11: out_low = 10'h01f;
              5'h12: out_low = 10'h01f;
              5'h13: out_low = 10'h01f;
              5'h14: out_low = 10'h01f;
              5'h15: out_low = 10'h01f;
              5'h16: out_low = 10'h01f;
              5'h17: out_low = 10'h01f;
              5'h18: out_low = 10'h01f;
              5'h19: out_low = 10'h020;
              5'h1a: out_low = 10'h020;
              5'h1b: out_low = 10'h020;
              5'h1c: out_low = 10'h020;
              5'h1d: out_low = 10'h020;
              5'h1e: out_low = 10'h020;
              5'h1f: out_low = 10'h020;
              default: out_low = 10'h000;
            endcase
          end
          5'h0d: out_low = 10'h020;
          5'h0e: begin
            case (mant[4:0])
              5'h00: out_low = 10'h020;
              5'h01: out_low = 10'h020;
              5'h02: out_low = 10'h020;
              5'h03: out_low = 10'h020;
              5'h04: out_low = 10'h020;
              5'h05: out_low = 10'h020;
              5'h06: out_low = 10'h021;
              5'h07: out_low = 10'h021;
              5'h08: out_low = 10'h021;
              5'h09: out_low = 10'h021;
              5'h0a: out_low = 10'h021;
              5'h0b: out_low = 10'h021;
              5'h0c: out_low = 10'h021;
              5'h0d: out_low = 10'h021;
              5'h0e: out_low = 10'h021;
              5'h0f: out_low = 10'h021;
              5'h10: out_low = 10'h021;
              5'h11: out_low = 10'h021;
              5'h12: out_low = 10'h021;
              5'h13: out_low = 10'h021;
              5'h14: out_low = 10'h021;
              5'h15: out_low = 10'h021;
              5'h16: out_low = 10'h021;
              5'h17: out_low = 10'h021;
              5'h18: out_low = 10'h021;
              5'h19: out_low = 10'h021;
              5'h1a: out_low = 10'h021;
              5'h1b: out_low = 10'h021;
              5'h1c: out_low = 10'h021;
              5'h1d: out_low = 10'h021;
              5'h1e: out_low = 10'h021;
              5'h1f: out_low = 10'h021;
              default: out_low = 10'h000;
            endcase
          end
          5'h0f: begin
            case (mant[4:0])
              5'h00: out_low = 10'h021;
              5'h01: out_low = 10'h021;
              5'h02: out_low = 10'h021;
              5'h03: out_low = 10'h021;
              5'h04: out_low = 10'h021;
              5'h05: out_low = 10'h021;
              5'h06: out_low = 10'h021;
              5'h07: out_low = 10'h021;
              5'h08: out_low = 10'h021;
              5'h09: out_low = 10'h021;
              5'h0a: out_low = 10'h021;
              5'h0b: out_low = 10'h021;
              5'h0c: out_low = 10'h021;
              5'h0d: out_low = 10'h021;
              5'h0e: out_low = 10'h021;
              5'h0f: out_low = 10'h021;
              5'h10: out_low = 10'h021;
              5'h11: out_low = 10'h021;
              5'h12: out_low = 10'h022;
              5'h13: out_low = 10'h022;
              5'h14: out_low = 10'h022;
              5'h15: out_low = 10'h022;
              5'h16: out_low = 10'h022;
              5'h17: out_low = 10'h022;
              5'h18: out_low = 10'h022;
              5'h19: out_low = 10'h022;
              5'h1a: out_low = 10'h022;
              5'h1b: out_low = 10'h022;
              5'h1c: out_low = 10'h022;
              5'h1d: out_low = 10'h022;
              5'h1e: out_low = 10'h022;
              5'h1f: out_low = 10'h022;
              default: out_low = 10'h000;
            endcase
          end
          5'h10: begin
            case (mant[4:0])
              5'h00: out_low = 10'h022;
              5'h01: out_low = 10'h022;
              5'h02: out_low = 10'h022;
              5'h03: out_low = 10'h022;
              5'h04: out_low = 10'h022;
              5'h05: out_low = 10'h022;
              5'h06: out_low = 10'h022;
              5'h07: out_low = 10'h022;
              5'h08: out_low = 10'h022;
              5'h09: out_low = 10'h022;
              5'h0a: out_low = 10'h022;
              5'h0b: out_low = 10'h022;
              5'h0c: out_low = 10'h022;
              5'h0d: out_low = 10'h022;
              5'h0e: out_low = 10'h022;
              5'h0f: out_low = 10'h022;
              5'h10: out_low = 10'h022;
              5'h11: out_low = 10'h022;
              5'h12: out_low = 10'h022;
              5'h13: out_low = 10'h022;
              5'h14: out_low = 10'h022;
              5'h15: out_low = 10'h022;
              5'h16: out_low = 10'h022;
              5'h17: out_low = 10'h022;
              5'h18: out_low = 10'h022;
              5'h19: out_low = 10'h022;
              5'h1a: out_low = 10'h022;
              5'h1b: out_low = 10'h022;
              5'h1c: out_low = 10'h022;
              5'h1d: out_low = 10'h022;
              5'h1e: out_low = 10'h022;
              5'h1f: out_low = 10'h023;
              default: out_low = 10'h000;
            endcase
          end
          5'h11: out_low = 10'h023;
          5'h12: begin
            case (mant[4:0])
              5'h00: out_low = 10'h023;
              5'h01: out_low = 10'h023;
              5'h02: out_low = 10'h023;
              5'h03: out_low = 10'h023;
              5'h04: out_low = 10'h023;
              5'h05: out_low = 10'h023;
              5'h06: out_low = 10'h023;
              5'h07: out_low = 10'h023;
              5'h08: out_low = 10'h023;
              5'h09: out_low = 10'h023;
              5'h0a: out_low = 10'h023;
              5'h0b: out_low = 10'h023;
              5'h0c: out_low = 10'h024;
              5'h0d: out_low = 10'h024;
              5'h0e: out_low = 10'h024;
              5'h0f: out_low = 10'h024;
              5'h10: out_low = 10'h024;
              5'h11: out_low = 10'h024;
              5'h12: out_low = 10'h024;
              5'h13: out_low = 10'h024;
              5'h14: out_low = 10'h024;
              5'h15: out_low = 10'h024;
              5'h16: out_low = 10'h024;
              5'h17: out_low = 10'h024;
              5'h18: out_low = 10'h024;
              5'h19: out_low = 10'h024;
              5'h1a: out_low = 10'h024;
              5'h1b: out_low = 10'h024;
              5'h1c: out_low = 10'h024;
              5'h1d: out_low = 10'h024;
              5'h1e: out_low = 10'h024;
              5'h1f: out_low = 10'h024;
              default: out_low = 10'h000;
            endcase
          end
          5'h13: begin
            case (mant[4:0])
              5'h00: out_low = 10'h024;
              5'h01: out_low = 10'h024;
              5'h02: out_low = 10'h024;
              5'h03: out_low = 10'h024;
              5'h04: out_low = 10'h024;
              5'h05: out_low = 10'h024;
              5'h06: out_low = 10'h024;
              5'h07: out_low = 10'h024;
              5'h08: out_low = 10'h024;
              5'h09: out_low = 10'h024;
              5'h0a: out_low = 10'h024;
              5'h0b: out_low = 10'h024;
              5'h0c: out_low = 10'h024;
              5'h0d: out_low = 10'h024;
              5'h0e: out_low = 10'h024;
              5'h0f: out_low = 10'h024;
              5'h10: out_low = 10'h024;
              5'h11: out_low = 10'h024;
              5'h12: out_low = 10'h024;
              5'h13: out_low = 10'h024;
              5'h14: out_low = 10'h024;
              5'h15: out_low = 10'h024;
              5'h16: out_low = 10'h024;
              5'h17: out_low = 10'h024;
              5'h18: out_low = 10'h025;
              5'h19: out_low = 10'h025;
              5'h1a: out_low = 10'h025;
              5'h1b: out_low = 10'h025;
              5'h1c: out_low = 10'h025;
              5'h1d: out_low = 10'h025;
              5'h1e: out_low = 10'h025;
              5'h1f: out_low = 10'h025;
              default: out_low = 10'h000;
            endcase
          end
          5'h14: out_low = 10'h025;
          5'h15: begin
            case (mant[4:0])
              5'h00: out_low = 10'h025;
              5'h01: out_low = 10'h025;
              5'h02: out_low = 10'h025;
              5'h03: out_low = 10'h025;
              5'h04: out_low = 10'h025;
              5'h05: out_low = 10'h026;
              5'h06: out_low = 10'h026;
              5'h07: out_low = 10'h026;
              5'h08: out_low = 10'h026;
              5'h09: out_low = 10'h026;
              5'h0a: out_low = 10'h026;
              5'h0b: out_low = 10'h026;
              5'h0c: out_low = 10'h026;
              5'h0d: out_low = 10'h026;
              5'h0e: out_low = 10'h026;
              5'h0f: out_low = 10'h026;
              5'h10: out_low = 10'h026;
              5'h11: out_low = 10'h026;
              5'h12: out_low = 10'h026;
              5'h13: out_low = 10'h026;
              5'h14: out_low = 10'h026;
              5'h15: out_low = 10'h026;
              5'h16: out_low = 10'h026;
              5'h17: out_low = 10'h026;
              5'h18: out_low = 10'h026;
              5'h19: out_low = 10'h026;
              5'h1a: out_low = 10'h026;
              5'h1b: out_low = 10'h026;
              5'h1c: out_low = 10'h026;
              5'h1d: out_low = 10'h026;
              5'h1e: out_low = 10'h026;
              5'h1f: out_low = 10'h026;
              default: out_low = 10'h000;
            endcase
          end
          5'h16: begin
            case (mant[4:0])
              5'h00: out_low = 10'h026;
              5'h01: out_low = 10'h026;
              5'h02: out_low = 10'h026;
              5'h03: out_low = 10'h026;
              5'h04: out_low = 10'h026;
              5'h05: out_low = 10'h026;
              5'h06: out_low = 10'h026;
              5'h07: out_low = 10'h026;
              5'h08: out_low = 10'h026;
              5'h09: out_low = 10'h026;
              5'h0a: out_low = 10'h026;
              5'h0b: out_low = 10'h026;
              5'h0c: out_low = 10'h026;
              5'h0d: out_low = 10'h026;
              5'h0e: out_low = 10'h026;
              5'h0f: out_low = 10'h026;
              5'h10: out_low = 10'h026;
              5'h11: out_low = 10'h027;
              5'h12: out_low = 10'h027;
              5'h13: out_low = 10'h027;
              5'h14: out_low = 10'h027;
              5'h15: out_low = 10'h027;
              5'h16: out_low = 10'h027;
              5'h17: out_low = 10'h027;
              5'h18: out_low = 10'h027;
              5'h19: out_low = 10'h027;
              5'h1a: out_low = 10'h027;
              5'h1b: out_low = 10'h027;
              5'h1c: out_low = 10'h027;
              5'h1d: out_low = 10'h027;
              5'h1e: out_low = 10'h027;
              5'h1f: out_low = 10'h027;
              default: out_low = 10'h000;
            endcase
          end
          5'h17: begin
            case (mant[4:0])
              5'h00: out_low = 10'h027;
              5'h01: out_low = 10'h027;
              5'h02: out_low = 10'h027;
              5'h03: out_low = 10'h027;
              5'h04: out_low = 10'h027;
              5'h05: out_low = 10'h027;
              5'h06: out_low = 10'h027;
              5'h07: out_low = 10'h027;
              5'h08: out_low = 10'h027;
              5'h09: out_low = 10'h027;
              5'h0a: out_low = 10'h027;
              5'h0b: out_low = 10'h027;
              5'h0c: out_low = 10'h027;
              5'h0d: out_low = 10'h027;
              5'h0e: out_low = 10'h027;
              5'h0f: out_low = 10'h027;
              5'h10: out_low = 10'h027;
              5'h11: out_low = 10'h027;
              5'h12: out_low = 10'h027;
              5'h13: out_low = 10'h027;
              5'h14: out_low = 10'h027;
              5'h15: out_low = 10'h027;
              5'h16: out_low = 10'h027;
              5'h17: out_low = 10'h027;
              5'h18: out_low = 10'h027;
              5'h19: out_low = 10'h027;
              5'h1a: out_low = 10'h027;
              5'h1b: out_low = 10'h027;
              5'h1c: out_low = 10'h027;
              5'h1d: out_low = 10'h027;
              5'h1e: out_low = 10'h028;
              5'h1f: out_low = 10'h028;
              default: out_low = 10'h000;
            endcase
          end
          5'h18: out_low = 10'h028;
          5'h19: begin
            case (mant[4:0])
              5'h00: out_low = 10'h028;
              5'h01: out_low = 10'h028;
              5'h02: out_low = 10'h028;
              5'h03: out_low = 10'h028;
              5'h04: out_low = 10'h028;
              5'h05: out_low = 10'h028;
              5'h06: out_low = 10'h028;
              5'h07: out_low = 10'h028;
              5'h08: out_low = 10'h028;
              5'h09: out_low = 10'h028;
              5'h0a: out_low = 10'h029;
              5'h0b: out_low = 10'h029;
              5'h0c: out_low = 10'h029;
              5'h0d: out_low = 10'h029;
              5'h0e: out_low = 10'h029;
              5'h0f: out_low = 10'h029;
              5'h10: out_low = 10'h029;
              5'h11: out_low = 10'h029;
              5'h12: out_low = 10'h029;
              5'h13: out_low = 10'h029;
              5'h14: out_low = 10'h029;
              5'h15: out_low = 10'h029;
              5'h16: out_low = 10'h029;
              5'h17: out_low = 10'h029;
              5'h18: out_low = 10'h029;
              5'h19: out_low = 10'h029;
              5'h1a: out_low = 10'h029;
              5'h1b: out_low = 10'h029;
              5'h1c: out_low = 10'h029;
              5'h1d: out_low = 10'h029;
              5'h1e: out_low = 10'h029;
              5'h1f: out_low = 10'h029;
              default: out_low = 10'h000;
            endcase
          end
          5'h1a: begin
            case (mant[4:0])
              5'h00: out_low = 10'h029;
              5'h01: out_low = 10'h029;
              5'h02: out_low = 10'h029;
              5'h03: out_low = 10'h029;
              5'h04: out_low = 10'h029;
              5'h05: out_low = 10'h029;
              5'h06: out_low = 10'h029;
              5'h07: out_low = 10'h029;
              5'h08: out_low = 10'h029;
              5'h09: out_low = 10'h029;
              5'h0a: out_low = 10'h029;
              5'h0b: out_low = 10'h029;
              5'h0c: out_low = 10'h029;
              5'h0d: out_low = 10'h029;
              5'h0e: out_low = 10'h029;
              5'h0f: out_low = 10'h029;
              5'h10: out_low = 10'h029;
              5'h11: out_low = 10'h029;
              5'h12: out_low = 10'h029;
              5'h13: out_low = 10'h029;
              5'h14: out_low = 10'h029;
              5'h15: out_low = 10'h029;
              5'h16: out_low = 10'h029;
              5'h17: out_low = 10'h02a;
              5'h18: out_low = 10'h02a;
              5'h19: out_low = 10'h02a;
              5'h1a: out_low = 10'h02a;
              5'h1b: out_low = 10'h02a;
              5'h1c: out_low = 10'h02a;
              5'h1d: out_low = 10'h02a;
              5'h1e: out_low = 10'h02a;
              5'h1f: out_low = 10'h02a;
              default: out_low = 10'h000;
            endcase
          end
          5'h1b: out_low = 10'h02a;
          5'h1c: begin
            case (mant[4:0])
              5'h00: out_low = 10'h02a;
              5'h01: out_low = 10'h02a;
              5'h02: out_low = 10'h02a;
              5'h03: out_low = 10'h02b;
              5'h04: out_low = 10'h02b;
              5'h05: out_low = 10'h02b;
              5'h06: out_low = 10'h02b;
              5'h07: out_low = 10'h02b;
              5'h08: out_low = 10'h02b;
              5'h09: out_low = 10'h02b;
              5'h0a: out_low = 10'h02b;
              5'h0b: out_low = 10'h02b;
              5'h0c: out_low = 10'h02b;
              5'h0d: out_low = 10'h02b;
              5'h0e: out_low = 10'h02b;
              5'h0f: out_low = 10'h02b;
              5'h10: out_low = 10'h02b;
              5'h11: out_low = 10'h02b;
              5'h12: out_low = 10'h02b;
              5'h13: out_low = 10'h02b;
              5'h14: out_low = 10'h02b;
              5'h15: out_low = 10'h02b;
              5'h16: out_low = 10'h02b;
              5'h17: out_low = 10'h02b;
              5'h18: out_low = 10'h02b;
              5'h19: out_low = 10'h02b;
              5'h1a: out_low = 10'h02b;
              5'h1b: out_low = 10'h02b;
              5'h1c: out_low = 10'h02b;
              5'h1d: out_low = 10'h02b;
              5'h1e: out_low = 10'h02b;
              5'h1f: out_low = 10'h02b;
              default: out_low = 10'h000;
            endcase
          end
          5'h1d: begin
            case (mant[4:0])
              5'h00: out_low = 10'h02b;
              5'h01: out_low = 10'h02b;
              5'h02: out_low = 10'h02b;
              5'h03: out_low = 10'h02b;
              5'h04: out_low = 10'h02b;
              5'h05: out_low = 10'h02b;
              5'h06: out_low = 10'h02b;
              5'h07: out_low = 10'h02b;
              5'h08: out_low = 10'h02b;
              5'h09: out_low = 10'h02b;
              5'h0a: out_low = 10'h02b;
              5'h0b: out_low = 10'h02b;
              5'h0c: out_low = 10'h02b;
              5'h0d: out_low = 10'h02b;
              5'h0e: out_low = 10'h02b;
              5'h0f: out_low = 10'h02c;
              5'h10: out_low = 10'h02c;
              5'h11: out_low = 10'h02c;
              5'h12: out_low = 10'h02c;
              5'h13: out_low = 10'h02c;
              5'h14: out_low = 10'h02c;
              5'h15: out_low = 10'h02c;
              5'h16: out_low = 10'h02c;
              5'h17: out_low = 10'h02c;
              5'h18: out_low = 10'h02c;
              5'h19: out_low = 10'h02c;
              5'h1a: out_low = 10'h02c;
              5'h1b: out_low = 10'h02c;
              5'h1c: out_low = 10'h02c;
              5'h1d: out_low = 10'h02c;
              5'h1e: out_low = 10'h02c;
              5'h1f: out_low = 10'h02c;
              default: out_low = 10'h000;
            endcase
          end
          5'h1e: begin
            case (mant[4:0])
              5'h00: out_low = 10'h02c;
              5'h01: out_low = 10'h02c;
              5'h02: out_low = 10'h02c;
              5'h03: out_low = 10'h02c;
              5'h04: out_low = 10'h02c;
              5'h05: out_low = 10'h02c;
              5'h06: out_low = 10'h02c;
              5'h07: out_low = 10'h02c;
              5'h08: out_low = 10'h02c;
              5'h09: out_low = 10'h02c;
              5'h0a: out_low = 10'h02c;
              5'h0b: out_low = 10'h02c;
              5'h0c: out_low = 10'h02c;
              5'h0d: out_low = 10'h02c;
              5'h0e: out_low = 10'h02c;
              5'h0f: out_low = 10'h02c;
              5'h10: out_low = 10'h02c;
              5'h11: out_low = 10'h02c;
              5'h12: out_low = 10'h02c;
              5'h13: out_low = 10'h02c;
              5'h14: out_low = 10'h02c;
              5'h15: out_low = 10'h02c;
              5'h16: out_low = 10'h02c;
              5'h17: out_low = 10'h02c;
              5'h18: out_low = 10'h02c;
              5'h19: out_low = 10'h02c;
              5'h1a: out_low = 10'h02c;
              5'h1b: out_low = 10'h02c;
              5'h1c: out_low = 10'h02d;
              5'h1d: out_low = 10'h02d;
              5'h1e: out_low = 10'h02d;
              5'h1f: out_low = 10'h02d;
              default: out_low = 10'h000;
            endcase
          end
          5'h1f: out_low = 10'h02d;
          default: out_low = 10'h000;
        endcase
      end
      6'h0b: begin
        case (mant[9:5])
          5'h00: begin
            case (mant[4:0])
              5'h00: out_low = 10'h02d;
              5'h01: out_low = 10'h02d;
              5'h02: out_low = 10'h02d;
              5'h03: out_low = 10'h02d;
              5'h04: out_low = 10'h02e;
              5'h05: out_low = 10'h02e;
              5'h06: out_low = 10'h02e;
              5'h07: out_low = 10'h02e;
              5'h08: out_low = 10'h02e;
              5'h09: out_low = 10'h02e;
              5'h0a: out_low = 10'h02e;
              5'h0b: out_low = 10'h02e;
              5'h0c: out_low = 10'h02e;
              5'h0d: out_low = 10'h02e;
              5'h0e: out_low = 10'h02e;
              5'h0f: out_low = 10'h02e;
              5'h10: out_low = 10'h02e;
              5'h11: out_low = 10'h02e;
              5'h12: out_low = 10'h02e;
              5'h13: out_low = 10'h02e;
              5'h14: out_low = 10'h02e;
              5'h15: out_low = 10'h02e;
              5'h16: out_low = 10'h02e;
              5'h17: out_low = 10'h02e;
              5'h18: out_low = 10'h02e;
              5'h19: out_low = 10'h02e;
              5'h1a: out_low = 10'h02f;
              5'h1b: out_low = 10'h02f;
              5'h1c: out_low = 10'h02f;
              5'h1d: out_low = 10'h02f;
              5'h1e: out_low = 10'h02f;
              5'h1f: out_low = 10'h02f;
              default: out_low = 10'h000;
            endcase
          end
          5'h01: begin
            case (mant[4:0])
              5'h00: out_low = 10'h02f;
              5'h01: out_low = 10'h02f;
              5'h02: out_low = 10'h02f;
              5'h03: out_low = 10'h02f;
              5'h04: out_low = 10'h02f;
              5'h05: out_low = 10'h02f;
              5'h06: out_low = 10'h02f;
              5'h07: out_low = 10'h02f;
              5'h08: out_low = 10'h02f;
              5'h09: out_low = 10'h02f;
              5'h0a: out_low = 10'h02f;
              5'h0b: out_low = 10'h02f;
              5'h0c: out_low = 10'h02f;
              5'h0d: out_low = 10'h02f;
              5'h0e: out_low = 10'h02f;
              5'h0f: out_low = 10'h02f;
              5'h10: out_low = 10'h030;
              5'h11: out_low = 10'h030;
              5'h12: out_low = 10'h030;
              5'h13: out_low = 10'h030;
              5'h14: out_low = 10'h030;
              5'h15: out_low = 10'h030;
              5'h16: out_low = 10'h030;
              5'h17: out_low = 10'h030;
              5'h18: out_low = 10'h030;
              5'h19: out_low = 10'h030;
              5'h1a: out_low = 10'h030;
              5'h1b: out_low = 10'h030;
              5'h1c: out_low = 10'h030;
              5'h1d: out_low = 10'h030;
              5'h1e: out_low = 10'h030;
              5'h1f: out_low = 10'h030;
              default: out_low = 10'h000;
            endcase
          end
          5'h02: begin
            case (mant[4:0])
              5'h00: out_low = 10'h030;
              5'h01: out_low = 10'h030;
              5'h02: out_low = 10'h030;
              5'h03: out_low = 10'h030;
              5'h04: out_low = 10'h030;
              5'h05: out_low = 10'h030;
              5'h06: out_low = 10'h031;
              5'h07: out_low = 10'h031;
              5'h08: out_low = 10'h031;
              5'h09: out_low = 10'h031;
              5'h0a: out_low = 10'h031;
              5'h0b: out_low = 10'h031;
              5'h0c: out_low = 10'h031;
              5'h0d: out_low = 10'h031;
              5'h0e: out_low = 10'h031;
              5'h0f: out_low = 10'h031;
              5'h10: out_low = 10'h031;
              5'h11: out_low = 10'h031;
              5'h12: out_low = 10'h031;
              5'h13: out_low = 10'h031;
              5'h14: out_low = 10'h031;
              5'h15: out_low = 10'h031;
              5'h16: out_low = 10'h031;
              5'h17: out_low = 10'h031;
              5'h18: out_low = 10'h031;
              5'h19: out_low = 10'h031;
              5'h1a: out_low = 10'h031;
              5'h1b: out_low = 10'h031;
              5'h1c: out_low = 10'h032;
              5'h1d: out_low = 10'h032;
              5'h1e: out_low = 10'h032;
              5'h1f: out_low = 10'h032;
              default: out_low = 10'h000;
            endcase
          end
          5'h03: begin
            case (mant[4:0])
              5'h00: out_low = 10'h032;
              5'h01: out_low = 10'h032;
              5'h02: out_low = 10'h032;
              5'h03: out_low = 10'h032;
              5'h04: out_low = 10'h032;
              5'h05: out_low = 10'h032;
              5'h06: out_low = 10'h032;
              5'h07: out_low = 10'h032;
              5'h08: out_low = 10'h032;
              5'h09: out_low = 10'h032;
              5'h0a: out_low = 10'h032;
              5'h0b: out_low = 10'h032;
              5'h0c: out_low = 10'h032;
              5'h0d: out_low = 10'h032;
              5'h0e: out_low = 10'h032;
              5'h0f: out_low = 10'h032;
              5'h10: out_low = 10'h032;
              5'h11: out_low = 10'h032;
              5'h12: out_low = 10'h033;
              5'h13: out_low = 10'h033;
              5'h14: out_low = 10'h033;
              5'h15: out_low = 10'h033;
              5'h16: out_low = 10'h033;
              5'h17: out_low = 10'h033;
              5'h18: out_low = 10'h033;
              5'h19: out_low = 10'h033;
              5'h1a: out_low = 10'h033;
              5'h1b: out_low = 10'h033;
              5'h1c: out_low = 10'h033;
              5'h1d: out_low = 10'h033;
              5'h1e: out_low = 10'h033;
              5'h1f: out_low = 10'h033;
              default: out_low = 10'h000;
            endcase
          end
          5'h04: begin
            case (mant[4:0])
              5'h00: out_low = 10'h033;
              5'h01: out_low = 10'h033;
              5'h02: out_low = 10'h033;
              5'h03: out_low = 10'h033;
              5'h04: out_low = 10'h033;
              5'h05: out_low = 10'h033;
              5'h06: out_low = 10'h033;
              5'h07: out_low = 10'h033;
              5'h08: out_low = 10'h034;
              5'h09: out_low = 10'h034;
              5'h0a: out_low = 10'h034;
              5'h0b: out_low = 10'h034;
              5'h0c: out_low = 10'h034;
              5'h0d: out_low = 10'h034;
              5'h0e: out_low = 10'h034;
              5'h0f: out_low = 10'h034;
              5'h10: out_low = 10'h034;
              5'h11: out_low = 10'h034;
              5'h12: out_low = 10'h034;
              5'h13: out_low = 10'h034;
              5'h14: out_low = 10'h034;
              5'h15: out_low = 10'h034;
              5'h16: out_low = 10'h034;
              5'h17: out_low = 10'h034;
              5'h18: out_low = 10'h034;
              5'h19: out_low = 10'h034;
              5'h1a: out_low = 10'h034;
              5'h1b: out_low = 10'h034;
              5'h1c: out_low = 10'h034;
              5'h1d: out_low = 10'h034;
              5'h1e: out_low = 10'h035;
              5'h1f: out_low = 10'h035;
              default: out_low = 10'h000;
            endcase
          end
          5'h05: begin
            case (mant[4:0])
              5'h00: out_low = 10'h035;
              5'h01: out_low = 10'h035;
              5'h02: out_low = 10'h035;
              5'h03: out_low = 10'h035;
              5'h04: out_low = 10'h035;
              5'h05: out_low = 10'h035;
              5'h06: out_low = 10'h035;
              5'h07: out_low = 10'h035;
              5'h08: out_low = 10'h035;
              5'h09: out_low = 10'h035;
              5'h0a: out_low = 10'h035;
              5'h0b: out_low = 10'h035;
              5'h0c: out_low = 10'h035;
              5'h0d: out_low = 10'h035;
              5'h0e: out_low = 10'h035;
              5'h0f: out_low = 10'h035;
              5'h10: out_low = 10'h035;
              5'h11: out_low = 10'h035;
              5'h12: out_low = 10'h035;
              5'h13: out_low = 10'h035;
              5'h14: out_low = 10'h036;
              5'h15: out_low = 10'h036;
              5'h16: out_low = 10'h036;
              5'h17: out_low = 10'h036;
              5'h18: out_low = 10'h036;
              5'h19: out_low = 10'h036;
              5'h1a: out_low = 10'h036;
              5'h1b: out_low = 10'h036;
              5'h1c: out_low = 10'h036;
              5'h1d: out_low = 10'h036;
              5'h1e: out_low = 10'h036;
              5'h1f: out_low = 10'h036;
              default: out_low = 10'h000;
            endcase
          end
          5'h06: begin
            case (mant[4:0])
              5'h00: out_low = 10'h036;
              5'h01: out_low = 10'h036;
              5'h02: out_low = 10'h036;
              5'h03: out_low = 10'h036;
              5'h04: out_low = 10'h036;
              5'h05: out_low = 10'h036;
              5'h06: out_low = 10'h036;
              5'h07: out_low = 10'h036;
              5'h08: out_low = 10'h036;
              5'h09: out_low = 10'h036;
              5'h0a: out_low = 10'h037;
              5'h0b: out_low = 10'h037;
              5'h0c: out_low = 10'h037;
              5'h0d: out_low = 10'h037;
              5'h0e: out_low = 10'h037;
              5'h0f: out_low = 10'h037;
              5'h10: out_low = 10'h037;
              5'h11: out_low = 10'h037;
              5'h12: out_low = 10'h037;
              5'h13: out_low = 10'h037;
              5'h14: out_low = 10'h037;
              5'h15: out_low = 10'h037;
              5'h16: out_low = 10'h037;
              5'h17: out_low = 10'h037;
              5'h18: out_low = 10'h037;
              5'h19: out_low = 10'h037;
              5'h1a: out_low = 10'h037;
              5'h1b: out_low = 10'h037;
              5'h1c: out_low = 10'h037;
              5'h1d: out_low = 10'h037;
              5'h1e: out_low = 10'h037;
              5'h1f: out_low = 10'h037;
              default: out_low = 10'h000;
            endcase
          end
          5'h07: begin
            case (mant[4:0])
              5'h00: out_low = 10'h038;
              5'h01: out_low = 10'h038;
              5'h02: out_low = 10'h038;
              5'h03: out_low = 10'h038;
              5'h04: out_low = 10'h038;
              5'h05: out_low = 10'h038;
              5'h06: out_low = 10'h038;
              5'h07: out_low = 10'h038;
              5'h08: out_low = 10'h038;
              5'h09: out_low = 10'h038;
              5'h0a: out_low = 10'h038;
              5'h0b: out_low = 10'h038;
              5'h0c: out_low = 10'h038;
              5'h0d: out_low = 10'h038;
              5'h0e: out_low = 10'h038;
              5'h0f: out_low = 10'h038;
              5'h10: out_low = 10'h038;
              5'h11: out_low = 10'h038;
              5'h12: out_low = 10'h038;
              5'h13: out_low = 10'h038;
              5'h14: out_low = 10'h038;
              5'h15: out_low = 10'h038;
              5'h16: out_low = 10'h039;
              5'h17: out_low = 10'h039;
              5'h18: out_low = 10'h039;
              5'h19: out_low = 10'h039;
              5'h1a: out_low = 10'h039;
              5'h1b: out_low = 10'h039;
              5'h1c: out_low = 10'h039;
              5'h1d: out_low = 10'h039;
              5'h1e: out_low = 10'h039;
              5'h1f: out_low = 10'h039;
              default: out_low = 10'h000;
            endcase
          end
          5'h08: begin
            case (mant[4:0])
              5'h00: out_low = 10'h039;
              5'h01: out_low = 10'h039;
              5'h02: out_low = 10'h039;
              5'h03: out_low = 10'h039;
              5'h04: out_low = 10'h039;
              5'h05: out_low = 10'h039;
              5'h06: out_low = 10'h039;
              5'h07: out_low = 10'h039;
              5'h08: out_low = 10'h039;
              5'h09: out_low = 10'h039;
              5'h0a: out_low = 10'h039;
              5'h0b: out_low = 10'h039;
              5'h0c: out_low = 10'h03a;
              5'h0d: out_low = 10'h03a;
              5'h0e: out_low = 10'h03a;
              5'h0f: out_low = 10'h03a;
              5'h10: out_low = 10'h03a;
              5'h11: out_low = 10'h03a;
              5'h12: out_low = 10'h03a;
              5'h13: out_low = 10'h03a;
              5'h14: out_low = 10'h03a;
              5'h15: out_low = 10'h03a;
              5'h16: out_low = 10'h03a;
              5'h17: out_low = 10'h03a;
              5'h18: out_low = 10'h03a;
              5'h19: out_low = 10'h03a;
              5'h1a: out_low = 10'h03a;
              5'h1b: out_low = 10'h03a;
              5'h1c: out_low = 10'h03a;
              5'h1d: out_low = 10'h03a;
              5'h1e: out_low = 10'h03a;
              5'h1f: out_low = 10'h03a;
              default: out_low = 10'h000;
            endcase
          end
          5'h09: begin
            case (mant[4:0])
              5'h00: out_low = 10'h03a;
              5'h01: out_low = 10'h03a;
              5'h02: out_low = 10'h03b;
              5'h03: out_low = 10'h03b;
              5'h04: out_low = 10'h03b;
              5'h05: out_low = 10'h03b;
              5'h06: out_low = 10'h03b;
              5'h07: out_low = 10'h03b;
              5'h08: out_low = 10'h03b;
              5'h09: out_low = 10'h03b;
              5'h0a: out_low = 10'h03b;
              5'h0b: out_low = 10'h03b;
              5'h0c: out_low = 10'h03b;
              5'h0d: out_low = 10'h03b;
              5'h0e: out_low = 10'h03b;
              5'h0f: out_low = 10'h03b;
              5'h10: out_low = 10'h03b;
              5'h11: out_low = 10'h03b;
              5'h12: out_low = 10'h03b;
              5'h13: out_low = 10'h03b;
              5'h14: out_low = 10'h03b;
              5'h15: out_low = 10'h03b;
              5'h16: out_low = 10'h03b;
              5'h17: out_low = 10'h03b;
              5'h18: out_low = 10'h03c;
              5'h19: out_low = 10'h03c;
              5'h1a: out_low = 10'h03c;
              5'h1b: out_low = 10'h03c;
              5'h1c: out_low = 10'h03c;
              5'h1d: out_low = 10'h03c;
              5'h1e: out_low = 10'h03c;
              5'h1f: out_low = 10'h03c;
              default: out_low = 10'h000;
            endcase
          end
          5'h0a: begin
            case (mant[4:0])
              5'h00: out_low = 10'h03c;
              5'h01: out_low = 10'h03c;
              5'h02: out_low = 10'h03c;
              5'h03: out_low = 10'h03c;
              5'h04: out_low = 10'h03c;
              5'h05: out_low = 10'h03c;
              5'h06: out_low = 10'h03c;
              5'h07: out_low = 10'h03c;
              5'h08: out_low = 10'h03c;
              5'h09: out_low = 10'h03c;
              5'h0a: out_low = 10'h03c;
              5'h0b: out_low = 10'h03c;
              5'h0c: out_low = 10'h03c;
              5'h0d: out_low = 10'h03d;
              5'h0e: out_low = 10'h03d;
              5'h0f: out_low = 10'h03d;
              5'h10: out_low = 10'h03d;
              5'h11: out_low = 10'h03d;
              5'h12: out_low = 10'h03d;
              5'h13: out_low = 10'h03d;
              5'h14: out_low = 10'h03d;
              5'h15: out_low = 10'h03d;
              5'h16: out_low = 10'h03d;
              5'h17: out_low = 10'h03d;
              5'h18: out_low = 10'h03d;
              5'h19: out_low = 10'h03d;
              5'h1a: out_low = 10'h03d;
              5'h1b: out_low = 10'h03d;
              5'h1c: out_low = 10'h03d;
              5'h1d: out_low = 10'h03d;
              5'h1e: out_low = 10'h03d;
              5'h1f: out_low = 10'h03d;
              default: out_low = 10'h000;
            endcase
          end
          5'h0b: begin
            case (mant[4:0])
              5'h00: out_low = 10'h03d;
              5'h01: out_low = 10'h03d;
              5'h02: out_low = 10'h03d;
              5'h03: out_low = 10'h03e;
              5'h04: out_low = 10'h03e;
              5'h05: out_low = 10'h03e;
              5'h06: out_low = 10'h03e;
              5'h07: out_low = 10'h03e;
              5'h08: out_low = 10'h03e;
              5'h09: out_low = 10'h03e;
              5'h0a: out_low = 10'h03e;
              5'h0b: out_low = 10'h03e;
              5'h0c: out_low = 10'h03e;
              5'h0d: out_low = 10'h03e;
              5'h0e: out_low = 10'h03e;
              5'h0f: out_low = 10'h03e;
              5'h10: out_low = 10'h03e;
              5'h11: out_low = 10'h03e;
              5'h12: out_low = 10'h03e;
              5'h13: out_low = 10'h03e;
              5'h14: out_low = 10'h03e;
              5'h15: out_low = 10'h03e;
              5'h16: out_low = 10'h03e;
              5'h17: out_low = 10'h03e;
              5'h18: out_low = 10'h03e;
              5'h19: out_low = 10'h03f;
              5'h1a: out_low = 10'h03f;
              5'h1b: out_low = 10'h03f;
              5'h1c: out_low = 10'h03f;
              5'h1d: out_low = 10'h03f;
              5'h1e: out_low = 10'h03f;
              5'h1f: out_low = 10'h03f;
              default: out_low = 10'h000;
            endcase
          end
          5'h0c: begin
            case (mant[4:0])
              5'h00: out_low = 10'h03f;
              5'h01: out_low = 10'h03f;
              5'h02: out_low = 10'h03f;
              5'h03: out_low = 10'h03f;
              5'h04: out_low = 10'h03f;
              5'h05: out_low = 10'h03f;
              5'h06: out_low = 10'h03f;
              5'h07: out_low = 10'h03f;
              5'h08: out_low = 10'h03f;
              5'h09: out_low = 10'h03f;
              5'h0a: out_low = 10'h03f;
              5'h0b: out_low = 10'h03f;
              5'h0c: out_low = 10'h03f;
              5'h0d: out_low = 10'h03f;
              5'h0e: out_low = 10'h03f;
              5'h0f: out_low = 10'h040;
              5'h10: out_low = 10'h040;
              5'h11: out_low = 10'h040;
              5'h12: out_low = 10'h040;
              5'h13: out_low = 10'h040;
              5'h14: out_low = 10'h040;
              5'h15: out_low = 10'h040;
              5'h16: out_low = 10'h040;
              5'h17: out_low = 10'h040;
              5'h18: out_low = 10'h040;
              5'h19: out_low = 10'h040;
              5'h1a: out_low = 10'h040;
              5'h1b: out_low = 10'h040;
              5'h1c: out_low = 10'h040;
              5'h1d: out_low = 10'h040;
              5'h1e: out_low = 10'h040;
              5'h1f: out_low = 10'h040;
              default: out_low = 10'h000;
            endcase
          end
          5'h0d: begin
            case (mant[4:0])
              5'h00: out_low = 10'h040;
              5'h01: out_low = 10'h040;
              5'h02: out_low = 10'h040;
              5'h03: out_low = 10'h040;
              5'h04: out_low = 10'h041;
              5'h05: out_low = 10'h041;
              5'h06: out_low = 10'h041;
              5'h07: out_low = 10'h041;
              5'h08: out_low = 10'h041;
              5'h09: out_low = 10'h041;
              5'h0a: out_low = 10'h041;
              5'h0b: out_low = 10'h041;
              5'h0c: out_low = 10'h041;
              5'h0d: out_low = 10'h041;
              5'h0e: out_low = 10'h041;
              5'h0f: out_low = 10'h041;
              5'h10: out_low = 10'h041;
              5'h11: out_low = 10'h041;
              5'h12: out_low = 10'h041;
              5'h13: out_low = 10'h041;
              5'h14: out_low = 10'h041;
              5'h15: out_low = 10'h041;
              5'h16: out_low = 10'h041;
              5'h17: out_low = 10'h041;
              5'h18: out_low = 10'h041;
              5'h19: out_low = 10'h041;
              5'h1a: out_low = 10'h042;
              5'h1b: out_low = 10'h042;
              5'h1c: out_low = 10'h042;
              5'h1d: out_low = 10'h042;
              5'h1e: out_low = 10'h042;
              5'h1f: out_low = 10'h042;
              default: out_low = 10'h000;
            endcase
          end
          5'h0e: begin
            case (mant[4:0])
              5'h00: out_low = 10'h042;
              5'h01: out_low = 10'h042;
              5'h02: out_low = 10'h042;
              5'h03: out_low = 10'h042;
              5'h04: out_low = 10'h042;
              5'h05: out_low = 10'h042;
              5'h06: out_low = 10'h042;
              5'h07: out_low = 10'h042;
              5'h08: out_low = 10'h042;
              5'h09: out_low = 10'h042;
              5'h0a: out_low = 10'h042;
              5'h0b: out_low = 10'h042;
              5'h0c: out_low = 10'h042;
              5'h0d: out_low = 10'h042;
              5'h0e: out_low = 10'h042;
              5'h0f: out_low = 10'h042;
              5'h10: out_low = 10'h043;
              5'h11: out_low = 10'h043;
              5'h12: out_low = 10'h043;
              5'h13: out_low = 10'h043;
              5'h14: out_low = 10'h043;
              5'h15: out_low = 10'h043;
              5'h16: out_low = 10'h043;
              5'h17: out_low = 10'h043;
              5'h18: out_low = 10'h043;
              5'h19: out_low = 10'h043;
              5'h1a: out_low = 10'h043;
              5'h1b: out_low = 10'h043;
              5'h1c: out_low = 10'h043;
              5'h1d: out_low = 10'h043;
              5'h1e: out_low = 10'h043;
              5'h1f: out_low = 10'h043;
              default: out_low = 10'h000;
            endcase
          end
          5'h0f: begin
            case (mant[4:0])
              5'h00: out_low = 10'h043;
              5'h01: out_low = 10'h043;
              5'h02: out_low = 10'h043;
              5'h03: out_low = 10'h043;
              5'h04: out_low = 10'h043;
              5'h05: out_low = 10'h044;
              5'h06: out_low = 10'h044;
              5'h07: out_low = 10'h044;
              5'h08: out_low = 10'h044;
              5'h09: out_low = 10'h044;
              5'h0a: out_low = 10'h044;
              5'h0b: out_low = 10'h044;
              5'h0c: out_low = 10'h044;
              5'h0d: out_low = 10'h044;
              5'h0e: out_low = 10'h044;
              5'h0f: out_low = 10'h044;
              5'h10: out_low = 10'h044;
              5'h11: out_low = 10'h044;
              5'h12: out_low = 10'h044;
              5'h13: out_low = 10'h044;
              5'h14: out_low = 10'h044;
              5'h15: out_low = 10'h044;
              5'h16: out_low = 10'h044;
              5'h17: out_low = 10'h044;
              5'h18: out_low = 10'h044;
              5'h19: out_low = 10'h044;
              5'h1a: out_low = 10'h044;
              5'h1b: out_low = 10'h045;
              5'h1c: out_low = 10'h045;
              5'h1d: out_low = 10'h045;
              5'h1e: out_low = 10'h045;
              5'h1f: out_low = 10'h045;
              default: out_low = 10'h000;
            endcase
          end
          5'h10: begin
            case (mant[4:0])
              5'h00: out_low = 10'h045;
              5'h01: out_low = 10'h045;
              5'h02: out_low = 10'h045;
              5'h03: out_low = 10'h045;
              5'h04: out_low = 10'h045;
              5'h05: out_low = 10'h045;
              5'h06: out_low = 10'h045;
              5'h07: out_low = 10'h045;
              5'h08: out_low = 10'h045;
              5'h09: out_low = 10'h045;
              5'h0a: out_low = 10'h045;
              5'h0b: out_low = 10'h045;
              5'h0c: out_low = 10'h045;
              5'h0d: out_low = 10'h045;
              5'h0e: out_low = 10'h045;
              5'h0f: out_low = 10'h045;
              5'h10: out_low = 10'h045;
              5'h11: out_low = 10'h046;
              5'h12: out_low = 10'h046;
              5'h13: out_low = 10'h046;
              5'h14: out_low = 10'h046;
              5'h15: out_low = 10'h046;
              5'h16: out_low = 10'h046;
              5'h17: out_low = 10'h046;
              5'h18: out_low = 10'h046;
              5'h19: out_low = 10'h046;
              5'h1a: out_low = 10'h046;
              5'h1b: out_low = 10'h046;
              5'h1c: out_low = 10'h046;
              5'h1d: out_low = 10'h046;
              5'h1e: out_low = 10'h046;
              5'h1f: out_low = 10'h046;
              default: out_low = 10'h000;
            endcase
          end
          5'h11: begin
            case (mant[4:0])
              5'h00: out_low = 10'h046;
              5'h01: out_low = 10'h046;
              5'h02: out_low = 10'h046;
              5'h03: out_low = 10'h046;
              5'h04: out_low = 10'h046;
              5'h05: out_low = 10'h046;
              5'h06: out_low = 10'h047;
              5'h07: out_low = 10'h047;
              5'h08: out_low = 10'h047;
              5'h09: out_low = 10'h047;
              5'h0a: out_low = 10'h047;
              5'h0b: out_low = 10'h047;
              5'h0c: out_low = 10'h047;
              5'h0d: out_low = 10'h047;
              5'h0e: out_low = 10'h047;
              5'h0f: out_low = 10'h047;
              5'h10: out_low = 10'h047;
              5'h11: out_low = 10'h047;
              5'h12: out_low = 10'h047;
              5'h13: out_low = 10'h047;
              5'h14: out_low = 10'h047;
              5'h15: out_low = 10'h047;
              5'h16: out_low = 10'h047;
              5'h17: out_low = 10'h047;
              5'h18: out_low = 10'h047;
              5'h19: out_low = 10'h047;
              5'h1a: out_low = 10'h047;
              5'h1b: out_low = 10'h047;
              5'h1c: out_low = 10'h048;
              5'h1d: out_low = 10'h048;
              5'h1e: out_low = 10'h048;
              5'h1f: out_low = 10'h048;
              default: out_low = 10'h000;
            endcase
          end
          5'h12: begin
            case (mant[4:0])
              5'h00: out_low = 10'h048;
              5'h01: out_low = 10'h048;
              5'h02: out_low = 10'h048;
              5'h03: out_low = 10'h048;
              5'h04: out_low = 10'h048;
              5'h05: out_low = 10'h048;
              5'h06: out_low = 10'h048;
              5'h07: out_low = 10'h048;
              5'h08: out_low = 10'h048;
              5'h09: out_low = 10'h048;
              5'h0a: out_low = 10'h048;
              5'h0b: out_low = 10'h048;
              5'h0c: out_low = 10'h048;
              5'h0d: out_low = 10'h048;
              5'h0e: out_low = 10'h048;
              5'h0f: out_low = 10'h048;
              5'h10: out_low = 10'h048;
              5'h11: out_low = 10'h049;
              5'h12: out_low = 10'h049;
              5'h13: out_low = 10'h049;
              5'h14: out_low = 10'h049;
              5'h15: out_low = 10'h049;
              5'h16: out_low = 10'h049;
              5'h17: out_low = 10'h049;
              5'h18: out_low = 10'h049;
              5'h19: out_low = 10'h049;
              5'h1a: out_low = 10'h049;
              5'h1b: out_low = 10'h049;
              5'h1c: out_low = 10'h049;
              5'h1d: out_low = 10'h049;
              5'h1e: out_low = 10'h049;
              5'h1f: out_low = 10'h049;
              default: out_low = 10'h000;
            endcase
          end
          5'h13: begin
            case (mant[4:0])
              5'h00: out_low = 10'h049;
              5'h01: out_low = 10'h049;
              5'h02: out_low = 10'h049;
              5'h03: out_low = 10'h049;
              5'h04: out_low = 10'h049;
              5'h05: out_low = 10'h049;
              5'h06: out_low = 10'h049;
              5'h07: out_low = 10'h04a;
              5'h08: out_low = 10'h04a;
              5'h09: out_low = 10'h04a;
              5'h0a: out_low = 10'h04a;
              5'h0b: out_low = 10'h04a;
              5'h0c: out_low = 10'h04a;
              5'h0d: out_low = 10'h04a;
              5'h0e: out_low = 10'h04a;
              5'h0f: out_low = 10'h04a;
              5'h10: out_low = 10'h04a;
              5'h11: out_low = 10'h04a;
              5'h12: out_low = 10'h04a;
              5'h13: out_low = 10'h04a;
              5'h14: out_low = 10'h04a;
              5'h15: out_low = 10'h04a;
              5'h16: out_low = 10'h04a;
              5'h17: out_low = 10'h04a;
              5'h18: out_low = 10'h04a;
              5'h19: out_low = 10'h04a;
              5'h1a: out_low = 10'h04a;
              5'h1b: out_low = 10'h04a;
              5'h1c: out_low = 10'h04a;
              5'h1d: out_low = 10'h04b;
              5'h1e: out_low = 10'h04b;
              5'h1f: out_low = 10'h04b;
              default: out_low = 10'h000;
            endcase
          end
          5'h14: begin
            case (mant[4:0])
              5'h00: out_low = 10'h04b;
              5'h01: out_low = 10'h04b;
              5'h02: out_low = 10'h04b;
              5'h03: out_low = 10'h04b;
              5'h04: out_low = 10'h04b;
              5'h05: out_low = 10'h04b;
              5'h06: out_low = 10'h04b;
              5'h07: out_low = 10'h04b;
              5'h08: out_low = 10'h04b;
              5'h09: out_low = 10'h04b;
              5'h0a: out_low = 10'h04b;
              5'h0b: out_low = 10'h04b;
              5'h0c: out_low = 10'h04b;
              5'h0d: out_low = 10'h04b;
              5'h0e: out_low = 10'h04b;
              5'h0f: out_low = 10'h04b;
              5'h10: out_low = 10'h04b;
              5'h11: out_low = 10'h04b;
              5'h12: out_low = 10'h04c;
              5'h13: out_low = 10'h04c;
              5'h14: out_low = 10'h04c;
              5'h15: out_low = 10'h04c;
              5'h16: out_low = 10'h04c;
              5'h17: out_low = 10'h04c;
              5'h18: out_low = 10'h04c;
              5'h19: out_low = 10'h04c;
              5'h1a: out_low = 10'h04c;
              5'h1b: out_low = 10'h04c;
              5'h1c: out_low = 10'h04c;
              5'h1d: out_low = 10'h04c;
              5'h1e: out_low = 10'h04c;
              5'h1f: out_low = 10'h04c;
              default: out_low = 10'h000;
            endcase
          end
          5'h15: begin
            case (mant[4:0])
              5'h00: out_low = 10'h04c;
              5'h01: out_low = 10'h04c;
              5'h02: out_low = 10'h04c;
              5'h03: out_low = 10'h04c;
              5'h04: out_low = 10'h04c;
              5'h05: out_low = 10'h04c;
              5'h06: out_low = 10'h04c;
              5'h07: out_low = 10'h04c;
              5'h08: out_low = 10'h04d;
              5'h09: out_low = 10'h04d;
              5'h0a: out_low = 10'h04d;
              5'h0b: out_low = 10'h04d;
              5'h0c: out_low = 10'h04d;
              5'h0d: out_low = 10'h04d;
              5'h0e: out_low = 10'h04d;
              5'h0f: out_low = 10'h04d;
              5'h10: out_low = 10'h04d;
              5'h11: out_low = 10'h04d;
              5'h12: out_low = 10'h04d;
              5'h13: out_low = 10'h04d;
              5'h14: out_low = 10'h04d;
              5'h15: out_low = 10'h04d;
              5'h16: out_low = 10'h04d;
              5'h17: out_low = 10'h04d;
              5'h18: out_low = 10'h04d;
              5'h19: out_low = 10'h04d;
              5'h1a: out_low = 10'h04d;
              5'h1b: out_low = 10'h04d;
              5'h1c: out_low = 10'h04d;
              5'h1d: out_low = 10'h04e;
              5'h1e: out_low = 10'h04e;
              5'h1f: out_low = 10'h04e;
              default: out_low = 10'h000;
            endcase
          end
          5'h16: begin
            case (mant[4:0])
              5'h00: out_low = 10'h04e;
              5'h01: out_low = 10'h04e;
              5'h02: out_low = 10'h04e;
              5'h03: out_low = 10'h04e;
              5'h04: out_low = 10'h04e;
              5'h05: out_low = 10'h04e;
              5'h06: out_low = 10'h04e;
              5'h07: out_low = 10'h04e;
              5'h08: out_low = 10'h04e;
              5'h09: out_low = 10'h04e;
              5'h0a: out_low = 10'h04e;
              5'h0b: out_low = 10'h04e;
              5'h0c: out_low = 10'h04e;
              5'h0d: out_low = 10'h04e;
              5'h0e: out_low = 10'h04e;
              5'h0f: out_low = 10'h04e;
              5'h10: out_low = 10'h04e;
              5'h11: out_low = 10'h04e;
              5'h12: out_low = 10'h04f;
              5'h13: out_low = 10'h04f;
              5'h14: out_low = 10'h04f;
              5'h15: out_low = 10'h04f;
              5'h16: out_low = 10'h04f;
              5'h17: out_low = 10'h04f;
              5'h18: out_low = 10'h04f;
              5'h19: out_low = 10'h04f;
              5'h1a: out_low = 10'h04f;
              5'h1b: out_low = 10'h04f;
              5'h1c: out_low = 10'h04f;
              5'h1d: out_low = 10'h04f;
              5'h1e: out_low = 10'h04f;
              5'h1f: out_low = 10'h04f;
              default: out_low = 10'h000;
            endcase
          end
          5'h17: begin
            case (mant[4:0])
              5'h00: out_low = 10'h04f;
              5'h01: out_low = 10'h04f;
              5'h02: out_low = 10'h04f;
              5'h03: out_low = 10'h04f;
              5'h04: out_low = 10'h04f;
              5'h05: out_low = 10'h04f;
              5'h06: out_low = 10'h04f;
              5'h07: out_low = 10'h04f;
              5'h08: out_low = 10'h050;
              5'h09: out_low = 10'h050;
              5'h0a: out_low = 10'h050;
              5'h0b: out_low = 10'h050;
              5'h0c: out_low = 10'h050;
              5'h0d: out_low = 10'h050;
              5'h0e: out_low = 10'h050;
              5'h0f: out_low = 10'h050;
              5'h10: out_low = 10'h050;
              5'h11: out_low = 10'h050;
              5'h12: out_low = 10'h050;
              5'h13: out_low = 10'h050;
              5'h14: out_low = 10'h050;
              5'h15: out_low = 10'h050;
              5'h16: out_low = 10'h050;
              5'h17: out_low = 10'h050;
              5'h18: out_low = 10'h050;
              5'h19: out_low = 10'h050;
              5'h1a: out_low = 10'h050;
              5'h1b: out_low = 10'h050;
              5'h1c: out_low = 10'h050;
              5'h1d: out_low = 10'h051;
              5'h1e: out_low = 10'h051;
              5'h1f: out_low = 10'h051;
              default: out_low = 10'h000;
            endcase
          end
          5'h18: begin
            case (mant[4:0])
              5'h00: out_low = 10'h051;
              5'h01: out_low = 10'h051;
              5'h02: out_low = 10'h051;
              5'h03: out_low = 10'h051;
              5'h04: out_low = 10'h051;
              5'h05: out_low = 10'h051;
              5'h06: out_low = 10'h051;
              5'h07: out_low = 10'h051;
              5'h08: out_low = 10'h051;
              5'h09: out_low = 10'h051;
              5'h0a: out_low = 10'h051;
              5'h0b: out_low = 10'h051;
              5'h0c: out_low = 10'h051;
              5'h0d: out_low = 10'h051;
              5'h0e: out_low = 10'h051;
              5'h0f: out_low = 10'h051;
              5'h10: out_low = 10'h051;
              5'h11: out_low = 10'h051;
              5'h12: out_low = 10'h051;
              5'h13: out_low = 10'h052;
              5'h14: out_low = 10'h052;
              5'h15: out_low = 10'h052;
              5'h16: out_low = 10'h052;
              5'h17: out_low = 10'h052;
              5'h18: out_low = 10'h052;
              5'h19: out_low = 10'h052;
              5'h1a: out_low = 10'h052;
              5'h1b: out_low = 10'h052;
              5'h1c: out_low = 10'h052;
              5'h1d: out_low = 10'h052;
              5'h1e: out_low = 10'h052;
              5'h1f: out_low = 10'h052;
              default: out_low = 10'h000;
            endcase
          end
          5'h19: begin
            case (mant[4:0])
              5'h00: out_low = 10'h052;
              5'h01: out_low = 10'h052;
              5'h02: out_low = 10'h052;
              5'h03: out_low = 10'h052;
              5'h04: out_low = 10'h052;
              5'h05: out_low = 10'h052;
              5'h06: out_low = 10'h052;
              5'h07: out_low = 10'h052;
              5'h08: out_low = 10'h053;
              5'h09: out_low = 10'h053;
              5'h0a: out_low = 10'h053;
              5'h0b: out_low = 10'h053;
              5'h0c: out_low = 10'h053;
              5'h0d: out_low = 10'h053;
              5'h0e: out_low = 10'h053;
              5'h0f: out_low = 10'h053;
              5'h10: out_low = 10'h053;
              5'h11: out_low = 10'h053;
              5'h12: out_low = 10'h053;
              5'h13: out_low = 10'h053;
              5'h14: out_low = 10'h053;
              5'h15: out_low = 10'h053;
              5'h16: out_low = 10'h053;
              5'h17: out_low = 10'h053;
              5'h18: out_low = 10'h053;
              5'h19: out_low = 10'h053;
              5'h1a: out_low = 10'h053;
              5'h1b: out_low = 10'h053;
              5'h1c: out_low = 10'h053;
              5'h1d: out_low = 10'h054;
              5'h1e: out_low = 10'h054;
              5'h1f: out_low = 10'h054;
              default: out_low = 10'h000;
            endcase
          end
          5'h1a: begin
            case (mant[4:0])
              5'h00: out_low = 10'h054;
              5'h01: out_low = 10'h054;
              5'h02: out_low = 10'h054;
              5'h03: out_low = 10'h054;
              5'h04: out_low = 10'h054;
              5'h05: out_low = 10'h054;
              5'h06: out_low = 10'h054;
              5'h07: out_low = 10'h054;
              5'h08: out_low = 10'h054;
              5'h09: out_low = 10'h054;
              5'h0a: out_low = 10'h054;
              5'h0b: out_low = 10'h054;
              5'h0c: out_low = 10'h054;
              5'h0d: out_low = 10'h054;
              5'h0e: out_low = 10'h054;
              5'h0f: out_low = 10'h054;
              5'h10: out_low = 10'h054;
              5'h11: out_low = 10'h054;
              5'h12: out_low = 10'h054;
              5'h13: out_low = 10'h055;
              5'h14: out_low = 10'h055;
              5'h15: out_low = 10'h055;
              5'h16: out_low = 10'h055;
              5'h17: out_low = 10'h055;
              5'h18: out_low = 10'h055;
              5'h19: out_low = 10'h055;
              5'h1a: out_low = 10'h055;
              5'h1b: out_low = 10'h055;
              5'h1c: out_low = 10'h055;
              5'h1d: out_low = 10'h055;
              5'h1e: out_low = 10'h055;
              5'h1f: out_low = 10'h055;
              default: out_low = 10'h000;
            endcase
          end
          5'h1b: begin
            case (mant[4:0])
              5'h00: out_low = 10'h055;
              5'h01: out_low = 10'h055;
              5'h02: out_low = 10'h055;
              5'h03: out_low = 10'h055;
              5'h04: out_low = 10'h055;
              5'h05: out_low = 10'h055;
              5'h06: out_low = 10'h055;
              5'h07: out_low = 10'h055;
              5'h08: out_low = 10'h056;
              5'h09: out_low = 10'h056;
              5'h0a: out_low = 10'h056;
              5'h0b: out_low = 10'h056;
              5'h0c: out_low = 10'h056;
              5'h0d: out_low = 10'h056;
              5'h0e: out_low = 10'h056;
              5'h0f: out_low = 10'h056;
              5'h10: out_low = 10'h056;
              5'h11: out_low = 10'h056;
              5'h12: out_low = 10'h056;
              5'h13: out_low = 10'h056;
              5'h14: out_low = 10'h056;
              5'h15: out_low = 10'h056;
              5'h16: out_low = 10'h056;
              5'h17: out_low = 10'h056;
              5'h18: out_low = 10'h056;
              5'h19: out_low = 10'h056;
              5'h1a: out_low = 10'h056;
              5'h1b: out_low = 10'h056;
              5'h1c: out_low = 10'h056;
              5'h1d: out_low = 10'h057;
              5'h1e: out_low = 10'h057;
              5'h1f: out_low = 10'h057;
              default: out_low = 10'h000;
            endcase
          end
          5'h1c: begin
            case (mant[4:0])
              5'h00: out_low = 10'h057;
              5'h01: out_low = 10'h057;
              5'h02: out_low = 10'h057;
              5'h03: out_low = 10'h057;
              5'h04: out_low = 10'h057;
              5'h05: out_low = 10'h057;
              5'h06: out_low = 10'h057;
              5'h07: out_low = 10'h057;
              5'h08: out_low = 10'h057;
              5'h09: out_low = 10'h057;
              5'h0a: out_low = 10'h057;
              5'h0b: out_low = 10'h057;
              5'h0c: out_low = 10'h057;
              5'h0d: out_low = 10'h057;
              5'h0e: out_low = 10'h057;
              5'h0f: out_low = 10'h057;
              5'h10: out_low = 10'h057;
              5'h11: out_low = 10'h057;
              5'h12: out_low = 10'h057;
              5'h13: out_low = 10'h058;
              5'h14: out_low = 10'h058;
              5'h15: out_low = 10'h058;
              5'h16: out_low = 10'h058;
              5'h17: out_low = 10'h058;
              5'h18: out_low = 10'h058;
              5'h19: out_low = 10'h058;
              5'h1a: out_low = 10'h058;
              5'h1b: out_low = 10'h058;
              5'h1c: out_low = 10'h058;
              5'h1d: out_low = 10'h058;
              5'h1e: out_low = 10'h058;
              5'h1f: out_low = 10'h058;
              default: out_low = 10'h000;
            endcase
          end
          5'h1d: begin
            case (mant[4:0])
              5'h00: out_low = 10'h058;
              5'h01: out_low = 10'h058;
              5'h02: out_low = 10'h058;
              5'h03: out_low = 10'h058;
              5'h04: out_low = 10'h058;
              5'h05: out_low = 10'h058;
              5'h06: out_low = 10'h058;
              5'h07: out_low = 10'h058;
              5'h08: out_low = 10'h059;
              5'h09: out_low = 10'h059;
              5'h0a: out_low = 10'h059;
              5'h0b: out_low = 10'h059;
              5'h0c: out_low = 10'h059;
              5'h0d: out_low = 10'h059;
              5'h0e: out_low = 10'h059;
              5'h0f: out_low = 10'h059;
              5'h10: out_low = 10'h059;
              5'h11: out_low = 10'h059;
              5'h12: out_low = 10'h059;
              5'h13: out_low = 10'h059;
              5'h14: out_low = 10'h059;
              5'h15: out_low = 10'h059;
              5'h16: out_low = 10'h059;
              5'h17: out_low = 10'h059;
              5'h18: out_low = 10'h059;
              5'h19: out_low = 10'h059;
              5'h1a: out_low = 10'h059;
              5'h1b: out_low = 10'h059;
              5'h1c: out_low = 10'h059;
              5'h1d: out_low = 10'h05a;
              5'h1e: out_low = 10'h05a;
              5'h1f: out_low = 10'h05a;
              default: out_low = 10'h000;
            endcase
          end
          5'h1e: begin
            case (mant[4:0])
              5'h00: out_low = 10'h05a;
              5'h01: out_low = 10'h05a;
              5'h02: out_low = 10'h05a;
              5'h03: out_low = 10'h05a;
              5'h04: out_low = 10'h05a;
              5'h05: out_low = 10'h05a;
              5'h06: out_low = 10'h05a;
              5'h07: out_low = 10'h05a;
              5'h08: out_low = 10'h05a;
              5'h09: out_low = 10'h05a;
              5'h0a: out_low = 10'h05a;
              5'h0b: out_low = 10'h05a;
              5'h0c: out_low = 10'h05a;
              5'h0d: out_low = 10'h05a;
              5'h0e: out_low = 10'h05a;
              5'h0f: out_low = 10'h05a;
              5'h10: out_low = 10'h05a;
              5'h11: out_low = 10'h05a;
              5'h12: out_low = 10'h05b;
              5'h13: out_low = 10'h05b;
              5'h14: out_low = 10'h05b;
              5'h15: out_low = 10'h05b;
              5'h16: out_low = 10'h05b;
              5'h17: out_low = 10'h05b;
              5'h18: out_low = 10'h05b;
              5'h19: out_low = 10'h05b;
              5'h1a: out_low = 10'h05b;
              5'h1b: out_low = 10'h05b;
              5'h1c: out_low = 10'h05b;
              5'h1d: out_low = 10'h05b;
              5'h1e: out_low = 10'h05b;
              5'h1f: out_low = 10'h05b;
              default: out_low = 10'h000;
            endcase
          end
          5'h1f: begin
            case (mant[4:0])
              5'h00: out_low = 10'h05b;
              5'h01: out_low = 10'h05b;
              5'h02: out_low = 10'h05b;
              5'h03: out_low = 10'h05b;
              5'h04: out_low = 10'h05b;
              5'h05: out_low = 10'h05b;
              5'h06: out_low = 10'h05b;
              5'h07: out_low = 10'h05b;
              5'h08: out_low = 10'h05c;
              5'h09: out_low = 10'h05c;
              5'h0a: out_low = 10'h05c;
              5'h0b: out_low = 10'h05c;
              5'h0c: out_low = 10'h05c;
              5'h0d: out_low = 10'h05c;
              5'h0e: out_low = 10'h05c;
              5'h0f: out_low = 10'h05c;
              5'h10: out_low = 10'h05c;
              5'h11: out_low = 10'h05c;
              5'h12: out_low = 10'h05c;
              5'h13: out_low = 10'h05c;
              5'h14: out_low = 10'h05c;
              5'h15: out_low = 10'h05c;
              5'h16: out_low = 10'h05c;
              5'h17: out_low = 10'h05c;
              5'h18: out_low = 10'h05c;
              5'h19: out_low = 10'h05c;
              5'h1a: out_low = 10'h05c;
              5'h1b: out_low = 10'h05c;
              5'h1c: out_low = 10'h05c;
              5'h1d: out_low = 10'h05d;
              5'h1e: out_low = 10'h05d;
              5'h1f: out_low = 10'h05d;
              default: out_low = 10'h000;
            endcase
          end
          default: out_low = 10'h000;
        endcase
      end
      6'h0c: begin
        case (mant[9:5])
          5'h00: begin
            case (mant[4:0])
              5'h00: out_low = 10'h05d;
              5'h01: out_low = 10'h05d;
              5'h02: out_low = 10'h05d;
              5'h03: out_low = 10'h05d;
              5'h04: out_low = 10'h05d;
              5'h05: out_low = 10'h05d;
              5'h06: out_low = 10'h05d;
              5'h07: out_low = 10'h05d;
              5'h08: out_low = 10'h05d;
              5'h09: out_low = 10'h05e;
              5'h0a: out_low = 10'h05e;
              5'h0b: out_low = 10'h05e;
              5'h0c: out_low = 10'h05e;
              5'h0d: out_low = 10'h05e;
              5'h0e: out_low = 10'h05e;
              5'h0f: out_low = 10'h05e;
              5'h10: out_low = 10'h05e;
              5'h11: out_low = 10'h05e;
              5'h12: out_low = 10'h05e;
              5'h13: out_low = 10'h05e;
              5'h14: out_low = 10'h05f;
              5'h15: out_low = 10'h05f;
              5'h16: out_low = 10'h05f;
              5'h17: out_low = 10'h05f;
              5'h18: out_low = 10'h05f;
              5'h19: out_low = 10'h05f;
              5'h1a: out_low = 10'h05f;
              5'h1b: out_low = 10'h05f;
              5'h1c: out_low = 10'h05f;
              5'h1d: out_low = 10'h05f;
              5'h1e: out_low = 10'h060;
              5'h1f: out_low = 10'h060;
              default: out_low = 10'h000;
            endcase
          end
          5'h01: begin
            case (mant[4:0])
              5'h00: out_low = 10'h060;
              5'h01: out_low = 10'h060;
              5'h02: out_low = 10'h060;
              5'h03: out_low = 10'h060;
              5'h04: out_low = 10'h060;
              5'h05: out_low = 10'h060;
              5'h06: out_low = 10'h060;
              5'h07: out_low = 10'h060;
              5'h08: out_low = 10'h060;
              5'h09: out_low = 10'h061;
              5'h0a: out_low = 10'h061;
              5'h0b: out_low = 10'h061;
              5'h0c: out_low = 10'h061;
              5'h0d: out_low = 10'h061;
              5'h0e: out_low = 10'h061;
              5'h0f: out_low = 10'h061;
              5'h10: out_low = 10'h061;
              5'h11: out_low = 10'h061;
              5'h12: out_low = 10'h061;
              5'h13: out_low = 10'h062;
              5'h14: out_low = 10'h062;
              5'h15: out_low = 10'h062;
              5'h16: out_low = 10'h062;
              5'h17: out_low = 10'h062;
              5'h18: out_low = 10'h062;
              5'h19: out_low = 10'h062;
              5'h1a: out_low = 10'h062;
              5'h1b: out_low = 10'h062;
              5'h1c: out_low = 10'h062;
              5'h1d: out_low = 10'h062;
              5'h1e: out_low = 10'h063;
              5'h1f: out_low = 10'h063;
              default: out_low = 10'h000;
            endcase
          end
          5'h02: begin
            case (mant[4:0])
              5'h00: out_low = 10'h063;
              5'h01: out_low = 10'h063;
              5'h02: out_low = 10'h063;
              5'h03: out_low = 10'h063;
              5'h04: out_low = 10'h063;
              5'h05: out_low = 10'h063;
              5'h06: out_low = 10'h063;
              5'h07: out_low = 10'h063;
              5'h08: out_low = 10'h064;
              5'h09: out_low = 10'h064;
              5'h0a: out_low = 10'h064;
              5'h0b: out_low = 10'h064;
              5'h0c: out_low = 10'h064;
              5'h0d: out_low = 10'h064;
              5'h0e: out_low = 10'h064;
              5'h0f: out_low = 10'h064;
              5'h10: out_low = 10'h064;
              5'h11: out_low = 10'h064;
              5'h12: out_low = 10'h064;
              5'h13: out_low = 10'h065;
              5'h14: out_low = 10'h065;
              5'h15: out_low = 10'h065;
              5'h16: out_low = 10'h065;
              5'h17: out_low = 10'h065;
              5'h18: out_low = 10'h065;
              5'h19: out_low = 10'h065;
              5'h1a: out_low = 10'h065;
              5'h1b: out_low = 10'h065;
              5'h1c: out_low = 10'h065;
              5'h1d: out_low = 10'h066;
              5'h1e: out_low = 10'h066;
              5'h1f: out_low = 10'h066;
              default: out_low = 10'h000;
            endcase
          end
          5'h03: begin
            case (mant[4:0])
              5'h00: out_low = 10'h066;
              5'h01: out_low = 10'h066;
              5'h02: out_low = 10'h066;
              5'h03: out_low = 10'h066;
              5'h04: out_low = 10'h066;
              5'h05: out_low = 10'h066;
              5'h06: out_low = 10'h066;
              5'h07: out_low = 10'h066;
              5'h08: out_low = 10'h067;
              5'h09: out_low = 10'h067;
              5'h0a: out_low = 10'h067;
              5'h0b: out_low = 10'h067;
              5'h0c: out_low = 10'h067;
              5'h0d: out_low = 10'h067;
              5'h0e: out_low = 10'h067;
              5'h0f: out_low = 10'h067;
              5'h10: out_low = 10'h067;
              5'h11: out_low = 10'h067;
              5'h12: out_low = 10'h068;
              5'h13: out_low = 10'h068;
              5'h14: out_low = 10'h068;
              5'h15: out_low = 10'h068;
              5'h16: out_low = 10'h068;
              5'h17: out_low = 10'h068;
              5'h18: out_low = 10'h068;
              5'h19: out_low = 10'h068;
              5'h1a: out_low = 10'h068;
              5'h1b: out_low = 10'h068;
              5'h1c: out_low = 10'h068;
              5'h1d: out_low = 10'h069;
              5'h1e: out_low = 10'h069;
              5'h1f: out_low = 10'h069;
              default: out_low = 10'h000;
            endcase
          end
          5'h04: begin
            case (mant[4:0])
              5'h00: out_low = 10'h069;
              5'h01: out_low = 10'h069;
              5'h02: out_low = 10'h069;
              5'h03: out_low = 10'h069;
              5'h04: out_low = 10'h069;
              5'h05: out_low = 10'h069;
              5'h06: out_low = 10'h069;
              5'h07: out_low = 10'h06a;
              5'h08: out_low = 10'h06a;
              5'h09: out_low = 10'h06a;
              5'h0a: out_low = 10'h06a;
              5'h0b: out_low = 10'h06a;
              5'h0c: out_low = 10'h06a;
              5'h0d: out_low = 10'h06a;
              5'h0e: out_low = 10'h06a;
              5'h0f: out_low = 10'h06a;
              5'h10: out_low = 10'h06a;
              5'h11: out_low = 10'h06a;
              5'h12: out_low = 10'h06b;
              5'h13: out_low = 10'h06b;
              5'h14: out_low = 10'h06b;
              5'h15: out_low = 10'h06b;
              5'h16: out_low = 10'h06b;
              5'h17: out_low = 10'h06b;
              5'h18: out_low = 10'h06b;
              5'h19: out_low = 10'h06b;
              5'h1a: out_low = 10'h06b;
              5'h1b: out_low = 10'h06b;
              5'h1c: out_low = 10'h06c;
              5'h1d: out_low = 10'h06c;
              5'h1e: out_low = 10'h06c;
              5'h1f: out_low = 10'h06c;
              default: out_low = 10'h000;
            endcase
          end
          5'h05: begin
            case (mant[4:0])
              5'h00: out_low = 10'h06c;
              5'h01: out_low = 10'h06c;
              5'h02: out_low = 10'h06c;
              5'h03: out_low = 10'h06c;
              5'h04: out_low = 10'h06c;
              5'h05: out_low = 10'h06c;
              5'h06: out_low = 10'h06c;
              5'h07: out_low = 10'h06d;
              5'h08: out_low = 10'h06d;
              5'h09: out_low = 10'h06d;
              5'h0a: out_low = 10'h06d;
              5'h0b: out_low = 10'h06d;
              5'h0c: out_low = 10'h06d;
              5'h0d: out_low = 10'h06d;
              5'h0e: out_low = 10'h06d;
              5'h0f: out_low = 10'h06d;
              5'h10: out_low = 10'h06d;
              5'h11: out_low = 10'h06e;
              5'h12: out_low = 10'h06e;
              5'h13: out_low = 10'h06e;
              5'h14: out_low = 10'h06e;
              5'h15: out_low = 10'h06e;
              5'h16: out_low = 10'h06e;
              5'h17: out_low = 10'h06e;
              5'h18: out_low = 10'h06e;
              5'h19: out_low = 10'h06e;
              5'h1a: out_low = 10'h06e;
              5'h1b: out_low = 10'h06e;
              5'h1c: out_low = 10'h06f;
              5'h1d: out_low = 10'h06f;
              5'h1e: out_low = 10'h06f;
              5'h1f: out_low = 10'h06f;
              default: out_low = 10'h000;
            endcase
          end
          5'h06: begin
            case (mant[4:0])
              5'h00: out_low = 10'h06f;
              5'h01: out_low = 10'h06f;
              5'h02: out_low = 10'h06f;
              5'h03: out_low = 10'h06f;
              5'h04: out_low = 10'h06f;
              5'h05: out_low = 10'h06f;
              5'h06: out_low = 10'h070;
              5'h07: out_low = 10'h070;
              5'h08: out_low = 10'h070;
              5'h09: out_low = 10'h070;
              5'h0a: out_low = 10'h070;
              5'h0b: out_low = 10'h070;
              5'h0c: out_low = 10'h070;
              5'h0d: out_low = 10'h070;
              5'h0e: out_low = 10'h070;
              5'h0f: out_low = 10'h070;
              5'h10: out_low = 10'h071;
              5'h11: out_low = 10'h071;
              5'h12: out_low = 10'h071;
              5'h13: out_low = 10'h071;
              5'h14: out_low = 10'h071;
              5'h15: out_low = 10'h071;
              5'h16: out_low = 10'h071;
              5'h17: out_low = 10'h071;
              5'h18: out_low = 10'h071;
              5'h19: out_low = 10'h071;
              5'h1a: out_low = 10'h071;
              5'h1b: out_low = 10'h072;
              5'h1c: out_low = 10'h072;
              5'h1d: out_low = 10'h072;
              5'h1e: out_low = 10'h072;
              5'h1f: out_low = 10'h072;
              default: out_low = 10'h000;
            endcase
          end
          5'h07: begin
            case (mant[4:0])
              5'h00: out_low = 10'h072;
              5'h01: out_low = 10'h072;
              5'h02: out_low = 10'h072;
              5'h03: out_low = 10'h072;
              5'h04: out_low = 10'h072;
              5'h05: out_low = 10'h073;
              5'h06: out_low = 10'h073;
              5'h07: out_low = 10'h073;
              5'h08: out_low = 10'h073;
              5'h09: out_low = 10'h073;
              5'h0a: out_low = 10'h073;
              5'h0b: out_low = 10'h073;
              5'h0c: out_low = 10'h073;
              5'h0d: out_low = 10'h073;
              5'h0e: out_low = 10'h073;
              5'h0f: out_low = 10'h073;
              5'h10: out_low = 10'h074;
              5'h11: out_low = 10'h074;
              5'h12: out_low = 10'h074;
              5'h13: out_low = 10'h074;
              5'h14: out_low = 10'h074;
              5'h15: out_low = 10'h074;
              5'h16: out_low = 10'h074;
              5'h17: out_low = 10'h074;
              5'h18: out_low = 10'h074;
              5'h19: out_low = 10'h074;
              5'h1a: out_low = 10'h075;
              5'h1b: out_low = 10'h075;
              5'h1c: out_low = 10'h075;
              5'h1d: out_low = 10'h075;
              5'h1e: out_low = 10'h075;
              5'h1f: out_low = 10'h075;
              default: out_low = 10'h000;
            endcase
          end
          5'h08: begin
            case (mant[4:0])
              5'h00: out_low = 10'h075;
              5'h01: out_low = 10'h075;
              5'h02: out_low = 10'h075;
              5'h03: out_low = 10'h075;
              5'h04: out_low = 10'h076;
              5'h05: out_low = 10'h076;
              5'h06: out_low = 10'h076;
              5'h07: out_low = 10'h076;
              5'h08: out_low = 10'h076;
              5'h09: out_low = 10'h076;
              5'h0a: out_low = 10'h076;
              5'h0b: out_low = 10'h076;
              5'h0c: out_low = 10'h076;
              5'h0d: out_low = 10'h076;
              5'h0e: out_low = 10'h076;
              5'h0f: out_low = 10'h077;
              5'h10: out_low = 10'h077;
              5'h11: out_low = 10'h077;
              5'h12: out_low = 10'h077;
              5'h13: out_low = 10'h077;
              5'h14: out_low = 10'h077;
              5'h15: out_low = 10'h077;
              5'h16: out_low = 10'h077;
              5'h17: out_low = 10'h077;
              5'h18: out_low = 10'h077;
              5'h19: out_low = 10'h078;
              5'h1a: out_low = 10'h078;
              5'h1b: out_low = 10'h078;
              5'h1c: out_low = 10'h078;
              5'h1d: out_low = 10'h078;
              5'h1e: out_low = 10'h078;
              5'h1f: out_low = 10'h078;
              default: out_low = 10'h000;
            endcase
          end
          5'h09: begin
            case (mant[4:0])
              5'h00: out_low = 10'h078;
              5'h01: out_low = 10'h078;
              5'h02: out_low = 10'h078;
              5'h03: out_low = 10'h079;
              5'h04: out_low = 10'h079;
              5'h05: out_low = 10'h079;
              5'h06: out_low = 10'h079;
              5'h07: out_low = 10'h079;
              5'h08: out_low = 10'h079;
              5'h09: out_low = 10'h079;
              5'h0a: out_low = 10'h079;
              5'h0b: out_low = 10'h079;
              5'h0c: out_low = 10'h079;
              5'h0d: out_low = 10'h079;
              5'h0e: out_low = 10'h07a;
              5'h0f: out_low = 10'h07a;
              5'h10: out_low = 10'h07a;
              5'h11: out_low = 10'h07a;
              5'h12: out_low = 10'h07a;
              5'h13: out_low = 10'h07a;
              5'h14: out_low = 10'h07a;
              5'h15: out_low = 10'h07a;
              5'h16: out_low = 10'h07a;
              5'h17: out_low = 10'h07a;
              5'h18: out_low = 10'h07b;
              5'h19: out_low = 10'h07b;
              5'h1a: out_low = 10'h07b;
              5'h1b: out_low = 10'h07b;
              5'h1c: out_low = 10'h07b;
              5'h1d: out_low = 10'h07b;
              5'h1e: out_low = 10'h07b;
              5'h1f: out_low = 10'h07b;
              default: out_low = 10'h000;
            endcase
          end
          5'h0a: begin
            case (mant[4:0])
              5'h00: out_low = 10'h07b;
              5'h01: out_low = 10'h07b;
              5'h02: out_low = 10'h07c;
              5'h03: out_low = 10'h07c;
              5'h04: out_low = 10'h07c;
              5'h05: out_low = 10'h07c;
              5'h06: out_low = 10'h07c;
              5'h07: out_low = 10'h07c;
              5'h08: out_low = 10'h07c;
              5'h09: out_low = 10'h07c;
              5'h0a: out_low = 10'h07c;
              5'h0b: out_low = 10'h07c;
              5'h0c: out_low = 10'h07c;
              5'h0d: out_low = 10'h07d;
              5'h0e: out_low = 10'h07d;
              5'h0f: out_low = 10'h07d;
              5'h10: out_low = 10'h07d;
              5'h11: out_low = 10'h07d;
              5'h12: out_low = 10'h07d;
              5'h13: out_low = 10'h07d;
              5'h14: out_low = 10'h07d;
              5'h15: out_low = 10'h07d;
              5'h16: out_low = 10'h07d;
              5'h17: out_low = 10'h07e;
              5'h18: out_low = 10'h07e;
              5'h19: out_low = 10'h07e;
              5'h1a: out_low = 10'h07e;
              5'h1b: out_low = 10'h07e;
              5'h1c: out_low = 10'h07e;
              5'h1d: out_low = 10'h07e;
              5'h1e: out_low = 10'h07e;
              5'h1f: out_low = 10'h07e;
              default: out_low = 10'h000;
            endcase
          end
          5'h0b: begin
            case (mant[4:0])
              5'h00: out_low = 10'h07e;
              5'h01: out_low = 10'h07f;
              5'h02: out_low = 10'h07f;
              5'h03: out_low = 10'h07f;
              5'h04: out_low = 10'h07f;
              5'h05: out_low = 10'h07f;
              5'h06: out_low = 10'h07f;
              5'h07: out_low = 10'h07f;
              5'h08: out_low = 10'h07f;
              5'h09: out_low = 10'h07f;
              5'h0a: out_low = 10'h07f;
              5'h0b: out_low = 10'h080;
              5'h0c: out_low = 10'h080;
              5'h0d: out_low = 10'h080;
              5'h0e: out_low = 10'h080;
              5'h0f: out_low = 10'h080;
              5'h10: out_low = 10'h080;
              5'h11: out_low = 10'h080;
              5'h12: out_low = 10'h080;
              5'h13: out_low = 10'h080;
              5'h14: out_low = 10'h080;
              5'h15: out_low = 10'h080;
              5'h16: out_low = 10'h081;
              5'h17: out_low = 10'h081;
              5'h18: out_low = 10'h081;
              5'h19: out_low = 10'h081;
              5'h1a: out_low = 10'h081;
              5'h1b: out_low = 10'h081;
              5'h1c: out_low = 10'h081;
              5'h1d: out_low = 10'h081;
              5'h1e: out_low = 10'h081;
              5'h1f: out_low = 10'h081;
              default: out_low = 10'h000;
            endcase
          end
          5'h0c: begin
            case (mant[4:0])
              5'h00: out_low = 10'h082;
              5'h01: out_low = 10'h082;
              5'h02: out_low = 10'h082;
              5'h03: out_low = 10'h082;
              5'h04: out_low = 10'h082;
              5'h05: out_low = 10'h082;
              5'h06: out_low = 10'h082;
              5'h07: out_low = 10'h082;
              5'h08: out_low = 10'h082;
              5'h09: out_low = 10'h082;
              5'h0a: out_low = 10'h083;
              5'h0b: out_low = 10'h083;
              5'h0c: out_low = 10'h083;
              5'h0d: out_low = 10'h083;
              5'h0e: out_low = 10'h083;
              5'h0f: out_low = 10'h083;
              5'h10: out_low = 10'h083;
              5'h11: out_low = 10'h083;
              5'h12: out_low = 10'h083;
              5'h13: out_low = 10'h083;
              5'h14: out_low = 10'h084;
              5'h15: out_low = 10'h084;
              5'h16: out_low = 10'h084;
              5'h17: out_low = 10'h084;
              5'h18: out_low = 10'h084;
              5'h19: out_low = 10'h084;
              5'h1a: out_low = 10'h084;
              5'h1b: out_low = 10'h084;
              5'h1c: out_low = 10'h084;
              5'h1d: out_low = 10'h084;
              5'h1e: out_low = 10'h084;
              5'h1f: out_low = 10'h085;
              default: out_low = 10'h000;
            endcase
          end
          5'h0d: begin
            case (mant[4:0])
              5'h00: out_low = 10'h085;
              5'h01: out_low = 10'h085;
              5'h02: out_low = 10'h085;
              5'h03: out_low = 10'h085;
              5'h04: out_low = 10'h085;
              5'h05: out_low = 10'h085;
              5'h06: out_low = 10'h085;
              5'h07: out_low = 10'h085;
              5'h08: out_low = 10'h085;
              5'h09: out_low = 10'h086;
              5'h0a: out_low = 10'h086;
              5'h0b: out_low = 10'h086;
              5'h0c: out_low = 10'h086;
              5'h0d: out_low = 10'h086;
              5'h0e: out_low = 10'h086;
              5'h0f: out_low = 10'h086;
              5'h10: out_low = 10'h086;
              5'h11: out_low = 10'h086;
              5'h12: out_low = 10'h086;
              5'h13: out_low = 10'h087;
              5'h14: out_low = 10'h087;
              5'h15: out_low = 10'h087;
              5'h16: out_low = 10'h087;
              5'h17: out_low = 10'h087;
              5'h18: out_low = 10'h087;
              5'h19: out_low = 10'h087;
              5'h1a: out_low = 10'h087;
              5'h1b: out_low = 10'h087;
              5'h1c: out_low = 10'h087;
              5'h1d: out_low = 10'h088;
              5'h1e: out_low = 10'h088;
              5'h1f: out_low = 10'h088;
              default: out_low = 10'h000;
            endcase
          end
          5'h0e: begin
            case (mant[4:0])
              5'h00: out_low = 10'h088;
              5'h01: out_low = 10'h088;
              5'h02: out_low = 10'h088;
              5'h03: out_low = 10'h088;
              5'h04: out_low = 10'h088;
              5'h05: out_low = 10'h088;
              5'h06: out_low = 10'h088;
              5'h07: out_low = 10'h089;
              5'h08: out_low = 10'h089;
              5'h09: out_low = 10'h089;
              5'h0a: out_low = 10'h089;
              5'h0b: out_low = 10'h089;
              5'h0c: out_low = 10'h089;
              5'h0d: out_low = 10'h089;
              5'h0e: out_low = 10'h089;
              5'h0f: out_low = 10'h089;
              5'h10: out_low = 10'h089;
              5'h11: out_low = 10'h089;
              5'h12: out_low = 10'h08a;
              5'h13: out_low = 10'h08a;
              5'h14: out_low = 10'h08a;
              5'h15: out_low = 10'h08a;
              5'h16: out_low = 10'h08a;
              5'h17: out_low = 10'h08a;
              5'h18: out_low = 10'h08a;
              5'h19: out_low = 10'h08a;
              5'h1a: out_low = 10'h08a;
              5'h1b: out_low = 10'h08a;
              5'h1c: out_low = 10'h08b;
              5'h1d: out_low = 10'h08b;
              5'h1e: out_low = 10'h08b;
              5'h1f: out_low = 10'h08b;
              default: out_low = 10'h000;
            endcase
          end
          5'h0f: begin
            case (mant[4:0])
              5'h00: out_low = 10'h08b;
              5'h01: out_low = 10'h08b;
              5'h02: out_low = 10'h08b;
              5'h03: out_low = 10'h08b;
              5'h04: out_low = 10'h08b;
              5'h05: out_low = 10'h08b;
              5'h06: out_low = 10'h08c;
              5'h07: out_low = 10'h08c;
              5'h08: out_low = 10'h08c;
              5'h09: out_low = 10'h08c;
              5'h0a: out_low = 10'h08c;
              5'h0b: out_low = 10'h08c;
              5'h0c: out_low = 10'h08c;
              5'h0d: out_low = 10'h08c;
              5'h0e: out_low = 10'h08c;
              5'h0f: out_low = 10'h08c;
              5'h10: out_low = 10'h08d;
              5'h11: out_low = 10'h08d;
              5'h12: out_low = 10'h08d;
              5'h13: out_low = 10'h08d;
              5'h14: out_low = 10'h08d;
              5'h15: out_low = 10'h08d;
              5'h16: out_low = 10'h08d;
              5'h17: out_low = 10'h08d;
              5'h18: out_low = 10'h08d;
              5'h19: out_low = 10'h08d;
              5'h1a: out_low = 10'h08e;
              5'h1b: out_low = 10'h08e;
              5'h1c: out_low = 10'h08e;
              5'h1d: out_low = 10'h08e;
              5'h1e: out_low = 10'h08e;
              5'h1f: out_low = 10'h08e;
              default: out_low = 10'h000;
            endcase
          end
          5'h10: begin
            case (mant[4:0])
              5'h00: out_low = 10'h08e;
              5'h01: out_low = 10'h08e;
              5'h02: out_low = 10'h08e;
              5'h03: out_low = 10'h08e;
              5'h04: out_low = 10'h08f;
              5'h05: out_low = 10'h08f;
              5'h06: out_low = 10'h08f;
              5'h07: out_low = 10'h08f;
              5'h08: out_low = 10'h08f;
              5'h09: out_low = 10'h08f;
              5'h0a: out_low = 10'h08f;
              5'h0b: out_low = 10'h08f;
              5'h0c: out_low = 10'h08f;
              5'h0d: out_low = 10'h08f;
              5'h0e: out_low = 10'h090;
              5'h0f: out_low = 10'h090;
              5'h10: out_low = 10'h090;
              5'h11: out_low = 10'h090;
              5'h12: out_low = 10'h090;
              5'h13: out_low = 10'h090;
              5'h14: out_low = 10'h090;
              5'h15: out_low = 10'h090;
              5'h16: out_low = 10'h090;
              5'h17: out_low = 10'h090;
              5'h18: out_low = 10'h090;
              5'h19: out_low = 10'h091;
              5'h1a: out_low = 10'h091;
              5'h1b: out_low = 10'h091;
              5'h1c: out_low = 10'h091;
              5'h1d: out_low = 10'h091;
              5'h1e: out_low = 10'h091;
              5'h1f: out_low = 10'h091;
              default: out_low = 10'h000;
            endcase
          end
          5'h11: begin
            case (mant[4:0])
              5'h00: out_low = 10'h091;
              5'h01: out_low = 10'h091;
              5'h02: out_low = 10'h091;
              5'h03: out_low = 10'h092;
              5'h04: out_low = 10'h092;
              5'h05: out_low = 10'h092;
              5'h06: out_low = 10'h092;
              5'h07: out_low = 10'h092;
              5'h08: out_low = 10'h092;
              5'h09: out_low = 10'h092;
              5'h0a: out_low = 10'h092;
              5'h0b: out_low = 10'h092;
              5'h0c: out_low = 10'h092;
              5'h0d: out_low = 10'h093;
              5'h0e: out_low = 10'h093;
              5'h0f: out_low = 10'h093;
              5'h10: out_low = 10'h093;
              5'h11: out_low = 10'h093;
              5'h12: out_low = 10'h093;
              5'h13: out_low = 10'h093;
              5'h14: out_low = 10'h093;
              5'h15: out_low = 10'h093;
              5'h16: out_low = 10'h093;
              5'h17: out_low = 10'h094;
              5'h18: out_low = 10'h094;
              5'h19: out_low = 10'h094;
              5'h1a: out_low = 10'h094;
              5'h1b: out_low = 10'h094;
              5'h1c: out_low = 10'h094;
              5'h1d: out_low = 10'h094;
              5'h1e: out_low = 10'h094;
              5'h1f: out_low = 10'h094;
              default: out_low = 10'h000;
            endcase
          end
          5'h12: begin
            case (mant[4:0])
              5'h00: out_low = 10'h094;
              5'h01: out_low = 10'h095;
              5'h02: out_low = 10'h095;
              5'h03: out_low = 10'h095;
              5'h04: out_low = 10'h095;
              5'h05: out_low = 10'h095;
              5'h06: out_low = 10'h095;
              5'h07: out_low = 10'h095;
              5'h08: out_low = 10'h095;
              5'h09: out_low = 10'h095;
              5'h0a: out_low = 10'h095;
              5'h0b: out_low = 10'h096;
              5'h0c: out_low = 10'h096;
              5'h0d: out_low = 10'h096;
              5'h0e: out_low = 10'h096;
              5'h0f: out_low = 10'h096;
              5'h10: out_low = 10'h096;
              5'h11: out_low = 10'h096;
              5'h12: out_low = 10'h096;
              5'h13: out_low = 10'h096;
              5'h14: out_low = 10'h096;
              5'h15: out_low = 10'h097;
              5'h16: out_low = 10'h097;
              5'h17: out_low = 10'h097;
              5'h18: out_low = 10'h097;
              5'h19: out_low = 10'h097;
              5'h1a: out_low = 10'h097;
              5'h1b: out_low = 10'h097;
              5'h1c: out_low = 10'h097;
              5'h1d: out_low = 10'h097;
              5'h1e: out_low = 10'h097;
              5'h1f: out_low = 10'h098;
              default: out_low = 10'h000;
            endcase
          end
          5'h13: begin
            case (mant[4:0])
              5'h00: out_low = 10'h098;
              5'h01: out_low = 10'h098;
              5'h02: out_low = 10'h098;
              5'h03: out_low = 10'h098;
              5'h04: out_low = 10'h098;
              5'h05: out_low = 10'h098;
              5'h06: out_low = 10'h098;
              5'h07: out_low = 10'h098;
              5'h08: out_low = 10'h098;
              5'h09: out_low = 10'h099;
              5'h0a: out_low = 10'h099;
              5'h0b: out_low = 10'h099;
              5'h0c: out_low = 10'h099;
              5'h0d: out_low = 10'h099;
              5'h0e: out_low = 10'h099;
              5'h0f: out_low = 10'h099;
              5'h10: out_low = 10'h099;
              5'h11: out_low = 10'h099;
              5'h12: out_low = 10'h099;
              5'h13: out_low = 10'h09a;
              5'h14: out_low = 10'h09a;
              5'h15: out_low = 10'h09a;
              5'h16: out_low = 10'h09a;
              5'h17: out_low = 10'h09a;
              5'h18: out_low = 10'h09a;
              5'h19: out_low = 10'h09a;
              5'h1a: out_low = 10'h09a;
              5'h1b: out_low = 10'h09a;
              5'h1c: out_low = 10'h09a;
              5'h1d: out_low = 10'h09b;
              5'h1e: out_low = 10'h09b;
              5'h1f: out_low = 10'h09b;
              default: out_low = 10'h000;
            endcase
          end
          5'h14: begin
            case (mant[4:0])
              5'h00: out_low = 10'h09b;
              5'h01: out_low = 10'h09b;
              5'h02: out_low = 10'h09b;
              5'h03: out_low = 10'h09b;
              5'h04: out_low = 10'h09b;
              5'h05: out_low = 10'h09b;
              5'h06: out_low = 10'h09b;
              5'h07: out_low = 10'h09c;
              5'h08: out_low = 10'h09c;
              5'h09: out_low = 10'h09c;
              5'h0a: out_low = 10'h09c;
              5'h0b: out_low = 10'h09c;
              5'h0c: out_low = 10'h09c;
              5'h0d: out_low = 10'h09c;
              5'h0e: out_low = 10'h09c;
              5'h0f: out_low = 10'h09c;
              5'h10: out_low = 10'h09c;
              5'h11: out_low = 10'h09d;
              5'h12: out_low = 10'h09d;
              5'h13: out_low = 10'h09d;
              5'h14: out_low = 10'h09d;
              5'h15: out_low = 10'h09d;
              5'h16: out_low = 10'h09d;
              5'h17: out_low = 10'h09d;
              5'h18: out_low = 10'h09d;
              5'h19: out_low = 10'h09d;
              5'h1a: out_low = 10'h09d;
              5'h1b: out_low = 10'h09e;
              5'h1c: out_low = 10'h09e;
              5'h1d: out_low = 10'h09e;
              5'h1e: out_low = 10'h09e;
              5'h1f: out_low = 10'h09e;
              default: out_low = 10'h000;
            endcase
          end
          5'h15: begin
            case (mant[4:0])
              5'h00: out_low = 10'h09e;
              5'h01: out_low = 10'h09e;
              5'h02: out_low = 10'h09e;
              5'h03: out_low = 10'h09e;
              5'h04: out_low = 10'h09e;
              5'h05: out_low = 10'h09f;
              5'h06: out_low = 10'h09f;
              5'h07: out_low = 10'h09f;
              5'h08: out_low = 10'h09f;
              5'h09: out_low = 10'h09f;
              5'h0a: out_low = 10'h09f;
              5'h0b: out_low = 10'h09f;
              5'h0c: out_low = 10'h09f;
              5'h0d: out_low = 10'h09f;
              5'h0e: out_low = 10'h09f;
              5'h0f: out_low = 10'h0a0;
              5'h10: out_low = 10'h0a0;
              5'h11: out_low = 10'h0a0;
              5'h12: out_low = 10'h0a0;
              5'h13: out_low = 10'h0a0;
              5'h14: out_low = 10'h0a0;
              5'h15: out_low = 10'h0a0;
              5'h16: out_low = 10'h0a0;
              5'h17: out_low = 10'h0a0;
              5'h18: out_low = 10'h0a0;
              5'h19: out_low = 10'h0a1;
              5'h1a: out_low = 10'h0a1;
              5'h1b: out_low = 10'h0a1;
              5'h1c: out_low = 10'h0a1;
              5'h1d: out_low = 10'h0a1;
              5'h1e: out_low = 10'h0a1;
              5'h1f: out_low = 10'h0a1;
              default: out_low = 10'h000;
            endcase
          end
          5'h16: begin
            case (mant[4:0])
              5'h00: out_low = 10'h0a1;
              5'h01: out_low = 10'h0a1;
              5'h02: out_low = 10'h0a1;
              5'h03: out_low = 10'h0a2;
              5'h04: out_low = 10'h0a2;
              5'h05: out_low = 10'h0a2;
              5'h06: out_low = 10'h0a2;
              5'h07: out_low = 10'h0a2;
              5'h08: out_low = 10'h0a2;
              5'h09: out_low = 10'h0a2;
              5'h0a: out_low = 10'h0a2;
              5'h0b: out_low = 10'h0a2;
              5'h0c: out_low = 10'h0a2;
              5'h0d: out_low = 10'h0a3;
              5'h0e: out_low = 10'h0a3;
              5'h0f: out_low = 10'h0a3;
              5'h10: out_low = 10'h0a3;
              5'h11: out_low = 10'h0a3;
              5'h12: out_low = 10'h0a3;
              5'h13: out_low = 10'h0a3;
              5'h14: out_low = 10'h0a3;
              5'h15: out_low = 10'h0a3;
              5'h16: out_low = 10'h0a3;
              5'h17: out_low = 10'h0a4;
              5'h18: out_low = 10'h0a4;
              5'h19: out_low = 10'h0a4;
              5'h1a: out_low = 10'h0a4;
              5'h1b: out_low = 10'h0a4;
              5'h1c: out_low = 10'h0a4;
              5'h1d: out_low = 10'h0a4;
              5'h1e: out_low = 10'h0a4;
              5'h1f: out_low = 10'h0a4;
              default: out_low = 10'h000;
            endcase
          end
          5'h17: begin
            case (mant[4:0])
              5'h00: out_low = 10'h0a4;
              5'h01: out_low = 10'h0a5;
              5'h02: out_low = 10'h0a5;
              5'h03: out_low = 10'h0a5;
              5'h04: out_low = 10'h0a5;
              5'h05: out_low = 10'h0a5;
              5'h06: out_low = 10'h0a5;
              5'h07: out_low = 10'h0a5;
              5'h08: out_low = 10'h0a5;
              5'h09: out_low = 10'h0a5;
              5'h0a: out_low = 10'h0a5;
              5'h0b: out_low = 10'h0a6;
              5'h0c: out_low = 10'h0a6;
              5'h0d: out_low = 10'h0a6;
              5'h0e: out_low = 10'h0a6;
              5'h0f: out_low = 10'h0a6;
              5'h10: out_low = 10'h0a6;
              5'h11: out_low = 10'h0a6;
              5'h12: out_low = 10'h0a6;
              5'h13: out_low = 10'h0a6;
              5'h14: out_low = 10'h0a6;
              5'h15: out_low = 10'h0a7;
              5'h16: out_low = 10'h0a7;
              5'h17: out_low = 10'h0a7;
              5'h18: out_low = 10'h0a7;
              5'h19: out_low = 10'h0a7;
              5'h1a: out_low = 10'h0a7;
              5'h1b: out_low = 10'h0a7;
              5'h1c: out_low = 10'h0a7;
              5'h1d: out_low = 10'h0a7;
              5'h1e: out_low = 10'h0a7;
              5'h1f: out_low = 10'h0a8;
              default: out_low = 10'h000;
            endcase
          end
          5'h18: begin
            case (mant[4:0])
              5'h00: out_low = 10'h0a8;
              5'h01: out_low = 10'h0a8;
              5'h02: out_low = 10'h0a8;
              5'h03: out_low = 10'h0a8;
              5'h04: out_low = 10'h0a8;
              5'h05: out_low = 10'h0a8;
              5'h06: out_low = 10'h0a8;
              5'h07: out_low = 10'h0a8;
              5'h08: out_low = 10'h0a8;
              5'h09: out_low = 10'h0a9;
              5'h0a: out_low = 10'h0a9;
              5'h0b: out_low = 10'h0a9;
              5'h0c: out_low = 10'h0a9;
              5'h0d: out_low = 10'h0a9;
              5'h0e: out_low = 10'h0a9;
              5'h0f: out_low = 10'h0a9;
              5'h10: out_low = 10'h0a9;
              5'h11: out_low = 10'h0a9;
              5'h12: out_low = 10'h0a9;
              5'h13: out_low = 10'h0aa;
              5'h14: out_low = 10'h0aa;
              5'h15: out_low = 10'h0aa;
              5'h16: out_low = 10'h0aa;
              5'h17: out_low = 10'h0aa;
              5'h18: out_low = 10'h0aa;
              5'h19: out_low = 10'h0aa;
              5'h1a: out_low = 10'h0aa;
              5'h1b: out_low = 10'h0aa;
              5'h1c: out_low = 10'h0aa;
              5'h1d: out_low = 10'h0ab;
              5'h1e: out_low = 10'h0ab;
              5'h1f: out_low = 10'h0ab;
              default: out_low = 10'h000;
            endcase
          end
          5'h19: begin
            case (mant[4:0])
              5'h00: out_low = 10'h0ab;
              5'h01: out_low = 10'h0ab;
              5'h02: out_low = 10'h0ab;
              5'h03: out_low = 10'h0ab;
              5'h04: out_low = 10'h0ab;
              5'h05: out_low = 10'h0ab;
              5'h06: out_low = 10'h0ab;
              5'h07: out_low = 10'h0ac;
              5'h08: out_low = 10'h0ac;
              5'h09: out_low = 10'h0ac;
              5'h0a: out_low = 10'h0ac;
              5'h0b: out_low = 10'h0ac;
              5'h0c: out_low = 10'h0ac;
              5'h0d: out_low = 10'h0ac;
              5'h0e: out_low = 10'h0ac;
              5'h0f: out_low = 10'h0ac;
              5'h10: out_low = 10'h0ad;
              5'h11: out_low = 10'h0ad;
              5'h12: out_low = 10'h0ad;
              5'h13: out_low = 10'h0ad;
              5'h14: out_low = 10'h0ad;
              5'h15: out_low = 10'h0ad;
              5'h16: out_low = 10'h0ad;
              5'h17: out_low = 10'h0ad;
              5'h18: out_low = 10'h0ad;
              5'h19: out_low = 10'h0ad;
              5'h1a: out_low = 10'h0ae;
              5'h1b: out_low = 10'h0ae;
              5'h1c: out_low = 10'h0ae;
              5'h1d: out_low = 10'h0ae;
              5'h1e: out_low = 10'h0ae;
              5'h1f: out_low = 10'h0ae;
              default: out_low = 10'h000;
            endcase
          end
          5'h1a: begin
            case (mant[4:0])
              5'h00: out_low = 10'h0ae;
              5'h01: out_low = 10'h0ae;
              5'h02: out_low = 10'h0ae;
              5'h03: out_low = 10'h0ae;
              5'h04: out_low = 10'h0af;
              5'h05: out_low = 10'h0af;
              5'h06: out_low = 10'h0af;
              5'h07: out_low = 10'h0af;
              5'h08: out_low = 10'h0af;
              5'h09: out_low = 10'h0af;
              5'h0a: out_low = 10'h0af;
              5'h0b: out_low = 10'h0af;
              5'h0c: out_low = 10'h0af;
              5'h0d: out_low = 10'h0af;
              5'h0e: out_low = 10'h0b0;
              5'h0f: out_low = 10'h0b0;
              5'h10: out_low = 10'h0b0;
              5'h11: out_low = 10'h0b0;
              5'h12: out_low = 10'h0b0;
              5'h13: out_low = 10'h0b0;
              5'h14: out_low = 10'h0b0;
              5'h15: out_low = 10'h0b0;
              5'h16: out_low = 10'h0b0;
              5'h17: out_low = 10'h0b0;
              5'h18: out_low = 10'h0b1;
              5'h19: out_low = 10'h0b1;
              5'h1a: out_low = 10'h0b1;
              5'h1b: out_low = 10'h0b1;
              5'h1c: out_low = 10'h0b1;
              5'h1d: out_low = 10'h0b1;
              5'h1e: out_low = 10'h0b1;
              5'h1f: out_low = 10'h0b1;
              default: out_low = 10'h000;
            endcase
          end
          5'h1b: begin
            case (mant[4:0])
              5'h00: out_low = 10'h0b1;
              5'h01: out_low = 10'h0b1;
              5'h02: out_low = 10'h0b2;
              5'h03: out_low = 10'h0b2;
              5'h04: out_low = 10'h0b2;
              5'h05: out_low = 10'h0b2;
              5'h06: out_low = 10'h0b2;
              5'h07: out_low = 10'h0b2;
              5'h08: out_low = 10'h0b2;
              5'h09: out_low = 10'h0b2;
              5'h0a: out_low = 10'h0b2;
              5'h0b: out_low = 10'h0b2;
              5'h0c: out_low = 10'h0b3;
              5'h0d: out_low = 10'h0b3;
              5'h0e: out_low = 10'h0b3;
              5'h0f: out_low = 10'h0b3;
              5'h10: out_low = 10'h0b3;
              5'h11: out_low = 10'h0b3;
              5'h12: out_low = 10'h0b3;
              5'h13: out_low = 10'h0b3;
              5'h14: out_low = 10'h0b3;
              5'h15: out_low = 10'h0b4;
              5'h16: out_low = 10'h0b4;
              5'h17: out_low = 10'h0b4;
              5'h18: out_low = 10'h0b4;
              5'h19: out_low = 10'h0b4;
              5'h1a: out_low = 10'h0b4;
              5'h1b: out_low = 10'h0b4;
              5'h1c: out_low = 10'h0b4;
              5'h1d: out_low = 10'h0b4;
              5'h1e: out_low = 10'h0b4;
              5'h1f: out_low = 10'h0b5;
              default: out_low = 10'h000;
            endcase
          end
          5'h1c: begin
            case (mant[4:0])
              5'h00: out_low = 10'h0b5;
              5'h01: out_low = 10'h0b5;
              5'h02: out_low = 10'h0b5;
              5'h03: out_low = 10'h0b5;
              5'h04: out_low = 10'h0b5;
              5'h05: out_low = 10'h0b5;
              5'h06: out_low = 10'h0b5;
              5'h07: out_low = 10'h0b5;
              5'h08: out_low = 10'h0b5;
              5'h09: out_low = 10'h0b6;
              5'h0a: out_low = 10'h0b6;
              5'h0b: out_low = 10'h0b6;
              5'h0c: out_low = 10'h0b6;
              5'h0d: out_low = 10'h0b6;
              5'h0e: out_low = 10'h0b6;
              5'h0f: out_low = 10'h0b6;
              5'h10: out_low = 10'h0b6;
              5'h11: out_low = 10'h0b6;
              5'h12: out_low = 10'h0b6;
              5'h13: out_low = 10'h0b7;
              5'h14: out_low = 10'h0b7;
              5'h15: out_low = 10'h0b7;
              5'h16: out_low = 10'h0b7;
              5'h17: out_low = 10'h0b7;
              5'h18: out_low = 10'h0b7;
              5'h19: out_low = 10'h0b7;
              5'h1a: out_low = 10'h0b7;
              5'h1b: out_low = 10'h0b7;
              5'h1c: out_low = 10'h0b7;
              5'h1d: out_low = 10'h0b8;
              5'h1e: out_low = 10'h0b8;
              5'h1f: out_low = 10'h0b8;
              default: out_low = 10'h000;
            endcase
          end
          5'h1d: begin
            case (mant[4:0])
              5'h00: out_low = 10'h0b8;
              5'h01: out_low = 10'h0b8;
              5'h02: out_low = 10'h0b8;
              5'h03: out_low = 10'h0b8;
              5'h04: out_low = 10'h0b8;
              5'h05: out_low = 10'h0b8;
              5'h06: out_low = 10'h0b9;
              5'h07: out_low = 10'h0b9;
              5'h08: out_low = 10'h0b9;
              5'h09: out_low = 10'h0b9;
              5'h0a: out_low = 10'h0b9;
              5'h0b: out_low = 10'h0b9;
              5'h0c: out_low = 10'h0b9;
              5'h0d: out_low = 10'h0b9;
              5'h0e: out_low = 10'h0b9;
              5'h0f: out_low = 10'h0b9;
              5'h10: out_low = 10'h0ba;
              5'h11: out_low = 10'h0ba;
              5'h12: out_low = 10'h0ba;
              5'h13: out_low = 10'h0ba;
              5'h14: out_low = 10'h0ba;
              5'h15: out_low = 10'h0ba;
              5'h16: out_low = 10'h0ba;
              5'h17: out_low = 10'h0ba;
              5'h18: out_low = 10'h0ba;
              5'h19: out_low = 10'h0ba;
              5'h1a: out_low = 10'h0bb;
              5'h1b: out_low = 10'h0bb;
              5'h1c: out_low = 10'h0bb;
              5'h1d: out_low = 10'h0bb;
              5'h1e: out_low = 10'h0bb;
              5'h1f: out_low = 10'h0bb;
              default: out_low = 10'h000;
            endcase
          end
          5'h1e: begin
            case (mant[4:0])
              5'h00: out_low = 10'h0bb;
              5'h01: out_low = 10'h0bb;
              5'h02: out_low = 10'h0bb;
              5'h03: out_low = 10'h0bb;
              5'h04: out_low = 10'h0bc;
              5'h05: out_low = 10'h0bc;
              5'h06: out_low = 10'h0bc;
              5'h07: out_low = 10'h0bc;
              5'h08: out_low = 10'h0bc;
              5'h09: out_low = 10'h0bc;
              5'h0a: out_low = 10'h0bc;
              5'h0b: out_low = 10'h0bc;
              5'h0c: out_low = 10'h0bc;
              5'h0d: out_low = 10'h0bd;
              5'h0e: out_low = 10'h0bd;
              5'h0f: out_low = 10'h0bd;
              5'h10: out_low = 10'h0bd;
              5'h11: out_low = 10'h0bd;
              5'h12: out_low = 10'h0bd;
              5'h13: out_low = 10'h0bd;
              5'h14: out_low = 10'h0bd;
              5'h15: out_low = 10'h0bd;
              5'h16: out_low = 10'h0bd;
              5'h17: out_low = 10'h0be;
              5'h18: out_low = 10'h0be;
              5'h19: out_low = 10'h0be;
              5'h1a: out_low = 10'h0be;
              5'h1b: out_low = 10'h0be;
              5'h1c: out_low = 10'h0be;
              5'h1d: out_low = 10'h0be;
              5'h1e: out_low = 10'h0be;
              5'h1f: out_low = 10'h0be;
              default: out_low = 10'h000;
            endcase
          end
          5'h1f: begin
            case (mant[4:0])
              5'h00: out_low = 10'h0be;
              5'h01: out_low = 10'h0bf;
              5'h02: out_low = 10'h0bf;
              5'h03: out_low = 10'h0bf;
              5'h04: out_low = 10'h0bf;
              5'h05: out_low = 10'h0bf;
              5'h06: out_low = 10'h0bf;
              5'h07: out_low = 10'h0bf;
              5'h08: out_low = 10'h0bf;
              5'h09: out_low = 10'h0bf;
              5'h0a: out_low = 10'h0bf;
              5'h0b: out_low = 10'h0c0;
              5'h0c: out_low = 10'h0c0;
              5'h0d: out_low = 10'h0c0;
              5'h0e: out_low = 10'h0c0;
              5'h0f: out_low = 10'h0c0;
              5'h10: out_low = 10'h0c0;
              5'h11: out_low = 10'h0c0;
              5'h12: out_low = 10'h0c0;
              5'h13: out_low = 10'h0c0;
              5'h14: out_low = 10'h0c1;
              5'h15: out_low = 10'h0c1;
              5'h16: out_low = 10'h0c1;
              5'h17: out_low = 10'h0c1;
              5'h18: out_low = 10'h0c1;
              5'h19: out_low = 10'h0c1;
              5'h1a: out_low = 10'h0c1;
              5'h1b: out_low = 10'h0c1;
              5'h1c: out_low = 10'h0c1;
              5'h1d: out_low = 10'h0c1;
              5'h1e: out_low = 10'h0c2;
              5'h1f: out_low = 10'h0c2;
              default: out_low = 10'h000;
            endcase
          end
          default: out_low = 10'h000;
        endcase
      end
      6'h0d: begin
        case (mant[9:5])
          5'h00: begin
            case (mant[4:0])
              5'h00: out_low = 10'h0c2;
              5'h01: out_low = 10'h0c2;
              5'h02: out_low = 10'h0c2;
              5'h03: out_low = 10'h0c2;
              5'h04: out_low = 10'h0c3;
              5'h05: out_low = 10'h0c3;
              5'h06: out_low = 10'h0c3;
              5'h07: out_low = 10'h0c3;
              5'h08: out_low = 10'h0c3;
              5'h09: out_low = 10'h0c4;
              5'h0a: out_low = 10'h0c4;
              5'h0b: out_low = 10'h0c4;
              5'h0c: out_low = 10'h0c4;
              5'h0d: out_low = 10'h0c4;
              5'h0e: out_low = 10'h0c5;
              5'h0f: out_low = 10'h0c5;
              5'h10: out_low = 10'h0c5;
              5'h11: out_low = 10'h0c5;
              5'h12: out_low = 10'h0c5;
              5'h13: out_low = 10'h0c6;
              5'h14: out_low = 10'h0c6;
              5'h15: out_low = 10'h0c6;
              5'h16: out_low = 10'h0c6;
              5'h17: out_low = 10'h0c6;
              5'h18: out_low = 10'h0c7;
              5'h19: out_low = 10'h0c7;
              5'h1a: out_low = 10'h0c7;
              5'h1b: out_low = 10'h0c7;
              5'h1c: out_low = 10'h0c8;
              5'h1d: out_low = 10'h0c8;
              5'h1e: out_low = 10'h0c8;
              5'h1f: out_low = 10'h0c8;
              default: out_low = 10'h000;
            endcase
          end
          5'h01: begin
            case (mant[4:0])
              5'h00: out_low = 10'h0c8;
              5'h01: out_low = 10'h0c9;
              5'h02: out_low = 10'h0c9;
              5'h03: out_low = 10'h0c9;
              5'h04: out_low = 10'h0c9;
              5'h05: out_low = 10'h0c9;
              5'h06: out_low = 10'h0ca;
              5'h07: out_low = 10'h0ca;
              5'h08: out_low = 10'h0ca;
              5'h09: out_low = 10'h0ca;
              5'h0a: out_low = 10'h0ca;
              5'h0b: out_low = 10'h0cb;
              5'h0c: out_low = 10'h0cb;
              5'h0d: out_low = 10'h0cb;
              5'h0e: out_low = 10'h0cb;
              5'h0f: out_low = 10'h0cb;
              5'h10: out_low = 10'h0cc;
              5'h11: out_low = 10'h0cc;
              5'h12: out_low = 10'h0cc;
              5'h13: out_low = 10'h0cc;
              5'h14: out_low = 10'h0cd;
              5'h15: out_low = 10'h0cd;
              5'h16: out_low = 10'h0cd;
              5'h17: out_low = 10'h0cd;
              5'h18: out_low = 10'h0cd;
              5'h19: out_low = 10'h0ce;
              5'h1a: out_low = 10'h0ce;
              5'h1b: out_low = 10'h0ce;
              5'h1c: out_low = 10'h0ce;
              5'h1d: out_low = 10'h0ce;
              5'h1e: out_low = 10'h0cf;
              5'h1f: out_low = 10'h0cf;
              default: out_low = 10'h000;
            endcase
          end
          5'h02: begin
            case (mant[4:0])
              5'h00: out_low = 10'h0cf;
              5'h01: out_low = 10'h0cf;
              5'h02: out_low = 10'h0cf;
              5'h03: out_low = 10'h0d0;
              5'h04: out_low = 10'h0d0;
              5'h05: out_low = 10'h0d0;
              5'h06: out_low = 10'h0d0;
              5'h07: out_low = 10'h0d0;
              5'h08: out_low = 10'h0d1;
              5'h09: out_low = 10'h0d1;
              5'h0a: out_low = 10'h0d1;
              5'h0b: out_low = 10'h0d1;
              5'h0c: out_low = 10'h0d2;
              5'h0d: out_low = 10'h0d2;
              5'h0e: out_low = 10'h0d2;
              5'h0f: out_low = 10'h0d2;
              5'h10: out_low = 10'h0d2;
              5'h11: out_low = 10'h0d3;
              5'h12: out_low = 10'h0d3;
              5'h13: out_low = 10'h0d3;
              5'h14: out_low = 10'h0d3;
              5'h15: out_low = 10'h0d3;
              5'h16: out_low = 10'h0d4;
              5'h17: out_low = 10'h0d4;
              5'h18: out_low = 10'h0d4;
              5'h19: out_low = 10'h0d4;
              5'h1a: out_low = 10'h0d4;
              5'h1b: out_low = 10'h0d5;
              5'h1c: out_low = 10'h0d5;
              5'h1d: out_low = 10'h0d5;
              5'h1e: out_low = 10'h0d5;
              5'h1f: out_low = 10'h0d5;
              default: out_low = 10'h000;
            endcase
          end
          5'h03: begin
            case (mant[4:0])
              5'h00: out_low = 10'h0d6;
              5'h01: out_low = 10'h0d6;
              5'h02: out_low = 10'h0d6;
              5'h03: out_low = 10'h0d6;
              5'h04: out_low = 10'h0d7;
              5'h05: out_low = 10'h0d7;
              5'h06: out_low = 10'h0d7;
              5'h07: out_low = 10'h0d7;
              5'h08: out_low = 10'h0d7;
              5'h09: out_low = 10'h0d8;
              5'h0a: out_low = 10'h0d8;
              5'h0b: out_low = 10'h0d8;
              5'h0c: out_low = 10'h0d8;
              5'h0d: out_low = 10'h0d8;
              5'h0e: out_low = 10'h0d9;
              5'h0f: out_low = 10'h0d9;
              5'h10: out_low = 10'h0d9;
              5'h11: out_low = 10'h0d9;
              5'h12: out_low = 10'h0d9;
              5'h13: out_low = 10'h0da;
              5'h14: out_low = 10'h0da;
              5'h15: out_low = 10'h0da;
              5'h16: out_low = 10'h0da;
              5'h17: out_low = 10'h0db;
              5'h18: out_low = 10'h0db;
              5'h19: out_low = 10'h0db;
              5'h1a: out_low = 10'h0db;
              5'h1b: out_low = 10'h0db;
              5'h1c: out_low = 10'h0dc;
              5'h1d: out_low = 10'h0dc;
              5'h1e: out_low = 10'h0dc;
              5'h1f: out_low = 10'h0dc;
              default: out_low = 10'h000;
            endcase
          end
          5'h04: begin
            case (mant[4:0])
              5'h00: out_low = 10'h0dc;
              5'h01: out_low = 10'h0dd;
              5'h02: out_low = 10'h0dd;
              5'h03: out_low = 10'h0dd;
              5'h04: out_low = 10'h0dd;
              5'h05: out_low = 10'h0dd;
              5'h06: out_low = 10'h0de;
              5'h07: out_low = 10'h0de;
              5'h08: out_low = 10'h0de;
              5'h09: out_low = 10'h0de;
              5'h0a: out_low = 10'h0df;
              5'h0b: out_low = 10'h0df;
              5'h0c: out_low = 10'h0df;
              5'h0d: out_low = 10'h0df;
              5'h0e: out_low = 10'h0df;
              5'h0f: out_low = 10'h0e0;
              5'h10: out_low = 10'h0e0;
              5'h11: out_low = 10'h0e0;
              5'h12: out_low = 10'h0e0;
              5'h13: out_low = 10'h0e0;
              5'h14: out_low = 10'h0e1;
              5'h15: out_low = 10'h0e1;
              5'h16: out_low = 10'h0e1;
              5'h17: out_low = 10'h0e1;
              5'h18: out_low = 10'h0e1;
              5'h19: out_low = 10'h0e2;
              5'h1a: out_low = 10'h0e2;
              5'h1b: out_low = 10'h0e2;
              5'h1c: out_low = 10'h0e2;
              5'h1d: out_low = 10'h0e3;
              5'h1e: out_low = 10'h0e3;
              5'h1f: out_low = 10'h0e3;
              default: out_low = 10'h000;
            endcase
          end
          5'h05: begin
            case (mant[4:0])
              5'h00: out_low = 10'h0e3;
              5'h01: out_low = 10'h0e3;
              5'h02: out_low = 10'h0e4;
              5'h03: out_low = 10'h0e4;
              5'h04: out_low = 10'h0e4;
              5'h05: out_low = 10'h0e4;
              5'h06: out_low = 10'h0e4;
              5'h07: out_low = 10'h0e5;
              5'h08: out_low = 10'h0e5;
              5'h09: out_low = 10'h0e5;
              5'h0a: out_low = 10'h0e5;
              5'h0b: out_low = 10'h0e6;
              5'h0c: out_low = 10'h0e6;
              5'h0d: out_low = 10'h0e6;
              5'h0e: out_low = 10'h0e6;
              5'h0f: out_low = 10'h0e6;
              5'h10: out_low = 10'h0e7;
              5'h11: out_low = 10'h0e7;
              5'h12: out_low = 10'h0e7;
              5'h13: out_low = 10'h0e7;
              5'h14: out_low = 10'h0e7;
              5'h15: out_low = 10'h0e8;
              5'h16: out_low = 10'h0e8;
              5'h17: out_low = 10'h0e8;
              5'h18: out_low = 10'h0e8;
              5'h19: out_low = 10'h0e8;
              5'h1a: out_low = 10'h0e9;
              5'h1b: out_low = 10'h0e9;
              5'h1c: out_low = 10'h0e9;
              5'h1d: out_low = 10'h0e9;
              5'h1e: out_low = 10'h0ea;
              5'h1f: out_low = 10'h0ea;
              default: out_low = 10'h000;
            endcase
          end
          5'h06: begin
            case (mant[4:0])
              5'h00: out_low = 10'h0ea;
              5'h01: out_low = 10'h0ea;
              5'h02: out_low = 10'h0ea;
              5'h03: out_low = 10'h0eb;
              5'h04: out_low = 10'h0eb;
              5'h05: out_low = 10'h0eb;
              5'h06: out_low = 10'h0eb;
              5'h07: out_low = 10'h0eb;
              5'h08: out_low = 10'h0ec;
              5'h09: out_low = 10'h0ec;
              5'h0a: out_low = 10'h0ec;
              5'h0b: out_low = 10'h0ec;
              5'h0c: out_low = 10'h0ed;
              5'h0d: out_low = 10'h0ed;
              5'h0e: out_low = 10'h0ed;
              5'h0f: out_low = 10'h0ed;
              5'h10: out_low = 10'h0ed;
              5'h11: out_low = 10'h0ee;
              5'h12: out_low = 10'h0ee;
              5'h13: out_low = 10'h0ee;
              5'h14: out_low = 10'h0ee;
              5'h15: out_low = 10'h0ee;
              5'h16: out_low = 10'h0ef;
              5'h17: out_low = 10'h0ef;
              5'h18: out_low = 10'h0ef;
              5'h19: out_low = 10'h0ef;
              5'h1a: out_low = 10'h0f0;
              5'h1b: out_low = 10'h0f0;
              5'h1c: out_low = 10'h0f0;
              5'h1d: out_low = 10'h0f0;
              5'h1e: out_low = 10'h0f0;
              5'h1f: out_low = 10'h0f1;
              default: out_low = 10'h000;
            endcase
          end
          5'h07: begin
            case (mant[4:0])
              5'h00: out_low = 10'h0f1;
              5'h01: out_low = 10'h0f1;
              5'h02: out_low = 10'h0f1;
              5'h03: out_low = 10'h0f1;
              5'h04: out_low = 10'h0f2;
              5'h05: out_low = 10'h0f2;
              5'h06: out_low = 10'h0f2;
              5'h07: out_low = 10'h0f2;
              5'h08: out_low = 10'h0f3;
              5'h09: out_low = 10'h0f3;
              5'h0a: out_low = 10'h0f3;
              5'h0b: out_low = 10'h0f3;
              5'h0c: out_low = 10'h0f3;
              5'h0d: out_low = 10'h0f4;
              5'h0e: out_low = 10'h0f4;
              5'h0f: out_low = 10'h0f4;
              5'h10: out_low = 10'h0f4;
              5'h11: out_low = 10'h0f4;
              5'h12: out_low = 10'h0f5;
              5'h13: out_low = 10'h0f5;
              5'h14: out_low = 10'h0f5;
              5'h15: out_low = 10'h0f5;
              5'h16: out_low = 10'h0f6;
              5'h17: out_low = 10'h0f6;
              5'h18: out_low = 10'h0f6;
              5'h19: out_low = 10'h0f6;
              5'h1a: out_low = 10'h0f6;
              5'h1b: out_low = 10'h0f7;
              5'h1c: out_low = 10'h0f7;
              5'h1d: out_low = 10'h0f7;
              5'h1e: out_low = 10'h0f7;
              5'h1f: out_low = 10'h0f7;
              default: out_low = 10'h000;
            endcase
          end
          5'h08: begin
            case (mant[4:0])
              5'h00: out_low = 10'h0f8;
              5'h01: out_low = 10'h0f8;
              5'h02: out_low = 10'h0f8;
              5'h03: out_low = 10'h0f8;
              5'h04: out_low = 10'h0f9;
              5'h05: out_low = 10'h0f9;
              5'h06: out_low = 10'h0f9;
              5'h07: out_low = 10'h0f9;
              5'h08: out_low = 10'h0f9;
              5'h09: out_low = 10'h0fa;
              5'h0a: out_low = 10'h0fa;
              5'h0b: out_low = 10'h0fa;
              5'h0c: out_low = 10'h0fa;
              5'h0d: out_low = 10'h0fa;
              5'h0e: out_low = 10'h0fb;
              5'h0f: out_low = 10'h0fb;
              5'h10: out_low = 10'h0fb;
              5'h11: out_low = 10'h0fb;
              5'h12: out_low = 10'h0fc;
              5'h13: out_low = 10'h0fc;
              5'h14: out_low = 10'h0fc;
              5'h15: out_low = 10'h0fc;
              5'h16: out_low = 10'h0fc;
              5'h17: out_low = 10'h0fd;
              5'h18: out_low = 10'h0fd;
              5'h19: out_low = 10'h0fd;
              5'h1a: out_low = 10'h0fd;
              5'h1b: out_low = 10'h0fd;
              5'h1c: out_low = 10'h0fe;
              5'h1d: out_low = 10'h0fe;
              5'h1e: out_low = 10'h0fe;
              5'h1f: out_low = 10'h0fe;
              default: out_low = 10'h000;
            endcase
          end
          5'h09: begin
            case (mant[4:0])
              5'h00: out_low = 10'h0ff;
              5'h01: out_low = 10'h0ff;
              5'h02: out_low = 10'h0ff;
              5'h03: out_low = 10'h0ff;
              5'h04: out_low = 10'h0ff;
              5'h05: out_low = 10'h100;
              5'h06: out_low = 10'h100;
              5'h07: out_low = 10'h100;
              5'h08: out_low = 10'h100;
              5'h09: out_low = 10'h101;
              5'h0a: out_low = 10'h101;
              5'h0b: out_low = 10'h101;
              5'h0c: out_low = 10'h101;
              5'h0d: out_low = 10'h101;
              5'h0e: out_low = 10'h102;
              5'h0f: out_low = 10'h102;
              5'h10: out_low = 10'h102;
              5'h11: out_low = 10'h102;
              5'h12: out_low = 10'h102;
              5'h13: out_low = 10'h103;
              5'h14: out_low = 10'h103;
              5'h15: out_low = 10'h103;
              5'h16: out_low = 10'h103;
              5'h17: out_low = 10'h104;
              5'h18: out_low = 10'h104;
              5'h19: out_low = 10'h104;
              5'h1a: out_low = 10'h104;
              5'h1b: out_low = 10'h104;
              5'h1c: out_low = 10'h105;
              5'h1d: out_low = 10'h105;
              5'h1e: out_low = 10'h105;
              5'h1f: out_low = 10'h105;
              default: out_low = 10'h000;
            endcase
          end
          5'h0a: begin
            case (mant[4:0])
              5'h00: out_low = 10'h106;
              5'h01: out_low = 10'h106;
              5'h02: out_low = 10'h106;
              5'h03: out_low = 10'h106;
              5'h04: out_low = 10'h106;
              5'h05: out_low = 10'h107;
              5'h06: out_low = 10'h107;
              5'h07: out_low = 10'h107;
              5'h08: out_low = 10'h107;
              5'h09: out_low = 10'h107;
              5'h0a: out_low = 10'h108;
              5'h0b: out_low = 10'h108;
              5'h0c: out_low = 10'h108;
              5'h0d: out_low = 10'h108;
              5'h0e: out_low = 10'h109;
              5'h0f: out_low = 10'h109;
              5'h10: out_low = 10'h109;
              5'h11: out_low = 10'h109;
              5'h12: out_low = 10'h109;
              5'h13: out_low = 10'h10a;
              5'h14: out_low = 10'h10a;
              5'h15: out_low = 10'h10a;
              5'h16: out_low = 10'h10a;
              5'h17: out_low = 10'h10b;
              5'h18: out_low = 10'h10b;
              5'h19: out_low = 10'h10b;
              5'h1a: out_low = 10'h10b;
              5'h1b: out_low = 10'h10b;
              5'h1c: out_low = 10'h10c;
              5'h1d: out_low = 10'h10c;
              5'h1e: out_low = 10'h10c;
              5'h1f: out_low = 10'h10c;
              default: out_low = 10'h000;
            endcase
          end
          5'h0b: begin
            case (mant[4:0])
              5'h00: out_low = 10'h10c;
              5'h01: out_low = 10'h10d;
              5'h02: out_low = 10'h10d;
              5'h03: out_low = 10'h10d;
              5'h04: out_low = 10'h10d;
              5'h05: out_low = 10'h10e;
              5'h06: out_low = 10'h10e;
              5'h07: out_low = 10'h10e;
              5'h08: out_low = 10'h10e;
              5'h09: out_low = 10'h10e;
              5'h0a: out_low = 10'h10f;
              5'h0b: out_low = 10'h10f;
              5'h0c: out_low = 10'h10f;
              5'h0d: out_low = 10'h10f;
              5'h0e: out_low = 10'h110;
              5'h0f: out_low = 10'h110;
              5'h10: out_low = 10'h110;
              5'h11: out_low = 10'h110;
              5'h12: out_low = 10'h110;
              5'h13: out_low = 10'h111;
              5'h14: out_low = 10'h111;
              5'h15: out_low = 10'h111;
              5'h16: out_low = 10'h111;
              5'h17: out_low = 10'h112;
              5'h18: out_low = 10'h112;
              5'h19: out_low = 10'h112;
              5'h1a: out_low = 10'h112;
              5'h1b: out_low = 10'h112;
              5'h1c: out_low = 10'h113;
              5'h1d: out_low = 10'h113;
              5'h1e: out_low = 10'h113;
              5'h1f: out_low = 10'h113;
              default: out_low = 10'h000;
            endcase
          end
          5'h0c: begin
            case (mant[4:0])
              5'h00: out_low = 10'h114;
              5'h01: out_low = 10'h114;
              5'h02: out_low = 10'h114;
              5'h03: out_low = 10'h114;
              5'h04: out_low = 10'h114;
              5'h05: out_low = 10'h115;
              5'h06: out_low = 10'h115;
              5'h07: out_low = 10'h115;
              5'h08: out_low = 10'h115;
              5'h09: out_low = 10'h115;
              5'h0a: out_low = 10'h116;
              5'h0b: out_low = 10'h116;
              5'h0c: out_low = 10'h116;
              5'h0d: out_low = 10'h116;
              5'h0e: out_low = 10'h117;
              5'h0f: out_low = 10'h117;
              5'h10: out_low = 10'h117;
              5'h11: out_low = 10'h117;
              5'h12: out_low = 10'h117;
              5'h13: out_low = 10'h118;
              5'h14: out_low = 10'h118;
              5'h15: out_low = 10'h118;
              5'h16: out_low = 10'h118;
              5'h17: out_low = 10'h119;
              5'h18: out_low = 10'h119;
              5'h19: out_low = 10'h119;
              5'h1a: out_low = 10'h119;
              5'h1b: out_low = 10'h119;
              5'h1c: out_low = 10'h11a;
              5'h1d: out_low = 10'h11a;
              5'h1e: out_low = 10'h11a;
              5'h1f: out_low = 10'h11a;
              default: out_low = 10'h000;
            endcase
          end
          5'h0d: begin
            case (mant[4:0])
              5'h00: out_low = 10'h11b;
              5'h01: out_low = 10'h11b;
              5'h02: out_low = 10'h11b;
              5'h03: out_low = 10'h11b;
              5'h04: out_low = 10'h11b;
              5'h05: out_low = 10'h11c;
              5'h06: out_low = 10'h11c;
              5'h07: out_low = 10'h11c;
              5'h08: out_low = 10'h11c;
              5'h09: out_low = 10'h11d;
              5'h0a: out_low = 10'h11d;
              5'h0b: out_low = 10'h11d;
              5'h0c: out_low = 10'h11d;
              5'h0d: out_low = 10'h11d;
              5'h0e: out_low = 10'h11e;
              5'h0f: out_low = 10'h11e;
              5'h10: out_low = 10'h11e;
              5'h11: out_low = 10'h11e;
              5'h12: out_low = 10'h11f;
              5'h13: out_low = 10'h11f;
              5'h14: out_low = 10'h11f;
              5'h15: out_low = 10'h11f;
              5'h16: out_low = 10'h11f;
              5'h17: out_low = 10'h120;
              5'h18: out_low = 10'h120;
              5'h19: out_low = 10'h120;
              5'h1a: out_low = 10'h120;
              5'h1b: out_low = 10'h121;
              5'h1c: out_low = 10'h121;
              5'h1d: out_low = 10'h121;
              5'h1e: out_low = 10'h121;
              5'h1f: out_low = 10'h121;
              default: out_low = 10'h000;
            endcase
          end
          5'h0e: begin
            case (mant[4:0])
              5'h00: out_low = 10'h122;
              5'h01: out_low = 10'h122;
              5'h02: out_low = 10'h122;
              5'h03: out_low = 10'h122;
              5'h04: out_low = 10'h123;
              5'h05: out_low = 10'h123;
              5'h06: out_low = 10'h123;
              5'h07: out_low = 10'h123;
              5'h08: out_low = 10'h123;
              5'h09: out_low = 10'h124;
              5'h0a: out_low = 10'h124;
              5'h0b: out_low = 10'h124;
              5'h0c: out_low = 10'h124;
              5'h0d: out_low = 10'h125;
              5'h0e: out_low = 10'h125;
              5'h0f: out_low = 10'h125;
              5'h10: out_low = 10'h125;
              5'h11: out_low = 10'h125;
              5'h12: out_low = 10'h126;
              5'h13: out_low = 10'h126;
              5'h14: out_low = 10'h126;
              5'h15: out_low = 10'h126;
              5'h16: out_low = 10'h127;
              5'h17: out_low = 10'h127;
              5'h18: out_low = 10'h127;
              5'h19: out_low = 10'h127;
              5'h1a: out_low = 10'h127;
              5'h1b: out_low = 10'h128;
              5'h1c: out_low = 10'h128;
              5'h1d: out_low = 10'h128;
              5'h1e: out_low = 10'h128;
              5'h1f: out_low = 10'h129;
              default: out_low = 10'h000;
            endcase
          end
          5'h0f: begin
            case (mant[4:0])
              5'h00: out_low = 10'h129;
              5'h01: out_low = 10'h129;
              5'h02: out_low = 10'h129;
              5'h03: out_low = 10'h129;
              5'h04: out_low = 10'h12a;
              5'h05: out_low = 10'h12a;
              5'h06: out_low = 10'h12a;
              5'h07: out_low = 10'h12a;
              5'h08: out_low = 10'h12b;
              5'h09: out_low = 10'h12b;
              5'h0a: out_low = 10'h12b;
              5'h0b: out_low = 10'h12b;
              5'h0c: out_low = 10'h12b;
              5'h0d: out_low = 10'h12c;
              5'h0e: out_low = 10'h12c;
              5'h0f: out_low = 10'h12c;
              5'h10: out_low = 10'h12c;
              5'h11: out_low = 10'h12d;
              5'h12: out_low = 10'h12d;
              5'h13: out_low = 10'h12d;
              5'h14: out_low = 10'h12d;
              5'h15: out_low = 10'h12d;
              5'h16: out_low = 10'h12e;
              5'h17: out_low = 10'h12e;
              5'h18: out_low = 10'h12e;
              5'h19: out_low = 10'h12e;
              5'h1a: out_low = 10'h12f;
              5'h1b: out_low = 10'h12f;
              5'h1c: out_low = 10'h12f;
              5'h1d: out_low = 10'h12f;
              5'h1e: out_low = 10'h130;
              5'h1f: out_low = 10'h130;
              default: out_low = 10'h000;
            endcase
          end
          5'h10: begin
            case (mant[4:0])
              5'h00: out_low = 10'h130;
              5'h01: out_low = 10'h130;
              5'h02: out_low = 10'h130;
              5'h03: out_low = 10'h131;
              5'h04: out_low = 10'h131;
              5'h05: out_low = 10'h131;
              5'h06: out_low = 10'h131;
              5'h07: out_low = 10'h132;
              5'h08: out_low = 10'h132;
              5'h09: out_low = 10'h132;
              5'h0a: out_low = 10'h132;
              5'h0b: out_low = 10'h132;
              5'h0c: out_low = 10'h133;
              5'h0d: out_low = 10'h133;
              5'h0e: out_low = 10'h133;
              5'h0f: out_low = 10'h133;
              5'h10: out_low = 10'h134;
              5'h11: out_low = 10'h134;
              5'h12: out_low = 10'h134;
              5'h13: out_low = 10'h134;
              5'h14: out_low = 10'h134;
              5'h15: out_low = 10'h135;
              5'h16: out_low = 10'h135;
              5'h17: out_low = 10'h135;
              5'h18: out_low = 10'h135;
              5'h19: out_low = 10'h136;
              5'h1a: out_low = 10'h136;
              5'h1b: out_low = 10'h136;
              5'h1c: out_low = 10'h136;
              5'h1d: out_low = 10'h136;
              5'h1e: out_low = 10'h137;
              5'h1f: out_low = 10'h137;
              default: out_low = 10'h000;
            endcase
          end
          5'h11: begin
            case (mant[4:0])
              5'h00: out_low = 10'h137;
              5'h01: out_low = 10'h137;
              5'h02: out_low = 10'h138;
              5'h03: out_low = 10'h138;
              5'h04: out_low = 10'h138;
              5'h05: out_low = 10'h138;
              5'h06: out_low = 10'h139;
              5'h07: out_low = 10'h139;
              5'h08: out_low = 10'h139;
              5'h09: out_low = 10'h139;
              5'h0a: out_low = 10'h139;
              5'h0b: out_low = 10'h13a;
              5'h0c: out_low = 10'h13a;
              5'h0d: out_low = 10'h13a;
              5'h0e: out_low = 10'h13a;
              5'h0f: out_low = 10'h13b;
              5'h10: out_low = 10'h13b;
              5'h11: out_low = 10'h13b;
              5'h12: out_low = 10'h13b;
              5'h13: out_low = 10'h13b;
              5'h14: out_low = 10'h13c;
              5'h15: out_low = 10'h13c;
              5'h16: out_low = 10'h13c;
              5'h17: out_low = 10'h13c;
              5'h18: out_low = 10'h13d;
              5'h19: out_low = 10'h13d;
              5'h1a: out_low = 10'h13d;
              5'h1b: out_low = 10'h13d;
              5'h1c: out_low = 10'h13e;
              5'h1d: out_low = 10'h13e;
              5'h1e: out_low = 10'h13e;
              5'h1f: out_low = 10'h13e;
              default: out_low = 10'h000;
            endcase
          end
          5'h12: begin
            case (mant[4:0])
              5'h00: out_low = 10'h13e;
              5'h01: out_low = 10'h13f;
              5'h02: out_low = 10'h13f;
              5'h03: out_low = 10'h13f;
              5'h04: out_low = 10'h13f;
              5'h05: out_low = 10'h140;
              5'h06: out_low = 10'h140;
              5'h07: out_low = 10'h140;
              5'h08: out_low = 10'h140;
              5'h09: out_low = 10'h140;
              5'h0a: out_low = 10'h141;
              5'h0b: out_low = 10'h141;
              5'h0c: out_low = 10'h141;
              5'h0d: out_low = 10'h141;
              5'h0e: out_low = 10'h142;
              5'h0f: out_low = 10'h142;
              5'h10: out_low = 10'h142;
              5'h11: out_low = 10'h142;
              5'h12: out_low = 10'h143;
              5'h13: out_low = 10'h143;
              5'h14: out_low = 10'h143;
              5'h15: out_low = 10'h143;
              5'h16: out_low = 10'h143;
              5'h17: out_low = 10'h144;
              5'h18: out_low = 10'h144;
              5'h19: out_low = 10'h144;
              5'h1a: out_low = 10'h144;
              5'h1b: out_low = 10'h145;
              5'h1c: out_low = 10'h145;
              5'h1d: out_low = 10'h145;
              5'h1e: out_low = 10'h145;
              5'h1f: out_low = 10'h145;
              default: out_low = 10'h000;
            endcase
          end
          5'h13: begin
            case (mant[4:0])
              5'h00: out_low = 10'h146;
              5'h01: out_low = 10'h146;
              5'h02: out_low = 10'h146;
              5'h03: out_low = 10'h146;
              5'h04: out_low = 10'h147;
              5'h05: out_low = 10'h147;
              5'h06: out_low = 10'h147;
              5'h07: out_low = 10'h147;
              5'h08: out_low = 10'h148;
              5'h09: out_low = 10'h148;
              5'h0a: out_low = 10'h148;
              5'h0b: out_low = 10'h148;
              5'h0c: out_low = 10'h148;
              5'h0d: out_low = 10'h149;
              5'h0e: out_low = 10'h149;
              5'h0f: out_low = 10'h149;
              5'h10: out_low = 10'h149;
              5'h11: out_low = 10'h14a;
              5'h12: out_low = 10'h14a;
              5'h13: out_low = 10'h14a;
              5'h14: out_low = 10'h14a;
              5'h15: out_low = 10'h14b;
              5'h16: out_low = 10'h14b;
              5'h17: out_low = 10'h14b;
              5'h18: out_low = 10'h14b;
              5'h19: out_low = 10'h14b;
              5'h1a: out_low = 10'h14c;
              5'h1b: out_low = 10'h14c;
              5'h1c: out_low = 10'h14c;
              5'h1d: out_low = 10'h14c;
              5'h1e: out_low = 10'h14d;
              5'h1f: out_low = 10'h14d;
              default: out_low = 10'h000;
            endcase
          end
          5'h14: begin
            case (mant[4:0])
              5'h00: out_low = 10'h14d;
              5'h01: out_low = 10'h14d;
              5'h02: out_low = 10'h14e;
              5'h03: out_low = 10'h14e;
              5'h04: out_low = 10'h14e;
              5'h05: out_low = 10'h14e;
              5'h06: out_low = 10'h14e;
              5'h07: out_low = 10'h14f;
              5'h08: out_low = 10'h14f;
              5'h09: out_low = 10'h14f;
              5'h0a: out_low = 10'h14f;
              5'h0b: out_low = 10'h150;
              5'h0c: out_low = 10'h150;
              5'h0d: out_low = 10'h150;
              5'h0e: out_low = 10'h150;
              5'h0f: out_low = 10'h150;
              5'h10: out_low = 10'h151;
              5'h11: out_low = 10'h151;
              5'h12: out_low = 10'h151;
              5'h13: out_low = 10'h151;
              5'h14: out_low = 10'h152;
              5'h15: out_low = 10'h152;
              5'h16: out_low = 10'h152;
              5'h17: out_low = 10'h152;
              5'h18: out_low = 10'h153;
              5'h19: out_low = 10'h153;
              5'h1a: out_low = 10'h153;
              5'h1b: out_low = 10'h153;
              5'h1c: out_low = 10'h153;
              5'h1d: out_low = 10'h154;
              5'h1e: out_low = 10'h154;
              5'h1f: out_low = 10'h154;
              default: out_low = 10'h000;
            endcase
          end
          5'h15: begin
            case (mant[4:0])
              5'h00: out_low = 10'h154;
              5'h01: out_low = 10'h155;
              5'h02: out_low = 10'h155;
              5'h03: out_low = 10'h155;
              5'h04: out_low = 10'h155;
              5'h05: out_low = 10'h156;
              5'h06: out_low = 10'h156;
              5'h07: out_low = 10'h156;
              5'h08: out_low = 10'h156;
              5'h09: out_low = 10'h156;
              5'h0a: out_low = 10'h157;
              5'h0b: out_low = 10'h157;
              5'h0c: out_low = 10'h157;
              5'h0d: out_low = 10'h157;
              5'h0e: out_low = 10'h158;
              5'h0f: out_low = 10'h158;
              5'h10: out_low = 10'h158;
              5'h11: out_low = 10'h158;
              5'h12: out_low = 10'h159;
              5'h13: out_low = 10'h159;
              5'h14: out_low = 10'h159;
              5'h15: out_low = 10'h159;
              5'h16: out_low = 10'h15a;
              5'h17: out_low = 10'h15a;
              5'h18: out_low = 10'h15a;
              5'h19: out_low = 10'h15a;
              5'h1a: out_low = 10'h15a;
              5'h1b: out_low = 10'h15b;
              5'h1c: out_low = 10'h15b;
              5'h1d: out_low = 10'h15b;
              5'h1e: out_low = 10'h15b;
              5'h1f: out_low = 10'h15c;
              default: out_low = 10'h000;
            endcase
          end
          5'h16: begin
            case (mant[4:0])
              5'h00: out_low = 10'h15c;
              5'h01: out_low = 10'h15c;
              5'h02: out_low = 10'h15c;
              5'h03: out_low = 10'h15d;
              5'h04: out_low = 10'h15d;
              5'h05: out_low = 10'h15d;
              5'h06: out_low = 10'h15d;
              5'h07: out_low = 10'h15d;
              5'h08: out_low = 10'h15e;
              5'h09: out_low = 10'h15e;
              5'h0a: out_low = 10'h15e;
              5'h0b: out_low = 10'h15e;
              5'h0c: out_low = 10'h15f;
              5'h0d: out_low = 10'h15f;
              5'h0e: out_low = 10'h15f;
              5'h0f: out_low = 10'h15f;
              5'h10: out_low = 10'h160;
              5'h11: out_low = 10'h160;
              5'h12: out_low = 10'h160;
              5'h13: out_low = 10'h160;
              5'h14: out_low = 10'h160;
              5'h15: out_low = 10'h161;
              5'h16: out_low = 10'h161;
              5'h17: out_low = 10'h161;
              5'h18: out_low = 10'h161;
              5'h19: out_low = 10'h162;
              5'h1a: out_low = 10'h162;
              5'h1b: out_low = 10'h162;
              5'h1c: out_low = 10'h162;
              5'h1d: out_low = 10'h163;
              5'h1e: out_low = 10'h163;
              5'h1f: out_low = 10'h163;
              default: out_low = 10'h000;
            endcase
          end
          5'h17: begin
            case (mant[4:0])
              5'h00: out_low = 10'h163;
              5'h01: out_low = 10'h164;
              5'h02: out_low = 10'h164;
              5'h03: out_low = 10'h164;
              5'h04: out_low = 10'h164;
              5'h05: out_low = 10'h164;
              5'h06: out_low = 10'h165;
              5'h07: out_low = 10'h165;
              5'h08: out_low = 10'h165;
              5'h09: out_low = 10'h165;
              5'h0a: out_low = 10'h166;
              5'h0b: out_low = 10'h166;
              5'h0c: out_low = 10'h166;
              5'h0d: out_low = 10'h166;
              5'h0e: out_low = 10'h167;
              5'h0f: out_low = 10'h167;
              5'h10: out_low = 10'h167;
              5'h11: out_low = 10'h167;
              5'h12: out_low = 10'h167;
              5'h13: out_low = 10'h168;
              5'h14: out_low = 10'h168;
              5'h15: out_low = 10'h168;
              5'h16: out_low = 10'h168;
              5'h17: out_low = 10'h169;
              5'h18: out_low = 10'h169;
              5'h19: out_low = 10'h169;
              5'h1a: out_low = 10'h169;
              5'h1b: out_low = 10'h16a;
              5'h1c: out_low = 10'h16a;
              5'h1d: out_low = 10'h16a;
              5'h1e: out_low = 10'h16a;
              5'h1f: out_low = 10'h16b;
              default: out_low = 10'h000;
            endcase
          end
          5'h18: begin
            case (mant[4:0])
              5'h00: out_low = 10'h16b;
              5'h01: out_low = 10'h16b;
              5'h02: out_low = 10'h16b;
              5'h03: out_low = 10'h16b;
              5'h04: out_low = 10'h16c;
              5'h05: out_low = 10'h16c;
              5'h06: out_low = 10'h16c;
              5'h07: out_low = 10'h16c;
              5'h08: out_low = 10'h16d;
              5'h09: out_low = 10'h16d;
              5'h0a: out_low = 10'h16d;
              5'h0b: out_low = 10'h16d;
              5'h0c: out_low = 10'h16e;
              5'h0d: out_low = 10'h16e;
              5'h0e: out_low = 10'h16e;
              5'h0f: out_low = 10'h16e;
              5'h10: out_low = 10'h16f;
              5'h11: out_low = 10'h16f;
              5'h12: out_low = 10'h16f;
              5'h13: out_low = 10'h16f;
              5'h14: out_low = 10'h16f;
              5'h15: out_low = 10'h170;
              5'h16: out_low = 10'h170;
              5'h17: out_low = 10'h170;
              5'h18: out_low = 10'h170;
              5'h19: out_low = 10'h171;
              5'h1a: out_low = 10'h171;
              5'h1b: out_low = 10'h171;
              5'h1c: out_low = 10'h171;
              5'h1d: out_low = 10'h172;
              5'h1e: out_low = 10'h172;
              5'h1f: out_low = 10'h172;
              default: out_low = 10'h000;
            endcase
          end
          5'h19: begin
            case (mant[4:0])
              5'h00: out_low = 10'h172;
              5'h01: out_low = 10'h173;
              5'h02: out_low = 10'h173;
              5'h03: out_low = 10'h173;
              5'h04: out_low = 10'h173;
              5'h05: out_low = 10'h173;
              5'h06: out_low = 10'h174;
              5'h07: out_low = 10'h174;
              5'h08: out_low = 10'h174;
              5'h09: out_low = 10'h174;
              5'h0a: out_low = 10'h175;
              5'h0b: out_low = 10'h175;
              5'h0c: out_low = 10'h175;
              5'h0d: out_low = 10'h175;
              5'h0e: out_low = 10'h176;
              5'h0f: out_low = 10'h176;
              5'h10: out_low = 10'h176;
              5'h11: out_low = 10'h176;
              5'h12: out_low = 10'h177;
              5'h13: out_low = 10'h177;
              5'h14: out_low = 10'h177;
              5'h15: out_low = 10'h177;
              5'h16: out_low = 10'h177;
              5'h17: out_low = 10'h178;
              5'h18: out_low = 10'h178;
              5'h19: out_low = 10'h178;
              5'h1a: out_low = 10'h178;
              5'h1b: out_low = 10'h179;
              5'h1c: out_low = 10'h179;
              5'h1d: out_low = 10'h179;
              5'h1e: out_low = 10'h179;
              5'h1f: out_low = 10'h17a;
              default: out_low = 10'h000;
            endcase
          end
          5'h1a: begin
            case (mant[4:0])
              5'h00: out_low = 10'h17a;
              5'h01: out_low = 10'h17a;
              5'h02: out_low = 10'h17a;
              5'h03: out_low = 10'h17b;
              5'h04: out_low = 10'h17b;
              5'h05: out_low = 10'h17b;
              5'h06: out_low = 10'h17b;
              5'h07: out_low = 10'h17c;
              5'h08: out_low = 10'h17c;
              5'h09: out_low = 10'h17c;
              5'h0a: out_low = 10'h17c;
              5'h0b: out_low = 10'h17c;
              5'h0c: out_low = 10'h17d;
              5'h0d: out_low = 10'h17d;
              5'h0e: out_low = 10'h17d;
              5'h0f: out_low = 10'h17d;
              5'h10: out_low = 10'h17e;
              5'h11: out_low = 10'h17e;
              5'h12: out_low = 10'h17e;
              5'h13: out_low = 10'h17e;
              5'h14: out_low = 10'h17f;
              5'h15: out_low = 10'h17f;
              5'h16: out_low = 10'h17f;
              5'h17: out_low = 10'h17f;
              5'h18: out_low = 10'h180;
              5'h19: out_low = 10'h180;
              5'h1a: out_low = 10'h180;
              5'h1b: out_low = 10'h180;
              5'h1c: out_low = 10'h181;
              5'h1d: out_low = 10'h181;
              5'h1e: out_low = 10'h181;
              5'h1f: out_low = 10'h181;
              default: out_low = 10'h000;
            endcase
          end
          5'h1b: begin
            case (mant[4:0])
              5'h00: out_low = 10'h181;
              5'h01: out_low = 10'h182;
              5'h02: out_low = 10'h182;
              5'h03: out_low = 10'h182;
              5'h04: out_low = 10'h182;
              5'h05: out_low = 10'h183;
              5'h06: out_low = 10'h183;
              5'h07: out_low = 10'h183;
              5'h08: out_low = 10'h183;
              5'h09: out_low = 10'h184;
              5'h0a: out_low = 10'h184;
              5'h0b: out_low = 10'h184;
              5'h0c: out_low = 10'h184;
              5'h0d: out_low = 10'h185;
              5'h0e: out_low = 10'h185;
              5'h0f: out_low = 10'h185;
              5'h10: out_low = 10'h185;
              5'h11: out_low = 10'h186;
              5'h12: out_low = 10'h186;
              5'h13: out_low = 10'h186;
              5'h14: out_low = 10'h186;
              5'h15: out_low = 10'h186;
              5'h16: out_low = 10'h187;
              5'h17: out_low = 10'h187;
              5'h18: out_low = 10'h187;
              5'h19: out_low = 10'h187;
              5'h1a: out_low = 10'h188;
              5'h1b: out_low = 10'h188;
              5'h1c: out_low = 10'h188;
              5'h1d: out_low = 10'h188;
              5'h1e: out_low = 10'h189;
              5'h1f: out_low = 10'h189;
              default: out_low = 10'h000;
            endcase
          end
          5'h1c: begin
            case (mant[4:0])
              5'h00: out_low = 10'h189;
              5'h01: out_low = 10'h189;
              5'h02: out_low = 10'h18a;
              5'h03: out_low = 10'h18a;
              5'h04: out_low = 10'h18a;
              5'h05: out_low = 10'h18a;
              5'h06: out_low = 10'h18b;
              5'h07: out_low = 10'h18b;
              5'h08: out_low = 10'h18b;
              5'h09: out_low = 10'h18b;
              5'h0a: out_low = 10'h18c;
              5'h0b: out_low = 10'h18c;
              5'h0c: out_low = 10'h18c;
              5'h0d: out_low = 10'h18c;
              5'h0e: out_low = 10'h18c;
              5'h0f: out_low = 10'h18d;
              5'h10: out_low = 10'h18d;
              5'h11: out_low = 10'h18d;
              5'h12: out_low = 10'h18d;
              5'h13: out_low = 10'h18e;
              5'h14: out_low = 10'h18e;
              5'h15: out_low = 10'h18e;
              5'h16: out_low = 10'h18e;
              5'h17: out_low = 10'h18f;
              5'h18: out_low = 10'h18f;
              5'h19: out_low = 10'h18f;
              5'h1a: out_low = 10'h18f;
              5'h1b: out_low = 10'h190;
              5'h1c: out_low = 10'h190;
              5'h1d: out_low = 10'h190;
              5'h1e: out_low = 10'h190;
              5'h1f: out_low = 10'h191;
              default: out_low = 10'h000;
            endcase
          end
          5'h1d: begin
            case (mant[4:0])
              5'h00: out_low = 10'h191;
              5'h01: out_low = 10'h191;
              5'h02: out_low = 10'h191;
              5'h03: out_low = 10'h192;
              5'h04: out_low = 10'h192;
              5'h05: out_low = 10'h192;
              5'h06: out_low = 10'h192;
              5'h07: out_low = 10'h193;
              5'h08: out_low = 10'h193;
              5'h09: out_low = 10'h193;
              5'h0a: out_low = 10'h193;
              5'h0b: out_low = 10'h193;
              5'h0c: out_low = 10'h194;
              5'h0d: out_low = 10'h194;
              5'h0e: out_low = 10'h194;
              5'h0f: out_low = 10'h194;
              5'h10: out_low = 10'h195;
              5'h11: out_low = 10'h195;
              5'h12: out_low = 10'h195;
              5'h13: out_low = 10'h195;
              5'h14: out_low = 10'h196;
              5'h15: out_low = 10'h196;
              5'h16: out_low = 10'h196;
              5'h17: out_low = 10'h196;
              5'h18: out_low = 10'h197;
              5'h19: out_low = 10'h197;
              5'h1a: out_low = 10'h197;
              5'h1b: out_low = 10'h197;
              5'h1c: out_low = 10'h198;
              5'h1d: out_low = 10'h198;
              5'h1e: out_low = 10'h198;
              5'h1f: out_low = 10'h198;
              default: out_low = 10'h000;
            endcase
          end
          5'h1e: begin
            case (mant[4:0])
              5'h00: out_low = 10'h199;
              5'h01: out_low = 10'h199;
              5'h02: out_low = 10'h199;
              5'h03: out_low = 10'h199;
              5'h04: out_low = 10'h19a;
              5'h05: out_low = 10'h19a;
              5'h06: out_low = 10'h19a;
              5'h07: out_low = 10'h19a;
              5'h08: out_low = 10'h19a;
              5'h09: out_low = 10'h19b;
              5'h0a: out_low = 10'h19b;
              5'h0b: out_low = 10'h19b;
              5'h0c: out_low = 10'h19b;
              5'h0d: out_low = 10'h19c;
              5'h0e: out_low = 10'h19c;
              5'h0f: out_low = 10'h19c;
              5'h10: out_low = 10'h19c;
              5'h11: out_low = 10'h19d;
              5'h12: out_low = 10'h19d;
              5'h13: out_low = 10'h19d;
              5'h14: out_low = 10'h19d;
              5'h15: out_low = 10'h19e;
              5'h16: out_low = 10'h19e;
              5'h17: out_low = 10'h19e;
              5'h18: out_low = 10'h19e;
              5'h19: out_low = 10'h19f;
              5'h1a: out_low = 10'h19f;
              5'h1b: out_low = 10'h19f;
              5'h1c: out_low = 10'h19f;
              5'h1d: out_low = 10'h1a0;
              5'h1e: out_low = 10'h1a0;
              5'h1f: out_low = 10'h1a0;
              default: out_low = 10'h000;
            endcase
          end
          5'h1f: begin
            case (mant[4:0])
              5'h00: out_low = 10'h1a0;
              5'h01: out_low = 10'h1a1;
              5'h02: out_low = 10'h1a1;
              5'h03: out_low = 10'h1a1;
              5'h04: out_low = 10'h1a1;
              5'h05: out_low = 10'h1a2;
              5'h06: out_low = 10'h1a2;
              5'h07: out_low = 10'h1a2;
              5'h08: out_low = 10'h1a2;
              5'h09: out_low = 10'h1a3;
              5'h0a: out_low = 10'h1a3;
              5'h0b: out_low = 10'h1a3;
              5'h0c: out_low = 10'h1a3;
              5'h0d: out_low = 10'h1a4;
              5'h0e: out_low = 10'h1a4;
              5'h0f: out_low = 10'h1a4;
              5'h10: out_low = 10'h1a4;
              5'h11: out_low = 10'h1a4;
              5'h12: out_low = 10'h1a5;
              5'h13: out_low = 10'h1a5;
              5'h14: out_low = 10'h1a5;
              5'h15: out_low = 10'h1a5;
              5'h16: out_low = 10'h1a6;
              5'h17: out_low = 10'h1a6;
              5'h18: out_low = 10'h1a6;
              5'h19: out_low = 10'h1a6;
              5'h1a: out_low = 10'h1a7;
              5'h1b: out_low = 10'h1a7;
              5'h1c: out_low = 10'h1a7;
              5'h1d: out_low = 10'h1a7;
              5'h1e: out_low = 10'h1a8;
              5'h1f: out_low = 10'h1a8;
              default: out_low = 10'h000;
            endcase
          end
          default: out_low = 10'h000;
        endcase
      end
      6'h0e: begin
        case (mant[9:5])
          5'h00: begin
            case (mant[4:0])
              5'h00: out_low = 10'h1a8;
              5'h01: out_low = 10'h1a9;
              5'h02: out_low = 10'h1a9;
              5'h03: out_low = 10'h1aa;
              5'h04: out_low = 10'h1aa;
              5'h05: out_low = 10'h1ab;
              5'h06: out_low = 10'h1ab;
              5'h07: out_low = 10'h1ac;
              5'h08: out_low = 10'h1ac;
              5'h09: out_low = 10'h1ad;
              5'h0a: out_low = 10'h1ad;
              5'h0b: out_low = 10'h1ae;
              5'h0c: out_low = 10'h1ae;
              5'h0d: out_low = 10'h1af;
              5'h0e: out_low = 10'h1af;
              5'h0f: out_low = 10'h1b0;
              5'h10: out_low = 10'h1b0;
              5'h11: out_low = 10'h1b1;
              5'h12: out_low = 10'h1b1;
              5'h13: out_low = 10'h1b1;
              5'h14: out_low = 10'h1b2;
              5'h15: out_low = 10'h1b2;
              5'h16: out_low = 10'h1b3;
              5'h17: out_low = 10'h1b3;
              5'h18: out_low = 10'h1b4;
              5'h19: out_low = 10'h1b4;
              5'h1a: out_low = 10'h1b5;
              5'h1b: out_low = 10'h1b5;
              5'h1c: out_low = 10'h1b6;
              5'h1d: out_low = 10'h1b6;
              5'h1e: out_low = 10'h1b7;
              5'h1f: out_low = 10'h1b7;
              default: out_low = 10'h000;
            endcase
          end
          5'h01: begin
            case (mant[4:0])
              5'h00: out_low = 10'h1b8;
              5'h01: out_low = 10'h1b8;
              5'h02: out_low = 10'h1b9;
              5'h03: out_low = 10'h1b9;
              5'h04: out_low = 10'h1ba;
              5'h05: out_low = 10'h1ba;
              5'h06: out_low = 10'h1bb;
              5'h07: out_low = 10'h1bb;
              5'h08: out_low = 10'h1bc;
              5'h09: out_low = 10'h1bc;
              5'h0a: out_low = 10'h1bd;
              5'h0b: out_low = 10'h1bd;
              5'h0c: out_low = 10'h1be;
              5'h0d: out_low = 10'h1be;
              5'h0e: out_low = 10'h1bf;
              5'h0f: out_low = 10'h1bf;
              5'h10: out_low = 10'h1c0;
              5'h11: out_low = 10'h1c0;
              5'h12: out_low = 10'h1c1;
              5'h13: out_low = 10'h1c1;
              5'h14: out_low = 10'h1c2;
              5'h15: out_low = 10'h1c2;
              5'h16: out_low = 10'h1c3;
              5'h17: out_low = 10'h1c3;
              5'h18: out_low = 10'h1c4;
              5'h19: out_low = 10'h1c4;
              5'h1a: out_low = 10'h1c5;
              5'h1b: out_low = 10'h1c5;
              5'h1c: out_low = 10'h1c6;
              5'h1d: out_low = 10'h1c6;
              5'h1e: out_low = 10'h1c7;
              5'h1f: out_low = 10'h1c7;
              default: out_low = 10'h000;
            endcase
          end
          5'h02: begin
            case (mant[4:0])
              5'h00: out_low = 10'h1c8;
              5'h01: out_low = 10'h1c8;
              5'h02: out_low = 10'h1c9;
              5'h03: out_low = 10'h1c9;
              5'h04: out_low = 10'h1ca;
              5'h05: out_low = 10'h1ca;
              5'h06: out_low = 10'h1cb;
              5'h07: out_low = 10'h1cb;
              5'h08: out_low = 10'h1cc;
              5'h09: out_low = 10'h1cc;
              5'h0a: out_low = 10'h1cd;
              5'h0b: out_low = 10'h1cd;
              5'h0c: out_low = 10'h1ce;
              5'h0d: out_low = 10'h1ce;
              5'h0e: out_low = 10'h1cf;
              5'h0f: out_low = 10'h1cf;
              5'h10: out_low = 10'h1d0;
              5'h11: out_low = 10'h1d0;
              5'h12: out_low = 10'h1d1;
              5'h13: out_low = 10'h1d1;
              5'h14: out_low = 10'h1d2;
              5'h15: out_low = 10'h1d2;
              5'h16: out_low = 10'h1d3;
              5'h17: out_low = 10'h1d3;
              5'h18: out_low = 10'h1d4;
              5'h19: out_low = 10'h1d4;
              5'h1a: out_low = 10'h1d5;
              5'h1b: out_low = 10'h1d5;
              5'h1c: out_low = 10'h1d6;
              5'h1d: out_low = 10'h1d6;
              5'h1e: out_low = 10'h1d7;
              5'h1f: out_low = 10'h1d7;
              default: out_low = 10'h000;
            endcase
          end
          5'h03: begin
            case (mant[4:0])
              5'h00: out_low = 10'h1d8;
              5'h01: out_low = 10'h1d8;
              5'h02: out_low = 10'h1d9;
              5'h03: out_low = 10'h1d9;
              5'h04: out_low = 10'h1da;
              5'h05: out_low = 10'h1db;
              5'h06: out_low = 10'h1db;
              5'h07: out_low = 10'h1dc;
              5'h08: out_low = 10'h1dc;
              5'h09: out_low = 10'h1dd;
              5'h0a: out_low = 10'h1dd;
              5'h0b: out_low = 10'h1de;
              5'h0c: out_low = 10'h1de;
              5'h0d: out_low = 10'h1df;
              5'h0e: out_low = 10'h1df;
              5'h0f: out_low = 10'h1e0;
              5'h10: out_low = 10'h1e0;
              5'h11: out_low = 10'h1e1;
              5'h12: out_low = 10'h1e1;
              5'h13: out_low = 10'h1e2;
              5'h14: out_low = 10'h1e2;
              5'h15: out_low = 10'h1e3;
              5'h16: out_low = 10'h1e3;
              5'h17: out_low = 10'h1e4;
              5'h18: out_low = 10'h1e4;
              5'h19: out_low = 10'h1e5;
              5'h1a: out_low = 10'h1e5;
              5'h1b: out_low = 10'h1e6;
              5'h1c: out_low = 10'h1e6;
              5'h1d: out_low = 10'h1e7;
              5'h1e: out_low = 10'h1e7;
              5'h1f: out_low = 10'h1e8;
              default: out_low = 10'h000;
            endcase
          end
          5'h04: begin
            case (mant[4:0])
              5'h00: out_low = 10'h1e8;
              5'h01: out_low = 10'h1e9;
              5'h02: out_low = 10'h1e9;
              5'h03: out_low = 10'h1ea;
              5'h04: out_low = 10'h1ea;
              5'h05: out_low = 10'h1eb;
              5'h06: out_low = 10'h1eb;
              5'h07: out_low = 10'h1ec;
              5'h08: out_low = 10'h1ec;
              5'h09: out_low = 10'h1ed;
              5'h0a: out_low = 10'h1ed;
              5'h0b: out_low = 10'h1ee;
              5'h0c: out_low = 10'h1ee;
              5'h0d: out_low = 10'h1ef;
              5'h0e: out_low = 10'h1ef;
              5'h0f: out_low = 10'h1f0;
              5'h10: out_low = 10'h1f0;
              5'h11: out_low = 10'h1f1;
              5'h12: out_low = 10'h1f2;
              5'h13: out_low = 10'h1f2;
              5'h14: out_low = 10'h1f3;
              5'h15: out_low = 10'h1f3;
              5'h16: out_low = 10'h1f4;
              5'h17: out_low = 10'h1f4;
              5'h18: out_low = 10'h1f5;
              5'h19: out_low = 10'h1f5;
              5'h1a: out_low = 10'h1f6;
              5'h1b: out_low = 10'h1f6;
              5'h1c: out_low = 10'h1f7;
              5'h1d: out_low = 10'h1f7;
              5'h1e: out_low = 10'h1f8;
              5'h1f: out_low = 10'h1f8;
              default: out_low = 10'h000;
            endcase
          end
          5'h05: begin
            case (mant[4:0])
              5'h00: out_low = 10'h1f9;
              5'h01: out_low = 10'h1f9;
              5'h02: out_low = 10'h1fa;
              5'h03: out_low = 10'h1fa;
              5'h04: out_low = 10'h1fb;
              5'h05: out_low = 10'h1fb;
              5'h06: out_low = 10'h1fc;
              5'h07: out_low = 10'h1fc;
              5'h08: out_low = 10'h1fd;
              5'h09: out_low = 10'h1fd;
              5'h0a: out_low = 10'h1fe;
              5'h0b: out_low = 10'h1fe;
              5'h0c: out_low = 10'h1ff;
              5'h0d: out_low = 10'h1ff;
              5'h0e: out_low = 10'h200;
              5'h0f: out_low = 10'h201;
              5'h10: out_low = 10'h201;
              5'h11: out_low = 10'h202;
              5'h12: out_low = 10'h202;
              5'h13: out_low = 10'h203;
              5'h14: out_low = 10'h203;
              5'h15: out_low = 10'h204;
              5'h16: out_low = 10'h204;
              5'h17: out_low = 10'h205;
              5'h18: out_low = 10'h205;
              5'h19: out_low = 10'h206;
              5'h1a: out_low = 10'h206;
              5'h1b: out_low = 10'h207;
              5'h1c: out_low = 10'h207;
              5'h1d: out_low = 10'h208;
              5'h1e: out_low = 10'h208;
              5'h1f: out_low = 10'h209;
              default: out_low = 10'h000;
            endcase
          end
          5'h06: begin
            case (mant[4:0])
              5'h00: out_low = 10'h209;
              5'h01: out_low = 10'h20a;
              5'h02: out_low = 10'h20a;
              5'h03: out_low = 10'h20b;
              5'h04: out_low = 10'h20b;
              5'h05: out_low = 10'h20c;
              5'h06: out_low = 10'h20d;
              5'h07: out_low = 10'h20d;
              5'h08: out_low = 10'h20e;
              5'h09: out_low = 10'h20e;
              5'h0a: out_low = 10'h20f;
              5'h0b: out_low = 10'h20f;
              5'h0c: out_low = 10'h210;
              5'h0d: out_low = 10'h210;
              5'h0e: out_low = 10'h211;
              5'h0f: out_low = 10'h211;
              5'h10: out_low = 10'h212;
              5'h11: out_low = 10'h212;
              5'h12: out_low = 10'h213;
              5'h13: out_low = 10'h213;
              5'h14: out_low = 10'h214;
              5'h15: out_low = 10'h214;
              5'h16: out_low = 10'h215;
              5'h17: out_low = 10'h215;
              5'h18: out_low = 10'h216;
              5'h19: out_low = 10'h217;
              5'h1a: out_low = 10'h217;
              5'h1b: out_low = 10'h218;
              5'h1c: out_low = 10'h218;
              5'h1d: out_low = 10'h219;
              5'h1e: out_low = 10'h219;
              5'h1f: out_low = 10'h21a;
              default: out_low = 10'h000;
            endcase
          end
          5'h07: begin
            case (mant[4:0])
              5'h00: out_low = 10'h21a;
              5'h01: out_low = 10'h21b;
              5'h02: out_low = 10'h21b;
              5'h03: out_low = 10'h21c;
              5'h04: out_low = 10'h21c;
              5'h05: out_low = 10'h21d;
              5'h06: out_low = 10'h21d;
              5'h07: out_low = 10'h21e;
              5'h08: out_low = 10'h21e;
              5'h09: out_low = 10'h21f;
              5'h0a: out_low = 10'h220;
              5'h0b: out_low = 10'h220;
              5'h0c: out_low = 10'h221;
              5'h0d: out_low = 10'h221;
              5'h0e: out_low = 10'h222;
              5'h0f: out_low = 10'h222;
              5'h10: out_low = 10'h223;
              5'h11: out_low = 10'h223;
              5'h12: out_low = 10'h224;
              5'h13: out_low = 10'h224;
              5'h14: out_low = 10'h225;
              5'h15: out_low = 10'h225;
              5'h16: out_low = 10'h226;
              5'h17: out_low = 10'h226;
              5'h18: out_low = 10'h227;
              5'h19: out_low = 10'h227;
              5'h1a: out_low = 10'h228;
              5'h1b: out_low = 10'h229;
              5'h1c: out_low = 10'h229;
              5'h1d: out_low = 10'h22a;
              5'h1e: out_low = 10'h22a;
              5'h1f: out_low = 10'h22b;
              default: out_low = 10'h000;
            endcase
          end
          5'h08: begin
            case (mant[4:0])
              5'h00: out_low = 10'h22b;
              5'h01: out_low = 10'h22c;
              5'h02: out_low = 10'h22c;
              5'h03: out_low = 10'h22d;
              5'h04: out_low = 10'h22d;
              5'h05: out_low = 10'h22e;
              5'h06: out_low = 10'h22e;
              5'h07: out_low = 10'h22f;
              5'h08: out_low = 10'h230;
              5'h09: out_low = 10'h230;
              5'h0a: out_low = 10'h231;
              5'h0b: out_low = 10'h231;
              5'h0c: out_low = 10'h232;
              5'h0d: out_low = 10'h232;
              5'h0e: out_low = 10'h233;
              5'h0f: out_low = 10'h233;
              5'h10: out_low = 10'h234;
              5'h11: out_low = 10'h234;
              5'h12: out_low = 10'h235;
              5'h13: out_low = 10'h235;
              5'h14: out_low = 10'h236;
              5'h15: out_low = 10'h236;
              5'h16: out_low = 10'h237;
              5'h17: out_low = 10'h238;
              5'h18: out_low = 10'h238;
              5'h19: out_low = 10'h239;
              5'h1a: out_low = 10'h239;
              5'h1b: out_low = 10'h23a;
              5'h1c: out_low = 10'h23a;
              5'h1d: out_low = 10'h23b;
              5'h1e: out_low = 10'h23b;
              5'h1f: out_low = 10'h23c;
              default: out_low = 10'h000;
            endcase
          end
          5'h09: begin
            case (mant[4:0])
              5'h00: out_low = 10'h23c;
              5'h01: out_low = 10'h23d;
              5'h02: out_low = 10'h23e;
              5'h03: out_low = 10'h23e;
              5'h04: out_low = 10'h23f;
              5'h05: out_low = 10'h23f;
              5'h06: out_low = 10'h240;
              5'h07: out_low = 10'h240;
              5'h08: out_low = 10'h241;
              5'h09: out_low = 10'h241;
              5'h0a: out_low = 10'h242;
              5'h0b: out_low = 10'h242;
              5'h0c: out_low = 10'h243;
              5'h0d: out_low = 10'h243;
              5'h0e: out_low = 10'h244;
              5'h0f: out_low = 10'h245;
              5'h10: out_low = 10'h245;
              5'h11: out_low = 10'h246;
              5'h12: out_low = 10'h246;
              5'h13: out_low = 10'h247;
              5'h14: out_low = 10'h247;
              5'h15: out_low = 10'h248;
              5'h16: out_low = 10'h248;
              5'h17: out_low = 10'h249;
              5'h18: out_low = 10'h249;
              5'h19: out_low = 10'h24a;
              5'h1a: out_low = 10'h24b;
              5'h1b: out_low = 10'h24b;
              5'h1c: out_low = 10'h24c;
              5'h1d: out_low = 10'h24c;
              5'h1e: out_low = 10'h24d;
              5'h1f: out_low = 10'h24d;
              default: out_low = 10'h000;
            endcase
          end
          5'h0a: begin
            case (mant[4:0])
              5'h00: out_low = 10'h24e;
              5'h01: out_low = 10'h24e;
              5'h02: out_low = 10'h24f;
              5'h03: out_low = 10'h24f;
              5'h04: out_low = 10'h250;
              5'h05: out_low = 10'h251;
              5'h06: out_low = 10'h251;
              5'h07: out_low = 10'h252;
              5'h08: out_low = 10'h252;
              5'h09: out_low = 10'h253;
              5'h0a: out_low = 10'h253;
              5'h0b: out_low = 10'h254;
              5'h0c: out_low = 10'h254;
              5'h0d: out_low = 10'h255;
              5'h0e: out_low = 10'h255;
              5'h0f: out_low = 10'h256;
              5'h10: out_low = 10'h257;
              5'h11: out_low = 10'h257;
              5'h12: out_low = 10'h258;
              5'h13: out_low = 10'h258;
              5'h14: out_low = 10'h259;
              5'h15: out_low = 10'h259;
              5'h16: out_low = 10'h25a;
              5'h17: out_low = 10'h25a;
              5'h18: out_low = 10'h25b;
              5'h19: out_low = 10'h25c;
              5'h1a: out_low = 10'h25c;
              5'h1b: out_low = 10'h25d;
              5'h1c: out_low = 10'h25d;
              5'h1d: out_low = 10'h25e;
              5'h1e: out_low = 10'h25e;
              5'h1f: out_low = 10'h25f;
              default: out_low = 10'h000;
            endcase
          end
          5'h0b: begin
            case (mant[4:0])
              5'h00: out_low = 10'h25f;
              5'h01: out_low = 10'h260;
              5'h02: out_low = 10'h260;
              5'h03: out_low = 10'h261;
              5'h04: out_low = 10'h262;
              5'h05: out_low = 10'h262;
              5'h06: out_low = 10'h263;
              5'h07: out_low = 10'h263;
              5'h08: out_low = 10'h264;
              5'h09: out_low = 10'h264;
              5'h0a: out_low = 10'h265;
              5'h0b: out_low = 10'h265;
              5'h0c: out_low = 10'h266;
              5'h0d: out_low = 10'h267;
              5'h0e: out_low = 10'h267;
              5'h0f: out_low = 10'h268;
              5'h10: out_low = 10'h268;
              5'h11: out_low = 10'h269;
              5'h12: out_low = 10'h269;
              5'h13: out_low = 10'h26a;
              5'h14: out_low = 10'h26a;
              5'h15: out_low = 10'h26b;
              5'h16: out_low = 10'h26c;
              5'h17: out_low = 10'h26c;
              5'h18: out_low = 10'h26d;
              5'h19: out_low = 10'h26d;
              5'h1a: out_low = 10'h26e;
              5'h1b: out_low = 10'h26e;
              5'h1c: out_low = 10'h26f;
              5'h1d: out_low = 10'h26f;
              5'h1e: out_low = 10'h270;
              5'h1f: out_low = 10'h271;
              default: out_low = 10'h000;
            endcase
          end
          5'h0c: begin
            case (mant[4:0])
              5'h00: out_low = 10'h271;
              5'h01: out_low = 10'h272;
              5'h02: out_low = 10'h272;
              5'h03: out_low = 10'h273;
              5'h04: out_low = 10'h273;
              5'h05: out_low = 10'h274;
              5'h06: out_low = 10'h274;
              5'h07: out_low = 10'h275;
              5'h08: out_low = 10'h276;
              5'h09: out_low = 10'h276;
              5'h0a: out_low = 10'h277;
              5'h0b: out_low = 10'h277;
              5'h0c: out_low = 10'h278;
              5'h0d: out_low = 10'h278;
              5'h0e: out_low = 10'h279;
              5'h0f: out_low = 10'h27a;
              5'h10: out_low = 10'h27a;
              5'h11: out_low = 10'h27b;
              5'h12: out_low = 10'h27b;
              5'h13: out_low = 10'h27c;
              5'h14: out_low = 10'h27c;
              5'h15: out_low = 10'h27d;
              5'h16: out_low = 10'h27d;
              5'h17: out_low = 10'h27e;
              5'h18: out_low = 10'h27f;
              5'h19: out_low = 10'h27f;
              5'h1a: out_low = 10'h280;
              5'h1b: out_low = 10'h280;
              5'h1c: out_low = 10'h281;
              5'h1d: out_low = 10'h281;
              5'h1e: out_low = 10'h282;
              5'h1f: out_low = 10'h283;
              default: out_low = 10'h000;
            endcase
          end
          5'h0d: begin
            case (mant[4:0])
              5'h00: out_low = 10'h283;
              5'h01: out_low = 10'h284;
              5'h02: out_low = 10'h284;
              5'h03: out_low = 10'h285;
              5'h04: out_low = 10'h285;
              5'h05: out_low = 10'h286;
              5'h06: out_low = 10'h286;
              5'h07: out_low = 10'h287;
              5'h08: out_low = 10'h288;
              5'h09: out_low = 10'h288;
              5'h0a: out_low = 10'h289;
              5'h0b: out_low = 10'h289;
              5'h0c: out_low = 10'h28a;
              5'h0d: out_low = 10'h28a;
              5'h0e: out_low = 10'h28b;
              5'h0f: out_low = 10'h28c;
              5'h10: out_low = 10'h28c;
              5'h11: out_low = 10'h28d;
              5'h12: out_low = 10'h28d;
              5'h13: out_low = 10'h28e;
              5'h14: out_low = 10'h28e;
              5'h15: out_low = 10'h28f;
              5'h16: out_low = 10'h290;
              5'h17: out_low = 10'h290;
              5'h18: out_low = 10'h291;
              5'h19: out_low = 10'h291;
              5'h1a: out_low = 10'h292;
              5'h1b: out_low = 10'h292;
              5'h1c: out_low = 10'h293;
              5'h1d: out_low = 10'h294;
              5'h1e: out_low = 10'h294;
              5'h1f: out_low = 10'h295;
              default: out_low = 10'h000;
            endcase
          end
          5'h0e: begin
            case (mant[4:0])
              5'h00: out_low = 10'h295;
              5'h01: out_low = 10'h296;
              5'h02: out_low = 10'h296;
              5'h03: out_low = 10'h297;
              5'h04: out_low = 10'h298;
              5'h05: out_low = 10'h298;
              5'h06: out_low = 10'h299;
              5'h07: out_low = 10'h299;
              5'h08: out_low = 10'h29a;
              5'h09: out_low = 10'h29a;
              5'h0a: out_low = 10'h29b;
              5'h0b: out_low = 10'h29c;
              5'h0c: out_low = 10'h29c;
              5'h0d: out_low = 10'h29d;
              5'h0e: out_low = 10'h29d;
              5'h0f: out_low = 10'h29e;
              5'h10: out_low = 10'h29e;
              5'h11: out_low = 10'h29f;
              5'h12: out_low = 10'h2a0;
              5'h13: out_low = 10'h2a0;
              5'h14: out_low = 10'h2a1;
              5'h15: out_low = 10'h2a1;
              5'h16: out_low = 10'h2a2;
              5'h17: out_low = 10'h2a2;
              5'h18: out_low = 10'h2a3;
              5'h19: out_low = 10'h2a4;
              5'h1a: out_low = 10'h2a4;
              5'h1b: out_low = 10'h2a5;
              5'h1c: out_low = 10'h2a5;
              5'h1d: out_low = 10'h2a6;
              5'h1e: out_low = 10'h2a6;
              5'h1f: out_low = 10'h2a7;
              default: out_low = 10'h000;
            endcase
          end
          5'h0f: begin
            case (mant[4:0])
              5'h00: out_low = 10'h2a8;
              5'h01: out_low = 10'h2a8;
              5'h02: out_low = 10'h2a9;
              5'h03: out_low = 10'h2a9;
              5'h04: out_low = 10'h2aa;
              5'h05: out_low = 10'h2aa;
              5'h06: out_low = 10'h2ab;
              5'h07: out_low = 10'h2ac;
              5'h08: out_low = 10'h2ac;
              5'h09: out_low = 10'h2ad;
              5'h0a: out_low = 10'h2ad;
              5'h0b: out_low = 10'h2ae;
              5'h0c: out_low = 10'h2af;
              5'h0d: out_low = 10'h2af;
              5'h0e: out_low = 10'h2b0;
              5'h0f: out_low = 10'h2b0;
              5'h10: out_low = 10'h2b1;
              5'h11: out_low = 10'h2b1;
              5'h12: out_low = 10'h2b2;
              5'h13: out_low = 10'h2b3;
              5'h14: out_low = 10'h2b3;
              5'h15: out_low = 10'h2b4;
              5'h16: out_low = 10'h2b4;
              5'h17: out_low = 10'h2b5;
              5'h18: out_low = 10'h2b5;
              5'h19: out_low = 10'h2b6;
              5'h1a: out_low = 10'h2b7;
              5'h1b: out_low = 10'h2b7;
              5'h1c: out_low = 10'h2b8;
              5'h1d: out_low = 10'h2b8;
              5'h1e: out_low = 10'h2b9;
              5'h1f: out_low = 10'h2ba;
              default: out_low = 10'h000;
            endcase
          end
          5'h10: begin
            case (mant[4:0])
              5'h00: out_low = 10'h2ba;
              5'h01: out_low = 10'h2bb;
              5'h02: out_low = 10'h2bb;
              5'h03: out_low = 10'h2bc;
              5'h04: out_low = 10'h2bc;
              5'h05: out_low = 10'h2bd;
              5'h06: out_low = 10'h2be;
              5'h07: out_low = 10'h2be;
              5'h08: out_low = 10'h2bf;
              5'h09: out_low = 10'h2bf;
              5'h0a: out_low = 10'h2c0;
              5'h0b: out_low = 10'h2c1;
              5'h0c: out_low = 10'h2c1;
              5'h0d: out_low = 10'h2c2;
              5'h0e: out_low = 10'h2c2;
              5'h0f: out_low = 10'h2c3;
              5'h10: out_low = 10'h2c4;
              5'h11: out_low = 10'h2c4;
              5'h12: out_low = 10'h2c5;
              5'h13: out_low = 10'h2c5;
              5'h14: out_low = 10'h2c6;
              5'h15: out_low = 10'h2c6;
              5'h16: out_low = 10'h2c7;
              5'h17: out_low = 10'h2c8;
              5'h18: out_low = 10'h2c8;
              5'h19: out_low = 10'h2c9;
              5'h1a: out_low = 10'h2c9;
              5'h1b: out_low = 10'h2ca;
              5'h1c: out_low = 10'h2cb;
              5'h1d: out_low = 10'h2cb;
              5'h1e: out_low = 10'h2cc;
              5'h1f: out_low = 10'h2cc;
              default: out_low = 10'h000;
            endcase
          end
          5'h11: begin
            case (mant[4:0])
              5'h00: out_low = 10'h2cd;
              5'h01: out_low = 10'h2cd;
              5'h02: out_low = 10'h2ce;
              5'h03: out_low = 10'h2cf;
              5'h04: out_low = 10'h2cf;
              5'h05: out_low = 10'h2d0;
              5'h06: out_low = 10'h2d0;
              5'h07: out_low = 10'h2d1;
              5'h08: out_low = 10'h2d2;
              5'h09: out_low = 10'h2d2;
              5'h0a: out_low = 10'h2d3;
              5'h0b: out_low = 10'h2d3;
              5'h0c: out_low = 10'h2d4;
              5'h0d: out_low = 10'h2d5;
              5'h0e: out_low = 10'h2d5;
              5'h0f: out_low = 10'h2d6;
              5'h10: out_low = 10'h2d6;
              5'h11: out_low = 10'h2d7;
              5'h12: out_low = 10'h2d8;
              5'h13: out_low = 10'h2d8;
              5'h14: out_low = 10'h2d9;
              5'h15: out_low = 10'h2d9;
              5'h16: out_low = 10'h2da;
              5'h17: out_low = 10'h2db;
              5'h18: out_low = 10'h2db;
              5'h19: out_low = 10'h2dc;
              5'h1a: out_low = 10'h2dc;
              5'h1b: out_low = 10'h2dd;
              5'h1c: out_low = 10'h2dd;
              5'h1d: out_low = 10'h2de;
              5'h1e: out_low = 10'h2df;
              5'h1f: out_low = 10'h2df;
              default: out_low = 10'h000;
            endcase
          end
          5'h12: begin
            case (mant[4:0])
              5'h00: out_low = 10'h2e0;
              5'h01: out_low = 10'h2e0;
              5'h02: out_low = 10'h2e1;
              5'h03: out_low = 10'h2e2;
              5'h04: out_low = 10'h2e2;
              5'h05: out_low = 10'h2e3;
              5'h06: out_low = 10'h2e3;
              5'h07: out_low = 10'h2e4;
              5'h08: out_low = 10'h2e5;
              5'h09: out_low = 10'h2e5;
              5'h0a: out_low = 10'h2e6;
              5'h0b: out_low = 10'h2e6;
              5'h0c: out_low = 10'h2e7;
              5'h0d: out_low = 10'h2e8;
              5'h0e: out_low = 10'h2e8;
              5'h0f: out_low = 10'h2e9;
              5'h10: out_low = 10'h2e9;
              5'h11: out_low = 10'h2ea;
              5'h12: out_low = 10'h2eb;
              5'h13: out_low = 10'h2eb;
              5'h14: out_low = 10'h2ec;
              5'h15: out_low = 10'h2ec;
              5'h16: out_low = 10'h2ed;
              5'h17: out_low = 10'h2ee;
              5'h18: out_low = 10'h2ee;
              5'h19: out_low = 10'h2ef;
              5'h1a: out_low = 10'h2ef;
              5'h1b: out_low = 10'h2f0;
              5'h1c: out_low = 10'h2f1;
              5'h1d: out_low = 10'h2f1;
              5'h1e: out_low = 10'h2f2;
              5'h1f: out_low = 10'h2f2;
              default: out_low = 10'h000;
            endcase
          end
          5'h13: begin
            case (mant[4:0])
              5'h00: out_low = 10'h2f3;
              5'h01: out_low = 10'h2f4;
              5'h02: out_low = 10'h2f4;
              5'h03: out_low = 10'h2f5;
              5'h04: out_low = 10'h2f5;
              5'h05: out_low = 10'h2f6;
              5'h06: out_low = 10'h2f7;
              5'h07: out_low = 10'h2f7;
              5'h08: out_low = 10'h2f8;
              5'h09: out_low = 10'h2f8;
              5'h0a: out_low = 10'h2f9;
              5'h0b: out_low = 10'h2fa;
              5'h0c: out_low = 10'h2fa;
              5'h0d: out_low = 10'h2fb;
              5'h0e: out_low = 10'h2fb;
              5'h0f: out_low = 10'h2fc;
              5'h10: out_low = 10'h2fd;
              5'h11: out_low = 10'h2fd;
              5'h12: out_low = 10'h2fe;
              5'h13: out_low = 10'h2ff;
              5'h14: out_low = 10'h2ff;
              5'h15: out_low = 10'h300;
              5'h16: out_low = 10'h300;
              5'h17: out_low = 10'h301;
              5'h18: out_low = 10'h302;
              5'h19: out_low = 10'h302;
              5'h1a: out_low = 10'h303;
              5'h1b: out_low = 10'h303;
              5'h1c: out_low = 10'h304;
              5'h1d: out_low = 10'h305;
              5'h1e: out_low = 10'h305;
              5'h1f: out_low = 10'h306;
              default: out_low = 10'h000;
            endcase
          end
          5'h14: begin
            case (mant[4:0])
              5'h00: out_low = 10'h306;
              5'h01: out_low = 10'h307;
              5'h02: out_low = 10'h308;
              5'h03: out_low = 10'h308;
              5'h04: out_low = 10'h309;
              5'h05: out_low = 10'h309;
              5'h06: out_low = 10'h30a;
              5'h07: out_low = 10'h30b;
              5'h08: out_low = 10'h30b;
              5'h09: out_low = 10'h30c;
              5'h0a: out_low = 10'h30c;
              5'h0b: out_low = 10'h30d;
              5'h0c: out_low = 10'h30e;
              5'h0d: out_low = 10'h30e;
              5'h0e: out_low = 10'h30f;
              5'h0f: out_low = 10'h310;
              5'h10: out_low = 10'h310;
              5'h11: out_low = 10'h311;
              5'h12: out_low = 10'h311;
              5'h13: out_low = 10'h312;
              5'h14: out_low = 10'h313;
              5'h15: out_low = 10'h313;
              5'h16: out_low = 10'h314;
              5'h17: out_low = 10'h314;
              5'h18: out_low = 10'h315;
              5'h19: out_low = 10'h316;
              5'h1a: out_low = 10'h316;
              5'h1b: out_low = 10'h317;
              5'h1c: out_low = 10'h318;
              5'h1d: out_low = 10'h318;
              5'h1e: out_low = 10'h319;
              5'h1f: out_low = 10'h319;
              default: out_low = 10'h000;
            endcase
          end
          5'h15: begin
            case (mant[4:0])
              5'h00: out_low = 10'h31a;
              5'h01: out_low = 10'h31b;
              5'h02: out_low = 10'h31b;
              5'h03: out_low = 10'h31c;
              5'h04: out_low = 10'h31c;
              5'h05: out_low = 10'h31d;
              5'h06: out_low = 10'h31e;
              5'h07: out_low = 10'h31e;
              5'h08: out_low = 10'h31f;
              5'h09: out_low = 10'h320;
              5'h0a: out_low = 10'h320;
              5'h0b: out_low = 10'h321;
              5'h0c: out_low = 10'h321;
              5'h0d: out_low = 10'h322;
              5'h0e: out_low = 10'h323;
              5'h0f: out_low = 10'h323;
              5'h10: out_low = 10'h324;
              5'h11: out_low = 10'h324;
              5'h12: out_low = 10'h325;
              5'h13: out_low = 10'h326;
              5'h14: out_low = 10'h326;
              5'h15: out_low = 10'h327;
              5'h16: out_low = 10'h328;
              5'h17: out_low = 10'h328;
              5'h18: out_low = 10'h329;
              5'h19: out_low = 10'h329;
              5'h1a: out_low = 10'h32a;
              5'h1b: out_low = 10'h32b;
              5'h1c: out_low = 10'h32b;
              5'h1d: out_low = 10'h32c;
              5'h1e: out_low = 10'h32d;
              5'h1f: out_low = 10'h32d;
              default: out_low = 10'h000;
            endcase
          end
          5'h16: begin
            case (mant[4:0])
              5'h00: out_low = 10'h32e;
              5'h01: out_low = 10'h32e;
              5'h02: out_low = 10'h32f;
              5'h03: out_low = 10'h330;
              5'h04: out_low = 10'h330;
              5'h05: out_low = 10'h331;
              5'h06: out_low = 10'h332;
              5'h07: out_low = 10'h332;
              5'h08: out_low = 10'h333;
              5'h09: out_low = 10'h333;
              5'h0a: out_low = 10'h334;
              5'h0b: out_low = 10'h335;
              5'h0c: out_low = 10'h335;
              5'h0d: out_low = 10'h336;
              5'h0e: out_low = 10'h337;
              5'h0f: out_low = 10'h337;
              5'h10: out_low = 10'h338;
              5'h11: out_low = 10'h338;
              5'h12: out_low = 10'h339;
              5'h13: out_low = 10'h33a;
              5'h14: out_low = 10'h33a;
              5'h15: out_low = 10'h33b;
              5'h16: out_low = 10'h33c;
              5'h17: out_low = 10'h33c;
              5'h18: out_low = 10'h33d;
              5'h19: out_low = 10'h33d;
              5'h1a: out_low = 10'h33e;
              5'h1b: out_low = 10'h33f;
              5'h1c: out_low = 10'h33f;
              5'h1d: out_low = 10'h340;
              5'h1e: out_low = 10'h341;
              5'h1f: out_low = 10'h341;
              default: out_low = 10'h000;
            endcase
          end
          5'h17: begin
            case (mant[4:0])
              5'h00: out_low = 10'h342;
              5'h01: out_low = 10'h342;
              5'h02: out_low = 10'h343;
              5'h03: out_low = 10'h344;
              5'h04: out_low = 10'h344;
              5'h05: out_low = 10'h345;
              5'h06: out_low = 10'h346;
              5'h07: out_low = 10'h346;
              5'h08: out_low = 10'h347;
              5'h09: out_low = 10'h347;
              5'h0a: out_low = 10'h348;
              5'h0b: out_low = 10'h349;
              5'h0c: out_low = 10'h349;
              5'h0d: out_low = 10'h34a;
              5'h0e: out_low = 10'h34b;
              5'h0f: out_low = 10'h34b;
              5'h10: out_low = 10'h34c;
              5'h11: out_low = 10'h34d;
              5'h12: out_low = 10'h34d;
              5'h13: out_low = 10'h34e;
              5'h14: out_low = 10'h34e;
              5'h15: out_low = 10'h34f;
              5'h16: out_low = 10'h350;
              5'h17: out_low = 10'h350;
              5'h18: out_low = 10'h351;
              5'h19: out_low = 10'h352;
              5'h1a: out_low = 10'h352;
              5'h1b: out_low = 10'h353;
              5'h1c: out_low = 10'h353;
              5'h1d: out_low = 10'h354;
              5'h1e: out_low = 10'h355;
              5'h1f: out_low = 10'h355;
              default: out_low = 10'h000;
            endcase
          end
          5'h18: begin
            case (mant[4:0])
              5'h00: out_low = 10'h356;
              5'h01: out_low = 10'h357;
              5'h02: out_low = 10'h357;
              5'h03: out_low = 10'h358;
              5'h04: out_low = 10'h359;
              5'h05: out_low = 10'h359;
              5'h06: out_low = 10'h35a;
              5'h07: out_low = 10'h35a;
              5'h08: out_low = 10'h35b;
              5'h09: out_low = 10'h35c;
              5'h0a: out_low = 10'h35c;
              5'h0b: out_low = 10'h35d;
              5'h0c: out_low = 10'h35e;
              5'h0d: out_low = 10'h35e;
              5'h0e: out_low = 10'h35f;
              5'h0f: out_low = 10'h360;
              5'h10: out_low = 10'h360;
              5'h11: out_low = 10'h361;
              5'h12: out_low = 10'h362;
              5'h13: out_low = 10'h362;
              5'h14: out_low = 10'h363;
              5'h15: out_low = 10'h363;
              5'h16: out_low = 10'h364;
              5'h17: out_low = 10'h365;
              5'h18: out_low = 10'h365;
              5'h19: out_low = 10'h366;
              5'h1a: out_low = 10'h367;
              5'h1b: out_low = 10'h367;
              5'h1c: out_low = 10'h368;
              5'h1d: out_low = 10'h369;
              5'h1e: out_low = 10'h369;
              5'h1f: out_low = 10'h36a;
              default: out_low = 10'h000;
            endcase
          end
          5'h19: begin
            case (mant[4:0])
              5'h00: out_low = 10'h36a;
              5'h01: out_low = 10'h36b;
              5'h02: out_low = 10'h36c;
              5'h03: out_low = 10'h36c;
              5'h04: out_low = 10'h36d;
              5'h05: out_low = 10'h36e;
              5'h06: out_low = 10'h36e;
              5'h07: out_low = 10'h36f;
              5'h08: out_low = 10'h370;
              5'h09: out_low = 10'h370;
              5'h0a: out_low = 10'h371;
              5'h0b: out_low = 10'h372;
              5'h0c: out_low = 10'h372;
              5'h0d: out_low = 10'h373;
              5'h0e: out_low = 10'h373;
              5'h0f: out_low = 10'h374;
              5'h10: out_low = 10'h375;
              5'h11: out_low = 10'h375;
              5'h12: out_low = 10'h376;
              5'h13: out_low = 10'h377;
              5'h14: out_low = 10'h377;
              5'h15: out_low = 10'h378;
              5'h16: out_low = 10'h379;
              5'h17: out_low = 10'h379;
              5'h18: out_low = 10'h37a;
              5'h19: out_low = 10'h37b;
              5'h1a: out_low = 10'h37b;
              5'h1b: out_low = 10'h37c;
              5'h1c: out_low = 10'h37d;
              5'h1d: out_low = 10'h37d;
              5'h1e: out_low = 10'h37e;
              5'h1f: out_low = 10'h37e;
              default: out_low = 10'h000;
            endcase
          end
          5'h1a: begin
            case (mant[4:0])
              5'h00: out_low = 10'h37f;
              5'h01: out_low = 10'h380;
              5'h02: out_low = 10'h380;
              5'h03: out_low = 10'h381;
              5'h04: out_low = 10'h382;
              5'h05: out_low = 10'h382;
              5'h06: out_low = 10'h383;
              5'h07: out_low = 10'h384;
              5'h08: out_low = 10'h384;
              5'h09: out_low = 10'h385;
              5'h0a: out_low = 10'h386;
              5'h0b: out_low = 10'h386;
              5'h0c: out_low = 10'h387;
              5'h0d: out_low = 10'h388;
              5'h0e: out_low = 10'h388;
              5'h0f: out_low = 10'h389;
              5'h10: out_low = 10'h38a;
              5'h11: out_low = 10'h38a;
              5'h12: out_low = 10'h38b;
              5'h13: out_low = 10'h38c;
              5'h14: out_low = 10'h38c;
              5'h15: out_low = 10'h38d;
              5'h16: out_low = 10'h38d;
              5'h17: out_low = 10'h38e;
              5'h18: out_low = 10'h38f;
              5'h19: out_low = 10'h38f;
              5'h1a: out_low = 10'h390;
              5'h1b: out_low = 10'h391;
              5'h1c: out_low = 10'h391;
              5'h1d: out_low = 10'h392;
              5'h1e: out_low = 10'h393;
              5'h1f: out_low = 10'h393;
              default: out_low = 10'h000;
            endcase
          end
          5'h1b: begin
            case (mant[4:0])
              5'h00: out_low = 10'h394;
              5'h01: out_low = 10'h395;
              5'h02: out_low = 10'h395;
              5'h03: out_low = 10'h396;
              5'h04: out_low = 10'h397;
              5'h05: out_low = 10'h397;
              5'h06: out_low = 10'h398;
              5'h07: out_low = 10'h399;
              5'h08: out_low = 10'h399;
              5'h09: out_low = 10'h39a;
              5'h0a: out_low = 10'h39b;
              5'h0b: out_low = 10'h39b;
              5'h0c: out_low = 10'h39c;
              5'h0d: out_low = 10'h39d;
              5'h0e: out_low = 10'h39d;
              5'h0f: out_low = 10'h39e;
              5'h10: out_low = 10'h39f;
              5'h11: out_low = 10'h39f;
              5'h12: out_low = 10'h3a0;
              5'h13: out_low = 10'h3a1;
              5'h14: out_low = 10'h3a1;
              5'h15: out_low = 10'h3a2;
              5'h16: out_low = 10'h3a3;
              5'h17: out_low = 10'h3a3;
              5'h18: out_low = 10'h3a4;
              5'h19: out_low = 10'h3a5;
              5'h1a: out_low = 10'h3a5;
              5'h1b: out_low = 10'h3a6;
              5'h1c: out_low = 10'h3a7;
              5'h1d: out_low = 10'h3a7;
              5'h1e: out_low = 10'h3a8;
              5'h1f: out_low = 10'h3a9;
              default: out_low = 10'h000;
            endcase
          end
          5'h1c: begin
            case (mant[4:0])
              5'h00: out_low = 10'h3a9;
              5'h01: out_low = 10'h3aa;
              5'h02: out_low = 10'h3aa;
              5'h03: out_low = 10'h3ab;
              5'h04: out_low = 10'h3ac;
              5'h05: out_low = 10'h3ac;
              5'h06: out_low = 10'h3ad;
              5'h07: out_low = 10'h3ae;
              5'h08: out_low = 10'h3ae;
              5'h09: out_low = 10'h3af;
              5'h0a: out_low = 10'h3b0;
              5'h0b: out_low = 10'h3b0;
              5'h0c: out_low = 10'h3b1;
              5'h0d: out_low = 10'h3b2;
              5'h0e: out_low = 10'h3b2;
              5'h0f: out_low = 10'h3b3;
              5'h10: out_low = 10'h3b4;
              5'h11: out_low = 10'h3b4;
              5'h12: out_low = 10'h3b5;
              5'h13: out_low = 10'h3b6;
              5'h14: out_low = 10'h3b6;
              5'h15: out_low = 10'h3b7;
              5'h16: out_low = 10'h3b8;
              5'h17: out_low = 10'h3b8;
              5'h18: out_low = 10'h3b9;
              5'h19: out_low = 10'h3ba;
              5'h1a: out_low = 10'h3bb;
              5'h1b: out_low = 10'h3bb;
              5'h1c: out_low = 10'h3bc;
              5'h1d: out_low = 10'h3bd;
              5'h1e: out_low = 10'h3bd;
              5'h1f: out_low = 10'h3be;
              default: out_low = 10'h000;
            endcase
          end
          5'h1d: begin
            case (mant[4:0])
              5'h00: out_low = 10'h3bf;
              5'h01: out_low = 10'h3bf;
              5'h02: out_low = 10'h3c0;
              5'h03: out_low = 10'h3c1;
              5'h04: out_low = 10'h3c1;
              5'h05: out_low = 10'h3c2;
              5'h06: out_low = 10'h3c3;
              5'h07: out_low = 10'h3c3;
              5'h08: out_low = 10'h3c4;
              5'h09: out_low = 10'h3c5;
              5'h0a: out_low = 10'h3c5;
              5'h0b: out_low = 10'h3c6;
              5'h0c: out_low = 10'h3c7;
              5'h0d: out_low = 10'h3c7;
              5'h0e: out_low = 10'h3c8;
              5'h0f: out_low = 10'h3c9;
              5'h10: out_low = 10'h3c9;
              5'h11: out_low = 10'h3ca;
              5'h12: out_low = 10'h3cb;
              5'h13: out_low = 10'h3cb;
              5'h14: out_low = 10'h3cc;
              5'h15: out_low = 10'h3cd;
              5'h16: out_low = 10'h3cd;
              5'h17: out_low = 10'h3ce;
              5'h18: out_low = 10'h3cf;
              5'h19: out_low = 10'h3cf;
              5'h1a: out_low = 10'h3d0;
              5'h1b: out_low = 10'h3d1;
              5'h1c: out_low = 10'h3d1;
              5'h1d: out_low = 10'h3d2;
              5'h1e: out_low = 10'h3d3;
              5'h1f: out_low = 10'h3d3;
              default: out_low = 10'h000;
            endcase
          end
          5'h1e: begin
            case (mant[4:0])
              5'h00: out_low = 10'h3d4;
              5'h01: out_low = 10'h3d5;
              5'h02: out_low = 10'h3d5;
              5'h03: out_low = 10'h3d6;
              5'h04: out_low = 10'h3d7;
              5'h05: out_low = 10'h3d8;
              5'h06: out_low = 10'h3d8;
              5'h07: out_low = 10'h3d9;
              5'h08: out_low = 10'h3da;
              5'h09: out_low = 10'h3da;
              5'h0a: out_low = 10'h3db;
              5'h0b: out_low = 10'h3dc;
              5'h0c: out_low = 10'h3dc;
              5'h0d: out_low = 10'h3dd;
              5'h0e: out_low = 10'h3de;
              5'h0f: out_low = 10'h3de;
              5'h10: out_low = 10'h3df;
              5'h11: out_low = 10'h3e0;
              5'h12: out_low = 10'h3e0;
              5'h13: out_low = 10'h3e1;
              5'h14: out_low = 10'h3e2;
              5'h15: out_low = 10'h3e2;
              5'h16: out_low = 10'h3e3;
              5'h17: out_low = 10'h3e4;
              5'h18: out_low = 10'h3e4;
              5'h19: out_low = 10'h3e5;
              5'h1a: out_low = 10'h3e6;
              5'h1b: out_low = 10'h3e7;
              5'h1c: out_low = 10'h3e7;
              5'h1d: out_low = 10'h3e8;
              5'h1e: out_low = 10'h3e9;
              5'h1f: out_low = 10'h3e9;
              default: out_low = 10'h000;
            endcase
          end
          5'h1f: begin
            case (mant[4:0])
              5'h00: out_low = 10'h3ea;
              5'h01: out_low = 10'h3eb;
              5'h02: out_low = 10'h3eb;
              5'h03: out_low = 10'h3ec;
              5'h04: out_low = 10'h3ed;
              5'h05: out_low = 10'h3ed;
              5'h06: out_low = 10'h3ee;
              5'h07: out_low = 10'h3ef;
              5'h08: out_low = 10'h3ef;
              5'h09: out_low = 10'h3f0;
              5'h0a: out_low = 10'h3f1;
              5'h0b: out_low = 10'h3f1;
              5'h0c: out_low = 10'h3f2;
              5'h0d: out_low = 10'h3f3;
              5'h0e: out_low = 10'h3f4;
              5'h0f: out_low = 10'h3f4;
              5'h10: out_low = 10'h3f5;
              5'h11: out_low = 10'h3f6;
              5'h12: out_low = 10'h3f6;
              5'h13: out_low = 10'h3f7;
              5'h14: out_low = 10'h3f8;
              5'h15: out_low = 10'h3f8;
              5'h16: out_low = 10'h3f9;
              5'h17: out_low = 10'h3fa;
              5'h18: out_low = 10'h3fa;
              5'h19: out_low = 10'h3fb;
              5'h1a: out_low = 10'h3fc;
              5'h1b: out_low = 10'h3fd;
              5'h1c: out_low = 10'h3fd;
              5'h1d: out_low = 10'h3fe;
              5'h1e: out_low = 10'h3ff;
              5'h1f: out_low = 10'h3ff;
              default: out_low = 10'h000;
            endcase
          end
          default: out_low = 10'h000;
        endcase
      end
      6'h0f: begin
        case (mant[9:5])
          5'h00: begin
            case (mant[4:0])
              5'h00: out_low = 10'h000;
              5'h01: out_low = 10'h001;
              5'h02: out_low = 10'h001;
              5'h03: out_low = 10'h002;
              5'h04: out_low = 10'h003;
              5'h05: out_low = 10'h003;
              5'h06: out_low = 10'h004;
              5'h07: out_low = 10'h005;
              5'h08: out_low = 10'h006;
              5'h09: out_low = 10'h006;
              5'h0a: out_low = 10'h007;
              5'h0b: out_low = 10'h008;
              5'h0c: out_low = 10'h008;
              5'h0d: out_low = 10'h009;
              5'h0e: out_low = 10'h00a;
              5'h0f: out_low = 10'h00a;
              5'h10: out_low = 10'h00b;
              5'h11: out_low = 10'h00c;
              5'h12: out_low = 10'h00d;
              5'h13: out_low = 10'h00d;
              5'h14: out_low = 10'h00e;
              5'h15: out_low = 10'h00f;
              5'h16: out_low = 10'h00f;
              5'h17: out_low = 10'h010;
              5'h18: out_low = 10'h011;
              5'h19: out_low = 10'h011;
              5'h1a: out_low = 10'h012;
              5'h1b: out_low = 10'h013;
              5'h1c: out_low = 10'h014;
              5'h1d: out_low = 10'h014;
              5'h1e: out_low = 10'h015;
              5'h1f: out_low = 10'h016;
              default: out_low = 10'h000;
            endcase
          end
          5'h01: begin
            case (mant[4:0])
              5'h00: out_low = 10'h016;
              5'h01: out_low = 10'h017;
              5'h02: out_low = 10'h018;
              5'h03: out_low = 10'h019;
              5'h04: out_low = 10'h019;
              5'h05: out_low = 10'h01a;
              5'h06: out_low = 10'h01b;
              5'h07: out_low = 10'h01b;
              5'h08: out_low = 10'h01c;
              5'h09: out_low = 10'h01d;
              5'h0a: out_low = 10'h01e;
              5'h0b: out_low = 10'h01e;
              5'h0c: out_low = 10'h01f;
              5'h0d: out_low = 10'h020;
              5'h0e: out_low = 10'h020;
              5'h0f: out_low = 10'h021;
              5'h10: out_low = 10'h022;
              5'h11: out_low = 10'h023;
              5'h12: out_low = 10'h023;
              5'h13: out_low = 10'h024;
              5'h14: out_low = 10'h025;
              5'h15: out_low = 10'h025;
              5'h16: out_low = 10'h026;
              5'h17: out_low = 10'h027;
              5'h18: out_low = 10'h028;
              5'h19: out_low = 10'h028;
              5'h1a: out_low = 10'h029;
              5'h1b: out_low = 10'h02a;
              5'h1c: out_low = 10'h02a;
              5'h1d: out_low = 10'h02b;
              5'h1e: out_low = 10'h02c;
              5'h1f: out_low = 10'h02d;
              default: out_low = 10'h000;
            endcase
          end
          5'h02: begin
            case (mant[4:0])
              5'h00: out_low = 10'h02d;
              5'h01: out_low = 10'h02e;
              5'h02: out_low = 10'h02f;
              5'h03: out_low = 10'h030;
              5'h04: out_low = 10'h030;
              5'h05: out_low = 10'h031;
              5'h06: out_low = 10'h032;
              5'h07: out_low = 10'h032;
              5'h08: out_low = 10'h033;
              5'h09: out_low = 10'h034;
              5'h0a: out_low = 10'h035;
              5'h0b: out_low = 10'h035;
              5'h0c: out_low = 10'h036;
              5'h0d: out_low = 10'h037;
              5'h0e: out_low = 10'h038;
              5'h0f: out_low = 10'h038;
              5'h10: out_low = 10'h039;
              5'h11: out_low = 10'h03a;
              5'h12: out_low = 10'h03a;
              5'h13: out_low = 10'h03b;
              5'h14: out_low = 10'h03c;
              5'h15: out_low = 10'h03d;
              5'h16: out_low = 10'h03d;
              5'h17: out_low = 10'h03e;
              5'h18: out_low = 10'h03f;
              5'h19: out_low = 10'h040;
              5'h1a: out_low = 10'h040;
              5'h1b: out_low = 10'h041;
              5'h1c: out_low = 10'h042;
              5'h1d: out_low = 10'h043;
              5'h1e: out_low = 10'h043;
              5'h1f: out_low = 10'h044;
              default: out_low = 10'h000;
            endcase
          end
          5'h03: begin
            case (mant[4:0])
              5'h00: out_low = 10'h045;
              5'h01: out_low = 10'h045;
              5'h02: out_low = 10'h046;
              5'h03: out_low = 10'h047;
              5'h04: out_low = 10'h048;
              5'h05: out_low = 10'h048;
              5'h06: out_low = 10'h049;
              5'h07: out_low = 10'h04a;
              5'h08: out_low = 10'h04b;
              5'h09: out_low = 10'h04b;
              5'h0a: out_low = 10'h04c;
              5'h0b: out_low = 10'h04d;
              5'h0c: out_low = 10'h04e;
              5'h0d: out_low = 10'h04e;
              5'h0e: out_low = 10'h04f;
              5'h0f: out_low = 10'h050;
              5'h10: out_low = 10'h051;
              5'h11: out_low = 10'h051;
              5'h12: out_low = 10'h052;
              5'h13: out_low = 10'h053;
              5'h14: out_low = 10'h054;
              5'h15: out_low = 10'h054;
              5'h16: out_low = 10'h055;
              5'h17: out_low = 10'h056;
              5'h18: out_low = 10'h057;
              5'h19: out_low = 10'h057;
              5'h1a: out_low = 10'h058;
              5'h1b: out_low = 10'h059;
              5'h1c: out_low = 10'h05a;
              5'h1d: out_low = 10'h05a;
              5'h1e: out_low = 10'h05b;
              5'h1f: out_low = 10'h05c;
              default: out_low = 10'h000;
            endcase
          end
          5'h04: begin
            case (mant[4:0])
              5'h00: out_low = 10'h05d;
              5'h01: out_low = 10'h05d;
              5'h02: out_low = 10'h05e;
              5'h03: out_low = 10'h05f;
              5'h04: out_low = 10'h060;
              5'h05: out_low = 10'h060;
              5'h06: out_low = 10'h061;
              5'h07: out_low = 10'h062;
              5'h08: out_low = 10'h063;
              5'h09: out_low = 10'h064;
              5'h0a: out_low = 10'h064;
              5'h0b: out_low = 10'h065;
              5'h0c: out_low = 10'h066;
              5'h0d: out_low = 10'h067;
              5'h0e: out_low = 10'h067;
              5'h0f: out_low = 10'h068;
              5'h10: out_low = 10'h069;
              5'h11: out_low = 10'h06a;
              5'h12: out_low = 10'h06a;
              5'h13: out_low = 10'h06b;
              5'h14: out_low = 10'h06c;
              5'h15: out_low = 10'h06d;
              5'h16: out_low = 10'h06d;
              5'h17: out_low = 10'h06e;
              5'h18: out_low = 10'h06f;
              5'h19: out_low = 10'h070;
              5'h1a: out_low = 10'h071;
              5'h1b: out_low = 10'h071;
              5'h1c: out_low = 10'h072;
              5'h1d: out_low = 10'h073;
              5'h1e: out_low = 10'h074;
              5'h1f: out_low = 10'h074;
              default: out_low = 10'h000;
            endcase
          end
          5'h05: begin
            case (mant[4:0])
              5'h00: out_low = 10'h075;
              5'h01: out_low = 10'h076;
              5'h02: out_low = 10'h077;
              5'h03: out_low = 10'h077;
              5'h04: out_low = 10'h078;
              5'h05: out_low = 10'h079;
              5'h06: out_low = 10'h07a;
              5'h07: out_low = 10'h07b;
              5'h08: out_low = 10'h07b;
              5'h09: out_low = 10'h07c;
              5'h0a: out_low = 10'h07d;
              5'h0b: out_low = 10'h07e;
              5'h0c: out_low = 10'h07e;
              5'h0d: out_low = 10'h07f;
              5'h0e: out_low = 10'h080;
              5'h0f: out_low = 10'h081;
              5'h10: out_low = 10'h082;
              5'h11: out_low = 10'h082;
              5'h12: out_low = 10'h083;
              5'h13: out_low = 10'h084;
              5'h14: out_low = 10'h085;
              5'h15: out_low = 10'h085;
              5'h16: out_low = 10'h086;
              5'h17: out_low = 10'h087;
              5'h18: out_low = 10'h088;
              5'h19: out_low = 10'h089;
              5'h1a: out_low = 10'h089;
              5'h1b: out_low = 10'h08a;
              5'h1c: out_low = 10'h08b;
              5'h1d: out_low = 10'h08c;
              5'h1e: out_low = 10'h08d;
              5'h1f: out_low = 10'h08d;
              default: out_low = 10'h000;
            endcase
          end
          5'h06: begin
            case (mant[4:0])
              5'h00: out_low = 10'h08e;
              5'h01: out_low = 10'h08f;
              5'h02: out_low = 10'h090;
              5'h03: out_low = 10'h090;
              5'h04: out_low = 10'h091;
              5'h05: out_low = 10'h092;
              5'h06: out_low = 10'h093;
              5'h07: out_low = 10'h094;
              5'h08: out_low = 10'h094;
              5'h09: out_low = 10'h095;
              5'h0a: out_low = 10'h096;
              5'h0b: out_low = 10'h097;
              5'h0c: out_low = 10'h098;
              5'h0d: out_low = 10'h098;
              5'h0e: out_low = 10'h099;
              5'h0f: out_low = 10'h09a;
              5'h10: out_low = 10'h09b;
              5'h11: out_low = 10'h09c;
              5'h12: out_low = 10'h09c;
              5'h13: out_low = 10'h09d;
              5'h14: out_low = 10'h09e;
              5'h15: out_low = 10'h09f;
              5'h16: out_low = 10'h0a0;
              5'h17: out_low = 10'h0a0;
              5'h18: out_low = 10'h0a1;
              5'h19: out_low = 10'h0a2;
              5'h1a: out_low = 10'h0a3;
              5'h1b: out_low = 10'h0a4;
              5'h1c: out_low = 10'h0a4;
              5'h1d: out_low = 10'h0a5;
              5'h1e: out_low = 10'h0a6;
              5'h1f: out_low = 10'h0a7;
              default: out_low = 10'h000;
            endcase
          end
          5'h07: begin
            case (mant[4:0])
              5'h00: out_low = 10'h0a8;
              5'h01: out_low = 10'h0a8;
              5'h02: out_low = 10'h0a9;
              5'h03: out_low = 10'h0aa;
              5'h04: out_low = 10'h0ab;
              5'h05: out_low = 10'h0ac;
              5'h06: out_low = 10'h0ad;
              5'h07: out_low = 10'h0ad;
              5'h08: out_low = 10'h0ae;
              5'h09: out_low = 10'h0af;
              5'h0a: out_low = 10'h0b0;
              5'h0b: out_low = 10'h0b1;
              5'h0c: out_low = 10'h0b1;
              5'h0d: out_low = 10'h0b2;
              5'h0e: out_low = 10'h0b3;
              5'h0f: out_low = 10'h0b4;
              5'h10: out_low = 10'h0b5;
              5'h11: out_low = 10'h0b5;
              5'h12: out_low = 10'h0b6;
              5'h13: out_low = 10'h0b7;
              5'h14: out_low = 10'h0b8;
              5'h15: out_low = 10'h0b9;
              5'h16: out_low = 10'h0ba;
              5'h17: out_low = 10'h0ba;
              5'h18: out_low = 10'h0bb;
              5'h19: out_low = 10'h0bc;
              5'h1a: out_low = 10'h0bd;
              5'h1b: out_low = 10'h0be;
              5'h1c: out_low = 10'h0be;
              5'h1d: out_low = 10'h0bf;
              5'h1e: out_low = 10'h0c0;
              5'h1f: out_low = 10'h0c1;
              default: out_low = 10'h000;
            endcase
          end
          5'h08: begin
            case (mant[4:0])
              5'h00: out_low = 10'h0c2;
              5'h01: out_low = 10'h0c3;
              5'h02: out_low = 10'h0c3;
              5'h03: out_low = 10'h0c4;
              5'h04: out_low = 10'h0c5;
              5'h05: out_low = 10'h0c6;
              5'h06: out_low = 10'h0c7;
              5'h07: out_low = 10'h0c8;
              5'h08: out_low = 10'h0c8;
              5'h09: out_low = 10'h0c9;
              5'h0a: out_low = 10'h0ca;
              5'h0b: out_low = 10'h0cb;
              5'h0c: out_low = 10'h0cc;
              5'h0d: out_low = 10'h0cd;
              5'h0e: out_low = 10'h0cd;
              5'h0f: out_low = 10'h0ce;
              5'h10: out_low = 10'h0cf;
              5'h11: out_low = 10'h0d0;
              5'h12: out_low = 10'h0d1;
              5'h13: out_low = 10'h0d2;
              5'h14: out_low = 10'h0d2;
              5'h15: out_low = 10'h0d3;
              5'h16: out_low = 10'h0d4;
              5'h17: out_low = 10'h0d5;
              5'h18: out_low = 10'h0d6;
              5'h19: out_low = 10'h0d7;
              5'h1a: out_low = 10'h0d7;
              5'h1b: out_low = 10'h0d8;
              5'h1c: out_low = 10'h0d9;
              5'h1d: out_low = 10'h0da;
              5'h1e: out_low = 10'h0db;
              5'h1f: out_low = 10'h0dc;
              default: out_low = 10'h000;
            endcase
          end
          5'h09: begin
            case (mant[4:0])
              5'h00: out_low = 10'h0dc;
              5'h01: out_low = 10'h0dd;
              5'h02: out_low = 10'h0de;
              5'h03: out_low = 10'h0df;
              5'h04: out_low = 10'h0e0;
              5'h05: out_low = 10'h0e1;
              5'h06: out_low = 10'h0e1;
              5'h07: out_low = 10'h0e2;
              5'h08: out_low = 10'h0e3;
              5'h09: out_low = 10'h0e4;
              5'h0a: out_low = 10'h0e5;
              5'h0b: out_low = 10'h0e6;
              5'h0c: out_low = 10'h0e7;
              5'h0d: out_low = 10'h0e7;
              5'h0e: out_low = 10'h0e8;
              5'h0f: out_low = 10'h0e9;
              5'h10: out_low = 10'h0ea;
              5'h11: out_low = 10'h0eb;
              5'h12: out_low = 10'h0ec;
              5'h13: out_low = 10'h0ed;
              5'h14: out_low = 10'h0ed;
              5'h15: out_low = 10'h0ee;
              5'h16: out_low = 10'h0ef;
              5'h17: out_low = 10'h0f0;
              5'h18: out_low = 10'h0f1;
              5'h19: out_low = 10'h0f2;
              5'h1a: out_low = 10'h0f3;
              5'h1b: out_low = 10'h0f3;
              5'h1c: out_low = 10'h0f4;
              5'h1d: out_low = 10'h0f5;
              5'h1e: out_low = 10'h0f6;
              5'h1f: out_low = 10'h0f7;
              default: out_low = 10'h000;
            endcase
          end
          5'h0a: begin
            case (mant[4:0])
              5'h00: out_low = 10'h0f8;
              5'h01: out_low = 10'h0f9;
              5'h02: out_low = 10'h0f9;
              5'h03: out_low = 10'h0fa;
              5'h04: out_low = 10'h0fb;
              5'h05: out_low = 10'h0fc;
              5'h06: out_low = 10'h0fd;
              5'h07: out_low = 10'h0fe;
              5'h08: out_low = 10'h0ff;
              5'h09: out_low = 10'h0ff;
              5'h0a: out_low = 10'h100;
              5'h0b: out_low = 10'h101;
              5'h0c: out_low = 10'h102;
              5'h0d: out_low = 10'h103;
              5'h0e: out_low = 10'h104;
              5'h0f: out_low = 10'h105;
              5'h10: out_low = 10'h106;
              5'h11: out_low = 10'h106;
              5'h12: out_low = 10'h107;
              5'h13: out_low = 10'h108;
              5'h14: out_low = 10'h109;
              5'h15: out_low = 10'h10a;
              5'h16: out_low = 10'h10b;
              5'h17: out_low = 10'h10c;
              5'h18: out_low = 10'h10c;
              5'h19: out_low = 10'h10d;
              5'h1a: out_low = 10'h10e;
              5'h1b: out_low = 10'h10f;
              5'h1c: out_low = 10'h110;
              5'h1d: out_low = 10'h111;
              5'h1e: out_low = 10'h112;
              5'h1f: out_low = 10'h113;
              default: out_low = 10'h000;
            endcase
          end
          5'h0b: begin
            case (mant[4:0])
              5'h00: out_low = 10'h114;
              5'h01: out_low = 10'h114;
              5'h02: out_low = 10'h115;
              5'h03: out_low = 10'h116;
              5'h04: out_low = 10'h117;
              5'h05: out_low = 10'h118;
              5'h06: out_low = 10'h119;
              5'h07: out_low = 10'h11a;
              5'h08: out_low = 10'h11b;
              5'h09: out_low = 10'h11b;
              5'h0a: out_low = 10'h11c;
              5'h0b: out_low = 10'h11d;
              5'h0c: out_low = 10'h11e;
              5'h0d: out_low = 10'h11f;
              5'h0e: out_low = 10'h120;
              5'h0f: out_low = 10'h121;
              5'h10: out_low = 10'h122;
              5'h11: out_low = 10'h123;
              5'h12: out_low = 10'h123;
              5'h13: out_low = 10'h124;
              5'h14: out_low = 10'h125;
              5'h15: out_low = 10'h126;
              5'h16: out_low = 10'h127;
              5'h17: out_low = 10'h128;
              5'h18: out_low = 10'h129;
              5'h19: out_low = 10'h12a;
              5'h1a: out_low = 10'h12b;
              5'h1b: out_low = 10'h12b;
              5'h1c: out_low = 10'h12c;
              5'h1d: out_low = 10'h12d;
              5'h1e: out_low = 10'h12e;
              5'h1f: out_low = 10'h12f;
              default: out_low = 10'h000;
            endcase
          end
          5'h0c: begin
            case (mant[4:0])
              5'h00: out_low = 10'h130;
              5'h01: out_low = 10'h131;
              5'h02: out_low = 10'h132;
              5'h03: out_low = 10'h133;
              5'h04: out_low = 10'h134;
              5'h05: out_low = 10'h134;
              5'h06: out_low = 10'h135;
              5'h07: out_low = 10'h136;
              5'h08: out_low = 10'h137;
              5'h09: out_low = 10'h138;
              5'h0a: out_low = 10'h139;
              5'h0b: out_low = 10'h13a;
              5'h0c: out_low = 10'h13b;
              5'h0d: out_low = 10'h13c;
              5'h0e: out_low = 10'h13d;
              5'h0f: out_low = 10'h13e;
              5'h10: out_low = 10'h13e;
              5'h11: out_low = 10'h13f;
              5'h12: out_low = 10'h140;
              5'h13: out_low = 10'h141;
              5'h14: out_low = 10'h142;
              5'h15: out_low = 10'h143;
              5'h16: out_low = 10'h144;
              5'h17: out_low = 10'h145;
              5'h18: out_low = 10'h146;
              5'h19: out_low = 10'h147;
              5'h1a: out_low = 10'h148;
              5'h1b: out_low = 10'h148;
              5'h1c: out_low = 10'h149;
              5'h1d: out_low = 10'h14a;
              5'h1e: out_low = 10'h14b;
              5'h1f: out_low = 10'h14c;
              default: out_low = 10'h000;
            endcase
          end
          5'h0d: begin
            case (mant[4:0])
              5'h00: out_low = 10'h14d;
              5'h01: out_low = 10'h14e;
              5'h02: out_low = 10'h14f;
              5'h03: out_low = 10'h150;
              5'h04: out_low = 10'h151;
              5'h05: out_low = 10'h152;
              5'h06: out_low = 10'h153;
              5'h07: out_low = 10'h153;
              5'h08: out_low = 10'h154;
              5'h09: out_low = 10'h155;
              5'h0a: out_low = 10'h156;
              5'h0b: out_low = 10'h157;
              5'h0c: out_low = 10'h158;
              5'h0d: out_low = 10'h159;
              5'h0e: out_low = 10'h15a;
              5'h0f: out_low = 10'h15b;
              5'h10: out_low = 10'h15c;
              5'h11: out_low = 10'h15d;
              5'h12: out_low = 10'h15e;
              5'h13: out_low = 10'h15f;
              5'h14: out_low = 10'h160;
              5'h15: out_low = 10'h160;
              5'h16: out_low = 10'h161;
              5'h17: out_low = 10'h162;
              5'h18: out_low = 10'h163;
              5'h19: out_low = 10'h164;
              5'h1a: out_low = 10'h165;
              5'h1b: out_low = 10'h166;
              5'h1c: out_low = 10'h167;
              5'h1d: out_low = 10'h168;
              5'h1e: out_low = 10'h169;
              5'h1f: out_low = 10'h16a;
              default: out_low = 10'h000;
            endcase
          end
          5'h0e: begin
            case (mant[4:0])
              5'h00: out_low = 10'h16b;
              5'h01: out_low = 10'h16c;
              5'h02: out_low = 10'h16d;
              5'h03: out_low = 10'h16e;
              5'h04: out_low = 10'h16f;
              5'h05: out_low = 10'h16f;
              5'h06: out_low = 10'h170;
              5'h07: out_low = 10'h171;
              5'h08: out_low = 10'h172;
              5'h09: out_low = 10'h173;
              5'h0a: out_low = 10'h174;
              5'h0b: out_low = 10'h175;
              5'h0c: out_low = 10'h176;
              5'h0d: out_low = 10'h177;
              5'h0e: out_low = 10'h178;
              5'h0f: out_low = 10'h179;
              5'h10: out_low = 10'h17a;
              5'h11: out_low = 10'h17b;
              5'h12: out_low = 10'h17c;
              5'h13: out_low = 10'h17d;
              5'h14: out_low = 10'h17e;
              5'h15: out_low = 10'h17f;
              5'h16: out_low = 10'h180;
              5'h17: out_low = 10'h181;
              5'h18: out_low = 10'h181;
              5'h19: out_low = 10'h182;
              5'h1a: out_low = 10'h183;
              5'h1b: out_low = 10'h184;
              5'h1c: out_low = 10'h185;
              5'h1d: out_low = 10'h186;
              5'h1e: out_low = 10'h187;
              5'h1f: out_low = 10'h188;
              default: out_low = 10'h000;
            endcase
          end
          5'h0f: begin
            case (mant[4:0])
              5'h00: out_low = 10'h189;
              5'h01: out_low = 10'h18a;
              5'h02: out_low = 10'h18b;
              5'h03: out_low = 10'h18c;
              5'h04: out_low = 10'h18d;
              5'h05: out_low = 10'h18e;
              5'h06: out_low = 10'h18f;
              5'h07: out_low = 10'h190;
              5'h08: out_low = 10'h191;
              5'h09: out_low = 10'h192;
              5'h0a: out_low = 10'h193;
              5'h0b: out_low = 10'h194;
              5'h0c: out_low = 10'h195;
              5'h0d: out_low = 10'h196;
              5'h0e: out_low = 10'h197;
              5'h0f: out_low = 10'h198;
              5'h10: out_low = 10'h199;
              5'h11: out_low = 10'h19a;
              5'h12: out_low = 10'h19a;
              5'h13: out_low = 10'h19b;
              5'h14: out_low = 10'h19c;
              5'h15: out_low = 10'h19d;
              5'h16: out_low = 10'h19e;
              5'h17: out_low = 10'h19f;
              5'h18: out_low = 10'h1a0;
              5'h19: out_low = 10'h1a1;
              5'h1a: out_low = 10'h1a2;
              5'h1b: out_low = 10'h1a3;
              5'h1c: out_low = 10'h1a4;
              5'h1d: out_low = 10'h1a5;
              5'h1e: out_low = 10'h1a6;
              5'h1f: out_low = 10'h1a7;
              default: out_low = 10'h000;
            endcase
          end
          5'h10: begin
            case (mant[4:0])
              5'h00: out_low = 10'h1a8;
              5'h01: out_low = 10'h1a9;
              5'h02: out_low = 10'h1aa;
              5'h03: out_low = 10'h1ab;
              5'h04: out_low = 10'h1ac;
              5'h05: out_low = 10'h1ad;
              5'h06: out_low = 10'h1ae;
              5'h07: out_low = 10'h1af;
              5'h08: out_low = 10'h1b0;
              5'h09: out_low = 10'h1b1;
              5'h0a: out_low = 10'h1b2;
              5'h0b: out_low = 10'h1b3;
              5'h0c: out_low = 10'h1b4;
              5'h0d: out_low = 10'h1b5;
              5'h0e: out_low = 10'h1b6;
              5'h0f: out_low = 10'h1b7;
              5'h10: out_low = 10'h1b8;
              5'h11: out_low = 10'h1b9;
              5'h12: out_low = 10'h1ba;
              5'h13: out_low = 10'h1bb;
              5'h14: out_low = 10'h1bc;
              5'h15: out_low = 10'h1bd;
              5'h16: out_low = 10'h1be;
              5'h17: out_low = 10'h1bf;
              5'h18: out_low = 10'h1c0;
              5'h19: out_low = 10'h1c1;
              5'h1a: out_low = 10'h1c2;
              5'h1b: out_low = 10'h1c3;
              5'h1c: out_low = 10'h1c4;
              5'h1d: out_low = 10'h1c5;
              5'h1e: out_low = 10'h1c6;
              5'h1f: out_low = 10'h1c7;
              default: out_low = 10'h000;
            endcase
          end
          5'h11: begin
            case (mant[4:0])
              5'h00: out_low = 10'h1c8;
              5'h01: out_low = 10'h1c9;
              5'h02: out_low = 10'h1ca;
              5'h03: out_low = 10'h1cb;
              5'h04: out_low = 10'h1cc;
              5'h05: out_low = 10'h1cd;
              5'h06: out_low = 10'h1ce;
              5'h07: out_low = 10'h1cf;
              5'h08: out_low = 10'h1d0;
              5'h09: out_low = 10'h1d1;
              5'h0a: out_low = 10'h1d2;
              5'h0b: out_low = 10'h1d3;
              5'h0c: out_low = 10'h1d4;
              5'h0d: out_low = 10'h1d5;
              5'h0e: out_low = 10'h1d6;
              5'h0f: out_low = 10'h1d7;
              5'h10: out_low = 10'h1d8;
              5'h11: out_low = 10'h1d9;
              5'h12: out_low = 10'h1da;
              5'h13: out_low = 10'h1db;
              5'h14: out_low = 10'h1dc;
              5'h15: out_low = 10'h1dd;
              5'h16: out_low = 10'h1de;
              5'h17: out_low = 10'h1df;
              5'h18: out_low = 10'h1e0;
              5'h19: out_low = 10'h1e1;
              5'h1a: out_low = 10'h1e2;
              5'h1b: out_low = 10'h1e3;
              5'h1c: out_low = 10'h1e4;
              5'h1d: out_low = 10'h1e5;
              5'h1e: out_low = 10'h1e6;
              5'h1f: out_low = 10'h1e7;
              default: out_low = 10'h000;
            endcase
          end
          5'h12: begin
            case (mant[4:0])
              5'h00: out_low = 10'h1e8;
              5'h01: out_low = 10'h1e9;
              5'h02: out_low = 10'h1ea;
              5'h03: out_low = 10'h1eb;
              5'h04: out_low = 10'h1ec;
              5'h05: out_low = 10'h1ed;
              5'h06: out_low = 10'h1ee;
              5'h07: out_low = 10'h1ef;
              5'h08: out_low = 10'h1f0;
              5'h09: out_low = 10'h1f2;
              5'h0a: out_low = 10'h1f3;
              5'h0b: out_low = 10'h1f4;
              5'h0c: out_low = 10'h1f5;
              5'h0d: out_low = 10'h1f6;
              5'h0e: out_low = 10'h1f7;
              5'h0f: out_low = 10'h1f8;
              5'h10: out_low = 10'h1f9;
              5'h11: out_low = 10'h1fa;
              5'h12: out_low = 10'h1fb;
              5'h13: out_low = 10'h1fc;
              5'h14: out_low = 10'h1fd;
              5'h15: out_low = 10'h1fe;
              5'h16: out_low = 10'h1ff;
              5'h17: out_low = 10'h200;
              5'h18: out_low = 10'h201;
              5'h19: out_low = 10'h202;
              5'h1a: out_low = 10'h203;
              5'h1b: out_low = 10'h204;
              5'h1c: out_low = 10'h205;
              5'h1d: out_low = 10'h206;
              5'h1e: out_low = 10'h207;
              5'h1f: out_low = 10'h208;
              default: out_low = 10'h000;
            endcase
          end
          5'h13: begin
            case (mant[4:0])
              5'h00: out_low = 10'h209;
              5'h01: out_low = 10'h20a;
              5'h02: out_low = 10'h20b;
              5'h03: out_low = 10'h20d;
              5'h04: out_low = 10'h20e;
              5'h05: out_low = 10'h20f;
              5'h06: out_low = 10'h210;
              5'h07: out_low = 10'h211;
              5'h08: out_low = 10'h212;
              5'h09: out_low = 10'h213;
              5'h0a: out_low = 10'h214;
              5'h0b: out_low = 10'h215;
              5'h0c: out_low = 10'h216;
              5'h0d: out_low = 10'h217;
              5'h0e: out_low = 10'h218;
              5'h0f: out_low = 10'h219;
              5'h10: out_low = 10'h21a;
              5'h11: out_low = 10'h21b;
              5'h12: out_low = 10'h21c;
              5'h13: out_low = 10'h21d;
              5'h14: out_low = 10'h21e;
              5'h15: out_low = 10'h220;
              5'h16: out_low = 10'h221;
              5'h17: out_low = 10'h222;
              5'h18: out_low = 10'h223;
              5'h19: out_low = 10'h224;
              5'h1a: out_low = 10'h225;
              5'h1b: out_low = 10'h226;
              5'h1c: out_low = 10'h227;
              5'h1d: out_low = 10'h228;
              5'h1e: out_low = 10'h229;
              5'h1f: out_low = 10'h22a;
              default: out_low = 10'h000;
            endcase
          end
          5'h14: begin
            case (mant[4:0])
              5'h00: out_low = 10'h22b;
              5'h01: out_low = 10'h22c;
              5'h02: out_low = 10'h22d;
              5'h03: out_low = 10'h22e;
              5'h04: out_low = 10'h230;
              5'h05: out_low = 10'h231;
              5'h06: out_low = 10'h232;
              5'h07: out_low = 10'h233;
              5'h08: out_low = 10'h234;
              5'h09: out_low = 10'h235;
              5'h0a: out_low = 10'h236;
              5'h0b: out_low = 10'h237;
              5'h0c: out_low = 10'h238;
              5'h0d: out_low = 10'h239;
              5'h0e: out_low = 10'h23a;
              5'h0f: out_low = 10'h23b;
              5'h10: out_low = 10'h23c;
              5'h11: out_low = 10'h23e;
              5'h12: out_low = 10'h23f;
              5'h13: out_low = 10'h240;
              5'h14: out_low = 10'h241;
              5'h15: out_low = 10'h242;
              5'h16: out_low = 10'h243;
              5'h17: out_low = 10'h244;
              5'h18: out_low = 10'h245;
              5'h19: out_low = 10'h246;
              5'h1a: out_low = 10'h247;
              5'h1b: out_low = 10'h248;
              5'h1c: out_low = 10'h249;
              5'h1d: out_low = 10'h24b;
              5'h1e: out_low = 10'h24c;
              5'h1f: out_low = 10'h24d;
              default: out_low = 10'h000;
            endcase
          end
          5'h15: begin
            case (mant[4:0])
              5'h00: out_low = 10'h24e;
              5'h01: out_low = 10'h24f;
              5'h02: out_low = 10'h250;
              5'h03: out_low = 10'h251;
              5'h04: out_low = 10'h252;
              5'h05: out_low = 10'h253;
              5'h06: out_low = 10'h254;
              5'h07: out_low = 10'h255;
              5'h08: out_low = 10'h257;
              5'h09: out_low = 10'h258;
              5'h0a: out_low = 10'h259;
              5'h0b: out_low = 10'h25a;
              5'h0c: out_low = 10'h25b;
              5'h0d: out_low = 10'h25c;
              5'h0e: out_low = 10'h25d;
              5'h0f: out_low = 10'h25e;
              5'h10: out_low = 10'h25f;
              5'h11: out_low = 10'h260;
              5'h12: out_low = 10'h262;
              5'h13: out_low = 10'h263;
              5'h14: out_low = 10'h264;
              5'h15: out_low = 10'h265;
              5'h16: out_low = 10'h266;
              5'h17: out_low = 10'h267;
              5'h18: out_low = 10'h268;
              5'h19: out_low = 10'h269;
              5'h1a: out_low = 10'h26a;
              5'h1b: out_low = 10'h26c;
              5'h1c: out_low = 10'h26d;
              5'h1d: out_low = 10'h26e;
              5'h1e: out_low = 10'h26f;
              5'h1f: out_low = 10'h270;
              default: out_low = 10'h000;
            endcase
          end
          5'h16: begin
            case (mant[4:0])
              5'h00: out_low = 10'h271;
              5'h01: out_low = 10'h272;
              5'h02: out_low = 10'h273;
              5'h03: out_low = 10'h274;
              5'h04: out_low = 10'h276;
              5'h05: out_low = 10'h277;
              5'h06: out_low = 10'h278;
              5'h07: out_low = 10'h279;
              5'h08: out_low = 10'h27a;
              5'h09: out_low = 10'h27b;
              5'h0a: out_low = 10'h27c;
              5'h0b: out_low = 10'h27d;
              5'h0c: out_low = 10'h27f;
              5'h0d: out_low = 10'h280;
              5'h0e: out_low = 10'h281;
              5'h0f: out_low = 10'h282;
              5'h10: out_low = 10'h283;
              5'h11: out_low = 10'h284;
              5'h12: out_low = 10'h285;
              5'h13: out_low = 10'h286;
              5'h14: out_low = 10'h288;
              5'h15: out_low = 10'h289;
              5'h16: out_low = 10'h28a;
              5'h17: out_low = 10'h28b;
              5'h18: out_low = 10'h28c;
              5'h19: out_low = 10'h28d;
              5'h1a: out_low = 10'h28e;
              5'h1b: out_low = 10'h290;
              5'h1c: out_low = 10'h291;
              5'h1d: out_low = 10'h292;
              5'h1e: out_low = 10'h293;
              5'h1f: out_low = 10'h294;
              default: out_low = 10'h000;
            endcase
          end
          5'h17: begin
            case (mant[4:0])
              5'h00: out_low = 10'h295;
              5'h01: out_low = 10'h296;
              5'h02: out_low = 10'h298;
              5'h03: out_low = 10'h299;
              5'h04: out_low = 10'h29a;
              5'h05: out_low = 10'h29b;
              5'h06: out_low = 10'h29c;
              5'h07: out_low = 10'h29d;
              5'h08: out_low = 10'h29e;
              5'h09: out_low = 10'h2a0;
              5'h0a: out_low = 10'h2a1;
              5'h0b: out_low = 10'h2a2;
              5'h0c: out_low = 10'h2a3;
              5'h0d: out_low = 10'h2a4;
              5'h0e: out_low = 10'h2a5;
              5'h0f: out_low = 10'h2a6;
              5'h10: out_low = 10'h2a8;
              5'h11: out_low = 10'h2a9;
              5'h12: out_low = 10'h2aa;
              5'h13: out_low = 10'h2ab;
              5'h14: out_low = 10'h2ac;
              5'h15: out_low = 10'h2ad;
              5'h16: out_low = 10'h2af;
              5'h17: out_low = 10'h2b0;
              5'h18: out_low = 10'h2b1;
              5'h19: out_low = 10'h2b2;
              5'h1a: out_low = 10'h2b3;
              5'h1b: out_low = 10'h2b4;
              5'h1c: out_low = 10'h2b5;
              5'h1d: out_low = 10'h2b7;
              5'h1e: out_low = 10'h2b8;
              5'h1f: out_low = 10'h2b9;
              default: out_low = 10'h000;
            endcase
          end
          5'h18: begin
            case (mant[4:0])
              5'h00: out_low = 10'h2ba;
              5'h01: out_low = 10'h2bb;
              5'h02: out_low = 10'h2bc;
              5'h03: out_low = 10'h2be;
              5'h04: out_low = 10'h2bf;
              5'h05: out_low = 10'h2c0;
              5'h06: out_low = 10'h2c1;
              5'h07: out_low = 10'h2c2;
              5'h08: out_low = 10'h2c4;
              5'h09: out_low = 10'h2c5;
              5'h0a: out_low = 10'h2c6;
              5'h0b: out_low = 10'h2c7;
              5'h0c: out_low = 10'h2c8;
              5'h0d: out_low = 10'h2c9;
              5'h0e: out_low = 10'h2cb;
              5'h0f: out_low = 10'h2cc;
              5'h10: out_low = 10'h2cd;
              5'h11: out_low = 10'h2ce;
              5'h12: out_low = 10'h2cf;
              5'h13: out_low = 10'h2d0;
              5'h14: out_low = 10'h2d2;
              5'h15: out_low = 10'h2d3;
              5'h16: out_low = 10'h2d4;
              5'h17: out_low = 10'h2d5;
              5'h18: out_low = 10'h2d6;
              5'h19: out_low = 10'h2d8;
              5'h1a: out_low = 10'h2d9;
              5'h1b: out_low = 10'h2da;
              5'h1c: out_low = 10'h2db;
              5'h1d: out_low = 10'h2dc;
              5'h1e: out_low = 10'h2dd;
              5'h1f: out_low = 10'h2df;
              default: out_low = 10'h000;
            endcase
          end
          5'h19: begin
            case (mant[4:0])
              5'h00: out_low = 10'h2e0;
              5'h01: out_low = 10'h2e1;
              5'h02: out_low = 10'h2e2;
              5'h03: out_low = 10'h2e3;
              5'h04: out_low = 10'h2e5;
              5'h05: out_low = 10'h2e6;
              5'h06: out_low = 10'h2e7;
              5'h07: out_low = 10'h2e8;
              5'h08: out_low = 10'h2e9;
              5'h09: out_low = 10'h2eb;
              5'h0a: out_low = 10'h2ec;
              5'h0b: out_low = 10'h2ed;
              5'h0c: out_low = 10'h2ee;
              5'h0d: out_low = 10'h2ef;
              5'h0e: out_low = 10'h2f1;
              5'h0f: out_low = 10'h2f2;
              5'h10: out_low = 10'h2f3;
              5'h11: out_low = 10'h2f4;
              5'h12: out_low = 10'h2f5;
              5'h13: out_low = 10'h2f7;
              5'h14: out_low = 10'h2f8;
              5'h15: out_low = 10'h2f9;
              5'h16: out_low = 10'h2fa;
              5'h17: out_low = 10'h2fb;
              5'h18: out_low = 10'h2fd;
              5'h19: out_low = 10'h2fe;
              5'h1a: out_low = 10'h2ff;
              5'h1b: out_low = 10'h300;
              5'h1c: out_low = 10'h302;
              5'h1d: out_low = 10'h303;
              5'h1e: out_low = 10'h304;
              5'h1f: out_low = 10'h305;
              default: out_low = 10'h000;
            endcase
          end
          5'h1a: begin
            case (mant[4:0])
              5'h00: out_low = 10'h306;
              5'h01: out_low = 10'h308;
              5'h02: out_low = 10'h309;
              5'h03: out_low = 10'h30a;
              5'h04: out_low = 10'h30b;
              5'h05: out_low = 10'h30c;
              5'h06: out_low = 10'h30e;
              5'h07: out_low = 10'h30f;
              5'h08: out_low = 10'h310;
              5'h09: out_low = 10'h311;
              5'h0a: out_low = 10'h313;
              5'h0b: out_low = 10'h314;
              5'h0c: out_low = 10'h315;
              5'h0d: out_low = 10'h316;
              5'h0e: out_low = 10'h318;
              5'h0f: out_low = 10'h319;
              5'h10: out_low = 10'h31a;
              5'h11: out_low = 10'h31b;
              5'h12: out_low = 10'h31c;
              5'h13: out_low = 10'h31e;
              5'h14: out_low = 10'h31f;
              5'h15: out_low = 10'h320;
              5'h16: out_low = 10'h321;
              5'h17: out_low = 10'h323;
              5'h18: out_low = 10'h324;
              5'h19: out_low = 10'h325;
              5'h1a: out_low = 10'h326;
              5'h1b: out_low = 10'h328;
              5'h1c: out_low = 10'h329;
              5'h1d: out_low = 10'h32a;
              5'h1e: out_low = 10'h32b;
              5'h1f: out_low = 10'h32d;
              default: out_low = 10'h000;
            endcase
          end
          5'h1b: begin
            case (mant[4:0])
              5'h00: out_low = 10'h32e;
              5'h01: out_low = 10'h32f;
              5'h02: out_low = 10'h330;
              5'h03: out_low = 10'h332;
              5'h04: out_low = 10'h333;
              5'h05: out_low = 10'h334;
              5'h06: out_low = 10'h335;
              5'h07: out_low = 10'h337;
              5'h08: out_low = 10'h338;
              5'h09: out_low = 10'h339;
              5'h0a: out_low = 10'h33a;
              5'h0b: out_low = 10'h33c;
              5'h0c: out_low = 10'h33d;
              5'h0d: out_low = 10'h33e;
              5'h0e: out_low = 10'h33f;
              5'h0f: out_low = 10'h341;
              5'h10: out_low = 10'h342;
              5'h11: out_low = 10'h343;
              5'h12: out_low = 10'h344;
              5'h13: out_low = 10'h346;
              5'h14: out_low = 10'h347;
              5'h15: out_low = 10'h348;
              5'h16: out_low = 10'h349;
              5'h17: out_low = 10'h34b;
              5'h18: out_low = 10'h34c;
              5'h19: out_low = 10'h34d;
              5'h1a: out_low = 10'h34e;
              5'h1b: out_low = 10'h350;
              5'h1c: out_low = 10'h351;
              5'h1d: out_low = 10'h352;
              5'h1e: out_low = 10'h353;
              5'h1f: out_low = 10'h355;
              default: out_low = 10'h000;
            endcase
          end
          5'h1c: begin
            case (mant[4:0])
              5'h00: out_low = 10'h356;
              5'h01: out_low = 10'h357;
              5'h02: out_low = 10'h359;
              5'h03: out_low = 10'h35a;
              5'h04: out_low = 10'h35b;
              5'h05: out_low = 10'h35c;
              5'h06: out_low = 10'h35e;
              5'h07: out_low = 10'h35f;
              5'h08: out_low = 10'h360;
              5'h09: out_low = 10'h362;
              5'h0a: out_low = 10'h363;
              5'h0b: out_low = 10'h364;
              5'h0c: out_low = 10'h365;
              5'h0d: out_low = 10'h367;
              5'h0e: out_low = 10'h368;
              5'h0f: out_low = 10'h369;
              5'h10: out_low = 10'h36a;
              5'h11: out_low = 10'h36c;
              5'h12: out_low = 10'h36d;
              5'h13: out_low = 10'h36e;
              5'h14: out_low = 10'h370;
              5'h15: out_low = 10'h371;
              5'h16: out_low = 10'h372;
              5'h17: out_low = 10'h373;
              5'h18: out_low = 10'h375;
              5'h19: out_low = 10'h376;
              5'h1a: out_low = 10'h377;
              5'h1b: out_low = 10'h379;
              5'h1c: out_low = 10'h37a;
              5'h1d: out_low = 10'h37b;
              5'h1e: out_low = 10'h37d;
              5'h1f: out_low = 10'h37e;
              default: out_low = 10'h000;
            endcase
          end
          5'h1d: begin
            case (mant[4:0])
              5'h00: out_low = 10'h37f;
              5'h01: out_low = 10'h380;
              5'h02: out_low = 10'h382;
              5'h03: out_low = 10'h383;
              5'h04: out_low = 10'h384;
              5'h05: out_low = 10'h386;
              5'h06: out_low = 10'h387;
              5'h07: out_low = 10'h388;
              5'h08: out_low = 10'h38a;
              5'h09: out_low = 10'h38b;
              5'h0a: out_low = 10'h38c;
              5'h0b: out_low = 10'h38d;
              5'h0c: out_low = 10'h38f;
              5'h0d: out_low = 10'h390;
              5'h0e: out_low = 10'h391;
              5'h0f: out_low = 10'h393;
              5'h10: out_low = 10'h394;
              5'h11: out_low = 10'h395;
              5'h12: out_low = 10'h397;
              5'h13: out_low = 10'h398;
              5'h14: out_low = 10'h399;
              5'h15: out_low = 10'h39b;
              5'h16: out_low = 10'h39c;
              5'h17: out_low = 10'h39d;
              5'h18: out_low = 10'h39f;
              5'h19: out_low = 10'h3a0;
              5'h1a: out_low = 10'h3a1;
              5'h1b: out_low = 10'h3a3;
              5'h1c: out_low = 10'h3a4;
              5'h1d: out_low = 10'h3a5;
              5'h1e: out_low = 10'h3a7;
              5'h1f: out_low = 10'h3a8;
              default: out_low = 10'h000;
            endcase
          end
          5'h1e: begin
            case (mant[4:0])
              5'h00: out_low = 10'h3a9;
              5'h01: out_low = 10'h3aa;
              5'h02: out_low = 10'h3ac;
              5'h03: out_low = 10'h3ad;
              5'h04: out_low = 10'h3ae;
              5'h05: out_low = 10'h3b0;
              5'h06: out_low = 10'h3b1;
              5'h07: out_low = 10'h3b2;
              5'h08: out_low = 10'h3b4;
              5'h09: out_low = 10'h3b5;
              5'h0a: out_low = 10'h3b6;
              5'h0b: out_low = 10'h3b8;
              5'h0c: out_low = 10'h3b9;
              5'h0d: out_low = 10'h3bb;
              5'h0e: out_low = 10'h3bc;
              5'h0f: out_low = 10'h3bd;
              5'h10: out_low = 10'h3bf;
              5'h11: out_low = 10'h3c0;
              5'h12: out_low = 10'h3c1;
              5'h13: out_low = 10'h3c3;
              5'h14: out_low = 10'h3c4;
              5'h15: out_low = 10'h3c5;
              5'h16: out_low = 10'h3c7;
              5'h17: out_low = 10'h3c8;
              5'h18: out_low = 10'h3c9;
              5'h19: out_low = 10'h3cb;
              5'h1a: out_low = 10'h3cc;
              5'h1b: out_low = 10'h3cd;
              5'h1c: out_low = 10'h3cf;
              5'h1d: out_low = 10'h3d0;
              5'h1e: out_low = 10'h3d1;
              5'h1f: out_low = 10'h3d3;
              default: out_low = 10'h000;
            endcase
          end
          5'h1f: begin
            case (mant[4:0])
              5'h00: out_low = 10'h3d4;
              5'h01: out_low = 10'h3d5;
              5'h02: out_low = 10'h3d7;
              5'h03: out_low = 10'h3d8;
              5'h04: out_low = 10'h3da;
              5'h05: out_low = 10'h3db;
              5'h06: out_low = 10'h3dc;
              5'h07: out_low = 10'h3de;
              5'h08: out_low = 10'h3df;
              5'h09: out_low = 10'h3e0;
              5'h0a: out_low = 10'h3e2;
              5'h0b: out_low = 10'h3e3;
              5'h0c: out_low = 10'h3e4;
              5'h0d: out_low = 10'h3e6;
              5'h0e: out_low = 10'h3e7;
              5'h0f: out_low = 10'h3e9;
              5'h10: out_low = 10'h3ea;
              5'h11: out_low = 10'h3eb;
              5'h12: out_low = 10'h3ed;
              5'h13: out_low = 10'h3ee;
              5'h14: out_low = 10'h3ef;
              5'h15: out_low = 10'h3f1;
              5'h16: out_low = 10'h3f2;
              5'h17: out_low = 10'h3f4;
              5'h18: out_low = 10'h3f5;
              5'h19: out_low = 10'h3f6;
              5'h1a: out_low = 10'h3f8;
              5'h1b: out_low = 10'h3f9;
              5'h1c: out_low = 10'h3fa;
              5'h1d: out_low = 10'h3fc;
              5'h1e: out_low = 10'h3fd;
              5'h1f: out_low = 10'h3ff;
              default: out_low = 10'h000;
            endcase
          end
          default: out_low = 10'h000;
        endcase
      end
      6'h10: begin
        case (mant[9:5])
          5'h00: begin
            case (mant[4:0])
              5'h00: out_low = 10'h000;
              5'h01: out_low = 10'h001;
              5'h02: out_low = 10'h003;
              5'h03: out_low = 10'h004;
              5'h04: out_low = 10'h006;
              5'h05: out_low = 10'h007;
              5'h06: out_low = 10'h008;
              5'h07: out_low = 10'h00a;
              5'h08: out_low = 10'h00b;
              5'h09: out_low = 10'h00d;
              5'h0a: out_low = 10'h00e;
              5'h0b: out_low = 10'h00f;
              5'h0c: out_low = 10'h011;
              5'h0d: out_low = 10'h012;
              5'h0e: out_low = 10'h014;
              5'h0f: out_low = 10'h015;
              5'h10: out_low = 10'h016;
              5'h11: out_low = 10'h018;
              5'h12: out_low = 10'h019;
              5'h13: out_low = 10'h01b;
              5'h14: out_low = 10'h01c;
              5'h15: out_low = 10'h01e;
              5'h16: out_low = 10'h01f;
              5'h17: out_low = 10'h020;
              5'h18: out_low = 10'h022;
              5'h19: out_low = 10'h023;
              5'h1a: out_low = 10'h025;
              5'h1b: out_low = 10'h026;
              5'h1c: out_low = 10'h028;
              5'h1d: out_low = 10'h029;
              5'h1e: out_low = 10'h02a;
              5'h1f: out_low = 10'h02c;
              default: out_low = 10'h000;
            endcase
          end
          5'h01: begin
            case (mant[4:0])
              5'h00: out_low = 10'h02d;
              5'h01: out_low = 10'h02f;
              5'h02: out_low = 10'h030;
              5'h03: out_low = 10'h032;
              5'h04: out_low = 10'h033;
              5'h05: out_low = 10'h035;
              5'h06: out_low = 10'h036;
              5'h07: out_low = 10'h038;
              5'h08: out_low = 10'h039;
              5'h09: out_low = 10'h03a;
              5'h0a: out_low = 10'h03c;
              5'h0b: out_low = 10'h03d;
              5'h0c: out_low = 10'h03f;
              5'h0d: out_low = 10'h040;
              5'h0e: out_low = 10'h042;
              5'h0f: out_low = 10'h043;
              5'h10: out_low = 10'h045;
              5'h11: out_low = 10'h046;
              5'h12: out_low = 10'h048;
              5'h13: out_low = 10'h049;
              5'h14: out_low = 10'h04b;
              5'h15: out_low = 10'h04c;
              5'h16: out_low = 10'h04e;
              5'h17: out_low = 10'h04f;
              5'h18: out_low = 10'h051;
              5'h19: out_low = 10'h052;
              5'h1a: out_low = 10'h054;
              5'h1b: out_low = 10'h055;
              5'h1c: out_low = 10'h057;
              5'h1d: out_low = 10'h058;
              5'h1e: out_low = 10'h05a;
              5'h1f: out_low = 10'h05b;
              default: out_low = 10'h000;
            endcase
          end
          5'h02: begin
            case (mant[4:0])
              5'h00: out_low = 10'h05d;
              5'h01: out_low = 10'h05e;
              5'h02: out_low = 10'h060;
              5'h03: out_low = 10'h061;
              5'h04: out_low = 10'h063;
              5'h05: out_low = 10'h064;
              5'h06: out_low = 10'h066;
              5'h07: out_low = 10'h067;
              5'h08: out_low = 10'h069;
              5'h09: out_low = 10'h06a;
              5'h0a: out_low = 10'h06c;
              5'h0b: out_low = 10'h06d;
              5'h0c: out_low = 10'h06f;
              5'h0d: out_low = 10'h071;
              5'h0e: out_low = 10'h072;
              5'h0f: out_low = 10'h074;
              5'h10: out_low = 10'h075;
              5'h11: out_low = 10'h077;
              5'h12: out_low = 10'h078;
              5'h13: out_low = 10'h07a;
              5'h14: out_low = 10'h07b;
              5'h15: out_low = 10'h07d;
              5'h16: out_low = 10'h07e;
              5'h17: out_low = 10'h080;
              5'h18: out_low = 10'h082;
              5'h19: out_low = 10'h083;
              5'h1a: out_low = 10'h085;
              5'h1b: out_low = 10'h086;
              5'h1c: out_low = 10'h088;
              5'h1d: out_low = 10'h089;
              5'h1e: out_low = 10'h08b;
              5'h1f: out_low = 10'h08d;
              default: out_low = 10'h000;
            endcase
          end
          5'h03: begin
            case (mant[4:0])
              5'h00: out_low = 10'h08e;
              5'h01: out_low = 10'h090;
              5'h02: out_low = 10'h091;
              5'h03: out_low = 10'h093;
              5'h04: out_low = 10'h094;
              5'h05: out_low = 10'h096;
              5'h06: out_low = 10'h098;
              5'h07: out_low = 10'h099;
              5'h08: out_low = 10'h09b;
              5'h09: out_low = 10'h09c;
              5'h0a: out_low = 10'h09e;
              5'h0b: out_low = 10'h0a0;
              5'h0c: out_low = 10'h0a1;
              5'h0d: out_low = 10'h0a3;
              5'h0e: out_low = 10'h0a4;
              5'h0f: out_low = 10'h0a6;
              5'h10: out_low = 10'h0a8;
              5'h11: out_low = 10'h0a9;
              5'h12: out_low = 10'h0ab;
              5'h13: out_low = 10'h0ad;
              5'h14: out_low = 10'h0ae;
              5'h15: out_low = 10'h0b0;
              5'h16: out_low = 10'h0b1;
              5'h17: out_low = 10'h0b3;
              5'h18: out_low = 10'h0b5;
              5'h19: out_low = 10'h0b6;
              5'h1a: out_low = 10'h0b8;
              5'h1b: out_low = 10'h0ba;
              5'h1c: out_low = 10'h0bb;
              5'h1d: out_low = 10'h0bd;
              5'h1e: out_low = 10'h0be;
              5'h1f: out_low = 10'h0c0;
              default: out_low = 10'h000;
            endcase
          end
          5'h04: begin
            case (mant[4:0])
              5'h00: out_low = 10'h0c2;
              5'h01: out_low = 10'h0c3;
              5'h02: out_low = 10'h0c5;
              5'h03: out_low = 10'h0c7;
              5'h04: out_low = 10'h0c8;
              5'h05: out_low = 10'h0ca;
              5'h06: out_low = 10'h0cc;
              5'h07: out_low = 10'h0cd;
              5'h08: out_low = 10'h0cf;
              5'h09: out_low = 10'h0d1;
              5'h0a: out_low = 10'h0d2;
              5'h0b: out_low = 10'h0d4;
              5'h0c: out_low = 10'h0d6;
              5'h0d: out_low = 10'h0d7;
              5'h0e: out_low = 10'h0d9;
              5'h0f: out_low = 10'h0db;
              5'h10: out_low = 10'h0dc;
              5'h11: out_low = 10'h0de;
              5'h12: out_low = 10'h0e0;
              5'h13: out_low = 10'h0e1;
              5'h14: out_low = 10'h0e3;
              5'h15: out_low = 10'h0e5;
              5'h16: out_low = 10'h0e7;
              5'h17: out_low = 10'h0e8;
              5'h18: out_low = 10'h0ea;
              5'h19: out_low = 10'h0ec;
              5'h1a: out_low = 10'h0ed;
              5'h1b: out_low = 10'h0ef;
              5'h1c: out_low = 10'h0f1;
              5'h1d: out_low = 10'h0f3;
              5'h1e: out_low = 10'h0f4;
              5'h1f: out_low = 10'h0f6;
              default: out_low = 10'h000;
            endcase
          end
          5'h05: begin
            case (mant[4:0])
              5'h00: out_low = 10'h0f8;
              5'h01: out_low = 10'h0f9;
              5'h02: out_low = 10'h0fb;
              5'h03: out_low = 10'h0fd;
              5'h04: out_low = 10'h0ff;
              5'h05: out_low = 10'h100;
              5'h06: out_low = 10'h102;
              5'h07: out_low = 10'h104;
              5'h08: out_low = 10'h106;
              5'h09: out_low = 10'h107;
              5'h0a: out_low = 10'h109;
              5'h0b: out_low = 10'h10b;
              5'h0c: out_low = 10'h10c;
              5'h0d: out_low = 10'h10e;
              5'h0e: out_low = 10'h110;
              5'h0f: out_low = 10'h112;
              5'h10: out_low = 10'h114;
              5'h11: out_low = 10'h115;
              5'h12: out_low = 10'h117;
              5'h13: out_low = 10'h119;
              5'h14: out_low = 10'h11b;
              5'h15: out_low = 10'h11c;
              5'h16: out_low = 10'h11e;
              5'h17: out_low = 10'h120;
              5'h18: out_low = 10'h122;
              5'h19: out_low = 10'h123;
              5'h1a: out_low = 10'h125;
              5'h1b: out_low = 10'h127;
              5'h1c: out_low = 10'h129;
              5'h1d: out_low = 10'h12b;
              5'h1e: out_low = 10'h12c;
              5'h1f: out_low = 10'h12e;
              default: out_low = 10'h000;
            endcase
          end
          5'h06: begin
            case (mant[4:0])
              5'h00: out_low = 10'h130;
              5'h01: out_low = 10'h132;
              5'h02: out_low = 10'h134;
              5'h03: out_low = 10'h135;
              5'h04: out_low = 10'h137;
              5'h05: out_low = 10'h139;
              5'h06: out_low = 10'h13b;
              5'h07: out_low = 10'h13d;
              5'h08: out_low = 10'h13e;
              5'h09: out_low = 10'h140;
              5'h0a: out_low = 10'h142;
              5'h0b: out_low = 10'h144;
              5'h0c: out_low = 10'h146;
              5'h0d: out_low = 10'h148;
              5'h0e: out_low = 10'h149;
              5'h0f: out_low = 10'h14b;
              5'h10: out_low = 10'h14d;
              5'h11: out_low = 10'h14f;
              5'h12: out_low = 10'h151;
              5'h13: out_low = 10'h153;
              5'h14: out_low = 10'h154;
              5'h15: out_low = 10'h156;
              5'h16: out_low = 10'h158;
              5'h17: out_low = 10'h15a;
              5'h18: out_low = 10'h15c;
              5'h19: out_low = 10'h15e;
              5'h1a: out_low = 10'h160;
              5'h1b: out_low = 10'h161;
              5'h1c: out_low = 10'h163;
              5'h1d: out_low = 10'h165;
              5'h1e: out_low = 10'h167;
              5'h1f: out_low = 10'h169;
              default: out_low = 10'h000;
            endcase
          end
          5'h07: begin
            case (mant[4:0])
              5'h00: out_low = 10'h16b;
              5'h01: out_low = 10'h16d;
              5'h02: out_low = 10'h16f;
              5'h03: out_low = 10'h170;
              5'h04: out_low = 10'h172;
              5'h05: out_low = 10'h174;
              5'h06: out_low = 10'h176;
              5'h07: out_low = 10'h178;
              5'h08: out_low = 10'h17a;
              5'h09: out_low = 10'h17c;
              5'h0a: out_low = 10'h17e;
              5'h0b: out_low = 10'h180;
              5'h0c: out_low = 10'h181;
              5'h0d: out_low = 10'h183;
              5'h0e: out_low = 10'h185;
              5'h0f: out_low = 10'h187;
              5'h10: out_low = 10'h189;
              5'h11: out_low = 10'h18b;
              5'h12: out_low = 10'h18d;
              5'h13: out_low = 10'h18f;
              5'h14: out_low = 10'h191;
              5'h15: out_low = 10'h193;
              5'h16: out_low = 10'h195;
              5'h17: out_low = 10'h197;
              5'h18: out_low = 10'h199;
              5'h19: out_low = 10'h19a;
              5'h1a: out_low = 10'h19c;
              5'h1b: out_low = 10'h19e;
              5'h1c: out_low = 10'h1a0;
              5'h1d: out_low = 10'h1a2;
              5'h1e: out_low = 10'h1a4;
              5'h1f: out_low = 10'h1a6;
              default: out_low = 10'h000;
            endcase
          end
          5'h08: begin
            case (mant[4:0])
              5'h00: out_low = 10'h1a8;
              5'h01: out_low = 10'h1aa;
              5'h02: out_low = 10'h1ac;
              5'h03: out_low = 10'h1ae;
              5'h04: out_low = 10'h1b0;
              5'h05: out_low = 10'h1b2;
              5'h06: out_low = 10'h1b4;
              5'h07: out_low = 10'h1b6;
              5'h08: out_low = 10'h1b8;
              5'h09: out_low = 10'h1ba;
              5'h0a: out_low = 10'h1bc;
              5'h0b: out_low = 10'h1be;
              5'h0c: out_low = 10'h1c0;
              5'h0d: out_low = 10'h1c2;
              5'h0e: out_low = 10'h1c4;
              5'h0f: out_low = 10'h1c6;
              5'h10: out_low = 10'h1c8;
              5'h11: out_low = 10'h1ca;
              5'h12: out_low = 10'h1cc;
              5'h13: out_low = 10'h1ce;
              5'h14: out_low = 10'h1d0;
              5'h15: out_low = 10'h1d2;
              5'h16: out_low = 10'h1d4;
              5'h17: out_low = 10'h1d6;
              5'h18: out_low = 10'h1d8;
              5'h19: out_low = 10'h1da;
              5'h1a: out_low = 10'h1dc;
              5'h1b: out_low = 10'h1de;
              5'h1c: out_low = 10'h1e0;
              5'h1d: out_low = 10'h1e2;
              5'h1e: out_low = 10'h1e4;
              5'h1f: out_low = 10'h1e6;
              default: out_low = 10'h000;
            endcase
          end
          5'h09: begin
            case (mant[4:0])
              5'h00: out_low = 10'h1e8;
              5'h01: out_low = 10'h1ea;
              5'h02: out_low = 10'h1ec;
              5'h03: out_low = 10'h1ee;
              5'h04: out_low = 10'h1f0;
              5'h05: out_low = 10'h1f3;
              5'h06: out_low = 10'h1f5;
              5'h07: out_low = 10'h1f7;
              5'h08: out_low = 10'h1f9;
              5'h09: out_low = 10'h1fb;
              5'h0a: out_low = 10'h1fd;
              5'h0b: out_low = 10'h1ff;
              5'h0c: out_low = 10'h201;
              5'h0d: out_low = 10'h203;
              5'h0e: out_low = 10'h205;
              5'h0f: out_low = 10'h207;
              5'h10: out_low = 10'h209;
              5'h11: out_low = 10'h20b;
              5'h12: out_low = 10'h20e;
              5'h13: out_low = 10'h210;
              5'h14: out_low = 10'h212;
              5'h15: out_low = 10'h214;
              5'h16: out_low = 10'h216;
              5'h17: out_low = 10'h218;
              5'h18: out_low = 10'h21a;
              5'h19: out_low = 10'h21c;
              5'h1a: out_low = 10'h21e;
              5'h1b: out_low = 10'h221;
              5'h1c: out_low = 10'h223;
              5'h1d: out_low = 10'h225;
              5'h1e: out_low = 10'h227;
              5'h1f: out_low = 10'h229;
              default: out_low = 10'h000;
            endcase
          end
          5'h0a: begin
            case (mant[4:0])
              5'h00: out_low = 10'h22b;
              5'h01: out_low = 10'h22d;
              5'h02: out_low = 10'h230;
              5'h03: out_low = 10'h232;
              5'h04: out_low = 10'h234;
              5'h05: out_low = 10'h236;
              5'h06: out_low = 10'h238;
              5'h07: out_low = 10'h23a;
              5'h08: out_low = 10'h23c;
              5'h09: out_low = 10'h23f;
              5'h0a: out_low = 10'h241;
              5'h0b: out_low = 10'h243;
              5'h0c: out_low = 10'h245;
              5'h0d: out_low = 10'h247;
              5'h0e: out_low = 10'h249;
              5'h0f: out_low = 10'h24c;
              5'h10: out_low = 10'h24e;
              5'h11: out_low = 10'h250;
              5'h12: out_low = 10'h252;
              5'h13: out_low = 10'h254;
              5'h14: out_low = 10'h257;
              5'h15: out_low = 10'h259;
              5'h16: out_low = 10'h25b;
              5'h17: out_low = 10'h25d;
              5'h18: out_low = 10'h25f;
              5'h19: out_low = 10'h262;
              5'h1a: out_low = 10'h264;
              5'h1b: out_low = 10'h266;
              5'h1c: out_low = 10'h268;
              5'h1d: out_low = 10'h26a;
              5'h1e: out_low = 10'h26d;
              5'h1f: out_low = 10'h26f;
              default: out_low = 10'h000;
            endcase
          end
          5'h0b: begin
            case (mant[4:0])
              5'h00: out_low = 10'h271;
              5'h01: out_low = 10'h273;
              5'h02: out_low = 10'h276;
              5'h03: out_low = 10'h278;
              5'h04: out_low = 10'h27a;
              5'h05: out_low = 10'h27c;
              5'h06: out_low = 10'h27f;
              5'h07: out_low = 10'h281;
              5'h08: out_low = 10'h283;
              5'h09: out_low = 10'h285;
              5'h0a: out_low = 10'h288;
              5'h0b: out_low = 10'h28a;
              5'h0c: out_low = 10'h28c;
              5'h0d: out_low = 10'h28e;
              5'h0e: out_low = 10'h291;
              5'h0f: out_low = 10'h293;
              5'h10: out_low = 10'h295;
              5'h11: out_low = 10'h298;
              5'h12: out_low = 10'h29a;
              5'h13: out_low = 10'h29c;
              5'h14: out_low = 10'h29e;
              5'h15: out_low = 10'h2a1;
              5'h16: out_low = 10'h2a3;
              5'h17: out_low = 10'h2a5;
              5'h18: out_low = 10'h2a8;
              5'h19: out_low = 10'h2aa;
              5'h1a: out_low = 10'h2ac;
              5'h1b: out_low = 10'h2af;
              5'h1c: out_low = 10'h2b1;
              5'h1d: out_low = 10'h2b3;
              5'h1e: out_low = 10'h2b5;
              5'h1f: out_low = 10'h2b8;
              default: out_low = 10'h000;
            endcase
          end
          5'h0c: begin
            case (mant[4:0])
              5'h00: out_low = 10'h2ba;
              5'h01: out_low = 10'h2bc;
              5'h02: out_low = 10'h2bf;
              5'h03: out_low = 10'h2c1;
              5'h04: out_low = 10'h2c4;
              5'h05: out_low = 10'h2c6;
              5'h06: out_low = 10'h2c8;
              5'h07: out_low = 10'h2cb;
              5'h08: out_low = 10'h2cd;
              5'h09: out_low = 10'h2cf;
              5'h0a: out_low = 10'h2d2;
              5'h0b: out_low = 10'h2d4;
              5'h0c: out_low = 10'h2d6;
              5'h0d: out_low = 10'h2d9;
              5'h0e: out_low = 10'h2db;
              5'h0f: out_low = 10'h2dd;
              5'h10: out_low = 10'h2e0;
              5'h11: out_low = 10'h2e2;
              5'h12: out_low = 10'h2e5;
              5'h13: out_low = 10'h2e7;
              5'h14: out_low = 10'h2e9;
              5'h15: out_low = 10'h2ec;
              5'h16: out_low = 10'h2ee;
              5'h17: out_low = 10'h2f1;
              5'h18: out_low = 10'h2f3;
              5'h19: out_low = 10'h2f5;
              5'h1a: out_low = 10'h2f8;
              5'h1b: out_low = 10'h2fa;
              5'h1c: out_low = 10'h2fd;
              5'h1d: out_low = 10'h2ff;
              5'h1e: out_low = 10'h302;
              5'h1f: out_low = 10'h304;
              default: out_low = 10'h000;
            endcase
          end
          5'h0d: begin
            case (mant[4:0])
              5'h00: out_low = 10'h306;
              5'h01: out_low = 10'h309;
              5'h02: out_low = 10'h30b;
              5'h03: out_low = 10'h30e;
              5'h04: out_low = 10'h310;
              5'h05: out_low = 10'h313;
              5'h06: out_low = 10'h315;
              5'h07: out_low = 10'h318;
              5'h08: out_low = 10'h31a;
              5'h09: out_low = 10'h31c;
              5'h0a: out_low = 10'h31f;
              5'h0b: out_low = 10'h321;
              5'h0c: out_low = 10'h324;
              5'h0d: out_low = 10'h326;
              5'h0e: out_low = 10'h329;
              5'h0f: out_low = 10'h32b;
              5'h10: out_low = 10'h32e;
              5'h11: out_low = 10'h330;
              5'h12: out_low = 10'h333;
              5'h13: out_low = 10'h335;
              5'h14: out_low = 10'h338;
              5'h15: out_low = 10'h33a;
              5'h16: out_low = 10'h33d;
              5'h17: out_low = 10'h33f;
              5'h18: out_low = 10'h342;
              5'h19: out_low = 10'h344;
              5'h1a: out_low = 10'h347;
              5'h1b: out_low = 10'h349;
              5'h1c: out_low = 10'h34c;
              5'h1d: out_low = 10'h34e;
              5'h1e: out_low = 10'h351;
              5'h1f: out_low = 10'h353;
              default: out_low = 10'h000;
            endcase
          end
          5'h0e: begin
            case (mant[4:0])
              5'h00: out_low = 10'h356;
              5'h01: out_low = 10'h359;
              5'h02: out_low = 10'h35b;
              5'h03: out_low = 10'h35e;
              5'h04: out_low = 10'h360;
              5'h05: out_low = 10'h363;
              5'h06: out_low = 10'h365;
              5'h07: out_low = 10'h368;
              5'h08: out_low = 10'h36a;
              5'h09: out_low = 10'h36d;
              5'h0a: out_low = 10'h370;
              5'h0b: out_low = 10'h372;
              5'h0c: out_low = 10'h375;
              5'h0d: out_low = 10'h377;
              5'h0e: out_low = 10'h37a;
              5'h0f: out_low = 10'h37d;
              5'h10: out_low = 10'h37f;
              5'h11: out_low = 10'h382;
              5'h12: out_low = 10'h384;
              5'h13: out_low = 10'h387;
              5'h14: out_low = 10'h38a;
              5'h15: out_low = 10'h38c;
              5'h16: out_low = 10'h38f;
              5'h17: out_low = 10'h391;
              5'h18: out_low = 10'h394;
              5'h19: out_low = 10'h397;
              5'h1a: out_low = 10'h399;
              5'h1b: out_low = 10'h39c;
              5'h1c: out_low = 10'h39f;
              5'h1d: out_low = 10'h3a1;
              5'h1e: out_low = 10'h3a4;
              5'h1f: out_low = 10'h3a7;
              default: out_low = 10'h000;
            endcase
          end
          5'h0f: begin
            case (mant[4:0])
              5'h00: out_low = 10'h3a9;
              5'h01: out_low = 10'h3ac;
              5'h02: out_low = 10'h3ae;
              5'h03: out_low = 10'h3b1;
              5'h04: out_low = 10'h3b4;
              5'h05: out_low = 10'h3b6;
              5'h06: out_low = 10'h3b9;
              5'h07: out_low = 10'h3bc;
              5'h08: out_low = 10'h3bf;
              5'h09: out_low = 10'h3c1;
              5'h0a: out_low = 10'h3c4;
              5'h0b: out_low = 10'h3c7;
              5'h0c: out_low = 10'h3c9;
              5'h0d: out_low = 10'h3cc;
              5'h0e: out_low = 10'h3cf;
              5'h0f: out_low = 10'h3d1;
              5'h10: out_low = 10'h3d4;
              5'h11: out_low = 10'h3d7;
              5'h12: out_low = 10'h3da;
              5'h13: out_low = 10'h3dc;
              5'h14: out_low = 10'h3df;
              5'h15: out_low = 10'h3e2;
              5'h16: out_low = 10'h3e4;
              5'h17: out_low = 10'h3e7;
              5'h18: out_low = 10'h3ea;
              5'h19: out_low = 10'h3ed;
              5'h1a: out_low = 10'h3ef;
              5'h1b: out_low = 10'h3f2;
              5'h1c: out_low = 10'h3f5;
              5'h1d: out_low = 10'h3f8;
              5'h1e: out_low = 10'h3fa;
              5'h1f: out_low = 10'h3fd;
              default: out_low = 10'h000;
            endcase
          end
          5'h10: begin
            case (mant[4:0])
              5'h00: out_low = 10'h000;
              5'h01: out_low = 10'h001;
              5'h02: out_low = 10'h003;
              5'h03: out_low = 10'h004;
              5'h04: out_low = 10'h006;
              5'h05: out_low = 10'h007;
              5'h06: out_low = 10'h008;
              5'h07: out_low = 10'h00a;
              5'h08: out_low = 10'h00b;
              5'h09: out_low = 10'h00d;
              5'h0a: out_low = 10'h00e;
              5'h0b: out_low = 10'h00f;
              5'h0c: out_low = 10'h011;
              5'h0d: out_low = 10'h012;
              5'h0e: out_low = 10'h014;
              5'h0f: out_low = 10'h015;
              5'h10: out_low = 10'h016;
              5'h11: out_low = 10'h018;
              5'h12: out_low = 10'h019;
              5'h13: out_low = 10'h01b;
              5'h14: out_low = 10'h01c;
              5'h15: out_low = 10'h01e;
              5'h16: out_low = 10'h01f;
              5'h17: out_low = 10'h020;
              5'h18: out_low = 10'h022;
              5'h19: out_low = 10'h023;
              5'h1a: out_low = 10'h025;
              5'h1b: out_low = 10'h026;
              5'h1c: out_low = 10'h028;
              5'h1d: out_low = 10'h029;
              5'h1e: out_low = 10'h02a;
              5'h1f: out_low = 10'h02c;
              default: out_low = 10'h000;
            endcase
          end
          5'h11: begin
            case (mant[4:0])
              5'h00: out_low = 10'h02d;
              5'h01: out_low = 10'h02f;
              5'h02: out_low = 10'h030;
              5'h03: out_low = 10'h032;
              5'h04: out_low = 10'h033;
              5'h05: out_low = 10'h035;
              5'h06: out_low = 10'h036;
              5'h07: out_low = 10'h038;
              5'h08: out_low = 10'h039;
              5'h09: out_low = 10'h03a;
              5'h0a: out_low = 10'h03c;
              5'h0b: out_low = 10'h03d;
              5'h0c: out_low = 10'h03f;
              5'h0d: out_low = 10'h040;
              5'h0e: out_low = 10'h042;
              5'h0f: out_low = 10'h043;
              5'h10: out_low = 10'h045;
              5'h11: out_low = 10'h046;
              5'h12: out_low = 10'h048;
              5'h13: out_low = 10'h049;
              5'h14: out_low = 10'h04b;
              5'h15: out_low = 10'h04c;
              5'h16: out_low = 10'h04e;
              5'h17: out_low = 10'h04f;
              5'h18: out_low = 10'h051;
              5'h19: out_low = 10'h052;
              5'h1a: out_low = 10'h054;
              5'h1b: out_low = 10'h055;
              5'h1c: out_low = 10'h057;
              5'h1d: out_low = 10'h058;
              5'h1e: out_low = 10'h05a;
              5'h1f: out_low = 10'h05b;
              default: out_low = 10'h000;
            endcase
          end
          5'h12: begin
            case (mant[4:0])
              5'h00: out_low = 10'h05d;
              5'h01: out_low = 10'h05e;
              5'h02: out_low = 10'h060;
              5'h03: out_low = 10'h061;
              5'h04: out_low = 10'h063;
              5'h05: out_low = 10'h064;
              5'h06: out_low = 10'h066;
              5'h07: out_low = 10'h067;
              5'h08: out_low = 10'h069;
              5'h09: out_low = 10'h06a;
              5'h0a: out_low = 10'h06c;
              5'h0b: out_low = 10'h06d;
              5'h0c: out_low = 10'h06f;
              5'h0d: out_low = 10'h071;
              5'h0e: out_low = 10'h072;
              5'h0f: out_low = 10'h074;
              5'h10: out_low = 10'h075;
              5'h11: out_low = 10'h077;
              5'h12: out_low = 10'h078;
              5'h13: out_low = 10'h07a;
              5'h14: out_low = 10'h07b;
              5'h15: out_low = 10'h07d;
              5'h16: out_low = 10'h07e;
              5'h17: out_low = 10'h080;
              5'h18: out_low = 10'h082;
              5'h19: out_low = 10'h083;
              5'h1a: out_low = 10'h085;
              5'h1b: out_low = 10'h086;
              5'h1c: out_low = 10'h088;
              5'h1d: out_low = 10'h089;
              5'h1e: out_low = 10'h08b;
              5'h1f: out_low = 10'h08d;
              default: out_low = 10'h000;
            endcase
          end
          5'h13: begin
            case (mant[4:0])
              5'h00: out_low = 10'h08e;
              5'h01: out_low = 10'h090;
              5'h02: out_low = 10'h091;
              5'h03: out_low = 10'h093;
              5'h04: out_low = 10'h094;
              5'h05: out_low = 10'h096;
              5'h06: out_low = 10'h098;
              5'h07: out_low = 10'h099;
              5'h08: out_low = 10'h09b;
              5'h09: out_low = 10'h09c;
              5'h0a: out_low = 10'h09e;
              5'h0b: out_low = 10'h0a0;
              5'h0c: out_low = 10'h0a1;
              5'h0d: out_low = 10'h0a3;
              5'h0e: out_low = 10'h0a4;
              5'h0f: out_low = 10'h0a6;
              5'h10: out_low = 10'h0a8;
              5'h11: out_low = 10'h0a9;
              5'h12: out_low = 10'h0ab;
              5'h13: out_low = 10'h0ad;
              5'h14: out_low = 10'h0ae;
              5'h15: out_low = 10'h0b0;
              5'h16: out_low = 10'h0b1;
              5'h17: out_low = 10'h0b3;
              5'h18: out_low = 10'h0b5;
              5'h19: out_low = 10'h0b6;
              5'h1a: out_low = 10'h0b8;
              5'h1b: out_low = 10'h0ba;
              5'h1c: out_low = 10'h0bb;
              5'h1d: out_low = 10'h0bd;
              5'h1e: out_low = 10'h0be;
              5'h1f: out_low = 10'h0c0;
              default: out_low = 10'h000;
            endcase
          end
          5'h14: begin
            case (mant[4:0])
              5'h00: out_low = 10'h0c2;
              5'h01: out_low = 10'h0c3;
              5'h02: out_low = 10'h0c5;
              5'h03: out_low = 10'h0c7;
              5'h04: out_low = 10'h0c8;
              5'h05: out_low = 10'h0ca;
              5'h06: out_low = 10'h0cc;
              5'h07: out_low = 10'h0cd;
              5'h08: out_low = 10'h0cf;
              5'h09: out_low = 10'h0d1;
              5'h0a: out_low = 10'h0d2;
              5'h0b: out_low = 10'h0d4;
              5'h0c: out_low = 10'h0d6;
              5'h0d: out_low = 10'h0d7;
              5'h0e: out_low = 10'h0d9;
              5'h0f: out_low = 10'h0db;
              5'h10: out_low = 10'h0dc;
              5'h11: out_low = 10'h0de;
              5'h12: out_low = 10'h0e0;
              5'h13: out_low = 10'h0e1;
              5'h14: out_low = 10'h0e3;
              5'h15: out_low = 10'h0e5;
              5'h16: out_low = 10'h0e7;
              5'h17: out_low = 10'h0e8;
              5'h18: out_low = 10'h0ea;
              5'h19: out_low = 10'h0ec;
              5'h1a: out_low = 10'h0ed;
              5'h1b: out_low = 10'h0ef;
              5'h1c: out_low = 10'h0f1;
              5'h1d: out_low = 10'h0f3;
              5'h1e: out_low = 10'h0f4;
              5'h1f: out_low = 10'h0f6;
              default: out_low = 10'h000;
            endcase
          end
          5'h15: begin
            case (mant[4:0])
              5'h00: out_low = 10'h0f8;
              5'h01: out_low = 10'h0f9;
              5'h02: out_low = 10'h0fb;
              5'h03: out_low = 10'h0fd;
              5'h04: out_low = 10'h0ff;
              5'h05: out_low = 10'h100;
              5'h06: out_low = 10'h102;
              5'h07: out_low = 10'h104;
              5'h08: out_low = 10'h106;
              5'h09: out_low = 10'h107;
              5'h0a: out_low = 10'h109;
              5'h0b: out_low = 10'h10b;
              5'h0c: out_low = 10'h10c;
              5'h0d: out_low = 10'h10e;
              5'h0e: out_low = 10'h110;
              5'h0f: out_low = 10'h112;
              5'h10: out_low = 10'h114;
              5'h11: out_low = 10'h115;
              5'h12: out_low = 10'h117;
              5'h13: out_low = 10'h119;
              5'h14: out_low = 10'h11b;
              5'h15: out_low = 10'h11c;
              5'h16: out_low = 10'h11e;
              5'h17: out_low = 10'h120;
              5'h18: out_low = 10'h122;
              5'h19: out_low = 10'h123;
              5'h1a: out_low = 10'h125;
              5'h1b: out_low = 10'h127;
              5'h1c: out_low = 10'h129;
              5'h1d: out_low = 10'h12b;
              5'h1e: out_low = 10'h12c;
              5'h1f: out_low = 10'h12e;
              default: out_low = 10'h000;
            endcase
          end
          5'h16: begin
            case (mant[4:0])
              5'h00: out_low = 10'h130;
              5'h01: out_low = 10'h132;
              5'h02: out_low = 10'h134;
              5'h03: out_low = 10'h135;
              5'h04: out_low = 10'h137;
              5'h05: out_low = 10'h139;
              5'h06: out_low = 10'h13b;
              5'h07: out_low = 10'h13d;
              5'h08: out_low = 10'h13e;
              5'h09: out_low = 10'h140;
              5'h0a: out_low = 10'h142;
              5'h0b: out_low = 10'h144;
              5'h0c: out_low = 10'h146;
              5'h0d: out_low = 10'h148;
              5'h0e: out_low = 10'h149;
              5'h0f: out_low = 10'h14b;
              5'h10: out_low = 10'h14d;
              5'h11: out_low = 10'h14f;
              5'h12: out_low = 10'h151;
              5'h13: out_low = 10'h153;
              5'h14: out_low = 10'h154;
              5'h15: out_low = 10'h156;
              5'h16: out_low = 10'h158;
              5'h17: out_low = 10'h15a;
              5'h18: out_low = 10'h15c;
              5'h19: out_low = 10'h15e;
              5'h1a: out_low = 10'h160;
              5'h1b: out_low = 10'h161;
              5'h1c: out_low = 10'h163;
              5'h1d: out_low = 10'h165;
              5'h1e: out_low = 10'h167;
              5'h1f: out_low = 10'h169;
              default: out_low = 10'h000;
            endcase
          end
          5'h17: begin
            case (mant[4:0])
              5'h00: out_low = 10'h16b;
              5'h01: out_low = 10'h16d;
              5'h02: out_low = 10'h16f;
              5'h03: out_low = 10'h170;
              5'h04: out_low = 10'h172;
              5'h05: out_low = 10'h174;
              5'h06: out_low = 10'h176;
              5'h07: out_low = 10'h178;
              5'h08: out_low = 10'h17a;
              5'h09: out_low = 10'h17c;
              5'h0a: out_low = 10'h17e;
              5'h0b: out_low = 10'h180;
              5'h0c: out_low = 10'h181;
              5'h0d: out_low = 10'h183;
              5'h0e: out_low = 10'h185;
              5'h0f: out_low = 10'h187;
              5'h10: out_low = 10'h189;
              5'h11: out_low = 10'h18b;
              5'h12: out_low = 10'h18d;
              5'h13: out_low = 10'h18f;
              5'h14: out_low = 10'h191;
              5'h15: out_low = 10'h193;
              5'h16: out_low = 10'h195;
              5'h17: out_low = 10'h197;
              5'h18: out_low = 10'h199;
              5'h19: out_low = 10'h19a;
              5'h1a: out_low = 10'h19c;
              5'h1b: out_low = 10'h19e;
              5'h1c: out_low = 10'h1a0;
              5'h1d: out_low = 10'h1a2;
              5'h1e: out_low = 10'h1a4;
              5'h1f: out_low = 10'h1a6;
              default: out_low = 10'h000;
            endcase
          end
          5'h18: begin
            case (mant[4:0])
              5'h00: out_low = 10'h1a8;
              5'h01: out_low = 10'h1aa;
              5'h02: out_low = 10'h1ac;
              5'h03: out_low = 10'h1ae;
              5'h04: out_low = 10'h1b0;
              5'h05: out_low = 10'h1b2;
              5'h06: out_low = 10'h1b4;
              5'h07: out_low = 10'h1b6;
              5'h08: out_low = 10'h1b8;
              5'h09: out_low = 10'h1ba;
              5'h0a: out_low = 10'h1bc;
              5'h0b: out_low = 10'h1be;
              5'h0c: out_low = 10'h1c0;
              5'h0d: out_low = 10'h1c2;
              5'h0e: out_low = 10'h1c4;
              5'h0f: out_low = 10'h1c6;
              5'h10: out_low = 10'h1c8;
              5'h11: out_low = 10'h1ca;
              5'h12: out_low = 10'h1cc;
              5'h13: out_low = 10'h1ce;
              5'h14: out_low = 10'h1d0;
              5'h15: out_low = 10'h1d2;
              5'h16: out_low = 10'h1d4;
              5'h17: out_low = 10'h1d6;
              5'h18: out_low = 10'h1d8;
              5'h19: out_low = 10'h1da;
              5'h1a: out_low = 10'h1dc;
              5'h1b: out_low = 10'h1de;
              5'h1c: out_low = 10'h1e0;
              5'h1d: out_low = 10'h1e2;
              5'h1e: out_low = 10'h1e4;
              5'h1f: out_low = 10'h1e6;
              default: out_low = 10'h000;
            endcase
          end
          5'h19: begin
            case (mant[4:0])
              5'h00: out_low = 10'h1e8;
              5'h01: out_low = 10'h1ea;
              5'h02: out_low = 10'h1ec;
              5'h03: out_low = 10'h1ee;
              5'h04: out_low = 10'h1f0;
              5'h05: out_low = 10'h1f3;
              5'h06: out_low = 10'h1f5;
              5'h07: out_low = 10'h1f7;
              5'h08: out_low = 10'h1f9;
              5'h09: out_low = 10'h1fb;
              5'h0a: out_low = 10'h1fd;
              5'h0b: out_low = 10'h1ff;
              5'h0c: out_low = 10'h201;
              5'h0d: out_low = 10'h203;
              5'h0e: out_low = 10'h205;
              5'h0f: out_low = 10'h207;
              5'h10: out_low = 10'h209;
              5'h11: out_low = 10'h20b;
              5'h12: out_low = 10'h20e;
              5'h13: out_low = 10'h210;
              5'h14: out_low = 10'h212;
              5'h15: out_low = 10'h214;
              5'h16: out_low = 10'h216;
              5'h17: out_low = 10'h218;
              5'h18: out_low = 10'h21a;
              5'h19: out_low = 10'h21c;
              5'h1a: out_low = 10'h21e;
              5'h1b: out_low = 10'h221;
              5'h1c: out_low = 10'h223;
              5'h1d: out_low = 10'h225;
              5'h1e: out_low = 10'h227;
              5'h1f: out_low = 10'h229;
              default: out_low = 10'h000;
            endcase
          end
          5'h1a: begin
            case (mant[4:0])
              5'h00: out_low = 10'h22b;
              5'h01: out_low = 10'h22d;
              5'h02: out_low = 10'h230;
              5'h03: out_low = 10'h232;
              5'h04: out_low = 10'h234;
              5'h05: out_low = 10'h236;
              5'h06: out_low = 10'h238;
              5'h07: out_low = 10'h23a;
              5'h08: out_low = 10'h23c;
              5'h09: out_low = 10'h23f;
              5'h0a: out_low = 10'h241;
              5'h0b: out_low = 10'h243;
              5'h0c: out_low = 10'h245;
              5'h0d: out_low = 10'h247;
              5'h0e: out_low = 10'h249;
              5'h0f: out_low = 10'h24c;
              5'h10: out_low = 10'h24e;
              5'h11: out_low = 10'h250;
              5'h12: out_low = 10'h252;
              5'h13: out_low = 10'h254;
              5'h14: out_low = 10'h257;
              5'h15: out_low = 10'h259;
              5'h16: out_low = 10'h25b;
              5'h17: out_low = 10'h25d;
              5'h18: out_low = 10'h25f;
              5'h19: out_low = 10'h262;
              5'h1a: out_low = 10'h264;
              5'h1b: out_low = 10'h266;
              5'h1c: out_low = 10'h268;
              5'h1d: out_low = 10'h26a;
              5'h1e: out_low = 10'h26d;
              5'h1f: out_low = 10'h26f;
              default: out_low = 10'h000;
            endcase
          end
          5'h1b: begin
            case (mant[4:0])
              5'h00: out_low = 10'h271;
              5'h01: out_low = 10'h273;
              5'h02: out_low = 10'h276;
              5'h03: out_low = 10'h278;
              5'h04: out_low = 10'h27a;
              5'h05: out_low = 10'h27c;
              5'h06: out_low = 10'h27f;
              5'h07: out_low = 10'h281;
              5'h08: out_low = 10'h283;
              5'h09: out_low = 10'h285;
              5'h0a: out_low = 10'h288;
              5'h0b: out_low = 10'h28a;
              5'h0c: out_low = 10'h28c;
              5'h0d: out_low = 10'h28e;
              5'h0e: out_low = 10'h291;
              5'h0f: out_low = 10'h293;
              5'h10: out_low = 10'h295;
              5'h11: out_low = 10'h298;
              5'h12: out_low = 10'h29a;
              5'h13: out_low = 10'h29c;
              5'h14: out_low = 10'h29e;
              5'h15: out_low = 10'h2a1;
              5'h16: out_low = 10'h2a3;
              5'h17: out_low = 10'h2a5;
              5'h18: out_low = 10'h2a8;
              5'h19: out_low = 10'h2aa;
              5'h1a: out_low = 10'h2ac;
              5'h1b: out_low = 10'h2af;
              5'h1c: out_low = 10'h2b1;
              5'h1d: out_low = 10'h2b3;
              5'h1e: out_low = 10'h2b5;
              5'h1f: out_low = 10'h2b8;
              default: out_low = 10'h000;
            endcase
          end
          5'h1c: begin
            case (mant[4:0])
              5'h00: out_low = 10'h2ba;
              5'h01: out_low = 10'h2bc;
              5'h02: out_low = 10'h2bf;
              5'h03: out_low = 10'h2c1;
              5'h04: out_low = 10'h2c4;
              5'h05: out_low = 10'h2c6;
              5'h06: out_low = 10'h2c8;
              5'h07: out_low = 10'h2cb;
              5'h08: out_low = 10'h2cd;
              5'h09: out_low = 10'h2cf;
              5'h0a: out_low = 10'h2d2;
              5'h0b: out_low = 10'h2d4;
              5'h0c: out_low = 10'h2d6;
              5'h0d: out_low = 10'h2d9;
              5'h0e: out_low = 10'h2db;
              5'h0f: out_low = 10'h2dd;
              5'h10: out_low = 10'h2e0;
              5'h11: out_low = 10'h2e2;
              5'h12: out_low = 10'h2e5;
              5'h13: out_low = 10'h2e7;
              5'h14: out_low = 10'h2e9;
              5'h15: out_low = 10'h2ec;
              5'h16: out_low = 10'h2ee;
              5'h17: out_low = 10'h2f1;
              5'h18: out_low = 10'h2f3;
              5'h19: out_low = 10'h2f5;
              5'h1a: out_low = 10'h2f8;
              5'h1b: out_low = 10'h2fa;
              5'h1c: out_low = 10'h2fd;
              5'h1d: out_low = 10'h2ff;
              5'h1e: out_low = 10'h302;
              5'h1f: out_low = 10'h304;
              default: out_low = 10'h000;
            endcase
          end
          5'h1d: begin
            case (mant[4:0])
              5'h00: out_low = 10'h306;
              5'h01: out_low = 10'h309;
              5'h02: out_low = 10'h30b;
              5'h03: out_low = 10'h30e;
              5'h04: out_low = 10'h310;
              5'h05: out_low = 10'h313;
              5'h06: out_low = 10'h315;
              5'h07: out_low = 10'h318;
              5'h08: out_low = 10'h31a;
              5'h09: out_low = 10'h31c;
              5'h0a: out_low = 10'h31f;
              5'h0b: out_low = 10'h321;
              5'h0c: out_low = 10'h324;
              5'h0d: out_low = 10'h326;
              5'h0e: out_low = 10'h329;
              5'h0f: out_low = 10'h32b;
              5'h10: out_low = 10'h32e;
              5'h11: out_low = 10'h330;
              5'h12: out_low = 10'h333;
              5'h13: out_low = 10'h335;
              5'h14: out_low = 10'h338;
              5'h15: out_low = 10'h33a;
              5'h16: out_low = 10'h33d;
              5'h17: out_low = 10'h33f;
              5'h18: out_low = 10'h342;
              5'h19: out_low = 10'h344;
              5'h1a: out_low = 10'h347;
              5'h1b: out_low = 10'h349;
              5'h1c: out_low = 10'h34c;
              5'h1d: out_low = 10'h34e;
              5'h1e: out_low = 10'h351;
              5'h1f: out_low = 10'h353;
              default: out_low = 10'h000;
            endcase
          end
          5'h1e: begin
            case (mant[4:0])
              5'h00: out_low = 10'h356;
              5'h01: out_low = 10'h359;
              5'h02: out_low = 10'h35b;
              5'h03: out_low = 10'h35e;
              5'h04: out_low = 10'h360;
              5'h05: out_low = 10'h363;
              5'h06: out_low = 10'h365;
              5'h07: out_low = 10'h368;
              5'h08: out_low = 10'h36a;
              5'h09: out_low = 10'h36d;
              5'h0a: out_low = 10'h370;
              5'h0b: out_low = 10'h372;
              5'h0c: out_low = 10'h375;
              5'h0d: out_low = 10'h377;
              5'h0e: out_low = 10'h37a;
              5'h0f: out_low = 10'h37d;
              5'h10: out_low = 10'h37f;
              5'h11: out_low = 10'h382;
              5'h12: out_low = 10'h384;
              5'h13: out_low = 10'h387;
              5'h14: out_low = 10'h38a;
              5'h15: out_low = 10'h38c;
              5'h16: out_low = 10'h38f;
              5'h17: out_low = 10'h391;
              5'h18: out_low = 10'h394;
              5'h19: out_low = 10'h397;
              5'h1a: out_low = 10'h399;
              5'h1b: out_low = 10'h39c;
              5'h1c: out_low = 10'h39f;
              5'h1d: out_low = 10'h3a1;
              5'h1e: out_low = 10'h3a4;
              5'h1f: out_low = 10'h3a7;
              default: out_low = 10'h000;
            endcase
          end
          5'h1f: begin
            case (mant[4:0])
              5'h00: out_low = 10'h3a9;
              5'h01: out_low = 10'h3ac;
              5'h02: out_low = 10'h3ae;
              5'h03: out_low = 10'h3b1;
              5'h04: out_low = 10'h3b4;
              5'h05: out_low = 10'h3b6;
              5'h06: out_low = 10'h3b9;
              5'h07: out_low = 10'h3bc;
              5'h08: out_low = 10'h3bf;
              5'h09: out_low = 10'h3c1;
              5'h0a: out_low = 10'h3c4;
              5'h0b: out_low = 10'h3c7;
              5'h0c: out_low = 10'h3c9;
              5'h0d: out_low = 10'h3cc;
              5'h0e: out_low = 10'h3cf;
              5'h0f: out_low = 10'h3d1;
              5'h10: out_low = 10'h3d4;
              5'h11: out_low = 10'h3d7;
              5'h12: out_low = 10'h3da;
              5'h13: out_low = 10'h3dc;
              5'h14: out_low = 10'h3df;
              5'h15: out_low = 10'h3e2;
              5'h16: out_low = 10'h3e4;
              5'h17: out_low = 10'h3e7;
              5'h18: out_low = 10'h3ea;
              5'h19: out_low = 10'h3ed;
              5'h1a: out_low = 10'h3ef;
              5'h1b: out_low = 10'h3f2;
              5'h1c: out_low = 10'h3f5;
              5'h1d: out_low = 10'h3f8;
              5'h1e: out_low = 10'h3fa;
              5'h1f: out_low = 10'h3fd;
              default: out_low = 10'h000;
            endcase
          end
          default: out_low = 10'h000;
        endcase
      end
      6'h11: begin
        case (mant[9:5])
          5'h00: begin
            case (mant[4:0])
              5'h00: out_low = 10'h000;
              5'h01: out_low = 10'h003;
              5'h02: out_low = 10'h006;
              5'h03: out_low = 10'h008;
              5'h04: out_low = 10'h00b;
              5'h05: out_low = 10'h00e;
              5'h06: out_low = 10'h011;
              5'h07: out_low = 10'h014;
              5'h08: out_low = 10'h016;
              5'h09: out_low = 10'h019;
              5'h0a: out_low = 10'h01c;
              5'h0b: out_low = 10'h01f;
              5'h0c: out_low = 10'h022;
              5'h0d: out_low = 10'h025;
              5'h0e: out_low = 10'h028;
              5'h0f: out_low = 10'h02a;
              5'h10: out_low = 10'h02d;
              5'h11: out_low = 10'h030;
              5'h12: out_low = 10'h033;
              5'h13: out_low = 10'h036;
              5'h14: out_low = 10'h039;
              5'h15: out_low = 10'h03c;
              5'h16: out_low = 10'h03f;
              5'h17: out_low = 10'h042;
              5'h18: out_low = 10'h045;
              5'h19: out_low = 10'h048;
              5'h1a: out_low = 10'h04b;
              5'h1b: out_low = 10'h04e;
              5'h1c: out_low = 10'h051;
              5'h1d: out_low = 10'h054;
              5'h1e: out_low = 10'h057;
              5'h1f: out_low = 10'h05a;
              default: out_low = 10'h000;
            endcase
          end
          5'h01: begin
            case (mant[4:0])
              5'h00: out_low = 10'h05d;
              5'h01: out_low = 10'h060;
              5'h02: out_low = 10'h063;
              5'h03: out_low = 10'h066;
              5'h04: out_low = 10'h069;
              5'h05: out_low = 10'h06c;
              5'h06: out_low = 10'h06f;
              5'h07: out_low = 10'h072;
              5'h08: out_low = 10'h075;
              5'h09: out_low = 10'h078;
              5'h0a: out_low = 10'h07b;
              5'h0b: out_low = 10'h07e;
              5'h0c: out_low = 10'h082;
              5'h0d: out_low = 10'h085;
              5'h0e: out_low = 10'h088;
              5'h0f: out_low = 10'h08b;
              5'h10: out_low = 10'h08e;
              5'h11: out_low = 10'h091;
              5'h12: out_low = 10'h094;
              5'h13: out_low = 10'h098;
              5'h14: out_low = 10'h09b;
              5'h15: out_low = 10'h09e;
              5'h16: out_low = 10'h0a1;
              5'h17: out_low = 10'h0a4;
              5'h18: out_low = 10'h0a8;
              5'h19: out_low = 10'h0ab;
              5'h1a: out_low = 10'h0ae;
              5'h1b: out_low = 10'h0b1;
              5'h1c: out_low = 10'h0b5;
              5'h1d: out_low = 10'h0b8;
              5'h1e: out_low = 10'h0bb;
              5'h1f: out_low = 10'h0be;
              default: out_low = 10'h000;
            endcase
          end
          5'h02: begin
            case (mant[4:0])
              5'h00: out_low = 10'h0c2;
              5'h01: out_low = 10'h0c5;
              5'h02: out_low = 10'h0c8;
              5'h03: out_low = 10'h0cc;
              5'h04: out_low = 10'h0cf;
              5'h05: out_low = 10'h0d2;
              5'h06: out_low = 10'h0d6;
              5'h07: out_low = 10'h0d9;
              5'h08: out_low = 10'h0dc;
              5'h09: out_low = 10'h0e0;
              5'h0a: out_low = 10'h0e3;
              5'h0b: out_low = 10'h0e7;
              5'h0c: out_low = 10'h0ea;
              5'h0d: out_low = 10'h0ed;
              5'h0e: out_low = 10'h0f1;
              5'h0f: out_low = 10'h0f4;
              5'h10: out_low = 10'h0f8;
              5'h11: out_low = 10'h0fb;
              5'h12: out_low = 10'h0ff;
              5'h13: out_low = 10'h102;
              5'h14: out_low = 10'h106;
              5'h15: out_low = 10'h109;
              5'h16: out_low = 10'h10c;
              5'h17: out_low = 10'h110;
              5'h18: out_low = 10'h114;
              5'h19: out_low = 10'h117;
              5'h1a: out_low = 10'h11b;
              5'h1b: out_low = 10'h11e;
              5'h1c: out_low = 10'h122;
              5'h1d: out_low = 10'h125;
              5'h1e: out_low = 10'h129;
              5'h1f: out_low = 10'h12c;
              default: out_low = 10'h000;
            endcase
          end
          5'h03: begin
            case (mant[4:0])
              5'h00: out_low = 10'h130;
              5'h01: out_low = 10'h134;
              5'h02: out_low = 10'h137;
              5'h03: out_low = 10'h13b;
              5'h04: out_low = 10'h13e;
              5'h05: out_low = 10'h142;
              5'h06: out_low = 10'h146;
              5'h07: out_low = 10'h149;
              5'h08: out_low = 10'h14d;
              5'h09: out_low = 10'h151;
              5'h0a: out_low = 10'h154;
              5'h0b: out_low = 10'h158;
              5'h0c: out_low = 10'h15c;
              5'h0d: out_low = 10'h160;
              5'h0e: out_low = 10'h163;
              5'h0f: out_low = 10'h167;
              5'h10: out_low = 10'h16b;
              5'h11: out_low = 10'h16f;
              5'h12: out_low = 10'h172;
              5'h13: out_low = 10'h176;
              5'h14: out_low = 10'h17a;
              5'h15: out_low = 10'h17e;
              5'h16: out_low = 10'h181;
              5'h17: out_low = 10'h185;
              5'h18: out_low = 10'h189;
              5'h19: out_low = 10'h18d;
              5'h1a: out_low = 10'h191;
              5'h1b: out_low = 10'h195;
              5'h1c: out_low = 10'h199;
              5'h1d: out_low = 10'h19c;
              5'h1e: out_low = 10'h1a0;
              5'h1f: out_low = 10'h1a4;
              default: out_low = 10'h000;
            endcase
          end
          5'h04: begin
            case (mant[4:0])
              5'h00: out_low = 10'h1a8;
              5'h01: out_low = 10'h1ac;
              5'h02: out_low = 10'h1b0;
              5'h03: out_low = 10'h1b4;
              5'h04: out_low = 10'h1b8;
              5'h05: out_low = 10'h1bc;
              5'h06: out_low = 10'h1c0;
              5'h07: out_low = 10'h1c4;
              5'h08: out_low = 10'h1c8;
              5'h09: out_low = 10'h1cc;
              5'h0a: out_low = 10'h1d0;
              5'h0b: out_low = 10'h1d4;
              5'h0c: out_low = 10'h1d8;
              5'h0d: out_low = 10'h1dc;
              5'h0e: out_low = 10'h1e0;
              5'h0f: out_low = 10'h1e4;
              5'h10: out_low = 10'h1e8;
              5'h11: out_low = 10'h1ec;
              5'h12: out_low = 10'h1f0;
              5'h13: out_low = 10'h1f5;
              5'h14: out_low = 10'h1f9;
              5'h15: out_low = 10'h1fd;
              5'h16: out_low = 10'h201;
              5'h17: out_low = 10'h205;
              5'h18: out_low = 10'h209;
              5'h19: out_low = 10'h20e;
              5'h1a: out_low = 10'h212;
              5'h1b: out_low = 10'h216;
              5'h1c: out_low = 10'h21a;
              5'h1d: out_low = 10'h21e;
              5'h1e: out_low = 10'h223;
              5'h1f: out_low = 10'h227;
              default: out_low = 10'h000;
            endcase
          end
          5'h05: begin
            case (mant[4:0])
              5'h00: out_low = 10'h22b;
              5'h01: out_low = 10'h230;
              5'h02: out_low = 10'h234;
              5'h03: out_low = 10'h238;
              5'h04: out_low = 10'h23c;
              5'h05: out_low = 10'h241;
              5'h06: out_low = 10'h245;
              5'h07: out_low = 10'h249;
              5'h08: out_low = 10'h24e;
              5'h09: out_low = 10'h252;
              5'h0a: out_low = 10'h257;
              5'h0b: out_low = 10'h25b;
              5'h0c: out_low = 10'h25f;
              5'h0d: out_low = 10'h264;
              5'h0e: out_low = 10'h268;
              5'h0f: out_low = 10'h26d;
              5'h10: out_low = 10'h271;
              5'h11: out_low = 10'h276;
              5'h12: out_low = 10'h27a;
              5'h13: out_low = 10'h27f;
              5'h14: out_low = 10'h283;
              5'h15: out_low = 10'h288;
              5'h16: out_low = 10'h28c;
              5'h17: out_low = 10'h291;
              5'h18: out_low = 10'h295;
              5'h19: out_low = 10'h29a;
              5'h1a: out_low = 10'h29e;
              5'h1b: out_low = 10'h2a3;
              5'h1c: out_low = 10'h2a8;
              5'h1d: out_low = 10'h2ac;
              5'h1e: out_low = 10'h2b1;
              5'h1f: out_low = 10'h2b5;
              default: out_low = 10'h000;
            endcase
          end
          5'h06: begin
            case (mant[4:0])
              5'h00: out_low = 10'h2ba;
              5'h01: out_low = 10'h2bf;
              5'h02: out_low = 10'h2c4;
              5'h03: out_low = 10'h2c8;
              5'h04: out_low = 10'h2cd;
              5'h05: out_low = 10'h2d2;
              5'h06: out_low = 10'h2d6;
              5'h07: out_low = 10'h2db;
              5'h08: out_low = 10'h2e0;
              5'h09: out_low = 10'h2e5;
              5'h0a: out_low = 10'h2e9;
              5'h0b: out_low = 10'h2ee;
              5'h0c: out_low = 10'h2f3;
              5'h0d: out_low = 10'h2f8;
              5'h0e: out_low = 10'h2fd;
              5'h0f: out_low = 10'h302;
              5'h10: out_low = 10'h306;
              5'h11: out_low = 10'h30b;
              5'h12: out_low = 10'h310;
              5'h13: out_low = 10'h315;
              5'h14: out_low = 10'h31a;
              5'h15: out_low = 10'h31f;
              5'h16: out_low = 10'h324;
              5'h17: out_low = 10'h329;
              5'h18: out_low = 10'h32e;
              5'h19: out_low = 10'h333;
              5'h1a: out_low = 10'h338;
              5'h1b: out_low = 10'h33d;
              5'h1c: out_low = 10'h342;
              5'h1d: out_low = 10'h347;
              5'h1e: out_low = 10'h34c;
              5'h1f: out_low = 10'h351;
              default: out_low = 10'h000;
            endcase
          end
          5'h07: begin
            case (mant[4:0])
              5'h00: out_low = 10'h356;
              5'h01: out_low = 10'h35b;
              5'h02: out_low = 10'h360;
              5'h03: out_low = 10'h365;
              5'h04: out_low = 10'h36a;
              5'h05: out_low = 10'h370;
              5'h06: out_low = 10'h375;
              5'h07: out_low = 10'h37a;
              5'h08: out_low = 10'h37f;
              5'h09: out_low = 10'h384;
              5'h0a: out_low = 10'h38a;
              5'h0b: out_low = 10'h38f;
              5'h0c: out_low = 10'h394;
              5'h0d: out_low = 10'h399;
              5'h0e: out_low = 10'h39f;
              5'h0f: out_low = 10'h3a4;
              5'h10: out_low = 10'h3a9;
              5'h11: out_low = 10'h3ae;
              5'h12: out_low = 10'h3b4;
              5'h13: out_low = 10'h3b9;
              5'h14: out_low = 10'h3bf;
              5'h15: out_low = 10'h3c4;
              5'h16: out_low = 10'h3c9;
              5'h17: out_low = 10'h3cf;
              5'h18: out_low = 10'h3d4;
              5'h19: out_low = 10'h3da;
              5'h1a: out_low = 10'h3df;
              5'h1b: out_low = 10'h3e4;
              5'h1c: out_low = 10'h3ea;
              5'h1d: out_low = 10'h3ef;
              5'h1e: out_low = 10'h3f5;
              5'h1f: out_low = 10'h3fa;
              default: out_low = 10'h000;
            endcase
          end
          5'h08: begin
            case (mant[4:0])
              5'h00: out_low = 10'h000;
              5'h01: out_low = 10'h003;
              5'h02: out_low = 10'h006;
              5'h03: out_low = 10'h008;
              5'h04: out_low = 10'h00b;
              5'h05: out_low = 10'h00e;
              5'h06: out_low = 10'h011;
              5'h07: out_low = 10'h014;
              5'h08: out_low = 10'h016;
              5'h09: out_low = 10'h019;
              5'h0a: out_low = 10'h01c;
              5'h0b: out_low = 10'h01f;
              5'h0c: out_low = 10'h022;
              5'h0d: out_low = 10'h025;
              5'h0e: out_low = 10'h028;
              5'h0f: out_low = 10'h02a;
              5'h10: out_low = 10'h02d;
              5'h11: out_low = 10'h030;
              5'h12: out_low = 10'h033;
              5'h13: out_low = 10'h036;
              5'h14: out_low = 10'h039;
              5'h15: out_low = 10'h03c;
              5'h16: out_low = 10'h03f;
              5'h17: out_low = 10'h042;
              5'h18: out_low = 10'h045;
              5'h19: out_low = 10'h048;
              5'h1a: out_low = 10'h04b;
              5'h1b: out_low = 10'h04e;
              5'h1c: out_low = 10'h051;
              5'h1d: out_low = 10'h054;
              5'h1e: out_low = 10'h057;
              5'h1f: out_low = 10'h05a;
              default: out_low = 10'h000;
            endcase
          end
          5'h09: begin
            case (mant[4:0])
              5'h00: out_low = 10'h05d;
              5'h01: out_low = 10'h060;
              5'h02: out_low = 10'h063;
              5'h03: out_low = 10'h066;
              5'h04: out_low = 10'h069;
              5'h05: out_low = 10'h06c;
              5'h06: out_low = 10'h06f;
              5'h07: out_low = 10'h072;
              5'h08: out_low = 10'h075;
              5'h09: out_low = 10'h078;
              5'h0a: out_low = 10'h07b;
              5'h0b: out_low = 10'h07e;
              5'h0c: out_low = 10'h082;
              5'h0d: out_low = 10'h085;
              5'h0e: out_low = 10'h088;
              5'h0f: out_low = 10'h08b;
              5'h10: out_low = 10'h08e;
              5'h11: out_low = 10'h091;
              5'h12: out_low = 10'h094;
              5'h13: out_low = 10'h098;
              5'h14: out_low = 10'h09b;
              5'h15: out_low = 10'h09e;
              5'h16: out_low = 10'h0a1;
              5'h17: out_low = 10'h0a4;
              5'h18: out_low = 10'h0a8;
              5'h19: out_low = 10'h0ab;
              5'h1a: out_low = 10'h0ae;
              5'h1b: out_low = 10'h0b1;
              5'h1c: out_low = 10'h0b5;
              5'h1d: out_low = 10'h0b8;
              5'h1e: out_low = 10'h0bb;
              5'h1f: out_low = 10'h0be;
              default: out_low = 10'h000;
            endcase
          end
          5'h0a: begin
            case (mant[4:0])
              5'h00: out_low = 10'h0c2;
              5'h01: out_low = 10'h0c5;
              5'h02: out_low = 10'h0c8;
              5'h03: out_low = 10'h0cc;
              5'h04: out_low = 10'h0cf;
              5'h05: out_low = 10'h0d2;
              5'h06: out_low = 10'h0d6;
              5'h07: out_low = 10'h0d9;
              5'h08: out_low = 10'h0dc;
              5'h09: out_low = 10'h0e0;
              5'h0a: out_low = 10'h0e3;
              5'h0b: out_low = 10'h0e7;
              5'h0c: out_low = 10'h0ea;
              5'h0d: out_low = 10'h0ed;
              5'h0e: out_low = 10'h0f1;
              5'h0f: out_low = 10'h0f4;
              5'h10: out_low = 10'h0f8;
              5'h11: out_low = 10'h0fb;
              5'h12: out_low = 10'h0ff;
              5'h13: out_low = 10'h102;
              5'h14: out_low = 10'h106;
              5'h15: out_low = 10'h109;
              5'h16: out_low = 10'h10c;
              5'h17: out_low = 10'h110;
              5'h18: out_low = 10'h114;
              5'h19: out_low = 10'h117;
              5'h1a: out_low = 10'h11b;
              5'h1b: out_low = 10'h11e;
              5'h1c: out_low = 10'h122;
              5'h1d: out_low = 10'h125;
              5'h1e: out_low = 10'h129;
              5'h1f: out_low = 10'h12c;
              default: out_low = 10'h000;
            endcase
          end
          5'h0b: begin
            case (mant[4:0])
              5'h00: out_low = 10'h130;
              5'h01: out_low = 10'h134;
              5'h02: out_low = 10'h137;
              5'h03: out_low = 10'h13b;
              5'h04: out_low = 10'h13e;
              5'h05: out_low = 10'h142;
              5'h06: out_low = 10'h146;
              5'h07: out_low = 10'h149;
              5'h08: out_low = 10'h14d;
              5'h09: out_low = 10'h151;
              5'h0a: out_low = 10'h154;
              5'h0b: out_low = 10'h158;
              5'h0c: out_low = 10'h15c;
              5'h0d: out_low = 10'h160;
              5'h0e: out_low = 10'h163;
              5'h0f: out_low = 10'h167;
              5'h10: out_low = 10'h16b;
              5'h11: out_low = 10'h16f;
              5'h12: out_low = 10'h172;
              5'h13: out_low = 10'h176;
              5'h14: out_low = 10'h17a;
              5'h15: out_low = 10'h17e;
              5'h16: out_low = 10'h181;
              5'h17: out_low = 10'h185;
              5'h18: out_low = 10'h189;
              5'h19: out_low = 10'h18d;
              5'h1a: out_low = 10'h191;
              5'h1b: out_low = 10'h195;
              5'h1c: out_low = 10'h199;
              5'h1d: out_low = 10'h19c;
              5'h1e: out_low = 10'h1a0;
              5'h1f: out_low = 10'h1a4;
              default: out_low = 10'h000;
            endcase
          end
          5'h0c: begin
            case (mant[4:0])
              5'h00: out_low = 10'h1a8;
              5'h01: out_low = 10'h1ac;
              5'h02: out_low = 10'h1b0;
              5'h03: out_low = 10'h1b4;
              5'h04: out_low = 10'h1b8;
              5'h05: out_low = 10'h1bc;
              5'h06: out_low = 10'h1c0;
              5'h07: out_low = 10'h1c4;
              5'h08: out_low = 10'h1c8;
              5'h09: out_low = 10'h1cc;
              5'h0a: out_low = 10'h1d0;
              5'h0b: out_low = 10'h1d4;
              5'h0c: out_low = 10'h1d8;
              5'h0d: out_low = 10'h1dc;
              5'h0e: out_low = 10'h1e0;
              5'h0f: out_low = 10'h1e4;
              5'h10: out_low = 10'h1e8;
              5'h11: out_low = 10'h1ec;
              5'h12: out_low = 10'h1f0;
              5'h13: out_low = 10'h1f5;
              5'h14: out_low = 10'h1f9;
              5'h15: out_low = 10'h1fd;
              5'h16: out_low = 10'h201;
              5'h17: out_low = 10'h205;
              5'h18: out_low = 10'h209;
              5'h19: out_low = 10'h20e;
              5'h1a: out_low = 10'h212;
              5'h1b: out_low = 10'h216;
              5'h1c: out_low = 10'h21a;
              5'h1d: out_low = 10'h21e;
              5'h1e: out_low = 10'h223;
              5'h1f: out_low = 10'h227;
              default: out_low = 10'h000;
            endcase
          end
          5'h0d: begin
            case (mant[4:0])
              5'h00: out_low = 10'h22b;
              5'h01: out_low = 10'h230;
              5'h02: out_low = 10'h234;
              5'h03: out_low = 10'h238;
              5'h04: out_low = 10'h23c;
              5'h05: out_low = 10'h241;
              5'h06: out_low = 10'h245;
              5'h07: out_low = 10'h249;
              5'h08: out_low = 10'h24e;
              5'h09: out_low = 10'h252;
              5'h0a: out_low = 10'h257;
              5'h0b: out_low = 10'h25b;
              5'h0c: out_low = 10'h25f;
              5'h0d: out_low = 10'h264;
              5'h0e: out_low = 10'h268;
              5'h0f: out_low = 10'h26d;
              5'h10: out_low = 10'h271;
              5'h11: out_low = 10'h276;
              5'h12: out_low = 10'h27a;
              5'h13: out_low = 10'h27f;
              5'h14: out_low = 10'h283;
              5'h15: out_low = 10'h288;
              5'h16: out_low = 10'h28c;
              5'h17: out_low = 10'h291;
              5'h18: out_low = 10'h295;
              5'h19: out_low = 10'h29a;
              5'h1a: out_low = 10'h29e;
              5'h1b: out_low = 10'h2a3;
              5'h1c: out_low = 10'h2a8;
              5'h1d: out_low = 10'h2ac;
              5'h1e: out_low = 10'h2b1;
              5'h1f: out_low = 10'h2b5;
              default: out_low = 10'h000;
            endcase
          end
          5'h0e: begin
            case (mant[4:0])
              5'h00: out_low = 10'h2ba;
              5'h01: out_low = 10'h2bf;
              5'h02: out_low = 10'h2c4;
              5'h03: out_low = 10'h2c8;
              5'h04: out_low = 10'h2cd;
              5'h05: out_low = 10'h2d2;
              5'h06: out_low = 10'h2d6;
              5'h07: out_low = 10'h2db;
              5'h08: out_low = 10'h2e0;
              5'h09: out_low = 10'h2e5;
              5'h0a: out_low = 10'h2e9;
              5'h0b: out_low = 10'h2ee;
              5'h0c: out_low = 10'h2f3;
              5'h0d: out_low = 10'h2f8;
              5'h0e: out_low = 10'h2fd;
              5'h0f: out_low = 10'h302;
              5'h10: out_low = 10'h306;
              5'h11: out_low = 10'h30b;
              5'h12: out_low = 10'h310;
              5'h13: out_low = 10'h315;
              5'h14: out_low = 10'h31a;
              5'h15: out_low = 10'h31f;
              5'h16: out_low = 10'h324;
              5'h17: out_low = 10'h329;
              5'h18: out_low = 10'h32e;
              5'h19: out_low = 10'h333;
              5'h1a: out_low = 10'h338;
              5'h1b: out_low = 10'h33d;
              5'h1c: out_low = 10'h342;
              5'h1d: out_low = 10'h347;
              5'h1e: out_low = 10'h34c;
              5'h1f: out_low = 10'h351;
              default: out_low = 10'h000;
            endcase
          end
          5'h0f: begin
            case (mant[4:0])
              5'h00: out_low = 10'h356;
              5'h01: out_low = 10'h35b;
              5'h02: out_low = 10'h360;
              5'h03: out_low = 10'h365;
              5'h04: out_low = 10'h36a;
              5'h05: out_low = 10'h370;
              5'h06: out_low = 10'h375;
              5'h07: out_low = 10'h37a;
              5'h08: out_low = 10'h37f;
              5'h09: out_low = 10'h384;
              5'h0a: out_low = 10'h38a;
              5'h0b: out_low = 10'h38f;
              5'h0c: out_low = 10'h394;
              5'h0d: out_low = 10'h399;
              5'h0e: out_low = 10'h39f;
              5'h0f: out_low = 10'h3a4;
              5'h10: out_low = 10'h3a9;
              5'h11: out_low = 10'h3ae;
              5'h12: out_low = 10'h3b4;
              5'h13: out_low = 10'h3b9;
              5'h14: out_low = 10'h3bf;
              5'h15: out_low = 10'h3c4;
              5'h16: out_low = 10'h3c9;
              5'h17: out_low = 10'h3cf;
              5'h18: out_low = 10'h3d4;
              5'h19: out_low = 10'h3da;
              5'h1a: out_low = 10'h3df;
              5'h1b: out_low = 10'h3e4;
              5'h1c: out_low = 10'h3ea;
              5'h1d: out_low = 10'h3ef;
              5'h1e: out_low = 10'h3f5;
              5'h1f: out_low = 10'h3fa;
              default: out_low = 10'h000;
            endcase
          end
          5'h10: begin
            case (mant[4:0])
              5'h00: out_low = 10'h000;
              5'h01: out_low = 10'h003;
              5'h02: out_low = 10'h006;
              5'h03: out_low = 10'h008;
              5'h04: out_low = 10'h00b;
              5'h05: out_low = 10'h00e;
              5'h06: out_low = 10'h011;
              5'h07: out_low = 10'h014;
              5'h08: out_low = 10'h016;
              5'h09: out_low = 10'h019;
              5'h0a: out_low = 10'h01c;
              5'h0b: out_low = 10'h01f;
              5'h0c: out_low = 10'h022;
              5'h0d: out_low = 10'h025;
              5'h0e: out_low = 10'h028;
              5'h0f: out_low = 10'h02a;
              5'h10: out_low = 10'h02d;
              5'h11: out_low = 10'h030;
              5'h12: out_low = 10'h033;
              5'h13: out_low = 10'h036;
              5'h14: out_low = 10'h039;
              5'h15: out_low = 10'h03c;
              5'h16: out_low = 10'h03f;
              5'h17: out_low = 10'h042;
              5'h18: out_low = 10'h045;
              5'h19: out_low = 10'h048;
              5'h1a: out_low = 10'h04b;
              5'h1b: out_low = 10'h04e;
              5'h1c: out_low = 10'h051;
              5'h1d: out_low = 10'h054;
              5'h1e: out_low = 10'h057;
              5'h1f: out_low = 10'h05a;
              default: out_low = 10'h000;
            endcase
          end
          5'h11: begin
            case (mant[4:0])
              5'h00: out_low = 10'h05d;
              5'h01: out_low = 10'h060;
              5'h02: out_low = 10'h063;
              5'h03: out_low = 10'h066;
              5'h04: out_low = 10'h069;
              5'h05: out_low = 10'h06c;
              5'h06: out_low = 10'h06f;
              5'h07: out_low = 10'h072;
              5'h08: out_low = 10'h075;
              5'h09: out_low = 10'h078;
              5'h0a: out_low = 10'h07b;
              5'h0b: out_low = 10'h07e;
              5'h0c: out_low = 10'h082;
              5'h0d: out_low = 10'h085;
              5'h0e: out_low = 10'h088;
              5'h0f: out_low = 10'h08b;
              5'h10: out_low = 10'h08e;
              5'h11: out_low = 10'h091;
              5'h12: out_low = 10'h094;
              5'h13: out_low = 10'h098;
              5'h14: out_low = 10'h09b;
              5'h15: out_low = 10'h09e;
              5'h16: out_low = 10'h0a1;
              5'h17: out_low = 10'h0a4;
              5'h18: out_low = 10'h0a8;
              5'h19: out_low = 10'h0ab;
              5'h1a: out_low = 10'h0ae;
              5'h1b: out_low = 10'h0b1;
              5'h1c: out_low = 10'h0b5;
              5'h1d: out_low = 10'h0b8;
              5'h1e: out_low = 10'h0bb;
              5'h1f: out_low = 10'h0be;
              default: out_low = 10'h000;
            endcase
          end
          5'h12: begin
            case (mant[4:0])
              5'h00: out_low = 10'h0c2;
              5'h01: out_low = 10'h0c5;
              5'h02: out_low = 10'h0c8;
              5'h03: out_low = 10'h0cc;
              5'h04: out_low = 10'h0cf;
              5'h05: out_low = 10'h0d2;
              5'h06: out_low = 10'h0d6;
              5'h07: out_low = 10'h0d9;
              5'h08: out_low = 10'h0dc;
              5'h09: out_low = 10'h0e0;
              5'h0a: out_low = 10'h0e3;
              5'h0b: out_low = 10'h0e7;
              5'h0c: out_low = 10'h0ea;
              5'h0d: out_low = 10'h0ed;
              5'h0e: out_low = 10'h0f1;
              5'h0f: out_low = 10'h0f4;
              5'h10: out_low = 10'h0f8;
              5'h11: out_low = 10'h0fb;
              5'h12: out_low = 10'h0ff;
              5'h13: out_low = 10'h102;
              5'h14: out_low = 10'h106;
              5'h15: out_low = 10'h109;
              5'h16: out_low = 10'h10c;
              5'h17: out_low = 10'h110;
              5'h18: out_low = 10'h114;
              5'h19: out_low = 10'h117;
              5'h1a: out_low = 10'h11b;
              5'h1b: out_low = 10'h11e;
              5'h1c: out_low = 10'h122;
              5'h1d: out_low = 10'h125;
              5'h1e: out_low = 10'h129;
              5'h1f: out_low = 10'h12c;
              default: out_low = 10'h000;
            endcase
          end
          5'h13: begin
            case (mant[4:0])
              5'h00: out_low = 10'h130;
              5'h01: out_low = 10'h134;
              5'h02: out_low = 10'h137;
              5'h03: out_low = 10'h13b;
              5'h04: out_low = 10'h13e;
              5'h05: out_low = 10'h142;
              5'h06: out_low = 10'h146;
              5'h07: out_low = 10'h149;
              5'h08: out_low = 10'h14d;
              5'h09: out_low = 10'h151;
              5'h0a: out_low = 10'h154;
              5'h0b: out_low = 10'h158;
              5'h0c: out_low = 10'h15c;
              5'h0d: out_low = 10'h160;
              5'h0e: out_low = 10'h163;
              5'h0f: out_low = 10'h167;
              5'h10: out_low = 10'h16b;
              5'h11: out_low = 10'h16f;
              5'h12: out_low = 10'h172;
              5'h13: out_low = 10'h176;
              5'h14: out_low = 10'h17a;
              5'h15: out_low = 10'h17e;
              5'h16: out_low = 10'h181;
              5'h17: out_low = 10'h185;
              5'h18: out_low = 10'h189;
              5'h19: out_low = 10'h18d;
              5'h1a: out_low = 10'h191;
              5'h1b: out_low = 10'h195;
              5'h1c: out_low = 10'h199;
              5'h1d: out_low = 10'h19c;
              5'h1e: out_low = 10'h1a0;
              5'h1f: out_low = 10'h1a4;
              default: out_low = 10'h000;
            endcase
          end
          5'h14: begin
            case (mant[4:0])
              5'h00: out_low = 10'h1a8;
              5'h01: out_low = 10'h1ac;
              5'h02: out_low = 10'h1b0;
              5'h03: out_low = 10'h1b4;
              5'h04: out_low = 10'h1b8;
              5'h05: out_low = 10'h1bc;
              5'h06: out_low = 10'h1c0;
              5'h07: out_low = 10'h1c4;
              5'h08: out_low = 10'h1c8;
              5'h09: out_low = 10'h1cc;
              5'h0a: out_low = 10'h1d0;
              5'h0b: out_low = 10'h1d4;
              5'h0c: out_low = 10'h1d8;
              5'h0d: out_low = 10'h1dc;
              5'h0e: out_low = 10'h1e0;
              5'h0f: out_low = 10'h1e4;
              5'h10: out_low = 10'h1e8;
              5'h11: out_low = 10'h1ec;
              5'h12: out_low = 10'h1f0;
              5'h13: out_low = 10'h1f5;
              5'h14: out_low = 10'h1f9;
              5'h15: out_low = 10'h1fd;
              5'h16: out_low = 10'h201;
              5'h17: out_low = 10'h205;
              5'h18: out_low = 10'h209;
              5'h19: out_low = 10'h20e;
              5'h1a: out_low = 10'h212;
              5'h1b: out_low = 10'h216;
              5'h1c: out_low = 10'h21a;
              5'h1d: out_low = 10'h21e;
              5'h1e: out_low = 10'h223;
              5'h1f: out_low = 10'h227;
              default: out_low = 10'h000;
            endcase
          end
          5'h15: begin
            case (mant[4:0])
              5'h00: out_low = 10'h22b;
              5'h01: out_low = 10'h230;
              5'h02: out_low = 10'h234;
              5'h03: out_low = 10'h238;
              5'h04: out_low = 10'h23c;
              5'h05: out_low = 10'h241;
              5'h06: out_low = 10'h245;
              5'h07: out_low = 10'h249;
              5'h08: out_low = 10'h24e;
              5'h09: out_low = 10'h252;
              5'h0a: out_low = 10'h257;
              5'h0b: out_low = 10'h25b;
              5'h0c: out_low = 10'h25f;
              5'h0d: out_low = 10'h264;
              5'h0e: out_low = 10'h268;
              5'h0f: out_low = 10'h26d;
              5'h10: out_low = 10'h271;
              5'h11: out_low = 10'h276;
              5'h12: out_low = 10'h27a;
              5'h13: out_low = 10'h27f;
              5'h14: out_low = 10'h283;
              5'h15: out_low = 10'h288;
              5'h16: out_low = 10'h28c;
              5'h17: out_low = 10'h291;
              5'h18: out_low = 10'h295;
              5'h19: out_low = 10'h29a;
              5'h1a: out_low = 10'h29e;
              5'h1b: out_low = 10'h2a3;
              5'h1c: out_low = 10'h2a8;
              5'h1d: out_low = 10'h2ac;
              5'h1e: out_low = 10'h2b1;
              5'h1f: out_low = 10'h2b5;
              default: out_low = 10'h000;
            endcase
          end
          5'h16: begin
            case (mant[4:0])
              5'h00: out_low = 10'h2ba;
              5'h01: out_low = 10'h2bf;
              5'h02: out_low = 10'h2c4;
              5'h03: out_low = 10'h2c8;
              5'h04: out_low = 10'h2cd;
              5'h05: out_low = 10'h2d2;
              5'h06: out_low = 10'h2d6;
              5'h07: out_low = 10'h2db;
              5'h08: out_low = 10'h2e0;
              5'h09: out_low = 10'h2e5;
              5'h0a: out_low = 10'h2e9;
              5'h0b: out_low = 10'h2ee;
              5'h0c: out_low = 10'h2f3;
              5'h0d: out_low = 10'h2f8;
              5'h0e: out_low = 10'h2fd;
              5'h0f: out_low = 10'h302;
              5'h10: out_low = 10'h306;
              5'h11: out_low = 10'h30b;
              5'h12: out_low = 10'h310;
              5'h13: out_low = 10'h315;
              5'h14: out_low = 10'h31a;
              5'h15: out_low = 10'h31f;
              5'h16: out_low = 10'h324;
              5'h17: out_low = 10'h329;
              5'h18: out_low = 10'h32e;
              5'h19: out_low = 10'h333;
              5'h1a: out_low = 10'h338;
              5'h1b: out_low = 10'h33d;
              5'h1c: out_low = 10'h342;
              5'h1d: out_low = 10'h347;
              5'h1e: out_low = 10'h34c;
              5'h1f: out_low = 10'h351;
              default: out_low = 10'h000;
            endcase
          end
          5'h17: begin
            case (mant[4:0])
              5'h00: out_low = 10'h356;
              5'h01: out_low = 10'h35b;
              5'h02: out_low = 10'h360;
              5'h03: out_low = 10'h365;
              5'h04: out_low = 10'h36a;
              5'h05: out_low = 10'h370;
              5'h06: out_low = 10'h375;
              5'h07: out_low = 10'h37a;
              5'h08: out_low = 10'h37f;
              5'h09: out_low = 10'h384;
              5'h0a: out_low = 10'h38a;
              5'h0b: out_low = 10'h38f;
              5'h0c: out_low = 10'h394;
              5'h0d: out_low = 10'h399;
              5'h0e: out_low = 10'h39f;
              5'h0f: out_low = 10'h3a4;
              5'h10: out_low = 10'h3a9;
              5'h11: out_low = 10'h3ae;
              5'h12: out_low = 10'h3b4;
              5'h13: out_low = 10'h3b9;
              5'h14: out_low = 10'h3bf;
              5'h15: out_low = 10'h3c4;
              5'h16: out_low = 10'h3c9;
              5'h17: out_low = 10'h3cf;
              5'h18: out_low = 10'h3d4;
              5'h19: out_low = 10'h3da;
              5'h1a: out_low = 10'h3df;
              5'h1b: out_low = 10'h3e4;
              5'h1c: out_low = 10'h3ea;
              5'h1d: out_low = 10'h3ef;
              5'h1e: out_low = 10'h3f5;
              5'h1f: out_low = 10'h3fa;
              default: out_low = 10'h000;
            endcase
          end
          5'h18: begin
            case (mant[4:0])
              5'h00: out_low = 10'h000;
              5'h01: out_low = 10'h003;
              5'h02: out_low = 10'h006;
              5'h03: out_low = 10'h008;
              5'h04: out_low = 10'h00b;
              5'h05: out_low = 10'h00e;
              5'h06: out_low = 10'h011;
              5'h07: out_low = 10'h014;
              5'h08: out_low = 10'h016;
              5'h09: out_low = 10'h019;
              5'h0a: out_low = 10'h01c;
              5'h0b: out_low = 10'h01f;
              5'h0c: out_low = 10'h022;
              5'h0d: out_low = 10'h025;
              5'h0e: out_low = 10'h028;
              5'h0f: out_low = 10'h02a;
              5'h10: out_low = 10'h02d;
              5'h11: out_low = 10'h030;
              5'h12: out_low = 10'h033;
              5'h13: out_low = 10'h036;
              5'h14: out_low = 10'h039;
              5'h15: out_low = 10'h03c;
              5'h16: out_low = 10'h03f;
              5'h17: out_low = 10'h042;
              5'h18: out_low = 10'h045;
              5'h19: out_low = 10'h048;
              5'h1a: out_low = 10'h04b;
              5'h1b: out_low = 10'h04e;
              5'h1c: out_low = 10'h051;
              5'h1d: out_low = 10'h054;
              5'h1e: out_low = 10'h057;
              5'h1f: out_low = 10'h05a;
              default: out_low = 10'h000;
            endcase
          end
          5'h19: begin
            case (mant[4:0])
              5'h00: out_low = 10'h05d;
              5'h01: out_low = 10'h060;
              5'h02: out_low = 10'h063;
              5'h03: out_low = 10'h066;
              5'h04: out_low = 10'h069;
              5'h05: out_low = 10'h06c;
              5'h06: out_low = 10'h06f;
              5'h07: out_low = 10'h072;
              5'h08: out_low = 10'h075;
              5'h09: out_low = 10'h078;
              5'h0a: out_low = 10'h07b;
              5'h0b: out_low = 10'h07e;
              5'h0c: out_low = 10'h082;
              5'h0d: out_low = 10'h085;
              5'h0e: out_low = 10'h088;
              5'h0f: out_low = 10'h08b;
              5'h10: out_low = 10'h08e;
              5'h11: out_low = 10'h091;
              5'h12: out_low = 10'h094;
              5'h13: out_low = 10'h098;
              5'h14: out_low = 10'h09b;
              5'h15: out_low = 10'h09e;
              5'h16: out_low = 10'h0a1;
              5'h17: out_low = 10'h0a4;
              5'h18: out_low = 10'h0a8;
              5'h19: out_low = 10'h0ab;
              5'h1a: out_low = 10'h0ae;
              5'h1b: out_low = 10'h0b1;
              5'h1c: out_low = 10'h0b5;
              5'h1d: out_low = 10'h0b8;
              5'h1e: out_low = 10'h0bb;
              5'h1f: out_low = 10'h0be;
              default: out_low = 10'h000;
            endcase
          end
          5'h1a: begin
            case (mant[4:0])
              5'h00: out_low = 10'h0c2;
              5'h01: out_low = 10'h0c5;
              5'h02: out_low = 10'h0c8;
              5'h03: out_low = 10'h0cc;
              5'h04: out_low = 10'h0cf;
              5'h05: out_low = 10'h0d2;
              5'h06: out_low = 10'h0d6;
              5'h07: out_low = 10'h0d9;
              5'h08: out_low = 10'h0dc;
              5'h09: out_low = 10'h0e0;
              5'h0a: out_low = 10'h0e3;
              5'h0b: out_low = 10'h0e7;
              5'h0c: out_low = 10'h0ea;
              5'h0d: out_low = 10'h0ed;
              5'h0e: out_low = 10'h0f1;
              5'h0f: out_low = 10'h0f4;
              5'h10: out_low = 10'h0f8;
              5'h11: out_low = 10'h0fb;
              5'h12: out_low = 10'h0ff;
              5'h13: out_low = 10'h102;
              5'h14: out_low = 10'h106;
              5'h15: out_low = 10'h109;
              5'h16: out_low = 10'h10c;
              5'h17: out_low = 10'h110;
              5'h18: out_low = 10'h114;
              5'h19: out_low = 10'h117;
              5'h1a: out_low = 10'h11b;
              5'h1b: out_low = 10'h11e;
              5'h1c: out_low = 10'h122;
              5'h1d: out_low = 10'h125;
              5'h1e: out_low = 10'h129;
              5'h1f: out_low = 10'h12c;
              default: out_low = 10'h000;
            endcase
          end
          5'h1b: begin
            case (mant[4:0])
              5'h00: out_low = 10'h130;
              5'h01: out_low = 10'h134;
              5'h02: out_low = 10'h137;
              5'h03: out_low = 10'h13b;
              5'h04: out_low = 10'h13e;
              5'h05: out_low = 10'h142;
              5'h06: out_low = 10'h146;
              5'h07: out_low = 10'h149;
              5'h08: out_low = 10'h14d;
              5'h09: out_low = 10'h151;
              5'h0a: out_low = 10'h154;
              5'h0b: out_low = 10'h158;
              5'h0c: out_low = 10'h15c;
              5'h0d: out_low = 10'h160;
              5'h0e: out_low = 10'h163;
              5'h0f: out_low = 10'h167;
              5'h10: out_low = 10'h16b;
              5'h11: out_low = 10'h16f;
              5'h12: out_low = 10'h172;
              5'h13: out_low = 10'h176;
              5'h14: out_low = 10'h17a;
              5'h15: out_low = 10'h17e;
              5'h16: out_low = 10'h181;
              5'h17: out_low = 10'h185;
              5'h18: out_low = 10'h189;
              5'h19: out_low = 10'h18d;
              5'h1a: out_low = 10'h191;
              5'h1b: out_low = 10'h195;
              5'h1c: out_low = 10'h199;
              5'h1d: out_low = 10'h19c;
              5'h1e: out_low = 10'h1a0;
              5'h1f: out_low = 10'h1a4;
              default: out_low = 10'h000;
            endcase
          end
          5'h1c: begin
            case (mant[4:0])
              5'h00: out_low = 10'h1a8;
              5'h01: out_low = 10'h1ac;
              5'h02: out_low = 10'h1b0;
              5'h03: out_low = 10'h1b4;
              5'h04: out_low = 10'h1b8;
              5'h05: out_low = 10'h1bc;
              5'h06: out_low = 10'h1c0;
              5'h07: out_low = 10'h1c4;
              5'h08: out_low = 10'h1c8;
              5'h09: out_low = 10'h1cc;
              5'h0a: out_low = 10'h1d0;
              5'h0b: out_low = 10'h1d4;
              5'h0c: out_low = 10'h1d8;
              5'h0d: out_low = 10'h1dc;
              5'h0e: out_low = 10'h1e0;
              5'h0f: out_low = 10'h1e4;
              5'h10: out_low = 10'h1e8;
              5'h11: out_low = 10'h1ec;
              5'h12: out_low = 10'h1f0;
              5'h13: out_low = 10'h1f5;
              5'h14: out_low = 10'h1f9;
              5'h15: out_low = 10'h1fd;
              5'h16: out_low = 10'h201;
              5'h17: out_low = 10'h205;
              5'h18: out_low = 10'h209;
              5'h19: out_low = 10'h20e;
              5'h1a: out_low = 10'h212;
              5'h1b: out_low = 10'h216;
              5'h1c: out_low = 10'h21a;
              5'h1d: out_low = 10'h21e;
              5'h1e: out_low = 10'h223;
              5'h1f: out_low = 10'h227;
              default: out_low = 10'h000;
            endcase
          end
          5'h1d: begin
            case (mant[4:0])
              5'h00: out_low = 10'h22b;
              5'h01: out_low = 10'h230;
              5'h02: out_low = 10'h234;
              5'h03: out_low = 10'h238;
              5'h04: out_low = 10'h23c;
              5'h05: out_low = 10'h241;
              5'h06: out_low = 10'h245;
              5'h07: out_low = 10'h249;
              5'h08: out_low = 10'h24e;
              5'h09: out_low = 10'h252;
              5'h0a: out_low = 10'h257;
              5'h0b: out_low = 10'h25b;
              5'h0c: out_low = 10'h25f;
              5'h0d: out_low = 10'h264;
              5'h0e: out_low = 10'h268;
              5'h0f: out_low = 10'h26d;
              5'h10: out_low = 10'h271;
              5'h11: out_low = 10'h276;
              5'h12: out_low = 10'h27a;
              5'h13: out_low = 10'h27f;
              5'h14: out_low = 10'h283;
              5'h15: out_low = 10'h288;
              5'h16: out_low = 10'h28c;
              5'h17: out_low = 10'h291;
              5'h18: out_low = 10'h295;
              5'h19: out_low = 10'h29a;
              5'h1a: out_low = 10'h29e;
              5'h1b: out_low = 10'h2a3;
              5'h1c: out_low = 10'h2a8;
              5'h1d: out_low = 10'h2ac;
              5'h1e: out_low = 10'h2b1;
              5'h1f: out_low = 10'h2b5;
              default: out_low = 10'h000;
            endcase
          end
          5'h1e: begin
            case (mant[4:0])
              5'h00: out_low = 10'h2ba;
              5'h01: out_low = 10'h2bf;
              5'h02: out_low = 10'h2c4;
              5'h03: out_low = 10'h2c8;
              5'h04: out_low = 10'h2cd;
              5'h05: out_low = 10'h2d2;
              5'h06: out_low = 10'h2d6;
              5'h07: out_low = 10'h2db;
              5'h08: out_low = 10'h2e0;
              5'h09: out_low = 10'h2e5;
              5'h0a: out_low = 10'h2e9;
              5'h0b: out_low = 10'h2ee;
              5'h0c: out_low = 10'h2f3;
              5'h0d: out_low = 10'h2f8;
              5'h0e: out_low = 10'h2fd;
              5'h0f: out_low = 10'h302;
              5'h10: out_low = 10'h306;
              5'h11: out_low = 10'h30b;
              5'h12: out_low = 10'h310;
              5'h13: out_low = 10'h315;
              5'h14: out_low = 10'h31a;
              5'h15: out_low = 10'h31f;
              5'h16: out_low = 10'h324;
              5'h17: out_low = 10'h329;
              5'h18: out_low = 10'h32e;
              5'h19: out_low = 10'h333;
              5'h1a: out_low = 10'h338;
              5'h1b: out_low = 10'h33d;
              5'h1c: out_low = 10'h342;
              5'h1d: out_low = 10'h347;
              5'h1e: out_low = 10'h34c;
              5'h1f: out_low = 10'h351;
              default: out_low = 10'h000;
            endcase
          end
          5'h1f: begin
            case (mant[4:0])
              5'h00: out_low = 10'h356;
              5'h01: out_low = 10'h35b;
              5'h02: out_low = 10'h360;
              5'h03: out_low = 10'h365;
              5'h04: out_low = 10'h36a;
              5'h05: out_low = 10'h370;
              5'h06: out_low = 10'h375;
              5'h07: out_low = 10'h37a;
              5'h08: out_low = 10'h37f;
              5'h09: out_low = 10'h384;
              5'h0a: out_low = 10'h38a;
              5'h0b: out_low = 10'h38f;
              5'h0c: out_low = 10'h394;
              5'h0d: out_low = 10'h399;
              5'h0e: out_low = 10'h39f;
              5'h0f: out_low = 10'h3a4;
              5'h10: out_low = 10'h3a9;
              5'h11: out_low = 10'h3ae;
              5'h12: out_low = 10'h3b4;
              5'h13: out_low = 10'h3b9;
              5'h14: out_low = 10'h3bf;
              5'h15: out_low = 10'h3c4;
              5'h16: out_low = 10'h3c9;
              5'h17: out_low = 10'h3cf;
              5'h18: out_low = 10'h3d4;
              5'h19: out_low = 10'h3da;
              5'h1a: out_low = 10'h3df;
              5'h1b: out_low = 10'h3e4;
              5'h1c: out_low = 10'h3ea;
              5'h1d: out_low = 10'h3ef;
              5'h1e: out_low = 10'h3f5;
              5'h1f: out_low = 10'h3fa;
              default: out_low = 10'h000;
            endcase
          end
          default: out_low = 10'h000;
        endcase
      end
      6'h12: begin
        case (mant[9:5])
          5'h00: begin
            case (mant[4:0])
              5'h00: out_low = 10'h000;
              5'h01: out_low = 10'h006;
              5'h02: out_low = 10'h00b;
              5'h03: out_low = 10'h011;
              5'h04: out_low = 10'h016;
              5'h05: out_low = 10'h01c;
              5'h06: out_low = 10'h022;
              5'h07: out_low = 10'h028;
              5'h08: out_low = 10'h02d;
              5'h09: out_low = 10'h033;
              5'h0a: out_low = 10'h039;
              5'h0b: out_low = 10'h03f;
              5'h0c: out_low = 10'h045;
              5'h0d: out_low = 10'h04b;
              5'h0e: out_low = 10'h051;
              5'h0f: out_low = 10'h057;
              5'h10: out_low = 10'h05d;
              5'h11: out_low = 10'h063;
              5'h12: out_low = 10'h069;
              5'h13: out_low = 10'h06f;
              5'h14: out_low = 10'h075;
              5'h15: out_low = 10'h07b;
              5'h16: out_low = 10'h082;
              5'h17: out_low = 10'h088;
              5'h18: out_low = 10'h08e;
              5'h19: out_low = 10'h094;
              5'h1a: out_low = 10'h09b;
              5'h1b: out_low = 10'h0a1;
              5'h1c: out_low = 10'h0a8;
              5'h1d: out_low = 10'h0ae;
              5'h1e: out_low = 10'h0b5;
              5'h1f: out_low = 10'h0bb;
              default: out_low = 10'h000;
            endcase
          end
          5'h01: begin
            case (mant[4:0])
              5'h00: out_low = 10'h0c2;
              5'h01: out_low = 10'h0c8;
              5'h02: out_low = 10'h0cf;
              5'h03: out_low = 10'h0d6;
              5'h04: out_low = 10'h0dc;
              5'h05: out_low = 10'h0e3;
              5'h06: out_low = 10'h0ea;
              5'h07: out_low = 10'h0f1;
              5'h08: out_low = 10'h0f8;
              5'h09: out_low = 10'h0ff;
              5'h0a: out_low = 10'h106;
              5'h0b: out_low = 10'h10c;
              5'h0c: out_low = 10'h114;
              5'h0d: out_low = 10'h11b;
              5'h0e: out_low = 10'h122;
              5'h0f: out_low = 10'h129;
              5'h10: out_low = 10'h130;
              5'h11: out_low = 10'h137;
              5'h12: out_low = 10'h13e;
              5'h13: out_low = 10'h146;
              5'h14: out_low = 10'h14d;
              5'h15: out_low = 10'h154;
              5'h16: out_low = 10'h15c;
              5'h17: out_low = 10'h163;
              5'h18: out_low = 10'h16b;
              5'h19: out_low = 10'h172;
              5'h1a: out_low = 10'h17a;
              5'h1b: out_low = 10'h181;
              5'h1c: out_low = 10'h189;
              5'h1d: out_low = 10'h191;
              5'h1e: out_low = 10'h199;
              5'h1f: out_low = 10'h1a0;
              default: out_low = 10'h000;
            endcase
          end
          5'h02: begin
            case (mant[4:0])
              5'h00: out_low = 10'h1a8;
              5'h01: out_low = 10'h1b0;
              5'h02: out_low = 10'h1b8;
              5'h03: out_low = 10'h1c0;
              5'h04: out_low = 10'h1c8;
              5'h05: out_low = 10'h1d0;
              5'h06: out_low = 10'h1d8;
              5'h07: out_low = 10'h1e0;
              5'h08: out_low = 10'h1e8;
              5'h09: out_low = 10'h1f0;
              5'h0a: out_low = 10'h1f9;
              5'h0b: out_low = 10'h201;
              5'h0c: out_low = 10'h209;
              5'h0d: out_low = 10'h212;
              5'h0e: out_low = 10'h21a;
              5'h0f: out_low = 10'h223;
              5'h10: out_low = 10'h22b;
              5'h11: out_low = 10'h234;
              5'h12: out_low = 10'h23c;
              5'h13: out_low = 10'h245;
              5'h14: out_low = 10'h24e;
              5'h15: out_low = 10'h257;
              5'h16: out_low = 10'h25f;
              5'h17: out_low = 10'h268;
              5'h18: out_low = 10'h271;
              5'h19: out_low = 10'h27a;
              5'h1a: out_low = 10'h283;
              5'h1b: out_low = 10'h28c;
              5'h1c: out_low = 10'h295;
              5'h1d: out_low = 10'h29e;
              5'h1e: out_low = 10'h2a8;
              5'h1f: out_low = 10'h2b1;
              default: out_low = 10'h000;
            endcase
          end
          5'h03: begin
            case (mant[4:0])
              5'h00: out_low = 10'h2ba;
              5'h01: out_low = 10'h2c4;
              5'h02: out_low = 10'h2cd;
              5'h03: out_low = 10'h2d6;
              5'h04: out_low = 10'h2e0;
              5'h05: out_low = 10'h2e9;
              5'h06: out_low = 10'h2f3;
              5'h07: out_low = 10'h2fd;
              5'h08: out_low = 10'h306;
              5'h09: out_low = 10'h310;
              5'h0a: out_low = 10'h31a;
              5'h0b: out_low = 10'h324;
              5'h0c: out_low = 10'h32e;
              5'h0d: out_low = 10'h338;
              5'h0e: out_low = 10'h342;
              5'h0f: out_low = 10'h34c;
              5'h10: out_low = 10'h356;
              5'h11: out_low = 10'h360;
              5'h12: out_low = 10'h36a;
              5'h13: out_low = 10'h375;
              5'h14: out_low = 10'h37f;
              5'h15: out_low = 10'h38a;
              5'h16: out_low = 10'h394;
              5'h17: out_low = 10'h39f;
              5'h18: out_low = 10'h3a9;
              5'h19: out_low = 10'h3b4;
              5'h1a: out_low = 10'h3bf;
              5'h1b: out_low = 10'h3c9;
              5'h1c: out_low = 10'h3d4;
              5'h1d: out_low = 10'h3df;
              5'h1e: out_low = 10'h3ea;
              5'h1f: out_low = 10'h3f5;
              default: out_low = 10'h000;
            endcase
          end
          5'h04: begin
            case (mant[4:0])
              5'h00: out_low = 10'h000;
              5'h01: out_low = 10'h006;
              5'h02: out_low = 10'h00b;
              5'h03: out_low = 10'h011;
              5'h04: out_low = 10'h016;
              5'h05: out_low = 10'h01c;
              5'h06: out_low = 10'h022;
              5'h07: out_low = 10'h028;
              5'h08: out_low = 10'h02d;
              5'h09: out_low = 10'h033;
              5'h0a: out_low = 10'h039;
              5'h0b: out_low = 10'h03f;
              5'h0c: out_low = 10'h045;
              5'h0d: out_low = 10'h04b;
              5'h0e: out_low = 10'h051;
              5'h0f: out_low = 10'h057;
              5'h10: out_low = 10'h05d;
              5'h11: out_low = 10'h063;
              5'h12: out_low = 10'h069;
              5'h13: out_low = 10'h06f;
              5'h14: out_low = 10'h075;
              5'h15: out_low = 10'h07b;
              5'h16: out_low = 10'h082;
              5'h17: out_low = 10'h088;
              5'h18: out_low = 10'h08e;
              5'h19: out_low = 10'h094;
              5'h1a: out_low = 10'h09b;
              5'h1b: out_low = 10'h0a1;
              5'h1c: out_low = 10'h0a8;
              5'h1d: out_low = 10'h0ae;
              5'h1e: out_low = 10'h0b5;
              5'h1f: out_low = 10'h0bb;
              default: out_low = 10'h000;
            endcase
          end
          5'h05: begin
            case (mant[4:0])
              5'h00: out_low = 10'h0c2;
              5'h01: out_low = 10'h0c8;
              5'h02: out_low = 10'h0cf;
              5'h03: out_low = 10'h0d6;
              5'h04: out_low = 10'h0dc;
              5'h05: out_low = 10'h0e3;
              5'h06: out_low = 10'h0ea;
              5'h07: out_low = 10'h0f1;
              5'h08: out_low = 10'h0f8;
              5'h09: out_low = 10'h0ff;
              5'h0a: out_low = 10'h106;
              5'h0b: out_low = 10'h10c;
              5'h0c: out_low = 10'h114;
              5'h0d: out_low = 10'h11b;
              5'h0e: out_low = 10'h122;
              5'h0f: out_low = 10'h129;
              5'h10: out_low = 10'h130;
              5'h11: out_low = 10'h137;
              5'h12: out_low = 10'h13e;
              5'h13: out_low = 10'h146;
              5'h14: out_low = 10'h14d;
              5'h15: out_low = 10'h154;
              5'h16: out_low = 10'h15c;
              5'h17: out_low = 10'h163;
              5'h18: out_low = 10'h16b;
              5'h19: out_low = 10'h172;
              5'h1a: out_low = 10'h17a;
              5'h1b: out_low = 10'h181;
              5'h1c: out_low = 10'h189;
              5'h1d: out_low = 10'h191;
              5'h1e: out_low = 10'h199;
              5'h1f: out_low = 10'h1a0;
              default: out_low = 10'h000;
            endcase
          end
          5'h06: begin
            case (mant[4:0])
              5'h00: out_low = 10'h1a8;
              5'h01: out_low = 10'h1b0;
              5'h02: out_low = 10'h1b8;
              5'h03: out_low = 10'h1c0;
              5'h04: out_low = 10'h1c8;
              5'h05: out_low = 10'h1d0;
              5'h06: out_low = 10'h1d8;
              5'h07: out_low = 10'h1e0;
              5'h08: out_low = 10'h1e8;
              5'h09: out_low = 10'h1f0;
              5'h0a: out_low = 10'h1f9;
              5'h0b: out_low = 10'h201;
              5'h0c: out_low = 10'h209;
              5'h0d: out_low = 10'h212;
              5'h0e: out_low = 10'h21a;
              5'h0f: out_low = 10'h223;
              5'h10: out_low = 10'h22b;
              5'h11: out_low = 10'h234;
              5'h12: out_low = 10'h23c;
              5'h13: out_low = 10'h245;
              5'h14: out_low = 10'h24e;
              5'h15: out_low = 10'h257;
              5'h16: out_low = 10'h25f;
              5'h17: out_low = 10'h268;
              5'h18: out_low = 10'h271;
              5'h19: out_low = 10'h27a;
              5'h1a: out_low = 10'h283;
              5'h1b: out_low = 10'h28c;
              5'h1c: out_low = 10'h295;
              5'h1d: out_low = 10'h29e;
              5'h1e: out_low = 10'h2a8;
              5'h1f: out_low = 10'h2b1;
              default: out_low = 10'h000;
            endcase
          end
          5'h07: begin
            case (mant[4:0])
              5'h00: out_low = 10'h2ba;
              5'h01: out_low = 10'h2c4;
              5'h02: out_low = 10'h2cd;
              5'h03: out_low = 10'h2d6;
              5'h04: out_low = 10'h2e0;
              5'h05: out_low = 10'h2e9;
              5'h06: out_low = 10'h2f3;
              5'h07: out_low = 10'h2fd;
              5'h08: out_low = 10'h306;
              5'h09: out_low = 10'h310;
              5'h0a: out_low = 10'h31a;
              5'h0b: out_low = 10'h324;
              5'h0c: out_low = 10'h32e;
              5'h0d: out_low = 10'h338;
              5'h0e: out_low = 10'h342;
              5'h0f: out_low = 10'h34c;
              5'h10: out_low = 10'h356;
              5'h11: out_low = 10'h360;
              5'h12: out_low = 10'h36a;
              5'h13: out_low = 10'h375;
              5'h14: out_low = 10'h37f;
              5'h15: out_low = 10'h38a;
              5'h16: out_low = 10'h394;
              5'h17: out_low = 10'h39f;
              5'h18: out_low = 10'h3a9;
              5'h19: out_low = 10'h3b4;
              5'h1a: out_low = 10'h3bf;
              5'h1b: out_low = 10'h3c9;
              5'h1c: out_low = 10'h3d4;
              5'h1d: out_low = 10'h3df;
              5'h1e: out_low = 10'h3ea;
              5'h1f: out_low = 10'h3f5;
              default: out_low = 10'h000;
            endcase
          end
          5'h08: begin
            case (mant[4:0])
              5'h00: out_low = 10'h000;
              5'h01: out_low = 10'h006;
              5'h02: out_low = 10'h00b;
              5'h03: out_low = 10'h011;
              5'h04: out_low = 10'h016;
              5'h05: out_low = 10'h01c;
              5'h06: out_low = 10'h022;
              5'h07: out_low = 10'h028;
              5'h08: out_low = 10'h02d;
              5'h09: out_low = 10'h033;
              5'h0a: out_low = 10'h039;
              5'h0b: out_low = 10'h03f;
              5'h0c: out_low = 10'h045;
              5'h0d: out_low = 10'h04b;
              5'h0e: out_low = 10'h051;
              5'h0f: out_low = 10'h057;
              5'h10: out_low = 10'h05d;
              5'h11: out_low = 10'h063;
              5'h12: out_low = 10'h069;
              5'h13: out_low = 10'h06f;
              5'h14: out_low = 10'h075;
              5'h15: out_low = 10'h07b;
              5'h16: out_low = 10'h082;
              5'h17: out_low = 10'h088;
              5'h18: out_low = 10'h08e;
              5'h19: out_low = 10'h094;
              5'h1a: out_low = 10'h09b;
              5'h1b: out_low = 10'h0a1;
              5'h1c: out_low = 10'h0a8;
              5'h1d: out_low = 10'h0ae;
              5'h1e: out_low = 10'h0b5;
              5'h1f: out_low = 10'h0bb;
              default: out_low = 10'h000;
            endcase
          end
          5'h09: begin
            case (mant[4:0])
              5'h00: out_low = 10'h0c2;
              5'h01: out_low = 10'h0c8;
              5'h02: out_low = 10'h0cf;
              5'h03: out_low = 10'h0d6;
              5'h04: out_low = 10'h0dc;
              5'h05: out_low = 10'h0e3;
              5'h06: out_low = 10'h0ea;
              5'h07: out_low = 10'h0f1;
              5'h08: out_low = 10'h0f8;
              5'h09: out_low = 10'h0ff;
              5'h0a: out_low = 10'h106;
              5'h0b: out_low = 10'h10c;
              5'h0c: out_low = 10'h114;
              5'h0d: out_low = 10'h11b;
              5'h0e: out_low = 10'h122;
              5'h0f: out_low = 10'h129;
              5'h10: out_low = 10'h130;
              5'h11: out_low = 10'h137;
              5'h12: out_low = 10'h13e;
              5'h13: out_low = 10'h146;
              5'h14: out_low = 10'h14d;
              5'h15: out_low = 10'h154;
              5'h16: out_low = 10'h15c;
              5'h17: out_low = 10'h163;
              5'h18: out_low = 10'h16b;
              5'h19: out_low = 10'h172;
              5'h1a: out_low = 10'h17a;
              5'h1b: out_low = 10'h181;
              5'h1c: out_low = 10'h189;
              5'h1d: out_low = 10'h191;
              5'h1e: out_low = 10'h199;
              5'h1f: out_low = 10'h1a0;
              default: out_low = 10'h000;
            endcase
          end
          5'h0a: begin
            case (mant[4:0])
              5'h00: out_low = 10'h1a8;
              5'h01: out_low = 10'h1b0;
              5'h02: out_low = 10'h1b8;
              5'h03: out_low = 10'h1c0;
              5'h04: out_low = 10'h1c8;
              5'h05: out_low = 10'h1d0;
              5'h06: out_low = 10'h1d8;
              5'h07: out_low = 10'h1e0;
              5'h08: out_low = 10'h1e8;
              5'h09: out_low = 10'h1f0;
              5'h0a: out_low = 10'h1f9;
              5'h0b: out_low = 10'h201;
              5'h0c: out_low = 10'h209;
              5'h0d: out_low = 10'h212;
              5'h0e: out_low = 10'h21a;
              5'h0f: out_low = 10'h223;
              5'h10: out_low = 10'h22b;
              5'h11: out_low = 10'h234;
              5'h12: out_low = 10'h23c;
              5'h13: out_low = 10'h245;
              5'h14: out_low = 10'h24e;
              5'h15: out_low = 10'h257;
              5'h16: out_low = 10'h25f;
              5'h17: out_low = 10'h268;
              5'h18: out_low = 10'h271;
              5'h19: out_low = 10'h27a;
              5'h1a: out_low = 10'h283;
              5'h1b: out_low = 10'h28c;
              5'h1c: out_low = 10'h295;
              5'h1d: out_low = 10'h29e;
              5'h1e: out_low = 10'h2a8;
              5'h1f: out_low = 10'h2b1;
              default: out_low = 10'h000;
            endcase
          end
          5'h0b: begin
            case (mant[4:0])
              5'h00: out_low = 10'h2ba;
              5'h01: out_low = 10'h2c4;
              5'h02: out_low = 10'h2cd;
              5'h03: out_low = 10'h2d6;
              5'h04: out_low = 10'h2e0;
              5'h05: out_low = 10'h2e9;
              5'h06: out_low = 10'h2f3;
              5'h07: out_low = 10'h2fd;
              5'h08: out_low = 10'h306;
              5'h09: out_low = 10'h310;
              5'h0a: out_low = 10'h31a;
              5'h0b: out_low = 10'h324;
              5'h0c: out_low = 10'h32e;
              5'h0d: out_low = 10'h338;
              5'h0e: out_low = 10'h342;
              5'h0f: out_low = 10'h34c;
              5'h10: out_low = 10'h356;
              5'h11: out_low = 10'h360;
              5'h12: out_low = 10'h36a;
              5'h13: out_low = 10'h375;
              5'h14: out_low = 10'h37f;
              5'h15: out_low = 10'h38a;
              5'h16: out_low = 10'h394;
              5'h17: out_low = 10'h39f;
              5'h18: out_low = 10'h3a9;
              5'h19: out_low = 10'h3b4;
              5'h1a: out_low = 10'h3bf;
              5'h1b: out_low = 10'h3c9;
              5'h1c: out_low = 10'h3d4;
              5'h1d: out_low = 10'h3df;
              5'h1e: out_low = 10'h3ea;
              5'h1f: out_low = 10'h3f5;
              default: out_low = 10'h000;
            endcase
          end
          5'h0c: begin
            case (mant[4:0])
              5'h00: out_low = 10'h000;
              5'h01: out_low = 10'h006;
              5'h02: out_low = 10'h00b;
              5'h03: out_low = 10'h011;
              5'h04: out_low = 10'h016;
              5'h05: out_low = 10'h01c;
              5'h06: out_low = 10'h022;
              5'h07: out_low = 10'h028;
              5'h08: out_low = 10'h02d;
              5'h09: out_low = 10'h033;
              5'h0a: out_low = 10'h039;
              5'h0b: out_low = 10'h03f;
              5'h0c: out_low = 10'h045;
              5'h0d: out_low = 10'h04b;
              5'h0e: out_low = 10'h051;
              5'h0f: out_low = 10'h057;
              5'h10: out_low = 10'h05d;
              5'h11: out_low = 10'h063;
              5'h12: out_low = 10'h069;
              5'h13: out_low = 10'h06f;
              5'h14: out_low = 10'h075;
              5'h15: out_low = 10'h07b;
              5'h16: out_low = 10'h082;
              5'h17: out_low = 10'h088;
              5'h18: out_low = 10'h08e;
              5'h19: out_low = 10'h094;
              5'h1a: out_low = 10'h09b;
              5'h1b: out_low = 10'h0a1;
              5'h1c: out_low = 10'h0a8;
              5'h1d: out_low = 10'h0ae;
              5'h1e: out_low = 10'h0b5;
              5'h1f: out_low = 10'h0bb;
              default: out_low = 10'h000;
            endcase
          end
          5'h0d: begin
            case (mant[4:0])
              5'h00: out_low = 10'h0c2;
              5'h01: out_low = 10'h0c8;
              5'h02: out_low = 10'h0cf;
              5'h03: out_low = 10'h0d6;
              5'h04: out_low = 10'h0dc;
              5'h05: out_low = 10'h0e3;
              5'h06: out_low = 10'h0ea;
              5'h07: out_low = 10'h0f1;
              5'h08: out_low = 10'h0f8;
              5'h09: out_low = 10'h0ff;
              5'h0a: out_low = 10'h106;
              5'h0b: out_low = 10'h10c;
              5'h0c: out_low = 10'h114;
              5'h0d: out_low = 10'h11b;
              5'h0e: out_low = 10'h122;
              5'h0f: out_low = 10'h129;
              5'h10: out_low = 10'h130;
              5'h11: out_low = 10'h137;
              5'h12: out_low = 10'h13e;
              5'h13: out_low = 10'h146;
              5'h14: out_low = 10'h14d;
              5'h15: out_low = 10'h154;
              5'h16: out_low = 10'h15c;
              5'h17: out_low = 10'h163;
              5'h18: out_low = 10'h16b;
              5'h19: out_low = 10'h172;
              5'h1a: out_low = 10'h17a;
              5'h1b: out_low = 10'h181;
              5'h1c: out_low = 10'h189;
              5'h1d: out_low = 10'h191;
              5'h1e: out_low = 10'h199;
              5'h1f: out_low = 10'h1a0;
              default: out_low = 10'h000;
            endcase
          end
          5'h0e: begin
            case (mant[4:0])
              5'h00: out_low = 10'h1a8;
              5'h01: out_low = 10'h1b0;
              5'h02: out_low = 10'h1b8;
              5'h03: out_low = 10'h1c0;
              5'h04: out_low = 10'h1c8;
              5'h05: out_low = 10'h1d0;
              5'h06: out_low = 10'h1d8;
              5'h07: out_low = 10'h1e0;
              5'h08: out_low = 10'h1e8;
              5'h09: out_low = 10'h1f0;
              5'h0a: out_low = 10'h1f9;
              5'h0b: out_low = 10'h201;
              5'h0c: out_low = 10'h209;
              5'h0d: out_low = 10'h212;
              5'h0e: out_low = 10'h21a;
              5'h0f: out_low = 10'h223;
              5'h10: out_low = 10'h22b;
              5'h11: out_low = 10'h234;
              5'h12: out_low = 10'h23c;
              5'h13: out_low = 10'h245;
              5'h14: out_low = 10'h24e;
              5'h15: out_low = 10'h257;
              5'h16: out_low = 10'h25f;
              5'h17: out_low = 10'h268;
              5'h18: out_low = 10'h271;
              5'h19: out_low = 10'h27a;
              5'h1a: out_low = 10'h283;
              5'h1b: out_low = 10'h28c;
              5'h1c: out_low = 10'h295;
              5'h1d: out_low = 10'h29e;
              5'h1e: out_low = 10'h2a8;
              5'h1f: out_low = 10'h2b1;
              default: out_low = 10'h000;
            endcase
          end
          5'h0f: begin
            case (mant[4:0])
              5'h00: out_low = 10'h2ba;
              5'h01: out_low = 10'h2c4;
              5'h02: out_low = 10'h2cd;
              5'h03: out_low = 10'h2d6;
              5'h04: out_low = 10'h2e0;
              5'h05: out_low = 10'h2e9;
              5'h06: out_low = 10'h2f3;
              5'h07: out_low = 10'h2fd;
              5'h08: out_low = 10'h306;
              5'h09: out_low = 10'h310;
              5'h0a: out_low = 10'h31a;
              5'h0b: out_low = 10'h324;
              5'h0c: out_low = 10'h32e;
              5'h0d: out_low = 10'h338;
              5'h0e: out_low = 10'h342;
              5'h0f: out_low = 10'h34c;
              5'h10: out_low = 10'h356;
              5'h11: out_low = 10'h360;
              5'h12: out_low = 10'h36a;
              5'h13: out_low = 10'h375;
              5'h14: out_low = 10'h37f;
              5'h15: out_low = 10'h38a;
              5'h16: out_low = 10'h394;
              5'h17: out_low = 10'h39f;
              5'h18: out_low = 10'h3a9;
              5'h19: out_low = 10'h3b4;
              5'h1a: out_low = 10'h3bf;
              5'h1b: out_low = 10'h3c9;
              5'h1c: out_low = 10'h3d4;
              5'h1d: out_low = 10'h3df;
              5'h1e: out_low = 10'h3ea;
              5'h1f: out_low = 10'h3f5;
              default: out_low = 10'h000;
            endcase
          end
          5'h10: begin
            case (mant[4:0])
              5'h00: out_low = 10'h000;
              5'h01: out_low = 10'h006;
              5'h02: out_low = 10'h00b;
              5'h03: out_low = 10'h011;
              5'h04: out_low = 10'h016;
              5'h05: out_low = 10'h01c;
              5'h06: out_low = 10'h022;
              5'h07: out_low = 10'h028;
              5'h08: out_low = 10'h02d;
              5'h09: out_low = 10'h033;
              5'h0a: out_low = 10'h039;
              5'h0b: out_low = 10'h03f;
              5'h0c: out_low = 10'h045;
              5'h0d: out_low = 10'h04b;
              5'h0e: out_low = 10'h051;
              5'h0f: out_low = 10'h057;
              5'h10: out_low = 10'h05d;
              5'h11: out_low = 10'h063;
              5'h12: out_low = 10'h069;
              5'h13: out_low = 10'h06f;
              5'h14: out_low = 10'h075;
              5'h15: out_low = 10'h07b;
              5'h16: out_low = 10'h082;
              5'h17: out_low = 10'h088;
              5'h18: out_low = 10'h08e;
              5'h19: out_low = 10'h094;
              5'h1a: out_low = 10'h09b;
              5'h1b: out_low = 10'h0a1;
              5'h1c: out_low = 10'h0a8;
              5'h1d: out_low = 10'h0ae;
              5'h1e: out_low = 10'h0b5;
              5'h1f: out_low = 10'h0bb;
              default: out_low = 10'h000;
            endcase
          end
          5'h11: begin
            case (mant[4:0])
              5'h00: out_low = 10'h0c2;
              5'h01: out_low = 10'h0c8;
              5'h02: out_low = 10'h0cf;
              5'h03: out_low = 10'h0d6;
              5'h04: out_low = 10'h0dc;
              5'h05: out_low = 10'h0e3;
              5'h06: out_low = 10'h0ea;
              5'h07: out_low = 10'h0f1;
              5'h08: out_low = 10'h0f8;
              5'h09: out_low = 10'h0ff;
              5'h0a: out_low = 10'h106;
              5'h0b: out_low = 10'h10c;
              5'h0c: out_low = 10'h114;
              5'h0d: out_low = 10'h11b;
              5'h0e: out_low = 10'h122;
              5'h0f: out_low = 10'h129;
              5'h10: out_low = 10'h130;
              5'h11: out_low = 10'h137;
              5'h12: out_low = 10'h13e;
              5'h13: out_low = 10'h146;
              5'h14: out_low = 10'h14d;
              5'h15: out_low = 10'h154;
              5'h16: out_low = 10'h15c;
              5'h17: out_low = 10'h163;
              5'h18: out_low = 10'h16b;
              5'h19: out_low = 10'h172;
              5'h1a: out_low = 10'h17a;
              5'h1b: out_low = 10'h181;
              5'h1c: out_low = 10'h189;
              5'h1d: out_low = 10'h191;
              5'h1e: out_low = 10'h199;
              5'h1f: out_low = 10'h1a0;
              default: out_low = 10'h000;
            endcase
          end
          5'h12: begin
            case (mant[4:0])
              5'h00: out_low = 10'h1a8;
              5'h01: out_low = 10'h1b0;
              5'h02: out_low = 10'h1b8;
              5'h03: out_low = 10'h1c0;
              5'h04: out_low = 10'h1c8;
              5'h05: out_low = 10'h1d0;
              5'h06: out_low = 10'h1d8;
              5'h07: out_low = 10'h1e0;
              5'h08: out_low = 10'h1e8;
              5'h09: out_low = 10'h1f0;
              5'h0a: out_low = 10'h1f9;
              5'h0b: out_low = 10'h201;
              5'h0c: out_low = 10'h209;
              5'h0d: out_low = 10'h212;
              5'h0e: out_low = 10'h21a;
              5'h0f: out_low = 10'h223;
              5'h10: out_low = 10'h22b;
              5'h11: out_low = 10'h234;
              5'h12: out_low = 10'h23c;
              5'h13: out_low = 10'h245;
              5'h14: out_low = 10'h24e;
              5'h15: out_low = 10'h257;
              5'h16: out_low = 10'h25f;
              5'h17: out_low = 10'h268;
              5'h18: out_low = 10'h271;
              5'h19: out_low = 10'h27a;
              5'h1a: out_low = 10'h283;
              5'h1b: out_low = 10'h28c;
              5'h1c: out_low = 10'h295;
              5'h1d: out_low = 10'h29e;
              5'h1e: out_low = 10'h2a8;
              5'h1f: out_low = 10'h2b1;
              default: out_low = 10'h000;
            endcase
          end
          5'h13: begin
            case (mant[4:0])
              5'h00: out_low = 10'h2ba;
              5'h01: out_low = 10'h2c4;
              5'h02: out_low = 10'h2cd;
              5'h03: out_low = 10'h2d6;
              5'h04: out_low = 10'h2e0;
              5'h05: out_low = 10'h2e9;
              5'h06: out_low = 10'h2f3;
              5'h07: out_low = 10'h2fd;
              5'h08: out_low = 10'h306;
              5'h09: out_low = 10'h310;
              5'h0a: out_low = 10'h31a;
              5'h0b: out_low = 10'h324;
              5'h0c: out_low = 10'h32e;
              5'h0d: out_low = 10'h338;
              5'h0e: out_low = 10'h342;
              5'h0f: out_low = 10'h34c;
              5'h10: out_low = 10'h356;
              5'h11: out_low = 10'h360;
              5'h12: out_low = 10'h36a;
              5'h13: out_low = 10'h375;
              5'h14: out_low = 10'h37f;
              5'h15: out_low = 10'h38a;
              5'h16: out_low = 10'h394;
              5'h17: out_low = 10'h39f;
              5'h18: out_low = 10'h3a9;
              5'h19: out_low = 10'h3b4;
              5'h1a: out_low = 10'h3bf;
              5'h1b: out_low = 10'h3c9;
              5'h1c: out_low = 10'h3d4;
              5'h1d: out_low = 10'h3df;
              5'h1e: out_low = 10'h3ea;
              5'h1f: out_low = 10'h3f5;
              default: out_low = 10'h000;
            endcase
          end
          5'h14: begin
            case (mant[4:0])
              5'h00: out_low = 10'h000;
              5'h01: out_low = 10'h006;
              5'h02: out_low = 10'h00b;
              5'h03: out_low = 10'h011;
              5'h04: out_low = 10'h016;
              5'h05: out_low = 10'h01c;
              5'h06: out_low = 10'h022;
              5'h07: out_low = 10'h028;
              5'h08: out_low = 10'h02d;
              5'h09: out_low = 10'h033;
              5'h0a: out_low = 10'h039;
              5'h0b: out_low = 10'h03f;
              5'h0c: out_low = 10'h045;
              5'h0d: out_low = 10'h04b;
              5'h0e: out_low = 10'h051;
              5'h0f: out_low = 10'h057;
              5'h10: out_low = 10'h05d;
              5'h11: out_low = 10'h063;
              5'h12: out_low = 10'h069;
              5'h13: out_low = 10'h06f;
              5'h14: out_low = 10'h075;
              5'h15: out_low = 10'h07b;
              5'h16: out_low = 10'h082;
              5'h17: out_low = 10'h088;
              5'h18: out_low = 10'h08e;
              5'h19: out_low = 10'h094;
              5'h1a: out_low = 10'h09b;
              5'h1b: out_low = 10'h0a1;
              5'h1c: out_low = 10'h0a8;
              5'h1d: out_low = 10'h0ae;
              5'h1e: out_low = 10'h0b5;
              5'h1f: out_low = 10'h0bb;
              default: out_low = 10'h000;
            endcase
          end
          5'h15: begin
            case (mant[4:0])
              5'h00: out_low = 10'h0c2;
              5'h01: out_low = 10'h0c8;
              5'h02: out_low = 10'h0cf;
              5'h03: out_low = 10'h0d6;
              5'h04: out_low = 10'h0dc;
              5'h05: out_low = 10'h0e3;
              5'h06: out_low = 10'h0ea;
              5'h07: out_low = 10'h0f1;
              5'h08: out_low = 10'h0f8;
              5'h09: out_low = 10'h0ff;
              5'h0a: out_low = 10'h106;
              5'h0b: out_low = 10'h10c;
              5'h0c: out_low = 10'h114;
              5'h0d: out_low = 10'h11b;
              5'h0e: out_low = 10'h122;
              5'h0f: out_low = 10'h129;
              5'h10: out_low = 10'h130;
              5'h11: out_low = 10'h137;
              5'h12: out_low = 10'h13e;
              5'h13: out_low = 10'h146;
              5'h14: out_low = 10'h14d;
              5'h15: out_low = 10'h154;
              5'h16: out_low = 10'h15c;
              5'h17: out_low = 10'h163;
              5'h18: out_low = 10'h16b;
              5'h19: out_low = 10'h172;
              5'h1a: out_low = 10'h17a;
              5'h1b: out_low = 10'h181;
              5'h1c: out_low = 10'h189;
              5'h1d: out_low = 10'h191;
              5'h1e: out_low = 10'h199;
              5'h1f: out_low = 10'h1a0;
              default: out_low = 10'h000;
            endcase
          end
          5'h16: begin
            case (mant[4:0])
              5'h00: out_low = 10'h1a8;
              5'h01: out_low = 10'h1b0;
              5'h02: out_low = 10'h1b8;
              5'h03: out_low = 10'h1c0;
              5'h04: out_low = 10'h1c8;
              5'h05: out_low = 10'h1d0;
              5'h06: out_low = 10'h1d8;
              5'h07: out_low = 10'h1e0;
              5'h08: out_low = 10'h1e8;
              5'h09: out_low = 10'h1f0;
              5'h0a: out_low = 10'h1f9;
              5'h0b: out_low = 10'h201;
              5'h0c: out_low = 10'h209;
              5'h0d: out_low = 10'h212;
              5'h0e: out_low = 10'h21a;
              5'h0f: out_low = 10'h223;
              5'h10: out_low = 10'h22b;
              5'h11: out_low = 10'h234;
              5'h12: out_low = 10'h23c;
              5'h13: out_low = 10'h245;
              5'h14: out_low = 10'h24e;
              5'h15: out_low = 10'h257;
              5'h16: out_low = 10'h25f;
              5'h17: out_low = 10'h268;
              5'h18: out_low = 10'h271;
              5'h19: out_low = 10'h27a;
              5'h1a: out_low = 10'h283;
              5'h1b: out_low = 10'h28c;
              5'h1c: out_low = 10'h295;
              5'h1d: out_low = 10'h29e;
              5'h1e: out_low = 10'h2a8;
              5'h1f: out_low = 10'h2b1;
              default: out_low = 10'h000;
            endcase
          end
          5'h17: begin
            case (mant[4:0])
              5'h00: out_low = 10'h2ba;
              5'h01: out_low = 10'h2c4;
              5'h02: out_low = 10'h2cd;
              5'h03: out_low = 10'h2d6;
              5'h04: out_low = 10'h2e0;
              5'h05: out_low = 10'h2e9;
              5'h06: out_low = 10'h2f3;
              5'h07: out_low = 10'h2fd;
              5'h08: out_low = 10'h306;
              5'h09: out_low = 10'h310;
              5'h0a: out_low = 10'h31a;
              5'h0b: out_low = 10'h324;
              5'h0c: out_low = 10'h32e;
              5'h0d: out_low = 10'h338;
              5'h0e: out_low = 10'h342;
              5'h0f: out_low = 10'h34c;
              5'h10: out_low = 10'h356;
              5'h11: out_low = 10'h360;
              5'h12: out_low = 10'h36a;
              5'h13: out_low = 10'h375;
              5'h14: out_low = 10'h37f;
              5'h15: out_low = 10'h38a;
              5'h16: out_low = 10'h394;
              5'h17: out_low = 10'h39f;
              5'h18: out_low = 10'h3a9;
              5'h19: out_low = 10'h3b4;
              5'h1a: out_low = 10'h3bf;
              5'h1b: out_low = 10'h3c9;
              5'h1c: out_low = 10'h3d4;
              5'h1d: out_low = 10'h3df;
              5'h1e: out_low = 10'h3ea;
              5'h1f: out_low = 10'h3f5;
              default: out_low = 10'h000;
            endcase
          end
          5'h18: begin
            case (mant[4:0])
              5'h00: out_low = 10'h000;
              5'h01: out_low = 10'h006;
              5'h02: out_low = 10'h00b;
              5'h03: out_low = 10'h011;
              5'h04: out_low = 10'h016;
              5'h05: out_low = 10'h01c;
              5'h06: out_low = 10'h022;
              5'h07: out_low = 10'h028;
              5'h08: out_low = 10'h02d;
              5'h09: out_low = 10'h033;
              5'h0a: out_low = 10'h039;
              5'h0b: out_low = 10'h03f;
              5'h0c: out_low = 10'h045;
              5'h0d: out_low = 10'h04b;
              5'h0e: out_low = 10'h051;
              5'h0f: out_low = 10'h057;
              5'h10: out_low = 10'h05d;
              5'h11: out_low = 10'h063;
              5'h12: out_low = 10'h069;
              5'h13: out_low = 10'h06f;
              5'h14: out_low = 10'h075;
              5'h15: out_low = 10'h07b;
              5'h16: out_low = 10'h082;
              5'h17: out_low = 10'h088;
              5'h18: out_low = 10'h08e;
              5'h19: out_low = 10'h094;
              5'h1a: out_low = 10'h09b;
              5'h1b: out_low = 10'h0a1;
              5'h1c: out_low = 10'h0a8;
              5'h1d: out_low = 10'h0ae;
              5'h1e: out_low = 10'h0b5;
              5'h1f: out_low = 10'h0bb;
              default: out_low = 10'h000;
            endcase
          end
          5'h19: begin
            case (mant[4:0])
              5'h00: out_low = 10'h0c2;
              5'h01: out_low = 10'h0c8;
              5'h02: out_low = 10'h0cf;
              5'h03: out_low = 10'h0d6;
              5'h04: out_low = 10'h0dc;
              5'h05: out_low = 10'h0e3;
              5'h06: out_low = 10'h0ea;
              5'h07: out_low = 10'h0f1;
              5'h08: out_low = 10'h0f8;
              5'h09: out_low = 10'h0ff;
              5'h0a: out_low = 10'h106;
              5'h0b: out_low = 10'h10c;
              5'h0c: out_low = 10'h114;
              5'h0d: out_low = 10'h11b;
              5'h0e: out_low = 10'h122;
              5'h0f: out_low = 10'h129;
              5'h10: out_low = 10'h130;
              5'h11: out_low = 10'h137;
              5'h12: out_low = 10'h13e;
              5'h13: out_low = 10'h146;
              5'h14: out_low = 10'h14d;
              5'h15: out_low = 10'h154;
              5'h16: out_low = 10'h15c;
              5'h17: out_low = 10'h163;
              5'h18: out_low = 10'h16b;
              5'h19: out_low = 10'h172;
              5'h1a: out_low = 10'h17a;
              5'h1b: out_low = 10'h181;
              5'h1c: out_low = 10'h189;
              5'h1d: out_low = 10'h191;
              5'h1e: out_low = 10'h199;
              5'h1f: out_low = 10'h1a0;
              default: out_low = 10'h000;
            endcase
          end
          5'h1a: begin
            case (mant[4:0])
              5'h00: out_low = 10'h1a8;
              5'h01: out_low = 10'h1b0;
              5'h02: out_low = 10'h1b8;
              5'h03: out_low = 10'h1c0;
              5'h04: out_low = 10'h1c8;
              5'h05: out_low = 10'h1d0;
              5'h06: out_low = 10'h1d8;
              5'h07: out_low = 10'h1e0;
              5'h08: out_low = 10'h1e8;
              5'h09: out_low = 10'h1f0;
              5'h0a: out_low = 10'h1f9;
              5'h0b: out_low = 10'h201;
              5'h0c: out_low = 10'h209;
              5'h0d: out_low = 10'h212;
              5'h0e: out_low = 10'h21a;
              5'h0f: out_low = 10'h223;
              5'h10: out_low = 10'h22b;
              5'h11: out_low = 10'h234;
              5'h12: out_low = 10'h23c;
              5'h13: out_low = 10'h245;
              5'h14: out_low = 10'h24e;
              5'h15: out_low = 10'h257;
              5'h16: out_low = 10'h25f;
              5'h17: out_low = 10'h268;
              5'h18: out_low = 10'h271;
              5'h19: out_low = 10'h27a;
              5'h1a: out_low = 10'h283;
              5'h1b: out_low = 10'h28c;
              5'h1c: out_low = 10'h295;
              5'h1d: out_low = 10'h29e;
              5'h1e: out_low = 10'h2a8;
              5'h1f: out_low = 10'h2b1;
              default: out_low = 10'h000;
            endcase
          end
          5'h1b: begin
            case (mant[4:0])
              5'h00: out_low = 10'h2ba;
              5'h01: out_low = 10'h2c4;
              5'h02: out_low = 10'h2cd;
              5'h03: out_low = 10'h2d6;
              5'h04: out_low = 10'h2e0;
              5'h05: out_low = 10'h2e9;
              5'h06: out_low = 10'h2f3;
              5'h07: out_low = 10'h2fd;
              5'h08: out_low = 10'h306;
              5'h09: out_low = 10'h310;
              5'h0a: out_low = 10'h31a;
              5'h0b: out_low = 10'h324;
              5'h0c: out_low = 10'h32e;
              5'h0d: out_low = 10'h338;
              5'h0e: out_low = 10'h342;
              5'h0f: out_low = 10'h34c;
              5'h10: out_low = 10'h356;
              5'h11: out_low = 10'h360;
              5'h12: out_low = 10'h36a;
              5'h13: out_low = 10'h375;
              5'h14: out_low = 10'h37f;
              5'h15: out_low = 10'h38a;
              5'h16: out_low = 10'h394;
              5'h17: out_low = 10'h39f;
              5'h18: out_low = 10'h3a9;
              5'h19: out_low = 10'h3b4;
              5'h1a: out_low = 10'h3bf;
              5'h1b: out_low = 10'h3c9;
              5'h1c: out_low = 10'h3d4;
              5'h1d: out_low = 10'h3df;
              5'h1e: out_low = 10'h3ea;
              5'h1f: out_low = 10'h3f5;
              default: out_low = 10'h000;
            endcase
          end
          5'h1c: begin
            case (mant[4:0])
              5'h00: out_low = 10'h000;
              5'h01: out_low = 10'h006;
              5'h02: out_low = 10'h00b;
              5'h03: out_low = 10'h011;
              5'h04: out_low = 10'h016;
              5'h05: out_low = 10'h01c;
              5'h06: out_low = 10'h022;
              5'h07: out_low = 10'h028;
              5'h08: out_low = 10'h02d;
              5'h09: out_low = 10'h033;
              5'h0a: out_low = 10'h039;
              5'h0b: out_low = 10'h03f;
              5'h0c: out_low = 10'h045;
              5'h0d: out_low = 10'h04b;
              5'h0e: out_low = 10'h051;
              5'h0f: out_low = 10'h057;
              5'h10: out_low = 10'h05d;
              5'h11: out_low = 10'h063;
              5'h12: out_low = 10'h069;
              5'h13: out_low = 10'h06f;
              5'h14: out_low = 10'h075;
              5'h15: out_low = 10'h07b;
              5'h16: out_low = 10'h082;
              5'h17: out_low = 10'h088;
              5'h18: out_low = 10'h08e;
              5'h19: out_low = 10'h094;
              5'h1a: out_low = 10'h09b;
              5'h1b: out_low = 10'h0a1;
              5'h1c: out_low = 10'h0a8;
              5'h1d: out_low = 10'h0ae;
              5'h1e: out_low = 10'h0b5;
              5'h1f: out_low = 10'h0bb;
              default: out_low = 10'h000;
            endcase
          end
          5'h1d: begin
            case (mant[4:0])
              5'h00: out_low = 10'h0c2;
              5'h01: out_low = 10'h0c8;
              5'h02: out_low = 10'h0cf;
              5'h03: out_low = 10'h0d6;
              5'h04: out_low = 10'h0dc;
              5'h05: out_low = 10'h0e3;
              5'h06: out_low = 10'h0ea;
              5'h07: out_low = 10'h0f1;
              5'h08: out_low = 10'h0f8;
              5'h09: out_low = 10'h0ff;
              5'h0a: out_low = 10'h106;
              5'h0b: out_low = 10'h10c;
              5'h0c: out_low = 10'h114;
              5'h0d: out_low = 10'h11b;
              5'h0e: out_low = 10'h122;
              5'h0f: out_low = 10'h129;
              5'h10: out_low = 10'h130;
              5'h11: out_low = 10'h137;
              5'h12: out_low = 10'h13e;
              5'h13: out_low = 10'h146;
              5'h14: out_low = 10'h14d;
              5'h15: out_low = 10'h154;
              5'h16: out_low = 10'h15c;
              5'h17: out_low = 10'h163;
              5'h18: out_low = 10'h16b;
              5'h19: out_low = 10'h172;
              5'h1a: out_low = 10'h17a;
              5'h1b: out_low = 10'h181;
              5'h1c: out_low = 10'h189;
              5'h1d: out_low = 10'h191;
              5'h1e: out_low = 10'h199;
              5'h1f: out_low = 10'h1a0;
              default: out_low = 10'h000;
            endcase
          end
          5'h1e: begin
            case (mant[4:0])
              5'h00: out_low = 10'h1a8;
              5'h01: out_low = 10'h1b0;
              5'h02: out_low = 10'h1b8;
              5'h03: out_low = 10'h1c0;
              5'h04: out_low = 10'h1c8;
              5'h05: out_low = 10'h1d0;
              5'h06: out_low = 10'h1d8;
              5'h07: out_low = 10'h1e0;
              5'h08: out_low = 10'h1e8;
              5'h09: out_low = 10'h1f0;
              5'h0a: out_low = 10'h1f9;
              5'h0b: out_low = 10'h201;
              5'h0c: out_low = 10'h209;
              5'h0d: out_low = 10'h212;
              5'h0e: out_low = 10'h21a;
              5'h0f: out_low = 10'h223;
              5'h10: out_low = 10'h22b;
              5'h11: out_low = 10'h234;
              5'h12: out_low = 10'h23c;
              5'h13: out_low = 10'h245;
              5'h14: out_low = 10'h24e;
              5'h15: out_low = 10'h257;
              5'h16: out_low = 10'h25f;
              5'h17: out_low = 10'h268;
              5'h18: out_low = 10'h271;
              5'h19: out_low = 10'h27a;
              5'h1a: out_low = 10'h283;
              5'h1b: out_low = 10'h28c;
              5'h1c: out_low = 10'h295;
              5'h1d: out_low = 10'h29e;
              5'h1e: out_low = 10'h2a8;
              5'h1f: out_low = 10'h2b1;
              default: out_low = 10'h000;
            endcase
          end
          5'h1f: begin
            case (mant[4:0])
              5'h00: out_low = 10'h2ba;
              5'h01: out_low = 10'h2c4;
              5'h02: out_low = 10'h2cd;
              5'h03: out_low = 10'h2d6;
              5'h04: out_low = 10'h2e0;
              5'h05: out_low = 10'h2e9;
              5'h06: out_low = 10'h2f3;
              5'h07: out_low = 10'h2fd;
              5'h08: out_low = 10'h306;
              5'h09: out_low = 10'h310;
              5'h0a: out_low = 10'h31a;
              5'h0b: out_low = 10'h324;
              5'h0c: out_low = 10'h32e;
              5'h0d: out_low = 10'h338;
              5'h0e: out_low = 10'h342;
              5'h0f: out_low = 10'h34c;
              5'h10: out_low = 10'h356;
              5'h11: out_low = 10'h360;
              5'h12: out_low = 10'h36a;
              5'h13: out_low = 10'h375;
              5'h14: out_low = 10'h37f;
              5'h15: out_low = 10'h38a;
              5'h16: out_low = 10'h394;
              5'h17: out_low = 10'h39f;
              5'h18: out_low = 10'h3a9;
              5'h19: out_low = 10'h3b4;
              5'h1a: out_low = 10'h3bf;
              5'h1b: out_low = 10'h3c9;
              5'h1c: out_low = 10'h3d4;
              5'h1d: out_low = 10'h3df;
              5'h1e: out_low = 10'h3ea;
              5'h1f: out_low = 10'h3f5;
              default: out_low = 10'h000;
            endcase
          end
          default: out_low = 10'h000;
        endcase
      end
      6'h1f: begin
        case (mant[9:5])
          5'h00: begin
            case (mant[4:0])
              5'h00: out_low = 10'h000;
              5'h01: out_low = 10'h200;
              5'h02: out_low = 10'h200;
              5'h03: out_low = 10'h200;
              5'h04: out_low = 10'h200;
              5'h05: out_low = 10'h200;
              5'h06: out_low = 10'h200;
              5'h07: out_low = 10'h200;
              5'h08: out_low = 10'h200;
              5'h09: out_low = 10'h200;
              5'h0a: out_low = 10'h200;
              5'h0b: out_low = 10'h200;
              5'h0c: out_low = 10'h200;
              5'h0d: out_low = 10'h200;
              5'h0e: out_low = 10'h200;
              5'h0f: out_low = 10'h200;
              5'h10: out_low = 10'h200;
              5'h11: out_low = 10'h200;
              5'h12: out_low = 10'h200;
              5'h13: out_low = 10'h200;
              5'h14: out_low = 10'h200;
              5'h15: out_low = 10'h200;
              5'h16: out_low = 10'h200;
              5'h17: out_low = 10'h200;
              5'h18: out_low = 10'h200;
              5'h19: out_low = 10'h200;
              5'h1a: out_low = 10'h200;
              5'h1b: out_low = 10'h200;
              5'h1c: out_low = 10'h200;
              5'h1d: out_low = 10'h200;
              5'h1e: out_low = 10'h200;
              5'h1f: out_low = 10'h200;
              default: out_low = 10'h000;
            endcase
          end
          5'h01: out_low = 10'h200;
          5'h02: out_low = 10'h200;
          5'h03: out_low = 10'h200;
          5'h04: out_low = 10'h200;
          5'h05: out_low = 10'h200;
          5'h06: out_low = 10'h200;
          5'h07: out_low = 10'h200;
          5'h08: out_low = 10'h200;
          5'h09: out_low = 10'h200;
          5'h0a: out_low = 10'h200;
          5'h0b: out_low = 10'h200;
          5'h0c: out_low = 10'h200;
          5'h0d: out_low = 10'h200;
          5'h0e: out_low = 10'h200;
          5'h0f: out_low = 10'h200;
          5'h10: out_low = 10'h200;
          5'h11: out_low = 10'h200;
          5'h12: out_low = 10'h200;
          5'h13: out_low = 10'h200;
          5'h14: out_low = 10'h200;
          5'h15: out_low = 10'h200;
          5'h16: out_low = 10'h200;
          5'h17: out_low = 10'h200;
          5'h18: out_low = 10'h200;
          5'h19: out_low = 10'h200;
          5'h1a: out_low = 10'h200;
          5'h1b: out_low = 10'h200;
          5'h1c: out_low = 10'h200;
          5'h1d: out_low = 10'h200;
          5'h1e: out_low = 10'h200;
          5'h1f: out_low = 10'h200;
          default: out_low = 10'h000;
        endcase
      end
      6'h23: begin
        case (mant[9:5])
          5'h00: out_low = 10'h000;
          5'h01: out_low = 10'h000;
          5'h02: out_low = 10'h000;
          5'h03: out_low = 10'h000;
          5'h04: out_low = 10'h000;
          5'h05: out_low = 10'h000;
          5'h06: out_low = 10'h000;
          5'h07: out_low = 10'h000;
          5'h08: out_low = 10'h000;
          5'h09: out_low = 10'h000;
          5'h0a: out_low = 10'h000;
          5'h0b: out_low = 10'h000;
          5'h0c: out_low = 10'h000;
          5'h0d: out_low = 10'h000;
          5'h0e: begin
            case (mant[4:0])
              5'h00: out_low = 10'h000;
              5'h01: out_low = 10'h000;
              5'h02: out_low = 10'h000;
              5'h03: out_low = 10'h000;
              5'h04: out_low = 10'h000;
              5'h05: out_low = 10'h000;
              5'h06: out_low = 10'h3ff;
              5'h07: out_low = 10'h3ff;
              5'h08: out_low = 10'h3ff;
              5'h09: out_low = 10'h3ff;
              5'h0a: out_low = 10'h3ff;
              5'h0b: out_low = 10'h3ff;
              5'h0c: out_low = 10'h3ff;
              5'h0d: out_low = 10'h3ff;
              5'h0e: out_low = 10'h3ff;
              5'h0f: out_low = 10'h3ff;
              5'h10: out_low = 10'h3ff;
              5'h11: out_low = 10'h3ff;
              5'h12: out_low = 10'h3ff;
              5'h13: out_low = 10'h3ff;
              5'h14: out_low = 10'h3ff;
              5'h15: out_low = 10'h3ff;
              5'h16: out_low = 10'h3ff;
              5'h17: out_low = 10'h3ff;
              5'h18: out_low = 10'h3ff;
              5'h19: out_low = 10'h3ff;
              5'h1a: out_low = 10'h3ff;
              5'h1b: out_low = 10'h3ff;
              5'h1c: out_low = 10'h3ff;
              5'h1d: out_low = 10'h3ff;
              5'h1e: out_low = 10'h3ff;
              5'h1f: out_low = 10'h3ff;
              default: out_low = 10'h000;
            endcase
          end
          5'h0f: out_low = 10'h3ff;
          5'h10: out_low = 10'h3ff;
          5'h11: out_low = 10'h3ff;
          5'h12: out_low = 10'h3ff;
          5'h13: out_low = 10'h3ff;
          5'h14: out_low = 10'h3ff;
          5'h15: out_low = 10'h3ff;
          5'h16: out_low = 10'h3ff;
          5'h17: out_low = 10'h3ff;
          5'h18: out_low = 10'h3ff;
          5'h19: out_low = 10'h3ff;
          5'h1a: out_low = 10'h3ff;
          5'h1b: out_low = 10'h3ff;
          5'h1c: out_low = 10'h3ff;
          5'h1d: out_low = 10'h3ff;
          5'h1e: out_low = 10'h3ff;
          5'h1f: out_low = 10'h3ff;
          default: out_low = 10'h000;
        endcase
      end
      6'h25: begin
        case (mant[9:5])
          5'h00: out_low = 10'h3ff;
          5'h01: out_low = 10'h3ff;
          5'h02: begin
            case (mant[4:0])
              5'h00: out_low = 10'h3ff;
              5'h01: out_low = 10'h3ff;
              5'h02: out_low = 10'h3ff;
              5'h03: out_low = 10'h3ff;
              5'h04: out_low = 10'h3ff;
              5'h05: out_low = 10'h3ff;
              5'h06: out_low = 10'h3ff;
              5'h07: out_low = 10'h3ff;
              5'h08: out_low = 10'h3ff;
              5'h09: out_low = 10'h3ff;
              5'h0a: out_low = 10'h3ff;
              5'h0b: out_low = 10'h3ff;
              5'h0c: out_low = 10'h3ff;
              5'h0d: out_low = 10'h3ff;
              5'h0e: out_low = 10'h3ff;
              5'h0f: out_low = 10'h3ff;
              5'h10: out_low = 10'h3ff;
              5'h11: out_low = 10'h3ff;
              5'h12: out_low = 10'h3ff;
              5'h13: out_low = 10'h3ff;
              5'h14: out_low = 10'h3ff;
              5'h15: out_low = 10'h3fe;
              5'h16: out_low = 10'h3fe;
              5'h17: out_low = 10'h3fe;
              5'h18: out_low = 10'h3fe;
              5'h19: out_low = 10'h3fe;
              5'h1a: out_low = 10'h3fe;
              5'h1b: out_low = 10'h3fe;
              5'h1c: out_low = 10'h3fe;
              5'h1d: out_low = 10'h3fe;
              5'h1e: out_low = 10'h3fe;
              5'h1f: out_low = 10'h3fe;
              default: out_low = 10'h000;
            endcase
          end
          5'h03: out_low = 10'h3fe;
          5'h04: out_low = 10'h3fe;
          5'h05: out_low = 10'h3fe;
          5'h06: out_low = 10'h3fe;
          5'h07: out_low = 10'h3fe;
          5'h08: out_low = 10'h3fe;
          5'h09: out_low = 10'h3fe;
          5'h0a: out_low = 10'h3fe;
          5'h0b: out_low = 10'h3fe;
          5'h0c: out_low = 10'h3fe;
          5'h0d: out_low = 10'h3fe;
          5'h0e: out_low = 10'h3fe;
          5'h0f: out_low = 10'h3fe;
          5'h10: out_low = 10'h3fe;
          5'h11: out_low = 10'h3fe;
          5'h12: out_low = 10'h3fe;
          5'h13: out_low = 10'h3fe;
          5'h14: out_low = 10'h3fe;
          5'h15: out_low = 10'h3fe;
          5'h16: out_low = 10'h3fe;
          5'h17: out_low = 10'h3fe;
          5'h18: out_low = 10'h3fe;
          5'h19: begin
            case (mant[4:0])
              5'h00: out_low = 10'h3fe;
              5'h01: out_low = 10'h3fe;
              5'h02: out_low = 10'h3fe;
              5'h03: out_low = 10'h3fe;
              5'h04: out_low = 10'h3fe;
              5'h05: out_low = 10'h3fe;
              5'h06: out_low = 10'h3fe;
              5'h07: out_low = 10'h3fe;
              5'h08: out_low = 10'h3fe;
              5'h09: out_low = 10'h3fe;
              5'h0a: out_low = 10'h3fe;
              5'h0b: out_low = 10'h3fe;
              5'h0c: out_low = 10'h3fe;
              5'h0d: out_low = 10'h3fe;
              5'h0e: out_low = 10'h3fe;
              5'h0f: out_low = 10'h3fe;
              5'h10: out_low = 10'h3fe;
              5'h11: out_low = 10'h3fe;
              5'h12: out_low = 10'h3fe;
              5'h13: out_low = 10'h3fe;
              5'h14: out_low = 10'h3fe;
              5'h15: out_low = 10'h3fe;
              5'h16: out_low = 10'h3fe;
              5'h17: out_low = 10'h3fe;
              5'h18: out_low = 10'h3fd;
              5'h19: out_low = 10'h3fd;
              5'h1a: out_low = 10'h3fd;
              5'h1b: out_low = 10'h3fd;
              5'h1c: out_low = 10'h3fd;
              5'h1d: out_low = 10'h3fd;
              5'h1e: out_low = 10'h3fd;
              5'h1f: out_low = 10'h3fd;
              default: out_low = 10'h000;
            endcase
          end
          5'h1a: out_low = 10'h3fd;
          5'h1b: out_low = 10'h3fd;
          5'h1c: out_low = 10'h3fd;
          5'h1d: out_low = 10'h3fd;
          5'h1e: out_low = 10'h3fd;
          5'h1f: out_low = 10'h3fd;
          default: out_low = 10'h000;
        endcase
      end
      6'h26: begin
        case (mant[9:5])
          5'h00: out_low = 10'h3fd;
          5'h01: out_low = 10'h3fd;
          5'h02: out_low = 10'h3fd;
          5'h03: out_low = 10'h3fd;
          5'h04: out_low = 10'h3fd;
          5'h05: out_low = 10'h3fd;
          5'h06: out_low = 10'h3fd;
          5'h07: out_low = 10'h3fd;
          5'h08: begin
            case (mant[4:0])
              5'h00: out_low = 10'h3fd;
              5'h01: out_low = 10'h3fd;
              5'h02: out_low = 10'h3fd;
              5'h03: out_low = 10'h3fd;
              5'h04: out_low = 10'h3fd;
              5'h05: out_low = 10'h3fd;
              5'h06: out_low = 10'h3fd;
              5'h07: out_low = 10'h3fd;
              5'h08: out_low = 10'h3fd;
              5'h09: out_low = 10'h3fd;
              5'h0a: out_low = 10'h3fd;
              5'h0b: out_low = 10'h3fd;
              5'h0c: out_low = 10'h3fd;
              5'h0d: out_low = 10'h3fd;
              5'h0e: out_low = 10'h3fc;
              5'h0f: out_low = 10'h3fc;
              5'h10: out_low = 10'h3fc;
              5'h11: out_low = 10'h3fc;
              5'h12: out_low = 10'h3fc;
              5'h13: out_low = 10'h3fc;
              5'h14: out_low = 10'h3fc;
              5'h15: out_low = 10'h3fc;
              5'h16: out_low = 10'h3fc;
              5'h17: out_low = 10'h3fc;
              5'h18: out_low = 10'h3fc;
              5'h19: out_low = 10'h3fc;
              5'h1a: out_low = 10'h3fc;
              5'h1b: out_low = 10'h3fc;
              5'h1c: out_low = 10'h3fc;
              5'h1d: out_low = 10'h3fc;
              5'h1e: out_low = 10'h3fc;
              5'h1f: out_low = 10'h3fc;
              default: out_low = 10'h000;
            endcase
          end
          5'h09: out_low = 10'h3fc;
          5'h0a: out_low = 10'h3fc;
          5'h0b: out_low = 10'h3fc;
          5'h0c: out_low = 10'h3fc;
          5'h0d: out_low = 10'h3fc;
          5'h0e: out_low = 10'h3fc;
          5'h0f: out_low = 10'h3fc;
          5'h10: out_low = 10'h3fc;
          5'h11: out_low = 10'h3fc;
          5'h12: out_low = 10'h3fc;
          5'h13: out_low = 10'h3fc;
          5'h14: out_low = 10'h3fb;
          5'h15: out_low = 10'h3fb;
          5'h16: out_low = 10'h3fb;
          5'h17: out_low = 10'h3fb;
          5'h18: out_low = 10'h3fb;
          5'h19: out_low = 10'h3fb;
          5'h1a: out_low = 10'h3fb;
          5'h1b: out_low = 10'h3fb;
          5'h1c: out_low = 10'h3fb;
          5'h1d: out_low = 10'h3fb;
          5'h1e: out_low = 10'h3fb;
          5'h1f: begin
            case (mant[4:0])
              5'h00: out_low = 10'h3fb;
              5'h01: out_low = 10'h3fb;
              5'h02: out_low = 10'h3fb;
              5'h03: out_low = 10'h3fb;
              5'h04: out_low = 10'h3fb;
              5'h05: out_low = 10'h3fb;
              5'h06: out_low = 10'h3fb;
              5'h07: out_low = 10'h3fb;
              5'h08: out_low = 10'h3fb;
              5'h09: out_low = 10'h3fb;
              5'h0a: out_low = 10'h3fb;
              5'h0b: out_low = 10'h3fb;
              5'h0c: out_low = 10'h3fb;
              5'h0d: out_low = 10'h3fb;
              5'h0e: out_low = 10'h3fb;
              5'h0f: out_low = 10'h3fb;
              5'h10: out_low = 10'h3fb;
              5'h11: out_low = 10'h3fb;
              5'h12: out_low = 10'h3fb;
              5'h13: out_low = 10'h3fa;
              5'h14: out_low = 10'h3fa;
              5'h15: out_low = 10'h3fa;
              5'h16: out_low = 10'h3fa;
              5'h17: out_low = 10'h3fa;
              5'h18: out_low = 10'h3fa;
              5'h19: out_low = 10'h3fa;
              5'h1a: out_low = 10'h3fa;
              5'h1b: out_low = 10'h3fa;
              5'h1c: out_low = 10'h3fa;
              5'h1d: out_low = 10'h3fa;
              5'h1e: out_low = 10'h3fa;
              5'h1f: out_low = 10'h3fa;
              default: out_low = 10'h000;
            endcase
          end
          default: out_low = 10'h000;
        endcase
      end
      6'h27: begin
        case (mant[9:5])
          5'h00: out_low = 10'h3fa;
          5'h01: out_low = 10'h3fa;
          5'h02: out_low = 10'h3fa;
          5'h03: out_low = 10'h3fa;
          5'h04: out_low = 10'h3fa;
          5'h05: begin
            case (mant[4:0])
              5'h00: out_low = 10'h3fa;
              5'h01: out_low = 10'h3fa;
              5'h02: out_low = 10'h3fa;
              5'h03: out_low = 10'h3fa;
              5'h04: out_low = 10'h3fa;
              5'h05: out_low = 10'h3fa;
              5'h06: out_low = 10'h3fa;
              5'h07: out_low = 10'h3fa;
              5'h08: out_low = 10'h3fa;
              5'h09: out_low = 10'h3fa;
              5'h0a: out_low = 10'h3fa;
              5'h0b: out_low = 10'h3fa;
              5'h0c: out_low = 10'h3fa;
              5'h0d: out_low = 10'h3fa;
              5'h0e: out_low = 10'h3fa;
              5'h0f: out_low = 10'h3fa;
              5'h10: out_low = 10'h3fa;
              5'h11: out_low = 10'h3fa;
              5'h12: out_low = 10'h3fa;
              5'h13: out_low = 10'h3f9;
              5'h14: out_low = 10'h3f9;
              5'h15: out_low = 10'h3f9;
              5'h16: out_low = 10'h3f9;
              5'h17: out_low = 10'h3f9;
              5'h18: out_low = 10'h3f9;
              5'h19: out_low = 10'h3f9;
              5'h1a: out_low = 10'h3f9;
              5'h1b: out_low = 10'h3f9;
              5'h1c: out_low = 10'h3f9;
              5'h1d: out_low = 10'h3f9;
              5'h1e: out_low = 10'h3f9;
              5'h1f: out_low = 10'h3f9;
              default: out_low = 10'h000;
            endcase
          end
          5'h06: out_low = 10'h3f9;
          5'h07: out_low = 10'h3f9;
          5'h08: out_low = 10'h3f9;
          5'h09: out_low = 10'h3f9;
          5'h0a: out_low = 10'h3f9;
          5'h0b: begin
            case (mant[4:0])
              5'h00: out_low = 10'h3f9;
              5'h01: out_low = 10'h3f9;
              5'h02: out_low = 10'h3f9;
              5'h03: out_low = 10'h3f9;
              5'h04: out_low = 10'h3f9;
              5'h05: out_low = 10'h3f9;
              5'h06: out_low = 10'h3f9;
              5'h07: out_low = 10'h3f9;
              5'h08: out_low = 10'h3f9;
              5'h09: out_low = 10'h3f9;
              5'h0a: out_low = 10'h3f9;
              5'h0b: out_low = 10'h3f9;
              5'h0c: out_low = 10'h3f8;
              5'h0d: out_low = 10'h3f8;
              5'h0e: out_low = 10'h3f8;
              5'h0f: out_low = 10'h3f8;
              5'h10: out_low = 10'h3f8;
              5'h11: out_low = 10'h3f8;
              5'h12: out_low = 10'h3f8;
              5'h13: out_low = 10'h3f8;
              5'h14: out_low = 10'h3f8;
              5'h15: out_low = 10'h3f8;
              5'h16: out_low = 10'h3f8;
              5'h17: out_low = 10'h3f8;
              5'h18: out_low = 10'h3f8;
              5'h19: out_low = 10'h3f8;
              5'h1a: out_low = 10'h3f8;
              5'h1b: out_low = 10'h3f8;
              5'h1c: out_low = 10'h3f8;
              5'h1d: out_low = 10'h3f8;
              5'h1e: out_low = 10'h3f8;
              5'h1f: out_low = 10'h3f8;
              default: out_low = 10'h000;
            endcase
          end
          5'h0c: out_low = 10'h3f8;
          5'h0d: out_low = 10'h3f8;
          5'h0e: out_low = 10'h3f8;
          5'h0f: out_low = 10'h3f8;
          5'h10: out_low = 10'h3f8;
          5'h11: begin
            case (mant[4:0])
              5'h00: out_low = 10'h3f8;
              5'h01: out_low = 10'h3f8;
              5'h02: out_low = 10'h3f8;
              5'h03: out_low = 10'h3f8;
              5'h04: out_low = 10'h3f8;
              5'h05: out_low = 10'h3f7;
              5'h06: out_low = 10'h3f7;
              5'h07: out_low = 10'h3f7;
              5'h08: out_low = 10'h3f7;
              5'h09: out_low = 10'h3f7;
              5'h0a: out_low = 10'h3f7;
              5'h0b: out_low = 10'h3f7;
              5'h0c: out_low = 10'h3f7;
              5'h0d: out_low = 10'h3f7;
              5'h0e: out_low = 10'h3f7;
              5'h0f: out_low = 10'h3f7;
              5'h10: out_low = 10'h3f7;
              5'h11: out_low = 10'h3f7;
              5'h12: out_low = 10'h3f7;
              5'h13: out_low = 10'h3f7;
              5'h14: out_low = 10'h3f7;
              5'h15: out_low = 10'h3f7;
              5'h16: out_low = 10'h3f7;
              5'h17: out_low = 10'h3f7;
              5'h18: out_low = 10'h3f7;
              5'h19: out_low = 10'h3f7;
              5'h1a: out_low = 10'h3f7;
              5'h1b: out_low = 10'h3f7;
              5'h1c: out_low = 10'h3f7;
              5'h1d: out_low = 10'h3f7;
              5'h1e: out_low = 10'h3f7;
              5'h1f: out_low = 10'h3f7;
              default: out_low = 10'h000;
            endcase
          end
          5'h12: out_low = 10'h3f7;
          5'h13: out_low = 10'h3f7;
          5'h14: out_low = 10'h3f7;
          5'h15: out_low = 10'h3f7;
          5'h16: begin
            case (mant[4:0])
              5'h00: out_low = 10'h3f7;
              5'h01: out_low = 10'h3f7;
              5'h02: out_low = 10'h3f7;
              5'h03: out_low = 10'h3f7;
              5'h04: out_low = 10'h3f7;
              5'h05: out_low = 10'h3f7;
              5'h06: out_low = 10'h3f7;
              5'h07: out_low = 10'h3f7;
              5'h08: out_low = 10'h3f7;
              5'h09: out_low = 10'h3f7;
              5'h0a: out_low = 10'h3f7;
              5'h0b: out_low = 10'h3f7;
              5'h0c: out_low = 10'h3f7;
              5'h0d: out_low = 10'h3f7;
              5'h0e: out_low = 10'h3f7;
              5'h0f: out_low = 10'h3f7;
              5'h10: out_low = 10'h3f7;
              5'h11: out_low = 10'h3f7;
              5'h12: out_low = 10'h3f7;
              5'h13: out_low = 10'h3f7;
              5'h14: out_low = 10'h3f7;
              5'h15: out_low = 10'h3f7;
              5'h16: out_low = 10'h3f7;
              5'h17: out_low = 10'h3f7;
              5'h18: out_low = 10'h3f7;
              5'h19: out_low = 10'h3f7;
              5'h1a: out_low = 10'h3f7;
              5'h1b: out_low = 10'h3f7;
              5'h1c: out_low = 10'h3f7;
              5'h1d: out_low = 10'h3f7;
              5'h1e: out_low = 10'h3f7;
              5'h1f: out_low = 10'h3f6;
              default: out_low = 10'h000;
            endcase
          end
          5'h17: out_low = 10'h3f6;
          5'h18: out_low = 10'h3f6;
          5'h19: out_low = 10'h3f6;
          5'h1a: out_low = 10'h3f6;
          5'h1b: out_low = 10'h3f6;
          5'h1c: begin
            case (mant[4:0])
              5'h00: out_low = 10'h3f6;
              5'h01: out_low = 10'h3f6;
              5'h02: out_low = 10'h3f6;
              5'h03: out_low = 10'h3f6;
              5'h04: out_low = 10'h3f6;
              5'h05: out_low = 10'h3f6;
              5'h06: out_low = 10'h3f6;
              5'h07: out_low = 10'h3f6;
              5'h08: out_low = 10'h3f6;
              5'h09: out_low = 10'h3f6;
              5'h0a: out_low = 10'h3f6;
              5'h0b: out_low = 10'h3f6;
              5'h0c: out_low = 10'h3f6;
              5'h0d: out_low = 10'h3f6;
              5'h0e: out_low = 10'h3f6;
              5'h0f: out_low = 10'h3f6;
              5'h10: out_low = 10'h3f6;
              5'h11: out_low = 10'h3f6;
              5'h12: out_low = 10'h3f6;
              5'h13: out_low = 10'h3f6;
              5'h14: out_low = 10'h3f6;
              5'h15: out_low = 10'h3f6;
              5'h16: out_low = 10'h3f6;
              5'h17: out_low = 10'h3f6;
              5'h18: out_low = 10'h3f5;
              5'h19: out_low = 10'h3f5;
              5'h1a: out_low = 10'h3f5;
              5'h1b: out_low = 10'h3f5;
              5'h1c: out_low = 10'h3f5;
              5'h1d: out_low = 10'h3f5;
              5'h1e: out_low = 10'h3f5;
              5'h1f: out_low = 10'h3f5;
              default: out_low = 10'h000;
            endcase
          end
          5'h1d: out_low = 10'h3f5;
          5'h1e: out_low = 10'h3f5;
          5'h1f: out_low = 10'h3f5;
          default: out_low = 10'h000;
        endcase
      end
      6'h28: begin
        case (mant[9:5])
          5'h00: out_low = 10'h3f5;
          5'h01: begin
            case (mant[4:0])
              5'h00: out_low = 10'h3f5;
              5'h01: out_low = 10'h3f5;
              5'h02: out_low = 10'h3f5;
              5'h03: out_low = 10'h3f5;
              5'h04: out_low = 10'h3f5;
              5'h05: out_low = 10'h3f5;
              5'h06: out_low = 10'h3f5;
              5'h07: out_low = 10'h3f5;
              5'h08: out_low = 10'h3f5;
              5'h09: out_low = 10'h3f4;
              5'h0a: out_low = 10'h3f4;
              5'h0b: out_low = 10'h3f4;
              5'h0c: out_low = 10'h3f4;
              5'h0d: out_low = 10'h3f4;
              5'h0e: out_low = 10'h3f4;
              5'h0f: out_low = 10'h3f4;
              5'h10: out_low = 10'h3f4;
              5'h11: out_low = 10'h3f4;
              5'h12: out_low = 10'h3f4;
              5'h13: out_low = 10'h3f4;
              5'h14: out_low = 10'h3f4;
              5'h15: out_low = 10'h3f4;
              5'h16: out_low = 10'h3f4;
              5'h17: out_low = 10'h3f4;
              5'h18: out_low = 10'h3f4;
              5'h19: out_low = 10'h3f4;
              5'h1a: out_low = 10'h3f4;
              5'h1b: out_low = 10'h3f4;
              5'h1c: out_low = 10'h3f4;
              5'h1d: out_low = 10'h3f4;
              5'h1e: out_low = 10'h3f4;
              5'h1f: out_low = 10'h3f4;
              default: out_low = 10'h000;
            endcase
          end
          5'h02: out_low = 10'h3f4;
          5'h03: out_low = 10'h3f4;
          5'h04: begin
            case (mant[4:0])
              5'h00: out_low = 10'h3f4;
              5'h01: out_low = 10'h3f4;
              5'h02: out_low = 10'h3f4;
              5'h03: out_low = 10'h3f4;
              5'h04: out_low = 10'h3f4;
              5'h05: out_low = 10'h3f4;
              5'h06: out_low = 10'h3f3;
              5'h07: out_low = 10'h3f3;
              5'h08: out_low = 10'h3f3;
              5'h09: out_low = 10'h3f3;
              5'h0a: out_low = 10'h3f3;
              5'h0b: out_low = 10'h3f3;
              5'h0c: out_low = 10'h3f3;
              5'h0d: out_low = 10'h3f3;
              5'h0e: out_low = 10'h3f3;
              5'h0f: out_low = 10'h3f3;
              5'h10: out_low = 10'h3f3;
              5'h11: out_low = 10'h3f3;
              5'h12: out_low = 10'h3f3;
              5'h13: out_low = 10'h3f3;
              5'h14: out_low = 10'h3f3;
              5'h15: out_low = 10'h3f3;
              5'h16: out_low = 10'h3f3;
              5'h17: out_low = 10'h3f3;
              5'h18: out_low = 10'h3f3;
              5'h19: out_low = 10'h3f3;
              5'h1a: out_low = 10'h3f3;
              5'h1b: out_low = 10'h3f3;
              5'h1c: out_low = 10'h3f3;
              5'h1d: out_low = 10'h3f3;
              5'h1e: out_low = 10'h3f3;
              5'h1f: out_low = 10'h3f3;
              default: out_low = 10'h000;
            endcase
          end
          5'h05: out_low = 10'h3f3;
          5'h06: out_low = 10'h3f3;
          5'h07: begin
            case (mant[4:0])
              5'h00: out_low = 10'h3f3;
              5'h01: out_low = 10'h3f3;
              5'h02: out_low = 10'h3f3;
              5'h03: out_low = 10'h3f2;
              5'h04: out_low = 10'h3f2;
              5'h05: out_low = 10'h3f2;
              5'h06: out_low = 10'h3f2;
              5'h07: out_low = 10'h3f2;
              5'h08: out_low = 10'h3f2;
              5'h09: out_low = 10'h3f2;
              5'h0a: out_low = 10'h3f2;
              5'h0b: out_low = 10'h3f2;
              5'h0c: out_low = 10'h3f2;
              5'h0d: out_low = 10'h3f2;
              5'h0e: out_low = 10'h3f2;
              5'h0f: out_low = 10'h3f2;
              5'h10: out_low = 10'h3f2;
              5'h11: out_low = 10'h3f2;
              5'h12: out_low = 10'h3f2;
              5'h13: out_low = 10'h3f2;
              5'h14: out_low = 10'h3f2;
              5'h15: out_low = 10'h3f2;
              5'h16: out_low = 10'h3f2;
              5'h17: out_low = 10'h3f2;
              5'h18: out_low = 10'h3f2;
              5'h19: out_low = 10'h3f2;
              5'h1a: out_low = 10'h3f2;
              5'h1b: out_low = 10'h3f2;
              5'h1c: out_low = 10'h3f2;
              5'h1d: out_low = 10'h3f2;
              5'h1e: out_low = 10'h3f2;
              5'h1f: out_low = 10'h3f2;
              default: out_low = 10'h000;
            endcase
          end
          5'h08: out_low = 10'h3f2;
          5'h09: out_low = 10'h3f2;
          5'h0a: out_low = 10'h3f1;
          5'h0b: out_low = 10'h3f1;
          5'h0c: begin
            case (mant[4:0])
              5'h00: out_low = 10'h3f1;
              5'h01: out_low = 10'h3f1;
              5'h02: out_low = 10'h3f1;
              5'h03: out_low = 10'h3f1;
              5'h04: out_low = 10'h3f1;
              5'h05: out_low = 10'h3f1;
              5'h06: out_low = 10'h3f1;
              5'h07: out_low = 10'h3f1;
              5'h08: out_low = 10'h3f1;
              5'h09: out_low = 10'h3f1;
              5'h0a: out_low = 10'h3f1;
              5'h0b: out_low = 10'h3f1;
              5'h0c: out_low = 10'h3f1;
              5'h0d: out_low = 10'h3f1;
              5'h0e: out_low = 10'h3f1;
              5'h0f: out_low = 10'h3f1;
              5'h10: out_low = 10'h3f1;
              5'h11: out_low = 10'h3f1;
              5'h12: out_low = 10'h3f1;
              5'h13: out_low = 10'h3f1;
              5'h14: out_low = 10'h3f1;
              5'h15: out_low = 10'h3f1;
              5'h16: out_low = 10'h3f1;
              5'h17: out_low = 10'h3f1;
              5'h18: out_low = 10'h3f1;
              5'h19: out_low = 10'h3f1;
              5'h1a: out_low = 10'h3f1;
              5'h1b: out_low = 10'h3f1;
              5'h1c: out_low = 10'h3f1;
              5'h1d: out_low = 10'h3f0;
              5'h1e: out_low = 10'h3f0;
              5'h1f: out_low = 10'h3f0;
              default: out_low = 10'h000;
            endcase
          end
          5'h0d: out_low = 10'h3f0;
          5'h0e: out_low = 10'h3f0;
          5'h0f: begin
            case (mant[4:0])
              5'h00: out_low = 10'h3f0;
              5'h01: out_low = 10'h3f0;
              5'h02: out_low = 10'h3f0;
              5'h03: out_low = 10'h3f0;
              5'h04: out_low = 10'h3f0;
              5'h05: out_low = 10'h3f0;
              5'h06: out_low = 10'h3f0;
              5'h07: out_low = 10'h3f0;
              5'h08: out_low = 10'h3f0;
              5'h09: out_low = 10'h3f0;
              5'h0a: out_low = 10'h3f0;
              5'h0b: out_low = 10'h3f0;
              5'h0c: out_low = 10'h3f0;
              5'h0d: out_low = 10'h3f0;
              5'h0e: out_low = 10'h3f0;
              5'h0f: out_low = 10'h3f0;
              5'h10: out_low = 10'h3f0;
              5'h11: out_low = 10'h3f0;
              5'h12: out_low = 10'h3f0;
              5'h13: out_low = 10'h3f0;
              5'h14: out_low = 10'h3f0;
              5'h15: out_low = 10'h3f0;
              5'h16: out_low = 10'h3f0;
              5'h17: out_low = 10'h3f0;
              5'h18: out_low = 10'h3f0;
              5'h19: out_low = 10'h3f0;
              5'h1a: out_low = 10'h3ef;
              5'h1b: out_low = 10'h3ef;
              5'h1c: out_low = 10'h3ef;
              5'h1d: out_low = 10'h3ef;
              5'h1e: out_low = 10'h3ef;
              5'h1f: out_low = 10'h3ef;
              default: out_low = 10'h000;
            endcase
          end
          5'h10: out_low = 10'h3ef;
          5'h11: out_low = 10'h3ef;
          5'h12: begin
            case (mant[4:0])
              5'h00: out_low = 10'h3ef;
              5'h01: out_low = 10'h3ef;
              5'h02: out_low = 10'h3ef;
              5'h03: out_low = 10'h3ef;
              5'h04: out_low = 10'h3ef;
              5'h05: out_low = 10'h3ef;
              5'h06: out_low = 10'h3ef;
              5'h07: out_low = 10'h3ef;
              5'h08: out_low = 10'h3ef;
              5'h09: out_low = 10'h3ef;
              5'h0a: out_low = 10'h3ef;
              5'h0b: out_low = 10'h3ef;
              5'h0c: out_low = 10'h3ef;
              5'h0d: out_low = 10'h3ef;
              5'h0e: out_low = 10'h3ef;
              5'h0f: out_low = 10'h3ef;
              5'h10: out_low = 10'h3ef;
              5'h11: out_low = 10'h3ef;
              5'h12: out_low = 10'h3ef;
              5'h13: out_low = 10'h3ef;
              5'h14: out_low = 10'h3ef;
              5'h15: out_low = 10'h3ef;
              5'h16: out_low = 10'h3ef;
              5'h17: out_low = 10'h3ee;
              5'h18: out_low = 10'h3ee;
              5'h19: out_low = 10'h3ee;
              5'h1a: out_low = 10'h3ee;
              5'h1b: out_low = 10'h3ee;
              5'h1c: out_low = 10'h3ee;
              5'h1d: out_low = 10'h3ee;
              5'h1e: out_low = 10'h3ee;
              5'h1f: out_low = 10'h3ee;
              default: out_low = 10'h000;
            endcase
          end
          5'h13: out_low = 10'h3ee;
          5'h14: out_low = 10'h3ee;
          5'h15: begin
            case (mant[4:0])
              5'h00: out_low = 10'h3ee;
              5'h01: out_low = 10'h3ee;
              5'h02: out_low = 10'h3ee;
              5'h03: out_low = 10'h3ee;
              5'h04: out_low = 10'h3ee;
              5'h05: out_low = 10'h3ee;
              5'h06: out_low = 10'h3ee;
              5'h07: out_low = 10'h3ee;
              5'h08: out_low = 10'h3ee;
              5'h09: out_low = 10'h3ee;
              5'h0a: out_low = 10'h3ee;
              5'h0b: out_low = 10'h3ee;
              5'h0c: out_low = 10'h3ee;
              5'h0d: out_low = 10'h3ee;
              5'h0e: out_low = 10'h3ee;
              5'h0f: out_low = 10'h3ee;
              5'h10: out_low = 10'h3ee;
              5'h11: out_low = 10'h3ee;
              5'h12: out_low = 10'h3ee;
              5'h13: out_low = 10'h3ee;
              5'h14: out_low = 10'h3ed;
              5'h15: out_low = 10'h3ed;
              5'h16: out_low = 10'h3ed;
              5'h17: out_low = 10'h3ed;
              5'h18: out_low = 10'h3ed;
              5'h19: out_low = 10'h3ed;
              5'h1a: out_low = 10'h3ed;
              5'h1b: out_low = 10'h3ed;
              5'h1c: out_low = 10'h3ed;
              5'h1d: out_low = 10'h3ed;
              5'h1e: out_low = 10'h3ed;
              5'h1f: out_low = 10'h3ed;
              default: out_low = 10'h000;
            endcase
          end
          5'h16: out_low = 10'h3ed;
          5'h17: out_low = 10'h3ed;
          5'h18: begin
            case (mant[4:0])
              5'h00: out_low = 10'h3ed;
              5'h01: out_low = 10'h3ed;
              5'h02: out_low = 10'h3ed;
              5'h03: out_low = 10'h3ed;
              5'h04: out_low = 10'h3ed;
              5'h05: out_low = 10'h3ed;
              5'h06: out_low = 10'h3ed;
              5'h07: out_low = 10'h3ed;
              5'h08: out_low = 10'h3ed;
              5'h09: out_low = 10'h3ed;
              5'h0a: out_low = 10'h3ed;
              5'h0b: out_low = 10'h3ed;
              5'h0c: out_low = 10'h3ed;
              5'h0d: out_low = 10'h3ed;
              5'h0e: out_low = 10'h3ed;
              5'h0f: out_low = 10'h3ed;
              5'h10: out_low = 10'h3ed;
              5'h11: out_low = 10'h3ed;
              5'h12: out_low = 10'h3ec;
              5'h13: out_low = 10'h3ec;
              5'h14: out_low = 10'h3ec;
              5'h15: out_low = 10'h3ec;
              5'h16: out_low = 10'h3ec;
              5'h17: out_low = 10'h3ec;
              5'h18: out_low = 10'h3ec;
              5'h19: out_low = 10'h3ec;
              5'h1a: out_low = 10'h3ec;
              5'h1b: out_low = 10'h3ec;
              5'h1c: out_low = 10'h3ec;
              5'h1d: out_low = 10'h3ec;
              5'h1e: out_low = 10'h3ec;
              5'h1f: out_low = 10'h3ec;
              default: out_low = 10'h000;
            endcase
          end
          5'h19: out_low = 10'h3ec;
          5'h1a: out_low = 10'h3ec;
          5'h1b: begin
            case (mant[4:0])
              5'h00: out_low = 10'h3ec;
              5'h01: out_low = 10'h3ec;
              5'h02: out_low = 10'h3ec;
              5'h03: out_low = 10'h3ec;
              5'h04: out_low = 10'h3ec;
              5'h05: out_low = 10'h3ec;
              5'h06: out_low = 10'h3ec;
              5'h07: out_low = 10'h3ec;
              5'h08: out_low = 10'h3ec;
              5'h09: out_low = 10'h3ec;
              5'h0a: out_low = 10'h3ec;
              5'h0b: out_low = 10'h3ec;
              5'h0c: out_low = 10'h3ec;
              5'h0d: out_low = 10'h3ec;
              5'h0e: out_low = 10'h3ec;
              5'h0f: out_low = 10'h3eb;
              5'h10: out_low = 10'h3eb;
              5'h11: out_low = 10'h3eb;
              5'h12: out_low = 10'h3eb;
              5'h13: out_low = 10'h3eb;
              5'h14: out_low = 10'h3eb;
              5'h15: out_low = 10'h3eb;
              5'h16: out_low = 10'h3eb;
              5'h17: out_low = 10'h3eb;
              5'h18: out_low = 10'h3eb;
              5'h19: out_low = 10'h3eb;
              5'h1a: out_low = 10'h3eb;
              5'h1b: out_low = 10'h3eb;
              5'h1c: out_low = 10'h3eb;
              5'h1d: out_low = 10'h3eb;
              5'h1e: out_low = 10'h3eb;
              5'h1f: out_low = 10'h3eb;
              default: out_low = 10'h000;
            endcase
          end
          5'h1c: out_low = 10'h3eb;
          5'h1d: out_low = 10'h3eb;
          5'h1e: begin
            case (mant[4:0])
              5'h00: out_low = 10'h3eb;
              5'h01: out_low = 10'h3eb;
              5'h02: out_low = 10'h3eb;
              5'h03: out_low = 10'h3eb;
              5'h04: out_low = 10'h3eb;
              5'h05: out_low = 10'h3eb;
              5'h06: out_low = 10'h3eb;
              5'h07: out_low = 10'h3eb;
              5'h08: out_low = 10'h3eb;
              5'h09: out_low = 10'h3eb;
              5'h0a: out_low = 10'h3eb;
              5'h0b: out_low = 10'h3eb;
              5'h0c: out_low = 10'h3ea;
              5'h0d: out_low = 10'h3ea;
              5'h0e: out_low = 10'h3ea;
              5'h0f: out_low = 10'h3ea;
              5'h10: out_low = 10'h3ea;
              5'h11: out_low = 10'h3ea;
              5'h12: out_low = 10'h3ea;
              5'h13: out_low = 10'h3ea;
              5'h14: out_low = 10'h3ea;
              5'h15: out_low = 10'h3ea;
              5'h16: out_low = 10'h3ea;
              5'h17: out_low = 10'h3ea;
              5'h18: out_low = 10'h3ea;
              5'h19: out_low = 10'h3ea;
              5'h1a: out_low = 10'h3ea;
              5'h1b: out_low = 10'h3ea;
              5'h1c: out_low = 10'h3ea;
              5'h1d: out_low = 10'h3ea;
              5'h1e: out_low = 10'h3ea;
              5'h1f: out_low = 10'h3ea;
              default: out_low = 10'h000;
            endcase
          end
          5'h1f: out_low = 10'h3ea;
          default: out_low = 10'h000;
        endcase
      end
      6'h29: begin
        case (mant[9:5])
          5'h00: begin
            case (mant[4:0])
              5'h00: out_low = 10'h3ea;
              5'h01: out_low = 10'h3ea;
              5'h02: out_low = 10'h3ea;
              5'h03: out_low = 10'h3ea;
              5'h04: out_low = 10'h3ea;
              5'h05: out_low = 10'h3ea;
              5'h06: out_low = 10'h3ea;
              5'h07: out_low = 10'h3ea;
              5'h08: out_low = 10'h3ea;
              5'h09: out_low = 10'h3ea;
              5'h0a: out_low = 10'h3ea;
              5'h0b: out_low = 10'h3ea;
              5'h0c: out_low = 10'h3ea;
              5'h0d: out_low = 10'h3ea;
              5'h0e: out_low = 10'h3ea;
              5'h0f: out_low = 10'h3ea;
              5'h10: out_low = 10'h3ea;
              5'h11: out_low = 10'h3ea;
              5'h12: out_low = 10'h3ea;
              5'h13: out_low = 10'h3ea;
              5'h14: out_low = 10'h3ea;
              5'h15: out_low = 10'h3e9;
              5'h16: out_low = 10'h3e9;
              5'h17: out_low = 10'h3e9;
              5'h18: out_low = 10'h3e9;
              5'h19: out_low = 10'h3e9;
              5'h1a: out_low = 10'h3e9;
              5'h1b: out_low = 10'h3e9;
              5'h1c: out_low = 10'h3e9;
              5'h1d: out_low = 10'h3e9;
              5'h1e: out_low = 10'h3e9;
              5'h1f: out_low = 10'h3e9;
              default: out_low = 10'h000;
            endcase
          end
          5'h01: out_low = 10'h3e9;
          5'h02: begin
            case (mant[4:0])
              5'h00: out_low = 10'h3e9;
              5'h01: out_low = 10'h3e9;
              5'h02: out_low = 10'h3e9;
              5'h03: out_low = 10'h3e9;
              5'h04: out_low = 10'h3e8;
              5'h05: out_low = 10'h3e8;
              5'h06: out_low = 10'h3e8;
              5'h07: out_low = 10'h3e8;
              5'h08: out_low = 10'h3e8;
              5'h09: out_low = 10'h3e8;
              5'h0a: out_low = 10'h3e8;
              5'h0b: out_low = 10'h3e8;
              5'h0c: out_low = 10'h3e8;
              5'h0d: out_low = 10'h3e8;
              5'h0e: out_low = 10'h3e8;
              5'h0f: out_low = 10'h3e8;
              5'h10: out_low = 10'h3e8;
              5'h11: out_low = 10'h3e8;
              5'h12: out_low = 10'h3e8;
              5'h13: out_low = 10'h3e8;
              5'h14: out_low = 10'h3e8;
              5'h15: out_low = 10'h3e8;
              5'h16: out_low = 10'h3e8;
              5'h17: out_low = 10'h3e8;
              5'h18: out_low = 10'h3e8;
              5'h19: out_low = 10'h3e8;
              5'h1a: out_low = 10'h3e8;
              5'h1b: out_low = 10'h3e8;
              5'h1c: out_low = 10'h3e8;
              5'h1d: out_low = 10'h3e8;
              5'h1e: out_low = 10'h3e8;
              5'h1f: out_low = 10'h3e8;
              default: out_low = 10'h000;
            endcase
          end
          5'h03: begin
            case (mant[4:0])
              5'h00: out_low = 10'h3e8;
              5'h01: out_low = 10'h3e8;
              5'h02: out_low = 10'h3e8;
              5'h03: out_low = 10'h3e8;
              5'h04: out_low = 10'h3e8;
              5'h05: out_low = 10'h3e8;
              5'h06: out_low = 10'h3e8;
              5'h07: out_low = 10'h3e8;
              5'h08: out_low = 10'h3e8;
              5'h09: out_low = 10'h3e8;
              5'h0a: out_low = 10'h3e8;
              5'h0b: out_low = 10'h3e8;
              5'h0c: out_low = 10'h3e8;
              5'h0d: out_low = 10'h3e8;
              5'h0e: out_low = 10'h3e8;
              5'h0f: out_low = 10'h3e8;
              5'h10: out_low = 10'h3e8;
              5'h11: out_low = 10'h3e8;
              5'h12: out_low = 10'h3e7;
              5'h13: out_low = 10'h3e7;
              5'h14: out_low = 10'h3e7;
              5'h15: out_low = 10'h3e7;
              5'h16: out_low = 10'h3e7;
              5'h17: out_low = 10'h3e7;
              5'h18: out_low = 10'h3e7;
              5'h19: out_low = 10'h3e7;
              5'h1a: out_low = 10'h3e7;
              5'h1b: out_low = 10'h3e7;
              5'h1c: out_low = 10'h3e7;
              5'h1d: out_low = 10'h3e7;
              5'h1e: out_low = 10'h3e7;
              5'h1f: out_low = 10'h3e7;
              default: out_low = 10'h000;
            endcase
          end
          5'h04: out_low = 10'h3e7;
          5'h05: begin
            case (mant[4:0])
              5'h00: out_low = 10'h3e7;
              5'h01: out_low = 10'h3e6;
              5'h02: out_low = 10'h3e6;
              5'h03: out_low = 10'h3e6;
              5'h04: out_low = 10'h3e6;
              5'h05: out_low = 10'h3e6;
              5'h06: out_low = 10'h3e6;
              5'h07: out_low = 10'h3e6;
              5'h08: out_low = 10'h3e6;
              5'h09: out_low = 10'h3e6;
              5'h0a: out_low = 10'h3e6;
              5'h0b: out_low = 10'h3e6;
              5'h0c: out_low = 10'h3e6;
              5'h0d: out_low = 10'h3e6;
              5'h0e: out_low = 10'h3e6;
              5'h0f: out_low = 10'h3e6;
              5'h10: out_low = 10'h3e6;
              5'h11: out_low = 10'h3e6;
              5'h12: out_low = 10'h3e6;
              5'h13: out_low = 10'h3e6;
              5'h14: out_low = 10'h3e6;
              5'h15: out_low = 10'h3e6;
              5'h16: out_low = 10'h3e6;
              5'h17: out_low = 10'h3e6;
              5'h18: out_low = 10'h3e6;
              5'h19: out_low = 10'h3e6;
              5'h1a: out_low = 10'h3e6;
              5'h1b: out_low = 10'h3e6;
              5'h1c: out_low = 10'h3e6;
              5'h1d: out_low = 10'h3e6;
              5'h1e: out_low = 10'h3e6;
              5'h1f: out_low = 10'h3e6;
              default: out_low = 10'h000;
            endcase
          end
          5'h06: begin
            case (mant[4:0])
              5'h00: out_low = 10'h3e6;
              5'h01: out_low = 10'h3e6;
              5'h02: out_low = 10'h3e6;
              5'h03: out_low = 10'h3e6;
              5'h04: out_low = 10'h3e6;
              5'h05: out_low = 10'h3e6;
              5'h06: out_low = 10'h3e6;
              5'h07: out_low = 10'h3e6;
              5'h08: out_low = 10'h3e6;
              5'h09: out_low = 10'h3e6;
              5'h0a: out_low = 10'h3e6;
              5'h0b: out_low = 10'h3e6;
              5'h0c: out_low = 10'h3e6;
              5'h0d: out_low = 10'h3e6;
              5'h0e: out_low = 10'h3e6;
              5'h0f: out_low = 10'h3e6;
              5'h10: out_low = 10'h3e5;
              5'h11: out_low = 10'h3e5;
              5'h12: out_low = 10'h3e5;
              5'h13: out_low = 10'h3e5;
              5'h14: out_low = 10'h3e5;
              5'h15: out_low = 10'h3e5;
              5'h16: out_low = 10'h3e5;
              5'h17: out_low = 10'h3e5;
              5'h18: out_low = 10'h3e5;
              5'h19: out_low = 10'h3e5;
              5'h1a: out_low = 10'h3e5;
              5'h1b: out_low = 10'h3e5;
              5'h1c: out_low = 10'h3e5;
              5'h1d: out_low = 10'h3e5;
              5'h1e: out_low = 10'h3e5;
              5'h1f: out_low = 10'h3e5;
              default: out_low = 10'h000;
            endcase
          end
          5'h07: begin
            case (mant[4:0])
              5'h00: out_low = 10'h3e5;
              5'h01: out_low = 10'h3e5;
              5'h02: out_low = 10'h3e5;
              5'h03: out_low = 10'h3e5;
              5'h04: out_low = 10'h3e5;
              5'h05: out_low = 10'h3e5;
              5'h06: out_low = 10'h3e5;
              5'h07: out_low = 10'h3e5;
              5'h08: out_low = 10'h3e5;
              5'h09: out_low = 10'h3e5;
              5'h0a: out_low = 10'h3e5;
              5'h0b: out_low = 10'h3e5;
              5'h0c: out_low = 10'h3e5;
              5'h0d: out_low = 10'h3e5;
              5'h0e: out_low = 10'h3e5;
              5'h0f: out_low = 10'h3e5;
              5'h10: out_low = 10'h3e5;
              5'h11: out_low = 10'h3e5;
              5'h12: out_low = 10'h3e5;
              5'h13: out_low = 10'h3e5;
              5'h14: out_low = 10'h3e5;
              5'h15: out_low = 10'h3e5;
              5'h16: out_low = 10'h3e5;
              5'h17: out_low = 10'h3e5;
              5'h18: out_low = 10'h3e5;
              5'h19: out_low = 10'h3e5;
              5'h1a: out_low = 10'h3e5;
              5'h1b: out_low = 10'h3e5;
              5'h1c: out_low = 10'h3e5;
              5'h1d: out_low = 10'h3e5;
              5'h1e: out_low = 10'h3e5;
              5'h1f: out_low = 10'h3e4;
              default: out_low = 10'h000;
            endcase
          end
          5'h08: out_low = 10'h3e4;
          5'h09: begin
            case (mant[4:0])
              5'h00: out_low = 10'h3e4;
              5'h01: out_low = 10'h3e4;
              5'h02: out_low = 10'h3e4;
              5'h03: out_low = 10'h3e4;
              5'h04: out_low = 10'h3e4;
              5'h05: out_low = 10'h3e4;
              5'h06: out_low = 10'h3e4;
              5'h07: out_low = 10'h3e4;
              5'h08: out_low = 10'h3e4;
              5'h09: out_low = 10'h3e4;
              5'h0a: out_low = 10'h3e4;
              5'h0b: out_low = 10'h3e4;
              5'h0c: out_low = 10'h3e4;
              5'h0d: out_low = 10'h3e3;
              5'h0e: out_low = 10'h3e3;
              5'h0f: out_low = 10'h3e3;
              5'h10: out_low = 10'h3e3;
              5'h11: out_low = 10'h3e3;
              5'h12: out_low = 10'h3e3;
              5'h13: out_low = 10'h3e3;
              5'h14: out_low = 10'h3e3;
              5'h15: out_low = 10'h3e3;
              5'h16: out_low = 10'h3e3;
              5'h17: out_low = 10'h3e3;
              5'h18: out_low = 10'h3e3;
              5'h19: out_low = 10'h3e3;
              5'h1a: out_low = 10'h3e3;
              5'h1b: out_low = 10'h3e3;
              5'h1c: out_low = 10'h3e3;
              5'h1d: out_low = 10'h3e3;
              5'h1e: out_low = 10'h3e3;
              5'h1f: out_low = 10'h3e3;
              default: out_low = 10'h000;
            endcase
          end
          5'h0a: begin
            case (mant[4:0])
              5'h00: out_low = 10'h3e3;
              5'h01: out_low = 10'h3e3;
              5'h02: out_low = 10'h3e3;
              5'h03: out_low = 10'h3e3;
              5'h04: out_low = 10'h3e3;
              5'h05: out_low = 10'h3e3;
              5'h06: out_low = 10'h3e3;
              5'h07: out_low = 10'h3e3;
              5'h08: out_low = 10'h3e3;
              5'h09: out_low = 10'h3e3;
              5'h0a: out_low = 10'h3e3;
              5'h0b: out_low = 10'h3e3;
              5'h0c: out_low = 10'h3e3;
              5'h0d: out_low = 10'h3e3;
              5'h0e: out_low = 10'h3e3;
              5'h0f: out_low = 10'h3e3;
              5'h10: out_low = 10'h3e3;
              5'h11: out_low = 10'h3e3;
              5'h12: out_low = 10'h3e3;
              5'h13: out_low = 10'h3e3;
              5'h14: out_low = 10'h3e3;
              5'h15: out_low = 10'h3e3;
              5'h16: out_low = 10'h3e3;
              5'h17: out_low = 10'h3e3;
              5'h18: out_low = 10'h3e3;
              5'h19: out_low = 10'h3e3;
              5'h1a: out_low = 10'h3e3;
              5'h1b: out_low = 10'h3e3;
              5'h1c: out_low = 10'h3e2;
              5'h1d: out_low = 10'h3e2;
              5'h1e: out_low = 10'h3e2;
              5'h1f: out_low = 10'h3e2;
              default: out_low = 10'h000;
            endcase
          end
          5'h0b: out_low = 10'h3e2;
          5'h0c: begin
            case (mant[4:0])
              5'h00: out_low = 10'h3e2;
              5'h01: out_low = 10'h3e2;
              5'h02: out_low = 10'h3e2;
              5'h03: out_low = 10'h3e2;
              5'h04: out_low = 10'h3e2;
              5'h05: out_low = 10'h3e2;
              5'h06: out_low = 10'h3e2;
              5'h07: out_low = 10'h3e2;
              5'h08: out_low = 10'h3e2;
              5'h09: out_low = 10'h3e2;
              5'h0a: out_low = 10'h3e2;
              5'h0b: out_low = 10'h3e1;
              5'h0c: out_low = 10'h3e1;
              5'h0d: out_low = 10'h3e1;
              5'h0e: out_low = 10'h3e1;
              5'h0f: out_low = 10'h3e1;
              5'h10: out_low = 10'h3e1;
              5'h11: out_low = 10'h3e1;
              5'h12: out_low = 10'h3e1;
              5'h13: out_low = 10'h3e1;
              5'h14: out_low = 10'h3e1;
              5'h15: out_low = 10'h3e1;
              5'h16: out_low = 10'h3e1;
              5'h17: out_low = 10'h3e1;
              5'h18: out_low = 10'h3e1;
              5'h19: out_low = 10'h3e1;
              5'h1a: out_low = 10'h3e1;
              5'h1b: out_low = 10'h3e1;
              5'h1c: out_low = 10'h3e1;
              5'h1d: out_low = 10'h3e1;
              5'h1e: out_low = 10'h3e1;
              5'h1f: out_low = 10'h3e1;
              default: out_low = 10'h000;
            endcase
          end
          5'h0d: begin
            case (mant[4:0])
              5'h00: out_low = 10'h3e1;
              5'h01: out_low = 10'h3e1;
              5'h02: out_low = 10'h3e1;
              5'h03: out_low = 10'h3e1;
              5'h04: out_low = 10'h3e1;
              5'h05: out_low = 10'h3e1;
              5'h06: out_low = 10'h3e1;
              5'h07: out_low = 10'h3e1;
              5'h08: out_low = 10'h3e1;
              5'h09: out_low = 10'h3e1;
              5'h0a: out_low = 10'h3e1;
              5'h0b: out_low = 10'h3e1;
              5'h0c: out_low = 10'h3e1;
              5'h0d: out_low = 10'h3e1;
              5'h0e: out_low = 10'h3e1;
              5'h0f: out_low = 10'h3e1;
              5'h10: out_low = 10'h3e1;
              5'h11: out_low = 10'h3e1;
              5'h12: out_low = 10'h3e1;
              5'h13: out_low = 10'h3e1;
              5'h14: out_low = 10'h3e1;
              5'h15: out_low = 10'h3e1;
              5'h16: out_low = 10'h3e1;
              5'h17: out_low = 10'h3e1;
              5'h18: out_low = 10'h3e1;
              5'h19: out_low = 10'h3e1;
              5'h1a: out_low = 10'h3e0;
              5'h1b: out_low = 10'h3e0;
              5'h1c: out_low = 10'h3e0;
              5'h1d: out_low = 10'h3e0;
              5'h1e: out_low = 10'h3e0;
              5'h1f: out_low = 10'h3e0;
              default: out_low = 10'h000;
            endcase
          end
          5'h0e: out_low = 10'h3e0;
          5'h0f: begin
            case (mant[4:0])
              5'h00: out_low = 10'h3e0;
              5'h01: out_low = 10'h3e0;
              5'h02: out_low = 10'h3e0;
              5'h03: out_low = 10'h3e0;
              5'h04: out_low = 10'h3e0;
              5'h05: out_low = 10'h3e0;
              5'h06: out_low = 10'h3e0;
              5'h07: out_low = 10'h3e0;
              5'h08: out_low = 10'h3e0;
              5'h09: out_low = 10'h3df;
              5'h0a: out_low = 10'h3df;
              5'h0b: out_low = 10'h3df;
              5'h0c: out_low = 10'h3df;
              5'h0d: out_low = 10'h3df;
              5'h0e: out_low = 10'h3df;
              5'h0f: out_low = 10'h3df;
              5'h10: out_low = 10'h3df;
              5'h11: out_low = 10'h3df;
              5'h12: out_low = 10'h3df;
              5'h13: out_low = 10'h3df;
              5'h14: out_low = 10'h3df;
              5'h15: out_low = 10'h3df;
              5'h16: out_low = 10'h3df;
              5'h17: out_low = 10'h3df;
              5'h18: out_low = 10'h3df;
              5'h19: out_low = 10'h3df;
              5'h1a: out_low = 10'h3df;
              5'h1b: out_low = 10'h3df;
              5'h1c: out_low = 10'h3df;
              5'h1d: out_low = 10'h3df;
              5'h1e: out_low = 10'h3df;
              5'h1f: out_low = 10'h3df;
              default: out_low = 10'h000;
            endcase
          end
          5'h10: begin
            case (mant[4:0])
              5'h00: out_low = 10'h3df;
              5'h01: out_low = 10'h3df;
              5'h02: out_low = 10'h3df;
              5'h03: out_low = 10'h3df;
              5'h04: out_low = 10'h3df;
              5'h05: out_low = 10'h3df;
              5'h06: out_low = 10'h3df;
              5'h07: out_low = 10'h3df;
              5'h08: out_low = 10'h3df;
              5'h09: out_low = 10'h3df;
              5'h0a: out_low = 10'h3df;
              5'h0b: out_low = 10'h3df;
              5'h0c: out_low = 10'h3df;
              5'h0d: out_low = 10'h3df;
              5'h0e: out_low = 10'h3df;
              5'h0f: out_low = 10'h3df;
              5'h10: out_low = 10'h3df;
              5'h11: out_low = 10'h3df;
              5'h12: out_low = 10'h3df;
              5'h13: out_low = 10'h3df;
              5'h14: out_low = 10'h3df;
              5'h15: out_low = 10'h3df;
              5'h16: out_low = 10'h3df;
              5'h17: out_low = 10'h3df;
              5'h18: out_low = 10'h3de;
              5'h19: out_low = 10'h3de;
              5'h1a: out_low = 10'h3de;
              5'h1b: out_low = 10'h3de;
              5'h1c: out_low = 10'h3de;
              5'h1d: out_low = 10'h3de;
              5'h1e: out_low = 10'h3de;
              5'h1f: out_low = 10'h3de;
              default: out_low = 10'h000;
            endcase
          end
          5'h11: out_low = 10'h3de;
          5'h12: begin
            case (mant[4:0])
              5'h00: out_low = 10'h3de;
              5'h01: out_low = 10'h3de;
              5'h02: out_low = 10'h3de;
              5'h03: out_low = 10'h3de;
              5'h04: out_low = 10'h3de;
              5'h05: out_low = 10'h3de;
              5'h06: out_low = 10'h3de;
              5'h07: out_low = 10'h3dd;
              5'h08: out_low = 10'h3dd;
              5'h09: out_low = 10'h3dd;
              5'h0a: out_low = 10'h3dd;
              5'h0b: out_low = 10'h3dd;
              5'h0c: out_low = 10'h3dd;
              5'h0d: out_low = 10'h3dd;
              5'h0e: out_low = 10'h3dd;
              5'h0f: out_low = 10'h3dd;
              5'h10: out_low = 10'h3dd;
              5'h11: out_low = 10'h3dd;
              5'h12: out_low = 10'h3dd;
              5'h13: out_low = 10'h3dd;
              5'h14: out_low = 10'h3dd;
              5'h15: out_low = 10'h3dd;
              5'h16: out_low = 10'h3dd;
              5'h17: out_low = 10'h3dd;
              5'h18: out_low = 10'h3dd;
              5'h19: out_low = 10'h3dd;
              5'h1a: out_low = 10'h3dd;
              5'h1b: out_low = 10'h3dd;
              5'h1c: out_low = 10'h3dd;
              5'h1d: out_low = 10'h3dd;
              5'h1e: out_low = 10'h3dd;
              5'h1f: out_low = 10'h3dd;
              default: out_low = 10'h000;
            endcase
          end
          5'h13: begin
            case (mant[4:0])
              5'h00: out_low = 10'h3dd;
              5'h01: out_low = 10'h3dd;
              5'h02: out_low = 10'h3dd;
              5'h03: out_low = 10'h3dd;
              5'h04: out_low = 10'h3dd;
              5'h05: out_low = 10'h3dd;
              5'h06: out_low = 10'h3dd;
              5'h07: out_low = 10'h3dd;
              5'h08: out_low = 10'h3dd;
              5'h09: out_low = 10'h3dd;
              5'h0a: out_low = 10'h3dd;
              5'h0b: out_low = 10'h3dd;
              5'h0c: out_low = 10'h3dd;
              5'h0d: out_low = 10'h3dd;
              5'h0e: out_low = 10'h3dd;
              5'h0f: out_low = 10'h3dd;
              5'h10: out_low = 10'h3dd;
              5'h11: out_low = 10'h3dd;
              5'h12: out_low = 10'h3dd;
              5'h13: out_low = 10'h3dd;
              5'h14: out_low = 10'h3dd;
              5'h15: out_low = 10'h3dd;
              5'h16: out_low = 10'h3dc;
              5'h17: out_low = 10'h3dc;
              5'h18: out_low = 10'h3dc;
              5'h19: out_low = 10'h3dc;
              5'h1a: out_low = 10'h3dc;
              5'h1b: out_low = 10'h3dc;
              5'h1c: out_low = 10'h3dc;
              5'h1d: out_low = 10'h3dc;
              5'h1e: out_low = 10'h3dc;
              5'h1f: out_low = 10'h3dc;
              default: out_low = 10'h000;
            endcase
          end
          5'h14: out_low = 10'h3dc;
          5'h15: begin
            case (mant[4:0])
              5'h00: out_low = 10'h3dc;
              5'h01: out_low = 10'h3dc;
              5'h02: out_low = 10'h3dc;
              5'h03: out_low = 10'h3dc;
              5'h04: out_low = 10'h3dc;
              5'h05: out_low = 10'h3db;
              5'h06: out_low = 10'h3db;
              5'h07: out_low = 10'h3db;
              5'h08: out_low = 10'h3db;
              5'h09: out_low = 10'h3db;
              5'h0a: out_low = 10'h3db;
              5'h0b: out_low = 10'h3db;
              5'h0c: out_low = 10'h3db;
              5'h0d: out_low = 10'h3db;
              5'h0e: out_low = 10'h3db;
              5'h0f: out_low = 10'h3db;
              5'h10: out_low = 10'h3db;
              5'h11: out_low = 10'h3db;
              5'h12: out_low = 10'h3db;
              5'h13: out_low = 10'h3db;
              5'h14: out_low = 10'h3db;
              5'h15: out_low = 10'h3db;
              5'h16: out_low = 10'h3db;
              5'h17: out_low = 10'h3db;
              5'h18: out_low = 10'h3db;
              5'h19: out_low = 10'h3db;
              5'h1a: out_low = 10'h3db;
              5'h1b: out_low = 10'h3db;
              5'h1c: out_low = 10'h3db;
              5'h1d: out_low = 10'h3db;
              5'h1e: out_low = 10'h3db;
              5'h1f: out_low = 10'h3db;
              default: out_low = 10'h000;
            endcase
          end
          5'h16: begin
            case (mant[4:0])
              5'h00: out_low = 10'h3db;
              5'h01: out_low = 10'h3db;
              5'h02: out_low = 10'h3db;
              5'h03: out_low = 10'h3db;
              5'h04: out_low = 10'h3db;
              5'h05: out_low = 10'h3db;
              5'h06: out_low = 10'h3db;
              5'h07: out_low = 10'h3db;
              5'h08: out_low = 10'h3db;
              5'h09: out_low = 10'h3db;
              5'h0a: out_low = 10'h3db;
              5'h0b: out_low = 10'h3db;
              5'h0c: out_low = 10'h3db;
              5'h0d: out_low = 10'h3db;
              5'h0e: out_low = 10'h3db;
              5'h0f: out_low = 10'h3db;
              5'h10: out_low = 10'h3db;
              5'h11: out_low = 10'h3db;
              5'h12: out_low = 10'h3db;
              5'h13: out_low = 10'h3db;
              5'h14: out_low = 10'h3da;
              5'h15: out_low = 10'h3da;
              5'h16: out_low = 10'h3da;
              5'h17: out_low = 10'h3da;
              5'h18: out_low = 10'h3da;
              5'h19: out_low = 10'h3da;
              5'h1a: out_low = 10'h3da;
              5'h1b: out_low = 10'h3da;
              5'h1c: out_low = 10'h3da;
              5'h1d: out_low = 10'h3da;
              5'h1e: out_low = 10'h3da;
              5'h1f: out_low = 10'h3da;
              default: out_low = 10'h000;
            endcase
          end
          5'h17: out_low = 10'h3da;
          5'h18: begin
            case (mant[4:0])
              5'h00: out_low = 10'h3da;
              5'h01: out_low = 10'h3da;
              5'h02: out_low = 10'h3da;
              5'h03: out_low = 10'h3d9;
              5'h04: out_low = 10'h3d9;
              5'h05: out_low = 10'h3d9;
              5'h06: out_low = 10'h3d9;
              5'h07: out_low = 10'h3d9;
              5'h08: out_low = 10'h3d9;
              5'h09: out_low = 10'h3d9;
              5'h0a: out_low = 10'h3d9;
              5'h0b: out_low = 10'h3d9;
              5'h0c: out_low = 10'h3d9;
              5'h0d: out_low = 10'h3d9;
              5'h0e: out_low = 10'h3d9;
              5'h0f: out_low = 10'h3d9;
              5'h10: out_low = 10'h3d9;
              5'h11: out_low = 10'h3d9;
              5'h12: out_low = 10'h3d9;
              5'h13: out_low = 10'h3d9;
              5'h14: out_low = 10'h3d9;
              5'h15: out_low = 10'h3d9;
              5'h16: out_low = 10'h3d9;
              5'h17: out_low = 10'h3d9;
              5'h18: out_low = 10'h3d9;
              5'h19: out_low = 10'h3d9;
              5'h1a: out_low = 10'h3d9;
              5'h1b: out_low = 10'h3d9;
              5'h1c: out_low = 10'h3d9;
              5'h1d: out_low = 10'h3d9;
              5'h1e: out_low = 10'h3d9;
              5'h1f: out_low = 10'h3d9;
              default: out_low = 10'h000;
            endcase
          end
          5'h19: begin
            case (mant[4:0])
              5'h00: out_low = 10'h3d9;
              5'h01: out_low = 10'h3d9;
              5'h02: out_low = 10'h3d9;
              5'h03: out_low = 10'h3d9;
              5'h04: out_low = 10'h3d9;
              5'h05: out_low = 10'h3d9;
              5'h06: out_low = 10'h3d9;
              5'h07: out_low = 10'h3d9;
              5'h08: out_low = 10'h3d9;
              5'h09: out_low = 10'h3d9;
              5'h0a: out_low = 10'h3d9;
              5'h0b: out_low = 10'h3d9;
              5'h0c: out_low = 10'h3d9;
              5'h0d: out_low = 10'h3d9;
              5'h0e: out_low = 10'h3d9;
              5'h0f: out_low = 10'h3d9;
              5'h10: out_low = 10'h3d9;
              5'h11: out_low = 10'h3d9;
              5'h12: out_low = 10'h3d8;
              5'h13: out_low = 10'h3d8;
              5'h14: out_low = 10'h3d8;
              5'h15: out_low = 10'h3d8;
              5'h16: out_low = 10'h3d8;
              5'h17: out_low = 10'h3d8;
              5'h18: out_low = 10'h3d8;
              5'h19: out_low = 10'h3d8;
              5'h1a: out_low = 10'h3d8;
              5'h1b: out_low = 10'h3d8;
              5'h1c: out_low = 10'h3d8;
              5'h1d: out_low = 10'h3d8;
              5'h1e: out_low = 10'h3d8;
              5'h1f: out_low = 10'h3d8;
              default: out_low = 10'h000;
            endcase
          end
          5'h1a: out_low = 10'h3d8;
          5'h1b: begin
            case (mant[4:0])
              5'h00: out_low = 10'h3d8;
              5'h01: out_low = 10'h3d7;
              5'h02: out_low = 10'h3d7;
              5'h03: out_low = 10'h3d7;
              5'h04: out_low = 10'h3d7;
              5'h05: out_low = 10'h3d7;
              5'h06: out_low = 10'h3d7;
              5'h07: out_low = 10'h3d7;
              5'h08: out_low = 10'h3d7;
              5'h09: out_low = 10'h3d7;
              5'h0a: out_low = 10'h3d7;
              5'h0b: out_low = 10'h3d7;
              5'h0c: out_low = 10'h3d7;
              5'h0d: out_low = 10'h3d7;
              5'h0e: out_low = 10'h3d7;
              5'h0f: out_low = 10'h3d7;
              5'h10: out_low = 10'h3d7;
              5'h11: out_low = 10'h3d7;
              5'h12: out_low = 10'h3d7;
              5'h13: out_low = 10'h3d7;
              5'h14: out_low = 10'h3d7;
              5'h15: out_low = 10'h3d7;
              5'h16: out_low = 10'h3d7;
              5'h17: out_low = 10'h3d7;
              5'h18: out_low = 10'h3d7;
              5'h19: out_low = 10'h3d7;
              5'h1a: out_low = 10'h3d7;
              5'h1b: out_low = 10'h3d7;
              5'h1c: out_low = 10'h3d7;
              5'h1d: out_low = 10'h3d7;
              5'h1e: out_low = 10'h3d7;
              5'h1f: out_low = 10'h3d7;
              default: out_low = 10'h000;
            endcase
          end
          5'h1c: begin
            case (mant[4:0])
              5'h00: out_low = 10'h3d7;
              5'h01: out_low = 10'h3d7;
              5'h02: out_low = 10'h3d7;
              5'h03: out_low = 10'h3d7;
              5'h04: out_low = 10'h3d7;
              5'h05: out_low = 10'h3d7;
              5'h06: out_low = 10'h3d7;
              5'h07: out_low = 10'h3d7;
              5'h08: out_low = 10'h3d7;
              5'h09: out_low = 10'h3d7;
              5'h0a: out_low = 10'h3d7;
              5'h0b: out_low = 10'h3d7;
              5'h0c: out_low = 10'h3d7;
              5'h0d: out_low = 10'h3d7;
              5'h0e: out_low = 10'h3d7;
              5'h0f: out_low = 10'h3d7;
              5'h10: out_low = 10'h3d6;
              5'h11: out_low = 10'h3d6;
              5'h12: out_low = 10'h3d6;
              5'h13: out_low = 10'h3d6;
              5'h14: out_low = 10'h3d6;
              5'h15: out_low = 10'h3d6;
              5'h16: out_low = 10'h3d6;
              5'h17: out_low = 10'h3d6;
              5'h18: out_low = 10'h3d6;
              5'h19: out_low = 10'h3d6;
              5'h1a: out_low = 10'h3d6;
              5'h1b: out_low = 10'h3d6;
              5'h1c: out_low = 10'h3d6;
              5'h1d: out_low = 10'h3d6;
              5'h1e: out_low = 10'h3d6;
              5'h1f: out_low = 10'h3d6;
              default: out_low = 10'h000;
            endcase
          end
          5'h1d: begin
            case (mant[4:0])
              5'h00: out_low = 10'h3d6;
              5'h01: out_low = 10'h3d6;
              5'h02: out_low = 10'h3d6;
              5'h03: out_low = 10'h3d6;
              5'h04: out_low = 10'h3d6;
              5'h05: out_low = 10'h3d6;
              5'h06: out_low = 10'h3d6;
              5'h07: out_low = 10'h3d6;
              5'h08: out_low = 10'h3d6;
              5'h09: out_low = 10'h3d6;
              5'h0a: out_low = 10'h3d6;
              5'h0b: out_low = 10'h3d6;
              5'h0c: out_low = 10'h3d6;
              5'h0d: out_low = 10'h3d6;
              5'h0e: out_low = 10'h3d6;
              5'h0f: out_low = 10'h3d6;
              5'h10: out_low = 10'h3d6;
              5'h11: out_low = 10'h3d6;
              5'h12: out_low = 10'h3d6;
              5'h13: out_low = 10'h3d6;
              5'h14: out_low = 10'h3d6;
              5'h15: out_low = 10'h3d6;
              5'h16: out_low = 10'h3d6;
              5'h17: out_low = 10'h3d6;
              5'h18: out_low = 10'h3d6;
              5'h19: out_low = 10'h3d6;
              5'h1a: out_low = 10'h3d6;
              5'h1b: out_low = 10'h3d6;
              5'h1c: out_low = 10'h3d6;
              5'h1d: out_low = 10'h3d6;
              5'h1e: out_low = 10'h3d6;
              5'h1f: out_low = 10'h3d5;
              default: out_low = 10'h000;
            endcase
          end
          5'h1e: out_low = 10'h3d5;
          5'h1f: begin
            case (mant[4:0])
              5'h00: out_low = 10'h3d5;
              5'h01: out_low = 10'h3d5;
              5'h02: out_low = 10'h3d5;
              5'h03: out_low = 10'h3d5;
              5'h04: out_low = 10'h3d5;
              5'h05: out_low = 10'h3d5;
              5'h06: out_low = 10'h3d5;
              5'h07: out_low = 10'h3d5;
              5'h08: out_low = 10'h3d5;
              5'h09: out_low = 10'h3d5;
              5'h0a: out_low = 10'h3d5;
              5'h0b: out_low = 10'h3d5;
              5'h0c: out_low = 10'h3d5;
              5'h0d: out_low = 10'h3d5;
              5'h0e: out_low = 10'h3d4;
              5'h0f: out_low = 10'h3d4;
              5'h10: out_low = 10'h3d4;
              5'h11: out_low = 10'h3d4;
              5'h12: out_low = 10'h3d4;
              5'h13: out_low = 10'h3d4;
              5'h14: out_low = 10'h3d4;
              5'h15: out_low = 10'h3d4;
              5'h16: out_low = 10'h3d4;
              5'h17: out_low = 10'h3d4;
              5'h18: out_low = 10'h3d4;
              5'h19: out_low = 10'h3d4;
              5'h1a: out_low = 10'h3d4;
              5'h1b: out_low = 10'h3d4;
              5'h1c: out_low = 10'h3d4;
              5'h1d: out_low = 10'h3d4;
              5'h1e: out_low = 10'h3d4;
              5'h1f: out_low = 10'h3d4;
              default: out_low = 10'h000;
            endcase
          end
          default: out_low = 10'h000;
        endcase
      end
      6'h2a: begin
        case (mant[9:5])
          5'h00: begin
            case (mant[4:0])
              5'h00: out_low = 10'h3d4;
              5'h01: out_low = 10'h3d4;
              5'h02: out_low = 10'h3d4;
              5'h03: out_low = 10'h3d4;
              5'h04: out_low = 10'h3d4;
              5'h05: out_low = 10'h3d4;
              5'h06: out_low = 10'h3d4;
              5'h07: out_low = 10'h3d4;
              5'h08: out_low = 10'h3d4;
              5'h09: out_low = 10'h3d4;
              5'h0a: out_low = 10'h3d4;
              5'h0b: out_low = 10'h3d4;
              5'h0c: out_low = 10'h3d4;
              5'h0d: out_low = 10'h3d4;
              5'h0e: out_low = 10'h3d4;
              5'h0f: out_low = 10'h3d3;
              5'h10: out_low = 10'h3d3;
              5'h11: out_low = 10'h3d3;
              5'h12: out_low = 10'h3d3;
              5'h13: out_low = 10'h3d3;
              5'h14: out_low = 10'h3d3;
              5'h15: out_low = 10'h3d3;
              5'h16: out_low = 10'h3d3;
              5'h17: out_low = 10'h3d3;
              5'h18: out_low = 10'h3d3;
              5'h19: out_low = 10'h3d3;
              5'h1a: out_low = 10'h3d3;
              5'h1b: out_low = 10'h3d3;
              5'h1c: out_low = 10'h3d3;
              5'h1d: out_low = 10'h3d3;
              5'h1e: out_low = 10'h3d3;
              5'h1f: out_low = 10'h3d3;
              default: out_low = 10'h000;
            endcase
          end
          5'h01: begin
            case (mant[4:0])
              5'h00: out_low = 10'h3d3;
              5'h01: out_low = 10'h3d3;
              5'h02: out_low = 10'h3d3;
              5'h03: out_low = 10'h3d3;
              5'h04: out_low = 10'h3d3;
              5'h05: out_low = 10'h3d3;
              5'h06: out_low = 10'h3d3;
              5'h07: out_low = 10'h3d2;
              5'h08: out_low = 10'h3d2;
              5'h09: out_low = 10'h3d2;
              5'h0a: out_low = 10'h3d2;
              5'h0b: out_low = 10'h3d2;
              5'h0c: out_low = 10'h3d2;
              5'h0d: out_low = 10'h3d2;
              5'h0e: out_low = 10'h3d2;
              5'h0f: out_low = 10'h3d2;
              5'h10: out_low = 10'h3d2;
              5'h11: out_low = 10'h3d2;
              5'h12: out_low = 10'h3d2;
              5'h13: out_low = 10'h3d2;
              5'h14: out_low = 10'h3d2;
              5'h15: out_low = 10'h3d2;
              5'h16: out_low = 10'h3d2;
              5'h17: out_low = 10'h3d2;
              5'h18: out_low = 10'h3d2;
              5'h19: out_low = 10'h3d2;
              5'h1a: out_low = 10'h3d2;
              5'h1b: out_low = 10'h3d2;
              5'h1c: out_low = 10'h3d2;
              5'h1d: out_low = 10'h3d2;
              5'h1e: out_low = 10'h3d1;
              5'h1f: out_low = 10'h3d1;
              default: out_low = 10'h000;
            endcase
          end
          5'h02: begin
            case (mant[4:0])
              5'h00: out_low = 10'h3d1;
              5'h01: out_low = 10'h3d1;
              5'h02: out_low = 10'h3d1;
              5'h03: out_low = 10'h3d1;
              5'h04: out_low = 10'h3d1;
              5'h05: out_low = 10'h3d1;
              5'h06: out_low = 10'h3d1;
              5'h07: out_low = 10'h3d1;
              5'h08: out_low = 10'h3d1;
              5'h09: out_low = 10'h3d1;
              5'h0a: out_low = 10'h3d1;
              5'h0b: out_low = 10'h3d1;
              5'h0c: out_low = 10'h3d1;
              5'h0d: out_low = 10'h3d1;
              5'h0e: out_low = 10'h3d1;
              5'h0f: out_low = 10'h3d1;
              5'h10: out_low = 10'h3d1;
              5'h11: out_low = 10'h3d1;
              5'h12: out_low = 10'h3d1;
              5'h13: out_low = 10'h3d1;
              5'h14: out_low = 10'h3d1;
              5'h15: out_low = 10'h3d1;
              5'h16: out_low = 10'h3d0;
              5'h17: out_low = 10'h3d0;
              5'h18: out_low = 10'h3d0;
              5'h19: out_low = 10'h3d0;
              5'h1a: out_low = 10'h3d0;
              5'h1b: out_low = 10'h3d0;
              5'h1c: out_low = 10'h3d0;
              5'h1d: out_low = 10'h3d0;
              5'h1e: out_low = 10'h3d0;
              5'h1f: out_low = 10'h3d0;
              default: out_low = 10'h000;
            endcase
          end
          5'h03: begin
            case (mant[4:0])
              5'h00: out_low = 10'h3d0;
              5'h01: out_low = 10'h3d0;
              5'h02: out_low = 10'h3d0;
              5'h03: out_low = 10'h3d0;
              5'h04: out_low = 10'h3d0;
              5'h05: out_low = 10'h3d0;
              5'h06: out_low = 10'h3d0;
              5'h07: out_low = 10'h3d0;
              5'h08: out_low = 10'h3d0;
              5'h09: out_low = 10'h3d0;
              5'h0a: out_low = 10'h3d0;
              5'h0b: out_low = 10'h3d0;
              5'h0c: out_low = 10'h3d0;
              5'h0d: out_low = 10'h3d0;
              5'h0e: out_low = 10'h3cf;
              5'h0f: out_low = 10'h3cf;
              5'h10: out_low = 10'h3cf;
              5'h11: out_low = 10'h3cf;
              5'h12: out_low = 10'h3cf;
              5'h13: out_low = 10'h3cf;
              5'h14: out_low = 10'h3cf;
              5'h15: out_low = 10'h3cf;
              5'h16: out_low = 10'h3cf;
              5'h17: out_low = 10'h3cf;
              5'h18: out_low = 10'h3cf;
              5'h19: out_low = 10'h3cf;
              5'h1a: out_low = 10'h3cf;
              5'h1b: out_low = 10'h3cf;
              5'h1c: out_low = 10'h3cf;
              5'h1d: out_low = 10'h3cf;
              5'h1e: out_low = 10'h3cf;
              5'h1f: out_low = 10'h3cf;
              default: out_low = 10'h000;
            endcase
          end
          5'h04: begin
            case (mant[4:0])
              5'h00: out_low = 10'h3cf;
              5'h01: out_low = 10'h3cf;
              5'h02: out_low = 10'h3cf;
              5'h03: out_low = 10'h3cf;
              5'h04: out_low = 10'h3cf;
              5'h05: out_low = 10'h3ce;
              5'h06: out_low = 10'h3ce;
              5'h07: out_low = 10'h3ce;
              5'h08: out_low = 10'h3ce;
              5'h09: out_low = 10'h3ce;
              5'h0a: out_low = 10'h3ce;
              5'h0b: out_low = 10'h3ce;
              5'h0c: out_low = 10'h3ce;
              5'h0d: out_low = 10'h3ce;
              5'h0e: out_low = 10'h3ce;
              5'h0f: out_low = 10'h3ce;
              5'h10: out_low = 10'h3ce;
              5'h11: out_low = 10'h3ce;
              5'h12: out_low = 10'h3ce;
              5'h13: out_low = 10'h3ce;
              5'h14: out_low = 10'h3ce;
              5'h15: out_low = 10'h3ce;
              5'h16: out_low = 10'h3ce;
              5'h17: out_low = 10'h3ce;
              5'h18: out_low = 10'h3ce;
              5'h19: out_low = 10'h3ce;
              5'h1a: out_low = 10'h3ce;
              5'h1b: out_low = 10'h3ce;
              5'h1c: out_low = 10'h3ce;
              5'h1d: out_low = 10'h3cd;
              5'h1e: out_low = 10'h3cd;
              5'h1f: out_low = 10'h3cd;
              default: out_low = 10'h000;
            endcase
          end
          5'h05: begin
            case (mant[4:0])
              5'h00: out_low = 10'h3cd;
              5'h01: out_low = 10'h3cd;
              5'h02: out_low = 10'h3cd;
              5'h03: out_low = 10'h3cd;
              5'h04: out_low = 10'h3cd;
              5'h05: out_low = 10'h3cd;
              5'h06: out_low = 10'h3cd;
              5'h07: out_low = 10'h3cd;
              5'h08: out_low = 10'h3cd;
              5'h09: out_low = 10'h3cd;
              5'h0a: out_low = 10'h3cd;
              5'h0b: out_low = 10'h3cd;
              5'h0c: out_low = 10'h3cd;
              5'h0d: out_low = 10'h3cd;
              5'h0e: out_low = 10'h3cd;
              5'h0f: out_low = 10'h3cd;
              5'h10: out_low = 10'h3cd;
              5'h11: out_low = 10'h3cd;
              5'h12: out_low = 10'h3cd;
              5'h13: out_low = 10'h3cd;
              5'h14: out_low = 10'h3cc;
              5'h15: out_low = 10'h3cc;
              5'h16: out_low = 10'h3cc;
              5'h17: out_low = 10'h3cc;
              5'h18: out_low = 10'h3cc;
              5'h19: out_low = 10'h3cc;
              5'h1a: out_low = 10'h3cc;
              5'h1b: out_low = 10'h3cc;
              5'h1c: out_low = 10'h3cc;
              5'h1d: out_low = 10'h3cc;
              5'h1e: out_low = 10'h3cc;
              5'h1f: out_low = 10'h3cc;
              default: out_low = 10'h000;
            endcase
          end
          5'h06: begin
            case (mant[4:0])
              5'h00: out_low = 10'h3cc;
              5'h01: out_low = 10'h3cc;
              5'h02: out_low = 10'h3cc;
              5'h03: out_low = 10'h3cc;
              5'h04: out_low = 10'h3cc;
              5'h05: out_low = 10'h3cc;
              5'h06: out_low = 10'h3cc;
              5'h07: out_low = 10'h3cc;
              5'h08: out_low = 10'h3cc;
              5'h09: out_low = 10'h3cc;
              5'h0a: out_low = 10'h3cc;
              5'h0b: out_low = 10'h3cc;
              5'h0c: out_low = 10'h3cb;
              5'h0d: out_low = 10'h3cb;
              5'h0e: out_low = 10'h3cb;
              5'h0f: out_low = 10'h3cb;
              5'h10: out_low = 10'h3cb;
              5'h11: out_low = 10'h3cb;
              5'h12: out_low = 10'h3cb;
              5'h13: out_low = 10'h3cb;
              5'h14: out_low = 10'h3cb;
              5'h15: out_low = 10'h3cb;
              5'h16: out_low = 10'h3cb;
              5'h17: out_low = 10'h3cb;
              5'h18: out_low = 10'h3cb;
              5'h19: out_low = 10'h3cb;
              5'h1a: out_low = 10'h3cb;
              5'h1b: out_low = 10'h3cb;
              5'h1c: out_low = 10'h3cb;
              5'h1d: out_low = 10'h3cb;
              5'h1e: out_low = 10'h3cb;
              5'h1f: out_low = 10'h3cb;
              default: out_low = 10'h000;
            endcase
          end
          5'h07: begin
            case (mant[4:0])
              5'h00: out_low = 10'h3cb;
              5'h01: out_low = 10'h3cb;
              5'h02: out_low = 10'h3cb;
              5'h03: out_low = 10'h3cb;
              5'h04: out_low = 10'h3ca;
              5'h05: out_low = 10'h3ca;
              5'h06: out_low = 10'h3ca;
              5'h07: out_low = 10'h3ca;
              5'h08: out_low = 10'h3ca;
              5'h09: out_low = 10'h3ca;
              5'h0a: out_low = 10'h3ca;
              5'h0b: out_low = 10'h3ca;
              5'h0c: out_low = 10'h3ca;
              5'h0d: out_low = 10'h3ca;
              5'h0e: out_low = 10'h3ca;
              5'h0f: out_low = 10'h3ca;
              5'h10: out_low = 10'h3ca;
              5'h11: out_low = 10'h3ca;
              5'h12: out_low = 10'h3ca;
              5'h13: out_low = 10'h3ca;
              5'h14: out_low = 10'h3ca;
              5'h15: out_low = 10'h3ca;
              5'h16: out_low = 10'h3ca;
              5'h17: out_low = 10'h3ca;
              5'h18: out_low = 10'h3ca;
              5'h19: out_low = 10'h3ca;
              5'h1a: out_low = 10'h3ca;
              5'h1b: out_low = 10'h3ca;
              5'h1c: out_low = 10'h3c9;
              5'h1d: out_low = 10'h3c9;
              5'h1e: out_low = 10'h3c9;
              5'h1f: out_low = 10'h3c9;
              default: out_low = 10'h000;
            endcase
          end
          5'h08: begin
            case (mant[4:0])
              5'h00: out_low = 10'h3c9;
              5'h01: out_low = 10'h3c9;
              5'h02: out_low = 10'h3c9;
              5'h03: out_low = 10'h3c9;
              5'h04: out_low = 10'h3c9;
              5'h05: out_low = 10'h3c9;
              5'h06: out_low = 10'h3c9;
              5'h07: out_low = 10'h3c9;
              5'h08: out_low = 10'h3c9;
              5'h09: out_low = 10'h3c9;
              5'h0a: out_low = 10'h3c9;
              5'h0b: out_low = 10'h3c9;
              5'h0c: out_low = 10'h3c9;
              5'h0d: out_low = 10'h3c9;
              5'h0e: out_low = 10'h3c9;
              5'h0f: out_low = 10'h3c9;
              5'h10: out_low = 10'h3c9;
              5'h11: out_low = 10'h3c9;
              5'h12: out_low = 10'h3c9;
              5'h13: out_low = 10'h3c8;
              5'h14: out_low = 10'h3c8;
              5'h15: out_low = 10'h3c8;
              5'h16: out_low = 10'h3c8;
              5'h17: out_low = 10'h3c8;
              5'h18: out_low = 10'h3c8;
              5'h19: out_low = 10'h3c8;
              5'h1a: out_low = 10'h3c8;
              5'h1b: out_low = 10'h3c8;
              5'h1c: out_low = 10'h3c8;
              5'h1d: out_low = 10'h3c8;
              5'h1e: out_low = 10'h3c8;
              5'h1f: out_low = 10'h3c8;
              default: out_low = 10'h000;
            endcase
          end
          5'h09: begin
            case (mant[4:0])
              5'h00: out_low = 10'h3c8;
              5'h01: out_low = 10'h3c8;
              5'h02: out_low = 10'h3c8;
              5'h03: out_low = 10'h3c8;
              5'h04: out_low = 10'h3c8;
              5'h05: out_low = 10'h3c8;
              5'h06: out_low = 10'h3c8;
              5'h07: out_low = 10'h3c8;
              5'h08: out_low = 10'h3c8;
              5'h09: out_low = 10'h3c8;
              5'h0a: out_low = 10'h3c8;
              5'h0b: out_low = 10'h3c7;
              5'h0c: out_low = 10'h3c7;
              5'h0d: out_low = 10'h3c7;
              5'h0e: out_low = 10'h3c7;
              5'h0f: out_low = 10'h3c7;
              5'h10: out_low = 10'h3c7;
              5'h11: out_low = 10'h3c7;
              5'h12: out_low = 10'h3c7;
              5'h13: out_low = 10'h3c7;
              5'h14: out_low = 10'h3c7;
              5'h15: out_low = 10'h3c7;
              5'h16: out_low = 10'h3c7;
              5'h17: out_low = 10'h3c7;
              5'h18: out_low = 10'h3c7;
              5'h19: out_low = 10'h3c7;
              5'h1a: out_low = 10'h3c7;
              5'h1b: out_low = 10'h3c7;
              5'h1c: out_low = 10'h3c7;
              5'h1d: out_low = 10'h3c7;
              5'h1e: out_low = 10'h3c7;
              5'h1f: out_low = 10'h3c7;
              default: out_low = 10'h000;
            endcase
          end
          5'h0a: begin
            case (mant[4:0])
              5'h00: out_low = 10'h3c7;
              5'h01: out_low = 10'h3c7;
              5'h02: out_low = 10'h3c7;
              5'h03: out_low = 10'h3c6;
              5'h04: out_low = 10'h3c6;
              5'h05: out_low = 10'h3c6;
              5'h06: out_low = 10'h3c6;
              5'h07: out_low = 10'h3c6;
              5'h08: out_low = 10'h3c6;
              5'h09: out_low = 10'h3c6;
              5'h0a: out_low = 10'h3c6;
              5'h0b: out_low = 10'h3c6;
              5'h0c: out_low = 10'h3c6;
              5'h0d: out_low = 10'h3c6;
              5'h0e: out_low = 10'h3c6;
              5'h0f: out_low = 10'h3c6;
              5'h10: out_low = 10'h3c6;
              5'h11: out_low = 10'h3c6;
              5'h12: out_low = 10'h3c6;
              5'h13: out_low = 10'h3c6;
              5'h14: out_low = 10'h3c6;
              5'h15: out_low = 10'h3c6;
              5'h16: out_low = 10'h3c6;
              5'h17: out_low = 10'h3c6;
              5'h18: out_low = 10'h3c6;
              5'h19: out_low = 10'h3c6;
              5'h1a: out_low = 10'h3c6;
              5'h1b: out_low = 10'h3c5;
              5'h1c: out_low = 10'h3c5;
              5'h1d: out_low = 10'h3c5;
              5'h1e: out_low = 10'h3c5;
              5'h1f: out_low = 10'h3c5;
              default: out_low = 10'h000;
            endcase
          end
          5'h0b: begin
            case (mant[4:0])
              5'h00: out_low = 10'h3c5;
              5'h01: out_low = 10'h3c5;
              5'h02: out_low = 10'h3c5;
              5'h03: out_low = 10'h3c5;
              5'h04: out_low = 10'h3c5;
              5'h05: out_low = 10'h3c5;
              5'h06: out_low = 10'h3c5;
              5'h07: out_low = 10'h3c5;
              5'h08: out_low = 10'h3c5;
              5'h09: out_low = 10'h3c5;
              5'h0a: out_low = 10'h3c5;
              5'h0b: out_low = 10'h3c5;
              5'h0c: out_low = 10'h3c5;
              5'h0d: out_low = 10'h3c5;
              5'h0e: out_low = 10'h3c5;
              5'h0f: out_low = 10'h3c5;
              5'h10: out_low = 10'h3c5;
              5'h11: out_low = 10'h3c5;
              5'h12: out_low = 10'h3c4;
              5'h13: out_low = 10'h3c4;
              5'h14: out_low = 10'h3c4;
              5'h15: out_low = 10'h3c4;
              5'h16: out_low = 10'h3c4;
              5'h17: out_low = 10'h3c4;
              5'h18: out_low = 10'h3c4;
              5'h19: out_low = 10'h3c4;
              5'h1a: out_low = 10'h3c4;
              5'h1b: out_low = 10'h3c4;
              5'h1c: out_low = 10'h3c4;
              5'h1d: out_low = 10'h3c4;
              5'h1e: out_low = 10'h3c4;
              5'h1f: out_low = 10'h3c4;
              default: out_low = 10'h000;
            endcase
          end
          5'h0c: begin
            case (mant[4:0])
              5'h00: out_low = 10'h3c4;
              5'h01: out_low = 10'h3c4;
              5'h02: out_low = 10'h3c4;
              5'h03: out_low = 10'h3c4;
              5'h04: out_low = 10'h3c4;
              5'h05: out_low = 10'h3c4;
              5'h06: out_low = 10'h3c4;
              5'h07: out_low = 10'h3c4;
              5'h08: out_low = 10'h3c4;
              5'h09: out_low = 10'h3c4;
              5'h0a: out_low = 10'h3c3;
              5'h0b: out_low = 10'h3c3;
              5'h0c: out_low = 10'h3c3;
              5'h0d: out_low = 10'h3c3;
              5'h0e: out_low = 10'h3c3;
              5'h0f: out_low = 10'h3c3;
              5'h10: out_low = 10'h3c3;
              5'h11: out_low = 10'h3c3;
              5'h12: out_low = 10'h3c3;
              5'h13: out_low = 10'h3c3;
              5'h14: out_low = 10'h3c3;
              5'h15: out_low = 10'h3c3;
              5'h16: out_low = 10'h3c3;
              5'h17: out_low = 10'h3c3;
              5'h18: out_low = 10'h3c3;
              5'h19: out_low = 10'h3c3;
              5'h1a: out_low = 10'h3c3;
              5'h1b: out_low = 10'h3c3;
              5'h1c: out_low = 10'h3c3;
              5'h1d: out_low = 10'h3c3;
              5'h1e: out_low = 10'h3c3;
              5'h1f: out_low = 10'h3c3;
              default: out_low = 10'h000;
            endcase
          end
          5'h0d: begin
            case (mant[4:0])
              5'h00: out_low = 10'h3c3;
              5'h01: out_low = 10'h3c3;
              5'h02: out_low = 10'h3c2;
              5'h03: out_low = 10'h3c2;
              5'h04: out_low = 10'h3c2;
              5'h05: out_low = 10'h3c2;
              5'h06: out_low = 10'h3c2;
              5'h07: out_low = 10'h3c2;
              5'h08: out_low = 10'h3c2;
              5'h09: out_low = 10'h3c2;
              5'h0a: out_low = 10'h3c2;
              5'h0b: out_low = 10'h3c2;
              5'h0c: out_low = 10'h3c2;
              5'h0d: out_low = 10'h3c2;
              5'h0e: out_low = 10'h3c2;
              5'h0f: out_low = 10'h3c2;
              5'h10: out_low = 10'h3c2;
              5'h11: out_low = 10'h3c2;
              5'h12: out_low = 10'h3c2;
              5'h13: out_low = 10'h3c2;
              5'h14: out_low = 10'h3c2;
              5'h15: out_low = 10'h3c2;
              5'h16: out_low = 10'h3c2;
              5'h17: out_low = 10'h3c2;
              5'h18: out_low = 10'h3c2;
              5'h19: out_low = 10'h3c2;
              5'h1a: out_low = 10'h3c1;
              5'h1b: out_low = 10'h3c1;
              5'h1c: out_low = 10'h3c1;
              5'h1d: out_low = 10'h3c1;
              5'h1e: out_low = 10'h3c1;
              5'h1f: out_low = 10'h3c1;
              default: out_low = 10'h000;
            endcase
          end
          5'h0e: begin
            case (mant[4:0])
              5'h00: out_low = 10'h3c1;
              5'h01: out_low = 10'h3c1;
              5'h02: out_low = 10'h3c1;
              5'h03: out_low = 10'h3c1;
              5'h04: out_low = 10'h3c1;
              5'h05: out_low = 10'h3c1;
              5'h06: out_low = 10'h3c1;
              5'h07: out_low = 10'h3c1;
              5'h08: out_low = 10'h3c1;
              5'h09: out_low = 10'h3c1;
              5'h0a: out_low = 10'h3c1;
              5'h0b: out_low = 10'h3c1;
              5'h0c: out_low = 10'h3c1;
              5'h0d: out_low = 10'h3c1;
              5'h0e: out_low = 10'h3c1;
              5'h0f: out_low = 10'h3c1;
              5'h10: out_low = 10'h3c1;
              5'h11: out_low = 10'h3c0;
              5'h12: out_low = 10'h3c0;
              5'h13: out_low = 10'h3c0;
              5'h14: out_low = 10'h3c0;
              5'h15: out_low = 10'h3c0;
              5'h16: out_low = 10'h3c0;
              5'h17: out_low = 10'h3c0;
              5'h18: out_low = 10'h3c0;
              5'h19: out_low = 10'h3c0;
              5'h1a: out_low = 10'h3c0;
              5'h1b: out_low = 10'h3c0;
              5'h1c: out_low = 10'h3c0;
              5'h1d: out_low = 10'h3c0;
              5'h1e: out_low = 10'h3c0;
              5'h1f: out_low = 10'h3c0;
              default: out_low = 10'h000;
            endcase
          end
          5'h0f: begin
            case (mant[4:0])
              5'h00: out_low = 10'h3c0;
              5'h01: out_low = 10'h3c0;
              5'h02: out_low = 10'h3c0;
              5'h03: out_low = 10'h3c0;
              5'h04: out_low = 10'h3c0;
              5'h05: out_low = 10'h3c0;
              5'h06: out_low = 10'h3c0;
              5'h07: out_low = 10'h3c0;
              5'h08: out_low = 10'h3c0;
              5'h09: out_low = 10'h3bf;
              5'h0a: out_low = 10'h3bf;
              5'h0b: out_low = 10'h3bf;
              5'h0c: out_low = 10'h3bf;
              5'h0d: out_low = 10'h3bf;
              5'h0e: out_low = 10'h3bf;
              5'h0f: out_low = 10'h3bf;
              5'h10: out_low = 10'h3bf;
              5'h11: out_low = 10'h3bf;
              5'h12: out_low = 10'h3bf;
              5'h13: out_low = 10'h3bf;
              5'h14: out_low = 10'h3bf;
              5'h15: out_low = 10'h3bf;
              5'h16: out_low = 10'h3bf;
              5'h17: out_low = 10'h3bf;
              5'h18: out_low = 10'h3bf;
              5'h19: out_low = 10'h3bf;
              5'h1a: out_low = 10'h3bf;
              5'h1b: out_low = 10'h3bf;
              5'h1c: out_low = 10'h3bf;
              5'h1d: out_low = 10'h3bf;
              5'h1e: out_low = 10'h3bf;
              5'h1f: out_low = 10'h3bf;
              default: out_low = 10'h000;
            endcase
          end
          5'h10: begin
            case (mant[4:0])
              5'h00: out_low = 10'h3bf;
              5'h01: out_low = 10'h3be;
              5'h02: out_low = 10'h3be;
              5'h03: out_low = 10'h3be;
              5'h04: out_low = 10'h3be;
              5'h05: out_low = 10'h3be;
              5'h06: out_low = 10'h3be;
              5'h07: out_low = 10'h3be;
              5'h08: out_low = 10'h3be;
              5'h09: out_low = 10'h3be;
              5'h0a: out_low = 10'h3be;
              5'h0b: out_low = 10'h3be;
              5'h0c: out_low = 10'h3be;
              5'h0d: out_low = 10'h3be;
              5'h0e: out_low = 10'h3be;
              5'h0f: out_low = 10'h3be;
              5'h10: out_low = 10'h3be;
              5'h11: out_low = 10'h3be;
              5'h12: out_low = 10'h3be;
              5'h13: out_low = 10'h3be;
              5'h14: out_low = 10'h3be;
              5'h15: out_low = 10'h3be;
              5'h16: out_low = 10'h3be;
              5'h17: out_low = 10'h3be;
              5'h18: out_low = 10'h3be;
              5'h19: out_low = 10'h3bd;
              5'h1a: out_low = 10'h3bd;
              5'h1b: out_low = 10'h3bd;
              5'h1c: out_low = 10'h3bd;
              5'h1d: out_low = 10'h3bd;
              5'h1e: out_low = 10'h3bd;
              5'h1f: out_low = 10'h3bd;
              default: out_low = 10'h000;
            endcase
          end
          5'h11: begin
            case (mant[4:0])
              5'h00: out_low = 10'h3bd;
              5'h01: out_low = 10'h3bd;
              5'h02: out_low = 10'h3bd;
              5'h03: out_low = 10'h3bd;
              5'h04: out_low = 10'h3bd;
              5'h05: out_low = 10'h3bd;
              5'h06: out_low = 10'h3bd;
              5'h07: out_low = 10'h3bd;
              5'h08: out_low = 10'h3bd;
              5'h09: out_low = 10'h3bd;
              5'h0a: out_low = 10'h3bd;
              5'h0b: out_low = 10'h3bd;
              5'h0c: out_low = 10'h3bd;
              5'h0d: out_low = 10'h3bd;
              5'h0e: out_low = 10'h3bd;
              5'h0f: out_low = 10'h3bd;
              5'h10: out_low = 10'h3bd;
              5'h11: out_low = 10'h3bc;
              5'h12: out_low = 10'h3bc;
              5'h13: out_low = 10'h3bc;
              5'h14: out_low = 10'h3bc;
              5'h15: out_low = 10'h3bc;
              5'h16: out_low = 10'h3bc;
              5'h17: out_low = 10'h3bc;
              5'h18: out_low = 10'h3bc;
              5'h19: out_low = 10'h3bc;
              5'h1a: out_low = 10'h3bc;
              5'h1b: out_low = 10'h3bc;
              5'h1c: out_low = 10'h3bc;
              5'h1d: out_low = 10'h3bc;
              5'h1e: out_low = 10'h3bc;
              5'h1f: out_low = 10'h3bc;
              default: out_low = 10'h000;
            endcase
          end
          5'h12: begin
            case (mant[4:0])
              5'h00: out_low = 10'h3bc;
              5'h01: out_low = 10'h3bc;
              5'h02: out_low = 10'h3bc;
              5'h03: out_low = 10'h3bc;
              5'h04: out_low = 10'h3bc;
              5'h05: out_low = 10'h3bc;
              5'h06: out_low = 10'h3bc;
              5'h07: out_low = 10'h3bc;
              5'h08: out_low = 10'h3bc;
              5'h09: out_low = 10'h3bb;
              5'h0a: out_low = 10'h3bb;
              5'h0b: out_low = 10'h3bb;
              5'h0c: out_low = 10'h3bb;
              5'h0d: out_low = 10'h3bb;
              5'h0e: out_low = 10'h3bb;
              5'h0f: out_low = 10'h3bb;
              5'h10: out_low = 10'h3bb;
              5'h11: out_low = 10'h3bb;
              5'h12: out_low = 10'h3bb;
              5'h13: out_low = 10'h3bb;
              5'h14: out_low = 10'h3bb;
              5'h15: out_low = 10'h3bb;
              5'h16: out_low = 10'h3bb;
              5'h17: out_low = 10'h3bb;
              5'h18: out_low = 10'h3bb;
              5'h19: out_low = 10'h3bb;
              5'h1a: out_low = 10'h3bb;
              5'h1b: out_low = 10'h3bb;
              5'h1c: out_low = 10'h3bb;
              5'h1d: out_low = 10'h3bb;
              5'h1e: out_low = 10'h3bb;
              5'h1f: out_low = 10'h3bb;
              default: out_low = 10'h000;
            endcase
          end
          5'h13: begin
            case (mant[4:0])
              5'h00: out_low = 10'h3bb;
              5'h01: out_low = 10'h3ba;
              5'h02: out_low = 10'h3ba;
              5'h03: out_low = 10'h3ba;
              5'h04: out_low = 10'h3ba;
              5'h05: out_low = 10'h3ba;
              5'h06: out_low = 10'h3ba;
              5'h07: out_low = 10'h3ba;
              5'h08: out_low = 10'h3ba;
              5'h09: out_low = 10'h3ba;
              5'h0a: out_low = 10'h3ba;
              5'h0b: out_low = 10'h3ba;
              5'h0c: out_low = 10'h3ba;
              5'h0d: out_low = 10'h3ba;
              5'h0e: out_low = 10'h3ba;
              5'h0f: out_low = 10'h3ba;
              5'h10: out_low = 10'h3ba;
              5'h11: out_low = 10'h3ba;
              5'h12: out_low = 10'h3ba;
              5'h13: out_low = 10'h3ba;
              5'h14: out_low = 10'h3ba;
              5'h15: out_low = 10'h3ba;
              5'h16: out_low = 10'h3ba;
              5'h17: out_low = 10'h3ba;
              5'h18: out_low = 10'h3ba;
              5'h19: out_low = 10'h3b9;
              5'h1a: out_low = 10'h3b9;
              5'h1b: out_low = 10'h3b9;
              5'h1c: out_low = 10'h3b9;
              5'h1d: out_low = 10'h3b9;
              5'h1e: out_low = 10'h3b9;
              5'h1f: out_low = 10'h3b9;
              default: out_low = 10'h000;
            endcase
          end
          5'h14: begin
            case (mant[4:0])
              5'h00: out_low = 10'h3b9;
              5'h01: out_low = 10'h3b9;
              5'h02: out_low = 10'h3b9;
              5'h03: out_low = 10'h3b9;
              5'h04: out_low = 10'h3b9;
              5'h05: out_low = 10'h3b9;
              5'h06: out_low = 10'h3b9;
              5'h07: out_low = 10'h3b9;
              5'h08: out_low = 10'h3b9;
              5'h09: out_low = 10'h3b9;
              5'h0a: out_low = 10'h3b9;
              5'h0b: out_low = 10'h3b9;
              5'h0c: out_low = 10'h3b9;
              5'h0d: out_low = 10'h3b9;
              5'h0e: out_low = 10'h3b9;
              5'h0f: out_low = 10'h3b9;
              5'h10: out_low = 10'h3b8;
              5'h11: out_low = 10'h3b8;
              5'h12: out_low = 10'h3b8;
              5'h13: out_low = 10'h3b8;
              5'h14: out_low = 10'h3b8;
              5'h15: out_low = 10'h3b8;
              5'h16: out_low = 10'h3b8;
              5'h17: out_low = 10'h3b8;
              5'h18: out_low = 10'h3b8;
              5'h19: out_low = 10'h3b8;
              5'h1a: out_low = 10'h3b8;
              5'h1b: out_low = 10'h3b8;
              5'h1c: out_low = 10'h3b8;
              5'h1d: out_low = 10'h3b8;
              5'h1e: out_low = 10'h3b8;
              5'h1f: out_low = 10'h3b8;
              default: out_low = 10'h000;
            endcase
          end
          5'h15: begin
            case (mant[4:0])
              5'h00: out_low = 10'h3b8;
              5'h01: out_low = 10'h3b8;
              5'h02: out_low = 10'h3b8;
              5'h03: out_low = 10'h3b8;
              5'h04: out_low = 10'h3b8;
              5'h05: out_low = 10'h3b8;
              5'h06: out_low = 10'h3b8;
              5'h07: out_low = 10'h3b8;
              5'h08: out_low = 10'h3b7;
              5'h09: out_low = 10'h3b7;
              5'h0a: out_low = 10'h3b7;
              5'h0b: out_low = 10'h3b7;
              5'h0c: out_low = 10'h3b7;
              5'h0d: out_low = 10'h3b7;
              5'h0e: out_low = 10'h3b7;
              5'h0f: out_low = 10'h3b7;
              5'h10: out_low = 10'h3b7;
              5'h11: out_low = 10'h3b7;
              5'h12: out_low = 10'h3b7;
              5'h13: out_low = 10'h3b7;
              5'h14: out_low = 10'h3b7;
              5'h15: out_low = 10'h3b7;
              5'h16: out_low = 10'h3b7;
              5'h17: out_low = 10'h3b7;
              5'h18: out_low = 10'h3b7;
              5'h19: out_low = 10'h3b7;
              5'h1a: out_low = 10'h3b7;
              5'h1b: out_low = 10'h3b7;
              5'h1c: out_low = 10'h3b7;
              5'h1d: out_low = 10'h3b7;
              5'h1e: out_low = 10'h3b7;
              5'h1f: out_low = 10'h3b7;
              default: out_low = 10'h000;
            endcase
          end
          5'h16: begin
            case (mant[4:0])
              5'h00: out_low = 10'h3b6;
              5'h01: out_low = 10'h3b6;
              5'h02: out_low = 10'h3b6;
              5'h03: out_low = 10'h3b6;
              5'h04: out_low = 10'h3b6;
              5'h05: out_low = 10'h3b6;
              5'h06: out_low = 10'h3b6;
              5'h07: out_low = 10'h3b6;
              5'h08: out_low = 10'h3b6;
              5'h09: out_low = 10'h3b6;
              5'h0a: out_low = 10'h3b6;
              5'h0b: out_low = 10'h3b6;
              5'h0c: out_low = 10'h3b6;
              5'h0d: out_low = 10'h3b6;
              5'h0e: out_low = 10'h3b6;
              5'h0f: out_low = 10'h3b6;
              5'h10: out_low = 10'h3b6;
              5'h11: out_low = 10'h3b6;
              5'h12: out_low = 10'h3b6;
              5'h13: out_low = 10'h3b6;
              5'h14: out_low = 10'h3b6;
              5'h15: out_low = 10'h3b6;
              5'h16: out_low = 10'h3b6;
              5'h17: out_low = 10'h3b6;
              5'h18: out_low = 10'h3b5;
              5'h19: out_low = 10'h3b5;
              5'h1a: out_low = 10'h3b5;
              5'h1b: out_low = 10'h3b5;
              5'h1c: out_low = 10'h3b5;
              5'h1d: out_low = 10'h3b5;
              5'h1e: out_low = 10'h3b5;
              5'h1f: out_low = 10'h3b5;
              default: out_low = 10'h000;
            endcase
          end
          5'h17: begin
            case (mant[4:0])
              5'h00: out_low = 10'h3b5;
              5'h01: out_low = 10'h3b5;
              5'h02: out_low = 10'h3b5;
              5'h03: out_low = 10'h3b5;
              5'h04: out_low = 10'h3b5;
              5'h05: out_low = 10'h3b5;
              5'h06: out_low = 10'h3b5;
              5'h07: out_low = 10'h3b5;
              5'h08: out_low = 10'h3b5;
              5'h09: out_low = 10'h3b5;
              5'h0a: out_low = 10'h3b5;
              5'h0b: out_low = 10'h3b5;
              5'h0c: out_low = 10'h3b5;
              5'h0d: out_low = 10'h3b5;
              5'h0e: out_low = 10'h3b5;
              5'h0f: out_low = 10'h3b5;
              5'h10: out_low = 10'h3b4;
              5'h11: out_low = 10'h3b4;
              5'h12: out_low = 10'h3b4;
              5'h13: out_low = 10'h3b4;
              5'h14: out_low = 10'h3b4;
              5'h15: out_low = 10'h3b4;
              5'h16: out_low = 10'h3b4;
              5'h17: out_low = 10'h3b4;
              5'h18: out_low = 10'h3b4;
              5'h19: out_low = 10'h3b4;
              5'h1a: out_low = 10'h3b4;
              5'h1b: out_low = 10'h3b4;
              5'h1c: out_low = 10'h3b4;
              5'h1d: out_low = 10'h3b4;
              5'h1e: out_low = 10'h3b4;
              5'h1f: out_low = 10'h3b4;
              default: out_low = 10'h000;
            endcase
          end
          5'h18: begin
            case (mant[4:0])
              5'h00: out_low = 10'h3b4;
              5'h01: out_low = 10'h3b4;
              5'h02: out_low = 10'h3b4;
              5'h03: out_low = 10'h3b4;
              5'h04: out_low = 10'h3b4;
              5'h05: out_low = 10'h3b4;
              5'h06: out_low = 10'h3b4;
              5'h07: out_low = 10'h3b4;
              5'h08: out_low = 10'h3b3;
              5'h09: out_low = 10'h3b3;
              5'h0a: out_low = 10'h3b3;
              5'h0b: out_low = 10'h3b3;
              5'h0c: out_low = 10'h3b3;
              5'h0d: out_low = 10'h3b3;
              5'h0e: out_low = 10'h3b3;
              5'h0f: out_low = 10'h3b3;
              5'h10: out_low = 10'h3b3;
              5'h11: out_low = 10'h3b3;
              5'h12: out_low = 10'h3b3;
              5'h13: out_low = 10'h3b3;
              5'h14: out_low = 10'h3b3;
              5'h15: out_low = 10'h3b3;
              5'h16: out_low = 10'h3b3;
              5'h17: out_low = 10'h3b3;
              5'h18: out_low = 10'h3b3;
              5'h19: out_low = 10'h3b3;
              5'h1a: out_low = 10'h3b3;
              5'h1b: out_low = 10'h3b3;
              5'h1c: out_low = 10'h3b3;
              5'h1d: out_low = 10'h3b3;
              5'h1e: out_low = 10'h3b3;
              5'h1f: out_low = 10'h3b3;
              default: out_low = 10'h000;
            endcase
          end
          5'h19: begin
            case (mant[4:0])
              5'h00: out_low = 10'h3b2;
              5'h01: out_low = 10'h3b2;
              5'h02: out_low = 10'h3b2;
              5'h03: out_low = 10'h3b2;
              5'h04: out_low = 10'h3b2;
              5'h05: out_low = 10'h3b2;
              5'h06: out_low = 10'h3b2;
              5'h07: out_low = 10'h3b2;
              5'h08: out_low = 10'h3b2;
              5'h09: out_low = 10'h3b2;
              5'h0a: out_low = 10'h3b2;
              5'h0b: out_low = 10'h3b2;
              5'h0c: out_low = 10'h3b2;
              5'h0d: out_low = 10'h3b2;
              5'h0e: out_low = 10'h3b2;
              5'h0f: out_low = 10'h3b2;
              5'h10: out_low = 10'h3b2;
              5'h11: out_low = 10'h3b2;
              5'h12: out_low = 10'h3b2;
              5'h13: out_low = 10'h3b2;
              5'h14: out_low = 10'h3b2;
              5'h15: out_low = 10'h3b2;
              5'h16: out_low = 10'h3b2;
              5'h17: out_low = 10'h3b2;
              5'h18: out_low = 10'h3b1;
              5'h19: out_low = 10'h3b1;
              5'h1a: out_low = 10'h3b1;
              5'h1b: out_low = 10'h3b1;
              5'h1c: out_low = 10'h3b1;
              5'h1d: out_low = 10'h3b1;
              5'h1e: out_low = 10'h3b1;
              5'h1f: out_low = 10'h3b1;
              default: out_low = 10'h000;
            endcase
          end
          5'h1a: begin
            case (mant[4:0])
              5'h00: out_low = 10'h3b1;
              5'h01: out_low = 10'h3b1;
              5'h02: out_low = 10'h3b1;
              5'h03: out_low = 10'h3b1;
              5'h04: out_low = 10'h3b1;
              5'h05: out_low = 10'h3b1;
              5'h06: out_low = 10'h3b1;
              5'h07: out_low = 10'h3b1;
              5'h08: out_low = 10'h3b1;
              5'h09: out_low = 10'h3b1;
              5'h0a: out_low = 10'h3b1;
              5'h0b: out_low = 10'h3b1;
              5'h0c: out_low = 10'h3b1;
              5'h0d: out_low = 10'h3b1;
              5'h0e: out_low = 10'h3b1;
              5'h0f: out_low = 10'h3b1;
              5'h10: out_low = 10'h3b0;
              5'h11: out_low = 10'h3b0;
              5'h12: out_low = 10'h3b0;
              5'h13: out_low = 10'h3b0;
              5'h14: out_low = 10'h3b0;
              5'h15: out_low = 10'h3b0;
              5'h16: out_low = 10'h3b0;
              5'h17: out_low = 10'h3b0;
              5'h18: out_low = 10'h3b0;
              5'h19: out_low = 10'h3b0;
              5'h1a: out_low = 10'h3b0;
              5'h1b: out_low = 10'h3b0;
              5'h1c: out_low = 10'h3b0;
              5'h1d: out_low = 10'h3b0;
              5'h1e: out_low = 10'h3b0;
              5'h1f: out_low = 10'h3b0;
              default: out_low = 10'h000;
            endcase
          end
          5'h1b: begin
            case (mant[4:0])
              5'h00: out_low = 10'h3b0;
              5'h01: out_low = 10'h3b0;
              5'h02: out_low = 10'h3b0;
              5'h03: out_low = 10'h3b0;
              5'h04: out_low = 10'h3b0;
              5'h05: out_low = 10'h3b0;
              5'h06: out_low = 10'h3b0;
              5'h07: out_low = 10'h3b0;
              5'h08: out_low = 10'h3af;
              5'h09: out_low = 10'h3af;
              5'h0a: out_low = 10'h3af;
              5'h0b: out_low = 10'h3af;
              5'h0c: out_low = 10'h3af;
              5'h0d: out_low = 10'h3af;
              5'h0e: out_low = 10'h3af;
              5'h0f: out_low = 10'h3af;
              5'h10: out_low = 10'h3af;
              5'h11: out_low = 10'h3af;
              5'h12: out_low = 10'h3af;
              5'h13: out_low = 10'h3af;
              5'h14: out_low = 10'h3af;
              5'h15: out_low = 10'h3af;
              5'h16: out_low = 10'h3af;
              5'h17: out_low = 10'h3af;
              5'h18: out_low = 10'h3af;
              5'h19: out_low = 10'h3af;
              5'h1a: out_low = 10'h3af;
              5'h1b: out_low = 10'h3af;
              5'h1c: out_low = 10'h3af;
              5'h1d: out_low = 10'h3af;
              5'h1e: out_low = 10'h3af;
              5'h1f: out_low = 10'h3af;
              default: out_low = 10'h000;
            endcase
          end
          5'h1c: begin
            case (mant[4:0])
              5'h00: out_low = 10'h3ae;
              5'h01: out_low = 10'h3ae;
              5'h02: out_low = 10'h3ae;
              5'h03: out_low = 10'h3ae;
              5'h04: out_low = 10'h3ae;
              5'h05: out_low = 10'h3ae;
              5'h06: out_low = 10'h3ae;
              5'h07: out_low = 10'h3ae;
              5'h08: out_low = 10'h3ae;
              5'h09: out_low = 10'h3ae;
              5'h0a: out_low = 10'h3ae;
              5'h0b: out_low = 10'h3ae;
              5'h0c: out_low = 10'h3ae;
              5'h0d: out_low = 10'h3ae;
              5'h0e: out_low = 10'h3ae;
              5'h0f: out_low = 10'h3ae;
              5'h10: out_low = 10'h3ae;
              5'h11: out_low = 10'h3ae;
              5'h12: out_low = 10'h3ae;
              5'h13: out_low = 10'h3ae;
              5'h14: out_low = 10'h3ae;
              5'h15: out_low = 10'h3ae;
              5'h16: out_low = 10'h3ae;
              5'h17: out_low = 10'h3ae;
              5'h18: out_low = 10'h3ad;
              5'h19: out_low = 10'h3ad;
              5'h1a: out_low = 10'h3ad;
              5'h1b: out_low = 10'h3ad;
              5'h1c: out_low = 10'h3ad;
              5'h1d: out_low = 10'h3ad;
              5'h1e: out_low = 10'h3ad;
              5'h1f: out_low = 10'h3ad;
              default: out_low = 10'h000;
            endcase
          end
          5'h1d: begin
            case (mant[4:0])
              5'h00: out_low = 10'h3ad;
              5'h01: out_low = 10'h3ad;
              5'h02: out_low = 10'h3ad;
              5'h03: out_low = 10'h3ad;
              5'h04: out_low = 10'h3ad;
              5'h05: out_low = 10'h3ad;
              5'h06: out_low = 10'h3ad;
              5'h07: out_low = 10'h3ad;
              5'h08: out_low = 10'h3ad;
              5'h09: out_low = 10'h3ad;
              5'h0a: out_low = 10'h3ad;
              5'h0b: out_low = 10'h3ad;
              5'h0c: out_low = 10'h3ad;
              5'h0d: out_low = 10'h3ad;
              5'h0e: out_low = 10'h3ad;
              5'h0f: out_low = 10'h3ad;
              5'h10: out_low = 10'h3ac;
              5'h11: out_low = 10'h3ac;
              5'h12: out_low = 10'h3ac;
              5'h13: out_low = 10'h3ac;
              5'h14: out_low = 10'h3ac;
              5'h15: out_low = 10'h3ac;
              5'h16: out_low = 10'h3ac;
              5'h17: out_low = 10'h3ac;
              5'h18: out_low = 10'h3ac;
              5'h19: out_low = 10'h3ac;
              5'h1a: out_low = 10'h3ac;
              5'h1b: out_low = 10'h3ac;
              5'h1c: out_low = 10'h3ac;
              5'h1d: out_low = 10'h3ac;
              5'h1e: out_low = 10'h3ac;
              5'h1f: out_low = 10'h3ac;
              default: out_low = 10'h000;
            endcase
          end
          5'h1e: begin
            case (mant[4:0])
              5'h00: out_low = 10'h3ac;
              5'h01: out_low = 10'h3ac;
              5'h02: out_low = 10'h3ac;
              5'h03: out_low = 10'h3ac;
              5'h04: out_low = 10'h3ac;
              5'h05: out_low = 10'h3ac;
              5'h06: out_low = 10'h3ac;
              5'h07: out_low = 10'h3ac;
              5'h08: out_low = 10'h3ab;
              5'h09: out_low = 10'h3ab;
              5'h0a: out_low = 10'h3ab;
              5'h0b: out_low = 10'h3ab;
              5'h0c: out_low = 10'h3ab;
              5'h0d: out_low = 10'h3ab;
              5'h0e: out_low = 10'h3ab;
              5'h0f: out_low = 10'h3ab;
              5'h10: out_low = 10'h3ab;
              5'h11: out_low = 10'h3ab;
              5'h12: out_low = 10'h3ab;
              5'h13: out_low = 10'h3ab;
              5'h14: out_low = 10'h3ab;
              5'h15: out_low = 10'h3ab;
              5'h16: out_low = 10'h3ab;
              5'h17: out_low = 10'h3ab;
              5'h18: out_low = 10'h3ab;
              5'h19: out_low = 10'h3ab;
              5'h1a: out_low = 10'h3ab;
              5'h1b: out_low = 10'h3ab;
              5'h1c: out_low = 10'h3ab;
              5'h1d: out_low = 10'h3ab;
              5'h1e: out_low = 10'h3ab;
              5'h1f: out_low = 10'h3ab;
              default: out_low = 10'h000;
            endcase
          end
          5'h1f: begin
            case (mant[4:0])
              5'h00: out_low = 10'h3aa;
              5'h01: out_low = 10'h3aa;
              5'h02: out_low = 10'h3aa;
              5'h03: out_low = 10'h3aa;
              5'h04: out_low = 10'h3aa;
              5'h05: out_low = 10'h3aa;
              5'h06: out_low = 10'h3aa;
              5'h07: out_low = 10'h3aa;
              5'h08: out_low = 10'h3aa;
              5'h09: out_low = 10'h3aa;
              5'h0a: out_low = 10'h3aa;
              5'h0b: out_low = 10'h3aa;
              5'h0c: out_low = 10'h3aa;
              5'h0d: out_low = 10'h3aa;
              5'h0e: out_low = 10'h3aa;
              5'h0f: out_low = 10'h3aa;
              5'h10: out_low = 10'h3aa;
              5'h11: out_low = 10'h3aa;
              5'h12: out_low = 10'h3aa;
              5'h13: out_low = 10'h3aa;
              5'h14: out_low = 10'h3aa;
              5'h15: out_low = 10'h3aa;
              5'h16: out_low = 10'h3aa;
              5'h17: out_low = 10'h3aa;
              5'h18: out_low = 10'h3aa;
              5'h19: out_low = 10'h3a9;
              5'h1a: out_low = 10'h3a9;
              5'h1b: out_low = 10'h3a9;
              5'h1c: out_low = 10'h3a9;
              5'h1d: out_low = 10'h3a9;
              5'h1e: out_low = 10'h3a9;
              5'h1f: out_low = 10'h3a9;
              default: out_low = 10'h000;
            endcase
          end
          default: out_low = 10'h000;
        endcase
      end
      6'h2b: begin
        case (mant[9:5])
          5'h00: begin
            case (mant[4:0])
              5'h00: out_low = 10'h3a9;
              5'h01: out_low = 10'h3a9;
              5'h02: out_low = 10'h3a9;
              5'h03: out_low = 10'h3a9;
              5'h04: out_low = 10'h3a9;
              5'h05: out_low = 10'h3a9;
              5'h06: out_low = 10'h3a9;
              5'h07: out_low = 10'h3a9;
              5'h08: out_low = 10'h3a9;
              5'h09: out_low = 10'h3a8;
              5'h0a: out_low = 10'h3a8;
              5'h0b: out_low = 10'h3a8;
              5'h0c: out_low = 10'h3a8;
              5'h0d: out_low = 10'h3a8;
              5'h0e: out_low = 10'h3a8;
              5'h0f: out_low = 10'h3a8;
              5'h10: out_low = 10'h3a8;
              5'h11: out_low = 10'h3a8;
              5'h12: out_low = 10'h3a8;
              5'h13: out_low = 10'h3a8;
              5'h14: out_low = 10'h3a8;
              5'h15: out_low = 10'h3a7;
              5'h16: out_low = 10'h3a7;
              5'h17: out_low = 10'h3a7;
              5'h18: out_low = 10'h3a7;
              5'h19: out_low = 10'h3a7;
              5'h1a: out_low = 10'h3a7;
              5'h1b: out_low = 10'h3a7;
              5'h1c: out_low = 10'h3a7;
              5'h1d: out_low = 10'h3a7;
              5'h1e: out_low = 10'h3a7;
              5'h1f: out_low = 10'h3a7;
              default: out_low = 10'h000;
            endcase
          end
          5'h01: begin
            case (mant[4:0])
              5'h00: out_low = 10'h3a7;
              5'h01: out_low = 10'h3a6;
              5'h02: out_low = 10'h3a6;
              5'h03: out_low = 10'h3a6;
              5'h04: out_low = 10'h3a6;
              5'h05: out_low = 10'h3a6;
              5'h06: out_low = 10'h3a6;
              5'h07: out_low = 10'h3a6;
              5'h08: out_low = 10'h3a6;
              5'h09: out_low = 10'h3a6;
              5'h0a: out_low = 10'h3a6;
              5'h0b: out_low = 10'h3a6;
              5'h0c: out_low = 10'h3a6;
              5'h0d: out_low = 10'h3a5;
              5'h0e: out_low = 10'h3a5;
              5'h0f: out_low = 10'h3a5;
              5'h10: out_low = 10'h3a5;
              5'h11: out_low = 10'h3a5;
              5'h12: out_low = 10'h3a5;
              5'h13: out_low = 10'h3a5;
              5'h14: out_low = 10'h3a5;
              5'h15: out_low = 10'h3a5;
              5'h16: out_low = 10'h3a5;
              5'h17: out_low = 10'h3a5;
              5'h18: out_low = 10'h3a5;
              5'h19: out_low = 10'h3a4;
              5'h1a: out_low = 10'h3a4;
              5'h1b: out_low = 10'h3a4;
              5'h1c: out_low = 10'h3a4;
              5'h1d: out_low = 10'h3a4;
              5'h1e: out_low = 10'h3a4;
              5'h1f: out_low = 10'h3a4;
              default: out_low = 10'h000;
            endcase
          end
          5'h02: begin
            case (mant[4:0])
              5'h00: out_low = 10'h3a4;
              5'h01: out_low = 10'h3a4;
              5'h02: out_low = 10'h3a4;
              5'h03: out_low = 10'h3a4;
              5'h04: out_low = 10'h3a4;
              5'h05: out_low = 10'h3a3;
              5'h06: out_low = 10'h3a3;
              5'h07: out_low = 10'h3a3;
              5'h08: out_low = 10'h3a3;
              5'h09: out_low = 10'h3a3;
              5'h0a: out_low = 10'h3a3;
              5'h0b: out_low = 10'h3a3;
              5'h0c: out_low = 10'h3a3;
              5'h0d: out_low = 10'h3a3;
              5'h0e: out_low = 10'h3a3;
              5'h0f: out_low = 10'h3a3;
              5'h10: out_low = 10'h3a3;
              5'h11: out_low = 10'h3a2;
              5'h12: out_low = 10'h3a2;
              5'h13: out_low = 10'h3a2;
              5'h14: out_low = 10'h3a2;
              5'h15: out_low = 10'h3a2;
              5'h16: out_low = 10'h3a2;
              5'h17: out_low = 10'h3a2;
              5'h18: out_low = 10'h3a2;
              5'h19: out_low = 10'h3a2;
              5'h1a: out_low = 10'h3a2;
              5'h1b: out_low = 10'h3a2;
              5'h1c: out_low = 10'h3a2;
              5'h1d: out_low = 10'h3a1;
              5'h1e: out_low = 10'h3a1;
              5'h1f: out_low = 10'h3a1;
              default: out_low = 10'h000;
            endcase
          end
          5'h03: begin
            case (mant[4:0])
              5'h00: out_low = 10'h3a1;
              5'h01: out_low = 10'h3a1;
              5'h02: out_low = 10'h3a1;
              5'h03: out_low = 10'h3a1;
              5'h04: out_low = 10'h3a1;
              5'h05: out_low = 10'h3a1;
              5'h06: out_low = 10'h3a1;
              5'h07: out_low = 10'h3a1;
              5'h08: out_low = 10'h3a1;
              5'h09: out_low = 10'h3a0;
              5'h0a: out_low = 10'h3a0;
              5'h0b: out_low = 10'h3a0;
              5'h0c: out_low = 10'h3a0;
              5'h0d: out_low = 10'h3a0;
              5'h0e: out_low = 10'h3a0;
              5'h0f: out_low = 10'h3a0;
              5'h10: out_low = 10'h3a0;
              5'h11: out_low = 10'h3a0;
              5'h12: out_low = 10'h3a0;
              5'h13: out_low = 10'h3a0;
              5'h14: out_low = 10'h3a0;
              5'h15: out_low = 10'h39f;
              5'h16: out_low = 10'h39f;
              5'h17: out_low = 10'h39f;
              5'h18: out_low = 10'h39f;
              5'h19: out_low = 10'h39f;
              5'h1a: out_low = 10'h39f;
              5'h1b: out_low = 10'h39f;
              5'h1c: out_low = 10'h39f;
              5'h1d: out_low = 10'h39f;
              5'h1e: out_low = 10'h39f;
              5'h1f: out_low = 10'h39f;
              default: out_low = 10'h000;
            endcase
          end
          5'h04: begin
            case (mant[4:0])
              5'h00: out_low = 10'h39f;
              5'h01: out_low = 10'h39e;
              5'h02: out_low = 10'h39e;
              5'h03: out_low = 10'h39e;
              5'h04: out_low = 10'h39e;
              5'h05: out_low = 10'h39e;
              5'h06: out_low = 10'h39e;
              5'h07: out_low = 10'h39e;
              5'h08: out_low = 10'h39e;
              5'h09: out_low = 10'h39e;
              5'h0a: out_low = 10'h39e;
              5'h0b: out_low = 10'h39e;
              5'h0c: out_low = 10'h39e;
              5'h0d: out_low = 10'h39e;
              5'h0e: out_low = 10'h39d;
              5'h0f: out_low = 10'h39d;
              5'h10: out_low = 10'h39d;
              5'h11: out_low = 10'h39d;
              5'h12: out_low = 10'h39d;
              5'h13: out_low = 10'h39d;
              5'h14: out_low = 10'h39d;
              5'h15: out_low = 10'h39d;
              5'h16: out_low = 10'h39d;
              5'h17: out_low = 10'h39d;
              5'h18: out_low = 10'h39d;
              5'h19: out_low = 10'h39d;
              5'h1a: out_low = 10'h39c;
              5'h1b: out_low = 10'h39c;
              5'h1c: out_low = 10'h39c;
              5'h1d: out_low = 10'h39c;
              5'h1e: out_low = 10'h39c;
              5'h1f: out_low = 10'h39c;
              default: out_low = 10'h000;
            endcase
          end
          5'h05: begin
            case (mant[4:0])
              5'h00: out_low = 10'h39c;
              5'h01: out_low = 10'h39c;
              5'h02: out_low = 10'h39c;
              5'h03: out_low = 10'h39c;
              5'h04: out_low = 10'h39c;
              5'h05: out_low = 10'h39c;
              5'h06: out_low = 10'h39b;
              5'h07: out_low = 10'h39b;
              5'h08: out_low = 10'h39b;
              5'h09: out_low = 10'h39b;
              5'h0a: out_low = 10'h39b;
              5'h0b: out_low = 10'h39b;
              5'h0c: out_low = 10'h39b;
              5'h0d: out_low = 10'h39b;
              5'h0e: out_low = 10'h39b;
              5'h0f: out_low = 10'h39b;
              5'h10: out_low = 10'h39b;
              5'h11: out_low = 10'h39b;
              5'h12: out_low = 10'h39a;
              5'h13: out_low = 10'h39a;
              5'h14: out_low = 10'h39a;
              5'h15: out_low = 10'h39a;
              5'h16: out_low = 10'h39a;
              5'h17: out_low = 10'h39a;
              5'h18: out_low = 10'h39a;
              5'h19: out_low = 10'h39a;
              5'h1a: out_low = 10'h39a;
              5'h1b: out_low = 10'h39a;
              5'h1c: out_low = 10'h39a;
              5'h1d: out_low = 10'h39a;
              5'h1e: out_low = 10'h399;
              5'h1f: out_low = 10'h399;
              default: out_low = 10'h000;
            endcase
          end
          5'h06: begin
            case (mant[4:0])
              5'h00: out_low = 10'h399;
              5'h01: out_low = 10'h399;
              5'h02: out_low = 10'h399;
              5'h03: out_low = 10'h399;
              5'h04: out_low = 10'h399;
              5'h05: out_low = 10'h399;
              5'h06: out_low = 10'h399;
              5'h07: out_low = 10'h399;
              5'h08: out_low = 10'h399;
              5'h09: out_low = 10'h399;
              5'h0a: out_low = 10'h398;
              5'h0b: out_low = 10'h398;
              5'h0c: out_low = 10'h398;
              5'h0d: out_low = 10'h398;
              5'h0e: out_low = 10'h398;
              5'h0f: out_low = 10'h398;
              5'h10: out_low = 10'h398;
              5'h11: out_low = 10'h398;
              5'h12: out_low = 10'h398;
              5'h13: out_low = 10'h398;
              5'h14: out_low = 10'h398;
              5'h15: out_low = 10'h398;
              5'h16: out_low = 10'h397;
              5'h17: out_low = 10'h397;
              5'h18: out_low = 10'h397;
              5'h19: out_low = 10'h397;
              5'h1a: out_low = 10'h397;
              5'h1b: out_low = 10'h397;
              5'h1c: out_low = 10'h397;
              5'h1d: out_low = 10'h397;
              5'h1e: out_low = 10'h397;
              5'h1f: out_low = 10'h397;
              default: out_low = 10'h000;
            endcase
          end
          5'h07: begin
            case (mant[4:0])
              5'h00: out_low = 10'h397;
              5'h01: out_low = 10'h397;
              5'h02: out_low = 10'h397;
              5'h03: out_low = 10'h396;
              5'h04: out_low = 10'h396;
              5'h05: out_low = 10'h396;
              5'h06: out_low = 10'h396;
              5'h07: out_low = 10'h396;
              5'h08: out_low = 10'h396;
              5'h09: out_low = 10'h396;
              5'h0a: out_low = 10'h396;
              5'h0b: out_low = 10'h396;
              5'h0c: out_low = 10'h396;
              5'h0d: out_low = 10'h396;
              5'h0e: out_low = 10'h396;
              5'h0f: out_low = 10'h395;
              5'h10: out_low = 10'h395;
              5'h11: out_low = 10'h395;
              5'h12: out_low = 10'h395;
              5'h13: out_low = 10'h395;
              5'h14: out_low = 10'h395;
              5'h15: out_low = 10'h395;
              5'h16: out_low = 10'h395;
              5'h17: out_low = 10'h395;
              5'h18: out_low = 10'h395;
              5'h19: out_low = 10'h395;
              5'h1a: out_low = 10'h395;
              5'h1b: out_low = 10'h394;
              5'h1c: out_low = 10'h394;
              5'h1d: out_low = 10'h394;
              5'h1e: out_low = 10'h394;
              5'h1f: out_low = 10'h394;
              default: out_low = 10'h000;
            endcase
          end
          5'h08: begin
            case (mant[4:0])
              5'h00: out_low = 10'h394;
              5'h01: out_low = 10'h394;
              5'h02: out_low = 10'h394;
              5'h03: out_low = 10'h394;
              5'h04: out_low = 10'h394;
              5'h05: out_low = 10'h394;
              5'h06: out_low = 10'h394;
              5'h07: out_low = 10'h393;
              5'h08: out_low = 10'h393;
              5'h09: out_low = 10'h393;
              5'h0a: out_low = 10'h393;
              5'h0b: out_low = 10'h393;
              5'h0c: out_low = 10'h393;
              5'h0d: out_low = 10'h393;
              5'h0e: out_low = 10'h393;
              5'h0f: out_low = 10'h393;
              5'h10: out_low = 10'h393;
              5'h11: out_low = 10'h393;
              5'h12: out_low = 10'h393;
              5'h13: out_low = 10'h392;
              5'h14: out_low = 10'h392;
              5'h15: out_low = 10'h392;
              5'h16: out_low = 10'h392;
              5'h17: out_low = 10'h392;
              5'h18: out_low = 10'h392;
              5'h19: out_low = 10'h392;
              5'h1a: out_low = 10'h392;
              5'h1b: out_low = 10'h392;
              5'h1c: out_low = 10'h392;
              5'h1d: out_low = 10'h392;
              5'h1e: out_low = 10'h392;
              5'h1f: out_low = 10'h392;
              default: out_low = 10'h000;
            endcase
          end
          5'h09: begin
            case (mant[4:0])
              5'h00: out_low = 10'h391;
              5'h01: out_low = 10'h391;
              5'h02: out_low = 10'h391;
              5'h03: out_low = 10'h391;
              5'h04: out_low = 10'h391;
              5'h05: out_low = 10'h391;
              5'h06: out_low = 10'h391;
              5'h07: out_low = 10'h391;
              5'h08: out_low = 10'h391;
              5'h09: out_low = 10'h391;
              5'h0a: out_low = 10'h391;
              5'h0b: out_low = 10'h391;
              5'h0c: out_low = 10'h390;
              5'h0d: out_low = 10'h390;
              5'h0e: out_low = 10'h390;
              5'h0f: out_low = 10'h390;
              5'h10: out_low = 10'h390;
              5'h11: out_low = 10'h390;
              5'h12: out_low = 10'h390;
              5'h13: out_low = 10'h390;
              5'h14: out_low = 10'h390;
              5'h15: out_low = 10'h390;
              5'h16: out_low = 10'h390;
              5'h17: out_low = 10'h390;
              5'h18: out_low = 10'h38f;
              5'h19: out_low = 10'h38f;
              5'h1a: out_low = 10'h38f;
              5'h1b: out_low = 10'h38f;
              5'h1c: out_low = 10'h38f;
              5'h1d: out_low = 10'h38f;
              5'h1e: out_low = 10'h38f;
              5'h1f: out_low = 10'h38f;
              default: out_low = 10'h000;
            endcase
          end
          5'h0a: begin
            case (mant[4:0])
              5'h00: out_low = 10'h38f;
              5'h01: out_low = 10'h38f;
              5'h02: out_low = 10'h38f;
              5'h03: out_low = 10'h38f;
              5'h04: out_low = 10'h38e;
              5'h05: out_low = 10'h38e;
              5'h06: out_low = 10'h38e;
              5'h07: out_low = 10'h38e;
              5'h08: out_low = 10'h38e;
              5'h09: out_low = 10'h38e;
              5'h0a: out_low = 10'h38e;
              5'h0b: out_low = 10'h38e;
              5'h0c: out_low = 10'h38e;
              5'h0d: out_low = 10'h38e;
              5'h0e: out_low = 10'h38e;
              5'h0f: out_low = 10'h38e;
              5'h10: out_low = 10'h38d;
              5'h11: out_low = 10'h38d;
              5'h12: out_low = 10'h38d;
              5'h13: out_low = 10'h38d;
              5'h14: out_low = 10'h38d;
              5'h15: out_low = 10'h38d;
              5'h16: out_low = 10'h38d;
              5'h17: out_low = 10'h38d;
              5'h18: out_low = 10'h38d;
              5'h19: out_low = 10'h38d;
              5'h1a: out_low = 10'h38d;
              5'h1b: out_low = 10'h38d;
              5'h1c: out_low = 10'h38d;
              5'h1d: out_low = 10'h38c;
              5'h1e: out_low = 10'h38c;
              5'h1f: out_low = 10'h38c;
              default: out_low = 10'h000;
            endcase
          end
          5'h0b: begin
            case (mant[4:0])
              5'h00: out_low = 10'h38c;
              5'h01: out_low = 10'h38c;
              5'h02: out_low = 10'h38c;
              5'h03: out_low = 10'h38c;
              5'h04: out_low = 10'h38c;
              5'h05: out_low = 10'h38c;
              5'h06: out_low = 10'h38c;
              5'h07: out_low = 10'h38c;
              5'h08: out_low = 10'h38c;
              5'h09: out_low = 10'h38b;
              5'h0a: out_low = 10'h38b;
              5'h0b: out_low = 10'h38b;
              5'h0c: out_low = 10'h38b;
              5'h0d: out_low = 10'h38b;
              5'h0e: out_low = 10'h38b;
              5'h0f: out_low = 10'h38b;
              5'h10: out_low = 10'h38b;
              5'h11: out_low = 10'h38b;
              5'h12: out_low = 10'h38b;
              5'h13: out_low = 10'h38b;
              5'h14: out_low = 10'h38b;
              5'h15: out_low = 10'h38a;
              5'h16: out_low = 10'h38a;
              5'h17: out_low = 10'h38a;
              5'h18: out_low = 10'h38a;
              5'h19: out_low = 10'h38a;
              5'h1a: out_low = 10'h38a;
              5'h1b: out_low = 10'h38a;
              5'h1c: out_low = 10'h38a;
              5'h1d: out_low = 10'h38a;
              5'h1e: out_low = 10'h38a;
              5'h1f: out_low = 10'h38a;
              default: out_low = 10'h000;
            endcase
          end
          5'h0c: begin
            case (mant[4:0])
              5'h00: out_low = 10'h38a;
              5'h01: out_low = 10'h389;
              5'h02: out_low = 10'h389;
              5'h03: out_low = 10'h389;
              5'h04: out_low = 10'h389;
              5'h05: out_low = 10'h389;
              5'h06: out_low = 10'h389;
              5'h07: out_low = 10'h389;
              5'h08: out_low = 10'h389;
              5'h09: out_low = 10'h389;
              5'h0a: out_low = 10'h389;
              5'h0b: out_low = 10'h389;
              5'h0c: out_low = 10'h389;
              5'h0d: out_low = 10'h389;
              5'h0e: out_low = 10'h388;
              5'h0f: out_low = 10'h388;
              5'h10: out_low = 10'h388;
              5'h11: out_low = 10'h388;
              5'h12: out_low = 10'h388;
              5'h13: out_low = 10'h388;
              5'h14: out_low = 10'h388;
              5'h15: out_low = 10'h388;
              5'h16: out_low = 10'h388;
              5'h17: out_low = 10'h388;
              5'h18: out_low = 10'h388;
              5'h19: out_low = 10'h388;
              5'h1a: out_low = 10'h387;
              5'h1b: out_low = 10'h387;
              5'h1c: out_low = 10'h387;
              5'h1d: out_low = 10'h387;
              5'h1e: out_low = 10'h387;
              5'h1f: out_low = 10'h387;
              default: out_low = 10'h000;
            endcase
          end
          5'h0d: begin
            case (mant[4:0])
              5'h00: out_low = 10'h387;
              5'h01: out_low = 10'h387;
              5'h02: out_low = 10'h387;
              5'h03: out_low = 10'h387;
              5'h04: out_low = 10'h387;
              5'h05: out_low = 10'h387;
              5'h06: out_low = 10'h386;
              5'h07: out_low = 10'h386;
              5'h08: out_low = 10'h386;
              5'h09: out_low = 10'h386;
              5'h0a: out_low = 10'h386;
              5'h0b: out_low = 10'h386;
              5'h0c: out_low = 10'h386;
              5'h0d: out_low = 10'h386;
              5'h0e: out_low = 10'h386;
              5'h0f: out_low = 10'h386;
              5'h10: out_low = 10'h386;
              5'h11: out_low = 10'h386;
              5'h12: out_low = 10'h385;
              5'h13: out_low = 10'h385;
              5'h14: out_low = 10'h385;
              5'h15: out_low = 10'h385;
              5'h16: out_low = 10'h385;
              5'h17: out_low = 10'h385;
              5'h18: out_low = 10'h385;
              5'h19: out_low = 10'h385;
              5'h1a: out_low = 10'h385;
              5'h1b: out_low = 10'h385;
              5'h1c: out_low = 10'h385;
              5'h1d: out_low = 10'h385;
              5'h1e: out_low = 10'h385;
              5'h1f: out_low = 10'h384;
              default: out_low = 10'h000;
            endcase
          end
          5'h0e: begin
            case (mant[4:0])
              5'h00: out_low = 10'h384;
              5'h01: out_low = 10'h384;
              5'h02: out_low = 10'h384;
              5'h03: out_low = 10'h384;
              5'h04: out_low = 10'h384;
              5'h05: out_low = 10'h384;
              5'h06: out_low = 10'h384;
              5'h07: out_low = 10'h384;
              5'h08: out_low = 10'h384;
              5'h09: out_low = 10'h384;
              5'h0a: out_low = 10'h384;
              5'h0b: out_low = 10'h383;
              5'h0c: out_low = 10'h383;
              5'h0d: out_low = 10'h383;
              5'h0e: out_low = 10'h383;
              5'h0f: out_low = 10'h383;
              5'h10: out_low = 10'h383;
              5'h11: out_low = 10'h383;
              5'h12: out_low = 10'h383;
              5'h13: out_low = 10'h383;
              5'h14: out_low = 10'h383;
              5'h15: out_low = 10'h383;
              5'h16: out_low = 10'h383;
              5'h17: out_low = 10'h382;
              5'h18: out_low = 10'h382;
              5'h19: out_low = 10'h382;
              5'h1a: out_low = 10'h382;
              5'h1b: out_low = 10'h382;
              5'h1c: out_low = 10'h382;
              5'h1d: out_low = 10'h382;
              5'h1e: out_low = 10'h382;
              5'h1f: out_low = 10'h382;
              default: out_low = 10'h000;
            endcase
          end
          5'h0f: begin
            case (mant[4:0])
              5'h00: out_low = 10'h382;
              5'h01: out_low = 10'h382;
              5'h02: out_low = 10'h382;
              5'h03: out_low = 10'h382;
              5'h04: out_low = 10'h381;
              5'h05: out_low = 10'h381;
              5'h06: out_low = 10'h381;
              5'h07: out_low = 10'h381;
              5'h08: out_low = 10'h381;
              5'h09: out_low = 10'h381;
              5'h0a: out_low = 10'h381;
              5'h0b: out_low = 10'h381;
              5'h0c: out_low = 10'h381;
              5'h0d: out_low = 10'h381;
              5'h0e: out_low = 10'h381;
              5'h0f: out_low = 10'h381;
              5'h10: out_low = 10'h380;
              5'h11: out_low = 10'h380;
              5'h12: out_low = 10'h380;
              5'h13: out_low = 10'h380;
              5'h14: out_low = 10'h380;
              5'h15: out_low = 10'h380;
              5'h16: out_low = 10'h380;
              5'h17: out_low = 10'h380;
              5'h18: out_low = 10'h380;
              5'h19: out_low = 10'h380;
              5'h1a: out_low = 10'h380;
              5'h1b: out_low = 10'h380;
              5'h1c: out_low = 10'h37f;
              5'h1d: out_low = 10'h37f;
              5'h1e: out_low = 10'h37f;
              5'h1f: out_low = 10'h37f;
              default: out_low = 10'h000;
            endcase
          end
          5'h10: begin
            case (mant[4:0])
              5'h00: out_low = 10'h37f;
              5'h01: out_low = 10'h37f;
              5'h02: out_low = 10'h37f;
              5'h03: out_low = 10'h37f;
              5'h04: out_low = 10'h37f;
              5'h05: out_low = 10'h37f;
              5'h06: out_low = 10'h37f;
              5'h07: out_low = 10'h37f;
              5'h08: out_low = 10'h37e;
              5'h09: out_low = 10'h37e;
              5'h0a: out_low = 10'h37e;
              5'h0b: out_low = 10'h37e;
              5'h0c: out_low = 10'h37e;
              5'h0d: out_low = 10'h37e;
              5'h0e: out_low = 10'h37e;
              5'h0f: out_low = 10'h37e;
              5'h10: out_low = 10'h37e;
              5'h11: out_low = 10'h37e;
              5'h12: out_low = 10'h37e;
              5'h13: out_low = 10'h37e;
              5'h14: out_low = 10'h37e;
              5'h15: out_low = 10'h37d;
              5'h16: out_low = 10'h37d;
              5'h17: out_low = 10'h37d;
              5'h18: out_low = 10'h37d;
              5'h19: out_low = 10'h37d;
              5'h1a: out_low = 10'h37d;
              5'h1b: out_low = 10'h37d;
              5'h1c: out_low = 10'h37d;
              5'h1d: out_low = 10'h37d;
              5'h1e: out_low = 10'h37d;
              5'h1f: out_low = 10'h37d;
              default: out_low = 10'h000;
            endcase
          end
          5'h11: begin
            case (mant[4:0])
              5'h00: out_low = 10'h37d;
              5'h01: out_low = 10'h37c;
              5'h02: out_low = 10'h37c;
              5'h03: out_low = 10'h37c;
              5'h04: out_low = 10'h37c;
              5'h05: out_low = 10'h37c;
              5'h06: out_low = 10'h37c;
              5'h07: out_low = 10'h37c;
              5'h08: out_low = 10'h37c;
              5'h09: out_low = 10'h37c;
              5'h0a: out_low = 10'h37c;
              5'h0b: out_low = 10'h37c;
              5'h0c: out_low = 10'h37c;
              5'h0d: out_low = 10'h37b;
              5'h0e: out_low = 10'h37b;
              5'h0f: out_low = 10'h37b;
              5'h10: out_low = 10'h37b;
              5'h11: out_low = 10'h37b;
              5'h12: out_low = 10'h37b;
              5'h13: out_low = 10'h37b;
              5'h14: out_low = 10'h37b;
              5'h15: out_low = 10'h37b;
              5'h16: out_low = 10'h37b;
              5'h17: out_low = 10'h37b;
              5'h18: out_low = 10'h37b;
              5'h19: out_low = 10'h37b;
              5'h1a: out_low = 10'h37a;
              5'h1b: out_low = 10'h37a;
              5'h1c: out_low = 10'h37a;
              5'h1d: out_low = 10'h37a;
              5'h1e: out_low = 10'h37a;
              5'h1f: out_low = 10'h37a;
              default: out_low = 10'h000;
            endcase
          end
          5'h12: begin
            case (mant[4:0])
              5'h00: out_low = 10'h37a;
              5'h01: out_low = 10'h37a;
              5'h02: out_low = 10'h37a;
              5'h03: out_low = 10'h37a;
              5'h04: out_low = 10'h37a;
              5'h05: out_low = 10'h37a;
              5'h06: out_low = 10'h379;
              5'h07: out_low = 10'h379;
              5'h08: out_low = 10'h379;
              5'h09: out_low = 10'h379;
              5'h0a: out_low = 10'h379;
              5'h0b: out_low = 10'h379;
              5'h0c: out_low = 10'h379;
              5'h0d: out_low = 10'h379;
              5'h0e: out_low = 10'h379;
              5'h0f: out_low = 10'h379;
              5'h10: out_low = 10'h379;
              5'h11: out_low = 10'h379;
              5'h12: out_low = 10'h379;
              5'h13: out_low = 10'h378;
              5'h14: out_low = 10'h378;
              5'h15: out_low = 10'h378;
              5'h16: out_low = 10'h378;
              5'h17: out_low = 10'h378;
              5'h18: out_low = 10'h378;
              5'h19: out_low = 10'h378;
              5'h1a: out_low = 10'h378;
              5'h1b: out_low = 10'h378;
              5'h1c: out_low = 10'h378;
              5'h1d: out_low = 10'h378;
              5'h1e: out_low = 10'h378;
              5'h1f: out_low = 10'h377;
              default: out_low = 10'h000;
            endcase
          end
          5'h13: begin
            case (mant[4:0])
              5'h00: out_low = 10'h377;
              5'h01: out_low = 10'h377;
              5'h02: out_low = 10'h377;
              5'h03: out_low = 10'h377;
              5'h04: out_low = 10'h377;
              5'h05: out_low = 10'h377;
              5'h06: out_low = 10'h377;
              5'h07: out_low = 10'h377;
              5'h08: out_low = 10'h377;
              5'h09: out_low = 10'h377;
              5'h0a: out_low = 10'h377;
              5'h0b: out_low = 10'h376;
              5'h0c: out_low = 10'h376;
              5'h0d: out_low = 10'h376;
              5'h0e: out_low = 10'h376;
              5'h0f: out_low = 10'h376;
              5'h10: out_low = 10'h376;
              5'h11: out_low = 10'h376;
              5'h12: out_low = 10'h376;
              5'h13: out_low = 10'h376;
              5'h14: out_low = 10'h376;
              5'h15: out_low = 10'h376;
              5'h16: out_low = 10'h376;
              5'h17: out_low = 10'h376;
              5'h18: out_low = 10'h375;
              5'h19: out_low = 10'h375;
              5'h1a: out_low = 10'h375;
              5'h1b: out_low = 10'h375;
              5'h1c: out_low = 10'h375;
              5'h1d: out_low = 10'h375;
              5'h1e: out_low = 10'h375;
              5'h1f: out_low = 10'h375;
              default: out_low = 10'h000;
            endcase
          end
          5'h14: begin
            case (mant[4:0])
              5'h00: out_low = 10'h375;
              5'h01: out_low = 10'h375;
              5'h02: out_low = 10'h375;
              5'h03: out_low = 10'h375;
              5'h04: out_low = 10'h374;
              5'h05: out_low = 10'h374;
              5'h06: out_low = 10'h374;
              5'h07: out_low = 10'h374;
              5'h08: out_low = 10'h374;
              5'h09: out_low = 10'h374;
              5'h0a: out_low = 10'h374;
              5'h0b: out_low = 10'h374;
              5'h0c: out_low = 10'h374;
              5'h0d: out_low = 10'h374;
              5'h0e: out_low = 10'h374;
              5'h0f: out_low = 10'h374;
              5'h10: out_low = 10'h373;
              5'h11: out_low = 10'h373;
              5'h12: out_low = 10'h373;
              5'h13: out_low = 10'h373;
              5'h14: out_low = 10'h373;
              5'h15: out_low = 10'h373;
              5'h16: out_low = 10'h373;
              5'h17: out_low = 10'h373;
              5'h18: out_low = 10'h373;
              5'h19: out_low = 10'h373;
              5'h1a: out_low = 10'h373;
              5'h1b: out_low = 10'h373;
              5'h1c: out_low = 10'h373;
              5'h1d: out_low = 10'h372;
              5'h1e: out_low = 10'h372;
              5'h1f: out_low = 10'h372;
              default: out_low = 10'h000;
            endcase
          end
          5'h15: begin
            case (mant[4:0])
              5'h00: out_low = 10'h372;
              5'h01: out_low = 10'h372;
              5'h02: out_low = 10'h372;
              5'h03: out_low = 10'h372;
              5'h04: out_low = 10'h372;
              5'h05: out_low = 10'h372;
              5'h06: out_low = 10'h372;
              5'h07: out_low = 10'h372;
              5'h08: out_low = 10'h372;
              5'h09: out_low = 10'h371;
              5'h0a: out_low = 10'h371;
              5'h0b: out_low = 10'h371;
              5'h0c: out_low = 10'h371;
              5'h0d: out_low = 10'h371;
              5'h0e: out_low = 10'h371;
              5'h0f: out_low = 10'h371;
              5'h10: out_low = 10'h371;
              5'h11: out_low = 10'h371;
              5'h12: out_low = 10'h371;
              5'h13: out_low = 10'h371;
              5'h14: out_low = 10'h371;
              5'h15: out_low = 10'h371;
              5'h16: out_low = 10'h370;
              5'h17: out_low = 10'h370;
              5'h18: out_low = 10'h370;
              5'h19: out_low = 10'h370;
              5'h1a: out_low = 10'h370;
              5'h1b: out_low = 10'h370;
              5'h1c: out_low = 10'h370;
              5'h1d: out_low = 10'h370;
              5'h1e: out_low = 10'h370;
              5'h1f: out_low = 10'h370;
              default: out_low = 10'h000;
            endcase
          end
          5'h16: begin
            case (mant[4:0])
              5'h00: out_low = 10'h370;
              5'h01: out_low = 10'h370;
              5'h02: out_low = 10'h36f;
              5'h03: out_low = 10'h36f;
              5'h04: out_low = 10'h36f;
              5'h05: out_low = 10'h36f;
              5'h06: out_low = 10'h36f;
              5'h07: out_low = 10'h36f;
              5'h08: out_low = 10'h36f;
              5'h09: out_low = 10'h36f;
              5'h0a: out_low = 10'h36f;
              5'h0b: out_low = 10'h36f;
              5'h0c: out_low = 10'h36f;
              5'h0d: out_low = 10'h36f;
              5'h0e: out_low = 10'h36e;
              5'h0f: out_low = 10'h36e;
              5'h10: out_low = 10'h36e;
              5'h11: out_low = 10'h36e;
              5'h12: out_low = 10'h36e;
              5'h13: out_low = 10'h36e;
              5'h14: out_low = 10'h36e;
              5'h15: out_low = 10'h36e;
              5'h16: out_low = 10'h36e;
              5'h17: out_low = 10'h36e;
              5'h18: out_low = 10'h36e;
              5'h19: out_low = 10'h36e;
              5'h1a: out_low = 10'h36e;
              5'h1b: out_low = 10'h36d;
              5'h1c: out_low = 10'h36d;
              5'h1d: out_low = 10'h36d;
              5'h1e: out_low = 10'h36d;
              5'h1f: out_low = 10'h36d;
              default: out_low = 10'h000;
            endcase
          end
          5'h17: begin
            case (mant[4:0])
              5'h00: out_low = 10'h36d;
              5'h01: out_low = 10'h36d;
              5'h02: out_low = 10'h36d;
              5'h03: out_low = 10'h36d;
              5'h04: out_low = 10'h36d;
              5'h05: out_low = 10'h36d;
              5'h06: out_low = 10'h36d;
              5'h07: out_low = 10'h36c;
              5'h08: out_low = 10'h36c;
              5'h09: out_low = 10'h36c;
              5'h0a: out_low = 10'h36c;
              5'h0b: out_low = 10'h36c;
              5'h0c: out_low = 10'h36c;
              5'h0d: out_low = 10'h36c;
              5'h0e: out_low = 10'h36c;
              5'h0f: out_low = 10'h36c;
              5'h10: out_low = 10'h36c;
              5'h11: out_low = 10'h36c;
              5'h12: out_low = 10'h36c;
              5'h13: out_low = 10'h36c;
              5'h14: out_low = 10'h36b;
              5'h15: out_low = 10'h36b;
              5'h16: out_low = 10'h36b;
              5'h17: out_low = 10'h36b;
              5'h18: out_low = 10'h36b;
              5'h19: out_low = 10'h36b;
              5'h1a: out_low = 10'h36b;
              5'h1b: out_low = 10'h36b;
              5'h1c: out_low = 10'h36b;
              5'h1d: out_low = 10'h36b;
              5'h1e: out_low = 10'h36b;
              5'h1f: out_low = 10'h36b;
              default: out_low = 10'h000;
            endcase
          end
          5'h18: begin
            case (mant[4:0])
              5'h00: out_low = 10'h36a;
              5'h01: out_low = 10'h36a;
              5'h02: out_low = 10'h36a;
              5'h03: out_low = 10'h36a;
              5'h04: out_low = 10'h36a;
              5'h05: out_low = 10'h36a;
              5'h06: out_low = 10'h36a;
              5'h07: out_low = 10'h36a;
              5'h08: out_low = 10'h36a;
              5'h09: out_low = 10'h36a;
              5'h0a: out_low = 10'h36a;
              5'h0b: out_low = 10'h36a;
              5'h0c: out_low = 10'h36a;
              5'h0d: out_low = 10'h369;
              5'h0e: out_low = 10'h369;
              5'h0f: out_low = 10'h369;
              5'h10: out_low = 10'h369;
              5'h11: out_low = 10'h369;
              5'h12: out_low = 10'h369;
              5'h13: out_low = 10'h369;
              5'h14: out_low = 10'h369;
              5'h15: out_low = 10'h369;
              5'h16: out_low = 10'h369;
              5'h17: out_low = 10'h369;
              5'h18: out_low = 10'h369;
              5'h19: out_low = 10'h368;
              5'h1a: out_low = 10'h368;
              5'h1b: out_low = 10'h368;
              5'h1c: out_low = 10'h368;
              5'h1d: out_low = 10'h368;
              5'h1e: out_low = 10'h368;
              5'h1f: out_low = 10'h368;
              default: out_low = 10'h000;
            endcase
          end
          5'h19: begin
            case (mant[4:0])
              5'h00: out_low = 10'h368;
              5'h01: out_low = 10'h368;
              5'h02: out_low = 10'h368;
              5'h03: out_low = 10'h368;
              5'h04: out_low = 10'h368;
              5'h05: out_low = 10'h368;
              5'h06: out_low = 10'h367;
              5'h07: out_low = 10'h367;
              5'h08: out_low = 10'h367;
              5'h09: out_low = 10'h367;
              5'h0a: out_low = 10'h367;
              5'h0b: out_low = 10'h367;
              5'h0c: out_low = 10'h367;
              5'h0d: out_low = 10'h367;
              5'h0e: out_low = 10'h367;
              5'h0f: out_low = 10'h367;
              5'h10: out_low = 10'h367;
              5'h11: out_low = 10'h367;
              5'h12: out_low = 10'h366;
              5'h13: out_low = 10'h366;
              5'h14: out_low = 10'h366;
              5'h15: out_low = 10'h366;
              5'h16: out_low = 10'h366;
              5'h17: out_low = 10'h366;
              5'h18: out_low = 10'h366;
              5'h19: out_low = 10'h366;
              5'h1a: out_low = 10'h366;
              5'h1b: out_low = 10'h366;
              5'h1c: out_low = 10'h366;
              5'h1d: out_low = 10'h366;
              5'h1e: out_low = 10'h366;
              5'h1f: out_low = 10'h365;
              default: out_low = 10'h000;
            endcase
          end
          5'h1a: begin
            case (mant[4:0])
              5'h00: out_low = 10'h365;
              5'h01: out_low = 10'h365;
              5'h02: out_low = 10'h365;
              5'h03: out_low = 10'h365;
              5'h04: out_low = 10'h365;
              5'h05: out_low = 10'h365;
              5'h06: out_low = 10'h365;
              5'h07: out_low = 10'h365;
              5'h08: out_low = 10'h365;
              5'h09: out_low = 10'h365;
              5'h0a: out_low = 10'h365;
              5'h0b: out_low = 10'h364;
              5'h0c: out_low = 10'h364;
              5'h0d: out_low = 10'h364;
              5'h0e: out_low = 10'h364;
              5'h0f: out_low = 10'h364;
              5'h10: out_low = 10'h364;
              5'h11: out_low = 10'h364;
              5'h12: out_low = 10'h364;
              5'h13: out_low = 10'h364;
              5'h14: out_low = 10'h364;
              5'h15: out_low = 10'h364;
              5'h16: out_low = 10'h364;
              5'h17: out_low = 10'h363;
              5'h18: out_low = 10'h363;
              5'h19: out_low = 10'h363;
              5'h1a: out_low = 10'h363;
              5'h1b: out_low = 10'h363;
              5'h1c: out_low = 10'h363;
              5'h1d: out_low = 10'h363;
              5'h1e: out_low = 10'h363;
              5'h1f: out_low = 10'h363;
              default: out_low = 10'h000;
            endcase
          end
          5'h1b: begin
            case (mant[4:0])
              5'h00: out_low = 10'h363;
              5'h01: out_low = 10'h363;
              5'h02: out_low = 10'h363;
              5'h03: out_low = 10'h363;
              5'h04: out_low = 10'h362;
              5'h05: out_low = 10'h362;
              5'h06: out_low = 10'h362;
              5'h07: out_low = 10'h362;
              5'h08: out_low = 10'h362;
              5'h09: out_low = 10'h362;
              5'h0a: out_low = 10'h362;
              5'h0b: out_low = 10'h362;
              5'h0c: out_low = 10'h362;
              5'h0d: out_low = 10'h362;
              5'h0e: out_low = 10'h362;
              5'h0f: out_low = 10'h362;
              5'h10: out_low = 10'h362;
              5'h11: out_low = 10'h361;
              5'h12: out_low = 10'h361;
              5'h13: out_low = 10'h361;
              5'h14: out_low = 10'h361;
              5'h15: out_low = 10'h361;
              5'h16: out_low = 10'h361;
              5'h17: out_low = 10'h361;
              5'h18: out_low = 10'h361;
              5'h19: out_low = 10'h361;
              5'h1a: out_low = 10'h361;
              5'h1b: out_low = 10'h361;
              5'h1c: out_low = 10'h361;
              5'h1d: out_low = 10'h360;
              5'h1e: out_low = 10'h360;
              5'h1f: out_low = 10'h360;
              default: out_low = 10'h000;
            endcase
          end
          5'h1c: begin
            case (mant[4:0])
              5'h00: out_low = 10'h360;
              5'h01: out_low = 10'h360;
              5'h02: out_low = 10'h360;
              5'h03: out_low = 10'h360;
              5'h04: out_low = 10'h360;
              5'h05: out_low = 10'h360;
              5'h06: out_low = 10'h360;
              5'h07: out_low = 10'h360;
              5'h08: out_low = 10'h360;
              5'h09: out_low = 10'h360;
              5'h0a: out_low = 10'h35f;
              5'h0b: out_low = 10'h35f;
              5'h0c: out_low = 10'h35f;
              5'h0d: out_low = 10'h35f;
              5'h0e: out_low = 10'h35f;
              5'h0f: out_low = 10'h35f;
              5'h10: out_low = 10'h35f;
              5'h11: out_low = 10'h35f;
              5'h12: out_low = 10'h35f;
              5'h13: out_low = 10'h35f;
              5'h14: out_low = 10'h35f;
              5'h15: out_low = 10'h35f;
              5'h16: out_low = 10'h35e;
              5'h17: out_low = 10'h35e;
              5'h18: out_low = 10'h35e;
              5'h19: out_low = 10'h35e;
              5'h1a: out_low = 10'h35e;
              5'h1b: out_low = 10'h35e;
              5'h1c: out_low = 10'h35e;
              5'h1d: out_low = 10'h35e;
              5'h1e: out_low = 10'h35e;
              5'h1f: out_low = 10'h35e;
              default: out_low = 10'h000;
            endcase
          end
          5'h1d: begin
            case (mant[4:0])
              5'h00: out_low = 10'h35e;
              5'h01: out_low = 10'h35e;
              5'h02: out_low = 10'h35e;
              5'h03: out_low = 10'h35d;
              5'h04: out_low = 10'h35d;
              5'h05: out_low = 10'h35d;
              5'h06: out_low = 10'h35d;
              5'h07: out_low = 10'h35d;
              5'h08: out_low = 10'h35d;
              5'h09: out_low = 10'h35d;
              5'h0a: out_low = 10'h35d;
              5'h0b: out_low = 10'h35d;
              5'h0c: out_low = 10'h35d;
              5'h0d: out_low = 10'h35d;
              5'h0e: out_low = 10'h35d;
              5'h0f: out_low = 10'h35c;
              5'h10: out_low = 10'h35c;
              5'h11: out_low = 10'h35c;
              5'h12: out_low = 10'h35c;
              5'h13: out_low = 10'h35c;
              5'h14: out_low = 10'h35c;
              5'h15: out_low = 10'h35c;
              5'h16: out_low = 10'h35c;
              5'h17: out_low = 10'h35c;
              5'h18: out_low = 10'h35c;
              5'h19: out_low = 10'h35c;
              5'h1a: out_low = 10'h35c;
              5'h1b: out_low = 10'h35c;
              5'h1c: out_low = 10'h35b;
              5'h1d: out_low = 10'h35b;
              5'h1e: out_low = 10'h35b;
              5'h1f: out_low = 10'h35b;
              default: out_low = 10'h000;
            endcase
          end
          5'h1e: begin
            case (mant[4:0])
              5'h00: out_low = 10'h35b;
              5'h01: out_low = 10'h35b;
              5'h02: out_low = 10'h35b;
              5'h03: out_low = 10'h35b;
              5'h04: out_low = 10'h35b;
              5'h05: out_low = 10'h35b;
              5'h06: out_low = 10'h35b;
              5'h07: out_low = 10'h35b;
              5'h08: out_low = 10'h35a;
              5'h09: out_low = 10'h35a;
              5'h0a: out_low = 10'h35a;
              5'h0b: out_low = 10'h35a;
              5'h0c: out_low = 10'h35a;
              5'h0d: out_low = 10'h35a;
              5'h0e: out_low = 10'h35a;
              5'h0f: out_low = 10'h35a;
              5'h10: out_low = 10'h35a;
              5'h11: out_low = 10'h35a;
              5'h12: out_low = 10'h35a;
              5'h13: out_low = 10'h35a;
              5'h14: out_low = 10'h35a;
              5'h15: out_low = 10'h359;
              5'h16: out_low = 10'h359;
              5'h17: out_low = 10'h359;
              5'h18: out_low = 10'h359;
              5'h19: out_low = 10'h359;
              5'h1a: out_low = 10'h359;
              5'h1b: out_low = 10'h359;
              5'h1c: out_low = 10'h359;
              5'h1d: out_low = 10'h359;
              5'h1e: out_low = 10'h359;
              5'h1f: out_low = 10'h359;
              default: out_low = 10'h000;
            endcase
          end
          5'h1f: begin
            case (mant[4:0])
              5'h00: out_low = 10'h359;
              5'h01: out_low = 10'h358;
              5'h02: out_low = 10'h358;
              5'h03: out_low = 10'h358;
              5'h04: out_low = 10'h358;
              5'h05: out_low = 10'h358;
              5'h06: out_low = 10'h358;
              5'h07: out_low = 10'h358;
              5'h08: out_low = 10'h358;
              5'h09: out_low = 10'h358;
              5'h0a: out_low = 10'h358;
              5'h0b: out_low = 10'h358;
              5'h0c: out_low = 10'h358;
              5'h0d: out_low = 10'h358;
              5'h0e: out_low = 10'h357;
              5'h0f: out_low = 10'h357;
              5'h10: out_low = 10'h357;
              5'h11: out_low = 10'h357;
              5'h12: out_low = 10'h357;
              5'h13: out_low = 10'h357;
              5'h14: out_low = 10'h357;
              5'h15: out_low = 10'h357;
              5'h16: out_low = 10'h357;
              5'h17: out_low = 10'h357;
              5'h18: out_low = 10'h357;
              5'h19: out_low = 10'h357;
              5'h1a: out_low = 10'h357;
              5'h1b: out_low = 10'h356;
              5'h1c: out_low = 10'h356;
              5'h1d: out_low = 10'h356;
              5'h1e: out_low = 10'h356;
              5'h1f: out_low = 10'h356;
              default: out_low = 10'h000;
            endcase
          end
          default: out_low = 10'h000;
        endcase
      end
      6'h2c: begin
        case (mant[9:5])
          5'h00: begin
            case (mant[4:0])
              5'h00: out_low = 10'h356;
              5'h01: out_low = 10'h356;
              5'h02: out_low = 10'h356;
              5'h03: out_low = 10'h356;
              5'h04: out_low = 10'h355;
              5'h05: out_low = 10'h355;
              5'h06: out_low = 10'h355;
              5'h07: out_low = 10'h355;
              5'h08: out_low = 10'h355;
              5'h09: out_low = 10'h355;
              5'h0a: out_low = 10'h354;
              5'h0b: out_low = 10'h354;
              5'h0c: out_low = 10'h354;
              5'h0d: out_low = 10'h354;
              5'h0e: out_low = 10'h354;
              5'h0f: out_low = 10'h354;
              5'h10: out_low = 10'h353;
              5'h11: out_low = 10'h353;
              5'h12: out_low = 10'h353;
              5'h13: out_low = 10'h353;
              5'h14: out_low = 10'h353;
              5'h15: out_low = 10'h353;
              5'h16: out_low = 10'h353;
              5'h17: out_low = 10'h352;
              5'h18: out_low = 10'h352;
              5'h19: out_low = 10'h352;
              5'h1a: out_low = 10'h352;
              5'h1b: out_low = 10'h352;
              5'h1c: out_low = 10'h352;
              5'h1d: out_low = 10'h351;
              5'h1e: out_low = 10'h351;
              5'h1f: out_low = 10'h351;
              default: out_low = 10'h000;
            endcase
          end
          5'h01: begin
            case (mant[4:0])
              5'h00: out_low = 10'h351;
              5'h01: out_low = 10'h351;
              5'h02: out_low = 10'h351;
              5'h03: out_low = 10'h350;
              5'h04: out_low = 10'h350;
              5'h05: out_low = 10'h350;
              5'h06: out_low = 10'h350;
              5'h07: out_low = 10'h350;
              5'h08: out_low = 10'h350;
              5'h09: out_low = 10'h350;
              5'h0a: out_low = 10'h34f;
              5'h0b: out_low = 10'h34f;
              5'h0c: out_low = 10'h34f;
              5'h0d: out_low = 10'h34f;
              5'h0e: out_low = 10'h34f;
              5'h0f: out_low = 10'h34f;
              5'h10: out_low = 10'h34e;
              5'h11: out_low = 10'h34e;
              5'h12: out_low = 10'h34e;
              5'h13: out_low = 10'h34e;
              5'h14: out_low = 10'h34e;
              5'h15: out_low = 10'h34e;
              5'h16: out_low = 10'h34d;
              5'h17: out_low = 10'h34d;
              5'h18: out_low = 10'h34d;
              5'h19: out_low = 10'h34d;
              5'h1a: out_low = 10'h34d;
              5'h1b: out_low = 10'h34d;
              5'h1c: out_low = 10'h34d;
              5'h1d: out_low = 10'h34c;
              5'h1e: out_low = 10'h34c;
              5'h1f: out_low = 10'h34c;
              default: out_low = 10'h000;
            endcase
          end
          5'h02: begin
            case (mant[4:0])
              5'h00: out_low = 10'h34c;
              5'h01: out_low = 10'h34c;
              5'h02: out_low = 10'h34c;
              5'h03: out_low = 10'h34b;
              5'h04: out_low = 10'h34b;
              5'h05: out_low = 10'h34b;
              5'h06: out_low = 10'h34b;
              5'h07: out_low = 10'h34b;
              5'h08: out_low = 10'h34b;
              5'h09: out_low = 10'h34a;
              5'h0a: out_low = 10'h34a;
              5'h0b: out_low = 10'h34a;
              5'h0c: out_low = 10'h34a;
              5'h0d: out_low = 10'h34a;
              5'h0e: out_low = 10'h34a;
              5'h0f: out_low = 10'h34a;
              5'h10: out_low = 10'h349;
              5'h11: out_low = 10'h349;
              5'h12: out_low = 10'h349;
              5'h13: out_low = 10'h349;
              5'h14: out_low = 10'h349;
              5'h15: out_low = 10'h349;
              5'h16: out_low = 10'h348;
              5'h17: out_low = 10'h348;
              5'h18: out_low = 10'h348;
              5'h19: out_low = 10'h348;
              5'h1a: out_low = 10'h348;
              5'h1b: out_low = 10'h348;
              5'h1c: out_low = 10'h347;
              5'h1d: out_low = 10'h347;
              5'h1e: out_low = 10'h347;
              5'h1f: out_low = 10'h347;
              default: out_low = 10'h000;
            endcase
          end
          5'h03: begin
            case (mant[4:0])
              5'h00: out_low = 10'h347;
              5'h01: out_low = 10'h347;
              5'h02: out_low = 10'h347;
              5'h03: out_low = 10'h346;
              5'h04: out_low = 10'h346;
              5'h05: out_low = 10'h346;
              5'h06: out_low = 10'h346;
              5'h07: out_low = 10'h346;
              5'h08: out_low = 10'h346;
              5'h09: out_low = 10'h345;
              5'h0a: out_low = 10'h345;
              5'h0b: out_low = 10'h345;
              5'h0c: out_low = 10'h345;
              5'h0d: out_low = 10'h345;
              5'h0e: out_low = 10'h345;
              5'h0f: out_low = 10'h344;
              5'h10: out_low = 10'h344;
              5'h11: out_low = 10'h344;
              5'h12: out_low = 10'h344;
              5'h13: out_low = 10'h344;
              5'h14: out_low = 10'h344;
              5'h15: out_low = 10'h344;
              5'h16: out_low = 10'h343;
              5'h17: out_low = 10'h343;
              5'h18: out_low = 10'h343;
              5'h19: out_low = 10'h343;
              5'h1a: out_low = 10'h343;
              5'h1b: out_low = 10'h343;
              5'h1c: out_low = 10'h342;
              5'h1d: out_low = 10'h342;
              5'h1e: out_low = 10'h342;
              5'h1f: out_low = 10'h342;
              default: out_low = 10'h000;
            endcase
          end
          5'h04: begin
            case (mant[4:0])
              5'h00: out_low = 10'h342;
              5'h01: out_low = 10'h342;
              5'h02: out_low = 10'h341;
              5'h03: out_low = 10'h341;
              5'h04: out_low = 10'h341;
              5'h05: out_low = 10'h341;
              5'h06: out_low = 10'h341;
              5'h07: out_low = 10'h341;
              5'h08: out_low = 10'h341;
              5'h09: out_low = 10'h340;
              5'h0a: out_low = 10'h340;
              5'h0b: out_low = 10'h340;
              5'h0c: out_low = 10'h340;
              5'h0d: out_low = 10'h340;
              5'h0e: out_low = 10'h340;
              5'h0f: out_low = 10'h33f;
              5'h10: out_low = 10'h33f;
              5'h11: out_low = 10'h33f;
              5'h12: out_low = 10'h33f;
              5'h13: out_low = 10'h33f;
              5'h14: out_low = 10'h33f;
              5'h15: out_low = 10'h33e;
              5'h16: out_low = 10'h33e;
              5'h17: out_low = 10'h33e;
              5'h18: out_low = 10'h33e;
              5'h19: out_low = 10'h33e;
              5'h1a: out_low = 10'h33e;
              5'h1b: out_low = 10'h33e;
              5'h1c: out_low = 10'h33d;
              5'h1d: out_low = 10'h33d;
              5'h1e: out_low = 10'h33d;
              5'h1f: out_low = 10'h33d;
              default: out_low = 10'h000;
            endcase
          end
          5'h05: begin
            case (mant[4:0])
              5'h00: out_low = 10'h33d;
              5'h01: out_low = 10'h33d;
              5'h02: out_low = 10'h33c;
              5'h03: out_low = 10'h33c;
              5'h04: out_low = 10'h33c;
              5'h05: out_low = 10'h33c;
              5'h06: out_low = 10'h33c;
              5'h07: out_low = 10'h33c;
              5'h08: out_low = 10'h33c;
              5'h09: out_low = 10'h33b;
              5'h0a: out_low = 10'h33b;
              5'h0b: out_low = 10'h33b;
              5'h0c: out_low = 10'h33b;
              5'h0d: out_low = 10'h33b;
              5'h0e: out_low = 10'h33b;
              5'h0f: out_low = 10'h33a;
              5'h10: out_low = 10'h33a;
              5'h11: out_low = 10'h33a;
              5'h12: out_low = 10'h33a;
              5'h13: out_low = 10'h33a;
              5'h14: out_low = 10'h33a;
              5'h15: out_low = 10'h339;
              5'h16: out_low = 10'h339;
              5'h17: out_low = 10'h339;
              5'h18: out_low = 10'h339;
              5'h19: out_low = 10'h339;
              5'h1a: out_low = 10'h339;
              5'h1b: out_low = 10'h339;
              5'h1c: out_low = 10'h338;
              5'h1d: out_low = 10'h338;
              5'h1e: out_low = 10'h338;
              5'h1f: out_low = 10'h338;
              default: out_low = 10'h000;
            endcase
          end
          5'h06: begin
            case (mant[4:0])
              5'h00: out_low = 10'h338;
              5'h01: out_low = 10'h338;
              5'h02: out_low = 10'h337;
              5'h03: out_low = 10'h337;
              5'h04: out_low = 10'h337;
              5'h05: out_low = 10'h337;
              5'h06: out_low = 10'h337;
              5'h07: out_low = 10'h337;
              5'h08: out_low = 10'h337;
              5'h09: out_low = 10'h336;
              5'h0a: out_low = 10'h336;
              5'h0b: out_low = 10'h336;
              5'h0c: out_low = 10'h336;
              5'h0d: out_low = 10'h336;
              5'h0e: out_low = 10'h336;
              5'h0f: out_low = 10'h335;
              5'h10: out_low = 10'h335;
              5'h11: out_low = 10'h335;
              5'h12: out_low = 10'h335;
              5'h13: out_low = 10'h335;
              5'h14: out_low = 10'h335;
              5'h15: out_low = 10'h334;
              5'h16: out_low = 10'h334;
              5'h17: out_low = 10'h334;
              5'h18: out_low = 10'h334;
              5'h19: out_low = 10'h334;
              5'h1a: out_low = 10'h334;
              5'h1b: out_low = 10'h334;
              5'h1c: out_low = 10'h333;
              5'h1d: out_low = 10'h333;
              5'h1e: out_low = 10'h333;
              5'h1f: out_low = 10'h333;
              default: out_low = 10'h000;
            endcase
          end
          5'h07: begin
            case (mant[4:0])
              5'h00: out_low = 10'h333;
              5'h01: out_low = 10'h333;
              5'h02: out_low = 10'h332;
              5'h03: out_low = 10'h332;
              5'h04: out_low = 10'h332;
              5'h05: out_low = 10'h332;
              5'h06: out_low = 10'h332;
              5'h07: out_low = 10'h332;
              5'h08: out_low = 10'h332;
              5'h09: out_low = 10'h331;
              5'h0a: out_low = 10'h331;
              5'h0b: out_low = 10'h331;
              5'h0c: out_low = 10'h331;
              5'h0d: out_low = 10'h331;
              5'h0e: out_low = 10'h331;
              5'h0f: out_low = 10'h330;
              5'h10: out_low = 10'h330;
              5'h11: out_low = 10'h330;
              5'h12: out_low = 10'h330;
              5'h13: out_low = 10'h330;
              5'h14: out_low = 10'h330;
              5'h15: out_low = 10'h32f;
              5'h16: out_low = 10'h32f;
              5'h17: out_low = 10'h32f;
              5'h18: out_low = 10'h32f;
              5'h19: out_low = 10'h32f;
              5'h1a: out_low = 10'h32f;
              5'h1b: out_low = 10'h32f;
              5'h1c: out_low = 10'h32e;
              5'h1d: out_low = 10'h32e;
              5'h1e: out_low = 10'h32e;
              5'h1f: out_low = 10'h32e;
              default: out_low = 10'h000;
            endcase
          end
          5'h08: begin
            case (mant[4:0])
              5'h00: out_low = 10'h32e;
              5'h01: out_low = 10'h32e;
              5'h02: out_low = 10'h32d;
              5'h03: out_low = 10'h32d;
              5'h04: out_low = 10'h32d;
              5'h05: out_low = 10'h32d;
              5'h06: out_low = 10'h32d;
              5'h07: out_low = 10'h32d;
              5'h08: out_low = 10'h32d;
              5'h09: out_low = 10'h32c;
              5'h0a: out_low = 10'h32c;
              5'h0b: out_low = 10'h32c;
              5'h0c: out_low = 10'h32c;
              5'h0d: out_low = 10'h32c;
              5'h0e: out_low = 10'h32c;
              5'h0f: out_low = 10'h32b;
              5'h10: out_low = 10'h32b;
              5'h11: out_low = 10'h32b;
              5'h12: out_low = 10'h32b;
              5'h13: out_low = 10'h32b;
              5'h14: out_low = 10'h32b;
              5'h15: out_low = 10'h32b;
              5'h16: out_low = 10'h32a;
              5'h17: out_low = 10'h32a;
              5'h18: out_low = 10'h32a;
              5'h19: out_low = 10'h32a;
              5'h1a: out_low = 10'h32a;
              5'h1b: out_low = 10'h32a;
              5'h1c: out_low = 10'h329;
              5'h1d: out_low = 10'h329;
              5'h1e: out_low = 10'h329;
              5'h1f: out_low = 10'h329;
              default: out_low = 10'h000;
            endcase
          end
          5'h09: begin
            case (mant[4:0])
              5'h00: out_low = 10'h329;
              5'h01: out_low = 10'h329;
              5'h02: out_low = 10'h329;
              5'h03: out_low = 10'h328;
              5'h04: out_low = 10'h328;
              5'h05: out_low = 10'h328;
              5'h06: out_low = 10'h328;
              5'h07: out_low = 10'h328;
              5'h08: out_low = 10'h328;
              5'h09: out_low = 10'h327;
              5'h0a: out_low = 10'h327;
              5'h0b: out_low = 10'h327;
              5'h0c: out_low = 10'h327;
              5'h0d: out_low = 10'h327;
              5'h0e: out_low = 10'h327;
              5'h0f: out_low = 10'h326;
              5'h10: out_low = 10'h326;
              5'h11: out_low = 10'h326;
              5'h12: out_low = 10'h326;
              5'h13: out_low = 10'h326;
              5'h14: out_low = 10'h326;
              5'h15: out_low = 10'h326;
              5'h16: out_low = 10'h325;
              5'h17: out_low = 10'h325;
              5'h18: out_low = 10'h325;
              5'h19: out_low = 10'h325;
              5'h1a: out_low = 10'h325;
              5'h1b: out_low = 10'h325;
              5'h1c: out_low = 10'h324;
              5'h1d: out_low = 10'h324;
              5'h1e: out_low = 10'h324;
              5'h1f: out_low = 10'h324;
              default: out_low = 10'h000;
            endcase
          end
          5'h0a: begin
            case (mant[4:0])
              5'h00: out_low = 10'h324;
              5'h01: out_low = 10'h324;
              5'h02: out_low = 10'h324;
              5'h03: out_low = 10'h323;
              5'h04: out_low = 10'h323;
              5'h05: out_low = 10'h323;
              5'h06: out_low = 10'h323;
              5'h07: out_low = 10'h323;
              5'h08: out_low = 10'h323;
              5'h09: out_low = 10'h322;
              5'h0a: out_low = 10'h322;
              5'h0b: out_low = 10'h322;
              5'h0c: out_low = 10'h322;
              5'h0d: out_low = 10'h322;
              5'h0e: out_low = 10'h322;
              5'h0f: out_low = 10'h322;
              5'h10: out_low = 10'h321;
              5'h11: out_low = 10'h321;
              5'h12: out_low = 10'h321;
              5'h13: out_low = 10'h321;
              5'h14: out_low = 10'h321;
              5'h15: out_low = 10'h321;
              5'h16: out_low = 10'h320;
              5'h17: out_low = 10'h320;
              5'h18: out_low = 10'h320;
              5'h19: out_low = 10'h320;
              5'h1a: out_low = 10'h320;
              5'h1b: out_low = 10'h320;
              5'h1c: out_low = 10'h320;
              5'h1d: out_low = 10'h31f;
              5'h1e: out_low = 10'h31f;
              5'h1f: out_low = 10'h31f;
              default: out_low = 10'h000;
            endcase
          end
          5'h0b: begin
            case (mant[4:0])
              5'h00: out_low = 10'h31f;
              5'h01: out_low = 10'h31f;
              5'h02: out_low = 10'h31f;
              5'h03: out_low = 10'h31e;
              5'h04: out_low = 10'h31e;
              5'h05: out_low = 10'h31e;
              5'h06: out_low = 10'h31e;
              5'h07: out_low = 10'h31e;
              5'h08: out_low = 10'h31e;
              5'h09: out_low = 10'h31e;
              5'h0a: out_low = 10'h31d;
              5'h0b: out_low = 10'h31d;
              5'h0c: out_low = 10'h31d;
              5'h0d: out_low = 10'h31d;
              5'h0e: out_low = 10'h31d;
              5'h0f: out_low = 10'h31d;
              5'h10: out_low = 10'h31c;
              5'h11: out_low = 10'h31c;
              5'h12: out_low = 10'h31c;
              5'h13: out_low = 10'h31c;
              5'h14: out_low = 10'h31c;
              5'h15: out_low = 10'h31c;
              5'h16: out_low = 10'h31c;
              5'h17: out_low = 10'h31b;
              5'h18: out_low = 10'h31b;
              5'h19: out_low = 10'h31b;
              5'h1a: out_low = 10'h31b;
              5'h1b: out_low = 10'h31b;
              5'h1c: out_low = 10'h31b;
              5'h1d: out_low = 10'h31a;
              5'h1e: out_low = 10'h31a;
              5'h1f: out_low = 10'h31a;
              default: out_low = 10'h000;
            endcase
          end
          5'h0c: begin
            case (mant[4:0])
              5'h00: out_low = 10'h31a;
              5'h01: out_low = 10'h31a;
              5'h02: out_low = 10'h31a;
              5'h03: out_low = 10'h31a;
              5'h04: out_low = 10'h319;
              5'h05: out_low = 10'h319;
              5'h06: out_low = 10'h319;
              5'h07: out_low = 10'h319;
              5'h08: out_low = 10'h319;
              5'h09: out_low = 10'h319;
              5'h0a: out_low = 10'h318;
              5'h0b: out_low = 10'h318;
              5'h0c: out_low = 10'h318;
              5'h0d: out_low = 10'h318;
              5'h0e: out_low = 10'h318;
              5'h0f: out_low = 10'h318;
              5'h10: out_low = 10'h318;
              5'h11: out_low = 10'h317;
              5'h12: out_low = 10'h317;
              5'h13: out_low = 10'h317;
              5'h14: out_low = 10'h317;
              5'h15: out_low = 10'h317;
              5'h16: out_low = 10'h317;
              5'h17: out_low = 10'h316;
              5'h18: out_low = 10'h316;
              5'h19: out_low = 10'h316;
              5'h1a: out_low = 10'h316;
              5'h1b: out_low = 10'h316;
              5'h1c: out_low = 10'h316;
              5'h1d: out_low = 10'h316;
              5'h1e: out_low = 10'h315;
              5'h1f: out_low = 10'h315;
              default: out_low = 10'h000;
            endcase
          end
          5'h0d: begin
            case (mant[4:0])
              5'h00: out_low = 10'h315;
              5'h01: out_low = 10'h315;
              5'h02: out_low = 10'h315;
              5'h03: out_low = 10'h315;
              5'h04: out_low = 10'h314;
              5'h05: out_low = 10'h314;
              5'h06: out_low = 10'h314;
              5'h07: out_low = 10'h314;
              5'h08: out_low = 10'h314;
              5'h09: out_low = 10'h314;
              5'h0a: out_low = 10'h314;
              5'h0b: out_low = 10'h313;
              5'h0c: out_low = 10'h313;
              5'h0d: out_low = 10'h313;
              5'h0e: out_low = 10'h313;
              5'h0f: out_low = 10'h313;
              5'h10: out_low = 10'h313;
              5'h11: out_low = 10'h312;
              5'h12: out_low = 10'h312;
              5'h13: out_low = 10'h312;
              5'h14: out_low = 10'h312;
              5'h15: out_low = 10'h312;
              5'h16: out_low = 10'h312;
              5'h17: out_low = 10'h312;
              5'h18: out_low = 10'h311;
              5'h19: out_low = 10'h311;
              5'h1a: out_low = 10'h311;
              5'h1b: out_low = 10'h311;
              5'h1c: out_low = 10'h311;
              5'h1d: out_low = 10'h311;
              5'h1e: out_low = 10'h310;
              5'h1f: out_low = 10'h310;
              default: out_low = 10'h000;
            endcase
          end
          5'h0e: begin
            case (mant[4:0])
              5'h00: out_low = 10'h310;
              5'h01: out_low = 10'h310;
              5'h02: out_low = 10'h310;
              5'h03: out_low = 10'h310;
              5'h04: out_low = 10'h310;
              5'h05: out_low = 10'h30f;
              5'h06: out_low = 10'h30f;
              5'h07: out_low = 10'h30f;
              5'h08: out_low = 10'h30f;
              5'h09: out_low = 10'h30f;
              5'h0a: out_low = 10'h30f;
              5'h0b: out_low = 10'h30e;
              5'h0c: out_low = 10'h30e;
              5'h0d: out_low = 10'h30e;
              5'h0e: out_low = 10'h30e;
              5'h0f: out_low = 10'h30e;
              5'h10: out_low = 10'h30e;
              5'h11: out_low = 10'h30e;
              5'h12: out_low = 10'h30d;
              5'h13: out_low = 10'h30d;
              5'h14: out_low = 10'h30d;
              5'h15: out_low = 10'h30d;
              5'h16: out_low = 10'h30d;
              5'h17: out_low = 10'h30d;
              5'h18: out_low = 10'h30c;
              5'h19: out_low = 10'h30c;
              5'h1a: out_low = 10'h30c;
              5'h1b: out_low = 10'h30c;
              5'h1c: out_low = 10'h30c;
              5'h1d: out_low = 10'h30c;
              5'h1e: out_low = 10'h30c;
              5'h1f: out_low = 10'h30b;
              default: out_low = 10'h000;
            endcase
          end
          5'h0f: begin
            case (mant[4:0])
              5'h00: out_low = 10'h30b;
              5'h01: out_low = 10'h30b;
              5'h02: out_low = 10'h30b;
              5'h03: out_low = 10'h30b;
              5'h04: out_low = 10'h30b;
              5'h05: out_low = 10'h30b;
              5'h06: out_low = 10'h30a;
              5'h07: out_low = 10'h30a;
              5'h08: out_low = 10'h30a;
              5'h09: out_low = 10'h30a;
              5'h0a: out_low = 10'h30a;
              5'h0b: out_low = 10'h30a;
              5'h0c: out_low = 10'h309;
              5'h0d: out_low = 10'h309;
              5'h0e: out_low = 10'h309;
              5'h0f: out_low = 10'h309;
              5'h10: out_low = 10'h309;
              5'h11: out_low = 10'h309;
              5'h12: out_low = 10'h309;
              5'h13: out_low = 10'h308;
              5'h14: out_low = 10'h308;
              5'h15: out_low = 10'h308;
              5'h16: out_low = 10'h308;
              5'h17: out_low = 10'h308;
              5'h18: out_low = 10'h308;
              5'h19: out_low = 10'h307;
              5'h1a: out_low = 10'h307;
              5'h1b: out_low = 10'h307;
              5'h1c: out_low = 10'h307;
              5'h1d: out_low = 10'h307;
              5'h1e: out_low = 10'h307;
              5'h1f: out_low = 10'h307;
              default: out_low = 10'h000;
            endcase
          end
          5'h10: begin
            case (mant[4:0])
              5'h00: out_low = 10'h306;
              5'h01: out_low = 10'h306;
              5'h02: out_low = 10'h306;
              5'h03: out_low = 10'h306;
              5'h04: out_low = 10'h306;
              5'h05: out_low = 10'h306;
              5'h06: out_low = 10'h305;
              5'h07: out_low = 10'h305;
              5'h08: out_low = 10'h305;
              5'h09: out_low = 10'h305;
              5'h0a: out_low = 10'h305;
              5'h0b: out_low = 10'h305;
              5'h0c: out_low = 10'h305;
              5'h0d: out_low = 10'h304;
              5'h0e: out_low = 10'h304;
              5'h0f: out_low = 10'h304;
              5'h10: out_low = 10'h304;
              5'h11: out_low = 10'h304;
              5'h12: out_low = 10'h304;
              5'h13: out_low = 10'h304;
              5'h14: out_low = 10'h303;
              5'h15: out_low = 10'h303;
              5'h16: out_low = 10'h303;
              5'h17: out_low = 10'h303;
              5'h18: out_low = 10'h303;
              5'h19: out_low = 10'h303;
              5'h1a: out_low = 10'h302;
              5'h1b: out_low = 10'h302;
              5'h1c: out_low = 10'h302;
              5'h1d: out_low = 10'h302;
              5'h1e: out_low = 10'h302;
              5'h1f: out_low = 10'h302;
              default: out_low = 10'h000;
            endcase
          end
          5'h11: begin
            case (mant[4:0])
              5'h00: out_low = 10'h302;
              5'h01: out_low = 10'h301;
              5'h02: out_low = 10'h301;
              5'h03: out_low = 10'h301;
              5'h04: out_low = 10'h301;
              5'h05: out_low = 10'h301;
              5'h06: out_low = 10'h301;
              5'h07: out_low = 10'h300;
              5'h08: out_low = 10'h300;
              5'h09: out_low = 10'h300;
              5'h0a: out_low = 10'h300;
              5'h0b: out_low = 10'h300;
              5'h0c: out_low = 10'h300;
              5'h0d: out_low = 10'h300;
              5'h0e: out_low = 10'h2ff;
              5'h0f: out_low = 10'h2ff;
              5'h10: out_low = 10'h2ff;
              5'h11: out_low = 10'h2ff;
              5'h12: out_low = 10'h2ff;
              5'h13: out_low = 10'h2ff;
              5'h14: out_low = 10'h2ff;
              5'h15: out_low = 10'h2fe;
              5'h16: out_low = 10'h2fe;
              5'h17: out_low = 10'h2fe;
              5'h18: out_low = 10'h2fe;
              5'h19: out_low = 10'h2fe;
              5'h1a: out_low = 10'h2fe;
              5'h1b: out_low = 10'h2fd;
              5'h1c: out_low = 10'h2fd;
              5'h1d: out_low = 10'h2fd;
              5'h1e: out_low = 10'h2fd;
              5'h1f: out_low = 10'h2fd;
              default: out_low = 10'h000;
            endcase
          end
          5'h12: begin
            case (mant[4:0])
              5'h00: out_low = 10'h2fd;
              5'h01: out_low = 10'h2fd;
              5'h02: out_low = 10'h2fc;
              5'h03: out_low = 10'h2fc;
              5'h04: out_low = 10'h2fc;
              5'h05: out_low = 10'h2fc;
              5'h06: out_low = 10'h2fc;
              5'h07: out_low = 10'h2fc;
              5'h08: out_low = 10'h2fb;
              5'h09: out_low = 10'h2fb;
              5'h0a: out_low = 10'h2fb;
              5'h0b: out_low = 10'h2fb;
              5'h0c: out_low = 10'h2fb;
              5'h0d: out_low = 10'h2fb;
              5'h0e: out_low = 10'h2fb;
              5'h0f: out_low = 10'h2fa;
              5'h10: out_low = 10'h2fa;
              5'h11: out_low = 10'h2fa;
              5'h12: out_low = 10'h2fa;
              5'h13: out_low = 10'h2fa;
              5'h14: out_low = 10'h2fa;
              5'h15: out_low = 10'h2fa;
              5'h16: out_low = 10'h2f9;
              5'h17: out_low = 10'h2f9;
              5'h18: out_low = 10'h2f9;
              5'h19: out_low = 10'h2f9;
              5'h1a: out_low = 10'h2f9;
              5'h1b: out_low = 10'h2f9;
              5'h1c: out_low = 10'h2f8;
              5'h1d: out_low = 10'h2f8;
              5'h1e: out_low = 10'h2f8;
              5'h1f: out_low = 10'h2f8;
              default: out_low = 10'h000;
            endcase
          end
          5'h13: begin
            case (mant[4:0])
              5'h00: out_low = 10'h2f8;
              5'h01: out_low = 10'h2f8;
              5'h02: out_low = 10'h2f8;
              5'h03: out_low = 10'h2f7;
              5'h04: out_low = 10'h2f7;
              5'h05: out_low = 10'h2f7;
              5'h06: out_low = 10'h2f7;
              5'h07: out_low = 10'h2f7;
              5'h08: out_low = 10'h2f7;
              5'h09: out_low = 10'h2f6;
              5'h0a: out_low = 10'h2f6;
              5'h0b: out_low = 10'h2f6;
              5'h0c: out_low = 10'h2f6;
              5'h0d: out_low = 10'h2f6;
              5'h0e: out_low = 10'h2f6;
              5'h0f: out_low = 10'h2f6;
              5'h10: out_low = 10'h2f5;
              5'h11: out_low = 10'h2f5;
              5'h12: out_low = 10'h2f5;
              5'h13: out_low = 10'h2f5;
              5'h14: out_low = 10'h2f5;
              5'h15: out_low = 10'h2f5;
              5'h16: out_low = 10'h2f5;
              5'h17: out_low = 10'h2f4;
              5'h18: out_low = 10'h2f4;
              5'h19: out_low = 10'h2f4;
              5'h1a: out_low = 10'h2f4;
              5'h1b: out_low = 10'h2f4;
              5'h1c: out_low = 10'h2f4;
              5'h1d: out_low = 10'h2f3;
              5'h1e: out_low = 10'h2f3;
              5'h1f: out_low = 10'h2f3;
              default: out_low = 10'h000;
            endcase
          end
          5'h14: begin
            case (mant[4:0])
              5'h00: out_low = 10'h2f3;
              5'h01: out_low = 10'h2f3;
              5'h02: out_low = 10'h2f3;
              5'h03: out_low = 10'h2f3;
              5'h04: out_low = 10'h2f2;
              5'h05: out_low = 10'h2f2;
              5'h06: out_low = 10'h2f2;
              5'h07: out_low = 10'h2f2;
              5'h08: out_low = 10'h2f2;
              5'h09: out_low = 10'h2f2;
              5'h0a: out_low = 10'h2f2;
              5'h0b: out_low = 10'h2f1;
              5'h0c: out_low = 10'h2f1;
              5'h0d: out_low = 10'h2f1;
              5'h0e: out_low = 10'h2f1;
              5'h0f: out_low = 10'h2f1;
              5'h10: out_low = 10'h2f1;
              5'h11: out_low = 10'h2f0;
              5'h12: out_low = 10'h2f0;
              5'h13: out_low = 10'h2f0;
              5'h14: out_low = 10'h2f0;
              5'h15: out_low = 10'h2f0;
              5'h16: out_low = 10'h2f0;
              5'h17: out_low = 10'h2f0;
              5'h18: out_low = 10'h2ef;
              5'h19: out_low = 10'h2ef;
              5'h1a: out_low = 10'h2ef;
              5'h1b: out_low = 10'h2ef;
              5'h1c: out_low = 10'h2ef;
              5'h1d: out_low = 10'h2ef;
              5'h1e: out_low = 10'h2ef;
              5'h1f: out_low = 10'h2ee;
              default: out_low = 10'h000;
            endcase
          end
          5'h15: begin
            case (mant[4:0])
              5'h00: out_low = 10'h2ee;
              5'h01: out_low = 10'h2ee;
              5'h02: out_low = 10'h2ee;
              5'h03: out_low = 10'h2ee;
              5'h04: out_low = 10'h2ee;
              5'h05: out_low = 10'h2ed;
              5'h06: out_low = 10'h2ed;
              5'h07: out_low = 10'h2ed;
              5'h08: out_low = 10'h2ed;
              5'h09: out_low = 10'h2ed;
              5'h0a: out_low = 10'h2ed;
              5'h0b: out_low = 10'h2ed;
              5'h0c: out_low = 10'h2ec;
              5'h0d: out_low = 10'h2ec;
              5'h0e: out_low = 10'h2ec;
              5'h0f: out_low = 10'h2ec;
              5'h10: out_low = 10'h2ec;
              5'h11: out_low = 10'h2ec;
              5'h12: out_low = 10'h2ec;
              5'h13: out_low = 10'h2eb;
              5'h14: out_low = 10'h2eb;
              5'h15: out_low = 10'h2eb;
              5'h16: out_low = 10'h2eb;
              5'h17: out_low = 10'h2eb;
              5'h18: out_low = 10'h2eb;
              5'h19: out_low = 10'h2ea;
              5'h1a: out_low = 10'h2ea;
              5'h1b: out_low = 10'h2ea;
              5'h1c: out_low = 10'h2ea;
              5'h1d: out_low = 10'h2ea;
              5'h1e: out_low = 10'h2ea;
              5'h1f: out_low = 10'h2ea;
              default: out_low = 10'h000;
            endcase
          end
          5'h16: begin
            case (mant[4:0])
              5'h00: out_low = 10'h2e9;
              5'h01: out_low = 10'h2e9;
              5'h02: out_low = 10'h2e9;
              5'h03: out_low = 10'h2e9;
              5'h04: out_low = 10'h2e9;
              5'h05: out_low = 10'h2e9;
              5'h06: out_low = 10'h2e9;
              5'h07: out_low = 10'h2e8;
              5'h08: out_low = 10'h2e8;
              5'h09: out_low = 10'h2e8;
              5'h0a: out_low = 10'h2e8;
              5'h0b: out_low = 10'h2e8;
              5'h0c: out_low = 10'h2e8;
              5'h0d: out_low = 10'h2e7;
              5'h0e: out_low = 10'h2e7;
              5'h0f: out_low = 10'h2e7;
              5'h10: out_low = 10'h2e7;
              5'h11: out_low = 10'h2e7;
              5'h12: out_low = 10'h2e7;
              5'h13: out_low = 10'h2e7;
              5'h14: out_low = 10'h2e6;
              5'h15: out_low = 10'h2e6;
              5'h16: out_low = 10'h2e6;
              5'h17: out_low = 10'h2e6;
              5'h18: out_low = 10'h2e6;
              5'h19: out_low = 10'h2e6;
              5'h1a: out_low = 10'h2e6;
              5'h1b: out_low = 10'h2e5;
              5'h1c: out_low = 10'h2e5;
              5'h1d: out_low = 10'h2e5;
              5'h1e: out_low = 10'h2e5;
              5'h1f: out_low = 10'h2e5;
              default: out_low = 10'h000;
            endcase
          end
          5'h17: begin
            case (mant[4:0])
              5'h00: out_low = 10'h2e5;
              5'h01: out_low = 10'h2e4;
              5'h02: out_low = 10'h2e4;
              5'h03: out_low = 10'h2e4;
              5'h04: out_low = 10'h2e4;
              5'h05: out_low = 10'h2e4;
              5'h06: out_low = 10'h2e4;
              5'h07: out_low = 10'h2e4;
              5'h08: out_low = 10'h2e3;
              5'h09: out_low = 10'h2e3;
              5'h0a: out_low = 10'h2e3;
              5'h0b: out_low = 10'h2e3;
              5'h0c: out_low = 10'h2e3;
              5'h0d: out_low = 10'h2e3;
              5'h0e: out_low = 10'h2e3;
              5'h0f: out_low = 10'h2e2;
              5'h10: out_low = 10'h2e2;
              5'h11: out_low = 10'h2e2;
              5'h12: out_low = 10'h2e2;
              5'h13: out_low = 10'h2e2;
              5'h14: out_low = 10'h2e2;
              5'h15: out_low = 10'h2e2;
              5'h16: out_low = 10'h2e1;
              5'h17: out_low = 10'h2e1;
              5'h18: out_low = 10'h2e1;
              5'h19: out_low = 10'h2e1;
              5'h1a: out_low = 10'h2e1;
              5'h1b: out_low = 10'h2e1;
              5'h1c: out_low = 10'h2e0;
              5'h1d: out_low = 10'h2e0;
              5'h1e: out_low = 10'h2e0;
              5'h1f: out_low = 10'h2e0;
              default: out_low = 10'h000;
            endcase
          end
          5'h18: begin
            case (mant[4:0])
              5'h00: out_low = 10'h2e0;
              5'h01: out_low = 10'h2e0;
              5'h02: out_low = 10'h2e0;
              5'h03: out_low = 10'h2df;
              5'h04: out_low = 10'h2df;
              5'h05: out_low = 10'h2df;
              5'h06: out_low = 10'h2df;
              5'h07: out_low = 10'h2df;
              5'h08: out_low = 10'h2df;
              5'h09: out_low = 10'h2df;
              5'h0a: out_low = 10'h2de;
              5'h0b: out_low = 10'h2de;
              5'h0c: out_low = 10'h2de;
              5'h0d: out_low = 10'h2de;
              5'h0e: out_low = 10'h2de;
              5'h0f: out_low = 10'h2de;
              5'h10: out_low = 10'h2dd;
              5'h11: out_low = 10'h2dd;
              5'h12: out_low = 10'h2dd;
              5'h13: out_low = 10'h2dd;
              5'h14: out_low = 10'h2dd;
              5'h15: out_low = 10'h2dd;
              5'h16: out_low = 10'h2dd;
              5'h17: out_low = 10'h2dc;
              5'h18: out_low = 10'h2dc;
              5'h19: out_low = 10'h2dc;
              5'h1a: out_low = 10'h2dc;
              5'h1b: out_low = 10'h2dc;
              5'h1c: out_low = 10'h2dc;
              5'h1d: out_low = 10'h2dc;
              5'h1e: out_low = 10'h2db;
              5'h1f: out_low = 10'h2db;
              default: out_low = 10'h000;
            endcase
          end
          5'h19: begin
            case (mant[4:0])
              5'h00: out_low = 10'h2db;
              5'h01: out_low = 10'h2db;
              5'h02: out_low = 10'h2db;
              5'h03: out_low = 10'h2db;
              5'h04: out_low = 10'h2db;
              5'h05: out_low = 10'h2da;
              5'h06: out_low = 10'h2da;
              5'h07: out_low = 10'h2da;
              5'h08: out_low = 10'h2da;
              5'h09: out_low = 10'h2da;
              5'h0a: out_low = 10'h2da;
              5'h0b: out_low = 10'h2d9;
              5'h0c: out_low = 10'h2d9;
              5'h0d: out_low = 10'h2d9;
              5'h0e: out_low = 10'h2d9;
              5'h0f: out_low = 10'h2d9;
              5'h10: out_low = 10'h2d9;
              5'h11: out_low = 10'h2d9;
              5'h12: out_low = 10'h2d8;
              5'h13: out_low = 10'h2d8;
              5'h14: out_low = 10'h2d8;
              5'h15: out_low = 10'h2d8;
              5'h16: out_low = 10'h2d8;
              5'h17: out_low = 10'h2d8;
              5'h18: out_low = 10'h2d8;
              5'h19: out_low = 10'h2d7;
              5'h1a: out_low = 10'h2d7;
              5'h1b: out_low = 10'h2d7;
              5'h1c: out_low = 10'h2d7;
              5'h1d: out_low = 10'h2d7;
              5'h1e: out_low = 10'h2d7;
              5'h1f: out_low = 10'h2d7;
              default: out_low = 10'h000;
            endcase
          end
          5'h1a: begin
            case (mant[4:0])
              5'h00: out_low = 10'h2d6;
              5'h01: out_low = 10'h2d6;
              5'h02: out_low = 10'h2d6;
              5'h03: out_low = 10'h2d6;
              5'h04: out_low = 10'h2d6;
              5'h05: out_low = 10'h2d6;
              5'h06: out_low = 10'h2d5;
              5'h07: out_low = 10'h2d5;
              5'h08: out_low = 10'h2d5;
              5'h09: out_low = 10'h2d5;
              5'h0a: out_low = 10'h2d5;
              5'h0b: out_low = 10'h2d5;
              5'h0c: out_low = 10'h2d5;
              5'h0d: out_low = 10'h2d4;
              5'h0e: out_low = 10'h2d4;
              5'h0f: out_low = 10'h2d4;
              5'h10: out_low = 10'h2d4;
              5'h11: out_low = 10'h2d4;
              5'h12: out_low = 10'h2d4;
              5'h13: out_low = 10'h2d4;
              5'h14: out_low = 10'h2d3;
              5'h15: out_low = 10'h2d3;
              5'h16: out_low = 10'h2d3;
              5'h17: out_low = 10'h2d3;
              5'h18: out_low = 10'h2d3;
              5'h19: out_low = 10'h2d3;
              5'h1a: out_low = 10'h2d3;
              5'h1b: out_low = 10'h2d2;
              5'h1c: out_low = 10'h2d2;
              5'h1d: out_low = 10'h2d2;
              5'h1e: out_low = 10'h2d2;
              5'h1f: out_low = 10'h2d2;
              default: out_low = 10'h000;
            endcase
          end
          5'h1b: begin
            case (mant[4:0])
              5'h00: out_low = 10'h2d2;
              5'h01: out_low = 10'h2d1;
              5'h02: out_low = 10'h2d1;
              5'h03: out_low = 10'h2d1;
              5'h04: out_low = 10'h2d1;
              5'h05: out_low = 10'h2d1;
              5'h06: out_low = 10'h2d1;
              5'h07: out_low = 10'h2d1;
              5'h08: out_low = 10'h2d0;
              5'h09: out_low = 10'h2d0;
              5'h0a: out_low = 10'h2d0;
              5'h0b: out_low = 10'h2d0;
              5'h0c: out_low = 10'h2d0;
              5'h0d: out_low = 10'h2d0;
              5'h0e: out_low = 10'h2d0;
              5'h0f: out_low = 10'h2cf;
              5'h10: out_low = 10'h2cf;
              5'h11: out_low = 10'h2cf;
              5'h12: out_low = 10'h2cf;
              5'h13: out_low = 10'h2cf;
              5'h14: out_low = 10'h2cf;
              5'h15: out_low = 10'h2cf;
              5'h16: out_low = 10'h2ce;
              5'h17: out_low = 10'h2ce;
              5'h18: out_low = 10'h2ce;
              5'h19: out_low = 10'h2ce;
              5'h1a: out_low = 10'h2ce;
              5'h1b: out_low = 10'h2ce;
              5'h1c: out_low = 10'h2cd;
              5'h1d: out_low = 10'h2cd;
              5'h1e: out_low = 10'h2cd;
              5'h1f: out_low = 10'h2cd;
              default: out_low = 10'h000;
            endcase
          end
          5'h1c: begin
            case (mant[4:0])
              5'h00: out_low = 10'h2cd;
              5'h01: out_low = 10'h2cd;
              5'h02: out_low = 10'h2cd;
              5'h03: out_low = 10'h2cc;
              5'h04: out_low = 10'h2cc;
              5'h05: out_low = 10'h2cc;
              5'h06: out_low = 10'h2cc;
              5'h07: out_low = 10'h2cc;
              5'h08: out_low = 10'h2cc;
              5'h09: out_low = 10'h2cc;
              5'h0a: out_low = 10'h2cb;
              5'h0b: out_low = 10'h2cb;
              5'h0c: out_low = 10'h2cb;
              5'h0d: out_low = 10'h2cb;
              5'h0e: out_low = 10'h2cb;
              5'h0f: out_low = 10'h2cb;
              5'h10: out_low = 10'h2cb;
              5'h11: out_low = 10'h2ca;
              5'h12: out_low = 10'h2ca;
              5'h13: out_low = 10'h2ca;
              5'h14: out_low = 10'h2ca;
              5'h15: out_low = 10'h2ca;
              5'h16: out_low = 10'h2ca;
              5'h17: out_low = 10'h2ca;
              5'h18: out_low = 10'h2c9;
              5'h19: out_low = 10'h2c9;
              5'h1a: out_low = 10'h2c9;
              5'h1b: out_low = 10'h2c9;
              5'h1c: out_low = 10'h2c9;
              5'h1d: out_low = 10'h2c9;
              5'h1e: out_low = 10'h2c8;
              5'h1f: out_low = 10'h2c8;
              default: out_low = 10'h000;
            endcase
          end
          5'h1d: begin
            case (mant[4:0])
              5'h00: out_low = 10'h2c8;
              5'h01: out_low = 10'h2c8;
              5'h02: out_low = 10'h2c8;
              5'h03: out_low = 10'h2c8;
              5'h04: out_low = 10'h2c8;
              5'h05: out_low = 10'h2c7;
              5'h06: out_low = 10'h2c7;
              5'h07: out_low = 10'h2c7;
              5'h08: out_low = 10'h2c7;
              5'h09: out_low = 10'h2c7;
              5'h0a: out_low = 10'h2c7;
              5'h0b: out_low = 10'h2c7;
              5'h0c: out_low = 10'h2c6;
              5'h0d: out_low = 10'h2c6;
              5'h0e: out_low = 10'h2c6;
              5'h0f: out_low = 10'h2c6;
              5'h10: out_low = 10'h2c6;
              5'h11: out_low = 10'h2c6;
              5'h12: out_low = 10'h2c6;
              5'h13: out_low = 10'h2c5;
              5'h14: out_low = 10'h2c5;
              5'h15: out_low = 10'h2c5;
              5'h16: out_low = 10'h2c5;
              5'h17: out_low = 10'h2c5;
              5'h18: out_low = 10'h2c5;
              5'h19: out_low = 10'h2c5;
              5'h1a: out_low = 10'h2c4;
              5'h1b: out_low = 10'h2c4;
              5'h1c: out_low = 10'h2c4;
              5'h1d: out_low = 10'h2c4;
              5'h1e: out_low = 10'h2c4;
              5'h1f: out_low = 10'h2c4;
              default: out_low = 10'h000;
            endcase
          end
          5'h1e: begin
            case (mant[4:0])
              5'h00: out_low = 10'h2c4;
              5'h01: out_low = 10'h2c3;
              5'h02: out_low = 10'h2c3;
              5'h03: out_low = 10'h2c3;
              5'h04: out_low = 10'h2c3;
              5'h05: out_low = 10'h2c3;
              5'h06: out_low = 10'h2c3;
              5'h07: out_low = 10'h2c2;
              5'h08: out_low = 10'h2c2;
              5'h09: out_low = 10'h2c2;
              5'h0a: out_low = 10'h2c2;
              5'h0b: out_low = 10'h2c2;
              5'h0c: out_low = 10'h2c2;
              5'h0d: out_low = 10'h2c2;
              5'h0e: out_low = 10'h2c1;
              5'h0f: out_low = 10'h2c1;
              5'h10: out_low = 10'h2c1;
              5'h11: out_low = 10'h2c1;
              5'h12: out_low = 10'h2c1;
              5'h13: out_low = 10'h2c1;
              5'h14: out_low = 10'h2c1;
              5'h15: out_low = 10'h2c0;
              5'h16: out_low = 10'h2c0;
              5'h17: out_low = 10'h2c0;
              5'h18: out_low = 10'h2c0;
              5'h19: out_low = 10'h2c0;
              5'h1a: out_low = 10'h2c0;
              5'h1b: out_low = 10'h2c0;
              5'h1c: out_low = 10'h2bf;
              5'h1d: out_low = 10'h2bf;
              5'h1e: out_low = 10'h2bf;
              5'h1f: out_low = 10'h2bf;
              default: out_low = 10'h000;
            endcase
          end
          5'h1f: begin
            case (mant[4:0])
              5'h00: out_low = 10'h2bf;
              5'h01: out_low = 10'h2bf;
              5'h02: out_low = 10'h2bf;
              5'h03: out_low = 10'h2be;
              5'h04: out_low = 10'h2be;
              5'h05: out_low = 10'h2be;
              5'h06: out_low = 10'h2be;
              5'h07: out_low = 10'h2be;
              5'h08: out_low = 10'h2be;
              5'h09: out_low = 10'h2be;
              5'h0a: out_low = 10'h2bd;
              5'h0b: out_low = 10'h2bd;
              5'h0c: out_low = 10'h2bd;
              5'h0d: out_low = 10'h2bd;
              5'h0e: out_low = 10'h2bd;
              5'h0f: out_low = 10'h2bd;
              5'h10: out_low = 10'h2bc;
              5'h11: out_low = 10'h2bc;
              5'h12: out_low = 10'h2bc;
              5'h13: out_low = 10'h2bc;
              5'h14: out_low = 10'h2bc;
              5'h15: out_low = 10'h2bc;
              5'h16: out_low = 10'h2bc;
              5'h17: out_low = 10'h2bb;
              5'h18: out_low = 10'h2bb;
              5'h19: out_low = 10'h2bb;
              5'h1a: out_low = 10'h2bb;
              5'h1b: out_low = 10'h2bb;
              5'h1c: out_low = 10'h2bb;
              5'h1d: out_low = 10'h2bb;
              5'h1e: out_low = 10'h2ba;
              5'h1f: out_low = 10'h2ba;
              default: out_low = 10'h000;
            endcase
          end
          default: out_low = 10'h000;
        endcase
      end
      6'h2d: begin
        case (mant[9:5])
          5'h00: begin
            case (mant[4:0])
              5'h00: out_low = 10'h2ba;
              5'h01: out_low = 10'h2ba;
              5'h02: out_low = 10'h2ba;
              5'h03: out_low = 10'h2b9;
              5'h04: out_low = 10'h2b9;
              5'h05: out_low = 10'h2b9;
              5'h06: out_low = 10'h2b8;
              5'h07: out_low = 10'h2b8;
              5'h08: out_low = 10'h2b8;
              5'h09: out_low = 10'h2b8;
              5'h0a: out_low = 10'h2b7;
              5'h0b: out_low = 10'h2b7;
              5'h0c: out_low = 10'h2b7;
              5'h0d: out_low = 10'h2b6;
              5'h0e: out_low = 10'h2b6;
              5'h0f: out_low = 10'h2b6;
              5'h10: out_low = 10'h2b5;
              5'h11: out_low = 10'h2b5;
              5'h12: out_low = 10'h2b5;
              5'h13: out_low = 10'h2b5;
              5'h14: out_low = 10'h2b4;
              5'h15: out_low = 10'h2b4;
              5'h16: out_low = 10'h2b4;
              5'h17: out_low = 10'h2b3;
              5'h18: out_low = 10'h2b3;
              5'h19: out_low = 10'h2b3;
              5'h1a: out_low = 10'h2b3;
              5'h1b: out_low = 10'h2b2;
              5'h1c: out_low = 10'h2b2;
              5'h1d: out_low = 10'h2b2;
              5'h1e: out_low = 10'h2b1;
              5'h1f: out_low = 10'h2b1;
              default: out_low = 10'h000;
            endcase
          end
          5'h01: begin
            case (mant[4:0])
              5'h00: out_low = 10'h2b1;
              5'h01: out_low = 10'h2b1;
              5'h02: out_low = 10'h2b0;
              5'h03: out_low = 10'h2b0;
              5'h04: out_low = 10'h2b0;
              5'h05: out_low = 10'h2af;
              5'h06: out_low = 10'h2af;
              5'h07: out_low = 10'h2af;
              5'h08: out_low = 10'h2af;
              5'h09: out_low = 10'h2ae;
              5'h0a: out_low = 10'h2ae;
              5'h0b: out_low = 10'h2ae;
              5'h0c: out_low = 10'h2ad;
              5'h0d: out_low = 10'h2ad;
              5'h0e: out_low = 10'h2ad;
              5'h0f: out_low = 10'h2ad;
              5'h10: out_low = 10'h2ac;
              5'h11: out_low = 10'h2ac;
              5'h12: out_low = 10'h2ac;
              5'h13: out_low = 10'h2ab;
              5'h14: out_low = 10'h2ab;
              5'h15: out_low = 10'h2ab;
              5'h16: out_low = 10'h2aa;
              5'h17: out_low = 10'h2aa;
              5'h18: out_low = 10'h2aa;
              5'h19: out_low = 10'h2aa;
              5'h1a: out_low = 10'h2a9;
              5'h1b: out_low = 10'h2a9;
              5'h1c: out_low = 10'h2a9;
              5'h1d: out_low = 10'h2a8;
              5'h1e: out_low = 10'h2a8;
              5'h1f: out_low = 10'h2a8;
              default: out_low = 10'h000;
            endcase
          end
          5'h02: begin
            case (mant[4:0])
              5'h00: out_low = 10'h2a8;
              5'h01: out_low = 10'h2a7;
              5'h02: out_low = 10'h2a7;
              5'h03: out_low = 10'h2a7;
              5'h04: out_low = 10'h2a6;
              5'h05: out_low = 10'h2a6;
              5'h06: out_low = 10'h2a6;
              5'h07: out_low = 10'h2a6;
              5'h08: out_low = 10'h2a5;
              5'h09: out_low = 10'h2a5;
              5'h0a: out_low = 10'h2a5;
              5'h0b: out_low = 10'h2a4;
              5'h0c: out_low = 10'h2a4;
              5'h0d: out_low = 10'h2a4;
              5'h0e: out_low = 10'h2a4;
              5'h0f: out_low = 10'h2a3;
              5'h10: out_low = 10'h2a3;
              5'h11: out_low = 10'h2a3;
              5'h12: out_low = 10'h2a2;
              5'h13: out_low = 10'h2a2;
              5'h14: out_low = 10'h2a2;
              5'h15: out_low = 10'h2a2;
              5'h16: out_low = 10'h2a1;
              5'h17: out_low = 10'h2a1;
              5'h18: out_low = 10'h2a1;
              5'h19: out_low = 10'h2a0;
              5'h1a: out_low = 10'h2a0;
              5'h1b: out_low = 10'h2a0;
              5'h1c: out_low = 10'h2a0;
              5'h1d: out_low = 10'h29f;
              5'h1e: out_low = 10'h29f;
              5'h1f: out_low = 10'h29f;
              default: out_low = 10'h000;
            endcase
          end
          5'h03: begin
            case (mant[4:0])
              5'h00: out_low = 10'h29e;
              5'h01: out_low = 10'h29e;
              5'h02: out_low = 10'h29e;
              5'h03: out_low = 10'h29e;
              5'h04: out_low = 10'h29d;
              5'h05: out_low = 10'h29d;
              5'h06: out_low = 10'h29d;
              5'h07: out_low = 10'h29c;
              5'h08: out_low = 10'h29c;
              5'h09: out_low = 10'h29c;
              5'h0a: out_low = 10'h29c;
              5'h0b: out_low = 10'h29b;
              5'h0c: out_low = 10'h29b;
              5'h0d: out_low = 10'h29b;
              5'h0e: out_low = 10'h29a;
              5'h0f: out_low = 10'h29a;
              5'h10: out_low = 10'h29a;
              5'h11: out_low = 10'h29a;
              5'h12: out_low = 10'h299;
              5'h13: out_low = 10'h299;
              5'h14: out_low = 10'h299;
              5'h15: out_low = 10'h298;
              5'h16: out_low = 10'h298;
              5'h17: out_low = 10'h298;
              5'h18: out_low = 10'h298;
              5'h19: out_low = 10'h297;
              5'h1a: out_low = 10'h297;
              5'h1b: out_low = 10'h297;
              5'h1c: out_low = 10'h296;
              5'h1d: out_low = 10'h296;
              5'h1e: out_low = 10'h296;
              5'h1f: out_low = 10'h296;
              default: out_low = 10'h000;
            endcase
          end
          5'h04: begin
            case (mant[4:0])
              5'h00: out_low = 10'h295;
              5'h01: out_low = 10'h295;
              5'h02: out_low = 10'h295;
              5'h03: out_low = 10'h294;
              5'h04: out_low = 10'h294;
              5'h05: out_low = 10'h294;
              5'h06: out_low = 10'h294;
              5'h07: out_low = 10'h293;
              5'h08: out_low = 10'h293;
              5'h09: out_low = 10'h293;
              5'h0a: out_low = 10'h292;
              5'h0b: out_low = 10'h292;
              5'h0c: out_low = 10'h292;
              5'h0d: out_low = 10'h292;
              5'h0e: out_low = 10'h291;
              5'h0f: out_low = 10'h291;
              5'h10: out_low = 10'h291;
              5'h11: out_low = 10'h290;
              5'h12: out_low = 10'h290;
              5'h13: out_low = 10'h290;
              5'h14: out_low = 10'h290;
              5'h15: out_low = 10'h28f;
              5'h16: out_low = 10'h28f;
              5'h17: out_low = 10'h28f;
              5'h18: out_low = 10'h28e;
              5'h19: out_low = 10'h28e;
              5'h1a: out_low = 10'h28e;
              5'h1b: out_low = 10'h28e;
              5'h1c: out_low = 10'h28d;
              5'h1d: out_low = 10'h28d;
              5'h1e: out_low = 10'h28d;
              5'h1f: out_low = 10'h28c;
              default: out_low = 10'h000;
            endcase
          end
          5'h05: begin
            case (mant[4:0])
              5'h00: out_low = 10'h28c;
              5'h01: out_low = 10'h28c;
              5'h02: out_low = 10'h28c;
              5'h03: out_low = 10'h28b;
              5'h04: out_low = 10'h28b;
              5'h05: out_low = 10'h28b;
              5'h06: out_low = 10'h28a;
              5'h07: out_low = 10'h28a;
              5'h08: out_low = 10'h28a;
              5'h09: out_low = 10'h28a;
              5'h0a: out_low = 10'h289;
              5'h0b: out_low = 10'h289;
              5'h0c: out_low = 10'h289;
              5'h0d: out_low = 10'h288;
              5'h0e: out_low = 10'h288;
              5'h0f: out_low = 10'h288;
              5'h10: out_low = 10'h288;
              5'h11: out_low = 10'h287;
              5'h12: out_low = 10'h287;
              5'h13: out_low = 10'h287;
              5'h14: out_low = 10'h286;
              5'h15: out_low = 10'h286;
              5'h16: out_low = 10'h286;
              5'h17: out_low = 10'h286;
              5'h18: out_low = 10'h285;
              5'h19: out_low = 10'h285;
              5'h1a: out_low = 10'h285;
              5'h1b: out_low = 10'h285;
              5'h1c: out_low = 10'h284;
              5'h1d: out_low = 10'h284;
              5'h1e: out_low = 10'h284;
              5'h1f: out_low = 10'h283;
              default: out_low = 10'h000;
            endcase
          end
          5'h06: begin
            case (mant[4:0])
              5'h00: out_low = 10'h283;
              5'h01: out_low = 10'h283;
              5'h02: out_low = 10'h283;
              5'h03: out_low = 10'h282;
              5'h04: out_low = 10'h282;
              5'h05: out_low = 10'h282;
              5'h06: out_low = 10'h281;
              5'h07: out_low = 10'h281;
              5'h08: out_low = 10'h281;
              5'h09: out_low = 10'h281;
              5'h0a: out_low = 10'h280;
              5'h0b: out_low = 10'h280;
              5'h0c: out_low = 10'h280;
              5'h0d: out_low = 10'h27f;
              5'h0e: out_low = 10'h27f;
              5'h0f: out_low = 10'h27f;
              5'h10: out_low = 10'h27f;
              5'h11: out_low = 10'h27e;
              5'h12: out_low = 10'h27e;
              5'h13: out_low = 10'h27e;
              5'h14: out_low = 10'h27d;
              5'h15: out_low = 10'h27d;
              5'h16: out_low = 10'h27d;
              5'h17: out_low = 10'h27d;
              5'h18: out_low = 10'h27c;
              5'h19: out_low = 10'h27c;
              5'h1a: out_low = 10'h27c;
              5'h1b: out_low = 10'h27c;
              5'h1c: out_low = 10'h27b;
              5'h1d: out_low = 10'h27b;
              5'h1e: out_low = 10'h27b;
              5'h1f: out_low = 10'h27a;
              default: out_low = 10'h000;
            endcase
          end
          5'h07: begin
            case (mant[4:0])
              5'h00: out_low = 10'h27a;
              5'h01: out_low = 10'h27a;
              5'h02: out_low = 10'h27a;
              5'h03: out_low = 10'h279;
              5'h04: out_low = 10'h279;
              5'h05: out_low = 10'h279;
              5'h06: out_low = 10'h278;
              5'h07: out_low = 10'h278;
              5'h08: out_low = 10'h278;
              5'h09: out_low = 10'h278;
              5'h0a: out_low = 10'h277;
              5'h0b: out_low = 10'h277;
              5'h0c: out_low = 10'h277;
              5'h0d: out_low = 10'h276;
              5'h0e: out_low = 10'h276;
              5'h0f: out_low = 10'h276;
              5'h10: out_low = 10'h276;
              5'h11: out_low = 10'h275;
              5'h12: out_low = 10'h275;
              5'h13: out_low = 10'h275;
              5'h14: out_low = 10'h274;
              5'h15: out_low = 10'h274;
              5'h16: out_low = 10'h274;
              5'h17: out_low = 10'h274;
              5'h18: out_low = 10'h273;
              5'h19: out_low = 10'h273;
              5'h1a: out_low = 10'h273;
              5'h1b: out_low = 10'h273;
              5'h1c: out_low = 10'h272;
              5'h1d: out_low = 10'h272;
              5'h1e: out_low = 10'h272;
              5'h1f: out_low = 10'h271;
              default: out_low = 10'h000;
            endcase
          end
          5'h08: begin
            case (mant[4:0])
              5'h00: out_low = 10'h271;
              5'h01: out_low = 10'h271;
              5'h02: out_low = 10'h271;
              5'h03: out_low = 10'h270;
              5'h04: out_low = 10'h270;
              5'h05: out_low = 10'h270;
              5'h06: out_low = 10'h26f;
              5'h07: out_low = 10'h26f;
              5'h08: out_low = 10'h26f;
              5'h09: out_low = 10'h26f;
              5'h0a: out_low = 10'h26e;
              5'h0b: out_low = 10'h26e;
              5'h0c: out_low = 10'h26e;
              5'h0d: out_low = 10'h26e;
              5'h0e: out_low = 10'h26d;
              5'h0f: out_low = 10'h26d;
              5'h10: out_low = 10'h26d;
              5'h11: out_low = 10'h26c;
              5'h12: out_low = 10'h26c;
              5'h13: out_low = 10'h26c;
              5'h14: out_low = 10'h26c;
              5'h15: out_low = 10'h26b;
              5'h16: out_low = 10'h26b;
              5'h17: out_low = 10'h26b;
              5'h18: out_low = 10'h26a;
              5'h19: out_low = 10'h26a;
              5'h1a: out_low = 10'h26a;
              5'h1b: out_low = 10'h26a;
              5'h1c: out_low = 10'h269;
              5'h1d: out_low = 10'h269;
              5'h1e: out_low = 10'h269;
              5'h1f: out_low = 10'h269;
              default: out_low = 10'h000;
            endcase
          end
          5'h09: begin
            case (mant[4:0])
              5'h00: out_low = 10'h268;
              5'h01: out_low = 10'h268;
              5'h02: out_low = 10'h268;
              5'h03: out_low = 10'h267;
              5'h04: out_low = 10'h267;
              5'h05: out_low = 10'h267;
              5'h06: out_low = 10'h267;
              5'h07: out_low = 10'h266;
              5'h08: out_low = 10'h266;
              5'h09: out_low = 10'h266;
              5'h0a: out_low = 10'h265;
              5'h0b: out_low = 10'h265;
              5'h0c: out_low = 10'h265;
              5'h0d: out_low = 10'h265;
              5'h0e: out_low = 10'h264;
              5'h0f: out_low = 10'h264;
              5'h10: out_low = 10'h264;
              5'h11: out_low = 10'h264;
              5'h12: out_low = 10'h263;
              5'h13: out_low = 10'h263;
              5'h14: out_low = 10'h263;
              5'h15: out_low = 10'h262;
              5'h16: out_low = 10'h262;
              5'h17: out_low = 10'h262;
              5'h18: out_low = 10'h262;
              5'h19: out_low = 10'h261;
              5'h1a: out_low = 10'h261;
              5'h1b: out_low = 10'h261;
              5'h1c: out_low = 10'h260;
              5'h1d: out_low = 10'h260;
              5'h1e: out_low = 10'h260;
              5'h1f: out_low = 10'h260;
              default: out_low = 10'h000;
            endcase
          end
          5'h0a: begin
            case (mant[4:0])
              5'h00: out_low = 10'h25f;
              5'h01: out_low = 10'h25f;
              5'h02: out_low = 10'h25f;
              5'h03: out_low = 10'h25f;
              5'h04: out_low = 10'h25e;
              5'h05: out_low = 10'h25e;
              5'h06: out_low = 10'h25e;
              5'h07: out_low = 10'h25d;
              5'h08: out_low = 10'h25d;
              5'h09: out_low = 10'h25d;
              5'h0a: out_low = 10'h25d;
              5'h0b: out_low = 10'h25c;
              5'h0c: out_low = 10'h25c;
              5'h0d: out_low = 10'h25c;
              5'h0e: out_low = 10'h25c;
              5'h0f: out_low = 10'h25b;
              5'h10: out_low = 10'h25b;
              5'h11: out_low = 10'h25b;
              5'h12: out_low = 10'h25a;
              5'h13: out_low = 10'h25a;
              5'h14: out_low = 10'h25a;
              5'h15: out_low = 10'h25a;
              5'h16: out_low = 10'h259;
              5'h17: out_low = 10'h259;
              5'h18: out_low = 10'h259;
              5'h19: out_low = 10'h258;
              5'h1a: out_low = 10'h258;
              5'h1b: out_low = 10'h258;
              5'h1c: out_low = 10'h258;
              5'h1d: out_low = 10'h257;
              5'h1e: out_low = 10'h257;
              5'h1f: out_low = 10'h257;
              default: out_low = 10'h000;
            endcase
          end
          5'h0b: begin
            case (mant[4:0])
              5'h00: out_low = 10'h257;
              5'h01: out_low = 10'h256;
              5'h02: out_low = 10'h256;
              5'h03: out_low = 10'h256;
              5'h04: out_low = 10'h255;
              5'h05: out_low = 10'h255;
              5'h06: out_low = 10'h255;
              5'h07: out_low = 10'h255;
              5'h08: out_low = 10'h254;
              5'h09: out_low = 10'h254;
              5'h0a: out_low = 10'h254;
              5'h0b: out_low = 10'h254;
              5'h0c: out_low = 10'h253;
              5'h0d: out_low = 10'h253;
              5'h0e: out_low = 10'h253;
              5'h0f: out_low = 10'h252;
              5'h10: out_low = 10'h252;
              5'h11: out_low = 10'h252;
              5'h12: out_low = 10'h252;
              5'h13: out_low = 10'h251;
              5'h14: out_low = 10'h251;
              5'h15: out_low = 10'h251;
              5'h16: out_low = 10'h251;
              5'h17: out_low = 10'h250;
              5'h18: out_low = 10'h250;
              5'h19: out_low = 10'h250;
              5'h1a: out_low = 10'h24f;
              5'h1b: out_low = 10'h24f;
              5'h1c: out_low = 10'h24f;
              5'h1d: out_low = 10'h24f;
              5'h1e: out_low = 10'h24e;
              5'h1f: out_low = 10'h24e;
              default: out_low = 10'h000;
            endcase
          end
          5'h0c: begin
            case (mant[4:0])
              5'h00: out_low = 10'h24e;
              5'h01: out_low = 10'h24e;
              5'h02: out_low = 10'h24d;
              5'h03: out_low = 10'h24d;
              5'h04: out_low = 10'h24d;
              5'h05: out_low = 10'h24c;
              5'h06: out_low = 10'h24c;
              5'h07: out_low = 10'h24c;
              5'h08: out_low = 10'h24c;
              5'h09: out_low = 10'h24b;
              5'h0a: out_low = 10'h24b;
              5'h0b: out_low = 10'h24b;
              5'h0c: out_low = 10'h24b;
              5'h0d: out_low = 10'h24a;
              5'h0e: out_low = 10'h24a;
              5'h0f: out_low = 10'h24a;
              5'h10: out_low = 10'h249;
              5'h11: out_low = 10'h249;
              5'h12: out_low = 10'h249;
              5'h13: out_low = 10'h249;
              5'h14: out_low = 10'h248;
              5'h15: out_low = 10'h248;
              5'h16: out_low = 10'h248;
              5'h17: out_low = 10'h248;
              5'h18: out_low = 10'h247;
              5'h19: out_low = 10'h247;
              5'h1a: out_low = 10'h247;
              5'h1b: out_low = 10'h246;
              5'h1c: out_low = 10'h246;
              5'h1d: out_low = 10'h246;
              5'h1e: out_low = 10'h246;
              5'h1f: out_low = 10'h245;
              default: out_low = 10'h000;
            endcase
          end
          5'h0d: begin
            case (mant[4:0])
              5'h00: out_low = 10'h245;
              5'h01: out_low = 10'h245;
              5'h02: out_low = 10'h245;
              5'h03: out_low = 10'h244;
              5'h04: out_low = 10'h244;
              5'h05: out_low = 10'h244;
              5'h06: out_low = 10'h243;
              5'h07: out_low = 10'h243;
              5'h08: out_low = 10'h243;
              5'h09: out_low = 10'h243;
              5'h0a: out_low = 10'h242;
              5'h0b: out_low = 10'h242;
              5'h0c: out_low = 10'h242;
              5'h0d: out_low = 10'h242;
              5'h0e: out_low = 10'h241;
              5'h0f: out_low = 10'h241;
              5'h10: out_low = 10'h241;
              5'h11: out_low = 10'h240;
              5'h12: out_low = 10'h240;
              5'h13: out_low = 10'h240;
              5'h14: out_low = 10'h240;
              5'h15: out_low = 10'h23f;
              5'h16: out_low = 10'h23f;
              5'h17: out_low = 10'h23f;
              5'h18: out_low = 10'h23f;
              5'h19: out_low = 10'h23e;
              5'h1a: out_low = 10'h23e;
              5'h1b: out_low = 10'h23e;
              5'h1c: out_low = 10'h23e;
              5'h1d: out_low = 10'h23d;
              5'h1e: out_low = 10'h23d;
              5'h1f: out_low = 10'h23d;
              default: out_low = 10'h000;
            endcase
          end
          5'h0e: begin
            case (mant[4:0])
              5'h00: out_low = 10'h23c;
              5'h01: out_low = 10'h23c;
              5'h02: out_low = 10'h23c;
              5'h03: out_low = 10'h23c;
              5'h04: out_low = 10'h23b;
              5'h05: out_low = 10'h23b;
              5'h06: out_low = 10'h23b;
              5'h07: out_low = 10'h23b;
              5'h08: out_low = 10'h23a;
              5'h09: out_low = 10'h23a;
              5'h0a: out_low = 10'h23a;
              5'h0b: out_low = 10'h239;
              5'h0c: out_low = 10'h239;
              5'h0d: out_low = 10'h239;
              5'h0e: out_low = 10'h239;
              5'h0f: out_low = 10'h238;
              5'h10: out_low = 10'h238;
              5'h11: out_low = 10'h238;
              5'h12: out_low = 10'h238;
              5'h13: out_low = 10'h237;
              5'h14: out_low = 10'h237;
              5'h15: out_low = 10'h237;
              5'h16: out_low = 10'h236;
              5'h17: out_low = 10'h236;
              5'h18: out_low = 10'h236;
              5'h19: out_low = 10'h236;
              5'h1a: out_low = 10'h235;
              5'h1b: out_low = 10'h235;
              5'h1c: out_low = 10'h235;
              5'h1d: out_low = 10'h235;
              5'h1e: out_low = 10'h234;
              5'h1f: out_low = 10'h234;
              default: out_low = 10'h000;
            endcase
          end
          5'h0f: begin
            case (mant[4:0])
              5'h00: out_low = 10'h234;
              5'h01: out_low = 10'h234;
              5'h02: out_low = 10'h233;
              5'h03: out_low = 10'h233;
              5'h04: out_low = 10'h233;
              5'h05: out_low = 10'h232;
              5'h06: out_low = 10'h232;
              5'h07: out_low = 10'h232;
              5'h08: out_low = 10'h232;
              5'h09: out_low = 10'h231;
              5'h0a: out_low = 10'h231;
              5'h0b: out_low = 10'h231;
              5'h0c: out_low = 10'h231;
              5'h0d: out_low = 10'h230;
              5'h0e: out_low = 10'h230;
              5'h0f: out_low = 10'h230;
              5'h10: out_low = 10'h230;
              5'h11: out_low = 10'h22f;
              5'h12: out_low = 10'h22f;
              5'h13: out_low = 10'h22f;
              5'h14: out_low = 10'h22e;
              5'h15: out_low = 10'h22e;
              5'h16: out_low = 10'h22e;
              5'h17: out_low = 10'h22e;
              5'h18: out_low = 10'h22d;
              5'h19: out_low = 10'h22d;
              5'h1a: out_low = 10'h22d;
              5'h1b: out_low = 10'h22d;
              5'h1c: out_low = 10'h22c;
              5'h1d: out_low = 10'h22c;
              5'h1e: out_low = 10'h22c;
              5'h1f: out_low = 10'h22b;
              default: out_low = 10'h000;
            endcase
          end
          5'h10: begin
            case (mant[4:0])
              5'h00: out_low = 10'h22b;
              5'h01: out_low = 10'h22b;
              5'h02: out_low = 10'h22b;
              5'h03: out_low = 10'h22a;
              5'h04: out_low = 10'h22a;
              5'h05: out_low = 10'h22a;
              5'h06: out_low = 10'h22a;
              5'h07: out_low = 10'h229;
              5'h08: out_low = 10'h229;
              5'h09: out_low = 10'h229;
              5'h0a: out_low = 10'h229;
              5'h0b: out_low = 10'h228;
              5'h0c: out_low = 10'h228;
              5'h0d: out_low = 10'h228;
              5'h0e: out_low = 10'h227;
              5'h0f: out_low = 10'h227;
              5'h10: out_low = 10'h227;
              5'h11: out_low = 10'h227;
              5'h12: out_low = 10'h226;
              5'h13: out_low = 10'h226;
              5'h14: out_low = 10'h226;
              5'h15: out_low = 10'h226;
              5'h16: out_low = 10'h225;
              5'h17: out_low = 10'h225;
              5'h18: out_low = 10'h225;
              5'h19: out_low = 10'h225;
              5'h1a: out_low = 10'h224;
              5'h1b: out_low = 10'h224;
              5'h1c: out_low = 10'h224;
              5'h1d: out_low = 10'h223;
              5'h1e: out_low = 10'h223;
              5'h1f: out_low = 10'h223;
              default: out_low = 10'h000;
            endcase
          end
          5'h11: begin
            case (mant[4:0])
              5'h00: out_low = 10'h223;
              5'h01: out_low = 10'h222;
              5'h02: out_low = 10'h222;
              5'h03: out_low = 10'h222;
              5'h04: out_low = 10'h222;
              5'h05: out_low = 10'h221;
              5'h06: out_low = 10'h221;
              5'h07: out_low = 10'h221;
              5'h08: out_low = 10'h221;
              5'h09: out_low = 10'h220;
              5'h0a: out_low = 10'h220;
              5'h0b: out_low = 10'h220;
              5'h0c: out_low = 10'h220;
              5'h0d: out_low = 10'h21f;
              5'h0e: out_low = 10'h21f;
              5'h0f: out_low = 10'h21f;
              5'h10: out_low = 10'h21e;
              5'h11: out_low = 10'h21e;
              5'h12: out_low = 10'h21e;
              5'h13: out_low = 10'h21e;
              5'h14: out_low = 10'h21d;
              5'h15: out_low = 10'h21d;
              5'h16: out_low = 10'h21d;
              5'h17: out_low = 10'h21d;
              5'h18: out_low = 10'h21c;
              5'h19: out_low = 10'h21c;
              5'h1a: out_low = 10'h21c;
              5'h1b: out_low = 10'h21c;
              5'h1c: out_low = 10'h21b;
              5'h1d: out_low = 10'h21b;
              5'h1e: out_low = 10'h21b;
              5'h1f: out_low = 10'h21a;
              default: out_low = 10'h000;
            endcase
          end
          5'h12: begin
            case (mant[4:0])
              5'h00: out_low = 10'h21a;
              5'h01: out_low = 10'h21a;
              5'h02: out_low = 10'h21a;
              5'h03: out_low = 10'h219;
              5'h04: out_low = 10'h219;
              5'h05: out_low = 10'h219;
              5'h06: out_low = 10'h219;
              5'h07: out_low = 10'h218;
              5'h08: out_low = 10'h218;
              5'h09: out_low = 10'h218;
              5'h0a: out_low = 10'h218;
              5'h0b: out_low = 10'h217;
              5'h0c: out_low = 10'h217;
              5'h0d: out_low = 10'h217;
              5'h0e: out_low = 10'h217;
              5'h0f: out_low = 10'h216;
              5'h10: out_low = 10'h216;
              5'h11: out_low = 10'h216;
              5'h12: out_low = 10'h215;
              5'h13: out_low = 10'h215;
              5'h14: out_low = 10'h215;
              5'h15: out_low = 10'h215;
              5'h16: out_low = 10'h214;
              5'h17: out_low = 10'h214;
              5'h18: out_low = 10'h214;
              5'h19: out_low = 10'h214;
              5'h1a: out_low = 10'h213;
              5'h1b: out_low = 10'h213;
              5'h1c: out_low = 10'h213;
              5'h1d: out_low = 10'h213;
              5'h1e: out_low = 10'h212;
              5'h1f: out_low = 10'h212;
              default: out_low = 10'h000;
            endcase
          end
          5'h13: begin
            case (mant[4:0])
              5'h00: out_low = 10'h212;
              5'h01: out_low = 10'h212;
              5'h02: out_low = 10'h211;
              5'h03: out_low = 10'h211;
              5'h04: out_low = 10'h211;
              5'h05: out_low = 10'h210;
              5'h06: out_low = 10'h210;
              5'h07: out_low = 10'h210;
              5'h08: out_low = 10'h210;
              5'h09: out_low = 10'h20f;
              5'h0a: out_low = 10'h20f;
              5'h0b: out_low = 10'h20f;
              5'h0c: out_low = 10'h20f;
              5'h0d: out_low = 10'h20e;
              5'h0e: out_low = 10'h20e;
              5'h0f: out_low = 10'h20e;
              5'h10: out_low = 10'h20e;
              5'h11: out_low = 10'h20d;
              5'h12: out_low = 10'h20d;
              5'h13: out_low = 10'h20d;
              5'h14: out_low = 10'h20d;
              5'h15: out_low = 10'h20c;
              5'h16: out_low = 10'h20c;
              5'h17: out_low = 10'h20c;
              5'h18: out_low = 10'h20b;
              5'h19: out_low = 10'h20b;
              5'h1a: out_low = 10'h20b;
              5'h1b: out_low = 10'h20b;
              5'h1c: out_low = 10'h20a;
              5'h1d: out_low = 10'h20a;
              5'h1e: out_low = 10'h20a;
              5'h1f: out_low = 10'h20a;
              default: out_low = 10'h000;
            endcase
          end
          5'h14: begin
            case (mant[4:0])
              5'h00: out_low = 10'h209;
              5'h01: out_low = 10'h209;
              5'h02: out_low = 10'h209;
              5'h03: out_low = 10'h209;
              5'h04: out_low = 10'h208;
              5'h05: out_low = 10'h208;
              5'h06: out_low = 10'h208;
              5'h07: out_low = 10'h208;
              5'h08: out_low = 10'h207;
              5'h09: out_low = 10'h207;
              5'h0a: out_low = 10'h207;
              5'h0b: out_low = 10'h207;
              5'h0c: out_low = 10'h206;
              5'h0d: out_low = 10'h206;
              5'h0e: out_low = 10'h206;
              5'h0f: out_low = 10'h205;
              5'h10: out_low = 10'h205;
              5'h11: out_low = 10'h205;
              5'h12: out_low = 10'h205;
              5'h13: out_low = 10'h204;
              5'h14: out_low = 10'h204;
              5'h15: out_low = 10'h204;
              5'h16: out_low = 10'h204;
              5'h17: out_low = 10'h203;
              5'h18: out_low = 10'h203;
              5'h19: out_low = 10'h203;
              5'h1a: out_low = 10'h203;
              5'h1b: out_low = 10'h202;
              5'h1c: out_low = 10'h202;
              5'h1d: out_low = 10'h202;
              5'h1e: out_low = 10'h202;
              5'h1f: out_low = 10'h201;
              default: out_low = 10'h000;
            endcase
          end
          5'h15: begin
            case (mant[4:0])
              5'h00: out_low = 10'h201;
              5'h01: out_low = 10'h201;
              5'h02: out_low = 10'h201;
              5'h03: out_low = 10'h200;
              5'h04: out_low = 10'h200;
              5'h05: out_low = 10'h200;
              5'h06: out_low = 10'h1ff;
              5'h07: out_low = 10'h1ff;
              5'h08: out_low = 10'h1ff;
              5'h09: out_low = 10'h1ff;
              5'h0a: out_low = 10'h1fe;
              5'h0b: out_low = 10'h1fe;
              5'h0c: out_low = 10'h1fe;
              5'h0d: out_low = 10'h1fe;
              5'h0e: out_low = 10'h1fd;
              5'h0f: out_low = 10'h1fd;
              5'h10: out_low = 10'h1fd;
              5'h11: out_low = 10'h1fd;
              5'h12: out_low = 10'h1fc;
              5'h13: out_low = 10'h1fc;
              5'h14: out_low = 10'h1fc;
              5'h15: out_low = 10'h1fc;
              5'h16: out_low = 10'h1fb;
              5'h17: out_low = 10'h1fb;
              5'h18: out_low = 10'h1fb;
              5'h19: out_low = 10'h1fb;
              5'h1a: out_low = 10'h1fa;
              5'h1b: out_low = 10'h1fa;
              5'h1c: out_low = 10'h1fa;
              5'h1d: out_low = 10'h1fa;
              5'h1e: out_low = 10'h1f9;
              5'h1f: out_low = 10'h1f9;
              default: out_low = 10'h000;
            endcase
          end
          5'h16: begin
            case (mant[4:0])
              5'h00: out_low = 10'h1f9;
              5'h01: out_low = 10'h1f8;
              5'h02: out_low = 10'h1f8;
              5'h03: out_low = 10'h1f8;
              5'h04: out_low = 10'h1f8;
              5'h05: out_low = 10'h1f7;
              5'h06: out_low = 10'h1f7;
              5'h07: out_low = 10'h1f7;
              5'h08: out_low = 10'h1f7;
              5'h09: out_low = 10'h1f6;
              5'h0a: out_low = 10'h1f6;
              5'h0b: out_low = 10'h1f6;
              5'h0c: out_low = 10'h1f6;
              5'h0d: out_low = 10'h1f5;
              5'h0e: out_low = 10'h1f5;
              5'h0f: out_low = 10'h1f5;
              5'h10: out_low = 10'h1f5;
              5'h11: out_low = 10'h1f4;
              5'h12: out_low = 10'h1f4;
              5'h13: out_low = 10'h1f4;
              5'h14: out_low = 10'h1f4;
              5'h15: out_low = 10'h1f3;
              5'h16: out_low = 10'h1f3;
              5'h17: out_low = 10'h1f3;
              5'h18: out_low = 10'h1f3;
              5'h19: out_low = 10'h1f2;
              5'h1a: out_low = 10'h1f2;
              5'h1b: out_low = 10'h1f2;
              5'h1c: out_low = 10'h1f2;
              5'h1d: out_low = 10'h1f1;
              5'h1e: out_low = 10'h1f1;
              5'h1f: out_low = 10'h1f1;
              default: out_low = 10'h000;
            endcase
          end
          5'h17: begin
            case (mant[4:0])
              5'h00: out_low = 10'h1f0;
              5'h01: out_low = 10'h1f0;
              5'h02: out_low = 10'h1f0;
              5'h03: out_low = 10'h1f0;
              5'h04: out_low = 10'h1ef;
              5'h05: out_low = 10'h1ef;
              5'h06: out_low = 10'h1ef;
              5'h07: out_low = 10'h1ef;
              5'h08: out_low = 10'h1ee;
              5'h09: out_low = 10'h1ee;
              5'h0a: out_low = 10'h1ee;
              5'h0b: out_low = 10'h1ee;
              5'h0c: out_low = 10'h1ed;
              5'h0d: out_low = 10'h1ed;
              5'h0e: out_low = 10'h1ed;
              5'h0f: out_low = 10'h1ed;
              5'h10: out_low = 10'h1ec;
              5'h11: out_low = 10'h1ec;
              5'h12: out_low = 10'h1ec;
              5'h13: out_low = 10'h1ec;
              5'h14: out_low = 10'h1eb;
              5'h15: out_low = 10'h1eb;
              5'h16: out_low = 10'h1eb;
              5'h17: out_low = 10'h1eb;
              5'h18: out_low = 10'h1ea;
              5'h19: out_low = 10'h1ea;
              5'h1a: out_low = 10'h1ea;
              5'h1b: out_low = 10'h1ea;
              5'h1c: out_low = 10'h1e9;
              5'h1d: out_low = 10'h1e9;
              5'h1e: out_low = 10'h1e9;
              5'h1f: out_low = 10'h1e9;
              default: out_low = 10'h000;
            endcase
          end
          5'h18: begin
            case (mant[4:0])
              5'h00: out_low = 10'h1e8;
              5'h01: out_low = 10'h1e8;
              5'h02: out_low = 10'h1e8;
              5'h03: out_low = 10'h1e8;
              5'h04: out_low = 10'h1e7;
              5'h05: out_low = 10'h1e7;
              5'h06: out_low = 10'h1e7;
              5'h07: out_low = 10'h1e6;
              5'h08: out_low = 10'h1e6;
              5'h09: out_low = 10'h1e6;
              5'h0a: out_low = 10'h1e6;
              5'h0b: out_low = 10'h1e5;
              5'h0c: out_low = 10'h1e5;
              5'h0d: out_low = 10'h1e5;
              5'h0e: out_low = 10'h1e5;
              5'h0f: out_low = 10'h1e4;
              5'h10: out_low = 10'h1e4;
              5'h11: out_low = 10'h1e4;
              5'h12: out_low = 10'h1e4;
              5'h13: out_low = 10'h1e3;
              5'h14: out_low = 10'h1e3;
              5'h15: out_low = 10'h1e3;
              5'h16: out_low = 10'h1e3;
              5'h17: out_low = 10'h1e2;
              5'h18: out_low = 10'h1e2;
              5'h19: out_low = 10'h1e2;
              5'h1a: out_low = 10'h1e2;
              5'h1b: out_low = 10'h1e1;
              5'h1c: out_low = 10'h1e1;
              5'h1d: out_low = 10'h1e1;
              5'h1e: out_low = 10'h1e1;
              5'h1f: out_low = 10'h1e0;
              default: out_low = 10'h000;
            endcase
          end
          5'h19: begin
            case (mant[4:0])
              5'h00: out_low = 10'h1e0;
              5'h01: out_low = 10'h1e0;
              5'h02: out_low = 10'h1e0;
              5'h03: out_low = 10'h1df;
              5'h04: out_low = 10'h1df;
              5'h05: out_low = 10'h1df;
              5'h06: out_low = 10'h1df;
              5'h07: out_low = 10'h1de;
              5'h08: out_low = 10'h1de;
              5'h09: out_low = 10'h1de;
              5'h0a: out_low = 10'h1de;
              5'h0b: out_low = 10'h1dd;
              5'h0c: out_low = 10'h1dd;
              5'h0d: out_low = 10'h1dd;
              5'h0e: out_low = 10'h1dd;
              5'h0f: out_low = 10'h1dc;
              5'h10: out_low = 10'h1dc;
              5'h11: out_low = 10'h1dc;
              5'h12: out_low = 10'h1dc;
              5'h13: out_low = 10'h1db;
              5'h14: out_low = 10'h1db;
              5'h15: out_low = 10'h1db;
              5'h16: out_low = 10'h1db;
              5'h17: out_low = 10'h1da;
              5'h18: out_low = 10'h1da;
              5'h19: out_low = 10'h1da;
              5'h1a: out_low = 10'h1d9;
              5'h1b: out_low = 10'h1d9;
              5'h1c: out_low = 10'h1d9;
              5'h1d: out_low = 10'h1d9;
              5'h1e: out_low = 10'h1d8;
              5'h1f: out_low = 10'h1d8;
              default: out_low = 10'h000;
            endcase
          end
          5'h1a: begin
            case (mant[4:0])
              5'h00: out_low = 10'h1d8;
              5'h01: out_low = 10'h1d8;
              5'h02: out_low = 10'h1d7;
              5'h03: out_low = 10'h1d7;
              5'h04: out_low = 10'h1d7;
              5'h05: out_low = 10'h1d7;
              5'h06: out_low = 10'h1d6;
              5'h07: out_low = 10'h1d6;
              5'h08: out_low = 10'h1d6;
              5'h09: out_low = 10'h1d6;
              5'h0a: out_low = 10'h1d5;
              5'h0b: out_low = 10'h1d5;
              5'h0c: out_low = 10'h1d5;
              5'h0d: out_low = 10'h1d5;
              5'h0e: out_low = 10'h1d4;
              5'h0f: out_low = 10'h1d4;
              5'h10: out_low = 10'h1d4;
              5'h11: out_low = 10'h1d4;
              5'h12: out_low = 10'h1d3;
              5'h13: out_low = 10'h1d3;
              5'h14: out_low = 10'h1d3;
              5'h15: out_low = 10'h1d3;
              5'h16: out_low = 10'h1d2;
              5'h17: out_low = 10'h1d2;
              5'h18: out_low = 10'h1d2;
              5'h19: out_low = 10'h1d2;
              5'h1a: out_low = 10'h1d1;
              5'h1b: out_low = 10'h1d1;
              5'h1c: out_low = 10'h1d1;
              5'h1d: out_low = 10'h1d1;
              5'h1e: out_low = 10'h1d0;
              5'h1f: out_low = 10'h1d0;
              default: out_low = 10'h000;
            endcase
          end
          5'h1b: begin
            case (mant[4:0])
              5'h00: out_low = 10'h1d0;
              5'h01: out_low = 10'h1d0;
              5'h02: out_low = 10'h1cf;
              5'h03: out_low = 10'h1cf;
              5'h04: out_low = 10'h1cf;
              5'h05: out_low = 10'h1cf;
              5'h06: out_low = 10'h1ce;
              5'h07: out_low = 10'h1ce;
              5'h08: out_low = 10'h1ce;
              5'h09: out_low = 10'h1ce;
              5'h0a: out_low = 10'h1cd;
              5'h0b: out_low = 10'h1cd;
              5'h0c: out_low = 10'h1cd;
              5'h0d: out_low = 10'h1cd;
              5'h0e: out_low = 10'h1cc;
              5'h0f: out_low = 10'h1cc;
              5'h10: out_low = 10'h1cc;
              5'h11: out_low = 10'h1cc;
              5'h12: out_low = 10'h1cb;
              5'h13: out_low = 10'h1cb;
              5'h14: out_low = 10'h1cb;
              5'h15: out_low = 10'h1cb;
              5'h16: out_low = 10'h1ca;
              5'h17: out_low = 10'h1ca;
              5'h18: out_low = 10'h1ca;
              5'h19: out_low = 10'h1ca;
              5'h1a: out_low = 10'h1c9;
              5'h1b: out_low = 10'h1c9;
              5'h1c: out_low = 10'h1c9;
              5'h1d: out_low = 10'h1c9;
              5'h1e: out_low = 10'h1c8;
              5'h1f: out_low = 10'h1c8;
              default: out_low = 10'h000;
            endcase
          end
          5'h1c: begin
            case (mant[4:0])
              5'h00: out_low = 10'h1c8;
              5'h01: out_low = 10'h1c8;
              5'h02: out_low = 10'h1c7;
              5'h03: out_low = 10'h1c7;
              5'h04: out_low = 10'h1c7;
              5'h05: out_low = 10'h1c7;
              5'h06: out_low = 10'h1c6;
              5'h07: out_low = 10'h1c6;
              5'h08: out_low = 10'h1c6;
              5'h09: out_low = 10'h1c6;
              5'h0a: out_low = 10'h1c5;
              5'h0b: out_low = 10'h1c5;
              5'h0c: out_low = 10'h1c5;
              5'h0d: out_low = 10'h1c5;
              5'h0e: out_low = 10'h1c4;
              5'h0f: out_low = 10'h1c4;
              5'h10: out_low = 10'h1c4;
              5'h11: out_low = 10'h1c4;
              5'h12: out_low = 10'h1c3;
              5'h13: out_low = 10'h1c3;
              5'h14: out_low = 10'h1c3;
              5'h15: out_low = 10'h1c3;
              5'h16: out_low = 10'h1c2;
              5'h17: out_low = 10'h1c2;
              5'h18: out_low = 10'h1c2;
              5'h19: out_low = 10'h1c2;
              5'h1a: out_low = 10'h1c1;
              5'h1b: out_low = 10'h1c1;
              5'h1c: out_low = 10'h1c1;
              5'h1d: out_low = 10'h1c1;
              5'h1e: out_low = 10'h1c0;
              5'h1f: out_low = 10'h1c0;
              default: out_low = 10'h000;
            endcase
          end
          5'h1d: begin
            case (mant[4:0])
              5'h00: out_low = 10'h1c0;
              5'h01: out_low = 10'h1c0;
              5'h02: out_low = 10'h1bf;
              5'h03: out_low = 10'h1bf;
              5'h04: out_low = 10'h1bf;
              5'h05: out_low = 10'h1bf;
              5'h06: out_low = 10'h1be;
              5'h07: out_low = 10'h1be;
              5'h08: out_low = 10'h1be;
              5'h09: out_low = 10'h1be;
              5'h0a: out_low = 10'h1bd;
              5'h0b: out_low = 10'h1bd;
              5'h0c: out_low = 10'h1bd;
              5'h0d: out_low = 10'h1bd;
              5'h0e: out_low = 10'h1bc;
              5'h0f: out_low = 10'h1bc;
              5'h10: out_low = 10'h1bc;
              5'h11: out_low = 10'h1bc;
              5'h12: out_low = 10'h1bb;
              5'h13: out_low = 10'h1bb;
              5'h14: out_low = 10'h1bb;
              5'h15: out_low = 10'h1bb;
              5'h16: out_low = 10'h1ba;
              5'h17: out_low = 10'h1ba;
              5'h18: out_low = 10'h1ba;
              5'h19: out_low = 10'h1ba;
              5'h1a: out_low = 10'h1b9;
              5'h1b: out_low = 10'h1b9;
              5'h1c: out_low = 10'h1b9;
              5'h1d: out_low = 10'h1b9;
              5'h1e: out_low = 10'h1b8;
              5'h1f: out_low = 10'h1b8;
              default: out_low = 10'h000;
            endcase
          end
          5'h1e: begin
            case (mant[4:0])
              5'h00: out_low = 10'h1b8;
              5'h01: out_low = 10'h1b8;
              5'h02: out_low = 10'h1b7;
              5'h03: out_low = 10'h1b7;
              5'h04: out_low = 10'h1b7;
              5'h05: out_low = 10'h1b7;
              5'h06: out_low = 10'h1b6;
              5'h07: out_low = 10'h1b6;
              5'h08: out_low = 10'h1b6;
              5'h09: out_low = 10'h1b6;
              5'h0a: out_low = 10'h1b5;
              5'h0b: out_low = 10'h1b5;
              5'h0c: out_low = 10'h1b5;
              5'h0d: out_low = 10'h1b5;
              5'h0e: out_low = 10'h1b4;
              5'h0f: out_low = 10'h1b4;
              5'h10: out_low = 10'h1b4;
              5'h11: out_low = 10'h1b4;
              5'h12: out_low = 10'h1b3;
              5'h13: out_low = 10'h1b3;
              5'h14: out_low = 10'h1b3;
              5'h15: out_low = 10'h1b3;
              5'h16: out_low = 10'h1b2;
              5'h17: out_low = 10'h1b2;
              5'h18: out_low = 10'h1b2;
              5'h19: out_low = 10'h1b2;
              5'h1a: out_low = 10'h1b1;
              5'h1b: out_low = 10'h1b1;
              5'h1c: out_low = 10'h1b1;
              5'h1d: out_low = 10'h1b1;
              5'h1e: out_low = 10'h1b1;
              5'h1f: out_low = 10'h1b0;
              default: out_low = 10'h000;
            endcase
          end
          5'h1f: begin
            case (mant[4:0])
              5'h00: out_low = 10'h1b0;
              5'h01: out_low = 10'h1b0;
              5'h02: out_low = 10'h1b0;
              5'h03: out_low = 10'h1af;
              5'h04: out_low = 10'h1af;
              5'h05: out_low = 10'h1af;
              5'h06: out_low = 10'h1af;
              5'h07: out_low = 10'h1ae;
              5'h08: out_low = 10'h1ae;
              5'h09: out_low = 10'h1ae;
              5'h0a: out_low = 10'h1ae;
              5'h0b: out_low = 10'h1ad;
              5'h0c: out_low = 10'h1ad;
              5'h0d: out_low = 10'h1ad;
              5'h0e: out_low = 10'h1ad;
              5'h0f: out_low = 10'h1ac;
              5'h10: out_low = 10'h1ac;
              5'h11: out_low = 10'h1ac;
              5'h12: out_low = 10'h1ac;
              5'h13: out_low = 10'h1ab;
              5'h14: out_low = 10'h1ab;
              5'h15: out_low = 10'h1ab;
              5'h16: out_low = 10'h1ab;
              5'h17: out_low = 10'h1aa;
              5'h18: out_low = 10'h1aa;
              5'h19: out_low = 10'h1aa;
              5'h1a: out_low = 10'h1aa;
              5'h1b: out_low = 10'h1a9;
              5'h1c: out_low = 10'h1a9;
              5'h1d: out_low = 10'h1a9;
              5'h1e: out_low = 10'h1a9;
              5'h1f: out_low = 10'h1a8;
              default: out_low = 10'h000;
            endcase
          end
          default: out_low = 10'h000;
        endcase
      end
      6'h2e: begin
        case (mant[9:5])
          5'h00: begin
            case (mant[4:0])
              5'h00: out_low = 10'h1a8;
              5'h01: out_low = 10'h1a8;
              5'h02: out_low = 10'h1a7;
              5'h03: out_low = 10'h1a7;
              5'h04: out_low = 10'h1a6;
              5'h05: out_low = 10'h1a6;
              5'h06: out_low = 10'h1a5;
              5'h07: out_low = 10'h1a5;
              5'h08: out_low = 10'h1a4;
              5'h09: out_low = 10'h1a4;
              5'h0a: out_low = 10'h1a3;
              5'h0b: out_low = 10'h1a3;
              5'h0c: out_low = 10'h1a2;
              5'h0d: out_low = 10'h1a2;
              5'h0e: out_low = 10'h1a1;
              5'h0f: out_low = 10'h1a1;
              5'h10: out_low = 10'h1a0;
              5'h11: out_low = 10'h1a0;
              5'h12: out_low = 10'h19f;
              5'h13: out_low = 10'h19f;
              5'h14: out_low = 10'h19e;
              5'h15: out_low = 10'h19e;
              5'h16: out_low = 10'h19d;
              5'h17: out_low = 10'h19d;
              5'h18: out_low = 10'h19c;
              5'h19: out_low = 10'h19c;
              5'h1a: out_low = 10'h19b;
              5'h1b: out_low = 10'h19b;
              5'h1c: out_low = 10'h19a;
              5'h1d: out_low = 10'h19a;
              5'h1e: out_low = 10'h19a;
              5'h1f: out_low = 10'h199;
              default: out_low = 10'h000;
            endcase
          end
          5'h01: begin
            case (mant[4:0])
              5'h00: out_low = 10'h199;
              5'h01: out_low = 10'h198;
              5'h02: out_low = 10'h198;
              5'h03: out_low = 10'h197;
              5'h04: out_low = 10'h197;
              5'h05: out_low = 10'h196;
              5'h06: out_low = 10'h196;
              5'h07: out_low = 10'h195;
              5'h08: out_low = 10'h195;
              5'h09: out_low = 10'h194;
              5'h0a: out_low = 10'h194;
              5'h0b: out_low = 10'h193;
              5'h0c: out_low = 10'h193;
              5'h0d: out_low = 10'h192;
              5'h0e: out_low = 10'h192;
              5'h0f: out_low = 10'h191;
              5'h10: out_low = 10'h191;
              5'h11: out_low = 10'h190;
              5'h12: out_low = 10'h190;
              5'h13: out_low = 10'h18f;
              5'h14: out_low = 10'h18f;
              5'h15: out_low = 10'h18e;
              5'h16: out_low = 10'h18e;
              5'h17: out_low = 10'h18d;
              5'h18: out_low = 10'h18d;
              5'h19: out_low = 10'h18c;
              5'h1a: out_low = 10'h18c;
              5'h1b: out_low = 10'h18c;
              5'h1c: out_low = 10'h18b;
              5'h1d: out_low = 10'h18b;
              5'h1e: out_low = 10'h18a;
              5'h1f: out_low = 10'h18a;
              default: out_low = 10'h000;
            endcase
          end
          5'h02: begin
            case (mant[4:0])
              5'h00: out_low = 10'h189;
              5'h01: out_low = 10'h189;
              5'h02: out_low = 10'h188;
              5'h03: out_low = 10'h188;
              5'h04: out_low = 10'h187;
              5'h05: out_low = 10'h187;
              5'h06: out_low = 10'h186;
              5'h07: out_low = 10'h186;
              5'h08: out_low = 10'h185;
              5'h09: out_low = 10'h185;
              5'h0a: out_low = 10'h184;
              5'h0b: out_low = 10'h184;
              5'h0c: out_low = 10'h183;
              5'h0d: out_low = 10'h183;
              5'h0e: out_low = 10'h182;
              5'h0f: out_low = 10'h182;
              5'h10: out_low = 10'h181;
              5'h11: out_low = 10'h181;
              5'h12: out_low = 10'h181;
              5'h13: out_low = 10'h180;
              5'h14: out_low = 10'h180;
              5'h15: out_low = 10'h17f;
              5'h16: out_low = 10'h17f;
              5'h17: out_low = 10'h17e;
              5'h18: out_low = 10'h17e;
              5'h19: out_low = 10'h17d;
              5'h1a: out_low = 10'h17d;
              5'h1b: out_low = 10'h17c;
              5'h1c: out_low = 10'h17c;
              5'h1d: out_low = 10'h17b;
              5'h1e: out_low = 10'h17b;
              5'h1f: out_low = 10'h17a;
              default: out_low = 10'h000;
            endcase
          end
          5'h03: begin
            case (mant[4:0])
              5'h00: out_low = 10'h17a;
              5'h01: out_low = 10'h179;
              5'h02: out_low = 10'h179;
              5'h03: out_low = 10'h178;
              5'h04: out_low = 10'h178;
              5'h05: out_low = 10'h177;
              5'h06: out_low = 10'h177;
              5'h07: out_low = 10'h177;
              5'h08: out_low = 10'h176;
              5'h09: out_low = 10'h176;
              5'h0a: out_low = 10'h175;
              5'h0b: out_low = 10'h175;
              5'h0c: out_low = 10'h174;
              5'h0d: out_low = 10'h174;
              5'h0e: out_low = 10'h173;
              5'h0f: out_low = 10'h173;
              5'h10: out_low = 10'h172;
              5'h11: out_low = 10'h172;
              5'h12: out_low = 10'h171;
              5'h13: out_low = 10'h171;
              5'h14: out_low = 10'h170;
              5'h15: out_low = 10'h170;
              5'h16: out_low = 10'h16f;
              5'h17: out_low = 10'h16f;
              5'h18: out_low = 10'h16f;
              5'h19: out_low = 10'h16e;
              5'h1a: out_low = 10'h16e;
              5'h1b: out_low = 10'h16d;
              5'h1c: out_low = 10'h16d;
              5'h1d: out_low = 10'h16c;
              5'h1e: out_low = 10'h16c;
              5'h1f: out_low = 10'h16b;
              default: out_low = 10'h000;
            endcase
          end
          5'h04: begin
            case (mant[4:0])
              5'h00: out_low = 10'h16b;
              5'h01: out_low = 10'h16a;
              5'h02: out_low = 10'h16a;
              5'h03: out_low = 10'h169;
              5'h04: out_low = 10'h169;
              5'h05: out_low = 10'h168;
              5'h06: out_low = 10'h168;
              5'h07: out_low = 10'h167;
              5'h08: out_low = 10'h167;
              5'h09: out_low = 10'h167;
              5'h0a: out_low = 10'h166;
              5'h0b: out_low = 10'h166;
              5'h0c: out_low = 10'h165;
              5'h0d: out_low = 10'h165;
              5'h0e: out_low = 10'h164;
              5'h0f: out_low = 10'h164;
              5'h10: out_low = 10'h163;
              5'h11: out_low = 10'h163;
              5'h12: out_low = 10'h162;
              5'h13: out_low = 10'h162;
              5'h14: out_low = 10'h161;
              5'h15: out_low = 10'h161;
              5'h16: out_low = 10'h160;
              5'h17: out_low = 10'h160;
              5'h18: out_low = 10'h160;
              5'h19: out_low = 10'h15f;
              5'h1a: out_low = 10'h15f;
              5'h1b: out_low = 10'h15e;
              5'h1c: out_low = 10'h15e;
              5'h1d: out_low = 10'h15d;
              5'h1e: out_low = 10'h15d;
              5'h1f: out_low = 10'h15c;
              default: out_low = 10'h000;
            endcase
          end
          5'h05: begin
            case (mant[4:0])
              5'h00: out_low = 10'h15c;
              5'h01: out_low = 10'h15b;
              5'h02: out_low = 10'h15b;
              5'h03: out_low = 10'h15a;
              5'h04: out_low = 10'h15a;
              5'h05: out_low = 10'h15a;
              5'h06: out_low = 10'h159;
              5'h07: out_low = 10'h159;
              5'h08: out_low = 10'h158;
              5'h09: out_low = 10'h158;
              5'h0a: out_low = 10'h157;
              5'h0b: out_low = 10'h157;
              5'h0c: out_low = 10'h156;
              5'h0d: out_low = 10'h156;
              5'h0e: out_low = 10'h155;
              5'h0f: out_low = 10'h155;
              5'h10: out_low = 10'h154;
              5'h11: out_low = 10'h154;
              5'h12: out_low = 10'h153;
              5'h13: out_low = 10'h153;
              5'h14: out_low = 10'h153;
              5'h15: out_low = 10'h152;
              5'h16: out_low = 10'h152;
              5'h17: out_low = 10'h151;
              5'h18: out_low = 10'h151;
              5'h19: out_low = 10'h150;
              5'h1a: out_low = 10'h150;
              5'h1b: out_low = 10'h14f;
              5'h1c: out_low = 10'h14f;
              5'h1d: out_low = 10'h14e;
              5'h1e: out_low = 10'h14e;
              5'h1f: out_low = 10'h14e;
              default: out_low = 10'h000;
            endcase
          end
          5'h06: begin
            case (mant[4:0])
              5'h00: out_low = 10'h14d;
              5'h01: out_low = 10'h14d;
              5'h02: out_low = 10'h14c;
              5'h03: out_low = 10'h14c;
              5'h04: out_low = 10'h14b;
              5'h05: out_low = 10'h14b;
              5'h06: out_low = 10'h14a;
              5'h07: out_low = 10'h14a;
              5'h08: out_low = 10'h149;
              5'h09: out_low = 10'h149;
              5'h0a: out_low = 10'h148;
              5'h0b: out_low = 10'h148;
              5'h0c: out_low = 10'h148;
              5'h0d: out_low = 10'h147;
              5'h0e: out_low = 10'h147;
              5'h0f: out_low = 10'h146;
              5'h10: out_low = 10'h146;
              5'h11: out_low = 10'h145;
              5'h12: out_low = 10'h145;
              5'h13: out_low = 10'h144;
              5'h14: out_low = 10'h144;
              5'h15: out_low = 10'h143;
              5'h16: out_low = 10'h143;
              5'h17: out_low = 10'h143;
              5'h18: out_low = 10'h142;
              5'h19: out_low = 10'h142;
              5'h1a: out_low = 10'h141;
              5'h1b: out_low = 10'h141;
              5'h1c: out_low = 10'h140;
              5'h1d: out_low = 10'h140;
              5'h1e: out_low = 10'h13f;
              5'h1f: out_low = 10'h13f;
              default: out_low = 10'h000;
            endcase
          end
          5'h07: begin
            case (mant[4:0])
              5'h00: out_low = 10'h13e;
              5'h01: out_low = 10'h13e;
              5'h02: out_low = 10'h13e;
              5'h03: out_low = 10'h13d;
              5'h04: out_low = 10'h13d;
              5'h05: out_low = 10'h13c;
              5'h06: out_low = 10'h13c;
              5'h07: out_low = 10'h13b;
              5'h08: out_low = 10'h13b;
              5'h09: out_low = 10'h13a;
              5'h0a: out_low = 10'h13a;
              5'h0b: out_low = 10'h139;
              5'h0c: out_low = 10'h139;
              5'h0d: out_low = 10'h139;
              5'h0e: out_low = 10'h138;
              5'h0f: out_low = 10'h138;
              5'h10: out_low = 10'h137;
              5'h11: out_low = 10'h137;
              5'h12: out_low = 10'h136;
              5'h13: out_low = 10'h136;
              5'h14: out_low = 10'h135;
              5'h15: out_low = 10'h135;
              5'h16: out_low = 10'h134;
              5'h17: out_low = 10'h134;
              5'h18: out_low = 10'h134;
              5'h19: out_low = 10'h133;
              5'h1a: out_low = 10'h133;
              5'h1b: out_low = 10'h132;
              5'h1c: out_low = 10'h132;
              5'h1d: out_low = 10'h131;
              5'h1e: out_low = 10'h131;
              5'h1f: out_low = 10'h130;
              default: out_low = 10'h000;
            endcase
          end
          5'h08: begin
            case (mant[4:0])
              5'h00: out_low = 10'h130;
              5'h01: out_low = 10'h130;
              5'h02: out_low = 10'h12f;
              5'h03: out_low = 10'h12f;
              5'h04: out_low = 10'h12e;
              5'h05: out_low = 10'h12e;
              5'h06: out_low = 10'h12d;
              5'h07: out_low = 10'h12d;
              5'h08: out_low = 10'h12c;
              5'h09: out_low = 10'h12c;
              5'h0a: out_low = 10'h12b;
              5'h0b: out_low = 10'h12b;
              5'h0c: out_low = 10'h12b;
              5'h0d: out_low = 10'h12a;
              5'h0e: out_low = 10'h12a;
              5'h0f: out_low = 10'h129;
              5'h10: out_low = 10'h129;
              5'h11: out_low = 10'h128;
              5'h12: out_low = 10'h128;
              5'h13: out_low = 10'h127;
              5'h14: out_low = 10'h127;
              5'h15: out_low = 10'h127;
              5'h16: out_low = 10'h126;
              5'h17: out_low = 10'h126;
              5'h18: out_low = 10'h125;
              5'h19: out_low = 10'h125;
              5'h1a: out_low = 10'h124;
              5'h1b: out_low = 10'h124;
              5'h1c: out_low = 10'h123;
              5'h1d: out_low = 10'h123;
              5'h1e: out_low = 10'h123;
              5'h1f: out_low = 10'h122;
              default: out_low = 10'h000;
            endcase
          end
          5'h09: begin
            case (mant[4:0])
              5'h00: out_low = 10'h122;
              5'h01: out_low = 10'h121;
              5'h02: out_low = 10'h121;
              5'h03: out_low = 10'h120;
              5'h04: out_low = 10'h120;
              5'h05: out_low = 10'h11f;
              5'h06: out_low = 10'h11f;
              5'h07: out_low = 10'h11f;
              5'h08: out_low = 10'h11e;
              5'h09: out_low = 10'h11e;
              5'h0a: out_low = 10'h11d;
              5'h0b: out_low = 10'h11d;
              5'h0c: out_low = 10'h11c;
              5'h0d: out_low = 10'h11c;
              5'h0e: out_low = 10'h11b;
              5'h0f: out_low = 10'h11b;
              5'h10: out_low = 10'h11b;
              5'h11: out_low = 10'h11a;
              5'h12: out_low = 10'h11a;
              5'h13: out_low = 10'h119;
              5'h14: out_low = 10'h119;
              5'h15: out_low = 10'h118;
              5'h16: out_low = 10'h118;
              5'h17: out_low = 10'h117;
              5'h18: out_low = 10'h117;
              5'h19: out_low = 10'h117;
              5'h1a: out_low = 10'h116;
              5'h1b: out_low = 10'h116;
              5'h1c: out_low = 10'h115;
              5'h1d: out_low = 10'h115;
              5'h1e: out_low = 10'h114;
              5'h1f: out_low = 10'h114;
              default: out_low = 10'h000;
            endcase
          end
          5'h0a: begin
            case (mant[4:0])
              5'h00: out_low = 10'h114;
              5'h01: out_low = 10'h113;
              5'h02: out_low = 10'h113;
              5'h03: out_low = 10'h112;
              5'h04: out_low = 10'h112;
              5'h05: out_low = 10'h111;
              5'h06: out_low = 10'h111;
              5'h07: out_low = 10'h110;
              5'h08: out_low = 10'h110;
              5'h09: out_low = 10'h110;
              5'h0a: out_low = 10'h10f;
              5'h0b: out_low = 10'h10f;
              5'h0c: out_low = 10'h10e;
              5'h0d: out_low = 10'h10e;
              5'h0e: out_low = 10'h10d;
              5'h0f: out_low = 10'h10d;
              5'h10: out_low = 10'h10c;
              5'h11: out_low = 10'h10c;
              5'h12: out_low = 10'h10c;
              5'h13: out_low = 10'h10b;
              5'h14: out_low = 10'h10b;
              5'h15: out_low = 10'h10a;
              5'h16: out_low = 10'h10a;
              5'h17: out_low = 10'h109;
              5'h18: out_low = 10'h109;
              5'h19: out_low = 10'h109;
              5'h1a: out_low = 10'h108;
              5'h1b: out_low = 10'h108;
              5'h1c: out_low = 10'h107;
              5'h1d: out_low = 10'h107;
              5'h1e: out_low = 10'h106;
              5'h1f: out_low = 10'h106;
              default: out_low = 10'h000;
            endcase
          end
          5'h0b: begin
            case (mant[4:0])
              5'h00: out_low = 10'h106;
              5'h01: out_low = 10'h105;
              5'h02: out_low = 10'h105;
              5'h03: out_low = 10'h104;
              5'h04: out_low = 10'h104;
              5'h05: out_low = 10'h103;
              5'h06: out_low = 10'h103;
              5'h07: out_low = 10'h102;
              5'h08: out_low = 10'h102;
              5'h09: out_low = 10'h102;
              5'h0a: out_low = 10'h101;
              5'h0b: out_low = 10'h101;
              5'h0c: out_low = 10'h100;
              5'h0d: out_low = 10'h100;
              5'h0e: out_low = 10'h0ff;
              5'h0f: out_low = 10'h0ff;
              5'h10: out_low = 10'h0ff;
              5'h11: out_low = 10'h0fe;
              5'h12: out_low = 10'h0fe;
              5'h13: out_low = 10'h0fd;
              5'h14: out_low = 10'h0fd;
              5'h15: out_low = 10'h0fc;
              5'h16: out_low = 10'h0fc;
              5'h17: out_low = 10'h0fc;
              5'h18: out_low = 10'h0fb;
              5'h19: out_low = 10'h0fb;
              5'h1a: out_low = 10'h0fa;
              5'h1b: out_low = 10'h0fa;
              5'h1c: out_low = 10'h0f9;
              5'h1d: out_low = 10'h0f9;
              5'h1e: out_low = 10'h0f9;
              5'h1f: out_low = 10'h0f8;
              default: out_low = 10'h000;
            endcase
          end
          5'h0c: begin
            case (mant[4:0])
              5'h00: out_low = 10'h0f8;
              5'h01: out_low = 10'h0f7;
              5'h02: out_low = 10'h0f7;
              5'h03: out_low = 10'h0f6;
              5'h04: out_low = 10'h0f6;
              5'h05: out_low = 10'h0f6;
              5'h06: out_low = 10'h0f5;
              5'h07: out_low = 10'h0f5;
              5'h08: out_low = 10'h0f4;
              5'h09: out_low = 10'h0f4;
              5'h0a: out_low = 10'h0f3;
              5'h0b: out_low = 10'h0f3;
              5'h0c: out_low = 10'h0f3;
              5'h0d: out_low = 10'h0f2;
              5'h0e: out_low = 10'h0f2;
              5'h0f: out_low = 10'h0f1;
              5'h10: out_low = 10'h0f1;
              5'h11: out_low = 10'h0f0;
              5'h12: out_low = 10'h0f0;
              5'h13: out_low = 10'h0f0;
              5'h14: out_low = 10'h0ef;
              5'h15: out_low = 10'h0ef;
              5'h16: out_low = 10'h0ee;
              5'h17: out_low = 10'h0ee;
              5'h18: out_low = 10'h0ed;
              5'h19: out_low = 10'h0ed;
              5'h1a: out_low = 10'h0ed;
              5'h1b: out_low = 10'h0ec;
              5'h1c: out_low = 10'h0ec;
              5'h1d: out_low = 10'h0eb;
              5'h1e: out_low = 10'h0eb;
              5'h1f: out_low = 10'h0ea;
              default: out_low = 10'h000;
            endcase
          end
          5'h0d: begin
            case (mant[4:0])
              5'h00: out_low = 10'h0ea;
              5'h01: out_low = 10'h0ea;
              5'h02: out_low = 10'h0e9;
              5'h03: out_low = 10'h0e9;
              5'h04: out_low = 10'h0e8;
              5'h05: out_low = 10'h0e8;
              5'h06: out_low = 10'h0e7;
              5'h07: out_low = 10'h0e7;
              5'h08: out_low = 10'h0e7;
              5'h09: out_low = 10'h0e6;
              5'h0a: out_low = 10'h0e6;
              5'h0b: out_low = 10'h0e5;
              5'h0c: out_low = 10'h0e5;
              5'h0d: out_low = 10'h0e4;
              5'h0e: out_low = 10'h0e4;
              5'h0f: out_low = 10'h0e4;
              5'h10: out_low = 10'h0e3;
              5'h11: out_low = 10'h0e3;
              5'h12: out_low = 10'h0e2;
              5'h13: out_low = 10'h0e2;
              5'h14: out_low = 10'h0e1;
              5'h15: out_low = 10'h0e1;
              5'h16: out_low = 10'h0e1;
              5'h17: out_low = 10'h0e0;
              5'h18: out_low = 10'h0e0;
              5'h19: out_low = 10'h0df;
              5'h1a: out_low = 10'h0df;
              5'h1b: out_low = 10'h0df;
              5'h1c: out_low = 10'h0de;
              5'h1d: out_low = 10'h0de;
              5'h1e: out_low = 10'h0dd;
              5'h1f: out_low = 10'h0dd;
              default: out_low = 10'h000;
            endcase
          end
          5'h0e: begin
            case (mant[4:0])
              5'h00: out_low = 10'h0dc;
              5'h01: out_low = 10'h0dc;
              5'h02: out_low = 10'h0dc;
              5'h03: out_low = 10'h0db;
              5'h04: out_low = 10'h0db;
              5'h05: out_low = 10'h0da;
              5'h06: out_low = 10'h0da;
              5'h07: out_low = 10'h0d9;
              5'h08: out_low = 10'h0d9;
              5'h09: out_low = 10'h0d9;
              5'h0a: out_low = 10'h0d8;
              5'h0b: out_low = 10'h0d8;
              5'h0c: out_low = 10'h0d7;
              5'h0d: out_low = 10'h0d7;
              5'h0e: out_low = 10'h0d7;
              5'h0f: out_low = 10'h0d6;
              5'h10: out_low = 10'h0d6;
              5'h11: out_low = 10'h0d5;
              5'h12: out_low = 10'h0d5;
              5'h13: out_low = 10'h0d4;
              5'h14: out_low = 10'h0d4;
              5'h15: out_low = 10'h0d4;
              5'h16: out_low = 10'h0d3;
              5'h17: out_low = 10'h0d3;
              5'h18: out_low = 10'h0d2;
              5'h19: out_low = 10'h0d2;
              5'h1a: out_low = 10'h0d2;
              5'h1b: out_low = 10'h0d1;
              5'h1c: out_low = 10'h0d1;
              5'h1d: out_low = 10'h0d0;
              5'h1e: out_low = 10'h0d0;
              5'h1f: out_low = 10'h0cf;
              default: out_low = 10'h000;
            endcase
          end
          5'h0f: begin
            case (mant[4:0])
              5'h00: out_low = 10'h0cf;
              5'h01: out_low = 10'h0cf;
              5'h02: out_low = 10'h0ce;
              5'h03: out_low = 10'h0ce;
              5'h04: out_low = 10'h0cd;
              5'h05: out_low = 10'h0cd;
              5'h06: out_low = 10'h0cd;
              5'h07: out_low = 10'h0cc;
              5'h08: out_low = 10'h0cc;
              5'h09: out_low = 10'h0cb;
              5'h0a: out_low = 10'h0cb;
              5'h0b: out_low = 10'h0ca;
              5'h0c: out_low = 10'h0ca;
              5'h0d: out_low = 10'h0ca;
              5'h0e: out_low = 10'h0c9;
              5'h0f: out_low = 10'h0c9;
              5'h10: out_low = 10'h0c8;
              5'h11: out_low = 10'h0c8;
              5'h12: out_low = 10'h0c8;
              5'h13: out_low = 10'h0c7;
              5'h14: out_low = 10'h0c7;
              5'h15: out_low = 10'h0c6;
              5'h16: out_low = 10'h0c6;
              5'h17: out_low = 10'h0c5;
              5'h18: out_low = 10'h0c5;
              5'h19: out_low = 10'h0c5;
              5'h1a: out_low = 10'h0c4;
              5'h1b: out_low = 10'h0c4;
              5'h1c: out_low = 10'h0c3;
              5'h1d: out_low = 10'h0c3;
              5'h1e: out_low = 10'h0c3;
              5'h1f: out_low = 10'h0c2;
              default: out_low = 10'h000;
            endcase
          end
          5'h10: begin
            case (mant[4:0])
              5'h00: out_low = 10'h0c2;
              5'h01: out_low = 10'h0c1;
              5'h02: out_low = 10'h0c1;
              5'h03: out_low = 10'h0c1;
              5'h04: out_low = 10'h0c0;
              5'h05: out_low = 10'h0c0;
              5'h06: out_low = 10'h0bf;
              5'h07: out_low = 10'h0bf;
              5'h08: out_low = 10'h0be;
              5'h09: out_low = 10'h0be;
              5'h0a: out_low = 10'h0be;
              5'h0b: out_low = 10'h0bd;
              5'h0c: out_low = 10'h0bd;
              5'h0d: out_low = 10'h0bc;
              5'h0e: out_low = 10'h0bc;
              5'h0f: out_low = 10'h0bc;
              5'h10: out_low = 10'h0bb;
              5'h11: out_low = 10'h0bb;
              5'h12: out_low = 10'h0ba;
              5'h13: out_low = 10'h0ba;
              5'h14: out_low = 10'h0ba;
              5'h15: out_low = 10'h0b9;
              5'h16: out_low = 10'h0b9;
              5'h17: out_low = 10'h0b8;
              5'h18: out_low = 10'h0b8;
              5'h19: out_low = 10'h0b7;
              5'h1a: out_low = 10'h0b7;
              5'h1b: out_low = 10'h0b7;
              5'h1c: out_low = 10'h0b6;
              5'h1d: out_low = 10'h0b6;
              5'h1e: out_low = 10'h0b5;
              5'h1f: out_low = 10'h0b5;
              default: out_low = 10'h000;
            endcase
          end
          5'h11: begin
            case (mant[4:0])
              5'h00: out_low = 10'h0b5;
              5'h01: out_low = 10'h0b4;
              5'h02: out_low = 10'h0b4;
              5'h03: out_low = 10'h0b3;
              5'h04: out_low = 10'h0b3;
              5'h05: out_low = 10'h0b3;
              5'h06: out_low = 10'h0b2;
              5'h07: out_low = 10'h0b2;
              5'h08: out_low = 10'h0b1;
              5'h09: out_low = 10'h0b1;
              5'h0a: out_low = 10'h0b1;
              5'h0b: out_low = 10'h0b0;
              5'h0c: out_low = 10'h0b0;
              5'h0d: out_low = 10'h0af;
              5'h0e: out_low = 10'h0af;
              5'h0f: out_low = 10'h0af;
              5'h10: out_low = 10'h0ae;
              5'h11: out_low = 10'h0ae;
              5'h12: out_low = 10'h0ad;
              5'h13: out_low = 10'h0ad;
              5'h14: out_low = 10'h0ad;
              5'h15: out_low = 10'h0ac;
              5'h16: out_low = 10'h0ac;
              5'h17: out_low = 10'h0ab;
              5'h18: out_low = 10'h0ab;
              5'h19: out_low = 10'h0aa;
              5'h1a: out_low = 10'h0aa;
              5'h1b: out_low = 10'h0aa;
              5'h1c: out_low = 10'h0a9;
              5'h1d: out_low = 10'h0a9;
              5'h1e: out_low = 10'h0a8;
              5'h1f: out_low = 10'h0a8;
              default: out_low = 10'h000;
            endcase
          end
          5'h12: begin
            case (mant[4:0])
              5'h00: out_low = 10'h0a8;
              5'h01: out_low = 10'h0a7;
              5'h02: out_low = 10'h0a7;
              5'h03: out_low = 10'h0a6;
              5'h04: out_low = 10'h0a6;
              5'h05: out_low = 10'h0a6;
              5'h06: out_low = 10'h0a5;
              5'h07: out_low = 10'h0a5;
              5'h08: out_low = 10'h0a4;
              5'h09: out_low = 10'h0a4;
              5'h0a: out_low = 10'h0a4;
              5'h0b: out_low = 10'h0a3;
              5'h0c: out_low = 10'h0a3;
              5'h0d: out_low = 10'h0a2;
              5'h0e: out_low = 10'h0a2;
              5'h0f: out_low = 10'h0a2;
              5'h10: out_low = 10'h0a1;
              5'h11: out_low = 10'h0a1;
              5'h12: out_low = 10'h0a0;
              5'h13: out_low = 10'h0a0;
              5'h14: out_low = 10'h0a0;
              5'h15: out_low = 10'h09f;
              5'h16: out_low = 10'h09f;
              5'h17: out_low = 10'h09e;
              5'h18: out_low = 10'h09e;
              5'h19: out_low = 10'h09e;
              5'h1a: out_low = 10'h09d;
              5'h1b: out_low = 10'h09d;
              5'h1c: out_low = 10'h09c;
              5'h1d: out_low = 10'h09c;
              5'h1e: out_low = 10'h09c;
              5'h1f: out_low = 10'h09b;
              default: out_low = 10'h000;
            endcase
          end
          5'h13: begin
            case (mant[4:0])
              5'h00: out_low = 10'h09b;
              5'h01: out_low = 10'h09a;
              5'h02: out_low = 10'h09a;
              5'h03: out_low = 10'h09a;
              5'h04: out_low = 10'h099;
              5'h05: out_low = 10'h099;
              5'h06: out_low = 10'h098;
              5'h07: out_low = 10'h098;
              5'h08: out_low = 10'h098;
              5'h09: out_low = 10'h097;
              5'h0a: out_low = 10'h097;
              5'h0b: out_low = 10'h096;
              5'h0c: out_low = 10'h096;
              5'h0d: out_low = 10'h096;
              5'h0e: out_low = 10'h095;
              5'h0f: out_low = 10'h095;
              5'h10: out_low = 10'h094;
              5'h11: out_low = 10'h094;
              5'h12: out_low = 10'h094;
              5'h13: out_low = 10'h093;
              5'h14: out_low = 10'h093;
              5'h15: out_low = 10'h092;
              5'h16: out_low = 10'h092;
              5'h17: out_low = 10'h092;
              5'h18: out_low = 10'h091;
              5'h19: out_low = 10'h091;
              5'h1a: out_low = 10'h090;
              5'h1b: out_low = 10'h090;
              5'h1c: out_low = 10'h090;
              5'h1d: out_low = 10'h08f;
              5'h1e: out_low = 10'h08f;
              5'h1f: out_low = 10'h08f;
              default: out_low = 10'h000;
            endcase
          end
          5'h14: begin
            case (mant[4:0])
              5'h00: out_low = 10'h08e;
              5'h01: out_low = 10'h08e;
              5'h02: out_low = 10'h08d;
              5'h03: out_low = 10'h08d;
              5'h04: out_low = 10'h08d;
              5'h05: out_low = 10'h08c;
              5'h06: out_low = 10'h08c;
              5'h07: out_low = 10'h08b;
              5'h08: out_low = 10'h08b;
              5'h09: out_low = 10'h08b;
              5'h0a: out_low = 10'h08a;
              5'h0b: out_low = 10'h08a;
              5'h0c: out_low = 10'h089;
              5'h0d: out_low = 10'h089;
              5'h0e: out_low = 10'h089;
              5'h0f: out_low = 10'h088;
              5'h10: out_low = 10'h088;
              5'h11: out_low = 10'h087;
              5'h12: out_low = 10'h087;
              5'h13: out_low = 10'h087;
              5'h14: out_low = 10'h086;
              5'h15: out_low = 10'h086;
              5'h16: out_low = 10'h085;
              5'h17: out_low = 10'h085;
              5'h18: out_low = 10'h085;
              5'h19: out_low = 10'h084;
              5'h1a: out_low = 10'h084;
              5'h1b: out_low = 10'h084;
              5'h1c: out_low = 10'h083;
              5'h1d: out_low = 10'h083;
              5'h1e: out_low = 10'h082;
              5'h1f: out_low = 10'h082;
              default: out_low = 10'h000;
            endcase
          end
          5'h15: begin
            case (mant[4:0])
              5'h00: out_low = 10'h082;
              5'h01: out_low = 10'h081;
              5'h02: out_low = 10'h081;
              5'h03: out_low = 10'h080;
              5'h04: out_low = 10'h080;
              5'h05: out_low = 10'h080;
              5'h06: out_low = 10'h07f;
              5'h07: out_low = 10'h07f;
              5'h08: out_low = 10'h07e;
              5'h09: out_low = 10'h07e;
              5'h0a: out_low = 10'h07e;
              5'h0b: out_low = 10'h07d;
              5'h0c: out_low = 10'h07d;
              5'h0d: out_low = 10'h07c;
              5'h0e: out_low = 10'h07c;
              5'h0f: out_low = 10'h07c;
              5'h10: out_low = 10'h07b;
              5'h11: out_low = 10'h07b;
              5'h12: out_low = 10'h07b;
              5'h13: out_low = 10'h07a;
              5'h14: out_low = 10'h07a;
              5'h15: out_low = 10'h079;
              5'h16: out_low = 10'h079;
              5'h17: out_low = 10'h079;
              5'h18: out_low = 10'h078;
              5'h19: out_low = 10'h078;
              5'h1a: out_low = 10'h077;
              5'h1b: out_low = 10'h077;
              5'h1c: out_low = 10'h077;
              5'h1d: out_low = 10'h076;
              5'h1e: out_low = 10'h076;
              5'h1f: out_low = 10'h076;
              default: out_low = 10'h000;
            endcase
          end
          5'h16: begin
            case (mant[4:0])
              5'h00: out_low = 10'h075;
              5'h01: out_low = 10'h075;
              5'h02: out_low = 10'h074;
              5'h03: out_low = 10'h074;
              5'h04: out_low = 10'h074;
              5'h05: out_low = 10'h073;
              5'h06: out_low = 10'h073;
              5'h07: out_low = 10'h072;
              5'h08: out_low = 10'h072;
              5'h09: out_low = 10'h072;
              5'h0a: out_low = 10'h071;
              5'h0b: out_low = 10'h071;
              5'h0c: out_low = 10'h071;
              5'h0d: out_low = 10'h070;
              5'h0e: out_low = 10'h070;
              5'h0f: out_low = 10'h06f;
              5'h10: out_low = 10'h06f;
              5'h11: out_low = 10'h06f;
              5'h12: out_low = 10'h06e;
              5'h13: out_low = 10'h06e;
              5'h14: out_low = 10'h06d;
              5'h15: out_low = 10'h06d;
              5'h16: out_low = 10'h06d;
              5'h17: out_low = 10'h06c;
              5'h18: out_low = 10'h06c;
              5'h19: out_low = 10'h06c;
              5'h1a: out_low = 10'h06b;
              5'h1b: out_low = 10'h06b;
              5'h1c: out_low = 10'h06a;
              5'h1d: out_low = 10'h06a;
              5'h1e: out_low = 10'h06a;
              5'h1f: out_low = 10'h069;
              default: out_low = 10'h000;
            endcase
          end
          5'h17: begin
            case (mant[4:0])
              5'h00: out_low = 10'h069;
              5'h01: out_low = 10'h068;
              5'h02: out_low = 10'h068;
              5'h03: out_low = 10'h068;
              5'h04: out_low = 10'h067;
              5'h05: out_low = 10'h067;
              5'h06: out_low = 10'h067;
              5'h07: out_low = 10'h066;
              5'h08: out_low = 10'h066;
              5'h09: out_low = 10'h065;
              5'h0a: out_low = 10'h065;
              5'h0b: out_low = 10'h065;
              5'h0c: out_low = 10'h064;
              5'h0d: out_low = 10'h064;
              5'h0e: out_low = 10'h064;
              5'h0f: out_low = 10'h063;
              5'h10: out_low = 10'h063;
              5'h11: out_low = 10'h062;
              5'h12: out_low = 10'h062;
              5'h13: out_low = 10'h062;
              5'h14: out_low = 10'h061;
              5'h15: out_low = 10'h061;
              5'h16: out_low = 10'h060;
              5'h17: out_low = 10'h060;
              5'h18: out_low = 10'h060;
              5'h19: out_low = 10'h05f;
              5'h1a: out_low = 10'h05f;
              5'h1b: out_low = 10'h05f;
              5'h1c: out_low = 10'h05e;
              5'h1d: out_low = 10'h05e;
              5'h1e: out_low = 10'h05d;
              5'h1f: out_low = 10'h05d;
              default: out_low = 10'h000;
            endcase
          end
          5'h18: begin
            case (mant[4:0])
              5'h00: out_low = 10'h05d;
              5'h01: out_low = 10'h05c;
              5'h02: out_low = 10'h05c;
              5'h03: out_low = 10'h05c;
              5'h04: out_low = 10'h05b;
              5'h05: out_low = 10'h05b;
              5'h06: out_low = 10'h05a;
              5'h07: out_low = 10'h05a;
              5'h08: out_low = 10'h05a;
              5'h09: out_low = 10'h059;
              5'h0a: out_low = 10'h059;
              5'h0b: out_low = 10'h059;
              5'h0c: out_low = 10'h058;
              5'h0d: out_low = 10'h058;
              5'h0e: out_low = 10'h057;
              5'h0f: out_low = 10'h057;
              5'h10: out_low = 10'h057;
              5'h11: out_low = 10'h056;
              5'h12: out_low = 10'h056;
              5'h13: out_low = 10'h056;
              5'h14: out_low = 10'h055;
              5'h15: out_low = 10'h055;
              5'h16: out_low = 10'h054;
              5'h17: out_low = 10'h054;
              5'h18: out_low = 10'h054;
              5'h19: out_low = 10'h053;
              5'h1a: out_low = 10'h053;
              5'h1b: out_low = 10'h053;
              5'h1c: out_low = 10'h052;
              5'h1d: out_low = 10'h052;
              5'h1e: out_low = 10'h051;
              5'h1f: out_low = 10'h051;
              default: out_low = 10'h000;
            endcase
          end
          5'h19: begin
            case (mant[4:0])
              5'h00: out_low = 10'h051;
              5'h01: out_low = 10'h050;
              5'h02: out_low = 10'h050;
              5'h03: out_low = 10'h050;
              5'h04: out_low = 10'h04f;
              5'h05: out_low = 10'h04f;
              5'h06: out_low = 10'h04e;
              5'h07: out_low = 10'h04e;
              5'h08: out_low = 10'h04e;
              5'h09: out_low = 10'h04d;
              5'h0a: out_low = 10'h04d;
              5'h0b: out_low = 10'h04d;
              5'h0c: out_low = 10'h04c;
              5'h0d: out_low = 10'h04c;
              5'h0e: out_low = 10'h04b;
              5'h0f: out_low = 10'h04b;
              5'h10: out_low = 10'h04b;
              5'h11: out_low = 10'h04a;
              5'h12: out_low = 10'h04a;
              5'h13: out_low = 10'h04a;
              5'h14: out_low = 10'h049;
              5'h15: out_low = 10'h049;
              5'h16: out_low = 10'h048;
              5'h17: out_low = 10'h048;
              5'h18: out_low = 10'h048;
              5'h19: out_low = 10'h047;
              5'h1a: out_low = 10'h047;
              5'h1b: out_low = 10'h047;
              5'h1c: out_low = 10'h046;
              5'h1d: out_low = 10'h046;
              5'h1e: out_low = 10'h045;
              5'h1f: out_low = 10'h045;
              default: out_low = 10'h000;
            endcase
          end
          5'h1a: begin
            case (mant[4:0])
              5'h00: out_low = 10'h045;
              5'h01: out_low = 10'h044;
              5'h02: out_low = 10'h044;
              5'h03: out_low = 10'h044;
              5'h04: out_low = 10'h043;
              5'h05: out_low = 10'h043;
              5'h06: out_low = 10'h043;
              5'h07: out_low = 10'h042;
              5'h08: out_low = 10'h042;
              5'h09: out_low = 10'h041;
              5'h0a: out_low = 10'h041;
              5'h0b: out_low = 10'h041;
              5'h0c: out_low = 10'h040;
              5'h0d: out_low = 10'h040;
              5'h0e: out_low = 10'h040;
              5'h0f: out_low = 10'h03f;
              5'h10: out_low = 10'h03f;
              5'h11: out_low = 10'h03e;
              5'h12: out_low = 10'h03e;
              5'h13: out_low = 10'h03e;
              5'h14: out_low = 10'h03d;
              5'h15: out_low = 10'h03d;
              5'h16: out_low = 10'h03d;
              5'h17: out_low = 10'h03c;
              5'h18: out_low = 10'h03c;
              5'h19: out_low = 10'h03c;
              5'h1a: out_low = 10'h03b;
              5'h1b: out_low = 10'h03b;
              5'h1c: out_low = 10'h03a;
              5'h1d: out_low = 10'h03a;
              5'h1e: out_low = 10'h03a;
              5'h1f: out_low = 10'h039;
              default: out_low = 10'h000;
            endcase
          end
          5'h1b: begin
            case (mant[4:0])
              5'h00: out_low = 10'h039;
              5'h01: out_low = 10'h039;
              5'h02: out_low = 10'h038;
              5'h03: out_low = 10'h038;
              5'h04: out_low = 10'h038;
              5'h05: out_low = 10'h037;
              5'h06: out_low = 10'h037;
              5'h07: out_low = 10'h036;
              5'h08: out_low = 10'h036;
              5'h09: out_low = 10'h036;
              5'h0a: out_low = 10'h035;
              5'h0b: out_low = 10'h035;
              5'h0c: out_low = 10'h035;
              5'h0d: out_low = 10'h034;
              5'h0e: out_low = 10'h034;
              5'h0f: out_low = 10'h034;
              5'h10: out_low = 10'h033;
              5'h11: out_low = 10'h033;
              5'h12: out_low = 10'h032;
              5'h13: out_low = 10'h032;
              5'h14: out_low = 10'h032;
              5'h15: out_low = 10'h031;
              5'h16: out_low = 10'h031;
              5'h17: out_low = 10'h031;
              5'h18: out_low = 10'h030;
              5'h19: out_low = 10'h030;
              5'h1a: out_low = 10'h030;
              5'h1b: out_low = 10'h02f;
              5'h1c: out_low = 10'h02f;
              5'h1d: out_low = 10'h02e;
              5'h1e: out_low = 10'h02e;
              5'h1f: out_low = 10'h02e;
              default: out_low = 10'h000;
            endcase
          end
          5'h1c: begin
            case (mant[4:0])
              5'h00: out_low = 10'h02d;
              5'h01: out_low = 10'h02d;
              5'h02: out_low = 10'h02d;
              5'h03: out_low = 10'h02c;
              5'h04: out_low = 10'h02c;
              5'h05: out_low = 10'h02c;
              5'h06: out_low = 10'h02b;
              5'h07: out_low = 10'h02b;
              5'h08: out_low = 10'h02a;
              5'h09: out_low = 10'h02a;
              5'h0a: out_low = 10'h02a;
              5'h0b: out_low = 10'h029;
              5'h0c: out_low = 10'h029;
              5'h0d: out_low = 10'h029;
              5'h0e: out_low = 10'h028;
              5'h0f: out_low = 10'h028;
              5'h10: out_low = 10'h028;
              5'h11: out_low = 10'h027;
              5'h12: out_low = 10'h027;
              5'h13: out_low = 10'h026;
              5'h14: out_low = 10'h026;
              5'h15: out_low = 10'h026;
              5'h16: out_low = 10'h025;
              5'h17: out_low = 10'h025;
              5'h18: out_low = 10'h025;
              5'h19: out_low = 10'h024;
              5'h1a: out_low = 10'h024;
              5'h1b: out_low = 10'h024;
              5'h1c: out_low = 10'h023;
              5'h1d: out_low = 10'h023;
              5'h1e: out_low = 10'h023;
              5'h1f: out_low = 10'h022;
              default: out_low = 10'h000;
            endcase
          end
          5'h1d: begin
            case (mant[4:0])
              5'h00: out_low = 10'h022;
              5'h01: out_low = 10'h021;
              5'h02: out_low = 10'h021;
              5'h03: out_low = 10'h021;
              5'h04: out_low = 10'h020;
              5'h05: out_low = 10'h020;
              5'h06: out_low = 10'h020;
              5'h07: out_low = 10'h01f;
              5'h08: out_low = 10'h01f;
              5'h09: out_low = 10'h01f;
              5'h0a: out_low = 10'h01e;
              5'h0b: out_low = 10'h01e;
              5'h0c: out_low = 10'h01e;
              5'h0d: out_low = 10'h01d;
              5'h0e: out_low = 10'h01d;
              5'h0f: out_low = 10'h01c;
              5'h10: out_low = 10'h01c;
              5'h11: out_low = 10'h01c;
              5'h12: out_low = 10'h01b;
              5'h13: out_low = 10'h01b;
              5'h14: out_low = 10'h01b;
              5'h15: out_low = 10'h01a;
              5'h16: out_low = 10'h01a;
              5'h17: out_low = 10'h01a;
              5'h18: out_low = 10'h019;
              5'h19: out_low = 10'h019;
              5'h1a: out_low = 10'h019;
              5'h1b: out_low = 10'h018;
              5'h1c: out_low = 10'h018;
              5'h1d: out_low = 10'h017;
              5'h1e: out_low = 10'h017;
              5'h1f: out_low = 10'h017;
              default: out_low = 10'h000;
            endcase
          end
          5'h1e: begin
            case (mant[4:0])
              5'h00: out_low = 10'h016;
              5'h01: out_low = 10'h016;
              5'h02: out_low = 10'h016;
              5'h03: out_low = 10'h015;
              5'h04: out_low = 10'h015;
              5'h05: out_low = 10'h015;
              5'h06: out_low = 10'h014;
              5'h07: out_low = 10'h014;
              5'h08: out_low = 10'h014;
              5'h09: out_low = 10'h013;
              5'h0a: out_low = 10'h013;
              5'h0b: out_low = 10'h013;
              5'h0c: out_low = 10'h012;
              5'h0d: out_low = 10'h012;
              5'h0e: out_low = 10'h011;
              5'h0f: out_low = 10'h011;
              5'h10: out_low = 10'h011;
              5'h11: out_low = 10'h010;
              5'h12: out_low = 10'h010;
              5'h13: out_low = 10'h010;
              5'h14: out_low = 10'h00f;
              5'h15: out_low = 10'h00f;
              5'h16: out_low = 10'h00f;
              5'h17: out_low = 10'h00e;
              5'h18: out_low = 10'h00e;
              5'h19: out_low = 10'h00e;
              5'h1a: out_low = 10'h00d;
              5'h1b: out_low = 10'h00d;
              5'h1c: out_low = 10'h00d;
              5'h1d: out_low = 10'h00c;
              5'h1e: out_low = 10'h00c;
              5'h1f: out_low = 10'h00c;
              default: out_low = 10'h000;
            endcase
          end
          5'h1f: begin
            case (mant[4:0])
              5'h00: out_low = 10'h00b;
              5'h01: out_low = 10'h00b;
              5'h02: out_low = 10'h00a;
              5'h03: out_low = 10'h00a;
              5'h04: out_low = 10'h00a;
              5'h05: out_low = 10'h009;
              5'h06: out_low = 10'h009;
              5'h07: out_low = 10'h009;
              5'h08: out_low = 10'h008;
              5'h09: out_low = 10'h008;
              5'h0a: out_low = 10'h008;
              5'h0b: out_low = 10'h007;
              5'h0c: out_low = 10'h007;
              5'h0d: out_low = 10'h007;
              5'h0e: out_low = 10'h006;
              5'h0f: out_low = 10'h006;
              5'h10: out_low = 10'h006;
              5'h11: out_low = 10'h005;
              5'h12: out_low = 10'h005;
              5'h13: out_low = 10'h005;
              5'h14: out_low = 10'h004;
              5'h15: out_low = 10'h004;
              5'h16: out_low = 10'h003;
              5'h17: out_low = 10'h003;
              5'h18: out_low = 10'h003;
              5'h19: out_low = 10'h002;
              5'h1a: out_low = 10'h002;
              5'h1b: out_low = 10'h002;
              5'h1c: out_low = 10'h001;
              5'h1d: out_low = 10'h001;
              5'h1e: out_low = 10'h001;
              5'h1f: out_low = 10'h000;
              default: out_low = 10'h000;
            endcase
          end
          default: out_low = 10'h000;
        endcase
      end
      6'h2f: begin
        case (mant[9:5])
          5'h00: begin
            case (mant[4:0])
              5'h00: out_low = 10'h000;
              5'h01: out_low = 10'h3ff;
              5'h02: out_low = 10'h3fd;
              5'h03: out_low = 10'h3fc;
              5'h04: out_low = 10'h3fa;
              5'h05: out_low = 10'h3f9;
              5'h06: out_low = 10'h3f8;
              5'h07: out_low = 10'h3f6;
              5'h08: out_low = 10'h3f5;
              5'h09: out_low = 10'h3f4;
              5'h0a: out_low = 10'h3f2;
              5'h0b: out_low = 10'h3f1;
              5'h0c: out_low = 10'h3ef;
              5'h0d: out_low = 10'h3ee;
              5'h0e: out_low = 10'h3ed;
              5'h0f: out_low = 10'h3eb;
              5'h10: out_low = 10'h3ea;
              5'h11: out_low = 10'h3e9;
              5'h12: out_low = 10'h3e7;
              5'h13: out_low = 10'h3e6;
              5'h14: out_low = 10'h3e4;
              5'h15: out_low = 10'h3e3;
              5'h16: out_low = 10'h3e2;
              5'h17: out_low = 10'h3e0;
              5'h18: out_low = 10'h3df;
              5'h19: out_low = 10'h3de;
              5'h1a: out_low = 10'h3dc;
              5'h1b: out_low = 10'h3db;
              5'h1c: out_low = 10'h3da;
              5'h1d: out_low = 10'h3d8;
              5'h1e: out_low = 10'h3d7;
              5'h1f: out_low = 10'h3d5;
              default: out_low = 10'h000;
            endcase
          end
          5'h01: begin
            case (mant[4:0])
              5'h00: out_low = 10'h3d4;
              5'h01: out_low = 10'h3d3;
              5'h02: out_low = 10'h3d1;
              5'h03: out_low = 10'h3d0;
              5'h04: out_low = 10'h3cf;
              5'h05: out_low = 10'h3cd;
              5'h06: out_low = 10'h3cc;
              5'h07: out_low = 10'h3cb;
              5'h08: out_low = 10'h3c9;
              5'h09: out_low = 10'h3c8;
              5'h0a: out_low = 10'h3c7;
              5'h0b: out_low = 10'h3c5;
              5'h0c: out_low = 10'h3c4;
              5'h0d: out_low = 10'h3c3;
              5'h0e: out_low = 10'h3c1;
              5'h0f: out_low = 10'h3c0;
              5'h10: out_low = 10'h3bf;
              5'h11: out_low = 10'h3bd;
              5'h12: out_low = 10'h3bc;
              5'h13: out_low = 10'h3bb;
              5'h14: out_low = 10'h3b9;
              5'h15: out_low = 10'h3b8;
              5'h16: out_low = 10'h3b6;
              5'h17: out_low = 10'h3b5;
              5'h18: out_low = 10'h3b4;
              5'h19: out_low = 10'h3b2;
              5'h1a: out_low = 10'h3b1;
              5'h1b: out_low = 10'h3b0;
              5'h1c: out_low = 10'h3ae;
              5'h1d: out_low = 10'h3ad;
              5'h1e: out_low = 10'h3ac;
              5'h1f: out_low = 10'h3aa;
              default: out_low = 10'h000;
            endcase
          end
          5'h02: begin
            case (mant[4:0])
              5'h00: out_low = 10'h3a9;
              5'h01: out_low = 10'h3a8;
              5'h02: out_low = 10'h3a7;
              5'h03: out_low = 10'h3a5;
              5'h04: out_low = 10'h3a4;
              5'h05: out_low = 10'h3a3;
              5'h06: out_low = 10'h3a1;
              5'h07: out_low = 10'h3a0;
              5'h08: out_low = 10'h39f;
              5'h09: out_low = 10'h39d;
              5'h0a: out_low = 10'h39c;
              5'h0b: out_low = 10'h39b;
              5'h0c: out_low = 10'h399;
              5'h0d: out_low = 10'h398;
              5'h0e: out_low = 10'h397;
              5'h0f: out_low = 10'h395;
              5'h10: out_low = 10'h394;
              5'h11: out_low = 10'h393;
              5'h12: out_low = 10'h391;
              5'h13: out_low = 10'h390;
              5'h14: out_low = 10'h38f;
              5'h15: out_low = 10'h38d;
              5'h16: out_low = 10'h38c;
              5'h17: out_low = 10'h38b;
              5'h18: out_low = 10'h38a;
              5'h19: out_low = 10'h388;
              5'h1a: out_low = 10'h387;
              5'h1b: out_low = 10'h386;
              5'h1c: out_low = 10'h384;
              5'h1d: out_low = 10'h383;
              5'h1e: out_low = 10'h382;
              5'h1f: out_low = 10'h380;
              default: out_low = 10'h000;
            endcase
          end
          5'h03: begin
            case (mant[4:0])
              5'h00: out_low = 10'h37f;
              5'h01: out_low = 10'h37e;
              5'h02: out_low = 10'h37d;
              5'h03: out_low = 10'h37b;
              5'h04: out_low = 10'h37a;
              5'h05: out_low = 10'h379;
              5'h06: out_low = 10'h377;
              5'h07: out_low = 10'h376;
              5'h08: out_low = 10'h375;
              5'h09: out_low = 10'h373;
              5'h0a: out_low = 10'h372;
              5'h0b: out_low = 10'h371;
              5'h0c: out_low = 10'h370;
              5'h0d: out_low = 10'h36e;
              5'h0e: out_low = 10'h36d;
              5'h0f: out_low = 10'h36c;
              5'h10: out_low = 10'h36a;
              5'h11: out_low = 10'h369;
              5'h12: out_low = 10'h368;
              5'h13: out_low = 10'h367;
              5'h14: out_low = 10'h365;
              5'h15: out_low = 10'h364;
              5'h16: out_low = 10'h363;
              5'h17: out_low = 10'h362;
              5'h18: out_low = 10'h360;
              5'h19: out_low = 10'h35f;
              5'h1a: out_low = 10'h35e;
              5'h1b: out_low = 10'h35c;
              5'h1c: out_low = 10'h35b;
              5'h1d: out_low = 10'h35a;
              5'h1e: out_low = 10'h359;
              5'h1f: out_low = 10'h357;
              default: out_low = 10'h000;
            endcase
          end
          5'h04: begin
            case (mant[4:0])
              5'h00: out_low = 10'h356;
              5'h01: out_low = 10'h355;
              5'h02: out_low = 10'h353;
              5'h03: out_low = 10'h352;
              5'h04: out_low = 10'h351;
              5'h05: out_low = 10'h350;
              5'h06: out_low = 10'h34e;
              5'h07: out_low = 10'h34d;
              5'h08: out_low = 10'h34c;
              5'h09: out_low = 10'h34b;
              5'h0a: out_low = 10'h349;
              5'h0b: out_low = 10'h348;
              5'h0c: out_low = 10'h347;
              5'h0d: out_low = 10'h346;
              5'h0e: out_low = 10'h344;
              5'h0f: out_low = 10'h343;
              5'h10: out_low = 10'h342;
              5'h11: out_low = 10'h341;
              5'h12: out_low = 10'h33f;
              5'h13: out_low = 10'h33e;
              5'h14: out_low = 10'h33d;
              5'h15: out_low = 10'h33c;
              5'h16: out_low = 10'h33a;
              5'h17: out_low = 10'h339;
              5'h18: out_low = 10'h338;
              5'h19: out_low = 10'h337;
              5'h1a: out_low = 10'h335;
              5'h1b: out_low = 10'h334;
              5'h1c: out_low = 10'h333;
              5'h1d: out_low = 10'h332;
              5'h1e: out_low = 10'h330;
              5'h1f: out_low = 10'h32f;
              default: out_low = 10'h000;
            endcase
          end
          5'h05: begin
            case (mant[4:0])
              5'h00: out_low = 10'h32e;
              5'h01: out_low = 10'h32d;
              5'h02: out_low = 10'h32b;
              5'h03: out_low = 10'h32a;
              5'h04: out_low = 10'h329;
              5'h05: out_low = 10'h328;
              5'h06: out_low = 10'h326;
              5'h07: out_low = 10'h325;
              5'h08: out_low = 10'h324;
              5'h09: out_low = 10'h323;
              5'h0a: out_low = 10'h321;
              5'h0b: out_low = 10'h320;
              5'h0c: out_low = 10'h31f;
              5'h0d: out_low = 10'h31e;
              5'h0e: out_low = 10'h31c;
              5'h0f: out_low = 10'h31b;
              5'h10: out_low = 10'h31a;
              5'h11: out_low = 10'h319;
              5'h12: out_low = 10'h318;
              5'h13: out_low = 10'h316;
              5'h14: out_low = 10'h315;
              5'h15: out_low = 10'h314;
              5'h16: out_low = 10'h313;
              5'h17: out_low = 10'h311;
              5'h18: out_low = 10'h310;
              5'h19: out_low = 10'h30f;
              5'h1a: out_low = 10'h30e;
              5'h1b: out_low = 10'h30c;
              5'h1c: out_low = 10'h30b;
              5'h1d: out_low = 10'h30a;
              5'h1e: out_low = 10'h309;
              5'h1f: out_low = 10'h308;
              default: out_low = 10'h000;
            endcase
          end
          5'h06: begin
            case (mant[4:0])
              5'h00: out_low = 10'h306;
              5'h01: out_low = 10'h305;
              5'h02: out_low = 10'h304;
              5'h03: out_low = 10'h303;
              5'h04: out_low = 10'h302;
              5'h05: out_low = 10'h300;
              5'h06: out_low = 10'h2ff;
              5'h07: out_low = 10'h2fe;
              5'h08: out_low = 10'h2fd;
              5'h09: out_low = 10'h2fb;
              5'h0a: out_low = 10'h2fa;
              5'h0b: out_low = 10'h2f9;
              5'h0c: out_low = 10'h2f8;
              5'h0d: out_low = 10'h2f7;
              5'h0e: out_low = 10'h2f5;
              5'h0f: out_low = 10'h2f4;
              5'h10: out_low = 10'h2f3;
              5'h11: out_low = 10'h2f2;
              5'h12: out_low = 10'h2f1;
              5'h13: out_low = 10'h2ef;
              5'h14: out_low = 10'h2ee;
              5'h15: out_low = 10'h2ed;
              5'h16: out_low = 10'h2ec;
              5'h17: out_low = 10'h2eb;
              5'h18: out_low = 10'h2e9;
              5'h19: out_low = 10'h2e8;
              5'h1a: out_low = 10'h2e7;
              5'h1b: out_low = 10'h2e6;
              5'h1c: out_low = 10'h2e5;
              5'h1d: out_low = 10'h2e3;
              5'h1e: out_low = 10'h2e2;
              5'h1f: out_low = 10'h2e1;
              default: out_low = 10'h000;
            endcase
          end
          5'h07: begin
            case (mant[4:0])
              5'h00: out_low = 10'h2e0;
              5'h01: out_low = 10'h2df;
              5'h02: out_low = 10'h2dd;
              5'h03: out_low = 10'h2dc;
              5'h04: out_low = 10'h2db;
              5'h05: out_low = 10'h2da;
              5'h06: out_low = 10'h2d9;
              5'h07: out_low = 10'h2d8;
              5'h08: out_low = 10'h2d6;
              5'h09: out_low = 10'h2d5;
              5'h0a: out_low = 10'h2d4;
              5'h0b: out_low = 10'h2d3;
              5'h0c: out_low = 10'h2d2;
              5'h0d: out_low = 10'h2d0;
              5'h0e: out_low = 10'h2cf;
              5'h0f: out_low = 10'h2ce;
              5'h10: out_low = 10'h2cd;
              5'h11: out_low = 10'h2cc;
              5'h12: out_low = 10'h2cb;
              5'h13: out_low = 10'h2c9;
              5'h14: out_low = 10'h2c8;
              5'h15: out_low = 10'h2c7;
              5'h16: out_low = 10'h2c6;
              5'h17: out_low = 10'h2c5;
              5'h18: out_low = 10'h2c4;
              5'h19: out_low = 10'h2c2;
              5'h1a: out_low = 10'h2c1;
              5'h1b: out_low = 10'h2c0;
              5'h1c: out_low = 10'h2bf;
              5'h1d: out_low = 10'h2be;
              5'h1e: out_low = 10'h2bc;
              5'h1f: out_low = 10'h2bb;
              default: out_low = 10'h000;
            endcase
          end
          5'h08: begin
            case (mant[4:0])
              5'h00: out_low = 10'h2ba;
              5'h01: out_low = 10'h2b9;
              5'h02: out_low = 10'h2b8;
              5'h03: out_low = 10'h2b7;
              5'h04: out_low = 10'h2b5;
              5'h05: out_low = 10'h2b4;
              5'h06: out_low = 10'h2b3;
              5'h07: out_low = 10'h2b2;
              5'h08: out_low = 10'h2b1;
              5'h09: out_low = 10'h2b0;
              5'h0a: out_low = 10'h2af;
              5'h0b: out_low = 10'h2ad;
              5'h0c: out_low = 10'h2ac;
              5'h0d: out_low = 10'h2ab;
              5'h0e: out_low = 10'h2aa;
              5'h0f: out_low = 10'h2a9;
              5'h10: out_low = 10'h2a8;
              5'h11: out_low = 10'h2a6;
              5'h12: out_low = 10'h2a5;
              5'h13: out_low = 10'h2a4;
              5'h14: out_low = 10'h2a3;
              5'h15: out_low = 10'h2a2;
              5'h16: out_low = 10'h2a1;
              5'h17: out_low = 10'h2a0;
              5'h18: out_low = 10'h29e;
              5'h19: out_low = 10'h29d;
              5'h1a: out_low = 10'h29c;
              5'h1b: out_low = 10'h29b;
              5'h1c: out_low = 10'h29a;
              5'h1d: out_low = 10'h299;
              5'h1e: out_low = 10'h298;
              5'h1f: out_low = 10'h296;
              default: out_low = 10'h000;
            endcase
          end
          5'h09: begin
            case (mant[4:0])
              5'h00: out_low = 10'h295;
              5'h01: out_low = 10'h294;
              5'h02: out_low = 10'h293;
              5'h03: out_low = 10'h292;
              5'h04: out_low = 10'h291;
              5'h05: out_low = 10'h290;
              5'h06: out_low = 10'h28e;
              5'h07: out_low = 10'h28d;
              5'h08: out_low = 10'h28c;
              5'h09: out_low = 10'h28b;
              5'h0a: out_low = 10'h28a;
              5'h0b: out_low = 10'h289;
              5'h0c: out_low = 10'h288;
              5'h0d: out_low = 10'h286;
              5'h0e: out_low = 10'h285;
              5'h0f: out_low = 10'h284;
              5'h10: out_low = 10'h283;
              5'h11: out_low = 10'h282;
              5'h12: out_low = 10'h281;
              5'h13: out_low = 10'h280;
              5'h14: out_low = 10'h27f;
              5'h15: out_low = 10'h27d;
              5'h16: out_low = 10'h27c;
              5'h17: out_low = 10'h27b;
              5'h18: out_low = 10'h27a;
              5'h19: out_low = 10'h279;
              5'h1a: out_low = 10'h278;
              5'h1b: out_low = 10'h277;
              5'h1c: out_low = 10'h276;
              5'h1d: out_low = 10'h274;
              5'h1e: out_low = 10'h273;
              5'h1f: out_low = 10'h272;
              default: out_low = 10'h000;
            endcase
          end
          5'h0a: begin
            case (mant[4:0])
              5'h00: out_low = 10'h271;
              5'h01: out_low = 10'h270;
              5'h02: out_low = 10'h26f;
              5'h03: out_low = 10'h26e;
              5'h04: out_low = 10'h26d;
              5'h05: out_low = 10'h26c;
              5'h06: out_low = 10'h26a;
              5'h07: out_low = 10'h269;
              5'h08: out_low = 10'h268;
              5'h09: out_low = 10'h267;
              5'h0a: out_low = 10'h266;
              5'h0b: out_low = 10'h265;
              5'h0c: out_low = 10'h264;
              5'h0d: out_low = 10'h263;
              5'h0e: out_low = 10'h262;
              5'h0f: out_low = 10'h260;
              5'h10: out_low = 10'h25f;
              5'h11: out_low = 10'h25e;
              5'h12: out_low = 10'h25d;
              5'h13: out_low = 10'h25c;
              5'h14: out_low = 10'h25b;
              5'h15: out_low = 10'h25a;
              5'h16: out_low = 10'h259;
              5'h17: out_low = 10'h258;
              5'h18: out_low = 10'h257;
              5'h19: out_low = 10'h255;
              5'h1a: out_low = 10'h254;
              5'h1b: out_low = 10'h253;
              5'h1c: out_low = 10'h252;
              5'h1d: out_low = 10'h251;
              5'h1e: out_low = 10'h250;
              5'h1f: out_low = 10'h24f;
              default: out_low = 10'h000;
            endcase
          end
          5'h0b: begin
            case (mant[4:0])
              5'h00: out_low = 10'h24e;
              5'h01: out_low = 10'h24d;
              5'h02: out_low = 10'h24c;
              5'h03: out_low = 10'h24b;
              5'h04: out_low = 10'h249;
              5'h05: out_low = 10'h248;
              5'h06: out_low = 10'h247;
              5'h07: out_low = 10'h246;
              5'h08: out_low = 10'h245;
              5'h09: out_low = 10'h244;
              5'h0a: out_low = 10'h243;
              5'h0b: out_low = 10'h242;
              5'h0c: out_low = 10'h241;
              5'h0d: out_low = 10'h240;
              5'h0e: out_low = 10'h23f;
              5'h0f: out_low = 10'h23e;
              5'h10: out_low = 10'h23c;
              5'h11: out_low = 10'h23b;
              5'h12: out_low = 10'h23a;
              5'h13: out_low = 10'h239;
              5'h14: out_low = 10'h238;
              5'h15: out_low = 10'h237;
              5'h16: out_low = 10'h236;
              5'h17: out_low = 10'h235;
              5'h18: out_low = 10'h234;
              5'h19: out_low = 10'h233;
              5'h1a: out_low = 10'h232;
              5'h1b: out_low = 10'h231;
              5'h1c: out_low = 10'h230;
              5'h1d: out_low = 10'h22e;
              5'h1e: out_low = 10'h22d;
              5'h1f: out_low = 10'h22c;
              default: out_low = 10'h000;
            endcase
          end
          5'h0c: begin
            case (mant[4:0])
              5'h00: out_low = 10'h22b;
              5'h01: out_low = 10'h22a;
              5'h02: out_low = 10'h229;
              5'h03: out_low = 10'h228;
              5'h04: out_low = 10'h227;
              5'h05: out_low = 10'h226;
              5'h06: out_low = 10'h225;
              5'h07: out_low = 10'h224;
              5'h08: out_low = 10'h223;
              5'h09: out_low = 10'h222;
              5'h0a: out_low = 10'h221;
              5'h0b: out_low = 10'h220;
              5'h0c: out_low = 10'h21e;
              5'h0d: out_low = 10'h21d;
              5'h0e: out_low = 10'h21c;
              5'h0f: out_low = 10'h21b;
              5'h10: out_low = 10'h21a;
              5'h11: out_low = 10'h219;
              5'h12: out_low = 10'h218;
              5'h13: out_low = 10'h217;
              5'h14: out_low = 10'h216;
              5'h15: out_low = 10'h215;
              5'h16: out_low = 10'h214;
              5'h17: out_low = 10'h213;
              5'h18: out_low = 10'h212;
              5'h19: out_low = 10'h211;
              5'h1a: out_low = 10'h210;
              5'h1b: out_low = 10'h20f;
              5'h1c: out_low = 10'h20e;
              5'h1d: out_low = 10'h20d;
              5'h1e: out_low = 10'h20b;
              5'h1f: out_low = 10'h20a;
              default: out_low = 10'h000;
            endcase
          end
          5'h0d: begin
            case (mant[4:0])
              5'h00: out_low = 10'h209;
              5'h01: out_low = 10'h208;
              5'h02: out_low = 10'h207;
              5'h03: out_low = 10'h206;
              5'h04: out_low = 10'h205;
              5'h05: out_low = 10'h204;
              5'h06: out_low = 10'h203;
              5'h07: out_low = 10'h202;
              5'h08: out_low = 10'h201;
              5'h09: out_low = 10'h200;
              5'h0a: out_low = 10'h1ff;
              5'h0b: out_low = 10'h1fe;
              5'h0c: out_low = 10'h1fd;
              5'h0d: out_low = 10'h1fc;
              5'h0e: out_low = 10'h1fb;
              5'h0f: out_low = 10'h1fa;
              5'h10: out_low = 10'h1f9;
              5'h11: out_low = 10'h1f8;
              5'h12: out_low = 10'h1f7;
              5'h13: out_low = 10'h1f6;
              5'h14: out_low = 10'h1f5;
              5'h15: out_low = 10'h1f4;
              5'h16: out_low = 10'h1f3;
              5'h17: out_low = 10'h1f2;
              5'h18: out_low = 10'h1f0;
              5'h19: out_low = 10'h1ef;
              5'h1a: out_low = 10'h1ee;
              5'h1b: out_low = 10'h1ed;
              5'h1c: out_low = 10'h1ec;
              5'h1d: out_low = 10'h1eb;
              5'h1e: out_low = 10'h1ea;
              5'h1f: out_low = 10'h1e9;
              default: out_low = 10'h000;
            endcase
          end
          5'h0e: begin
            case (mant[4:0])
              5'h00: out_low = 10'h1e8;
              5'h01: out_low = 10'h1e7;
              5'h02: out_low = 10'h1e6;
              5'h03: out_low = 10'h1e5;
              5'h04: out_low = 10'h1e4;
              5'h05: out_low = 10'h1e3;
              5'h06: out_low = 10'h1e2;
              5'h07: out_low = 10'h1e1;
              5'h08: out_low = 10'h1e0;
              5'h09: out_low = 10'h1df;
              5'h0a: out_low = 10'h1de;
              5'h0b: out_low = 10'h1dd;
              5'h0c: out_low = 10'h1dc;
              5'h0d: out_low = 10'h1db;
              5'h0e: out_low = 10'h1da;
              5'h0f: out_low = 10'h1d9;
              5'h10: out_low = 10'h1d8;
              5'h11: out_low = 10'h1d7;
              5'h12: out_low = 10'h1d6;
              5'h13: out_low = 10'h1d5;
              5'h14: out_low = 10'h1d4;
              5'h15: out_low = 10'h1d3;
              5'h16: out_low = 10'h1d2;
              5'h17: out_low = 10'h1d1;
              5'h18: out_low = 10'h1d0;
              5'h19: out_low = 10'h1cf;
              5'h1a: out_low = 10'h1ce;
              5'h1b: out_low = 10'h1cd;
              5'h1c: out_low = 10'h1cc;
              5'h1d: out_low = 10'h1cb;
              5'h1e: out_low = 10'h1ca;
              5'h1f: out_low = 10'h1c9;
              default: out_low = 10'h000;
            endcase
          end
          5'h0f: begin
            case (mant[4:0])
              5'h00: out_low = 10'h1c8;
              5'h01: out_low = 10'h1c7;
              5'h02: out_low = 10'h1c6;
              5'h03: out_low = 10'h1c5;
              5'h04: out_low = 10'h1c4;
              5'h05: out_low = 10'h1c3;
              5'h06: out_low = 10'h1c2;
              5'h07: out_low = 10'h1c1;
              5'h08: out_low = 10'h1c0;
              5'h09: out_low = 10'h1bf;
              5'h0a: out_low = 10'h1be;
              5'h0b: out_low = 10'h1bd;
              5'h0c: out_low = 10'h1bc;
              5'h0d: out_low = 10'h1bb;
              5'h0e: out_low = 10'h1ba;
              5'h0f: out_low = 10'h1b9;
              5'h10: out_low = 10'h1b8;
              5'h11: out_low = 10'h1b7;
              5'h12: out_low = 10'h1b6;
              5'h13: out_low = 10'h1b5;
              5'h14: out_low = 10'h1b4;
              5'h15: out_low = 10'h1b3;
              5'h16: out_low = 10'h1b2;
              5'h17: out_low = 10'h1b1;
              5'h18: out_low = 10'h1b0;
              5'h19: out_low = 10'h1af;
              5'h1a: out_low = 10'h1ae;
              5'h1b: out_low = 10'h1ad;
              5'h1c: out_low = 10'h1ac;
              5'h1d: out_low = 10'h1ab;
              5'h1e: out_low = 10'h1aa;
              5'h1f: out_low = 10'h1a9;
              default: out_low = 10'h000;
            endcase
          end
          5'h10: begin
            case (mant[4:0])
              5'h00: out_low = 10'h1a8;
              5'h01: out_low = 10'h1a7;
              5'h02: out_low = 10'h1a6;
              5'h03: out_low = 10'h1a5;
              5'h04: out_low = 10'h1a4;
              5'h05: out_low = 10'h1a3;
              5'h06: out_low = 10'h1a2;
              5'h07: out_low = 10'h1a1;
              5'h08: out_low = 10'h1a0;
              5'h09: out_low = 10'h19f;
              5'h0a: out_low = 10'h19e;
              5'h0b: out_low = 10'h19d;
              5'h0c: out_low = 10'h19c;
              5'h0d: out_low = 10'h19b;
              5'h0e: out_low = 10'h19a;
              5'h0f: out_low = 10'h19a;
              5'h10: out_low = 10'h199;
              5'h11: out_low = 10'h198;
              5'h12: out_low = 10'h197;
              5'h13: out_low = 10'h196;
              5'h14: out_low = 10'h195;
              5'h15: out_low = 10'h194;
              5'h16: out_low = 10'h193;
              5'h17: out_low = 10'h192;
              5'h18: out_low = 10'h191;
              5'h19: out_low = 10'h190;
              5'h1a: out_low = 10'h18f;
              5'h1b: out_low = 10'h18e;
              5'h1c: out_low = 10'h18d;
              5'h1d: out_low = 10'h18c;
              5'h1e: out_low = 10'h18b;
              5'h1f: out_low = 10'h18a;
              default: out_low = 10'h000;
            endcase
          end
          5'h11: begin
            case (mant[4:0])
              5'h00: out_low = 10'h189;
              5'h01: out_low = 10'h188;
              5'h02: out_low = 10'h187;
              5'h03: out_low = 10'h186;
              5'h04: out_low = 10'h185;
              5'h05: out_low = 10'h184;
              5'h06: out_low = 10'h183;
              5'h07: out_low = 10'h182;
              5'h08: out_low = 10'h181;
              5'h09: out_low = 10'h181;
              5'h0a: out_low = 10'h180;
              5'h0b: out_low = 10'h17f;
              5'h0c: out_low = 10'h17e;
              5'h0d: out_low = 10'h17d;
              5'h0e: out_low = 10'h17c;
              5'h0f: out_low = 10'h17b;
              5'h10: out_low = 10'h17a;
              5'h11: out_low = 10'h179;
              5'h12: out_low = 10'h178;
              5'h13: out_low = 10'h177;
              5'h14: out_low = 10'h176;
              5'h15: out_low = 10'h175;
              5'h16: out_low = 10'h174;
              5'h17: out_low = 10'h173;
              5'h18: out_low = 10'h172;
              5'h19: out_low = 10'h171;
              5'h1a: out_low = 10'h170;
              5'h1b: out_low = 10'h16f;
              5'h1c: out_low = 10'h16f;
              5'h1d: out_low = 10'h16e;
              5'h1e: out_low = 10'h16d;
              5'h1f: out_low = 10'h16c;
              default: out_low = 10'h000;
            endcase
          end
          5'h12: begin
            case (mant[4:0])
              5'h00: out_low = 10'h16b;
              5'h01: out_low = 10'h16a;
              5'h02: out_low = 10'h169;
              5'h03: out_low = 10'h168;
              5'h04: out_low = 10'h167;
              5'h05: out_low = 10'h166;
              5'h06: out_low = 10'h165;
              5'h07: out_low = 10'h164;
              5'h08: out_low = 10'h163;
              5'h09: out_low = 10'h162;
              5'h0a: out_low = 10'h161;
              5'h0b: out_low = 10'h160;
              5'h0c: out_low = 10'h160;
              5'h0d: out_low = 10'h15f;
              5'h0e: out_low = 10'h15e;
              5'h0f: out_low = 10'h15d;
              5'h10: out_low = 10'h15c;
              5'h11: out_low = 10'h15b;
              5'h12: out_low = 10'h15a;
              5'h13: out_low = 10'h159;
              5'h14: out_low = 10'h158;
              5'h15: out_low = 10'h157;
              5'h16: out_low = 10'h156;
              5'h17: out_low = 10'h155;
              5'h18: out_low = 10'h154;
              5'h19: out_low = 10'h153;
              5'h1a: out_low = 10'h153;
              5'h1b: out_low = 10'h152;
              5'h1c: out_low = 10'h151;
              5'h1d: out_low = 10'h150;
              5'h1e: out_low = 10'h14f;
              5'h1f: out_low = 10'h14e;
              default: out_low = 10'h000;
            endcase
          end
          5'h13: begin
            case (mant[4:0])
              5'h00: out_low = 10'h14d;
              5'h01: out_low = 10'h14c;
              5'h02: out_low = 10'h14b;
              5'h03: out_low = 10'h14a;
              5'h04: out_low = 10'h149;
              5'h05: out_low = 10'h148;
              5'h06: out_low = 10'h148;
              5'h07: out_low = 10'h147;
              5'h08: out_low = 10'h146;
              5'h09: out_low = 10'h145;
              5'h0a: out_low = 10'h144;
              5'h0b: out_low = 10'h143;
              5'h0c: out_low = 10'h142;
              5'h0d: out_low = 10'h141;
              5'h0e: out_low = 10'h140;
              5'h0f: out_low = 10'h13f;
              5'h10: out_low = 10'h13e;
              5'h11: out_low = 10'h13e;
              5'h12: out_low = 10'h13d;
              5'h13: out_low = 10'h13c;
              5'h14: out_low = 10'h13b;
              5'h15: out_low = 10'h13a;
              5'h16: out_low = 10'h139;
              5'h17: out_low = 10'h138;
              5'h18: out_low = 10'h137;
              5'h19: out_low = 10'h136;
              5'h1a: out_low = 10'h135;
              5'h1b: out_low = 10'h134;
              5'h1c: out_low = 10'h134;
              5'h1d: out_low = 10'h133;
              5'h1e: out_low = 10'h132;
              5'h1f: out_low = 10'h131;
              default: out_low = 10'h000;
            endcase
          end
          5'h14: begin
            case (mant[4:0])
              5'h00: out_low = 10'h130;
              5'h01: out_low = 10'h12f;
              5'h02: out_low = 10'h12e;
              5'h03: out_low = 10'h12d;
              5'h04: out_low = 10'h12c;
              5'h05: out_low = 10'h12b;
              5'h06: out_low = 10'h12b;
              5'h07: out_low = 10'h12a;
              5'h08: out_low = 10'h129;
              5'h09: out_low = 10'h128;
              5'h0a: out_low = 10'h127;
              5'h0b: out_low = 10'h126;
              5'h0c: out_low = 10'h125;
              5'h0d: out_low = 10'h124;
              5'h0e: out_low = 10'h123;
              5'h0f: out_low = 10'h123;
              5'h10: out_low = 10'h122;
              5'h11: out_low = 10'h121;
              5'h12: out_low = 10'h120;
              5'h13: out_low = 10'h11f;
              5'h14: out_low = 10'h11e;
              5'h15: out_low = 10'h11d;
              5'h16: out_low = 10'h11c;
              5'h17: out_low = 10'h11b;
              5'h18: out_low = 10'h11b;
              5'h19: out_low = 10'h11a;
              5'h1a: out_low = 10'h119;
              5'h1b: out_low = 10'h118;
              5'h1c: out_low = 10'h117;
              5'h1d: out_low = 10'h116;
              5'h1e: out_low = 10'h115;
              5'h1f: out_low = 10'h114;
              default: out_low = 10'h000;
            endcase
          end
          5'h15: begin
            case (mant[4:0])
              5'h00: out_low = 10'h114;
              5'h01: out_low = 10'h113;
              5'h02: out_low = 10'h112;
              5'h03: out_low = 10'h111;
              5'h04: out_low = 10'h110;
              5'h05: out_low = 10'h10f;
              5'h06: out_low = 10'h10e;
              5'h07: out_low = 10'h10d;
              5'h08: out_low = 10'h10c;
              5'h09: out_low = 10'h10c;
              5'h0a: out_low = 10'h10b;
              5'h0b: out_low = 10'h10a;
              5'h0c: out_low = 10'h109;
              5'h0d: out_low = 10'h108;
              5'h0e: out_low = 10'h107;
              5'h0f: out_low = 10'h106;
              5'h10: out_low = 10'h106;
              5'h11: out_low = 10'h105;
              5'h12: out_low = 10'h104;
              5'h13: out_low = 10'h103;
              5'h14: out_low = 10'h102;
              5'h15: out_low = 10'h101;
              5'h16: out_low = 10'h100;
              5'h17: out_low = 10'h0ff;
              5'h18: out_low = 10'h0ff;
              5'h19: out_low = 10'h0fe;
              5'h1a: out_low = 10'h0fd;
              5'h1b: out_low = 10'h0fc;
              5'h1c: out_low = 10'h0fb;
              5'h1d: out_low = 10'h0fa;
              5'h1e: out_low = 10'h0f9;
              5'h1f: out_low = 10'h0f9;
              default: out_low = 10'h000;
            endcase
          end
          5'h16: begin
            case (mant[4:0])
              5'h00: out_low = 10'h0f8;
              5'h01: out_low = 10'h0f7;
              5'h02: out_low = 10'h0f6;
              5'h03: out_low = 10'h0f5;
              5'h04: out_low = 10'h0f4;
              5'h05: out_low = 10'h0f3;
              5'h06: out_low = 10'h0f3;
              5'h07: out_low = 10'h0f2;
              5'h08: out_low = 10'h0f1;
              5'h09: out_low = 10'h0f0;
              5'h0a: out_low = 10'h0ef;
              5'h0b: out_low = 10'h0ee;
              5'h0c: out_low = 10'h0ed;
              5'h0d: out_low = 10'h0ed;
              5'h0e: out_low = 10'h0ec;
              5'h0f: out_low = 10'h0eb;
              5'h10: out_low = 10'h0ea;
              5'h11: out_low = 10'h0e9;
              5'h12: out_low = 10'h0e8;
              5'h13: out_low = 10'h0e7;
              5'h14: out_low = 10'h0e7;
              5'h15: out_low = 10'h0e6;
              5'h16: out_low = 10'h0e5;
              5'h17: out_low = 10'h0e4;
              5'h18: out_low = 10'h0e3;
              5'h19: out_low = 10'h0e2;
              5'h1a: out_low = 10'h0e1;
              5'h1b: out_low = 10'h0e1;
              5'h1c: out_low = 10'h0e0;
              5'h1d: out_low = 10'h0df;
              5'h1e: out_low = 10'h0de;
              5'h1f: out_low = 10'h0dd;
              default: out_low = 10'h000;
            endcase
          end
          5'h17: begin
            case (mant[4:0])
              5'h00: out_low = 10'h0dc;
              5'h01: out_low = 10'h0dc;
              5'h02: out_low = 10'h0db;
              5'h03: out_low = 10'h0da;
              5'h04: out_low = 10'h0d9;
              5'h05: out_low = 10'h0d8;
              5'h06: out_low = 10'h0d7;
              5'h07: out_low = 10'h0d7;
              5'h08: out_low = 10'h0d6;
              5'h09: out_low = 10'h0d5;
              5'h0a: out_low = 10'h0d4;
              5'h0b: out_low = 10'h0d3;
              5'h0c: out_low = 10'h0d2;
              5'h0d: out_low = 10'h0d2;
              5'h0e: out_low = 10'h0d1;
              5'h0f: out_low = 10'h0d0;
              5'h10: out_low = 10'h0cf;
              5'h11: out_low = 10'h0ce;
              5'h12: out_low = 10'h0cd;
              5'h13: out_low = 10'h0cd;
              5'h14: out_low = 10'h0cc;
              5'h15: out_low = 10'h0cb;
              5'h16: out_low = 10'h0ca;
              5'h17: out_low = 10'h0c9;
              5'h18: out_low = 10'h0c8;
              5'h19: out_low = 10'h0c8;
              5'h1a: out_low = 10'h0c7;
              5'h1b: out_low = 10'h0c6;
              5'h1c: out_low = 10'h0c5;
              5'h1d: out_low = 10'h0c4;
              5'h1e: out_low = 10'h0c3;
              5'h1f: out_low = 10'h0c3;
              default: out_low = 10'h000;
            endcase
          end
          5'h18: begin
            case (mant[4:0])
              5'h00: out_low = 10'h0c2;
              5'h01: out_low = 10'h0c1;
              5'h02: out_low = 10'h0c0;
              5'h03: out_low = 10'h0bf;
              5'h04: out_low = 10'h0be;
              5'h05: out_low = 10'h0be;
              5'h06: out_low = 10'h0bd;
              5'h07: out_low = 10'h0bc;
              5'h08: out_low = 10'h0bb;
              5'h09: out_low = 10'h0ba;
              5'h0a: out_low = 10'h0ba;
              5'h0b: out_low = 10'h0b9;
              5'h0c: out_low = 10'h0b8;
              5'h0d: out_low = 10'h0b7;
              5'h0e: out_low = 10'h0b6;
              5'h0f: out_low = 10'h0b5;
              5'h10: out_low = 10'h0b5;
              5'h11: out_low = 10'h0b4;
              5'h12: out_low = 10'h0b3;
              5'h13: out_low = 10'h0b2;
              5'h14: out_low = 10'h0b1;
              5'h15: out_low = 10'h0b1;
              5'h16: out_low = 10'h0b0;
              5'h17: out_low = 10'h0af;
              5'h18: out_low = 10'h0ae;
              5'h19: out_low = 10'h0ad;
              5'h1a: out_low = 10'h0ad;
              5'h1b: out_low = 10'h0ac;
              5'h1c: out_low = 10'h0ab;
              5'h1d: out_low = 10'h0aa;
              5'h1e: out_low = 10'h0a9;
              5'h1f: out_low = 10'h0a8;
              default: out_low = 10'h000;
            endcase
          end
          5'h19: begin
            case (mant[4:0])
              5'h00: out_low = 10'h0a8;
              5'h01: out_low = 10'h0a7;
              5'h02: out_low = 10'h0a6;
              5'h03: out_low = 10'h0a5;
              5'h04: out_low = 10'h0a4;
              5'h05: out_low = 10'h0a4;
              5'h06: out_low = 10'h0a3;
              5'h07: out_low = 10'h0a2;
              5'h08: out_low = 10'h0a1;
              5'h09: out_low = 10'h0a0;
              5'h0a: out_low = 10'h0a0;
              5'h0b: out_low = 10'h09f;
              5'h0c: out_low = 10'h09e;
              5'h0d: out_low = 10'h09d;
              5'h0e: out_low = 10'h09c;
              5'h0f: out_low = 10'h09c;
              5'h10: out_low = 10'h09b;
              5'h11: out_low = 10'h09a;
              5'h12: out_low = 10'h099;
              5'h13: out_low = 10'h098;
              5'h14: out_low = 10'h098;
              5'h15: out_low = 10'h097;
              5'h16: out_low = 10'h096;
              5'h17: out_low = 10'h095;
              5'h18: out_low = 10'h094;
              5'h19: out_low = 10'h094;
              5'h1a: out_low = 10'h093;
              5'h1b: out_low = 10'h092;
              5'h1c: out_low = 10'h091;
              5'h1d: out_low = 10'h090;
              5'h1e: out_low = 10'h090;
              5'h1f: out_low = 10'h08f;
              default: out_low = 10'h000;
            endcase
          end
          5'h1a: begin
            case (mant[4:0])
              5'h00: out_low = 10'h08e;
              5'h01: out_low = 10'h08d;
              5'h02: out_low = 10'h08d;
              5'h03: out_low = 10'h08c;
              5'h04: out_low = 10'h08b;
              5'h05: out_low = 10'h08a;
              5'h06: out_low = 10'h089;
              5'h07: out_low = 10'h089;
              5'h08: out_low = 10'h088;
              5'h09: out_low = 10'h087;
              5'h0a: out_low = 10'h086;
              5'h0b: out_low = 10'h085;
              5'h0c: out_low = 10'h085;
              5'h0d: out_low = 10'h084;
              5'h0e: out_low = 10'h083;
              5'h0f: out_low = 10'h082;
              5'h10: out_low = 10'h082;
              5'h11: out_low = 10'h081;
              5'h12: out_low = 10'h080;
              5'h13: out_low = 10'h07f;
              5'h14: out_low = 10'h07e;
              5'h15: out_low = 10'h07e;
              5'h16: out_low = 10'h07d;
              5'h17: out_low = 10'h07c;
              5'h18: out_low = 10'h07b;
              5'h19: out_low = 10'h07b;
              5'h1a: out_low = 10'h07a;
              5'h1b: out_low = 10'h079;
              5'h1c: out_low = 10'h078;
              5'h1d: out_low = 10'h077;
              5'h1e: out_low = 10'h077;
              5'h1f: out_low = 10'h076;
              default: out_low = 10'h000;
            endcase
          end
          5'h1b: begin
            case (mant[4:0])
              5'h00: out_low = 10'h075;
              5'h01: out_low = 10'h074;
              5'h02: out_low = 10'h074;
              5'h03: out_low = 10'h073;
              5'h04: out_low = 10'h072;
              5'h05: out_low = 10'h071;
              5'h06: out_low = 10'h071;
              5'h07: out_low = 10'h070;
              5'h08: out_low = 10'h06f;
              5'h09: out_low = 10'h06e;
              5'h0a: out_low = 10'h06d;
              5'h0b: out_low = 10'h06d;
              5'h0c: out_low = 10'h06c;
              5'h0d: out_low = 10'h06b;
              5'h0e: out_low = 10'h06a;
              5'h0f: out_low = 10'h06a;
              5'h10: out_low = 10'h069;
              5'h11: out_low = 10'h068;
              5'h12: out_low = 10'h067;
              5'h13: out_low = 10'h067;
              5'h14: out_low = 10'h066;
              5'h15: out_low = 10'h065;
              5'h16: out_low = 10'h064;
              5'h17: out_low = 10'h064;
              5'h18: out_low = 10'h063;
              5'h19: out_low = 10'h062;
              5'h1a: out_low = 10'h061;
              5'h1b: out_low = 10'h060;
              5'h1c: out_low = 10'h060;
              5'h1d: out_low = 10'h05f;
              5'h1e: out_low = 10'h05e;
              5'h1f: out_low = 10'h05d;
              default: out_low = 10'h000;
            endcase
          end
          5'h1c: begin
            case (mant[4:0])
              5'h00: out_low = 10'h05d;
              5'h01: out_low = 10'h05c;
              5'h02: out_low = 10'h05b;
              5'h03: out_low = 10'h05a;
              5'h04: out_low = 10'h05a;
              5'h05: out_low = 10'h059;
              5'h06: out_low = 10'h058;
              5'h07: out_low = 10'h057;
              5'h08: out_low = 10'h057;
              5'h09: out_low = 10'h056;
              5'h0a: out_low = 10'h055;
              5'h0b: out_low = 10'h054;
              5'h0c: out_low = 10'h054;
              5'h0d: out_low = 10'h053;
              5'h0e: out_low = 10'h052;
              5'h0f: out_low = 10'h051;
              5'h10: out_low = 10'h051;
              5'h11: out_low = 10'h050;
              5'h12: out_low = 10'h04f;
              5'h13: out_low = 10'h04e;
              5'h14: out_low = 10'h04e;
              5'h15: out_low = 10'h04d;
              5'h16: out_low = 10'h04c;
              5'h17: out_low = 10'h04b;
              5'h18: out_low = 10'h04b;
              5'h19: out_low = 10'h04a;
              5'h1a: out_low = 10'h049;
              5'h1b: out_low = 10'h048;
              5'h1c: out_low = 10'h048;
              5'h1d: out_low = 10'h047;
              5'h1e: out_low = 10'h046;
              5'h1f: out_low = 10'h045;
              default: out_low = 10'h000;
            endcase
          end
          5'h1d: begin
            case (mant[4:0])
              5'h00: out_low = 10'h045;
              5'h01: out_low = 10'h044;
              5'h02: out_low = 10'h043;
              5'h03: out_low = 10'h043;
              5'h04: out_low = 10'h042;
              5'h05: out_low = 10'h041;
              5'h06: out_low = 10'h040;
              5'h07: out_low = 10'h040;
              5'h08: out_low = 10'h03f;
              5'h09: out_low = 10'h03e;
              5'h0a: out_low = 10'h03d;
              5'h0b: out_low = 10'h03d;
              5'h0c: out_low = 10'h03c;
              5'h0d: out_low = 10'h03b;
              5'h0e: out_low = 10'h03a;
              5'h0f: out_low = 10'h03a;
              5'h10: out_low = 10'h039;
              5'h11: out_low = 10'h038;
              5'h12: out_low = 10'h038;
              5'h13: out_low = 10'h037;
              5'h14: out_low = 10'h036;
              5'h15: out_low = 10'h035;
              5'h16: out_low = 10'h035;
              5'h17: out_low = 10'h034;
              5'h18: out_low = 10'h033;
              5'h19: out_low = 10'h032;
              5'h1a: out_low = 10'h032;
              5'h1b: out_low = 10'h031;
              5'h1c: out_low = 10'h030;
              5'h1d: out_low = 10'h030;
              5'h1e: out_low = 10'h02f;
              5'h1f: out_low = 10'h02e;
              default: out_low = 10'h000;
            endcase
          end
          5'h1e: begin
            case (mant[4:0])
              5'h00: out_low = 10'h02d;
              5'h01: out_low = 10'h02d;
              5'h02: out_low = 10'h02c;
              5'h03: out_low = 10'h02b;
              5'h04: out_low = 10'h02a;
              5'h05: out_low = 10'h02a;
              5'h06: out_low = 10'h029;
              5'h07: out_low = 10'h028;
              5'h08: out_low = 10'h028;
              5'h09: out_low = 10'h027;
              5'h0a: out_low = 10'h026;
              5'h0b: out_low = 10'h025;
              5'h0c: out_low = 10'h025;
              5'h0d: out_low = 10'h024;
              5'h0e: out_low = 10'h023;
              5'h0f: out_low = 10'h023;
              5'h10: out_low = 10'h022;
              5'h11: out_low = 10'h021;
              5'h12: out_low = 10'h020;
              5'h13: out_low = 10'h020;
              5'h14: out_low = 10'h01f;
              5'h15: out_low = 10'h01e;
              5'h16: out_low = 10'h01e;
              5'h17: out_low = 10'h01d;
              5'h18: out_low = 10'h01c;
              5'h19: out_low = 10'h01b;
              5'h1a: out_low = 10'h01b;
              5'h1b: out_low = 10'h01a;
              5'h1c: out_low = 10'h019;
              5'h1d: out_low = 10'h019;
              5'h1e: out_low = 10'h018;
              5'h1f: out_low = 10'h017;
              default: out_low = 10'h000;
            endcase
          end
          5'h1f: begin
            case (mant[4:0])
              5'h00: out_low = 10'h016;
              5'h01: out_low = 10'h016;
              5'h02: out_low = 10'h015;
              5'h03: out_low = 10'h014;
              5'h04: out_low = 10'h014;
              5'h05: out_low = 10'h013;
              5'h06: out_low = 10'h012;
              5'h07: out_low = 10'h011;
              5'h08: out_low = 10'h011;
              5'h09: out_low = 10'h010;
              5'h0a: out_low = 10'h00f;
              5'h0b: out_low = 10'h00f;
              5'h0c: out_low = 10'h00e;
              5'h0d: out_low = 10'h00d;
              5'h0e: out_low = 10'h00d;
              5'h0f: out_low = 10'h00c;
              5'h10: out_low = 10'h00b;
              5'h11: out_low = 10'h00a;
              5'h12: out_low = 10'h00a;
              5'h13: out_low = 10'h009;
              5'h14: out_low = 10'h008;
              5'h15: out_low = 10'h008;
              5'h16: out_low = 10'h007;
              5'h17: out_low = 10'h006;
              5'h18: out_low = 10'h006;
              5'h19: out_low = 10'h005;
              5'h1a: out_low = 10'h004;
              5'h1b: out_low = 10'h003;
              5'h1c: out_low = 10'h003;
              5'h1d: out_low = 10'h002;
              5'h1e: out_low = 10'h001;
              5'h1f: out_low = 10'h001;
              default: out_low = 10'h000;
            endcase
          end
          default: out_low = 10'h000;
        endcase
      end
      6'h30: begin
        case (mant[9:5])
          5'h00: begin
            case (mant[4:0])
              5'h00: out_low = 10'h000;
              5'h01: out_low = 10'h3fd;
              5'h02: out_low = 10'h3fa;
              5'h03: out_low = 10'h3f8;
              5'h04: out_low = 10'h3f5;
              5'h05: out_low = 10'h3f2;
              5'h06: out_low = 10'h3ef;
              5'h07: out_low = 10'h3ed;
              5'h08: out_low = 10'h3ea;
              5'h09: out_low = 10'h3e7;
              5'h0a: out_low = 10'h3e4;
              5'h0b: out_low = 10'h3e2;
              5'h0c: out_low = 10'h3df;
              5'h0d: out_low = 10'h3dc;
              5'h0e: out_low = 10'h3da;
              5'h0f: out_low = 10'h3d7;
              5'h10: out_low = 10'h3d4;
              5'h11: out_low = 10'h3d1;
              5'h12: out_low = 10'h3cf;
              5'h13: out_low = 10'h3cc;
              5'h14: out_low = 10'h3c9;
              5'h15: out_low = 10'h3c7;
              5'h16: out_low = 10'h3c4;
              5'h17: out_low = 10'h3c1;
              5'h18: out_low = 10'h3bf;
              5'h19: out_low = 10'h3bc;
              5'h1a: out_low = 10'h3b9;
              5'h1b: out_low = 10'h3b6;
              5'h1c: out_low = 10'h3b4;
              5'h1d: out_low = 10'h3b1;
              5'h1e: out_low = 10'h3ae;
              5'h1f: out_low = 10'h3ac;
              default: out_low = 10'h000;
            endcase
          end
          5'h01: begin
            case (mant[4:0])
              5'h00: out_low = 10'h3a9;
              5'h01: out_low = 10'h3a7;
              5'h02: out_low = 10'h3a4;
              5'h03: out_low = 10'h3a1;
              5'h04: out_low = 10'h39f;
              5'h05: out_low = 10'h39c;
              5'h06: out_low = 10'h399;
              5'h07: out_low = 10'h397;
              5'h08: out_low = 10'h394;
              5'h09: out_low = 10'h391;
              5'h0a: out_low = 10'h38f;
              5'h0b: out_low = 10'h38c;
              5'h0c: out_low = 10'h38a;
              5'h0d: out_low = 10'h387;
              5'h0e: out_low = 10'h384;
              5'h0f: out_low = 10'h382;
              5'h10: out_low = 10'h37f;
              5'h11: out_low = 10'h37d;
              5'h12: out_low = 10'h37a;
              5'h13: out_low = 10'h377;
              5'h14: out_low = 10'h375;
              5'h15: out_low = 10'h372;
              5'h16: out_low = 10'h370;
              5'h17: out_low = 10'h36d;
              5'h18: out_low = 10'h36a;
              5'h19: out_low = 10'h368;
              5'h1a: out_low = 10'h365;
              5'h1b: out_low = 10'h363;
              5'h1c: out_low = 10'h360;
              5'h1d: out_low = 10'h35e;
              5'h1e: out_low = 10'h35b;
              5'h1f: out_low = 10'h359;
              default: out_low = 10'h000;
            endcase
          end
          5'h02: begin
            case (mant[4:0])
              5'h00: out_low = 10'h356;
              5'h01: out_low = 10'h353;
              5'h02: out_low = 10'h351;
              5'h03: out_low = 10'h34e;
              5'h04: out_low = 10'h34c;
              5'h05: out_low = 10'h349;
              5'h06: out_low = 10'h347;
              5'h07: out_low = 10'h344;
              5'h08: out_low = 10'h342;
              5'h09: out_low = 10'h33f;
              5'h0a: out_low = 10'h33d;
              5'h0b: out_low = 10'h33a;
              5'h0c: out_low = 10'h338;
              5'h0d: out_low = 10'h335;
              5'h0e: out_low = 10'h333;
              5'h0f: out_low = 10'h330;
              5'h10: out_low = 10'h32e;
              5'h11: out_low = 10'h32b;
              5'h12: out_low = 10'h329;
              5'h13: out_low = 10'h326;
              5'h14: out_low = 10'h324;
              5'h15: out_low = 10'h321;
              5'h16: out_low = 10'h31f;
              5'h17: out_low = 10'h31c;
              5'h18: out_low = 10'h31a;
              5'h19: out_low = 10'h318;
              5'h1a: out_low = 10'h315;
              5'h1b: out_low = 10'h313;
              5'h1c: out_low = 10'h310;
              5'h1d: out_low = 10'h30e;
              5'h1e: out_low = 10'h30b;
              5'h1f: out_low = 10'h309;
              default: out_low = 10'h000;
            endcase
          end
          5'h03: begin
            case (mant[4:0])
              5'h00: out_low = 10'h306;
              5'h01: out_low = 10'h304;
              5'h02: out_low = 10'h302;
              5'h03: out_low = 10'h2ff;
              5'h04: out_low = 10'h2fd;
              5'h05: out_low = 10'h2fa;
              5'h06: out_low = 10'h2f8;
              5'h07: out_low = 10'h2f5;
              5'h08: out_low = 10'h2f3;
              5'h09: out_low = 10'h2f1;
              5'h0a: out_low = 10'h2ee;
              5'h0b: out_low = 10'h2ec;
              5'h0c: out_low = 10'h2e9;
              5'h0d: out_low = 10'h2e7;
              5'h0e: out_low = 10'h2e5;
              5'h0f: out_low = 10'h2e2;
              5'h10: out_low = 10'h2e0;
              5'h11: out_low = 10'h2dd;
              5'h12: out_low = 10'h2db;
              5'h13: out_low = 10'h2d9;
              5'h14: out_low = 10'h2d6;
              5'h15: out_low = 10'h2d4;
              5'h16: out_low = 10'h2d2;
              5'h17: out_low = 10'h2cf;
              5'h18: out_low = 10'h2cd;
              5'h19: out_low = 10'h2cb;
              5'h1a: out_low = 10'h2c8;
              5'h1b: out_low = 10'h2c6;
              5'h1c: out_low = 10'h2c4;
              5'h1d: out_low = 10'h2c1;
              5'h1e: out_low = 10'h2bf;
              5'h1f: out_low = 10'h2bc;
              default: out_low = 10'h000;
            endcase
          end
          5'h04: begin
            case (mant[4:0])
              5'h00: out_low = 10'h2ba;
              5'h01: out_low = 10'h2b8;
              5'h02: out_low = 10'h2b5;
              5'h03: out_low = 10'h2b3;
              5'h04: out_low = 10'h2b1;
              5'h05: out_low = 10'h2af;
              5'h06: out_low = 10'h2ac;
              5'h07: out_low = 10'h2aa;
              5'h08: out_low = 10'h2a8;
              5'h09: out_low = 10'h2a5;
              5'h0a: out_low = 10'h2a3;
              5'h0b: out_low = 10'h2a1;
              5'h0c: out_low = 10'h29e;
              5'h0d: out_low = 10'h29c;
              5'h0e: out_low = 10'h29a;
              5'h0f: out_low = 10'h298;
              5'h10: out_low = 10'h295;
              5'h11: out_low = 10'h293;
              5'h12: out_low = 10'h291;
              5'h13: out_low = 10'h28e;
              5'h14: out_low = 10'h28c;
              5'h15: out_low = 10'h28a;
              5'h16: out_low = 10'h288;
              5'h17: out_low = 10'h285;
              5'h18: out_low = 10'h283;
              5'h19: out_low = 10'h281;
              5'h1a: out_low = 10'h27f;
              5'h1b: out_low = 10'h27c;
              5'h1c: out_low = 10'h27a;
              5'h1d: out_low = 10'h278;
              5'h1e: out_low = 10'h276;
              5'h1f: out_low = 10'h273;
              default: out_low = 10'h000;
            endcase
          end
          5'h05: begin
            case (mant[4:0])
              5'h00: out_low = 10'h271;
              5'h01: out_low = 10'h26f;
              5'h02: out_low = 10'h26d;
              5'h03: out_low = 10'h26a;
              5'h04: out_low = 10'h268;
              5'h05: out_low = 10'h266;
              5'h06: out_low = 10'h264;
              5'h07: out_low = 10'h262;
              5'h08: out_low = 10'h25f;
              5'h09: out_low = 10'h25d;
              5'h0a: out_low = 10'h25b;
              5'h0b: out_low = 10'h259;
              5'h0c: out_low = 10'h257;
              5'h0d: out_low = 10'h254;
              5'h0e: out_low = 10'h252;
              5'h0f: out_low = 10'h250;
              5'h10: out_low = 10'h24e;
              5'h11: out_low = 10'h24c;
              5'h12: out_low = 10'h249;
              5'h13: out_low = 10'h247;
              5'h14: out_low = 10'h245;
              5'h15: out_low = 10'h243;
              5'h16: out_low = 10'h241;
              5'h17: out_low = 10'h23f;
              5'h18: out_low = 10'h23c;
              5'h19: out_low = 10'h23a;
              5'h1a: out_low = 10'h238;
              5'h1b: out_low = 10'h236;
              5'h1c: out_low = 10'h234;
              5'h1d: out_low = 10'h232;
              5'h1e: out_low = 10'h230;
              5'h1f: out_low = 10'h22d;
              default: out_low = 10'h000;
            endcase
          end
          5'h06: begin
            case (mant[4:0])
              5'h00: out_low = 10'h22b;
              5'h01: out_low = 10'h229;
              5'h02: out_low = 10'h227;
              5'h03: out_low = 10'h225;
              5'h04: out_low = 10'h223;
              5'h05: out_low = 10'h221;
              5'h06: out_low = 10'h21e;
              5'h07: out_low = 10'h21c;
              5'h08: out_low = 10'h21a;
              5'h09: out_low = 10'h218;
              5'h0a: out_low = 10'h216;
              5'h0b: out_low = 10'h214;
              5'h0c: out_low = 10'h212;
              5'h0d: out_low = 10'h210;
              5'h0e: out_low = 10'h20e;
              5'h0f: out_low = 10'h20b;
              5'h10: out_low = 10'h209;
              5'h11: out_low = 10'h207;
              5'h12: out_low = 10'h205;
              5'h13: out_low = 10'h203;
              5'h14: out_low = 10'h201;
              5'h15: out_low = 10'h1ff;
              5'h16: out_low = 10'h1fd;
              5'h17: out_low = 10'h1fb;
              5'h18: out_low = 10'h1f9;
              5'h19: out_low = 10'h1f7;
              5'h1a: out_low = 10'h1f5;
              5'h1b: out_low = 10'h1f3;
              5'h1c: out_low = 10'h1f0;
              5'h1d: out_low = 10'h1ee;
              5'h1e: out_low = 10'h1ec;
              5'h1f: out_low = 10'h1ea;
              default: out_low = 10'h000;
            endcase
          end
          5'h07: begin
            case (mant[4:0])
              5'h00: out_low = 10'h1e8;
              5'h01: out_low = 10'h1e6;
              5'h02: out_low = 10'h1e4;
              5'h03: out_low = 10'h1e2;
              5'h04: out_low = 10'h1e0;
              5'h05: out_low = 10'h1de;
              5'h06: out_low = 10'h1dc;
              5'h07: out_low = 10'h1da;
              5'h08: out_low = 10'h1d8;
              5'h09: out_low = 10'h1d6;
              5'h0a: out_low = 10'h1d4;
              5'h0b: out_low = 10'h1d2;
              5'h0c: out_low = 10'h1d0;
              5'h0d: out_low = 10'h1ce;
              5'h0e: out_low = 10'h1cc;
              5'h0f: out_low = 10'h1ca;
              5'h10: out_low = 10'h1c8;
              5'h11: out_low = 10'h1c6;
              5'h12: out_low = 10'h1c4;
              5'h13: out_low = 10'h1c2;
              5'h14: out_low = 10'h1c0;
              5'h15: out_low = 10'h1be;
              5'h16: out_low = 10'h1bc;
              5'h17: out_low = 10'h1ba;
              5'h18: out_low = 10'h1b8;
              5'h19: out_low = 10'h1b6;
              5'h1a: out_low = 10'h1b4;
              5'h1b: out_low = 10'h1b2;
              5'h1c: out_low = 10'h1b0;
              5'h1d: out_low = 10'h1ae;
              5'h1e: out_low = 10'h1ac;
              5'h1f: out_low = 10'h1aa;
              default: out_low = 10'h000;
            endcase
          end
          5'h08: begin
            case (mant[4:0])
              5'h00: out_low = 10'h1a8;
              5'h01: out_low = 10'h1a6;
              5'h02: out_low = 10'h1a4;
              5'h03: out_low = 10'h1a2;
              5'h04: out_low = 10'h1a0;
              5'h05: out_low = 10'h19e;
              5'h06: out_low = 10'h19c;
              5'h07: out_low = 10'h19a;
              5'h08: out_low = 10'h199;
              5'h09: out_low = 10'h197;
              5'h0a: out_low = 10'h195;
              5'h0b: out_low = 10'h193;
              5'h0c: out_low = 10'h191;
              5'h0d: out_low = 10'h18f;
              5'h0e: out_low = 10'h18d;
              5'h0f: out_low = 10'h18b;
              5'h10: out_low = 10'h189;
              5'h11: out_low = 10'h187;
              5'h12: out_low = 10'h185;
              5'h13: out_low = 10'h183;
              5'h14: out_low = 10'h181;
              5'h15: out_low = 10'h180;
              5'h16: out_low = 10'h17e;
              5'h17: out_low = 10'h17c;
              5'h18: out_low = 10'h17a;
              5'h19: out_low = 10'h178;
              5'h1a: out_low = 10'h176;
              5'h1b: out_low = 10'h174;
              5'h1c: out_low = 10'h172;
              5'h1d: out_low = 10'h170;
              5'h1e: out_low = 10'h16f;
              5'h1f: out_low = 10'h16d;
              default: out_low = 10'h000;
            endcase
          end
          5'h09: begin
            case (mant[4:0])
              5'h00: out_low = 10'h16b;
              5'h01: out_low = 10'h169;
              5'h02: out_low = 10'h167;
              5'h03: out_low = 10'h165;
              5'h04: out_low = 10'h163;
              5'h05: out_low = 10'h161;
              5'h06: out_low = 10'h160;
              5'h07: out_low = 10'h15e;
              5'h08: out_low = 10'h15c;
              5'h09: out_low = 10'h15a;
              5'h0a: out_low = 10'h158;
              5'h0b: out_low = 10'h156;
              5'h0c: out_low = 10'h154;
              5'h0d: out_low = 10'h153;
              5'h0e: out_low = 10'h151;
              5'h0f: out_low = 10'h14f;
              5'h10: out_low = 10'h14d;
              5'h11: out_low = 10'h14b;
              5'h12: out_low = 10'h149;
              5'h13: out_low = 10'h148;
              5'h14: out_low = 10'h146;
              5'h15: out_low = 10'h144;
              5'h16: out_low = 10'h142;
              5'h17: out_low = 10'h140;
              5'h18: out_low = 10'h13e;
              5'h19: out_low = 10'h13d;
              5'h1a: out_low = 10'h13b;
              5'h1b: out_low = 10'h139;
              5'h1c: out_low = 10'h137;
              5'h1d: out_low = 10'h135;
              5'h1e: out_low = 10'h134;
              5'h1f: out_low = 10'h132;
              default: out_low = 10'h000;
            endcase
          end
          5'h0a: begin
            case (mant[4:0])
              5'h00: out_low = 10'h130;
              5'h01: out_low = 10'h12e;
              5'h02: out_low = 10'h12c;
              5'h03: out_low = 10'h12b;
              5'h04: out_low = 10'h129;
              5'h05: out_low = 10'h127;
              5'h06: out_low = 10'h125;
              5'h07: out_low = 10'h123;
              5'h08: out_low = 10'h122;
              5'h09: out_low = 10'h120;
              5'h0a: out_low = 10'h11e;
              5'h0b: out_low = 10'h11c;
              5'h0c: out_low = 10'h11b;
              5'h0d: out_low = 10'h119;
              5'h0e: out_low = 10'h117;
              5'h0f: out_low = 10'h115;
              5'h10: out_low = 10'h114;
              5'h11: out_low = 10'h112;
              5'h12: out_low = 10'h110;
              5'h13: out_low = 10'h10e;
              5'h14: out_low = 10'h10c;
              5'h15: out_low = 10'h10b;
              5'h16: out_low = 10'h109;
              5'h17: out_low = 10'h107;
              5'h18: out_low = 10'h106;
              5'h19: out_low = 10'h104;
              5'h1a: out_low = 10'h102;
              5'h1b: out_low = 10'h100;
              5'h1c: out_low = 10'h0ff;
              5'h1d: out_low = 10'h0fd;
              5'h1e: out_low = 10'h0fb;
              5'h1f: out_low = 10'h0f9;
              default: out_low = 10'h000;
            endcase
          end
          5'h0b: begin
            case (mant[4:0])
              5'h00: out_low = 10'h0f8;
              5'h01: out_low = 10'h0f6;
              5'h02: out_low = 10'h0f4;
              5'h03: out_low = 10'h0f3;
              5'h04: out_low = 10'h0f1;
              5'h05: out_low = 10'h0ef;
              5'h06: out_low = 10'h0ed;
              5'h07: out_low = 10'h0ec;
              5'h08: out_low = 10'h0ea;
              5'h09: out_low = 10'h0e8;
              5'h0a: out_low = 10'h0e7;
              5'h0b: out_low = 10'h0e5;
              5'h0c: out_low = 10'h0e3;
              5'h0d: out_low = 10'h0e1;
              5'h0e: out_low = 10'h0e0;
              5'h0f: out_low = 10'h0de;
              5'h10: out_low = 10'h0dc;
              5'h11: out_low = 10'h0db;
              5'h12: out_low = 10'h0d9;
              5'h13: out_low = 10'h0d7;
              5'h14: out_low = 10'h0d6;
              5'h15: out_low = 10'h0d4;
              5'h16: out_low = 10'h0d2;
              5'h17: out_low = 10'h0d1;
              5'h18: out_low = 10'h0cf;
              5'h19: out_low = 10'h0cd;
              5'h1a: out_low = 10'h0cc;
              5'h1b: out_low = 10'h0ca;
              5'h1c: out_low = 10'h0c8;
              5'h1d: out_low = 10'h0c7;
              5'h1e: out_low = 10'h0c5;
              5'h1f: out_low = 10'h0c3;
              default: out_low = 10'h000;
            endcase
          end
          5'h0c: begin
            case (mant[4:0])
              5'h00: out_low = 10'h0c2;
              5'h01: out_low = 10'h0c0;
              5'h02: out_low = 10'h0be;
              5'h03: out_low = 10'h0bd;
              5'h04: out_low = 10'h0bb;
              5'h05: out_low = 10'h0ba;
              5'h06: out_low = 10'h0b8;
              5'h07: out_low = 10'h0b6;
              5'h08: out_low = 10'h0b5;
              5'h09: out_low = 10'h0b3;
              5'h0a: out_low = 10'h0b1;
              5'h0b: out_low = 10'h0b0;
              5'h0c: out_low = 10'h0ae;
              5'h0d: out_low = 10'h0ad;
              5'h0e: out_low = 10'h0ab;
              5'h0f: out_low = 10'h0a9;
              5'h10: out_low = 10'h0a8;
              5'h11: out_low = 10'h0a6;
              5'h12: out_low = 10'h0a4;
              5'h13: out_low = 10'h0a3;
              5'h14: out_low = 10'h0a1;
              5'h15: out_low = 10'h0a0;
              5'h16: out_low = 10'h09e;
              5'h17: out_low = 10'h09c;
              5'h18: out_low = 10'h09b;
              5'h19: out_low = 10'h099;
              5'h1a: out_low = 10'h098;
              5'h1b: out_low = 10'h096;
              5'h1c: out_low = 10'h094;
              5'h1d: out_low = 10'h093;
              5'h1e: out_low = 10'h091;
              5'h1f: out_low = 10'h090;
              default: out_low = 10'h000;
            endcase
          end
          5'h0d: begin
            case (mant[4:0])
              5'h00: out_low = 10'h08e;
              5'h01: out_low = 10'h08d;
              5'h02: out_low = 10'h08b;
              5'h03: out_low = 10'h089;
              5'h04: out_low = 10'h088;
              5'h05: out_low = 10'h086;
              5'h06: out_low = 10'h085;
              5'h07: out_low = 10'h083;
              5'h08: out_low = 10'h082;
              5'h09: out_low = 10'h080;
              5'h0a: out_low = 10'h07e;
              5'h0b: out_low = 10'h07d;
              5'h0c: out_low = 10'h07b;
              5'h0d: out_low = 10'h07a;
              5'h0e: out_low = 10'h078;
              5'h0f: out_low = 10'h077;
              5'h10: out_low = 10'h075;
              5'h11: out_low = 10'h074;
              5'h12: out_low = 10'h072;
              5'h13: out_low = 10'h071;
              5'h14: out_low = 10'h06f;
              5'h15: out_low = 10'h06d;
              5'h16: out_low = 10'h06c;
              5'h17: out_low = 10'h06a;
              5'h18: out_low = 10'h069;
              5'h19: out_low = 10'h067;
              5'h1a: out_low = 10'h066;
              5'h1b: out_low = 10'h064;
              5'h1c: out_low = 10'h063;
              5'h1d: out_low = 10'h061;
              5'h1e: out_low = 10'h060;
              5'h1f: out_low = 10'h05e;
              default: out_low = 10'h000;
            endcase
          end
          5'h0e: begin
            case (mant[4:0])
              5'h00: out_low = 10'h05d;
              5'h01: out_low = 10'h05b;
              5'h02: out_low = 10'h05a;
              5'h03: out_low = 10'h058;
              5'h04: out_low = 10'h057;
              5'h05: out_low = 10'h055;
              5'h06: out_low = 10'h054;
              5'h07: out_low = 10'h052;
              5'h08: out_low = 10'h051;
              5'h09: out_low = 10'h04f;
              5'h0a: out_low = 10'h04e;
              5'h0b: out_low = 10'h04c;
              5'h0c: out_low = 10'h04b;
              5'h0d: out_low = 10'h049;
              5'h0e: out_low = 10'h048;
              5'h0f: out_low = 10'h046;
              5'h10: out_low = 10'h045;
              5'h11: out_low = 10'h043;
              5'h12: out_low = 10'h042;
              5'h13: out_low = 10'h040;
              5'h14: out_low = 10'h03f;
              5'h15: out_low = 10'h03d;
              5'h16: out_low = 10'h03c;
              5'h17: out_low = 10'h03a;
              5'h18: out_low = 10'h039;
              5'h19: out_low = 10'h038;
              5'h1a: out_low = 10'h036;
              5'h1b: out_low = 10'h035;
              5'h1c: out_low = 10'h033;
              5'h1d: out_low = 10'h032;
              5'h1e: out_low = 10'h030;
              5'h1f: out_low = 10'h02f;
              default: out_low = 10'h000;
            endcase
          end
          5'h0f: begin
            case (mant[4:0])
              5'h00: out_low = 10'h02d;
              5'h01: out_low = 10'h02c;
              5'h02: out_low = 10'h02a;
              5'h03: out_low = 10'h029;
              5'h04: out_low = 10'h028;
              5'h05: out_low = 10'h026;
              5'h06: out_low = 10'h025;
              5'h07: out_low = 10'h023;
              5'h08: out_low = 10'h022;
              5'h09: out_low = 10'h020;
              5'h0a: out_low = 10'h01f;
              5'h0b: out_low = 10'h01e;
              5'h0c: out_low = 10'h01c;
              5'h0d: out_low = 10'h01b;
              5'h0e: out_low = 10'h019;
              5'h0f: out_low = 10'h018;
              5'h10: out_low = 10'h016;
              5'h11: out_low = 10'h015;
              5'h12: out_low = 10'h014;
              5'h13: out_low = 10'h012;
              5'h14: out_low = 10'h011;
              5'h15: out_low = 10'h00f;
              5'h16: out_low = 10'h00e;
              5'h17: out_low = 10'h00d;
              5'h18: out_low = 10'h00b;
              5'h19: out_low = 10'h00a;
              5'h1a: out_low = 10'h008;
              5'h1b: out_low = 10'h007;
              5'h1c: out_low = 10'h006;
              5'h1d: out_low = 10'h004;
              5'h1e: out_low = 10'h003;
              5'h1f: out_low = 10'h001;
              default: out_low = 10'h000;
            endcase
          end
          5'h10: begin
            case (mant[4:0])
              5'h00: out_low = 10'h000;
              5'h01: out_low = 10'h3fd;
              5'h02: out_low = 10'h3fa;
              5'h03: out_low = 10'h3f8;
              5'h04: out_low = 10'h3f5;
              5'h05: out_low = 10'h3f2;
              5'h06: out_low = 10'h3ef;
              5'h07: out_low = 10'h3ed;
              5'h08: out_low = 10'h3ea;
              5'h09: out_low = 10'h3e7;
              5'h0a: out_low = 10'h3e4;
              5'h0b: out_low = 10'h3e2;
              5'h0c: out_low = 10'h3df;
              5'h0d: out_low = 10'h3dc;
              5'h0e: out_low = 10'h3da;
              5'h0f: out_low = 10'h3d7;
              5'h10: out_low = 10'h3d4;
              5'h11: out_low = 10'h3d1;
              5'h12: out_low = 10'h3cf;
              5'h13: out_low = 10'h3cc;
              5'h14: out_low = 10'h3c9;
              5'h15: out_low = 10'h3c7;
              5'h16: out_low = 10'h3c4;
              5'h17: out_low = 10'h3c1;
              5'h18: out_low = 10'h3bf;
              5'h19: out_low = 10'h3bc;
              5'h1a: out_low = 10'h3b9;
              5'h1b: out_low = 10'h3b6;
              5'h1c: out_low = 10'h3b4;
              5'h1d: out_low = 10'h3b1;
              5'h1e: out_low = 10'h3ae;
              5'h1f: out_low = 10'h3ac;
              default: out_low = 10'h000;
            endcase
          end
          5'h11: begin
            case (mant[4:0])
              5'h00: out_low = 10'h3a9;
              5'h01: out_low = 10'h3a7;
              5'h02: out_low = 10'h3a4;
              5'h03: out_low = 10'h3a1;
              5'h04: out_low = 10'h39f;
              5'h05: out_low = 10'h39c;
              5'h06: out_low = 10'h399;
              5'h07: out_low = 10'h397;
              5'h08: out_low = 10'h394;
              5'h09: out_low = 10'h391;
              5'h0a: out_low = 10'h38f;
              5'h0b: out_low = 10'h38c;
              5'h0c: out_low = 10'h38a;
              5'h0d: out_low = 10'h387;
              5'h0e: out_low = 10'h384;
              5'h0f: out_low = 10'h382;
              5'h10: out_low = 10'h37f;
              5'h11: out_low = 10'h37d;
              5'h12: out_low = 10'h37a;
              5'h13: out_low = 10'h377;
              5'h14: out_low = 10'h375;
              5'h15: out_low = 10'h372;
              5'h16: out_low = 10'h370;
              5'h17: out_low = 10'h36d;
              5'h18: out_low = 10'h36a;
              5'h19: out_low = 10'h368;
              5'h1a: out_low = 10'h365;
              5'h1b: out_low = 10'h363;
              5'h1c: out_low = 10'h360;
              5'h1d: out_low = 10'h35e;
              5'h1e: out_low = 10'h35b;
              5'h1f: out_low = 10'h359;
              default: out_low = 10'h000;
            endcase
          end
          5'h12: begin
            case (mant[4:0])
              5'h00: out_low = 10'h356;
              5'h01: out_low = 10'h353;
              5'h02: out_low = 10'h351;
              5'h03: out_low = 10'h34e;
              5'h04: out_low = 10'h34c;
              5'h05: out_low = 10'h349;
              5'h06: out_low = 10'h347;
              5'h07: out_low = 10'h344;
              5'h08: out_low = 10'h342;
              5'h09: out_low = 10'h33f;
              5'h0a: out_low = 10'h33d;
              5'h0b: out_low = 10'h33a;
              5'h0c: out_low = 10'h338;
              5'h0d: out_low = 10'h335;
              5'h0e: out_low = 10'h333;
              5'h0f: out_low = 10'h330;
              5'h10: out_low = 10'h32e;
              5'h11: out_low = 10'h32b;
              5'h12: out_low = 10'h329;
              5'h13: out_low = 10'h326;
              5'h14: out_low = 10'h324;
              5'h15: out_low = 10'h321;
              5'h16: out_low = 10'h31f;
              5'h17: out_low = 10'h31c;
              5'h18: out_low = 10'h31a;
              5'h19: out_low = 10'h318;
              5'h1a: out_low = 10'h315;
              5'h1b: out_low = 10'h313;
              5'h1c: out_low = 10'h310;
              5'h1d: out_low = 10'h30e;
              5'h1e: out_low = 10'h30b;
              5'h1f: out_low = 10'h309;
              default: out_low = 10'h000;
            endcase
          end
          5'h13: begin
            case (mant[4:0])
              5'h00: out_low = 10'h306;
              5'h01: out_low = 10'h304;
              5'h02: out_low = 10'h302;
              5'h03: out_low = 10'h2ff;
              5'h04: out_low = 10'h2fd;
              5'h05: out_low = 10'h2fa;
              5'h06: out_low = 10'h2f8;
              5'h07: out_low = 10'h2f5;
              5'h08: out_low = 10'h2f3;
              5'h09: out_low = 10'h2f1;
              5'h0a: out_low = 10'h2ee;
              5'h0b: out_low = 10'h2ec;
              5'h0c: out_low = 10'h2e9;
              5'h0d: out_low = 10'h2e7;
              5'h0e: out_low = 10'h2e5;
              5'h0f: out_low = 10'h2e2;
              5'h10: out_low = 10'h2e0;
              5'h11: out_low = 10'h2dd;
              5'h12: out_low = 10'h2db;
              5'h13: out_low = 10'h2d9;
              5'h14: out_low = 10'h2d6;
              5'h15: out_low = 10'h2d4;
              5'h16: out_low = 10'h2d2;
              5'h17: out_low = 10'h2cf;
              5'h18: out_low = 10'h2cd;
              5'h19: out_low = 10'h2cb;
              5'h1a: out_low = 10'h2c8;
              5'h1b: out_low = 10'h2c6;
              5'h1c: out_low = 10'h2c4;
              5'h1d: out_low = 10'h2c1;
              5'h1e: out_low = 10'h2bf;
              5'h1f: out_low = 10'h2bc;
              default: out_low = 10'h000;
            endcase
          end
          5'h14: begin
            case (mant[4:0])
              5'h00: out_low = 10'h2ba;
              5'h01: out_low = 10'h2b8;
              5'h02: out_low = 10'h2b5;
              5'h03: out_low = 10'h2b3;
              5'h04: out_low = 10'h2b1;
              5'h05: out_low = 10'h2af;
              5'h06: out_low = 10'h2ac;
              5'h07: out_low = 10'h2aa;
              5'h08: out_low = 10'h2a8;
              5'h09: out_low = 10'h2a5;
              5'h0a: out_low = 10'h2a3;
              5'h0b: out_low = 10'h2a1;
              5'h0c: out_low = 10'h29e;
              5'h0d: out_low = 10'h29c;
              5'h0e: out_low = 10'h29a;
              5'h0f: out_low = 10'h298;
              5'h10: out_low = 10'h295;
              5'h11: out_low = 10'h293;
              5'h12: out_low = 10'h291;
              5'h13: out_low = 10'h28e;
              5'h14: out_low = 10'h28c;
              5'h15: out_low = 10'h28a;
              5'h16: out_low = 10'h288;
              5'h17: out_low = 10'h285;
              5'h18: out_low = 10'h283;
              5'h19: out_low = 10'h281;
              5'h1a: out_low = 10'h27f;
              5'h1b: out_low = 10'h27c;
              5'h1c: out_low = 10'h27a;
              5'h1d: out_low = 10'h278;
              5'h1e: out_low = 10'h276;
              5'h1f: out_low = 10'h273;
              default: out_low = 10'h000;
            endcase
          end
          5'h15: begin
            case (mant[4:0])
              5'h00: out_low = 10'h271;
              5'h01: out_low = 10'h26f;
              5'h02: out_low = 10'h26d;
              5'h03: out_low = 10'h26a;
              5'h04: out_low = 10'h268;
              5'h05: out_low = 10'h266;
              5'h06: out_low = 10'h264;
              5'h07: out_low = 10'h262;
              5'h08: out_low = 10'h25f;
              5'h09: out_low = 10'h25d;
              5'h0a: out_low = 10'h25b;
              5'h0b: out_low = 10'h259;
              5'h0c: out_low = 10'h257;
              5'h0d: out_low = 10'h254;
              5'h0e: out_low = 10'h252;
              5'h0f: out_low = 10'h250;
              5'h10: out_low = 10'h24e;
              5'h11: out_low = 10'h24c;
              5'h12: out_low = 10'h249;
              5'h13: out_low = 10'h247;
              5'h14: out_low = 10'h245;
              5'h15: out_low = 10'h243;
              5'h16: out_low = 10'h241;
              5'h17: out_low = 10'h23f;
              5'h18: out_low = 10'h23c;
              5'h19: out_low = 10'h23a;
              5'h1a: out_low = 10'h238;
              5'h1b: out_low = 10'h236;
              5'h1c: out_low = 10'h234;
              5'h1d: out_low = 10'h232;
              5'h1e: out_low = 10'h230;
              5'h1f: out_low = 10'h22d;
              default: out_low = 10'h000;
            endcase
          end
          5'h16: begin
            case (mant[4:0])
              5'h00: out_low = 10'h22b;
              5'h01: out_low = 10'h229;
              5'h02: out_low = 10'h227;
              5'h03: out_low = 10'h225;
              5'h04: out_low = 10'h223;
              5'h05: out_low = 10'h221;
              5'h06: out_low = 10'h21e;
              5'h07: out_low = 10'h21c;
              5'h08: out_low = 10'h21a;
              5'h09: out_low = 10'h218;
              5'h0a: out_low = 10'h216;
              5'h0b: out_low = 10'h214;
              5'h0c: out_low = 10'h212;
              5'h0d: out_low = 10'h210;
              5'h0e: out_low = 10'h20e;
              5'h0f: out_low = 10'h20b;
              5'h10: out_low = 10'h209;
              5'h11: out_low = 10'h207;
              5'h12: out_low = 10'h205;
              5'h13: out_low = 10'h203;
              5'h14: out_low = 10'h201;
              5'h15: out_low = 10'h1ff;
              5'h16: out_low = 10'h1fd;
              5'h17: out_low = 10'h1fb;
              5'h18: out_low = 10'h1f9;
              5'h19: out_low = 10'h1f7;
              5'h1a: out_low = 10'h1f5;
              5'h1b: out_low = 10'h1f3;
              5'h1c: out_low = 10'h1f0;
              5'h1d: out_low = 10'h1ee;
              5'h1e: out_low = 10'h1ec;
              5'h1f: out_low = 10'h1ea;
              default: out_low = 10'h000;
            endcase
          end
          5'h17: begin
            case (mant[4:0])
              5'h00: out_low = 10'h1e8;
              5'h01: out_low = 10'h1e6;
              5'h02: out_low = 10'h1e4;
              5'h03: out_low = 10'h1e2;
              5'h04: out_low = 10'h1e0;
              5'h05: out_low = 10'h1de;
              5'h06: out_low = 10'h1dc;
              5'h07: out_low = 10'h1da;
              5'h08: out_low = 10'h1d8;
              5'h09: out_low = 10'h1d6;
              5'h0a: out_low = 10'h1d4;
              5'h0b: out_low = 10'h1d2;
              5'h0c: out_low = 10'h1d0;
              5'h0d: out_low = 10'h1ce;
              5'h0e: out_low = 10'h1cc;
              5'h0f: out_low = 10'h1ca;
              5'h10: out_low = 10'h1c8;
              5'h11: out_low = 10'h1c6;
              5'h12: out_low = 10'h1c4;
              5'h13: out_low = 10'h1c2;
              5'h14: out_low = 10'h1c0;
              5'h15: out_low = 10'h1be;
              5'h16: out_low = 10'h1bc;
              5'h17: out_low = 10'h1ba;
              5'h18: out_low = 10'h1b8;
              5'h19: out_low = 10'h1b6;
              5'h1a: out_low = 10'h1b4;
              5'h1b: out_low = 10'h1b2;
              5'h1c: out_low = 10'h1b0;
              5'h1d: out_low = 10'h1ae;
              5'h1e: out_low = 10'h1ac;
              5'h1f: out_low = 10'h1aa;
              default: out_low = 10'h000;
            endcase
          end
          5'h18: begin
            case (mant[4:0])
              5'h00: out_low = 10'h1a8;
              5'h01: out_low = 10'h1a6;
              5'h02: out_low = 10'h1a4;
              5'h03: out_low = 10'h1a2;
              5'h04: out_low = 10'h1a0;
              5'h05: out_low = 10'h19e;
              5'h06: out_low = 10'h19c;
              5'h07: out_low = 10'h19a;
              5'h08: out_low = 10'h199;
              5'h09: out_low = 10'h197;
              5'h0a: out_low = 10'h195;
              5'h0b: out_low = 10'h193;
              5'h0c: out_low = 10'h191;
              5'h0d: out_low = 10'h18f;
              5'h0e: out_low = 10'h18d;
              5'h0f: out_low = 10'h18b;
              5'h10: out_low = 10'h189;
              5'h11: out_low = 10'h187;
              5'h12: out_low = 10'h185;
              5'h13: out_low = 10'h183;
              5'h14: out_low = 10'h181;
              5'h15: out_low = 10'h180;
              5'h16: out_low = 10'h17e;
              5'h17: out_low = 10'h17c;
              5'h18: out_low = 10'h17a;
              5'h19: out_low = 10'h178;
              5'h1a: out_low = 10'h176;
              5'h1b: out_low = 10'h174;
              5'h1c: out_low = 10'h172;
              5'h1d: out_low = 10'h170;
              5'h1e: out_low = 10'h16f;
              5'h1f: out_low = 10'h16d;
              default: out_low = 10'h000;
            endcase
          end
          5'h19: begin
            case (mant[4:0])
              5'h00: out_low = 10'h16b;
              5'h01: out_low = 10'h169;
              5'h02: out_low = 10'h167;
              5'h03: out_low = 10'h165;
              5'h04: out_low = 10'h163;
              5'h05: out_low = 10'h161;
              5'h06: out_low = 10'h160;
              5'h07: out_low = 10'h15e;
              5'h08: out_low = 10'h15c;
              5'h09: out_low = 10'h15a;
              5'h0a: out_low = 10'h158;
              5'h0b: out_low = 10'h156;
              5'h0c: out_low = 10'h154;
              5'h0d: out_low = 10'h153;
              5'h0e: out_low = 10'h151;
              5'h0f: out_low = 10'h14f;
              5'h10: out_low = 10'h14d;
              5'h11: out_low = 10'h14b;
              5'h12: out_low = 10'h149;
              5'h13: out_low = 10'h148;
              5'h14: out_low = 10'h146;
              5'h15: out_low = 10'h144;
              5'h16: out_low = 10'h142;
              5'h17: out_low = 10'h140;
              5'h18: out_low = 10'h13e;
              5'h19: out_low = 10'h13d;
              5'h1a: out_low = 10'h13b;
              5'h1b: out_low = 10'h139;
              5'h1c: out_low = 10'h137;
              5'h1d: out_low = 10'h135;
              5'h1e: out_low = 10'h134;
              5'h1f: out_low = 10'h132;
              default: out_low = 10'h000;
            endcase
          end
          5'h1a: begin
            case (mant[4:0])
              5'h00: out_low = 10'h130;
              5'h01: out_low = 10'h12e;
              5'h02: out_low = 10'h12c;
              5'h03: out_low = 10'h12b;
              5'h04: out_low = 10'h129;
              5'h05: out_low = 10'h127;
              5'h06: out_low = 10'h125;
              5'h07: out_low = 10'h123;
              5'h08: out_low = 10'h122;
              5'h09: out_low = 10'h120;
              5'h0a: out_low = 10'h11e;
              5'h0b: out_low = 10'h11c;
              5'h0c: out_low = 10'h11b;
              5'h0d: out_low = 10'h119;
              5'h0e: out_low = 10'h117;
              5'h0f: out_low = 10'h115;
              5'h10: out_low = 10'h114;
              5'h11: out_low = 10'h112;
              5'h12: out_low = 10'h110;
              5'h13: out_low = 10'h10e;
              5'h14: out_low = 10'h10c;
              5'h15: out_low = 10'h10b;
              5'h16: out_low = 10'h109;
              5'h17: out_low = 10'h107;
              5'h18: out_low = 10'h106;
              5'h19: out_low = 10'h104;
              5'h1a: out_low = 10'h102;
              5'h1b: out_low = 10'h100;
              5'h1c: out_low = 10'h0ff;
              5'h1d: out_low = 10'h0fd;
              5'h1e: out_low = 10'h0fb;
              5'h1f: out_low = 10'h0f9;
              default: out_low = 10'h000;
            endcase
          end
          5'h1b: begin
            case (mant[4:0])
              5'h00: out_low = 10'h0f8;
              5'h01: out_low = 10'h0f6;
              5'h02: out_low = 10'h0f4;
              5'h03: out_low = 10'h0f3;
              5'h04: out_low = 10'h0f1;
              5'h05: out_low = 10'h0ef;
              5'h06: out_low = 10'h0ed;
              5'h07: out_low = 10'h0ec;
              5'h08: out_low = 10'h0ea;
              5'h09: out_low = 10'h0e8;
              5'h0a: out_low = 10'h0e7;
              5'h0b: out_low = 10'h0e5;
              5'h0c: out_low = 10'h0e3;
              5'h0d: out_low = 10'h0e1;
              5'h0e: out_low = 10'h0e0;
              5'h0f: out_low = 10'h0de;
              5'h10: out_low = 10'h0dc;
              5'h11: out_low = 10'h0db;
              5'h12: out_low = 10'h0d9;
              5'h13: out_low = 10'h0d7;
              5'h14: out_low = 10'h0d6;
              5'h15: out_low = 10'h0d4;
              5'h16: out_low = 10'h0d2;
              5'h17: out_low = 10'h0d1;
              5'h18: out_low = 10'h0cf;
              5'h19: out_low = 10'h0cd;
              5'h1a: out_low = 10'h0cc;
              5'h1b: out_low = 10'h0ca;
              5'h1c: out_low = 10'h0c8;
              5'h1d: out_low = 10'h0c7;
              5'h1e: out_low = 10'h0c5;
              5'h1f: out_low = 10'h0c3;
              default: out_low = 10'h000;
            endcase
          end
          5'h1c: begin
            case (mant[4:0])
              5'h00: out_low = 10'h0c2;
              5'h01: out_low = 10'h0c0;
              5'h02: out_low = 10'h0be;
              5'h03: out_low = 10'h0bd;
              5'h04: out_low = 10'h0bb;
              5'h05: out_low = 10'h0ba;
              5'h06: out_low = 10'h0b8;
              5'h07: out_low = 10'h0b6;
              5'h08: out_low = 10'h0b5;
              5'h09: out_low = 10'h0b3;
              5'h0a: out_low = 10'h0b1;
              5'h0b: out_low = 10'h0b0;
              5'h0c: out_low = 10'h0ae;
              5'h0d: out_low = 10'h0ad;
              5'h0e: out_low = 10'h0ab;
              5'h0f: out_low = 10'h0a9;
              5'h10: out_low = 10'h0a8;
              5'h11: out_low = 10'h0a6;
              5'h12: out_low = 10'h0a4;
              5'h13: out_low = 10'h0a3;
              5'h14: out_low = 10'h0a1;
              5'h15: out_low = 10'h0a0;
              5'h16: out_low = 10'h09e;
              5'h17: out_low = 10'h09c;
              5'h18: out_low = 10'h09b;
              5'h19: out_low = 10'h099;
              5'h1a: out_low = 10'h098;
              5'h1b: out_low = 10'h096;
              5'h1c: out_low = 10'h094;
              5'h1d: out_low = 10'h093;
              5'h1e: out_low = 10'h091;
              5'h1f: out_low = 10'h090;
              default: out_low = 10'h000;
            endcase
          end
          5'h1d: begin
            case (mant[4:0])
              5'h00: out_low = 10'h08e;
              5'h01: out_low = 10'h08d;
              5'h02: out_low = 10'h08b;
              5'h03: out_low = 10'h089;
              5'h04: out_low = 10'h088;
              5'h05: out_low = 10'h086;
              5'h06: out_low = 10'h085;
              5'h07: out_low = 10'h083;
              5'h08: out_low = 10'h082;
              5'h09: out_low = 10'h080;
              5'h0a: out_low = 10'h07e;
              5'h0b: out_low = 10'h07d;
              5'h0c: out_low = 10'h07b;
              5'h0d: out_low = 10'h07a;
              5'h0e: out_low = 10'h078;
              5'h0f: out_low = 10'h077;
              5'h10: out_low = 10'h075;
              5'h11: out_low = 10'h074;
              5'h12: out_low = 10'h072;
              5'h13: out_low = 10'h071;
              5'h14: out_low = 10'h06f;
              5'h15: out_low = 10'h06d;
              5'h16: out_low = 10'h06c;
              5'h17: out_low = 10'h06a;
              5'h18: out_low = 10'h069;
              5'h19: out_low = 10'h067;
              5'h1a: out_low = 10'h066;
              5'h1b: out_low = 10'h064;
              5'h1c: out_low = 10'h063;
              5'h1d: out_low = 10'h061;
              5'h1e: out_low = 10'h060;
              5'h1f: out_low = 10'h05e;
              default: out_low = 10'h000;
            endcase
          end
          5'h1e: begin
            case (mant[4:0])
              5'h00: out_low = 10'h05d;
              5'h01: out_low = 10'h05b;
              5'h02: out_low = 10'h05a;
              5'h03: out_low = 10'h058;
              5'h04: out_low = 10'h057;
              5'h05: out_low = 10'h055;
              5'h06: out_low = 10'h054;
              5'h07: out_low = 10'h052;
              5'h08: out_low = 10'h051;
              5'h09: out_low = 10'h04f;
              5'h0a: out_low = 10'h04e;
              5'h0b: out_low = 10'h04c;
              5'h0c: out_low = 10'h04b;
              5'h0d: out_low = 10'h049;
              5'h0e: out_low = 10'h048;
              5'h0f: out_low = 10'h046;
              5'h10: out_low = 10'h045;
              5'h11: out_low = 10'h043;
              5'h12: out_low = 10'h042;
              5'h13: out_low = 10'h040;
              5'h14: out_low = 10'h03f;
              5'h15: out_low = 10'h03d;
              5'h16: out_low = 10'h03c;
              5'h17: out_low = 10'h03a;
              5'h18: out_low = 10'h039;
              5'h19: out_low = 10'h038;
              5'h1a: out_low = 10'h036;
              5'h1b: out_low = 10'h035;
              5'h1c: out_low = 10'h033;
              5'h1d: out_low = 10'h032;
              5'h1e: out_low = 10'h030;
              5'h1f: out_low = 10'h02f;
              default: out_low = 10'h000;
            endcase
          end
          5'h1f: begin
            case (mant[4:0])
              5'h00: out_low = 10'h02d;
              5'h01: out_low = 10'h02c;
              5'h02: out_low = 10'h02a;
              5'h03: out_low = 10'h029;
              5'h04: out_low = 10'h028;
              5'h05: out_low = 10'h026;
              5'h06: out_low = 10'h025;
              5'h07: out_low = 10'h023;
              5'h08: out_low = 10'h022;
              5'h09: out_low = 10'h020;
              5'h0a: out_low = 10'h01f;
              5'h0b: out_low = 10'h01e;
              5'h0c: out_low = 10'h01c;
              5'h0d: out_low = 10'h01b;
              5'h0e: out_low = 10'h019;
              5'h0f: out_low = 10'h018;
              5'h10: out_low = 10'h016;
              5'h11: out_low = 10'h015;
              5'h12: out_low = 10'h014;
              5'h13: out_low = 10'h012;
              5'h14: out_low = 10'h011;
              5'h15: out_low = 10'h00f;
              5'h16: out_low = 10'h00e;
              5'h17: out_low = 10'h00d;
              5'h18: out_low = 10'h00b;
              5'h19: out_low = 10'h00a;
              5'h1a: out_low = 10'h008;
              5'h1b: out_low = 10'h007;
              5'h1c: out_low = 10'h006;
              5'h1d: out_low = 10'h004;
              5'h1e: out_low = 10'h003;
              5'h1f: out_low = 10'h001;
              default: out_low = 10'h000;
            endcase
          end
          default: out_low = 10'h000;
        endcase
      end
      6'h31: begin
        case (mant[9:5])
          5'h00: begin
            case (mant[4:0])
              5'h00: out_low = 10'h000;
              5'h01: out_low = 10'h3fa;
              5'h02: out_low = 10'h3f5;
              5'h03: out_low = 10'h3ef;
              5'h04: out_low = 10'h3ea;
              5'h05: out_low = 10'h3e4;
              5'h06: out_low = 10'h3df;
              5'h07: out_low = 10'h3da;
              5'h08: out_low = 10'h3d4;
              5'h09: out_low = 10'h3cf;
              5'h0a: out_low = 10'h3c9;
              5'h0b: out_low = 10'h3c4;
              5'h0c: out_low = 10'h3bf;
              5'h0d: out_low = 10'h3b9;
              5'h0e: out_low = 10'h3b4;
              5'h0f: out_low = 10'h3ae;
              5'h10: out_low = 10'h3a9;
              5'h11: out_low = 10'h3a4;
              5'h12: out_low = 10'h39f;
              5'h13: out_low = 10'h399;
              5'h14: out_low = 10'h394;
              5'h15: out_low = 10'h38f;
              5'h16: out_low = 10'h38a;
              5'h17: out_low = 10'h384;
              5'h18: out_low = 10'h37f;
              5'h19: out_low = 10'h37a;
              5'h1a: out_low = 10'h375;
              5'h1b: out_low = 10'h370;
              5'h1c: out_low = 10'h36a;
              5'h1d: out_low = 10'h365;
              5'h1e: out_low = 10'h360;
              5'h1f: out_low = 10'h35b;
              default: out_low = 10'h000;
            endcase
          end
          5'h01: begin
            case (mant[4:0])
              5'h00: out_low = 10'h356;
              5'h01: out_low = 10'h351;
              5'h02: out_low = 10'h34c;
              5'h03: out_low = 10'h347;
              5'h04: out_low = 10'h342;
              5'h05: out_low = 10'h33d;
              5'h06: out_low = 10'h338;
              5'h07: out_low = 10'h333;
              5'h08: out_low = 10'h32e;
              5'h09: out_low = 10'h329;
              5'h0a: out_low = 10'h324;
              5'h0b: out_low = 10'h31f;
              5'h0c: out_low = 10'h31a;
              5'h0d: out_low = 10'h315;
              5'h0e: out_low = 10'h310;
              5'h0f: out_low = 10'h30b;
              5'h10: out_low = 10'h306;
              5'h11: out_low = 10'h302;
              5'h12: out_low = 10'h2fd;
              5'h13: out_low = 10'h2f8;
              5'h14: out_low = 10'h2f3;
              5'h15: out_low = 10'h2ee;
              5'h16: out_low = 10'h2e9;
              5'h17: out_low = 10'h2e5;
              5'h18: out_low = 10'h2e0;
              5'h19: out_low = 10'h2db;
              5'h1a: out_low = 10'h2d6;
              5'h1b: out_low = 10'h2d2;
              5'h1c: out_low = 10'h2cd;
              5'h1d: out_low = 10'h2c8;
              5'h1e: out_low = 10'h2c4;
              5'h1f: out_low = 10'h2bf;
              default: out_low = 10'h000;
            endcase
          end
          5'h02: begin
            case (mant[4:0])
              5'h00: out_low = 10'h2ba;
              5'h01: out_low = 10'h2b5;
              5'h02: out_low = 10'h2b1;
              5'h03: out_low = 10'h2ac;
              5'h04: out_low = 10'h2a8;
              5'h05: out_low = 10'h2a3;
              5'h06: out_low = 10'h29e;
              5'h07: out_low = 10'h29a;
              5'h08: out_low = 10'h295;
              5'h09: out_low = 10'h291;
              5'h0a: out_low = 10'h28c;
              5'h0b: out_low = 10'h288;
              5'h0c: out_low = 10'h283;
              5'h0d: out_low = 10'h27f;
              5'h0e: out_low = 10'h27a;
              5'h0f: out_low = 10'h276;
              5'h10: out_low = 10'h271;
              5'h11: out_low = 10'h26d;
              5'h12: out_low = 10'h268;
              5'h13: out_low = 10'h264;
              5'h14: out_low = 10'h25f;
              5'h15: out_low = 10'h25b;
              5'h16: out_low = 10'h257;
              5'h17: out_low = 10'h252;
              5'h18: out_low = 10'h24e;
              5'h19: out_low = 10'h249;
              5'h1a: out_low = 10'h245;
              5'h1b: out_low = 10'h241;
              5'h1c: out_low = 10'h23c;
              5'h1d: out_low = 10'h238;
              5'h1e: out_low = 10'h234;
              5'h1f: out_low = 10'h230;
              default: out_low = 10'h000;
            endcase
          end
          5'h03: begin
            case (mant[4:0])
              5'h00: out_low = 10'h22b;
              5'h01: out_low = 10'h227;
              5'h02: out_low = 10'h223;
              5'h03: out_low = 10'h21e;
              5'h04: out_low = 10'h21a;
              5'h05: out_low = 10'h216;
              5'h06: out_low = 10'h212;
              5'h07: out_low = 10'h20e;
              5'h08: out_low = 10'h209;
              5'h09: out_low = 10'h205;
              5'h0a: out_low = 10'h201;
              5'h0b: out_low = 10'h1fd;
              5'h0c: out_low = 10'h1f9;
              5'h0d: out_low = 10'h1f5;
              5'h0e: out_low = 10'h1f0;
              5'h0f: out_low = 10'h1ec;
              5'h10: out_low = 10'h1e8;
              5'h11: out_low = 10'h1e4;
              5'h12: out_low = 10'h1e0;
              5'h13: out_low = 10'h1dc;
              5'h14: out_low = 10'h1d8;
              5'h15: out_low = 10'h1d4;
              5'h16: out_low = 10'h1d0;
              5'h17: out_low = 10'h1cc;
              5'h18: out_low = 10'h1c8;
              5'h19: out_low = 10'h1c4;
              5'h1a: out_low = 10'h1c0;
              5'h1b: out_low = 10'h1bc;
              5'h1c: out_low = 10'h1b8;
              5'h1d: out_low = 10'h1b4;
              5'h1e: out_low = 10'h1b0;
              5'h1f: out_low = 10'h1ac;
              default: out_low = 10'h000;
            endcase
          end
          5'h04: begin
            case (mant[4:0])
              5'h00: out_low = 10'h1a8;
              5'h01: out_low = 10'h1a4;
              5'h02: out_low = 10'h1a0;
              5'h03: out_low = 10'h19c;
              5'h04: out_low = 10'h199;
              5'h05: out_low = 10'h195;
              5'h06: out_low = 10'h191;
              5'h07: out_low = 10'h18d;
              5'h08: out_low = 10'h189;
              5'h09: out_low = 10'h185;
              5'h0a: out_low = 10'h181;
              5'h0b: out_low = 10'h17e;
              5'h0c: out_low = 10'h17a;
              5'h0d: out_low = 10'h176;
              5'h0e: out_low = 10'h172;
              5'h0f: out_low = 10'h16f;
              5'h10: out_low = 10'h16b;
              5'h11: out_low = 10'h167;
              5'h12: out_low = 10'h163;
              5'h13: out_low = 10'h160;
              5'h14: out_low = 10'h15c;
              5'h15: out_low = 10'h158;
              5'h16: out_low = 10'h154;
              5'h17: out_low = 10'h151;
              5'h18: out_low = 10'h14d;
              5'h19: out_low = 10'h149;
              5'h1a: out_low = 10'h146;
              5'h1b: out_low = 10'h142;
              5'h1c: out_low = 10'h13e;
              5'h1d: out_low = 10'h13b;
              5'h1e: out_low = 10'h137;
              5'h1f: out_low = 10'h134;
              default: out_low = 10'h000;
            endcase
          end
          5'h05: begin
            case (mant[4:0])
              5'h00: out_low = 10'h130;
              5'h01: out_low = 10'h12c;
              5'h02: out_low = 10'h129;
              5'h03: out_low = 10'h125;
              5'h04: out_low = 10'h122;
              5'h05: out_low = 10'h11e;
              5'h06: out_low = 10'h11b;
              5'h07: out_low = 10'h117;
              5'h08: out_low = 10'h114;
              5'h09: out_low = 10'h110;
              5'h0a: out_low = 10'h10c;
              5'h0b: out_low = 10'h109;
              5'h0c: out_low = 10'h106;
              5'h0d: out_low = 10'h102;
              5'h0e: out_low = 10'h0ff;
              5'h0f: out_low = 10'h0fb;
              5'h10: out_low = 10'h0f8;
              5'h11: out_low = 10'h0f4;
              5'h12: out_low = 10'h0f1;
              5'h13: out_low = 10'h0ed;
              5'h14: out_low = 10'h0ea;
              5'h15: out_low = 10'h0e7;
              5'h16: out_low = 10'h0e3;
              5'h17: out_low = 10'h0e0;
              5'h18: out_low = 10'h0dc;
              5'h19: out_low = 10'h0d9;
              5'h1a: out_low = 10'h0d6;
              5'h1b: out_low = 10'h0d2;
              5'h1c: out_low = 10'h0cf;
              5'h1d: out_low = 10'h0cc;
              5'h1e: out_low = 10'h0c8;
              5'h1f: out_low = 10'h0c5;
              default: out_low = 10'h000;
            endcase
          end
          5'h06: begin
            case (mant[4:0])
              5'h00: out_low = 10'h0c2;
              5'h01: out_low = 10'h0be;
              5'h02: out_low = 10'h0bb;
              5'h03: out_low = 10'h0b8;
              5'h04: out_low = 10'h0b5;
              5'h05: out_low = 10'h0b1;
              5'h06: out_low = 10'h0ae;
              5'h07: out_low = 10'h0ab;
              5'h08: out_low = 10'h0a8;
              5'h09: out_low = 10'h0a4;
              5'h0a: out_low = 10'h0a1;
              5'h0b: out_low = 10'h09e;
              5'h0c: out_low = 10'h09b;
              5'h0d: out_low = 10'h098;
              5'h0e: out_low = 10'h094;
              5'h0f: out_low = 10'h091;
              5'h10: out_low = 10'h08e;
              5'h11: out_low = 10'h08b;
              5'h12: out_low = 10'h088;
              5'h13: out_low = 10'h085;
              5'h14: out_low = 10'h082;
              5'h15: out_low = 10'h07e;
              5'h16: out_low = 10'h07b;
              5'h17: out_low = 10'h078;
              5'h18: out_low = 10'h075;
              5'h19: out_low = 10'h072;
              5'h1a: out_low = 10'h06f;
              5'h1b: out_low = 10'h06c;
              5'h1c: out_low = 10'h069;
              5'h1d: out_low = 10'h066;
              5'h1e: out_low = 10'h063;
              5'h1f: out_low = 10'h060;
              default: out_low = 10'h000;
            endcase
          end
          5'h07: begin
            case (mant[4:0])
              5'h00: out_low = 10'h05d;
              5'h01: out_low = 10'h05a;
              5'h02: out_low = 10'h057;
              5'h03: out_low = 10'h054;
              5'h04: out_low = 10'h051;
              5'h05: out_low = 10'h04e;
              5'h06: out_low = 10'h04b;
              5'h07: out_low = 10'h048;
              5'h08: out_low = 10'h045;
              5'h09: out_low = 10'h042;
              5'h0a: out_low = 10'h03f;
              5'h0b: out_low = 10'h03c;
              5'h0c: out_low = 10'h039;
              5'h0d: out_low = 10'h036;
              5'h0e: out_low = 10'h033;
              5'h0f: out_low = 10'h030;
              5'h10: out_low = 10'h02d;
              5'h11: out_low = 10'h02a;
              5'h12: out_low = 10'h028;
              5'h13: out_low = 10'h025;
              5'h14: out_low = 10'h022;
              5'h15: out_low = 10'h01f;
              5'h16: out_low = 10'h01c;
              5'h17: out_low = 10'h019;
              5'h18: out_low = 10'h016;
              5'h19: out_low = 10'h014;
              5'h1a: out_low = 10'h011;
              5'h1b: out_low = 10'h00e;
              5'h1c: out_low = 10'h00b;
              5'h1d: out_low = 10'h008;
              5'h1e: out_low = 10'h006;
              5'h1f: out_low = 10'h003;
              default: out_low = 10'h000;
            endcase
          end
          5'h08: begin
            case (mant[4:0])
              5'h00: out_low = 10'h000;
              5'h01: out_low = 10'h3fa;
              5'h02: out_low = 10'h3f5;
              5'h03: out_low = 10'h3ef;
              5'h04: out_low = 10'h3ea;
              5'h05: out_low = 10'h3e4;
              5'h06: out_low = 10'h3df;
              5'h07: out_low = 10'h3da;
              5'h08: out_low = 10'h3d4;
              5'h09: out_low = 10'h3cf;
              5'h0a: out_low = 10'h3c9;
              5'h0b: out_low = 10'h3c4;
              5'h0c: out_low = 10'h3bf;
              5'h0d: out_low = 10'h3b9;
              5'h0e: out_low = 10'h3b4;
              5'h0f: out_low = 10'h3ae;
              5'h10: out_low = 10'h3a9;
              5'h11: out_low = 10'h3a4;
              5'h12: out_low = 10'h39f;
              5'h13: out_low = 10'h399;
              5'h14: out_low = 10'h394;
              5'h15: out_low = 10'h38f;
              5'h16: out_low = 10'h38a;
              5'h17: out_low = 10'h384;
              5'h18: out_low = 10'h37f;
              5'h19: out_low = 10'h37a;
              5'h1a: out_low = 10'h375;
              5'h1b: out_low = 10'h370;
              5'h1c: out_low = 10'h36a;
              5'h1d: out_low = 10'h365;
              5'h1e: out_low = 10'h360;
              5'h1f: out_low = 10'h35b;
              default: out_low = 10'h000;
            endcase
          end
          5'h09: begin
            case (mant[4:0])
              5'h00: out_low = 10'h356;
              5'h01: out_low = 10'h351;
              5'h02: out_low = 10'h34c;
              5'h03: out_low = 10'h347;
              5'h04: out_low = 10'h342;
              5'h05: out_low = 10'h33d;
              5'h06: out_low = 10'h338;
              5'h07: out_low = 10'h333;
              5'h08: out_low = 10'h32e;
              5'h09: out_low = 10'h329;
              5'h0a: out_low = 10'h324;
              5'h0b: out_low = 10'h31f;
              5'h0c: out_low = 10'h31a;
              5'h0d: out_low = 10'h315;
              5'h0e: out_low = 10'h310;
              5'h0f: out_low = 10'h30b;
              5'h10: out_low = 10'h306;
              5'h11: out_low = 10'h302;
              5'h12: out_low = 10'h2fd;
              5'h13: out_low = 10'h2f8;
              5'h14: out_low = 10'h2f3;
              5'h15: out_low = 10'h2ee;
              5'h16: out_low = 10'h2e9;
              5'h17: out_low = 10'h2e5;
              5'h18: out_low = 10'h2e0;
              5'h19: out_low = 10'h2db;
              5'h1a: out_low = 10'h2d6;
              5'h1b: out_low = 10'h2d2;
              5'h1c: out_low = 10'h2cd;
              5'h1d: out_low = 10'h2c8;
              5'h1e: out_low = 10'h2c4;
              5'h1f: out_low = 10'h2bf;
              default: out_low = 10'h000;
            endcase
          end
          5'h0a: begin
            case (mant[4:0])
              5'h00: out_low = 10'h2ba;
              5'h01: out_low = 10'h2b5;
              5'h02: out_low = 10'h2b1;
              5'h03: out_low = 10'h2ac;
              5'h04: out_low = 10'h2a8;
              5'h05: out_low = 10'h2a3;
              5'h06: out_low = 10'h29e;
              5'h07: out_low = 10'h29a;
              5'h08: out_low = 10'h295;
              5'h09: out_low = 10'h291;
              5'h0a: out_low = 10'h28c;
              5'h0b: out_low = 10'h288;
              5'h0c: out_low = 10'h283;
              5'h0d: out_low = 10'h27f;
              5'h0e: out_low = 10'h27a;
              5'h0f: out_low = 10'h276;
              5'h10: out_low = 10'h271;
              5'h11: out_low = 10'h26d;
              5'h12: out_low = 10'h268;
              5'h13: out_low = 10'h264;
              5'h14: out_low = 10'h25f;
              5'h15: out_low = 10'h25b;
              5'h16: out_low = 10'h257;
              5'h17: out_low = 10'h252;
              5'h18: out_low = 10'h24e;
              5'h19: out_low = 10'h249;
              5'h1a: out_low = 10'h245;
              5'h1b: out_low = 10'h241;
              5'h1c: out_low = 10'h23c;
              5'h1d: out_low = 10'h238;
              5'h1e: out_low = 10'h234;
              5'h1f: out_low = 10'h230;
              default: out_low = 10'h000;
            endcase
          end
          5'h0b: begin
            case (mant[4:0])
              5'h00: out_low = 10'h22b;
              5'h01: out_low = 10'h227;
              5'h02: out_low = 10'h223;
              5'h03: out_low = 10'h21e;
              5'h04: out_low = 10'h21a;
              5'h05: out_low = 10'h216;
              5'h06: out_low = 10'h212;
              5'h07: out_low = 10'h20e;
              5'h08: out_low = 10'h209;
              5'h09: out_low = 10'h205;
              5'h0a: out_low = 10'h201;
              5'h0b: out_low = 10'h1fd;
              5'h0c: out_low = 10'h1f9;
              5'h0d: out_low = 10'h1f5;
              5'h0e: out_low = 10'h1f0;
              5'h0f: out_low = 10'h1ec;
              5'h10: out_low = 10'h1e8;
              5'h11: out_low = 10'h1e4;
              5'h12: out_low = 10'h1e0;
              5'h13: out_low = 10'h1dc;
              5'h14: out_low = 10'h1d8;
              5'h15: out_low = 10'h1d4;
              5'h16: out_low = 10'h1d0;
              5'h17: out_low = 10'h1cc;
              5'h18: out_low = 10'h1c8;
              5'h19: out_low = 10'h1c4;
              5'h1a: out_low = 10'h1c0;
              5'h1b: out_low = 10'h1bc;
              5'h1c: out_low = 10'h1b8;
              5'h1d: out_low = 10'h1b4;
              5'h1e: out_low = 10'h1b0;
              5'h1f: out_low = 10'h1ac;
              default: out_low = 10'h000;
            endcase
          end
          5'h0c: begin
            case (mant[4:0])
              5'h00: out_low = 10'h1a8;
              5'h01: out_low = 10'h1a4;
              5'h02: out_low = 10'h1a0;
              5'h03: out_low = 10'h19c;
              5'h04: out_low = 10'h199;
              5'h05: out_low = 10'h195;
              5'h06: out_low = 10'h191;
              5'h07: out_low = 10'h18d;
              5'h08: out_low = 10'h189;
              5'h09: out_low = 10'h185;
              5'h0a: out_low = 10'h181;
              5'h0b: out_low = 10'h17e;
              5'h0c: out_low = 10'h17a;
              5'h0d: out_low = 10'h176;
              5'h0e: out_low = 10'h172;
              5'h0f: out_low = 10'h16f;
              5'h10: out_low = 10'h16b;
              5'h11: out_low = 10'h167;
              5'h12: out_low = 10'h163;
              5'h13: out_low = 10'h160;
              5'h14: out_low = 10'h15c;
              5'h15: out_low = 10'h158;
              5'h16: out_low = 10'h154;
              5'h17: out_low = 10'h151;
              5'h18: out_low = 10'h14d;
              5'h19: out_low = 10'h149;
              5'h1a: out_low = 10'h146;
              5'h1b: out_low = 10'h142;
              5'h1c: out_low = 10'h13e;
              5'h1d: out_low = 10'h13b;
              5'h1e: out_low = 10'h137;
              5'h1f: out_low = 10'h134;
              default: out_low = 10'h000;
            endcase
          end
          5'h0d: begin
            case (mant[4:0])
              5'h00: out_low = 10'h130;
              5'h01: out_low = 10'h12c;
              5'h02: out_low = 10'h129;
              5'h03: out_low = 10'h125;
              5'h04: out_low = 10'h122;
              5'h05: out_low = 10'h11e;
              5'h06: out_low = 10'h11b;
              5'h07: out_low = 10'h117;
              5'h08: out_low = 10'h114;
              5'h09: out_low = 10'h110;
              5'h0a: out_low = 10'h10c;
              5'h0b: out_low = 10'h109;
              5'h0c: out_low = 10'h106;
              5'h0d: out_low = 10'h102;
              5'h0e: out_low = 10'h0ff;
              5'h0f: out_low = 10'h0fb;
              5'h10: out_low = 10'h0f8;
              5'h11: out_low = 10'h0f4;
              5'h12: out_low = 10'h0f1;
              5'h13: out_low = 10'h0ed;
              5'h14: out_low = 10'h0ea;
              5'h15: out_low = 10'h0e7;
              5'h16: out_low = 10'h0e3;
              5'h17: out_low = 10'h0e0;
              5'h18: out_low = 10'h0dc;
              5'h19: out_low = 10'h0d9;
              5'h1a: out_low = 10'h0d6;
              5'h1b: out_low = 10'h0d2;
              5'h1c: out_low = 10'h0cf;
              5'h1d: out_low = 10'h0cc;
              5'h1e: out_low = 10'h0c8;
              5'h1f: out_low = 10'h0c5;
              default: out_low = 10'h000;
            endcase
          end
          5'h0e: begin
            case (mant[4:0])
              5'h00: out_low = 10'h0c2;
              5'h01: out_low = 10'h0be;
              5'h02: out_low = 10'h0bb;
              5'h03: out_low = 10'h0b8;
              5'h04: out_low = 10'h0b5;
              5'h05: out_low = 10'h0b1;
              5'h06: out_low = 10'h0ae;
              5'h07: out_low = 10'h0ab;
              5'h08: out_low = 10'h0a8;
              5'h09: out_low = 10'h0a4;
              5'h0a: out_low = 10'h0a1;
              5'h0b: out_low = 10'h09e;
              5'h0c: out_low = 10'h09b;
              5'h0d: out_low = 10'h098;
              5'h0e: out_low = 10'h094;
              5'h0f: out_low = 10'h091;
              5'h10: out_low = 10'h08e;
              5'h11: out_low = 10'h08b;
              5'h12: out_low = 10'h088;
              5'h13: out_low = 10'h085;
              5'h14: out_low = 10'h082;
              5'h15: out_low = 10'h07e;
              5'h16: out_low = 10'h07b;
              5'h17: out_low = 10'h078;
              5'h18: out_low = 10'h075;
              5'h19: out_low = 10'h072;
              5'h1a: out_low = 10'h06f;
              5'h1b: out_low = 10'h06c;
              5'h1c: out_low = 10'h069;
              5'h1d: out_low = 10'h066;
              5'h1e: out_low = 10'h063;
              5'h1f: out_low = 10'h060;
              default: out_low = 10'h000;
            endcase
          end
          5'h0f: begin
            case (mant[4:0])
              5'h00: out_low = 10'h05d;
              5'h01: out_low = 10'h05a;
              5'h02: out_low = 10'h057;
              5'h03: out_low = 10'h054;
              5'h04: out_low = 10'h051;
              5'h05: out_low = 10'h04e;
              5'h06: out_low = 10'h04b;
              5'h07: out_low = 10'h048;
              5'h08: out_low = 10'h045;
              5'h09: out_low = 10'h042;
              5'h0a: out_low = 10'h03f;
              5'h0b: out_low = 10'h03c;
              5'h0c: out_low = 10'h039;
              5'h0d: out_low = 10'h036;
              5'h0e: out_low = 10'h033;
              5'h0f: out_low = 10'h030;
              5'h10: out_low = 10'h02d;
              5'h11: out_low = 10'h02a;
              5'h12: out_low = 10'h028;
              5'h13: out_low = 10'h025;
              5'h14: out_low = 10'h022;
              5'h15: out_low = 10'h01f;
              5'h16: out_low = 10'h01c;
              5'h17: out_low = 10'h019;
              5'h18: out_low = 10'h016;
              5'h19: out_low = 10'h014;
              5'h1a: out_low = 10'h011;
              5'h1b: out_low = 10'h00e;
              5'h1c: out_low = 10'h00b;
              5'h1d: out_low = 10'h008;
              5'h1e: out_low = 10'h006;
              5'h1f: out_low = 10'h003;
              default: out_low = 10'h000;
            endcase
          end
          5'h10: begin
            case (mant[4:0])
              5'h00: out_low = 10'h000;
              5'h01: out_low = 10'h3fa;
              5'h02: out_low = 10'h3f5;
              5'h03: out_low = 10'h3ef;
              5'h04: out_low = 10'h3ea;
              5'h05: out_low = 10'h3e4;
              5'h06: out_low = 10'h3df;
              5'h07: out_low = 10'h3da;
              5'h08: out_low = 10'h3d4;
              5'h09: out_low = 10'h3cf;
              5'h0a: out_low = 10'h3c9;
              5'h0b: out_low = 10'h3c4;
              5'h0c: out_low = 10'h3bf;
              5'h0d: out_low = 10'h3b9;
              5'h0e: out_low = 10'h3b4;
              5'h0f: out_low = 10'h3ae;
              5'h10: out_low = 10'h3a9;
              5'h11: out_low = 10'h3a4;
              5'h12: out_low = 10'h39f;
              5'h13: out_low = 10'h399;
              5'h14: out_low = 10'h394;
              5'h15: out_low = 10'h38f;
              5'h16: out_low = 10'h38a;
              5'h17: out_low = 10'h384;
              5'h18: out_low = 10'h37f;
              5'h19: out_low = 10'h37a;
              5'h1a: out_low = 10'h375;
              5'h1b: out_low = 10'h370;
              5'h1c: out_low = 10'h36a;
              5'h1d: out_low = 10'h365;
              5'h1e: out_low = 10'h360;
              5'h1f: out_low = 10'h35b;
              default: out_low = 10'h000;
            endcase
          end
          5'h11: begin
            case (mant[4:0])
              5'h00: out_low = 10'h356;
              5'h01: out_low = 10'h351;
              5'h02: out_low = 10'h34c;
              5'h03: out_low = 10'h347;
              5'h04: out_low = 10'h342;
              5'h05: out_low = 10'h33d;
              5'h06: out_low = 10'h338;
              5'h07: out_low = 10'h333;
              5'h08: out_low = 10'h32e;
              5'h09: out_low = 10'h329;
              5'h0a: out_low = 10'h324;
              5'h0b: out_low = 10'h31f;
              5'h0c: out_low = 10'h31a;
              5'h0d: out_low = 10'h315;
              5'h0e: out_low = 10'h310;
              5'h0f: out_low = 10'h30b;
              5'h10: out_low = 10'h306;
              5'h11: out_low = 10'h302;
              5'h12: out_low = 10'h2fd;
              5'h13: out_low = 10'h2f8;
              5'h14: out_low = 10'h2f3;
              5'h15: out_low = 10'h2ee;
              5'h16: out_low = 10'h2e9;
              5'h17: out_low = 10'h2e5;
              5'h18: out_low = 10'h2e0;
              5'h19: out_low = 10'h2db;
              5'h1a: out_low = 10'h2d6;
              5'h1b: out_low = 10'h2d2;
              5'h1c: out_low = 10'h2cd;
              5'h1d: out_low = 10'h2c8;
              5'h1e: out_low = 10'h2c4;
              5'h1f: out_low = 10'h2bf;
              default: out_low = 10'h000;
            endcase
          end
          5'h12: begin
            case (mant[4:0])
              5'h00: out_low = 10'h2ba;
              5'h01: out_low = 10'h2b5;
              5'h02: out_low = 10'h2b1;
              5'h03: out_low = 10'h2ac;
              5'h04: out_low = 10'h2a8;
              5'h05: out_low = 10'h2a3;
              5'h06: out_low = 10'h29e;
              5'h07: out_low = 10'h29a;
              5'h08: out_low = 10'h295;
              5'h09: out_low = 10'h291;
              5'h0a: out_low = 10'h28c;
              5'h0b: out_low = 10'h288;
              5'h0c: out_low = 10'h283;
              5'h0d: out_low = 10'h27f;
              5'h0e: out_low = 10'h27a;
              5'h0f: out_low = 10'h276;
              5'h10: out_low = 10'h271;
              5'h11: out_low = 10'h26d;
              5'h12: out_low = 10'h268;
              5'h13: out_low = 10'h264;
              5'h14: out_low = 10'h25f;
              5'h15: out_low = 10'h25b;
              5'h16: out_low = 10'h257;
              5'h17: out_low = 10'h252;
              5'h18: out_low = 10'h24e;
              5'h19: out_low = 10'h249;
              5'h1a: out_low = 10'h245;
              5'h1b: out_low = 10'h241;
              5'h1c: out_low = 10'h23c;
              5'h1d: out_low = 10'h238;
              5'h1e: out_low = 10'h234;
              5'h1f: out_low = 10'h230;
              default: out_low = 10'h000;
            endcase
          end
          5'h13: begin
            case (mant[4:0])
              5'h00: out_low = 10'h22b;
              5'h01: out_low = 10'h227;
              5'h02: out_low = 10'h223;
              5'h03: out_low = 10'h21e;
              5'h04: out_low = 10'h21a;
              5'h05: out_low = 10'h216;
              5'h06: out_low = 10'h212;
              5'h07: out_low = 10'h20e;
              5'h08: out_low = 10'h209;
              5'h09: out_low = 10'h205;
              5'h0a: out_low = 10'h201;
              5'h0b: out_low = 10'h1fd;
              5'h0c: out_low = 10'h1f9;
              5'h0d: out_low = 10'h1f5;
              5'h0e: out_low = 10'h1f0;
              5'h0f: out_low = 10'h1ec;
              5'h10: out_low = 10'h1e8;
              5'h11: out_low = 10'h1e4;
              5'h12: out_low = 10'h1e0;
              5'h13: out_low = 10'h1dc;
              5'h14: out_low = 10'h1d8;
              5'h15: out_low = 10'h1d4;
              5'h16: out_low = 10'h1d0;
              5'h17: out_low = 10'h1cc;
              5'h18: out_low = 10'h1c8;
              5'h19: out_low = 10'h1c4;
              5'h1a: out_low = 10'h1c0;
              5'h1b: out_low = 10'h1bc;
              5'h1c: out_low = 10'h1b8;
              5'h1d: out_low = 10'h1b4;
              5'h1e: out_low = 10'h1b0;
              5'h1f: out_low = 10'h1ac;
              default: out_low = 10'h000;
            endcase
          end
          5'h14: begin
            case (mant[4:0])
              5'h00: out_low = 10'h1a8;
              5'h01: out_low = 10'h1a4;
              5'h02: out_low = 10'h1a0;
              5'h03: out_low = 10'h19c;
              5'h04: out_low = 10'h199;
              5'h05: out_low = 10'h195;
              5'h06: out_low = 10'h191;
              5'h07: out_low = 10'h18d;
              5'h08: out_low = 10'h189;
              5'h09: out_low = 10'h185;
              5'h0a: out_low = 10'h181;
              5'h0b: out_low = 10'h17e;
              5'h0c: out_low = 10'h17a;
              5'h0d: out_low = 10'h176;
              5'h0e: out_low = 10'h172;
              5'h0f: out_low = 10'h16f;
              5'h10: out_low = 10'h16b;
              5'h11: out_low = 10'h167;
              5'h12: out_low = 10'h163;
              5'h13: out_low = 10'h160;
              5'h14: out_low = 10'h15c;
              5'h15: out_low = 10'h158;
              5'h16: out_low = 10'h154;
              5'h17: out_low = 10'h151;
              5'h18: out_low = 10'h14d;
              5'h19: out_low = 10'h149;
              5'h1a: out_low = 10'h146;
              5'h1b: out_low = 10'h142;
              5'h1c: out_low = 10'h13e;
              5'h1d: out_low = 10'h13b;
              5'h1e: out_low = 10'h137;
              5'h1f: out_low = 10'h134;
              default: out_low = 10'h000;
            endcase
          end
          5'h15: begin
            case (mant[4:0])
              5'h00: out_low = 10'h130;
              5'h01: out_low = 10'h12c;
              5'h02: out_low = 10'h129;
              5'h03: out_low = 10'h125;
              5'h04: out_low = 10'h122;
              5'h05: out_low = 10'h11e;
              5'h06: out_low = 10'h11b;
              5'h07: out_low = 10'h117;
              5'h08: out_low = 10'h114;
              5'h09: out_low = 10'h110;
              5'h0a: out_low = 10'h10c;
              5'h0b: out_low = 10'h109;
              5'h0c: out_low = 10'h106;
              5'h0d: out_low = 10'h102;
              5'h0e: out_low = 10'h0ff;
              5'h0f: out_low = 10'h0fb;
              5'h10: out_low = 10'h0f8;
              5'h11: out_low = 10'h0f4;
              5'h12: out_low = 10'h0f1;
              5'h13: out_low = 10'h0ed;
              5'h14: out_low = 10'h0ea;
              5'h15: out_low = 10'h0e7;
              5'h16: out_low = 10'h0e3;
              5'h17: out_low = 10'h0e0;
              5'h18: out_low = 10'h0dc;
              5'h19: out_low = 10'h0d9;
              5'h1a: out_low = 10'h0d6;
              5'h1b: out_low = 10'h0d2;
              5'h1c: out_low = 10'h0cf;
              5'h1d: out_low = 10'h0cc;
              5'h1e: out_low = 10'h0c8;
              5'h1f: out_low = 10'h0c5;
              default: out_low = 10'h000;
            endcase
          end
          5'h16: begin
            case (mant[4:0])
              5'h00: out_low = 10'h0c2;
              5'h01: out_low = 10'h0be;
              5'h02: out_low = 10'h0bb;
              5'h03: out_low = 10'h0b8;
              5'h04: out_low = 10'h0b5;
              5'h05: out_low = 10'h0b1;
              5'h06: out_low = 10'h0ae;
              5'h07: out_low = 10'h0ab;
              5'h08: out_low = 10'h0a8;
              5'h09: out_low = 10'h0a4;
              5'h0a: out_low = 10'h0a1;
              5'h0b: out_low = 10'h09e;
              5'h0c: out_low = 10'h09b;
              5'h0d: out_low = 10'h098;
              5'h0e: out_low = 10'h094;
              5'h0f: out_low = 10'h091;
              5'h10: out_low = 10'h08e;
              5'h11: out_low = 10'h08b;
              5'h12: out_low = 10'h088;
              5'h13: out_low = 10'h085;
              5'h14: out_low = 10'h082;
              5'h15: out_low = 10'h07e;
              5'h16: out_low = 10'h07b;
              5'h17: out_low = 10'h078;
              5'h18: out_low = 10'h075;
              5'h19: out_low = 10'h072;
              5'h1a: out_low = 10'h06f;
              5'h1b: out_low = 10'h06c;
              5'h1c: out_low = 10'h069;
              5'h1d: out_low = 10'h066;
              5'h1e: out_low = 10'h063;
              5'h1f: out_low = 10'h060;
              default: out_low = 10'h000;
            endcase
          end
          5'h17: begin
            case (mant[4:0])
              5'h00: out_low = 10'h05d;
              5'h01: out_low = 10'h05a;
              5'h02: out_low = 10'h057;
              5'h03: out_low = 10'h054;
              5'h04: out_low = 10'h051;
              5'h05: out_low = 10'h04e;
              5'h06: out_low = 10'h04b;
              5'h07: out_low = 10'h048;
              5'h08: out_low = 10'h045;
              5'h09: out_low = 10'h042;
              5'h0a: out_low = 10'h03f;
              5'h0b: out_low = 10'h03c;
              5'h0c: out_low = 10'h039;
              5'h0d: out_low = 10'h036;
              5'h0e: out_low = 10'h033;
              5'h0f: out_low = 10'h030;
              5'h10: out_low = 10'h02d;
              5'h11: out_low = 10'h02a;
              5'h12: out_low = 10'h028;
              5'h13: out_low = 10'h025;
              5'h14: out_low = 10'h022;
              5'h15: out_low = 10'h01f;
              5'h16: out_low = 10'h01c;
              5'h17: out_low = 10'h019;
              5'h18: out_low = 10'h016;
              5'h19: out_low = 10'h014;
              5'h1a: out_low = 10'h011;
              5'h1b: out_low = 10'h00e;
              5'h1c: out_low = 10'h00b;
              5'h1d: out_low = 10'h008;
              5'h1e: out_low = 10'h006;
              5'h1f: out_low = 10'h003;
              default: out_low = 10'h000;
            endcase
          end
          5'h18: begin
            case (mant[4:0])
              5'h00: out_low = 10'h000;
              5'h01: out_low = 10'h3fa;
              5'h02: out_low = 10'h3f5;
              5'h03: out_low = 10'h3ef;
              5'h04: out_low = 10'h3ea;
              5'h05: out_low = 10'h3e4;
              5'h06: out_low = 10'h3df;
              5'h07: out_low = 10'h3da;
              5'h08: out_low = 10'h3d4;
              5'h09: out_low = 10'h3cf;
              5'h0a: out_low = 10'h3c9;
              5'h0b: out_low = 10'h3c4;
              5'h0c: out_low = 10'h3bf;
              5'h0d: out_low = 10'h3b9;
              5'h0e: out_low = 10'h3b4;
              5'h0f: out_low = 10'h3ae;
              5'h10: out_low = 10'h3a9;
              5'h11: out_low = 10'h3a4;
              5'h12: out_low = 10'h39f;
              5'h13: out_low = 10'h399;
              5'h14: out_low = 10'h394;
              5'h15: out_low = 10'h38f;
              5'h16: out_low = 10'h38a;
              5'h17: out_low = 10'h384;
              5'h18: out_low = 10'h37f;
              5'h19: out_low = 10'h37a;
              5'h1a: out_low = 10'h375;
              5'h1b: out_low = 10'h370;
              5'h1c: out_low = 10'h36a;
              5'h1d: out_low = 10'h365;
              5'h1e: out_low = 10'h360;
              5'h1f: out_low = 10'h35b;
              default: out_low = 10'h000;
            endcase
          end
          5'h19: begin
            case (mant[4:0])
              5'h00: out_low = 10'h356;
              5'h01: out_low = 10'h351;
              5'h02: out_low = 10'h34c;
              5'h03: out_low = 10'h347;
              5'h04: out_low = 10'h342;
              5'h05: out_low = 10'h33d;
              5'h06: out_low = 10'h338;
              5'h07: out_low = 10'h333;
              5'h08: out_low = 10'h32e;
              5'h09: out_low = 10'h329;
              5'h0a: out_low = 10'h324;
              5'h0b: out_low = 10'h31f;
              5'h0c: out_low = 10'h31a;
              5'h0d: out_low = 10'h315;
              5'h0e: out_low = 10'h310;
              5'h0f: out_low = 10'h30b;
              5'h10: out_low = 10'h306;
              5'h11: out_low = 10'h302;
              5'h12: out_low = 10'h2fd;
              5'h13: out_low = 10'h2f8;
              5'h14: out_low = 10'h2f3;
              5'h15: out_low = 10'h2ee;
              5'h16: out_low = 10'h2e9;
              5'h17: out_low = 10'h2e5;
              5'h18: out_low = 10'h2e0;
              5'h19: out_low = 10'h2db;
              5'h1a: out_low = 10'h2d6;
              5'h1b: out_low = 10'h2d2;
              5'h1c: out_low = 10'h2cd;
              5'h1d: out_low = 10'h2c8;
              5'h1e: out_low = 10'h2c4;
              5'h1f: out_low = 10'h2bf;
              default: out_low = 10'h000;
            endcase
          end
          5'h1a: begin
            case (mant[4:0])
              5'h00: out_low = 10'h2ba;
              5'h01: out_low = 10'h2b5;
              5'h02: out_low = 10'h2b1;
              5'h03: out_low = 10'h2ac;
              5'h04: out_low = 10'h2a8;
              5'h05: out_low = 10'h2a3;
              5'h06: out_low = 10'h29e;
              5'h07: out_low = 10'h29a;
              5'h08: out_low = 10'h295;
              5'h09: out_low = 10'h291;
              5'h0a: out_low = 10'h28c;
              5'h0b: out_low = 10'h288;
              5'h0c: out_low = 10'h283;
              5'h0d: out_low = 10'h27f;
              5'h0e: out_low = 10'h27a;
              5'h0f: out_low = 10'h276;
              5'h10: out_low = 10'h271;
              5'h11: out_low = 10'h26d;
              5'h12: out_low = 10'h268;
              5'h13: out_low = 10'h264;
              5'h14: out_low = 10'h25f;
              5'h15: out_low = 10'h25b;
              5'h16: out_low = 10'h257;
              5'h17: out_low = 10'h252;
              5'h18: out_low = 10'h24e;
              5'h19: out_low = 10'h249;
              5'h1a: out_low = 10'h245;
              5'h1b: out_low = 10'h241;
              5'h1c: out_low = 10'h23c;
              5'h1d: out_low = 10'h238;
              5'h1e: out_low = 10'h234;
              5'h1f: out_low = 10'h230;
              default: out_low = 10'h000;
            endcase
          end
          5'h1b: begin
            case (mant[4:0])
              5'h00: out_low = 10'h22b;
              5'h01: out_low = 10'h227;
              5'h02: out_low = 10'h223;
              5'h03: out_low = 10'h21e;
              5'h04: out_low = 10'h21a;
              5'h05: out_low = 10'h216;
              5'h06: out_low = 10'h212;
              5'h07: out_low = 10'h20e;
              5'h08: out_low = 10'h209;
              5'h09: out_low = 10'h205;
              5'h0a: out_low = 10'h201;
              5'h0b: out_low = 10'h1fd;
              5'h0c: out_low = 10'h1f9;
              5'h0d: out_low = 10'h1f5;
              5'h0e: out_low = 10'h1f0;
              5'h0f: out_low = 10'h1ec;
              5'h10: out_low = 10'h1e8;
              5'h11: out_low = 10'h1e4;
              5'h12: out_low = 10'h1e0;
              5'h13: out_low = 10'h1dc;
              5'h14: out_low = 10'h1d8;
              5'h15: out_low = 10'h1d4;
              5'h16: out_low = 10'h1d0;
              5'h17: out_low = 10'h1cc;
              5'h18: out_low = 10'h1c8;
              5'h19: out_low = 10'h1c4;
              5'h1a: out_low = 10'h1c0;
              5'h1b: out_low = 10'h1bc;
              5'h1c: out_low = 10'h1b8;
              5'h1d: out_low = 10'h1b4;
              5'h1e: out_low = 10'h1b0;
              5'h1f: out_low = 10'h1ac;
              default: out_low = 10'h000;
            endcase
          end
          5'h1c: begin
            case (mant[4:0])
              5'h00: out_low = 10'h1a8;
              5'h01: out_low = 10'h1a4;
              5'h02: out_low = 10'h1a0;
              5'h03: out_low = 10'h19c;
              5'h04: out_low = 10'h199;
              5'h05: out_low = 10'h195;
              5'h06: out_low = 10'h191;
              5'h07: out_low = 10'h18d;
              5'h08: out_low = 10'h189;
              5'h09: out_low = 10'h185;
              5'h0a: out_low = 10'h181;
              5'h0b: out_low = 10'h17e;
              5'h0c: out_low = 10'h17a;
              5'h0d: out_low = 10'h176;
              5'h0e: out_low = 10'h172;
              5'h0f: out_low = 10'h16f;
              5'h10: out_low = 10'h16b;
              5'h11: out_low = 10'h167;
              5'h12: out_low = 10'h163;
              5'h13: out_low = 10'h160;
              5'h14: out_low = 10'h15c;
              5'h15: out_low = 10'h158;
              5'h16: out_low = 10'h154;
              5'h17: out_low = 10'h151;
              5'h18: out_low = 10'h14d;
              5'h19: out_low = 10'h149;
              5'h1a: out_low = 10'h146;
              5'h1b: out_low = 10'h142;
              5'h1c: out_low = 10'h13e;
              5'h1d: out_low = 10'h13b;
              5'h1e: out_low = 10'h137;
              5'h1f: out_low = 10'h134;
              default: out_low = 10'h000;
            endcase
          end
          5'h1d: begin
            case (mant[4:0])
              5'h00: out_low = 10'h130;
              5'h01: out_low = 10'h12c;
              5'h02: out_low = 10'h129;
              5'h03: out_low = 10'h125;
              5'h04: out_low = 10'h122;
              5'h05: out_low = 10'h11e;
              5'h06: out_low = 10'h11b;
              5'h07: out_low = 10'h117;
              5'h08: out_low = 10'h114;
              5'h09: out_low = 10'h110;
              5'h0a: out_low = 10'h10c;
              5'h0b: out_low = 10'h109;
              5'h0c: out_low = 10'h106;
              5'h0d: out_low = 10'h102;
              5'h0e: out_low = 10'h0ff;
              5'h0f: out_low = 10'h0fb;
              5'h10: out_low = 10'h0f8;
              5'h11: out_low = 10'h0f4;
              5'h12: out_low = 10'h0f1;
              5'h13: out_low = 10'h0ed;
              5'h14: out_low = 10'h0ea;
              5'h15: out_low = 10'h0e7;
              5'h16: out_low = 10'h0e3;
              5'h17: out_low = 10'h0e0;
              5'h18: out_low = 10'h0dc;
              5'h19: out_low = 10'h0d9;
              5'h1a: out_low = 10'h0d6;
              5'h1b: out_low = 10'h0d2;
              5'h1c: out_low = 10'h0cf;
              5'h1d: out_low = 10'h0cc;
              5'h1e: out_low = 10'h0c8;
              5'h1f: out_low = 10'h0c5;
              default: out_low = 10'h000;
            endcase
          end
          5'h1e: begin
            case (mant[4:0])
              5'h00: out_low = 10'h0c2;
              5'h01: out_low = 10'h0be;
              5'h02: out_low = 10'h0bb;
              5'h03: out_low = 10'h0b8;
              5'h04: out_low = 10'h0b5;
              5'h05: out_low = 10'h0b1;
              5'h06: out_low = 10'h0ae;
              5'h07: out_low = 10'h0ab;
              5'h08: out_low = 10'h0a8;
              5'h09: out_low = 10'h0a4;
              5'h0a: out_low = 10'h0a1;
              5'h0b: out_low = 10'h09e;
              5'h0c: out_low = 10'h09b;
              5'h0d: out_low = 10'h098;
              5'h0e: out_low = 10'h094;
              5'h0f: out_low = 10'h091;
              5'h10: out_low = 10'h08e;
              5'h11: out_low = 10'h08b;
              5'h12: out_low = 10'h088;
              5'h13: out_low = 10'h085;
              5'h14: out_low = 10'h082;
              5'h15: out_low = 10'h07e;
              5'h16: out_low = 10'h07b;
              5'h17: out_low = 10'h078;
              5'h18: out_low = 10'h075;
              5'h19: out_low = 10'h072;
              5'h1a: out_low = 10'h06f;
              5'h1b: out_low = 10'h06c;
              5'h1c: out_low = 10'h069;
              5'h1d: out_low = 10'h066;
              5'h1e: out_low = 10'h063;
              5'h1f: out_low = 10'h060;
              default: out_low = 10'h000;
            endcase
          end
          5'h1f: begin
            case (mant[4:0])
              5'h00: out_low = 10'h05d;
              5'h01: out_low = 10'h05a;
              5'h02: out_low = 10'h057;
              5'h03: out_low = 10'h054;
              5'h04: out_low = 10'h051;
              5'h05: out_low = 10'h04e;
              5'h06: out_low = 10'h04b;
              5'h07: out_low = 10'h048;
              5'h08: out_low = 10'h045;
              5'h09: out_low = 10'h042;
              5'h0a: out_low = 10'h03f;
              5'h0b: out_low = 10'h03c;
              5'h0c: out_low = 10'h039;
              5'h0d: out_low = 10'h036;
              5'h0e: out_low = 10'h033;
              5'h0f: out_low = 10'h030;
              5'h10: out_low = 10'h02d;
              5'h11: out_low = 10'h02a;
              5'h12: out_low = 10'h028;
              5'h13: out_low = 10'h025;
              5'h14: out_low = 10'h022;
              5'h15: out_low = 10'h01f;
              5'h16: out_low = 10'h01c;
              5'h17: out_low = 10'h019;
              5'h18: out_low = 10'h016;
              5'h19: out_low = 10'h014;
              5'h1a: out_low = 10'h011;
              5'h1b: out_low = 10'h00e;
              5'h1c: out_low = 10'h00b;
              5'h1d: out_low = 10'h008;
              5'h1e: out_low = 10'h006;
              5'h1f: out_low = 10'h003;
              default: out_low = 10'h000;
            endcase
          end
          default: out_low = 10'h000;
        endcase
      end
      6'h32: begin
        case (mant[9:5])
          5'h00: begin
            case (mant[4:0])
              5'h00: out_low = 10'h000;
              5'h01: out_low = 10'h3f5;
              5'h02: out_low = 10'h3ea;
              5'h03: out_low = 10'h3df;
              5'h04: out_low = 10'h3d4;
              5'h05: out_low = 10'h3c9;
              5'h06: out_low = 10'h3bf;
              5'h07: out_low = 10'h3b4;
              5'h08: out_low = 10'h3a9;
              5'h09: out_low = 10'h39f;
              5'h0a: out_low = 10'h394;
              5'h0b: out_low = 10'h38a;
              5'h0c: out_low = 10'h37f;
              5'h0d: out_low = 10'h375;
              5'h0e: out_low = 10'h36a;
              5'h0f: out_low = 10'h360;
              5'h10: out_low = 10'h356;
              5'h11: out_low = 10'h34c;
              5'h12: out_low = 10'h342;
              5'h13: out_low = 10'h338;
              5'h14: out_low = 10'h32e;
              5'h15: out_low = 10'h324;
              5'h16: out_low = 10'h31a;
              5'h17: out_low = 10'h310;
              5'h18: out_low = 10'h306;
              5'h19: out_low = 10'h2fd;
              5'h1a: out_low = 10'h2f3;
              5'h1b: out_low = 10'h2e9;
              5'h1c: out_low = 10'h2e0;
              5'h1d: out_low = 10'h2d6;
              5'h1e: out_low = 10'h2cd;
              5'h1f: out_low = 10'h2c4;
              default: out_low = 10'h000;
            endcase
          end
          5'h01: begin
            case (mant[4:0])
              5'h00: out_low = 10'h2ba;
              5'h01: out_low = 10'h2b1;
              5'h02: out_low = 10'h2a8;
              5'h03: out_low = 10'h29e;
              5'h04: out_low = 10'h295;
              5'h05: out_low = 10'h28c;
              5'h06: out_low = 10'h283;
              5'h07: out_low = 10'h27a;
              5'h08: out_low = 10'h271;
              5'h09: out_low = 10'h268;
              5'h0a: out_low = 10'h25f;
              5'h0b: out_low = 10'h257;
              5'h0c: out_low = 10'h24e;
              5'h0d: out_low = 10'h245;
              5'h0e: out_low = 10'h23c;
              5'h0f: out_low = 10'h234;
              5'h10: out_low = 10'h22b;
              5'h11: out_low = 10'h223;
              5'h12: out_low = 10'h21a;
              5'h13: out_low = 10'h212;
              5'h14: out_low = 10'h209;
              5'h15: out_low = 10'h201;
              5'h16: out_low = 10'h1f9;
              5'h17: out_low = 10'h1f0;
              5'h18: out_low = 10'h1e8;
              5'h19: out_low = 10'h1e0;
              5'h1a: out_low = 10'h1d8;
              5'h1b: out_low = 10'h1d0;
              5'h1c: out_low = 10'h1c8;
              5'h1d: out_low = 10'h1c0;
              5'h1e: out_low = 10'h1b8;
              5'h1f: out_low = 10'h1b0;
              default: out_low = 10'h000;
            endcase
          end
          5'h02: begin
            case (mant[4:0])
              5'h00: out_low = 10'h1a8;
              5'h01: out_low = 10'h1a0;
              5'h02: out_low = 10'h199;
              5'h03: out_low = 10'h191;
              5'h04: out_low = 10'h189;
              5'h05: out_low = 10'h181;
              5'h06: out_low = 10'h17a;
              5'h07: out_low = 10'h172;
              5'h08: out_low = 10'h16b;
              5'h09: out_low = 10'h163;
              5'h0a: out_low = 10'h15c;
              5'h0b: out_low = 10'h154;
              5'h0c: out_low = 10'h14d;
              5'h0d: out_low = 10'h146;
              5'h0e: out_low = 10'h13e;
              5'h0f: out_low = 10'h137;
              5'h10: out_low = 10'h130;
              5'h11: out_low = 10'h129;
              5'h12: out_low = 10'h122;
              5'h13: out_low = 10'h11b;
              5'h14: out_low = 10'h114;
              5'h15: out_low = 10'h10c;
              5'h16: out_low = 10'h106;
              5'h17: out_low = 10'h0ff;
              5'h18: out_low = 10'h0f8;
              5'h19: out_low = 10'h0f1;
              5'h1a: out_low = 10'h0ea;
              5'h1b: out_low = 10'h0e3;
              5'h1c: out_low = 10'h0dc;
              5'h1d: out_low = 10'h0d6;
              5'h1e: out_low = 10'h0cf;
              5'h1f: out_low = 10'h0c8;
              default: out_low = 10'h000;
            endcase
          end
          5'h03: begin
            case (mant[4:0])
              5'h00: out_low = 10'h0c2;
              5'h01: out_low = 10'h0bb;
              5'h02: out_low = 10'h0b5;
              5'h03: out_low = 10'h0ae;
              5'h04: out_low = 10'h0a8;
              5'h05: out_low = 10'h0a1;
              5'h06: out_low = 10'h09b;
              5'h07: out_low = 10'h094;
              5'h08: out_low = 10'h08e;
              5'h09: out_low = 10'h088;
              5'h0a: out_low = 10'h082;
              5'h0b: out_low = 10'h07b;
              5'h0c: out_low = 10'h075;
              5'h0d: out_low = 10'h06f;
              5'h0e: out_low = 10'h069;
              5'h0f: out_low = 10'h063;
              5'h10: out_low = 10'h05d;
              5'h11: out_low = 10'h057;
              5'h12: out_low = 10'h051;
              5'h13: out_low = 10'h04b;
              5'h14: out_low = 10'h045;
              5'h15: out_low = 10'h03f;
              5'h16: out_low = 10'h039;
              5'h17: out_low = 10'h033;
              5'h18: out_low = 10'h02d;
              5'h19: out_low = 10'h028;
              5'h1a: out_low = 10'h022;
              5'h1b: out_low = 10'h01c;
              5'h1c: out_low = 10'h016;
              5'h1d: out_low = 10'h011;
              5'h1e: out_low = 10'h00b;
              5'h1f: out_low = 10'h006;
              default: out_low = 10'h000;
            endcase
          end
          5'h04: begin
            case (mant[4:0])
              5'h00: out_low = 10'h000;
              5'h01: out_low = 10'h3f5;
              5'h02: out_low = 10'h3ea;
              5'h03: out_low = 10'h3df;
              5'h04: out_low = 10'h3d4;
              5'h05: out_low = 10'h3c9;
              5'h06: out_low = 10'h3bf;
              5'h07: out_low = 10'h3b4;
              5'h08: out_low = 10'h3a9;
              5'h09: out_low = 10'h39f;
              5'h0a: out_low = 10'h394;
              5'h0b: out_low = 10'h38a;
              5'h0c: out_low = 10'h37f;
              5'h0d: out_low = 10'h375;
              5'h0e: out_low = 10'h36a;
              5'h0f: out_low = 10'h360;
              5'h10: out_low = 10'h356;
              5'h11: out_low = 10'h34c;
              5'h12: out_low = 10'h342;
              5'h13: out_low = 10'h338;
              5'h14: out_low = 10'h32e;
              5'h15: out_low = 10'h324;
              5'h16: out_low = 10'h31a;
              5'h17: out_low = 10'h310;
              5'h18: out_low = 10'h306;
              5'h19: out_low = 10'h2fd;
              5'h1a: out_low = 10'h2f3;
              5'h1b: out_low = 10'h2e9;
              5'h1c: out_low = 10'h2e0;
              5'h1d: out_low = 10'h2d6;
              5'h1e: out_low = 10'h2cd;
              5'h1f: out_low = 10'h2c4;
              default: out_low = 10'h000;
            endcase
          end
          5'h05: begin
            case (mant[4:0])
              5'h00: out_low = 10'h2ba;
              5'h01: out_low = 10'h2b1;
              5'h02: out_low = 10'h2a8;
              5'h03: out_low = 10'h29e;
              5'h04: out_low = 10'h295;
              5'h05: out_low = 10'h28c;
              5'h06: out_low = 10'h283;
              5'h07: out_low = 10'h27a;
              5'h08: out_low = 10'h271;
              5'h09: out_low = 10'h268;
              5'h0a: out_low = 10'h25f;
              5'h0b: out_low = 10'h257;
              5'h0c: out_low = 10'h24e;
              5'h0d: out_low = 10'h245;
              5'h0e: out_low = 10'h23c;
              5'h0f: out_low = 10'h234;
              5'h10: out_low = 10'h22b;
              5'h11: out_low = 10'h223;
              5'h12: out_low = 10'h21a;
              5'h13: out_low = 10'h212;
              5'h14: out_low = 10'h209;
              5'h15: out_low = 10'h201;
              5'h16: out_low = 10'h1f9;
              5'h17: out_low = 10'h1f0;
              5'h18: out_low = 10'h1e8;
              5'h19: out_low = 10'h1e0;
              5'h1a: out_low = 10'h1d8;
              5'h1b: out_low = 10'h1d0;
              5'h1c: out_low = 10'h1c8;
              5'h1d: out_low = 10'h1c0;
              5'h1e: out_low = 10'h1b8;
              5'h1f: out_low = 10'h1b0;
              default: out_low = 10'h000;
            endcase
          end
          5'h06: begin
            case (mant[4:0])
              5'h00: out_low = 10'h1a8;
              5'h01: out_low = 10'h1a0;
              5'h02: out_low = 10'h199;
              5'h03: out_low = 10'h191;
              5'h04: out_low = 10'h189;
              5'h05: out_low = 10'h181;
              5'h06: out_low = 10'h17a;
              5'h07: out_low = 10'h172;
              5'h08: out_low = 10'h16b;
              5'h09: out_low = 10'h163;
              5'h0a: out_low = 10'h15c;
              5'h0b: out_low = 10'h154;
              5'h0c: out_low = 10'h14d;
              5'h0d: out_low = 10'h146;
              5'h0e: out_low = 10'h13e;
              5'h0f: out_low = 10'h137;
              5'h10: out_low = 10'h130;
              5'h11: out_low = 10'h129;
              5'h12: out_low = 10'h122;
              5'h13: out_low = 10'h11b;
              5'h14: out_low = 10'h114;
              5'h15: out_low = 10'h10c;
              5'h16: out_low = 10'h106;
              5'h17: out_low = 10'h0ff;
              5'h18: out_low = 10'h0f8;
              5'h19: out_low = 10'h0f1;
              5'h1a: out_low = 10'h0ea;
              5'h1b: out_low = 10'h0e3;
              5'h1c: out_low = 10'h0dc;
              5'h1d: out_low = 10'h0d6;
              5'h1e: out_low = 10'h0cf;
              5'h1f: out_low = 10'h0c8;
              default: out_low = 10'h000;
            endcase
          end
          5'h07: begin
            case (mant[4:0])
              5'h00: out_low = 10'h0c2;
              5'h01: out_low = 10'h0bb;
              5'h02: out_low = 10'h0b5;
              5'h03: out_low = 10'h0ae;
              5'h04: out_low = 10'h0a8;
              5'h05: out_low = 10'h0a1;
              5'h06: out_low = 10'h09b;
              5'h07: out_low = 10'h094;
              5'h08: out_low = 10'h08e;
              5'h09: out_low = 10'h088;
              5'h0a: out_low = 10'h082;
              5'h0b: out_low = 10'h07b;
              5'h0c: out_low = 10'h075;
              5'h0d: out_low = 10'h06f;
              5'h0e: out_low = 10'h069;
              5'h0f: out_low = 10'h063;
              5'h10: out_low = 10'h05d;
              5'h11: out_low = 10'h057;
              5'h12: out_low = 10'h051;
              5'h13: out_low = 10'h04b;
              5'h14: out_low = 10'h045;
              5'h15: out_low = 10'h03f;
              5'h16: out_low = 10'h039;
              5'h17: out_low = 10'h033;
              5'h18: out_low = 10'h02d;
              5'h19: out_low = 10'h028;
              5'h1a: out_low = 10'h022;
              5'h1b: out_low = 10'h01c;
              5'h1c: out_low = 10'h016;
              5'h1d: out_low = 10'h011;
              5'h1e: out_low = 10'h00b;
              5'h1f: out_low = 10'h006;
              default: out_low = 10'h000;
            endcase
          end
          5'h08: begin
            case (mant[4:0])
              5'h00: out_low = 10'h000;
              5'h01: out_low = 10'h3f5;
              5'h02: out_low = 10'h3ea;
              5'h03: out_low = 10'h3df;
              5'h04: out_low = 10'h3d4;
              5'h05: out_low = 10'h3c9;
              5'h06: out_low = 10'h3bf;
              5'h07: out_low = 10'h3b4;
              5'h08: out_low = 10'h3a9;
              5'h09: out_low = 10'h39f;
              5'h0a: out_low = 10'h394;
              5'h0b: out_low = 10'h38a;
              5'h0c: out_low = 10'h37f;
              5'h0d: out_low = 10'h375;
              5'h0e: out_low = 10'h36a;
              5'h0f: out_low = 10'h360;
              5'h10: out_low = 10'h356;
              5'h11: out_low = 10'h34c;
              5'h12: out_low = 10'h342;
              5'h13: out_low = 10'h338;
              5'h14: out_low = 10'h32e;
              5'h15: out_low = 10'h324;
              5'h16: out_low = 10'h31a;
              5'h17: out_low = 10'h310;
              5'h18: out_low = 10'h306;
              5'h19: out_low = 10'h2fd;
              5'h1a: out_low = 10'h2f3;
              5'h1b: out_low = 10'h2e9;
              5'h1c: out_low = 10'h2e0;
              5'h1d: out_low = 10'h2d6;
              5'h1e: out_low = 10'h2cd;
              5'h1f: out_low = 10'h2c4;
              default: out_low = 10'h000;
            endcase
          end
          5'h09: begin
            case (mant[4:0])
              5'h00: out_low = 10'h2ba;
              5'h01: out_low = 10'h2b1;
              5'h02: out_low = 10'h2a8;
              5'h03: out_low = 10'h29e;
              5'h04: out_low = 10'h295;
              5'h05: out_low = 10'h28c;
              5'h06: out_low = 10'h283;
              5'h07: out_low = 10'h27a;
              5'h08: out_low = 10'h271;
              5'h09: out_low = 10'h268;
              5'h0a: out_low = 10'h25f;
              5'h0b: out_low = 10'h257;
              5'h0c: out_low = 10'h24e;
              5'h0d: out_low = 10'h245;
              5'h0e: out_low = 10'h23c;
              5'h0f: out_low = 10'h234;
              5'h10: out_low = 10'h22b;
              5'h11: out_low = 10'h223;
              5'h12: out_low = 10'h21a;
              5'h13: out_low = 10'h212;
              5'h14: out_low = 10'h209;
              5'h15: out_low = 10'h201;
              5'h16: out_low = 10'h1f9;
              5'h17: out_low = 10'h1f0;
              5'h18: out_low = 10'h1e8;
              5'h19: out_low = 10'h1e0;
              5'h1a: out_low = 10'h1d8;
              5'h1b: out_low = 10'h1d0;
              5'h1c: out_low = 10'h1c8;
              5'h1d: out_low = 10'h1c0;
              5'h1e: out_low = 10'h1b8;
              5'h1f: out_low = 10'h1b0;
              default: out_low = 10'h000;
            endcase
          end
          5'h0a: begin
            case (mant[4:0])
              5'h00: out_low = 10'h1a8;
              5'h01: out_low = 10'h1a0;
              5'h02: out_low = 10'h199;
              5'h03: out_low = 10'h191;
              5'h04: out_low = 10'h189;
              5'h05: out_low = 10'h181;
              5'h06: out_low = 10'h17a;
              5'h07: out_low = 10'h172;
              5'h08: out_low = 10'h16b;
              5'h09: out_low = 10'h163;
              5'h0a: out_low = 10'h15c;
              5'h0b: out_low = 10'h154;
              5'h0c: out_low = 10'h14d;
              5'h0d: out_low = 10'h146;
              5'h0e: out_low = 10'h13e;
              5'h0f: out_low = 10'h137;
              5'h10: out_low = 10'h130;
              5'h11: out_low = 10'h129;
              5'h12: out_low = 10'h122;
              5'h13: out_low = 10'h11b;
              5'h14: out_low = 10'h114;
              5'h15: out_low = 10'h10c;
              5'h16: out_low = 10'h106;
              5'h17: out_low = 10'h0ff;
              5'h18: out_low = 10'h0f8;
              5'h19: out_low = 10'h0f1;
              5'h1a: out_low = 10'h0ea;
              5'h1b: out_low = 10'h0e3;
              5'h1c: out_low = 10'h0dc;
              5'h1d: out_low = 10'h0d6;
              5'h1e: out_low = 10'h0cf;
              5'h1f: out_low = 10'h0c8;
              default: out_low = 10'h000;
            endcase
          end
          5'h0b: begin
            case (mant[4:0])
              5'h00: out_low = 10'h0c2;
              5'h01: out_low = 10'h0bb;
              5'h02: out_low = 10'h0b5;
              5'h03: out_low = 10'h0ae;
              5'h04: out_low = 10'h0a8;
              5'h05: out_low = 10'h0a1;
              5'h06: out_low = 10'h09b;
              5'h07: out_low = 10'h094;
              5'h08: out_low = 10'h08e;
              5'h09: out_low = 10'h088;
              5'h0a: out_low = 10'h082;
              5'h0b: out_low = 10'h07b;
              5'h0c: out_low = 10'h075;
              5'h0d: out_low = 10'h06f;
              5'h0e: out_low = 10'h069;
              5'h0f: out_low = 10'h063;
              5'h10: out_low = 10'h05d;
              5'h11: out_low = 10'h057;
              5'h12: out_low = 10'h051;
              5'h13: out_low = 10'h04b;
              5'h14: out_low = 10'h045;
              5'h15: out_low = 10'h03f;
              5'h16: out_low = 10'h039;
              5'h17: out_low = 10'h033;
              5'h18: out_low = 10'h02d;
              5'h19: out_low = 10'h028;
              5'h1a: out_low = 10'h022;
              5'h1b: out_low = 10'h01c;
              5'h1c: out_low = 10'h016;
              5'h1d: out_low = 10'h011;
              5'h1e: out_low = 10'h00b;
              5'h1f: out_low = 10'h006;
              default: out_low = 10'h000;
            endcase
          end
          5'h0c: begin
            case (mant[4:0])
              5'h00: out_low = 10'h000;
              5'h01: out_low = 10'h3f5;
              5'h02: out_low = 10'h3ea;
              5'h03: out_low = 10'h3df;
              5'h04: out_low = 10'h3d4;
              5'h05: out_low = 10'h3c9;
              5'h06: out_low = 10'h3bf;
              5'h07: out_low = 10'h3b4;
              5'h08: out_low = 10'h3a9;
              5'h09: out_low = 10'h39f;
              5'h0a: out_low = 10'h394;
              5'h0b: out_low = 10'h38a;
              5'h0c: out_low = 10'h37f;
              5'h0d: out_low = 10'h375;
              5'h0e: out_low = 10'h36a;
              5'h0f: out_low = 10'h360;
              5'h10: out_low = 10'h356;
              5'h11: out_low = 10'h34c;
              5'h12: out_low = 10'h342;
              5'h13: out_low = 10'h338;
              5'h14: out_low = 10'h32e;
              5'h15: out_low = 10'h324;
              5'h16: out_low = 10'h31a;
              5'h17: out_low = 10'h310;
              5'h18: out_low = 10'h306;
              5'h19: out_low = 10'h2fd;
              5'h1a: out_low = 10'h2f3;
              5'h1b: out_low = 10'h2e9;
              5'h1c: out_low = 10'h2e0;
              5'h1d: out_low = 10'h2d6;
              5'h1e: out_low = 10'h2cd;
              5'h1f: out_low = 10'h2c4;
              default: out_low = 10'h000;
            endcase
          end
          5'h0d: begin
            case (mant[4:0])
              5'h00: out_low = 10'h2ba;
              5'h01: out_low = 10'h2b1;
              5'h02: out_low = 10'h2a8;
              5'h03: out_low = 10'h29e;
              5'h04: out_low = 10'h295;
              5'h05: out_low = 10'h28c;
              5'h06: out_low = 10'h283;
              5'h07: out_low = 10'h27a;
              5'h08: out_low = 10'h271;
              5'h09: out_low = 10'h268;
              5'h0a: out_low = 10'h25f;
              5'h0b: out_low = 10'h257;
              5'h0c: out_low = 10'h24e;
              5'h0d: out_low = 10'h245;
              5'h0e: out_low = 10'h23c;
              5'h0f: out_low = 10'h234;
              5'h10: out_low = 10'h22b;
              5'h11: out_low = 10'h223;
              5'h12: out_low = 10'h21a;
              5'h13: out_low = 10'h212;
              5'h14: out_low = 10'h209;
              5'h15: out_low = 10'h201;
              5'h16: out_low = 10'h1f9;
              5'h17: out_low = 10'h1f0;
              5'h18: out_low = 10'h1e8;
              5'h19: out_low = 10'h1e0;
              5'h1a: out_low = 10'h1d8;
              5'h1b: out_low = 10'h1d0;
              5'h1c: out_low = 10'h1c8;
              5'h1d: out_low = 10'h1c0;
              5'h1e: out_low = 10'h1b8;
              5'h1f: out_low = 10'h1b0;
              default: out_low = 10'h000;
            endcase
          end
          5'h0e: begin
            case (mant[4:0])
              5'h00: out_low = 10'h1a8;
              5'h01: out_low = 10'h1a0;
              5'h02: out_low = 10'h199;
              5'h03: out_low = 10'h191;
              5'h04: out_low = 10'h189;
              5'h05: out_low = 10'h181;
              5'h06: out_low = 10'h17a;
              5'h07: out_low = 10'h172;
              5'h08: out_low = 10'h16b;
              5'h09: out_low = 10'h163;
              5'h0a: out_low = 10'h15c;
              5'h0b: out_low = 10'h154;
              5'h0c: out_low = 10'h14d;
              5'h0d: out_low = 10'h146;
              5'h0e: out_low = 10'h13e;
              5'h0f: out_low = 10'h137;
              5'h10: out_low = 10'h130;
              5'h11: out_low = 10'h129;
              5'h12: out_low = 10'h122;
              5'h13: out_low = 10'h11b;
              5'h14: out_low = 10'h114;
              5'h15: out_low = 10'h10c;
              5'h16: out_low = 10'h106;
              5'h17: out_low = 10'h0ff;
              5'h18: out_low = 10'h0f8;
              5'h19: out_low = 10'h0f1;
              5'h1a: out_low = 10'h0ea;
              5'h1b: out_low = 10'h0e3;
              5'h1c: out_low = 10'h0dc;
              5'h1d: out_low = 10'h0d6;
              5'h1e: out_low = 10'h0cf;
              5'h1f: out_low = 10'h0c8;
              default: out_low = 10'h000;
            endcase
          end
          5'h0f: begin
            case (mant[4:0])
              5'h00: out_low = 10'h0c2;
              5'h01: out_low = 10'h0bb;
              5'h02: out_low = 10'h0b5;
              5'h03: out_low = 10'h0ae;
              5'h04: out_low = 10'h0a8;
              5'h05: out_low = 10'h0a1;
              5'h06: out_low = 10'h09b;
              5'h07: out_low = 10'h094;
              5'h08: out_low = 10'h08e;
              5'h09: out_low = 10'h088;
              5'h0a: out_low = 10'h082;
              5'h0b: out_low = 10'h07b;
              5'h0c: out_low = 10'h075;
              5'h0d: out_low = 10'h06f;
              5'h0e: out_low = 10'h069;
              5'h0f: out_low = 10'h063;
              5'h10: out_low = 10'h05d;
              5'h11: out_low = 10'h057;
              5'h12: out_low = 10'h051;
              5'h13: out_low = 10'h04b;
              5'h14: out_low = 10'h045;
              5'h15: out_low = 10'h03f;
              5'h16: out_low = 10'h039;
              5'h17: out_low = 10'h033;
              5'h18: out_low = 10'h02d;
              5'h19: out_low = 10'h028;
              5'h1a: out_low = 10'h022;
              5'h1b: out_low = 10'h01c;
              5'h1c: out_low = 10'h016;
              5'h1d: out_low = 10'h011;
              5'h1e: out_low = 10'h00b;
              5'h1f: out_low = 10'h006;
              default: out_low = 10'h000;
            endcase
          end
          5'h10: begin
            case (mant[4:0])
              5'h00: out_low = 10'h000;
              5'h01: out_low = 10'h3f5;
              5'h02: out_low = 10'h3ea;
              5'h03: out_low = 10'h3df;
              5'h04: out_low = 10'h3d4;
              5'h05: out_low = 10'h3c9;
              5'h06: out_low = 10'h3bf;
              5'h07: out_low = 10'h3b4;
              5'h08: out_low = 10'h3a9;
              5'h09: out_low = 10'h39f;
              5'h0a: out_low = 10'h394;
              5'h0b: out_low = 10'h38a;
              5'h0c: out_low = 10'h37f;
              5'h0d: out_low = 10'h375;
              5'h0e: out_low = 10'h36a;
              5'h0f: out_low = 10'h360;
              5'h10: out_low = 10'h356;
              5'h11: out_low = 10'h34c;
              5'h12: out_low = 10'h342;
              5'h13: out_low = 10'h338;
              5'h14: out_low = 10'h32e;
              5'h15: out_low = 10'h324;
              5'h16: out_low = 10'h31a;
              5'h17: out_low = 10'h310;
              5'h18: out_low = 10'h306;
              5'h19: out_low = 10'h2fd;
              5'h1a: out_low = 10'h2f3;
              5'h1b: out_low = 10'h2e9;
              5'h1c: out_low = 10'h2e0;
              5'h1d: out_low = 10'h2d6;
              5'h1e: out_low = 10'h2cd;
              5'h1f: out_low = 10'h2c4;
              default: out_low = 10'h000;
            endcase
          end
          5'h11: begin
            case (mant[4:0])
              5'h00: out_low = 10'h2ba;
              5'h01: out_low = 10'h2b1;
              5'h02: out_low = 10'h2a8;
              5'h03: out_low = 10'h29e;
              5'h04: out_low = 10'h295;
              5'h05: out_low = 10'h28c;
              5'h06: out_low = 10'h283;
              5'h07: out_low = 10'h27a;
              5'h08: out_low = 10'h271;
              5'h09: out_low = 10'h268;
              5'h0a: out_low = 10'h25f;
              5'h0b: out_low = 10'h257;
              5'h0c: out_low = 10'h24e;
              5'h0d: out_low = 10'h245;
              5'h0e: out_low = 10'h23c;
              5'h0f: out_low = 10'h234;
              5'h10: out_low = 10'h22b;
              5'h11: out_low = 10'h223;
              5'h12: out_low = 10'h21a;
              5'h13: out_low = 10'h212;
              5'h14: out_low = 10'h209;
              5'h15: out_low = 10'h201;
              5'h16: out_low = 10'h1f9;
              5'h17: out_low = 10'h1f0;
              5'h18: out_low = 10'h1e8;
              5'h19: out_low = 10'h1e0;
              5'h1a: out_low = 10'h1d8;
              5'h1b: out_low = 10'h1d0;
              5'h1c: out_low = 10'h1c8;
              5'h1d: out_low = 10'h1c0;
              5'h1e: out_low = 10'h1b8;
              5'h1f: out_low = 10'h1b0;
              default: out_low = 10'h000;
            endcase
          end
          5'h12: begin
            case (mant[4:0])
              5'h00: out_low = 10'h1a8;
              5'h01: out_low = 10'h1a0;
              5'h02: out_low = 10'h199;
              5'h03: out_low = 10'h191;
              5'h04: out_low = 10'h189;
              5'h05: out_low = 10'h181;
              5'h06: out_low = 10'h17a;
              5'h07: out_low = 10'h172;
              5'h08: out_low = 10'h16b;
              5'h09: out_low = 10'h163;
              5'h0a: out_low = 10'h15c;
              5'h0b: out_low = 10'h154;
              5'h0c: out_low = 10'h14d;
              5'h0d: out_low = 10'h146;
              5'h0e: out_low = 10'h13e;
              5'h0f: out_low = 10'h137;
              5'h10: out_low = 10'h130;
              5'h11: out_low = 10'h129;
              5'h12: out_low = 10'h122;
              5'h13: out_low = 10'h11b;
              5'h14: out_low = 10'h114;
              5'h15: out_low = 10'h10c;
              5'h16: out_low = 10'h106;
              5'h17: out_low = 10'h0ff;
              5'h18: out_low = 10'h0f8;
              5'h19: out_low = 10'h0f1;
              5'h1a: out_low = 10'h0ea;
              5'h1b: out_low = 10'h0e3;
              5'h1c: out_low = 10'h0dc;
              5'h1d: out_low = 10'h0d6;
              5'h1e: out_low = 10'h0cf;
              5'h1f: out_low = 10'h0c8;
              default: out_low = 10'h000;
            endcase
          end
          5'h13: begin
            case (mant[4:0])
              5'h00: out_low = 10'h0c2;
              5'h01: out_low = 10'h0bb;
              5'h02: out_low = 10'h0b5;
              5'h03: out_low = 10'h0ae;
              5'h04: out_low = 10'h0a8;
              5'h05: out_low = 10'h0a1;
              5'h06: out_low = 10'h09b;
              5'h07: out_low = 10'h094;
              5'h08: out_low = 10'h08e;
              5'h09: out_low = 10'h088;
              5'h0a: out_low = 10'h082;
              5'h0b: out_low = 10'h07b;
              5'h0c: out_low = 10'h075;
              5'h0d: out_low = 10'h06f;
              5'h0e: out_low = 10'h069;
              5'h0f: out_low = 10'h063;
              5'h10: out_low = 10'h05d;
              5'h11: out_low = 10'h057;
              5'h12: out_low = 10'h051;
              5'h13: out_low = 10'h04b;
              5'h14: out_low = 10'h045;
              5'h15: out_low = 10'h03f;
              5'h16: out_low = 10'h039;
              5'h17: out_low = 10'h033;
              5'h18: out_low = 10'h02d;
              5'h19: out_low = 10'h028;
              5'h1a: out_low = 10'h022;
              5'h1b: out_low = 10'h01c;
              5'h1c: out_low = 10'h016;
              5'h1d: out_low = 10'h011;
              5'h1e: out_low = 10'h00b;
              5'h1f: out_low = 10'h006;
              default: out_low = 10'h000;
            endcase
          end
          5'h14: begin
            case (mant[4:0])
              5'h00: out_low = 10'h000;
              5'h01: out_low = 10'h3f5;
              5'h02: out_low = 10'h3ea;
              5'h03: out_low = 10'h3df;
              5'h04: out_low = 10'h3d4;
              5'h05: out_low = 10'h3c9;
              5'h06: out_low = 10'h3bf;
              5'h07: out_low = 10'h3b4;
              5'h08: out_low = 10'h3a9;
              5'h09: out_low = 10'h39f;
              5'h0a: out_low = 10'h394;
              5'h0b: out_low = 10'h38a;
              5'h0c: out_low = 10'h37f;
              5'h0d: out_low = 10'h375;
              5'h0e: out_low = 10'h36a;
              5'h0f: out_low = 10'h360;
              5'h10: out_low = 10'h356;
              5'h11: out_low = 10'h34c;
              5'h12: out_low = 10'h342;
              5'h13: out_low = 10'h338;
              5'h14: out_low = 10'h32e;
              5'h15: out_low = 10'h324;
              5'h16: out_low = 10'h31a;
              5'h17: out_low = 10'h310;
              5'h18: out_low = 10'h306;
              5'h19: out_low = 10'h2fd;
              5'h1a: out_low = 10'h2f3;
              5'h1b: out_low = 10'h2e9;
              5'h1c: out_low = 10'h2e0;
              5'h1d: out_low = 10'h2d6;
              5'h1e: out_low = 10'h2cd;
              5'h1f: out_low = 10'h2c4;
              default: out_low = 10'h000;
            endcase
          end
          5'h15: begin
            case (mant[4:0])
              5'h00: out_low = 10'h2ba;
              5'h01: out_low = 10'h2b1;
              5'h02: out_low = 10'h2a8;
              5'h03: out_low = 10'h29e;
              5'h04: out_low = 10'h295;
              5'h05: out_low = 10'h28c;
              5'h06: out_low = 10'h283;
              5'h07: out_low = 10'h27a;
              5'h08: out_low = 10'h271;
              5'h09: out_low = 10'h268;
              5'h0a: out_low = 10'h25f;
              5'h0b: out_low = 10'h257;
              5'h0c: out_low = 10'h24e;
              5'h0d: out_low = 10'h245;
              5'h0e: out_low = 10'h23c;
              5'h0f: out_low = 10'h234;
              5'h10: out_low = 10'h22b;
              5'h11: out_low = 10'h223;
              5'h12: out_low = 10'h21a;
              5'h13: out_low = 10'h212;
              5'h14: out_low = 10'h209;
              5'h15: out_low = 10'h201;
              5'h16: out_low = 10'h1f9;
              5'h17: out_low = 10'h1f0;
              5'h18: out_low = 10'h1e8;
              5'h19: out_low = 10'h1e0;
              5'h1a: out_low = 10'h1d8;
              5'h1b: out_low = 10'h1d0;
              5'h1c: out_low = 10'h1c8;
              5'h1d: out_low = 10'h1c0;
              5'h1e: out_low = 10'h1b8;
              5'h1f: out_low = 10'h1b0;
              default: out_low = 10'h000;
            endcase
          end
          5'h16: begin
            case (mant[4:0])
              5'h00: out_low = 10'h1a8;
              5'h01: out_low = 10'h1a0;
              5'h02: out_low = 10'h199;
              5'h03: out_low = 10'h191;
              5'h04: out_low = 10'h189;
              5'h05: out_low = 10'h181;
              5'h06: out_low = 10'h17a;
              5'h07: out_low = 10'h172;
              5'h08: out_low = 10'h16b;
              5'h09: out_low = 10'h163;
              5'h0a: out_low = 10'h15c;
              5'h0b: out_low = 10'h154;
              5'h0c: out_low = 10'h14d;
              5'h0d: out_low = 10'h146;
              5'h0e: out_low = 10'h13e;
              5'h0f: out_low = 10'h137;
              5'h10: out_low = 10'h130;
              5'h11: out_low = 10'h129;
              5'h12: out_low = 10'h122;
              5'h13: out_low = 10'h11b;
              5'h14: out_low = 10'h114;
              5'h15: out_low = 10'h10c;
              5'h16: out_low = 10'h106;
              5'h17: out_low = 10'h0ff;
              5'h18: out_low = 10'h0f8;
              5'h19: out_low = 10'h0f1;
              5'h1a: out_low = 10'h0ea;
              5'h1b: out_low = 10'h0e3;
              5'h1c: out_low = 10'h0dc;
              5'h1d: out_low = 10'h0d6;
              5'h1e: out_low = 10'h0cf;
              5'h1f: out_low = 10'h0c8;
              default: out_low = 10'h000;
            endcase
          end
          5'h17: begin
            case (mant[4:0])
              5'h00: out_low = 10'h0c2;
              5'h01: out_low = 10'h0bb;
              5'h02: out_low = 10'h0b5;
              5'h03: out_low = 10'h0ae;
              5'h04: out_low = 10'h0a8;
              5'h05: out_low = 10'h0a1;
              5'h06: out_low = 10'h09b;
              5'h07: out_low = 10'h094;
              5'h08: out_low = 10'h08e;
              5'h09: out_low = 10'h088;
              5'h0a: out_low = 10'h082;
              5'h0b: out_low = 10'h07b;
              5'h0c: out_low = 10'h075;
              5'h0d: out_low = 10'h06f;
              5'h0e: out_low = 10'h069;
              5'h0f: out_low = 10'h063;
              5'h10: out_low = 10'h05d;
              5'h11: out_low = 10'h057;
              5'h12: out_low = 10'h051;
              5'h13: out_low = 10'h04b;
              5'h14: out_low = 10'h045;
              5'h15: out_low = 10'h03f;
              5'h16: out_low = 10'h039;
              5'h17: out_low = 10'h033;
              5'h18: out_low = 10'h02d;
              5'h19: out_low = 10'h028;
              5'h1a: out_low = 10'h022;
              5'h1b: out_low = 10'h01c;
              5'h1c: out_low = 10'h016;
              5'h1d: out_low = 10'h011;
              5'h1e: out_low = 10'h00b;
              5'h1f: out_low = 10'h006;
              default: out_low = 10'h000;
            endcase
          end
          5'h18: out_low = 10'h000;
          5'h19: out_low = 10'h000;
          5'h1a: out_low = 10'h000;
          5'h1b: out_low = 10'h000;
          5'h1c: out_low = 10'h000;
          5'h1d: out_low = 10'h000;
          5'h1e: out_low = 10'h000;
          5'h1f: out_low = 10'h000;
          default: out_low = 10'h000;
        endcase
      end
      6'h3f: begin
        case (mant[9:5])
          5'h00: begin
            case (mant[4:0])
              5'h00: out_low = 10'h000;
              5'h01: out_low = 10'h200;
              5'h02: out_low = 10'h200;
              5'h03: out_low = 10'h200;
              5'h04: out_low = 10'h200;
              5'h05: out_low = 10'h200;
              5'h06: out_low = 10'h200;
              5'h07: out_low = 10'h200;
              5'h08: out_low = 10'h200;
              5'h09: out_low = 10'h200;
              5'h0a: out_low = 10'h200;
              5'h0b: out_low = 10'h200;
              5'h0c: out_low = 10'h200;
              5'h0d: out_low = 10'h200;
              5'h0e: out_low = 10'h200;
              5'h0f: out_low = 10'h200;
              5'h10: out_low = 10'h200;
              5'h11: out_low = 10'h200;
              5'h12: out_low = 10'h200;
              5'h13: out_low = 10'h200;
              5'h14: out_low = 10'h200;
              5'h15: out_low = 10'h200;
              5'h16: out_low = 10'h200;
              5'h17: out_low = 10'h200;
              5'h18: out_low = 10'h200;
              5'h19: out_low = 10'h200;
              5'h1a: out_low = 10'h200;
              5'h1b: out_low = 10'h200;
              5'h1c: out_low = 10'h200;
              5'h1d: out_low = 10'h200;
              5'h1e: out_low = 10'h200;
              5'h1f: out_low = 10'h200;
              default: out_low = 10'h000;
            endcase
          end
          5'h01: out_low = 10'h200;
          5'h02: out_low = 10'h200;
          5'h03: out_low = 10'h200;
          5'h04: out_low = 10'h200;
          5'h05: out_low = 10'h200;
          5'h06: out_low = 10'h200;
          5'h07: out_low = 10'h200;
          5'h08: out_low = 10'h200;
          5'h09: out_low = 10'h200;
          5'h0a: out_low = 10'h200;
          5'h0b: out_low = 10'h200;
          5'h0c: out_low = 10'h200;
          5'h0d: out_low = 10'h200;
          5'h0e: out_low = 10'h200;
          5'h0f: out_low = 10'h200;
          5'h10: out_low = 10'h200;
          5'h11: out_low = 10'h200;
          5'h12: out_low = 10'h200;
          5'h13: out_low = 10'h200;
          5'h14: out_low = 10'h200;
          5'h15: out_low = 10'h200;
          5'h16: out_low = 10'h200;
          5'h17: out_low = 10'h200;
          5'h18: out_low = 10'h200;
          5'h19: out_low = 10'h200;
          5'h1a: out_low = 10'h200;
          5'h1b: out_low = 10'h200;
          5'h1c: out_low = 10'h200;
          5'h1d: out_low = 10'h200;
          5'h1e: out_low = 10'h200;
          5'h1f: out_low = 10'h200;
          default: out_low = 10'h000;
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
  wire [15:0] normal_out = {out_b15, out_b14, out_b13, out_b12, out_b11, out_b10, out_low};
  assign out = active_group ? normal_out : special_out;
endmodule
