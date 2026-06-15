module ex221_varying_signexp_wordmode_mh5(in, out);
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
  reg [15:0] normal_out;
  always @* begin
    normal_out = 16'h0000;
    case (sign_exp)
      6'h04: begin
        case (mant[9:5])
          5'h00: normal_out = 16'h3c00;
          5'h01: normal_out = 16'h3c00;
          5'h02: normal_out = 16'h3c00;
          5'h03: normal_out = 16'h3c00;
          5'h04: normal_out = 16'h3c00;
          5'h05: normal_out = 16'h3c00;
          5'h06: normal_out = 16'h3c00;
          5'h07: normal_out = 16'h3c00;
          5'h08: normal_out = 16'h3c00;
          5'h09: normal_out = 16'h3c00;
          5'h0a: normal_out = 16'h3c00;
          5'h0b: normal_out = 16'h3c00;
          5'h0c: normal_out = 16'h3c00;
          5'h0d: normal_out = 16'h3c00;
          5'h0e: begin
            normal_out = 16'h3c01;
            case (mant[4:0])
              5'h00: normal_out = 16'h3c00;
              5'h01: normal_out = 16'h3c00;
              5'h02: normal_out = 16'h3c00;
              5'h03: normal_out = 16'h3c00;
              5'h04: normal_out = 16'h3c00;
              5'h05: normal_out = 16'h3c00;
              default: begin end
            endcase
          end
          5'h0f: normal_out = 16'h3c01;
          5'h10: normal_out = 16'h3c01;
          5'h11: normal_out = 16'h3c01;
          5'h12: normal_out = 16'h3c01;
          5'h13: normal_out = 16'h3c01;
          5'h14: normal_out = 16'h3c01;
          5'h15: normal_out = 16'h3c01;
          5'h16: normal_out = 16'h3c01;
          5'h17: normal_out = 16'h3c01;
          5'h18: normal_out = 16'h3c01;
          5'h19: normal_out = 16'h3c01;
          5'h1a: normal_out = 16'h3c01;
          5'h1b: normal_out = 16'h3c01;
          5'h1c: normal_out = 16'h3c01;
          5'h1d: normal_out = 16'h3c01;
          5'h1e: normal_out = 16'h3c01;
          5'h1f: normal_out = 16'h3c01;
          default: begin end
        endcase
      end
      6'h06: begin
        case (mant[9:5])
          5'h00: normal_out = 16'h3c01;
          5'h01: normal_out = 16'h3c01;
          5'h02: begin
            normal_out = 16'h3c01;
            case (mant[4:0])
              5'h14: normal_out = 16'h3c02;
              5'h15: normal_out = 16'h3c02;
              5'h16: normal_out = 16'h3c02;
              5'h17: normal_out = 16'h3c02;
              5'h18: normal_out = 16'h3c02;
              5'h19: normal_out = 16'h3c02;
              5'h1a: normal_out = 16'h3c02;
              5'h1b: normal_out = 16'h3c02;
              5'h1c: normal_out = 16'h3c02;
              5'h1d: normal_out = 16'h3c02;
              5'h1e: normal_out = 16'h3c02;
              5'h1f: normal_out = 16'h3c02;
              default: begin end
            endcase
          end
          5'h03: normal_out = 16'h3c02;
          5'h04: normal_out = 16'h3c02;
          5'h05: normal_out = 16'h3c02;
          5'h06: normal_out = 16'h3c02;
          5'h07: normal_out = 16'h3c02;
          5'h08: normal_out = 16'h3c02;
          5'h09: normal_out = 16'h3c02;
          5'h0a: normal_out = 16'h3c02;
          5'h0b: normal_out = 16'h3c02;
          5'h0c: normal_out = 16'h3c02;
          5'h0d: normal_out = 16'h3c02;
          5'h0e: normal_out = 16'h3c02;
          5'h0f: normal_out = 16'h3c02;
          5'h10: normal_out = 16'h3c02;
          5'h11: normal_out = 16'h3c02;
          5'h12: normal_out = 16'h3c02;
          5'h13: normal_out = 16'h3c02;
          5'h14: normal_out = 16'h3c02;
          5'h15: normal_out = 16'h3c02;
          5'h16: normal_out = 16'h3c02;
          5'h17: normal_out = 16'h3c02;
          5'h18: normal_out = 16'h3c02;
          5'h19: begin
            normal_out = 16'h3c02;
            case (mant[4:0])
              5'h15: normal_out = 16'h3c03;
              5'h16: normal_out = 16'h3c03;
              5'h17: normal_out = 16'h3c03;
              5'h18: normal_out = 16'h3c03;
              5'h19: normal_out = 16'h3c03;
              5'h1a: normal_out = 16'h3c03;
              5'h1b: normal_out = 16'h3c03;
              5'h1c: normal_out = 16'h3c03;
              5'h1d: normal_out = 16'h3c03;
              5'h1e: normal_out = 16'h3c03;
              5'h1f: normal_out = 16'h3c03;
              default: begin end
            endcase
          end
          5'h1a: normal_out = 16'h3c03;
          5'h1b: normal_out = 16'h3c03;
          5'h1c: normal_out = 16'h3c03;
          5'h1d: normal_out = 16'h3c03;
          5'h1e: normal_out = 16'h3c03;
          5'h1f: normal_out = 16'h3c03;
          default: begin end
        endcase
      end
      6'h07: begin
        case (mant[9:5])
          5'h00: normal_out = 16'h3c03;
          5'h01: normal_out = 16'h3c03;
          5'h02: normal_out = 16'h3c03;
          5'h03: normal_out = 16'h3c03;
          5'h04: normal_out = 16'h3c03;
          5'h05: normal_out = 16'h3c03;
          5'h06: normal_out = 16'h3c03;
          5'h07: normal_out = 16'h3c03;
          5'h08: begin
            normal_out = 16'h3c04;
            case (mant[4:0])
              5'h00: normal_out = 16'h3c03;
              5'h01: normal_out = 16'h3c03;
              5'h02: normal_out = 16'h3c03;
              5'h03: normal_out = 16'h3c03;
              5'h04: normal_out = 16'h3c03;
              5'h05: normal_out = 16'h3c03;
              5'h06: normal_out = 16'h3c03;
              5'h07: normal_out = 16'h3c03;
              5'h08: normal_out = 16'h3c03;
              5'h09: normal_out = 16'h3c03;
              5'h0a: normal_out = 16'h3c03;
              default: begin end
            endcase
          end
          5'h09: normal_out = 16'h3c04;
          5'h0a: normal_out = 16'h3c04;
          5'h0b: normal_out = 16'h3c04;
          5'h0c: normal_out = 16'h3c04;
          5'h0d: normal_out = 16'h3c04;
          5'h0e: normal_out = 16'h3c04;
          5'h0f: normal_out = 16'h3c04;
          5'h10: normal_out = 16'h3c04;
          5'h11: normal_out = 16'h3c04;
          5'h12: normal_out = 16'h3c04;
          5'h13: begin
            normal_out = 16'h3c04;
            case (mant[4:0])
              5'h1b: normal_out = 16'h3c05;
              5'h1c: normal_out = 16'h3c05;
              5'h1d: normal_out = 16'h3c05;
              5'h1e: normal_out = 16'h3c05;
              5'h1f: normal_out = 16'h3c05;
              default: begin end
            endcase
          end
          5'h14: normal_out = 16'h3c05;
          5'h15: normal_out = 16'h3c05;
          5'h16: normal_out = 16'h3c05;
          5'h17: normal_out = 16'h3c05;
          5'h18: normal_out = 16'h3c05;
          5'h19: normal_out = 16'h3c05;
          5'h1a: normal_out = 16'h3c05;
          5'h1b: normal_out = 16'h3c05;
          5'h1c: normal_out = 16'h3c05;
          5'h1d: normal_out = 16'h3c05;
          5'h1e: normal_out = 16'h3c05;
          5'h1f: begin
            normal_out = 16'h3c06;
            case (mant[4:0])
              5'h00: normal_out = 16'h3c05;
              5'h01: normal_out = 16'h3c05;
              5'h02: normal_out = 16'h3c05;
              5'h03: normal_out = 16'h3c05;
              5'h04: normal_out = 16'h3c05;
              5'h05: normal_out = 16'h3c05;
              5'h06: normal_out = 16'h3c05;
              5'h07: normal_out = 16'h3c05;
              5'h08: normal_out = 16'h3c05;
              5'h09: normal_out = 16'h3c05;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      6'h08: begin
        case (mant[9:5])
          5'h00: normal_out = 16'h3c06;
          5'h01: normal_out = 16'h3c06;
          5'h02: normal_out = 16'h3c06;
          5'h03: normal_out = 16'h3c06;
          5'h04: normal_out = 16'h3c06;
          5'h05: begin
            normal_out = 16'h3c07;
            case (mant[4:0])
              5'h00: normal_out = 16'h3c06;
              5'h01: normal_out = 16'h3c06;
              5'h02: normal_out = 16'h3c06;
              5'h03: normal_out = 16'h3c06;
              5'h04: normal_out = 16'h3c06;
              5'h05: normal_out = 16'h3c06;
              5'h06: normal_out = 16'h3c06;
              5'h07: normal_out = 16'h3c06;
              5'h08: normal_out = 16'h3c06;
              5'h09: normal_out = 16'h3c06;
              5'h0a: normal_out = 16'h3c06;
              5'h0b: normal_out = 16'h3c06;
              5'h0c: normal_out = 16'h3c06;
              default: begin end
            endcase
          end
          5'h06: normal_out = 16'h3c07;
          5'h07: normal_out = 16'h3c07;
          5'h08: normal_out = 16'h3c07;
          5'h09: normal_out = 16'h3c07;
          5'h0a: normal_out = 16'h3c07;
          5'h0b: begin
            normal_out = 16'h3c08;
            case (mant[4:0])
              5'h00: normal_out = 16'h3c07;
              5'h01: normal_out = 16'h3c07;
              5'h02: normal_out = 16'h3c07;
              5'h03: normal_out = 16'h3c07;
              default: begin end
            endcase
          end
          5'h0c: normal_out = 16'h3c08;
          5'h0d: normal_out = 16'h3c08;
          5'h0e: normal_out = 16'h3c08;
          5'h0f: normal_out = 16'h3c08;
          5'h10: begin
            normal_out = 16'h3c08;
            case (mant[4:0])
              5'h1c: normal_out = 16'h3c09;
              5'h1d: normal_out = 16'h3c09;
              5'h1e: normal_out = 16'h3c09;
              5'h1f: normal_out = 16'h3c09;
              default: begin end
            endcase
          end
          5'h11: normal_out = 16'h3c09;
          5'h12: normal_out = 16'h3c09;
          5'h13: normal_out = 16'h3c09;
          5'h14: normal_out = 16'h3c09;
          5'h15: normal_out = 16'h3c09;
          5'h16: begin
            normal_out = 16'h3c09;
            case (mant[4:0])
              5'h13: normal_out = 16'h3c0a;
              5'h14: normal_out = 16'h3c0a;
              5'h15: normal_out = 16'h3c0a;
              5'h16: normal_out = 16'h3c0a;
              5'h17: normal_out = 16'h3c0a;
              5'h18: normal_out = 16'h3c0a;
              5'h19: normal_out = 16'h3c0a;
              5'h1a: normal_out = 16'h3c0a;
              5'h1b: normal_out = 16'h3c0a;
              5'h1c: normal_out = 16'h3c0a;
              5'h1d: normal_out = 16'h3c0a;
              5'h1e: normal_out = 16'h3c0a;
              5'h1f: normal_out = 16'h3c0a;
              default: begin end
            endcase
          end
          5'h17: normal_out = 16'h3c0a;
          5'h18: normal_out = 16'h3c0a;
          5'h19: normal_out = 16'h3c0a;
          5'h1a: normal_out = 16'h3c0a;
          5'h1b: normal_out = 16'h3c0a;
          5'h1c: begin
            normal_out = 16'h3c0b;
            case (mant[4:0])
              5'h00: normal_out = 16'h3c0a;
              5'h01: normal_out = 16'h3c0a;
              5'h02: normal_out = 16'h3c0a;
              5'h03: normal_out = 16'h3c0a;
              5'h04: normal_out = 16'h3c0a;
              5'h05: normal_out = 16'h3c0a;
              5'h06: normal_out = 16'h3c0a;
              5'h07: normal_out = 16'h3c0a;
              5'h08: normal_out = 16'h3c0a;
              5'h09: normal_out = 16'h3c0a;
              default: begin end
            endcase
          end
          5'h1d: normal_out = 16'h3c0b;
          5'h1e: normal_out = 16'h3c0b;
          5'h1f: normal_out = 16'h3c0b;
          default: begin end
        endcase
      end
      6'h09: begin
        case (mant[9:5])
          5'h00: normal_out = 16'h3c0b;
          5'h01: normal_out = 16'h3c0c;
          5'h02: normal_out = 16'h3c0c;
          5'h03: begin
            normal_out = 16'h3c0c;
            case (mant[4:0])
              5'h1c: normal_out = 16'h3c0d;
              5'h1d: normal_out = 16'h3c0d;
              5'h1e: normal_out = 16'h3c0d;
              5'h1f: normal_out = 16'h3c0d;
              default: begin end
            endcase
          end
          5'h04: normal_out = 16'h3c0d;
          5'h05: normal_out = 16'h3c0d;
          5'h06: begin
            normal_out = 16'h3c0d;
            case (mant[4:0])
              5'h17: normal_out = 16'h3c0e;
              5'h18: normal_out = 16'h3c0e;
              5'h19: normal_out = 16'h3c0e;
              5'h1a: normal_out = 16'h3c0e;
              5'h1b: normal_out = 16'h3c0e;
              5'h1c: normal_out = 16'h3c0e;
              5'h1d: normal_out = 16'h3c0e;
              5'h1e: normal_out = 16'h3c0e;
              5'h1f: normal_out = 16'h3c0e;
              default: begin end
            endcase
          end
          5'h07: normal_out = 16'h3c0e;
          5'h08: normal_out = 16'h3c0e;
          5'h09: begin
            normal_out = 16'h3c0e;
            case (mant[4:0])
              5'h12: normal_out = 16'h3c0f;
              5'h13: normal_out = 16'h3c0f;
              5'h14: normal_out = 16'h3c0f;
              5'h15: normal_out = 16'h3c0f;
              5'h16: normal_out = 16'h3c0f;
              5'h17: normal_out = 16'h3c0f;
              5'h18: normal_out = 16'h3c0f;
              5'h19: normal_out = 16'h3c0f;
              5'h1a: normal_out = 16'h3c0f;
              5'h1b: normal_out = 16'h3c0f;
              5'h1c: normal_out = 16'h3c0f;
              5'h1d: normal_out = 16'h3c0f;
              5'h1e: normal_out = 16'h3c0f;
              5'h1f: normal_out = 16'h3c0f;
              default: begin end
            endcase
          end
          5'h0a: normal_out = 16'h3c0f;
          5'h0b: normal_out = 16'h3c0f;
          5'h0c: begin
            normal_out = 16'h3c10;
            case (mant[4:0])
              5'h00: normal_out = 16'h3c0f;
              5'h01: normal_out = 16'h3c0f;
              5'h02: normal_out = 16'h3c0f;
              5'h03: normal_out = 16'h3c0f;
              5'h04: normal_out = 16'h3c0f;
              5'h05: normal_out = 16'h3c0f;
              5'h06: normal_out = 16'h3c0f;
              5'h07: normal_out = 16'h3c0f;
              5'h08: normal_out = 16'h3c0f;
              5'h09: normal_out = 16'h3c0f;
              5'h0a: normal_out = 16'h3c0f;
              5'h0b: normal_out = 16'h3c0f;
              5'h0c: normal_out = 16'h3c0f;
              default: begin end
            endcase
          end
          5'h0d: normal_out = 16'h3c10;
          5'h0e: normal_out = 16'h3c10;
          5'h0f: begin
            normal_out = 16'h3c11;
            case (mant[4:0])
              5'h00: normal_out = 16'h3c10;
              5'h01: normal_out = 16'h3c10;
              5'h02: normal_out = 16'h3c10;
              5'h03: normal_out = 16'h3c10;
              5'h04: normal_out = 16'h3c10;
              5'h05: normal_out = 16'h3c10;
              5'h06: normal_out = 16'h3c10;
              5'h07: normal_out = 16'h3c10;
              default: begin end
            endcase
          end
          5'h10: normal_out = 16'h3c11;
          5'h11: normal_out = 16'h3c11;
          5'h12: begin
            normal_out = 16'h3c12;
            case (mant[4:0])
              5'h00: normal_out = 16'h3c11;
              5'h01: normal_out = 16'h3c11;
              5'h02: normal_out = 16'h3c11;
              default: begin end
            endcase
          end
          5'h13: normal_out = 16'h3c12;
          5'h14: begin
            normal_out = 16'h3c12;
            case (mant[4:0])
              5'h1d: normal_out = 16'h3c13;
              5'h1e: normal_out = 16'h3c13;
              5'h1f: normal_out = 16'h3c13;
              default: begin end
            endcase
          end
          5'h15: normal_out = 16'h3c13;
          5'h16: normal_out = 16'h3c13;
          5'h17: begin
            normal_out = 16'h3c13;
            case (mant[4:0])
              5'h18: normal_out = 16'h3c14;
              5'h19: normal_out = 16'h3c14;
              5'h1a: normal_out = 16'h3c14;
              5'h1b: normal_out = 16'h3c14;
              5'h1c: normal_out = 16'h3c14;
              5'h1d: normal_out = 16'h3c14;
              5'h1e: normal_out = 16'h3c14;
              5'h1f: normal_out = 16'h3c14;
              default: begin end
            endcase
          end
          5'h18: normal_out = 16'h3c14;
          5'h19: normal_out = 16'h3c14;
          5'h1a: begin
            normal_out = 16'h3c14;
            case (mant[4:0])
              5'h13: normal_out = 16'h3c15;
              5'h14: normal_out = 16'h3c15;
              5'h15: normal_out = 16'h3c15;
              5'h16: normal_out = 16'h3c15;
              5'h17: normal_out = 16'h3c15;
              5'h18: normal_out = 16'h3c15;
              5'h19: normal_out = 16'h3c15;
              5'h1a: normal_out = 16'h3c15;
              5'h1b: normal_out = 16'h3c15;
              5'h1c: normal_out = 16'h3c15;
              5'h1d: normal_out = 16'h3c15;
              5'h1e: normal_out = 16'h3c15;
              5'h1f: normal_out = 16'h3c15;
              default: begin end
            endcase
          end
          5'h1b: normal_out = 16'h3c15;
          5'h1c: normal_out = 16'h3c15;
          5'h1d: begin
            normal_out = 16'h3c16;
            case (mant[4:0])
              5'h00: normal_out = 16'h3c15;
              5'h01: normal_out = 16'h3c15;
              5'h02: normal_out = 16'h3c15;
              5'h03: normal_out = 16'h3c15;
              5'h04: normal_out = 16'h3c15;
              5'h05: normal_out = 16'h3c15;
              5'h06: normal_out = 16'h3c15;
              5'h07: normal_out = 16'h3c15;
              5'h08: normal_out = 16'h3c15;
              5'h09: normal_out = 16'h3c15;
              5'h0a: normal_out = 16'h3c15;
              5'h0b: normal_out = 16'h3c15;
              5'h0c: normal_out = 16'h3c15;
              default: begin end
            endcase
          end
          5'h1e: normal_out = 16'h3c16;
          5'h1f: normal_out = 16'h3c16;
          default: begin end
        endcase
      end
      6'h0a: begin
        case (mant[9:5])
          5'h00: begin
            normal_out = 16'h3c17;
            case (mant[4:0])
              5'h00: normal_out = 16'h3c16;
              5'h01: normal_out = 16'h3c16;
              5'h02: normal_out = 16'h3c16;
              5'h03: normal_out = 16'h3c16;
              default: begin end
            endcase
          end
          5'h01: begin
            normal_out = 16'h3c17;
            case (mant[4:0])
              5'h11: normal_out = 16'h3c18;
              5'h12: normal_out = 16'h3c18;
              5'h13: normal_out = 16'h3c18;
              5'h14: normal_out = 16'h3c18;
              5'h15: normal_out = 16'h3c18;
              5'h16: normal_out = 16'h3c18;
              5'h17: normal_out = 16'h3c18;
              5'h18: normal_out = 16'h3c18;
              5'h19: normal_out = 16'h3c18;
              5'h1a: normal_out = 16'h3c18;
              5'h1b: normal_out = 16'h3c18;
              5'h1c: normal_out = 16'h3c18;
              5'h1d: normal_out = 16'h3c18;
              5'h1e: normal_out = 16'h3c18;
              5'h1f: normal_out = 16'h3c18;
              default: begin end
            endcase
          end
          5'h02: begin
            normal_out = 16'h3c18;
            case (mant[4:0])
              5'h1e: normal_out = 16'h3c19;
              5'h1f: normal_out = 16'h3c19;
              default: begin end
            endcase
          end
          5'h03: normal_out = 16'h3c19;
          5'h04: begin
            normal_out = 16'h3c1a;
            case (mant[4:0])
              5'h00: normal_out = 16'h3c19;
              5'h01: normal_out = 16'h3c19;
              5'h02: normal_out = 16'h3c19;
              5'h03: normal_out = 16'h3c19;
              5'h04: normal_out = 16'h3c19;
              5'h05: normal_out = 16'h3c19;
              5'h06: normal_out = 16'h3c19;
              5'h07: normal_out = 16'h3c19;
              5'h08: normal_out = 16'h3c19;
              5'h09: normal_out = 16'h3c19;
              5'h0a: normal_out = 16'h3c19;
              default: begin end
            endcase
          end
          5'h05: begin
            normal_out = 16'h3c1a;
            case (mant[4:0])
              5'h18: normal_out = 16'h3c1b;
              5'h19: normal_out = 16'h3c1b;
              5'h1a: normal_out = 16'h3c1b;
              5'h1b: normal_out = 16'h3c1b;
              5'h1c: normal_out = 16'h3c1b;
              5'h1d: normal_out = 16'h3c1b;
              5'h1e: normal_out = 16'h3c1b;
              5'h1f: normal_out = 16'h3c1b;
              default: begin end
            endcase
          end
          5'h06: normal_out = 16'h3c1b;
          5'h07: begin
            normal_out = 16'h3c1c;
            case (mant[4:0])
              5'h00: normal_out = 16'h3c1b;
              5'h01: normal_out = 16'h3c1b;
              5'h02: normal_out = 16'h3c1b;
              5'h03: normal_out = 16'h3c1b;
              5'h04: normal_out = 16'h3c1b;
              default: begin end
            endcase
          end
          5'h08: begin
            normal_out = 16'h3c1c;
            case (mant[4:0])
              5'h12: normal_out = 16'h3c1d;
              5'h13: normal_out = 16'h3c1d;
              5'h14: normal_out = 16'h3c1d;
              5'h15: normal_out = 16'h3c1d;
              5'h16: normal_out = 16'h3c1d;
              5'h17: normal_out = 16'h3c1d;
              5'h18: normal_out = 16'h3c1d;
              5'h19: normal_out = 16'h3c1d;
              5'h1a: normal_out = 16'h3c1d;
              5'h1b: normal_out = 16'h3c1d;
              5'h1c: normal_out = 16'h3c1d;
              5'h1d: normal_out = 16'h3c1d;
              5'h1e: normal_out = 16'h3c1d;
              5'h1f: normal_out = 16'h3c1d;
              default: begin end
            endcase
          end
          5'h09: begin
            normal_out = 16'h3c1d;
            case (mant[4:0])
              5'h1f: normal_out = 16'h3c1e;
              default: begin end
            endcase
          end
          5'h0a: normal_out = 16'h3c1e;
          5'h0b: begin
            normal_out = 16'h3c1f;
            case (mant[4:0])
              5'h00: normal_out = 16'h3c1e;
              5'h01: normal_out = 16'h3c1e;
              5'h02: normal_out = 16'h3c1e;
              5'h03: normal_out = 16'h3c1e;
              5'h04: normal_out = 16'h3c1e;
              5'h05: normal_out = 16'h3c1e;
              5'h06: normal_out = 16'h3c1e;
              5'h07: normal_out = 16'h3c1e;
              5'h08: normal_out = 16'h3c1e;
              5'h09: normal_out = 16'h3c1e;
              5'h0a: normal_out = 16'h3c1e;
              5'h0b: normal_out = 16'h3c1e;
              default: begin end
            endcase
          end
          5'h0c: begin
            normal_out = 16'h3c1f;
            case (mant[4:0])
              5'h19: normal_out = 16'h3c20;
              5'h1a: normal_out = 16'h3c20;
              5'h1b: normal_out = 16'h3c20;
              5'h1c: normal_out = 16'h3c20;
              5'h1d: normal_out = 16'h3c20;
              5'h1e: normal_out = 16'h3c20;
              5'h1f: normal_out = 16'h3c20;
              default: begin end
            endcase
          end
          5'h0d: normal_out = 16'h3c20;
          5'h0e: begin
            normal_out = 16'h3c21;
            case (mant[4:0])
              5'h00: normal_out = 16'h3c20;
              5'h01: normal_out = 16'h3c20;
              5'h02: normal_out = 16'h3c20;
              5'h03: normal_out = 16'h3c20;
              5'h04: normal_out = 16'h3c20;
              5'h05: normal_out = 16'h3c20;
              default: begin end
            endcase
          end
          5'h0f: begin
            normal_out = 16'h3c21;
            case (mant[4:0])
              5'h12: normal_out = 16'h3c22;
              5'h13: normal_out = 16'h3c22;
              5'h14: normal_out = 16'h3c22;
              5'h15: normal_out = 16'h3c22;
              5'h16: normal_out = 16'h3c22;
              5'h17: normal_out = 16'h3c22;
              5'h18: normal_out = 16'h3c22;
              5'h19: normal_out = 16'h3c22;
              5'h1a: normal_out = 16'h3c22;
              5'h1b: normal_out = 16'h3c22;
              5'h1c: normal_out = 16'h3c22;
              5'h1d: normal_out = 16'h3c22;
              5'h1e: normal_out = 16'h3c22;
              5'h1f: normal_out = 16'h3c22;
              default: begin end
            endcase
          end
          5'h10: begin
            normal_out = 16'h3c22;
            case (mant[4:0])
              5'h1f: normal_out = 16'h3c23;
              default: begin end
            endcase
          end
          5'h11: normal_out = 16'h3c23;
          5'h12: begin
            normal_out = 16'h3c24;
            case (mant[4:0])
              5'h00: normal_out = 16'h3c23;
              5'h01: normal_out = 16'h3c23;
              5'h02: normal_out = 16'h3c23;
              5'h03: normal_out = 16'h3c23;
              5'h04: normal_out = 16'h3c23;
              5'h05: normal_out = 16'h3c23;
              5'h06: normal_out = 16'h3c23;
              5'h07: normal_out = 16'h3c23;
              5'h08: normal_out = 16'h3c23;
              5'h09: normal_out = 16'h3c23;
              5'h0a: normal_out = 16'h3c23;
              5'h0b: normal_out = 16'h3c23;
              default: begin end
            endcase
          end
          5'h13: begin
            normal_out = 16'h3c24;
            case (mant[4:0])
              5'h18: normal_out = 16'h3c25;
              5'h19: normal_out = 16'h3c25;
              5'h1a: normal_out = 16'h3c25;
              5'h1b: normal_out = 16'h3c25;
              5'h1c: normal_out = 16'h3c25;
              5'h1d: normal_out = 16'h3c25;
              5'h1e: normal_out = 16'h3c25;
              5'h1f: normal_out = 16'h3c25;
              default: begin end
            endcase
          end
          5'h14: normal_out = 16'h3c25;
          5'h15: begin
            normal_out = 16'h3c26;
            case (mant[4:0])
              5'h00: normal_out = 16'h3c25;
              5'h01: normal_out = 16'h3c25;
              5'h02: normal_out = 16'h3c25;
              5'h03: normal_out = 16'h3c25;
              5'h04: normal_out = 16'h3c25;
              default: begin end
            endcase
          end
          5'h16: begin
            normal_out = 16'h3c26;
            case (mant[4:0])
              5'h11: normal_out = 16'h3c27;
              5'h12: normal_out = 16'h3c27;
              5'h13: normal_out = 16'h3c27;
              5'h14: normal_out = 16'h3c27;
              5'h15: normal_out = 16'h3c27;
              5'h16: normal_out = 16'h3c27;
              5'h17: normal_out = 16'h3c27;
              5'h18: normal_out = 16'h3c27;
              5'h19: normal_out = 16'h3c27;
              5'h1a: normal_out = 16'h3c27;
              5'h1b: normal_out = 16'h3c27;
              5'h1c: normal_out = 16'h3c27;
              5'h1d: normal_out = 16'h3c27;
              5'h1e: normal_out = 16'h3c27;
              5'h1f: normal_out = 16'h3c27;
              default: begin end
            endcase
          end
          5'h17: begin
            normal_out = 16'h3c27;
            case (mant[4:0])
              5'h1e: normal_out = 16'h3c28;
              5'h1f: normal_out = 16'h3c28;
              default: begin end
            endcase
          end
          5'h18: normal_out = 16'h3c28;
          5'h19: begin
            normal_out = 16'h3c29;
            case (mant[4:0])
              5'h00: normal_out = 16'h3c28;
              5'h01: normal_out = 16'h3c28;
              5'h02: normal_out = 16'h3c28;
              5'h03: normal_out = 16'h3c28;
              5'h04: normal_out = 16'h3c28;
              5'h05: normal_out = 16'h3c28;
              5'h06: normal_out = 16'h3c28;
              5'h07: normal_out = 16'h3c28;
              5'h08: normal_out = 16'h3c28;
              5'h09: normal_out = 16'h3c28;
              default: begin end
            endcase
          end
          5'h1a: begin
            normal_out = 16'h3c29;
            case (mant[4:0])
              5'h17: normal_out = 16'h3c2a;
              5'h18: normal_out = 16'h3c2a;
              5'h19: normal_out = 16'h3c2a;
              5'h1a: normal_out = 16'h3c2a;
              5'h1b: normal_out = 16'h3c2a;
              5'h1c: normal_out = 16'h3c2a;
              5'h1d: normal_out = 16'h3c2a;
              5'h1e: normal_out = 16'h3c2a;
              5'h1f: normal_out = 16'h3c2a;
              default: begin end
            endcase
          end
          5'h1b: normal_out = 16'h3c2a;
          5'h1c: begin
            normal_out = 16'h3c2b;
            case (mant[4:0])
              5'h00: normal_out = 16'h3c2a;
              5'h01: normal_out = 16'h3c2a;
              5'h02: normal_out = 16'h3c2a;
              default: begin end
            endcase
          end
          5'h1d: begin
            normal_out = 16'h3c2c;
            case (mant[4:0])
              5'h00: normal_out = 16'h3c2b;
              5'h01: normal_out = 16'h3c2b;
              5'h02: normal_out = 16'h3c2b;
              5'h03: normal_out = 16'h3c2b;
              5'h04: normal_out = 16'h3c2b;
              5'h05: normal_out = 16'h3c2b;
              5'h06: normal_out = 16'h3c2b;
              5'h07: normal_out = 16'h3c2b;
              5'h08: normal_out = 16'h3c2b;
              5'h09: normal_out = 16'h3c2b;
              5'h0a: normal_out = 16'h3c2b;
              5'h0b: normal_out = 16'h3c2b;
              5'h0c: normal_out = 16'h3c2b;
              5'h0d: normal_out = 16'h3c2b;
              5'h0e: normal_out = 16'h3c2b;
              default: begin end
            endcase
          end
          5'h1e: begin
            normal_out = 16'h3c2c;
            case (mant[4:0])
              5'h1c: normal_out = 16'h3c2d;
              5'h1d: normal_out = 16'h3c2d;
              5'h1e: normal_out = 16'h3c2d;
              5'h1f: normal_out = 16'h3c2d;
              default: begin end
            endcase
          end
          5'h1f: normal_out = 16'h3c2d;
          default: begin end
        endcase
      end
      6'h0b: begin
        case (mant[9:5])
          5'h00: begin
            normal_out = 16'h3c2e;
            case (mant[4:0])
              5'h00: normal_out = 16'h3c2d;
              5'h01: normal_out = 16'h3c2d;
              5'h02: normal_out = 16'h3c2d;
              5'h03: normal_out = 16'h3c2d;
              5'h1a: normal_out = 16'h3c2f;
              5'h1b: normal_out = 16'h3c2f;
              5'h1c: normal_out = 16'h3c2f;
              5'h1d: normal_out = 16'h3c2f;
              5'h1e: normal_out = 16'h3c2f;
              5'h1f: normal_out = 16'h3c2f;
              default: begin end
            endcase
          end
          5'h01: begin
            normal_out = 16'h3c2f;
            case (mant[4:0])
              5'h10: normal_out = 16'h3c30;
              5'h11: normal_out = 16'h3c30;
              5'h12: normal_out = 16'h3c30;
              5'h13: normal_out = 16'h3c30;
              5'h14: normal_out = 16'h3c30;
              5'h15: normal_out = 16'h3c30;
              5'h16: normal_out = 16'h3c30;
              5'h17: normal_out = 16'h3c30;
              5'h18: normal_out = 16'h3c30;
              5'h19: normal_out = 16'h3c30;
              5'h1a: normal_out = 16'h3c30;
              5'h1b: normal_out = 16'h3c30;
              5'h1c: normal_out = 16'h3c30;
              5'h1d: normal_out = 16'h3c30;
              5'h1e: normal_out = 16'h3c30;
              5'h1f: normal_out = 16'h3c30;
              default: begin end
            endcase
          end
          5'h02: begin
            normal_out = 16'h3c31;
            case (mant[4:0])
              5'h00: normal_out = 16'h3c30;
              5'h01: normal_out = 16'h3c30;
              5'h02: normal_out = 16'h3c30;
              5'h03: normal_out = 16'h3c30;
              5'h04: normal_out = 16'h3c30;
              5'h05: normal_out = 16'h3c30;
              5'h1c: normal_out = 16'h3c32;
              5'h1d: normal_out = 16'h3c32;
              5'h1e: normal_out = 16'h3c32;
              5'h1f: normal_out = 16'h3c32;
              default: begin end
            endcase
          end
          5'h03: begin
            normal_out = 16'h3c32;
            case (mant[4:0])
              5'h12: normal_out = 16'h3c33;
              5'h13: normal_out = 16'h3c33;
              5'h14: normal_out = 16'h3c33;
              5'h15: normal_out = 16'h3c33;
              5'h16: normal_out = 16'h3c33;
              5'h17: normal_out = 16'h3c33;
              5'h18: normal_out = 16'h3c33;
              5'h19: normal_out = 16'h3c33;
              5'h1a: normal_out = 16'h3c33;
              5'h1b: normal_out = 16'h3c33;
              5'h1c: normal_out = 16'h3c33;
              5'h1d: normal_out = 16'h3c33;
              5'h1e: normal_out = 16'h3c33;
              5'h1f: normal_out = 16'h3c33;
              default: begin end
            endcase
          end
          5'h04: begin
            normal_out = 16'h3c34;
            case (mant[4:0])
              5'h00: normal_out = 16'h3c33;
              5'h01: normal_out = 16'h3c33;
              5'h02: normal_out = 16'h3c33;
              5'h03: normal_out = 16'h3c33;
              5'h04: normal_out = 16'h3c33;
              5'h05: normal_out = 16'h3c33;
              5'h06: normal_out = 16'h3c33;
              5'h07: normal_out = 16'h3c33;
              5'h1e: normal_out = 16'h3c35;
              5'h1f: normal_out = 16'h3c35;
              default: begin end
            endcase
          end
          5'h05: begin
            normal_out = 16'h3c35;
            case (mant[4:0])
              5'h14: normal_out = 16'h3c36;
              5'h15: normal_out = 16'h3c36;
              5'h16: normal_out = 16'h3c36;
              5'h17: normal_out = 16'h3c36;
              5'h18: normal_out = 16'h3c36;
              5'h19: normal_out = 16'h3c36;
              5'h1a: normal_out = 16'h3c36;
              5'h1b: normal_out = 16'h3c36;
              5'h1c: normal_out = 16'h3c36;
              5'h1d: normal_out = 16'h3c36;
              5'h1e: normal_out = 16'h3c36;
              5'h1f: normal_out = 16'h3c36;
              default: begin end
            endcase
          end
          5'h06: begin
            normal_out = 16'h3c37;
            case (mant[4:0])
              5'h00: normal_out = 16'h3c36;
              5'h01: normal_out = 16'h3c36;
              5'h02: normal_out = 16'h3c36;
              5'h03: normal_out = 16'h3c36;
              5'h04: normal_out = 16'h3c36;
              5'h05: normal_out = 16'h3c36;
              5'h06: normal_out = 16'h3c36;
              5'h07: normal_out = 16'h3c36;
              5'h08: normal_out = 16'h3c36;
              5'h09: normal_out = 16'h3c36;
              default: begin end
            endcase
          end
          5'h07: begin
            normal_out = 16'h3c38;
            case (mant[4:0])
              5'h16: normal_out = 16'h3c39;
              5'h17: normal_out = 16'h3c39;
              5'h18: normal_out = 16'h3c39;
              5'h19: normal_out = 16'h3c39;
              5'h1a: normal_out = 16'h3c39;
              5'h1b: normal_out = 16'h3c39;
              5'h1c: normal_out = 16'h3c39;
              5'h1d: normal_out = 16'h3c39;
              5'h1e: normal_out = 16'h3c39;
              5'h1f: normal_out = 16'h3c39;
              default: begin end
            endcase
          end
          5'h08: begin
            normal_out = 16'h3c3a;
            case (mant[4:0])
              5'h00: normal_out = 16'h3c39;
              5'h01: normal_out = 16'h3c39;
              5'h02: normal_out = 16'h3c39;
              5'h03: normal_out = 16'h3c39;
              5'h04: normal_out = 16'h3c39;
              5'h05: normal_out = 16'h3c39;
              5'h06: normal_out = 16'h3c39;
              5'h07: normal_out = 16'h3c39;
              5'h08: normal_out = 16'h3c39;
              5'h09: normal_out = 16'h3c39;
              5'h0a: normal_out = 16'h3c39;
              5'h0b: normal_out = 16'h3c39;
              default: begin end
            endcase
          end
          5'h09: begin
            normal_out = 16'h3c3b;
            case (mant[4:0])
              5'h00: normal_out = 16'h3c3a;
              5'h01: normal_out = 16'h3c3a;
              5'h18: normal_out = 16'h3c3c;
              5'h19: normal_out = 16'h3c3c;
              5'h1a: normal_out = 16'h3c3c;
              5'h1b: normal_out = 16'h3c3c;
              5'h1c: normal_out = 16'h3c3c;
              5'h1d: normal_out = 16'h3c3c;
              5'h1e: normal_out = 16'h3c3c;
              5'h1f: normal_out = 16'h3c3c;
              default: begin end
            endcase
          end
          5'h0a: begin
            normal_out = 16'h3c3d;
            case (mant[4:0])
              5'h00: normal_out = 16'h3c3c;
              5'h01: normal_out = 16'h3c3c;
              5'h02: normal_out = 16'h3c3c;
              5'h03: normal_out = 16'h3c3c;
              5'h04: normal_out = 16'h3c3c;
              5'h05: normal_out = 16'h3c3c;
              5'h06: normal_out = 16'h3c3c;
              5'h07: normal_out = 16'h3c3c;
              5'h08: normal_out = 16'h3c3c;
              5'h09: normal_out = 16'h3c3c;
              5'h0a: normal_out = 16'h3c3c;
              5'h0b: normal_out = 16'h3c3c;
              5'h0c: normal_out = 16'h3c3c;
              default: begin end
            endcase
          end
          5'h0b: begin
            normal_out = 16'h3c3e;
            case (mant[4:0])
              5'h00: normal_out = 16'h3c3d;
              5'h01: normal_out = 16'h3c3d;
              5'h02: normal_out = 16'h3c3d;
              5'h19: normal_out = 16'h3c3f;
              5'h1a: normal_out = 16'h3c3f;
              5'h1b: normal_out = 16'h3c3f;
              5'h1c: normal_out = 16'h3c3f;
              5'h1d: normal_out = 16'h3c3f;
              5'h1e: normal_out = 16'h3c3f;
              5'h1f: normal_out = 16'h3c3f;
              default: begin end
            endcase
          end
          5'h0c: begin
            normal_out = 16'h3c40;
            case (mant[4:0])
              5'h00: normal_out = 16'h3c3f;
              5'h01: normal_out = 16'h3c3f;
              5'h02: normal_out = 16'h3c3f;
              5'h03: normal_out = 16'h3c3f;
              5'h04: normal_out = 16'h3c3f;
              5'h05: normal_out = 16'h3c3f;
              5'h06: normal_out = 16'h3c3f;
              5'h07: normal_out = 16'h3c3f;
              5'h08: normal_out = 16'h3c3f;
              5'h09: normal_out = 16'h3c3f;
              5'h0a: normal_out = 16'h3c3f;
              5'h0b: normal_out = 16'h3c3f;
              5'h0c: normal_out = 16'h3c3f;
              5'h0d: normal_out = 16'h3c3f;
              5'h0e: normal_out = 16'h3c3f;
              default: begin end
            endcase
          end
          5'h0d: begin
            normal_out = 16'h3c41;
            case (mant[4:0])
              5'h00: normal_out = 16'h3c40;
              5'h01: normal_out = 16'h3c40;
              5'h02: normal_out = 16'h3c40;
              5'h03: normal_out = 16'h3c40;
              5'h1a: normal_out = 16'h3c42;
              5'h1b: normal_out = 16'h3c42;
              5'h1c: normal_out = 16'h3c42;
              5'h1d: normal_out = 16'h3c42;
              5'h1e: normal_out = 16'h3c42;
              5'h1f: normal_out = 16'h3c42;
              default: begin end
            endcase
          end
          5'h0e: begin
            normal_out = 16'h3c42;
            case (mant[4:0])
              5'h10: normal_out = 16'h3c43;
              5'h11: normal_out = 16'h3c43;
              5'h12: normal_out = 16'h3c43;
              5'h13: normal_out = 16'h3c43;
              5'h14: normal_out = 16'h3c43;
              5'h15: normal_out = 16'h3c43;
              5'h16: normal_out = 16'h3c43;
              5'h17: normal_out = 16'h3c43;
              5'h18: normal_out = 16'h3c43;
              5'h19: normal_out = 16'h3c43;
              5'h1a: normal_out = 16'h3c43;
              5'h1b: normal_out = 16'h3c43;
              5'h1c: normal_out = 16'h3c43;
              5'h1d: normal_out = 16'h3c43;
              5'h1e: normal_out = 16'h3c43;
              5'h1f: normal_out = 16'h3c43;
              default: begin end
            endcase
          end
          5'h0f: begin
            normal_out = 16'h3c44;
            case (mant[4:0])
              5'h00: normal_out = 16'h3c43;
              5'h01: normal_out = 16'h3c43;
              5'h02: normal_out = 16'h3c43;
              5'h03: normal_out = 16'h3c43;
              5'h04: normal_out = 16'h3c43;
              5'h1b: normal_out = 16'h3c45;
              5'h1c: normal_out = 16'h3c45;
              5'h1d: normal_out = 16'h3c45;
              5'h1e: normal_out = 16'h3c45;
              5'h1f: normal_out = 16'h3c45;
              default: begin end
            endcase
          end
          5'h10: begin
            normal_out = 16'h3c45;
            case (mant[4:0])
              5'h11: normal_out = 16'h3c46;
              5'h12: normal_out = 16'h3c46;
              5'h13: normal_out = 16'h3c46;
              5'h14: normal_out = 16'h3c46;
              5'h15: normal_out = 16'h3c46;
              5'h16: normal_out = 16'h3c46;
              5'h17: normal_out = 16'h3c46;
              5'h18: normal_out = 16'h3c46;
              5'h19: normal_out = 16'h3c46;
              5'h1a: normal_out = 16'h3c46;
              5'h1b: normal_out = 16'h3c46;
              5'h1c: normal_out = 16'h3c46;
              5'h1d: normal_out = 16'h3c46;
              5'h1e: normal_out = 16'h3c46;
              5'h1f: normal_out = 16'h3c46;
              default: begin end
            endcase
          end
          5'h11: begin
            normal_out = 16'h3c47;
            case (mant[4:0])
              5'h00: normal_out = 16'h3c46;
              5'h01: normal_out = 16'h3c46;
              5'h02: normal_out = 16'h3c46;
              5'h03: normal_out = 16'h3c46;
              5'h04: normal_out = 16'h3c46;
              5'h05: normal_out = 16'h3c46;
              5'h1c: normal_out = 16'h3c48;
              5'h1d: normal_out = 16'h3c48;
              5'h1e: normal_out = 16'h3c48;
              5'h1f: normal_out = 16'h3c48;
              default: begin end
            endcase
          end
          5'h12: begin
            normal_out = 16'h3c48;
            case (mant[4:0])
              5'h11: normal_out = 16'h3c49;
              5'h12: normal_out = 16'h3c49;
              5'h13: normal_out = 16'h3c49;
              5'h14: normal_out = 16'h3c49;
              5'h15: normal_out = 16'h3c49;
              5'h16: normal_out = 16'h3c49;
              5'h17: normal_out = 16'h3c49;
              5'h18: normal_out = 16'h3c49;
              5'h19: normal_out = 16'h3c49;
              5'h1a: normal_out = 16'h3c49;
              5'h1b: normal_out = 16'h3c49;
              5'h1c: normal_out = 16'h3c49;
              5'h1d: normal_out = 16'h3c49;
              5'h1e: normal_out = 16'h3c49;
              5'h1f: normal_out = 16'h3c49;
              default: begin end
            endcase
          end
          5'h13: begin
            normal_out = 16'h3c4a;
            case (mant[4:0])
              5'h00: normal_out = 16'h3c49;
              5'h01: normal_out = 16'h3c49;
              5'h02: normal_out = 16'h3c49;
              5'h03: normal_out = 16'h3c49;
              5'h04: normal_out = 16'h3c49;
              5'h05: normal_out = 16'h3c49;
              5'h06: normal_out = 16'h3c49;
              5'h1d: normal_out = 16'h3c4b;
              5'h1e: normal_out = 16'h3c4b;
              5'h1f: normal_out = 16'h3c4b;
              default: begin end
            endcase
          end
          5'h14: begin
            normal_out = 16'h3c4b;
            case (mant[4:0])
              5'h12: normal_out = 16'h3c4c;
              5'h13: normal_out = 16'h3c4c;
              5'h14: normal_out = 16'h3c4c;
              5'h15: normal_out = 16'h3c4c;
              5'h16: normal_out = 16'h3c4c;
              5'h17: normal_out = 16'h3c4c;
              5'h18: normal_out = 16'h3c4c;
              5'h19: normal_out = 16'h3c4c;
              5'h1a: normal_out = 16'h3c4c;
              5'h1b: normal_out = 16'h3c4c;
              5'h1c: normal_out = 16'h3c4c;
              5'h1d: normal_out = 16'h3c4c;
              5'h1e: normal_out = 16'h3c4c;
              5'h1f: normal_out = 16'h3c4c;
              default: begin end
            endcase
          end
          5'h15: begin
            normal_out = 16'h3c4d;
            case (mant[4:0])
              5'h00: normal_out = 16'h3c4c;
              5'h01: normal_out = 16'h3c4c;
              5'h02: normal_out = 16'h3c4c;
              5'h03: normal_out = 16'h3c4c;
              5'h04: normal_out = 16'h3c4c;
              5'h05: normal_out = 16'h3c4c;
              5'h06: normal_out = 16'h3c4c;
              5'h07: normal_out = 16'h3c4c;
              5'h1d: normal_out = 16'h3c4e;
              5'h1e: normal_out = 16'h3c4e;
              5'h1f: normal_out = 16'h3c4e;
              default: begin end
            endcase
          end
          5'h16: begin
            normal_out = 16'h3c4e;
            case (mant[4:0])
              5'h12: normal_out = 16'h3c4f;
              5'h13: normal_out = 16'h3c4f;
              5'h14: normal_out = 16'h3c4f;
              5'h15: normal_out = 16'h3c4f;
              5'h16: normal_out = 16'h3c4f;
              5'h17: normal_out = 16'h3c4f;
              5'h18: normal_out = 16'h3c4f;
              5'h19: normal_out = 16'h3c4f;
              5'h1a: normal_out = 16'h3c4f;
              5'h1b: normal_out = 16'h3c4f;
              5'h1c: normal_out = 16'h3c4f;
              5'h1d: normal_out = 16'h3c4f;
              5'h1e: normal_out = 16'h3c4f;
              5'h1f: normal_out = 16'h3c4f;
              default: begin end
            endcase
          end
          5'h17: begin
            normal_out = 16'h3c50;
            case (mant[4:0])
              5'h00: normal_out = 16'h3c4f;
              5'h01: normal_out = 16'h3c4f;
              5'h02: normal_out = 16'h3c4f;
              5'h03: normal_out = 16'h3c4f;
              5'h04: normal_out = 16'h3c4f;
              5'h05: normal_out = 16'h3c4f;
              5'h06: normal_out = 16'h3c4f;
              5'h07: normal_out = 16'h3c4f;
              5'h1d: normal_out = 16'h3c51;
              5'h1e: normal_out = 16'h3c51;
              5'h1f: normal_out = 16'h3c51;
              default: begin end
            endcase
          end
          5'h18: begin
            normal_out = 16'h3c51;
            case (mant[4:0])
              5'h13: normal_out = 16'h3c52;
              5'h14: normal_out = 16'h3c52;
              5'h15: normal_out = 16'h3c52;
              5'h16: normal_out = 16'h3c52;
              5'h17: normal_out = 16'h3c52;
              5'h18: normal_out = 16'h3c52;
              5'h19: normal_out = 16'h3c52;
              5'h1a: normal_out = 16'h3c52;
              5'h1b: normal_out = 16'h3c52;
              5'h1c: normal_out = 16'h3c52;
              5'h1d: normal_out = 16'h3c52;
              5'h1e: normal_out = 16'h3c52;
              5'h1f: normal_out = 16'h3c52;
              default: begin end
            endcase
          end
          5'h19: begin
            normal_out = 16'h3c53;
            case (mant[4:0])
              5'h00: normal_out = 16'h3c52;
              5'h01: normal_out = 16'h3c52;
              5'h02: normal_out = 16'h3c52;
              5'h03: normal_out = 16'h3c52;
              5'h04: normal_out = 16'h3c52;
              5'h05: normal_out = 16'h3c52;
              5'h06: normal_out = 16'h3c52;
              5'h07: normal_out = 16'h3c52;
              5'h1d: normal_out = 16'h3c54;
              5'h1e: normal_out = 16'h3c54;
              5'h1f: normal_out = 16'h3c54;
              default: begin end
            endcase
          end
          5'h1a: begin
            normal_out = 16'h3c54;
            case (mant[4:0])
              5'h13: normal_out = 16'h3c55;
              5'h14: normal_out = 16'h3c55;
              5'h15: normal_out = 16'h3c55;
              5'h16: normal_out = 16'h3c55;
              5'h17: normal_out = 16'h3c55;
              5'h18: normal_out = 16'h3c55;
              5'h19: normal_out = 16'h3c55;
              5'h1a: normal_out = 16'h3c55;
              5'h1b: normal_out = 16'h3c55;
              5'h1c: normal_out = 16'h3c55;
              5'h1d: normal_out = 16'h3c55;
              5'h1e: normal_out = 16'h3c55;
              5'h1f: normal_out = 16'h3c55;
              default: begin end
            endcase
          end
          5'h1b: begin
            normal_out = 16'h3c56;
            case (mant[4:0])
              5'h00: normal_out = 16'h3c55;
              5'h01: normal_out = 16'h3c55;
              5'h02: normal_out = 16'h3c55;
              5'h03: normal_out = 16'h3c55;
              5'h04: normal_out = 16'h3c55;
              5'h05: normal_out = 16'h3c55;
              5'h06: normal_out = 16'h3c55;
              5'h07: normal_out = 16'h3c55;
              5'h1d: normal_out = 16'h3c57;
              5'h1e: normal_out = 16'h3c57;
              5'h1f: normal_out = 16'h3c57;
              default: begin end
            endcase
          end
          5'h1c: begin
            normal_out = 16'h3c57;
            case (mant[4:0])
              5'h13: normal_out = 16'h3c58;
              5'h14: normal_out = 16'h3c58;
              5'h15: normal_out = 16'h3c58;
              5'h16: normal_out = 16'h3c58;
              5'h17: normal_out = 16'h3c58;
              5'h18: normal_out = 16'h3c58;
              5'h19: normal_out = 16'h3c58;
              5'h1a: normal_out = 16'h3c58;
              5'h1b: normal_out = 16'h3c58;
              5'h1c: normal_out = 16'h3c58;
              5'h1d: normal_out = 16'h3c58;
              5'h1e: normal_out = 16'h3c58;
              5'h1f: normal_out = 16'h3c58;
              default: begin end
            endcase
          end
          5'h1d: begin
            normal_out = 16'h3c59;
            case (mant[4:0])
              5'h00: normal_out = 16'h3c58;
              5'h01: normal_out = 16'h3c58;
              5'h02: normal_out = 16'h3c58;
              5'h03: normal_out = 16'h3c58;
              5'h04: normal_out = 16'h3c58;
              5'h05: normal_out = 16'h3c58;
              5'h06: normal_out = 16'h3c58;
              5'h07: normal_out = 16'h3c58;
              5'h1d: normal_out = 16'h3c5a;
              5'h1e: normal_out = 16'h3c5a;
              5'h1f: normal_out = 16'h3c5a;
              default: begin end
            endcase
          end
          5'h1e: begin
            normal_out = 16'h3c5a;
            case (mant[4:0])
              5'h12: normal_out = 16'h3c5b;
              5'h13: normal_out = 16'h3c5b;
              5'h14: normal_out = 16'h3c5b;
              5'h15: normal_out = 16'h3c5b;
              5'h16: normal_out = 16'h3c5b;
              5'h17: normal_out = 16'h3c5b;
              5'h18: normal_out = 16'h3c5b;
              5'h19: normal_out = 16'h3c5b;
              5'h1a: normal_out = 16'h3c5b;
              5'h1b: normal_out = 16'h3c5b;
              5'h1c: normal_out = 16'h3c5b;
              5'h1d: normal_out = 16'h3c5b;
              5'h1e: normal_out = 16'h3c5b;
              5'h1f: normal_out = 16'h3c5b;
              default: begin end
            endcase
          end
          5'h1f: begin
            normal_out = 16'h3c5c;
            case (mant[4:0])
              5'h00: normal_out = 16'h3c5b;
              5'h01: normal_out = 16'h3c5b;
              5'h02: normal_out = 16'h3c5b;
              5'h03: normal_out = 16'h3c5b;
              5'h04: normal_out = 16'h3c5b;
              5'h05: normal_out = 16'h3c5b;
              5'h06: normal_out = 16'h3c5b;
              5'h07: normal_out = 16'h3c5b;
              5'h1d: normal_out = 16'h3c5d;
              5'h1e: normal_out = 16'h3c5d;
              5'h1f: normal_out = 16'h3c5d;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      6'h0c: begin
        case (mant[9:5])
          5'h00: begin
            normal_out = 16'h3c5e;
            case (mant[4:0])
              5'h00: normal_out = 16'h3c5d;
              5'h01: normal_out = 16'h3c5d;
              5'h02: normal_out = 16'h3c5d;
              5'h03: normal_out = 16'h3c5d;
              5'h04: normal_out = 16'h3c5d;
              5'h05: normal_out = 16'h3c5d;
              5'h06: normal_out = 16'h3c5d;
              5'h07: normal_out = 16'h3c5d;
              5'h08: normal_out = 16'h3c5d;
              5'h14: normal_out = 16'h3c5f;
              5'h15: normal_out = 16'h3c5f;
              5'h16: normal_out = 16'h3c5f;
              5'h17: normal_out = 16'h3c5f;
              5'h18: normal_out = 16'h3c5f;
              5'h19: normal_out = 16'h3c5f;
              5'h1a: normal_out = 16'h3c5f;
              5'h1b: normal_out = 16'h3c5f;
              5'h1c: normal_out = 16'h3c5f;
              5'h1d: normal_out = 16'h3c5f;
              5'h1e: normal_out = 16'h3c60;
              5'h1f: normal_out = 16'h3c60;
              default: begin end
            endcase
          end
          5'h01: begin
            normal_out = 16'h3c62;
            case (mant[4:0])
              5'h00: normal_out = 16'h3c60;
              5'h01: normal_out = 16'h3c60;
              5'h02: normal_out = 16'h3c60;
              5'h03: normal_out = 16'h3c60;
              5'h04: normal_out = 16'h3c60;
              5'h05: normal_out = 16'h3c60;
              5'h06: normal_out = 16'h3c60;
              5'h07: normal_out = 16'h3c60;
              5'h08: normal_out = 16'h3c60;
              5'h09: normal_out = 16'h3c61;
              5'h0a: normal_out = 16'h3c61;
              5'h0b: normal_out = 16'h3c61;
              5'h0c: normal_out = 16'h3c61;
              5'h0d: normal_out = 16'h3c61;
              5'h0e: normal_out = 16'h3c61;
              5'h0f: normal_out = 16'h3c61;
              5'h10: normal_out = 16'h3c61;
              5'h11: normal_out = 16'h3c61;
              5'h12: normal_out = 16'h3c61;
              5'h1e: normal_out = 16'h3c63;
              5'h1f: normal_out = 16'h3c63;
              default: begin end
            endcase
          end
          5'h02: begin
            normal_out = 16'h3c64;
            case (mant[4:0])
              5'h00: normal_out = 16'h3c63;
              5'h01: normal_out = 16'h3c63;
              5'h02: normal_out = 16'h3c63;
              5'h03: normal_out = 16'h3c63;
              5'h04: normal_out = 16'h3c63;
              5'h05: normal_out = 16'h3c63;
              5'h06: normal_out = 16'h3c63;
              5'h07: normal_out = 16'h3c63;
              5'h13: normal_out = 16'h3c65;
              5'h14: normal_out = 16'h3c65;
              5'h15: normal_out = 16'h3c65;
              5'h16: normal_out = 16'h3c65;
              5'h17: normal_out = 16'h3c65;
              5'h18: normal_out = 16'h3c65;
              5'h19: normal_out = 16'h3c65;
              5'h1a: normal_out = 16'h3c65;
              5'h1b: normal_out = 16'h3c65;
              5'h1c: normal_out = 16'h3c65;
              5'h1d: normal_out = 16'h3c66;
              5'h1e: normal_out = 16'h3c66;
              5'h1f: normal_out = 16'h3c66;
              default: begin end
            endcase
          end
          5'h03: begin
            normal_out = 16'h3c68;
            case (mant[4:0])
              5'h00: normal_out = 16'h3c66;
              5'h01: normal_out = 16'h3c66;
              5'h02: normal_out = 16'h3c66;
              5'h03: normal_out = 16'h3c66;
              5'h04: normal_out = 16'h3c66;
              5'h05: normal_out = 16'h3c66;
              5'h06: normal_out = 16'h3c66;
              5'h07: normal_out = 16'h3c66;
              5'h08: normal_out = 16'h3c67;
              5'h09: normal_out = 16'h3c67;
              5'h0a: normal_out = 16'h3c67;
              5'h0b: normal_out = 16'h3c67;
              5'h0c: normal_out = 16'h3c67;
              5'h0d: normal_out = 16'h3c67;
              5'h0e: normal_out = 16'h3c67;
              5'h0f: normal_out = 16'h3c67;
              5'h10: normal_out = 16'h3c67;
              5'h11: normal_out = 16'h3c67;
              5'h1d: normal_out = 16'h3c69;
              5'h1e: normal_out = 16'h3c69;
              5'h1f: normal_out = 16'h3c69;
              default: begin end
            endcase
          end
          5'h04: begin
            normal_out = 16'h3c6a;
            case (mant[4:0])
              5'h00: normal_out = 16'h3c69;
              5'h01: normal_out = 16'h3c69;
              5'h02: normal_out = 16'h3c69;
              5'h03: normal_out = 16'h3c69;
              5'h04: normal_out = 16'h3c69;
              5'h05: normal_out = 16'h3c69;
              5'h06: normal_out = 16'h3c69;
              5'h12: normal_out = 16'h3c6b;
              5'h13: normal_out = 16'h3c6b;
              5'h14: normal_out = 16'h3c6b;
              5'h15: normal_out = 16'h3c6b;
              5'h16: normal_out = 16'h3c6b;
              5'h17: normal_out = 16'h3c6b;
              5'h18: normal_out = 16'h3c6b;
              5'h19: normal_out = 16'h3c6b;
              5'h1a: normal_out = 16'h3c6b;
              5'h1b: normal_out = 16'h3c6b;
              5'h1c: normal_out = 16'h3c6c;
              5'h1d: normal_out = 16'h3c6c;
              5'h1e: normal_out = 16'h3c6c;
              5'h1f: normal_out = 16'h3c6c;
              default: begin end
            endcase
          end
          5'h05: begin
            normal_out = 16'h3c6e;
            case (mant[4:0])
              5'h00: normal_out = 16'h3c6c;
              5'h01: normal_out = 16'h3c6c;
              5'h02: normal_out = 16'h3c6c;
              5'h03: normal_out = 16'h3c6c;
              5'h04: normal_out = 16'h3c6c;
              5'h05: normal_out = 16'h3c6c;
              5'h06: normal_out = 16'h3c6c;
              5'h07: normal_out = 16'h3c6d;
              5'h08: normal_out = 16'h3c6d;
              5'h09: normal_out = 16'h3c6d;
              5'h0a: normal_out = 16'h3c6d;
              5'h0b: normal_out = 16'h3c6d;
              5'h0c: normal_out = 16'h3c6d;
              5'h0d: normal_out = 16'h3c6d;
              5'h0e: normal_out = 16'h3c6d;
              5'h0f: normal_out = 16'h3c6d;
              5'h10: normal_out = 16'h3c6d;
              5'h1c: normal_out = 16'h3c6f;
              5'h1d: normal_out = 16'h3c6f;
              5'h1e: normal_out = 16'h3c6f;
              5'h1f: normal_out = 16'h3c6f;
              default: begin end
            endcase
          end
          5'h06: begin
            normal_out = 16'h3c71;
            case (mant[4:0])
              5'h00: normal_out = 16'h3c6f;
              5'h01: normal_out = 16'h3c6f;
              5'h02: normal_out = 16'h3c6f;
              5'h03: normal_out = 16'h3c6f;
              5'h04: normal_out = 16'h3c6f;
              5'h05: normal_out = 16'h3c6f;
              5'h06: normal_out = 16'h3c70;
              5'h07: normal_out = 16'h3c70;
              5'h08: normal_out = 16'h3c70;
              5'h09: normal_out = 16'h3c70;
              5'h0a: normal_out = 16'h3c70;
              5'h0b: normal_out = 16'h3c70;
              5'h0c: normal_out = 16'h3c70;
              5'h0d: normal_out = 16'h3c70;
              5'h0e: normal_out = 16'h3c70;
              5'h0f: normal_out = 16'h3c70;
              5'h1b: normal_out = 16'h3c72;
              5'h1c: normal_out = 16'h3c72;
              5'h1d: normal_out = 16'h3c72;
              5'h1e: normal_out = 16'h3c72;
              5'h1f: normal_out = 16'h3c72;
              default: begin end
            endcase
          end
          5'h07: begin
            normal_out = 16'h3c73;
            case (mant[4:0])
              5'h00: normal_out = 16'h3c72;
              5'h01: normal_out = 16'h3c72;
              5'h02: normal_out = 16'h3c72;
              5'h03: normal_out = 16'h3c72;
              5'h04: normal_out = 16'h3c72;
              5'h10: normal_out = 16'h3c74;
              5'h11: normal_out = 16'h3c74;
              5'h12: normal_out = 16'h3c74;
              5'h13: normal_out = 16'h3c74;
              5'h14: normal_out = 16'h3c74;
              5'h15: normal_out = 16'h3c74;
              5'h16: normal_out = 16'h3c74;
              5'h17: normal_out = 16'h3c74;
              5'h18: normal_out = 16'h3c74;
              5'h19: normal_out = 16'h3c74;
              5'h1a: normal_out = 16'h3c75;
              5'h1b: normal_out = 16'h3c75;
              5'h1c: normal_out = 16'h3c75;
              5'h1d: normal_out = 16'h3c75;
              5'h1e: normal_out = 16'h3c75;
              5'h1f: normal_out = 16'h3c75;
              default: begin end
            endcase
          end
          5'h08: begin
            normal_out = 16'h3c76;
            case (mant[4:0])
              5'h00: normal_out = 16'h3c75;
              5'h01: normal_out = 16'h3c75;
              5'h02: normal_out = 16'h3c75;
              5'h03: normal_out = 16'h3c75;
              5'h0f: normal_out = 16'h3c77;
              5'h10: normal_out = 16'h3c77;
              5'h11: normal_out = 16'h3c77;
              5'h12: normal_out = 16'h3c77;
              5'h13: normal_out = 16'h3c77;
              5'h14: normal_out = 16'h3c77;
              5'h15: normal_out = 16'h3c77;
              5'h16: normal_out = 16'h3c77;
              5'h17: normal_out = 16'h3c77;
              5'h18: normal_out = 16'h3c77;
              5'h19: normal_out = 16'h3c78;
              5'h1a: normal_out = 16'h3c78;
              5'h1b: normal_out = 16'h3c78;
              5'h1c: normal_out = 16'h3c78;
              5'h1d: normal_out = 16'h3c78;
              5'h1e: normal_out = 16'h3c78;
              5'h1f: normal_out = 16'h3c78;
              default: begin end
            endcase
          end
          5'h09: begin
            normal_out = 16'h3c79;
            case (mant[4:0])
              5'h00: normal_out = 16'h3c78;
              5'h01: normal_out = 16'h3c78;
              5'h02: normal_out = 16'h3c78;
              5'h0e: normal_out = 16'h3c7a;
              5'h0f: normal_out = 16'h3c7a;
              5'h10: normal_out = 16'h3c7a;
              5'h11: normal_out = 16'h3c7a;
              5'h12: normal_out = 16'h3c7a;
              5'h13: normal_out = 16'h3c7a;
              5'h14: normal_out = 16'h3c7a;
              5'h15: normal_out = 16'h3c7a;
              5'h16: normal_out = 16'h3c7a;
              5'h17: normal_out = 16'h3c7a;
              5'h18: normal_out = 16'h3c7b;
              5'h19: normal_out = 16'h3c7b;
              5'h1a: normal_out = 16'h3c7b;
              5'h1b: normal_out = 16'h3c7b;
              5'h1c: normal_out = 16'h3c7b;
              5'h1d: normal_out = 16'h3c7b;
              5'h1e: normal_out = 16'h3c7b;
              5'h1f: normal_out = 16'h3c7b;
              default: begin end
            endcase
          end
          5'h0a: begin
            normal_out = 16'h3c7c;
            case (mant[4:0])
              5'h00: normal_out = 16'h3c7b;
              5'h01: normal_out = 16'h3c7b;
              5'h0d: normal_out = 16'h3c7d;
              5'h0e: normal_out = 16'h3c7d;
              5'h0f: normal_out = 16'h3c7d;
              5'h10: normal_out = 16'h3c7d;
              5'h11: normal_out = 16'h3c7d;
              5'h12: normal_out = 16'h3c7d;
              5'h13: normal_out = 16'h3c7d;
              5'h14: normal_out = 16'h3c7d;
              5'h15: normal_out = 16'h3c7d;
              5'h16: normal_out = 16'h3c7d;
              5'h17: normal_out = 16'h3c7e;
              5'h18: normal_out = 16'h3c7e;
              5'h19: normal_out = 16'h3c7e;
              5'h1a: normal_out = 16'h3c7e;
              5'h1b: normal_out = 16'h3c7e;
              5'h1c: normal_out = 16'h3c7e;
              5'h1d: normal_out = 16'h3c7e;
              5'h1e: normal_out = 16'h3c7e;
              5'h1f: normal_out = 16'h3c7e;
              default: begin end
            endcase
          end
          5'h0b: begin
            normal_out = 16'h3c80;
            case (mant[4:0])
              5'h00: normal_out = 16'h3c7e;
              5'h01: normal_out = 16'h3c7f;
              5'h02: normal_out = 16'h3c7f;
              5'h03: normal_out = 16'h3c7f;
              5'h04: normal_out = 16'h3c7f;
              5'h05: normal_out = 16'h3c7f;
              5'h06: normal_out = 16'h3c7f;
              5'h07: normal_out = 16'h3c7f;
              5'h08: normal_out = 16'h3c7f;
              5'h09: normal_out = 16'h3c7f;
              5'h0a: normal_out = 16'h3c7f;
              5'h16: normal_out = 16'h3c81;
              5'h17: normal_out = 16'h3c81;
              5'h18: normal_out = 16'h3c81;
              5'h19: normal_out = 16'h3c81;
              5'h1a: normal_out = 16'h3c81;
              5'h1b: normal_out = 16'h3c81;
              5'h1c: normal_out = 16'h3c81;
              5'h1d: normal_out = 16'h3c81;
              5'h1e: normal_out = 16'h3c81;
              5'h1f: normal_out = 16'h3c81;
              default: begin end
            endcase
          end
          5'h0c: begin
            normal_out = 16'h3c84;
            case (mant[4:0])
              5'h00: normal_out = 16'h3c82;
              5'h01: normal_out = 16'h3c82;
              5'h02: normal_out = 16'h3c82;
              5'h03: normal_out = 16'h3c82;
              5'h04: normal_out = 16'h3c82;
              5'h05: normal_out = 16'h3c82;
              5'h06: normal_out = 16'h3c82;
              5'h07: normal_out = 16'h3c82;
              5'h08: normal_out = 16'h3c82;
              5'h09: normal_out = 16'h3c82;
              5'h0a: normal_out = 16'h3c83;
              5'h0b: normal_out = 16'h3c83;
              5'h0c: normal_out = 16'h3c83;
              5'h0d: normal_out = 16'h3c83;
              5'h0e: normal_out = 16'h3c83;
              5'h0f: normal_out = 16'h3c83;
              5'h10: normal_out = 16'h3c83;
              5'h11: normal_out = 16'h3c83;
              5'h12: normal_out = 16'h3c83;
              5'h13: normal_out = 16'h3c83;
              5'h1f: normal_out = 16'h3c85;
              default: begin end
            endcase
          end
          5'h0d: begin
            normal_out = 16'h3c86;
            case (mant[4:0])
              5'h00: normal_out = 16'h3c85;
              5'h01: normal_out = 16'h3c85;
              5'h02: normal_out = 16'h3c85;
              5'h03: normal_out = 16'h3c85;
              5'h04: normal_out = 16'h3c85;
              5'h05: normal_out = 16'h3c85;
              5'h06: normal_out = 16'h3c85;
              5'h07: normal_out = 16'h3c85;
              5'h08: normal_out = 16'h3c85;
              5'h13: normal_out = 16'h3c87;
              5'h14: normal_out = 16'h3c87;
              5'h15: normal_out = 16'h3c87;
              5'h16: normal_out = 16'h3c87;
              5'h17: normal_out = 16'h3c87;
              5'h18: normal_out = 16'h3c87;
              5'h19: normal_out = 16'h3c87;
              5'h1a: normal_out = 16'h3c87;
              5'h1b: normal_out = 16'h3c87;
              5'h1c: normal_out = 16'h3c87;
              5'h1d: normal_out = 16'h3c88;
              5'h1e: normal_out = 16'h3c88;
              5'h1f: normal_out = 16'h3c88;
              default: begin end
            endcase
          end
          5'h0e: begin
            normal_out = 16'h3c89;
            case (mant[4:0])
              5'h00: normal_out = 16'h3c88;
              5'h01: normal_out = 16'h3c88;
              5'h02: normal_out = 16'h3c88;
              5'h03: normal_out = 16'h3c88;
              5'h04: normal_out = 16'h3c88;
              5'h05: normal_out = 16'h3c88;
              5'h06: normal_out = 16'h3c88;
              5'h12: normal_out = 16'h3c8a;
              5'h13: normal_out = 16'h3c8a;
              5'h14: normal_out = 16'h3c8a;
              5'h15: normal_out = 16'h3c8a;
              5'h16: normal_out = 16'h3c8a;
              5'h17: normal_out = 16'h3c8a;
              5'h18: normal_out = 16'h3c8a;
              5'h19: normal_out = 16'h3c8a;
              5'h1a: normal_out = 16'h3c8a;
              5'h1b: normal_out = 16'h3c8a;
              5'h1c: normal_out = 16'h3c8b;
              5'h1d: normal_out = 16'h3c8b;
              5'h1e: normal_out = 16'h3c8b;
              5'h1f: normal_out = 16'h3c8b;
              default: begin end
            endcase
          end
          5'h0f: begin
            normal_out = 16'h3c8c;
            case (mant[4:0])
              5'h00: normal_out = 16'h3c8b;
              5'h01: normal_out = 16'h3c8b;
              5'h02: normal_out = 16'h3c8b;
              5'h03: normal_out = 16'h3c8b;
              5'h04: normal_out = 16'h3c8b;
              5'h05: normal_out = 16'h3c8b;
              5'h10: normal_out = 16'h3c8d;
              5'h11: normal_out = 16'h3c8d;
              5'h12: normal_out = 16'h3c8d;
              5'h13: normal_out = 16'h3c8d;
              5'h14: normal_out = 16'h3c8d;
              5'h15: normal_out = 16'h3c8d;
              5'h16: normal_out = 16'h3c8d;
              5'h17: normal_out = 16'h3c8d;
              5'h18: normal_out = 16'h3c8d;
              5'h19: normal_out = 16'h3c8d;
              5'h1a: normal_out = 16'h3c8e;
              5'h1b: normal_out = 16'h3c8e;
              5'h1c: normal_out = 16'h3c8e;
              5'h1d: normal_out = 16'h3c8e;
              5'h1e: normal_out = 16'h3c8e;
              5'h1f: normal_out = 16'h3c8e;
              default: begin end
            endcase
          end
          5'h10: begin
            normal_out = 16'h3c90;
            case (mant[4:0])
              5'h00: normal_out = 16'h3c8e;
              5'h01: normal_out = 16'h3c8e;
              5'h02: normal_out = 16'h3c8e;
              5'h03: normal_out = 16'h3c8e;
              5'h04: normal_out = 16'h3c8f;
              5'h05: normal_out = 16'h3c8f;
              5'h06: normal_out = 16'h3c8f;
              5'h07: normal_out = 16'h3c8f;
              5'h08: normal_out = 16'h3c8f;
              5'h09: normal_out = 16'h3c8f;
              5'h0a: normal_out = 16'h3c8f;
              5'h0b: normal_out = 16'h3c8f;
              5'h0c: normal_out = 16'h3c8f;
              5'h0d: normal_out = 16'h3c8f;
              5'h19: normal_out = 16'h3c91;
              5'h1a: normal_out = 16'h3c91;
              5'h1b: normal_out = 16'h3c91;
              5'h1c: normal_out = 16'h3c91;
              5'h1d: normal_out = 16'h3c91;
              5'h1e: normal_out = 16'h3c91;
              5'h1f: normal_out = 16'h3c91;
              default: begin end
            endcase
          end
          5'h11: begin
            normal_out = 16'h3c92;
            case (mant[4:0])
              5'h00: normal_out = 16'h3c91;
              5'h01: normal_out = 16'h3c91;
              5'h02: normal_out = 16'h3c91;
              5'h0d: normal_out = 16'h3c93;
              5'h0e: normal_out = 16'h3c93;
              5'h0f: normal_out = 16'h3c93;
              5'h10: normal_out = 16'h3c93;
              5'h11: normal_out = 16'h3c93;
              5'h12: normal_out = 16'h3c93;
              5'h13: normal_out = 16'h3c93;
              5'h14: normal_out = 16'h3c93;
              5'h15: normal_out = 16'h3c93;
              5'h16: normal_out = 16'h3c93;
              5'h17: normal_out = 16'h3c94;
              5'h18: normal_out = 16'h3c94;
              5'h19: normal_out = 16'h3c94;
              5'h1a: normal_out = 16'h3c94;
              5'h1b: normal_out = 16'h3c94;
              5'h1c: normal_out = 16'h3c94;
              5'h1d: normal_out = 16'h3c94;
              5'h1e: normal_out = 16'h3c94;
              5'h1f: normal_out = 16'h3c94;
              default: begin end
            endcase
          end
          5'h12: begin
            normal_out = 16'h3c95;
            case (mant[4:0])
              5'h00: normal_out = 16'h3c94;
              5'h0b: normal_out = 16'h3c96;
              5'h0c: normal_out = 16'h3c96;
              5'h0d: normal_out = 16'h3c96;
              5'h0e: normal_out = 16'h3c96;
              5'h0f: normal_out = 16'h3c96;
              5'h10: normal_out = 16'h3c96;
              5'h11: normal_out = 16'h3c96;
              5'h12: normal_out = 16'h3c96;
              5'h13: normal_out = 16'h3c96;
              5'h14: normal_out = 16'h3c96;
              5'h15: normal_out = 16'h3c97;
              5'h16: normal_out = 16'h3c97;
              5'h17: normal_out = 16'h3c97;
              5'h18: normal_out = 16'h3c97;
              5'h19: normal_out = 16'h3c97;
              5'h1a: normal_out = 16'h3c97;
              5'h1b: normal_out = 16'h3c97;
              5'h1c: normal_out = 16'h3c97;
              5'h1d: normal_out = 16'h3c97;
              5'h1e: normal_out = 16'h3c97;
              5'h1f: normal_out = 16'h3c98;
              default: begin end
            endcase
          end
          5'h13: begin
            normal_out = 16'h3c99;
            case (mant[4:0])
              5'h00: normal_out = 16'h3c98;
              5'h01: normal_out = 16'h3c98;
              5'h02: normal_out = 16'h3c98;
              5'h03: normal_out = 16'h3c98;
              5'h04: normal_out = 16'h3c98;
              5'h05: normal_out = 16'h3c98;
              5'h06: normal_out = 16'h3c98;
              5'h07: normal_out = 16'h3c98;
              5'h08: normal_out = 16'h3c98;
              5'h13: normal_out = 16'h3c9a;
              5'h14: normal_out = 16'h3c9a;
              5'h15: normal_out = 16'h3c9a;
              5'h16: normal_out = 16'h3c9a;
              5'h17: normal_out = 16'h3c9a;
              5'h18: normal_out = 16'h3c9a;
              5'h19: normal_out = 16'h3c9a;
              5'h1a: normal_out = 16'h3c9a;
              5'h1b: normal_out = 16'h3c9a;
              5'h1c: normal_out = 16'h3c9a;
              5'h1d: normal_out = 16'h3c9b;
              5'h1e: normal_out = 16'h3c9b;
              5'h1f: normal_out = 16'h3c9b;
              default: begin end
            endcase
          end
          5'h14: begin
            normal_out = 16'h3c9c;
            case (mant[4:0])
              5'h00: normal_out = 16'h3c9b;
              5'h01: normal_out = 16'h3c9b;
              5'h02: normal_out = 16'h3c9b;
              5'h03: normal_out = 16'h3c9b;
              5'h04: normal_out = 16'h3c9b;
              5'h05: normal_out = 16'h3c9b;
              5'h06: normal_out = 16'h3c9b;
              5'h11: normal_out = 16'h3c9d;
              5'h12: normal_out = 16'h3c9d;
              5'h13: normal_out = 16'h3c9d;
              5'h14: normal_out = 16'h3c9d;
              5'h15: normal_out = 16'h3c9d;
              5'h16: normal_out = 16'h3c9d;
              5'h17: normal_out = 16'h3c9d;
              5'h18: normal_out = 16'h3c9d;
              5'h19: normal_out = 16'h3c9d;
              5'h1a: normal_out = 16'h3c9d;
              5'h1b: normal_out = 16'h3c9e;
              5'h1c: normal_out = 16'h3c9e;
              5'h1d: normal_out = 16'h3c9e;
              5'h1e: normal_out = 16'h3c9e;
              5'h1f: normal_out = 16'h3c9e;
              default: begin end
            endcase
          end
          5'h15: begin
            normal_out = 16'h3c9f;
            case (mant[4:0])
              5'h00: normal_out = 16'h3c9e;
              5'h01: normal_out = 16'h3c9e;
              5'h02: normal_out = 16'h3c9e;
              5'h03: normal_out = 16'h3c9e;
              5'h04: normal_out = 16'h3c9e;
              5'h0f: normal_out = 16'h3ca0;
              5'h10: normal_out = 16'h3ca0;
              5'h11: normal_out = 16'h3ca0;
              5'h12: normal_out = 16'h3ca0;
              5'h13: normal_out = 16'h3ca0;
              5'h14: normal_out = 16'h3ca0;
              5'h15: normal_out = 16'h3ca0;
              5'h16: normal_out = 16'h3ca0;
              5'h17: normal_out = 16'h3ca0;
              5'h18: normal_out = 16'h3ca0;
              5'h19: normal_out = 16'h3ca1;
              5'h1a: normal_out = 16'h3ca1;
              5'h1b: normal_out = 16'h3ca1;
              5'h1c: normal_out = 16'h3ca1;
              5'h1d: normal_out = 16'h3ca1;
              5'h1e: normal_out = 16'h3ca1;
              5'h1f: normal_out = 16'h3ca1;
              default: begin end
            endcase
          end
          5'h16: begin
            normal_out = 16'h3ca2;
            case (mant[4:0])
              5'h00: normal_out = 16'h3ca1;
              5'h01: normal_out = 16'h3ca1;
              5'h02: normal_out = 16'h3ca1;
              5'h0d: normal_out = 16'h3ca3;
              5'h0e: normal_out = 16'h3ca3;
              5'h0f: normal_out = 16'h3ca3;
              5'h10: normal_out = 16'h3ca3;
              5'h11: normal_out = 16'h3ca3;
              5'h12: normal_out = 16'h3ca3;
              5'h13: normal_out = 16'h3ca3;
              5'h14: normal_out = 16'h3ca3;
              5'h15: normal_out = 16'h3ca3;
              5'h16: normal_out = 16'h3ca3;
              5'h17: normal_out = 16'h3ca4;
              5'h18: normal_out = 16'h3ca4;
              5'h19: normal_out = 16'h3ca4;
              5'h1a: normal_out = 16'h3ca4;
              5'h1b: normal_out = 16'h3ca4;
              5'h1c: normal_out = 16'h3ca4;
              5'h1d: normal_out = 16'h3ca4;
              5'h1e: normal_out = 16'h3ca4;
              5'h1f: normal_out = 16'h3ca4;
              default: begin end
            endcase
          end
          5'h17: begin
            normal_out = 16'h3ca5;
            case (mant[4:0])
              5'h00: normal_out = 16'h3ca4;
              5'h0b: normal_out = 16'h3ca6;
              5'h0c: normal_out = 16'h3ca6;
              5'h0d: normal_out = 16'h3ca6;
              5'h0e: normal_out = 16'h3ca6;
              5'h0f: normal_out = 16'h3ca6;
              5'h10: normal_out = 16'h3ca6;
              5'h11: normal_out = 16'h3ca6;
              5'h12: normal_out = 16'h3ca6;
              5'h13: normal_out = 16'h3ca6;
              5'h14: normal_out = 16'h3ca6;
              5'h15: normal_out = 16'h3ca7;
              5'h16: normal_out = 16'h3ca7;
              5'h17: normal_out = 16'h3ca7;
              5'h18: normal_out = 16'h3ca7;
              5'h19: normal_out = 16'h3ca7;
              5'h1a: normal_out = 16'h3ca7;
              5'h1b: normal_out = 16'h3ca7;
              5'h1c: normal_out = 16'h3ca7;
              5'h1d: normal_out = 16'h3ca7;
              5'h1e: normal_out = 16'h3ca7;
              5'h1f: normal_out = 16'h3ca8;
              default: begin end
            endcase
          end
          5'h18: begin
            normal_out = 16'h3ca9;
            case (mant[4:0])
              5'h00: normal_out = 16'h3ca8;
              5'h01: normal_out = 16'h3ca8;
              5'h02: normal_out = 16'h3ca8;
              5'h03: normal_out = 16'h3ca8;
              5'h04: normal_out = 16'h3ca8;
              5'h05: normal_out = 16'h3ca8;
              5'h06: normal_out = 16'h3ca8;
              5'h07: normal_out = 16'h3ca8;
              5'h08: normal_out = 16'h3ca8;
              5'h13: normal_out = 16'h3caa;
              5'h14: normal_out = 16'h3caa;
              5'h15: normal_out = 16'h3caa;
              5'h16: normal_out = 16'h3caa;
              5'h17: normal_out = 16'h3caa;
              5'h18: normal_out = 16'h3caa;
              5'h19: normal_out = 16'h3caa;
              5'h1a: normal_out = 16'h3caa;
              5'h1b: normal_out = 16'h3caa;
              5'h1c: normal_out = 16'h3caa;
              5'h1d: normal_out = 16'h3cab;
              5'h1e: normal_out = 16'h3cab;
              5'h1f: normal_out = 16'h3cab;
              default: begin end
            endcase
          end
          5'h19: begin
            normal_out = 16'h3cad;
            case (mant[4:0])
              5'h00: normal_out = 16'h3cab;
              5'h01: normal_out = 16'h3cab;
              5'h02: normal_out = 16'h3cab;
              5'h03: normal_out = 16'h3cab;
              5'h04: normal_out = 16'h3cab;
              5'h05: normal_out = 16'h3cab;
              5'h06: normal_out = 16'h3cab;
              5'h07: normal_out = 16'h3cac;
              5'h08: normal_out = 16'h3cac;
              5'h09: normal_out = 16'h3cac;
              5'h0a: normal_out = 16'h3cac;
              5'h0b: normal_out = 16'h3cac;
              5'h0c: normal_out = 16'h3cac;
              5'h0d: normal_out = 16'h3cac;
              5'h0e: normal_out = 16'h3cac;
              5'h0f: normal_out = 16'h3cac;
              5'h1a: normal_out = 16'h3cae;
              5'h1b: normal_out = 16'h3cae;
              5'h1c: normal_out = 16'h3cae;
              5'h1d: normal_out = 16'h3cae;
              5'h1e: normal_out = 16'h3cae;
              5'h1f: normal_out = 16'h3cae;
              default: begin end
            endcase
          end
          5'h1a: begin
            normal_out = 16'h3caf;
            case (mant[4:0])
              5'h00: normal_out = 16'h3cae;
              5'h01: normal_out = 16'h3cae;
              5'h02: normal_out = 16'h3cae;
              5'h03: normal_out = 16'h3cae;
              5'h0e: normal_out = 16'h3cb0;
              5'h0f: normal_out = 16'h3cb0;
              5'h10: normal_out = 16'h3cb0;
              5'h11: normal_out = 16'h3cb0;
              5'h12: normal_out = 16'h3cb0;
              5'h13: normal_out = 16'h3cb0;
              5'h14: normal_out = 16'h3cb0;
              5'h15: normal_out = 16'h3cb0;
              5'h16: normal_out = 16'h3cb0;
              5'h17: normal_out = 16'h3cb0;
              5'h18: normal_out = 16'h3cb1;
              5'h19: normal_out = 16'h3cb1;
              5'h1a: normal_out = 16'h3cb1;
              5'h1b: normal_out = 16'h3cb1;
              5'h1c: normal_out = 16'h3cb1;
              5'h1d: normal_out = 16'h3cb1;
              5'h1e: normal_out = 16'h3cb1;
              5'h1f: normal_out = 16'h3cb1;
              default: begin end
            endcase
          end
          5'h1b: begin
            normal_out = 16'h3cb2;
            case (mant[4:0])
              5'h00: normal_out = 16'h3cb1;
              5'h01: normal_out = 16'h3cb1;
              5'h0c: normal_out = 16'h3cb3;
              5'h0d: normal_out = 16'h3cb3;
              5'h0e: normal_out = 16'h3cb3;
              5'h0f: normal_out = 16'h3cb3;
              5'h10: normal_out = 16'h3cb3;
              5'h11: normal_out = 16'h3cb3;
              5'h12: normal_out = 16'h3cb3;
              5'h13: normal_out = 16'h3cb3;
              5'h14: normal_out = 16'h3cb3;
              5'h15: normal_out = 16'h3cb4;
              5'h16: normal_out = 16'h3cb4;
              5'h17: normal_out = 16'h3cb4;
              5'h18: normal_out = 16'h3cb4;
              5'h19: normal_out = 16'h3cb4;
              5'h1a: normal_out = 16'h3cb4;
              5'h1b: normal_out = 16'h3cb4;
              5'h1c: normal_out = 16'h3cb4;
              5'h1d: normal_out = 16'h3cb4;
              5'h1e: normal_out = 16'h3cb4;
              5'h1f: normal_out = 16'h3cb5;
              default: begin end
            endcase
          end
          5'h1c: begin
            normal_out = 16'h3cb6;
            case (mant[4:0])
              5'h00: normal_out = 16'h3cb5;
              5'h01: normal_out = 16'h3cb5;
              5'h02: normal_out = 16'h3cb5;
              5'h03: normal_out = 16'h3cb5;
              5'h04: normal_out = 16'h3cb5;
              5'h05: normal_out = 16'h3cb5;
              5'h06: normal_out = 16'h3cb5;
              5'h07: normal_out = 16'h3cb5;
              5'h08: normal_out = 16'h3cb5;
              5'h13: normal_out = 16'h3cb7;
              5'h14: normal_out = 16'h3cb7;
              5'h15: normal_out = 16'h3cb7;
              5'h16: normal_out = 16'h3cb7;
              5'h17: normal_out = 16'h3cb7;
              5'h18: normal_out = 16'h3cb7;
              5'h19: normal_out = 16'h3cb7;
              5'h1a: normal_out = 16'h3cb7;
              5'h1b: normal_out = 16'h3cb7;
              5'h1c: normal_out = 16'h3cb7;
              5'h1d: normal_out = 16'h3cb8;
              5'h1e: normal_out = 16'h3cb8;
              5'h1f: normal_out = 16'h3cb8;
              default: begin end
            endcase
          end
          5'h1d: begin
            normal_out = 16'h3cb9;
            case (mant[4:0])
              5'h00: normal_out = 16'h3cb8;
              5'h01: normal_out = 16'h3cb8;
              5'h02: normal_out = 16'h3cb8;
              5'h03: normal_out = 16'h3cb8;
              5'h04: normal_out = 16'h3cb8;
              5'h05: normal_out = 16'h3cb8;
              5'h10: normal_out = 16'h3cba;
              5'h11: normal_out = 16'h3cba;
              5'h12: normal_out = 16'h3cba;
              5'h13: normal_out = 16'h3cba;
              5'h14: normal_out = 16'h3cba;
              5'h15: normal_out = 16'h3cba;
              5'h16: normal_out = 16'h3cba;
              5'h17: normal_out = 16'h3cba;
              5'h18: normal_out = 16'h3cba;
              5'h19: normal_out = 16'h3cba;
              5'h1a: normal_out = 16'h3cbb;
              5'h1b: normal_out = 16'h3cbb;
              5'h1c: normal_out = 16'h3cbb;
              5'h1d: normal_out = 16'h3cbb;
              5'h1e: normal_out = 16'h3cbb;
              5'h1f: normal_out = 16'h3cbb;
              default: begin end
            endcase
          end
          5'h1e: begin
            normal_out = 16'h3cbd;
            case (mant[4:0])
              5'h00: normal_out = 16'h3cbb;
              5'h01: normal_out = 16'h3cbb;
              5'h02: normal_out = 16'h3cbb;
              5'h03: normal_out = 16'h3cbb;
              5'h04: normal_out = 16'h3cbc;
              5'h05: normal_out = 16'h3cbc;
              5'h06: normal_out = 16'h3cbc;
              5'h07: normal_out = 16'h3cbc;
              5'h08: normal_out = 16'h3cbc;
              5'h09: normal_out = 16'h3cbc;
              5'h0a: normal_out = 16'h3cbc;
              5'h0b: normal_out = 16'h3cbc;
              5'h0c: normal_out = 16'h3cbc;
              5'h17: normal_out = 16'h3cbe;
              5'h18: normal_out = 16'h3cbe;
              5'h19: normal_out = 16'h3cbe;
              5'h1a: normal_out = 16'h3cbe;
              5'h1b: normal_out = 16'h3cbe;
              5'h1c: normal_out = 16'h3cbe;
              5'h1d: normal_out = 16'h3cbe;
              5'h1e: normal_out = 16'h3cbe;
              5'h1f: normal_out = 16'h3cbe;
              default: begin end
            endcase
          end
          5'h1f: begin
            normal_out = 16'h3cbf;
            case (mant[4:0])
              5'h00: normal_out = 16'h3cbe;
              5'h0b: normal_out = 16'h3cc0;
              5'h0c: normal_out = 16'h3cc0;
              5'h0d: normal_out = 16'h3cc0;
              5'h0e: normal_out = 16'h3cc0;
              5'h0f: normal_out = 16'h3cc0;
              5'h10: normal_out = 16'h3cc0;
              5'h11: normal_out = 16'h3cc0;
              5'h12: normal_out = 16'h3cc0;
              5'h13: normal_out = 16'h3cc0;
              5'h14: normal_out = 16'h3cc1;
              5'h15: normal_out = 16'h3cc1;
              5'h16: normal_out = 16'h3cc1;
              5'h17: normal_out = 16'h3cc1;
              5'h18: normal_out = 16'h3cc1;
              5'h19: normal_out = 16'h3cc1;
              5'h1a: normal_out = 16'h3cc1;
              5'h1b: normal_out = 16'h3cc1;
              5'h1c: normal_out = 16'h3cc1;
              5'h1d: normal_out = 16'h3cc1;
              5'h1e: normal_out = 16'h3cc2;
              5'h1f: normal_out = 16'h3cc2;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      6'h0d: begin
        case (mant[9:5])
          5'h00: begin
            normal_out = 16'h3cc3;
            case (mant[4:0])
              5'h00: normal_out = 16'h3cc2;
              5'h01: normal_out = 16'h3cc2;
              5'h02: normal_out = 16'h3cc2;
              5'h03: normal_out = 16'h3cc2;
              5'h09: normal_out = 16'h3cc4;
              5'h0a: normal_out = 16'h3cc4;
              5'h0b: normal_out = 16'h3cc4;
              5'h0c: normal_out = 16'h3cc4;
              5'h0d: normal_out = 16'h3cc4;
              5'h0e: normal_out = 16'h3cc5;
              5'h0f: normal_out = 16'h3cc5;
              5'h10: normal_out = 16'h3cc5;
              5'h11: normal_out = 16'h3cc5;
              5'h12: normal_out = 16'h3cc5;
              5'h13: normal_out = 16'h3cc6;
              5'h14: normal_out = 16'h3cc6;
              5'h15: normal_out = 16'h3cc6;
              5'h16: normal_out = 16'h3cc6;
              5'h17: normal_out = 16'h3cc6;
              5'h18: normal_out = 16'h3cc7;
              5'h19: normal_out = 16'h3cc7;
              5'h1a: normal_out = 16'h3cc7;
              5'h1b: normal_out = 16'h3cc7;
              5'h1c: normal_out = 16'h3cc8;
              5'h1d: normal_out = 16'h3cc8;
              5'h1e: normal_out = 16'h3cc8;
              5'h1f: normal_out = 16'h3cc8;
              default: begin end
            endcase
          end
          5'h01: begin
            normal_out = 16'h3cc9;
            case (mant[4:0])
              5'h00: normal_out = 16'h3cc8;
              5'h06: normal_out = 16'h3cca;
              5'h07: normal_out = 16'h3cca;
              5'h08: normal_out = 16'h3cca;
              5'h09: normal_out = 16'h3cca;
              5'h0a: normal_out = 16'h3cca;
              5'h0b: normal_out = 16'h3ccb;
              5'h0c: normal_out = 16'h3ccb;
              5'h0d: normal_out = 16'h3ccb;
              5'h0e: normal_out = 16'h3ccb;
              5'h0f: normal_out = 16'h3ccb;
              5'h10: normal_out = 16'h3ccc;
              5'h11: normal_out = 16'h3ccc;
              5'h12: normal_out = 16'h3ccc;
              5'h13: normal_out = 16'h3ccc;
              5'h14: normal_out = 16'h3ccd;
              5'h15: normal_out = 16'h3ccd;
              5'h16: normal_out = 16'h3ccd;
              5'h17: normal_out = 16'h3ccd;
              5'h18: normal_out = 16'h3ccd;
              5'h19: normal_out = 16'h3cce;
              5'h1a: normal_out = 16'h3cce;
              5'h1b: normal_out = 16'h3cce;
              5'h1c: normal_out = 16'h3cce;
              5'h1d: normal_out = 16'h3cce;
              5'h1e: normal_out = 16'h3ccf;
              5'h1f: normal_out = 16'h3ccf;
              default: begin end
            endcase
          end
          5'h02: begin
            normal_out = 16'h3cd0;
            case (mant[4:0])
              5'h00: normal_out = 16'h3ccf;
              5'h01: normal_out = 16'h3ccf;
              5'h02: normal_out = 16'h3ccf;
              5'h08: normal_out = 16'h3cd1;
              5'h09: normal_out = 16'h3cd1;
              5'h0a: normal_out = 16'h3cd1;
              5'h0b: normal_out = 16'h3cd1;
              5'h0c: normal_out = 16'h3cd2;
              5'h0d: normal_out = 16'h3cd2;
              5'h0e: normal_out = 16'h3cd2;
              5'h0f: normal_out = 16'h3cd2;
              5'h10: normal_out = 16'h3cd2;
              5'h11: normal_out = 16'h3cd3;
              5'h12: normal_out = 16'h3cd3;
              5'h13: normal_out = 16'h3cd3;
              5'h14: normal_out = 16'h3cd3;
              5'h15: normal_out = 16'h3cd3;
              5'h16: normal_out = 16'h3cd4;
              5'h17: normal_out = 16'h3cd4;
              5'h18: normal_out = 16'h3cd4;
              5'h19: normal_out = 16'h3cd4;
              5'h1a: normal_out = 16'h3cd4;
              5'h1b: normal_out = 16'h3cd5;
              5'h1c: normal_out = 16'h3cd5;
              5'h1d: normal_out = 16'h3cd5;
              5'h1e: normal_out = 16'h3cd5;
              5'h1f: normal_out = 16'h3cd5;
              default: begin end
            endcase
          end
          5'h03: begin
            normal_out = 16'h3cd7;
            case (mant[4:0])
              5'h00: normal_out = 16'h3cd6;
              5'h01: normal_out = 16'h3cd6;
              5'h02: normal_out = 16'h3cd6;
              5'h03: normal_out = 16'h3cd6;
              5'h09: normal_out = 16'h3cd8;
              5'h0a: normal_out = 16'h3cd8;
              5'h0b: normal_out = 16'h3cd8;
              5'h0c: normal_out = 16'h3cd8;
              5'h0d: normal_out = 16'h3cd8;
              5'h0e: normal_out = 16'h3cd9;
              5'h0f: normal_out = 16'h3cd9;
              5'h10: normal_out = 16'h3cd9;
              5'h11: normal_out = 16'h3cd9;
              5'h12: normal_out = 16'h3cd9;
              5'h13: normal_out = 16'h3cda;
              5'h14: normal_out = 16'h3cda;
              5'h15: normal_out = 16'h3cda;
              5'h16: normal_out = 16'h3cda;
              5'h17: normal_out = 16'h3cdb;
              5'h18: normal_out = 16'h3cdb;
              5'h19: normal_out = 16'h3cdb;
              5'h1a: normal_out = 16'h3cdb;
              5'h1b: normal_out = 16'h3cdb;
              5'h1c: normal_out = 16'h3cdc;
              5'h1d: normal_out = 16'h3cdc;
              5'h1e: normal_out = 16'h3cdc;
              5'h1f: normal_out = 16'h3cdc;
              default: begin end
            endcase
          end
          5'h04: begin
            normal_out = 16'h3cdd;
            case (mant[4:0])
              5'h00: normal_out = 16'h3cdc;
              5'h06: normal_out = 16'h3cde;
              5'h07: normal_out = 16'h3cde;
              5'h08: normal_out = 16'h3cde;
              5'h09: normal_out = 16'h3cde;
              5'h0a: normal_out = 16'h3cdf;
              5'h0b: normal_out = 16'h3cdf;
              5'h0c: normal_out = 16'h3cdf;
              5'h0d: normal_out = 16'h3cdf;
              5'h0e: normal_out = 16'h3cdf;
              5'h0f: normal_out = 16'h3ce0;
              5'h10: normal_out = 16'h3ce0;
              5'h11: normal_out = 16'h3ce0;
              5'h12: normal_out = 16'h3ce0;
              5'h13: normal_out = 16'h3ce0;
              5'h14: normal_out = 16'h3ce1;
              5'h15: normal_out = 16'h3ce1;
              5'h16: normal_out = 16'h3ce1;
              5'h17: normal_out = 16'h3ce1;
              5'h18: normal_out = 16'h3ce1;
              5'h19: normal_out = 16'h3ce2;
              5'h1a: normal_out = 16'h3ce2;
              5'h1b: normal_out = 16'h3ce2;
              5'h1c: normal_out = 16'h3ce2;
              5'h1d: normal_out = 16'h3ce3;
              5'h1e: normal_out = 16'h3ce3;
              5'h1f: normal_out = 16'h3ce3;
              default: begin end
            endcase
          end
          5'h05: begin
            normal_out = 16'h3ce4;
            case (mant[4:0])
              5'h00: normal_out = 16'h3ce3;
              5'h01: normal_out = 16'h3ce3;
              5'h07: normal_out = 16'h3ce5;
              5'h08: normal_out = 16'h3ce5;
              5'h09: normal_out = 16'h3ce5;
              5'h0a: normal_out = 16'h3ce5;
              5'h0b: normal_out = 16'h3ce6;
              5'h0c: normal_out = 16'h3ce6;
              5'h0d: normal_out = 16'h3ce6;
              5'h0e: normal_out = 16'h3ce6;
              5'h0f: normal_out = 16'h3ce6;
              5'h10: normal_out = 16'h3ce7;
              5'h11: normal_out = 16'h3ce7;
              5'h12: normal_out = 16'h3ce7;
              5'h13: normal_out = 16'h3ce7;
              5'h14: normal_out = 16'h3ce7;
              5'h15: normal_out = 16'h3ce8;
              5'h16: normal_out = 16'h3ce8;
              5'h17: normal_out = 16'h3ce8;
              5'h18: normal_out = 16'h3ce8;
              5'h19: normal_out = 16'h3ce8;
              5'h1a: normal_out = 16'h3ce9;
              5'h1b: normal_out = 16'h3ce9;
              5'h1c: normal_out = 16'h3ce9;
              5'h1d: normal_out = 16'h3ce9;
              5'h1e: normal_out = 16'h3cea;
              5'h1f: normal_out = 16'h3cea;
              default: begin end
            endcase
          end
          5'h06: begin
            normal_out = 16'h3ceb;
            case (mant[4:0])
              5'h00: normal_out = 16'h3cea;
              5'h01: normal_out = 16'h3cea;
              5'h02: normal_out = 16'h3cea;
              5'h08: normal_out = 16'h3cec;
              5'h09: normal_out = 16'h3cec;
              5'h0a: normal_out = 16'h3cec;
              5'h0b: normal_out = 16'h3cec;
              5'h0c: normal_out = 16'h3ced;
              5'h0d: normal_out = 16'h3ced;
              5'h0e: normal_out = 16'h3ced;
              5'h0f: normal_out = 16'h3ced;
              5'h10: normal_out = 16'h3ced;
              5'h11: normal_out = 16'h3cee;
              5'h12: normal_out = 16'h3cee;
              5'h13: normal_out = 16'h3cee;
              5'h14: normal_out = 16'h3cee;
              5'h15: normal_out = 16'h3cee;
              5'h16: normal_out = 16'h3cef;
              5'h17: normal_out = 16'h3cef;
              5'h18: normal_out = 16'h3cef;
              5'h19: normal_out = 16'h3cef;
              5'h1a: normal_out = 16'h3cf0;
              5'h1b: normal_out = 16'h3cf0;
              5'h1c: normal_out = 16'h3cf0;
              5'h1d: normal_out = 16'h3cf0;
              5'h1e: normal_out = 16'h3cf0;
              5'h1f: normal_out = 16'h3cf1;
              default: begin end
            endcase
          end
          5'h07: begin
            normal_out = 16'h3cf3;
            case (mant[4:0])
              5'h00: normal_out = 16'h3cf1;
              5'h01: normal_out = 16'h3cf1;
              5'h02: normal_out = 16'h3cf1;
              5'h03: normal_out = 16'h3cf1;
              5'h04: normal_out = 16'h3cf2;
              5'h05: normal_out = 16'h3cf2;
              5'h06: normal_out = 16'h3cf2;
              5'h07: normal_out = 16'h3cf2;
              5'h0d: normal_out = 16'h3cf4;
              5'h0e: normal_out = 16'h3cf4;
              5'h0f: normal_out = 16'h3cf4;
              5'h10: normal_out = 16'h3cf4;
              5'h11: normal_out = 16'h3cf4;
              5'h12: normal_out = 16'h3cf5;
              5'h13: normal_out = 16'h3cf5;
              5'h14: normal_out = 16'h3cf5;
              5'h15: normal_out = 16'h3cf5;
              5'h16: normal_out = 16'h3cf6;
              5'h17: normal_out = 16'h3cf6;
              5'h18: normal_out = 16'h3cf6;
              5'h19: normal_out = 16'h3cf6;
              5'h1a: normal_out = 16'h3cf6;
              5'h1b: normal_out = 16'h3cf7;
              5'h1c: normal_out = 16'h3cf7;
              5'h1d: normal_out = 16'h3cf7;
              5'h1e: normal_out = 16'h3cf7;
              5'h1f: normal_out = 16'h3cf7;
              default: begin end
            endcase
          end
          5'h08: begin
            normal_out = 16'h3cf9;
            case (mant[4:0])
              5'h00: normal_out = 16'h3cf8;
              5'h01: normal_out = 16'h3cf8;
              5'h02: normal_out = 16'h3cf8;
              5'h03: normal_out = 16'h3cf8;
              5'h09: normal_out = 16'h3cfa;
              5'h0a: normal_out = 16'h3cfa;
              5'h0b: normal_out = 16'h3cfa;
              5'h0c: normal_out = 16'h3cfa;
              5'h0d: normal_out = 16'h3cfa;
              5'h0e: normal_out = 16'h3cfb;
              5'h0f: normal_out = 16'h3cfb;
              5'h10: normal_out = 16'h3cfb;
              5'h11: normal_out = 16'h3cfb;
              5'h12: normal_out = 16'h3cfc;
              5'h13: normal_out = 16'h3cfc;
              5'h14: normal_out = 16'h3cfc;
              5'h15: normal_out = 16'h3cfc;
              5'h16: normal_out = 16'h3cfc;
              5'h17: normal_out = 16'h3cfd;
              5'h18: normal_out = 16'h3cfd;
              5'h19: normal_out = 16'h3cfd;
              5'h1a: normal_out = 16'h3cfd;
              5'h1b: normal_out = 16'h3cfd;
              5'h1c: normal_out = 16'h3cfe;
              5'h1d: normal_out = 16'h3cfe;
              5'h1e: normal_out = 16'h3cfe;
              5'h1f: normal_out = 16'h3cfe;
              default: begin end
            endcase
          end
          5'h09: begin
            normal_out = 16'h3cff;
            case (mant[4:0])
              5'h05: normal_out = 16'h3d00;
              5'h06: normal_out = 16'h3d00;
              5'h07: normal_out = 16'h3d00;
              5'h08: normal_out = 16'h3d00;
              5'h09: normal_out = 16'h3d01;
              5'h0a: normal_out = 16'h3d01;
              5'h0b: normal_out = 16'h3d01;
              5'h0c: normal_out = 16'h3d01;
              5'h0d: normal_out = 16'h3d01;
              5'h0e: normal_out = 16'h3d02;
              5'h0f: normal_out = 16'h3d02;
              5'h10: normal_out = 16'h3d02;
              5'h11: normal_out = 16'h3d02;
              5'h12: normal_out = 16'h3d02;
              5'h13: normal_out = 16'h3d03;
              5'h14: normal_out = 16'h3d03;
              5'h15: normal_out = 16'h3d03;
              5'h16: normal_out = 16'h3d03;
              5'h17: normal_out = 16'h3d04;
              5'h18: normal_out = 16'h3d04;
              5'h19: normal_out = 16'h3d04;
              5'h1a: normal_out = 16'h3d04;
              5'h1b: normal_out = 16'h3d04;
              5'h1c: normal_out = 16'h3d05;
              5'h1d: normal_out = 16'h3d05;
              5'h1e: normal_out = 16'h3d05;
              5'h1f: normal_out = 16'h3d05;
              default: begin end
            endcase
          end
          5'h0a: begin
            normal_out = 16'h3d06;
            case (mant[4:0])
              5'h05: normal_out = 16'h3d07;
              5'h06: normal_out = 16'h3d07;
              5'h07: normal_out = 16'h3d07;
              5'h08: normal_out = 16'h3d07;
              5'h09: normal_out = 16'h3d07;
              5'h0a: normal_out = 16'h3d08;
              5'h0b: normal_out = 16'h3d08;
              5'h0c: normal_out = 16'h3d08;
              5'h0d: normal_out = 16'h3d08;
              5'h0e: normal_out = 16'h3d09;
              5'h0f: normal_out = 16'h3d09;
              5'h10: normal_out = 16'h3d09;
              5'h11: normal_out = 16'h3d09;
              5'h12: normal_out = 16'h3d09;
              5'h13: normal_out = 16'h3d0a;
              5'h14: normal_out = 16'h3d0a;
              5'h15: normal_out = 16'h3d0a;
              5'h16: normal_out = 16'h3d0a;
              5'h17: normal_out = 16'h3d0b;
              5'h18: normal_out = 16'h3d0b;
              5'h19: normal_out = 16'h3d0b;
              5'h1a: normal_out = 16'h3d0b;
              5'h1b: normal_out = 16'h3d0b;
              5'h1c: normal_out = 16'h3d0c;
              5'h1d: normal_out = 16'h3d0c;
              5'h1e: normal_out = 16'h3d0c;
              5'h1f: normal_out = 16'h3d0c;
              default: begin end
            endcase
          end
          5'h0b: begin
            normal_out = 16'h3d0e;
            case (mant[4:0])
              5'h00: normal_out = 16'h3d0c;
              5'h01: normal_out = 16'h3d0d;
              5'h02: normal_out = 16'h3d0d;
              5'h03: normal_out = 16'h3d0d;
              5'h04: normal_out = 16'h3d0d;
              5'h0a: normal_out = 16'h3d0f;
              5'h0b: normal_out = 16'h3d0f;
              5'h0c: normal_out = 16'h3d0f;
              5'h0d: normal_out = 16'h3d0f;
              5'h0e: normal_out = 16'h3d10;
              5'h0f: normal_out = 16'h3d10;
              5'h10: normal_out = 16'h3d10;
              5'h11: normal_out = 16'h3d10;
              5'h12: normal_out = 16'h3d10;
              5'h13: normal_out = 16'h3d11;
              5'h14: normal_out = 16'h3d11;
              5'h15: normal_out = 16'h3d11;
              5'h16: normal_out = 16'h3d11;
              5'h17: normal_out = 16'h3d12;
              5'h18: normal_out = 16'h3d12;
              5'h19: normal_out = 16'h3d12;
              5'h1a: normal_out = 16'h3d12;
              5'h1b: normal_out = 16'h3d12;
              5'h1c: normal_out = 16'h3d13;
              5'h1d: normal_out = 16'h3d13;
              5'h1e: normal_out = 16'h3d13;
              5'h1f: normal_out = 16'h3d13;
              default: begin end
            endcase
          end
          5'h0c: begin
            normal_out = 16'h3d14;
            case (mant[4:0])
              5'h05: normal_out = 16'h3d15;
              5'h06: normal_out = 16'h3d15;
              5'h07: normal_out = 16'h3d15;
              5'h08: normal_out = 16'h3d15;
              5'h09: normal_out = 16'h3d15;
              5'h0a: normal_out = 16'h3d16;
              5'h0b: normal_out = 16'h3d16;
              5'h0c: normal_out = 16'h3d16;
              5'h0d: normal_out = 16'h3d16;
              5'h0e: normal_out = 16'h3d17;
              5'h0f: normal_out = 16'h3d17;
              5'h10: normal_out = 16'h3d17;
              5'h11: normal_out = 16'h3d17;
              5'h12: normal_out = 16'h3d17;
              5'h13: normal_out = 16'h3d18;
              5'h14: normal_out = 16'h3d18;
              5'h15: normal_out = 16'h3d18;
              5'h16: normal_out = 16'h3d18;
              5'h17: normal_out = 16'h3d19;
              5'h18: normal_out = 16'h3d19;
              5'h19: normal_out = 16'h3d19;
              5'h1a: normal_out = 16'h3d19;
              5'h1b: normal_out = 16'h3d19;
              5'h1c: normal_out = 16'h3d1a;
              5'h1d: normal_out = 16'h3d1a;
              5'h1e: normal_out = 16'h3d1a;
              5'h1f: normal_out = 16'h3d1a;
              default: begin end
            endcase
          end
          5'h0d: begin
            normal_out = 16'h3d1b;
            case (mant[4:0])
              5'h05: normal_out = 16'h3d1c;
              5'h06: normal_out = 16'h3d1c;
              5'h07: normal_out = 16'h3d1c;
              5'h08: normal_out = 16'h3d1c;
              5'h09: normal_out = 16'h3d1d;
              5'h0a: normal_out = 16'h3d1d;
              5'h0b: normal_out = 16'h3d1d;
              5'h0c: normal_out = 16'h3d1d;
              5'h0d: normal_out = 16'h3d1d;
              5'h0e: normal_out = 16'h3d1e;
              5'h0f: normal_out = 16'h3d1e;
              5'h10: normal_out = 16'h3d1e;
              5'h11: normal_out = 16'h3d1e;
              5'h12: normal_out = 16'h3d1f;
              5'h13: normal_out = 16'h3d1f;
              5'h14: normal_out = 16'h3d1f;
              5'h15: normal_out = 16'h3d1f;
              5'h16: normal_out = 16'h3d1f;
              5'h17: normal_out = 16'h3d20;
              5'h18: normal_out = 16'h3d20;
              5'h19: normal_out = 16'h3d20;
              5'h1a: normal_out = 16'h3d20;
              5'h1b: normal_out = 16'h3d21;
              5'h1c: normal_out = 16'h3d21;
              5'h1d: normal_out = 16'h3d21;
              5'h1e: normal_out = 16'h3d21;
              5'h1f: normal_out = 16'h3d21;
              default: begin end
            endcase
          end
          5'h0e: begin
            normal_out = 16'h3d23;
            case (mant[4:0])
              5'h00: normal_out = 16'h3d22;
              5'h01: normal_out = 16'h3d22;
              5'h02: normal_out = 16'h3d22;
              5'h03: normal_out = 16'h3d22;
              5'h09: normal_out = 16'h3d24;
              5'h0a: normal_out = 16'h3d24;
              5'h0b: normal_out = 16'h3d24;
              5'h0c: normal_out = 16'h3d24;
              5'h0d: normal_out = 16'h3d25;
              5'h0e: normal_out = 16'h3d25;
              5'h0f: normal_out = 16'h3d25;
              5'h10: normal_out = 16'h3d25;
              5'h11: normal_out = 16'h3d25;
              5'h12: normal_out = 16'h3d26;
              5'h13: normal_out = 16'h3d26;
              5'h14: normal_out = 16'h3d26;
              5'h15: normal_out = 16'h3d26;
              5'h16: normal_out = 16'h3d27;
              5'h17: normal_out = 16'h3d27;
              5'h18: normal_out = 16'h3d27;
              5'h19: normal_out = 16'h3d27;
              5'h1a: normal_out = 16'h3d27;
              5'h1b: normal_out = 16'h3d28;
              5'h1c: normal_out = 16'h3d28;
              5'h1d: normal_out = 16'h3d28;
              5'h1e: normal_out = 16'h3d28;
              5'h1f: normal_out = 16'h3d29;
              default: begin end
            endcase
          end
          5'h0f: begin
            normal_out = 16'h3d2b;
            case (mant[4:0])
              5'h00: normal_out = 16'h3d29;
              5'h01: normal_out = 16'h3d29;
              5'h02: normal_out = 16'h3d29;
              5'h03: normal_out = 16'h3d29;
              5'h04: normal_out = 16'h3d2a;
              5'h05: normal_out = 16'h3d2a;
              5'h06: normal_out = 16'h3d2a;
              5'h07: normal_out = 16'h3d2a;
              5'h0d: normal_out = 16'h3d2c;
              5'h0e: normal_out = 16'h3d2c;
              5'h0f: normal_out = 16'h3d2c;
              5'h10: normal_out = 16'h3d2c;
              5'h11: normal_out = 16'h3d2d;
              5'h12: normal_out = 16'h3d2d;
              5'h13: normal_out = 16'h3d2d;
              5'h14: normal_out = 16'h3d2d;
              5'h15: normal_out = 16'h3d2d;
              5'h16: normal_out = 16'h3d2e;
              5'h17: normal_out = 16'h3d2e;
              5'h18: normal_out = 16'h3d2e;
              5'h19: normal_out = 16'h3d2e;
              5'h1a: normal_out = 16'h3d2f;
              5'h1b: normal_out = 16'h3d2f;
              5'h1c: normal_out = 16'h3d2f;
              5'h1d: normal_out = 16'h3d2f;
              5'h1e: normal_out = 16'h3d30;
              5'h1f: normal_out = 16'h3d30;
              default: begin end
            endcase
          end
          5'h10: begin
            normal_out = 16'h3d32;
            case (mant[4:0])
              5'h00: normal_out = 16'h3d30;
              5'h01: normal_out = 16'h3d30;
              5'h02: normal_out = 16'h3d30;
              5'h03: normal_out = 16'h3d31;
              5'h04: normal_out = 16'h3d31;
              5'h05: normal_out = 16'h3d31;
              5'h06: normal_out = 16'h3d31;
              5'h0c: normal_out = 16'h3d33;
              5'h0d: normal_out = 16'h3d33;
              5'h0e: normal_out = 16'h3d33;
              5'h0f: normal_out = 16'h3d33;
              5'h10: normal_out = 16'h3d34;
              5'h11: normal_out = 16'h3d34;
              5'h12: normal_out = 16'h3d34;
              5'h13: normal_out = 16'h3d34;
              5'h14: normal_out = 16'h3d34;
              5'h15: normal_out = 16'h3d35;
              5'h16: normal_out = 16'h3d35;
              5'h17: normal_out = 16'h3d35;
              5'h18: normal_out = 16'h3d35;
              5'h19: normal_out = 16'h3d36;
              5'h1a: normal_out = 16'h3d36;
              5'h1b: normal_out = 16'h3d36;
              5'h1c: normal_out = 16'h3d36;
              5'h1d: normal_out = 16'h3d36;
              5'h1e: normal_out = 16'h3d37;
              5'h1f: normal_out = 16'h3d37;
              default: begin end
            endcase
          end
          5'h11: begin
            normal_out = 16'h3d39;
            case (mant[4:0])
              5'h00: normal_out = 16'h3d37;
              5'h01: normal_out = 16'h3d37;
              5'h02: normal_out = 16'h3d38;
              5'h03: normal_out = 16'h3d38;
              5'h04: normal_out = 16'h3d38;
              5'h05: normal_out = 16'h3d38;
              5'h0b: normal_out = 16'h3d3a;
              5'h0c: normal_out = 16'h3d3a;
              5'h0d: normal_out = 16'h3d3a;
              5'h0e: normal_out = 16'h3d3a;
              5'h0f: normal_out = 16'h3d3b;
              5'h10: normal_out = 16'h3d3b;
              5'h11: normal_out = 16'h3d3b;
              5'h12: normal_out = 16'h3d3b;
              5'h13: normal_out = 16'h3d3b;
              5'h14: normal_out = 16'h3d3c;
              5'h15: normal_out = 16'h3d3c;
              5'h16: normal_out = 16'h3d3c;
              5'h17: normal_out = 16'h3d3c;
              5'h18: normal_out = 16'h3d3d;
              5'h19: normal_out = 16'h3d3d;
              5'h1a: normal_out = 16'h3d3d;
              5'h1b: normal_out = 16'h3d3d;
              5'h1c: normal_out = 16'h3d3e;
              5'h1d: normal_out = 16'h3d3e;
              5'h1e: normal_out = 16'h3d3e;
              5'h1f: normal_out = 16'h3d3e;
              default: begin end
            endcase
          end
          5'h12: begin
            normal_out = 16'h3d40;
            case (mant[4:0])
              5'h00: normal_out = 16'h3d3e;
              5'h01: normal_out = 16'h3d3f;
              5'h02: normal_out = 16'h3d3f;
              5'h03: normal_out = 16'h3d3f;
              5'h04: normal_out = 16'h3d3f;
              5'h0a: normal_out = 16'h3d41;
              5'h0b: normal_out = 16'h3d41;
              5'h0c: normal_out = 16'h3d41;
              5'h0d: normal_out = 16'h3d41;
              5'h0e: normal_out = 16'h3d42;
              5'h0f: normal_out = 16'h3d42;
              5'h10: normal_out = 16'h3d42;
              5'h11: normal_out = 16'h3d42;
              5'h12: normal_out = 16'h3d43;
              5'h13: normal_out = 16'h3d43;
              5'h14: normal_out = 16'h3d43;
              5'h15: normal_out = 16'h3d43;
              5'h16: normal_out = 16'h3d43;
              5'h17: normal_out = 16'h3d44;
              5'h18: normal_out = 16'h3d44;
              5'h19: normal_out = 16'h3d44;
              5'h1a: normal_out = 16'h3d44;
              5'h1b: normal_out = 16'h3d45;
              5'h1c: normal_out = 16'h3d45;
              5'h1d: normal_out = 16'h3d45;
              5'h1e: normal_out = 16'h3d45;
              5'h1f: normal_out = 16'h3d45;
              default: begin end
            endcase
          end
          5'h13: begin
            normal_out = 16'h3d48;
            case (mant[4:0])
              5'h00: normal_out = 16'h3d46;
              5'h01: normal_out = 16'h3d46;
              5'h02: normal_out = 16'h3d46;
              5'h03: normal_out = 16'h3d46;
              5'h04: normal_out = 16'h3d47;
              5'h05: normal_out = 16'h3d47;
              5'h06: normal_out = 16'h3d47;
              5'h07: normal_out = 16'h3d47;
              5'h0d: normal_out = 16'h3d49;
              5'h0e: normal_out = 16'h3d49;
              5'h0f: normal_out = 16'h3d49;
              5'h10: normal_out = 16'h3d49;
              5'h11: normal_out = 16'h3d4a;
              5'h12: normal_out = 16'h3d4a;
              5'h13: normal_out = 16'h3d4a;
              5'h14: normal_out = 16'h3d4a;
              5'h15: normal_out = 16'h3d4b;
              5'h16: normal_out = 16'h3d4b;
              5'h17: normal_out = 16'h3d4b;
              5'h18: normal_out = 16'h3d4b;
              5'h19: normal_out = 16'h3d4b;
              5'h1a: normal_out = 16'h3d4c;
              5'h1b: normal_out = 16'h3d4c;
              5'h1c: normal_out = 16'h3d4c;
              5'h1d: normal_out = 16'h3d4c;
              5'h1e: normal_out = 16'h3d4d;
              5'h1f: normal_out = 16'h3d4d;
              default: begin end
            endcase
          end
          5'h14: begin
            normal_out = 16'h3d4e;
            case (mant[4:0])
              5'h00: normal_out = 16'h3d4d;
              5'h01: normal_out = 16'h3d4d;
              5'h07: normal_out = 16'h3d4f;
              5'h08: normal_out = 16'h3d4f;
              5'h09: normal_out = 16'h3d4f;
              5'h0a: normal_out = 16'h3d4f;
              5'h0b: normal_out = 16'h3d50;
              5'h0c: normal_out = 16'h3d50;
              5'h0d: normal_out = 16'h3d50;
              5'h0e: normal_out = 16'h3d50;
              5'h0f: normal_out = 16'h3d50;
              5'h10: normal_out = 16'h3d51;
              5'h11: normal_out = 16'h3d51;
              5'h12: normal_out = 16'h3d51;
              5'h13: normal_out = 16'h3d51;
              5'h14: normal_out = 16'h3d52;
              5'h15: normal_out = 16'h3d52;
              5'h16: normal_out = 16'h3d52;
              5'h17: normal_out = 16'h3d52;
              5'h18: normal_out = 16'h3d53;
              5'h19: normal_out = 16'h3d53;
              5'h1a: normal_out = 16'h3d53;
              5'h1b: normal_out = 16'h3d53;
              5'h1c: normal_out = 16'h3d53;
              5'h1d: normal_out = 16'h3d54;
              5'h1e: normal_out = 16'h3d54;
              5'h1f: normal_out = 16'h3d54;
              default: begin end
            endcase
          end
          5'h15: begin
            normal_out = 16'h3d56;
            case (mant[4:0])
              5'h00: normal_out = 16'h3d54;
              5'h01: normal_out = 16'h3d55;
              5'h02: normal_out = 16'h3d55;
              5'h03: normal_out = 16'h3d55;
              5'h04: normal_out = 16'h3d55;
              5'h0a: normal_out = 16'h3d57;
              5'h0b: normal_out = 16'h3d57;
              5'h0c: normal_out = 16'h3d57;
              5'h0d: normal_out = 16'h3d57;
              5'h0e: normal_out = 16'h3d58;
              5'h0f: normal_out = 16'h3d58;
              5'h10: normal_out = 16'h3d58;
              5'h11: normal_out = 16'h3d58;
              5'h12: normal_out = 16'h3d59;
              5'h13: normal_out = 16'h3d59;
              5'h14: normal_out = 16'h3d59;
              5'h15: normal_out = 16'h3d59;
              5'h16: normal_out = 16'h3d5a;
              5'h17: normal_out = 16'h3d5a;
              5'h18: normal_out = 16'h3d5a;
              5'h19: normal_out = 16'h3d5a;
              5'h1a: normal_out = 16'h3d5a;
              5'h1b: normal_out = 16'h3d5b;
              5'h1c: normal_out = 16'h3d5b;
              5'h1d: normal_out = 16'h3d5b;
              5'h1e: normal_out = 16'h3d5b;
              5'h1f: normal_out = 16'h3d5c;
              default: begin end
            endcase
          end
          5'h16: begin
            normal_out = 16'h3d5d;
            case (mant[4:0])
              5'h00: normal_out = 16'h3d5c;
              5'h01: normal_out = 16'h3d5c;
              5'h02: normal_out = 16'h3d5c;
              5'h08: normal_out = 16'h3d5e;
              5'h09: normal_out = 16'h3d5e;
              5'h0a: normal_out = 16'h3d5e;
              5'h0b: normal_out = 16'h3d5e;
              5'h0c: normal_out = 16'h3d5f;
              5'h0d: normal_out = 16'h3d5f;
              5'h0e: normal_out = 16'h3d5f;
              5'h0f: normal_out = 16'h3d5f;
              5'h10: normal_out = 16'h3d60;
              5'h11: normal_out = 16'h3d60;
              5'h12: normal_out = 16'h3d60;
              5'h13: normal_out = 16'h3d60;
              5'h14: normal_out = 16'h3d60;
              5'h15: normal_out = 16'h3d61;
              5'h16: normal_out = 16'h3d61;
              5'h17: normal_out = 16'h3d61;
              5'h18: normal_out = 16'h3d61;
              5'h19: normal_out = 16'h3d62;
              5'h1a: normal_out = 16'h3d62;
              5'h1b: normal_out = 16'h3d62;
              5'h1c: normal_out = 16'h3d62;
              5'h1d: normal_out = 16'h3d63;
              5'h1e: normal_out = 16'h3d63;
              5'h1f: normal_out = 16'h3d63;
              default: begin end
            endcase
          end
          5'h17: begin
            normal_out = 16'h3d64;
            case (mant[4:0])
              5'h00: normal_out = 16'h3d63;
              5'h06: normal_out = 16'h3d65;
              5'h07: normal_out = 16'h3d65;
              5'h08: normal_out = 16'h3d65;
              5'h09: normal_out = 16'h3d65;
              5'h0a: normal_out = 16'h3d66;
              5'h0b: normal_out = 16'h3d66;
              5'h0c: normal_out = 16'h3d66;
              5'h0d: normal_out = 16'h3d66;
              5'h0e: normal_out = 16'h3d67;
              5'h0f: normal_out = 16'h3d67;
              5'h10: normal_out = 16'h3d67;
              5'h11: normal_out = 16'h3d67;
              5'h12: normal_out = 16'h3d67;
              5'h13: normal_out = 16'h3d68;
              5'h14: normal_out = 16'h3d68;
              5'h15: normal_out = 16'h3d68;
              5'h16: normal_out = 16'h3d68;
              5'h17: normal_out = 16'h3d69;
              5'h18: normal_out = 16'h3d69;
              5'h19: normal_out = 16'h3d69;
              5'h1a: normal_out = 16'h3d69;
              5'h1b: normal_out = 16'h3d6a;
              5'h1c: normal_out = 16'h3d6a;
              5'h1d: normal_out = 16'h3d6a;
              5'h1e: normal_out = 16'h3d6a;
              5'h1f: normal_out = 16'h3d6b;
              default: begin end
            endcase
          end
          5'h18: begin
            normal_out = 16'h3d6f;
            case (mant[4:0])
              5'h00: normal_out = 16'h3d6b;
              5'h01: normal_out = 16'h3d6b;
              5'h02: normal_out = 16'h3d6b;
              5'h03: normal_out = 16'h3d6b;
              5'h04: normal_out = 16'h3d6c;
              5'h05: normal_out = 16'h3d6c;
              5'h06: normal_out = 16'h3d6c;
              5'h07: normal_out = 16'h3d6c;
              5'h08: normal_out = 16'h3d6d;
              5'h09: normal_out = 16'h3d6d;
              5'h0a: normal_out = 16'h3d6d;
              5'h0b: normal_out = 16'h3d6d;
              5'h0c: normal_out = 16'h3d6e;
              5'h0d: normal_out = 16'h3d6e;
              5'h0e: normal_out = 16'h3d6e;
              5'h0f: normal_out = 16'h3d6e;
              5'h15: normal_out = 16'h3d70;
              5'h16: normal_out = 16'h3d70;
              5'h17: normal_out = 16'h3d70;
              5'h18: normal_out = 16'h3d70;
              5'h19: normal_out = 16'h3d71;
              5'h1a: normal_out = 16'h3d71;
              5'h1b: normal_out = 16'h3d71;
              5'h1c: normal_out = 16'h3d71;
              5'h1d: normal_out = 16'h3d72;
              5'h1e: normal_out = 16'h3d72;
              5'h1f: normal_out = 16'h3d72;
              default: begin end
            endcase
          end
          5'h19: begin
            normal_out = 16'h3d73;
            case (mant[4:0])
              5'h00: normal_out = 16'h3d72;
              5'h06: normal_out = 16'h3d74;
              5'h07: normal_out = 16'h3d74;
              5'h08: normal_out = 16'h3d74;
              5'h09: normal_out = 16'h3d74;
              5'h0a: normal_out = 16'h3d75;
              5'h0b: normal_out = 16'h3d75;
              5'h0c: normal_out = 16'h3d75;
              5'h0d: normal_out = 16'h3d75;
              5'h0e: normal_out = 16'h3d76;
              5'h0f: normal_out = 16'h3d76;
              5'h10: normal_out = 16'h3d76;
              5'h11: normal_out = 16'h3d76;
              5'h12: normal_out = 16'h3d77;
              5'h13: normal_out = 16'h3d77;
              5'h14: normal_out = 16'h3d77;
              5'h15: normal_out = 16'h3d77;
              5'h16: normal_out = 16'h3d77;
              5'h17: normal_out = 16'h3d78;
              5'h18: normal_out = 16'h3d78;
              5'h19: normal_out = 16'h3d78;
              5'h1a: normal_out = 16'h3d78;
              5'h1b: normal_out = 16'h3d79;
              5'h1c: normal_out = 16'h3d79;
              5'h1d: normal_out = 16'h3d79;
              5'h1e: normal_out = 16'h3d79;
              5'h1f: normal_out = 16'h3d7a;
              default: begin end
            endcase
          end
          5'h1a: begin
            normal_out = 16'h3d7c;
            case (mant[4:0])
              5'h00: normal_out = 16'h3d7a;
              5'h01: normal_out = 16'h3d7a;
              5'h02: normal_out = 16'h3d7a;
              5'h03: normal_out = 16'h3d7b;
              5'h04: normal_out = 16'h3d7b;
              5'h05: normal_out = 16'h3d7b;
              5'h06: normal_out = 16'h3d7b;
              5'h0c: normal_out = 16'h3d7d;
              5'h0d: normal_out = 16'h3d7d;
              5'h0e: normal_out = 16'h3d7d;
              5'h0f: normal_out = 16'h3d7d;
              5'h10: normal_out = 16'h3d7e;
              5'h11: normal_out = 16'h3d7e;
              5'h12: normal_out = 16'h3d7e;
              5'h13: normal_out = 16'h3d7e;
              5'h14: normal_out = 16'h3d7f;
              5'h15: normal_out = 16'h3d7f;
              5'h16: normal_out = 16'h3d7f;
              5'h17: normal_out = 16'h3d7f;
              5'h18: normal_out = 16'h3d80;
              5'h19: normal_out = 16'h3d80;
              5'h1a: normal_out = 16'h3d80;
              5'h1b: normal_out = 16'h3d80;
              5'h1c: normal_out = 16'h3d81;
              5'h1d: normal_out = 16'h3d81;
              5'h1e: normal_out = 16'h3d81;
              5'h1f: normal_out = 16'h3d81;
              default: begin end
            endcase
          end
          5'h1b: begin
            normal_out = 16'h3d86;
            case (mant[4:0])
              5'h00: normal_out = 16'h3d81;
              5'h01: normal_out = 16'h3d82;
              5'h02: normal_out = 16'h3d82;
              5'h03: normal_out = 16'h3d82;
              5'h04: normal_out = 16'h3d82;
              5'h05: normal_out = 16'h3d83;
              5'h06: normal_out = 16'h3d83;
              5'h07: normal_out = 16'h3d83;
              5'h08: normal_out = 16'h3d83;
              5'h09: normal_out = 16'h3d84;
              5'h0a: normal_out = 16'h3d84;
              5'h0b: normal_out = 16'h3d84;
              5'h0c: normal_out = 16'h3d84;
              5'h0d: normal_out = 16'h3d85;
              5'h0e: normal_out = 16'h3d85;
              5'h0f: normal_out = 16'h3d85;
              5'h10: normal_out = 16'h3d85;
              5'h16: normal_out = 16'h3d87;
              5'h17: normal_out = 16'h3d87;
              5'h18: normal_out = 16'h3d87;
              5'h19: normal_out = 16'h3d87;
              5'h1a: normal_out = 16'h3d88;
              5'h1b: normal_out = 16'h3d88;
              5'h1c: normal_out = 16'h3d88;
              5'h1d: normal_out = 16'h3d88;
              5'h1e: normal_out = 16'h3d89;
              5'h1f: normal_out = 16'h3d89;
              default: begin end
            endcase
          end
          5'h1c: begin
            normal_out = 16'h3d8c;
            case (mant[4:0])
              5'h00: normal_out = 16'h3d89;
              5'h01: normal_out = 16'h3d89;
              5'h02: normal_out = 16'h3d8a;
              5'h03: normal_out = 16'h3d8a;
              5'h04: normal_out = 16'h3d8a;
              5'h05: normal_out = 16'h3d8a;
              5'h06: normal_out = 16'h3d8b;
              5'h07: normal_out = 16'h3d8b;
              5'h08: normal_out = 16'h3d8b;
              5'h09: normal_out = 16'h3d8b;
              5'h0f: normal_out = 16'h3d8d;
              5'h10: normal_out = 16'h3d8d;
              5'h11: normal_out = 16'h3d8d;
              5'h12: normal_out = 16'h3d8d;
              5'h13: normal_out = 16'h3d8e;
              5'h14: normal_out = 16'h3d8e;
              5'h15: normal_out = 16'h3d8e;
              5'h16: normal_out = 16'h3d8e;
              5'h17: normal_out = 16'h3d8f;
              5'h18: normal_out = 16'h3d8f;
              5'h19: normal_out = 16'h3d8f;
              5'h1a: normal_out = 16'h3d8f;
              5'h1b: normal_out = 16'h3d90;
              5'h1c: normal_out = 16'h3d90;
              5'h1d: normal_out = 16'h3d90;
              5'h1e: normal_out = 16'h3d90;
              5'h1f: normal_out = 16'h3d91;
              default: begin end
            endcase
          end
          5'h1d: begin
            normal_out = 16'h3d93;
            case (mant[4:0])
              5'h00: normal_out = 16'h3d91;
              5'h01: normal_out = 16'h3d91;
              5'h02: normal_out = 16'h3d91;
              5'h03: normal_out = 16'h3d92;
              5'h04: normal_out = 16'h3d92;
              5'h05: normal_out = 16'h3d92;
              5'h06: normal_out = 16'h3d92;
              5'h0c: normal_out = 16'h3d94;
              5'h0d: normal_out = 16'h3d94;
              5'h0e: normal_out = 16'h3d94;
              5'h0f: normal_out = 16'h3d94;
              5'h10: normal_out = 16'h3d95;
              5'h11: normal_out = 16'h3d95;
              5'h12: normal_out = 16'h3d95;
              5'h13: normal_out = 16'h3d95;
              5'h14: normal_out = 16'h3d96;
              5'h15: normal_out = 16'h3d96;
              5'h16: normal_out = 16'h3d96;
              5'h17: normal_out = 16'h3d96;
              5'h18: normal_out = 16'h3d97;
              5'h19: normal_out = 16'h3d97;
              5'h1a: normal_out = 16'h3d97;
              5'h1b: normal_out = 16'h3d97;
              5'h1c: normal_out = 16'h3d98;
              5'h1d: normal_out = 16'h3d98;
              5'h1e: normal_out = 16'h3d98;
              5'h1f: normal_out = 16'h3d98;
              default: begin end
            endcase
          end
          5'h1e: begin
            normal_out = 16'h3d9a;
            case (mant[4:0])
              5'h00: normal_out = 16'h3d99;
              5'h01: normal_out = 16'h3d99;
              5'h02: normal_out = 16'h3d99;
              5'h03: normal_out = 16'h3d99;
              5'h09: normal_out = 16'h3d9b;
              5'h0a: normal_out = 16'h3d9b;
              5'h0b: normal_out = 16'h3d9b;
              5'h0c: normal_out = 16'h3d9b;
              5'h0d: normal_out = 16'h3d9c;
              5'h0e: normal_out = 16'h3d9c;
              5'h0f: normal_out = 16'h3d9c;
              5'h10: normal_out = 16'h3d9c;
              5'h11: normal_out = 16'h3d9d;
              5'h12: normal_out = 16'h3d9d;
              5'h13: normal_out = 16'h3d9d;
              5'h14: normal_out = 16'h3d9d;
              5'h15: normal_out = 16'h3d9e;
              5'h16: normal_out = 16'h3d9e;
              5'h17: normal_out = 16'h3d9e;
              5'h18: normal_out = 16'h3d9e;
              5'h19: normal_out = 16'h3d9f;
              5'h1a: normal_out = 16'h3d9f;
              5'h1b: normal_out = 16'h3d9f;
              5'h1c: normal_out = 16'h3d9f;
              5'h1d: normal_out = 16'h3da0;
              5'h1e: normal_out = 16'h3da0;
              5'h1f: normal_out = 16'h3da0;
              default: begin end
            endcase
          end
          5'h1f: begin
            normal_out = 16'h3da4;
            case (mant[4:0])
              5'h00: normal_out = 16'h3da0;
              5'h01: normal_out = 16'h3da1;
              5'h02: normal_out = 16'h3da1;
              5'h03: normal_out = 16'h3da1;
              5'h04: normal_out = 16'h3da1;
              5'h05: normal_out = 16'h3da2;
              5'h06: normal_out = 16'h3da2;
              5'h07: normal_out = 16'h3da2;
              5'h08: normal_out = 16'h3da2;
              5'h09: normal_out = 16'h3da3;
              5'h0a: normal_out = 16'h3da3;
              5'h0b: normal_out = 16'h3da3;
              5'h0c: normal_out = 16'h3da3;
              5'h12: normal_out = 16'h3da5;
              5'h13: normal_out = 16'h3da5;
              5'h14: normal_out = 16'h3da5;
              5'h15: normal_out = 16'h3da5;
              5'h16: normal_out = 16'h3da6;
              5'h17: normal_out = 16'h3da6;
              5'h18: normal_out = 16'h3da6;
              5'h19: normal_out = 16'h3da6;
              5'h1a: normal_out = 16'h3da7;
              5'h1b: normal_out = 16'h3da7;
              5'h1c: normal_out = 16'h3da7;
              5'h1d: normal_out = 16'h3da7;
              5'h1e: normal_out = 16'h3da8;
              5'h1f: normal_out = 16'h3da8;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      6'h0e: begin
        case (mant[9:5])
          5'h00: begin
            normal_out = 16'h3db1;
            case (mant[4:0])
              5'h00: normal_out = 16'h3da8;
              5'h01: normal_out = 16'h3da9;
              5'h02: normal_out = 16'h3da9;
              5'h03: normal_out = 16'h3daa;
              5'h04: normal_out = 16'h3daa;
              5'h05: normal_out = 16'h3dab;
              5'h06: normal_out = 16'h3dab;
              5'h07: normal_out = 16'h3dac;
              5'h08: normal_out = 16'h3dac;
              5'h09: normal_out = 16'h3dad;
              5'h0a: normal_out = 16'h3dad;
              5'h0b: normal_out = 16'h3dae;
              5'h0c: normal_out = 16'h3dae;
              5'h0d: normal_out = 16'h3daf;
              5'h0e: normal_out = 16'h3daf;
              5'h0f: normal_out = 16'h3db0;
              5'h10: normal_out = 16'h3db0;
              5'h14: normal_out = 16'h3db2;
              5'h15: normal_out = 16'h3db2;
              5'h16: normal_out = 16'h3db3;
              5'h17: normal_out = 16'h3db3;
              5'h18: normal_out = 16'h3db4;
              5'h19: normal_out = 16'h3db4;
              5'h1a: normal_out = 16'h3db5;
              5'h1b: normal_out = 16'h3db5;
              5'h1c: normal_out = 16'h3db6;
              5'h1d: normal_out = 16'h3db6;
              5'h1e: normal_out = 16'h3db7;
              5'h1f: normal_out = 16'h3db7;
              default: begin end
            endcase
          end
          5'h01: begin
            normal_out = 16'h3db8;
            case (mant[4:0])
              5'h02: normal_out = 16'h3db9;
              5'h03: normal_out = 16'h3db9;
              5'h04: normal_out = 16'h3dba;
              5'h05: normal_out = 16'h3dba;
              5'h06: normal_out = 16'h3dbb;
              5'h07: normal_out = 16'h3dbb;
              5'h08: normal_out = 16'h3dbc;
              5'h09: normal_out = 16'h3dbc;
              5'h0a: normal_out = 16'h3dbd;
              5'h0b: normal_out = 16'h3dbd;
              5'h0c: normal_out = 16'h3dbe;
              5'h0d: normal_out = 16'h3dbe;
              5'h0e: normal_out = 16'h3dbf;
              5'h0f: normal_out = 16'h3dbf;
              5'h10: normal_out = 16'h3dc0;
              5'h11: normal_out = 16'h3dc0;
              5'h12: normal_out = 16'h3dc1;
              5'h13: normal_out = 16'h3dc1;
              5'h14: normal_out = 16'h3dc2;
              5'h15: normal_out = 16'h3dc2;
              5'h16: normal_out = 16'h3dc3;
              5'h17: normal_out = 16'h3dc3;
              5'h18: normal_out = 16'h3dc4;
              5'h19: normal_out = 16'h3dc4;
              5'h1a: normal_out = 16'h3dc5;
              5'h1b: normal_out = 16'h3dc5;
              5'h1c: normal_out = 16'h3dc6;
              5'h1d: normal_out = 16'h3dc6;
              5'h1e: normal_out = 16'h3dc7;
              5'h1f: normal_out = 16'h3dc7;
              default: begin end
            endcase
          end
          5'h02: begin
            normal_out = 16'h3dc8;
            case (mant[4:0])
              5'h02: normal_out = 16'h3dc9;
              5'h03: normal_out = 16'h3dc9;
              5'h04: normal_out = 16'h3dca;
              5'h05: normal_out = 16'h3dca;
              5'h06: normal_out = 16'h3dcb;
              5'h07: normal_out = 16'h3dcb;
              5'h08: normal_out = 16'h3dcc;
              5'h09: normal_out = 16'h3dcc;
              5'h0a: normal_out = 16'h3dcd;
              5'h0b: normal_out = 16'h3dcd;
              5'h0c: normal_out = 16'h3dce;
              5'h0d: normal_out = 16'h3dce;
              5'h0e: normal_out = 16'h3dcf;
              5'h0f: normal_out = 16'h3dcf;
              5'h10: normal_out = 16'h3dd0;
              5'h11: normal_out = 16'h3dd0;
              5'h12: normal_out = 16'h3dd1;
              5'h13: normal_out = 16'h3dd1;
              5'h14: normal_out = 16'h3dd2;
              5'h15: normal_out = 16'h3dd2;
              5'h16: normal_out = 16'h3dd3;
              5'h17: normal_out = 16'h3dd3;
              5'h18: normal_out = 16'h3dd4;
              5'h19: normal_out = 16'h3dd4;
              5'h1a: normal_out = 16'h3dd5;
              5'h1b: normal_out = 16'h3dd5;
              5'h1c: normal_out = 16'h3dd6;
              5'h1d: normal_out = 16'h3dd6;
              5'h1e: normal_out = 16'h3dd7;
              5'h1f: normal_out = 16'h3dd7;
              default: begin end
            endcase
          end
          5'h03: begin
            normal_out = 16'h3dd8;
            case (mant[4:0])
              5'h02: normal_out = 16'h3dd9;
              5'h03: normal_out = 16'h3dd9;
              5'h04: normal_out = 16'h3dda;
              5'h05: normal_out = 16'h3ddb;
              5'h06: normal_out = 16'h3ddb;
              5'h07: normal_out = 16'h3ddc;
              5'h08: normal_out = 16'h3ddc;
              5'h09: normal_out = 16'h3ddd;
              5'h0a: normal_out = 16'h3ddd;
              5'h0b: normal_out = 16'h3dde;
              5'h0c: normal_out = 16'h3dde;
              5'h0d: normal_out = 16'h3ddf;
              5'h0e: normal_out = 16'h3ddf;
              5'h0f: normal_out = 16'h3de0;
              5'h10: normal_out = 16'h3de0;
              5'h11: normal_out = 16'h3de1;
              5'h12: normal_out = 16'h3de1;
              5'h13: normal_out = 16'h3de2;
              5'h14: normal_out = 16'h3de2;
              5'h15: normal_out = 16'h3de3;
              5'h16: normal_out = 16'h3de3;
              5'h17: normal_out = 16'h3de4;
              5'h18: normal_out = 16'h3de4;
              5'h19: normal_out = 16'h3de5;
              5'h1a: normal_out = 16'h3de5;
              5'h1b: normal_out = 16'h3de6;
              5'h1c: normal_out = 16'h3de6;
              5'h1d: normal_out = 16'h3de7;
              5'h1e: normal_out = 16'h3de7;
              5'h1f: normal_out = 16'h3de8;
              default: begin end
            endcase
          end
          5'h04: begin
            normal_out = 16'h3de9;
            case (mant[4:0])
              5'h00: normal_out = 16'h3de8;
              5'h03: normal_out = 16'h3dea;
              5'h04: normal_out = 16'h3dea;
              5'h05: normal_out = 16'h3deb;
              5'h06: normal_out = 16'h3deb;
              5'h07: normal_out = 16'h3dec;
              5'h08: normal_out = 16'h3dec;
              5'h09: normal_out = 16'h3ded;
              5'h0a: normal_out = 16'h3ded;
              5'h0b: normal_out = 16'h3dee;
              5'h0c: normal_out = 16'h3dee;
              5'h0d: normal_out = 16'h3def;
              5'h0e: normal_out = 16'h3def;
              5'h0f: normal_out = 16'h3df0;
              5'h10: normal_out = 16'h3df0;
              5'h11: normal_out = 16'h3df1;
              5'h12: normal_out = 16'h3df2;
              5'h13: normal_out = 16'h3df2;
              5'h14: normal_out = 16'h3df3;
              5'h15: normal_out = 16'h3df3;
              5'h16: normal_out = 16'h3df4;
              5'h17: normal_out = 16'h3df4;
              5'h18: normal_out = 16'h3df5;
              5'h19: normal_out = 16'h3df5;
              5'h1a: normal_out = 16'h3df6;
              5'h1b: normal_out = 16'h3df6;
              5'h1c: normal_out = 16'h3df7;
              5'h1d: normal_out = 16'h3df7;
              5'h1e: normal_out = 16'h3df8;
              5'h1f: normal_out = 16'h3df8;
              default: begin end
            endcase
          end
          5'h05: begin
            normal_out = 16'h3df9;
            case (mant[4:0])
              5'h02: normal_out = 16'h3dfa;
              5'h03: normal_out = 16'h3dfa;
              5'h04: normal_out = 16'h3dfb;
              5'h05: normal_out = 16'h3dfb;
              5'h06: normal_out = 16'h3dfc;
              5'h07: normal_out = 16'h3dfc;
              5'h08: normal_out = 16'h3dfd;
              5'h09: normal_out = 16'h3dfd;
              5'h0a: normal_out = 16'h3dfe;
              5'h0b: normal_out = 16'h3dfe;
              5'h0c: normal_out = 16'h3dff;
              5'h0d: normal_out = 16'h3dff;
              5'h0e: normal_out = 16'h3e00;
              5'h0f: normal_out = 16'h3e01;
              5'h10: normal_out = 16'h3e01;
              5'h11: normal_out = 16'h3e02;
              5'h12: normal_out = 16'h3e02;
              5'h13: normal_out = 16'h3e03;
              5'h14: normal_out = 16'h3e03;
              5'h15: normal_out = 16'h3e04;
              5'h16: normal_out = 16'h3e04;
              5'h17: normal_out = 16'h3e05;
              5'h18: normal_out = 16'h3e05;
              5'h19: normal_out = 16'h3e06;
              5'h1a: normal_out = 16'h3e06;
              5'h1b: normal_out = 16'h3e07;
              5'h1c: normal_out = 16'h3e07;
              5'h1d: normal_out = 16'h3e08;
              5'h1e: normal_out = 16'h3e08;
              5'h1f: normal_out = 16'h3e09;
              default: begin end
            endcase
          end
          5'h06: begin
            normal_out = 16'h3e0a;
            case (mant[4:0])
              5'h00: normal_out = 16'h3e09;
              5'h03: normal_out = 16'h3e0b;
              5'h04: normal_out = 16'h3e0b;
              5'h05: normal_out = 16'h3e0c;
              5'h06: normal_out = 16'h3e0d;
              5'h07: normal_out = 16'h3e0d;
              5'h08: normal_out = 16'h3e0e;
              5'h09: normal_out = 16'h3e0e;
              5'h0a: normal_out = 16'h3e0f;
              5'h0b: normal_out = 16'h3e0f;
              5'h0c: normal_out = 16'h3e10;
              5'h0d: normal_out = 16'h3e10;
              5'h0e: normal_out = 16'h3e11;
              5'h0f: normal_out = 16'h3e11;
              5'h10: normal_out = 16'h3e12;
              5'h11: normal_out = 16'h3e12;
              5'h12: normal_out = 16'h3e13;
              5'h13: normal_out = 16'h3e13;
              5'h14: normal_out = 16'h3e14;
              5'h15: normal_out = 16'h3e14;
              5'h16: normal_out = 16'h3e15;
              5'h17: normal_out = 16'h3e15;
              5'h18: normal_out = 16'h3e16;
              5'h19: normal_out = 16'h3e17;
              5'h1a: normal_out = 16'h3e17;
              5'h1b: normal_out = 16'h3e18;
              5'h1c: normal_out = 16'h3e18;
              5'h1d: normal_out = 16'h3e19;
              5'h1e: normal_out = 16'h3e19;
              5'h1f: normal_out = 16'h3e1a;
              default: begin end
            endcase
          end
          5'h07: begin
            normal_out = 16'h3e1b;
            case (mant[4:0])
              5'h00: normal_out = 16'h3e1a;
              5'h03: normal_out = 16'h3e1c;
              5'h04: normal_out = 16'h3e1c;
              5'h05: normal_out = 16'h3e1d;
              5'h06: normal_out = 16'h3e1d;
              5'h07: normal_out = 16'h3e1e;
              5'h08: normal_out = 16'h3e1e;
              5'h09: normal_out = 16'h3e1f;
              5'h0a: normal_out = 16'h3e20;
              5'h0b: normal_out = 16'h3e20;
              5'h0c: normal_out = 16'h3e21;
              5'h0d: normal_out = 16'h3e21;
              5'h0e: normal_out = 16'h3e22;
              5'h0f: normal_out = 16'h3e22;
              5'h10: normal_out = 16'h3e23;
              5'h11: normal_out = 16'h3e23;
              5'h12: normal_out = 16'h3e24;
              5'h13: normal_out = 16'h3e24;
              5'h14: normal_out = 16'h3e25;
              5'h15: normal_out = 16'h3e25;
              5'h16: normal_out = 16'h3e26;
              5'h17: normal_out = 16'h3e26;
              5'h18: normal_out = 16'h3e27;
              5'h19: normal_out = 16'h3e27;
              5'h1a: normal_out = 16'h3e28;
              5'h1b: normal_out = 16'h3e29;
              5'h1c: normal_out = 16'h3e29;
              5'h1d: normal_out = 16'h3e2a;
              5'h1e: normal_out = 16'h3e2a;
              5'h1f: normal_out = 16'h3e2b;
              default: begin end
            endcase
          end
          5'h08: begin
            normal_out = 16'h3e2c;
            case (mant[4:0])
              5'h00: normal_out = 16'h3e2b;
              5'h03: normal_out = 16'h3e2d;
              5'h04: normal_out = 16'h3e2d;
              5'h05: normal_out = 16'h3e2e;
              5'h06: normal_out = 16'h3e2e;
              5'h07: normal_out = 16'h3e2f;
              5'h08: normal_out = 16'h3e30;
              5'h09: normal_out = 16'h3e30;
              5'h0a: normal_out = 16'h3e31;
              5'h0b: normal_out = 16'h3e31;
              5'h0c: normal_out = 16'h3e32;
              5'h0d: normal_out = 16'h3e32;
              5'h0e: normal_out = 16'h3e33;
              5'h0f: normal_out = 16'h3e33;
              5'h10: normal_out = 16'h3e34;
              5'h11: normal_out = 16'h3e34;
              5'h12: normal_out = 16'h3e35;
              5'h13: normal_out = 16'h3e35;
              5'h14: normal_out = 16'h3e36;
              5'h15: normal_out = 16'h3e36;
              5'h16: normal_out = 16'h3e37;
              5'h17: normal_out = 16'h3e38;
              5'h18: normal_out = 16'h3e38;
              5'h19: normal_out = 16'h3e39;
              5'h1a: normal_out = 16'h3e39;
              5'h1b: normal_out = 16'h3e3a;
              5'h1c: normal_out = 16'h3e3a;
              5'h1d: normal_out = 16'h3e3b;
              5'h1e: normal_out = 16'h3e3b;
              5'h1f: normal_out = 16'h3e3c;
              default: begin end
            endcase
          end
          5'h09: begin
            normal_out = 16'h3e3e;
            case (mant[4:0])
              5'h00: normal_out = 16'h3e3c;
              5'h01: normal_out = 16'h3e3d;
              5'h04: normal_out = 16'h3e3f;
              5'h05: normal_out = 16'h3e3f;
              5'h06: normal_out = 16'h3e40;
              5'h07: normal_out = 16'h3e40;
              5'h08: normal_out = 16'h3e41;
              5'h09: normal_out = 16'h3e41;
              5'h0a: normal_out = 16'h3e42;
              5'h0b: normal_out = 16'h3e42;
              5'h0c: normal_out = 16'h3e43;
              5'h0d: normal_out = 16'h3e43;
              5'h0e: normal_out = 16'h3e44;
              5'h0f: normal_out = 16'h3e45;
              5'h10: normal_out = 16'h3e45;
              5'h11: normal_out = 16'h3e46;
              5'h12: normal_out = 16'h3e46;
              5'h13: normal_out = 16'h3e47;
              5'h14: normal_out = 16'h3e47;
              5'h15: normal_out = 16'h3e48;
              5'h16: normal_out = 16'h3e48;
              5'h17: normal_out = 16'h3e49;
              5'h18: normal_out = 16'h3e49;
              5'h19: normal_out = 16'h3e4a;
              5'h1a: normal_out = 16'h3e4b;
              5'h1b: normal_out = 16'h3e4b;
              5'h1c: normal_out = 16'h3e4c;
              5'h1d: normal_out = 16'h3e4c;
              5'h1e: normal_out = 16'h3e4d;
              5'h1f: normal_out = 16'h3e4d;
              default: begin end
            endcase
          end
          5'h0a: begin
            normal_out = 16'h3e4e;
            case (mant[4:0])
              5'h02: normal_out = 16'h3e4f;
              5'h03: normal_out = 16'h3e4f;
              5'h04: normal_out = 16'h3e50;
              5'h05: normal_out = 16'h3e51;
              5'h06: normal_out = 16'h3e51;
              5'h07: normal_out = 16'h3e52;
              5'h08: normal_out = 16'h3e52;
              5'h09: normal_out = 16'h3e53;
              5'h0a: normal_out = 16'h3e53;
              5'h0b: normal_out = 16'h3e54;
              5'h0c: normal_out = 16'h3e54;
              5'h0d: normal_out = 16'h3e55;
              5'h0e: normal_out = 16'h3e55;
              5'h0f: normal_out = 16'h3e56;
              5'h10: normal_out = 16'h3e57;
              5'h11: normal_out = 16'h3e57;
              5'h12: normal_out = 16'h3e58;
              5'h13: normal_out = 16'h3e58;
              5'h14: normal_out = 16'h3e59;
              5'h15: normal_out = 16'h3e59;
              5'h16: normal_out = 16'h3e5a;
              5'h17: normal_out = 16'h3e5a;
              5'h18: normal_out = 16'h3e5b;
              5'h19: normal_out = 16'h3e5c;
              5'h1a: normal_out = 16'h3e5c;
              5'h1b: normal_out = 16'h3e5d;
              5'h1c: normal_out = 16'h3e5d;
              5'h1d: normal_out = 16'h3e5e;
              5'h1e: normal_out = 16'h3e5e;
              5'h1f: normal_out = 16'h3e5f;
              default: begin end
            endcase
          end
          5'h0b: begin
            normal_out = 16'h3e60;
            case (mant[4:0])
              5'h00: normal_out = 16'h3e5f;
              5'h03: normal_out = 16'h3e61;
              5'h04: normal_out = 16'h3e62;
              5'h05: normal_out = 16'h3e62;
              5'h06: normal_out = 16'h3e63;
              5'h07: normal_out = 16'h3e63;
              5'h08: normal_out = 16'h3e64;
              5'h09: normal_out = 16'h3e64;
              5'h0a: normal_out = 16'h3e65;
              5'h0b: normal_out = 16'h3e65;
              5'h0c: normal_out = 16'h3e66;
              5'h0d: normal_out = 16'h3e67;
              5'h0e: normal_out = 16'h3e67;
              5'h0f: normal_out = 16'h3e68;
              5'h10: normal_out = 16'h3e68;
              5'h11: normal_out = 16'h3e69;
              5'h12: normal_out = 16'h3e69;
              5'h13: normal_out = 16'h3e6a;
              5'h14: normal_out = 16'h3e6a;
              5'h15: normal_out = 16'h3e6b;
              5'h16: normal_out = 16'h3e6c;
              5'h17: normal_out = 16'h3e6c;
              5'h18: normal_out = 16'h3e6d;
              5'h19: normal_out = 16'h3e6d;
              5'h1a: normal_out = 16'h3e6e;
              5'h1b: normal_out = 16'h3e6e;
              5'h1c: normal_out = 16'h3e6f;
              5'h1d: normal_out = 16'h3e6f;
              5'h1e: normal_out = 16'h3e70;
              5'h1f: normal_out = 16'h3e71;
              default: begin end
            endcase
          end
          5'h0c: begin
            normal_out = 16'h3e72;
            case (mant[4:0])
              5'h00: normal_out = 16'h3e71;
              5'h03: normal_out = 16'h3e73;
              5'h04: normal_out = 16'h3e73;
              5'h05: normal_out = 16'h3e74;
              5'h06: normal_out = 16'h3e74;
              5'h07: normal_out = 16'h3e75;
              5'h08: normal_out = 16'h3e76;
              5'h09: normal_out = 16'h3e76;
              5'h0a: normal_out = 16'h3e77;
              5'h0b: normal_out = 16'h3e77;
              5'h0c: normal_out = 16'h3e78;
              5'h0d: normal_out = 16'h3e78;
              5'h0e: normal_out = 16'h3e79;
              5'h0f: normal_out = 16'h3e7a;
              5'h10: normal_out = 16'h3e7a;
              5'h11: normal_out = 16'h3e7b;
              5'h12: normal_out = 16'h3e7b;
              5'h13: normal_out = 16'h3e7c;
              5'h14: normal_out = 16'h3e7c;
              5'h15: normal_out = 16'h3e7d;
              5'h16: normal_out = 16'h3e7d;
              5'h17: normal_out = 16'h3e7e;
              5'h18: normal_out = 16'h3e7f;
              5'h19: normal_out = 16'h3e7f;
              5'h1a: normal_out = 16'h3e80;
              5'h1b: normal_out = 16'h3e80;
              5'h1c: normal_out = 16'h3e81;
              5'h1d: normal_out = 16'h3e81;
              5'h1e: normal_out = 16'h3e82;
              5'h1f: normal_out = 16'h3e83;
              default: begin end
            endcase
          end
          5'h0d: begin
            normal_out = 16'h3e84;
            case (mant[4:0])
              5'h00: normal_out = 16'h3e83;
              5'h03: normal_out = 16'h3e85;
              5'h04: normal_out = 16'h3e85;
              5'h05: normal_out = 16'h3e86;
              5'h06: normal_out = 16'h3e86;
              5'h07: normal_out = 16'h3e87;
              5'h08: normal_out = 16'h3e88;
              5'h09: normal_out = 16'h3e88;
              5'h0a: normal_out = 16'h3e89;
              5'h0b: normal_out = 16'h3e89;
              5'h0c: normal_out = 16'h3e8a;
              5'h0d: normal_out = 16'h3e8a;
              5'h0e: normal_out = 16'h3e8b;
              5'h0f: normal_out = 16'h3e8c;
              5'h10: normal_out = 16'h3e8c;
              5'h11: normal_out = 16'h3e8d;
              5'h12: normal_out = 16'h3e8d;
              5'h13: normal_out = 16'h3e8e;
              5'h14: normal_out = 16'h3e8e;
              5'h15: normal_out = 16'h3e8f;
              5'h16: normal_out = 16'h3e90;
              5'h17: normal_out = 16'h3e90;
              5'h18: normal_out = 16'h3e91;
              5'h19: normal_out = 16'h3e91;
              5'h1a: normal_out = 16'h3e92;
              5'h1b: normal_out = 16'h3e92;
              5'h1c: normal_out = 16'h3e93;
              5'h1d: normal_out = 16'h3e94;
              5'h1e: normal_out = 16'h3e94;
              5'h1f: normal_out = 16'h3e95;
              default: begin end
            endcase
          end
          5'h0e: begin
            normal_out = 16'h3e96;
            case (mant[4:0])
              5'h00: normal_out = 16'h3e95;
              5'h03: normal_out = 16'h3e97;
              5'h04: normal_out = 16'h3e98;
              5'h05: normal_out = 16'h3e98;
              5'h06: normal_out = 16'h3e99;
              5'h07: normal_out = 16'h3e99;
              5'h08: normal_out = 16'h3e9a;
              5'h09: normal_out = 16'h3e9a;
              5'h0a: normal_out = 16'h3e9b;
              5'h0b: normal_out = 16'h3e9c;
              5'h0c: normal_out = 16'h3e9c;
              5'h0d: normal_out = 16'h3e9d;
              5'h0e: normal_out = 16'h3e9d;
              5'h0f: normal_out = 16'h3e9e;
              5'h10: normal_out = 16'h3e9e;
              5'h11: normal_out = 16'h3e9f;
              5'h12: normal_out = 16'h3ea0;
              5'h13: normal_out = 16'h3ea0;
              5'h14: normal_out = 16'h3ea1;
              5'h15: normal_out = 16'h3ea1;
              5'h16: normal_out = 16'h3ea2;
              5'h17: normal_out = 16'h3ea2;
              5'h18: normal_out = 16'h3ea3;
              5'h19: normal_out = 16'h3ea4;
              5'h1a: normal_out = 16'h3ea4;
              5'h1b: normal_out = 16'h3ea5;
              5'h1c: normal_out = 16'h3ea5;
              5'h1d: normal_out = 16'h3ea6;
              5'h1e: normal_out = 16'h3ea6;
              5'h1f: normal_out = 16'h3ea7;
              default: begin end
            endcase
          end
          5'h0f: begin
            normal_out = 16'h3ea8;
            case (mant[4:0])
              5'h02: normal_out = 16'h3ea9;
              5'h03: normal_out = 16'h3ea9;
              5'h04: normal_out = 16'h3eaa;
              5'h05: normal_out = 16'h3eaa;
              5'h06: normal_out = 16'h3eab;
              5'h07: normal_out = 16'h3eac;
              5'h08: normal_out = 16'h3eac;
              5'h09: normal_out = 16'h3ead;
              5'h0a: normal_out = 16'h3ead;
              5'h0b: normal_out = 16'h3eae;
              5'h0c: normal_out = 16'h3eaf;
              5'h0d: normal_out = 16'h3eaf;
              5'h0e: normal_out = 16'h3eb0;
              5'h0f: normal_out = 16'h3eb0;
              5'h10: normal_out = 16'h3eb1;
              5'h11: normal_out = 16'h3eb1;
              5'h12: normal_out = 16'h3eb2;
              5'h13: normal_out = 16'h3eb3;
              5'h14: normal_out = 16'h3eb3;
              5'h15: normal_out = 16'h3eb4;
              5'h16: normal_out = 16'h3eb4;
              5'h17: normal_out = 16'h3eb5;
              5'h18: normal_out = 16'h3eb5;
              5'h19: normal_out = 16'h3eb6;
              5'h1a: normal_out = 16'h3eb7;
              5'h1b: normal_out = 16'h3eb7;
              5'h1c: normal_out = 16'h3eb8;
              5'h1d: normal_out = 16'h3eb8;
              5'h1e: normal_out = 16'h3eb9;
              5'h1f: normal_out = 16'h3eba;
              default: begin end
            endcase
          end
          5'h10: begin
            normal_out = 16'h3ebb;
            case (mant[4:0])
              5'h00: normal_out = 16'h3eba;
              5'h03: normal_out = 16'h3ebc;
              5'h04: normal_out = 16'h3ebc;
              5'h05: normal_out = 16'h3ebd;
              5'h06: normal_out = 16'h3ebe;
              5'h07: normal_out = 16'h3ebe;
              5'h08: normal_out = 16'h3ebf;
              5'h09: normal_out = 16'h3ebf;
              5'h0a: normal_out = 16'h3ec0;
              5'h0b: normal_out = 16'h3ec1;
              5'h0c: normal_out = 16'h3ec1;
              5'h0d: normal_out = 16'h3ec2;
              5'h0e: normal_out = 16'h3ec2;
              5'h0f: normal_out = 16'h3ec3;
              5'h10: normal_out = 16'h3ec4;
              5'h11: normal_out = 16'h3ec4;
              5'h12: normal_out = 16'h3ec5;
              5'h13: normal_out = 16'h3ec5;
              5'h14: normal_out = 16'h3ec6;
              5'h15: normal_out = 16'h3ec6;
              5'h16: normal_out = 16'h3ec7;
              5'h17: normal_out = 16'h3ec8;
              5'h18: normal_out = 16'h3ec8;
              5'h19: normal_out = 16'h3ec9;
              5'h1a: normal_out = 16'h3ec9;
              5'h1b: normal_out = 16'h3eca;
              5'h1c: normal_out = 16'h3ecb;
              5'h1d: normal_out = 16'h3ecb;
              5'h1e: normal_out = 16'h3ecc;
              5'h1f: normal_out = 16'h3ecc;
              default: begin end
            endcase
          end
          5'h11: begin
            normal_out = 16'h3ecd;
            case (mant[4:0])
              5'h02: normal_out = 16'h3ece;
              5'h03: normal_out = 16'h3ecf;
              5'h04: normal_out = 16'h3ecf;
              5'h05: normal_out = 16'h3ed0;
              5'h06: normal_out = 16'h3ed0;
              5'h07: normal_out = 16'h3ed1;
              5'h08: normal_out = 16'h3ed2;
              5'h09: normal_out = 16'h3ed2;
              5'h0a: normal_out = 16'h3ed3;
              5'h0b: normal_out = 16'h3ed3;
              5'h0c: normal_out = 16'h3ed4;
              5'h0d: normal_out = 16'h3ed5;
              5'h0e: normal_out = 16'h3ed5;
              5'h0f: normal_out = 16'h3ed6;
              5'h10: normal_out = 16'h3ed6;
              5'h11: normal_out = 16'h3ed7;
              5'h12: normal_out = 16'h3ed8;
              5'h13: normal_out = 16'h3ed8;
              5'h14: normal_out = 16'h3ed9;
              5'h15: normal_out = 16'h3ed9;
              5'h16: normal_out = 16'h3eda;
              5'h17: normal_out = 16'h3edb;
              5'h18: normal_out = 16'h3edb;
              5'h19: normal_out = 16'h3edc;
              5'h1a: normal_out = 16'h3edc;
              5'h1b: normal_out = 16'h3edd;
              5'h1c: normal_out = 16'h3edd;
              5'h1d: normal_out = 16'h3ede;
              5'h1e: normal_out = 16'h3edf;
              5'h1f: normal_out = 16'h3edf;
              default: begin end
            endcase
          end
          5'h12: begin
            normal_out = 16'h3ee0;
            case (mant[4:0])
              5'h02: normal_out = 16'h3ee1;
              5'h03: normal_out = 16'h3ee2;
              5'h04: normal_out = 16'h3ee2;
              5'h05: normal_out = 16'h3ee3;
              5'h06: normal_out = 16'h3ee3;
              5'h07: normal_out = 16'h3ee4;
              5'h08: normal_out = 16'h3ee5;
              5'h09: normal_out = 16'h3ee5;
              5'h0a: normal_out = 16'h3ee6;
              5'h0b: normal_out = 16'h3ee6;
              5'h0c: normal_out = 16'h3ee7;
              5'h0d: normal_out = 16'h3ee8;
              5'h0e: normal_out = 16'h3ee8;
              5'h0f: normal_out = 16'h3ee9;
              5'h10: normal_out = 16'h3ee9;
              5'h11: normal_out = 16'h3eea;
              5'h12: normal_out = 16'h3eeb;
              5'h13: normal_out = 16'h3eeb;
              5'h14: normal_out = 16'h3eec;
              5'h15: normal_out = 16'h3eec;
              5'h16: normal_out = 16'h3eed;
              5'h17: normal_out = 16'h3eee;
              5'h18: normal_out = 16'h3eee;
              5'h19: normal_out = 16'h3eef;
              5'h1a: normal_out = 16'h3eef;
              5'h1b: normal_out = 16'h3ef0;
              5'h1c: normal_out = 16'h3ef1;
              5'h1d: normal_out = 16'h3ef1;
              5'h1e: normal_out = 16'h3ef2;
              5'h1f: normal_out = 16'h3ef2;
              default: begin end
            endcase
          end
          5'h13: begin
            normal_out = 16'h3ef4;
            case (mant[4:0])
              5'h00: normal_out = 16'h3ef3;
              5'h03: normal_out = 16'h3ef5;
              5'h04: normal_out = 16'h3ef5;
              5'h05: normal_out = 16'h3ef6;
              5'h06: normal_out = 16'h3ef7;
              5'h07: normal_out = 16'h3ef7;
              5'h08: normal_out = 16'h3ef8;
              5'h09: normal_out = 16'h3ef8;
              5'h0a: normal_out = 16'h3ef9;
              5'h0b: normal_out = 16'h3efa;
              5'h0c: normal_out = 16'h3efa;
              5'h0d: normal_out = 16'h3efb;
              5'h0e: normal_out = 16'h3efb;
              5'h0f: normal_out = 16'h3efc;
              5'h10: normal_out = 16'h3efd;
              5'h11: normal_out = 16'h3efd;
              5'h12: normal_out = 16'h3efe;
              5'h13: normal_out = 16'h3eff;
              5'h14: normal_out = 16'h3eff;
              5'h15: normal_out = 16'h3f00;
              5'h16: normal_out = 16'h3f00;
              5'h17: normal_out = 16'h3f01;
              5'h18: normal_out = 16'h3f02;
              5'h19: normal_out = 16'h3f02;
              5'h1a: normal_out = 16'h3f03;
              5'h1b: normal_out = 16'h3f03;
              5'h1c: normal_out = 16'h3f04;
              5'h1d: normal_out = 16'h3f05;
              5'h1e: normal_out = 16'h3f05;
              5'h1f: normal_out = 16'h3f06;
              default: begin end
            endcase
          end
          5'h14: begin
            normal_out = 16'h3f08;
            case (mant[4:0])
              5'h00: normal_out = 16'h3f06;
              5'h01: normal_out = 16'h3f07;
              5'h04: normal_out = 16'h3f09;
              5'h05: normal_out = 16'h3f09;
              5'h06: normal_out = 16'h3f0a;
              5'h07: normal_out = 16'h3f0b;
              5'h08: normal_out = 16'h3f0b;
              5'h09: normal_out = 16'h3f0c;
              5'h0a: normal_out = 16'h3f0c;
              5'h0b: normal_out = 16'h3f0d;
              5'h0c: normal_out = 16'h3f0e;
              5'h0d: normal_out = 16'h3f0e;
              5'h0e: normal_out = 16'h3f0f;
              5'h0f: normal_out = 16'h3f10;
              5'h10: normal_out = 16'h3f10;
              5'h11: normal_out = 16'h3f11;
              5'h12: normal_out = 16'h3f11;
              5'h13: normal_out = 16'h3f12;
              5'h14: normal_out = 16'h3f13;
              5'h15: normal_out = 16'h3f13;
              5'h16: normal_out = 16'h3f14;
              5'h17: normal_out = 16'h3f14;
              5'h18: normal_out = 16'h3f15;
              5'h19: normal_out = 16'h3f16;
              5'h1a: normal_out = 16'h3f16;
              5'h1b: normal_out = 16'h3f17;
              5'h1c: normal_out = 16'h3f18;
              5'h1d: normal_out = 16'h3f18;
              5'h1e: normal_out = 16'h3f19;
              5'h1f: normal_out = 16'h3f19;
              default: begin end
            endcase
          end
          5'h15: begin
            normal_out = 16'h3f1b;
            case (mant[4:0])
              5'h00: normal_out = 16'h3f1a;
              5'h03: normal_out = 16'h3f1c;
              5'h04: normal_out = 16'h3f1c;
              5'h05: normal_out = 16'h3f1d;
              5'h06: normal_out = 16'h3f1e;
              5'h07: normal_out = 16'h3f1e;
              5'h08: normal_out = 16'h3f1f;
              5'h09: normal_out = 16'h3f20;
              5'h0a: normal_out = 16'h3f20;
              5'h0b: normal_out = 16'h3f21;
              5'h0c: normal_out = 16'h3f21;
              5'h0d: normal_out = 16'h3f22;
              5'h0e: normal_out = 16'h3f23;
              5'h0f: normal_out = 16'h3f23;
              5'h10: normal_out = 16'h3f24;
              5'h11: normal_out = 16'h3f24;
              5'h12: normal_out = 16'h3f25;
              5'h13: normal_out = 16'h3f26;
              5'h14: normal_out = 16'h3f26;
              5'h15: normal_out = 16'h3f27;
              5'h16: normal_out = 16'h3f28;
              5'h17: normal_out = 16'h3f28;
              5'h18: normal_out = 16'h3f29;
              5'h19: normal_out = 16'h3f29;
              5'h1a: normal_out = 16'h3f2a;
              5'h1b: normal_out = 16'h3f2b;
              5'h1c: normal_out = 16'h3f2b;
              5'h1d: normal_out = 16'h3f2c;
              5'h1e: normal_out = 16'h3f2d;
              5'h1f: normal_out = 16'h3f2d;
              default: begin end
            endcase
          end
          5'h16: begin
            normal_out = 16'h3f2e;
            case (mant[4:0])
              5'h02: normal_out = 16'h3f2f;
              5'h03: normal_out = 16'h3f30;
              5'h04: normal_out = 16'h3f30;
              5'h05: normal_out = 16'h3f31;
              5'h06: normal_out = 16'h3f32;
              5'h07: normal_out = 16'h3f32;
              5'h08: normal_out = 16'h3f33;
              5'h09: normal_out = 16'h3f33;
              5'h0a: normal_out = 16'h3f34;
              5'h0b: normal_out = 16'h3f35;
              5'h0c: normal_out = 16'h3f35;
              5'h0d: normal_out = 16'h3f36;
              5'h0e: normal_out = 16'h3f37;
              5'h0f: normal_out = 16'h3f37;
              5'h10: normal_out = 16'h3f38;
              5'h11: normal_out = 16'h3f38;
              5'h12: normal_out = 16'h3f39;
              5'h13: normal_out = 16'h3f3a;
              5'h14: normal_out = 16'h3f3a;
              5'h15: normal_out = 16'h3f3b;
              5'h16: normal_out = 16'h3f3c;
              5'h17: normal_out = 16'h3f3c;
              5'h18: normal_out = 16'h3f3d;
              5'h19: normal_out = 16'h3f3d;
              5'h1a: normal_out = 16'h3f3e;
              5'h1b: normal_out = 16'h3f3f;
              5'h1c: normal_out = 16'h3f3f;
              5'h1d: normal_out = 16'h3f40;
              5'h1e: normal_out = 16'h3f41;
              5'h1f: normal_out = 16'h3f41;
              default: begin end
            endcase
          end
          5'h17: begin
            normal_out = 16'h3f42;
            case (mant[4:0])
              5'h02: normal_out = 16'h3f43;
              5'h03: normal_out = 16'h3f44;
              5'h04: normal_out = 16'h3f44;
              5'h05: normal_out = 16'h3f45;
              5'h06: normal_out = 16'h3f46;
              5'h07: normal_out = 16'h3f46;
              5'h08: normal_out = 16'h3f47;
              5'h09: normal_out = 16'h3f47;
              5'h0a: normal_out = 16'h3f48;
              5'h0b: normal_out = 16'h3f49;
              5'h0c: normal_out = 16'h3f49;
              5'h0d: normal_out = 16'h3f4a;
              5'h0e: normal_out = 16'h3f4b;
              5'h0f: normal_out = 16'h3f4b;
              5'h10: normal_out = 16'h3f4c;
              5'h11: normal_out = 16'h3f4d;
              5'h12: normal_out = 16'h3f4d;
              5'h13: normal_out = 16'h3f4e;
              5'h14: normal_out = 16'h3f4e;
              5'h15: normal_out = 16'h3f4f;
              5'h16: normal_out = 16'h3f50;
              5'h17: normal_out = 16'h3f50;
              5'h18: normal_out = 16'h3f51;
              5'h19: normal_out = 16'h3f52;
              5'h1a: normal_out = 16'h3f52;
              5'h1b: normal_out = 16'h3f53;
              5'h1c: normal_out = 16'h3f53;
              5'h1d: normal_out = 16'h3f54;
              5'h1e: normal_out = 16'h3f55;
              5'h1f: normal_out = 16'h3f55;
              default: begin end
            endcase
          end
          5'h18: begin
            normal_out = 16'h3f57;
            case (mant[4:0])
              5'h00: normal_out = 16'h3f56;
              5'h03: normal_out = 16'h3f58;
              5'h04: normal_out = 16'h3f59;
              5'h05: normal_out = 16'h3f59;
              5'h06: normal_out = 16'h3f5a;
              5'h07: normal_out = 16'h3f5a;
              5'h08: normal_out = 16'h3f5b;
              5'h09: normal_out = 16'h3f5c;
              5'h0a: normal_out = 16'h3f5c;
              5'h0b: normal_out = 16'h3f5d;
              5'h0c: normal_out = 16'h3f5e;
              5'h0d: normal_out = 16'h3f5e;
              5'h0e: normal_out = 16'h3f5f;
              5'h0f: normal_out = 16'h3f60;
              5'h10: normal_out = 16'h3f60;
              5'h11: normal_out = 16'h3f61;
              5'h12: normal_out = 16'h3f62;
              5'h13: normal_out = 16'h3f62;
              5'h14: normal_out = 16'h3f63;
              5'h15: normal_out = 16'h3f63;
              5'h16: normal_out = 16'h3f64;
              5'h17: normal_out = 16'h3f65;
              5'h18: normal_out = 16'h3f65;
              5'h19: normal_out = 16'h3f66;
              5'h1a: normal_out = 16'h3f67;
              5'h1b: normal_out = 16'h3f67;
              5'h1c: normal_out = 16'h3f68;
              5'h1d: normal_out = 16'h3f69;
              5'h1e: normal_out = 16'h3f69;
              5'h1f: normal_out = 16'h3f6a;
              default: begin end
            endcase
          end
          5'h19: begin
            normal_out = 16'h3f6c;
            case (mant[4:0])
              5'h00: normal_out = 16'h3f6a;
              5'h01: normal_out = 16'h3f6b;
              5'h04: normal_out = 16'h3f6d;
              5'h05: normal_out = 16'h3f6e;
              5'h06: normal_out = 16'h3f6e;
              5'h07: normal_out = 16'h3f6f;
              5'h08: normal_out = 16'h3f70;
              5'h09: normal_out = 16'h3f70;
              5'h0a: normal_out = 16'h3f71;
              5'h0b: normal_out = 16'h3f72;
              5'h0c: normal_out = 16'h3f72;
              5'h0d: normal_out = 16'h3f73;
              5'h0e: normal_out = 16'h3f73;
              5'h0f: normal_out = 16'h3f74;
              5'h10: normal_out = 16'h3f75;
              5'h11: normal_out = 16'h3f75;
              5'h12: normal_out = 16'h3f76;
              5'h13: normal_out = 16'h3f77;
              5'h14: normal_out = 16'h3f77;
              5'h15: normal_out = 16'h3f78;
              5'h16: normal_out = 16'h3f79;
              5'h17: normal_out = 16'h3f79;
              5'h18: normal_out = 16'h3f7a;
              5'h19: normal_out = 16'h3f7b;
              5'h1a: normal_out = 16'h3f7b;
              5'h1b: normal_out = 16'h3f7c;
              5'h1c: normal_out = 16'h3f7d;
              5'h1d: normal_out = 16'h3f7d;
              5'h1e: normal_out = 16'h3f7e;
              5'h1f: normal_out = 16'h3f7e;
              default: begin end
            endcase
          end
          5'h1a: begin
            normal_out = 16'h3f80;
            case (mant[4:0])
              5'h00: normal_out = 16'h3f7f;
              5'h03: normal_out = 16'h3f81;
              5'h04: normal_out = 16'h3f82;
              5'h05: normal_out = 16'h3f82;
              5'h06: normal_out = 16'h3f83;
              5'h07: normal_out = 16'h3f84;
              5'h08: normal_out = 16'h3f84;
              5'h09: normal_out = 16'h3f85;
              5'h0a: normal_out = 16'h3f86;
              5'h0b: normal_out = 16'h3f86;
              5'h0c: normal_out = 16'h3f87;
              5'h0d: normal_out = 16'h3f88;
              5'h0e: normal_out = 16'h3f88;
              5'h0f: normal_out = 16'h3f89;
              5'h10: normal_out = 16'h3f8a;
              5'h11: normal_out = 16'h3f8a;
              5'h12: normal_out = 16'h3f8b;
              5'h13: normal_out = 16'h3f8c;
              5'h14: normal_out = 16'h3f8c;
              5'h15: normal_out = 16'h3f8d;
              5'h16: normal_out = 16'h3f8d;
              5'h17: normal_out = 16'h3f8e;
              5'h18: normal_out = 16'h3f8f;
              5'h19: normal_out = 16'h3f8f;
              5'h1a: normal_out = 16'h3f90;
              5'h1b: normal_out = 16'h3f91;
              5'h1c: normal_out = 16'h3f91;
              5'h1d: normal_out = 16'h3f92;
              5'h1e: normal_out = 16'h3f93;
              5'h1f: normal_out = 16'h3f93;
              default: begin end
            endcase
          end
          5'h1b: begin
            normal_out = 16'h3f95;
            case (mant[4:0])
              5'h00: normal_out = 16'h3f94;
              5'h03: normal_out = 16'h3f96;
              5'h04: normal_out = 16'h3f97;
              5'h05: normal_out = 16'h3f97;
              5'h06: normal_out = 16'h3f98;
              5'h07: normal_out = 16'h3f99;
              5'h08: normal_out = 16'h3f99;
              5'h09: normal_out = 16'h3f9a;
              5'h0a: normal_out = 16'h3f9b;
              5'h0b: normal_out = 16'h3f9b;
              5'h0c: normal_out = 16'h3f9c;
              5'h0d: normal_out = 16'h3f9d;
              5'h0e: normal_out = 16'h3f9d;
              5'h0f: normal_out = 16'h3f9e;
              5'h10: normal_out = 16'h3f9f;
              5'h11: normal_out = 16'h3f9f;
              5'h12: normal_out = 16'h3fa0;
              5'h13: normal_out = 16'h3fa1;
              5'h14: normal_out = 16'h3fa1;
              5'h15: normal_out = 16'h3fa2;
              5'h16: normal_out = 16'h3fa3;
              5'h17: normal_out = 16'h3fa3;
              5'h18: normal_out = 16'h3fa4;
              5'h19: normal_out = 16'h3fa5;
              5'h1a: normal_out = 16'h3fa5;
              5'h1b: normal_out = 16'h3fa6;
              5'h1c: normal_out = 16'h3fa7;
              5'h1d: normal_out = 16'h3fa7;
              5'h1e: normal_out = 16'h3fa8;
              5'h1f: normal_out = 16'h3fa9;
              default: begin end
            endcase
          end
          5'h1c: begin
            normal_out = 16'h3faa;
            case (mant[4:0])
              5'h00: normal_out = 16'h3fa9;
              5'h03: normal_out = 16'h3fab;
              5'h04: normal_out = 16'h3fac;
              5'h05: normal_out = 16'h3fac;
              5'h06: normal_out = 16'h3fad;
              5'h07: normal_out = 16'h3fae;
              5'h08: normal_out = 16'h3fae;
              5'h09: normal_out = 16'h3faf;
              5'h0a: normal_out = 16'h3fb0;
              5'h0b: normal_out = 16'h3fb0;
              5'h0c: normal_out = 16'h3fb1;
              5'h0d: normal_out = 16'h3fb2;
              5'h0e: normal_out = 16'h3fb2;
              5'h0f: normal_out = 16'h3fb3;
              5'h10: normal_out = 16'h3fb4;
              5'h11: normal_out = 16'h3fb4;
              5'h12: normal_out = 16'h3fb5;
              5'h13: normal_out = 16'h3fb6;
              5'h14: normal_out = 16'h3fb6;
              5'h15: normal_out = 16'h3fb7;
              5'h16: normal_out = 16'h3fb8;
              5'h17: normal_out = 16'h3fb8;
              5'h18: normal_out = 16'h3fb9;
              5'h19: normal_out = 16'h3fba;
              5'h1a: normal_out = 16'h3fbb;
              5'h1b: normal_out = 16'h3fbb;
              5'h1c: normal_out = 16'h3fbc;
              5'h1d: normal_out = 16'h3fbd;
              5'h1e: normal_out = 16'h3fbd;
              5'h1f: normal_out = 16'h3fbe;
              default: begin end
            endcase
          end
          5'h1d: begin
            normal_out = 16'h3fbf;
            case (mant[4:0])
              5'h02: normal_out = 16'h3fc0;
              5'h03: normal_out = 16'h3fc1;
              5'h04: normal_out = 16'h3fc1;
              5'h05: normal_out = 16'h3fc2;
              5'h06: normal_out = 16'h3fc3;
              5'h07: normal_out = 16'h3fc3;
              5'h08: normal_out = 16'h3fc4;
              5'h09: normal_out = 16'h3fc5;
              5'h0a: normal_out = 16'h3fc5;
              5'h0b: normal_out = 16'h3fc6;
              5'h0c: normal_out = 16'h3fc7;
              5'h0d: normal_out = 16'h3fc7;
              5'h0e: normal_out = 16'h3fc8;
              5'h0f: normal_out = 16'h3fc9;
              5'h10: normal_out = 16'h3fc9;
              5'h11: normal_out = 16'h3fca;
              5'h12: normal_out = 16'h3fcb;
              5'h13: normal_out = 16'h3fcb;
              5'h14: normal_out = 16'h3fcc;
              5'h15: normal_out = 16'h3fcd;
              5'h16: normal_out = 16'h3fcd;
              5'h17: normal_out = 16'h3fce;
              5'h18: normal_out = 16'h3fcf;
              5'h19: normal_out = 16'h3fcf;
              5'h1a: normal_out = 16'h3fd0;
              5'h1b: normal_out = 16'h3fd1;
              5'h1c: normal_out = 16'h3fd1;
              5'h1d: normal_out = 16'h3fd2;
              5'h1e: normal_out = 16'h3fd3;
              5'h1f: normal_out = 16'h3fd3;
              default: begin end
            endcase
          end
          5'h1e: begin
            normal_out = 16'h3fd5;
            case (mant[4:0])
              5'h00: normal_out = 16'h3fd4;
              5'h03: normal_out = 16'h3fd6;
              5'h04: normal_out = 16'h3fd7;
              5'h05: normal_out = 16'h3fd8;
              5'h06: normal_out = 16'h3fd8;
              5'h07: normal_out = 16'h3fd9;
              5'h08: normal_out = 16'h3fda;
              5'h09: normal_out = 16'h3fda;
              5'h0a: normal_out = 16'h3fdb;
              5'h0b: normal_out = 16'h3fdc;
              5'h0c: normal_out = 16'h3fdc;
              5'h0d: normal_out = 16'h3fdd;
              5'h0e: normal_out = 16'h3fde;
              5'h0f: normal_out = 16'h3fde;
              5'h10: normal_out = 16'h3fdf;
              5'h11: normal_out = 16'h3fe0;
              5'h12: normal_out = 16'h3fe0;
              5'h13: normal_out = 16'h3fe1;
              5'h14: normal_out = 16'h3fe2;
              5'h15: normal_out = 16'h3fe2;
              5'h16: normal_out = 16'h3fe3;
              5'h17: normal_out = 16'h3fe4;
              5'h18: normal_out = 16'h3fe4;
              5'h19: normal_out = 16'h3fe5;
              5'h1a: normal_out = 16'h3fe6;
              5'h1b: normal_out = 16'h3fe7;
              5'h1c: normal_out = 16'h3fe7;
              5'h1d: normal_out = 16'h3fe8;
              5'h1e: normal_out = 16'h3fe9;
              5'h1f: normal_out = 16'h3fe9;
              default: begin end
            endcase
          end
          5'h1f: begin
            normal_out = 16'h3feb;
            case (mant[4:0])
              5'h00: normal_out = 16'h3fea;
              5'h03: normal_out = 16'h3fec;
              5'h04: normal_out = 16'h3fed;
              5'h05: normal_out = 16'h3fed;
              5'h06: normal_out = 16'h3fee;
              5'h07: normal_out = 16'h3fef;
              5'h08: normal_out = 16'h3fef;
              5'h09: normal_out = 16'h3ff0;
              5'h0a: normal_out = 16'h3ff1;
              5'h0b: normal_out = 16'h3ff1;
              5'h0c: normal_out = 16'h3ff2;
              5'h0d: normal_out = 16'h3ff3;
              5'h0e: normal_out = 16'h3ff4;
              5'h0f: normal_out = 16'h3ff4;
              5'h10: normal_out = 16'h3ff5;
              5'h11: normal_out = 16'h3ff6;
              5'h12: normal_out = 16'h3ff6;
              5'h13: normal_out = 16'h3ff7;
              5'h14: normal_out = 16'h3ff8;
              5'h15: normal_out = 16'h3ff8;
              5'h16: normal_out = 16'h3ff9;
              5'h17: normal_out = 16'h3ffa;
              5'h18: normal_out = 16'h3ffa;
              5'h19: normal_out = 16'h3ffb;
              5'h1a: normal_out = 16'h3ffc;
              5'h1b: normal_out = 16'h3ffd;
              5'h1c: normal_out = 16'h3ffd;
              5'h1d: normal_out = 16'h3ffe;
              5'h1e: normal_out = 16'h3fff;
              5'h1f: normal_out = 16'h3fff;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      6'h0f: begin
        case (mant[9:5])
          5'h00: begin
            normal_out = 16'h4001;
            case (mant[4:0])
              5'h00: normal_out = 16'h4000;
              5'h03: normal_out = 16'h4002;
              5'h04: normal_out = 16'h4003;
              5'h05: normal_out = 16'h4003;
              5'h06: normal_out = 16'h4004;
              5'h07: normal_out = 16'h4005;
              5'h08: normal_out = 16'h4006;
              5'h09: normal_out = 16'h4006;
              5'h0a: normal_out = 16'h4007;
              5'h0b: normal_out = 16'h4008;
              5'h0c: normal_out = 16'h4008;
              5'h0d: normal_out = 16'h4009;
              5'h0e: normal_out = 16'h400a;
              5'h0f: normal_out = 16'h400a;
              5'h10: normal_out = 16'h400b;
              5'h11: normal_out = 16'h400c;
              5'h12: normal_out = 16'h400d;
              5'h13: normal_out = 16'h400d;
              5'h14: normal_out = 16'h400e;
              5'h15: normal_out = 16'h400f;
              5'h16: normal_out = 16'h400f;
              5'h17: normal_out = 16'h4010;
              5'h18: normal_out = 16'h4011;
              5'h19: normal_out = 16'h4011;
              5'h1a: normal_out = 16'h4012;
              5'h1b: normal_out = 16'h4013;
              5'h1c: normal_out = 16'h4014;
              5'h1d: normal_out = 16'h4014;
              5'h1e: normal_out = 16'h4015;
              5'h1f: normal_out = 16'h4016;
              default: begin end
            endcase
          end
          5'h01: begin
            normal_out = 16'h4019;
            case (mant[4:0])
              5'h00: normal_out = 16'h4016;
              5'h01: normal_out = 16'h4017;
              5'h02: normal_out = 16'h4018;
              5'h05: normal_out = 16'h401a;
              5'h06: normal_out = 16'h401b;
              5'h07: normal_out = 16'h401b;
              5'h08: normal_out = 16'h401c;
              5'h09: normal_out = 16'h401d;
              5'h0a: normal_out = 16'h401e;
              5'h0b: normal_out = 16'h401e;
              5'h0c: normal_out = 16'h401f;
              5'h0d: normal_out = 16'h4020;
              5'h0e: normal_out = 16'h4020;
              5'h0f: normal_out = 16'h4021;
              5'h10: normal_out = 16'h4022;
              5'h11: normal_out = 16'h4023;
              5'h12: normal_out = 16'h4023;
              5'h13: normal_out = 16'h4024;
              5'h14: normal_out = 16'h4025;
              5'h15: normal_out = 16'h4025;
              5'h16: normal_out = 16'h4026;
              5'h17: normal_out = 16'h4027;
              5'h18: normal_out = 16'h4028;
              5'h19: normal_out = 16'h4028;
              5'h1a: normal_out = 16'h4029;
              5'h1b: normal_out = 16'h402a;
              5'h1c: normal_out = 16'h402a;
              5'h1d: normal_out = 16'h402b;
              5'h1e: normal_out = 16'h402c;
              5'h1f: normal_out = 16'h402d;
              default: begin end
            endcase
          end
          5'h02: begin
            normal_out = 16'h4030;
            case (mant[4:0])
              5'h00: normal_out = 16'h402d;
              5'h01: normal_out = 16'h402e;
              5'h02: normal_out = 16'h402f;
              5'h05: normal_out = 16'h4031;
              5'h06: normal_out = 16'h4032;
              5'h07: normal_out = 16'h4032;
              5'h08: normal_out = 16'h4033;
              5'h09: normal_out = 16'h4034;
              5'h0a: normal_out = 16'h4035;
              5'h0b: normal_out = 16'h4035;
              5'h0c: normal_out = 16'h4036;
              5'h0d: normal_out = 16'h4037;
              5'h0e: normal_out = 16'h4038;
              5'h0f: normal_out = 16'h4038;
              5'h10: normal_out = 16'h4039;
              5'h11: normal_out = 16'h403a;
              5'h12: normal_out = 16'h403a;
              5'h13: normal_out = 16'h403b;
              5'h14: normal_out = 16'h403c;
              5'h15: normal_out = 16'h403d;
              5'h16: normal_out = 16'h403d;
              5'h17: normal_out = 16'h403e;
              5'h18: normal_out = 16'h403f;
              5'h19: normal_out = 16'h4040;
              5'h1a: normal_out = 16'h4040;
              5'h1b: normal_out = 16'h4041;
              5'h1c: normal_out = 16'h4042;
              5'h1d: normal_out = 16'h4043;
              5'h1e: normal_out = 16'h4043;
              5'h1f: normal_out = 16'h4044;
              default: begin end
            endcase
          end
          5'h03: begin
            normal_out = 16'h4045;
            case (mant[4:0])
              5'h02: normal_out = 16'h4046;
              5'h03: normal_out = 16'h4047;
              5'h04: normal_out = 16'h4048;
              5'h05: normal_out = 16'h4048;
              5'h06: normal_out = 16'h4049;
              5'h07: normal_out = 16'h404a;
              5'h08: normal_out = 16'h404b;
              5'h09: normal_out = 16'h404b;
              5'h0a: normal_out = 16'h404c;
              5'h0b: normal_out = 16'h404d;
              5'h0c: normal_out = 16'h404e;
              5'h0d: normal_out = 16'h404e;
              5'h0e: normal_out = 16'h404f;
              5'h0f: normal_out = 16'h4050;
              5'h10: normal_out = 16'h4051;
              5'h11: normal_out = 16'h4051;
              5'h12: normal_out = 16'h4052;
              5'h13: normal_out = 16'h4053;
              5'h14: normal_out = 16'h4054;
              5'h15: normal_out = 16'h4054;
              5'h16: normal_out = 16'h4055;
              5'h17: normal_out = 16'h4056;
              5'h18: normal_out = 16'h4057;
              5'h19: normal_out = 16'h4057;
              5'h1a: normal_out = 16'h4058;
              5'h1b: normal_out = 16'h4059;
              5'h1c: normal_out = 16'h405a;
              5'h1d: normal_out = 16'h405a;
              5'h1e: normal_out = 16'h405b;
              5'h1f: normal_out = 16'h405c;
              default: begin end
            endcase
          end
          5'h04: begin
            normal_out = 16'h405d;
            case (mant[4:0])
              5'h02: normal_out = 16'h405e;
              5'h03: normal_out = 16'h405f;
              5'h04: normal_out = 16'h4060;
              5'h05: normal_out = 16'h4060;
              5'h06: normal_out = 16'h4061;
              5'h07: normal_out = 16'h4062;
              5'h08: normal_out = 16'h4063;
              5'h09: normal_out = 16'h4064;
              5'h0a: normal_out = 16'h4064;
              5'h0b: normal_out = 16'h4065;
              5'h0c: normal_out = 16'h4066;
              5'h0d: normal_out = 16'h4067;
              5'h0e: normal_out = 16'h4067;
              5'h0f: normal_out = 16'h4068;
              5'h10: normal_out = 16'h4069;
              5'h11: normal_out = 16'h406a;
              5'h12: normal_out = 16'h406a;
              5'h13: normal_out = 16'h406b;
              5'h14: normal_out = 16'h406c;
              5'h15: normal_out = 16'h406d;
              5'h16: normal_out = 16'h406d;
              5'h17: normal_out = 16'h406e;
              5'h18: normal_out = 16'h406f;
              5'h19: normal_out = 16'h4070;
              5'h1a: normal_out = 16'h4071;
              5'h1b: normal_out = 16'h4071;
              5'h1c: normal_out = 16'h4072;
              5'h1d: normal_out = 16'h4073;
              5'h1e: normal_out = 16'h4074;
              5'h1f: normal_out = 16'h4074;
              default: begin end
            endcase
          end
          5'h05: begin
            normal_out = 16'h4077;
            case (mant[4:0])
              5'h00: normal_out = 16'h4075;
              5'h01: normal_out = 16'h4076;
              5'h04: normal_out = 16'h4078;
              5'h05: normal_out = 16'h4079;
              5'h06: normal_out = 16'h407a;
              5'h07: normal_out = 16'h407b;
              5'h08: normal_out = 16'h407b;
              5'h09: normal_out = 16'h407c;
              5'h0a: normal_out = 16'h407d;
              5'h0b: normal_out = 16'h407e;
              5'h0c: normal_out = 16'h407e;
              5'h0d: normal_out = 16'h407f;
              5'h0e: normal_out = 16'h4080;
              5'h0f: normal_out = 16'h4081;
              5'h10: normal_out = 16'h4082;
              5'h11: normal_out = 16'h4082;
              5'h12: normal_out = 16'h4083;
              5'h13: normal_out = 16'h4084;
              5'h14: normal_out = 16'h4085;
              5'h15: normal_out = 16'h4085;
              5'h16: normal_out = 16'h4086;
              5'h17: normal_out = 16'h4087;
              5'h18: normal_out = 16'h4088;
              5'h19: normal_out = 16'h4089;
              5'h1a: normal_out = 16'h4089;
              5'h1b: normal_out = 16'h408a;
              5'h1c: normal_out = 16'h408b;
              5'h1d: normal_out = 16'h408c;
              5'h1e: normal_out = 16'h408d;
              5'h1f: normal_out = 16'h408d;
              default: begin end
            endcase
          end
          5'h06: begin
            normal_out = 16'h4090;
            case (mant[4:0])
              5'h00: normal_out = 16'h408e;
              5'h01: normal_out = 16'h408f;
              5'h04: normal_out = 16'h4091;
              5'h05: normal_out = 16'h4092;
              5'h06: normal_out = 16'h4093;
              5'h07: normal_out = 16'h4094;
              5'h08: normal_out = 16'h4094;
              5'h09: normal_out = 16'h4095;
              5'h0a: normal_out = 16'h4096;
              5'h0b: normal_out = 16'h4097;
              5'h0c: normal_out = 16'h4098;
              5'h0d: normal_out = 16'h4098;
              5'h0e: normal_out = 16'h4099;
              5'h0f: normal_out = 16'h409a;
              5'h10: normal_out = 16'h409b;
              5'h11: normal_out = 16'h409c;
              5'h12: normal_out = 16'h409c;
              5'h13: normal_out = 16'h409d;
              5'h14: normal_out = 16'h409e;
              5'h15: normal_out = 16'h409f;
              5'h16: normal_out = 16'h40a0;
              5'h17: normal_out = 16'h40a0;
              5'h18: normal_out = 16'h40a1;
              5'h19: normal_out = 16'h40a2;
              5'h1a: normal_out = 16'h40a3;
              5'h1b: normal_out = 16'h40a4;
              5'h1c: normal_out = 16'h40a4;
              5'h1d: normal_out = 16'h40a5;
              5'h1e: normal_out = 16'h40a6;
              5'h1f: normal_out = 16'h40a7;
              default: begin end
            endcase
          end
          5'h07: begin
            normal_out = 16'h40a8;
            case (mant[4:0])
              5'h02: normal_out = 16'h40a9;
              5'h03: normal_out = 16'h40aa;
              5'h04: normal_out = 16'h40ab;
              5'h05: normal_out = 16'h40ac;
              5'h06: normal_out = 16'h40ad;
              5'h07: normal_out = 16'h40ad;
              5'h08: normal_out = 16'h40ae;
              5'h09: normal_out = 16'h40af;
              5'h0a: normal_out = 16'h40b0;
              5'h0b: normal_out = 16'h40b1;
              5'h0c: normal_out = 16'h40b1;
              5'h0d: normal_out = 16'h40b2;
              5'h0e: normal_out = 16'h40b3;
              5'h0f: normal_out = 16'h40b4;
              5'h10: normal_out = 16'h40b5;
              5'h11: normal_out = 16'h40b5;
              5'h12: normal_out = 16'h40b6;
              5'h13: normal_out = 16'h40b7;
              5'h14: normal_out = 16'h40b8;
              5'h15: normal_out = 16'h40b9;
              5'h16: normal_out = 16'h40ba;
              5'h17: normal_out = 16'h40ba;
              5'h18: normal_out = 16'h40bb;
              5'h19: normal_out = 16'h40bc;
              5'h1a: normal_out = 16'h40bd;
              5'h1b: normal_out = 16'h40be;
              5'h1c: normal_out = 16'h40be;
              5'h1d: normal_out = 16'h40bf;
              5'h1e: normal_out = 16'h40c0;
              5'h1f: normal_out = 16'h40c1;
              default: begin end
            endcase
          end
          5'h08: begin
            normal_out = 16'h40c3;
            case (mant[4:0])
              5'h00: normal_out = 16'h40c2;
              5'h03: normal_out = 16'h40c4;
              5'h04: normal_out = 16'h40c5;
              5'h05: normal_out = 16'h40c6;
              5'h06: normal_out = 16'h40c7;
              5'h07: normal_out = 16'h40c8;
              5'h08: normal_out = 16'h40c8;
              5'h09: normal_out = 16'h40c9;
              5'h0a: normal_out = 16'h40ca;
              5'h0b: normal_out = 16'h40cb;
              5'h0c: normal_out = 16'h40cc;
              5'h0d: normal_out = 16'h40cd;
              5'h0e: normal_out = 16'h40cd;
              5'h0f: normal_out = 16'h40ce;
              5'h10: normal_out = 16'h40cf;
              5'h11: normal_out = 16'h40d0;
              5'h12: normal_out = 16'h40d1;
              5'h13: normal_out = 16'h40d2;
              5'h14: normal_out = 16'h40d2;
              5'h15: normal_out = 16'h40d3;
              5'h16: normal_out = 16'h40d4;
              5'h17: normal_out = 16'h40d5;
              5'h18: normal_out = 16'h40d6;
              5'h19: normal_out = 16'h40d7;
              5'h1a: normal_out = 16'h40d7;
              5'h1b: normal_out = 16'h40d8;
              5'h1c: normal_out = 16'h40d9;
              5'h1d: normal_out = 16'h40da;
              5'h1e: normal_out = 16'h40db;
              5'h1f: normal_out = 16'h40dc;
              default: begin end
            endcase
          end
          5'h09: begin
            normal_out = 16'h40e1;
            case (mant[4:0])
              5'h00: normal_out = 16'h40dc;
              5'h01: normal_out = 16'h40dd;
              5'h02: normal_out = 16'h40de;
              5'h03: normal_out = 16'h40df;
              5'h04: normal_out = 16'h40e0;
              5'h07: normal_out = 16'h40e2;
              5'h08: normal_out = 16'h40e3;
              5'h09: normal_out = 16'h40e4;
              5'h0a: normal_out = 16'h40e5;
              5'h0b: normal_out = 16'h40e6;
              5'h0c: normal_out = 16'h40e7;
              5'h0d: normal_out = 16'h40e7;
              5'h0e: normal_out = 16'h40e8;
              5'h0f: normal_out = 16'h40e9;
              5'h10: normal_out = 16'h40ea;
              5'h11: normal_out = 16'h40eb;
              5'h12: normal_out = 16'h40ec;
              5'h13: normal_out = 16'h40ed;
              5'h14: normal_out = 16'h40ed;
              5'h15: normal_out = 16'h40ee;
              5'h16: normal_out = 16'h40ef;
              5'h17: normal_out = 16'h40f0;
              5'h18: normal_out = 16'h40f1;
              5'h19: normal_out = 16'h40f2;
              5'h1a: normal_out = 16'h40f3;
              5'h1b: normal_out = 16'h40f3;
              5'h1c: normal_out = 16'h40f4;
              5'h1d: normal_out = 16'h40f5;
              5'h1e: normal_out = 16'h40f6;
              5'h1f: normal_out = 16'h40f7;
              default: begin end
            endcase
          end
          5'h0a: begin
            normal_out = 16'h40f9;
            case (mant[4:0])
              5'h00: normal_out = 16'h40f8;
              5'h03: normal_out = 16'h40fa;
              5'h04: normal_out = 16'h40fb;
              5'h05: normal_out = 16'h40fc;
              5'h06: normal_out = 16'h40fd;
              5'h07: normal_out = 16'h40fe;
              5'h08: normal_out = 16'h40ff;
              5'h09: normal_out = 16'h40ff;
              5'h0a: normal_out = 16'h4100;
              5'h0b: normal_out = 16'h4101;
              5'h0c: normal_out = 16'h4102;
              5'h0d: normal_out = 16'h4103;
              5'h0e: normal_out = 16'h4104;
              5'h0f: normal_out = 16'h4105;
              5'h10: normal_out = 16'h4106;
              5'h11: normal_out = 16'h4106;
              5'h12: normal_out = 16'h4107;
              5'h13: normal_out = 16'h4108;
              5'h14: normal_out = 16'h4109;
              5'h15: normal_out = 16'h410a;
              5'h16: normal_out = 16'h410b;
              5'h17: normal_out = 16'h410c;
              5'h18: normal_out = 16'h410c;
              5'h19: normal_out = 16'h410d;
              5'h1a: normal_out = 16'h410e;
              5'h1b: normal_out = 16'h410f;
              5'h1c: normal_out = 16'h4110;
              5'h1d: normal_out = 16'h4111;
              5'h1e: normal_out = 16'h4112;
              5'h1f: normal_out = 16'h4113;
              default: begin end
            endcase
          end
          5'h0b: begin
            normal_out = 16'h4114;
            case (mant[4:0])
              5'h02: normal_out = 16'h4115;
              5'h03: normal_out = 16'h4116;
              5'h04: normal_out = 16'h4117;
              5'h05: normal_out = 16'h4118;
              5'h06: normal_out = 16'h4119;
              5'h07: normal_out = 16'h411a;
              5'h08: normal_out = 16'h411b;
              5'h09: normal_out = 16'h411b;
              5'h0a: normal_out = 16'h411c;
              5'h0b: normal_out = 16'h411d;
              5'h0c: normal_out = 16'h411e;
              5'h0d: normal_out = 16'h411f;
              5'h0e: normal_out = 16'h4120;
              5'h0f: normal_out = 16'h4121;
              5'h10: normal_out = 16'h4122;
              5'h11: normal_out = 16'h4123;
              5'h12: normal_out = 16'h4123;
              5'h13: normal_out = 16'h4124;
              5'h14: normal_out = 16'h4125;
              5'h15: normal_out = 16'h4126;
              5'h16: normal_out = 16'h4127;
              5'h17: normal_out = 16'h4128;
              5'h18: normal_out = 16'h4129;
              5'h19: normal_out = 16'h412a;
              5'h1a: normal_out = 16'h412b;
              5'h1b: normal_out = 16'h412b;
              5'h1c: normal_out = 16'h412c;
              5'h1d: normal_out = 16'h412d;
              5'h1e: normal_out = 16'h412e;
              5'h1f: normal_out = 16'h412f;
              default: begin end
            endcase
          end
          5'h0c: begin
            normal_out = 16'h4134;
            case (mant[4:0])
              5'h00: normal_out = 16'h4130;
              5'h01: normal_out = 16'h4131;
              5'h02: normal_out = 16'h4132;
              5'h03: normal_out = 16'h4133;
              5'h06: normal_out = 16'h4135;
              5'h07: normal_out = 16'h4136;
              5'h08: normal_out = 16'h4137;
              5'h09: normal_out = 16'h4138;
              5'h0a: normal_out = 16'h4139;
              5'h0b: normal_out = 16'h413a;
              5'h0c: normal_out = 16'h413b;
              5'h0d: normal_out = 16'h413c;
              5'h0e: normal_out = 16'h413d;
              5'h0f: normal_out = 16'h413e;
              5'h10: normal_out = 16'h413e;
              5'h11: normal_out = 16'h413f;
              5'h12: normal_out = 16'h4140;
              5'h13: normal_out = 16'h4141;
              5'h14: normal_out = 16'h4142;
              5'h15: normal_out = 16'h4143;
              5'h16: normal_out = 16'h4144;
              5'h17: normal_out = 16'h4145;
              5'h18: normal_out = 16'h4146;
              5'h19: normal_out = 16'h4147;
              5'h1a: normal_out = 16'h4148;
              5'h1b: normal_out = 16'h4148;
              5'h1c: normal_out = 16'h4149;
              5'h1d: normal_out = 16'h414a;
              5'h1e: normal_out = 16'h414b;
              5'h1f: normal_out = 16'h414c;
              default: begin end
            endcase
          end
          5'h0d: begin
            normal_out = 16'h4153;
            case (mant[4:0])
              5'h00: normal_out = 16'h414d;
              5'h01: normal_out = 16'h414e;
              5'h02: normal_out = 16'h414f;
              5'h03: normal_out = 16'h4150;
              5'h04: normal_out = 16'h4151;
              5'h05: normal_out = 16'h4152;
              5'h08: normal_out = 16'h4154;
              5'h09: normal_out = 16'h4155;
              5'h0a: normal_out = 16'h4156;
              5'h0b: normal_out = 16'h4157;
              5'h0c: normal_out = 16'h4158;
              5'h0d: normal_out = 16'h4159;
              5'h0e: normal_out = 16'h415a;
              5'h0f: normal_out = 16'h415b;
              5'h10: normal_out = 16'h415c;
              5'h11: normal_out = 16'h415d;
              5'h12: normal_out = 16'h415e;
              5'h13: normal_out = 16'h415f;
              5'h14: normal_out = 16'h4160;
              5'h15: normal_out = 16'h4160;
              5'h16: normal_out = 16'h4161;
              5'h17: normal_out = 16'h4162;
              5'h18: normal_out = 16'h4163;
              5'h19: normal_out = 16'h4164;
              5'h1a: normal_out = 16'h4165;
              5'h1b: normal_out = 16'h4166;
              5'h1c: normal_out = 16'h4167;
              5'h1d: normal_out = 16'h4168;
              5'h1e: normal_out = 16'h4169;
              5'h1f: normal_out = 16'h416a;
              default: begin end
            endcase
          end
          5'h0e: begin
            normal_out = 16'h416f;
            case (mant[4:0])
              5'h00: normal_out = 16'h416b;
              5'h01: normal_out = 16'h416c;
              5'h02: normal_out = 16'h416d;
              5'h03: normal_out = 16'h416e;
              5'h06: normal_out = 16'h4170;
              5'h07: normal_out = 16'h4171;
              5'h08: normal_out = 16'h4172;
              5'h09: normal_out = 16'h4173;
              5'h0a: normal_out = 16'h4174;
              5'h0b: normal_out = 16'h4175;
              5'h0c: normal_out = 16'h4176;
              5'h0d: normal_out = 16'h4177;
              5'h0e: normal_out = 16'h4178;
              5'h0f: normal_out = 16'h4179;
              5'h10: normal_out = 16'h417a;
              5'h11: normal_out = 16'h417b;
              5'h12: normal_out = 16'h417c;
              5'h13: normal_out = 16'h417d;
              5'h14: normal_out = 16'h417e;
              5'h15: normal_out = 16'h417f;
              5'h16: normal_out = 16'h4180;
              5'h17: normal_out = 16'h4181;
              5'h18: normal_out = 16'h4181;
              5'h19: normal_out = 16'h4182;
              5'h1a: normal_out = 16'h4183;
              5'h1b: normal_out = 16'h4184;
              5'h1c: normal_out = 16'h4185;
              5'h1d: normal_out = 16'h4186;
              5'h1e: normal_out = 16'h4187;
              5'h1f: normal_out = 16'h4188;
              default: begin end
            endcase
          end
          5'h0f: begin
            normal_out = 16'h419a;
            case (mant[4:0])
              5'h00: normal_out = 16'h4189;
              5'h01: normal_out = 16'h418a;
              5'h02: normal_out = 16'h418b;
              5'h03: normal_out = 16'h418c;
              5'h04: normal_out = 16'h418d;
              5'h05: normal_out = 16'h418e;
              5'h06: normal_out = 16'h418f;
              5'h07: normal_out = 16'h4190;
              5'h08: normal_out = 16'h4191;
              5'h09: normal_out = 16'h4192;
              5'h0a: normal_out = 16'h4193;
              5'h0b: normal_out = 16'h4194;
              5'h0c: normal_out = 16'h4195;
              5'h0d: normal_out = 16'h4196;
              5'h0e: normal_out = 16'h4197;
              5'h0f: normal_out = 16'h4198;
              5'h10: normal_out = 16'h4199;
              5'h13: normal_out = 16'h419b;
              5'h14: normal_out = 16'h419c;
              5'h15: normal_out = 16'h419d;
              5'h16: normal_out = 16'h419e;
              5'h17: normal_out = 16'h419f;
              5'h18: normal_out = 16'h41a0;
              5'h19: normal_out = 16'h41a1;
              5'h1a: normal_out = 16'h41a2;
              5'h1b: normal_out = 16'h41a3;
              5'h1c: normal_out = 16'h41a4;
              5'h1d: normal_out = 16'h41a5;
              5'h1e: normal_out = 16'h41a6;
              5'h1f: normal_out = 16'h41a7;
              default: begin end
            endcase
          end
          5'h10: begin
            normal_out = 16'h41a8;
            case (mant[4:0])
              5'h01: normal_out = 16'h41a9;
              5'h02: normal_out = 16'h41aa;
              5'h03: normal_out = 16'h41ab;
              5'h04: normal_out = 16'h41ac;
              5'h05: normal_out = 16'h41ad;
              5'h06: normal_out = 16'h41ae;
              5'h07: normal_out = 16'h41af;
              5'h08: normal_out = 16'h41b0;
              5'h09: normal_out = 16'h41b1;
              5'h0a: normal_out = 16'h41b2;
              5'h0b: normal_out = 16'h41b3;
              5'h0c: normal_out = 16'h41b4;
              5'h0d: normal_out = 16'h41b5;
              5'h0e: normal_out = 16'h41b6;
              5'h0f: normal_out = 16'h41b7;
              5'h10: normal_out = 16'h41b8;
              5'h11: normal_out = 16'h41b9;
              5'h12: normal_out = 16'h41ba;
              5'h13: normal_out = 16'h41bb;
              5'h14: normal_out = 16'h41bc;
              5'h15: normal_out = 16'h41bd;
              5'h16: normal_out = 16'h41be;
              5'h17: normal_out = 16'h41bf;
              5'h18: normal_out = 16'h41c0;
              5'h19: normal_out = 16'h41c1;
              5'h1a: normal_out = 16'h41c2;
              5'h1b: normal_out = 16'h41c3;
              5'h1c: normal_out = 16'h41c4;
              5'h1d: normal_out = 16'h41c5;
              5'h1e: normal_out = 16'h41c6;
              5'h1f: normal_out = 16'h41c7;
              default: begin end
            endcase
          end
          5'h11: begin
            normal_out = 16'h41c8;
            case (mant[4:0])
              5'h01: normal_out = 16'h41c9;
              5'h02: normal_out = 16'h41ca;
              5'h03: normal_out = 16'h41cb;
              5'h04: normal_out = 16'h41cc;
              5'h05: normal_out = 16'h41cd;
              5'h06: normal_out = 16'h41ce;
              5'h07: normal_out = 16'h41cf;
              5'h08: normal_out = 16'h41d0;
              5'h09: normal_out = 16'h41d1;
              5'h0a: normal_out = 16'h41d2;
              5'h0b: normal_out = 16'h41d3;
              5'h0c: normal_out = 16'h41d4;
              5'h0d: normal_out = 16'h41d5;
              5'h0e: normal_out = 16'h41d6;
              5'h0f: normal_out = 16'h41d7;
              5'h10: normal_out = 16'h41d8;
              5'h11: normal_out = 16'h41d9;
              5'h12: normal_out = 16'h41da;
              5'h13: normal_out = 16'h41db;
              5'h14: normal_out = 16'h41dc;
              5'h15: normal_out = 16'h41dd;
              5'h16: normal_out = 16'h41de;
              5'h17: normal_out = 16'h41df;
              5'h18: normal_out = 16'h41e0;
              5'h19: normal_out = 16'h41e1;
              5'h1a: normal_out = 16'h41e2;
              5'h1b: normal_out = 16'h41e3;
              5'h1c: normal_out = 16'h41e4;
              5'h1d: normal_out = 16'h41e5;
              5'h1e: normal_out = 16'h41e6;
              5'h1f: normal_out = 16'h41e7;
              default: begin end
            endcase
          end
          5'h12: begin
            normal_out = 16'h41e8;
            case (mant[4:0])
              5'h01: normal_out = 16'h41e9;
              5'h02: normal_out = 16'h41ea;
              5'h03: normal_out = 16'h41eb;
              5'h04: normal_out = 16'h41ec;
              5'h05: normal_out = 16'h41ed;
              5'h06: normal_out = 16'h41ee;
              5'h07: normal_out = 16'h41ef;
              5'h08: normal_out = 16'h41f0;
              5'h09: normal_out = 16'h41f2;
              5'h0a: normal_out = 16'h41f3;
              5'h0b: normal_out = 16'h41f4;
              5'h0c: normal_out = 16'h41f5;
              5'h0d: normal_out = 16'h41f6;
              5'h0e: normal_out = 16'h41f7;
              5'h0f: normal_out = 16'h41f8;
              5'h10: normal_out = 16'h41f9;
              5'h11: normal_out = 16'h41fa;
              5'h12: normal_out = 16'h41fb;
              5'h13: normal_out = 16'h41fc;
              5'h14: normal_out = 16'h41fd;
              5'h15: normal_out = 16'h41fe;
              5'h16: normal_out = 16'h41ff;
              5'h17: normal_out = 16'h4200;
              5'h18: normal_out = 16'h4201;
              5'h19: normal_out = 16'h4202;
              5'h1a: normal_out = 16'h4203;
              5'h1b: normal_out = 16'h4204;
              5'h1c: normal_out = 16'h4205;
              5'h1d: normal_out = 16'h4206;
              5'h1e: normal_out = 16'h4207;
              5'h1f: normal_out = 16'h4208;
              default: begin end
            endcase
          end
          5'h13: begin
            normal_out = 16'h4209;
            case (mant[4:0])
              5'h01: normal_out = 16'h420a;
              5'h02: normal_out = 16'h420b;
              5'h03: normal_out = 16'h420d;
              5'h04: normal_out = 16'h420e;
              5'h05: normal_out = 16'h420f;
              5'h06: normal_out = 16'h4210;
              5'h07: normal_out = 16'h4211;
              5'h08: normal_out = 16'h4212;
              5'h09: normal_out = 16'h4213;
              5'h0a: normal_out = 16'h4214;
              5'h0b: normal_out = 16'h4215;
              5'h0c: normal_out = 16'h4216;
              5'h0d: normal_out = 16'h4217;
              5'h0e: normal_out = 16'h4218;
              5'h0f: normal_out = 16'h4219;
              5'h10: normal_out = 16'h421a;
              5'h11: normal_out = 16'h421b;
              5'h12: normal_out = 16'h421c;
              5'h13: normal_out = 16'h421d;
              5'h14: normal_out = 16'h421e;
              5'h15: normal_out = 16'h4220;
              5'h16: normal_out = 16'h4221;
              5'h17: normal_out = 16'h4222;
              5'h18: normal_out = 16'h4223;
              5'h19: normal_out = 16'h4224;
              5'h1a: normal_out = 16'h4225;
              5'h1b: normal_out = 16'h4226;
              5'h1c: normal_out = 16'h4227;
              5'h1d: normal_out = 16'h4228;
              5'h1e: normal_out = 16'h4229;
              5'h1f: normal_out = 16'h422a;
              default: begin end
            endcase
          end
          5'h14: begin
            normal_out = 16'h422b;
            case (mant[4:0])
              5'h01: normal_out = 16'h422c;
              5'h02: normal_out = 16'h422d;
              5'h03: normal_out = 16'h422e;
              5'h04: normal_out = 16'h4230;
              5'h05: normal_out = 16'h4231;
              5'h06: normal_out = 16'h4232;
              5'h07: normal_out = 16'h4233;
              5'h08: normal_out = 16'h4234;
              5'h09: normal_out = 16'h4235;
              5'h0a: normal_out = 16'h4236;
              5'h0b: normal_out = 16'h4237;
              5'h0c: normal_out = 16'h4238;
              5'h0d: normal_out = 16'h4239;
              5'h0e: normal_out = 16'h423a;
              5'h0f: normal_out = 16'h423b;
              5'h10: normal_out = 16'h423c;
              5'h11: normal_out = 16'h423e;
              5'h12: normal_out = 16'h423f;
              5'h13: normal_out = 16'h4240;
              5'h14: normal_out = 16'h4241;
              5'h15: normal_out = 16'h4242;
              5'h16: normal_out = 16'h4243;
              5'h17: normal_out = 16'h4244;
              5'h18: normal_out = 16'h4245;
              5'h19: normal_out = 16'h4246;
              5'h1a: normal_out = 16'h4247;
              5'h1b: normal_out = 16'h4248;
              5'h1c: normal_out = 16'h4249;
              5'h1d: normal_out = 16'h424b;
              5'h1e: normal_out = 16'h424c;
              5'h1f: normal_out = 16'h424d;
              default: begin end
            endcase
          end
          5'h15: begin
            normal_out = 16'h424e;
            case (mant[4:0])
              5'h01: normal_out = 16'h424f;
              5'h02: normal_out = 16'h4250;
              5'h03: normal_out = 16'h4251;
              5'h04: normal_out = 16'h4252;
              5'h05: normal_out = 16'h4253;
              5'h06: normal_out = 16'h4254;
              5'h07: normal_out = 16'h4255;
              5'h08: normal_out = 16'h4257;
              5'h09: normal_out = 16'h4258;
              5'h0a: normal_out = 16'h4259;
              5'h0b: normal_out = 16'h425a;
              5'h0c: normal_out = 16'h425b;
              5'h0d: normal_out = 16'h425c;
              5'h0e: normal_out = 16'h425d;
              5'h0f: normal_out = 16'h425e;
              5'h10: normal_out = 16'h425f;
              5'h11: normal_out = 16'h4260;
              5'h12: normal_out = 16'h4262;
              5'h13: normal_out = 16'h4263;
              5'h14: normal_out = 16'h4264;
              5'h15: normal_out = 16'h4265;
              5'h16: normal_out = 16'h4266;
              5'h17: normal_out = 16'h4267;
              5'h18: normal_out = 16'h4268;
              5'h19: normal_out = 16'h4269;
              5'h1a: normal_out = 16'h426a;
              5'h1b: normal_out = 16'h426c;
              5'h1c: normal_out = 16'h426d;
              5'h1d: normal_out = 16'h426e;
              5'h1e: normal_out = 16'h426f;
              5'h1f: normal_out = 16'h4270;
              default: begin end
            endcase
          end
          5'h16: begin
            normal_out = 16'h4271;
            case (mant[4:0])
              5'h01: normal_out = 16'h4272;
              5'h02: normal_out = 16'h4273;
              5'h03: normal_out = 16'h4274;
              5'h04: normal_out = 16'h4276;
              5'h05: normal_out = 16'h4277;
              5'h06: normal_out = 16'h4278;
              5'h07: normal_out = 16'h4279;
              5'h08: normal_out = 16'h427a;
              5'h09: normal_out = 16'h427b;
              5'h0a: normal_out = 16'h427c;
              5'h0b: normal_out = 16'h427d;
              5'h0c: normal_out = 16'h427f;
              5'h0d: normal_out = 16'h4280;
              5'h0e: normal_out = 16'h4281;
              5'h0f: normal_out = 16'h4282;
              5'h10: normal_out = 16'h4283;
              5'h11: normal_out = 16'h4284;
              5'h12: normal_out = 16'h4285;
              5'h13: normal_out = 16'h4286;
              5'h14: normal_out = 16'h4288;
              5'h15: normal_out = 16'h4289;
              5'h16: normal_out = 16'h428a;
              5'h17: normal_out = 16'h428b;
              5'h18: normal_out = 16'h428c;
              5'h19: normal_out = 16'h428d;
              5'h1a: normal_out = 16'h428e;
              5'h1b: normal_out = 16'h4290;
              5'h1c: normal_out = 16'h4291;
              5'h1d: normal_out = 16'h4292;
              5'h1e: normal_out = 16'h4293;
              5'h1f: normal_out = 16'h4294;
              default: begin end
            endcase
          end
          5'h17: begin
            normal_out = 16'h4295;
            case (mant[4:0])
              5'h01: normal_out = 16'h4296;
              5'h02: normal_out = 16'h4298;
              5'h03: normal_out = 16'h4299;
              5'h04: normal_out = 16'h429a;
              5'h05: normal_out = 16'h429b;
              5'h06: normal_out = 16'h429c;
              5'h07: normal_out = 16'h429d;
              5'h08: normal_out = 16'h429e;
              5'h09: normal_out = 16'h42a0;
              5'h0a: normal_out = 16'h42a1;
              5'h0b: normal_out = 16'h42a2;
              5'h0c: normal_out = 16'h42a3;
              5'h0d: normal_out = 16'h42a4;
              5'h0e: normal_out = 16'h42a5;
              5'h0f: normal_out = 16'h42a6;
              5'h10: normal_out = 16'h42a8;
              5'h11: normal_out = 16'h42a9;
              5'h12: normal_out = 16'h42aa;
              5'h13: normal_out = 16'h42ab;
              5'h14: normal_out = 16'h42ac;
              5'h15: normal_out = 16'h42ad;
              5'h16: normal_out = 16'h42af;
              5'h17: normal_out = 16'h42b0;
              5'h18: normal_out = 16'h42b1;
              5'h19: normal_out = 16'h42b2;
              5'h1a: normal_out = 16'h42b3;
              5'h1b: normal_out = 16'h42b4;
              5'h1c: normal_out = 16'h42b5;
              5'h1d: normal_out = 16'h42b7;
              5'h1e: normal_out = 16'h42b8;
              5'h1f: normal_out = 16'h42b9;
              default: begin end
            endcase
          end
          5'h18: begin
            normal_out = 16'h42ba;
            case (mant[4:0])
              5'h01: normal_out = 16'h42bb;
              5'h02: normal_out = 16'h42bc;
              5'h03: normal_out = 16'h42be;
              5'h04: normal_out = 16'h42bf;
              5'h05: normal_out = 16'h42c0;
              5'h06: normal_out = 16'h42c1;
              5'h07: normal_out = 16'h42c2;
              5'h08: normal_out = 16'h42c4;
              5'h09: normal_out = 16'h42c5;
              5'h0a: normal_out = 16'h42c6;
              5'h0b: normal_out = 16'h42c7;
              5'h0c: normal_out = 16'h42c8;
              5'h0d: normal_out = 16'h42c9;
              5'h0e: normal_out = 16'h42cb;
              5'h0f: normal_out = 16'h42cc;
              5'h10: normal_out = 16'h42cd;
              5'h11: normal_out = 16'h42ce;
              5'h12: normal_out = 16'h42cf;
              5'h13: normal_out = 16'h42d0;
              5'h14: normal_out = 16'h42d2;
              5'h15: normal_out = 16'h42d3;
              5'h16: normal_out = 16'h42d4;
              5'h17: normal_out = 16'h42d5;
              5'h18: normal_out = 16'h42d6;
              5'h19: normal_out = 16'h42d8;
              5'h1a: normal_out = 16'h42d9;
              5'h1b: normal_out = 16'h42da;
              5'h1c: normal_out = 16'h42db;
              5'h1d: normal_out = 16'h42dc;
              5'h1e: normal_out = 16'h42dd;
              5'h1f: normal_out = 16'h42df;
              default: begin end
            endcase
          end
          5'h19: begin
            normal_out = 16'h42e0;
            case (mant[4:0])
              5'h01: normal_out = 16'h42e1;
              5'h02: normal_out = 16'h42e2;
              5'h03: normal_out = 16'h42e3;
              5'h04: normal_out = 16'h42e5;
              5'h05: normal_out = 16'h42e6;
              5'h06: normal_out = 16'h42e7;
              5'h07: normal_out = 16'h42e8;
              5'h08: normal_out = 16'h42e9;
              5'h09: normal_out = 16'h42eb;
              5'h0a: normal_out = 16'h42ec;
              5'h0b: normal_out = 16'h42ed;
              5'h0c: normal_out = 16'h42ee;
              5'h0d: normal_out = 16'h42ef;
              5'h0e: normal_out = 16'h42f1;
              5'h0f: normal_out = 16'h42f2;
              5'h10: normal_out = 16'h42f3;
              5'h11: normal_out = 16'h42f4;
              5'h12: normal_out = 16'h42f5;
              5'h13: normal_out = 16'h42f7;
              5'h14: normal_out = 16'h42f8;
              5'h15: normal_out = 16'h42f9;
              5'h16: normal_out = 16'h42fa;
              5'h17: normal_out = 16'h42fb;
              5'h18: normal_out = 16'h42fd;
              5'h19: normal_out = 16'h42fe;
              5'h1a: normal_out = 16'h42ff;
              5'h1b: normal_out = 16'h4300;
              5'h1c: normal_out = 16'h4302;
              5'h1d: normal_out = 16'h4303;
              5'h1e: normal_out = 16'h4304;
              5'h1f: normal_out = 16'h4305;
              default: begin end
            endcase
          end
          5'h1a: begin
            normal_out = 16'h4306;
            case (mant[4:0])
              5'h01: normal_out = 16'h4308;
              5'h02: normal_out = 16'h4309;
              5'h03: normal_out = 16'h430a;
              5'h04: normal_out = 16'h430b;
              5'h05: normal_out = 16'h430c;
              5'h06: normal_out = 16'h430e;
              5'h07: normal_out = 16'h430f;
              5'h08: normal_out = 16'h4310;
              5'h09: normal_out = 16'h4311;
              5'h0a: normal_out = 16'h4313;
              5'h0b: normal_out = 16'h4314;
              5'h0c: normal_out = 16'h4315;
              5'h0d: normal_out = 16'h4316;
              5'h0e: normal_out = 16'h4318;
              5'h0f: normal_out = 16'h4319;
              5'h10: normal_out = 16'h431a;
              5'h11: normal_out = 16'h431b;
              5'h12: normal_out = 16'h431c;
              5'h13: normal_out = 16'h431e;
              5'h14: normal_out = 16'h431f;
              5'h15: normal_out = 16'h4320;
              5'h16: normal_out = 16'h4321;
              5'h17: normal_out = 16'h4323;
              5'h18: normal_out = 16'h4324;
              5'h19: normal_out = 16'h4325;
              5'h1a: normal_out = 16'h4326;
              5'h1b: normal_out = 16'h4328;
              5'h1c: normal_out = 16'h4329;
              5'h1d: normal_out = 16'h432a;
              5'h1e: normal_out = 16'h432b;
              5'h1f: normal_out = 16'h432d;
              default: begin end
            endcase
          end
          5'h1b: begin
            normal_out = 16'h432e;
            case (mant[4:0])
              5'h01: normal_out = 16'h432f;
              5'h02: normal_out = 16'h4330;
              5'h03: normal_out = 16'h4332;
              5'h04: normal_out = 16'h4333;
              5'h05: normal_out = 16'h4334;
              5'h06: normal_out = 16'h4335;
              5'h07: normal_out = 16'h4337;
              5'h08: normal_out = 16'h4338;
              5'h09: normal_out = 16'h4339;
              5'h0a: normal_out = 16'h433a;
              5'h0b: normal_out = 16'h433c;
              5'h0c: normal_out = 16'h433d;
              5'h0d: normal_out = 16'h433e;
              5'h0e: normal_out = 16'h433f;
              5'h0f: normal_out = 16'h4341;
              5'h10: normal_out = 16'h4342;
              5'h11: normal_out = 16'h4343;
              5'h12: normal_out = 16'h4344;
              5'h13: normal_out = 16'h4346;
              5'h14: normal_out = 16'h4347;
              5'h15: normal_out = 16'h4348;
              5'h16: normal_out = 16'h4349;
              5'h17: normal_out = 16'h434b;
              5'h18: normal_out = 16'h434c;
              5'h19: normal_out = 16'h434d;
              5'h1a: normal_out = 16'h434e;
              5'h1b: normal_out = 16'h4350;
              5'h1c: normal_out = 16'h4351;
              5'h1d: normal_out = 16'h4352;
              5'h1e: normal_out = 16'h4353;
              5'h1f: normal_out = 16'h4355;
              default: begin end
            endcase
          end
          5'h1c: begin
            normal_out = 16'h4356;
            case (mant[4:0])
              5'h01: normal_out = 16'h4357;
              5'h02: normal_out = 16'h4359;
              5'h03: normal_out = 16'h435a;
              5'h04: normal_out = 16'h435b;
              5'h05: normal_out = 16'h435c;
              5'h06: normal_out = 16'h435e;
              5'h07: normal_out = 16'h435f;
              5'h08: normal_out = 16'h4360;
              5'h09: normal_out = 16'h4362;
              5'h0a: normal_out = 16'h4363;
              5'h0b: normal_out = 16'h4364;
              5'h0c: normal_out = 16'h4365;
              5'h0d: normal_out = 16'h4367;
              5'h0e: normal_out = 16'h4368;
              5'h0f: normal_out = 16'h4369;
              5'h10: normal_out = 16'h436a;
              5'h11: normal_out = 16'h436c;
              5'h12: normal_out = 16'h436d;
              5'h13: normal_out = 16'h436e;
              5'h14: normal_out = 16'h4370;
              5'h15: normal_out = 16'h4371;
              5'h16: normal_out = 16'h4372;
              5'h17: normal_out = 16'h4373;
              5'h18: normal_out = 16'h4375;
              5'h19: normal_out = 16'h4376;
              5'h1a: normal_out = 16'h4377;
              5'h1b: normal_out = 16'h4379;
              5'h1c: normal_out = 16'h437a;
              5'h1d: normal_out = 16'h437b;
              5'h1e: normal_out = 16'h437d;
              5'h1f: normal_out = 16'h437e;
              default: begin end
            endcase
          end
          5'h1d: begin
            normal_out = 16'h437f;
            case (mant[4:0])
              5'h01: normal_out = 16'h4380;
              5'h02: normal_out = 16'h4382;
              5'h03: normal_out = 16'h4383;
              5'h04: normal_out = 16'h4384;
              5'h05: normal_out = 16'h4386;
              5'h06: normal_out = 16'h4387;
              5'h07: normal_out = 16'h4388;
              5'h08: normal_out = 16'h438a;
              5'h09: normal_out = 16'h438b;
              5'h0a: normal_out = 16'h438c;
              5'h0b: normal_out = 16'h438d;
              5'h0c: normal_out = 16'h438f;
              5'h0d: normal_out = 16'h4390;
              5'h0e: normal_out = 16'h4391;
              5'h0f: normal_out = 16'h4393;
              5'h10: normal_out = 16'h4394;
              5'h11: normal_out = 16'h4395;
              5'h12: normal_out = 16'h4397;
              5'h13: normal_out = 16'h4398;
              5'h14: normal_out = 16'h4399;
              5'h15: normal_out = 16'h439b;
              5'h16: normal_out = 16'h439c;
              5'h17: normal_out = 16'h439d;
              5'h18: normal_out = 16'h439f;
              5'h19: normal_out = 16'h43a0;
              5'h1a: normal_out = 16'h43a1;
              5'h1b: normal_out = 16'h43a3;
              5'h1c: normal_out = 16'h43a4;
              5'h1d: normal_out = 16'h43a5;
              5'h1e: normal_out = 16'h43a7;
              5'h1f: normal_out = 16'h43a8;
              default: begin end
            endcase
          end
          5'h1e: begin
            normal_out = 16'h43a9;
            case (mant[4:0])
              5'h01: normal_out = 16'h43aa;
              5'h02: normal_out = 16'h43ac;
              5'h03: normal_out = 16'h43ad;
              5'h04: normal_out = 16'h43ae;
              5'h05: normal_out = 16'h43b0;
              5'h06: normal_out = 16'h43b1;
              5'h07: normal_out = 16'h43b2;
              5'h08: normal_out = 16'h43b4;
              5'h09: normal_out = 16'h43b5;
              5'h0a: normal_out = 16'h43b6;
              5'h0b: normal_out = 16'h43b8;
              5'h0c: normal_out = 16'h43b9;
              5'h0d: normal_out = 16'h43bb;
              5'h0e: normal_out = 16'h43bc;
              5'h0f: normal_out = 16'h43bd;
              5'h10: normal_out = 16'h43bf;
              5'h11: normal_out = 16'h43c0;
              5'h12: normal_out = 16'h43c1;
              5'h13: normal_out = 16'h43c3;
              5'h14: normal_out = 16'h43c4;
              5'h15: normal_out = 16'h43c5;
              5'h16: normal_out = 16'h43c7;
              5'h17: normal_out = 16'h43c8;
              5'h18: normal_out = 16'h43c9;
              5'h19: normal_out = 16'h43cb;
              5'h1a: normal_out = 16'h43cc;
              5'h1b: normal_out = 16'h43cd;
              5'h1c: normal_out = 16'h43cf;
              5'h1d: normal_out = 16'h43d0;
              5'h1e: normal_out = 16'h43d1;
              5'h1f: normal_out = 16'h43d3;
              default: begin end
            endcase
          end
          5'h1f: begin
            normal_out = 16'h43d4;
            case (mant[4:0])
              5'h01: normal_out = 16'h43d5;
              5'h02: normal_out = 16'h43d7;
              5'h03: normal_out = 16'h43d8;
              5'h04: normal_out = 16'h43da;
              5'h05: normal_out = 16'h43db;
              5'h06: normal_out = 16'h43dc;
              5'h07: normal_out = 16'h43de;
              5'h08: normal_out = 16'h43df;
              5'h09: normal_out = 16'h43e0;
              5'h0a: normal_out = 16'h43e2;
              5'h0b: normal_out = 16'h43e3;
              5'h0c: normal_out = 16'h43e4;
              5'h0d: normal_out = 16'h43e6;
              5'h0e: normal_out = 16'h43e7;
              5'h0f: normal_out = 16'h43e9;
              5'h10: normal_out = 16'h43ea;
              5'h11: normal_out = 16'h43eb;
              5'h12: normal_out = 16'h43ed;
              5'h13: normal_out = 16'h43ee;
              5'h14: normal_out = 16'h43ef;
              5'h15: normal_out = 16'h43f1;
              5'h16: normal_out = 16'h43f2;
              5'h17: normal_out = 16'h43f4;
              5'h18: normal_out = 16'h43f5;
              5'h19: normal_out = 16'h43f6;
              5'h1a: normal_out = 16'h43f8;
              5'h1b: normal_out = 16'h43f9;
              5'h1c: normal_out = 16'h43fa;
              5'h1d: normal_out = 16'h43fc;
              5'h1e: normal_out = 16'h43fd;
              5'h1f: normal_out = 16'h43ff;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      6'h10: begin
        case (mant[9:5])
          5'h00: begin
            normal_out = 16'h4400;
            case (mant[4:0])
              5'h01: normal_out = 16'h4401;
              5'h02: normal_out = 16'h4403;
              5'h03: normal_out = 16'h4404;
              5'h04: normal_out = 16'h4406;
              5'h05: normal_out = 16'h4407;
              5'h06: normal_out = 16'h4408;
              5'h07: normal_out = 16'h440a;
              5'h08: normal_out = 16'h440b;
              5'h09: normal_out = 16'h440d;
              5'h0a: normal_out = 16'h440e;
              5'h0b: normal_out = 16'h440f;
              5'h0c: normal_out = 16'h4411;
              5'h0d: normal_out = 16'h4412;
              5'h0e: normal_out = 16'h4414;
              5'h0f: normal_out = 16'h4415;
              5'h10: normal_out = 16'h4416;
              5'h11: normal_out = 16'h4418;
              5'h12: normal_out = 16'h4419;
              5'h13: normal_out = 16'h441b;
              5'h14: normal_out = 16'h441c;
              5'h15: normal_out = 16'h441e;
              5'h16: normal_out = 16'h441f;
              5'h17: normal_out = 16'h4420;
              5'h18: normal_out = 16'h4422;
              5'h19: normal_out = 16'h4423;
              5'h1a: normal_out = 16'h4425;
              5'h1b: normal_out = 16'h4426;
              5'h1c: normal_out = 16'h4428;
              5'h1d: normal_out = 16'h4429;
              5'h1e: normal_out = 16'h442a;
              5'h1f: normal_out = 16'h442c;
              default: begin end
            endcase
          end
          5'h01: begin
            normal_out = 16'h442d;
            case (mant[4:0])
              5'h01: normal_out = 16'h442f;
              5'h02: normal_out = 16'h4430;
              5'h03: normal_out = 16'h4432;
              5'h04: normal_out = 16'h4433;
              5'h05: normal_out = 16'h4435;
              5'h06: normal_out = 16'h4436;
              5'h07: normal_out = 16'h4438;
              5'h08: normal_out = 16'h4439;
              5'h09: normal_out = 16'h443a;
              5'h0a: normal_out = 16'h443c;
              5'h0b: normal_out = 16'h443d;
              5'h0c: normal_out = 16'h443f;
              5'h0d: normal_out = 16'h4440;
              5'h0e: normal_out = 16'h4442;
              5'h0f: normal_out = 16'h4443;
              5'h10: normal_out = 16'h4445;
              5'h11: normal_out = 16'h4446;
              5'h12: normal_out = 16'h4448;
              5'h13: normal_out = 16'h4449;
              5'h14: normal_out = 16'h444b;
              5'h15: normal_out = 16'h444c;
              5'h16: normal_out = 16'h444e;
              5'h17: normal_out = 16'h444f;
              5'h18: normal_out = 16'h4451;
              5'h19: normal_out = 16'h4452;
              5'h1a: normal_out = 16'h4454;
              5'h1b: normal_out = 16'h4455;
              5'h1c: normal_out = 16'h4457;
              5'h1d: normal_out = 16'h4458;
              5'h1e: normal_out = 16'h445a;
              5'h1f: normal_out = 16'h445b;
              default: begin end
            endcase
          end
          5'h02: begin
            normal_out = 16'h445d;
            case (mant[4:0])
              5'h01: normal_out = 16'h445e;
              5'h02: normal_out = 16'h4460;
              5'h03: normal_out = 16'h4461;
              5'h04: normal_out = 16'h4463;
              5'h05: normal_out = 16'h4464;
              5'h06: normal_out = 16'h4466;
              5'h07: normal_out = 16'h4467;
              5'h08: normal_out = 16'h4469;
              5'h09: normal_out = 16'h446a;
              5'h0a: normal_out = 16'h446c;
              5'h0b: normal_out = 16'h446d;
              5'h0c: normal_out = 16'h446f;
              5'h0d: normal_out = 16'h4471;
              5'h0e: normal_out = 16'h4472;
              5'h0f: normal_out = 16'h4474;
              5'h10: normal_out = 16'h4475;
              5'h11: normal_out = 16'h4477;
              5'h12: normal_out = 16'h4478;
              5'h13: normal_out = 16'h447a;
              5'h14: normal_out = 16'h447b;
              5'h15: normal_out = 16'h447d;
              5'h16: normal_out = 16'h447e;
              5'h17: normal_out = 16'h4480;
              5'h18: normal_out = 16'h4482;
              5'h19: normal_out = 16'h4483;
              5'h1a: normal_out = 16'h4485;
              5'h1b: normal_out = 16'h4486;
              5'h1c: normal_out = 16'h4488;
              5'h1d: normal_out = 16'h4489;
              5'h1e: normal_out = 16'h448b;
              5'h1f: normal_out = 16'h448d;
              default: begin end
            endcase
          end
          5'h03: begin
            normal_out = 16'h448e;
            case (mant[4:0])
              5'h01: normal_out = 16'h4490;
              5'h02: normal_out = 16'h4491;
              5'h03: normal_out = 16'h4493;
              5'h04: normal_out = 16'h4494;
              5'h05: normal_out = 16'h4496;
              5'h06: normal_out = 16'h4498;
              5'h07: normal_out = 16'h4499;
              5'h08: normal_out = 16'h449b;
              5'h09: normal_out = 16'h449c;
              5'h0a: normal_out = 16'h449e;
              5'h0b: normal_out = 16'h44a0;
              5'h0c: normal_out = 16'h44a1;
              5'h0d: normal_out = 16'h44a3;
              5'h0e: normal_out = 16'h44a4;
              5'h0f: normal_out = 16'h44a6;
              5'h10: normal_out = 16'h44a8;
              5'h11: normal_out = 16'h44a9;
              5'h12: normal_out = 16'h44ab;
              5'h13: normal_out = 16'h44ad;
              5'h14: normal_out = 16'h44ae;
              5'h15: normal_out = 16'h44b0;
              5'h16: normal_out = 16'h44b1;
              5'h17: normal_out = 16'h44b3;
              5'h18: normal_out = 16'h44b5;
              5'h19: normal_out = 16'h44b6;
              5'h1a: normal_out = 16'h44b8;
              5'h1b: normal_out = 16'h44ba;
              5'h1c: normal_out = 16'h44bb;
              5'h1d: normal_out = 16'h44bd;
              5'h1e: normal_out = 16'h44be;
              5'h1f: normal_out = 16'h44c0;
              default: begin end
            endcase
          end
          5'h04: begin
            normal_out = 16'h44c2;
            case (mant[4:0])
              5'h01: normal_out = 16'h44c3;
              5'h02: normal_out = 16'h44c5;
              5'h03: normal_out = 16'h44c7;
              5'h04: normal_out = 16'h44c8;
              5'h05: normal_out = 16'h44ca;
              5'h06: normal_out = 16'h44cc;
              5'h07: normal_out = 16'h44cd;
              5'h08: normal_out = 16'h44cf;
              5'h09: normal_out = 16'h44d1;
              5'h0a: normal_out = 16'h44d2;
              5'h0b: normal_out = 16'h44d4;
              5'h0c: normal_out = 16'h44d6;
              5'h0d: normal_out = 16'h44d7;
              5'h0e: normal_out = 16'h44d9;
              5'h0f: normal_out = 16'h44db;
              5'h10: normal_out = 16'h44dc;
              5'h11: normal_out = 16'h44de;
              5'h12: normal_out = 16'h44e0;
              5'h13: normal_out = 16'h44e1;
              5'h14: normal_out = 16'h44e3;
              5'h15: normal_out = 16'h44e5;
              5'h16: normal_out = 16'h44e7;
              5'h17: normal_out = 16'h44e8;
              5'h18: normal_out = 16'h44ea;
              5'h19: normal_out = 16'h44ec;
              5'h1a: normal_out = 16'h44ed;
              5'h1b: normal_out = 16'h44ef;
              5'h1c: normal_out = 16'h44f1;
              5'h1d: normal_out = 16'h44f3;
              5'h1e: normal_out = 16'h44f4;
              5'h1f: normal_out = 16'h44f6;
              default: begin end
            endcase
          end
          5'h05: begin
            normal_out = 16'h44f8;
            case (mant[4:0])
              5'h01: normal_out = 16'h44f9;
              5'h02: normal_out = 16'h44fb;
              5'h03: normal_out = 16'h44fd;
              5'h04: normal_out = 16'h44ff;
              5'h05: normal_out = 16'h4500;
              5'h06: normal_out = 16'h4502;
              5'h07: normal_out = 16'h4504;
              5'h08: normal_out = 16'h4506;
              5'h09: normal_out = 16'h4507;
              5'h0a: normal_out = 16'h4509;
              5'h0b: normal_out = 16'h450b;
              5'h0c: normal_out = 16'h450c;
              5'h0d: normal_out = 16'h450e;
              5'h0e: normal_out = 16'h4510;
              5'h0f: normal_out = 16'h4512;
              5'h10: normal_out = 16'h4514;
              5'h11: normal_out = 16'h4515;
              5'h12: normal_out = 16'h4517;
              5'h13: normal_out = 16'h4519;
              5'h14: normal_out = 16'h451b;
              5'h15: normal_out = 16'h451c;
              5'h16: normal_out = 16'h451e;
              5'h17: normal_out = 16'h4520;
              5'h18: normal_out = 16'h4522;
              5'h19: normal_out = 16'h4523;
              5'h1a: normal_out = 16'h4525;
              5'h1b: normal_out = 16'h4527;
              5'h1c: normal_out = 16'h4529;
              5'h1d: normal_out = 16'h452b;
              5'h1e: normal_out = 16'h452c;
              5'h1f: normal_out = 16'h452e;
              default: begin end
            endcase
          end
          5'h06: begin
            normal_out = 16'h4530;
            case (mant[4:0])
              5'h01: normal_out = 16'h4532;
              5'h02: normal_out = 16'h4534;
              5'h03: normal_out = 16'h4535;
              5'h04: normal_out = 16'h4537;
              5'h05: normal_out = 16'h4539;
              5'h06: normal_out = 16'h453b;
              5'h07: normal_out = 16'h453d;
              5'h08: normal_out = 16'h453e;
              5'h09: normal_out = 16'h4540;
              5'h0a: normal_out = 16'h4542;
              5'h0b: normal_out = 16'h4544;
              5'h0c: normal_out = 16'h4546;
              5'h0d: normal_out = 16'h4548;
              5'h0e: normal_out = 16'h4549;
              5'h0f: normal_out = 16'h454b;
              5'h10: normal_out = 16'h454d;
              5'h11: normal_out = 16'h454f;
              5'h12: normal_out = 16'h4551;
              5'h13: normal_out = 16'h4553;
              5'h14: normal_out = 16'h4554;
              5'h15: normal_out = 16'h4556;
              5'h16: normal_out = 16'h4558;
              5'h17: normal_out = 16'h455a;
              5'h18: normal_out = 16'h455c;
              5'h19: normal_out = 16'h455e;
              5'h1a: normal_out = 16'h4560;
              5'h1b: normal_out = 16'h4561;
              5'h1c: normal_out = 16'h4563;
              5'h1d: normal_out = 16'h4565;
              5'h1e: normal_out = 16'h4567;
              5'h1f: normal_out = 16'h4569;
              default: begin end
            endcase
          end
          5'h07: begin
            normal_out = 16'h456b;
            case (mant[4:0])
              5'h01: normal_out = 16'h456d;
              5'h02: normal_out = 16'h456f;
              5'h03: normal_out = 16'h4570;
              5'h04: normal_out = 16'h4572;
              5'h05: normal_out = 16'h4574;
              5'h06: normal_out = 16'h4576;
              5'h07: normal_out = 16'h4578;
              5'h08: normal_out = 16'h457a;
              5'h09: normal_out = 16'h457c;
              5'h0a: normal_out = 16'h457e;
              5'h0b: normal_out = 16'h4580;
              5'h0c: normal_out = 16'h4581;
              5'h0d: normal_out = 16'h4583;
              5'h0e: normal_out = 16'h4585;
              5'h0f: normal_out = 16'h4587;
              5'h10: normal_out = 16'h4589;
              5'h11: normal_out = 16'h458b;
              5'h12: normal_out = 16'h458d;
              5'h13: normal_out = 16'h458f;
              5'h14: normal_out = 16'h4591;
              5'h15: normal_out = 16'h4593;
              5'h16: normal_out = 16'h4595;
              5'h17: normal_out = 16'h4597;
              5'h18: normal_out = 16'h4599;
              5'h19: normal_out = 16'h459a;
              5'h1a: normal_out = 16'h459c;
              5'h1b: normal_out = 16'h459e;
              5'h1c: normal_out = 16'h45a0;
              5'h1d: normal_out = 16'h45a2;
              5'h1e: normal_out = 16'h45a4;
              5'h1f: normal_out = 16'h45a6;
              default: begin end
            endcase
          end
          5'h08: begin
            normal_out = 16'h45a8;
            case (mant[4:0])
              5'h01: normal_out = 16'h45aa;
              5'h02: normal_out = 16'h45ac;
              5'h03: normal_out = 16'h45ae;
              5'h04: normal_out = 16'h45b0;
              5'h05: normal_out = 16'h45b2;
              5'h06: normal_out = 16'h45b4;
              5'h07: normal_out = 16'h45b6;
              5'h08: normal_out = 16'h45b8;
              5'h09: normal_out = 16'h45ba;
              5'h0a: normal_out = 16'h45bc;
              5'h0b: normal_out = 16'h45be;
              5'h0c: normal_out = 16'h45c0;
              5'h0d: normal_out = 16'h45c2;
              5'h0e: normal_out = 16'h45c4;
              5'h0f: normal_out = 16'h45c6;
              5'h10: normal_out = 16'h45c8;
              5'h11: normal_out = 16'h45ca;
              5'h12: normal_out = 16'h45cc;
              5'h13: normal_out = 16'h45ce;
              5'h14: normal_out = 16'h45d0;
              5'h15: normal_out = 16'h45d2;
              5'h16: normal_out = 16'h45d4;
              5'h17: normal_out = 16'h45d6;
              5'h18: normal_out = 16'h45d8;
              5'h19: normal_out = 16'h45da;
              5'h1a: normal_out = 16'h45dc;
              5'h1b: normal_out = 16'h45de;
              5'h1c: normal_out = 16'h45e0;
              5'h1d: normal_out = 16'h45e2;
              5'h1e: normal_out = 16'h45e4;
              5'h1f: normal_out = 16'h45e6;
              default: begin end
            endcase
          end
          5'h09: begin
            normal_out = 16'h45e8;
            case (mant[4:0])
              5'h01: normal_out = 16'h45ea;
              5'h02: normal_out = 16'h45ec;
              5'h03: normal_out = 16'h45ee;
              5'h04: normal_out = 16'h45f0;
              5'h05: normal_out = 16'h45f3;
              5'h06: normal_out = 16'h45f5;
              5'h07: normal_out = 16'h45f7;
              5'h08: normal_out = 16'h45f9;
              5'h09: normal_out = 16'h45fb;
              5'h0a: normal_out = 16'h45fd;
              5'h0b: normal_out = 16'h45ff;
              5'h0c: normal_out = 16'h4601;
              5'h0d: normal_out = 16'h4603;
              5'h0e: normal_out = 16'h4605;
              5'h0f: normal_out = 16'h4607;
              5'h10: normal_out = 16'h4609;
              5'h11: normal_out = 16'h460b;
              5'h12: normal_out = 16'h460e;
              5'h13: normal_out = 16'h4610;
              5'h14: normal_out = 16'h4612;
              5'h15: normal_out = 16'h4614;
              5'h16: normal_out = 16'h4616;
              5'h17: normal_out = 16'h4618;
              5'h18: normal_out = 16'h461a;
              5'h19: normal_out = 16'h461c;
              5'h1a: normal_out = 16'h461e;
              5'h1b: normal_out = 16'h4621;
              5'h1c: normal_out = 16'h4623;
              5'h1d: normal_out = 16'h4625;
              5'h1e: normal_out = 16'h4627;
              5'h1f: normal_out = 16'h4629;
              default: begin end
            endcase
          end
          5'h0a: begin
            normal_out = 16'h462b;
            case (mant[4:0])
              5'h01: normal_out = 16'h462d;
              5'h02: normal_out = 16'h4630;
              5'h03: normal_out = 16'h4632;
              5'h04: normal_out = 16'h4634;
              5'h05: normal_out = 16'h4636;
              5'h06: normal_out = 16'h4638;
              5'h07: normal_out = 16'h463a;
              5'h08: normal_out = 16'h463c;
              5'h09: normal_out = 16'h463f;
              5'h0a: normal_out = 16'h4641;
              5'h0b: normal_out = 16'h4643;
              5'h0c: normal_out = 16'h4645;
              5'h0d: normal_out = 16'h4647;
              5'h0e: normal_out = 16'h4649;
              5'h0f: normal_out = 16'h464c;
              5'h10: normal_out = 16'h464e;
              5'h11: normal_out = 16'h4650;
              5'h12: normal_out = 16'h4652;
              5'h13: normal_out = 16'h4654;
              5'h14: normal_out = 16'h4657;
              5'h15: normal_out = 16'h4659;
              5'h16: normal_out = 16'h465b;
              5'h17: normal_out = 16'h465d;
              5'h18: normal_out = 16'h465f;
              5'h19: normal_out = 16'h4662;
              5'h1a: normal_out = 16'h4664;
              5'h1b: normal_out = 16'h4666;
              5'h1c: normal_out = 16'h4668;
              5'h1d: normal_out = 16'h466a;
              5'h1e: normal_out = 16'h466d;
              5'h1f: normal_out = 16'h466f;
              default: begin end
            endcase
          end
          5'h0b: begin
            normal_out = 16'h4671;
            case (mant[4:0])
              5'h01: normal_out = 16'h4673;
              5'h02: normal_out = 16'h4676;
              5'h03: normal_out = 16'h4678;
              5'h04: normal_out = 16'h467a;
              5'h05: normal_out = 16'h467c;
              5'h06: normal_out = 16'h467f;
              5'h07: normal_out = 16'h4681;
              5'h08: normal_out = 16'h4683;
              5'h09: normal_out = 16'h4685;
              5'h0a: normal_out = 16'h4688;
              5'h0b: normal_out = 16'h468a;
              5'h0c: normal_out = 16'h468c;
              5'h0d: normal_out = 16'h468e;
              5'h0e: normal_out = 16'h4691;
              5'h0f: normal_out = 16'h4693;
              5'h10: normal_out = 16'h4695;
              5'h11: normal_out = 16'h4698;
              5'h12: normal_out = 16'h469a;
              5'h13: normal_out = 16'h469c;
              5'h14: normal_out = 16'h469e;
              5'h15: normal_out = 16'h46a1;
              5'h16: normal_out = 16'h46a3;
              5'h17: normal_out = 16'h46a5;
              5'h18: normal_out = 16'h46a8;
              5'h19: normal_out = 16'h46aa;
              5'h1a: normal_out = 16'h46ac;
              5'h1b: normal_out = 16'h46af;
              5'h1c: normal_out = 16'h46b1;
              5'h1d: normal_out = 16'h46b3;
              5'h1e: normal_out = 16'h46b5;
              5'h1f: normal_out = 16'h46b8;
              default: begin end
            endcase
          end
          5'h0c: begin
            normal_out = 16'h46ba;
            case (mant[4:0])
              5'h01: normal_out = 16'h46bc;
              5'h02: normal_out = 16'h46bf;
              5'h03: normal_out = 16'h46c1;
              5'h04: normal_out = 16'h46c4;
              5'h05: normal_out = 16'h46c6;
              5'h06: normal_out = 16'h46c8;
              5'h07: normal_out = 16'h46cb;
              5'h08: normal_out = 16'h46cd;
              5'h09: normal_out = 16'h46cf;
              5'h0a: normal_out = 16'h46d2;
              5'h0b: normal_out = 16'h46d4;
              5'h0c: normal_out = 16'h46d6;
              5'h0d: normal_out = 16'h46d9;
              5'h0e: normal_out = 16'h46db;
              5'h0f: normal_out = 16'h46dd;
              5'h10: normal_out = 16'h46e0;
              5'h11: normal_out = 16'h46e2;
              5'h12: normal_out = 16'h46e5;
              5'h13: normal_out = 16'h46e7;
              5'h14: normal_out = 16'h46e9;
              5'h15: normal_out = 16'h46ec;
              5'h16: normal_out = 16'h46ee;
              5'h17: normal_out = 16'h46f1;
              5'h18: normal_out = 16'h46f3;
              5'h19: normal_out = 16'h46f5;
              5'h1a: normal_out = 16'h46f8;
              5'h1b: normal_out = 16'h46fa;
              5'h1c: normal_out = 16'h46fd;
              5'h1d: normal_out = 16'h46ff;
              5'h1e: normal_out = 16'h4702;
              5'h1f: normal_out = 16'h4704;
              default: begin end
            endcase
          end
          5'h0d: begin
            normal_out = 16'h4706;
            case (mant[4:0])
              5'h01: normal_out = 16'h4709;
              5'h02: normal_out = 16'h470b;
              5'h03: normal_out = 16'h470e;
              5'h04: normal_out = 16'h4710;
              5'h05: normal_out = 16'h4713;
              5'h06: normal_out = 16'h4715;
              5'h07: normal_out = 16'h4718;
              5'h08: normal_out = 16'h471a;
              5'h09: normal_out = 16'h471c;
              5'h0a: normal_out = 16'h471f;
              5'h0b: normal_out = 16'h4721;
              5'h0c: normal_out = 16'h4724;
              5'h0d: normal_out = 16'h4726;
              5'h0e: normal_out = 16'h4729;
              5'h0f: normal_out = 16'h472b;
              5'h10: normal_out = 16'h472e;
              5'h11: normal_out = 16'h4730;
              5'h12: normal_out = 16'h4733;
              5'h13: normal_out = 16'h4735;
              5'h14: normal_out = 16'h4738;
              5'h15: normal_out = 16'h473a;
              5'h16: normal_out = 16'h473d;
              5'h17: normal_out = 16'h473f;
              5'h18: normal_out = 16'h4742;
              5'h19: normal_out = 16'h4744;
              5'h1a: normal_out = 16'h4747;
              5'h1b: normal_out = 16'h4749;
              5'h1c: normal_out = 16'h474c;
              5'h1d: normal_out = 16'h474e;
              5'h1e: normal_out = 16'h4751;
              5'h1f: normal_out = 16'h4753;
              default: begin end
            endcase
          end
          5'h0e: begin
            normal_out = 16'h4756;
            case (mant[4:0])
              5'h01: normal_out = 16'h4759;
              5'h02: normal_out = 16'h475b;
              5'h03: normal_out = 16'h475e;
              5'h04: normal_out = 16'h4760;
              5'h05: normal_out = 16'h4763;
              5'h06: normal_out = 16'h4765;
              5'h07: normal_out = 16'h4768;
              5'h08: normal_out = 16'h476a;
              5'h09: normal_out = 16'h476d;
              5'h0a: normal_out = 16'h4770;
              5'h0b: normal_out = 16'h4772;
              5'h0c: normal_out = 16'h4775;
              5'h0d: normal_out = 16'h4777;
              5'h0e: normal_out = 16'h477a;
              5'h0f: normal_out = 16'h477d;
              5'h10: normal_out = 16'h477f;
              5'h11: normal_out = 16'h4782;
              5'h12: normal_out = 16'h4784;
              5'h13: normal_out = 16'h4787;
              5'h14: normal_out = 16'h478a;
              5'h15: normal_out = 16'h478c;
              5'h16: normal_out = 16'h478f;
              5'h17: normal_out = 16'h4791;
              5'h18: normal_out = 16'h4794;
              5'h19: normal_out = 16'h4797;
              5'h1a: normal_out = 16'h4799;
              5'h1b: normal_out = 16'h479c;
              5'h1c: normal_out = 16'h479f;
              5'h1d: normal_out = 16'h47a1;
              5'h1e: normal_out = 16'h47a4;
              5'h1f: normal_out = 16'h47a7;
              default: begin end
            endcase
          end
          5'h0f: begin
            normal_out = 16'h47a9;
            case (mant[4:0])
              5'h01: normal_out = 16'h47ac;
              5'h02: normal_out = 16'h47ae;
              5'h03: normal_out = 16'h47b1;
              5'h04: normal_out = 16'h47b4;
              5'h05: normal_out = 16'h47b6;
              5'h06: normal_out = 16'h47b9;
              5'h07: normal_out = 16'h47bc;
              5'h08: normal_out = 16'h47bf;
              5'h09: normal_out = 16'h47c1;
              5'h0a: normal_out = 16'h47c4;
              5'h0b: normal_out = 16'h47c7;
              5'h0c: normal_out = 16'h47c9;
              5'h0d: normal_out = 16'h47cc;
              5'h0e: normal_out = 16'h47cf;
              5'h0f: normal_out = 16'h47d1;
              5'h10: normal_out = 16'h47d4;
              5'h11: normal_out = 16'h47d7;
              5'h12: normal_out = 16'h47da;
              5'h13: normal_out = 16'h47dc;
              5'h14: normal_out = 16'h47df;
              5'h15: normal_out = 16'h47e2;
              5'h16: normal_out = 16'h47e4;
              5'h17: normal_out = 16'h47e7;
              5'h18: normal_out = 16'h47ea;
              5'h19: normal_out = 16'h47ed;
              5'h1a: normal_out = 16'h47ef;
              5'h1b: normal_out = 16'h47f2;
              5'h1c: normal_out = 16'h47f5;
              5'h1d: normal_out = 16'h47f8;
              5'h1e: normal_out = 16'h47fa;
              5'h1f: normal_out = 16'h47fd;
              default: begin end
            endcase
          end
          5'h10: begin
            normal_out = 16'h4800;
            case (mant[4:0])
              5'h01: normal_out = 16'h4801;
              5'h02: normal_out = 16'h4803;
              5'h03: normal_out = 16'h4804;
              5'h04: normal_out = 16'h4806;
              5'h05: normal_out = 16'h4807;
              5'h06: normal_out = 16'h4808;
              5'h07: normal_out = 16'h480a;
              5'h08: normal_out = 16'h480b;
              5'h09: normal_out = 16'h480d;
              5'h0a: normal_out = 16'h480e;
              5'h0b: normal_out = 16'h480f;
              5'h0c: normal_out = 16'h4811;
              5'h0d: normal_out = 16'h4812;
              5'h0e: normal_out = 16'h4814;
              5'h0f: normal_out = 16'h4815;
              5'h10: normal_out = 16'h4816;
              5'h11: normal_out = 16'h4818;
              5'h12: normal_out = 16'h4819;
              5'h13: normal_out = 16'h481b;
              5'h14: normal_out = 16'h481c;
              5'h15: normal_out = 16'h481e;
              5'h16: normal_out = 16'h481f;
              5'h17: normal_out = 16'h4820;
              5'h18: normal_out = 16'h4822;
              5'h19: normal_out = 16'h4823;
              5'h1a: normal_out = 16'h4825;
              5'h1b: normal_out = 16'h4826;
              5'h1c: normal_out = 16'h4828;
              5'h1d: normal_out = 16'h4829;
              5'h1e: normal_out = 16'h482a;
              5'h1f: normal_out = 16'h482c;
              default: begin end
            endcase
          end
          5'h11: begin
            normal_out = 16'h482d;
            case (mant[4:0])
              5'h01: normal_out = 16'h482f;
              5'h02: normal_out = 16'h4830;
              5'h03: normal_out = 16'h4832;
              5'h04: normal_out = 16'h4833;
              5'h05: normal_out = 16'h4835;
              5'h06: normal_out = 16'h4836;
              5'h07: normal_out = 16'h4838;
              5'h08: normal_out = 16'h4839;
              5'h09: normal_out = 16'h483a;
              5'h0a: normal_out = 16'h483c;
              5'h0b: normal_out = 16'h483d;
              5'h0c: normal_out = 16'h483f;
              5'h0d: normal_out = 16'h4840;
              5'h0e: normal_out = 16'h4842;
              5'h0f: normal_out = 16'h4843;
              5'h10: normal_out = 16'h4845;
              5'h11: normal_out = 16'h4846;
              5'h12: normal_out = 16'h4848;
              5'h13: normal_out = 16'h4849;
              5'h14: normal_out = 16'h484b;
              5'h15: normal_out = 16'h484c;
              5'h16: normal_out = 16'h484e;
              5'h17: normal_out = 16'h484f;
              5'h18: normal_out = 16'h4851;
              5'h19: normal_out = 16'h4852;
              5'h1a: normal_out = 16'h4854;
              5'h1b: normal_out = 16'h4855;
              5'h1c: normal_out = 16'h4857;
              5'h1d: normal_out = 16'h4858;
              5'h1e: normal_out = 16'h485a;
              5'h1f: normal_out = 16'h485b;
              default: begin end
            endcase
          end
          5'h12: begin
            normal_out = 16'h485d;
            case (mant[4:0])
              5'h01: normal_out = 16'h485e;
              5'h02: normal_out = 16'h4860;
              5'h03: normal_out = 16'h4861;
              5'h04: normal_out = 16'h4863;
              5'h05: normal_out = 16'h4864;
              5'h06: normal_out = 16'h4866;
              5'h07: normal_out = 16'h4867;
              5'h08: normal_out = 16'h4869;
              5'h09: normal_out = 16'h486a;
              5'h0a: normal_out = 16'h486c;
              5'h0b: normal_out = 16'h486d;
              5'h0c: normal_out = 16'h486f;
              5'h0d: normal_out = 16'h4871;
              5'h0e: normal_out = 16'h4872;
              5'h0f: normal_out = 16'h4874;
              5'h10: normal_out = 16'h4875;
              5'h11: normal_out = 16'h4877;
              5'h12: normal_out = 16'h4878;
              5'h13: normal_out = 16'h487a;
              5'h14: normal_out = 16'h487b;
              5'h15: normal_out = 16'h487d;
              5'h16: normal_out = 16'h487e;
              5'h17: normal_out = 16'h4880;
              5'h18: normal_out = 16'h4882;
              5'h19: normal_out = 16'h4883;
              5'h1a: normal_out = 16'h4885;
              5'h1b: normal_out = 16'h4886;
              5'h1c: normal_out = 16'h4888;
              5'h1d: normal_out = 16'h4889;
              5'h1e: normal_out = 16'h488b;
              5'h1f: normal_out = 16'h488d;
              default: begin end
            endcase
          end
          5'h13: begin
            normal_out = 16'h488e;
            case (mant[4:0])
              5'h01: normal_out = 16'h4890;
              5'h02: normal_out = 16'h4891;
              5'h03: normal_out = 16'h4893;
              5'h04: normal_out = 16'h4894;
              5'h05: normal_out = 16'h4896;
              5'h06: normal_out = 16'h4898;
              5'h07: normal_out = 16'h4899;
              5'h08: normal_out = 16'h489b;
              5'h09: normal_out = 16'h489c;
              5'h0a: normal_out = 16'h489e;
              5'h0b: normal_out = 16'h48a0;
              5'h0c: normal_out = 16'h48a1;
              5'h0d: normal_out = 16'h48a3;
              5'h0e: normal_out = 16'h48a4;
              5'h0f: normal_out = 16'h48a6;
              5'h10: normal_out = 16'h48a8;
              5'h11: normal_out = 16'h48a9;
              5'h12: normal_out = 16'h48ab;
              5'h13: normal_out = 16'h48ad;
              5'h14: normal_out = 16'h48ae;
              5'h15: normal_out = 16'h48b0;
              5'h16: normal_out = 16'h48b1;
              5'h17: normal_out = 16'h48b3;
              5'h18: normal_out = 16'h48b5;
              5'h19: normal_out = 16'h48b6;
              5'h1a: normal_out = 16'h48b8;
              5'h1b: normal_out = 16'h48ba;
              5'h1c: normal_out = 16'h48bb;
              5'h1d: normal_out = 16'h48bd;
              5'h1e: normal_out = 16'h48be;
              5'h1f: normal_out = 16'h48c0;
              default: begin end
            endcase
          end
          5'h14: begin
            normal_out = 16'h48c2;
            case (mant[4:0])
              5'h01: normal_out = 16'h48c3;
              5'h02: normal_out = 16'h48c5;
              5'h03: normal_out = 16'h48c7;
              5'h04: normal_out = 16'h48c8;
              5'h05: normal_out = 16'h48ca;
              5'h06: normal_out = 16'h48cc;
              5'h07: normal_out = 16'h48cd;
              5'h08: normal_out = 16'h48cf;
              5'h09: normal_out = 16'h48d1;
              5'h0a: normal_out = 16'h48d2;
              5'h0b: normal_out = 16'h48d4;
              5'h0c: normal_out = 16'h48d6;
              5'h0d: normal_out = 16'h48d7;
              5'h0e: normal_out = 16'h48d9;
              5'h0f: normal_out = 16'h48db;
              5'h10: normal_out = 16'h48dc;
              5'h11: normal_out = 16'h48de;
              5'h12: normal_out = 16'h48e0;
              5'h13: normal_out = 16'h48e1;
              5'h14: normal_out = 16'h48e3;
              5'h15: normal_out = 16'h48e5;
              5'h16: normal_out = 16'h48e7;
              5'h17: normal_out = 16'h48e8;
              5'h18: normal_out = 16'h48ea;
              5'h19: normal_out = 16'h48ec;
              5'h1a: normal_out = 16'h48ed;
              5'h1b: normal_out = 16'h48ef;
              5'h1c: normal_out = 16'h48f1;
              5'h1d: normal_out = 16'h48f3;
              5'h1e: normal_out = 16'h48f4;
              5'h1f: normal_out = 16'h48f6;
              default: begin end
            endcase
          end
          5'h15: begin
            normal_out = 16'h48f8;
            case (mant[4:0])
              5'h01: normal_out = 16'h48f9;
              5'h02: normal_out = 16'h48fb;
              5'h03: normal_out = 16'h48fd;
              5'h04: normal_out = 16'h48ff;
              5'h05: normal_out = 16'h4900;
              5'h06: normal_out = 16'h4902;
              5'h07: normal_out = 16'h4904;
              5'h08: normal_out = 16'h4906;
              5'h09: normal_out = 16'h4907;
              5'h0a: normal_out = 16'h4909;
              5'h0b: normal_out = 16'h490b;
              5'h0c: normal_out = 16'h490c;
              5'h0d: normal_out = 16'h490e;
              5'h0e: normal_out = 16'h4910;
              5'h0f: normal_out = 16'h4912;
              5'h10: normal_out = 16'h4914;
              5'h11: normal_out = 16'h4915;
              5'h12: normal_out = 16'h4917;
              5'h13: normal_out = 16'h4919;
              5'h14: normal_out = 16'h491b;
              5'h15: normal_out = 16'h491c;
              5'h16: normal_out = 16'h491e;
              5'h17: normal_out = 16'h4920;
              5'h18: normal_out = 16'h4922;
              5'h19: normal_out = 16'h4923;
              5'h1a: normal_out = 16'h4925;
              5'h1b: normal_out = 16'h4927;
              5'h1c: normal_out = 16'h4929;
              5'h1d: normal_out = 16'h492b;
              5'h1e: normal_out = 16'h492c;
              5'h1f: normal_out = 16'h492e;
              default: begin end
            endcase
          end
          5'h16: begin
            normal_out = 16'h4930;
            case (mant[4:0])
              5'h01: normal_out = 16'h4932;
              5'h02: normal_out = 16'h4934;
              5'h03: normal_out = 16'h4935;
              5'h04: normal_out = 16'h4937;
              5'h05: normal_out = 16'h4939;
              5'h06: normal_out = 16'h493b;
              5'h07: normal_out = 16'h493d;
              5'h08: normal_out = 16'h493e;
              5'h09: normal_out = 16'h4940;
              5'h0a: normal_out = 16'h4942;
              5'h0b: normal_out = 16'h4944;
              5'h0c: normal_out = 16'h4946;
              5'h0d: normal_out = 16'h4948;
              5'h0e: normal_out = 16'h4949;
              5'h0f: normal_out = 16'h494b;
              5'h10: normal_out = 16'h494d;
              5'h11: normal_out = 16'h494f;
              5'h12: normal_out = 16'h4951;
              5'h13: normal_out = 16'h4953;
              5'h14: normal_out = 16'h4954;
              5'h15: normal_out = 16'h4956;
              5'h16: normal_out = 16'h4958;
              5'h17: normal_out = 16'h495a;
              5'h18: normal_out = 16'h495c;
              5'h19: normal_out = 16'h495e;
              5'h1a: normal_out = 16'h4960;
              5'h1b: normal_out = 16'h4961;
              5'h1c: normal_out = 16'h4963;
              5'h1d: normal_out = 16'h4965;
              5'h1e: normal_out = 16'h4967;
              5'h1f: normal_out = 16'h4969;
              default: begin end
            endcase
          end
          5'h17: begin
            normal_out = 16'h496b;
            case (mant[4:0])
              5'h01: normal_out = 16'h496d;
              5'h02: normal_out = 16'h496f;
              5'h03: normal_out = 16'h4970;
              5'h04: normal_out = 16'h4972;
              5'h05: normal_out = 16'h4974;
              5'h06: normal_out = 16'h4976;
              5'h07: normal_out = 16'h4978;
              5'h08: normal_out = 16'h497a;
              5'h09: normal_out = 16'h497c;
              5'h0a: normal_out = 16'h497e;
              5'h0b: normal_out = 16'h4980;
              5'h0c: normal_out = 16'h4981;
              5'h0d: normal_out = 16'h4983;
              5'h0e: normal_out = 16'h4985;
              5'h0f: normal_out = 16'h4987;
              5'h10: normal_out = 16'h4989;
              5'h11: normal_out = 16'h498b;
              5'h12: normal_out = 16'h498d;
              5'h13: normal_out = 16'h498f;
              5'h14: normal_out = 16'h4991;
              5'h15: normal_out = 16'h4993;
              5'h16: normal_out = 16'h4995;
              5'h17: normal_out = 16'h4997;
              5'h18: normal_out = 16'h4999;
              5'h19: normal_out = 16'h499a;
              5'h1a: normal_out = 16'h499c;
              5'h1b: normal_out = 16'h499e;
              5'h1c: normal_out = 16'h49a0;
              5'h1d: normal_out = 16'h49a2;
              5'h1e: normal_out = 16'h49a4;
              5'h1f: normal_out = 16'h49a6;
              default: begin end
            endcase
          end
          5'h18: begin
            normal_out = 16'h49a8;
            case (mant[4:0])
              5'h01: normal_out = 16'h49aa;
              5'h02: normal_out = 16'h49ac;
              5'h03: normal_out = 16'h49ae;
              5'h04: normal_out = 16'h49b0;
              5'h05: normal_out = 16'h49b2;
              5'h06: normal_out = 16'h49b4;
              5'h07: normal_out = 16'h49b6;
              5'h08: normal_out = 16'h49b8;
              5'h09: normal_out = 16'h49ba;
              5'h0a: normal_out = 16'h49bc;
              5'h0b: normal_out = 16'h49be;
              5'h0c: normal_out = 16'h49c0;
              5'h0d: normal_out = 16'h49c2;
              5'h0e: normal_out = 16'h49c4;
              5'h0f: normal_out = 16'h49c6;
              5'h10: normal_out = 16'h49c8;
              5'h11: normal_out = 16'h49ca;
              5'h12: normal_out = 16'h49cc;
              5'h13: normal_out = 16'h49ce;
              5'h14: normal_out = 16'h49d0;
              5'h15: normal_out = 16'h49d2;
              5'h16: normal_out = 16'h49d4;
              5'h17: normal_out = 16'h49d6;
              5'h18: normal_out = 16'h49d8;
              5'h19: normal_out = 16'h49da;
              5'h1a: normal_out = 16'h49dc;
              5'h1b: normal_out = 16'h49de;
              5'h1c: normal_out = 16'h49e0;
              5'h1d: normal_out = 16'h49e2;
              5'h1e: normal_out = 16'h49e4;
              5'h1f: normal_out = 16'h49e6;
              default: begin end
            endcase
          end
          5'h19: begin
            normal_out = 16'h49e8;
            case (mant[4:0])
              5'h01: normal_out = 16'h49ea;
              5'h02: normal_out = 16'h49ec;
              5'h03: normal_out = 16'h49ee;
              5'h04: normal_out = 16'h49f0;
              5'h05: normal_out = 16'h49f3;
              5'h06: normal_out = 16'h49f5;
              5'h07: normal_out = 16'h49f7;
              5'h08: normal_out = 16'h49f9;
              5'h09: normal_out = 16'h49fb;
              5'h0a: normal_out = 16'h49fd;
              5'h0b: normal_out = 16'h49ff;
              5'h0c: normal_out = 16'h4a01;
              5'h0d: normal_out = 16'h4a03;
              5'h0e: normal_out = 16'h4a05;
              5'h0f: normal_out = 16'h4a07;
              5'h10: normal_out = 16'h4a09;
              5'h11: normal_out = 16'h4a0b;
              5'h12: normal_out = 16'h4a0e;
              5'h13: normal_out = 16'h4a10;
              5'h14: normal_out = 16'h4a12;
              5'h15: normal_out = 16'h4a14;
              5'h16: normal_out = 16'h4a16;
              5'h17: normal_out = 16'h4a18;
              5'h18: normal_out = 16'h4a1a;
              5'h19: normal_out = 16'h4a1c;
              5'h1a: normal_out = 16'h4a1e;
              5'h1b: normal_out = 16'h4a21;
              5'h1c: normal_out = 16'h4a23;
              5'h1d: normal_out = 16'h4a25;
              5'h1e: normal_out = 16'h4a27;
              5'h1f: normal_out = 16'h4a29;
              default: begin end
            endcase
          end
          5'h1a: begin
            normal_out = 16'h4a2b;
            case (mant[4:0])
              5'h01: normal_out = 16'h4a2d;
              5'h02: normal_out = 16'h4a30;
              5'h03: normal_out = 16'h4a32;
              5'h04: normal_out = 16'h4a34;
              5'h05: normal_out = 16'h4a36;
              5'h06: normal_out = 16'h4a38;
              5'h07: normal_out = 16'h4a3a;
              5'h08: normal_out = 16'h4a3c;
              5'h09: normal_out = 16'h4a3f;
              5'h0a: normal_out = 16'h4a41;
              5'h0b: normal_out = 16'h4a43;
              5'h0c: normal_out = 16'h4a45;
              5'h0d: normal_out = 16'h4a47;
              5'h0e: normal_out = 16'h4a49;
              5'h0f: normal_out = 16'h4a4c;
              5'h10: normal_out = 16'h4a4e;
              5'h11: normal_out = 16'h4a50;
              5'h12: normal_out = 16'h4a52;
              5'h13: normal_out = 16'h4a54;
              5'h14: normal_out = 16'h4a57;
              5'h15: normal_out = 16'h4a59;
              5'h16: normal_out = 16'h4a5b;
              5'h17: normal_out = 16'h4a5d;
              5'h18: normal_out = 16'h4a5f;
              5'h19: normal_out = 16'h4a62;
              5'h1a: normal_out = 16'h4a64;
              5'h1b: normal_out = 16'h4a66;
              5'h1c: normal_out = 16'h4a68;
              5'h1d: normal_out = 16'h4a6a;
              5'h1e: normal_out = 16'h4a6d;
              5'h1f: normal_out = 16'h4a6f;
              default: begin end
            endcase
          end
          5'h1b: begin
            normal_out = 16'h4a71;
            case (mant[4:0])
              5'h01: normal_out = 16'h4a73;
              5'h02: normal_out = 16'h4a76;
              5'h03: normal_out = 16'h4a78;
              5'h04: normal_out = 16'h4a7a;
              5'h05: normal_out = 16'h4a7c;
              5'h06: normal_out = 16'h4a7f;
              5'h07: normal_out = 16'h4a81;
              5'h08: normal_out = 16'h4a83;
              5'h09: normal_out = 16'h4a85;
              5'h0a: normal_out = 16'h4a88;
              5'h0b: normal_out = 16'h4a8a;
              5'h0c: normal_out = 16'h4a8c;
              5'h0d: normal_out = 16'h4a8e;
              5'h0e: normal_out = 16'h4a91;
              5'h0f: normal_out = 16'h4a93;
              5'h10: normal_out = 16'h4a95;
              5'h11: normal_out = 16'h4a98;
              5'h12: normal_out = 16'h4a9a;
              5'h13: normal_out = 16'h4a9c;
              5'h14: normal_out = 16'h4a9e;
              5'h15: normal_out = 16'h4aa1;
              5'h16: normal_out = 16'h4aa3;
              5'h17: normal_out = 16'h4aa5;
              5'h18: normal_out = 16'h4aa8;
              5'h19: normal_out = 16'h4aaa;
              5'h1a: normal_out = 16'h4aac;
              5'h1b: normal_out = 16'h4aaf;
              5'h1c: normal_out = 16'h4ab1;
              5'h1d: normal_out = 16'h4ab3;
              5'h1e: normal_out = 16'h4ab5;
              5'h1f: normal_out = 16'h4ab8;
              default: begin end
            endcase
          end
          5'h1c: begin
            normal_out = 16'h4aba;
            case (mant[4:0])
              5'h01: normal_out = 16'h4abc;
              5'h02: normal_out = 16'h4abf;
              5'h03: normal_out = 16'h4ac1;
              5'h04: normal_out = 16'h4ac4;
              5'h05: normal_out = 16'h4ac6;
              5'h06: normal_out = 16'h4ac8;
              5'h07: normal_out = 16'h4acb;
              5'h08: normal_out = 16'h4acd;
              5'h09: normal_out = 16'h4acf;
              5'h0a: normal_out = 16'h4ad2;
              5'h0b: normal_out = 16'h4ad4;
              5'h0c: normal_out = 16'h4ad6;
              5'h0d: normal_out = 16'h4ad9;
              5'h0e: normal_out = 16'h4adb;
              5'h0f: normal_out = 16'h4add;
              5'h10: normal_out = 16'h4ae0;
              5'h11: normal_out = 16'h4ae2;
              5'h12: normal_out = 16'h4ae5;
              5'h13: normal_out = 16'h4ae7;
              5'h14: normal_out = 16'h4ae9;
              5'h15: normal_out = 16'h4aec;
              5'h16: normal_out = 16'h4aee;
              5'h17: normal_out = 16'h4af1;
              5'h18: normal_out = 16'h4af3;
              5'h19: normal_out = 16'h4af5;
              5'h1a: normal_out = 16'h4af8;
              5'h1b: normal_out = 16'h4afa;
              5'h1c: normal_out = 16'h4afd;
              5'h1d: normal_out = 16'h4aff;
              5'h1e: normal_out = 16'h4b02;
              5'h1f: normal_out = 16'h4b04;
              default: begin end
            endcase
          end
          5'h1d: begin
            normal_out = 16'h4b06;
            case (mant[4:0])
              5'h01: normal_out = 16'h4b09;
              5'h02: normal_out = 16'h4b0b;
              5'h03: normal_out = 16'h4b0e;
              5'h04: normal_out = 16'h4b10;
              5'h05: normal_out = 16'h4b13;
              5'h06: normal_out = 16'h4b15;
              5'h07: normal_out = 16'h4b18;
              5'h08: normal_out = 16'h4b1a;
              5'h09: normal_out = 16'h4b1c;
              5'h0a: normal_out = 16'h4b1f;
              5'h0b: normal_out = 16'h4b21;
              5'h0c: normal_out = 16'h4b24;
              5'h0d: normal_out = 16'h4b26;
              5'h0e: normal_out = 16'h4b29;
              5'h0f: normal_out = 16'h4b2b;
              5'h10: normal_out = 16'h4b2e;
              5'h11: normal_out = 16'h4b30;
              5'h12: normal_out = 16'h4b33;
              5'h13: normal_out = 16'h4b35;
              5'h14: normal_out = 16'h4b38;
              5'h15: normal_out = 16'h4b3a;
              5'h16: normal_out = 16'h4b3d;
              5'h17: normal_out = 16'h4b3f;
              5'h18: normal_out = 16'h4b42;
              5'h19: normal_out = 16'h4b44;
              5'h1a: normal_out = 16'h4b47;
              5'h1b: normal_out = 16'h4b49;
              5'h1c: normal_out = 16'h4b4c;
              5'h1d: normal_out = 16'h4b4e;
              5'h1e: normal_out = 16'h4b51;
              5'h1f: normal_out = 16'h4b53;
              default: begin end
            endcase
          end
          5'h1e: begin
            normal_out = 16'h4b56;
            case (mant[4:0])
              5'h01: normal_out = 16'h4b59;
              5'h02: normal_out = 16'h4b5b;
              5'h03: normal_out = 16'h4b5e;
              5'h04: normal_out = 16'h4b60;
              5'h05: normal_out = 16'h4b63;
              5'h06: normal_out = 16'h4b65;
              5'h07: normal_out = 16'h4b68;
              5'h08: normal_out = 16'h4b6a;
              5'h09: normal_out = 16'h4b6d;
              5'h0a: normal_out = 16'h4b70;
              5'h0b: normal_out = 16'h4b72;
              5'h0c: normal_out = 16'h4b75;
              5'h0d: normal_out = 16'h4b77;
              5'h0e: normal_out = 16'h4b7a;
              5'h0f: normal_out = 16'h4b7d;
              5'h10: normal_out = 16'h4b7f;
              5'h11: normal_out = 16'h4b82;
              5'h12: normal_out = 16'h4b84;
              5'h13: normal_out = 16'h4b87;
              5'h14: normal_out = 16'h4b8a;
              5'h15: normal_out = 16'h4b8c;
              5'h16: normal_out = 16'h4b8f;
              5'h17: normal_out = 16'h4b91;
              5'h18: normal_out = 16'h4b94;
              5'h19: normal_out = 16'h4b97;
              5'h1a: normal_out = 16'h4b99;
              5'h1b: normal_out = 16'h4b9c;
              5'h1c: normal_out = 16'h4b9f;
              5'h1d: normal_out = 16'h4ba1;
              5'h1e: normal_out = 16'h4ba4;
              5'h1f: normal_out = 16'h4ba7;
              default: begin end
            endcase
          end
          5'h1f: begin
            normal_out = 16'h4ba9;
            case (mant[4:0])
              5'h01: normal_out = 16'h4bac;
              5'h02: normal_out = 16'h4bae;
              5'h03: normal_out = 16'h4bb1;
              5'h04: normal_out = 16'h4bb4;
              5'h05: normal_out = 16'h4bb6;
              5'h06: normal_out = 16'h4bb9;
              5'h07: normal_out = 16'h4bbc;
              5'h08: normal_out = 16'h4bbf;
              5'h09: normal_out = 16'h4bc1;
              5'h0a: normal_out = 16'h4bc4;
              5'h0b: normal_out = 16'h4bc7;
              5'h0c: normal_out = 16'h4bc9;
              5'h0d: normal_out = 16'h4bcc;
              5'h0e: normal_out = 16'h4bcf;
              5'h0f: normal_out = 16'h4bd1;
              5'h10: normal_out = 16'h4bd4;
              5'h11: normal_out = 16'h4bd7;
              5'h12: normal_out = 16'h4bda;
              5'h13: normal_out = 16'h4bdc;
              5'h14: normal_out = 16'h4bdf;
              5'h15: normal_out = 16'h4be2;
              5'h16: normal_out = 16'h4be4;
              5'h17: normal_out = 16'h4be7;
              5'h18: normal_out = 16'h4bea;
              5'h19: normal_out = 16'h4bed;
              5'h1a: normal_out = 16'h4bef;
              5'h1b: normal_out = 16'h4bf2;
              5'h1c: normal_out = 16'h4bf5;
              5'h1d: normal_out = 16'h4bf8;
              5'h1e: normal_out = 16'h4bfa;
              5'h1f: normal_out = 16'h4bfd;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      6'h11: begin
        case (mant[9:5])
          5'h00: begin
            normal_out = 16'h4c00;
            case (mant[4:0])
              5'h01: normal_out = 16'h4c03;
              5'h02: normal_out = 16'h4c06;
              5'h03: normal_out = 16'h4c08;
              5'h04: normal_out = 16'h4c0b;
              5'h05: normal_out = 16'h4c0e;
              5'h06: normal_out = 16'h4c11;
              5'h07: normal_out = 16'h4c14;
              5'h08: normal_out = 16'h4c16;
              5'h09: normal_out = 16'h4c19;
              5'h0a: normal_out = 16'h4c1c;
              5'h0b: normal_out = 16'h4c1f;
              5'h0c: normal_out = 16'h4c22;
              5'h0d: normal_out = 16'h4c25;
              5'h0e: normal_out = 16'h4c28;
              5'h0f: normal_out = 16'h4c2a;
              5'h10: normal_out = 16'h4c2d;
              5'h11: normal_out = 16'h4c30;
              5'h12: normal_out = 16'h4c33;
              5'h13: normal_out = 16'h4c36;
              5'h14: normal_out = 16'h4c39;
              5'h15: normal_out = 16'h4c3c;
              5'h16: normal_out = 16'h4c3f;
              5'h17: normal_out = 16'h4c42;
              5'h18: normal_out = 16'h4c45;
              5'h19: normal_out = 16'h4c48;
              5'h1a: normal_out = 16'h4c4b;
              5'h1b: normal_out = 16'h4c4e;
              5'h1c: normal_out = 16'h4c51;
              5'h1d: normal_out = 16'h4c54;
              5'h1e: normal_out = 16'h4c57;
              5'h1f: normal_out = 16'h4c5a;
              default: begin end
            endcase
          end
          5'h01: begin
            normal_out = 16'h4c5d;
            case (mant[4:0])
              5'h01: normal_out = 16'h4c60;
              5'h02: normal_out = 16'h4c63;
              5'h03: normal_out = 16'h4c66;
              5'h04: normal_out = 16'h4c69;
              5'h05: normal_out = 16'h4c6c;
              5'h06: normal_out = 16'h4c6f;
              5'h07: normal_out = 16'h4c72;
              5'h08: normal_out = 16'h4c75;
              5'h09: normal_out = 16'h4c78;
              5'h0a: normal_out = 16'h4c7b;
              5'h0b: normal_out = 16'h4c7e;
              5'h0c: normal_out = 16'h4c82;
              5'h0d: normal_out = 16'h4c85;
              5'h0e: normal_out = 16'h4c88;
              5'h0f: normal_out = 16'h4c8b;
              5'h10: normal_out = 16'h4c8e;
              5'h11: normal_out = 16'h4c91;
              5'h12: normal_out = 16'h4c94;
              5'h13: normal_out = 16'h4c98;
              5'h14: normal_out = 16'h4c9b;
              5'h15: normal_out = 16'h4c9e;
              5'h16: normal_out = 16'h4ca1;
              5'h17: normal_out = 16'h4ca4;
              5'h18: normal_out = 16'h4ca8;
              5'h19: normal_out = 16'h4cab;
              5'h1a: normal_out = 16'h4cae;
              5'h1b: normal_out = 16'h4cb1;
              5'h1c: normal_out = 16'h4cb5;
              5'h1d: normal_out = 16'h4cb8;
              5'h1e: normal_out = 16'h4cbb;
              5'h1f: normal_out = 16'h4cbe;
              default: begin end
            endcase
          end
          5'h02: begin
            normal_out = 16'h4cc2;
            case (mant[4:0])
              5'h01: normal_out = 16'h4cc5;
              5'h02: normal_out = 16'h4cc8;
              5'h03: normal_out = 16'h4ccc;
              5'h04: normal_out = 16'h4ccf;
              5'h05: normal_out = 16'h4cd2;
              5'h06: normal_out = 16'h4cd6;
              5'h07: normal_out = 16'h4cd9;
              5'h08: normal_out = 16'h4cdc;
              5'h09: normal_out = 16'h4ce0;
              5'h0a: normal_out = 16'h4ce3;
              5'h0b: normal_out = 16'h4ce7;
              5'h0c: normal_out = 16'h4cea;
              5'h0d: normal_out = 16'h4ced;
              5'h0e: normal_out = 16'h4cf1;
              5'h0f: normal_out = 16'h4cf4;
              5'h10: normal_out = 16'h4cf8;
              5'h11: normal_out = 16'h4cfb;
              5'h12: normal_out = 16'h4cff;
              5'h13: normal_out = 16'h4d02;
              5'h14: normal_out = 16'h4d06;
              5'h15: normal_out = 16'h4d09;
              5'h16: normal_out = 16'h4d0c;
              5'h17: normal_out = 16'h4d10;
              5'h18: normal_out = 16'h4d14;
              5'h19: normal_out = 16'h4d17;
              5'h1a: normal_out = 16'h4d1b;
              5'h1b: normal_out = 16'h4d1e;
              5'h1c: normal_out = 16'h4d22;
              5'h1d: normal_out = 16'h4d25;
              5'h1e: normal_out = 16'h4d29;
              5'h1f: normal_out = 16'h4d2c;
              default: begin end
            endcase
          end
          5'h03: begin
            normal_out = 16'h4d30;
            case (mant[4:0])
              5'h01: normal_out = 16'h4d34;
              5'h02: normal_out = 16'h4d37;
              5'h03: normal_out = 16'h4d3b;
              5'h04: normal_out = 16'h4d3e;
              5'h05: normal_out = 16'h4d42;
              5'h06: normal_out = 16'h4d46;
              5'h07: normal_out = 16'h4d49;
              5'h08: normal_out = 16'h4d4d;
              5'h09: normal_out = 16'h4d51;
              5'h0a: normal_out = 16'h4d54;
              5'h0b: normal_out = 16'h4d58;
              5'h0c: normal_out = 16'h4d5c;
              5'h0d: normal_out = 16'h4d60;
              5'h0e: normal_out = 16'h4d63;
              5'h0f: normal_out = 16'h4d67;
              5'h10: normal_out = 16'h4d6b;
              5'h11: normal_out = 16'h4d6f;
              5'h12: normal_out = 16'h4d72;
              5'h13: normal_out = 16'h4d76;
              5'h14: normal_out = 16'h4d7a;
              5'h15: normal_out = 16'h4d7e;
              5'h16: normal_out = 16'h4d81;
              5'h17: normal_out = 16'h4d85;
              5'h18: normal_out = 16'h4d89;
              5'h19: normal_out = 16'h4d8d;
              5'h1a: normal_out = 16'h4d91;
              5'h1b: normal_out = 16'h4d95;
              5'h1c: normal_out = 16'h4d99;
              5'h1d: normal_out = 16'h4d9c;
              5'h1e: normal_out = 16'h4da0;
              5'h1f: normal_out = 16'h4da4;
              default: begin end
            endcase
          end
          5'h04: begin
            normal_out = 16'h4da8;
            case (mant[4:0])
              5'h01: normal_out = 16'h4dac;
              5'h02: normal_out = 16'h4db0;
              5'h03: normal_out = 16'h4db4;
              5'h04: normal_out = 16'h4db8;
              5'h05: normal_out = 16'h4dbc;
              5'h06: normal_out = 16'h4dc0;
              5'h07: normal_out = 16'h4dc4;
              5'h08: normal_out = 16'h4dc8;
              5'h09: normal_out = 16'h4dcc;
              5'h0a: normal_out = 16'h4dd0;
              5'h0b: normal_out = 16'h4dd4;
              5'h0c: normal_out = 16'h4dd8;
              5'h0d: normal_out = 16'h4ddc;
              5'h0e: normal_out = 16'h4de0;
              5'h0f: normal_out = 16'h4de4;
              5'h10: normal_out = 16'h4de8;
              5'h11: normal_out = 16'h4dec;
              5'h12: normal_out = 16'h4df0;
              5'h13: normal_out = 16'h4df5;
              5'h14: normal_out = 16'h4df9;
              5'h15: normal_out = 16'h4dfd;
              5'h16: normal_out = 16'h4e01;
              5'h17: normal_out = 16'h4e05;
              5'h18: normal_out = 16'h4e09;
              5'h19: normal_out = 16'h4e0e;
              5'h1a: normal_out = 16'h4e12;
              5'h1b: normal_out = 16'h4e16;
              5'h1c: normal_out = 16'h4e1a;
              5'h1d: normal_out = 16'h4e1e;
              5'h1e: normal_out = 16'h4e23;
              5'h1f: normal_out = 16'h4e27;
              default: begin end
            endcase
          end
          5'h05: begin
            normal_out = 16'h4e2b;
            case (mant[4:0])
              5'h01: normal_out = 16'h4e30;
              5'h02: normal_out = 16'h4e34;
              5'h03: normal_out = 16'h4e38;
              5'h04: normal_out = 16'h4e3c;
              5'h05: normal_out = 16'h4e41;
              5'h06: normal_out = 16'h4e45;
              5'h07: normal_out = 16'h4e49;
              5'h08: normal_out = 16'h4e4e;
              5'h09: normal_out = 16'h4e52;
              5'h0a: normal_out = 16'h4e57;
              5'h0b: normal_out = 16'h4e5b;
              5'h0c: normal_out = 16'h4e5f;
              5'h0d: normal_out = 16'h4e64;
              5'h0e: normal_out = 16'h4e68;
              5'h0f: normal_out = 16'h4e6d;
              5'h10: normal_out = 16'h4e71;
              5'h11: normal_out = 16'h4e76;
              5'h12: normal_out = 16'h4e7a;
              5'h13: normal_out = 16'h4e7f;
              5'h14: normal_out = 16'h4e83;
              5'h15: normal_out = 16'h4e88;
              5'h16: normal_out = 16'h4e8c;
              5'h17: normal_out = 16'h4e91;
              5'h18: normal_out = 16'h4e95;
              5'h19: normal_out = 16'h4e9a;
              5'h1a: normal_out = 16'h4e9e;
              5'h1b: normal_out = 16'h4ea3;
              5'h1c: normal_out = 16'h4ea8;
              5'h1d: normal_out = 16'h4eac;
              5'h1e: normal_out = 16'h4eb1;
              5'h1f: normal_out = 16'h4eb5;
              default: begin end
            endcase
          end
          5'h06: begin
            normal_out = 16'h4eba;
            case (mant[4:0])
              5'h01: normal_out = 16'h4ebf;
              5'h02: normal_out = 16'h4ec4;
              5'h03: normal_out = 16'h4ec8;
              5'h04: normal_out = 16'h4ecd;
              5'h05: normal_out = 16'h4ed2;
              5'h06: normal_out = 16'h4ed6;
              5'h07: normal_out = 16'h4edb;
              5'h08: normal_out = 16'h4ee0;
              5'h09: normal_out = 16'h4ee5;
              5'h0a: normal_out = 16'h4ee9;
              5'h0b: normal_out = 16'h4eee;
              5'h0c: normal_out = 16'h4ef3;
              5'h0d: normal_out = 16'h4ef8;
              5'h0e: normal_out = 16'h4efd;
              5'h0f: normal_out = 16'h4f02;
              5'h10: normal_out = 16'h4f06;
              5'h11: normal_out = 16'h4f0b;
              5'h12: normal_out = 16'h4f10;
              5'h13: normal_out = 16'h4f15;
              5'h14: normal_out = 16'h4f1a;
              5'h15: normal_out = 16'h4f1f;
              5'h16: normal_out = 16'h4f24;
              5'h17: normal_out = 16'h4f29;
              5'h18: normal_out = 16'h4f2e;
              5'h19: normal_out = 16'h4f33;
              5'h1a: normal_out = 16'h4f38;
              5'h1b: normal_out = 16'h4f3d;
              5'h1c: normal_out = 16'h4f42;
              5'h1d: normal_out = 16'h4f47;
              5'h1e: normal_out = 16'h4f4c;
              5'h1f: normal_out = 16'h4f51;
              default: begin end
            endcase
          end
          5'h07: begin
            normal_out = 16'h4f56;
            case (mant[4:0])
              5'h01: normal_out = 16'h4f5b;
              5'h02: normal_out = 16'h4f60;
              5'h03: normal_out = 16'h4f65;
              5'h04: normal_out = 16'h4f6a;
              5'h05: normal_out = 16'h4f70;
              5'h06: normal_out = 16'h4f75;
              5'h07: normal_out = 16'h4f7a;
              5'h08: normal_out = 16'h4f7f;
              5'h09: normal_out = 16'h4f84;
              5'h0a: normal_out = 16'h4f8a;
              5'h0b: normal_out = 16'h4f8f;
              5'h0c: normal_out = 16'h4f94;
              5'h0d: normal_out = 16'h4f99;
              5'h0e: normal_out = 16'h4f9f;
              5'h0f: normal_out = 16'h4fa4;
              5'h10: normal_out = 16'h4fa9;
              5'h11: normal_out = 16'h4fae;
              5'h12: normal_out = 16'h4fb4;
              5'h13: normal_out = 16'h4fb9;
              5'h14: normal_out = 16'h4fbf;
              5'h15: normal_out = 16'h4fc4;
              5'h16: normal_out = 16'h4fc9;
              5'h17: normal_out = 16'h4fcf;
              5'h18: normal_out = 16'h4fd4;
              5'h19: normal_out = 16'h4fda;
              5'h1a: normal_out = 16'h4fdf;
              5'h1b: normal_out = 16'h4fe4;
              5'h1c: normal_out = 16'h4fea;
              5'h1d: normal_out = 16'h4fef;
              5'h1e: normal_out = 16'h4ff5;
              5'h1f: normal_out = 16'h4ffa;
              default: begin end
            endcase
          end
          5'h08: begin
            normal_out = 16'h5000;
            case (mant[4:0])
              5'h01: normal_out = 16'h5003;
              5'h02: normal_out = 16'h5006;
              5'h03: normal_out = 16'h5008;
              5'h04: normal_out = 16'h500b;
              5'h05: normal_out = 16'h500e;
              5'h06: normal_out = 16'h5011;
              5'h07: normal_out = 16'h5014;
              5'h08: normal_out = 16'h5016;
              5'h09: normal_out = 16'h5019;
              5'h0a: normal_out = 16'h501c;
              5'h0b: normal_out = 16'h501f;
              5'h0c: normal_out = 16'h5022;
              5'h0d: normal_out = 16'h5025;
              5'h0e: normal_out = 16'h5028;
              5'h0f: normal_out = 16'h502a;
              5'h10: normal_out = 16'h502d;
              5'h11: normal_out = 16'h5030;
              5'h12: normal_out = 16'h5033;
              5'h13: normal_out = 16'h5036;
              5'h14: normal_out = 16'h5039;
              5'h15: normal_out = 16'h503c;
              5'h16: normal_out = 16'h503f;
              5'h17: normal_out = 16'h5042;
              5'h18: normal_out = 16'h5045;
              5'h19: normal_out = 16'h5048;
              5'h1a: normal_out = 16'h504b;
              5'h1b: normal_out = 16'h504e;
              5'h1c: normal_out = 16'h5051;
              5'h1d: normal_out = 16'h5054;
              5'h1e: normal_out = 16'h5057;
              5'h1f: normal_out = 16'h505a;
              default: begin end
            endcase
          end
          5'h09: begin
            normal_out = 16'h505d;
            case (mant[4:0])
              5'h01: normal_out = 16'h5060;
              5'h02: normal_out = 16'h5063;
              5'h03: normal_out = 16'h5066;
              5'h04: normal_out = 16'h5069;
              5'h05: normal_out = 16'h506c;
              5'h06: normal_out = 16'h506f;
              5'h07: normal_out = 16'h5072;
              5'h08: normal_out = 16'h5075;
              5'h09: normal_out = 16'h5078;
              5'h0a: normal_out = 16'h507b;
              5'h0b: normal_out = 16'h507e;
              5'h0c: normal_out = 16'h5082;
              5'h0d: normal_out = 16'h5085;
              5'h0e: normal_out = 16'h5088;
              5'h0f: normal_out = 16'h508b;
              5'h10: normal_out = 16'h508e;
              5'h11: normal_out = 16'h5091;
              5'h12: normal_out = 16'h5094;
              5'h13: normal_out = 16'h5098;
              5'h14: normal_out = 16'h509b;
              5'h15: normal_out = 16'h509e;
              5'h16: normal_out = 16'h50a1;
              5'h17: normal_out = 16'h50a4;
              5'h18: normal_out = 16'h50a8;
              5'h19: normal_out = 16'h50ab;
              5'h1a: normal_out = 16'h50ae;
              5'h1b: normal_out = 16'h50b1;
              5'h1c: normal_out = 16'h50b5;
              5'h1d: normal_out = 16'h50b8;
              5'h1e: normal_out = 16'h50bb;
              5'h1f: normal_out = 16'h50be;
              default: begin end
            endcase
          end
          5'h0a: begin
            normal_out = 16'h50c2;
            case (mant[4:0])
              5'h01: normal_out = 16'h50c5;
              5'h02: normal_out = 16'h50c8;
              5'h03: normal_out = 16'h50cc;
              5'h04: normal_out = 16'h50cf;
              5'h05: normal_out = 16'h50d2;
              5'h06: normal_out = 16'h50d6;
              5'h07: normal_out = 16'h50d9;
              5'h08: normal_out = 16'h50dc;
              5'h09: normal_out = 16'h50e0;
              5'h0a: normal_out = 16'h50e3;
              5'h0b: normal_out = 16'h50e7;
              5'h0c: normal_out = 16'h50ea;
              5'h0d: normal_out = 16'h50ed;
              5'h0e: normal_out = 16'h50f1;
              5'h0f: normal_out = 16'h50f4;
              5'h10: normal_out = 16'h50f8;
              5'h11: normal_out = 16'h50fb;
              5'h12: normal_out = 16'h50ff;
              5'h13: normal_out = 16'h5102;
              5'h14: normal_out = 16'h5106;
              5'h15: normal_out = 16'h5109;
              5'h16: normal_out = 16'h510c;
              5'h17: normal_out = 16'h5110;
              5'h18: normal_out = 16'h5114;
              5'h19: normal_out = 16'h5117;
              5'h1a: normal_out = 16'h511b;
              5'h1b: normal_out = 16'h511e;
              5'h1c: normal_out = 16'h5122;
              5'h1d: normal_out = 16'h5125;
              5'h1e: normal_out = 16'h5129;
              5'h1f: normal_out = 16'h512c;
              default: begin end
            endcase
          end
          5'h0b: begin
            normal_out = 16'h5130;
            case (mant[4:0])
              5'h01: normal_out = 16'h5134;
              5'h02: normal_out = 16'h5137;
              5'h03: normal_out = 16'h513b;
              5'h04: normal_out = 16'h513e;
              5'h05: normal_out = 16'h5142;
              5'h06: normal_out = 16'h5146;
              5'h07: normal_out = 16'h5149;
              5'h08: normal_out = 16'h514d;
              5'h09: normal_out = 16'h5151;
              5'h0a: normal_out = 16'h5154;
              5'h0b: normal_out = 16'h5158;
              5'h0c: normal_out = 16'h515c;
              5'h0d: normal_out = 16'h5160;
              5'h0e: normal_out = 16'h5163;
              5'h0f: normal_out = 16'h5167;
              5'h10: normal_out = 16'h516b;
              5'h11: normal_out = 16'h516f;
              5'h12: normal_out = 16'h5172;
              5'h13: normal_out = 16'h5176;
              5'h14: normal_out = 16'h517a;
              5'h15: normal_out = 16'h517e;
              5'h16: normal_out = 16'h5181;
              5'h17: normal_out = 16'h5185;
              5'h18: normal_out = 16'h5189;
              5'h19: normal_out = 16'h518d;
              5'h1a: normal_out = 16'h5191;
              5'h1b: normal_out = 16'h5195;
              5'h1c: normal_out = 16'h5199;
              5'h1d: normal_out = 16'h519c;
              5'h1e: normal_out = 16'h51a0;
              5'h1f: normal_out = 16'h51a4;
              default: begin end
            endcase
          end
          5'h0c: begin
            normal_out = 16'h51a8;
            case (mant[4:0])
              5'h01: normal_out = 16'h51ac;
              5'h02: normal_out = 16'h51b0;
              5'h03: normal_out = 16'h51b4;
              5'h04: normal_out = 16'h51b8;
              5'h05: normal_out = 16'h51bc;
              5'h06: normal_out = 16'h51c0;
              5'h07: normal_out = 16'h51c4;
              5'h08: normal_out = 16'h51c8;
              5'h09: normal_out = 16'h51cc;
              5'h0a: normal_out = 16'h51d0;
              5'h0b: normal_out = 16'h51d4;
              5'h0c: normal_out = 16'h51d8;
              5'h0d: normal_out = 16'h51dc;
              5'h0e: normal_out = 16'h51e0;
              5'h0f: normal_out = 16'h51e4;
              5'h10: normal_out = 16'h51e8;
              5'h11: normal_out = 16'h51ec;
              5'h12: normal_out = 16'h51f0;
              5'h13: normal_out = 16'h51f5;
              5'h14: normal_out = 16'h51f9;
              5'h15: normal_out = 16'h51fd;
              5'h16: normal_out = 16'h5201;
              5'h17: normal_out = 16'h5205;
              5'h18: normal_out = 16'h5209;
              5'h19: normal_out = 16'h520e;
              5'h1a: normal_out = 16'h5212;
              5'h1b: normal_out = 16'h5216;
              5'h1c: normal_out = 16'h521a;
              5'h1d: normal_out = 16'h521e;
              5'h1e: normal_out = 16'h5223;
              5'h1f: normal_out = 16'h5227;
              default: begin end
            endcase
          end
          5'h0d: begin
            normal_out = 16'h522b;
            case (mant[4:0])
              5'h01: normal_out = 16'h5230;
              5'h02: normal_out = 16'h5234;
              5'h03: normal_out = 16'h5238;
              5'h04: normal_out = 16'h523c;
              5'h05: normal_out = 16'h5241;
              5'h06: normal_out = 16'h5245;
              5'h07: normal_out = 16'h5249;
              5'h08: normal_out = 16'h524e;
              5'h09: normal_out = 16'h5252;
              5'h0a: normal_out = 16'h5257;
              5'h0b: normal_out = 16'h525b;
              5'h0c: normal_out = 16'h525f;
              5'h0d: normal_out = 16'h5264;
              5'h0e: normal_out = 16'h5268;
              5'h0f: normal_out = 16'h526d;
              5'h10: normal_out = 16'h5271;
              5'h11: normal_out = 16'h5276;
              5'h12: normal_out = 16'h527a;
              5'h13: normal_out = 16'h527f;
              5'h14: normal_out = 16'h5283;
              5'h15: normal_out = 16'h5288;
              5'h16: normal_out = 16'h528c;
              5'h17: normal_out = 16'h5291;
              5'h18: normal_out = 16'h5295;
              5'h19: normal_out = 16'h529a;
              5'h1a: normal_out = 16'h529e;
              5'h1b: normal_out = 16'h52a3;
              5'h1c: normal_out = 16'h52a8;
              5'h1d: normal_out = 16'h52ac;
              5'h1e: normal_out = 16'h52b1;
              5'h1f: normal_out = 16'h52b5;
              default: begin end
            endcase
          end
          5'h0e: begin
            normal_out = 16'h52ba;
            case (mant[4:0])
              5'h01: normal_out = 16'h52bf;
              5'h02: normal_out = 16'h52c4;
              5'h03: normal_out = 16'h52c8;
              5'h04: normal_out = 16'h52cd;
              5'h05: normal_out = 16'h52d2;
              5'h06: normal_out = 16'h52d6;
              5'h07: normal_out = 16'h52db;
              5'h08: normal_out = 16'h52e0;
              5'h09: normal_out = 16'h52e5;
              5'h0a: normal_out = 16'h52e9;
              5'h0b: normal_out = 16'h52ee;
              5'h0c: normal_out = 16'h52f3;
              5'h0d: normal_out = 16'h52f8;
              5'h0e: normal_out = 16'h52fd;
              5'h0f: normal_out = 16'h5302;
              5'h10: normal_out = 16'h5306;
              5'h11: normal_out = 16'h530b;
              5'h12: normal_out = 16'h5310;
              5'h13: normal_out = 16'h5315;
              5'h14: normal_out = 16'h531a;
              5'h15: normal_out = 16'h531f;
              5'h16: normal_out = 16'h5324;
              5'h17: normal_out = 16'h5329;
              5'h18: normal_out = 16'h532e;
              5'h19: normal_out = 16'h5333;
              5'h1a: normal_out = 16'h5338;
              5'h1b: normal_out = 16'h533d;
              5'h1c: normal_out = 16'h5342;
              5'h1d: normal_out = 16'h5347;
              5'h1e: normal_out = 16'h534c;
              5'h1f: normal_out = 16'h5351;
              default: begin end
            endcase
          end
          5'h0f: begin
            normal_out = 16'h5356;
            case (mant[4:0])
              5'h01: normal_out = 16'h535b;
              5'h02: normal_out = 16'h5360;
              5'h03: normal_out = 16'h5365;
              5'h04: normal_out = 16'h536a;
              5'h05: normal_out = 16'h5370;
              5'h06: normal_out = 16'h5375;
              5'h07: normal_out = 16'h537a;
              5'h08: normal_out = 16'h537f;
              5'h09: normal_out = 16'h5384;
              5'h0a: normal_out = 16'h538a;
              5'h0b: normal_out = 16'h538f;
              5'h0c: normal_out = 16'h5394;
              5'h0d: normal_out = 16'h5399;
              5'h0e: normal_out = 16'h539f;
              5'h0f: normal_out = 16'h53a4;
              5'h10: normal_out = 16'h53a9;
              5'h11: normal_out = 16'h53ae;
              5'h12: normal_out = 16'h53b4;
              5'h13: normal_out = 16'h53b9;
              5'h14: normal_out = 16'h53bf;
              5'h15: normal_out = 16'h53c4;
              5'h16: normal_out = 16'h53c9;
              5'h17: normal_out = 16'h53cf;
              5'h18: normal_out = 16'h53d4;
              5'h19: normal_out = 16'h53da;
              5'h1a: normal_out = 16'h53df;
              5'h1b: normal_out = 16'h53e4;
              5'h1c: normal_out = 16'h53ea;
              5'h1d: normal_out = 16'h53ef;
              5'h1e: normal_out = 16'h53f5;
              5'h1f: normal_out = 16'h53fa;
              default: begin end
            endcase
          end
          5'h10: begin
            normal_out = 16'h5400;
            case (mant[4:0])
              5'h01: normal_out = 16'h5403;
              5'h02: normal_out = 16'h5406;
              5'h03: normal_out = 16'h5408;
              5'h04: normal_out = 16'h540b;
              5'h05: normal_out = 16'h540e;
              5'h06: normal_out = 16'h5411;
              5'h07: normal_out = 16'h5414;
              5'h08: normal_out = 16'h5416;
              5'h09: normal_out = 16'h5419;
              5'h0a: normal_out = 16'h541c;
              5'h0b: normal_out = 16'h541f;
              5'h0c: normal_out = 16'h5422;
              5'h0d: normal_out = 16'h5425;
              5'h0e: normal_out = 16'h5428;
              5'h0f: normal_out = 16'h542a;
              5'h10: normal_out = 16'h542d;
              5'h11: normal_out = 16'h5430;
              5'h12: normal_out = 16'h5433;
              5'h13: normal_out = 16'h5436;
              5'h14: normal_out = 16'h5439;
              5'h15: normal_out = 16'h543c;
              5'h16: normal_out = 16'h543f;
              5'h17: normal_out = 16'h5442;
              5'h18: normal_out = 16'h5445;
              5'h19: normal_out = 16'h5448;
              5'h1a: normal_out = 16'h544b;
              5'h1b: normal_out = 16'h544e;
              5'h1c: normal_out = 16'h5451;
              5'h1d: normal_out = 16'h5454;
              5'h1e: normal_out = 16'h5457;
              5'h1f: normal_out = 16'h545a;
              default: begin end
            endcase
          end
          5'h11: begin
            normal_out = 16'h545d;
            case (mant[4:0])
              5'h01: normal_out = 16'h5460;
              5'h02: normal_out = 16'h5463;
              5'h03: normal_out = 16'h5466;
              5'h04: normal_out = 16'h5469;
              5'h05: normal_out = 16'h546c;
              5'h06: normal_out = 16'h546f;
              5'h07: normal_out = 16'h5472;
              5'h08: normal_out = 16'h5475;
              5'h09: normal_out = 16'h5478;
              5'h0a: normal_out = 16'h547b;
              5'h0b: normal_out = 16'h547e;
              5'h0c: normal_out = 16'h5482;
              5'h0d: normal_out = 16'h5485;
              5'h0e: normal_out = 16'h5488;
              5'h0f: normal_out = 16'h548b;
              5'h10: normal_out = 16'h548e;
              5'h11: normal_out = 16'h5491;
              5'h12: normal_out = 16'h5494;
              5'h13: normal_out = 16'h5498;
              5'h14: normal_out = 16'h549b;
              5'h15: normal_out = 16'h549e;
              5'h16: normal_out = 16'h54a1;
              5'h17: normal_out = 16'h54a4;
              5'h18: normal_out = 16'h54a8;
              5'h19: normal_out = 16'h54ab;
              5'h1a: normal_out = 16'h54ae;
              5'h1b: normal_out = 16'h54b1;
              5'h1c: normal_out = 16'h54b5;
              5'h1d: normal_out = 16'h54b8;
              5'h1e: normal_out = 16'h54bb;
              5'h1f: normal_out = 16'h54be;
              default: begin end
            endcase
          end
          5'h12: begin
            normal_out = 16'h54c2;
            case (mant[4:0])
              5'h01: normal_out = 16'h54c5;
              5'h02: normal_out = 16'h54c8;
              5'h03: normal_out = 16'h54cc;
              5'h04: normal_out = 16'h54cf;
              5'h05: normal_out = 16'h54d2;
              5'h06: normal_out = 16'h54d6;
              5'h07: normal_out = 16'h54d9;
              5'h08: normal_out = 16'h54dc;
              5'h09: normal_out = 16'h54e0;
              5'h0a: normal_out = 16'h54e3;
              5'h0b: normal_out = 16'h54e7;
              5'h0c: normal_out = 16'h54ea;
              5'h0d: normal_out = 16'h54ed;
              5'h0e: normal_out = 16'h54f1;
              5'h0f: normal_out = 16'h54f4;
              5'h10: normal_out = 16'h54f8;
              5'h11: normal_out = 16'h54fb;
              5'h12: normal_out = 16'h54ff;
              5'h13: normal_out = 16'h5502;
              5'h14: normal_out = 16'h5506;
              5'h15: normal_out = 16'h5509;
              5'h16: normal_out = 16'h550c;
              5'h17: normal_out = 16'h5510;
              5'h18: normal_out = 16'h5514;
              5'h19: normal_out = 16'h5517;
              5'h1a: normal_out = 16'h551b;
              5'h1b: normal_out = 16'h551e;
              5'h1c: normal_out = 16'h5522;
              5'h1d: normal_out = 16'h5525;
              5'h1e: normal_out = 16'h5529;
              5'h1f: normal_out = 16'h552c;
              default: begin end
            endcase
          end
          5'h13: begin
            normal_out = 16'h5530;
            case (mant[4:0])
              5'h01: normal_out = 16'h5534;
              5'h02: normal_out = 16'h5537;
              5'h03: normal_out = 16'h553b;
              5'h04: normal_out = 16'h553e;
              5'h05: normal_out = 16'h5542;
              5'h06: normal_out = 16'h5546;
              5'h07: normal_out = 16'h5549;
              5'h08: normal_out = 16'h554d;
              5'h09: normal_out = 16'h5551;
              5'h0a: normal_out = 16'h5554;
              5'h0b: normal_out = 16'h5558;
              5'h0c: normal_out = 16'h555c;
              5'h0d: normal_out = 16'h5560;
              5'h0e: normal_out = 16'h5563;
              5'h0f: normal_out = 16'h5567;
              5'h10: normal_out = 16'h556b;
              5'h11: normal_out = 16'h556f;
              5'h12: normal_out = 16'h5572;
              5'h13: normal_out = 16'h5576;
              5'h14: normal_out = 16'h557a;
              5'h15: normal_out = 16'h557e;
              5'h16: normal_out = 16'h5581;
              5'h17: normal_out = 16'h5585;
              5'h18: normal_out = 16'h5589;
              5'h19: normal_out = 16'h558d;
              5'h1a: normal_out = 16'h5591;
              5'h1b: normal_out = 16'h5595;
              5'h1c: normal_out = 16'h5599;
              5'h1d: normal_out = 16'h559c;
              5'h1e: normal_out = 16'h55a0;
              5'h1f: normal_out = 16'h55a4;
              default: begin end
            endcase
          end
          5'h14: begin
            normal_out = 16'h55a8;
            case (mant[4:0])
              5'h01: normal_out = 16'h55ac;
              5'h02: normal_out = 16'h55b0;
              5'h03: normal_out = 16'h55b4;
              5'h04: normal_out = 16'h55b8;
              5'h05: normal_out = 16'h55bc;
              5'h06: normal_out = 16'h55c0;
              5'h07: normal_out = 16'h55c4;
              5'h08: normal_out = 16'h55c8;
              5'h09: normal_out = 16'h55cc;
              5'h0a: normal_out = 16'h55d0;
              5'h0b: normal_out = 16'h55d4;
              5'h0c: normal_out = 16'h55d8;
              5'h0d: normal_out = 16'h55dc;
              5'h0e: normal_out = 16'h55e0;
              5'h0f: normal_out = 16'h55e4;
              5'h10: normal_out = 16'h55e8;
              5'h11: normal_out = 16'h55ec;
              5'h12: normal_out = 16'h55f0;
              5'h13: normal_out = 16'h55f5;
              5'h14: normal_out = 16'h55f9;
              5'h15: normal_out = 16'h55fd;
              5'h16: normal_out = 16'h5601;
              5'h17: normal_out = 16'h5605;
              5'h18: normal_out = 16'h5609;
              5'h19: normal_out = 16'h560e;
              5'h1a: normal_out = 16'h5612;
              5'h1b: normal_out = 16'h5616;
              5'h1c: normal_out = 16'h561a;
              5'h1d: normal_out = 16'h561e;
              5'h1e: normal_out = 16'h5623;
              5'h1f: normal_out = 16'h5627;
              default: begin end
            endcase
          end
          5'h15: begin
            normal_out = 16'h562b;
            case (mant[4:0])
              5'h01: normal_out = 16'h5630;
              5'h02: normal_out = 16'h5634;
              5'h03: normal_out = 16'h5638;
              5'h04: normal_out = 16'h563c;
              5'h05: normal_out = 16'h5641;
              5'h06: normal_out = 16'h5645;
              5'h07: normal_out = 16'h5649;
              5'h08: normal_out = 16'h564e;
              5'h09: normal_out = 16'h5652;
              5'h0a: normal_out = 16'h5657;
              5'h0b: normal_out = 16'h565b;
              5'h0c: normal_out = 16'h565f;
              5'h0d: normal_out = 16'h5664;
              5'h0e: normal_out = 16'h5668;
              5'h0f: normal_out = 16'h566d;
              5'h10: normal_out = 16'h5671;
              5'h11: normal_out = 16'h5676;
              5'h12: normal_out = 16'h567a;
              5'h13: normal_out = 16'h567f;
              5'h14: normal_out = 16'h5683;
              5'h15: normal_out = 16'h5688;
              5'h16: normal_out = 16'h568c;
              5'h17: normal_out = 16'h5691;
              5'h18: normal_out = 16'h5695;
              5'h19: normal_out = 16'h569a;
              5'h1a: normal_out = 16'h569e;
              5'h1b: normal_out = 16'h56a3;
              5'h1c: normal_out = 16'h56a8;
              5'h1d: normal_out = 16'h56ac;
              5'h1e: normal_out = 16'h56b1;
              5'h1f: normal_out = 16'h56b5;
              default: begin end
            endcase
          end
          5'h16: begin
            normal_out = 16'h56ba;
            case (mant[4:0])
              5'h01: normal_out = 16'h56bf;
              5'h02: normal_out = 16'h56c4;
              5'h03: normal_out = 16'h56c8;
              5'h04: normal_out = 16'h56cd;
              5'h05: normal_out = 16'h56d2;
              5'h06: normal_out = 16'h56d6;
              5'h07: normal_out = 16'h56db;
              5'h08: normal_out = 16'h56e0;
              5'h09: normal_out = 16'h56e5;
              5'h0a: normal_out = 16'h56e9;
              5'h0b: normal_out = 16'h56ee;
              5'h0c: normal_out = 16'h56f3;
              5'h0d: normal_out = 16'h56f8;
              5'h0e: normal_out = 16'h56fd;
              5'h0f: normal_out = 16'h5702;
              5'h10: normal_out = 16'h5706;
              5'h11: normal_out = 16'h570b;
              5'h12: normal_out = 16'h5710;
              5'h13: normal_out = 16'h5715;
              5'h14: normal_out = 16'h571a;
              5'h15: normal_out = 16'h571f;
              5'h16: normal_out = 16'h5724;
              5'h17: normal_out = 16'h5729;
              5'h18: normal_out = 16'h572e;
              5'h19: normal_out = 16'h5733;
              5'h1a: normal_out = 16'h5738;
              5'h1b: normal_out = 16'h573d;
              5'h1c: normal_out = 16'h5742;
              5'h1d: normal_out = 16'h5747;
              5'h1e: normal_out = 16'h574c;
              5'h1f: normal_out = 16'h5751;
              default: begin end
            endcase
          end
          5'h17: begin
            normal_out = 16'h5756;
            case (mant[4:0])
              5'h01: normal_out = 16'h575b;
              5'h02: normal_out = 16'h5760;
              5'h03: normal_out = 16'h5765;
              5'h04: normal_out = 16'h576a;
              5'h05: normal_out = 16'h5770;
              5'h06: normal_out = 16'h5775;
              5'h07: normal_out = 16'h577a;
              5'h08: normal_out = 16'h577f;
              5'h09: normal_out = 16'h5784;
              5'h0a: normal_out = 16'h578a;
              5'h0b: normal_out = 16'h578f;
              5'h0c: normal_out = 16'h5794;
              5'h0d: normal_out = 16'h5799;
              5'h0e: normal_out = 16'h579f;
              5'h0f: normal_out = 16'h57a4;
              5'h10: normal_out = 16'h57a9;
              5'h11: normal_out = 16'h57ae;
              5'h12: normal_out = 16'h57b4;
              5'h13: normal_out = 16'h57b9;
              5'h14: normal_out = 16'h57bf;
              5'h15: normal_out = 16'h57c4;
              5'h16: normal_out = 16'h57c9;
              5'h17: normal_out = 16'h57cf;
              5'h18: normal_out = 16'h57d4;
              5'h19: normal_out = 16'h57da;
              5'h1a: normal_out = 16'h57df;
              5'h1b: normal_out = 16'h57e4;
              5'h1c: normal_out = 16'h57ea;
              5'h1d: normal_out = 16'h57ef;
              5'h1e: normal_out = 16'h57f5;
              5'h1f: normal_out = 16'h57fa;
              default: begin end
            endcase
          end
          5'h18: begin
            normal_out = 16'h5800;
            case (mant[4:0])
              5'h01: normal_out = 16'h5803;
              5'h02: normal_out = 16'h5806;
              5'h03: normal_out = 16'h5808;
              5'h04: normal_out = 16'h580b;
              5'h05: normal_out = 16'h580e;
              5'h06: normal_out = 16'h5811;
              5'h07: normal_out = 16'h5814;
              5'h08: normal_out = 16'h5816;
              5'h09: normal_out = 16'h5819;
              5'h0a: normal_out = 16'h581c;
              5'h0b: normal_out = 16'h581f;
              5'h0c: normal_out = 16'h5822;
              5'h0d: normal_out = 16'h5825;
              5'h0e: normal_out = 16'h5828;
              5'h0f: normal_out = 16'h582a;
              5'h10: normal_out = 16'h582d;
              5'h11: normal_out = 16'h5830;
              5'h12: normal_out = 16'h5833;
              5'h13: normal_out = 16'h5836;
              5'h14: normal_out = 16'h5839;
              5'h15: normal_out = 16'h583c;
              5'h16: normal_out = 16'h583f;
              5'h17: normal_out = 16'h5842;
              5'h18: normal_out = 16'h5845;
              5'h19: normal_out = 16'h5848;
              5'h1a: normal_out = 16'h584b;
              5'h1b: normal_out = 16'h584e;
              5'h1c: normal_out = 16'h5851;
              5'h1d: normal_out = 16'h5854;
              5'h1e: normal_out = 16'h5857;
              5'h1f: normal_out = 16'h585a;
              default: begin end
            endcase
          end
          5'h19: begin
            normal_out = 16'h585d;
            case (mant[4:0])
              5'h01: normal_out = 16'h5860;
              5'h02: normal_out = 16'h5863;
              5'h03: normal_out = 16'h5866;
              5'h04: normal_out = 16'h5869;
              5'h05: normal_out = 16'h586c;
              5'h06: normal_out = 16'h586f;
              5'h07: normal_out = 16'h5872;
              5'h08: normal_out = 16'h5875;
              5'h09: normal_out = 16'h5878;
              5'h0a: normal_out = 16'h587b;
              5'h0b: normal_out = 16'h587e;
              5'h0c: normal_out = 16'h5882;
              5'h0d: normal_out = 16'h5885;
              5'h0e: normal_out = 16'h5888;
              5'h0f: normal_out = 16'h588b;
              5'h10: normal_out = 16'h588e;
              5'h11: normal_out = 16'h5891;
              5'h12: normal_out = 16'h5894;
              5'h13: normal_out = 16'h5898;
              5'h14: normal_out = 16'h589b;
              5'h15: normal_out = 16'h589e;
              5'h16: normal_out = 16'h58a1;
              5'h17: normal_out = 16'h58a4;
              5'h18: normal_out = 16'h58a8;
              5'h19: normal_out = 16'h58ab;
              5'h1a: normal_out = 16'h58ae;
              5'h1b: normal_out = 16'h58b1;
              5'h1c: normal_out = 16'h58b5;
              5'h1d: normal_out = 16'h58b8;
              5'h1e: normal_out = 16'h58bb;
              5'h1f: normal_out = 16'h58be;
              default: begin end
            endcase
          end
          5'h1a: begin
            normal_out = 16'h58c2;
            case (mant[4:0])
              5'h01: normal_out = 16'h58c5;
              5'h02: normal_out = 16'h58c8;
              5'h03: normal_out = 16'h58cc;
              5'h04: normal_out = 16'h58cf;
              5'h05: normal_out = 16'h58d2;
              5'h06: normal_out = 16'h58d6;
              5'h07: normal_out = 16'h58d9;
              5'h08: normal_out = 16'h58dc;
              5'h09: normal_out = 16'h58e0;
              5'h0a: normal_out = 16'h58e3;
              5'h0b: normal_out = 16'h58e7;
              5'h0c: normal_out = 16'h58ea;
              5'h0d: normal_out = 16'h58ed;
              5'h0e: normal_out = 16'h58f1;
              5'h0f: normal_out = 16'h58f4;
              5'h10: normal_out = 16'h58f8;
              5'h11: normal_out = 16'h58fb;
              5'h12: normal_out = 16'h58ff;
              5'h13: normal_out = 16'h5902;
              5'h14: normal_out = 16'h5906;
              5'h15: normal_out = 16'h5909;
              5'h16: normal_out = 16'h590c;
              5'h17: normal_out = 16'h5910;
              5'h18: normal_out = 16'h5914;
              5'h19: normal_out = 16'h5917;
              5'h1a: normal_out = 16'h591b;
              5'h1b: normal_out = 16'h591e;
              5'h1c: normal_out = 16'h5922;
              5'h1d: normal_out = 16'h5925;
              5'h1e: normal_out = 16'h5929;
              5'h1f: normal_out = 16'h592c;
              default: begin end
            endcase
          end
          5'h1b: begin
            normal_out = 16'h5930;
            case (mant[4:0])
              5'h01: normal_out = 16'h5934;
              5'h02: normal_out = 16'h5937;
              5'h03: normal_out = 16'h593b;
              5'h04: normal_out = 16'h593e;
              5'h05: normal_out = 16'h5942;
              5'h06: normal_out = 16'h5946;
              5'h07: normal_out = 16'h5949;
              5'h08: normal_out = 16'h594d;
              5'h09: normal_out = 16'h5951;
              5'h0a: normal_out = 16'h5954;
              5'h0b: normal_out = 16'h5958;
              5'h0c: normal_out = 16'h595c;
              5'h0d: normal_out = 16'h5960;
              5'h0e: normal_out = 16'h5963;
              5'h0f: normal_out = 16'h5967;
              5'h10: normal_out = 16'h596b;
              5'h11: normal_out = 16'h596f;
              5'h12: normal_out = 16'h5972;
              5'h13: normal_out = 16'h5976;
              5'h14: normal_out = 16'h597a;
              5'h15: normal_out = 16'h597e;
              5'h16: normal_out = 16'h5981;
              5'h17: normal_out = 16'h5985;
              5'h18: normal_out = 16'h5989;
              5'h19: normal_out = 16'h598d;
              5'h1a: normal_out = 16'h5991;
              5'h1b: normal_out = 16'h5995;
              5'h1c: normal_out = 16'h5999;
              5'h1d: normal_out = 16'h599c;
              5'h1e: normal_out = 16'h59a0;
              5'h1f: normal_out = 16'h59a4;
              default: begin end
            endcase
          end
          5'h1c: begin
            normal_out = 16'h59a8;
            case (mant[4:0])
              5'h01: normal_out = 16'h59ac;
              5'h02: normal_out = 16'h59b0;
              5'h03: normal_out = 16'h59b4;
              5'h04: normal_out = 16'h59b8;
              5'h05: normal_out = 16'h59bc;
              5'h06: normal_out = 16'h59c0;
              5'h07: normal_out = 16'h59c4;
              5'h08: normal_out = 16'h59c8;
              5'h09: normal_out = 16'h59cc;
              5'h0a: normal_out = 16'h59d0;
              5'h0b: normal_out = 16'h59d4;
              5'h0c: normal_out = 16'h59d8;
              5'h0d: normal_out = 16'h59dc;
              5'h0e: normal_out = 16'h59e0;
              5'h0f: normal_out = 16'h59e4;
              5'h10: normal_out = 16'h59e8;
              5'h11: normal_out = 16'h59ec;
              5'h12: normal_out = 16'h59f0;
              5'h13: normal_out = 16'h59f5;
              5'h14: normal_out = 16'h59f9;
              5'h15: normal_out = 16'h59fd;
              5'h16: normal_out = 16'h5a01;
              5'h17: normal_out = 16'h5a05;
              5'h18: normal_out = 16'h5a09;
              5'h19: normal_out = 16'h5a0e;
              5'h1a: normal_out = 16'h5a12;
              5'h1b: normal_out = 16'h5a16;
              5'h1c: normal_out = 16'h5a1a;
              5'h1d: normal_out = 16'h5a1e;
              5'h1e: normal_out = 16'h5a23;
              5'h1f: normal_out = 16'h5a27;
              default: begin end
            endcase
          end
          5'h1d: begin
            normal_out = 16'h5a2b;
            case (mant[4:0])
              5'h01: normal_out = 16'h5a30;
              5'h02: normal_out = 16'h5a34;
              5'h03: normal_out = 16'h5a38;
              5'h04: normal_out = 16'h5a3c;
              5'h05: normal_out = 16'h5a41;
              5'h06: normal_out = 16'h5a45;
              5'h07: normal_out = 16'h5a49;
              5'h08: normal_out = 16'h5a4e;
              5'h09: normal_out = 16'h5a52;
              5'h0a: normal_out = 16'h5a57;
              5'h0b: normal_out = 16'h5a5b;
              5'h0c: normal_out = 16'h5a5f;
              5'h0d: normal_out = 16'h5a64;
              5'h0e: normal_out = 16'h5a68;
              5'h0f: normal_out = 16'h5a6d;
              5'h10: normal_out = 16'h5a71;
              5'h11: normal_out = 16'h5a76;
              5'h12: normal_out = 16'h5a7a;
              5'h13: normal_out = 16'h5a7f;
              5'h14: normal_out = 16'h5a83;
              5'h15: normal_out = 16'h5a88;
              5'h16: normal_out = 16'h5a8c;
              5'h17: normal_out = 16'h5a91;
              5'h18: normal_out = 16'h5a95;
              5'h19: normal_out = 16'h5a9a;
              5'h1a: normal_out = 16'h5a9e;
              5'h1b: normal_out = 16'h5aa3;
              5'h1c: normal_out = 16'h5aa8;
              5'h1d: normal_out = 16'h5aac;
              5'h1e: normal_out = 16'h5ab1;
              5'h1f: normal_out = 16'h5ab5;
              default: begin end
            endcase
          end
          5'h1e: begin
            normal_out = 16'h5aba;
            case (mant[4:0])
              5'h01: normal_out = 16'h5abf;
              5'h02: normal_out = 16'h5ac4;
              5'h03: normal_out = 16'h5ac8;
              5'h04: normal_out = 16'h5acd;
              5'h05: normal_out = 16'h5ad2;
              5'h06: normal_out = 16'h5ad6;
              5'h07: normal_out = 16'h5adb;
              5'h08: normal_out = 16'h5ae0;
              5'h09: normal_out = 16'h5ae5;
              5'h0a: normal_out = 16'h5ae9;
              5'h0b: normal_out = 16'h5aee;
              5'h0c: normal_out = 16'h5af3;
              5'h0d: normal_out = 16'h5af8;
              5'h0e: normal_out = 16'h5afd;
              5'h0f: normal_out = 16'h5b02;
              5'h10: normal_out = 16'h5b06;
              5'h11: normal_out = 16'h5b0b;
              5'h12: normal_out = 16'h5b10;
              5'h13: normal_out = 16'h5b15;
              5'h14: normal_out = 16'h5b1a;
              5'h15: normal_out = 16'h5b1f;
              5'h16: normal_out = 16'h5b24;
              5'h17: normal_out = 16'h5b29;
              5'h18: normal_out = 16'h5b2e;
              5'h19: normal_out = 16'h5b33;
              5'h1a: normal_out = 16'h5b38;
              5'h1b: normal_out = 16'h5b3d;
              5'h1c: normal_out = 16'h5b42;
              5'h1d: normal_out = 16'h5b47;
              5'h1e: normal_out = 16'h5b4c;
              5'h1f: normal_out = 16'h5b51;
              default: begin end
            endcase
          end
          5'h1f: begin
            normal_out = 16'h5b56;
            case (mant[4:0])
              5'h01: normal_out = 16'h5b5b;
              5'h02: normal_out = 16'h5b60;
              5'h03: normal_out = 16'h5b65;
              5'h04: normal_out = 16'h5b6a;
              5'h05: normal_out = 16'h5b70;
              5'h06: normal_out = 16'h5b75;
              5'h07: normal_out = 16'h5b7a;
              5'h08: normal_out = 16'h5b7f;
              5'h09: normal_out = 16'h5b84;
              5'h0a: normal_out = 16'h5b8a;
              5'h0b: normal_out = 16'h5b8f;
              5'h0c: normal_out = 16'h5b94;
              5'h0d: normal_out = 16'h5b99;
              5'h0e: normal_out = 16'h5b9f;
              5'h0f: normal_out = 16'h5ba4;
              5'h10: normal_out = 16'h5ba9;
              5'h11: normal_out = 16'h5bae;
              5'h12: normal_out = 16'h5bb4;
              5'h13: normal_out = 16'h5bb9;
              5'h14: normal_out = 16'h5bbf;
              5'h15: normal_out = 16'h5bc4;
              5'h16: normal_out = 16'h5bc9;
              5'h17: normal_out = 16'h5bcf;
              5'h18: normal_out = 16'h5bd4;
              5'h19: normal_out = 16'h5bda;
              5'h1a: normal_out = 16'h5bdf;
              5'h1b: normal_out = 16'h5be4;
              5'h1c: normal_out = 16'h5bea;
              5'h1d: normal_out = 16'h5bef;
              5'h1e: normal_out = 16'h5bf5;
              5'h1f: normal_out = 16'h5bfa;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      6'h12: begin
        case (mant[9:5])
          5'h00: begin
            normal_out = 16'h5c00;
            case (mant[4:0])
              5'h01: normal_out = 16'h5c06;
              5'h02: normal_out = 16'h5c0b;
              5'h03: normal_out = 16'h5c11;
              5'h04: normal_out = 16'h5c16;
              5'h05: normal_out = 16'h5c1c;
              5'h06: normal_out = 16'h5c22;
              5'h07: normal_out = 16'h5c28;
              5'h08: normal_out = 16'h5c2d;
              5'h09: normal_out = 16'h5c33;
              5'h0a: normal_out = 16'h5c39;
              5'h0b: normal_out = 16'h5c3f;
              5'h0c: normal_out = 16'h5c45;
              5'h0d: normal_out = 16'h5c4b;
              5'h0e: normal_out = 16'h5c51;
              5'h0f: normal_out = 16'h5c57;
              5'h10: normal_out = 16'h5c5d;
              5'h11: normal_out = 16'h5c63;
              5'h12: normal_out = 16'h5c69;
              5'h13: normal_out = 16'h5c6f;
              5'h14: normal_out = 16'h5c75;
              5'h15: normal_out = 16'h5c7b;
              5'h16: normal_out = 16'h5c82;
              5'h17: normal_out = 16'h5c88;
              5'h18: normal_out = 16'h5c8e;
              5'h19: normal_out = 16'h5c94;
              5'h1a: normal_out = 16'h5c9b;
              5'h1b: normal_out = 16'h5ca1;
              5'h1c: normal_out = 16'h5ca8;
              5'h1d: normal_out = 16'h5cae;
              5'h1e: normal_out = 16'h5cb5;
              5'h1f: normal_out = 16'h5cbb;
              default: begin end
            endcase
          end
          5'h01: begin
            normal_out = 16'h5cc2;
            case (mant[4:0])
              5'h01: normal_out = 16'h5cc8;
              5'h02: normal_out = 16'h5ccf;
              5'h03: normal_out = 16'h5cd6;
              5'h04: normal_out = 16'h5cdc;
              5'h05: normal_out = 16'h5ce3;
              5'h06: normal_out = 16'h5cea;
              5'h07: normal_out = 16'h5cf1;
              5'h08: normal_out = 16'h5cf8;
              5'h09: normal_out = 16'h5cff;
              5'h0a: normal_out = 16'h5d06;
              5'h0b: normal_out = 16'h5d0c;
              5'h0c: normal_out = 16'h5d14;
              5'h0d: normal_out = 16'h5d1b;
              5'h0e: normal_out = 16'h5d22;
              5'h0f: normal_out = 16'h5d29;
              5'h10: normal_out = 16'h5d30;
              5'h11: normal_out = 16'h5d37;
              5'h12: normal_out = 16'h5d3e;
              5'h13: normal_out = 16'h5d46;
              5'h14: normal_out = 16'h5d4d;
              5'h15: normal_out = 16'h5d54;
              5'h16: normal_out = 16'h5d5c;
              5'h17: normal_out = 16'h5d63;
              5'h18: normal_out = 16'h5d6b;
              5'h19: normal_out = 16'h5d72;
              5'h1a: normal_out = 16'h5d7a;
              5'h1b: normal_out = 16'h5d81;
              5'h1c: normal_out = 16'h5d89;
              5'h1d: normal_out = 16'h5d91;
              5'h1e: normal_out = 16'h5d99;
              5'h1f: normal_out = 16'h5da0;
              default: begin end
            endcase
          end
          5'h02: begin
            normal_out = 16'h5da8;
            case (mant[4:0])
              5'h01: normal_out = 16'h5db0;
              5'h02: normal_out = 16'h5db8;
              5'h03: normal_out = 16'h5dc0;
              5'h04: normal_out = 16'h5dc8;
              5'h05: normal_out = 16'h5dd0;
              5'h06: normal_out = 16'h5dd8;
              5'h07: normal_out = 16'h5de0;
              5'h08: normal_out = 16'h5de8;
              5'h09: normal_out = 16'h5df0;
              5'h0a: normal_out = 16'h5df9;
              5'h0b: normal_out = 16'h5e01;
              5'h0c: normal_out = 16'h5e09;
              5'h0d: normal_out = 16'h5e12;
              5'h0e: normal_out = 16'h5e1a;
              5'h0f: normal_out = 16'h5e23;
              5'h10: normal_out = 16'h5e2b;
              5'h11: normal_out = 16'h5e34;
              5'h12: normal_out = 16'h5e3c;
              5'h13: normal_out = 16'h5e45;
              5'h14: normal_out = 16'h5e4e;
              5'h15: normal_out = 16'h5e57;
              5'h16: normal_out = 16'h5e5f;
              5'h17: normal_out = 16'h5e68;
              5'h18: normal_out = 16'h5e71;
              5'h19: normal_out = 16'h5e7a;
              5'h1a: normal_out = 16'h5e83;
              5'h1b: normal_out = 16'h5e8c;
              5'h1c: normal_out = 16'h5e95;
              5'h1d: normal_out = 16'h5e9e;
              5'h1e: normal_out = 16'h5ea8;
              5'h1f: normal_out = 16'h5eb1;
              default: begin end
            endcase
          end
          5'h03: begin
            normal_out = 16'h5eba;
            case (mant[4:0])
              5'h01: normal_out = 16'h5ec4;
              5'h02: normal_out = 16'h5ecd;
              5'h03: normal_out = 16'h5ed6;
              5'h04: normal_out = 16'h5ee0;
              5'h05: normal_out = 16'h5ee9;
              5'h06: normal_out = 16'h5ef3;
              5'h07: normal_out = 16'h5efd;
              5'h08: normal_out = 16'h5f06;
              5'h09: normal_out = 16'h5f10;
              5'h0a: normal_out = 16'h5f1a;
              5'h0b: normal_out = 16'h5f24;
              5'h0c: normal_out = 16'h5f2e;
              5'h0d: normal_out = 16'h5f38;
              5'h0e: normal_out = 16'h5f42;
              5'h0f: normal_out = 16'h5f4c;
              5'h10: normal_out = 16'h5f56;
              5'h11: normal_out = 16'h5f60;
              5'h12: normal_out = 16'h5f6a;
              5'h13: normal_out = 16'h5f75;
              5'h14: normal_out = 16'h5f7f;
              5'h15: normal_out = 16'h5f8a;
              5'h16: normal_out = 16'h5f94;
              5'h17: normal_out = 16'h5f9f;
              5'h18: normal_out = 16'h5fa9;
              5'h19: normal_out = 16'h5fb4;
              5'h1a: normal_out = 16'h5fbf;
              5'h1b: normal_out = 16'h5fc9;
              5'h1c: normal_out = 16'h5fd4;
              5'h1d: normal_out = 16'h5fdf;
              5'h1e: normal_out = 16'h5fea;
              5'h1f: normal_out = 16'h5ff5;
              default: begin end
            endcase
          end
          5'h04: begin
            normal_out = 16'h6000;
            case (mant[4:0])
              5'h01: normal_out = 16'h6006;
              5'h02: normal_out = 16'h600b;
              5'h03: normal_out = 16'h6011;
              5'h04: normal_out = 16'h6016;
              5'h05: normal_out = 16'h601c;
              5'h06: normal_out = 16'h6022;
              5'h07: normal_out = 16'h6028;
              5'h08: normal_out = 16'h602d;
              5'h09: normal_out = 16'h6033;
              5'h0a: normal_out = 16'h6039;
              5'h0b: normal_out = 16'h603f;
              5'h0c: normal_out = 16'h6045;
              5'h0d: normal_out = 16'h604b;
              5'h0e: normal_out = 16'h6051;
              5'h0f: normal_out = 16'h6057;
              5'h10: normal_out = 16'h605d;
              5'h11: normal_out = 16'h6063;
              5'h12: normal_out = 16'h6069;
              5'h13: normal_out = 16'h606f;
              5'h14: normal_out = 16'h6075;
              5'h15: normal_out = 16'h607b;
              5'h16: normal_out = 16'h6082;
              5'h17: normal_out = 16'h6088;
              5'h18: normal_out = 16'h608e;
              5'h19: normal_out = 16'h6094;
              5'h1a: normal_out = 16'h609b;
              5'h1b: normal_out = 16'h60a1;
              5'h1c: normal_out = 16'h60a8;
              5'h1d: normal_out = 16'h60ae;
              5'h1e: normal_out = 16'h60b5;
              5'h1f: normal_out = 16'h60bb;
              default: begin end
            endcase
          end
          5'h05: begin
            normal_out = 16'h60c2;
            case (mant[4:0])
              5'h01: normal_out = 16'h60c8;
              5'h02: normal_out = 16'h60cf;
              5'h03: normal_out = 16'h60d6;
              5'h04: normal_out = 16'h60dc;
              5'h05: normal_out = 16'h60e3;
              5'h06: normal_out = 16'h60ea;
              5'h07: normal_out = 16'h60f1;
              5'h08: normal_out = 16'h60f8;
              5'h09: normal_out = 16'h60ff;
              5'h0a: normal_out = 16'h6106;
              5'h0b: normal_out = 16'h610c;
              5'h0c: normal_out = 16'h6114;
              5'h0d: normal_out = 16'h611b;
              5'h0e: normal_out = 16'h6122;
              5'h0f: normal_out = 16'h6129;
              5'h10: normal_out = 16'h6130;
              5'h11: normal_out = 16'h6137;
              5'h12: normal_out = 16'h613e;
              5'h13: normal_out = 16'h6146;
              5'h14: normal_out = 16'h614d;
              5'h15: normal_out = 16'h6154;
              5'h16: normal_out = 16'h615c;
              5'h17: normal_out = 16'h6163;
              5'h18: normal_out = 16'h616b;
              5'h19: normal_out = 16'h6172;
              5'h1a: normal_out = 16'h617a;
              5'h1b: normal_out = 16'h6181;
              5'h1c: normal_out = 16'h6189;
              5'h1d: normal_out = 16'h6191;
              5'h1e: normal_out = 16'h6199;
              5'h1f: normal_out = 16'h61a0;
              default: begin end
            endcase
          end
          5'h06: begin
            normal_out = 16'h61a8;
            case (mant[4:0])
              5'h01: normal_out = 16'h61b0;
              5'h02: normal_out = 16'h61b8;
              5'h03: normal_out = 16'h61c0;
              5'h04: normal_out = 16'h61c8;
              5'h05: normal_out = 16'h61d0;
              5'h06: normal_out = 16'h61d8;
              5'h07: normal_out = 16'h61e0;
              5'h08: normal_out = 16'h61e8;
              5'h09: normal_out = 16'h61f0;
              5'h0a: normal_out = 16'h61f9;
              5'h0b: normal_out = 16'h6201;
              5'h0c: normal_out = 16'h6209;
              5'h0d: normal_out = 16'h6212;
              5'h0e: normal_out = 16'h621a;
              5'h0f: normal_out = 16'h6223;
              5'h10: normal_out = 16'h622b;
              5'h11: normal_out = 16'h6234;
              5'h12: normal_out = 16'h623c;
              5'h13: normal_out = 16'h6245;
              5'h14: normal_out = 16'h624e;
              5'h15: normal_out = 16'h6257;
              5'h16: normal_out = 16'h625f;
              5'h17: normal_out = 16'h6268;
              5'h18: normal_out = 16'h6271;
              5'h19: normal_out = 16'h627a;
              5'h1a: normal_out = 16'h6283;
              5'h1b: normal_out = 16'h628c;
              5'h1c: normal_out = 16'h6295;
              5'h1d: normal_out = 16'h629e;
              5'h1e: normal_out = 16'h62a8;
              5'h1f: normal_out = 16'h62b1;
              default: begin end
            endcase
          end
          5'h07: begin
            normal_out = 16'h62ba;
            case (mant[4:0])
              5'h01: normal_out = 16'h62c4;
              5'h02: normal_out = 16'h62cd;
              5'h03: normal_out = 16'h62d6;
              5'h04: normal_out = 16'h62e0;
              5'h05: normal_out = 16'h62e9;
              5'h06: normal_out = 16'h62f3;
              5'h07: normal_out = 16'h62fd;
              5'h08: normal_out = 16'h6306;
              5'h09: normal_out = 16'h6310;
              5'h0a: normal_out = 16'h631a;
              5'h0b: normal_out = 16'h6324;
              5'h0c: normal_out = 16'h632e;
              5'h0d: normal_out = 16'h6338;
              5'h0e: normal_out = 16'h6342;
              5'h0f: normal_out = 16'h634c;
              5'h10: normal_out = 16'h6356;
              5'h11: normal_out = 16'h6360;
              5'h12: normal_out = 16'h636a;
              5'h13: normal_out = 16'h6375;
              5'h14: normal_out = 16'h637f;
              5'h15: normal_out = 16'h638a;
              5'h16: normal_out = 16'h6394;
              5'h17: normal_out = 16'h639f;
              5'h18: normal_out = 16'h63a9;
              5'h19: normal_out = 16'h63b4;
              5'h1a: normal_out = 16'h63bf;
              5'h1b: normal_out = 16'h63c9;
              5'h1c: normal_out = 16'h63d4;
              5'h1d: normal_out = 16'h63df;
              5'h1e: normal_out = 16'h63ea;
              5'h1f: normal_out = 16'h63f5;
              default: begin end
            endcase
          end
          5'h08: begin
            normal_out = 16'h6400;
            case (mant[4:0])
              5'h01: normal_out = 16'h6406;
              5'h02: normal_out = 16'h640b;
              5'h03: normal_out = 16'h6411;
              5'h04: normal_out = 16'h6416;
              5'h05: normal_out = 16'h641c;
              5'h06: normal_out = 16'h6422;
              5'h07: normal_out = 16'h6428;
              5'h08: normal_out = 16'h642d;
              5'h09: normal_out = 16'h6433;
              5'h0a: normal_out = 16'h6439;
              5'h0b: normal_out = 16'h643f;
              5'h0c: normal_out = 16'h6445;
              5'h0d: normal_out = 16'h644b;
              5'h0e: normal_out = 16'h6451;
              5'h0f: normal_out = 16'h6457;
              5'h10: normal_out = 16'h645d;
              5'h11: normal_out = 16'h6463;
              5'h12: normal_out = 16'h6469;
              5'h13: normal_out = 16'h646f;
              5'h14: normal_out = 16'h6475;
              5'h15: normal_out = 16'h647b;
              5'h16: normal_out = 16'h6482;
              5'h17: normal_out = 16'h6488;
              5'h18: normal_out = 16'h648e;
              5'h19: normal_out = 16'h6494;
              5'h1a: normal_out = 16'h649b;
              5'h1b: normal_out = 16'h64a1;
              5'h1c: normal_out = 16'h64a8;
              5'h1d: normal_out = 16'h64ae;
              5'h1e: normal_out = 16'h64b5;
              5'h1f: normal_out = 16'h64bb;
              default: begin end
            endcase
          end
          5'h09: begin
            normal_out = 16'h64c2;
            case (mant[4:0])
              5'h01: normal_out = 16'h64c8;
              5'h02: normal_out = 16'h64cf;
              5'h03: normal_out = 16'h64d6;
              5'h04: normal_out = 16'h64dc;
              5'h05: normal_out = 16'h64e3;
              5'h06: normal_out = 16'h64ea;
              5'h07: normal_out = 16'h64f1;
              5'h08: normal_out = 16'h64f8;
              5'h09: normal_out = 16'h64ff;
              5'h0a: normal_out = 16'h6506;
              5'h0b: normal_out = 16'h650c;
              5'h0c: normal_out = 16'h6514;
              5'h0d: normal_out = 16'h651b;
              5'h0e: normal_out = 16'h6522;
              5'h0f: normal_out = 16'h6529;
              5'h10: normal_out = 16'h6530;
              5'h11: normal_out = 16'h6537;
              5'h12: normal_out = 16'h653e;
              5'h13: normal_out = 16'h6546;
              5'h14: normal_out = 16'h654d;
              5'h15: normal_out = 16'h6554;
              5'h16: normal_out = 16'h655c;
              5'h17: normal_out = 16'h6563;
              5'h18: normal_out = 16'h656b;
              5'h19: normal_out = 16'h6572;
              5'h1a: normal_out = 16'h657a;
              5'h1b: normal_out = 16'h6581;
              5'h1c: normal_out = 16'h6589;
              5'h1d: normal_out = 16'h6591;
              5'h1e: normal_out = 16'h6599;
              5'h1f: normal_out = 16'h65a0;
              default: begin end
            endcase
          end
          5'h0a: begin
            normal_out = 16'h65a8;
            case (mant[4:0])
              5'h01: normal_out = 16'h65b0;
              5'h02: normal_out = 16'h65b8;
              5'h03: normal_out = 16'h65c0;
              5'h04: normal_out = 16'h65c8;
              5'h05: normal_out = 16'h65d0;
              5'h06: normal_out = 16'h65d8;
              5'h07: normal_out = 16'h65e0;
              5'h08: normal_out = 16'h65e8;
              5'h09: normal_out = 16'h65f0;
              5'h0a: normal_out = 16'h65f9;
              5'h0b: normal_out = 16'h6601;
              5'h0c: normal_out = 16'h6609;
              5'h0d: normal_out = 16'h6612;
              5'h0e: normal_out = 16'h661a;
              5'h0f: normal_out = 16'h6623;
              5'h10: normal_out = 16'h662b;
              5'h11: normal_out = 16'h6634;
              5'h12: normal_out = 16'h663c;
              5'h13: normal_out = 16'h6645;
              5'h14: normal_out = 16'h664e;
              5'h15: normal_out = 16'h6657;
              5'h16: normal_out = 16'h665f;
              5'h17: normal_out = 16'h6668;
              5'h18: normal_out = 16'h6671;
              5'h19: normal_out = 16'h667a;
              5'h1a: normal_out = 16'h6683;
              5'h1b: normal_out = 16'h668c;
              5'h1c: normal_out = 16'h6695;
              5'h1d: normal_out = 16'h669e;
              5'h1e: normal_out = 16'h66a8;
              5'h1f: normal_out = 16'h66b1;
              default: begin end
            endcase
          end
          5'h0b: begin
            normal_out = 16'h66ba;
            case (mant[4:0])
              5'h01: normal_out = 16'h66c4;
              5'h02: normal_out = 16'h66cd;
              5'h03: normal_out = 16'h66d6;
              5'h04: normal_out = 16'h66e0;
              5'h05: normal_out = 16'h66e9;
              5'h06: normal_out = 16'h66f3;
              5'h07: normal_out = 16'h66fd;
              5'h08: normal_out = 16'h6706;
              5'h09: normal_out = 16'h6710;
              5'h0a: normal_out = 16'h671a;
              5'h0b: normal_out = 16'h6724;
              5'h0c: normal_out = 16'h672e;
              5'h0d: normal_out = 16'h6738;
              5'h0e: normal_out = 16'h6742;
              5'h0f: normal_out = 16'h674c;
              5'h10: normal_out = 16'h6756;
              5'h11: normal_out = 16'h6760;
              5'h12: normal_out = 16'h676a;
              5'h13: normal_out = 16'h6775;
              5'h14: normal_out = 16'h677f;
              5'h15: normal_out = 16'h678a;
              5'h16: normal_out = 16'h6794;
              5'h17: normal_out = 16'h679f;
              5'h18: normal_out = 16'h67a9;
              5'h19: normal_out = 16'h67b4;
              5'h1a: normal_out = 16'h67bf;
              5'h1b: normal_out = 16'h67c9;
              5'h1c: normal_out = 16'h67d4;
              5'h1d: normal_out = 16'h67df;
              5'h1e: normal_out = 16'h67ea;
              5'h1f: normal_out = 16'h67f5;
              default: begin end
            endcase
          end
          5'h0c: begin
            normal_out = 16'h6800;
            case (mant[4:0])
              5'h01: normal_out = 16'h6806;
              5'h02: normal_out = 16'h680b;
              5'h03: normal_out = 16'h6811;
              5'h04: normal_out = 16'h6816;
              5'h05: normal_out = 16'h681c;
              5'h06: normal_out = 16'h6822;
              5'h07: normal_out = 16'h6828;
              5'h08: normal_out = 16'h682d;
              5'h09: normal_out = 16'h6833;
              5'h0a: normal_out = 16'h6839;
              5'h0b: normal_out = 16'h683f;
              5'h0c: normal_out = 16'h6845;
              5'h0d: normal_out = 16'h684b;
              5'h0e: normal_out = 16'h6851;
              5'h0f: normal_out = 16'h6857;
              5'h10: normal_out = 16'h685d;
              5'h11: normal_out = 16'h6863;
              5'h12: normal_out = 16'h6869;
              5'h13: normal_out = 16'h686f;
              5'h14: normal_out = 16'h6875;
              5'h15: normal_out = 16'h687b;
              5'h16: normal_out = 16'h6882;
              5'h17: normal_out = 16'h6888;
              5'h18: normal_out = 16'h688e;
              5'h19: normal_out = 16'h6894;
              5'h1a: normal_out = 16'h689b;
              5'h1b: normal_out = 16'h68a1;
              5'h1c: normal_out = 16'h68a8;
              5'h1d: normal_out = 16'h68ae;
              5'h1e: normal_out = 16'h68b5;
              5'h1f: normal_out = 16'h68bb;
              default: begin end
            endcase
          end
          5'h0d: begin
            normal_out = 16'h68c2;
            case (mant[4:0])
              5'h01: normal_out = 16'h68c8;
              5'h02: normal_out = 16'h68cf;
              5'h03: normal_out = 16'h68d6;
              5'h04: normal_out = 16'h68dc;
              5'h05: normal_out = 16'h68e3;
              5'h06: normal_out = 16'h68ea;
              5'h07: normal_out = 16'h68f1;
              5'h08: normal_out = 16'h68f8;
              5'h09: normal_out = 16'h68ff;
              5'h0a: normal_out = 16'h6906;
              5'h0b: normal_out = 16'h690c;
              5'h0c: normal_out = 16'h6914;
              5'h0d: normal_out = 16'h691b;
              5'h0e: normal_out = 16'h6922;
              5'h0f: normal_out = 16'h6929;
              5'h10: normal_out = 16'h6930;
              5'h11: normal_out = 16'h6937;
              5'h12: normal_out = 16'h693e;
              5'h13: normal_out = 16'h6946;
              5'h14: normal_out = 16'h694d;
              5'h15: normal_out = 16'h6954;
              5'h16: normal_out = 16'h695c;
              5'h17: normal_out = 16'h6963;
              5'h18: normal_out = 16'h696b;
              5'h19: normal_out = 16'h6972;
              5'h1a: normal_out = 16'h697a;
              5'h1b: normal_out = 16'h6981;
              5'h1c: normal_out = 16'h6989;
              5'h1d: normal_out = 16'h6991;
              5'h1e: normal_out = 16'h6999;
              5'h1f: normal_out = 16'h69a0;
              default: begin end
            endcase
          end
          5'h0e: begin
            normal_out = 16'h69a8;
            case (mant[4:0])
              5'h01: normal_out = 16'h69b0;
              5'h02: normal_out = 16'h69b8;
              5'h03: normal_out = 16'h69c0;
              5'h04: normal_out = 16'h69c8;
              5'h05: normal_out = 16'h69d0;
              5'h06: normal_out = 16'h69d8;
              5'h07: normal_out = 16'h69e0;
              5'h08: normal_out = 16'h69e8;
              5'h09: normal_out = 16'h69f0;
              5'h0a: normal_out = 16'h69f9;
              5'h0b: normal_out = 16'h6a01;
              5'h0c: normal_out = 16'h6a09;
              5'h0d: normal_out = 16'h6a12;
              5'h0e: normal_out = 16'h6a1a;
              5'h0f: normal_out = 16'h6a23;
              5'h10: normal_out = 16'h6a2b;
              5'h11: normal_out = 16'h6a34;
              5'h12: normal_out = 16'h6a3c;
              5'h13: normal_out = 16'h6a45;
              5'h14: normal_out = 16'h6a4e;
              5'h15: normal_out = 16'h6a57;
              5'h16: normal_out = 16'h6a5f;
              5'h17: normal_out = 16'h6a68;
              5'h18: normal_out = 16'h6a71;
              5'h19: normal_out = 16'h6a7a;
              5'h1a: normal_out = 16'h6a83;
              5'h1b: normal_out = 16'h6a8c;
              5'h1c: normal_out = 16'h6a95;
              5'h1d: normal_out = 16'h6a9e;
              5'h1e: normal_out = 16'h6aa8;
              5'h1f: normal_out = 16'h6ab1;
              default: begin end
            endcase
          end
          5'h0f: begin
            normal_out = 16'h6aba;
            case (mant[4:0])
              5'h01: normal_out = 16'h6ac4;
              5'h02: normal_out = 16'h6acd;
              5'h03: normal_out = 16'h6ad6;
              5'h04: normal_out = 16'h6ae0;
              5'h05: normal_out = 16'h6ae9;
              5'h06: normal_out = 16'h6af3;
              5'h07: normal_out = 16'h6afd;
              5'h08: normal_out = 16'h6b06;
              5'h09: normal_out = 16'h6b10;
              5'h0a: normal_out = 16'h6b1a;
              5'h0b: normal_out = 16'h6b24;
              5'h0c: normal_out = 16'h6b2e;
              5'h0d: normal_out = 16'h6b38;
              5'h0e: normal_out = 16'h6b42;
              5'h0f: normal_out = 16'h6b4c;
              5'h10: normal_out = 16'h6b56;
              5'h11: normal_out = 16'h6b60;
              5'h12: normal_out = 16'h6b6a;
              5'h13: normal_out = 16'h6b75;
              5'h14: normal_out = 16'h6b7f;
              5'h15: normal_out = 16'h6b8a;
              5'h16: normal_out = 16'h6b94;
              5'h17: normal_out = 16'h6b9f;
              5'h18: normal_out = 16'h6ba9;
              5'h19: normal_out = 16'h6bb4;
              5'h1a: normal_out = 16'h6bbf;
              5'h1b: normal_out = 16'h6bc9;
              5'h1c: normal_out = 16'h6bd4;
              5'h1d: normal_out = 16'h6bdf;
              5'h1e: normal_out = 16'h6bea;
              5'h1f: normal_out = 16'h6bf5;
              default: begin end
            endcase
          end
          5'h10: begin
            normal_out = 16'h6c00;
            case (mant[4:0])
              5'h01: normal_out = 16'h6c06;
              5'h02: normal_out = 16'h6c0b;
              5'h03: normal_out = 16'h6c11;
              5'h04: normal_out = 16'h6c16;
              5'h05: normal_out = 16'h6c1c;
              5'h06: normal_out = 16'h6c22;
              5'h07: normal_out = 16'h6c28;
              5'h08: normal_out = 16'h6c2d;
              5'h09: normal_out = 16'h6c33;
              5'h0a: normal_out = 16'h6c39;
              5'h0b: normal_out = 16'h6c3f;
              5'h0c: normal_out = 16'h6c45;
              5'h0d: normal_out = 16'h6c4b;
              5'h0e: normal_out = 16'h6c51;
              5'h0f: normal_out = 16'h6c57;
              5'h10: normal_out = 16'h6c5d;
              5'h11: normal_out = 16'h6c63;
              5'h12: normal_out = 16'h6c69;
              5'h13: normal_out = 16'h6c6f;
              5'h14: normal_out = 16'h6c75;
              5'h15: normal_out = 16'h6c7b;
              5'h16: normal_out = 16'h6c82;
              5'h17: normal_out = 16'h6c88;
              5'h18: normal_out = 16'h6c8e;
              5'h19: normal_out = 16'h6c94;
              5'h1a: normal_out = 16'h6c9b;
              5'h1b: normal_out = 16'h6ca1;
              5'h1c: normal_out = 16'h6ca8;
              5'h1d: normal_out = 16'h6cae;
              5'h1e: normal_out = 16'h6cb5;
              5'h1f: normal_out = 16'h6cbb;
              default: begin end
            endcase
          end
          5'h11: begin
            normal_out = 16'h6cc2;
            case (mant[4:0])
              5'h01: normal_out = 16'h6cc8;
              5'h02: normal_out = 16'h6ccf;
              5'h03: normal_out = 16'h6cd6;
              5'h04: normal_out = 16'h6cdc;
              5'h05: normal_out = 16'h6ce3;
              5'h06: normal_out = 16'h6cea;
              5'h07: normal_out = 16'h6cf1;
              5'h08: normal_out = 16'h6cf8;
              5'h09: normal_out = 16'h6cff;
              5'h0a: normal_out = 16'h6d06;
              5'h0b: normal_out = 16'h6d0c;
              5'h0c: normal_out = 16'h6d14;
              5'h0d: normal_out = 16'h6d1b;
              5'h0e: normal_out = 16'h6d22;
              5'h0f: normal_out = 16'h6d29;
              5'h10: normal_out = 16'h6d30;
              5'h11: normal_out = 16'h6d37;
              5'h12: normal_out = 16'h6d3e;
              5'h13: normal_out = 16'h6d46;
              5'h14: normal_out = 16'h6d4d;
              5'h15: normal_out = 16'h6d54;
              5'h16: normal_out = 16'h6d5c;
              5'h17: normal_out = 16'h6d63;
              5'h18: normal_out = 16'h6d6b;
              5'h19: normal_out = 16'h6d72;
              5'h1a: normal_out = 16'h6d7a;
              5'h1b: normal_out = 16'h6d81;
              5'h1c: normal_out = 16'h6d89;
              5'h1d: normal_out = 16'h6d91;
              5'h1e: normal_out = 16'h6d99;
              5'h1f: normal_out = 16'h6da0;
              default: begin end
            endcase
          end
          5'h12: begin
            normal_out = 16'h6da8;
            case (mant[4:0])
              5'h01: normal_out = 16'h6db0;
              5'h02: normal_out = 16'h6db8;
              5'h03: normal_out = 16'h6dc0;
              5'h04: normal_out = 16'h6dc8;
              5'h05: normal_out = 16'h6dd0;
              5'h06: normal_out = 16'h6dd8;
              5'h07: normal_out = 16'h6de0;
              5'h08: normal_out = 16'h6de8;
              5'h09: normal_out = 16'h6df0;
              5'h0a: normal_out = 16'h6df9;
              5'h0b: normal_out = 16'h6e01;
              5'h0c: normal_out = 16'h6e09;
              5'h0d: normal_out = 16'h6e12;
              5'h0e: normal_out = 16'h6e1a;
              5'h0f: normal_out = 16'h6e23;
              5'h10: normal_out = 16'h6e2b;
              5'h11: normal_out = 16'h6e34;
              5'h12: normal_out = 16'h6e3c;
              5'h13: normal_out = 16'h6e45;
              5'h14: normal_out = 16'h6e4e;
              5'h15: normal_out = 16'h6e57;
              5'h16: normal_out = 16'h6e5f;
              5'h17: normal_out = 16'h6e68;
              5'h18: normal_out = 16'h6e71;
              5'h19: normal_out = 16'h6e7a;
              5'h1a: normal_out = 16'h6e83;
              5'h1b: normal_out = 16'h6e8c;
              5'h1c: normal_out = 16'h6e95;
              5'h1d: normal_out = 16'h6e9e;
              5'h1e: normal_out = 16'h6ea8;
              5'h1f: normal_out = 16'h6eb1;
              default: begin end
            endcase
          end
          5'h13: begin
            normal_out = 16'h6eba;
            case (mant[4:0])
              5'h01: normal_out = 16'h6ec4;
              5'h02: normal_out = 16'h6ecd;
              5'h03: normal_out = 16'h6ed6;
              5'h04: normal_out = 16'h6ee0;
              5'h05: normal_out = 16'h6ee9;
              5'h06: normal_out = 16'h6ef3;
              5'h07: normal_out = 16'h6efd;
              5'h08: normal_out = 16'h6f06;
              5'h09: normal_out = 16'h6f10;
              5'h0a: normal_out = 16'h6f1a;
              5'h0b: normal_out = 16'h6f24;
              5'h0c: normal_out = 16'h6f2e;
              5'h0d: normal_out = 16'h6f38;
              5'h0e: normal_out = 16'h6f42;
              5'h0f: normal_out = 16'h6f4c;
              5'h10: normal_out = 16'h6f56;
              5'h11: normal_out = 16'h6f60;
              5'h12: normal_out = 16'h6f6a;
              5'h13: normal_out = 16'h6f75;
              5'h14: normal_out = 16'h6f7f;
              5'h15: normal_out = 16'h6f8a;
              5'h16: normal_out = 16'h6f94;
              5'h17: normal_out = 16'h6f9f;
              5'h18: normal_out = 16'h6fa9;
              5'h19: normal_out = 16'h6fb4;
              5'h1a: normal_out = 16'h6fbf;
              5'h1b: normal_out = 16'h6fc9;
              5'h1c: normal_out = 16'h6fd4;
              5'h1d: normal_out = 16'h6fdf;
              5'h1e: normal_out = 16'h6fea;
              5'h1f: normal_out = 16'h6ff5;
              default: begin end
            endcase
          end
          5'h14: begin
            normal_out = 16'h7000;
            case (mant[4:0])
              5'h01: normal_out = 16'h7006;
              5'h02: normal_out = 16'h700b;
              5'h03: normal_out = 16'h7011;
              5'h04: normal_out = 16'h7016;
              5'h05: normal_out = 16'h701c;
              5'h06: normal_out = 16'h7022;
              5'h07: normal_out = 16'h7028;
              5'h08: normal_out = 16'h702d;
              5'h09: normal_out = 16'h7033;
              5'h0a: normal_out = 16'h7039;
              5'h0b: normal_out = 16'h703f;
              5'h0c: normal_out = 16'h7045;
              5'h0d: normal_out = 16'h704b;
              5'h0e: normal_out = 16'h7051;
              5'h0f: normal_out = 16'h7057;
              5'h10: normal_out = 16'h705d;
              5'h11: normal_out = 16'h7063;
              5'h12: normal_out = 16'h7069;
              5'h13: normal_out = 16'h706f;
              5'h14: normal_out = 16'h7075;
              5'h15: normal_out = 16'h707b;
              5'h16: normal_out = 16'h7082;
              5'h17: normal_out = 16'h7088;
              5'h18: normal_out = 16'h708e;
              5'h19: normal_out = 16'h7094;
              5'h1a: normal_out = 16'h709b;
              5'h1b: normal_out = 16'h70a1;
              5'h1c: normal_out = 16'h70a8;
              5'h1d: normal_out = 16'h70ae;
              5'h1e: normal_out = 16'h70b5;
              5'h1f: normal_out = 16'h70bb;
              default: begin end
            endcase
          end
          5'h15: begin
            normal_out = 16'h70c2;
            case (mant[4:0])
              5'h01: normal_out = 16'h70c8;
              5'h02: normal_out = 16'h70cf;
              5'h03: normal_out = 16'h70d6;
              5'h04: normal_out = 16'h70dc;
              5'h05: normal_out = 16'h70e3;
              5'h06: normal_out = 16'h70ea;
              5'h07: normal_out = 16'h70f1;
              5'h08: normal_out = 16'h70f8;
              5'h09: normal_out = 16'h70ff;
              5'h0a: normal_out = 16'h7106;
              5'h0b: normal_out = 16'h710c;
              5'h0c: normal_out = 16'h7114;
              5'h0d: normal_out = 16'h711b;
              5'h0e: normal_out = 16'h7122;
              5'h0f: normal_out = 16'h7129;
              5'h10: normal_out = 16'h7130;
              5'h11: normal_out = 16'h7137;
              5'h12: normal_out = 16'h713e;
              5'h13: normal_out = 16'h7146;
              5'h14: normal_out = 16'h714d;
              5'h15: normal_out = 16'h7154;
              5'h16: normal_out = 16'h715c;
              5'h17: normal_out = 16'h7163;
              5'h18: normal_out = 16'h716b;
              5'h19: normal_out = 16'h7172;
              5'h1a: normal_out = 16'h717a;
              5'h1b: normal_out = 16'h7181;
              5'h1c: normal_out = 16'h7189;
              5'h1d: normal_out = 16'h7191;
              5'h1e: normal_out = 16'h7199;
              5'h1f: normal_out = 16'h71a0;
              default: begin end
            endcase
          end
          5'h16: begin
            normal_out = 16'h71a8;
            case (mant[4:0])
              5'h01: normal_out = 16'h71b0;
              5'h02: normal_out = 16'h71b8;
              5'h03: normal_out = 16'h71c0;
              5'h04: normal_out = 16'h71c8;
              5'h05: normal_out = 16'h71d0;
              5'h06: normal_out = 16'h71d8;
              5'h07: normal_out = 16'h71e0;
              5'h08: normal_out = 16'h71e8;
              5'h09: normal_out = 16'h71f0;
              5'h0a: normal_out = 16'h71f9;
              5'h0b: normal_out = 16'h7201;
              5'h0c: normal_out = 16'h7209;
              5'h0d: normal_out = 16'h7212;
              5'h0e: normal_out = 16'h721a;
              5'h0f: normal_out = 16'h7223;
              5'h10: normal_out = 16'h722b;
              5'h11: normal_out = 16'h7234;
              5'h12: normal_out = 16'h723c;
              5'h13: normal_out = 16'h7245;
              5'h14: normal_out = 16'h724e;
              5'h15: normal_out = 16'h7257;
              5'h16: normal_out = 16'h725f;
              5'h17: normal_out = 16'h7268;
              5'h18: normal_out = 16'h7271;
              5'h19: normal_out = 16'h727a;
              5'h1a: normal_out = 16'h7283;
              5'h1b: normal_out = 16'h728c;
              5'h1c: normal_out = 16'h7295;
              5'h1d: normal_out = 16'h729e;
              5'h1e: normal_out = 16'h72a8;
              5'h1f: normal_out = 16'h72b1;
              default: begin end
            endcase
          end
          5'h17: begin
            normal_out = 16'h72ba;
            case (mant[4:0])
              5'h01: normal_out = 16'h72c4;
              5'h02: normal_out = 16'h72cd;
              5'h03: normal_out = 16'h72d6;
              5'h04: normal_out = 16'h72e0;
              5'h05: normal_out = 16'h72e9;
              5'h06: normal_out = 16'h72f3;
              5'h07: normal_out = 16'h72fd;
              5'h08: normal_out = 16'h7306;
              5'h09: normal_out = 16'h7310;
              5'h0a: normal_out = 16'h731a;
              5'h0b: normal_out = 16'h7324;
              5'h0c: normal_out = 16'h732e;
              5'h0d: normal_out = 16'h7338;
              5'h0e: normal_out = 16'h7342;
              5'h0f: normal_out = 16'h734c;
              5'h10: normal_out = 16'h7356;
              5'h11: normal_out = 16'h7360;
              5'h12: normal_out = 16'h736a;
              5'h13: normal_out = 16'h7375;
              5'h14: normal_out = 16'h737f;
              5'h15: normal_out = 16'h738a;
              5'h16: normal_out = 16'h7394;
              5'h17: normal_out = 16'h739f;
              5'h18: normal_out = 16'h73a9;
              5'h19: normal_out = 16'h73b4;
              5'h1a: normal_out = 16'h73bf;
              5'h1b: normal_out = 16'h73c9;
              5'h1c: normal_out = 16'h73d4;
              5'h1d: normal_out = 16'h73df;
              5'h1e: normal_out = 16'h73ea;
              5'h1f: normal_out = 16'h73f5;
              default: begin end
            endcase
          end
          5'h18: begin
            normal_out = 16'h7400;
            case (mant[4:0])
              5'h01: normal_out = 16'h7406;
              5'h02: normal_out = 16'h740b;
              5'h03: normal_out = 16'h7411;
              5'h04: normal_out = 16'h7416;
              5'h05: normal_out = 16'h741c;
              5'h06: normal_out = 16'h7422;
              5'h07: normal_out = 16'h7428;
              5'h08: normal_out = 16'h742d;
              5'h09: normal_out = 16'h7433;
              5'h0a: normal_out = 16'h7439;
              5'h0b: normal_out = 16'h743f;
              5'h0c: normal_out = 16'h7445;
              5'h0d: normal_out = 16'h744b;
              5'h0e: normal_out = 16'h7451;
              5'h0f: normal_out = 16'h7457;
              5'h10: normal_out = 16'h745d;
              5'h11: normal_out = 16'h7463;
              5'h12: normal_out = 16'h7469;
              5'h13: normal_out = 16'h746f;
              5'h14: normal_out = 16'h7475;
              5'h15: normal_out = 16'h747b;
              5'h16: normal_out = 16'h7482;
              5'h17: normal_out = 16'h7488;
              5'h18: normal_out = 16'h748e;
              5'h19: normal_out = 16'h7494;
              5'h1a: normal_out = 16'h749b;
              5'h1b: normal_out = 16'h74a1;
              5'h1c: normal_out = 16'h74a8;
              5'h1d: normal_out = 16'h74ae;
              5'h1e: normal_out = 16'h74b5;
              5'h1f: normal_out = 16'h74bb;
              default: begin end
            endcase
          end
          5'h19: begin
            normal_out = 16'h74c2;
            case (mant[4:0])
              5'h01: normal_out = 16'h74c8;
              5'h02: normal_out = 16'h74cf;
              5'h03: normal_out = 16'h74d6;
              5'h04: normal_out = 16'h74dc;
              5'h05: normal_out = 16'h74e3;
              5'h06: normal_out = 16'h74ea;
              5'h07: normal_out = 16'h74f1;
              5'h08: normal_out = 16'h74f8;
              5'h09: normal_out = 16'h74ff;
              5'h0a: normal_out = 16'h7506;
              5'h0b: normal_out = 16'h750c;
              5'h0c: normal_out = 16'h7514;
              5'h0d: normal_out = 16'h751b;
              5'h0e: normal_out = 16'h7522;
              5'h0f: normal_out = 16'h7529;
              5'h10: normal_out = 16'h7530;
              5'h11: normal_out = 16'h7537;
              5'h12: normal_out = 16'h753e;
              5'h13: normal_out = 16'h7546;
              5'h14: normal_out = 16'h754d;
              5'h15: normal_out = 16'h7554;
              5'h16: normal_out = 16'h755c;
              5'h17: normal_out = 16'h7563;
              5'h18: normal_out = 16'h756b;
              5'h19: normal_out = 16'h7572;
              5'h1a: normal_out = 16'h757a;
              5'h1b: normal_out = 16'h7581;
              5'h1c: normal_out = 16'h7589;
              5'h1d: normal_out = 16'h7591;
              5'h1e: normal_out = 16'h7599;
              5'h1f: normal_out = 16'h75a0;
              default: begin end
            endcase
          end
          5'h1a: begin
            normal_out = 16'h75a8;
            case (mant[4:0])
              5'h01: normal_out = 16'h75b0;
              5'h02: normal_out = 16'h75b8;
              5'h03: normal_out = 16'h75c0;
              5'h04: normal_out = 16'h75c8;
              5'h05: normal_out = 16'h75d0;
              5'h06: normal_out = 16'h75d8;
              5'h07: normal_out = 16'h75e0;
              5'h08: normal_out = 16'h75e8;
              5'h09: normal_out = 16'h75f0;
              5'h0a: normal_out = 16'h75f9;
              5'h0b: normal_out = 16'h7601;
              5'h0c: normal_out = 16'h7609;
              5'h0d: normal_out = 16'h7612;
              5'h0e: normal_out = 16'h761a;
              5'h0f: normal_out = 16'h7623;
              5'h10: normal_out = 16'h762b;
              5'h11: normal_out = 16'h7634;
              5'h12: normal_out = 16'h763c;
              5'h13: normal_out = 16'h7645;
              5'h14: normal_out = 16'h764e;
              5'h15: normal_out = 16'h7657;
              5'h16: normal_out = 16'h765f;
              5'h17: normal_out = 16'h7668;
              5'h18: normal_out = 16'h7671;
              5'h19: normal_out = 16'h767a;
              5'h1a: normal_out = 16'h7683;
              5'h1b: normal_out = 16'h768c;
              5'h1c: normal_out = 16'h7695;
              5'h1d: normal_out = 16'h769e;
              5'h1e: normal_out = 16'h76a8;
              5'h1f: normal_out = 16'h76b1;
              default: begin end
            endcase
          end
          5'h1b: begin
            normal_out = 16'h76ba;
            case (mant[4:0])
              5'h01: normal_out = 16'h76c4;
              5'h02: normal_out = 16'h76cd;
              5'h03: normal_out = 16'h76d6;
              5'h04: normal_out = 16'h76e0;
              5'h05: normal_out = 16'h76e9;
              5'h06: normal_out = 16'h76f3;
              5'h07: normal_out = 16'h76fd;
              5'h08: normal_out = 16'h7706;
              5'h09: normal_out = 16'h7710;
              5'h0a: normal_out = 16'h771a;
              5'h0b: normal_out = 16'h7724;
              5'h0c: normal_out = 16'h772e;
              5'h0d: normal_out = 16'h7738;
              5'h0e: normal_out = 16'h7742;
              5'h0f: normal_out = 16'h774c;
              5'h10: normal_out = 16'h7756;
              5'h11: normal_out = 16'h7760;
              5'h12: normal_out = 16'h776a;
              5'h13: normal_out = 16'h7775;
              5'h14: normal_out = 16'h777f;
              5'h15: normal_out = 16'h778a;
              5'h16: normal_out = 16'h7794;
              5'h17: normal_out = 16'h779f;
              5'h18: normal_out = 16'h77a9;
              5'h19: normal_out = 16'h77b4;
              5'h1a: normal_out = 16'h77bf;
              5'h1b: normal_out = 16'h77c9;
              5'h1c: normal_out = 16'h77d4;
              5'h1d: normal_out = 16'h77df;
              5'h1e: normal_out = 16'h77ea;
              5'h1f: normal_out = 16'h77f5;
              default: begin end
            endcase
          end
          5'h1c: begin
            normal_out = 16'h7800;
            case (mant[4:0])
              5'h01: normal_out = 16'h7806;
              5'h02: normal_out = 16'h780b;
              5'h03: normal_out = 16'h7811;
              5'h04: normal_out = 16'h7816;
              5'h05: normal_out = 16'h781c;
              5'h06: normal_out = 16'h7822;
              5'h07: normal_out = 16'h7828;
              5'h08: normal_out = 16'h782d;
              5'h09: normal_out = 16'h7833;
              5'h0a: normal_out = 16'h7839;
              5'h0b: normal_out = 16'h783f;
              5'h0c: normal_out = 16'h7845;
              5'h0d: normal_out = 16'h784b;
              5'h0e: normal_out = 16'h7851;
              5'h0f: normal_out = 16'h7857;
              5'h10: normal_out = 16'h785d;
              5'h11: normal_out = 16'h7863;
              5'h12: normal_out = 16'h7869;
              5'h13: normal_out = 16'h786f;
              5'h14: normal_out = 16'h7875;
              5'h15: normal_out = 16'h787b;
              5'h16: normal_out = 16'h7882;
              5'h17: normal_out = 16'h7888;
              5'h18: normal_out = 16'h788e;
              5'h19: normal_out = 16'h7894;
              5'h1a: normal_out = 16'h789b;
              5'h1b: normal_out = 16'h78a1;
              5'h1c: normal_out = 16'h78a8;
              5'h1d: normal_out = 16'h78ae;
              5'h1e: normal_out = 16'h78b5;
              5'h1f: normal_out = 16'h78bb;
              default: begin end
            endcase
          end
          5'h1d: begin
            normal_out = 16'h78c2;
            case (mant[4:0])
              5'h01: normal_out = 16'h78c8;
              5'h02: normal_out = 16'h78cf;
              5'h03: normal_out = 16'h78d6;
              5'h04: normal_out = 16'h78dc;
              5'h05: normal_out = 16'h78e3;
              5'h06: normal_out = 16'h78ea;
              5'h07: normal_out = 16'h78f1;
              5'h08: normal_out = 16'h78f8;
              5'h09: normal_out = 16'h78ff;
              5'h0a: normal_out = 16'h7906;
              5'h0b: normal_out = 16'h790c;
              5'h0c: normal_out = 16'h7914;
              5'h0d: normal_out = 16'h791b;
              5'h0e: normal_out = 16'h7922;
              5'h0f: normal_out = 16'h7929;
              5'h10: normal_out = 16'h7930;
              5'h11: normal_out = 16'h7937;
              5'h12: normal_out = 16'h793e;
              5'h13: normal_out = 16'h7946;
              5'h14: normal_out = 16'h794d;
              5'h15: normal_out = 16'h7954;
              5'h16: normal_out = 16'h795c;
              5'h17: normal_out = 16'h7963;
              5'h18: normal_out = 16'h796b;
              5'h19: normal_out = 16'h7972;
              5'h1a: normal_out = 16'h797a;
              5'h1b: normal_out = 16'h7981;
              5'h1c: normal_out = 16'h7989;
              5'h1d: normal_out = 16'h7991;
              5'h1e: normal_out = 16'h7999;
              5'h1f: normal_out = 16'h79a0;
              default: begin end
            endcase
          end
          5'h1e: begin
            normal_out = 16'h79a8;
            case (mant[4:0])
              5'h01: normal_out = 16'h79b0;
              5'h02: normal_out = 16'h79b8;
              5'h03: normal_out = 16'h79c0;
              5'h04: normal_out = 16'h79c8;
              5'h05: normal_out = 16'h79d0;
              5'h06: normal_out = 16'h79d8;
              5'h07: normal_out = 16'h79e0;
              5'h08: normal_out = 16'h79e8;
              5'h09: normal_out = 16'h79f0;
              5'h0a: normal_out = 16'h79f9;
              5'h0b: normal_out = 16'h7a01;
              5'h0c: normal_out = 16'h7a09;
              5'h0d: normal_out = 16'h7a12;
              5'h0e: normal_out = 16'h7a1a;
              5'h0f: normal_out = 16'h7a23;
              5'h10: normal_out = 16'h7a2b;
              5'h11: normal_out = 16'h7a34;
              5'h12: normal_out = 16'h7a3c;
              5'h13: normal_out = 16'h7a45;
              5'h14: normal_out = 16'h7a4e;
              5'h15: normal_out = 16'h7a57;
              5'h16: normal_out = 16'h7a5f;
              5'h17: normal_out = 16'h7a68;
              5'h18: normal_out = 16'h7a71;
              5'h19: normal_out = 16'h7a7a;
              5'h1a: normal_out = 16'h7a83;
              5'h1b: normal_out = 16'h7a8c;
              5'h1c: normal_out = 16'h7a95;
              5'h1d: normal_out = 16'h7a9e;
              5'h1e: normal_out = 16'h7aa8;
              5'h1f: normal_out = 16'h7ab1;
              default: begin end
            endcase
          end
          5'h1f: begin
            normal_out = 16'h7aba;
            case (mant[4:0])
              5'h01: normal_out = 16'h7ac4;
              5'h02: normal_out = 16'h7acd;
              5'h03: normal_out = 16'h7ad6;
              5'h04: normal_out = 16'h7ae0;
              5'h05: normal_out = 16'h7ae9;
              5'h06: normal_out = 16'h7af3;
              5'h07: normal_out = 16'h7afd;
              5'h08: normal_out = 16'h7b06;
              5'h09: normal_out = 16'h7b10;
              5'h0a: normal_out = 16'h7b1a;
              5'h0b: normal_out = 16'h7b24;
              5'h0c: normal_out = 16'h7b2e;
              5'h0d: normal_out = 16'h7b38;
              5'h0e: normal_out = 16'h7b42;
              5'h0f: normal_out = 16'h7b4c;
              5'h10: normal_out = 16'h7b56;
              5'h11: normal_out = 16'h7b60;
              5'h12: normal_out = 16'h7b6a;
              5'h13: normal_out = 16'h7b75;
              5'h14: normal_out = 16'h7b7f;
              5'h15: normal_out = 16'h7b8a;
              5'h16: normal_out = 16'h7b94;
              5'h17: normal_out = 16'h7b9f;
              5'h18: normal_out = 16'h7ba9;
              5'h19: normal_out = 16'h7bb4;
              5'h1a: normal_out = 16'h7bbf;
              5'h1b: normal_out = 16'h7bc9;
              5'h1c: normal_out = 16'h7bd4;
              5'h1d: normal_out = 16'h7bdf;
              5'h1e: normal_out = 16'h7bea;
              5'h1f: normal_out = 16'h7bf5;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      6'h1f: begin
        case (mant[9:5])
          5'h00: begin
            normal_out = 16'h7e00;
            case (mant[4:0])
              5'h00: normal_out = 16'h7c00;
              default: begin end
            endcase
          end
          5'h01: normal_out = 16'h7e00;
          5'h02: normal_out = 16'h7e00;
          5'h03: normal_out = 16'h7e00;
          5'h04: normal_out = 16'h7e00;
          5'h05: normal_out = 16'h7e00;
          5'h06: normal_out = 16'h7e00;
          5'h07: normal_out = 16'h7e00;
          5'h08: normal_out = 16'h7e00;
          5'h09: normal_out = 16'h7e00;
          5'h0a: normal_out = 16'h7e00;
          5'h0b: normal_out = 16'h7e00;
          5'h0c: normal_out = 16'h7e00;
          5'h0d: normal_out = 16'h7e00;
          5'h0e: normal_out = 16'h7e00;
          5'h0f: normal_out = 16'h7e00;
          5'h10: normal_out = 16'h7e00;
          5'h11: normal_out = 16'h7e00;
          5'h12: normal_out = 16'h7e00;
          5'h13: normal_out = 16'h7e00;
          5'h14: normal_out = 16'h7e00;
          5'h15: normal_out = 16'h7e00;
          5'h16: normal_out = 16'h7e00;
          5'h17: normal_out = 16'h7e00;
          5'h18: normal_out = 16'h7e00;
          5'h19: normal_out = 16'h7e00;
          5'h1a: normal_out = 16'h7e00;
          5'h1b: normal_out = 16'h7e00;
          5'h1c: normal_out = 16'h7e00;
          5'h1d: normal_out = 16'h7e00;
          5'h1e: normal_out = 16'h7e00;
          5'h1f: normal_out = 16'h7e00;
          default: begin end
        endcase
      end
      6'h23: begin
        case (mant[9:5])
          5'h00: normal_out = 16'h3c00;
          5'h01: normal_out = 16'h3c00;
          5'h02: normal_out = 16'h3c00;
          5'h03: normal_out = 16'h3c00;
          5'h04: normal_out = 16'h3c00;
          5'h05: normal_out = 16'h3c00;
          5'h06: normal_out = 16'h3c00;
          5'h07: normal_out = 16'h3c00;
          5'h08: normal_out = 16'h3c00;
          5'h09: normal_out = 16'h3c00;
          5'h0a: normal_out = 16'h3c00;
          5'h0b: normal_out = 16'h3c00;
          5'h0c: normal_out = 16'h3c00;
          5'h0d: normal_out = 16'h3c00;
          5'h0e: begin
            normal_out = 16'h3bff;
            case (mant[4:0])
              5'h00: normal_out = 16'h3c00;
              5'h01: normal_out = 16'h3c00;
              5'h02: normal_out = 16'h3c00;
              5'h03: normal_out = 16'h3c00;
              5'h04: normal_out = 16'h3c00;
              5'h05: normal_out = 16'h3c00;
              default: begin end
            endcase
          end
          5'h0f: normal_out = 16'h3bff;
          5'h10: normal_out = 16'h3bff;
          5'h11: normal_out = 16'h3bff;
          5'h12: normal_out = 16'h3bff;
          5'h13: normal_out = 16'h3bff;
          5'h14: normal_out = 16'h3bff;
          5'h15: normal_out = 16'h3bff;
          5'h16: normal_out = 16'h3bff;
          5'h17: normal_out = 16'h3bff;
          5'h18: normal_out = 16'h3bff;
          5'h19: normal_out = 16'h3bff;
          5'h1a: normal_out = 16'h3bff;
          5'h1b: normal_out = 16'h3bff;
          5'h1c: normal_out = 16'h3bff;
          5'h1d: normal_out = 16'h3bff;
          5'h1e: normal_out = 16'h3bff;
          5'h1f: normal_out = 16'h3bff;
          default: begin end
        endcase
      end
      6'h25: begin
        case (mant[9:5])
          5'h00: normal_out = 16'h3bff;
          5'h01: normal_out = 16'h3bff;
          5'h02: begin
            normal_out = 16'h3bff;
            case (mant[4:0])
              5'h15: normal_out = 16'h3bfe;
              5'h16: normal_out = 16'h3bfe;
              5'h17: normal_out = 16'h3bfe;
              5'h18: normal_out = 16'h3bfe;
              5'h19: normal_out = 16'h3bfe;
              5'h1a: normal_out = 16'h3bfe;
              5'h1b: normal_out = 16'h3bfe;
              5'h1c: normal_out = 16'h3bfe;
              5'h1d: normal_out = 16'h3bfe;
              5'h1e: normal_out = 16'h3bfe;
              5'h1f: normal_out = 16'h3bfe;
              default: begin end
            endcase
          end
          5'h03: normal_out = 16'h3bfe;
          5'h04: normal_out = 16'h3bfe;
          5'h05: normal_out = 16'h3bfe;
          5'h06: normal_out = 16'h3bfe;
          5'h07: normal_out = 16'h3bfe;
          5'h08: normal_out = 16'h3bfe;
          5'h09: normal_out = 16'h3bfe;
          5'h0a: normal_out = 16'h3bfe;
          5'h0b: normal_out = 16'h3bfe;
          5'h0c: normal_out = 16'h3bfe;
          5'h0d: normal_out = 16'h3bfe;
          5'h0e: normal_out = 16'h3bfe;
          5'h0f: normal_out = 16'h3bfe;
          5'h10: normal_out = 16'h3bfe;
          5'h11: normal_out = 16'h3bfe;
          5'h12: normal_out = 16'h3bfe;
          5'h13: normal_out = 16'h3bfe;
          5'h14: normal_out = 16'h3bfe;
          5'h15: normal_out = 16'h3bfe;
          5'h16: normal_out = 16'h3bfe;
          5'h17: normal_out = 16'h3bfe;
          5'h18: normal_out = 16'h3bfe;
          5'h19: begin
            normal_out = 16'h3bfe;
            case (mant[4:0])
              5'h18: normal_out = 16'h3bfd;
              5'h19: normal_out = 16'h3bfd;
              5'h1a: normal_out = 16'h3bfd;
              5'h1b: normal_out = 16'h3bfd;
              5'h1c: normal_out = 16'h3bfd;
              5'h1d: normal_out = 16'h3bfd;
              5'h1e: normal_out = 16'h3bfd;
              5'h1f: normal_out = 16'h3bfd;
              default: begin end
            endcase
          end
          5'h1a: normal_out = 16'h3bfd;
          5'h1b: normal_out = 16'h3bfd;
          5'h1c: normal_out = 16'h3bfd;
          5'h1d: normal_out = 16'h3bfd;
          5'h1e: normal_out = 16'h3bfd;
          5'h1f: normal_out = 16'h3bfd;
          default: begin end
        endcase
      end
      6'h26: begin
        case (mant[9:5])
          5'h00: normal_out = 16'h3bfd;
          5'h01: normal_out = 16'h3bfd;
          5'h02: normal_out = 16'h3bfd;
          5'h03: normal_out = 16'h3bfd;
          5'h04: normal_out = 16'h3bfd;
          5'h05: normal_out = 16'h3bfd;
          5'h06: normal_out = 16'h3bfd;
          5'h07: normal_out = 16'h3bfd;
          5'h08: begin
            normal_out = 16'h3bfc;
            case (mant[4:0])
              5'h00: normal_out = 16'h3bfd;
              5'h01: normal_out = 16'h3bfd;
              5'h02: normal_out = 16'h3bfd;
              5'h03: normal_out = 16'h3bfd;
              5'h04: normal_out = 16'h3bfd;
              5'h05: normal_out = 16'h3bfd;
              5'h06: normal_out = 16'h3bfd;
              5'h07: normal_out = 16'h3bfd;
              5'h08: normal_out = 16'h3bfd;
              5'h09: normal_out = 16'h3bfd;
              5'h0a: normal_out = 16'h3bfd;
              5'h0b: normal_out = 16'h3bfd;
              5'h0c: normal_out = 16'h3bfd;
              5'h0d: normal_out = 16'h3bfd;
              default: begin end
            endcase
          end
          5'h09: normal_out = 16'h3bfc;
          5'h0a: normal_out = 16'h3bfc;
          5'h0b: normal_out = 16'h3bfc;
          5'h0c: normal_out = 16'h3bfc;
          5'h0d: normal_out = 16'h3bfc;
          5'h0e: normal_out = 16'h3bfc;
          5'h0f: normal_out = 16'h3bfc;
          5'h10: normal_out = 16'h3bfc;
          5'h11: normal_out = 16'h3bfc;
          5'h12: normal_out = 16'h3bfc;
          5'h13: normal_out = 16'h3bfc;
          5'h14: normal_out = 16'h3bfb;
          5'h15: normal_out = 16'h3bfb;
          5'h16: normal_out = 16'h3bfb;
          5'h17: normal_out = 16'h3bfb;
          5'h18: normal_out = 16'h3bfb;
          5'h19: normal_out = 16'h3bfb;
          5'h1a: normal_out = 16'h3bfb;
          5'h1b: normal_out = 16'h3bfb;
          5'h1c: normal_out = 16'h3bfb;
          5'h1d: normal_out = 16'h3bfb;
          5'h1e: normal_out = 16'h3bfb;
          5'h1f: begin
            normal_out = 16'h3bfb;
            case (mant[4:0])
              5'h13: normal_out = 16'h3bfa;
              5'h14: normal_out = 16'h3bfa;
              5'h15: normal_out = 16'h3bfa;
              5'h16: normal_out = 16'h3bfa;
              5'h17: normal_out = 16'h3bfa;
              5'h18: normal_out = 16'h3bfa;
              5'h19: normal_out = 16'h3bfa;
              5'h1a: normal_out = 16'h3bfa;
              5'h1b: normal_out = 16'h3bfa;
              5'h1c: normal_out = 16'h3bfa;
              5'h1d: normal_out = 16'h3bfa;
              5'h1e: normal_out = 16'h3bfa;
              5'h1f: normal_out = 16'h3bfa;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      6'h27: begin
        case (mant[9:5])
          5'h00: normal_out = 16'h3bfa;
          5'h01: normal_out = 16'h3bfa;
          5'h02: normal_out = 16'h3bfa;
          5'h03: normal_out = 16'h3bfa;
          5'h04: normal_out = 16'h3bfa;
          5'h05: begin
            normal_out = 16'h3bfa;
            case (mant[4:0])
              5'h13: normal_out = 16'h3bf9;
              5'h14: normal_out = 16'h3bf9;
              5'h15: normal_out = 16'h3bf9;
              5'h16: normal_out = 16'h3bf9;
              5'h17: normal_out = 16'h3bf9;
              5'h18: normal_out = 16'h3bf9;
              5'h19: normal_out = 16'h3bf9;
              5'h1a: normal_out = 16'h3bf9;
              5'h1b: normal_out = 16'h3bf9;
              5'h1c: normal_out = 16'h3bf9;
              5'h1d: normal_out = 16'h3bf9;
              5'h1e: normal_out = 16'h3bf9;
              5'h1f: normal_out = 16'h3bf9;
              default: begin end
            endcase
          end
          5'h06: normal_out = 16'h3bf9;
          5'h07: normal_out = 16'h3bf9;
          5'h08: normal_out = 16'h3bf9;
          5'h09: normal_out = 16'h3bf9;
          5'h0a: normal_out = 16'h3bf9;
          5'h0b: begin
            normal_out = 16'h3bf8;
            case (mant[4:0])
              5'h00: normal_out = 16'h3bf9;
              5'h01: normal_out = 16'h3bf9;
              5'h02: normal_out = 16'h3bf9;
              5'h03: normal_out = 16'h3bf9;
              5'h04: normal_out = 16'h3bf9;
              5'h05: normal_out = 16'h3bf9;
              5'h06: normal_out = 16'h3bf9;
              5'h07: normal_out = 16'h3bf9;
              5'h08: normal_out = 16'h3bf9;
              5'h09: normal_out = 16'h3bf9;
              5'h0a: normal_out = 16'h3bf9;
              5'h0b: normal_out = 16'h3bf9;
              default: begin end
            endcase
          end
          5'h0c: normal_out = 16'h3bf8;
          5'h0d: normal_out = 16'h3bf8;
          5'h0e: normal_out = 16'h3bf8;
          5'h0f: normal_out = 16'h3bf8;
          5'h10: normal_out = 16'h3bf8;
          5'h11: begin
            normal_out = 16'h3bf7;
            case (mant[4:0])
              5'h00: normal_out = 16'h3bf8;
              5'h01: normal_out = 16'h3bf8;
              5'h02: normal_out = 16'h3bf8;
              5'h03: normal_out = 16'h3bf8;
              5'h04: normal_out = 16'h3bf8;
              default: begin end
            endcase
          end
          5'h12: normal_out = 16'h3bf7;
          5'h13: normal_out = 16'h3bf7;
          5'h14: normal_out = 16'h3bf7;
          5'h15: normal_out = 16'h3bf7;
          5'h16: begin
            normal_out = 16'h3bf7;
            case (mant[4:0])
              5'h1f: normal_out = 16'h3bf6;
              default: begin end
            endcase
          end
          5'h17: normal_out = 16'h3bf6;
          5'h18: normal_out = 16'h3bf6;
          5'h19: normal_out = 16'h3bf6;
          5'h1a: normal_out = 16'h3bf6;
          5'h1b: normal_out = 16'h3bf6;
          5'h1c: begin
            normal_out = 16'h3bf6;
            case (mant[4:0])
              5'h18: normal_out = 16'h3bf5;
              5'h19: normal_out = 16'h3bf5;
              5'h1a: normal_out = 16'h3bf5;
              5'h1b: normal_out = 16'h3bf5;
              5'h1c: normal_out = 16'h3bf5;
              5'h1d: normal_out = 16'h3bf5;
              5'h1e: normal_out = 16'h3bf5;
              5'h1f: normal_out = 16'h3bf5;
              default: begin end
            endcase
          end
          5'h1d: normal_out = 16'h3bf5;
          5'h1e: normal_out = 16'h3bf5;
          5'h1f: normal_out = 16'h3bf5;
          default: begin end
        endcase
      end
      6'h28: begin
        case (mant[9:5])
          5'h00: normal_out = 16'h3bf5;
          5'h01: begin
            normal_out = 16'h3bf4;
            case (mant[4:0])
              5'h00: normal_out = 16'h3bf5;
              5'h01: normal_out = 16'h3bf5;
              5'h02: normal_out = 16'h3bf5;
              5'h03: normal_out = 16'h3bf5;
              5'h04: normal_out = 16'h3bf5;
              5'h05: normal_out = 16'h3bf5;
              5'h06: normal_out = 16'h3bf5;
              5'h07: normal_out = 16'h3bf5;
              5'h08: normal_out = 16'h3bf5;
              default: begin end
            endcase
          end
          5'h02: normal_out = 16'h3bf4;
          5'h03: normal_out = 16'h3bf4;
          5'h04: begin
            normal_out = 16'h3bf3;
            case (mant[4:0])
              5'h00: normal_out = 16'h3bf4;
              5'h01: normal_out = 16'h3bf4;
              5'h02: normal_out = 16'h3bf4;
              5'h03: normal_out = 16'h3bf4;
              5'h04: normal_out = 16'h3bf4;
              5'h05: normal_out = 16'h3bf4;
              default: begin end
            endcase
          end
          5'h05: normal_out = 16'h3bf3;
          5'h06: normal_out = 16'h3bf3;
          5'h07: begin
            normal_out = 16'h3bf2;
            case (mant[4:0])
              5'h00: normal_out = 16'h3bf3;
              5'h01: normal_out = 16'h3bf3;
              5'h02: normal_out = 16'h3bf3;
              default: begin end
            endcase
          end
          5'h08: normal_out = 16'h3bf2;
          5'h09: normal_out = 16'h3bf2;
          5'h0a: normal_out = 16'h3bf1;
          5'h0b: normal_out = 16'h3bf1;
          5'h0c: begin
            normal_out = 16'h3bf1;
            case (mant[4:0])
              5'h1d: normal_out = 16'h3bf0;
              5'h1e: normal_out = 16'h3bf0;
              5'h1f: normal_out = 16'h3bf0;
              default: begin end
            endcase
          end
          5'h0d: normal_out = 16'h3bf0;
          5'h0e: normal_out = 16'h3bf0;
          5'h0f: begin
            normal_out = 16'h3bf0;
            case (mant[4:0])
              5'h1a: normal_out = 16'h3bef;
              5'h1b: normal_out = 16'h3bef;
              5'h1c: normal_out = 16'h3bef;
              5'h1d: normal_out = 16'h3bef;
              5'h1e: normal_out = 16'h3bef;
              5'h1f: normal_out = 16'h3bef;
              default: begin end
            endcase
          end
          5'h10: normal_out = 16'h3bef;
          5'h11: normal_out = 16'h3bef;
          5'h12: begin
            normal_out = 16'h3bef;
            case (mant[4:0])
              5'h17: normal_out = 16'h3bee;
              5'h18: normal_out = 16'h3bee;
              5'h19: normal_out = 16'h3bee;
              5'h1a: normal_out = 16'h3bee;
              5'h1b: normal_out = 16'h3bee;
              5'h1c: normal_out = 16'h3bee;
              5'h1d: normal_out = 16'h3bee;
              5'h1e: normal_out = 16'h3bee;
              5'h1f: normal_out = 16'h3bee;
              default: begin end
            endcase
          end
          5'h13: normal_out = 16'h3bee;
          5'h14: normal_out = 16'h3bee;
          5'h15: begin
            normal_out = 16'h3bee;
            case (mant[4:0])
              5'h14: normal_out = 16'h3bed;
              5'h15: normal_out = 16'h3bed;
              5'h16: normal_out = 16'h3bed;
              5'h17: normal_out = 16'h3bed;
              5'h18: normal_out = 16'h3bed;
              5'h19: normal_out = 16'h3bed;
              5'h1a: normal_out = 16'h3bed;
              5'h1b: normal_out = 16'h3bed;
              5'h1c: normal_out = 16'h3bed;
              5'h1d: normal_out = 16'h3bed;
              5'h1e: normal_out = 16'h3bed;
              5'h1f: normal_out = 16'h3bed;
              default: begin end
            endcase
          end
          5'h16: normal_out = 16'h3bed;
          5'h17: normal_out = 16'h3bed;
          5'h18: begin
            normal_out = 16'h3bed;
            case (mant[4:0])
              5'h12: normal_out = 16'h3bec;
              5'h13: normal_out = 16'h3bec;
              5'h14: normal_out = 16'h3bec;
              5'h15: normal_out = 16'h3bec;
              5'h16: normal_out = 16'h3bec;
              5'h17: normal_out = 16'h3bec;
              5'h18: normal_out = 16'h3bec;
              5'h19: normal_out = 16'h3bec;
              5'h1a: normal_out = 16'h3bec;
              5'h1b: normal_out = 16'h3bec;
              5'h1c: normal_out = 16'h3bec;
              5'h1d: normal_out = 16'h3bec;
              5'h1e: normal_out = 16'h3bec;
              5'h1f: normal_out = 16'h3bec;
              default: begin end
            endcase
          end
          5'h19: normal_out = 16'h3bec;
          5'h1a: normal_out = 16'h3bec;
          5'h1b: begin
            normal_out = 16'h3beb;
            case (mant[4:0])
              5'h00: normal_out = 16'h3bec;
              5'h01: normal_out = 16'h3bec;
              5'h02: normal_out = 16'h3bec;
              5'h03: normal_out = 16'h3bec;
              5'h04: normal_out = 16'h3bec;
              5'h05: normal_out = 16'h3bec;
              5'h06: normal_out = 16'h3bec;
              5'h07: normal_out = 16'h3bec;
              5'h08: normal_out = 16'h3bec;
              5'h09: normal_out = 16'h3bec;
              5'h0a: normal_out = 16'h3bec;
              5'h0b: normal_out = 16'h3bec;
              5'h0c: normal_out = 16'h3bec;
              5'h0d: normal_out = 16'h3bec;
              5'h0e: normal_out = 16'h3bec;
              default: begin end
            endcase
          end
          5'h1c: normal_out = 16'h3beb;
          5'h1d: normal_out = 16'h3beb;
          5'h1e: begin
            normal_out = 16'h3bea;
            case (mant[4:0])
              5'h00: normal_out = 16'h3beb;
              5'h01: normal_out = 16'h3beb;
              5'h02: normal_out = 16'h3beb;
              5'h03: normal_out = 16'h3beb;
              5'h04: normal_out = 16'h3beb;
              5'h05: normal_out = 16'h3beb;
              5'h06: normal_out = 16'h3beb;
              5'h07: normal_out = 16'h3beb;
              5'h08: normal_out = 16'h3beb;
              5'h09: normal_out = 16'h3beb;
              5'h0a: normal_out = 16'h3beb;
              5'h0b: normal_out = 16'h3beb;
              default: begin end
            endcase
          end
          5'h1f: normal_out = 16'h3bea;
          default: begin end
        endcase
      end
      6'h29: begin
        case (mant[9:5])
          5'h00: begin
            normal_out = 16'h3bea;
            case (mant[4:0])
              5'h15: normal_out = 16'h3be9;
              5'h16: normal_out = 16'h3be9;
              5'h17: normal_out = 16'h3be9;
              5'h18: normal_out = 16'h3be9;
              5'h19: normal_out = 16'h3be9;
              5'h1a: normal_out = 16'h3be9;
              5'h1b: normal_out = 16'h3be9;
              5'h1c: normal_out = 16'h3be9;
              5'h1d: normal_out = 16'h3be9;
              5'h1e: normal_out = 16'h3be9;
              5'h1f: normal_out = 16'h3be9;
              default: begin end
            endcase
          end
          5'h01: normal_out = 16'h3be9;
          5'h02: begin
            normal_out = 16'h3be8;
            case (mant[4:0])
              5'h00: normal_out = 16'h3be9;
              5'h01: normal_out = 16'h3be9;
              5'h02: normal_out = 16'h3be9;
              5'h03: normal_out = 16'h3be9;
              default: begin end
            endcase
          end
          5'h03: begin
            normal_out = 16'h3be8;
            case (mant[4:0])
              5'h12: normal_out = 16'h3be7;
              5'h13: normal_out = 16'h3be7;
              5'h14: normal_out = 16'h3be7;
              5'h15: normal_out = 16'h3be7;
              5'h16: normal_out = 16'h3be7;
              5'h17: normal_out = 16'h3be7;
              5'h18: normal_out = 16'h3be7;
              5'h19: normal_out = 16'h3be7;
              5'h1a: normal_out = 16'h3be7;
              5'h1b: normal_out = 16'h3be7;
              5'h1c: normal_out = 16'h3be7;
              5'h1d: normal_out = 16'h3be7;
              5'h1e: normal_out = 16'h3be7;
              5'h1f: normal_out = 16'h3be7;
              default: begin end
            endcase
          end
          5'h04: normal_out = 16'h3be7;
          5'h05: begin
            normal_out = 16'h3be6;
            case (mant[4:0])
              5'h00: normal_out = 16'h3be7;
              default: begin end
            endcase
          end
          5'h06: begin
            normal_out = 16'h3be5;
            case (mant[4:0])
              5'h00: normal_out = 16'h3be6;
              5'h01: normal_out = 16'h3be6;
              5'h02: normal_out = 16'h3be6;
              5'h03: normal_out = 16'h3be6;
              5'h04: normal_out = 16'h3be6;
              5'h05: normal_out = 16'h3be6;
              5'h06: normal_out = 16'h3be6;
              5'h07: normal_out = 16'h3be6;
              5'h08: normal_out = 16'h3be6;
              5'h09: normal_out = 16'h3be6;
              5'h0a: normal_out = 16'h3be6;
              5'h0b: normal_out = 16'h3be6;
              5'h0c: normal_out = 16'h3be6;
              5'h0d: normal_out = 16'h3be6;
              5'h0e: normal_out = 16'h3be6;
              5'h0f: normal_out = 16'h3be6;
              default: begin end
            endcase
          end
          5'h07: begin
            normal_out = 16'h3be5;
            case (mant[4:0])
              5'h1f: normal_out = 16'h3be4;
              default: begin end
            endcase
          end
          5'h08: normal_out = 16'h3be4;
          5'h09: begin
            normal_out = 16'h3be3;
            case (mant[4:0])
              5'h00: normal_out = 16'h3be4;
              5'h01: normal_out = 16'h3be4;
              5'h02: normal_out = 16'h3be4;
              5'h03: normal_out = 16'h3be4;
              5'h04: normal_out = 16'h3be4;
              5'h05: normal_out = 16'h3be4;
              5'h06: normal_out = 16'h3be4;
              5'h07: normal_out = 16'h3be4;
              5'h08: normal_out = 16'h3be4;
              5'h09: normal_out = 16'h3be4;
              5'h0a: normal_out = 16'h3be4;
              5'h0b: normal_out = 16'h3be4;
              5'h0c: normal_out = 16'h3be4;
              default: begin end
            endcase
          end
          5'h0a: begin
            normal_out = 16'h3be3;
            case (mant[4:0])
              5'h1c: normal_out = 16'h3be2;
              5'h1d: normal_out = 16'h3be2;
              5'h1e: normal_out = 16'h3be2;
              5'h1f: normal_out = 16'h3be2;
              default: begin end
            endcase
          end
          5'h0b: normal_out = 16'h3be2;
          5'h0c: begin
            normal_out = 16'h3be1;
            case (mant[4:0])
              5'h00: normal_out = 16'h3be2;
              5'h01: normal_out = 16'h3be2;
              5'h02: normal_out = 16'h3be2;
              5'h03: normal_out = 16'h3be2;
              5'h04: normal_out = 16'h3be2;
              5'h05: normal_out = 16'h3be2;
              5'h06: normal_out = 16'h3be2;
              5'h07: normal_out = 16'h3be2;
              5'h08: normal_out = 16'h3be2;
              5'h09: normal_out = 16'h3be2;
              5'h0a: normal_out = 16'h3be2;
              default: begin end
            endcase
          end
          5'h0d: begin
            normal_out = 16'h3be1;
            case (mant[4:0])
              5'h1a: normal_out = 16'h3be0;
              5'h1b: normal_out = 16'h3be0;
              5'h1c: normal_out = 16'h3be0;
              5'h1d: normal_out = 16'h3be0;
              5'h1e: normal_out = 16'h3be0;
              5'h1f: normal_out = 16'h3be0;
              default: begin end
            endcase
          end
          5'h0e: normal_out = 16'h3be0;
          5'h0f: begin
            normal_out = 16'h3bdf;
            case (mant[4:0])
              5'h00: normal_out = 16'h3be0;
              5'h01: normal_out = 16'h3be0;
              5'h02: normal_out = 16'h3be0;
              5'h03: normal_out = 16'h3be0;
              5'h04: normal_out = 16'h3be0;
              5'h05: normal_out = 16'h3be0;
              5'h06: normal_out = 16'h3be0;
              5'h07: normal_out = 16'h3be0;
              5'h08: normal_out = 16'h3be0;
              default: begin end
            endcase
          end
          5'h10: begin
            normal_out = 16'h3bdf;
            case (mant[4:0])
              5'h18: normal_out = 16'h3bde;
              5'h19: normal_out = 16'h3bde;
              5'h1a: normal_out = 16'h3bde;
              5'h1b: normal_out = 16'h3bde;
              5'h1c: normal_out = 16'h3bde;
              5'h1d: normal_out = 16'h3bde;
              5'h1e: normal_out = 16'h3bde;
              5'h1f: normal_out = 16'h3bde;
              default: begin end
            endcase
          end
          5'h11: normal_out = 16'h3bde;
          5'h12: begin
            normal_out = 16'h3bdd;
            case (mant[4:0])
              5'h00: normal_out = 16'h3bde;
              5'h01: normal_out = 16'h3bde;
              5'h02: normal_out = 16'h3bde;
              5'h03: normal_out = 16'h3bde;
              5'h04: normal_out = 16'h3bde;
              5'h05: normal_out = 16'h3bde;
              5'h06: normal_out = 16'h3bde;
              default: begin end
            endcase
          end
          5'h13: begin
            normal_out = 16'h3bdd;
            case (mant[4:0])
              5'h16: normal_out = 16'h3bdc;
              5'h17: normal_out = 16'h3bdc;
              5'h18: normal_out = 16'h3bdc;
              5'h19: normal_out = 16'h3bdc;
              5'h1a: normal_out = 16'h3bdc;
              5'h1b: normal_out = 16'h3bdc;
              5'h1c: normal_out = 16'h3bdc;
              5'h1d: normal_out = 16'h3bdc;
              5'h1e: normal_out = 16'h3bdc;
              5'h1f: normal_out = 16'h3bdc;
              default: begin end
            endcase
          end
          5'h14: normal_out = 16'h3bdc;
          5'h15: begin
            normal_out = 16'h3bdb;
            case (mant[4:0])
              5'h00: normal_out = 16'h3bdc;
              5'h01: normal_out = 16'h3bdc;
              5'h02: normal_out = 16'h3bdc;
              5'h03: normal_out = 16'h3bdc;
              5'h04: normal_out = 16'h3bdc;
              default: begin end
            endcase
          end
          5'h16: begin
            normal_out = 16'h3bdb;
            case (mant[4:0])
              5'h14: normal_out = 16'h3bda;
              5'h15: normal_out = 16'h3bda;
              5'h16: normal_out = 16'h3bda;
              5'h17: normal_out = 16'h3bda;
              5'h18: normal_out = 16'h3bda;
              5'h19: normal_out = 16'h3bda;
              5'h1a: normal_out = 16'h3bda;
              5'h1b: normal_out = 16'h3bda;
              5'h1c: normal_out = 16'h3bda;
              5'h1d: normal_out = 16'h3bda;
              5'h1e: normal_out = 16'h3bda;
              5'h1f: normal_out = 16'h3bda;
              default: begin end
            endcase
          end
          5'h17: normal_out = 16'h3bda;
          5'h18: begin
            normal_out = 16'h3bd9;
            case (mant[4:0])
              5'h00: normal_out = 16'h3bda;
              5'h01: normal_out = 16'h3bda;
              5'h02: normal_out = 16'h3bda;
              default: begin end
            endcase
          end
          5'h19: begin
            normal_out = 16'h3bd9;
            case (mant[4:0])
              5'h12: normal_out = 16'h3bd8;
              5'h13: normal_out = 16'h3bd8;
              5'h14: normal_out = 16'h3bd8;
              5'h15: normal_out = 16'h3bd8;
              5'h16: normal_out = 16'h3bd8;
              5'h17: normal_out = 16'h3bd8;
              5'h18: normal_out = 16'h3bd8;
              5'h19: normal_out = 16'h3bd8;
              5'h1a: normal_out = 16'h3bd8;
              5'h1b: normal_out = 16'h3bd8;
              5'h1c: normal_out = 16'h3bd8;
              5'h1d: normal_out = 16'h3bd8;
              5'h1e: normal_out = 16'h3bd8;
              5'h1f: normal_out = 16'h3bd8;
              default: begin end
            endcase
          end
          5'h1a: normal_out = 16'h3bd8;
          5'h1b: begin
            normal_out = 16'h3bd7;
            case (mant[4:0])
              5'h00: normal_out = 16'h3bd8;
              default: begin end
            endcase
          end
          5'h1c: begin
            normal_out = 16'h3bd6;
            case (mant[4:0])
              5'h00: normal_out = 16'h3bd7;
              5'h01: normal_out = 16'h3bd7;
              5'h02: normal_out = 16'h3bd7;
              5'h03: normal_out = 16'h3bd7;
              5'h04: normal_out = 16'h3bd7;
              5'h05: normal_out = 16'h3bd7;
              5'h06: normal_out = 16'h3bd7;
              5'h07: normal_out = 16'h3bd7;
              5'h08: normal_out = 16'h3bd7;
              5'h09: normal_out = 16'h3bd7;
              5'h0a: normal_out = 16'h3bd7;
              5'h0b: normal_out = 16'h3bd7;
              5'h0c: normal_out = 16'h3bd7;
              5'h0d: normal_out = 16'h3bd7;
              5'h0e: normal_out = 16'h3bd7;
              5'h0f: normal_out = 16'h3bd7;
              default: begin end
            endcase
          end
          5'h1d: begin
            normal_out = 16'h3bd6;
            case (mant[4:0])
              5'h1f: normal_out = 16'h3bd5;
              default: begin end
            endcase
          end
          5'h1e: normal_out = 16'h3bd5;
          5'h1f: begin
            normal_out = 16'h3bd4;
            case (mant[4:0])
              5'h00: normal_out = 16'h3bd5;
              5'h01: normal_out = 16'h3bd5;
              5'h02: normal_out = 16'h3bd5;
              5'h03: normal_out = 16'h3bd5;
              5'h04: normal_out = 16'h3bd5;
              5'h05: normal_out = 16'h3bd5;
              5'h06: normal_out = 16'h3bd5;
              5'h07: normal_out = 16'h3bd5;
              5'h08: normal_out = 16'h3bd5;
              5'h09: normal_out = 16'h3bd5;
              5'h0a: normal_out = 16'h3bd5;
              5'h0b: normal_out = 16'h3bd5;
              5'h0c: normal_out = 16'h3bd5;
              5'h0d: normal_out = 16'h3bd5;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      6'h2a: begin
        case (mant[9:5])
          5'h00: begin
            normal_out = 16'h3bd3;
            case (mant[4:0])
              5'h00: normal_out = 16'h3bd4;
              5'h01: normal_out = 16'h3bd4;
              5'h02: normal_out = 16'h3bd4;
              5'h03: normal_out = 16'h3bd4;
              5'h04: normal_out = 16'h3bd4;
              5'h05: normal_out = 16'h3bd4;
              5'h06: normal_out = 16'h3bd4;
              5'h07: normal_out = 16'h3bd4;
              5'h08: normal_out = 16'h3bd4;
              5'h09: normal_out = 16'h3bd4;
              5'h0a: normal_out = 16'h3bd4;
              5'h0b: normal_out = 16'h3bd4;
              5'h0c: normal_out = 16'h3bd4;
              5'h0d: normal_out = 16'h3bd4;
              5'h0e: normal_out = 16'h3bd4;
              default: begin end
            endcase
          end
          5'h01: begin
            normal_out = 16'h3bd2;
            case (mant[4:0])
              5'h00: normal_out = 16'h3bd3;
              5'h01: normal_out = 16'h3bd3;
              5'h02: normal_out = 16'h3bd3;
              5'h03: normal_out = 16'h3bd3;
              5'h04: normal_out = 16'h3bd3;
              5'h05: normal_out = 16'h3bd3;
              5'h06: normal_out = 16'h3bd3;
              5'h1e: normal_out = 16'h3bd1;
              5'h1f: normal_out = 16'h3bd1;
              default: begin end
            endcase
          end
          5'h02: begin
            normal_out = 16'h3bd1;
            case (mant[4:0])
              5'h16: normal_out = 16'h3bd0;
              5'h17: normal_out = 16'h3bd0;
              5'h18: normal_out = 16'h3bd0;
              5'h19: normal_out = 16'h3bd0;
              5'h1a: normal_out = 16'h3bd0;
              5'h1b: normal_out = 16'h3bd0;
              5'h1c: normal_out = 16'h3bd0;
              5'h1d: normal_out = 16'h3bd0;
              5'h1e: normal_out = 16'h3bd0;
              5'h1f: normal_out = 16'h3bd0;
              default: begin end
            endcase
          end
          5'h03: begin
            normal_out = 16'h3bcf;
            case (mant[4:0])
              5'h00: normal_out = 16'h3bd0;
              5'h01: normal_out = 16'h3bd0;
              5'h02: normal_out = 16'h3bd0;
              5'h03: normal_out = 16'h3bd0;
              5'h04: normal_out = 16'h3bd0;
              5'h05: normal_out = 16'h3bd0;
              5'h06: normal_out = 16'h3bd0;
              5'h07: normal_out = 16'h3bd0;
              5'h08: normal_out = 16'h3bd0;
              5'h09: normal_out = 16'h3bd0;
              5'h0a: normal_out = 16'h3bd0;
              5'h0b: normal_out = 16'h3bd0;
              5'h0c: normal_out = 16'h3bd0;
              5'h0d: normal_out = 16'h3bd0;
              default: begin end
            endcase
          end
          5'h04: begin
            normal_out = 16'h3bce;
            case (mant[4:0])
              5'h00: normal_out = 16'h3bcf;
              5'h01: normal_out = 16'h3bcf;
              5'h02: normal_out = 16'h3bcf;
              5'h03: normal_out = 16'h3bcf;
              5'h04: normal_out = 16'h3bcf;
              5'h1d: normal_out = 16'h3bcd;
              5'h1e: normal_out = 16'h3bcd;
              5'h1f: normal_out = 16'h3bcd;
              default: begin end
            endcase
          end
          5'h05: begin
            normal_out = 16'h3bcd;
            case (mant[4:0])
              5'h14: normal_out = 16'h3bcc;
              5'h15: normal_out = 16'h3bcc;
              5'h16: normal_out = 16'h3bcc;
              5'h17: normal_out = 16'h3bcc;
              5'h18: normal_out = 16'h3bcc;
              5'h19: normal_out = 16'h3bcc;
              5'h1a: normal_out = 16'h3bcc;
              5'h1b: normal_out = 16'h3bcc;
              5'h1c: normal_out = 16'h3bcc;
              5'h1d: normal_out = 16'h3bcc;
              5'h1e: normal_out = 16'h3bcc;
              5'h1f: normal_out = 16'h3bcc;
              default: begin end
            endcase
          end
          5'h06: begin
            normal_out = 16'h3bcb;
            case (mant[4:0])
              5'h00: normal_out = 16'h3bcc;
              5'h01: normal_out = 16'h3bcc;
              5'h02: normal_out = 16'h3bcc;
              5'h03: normal_out = 16'h3bcc;
              5'h04: normal_out = 16'h3bcc;
              5'h05: normal_out = 16'h3bcc;
              5'h06: normal_out = 16'h3bcc;
              5'h07: normal_out = 16'h3bcc;
              5'h08: normal_out = 16'h3bcc;
              5'h09: normal_out = 16'h3bcc;
              5'h0a: normal_out = 16'h3bcc;
              5'h0b: normal_out = 16'h3bcc;
              default: begin end
            endcase
          end
          5'h07: begin
            normal_out = 16'h3bca;
            case (mant[4:0])
              5'h00: normal_out = 16'h3bcb;
              5'h01: normal_out = 16'h3bcb;
              5'h02: normal_out = 16'h3bcb;
              5'h03: normal_out = 16'h3bcb;
              5'h1c: normal_out = 16'h3bc9;
              5'h1d: normal_out = 16'h3bc9;
              5'h1e: normal_out = 16'h3bc9;
              5'h1f: normal_out = 16'h3bc9;
              default: begin end
            endcase
          end
          5'h08: begin
            normal_out = 16'h3bc9;
            case (mant[4:0])
              5'h13: normal_out = 16'h3bc8;
              5'h14: normal_out = 16'h3bc8;
              5'h15: normal_out = 16'h3bc8;
              5'h16: normal_out = 16'h3bc8;
              5'h17: normal_out = 16'h3bc8;
              5'h18: normal_out = 16'h3bc8;
              5'h19: normal_out = 16'h3bc8;
              5'h1a: normal_out = 16'h3bc8;
              5'h1b: normal_out = 16'h3bc8;
              5'h1c: normal_out = 16'h3bc8;
              5'h1d: normal_out = 16'h3bc8;
              5'h1e: normal_out = 16'h3bc8;
              5'h1f: normal_out = 16'h3bc8;
              default: begin end
            endcase
          end
          5'h09: begin
            normal_out = 16'h3bc7;
            case (mant[4:0])
              5'h00: normal_out = 16'h3bc8;
              5'h01: normal_out = 16'h3bc8;
              5'h02: normal_out = 16'h3bc8;
              5'h03: normal_out = 16'h3bc8;
              5'h04: normal_out = 16'h3bc8;
              5'h05: normal_out = 16'h3bc8;
              5'h06: normal_out = 16'h3bc8;
              5'h07: normal_out = 16'h3bc8;
              5'h08: normal_out = 16'h3bc8;
              5'h09: normal_out = 16'h3bc8;
              5'h0a: normal_out = 16'h3bc8;
              default: begin end
            endcase
          end
          5'h0a: begin
            normal_out = 16'h3bc6;
            case (mant[4:0])
              5'h00: normal_out = 16'h3bc7;
              5'h01: normal_out = 16'h3bc7;
              5'h02: normal_out = 16'h3bc7;
              5'h1b: normal_out = 16'h3bc5;
              5'h1c: normal_out = 16'h3bc5;
              5'h1d: normal_out = 16'h3bc5;
              5'h1e: normal_out = 16'h3bc5;
              5'h1f: normal_out = 16'h3bc5;
              default: begin end
            endcase
          end
          5'h0b: begin
            normal_out = 16'h3bc5;
            case (mant[4:0])
              5'h12: normal_out = 16'h3bc4;
              5'h13: normal_out = 16'h3bc4;
              5'h14: normal_out = 16'h3bc4;
              5'h15: normal_out = 16'h3bc4;
              5'h16: normal_out = 16'h3bc4;
              5'h17: normal_out = 16'h3bc4;
              5'h18: normal_out = 16'h3bc4;
              5'h19: normal_out = 16'h3bc4;
              5'h1a: normal_out = 16'h3bc4;
              5'h1b: normal_out = 16'h3bc4;
              5'h1c: normal_out = 16'h3bc4;
              5'h1d: normal_out = 16'h3bc4;
              5'h1e: normal_out = 16'h3bc4;
              5'h1f: normal_out = 16'h3bc4;
              default: begin end
            endcase
          end
          5'h0c: begin
            normal_out = 16'h3bc3;
            case (mant[4:0])
              5'h00: normal_out = 16'h3bc4;
              5'h01: normal_out = 16'h3bc4;
              5'h02: normal_out = 16'h3bc4;
              5'h03: normal_out = 16'h3bc4;
              5'h04: normal_out = 16'h3bc4;
              5'h05: normal_out = 16'h3bc4;
              5'h06: normal_out = 16'h3bc4;
              5'h07: normal_out = 16'h3bc4;
              5'h08: normal_out = 16'h3bc4;
              5'h09: normal_out = 16'h3bc4;
              default: begin end
            endcase
          end
          5'h0d: begin
            normal_out = 16'h3bc2;
            case (mant[4:0])
              5'h00: normal_out = 16'h3bc3;
              5'h01: normal_out = 16'h3bc3;
              5'h1a: normal_out = 16'h3bc1;
              5'h1b: normal_out = 16'h3bc1;
              5'h1c: normal_out = 16'h3bc1;
              5'h1d: normal_out = 16'h3bc1;
              5'h1e: normal_out = 16'h3bc1;
              5'h1f: normal_out = 16'h3bc1;
              default: begin end
            endcase
          end
          5'h0e: begin
            normal_out = 16'h3bc1;
            case (mant[4:0])
              5'h11: normal_out = 16'h3bc0;
              5'h12: normal_out = 16'h3bc0;
              5'h13: normal_out = 16'h3bc0;
              5'h14: normal_out = 16'h3bc0;
              5'h15: normal_out = 16'h3bc0;
              5'h16: normal_out = 16'h3bc0;
              5'h17: normal_out = 16'h3bc0;
              5'h18: normal_out = 16'h3bc0;
              5'h19: normal_out = 16'h3bc0;
              5'h1a: normal_out = 16'h3bc0;
              5'h1b: normal_out = 16'h3bc0;
              5'h1c: normal_out = 16'h3bc0;
              5'h1d: normal_out = 16'h3bc0;
              5'h1e: normal_out = 16'h3bc0;
              5'h1f: normal_out = 16'h3bc0;
              default: begin end
            endcase
          end
          5'h0f: begin
            normal_out = 16'h3bbf;
            case (mant[4:0])
              5'h00: normal_out = 16'h3bc0;
              5'h01: normal_out = 16'h3bc0;
              5'h02: normal_out = 16'h3bc0;
              5'h03: normal_out = 16'h3bc0;
              5'h04: normal_out = 16'h3bc0;
              5'h05: normal_out = 16'h3bc0;
              5'h06: normal_out = 16'h3bc0;
              5'h07: normal_out = 16'h3bc0;
              5'h08: normal_out = 16'h3bc0;
              default: begin end
            endcase
          end
          5'h10: begin
            normal_out = 16'h3bbe;
            case (mant[4:0])
              5'h00: normal_out = 16'h3bbf;
              5'h19: normal_out = 16'h3bbd;
              5'h1a: normal_out = 16'h3bbd;
              5'h1b: normal_out = 16'h3bbd;
              5'h1c: normal_out = 16'h3bbd;
              5'h1d: normal_out = 16'h3bbd;
              5'h1e: normal_out = 16'h3bbd;
              5'h1f: normal_out = 16'h3bbd;
              default: begin end
            endcase
          end
          5'h11: begin
            normal_out = 16'h3bbd;
            case (mant[4:0])
              5'h11: normal_out = 16'h3bbc;
              5'h12: normal_out = 16'h3bbc;
              5'h13: normal_out = 16'h3bbc;
              5'h14: normal_out = 16'h3bbc;
              5'h15: normal_out = 16'h3bbc;
              5'h16: normal_out = 16'h3bbc;
              5'h17: normal_out = 16'h3bbc;
              5'h18: normal_out = 16'h3bbc;
              5'h19: normal_out = 16'h3bbc;
              5'h1a: normal_out = 16'h3bbc;
              5'h1b: normal_out = 16'h3bbc;
              5'h1c: normal_out = 16'h3bbc;
              5'h1d: normal_out = 16'h3bbc;
              5'h1e: normal_out = 16'h3bbc;
              5'h1f: normal_out = 16'h3bbc;
              default: begin end
            endcase
          end
          5'h12: begin
            normal_out = 16'h3bbb;
            case (mant[4:0])
              5'h00: normal_out = 16'h3bbc;
              5'h01: normal_out = 16'h3bbc;
              5'h02: normal_out = 16'h3bbc;
              5'h03: normal_out = 16'h3bbc;
              5'h04: normal_out = 16'h3bbc;
              5'h05: normal_out = 16'h3bbc;
              5'h06: normal_out = 16'h3bbc;
              5'h07: normal_out = 16'h3bbc;
              5'h08: normal_out = 16'h3bbc;
              default: begin end
            endcase
          end
          5'h13: begin
            normal_out = 16'h3bba;
            case (mant[4:0])
              5'h00: normal_out = 16'h3bbb;
              5'h19: normal_out = 16'h3bb9;
              5'h1a: normal_out = 16'h3bb9;
              5'h1b: normal_out = 16'h3bb9;
              5'h1c: normal_out = 16'h3bb9;
              5'h1d: normal_out = 16'h3bb9;
              5'h1e: normal_out = 16'h3bb9;
              5'h1f: normal_out = 16'h3bb9;
              default: begin end
            endcase
          end
          5'h14: begin
            normal_out = 16'h3bb8;
            case (mant[4:0])
              5'h00: normal_out = 16'h3bb9;
              5'h01: normal_out = 16'h3bb9;
              5'h02: normal_out = 16'h3bb9;
              5'h03: normal_out = 16'h3bb9;
              5'h04: normal_out = 16'h3bb9;
              5'h05: normal_out = 16'h3bb9;
              5'h06: normal_out = 16'h3bb9;
              5'h07: normal_out = 16'h3bb9;
              5'h08: normal_out = 16'h3bb9;
              5'h09: normal_out = 16'h3bb9;
              5'h0a: normal_out = 16'h3bb9;
              5'h0b: normal_out = 16'h3bb9;
              5'h0c: normal_out = 16'h3bb9;
              5'h0d: normal_out = 16'h3bb9;
              5'h0e: normal_out = 16'h3bb9;
              5'h0f: normal_out = 16'h3bb9;
              default: begin end
            endcase
          end
          5'h15: begin
            normal_out = 16'h3bb7;
            case (mant[4:0])
              5'h00: normal_out = 16'h3bb8;
              5'h01: normal_out = 16'h3bb8;
              5'h02: normal_out = 16'h3bb8;
              5'h03: normal_out = 16'h3bb8;
              5'h04: normal_out = 16'h3bb8;
              5'h05: normal_out = 16'h3bb8;
              5'h06: normal_out = 16'h3bb8;
              5'h07: normal_out = 16'h3bb8;
              default: begin end
            endcase
          end
          5'h16: begin
            normal_out = 16'h3bb6;
            case (mant[4:0])
              5'h18: normal_out = 16'h3bb5;
              5'h19: normal_out = 16'h3bb5;
              5'h1a: normal_out = 16'h3bb5;
              5'h1b: normal_out = 16'h3bb5;
              5'h1c: normal_out = 16'h3bb5;
              5'h1d: normal_out = 16'h3bb5;
              5'h1e: normal_out = 16'h3bb5;
              5'h1f: normal_out = 16'h3bb5;
              default: begin end
            endcase
          end
          5'h17: begin
            normal_out = 16'h3bb4;
            case (mant[4:0])
              5'h00: normal_out = 16'h3bb5;
              5'h01: normal_out = 16'h3bb5;
              5'h02: normal_out = 16'h3bb5;
              5'h03: normal_out = 16'h3bb5;
              5'h04: normal_out = 16'h3bb5;
              5'h05: normal_out = 16'h3bb5;
              5'h06: normal_out = 16'h3bb5;
              5'h07: normal_out = 16'h3bb5;
              5'h08: normal_out = 16'h3bb5;
              5'h09: normal_out = 16'h3bb5;
              5'h0a: normal_out = 16'h3bb5;
              5'h0b: normal_out = 16'h3bb5;
              5'h0c: normal_out = 16'h3bb5;
              5'h0d: normal_out = 16'h3bb5;
              5'h0e: normal_out = 16'h3bb5;
              5'h0f: normal_out = 16'h3bb5;
              default: begin end
            endcase
          end
          5'h18: begin
            normal_out = 16'h3bb3;
            case (mant[4:0])
              5'h00: normal_out = 16'h3bb4;
              5'h01: normal_out = 16'h3bb4;
              5'h02: normal_out = 16'h3bb4;
              5'h03: normal_out = 16'h3bb4;
              5'h04: normal_out = 16'h3bb4;
              5'h05: normal_out = 16'h3bb4;
              5'h06: normal_out = 16'h3bb4;
              5'h07: normal_out = 16'h3bb4;
              default: begin end
            endcase
          end
          5'h19: begin
            normal_out = 16'h3bb2;
            case (mant[4:0])
              5'h18: normal_out = 16'h3bb1;
              5'h19: normal_out = 16'h3bb1;
              5'h1a: normal_out = 16'h3bb1;
              5'h1b: normal_out = 16'h3bb1;
              5'h1c: normal_out = 16'h3bb1;
              5'h1d: normal_out = 16'h3bb1;
              5'h1e: normal_out = 16'h3bb1;
              5'h1f: normal_out = 16'h3bb1;
              default: begin end
            endcase
          end
          5'h1a: begin
            normal_out = 16'h3bb0;
            case (mant[4:0])
              5'h00: normal_out = 16'h3bb1;
              5'h01: normal_out = 16'h3bb1;
              5'h02: normal_out = 16'h3bb1;
              5'h03: normal_out = 16'h3bb1;
              5'h04: normal_out = 16'h3bb1;
              5'h05: normal_out = 16'h3bb1;
              5'h06: normal_out = 16'h3bb1;
              5'h07: normal_out = 16'h3bb1;
              5'h08: normal_out = 16'h3bb1;
              5'h09: normal_out = 16'h3bb1;
              5'h0a: normal_out = 16'h3bb1;
              5'h0b: normal_out = 16'h3bb1;
              5'h0c: normal_out = 16'h3bb1;
              5'h0d: normal_out = 16'h3bb1;
              5'h0e: normal_out = 16'h3bb1;
              5'h0f: normal_out = 16'h3bb1;
              default: begin end
            endcase
          end
          5'h1b: begin
            normal_out = 16'h3baf;
            case (mant[4:0])
              5'h00: normal_out = 16'h3bb0;
              5'h01: normal_out = 16'h3bb0;
              5'h02: normal_out = 16'h3bb0;
              5'h03: normal_out = 16'h3bb0;
              5'h04: normal_out = 16'h3bb0;
              5'h05: normal_out = 16'h3bb0;
              5'h06: normal_out = 16'h3bb0;
              5'h07: normal_out = 16'h3bb0;
              default: begin end
            endcase
          end
          5'h1c: begin
            normal_out = 16'h3bae;
            case (mant[4:0])
              5'h18: normal_out = 16'h3bad;
              5'h19: normal_out = 16'h3bad;
              5'h1a: normal_out = 16'h3bad;
              5'h1b: normal_out = 16'h3bad;
              5'h1c: normal_out = 16'h3bad;
              5'h1d: normal_out = 16'h3bad;
              5'h1e: normal_out = 16'h3bad;
              5'h1f: normal_out = 16'h3bad;
              default: begin end
            endcase
          end
          5'h1d: begin
            normal_out = 16'h3bac;
            case (mant[4:0])
              5'h00: normal_out = 16'h3bad;
              5'h01: normal_out = 16'h3bad;
              5'h02: normal_out = 16'h3bad;
              5'h03: normal_out = 16'h3bad;
              5'h04: normal_out = 16'h3bad;
              5'h05: normal_out = 16'h3bad;
              5'h06: normal_out = 16'h3bad;
              5'h07: normal_out = 16'h3bad;
              5'h08: normal_out = 16'h3bad;
              5'h09: normal_out = 16'h3bad;
              5'h0a: normal_out = 16'h3bad;
              5'h0b: normal_out = 16'h3bad;
              5'h0c: normal_out = 16'h3bad;
              5'h0d: normal_out = 16'h3bad;
              5'h0e: normal_out = 16'h3bad;
              5'h0f: normal_out = 16'h3bad;
              default: begin end
            endcase
          end
          5'h1e: begin
            normal_out = 16'h3bab;
            case (mant[4:0])
              5'h00: normal_out = 16'h3bac;
              5'h01: normal_out = 16'h3bac;
              5'h02: normal_out = 16'h3bac;
              5'h03: normal_out = 16'h3bac;
              5'h04: normal_out = 16'h3bac;
              5'h05: normal_out = 16'h3bac;
              5'h06: normal_out = 16'h3bac;
              5'h07: normal_out = 16'h3bac;
              default: begin end
            endcase
          end
          5'h1f: begin
            normal_out = 16'h3baa;
            case (mant[4:0])
              5'h19: normal_out = 16'h3ba9;
              5'h1a: normal_out = 16'h3ba9;
              5'h1b: normal_out = 16'h3ba9;
              5'h1c: normal_out = 16'h3ba9;
              5'h1d: normal_out = 16'h3ba9;
              5'h1e: normal_out = 16'h3ba9;
              5'h1f: normal_out = 16'h3ba9;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      6'h2b: begin
        case (mant[9:5])
          5'h00: begin
            normal_out = 16'h3ba8;
            case (mant[4:0])
              5'h00: normal_out = 16'h3ba9;
              5'h01: normal_out = 16'h3ba9;
              5'h02: normal_out = 16'h3ba9;
              5'h03: normal_out = 16'h3ba9;
              5'h04: normal_out = 16'h3ba9;
              5'h05: normal_out = 16'h3ba9;
              5'h06: normal_out = 16'h3ba9;
              5'h07: normal_out = 16'h3ba9;
              5'h08: normal_out = 16'h3ba9;
              5'h15: normal_out = 16'h3ba7;
              5'h16: normal_out = 16'h3ba7;
              5'h17: normal_out = 16'h3ba7;
              5'h18: normal_out = 16'h3ba7;
              5'h19: normal_out = 16'h3ba7;
              5'h1a: normal_out = 16'h3ba7;
              5'h1b: normal_out = 16'h3ba7;
              5'h1c: normal_out = 16'h3ba7;
              5'h1d: normal_out = 16'h3ba7;
              5'h1e: normal_out = 16'h3ba7;
              5'h1f: normal_out = 16'h3ba7;
              default: begin end
            endcase
          end
          5'h01: begin
            normal_out = 16'h3ba5;
            case (mant[4:0])
              5'h00: normal_out = 16'h3ba7;
              5'h01: normal_out = 16'h3ba6;
              5'h02: normal_out = 16'h3ba6;
              5'h03: normal_out = 16'h3ba6;
              5'h04: normal_out = 16'h3ba6;
              5'h05: normal_out = 16'h3ba6;
              5'h06: normal_out = 16'h3ba6;
              5'h07: normal_out = 16'h3ba6;
              5'h08: normal_out = 16'h3ba6;
              5'h09: normal_out = 16'h3ba6;
              5'h0a: normal_out = 16'h3ba6;
              5'h0b: normal_out = 16'h3ba6;
              5'h0c: normal_out = 16'h3ba6;
              5'h19: normal_out = 16'h3ba4;
              5'h1a: normal_out = 16'h3ba4;
              5'h1b: normal_out = 16'h3ba4;
              5'h1c: normal_out = 16'h3ba4;
              5'h1d: normal_out = 16'h3ba4;
              5'h1e: normal_out = 16'h3ba4;
              5'h1f: normal_out = 16'h3ba4;
              default: begin end
            endcase
          end
          5'h02: begin
            normal_out = 16'h3ba2;
            case (mant[4:0])
              5'h00: normal_out = 16'h3ba4;
              5'h01: normal_out = 16'h3ba4;
              5'h02: normal_out = 16'h3ba4;
              5'h03: normal_out = 16'h3ba4;
              5'h04: normal_out = 16'h3ba4;
              5'h05: normal_out = 16'h3ba3;
              5'h06: normal_out = 16'h3ba3;
              5'h07: normal_out = 16'h3ba3;
              5'h08: normal_out = 16'h3ba3;
              5'h09: normal_out = 16'h3ba3;
              5'h0a: normal_out = 16'h3ba3;
              5'h0b: normal_out = 16'h3ba3;
              5'h0c: normal_out = 16'h3ba3;
              5'h0d: normal_out = 16'h3ba3;
              5'h0e: normal_out = 16'h3ba3;
              5'h0f: normal_out = 16'h3ba3;
              5'h10: normal_out = 16'h3ba3;
              5'h1d: normal_out = 16'h3ba1;
              5'h1e: normal_out = 16'h3ba1;
              5'h1f: normal_out = 16'h3ba1;
              default: begin end
            endcase
          end
          5'h03: begin
            normal_out = 16'h3ba0;
            case (mant[4:0])
              5'h00: normal_out = 16'h3ba1;
              5'h01: normal_out = 16'h3ba1;
              5'h02: normal_out = 16'h3ba1;
              5'h03: normal_out = 16'h3ba1;
              5'h04: normal_out = 16'h3ba1;
              5'h05: normal_out = 16'h3ba1;
              5'h06: normal_out = 16'h3ba1;
              5'h07: normal_out = 16'h3ba1;
              5'h08: normal_out = 16'h3ba1;
              5'h15: normal_out = 16'h3b9f;
              5'h16: normal_out = 16'h3b9f;
              5'h17: normal_out = 16'h3b9f;
              5'h18: normal_out = 16'h3b9f;
              5'h19: normal_out = 16'h3b9f;
              5'h1a: normal_out = 16'h3b9f;
              5'h1b: normal_out = 16'h3b9f;
              5'h1c: normal_out = 16'h3b9f;
              5'h1d: normal_out = 16'h3b9f;
              5'h1e: normal_out = 16'h3b9f;
              5'h1f: normal_out = 16'h3b9f;
              default: begin end
            endcase
          end
          5'h04: begin
            normal_out = 16'h3b9e;
            case (mant[4:0])
              5'h00: normal_out = 16'h3b9f;
              5'h0e: normal_out = 16'h3b9d;
              5'h0f: normal_out = 16'h3b9d;
              5'h10: normal_out = 16'h3b9d;
              5'h11: normal_out = 16'h3b9d;
              5'h12: normal_out = 16'h3b9d;
              5'h13: normal_out = 16'h3b9d;
              5'h14: normal_out = 16'h3b9d;
              5'h15: normal_out = 16'h3b9d;
              5'h16: normal_out = 16'h3b9d;
              5'h17: normal_out = 16'h3b9d;
              5'h18: normal_out = 16'h3b9d;
              5'h19: normal_out = 16'h3b9d;
              5'h1a: normal_out = 16'h3b9c;
              5'h1b: normal_out = 16'h3b9c;
              5'h1c: normal_out = 16'h3b9c;
              5'h1d: normal_out = 16'h3b9c;
              5'h1e: normal_out = 16'h3b9c;
              5'h1f: normal_out = 16'h3b9c;
              default: begin end
            endcase
          end
          5'h05: begin
            normal_out = 16'h3b9a;
            case (mant[4:0])
              5'h00: normal_out = 16'h3b9c;
              5'h01: normal_out = 16'h3b9c;
              5'h02: normal_out = 16'h3b9c;
              5'h03: normal_out = 16'h3b9c;
              5'h04: normal_out = 16'h3b9c;
              5'h05: normal_out = 16'h3b9c;
              5'h06: normal_out = 16'h3b9b;
              5'h07: normal_out = 16'h3b9b;
              5'h08: normal_out = 16'h3b9b;
              5'h09: normal_out = 16'h3b9b;
              5'h0a: normal_out = 16'h3b9b;
              5'h0b: normal_out = 16'h3b9b;
              5'h0c: normal_out = 16'h3b9b;
              5'h0d: normal_out = 16'h3b9b;
              5'h0e: normal_out = 16'h3b9b;
              5'h0f: normal_out = 16'h3b9b;
              5'h10: normal_out = 16'h3b9b;
              5'h11: normal_out = 16'h3b9b;
              5'h1e: normal_out = 16'h3b99;
              5'h1f: normal_out = 16'h3b99;
              default: begin end
            endcase
          end
          5'h06: begin
            normal_out = 16'h3b98;
            case (mant[4:0])
              5'h00: normal_out = 16'h3b99;
              5'h01: normal_out = 16'h3b99;
              5'h02: normal_out = 16'h3b99;
              5'h03: normal_out = 16'h3b99;
              5'h04: normal_out = 16'h3b99;
              5'h05: normal_out = 16'h3b99;
              5'h06: normal_out = 16'h3b99;
              5'h07: normal_out = 16'h3b99;
              5'h08: normal_out = 16'h3b99;
              5'h09: normal_out = 16'h3b99;
              5'h16: normal_out = 16'h3b97;
              5'h17: normal_out = 16'h3b97;
              5'h18: normal_out = 16'h3b97;
              5'h19: normal_out = 16'h3b97;
              5'h1a: normal_out = 16'h3b97;
              5'h1b: normal_out = 16'h3b97;
              5'h1c: normal_out = 16'h3b97;
              5'h1d: normal_out = 16'h3b97;
              5'h1e: normal_out = 16'h3b97;
              5'h1f: normal_out = 16'h3b97;
              default: begin end
            endcase
          end
          5'h07: begin
            normal_out = 16'h3b95;
            case (mant[4:0])
              5'h00: normal_out = 16'h3b97;
              5'h01: normal_out = 16'h3b97;
              5'h02: normal_out = 16'h3b97;
              5'h03: normal_out = 16'h3b96;
              5'h04: normal_out = 16'h3b96;
              5'h05: normal_out = 16'h3b96;
              5'h06: normal_out = 16'h3b96;
              5'h07: normal_out = 16'h3b96;
              5'h08: normal_out = 16'h3b96;
              5'h09: normal_out = 16'h3b96;
              5'h0a: normal_out = 16'h3b96;
              5'h0b: normal_out = 16'h3b96;
              5'h0c: normal_out = 16'h3b96;
              5'h0d: normal_out = 16'h3b96;
              5'h0e: normal_out = 16'h3b96;
              5'h1b: normal_out = 16'h3b94;
              5'h1c: normal_out = 16'h3b94;
              5'h1d: normal_out = 16'h3b94;
              5'h1e: normal_out = 16'h3b94;
              5'h1f: normal_out = 16'h3b94;
              default: begin end
            endcase
          end
          5'h08: begin
            normal_out = 16'h3b92;
            case (mant[4:0])
              5'h00: normal_out = 16'h3b94;
              5'h01: normal_out = 16'h3b94;
              5'h02: normal_out = 16'h3b94;
              5'h03: normal_out = 16'h3b94;
              5'h04: normal_out = 16'h3b94;
              5'h05: normal_out = 16'h3b94;
              5'h06: normal_out = 16'h3b94;
              5'h07: normal_out = 16'h3b93;
              5'h08: normal_out = 16'h3b93;
              5'h09: normal_out = 16'h3b93;
              5'h0a: normal_out = 16'h3b93;
              5'h0b: normal_out = 16'h3b93;
              5'h0c: normal_out = 16'h3b93;
              5'h0d: normal_out = 16'h3b93;
              5'h0e: normal_out = 16'h3b93;
              5'h0f: normal_out = 16'h3b93;
              5'h10: normal_out = 16'h3b93;
              5'h11: normal_out = 16'h3b93;
              5'h12: normal_out = 16'h3b93;
              default: begin end
            endcase
          end
          5'h09: begin
            normal_out = 16'h3b90;
            case (mant[4:0])
              5'h00: normal_out = 16'h3b91;
              5'h01: normal_out = 16'h3b91;
              5'h02: normal_out = 16'h3b91;
              5'h03: normal_out = 16'h3b91;
              5'h04: normal_out = 16'h3b91;
              5'h05: normal_out = 16'h3b91;
              5'h06: normal_out = 16'h3b91;
              5'h07: normal_out = 16'h3b91;
              5'h08: normal_out = 16'h3b91;
              5'h09: normal_out = 16'h3b91;
              5'h0a: normal_out = 16'h3b91;
              5'h0b: normal_out = 16'h3b91;
              5'h18: normal_out = 16'h3b8f;
              5'h19: normal_out = 16'h3b8f;
              5'h1a: normal_out = 16'h3b8f;
              5'h1b: normal_out = 16'h3b8f;
              5'h1c: normal_out = 16'h3b8f;
              5'h1d: normal_out = 16'h3b8f;
              5'h1e: normal_out = 16'h3b8f;
              5'h1f: normal_out = 16'h3b8f;
              default: begin end
            endcase
          end
          5'h0a: begin
            normal_out = 16'h3b8d;
            case (mant[4:0])
              5'h00: normal_out = 16'h3b8f;
              5'h01: normal_out = 16'h3b8f;
              5'h02: normal_out = 16'h3b8f;
              5'h03: normal_out = 16'h3b8f;
              5'h04: normal_out = 16'h3b8e;
              5'h05: normal_out = 16'h3b8e;
              5'h06: normal_out = 16'h3b8e;
              5'h07: normal_out = 16'h3b8e;
              5'h08: normal_out = 16'h3b8e;
              5'h09: normal_out = 16'h3b8e;
              5'h0a: normal_out = 16'h3b8e;
              5'h0b: normal_out = 16'h3b8e;
              5'h0c: normal_out = 16'h3b8e;
              5'h0d: normal_out = 16'h3b8e;
              5'h0e: normal_out = 16'h3b8e;
              5'h0f: normal_out = 16'h3b8e;
              5'h1d: normal_out = 16'h3b8c;
              5'h1e: normal_out = 16'h3b8c;
              5'h1f: normal_out = 16'h3b8c;
              default: begin end
            endcase
          end
          5'h0b: begin
            normal_out = 16'h3b8b;
            case (mant[4:0])
              5'h00: normal_out = 16'h3b8c;
              5'h01: normal_out = 16'h3b8c;
              5'h02: normal_out = 16'h3b8c;
              5'h03: normal_out = 16'h3b8c;
              5'h04: normal_out = 16'h3b8c;
              5'h05: normal_out = 16'h3b8c;
              5'h06: normal_out = 16'h3b8c;
              5'h07: normal_out = 16'h3b8c;
              5'h08: normal_out = 16'h3b8c;
              5'h15: normal_out = 16'h3b8a;
              5'h16: normal_out = 16'h3b8a;
              5'h17: normal_out = 16'h3b8a;
              5'h18: normal_out = 16'h3b8a;
              5'h19: normal_out = 16'h3b8a;
              5'h1a: normal_out = 16'h3b8a;
              5'h1b: normal_out = 16'h3b8a;
              5'h1c: normal_out = 16'h3b8a;
              5'h1d: normal_out = 16'h3b8a;
              5'h1e: normal_out = 16'h3b8a;
              5'h1f: normal_out = 16'h3b8a;
              default: begin end
            endcase
          end
          5'h0c: begin
            normal_out = 16'h3b89;
            case (mant[4:0])
              5'h00: normal_out = 16'h3b8a;
              5'h0e: normal_out = 16'h3b88;
              5'h0f: normal_out = 16'h3b88;
              5'h10: normal_out = 16'h3b88;
              5'h11: normal_out = 16'h3b88;
              5'h12: normal_out = 16'h3b88;
              5'h13: normal_out = 16'h3b88;
              5'h14: normal_out = 16'h3b88;
              5'h15: normal_out = 16'h3b88;
              5'h16: normal_out = 16'h3b88;
              5'h17: normal_out = 16'h3b88;
              5'h18: normal_out = 16'h3b88;
              5'h19: normal_out = 16'h3b88;
              5'h1a: normal_out = 16'h3b87;
              5'h1b: normal_out = 16'h3b87;
              5'h1c: normal_out = 16'h3b87;
              5'h1d: normal_out = 16'h3b87;
              5'h1e: normal_out = 16'h3b87;
              5'h1f: normal_out = 16'h3b87;
              default: begin end
            endcase
          end
          5'h0d: begin
            normal_out = 16'h3b85;
            case (mant[4:0])
              5'h00: normal_out = 16'h3b87;
              5'h01: normal_out = 16'h3b87;
              5'h02: normal_out = 16'h3b87;
              5'h03: normal_out = 16'h3b87;
              5'h04: normal_out = 16'h3b87;
              5'h05: normal_out = 16'h3b87;
              5'h06: normal_out = 16'h3b86;
              5'h07: normal_out = 16'h3b86;
              5'h08: normal_out = 16'h3b86;
              5'h09: normal_out = 16'h3b86;
              5'h0a: normal_out = 16'h3b86;
              5'h0b: normal_out = 16'h3b86;
              5'h0c: normal_out = 16'h3b86;
              5'h0d: normal_out = 16'h3b86;
              5'h0e: normal_out = 16'h3b86;
              5'h0f: normal_out = 16'h3b86;
              5'h10: normal_out = 16'h3b86;
              5'h11: normal_out = 16'h3b86;
              5'h1f: normal_out = 16'h3b84;
              default: begin end
            endcase
          end
          5'h0e: begin
            normal_out = 16'h3b83;
            case (mant[4:0])
              5'h00: normal_out = 16'h3b84;
              5'h01: normal_out = 16'h3b84;
              5'h02: normal_out = 16'h3b84;
              5'h03: normal_out = 16'h3b84;
              5'h04: normal_out = 16'h3b84;
              5'h05: normal_out = 16'h3b84;
              5'h06: normal_out = 16'h3b84;
              5'h07: normal_out = 16'h3b84;
              5'h08: normal_out = 16'h3b84;
              5'h09: normal_out = 16'h3b84;
              5'h0a: normal_out = 16'h3b84;
              5'h17: normal_out = 16'h3b82;
              5'h18: normal_out = 16'h3b82;
              5'h19: normal_out = 16'h3b82;
              5'h1a: normal_out = 16'h3b82;
              5'h1b: normal_out = 16'h3b82;
              5'h1c: normal_out = 16'h3b82;
              5'h1d: normal_out = 16'h3b82;
              5'h1e: normal_out = 16'h3b82;
              5'h1f: normal_out = 16'h3b82;
              default: begin end
            endcase
          end
          5'h0f: begin
            normal_out = 16'h3b80;
            case (mant[4:0])
              5'h00: normal_out = 16'h3b82;
              5'h01: normal_out = 16'h3b82;
              5'h02: normal_out = 16'h3b82;
              5'h03: normal_out = 16'h3b82;
              5'h04: normal_out = 16'h3b81;
              5'h05: normal_out = 16'h3b81;
              5'h06: normal_out = 16'h3b81;
              5'h07: normal_out = 16'h3b81;
              5'h08: normal_out = 16'h3b81;
              5'h09: normal_out = 16'h3b81;
              5'h0a: normal_out = 16'h3b81;
              5'h0b: normal_out = 16'h3b81;
              5'h0c: normal_out = 16'h3b81;
              5'h0d: normal_out = 16'h3b81;
              5'h0e: normal_out = 16'h3b81;
              5'h0f: normal_out = 16'h3b81;
              5'h1c: normal_out = 16'h3b7f;
              5'h1d: normal_out = 16'h3b7f;
              5'h1e: normal_out = 16'h3b7f;
              5'h1f: normal_out = 16'h3b7f;
              default: begin end
            endcase
          end
          5'h10: begin
            normal_out = 16'h3b7e;
            case (mant[4:0])
              5'h00: normal_out = 16'h3b7f;
              5'h01: normal_out = 16'h3b7f;
              5'h02: normal_out = 16'h3b7f;
              5'h03: normal_out = 16'h3b7f;
              5'h04: normal_out = 16'h3b7f;
              5'h05: normal_out = 16'h3b7f;
              5'h06: normal_out = 16'h3b7f;
              5'h07: normal_out = 16'h3b7f;
              5'h15: normal_out = 16'h3b7d;
              5'h16: normal_out = 16'h3b7d;
              5'h17: normal_out = 16'h3b7d;
              5'h18: normal_out = 16'h3b7d;
              5'h19: normal_out = 16'h3b7d;
              5'h1a: normal_out = 16'h3b7d;
              5'h1b: normal_out = 16'h3b7d;
              5'h1c: normal_out = 16'h3b7d;
              5'h1d: normal_out = 16'h3b7d;
              5'h1e: normal_out = 16'h3b7d;
              5'h1f: normal_out = 16'h3b7d;
              default: begin end
            endcase
          end
          5'h11: begin
            normal_out = 16'h3b7b;
            case (mant[4:0])
              5'h00: normal_out = 16'h3b7d;
              5'h01: normal_out = 16'h3b7c;
              5'h02: normal_out = 16'h3b7c;
              5'h03: normal_out = 16'h3b7c;
              5'h04: normal_out = 16'h3b7c;
              5'h05: normal_out = 16'h3b7c;
              5'h06: normal_out = 16'h3b7c;
              5'h07: normal_out = 16'h3b7c;
              5'h08: normal_out = 16'h3b7c;
              5'h09: normal_out = 16'h3b7c;
              5'h0a: normal_out = 16'h3b7c;
              5'h0b: normal_out = 16'h3b7c;
              5'h0c: normal_out = 16'h3b7c;
              5'h1a: normal_out = 16'h3b7a;
              5'h1b: normal_out = 16'h3b7a;
              5'h1c: normal_out = 16'h3b7a;
              5'h1d: normal_out = 16'h3b7a;
              5'h1e: normal_out = 16'h3b7a;
              5'h1f: normal_out = 16'h3b7a;
              default: begin end
            endcase
          end
          5'h12: begin
            normal_out = 16'h3b79;
            case (mant[4:0])
              5'h00: normal_out = 16'h3b7a;
              5'h01: normal_out = 16'h3b7a;
              5'h02: normal_out = 16'h3b7a;
              5'h03: normal_out = 16'h3b7a;
              5'h04: normal_out = 16'h3b7a;
              5'h05: normal_out = 16'h3b7a;
              5'h13: normal_out = 16'h3b78;
              5'h14: normal_out = 16'h3b78;
              5'h15: normal_out = 16'h3b78;
              5'h16: normal_out = 16'h3b78;
              5'h17: normal_out = 16'h3b78;
              5'h18: normal_out = 16'h3b78;
              5'h19: normal_out = 16'h3b78;
              5'h1a: normal_out = 16'h3b78;
              5'h1b: normal_out = 16'h3b78;
              5'h1c: normal_out = 16'h3b78;
              5'h1d: normal_out = 16'h3b78;
              5'h1e: normal_out = 16'h3b78;
              5'h1f: normal_out = 16'h3b77;
              default: begin end
            endcase
          end
          5'h13: begin
            normal_out = 16'h3b76;
            case (mant[4:0])
              5'h00: normal_out = 16'h3b77;
              5'h01: normal_out = 16'h3b77;
              5'h02: normal_out = 16'h3b77;
              5'h03: normal_out = 16'h3b77;
              5'h04: normal_out = 16'h3b77;
              5'h05: normal_out = 16'h3b77;
              5'h06: normal_out = 16'h3b77;
              5'h07: normal_out = 16'h3b77;
              5'h08: normal_out = 16'h3b77;
              5'h09: normal_out = 16'h3b77;
              5'h0a: normal_out = 16'h3b77;
              5'h18: normal_out = 16'h3b75;
              5'h19: normal_out = 16'h3b75;
              5'h1a: normal_out = 16'h3b75;
              5'h1b: normal_out = 16'h3b75;
              5'h1c: normal_out = 16'h3b75;
              5'h1d: normal_out = 16'h3b75;
              5'h1e: normal_out = 16'h3b75;
              5'h1f: normal_out = 16'h3b75;
              default: begin end
            endcase
          end
          5'h14: begin
            normal_out = 16'h3b73;
            case (mant[4:0])
              5'h00: normal_out = 16'h3b75;
              5'h01: normal_out = 16'h3b75;
              5'h02: normal_out = 16'h3b75;
              5'h03: normal_out = 16'h3b75;
              5'h04: normal_out = 16'h3b74;
              5'h05: normal_out = 16'h3b74;
              5'h06: normal_out = 16'h3b74;
              5'h07: normal_out = 16'h3b74;
              5'h08: normal_out = 16'h3b74;
              5'h09: normal_out = 16'h3b74;
              5'h0a: normal_out = 16'h3b74;
              5'h0b: normal_out = 16'h3b74;
              5'h0c: normal_out = 16'h3b74;
              5'h0d: normal_out = 16'h3b74;
              5'h0e: normal_out = 16'h3b74;
              5'h0f: normal_out = 16'h3b74;
              5'h1d: normal_out = 16'h3b72;
              5'h1e: normal_out = 16'h3b72;
              5'h1f: normal_out = 16'h3b72;
              default: begin end
            endcase
          end
          5'h15: begin
            normal_out = 16'h3b71;
            case (mant[4:0])
              5'h00: normal_out = 16'h3b72;
              5'h01: normal_out = 16'h3b72;
              5'h02: normal_out = 16'h3b72;
              5'h03: normal_out = 16'h3b72;
              5'h04: normal_out = 16'h3b72;
              5'h05: normal_out = 16'h3b72;
              5'h06: normal_out = 16'h3b72;
              5'h07: normal_out = 16'h3b72;
              5'h08: normal_out = 16'h3b72;
              5'h16: normal_out = 16'h3b70;
              5'h17: normal_out = 16'h3b70;
              5'h18: normal_out = 16'h3b70;
              5'h19: normal_out = 16'h3b70;
              5'h1a: normal_out = 16'h3b70;
              5'h1b: normal_out = 16'h3b70;
              5'h1c: normal_out = 16'h3b70;
              5'h1d: normal_out = 16'h3b70;
              5'h1e: normal_out = 16'h3b70;
              5'h1f: normal_out = 16'h3b70;
              default: begin end
            endcase
          end
          5'h16: begin
            normal_out = 16'h3b6e;
            case (mant[4:0])
              5'h00: normal_out = 16'h3b70;
              5'h01: normal_out = 16'h3b70;
              5'h02: normal_out = 16'h3b6f;
              5'h03: normal_out = 16'h3b6f;
              5'h04: normal_out = 16'h3b6f;
              5'h05: normal_out = 16'h3b6f;
              5'h06: normal_out = 16'h3b6f;
              5'h07: normal_out = 16'h3b6f;
              5'h08: normal_out = 16'h3b6f;
              5'h09: normal_out = 16'h3b6f;
              5'h0a: normal_out = 16'h3b6f;
              5'h0b: normal_out = 16'h3b6f;
              5'h0c: normal_out = 16'h3b6f;
              5'h0d: normal_out = 16'h3b6f;
              5'h1b: normal_out = 16'h3b6d;
              5'h1c: normal_out = 16'h3b6d;
              5'h1d: normal_out = 16'h3b6d;
              5'h1e: normal_out = 16'h3b6d;
              5'h1f: normal_out = 16'h3b6d;
              default: begin end
            endcase
          end
          5'h17: begin
            normal_out = 16'h3b6c;
            case (mant[4:0])
              5'h00: normal_out = 16'h3b6d;
              5'h01: normal_out = 16'h3b6d;
              5'h02: normal_out = 16'h3b6d;
              5'h03: normal_out = 16'h3b6d;
              5'h04: normal_out = 16'h3b6d;
              5'h05: normal_out = 16'h3b6d;
              5'h06: normal_out = 16'h3b6d;
              5'h14: normal_out = 16'h3b6b;
              5'h15: normal_out = 16'h3b6b;
              5'h16: normal_out = 16'h3b6b;
              5'h17: normal_out = 16'h3b6b;
              5'h18: normal_out = 16'h3b6b;
              5'h19: normal_out = 16'h3b6b;
              5'h1a: normal_out = 16'h3b6b;
              5'h1b: normal_out = 16'h3b6b;
              5'h1c: normal_out = 16'h3b6b;
              5'h1d: normal_out = 16'h3b6b;
              5'h1e: normal_out = 16'h3b6b;
              5'h1f: normal_out = 16'h3b6b;
              default: begin end
            endcase
          end
          5'h18: begin
            normal_out = 16'h3b6a;
            case (mant[4:0])
              5'h0d: normal_out = 16'h3b69;
              5'h0e: normal_out = 16'h3b69;
              5'h0f: normal_out = 16'h3b69;
              5'h10: normal_out = 16'h3b69;
              5'h11: normal_out = 16'h3b69;
              5'h12: normal_out = 16'h3b69;
              5'h13: normal_out = 16'h3b69;
              5'h14: normal_out = 16'h3b69;
              5'h15: normal_out = 16'h3b69;
              5'h16: normal_out = 16'h3b69;
              5'h17: normal_out = 16'h3b69;
              5'h18: normal_out = 16'h3b69;
              5'h19: normal_out = 16'h3b68;
              5'h1a: normal_out = 16'h3b68;
              5'h1b: normal_out = 16'h3b68;
              5'h1c: normal_out = 16'h3b68;
              5'h1d: normal_out = 16'h3b68;
              5'h1e: normal_out = 16'h3b68;
              5'h1f: normal_out = 16'h3b68;
              default: begin end
            endcase
          end
          5'h19: begin
            normal_out = 16'h3b66;
            case (mant[4:0])
              5'h00: normal_out = 16'h3b68;
              5'h01: normal_out = 16'h3b68;
              5'h02: normal_out = 16'h3b68;
              5'h03: normal_out = 16'h3b68;
              5'h04: normal_out = 16'h3b68;
              5'h05: normal_out = 16'h3b68;
              5'h06: normal_out = 16'h3b67;
              5'h07: normal_out = 16'h3b67;
              5'h08: normal_out = 16'h3b67;
              5'h09: normal_out = 16'h3b67;
              5'h0a: normal_out = 16'h3b67;
              5'h0b: normal_out = 16'h3b67;
              5'h0c: normal_out = 16'h3b67;
              5'h0d: normal_out = 16'h3b67;
              5'h0e: normal_out = 16'h3b67;
              5'h0f: normal_out = 16'h3b67;
              5'h10: normal_out = 16'h3b67;
              5'h11: normal_out = 16'h3b67;
              5'h1f: normal_out = 16'h3b65;
              default: begin end
            endcase
          end
          5'h1a: begin
            normal_out = 16'h3b64;
            case (mant[4:0])
              5'h00: normal_out = 16'h3b65;
              5'h01: normal_out = 16'h3b65;
              5'h02: normal_out = 16'h3b65;
              5'h03: normal_out = 16'h3b65;
              5'h04: normal_out = 16'h3b65;
              5'h05: normal_out = 16'h3b65;
              5'h06: normal_out = 16'h3b65;
              5'h07: normal_out = 16'h3b65;
              5'h08: normal_out = 16'h3b65;
              5'h09: normal_out = 16'h3b65;
              5'h0a: normal_out = 16'h3b65;
              5'h17: normal_out = 16'h3b63;
              5'h18: normal_out = 16'h3b63;
              5'h19: normal_out = 16'h3b63;
              5'h1a: normal_out = 16'h3b63;
              5'h1b: normal_out = 16'h3b63;
              5'h1c: normal_out = 16'h3b63;
              5'h1d: normal_out = 16'h3b63;
              5'h1e: normal_out = 16'h3b63;
              5'h1f: normal_out = 16'h3b63;
              default: begin end
            endcase
          end
          5'h1b: begin
            normal_out = 16'h3b62;
            case (mant[4:0])
              5'h00: normal_out = 16'h3b63;
              5'h01: normal_out = 16'h3b63;
              5'h02: normal_out = 16'h3b63;
              5'h03: normal_out = 16'h3b63;
              5'h11: normal_out = 16'h3b61;
              5'h12: normal_out = 16'h3b61;
              5'h13: normal_out = 16'h3b61;
              5'h14: normal_out = 16'h3b61;
              5'h15: normal_out = 16'h3b61;
              5'h16: normal_out = 16'h3b61;
              5'h17: normal_out = 16'h3b61;
              5'h18: normal_out = 16'h3b61;
              5'h19: normal_out = 16'h3b61;
              5'h1a: normal_out = 16'h3b61;
              5'h1b: normal_out = 16'h3b61;
              5'h1c: normal_out = 16'h3b61;
              5'h1d: normal_out = 16'h3b60;
              5'h1e: normal_out = 16'h3b60;
              5'h1f: normal_out = 16'h3b60;
              default: begin end
            endcase
          end
          5'h1c: begin
            normal_out = 16'h3b5f;
            case (mant[4:0])
              5'h00: normal_out = 16'h3b60;
              5'h01: normal_out = 16'h3b60;
              5'h02: normal_out = 16'h3b60;
              5'h03: normal_out = 16'h3b60;
              5'h04: normal_out = 16'h3b60;
              5'h05: normal_out = 16'h3b60;
              5'h06: normal_out = 16'h3b60;
              5'h07: normal_out = 16'h3b60;
              5'h08: normal_out = 16'h3b60;
              5'h09: normal_out = 16'h3b60;
              5'h16: normal_out = 16'h3b5e;
              5'h17: normal_out = 16'h3b5e;
              5'h18: normal_out = 16'h3b5e;
              5'h19: normal_out = 16'h3b5e;
              5'h1a: normal_out = 16'h3b5e;
              5'h1b: normal_out = 16'h3b5e;
              5'h1c: normal_out = 16'h3b5e;
              5'h1d: normal_out = 16'h3b5e;
              5'h1e: normal_out = 16'h3b5e;
              5'h1f: normal_out = 16'h3b5e;
              default: begin end
            endcase
          end
          5'h1d: begin
            normal_out = 16'h3b5c;
            case (mant[4:0])
              5'h00: normal_out = 16'h3b5e;
              5'h01: normal_out = 16'h3b5e;
              5'h02: normal_out = 16'h3b5e;
              5'h03: normal_out = 16'h3b5d;
              5'h04: normal_out = 16'h3b5d;
              5'h05: normal_out = 16'h3b5d;
              5'h06: normal_out = 16'h3b5d;
              5'h07: normal_out = 16'h3b5d;
              5'h08: normal_out = 16'h3b5d;
              5'h09: normal_out = 16'h3b5d;
              5'h0a: normal_out = 16'h3b5d;
              5'h0b: normal_out = 16'h3b5d;
              5'h0c: normal_out = 16'h3b5d;
              5'h0d: normal_out = 16'h3b5d;
              5'h0e: normal_out = 16'h3b5d;
              5'h1c: normal_out = 16'h3b5b;
              5'h1d: normal_out = 16'h3b5b;
              5'h1e: normal_out = 16'h3b5b;
              5'h1f: normal_out = 16'h3b5b;
              default: begin end
            endcase
          end
          5'h1e: begin
            normal_out = 16'h3b5a;
            case (mant[4:0])
              5'h00: normal_out = 16'h3b5b;
              5'h01: normal_out = 16'h3b5b;
              5'h02: normal_out = 16'h3b5b;
              5'h03: normal_out = 16'h3b5b;
              5'h04: normal_out = 16'h3b5b;
              5'h05: normal_out = 16'h3b5b;
              5'h06: normal_out = 16'h3b5b;
              5'h07: normal_out = 16'h3b5b;
              5'h15: normal_out = 16'h3b59;
              5'h16: normal_out = 16'h3b59;
              5'h17: normal_out = 16'h3b59;
              5'h18: normal_out = 16'h3b59;
              5'h19: normal_out = 16'h3b59;
              5'h1a: normal_out = 16'h3b59;
              5'h1b: normal_out = 16'h3b59;
              5'h1c: normal_out = 16'h3b59;
              5'h1d: normal_out = 16'h3b59;
              5'h1e: normal_out = 16'h3b59;
              5'h1f: normal_out = 16'h3b59;
              default: begin end
            endcase
          end
          5'h1f: begin
            normal_out = 16'h3b57;
            case (mant[4:0])
              5'h00: normal_out = 16'h3b59;
              5'h01: normal_out = 16'h3b58;
              5'h02: normal_out = 16'h3b58;
              5'h03: normal_out = 16'h3b58;
              5'h04: normal_out = 16'h3b58;
              5'h05: normal_out = 16'h3b58;
              5'h06: normal_out = 16'h3b58;
              5'h07: normal_out = 16'h3b58;
              5'h08: normal_out = 16'h3b58;
              5'h09: normal_out = 16'h3b58;
              5'h0a: normal_out = 16'h3b58;
              5'h0b: normal_out = 16'h3b58;
              5'h0c: normal_out = 16'h3b58;
              5'h0d: normal_out = 16'h3b58;
              5'h1b: normal_out = 16'h3b56;
              5'h1c: normal_out = 16'h3b56;
              5'h1d: normal_out = 16'h3b56;
              5'h1e: normal_out = 16'h3b56;
              5'h1f: normal_out = 16'h3b56;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      6'h2c: begin
        case (mant[9:5])
          5'h00: begin
            normal_out = 16'h3b53;
            case (mant[4:0])
              5'h00: normal_out = 16'h3b56;
              5'h01: normal_out = 16'h3b56;
              5'h02: normal_out = 16'h3b56;
              5'h03: normal_out = 16'h3b56;
              5'h04: normal_out = 16'h3b55;
              5'h05: normal_out = 16'h3b55;
              5'h06: normal_out = 16'h3b55;
              5'h07: normal_out = 16'h3b55;
              5'h08: normal_out = 16'h3b55;
              5'h09: normal_out = 16'h3b55;
              5'h0a: normal_out = 16'h3b54;
              5'h0b: normal_out = 16'h3b54;
              5'h0c: normal_out = 16'h3b54;
              5'h0d: normal_out = 16'h3b54;
              5'h0e: normal_out = 16'h3b54;
              5'h0f: normal_out = 16'h3b54;
              5'h17: normal_out = 16'h3b52;
              5'h18: normal_out = 16'h3b52;
              5'h19: normal_out = 16'h3b52;
              5'h1a: normal_out = 16'h3b52;
              5'h1b: normal_out = 16'h3b52;
              5'h1c: normal_out = 16'h3b52;
              5'h1d: normal_out = 16'h3b51;
              5'h1e: normal_out = 16'h3b51;
              5'h1f: normal_out = 16'h3b51;
              default: begin end
            endcase
          end
          5'h01: begin
            normal_out = 16'h3b4d;
            case (mant[4:0])
              5'h00: normal_out = 16'h3b51;
              5'h01: normal_out = 16'h3b51;
              5'h02: normal_out = 16'h3b51;
              5'h03: normal_out = 16'h3b50;
              5'h04: normal_out = 16'h3b50;
              5'h05: normal_out = 16'h3b50;
              5'h06: normal_out = 16'h3b50;
              5'h07: normal_out = 16'h3b50;
              5'h08: normal_out = 16'h3b50;
              5'h09: normal_out = 16'h3b50;
              5'h0a: normal_out = 16'h3b4f;
              5'h0b: normal_out = 16'h3b4f;
              5'h0c: normal_out = 16'h3b4f;
              5'h0d: normal_out = 16'h3b4f;
              5'h0e: normal_out = 16'h3b4f;
              5'h0f: normal_out = 16'h3b4f;
              5'h10: normal_out = 16'h3b4e;
              5'h11: normal_out = 16'h3b4e;
              5'h12: normal_out = 16'h3b4e;
              5'h13: normal_out = 16'h3b4e;
              5'h14: normal_out = 16'h3b4e;
              5'h15: normal_out = 16'h3b4e;
              5'h1d: normal_out = 16'h3b4c;
              5'h1e: normal_out = 16'h3b4c;
              5'h1f: normal_out = 16'h3b4c;
              default: begin end
            endcase
          end
          5'h02: begin
            normal_out = 16'h3b4a;
            case (mant[4:0])
              5'h00: normal_out = 16'h3b4c;
              5'h01: normal_out = 16'h3b4c;
              5'h02: normal_out = 16'h3b4c;
              5'h03: normal_out = 16'h3b4b;
              5'h04: normal_out = 16'h3b4b;
              5'h05: normal_out = 16'h3b4b;
              5'h06: normal_out = 16'h3b4b;
              5'h07: normal_out = 16'h3b4b;
              5'h08: normal_out = 16'h3b4b;
              5'h10: normal_out = 16'h3b49;
              5'h11: normal_out = 16'h3b49;
              5'h12: normal_out = 16'h3b49;
              5'h13: normal_out = 16'h3b49;
              5'h14: normal_out = 16'h3b49;
              5'h15: normal_out = 16'h3b49;
              5'h16: normal_out = 16'h3b48;
              5'h17: normal_out = 16'h3b48;
              5'h18: normal_out = 16'h3b48;
              5'h19: normal_out = 16'h3b48;
              5'h1a: normal_out = 16'h3b48;
              5'h1b: normal_out = 16'h3b48;
              5'h1c: normal_out = 16'h3b47;
              5'h1d: normal_out = 16'h3b47;
              5'h1e: normal_out = 16'h3b47;
              5'h1f: normal_out = 16'h3b47;
              default: begin end
            endcase
          end
          5'h03: begin
            normal_out = 16'h3b44;
            case (mant[4:0])
              5'h00: normal_out = 16'h3b47;
              5'h01: normal_out = 16'h3b47;
              5'h02: normal_out = 16'h3b47;
              5'h03: normal_out = 16'h3b46;
              5'h04: normal_out = 16'h3b46;
              5'h05: normal_out = 16'h3b46;
              5'h06: normal_out = 16'h3b46;
              5'h07: normal_out = 16'h3b46;
              5'h08: normal_out = 16'h3b46;
              5'h09: normal_out = 16'h3b45;
              5'h0a: normal_out = 16'h3b45;
              5'h0b: normal_out = 16'h3b45;
              5'h0c: normal_out = 16'h3b45;
              5'h0d: normal_out = 16'h3b45;
              5'h0e: normal_out = 16'h3b45;
              5'h16: normal_out = 16'h3b43;
              5'h17: normal_out = 16'h3b43;
              5'h18: normal_out = 16'h3b43;
              5'h19: normal_out = 16'h3b43;
              5'h1a: normal_out = 16'h3b43;
              5'h1b: normal_out = 16'h3b43;
              5'h1c: normal_out = 16'h3b42;
              5'h1d: normal_out = 16'h3b42;
              5'h1e: normal_out = 16'h3b42;
              5'h1f: normal_out = 16'h3b42;
              default: begin end
            endcase
          end
          5'h04: begin
            normal_out = 16'h3b3e;
            case (mant[4:0])
              5'h00: normal_out = 16'h3b42;
              5'h01: normal_out = 16'h3b42;
              5'h02: normal_out = 16'h3b41;
              5'h03: normal_out = 16'h3b41;
              5'h04: normal_out = 16'h3b41;
              5'h05: normal_out = 16'h3b41;
              5'h06: normal_out = 16'h3b41;
              5'h07: normal_out = 16'h3b41;
              5'h08: normal_out = 16'h3b41;
              5'h09: normal_out = 16'h3b40;
              5'h0a: normal_out = 16'h3b40;
              5'h0b: normal_out = 16'h3b40;
              5'h0c: normal_out = 16'h3b40;
              5'h0d: normal_out = 16'h3b40;
              5'h0e: normal_out = 16'h3b40;
              5'h0f: normal_out = 16'h3b3f;
              5'h10: normal_out = 16'h3b3f;
              5'h11: normal_out = 16'h3b3f;
              5'h12: normal_out = 16'h3b3f;
              5'h13: normal_out = 16'h3b3f;
              5'h14: normal_out = 16'h3b3f;
              5'h1c: normal_out = 16'h3b3d;
              5'h1d: normal_out = 16'h3b3d;
              5'h1e: normal_out = 16'h3b3d;
              5'h1f: normal_out = 16'h3b3d;
              default: begin end
            endcase
          end
          5'h05: begin
            normal_out = 16'h3b39;
            case (mant[4:0])
              5'h00: normal_out = 16'h3b3d;
              5'h01: normal_out = 16'h3b3d;
              5'h02: normal_out = 16'h3b3c;
              5'h03: normal_out = 16'h3b3c;
              5'h04: normal_out = 16'h3b3c;
              5'h05: normal_out = 16'h3b3c;
              5'h06: normal_out = 16'h3b3c;
              5'h07: normal_out = 16'h3b3c;
              5'h08: normal_out = 16'h3b3c;
              5'h09: normal_out = 16'h3b3b;
              5'h0a: normal_out = 16'h3b3b;
              5'h0b: normal_out = 16'h3b3b;
              5'h0c: normal_out = 16'h3b3b;
              5'h0d: normal_out = 16'h3b3b;
              5'h0e: normal_out = 16'h3b3b;
              5'h0f: normal_out = 16'h3b3a;
              5'h10: normal_out = 16'h3b3a;
              5'h11: normal_out = 16'h3b3a;
              5'h12: normal_out = 16'h3b3a;
              5'h13: normal_out = 16'h3b3a;
              5'h14: normal_out = 16'h3b3a;
              5'h1c: normal_out = 16'h3b38;
              5'h1d: normal_out = 16'h3b38;
              5'h1e: normal_out = 16'h3b38;
              5'h1f: normal_out = 16'h3b38;
              default: begin end
            endcase
          end
          5'h06: begin
            normal_out = 16'h3b34;
            case (mant[4:0])
              5'h00: normal_out = 16'h3b38;
              5'h01: normal_out = 16'h3b38;
              5'h02: normal_out = 16'h3b37;
              5'h03: normal_out = 16'h3b37;
              5'h04: normal_out = 16'h3b37;
              5'h05: normal_out = 16'h3b37;
              5'h06: normal_out = 16'h3b37;
              5'h07: normal_out = 16'h3b37;
              5'h08: normal_out = 16'h3b37;
              5'h09: normal_out = 16'h3b36;
              5'h0a: normal_out = 16'h3b36;
              5'h0b: normal_out = 16'h3b36;
              5'h0c: normal_out = 16'h3b36;
              5'h0d: normal_out = 16'h3b36;
              5'h0e: normal_out = 16'h3b36;
              5'h0f: normal_out = 16'h3b35;
              5'h10: normal_out = 16'h3b35;
              5'h11: normal_out = 16'h3b35;
              5'h12: normal_out = 16'h3b35;
              5'h13: normal_out = 16'h3b35;
              5'h14: normal_out = 16'h3b35;
              5'h1c: normal_out = 16'h3b33;
              5'h1d: normal_out = 16'h3b33;
              5'h1e: normal_out = 16'h3b33;
              5'h1f: normal_out = 16'h3b33;
              default: begin end
            endcase
          end
          5'h07: begin
            normal_out = 16'h3b2f;
            case (mant[4:0])
              5'h00: normal_out = 16'h3b33;
              5'h01: normal_out = 16'h3b33;
              5'h02: normal_out = 16'h3b32;
              5'h03: normal_out = 16'h3b32;
              5'h04: normal_out = 16'h3b32;
              5'h05: normal_out = 16'h3b32;
              5'h06: normal_out = 16'h3b32;
              5'h07: normal_out = 16'h3b32;
              5'h08: normal_out = 16'h3b32;
              5'h09: normal_out = 16'h3b31;
              5'h0a: normal_out = 16'h3b31;
              5'h0b: normal_out = 16'h3b31;
              5'h0c: normal_out = 16'h3b31;
              5'h0d: normal_out = 16'h3b31;
              5'h0e: normal_out = 16'h3b31;
              5'h0f: normal_out = 16'h3b30;
              5'h10: normal_out = 16'h3b30;
              5'h11: normal_out = 16'h3b30;
              5'h12: normal_out = 16'h3b30;
              5'h13: normal_out = 16'h3b30;
              5'h14: normal_out = 16'h3b30;
              5'h1c: normal_out = 16'h3b2e;
              5'h1d: normal_out = 16'h3b2e;
              5'h1e: normal_out = 16'h3b2e;
              5'h1f: normal_out = 16'h3b2e;
              default: begin end
            endcase
          end
          5'h08: begin
            normal_out = 16'h3b2b;
            case (mant[4:0])
              5'h00: normal_out = 16'h3b2e;
              5'h01: normal_out = 16'h3b2e;
              5'h02: normal_out = 16'h3b2d;
              5'h03: normal_out = 16'h3b2d;
              5'h04: normal_out = 16'h3b2d;
              5'h05: normal_out = 16'h3b2d;
              5'h06: normal_out = 16'h3b2d;
              5'h07: normal_out = 16'h3b2d;
              5'h08: normal_out = 16'h3b2d;
              5'h09: normal_out = 16'h3b2c;
              5'h0a: normal_out = 16'h3b2c;
              5'h0b: normal_out = 16'h3b2c;
              5'h0c: normal_out = 16'h3b2c;
              5'h0d: normal_out = 16'h3b2c;
              5'h0e: normal_out = 16'h3b2c;
              5'h16: normal_out = 16'h3b2a;
              5'h17: normal_out = 16'h3b2a;
              5'h18: normal_out = 16'h3b2a;
              5'h19: normal_out = 16'h3b2a;
              5'h1a: normal_out = 16'h3b2a;
              5'h1b: normal_out = 16'h3b2a;
              5'h1c: normal_out = 16'h3b29;
              5'h1d: normal_out = 16'h3b29;
              5'h1e: normal_out = 16'h3b29;
              5'h1f: normal_out = 16'h3b29;
              default: begin end
            endcase
          end
          5'h09: begin
            normal_out = 16'h3b26;
            case (mant[4:0])
              5'h00: normal_out = 16'h3b29;
              5'h01: normal_out = 16'h3b29;
              5'h02: normal_out = 16'h3b29;
              5'h03: normal_out = 16'h3b28;
              5'h04: normal_out = 16'h3b28;
              5'h05: normal_out = 16'h3b28;
              5'h06: normal_out = 16'h3b28;
              5'h07: normal_out = 16'h3b28;
              5'h08: normal_out = 16'h3b28;
              5'h09: normal_out = 16'h3b27;
              5'h0a: normal_out = 16'h3b27;
              5'h0b: normal_out = 16'h3b27;
              5'h0c: normal_out = 16'h3b27;
              5'h0d: normal_out = 16'h3b27;
              5'h0e: normal_out = 16'h3b27;
              5'h16: normal_out = 16'h3b25;
              5'h17: normal_out = 16'h3b25;
              5'h18: normal_out = 16'h3b25;
              5'h19: normal_out = 16'h3b25;
              5'h1a: normal_out = 16'h3b25;
              5'h1b: normal_out = 16'h3b25;
              5'h1c: normal_out = 16'h3b24;
              5'h1d: normal_out = 16'h3b24;
              5'h1e: normal_out = 16'h3b24;
              5'h1f: normal_out = 16'h3b24;
              default: begin end
            endcase
          end
          5'h0a: begin
            normal_out = 16'h3b20;
            case (mant[4:0])
              5'h00: normal_out = 16'h3b24;
              5'h01: normal_out = 16'h3b24;
              5'h02: normal_out = 16'h3b24;
              5'h03: normal_out = 16'h3b23;
              5'h04: normal_out = 16'h3b23;
              5'h05: normal_out = 16'h3b23;
              5'h06: normal_out = 16'h3b23;
              5'h07: normal_out = 16'h3b23;
              5'h08: normal_out = 16'h3b23;
              5'h09: normal_out = 16'h3b22;
              5'h0a: normal_out = 16'h3b22;
              5'h0b: normal_out = 16'h3b22;
              5'h0c: normal_out = 16'h3b22;
              5'h0d: normal_out = 16'h3b22;
              5'h0e: normal_out = 16'h3b22;
              5'h0f: normal_out = 16'h3b22;
              5'h10: normal_out = 16'h3b21;
              5'h11: normal_out = 16'h3b21;
              5'h12: normal_out = 16'h3b21;
              5'h13: normal_out = 16'h3b21;
              5'h14: normal_out = 16'h3b21;
              5'h15: normal_out = 16'h3b21;
              5'h1d: normal_out = 16'h3b1f;
              5'h1e: normal_out = 16'h3b1f;
              5'h1f: normal_out = 16'h3b1f;
              default: begin end
            endcase
          end
          5'h0b: begin
            normal_out = 16'h3b1c;
            case (mant[4:0])
              5'h00: normal_out = 16'h3b1f;
              5'h01: normal_out = 16'h3b1f;
              5'h02: normal_out = 16'h3b1f;
              5'h03: normal_out = 16'h3b1e;
              5'h04: normal_out = 16'h3b1e;
              5'h05: normal_out = 16'h3b1e;
              5'h06: normal_out = 16'h3b1e;
              5'h07: normal_out = 16'h3b1e;
              5'h08: normal_out = 16'h3b1e;
              5'h09: normal_out = 16'h3b1e;
              5'h0a: normal_out = 16'h3b1d;
              5'h0b: normal_out = 16'h3b1d;
              5'h0c: normal_out = 16'h3b1d;
              5'h0d: normal_out = 16'h3b1d;
              5'h0e: normal_out = 16'h3b1d;
              5'h0f: normal_out = 16'h3b1d;
              5'h17: normal_out = 16'h3b1b;
              5'h18: normal_out = 16'h3b1b;
              5'h19: normal_out = 16'h3b1b;
              5'h1a: normal_out = 16'h3b1b;
              5'h1b: normal_out = 16'h3b1b;
              5'h1c: normal_out = 16'h3b1b;
              5'h1d: normal_out = 16'h3b1a;
              5'h1e: normal_out = 16'h3b1a;
              5'h1f: normal_out = 16'h3b1a;
              default: begin end
            endcase
          end
          5'h0c: begin
            normal_out = 16'h3b16;
            case (mant[4:0])
              5'h00: normal_out = 16'h3b1a;
              5'h01: normal_out = 16'h3b1a;
              5'h02: normal_out = 16'h3b1a;
              5'h03: normal_out = 16'h3b1a;
              5'h04: normal_out = 16'h3b19;
              5'h05: normal_out = 16'h3b19;
              5'h06: normal_out = 16'h3b19;
              5'h07: normal_out = 16'h3b19;
              5'h08: normal_out = 16'h3b19;
              5'h09: normal_out = 16'h3b19;
              5'h0a: normal_out = 16'h3b18;
              5'h0b: normal_out = 16'h3b18;
              5'h0c: normal_out = 16'h3b18;
              5'h0d: normal_out = 16'h3b18;
              5'h0e: normal_out = 16'h3b18;
              5'h0f: normal_out = 16'h3b18;
              5'h10: normal_out = 16'h3b18;
              5'h11: normal_out = 16'h3b17;
              5'h12: normal_out = 16'h3b17;
              5'h13: normal_out = 16'h3b17;
              5'h14: normal_out = 16'h3b17;
              5'h15: normal_out = 16'h3b17;
              5'h16: normal_out = 16'h3b17;
              5'h1e: normal_out = 16'h3b15;
              5'h1f: normal_out = 16'h3b15;
              default: begin end
            endcase
          end
          5'h0d: begin
            normal_out = 16'h3b12;
            case (mant[4:0])
              5'h00: normal_out = 16'h3b15;
              5'h01: normal_out = 16'h3b15;
              5'h02: normal_out = 16'h3b15;
              5'h03: normal_out = 16'h3b15;
              5'h04: normal_out = 16'h3b14;
              5'h05: normal_out = 16'h3b14;
              5'h06: normal_out = 16'h3b14;
              5'h07: normal_out = 16'h3b14;
              5'h08: normal_out = 16'h3b14;
              5'h09: normal_out = 16'h3b14;
              5'h0a: normal_out = 16'h3b14;
              5'h0b: normal_out = 16'h3b13;
              5'h0c: normal_out = 16'h3b13;
              5'h0d: normal_out = 16'h3b13;
              5'h0e: normal_out = 16'h3b13;
              5'h0f: normal_out = 16'h3b13;
              5'h10: normal_out = 16'h3b13;
              5'h18: normal_out = 16'h3b11;
              5'h19: normal_out = 16'h3b11;
              5'h1a: normal_out = 16'h3b11;
              5'h1b: normal_out = 16'h3b11;
              5'h1c: normal_out = 16'h3b11;
              5'h1d: normal_out = 16'h3b11;
              5'h1e: normal_out = 16'h3b10;
              5'h1f: normal_out = 16'h3b10;
              default: begin end
            endcase
          end
          5'h0e: begin
            normal_out = 16'h3b0c;
            case (mant[4:0])
              5'h00: normal_out = 16'h3b10;
              5'h01: normal_out = 16'h3b10;
              5'h02: normal_out = 16'h3b10;
              5'h03: normal_out = 16'h3b10;
              5'h04: normal_out = 16'h3b10;
              5'h05: normal_out = 16'h3b0f;
              5'h06: normal_out = 16'h3b0f;
              5'h07: normal_out = 16'h3b0f;
              5'h08: normal_out = 16'h3b0f;
              5'h09: normal_out = 16'h3b0f;
              5'h0a: normal_out = 16'h3b0f;
              5'h0b: normal_out = 16'h3b0e;
              5'h0c: normal_out = 16'h3b0e;
              5'h0d: normal_out = 16'h3b0e;
              5'h0e: normal_out = 16'h3b0e;
              5'h0f: normal_out = 16'h3b0e;
              5'h10: normal_out = 16'h3b0e;
              5'h11: normal_out = 16'h3b0e;
              5'h12: normal_out = 16'h3b0d;
              5'h13: normal_out = 16'h3b0d;
              5'h14: normal_out = 16'h3b0d;
              5'h15: normal_out = 16'h3b0d;
              5'h16: normal_out = 16'h3b0d;
              5'h17: normal_out = 16'h3b0d;
              5'h1f: normal_out = 16'h3b0b;
              default: begin end
            endcase
          end
          5'h0f: begin
            normal_out = 16'h3b07;
            case (mant[4:0])
              5'h00: normal_out = 16'h3b0b;
              5'h01: normal_out = 16'h3b0b;
              5'h02: normal_out = 16'h3b0b;
              5'h03: normal_out = 16'h3b0b;
              5'h04: normal_out = 16'h3b0b;
              5'h05: normal_out = 16'h3b0b;
              5'h06: normal_out = 16'h3b0a;
              5'h07: normal_out = 16'h3b0a;
              5'h08: normal_out = 16'h3b0a;
              5'h09: normal_out = 16'h3b0a;
              5'h0a: normal_out = 16'h3b0a;
              5'h0b: normal_out = 16'h3b0a;
              5'h0c: normal_out = 16'h3b09;
              5'h0d: normal_out = 16'h3b09;
              5'h0e: normal_out = 16'h3b09;
              5'h0f: normal_out = 16'h3b09;
              5'h10: normal_out = 16'h3b09;
              5'h11: normal_out = 16'h3b09;
              5'h12: normal_out = 16'h3b09;
              5'h13: normal_out = 16'h3b08;
              5'h14: normal_out = 16'h3b08;
              5'h15: normal_out = 16'h3b08;
              5'h16: normal_out = 16'h3b08;
              5'h17: normal_out = 16'h3b08;
              5'h18: normal_out = 16'h3b08;
              default: begin end
            endcase
          end
          5'h10: begin
            normal_out = 16'h3b04;
            case (mant[4:0])
              5'h00: normal_out = 16'h3b06;
              5'h01: normal_out = 16'h3b06;
              5'h02: normal_out = 16'h3b06;
              5'h03: normal_out = 16'h3b06;
              5'h04: normal_out = 16'h3b06;
              5'h05: normal_out = 16'h3b06;
              5'h06: normal_out = 16'h3b05;
              5'h07: normal_out = 16'h3b05;
              5'h08: normal_out = 16'h3b05;
              5'h09: normal_out = 16'h3b05;
              5'h0a: normal_out = 16'h3b05;
              5'h0b: normal_out = 16'h3b05;
              5'h0c: normal_out = 16'h3b05;
              5'h14: normal_out = 16'h3b03;
              5'h15: normal_out = 16'h3b03;
              5'h16: normal_out = 16'h3b03;
              5'h17: normal_out = 16'h3b03;
              5'h18: normal_out = 16'h3b03;
              5'h19: normal_out = 16'h3b03;
              5'h1a: normal_out = 16'h3b02;
              5'h1b: normal_out = 16'h3b02;
              5'h1c: normal_out = 16'h3b02;
              5'h1d: normal_out = 16'h3b02;
              5'h1e: normal_out = 16'h3b02;
              5'h1f: normal_out = 16'h3b02;
              default: begin end
            endcase
          end
          5'h11: begin
            normal_out = 16'h3aff;
            case (mant[4:0])
              5'h00: normal_out = 16'h3b02;
              5'h01: normal_out = 16'h3b01;
              5'h02: normal_out = 16'h3b01;
              5'h03: normal_out = 16'h3b01;
              5'h04: normal_out = 16'h3b01;
              5'h05: normal_out = 16'h3b01;
              5'h06: normal_out = 16'h3b01;
              5'h07: normal_out = 16'h3b00;
              5'h08: normal_out = 16'h3b00;
              5'h09: normal_out = 16'h3b00;
              5'h0a: normal_out = 16'h3b00;
              5'h0b: normal_out = 16'h3b00;
              5'h0c: normal_out = 16'h3b00;
              5'h0d: normal_out = 16'h3b00;
              5'h15: normal_out = 16'h3afe;
              5'h16: normal_out = 16'h3afe;
              5'h17: normal_out = 16'h3afe;
              5'h18: normal_out = 16'h3afe;
              5'h19: normal_out = 16'h3afe;
              5'h1a: normal_out = 16'h3afe;
              5'h1b: normal_out = 16'h3afd;
              5'h1c: normal_out = 16'h3afd;
              5'h1d: normal_out = 16'h3afd;
              5'h1e: normal_out = 16'h3afd;
              5'h1f: normal_out = 16'h3afd;
              default: begin end
            endcase
          end
          5'h12: begin
            normal_out = 16'h3afa;
            case (mant[4:0])
              5'h00: normal_out = 16'h3afd;
              5'h01: normal_out = 16'h3afd;
              5'h02: normal_out = 16'h3afc;
              5'h03: normal_out = 16'h3afc;
              5'h04: normal_out = 16'h3afc;
              5'h05: normal_out = 16'h3afc;
              5'h06: normal_out = 16'h3afc;
              5'h07: normal_out = 16'h3afc;
              5'h08: normal_out = 16'h3afb;
              5'h09: normal_out = 16'h3afb;
              5'h0a: normal_out = 16'h3afb;
              5'h0b: normal_out = 16'h3afb;
              5'h0c: normal_out = 16'h3afb;
              5'h0d: normal_out = 16'h3afb;
              5'h0e: normal_out = 16'h3afb;
              5'h16: normal_out = 16'h3af9;
              5'h17: normal_out = 16'h3af9;
              5'h18: normal_out = 16'h3af9;
              5'h19: normal_out = 16'h3af9;
              5'h1a: normal_out = 16'h3af9;
              5'h1b: normal_out = 16'h3af9;
              5'h1c: normal_out = 16'h3af8;
              5'h1d: normal_out = 16'h3af8;
              5'h1e: normal_out = 16'h3af8;
              5'h1f: normal_out = 16'h3af8;
              default: begin end
            endcase
          end
          5'h13: begin
            normal_out = 16'h3af5;
            case (mant[4:0])
              5'h00: normal_out = 16'h3af8;
              5'h01: normal_out = 16'h3af8;
              5'h02: normal_out = 16'h3af8;
              5'h03: normal_out = 16'h3af7;
              5'h04: normal_out = 16'h3af7;
              5'h05: normal_out = 16'h3af7;
              5'h06: normal_out = 16'h3af7;
              5'h07: normal_out = 16'h3af7;
              5'h08: normal_out = 16'h3af7;
              5'h09: normal_out = 16'h3af6;
              5'h0a: normal_out = 16'h3af6;
              5'h0b: normal_out = 16'h3af6;
              5'h0c: normal_out = 16'h3af6;
              5'h0d: normal_out = 16'h3af6;
              5'h0e: normal_out = 16'h3af6;
              5'h0f: normal_out = 16'h3af6;
              5'h17: normal_out = 16'h3af4;
              5'h18: normal_out = 16'h3af4;
              5'h19: normal_out = 16'h3af4;
              5'h1a: normal_out = 16'h3af4;
              5'h1b: normal_out = 16'h3af4;
              5'h1c: normal_out = 16'h3af4;
              5'h1d: normal_out = 16'h3af3;
              5'h1e: normal_out = 16'h3af3;
              5'h1f: normal_out = 16'h3af3;
              default: begin end
            endcase
          end
          5'h14: begin
            normal_out = 16'h3aef;
            case (mant[4:0])
              5'h00: normal_out = 16'h3af3;
              5'h01: normal_out = 16'h3af3;
              5'h02: normal_out = 16'h3af3;
              5'h03: normal_out = 16'h3af3;
              5'h04: normal_out = 16'h3af2;
              5'h05: normal_out = 16'h3af2;
              5'h06: normal_out = 16'h3af2;
              5'h07: normal_out = 16'h3af2;
              5'h08: normal_out = 16'h3af2;
              5'h09: normal_out = 16'h3af2;
              5'h0a: normal_out = 16'h3af2;
              5'h0b: normal_out = 16'h3af1;
              5'h0c: normal_out = 16'h3af1;
              5'h0d: normal_out = 16'h3af1;
              5'h0e: normal_out = 16'h3af1;
              5'h0f: normal_out = 16'h3af1;
              5'h10: normal_out = 16'h3af1;
              5'h11: normal_out = 16'h3af0;
              5'h12: normal_out = 16'h3af0;
              5'h13: normal_out = 16'h3af0;
              5'h14: normal_out = 16'h3af0;
              5'h15: normal_out = 16'h3af0;
              5'h16: normal_out = 16'h3af0;
              5'h17: normal_out = 16'h3af0;
              5'h1f: normal_out = 16'h3aee;
              default: begin end
            endcase
          end
          5'h15: begin
            normal_out = 16'h3aea;
            case (mant[4:0])
              5'h00: normal_out = 16'h3aee;
              5'h01: normal_out = 16'h3aee;
              5'h02: normal_out = 16'h3aee;
              5'h03: normal_out = 16'h3aee;
              5'h04: normal_out = 16'h3aee;
              5'h05: normal_out = 16'h3aed;
              5'h06: normal_out = 16'h3aed;
              5'h07: normal_out = 16'h3aed;
              5'h08: normal_out = 16'h3aed;
              5'h09: normal_out = 16'h3aed;
              5'h0a: normal_out = 16'h3aed;
              5'h0b: normal_out = 16'h3aed;
              5'h0c: normal_out = 16'h3aec;
              5'h0d: normal_out = 16'h3aec;
              5'h0e: normal_out = 16'h3aec;
              5'h0f: normal_out = 16'h3aec;
              5'h10: normal_out = 16'h3aec;
              5'h11: normal_out = 16'h3aec;
              5'h12: normal_out = 16'h3aec;
              5'h13: normal_out = 16'h3aeb;
              5'h14: normal_out = 16'h3aeb;
              5'h15: normal_out = 16'h3aeb;
              5'h16: normal_out = 16'h3aeb;
              5'h17: normal_out = 16'h3aeb;
              5'h18: normal_out = 16'h3aeb;
              default: begin end
            endcase
          end
          5'h16: begin
            normal_out = 16'h3ae6;
            case (mant[4:0])
              5'h00: normal_out = 16'h3ae9;
              5'h01: normal_out = 16'h3ae9;
              5'h02: normal_out = 16'h3ae9;
              5'h03: normal_out = 16'h3ae9;
              5'h04: normal_out = 16'h3ae9;
              5'h05: normal_out = 16'h3ae9;
              5'h06: normal_out = 16'h3ae9;
              5'h07: normal_out = 16'h3ae8;
              5'h08: normal_out = 16'h3ae8;
              5'h09: normal_out = 16'h3ae8;
              5'h0a: normal_out = 16'h3ae8;
              5'h0b: normal_out = 16'h3ae8;
              5'h0c: normal_out = 16'h3ae8;
              5'h0d: normal_out = 16'h3ae7;
              5'h0e: normal_out = 16'h3ae7;
              5'h0f: normal_out = 16'h3ae7;
              5'h10: normal_out = 16'h3ae7;
              5'h11: normal_out = 16'h3ae7;
              5'h12: normal_out = 16'h3ae7;
              5'h13: normal_out = 16'h3ae7;
              5'h1b: normal_out = 16'h3ae5;
              5'h1c: normal_out = 16'h3ae5;
              5'h1d: normal_out = 16'h3ae5;
              5'h1e: normal_out = 16'h3ae5;
              5'h1f: normal_out = 16'h3ae5;
              default: begin end
            endcase
          end
          5'h17: begin
            normal_out = 16'h3ae2;
            case (mant[4:0])
              5'h00: normal_out = 16'h3ae5;
              5'h01: normal_out = 16'h3ae4;
              5'h02: normal_out = 16'h3ae4;
              5'h03: normal_out = 16'h3ae4;
              5'h04: normal_out = 16'h3ae4;
              5'h05: normal_out = 16'h3ae4;
              5'h06: normal_out = 16'h3ae4;
              5'h07: normal_out = 16'h3ae4;
              5'h08: normal_out = 16'h3ae3;
              5'h09: normal_out = 16'h3ae3;
              5'h0a: normal_out = 16'h3ae3;
              5'h0b: normal_out = 16'h3ae3;
              5'h0c: normal_out = 16'h3ae3;
              5'h0d: normal_out = 16'h3ae3;
              5'h0e: normal_out = 16'h3ae3;
              5'h16: normal_out = 16'h3ae1;
              5'h17: normal_out = 16'h3ae1;
              5'h18: normal_out = 16'h3ae1;
              5'h19: normal_out = 16'h3ae1;
              5'h1a: normal_out = 16'h3ae1;
              5'h1b: normal_out = 16'h3ae1;
              5'h1c: normal_out = 16'h3ae0;
              5'h1d: normal_out = 16'h3ae0;
              5'h1e: normal_out = 16'h3ae0;
              5'h1f: normal_out = 16'h3ae0;
              default: begin end
            endcase
          end
          5'h18: begin
            normal_out = 16'h3adc;
            case (mant[4:0])
              5'h00: normal_out = 16'h3ae0;
              5'h01: normal_out = 16'h3ae0;
              5'h02: normal_out = 16'h3ae0;
              5'h03: normal_out = 16'h3adf;
              5'h04: normal_out = 16'h3adf;
              5'h05: normal_out = 16'h3adf;
              5'h06: normal_out = 16'h3adf;
              5'h07: normal_out = 16'h3adf;
              5'h08: normal_out = 16'h3adf;
              5'h09: normal_out = 16'h3adf;
              5'h0a: normal_out = 16'h3ade;
              5'h0b: normal_out = 16'h3ade;
              5'h0c: normal_out = 16'h3ade;
              5'h0d: normal_out = 16'h3ade;
              5'h0e: normal_out = 16'h3ade;
              5'h0f: normal_out = 16'h3ade;
              5'h10: normal_out = 16'h3add;
              5'h11: normal_out = 16'h3add;
              5'h12: normal_out = 16'h3add;
              5'h13: normal_out = 16'h3add;
              5'h14: normal_out = 16'h3add;
              5'h15: normal_out = 16'h3add;
              5'h16: normal_out = 16'h3add;
              5'h1e: normal_out = 16'h3adb;
              5'h1f: normal_out = 16'h3adb;
              default: begin end
            endcase
          end
          5'h19: begin
            normal_out = 16'h3ad7;
            case (mant[4:0])
              5'h00: normal_out = 16'h3adb;
              5'h01: normal_out = 16'h3adb;
              5'h02: normal_out = 16'h3adb;
              5'h03: normal_out = 16'h3adb;
              5'h04: normal_out = 16'h3adb;
              5'h05: normal_out = 16'h3ada;
              5'h06: normal_out = 16'h3ada;
              5'h07: normal_out = 16'h3ada;
              5'h08: normal_out = 16'h3ada;
              5'h09: normal_out = 16'h3ada;
              5'h0a: normal_out = 16'h3ada;
              5'h0b: normal_out = 16'h3ad9;
              5'h0c: normal_out = 16'h3ad9;
              5'h0d: normal_out = 16'h3ad9;
              5'h0e: normal_out = 16'h3ad9;
              5'h0f: normal_out = 16'h3ad9;
              5'h10: normal_out = 16'h3ad9;
              5'h11: normal_out = 16'h3ad9;
              5'h12: normal_out = 16'h3ad8;
              5'h13: normal_out = 16'h3ad8;
              5'h14: normal_out = 16'h3ad8;
              5'h15: normal_out = 16'h3ad8;
              5'h16: normal_out = 16'h3ad8;
              5'h17: normal_out = 16'h3ad8;
              5'h18: normal_out = 16'h3ad8;
              default: begin end
            endcase
          end
          5'h1a: begin
            normal_out = 16'h3ad3;
            case (mant[4:0])
              5'h00: normal_out = 16'h3ad6;
              5'h01: normal_out = 16'h3ad6;
              5'h02: normal_out = 16'h3ad6;
              5'h03: normal_out = 16'h3ad6;
              5'h04: normal_out = 16'h3ad6;
              5'h05: normal_out = 16'h3ad6;
              5'h06: normal_out = 16'h3ad5;
              5'h07: normal_out = 16'h3ad5;
              5'h08: normal_out = 16'h3ad5;
              5'h09: normal_out = 16'h3ad5;
              5'h0a: normal_out = 16'h3ad5;
              5'h0b: normal_out = 16'h3ad5;
              5'h0c: normal_out = 16'h3ad5;
              5'h0d: normal_out = 16'h3ad4;
              5'h0e: normal_out = 16'h3ad4;
              5'h0f: normal_out = 16'h3ad4;
              5'h10: normal_out = 16'h3ad4;
              5'h11: normal_out = 16'h3ad4;
              5'h12: normal_out = 16'h3ad4;
              5'h13: normal_out = 16'h3ad4;
              5'h1b: normal_out = 16'h3ad2;
              5'h1c: normal_out = 16'h3ad2;
              5'h1d: normal_out = 16'h3ad2;
              5'h1e: normal_out = 16'h3ad2;
              5'h1f: normal_out = 16'h3ad2;
              default: begin end
            endcase
          end
          5'h1b: begin
            normal_out = 16'h3acf;
            case (mant[4:0])
              5'h00: normal_out = 16'h3ad2;
              5'h01: normal_out = 16'h3ad1;
              5'h02: normal_out = 16'h3ad1;
              5'h03: normal_out = 16'h3ad1;
              5'h04: normal_out = 16'h3ad1;
              5'h05: normal_out = 16'h3ad1;
              5'h06: normal_out = 16'h3ad1;
              5'h07: normal_out = 16'h3ad1;
              5'h08: normal_out = 16'h3ad0;
              5'h09: normal_out = 16'h3ad0;
              5'h0a: normal_out = 16'h3ad0;
              5'h0b: normal_out = 16'h3ad0;
              5'h0c: normal_out = 16'h3ad0;
              5'h0d: normal_out = 16'h3ad0;
              5'h0e: normal_out = 16'h3ad0;
              5'h16: normal_out = 16'h3ace;
              5'h17: normal_out = 16'h3ace;
              5'h18: normal_out = 16'h3ace;
              5'h19: normal_out = 16'h3ace;
              5'h1a: normal_out = 16'h3ace;
              5'h1b: normal_out = 16'h3ace;
              5'h1c: normal_out = 16'h3acd;
              5'h1d: normal_out = 16'h3acd;
              5'h1e: normal_out = 16'h3acd;
              5'h1f: normal_out = 16'h3acd;
              default: begin end
            endcase
          end
          5'h1c: begin
            normal_out = 16'h3aca;
            case (mant[4:0])
              5'h00: normal_out = 16'h3acd;
              5'h01: normal_out = 16'h3acd;
              5'h02: normal_out = 16'h3acd;
              5'h03: normal_out = 16'h3acc;
              5'h04: normal_out = 16'h3acc;
              5'h05: normal_out = 16'h3acc;
              5'h06: normal_out = 16'h3acc;
              5'h07: normal_out = 16'h3acc;
              5'h08: normal_out = 16'h3acc;
              5'h09: normal_out = 16'h3acc;
              5'h0a: normal_out = 16'h3acb;
              5'h0b: normal_out = 16'h3acb;
              5'h0c: normal_out = 16'h3acb;
              5'h0d: normal_out = 16'h3acb;
              5'h0e: normal_out = 16'h3acb;
              5'h0f: normal_out = 16'h3acb;
              5'h10: normal_out = 16'h3acb;
              5'h18: normal_out = 16'h3ac9;
              5'h19: normal_out = 16'h3ac9;
              5'h1a: normal_out = 16'h3ac9;
              5'h1b: normal_out = 16'h3ac9;
              5'h1c: normal_out = 16'h3ac9;
              5'h1d: normal_out = 16'h3ac9;
              5'h1e: normal_out = 16'h3ac8;
              5'h1f: normal_out = 16'h3ac8;
              default: begin end
            endcase
          end
          5'h1d: begin
            normal_out = 16'h3ac5;
            case (mant[4:0])
              5'h00: normal_out = 16'h3ac8;
              5'h01: normal_out = 16'h3ac8;
              5'h02: normal_out = 16'h3ac8;
              5'h03: normal_out = 16'h3ac8;
              5'h04: normal_out = 16'h3ac8;
              5'h05: normal_out = 16'h3ac7;
              5'h06: normal_out = 16'h3ac7;
              5'h07: normal_out = 16'h3ac7;
              5'h08: normal_out = 16'h3ac7;
              5'h09: normal_out = 16'h3ac7;
              5'h0a: normal_out = 16'h3ac7;
              5'h0b: normal_out = 16'h3ac7;
              5'h0c: normal_out = 16'h3ac6;
              5'h0d: normal_out = 16'h3ac6;
              5'h0e: normal_out = 16'h3ac6;
              5'h0f: normal_out = 16'h3ac6;
              5'h10: normal_out = 16'h3ac6;
              5'h11: normal_out = 16'h3ac6;
              5'h12: normal_out = 16'h3ac6;
              5'h1a: normal_out = 16'h3ac4;
              5'h1b: normal_out = 16'h3ac4;
              5'h1c: normal_out = 16'h3ac4;
              5'h1d: normal_out = 16'h3ac4;
              5'h1e: normal_out = 16'h3ac4;
              5'h1f: normal_out = 16'h3ac4;
              default: begin end
            endcase
          end
          5'h1e: begin
            normal_out = 16'h3ac0;
            case (mant[4:0])
              5'h00: normal_out = 16'h3ac4;
              5'h01: normal_out = 16'h3ac3;
              5'h02: normal_out = 16'h3ac3;
              5'h03: normal_out = 16'h3ac3;
              5'h04: normal_out = 16'h3ac3;
              5'h05: normal_out = 16'h3ac3;
              5'h06: normal_out = 16'h3ac3;
              5'h07: normal_out = 16'h3ac2;
              5'h08: normal_out = 16'h3ac2;
              5'h09: normal_out = 16'h3ac2;
              5'h0a: normal_out = 16'h3ac2;
              5'h0b: normal_out = 16'h3ac2;
              5'h0c: normal_out = 16'h3ac2;
              5'h0d: normal_out = 16'h3ac2;
              5'h0e: normal_out = 16'h3ac1;
              5'h0f: normal_out = 16'h3ac1;
              5'h10: normal_out = 16'h3ac1;
              5'h11: normal_out = 16'h3ac1;
              5'h12: normal_out = 16'h3ac1;
              5'h13: normal_out = 16'h3ac1;
              5'h14: normal_out = 16'h3ac1;
              5'h1c: normal_out = 16'h3abf;
              5'h1d: normal_out = 16'h3abf;
              5'h1e: normal_out = 16'h3abf;
              5'h1f: normal_out = 16'h3abf;
              default: begin end
            endcase
          end
          5'h1f: begin
            normal_out = 16'h3abb;
            case (mant[4:0])
              5'h00: normal_out = 16'h3abf;
              5'h01: normal_out = 16'h3abf;
              5'h02: normal_out = 16'h3abf;
              5'h03: normal_out = 16'h3abe;
              5'h04: normal_out = 16'h3abe;
              5'h05: normal_out = 16'h3abe;
              5'h06: normal_out = 16'h3abe;
              5'h07: normal_out = 16'h3abe;
              5'h08: normal_out = 16'h3abe;
              5'h09: normal_out = 16'h3abe;
              5'h0a: normal_out = 16'h3abd;
              5'h0b: normal_out = 16'h3abd;
              5'h0c: normal_out = 16'h3abd;
              5'h0d: normal_out = 16'h3abd;
              5'h0e: normal_out = 16'h3abd;
              5'h0f: normal_out = 16'h3abd;
              5'h10: normal_out = 16'h3abc;
              5'h11: normal_out = 16'h3abc;
              5'h12: normal_out = 16'h3abc;
              5'h13: normal_out = 16'h3abc;
              5'h14: normal_out = 16'h3abc;
              5'h15: normal_out = 16'h3abc;
              5'h16: normal_out = 16'h3abc;
              5'h1e: normal_out = 16'h3aba;
              5'h1f: normal_out = 16'h3aba;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      6'h2d: begin
        case (mant[9:5])
          5'h00: begin
            normal_out = 16'h3ab3;
            case (mant[4:0])
              5'h00: normal_out = 16'h3aba;
              5'h01: normal_out = 16'h3aba;
              5'h02: normal_out = 16'h3aba;
              5'h03: normal_out = 16'h3ab9;
              5'h04: normal_out = 16'h3ab9;
              5'h05: normal_out = 16'h3ab9;
              5'h06: normal_out = 16'h3ab8;
              5'h07: normal_out = 16'h3ab8;
              5'h08: normal_out = 16'h3ab8;
              5'h09: normal_out = 16'h3ab8;
              5'h0a: normal_out = 16'h3ab7;
              5'h0b: normal_out = 16'h3ab7;
              5'h0c: normal_out = 16'h3ab7;
              5'h0d: normal_out = 16'h3ab6;
              5'h0e: normal_out = 16'h3ab6;
              5'h0f: normal_out = 16'h3ab6;
              5'h10: normal_out = 16'h3ab5;
              5'h11: normal_out = 16'h3ab5;
              5'h12: normal_out = 16'h3ab5;
              5'h13: normal_out = 16'h3ab5;
              5'h14: normal_out = 16'h3ab4;
              5'h15: normal_out = 16'h3ab4;
              5'h16: normal_out = 16'h3ab4;
              5'h1b: normal_out = 16'h3ab2;
              5'h1c: normal_out = 16'h3ab2;
              5'h1d: normal_out = 16'h3ab2;
              5'h1e: normal_out = 16'h3ab1;
              5'h1f: normal_out = 16'h3ab1;
              default: begin end
            endcase
          end
          5'h01: begin
            normal_out = 16'h3aaa;
            case (mant[4:0])
              5'h00: normal_out = 16'h3ab1;
              5'h01: normal_out = 16'h3ab1;
              5'h02: normal_out = 16'h3ab0;
              5'h03: normal_out = 16'h3ab0;
              5'h04: normal_out = 16'h3ab0;
              5'h05: normal_out = 16'h3aaf;
              5'h06: normal_out = 16'h3aaf;
              5'h07: normal_out = 16'h3aaf;
              5'h08: normal_out = 16'h3aaf;
              5'h09: normal_out = 16'h3aae;
              5'h0a: normal_out = 16'h3aae;
              5'h0b: normal_out = 16'h3aae;
              5'h0c: normal_out = 16'h3aad;
              5'h0d: normal_out = 16'h3aad;
              5'h0e: normal_out = 16'h3aad;
              5'h0f: normal_out = 16'h3aad;
              5'h10: normal_out = 16'h3aac;
              5'h11: normal_out = 16'h3aac;
              5'h12: normal_out = 16'h3aac;
              5'h13: normal_out = 16'h3aab;
              5'h14: normal_out = 16'h3aab;
              5'h15: normal_out = 16'h3aab;
              5'h1a: normal_out = 16'h3aa9;
              5'h1b: normal_out = 16'h3aa9;
              5'h1c: normal_out = 16'h3aa9;
              5'h1d: normal_out = 16'h3aa8;
              5'h1e: normal_out = 16'h3aa8;
              5'h1f: normal_out = 16'h3aa8;
              default: begin end
            endcase
          end
          5'h02: begin
            normal_out = 16'h3aa0;
            case (mant[4:0])
              5'h00: normal_out = 16'h3aa8;
              5'h01: normal_out = 16'h3aa7;
              5'h02: normal_out = 16'h3aa7;
              5'h03: normal_out = 16'h3aa7;
              5'h04: normal_out = 16'h3aa6;
              5'h05: normal_out = 16'h3aa6;
              5'h06: normal_out = 16'h3aa6;
              5'h07: normal_out = 16'h3aa6;
              5'h08: normal_out = 16'h3aa5;
              5'h09: normal_out = 16'h3aa5;
              5'h0a: normal_out = 16'h3aa5;
              5'h0b: normal_out = 16'h3aa4;
              5'h0c: normal_out = 16'h3aa4;
              5'h0d: normal_out = 16'h3aa4;
              5'h0e: normal_out = 16'h3aa4;
              5'h0f: normal_out = 16'h3aa3;
              5'h10: normal_out = 16'h3aa3;
              5'h11: normal_out = 16'h3aa3;
              5'h12: normal_out = 16'h3aa2;
              5'h13: normal_out = 16'h3aa2;
              5'h14: normal_out = 16'h3aa2;
              5'h15: normal_out = 16'h3aa2;
              5'h16: normal_out = 16'h3aa1;
              5'h17: normal_out = 16'h3aa1;
              5'h18: normal_out = 16'h3aa1;
              5'h1d: normal_out = 16'h3a9f;
              5'h1e: normal_out = 16'h3a9f;
              5'h1f: normal_out = 16'h3a9f;
              default: begin end
            endcase
          end
          5'h03: begin
            normal_out = 16'h3a96;
            case (mant[4:0])
              5'h00: normal_out = 16'h3a9e;
              5'h01: normal_out = 16'h3a9e;
              5'h02: normal_out = 16'h3a9e;
              5'h03: normal_out = 16'h3a9e;
              5'h04: normal_out = 16'h3a9d;
              5'h05: normal_out = 16'h3a9d;
              5'h06: normal_out = 16'h3a9d;
              5'h07: normal_out = 16'h3a9c;
              5'h08: normal_out = 16'h3a9c;
              5'h09: normal_out = 16'h3a9c;
              5'h0a: normal_out = 16'h3a9c;
              5'h0b: normal_out = 16'h3a9b;
              5'h0c: normal_out = 16'h3a9b;
              5'h0d: normal_out = 16'h3a9b;
              5'h0e: normal_out = 16'h3a9a;
              5'h0f: normal_out = 16'h3a9a;
              5'h10: normal_out = 16'h3a9a;
              5'h11: normal_out = 16'h3a9a;
              5'h12: normal_out = 16'h3a99;
              5'h13: normal_out = 16'h3a99;
              5'h14: normal_out = 16'h3a99;
              5'h15: normal_out = 16'h3a98;
              5'h16: normal_out = 16'h3a98;
              5'h17: normal_out = 16'h3a98;
              5'h18: normal_out = 16'h3a98;
              5'h19: normal_out = 16'h3a97;
              5'h1a: normal_out = 16'h3a97;
              5'h1b: normal_out = 16'h3a97;
              default: begin end
            endcase
          end
          5'h04: begin
            normal_out = 16'h3a8e;
            case (mant[4:0])
              5'h00: normal_out = 16'h3a95;
              5'h01: normal_out = 16'h3a95;
              5'h02: normal_out = 16'h3a95;
              5'h03: normal_out = 16'h3a94;
              5'h04: normal_out = 16'h3a94;
              5'h05: normal_out = 16'h3a94;
              5'h06: normal_out = 16'h3a94;
              5'h07: normal_out = 16'h3a93;
              5'h08: normal_out = 16'h3a93;
              5'h09: normal_out = 16'h3a93;
              5'h0a: normal_out = 16'h3a92;
              5'h0b: normal_out = 16'h3a92;
              5'h0c: normal_out = 16'h3a92;
              5'h0d: normal_out = 16'h3a92;
              5'h0e: normal_out = 16'h3a91;
              5'h0f: normal_out = 16'h3a91;
              5'h10: normal_out = 16'h3a91;
              5'h11: normal_out = 16'h3a90;
              5'h12: normal_out = 16'h3a90;
              5'h13: normal_out = 16'h3a90;
              5'h14: normal_out = 16'h3a90;
              5'h15: normal_out = 16'h3a8f;
              5'h16: normal_out = 16'h3a8f;
              5'h17: normal_out = 16'h3a8f;
              5'h1c: normal_out = 16'h3a8d;
              5'h1d: normal_out = 16'h3a8d;
              5'h1e: normal_out = 16'h3a8d;
              5'h1f: normal_out = 16'h3a8c;
              default: begin end
            endcase
          end
          5'h05: begin
            normal_out = 16'h3a85;
            case (mant[4:0])
              5'h00: normal_out = 16'h3a8c;
              5'h01: normal_out = 16'h3a8c;
              5'h02: normal_out = 16'h3a8c;
              5'h03: normal_out = 16'h3a8b;
              5'h04: normal_out = 16'h3a8b;
              5'h05: normal_out = 16'h3a8b;
              5'h06: normal_out = 16'h3a8a;
              5'h07: normal_out = 16'h3a8a;
              5'h08: normal_out = 16'h3a8a;
              5'h09: normal_out = 16'h3a8a;
              5'h0a: normal_out = 16'h3a89;
              5'h0b: normal_out = 16'h3a89;
              5'h0c: normal_out = 16'h3a89;
              5'h0d: normal_out = 16'h3a88;
              5'h0e: normal_out = 16'h3a88;
              5'h0f: normal_out = 16'h3a88;
              5'h10: normal_out = 16'h3a88;
              5'h11: normal_out = 16'h3a87;
              5'h12: normal_out = 16'h3a87;
              5'h13: normal_out = 16'h3a87;
              5'h14: normal_out = 16'h3a86;
              5'h15: normal_out = 16'h3a86;
              5'h16: normal_out = 16'h3a86;
              5'h17: normal_out = 16'h3a86;
              5'h1c: normal_out = 16'h3a84;
              5'h1d: normal_out = 16'h3a84;
              5'h1e: normal_out = 16'h3a84;
              5'h1f: normal_out = 16'h3a83;
              default: begin end
            endcase
          end
          5'h06: begin
            normal_out = 16'h3a7c;
            case (mant[4:0])
              5'h00: normal_out = 16'h3a83;
              5'h01: normal_out = 16'h3a83;
              5'h02: normal_out = 16'h3a83;
              5'h03: normal_out = 16'h3a82;
              5'h04: normal_out = 16'h3a82;
              5'h05: normal_out = 16'h3a82;
              5'h06: normal_out = 16'h3a81;
              5'h07: normal_out = 16'h3a81;
              5'h08: normal_out = 16'h3a81;
              5'h09: normal_out = 16'h3a81;
              5'h0a: normal_out = 16'h3a80;
              5'h0b: normal_out = 16'h3a80;
              5'h0c: normal_out = 16'h3a80;
              5'h0d: normal_out = 16'h3a7f;
              5'h0e: normal_out = 16'h3a7f;
              5'h0f: normal_out = 16'h3a7f;
              5'h10: normal_out = 16'h3a7f;
              5'h11: normal_out = 16'h3a7e;
              5'h12: normal_out = 16'h3a7e;
              5'h13: normal_out = 16'h3a7e;
              5'h14: normal_out = 16'h3a7d;
              5'h15: normal_out = 16'h3a7d;
              5'h16: normal_out = 16'h3a7d;
              5'h17: normal_out = 16'h3a7d;
              5'h1c: normal_out = 16'h3a7b;
              5'h1d: normal_out = 16'h3a7b;
              5'h1e: normal_out = 16'h3a7b;
              5'h1f: normal_out = 16'h3a7a;
              default: begin end
            endcase
          end
          5'h07: begin
            normal_out = 16'h3a73;
            case (mant[4:0])
              5'h00: normal_out = 16'h3a7a;
              5'h01: normal_out = 16'h3a7a;
              5'h02: normal_out = 16'h3a7a;
              5'h03: normal_out = 16'h3a79;
              5'h04: normal_out = 16'h3a79;
              5'h05: normal_out = 16'h3a79;
              5'h06: normal_out = 16'h3a78;
              5'h07: normal_out = 16'h3a78;
              5'h08: normal_out = 16'h3a78;
              5'h09: normal_out = 16'h3a78;
              5'h0a: normal_out = 16'h3a77;
              5'h0b: normal_out = 16'h3a77;
              5'h0c: normal_out = 16'h3a77;
              5'h0d: normal_out = 16'h3a76;
              5'h0e: normal_out = 16'h3a76;
              5'h0f: normal_out = 16'h3a76;
              5'h10: normal_out = 16'h3a76;
              5'h11: normal_out = 16'h3a75;
              5'h12: normal_out = 16'h3a75;
              5'h13: normal_out = 16'h3a75;
              5'h14: normal_out = 16'h3a74;
              5'h15: normal_out = 16'h3a74;
              5'h16: normal_out = 16'h3a74;
              5'h17: normal_out = 16'h3a74;
              5'h1c: normal_out = 16'h3a72;
              5'h1d: normal_out = 16'h3a72;
              5'h1e: normal_out = 16'h3a72;
              5'h1f: normal_out = 16'h3a71;
              default: begin end
            endcase
          end
          5'h08: begin
            normal_out = 16'h3a69;
            case (mant[4:0])
              5'h00: normal_out = 16'h3a71;
              5'h01: normal_out = 16'h3a71;
              5'h02: normal_out = 16'h3a71;
              5'h03: normal_out = 16'h3a70;
              5'h04: normal_out = 16'h3a70;
              5'h05: normal_out = 16'h3a70;
              5'h06: normal_out = 16'h3a6f;
              5'h07: normal_out = 16'h3a6f;
              5'h08: normal_out = 16'h3a6f;
              5'h09: normal_out = 16'h3a6f;
              5'h0a: normal_out = 16'h3a6e;
              5'h0b: normal_out = 16'h3a6e;
              5'h0c: normal_out = 16'h3a6e;
              5'h0d: normal_out = 16'h3a6e;
              5'h0e: normal_out = 16'h3a6d;
              5'h0f: normal_out = 16'h3a6d;
              5'h10: normal_out = 16'h3a6d;
              5'h11: normal_out = 16'h3a6c;
              5'h12: normal_out = 16'h3a6c;
              5'h13: normal_out = 16'h3a6c;
              5'h14: normal_out = 16'h3a6c;
              5'h15: normal_out = 16'h3a6b;
              5'h16: normal_out = 16'h3a6b;
              5'h17: normal_out = 16'h3a6b;
              5'h18: normal_out = 16'h3a6a;
              5'h19: normal_out = 16'h3a6a;
              5'h1a: normal_out = 16'h3a6a;
              5'h1b: normal_out = 16'h3a6a;
              default: begin end
            endcase
          end
          5'h09: begin
            normal_out = 16'h3a60;
            case (mant[4:0])
              5'h00: normal_out = 16'h3a68;
              5'h01: normal_out = 16'h3a68;
              5'h02: normal_out = 16'h3a68;
              5'h03: normal_out = 16'h3a67;
              5'h04: normal_out = 16'h3a67;
              5'h05: normal_out = 16'h3a67;
              5'h06: normal_out = 16'h3a67;
              5'h07: normal_out = 16'h3a66;
              5'h08: normal_out = 16'h3a66;
              5'h09: normal_out = 16'h3a66;
              5'h0a: normal_out = 16'h3a65;
              5'h0b: normal_out = 16'h3a65;
              5'h0c: normal_out = 16'h3a65;
              5'h0d: normal_out = 16'h3a65;
              5'h0e: normal_out = 16'h3a64;
              5'h0f: normal_out = 16'h3a64;
              5'h10: normal_out = 16'h3a64;
              5'h11: normal_out = 16'h3a64;
              5'h12: normal_out = 16'h3a63;
              5'h13: normal_out = 16'h3a63;
              5'h14: normal_out = 16'h3a63;
              5'h15: normal_out = 16'h3a62;
              5'h16: normal_out = 16'h3a62;
              5'h17: normal_out = 16'h3a62;
              5'h18: normal_out = 16'h3a62;
              5'h19: normal_out = 16'h3a61;
              5'h1a: normal_out = 16'h3a61;
              5'h1b: normal_out = 16'h3a61;
              default: begin end
            endcase
          end
          5'h0a: begin
            normal_out = 16'h3a58;
            case (mant[4:0])
              5'h00: normal_out = 16'h3a5f;
              5'h01: normal_out = 16'h3a5f;
              5'h02: normal_out = 16'h3a5f;
              5'h03: normal_out = 16'h3a5f;
              5'h04: normal_out = 16'h3a5e;
              5'h05: normal_out = 16'h3a5e;
              5'h06: normal_out = 16'h3a5e;
              5'h07: normal_out = 16'h3a5d;
              5'h08: normal_out = 16'h3a5d;
              5'h09: normal_out = 16'h3a5d;
              5'h0a: normal_out = 16'h3a5d;
              5'h0b: normal_out = 16'h3a5c;
              5'h0c: normal_out = 16'h3a5c;
              5'h0d: normal_out = 16'h3a5c;
              5'h0e: normal_out = 16'h3a5c;
              5'h0f: normal_out = 16'h3a5b;
              5'h10: normal_out = 16'h3a5b;
              5'h11: normal_out = 16'h3a5b;
              5'h12: normal_out = 16'h3a5a;
              5'h13: normal_out = 16'h3a5a;
              5'h14: normal_out = 16'h3a5a;
              5'h15: normal_out = 16'h3a5a;
              5'h16: normal_out = 16'h3a59;
              5'h17: normal_out = 16'h3a59;
              5'h18: normal_out = 16'h3a59;
              5'h1d: normal_out = 16'h3a57;
              5'h1e: normal_out = 16'h3a57;
              5'h1f: normal_out = 16'h3a57;
              default: begin end
            endcase
          end
          5'h0b: begin
            normal_out = 16'h3a4f;
            case (mant[4:0])
              5'h00: normal_out = 16'h3a57;
              5'h01: normal_out = 16'h3a56;
              5'h02: normal_out = 16'h3a56;
              5'h03: normal_out = 16'h3a56;
              5'h04: normal_out = 16'h3a55;
              5'h05: normal_out = 16'h3a55;
              5'h06: normal_out = 16'h3a55;
              5'h07: normal_out = 16'h3a55;
              5'h08: normal_out = 16'h3a54;
              5'h09: normal_out = 16'h3a54;
              5'h0a: normal_out = 16'h3a54;
              5'h0b: normal_out = 16'h3a54;
              5'h0c: normal_out = 16'h3a53;
              5'h0d: normal_out = 16'h3a53;
              5'h0e: normal_out = 16'h3a53;
              5'h0f: normal_out = 16'h3a52;
              5'h10: normal_out = 16'h3a52;
              5'h11: normal_out = 16'h3a52;
              5'h12: normal_out = 16'h3a52;
              5'h13: normal_out = 16'h3a51;
              5'h14: normal_out = 16'h3a51;
              5'h15: normal_out = 16'h3a51;
              5'h16: normal_out = 16'h3a51;
              5'h17: normal_out = 16'h3a50;
              5'h18: normal_out = 16'h3a50;
              5'h19: normal_out = 16'h3a50;
              5'h1e: normal_out = 16'h3a4e;
              5'h1f: normal_out = 16'h3a4e;
              default: begin end
            endcase
          end
          5'h0c: begin
            normal_out = 16'h3a46;
            case (mant[4:0])
              5'h00: normal_out = 16'h3a4e;
              5'h01: normal_out = 16'h3a4e;
              5'h02: normal_out = 16'h3a4d;
              5'h03: normal_out = 16'h3a4d;
              5'h04: normal_out = 16'h3a4d;
              5'h05: normal_out = 16'h3a4c;
              5'h06: normal_out = 16'h3a4c;
              5'h07: normal_out = 16'h3a4c;
              5'h08: normal_out = 16'h3a4c;
              5'h09: normal_out = 16'h3a4b;
              5'h0a: normal_out = 16'h3a4b;
              5'h0b: normal_out = 16'h3a4b;
              5'h0c: normal_out = 16'h3a4b;
              5'h0d: normal_out = 16'h3a4a;
              5'h0e: normal_out = 16'h3a4a;
              5'h0f: normal_out = 16'h3a4a;
              5'h10: normal_out = 16'h3a49;
              5'h11: normal_out = 16'h3a49;
              5'h12: normal_out = 16'h3a49;
              5'h13: normal_out = 16'h3a49;
              5'h14: normal_out = 16'h3a48;
              5'h15: normal_out = 16'h3a48;
              5'h16: normal_out = 16'h3a48;
              5'h17: normal_out = 16'h3a48;
              5'h18: normal_out = 16'h3a47;
              5'h19: normal_out = 16'h3a47;
              5'h1a: normal_out = 16'h3a47;
              5'h1f: normal_out = 16'h3a45;
              default: begin end
            endcase
          end
          5'h0d: begin
            normal_out = 16'h3a3e;
            case (mant[4:0])
              5'h00: normal_out = 16'h3a45;
              5'h01: normal_out = 16'h3a45;
              5'h02: normal_out = 16'h3a45;
              5'h03: normal_out = 16'h3a44;
              5'h04: normal_out = 16'h3a44;
              5'h05: normal_out = 16'h3a44;
              5'h06: normal_out = 16'h3a43;
              5'h07: normal_out = 16'h3a43;
              5'h08: normal_out = 16'h3a43;
              5'h09: normal_out = 16'h3a43;
              5'h0a: normal_out = 16'h3a42;
              5'h0b: normal_out = 16'h3a42;
              5'h0c: normal_out = 16'h3a42;
              5'h0d: normal_out = 16'h3a42;
              5'h0e: normal_out = 16'h3a41;
              5'h0f: normal_out = 16'h3a41;
              5'h10: normal_out = 16'h3a41;
              5'h11: normal_out = 16'h3a40;
              5'h12: normal_out = 16'h3a40;
              5'h13: normal_out = 16'h3a40;
              5'h14: normal_out = 16'h3a40;
              5'h15: normal_out = 16'h3a3f;
              5'h16: normal_out = 16'h3a3f;
              5'h17: normal_out = 16'h3a3f;
              5'h18: normal_out = 16'h3a3f;
              5'h1d: normal_out = 16'h3a3d;
              5'h1e: normal_out = 16'h3a3d;
              5'h1f: normal_out = 16'h3a3d;
              default: begin end
            endcase
          end
          5'h0e: begin
            normal_out = 16'h3a35;
            case (mant[4:0])
              5'h00: normal_out = 16'h3a3c;
              5'h01: normal_out = 16'h3a3c;
              5'h02: normal_out = 16'h3a3c;
              5'h03: normal_out = 16'h3a3c;
              5'h04: normal_out = 16'h3a3b;
              5'h05: normal_out = 16'h3a3b;
              5'h06: normal_out = 16'h3a3b;
              5'h07: normal_out = 16'h3a3b;
              5'h08: normal_out = 16'h3a3a;
              5'h09: normal_out = 16'h3a3a;
              5'h0a: normal_out = 16'h3a3a;
              5'h0b: normal_out = 16'h3a39;
              5'h0c: normal_out = 16'h3a39;
              5'h0d: normal_out = 16'h3a39;
              5'h0e: normal_out = 16'h3a39;
              5'h0f: normal_out = 16'h3a38;
              5'h10: normal_out = 16'h3a38;
              5'h11: normal_out = 16'h3a38;
              5'h12: normal_out = 16'h3a38;
              5'h13: normal_out = 16'h3a37;
              5'h14: normal_out = 16'h3a37;
              5'h15: normal_out = 16'h3a37;
              5'h16: normal_out = 16'h3a36;
              5'h17: normal_out = 16'h3a36;
              5'h18: normal_out = 16'h3a36;
              5'h19: normal_out = 16'h3a36;
              5'h1e: normal_out = 16'h3a34;
              5'h1f: normal_out = 16'h3a34;
              default: begin end
            endcase
          end
          5'h0f: begin
            normal_out = 16'h3a2d;
            case (mant[4:0])
              5'h00: normal_out = 16'h3a34;
              5'h01: normal_out = 16'h3a34;
              5'h02: normal_out = 16'h3a33;
              5'h03: normal_out = 16'h3a33;
              5'h04: normal_out = 16'h3a33;
              5'h05: normal_out = 16'h3a32;
              5'h06: normal_out = 16'h3a32;
              5'h07: normal_out = 16'h3a32;
              5'h08: normal_out = 16'h3a32;
              5'h09: normal_out = 16'h3a31;
              5'h0a: normal_out = 16'h3a31;
              5'h0b: normal_out = 16'h3a31;
              5'h0c: normal_out = 16'h3a31;
              5'h0d: normal_out = 16'h3a30;
              5'h0e: normal_out = 16'h3a30;
              5'h0f: normal_out = 16'h3a30;
              5'h10: normal_out = 16'h3a30;
              5'h11: normal_out = 16'h3a2f;
              5'h12: normal_out = 16'h3a2f;
              5'h13: normal_out = 16'h3a2f;
              5'h14: normal_out = 16'h3a2e;
              5'h15: normal_out = 16'h3a2e;
              5'h16: normal_out = 16'h3a2e;
              5'h17: normal_out = 16'h3a2e;
              5'h1c: normal_out = 16'h3a2c;
              5'h1d: normal_out = 16'h3a2c;
              5'h1e: normal_out = 16'h3a2c;
              5'h1f: normal_out = 16'h3a2b;
              default: begin end
            endcase
          end
          5'h10: begin
            normal_out = 16'h3a25;
            case (mant[4:0])
              5'h00: normal_out = 16'h3a2b;
              5'h01: normal_out = 16'h3a2b;
              5'h02: normal_out = 16'h3a2b;
              5'h03: normal_out = 16'h3a2a;
              5'h04: normal_out = 16'h3a2a;
              5'h05: normal_out = 16'h3a2a;
              5'h06: normal_out = 16'h3a2a;
              5'h07: normal_out = 16'h3a29;
              5'h08: normal_out = 16'h3a29;
              5'h09: normal_out = 16'h3a29;
              5'h0a: normal_out = 16'h3a29;
              5'h0b: normal_out = 16'h3a28;
              5'h0c: normal_out = 16'h3a28;
              5'h0d: normal_out = 16'h3a28;
              5'h0e: normal_out = 16'h3a27;
              5'h0f: normal_out = 16'h3a27;
              5'h10: normal_out = 16'h3a27;
              5'h11: normal_out = 16'h3a27;
              5'h12: normal_out = 16'h3a26;
              5'h13: normal_out = 16'h3a26;
              5'h14: normal_out = 16'h3a26;
              5'h15: normal_out = 16'h3a26;
              5'h1a: normal_out = 16'h3a24;
              5'h1b: normal_out = 16'h3a24;
              5'h1c: normal_out = 16'h3a24;
              5'h1d: normal_out = 16'h3a23;
              5'h1e: normal_out = 16'h3a23;
              5'h1f: normal_out = 16'h3a23;
              default: begin end
            endcase
          end
          5'h11: begin
            normal_out = 16'h3a1c;
            case (mant[4:0])
              5'h00: normal_out = 16'h3a23;
              5'h01: normal_out = 16'h3a22;
              5'h02: normal_out = 16'h3a22;
              5'h03: normal_out = 16'h3a22;
              5'h04: normal_out = 16'h3a22;
              5'h05: normal_out = 16'h3a21;
              5'h06: normal_out = 16'h3a21;
              5'h07: normal_out = 16'h3a21;
              5'h08: normal_out = 16'h3a21;
              5'h09: normal_out = 16'h3a20;
              5'h0a: normal_out = 16'h3a20;
              5'h0b: normal_out = 16'h3a20;
              5'h0c: normal_out = 16'h3a20;
              5'h0d: normal_out = 16'h3a1f;
              5'h0e: normal_out = 16'h3a1f;
              5'h0f: normal_out = 16'h3a1f;
              5'h10: normal_out = 16'h3a1e;
              5'h11: normal_out = 16'h3a1e;
              5'h12: normal_out = 16'h3a1e;
              5'h13: normal_out = 16'h3a1e;
              5'h14: normal_out = 16'h3a1d;
              5'h15: normal_out = 16'h3a1d;
              5'h16: normal_out = 16'h3a1d;
              5'h17: normal_out = 16'h3a1d;
              5'h1c: normal_out = 16'h3a1b;
              5'h1d: normal_out = 16'h3a1b;
              5'h1e: normal_out = 16'h3a1b;
              5'h1f: normal_out = 16'h3a1a;
              default: begin end
            endcase
          end
          5'h12: begin
            normal_out = 16'h3a13;
            case (mant[4:0])
              5'h00: normal_out = 16'h3a1a;
              5'h01: normal_out = 16'h3a1a;
              5'h02: normal_out = 16'h3a1a;
              5'h03: normal_out = 16'h3a19;
              5'h04: normal_out = 16'h3a19;
              5'h05: normal_out = 16'h3a19;
              5'h06: normal_out = 16'h3a19;
              5'h07: normal_out = 16'h3a18;
              5'h08: normal_out = 16'h3a18;
              5'h09: normal_out = 16'h3a18;
              5'h0a: normal_out = 16'h3a18;
              5'h0b: normal_out = 16'h3a17;
              5'h0c: normal_out = 16'h3a17;
              5'h0d: normal_out = 16'h3a17;
              5'h0e: normal_out = 16'h3a17;
              5'h0f: normal_out = 16'h3a16;
              5'h10: normal_out = 16'h3a16;
              5'h11: normal_out = 16'h3a16;
              5'h12: normal_out = 16'h3a15;
              5'h13: normal_out = 16'h3a15;
              5'h14: normal_out = 16'h3a15;
              5'h15: normal_out = 16'h3a15;
              5'h16: normal_out = 16'h3a14;
              5'h17: normal_out = 16'h3a14;
              5'h18: normal_out = 16'h3a14;
              5'h19: normal_out = 16'h3a14;
              5'h1e: normal_out = 16'h3a12;
              5'h1f: normal_out = 16'h3a12;
              default: begin end
            endcase
          end
          5'h13: begin
            normal_out = 16'h3a0a;
            case (mant[4:0])
              5'h00: normal_out = 16'h3a12;
              5'h01: normal_out = 16'h3a12;
              5'h02: normal_out = 16'h3a11;
              5'h03: normal_out = 16'h3a11;
              5'h04: normal_out = 16'h3a11;
              5'h05: normal_out = 16'h3a10;
              5'h06: normal_out = 16'h3a10;
              5'h07: normal_out = 16'h3a10;
              5'h08: normal_out = 16'h3a10;
              5'h09: normal_out = 16'h3a0f;
              5'h0a: normal_out = 16'h3a0f;
              5'h0b: normal_out = 16'h3a0f;
              5'h0c: normal_out = 16'h3a0f;
              5'h0d: normal_out = 16'h3a0e;
              5'h0e: normal_out = 16'h3a0e;
              5'h0f: normal_out = 16'h3a0e;
              5'h10: normal_out = 16'h3a0e;
              5'h11: normal_out = 16'h3a0d;
              5'h12: normal_out = 16'h3a0d;
              5'h13: normal_out = 16'h3a0d;
              5'h14: normal_out = 16'h3a0d;
              5'h15: normal_out = 16'h3a0c;
              5'h16: normal_out = 16'h3a0c;
              5'h17: normal_out = 16'h3a0c;
              5'h18: normal_out = 16'h3a0b;
              5'h19: normal_out = 16'h3a0b;
              5'h1a: normal_out = 16'h3a0b;
              5'h1b: normal_out = 16'h3a0b;
              default: begin end
            endcase
          end
          5'h14: begin
            normal_out = 16'h3a02;
            case (mant[4:0])
              5'h00: normal_out = 16'h3a09;
              5'h01: normal_out = 16'h3a09;
              5'h02: normal_out = 16'h3a09;
              5'h03: normal_out = 16'h3a09;
              5'h04: normal_out = 16'h3a08;
              5'h05: normal_out = 16'h3a08;
              5'h06: normal_out = 16'h3a08;
              5'h07: normal_out = 16'h3a08;
              5'h08: normal_out = 16'h3a07;
              5'h09: normal_out = 16'h3a07;
              5'h0a: normal_out = 16'h3a07;
              5'h0b: normal_out = 16'h3a07;
              5'h0c: normal_out = 16'h3a06;
              5'h0d: normal_out = 16'h3a06;
              5'h0e: normal_out = 16'h3a06;
              5'h0f: normal_out = 16'h3a05;
              5'h10: normal_out = 16'h3a05;
              5'h11: normal_out = 16'h3a05;
              5'h12: normal_out = 16'h3a05;
              5'h13: normal_out = 16'h3a04;
              5'h14: normal_out = 16'h3a04;
              5'h15: normal_out = 16'h3a04;
              5'h16: normal_out = 16'h3a04;
              5'h17: normal_out = 16'h3a03;
              5'h18: normal_out = 16'h3a03;
              5'h19: normal_out = 16'h3a03;
              5'h1a: normal_out = 16'h3a03;
              5'h1f: normal_out = 16'h3a01;
              default: begin end
            endcase
          end
          5'h15: begin
            normal_out = 16'h39fa;
            case (mant[4:0])
              5'h00: normal_out = 16'h3a01;
              5'h01: normal_out = 16'h3a01;
              5'h02: normal_out = 16'h3a01;
              5'h03: normal_out = 16'h3a00;
              5'h04: normal_out = 16'h3a00;
              5'h05: normal_out = 16'h3a00;
              5'h06: normal_out = 16'h39ff;
              5'h07: normal_out = 16'h39ff;
              5'h08: normal_out = 16'h39ff;
              5'h09: normal_out = 16'h39ff;
              5'h0a: normal_out = 16'h39fe;
              5'h0b: normal_out = 16'h39fe;
              5'h0c: normal_out = 16'h39fe;
              5'h0d: normal_out = 16'h39fe;
              5'h0e: normal_out = 16'h39fd;
              5'h0f: normal_out = 16'h39fd;
              5'h10: normal_out = 16'h39fd;
              5'h11: normal_out = 16'h39fd;
              5'h12: normal_out = 16'h39fc;
              5'h13: normal_out = 16'h39fc;
              5'h14: normal_out = 16'h39fc;
              5'h15: normal_out = 16'h39fc;
              5'h16: normal_out = 16'h39fb;
              5'h17: normal_out = 16'h39fb;
              5'h18: normal_out = 16'h39fb;
              5'h19: normal_out = 16'h39fb;
              5'h1e: normal_out = 16'h39f9;
              5'h1f: normal_out = 16'h39f9;
              default: begin end
            endcase
          end
          5'h16: begin
            normal_out = 16'h39f2;
            case (mant[4:0])
              5'h00: normal_out = 16'h39f9;
              5'h01: normal_out = 16'h39f8;
              5'h02: normal_out = 16'h39f8;
              5'h03: normal_out = 16'h39f8;
              5'h04: normal_out = 16'h39f8;
              5'h05: normal_out = 16'h39f7;
              5'h06: normal_out = 16'h39f7;
              5'h07: normal_out = 16'h39f7;
              5'h08: normal_out = 16'h39f7;
              5'h09: normal_out = 16'h39f6;
              5'h0a: normal_out = 16'h39f6;
              5'h0b: normal_out = 16'h39f6;
              5'h0c: normal_out = 16'h39f6;
              5'h0d: normal_out = 16'h39f5;
              5'h0e: normal_out = 16'h39f5;
              5'h0f: normal_out = 16'h39f5;
              5'h10: normal_out = 16'h39f5;
              5'h11: normal_out = 16'h39f4;
              5'h12: normal_out = 16'h39f4;
              5'h13: normal_out = 16'h39f4;
              5'h14: normal_out = 16'h39f4;
              5'h15: normal_out = 16'h39f3;
              5'h16: normal_out = 16'h39f3;
              5'h17: normal_out = 16'h39f3;
              5'h18: normal_out = 16'h39f3;
              5'h1d: normal_out = 16'h39f1;
              5'h1e: normal_out = 16'h39f1;
              5'h1f: normal_out = 16'h39f1;
              default: begin end
            endcase
          end
          5'h17: begin
            normal_out = 16'h39e9;
            case (mant[4:0])
              5'h00: normal_out = 16'h39f0;
              5'h01: normal_out = 16'h39f0;
              5'h02: normal_out = 16'h39f0;
              5'h03: normal_out = 16'h39f0;
              5'h04: normal_out = 16'h39ef;
              5'h05: normal_out = 16'h39ef;
              5'h06: normal_out = 16'h39ef;
              5'h07: normal_out = 16'h39ef;
              5'h08: normal_out = 16'h39ee;
              5'h09: normal_out = 16'h39ee;
              5'h0a: normal_out = 16'h39ee;
              5'h0b: normal_out = 16'h39ee;
              5'h0c: normal_out = 16'h39ed;
              5'h0d: normal_out = 16'h39ed;
              5'h0e: normal_out = 16'h39ed;
              5'h0f: normal_out = 16'h39ed;
              5'h10: normal_out = 16'h39ec;
              5'h11: normal_out = 16'h39ec;
              5'h12: normal_out = 16'h39ec;
              5'h13: normal_out = 16'h39ec;
              5'h14: normal_out = 16'h39eb;
              5'h15: normal_out = 16'h39eb;
              5'h16: normal_out = 16'h39eb;
              5'h17: normal_out = 16'h39eb;
              5'h18: normal_out = 16'h39ea;
              5'h19: normal_out = 16'h39ea;
              5'h1a: normal_out = 16'h39ea;
              5'h1b: normal_out = 16'h39ea;
              default: begin end
            endcase
          end
          5'h18: begin
            normal_out = 16'h39e1;
            case (mant[4:0])
              5'h00: normal_out = 16'h39e8;
              5'h01: normal_out = 16'h39e8;
              5'h02: normal_out = 16'h39e8;
              5'h03: normal_out = 16'h39e8;
              5'h04: normal_out = 16'h39e7;
              5'h05: normal_out = 16'h39e7;
              5'h06: normal_out = 16'h39e7;
              5'h07: normal_out = 16'h39e6;
              5'h08: normal_out = 16'h39e6;
              5'h09: normal_out = 16'h39e6;
              5'h0a: normal_out = 16'h39e6;
              5'h0b: normal_out = 16'h39e5;
              5'h0c: normal_out = 16'h39e5;
              5'h0d: normal_out = 16'h39e5;
              5'h0e: normal_out = 16'h39e5;
              5'h0f: normal_out = 16'h39e4;
              5'h10: normal_out = 16'h39e4;
              5'h11: normal_out = 16'h39e4;
              5'h12: normal_out = 16'h39e4;
              5'h13: normal_out = 16'h39e3;
              5'h14: normal_out = 16'h39e3;
              5'h15: normal_out = 16'h39e3;
              5'h16: normal_out = 16'h39e3;
              5'h17: normal_out = 16'h39e2;
              5'h18: normal_out = 16'h39e2;
              5'h19: normal_out = 16'h39e2;
              5'h1a: normal_out = 16'h39e2;
              5'h1f: normal_out = 16'h39e0;
              default: begin end
            endcase
          end
          5'h19: begin
            normal_out = 16'h39d9;
            case (mant[4:0])
              5'h00: normal_out = 16'h39e0;
              5'h01: normal_out = 16'h39e0;
              5'h02: normal_out = 16'h39e0;
              5'h03: normal_out = 16'h39df;
              5'h04: normal_out = 16'h39df;
              5'h05: normal_out = 16'h39df;
              5'h06: normal_out = 16'h39df;
              5'h07: normal_out = 16'h39de;
              5'h08: normal_out = 16'h39de;
              5'h09: normal_out = 16'h39de;
              5'h0a: normal_out = 16'h39de;
              5'h0b: normal_out = 16'h39dd;
              5'h0c: normal_out = 16'h39dd;
              5'h0d: normal_out = 16'h39dd;
              5'h0e: normal_out = 16'h39dd;
              5'h0f: normal_out = 16'h39dc;
              5'h10: normal_out = 16'h39dc;
              5'h11: normal_out = 16'h39dc;
              5'h12: normal_out = 16'h39dc;
              5'h13: normal_out = 16'h39db;
              5'h14: normal_out = 16'h39db;
              5'h15: normal_out = 16'h39db;
              5'h16: normal_out = 16'h39db;
              5'h17: normal_out = 16'h39da;
              5'h18: normal_out = 16'h39da;
              5'h19: normal_out = 16'h39da;
              5'h1e: normal_out = 16'h39d8;
              5'h1f: normal_out = 16'h39d8;
              default: begin end
            endcase
          end
          5'h1a: begin
            normal_out = 16'h39d1;
            case (mant[4:0])
              5'h00: normal_out = 16'h39d8;
              5'h01: normal_out = 16'h39d8;
              5'h02: normal_out = 16'h39d7;
              5'h03: normal_out = 16'h39d7;
              5'h04: normal_out = 16'h39d7;
              5'h05: normal_out = 16'h39d7;
              5'h06: normal_out = 16'h39d6;
              5'h07: normal_out = 16'h39d6;
              5'h08: normal_out = 16'h39d6;
              5'h09: normal_out = 16'h39d6;
              5'h0a: normal_out = 16'h39d5;
              5'h0b: normal_out = 16'h39d5;
              5'h0c: normal_out = 16'h39d5;
              5'h0d: normal_out = 16'h39d5;
              5'h0e: normal_out = 16'h39d4;
              5'h0f: normal_out = 16'h39d4;
              5'h10: normal_out = 16'h39d4;
              5'h11: normal_out = 16'h39d4;
              5'h12: normal_out = 16'h39d3;
              5'h13: normal_out = 16'h39d3;
              5'h14: normal_out = 16'h39d3;
              5'h15: normal_out = 16'h39d3;
              5'h16: normal_out = 16'h39d2;
              5'h17: normal_out = 16'h39d2;
              5'h18: normal_out = 16'h39d2;
              5'h19: normal_out = 16'h39d2;
              5'h1e: normal_out = 16'h39d0;
              5'h1f: normal_out = 16'h39d0;
              default: begin end
            endcase
          end
          5'h1b: begin
            normal_out = 16'h39c9;
            case (mant[4:0])
              5'h00: normal_out = 16'h39d0;
              5'h01: normal_out = 16'h39d0;
              5'h02: normal_out = 16'h39cf;
              5'h03: normal_out = 16'h39cf;
              5'h04: normal_out = 16'h39cf;
              5'h05: normal_out = 16'h39cf;
              5'h06: normal_out = 16'h39ce;
              5'h07: normal_out = 16'h39ce;
              5'h08: normal_out = 16'h39ce;
              5'h09: normal_out = 16'h39ce;
              5'h0a: normal_out = 16'h39cd;
              5'h0b: normal_out = 16'h39cd;
              5'h0c: normal_out = 16'h39cd;
              5'h0d: normal_out = 16'h39cd;
              5'h0e: normal_out = 16'h39cc;
              5'h0f: normal_out = 16'h39cc;
              5'h10: normal_out = 16'h39cc;
              5'h11: normal_out = 16'h39cc;
              5'h12: normal_out = 16'h39cb;
              5'h13: normal_out = 16'h39cb;
              5'h14: normal_out = 16'h39cb;
              5'h15: normal_out = 16'h39cb;
              5'h16: normal_out = 16'h39ca;
              5'h17: normal_out = 16'h39ca;
              5'h18: normal_out = 16'h39ca;
              5'h19: normal_out = 16'h39ca;
              5'h1e: normal_out = 16'h39c8;
              5'h1f: normal_out = 16'h39c8;
              default: begin end
            endcase
          end
          5'h1c: begin
            normal_out = 16'h39c1;
            case (mant[4:0])
              5'h00: normal_out = 16'h39c8;
              5'h01: normal_out = 16'h39c8;
              5'h02: normal_out = 16'h39c7;
              5'h03: normal_out = 16'h39c7;
              5'h04: normal_out = 16'h39c7;
              5'h05: normal_out = 16'h39c7;
              5'h06: normal_out = 16'h39c6;
              5'h07: normal_out = 16'h39c6;
              5'h08: normal_out = 16'h39c6;
              5'h09: normal_out = 16'h39c6;
              5'h0a: normal_out = 16'h39c5;
              5'h0b: normal_out = 16'h39c5;
              5'h0c: normal_out = 16'h39c5;
              5'h0d: normal_out = 16'h39c5;
              5'h0e: normal_out = 16'h39c4;
              5'h0f: normal_out = 16'h39c4;
              5'h10: normal_out = 16'h39c4;
              5'h11: normal_out = 16'h39c4;
              5'h12: normal_out = 16'h39c3;
              5'h13: normal_out = 16'h39c3;
              5'h14: normal_out = 16'h39c3;
              5'h15: normal_out = 16'h39c3;
              5'h16: normal_out = 16'h39c2;
              5'h17: normal_out = 16'h39c2;
              5'h18: normal_out = 16'h39c2;
              5'h19: normal_out = 16'h39c2;
              5'h1e: normal_out = 16'h39c0;
              5'h1f: normal_out = 16'h39c0;
              default: begin end
            endcase
          end
          5'h1d: begin
            normal_out = 16'h39b9;
            case (mant[4:0])
              5'h00: normal_out = 16'h39c0;
              5'h01: normal_out = 16'h39c0;
              5'h02: normal_out = 16'h39bf;
              5'h03: normal_out = 16'h39bf;
              5'h04: normal_out = 16'h39bf;
              5'h05: normal_out = 16'h39bf;
              5'h06: normal_out = 16'h39be;
              5'h07: normal_out = 16'h39be;
              5'h08: normal_out = 16'h39be;
              5'h09: normal_out = 16'h39be;
              5'h0a: normal_out = 16'h39bd;
              5'h0b: normal_out = 16'h39bd;
              5'h0c: normal_out = 16'h39bd;
              5'h0d: normal_out = 16'h39bd;
              5'h0e: normal_out = 16'h39bc;
              5'h0f: normal_out = 16'h39bc;
              5'h10: normal_out = 16'h39bc;
              5'h11: normal_out = 16'h39bc;
              5'h12: normal_out = 16'h39bb;
              5'h13: normal_out = 16'h39bb;
              5'h14: normal_out = 16'h39bb;
              5'h15: normal_out = 16'h39bb;
              5'h16: normal_out = 16'h39ba;
              5'h17: normal_out = 16'h39ba;
              5'h18: normal_out = 16'h39ba;
              5'h19: normal_out = 16'h39ba;
              5'h1e: normal_out = 16'h39b8;
              5'h1f: normal_out = 16'h39b8;
              default: begin end
            endcase
          end
          5'h1e: begin
            normal_out = 16'h39b1;
            case (mant[4:0])
              5'h00: normal_out = 16'h39b8;
              5'h01: normal_out = 16'h39b8;
              5'h02: normal_out = 16'h39b7;
              5'h03: normal_out = 16'h39b7;
              5'h04: normal_out = 16'h39b7;
              5'h05: normal_out = 16'h39b7;
              5'h06: normal_out = 16'h39b6;
              5'h07: normal_out = 16'h39b6;
              5'h08: normal_out = 16'h39b6;
              5'h09: normal_out = 16'h39b6;
              5'h0a: normal_out = 16'h39b5;
              5'h0b: normal_out = 16'h39b5;
              5'h0c: normal_out = 16'h39b5;
              5'h0d: normal_out = 16'h39b5;
              5'h0e: normal_out = 16'h39b4;
              5'h0f: normal_out = 16'h39b4;
              5'h10: normal_out = 16'h39b4;
              5'h11: normal_out = 16'h39b4;
              5'h12: normal_out = 16'h39b3;
              5'h13: normal_out = 16'h39b3;
              5'h14: normal_out = 16'h39b3;
              5'h15: normal_out = 16'h39b3;
              5'h16: normal_out = 16'h39b2;
              5'h17: normal_out = 16'h39b2;
              5'h18: normal_out = 16'h39b2;
              5'h19: normal_out = 16'h39b2;
              5'h1f: normal_out = 16'h39b0;
              default: begin end
            endcase
          end
          5'h1f: begin
            normal_out = 16'h39a9;
            case (mant[4:0])
              5'h00: normal_out = 16'h39b0;
              5'h01: normal_out = 16'h39b0;
              5'h02: normal_out = 16'h39b0;
              5'h03: normal_out = 16'h39af;
              5'h04: normal_out = 16'h39af;
              5'h05: normal_out = 16'h39af;
              5'h06: normal_out = 16'h39af;
              5'h07: normal_out = 16'h39ae;
              5'h08: normal_out = 16'h39ae;
              5'h09: normal_out = 16'h39ae;
              5'h0a: normal_out = 16'h39ae;
              5'h0b: normal_out = 16'h39ad;
              5'h0c: normal_out = 16'h39ad;
              5'h0d: normal_out = 16'h39ad;
              5'h0e: normal_out = 16'h39ad;
              5'h0f: normal_out = 16'h39ac;
              5'h10: normal_out = 16'h39ac;
              5'h11: normal_out = 16'h39ac;
              5'h12: normal_out = 16'h39ac;
              5'h13: normal_out = 16'h39ab;
              5'h14: normal_out = 16'h39ab;
              5'h15: normal_out = 16'h39ab;
              5'h16: normal_out = 16'h39ab;
              5'h17: normal_out = 16'h39aa;
              5'h18: normal_out = 16'h39aa;
              5'h19: normal_out = 16'h39aa;
              5'h1a: normal_out = 16'h39aa;
              5'h1f: normal_out = 16'h39a8;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      6'h2e: begin
        case (mant[9:5])
          5'h00: begin
            normal_out = 16'h399a;
            case (mant[4:0])
              5'h00: normal_out = 16'h39a8;
              5'h01: normal_out = 16'h39a8;
              5'h02: normal_out = 16'h39a7;
              5'h03: normal_out = 16'h39a7;
              5'h04: normal_out = 16'h39a6;
              5'h05: normal_out = 16'h39a6;
              5'h06: normal_out = 16'h39a5;
              5'h07: normal_out = 16'h39a5;
              5'h08: normal_out = 16'h39a4;
              5'h09: normal_out = 16'h39a4;
              5'h0a: normal_out = 16'h39a3;
              5'h0b: normal_out = 16'h39a3;
              5'h0c: normal_out = 16'h39a2;
              5'h0d: normal_out = 16'h39a2;
              5'h0e: normal_out = 16'h39a1;
              5'h0f: normal_out = 16'h39a1;
              5'h10: normal_out = 16'h39a0;
              5'h11: normal_out = 16'h39a0;
              5'h12: normal_out = 16'h399f;
              5'h13: normal_out = 16'h399f;
              5'h14: normal_out = 16'h399e;
              5'h15: normal_out = 16'h399e;
              5'h16: normal_out = 16'h399d;
              5'h17: normal_out = 16'h399d;
              5'h18: normal_out = 16'h399c;
              5'h19: normal_out = 16'h399c;
              5'h1a: normal_out = 16'h399b;
              5'h1b: normal_out = 16'h399b;
              5'h1f: normal_out = 16'h3999;
              default: begin end
            endcase
          end
          5'h01: begin
            normal_out = 16'h398c;
            case (mant[4:0])
              5'h00: normal_out = 16'h3999;
              5'h01: normal_out = 16'h3998;
              5'h02: normal_out = 16'h3998;
              5'h03: normal_out = 16'h3997;
              5'h04: normal_out = 16'h3997;
              5'h05: normal_out = 16'h3996;
              5'h06: normal_out = 16'h3996;
              5'h07: normal_out = 16'h3995;
              5'h08: normal_out = 16'h3995;
              5'h09: normal_out = 16'h3994;
              5'h0a: normal_out = 16'h3994;
              5'h0b: normal_out = 16'h3993;
              5'h0c: normal_out = 16'h3993;
              5'h0d: normal_out = 16'h3992;
              5'h0e: normal_out = 16'h3992;
              5'h0f: normal_out = 16'h3991;
              5'h10: normal_out = 16'h3991;
              5'h11: normal_out = 16'h3990;
              5'h12: normal_out = 16'h3990;
              5'h13: normal_out = 16'h398f;
              5'h14: normal_out = 16'h398f;
              5'h15: normal_out = 16'h398e;
              5'h16: normal_out = 16'h398e;
              5'h17: normal_out = 16'h398d;
              5'h18: normal_out = 16'h398d;
              5'h1c: normal_out = 16'h398b;
              5'h1d: normal_out = 16'h398b;
              5'h1e: normal_out = 16'h398a;
              5'h1f: normal_out = 16'h398a;
              default: begin end
            endcase
          end
          5'h02: begin
            normal_out = 16'h3981;
            case (mant[4:0])
              5'h00: normal_out = 16'h3989;
              5'h01: normal_out = 16'h3989;
              5'h02: normal_out = 16'h3988;
              5'h03: normal_out = 16'h3988;
              5'h04: normal_out = 16'h3987;
              5'h05: normal_out = 16'h3987;
              5'h06: normal_out = 16'h3986;
              5'h07: normal_out = 16'h3986;
              5'h08: normal_out = 16'h3985;
              5'h09: normal_out = 16'h3985;
              5'h0a: normal_out = 16'h3984;
              5'h0b: normal_out = 16'h3984;
              5'h0c: normal_out = 16'h3983;
              5'h0d: normal_out = 16'h3983;
              5'h0e: normal_out = 16'h3982;
              5'h0f: normal_out = 16'h3982;
              5'h13: normal_out = 16'h3980;
              5'h14: normal_out = 16'h3980;
              5'h15: normal_out = 16'h397f;
              5'h16: normal_out = 16'h397f;
              5'h17: normal_out = 16'h397e;
              5'h18: normal_out = 16'h397e;
              5'h19: normal_out = 16'h397d;
              5'h1a: normal_out = 16'h397d;
              5'h1b: normal_out = 16'h397c;
              5'h1c: normal_out = 16'h397c;
              5'h1d: normal_out = 16'h397b;
              5'h1e: normal_out = 16'h397b;
              5'h1f: normal_out = 16'h397a;
              default: begin end
            endcase
          end
          5'h03: begin
            normal_out = 16'h396f;
            case (mant[4:0])
              5'h00: normal_out = 16'h397a;
              5'h01: normal_out = 16'h3979;
              5'h02: normal_out = 16'h3979;
              5'h03: normal_out = 16'h3978;
              5'h04: normal_out = 16'h3978;
              5'h05: normal_out = 16'h3977;
              5'h06: normal_out = 16'h3977;
              5'h07: normal_out = 16'h3977;
              5'h08: normal_out = 16'h3976;
              5'h09: normal_out = 16'h3976;
              5'h0a: normal_out = 16'h3975;
              5'h0b: normal_out = 16'h3975;
              5'h0c: normal_out = 16'h3974;
              5'h0d: normal_out = 16'h3974;
              5'h0e: normal_out = 16'h3973;
              5'h0f: normal_out = 16'h3973;
              5'h10: normal_out = 16'h3972;
              5'h11: normal_out = 16'h3972;
              5'h12: normal_out = 16'h3971;
              5'h13: normal_out = 16'h3971;
              5'h14: normal_out = 16'h3970;
              5'h15: normal_out = 16'h3970;
              5'h19: normal_out = 16'h396e;
              5'h1a: normal_out = 16'h396e;
              5'h1b: normal_out = 16'h396d;
              5'h1c: normal_out = 16'h396d;
              5'h1d: normal_out = 16'h396c;
              5'h1e: normal_out = 16'h396c;
              5'h1f: normal_out = 16'h396b;
              default: begin end
            endcase
          end
          5'h04: begin
            normal_out = 16'h3960;
            case (mant[4:0])
              5'h00: normal_out = 16'h396b;
              5'h01: normal_out = 16'h396a;
              5'h02: normal_out = 16'h396a;
              5'h03: normal_out = 16'h3969;
              5'h04: normal_out = 16'h3969;
              5'h05: normal_out = 16'h3968;
              5'h06: normal_out = 16'h3968;
              5'h07: normal_out = 16'h3967;
              5'h08: normal_out = 16'h3967;
              5'h09: normal_out = 16'h3967;
              5'h0a: normal_out = 16'h3966;
              5'h0b: normal_out = 16'h3966;
              5'h0c: normal_out = 16'h3965;
              5'h0d: normal_out = 16'h3965;
              5'h0e: normal_out = 16'h3964;
              5'h0f: normal_out = 16'h3964;
              5'h10: normal_out = 16'h3963;
              5'h11: normal_out = 16'h3963;
              5'h12: normal_out = 16'h3962;
              5'h13: normal_out = 16'h3962;
              5'h14: normal_out = 16'h3961;
              5'h15: normal_out = 16'h3961;
              5'h19: normal_out = 16'h395f;
              5'h1a: normal_out = 16'h395f;
              5'h1b: normal_out = 16'h395e;
              5'h1c: normal_out = 16'h395e;
              5'h1d: normal_out = 16'h395d;
              5'h1e: normal_out = 16'h395d;
              5'h1f: normal_out = 16'h395c;
              default: begin end
            endcase
          end
          5'h05: begin
            normal_out = 16'h394e;
            case (mant[4:0])
              5'h00: normal_out = 16'h395c;
              5'h01: normal_out = 16'h395b;
              5'h02: normal_out = 16'h395b;
              5'h03: normal_out = 16'h395a;
              5'h04: normal_out = 16'h395a;
              5'h05: normal_out = 16'h395a;
              5'h06: normal_out = 16'h3959;
              5'h07: normal_out = 16'h3959;
              5'h08: normal_out = 16'h3958;
              5'h09: normal_out = 16'h3958;
              5'h0a: normal_out = 16'h3957;
              5'h0b: normal_out = 16'h3957;
              5'h0c: normal_out = 16'h3956;
              5'h0d: normal_out = 16'h3956;
              5'h0e: normal_out = 16'h3955;
              5'h0f: normal_out = 16'h3955;
              5'h10: normal_out = 16'h3954;
              5'h11: normal_out = 16'h3954;
              5'h12: normal_out = 16'h3953;
              5'h13: normal_out = 16'h3953;
              5'h14: normal_out = 16'h3953;
              5'h15: normal_out = 16'h3952;
              5'h16: normal_out = 16'h3952;
              5'h17: normal_out = 16'h3951;
              5'h18: normal_out = 16'h3951;
              5'h19: normal_out = 16'h3950;
              5'h1a: normal_out = 16'h3950;
              5'h1b: normal_out = 16'h394f;
              5'h1c: normal_out = 16'h394f;
              default: begin end
            endcase
          end
          5'h06: begin
            normal_out = 16'h3943;
            case (mant[4:0])
              5'h00: normal_out = 16'h394d;
              5'h01: normal_out = 16'h394d;
              5'h02: normal_out = 16'h394c;
              5'h03: normal_out = 16'h394c;
              5'h04: normal_out = 16'h394b;
              5'h05: normal_out = 16'h394b;
              5'h06: normal_out = 16'h394a;
              5'h07: normal_out = 16'h394a;
              5'h08: normal_out = 16'h3949;
              5'h09: normal_out = 16'h3949;
              5'h0a: normal_out = 16'h3948;
              5'h0b: normal_out = 16'h3948;
              5'h0c: normal_out = 16'h3948;
              5'h0d: normal_out = 16'h3947;
              5'h0e: normal_out = 16'h3947;
              5'h0f: normal_out = 16'h3946;
              5'h10: normal_out = 16'h3946;
              5'h11: normal_out = 16'h3945;
              5'h12: normal_out = 16'h3945;
              5'h13: normal_out = 16'h3944;
              5'h14: normal_out = 16'h3944;
              5'h18: normal_out = 16'h3942;
              5'h19: normal_out = 16'h3942;
              5'h1a: normal_out = 16'h3941;
              5'h1b: normal_out = 16'h3941;
              5'h1c: normal_out = 16'h3940;
              5'h1d: normal_out = 16'h3940;
              5'h1e: normal_out = 16'h393f;
              5'h1f: normal_out = 16'h393f;
              default: begin end
            endcase
          end
          5'h07: begin
            normal_out = 16'h3934;
            case (mant[4:0])
              5'h00: normal_out = 16'h393e;
              5'h01: normal_out = 16'h393e;
              5'h02: normal_out = 16'h393e;
              5'h03: normal_out = 16'h393d;
              5'h04: normal_out = 16'h393d;
              5'h05: normal_out = 16'h393c;
              5'h06: normal_out = 16'h393c;
              5'h07: normal_out = 16'h393b;
              5'h08: normal_out = 16'h393b;
              5'h09: normal_out = 16'h393a;
              5'h0a: normal_out = 16'h393a;
              5'h0b: normal_out = 16'h3939;
              5'h0c: normal_out = 16'h3939;
              5'h0d: normal_out = 16'h3939;
              5'h0e: normal_out = 16'h3938;
              5'h0f: normal_out = 16'h3938;
              5'h10: normal_out = 16'h3937;
              5'h11: normal_out = 16'h3937;
              5'h12: normal_out = 16'h3936;
              5'h13: normal_out = 16'h3936;
              5'h14: normal_out = 16'h3935;
              5'h15: normal_out = 16'h3935;
              5'h19: normal_out = 16'h3933;
              5'h1a: normal_out = 16'h3933;
              5'h1b: normal_out = 16'h3932;
              5'h1c: normal_out = 16'h3932;
              5'h1d: normal_out = 16'h3931;
              5'h1e: normal_out = 16'h3931;
              5'h1f: normal_out = 16'h3930;
              default: begin end
            endcase
          end
          5'h08: begin
            normal_out = 16'h3923;
            case (mant[4:0])
              5'h00: normal_out = 16'h3930;
              5'h01: normal_out = 16'h3930;
              5'h02: normal_out = 16'h392f;
              5'h03: normal_out = 16'h392f;
              5'h04: normal_out = 16'h392e;
              5'h05: normal_out = 16'h392e;
              5'h06: normal_out = 16'h392d;
              5'h07: normal_out = 16'h392d;
              5'h08: normal_out = 16'h392c;
              5'h09: normal_out = 16'h392c;
              5'h0a: normal_out = 16'h392b;
              5'h0b: normal_out = 16'h392b;
              5'h0c: normal_out = 16'h392b;
              5'h0d: normal_out = 16'h392a;
              5'h0e: normal_out = 16'h392a;
              5'h0f: normal_out = 16'h3929;
              5'h10: normal_out = 16'h3929;
              5'h11: normal_out = 16'h3928;
              5'h12: normal_out = 16'h3928;
              5'h13: normal_out = 16'h3927;
              5'h14: normal_out = 16'h3927;
              5'h15: normal_out = 16'h3927;
              5'h16: normal_out = 16'h3926;
              5'h17: normal_out = 16'h3926;
              5'h18: normal_out = 16'h3925;
              5'h19: normal_out = 16'h3925;
              5'h1a: normal_out = 16'h3924;
              5'h1b: normal_out = 16'h3924;
              5'h1f: normal_out = 16'h3922;
              default: begin end
            endcase
          end
          5'h09: begin
            normal_out = 16'h3917;
            case (mant[4:0])
              5'h00: normal_out = 16'h3922;
              5'h01: normal_out = 16'h3921;
              5'h02: normal_out = 16'h3921;
              5'h03: normal_out = 16'h3920;
              5'h04: normal_out = 16'h3920;
              5'h05: normal_out = 16'h391f;
              5'h06: normal_out = 16'h391f;
              5'h07: normal_out = 16'h391f;
              5'h08: normal_out = 16'h391e;
              5'h09: normal_out = 16'h391e;
              5'h0a: normal_out = 16'h391d;
              5'h0b: normal_out = 16'h391d;
              5'h0c: normal_out = 16'h391c;
              5'h0d: normal_out = 16'h391c;
              5'h0e: normal_out = 16'h391b;
              5'h0f: normal_out = 16'h391b;
              5'h10: normal_out = 16'h391b;
              5'h11: normal_out = 16'h391a;
              5'h12: normal_out = 16'h391a;
              5'h13: normal_out = 16'h3919;
              5'h14: normal_out = 16'h3919;
              5'h15: normal_out = 16'h3918;
              5'h16: normal_out = 16'h3918;
              5'h1a: normal_out = 16'h3916;
              5'h1b: normal_out = 16'h3916;
              5'h1c: normal_out = 16'h3915;
              5'h1d: normal_out = 16'h3915;
              5'h1e: normal_out = 16'h3914;
              5'h1f: normal_out = 16'h3914;
              default: begin end
            endcase
          end
          5'h0a: begin
            normal_out = 16'h3909;
            case (mant[4:0])
              5'h00: normal_out = 16'h3914;
              5'h01: normal_out = 16'h3913;
              5'h02: normal_out = 16'h3913;
              5'h03: normal_out = 16'h3912;
              5'h04: normal_out = 16'h3912;
              5'h05: normal_out = 16'h3911;
              5'h06: normal_out = 16'h3911;
              5'h07: normal_out = 16'h3910;
              5'h08: normal_out = 16'h3910;
              5'h09: normal_out = 16'h3910;
              5'h0a: normal_out = 16'h390f;
              5'h0b: normal_out = 16'h390f;
              5'h0c: normal_out = 16'h390e;
              5'h0d: normal_out = 16'h390e;
              5'h0e: normal_out = 16'h390d;
              5'h0f: normal_out = 16'h390d;
              5'h10: normal_out = 16'h390c;
              5'h11: normal_out = 16'h390c;
              5'h12: normal_out = 16'h390c;
              5'h13: normal_out = 16'h390b;
              5'h14: normal_out = 16'h390b;
              5'h15: normal_out = 16'h390a;
              5'h16: normal_out = 16'h390a;
              5'h1a: normal_out = 16'h3908;
              5'h1b: normal_out = 16'h3908;
              5'h1c: normal_out = 16'h3907;
              5'h1d: normal_out = 16'h3907;
              5'h1e: normal_out = 16'h3906;
              5'h1f: normal_out = 16'h3906;
              default: begin end
            endcase
          end
          5'h0b: begin
            normal_out = 16'h38f9;
            case (mant[4:0])
              5'h00: normal_out = 16'h3906;
              5'h01: normal_out = 16'h3905;
              5'h02: normal_out = 16'h3905;
              5'h03: normal_out = 16'h3904;
              5'h04: normal_out = 16'h3904;
              5'h05: normal_out = 16'h3903;
              5'h06: normal_out = 16'h3903;
              5'h07: normal_out = 16'h3902;
              5'h08: normal_out = 16'h3902;
              5'h09: normal_out = 16'h3902;
              5'h0a: normal_out = 16'h3901;
              5'h0b: normal_out = 16'h3901;
              5'h0c: normal_out = 16'h3900;
              5'h0d: normal_out = 16'h3900;
              5'h0e: normal_out = 16'h38ff;
              5'h0f: normal_out = 16'h38ff;
              5'h10: normal_out = 16'h38ff;
              5'h11: normal_out = 16'h38fe;
              5'h12: normal_out = 16'h38fe;
              5'h13: normal_out = 16'h38fd;
              5'h14: normal_out = 16'h38fd;
              5'h15: normal_out = 16'h38fc;
              5'h16: normal_out = 16'h38fc;
              5'h17: normal_out = 16'h38fc;
              5'h18: normal_out = 16'h38fb;
              5'h19: normal_out = 16'h38fb;
              5'h1a: normal_out = 16'h38fa;
              5'h1b: normal_out = 16'h38fa;
              5'h1f: normal_out = 16'h38f8;
              default: begin end
            endcase
          end
          5'h0c: begin
            normal_out = 16'h38ed;
            case (mant[4:0])
              5'h00: normal_out = 16'h38f8;
              5'h01: normal_out = 16'h38f7;
              5'h02: normal_out = 16'h38f7;
              5'h03: normal_out = 16'h38f6;
              5'h04: normal_out = 16'h38f6;
              5'h05: normal_out = 16'h38f6;
              5'h06: normal_out = 16'h38f5;
              5'h07: normal_out = 16'h38f5;
              5'h08: normal_out = 16'h38f4;
              5'h09: normal_out = 16'h38f4;
              5'h0a: normal_out = 16'h38f3;
              5'h0b: normal_out = 16'h38f3;
              5'h0c: normal_out = 16'h38f3;
              5'h0d: normal_out = 16'h38f2;
              5'h0e: normal_out = 16'h38f2;
              5'h0f: normal_out = 16'h38f1;
              5'h10: normal_out = 16'h38f1;
              5'h11: normal_out = 16'h38f0;
              5'h12: normal_out = 16'h38f0;
              5'h13: normal_out = 16'h38f0;
              5'h14: normal_out = 16'h38ef;
              5'h15: normal_out = 16'h38ef;
              5'h16: normal_out = 16'h38ee;
              5'h17: normal_out = 16'h38ee;
              5'h1b: normal_out = 16'h38ec;
              5'h1c: normal_out = 16'h38ec;
              5'h1d: normal_out = 16'h38eb;
              5'h1e: normal_out = 16'h38eb;
              5'h1f: normal_out = 16'h38ea;
              default: begin end
            endcase
          end
          5'h0d: begin
            normal_out = 16'h38df;
            case (mant[4:0])
              5'h00: normal_out = 16'h38ea;
              5'h01: normal_out = 16'h38ea;
              5'h02: normal_out = 16'h38e9;
              5'h03: normal_out = 16'h38e9;
              5'h04: normal_out = 16'h38e8;
              5'h05: normal_out = 16'h38e8;
              5'h06: normal_out = 16'h38e7;
              5'h07: normal_out = 16'h38e7;
              5'h08: normal_out = 16'h38e7;
              5'h09: normal_out = 16'h38e6;
              5'h0a: normal_out = 16'h38e6;
              5'h0b: normal_out = 16'h38e5;
              5'h0c: normal_out = 16'h38e5;
              5'h0d: normal_out = 16'h38e4;
              5'h0e: normal_out = 16'h38e4;
              5'h0f: normal_out = 16'h38e4;
              5'h10: normal_out = 16'h38e3;
              5'h11: normal_out = 16'h38e3;
              5'h12: normal_out = 16'h38e2;
              5'h13: normal_out = 16'h38e2;
              5'h14: normal_out = 16'h38e1;
              5'h15: normal_out = 16'h38e1;
              5'h16: normal_out = 16'h38e1;
              5'h17: normal_out = 16'h38e0;
              5'h18: normal_out = 16'h38e0;
              5'h1c: normal_out = 16'h38de;
              5'h1d: normal_out = 16'h38de;
              5'h1e: normal_out = 16'h38dd;
              5'h1f: normal_out = 16'h38dd;
              default: begin end
            endcase
          end
          5'h0e: begin
            normal_out = 16'h38d2;
            case (mant[4:0])
              5'h00: normal_out = 16'h38dc;
              5'h01: normal_out = 16'h38dc;
              5'h02: normal_out = 16'h38dc;
              5'h03: normal_out = 16'h38db;
              5'h04: normal_out = 16'h38db;
              5'h05: normal_out = 16'h38da;
              5'h06: normal_out = 16'h38da;
              5'h07: normal_out = 16'h38d9;
              5'h08: normal_out = 16'h38d9;
              5'h09: normal_out = 16'h38d9;
              5'h0a: normal_out = 16'h38d8;
              5'h0b: normal_out = 16'h38d8;
              5'h0c: normal_out = 16'h38d7;
              5'h0d: normal_out = 16'h38d7;
              5'h0e: normal_out = 16'h38d7;
              5'h0f: normal_out = 16'h38d6;
              5'h10: normal_out = 16'h38d6;
              5'h11: normal_out = 16'h38d5;
              5'h12: normal_out = 16'h38d5;
              5'h13: normal_out = 16'h38d4;
              5'h14: normal_out = 16'h38d4;
              5'h15: normal_out = 16'h38d4;
              5'h16: normal_out = 16'h38d3;
              5'h17: normal_out = 16'h38d3;
              5'h1b: normal_out = 16'h38d1;
              5'h1c: normal_out = 16'h38d1;
              5'h1d: normal_out = 16'h38d0;
              5'h1e: normal_out = 16'h38d0;
              5'h1f: normal_out = 16'h38cf;
              default: begin end
            endcase
          end
          5'h0f: begin
            normal_out = 16'h38c3;
            case (mant[4:0])
              5'h00: normal_out = 16'h38cf;
              5'h01: normal_out = 16'h38cf;
              5'h02: normal_out = 16'h38ce;
              5'h03: normal_out = 16'h38ce;
              5'h04: normal_out = 16'h38cd;
              5'h05: normal_out = 16'h38cd;
              5'h06: normal_out = 16'h38cd;
              5'h07: normal_out = 16'h38cc;
              5'h08: normal_out = 16'h38cc;
              5'h09: normal_out = 16'h38cb;
              5'h0a: normal_out = 16'h38cb;
              5'h0b: normal_out = 16'h38ca;
              5'h0c: normal_out = 16'h38ca;
              5'h0d: normal_out = 16'h38ca;
              5'h0e: normal_out = 16'h38c9;
              5'h0f: normal_out = 16'h38c9;
              5'h10: normal_out = 16'h38c8;
              5'h11: normal_out = 16'h38c8;
              5'h12: normal_out = 16'h38c8;
              5'h13: normal_out = 16'h38c7;
              5'h14: normal_out = 16'h38c7;
              5'h15: normal_out = 16'h38c6;
              5'h16: normal_out = 16'h38c6;
              5'h17: normal_out = 16'h38c5;
              5'h18: normal_out = 16'h38c5;
              5'h19: normal_out = 16'h38c5;
              5'h1a: normal_out = 16'h38c4;
              5'h1b: normal_out = 16'h38c4;
              5'h1f: normal_out = 16'h38c2;
              default: begin end
            endcase
          end
          5'h10: begin
            normal_out = 16'h38b7;
            case (mant[4:0])
              5'h00: normal_out = 16'h38c2;
              5'h01: normal_out = 16'h38c1;
              5'h02: normal_out = 16'h38c1;
              5'h03: normal_out = 16'h38c1;
              5'h04: normal_out = 16'h38c0;
              5'h05: normal_out = 16'h38c0;
              5'h06: normal_out = 16'h38bf;
              5'h07: normal_out = 16'h38bf;
              5'h08: normal_out = 16'h38be;
              5'h09: normal_out = 16'h38be;
              5'h0a: normal_out = 16'h38be;
              5'h0b: normal_out = 16'h38bd;
              5'h0c: normal_out = 16'h38bd;
              5'h0d: normal_out = 16'h38bc;
              5'h0e: normal_out = 16'h38bc;
              5'h0f: normal_out = 16'h38bc;
              5'h10: normal_out = 16'h38bb;
              5'h11: normal_out = 16'h38bb;
              5'h12: normal_out = 16'h38ba;
              5'h13: normal_out = 16'h38ba;
              5'h14: normal_out = 16'h38ba;
              5'h15: normal_out = 16'h38b9;
              5'h16: normal_out = 16'h38b9;
              5'h17: normal_out = 16'h38b8;
              5'h18: normal_out = 16'h38b8;
              5'h1c: normal_out = 16'h38b6;
              5'h1d: normal_out = 16'h38b6;
              5'h1e: normal_out = 16'h38b5;
              5'h1f: normal_out = 16'h38b5;
              default: begin end
            endcase
          end
          5'h11: begin
            normal_out = 16'h38aa;
            case (mant[4:0])
              5'h00: normal_out = 16'h38b5;
              5'h01: normal_out = 16'h38b4;
              5'h02: normal_out = 16'h38b4;
              5'h03: normal_out = 16'h38b3;
              5'h04: normal_out = 16'h38b3;
              5'h05: normal_out = 16'h38b3;
              5'h06: normal_out = 16'h38b2;
              5'h07: normal_out = 16'h38b2;
              5'h08: normal_out = 16'h38b1;
              5'h09: normal_out = 16'h38b1;
              5'h0a: normal_out = 16'h38b1;
              5'h0b: normal_out = 16'h38b0;
              5'h0c: normal_out = 16'h38b0;
              5'h0d: normal_out = 16'h38af;
              5'h0e: normal_out = 16'h38af;
              5'h0f: normal_out = 16'h38af;
              5'h10: normal_out = 16'h38ae;
              5'h11: normal_out = 16'h38ae;
              5'h12: normal_out = 16'h38ad;
              5'h13: normal_out = 16'h38ad;
              5'h14: normal_out = 16'h38ad;
              5'h15: normal_out = 16'h38ac;
              5'h16: normal_out = 16'h38ac;
              5'h17: normal_out = 16'h38ab;
              5'h18: normal_out = 16'h38ab;
              5'h1c: normal_out = 16'h38a9;
              5'h1d: normal_out = 16'h38a9;
              5'h1e: normal_out = 16'h38a8;
              5'h1f: normal_out = 16'h38a8;
              default: begin end
            endcase
          end
          5'h12: begin
            normal_out = 16'h389c;
            case (mant[4:0])
              5'h00: normal_out = 16'h38a8;
              5'h01: normal_out = 16'h38a7;
              5'h02: normal_out = 16'h38a7;
              5'h03: normal_out = 16'h38a6;
              5'h04: normal_out = 16'h38a6;
              5'h05: normal_out = 16'h38a6;
              5'h06: normal_out = 16'h38a5;
              5'h07: normal_out = 16'h38a5;
              5'h08: normal_out = 16'h38a4;
              5'h09: normal_out = 16'h38a4;
              5'h0a: normal_out = 16'h38a4;
              5'h0b: normal_out = 16'h38a3;
              5'h0c: normal_out = 16'h38a3;
              5'h0d: normal_out = 16'h38a2;
              5'h0e: normal_out = 16'h38a2;
              5'h0f: normal_out = 16'h38a2;
              5'h10: normal_out = 16'h38a1;
              5'h11: normal_out = 16'h38a1;
              5'h12: normal_out = 16'h38a0;
              5'h13: normal_out = 16'h38a0;
              5'h14: normal_out = 16'h38a0;
              5'h15: normal_out = 16'h389f;
              5'h16: normal_out = 16'h389f;
              5'h17: normal_out = 16'h389e;
              5'h18: normal_out = 16'h389e;
              5'h19: normal_out = 16'h389e;
              5'h1a: normal_out = 16'h389d;
              5'h1b: normal_out = 16'h389d;
              5'h1f: normal_out = 16'h389b;
              default: begin end
            endcase
          end
          5'h13: begin
            normal_out = 16'h388f;
            case (mant[4:0])
              5'h00: normal_out = 16'h389b;
              5'h01: normal_out = 16'h389a;
              5'h02: normal_out = 16'h389a;
              5'h03: normal_out = 16'h389a;
              5'h04: normal_out = 16'h3899;
              5'h05: normal_out = 16'h3899;
              5'h06: normal_out = 16'h3898;
              5'h07: normal_out = 16'h3898;
              5'h08: normal_out = 16'h3898;
              5'h09: normal_out = 16'h3897;
              5'h0a: normal_out = 16'h3897;
              5'h0b: normal_out = 16'h3896;
              5'h0c: normal_out = 16'h3896;
              5'h0d: normal_out = 16'h3896;
              5'h0e: normal_out = 16'h3895;
              5'h0f: normal_out = 16'h3895;
              5'h10: normal_out = 16'h3894;
              5'h11: normal_out = 16'h3894;
              5'h12: normal_out = 16'h3894;
              5'h13: normal_out = 16'h3893;
              5'h14: normal_out = 16'h3893;
              5'h15: normal_out = 16'h3892;
              5'h16: normal_out = 16'h3892;
              5'h17: normal_out = 16'h3892;
              5'h18: normal_out = 16'h3891;
              5'h19: normal_out = 16'h3891;
              5'h1a: normal_out = 16'h3890;
              5'h1b: normal_out = 16'h3890;
              5'h1c: normal_out = 16'h3890;
              default: begin end
            endcase
          end
          5'h14: begin
            normal_out = 16'h3884;
            case (mant[4:0])
              5'h00: normal_out = 16'h388e;
              5'h01: normal_out = 16'h388e;
              5'h02: normal_out = 16'h388d;
              5'h03: normal_out = 16'h388d;
              5'h04: normal_out = 16'h388d;
              5'h05: normal_out = 16'h388c;
              5'h06: normal_out = 16'h388c;
              5'h07: normal_out = 16'h388b;
              5'h08: normal_out = 16'h388b;
              5'h09: normal_out = 16'h388b;
              5'h0a: normal_out = 16'h388a;
              5'h0b: normal_out = 16'h388a;
              5'h0c: normal_out = 16'h3889;
              5'h0d: normal_out = 16'h3889;
              5'h0e: normal_out = 16'h3889;
              5'h0f: normal_out = 16'h3888;
              5'h10: normal_out = 16'h3888;
              5'h11: normal_out = 16'h3887;
              5'h12: normal_out = 16'h3887;
              5'h13: normal_out = 16'h3887;
              5'h14: normal_out = 16'h3886;
              5'h15: normal_out = 16'h3886;
              5'h16: normal_out = 16'h3885;
              5'h17: normal_out = 16'h3885;
              5'h18: normal_out = 16'h3885;
              5'h1c: normal_out = 16'h3883;
              5'h1d: normal_out = 16'h3883;
              5'h1e: normal_out = 16'h3882;
              5'h1f: normal_out = 16'h3882;
              default: begin end
            endcase
          end
          5'h15: begin
            normal_out = 16'h3876;
            case (mant[4:0])
              5'h00: normal_out = 16'h3882;
              5'h01: normal_out = 16'h3881;
              5'h02: normal_out = 16'h3881;
              5'h03: normal_out = 16'h3880;
              5'h04: normal_out = 16'h3880;
              5'h05: normal_out = 16'h3880;
              5'h06: normal_out = 16'h387f;
              5'h07: normal_out = 16'h387f;
              5'h08: normal_out = 16'h387e;
              5'h09: normal_out = 16'h387e;
              5'h0a: normal_out = 16'h387e;
              5'h0b: normal_out = 16'h387d;
              5'h0c: normal_out = 16'h387d;
              5'h0d: normal_out = 16'h387c;
              5'h0e: normal_out = 16'h387c;
              5'h0f: normal_out = 16'h387c;
              5'h10: normal_out = 16'h387b;
              5'h11: normal_out = 16'h387b;
              5'h12: normal_out = 16'h387b;
              5'h13: normal_out = 16'h387a;
              5'h14: normal_out = 16'h387a;
              5'h15: normal_out = 16'h3879;
              5'h16: normal_out = 16'h3879;
              5'h17: normal_out = 16'h3879;
              5'h18: normal_out = 16'h3878;
              5'h19: normal_out = 16'h3878;
              5'h1a: normal_out = 16'h3877;
              5'h1b: normal_out = 16'h3877;
              5'h1c: normal_out = 16'h3877;
              default: begin end
            endcase
          end
          5'h16: begin
            normal_out = 16'h386a;
            case (mant[4:0])
              5'h00: normal_out = 16'h3875;
              5'h01: normal_out = 16'h3875;
              5'h02: normal_out = 16'h3874;
              5'h03: normal_out = 16'h3874;
              5'h04: normal_out = 16'h3874;
              5'h05: normal_out = 16'h3873;
              5'h06: normal_out = 16'h3873;
              5'h07: normal_out = 16'h3872;
              5'h08: normal_out = 16'h3872;
              5'h09: normal_out = 16'h3872;
              5'h0a: normal_out = 16'h3871;
              5'h0b: normal_out = 16'h3871;
              5'h0c: normal_out = 16'h3871;
              5'h0d: normal_out = 16'h3870;
              5'h0e: normal_out = 16'h3870;
              5'h0f: normal_out = 16'h386f;
              5'h10: normal_out = 16'h386f;
              5'h11: normal_out = 16'h386f;
              5'h12: normal_out = 16'h386e;
              5'h13: normal_out = 16'h386e;
              5'h14: normal_out = 16'h386d;
              5'h15: normal_out = 16'h386d;
              5'h16: normal_out = 16'h386d;
              5'h17: normal_out = 16'h386c;
              5'h18: normal_out = 16'h386c;
              5'h19: normal_out = 16'h386c;
              5'h1a: normal_out = 16'h386b;
              5'h1b: normal_out = 16'h386b;
              5'h1f: normal_out = 16'h3869;
              default: begin end
            endcase
          end
          5'h17: begin
            normal_out = 16'h385f;
            case (mant[4:0])
              5'h00: normal_out = 16'h3869;
              5'h01: normal_out = 16'h3868;
              5'h02: normal_out = 16'h3868;
              5'h03: normal_out = 16'h3868;
              5'h04: normal_out = 16'h3867;
              5'h05: normal_out = 16'h3867;
              5'h06: normal_out = 16'h3867;
              5'h07: normal_out = 16'h3866;
              5'h08: normal_out = 16'h3866;
              5'h09: normal_out = 16'h3865;
              5'h0a: normal_out = 16'h3865;
              5'h0b: normal_out = 16'h3865;
              5'h0c: normal_out = 16'h3864;
              5'h0d: normal_out = 16'h3864;
              5'h0e: normal_out = 16'h3864;
              5'h0f: normal_out = 16'h3863;
              5'h10: normal_out = 16'h3863;
              5'h11: normal_out = 16'h3862;
              5'h12: normal_out = 16'h3862;
              5'h13: normal_out = 16'h3862;
              5'h14: normal_out = 16'h3861;
              5'h15: normal_out = 16'h3861;
              5'h16: normal_out = 16'h3860;
              5'h17: normal_out = 16'h3860;
              5'h18: normal_out = 16'h3860;
              5'h1c: normal_out = 16'h385e;
              5'h1d: normal_out = 16'h385e;
              5'h1e: normal_out = 16'h385d;
              5'h1f: normal_out = 16'h385d;
              default: begin end
            endcase
          end
          5'h18: begin
            normal_out = 16'h3853;
            case (mant[4:0])
              5'h00: normal_out = 16'h385d;
              5'h01: normal_out = 16'h385c;
              5'h02: normal_out = 16'h385c;
              5'h03: normal_out = 16'h385c;
              5'h04: normal_out = 16'h385b;
              5'h05: normal_out = 16'h385b;
              5'h06: normal_out = 16'h385a;
              5'h07: normal_out = 16'h385a;
              5'h08: normal_out = 16'h385a;
              5'h09: normal_out = 16'h3859;
              5'h0a: normal_out = 16'h3859;
              5'h0b: normal_out = 16'h3859;
              5'h0c: normal_out = 16'h3858;
              5'h0d: normal_out = 16'h3858;
              5'h0e: normal_out = 16'h3857;
              5'h0f: normal_out = 16'h3857;
              5'h10: normal_out = 16'h3857;
              5'h11: normal_out = 16'h3856;
              5'h12: normal_out = 16'h3856;
              5'h13: normal_out = 16'h3856;
              5'h14: normal_out = 16'h3855;
              5'h15: normal_out = 16'h3855;
              5'h16: normal_out = 16'h3854;
              5'h17: normal_out = 16'h3854;
              5'h18: normal_out = 16'h3854;
              5'h1c: normal_out = 16'h3852;
              5'h1d: normal_out = 16'h3852;
              5'h1e: normal_out = 16'h3851;
              5'h1f: normal_out = 16'h3851;
              default: begin end
            endcase
          end
          5'h19: begin
            normal_out = 16'h3847;
            case (mant[4:0])
              5'h00: normal_out = 16'h3851;
              5'h01: normal_out = 16'h3850;
              5'h02: normal_out = 16'h3850;
              5'h03: normal_out = 16'h3850;
              5'h04: normal_out = 16'h384f;
              5'h05: normal_out = 16'h384f;
              5'h06: normal_out = 16'h384e;
              5'h07: normal_out = 16'h384e;
              5'h08: normal_out = 16'h384e;
              5'h09: normal_out = 16'h384d;
              5'h0a: normal_out = 16'h384d;
              5'h0b: normal_out = 16'h384d;
              5'h0c: normal_out = 16'h384c;
              5'h0d: normal_out = 16'h384c;
              5'h0e: normal_out = 16'h384b;
              5'h0f: normal_out = 16'h384b;
              5'h10: normal_out = 16'h384b;
              5'h11: normal_out = 16'h384a;
              5'h12: normal_out = 16'h384a;
              5'h13: normal_out = 16'h384a;
              5'h14: normal_out = 16'h3849;
              5'h15: normal_out = 16'h3849;
              5'h16: normal_out = 16'h3848;
              5'h17: normal_out = 16'h3848;
              5'h18: normal_out = 16'h3848;
              5'h1c: normal_out = 16'h3846;
              5'h1d: normal_out = 16'h3846;
              5'h1e: normal_out = 16'h3845;
              5'h1f: normal_out = 16'h3845;
              default: begin end
            endcase
          end
          5'h1a: begin
            normal_out = 16'h383a;
            case (mant[4:0])
              5'h00: normal_out = 16'h3845;
              5'h01: normal_out = 16'h3844;
              5'h02: normal_out = 16'h3844;
              5'h03: normal_out = 16'h3844;
              5'h04: normal_out = 16'h3843;
              5'h05: normal_out = 16'h3843;
              5'h06: normal_out = 16'h3843;
              5'h07: normal_out = 16'h3842;
              5'h08: normal_out = 16'h3842;
              5'h09: normal_out = 16'h3841;
              5'h0a: normal_out = 16'h3841;
              5'h0b: normal_out = 16'h3841;
              5'h0c: normal_out = 16'h3840;
              5'h0d: normal_out = 16'h3840;
              5'h0e: normal_out = 16'h3840;
              5'h0f: normal_out = 16'h383f;
              5'h10: normal_out = 16'h383f;
              5'h11: normal_out = 16'h383e;
              5'h12: normal_out = 16'h383e;
              5'h13: normal_out = 16'h383e;
              5'h14: normal_out = 16'h383d;
              5'h15: normal_out = 16'h383d;
              5'h16: normal_out = 16'h383d;
              5'h17: normal_out = 16'h383c;
              5'h18: normal_out = 16'h383c;
              5'h19: normal_out = 16'h383c;
              5'h1a: normal_out = 16'h383b;
              5'h1b: normal_out = 16'h383b;
              5'h1f: normal_out = 16'h3839;
              default: begin end
            endcase
          end
          5'h1b: begin
            normal_out = 16'h382e;
            case (mant[4:0])
              5'h00: normal_out = 16'h3839;
              5'h01: normal_out = 16'h3839;
              5'h02: normal_out = 16'h3838;
              5'h03: normal_out = 16'h3838;
              5'h04: normal_out = 16'h3838;
              5'h05: normal_out = 16'h3837;
              5'h06: normal_out = 16'h3837;
              5'h07: normal_out = 16'h3836;
              5'h08: normal_out = 16'h3836;
              5'h09: normal_out = 16'h3836;
              5'h0a: normal_out = 16'h3835;
              5'h0b: normal_out = 16'h3835;
              5'h0c: normal_out = 16'h3835;
              5'h0d: normal_out = 16'h3834;
              5'h0e: normal_out = 16'h3834;
              5'h0f: normal_out = 16'h3834;
              5'h10: normal_out = 16'h3833;
              5'h11: normal_out = 16'h3833;
              5'h12: normal_out = 16'h3832;
              5'h13: normal_out = 16'h3832;
              5'h14: normal_out = 16'h3832;
              5'h15: normal_out = 16'h3831;
              5'h16: normal_out = 16'h3831;
              5'h17: normal_out = 16'h3831;
              5'h18: normal_out = 16'h3830;
              5'h19: normal_out = 16'h3830;
              5'h1a: normal_out = 16'h3830;
              5'h1b: normal_out = 16'h382f;
              5'h1c: normal_out = 16'h382f;
              default: begin end
            endcase
          end
          5'h1c: begin
            normal_out = 16'h3823;
            case (mant[4:0])
              5'h00: normal_out = 16'h382d;
              5'h01: normal_out = 16'h382d;
              5'h02: normal_out = 16'h382d;
              5'h03: normal_out = 16'h382c;
              5'h04: normal_out = 16'h382c;
              5'h05: normal_out = 16'h382c;
              5'h06: normal_out = 16'h382b;
              5'h07: normal_out = 16'h382b;
              5'h08: normal_out = 16'h382a;
              5'h09: normal_out = 16'h382a;
              5'h0a: normal_out = 16'h382a;
              5'h0b: normal_out = 16'h3829;
              5'h0c: normal_out = 16'h3829;
              5'h0d: normal_out = 16'h3829;
              5'h0e: normal_out = 16'h3828;
              5'h0f: normal_out = 16'h3828;
              5'h10: normal_out = 16'h3828;
              5'h11: normal_out = 16'h3827;
              5'h12: normal_out = 16'h3827;
              5'h13: normal_out = 16'h3826;
              5'h14: normal_out = 16'h3826;
              5'h15: normal_out = 16'h3826;
              5'h16: normal_out = 16'h3825;
              5'h17: normal_out = 16'h3825;
              5'h18: normal_out = 16'h3825;
              5'h19: normal_out = 16'h3824;
              5'h1a: normal_out = 16'h3824;
              5'h1b: normal_out = 16'h3824;
              5'h1f: normal_out = 16'h3822;
              default: begin end
            endcase
          end
          5'h1d: begin
            normal_out = 16'h3817;
            case (mant[4:0])
              5'h00: normal_out = 16'h3822;
              5'h01: normal_out = 16'h3821;
              5'h02: normal_out = 16'h3821;
              5'h03: normal_out = 16'h3821;
              5'h04: normal_out = 16'h3820;
              5'h05: normal_out = 16'h3820;
              5'h06: normal_out = 16'h3820;
              5'h07: normal_out = 16'h381f;
              5'h08: normal_out = 16'h381f;
              5'h09: normal_out = 16'h381f;
              5'h0a: normal_out = 16'h381e;
              5'h0b: normal_out = 16'h381e;
              5'h0c: normal_out = 16'h381e;
              5'h0d: normal_out = 16'h381d;
              5'h0e: normal_out = 16'h381d;
              5'h0f: normal_out = 16'h381c;
              5'h10: normal_out = 16'h381c;
              5'h11: normal_out = 16'h381c;
              5'h12: normal_out = 16'h381b;
              5'h13: normal_out = 16'h381b;
              5'h14: normal_out = 16'h381b;
              5'h15: normal_out = 16'h381a;
              5'h16: normal_out = 16'h381a;
              5'h17: normal_out = 16'h381a;
              5'h18: normal_out = 16'h3819;
              5'h19: normal_out = 16'h3819;
              5'h1a: normal_out = 16'h3819;
              5'h1b: normal_out = 16'h3818;
              5'h1c: normal_out = 16'h3818;
              default: begin end
            endcase
          end
          5'h1e: begin
            normal_out = 16'h380c;
            case (mant[4:0])
              5'h00: normal_out = 16'h3816;
              5'h01: normal_out = 16'h3816;
              5'h02: normal_out = 16'h3816;
              5'h03: normal_out = 16'h3815;
              5'h04: normal_out = 16'h3815;
              5'h05: normal_out = 16'h3815;
              5'h06: normal_out = 16'h3814;
              5'h07: normal_out = 16'h3814;
              5'h08: normal_out = 16'h3814;
              5'h09: normal_out = 16'h3813;
              5'h0a: normal_out = 16'h3813;
              5'h0b: normal_out = 16'h3813;
              5'h0c: normal_out = 16'h3812;
              5'h0d: normal_out = 16'h3812;
              5'h0e: normal_out = 16'h3811;
              5'h0f: normal_out = 16'h3811;
              5'h10: normal_out = 16'h3811;
              5'h11: normal_out = 16'h3810;
              5'h12: normal_out = 16'h3810;
              5'h13: normal_out = 16'h3810;
              5'h14: normal_out = 16'h380f;
              5'h15: normal_out = 16'h380f;
              5'h16: normal_out = 16'h380f;
              5'h17: normal_out = 16'h380e;
              5'h18: normal_out = 16'h380e;
              5'h19: normal_out = 16'h380e;
              5'h1a: normal_out = 16'h380d;
              5'h1b: normal_out = 16'h380d;
              5'h1c: normal_out = 16'h380d;
              default: begin end
            endcase
          end
          5'h1f: begin
            normal_out = 16'h3801;
            case (mant[4:0])
              5'h00: normal_out = 16'h380b;
              5'h01: normal_out = 16'h380b;
              5'h02: normal_out = 16'h380a;
              5'h03: normal_out = 16'h380a;
              5'h04: normal_out = 16'h380a;
              5'h05: normal_out = 16'h3809;
              5'h06: normal_out = 16'h3809;
              5'h07: normal_out = 16'h3809;
              5'h08: normal_out = 16'h3808;
              5'h09: normal_out = 16'h3808;
              5'h0a: normal_out = 16'h3808;
              5'h0b: normal_out = 16'h3807;
              5'h0c: normal_out = 16'h3807;
              5'h0d: normal_out = 16'h3807;
              5'h0e: normal_out = 16'h3806;
              5'h0f: normal_out = 16'h3806;
              5'h10: normal_out = 16'h3806;
              5'h11: normal_out = 16'h3805;
              5'h12: normal_out = 16'h3805;
              5'h13: normal_out = 16'h3805;
              5'h14: normal_out = 16'h3804;
              5'h15: normal_out = 16'h3804;
              5'h16: normal_out = 16'h3803;
              5'h17: normal_out = 16'h3803;
              5'h18: normal_out = 16'h3803;
              5'h19: normal_out = 16'h3802;
              5'h1a: normal_out = 16'h3802;
              5'h1b: normal_out = 16'h3802;
              5'h1f: normal_out = 16'h3800;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      6'h2f: begin
        case (mant[9:5])
          5'h00: begin
            normal_out = 16'h37d5;
            case (mant[4:0])
              5'h00: normal_out = 16'h3800;
              5'h01: normal_out = 16'h37ff;
              5'h02: normal_out = 16'h37fd;
              5'h03: normal_out = 16'h37fc;
              5'h04: normal_out = 16'h37fa;
              5'h05: normal_out = 16'h37f9;
              5'h06: normal_out = 16'h37f8;
              5'h07: normal_out = 16'h37f6;
              5'h08: normal_out = 16'h37f5;
              5'h09: normal_out = 16'h37f4;
              5'h0a: normal_out = 16'h37f2;
              5'h0b: normal_out = 16'h37f1;
              5'h0c: normal_out = 16'h37ef;
              5'h0d: normal_out = 16'h37ee;
              5'h0e: normal_out = 16'h37ed;
              5'h0f: normal_out = 16'h37eb;
              5'h10: normal_out = 16'h37ea;
              5'h11: normal_out = 16'h37e9;
              5'h12: normal_out = 16'h37e7;
              5'h13: normal_out = 16'h37e6;
              5'h14: normal_out = 16'h37e4;
              5'h15: normal_out = 16'h37e3;
              5'h16: normal_out = 16'h37e2;
              5'h17: normal_out = 16'h37e0;
              5'h18: normal_out = 16'h37df;
              5'h19: normal_out = 16'h37de;
              5'h1a: normal_out = 16'h37dc;
              5'h1b: normal_out = 16'h37db;
              5'h1c: normal_out = 16'h37da;
              5'h1d: normal_out = 16'h37d8;
              5'h1e: normal_out = 16'h37d7;
              default: begin end
            endcase
          end
          5'h01: begin
            normal_out = 16'h37aa;
            case (mant[4:0])
              5'h00: normal_out = 16'h37d4;
              5'h01: normal_out = 16'h37d3;
              5'h02: normal_out = 16'h37d1;
              5'h03: normal_out = 16'h37d0;
              5'h04: normal_out = 16'h37cf;
              5'h05: normal_out = 16'h37cd;
              5'h06: normal_out = 16'h37cc;
              5'h07: normal_out = 16'h37cb;
              5'h08: normal_out = 16'h37c9;
              5'h09: normal_out = 16'h37c8;
              5'h0a: normal_out = 16'h37c7;
              5'h0b: normal_out = 16'h37c5;
              5'h0c: normal_out = 16'h37c4;
              5'h0d: normal_out = 16'h37c3;
              5'h0e: normal_out = 16'h37c1;
              5'h0f: normal_out = 16'h37c0;
              5'h10: normal_out = 16'h37bf;
              5'h11: normal_out = 16'h37bd;
              5'h12: normal_out = 16'h37bc;
              5'h13: normal_out = 16'h37bb;
              5'h14: normal_out = 16'h37b9;
              5'h15: normal_out = 16'h37b8;
              5'h16: normal_out = 16'h37b6;
              5'h17: normal_out = 16'h37b5;
              5'h18: normal_out = 16'h37b4;
              5'h19: normal_out = 16'h37b2;
              5'h1a: normal_out = 16'h37b1;
              5'h1b: normal_out = 16'h37b0;
              5'h1c: normal_out = 16'h37ae;
              5'h1d: normal_out = 16'h37ad;
              5'h1e: normal_out = 16'h37ac;
              default: begin end
            endcase
          end
          5'h02: begin
            normal_out = 16'h3780;
            case (mant[4:0])
              5'h00: normal_out = 16'h37a9;
              5'h01: normal_out = 16'h37a8;
              5'h02: normal_out = 16'h37a7;
              5'h03: normal_out = 16'h37a5;
              5'h04: normal_out = 16'h37a4;
              5'h05: normal_out = 16'h37a3;
              5'h06: normal_out = 16'h37a1;
              5'h07: normal_out = 16'h37a0;
              5'h08: normal_out = 16'h379f;
              5'h09: normal_out = 16'h379d;
              5'h0a: normal_out = 16'h379c;
              5'h0b: normal_out = 16'h379b;
              5'h0c: normal_out = 16'h3799;
              5'h0d: normal_out = 16'h3798;
              5'h0e: normal_out = 16'h3797;
              5'h0f: normal_out = 16'h3795;
              5'h10: normal_out = 16'h3794;
              5'h11: normal_out = 16'h3793;
              5'h12: normal_out = 16'h3791;
              5'h13: normal_out = 16'h3790;
              5'h14: normal_out = 16'h378f;
              5'h15: normal_out = 16'h378d;
              5'h16: normal_out = 16'h378c;
              5'h17: normal_out = 16'h378b;
              5'h18: normal_out = 16'h378a;
              5'h19: normal_out = 16'h3788;
              5'h1a: normal_out = 16'h3787;
              5'h1b: normal_out = 16'h3786;
              5'h1c: normal_out = 16'h3784;
              5'h1d: normal_out = 16'h3783;
              5'h1e: normal_out = 16'h3782;
              default: begin end
            endcase
          end
          5'h03: begin
            normal_out = 16'h3757;
            case (mant[4:0])
              5'h00: normal_out = 16'h377f;
              5'h01: normal_out = 16'h377e;
              5'h02: normal_out = 16'h377d;
              5'h03: normal_out = 16'h377b;
              5'h04: normal_out = 16'h377a;
              5'h05: normal_out = 16'h3779;
              5'h06: normal_out = 16'h3777;
              5'h07: normal_out = 16'h3776;
              5'h08: normal_out = 16'h3775;
              5'h09: normal_out = 16'h3773;
              5'h0a: normal_out = 16'h3772;
              5'h0b: normal_out = 16'h3771;
              5'h0c: normal_out = 16'h3770;
              5'h0d: normal_out = 16'h376e;
              5'h0e: normal_out = 16'h376d;
              5'h0f: normal_out = 16'h376c;
              5'h10: normal_out = 16'h376a;
              5'h11: normal_out = 16'h3769;
              5'h12: normal_out = 16'h3768;
              5'h13: normal_out = 16'h3767;
              5'h14: normal_out = 16'h3765;
              5'h15: normal_out = 16'h3764;
              5'h16: normal_out = 16'h3763;
              5'h17: normal_out = 16'h3762;
              5'h18: normal_out = 16'h3760;
              5'h19: normal_out = 16'h375f;
              5'h1a: normal_out = 16'h375e;
              5'h1b: normal_out = 16'h375c;
              5'h1c: normal_out = 16'h375b;
              5'h1d: normal_out = 16'h375a;
              5'h1e: normal_out = 16'h3759;
              default: begin end
            endcase
          end
          5'h04: begin
            normal_out = 16'h372f;
            case (mant[4:0])
              5'h00: normal_out = 16'h3756;
              5'h01: normal_out = 16'h3755;
              5'h02: normal_out = 16'h3753;
              5'h03: normal_out = 16'h3752;
              5'h04: normal_out = 16'h3751;
              5'h05: normal_out = 16'h3750;
              5'h06: normal_out = 16'h374e;
              5'h07: normal_out = 16'h374d;
              5'h08: normal_out = 16'h374c;
              5'h09: normal_out = 16'h374b;
              5'h0a: normal_out = 16'h3749;
              5'h0b: normal_out = 16'h3748;
              5'h0c: normal_out = 16'h3747;
              5'h0d: normal_out = 16'h3746;
              5'h0e: normal_out = 16'h3744;
              5'h0f: normal_out = 16'h3743;
              5'h10: normal_out = 16'h3742;
              5'h11: normal_out = 16'h3741;
              5'h12: normal_out = 16'h373f;
              5'h13: normal_out = 16'h373e;
              5'h14: normal_out = 16'h373d;
              5'h15: normal_out = 16'h373c;
              5'h16: normal_out = 16'h373a;
              5'h17: normal_out = 16'h3739;
              5'h18: normal_out = 16'h3738;
              5'h19: normal_out = 16'h3737;
              5'h1a: normal_out = 16'h3735;
              5'h1b: normal_out = 16'h3734;
              5'h1c: normal_out = 16'h3733;
              5'h1d: normal_out = 16'h3732;
              5'h1e: normal_out = 16'h3730;
              default: begin end
            endcase
          end
          5'h05: begin
            normal_out = 16'h3708;
            case (mant[4:0])
              5'h00: normal_out = 16'h372e;
              5'h01: normal_out = 16'h372d;
              5'h02: normal_out = 16'h372b;
              5'h03: normal_out = 16'h372a;
              5'h04: normal_out = 16'h3729;
              5'h05: normal_out = 16'h3728;
              5'h06: normal_out = 16'h3726;
              5'h07: normal_out = 16'h3725;
              5'h08: normal_out = 16'h3724;
              5'h09: normal_out = 16'h3723;
              5'h0a: normal_out = 16'h3721;
              5'h0b: normal_out = 16'h3720;
              5'h0c: normal_out = 16'h371f;
              5'h0d: normal_out = 16'h371e;
              5'h0e: normal_out = 16'h371c;
              5'h0f: normal_out = 16'h371b;
              5'h10: normal_out = 16'h371a;
              5'h11: normal_out = 16'h3719;
              5'h12: normal_out = 16'h3718;
              5'h13: normal_out = 16'h3716;
              5'h14: normal_out = 16'h3715;
              5'h15: normal_out = 16'h3714;
              5'h16: normal_out = 16'h3713;
              5'h17: normal_out = 16'h3711;
              5'h18: normal_out = 16'h3710;
              5'h19: normal_out = 16'h370f;
              5'h1a: normal_out = 16'h370e;
              5'h1b: normal_out = 16'h370c;
              5'h1c: normal_out = 16'h370b;
              5'h1d: normal_out = 16'h370a;
              5'h1e: normal_out = 16'h3709;
              default: begin end
            endcase
          end
          5'h06: begin
            normal_out = 16'h36e1;
            case (mant[4:0])
              5'h00: normal_out = 16'h3706;
              5'h01: normal_out = 16'h3705;
              5'h02: normal_out = 16'h3704;
              5'h03: normal_out = 16'h3703;
              5'h04: normal_out = 16'h3702;
              5'h05: normal_out = 16'h3700;
              5'h06: normal_out = 16'h36ff;
              5'h07: normal_out = 16'h36fe;
              5'h08: normal_out = 16'h36fd;
              5'h09: normal_out = 16'h36fb;
              5'h0a: normal_out = 16'h36fa;
              5'h0b: normal_out = 16'h36f9;
              5'h0c: normal_out = 16'h36f8;
              5'h0d: normal_out = 16'h36f7;
              5'h0e: normal_out = 16'h36f5;
              5'h0f: normal_out = 16'h36f4;
              5'h10: normal_out = 16'h36f3;
              5'h11: normal_out = 16'h36f2;
              5'h12: normal_out = 16'h36f1;
              5'h13: normal_out = 16'h36ef;
              5'h14: normal_out = 16'h36ee;
              5'h15: normal_out = 16'h36ed;
              5'h16: normal_out = 16'h36ec;
              5'h17: normal_out = 16'h36eb;
              5'h18: normal_out = 16'h36e9;
              5'h19: normal_out = 16'h36e8;
              5'h1a: normal_out = 16'h36e7;
              5'h1b: normal_out = 16'h36e6;
              5'h1c: normal_out = 16'h36e5;
              5'h1d: normal_out = 16'h36e3;
              5'h1e: normal_out = 16'h36e2;
              default: begin end
            endcase
          end
          5'h07: begin
            normal_out = 16'h36bb;
            case (mant[4:0])
              5'h00: normal_out = 16'h36e0;
              5'h01: normal_out = 16'h36df;
              5'h02: normal_out = 16'h36dd;
              5'h03: normal_out = 16'h36dc;
              5'h04: normal_out = 16'h36db;
              5'h05: normal_out = 16'h36da;
              5'h06: normal_out = 16'h36d9;
              5'h07: normal_out = 16'h36d8;
              5'h08: normal_out = 16'h36d6;
              5'h09: normal_out = 16'h36d5;
              5'h0a: normal_out = 16'h36d4;
              5'h0b: normal_out = 16'h36d3;
              5'h0c: normal_out = 16'h36d2;
              5'h0d: normal_out = 16'h36d0;
              5'h0e: normal_out = 16'h36cf;
              5'h0f: normal_out = 16'h36ce;
              5'h10: normal_out = 16'h36cd;
              5'h11: normal_out = 16'h36cc;
              5'h12: normal_out = 16'h36cb;
              5'h13: normal_out = 16'h36c9;
              5'h14: normal_out = 16'h36c8;
              5'h15: normal_out = 16'h36c7;
              5'h16: normal_out = 16'h36c6;
              5'h17: normal_out = 16'h36c5;
              5'h18: normal_out = 16'h36c4;
              5'h19: normal_out = 16'h36c2;
              5'h1a: normal_out = 16'h36c1;
              5'h1b: normal_out = 16'h36c0;
              5'h1c: normal_out = 16'h36bf;
              5'h1d: normal_out = 16'h36be;
              5'h1e: normal_out = 16'h36bc;
              default: begin end
            endcase
          end
          5'h08: begin
            normal_out = 16'h3696;
            case (mant[4:0])
              5'h00: normal_out = 16'h36ba;
              5'h01: normal_out = 16'h36b9;
              5'h02: normal_out = 16'h36b8;
              5'h03: normal_out = 16'h36b7;
              5'h04: normal_out = 16'h36b5;
              5'h05: normal_out = 16'h36b4;
              5'h06: normal_out = 16'h36b3;
              5'h07: normal_out = 16'h36b2;
              5'h08: normal_out = 16'h36b1;
              5'h09: normal_out = 16'h36b0;
              5'h0a: normal_out = 16'h36af;
              5'h0b: normal_out = 16'h36ad;
              5'h0c: normal_out = 16'h36ac;
              5'h0d: normal_out = 16'h36ab;
              5'h0e: normal_out = 16'h36aa;
              5'h0f: normal_out = 16'h36a9;
              5'h10: normal_out = 16'h36a8;
              5'h11: normal_out = 16'h36a6;
              5'h12: normal_out = 16'h36a5;
              5'h13: normal_out = 16'h36a4;
              5'h14: normal_out = 16'h36a3;
              5'h15: normal_out = 16'h36a2;
              5'h16: normal_out = 16'h36a1;
              5'h17: normal_out = 16'h36a0;
              5'h18: normal_out = 16'h369e;
              5'h19: normal_out = 16'h369d;
              5'h1a: normal_out = 16'h369c;
              5'h1b: normal_out = 16'h369b;
              5'h1c: normal_out = 16'h369a;
              5'h1d: normal_out = 16'h3699;
              5'h1e: normal_out = 16'h3698;
              default: begin end
            endcase
          end
          5'h09: begin
            normal_out = 16'h3672;
            case (mant[4:0])
              5'h00: normal_out = 16'h3695;
              5'h01: normal_out = 16'h3694;
              5'h02: normal_out = 16'h3693;
              5'h03: normal_out = 16'h3692;
              5'h04: normal_out = 16'h3691;
              5'h05: normal_out = 16'h3690;
              5'h06: normal_out = 16'h368e;
              5'h07: normal_out = 16'h368d;
              5'h08: normal_out = 16'h368c;
              5'h09: normal_out = 16'h368b;
              5'h0a: normal_out = 16'h368a;
              5'h0b: normal_out = 16'h3689;
              5'h0c: normal_out = 16'h3688;
              5'h0d: normal_out = 16'h3686;
              5'h0e: normal_out = 16'h3685;
              5'h0f: normal_out = 16'h3684;
              5'h10: normal_out = 16'h3683;
              5'h11: normal_out = 16'h3682;
              5'h12: normal_out = 16'h3681;
              5'h13: normal_out = 16'h3680;
              5'h14: normal_out = 16'h367f;
              5'h15: normal_out = 16'h367d;
              5'h16: normal_out = 16'h367c;
              5'h17: normal_out = 16'h367b;
              5'h18: normal_out = 16'h367a;
              5'h19: normal_out = 16'h3679;
              5'h1a: normal_out = 16'h3678;
              5'h1b: normal_out = 16'h3677;
              5'h1c: normal_out = 16'h3676;
              5'h1d: normal_out = 16'h3674;
              5'h1e: normal_out = 16'h3673;
              default: begin end
            endcase
          end
          5'h0a: begin
            normal_out = 16'h364f;
            case (mant[4:0])
              5'h00: normal_out = 16'h3671;
              5'h01: normal_out = 16'h3670;
              5'h02: normal_out = 16'h366f;
              5'h03: normal_out = 16'h366e;
              5'h04: normal_out = 16'h366d;
              5'h05: normal_out = 16'h366c;
              5'h06: normal_out = 16'h366a;
              5'h07: normal_out = 16'h3669;
              5'h08: normal_out = 16'h3668;
              5'h09: normal_out = 16'h3667;
              5'h0a: normal_out = 16'h3666;
              5'h0b: normal_out = 16'h3665;
              5'h0c: normal_out = 16'h3664;
              5'h0d: normal_out = 16'h3663;
              5'h0e: normal_out = 16'h3662;
              5'h0f: normal_out = 16'h3660;
              5'h10: normal_out = 16'h365f;
              5'h11: normal_out = 16'h365e;
              5'h12: normal_out = 16'h365d;
              5'h13: normal_out = 16'h365c;
              5'h14: normal_out = 16'h365b;
              5'h15: normal_out = 16'h365a;
              5'h16: normal_out = 16'h3659;
              5'h17: normal_out = 16'h3658;
              5'h18: normal_out = 16'h3657;
              5'h19: normal_out = 16'h3655;
              5'h1a: normal_out = 16'h3654;
              5'h1b: normal_out = 16'h3653;
              5'h1c: normal_out = 16'h3652;
              5'h1d: normal_out = 16'h3651;
              5'h1e: normal_out = 16'h3650;
              default: begin end
            endcase
          end
          5'h0b: begin
            normal_out = 16'h362c;
            case (mant[4:0])
              5'h00: normal_out = 16'h364e;
              5'h01: normal_out = 16'h364d;
              5'h02: normal_out = 16'h364c;
              5'h03: normal_out = 16'h364b;
              5'h04: normal_out = 16'h3649;
              5'h05: normal_out = 16'h3648;
              5'h06: normal_out = 16'h3647;
              5'h07: normal_out = 16'h3646;
              5'h08: normal_out = 16'h3645;
              5'h09: normal_out = 16'h3644;
              5'h0a: normal_out = 16'h3643;
              5'h0b: normal_out = 16'h3642;
              5'h0c: normal_out = 16'h3641;
              5'h0d: normal_out = 16'h3640;
              5'h0e: normal_out = 16'h363f;
              5'h0f: normal_out = 16'h363e;
              5'h10: normal_out = 16'h363c;
              5'h11: normal_out = 16'h363b;
              5'h12: normal_out = 16'h363a;
              5'h13: normal_out = 16'h3639;
              5'h14: normal_out = 16'h3638;
              5'h15: normal_out = 16'h3637;
              5'h16: normal_out = 16'h3636;
              5'h17: normal_out = 16'h3635;
              5'h18: normal_out = 16'h3634;
              5'h19: normal_out = 16'h3633;
              5'h1a: normal_out = 16'h3632;
              5'h1b: normal_out = 16'h3631;
              5'h1c: normal_out = 16'h3630;
              5'h1d: normal_out = 16'h362e;
              5'h1e: normal_out = 16'h362d;
              default: begin end
            endcase
          end
          5'h0c: begin
            normal_out = 16'h360a;
            case (mant[4:0])
              5'h00: normal_out = 16'h362b;
              5'h01: normal_out = 16'h362a;
              5'h02: normal_out = 16'h3629;
              5'h03: normal_out = 16'h3628;
              5'h04: normal_out = 16'h3627;
              5'h05: normal_out = 16'h3626;
              5'h06: normal_out = 16'h3625;
              5'h07: normal_out = 16'h3624;
              5'h08: normal_out = 16'h3623;
              5'h09: normal_out = 16'h3622;
              5'h0a: normal_out = 16'h3621;
              5'h0b: normal_out = 16'h3620;
              5'h0c: normal_out = 16'h361e;
              5'h0d: normal_out = 16'h361d;
              5'h0e: normal_out = 16'h361c;
              5'h0f: normal_out = 16'h361b;
              5'h10: normal_out = 16'h361a;
              5'h11: normal_out = 16'h3619;
              5'h12: normal_out = 16'h3618;
              5'h13: normal_out = 16'h3617;
              5'h14: normal_out = 16'h3616;
              5'h15: normal_out = 16'h3615;
              5'h16: normal_out = 16'h3614;
              5'h17: normal_out = 16'h3613;
              5'h18: normal_out = 16'h3612;
              5'h19: normal_out = 16'h3611;
              5'h1a: normal_out = 16'h3610;
              5'h1b: normal_out = 16'h360f;
              5'h1c: normal_out = 16'h360e;
              5'h1d: normal_out = 16'h360d;
              5'h1e: normal_out = 16'h360b;
              default: begin end
            endcase
          end
          5'h0d: begin
            normal_out = 16'h35e9;
            case (mant[4:0])
              5'h00: normal_out = 16'h3609;
              5'h01: normal_out = 16'h3608;
              5'h02: normal_out = 16'h3607;
              5'h03: normal_out = 16'h3606;
              5'h04: normal_out = 16'h3605;
              5'h05: normal_out = 16'h3604;
              5'h06: normal_out = 16'h3603;
              5'h07: normal_out = 16'h3602;
              5'h08: normal_out = 16'h3601;
              5'h09: normal_out = 16'h3600;
              5'h0a: normal_out = 16'h35ff;
              5'h0b: normal_out = 16'h35fe;
              5'h0c: normal_out = 16'h35fd;
              5'h0d: normal_out = 16'h35fc;
              5'h0e: normal_out = 16'h35fb;
              5'h0f: normal_out = 16'h35fa;
              5'h10: normal_out = 16'h35f9;
              5'h11: normal_out = 16'h35f8;
              5'h12: normal_out = 16'h35f7;
              5'h13: normal_out = 16'h35f6;
              5'h14: normal_out = 16'h35f5;
              5'h15: normal_out = 16'h35f4;
              5'h16: normal_out = 16'h35f3;
              5'h17: normal_out = 16'h35f2;
              5'h18: normal_out = 16'h35f0;
              5'h19: normal_out = 16'h35ef;
              5'h1a: normal_out = 16'h35ee;
              5'h1b: normal_out = 16'h35ed;
              5'h1c: normal_out = 16'h35ec;
              5'h1d: normal_out = 16'h35eb;
              5'h1e: normal_out = 16'h35ea;
              default: begin end
            endcase
          end
          5'h0e: begin
            normal_out = 16'h35c9;
            case (mant[4:0])
              5'h00: normal_out = 16'h35e8;
              5'h01: normal_out = 16'h35e7;
              5'h02: normal_out = 16'h35e6;
              5'h03: normal_out = 16'h35e5;
              5'h04: normal_out = 16'h35e4;
              5'h05: normal_out = 16'h35e3;
              5'h06: normal_out = 16'h35e2;
              5'h07: normal_out = 16'h35e1;
              5'h08: normal_out = 16'h35e0;
              5'h09: normal_out = 16'h35df;
              5'h0a: normal_out = 16'h35de;
              5'h0b: normal_out = 16'h35dd;
              5'h0c: normal_out = 16'h35dc;
              5'h0d: normal_out = 16'h35db;
              5'h0e: normal_out = 16'h35da;
              5'h0f: normal_out = 16'h35d9;
              5'h10: normal_out = 16'h35d8;
              5'h11: normal_out = 16'h35d7;
              5'h12: normal_out = 16'h35d6;
              5'h13: normal_out = 16'h35d5;
              5'h14: normal_out = 16'h35d4;
              5'h15: normal_out = 16'h35d3;
              5'h16: normal_out = 16'h35d2;
              5'h17: normal_out = 16'h35d1;
              5'h18: normal_out = 16'h35d0;
              5'h19: normal_out = 16'h35cf;
              5'h1a: normal_out = 16'h35ce;
              5'h1b: normal_out = 16'h35cd;
              5'h1c: normal_out = 16'h35cc;
              5'h1d: normal_out = 16'h35cb;
              5'h1e: normal_out = 16'h35ca;
              default: begin end
            endcase
          end
          5'h0f: begin
            normal_out = 16'h35a9;
            case (mant[4:0])
              5'h00: normal_out = 16'h35c8;
              5'h01: normal_out = 16'h35c7;
              5'h02: normal_out = 16'h35c6;
              5'h03: normal_out = 16'h35c5;
              5'h04: normal_out = 16'h35c4;
              5'h05: normal_out = 16'h35c3;
              5'h06: normal_out = 16'h35c2;
              5'h07: normal_out = 16'h35c1;
              5'h08: normal_out = 16'h35c0;
              5'h09: normal_out = 16'h35bf;
              5'h0a: normal_out = 16'h35be;
              5'h0b: normal_out = 16'h35bd;
              5'h0c: normal_out = 16'h35bc;
              5'h0d: normal_out = 16'h35bb;
              5'h0e: normal_out = 16'h35ba;
              5'h0f: normal_out = 16'h35b9;
              5'h10: normal_out = 16'h35b8;
              5'h11: normal_out = 16'h35b7;
              5'h12: normal_out = 16'h35b6;
              5'h13: normal_out = 16'h35b5;
              5'h14: normal_out = 16'h35b4;
              5'h15: normal_out = 16'h35b3;
              5'h16: normal_out = 16'h35b2;
              5'h17: normal_out = 16'h35b1;
              5'h18: normal_out = 16'h35b0;
              5'h19: normal_out = 16'h35af;
              5'h1a: normal_out = 16'h35ae;
              5'h1b: normal_out = 16'h35ad;
              5'h1c: normal_out = 16'h35ac;
              5'h1d: normal_out = 16'h35ab;
              5'h1e: normal_out = 16'h35aa;
              default: begin end
            endcase
          end
          5'h10: begin
            normal_out = 16'h359a;
            case (mant[4:0])
              5'h00: normal_out = 16'h35a8;
              5'h01: normal_out = 16'h35a7;
              5'h02: normal_out = 16'h35a6;
              5'h03: normal_out = 16'h35a5;
              5'h04: normal_out = 16'h35a4;
              5'h05: normal_out = 16'h35a3;
              5'h06: normal_out = 16'h35a2;
              5'h07: normal_out = 16'h35a1;
              5'h08: normal_out = 16'h35a0;
              5'h09: normal_out = 16'h359f;
              5'h0a: normal_out = 16'h359e;
              5'h0b: normal_out = 16'h359d;
              5'h0c: normal_out = 16'h359c;
              5'h0d: normal_out = 16'h359b;
              5'h10: normal_out = 16'h3599;
              5'h11: normal_out = 16'h3598;
              5'h12: normal_out = 16'h3597;
              5'h13: normal_out = 16'h3596;
              5'h14: normal_out = 16'h3595;
              5'h15: normal_out = 16'h3594;
              5'h16: normal_out = 16'h3593;
              5'h17: normal_out = 16'h3592;
              5'h18: normal_out = 16'h3591;
              5'h19: normal_out = 16'h3590;
              5'h1a: normal_out = 16'h358f;
              5'h1b: normal_out = 16'h358e;
              5'h1c: normal_out = 16'h358d;
              5'h1d: normal_out = 16'h358c;
              5'h1e: normal_out = 16'h358b;
              5'h1f: normal_out = 16'h358a;
              default: begin end
            endcase
          end
          5'h11: begin
            normal_out = 16'h356f;
            case (mant[4:0])
              5'h00: normal_out = 16'h3589;
              5'h01: normal_out = 16'h3588;
              5'h02: normal_out = 16'h3587;
              5'h03: normal_out = 16'h3586;
              5'h04: normal_out = 16'h3585;
              5'h05: normal_out = 16'h3584;
              5'h06: normal_out = 16'h3583;
              5'h07: normal_out = 16'h3582;
              5'h08: normal_out = 16'h3581;
              5'h09: normal_out = 16'h3581;
              5'h0a: normal_out = 16'h3580;
              5'h0b: normal_out = 16'h357f;
              5'h0c: normal_out = 16'h357e;
              5'h0d: normal_out = 16'h357d;
              5'h0e: normal_out = 16'h357c;
              5'h0f: normal_out = 16'h357b;
              5'h10: normal_out = 16'h357a;
              5'h11: normal_out = 16'h3579;
              5'h12: normal_out = 16'h3578;
              5'h13: normal_out = 16'h3577;
              5'h14: normal_out = 16'h3576;
              5'h15: normal_out = 16'h3575;
              5'h16: normal_out = 16'h3574;
              5'h17: normal_out = 16'h3573;
              5'h18: normal_out = 16'h3572;
              5'h19: normal_out = 16'h3571;
              5'h1a: normal_out = 16'h3570;
              5'h1d: normal_out = 16'h356e;
              5'h1e: normal_out = 16'h356d;
              5'h1f: normal_out = 16'h356c;
              default: begin end
            endcase
          end
          5'h12: begin
            normal_out = 16'h3553;
            case (mant[4:0])
              5'h00: normal_out = 16'h356b;
              5'h01: normal_out = 16'h356a;
              5'h02: normal_out = 16'h3569;
              5'h03: normal_out = 16'h3568;
              5'h04: normal_out = 16'h3567;
              5'h05: normal_out = 16'h3566;
              5'h06: normal_out = 16'h3565;
              5'h07: normal_out = 16'h3564;
              5'h08: normal_out = 16'h3563;
              5'h09: normal_out = 16'h3562;
              5'h0a: normal_out = 16'h3561;
              5'h0b: normal_out = 16'h3560;
              5'h0c: normal_out = 16'h3560;
              5'h0d: normal_out = 16'h355f;
              5'h0e: normal_out = 16'h355e;
              5'h0f: normal_out = 16'h355d;
              5'h10: normal_out = 16'h355c;
              5'h11: normal_out = 16'h355b;
              5'h12: normal_out = 16'h355a;
              5'h13: normal_out = 16'h3559;
              5'h14: normal_out = 16'h3558;
              5'h15: normal_out = 16'h3557;
              5'h16: normal_out = 16'h3556;
              5'h17: normal_out = 16'h3555;
              5'h18: normal_out = 16'h3554;
              5'h1b: normal_out = 16'h3552;
              5'h1c: normal_out = 16'h3551;
              5'h1d: normal_out = 16'h3550;
              5'h1e: normal_out = 16'h354f;
              5'h1f: normal_out = 16'h354e;
              default: begin end
            endcase
          end
          5'h13: begin
            normal_out = 16'h3534;
            case (mant[4:0])
              5'h00: normal_out = 16'h354d;
              5'h01: normal_out = 16'h354c;
              5'h02: normal_out = 16'h354b;
              5'h03: normal_out = 16'h354a;
              5'h04: normal_out = 16'h3549;
              5'h05: normal_out = 16'h3548;
              5'h06: normal_out = 16'h3548;
              5'h07: normal_out = 16'h3547;
              5'h08: normal_out = 16'h3546;
              5'h09: normal_out = 16'h3545;
              5'h0a: normal_out = 16'h3544;
              5'h0b: normal_out = 16'h3543;
              5'h0c: normal_out = 16'h3542;
              5'h0d: normal_out = 16'h3541;
              5'h0e: normal_out = 16'h3540;
              5'h0f: normal_out = 16'h353f;
              5'h10: normal_out = 16'h353e;
              5'h11: normal_out = 16'h353e;
              5'h12: normal_out = 16'h353d;
              5'h13: normal_out = 16'h353c;
              5'h14: normal_out = 16'h353b;
              5'h15: normal_out = 16'h353a;
              5'h16: normal_out = 16'h3539;
              5'h17: normal_out = 16'h3538;
              5'h18: normal_out = 16'h3537;
              5'h19: normal_out = 16'h3536;
              5'h1a: normal_out = 16'h3535;
              5'h1d: normal_out = 16'h3533;
              5'h1e: normal_out = 16'h3532;
              5'h1f: normal_out = 16'h3531;
              default: begin end
            endcase
          end
          5'h14: begin
            normal_out = 16'h351b;
            case (mant[4:0])
              5'h00: normal_out = 16'h3530;
              5'h01: normal_out = 16'h352f;
              5'h02: normal_out = 16'h352e;
              5'h03: normal_out = 16'h352d;
              5'h04: normal_out = 16'h352c;
              5'h05: normal_out = 16'h352b;
              5'h06: normal_out = 16'h352b;
              5'h07: normal_out = 16'h352a;
              5'h08: normal_out = 16'h3529;
              5'h09: normal_out = 16'h3528;
              5'h0a: normal_out = 16'h3527;
              5'h0b: normal_out = 16'h3526;
              5'h0c: normal_out = 16'h3525;
              5'h0d: normal_out = 16'h3524;
              5'h0e: normal_out = 16'h3523;
              5'h0f: normal_out = 16'h3523;
              5'h10: normal_out = 16'h3522;
              5'h11: normal_out = 16'h3521;
              5'h12: normal_out = 16'h3520;
              5'h13: normal_out = 16'h351f;
              5'h14: normal_out = 16'h351e;
              5'h15: normal_out = 16'h351d;
              5'h16: normal_out = 16'h351c;
              5'h19: normal_out = 16'h351a;
              5'h1a: normal_out = 16'h3519;
              5'h1b: normal_out = 16'h3518;
              5'h1c: normal_out = 16'h3517;
              5'h1d: normal_out = 16'h3516;
              5'h1e: normal_out = 16'h3515;
              5'h1f: normal_out = 16'h3514;
              default: begin end
            endcase
          end
          5'h15: begin
            normal_out = 16'h34f9;
            case (mant[4:0])
              5'h00: normal_out = 16'h3514;
              5'h01: normal_out = 16'h3513;
              5'h02: normal_out = 16'h3512;
              5'h03: normal_out = 16'h3511;
              5'h04: normal_out = 16'h3510;
              5'h05: normal_out = 16'h350f;
              5'h06: normal_out = 16'h350e;
              5'h07: normal_out = 16'h350d;
              5'h08: normal_out = 16'h350c;
              5'h09: normal_out = 16'h350c;
              5'h0a: normal_out = 16'h350b;
              5'h0b: normal_out = 16'h350a;
              5'h0c: normal_out = 16'h3509;
              5'h0d: normal_out = 16'h3508;
              5'h0e: normal_out = 16'h3507;
              5'h0f: normal_out = 16'h3506;
              5'h10: normal_out = 16'h3506;
              5'h11: normal_out = 16'h3505;
              5'h12: normal_out = 16'h3504;
              5'h13: normal_out = 16'h3503;
              5'h14: normal_out = 16'h3502;
              5'h15: normal_out = 16'h3501;
              5'h16: normal_out = 16'h3500;
              5'h17: normal_out = 16'h34ff;
              5'h18: normal_out = 16'h34ff;
              5'h19: normal_out = 16'h34fe;
              5'h1a: normal_out = 16'h34fd;
              5'h1b: normal_out = 16'h34fc;
              5'h1c: normal_out = 16'h34fb;
              5'h1d: normal_out = 16'h34fa;
              default: begin end
            endcase
          end
          5'h16: begin
            normal_out = 16'h34e1;
            case (mant[4:0])
              5'h00: normal_out = 16'h34f8;
              5'h01: normal_out = 16'h34f7;
              5'h02: normal_out = 16'h34f6;
              5'h03: normal_out = 16'h34f5;
              5'h04: normal_out = 16'h34f4;
              5'h05: normal_out = 16'h34f3;
              5'h06: normal_out = 16'h34f3;
              5'h07: normal_out = 16'h34f2;
              5'h08: normal_out = 16'h34f1;
              5'h09: normal_out = 16'h34f0;
              5'h0a: normal_out = 16'h34ef;
              5'h0b: normal_out = 16'h34ee;
              5'h0c: normal_out = 16'h34ed;
              5'h0d: normal_out = 16'h34ed;
              5'h0e: normal_out = 16'h34ec;
              5'h0f: normal_out = 16'h34eb;
              5'h10: normal_out = 16'h34ea;
              5'h11: normal_out = 16'h34e9;
              5'h12: normal_out = 16'h34e8;
              5'h13: normal_out = 16'h34e7;
              5'h14: normal_out = 16'h34e7;
              5'h15: normal_out = 16'h34e6;
              5'h16: normal_out = 16'h34e5;
              5'h17: normal_out = 16'h34e4;
              5'h18: normal_out = 16'h34e3;
              5'h19: normal_out = 16'h34e2;
              5'h1c: normal_out = 16'h34e0;
              5'h1d: normal_out = 16'h34df;
              5'h1e: normal_out = 16'h34de;
              5'h1f: normal_out = 16'h34dd;
              default: begin end
            endcase
          end
          5'h17: begin
            normal_out = 16'h34c3;
            case (mant[4:0])
              5'h00: normal_out = 16'h34dc;
              5'h01: normal_out = 16'h34dc;
              5'h02: normal_out = 16'h34db;
              5'h03: normal_out = 16'h34da;
              5'h04: normal_out = 16'h34d9;
              5'h05: normal_out = 16'h34d8;
              5'h06: normal_out = 16'h34d7;
              5'h07: normal_out = 16'h34d7;
              5'h08: normal_out = 16'h34d6;
              5'h09: normal_out = 16'h34d5;
              5'h0a: normal_out = 16'h34d4;
              5'h0b: normal_out = 16'h34d3;
              5'h0c: normal_out = 16'h34d2;
              5'h0d: normal_out = 16'h34d2;
              5'h0e: normal_out = 16'h34d1;
              5'h0f: normal_out = 16'h34d0;
              5'h10: normal_out = 16'h34cf;
              5'h11: normal_out = 16'h34ce;
              5'h12: normal_out = 16'h34cd;
              5'h13: normal_out = 16'h34cd;
              5'h14: normal_out = 16'h34cc;
              5'h15: normal_out = 16'h34cb;
              5'h16: normal_out = 16'h34ca;
              5'h17: normal_out = 16'h34c9;
              5'h18: normal_out = 16'h34c8;
              5'h19: normal_out = 16'h34c8;
              5'h1a: normal_out = 16'h34c7;
              5'h1b: normal_out = 16'h34c6;
              5'h1c: normal_out = 16'h34c5;
              5'h1d: normal_out = 16'h34c4;
              default: begin end
            endcase
          end
          5'h18: begin
            normal_out = 16'h34ad;
            case (mant[4:0])
              5'h00: normal_out = 16'h34c2;
              5'h01: normal_out = 16'h34c1;
              5'h02: normal_out = 16'h34c0;
              5'h03: normal_out = 16'h34bf;
              5'h04: normal_out = 16'h34be;
              5'h05: normal_out = 16'h34be;
              5'h06: normal_out = 16'h34bd;
              5'h07: normal_out = 16'h34bc;
              5'h08: normal_out = 16'h34bb;
              5'h09: normal_out = 16'h34ba;
              5'h0a: normal_out = 16'h34ba;
              5'h0b: normal_out = 16'h34b9;
              5'h0c: normal_out = 16'h34b8;
              5'h0d: normal_out = 16'h34b7;
              5'h0e: normal_out = 16'h34b6;
              5'h0f: normal_out = 16'h34b5;
              5'h10: normal_out = 16'h34b5;
              5'h11: normal_out = 16'h34b4;
              5'h12: normal_out = 16'h34b3;
              5'h13: normal_out = 16'h34b2;
              5'h14: normal_out = 16'h34b1;
              5'h15: normal_out = 16'h34b1;
              5'h16: normal_out = 16'h34b0;
              5'h17: normal_out = 16'h34af;
              5'h18: normal_out = 16'h34ae;
              5'h1b: normal_out = 16'h34ac;
              5'h1c: normal_out = 16'h34ab;
              5'h1d: normal_out = 16'h34aa;
              5'h1e: normal_out = 16'h34a9;
              5'h1f: normal_out = 16'h34a8;
              default: begin end
            endcase
          end
          5'h19: begin
            normal_out = 16'h3490;
            case (mant[4:0])
              5'h00: normal_out = 16'h34a8;
              5'h01: normal_out = 16'h34a7;
              5'h02: normal_out = 16'h34a6;
              5'h03: normal_out = 16'h34a5;
              5'h04: normal_out = 16'h34a4;
              5'h05: normal_out = 16'h34a4;
              5'h06: normal_out = 16'h34a3;
              5'h07: normal_out = 16'h34a2;
              5'h08: normal_out = 16'h34a1;
              5'h09: normal_out = 16'h34a0;
              5'h0a: normal_out = 16'h34a0;
              5'h0b: normal_out = 16'h349f;
              5'h0c: normal_out = 16'h349e;
              5'h0d: normal_out = 16'h349d;
              5'h0e: normal_out = 16'h349c;
              5'h0f: normal_out = 16'h349c;
              5'h10: normal_out = 16'h349b;
              5'h11: normal_out = 16'h349a;
              5'h12: normal_out = 16'h3499;
              5'h13: normal_out = 16'h3498;
              5'h14: normal_out = 16'h3498;
              5'h15: normal_out = 16'h3497;
              5'h16: normal_out = 16'h3496;
              5'h17: normal_out = 16'h3495;
              5'h18: normal_out = 16'h3494;
              5'h19: normal_out = 16'h3494;
              5'h1a: normal_out = 16'h3493;
              5'h1b: normal_out = 16'h3492;
              5'h1c: normal_out = 16'h3491;
              5'h1f: normal_out = 16'h348f;
              default: begin end
            endcase
          end
          5'h1a: begin
            normal_out = 16'h3477;
            case (mant[4:0])
              5'h00: normal_out = 16'h348e;
              5'h01: normal_out = 16'h348d;
              5'h02: normal_out = 16'h348d;
              5'h03: normal_out = 16'h348c;
              5'h04: normal_out = 16'h348b;
              5'h05: normal_out = 16'h348a;
              5'h06: normal_out = 16'h3489;
              5'h07: normal_out = 16'h3489;
              5'h08: normal_out = 16'h3488;
              5'h09: normal_out = 16'h3487;
              5'h0a: normal_out = 16'h3486;
              5'h0b: normal_out = 16'h3485;
              5'h0c: normal_out = 16'h3485;
              5'h0d: normal_out = 16'h3484;
              5'h0e: normal_out = 16'h3483;
              5'h0f: normal_out = 16'h3482;
              5'h10: normal_out = 16'h3482;
              5'h11: normal_out = 16'h3481;
              5'h12: normal_out = 16'h3480;
              5'h13: normal_out = 16'h347f;
              5'h14: normal_out = 16'h347e;
              5'h15: normal_out = 16'h347e;
              5'h16: normal_out = 16'h347d;
              5'h17: normal_out = 16'h347c;
              5'h18: normal_out = 16'h347b;
              5'h19: normal_out = 16'h347b;
              5'h1a: normal_out = 16'h347a;
              5'h1b: normal_out = 16'h3479;
              5'h1c: normal_out = 16'h3478;
              5'h1f: normal_out = 16'h3476;
              default: begin end
            endcase
          end
          5'h1b: begin
            normal_out = 16'h3460;
            case (mant[4:0])
              5'h00: normal_out = 16'h3475;
              5'h01: normal_out = 16'h3474;
              5'h02: normal_out = 16'h3474;
              5'h03: normal_out = 16'h3473;
              5'h04: normal_out = 16'h3472;
              5'h05: normal_out = 16'h3471;
              5'h06: normal_out = 16'h3471;
              5'h07: normal_out = 16'h3470;
              5'h08: normal_out = 16'h346f;
              5'h09: normal_out = 16'h346e;
              5'h0a: normal_out = 16'h346d;
              5'h0b: normal_out = 16'h346d;
              5'h0c: normal_out = 16'h346c;
              5'h0d: normal_out = 16'h346b;
              5'h0e: normal_out = 16'h346a;
              5'h0f: normal_out = 16'h346a;
              5'h10: normal_out = 16'h3469;
              5'h11: normal_out = 16'h3468;
              5'h12: normal_out = 16'h3467;
              5'h13: normal_out = 16'h3467;
              5'h14: normal_out = 16'h3466;
              5'h15: normal_out = 16'h3465;
              5'h16: normal_out = 16'h3464;
              5'h17: normal_out = 16'h3464;
              5'h18: normal_out = 16'h3463;
              5'h19: normal_out = 16'h3462;
              5'h1a: normal_out = 16'h3461;
              5'h1d: normal_out = 16'h345f;
              5'h1e: normal_out = 16'h345e;
              5'h1f: normal_out = 16'h345d;
              default: begin end
            endcase
          end
          5'h1c: begin
            normal_out = 16'h3448;
            case (mant[4:0])
              5'h00: normal_out = 16'h345d;
              5'h01: normal_out = 16'h345c;
              5'h02: normal_out = 16'h345b;
              5'h03: normal_out = 16'h345a;
              5'h04: normal_out = 16'h345a;
              5'h05: normal_out = 16'h3459;
              5'h06: normal_out = 16'h3458;
              5'h07: normal_out = 16'h3457;
              5'h08: normal_out = 16'h3457;
              5'h09: normal_out = 16'h3456;
              5'h0a: normal_out = 16'h3455;
              5'h0b: normal_out = 16'h3454;
              5'h0c: normal_out = 16'h3454;
              5'h0d: normal_out = 16'h3453;
              5'h0e: normal_out = 16'h3452;
              5'h0f: normal_out = 16'h3451;
              5'h10: normal_out = 16'h3451;
              5'h11: normal_out = 16'h3450;
              5'h12: normal_out = 16'h344f;
              5'h13: normal_out = 16'h344e;
              5'h14: normal_out = 16'h344e;
              5'h15: normal_out = 16'h344d;
              5'h16: normal_out = 16'h344c;
              5'h17: normal_out = 16'h344b;
              5'h18: normal_out = 16'h344b;
              5'h19: normal_out = 16'h344a;
              5'h1a: normal_out = 16'h3449;
              5'h1d: normal_out = 16'h3447;
              5'h1e: normal_out = 16'h3446;
              5'h1f: normal_out = 16'h3445;
              default: begin end
            endcase
          end
          5'h1d: begin
            normal_out = 16'h3430;
            case (mant[4:0])
              5'h00: normal_out = 16'h3445;
              5'h01: normal_out = 16'h3444;
              5'h02: normal_out = 16'h3443;
              5'h03: normal_out = 16'h3443;
              5'h04: normal_out = 16'h3442;
              5'h05: normal_out = 16'h3441;
              5'h06: normal_out = 16'h3440;
              5'h07: normal_out = 16'h3440;
              5'h08: normal_out = 16'h343f;
              5'h09: normal_out = 16'h343e;
              5'h0a: normal_out = 16'h343d;
              5'h0b: normal_out = 16'h343d;
              5'h0c: normal_out = 16'h343c;
              5'h0d: normal_out = 16'h343b;
              5'h0e: normal_out = 16'h343a;
              5'h0f: normal_out = 16'h343a;
              5'h10: normal_out = 16'h3439;
              5'h11: normal_out = 16'h3438;
              5'h12: normal_out = 16'h3438;
              5'h13: normal_out = 16'h3437;
              5'h14: normal_out = 16'h3436;
              5'h15: normal_out = 16'h3435;
              5'h16: normal_out = 16'h3435;
              5'h17: normal_out = 16'h3434;
              5'h18: normal_out = 16'h3433;
              5'h19: normal_out = 16'h3432;
              5'h1a: normal_out = 16'h3432;
              5'h1b: normal_out = 16'h3431;
              5'h1e: normal_out = 16'h342f;
              5'h1f: normal_out = 16'h342e;
              default: begin end
            endcase
          end
          5'h1e: begin
            normal_out = 16'h3419;
            case (mant[4:0])
              5'h00: normal_out = 16'h342d;
              5'h01: normal_out = 16'h342d;
              5'h02: normal_out = 16'h342c;
              5'h03: normal_out = 16'h342b;
              5'h04: normal_out = 16'h342a;
              5'h05: normal_out = 16'h342a;
              5'h06: normal_out = 16'h3429;
              5'h07: normal_out = 16'h3428;
              5'h08: normal_out = 16'h3428;
              5'h09: normal_out = 16'h3427;
              5'h0a: normal_out = 16'h3426;
              5'h0b: normal_out = 16'h3425;
              5'h0c: normal_out = 16'h3425;
              5'h0d: normal_out = 16'h3424;
              5'h0e: normal_out = 16'h3423;
              5'h0f: normal_out = 16'h3423;
              5'h10: normal_out = 16'h3422;
              5'h11: normal_out = 16'h3421;
              5'h12: normal_out = 16'h3420;
              5'h13: normal_out = 16'h3420;
              5'h14: normal_out = 16'h341f;
              5'h15: normal_out = 16'h341e;
              5'h16: normal_out = 16'h341e;
              5'h17: normal_out = 16'h341d;
              5'h18: normal_out = 16'h341c;
              5'h19: normal_out = 16'h341b;
              5'h1a: normal_out = 16'h341b;
              5'h1b: normal_out = 16'h341a;
              5'h1e: normal_out = 16'h3418;
              5'h1f: normal_out = 16'h3417;
              default: begin end
            endcase
          end
          5'h1f: begin
            normal_out = 16'h3401;
            case (mant[4:0])
              5'h00: normal_out = 16'h3416;
              5'h01: normal_out = 16'h3416;
              5'h02: normal_out = 16'h3415;
              5'h03: normal_out = 16'h3414;
              5'h04: normal_out = 16'h3414;
              5'h05: normal_out = 16'h3413;
              5'h06: normal_out = 16'h3412;
              5'h07: normal_out = 16'h3411;
              5'h08: normal_out = 16'h3411;
              5'h09: normal_out = 16'h3410;
              5'h0a: normal_out = 16'h340f;
              5'h0b: normal_out = 16'h340f;
              5'h0c: normal_out = 16'h340e;
              5'h0d: normal_out = 16'h340d;
              5'h0e: normal_out = 16'h340d;
              5'h0f: normal_out = 16'h340c;
              5'h10: normal_out = 16'h340b;
              5'h11: normal_out = 16'h340a;
              5'h12: normal_out = 16'h340a;
              5'h13: normal_out = 16'h3409;
              5'h14: normal_out = 16'h3408;
              5'h15: normal_out = 16'h3408;
              5'h16: normal_out = 16'h3407;
              5'h17: normal_out = 16'h3406;
              5'h18: normal_out = 16'h3406;
              5'h19: normal_out = 16'h3405;
              5'h1a: normal_out = 16'h3404;
              5'h1b: normal_out = 16'h3403;
              5'h1c: normal_out = 16'h3403;
              5'h1d: normal_out = 16'h3402;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      6'h30: begin
        case (mant[9:5])
          5'h00: begin
            normal_out = 16'h33ac;
            case (mant[4:0])
              5'h00: normal_out = 16'h3400;
              5'h01: normal_out = 16'h33fd;
              5'h02: normal_out = 16'h33fa;
              5'h03: normal_out = 16'h33f8;
              5'h04: normal_out = 16'h33f5;
              5'h05: normal_out = 16'h33f2;
              5'h06: normal_out = 16'h33ef;
              5'h07: normal_out = 16'h33ed;
              5'h08: normal_out = 16'h33ea;
              5'h09: normal_out = 16'h33e7;
              5'h0a: normal_out = 16'h33e4;
              5'h0b: normal_out = 16'h33e2;
              5'h0c: normal_out = 16'h33df;
              5'h0d: normal_out = 16'h33dc;
              5'h0e: normal_out = 16'h33da;
              5'h0f: normal_out = 16'h33d7;
              5'h10: normal_out = 16'h33d4;
              5'h11: normal_out = 16'h33d1;
              5'h12: normal_out = 16'h33cf;
              5'h13: normal_out = 16'h33cc;
              5'h14: normal_out = 16'h33c9;
              5'h15: normal_out = 16'h33c7;
              5'h16: normal_out = 16'h33c4;
              5'h17: normal_out = 16'h33c1;
              5'h18: normal_out = 16'h33bf;
              5'h19: normal_out = 16'h33bc;
              5'h1a: normal_out = 16'h33b9;
              5'h1b: normal_out = 16'h33b6;
              5'h1c: normal_out = 16'h33b4;
              5'h1d: normal_out = 16'h33b1;
              5'h1e: normal_out = 16'h33ae;
              default: begin end
            endcase
          end
          5'h01: begin
            normal_out = 16'h3359;
            case (mant[4:0])
              5'h00: normal_out = 16'h33a9;
              5'h01: normal_out = 16'h33a7;
              5'h02: normal_out = 16'h33a4;
              5'h03: normal_out = 16'h33a1;
              5'h04: normal_out = 16'h339f;
              5'h05: normal_out = 16'h339c;
              5'h06: normal_out = 16'h3399;
              5'h07: normal_out = 16'h3397;
              5'h08: normal_out = 16'h3394;
              5'h09: normal_out = 16'h3391;
              5'h0a: normal_out = 16'h338f;
              5'h0b: normal_out = 16'h338c;
              5'h0c: normal_out = 16'h338a;
              5'h0d: normal_out = 16'h3387;
              5'h0e: normal_out = 16'h3384;
              5'h0f: normal_out = 16'h3382;
              5'h10: normal_out = 16'h337f;
              5'h11: normal_out = 16'h337d;
              5'h12: normal_out = 16'h337a;
              5'h13: normal_out = 16'h3377;
              5'h14: normal_out = 16'h3375;
              5'h15: normal_out = 16'h3372;
              5'h16: normal_out = 16'h3370;
              5'h17: normal_out = 16'h336d;
              5'h18: normal_out = 16'h336a;
              5'h19: normal_out = 16'h3368;
              5'h1a: normal_out = 16'h3365;
              5'h1b: normal_out = 16'h3363;
              5'h1c: normal_out = 16'h3360;
              5'h1d: normal_out = 16'h335e;
              5'h1e: normal_out = 16'h335b;
              default: begin end
            endcase
          end
          5'h02: begin
            normal_out = 16'h3309;
            case (mant[4:0])
              5'h00: normal_out = 16'h3356;
              5'h01: normal_out = 16'h3353;
              5'h02: normal_out = 16'h3351;
              5'h03: normal_out = 16'h334e;
              5'h04: normal_out = 16'h334c;
              5'h05: normal_out = 16'h3349;
              5'h06: normal_out = 16'h3347;
              5'h07: normal_out = 16'h3344;
              5'h08: normal_out = 16'h3342;
              5'h09: normal_out = 16'h333f;
              5'h0a: normal_out = 16'h333d;
              5'h0b: normal_out = 16'h333a;
              5'h0c: normal_out = 16'h3338;
              5'h0d: normal_out = 16'h3335;
              5'h0e: normal_out = 16'h3333;
              5'h0f: normal_out = 16'h3330;
              5'h10: normal_out = 16'h332e;
              5'h11: normal_out = 16'h332b;
              5'h12: normal_out = 16'h3329;
              5'h13: normal_out = 16'h3326;
              5'h14: normal_out = 16'h3324;
              5'h15: normal_out = 16'h3321;
              5'h16: normal_out = 16'h331f;
              5'h17: normal_out = 16'h331c;
              5'h18: normal_out = 16'h331a;
              5'h19: normal_out = 16'h3318;
              5'h1a: normal_out = 16'h3315;
              5'h1b: normal_out = 16'h3313;
              5'h1c: normal_out = 16'h3310;
              5'h1d: normal_out = 16'h330e;
              5'h1e: normal_out = 16'h330b;
              default: begin end
            endcase
          end
          5'h03: begin
            normal_out = 16'h32bc;
            case (mant[4:0])
              5'h00: normal_out = 16'h3306;
              5'h01: normal_out = 16'h3304;
              5'h02: normal_out = 16'h3302;
              5'h03: normal_out = 16'h32ff;
              5'h04: normal_out = 16'h32fd;
              5'h05: normal_out = 16'h32fa;
              5'h06: normal_out = 16'h32f8;
              5'h07: normal_out = 16'h32f5;
              5'h08: normal_out = 16'h32f3;
              5'h09: normal_out = 16'h32f1;
              5'h0a: normal_out = 16'h32ee;
              5'h0b: normal_out = 16'h32ec;
              5'h0c: normal_out = 16'h32e9;
              5'h0d: normal_out = 16'h32e7;
              5'h0e: normal_out = 16'h32e5;
              5'h0f: normal_out = 16'h32e2;
              5'h10: normal_out = 16'h32e0;
              5'h11: normal_out = 16'h32dd;
              5'h12: normal_out = 16'h32db;
              5'h13: normal_out = 16'h32d9;
              5'h14: normal_out = 16'h32d6;
              5'h15: normal_out = 16'h32d4;
              5'h16: normal_out = 16'h32d2;
              5'h17: normal_out = 16'h32cf;
              5'h18: normal_out = 16'h32cd;
              5'h19: normal_out = 16'h32cb;
              5'h1a: normal_out = 16'h32c8;
              5'h1b: normal_out = 16'h32c6;
              5'h1c: normal_out = 16'h32c4;
              5'h1d: normal_out = 16'h32c1;
              5'h1e: normal_out = 16'h32bf;
              default: begin end
            endcase
          end
          5'h04: begin
            normal_out = 16'h3273;
            case (mant[4:0])
              5'h00: normal_out = 16'h32ba;
              5'h01: normal_out = 16'h32b8;
              5'h02: normal_out = 16'h32b5;
              5'h03: normal_out = 16'h32b3;
              5'h04: normal_out = 16'h32b1;
              5'h05: normal_out = 16'h32af;
              5'h06: normal_out = 16'h32ac;
              5'h07: normal_out = 16'h32aa;
              5'h08: normal_out = 16'h32a8;
              5'h09: normal_out = 16'h32a5;
              5'h0a: normal_out = 16'h32a3;
              5'h0b: normal_out = 16'h32a1;
              5'h0c: normal_out = 16'h329e;
              5'h0d: normal_out = 16'h329c;
              5'h0e: normal_out = 16'h329a;
              5'h0f: normal_out = 16'h3298;
              5'h10: normal_out = 16'h3295;
              5'h11: normal_out = 16'h3293;
              5'h12: normal_out = 16'h3291;
              5'h13: normal_out = 16'h328e;
              5'h14: normal_out = 16'h328c;
              5'h15: normal_out = 16'h328a;
              5'h16: normal_out = 16'h3288;
              5'h17: normal_out = 16'h3285;
              5'h18: normal_out = 16'h3283;
              5'h19: normal_out = 16'h3281;
              5'h1a: normal_out = 16'h327f;
              5'h1b: normal_out = 16'h327c;
              5'h1c: normal_out = 16'h327a;
              5'h1d: normal_out = 16'h3278;
              5'h1e: normal_out = 16'h3276;
              default: begin end
            endcase
          end
          5'h05: begin
            normal_out = 16'h322d;
            case (mant[4:0])
              5'h00: normal_out = 16'h3271;
              5'h01: normal_out = 16'h326f;
              5'h02: normal_out = 16'h326d;
              5'h03: normal_out = 16'h326a;
              5'h04: normal_out = 16'h3268;
              5'h05: normal_out = 16'h3266;
              5'h06: normal_out = 16'h3264;
              5'h07: normal_out = 16'h3262;
              5'h08: normal_out = 16'h325f;
              5'h09: normal_out = 16'h325d;
              5'h0a: normal_out = 16'h325b;
              5'h0b: normal_out = 16'h3259;
              5'h0c: normal_out = 16'h3257;
              5'h0d: normal_out = 16'h3254;
              5'h0e: normal_out = 16'h3252;
              5'h0f: normal_out = 16'h3250;
              5'h10: normal_out = 16'h324e;
              5'h11: normal_out = 16'h324c;
              5'h12: normal_out = 16'h3249;
              5'h13: normal_out = 16'h3247;
              5'h14: normal_out = 16'h3245;
              5'h15: normal_out = 16'h3243;
              5'h16: normal_out = 16'h3241;
              5'h17: normal_out = 16'h323f;
              5'h18: normal_out = 16'h323c;
              5'h19: normal_out = 16'h323a;
              5'h1a: normal_out = 16'h3238;
              5'h1b: normal_out = 16'h3236;
              5'h1c: normal_out = 16'h3234;
              5'h1d: normal_out = 16'h3232;
              5'h1e: normal_out = 16'h3230;
              default: begin end
            endcase
          end
          5'h06: begin
            normal_out = 16'h31ea;
            case (mant[4:0])
              5'h00: normal_out = 16'h322b;
              5'h01: normal_out = 16'h3229;
              5'h02: normal_out = 16'h3227;
              5'h03: normal_out = 16'h3225;
              5'h04: normal_out = 16'h3223;
              5'h05: normal_out = 16'h3221;
              5'h06: normal_out = 16'h321e;
              5'h07: normal_out = 16'h321c;
              5'h08: normal_out = 16'h321a;
              5'h09: normal_out = 16'h3218;
              5'h0a: normal_out = 16'h3216;
              5'h0b: normal_out = 16'h3214;
              5'h0c: normal_out = 16'h3212;
              5'h0d: normal_out = 16'h3210;
              5'h0e: normal_out = 16'h320e;
              5'h0f: normal_out = 16'h320b;
              5'h10: normal_out = 16'h3209;
              5'h11: normal_out = 16'h3207;
              5'h12: normal_out = 16'h3205;
              5'h13: normal_out = 16'h3203;
              5'h14: normal_out = 16'h3201;
              5'h15: normal_out = 16'h31ff;
              5'h16: normal_out = 16'h31fd;
              5'h17: normal_out = 16'h31fb;
              5'h18: normal_out = 16'h31f9;
              5'h19: normal_out = 16'h31f7;
              5'h1a: normal_out = 16'h31f5;
              5'h1b: normal_out = 16'h31f3;
              5'h1c: normal_out = 16'h31f0;
              5'h1d: normal_out = 16'h31ee;
              5'h1e: normal_out = 16'h31ec;
              default: begin end
            endcase
          end
          5'h07: begin
            normal_out = 16'h31aa;
            case (mant[4:0])
              5'h00: normal_out = 16'h31e8;
              5'h01: normal_out = 16'h31e6;
              5'h02: normal_out = 16'h31e4;
              5'h03: normal_out = 16'h31e2;
              5'h04: normal_out = 16'h31e0;
              5'h05: normal_out = 16'h31de;
              5'h06: normal_out = 16'h31dc;
              5'h07: normal_out = 16'h31da;
              5'h08: normal_out = 16'h31d8;
              5'h09: normal_out = 16'h31d6;
              5'h0a: normal_out = 16'h31d4;
              5'h0b: normal_out = 16'h31d2;
              5'h0c: normal_out = 16'h31d0;
              5'h0d: normal_out = 16'h31ce;
              5'h0e: normal_out = 16'h31cc;
              5'h0f: normal_out = 16'h31ca;
              5'h10: normal_out = 16'h31c8;
              5'h11: normal_out = 16'h31c6;
              5'h12: normal_out = 16'h31c4;
              5'h13: normal_out = 16'h31c2;
              5'h14: normal_out = 16'h31c0;
              5'h15: normal_out = 16'h31be;
              5'h16: normal_out = 16'h31bc;
              5'h17: normal_out = 16'h31ba;
              5'h18: normal_out = 16'h31b8;
              5'h19: normal_out = 16'h31b6;
              5'h1a: normal_out = 16'h31b4;
              5'h1b: normal_out = 16'h31b2;
              5'h1c: normal_out = 16'h31b0;
              5'h1d: normal_out = 16'h31ae;
              5'h1e: normal_out = 16'h31ac;
              default: begin end
            endcase
          end
          5'h08: begin
            normal_out = 16'h316d;
            case (mant[4:0])
              5'h00: normal_out = 16'h31a8;
              5'h01: normal_out = 16'h31a6;
              5'h02: normal_out = 16'h31a4;
              5'h03: normal_out = 16'h31a2;
              5'h04: normal_out = 16'h31a0;
              5'h05: normal_out = 16'h319e;
              5'h06: normal_out = 16'h319c;
              5'h07: normal_out = 16'h319a;
              5'h08: normal_out = 16'h3199;
              5'h09: normal_out = 16'h3197;
              5'h0a: normal_out = 16'h3195;
              5'h0b: normal_out = 16'h3193;
              5'h0c: normal_out = 16'h3191;
              5'h0d: normal_out = 16'h318f;
              5'h0e: normal_out = 16'h318d;
              5'h0f: normal_out = 16'h318b;
              5'h10: normal_out = 16'h3189;
              5'h11: normal_out = 16'h3187;
              5'h12: normal_out = 16'h3185;
              5'h13: normal_out = 16'h3183;
              5'h14: normal_out = 16'h3181;
              5'h15: normal_out = 16'h3180;
              5'h16: normal_out = 16'h317e;
              5'h17: normal_out = 16'h317c;
              5'h18: normal_out = 16'h317a;
              5'h19: normal_out = 16'h3178;
              5'h1a: normal_out = 16'h3176;
              5'h1b: normal_out = 16'h3174;
              5'h1c: normal_out = 16'h3172;
              5'h1d: normal_out = 16'h3170;
              5'h1e: normal_out = 16'h316f;
              default: begin end
            endcase
          end
          5'h09: begin
            normal_out = 16'h3132;
            case (mant[4:0])
              5'h00: normal_out = 16'h316b;
              5'h01: normal_out = 16'h3169;
              5'h02: normal_out = 16'h3167;
              5'h03: normal_out = 16'h3165;
              5'h04: normal_out = 16'h3163;
              5'h05: normal_out = 16'h3161;
              5'h06: normal_out = 16'h3160;
              5'h07: normal_out = 16'h315e;
              5'h08: normal_out = 16'h315c;
              5'h09: normal_out = 16'h315a;
              5'h0a: normal_out = 16'h3158;
              5'h0b: normal_out = 16'h3156;
              5'h0c: normal_out = 16'h3154;
              5'h0d: normal_out = 16'h3153;
              5'h0e: normal_out = 16'h3151;
              5'h0f: normal_out = 16'h314f;
              5'h10: normal_out = 16'h314d;
              5'h11: normal_out = 16'h314b;
              5'h12: normal_out = 16'h3149;
              5'h13: normal_out = 16'h3148;
              5'h14: normal_out = 16'h3146;
              5'h15: normal_out = 16'h3144;
              5'h16: normal_out = 16'h3142;
              5'h17: normal_out = 16'h3140;
              5'h18: normal_out = 16'h313e;
              5'h19: normal_out = 16'h313d;
              5'h1a: normal_out = 16'h313b;
              5'h1b: normal_out = 16'h3139;
              5'h1c: normal_out = 16'h3137;
              5'h1d: normal_out = 16'h3135;
              5'h1e: normal_out = 16'h3134;
              default: begin end
            endcase
          end
          5'h0a: begin
            normal_out = 16'h30f9;
            case (mant[4:0])
              5'h00: normal_out = 16'h3130;
              5'h01: normal_out = 16'h312e;
              5'h02: normal_out = 16'h312c;
              5'h03: normal_out = 16'h312b;
              5'h04: normal_out = 16'h3129;
              5'h05: normal_out = 16'h3127;
              5'h06: normal_out = 16'h3125;
              5'h07: normal_out = 16'h3123;
              5'h08: normal_out = 16'h3122;
              5'h09: normal_out = 16'h3120;
              5'h0a: normal_out = 16'h311e;
              5'h0b: normal_out = 16'h311c;
              5'h0c: normal_out = 16'h311b;
              5'h0d: normal_out = 16'h3119;
              5'h0e: normal_out = 16'h3117;
              5'h0f: normal_out = 16'h3115;
              5'h10: normal_out = 16'h3114;
              5'h11: normal_out = 16'h3112;
              5'h12: normal_out = 16'h3110;
              5'h13: normal_out = 16'h310e;
              5'h14: normal_out = 16'h310c;
              5'h15: normal_out = 16'h310b;
              5'h16: normal_out = 16'h3109;
              5'h17: normal_out = 16'h3107;
              5'h18: normal_out = 16'h3106;
              5'h19: normal_out = 16'h3104;
              5'h1a: normal_out = 16'h3102;
              5'h1b: normal_out = 16'h3100;
              5'h1c: normal_out = 16'h30ff;
              5'h1d: normal_out = 16'h30fd;
              5'h1e: normal_out = 16'h30fb;
              default: begin end
            endcase
          end
          5'h0b: begin
            normal_out = 16'h30c3;
            case (mant[4:0])
              5'h00: normal_out = 16'h30f8;
              5'h01: normal_out = 16'h30f6;
              5'h02: normal_out = 16'h30f4;
              5'h03: normal_out = 16'h30f3;
              5'h04: normal_out = 16'h30f1;
              5'h05: normal_out = 16'h30ef;
              5'h06: normal_out = 16'h30ed;
              5'h07: normal_out = 16'h30ec;
              5'h08: normal_out = 16'h30ea;
              5'h09: normal_out = 16'h30e8;
              5'h0a: normal_out = 16'h30e7;
              5'h0b: normal_out = 16'h30e5;
              5'h0c: normal_out = 16'h30e3;
              5'h0d: normal_out = 16'h30e1;
              5'h0e: normal_out = 16'h30e0;
              5'h0f: normal_out = 16'h30de;
              5'h10: normal_out = 16'h30dc;
              5'h11: normal_out = 16'h30db;
              5'h12: normal_out = 16'h30d9;
              5'h13: normal_out = 16'h30d7;
              5'h14: normal_out = 16'h30d6;
              5'h15: normal_out = 16'h30d4;
              5'h16: normal_out = 16'h30d2;
              5'h17: normal_out = 16'h30d1;
              5'h18: normal_out = 16'h30cf;
              5'h19: normal_out = 16'h30cd;
              5'h1a: normal_out = 16'h30cc;
              5'h1b: normal_out = 16'h30ca;
              5'h1c: normal_out = 16'h30c8;
              5'h1d: normal_out = 16'h30c7;
              5'h1e: normal_out = 16'h30c5;
              default: begin end
            endcase
          end
          5'h0c: begin
            normal_out = 16'h3090;
            case (mant[4:0])
              5'h00: normal_out = 16'h30c2;
              5'h01: normal_out = 16'h30c0;
              5'h02: normal_out = 16'h30be;
              5'h03: normal_out = 16'h30bd;
              5'h04: normal_out = 16'h30bb;
              5'h05: normal_out = 16'h30ba;
              5'h06: normal_out = 16'h30b8;
              5'h07: normal_out = 16'h30b6;
              5'h08: normal_out = 16'h30b5;
              5'h09: normal_out = 16'h30b3;
              5'h0a: normal_out = 16'h30b1;
              5'h0b: normal_out = 16'h30b0;
              5'h0c: normal_out = 16'h30ae;
              5'h0d: normal_out = 16'h30ad;
              5'h0e: normal_out = 16'h30ab;
              5'h0f: normal_out = 16'h30a9;
              5'h10: normal_out = 16'h30a8;
              5'h11: normal_out = 16'h30a6;
              5'h12: normal_out = 16'h30a4;
              5'h13: normal_out = 16'h30a3;
              5'h14: normal_out = 16'h30a1;
              5'h15: normal_out = 16'h30a0;
              5'h16: normal_out = 16'h309e;
              5'h17: normal_out = 16'h309c;
              5'h18: normal_out = 16'h309b;
              5'h19: normal_out = 16'h3099;
              5'h1a: normal_out = 16'h3098;
              5'h1b: normal_out = 16'h3096;
              5'h1c: normal_out = 16'h3094;
              5'h1d: normal_out = 16'h3093;
              5'h1e: normal_out = 16'h3091;
              default: begin end
            endcase
          end
          5'h0d: begin
            normal_out = 16'h305e;
            case (mant[4:0])
              5'h00: normal_out = 16'h308e;
              5'h01: normal_out = 16'h308d;
              5'h02: normal_out = 16'h308b;
              5'h03: normal_out = 16'h3089;
              5'h04: normal_out = 16'h3088;
              5'h05: normal_out = 16'h3086;
              5'h06: normal_out = 16'h3085;
              5'h07: normal_out = 16'h3083;
              5'h08: normal_out = 16'h3082;
              5'h09: normal_out = 16'h3080;
              5'h0a: normal_out = 16'h307e;
              5'h0b: normal_out = 16'h307d;
              5'h0c: normal_out = 16'h307b;
              5'h0d: normal_out = 16'h307a;
              5'h0e: normal_out = 16'h3078;
              5'h0f: normal_out = 16'h3077;
              5'h10: normal_out = 16'h3075;
              5'h11: normal_out = 16'h3074;
              5'h12: normal_out = 16'h3072;
              5'h13: normal_out = 16'h3071;
              5'h14: normal_out = 16'h306f;
              5'h15: normal_out = 16'h306d;
              5'h16: normal_out = 16'h306c;
              5'h17: normal_out = 16'h306a;
              5'h18: normal_out = 16'h3069;
              5'h19: normal_out = 16'h3067;
              5'h1a: normal_out = 16'h3066;
              5'h1b: normal_out = 16'h3064;
              5'h1c: normal_out = 16'h3063;
              5'h1d: normal_out = 16'h3061;
              5'h1e: normal_out = 16'h3060;
              default: begin end
            endcase
          end
          5'h0e: begin
            normal_out = 16'h302f;
            case (mant[4:0])
              5'h00: normal_out = 16'h305d;
              5'h01: normal_out = 16'h305b;
              5'h02: normal_out = 16'h305a;
              5'h03: normal_out = 16'h3058;
              5'h04: normal_out = 16'h3057;
              5'h05: normal_out = 16'h3055;
              5'h06: normal_out = 16'h3054;
              5'h07: normal_out = 16'h3052;
              5'h08: normal_out = 16'h3051;
              5'h09: normal_out = 16'h304f;
              5'h0a: normal_out = 16'h304e;
              5'h0b: normal_out = 16'h304c;
              5'h0c: normal_out = 16'h304b;
              5'h0d: normal_out = 16'h3049;
              5'h0e: normal_out = 16'h3048;
              5'h0f: normal_out = 16'h3046;
              5'h10: normal_out = 16'h3045;
              5'h11: normal_out = 16'h3043;
              5'h12: normal_out = 16'h3042;
              5'h13: normal_out = 16'h3040;
              5'h14: normal_out = 16'h303f;
              5'h15: normal_out = 16'h303d;
              5'h16: normal_out = 16'h303c;
              5'h17: normal_out = 16'h303a;
              5'h18: normal_out = 16'h3039;
              5'h19: normal_out = 16'h3038;
              5'h1a: normal_out = 16'h3036;
              5'h1b: normal_out = 16'h3035;
              5'h1c: normal_out = 16'h3033;
              5'h1d: normal_out = 16'h3032;
              5'h1e: normal_out = 16'h3030;
              default: begin end
            endcase
          end
          5'h0f: begin
            normal_out = 16'h3001;
            case (mant[4:0])
              5'h00: normal_out = 16'h302d;
              5'h01: normal_out = 16'h302c;
              5'h02: normal_out = 16'h302a;
              5'h03: normal_out = 16'h3029;
              5'h04: normal_out = 16'h3028;
              5'h05: normal_out = 16'h3026;
              5'h06: normal_out = 16'h3025;
              5'h07: normal_out = 16'h3023;
              5'h08: normal_out = 16'h3022;
              5'h09: normal_out = 16'h3020;
              5'h0a: normal_out = 16'h301f;
              5'h0b: normal_out = 16'h301e;
              5'h0c: normal_out = 16'h301c;
              5'h0d: normal_out = 16'h301b;
              5'h0e: normal_out = 16'h3019;
              5'h0f: normal_out = 16'h3018;
              5'h10: normal_out = 16'h3016;
              5'h11: normal_out = 16'h3015;
              5'h12: normal_out = 16'h3014;
              5'h13: normal_out = 16'h3012;
              5'h14: normal_out = 16'h3011;
              5'h15: normal_out = 16'h300f;
              5'h16: normal_out = 16'h300e;
              5'h17: normal_out = 16'h300d;
              5'h18: normal_out = 16'h300b;
              5'h19: normal_out = 16'h300a;
              5'h1a: normal_out = 16'h3008;
              5'h1b: normal_out = 16'h3007;
              5'h1c: normal_out = 16'h3006;
              5'h1d: normal_out = 16'h3004;
              5'h1e: normal_out = 16'h3003;
              default: begin end
            endcase
          end
          5'h10: begin
            normal_out = 16'h2fac;
            case (mant[4:0])
              5'h00: normal_out = 16'h3000;
              5'h01: normal_out = 16'h2ffd;
              5'h02: normal_out = 16'h2ffa;
              5'h03: normal_out = 16'h2ff8;
              5'h04: normal_out = 16'h2ff5;
              5'h05: normal_out = 16'h2ff2;
              5'h06: normal_out = 16'h2fef;
              5'h07: normal_out = 16'h2fed;
              5'h08: normal_out = 16'h2fea;
              5'h09: normal_out = 16'h2fe7;
              5'h0a: normal_out = 16'h2fe4;
              5'h0b: normal_out = 16'h2fe2;
              5'h0c: normal_out = 16'h2fdf;
              5'h0d: normal_out = 16'h2fdc;
              5'h0e: normal_out = 16'h2fda;
              5'h0f: normal_out = 16'h2fd7;
              5'h10: normal_out = 16'h2fd4;
              5'h11: normal_out = 16'h2fd1;
              5'h12: normal_out = 16'h2fcf;
              5'h13: normal_out = 16'h2fcc;
              5'h14: normal_out = 16'h2fc9;
              5'h15: normal_out = 16'h2fc7;
              5'h16: normal_out = 16'h2fc4;
              5'h17: normal_out = 16'h2fc1;
              5'h18: normal_out = 16'h2fbf;
              5'h19: normal_out = 16'h2fbc;
              5'h1a: normal_out = 16'h2fb9;
              5'h1b: normal_out = 16'h2fb6;
              5'h1c: normal_out = 16'h2fb4;
              5'h1d: normal_out = 16'h2fb1;
              5'h1e: normal_out = 16'h2fae;
              default: begin end
            endcase
          end
          5'h11: begin
            normal_out = 16'h2f59;
            case (mant[4:0])
              5'h00: normal_out = 16'h2fa9;
              5'h01: normal_out = 16'h2fa7;
              5'h02: normal_out = 16'h2fa4;
              5'h03: normal_out = 16'h2fa1;
              5'h04: normal_out = 16'h2f9f;
              5'h05: normal_out = 16'h2f9c;
              5'h06: normal_out = 16'h2f99;
              5'h07: normal_out = 16'h2f97;
              5'h08: normal_out = 16'h2f94;
              5'h09: normal_out = 16'h2f91;
              5'h0a: normal_out = 16'h2f8f;
              5'h0b: normal_out = 16'h2f8c;
              5'h0c: normal_out = 16'h2f8a;
              5'h0d: normal_out = 16'h2f87;
              5'h0e: normal_out = 16'h2f84;
              5'h0f: normal_out = 16'h2f82;
              5'h10: normal_out = 16'h2f7f;
              5'h11: normal_out = 16'h2f7d;
              5'h12: normal_out = 16'h2f7a;
              5'h13: normal_out = 16'h2f77;
              5'h14: normal_out = 16'h2f75;
              5'h15: normal_out = 16'h2f72;
              5'h16: normal_out = 16'h2f70;
              5'h17: normal_out = 16'h2f6d;
              5'h18: normal_out = 16'h2f6a;
              5'h19: normal_out = 16'h2f68;
              5'h1a: normal_out = 16'h2f65;
              5'h1b: normal_out = 16'h2f63;
              5'h1c: normal_out = 16'h2f60;
              5'h1d: normal_out = 16'h2f5e;
              5'h1e: normal_out = 16'h2f5b;
              default: begin end
            endcase
          end
          5'h12: begin
            normal_out = 16'h2f09;
            case (mant[4:0])
              5'h00: normal_out = 16'h2f56;
              5'h01: normal_out = 16'h2f53;
              5'h02: normal_out = 16'h2f51;
              5'h03: normal_out = 16'h2f4e;
              5'h04: normal_out = 16'h2f4c;
              5'h05: normal_out = 16'h2f49;
              5'h06: normal_out = 16'h2f47;
              5'h07: normal_out = 16'h2f44;
              5'h08: normal_out = 16'h2f42;
              5'h09: normal_out = 16'h2f3f;
              5'h0a: normal_out = 16'h2f3d;
              5'h0b: normal_out = 16'h2f3a;
              5'h0c: normal_out = 16'h2f38;
              5'h0d: normal_out = 16'h2f35;
              5'h0e: normal_out = 16'h2f33;
              5'h0f: normal_out = 16'h2f30;
              5'h10: normal_out = 16'h2f2e;
              5'h11: normal_out = 16'h2f2b;
              5'h12: normal_out = 16'h2f29;
              5'h13: normal_out = 16'h2f26;
              5'h14: normal_out = 16'h2f24;
              5'h15: normal_out = 16'h2f21;
              5'h16: normal_out = 16'h2f1f;
              5'h17: normal_out = 16'h2f1c;
              5'h18: normal_out = 16'h2f1a;
              5'h19: normal_out = 16'h2f18;
              5'h1a: normal_out = 16'h2f15;
              5'h1b: normal_out = 16'h2f13;
              5'h1c: normal_out = 16'h2f10;
              5'h1d: normal_out = 16'h2f0e;
              5'h1e: normal_out = 16'h2f0b;
              default: begin end
            endcase
          end
          5'h13: begin
            normal_out = 16'h2ebc;
            case (mant[4:0])
              5'h00: normal_out = 16'h2f06;
              5'h01: normal_out = 16'h2f04;
              5'h02: normal_out = 16'h2f02;
              5'h03: normal_out = 16'h2eff;
              5'h04: normal_out = 16'h2efd;
              5'h05: normal_out = 16'h2efa;
              5'h06: normal_out = 16'h2ef8;
              5'h07: normal_out = 16'h2ef5;
              5'h08: normal_out = 16'h2ef3;
              5'h09: normal_out = 16'h2ef1;
              5'h0a: normal_out = 16'h2eee;
              5'h0b: normal_out = 16'h2eec;
              5'h0c: normal_out = 16'h2ee9;
              5'h0d: normal_out = 16'h2ee7;
              5'h0e: normal_out = 16'h2ee5;
              5'h0f: normal_out = 16'h2ee2;
              5'h10: normal_out = 16'h2ee0;
              5'h11: normal_out = 16'h2edd;
              5'h12: normal_out = 16'h2edb;
              5'h13: normal_out = 16'h2ed9;
              5'h14: normal_out = 16'h2ed6;
              5'h15: normal_out = 16'h2ed4;
              5'h16: normal_out = 16'h2ed2;
              5'h17: normal_out = 16'h2ecf;
              5'h18: normal_out = 16'h2ecd;
              5'h19: normal_out = 16'h2ecb;
              5'h1a: normal_out = 16'h2ec8;
              5'h1b: normal_out = 16'h2ec6;
              5'h1c: normal_out = 16'h2ec4;
              5'h1d: normal_out = 16'h2ec1;
              5'h1e: normal_out = 16'h2ebf;
              default: begin end
            endcase
          end
          5'h14: begin
            normal_out = 16'h2e73;
            case (mant[4:0])
              5'h00: normal_out = 16'h2eba;
              5'h01: normal_out = 16'h2eb8;
              5'h02: normal_out = 16'h2eb5;
              5'h03: normal_out = 16'h2eb3;
              5'h04: normal_out = 16'h2eb1;
              5'h05: normal_out = 16'h2eaf;
              5'h06: normal_out = 16'h2eac;
              5'h07: normal_out = 16'h2eaa;
              5'h08: normal_out = 16'h2ea8;
              5'h09: normal_out = 16'h2ea5;
              5'h0a: normal_out = 16'h2ea3;
              5'h0b: normal_out = 16'h2ea1;
              5'h0c: normal_out = 16'h2e9e;
              5'h0d: normal_out = 16'h2e9c;
              5'h0e: normal_out = 16'h2e9a;
              5'h0f: normal_out = 16'h2e98;
              5'h10: normal_out = 16'h2e95;
              5'h11: normal_out = 16'h2e93;
              5'h12: normal_out = 16'h2e91;
              5'h13: normal_out = 16'h2e8e;
              5'h14: normal_out = 16'h2e8c;
              5'h15: normal_out = 16'h2e8a;
              5'h16: normal_out = 16'h2e88;
              5'h17: normal_out = 16'h2e85;
              5'h18: normal_out = 16'h2e83;
              5'h19: normal_out = 16'h2e81;
              5'h1a: normal_out = 16'h2e7f;
              5'h1b: normal_out = 16'h2e7c;
              5'h1c: normal_out = 16'h2e7a;
              5'h1d: normal_out = 16'h2e78;
              5'h1e: normal_out = 16'h2e76;
              default: begin end
            endcase
          end
          5'h15: begin
            normal_out = 16'h2e2d;
            case (mant[4:0])
              5'h00: normal_out = 16'h2e71;
              5'h01: normal_out = 16'h2e6f;
              5'h02: normal_out = 16'h2e6d;
              5'h03: normal_out = 16'h2e6a;
              5'h04: normal_out = 16'h2e68;
              5'h05: normal_out = 16'h2e66;
              5'h06: normal_out = 16'h2e64;
              5'h07: normal_out = 16'h2e62;
              5'h08: normal_out = 16'h2e5f;
              5'h09: normal_out = 16'h2e5d;
              5'h0a: normal_out = 16'h2e5b;
              5'h0b: normal_out = 16'h2e59;
              5'h0c: normal_out = 16'h2e57;
              5'h0d: normal_out = 16'h2e54;
              5'h0e: normal_out = 16'h2e52;
              5'h0f: normal_out = 16'h2e50;
              5'h10: normal_out = 16'h2e4e;
              5'h11: normal_out = 16'h2e4c;
              5'h12: normal_out = 16'h2e49;
              5'h13: normal_out = 16'h2e47;
              5'h14: normal_out = 16'h2e45;
              5'h15: normal_out = 16'h2e43;
              5'h16: normal_out = 16'h2e41;
              5'h17: normal_out = 16'h2e3f;
              5'h18: normal_out = 16'h2e3c;
              5'h19: normal_out = 16'h2e3a;
              5'h1a: normal_out = 16'h2e38;
              5'h1b: normal_out = 16'h2e36;
              5'h1c: normal_out = 16'h2e34;
              5'h1d: normal_out = 16'h2e32;
              5'h1e: normal_out = 16'h2e30;
              default: begin end
            endcase
          end
          5'h16: begin
            normal_out = 16'h2dea;
            case (mant[4:0])
              5'h00: normal_out = 16'h2e2b;
              5'h01: normal_out = 16'h2e29;
              5'h02: normal_out = 16'h2e27;
              5'h03: normal_out = 16'h2e25;
              5'h04: normal_out = 16'h2e23;
              5'h05: normal_out = 16'h2e21;
              5'h06: normal_out = 16'h2e1e;
              5'h07: normal_out = 16'h2e1c;
              5'h08: normal_out = 16'h2e1a;
              5'h09: normal_out = 16'h2e18;
              5'h0a: normal_out = 16'h2e16;
              5'h0b: normal_out = 16'h2e14;
              5'h0c: normal_out = 16'h2e12;
              5'h0d: normal_out = 16'h2e10;
              5'h0e: normal_out = 16'h2e0e;
              5'h0f: normal_out = 16'h2e0b;
              5'h10: normal_out = 16'h2e09;
              5'h11: normal_out = 16'h2e07;
              5'h12: normal_out = 16'h2e05;
              5'h13: normal_out = 16'h2e03;
              5'h14: normal_out = 16'h2e01;
              5'h15: normal_out = 16'h2dff;
              5'h16: normal_out = 16'h2dfd;
              5'h17: normal_out = 16'h2dfb;
              5'h18: normal_out = 16'h2df9;
              5'h19: normal_out = 16'h2df7;
              5'h1a: normal_out = 16'h2df5;
              5'h1b: normal_out = 16'h2df3;
              5'h1c: normal_out = 16'h2df0;
              5'h1d: normal_out = 16'h2dee;
              5'h1e: normal_out = 16'h2dec;
              default: begin end
            endcase
          end
          5'h17: begin
            normal_out = 16'h2daa;
            case (mant[4:0])
              5'h00: normal_out = 16'h2de8;
              5'h01: normal_out = 16'h2de6;
              5'h02: normal_out = 16'h2de4;
              5'h03: normal_out = 16'h2de2;
              5'h04: normal_out = 16'h2de0;
              5'h05: normal_out = 16'h2dde;
              5'h06: normal_out = 16'h2ddc;
              5'h07: normal_out = 16'h2dda;
              5'h08: normal_out = 16'h2dd8;
              5'h09: normal_out = 16'h2dd6;
              5'h0a: normal_out = 16'h2dd4;
              5'h0b: normal_out = 16'h2dd2;
              5'h0c: normal_out = 16'h2dd0;
              5'h0d: normal_out = 16'h2dce;
              5'h0e: normal_out = 16'h2dcc;
              5'h0f: normal_out = 16'h2dca;
              5'h10: normal_out = 16'h2dc8;
              5'h11: normal_out = 16'h2dc6;
              5'h12: normal_out = 16'h2dc4;
              5'h13: normal_out = 16'h2dc2;
              5'h14: normal_out = 16'h2dc0;
              5'h15: normal_out = 16'h2dbe;
              5'h16: normal_out = 16'h2dbc;
              5'h17: normal_out = 16'h2dba;
              5'h18: normal_out = 16'h2db8;
              5'h19: normal_out = 16'h2db6;
              5'h1a: normal_out = 16'h2db4;
              5'h1b: normal_out = 16'h2db2;
              5'h1c: normal_out = 16'h2db0;
              5'h1d: normal_out = 16'h2dae;
              5'h1e: normal_out = 16'h2dac;
              default: begin end
            endcase
          end
          5'h18: begin
            normal_out = 16'h2d6d;
            case (mant[4:0])
              5'h00: normal_out = 16'h2da8;
              5'h01: normal_out = 16'h2da6;
              5'h02: normal_out = 16'h2da4;
              5'h03: normal_out = 16'h2da2;
              5'h04: normal_out = 16'h2da0;
              5'h05: normal_out = 16'h2d9e;
              5'h06: normal_out = 16'h2d9c;
              5'h07: normal_out = 16'h2d9a;
              5'h08: normal_out = 16'h2d99;
              5'h09: normal_out = 16'h2d97;
              5'h0a: normal_out = 16'h2d95;
              5'h0b: normal_out = 16'h2d93;
              5'h0c: normal_out = 16'h2d91;
              5'h0d: normal_out = 16'h2d8f;
              5'h0e: normal_out = 16'h2d8d;
              5'h0f: normal_out = 16'h2d8b;
              5'h10: normal_out = 16'h2d89;
              5'h11: normal_out = 16'h2d87;
              5'h12: normal_out = 16'h2d85;
              5'h13: normal_out = 16'h2d83;
              5'h14: normal_out = 16'h2d81;
              5'h15: normal_out = 16'h2d80;
              5'h16: normal_out = 16'h2d7e;
              5'h17: normal_out = 16'h2d7c;
              5'h18: normal_out = 16'h2d7a;
              5'h19: normal_out = 16'h2d78;
              5'h1a: normal_out = 16'h2d76;
              5'h1b: normal_out = 16'h2d74;
              5'h1c: normal_out = 16'h2d72;
              5'h1d: normal_out = 16'h2d70;
              5'h1e: normal_out = 16'h2d6f;
              default: begin end
            endcase
          end
          5'h19: begin
            normal_out = 16'h2d32;
            case (mant[4:0])
              5'h00: normal_out = 16'h2d6b;
              5'h01: normal_out = 16'h2d69;
              5'h02: normal_out = 16'h2d67;
              5'h03: normal_out = 16'h2d65;
              5'h04: normal_out = 16'h2d63;
              5'h05: normal_out = 16'h2d61;
              5'h06: normal_out = 16'h2d60;
              5'h07: normal_out = 16'h2d5e;
              5'h08: normal_out = 16'h2d5c;
              5'h09: normal_out = 16'h2d5a;
              5'h0a: normal_out = 16'h2d58;
              5'h0b: normal_out = 16'h2d56;
              5'h0c: normal_out = 16'h2d54;
              5'h0d: normal_out = 16'h2d53;
              5'h0e: normal_out = 16'h2d51;
              5'h0f: normal_out = 16'h2d4f;
              5'h10: normal_out = 16'h2d4d;
              5'h11: normal_out = 16'h2d4b;
              5'h12: normal_out = 16'h2d49;
              5'h13: normal_out = 16'h2d48;
              5'h14: normal_out = 16'h2d46;
              5'h15: normal_out = 16'h2d44;
              5'h16: normal_out = 16'h2d42;
              5'h17: normal_out = 16'h2d40;
              5'h18: normal_out = 16'h2d3e;
              5'h19: normal_out = 16'h2d3d;
              5'h1a: normal_out = 16'h2d3b;
              5'h1b: normal_out = 16'h2d39;
              5'h1c: normal_out = 16'h2d37;
              5'h1d: normal_out = 16'h2d35;
              5'h1e: normal_out = 16'h2d34;
              default: begin end
            endcase
          end
          5'h1a: begin
            normal_out = 16'h2cf9;
            case (mant[4:0])
              5'h00: normal_out = 16'h2d30;
              5'h01: normal_out = 16'h2d2e;
              5'h02: normal_out = 16'h2d2c;
              5'h03: normal_out = 16'h2d2b;
              5'h04: normal_out = 16'h2d29;
              5'h05: normal_out = 16'h2d27;
              5'h06: normal_out = 16'h2d25;
              5'h07: normal_out = 16'h2d23;
              5'h08: normal_out = 16'h2d22;
              5'h09: normal_out = 16'h2d20;
              5'h0a: normal_out = 16'h2d1e;
              5'h0b: normal_out = 16'h2d1c;
              5'h0c: normal_out = 16'h2d1b;
              5'h0d: normal_out = 16'h2d19;
              5'h0e: normal_out = 16'h2d17;
              5'h0f: normal_out = 16'h2d15;
              5'h10: normal_out = 16'h2d14;
              5'h11: normal_out = 16'h2d12;
              5'h12: normal_out = 16'h2d10;
              5'h13: normal_out = 16'h2d0e;
              5'h14: normal_out = 16'h2d0c;
              5'h15: normal_out = 16'h2d0b;
              5'h16: normal_out = 16'h2d09;
              5'h17: normal_out = 16'h2d07;
              5'h18: normal_out = 16'h2d06;
              5'h19: normal_out = 16'h2d04;
              5'h1a: normal_out = 16'h2d02;
              5'h1b: normal_out = 16'h2d00;
              5'h1c: normal_out = 16'h2cff;
              5'h1d: normal_out = 16'h2cfd;
              5'h1e: normal_out = 16'h2cfb;
              default: begin end
            endcase
          end
          5'h1b: begin
            normal_out = 16'h2cc3;
            case (mant[4:0])
              5'h00: normal_out = 16'h2cf8;
              5'h01: normal_out = 16'h2cf6;
              5'h02: normal_out = 16'h2cf4;
              5'h03: normal_out = 16'h2cf3;
              5'h04: normal_out = 16'h2cf1;
              5'h05: normal_out = 16'h2cef;
              5'h06: normal_out = 16'h2ced;
              5'h07: normal_out = 16'h2cec;
              5'h08: normal_out = 16'h2cea;
              5'h09: normal_out = 16'h2ce8;
              5'h0a: normal_out = 16'h2ce7;
              5'h0b: normal_out = 16'h2ce5;
              5'h0c: normal_out = 16'h2ce3;
              5'h0d: normal_out = 16'h2ce1;
              5'h0e: normal_out = 16'h2ce0;
              5'h0f: normal_out = 16'h2cde;
              5'h10: normal_out = 16'h2cdc;
              5'h11: normal_out = 16'h2cdb;
              5'h12: normal_out = 16'h2cd9;
              5'h13: normal_out = 16'h2cd7;
              5'h14: normal_out = 16'h2cd6;
              5'h15: normal_out = 16'h2cd4;
              5'h16: normal_out = 16'h2cd2;
              5'h17: normal_out = 16'h2cd1;
              5'h18: normal_out = 16'h2ccf;
              5'h19: normal_out = 16'h2ccd;
              5'h1a: normal_out = 16'h2ccc;
              5'h1b: normal_out = 16'h2cca;
              5'h1c: normal_out = 16'h2cc8;
              5'h1d: normal_out = 16'h2cc7;
              5'h1e: normal_out = 16'h2cc5;
              default: begin end
            endcase
          end
          5'h1c: begin
            normal_out = 16'h2c90;
            case (mant[4:0])
              5'h00: normal_out = 16'h2cc2;
              5'h01: normal_out = 16'h2cc0;
              5'h02: normal_out = 16'h2cbe;
              5'h03: normal_out = 16'h2cbd;
              5'h04: normal_out = 16'h2cbb;
              5'h05: normal_out = 16'h2cba;
              5'h06: normal_out = 16'h2cb8;
              5'h07: normal_out = 16'h2cb6;
              5'h08: normal_out = 16'h2cb5;
              5'h09: normal_out = 16'h2cb3;
              5'h0a: normal_out = 16'h2cb1;
              5'h0b: normal_out = 16'h2cb0;
              5'h0c: normal_out = 16'h2cae;
              5'h0d: normal_out = 16'h2cad;
              5'h0e: normal_out = 16'h2cab;
              5'h0f: normal_out = 16'h2ca9;
              5'h10: normal_out = 16'h2ca8;
              5'h11: normal_out = 16'h2ca6;
              5'h12: normal_out = 16'h2ca4;
              5'h13: normal_out = 16'h2ca3;
              5'h14: normal_out = 16'h2ca1;
              5'h15: normal_out = 16'h2ca0;
              5'h16: normal_out = 16'h2c9e;
              5'h17: normal_out = 16'h2c9c;
              5'h18: normal_out = 16'h2c9b;
              5'h19: normal_out = 16'h2c99;
              5'h1a: normal_out = 16'h2c98;
              5'h1b: normal_out = 16'h2c96;
              5'h1c: normal_out = 16'h2c94;
              5'h1d: normal_out = 16'h2c93;
              5'h1e: normal_out = 16'h2c91;
              default: begin end
            endcase
          end
          5'h1d: begin
            normal_out = 16'h2c5e;
            case (mant[4:0])
              5'h00: normal_out = 16'h2c8e;
              5'h01: normal_out = 16'h2c8d;
              5'h02: normal_out = 16'h2c8b;
              5'h03: normal_out = 16'h2c89;
              5'h04: normal_out = 16'h2c88;
              5'h05: normal_out = 16'h2c86;
              5'h06: normal_out = 16'h2c85;
              5'h07: normal_out = 16'h2c83;
              5'h08: normal_out = 16'h2c82;
              5'h09: normal_out = 16'h2c80;
              5'h0a: normal_out = 16'h2c7e;
              5'h0b: normal_out = 16'h2c7d;
              5'h0c: normal_out = 16'h2c7b;
              5'h0d: normal_out = 16'h2c7a;
              5'h0e: normal_out = 16'h2c78;
              5'h0f: normal_out = 16'h2c77;
              5'h10: normal_out = 16'h2c75;
              5'h11: normal_out = 16'h2c74;
              5'h12: normal_out = 16'h2c72;
              5'h13: normal_out = 16'h2c71;
              5'h14: normal_out = 16'h2c6f;
              5'h15: normal_out = 16'h2c6d;
              5'h16: normal_out = 16'h2c6c;
              5'h17: normal_out = 16'h2c6a;
              5'h18: normal_out = 16'h2c69;
              5'h19: normal_out = 16'h2c67;
              5'h1a: normal_out = 16'h2c66;
              5'h1b: normal_out = 16'h2c64;
              5'h1c: normal_out = 16'h2c63;
              5'h1d: normal_out = 16'h2c61;
              5'h1e: normal_out = 16'h2c60;
              default: begin end
            endcase
          end
          5'h1e: begin
            normal_out = 16'h2c2f;
            case (mant[4:0])
              5'h00: normal_out = 16'h2c5d;
              5'h01: normal_out = 16'h2c5b;
              5'h02: normal_out = 16'h2c5a;
              5'h03: normal_out = 16'h2c58;
              5'h04: normal_out = 16'h2c57;
              5'h05: normal_out = 16'h2c55;
              5'h06: normal_out = 16'h2c54;
              5'h07: normal_out = 16'h2c52;
              5'h08: normal_out = 16'h2c51;
              5'h09: normal_out = 16'h2c4f;
              5'h0a: normal_out = 16'h2c4e;
              5'h0b: normal_out = 16'h2c4c;
              5'h0c: normal_out = 16'h2c4b;
              5'h0d: normal_out = 16'h2c49;
              5'h0e: normal_out = 16'h2c48;
              5'h0f: normal_out = 16'h2c46;
              5'h10: normal_out = 16'h2c45;
              5'h11: normal_out = 16'h2c43;
              5'h12: normal_out = 16'h2c42;
              5'h13: normal_out = 16'h2c40;
              5'h14: normal_out = 16'h2c3f;
              5'h15: normal_out = 16'h2c3d;
              5'h16: normal_out = 16'h2c3c;
              5'h17: normal_out = 16'h2c3a;
              5'h18: normal_out = 16'h2c39;
              5'h19: normal_out = 16'h2c38;
              5'h1a: normal_out = 16'h2c36;
              5'h1b: normal_out = 16'h2c35;
              5'h1c: normal_out = 16'h2c33;
              5'h1d: normal_out = 16'h2c32;
              5'h1e: normal_out = 16'h2c30;
              default: begin end
            endcase
          end
          5'h1f: begin
            normal_out = 16'h2c01;
            case (mant[4:0])
              5'h00: normal_out = 16'h2c2d;
              5'h01: normal_out = 16'h2c2c;
              5'h02: normal_out = 16'h2c2a;
              5'h03: normal_out = 16'h2c29;
              5'h04: normal_out = 16'h2c28;
              5'h05: normal_out = 16'h2c26;
              5'h06: normal_out = 16'h2c25;
              5'h07: normal_out = 16'h2c23;
              5'h08: normal_out = 16'h2c22;
              5'h09: normal_out = 16'h2c20;
              5'h0a: normal_out = 16'h2c1f;
              5'h0b: normal_out = 16'h2c1e;
              5'h0c: normal_out = 16'h2c1c;
              5'h0d: normal_out = 16'h2c1b;
              5'h0e: normal_out = 16'h2c19;
              5'h0f: normal_out = 16'h2c18;
              5'h10: normal_out = 16'h2c16;
              5'h11: normal_out = 16'h2c15;
              5'h12: normal_out = 16'h2c14;
              5'h13: normal_out = 16'h2c12;
              5'h14: normal_out = 16'h2c11;
              5'h15: normal_out = 16'h2c0f;
              5'h16: normal_out = 16'h2c0e;
              5'h17: normal_out = 16'h2c0d;
              5'h18: normal_out = 16'h2c0b;
              5'h19: normal_out = 16'h2c0a;
              5'h1a: normal_out = 16'h2c08;
              5'h1b: normal_out = 16'h2c07;
              5'h1c: normal_out = 16'h2c06;
              5'h1d: normal_out = 16'h2c04;
              5'h1e: normal_out = 16'h2c03;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      6'h31: begin
        case (mant[9:5])
          5'h00: begin
            normal_out = 16'h2b5b;
            case (mant[4:0])
              5'h00: normal_out = 16'h2c00;
              5'h01: normal_out = 16'h2bfa;
              5'h02: normal_out = 16'h2bf5;
              5'h03: normal_out = 16'h2bef;
              5'h04: normal_out = 16'h2bea;
              5'h05: normal_out = 16'h2be4;
              5'h06: normal_out = 16'h2bdf;
              5'h07: normal_out = 16'h2bda;
              5'h08: normal_out = 16'h2bd4;
              5'h09: normal_out = 16'h2bcf;
              5'h0a: normal_out = 16'h2bc9;
              5'h0b: normal_out = 16'h2bc4;
              5'h0c: normal_out = 16'h2bbf;
              5'h0d: normal_out = 16'h2bb9;
              5'h0e: normal_out = 16'h2bb4;
              5'h0f: normal_out = 16'h2bae;
              5'h10: normal_out = 16'h2ba9;
              5'h11: normal_out = 16'h2ba4;
              5'h12: normal_out = 16'h2b9f;
              5'h13: normal_out = 16'h2b99;
              5'h14: normal_out = 16'h2b94;
              5'h15: normal_out = 16'h2b8f;
              5'h16: normal_out = 16'h2b8a;
              5'h17: normal_out = 16'h2b84;
              5'h18: normal_out = 16'h2b7f;
              5'h19: normal_out = 16'h2b7a;
              5'h1a: normal_out = 16'h2b75;
              5'h1b: normal_out = 16'h2b70;
              5'h1c: normal_out = 16'h2b6a;
              5'h1d: normal_out = 16'h2b65;
              5'h1e: normal_out = 16'h2b60;
              default: begin end
            endcase
          end
          5'h01: begin
            normal_out = 16'h2abf;
            case (mant[4:0])
              5'h00: normal_out = 16'h2b56;
              5'h01: normal_out = 16'h2b51;
              5'h02: normal_out = 16'h2b4c;
              5'h03: normal_out = 16'h2b47;
              5'h04: normal_out = 16'h2b42;
              5'h05: normal_out = 16'h2b3d;
              5'h06: normal_out = 16'h2b38;
              5'h07: normal_out = 16'h2b33;
              5'h08: normal_out = 16'h2b2e;
              5'h09: normal_out = 16'h2b29;
              5'h0a: normal_out = 16'h2b24;
              5'h0b: normal_out = 16'h2b1f;
              5'h0c: normal_out = 16'h2b1a;
              5'h0d: normal_out = 16'h2b15;
              5'h0e: normal_out = 16'h2b10;
              5'h0f: normal_out = 16'h2b0b;
              5'h10: normal_out = 16'h2b06;
              5'h11: normal_out = 16'h2b02;
              5'h12: normal_out = 16'h2afd;
              5'h13: normal_out = 16'h2af8;
              5'h14: normal_out = 16'h2af3;
              5'h15: normal_out = 16'h2aee;
              5'h16: normal_out = 16'h2ae9;
              5'h17: normal_out = 16'h2ae5;
              5'h18: normal_out = 16'h2ae0;
              5'h19: normal_out = 16'h2adb;
              5'h1a: normal_out = 16'h2ad6;
              5'h1b: normal_out = 16'h2ad2;
              5'h1c: normal_out = 16'h2acd;
              5'h1d: normal_out = 16'h2ac8;
              5'h1e: normal_out = 16'h2ac4;
              default: begin end
            endcase
          end
          5'h02: begin
            normal_out = 16'h2a30;
            case (mant[4:0])
              5'h00: normal_out = 16'h2aba;
              5'h01: normal_out = 16'h2ab5;
              5'h02: normal_out = 16'h2ab1;
              5'h03: normal_out = 16'h2aac;
              5'h04: normal_out = 16'h2aa8;
              5'h05: normal_out = 16'h2aa3;
              5'h06: normal_out = 16'h2a9e;
              5'h07: normal_out = 16'h2a9a;
              5'h08: normal_out = 16'h2a95;
              5'h09: normal_out = 16'h2a91;
              5'h0a: normal_out = 16'h2a8c;
              5'h0b: normal_out = 16'h2a88;
              5'h0c: normal_out = 16'h2a83;
              5'h0d: normal_out = 16'h2a7f;
              5'h0e: normal_out = 16'h2a7a;
              5'h0f: normal_out = 16'h2a76;
              5'h10: normal_out = 16'h2a71;
              5'h11: normal_out = 16'h2a6d;
              5'h12: normal_out = 16'h2a68;
              5'h13: normal_out = 16'h2a64;
              5'h14: normal_out = 16'h2a5f;
              5'h15: normal_out = 16'h2a5b;
              5'h16: normal_out = 16'h2a57;
              5'h17: normal_out = 16'h2a52;
              5'h18: normal_out = 16'h2a4e;
              5'h19: normal_out = 16'h2a49;
              5'h1a: normal_out = 16'h2a45;
              5'h1b: normal_out = 16'h2a41;
              5'h1c: normal_out = 16'h2a3c;
              5'h1d: normal_out = 16'h2a38;
              5'h1e: normal_out = 16'h2a34;
              default: begin end
            endcase
          end
          5'h03: begin
            normal_out = 16'h29ac;
            case (mant[4:0])
              5'h00: normal_out = 16'h2a2b;
              5'h01: normal_out = 16'h2a27;
              5'h02: normal_out = 16'h2a23;
              5'h03: normal_out = 16'h2a1e;
              5'h04: normal_out = 16'h2a1a;
              5'h05: normal_out = 16'h2a16;
              5'h06: normal_out = 16'h2a12;
              5'h07: normal_out = 16'h2a0e;
              5'h08: normal_out = 16'h2a09;
              5'h09: normal_out = 16'h2a05;
              5'h0a: normal_out = 16'h2a01;
              5'h0b: normal_out = 16'h29fd;
              5'h0c: normal_out = 16'h29f9;
              5'h0d: normal_out = 16'h29f5;
              5'h0e: normal_out = 16'h29f0;
              5'h0f: normal_out = 16'h29ec;
              5'h10: normal_out = 16'h29e8;
              5'h11: normal_out = 16'h29e4;
              5'h12: normal_out = 16'h29e0;
              5'h13: normal_out = 16'h29dc;
              5'h14: normal_out = 16'h29d8;
              5'h15: normal_out = 16'h29d4;
              5'h16: normal_out = 16'h29d0;
              5'h17: normal_out = 16'h29cc;
              5'h18: normal_out = 16'h29c8;
              5'h19: normal_out = 16'h29c4;
              5'h1a: normal_out = 16'h29c0;
              5'h1b: normal_out = 16'h29bc;
              5'h1c: normal_out = 16'h29b8;
              5'h1d: normal_out = 16'h29b4;
              5'h1e: normal_out = 16'h29b0;
              default: begin end
            endcase
          end
          5'h04: begin
            normal_out = 16'h2934;
            case (mant[4:0])
              5'h00: normal_out = 16'h29a8;
              5'h01: normal_out = 16'h29a4;
              5'h02: normal_out = 16'h29a0;
              5'h03: normal_out = 16'h299c;
              5'h04: normal_out = 16'h2999;
              5'h05: normal_out = 16'h2995;
              5'h06: normal_out = 16'h2991;
              5'h07: normal_out = 16'h298d;
              5'h08: normal_out = 16'h2989;
              5'h09: normal_out = 16'h2985;
              5'h0a: normal_out = 16'h2981;
              5'h0b: normal_out = 16'h297e;
              5'h0c: normal_out = 16'h297a;
              5'h0d: normal_out = 16'h2976;
              5'h0e: normal_out = 16'h2972;
              5'h0f: normal_out = 16'h296f;
              5'h10: normal_out = 16'h296b;
              5'h11: normal_out = 16'h2967;
              5'h12: normal_out = 16'h2963;
              5'h13: normal_out = 16'h2960;
              5'h14: normal_out = 16'h295c;
              5'h15: normal_out = 16'h2958;
              5'h16: normal_out = 16'h2954;
              5'h17: normal_out = 16'h2951;
              5'h18: normal_out = 16'h294d;
              5'h19: normal_out = 16'h2949;
              5'h1a: normal_out = 16'h2946;
              5'h1b: normal_out = 16'h2942;
              5'h1c: normal_out = 16'h293e;
              5'h1d: normal_out = 16'h293b;
              5'h1e: normal_out = 16'h2937;
              default: begin end
            endcase
          end
          5'h05: begin
            normal_out = 16'h28c5;
            case (mant[4:0])
              5'h00: normal_out = 16'h2930;
              5'h01: normal_out = 16'h292c;
              5'h02: normal_out = 16'h2929;
              5'h03: normal_out = 16'h2925;
              5'h04: normal_out = 16'h2922;
              5'h05: normal_out = 16'h291e;
              5'h06: normal_out = 16'h291b;
              5'h07: normal_out = 16'h2917;
              5'h08: normal_out = 16'h2914;
              5'h09: normal_out = 16'h2910;
              5'h0a: normal_out = 16'h290c;
              5'h0b: normal_out = 16'h2909;
              5'h0c: normal_out = 16'h2906;
              5'h0d: normal_out = 16'h2902;
              5'h0e: normal_out = 16'h28ff;
              5'h0f: normal_out = 16'h28fb;
              5'h10: normal_out = 16'h28f8;
              5'h11: normal_out = 16'h28f4;
              5'h12: normal_out = 16'h28f1;
              5'h13: normal_out = 16'h28ed;
              5'h14: normal_out = 16'h28ea;
              5'h15: normal_out = 16'h28e7;
              5'h16: normal_out = 16'h28e3;
              5'h17: normal_out = 16'h28e0;
              5'h18: normal_out = 16'h28dc;
              5'h19: normal_out = 16'h28d9;
              5'h1a: normal_out = 16'h28d6;
              5'h1b: normal_out = 16'h28d2;
              5'h1c: normal_out = 16'h28cf;
              5'h1d: normal_out = 16'h28cc;
              5'h1e: normal_out = 16'h28c8;
              default: begin end
            endcase
          end
          5'h06: begin
            normal_out = 16'h2860;
            case (mant[4:0])
              5'h00: normal_out = 16'h28c2;
              5'h01: normal_out = 16'h28be;
              5'h02: normal_out = 16'h28bb;
              5'h03: normal_out = 16'h28b8;
              5'h04: normal_out = 16'h28b5;
              5'h05: normal_out = 16'h28b1;
              5'h06: normal_out = 16'h28ae;
              5'h07: normal_out = 16'h28ab;
              5'h08: normal_out = 16'h28a8;
              5'h09: normal_out = 16'h28a4;
              5'h0a: normal_out = 16'h28a1;
              5'h0b: normal_out = 16'h289e;
              5'h0c: normal_out = 16'h289b;
              5'h0d: normal_out = 16'h2898;
              5'h0e: normal_out = 16'h2894;
              5'h0f: normal_out = 16'h2891;
              5'h10: normal_out = 16'h288e;
              5'h11: normal_out = 16'h288b;
              5'h12: normal_out = 16'h2888;
              5'h13: normal_out = 16'h2885;
              5'h14: normal_out = 16'h2882;
              5'h15: normal_out = 16'h287e;
              5'h16: normal_out = 16'h287b;
              5'h17: normal_out = 16'h2878;
              5'h18: normal_out = 16'h2875;
              5'h19: normal_out = 16'h2872;
              5'h1a: normal_out = 16'h286f;
              5'h1b: normal_out = 16'h286c;
              5'h1c: normal_out = 16'h2869;
              5'h1d: normal_out = 16'h2866;
              5'h1e: normal_out = 16'h2863;
              default: begin end
            endcase
          end
          5'h07: begin
            normal_out = 16'h2803;
            case (mant[4:0])
              5'h00: normal_out = 16'h285d;
              5'h01: normal_out = 16'h285a;
              5'h02: normal_out = 16'h2857;
              5'h03: normal_out = 16'h2854;
              5'h04: normal_out = 16'h2851;
              5'h05: normal_out = 16'h284e;
              5'h06: normal_out = 16'h284b;
              5'h07: normal_out = 16'h2848;
              5'h08: normal_out = 16'h2845;
              5'h09: normal_out = 16'h2842;
              5'h0a: normal_out = 16'h283f;
              5'h0b: normal_out = 16'h283c;
              5'h0c: normal_out = 16'h2839;
              5'h0d: normal_out = 16'h2836;
              5'h0e: normal_out = 16'h2833;
              5'h0f: normal_out = 16'h2830;
              5'h10: normal_out = 16'h282d;
              5'h11: normal_out = 16'h282a;
              5'h12: normal_out = 16'h2828;
              5'h13: normal_out = 16'h2825;
              5'h14: normal_out = 16'h2822;
              5'h15: normal_out = 16'h281f;
              5'h16: normal_out = 16'h281c;
              5'h17: normal_out = 16'h2819;
              5'h18: normal_out = 16'h2816;
              5'h19: normal_out = 16'h2814;
              5'h1a: normal_out = 16'h2811;
              5'h1b: normal_out = 16'h280e;
              5'h1c: normal_out = 16'h280b;
              5'h1d: normal_out = 16'h2808;
              5'h1e: normal_out = 16'h2806;
              default: begin end
            endcase
          end
          5'h08: begin
            normal_out = 16'h275b;
            case (mant[4:0])
              5'h00: normal_out = 16'h2800;
              5'h01: normal_out = 16'h27fa;
              5'h02: normal_out = 16'h27f5;
              5'h03: normal_out = 16'h27ef;
              5'h04: normal_out = 16'h27ea;
              5'h05: normal_out = 16'h27e4;
              5'h06: normal_out = 16'h27df;
              5'h07: normal_out = 16'h27da;
              5'h08: normal_out = 16'h27d4;
              5'h09: normal_out = 16'h27cf;
              5'h0a: normal_out = 16'h27c9;
              5'h0b: normal_out = 16'h27c4;
              5'h0c: normal_out = 16'h27bf;
              5'h0d: normal_out = 16'h27b9;
              5'h0e: normal_out = 16'h27b4;
              5'h0f: normal_out = 16'h27ae;
              5'h10: normal_out = 16'h27a9;
              5'h11: normal_out = 16'h27a4;
              5'h12: normal_out = 16'h279f;
              5'h13: normal_out = 16'h2799;
              5'h14: normal_out = 16'h2794;
              5'h15: normal_out = 16'h278f;
              5'h16: normal_out = 16'h278a;
              5'h17: normal_out = 16'h2784;
              5'h18: normal_out = 16'h277f;
              5'h19: normal_out = 16'h277a;
              5'h1a: normal_out = 16'h2775;
              5'h1b: normal_out = 16'h2770;
              5'h1c: normal_out = 16'h276a;
              5'h1d: normal_out = 16'h2765;
              5'h1e: normal_out = 16'h2760;
              default: begin end
            endcase
          end
          5'h09: begin
            normal_out = 16'h26bf;
            case (mant[4:0])
              5'h00: normal_out = 16'h2756;
              5'h01: normal_out = 16'h2751;
              5'h02: normal_out = 16'h274c;
              5'h03: normal_out = 16'h2747;
              5'h04: normal_out = 16'h2742;
              5'h05: normal_out = 16'h273d;
              5'h06: normal_out = 16'h2738;
              5'h07: normal_out = 16'h2733;
              5'h08: normal_out = 16'h272e;
              5'h09: normal_out = 16'h2729;
              5'h0a: normal_out = 16'h2724;
              5'h0b: normal_out = 16'h271f;
              5'h0c: normal_out = 16'h271a;
              5'h0d: normal_out = 16'h2715;
              5'h0e: normal_out = 16'h2710;
              5'h0f: normal_out = 16'h270b;
              5'h10: normal_out = 16'h2706;
              5'h11: normal_out = 16'h2702;
              5'h12: normal_out = 16'h26fd;
              5'h13: normal_out = 16'h26f8;
              5'h14: normal_out = 16'h26f3;
              5'h15: normal_out = 16'h26ee;
              5'h16: normal_out = 16'h26e9;
              5'h17: normal_out = 16'h26e5;
              5'h18: normal_out = 16'h26e0;
              5'h19: normal_out = 16'h26db;
              5'h1a: normal_out = 16'h26d6;
              5'h1b: normal_out = 16'h26d2;
              5'h1c: normal_out = 16'h26cd;
              5'h1d: normal_out = 16'h26c8;
              5'h1e: normal_out = 16'h26c4;
              default: begin end
            endcase
          end
          5'h0a: begin
            normal_out = 16'h2630;
            case (mant[4:0])
              5'h00: normal_out = 16'h26ba;
              5'h01: normal_out = 16'h26b5;
              5'h02: normal_out = 16'h26b1;
              5'h03: normal_out = 16'h26ac;
              5'h04: normal_out = 16'h26a8;
              5'h05: normal_out = 16'h26a3;
              5'h06: normal_out = 16'h269e;
              5'h07: normal_out = 16'h269a;
              5'h08: normal_out = 16'h2695;
              5'h09: normal_out = 16'h2691;
              5'h0a: normal_out = 16'h268c;
              5'h0b: normal_out = 16'h2688;
              5'h0c: normal_out = 16'h2683;
              5'h0d: normal_out = 16'h267f;
              5'h0e: normal_out = 16'h267a;
              5'h0f: normal_out = 16'h2676;
              5'h10: normal_out = 16'h2671;
              5'h11: normal_out = 16'h266d;
              5'h12: normal_out = 16'h2668;
              5'h13: normal_out = 16'h2664;
              5'h14: normal_out = 16'h265f;
              5'h15: normal_out = 16'h265b;
              5'h16: normal_out = 16'h2657;
              5'h17: normal_out = 16'h2652;
              5'h18: normal_out = 16'h264e;
              5'h19: normal_out = 16'h2649;
              5'h1a: normal_out = 16'h2645;
              5'h1b: normal_out = 16'h2641;
              5'h1c: normal_out = 16'h263c;
              5'h1d: normal_out = 16'h2638;
              5'h1e: normal_out = 16'h2634;
              default: begin end
            endcase
          end
          5'h0b: begin
            normal_out = 16'h25ac;
            case (mant[4:0])
              5'h00: normal_out = 16'h262b;
              5'h01: normal_out = 16'h2627;
              5'h02: normal_out = 16'h2623;
              5'h03: normal_out = 16'h261e;
              5'h04: normal_out = 16'h261a;
              5'h05: normal_out = 16'h2616;
              5'h06: normal_out = 16'h2612;
              5'h07: normal_out = 16'h260e;
              5'h08: normal_out = 16'h2609;
              5'h09: normal_out = 16'h2605;
              5'h0a: normal_out = 16'h2601;
              5'h0b: normal_out = 16'h25fd;
              5'h0c: normal_out = 16'h25f9;
              5'h0d: normal_out = 16'h25f5;
              5'h0e: normal_out = 16'h25f0;
              5'h0f: normal_out = 16'h25ec;
              5'h10: normal_out = 16'h25e8;
              5'h11: normal_out = 16'h25e4;
              5'h12: normal_out = 16'h25e0;
              5'h13: normal_out = 16'h25dc;
              5'h14: normal_out = 16'h25d8;
              5'h15: normal_out = 16'h25d4;
              5'h16: normal_out = 16'h25d0;
              5'h17: normal_out = 16'h25cc;
              5'h18: normal_out = 16'h25c8;
              5'h19: normal_out = 16'h25c4;
              5'h1a: normal_out = 16'h25c0;
              5'h1b: normal_out = 16'h25bc;
              5'h1c: normal_out = 16'h25b8;
              5'h1d: normal_out = 16'h25b4;
              5'h1e: normal_out = 16'h25b0;
              default: begin end
            endcase
          end
          5'h0c: begin
            normal_out = 16'h2534;
            case (mant[4:0])
              5'h00: normal_out = 16'h25a8;
              5'h01: normal_out = 16'h25a4;
              5'h02: normal_out = 16'h25a0;
              5'h03: normal_out = 16'h259c;
              5'h04: normal_out = 16'h2599;
              5'h05: normal_out = 16'h2595;
              5'h06: normal_out = 16'h2591;
              5'h07: normal_out = 16'h258d;
              5'h08: normal_out = 16'h2589;
              5'h09: normal_out = 16'h2585;
              5'h0a: normal_out = 16'h2581;
              5'h0b: normal_out = 16'h257e;
              5'h0c: normal_out = 16'h257a;
              5'h0d: normal_out = 16'h2576;
              5'h0e: normal_out = 16'h2572;
              5'h0f: normal_out = 16'h256f;
              5'h10: normal_out = 16'h256b;
              5'h11: normal_out = 16'h2567;
              5'h12: normal_out = 16'h2563;
              5'h13: normal_out = 16'h2560;
              5'h14: normal_out = 16'h255c;
              5'h15: normal_out = 16'h2558;
              5'h16: normal_out = 16'h2554;
              5'h17: normal_out = 16'h2551;
              5'h18: normal_out = 16'h254d;
              5'h19: normal_out = 16'h2549;
              5'h1a: normal_out = 16'h2546;
              5'h1b: normal_out = 16'h2542;
              5'h1c: normal_out = 16'h253e;
              5'h1d: normal_out = 16'h253b;
              5'h1e: normal_out = 16'h2537;
              default: begin end
            endcase
          end
          5'h0d: begin
            normal_out = 16'h24c5;
            case (mant[4:0])
              5'h00: normal_out = 16'h2530;
              5'h01: normal_out = 16'h252c;
              5'h02: normal_out = 16'h2529;
              5'h03: normal_out = 16'h2525;
              5'h04: normal_out = 16'h2522;
              5'h05: normal_out = 16'h251e;
              5'h06: normal_out = 16'h251b;
              5'h07: normal_out = 16'h2517;
              5'h08: normal_out = 16'h2514;
              5'h09: normal_out = 16'h2510;
              5'h0a: normal_out = 16'h250c;
              5'h0b: normal_out = 16'h2509;
              5'h0c: normal_out = 16'h2506;
              5'h0d: normal_out = 16'h2502;
              5'h0e: normal_out = 16'h24ff;
              5'h0f: normal_out = 16'h24fb;
              5'h10: normal_out = 16'h24f8;
              5'h11: normal_out = 16'h24f4;
              5'h12: normal_out = 16'h24f1;
              5'h13: normal_out = 16'h24ed;
              5'h14: normal_out = 16'h24ea;
              5'h15: normal_out = 16'h24e7;
              5'h16: normal_out = 16'h24e3;
              5'h17: normal_out = 16'h24e0;
              5'h18: normal_out = 16'h24dc;
              5'h19: normal_out = 16'h24d9;
              5'h1a: normal_out = 16'h24d6;
              5'h1b: normal_out = 16'h24d2;
              5'h1c: normal_out = 16'h24cf;
              5'h1d: normal_out = 16'h24cc;
              5'h1e: normal_out = 16'h24c8;
              default: begin end
            endcase
          end
          5'h0e: begin
            normal_out = 16'h2460;
            case (mant[4:0])
              5'h00: normal_out = 16'h24c2;
              5'h01: normal_out = 16'h24be;
              5'h02: normal_out = 16'h24bb;
              5'h03: normal_out = 16'h24b8;
              5'h04: normal_out = 16'h24b5;
              5'h05: normal_out = 16'h24b1;
              5'h06: normal_out = 16'h24ae;
              5'h07: normal_out = 16'h24ab;
              5'h08: normal_out = 16'h24a8;
              5'h09: normal_out = 16'h24a4;
              5'h0a: normal_out = 16'h24a1;
              5'h0b: normal_out = 16'h249e;
              5'h0c: normal_out = 16'h249b;
              5'h0d: normal_out = 16'h2498;
              5'h0e: normal_out = 16'h2494;
              5'h0f: normal_out = 16'h2491;
              5'h10: normal_out = 16'h248e;
              5'h11: normal_out = 16'h248b;
              5'h12: normal_out = 16'h2488;
              5'h13: normal_out = 16'h2485;
              5'h14: normal_out = 16'h2482;
              5'h15: normal_out = 16'h247e;
              5'h16: normal_out = 16'h247b;
              5'h17: normal_out = 16'h2478;
              5'h18: normal_out = 16'h2475;
              5'h19: normal_out = 16'h2472;
              5'h1a: normal_out = 16'h246f;
              5'h1b: normal_out = 16'h246c;
              5'h1c: normal_out = 16'h2469;
              5'h1d: normal_out = 16'h2466;
              5'h1e: normal_out = 16'h2463;
              default: begin end
            endcase
          end
          5'h0f: begin
            normal_out = 16'h2403;
            case (mant[4:0])
              5'h00: normal_out = 16'h245d;
              5'h01: normal_out = 16'h245a;
              5'h02: normal_out = 16'h2457;
              5'h03: normal_out = 16'h2454;
              5'h04: normal_out = 16'h2451;
              5'h05: normal_out = 16'h244e;
              5'h06: normal_out = 16'h244b;
              5'h07: normal_out = 16'h2448;
              5'h08: normal_out = 16'h2445;
              5'h09: normal_out = 16'h2442;
              5'h0a: normal_out = 16'h243f;
              5'h0b: normal_out = 16'h243c;
              5'h0c: normal_out = 16'h2439;
              5'h0d: normal_out = 16'h2436;
              5'h0e: normal_out = 16'h2433;
              5'h0f: normal_out = 16'h2430;
              5'h10: normal_out = 16'h242d;
              5'h11: normal_out = 16'h242a;
              5'h12: normal_out = 16'h2428;
              5'h13: normal_out = 16'h2425;
              5'h14: normal_out = 16'h2422;
              5'h15: normal_out = 16'h241f;
              5'h16: normal_out = 16'h241c;
              5'h17: normal_out = 16'h2419;
              5'h18: normal_out = 16'h2416;
              5'h19: normal_out = 16'h2414;
              5'h1a: normal_out = 16'h2411;
              5'h1b: normal_out = 16'h240e;
              5'h1c: normal_out = 16'h240b;
              5'h1d: normal_out = 16'h2408;
              5'h1e: normal_out = 16'h2406;
              default: begin end
            endcase
          end
          5'h10: begin
            normal_out = 16'h235b;
            case (mant[4:0])
              5'h00: normal_out = 16'h2400;
              5'h01: normal_out = 16'h23fa;
              5'h02: normal_out = 16'h23f5;
              5'h03: normal_out = 16'h23ef;
              5'h04: normal_out = 16'h23ea;
              5'h05: normal_out = 16'h23e4;
              5'h06: normal_out = 16'h23df;
              5'h07: normal_out = 16'h23da;
              5'h08: normal_out = 16'h23d4;
              5'h09: normal_out = 16'h23cf;
              5'h0a: normal_out = 16'h23c9;
              5'h0b: normal_out = 16'h23c4;
              5'h0c: normal_out = 16'h23bf;
              5'h0d: normal_out = 16'h23b9;
              5'h0e: normal_out = 16'h23b4;
              5'h0f: normal_out = 16'h23ae;
              5'h10: normal_out = 16'h23a9;
              5'h11: normal_out = 16'h23a4;
              5'h12: normal_out = 16'h239f;
              5'h13: normal_out = 16'h2399;
              5'h14: normal_out = 16'h2394;
              5'h15: normal_out = 16'h238f;
              5'h16: normal_out = 16'h238a;
              5'h17: normal_out = 16'h2384;
              5'h18: normal_out = 16'h237f;
              5'h19: normal_out = 16'h237a;
              5'h1a: normal_out = 16'h2375;
              5'h1b: normal_out = 16'h2370;
              5'h1c: normal_out = 16'h236a;
              5'h1d: normal_out = 16'h2365;
              5'h1e: normal_out = 16'h2360;
              default: begin end
            endcase
          end
          5'h11: begin
            normal_out = 16'h22bf;
            case (mant[4:0])
              5'h00: normal_out = 16'h2356;
              5'h01: normal_out = 16'h2351;
              5'h02: normal_out = 16'h234c;
              5'h03: normal_out = 16'h2347;
              5'h04: normal_out = 16'h2342;
              5'h05: normal_out = 16'h233d;
              5'h06: normal_out = 16'h2338;
              5'h07: normal_out = 16'h2333;
              5'h08: normal_out = 16'h232e;
              5'h09: normal_out = 16'h2329;
              5'h0a: normal_out = 16'h2324;
              5'h0b: normal_out = 16'h231f;
              5'h0c: normal_out = 16'h231a;
              5'h0d: normal_out = 16'h2315;
              5'h0e: normal_out = 16'h2310;
              5'h0f: normal_out = 16'h230b;
              5'h10: normal_out = 16'h2306;
              5'h11: normal_out = 16'h2302;
              5'h12: normal_out = 16'h22fd;
              5'h13: normal_out = 16'h22f8;
              5'h14: normal_out = 16'h22f3;
              5'h15: normal_out = 16'h22ee;
              5'h16: normal_out = 16'h22e9;
              5'h17: normal_out = 16'h22e5;
              5'h18: normal_out = 16'h22e0;
              5'h19: normal_out = 16'h22db;
              5'h1a: normal_out = 16'h22d6;
              5'h1b: normal_out = 16'h22d2;
              5'h1c: normal_out = 16'h22cd;
              5'h1d: normal_out = 16'h22c8;
              5'h1e: normal_out = 16'h22c4;
              default: begin end
            endcase
          end
          5'h12: begin
            normal_out = 16'h2230;
            case (mant[4:0])
              5'h00: normal_out = 16'h22ba;
              5'h01: normal_out = 16'h22b5;
              5'h02: normal_out = 16'h22b1;
              5'h03: normal_out = 16'h22ac;
              5'h04: normal_out = 16'h22a8;
              5'h05: normal_out = 16'h22a3;
              5'h06: normal_out = 16'h229e;
              5'h07: normal_out = 16'h229a;
              5'h08: normal_out = 16'h2295;
              5'h09: normal_out = 16'h2291;
              5'h0a: normal_out = 16'h228c;
              5'h0b: normal_out = 16'h2288;
              5'h0c: normal_out = 16'h2283;
              5'h0d: normal_out = 16'h227f;
              5'h0e: normal_out = 16'h227a;
              5'h0f: normal_out = 16'h2276;
              5'h10: normal_out = 16'h2271;
              5'h11: normal_out = 16'h226d;
              5'h12: normal_out = 16'h2268;
              5'h13: normal_out = 16'h2264;
              5'h14: normal_out = 16'h225f;
              5'h15: normal_out = 16'h225b;
              5'h16: normal_out = 16'h2257;
              5'h17: normal_out = 16'h2252;
              5'h18: normal_out = 16'h224e;
              5'h19: normal_out = 16'h2249;
              5'h1a: normal_out = 16'h2245;
              5'h1b: normal_out = 16'h2241;
              5'h1c: normal_out = 16'h223c;
              5'h1d: normal_out = 16'h2238;
              5'h1e: normal_out = 16'h2234;
              default: begin end
            endcase
          end
          5'h13: begin
            normal_out = 16'h21ac;
            case (mant[4:0])
              5'h00: normal_out = 16'h222b;
              5'h01: normal_out = 16'h2227;
              5'h02: normal_out = 16'h2223;
              5'h03: normal_out = 16'h221e;
              5'h04: normal_out = 16'h221a;
              5'h05: normal_out = 16'h2216;
              5'h06: normal_out = 16'h2212;
              5'h07: normal_out = 16'h220e;
              5'h08: normal_out = 16'h2209;
              5'h09: normal_out = 16'h2205;
              5'h0a: normal_out = 16'h2201;
              5'h0b: normal_out = 16'h21fd;
              5'h0c: normal_out = 16'h21f9;
              5'h0d: normal_out = 16'h21f5;
              5'h0e: normal_out = 16'h21f0;
              5'h0f: normal_out = 16'h21ec;
              5'h10: normal_out = 16'h21e8;
              5'h11: normal_out = 16'h21e4;
              5'h12: normal_out = 16'h21e0;
              5'h13: normal_out = 16'h21dc;
              5'h14: normal_out = 16'h21d8;
              5'h15: normal_out = 16'h21d4;
              5'h16: normal_out = 16'h21d0;
              5'h17: normal_out = 16'h21cc;
              5'h18: normal_out = 16'h21c8;
              5'h19: normal_out = 16'h21c4;
              5'h1a: normal_out = 16'h21c0;
              5'h1b: normal_out = 16'h21bc;
              5'h1c: normal_out = 16'h21b8;
              5'h1d: normal_out = 16'h21b4;
              5'h1e: normal_out = 16'h21b0;
              default: begin end
            endcase
          end
          5'h14: begin
            normal_out = 16'h2134;
            case (mant[4:0])
              5'h00: normal_out = 16'h21a8;
              5'h01: normal_out = 16'h21a4;
              5'h02: normal_out = 16'h21a0;
              5'h03: normal_out = 16'h219c;
              5'h04: normal_out = 16'h2199;
              5'h05: normal_out = 16'h2195;
              5'h06: normal_out = 16'h2191;
              5'h07: normal_out = 16'h218d;
              5'h08: normal_out = 16'h2189;
              5'h09: normal_out = 16'h2185;
              5'h0a: normal_out = 16'h2181;
              5'h0b: normal_out = 16'h217e;
              5'h0c: normal_out = 16'h217a;
              5'h0d: normal_out = 16'h2176;
              5'h0e: normal_out = 16'h2172;
              5'h0f: normal_out = 16'h216f;
              5'h10: normal_out = 16'h216b;
              5'h11: normal_out = 16'h2167;
              5'h12: normal_out = 16'h2163;
              5'h13: normal_out = 16'h2160;
              5'h14: normal_out = 16'h215c;
              5'h15: normal_out = 16'h2158;
              5'h16: normal_out = 16'h2154;
              5'h17: normal_out = 16'h2151;
              5'h18: normal_out = 16'h214d;
              5'h19: normal_out = 16'h2149;
              5'h1a: normal_out = 16'h2146;
              5'h1b: normal_out = 16'h2142;
              5'h1c: normal_out = 16'h213e;
              5'h1d: normal_out = 16'h213b;
              5'h1e: normal_out = 16'h2137;
              default: begin end
            endcase
          end
          5'h15: begin
            normal_out = 16'h20c5;
            case (mant[4:0])
              5'h00: normal_out = 16'h2130;
              5'h01: normal_out = 16'h212c;
              5'h02: normal_out = 16'h2129;
              5'h03: normal_out = 16'h2125;
              5'h04: normal_out = 16'h2122;
              5'h05: normal_out = 16'h211e;
              5'h06: normal_out = 16'h211b;
              5'h07: normal_out = 16'h2117;
              5'h08: normal_out = 16'h2114;
              5'h09: normal_out = 16'h2110;
              5'h0a: normal_out = 16'h210c;
              5'h0b: normal_out = 16'h2109;
              5'h0c: normal_out = 16'h2106;
              5'h0d: normal_out = 16'h2102;
              5'h0e: normal_out = 16'h20ff;
              5'h0f: normal_out = 16'h20fb;
              5'h10: normal_out = 16'h20f8;
              5'h11: normal_out = 16'h20f4;
              5'h12: normal_out = 16'h20f1;
              5'h13: normal_out = 16'h20ed;
              5'h14: normal_out = 16'h20ea;
              5'h15: normal_out = 16'h20e7;
              5'h16: normal_out = 16'h20e3;
              5'h17: normal_out = 16'h20e0;
              5'h18: normal_out = 16'h20dc;
              5'h19: normal_out = 16'h20d9;
              5'h1a: normal_out = 16'h20d6;
              5'h1b: normal_out = 16'h20d2;
              5'h1c: normal_out = 16'h20cf;
              5'h1d: normal_out = 16'h20cc;
              5'h1e: normal_out = 16'h20c8;
              default: begin end
            endcase
          end
          5'h16: begin
            normal_out = 16'h2060;
            case (mant[4:0])
              5'h00: normal_out = 16'h20c2;
              5'h01: normal_out = 16'h20be;
              5'h02: normal_out = 16'h20bb;
              5'h03: normal_out = 16'h20b8;
              5'h04: normal_out = 16'h20b5;
              5'h05: normal_out = 16'h20b1;
              5'h06: normal_out = 16'h20ae;
              5'h07: normal_out = 16'h20ab;
              5'h08: normal_out = 16'h20a8;
              5'h09: normal_out = 16'h20a4;
              5'h0a: normal_out = 16'h20a1;
              5'h0b: normal_out = 16'h209e;
              5'h0c: normal_out = 16'h209b;
              5'h0d: normal_out = 16'h2098;
              5'h0e: normal_out = 16'h2094;
              5'h0f: normal_out = 16'h2091;
              5'h10: normal_out = 16'h208e;
              5'h11: normal_out = 16'h208b;
              5'h12: normal_out = 16'h2088;
              5'h13: normal_out = 16'h2085;
              5'h14: normal_out = 16'h2082;
              5'h15: normal_out = 16'h207e;
              5'h16: normal_out = 16'h207b;
              5'h17: normal_out = 16'h2078;
              5'h18: normal_out = 16'h2075;
              5'h19: normal_out = 16'h2072;
              5'h1a: normal_out = 16'h206f;
              5'h1b: normal_out = 16'h206c;
              5'h1c: normal_out = 16'h2069;
              5'h1d: normal_out = 16'h2066;
              5'h1e: normal_out = 16'h2063;
              default: begin end
            endcase
          end
          5'h17: begin
            normal_out = 16'h2003;
            case (mant[4:0])
              5'h00: normal_out = 16'h205d;
              5'h01: normal_out = 16'h205a;
              5'h02: normal_out = 16'h2057;
              5'h03: normal_out = 16'h2054;
              5'h04: normal_out = 16'h2051;
              5'h05: normal_out = 16'h204e;
              5'h06: normal_out = 16'h204b;
              5'h07: normal_out = 16'h2048;
              5'h08: normal_out = 16'h2045;
              5'h09: normal_out = 16'h2042;
              5'h0a: normal_out = 16'h203f;
              5'h0b: normal_out = 16'h203c;
              5'h0c: normal_out = 16'h2039;
              5'h0d: normal_out = 16'h2036;
              5'h0e: normal_out = 16'h2033;
              5'h0f: normal_out = 16'h2030;
              5'h10: normal_out = 16'h202d;
              5'h11: normal_out = 16'h202a;
              5'h12: normal_out = 16'h2028;
              5'h13: normal_out = 16'h2025;
              5'h14: normal_out = 16'h2022;
              5'h15: normal_out = 16'h201f;
              5'h16: normal_out = 16'h201c;
              5'h17: normal_out = 16'h2019;
              5'h18: normal_out = 16'h2016;
              5'h19: normal_out = 16'h2014;
              5'h1a: normal_out = 16'h2011;
              5'h1b: normal_out = 16'h200e;
              5'h1c: normal_out = 16'h200b;
              5'h1d: normal_out = 16'h2008;
              5'h1e: normal_out = 16'h2006;
              default: begin end
            endcase
          end
          5'h18: begin
            normal_out = 16'h1f5b;
            case (mant[4:0])
              5'h00: normal_out = 16'h2000;
              5'h01: normal_out = 16'h1ffa;
              5'h02: normal_out = 16'h1ff5;
              5'h03: normal_out = 16'h1fef;
              5'h04: normal_out = 16'h1fea;
              5'h05: normal_out = 16'h1fe4;
              5'h06: normal_out = 16'h1fdf;
              5'h07: normal_out = 16'h1fda;
              5'h08: normal_out = 16'h1fd4;
              5'h09: normal_out = 16'h1fcf;
              5'h0a: normal_out = 16'h1fc9;
              5'h0b: normal_out = 16'h1fc4;
              5'h0c: normal_out = 16'h1fbf;
              5'h0d: normal_out = 16'h1fb9;
              5'h0e: normal_out = 16'h1fb4;
              5'h0f: normal_out = 16'h1fae;
              5'h10: normal_out = 16'h1fa9;
              5'h11: normal_out = 16'h1fa4;
              5'h12: normal_out = 16'h1f9f;
              5'h13: normal_out = 16'h1f99;
              5'h14: normal_out = 16'h1f94;
              5'h15: normal_out = 16'h1f8f;
              5'h16: normal_out = 16'h1f8a;
              5'h17: normal_out = 16'h1f84;
              5'h18: normal_out = 16'h1f7f;
              5'h19: normal_out = 16'h1f7a;
              5'h1a: normal_out = 16'h1f75;
              5'h1b: normal_out = 16'h1f70;
              5'h1c: normal_out = 16'h1f6a;
              5'h1d: normal_out = 16'h1f65;
              5'h1e: normal_out = 16'h1f60;
              default: begin end
            endcase
          end
          5'h19: begin
            normal_out = 16'h1ebf;
            case (mant[4:0])
              5'h00: normal_out = 16'h1f56;
              5'h01: normal_out = 16'h1f51;
              5'h02: normal_out = 16'h1f4c;
              5'h03: normal_out = 16'h1f47;
              5'h04: normal_out = 16'h1f42;
              5'h05: normal_out = 16'h1f3d;
              5'h06: normal_out = 16'h1f38;
              5'h07: normal_out = 16'h1f33;
              5'h08: normal_out = 16'h1f2e;
              5'h09: normal_out = 16'h1f29;
              5'h0a: normal_out = 16'h1f24;
              5'h0b: normal_out = 16'h1f1f;
              5'h0c: normal_out = 16'h1f1a;
              5'h0d: normal_out = 16'h1f15;
              5'h0e: normal_out = 16'h1f10;
              5'h0f: normal_out = 16'h1f0b;
              5'h10: normal_out = 16'h1f06;
              5'h11: normal_out = 16'h1f02;
              5'h12: normal_out = 16'h1efd;
              5'h13: normal_out = 16'h1ef8;
              5'h14: normal_out = 16'h1ef3;
              5'h15: normal_out = 16'h1eee;
              5'h16: normal_out = 16'h1ee9;
              5'h17: normal_out = 16'h1ee5;
              5'h18: normal_out = 16'h1ee0;
              5'h19: normal_out = 16'h1edb;
              5'h1a: normal_out = 16'h1ed6;
              5'h1b: normal_out = 16'h1ed2;
              5'h1c: normal_out = 16'h1ecd;
              5'h1d: normal_out = 16'h1ec8;
              5'h1e: normal_out = 16'h1ec4;
              default: begin end
            endcase
          end
          5'h1a: begin
            normal_out = 16'h1e30;
            case (mant[4:0])
              5'h00: normal_out = 16'h1eba;
              5'h01: normal_out = 16'h1eb5;
              5'h02: normal_out = 16'h1eb1;
              5'h03: normal_out = 16'h1eac;
              5'h04: normal_out = 16'h1ea8;
              5'h05: normal_out = 16'h1ea3;
              5'h06: normal_out = 16'h1e9e;
              5'h07: normal_out = 16'h1e9a;
              5'h08: normal_out = 16'h1e95;
              5'h09: normal_out = 16'h1e91;
              5'h0a: normal_out = 16'h1e8c;
              5'h0b: normal_out = 16'h1e88;
              5'h0c: normal_out = 16'h1e83;
              5'h0d: normal_out = 16'h1e7f;
              5'h0e: normal_out = 16'h1e7a;
              5'h0f: normal_out = 16'h1e76;
              5'h10: normal_out = 16'h1e71;
              5'h11: normal_out = 16'h1e6d;
              5'h12: normal_out = 16'h1e68;
              5'h13: normal_out = 16'h1e64;
              5'h14: normal_out = 16'h1e5f;
              5'h15: normal_out = 16'h1e5b;
              5'h16: normal_out = 16'h1e57;
              5'h17: normal_out = 16'h1e52;
              5'h18: normal_out = 16'h1e4e;
              5'h19: normal_out = 16'h1e49;
              5'h1a: normal_out = 16'h1e45;
              5'h1b: normal_out = 16'h1e41;
              5'h1c: normal_out = 16'h1e3c;
              5'h1d: normal_out = 16'h1e38;
              5'h1e: normal_out = 16'h1e34;
              default: begin end
            endcase
          end
          5'h1b: begin
            normal_out = 16'h1dac;
            case (mant[4:0])
              5'h00: normal_out = 16'h1e2b;
              5'h01: normal_out = 16'h1e27;
              5'h02: normal_out = 16'h1e23;
              5'h03: normal_out = 16'h1e1e;
              5'h04: normal_out = 16'h1e1a;
              5'h05: normal_out = 16'h1e16;
              5'h06: normal_out = 16'h1e12;
              5'h07: normal_out = 16'h1e0e;
              5'h08: normal_out = 16'h1e09;
              5'h09: normal_out = 16'h1e05;
              5'h0a: normal_out = 16'h1e01;
              5'h0b: normal_out = 16'h1dfd;
              5'h0c: normal_out = 16'h1df9;
              5'h0d: normal_out = 16'h1df5;
              5'h0e: normal_out = 16'h1df0;
              5'h0f: normal_out = 16'h1dec;
              5'h10: normal_out = 16'h1de8;
              5'h11: normal_out = 16'h1de4;
              5'h12: normal_out = 16'h1de0;
              5'h13: normal_out = 16'h1ddc;
              5'h14: normal_out = 16'h1dd8;
              5'h15: normal_out = 16'h1dd4;
              5'h16: normal_out = 16'h1dd0;
              5'h17: normal_out = 16'h1dcc;
              5'h18: normal_out = 16'h1dc8;
              5'h19: normal_out = 16'h1dc4;
              5'h1a: normal_out = 16'h1dc0;
              5'h1b: normal_out = 16'h1dbc;
              5'h1c: normal_out = 16'h1db8;
              5'h1d: normal_out = 16'h1db4;
              5'h1e: normal_out = 16'h1db0;
              default: begin end
            endcase
          end
          5'h1c: begin
            normal_out = 16'h1d34;
            case (mant[4:0])
              5'h00: normal_out = 16'h1da8;
              5'h01: normal_out = 16'h1da4;
              5'h02: normal_out = 16'h1da0;
              5'h03: normal_out = 16'h1d9c;
              5'h04: normal_out = 16'h1d99;
              5'h05: normal_out = 16'h1d95;
              5'h06: normal_out = 16'h1d91;
              5'h07: normal_out = 16'h1d8d;
              5'h08: normal_out = 16'h1d89;
              5'h09: normal_out = 16'h1d85;
              5'h0a: normal_out = 16'h1d81;
              5'h0b: normal_out = 16'h1d7e;
              5'h0c: normal_out = 16'h1d7a;
              5'h0d: normal_out = 16'h1d76;
              5'h0e: normal_out = 16'h1d72;
              5'h0f: normal_out = 16'h1d6f;
              5'h10: normal_out = 16'h1d6b;
              5'h11: normal_out = 16'h1d67;
              5'h12: normal_out = 16'h1d63;
              5'h13: normal_out = 16'h1d60;
              5'h14: normal_out = 16'h1d5c;
              5'h15: normal_out = 16'h1d58;
              5'h16: normal_out = 16'h1d54;
              5'h17: normal_out = 16'h1d51;
              5'h18: normal_out = 16'h1d4d;
              5'h19: normal_out = 16'h1d49;
              5'h1a: normal_out = 16'h1d46;
              5'h1b: normal_out = 16'h1d42;
              5'h1c: normal_out = 16'h1d3e;
              5'h1d: normal_out = 16'h1d3b;
              5'h1e: normal_out = 16'h1d37;
              default: begin end
            endcase
          end
          5'h1d: begin
            normal_out = 16'h1cc5;
            case (mant[4:0])
              5'h00: normal_out = 16'h1d30;
              5'h01: normal_out = 16'h1d2c;
              5'h02: normal_out = 16'h1d29;
              5'h03: normal_out = 16'h1d25;
              5'h04: normal_out = 16'h1d22;
              5'h05: normal_out = 16'h1d1e;
              5'h06: normal_out = 16'h1d1b;
              5'h07: normal_out = 16'h1d17;
              5'h08: normal_out = 16'h1d14;
              5'h09: normal_out = 16'h1d10;
              5'h0a: normal_out = 16'h1d0c;
              5'h0b: normal_out = 16'h1d09;
              5'h0c: normal_out = 16'h1d06;
              5'h0d: normal_out = 16'h1d02;
              5'h0e: normal_out = 16'h1cff;
              5'h0f: normal_out = 16'h1cfb;
              5'h10: normal_out = 16'h1cf8;
              5'h11: normal_out = 16'h1cf4;
              5'h12: normal_out = 16'h1cf1;
              5'h13: normal_out = 16'h1ced;
              5'h14: normal_out = 16'h1cea;
              5'h15: normal_out = 16'h1ce7;
              5'h16: normal_out = 16'h1ce3;
              5'h17: normal_out = 16'h1ce0;
              5'h18: normal_out = 16'h1cdc;
              5'h19: normal_out = 16'h1cd9;
              5'h1a: normal_out = 16'h1cd6;
              5'h1b: normal_out = 16'h1cd2;
              5'h1c: normal_out = 16'h1ccf;
              5'h1d: normal_out = 16'h1ccc;
              5'h1e: normal_out = 16'h1cc8;
              default: begin end
            endcase
          end
          5'h1e: begin
            normal_out = 16'h1c60;
            case (mant[4:0])
              5'h00: normal_out = 16'h1cc2;
              5'h01: normal_out = 16'h1cbe;
              5'h02: normal_out = 16'h1cbb;
              5'h03: normal_out = 16'h1cb8;
              5'h04: normal_out = 16'h1cb5;
              5'h05: normal_out = 16'h1cb1;
              5'h06: normal_out = 16'h1cae;
              5'h07: normal_out = 16'h1cab;
              5'h08: normal_out = 16'h1ca8;
              5'h09: normal_out = 16'h1ca4;
              5'h0a: normal_out = 16'h1ca1;
              5'h0b: normal_out = 16'h1c9e;
              5'h0c: normal_out = 16'h1c9b;
              5'h0d: normal_out = 16'h1c98;
              5'h0e: normal_out = 16'h1c94;
              5'h0f: normal_out = 16'h1c91;
              5'h10: normal_out = 16'h1c8e;
              5'h11: normal_out = 16'h1c8b;
              5'h12: normal_out = 16'h1c88;
              5'h13: normal_out = 16'h1c85;
              5'h14: normal_out = 16'h1c82;
              5'h15: normal_out = 16'h1c7e;
              5'h16: normal_out = 16'h1c7b;
              5'h17: normal_out = 16'h1c78;
              5'h18: normal_out = 16'h1c75;
              5'h19: normal_out = 16'h1c72;
              5'h1a: normal_out = 16'h1c6f;
              5'h1b: normal_out = 16'h1c6c;
              5'h1c: normal_out = 16'h1c69;
              5'h1d: normal_out = 16'h1c66;
              5'h1e: normal_out = 16'h1c63;
              default: begin end
            endcase
          end
          5'h1f: begin
            normal_out = 16'h1c03;
            case (mant[4:0])
              5'h00: normal_out = 16'h1c5d;
              5'h01: normal_out = 16'h1c5a;
              5'h02: normal_out = 16'h1c57;
              5'h03: normal_out = 16'h1c54;
              5'h04: normal_out = 16'h1c51;
              5'h05: normal_out = 16'h1c4e;
              5'h06: normal_out = 16'h1c4b;
              5'h07: normal_out = 16'h1c48;
              5'h08: normal_out = 16'h1c45;
              5'h09: normal_out = 16'h1c42;
              5'h0a: normal_out = 16'h1c3f;
              5'h0b: normal_out = 16'h1c3c;
              5'h0c: normal_out = 16'h1c39;
              5'h0d: normal_out = 16'h1c36;
              5'h0e: normal_out = 16'h1c33;
              5'h0f: normal_out = 16'h1c30;
              5'h10: normal_out = 16'h1c2d;
              5'h11: normal_out = 16'h1c2a;
              5'h12: normal_out = 16'h1c28;
              5'h13: normal_out = 16'h1c25;
              5'h14: normal_out = 16'h1c22;
              5'h15: normal_out = 16'h1c1f;
              5'h16: normal_out = 16'h1c1c;
              5'h17: normal_out = 16'h1c19;
              5'h18: normal_out = 16'h1c16;
              5'h19: normal_out = 16'h1c14;
              5'h1a: normal_out = 16'h1c11;
              5'h1b: normal_out = 16'h1c0e;
              5'h1c: normal_out = 16'h1c0b;
              5'h1d: normal_out = 16'h1c08;
              5'h1e: normal_out = 16'h1c06;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      6'h32: begin
        case (mant[9:5])
          5'h00: begin
            normal_out = 16'h1ac4;
            case (mant[4:0])
              5'h00: normal_out = 16'h1c00;
              5'h01: normal_out = 16'h1bf5;
              5'h02: normal_out = 16'h1bea;
              5'h03: normal_out = 16'h1bdf;
              5'h04: normal_out = 16'h1bd4;
              5'h05: normal_out = 16'h1bc9;
              5'h06: normal_out = 16'h1bbf;
              5'h07: normal_out = 16'h1bb4;
              5'h08: normal_out = 16'h1ba9;
              5'h09: normal_out = 16'h1b9f;
              5'h0a: normal_out = 16'h1b94;
              5'h0b: normal_out = 16'h1b8a;
              5'h0c: normal_out = 16'h1b7f;
              5'h0d: normal_out = 16'h1b75;
              5'h0e: normal_out = 16'h1b6a;
              5'h0f: normal_out = 16'h1b60;
              5'h10: normal_out = 16'h1b56;
              5'h11: normal_out = 16'h1b4c;
              5'h12: normal_out = 16'h1b42;
              5'h13: normal_out = 16'h1b38;
              5'h14: normal_out = 16'h1b2e;
              5'h15: normal_out = 16'h1b24;
              5'h16: normal_out = 16'h1b1a;
              5'h17: normal_out = 16'h1b10;
              5'h18: normal_out = 16'h1b06;
              5'h19: normal_out = 16'h1afd;
              5'h1a: normal_out = 16'h1af3;
              5'h1b: normal_out = 16'h1ae9;
              5'h1c: normal_out = 16'h1ae0;
              5'h1d: normal_out = 16'h1ad6;
              5'h1e: normal_out = 16'h1acd;
              default: begin end
            endcase
          end
          5'h01: begin
            normal_out = 16'h19b0;
            case (mant[4:0])
              5'h00: normal_out = 16'h1aba;
              5'h01: normal_out = 16'h1ab1;
              5'h02: normal_out = 16'h1aa8;
              5'h03: normal_out = 16'h1a9e;
              5'h04: normal_out = 16'h1a95;
              5'h05: normal_out = 16'h1a8c;
              5'h06: normal_out = 16'h1a83;
              5'h07: normal_out = 16'h1a7a;
              5'h08: normal_out = 16'h1a71;
              5'h09: normal_out = 16'h1a68;
              5'h0a: normal_out = 16'h1a5f;
              5'h0b: normal_out = 16'h1a57;
              5'h0c: normal_out = 16'h1a4e;
              5'h0d: normal_out = 16'h1a45;
              5'h0e: normal_out = 16'h1a3c;
              5'h0f: normal_out = 16'h1a34;
              5'h10: normal_out = 16'h1a2b;
              5'h11: normal_out = 16'h1a23;
              5'h12: normal_out = 16'h1a1a;
              5'h13: normal_out = 16'h1a12;
              5'h14: normal_out = 16'h1a09;
              5'h15: normal_out = 16'h1a01;
              5'h16: normal_out = 16'h19f9;
              5'h17: normal_out = 16'h19f0;
              5'h18: normal_out = 16'h19e8;
              5'h19: normal_out = 16'h19e0;
              5'h1a: normal_out = 16'h19d8;
              5'h1b: normal_out = 16'h19d0;
              5'h1c: normal_out = 16'h19c8;
              5'h1d: normal_out = 16'h19c0;
              5'h1e: normal_out = 16'h19b8;
              default: begin end
            endcase
          end
          5'h02: begin
            normal_out = 16'h18c8;
            case (mant[4:0])
              5'h00: normal_out = 16'h19a8;
              5'h01: normal_out = 16'h19a0;
              5'h02: normal_out = 16'h1999;
              5'h03: normal_out = 16'h1991;
              5'h04: normal_out = 16'h1989;
              5'h05: normal_out = 16'h1981;
              5'h06: normal_out = 16'h197a;
              5'h07: normal_out = 16'h1972;
              5'h08: normal_out = 16'h196b;
              5'h09: normal_out = 16'h1963;
              5'h0a: normal_out = 16'h195c;
              5'h0b: normal_out = 16'h1954;
              5'h0c: normal_out = 16'h194d;
              5'h0d: normal_out = 16'h1946;
              5'h0e: normal_out = 16'h193e;
              5'h0f: normal_out = 16'h1937;
              5'h10: normal_out = 16'h1930;
              5'h11: normal_out = 16'h1929;
              5'h12: normal_out = 16'h1922;
              5'h13: normal_out = 16'h191b;
              5'h14: normal_out = 16'h1914;
              5'h15: normal_out = 16'h190c;
              5'h16: normal_out = 16'h1906;
              5'h17: normal_out = 16'h18ff;
              5'h18: normal_out = 16'h18f8;
              5'h19: normal_out = 16'h18f1;
              5'h1a: normal_out = 16'h18ea;
              5'h1b: normal_out = 16'h18e3;
              5'h1c: normal_out = 16'h18dc;
              5'h1d: normal_out = 16'h18d6;
              5'h1e: normal_out = 16'h18cf;
              default: begin end
            endcase
          end
          5'h03: begin
            normal_out = 16'h1806;
            case (mant[4:0])
              5'h00: normal_out = 16'h18c2;
              5'h01: normal_out = 16'h18bb;
              5'h02: normal_out = 16'h18b5;
              5'h03: normal_out = 16'h18ae;
              5'h04: normal_out = 16'h18a8;
              5'h05: normal_out = 16'h18a1;
              5'h06: normal_out = 16'h189b;
              5'h07: normal_out = 16'h1894;
              5'h08: normal_out = 16'h188e;
              5'h09: normal_out = 16'h1888;
              5'h0a: normal_out = 16'h1882;
              5'h0b: normal_out = 16'h187b;
              5'h0c: normal_out = 16'h1875;
              5'h0d: normal_out = 16'h186f;
              5'h0e: normal_out = 16'h1869;
              5'h0f: normal_out = 16'h1863;
              5'h10: normal_out = 16'h185d;
              5'h11: normal_out = 16'h1857;
              5'h12: normal_out = 16'h1851;
              5'h13: normal_out = 16'h184b;
              5'h14: normal_out = 16'h1845;
              5'h15: normal_out = 16'h183f;
              5'h16: normal_out = 16'h1839;
              5'h17: normal_out = 16'h1833;
              5'h18: normal_out = 16'h182d;
              5'h19: normal_out = 16'h1828;
              5'h1a: normal_out = 16'h1822;
              5'h1b: normal_out = 16'h181c;
              5'h1c: normal_out = 16'h1816;
              5'h1d: normal_out = 16'h1811;
              5'h1e: normal_out = 16'h180b;
              default: begin end
            endcase
          end
          5'h04: begin
            normal_out = 16'h16c4;
            case (mant[4:0])
              5'h00: normal_out = 16'h1800;
              5'h01: normal_out = 16'h17f5;
              5'h02: normal_out = 16'h17ea;
              5'h03: normal_out = 16'h17df;
              5'h04: normal_out = 16'h17d4;
              5'h05: normal_out = 16'h17c9;
              5'h06: normal_out = 16'h17bf;
              5'h07: normal_out = 16'h17b4;
              5'h08: normal_out = 16'h17a9;
              5'h09: normal_out = 16'h179f;
              5'h0a: normal_out = 16'h1794;
              5'h0b: normal_out = 16'h178a;
              5'h0c: normal_out = 16'h177f;
              5'h0d: normal_out = 16'h1775;
              5'h0e: normal_out = 16'h176a;
              5'h0f: normal_out = 16'h1760;
              5'h10: normal_out = 16'h1756;
              5'h11: normal_out = 16'h174c;
              5'h12: normal_out = 16'h1742;
              5'h13: normal_out = 16'h1738;
              5'h14: normal_out = 16'h172e;
              5'h15: normal_out = 16'h1724;
              5'h16: normal_out = 16'h171a;
              5'h17: normal_out = 16'h1710;
              5'h18: normal_out = 16'h1706;
              5'h19: normal_out = 16'h16fd;
              5'h1a: normal_out = 16'h16f3;
              5'h1b: normal_out = 16'h16e9;
              5'h1c: normal_out = 16'h16e0;
              5'h1d: normal_out = 16'h16d6;
              5'h1e: normal_out = 16'h16cd;
              default: begin end
            endcase
          end
          5'h05: begin
            normal_out = 16'h15b0;
            case (mant[4:0])
              5'h00: normal_out = 16'h16ba;
              5'h01: normal_out = 16'h16b1;
              5'h02: normal_out = 16'h16a8;
              5'h03: normal_out = 16'h169e;
              5'h04: normal_out = 16'h1695;
              5'h05: normal_out = 16'h168c;
              5'h06: normal_out = 16'h1683;
              5'h07: normal_out = 16'h167a;
              5'h08: normal_out = 16'h1671;
              5'h09: normal_out = 16'h1668;
              5'h0a: normal_out = 16'h165f;
              5'h0b: normal_out = 16'h1657;
              5'h0c: normal_out = 16'h164e;
              5'h0d: normal_out = 16'h1645;
              5'h0e: normal_out = 16'h163c;
              5'h0f: normal_out = 16'h1634;
              5'h10: normal_out = 16'h162b;
              5'h11: normal_out = 16'h1623;
              5'h12: normal_out = 16'h161a;
              5'h13: normal_out = 16'h1612;
              5'h14: normal_out = 16'h1609;
              5'h15: normal_out = 16'h1601;
              5'h16: normal_out = 16'h15f9;
              5'h17: normal_out = 16'h15f0;
              5'h18: normal_out = 16'h15e8;
              5'h19: normal_out = 16'h15e0;
              5'h1a: normal_out = 16'h15d8;
              5'h1b: normal_out = 16'h15d0;
              5'h1c: normal_out = 16'h15c8;
              5'h1d: normal_out = 16'h15c0;
              5'h1e: normal_out = 16'h15b8;
              default: begin end
            endcase
          end
          5'h06: begin
            normal_out = 16'h14c8;
            case (mant[4:0])
              5'h00: normal_out = 16'h15a8;
              5'h01: normal_out = 16'h15a0;
              5'h02: normal_out = 16'h1599;
              5'h03: normal_out = 16'h1591;
              5'h04: normal_out = 16'h1589;
              5'h05: normal_out = 16'h1581;
              5'h06: normal_out = 16'h157a;
              5'h07: normal_out = 16'h1572;
              5'h08: normal_out = 16'h156b;
              5'h09: normal_out = 16'h1563;
              5'h0a: normal_out = 16'h155c;
              5'h0b: normal_out = 16'h1554;
              5'h0c: normal_out = 16'h154d;
              5'h0d: normal_out = 16'h1546;
              5'h0e: normal_out = 16'h153e;
              5'h0f: normal_out = 16'h1537;
              5'h10: normal_out = 16'h1530;
              5'h11: normal_out = 16'h1529;
              5'h12: normal_out = 16'h1522;
              5'h13: normal_out = 16'h151b;
              5'h14: normal_out = 16'h1514;
              5'h15: normal_out = 16'h150c;
              5'h16: normal_out = 16'h1506;
              5'h17: normal_out = 16'h14ff;
              5'h18: normal_out = 16'h14f8;
              5'h19: normal_out = 16'h14f1;
              5'h1a: normal_out = 16'h14ea;
              5'h1b: normal_out = 16'h14e3;
              5'h1c: normal_out = 16'h14dc;
              5'h1d: normal_out = 16'h14d6;
              5'h1e: normal_out = 16'h14cf;
              default: begin end
            endcase
          end
          5'h07: begin
            normal_out = 16'h1406;
            case (mant[4:0])
              5'h00: normal_out = 16'h14c2;
              5'h01: normal_out = 16'h14bb;
              5'h02: normal_out = 16'h14b5;
              5'h03: normal_out = 16'h14ae;
              5'h04: normal_out = 16'h14a8;
              5'h05: normal_out = 16'h14a1;
              5'h06: normal_out = 16'h149b;
              5'h07: normal_out = 16'h1494;
              5'h08: normal_out = 16'h148e;
              5'h09: normal_out = 16'h1488;
              5'h0a: normal_out = 16'h1482;
              5'h0b: normal_out = 16'h147b;
              5'h0c: normal_out = 16'h1475;
              5'h0d: normal_out = 16'h146f;
              5'h0e: normal_out = 16'h1469;
              5'h0f: normal_out = 16'h1463;
              5'h10: normal_out = 16'h145d;
              5'h11: normal_out = 16'h1457;
              5'h12: normal_out = 16'h1451;
              5'h13: normal_out = 16'h144b;
              5'h14: normal_out = 16'h1445;
              5'h15: normal_out = 16'h143f;
              5'h16: normal_out = 16'h1439;
              5'h17: normal_out = 16'h1433;
              5'h18: normal_out = 16'h142d;
              5'h19: normal_out = 16'h1428;
              5'h1a: normal_out = 16'h1422;
              5'h1b: normal_out = 16'h141c;
              5'h1c: normal_out = 16'h1416;
              5'h1d: normal_out = 16'h1411;
              5'h1e: normal_out = 16'h140b;
              default: begin end
            endcase
          end
          5'h08: begin
            normal_out = 16'h12c4;
            case (mant[4:0])
              5'h00: normal_out = 16'h1400;
              5'h01: normal_out = 16'h13f5;
              5'h02: normal_out = 16'h13ea;
              5'h03: normal_out = 16'h13df;
              5'h04: normal_out = 16'h13d4;
              5'h05: normal_out = 16'h13c9;
              5'h06: normal_out = 16'h13bf;
              5'h07: normal_out = 16'h13b4;
              5'h08: normal_out = 16'h13a9;
              5'h09: normal_out = 16'h139f;
              5'h0a: normal_out = 16'h1394;
              5'h0b: normal_out = 16'h138a;
              5'h0c: normal_out = 16'h137f;
              5'h0d: normal_out = 16'h1375;
              5'h0e: normal_out = 16'h136a;
              5'h0f: normal_out = 16'h1360;
              5'h10: normal_out = 16'h1356;
              5'h11: normal_out = 16'h134c;
              5'h12: normal_out = 16'h1342;
              5'h13: normal_out = 16'h1338;
              5'h14: normal_out = 16'h132e;
              5'h15: normal_out = 16'h1324;
              5'h16: normal_out = 16'h131a;
              5'h17: normal_out = 16'h1310;
              5'h18: normal_out = 16'h1306;
              5'h19: normal_out = 16'h12fd;
              5'h1a: normal_out = 16'h12f3;
              5'h1b: normal_out = 16'h12e9;
              5'h1c: normal_out = 16'h12e0;
              5'h1d: normal_out = 16'h12d6;
              5'h1e: normal_out = 16'h12cd;
              default: begin end
            endcase
          end
          5'h09: begin
            normal_out = 16'h11b0;
            case (mant[4:0])
              5'h00: normal_out = 16'h12ba;
              5'h01: normal_out = 16'h12b1;
              5'h02: normal_out = 16'h12a8;
              5'h03: normal_out = 16'h129e;
              5'h04: normal_out = 16'h1295;
              5'h05: normal_out = 16'h128c;
              5'h06: normal_out = 16'h1283;
              5'h07: normal_out = 16'h127a;
              5'h08: normal_out = 16'h1271;
              5'h09: normal_out = 16'h1268;
              5'h0a: normal_out = 16'h125f;
              5'h0b: normal_out = 16'h1257;
              5'h0c: normal_out = 16'h124e;
              5'h0d: normal_out = 16'h1245;
              5'h0e: normal_out = 16'h123c;
              5'h0f: normal_out = 16'h1234;
              5'h10: normal_out = 16'h122b;
              5'h11: normal_out = 16'h1223;
              5'h12: normal_out = 16'h121a;
              5'h13: normal_out = 16'h1212;
              5'h14: normal_out = 16'h1209;
              5'h15: normal_out = 16'h1201;
              5'h16: normal_out = 16'h11f9;
              5'h17: normal_out = 16'h11f0;
              5'h18: normal_out = 16'h11e8;
              5'h19: normal_out = 16'h11e0;
              5'h1a: normal_out = 16'h11d8;
              5'h1b: normal_out = 16'h11d0;
              5'h1c: normal_out = 16'h11c8;
              5'h1d: normal_out = 16'h11c0;
              5'h1e: normal_out = 16'h11b8;
              default: begin end
            endcase
          end
          5'h0a: begin
            normal_out = 16'h10c8;
            case (mant[4:0])
              5'h00: normal_out = 16'h11a8;
              5'h01: normal_out = 16'h11a0;
              5'h02: normal_out = 16'h1199;
              5'h03: normal_out = 16'h1191;
              5'h04: normal_out = 16'h1189;
              5'h05: normal_out = 16'h1181;
              5'h06: normal_out = 16'h117a;
              5'h07: normal_out = 16'h1172;
              5'h08: normal_out = 16'h116b;
              5'h09: normal_out = 16'h1163;
              5'h0a: normal_out = 16'h115c;
              5'h0b: normal_out = 16'h1154;
              5'h0c: normal_out = 16'h114d;
              5'h0d: normal_out = 16'h1146;
              5'h0e: normal_out = 16'h113e;
              5'h0f: normal_out = 16'h1137;
              5'h10: normal_out = 16'h1130;
              5'h11: normal_out = 16'h1129;
              5'h12: normal_out = 16'h1122;
              5'h13: normal_out = 16'h111b;
              5'h14: normal_out = 16'h1114;
              5'h15: normal_out = 16'h110c;
              5'h16: normal_out = 16'h1106;
              5'h17: normal_out = 16'h10ff;
              5'h18: normal_out = 16'h10f8;
              5'h19: normal_out = 16'h10f1;
              5'h1a: normal_out = 16'h10ea;
              5'h1b: normal_out = 16'h10e3;
              5'h1c: normal_out = 16'h10dc;
              5'h1d: normal_out = 16'h10d6;
              5'h1e: normal_out = 16'h10cf;
              default: begin end
            endcase
          end
          5'h0b: begin
            normal_out = 16'h1006;
            case (mant[4:0])
              5'h00: normal_out = 16'h10c2;
              5'h01: normal_out = 16'h10bb;
              5'h02: normal_out = 16'h10b5;
              5'h03: normal_out = 16'h10ae;
              5'h04: normal_out = 16'h10a8;
              5'h05: normal_out = 16'h10a1;
              5'h06: normal_out = 16'h109b;
              5'h07: normal_out = 16'h1094;
              5'h08: normal_out = 16'h108e;
              5'h09: normal_out = 16'h1088;
              5'h0a: normal_out = 16'h1082;
              5'h0b: normal_out = 16'h107b;
              5'h0c: normal_out = 16'h1075;
              5'h0d: normal_out = 16'h106f;
              5'h0e: normal_out = 16'h1069;
              5'h0f: normal_out = 16'h1063;
              5'h10: normal_out = 16'h105d;
              5'h11: normal_out = 16'h1057;
              5'h12: normal_out = 16'h1051;
              5'h13: normal_out = 16'h104b;
              5'h14: normal_out = 16'h1045;
              5'h15: normal_out = 16'h103f;
              5'h16: normal_out = 16'h1039;
              5'h17: normal_out = 16'h1033;
              5'h18: normal_out = 16'h102d;
              5'h19: normal_out = 16'h1028;
              5'h1a: normal_out = 16'h1022;
              5'h1b: normal_out = 16'h101c;
              5'h1c: normal_out = 16'h1016;
              5'h1d: normal_out = 16'h1011;
              5'h1e: normal_out = 16'h100b;
              default: begin end
            endcase
          end
          5'h0c: begin
            normal_out = 16'h0ec4;
            case (mant[4:0])
              5'h00: normal_out = 16'h1000;
              5'h01: normal_out = 16'h0ff5;
              5'h02: normal_out = 16'h0fea;
              5'h03: normal_out = 16'h0fdf;
              5'h04: normal_out = 16'h0fd4;
              5'h05: normal_out = 16'h0fc9;
              5'h06: normal_out = 16'h0fbf;
              5'h07: normal_out = 16'h0fb4;
              5'h08: normal_out = 16'h0fa9;
              5'h09: normal_out = 16'h0f9f;
              5'h0a: normal_out = 16'h0f94;
              5'h0b: normal_out = 16'h0f8a;
              5'h0c: normal_out = 16'h0f7f;
              5'h0d: normal_out = 16'h0f75;
              5'h0e: normal_out = 16'h0f6a;
              5'h0f: normal_out = 16'h0f60;
              5'h10: normal_out = 16'h0f56;
              5'h11: normal_out = 16'h0f4c;
              5'h12: normal_out = 16'h0f42;
              5'h13: normal_out = 16'h0f38;
              5'h14: normal_out = 16'h0f2e;
              5'h15: normal_out = 16'h0f24;
              5'h16: normal_out = 16'h0f1a;
              5'h17: normal_out = 16'h0f10;
              5'h18: normal_out = 16'h0f06;
              5'h19: normal_out = 16'h0efd;
              5'h1a: normal_out = 16'h0ef3;
              5'h1b: normal_out = 16'h0ee9;
              5'h1c: normal_out = 16'h0ee0;
              5'h1d: normal_out = 16'h0ed6;
              5'h1e: normal_out = 16'h0ecd;
              default: begin end
            endcase
          end
          5'h0d: begin
            normal_out = 16'h0db0;
            case (mant[4:0])
              5'h00: normal_out = 16'h0eba;
              5'h01: normal_out = 16'h0eb1;
              5'h02: normal_out = 16'h0ea8;
              5'h03: normal_out = 16'h0e9e;
              5'h04: normal_out = 16'h0e95;
              5'h05: normal_out = 16'h0e8c;
              5'h06: normal_out = 16'h0e83;
              5'h07: normal_out = 16'h0e7a;
              5'h08: normal_out = 16'h0e71;
              5'h09: normal_out = 16'h0e68;
              5'h0a: normal_out = 16'h0e5f;
              5'h0b: normal_out = 16'h0e57;
              5'h0c: normal_out = 16'h0e4e;
              5'h0d: normal_out = 16'h0e45;
              5'h0e: normal_out = 16'h0e3c;
              5'h0f: normal_out = 16'h0e34;
              5'h10: normal_out = 16'h0e2b;
              5'h11: normal_out = 16'h0e23;
              5'h12: normal_out = 16'h0e1a;
              5'h13: normal_out = 16'h0e12;
              5'h14: normal_out = 16'h0e09;
              5'h15: normal_out = 16'h0e01;
              5'h16: normal_out = 16'h0df9;
              5'h17: normal_out = 16'h0df0;
              5'h18: normal_out = 16'h0de8;
              5'h19: normal_out = 16'h0de0;
              5'h1a: normal_out = 16'h0dd8;
              5'h1b: normal_out = 16'h0dd0;
              5'h1c: normal_out = 16'h0dc8;
              5'h1d: normal_out = 16'h0dc0;
              5'h1e: normal_out = 16'h0db8;
              default: begin end
            endcase
          end
          5'h0e: begin
            normal_out = 16'h0cc8;
            case (mant[4:0])
              5'h00: normal_out = 16'h0da8;
              5'h01: normal_out = 16'h0da0;
              5'h02: normal_out = 16'h0d99;
              5'h03: normal_out = 16'h0d91;
              5'h04: normal_out = 16'h0d89;
              5'h05: normal_out = 16'h0d81;
              5'h06: normal_out = 16'h0d7a;
              5'h07: normal_out = 16'h0d72;
              5'h08: normal_out = 16'h0d6b;
              5'h09: normal_out = 16'h0d63;
              5'h0a: normal_out = 16'h0d5c;
              5'h0b: normal_out = 16'h0d54;
              5'h0c: normal_out = 16'h0d4d;
              5'h0d: normal_out = 16'h0d46;
              5'h0e: normal_out = 16'h0d3e;
              5'h0f: normal_out = 16'h0d37;
              5'h10: normal_out = 16'h0d30;
              5'h11: normal_out = 16'h0d29;
              5'h12: normal_out = 16'h0d22;
              5'h13: normal_out = 16'h0d1b;
              5'h14: normal_out = 16'h0d14;
              5'h15: normal_out = 16'h0d0c;
              5'h16: normal_out = 16'h0d06;
              5'h17: normal_out = 16'h0cff;
              5'h18: normal_out = 16'h0cf8;
              5'h19: normal_out = 16'h0cf1;
              5'h1a: normal_out = 16'h0cea;
              5'h1b: normal_out = 16'h0ce3;
              5'h1c: normal_out = 16'h0cdc;
              5'h1d: normal_out = 16'h0cd6;
              5'h1e: normal_out = 16'h0ccf;
              default: begin end
            endcase
          end
          5'h0f: begin
            normal_out = 16'h0c06;
            case (mant[4:0])
              5'h00: normal_out = 16'h0cc2;
              5'h01: normal_out = 16'h0cbb;
              5'h02: normal_out = 16'h0cb5;
              5'h03: normal_out = 16'h0cae;
              5'h04: normal_out = 16'h0ca8;
              5'h05: normal_out = 16'h0ca1;
              5'h06: normal_out = 16'h0c9b;
              5'h07: normal_out = 16'h0c94;
              5'h08: normal_out = 16'h0c8e;
              5'h09: normal_out = 16'h0c88;
              5'h0a: normal_out = 16'h0c82;
              5'h0b: normal_out = 16'h0c7b;
              5'h0c: normal_out = 16'h0c75;
              5'h0d: normal_out = 16'h0c6f;
              5'h0e: normal_out = 16'h0c69;
              5'h0f: normal_out = 16'h0c63;
              5'h10: normal_out = 16'h0c5d;
              5'h11: normal_out = 16'h0c57;
              5'h12: normal_out = 16'h0c51;
              5'h13: normal_out = 16'h0c4b;
              5'h14: normal_out = 16'h0c45;
              5'h15: normal_out = 16'h0c3f;
              5'h16: normal_out = 16'h0c39;
              5'h17: normal_out = 16'h0c33;
              5'h18: normal_out = 16'h0c2d;
              5'h19: normal_out = 16'h0c28;
              5'h1a: normal_out = 16'h0c22;
              5'h1b: normal_out = 16'h0c1c;
              5'h1c: normal_out = 16'h0c16;
              5'h1d: normal_out = 16'h0c11;
              5'h1e: normal_out = 16'h0c0b;
              default: begin end
            endcase
          end
          5'h10: begin
            normal_out = 16'h0ac4;
            case (mant[4:0])
              5'h00: normal_out = 16'h0c00;
              5'h01: normal_out = 16'h0bf5;
              5'h02: normal_out = 16'h0bea;
              5'h03: normal_out = 16'h0bdf;
              5'h04: normal_out = 16'h0bd4;
              5'h05: normal_out = 16'h0bc9;
              5'h06: normal_out = 16'h0bbf;
              5'h07: normal_out = 16'h0bb4;
              5'h08: normal_out = 16'h0ba9;
              5'h09: normal_out = 16'h0b9f;
              5'h0a: normal_out = 16'h0b94;
              5'h0b: normal_out = 16'h0b8a;
              5'h0c: normal_out = 16'h0b7f;
              5'h0d: normal_out = 16'h0b75;
              5'h0e: normal_out = 16'h0b6a;
              5'h0f: normal_out = 16'h0b60;
              5'h10: normal_out = 16'h0b56;
              5'h11: normal_out = 16'h0b4c;
              5'h12: normal_out = 16'h0b42;
              5'h13: normal_out = 16'h0b38;
              5'h14: normal_out = 16'h0b2e;
              5'h15: normal_out = 16'h0b24;
              5'h16: normal_out = 16'h0b1a;
              5'h17: normal_out = 16'h0b10;
              5'h18: normal_out = 16'h0b06;
              5'h19: normal_out = 16'h0afd;
              5'h1a: normal_out = 16'h0af3;
              5'h1b: normal_out = 16'h0ae9;
              5'h1c: normal_out = 16'h0ae0;
              5'h1d: normal_out = 16'h0ad6;
              5'h1e: normal_out = 16'h0acd;
              default: begin end
            endcase
          end
          5'h11: begin
            normal_out = 16'h09b0;
            case (mant[4:0])
              5'h00: normal_out = 16'h0aba;
              5'h01: normal_out = 16'h0ab1;
              5'h02: normal_out = 16'h0aa8;
              5'h03: normal_out = 16'h0a9e;
              5'h04: normal_out = 16'h0a95;
              5'h05: normal_out = 16'h0a8c;
              5'h06: normal_out = 16'h0a83;
              5'h07: normal_out = 16'h0a7a;
              5'h08: normal_out = 16'h0a71;
              5'h09: normal_out = 16'h0a68;
              5'h0a: normal_out = 16'h0a5f;
              5'h0b: normal_out = 16'h0a57;
              5'h0c: normal_out = 16'h0a4e;
              5'h0d: normal_out = 16'h0a45;
              5'h0e: normal_out = 16'h0a3c;
              5'h0f: normal_out = 16'h0a34;
              5'h10: normal_out = 16'h0a2b;
              5'h11: normal_out = 16'h0a23;
              5'h12: normal_out = 16'h0a1a;
              5'h13: normal_out = 16'h0a12;
              5'h14: normal_out = 16'h0a09;
              5'h15: normal_out = 16'h0a01;
              5'h16: normal_out = 16'h09f9;
              5'h17: normal_out = 16'h09f0;
              5'h18: normal_out = 16'h09e8;
              5'h19: normal_out = 16'h09e0;
              5'h1a: normal_out = 16'h09d8;
              5'h1b: normal_out = 16'h09d0;
              5'h1c: normal_out = 16'h09c8;
              5'h1d: normal_out = 16'h09c0;
              5'h1e: normal_out = 16'h09b8;
              default: begin end
            endcase
          end
          5'h12: begin
            normal_out = 16'h08c8;
            case (mant[4:0])
              5'h00: normal_out = 16'h09a8;
              5'h01: normal_out = 16'h09a0;
              5'h02: normal_out = 16'h0999;
              5'h03: normal_out = 16'h0991;
              5'h04: normal_out = 16'h0989;
              5'h05: normal_out = 16'h0981;
              5'h06: normal_out = 16'h097a;
              5'h07: normal_out = 16'h0972;
              5'h08: normal_out = 16'h096b;
              5'h09: normal_out = 16'h0963;
              5'h0a: normal_out = 16'h095c;
              5'h0b: normal_out = 16'h0954;
              5'h0c: normal_out = 16'h094d;
              5'h0d: normal_out = 16'h0946;
              5'h0e: normal_out = 16'h093e;
              5'h0f: normal_out = 16'h0937;
              5'h10: normal_out = 16'h0930;
              5'h11: normal_out = 16'h0929;
              5'h12: normal_out = 16'h0922;
              5'h13: normal_out = 16'h091b;
              5'h14: normal_out = 16'h0914;
              5'h15: normal_out = 16'h090c;
              5'h16: normal_out = 16'h0906;
              5'h17: normal_out = 16'h08ff;
              5'h18: normal_out = 16'h08f8;
              5'h19: normal_out = 16'h08f1;
              5'h1a: normal_out = 16'h08ea;
              5'h1b: normal_out = 16'h08e3;
              5'h1c: normal_out = 16'h08dc;
              5'h1d: normal_out = 16'h08d6;
              5'h1e: normal_out = 16'h08cf;
              default: begin end
            endcase
          end
          5'h13: begin
            normal_out = 16'h0806;
            case (mant[4:0])
              5'h00: normal_out = 16'h08c2;
              5'h01: normal_out = 16'h08bb;
              5'h02: normal_out = 16'h08b5;
              5'h03: normal_out = 16'h08ae;
              5'h04: normal_out = 16'h08a8;
              5'h05: normal_out = 16'h08a1;
              5'h06: normal_out = 16'h089b;
              5'h07: normal_out = 16'h0894;
              5'h08: normal_out = 16'h088e;
              5'h09: normal_out = 16'h0888;
              5'h0a: normal_out = 16'h0882;
              5'h0b: normal_out = 16'h087b;
              5'h0c: normal_out = 16'h0875;
              5'h0d: normal_out = 16'h086f;
              5'h0e: normal_out = 16'h0869;
              5'h0f: normal_out = 16'h0863;
              5'h10: normal_out = 16'h085d;
              5'h11: normal_out = 16'h0857;
              5'h12: normal_out = 16'h0851;
              5'h13: normal_out = 16'h084b;
              5'h14: normal_out = 16'h0845;
              5'h15: normal_out = 16'h083f;
              5'h16: normal_out = 16'h0839;
              5'h17: normal_out = 16'h0833;
              5'h18: normal_out = 16'h082d;
              5'h19: normal_out = 16'h0828;
              5'h1a: normal_out = 16'h0822;
              5'h1b: normal_out = 16'h081c;
              5'h1c: normal_out = 16'h0816;
              5'h1d: normal_out = 16'h0811;
              5'h1e: normal_out = 16'h080b;
              default: begin end
            endcase
          end
          5'h14: begin
            normal_out = 16'h06c4;
            case (mant[4:0])
              5'h00: normal_out = 16'h0800;
              5'h01: normal_out = 16'h07f5;
              5'h02: normal_out = 16'h07ea;
              5'h03: normal_out = 16'h07df;
              5'h04: normal_out = 16'h07d4;
              5'h05: normal_out = 16'h07c9;
              5'h06: normal_out = 16'h07bf;
              5'h07: normal_out = 16'h07b4;
              5'h08: normal_out = 16'h07a9;
              5'h09: normal_out = 16'h079f;
              5'h0a: normal_out = 16'h0794;
              5'h0b: normal_out = 16'h078a;
              5'h0c: normal_out = 16'h077f;
              5'h0d: normal_out = 16'h0775;
              5'h0e: normal_out = 16'h076a;
              5'h0f: normal_out = 16'h0760;
              5'h10: normal_out = 16'h0756;
              5'h11: normal_out = 16'h074c;
              5'h12: normal_out = 16'h0742;
              5'h13: normal_out = 16'h0738;
              5'h14: normal_out = 16'h072e;
              5'h15: normal_out = 16'h0724;
              5'h16: normal_out = 16'h071a;
              5'h17: normal_out = 16'h0710;
              5'h18: normal_out = 16'h0706;
              5'h19: normal_out = 16'h06fd;
              5'h1a: normal_out = 16'h06f3;
              5'h1b: normal_out = 16'h06e9;
              5'h1c: normal_out = 16'h06e0;
              5'h1d: normal_out = 16'h06d6;
              5'h1e: normal_out = 16'h06cd;
              default: begin end
            endcase
          end
          5'h15: begin
            normal_out = 16'h05b0;
            case (mant[4:0])
              5'h00: normal_out = 16'h06ba;
              5'h01: normal_out = 16'h06b1;
              5'h02: normal_out = 16'h06a8;
              5'h03: normal_out = 16'h069e;
              5'h04: normal_out = 16'h0695;
              5'h05: normal_out = 16'h068c;
              5'h06: normal_out = 16'h0683;
              5'h07: normal_out = 16'h067a;
              5'h08: normal_out = 16'h0671;
              5'h09: normal_out = 16'h0668;
              5'h0a: normal_out = 16'h065f;
              5'h0b: normal_out = 16'h0657;
              5'h0c: normal_out = 16'h064e;
              5'h0d: normal_out = 16'h0645;
              5'h0e: normal_out = 16'h063c;
              5'h0f: normal_out = 16'h0634;
              5'h10: normal_out = 16'h062b;
              5'h11: normal_out = 16'h0623;
              5'h12: normal_out = 16'h061a;
              5'h13: normal_out = 16'h0612;
              5'h14: normal_out = 16'h0609;
              5'h15: normal_out = 16'h0601;
              5'h16: normal_out = 16'h05f9;
              5'h17: normal_out = 16'h05f0;
              5'h18: normal_out = 16'h05e8;
              5'h19: normal_out = 16'h05e0;
              5'h1a: normal_out = 16'h05d8;
              5'h1b: normal_out = 16'h05d0;
              5'h1c: normal_out = 16'h05c8;
              5'h1d: normal_out = 16'h05c0;
              5'h1e: normal_out = 16'h05b8;
              default: begin end
            endcase
          end
          5'h16: begin
            normal_out = 16'h04c8;
            case (mant[4:0])
              5'h00: normal_out = 16'h05a8;
              5'h01: normal_out = 16'h05a0;
              5'h02: normal_out = 16'h0599;
              5'h03: normal_out = 16'h0591;
              5'h04: normal_out = 16'h0589;
              5'h05: normal_out = 16'h0581;
              5'h06: normal_out = 16'h057a;
              5'h07: normal_out = 16'h0572;
              5'h08: normal_out = 16'h056b;
              5'h09: normal_out = 16'h0563;
              5'h0a: normal_out = 16'h055c;
              5'h0b: normal_out = 16'h0554;
              5'h0c: normal_out = 16'h054d;
              5'h0d: normal_out = 16'h0546;
              5'h0e: normal_out = 16'h053e;
              5'h0f: normal_out = 16'h0537;
              5'h10: normal_out = 16'h0530;
              5'h11: normal_out = 16'h0529;
              5'h12: normal_out = 16'h0522;
              5'h13: normal_out = 16'h051b;
              5'h14: normal_out = 16'h0514;
              5'h15: normal_out = 16'h050c;
              5'h16: normal_out = 16'h0506;
              5'h17: normal_out = 16'h04ff;
              5'h18: normal_out = 16'h04f8;
              5'h19: normal_out = 16'h04f1;
              5'h1a: normal_out = 16'h04ea;
              5'h1b: normal_out = 16'h04e3;
              5'h1c: normal_out = 16'h04dc;
              5'h1d: normal_out = 16'h04d6;
              5'h1e: normal_out = 16'h04cf;
              default: begin end
            endcase
          end
          5'h17: begin
            normal_out = 16'h0406;
            case (mant[4:0])
              5'h00: normal_out = 16'h04c2;
              5'h01: normal_out = 16'h04bb;
              5'h02: normal_out = 16'h04b5;
              5'h03: normal_out = 16'h04ae;
              5'h04: normal_out = 16'h04a8;
              5'h05: normal_out = 16'h04a1;
              5'h06: normal_out = 16'h049b;
              5'h07: normal_out = 16'h0494;
              5'h08: normal_out = 16'h048e;
              5'h09: normal_out = 16'h0488;
              5'h0a: normal_out = 16'h0482;
              5'h0b: normal_out = 16'h047b;
              5'h0c: normal_out = 16'h0475;
              5'h0d: normal_out = 16'h046f;
              5'h0e: normal_out = 16'h0469;
              5'h0f: normal_out = 16'h0463;
              5'h10: normal_out = 16'h045d;
              5'h11: normal_out = 16'h0457;
              5'h12: normal_out = 16'h0451;
              5'h13: normal_out = 16'h044b;
              5'h14: normal_out = 16'h0445;
              5'h15: normal_out = 16'h043f;
              5'h16: normal_out = 16'h0439;
              5'h17: normal_out = 16'h0433;
              5'h18: normal_out = 16'h042d;
              5'h19: normal_out = 16'h0428;
              5'h1a: normal_out = 16'h0422;
              5'h1b: normal_out = 16'h041c;
              5'h1c: normal_out = 16'h0416;
              5'h1d: normal_out = 16'h0411;
              5'h1e: normal_out = 16'h040b;
              default: begin end
            endcase
          end
          5'h18: begin
            normal_out = 16'h0000;
            case (mant[4:0])
              5'h00: normal_out = 16'h0400;
              default: begin end
            endcase
          end
          5'h19: normal_out = 16'h0000;
          5'h1a: normal_out = 16'h0000;
          5'h1b: normal_out = 16'h0000;
          5'h1c: normal_out = 16'h0000;
          5'h1d: normal_out = 16'h0000;
          5'h1e: normal_out = 16'h0000;
          5'h1f: normal_out = 16'h0000;
          default: begin end
        endcase
      end
      6'h3f: begin
        case (mant[9:5])
          5'h00: begin
            normal_out = 16'h7e00;
            case (mant[4:0])
              5'h00: normal_out = 16'h0000;
              default: begin end
            endcase
          end
          5'h01: normal_out = 16'h7e00;
          5'h02: normal_out = 16'h7e00;
          5'h03: normal_out = 16'h7e00;
          5'h04: normal_out = 16'h7e00;
          5'h05: normal_out = 16'h7e00;
          5'h06: normal_out = 16'h7e00;
          5'h07: normal_out = 16'h7e00;
          5'h08: normal_out = 16'h7e00;
          5'h09: normal_out = 16'h7e00;
          5'h0a: normal_out = 16'h7e00;
          5'h0b: normal_out = 16'h7e00;
          5'h0c: normal_out = 16'h7e00;
          5'h0d: normal_out = 16'h7e00;
          5'h0e: normal_out = 16'h7e00;
          5'h0f: normal_out = 16'h7e00;
          5'h10: normal_out = 16'h7e00;
          5'h11: normal_out = 16'h7e00;
          5'h12: normal_out = 16'h7e00;
          5'h13: normal_out = 16'h7e00;
          5'h14: normal_out = 16'h7e00;
          5'h15: normal_out = 16'h7e00;
          5'h16: normal_out = 16'h7e00;
          5'h17: normal_out = 16'h7e00;
          5'h18: normal_out = 16'h7e00;
          5'h19: normal_out = 16'h7e00;
          5'h1a: normal_out = 16'h7e00;
          5'h1b: normal_out = 16'h7e00;
          5'h1c: normal_out = 16'h7e00;
          5'h1d: normal_out = 16'h7e00;
          5'h1e: normal_out = 16'h7e00;
          5'h1f: normal_out = 16'h7e00;
          default: begin end
        endcase
      end
      default: begin end
    endcase
  end
  assign out = active_group ? normal_out : special_out;
endmodule
