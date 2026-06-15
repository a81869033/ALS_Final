module ex210_bf16_sigmoid_const_default_3f00_h3_first(in, out);
  input [15:0] in;
  output [15:0] out;
  wire [8:0] sign_exp = in[15:7];
  wire [6:0] mant = in[6:0];
  wire mant_hi1 = mant[6];
  wire [5:0] mant_lo6 = mant[5:0];
  wire [1:0] mant_hi2 = mant[6:5];
  wire [4:0] mant_lo5 = mant[4:0];
  wire [2:0] mant_hi3 = mant[6:4];
  wire [3:0] mant_lo4 = mant[3:0];
  wire [3:0] mant_hi4 = mant[6:3];
  wire [2:0] mant_lo3 = mant[2:0];
  wire [4:0] mant_hi5 = mant[6:2];
  wire [1:0] mant_lo2 = mant[1:0];
  wire [5:0] mant_hi6 = mant[6:1];
  wire mant_lo1 = mant[0];
  reg [15:0] out_r;
  always @* begin
    out_r = 16'h3f00;
    casez (sign_exp)
      9'b11000011?: out_r = 16'h0000;
      9'b110001???: out_r = 16'h0000;
      9'b11001????: out_r = 16'h0000;
      9'b1101?????: out_r = 16'h0000;
      9'b1110?????: out_r = 16'h0000;
      9'b11110????: out_r = 16'h0000;
      9'b111110???: out_r = 16'h0000;
      9'b1111110??: out_r = 16'h0000;
      9'b11111110?: out_r = 16'h0000;
      9'b111111110: out_r = 16'h0000;
      9'b01000001?: out_r = 16'h3f80;
      9'b0100001??: out_r = 16'h3f80;
      9'b010001???: out_r = 16'h3f80;
      9'b01001????: out_r = 16'h3f80;
      9'b0101?????: out_r = 16'h3f80;
      9'b0110?????: out_r = 16'h3f80;
      9'b01110????: out_r = 16'h3f80;
      9'b011110???: out_r = 16'h3f80;
      9'b0111110??: out_r = 16'h3f80;
      9'b01111110?: out_r = 16'h3f80;
      9'b011111110: out_r = 16'h3f80;
      9'h078: begin
        case (mant_hi3)
          3'h0: begin
            out_r = 16'h3f00;
            case (mant_lo4)
              4'h1: out_r = 16'h3f01;
              4'h2: out_r = 16'h3f01;
              4'h3: out_r = 16'h3f01;
              4'h4: out_r = 16'h3f01;
              4'h5: out_r = 16'h3f01;
              4'h6: out_r = 16'h3f01;
              4'h7: out_r = 16'h3f01;
              4'h8: out_r = 16'h3f01;
              4'h9: out_r = 16'h3f01;
              4'ha: out_r = 16'h3f01;
              4'hb: out_r = 16'h3f01;
              4'hc: out_r = 16'h3f01;
              4'hd: out_r = 16'h3f01;
              4'he: out_r = 16'h3f01;
              4'hf: out_r = 16'h3f01;
              default: begin end
            endcase
          end
          3'h1: begin
            out_r = 16'h3f01;
          end
          3'h2: begin
            out_r = 16'h3f01;
          end
          3'h3: begin
            out_r = 16'h3f01;
          end
          3'h4: begin
            out_r = 16'h3f01;
          end
          3'h5: begin
            out_r = 16'h3f01;
          end
          3'h6: begin
            out_r = 16'h3f01;
          end
          3'h7: begin
            out_r = 16'h3f01;
          end
          default: begin end
        endcase
      end
      9'h079: begin
        case (mant_hi3)
          3'h0: begin
            out_r = 16'h3f01;
          end
          3'h1: begin
            out_r = 16'h3f01;
          end
          3'h2: begin
            out_r = 16'h3f01;
          end
          3'h3: begin
            out_r = 16'h3f01;
          end
          3'h4: begin
            out_r = 16'h3f01;
            case (mant_lo4)
              4'h1: out_r = 16'h3f02;
              4'h2: out_r = 16'h3f02;
              4'h3: out_r = 16'h3f02;
              4'h4: out_r = 16'h3f02;
              4'h5: out_r = 16'h3f02;
              4'h6: out_r = 16'h3f02;
              4'h7: out_r = 16'h3f02;
              4'h8: out_r = 16'h3f02;
              4'h9: out_r = 16'h3f02;
              4'ha: out_r = 16'h3f02;
              4'hb: out_r = 16'h3f02;
              4'hc: out_r = 16'h3f02;
              4'hd: out_r = 16'h3f02;
              4'he: out_r = 16'h3f02;
              4'hf: out_r = 16'h3f02;
              default: begin end
            endcase
          end
          3'h5: begin
            out_r = 16'h3f02;
          end
          3'h6: begin
            out_r = 16'h3f02;
          end
          3'h7: begin
            out_r = 16'h3f02;
          end
          default: begin end
        endcase
      end
      9'h07a: begin
        case (mant_hi3)
          3'h0: begin
            out_r = 16'h3f02;
          end
          3'h1: begin
            out_r = 16'h3f02;
          end
          3'h2: begin
            out_r = 16'h3f02;
            case (mant_lo4)
              4'h1: out_r = 16'h3f03;
              4'h2: out_r = 16'h3f03;
              4'h3: out_r = 16'h3f03;
              4'h4: out_r = 16'h3f03;
              4'h5: out_r = 16'h3f03;
              4'h6: out_r = 16'h3f03;
              4'h7: out_r = 16'h3f03;
              4'h8: out_r = 16'h3f03;
              4'h9: out_r = 16'h3f03;
              4'ha: out_r = 16'h3f03;
              4'hb: out_r = 16'h3f03;
              4'hc: out_r = 16'h3f03;
              4'hd: out_r = 16'h3f03;
              4'he: out_r = 16'h3f03;
              4'hf: out_r = 16'h3f03;
              default: begin end
            endcase
          end
          3'h3: begin
            out_r = 16'h3f03;
          end
          3'h4: begin
            out_r = 16'h3f03;
          end
          3'h5: begin
            out_r = 16'h3f03;
          end
          3'h6: begin
            out_r = 16'h3f03;
            case (mant_lo4)
              4'h1: out_r = 16'h3f04;
              4'h2: out_r = 16'h3f04;
              4'h3: out_r = 16'h3f04;
              4'h4: out_r = 16'h3f04;
              4'h5: out_r = 16'h3f04;
              4'h6: out_r = 16'h3f04;
              4'h7: out_r = 16'h3f04;
              4'h8: out_r = 16'h3f04;
              4'h9: out_r = 16'h3f04;
              4'ha: out_r = 16'h3f04;
              4'hb: out_r = 16'h3f04;
              4'hc: out_r = 16'h3f04;
              4'hd: out_r = 16'h3f04;
              4'he: out_r = 16'h3f04;
              4'hf: out_r = 16'h3f04;
              default: begin end
            endcase
          end
          3'h7: begin
            out_r = 16'h3f04;
          end
          default: begin end
        endcase
      end
      9'h07b: begin
        case (mant_hi3)
          3'h0: begin
            out_r = 16'h3f04;
          end
          3'h1: begin
            out_r = 16'h3f04;
            case (mant_lo4)
              4'h1: out_r = 16'h3f05;
              4'h2: out_r = 16'h3f05;
              4'h3: out_r = 16'h3f05;
              4'h4: out_r = 16'h3f05;
              4'h5: out_r = 16'h3f05;
              4'h6: out_r = 16'h3f05;
              4'h7: out_r = 16'h3f05;
              4'h8: out_r = 16'h3f05;
              4'h9: out_r = 16'h3f05;
              4'ha: out_r = 16'h3f05;
              4'hb: out_r = 16'h3f05;
              4'hc: out_r = 16'h3f05;
              4'hd: out_r = 16'h3f05;
              4'he: out_r = 16'h3f05;
              4'hf: out_r = 16'h3f05;
              default: begin end
            endcase
          end
          3'h2: begin
            out_r = 16'h3f05;
          end
          3'h3: begin
            out_r = 16'h3f05;
            case (mant_lo4)
              4'h1: out_r = 16'h3f06;
              4'h2: out_r = 16'h3f06;
              4'h3: out_r = 16'h3f06;
              4'h4: out_r = 16'h3f06;
              4'h5: out_r = 16'h3f06;
              4'h6: out_r = 16'h3f06;
              4'h7: out_r = 16'h3f06;
              4'h8: out_r = 16'h3f06;
              4'h9: out_r = 16'h3f06;
              4'ha: out_r = 16'h3f06;
              4'hb: out_r = 16'h3f06;
              4'hc: out_r = 16'h3f06;
              4'hd: out_r = 16'h3f06;
              4'he: out_r = 16'h3f06;
              4'hf: out_r = 16'h3f06;
              default: begin end
            endcase
          end
          3'h4: begin
            out_r = 16'h3f06;
          end
          3'h5: begin
            out_r = 16'h3f06;
            case (mant_lo4)
              4'h1: out_r = 16'h3f07;
              4'h2: out_r = 16'h3f07;
              4'h3: out_r = 16'h3f07;
              4'h4: out_r = 16'h3f07;
              4'h5: out_r = 16'h3f07;
              4'h6: out_r = 16'h3f07;
              4'h7: out_r = 16'h3f07;
              4'h8: out_r = 16'h3f07;
              4'h9: out_r = 16'h3f07;
              4'ha: out_r = 16'h3f07;
              4'hb: out_r = 16'h3f07;
              4'hc: out_r = 16'h3f07;
              4'hd: out_r = 16'h3f07;
              4'he: out_r = 16'h3f07;
              4'hf: out_r = 16'h3f07;
              default: begin end
            endcase
          end
          3'h6: begin
            out_r = 16'h3f07;
          end
          3'h7: begin
            out_r = 16'h3f07;
            case (mant_lo4)
              4'h1: out_r = 16'h3f08;
              4'h2: out_r = 16'h3f08;
              4'h3: out_r = 16'h3f08;
              4'h4: out_r = 16'h3f08;
              4'h5: out_r = 16'h3f08;
              4'h6: out_r = 16'h3f08;
              4'h7: out_r = 16'h3f08;
              4'h8: out_r = 16'h3f08;
              4'h9: out_r = 16'h3f08;
              4'ha: out_r = 16'h3f08;
              4'hb: out_r = 16'h3f08;
              4'hc: out_r = 16'h3f08;
              4'hd: out_r = 16'h3f08;
              4'he: out_r = 16'h3f08;
              4'hf: out_r = 16'h3f08;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h07c: begin
        case (mant_hi3)
          3'h0: begin
            out_r = 16'h3f08;
            case (mant_lo4)
              4'h9: out_r = 16'h3f09;
              4'ha: out_r = 16'h3f09;
              4'hb: out_r = 16'h3f09;
              4'hc: out_r = 16'h3f09;
              4'hd: out_r = 16'h3f09;
              4'he: out_r = 16'h3f09;
              4'hf: out_r = 16'h3f09;
              default: begin end
            endcase
          end
          3'h1: begin
            out_r = 16'h3f09;
            case (mant_lo4)
              4'h9: out_r = 16'h3f0a;
              4'ha: out_r = 16'h3f0a;
              4'hb: out_r = 16'h3f0a;
              4'hc: out_r = 16'h3f0a;
              4'hd: out_r = 16'h3f0a;
              4'he: out_r = 16'h3f0a;
              4'hf: out_r = 16'h3f0a;
              default: begin end
            endcase
          end
          3'h2: begin
            out_r = 16'h3f0a;
            case (mant_lo4)
              4'h9: out_r = 16'h3f0b;
              4'ha: out_r = 16'h3f0b;
              4'hb: out_r = 16'h3f0b;
              4'hc: out_r = 16'h3f0b;
              4'hd: out_r = 16'h3f0b;
              4'he: out_r = 16'h3f0b;
              4'hf: out_r = 16'h3f0b;
              default: begin end
            endcase
          end
          3'h3: begin
            out_r = 16'h3f0b;
            case (mant_lo4)
              4'h9: out_r = 16'h3f0c;
              4'ha: out_r = 16'h3f0c;
              4'hb: out_r = 16'h3f0c;
              4'hc: out_r = 16'h3f0c;
              4'hd: out_r = 16'h3f0c;
              4'he: out_r = 16'h3f0c;
              4'hf: out_r = 16'h3f0c;
              default: begin end
            endcase
          end
          3'h4: begin
            out_r = 16'h3f0c;
            case (mant_lo4)
              4'h9: out_r = 16'h3f0d;
              4'ha: out_r = 16'h3f0d;
              4'hb: out_r = 16'h3f0d;
              4'hc: out_r = 16'h3f0d;
              4'hd: out_r = 16'h3f0d;
              4'he: out_r = 16'h3f0d;
              4'hf: out_r = 16'h3f0d;
              default: begin end
            endcase
          end
          3'h5: begin
            out_r = 16'h3f0d;
            case (mant_lo4)
              4'h9: out_r = 16'h3f0e;
              4'ha: out_r = 16'h3f0e;
              4'hb: out_r = 16'h3f0e;
              4'hc: out_r = 16'h3f0e;
              4'hd: out_r = 16'h3f0e;
              4'he: out_r = 16'h3f0e;
              4'hf: out_r = 16'h3f0e;
              default: begin end
            endcase
          end
          3'h6: begin
            out_r = 16'h3f0e;
            case (mant_lo4)
              4'ha: out_r = 16'h3f0f;
              4'hb: out_r = 16'h3f0f;
              4'hc: out_r = 16'h3f0f;
              4'hd: out_r = 16'h3f0f;
              4'he: out_r = 16'h3f0f;
              4'hf: out_r = 16'h3f0f;
              default: begin end
            endcase
          end
          3'h7: begin
            out_r = 16'h3f0f;
            case (mant_lo4)
              4'ha: out_r = 16'h3f10;
              4'hb: out_r = 16'h3f10;
              4'hc: out_r = 16'h3f10;
              4'hd: out_r = 16'h3f10;
              4'he: out_r = 16'h3f10;
              4'hf: out_r = 16'h3f10;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h07d: begin
        case (mant_hi3)
          3'h0: begin
            out_r = 16'h3f10;
            case (mant_lo4)
              4'h5: out_r = 16'h3f11;
              4'h6: out_r = 16'h3f11;
              4'h7: out_r = 16'h3f11;
              4'h8: out_r = 16'h3f11;
              4'h9: out_r = 16'h3f11;
              4'ha: out_r = 16'h3f11;
              4'hb: out_r = 16'h3f11;
              4'hc: out_r = 16'h3f11;
              4'hd: out_r = 16'h3f12;
              4'he: out_r = 16'h3f12;
              4'hf: out_r = 16'h3f12;
              default: begin end
            endcase
          end
          3'h1: begin
            out_r = 16'h3f12;
            case (mant_lo4)
              4'h6: out_r = 16'h3f13;
              4'h7: out_r = 16'h3f13;
              4'h8: out_r = 16'h3f13;
              4'h9: out_r = 16'h3f13;
              4'ha: out_r = 16'h3f13;
              4'hb: out_r = 16'h3f13;
              4'hc: out_r = 16'h3f13;
              4'hd: out_r = 16'h3f13;
              4'he: out_r = 16'h3f14;
              4'hf: out_r = 16'h3f14;
              default: begin end
            endcase
          end
          3'h2: begin
            out_r = 16'h3f14;
            case (mant_lo4)
              4'h6: out_r = 16'h3f15;
              4'h7: out_r = 16'h3f15;
              4'h8: out_r = 16'h3f15;
              4'h9: out_r = 16'h3f15;
              4'ha: out_r = 16'h3f15;
              4'hb: out_r = 16'h3f15;
              4'hc: out_r = 16'h3f15;
              4'hd: out_r = 16'h3f15;
              4'he: out_r = 16'h3f16;
              4'hf: out_r = 16'h3f16;
              default: begin end
            endcase
          end
          3'h3: begin
            out_r = 16'h3f16;
            case (mant_lo4)
              4'h6: out_r = 16'h3f17;
              4'h7: out_r = 16'h3f17;
              4'h8: out_r = 16'h3f17;
              4'h9: out_r = 16'h3f17;
              4'ha: out_r = 16'h3f17;
              4'hb: out_r = 16'h3f17;
              4'hc: out_r = 16'h3f17;
              4'hd: out_r = 16'h3f17;
              4'he: out_r = 16'h3f17;
              4'hf: out_r = 16'h3f18;
              default: begin end
            endcase
          end
          3'h4: begin
            out_r = 16'h3f18;
            case (mant_lo4)
              4'h7: out_r = 16'h3f19;
              4'h8: out_r = 16'h3f19;
              4'h9: out_r = 16'h3f19;
              4'ha: out_r = 16'h3f19;
              4'hb: out_r = 16'h3f19;
              4'hc: out_r = 16'h3f19;
              4'hd: out_r = 16'h3f19;
              4'he: out_r = 16'h3f19;
              4'hf: out_r = 16'h3f1a;
              default: begin end
            endcase
          end
          3'h5: begin
            out_r = 16'h3f1a;
            case (mant_lo4)
              4'h8: out_r = 16'h3f1b;
              4'h9: out_r = 16'h3f1b;
              4'ha: out_r = 16'h3f1b;
              4'hb: out_r = 16'h3f1b;
              4'hc: out_r = 16'h3f1b;
              4'hd: out_r = 16'h3f1b;
              4'he: out_r = 16'h3f1b;
              4'hf: out_r = 16'h3f1b;
              default: begin end
            endcase
          end
          3'h6: begin
            out_r = 16'h3f1c;
            case (mant_lo4)
              4'h8: out_r = 16'h3f1d;
              4'h9: out_r = 16'h3f1d;
              4'ha: out_r = 16'h3f1d;
              4'hb: out_r = 16'h3f1d;
              4'hc: out_r = 16'h3f1d;
              4'hd: out_r = 16'h3f1d;
              4'he: out_r = 16'h3f1d;
              4'hf: out_r = 16'h3f1d;
              default: begin end
            endcase
          end
          3'h7: begin
            out_r = 16'h3f1d;
            case (mant_lo4)
              4'h1: out_r = 16'h3f1e;
              4'h2: out_r = 16'h3f1e;
              4'h3: out_r = 16'h3f1e;
              4'h4: out_r = 16'h3f1e;
              4'h5: out_r = 16'h3f1e;
              4'h6: out_r = 16'h3f1e;
              4'h7: out_r = 16'h3f1e;
              4'h8: out_r = 16'h3f1e;
              4'h9: out_r = 16'h3f1f;
              4'ha: out_r = 16'h3f1f;
              4'hb: out_r = 16'h3f1f;
              4'hc: out_r = 16'h3f1f;
              4'hd: out_r = 16'h3f1f;
              4'he: out_r = 16'h3f1f;
              4'hf: out_r = 16'h3f1f;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h07e: begin
        case (mant_hi3)
          3'h0: begin
            out_r = 16'h3f1f;
            case (mant_lo4)
              4'h1: out_r = 16'h3f20;
              4'h2: out_r = 16'h3f20;
              4'h3: out_r = 16'h3f20;
              4'h4: out_r = 16'h3f20;
              4'h5: out_r = 16'h3f21;
              4'h6: out_r = 16'h3f21;
              4'h7: out_r = 16'h3f21;
              4'h8: out_r = 16'h3f21;
              4'h9: out_r = 16'h3f21;
              4'ha: out_r = 16'h3f22;
              4'hb: out_r = 16'h3f22;
              4'hc: out_r = 16'h3f22;
              4'hd: out_r = 16'h3f22;
              4'he: out_r = 16'h3f23;
              4'hf: out_r = 16'h3f23;
              default: begin end
            endcase
          end
          3'h1: begin
            out_r = 16'h3f23;
            case (mant_lo4)
              4'h2: out_r = 16'h3f24;
              4'h3: out_r = 16'h3f24;
              4'h4: out_r = 16'h3f24;
              4'h5: out_r = 16'h3f24;
              4'h6: out_r = 16'h3f24;
              4'h7: out_r = 16'h3f25;
              4'h8: out_r = 16'h3f25;
              4'h9: out_r = 16'h3f25;
              4'ha: out_r = 16'h3f25;
              4'hb: out_r = 16'h3f26;
              4'hc: out_r = 16'h3f26;
              4'hd: out_r = 16'h3f26;
              4'he: out_r = 16'h3f26;
              4'hf: out_r = 16'h3f27;
              default: begin end
            endcase
          end
          3'h2: begin
            out_r = 16'h3f27;
            case (mant_lo4)
              4'h4: out_r = 16'h3f28;
              4'h5: out_r = 16'h3f28;
              4'h6: out_r = 16'h3f28;
              4'h7: out_r = 16'h3f28;
              4'h8: out_r = 16'h3f29;
              4'h9: out_r = 16'h3f29;
              4'ha: out_r = 16'h3f29;
              4'hb: out_r = 16'h3f29;
              4'hc: out_r = 16'h3f29;
              4'hd: out_r = 16'h3f2a;
              4'he: out_r = 16'h3f2a;
              4'hf: out_r = 16'h3f2a;
              default: begin end
            endcase
          end
          3'h3: begin
            out_r = 16'h3f2a;
            case (mant_lo4)
              4'h1: out_r = 16'h3f2b;
              4'h2: out_r = 16'h3f2b;
              4'h3: out_r = 16'h3f2b;
              4'h4: out_r = 16'h3f2b;
              4'h5: out_r = 16'h3f2b;
              4'h6: out_r = 16'h3f2c;
              4'h7: out_r = 16'h3f2c;
              4'h8: out_r = 16'h3f2c;
              4'h9: out_r = 16'h3f2c;
              4'ha: out_r = 16'h3f2d;
              4'hb: out_r = 16'h3f2d;
              4'hc: out_r = 16'h3f2d;
              4'hd: out_r = 16'h3f2d;
              4'he: out_r = 16'h3f2d;
              4'hf: out_r = 16'h3f2e;
              default: begin end
            endcase
          end
          3'h4: begin
            out_r = 16'h3f2e;
            case (mant_lo4)
              4'h3: out_r = 16'h3f2f;
              4'h4: out_r = 16'h3f2f;
              4'h5: out_r = 16'h3f2f;
              4'h6: out_r = 16'h3f2f;
              4'h7: out_r = 16'h3f2f;
              4'h8: out_r = 16'h3f30;
              4'h9: out_r = 16'h3f30;
              4'ha: out_r = 16'h3f30;
              4'hb: out_r = 16'h3f30;
              4'hc: out_r = 16'h3f30;
              4'hd: out_r = 16'h3f31;
              4'he: out_r = 16'h3f31;
              4'hf: out_r = 16'h3f31;
              default: begin end
            endcase
          end
          3'h5: begin
            out_r = 16'h3f31;
            case (mant_lo4)
              4'h1: out_r = 16'h3f32;
              4'h2: out_r = 16'h3f32;
              4'h3: out_r = 16'h3f32;
              4'h4: out_r = 16'h3f32;
              4'h5: out_r = 16'h3f32;
              4'h6: out_r = 16'h3f33;
              4'h7: out_r = 16'h3f33;
              4'h8: out_r = 16'h3f33;
              4'h9: out_r = 16'h3f33;
              4'ha: out_r = 16'h3f33;
              4'hb: out_r = 16'h3f34;
              4'hc: out_r = 16'h3f34;
              4'hd: out_r = 16'h3f34;
              4'he: out_r = 16'h3f34;
              4'hf: out_r = 16'h3f34;
              default: begin end
            endcase
          end
          3'h6: begin
            out_r = 16'h3f35;
            case (mant_lo4)
              4'h4: out_r = 16'h3f36;
              4'h5: out_r = 16'h3f36;
              4'h6: out_r = 16'h3f36;
              4'h7: out_r = 16'h3f36;
              4'h8: out_r = 16'h3f36;
              4'h9: out_r = 16'h3f37;
              4'ha: out_r = 16'h3f37;
              4'hb: out_r = 16'h3f37;
              4'hc: out_r = 16'h3f37;
              4'hd: out_r = 16'h3f37;
              4'he: out_r = 16'h3f38;
              4'hf: out_r = 16'h3f38;
              default: begin end
            endcase
          end
          3'h7: begin
            out_r = 16'h3f38;
            case (mant_lo4)
              4'h3: out_r = 16'h3f39;
              4'h4: out_r = 16'h3f39;
              4'h5: out_r = 16'h3f39;
              4'h6: out_r = 16'h3f39;
              4'h7: out_r = 16'h3f39;
              4'h8: out_r = 16'h3f3a;
              4'h9: out_r = 16'h3f3a;
              4'ha: out_r = 16'h3f3a;
              4'hb: out_r = 16'h3f3a;
              4'hc: out_r = 16'h3f3a;
              4'hd: out_r = 16'h3f3b;
              4'he: out_r = 16'h3f3b;
              4'hf: out_r = 16'h3f3b;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h07f: begin
        case (mant_hi3)
          3'h0: begin
            out_r = 16'h3f3b;
            case (mant_lo4)
              4'h1: out_r = 16'h3f3c;
              4'h2: out_r = 16'h3f3c;
              4'h3: out_r = 16'h3f3c;
              4'h4: out_r = 16'h3f3d;
              4'h5: out_r = 16'h3f3d;
              4'h6: out_r = 16'h3f3d;
              4'h7: out_r = 16'h3f3e;
              4'h8: out_r = 16'h3f3e;
              4'h9: out_r = 16'h3f3f;
              4'ha: out_r = 16'h3f3f;
              4'hb: out_r = 16'h3f3f;
              4'hc: out_r = 16'h3f40;
              4'hd: out_r = 16'h3f40;
              4'he: out_r = 16'h3f41;
              4'hf: out_r = 16'h3f41;
              default: begin end
            endcase
          end
          3'h1: begin
            out_r = 16'h3f41;
            case (mant_lo4)
              4'h1: out_r = 16'h3f42;
              4'h2: out_r = 16'h3f42;
              4'h3: out_r = 16'h3f42;
              4'h4: out_r = 16'h3f43;
              4'h5: out_r = 16'h3f43;
              4'h6: out_r = 16'h3f43;
              4'h7: out_r = 16'h3f44;
              4'h8: out_r = 16'h3f44;
              4'h9: out_r = 16'h3f45;
              4'ha: out_r = 16'h3f45;
              4'hb: out_r = 16'h3f45;
              4'hc: out_r = 16'h3f46;
              4'hd: out_r = 16'h3f46;
              4'he: out_r = 16'h3f46;
              4'hf: out_r = 16'h3f47;
              default: begin end
            endcase
          end
          3'h2: begin
            out_r = 16'h3f47;
            case (mant_lo4)
              4'h2: out_r = 16'h3f48;
              4'h3: out_r = 16'h3f48;
              4'h4: out_r = 16'h3f48;
              4'h5: out_r = 16'h3f49;
              4'h6: out_r = 16'h3f49;
              4'h7: out_r = 16'h3f49;
              4'h8: out_r = 16'h3f4a;
              4'h9: out_r = 16'h3f4a;
              4'ha: out_r = 16'h3f4a;
              4'hb: out_r = 16'h3f4b;
              4'hc: out_r = 16'h3f4b;
              4'hd: out_r = 16'h3f4b;
              4'he: out_r = 16'h3f4c;
              4'hf: out_r = 16'h3f4c;
              default: begin end
            endcase
          end
          3'h3: begin
            out_r = 16'h3f4c;
            case (mant_lo4)
              4'h1: out_r = 16'h3f4d;
              4'h2: out_r = 16'h3f4d;
              4'h3: out_r = 16'h3f4d;
              4'h4: out_r = 16'h3f4e;
              4'h5: out_r = 16'h3f4e;
              4'h6: out_r = 16'h3f4e;
              4'h7: out_r = 16'h3f4f;
              4'h8: out_r = 16'h3f4f;
              4'h9: out_r = 16'h3f4f;
              4'ha: out_r = 16'h3f4f;
              4'hb: out_r = 16'h3f50;
              4'hc: out_r = 16'h3f50;
              4'hd: out_r = 16'h3f50;
              4'he: out_r = 16'h3f51;
              4'hf: out_r = 16'h3f51;
              default: begin end
            endcase
          end
          3'h4: begin
            out_r = 16'h3f51;
            case (mant_lo4)
              4'h1: out_r = 16'h3f52;
              4'h2: out_r = 16'h3f52;
              4'h3: out_r = 16'h3f52;
              4'h4: out_r = 16'h3f52;
              4'h5: out_r = 16'h3f53;
              4'h6: out_r = 16'h3f53;
              4'h7: out_r = 16'h3f53;
              4'h8: out_r = 16'h3f54;
              4'h9: out_r = 16'h3f54;
              4'ha: out_r = 16'h3f54;
              4'hb: out_r = 16'h3f54;
              4'hc: out_r = 16'h3f55;
              4'hd: out_r = 16'h3f55;
              4'he: out_r = 16'h3f55;
              4'hf: out_r = 16'h3f56;
              default: begin end
            endcase
          end
          3'h5: begin
            out_r = 16'h3f56;
            case (mant_lo4)
              4'h3: out_r = 16'h3f57;
              4'h4: out_r = 16'h3f57;
              4'h5: out_r = 16'h3f57;
              4'h6: out_r = 16'h3f58;
              4'h7: out_r = 16'h3f58;
              4'h8: out_r = 16'h3f58;
              4'h9: out_r = 16'h3f58;
              4'ha: out_r = 16'h3f59;
              4'hb: out_r = 16'h3f59;
              4'hc: out_r = 16'h3f59;
              4'hd: out_r = 16'h3f59;
              4'he: out_r = 16'h3f5a;
              4'hf: out_r = 16'h3f5a;
              default: begin end
            endcase
          end
          3'h6: begin
            out_r = 16'h3f5a;
            case (mant_lo4)
              4'h2: out_r = 16'h3f5b;
              4'h3: out_r = 16'h3f5b;
              4'h4: out_r = 16'h3f5b;
              4'h5: out_r = 16'h3f5b;
              4'h6: out_r = 16'h3f5c;
              4'h7: out_r = 16'h3f5c;
              4'h8: out_r = 16'h3f5c;
              4'h9: out_r = 16'h3f5c;
              4'ha: out_r = 16'h3f5d;
              4'hb: out_r = 16'h3f5d;
              4'hc: out_r = 16'h3f5d;
              4'hd: out_r = 16'h3f5d;
              4'he: out_r = 16'h3f5d;
              4'hf: out_r = 16'h3f5e;
              default: begin end
            endcase
          end
          3'h7: begin
            out_r = 16'h3f5e;
            case (mant_lo4)
              4'h3: out_r = 16'h3f5f;
              4'h4: out_r = 16'h3f5f;
              4'h5: out_r = 16'h3f5f;
              4'h6: out_r = 16'h3f5f;
              4'h7: out_r = 16'h3f60;
              4'h8: out_r = 16'h3f60;
              4'h9: out_r = 16'h3f60;
              4'ha: out_r = 16'h3f60;
              4'hb: out_r = 16'h3f60;
              4'hc: out_r = 16'h3f61;
              4'hd: out_r = 16'h3f61;
              4'he: out_r = 16'h3f61;
              4'hf: out_r = 16'h3f61;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h080: begin
        case (mant_hi3)
          3'h0: begin
            out_r = 16'h3f61;
            case (mant_lo4)
              4'h1: out_r = 16'h3f62;
              4'h2: out_r = 16'h3f62;
              4'h3: out_r = 16'h3f63;
              4'h4: out_r = 16'h3f63;
              4'h5: out_r = 16'h3f64;
              4'h6: out_r = 16'h3f64;
              4'h7: out_r = 16'h3f64;
              4'h8: out_r = 16'h3f65;
              4'h9: out_r = 16'h3f65;
              4'ha: out_r = 16'h3f65;
              4'hb: out_r = 16'h3f66;
              4'hc: out_r = 16'h3f66;
              4'hd: out_r = 16'h3f67;
              4'he: out_r = 16'h3f67;
              4'hf: out_r = 16'h3f67;
              default: begin end
            endcase
          end
          3'h1: begin
            out_r = 16'h3f68;
            case (mant_lo4)
              4'h3: out_r = 16'h3f69;
              4'h4: out_r = 16'h3f69;
              4'h5: out_r = 16'h3f69;
              4'h6: out_r = 16'h3f6a;
              4'h7: out_r = 16'h3f6a;
              4'h8: out_r = 16'h3f6a;
              4'h9: out_r = 16'h3f6b;
              4'ha: out_r = 16'h3f6b;
              4'hb: out_r = 16'h3f6b;
              4'hc: out_r = 16'h3f6b;
              4'hd: out_r = 16'h3f6c;
              4'he: out_r = 16'h3f6c;
              4'hf: out_r = 16'h3f6c;
              default: begin end
            endcase
          end
          3'h2: begin
            out_r = 16'h3f6d;
            case (mant_lo4)
              4'h4: out_r = 16'h3f6e;
              4'h5: out_r = 16'h3f6e;
              4'h6: out_r = 16'h3f6e;
              4'h7: out_r = 16'h3f6e;
              4'h8: out_r = 16'h3f6f;
              4'h9: out_r = 16'h3f6f;
              4'ha: out_r = 16'h3f6f;
              4'hb: out_r = 16'h3f6f;
              4'hc: out_r = 16'h3f70;
              4'hd: out_r = 16'h3f70;
              4'he: out_r = 16'h3f70;
              4'hf: out_r = 16'h3f70;
              default: begin end
            endcase
          end
          3'h3: begin
            out_r = 16'h3f71;
            case (mant_lo4)
              4'h5: out_r = 16'h3f72;
              4'h6: out_r = 16'h3f72;
              4'h7: out_r = 16'h3f72;
              4'h8: out_r = 16'h3f72;
              4'h9: out_r = 16'h3f73;
              4'ha: out_r = 16'h3f73;
              4'hb: out_r = 16'h3f73;
              4'hc: out_r = 16'h3f73;
              4'hd: out_r = 16'h3f73;
              4'he: out_r = 16'h3f73;
              4'hf: out_r = 16'h3f74;
              default: begin end
            endcase
          end
          3'h4: begin
            out_r = 16'h3f74;
            case (mant_lo4)
              4'h4: out_r = 16'h3f75;
              4'h5: out_r = 16'h3f75;
              4'h6: out_r = 16'h3f75;
              4'h7: out_r = 16'h3f75;
              4'h8: out_r = 16'h3f75;
              4'h9: out_r = 16'h3f75;
              4'ha: out_r = 16'h3f76;
              4'hb: out_r = 16'h3f76;
              4'hc: out_r = 16'h3f76;
              4'hd: out_r = 16'h3f76;
              4'he: out_r = 16'h3f76;
              4'hf: out_r = 16'h3f76;
              default: begin end
            endcase
          end
          3'h5: begin
            out_r = 16'h3f76;
            case (mant_lo4)
              4'h1: out_r = 16'h3f77;
              4'h2: out_r = 16'h3f77;
              4'h3: out_r = 16'h3f77;
              4'h4: out_r = 16'h3f77;
              4'h5: out_r = 16'h3f77;
              4'h6: out_r = 16'h3f77;
              4'h7: out_r = 16'h3f77;
              4'h8: out_r = 16'h3f78;
              4'h9: out_r = 16'h3f78;
              4'ha: out_r = 16'h3f78;
              4'hb: out_r = 16'h3f78;
              4'hc: out_r = 16'h3f78;
              4'hd: out_r = 16'h3f78;
              4'he: out_r = 16'h3f78;
              4'hf: out_r = 16'h3f78;
              default: begin end
            endcase
          end
          3'h6: begin
            out_r = 16'h3f78;
            case (mant_lo4)
              4'h1: out_r = 16'h3f79;
              4'h2: out_r = 16'h3f79;
              4'h3: out_r = 16'h3f79;
              4'h4: out_r = 16'h3f79;
              4'h5: out_r = 16'h3f79;
              4'h6: out_r = 16'h3f79;
              4'h7: out_r = 16'h3f79;
              4'h8: out_r = 16'h3f79;
              4'h9: out_r = 16'h3f79;
              4'ha: out_r = 16'h3f7a;
              4'hb: out_r = 16'h3f7a;
              4'hc: out_r = 16'h3f7a;
              4'hd: out_r = 16'h3f7a;
              4'he: out_r = 16'h3f7a;
              4'hf: out_r = 16'h3f7a;
              default: begin end
            endcase
          end
          3'h7: begin
            out_r = 16'h3f7a;
            case (mant_lo4)
              4'h5: out_r = 16'h3f7b;
              4'h6: out_r = 16'h3f7b;
              4'h7: out_r = 16'h3f7b;
              4'h8: out_r = 16'h3f7b;
              4'h9: out_r = 16'h3f7b;
              4'ha: out_r = 16'h3f7b;
              4'hb: out_r = 16'h3f7b;
              4'hc: out_r = 16'h3f7b;
              4'hd: out_r = 16'h3f7b;
              4'he: out_r = 16'h3f7b;
              4'hf: out_r = 16'h3f7b;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h081: begin
        case (mant_hi3)
          3'h0: begin
            out_r = 16'h3f7b;
            case (mant_lo4)
              4'h1: out_r = 16'h3f7c;
              4'h2: out_r = 16'h3f7c;
              4'h3: out_r = 16'h3f7c;
              4'h4: out_r = 16'h3f7c;
              4'h5: out_r = 16'h3f7c;
              4'h6: out_r = 16'h3f7c;
              4'h7: out_r = 16'h3f7c;
              4'h8: out_r = 16'h3f7c;
              4'h9: out_r = 16'h3f7d;
              4'ha: out_r = 16'h3f7d;
              4'hb: out_r = 16'h3f7d;
              4'hc: out_r = 16'h3f7d;
              4'hd: out_r = 16'h3f7d;
              4'he: out_r = 16'h3f7d;
              4'hf: out_r = 16'h3f7d;
              default: begin end
            endcase
          end
          3'h1: begin
            out_r = 16'h3f7d;
            case (mant_lo4)
              4'h4: out_r = 16'h3f7e;
              4'h5: out_r = 16'h3f7e;
              4'h6: out_r = 16'h3f7e;
              4'h7: out_r = 16'h3f7e;
              4'h8: out_r = 16'h3f7e;
              4'h9: out_r = 16'h3f7e;
              4'ha: out_r = 16'h3f7e;
              4'hb: out_r = 16'h3f7e;
              4'hc: out_r = 16'h3f7e;
              4'hd: out_r = 16'h3f7e;
              4'he: out_r = 16'h3f7e;
              4'hf: out_r = 16'h3f7e;
              default: begin end
            endcase
          end
          3'h2: begin
            out_r = 16'h3f7e;
            case (mant_lo4)
              4'h5: out_r = 16'h3f7f;
              4'h6: out_r = 16'h3f7f;
              4'h7: out_r = 16'h3f7f;
              4'h8: out_r = 16'h3f7f;
              4'h9: out_r = 16'h3f7f;
              4'ha: out_r = 16'h3f7f;
              4'hb: out_r = 16'h3f7f;
              4'hc: out_r = 16'h3f7f;
              4'hd: out_r = 16'h3f7f;
              4'he: out_r = 16'h3f7f;
              4'hf: out_r = 16'h3f7f;
              default: begin end
            endcase
          end
          3'h3: begin
            out_r = 16'h3f7f;
          end
          3'h4: begin
            out_r = 16'h3f7f;
            case (mant_lo4)
              4'h8: out_r = 16'h3f80;
              4'h9: out_r = 16'h3f80;
              4'ha: out_r = 16'h3f80;
              4'hb: out_r = 16'h3f80;
              4'hc: out_r = 16'h3f80;
              4'hd: out_r = 16'h3f80;
              4'he: out_r = 16'h3f80;
              4'hf: out_r = 16'h3f80;
              default: begin end
            endcase
          end
          3'h5: begin
            out_r = 16'h3f80;
          end
          3'h6: begin
            out_r = 16'h3f80;
          end
          3'h7: begin
            out_r = 16'h3f80;
          end
          default: begin end
        endcase
      end
      9'h0ff: begin
        case (mant_hi3)
          3'h0: begin
            out_r = 16'h3f80;
            case (mant_lo4)
              4'h1: out_r = 16'h7fc0;
              4'h2: out_r = 16'h7fc0;
              4'h3: out_r = 16'h7fc0;
              4'h4: out_r = 16'h7fc0;
              4'h5: out_r = 16'h7fc0;
              4'h6: out_r = 16'h7fc0;
              4'h7: out_r = 16'h7fc0;
              4'h8: out_r = 16'h7fc0;
              4'h9: out_r = 16'h7fc0;
              4'ha: out_r = 16'h7fc0;
              4'hb: out_r = 16'h7fc0;
              4'hc: out_r = 16'h7fc0;
              4'hd: out_r = 16'h7fc0;
              4'he: out_r = 16'h7fc0;
              4'hf: out_r = 16'h7fc0;
              default: begin end
            endcase
          end
          3'h1: begin
            out_r = 16'h7fc0;
          end
          3'h2: begin
            out_r = 16'h7fc0;
          end
          3'h3: begin
            out_r = 16'h7fc0;
          end
          3'h4: begin
            out_r = 16'h7fc0;
          end
          3'h5: begin
            out_r = 16'h7fc0;
          end
          3'h6: begin
            out_r = 16'h7fc0;
          end
          3'h7: begin
            out_r = 16'h7fc0;
          end
          default: begin end
        endcase
      end
      9'h177: begin
        case (mant_hi3)
          3'h0: begin
            out_r = 16'h3f00;
            case (mant_lo4)
              4'h1: out_r = 16'h3eff;
              4'h2: out_r = 16'h3eff;
              4'h3: out_r = 16'h3eff;
              4'h4: out_r = 16'h3eff;
              4'h5: out_r = 16'h3eff;
              4'h6: out_r = 16'h3eff;
              4'h7: out_r = 16'h3eff;
              4'h8: out_r = 16'h3eff;
              4'h9: out_r = 16'h3eff;
              4'ha: out_r = 16'h3eff;
              4'hb: out_r = 16'h3eff;
              4'hc: out_r = 16'h3eff;
              4'hd: out_r = 16'h3eff;
              4'he: out_r = 16'h3eff;
              4'hf: out_r = 16'h3eff;
              default: begin end
            endcase
          end
          3'h1: begin
            out_r = 16'h3eff;
          end
          3'h2: begin
            out_r = 16'h3eff;
          end
          3'h3: begin
            out_r = 16'h3eff;
          end
          3'h4: begin
            out_r = 16'h3eff;
          end
          3'h5: begin
            out_r = 16'h3eff;
          end
          3'h6: begin
            out_r = 16'h3eff;
          end
          3'h7: begin
            out_r = 16'h3eff;
          end
          default: begin end
        endcase
      end
      9'h178: begin
        case (mant_hi3)
          3'h0: begin
            out_r = 16'h3eff;
          end
          3'h1: begin
            out_r = 16'h3eff;
          end
          3'h2: begin
            out_r = 16'h3eff;
          end
          3'h3: begin
            out_r = 16'h3eff;
          end
          3'h4: begin
            out_r = 16'h3eff;
            case (mant_lo4)
              4'h1: out_r = 16'h3efe;
              4'h2: out_r = 16'h3efe;
              4'h3: out_r = 16'h3efe;
              4'h4: out_r = 16'h3efe;
              4'h5: out_r = 16'h3efe;
              4'h6: out_r = 16'h3efe;
              4'h7: out_r = 16'h3efe;
              4'h8: out_r = 16'h3efe;
              4'h9: out_r = 16'h3efe;
              4'ha: out_r = 16'h3efe;
              4'hb: out_r = 16'h3efe;
              4'hc: out_r = 16'h3efe;
              4'hd: out_r = 16'h3efe;
              4'he: out_r = 16'h3efe;
              4'hf: out_r = 16'h3efe;
              default: begin end
            endcase
          end
          3'h5: begin
            out_r = 16'h3efe;
          end
          3'h6: begin
            out_r = 16'h3efe;
          end
          3'h7: begin
            out_r = 16'h3efe;
          end
          default: begin end
        endcase
      end
      9'h179: begin
        case (mant_hi3)
          3'h0: begin
            out_r = 16'h3efe;
          end
          3'h1: begin
            out_r = 16'h3efe;
          end
          3'h2: begin
            out_r = 16'h3efe;
            case (mant_lo4)
              4'h1: out_r = 16'h3efd;
              4'h2: out_r = 16'h3efd;
              4'h3: out_r = 16'h3efd;
              4'h4: out_r = 16'h3efd;
              4'h5: out_r = 16'h3efd;
              4'h6: out_r = 16'h3efd;
              4'h7: out_r = 16'h3efd;
              4'h8: out_r = 16'h3efd;
              4'h9: out_r = 16'h3efd;
              4'ha: out_r = 16'h3efd;
              4'hb: out_r = 16'h3efd;
              4'hc: out_r = 16'h3efd;
              4'hd: out_r = 16'h3efd;
              4'he: out_r = 16'h3efd;
              4'hf: out_r = 16'h3efd;
              default: begin end
            endcase
          end
          3'h3: begin
            out_r = 16'h3efd;
          end
          3'h4: begin
            out_r = 16'h3efd;
          end
          3'h5: begin
            out_r = 16'h3efd;
          end
          3'h6: begin
            out_r = 16'h3efd;
            case (mant_lo4)
              4'h1: out_r = 16'h3efc;
              4'h2: out_r = 16'h3efc;
              4'h3: out_r = 16'h3efc;
              4'h4: out_r = 16'h3efc;
              4'h5: out_r = 16'h3efc;
              4'h6: out_r = 16'h3efc;
              4'h7: out_r = 16'h3efc;
              4'h8: out_r = 16'h3efc;
              4'h9: out_r = 16'h3efc;
              4'ha: out_r = 16'h3efc;
              4'hb: out_r = 16'h3efc;
              4'hc: out_r = 16'h3efc;
              4'hd: out_r = 16'h3efc;
              4'he: out_r = 16'h3efc;
              4'hf: out_r = 16'h3efc;
              default: begin end
            endcase
          end
          3'h7: begin
            out_r = 16'h3efc;
          end
          default: begin end
        endcase
      end
      9'h17a: begin
        case (mant_hi3)
          3'h0: begin
            out_r = 16'h3efc;
          end
          3'h1: begin
            out_r = 16'h3efc;
            case (mant_lo4)
              4'h1: out_r = 16'h3efb;
              4'h2: out_r = 16'h3efb;
              4'h3: out_r = 16'h3efb;
              4'h4: out_r = 16'h3efb;
              4'h5: out_r = 16'h3efb;
              4'h6: out_r = 16'h3efb;
              4'h7: out_r = 16'h3efb;
              4'h8: out_r = 16'h3efb;
              4'h9: out_r = 16'h3efb;
              4'ha: out_r = 16'h3efb;
              4'hb: out_r = 16'h3efb;
              4'hc: out_r = 16'h3efb;
              4'hd: out_r = 16'h3efb;
              4'he: out_r = 16'h3efb;
              4'hf: out_r = 16'h3efb;
              default: begin end
            endcase
          end
          3'h2: begin
            out_r = 16'h3efb;
          end
          3'h3: begin
            out_r = 16'h3efb;
            case (mant_lo4)
              4'h1: out_r = 16'h3efa;
              4'h2: out_r = 16'h3efa;
              4'h3: out_r = 16'h3efa;
              4'h4: out_r = 16'h3efa;
              4'h5: out_r = 16'h3efa;
              4'h6: out_r = 16'h3efa;
              4'h7: out_r = 16'h3efa;
              4'h8: out_r = 16'h3efa;
              4'h9: out_r = 16'h3efa;
              4'ha: out_r = 16'h3efa;
              4'hb: out_r = 16'h3efa;
              4'hc: out_r = 16'h3efa;
              4'hd: out_r = 16'h3efa;
              4'he: out_r = 16'h3efa;
              4'hf: out_r = 16'h3efa;
              default: begin end
            endcase
          end
          3'h4: begin
            out_r = 16'h3efa;
          end
          3'h5: begin
            out_r = 16'h3efa;
            case (mant_lo4)
              4'h1: out_r = 16'h3ef9;
              4'h2: out_r = 16'h3ef9;
              4'h3: out_r = 16'h3ef9;
              4'h4: out_r = 16'h3ef9;
              4'h5: out_r = 16'h3ef9;
              4'h6: out_r = 16'h3ef9;
              4'h7: out_r = 16'h3ef9;
              4'h8: out_r = 16'h3ef9;
              4'h9: out_r = 16'h3ef9;
              4'ha: out_r = 16'h3ef9;
              4'hb: out_r = 16'h3ef9;
              4'hc: out_r = 16'h3ef9;
              4'hd: out_r = 16'h3ef9;
              4'he: out_r = 16'h3ef9;
              4'hf: out_r = 16'h3ef9;
              default: begin end
            endcase
          end
          3'h6: begin
            out_r = 16'h3ef9;
          end
          3'h7: begin
            out_r = 16'h3ef9;
            case (mant_lo4)
              4'h1: out_r = 16'h3ef8;
              4'h2: out_r = 16'h3ef8;
              4'h3: out_r = 16'h3ef8;
              4'h4: out_r = 16'h3ef8;
              4'h5: out_r = 16'h3ef8;
              4'h6: out_r = 16'h3ef8;
              4'h7: out_r = 16'h3ef8;
              4'h8: out_r = 16'h3ef8;
              4'h9: out_r = 16'h3ef8;
              4'ha: out_r = 16'h3ef8;
              4'hb: out_r = 16'h3ef8;
              4'hc: out_r = 16'h3ef8;
              4'hd: out_r = 16'h3ef8;
              4'he: out_r = 16'h3ef8;
              4'hf: out_r = 16'h3ef8;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h17b: begin
        case (mant_hi3)
          3'h0: begin
            out_r = 16'h3ef8;
            case (mant_lo4)
              4'h9: out_r = 16'h3ef7;
              4'ha: out_r = 16'h3ef7;
              4'hb: out_r = 16'h3ef7;
              4'hc: out_r = 16'h3ef7;
              4'hd: out_r = 16'h3ef7;
              4'he: out_r = 16'h3ef7;
              4'hf: out_r = 16'h3ef7;
              default: begin end
            endcase
          end
          3'h1: begin
            out_r = 16'h3ef7;
            case (mant_lo4)
              4'h9: out_r = 16'h3ef6;
              4'ha: out_r = 16'h3ef6;
              4'hb: out_r = 16'h3ef6;
              4'hc: out_r = 16'h3ef6;
              4'hd: out_r = 16'h3ef6;
              4'he: out_r = 16'h3ef6;
              4'hf: out_r = 16'h3ef6;
              default: begin end
            endcase
          end
          3'h2: begin
            out_r = 16'h3ef6;
            case (mant_lo4)
              4'h9: out_r = 16'h3ef5;
              4'ha: out_r = 16'h3ef5;
              4'hb: out_r = 16'h3ef5;
              4'hc: out_r = 16'h3ef5;
              4'hd: out_r = 16'h3ef5;
              4'he: out_r = 16'h3ef5;
              4'hf: out_r = 16'h3ef5;
              default: begin end
            endcase
          end
          3'h3: begin
            out_r = 16'h3ef5;
            case (mant_lo4)
              4'h9: out_r = 16'h3ef4;
              4'ha: out_r = 16'h3ef4;
              4'hb: out_r = 16'h3ef4;
              4'hc: out_r = 16'h3ef4;
              4'hd: out_r = 16'h3ef4;
              4'he: out_r = 16'h3ef4;
              4'hf: out_r = 16'h3ef4;
              default: begin end
            endcase
          end
          3'h4: begin
            out_r = 16'h3ef4;
            case (mant_lo4)
              4'h9: out_r = 16'h3ef3;
              4'ha: out_r = 16'h3ef3;
              4'hb: out_r = 16'h3ef3;
              4'hc: out_r = 16'h3ef3;
              4'hd: out_r = 16'h3ef3;
              4'he: out_r = 16'h3ef3;
              4'hf: out_r = 16'h3ef3;
              default: begin end
            endcase
          end
          3'h5: begin
            out_r = 16'h3ef3;
            case (mant_lo4)
              4'h9: out_r = 16'h3ef2;
              4'ha: out_r = 16'h3ef2;
              4'hb: out_r = 16'h3ef2;
              4'hc: out_r = 16'h3ef2;
              4'hd: out_r = 16'h3ef2;
              4'he: out_r = 16'h3ef2;
              4'hf: out_r = 16'h3ef2;
              default: begin end
            endcase
          end
          3'h6: begin
            out_r = 16'h3ef2;
            case (mant_lo4)
              4'h9: out_r = 16'h3ef1;
              4'ha: out_r = 16'h3ef1;
              4'hb: out_r = 16'h3ef1;
              4'hc: out_r = 16'h3ef1;
              4'hd: out_r = 16'h3ef1;
              4'he: out_r = 16'h3ef1;
              4'hf: out_r = 16'h3ef1;
              default: begin end
            endcase
          end
          3'h7: begin
            out_r = 16'h3ef1;
            case (mant_lo4)
              4'h9: out_r = 16'h3ef0;
              4'ha: out_r = 16'h3ef0;
              4'hb: out_r = 16'h3ef0;
              4'hc: out_r = 16'h3ef0;
              4'hd: out_r = 16'h3ef0;
              4'he: out_r = 16'h3ef0;
              4'hf: out_r = 16'h3ef0;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h17c: begin
        case (mant_hi3)
          3'h0: begin
            out_r = 16'h3ef0;
            case (mant_lo4)
              4'h5: out_r = 16'h3eef;
              4'h6: out_r = 16'h3eef;
              4'h7: out_r = 16'h3eef;
              4'h8: out_r = 16'h3eef;
              4'h9: out_r = 16'h3eef;
              4'ha: out_r = 16'h3eef;
              4'hb: out_r = 16'h3eef;
              4'hc: out_r = 16'h3eef;
              4'hd: out_r = 16'h3eee;
              4'he: out_r = 16'h3eee;
              4'hf: out_r = 16'h3eee;
              default: begin end
            endcase
          end
          3'h1: begin
            out_r = 16'h3eee;
            case (mant_lo4)
              4'h5: out_r = 16'h3eed;
              4'h6: out_r = 16'h3eed;
              4'h7: out_r = 16'h3eed;
              4'h8: out_r = 16'h3eed;
              4'h9: out_r = 16'h3eed;
              4'ha: out_r = 16'h3eed;
              4'hb: out_r = 16'h3eed;
              4'hc: out_r = 16'h3eed;
              4'hd: out_r = 16'h3eec;
              4'he: out_r = 16'h3eec;
              4'hf: out_r = 16'h3eec;
              default: begin end
            endcase
          end
          3'h2: begin
            out_r = 16'h3eec;
            case (mant_lo4)
              4'h5: out_r = 16'h3eeb;
              4'h6: out_r = 16'h3eeb;
              4'h7: out_r = 16'h3eeb;
              4'h8: out_r = 16'h3eeb;
              4'h9: out_r = 16'h3eeb;
              4'ha: out_r = 16'h3eeb;
              4'hb: out_r = 16'h3eeb;
              4'hc: out_r = 16'h3eeb;
              4'hd: out_r = 16'h3eea;
              4'he: out_r = 16'h3eea;
              4'hf: out_r = 16'h3eea;
              default: begin end
            endcase
          end
          3'h3: begin
            out_r = 16'h3eea;
            case (mant_lo4)
              4'h5: out_r = 16'h3ee9;
              4'h6: out_r = 16'h3ee9;
              4'h7: out_r = 16'h3ee9;
              4'h8: out_r = 16'h3ee9;
              4'h9: out_r = 16'h3ee9;
              4'ha: out_r = 16'h3ee9;
              4'hb: out_r = 16'h3ee9;
              4'hc: out_r = 16'h3ee9;
              4'hd: out_r = 16'h3ee8;
              4'he: out_r = 16'h3ee8;
              4'hf: out_r = 16'h3ee8;
              default: begin end
            endcase
          end
          3'h4: begin
            out_r = 16'h3ee8;
            case (mant_lo4)
              4'h5: out_r = 16'h3ee7;
              4'h6: out_r = 16'h3ee7;
              4'h7: out_r = 16'h3ee7;
              4'h8: out_r = 16'h3ee7;
              4'h9: out_r = 16'h3ee7;
              4'ha: out_r = 16'h3ee7;
              4'hb: out_r = 16'h3ee7;
              4'hc: out_r = 16'h3ee7;
              4'hd: out_r = 16'h3ee6;
              4'he: out_r = 16'h3ee6;
              4'hf: out_r = 16'h3ee6;
              default: begin end
            endcase
          end
          3'h5: begin
            out_r = 16'h3ee6;
            case (mant_lo4)
              4'h5: out_r = 16'h3ee5;
              4'h6: out_r = 16'h3ee5;
              4'h7: out_r = 16'h3ee5;
              4'h8: out_r = 16'h3ee5;
              4'h9: out_r = 16'h3ee5;
              4'ha: out_r = 16'h3ee5;
              4'hb: out_r = 16'h3ee5;
              4'hc: out_r = 16'h3ee5;
              4'hd: out_r = 16'h3ee4;
              4'he: out_r = 16'h3ee4;
              4'hf: out_r = 16'h3ee4;
              default: begin end
            endcase
          end
          3'h6: begin
            out_r = 16'h3ee4;
            case (mant_lo4)
              4'h5: out_r = 16'h3ee3;
              4'h6: out_r = 16'h3ee3;
              4'h7: out_r = 16'h3ee3;
              4'h8: out_r = 16'h3ee3;
              4'h9: out_r = 16'h3ee3;
              4'ha: out_r = 16'h3ee3;
              4'hb: out_r = 16'h3ee3;
              4'hc: out_r = 16'h3ee3;
              4'hd: out_r = 16'h3ee3;
              4'he: out_r = 16'h3ee2;
              4'hf: out_r = 16'h3ee2;
              default: begin end
            endcase
          end
          3'h7: begin
            out_r = 16'h3ee2;
            case (mant_lo4)
              4'h6: out_r = 16'h3ee1;
              4'h7: out_r = 16'h3ee1;
              4'h8: out_r = 16'h3ee1;
              4'h9: out_r = 16'h3ee1;
              4'ha: out_r = 16'h3ee1;
              4'hb: out_r = 16'h3ee1;
              4'hc: out_r = 16'h3ee1;
              4'hd: out_r = 16'h3ee1;
              4'he: out_r = 16'h3ee0;
              4'hf: out_r = 16'h3ee0;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h17d: begin
        case (mant_hi3)
          3'h0: begin
            out_r = 16'h3ee0;
            case (mant_lo4)
              4'h3: out_r = 16'h3edf;
              4'h4: out_r = 16'h3edf;
              4'h5: out_r = 16'h3edf;
              4'h6: out_r = 16'h3edf;
              4'h7: out_r = 16'h3ede;
              4'h8: out_r = 16'h3ede;
              4'h9: out_r = 16'h3ede;
              4'ha: out_r = 16'h3ede;
              4'hb: out_r = 16'h3edd;
              4'hc: out_r = 16'h3edd;
              4'hd: out_r = 16'h3edd;
              4'he: out_r = 16'h3edd;
              4'hf: out_r = 16'h3edc;
              default: begin end
            endcase
          end
          3'h1: begin
            out_r = 16'h3edc;
            case (mant_lo4)
              4'h4: out_r = 16'h3edb;
              4'h5: out_r = 16'h3edb;
              4'h6: out_r = 16'h3edb;
              4'h7: out_r = 16'h3edb;
              4'h8: out_r = 16'h3eda;
              4'h9: out_r = 16'h3eda;
              4'ha: out_r = 16'h3eda;
              4'hb: out_r = 16'h3eda;
              4'hc: out_r = 16'h3ed9;
              4'hd: out_r = 16'h3ed9;
              4'he: out_r = 16'h3ed9;
              4'hf: out_r = 16'h3ed9;
              default: begin end
            endcase
          end
          3'h2: begin
            out_r = 16'h3ed8;
            case (mant_lo4)
              4'h4: out_r = 16'h3ed7;
              4'h5: out_r = 16'h3ed7;
              4'h6: out_r = 16'h3ed7;
              4'h7: out_r = 16'h3ed7;
              4'h8: out_r = 16'h3ed6;
              4'h9: out_r = 16'h3ed6;
              4'ha: out_r = 16'h3ed6;
              4'hb: out_r = 16'h3ed6;
              4'hc: out_r = 16'h3ed5;
              4'hd: out_r = 16'h3ed5;
              4'he: out_r = 16'h3ed5;
              4'hf: out_r = 16'h3ed5;
              default: begin end
            endcase
          end
          3'h3: begin
            out_r = 16'h3ed4;
            case (mant_lo4)
              4'h4: out_r = 16'h3ed3;
              4'h5: out_r = 16'h3ed3;
              4'h6: out_r = 16'h3ed3;
              4'h7: out_r = 16'h3ed3;
              4'h8: out_r = 16'h3ed2;
              4'h9: out_r = 16'h3ed2;
              4'ha: out_r = 16'h3ed2;
              4'hb: out_r = 16'h3ed2;
              4'hc: out_r = 16'h3ed2;
              4'hd: out_r = 16'h3ed1;
              4'he: out_r = 16'h3ed1;
              4'hf: out_r = 16'h3ed1;
              default: begin end
            endcase
          end
          3'h4: begin
            out_r = 16'h3ed1;
            case (mant_lo4)
              4'h1: out_r = 16'h3ed0;
              4'h2: out_r = 16'h3ed0;
              4'h3: out_r = 16'h3ed0;
              4'h4: out_r = 16'h3ed0;
              4'h5: out_r = 16'h3ecf;
              4'h6: out_r = 16'h3ecf;
              4'h7: out_r = 16'h3ecf;
              4'h8: out_r = 16'h3ecf;
              4'h9: out_r = 16'h3ece;
              4'ha: out_r = 16'h3ece;
              4'hb: out_r = 16'h3ece;
              4'hc: out_r = 16'h3ece;
              4'hd: out_r = 16'h3ecd;
              4'he: out_r = 16'h3ecd;
              4'hf: out_r = 16'h3ecd;
              default: begin end
            endcase
          end
          3'h5: begin
            out_r = 16'h3ecd;
            case (mant_lo4)
              4'h1: out_r = 16'h3ecc;
              4'h2: out_r = 16'h3ecc;
              4'h3: out_r = 16'h3ecc;
              4'h4: out_r = 16'h3ecc;
              4'h5: out_r = 16'h3ecc;
              4'h6: out_r = 16'h3ecb;
              4'h7: out_r = 16'h3ecb;
              4'h8: out_r = 16'h3ecb;
              4'h9: out_r = 16'h3ecb;
              4'ha: out_r = 16'h3eca;
              4'hb: out_r = 16'h3eca;
              4'hc: out_r = 16'h3eca;
              4'hd: out_r = 16'h3eca;
              4'he: out_r = 16'h3ec9;
              4'hf: out_r = 16'h3ec9;
              default: begin end
            endcase
          end
          3'h6: begin
            out_r = 16'h3ec9;
            case (mant_lo4)
              4'h2: out_r = 16'h3ec8;
              4'h3: out_r = 16'h3ec8;
              4'h4: out_r = 16'h3ec8;
              4'h5: out_r = 16'h3ec8;
              4'h6: out_r = 16'h3ec7;
              4'h7: out_r = 16'h3ec7;
              4'h8: out_r = 16'h3ec7;
              4'h9: out_r = 16'h3ec7;
              4'ha: out_r = 16'h3ec6;
              4'hb: out_r = 16'h3ec6;
              4'hc: out_r = 16'h3ec6;
              4'hd: out_r = 16'h3ec6;
              4'he: out_r = 16'h3ec6;
              4'hf: out_r = 16'h3ec5;
              default: begin end
            endcase
          end
          3'h7: begin
            out_r = 16'h3ec5;
            case (mant_lo4)
              4'h3: out_r = 16'h3ec4;
              4'h4: out_r = 16'h3ec4;
              4'h5: out_r = 16'h3ec4;
              4'h6: out_r = 16'h3ec4;
              4'h7: out_r = 16'h3ec3;
              4'h8: out_r = 16'h3ec3;
              4'h9: out_r = 16'h3ec3;
              4'ha: out_r = 16'h3ec3;
              4'hb: out_r = 16'h3ec2;
              4'hc: out_r = 16'h3ec2;
              4'hd: out_r = 16'h3ec2;
              4'he: out_r = 16'h3ec2;
              4'hf: out_r = 16'h3ec2;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h17e: begin
        case (mant_hi3)
          3'h0: begin
            out_r = 16'h3ec1;
            case (mant_lo4)
              4'h2: out_r = 16'h3ec0;
              4'h3: out_r = 16'h3ec0;
              4'h4: out_r = 16'h3ebf;
              4'h5: out_r = 16'h3ebf;
              4'h6: out_r = 16'h3ebe;
              4'h7: out_r = 16'h3ebe;
              4'h8: out_r = 16'h3ebe;
              4'h9: out_r = 16'h3ebd;
              4'ha: out_r = 16'h3ebd;
              4'hb: out_r = 16'h3ebc;
              4'hc: out_r = 16'h3ebc;
              4'hd: out_r = 16'h3ebb;
              4'he: out_r = 16'h3ebb;
              4'hf: out_r = 16'h3eba;
              default: begin end
            endcase
          end
          3'h1: begin
            out_r = 16'h3eba;
            case (mant_lo4)
              4'h1: out_r = 16'h3eb9;
              4'h2: out_r = 16'h3eb9;
              4'h3: out_r = 16'h3eb8;
              4'h4: out_r = 16'h3eb8;
              4'h5: out_r = 16'h3eb8;
              4'h6: out_r = 16'h3eb7;
              4'h7: out_r = 16'h3eb7;
              4'h8: out_r = 16'h3eb6;
              4'h9: out_r = 16'h3eb6;
              4'ha: out_r = 16'h3eb5;
              4'hb: out_r = 16'h3eb5;
              4'hc: out_r = 16'h3eb4;
              4'hd: out_r = 16'h3eb4;
              4'he: out_r = 16'h3eb3;
              4'hf: out_r = 16'h3eb3;
              default: begin end
            endcase
          end
          3'h2: begin
            out_r = 16'h3eb3;
            case (mant_lo4)
              4'h1: out_r = 16'h3eb2;
              4'h2: out_r = 16'h3eb2;
              4'h3: out_r = 16'h3eb1;
              4'h4: out_r = 16'h3eb1;
              4'h5: out_r = 16'h3eb0;
              4'h6: out_r = 16'h3eb0;
              4'h7: out_r = 16'h3eaf;
              4'h8: out_r = 16'h3eaf;
              4'h9: out_r = 16'h3eae;
              4'ha: out_r = 16'h3eae;
              4'hb: out_r = 16'h3eae;
              4'hc: out_r = 16'h3ead;
              4'hd: out_r = 16'h3ead;
              4'he: out_r = 16'h3eac;
              4'hf: out_r = 16'h3eac;
              default: begin end
            endcase
          end
          3'h3: begin
            out_r = 16'h3eab;
            case (mant_lo4)
              4'h2: out_r = 16'h3eaa;
              4'h3: out_r = 16'h3eaa;
              4'h4: out_r = 16'h3eaa;
              4'h5: out_r = 16'h3ea9;
              4'h6: out_r = 16'h3ea9;
              4'h7: out_r = 16'h3ea8;
              4'h8: out_r = 16'h3ea8;
              4'h9: out_r = 16'h3ea7;
              4'ha: out_r = 16'h3ea7;
              4'hb: out_r = 16'h3ea6;
              4'hc: out_r = 16'h3ea6;
              4'hd: out_r = 16'h3ea6;
              4'he: out_r = 16'h3ea5;
              4'hf: out_r = 16'h3ea5;
              default: begin end
            endcase
          end
          3'h4: begin
            out_r = 16'h3ea4;
            case (mant_lo4)
              4'h2: out_r = 16'h3ea3;
              4'h3: out_r = 16'h3ea3;
              4'h4: out_r = 16'h3ea3;
              4'h5: out_r = 16'h3ea2;
              4'h6: out_r = 16'h3ea2;
              4'h7: out_r = 16'h3ea1;
              4'h8: out_r = 16'h3ea1;
              4'h9: out_r = 16'h3ea0;
              4'ha: out_r = 16'h3ea0;
              4'hb: out_r = 16'h3ea0;
              4'hc: out_r = 16'h3e9f;
              4'hd: out_r = 16'h3e9f;
              4'he: out_r = 16'h3e9e;
              4'hf: out_r = 16'h3e9e;
              default: begin end
            endcase
          end
          3'h5: begin
            out_r = 16'h3e9d;
            case (mant_lo4)
              4'h3: out_r = 16'h3e9c;
              4'h4: out_r = 16'h3e9c;
              4'h5: out_r = 16'h3e9b;
              4'h6: out_r = 16'h3e9b;
              4'h7: out_r = 16'h3e9a;
              4'h8: out_r = 16'h3e9a;
              4'h9: out_r = 16'h3e9a;
              4'ha: out_r = 16'h3e99;
              4'hb: out_r = 16'h3e99;
              4'hc: out_r = 16'h3e98;
              4'hd: out_r = 16'h3e98;
              4'he: out_r = 16'h3e97;
              4'hf: out_r = 16'h3e97;
              default: begin end
            endcase
          end
          3'h6: begin
            out_r = 16'h3e97;
            case (mant_lo4)
              4'h1: out_r = 16'h3e96;
              4'h2: out_r = 16'h3e96;
              4'h3: out_r = 16'h3e95;
              4'h4: out_r = 16'h3e95;
              4'h5: out_r = 16'h3e95;
              4'h6: out_r = 16'h3e94;
              4'h7: out_r = 16'h3e94;
              4'h8: out_r = 16'h3e93;
              4'h9: out_r = 16'h3e93;
              4'ha: out_r = 16'h3e93;
              4'hb: out_r = 16'h3e92;
              4'hc: out_r = 16'h3e92;
              4'hd: out_r = 16'h3e91;
              4'he: out_r = 16'h3e91;
              4'hf: out_r = 16'h3e90;
              default: begin end
            endcase
          end
          3'h7: begin
            out_r = 16'h3e90;
            case (mant_lo4)
              4'h2: out_r = 16'h3e8f;
              4'h3: out_r = 16'h3e8f;
              4'h4: out_r = 16'h3e8e;
              4'h5: out_r = 16'h3e8e;
              4'h6: out_r = 16'h3e8e;
              4'h7: out_r = 16'h3e8d;
              4'h8: out_r = 16'h3e8d;
              4'h9: out_r = 16'h3e8c;
              4'ha: out_r = 16'h3e8c;
              4'hb: out_r = 16'h3e8c;
              4'hc: out_r = 16'h3e8b;
              4'hd: out_r = 16'h3e8b;
              4'he: out_r = 16'h3e8a;
              4'hf: out_r = 16'h3e8a;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h17f: begin
        case (mant_hi3)
          3'h0: begin
            out_r = 16'h3e8a;
            case (mant_lo4)
              4'h1: out_r = 16'h3e89;
              4'h2: out_r = 16'h3e88;
              4'h3: out_r = 16'h3e87;
              4'h4: out_r = 16'h3e87;
              4'h5: out_r = 16'h3e86;
              4'h6: out_r = 16'h3e85;
              4'h7: out_r = 16'h3e84;
              4'h8: out_r = 16'h3e83;
              4'h9: out_r = 16'h3e83;
              4'ha: out_r = 16'h3e82;
              4'hb: out_r = 16'h3e81;
              4'hc: out_r = 16'h3e80;
              4'hd: out_r = 16'h3e7f;
              4'he: out_r = 16'h3e7e;
              4'hf: out_r = 16'h3e7c;
              default: begin end
            endcase
          end
          3'h1: begin
            out_r = 16'h3e7b;
            case (mant_lo4)
              4'h1: out_r = 16'h3e79;
              4'h2: out_r = 16'h3e78;
              4'h3: out_r = 16'h3e77;
              4'h4: out_r = 16'h3e75;
              4'h5: out_r = 16'h3e74;
              4'h6: out_r = 16'h3e72;
              4'h7: out_r = 16'h3e71;
              4'h8: out_r = 16'h3e6f;
              4'h9: out_r = 16'h3e6e;
              4'ha: out_r = 16'h3e6c;
              4'hb: out_r = 16'h3e6b;
              4'hc: out_r = 16'h3e6a;
              4'hd: out_r = 16'h3e68;
              4'he: out_r = 16'h3e67;
              4'hf: out_r = 16'h3e65;
              default: begin end
            endcase
          end
          3'h2: begin
            out_r = 16'h3e64;
            case (mant_lo4)
              4'h1: out_r = 16'h3e63;
              4'h2: out_r = 16'h3e61;
              4'h3: out_r = 16'h3e60;
              4'h4: out_r = 16'h3e5f;
              4'h5: out_r = 16'h3e5d;
              4'h6: out_r = 16'h3e5c;
              4'h7: out_r = 16'h3e5a;
              4'h8: out_r = 16'h3e59;
              4'h9: out_r = 16'h3e58;
              4'ha: out_r = 16'h3e56;
              4'hb: out_r = 16'h3e55;
              4'hc: out_r = 16'h3e54;
              4'hd: out_r = 16'h3e53;
              4'he: out_r = 16'h3e51;
              4'hf: out_r = 16'h3e50;
              default: begin end
            endcase
          end
          3'h3: begin
            out_r = 16'h3e4f;
            case (mant_lo4)
              4'h1: out_r = 16'h3e4d;
              4'h2: out_r = 16'h3e4c;
              4'h3: out_r = 16'h3e4b;
              4'h4: out_r = 16'h3e4a;
              4'h5: out_r = 16'h3e48;
              4'h6: out_r = 16'h3e47;
              4'h7: out_r = 16'h3e46;
              4'h8: out_r = 16'h3e45;
              4'h9: out_r = 16'h3e43;
              4'ha: out_r = 16'h3e42;
              4'hb: out_r = 16'h3e41;
              4'hc: out_r = 16'h3e40;
              4'hd: out_r = 16'h3e3e;
              4'he: out_r = 16'h3e3d;
              4'hf: out_r = 16'h3e3c;
              default: begin end
            endcase
          end
          3'h4: begin
            out_r = 16'h3e3b;
            case (mant_lo4)
              4'h1: out_r = 16'h3e3a;
              4'h2: out_r = 16'h3e38;
              4'h3: out_r = 16'h3e37;
              4'h4: out_r = 16'h3e36;
              4'h5: out_r = 16'h3e35;
              4'h6: out_r = 16'h3e34;
              4'h7: out_r = 16'h3e33;
              4'h8: out_r = 16'h3e31;
              4'h9: out_r = 16'h3e30;
              4'ha: out_r = 16'h3e2f;
              4'hb: out_r = 16'h3e2e;
              4'hc: out_r = 16'h3e2d;
              4'hd: out_r = 16'h3e2c;
              4'he: out_r = 16'h3e2b;
              4'hf: out_r = 16'h3e2a;
              default: begin end
            endcase
          end
          3'h5: begin
            out_r = 16'h3e28;
            case (mant_lo4)
              4'h1: out_r = 16'h3e27;
              4'h2: out_r = 16'h3e26;
              4'h3: out_r = 16'h3e25;
              4'h4: out_r = 16'h3e24;
              4'h5: out_r = 16'h3e23;
              4'h6: out_r = 16'h3e22;
              4'h7: out_r = 16'h3e21;
              4'h8: out_r = 16'h3e20;
              4'h9: out_r = 16'h3e1f;
              4'ha: out_r = 16'h3e1e;
              4'hb: out_r = 16'h3e1d;
              4'hc: out_r = 16'h3e1c;
              4'hd: out_r = 16'h3e1b;
              4'he: out_r = 16'h3e1a;
              4'hf: out_r = 16'h3e19;
              default: begin end
            endcase
          end
          3'h6: begin
            out_r = 16'h3e18;
            case (mant_lo4)
              4'h1: out_r = 16'h3e17;
              4'h2: out_r = 16'h3e16;
              4'h3: out_r = 16'h3e15;
              4'h4: out_r = 16'h3e14;
              4'h5: out_r = 16'h3e13;
              4'h6: out_r = 16'h3e12;
              4'h7: out_r = 16'h3e11;
              4'h8: out_r = 16'h3e10;
              4'h9: out_r = 16'h3e0f;
              4'ha: out_r = 16'h3e0e;
              4'hb: out_r = 16'h3e0d;
              4'hc: out_r = 16'h3e0c;
              4'hd: out_r = 16'h3e0b;
              4'he: out_r = 16'h3e0a;
              4'hf: out_r = 16'h3e09;
              default: begin end
            endcase
          end
          3'h7: begin
            out_r = 16'h3e08;
            case (mant_lo4)
              4'h1: out_r = 16'h3e07;
              4'h2: out_r = 16'h3e06;
              4'h3: out_r = 16'h3e05;
              4'h4: out_r = 16'h3e05;
              4'h5: out_r = 16'h3e04;
              4'h6: out_r = 16'h3e03;
              4'h7: out_r = 16'h3e02;
              4'h8: out_r = 16'h3e01;
              4'h9: out_r = 16'h3e00;
              4'ha: out_r = 16'h3dfe;
              4'hb: out_r = 16'h3dfd;
              4'hc: out_r = 16'h3dfb;
              4'hd: out_r = 16'h3df9;
              4'he: out_r = 16'h3df8;
              4'hf: out_r = 16'h3df6;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h180: begin
        case (mant_hi3)
          3'h0: begin
            out_r = 16'h3df4;
            case (mant_lo4)
              4'h1: out_r = 16'h3df1;
              4'h2: out_r = 16'h3ded;
              4'h3: out_r = 16'h3dea;
              4'h4: out_r = 16'h3de7;
              4'h5: out_r = 16'h3de4;
              4'h6: out_r = 16'h3de1;
              4'h7: out_r = 16'h3dde;
              4'h8: out_r = 16'h3ddb;
              4'h9: out_r = 16'h3dd7;
              4'ha: out_r = 16'h3dd4;
              4'hb: out_r = 16'h3dd2;
              4'hc: out_r = 16'h3dcf;
              4'hd: out_r = 16'h3dcc;
              4'he: out_r = 16'h3dc9;
              4'hf: out_r = 16'h3dc6;
              default: begin end
            endcase
          end
          3'h1: begin
            out_r = 16'h3dc3;
            case (mant_lo4)
              4'h1: out_r = 16'h3dc1;
              4'h2: out_r = 16'h3dbe;
              4'h3: out_r = 16'h3dbb;
              4'h4: out_r = 16'h3db9;
              4'h5: out_r = 16'h3db6;
              4'h6: out_r = 16'h3db3;
              4'h7: out_r = 16'h3db1;
              4'h8: out_r = 16'h3dae;
              4'h9: out_r = 16'h3dac;
              4'ha: out_r = 16'h3da9;
              4'hb: out_r = 16'h3da7;
              4'hc: out_r = 16'h3da5;
              4'hd: out_r = 16'h3da2;
              4'he: out_r = 16'h3da0;
              4'hf: out_r = 16'h3d9e;
              default: begin end
            endcase
          end
          3'h2: begin
            out_r = 16'h3d9b;
            case (mant_lo4)
              4'h1: out_r = 16'h3d99;
              4'h2: out_r = 16'h3d97;
              4'h3: out_r = 16'h3d95;
              4'h4: out_r = 16'h3d93;
              4'h5: out_r = 16'h3d91;
              4'h6: out_r = 16'h3d8e;
              4'h7: out_r = 16'h3d8c;
              4'h8: out_r = 16'h3d8a;
              4'h9: out_r = 16'h3d88;
              4'ha: out_r = 16'h3d86;
              4'hb: out_r = 16'h3d84;
              4'hc: out_r = 16'h3d82;
              4'hd: out_r = 16'h3d81;
              4'he: out_r = 16'h3d7d;
              4'hf: out_r = 16'h3d7a;
              default: begin end
            endcase
          end
          3'h3: begin
            out_r = 16'h3d76;
            case (mant_lo4)
              4'h1: out_r = 16'h3d73;
              4'h2: out_r = 16'h3d6f;
              4'h3: out_r = 16'h3d6b;
              4'h4: out_r = 16'h3d68;
              4'h5: out_r = 16'h3d65;
              4'h6: out_r = 16'h3d61;
              4'h7: out_r = 16'h3d5e;
              4'h8: out_r = 16'h3d5b;
              4'h9: out_r = 16'h3d58;
              4'ha: out_r = 16'h3d54;
              4'hb: out_r = 16'h3d51;
              4'hc: out_r = 16'h3d4e;
              4'hd: out_r = 16'h3d4b;
              4'he: out_r = 16'h3d48;
              4'hf: out_r = 16'h3d45;
              default: begin end
            endcase
          end
          3'h4: begin
            out_r = 16'h3d42;
            case (mant_lo4)
              4'h1: out_r = 16'h3d3f;
              4'h2: out_r = 16'h3d3d;
              4'h3: out_r = 16'h3d3a;
              4'h4: out_r = 16'h3d37;
              4'h5: out_r = 16'h3d34;
              4'h6: out_r = 16'h3d32;
              4'h7: out_r = 16'h3d2f;
              4'h8: out_r = 16'h3d2c;
              4'h9: out_r = 16'h3d2a;
              4'ha: out_r = 16'h3d27;
              4'hb: out_r = 16'h3d25;
              4'hc: out_r = 16'h3d22;
              4'hd: out_r = 16'h3d20;
              4'he: out_r = 16'h3d1e;
              4'hf: out_r = 16'h3d1b;
              default: begin end
            endcase
          end
          3'h5: begin
            out_r = 16'h3d19;
            case (mant_lo4)
              4'h1: out_r = 16'h3d17;
              4'h2: out_r = 16'h3d14;
              4'h3: out_r = 16'h3d12;
              4'h4: out_r = 16'h3d10;
              4'h5: out_r = 16'h3d0e;
              4'h6: out_r = 16'h3d0c;
              4'h7: out_r = 16'h3d0a;
              4'h8: out_r = 16'h3d08;
              4'h9: out_r = 16'h3d05;
              4'ha: out_r = 16'h3d03;
              4'hb: out_r = 16'h3d02;
              4'hc: out_r = 16'h3cff;
              4'hd: out_r = 16'h3cfb;
              4'he: out_r = 16'h3cf8;
              4'hf: out_r = 16'h3cf4;
              default: begin end
            endcase
          end
          3'h6: begin
            out_r = 16'h3cf0;
            case (mant_lo4)
              4'h1: out_r = 16'h3ced;
              4'h2: out_r = 16'h3ce9;
              4'h3: out_r = 16'h3ce5;
              4'h4: out_r = 16'h3ce2;
              4'h5: out_r = 16'h3cdf;
              4'h6: out_r = 16'h3cdb;
              4'h7: out_r = 16'h3cd8;
              4'h8: out_r = 16'h3cd5;
              4'h9: out_r = 16'h3cd1;
              4'ha: out_r = 16'h3cce;
              4'hb: out_r = 16'h3ccb;
              4'hc: out_r = 16'h3cc8;
              4'hd: out_r = 16'h3cc5;
              4'he: out_r = 16'h3cc2;
              4'hf: out_r = 16'h3cbf;
              default: begin end
            endcase
          end
          3'h7: begin
            out_r = 16'h3cbc;
            case (mant_lo4)
              4'h1: out_r = 16'h3cb9;
              4'h2: out_r = 16'h3cb7;
              4'h3: out_r = 16'h3cb4;
              4'h4: out_r = 16'h3cb1;
              4'h5: out_r = 16'h3cae;
              4'h6: out_r = 16'h3cac;
              4'h7: out_r = 16'h3ca9;
              4'h8: out_r = 16'h3ca7;
              4'h9: out_r = 16'h3ca4;
              4'ha: out_r = 16'h3ca2;
              4'hb: out_r = 16'h3c9f;
              4'hc: out_r = 16'h3c9d;
              4'hd: out_r = 16'h3c9a;
              4'he: out_r = 16'h3c98;
              4'hf: out_r = 16'h3c96;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h181: begin
        case (mant_hi3)
          3'h0: begin
            out_r = 16'h3c93;
            case (mant_lo4)
              4'h1: out_r = 16'h3c8f;
              4'h2: out_r = 16'h3c8b;
              4'h3: out_r = 16'h3c86;
              4'h4: out_r = 16'h3c82;
              4'h5: out_r = 16'h3c7d;
              4'h6: out_r = 16'h3c75;
              4'h7: out_r = 16'h3c6e;
              4'h8: out_r = 16'h3c66;
              4'h9: out_r = 16'h3c5f;
              4'ha: out_r = 16'h3c59;
              4'hb: out_r = 16'h3c52;
              4'hc: out_r = 16'h3c4c;
              4'hd: out_r = 16'h3c45;
              4'he: out_r = 16'h3c3f;
              4'hf: out_r = 16'h3c3a;
              default: begin end
            endcase
          end
          3'h1: begin
            out_r = 16'h3c34;
            case (mant_lo4)
              4'h1: out_r = 16'h3c2f;
              4'h2: out_r = 16'h3c29;
              4'h3: out_r = 16'h3c24;
              4'h4: out_r = 16'h3c1f;
              4'h5: out_r = 16'h3c1a;
              4'h6: out_r = 16'h3c16;
              4'h7: out_r = 16'h3c11;
              4'h8: out_r = 16'h3c0d;
              4'h9: out_r = 16'h3c08;
              4'ha: out_r = 16'h3c04;
              4'hb: out_r = 16'h3c00;
              4'hc: out_r = 16'h3bf8;
              4'hd: out_r = 16'h3bf1;
              4'he: out_r = 16'h3be9;
              4'hf: out_r = 16'h3be2;
              default: begin end
            endcase
          end
          3'h2: begin
            out_r = 16'h3bdb;
            case (mant_lo4)
              4'h1: out_r = 16'h3bd5;
              4'h2: out_r = 16'h3bce;
              4'h3: out_r = 16'h3bc8;
              4'h4: out_r = 16'h3bc2;
              4'h5: out_r = 16'h3bbc;
              4'h6: out_r = 16'h3bb6;
              4'h7: out_r = 16'h3bb0;
              4'h8: out_r = 16'h3bab;
              4'h9: out_r = 16'h3ba6;
              4'ha: out_r = 16'h3ba1;
              4'hb: out_r = 16'h3b9c;
              4'hc: out_r = 16'h3b97;
              4'hd: out_r = 16'h3b92;
              4'he: out_r = 16'h3b8e;
              4'hf: out_r = 16'h3b8a;
              default: begin end
            endcase
          end
          3'h3: begin
            out_r = 16'h3b85;
            case (mant_lo4)
              4'h1: out_r = 16'h3b81;
              4'h2: out_r = 16'h3b7b;
              4'h3: out_r = 16'h3b73;
              4'h4: out_r = 16'h3b6c;
              4'h5: out_r = 16'h3b64;
              4'h6: out_r = 16'h3b5d;
              4'h7: out_r = 16'h3b57;
              4'h8: out_r = 16'h3b50;
              4'h9: out_r = 16'h3b4a;
              4'ha: out_r = 16'h3b43;
              4'hb: out_r = 16'h3b3d;
              4'hc: out_r = 16'h3b38;
              4'hd: out_r = 16'h3b32;
              4'he: out_r = 16'h3b2c;
              4'hf: out_r = 16'h3b27;
              default: begin end
            endcase
          end
          3'h4: begin
            out_r = 16'h3b22;
            case (mant_lo4)
              4'h1: out_r = 16'h3b1d;
              4'h2: out_r = 16'h3b18;
              4'h3: out_r = 16'h3b14;
              4'h4: out_r = 16'h3b0f;
              4'h5: out_r = 16'h3b0b;
              4'h6: out_r = 16'h3b06;
              4'h7: out_r = 16'h3b02;
              4'h8: out_r = 16'h3afd;
              4'h9: out_r = 16'h3af5;
              4'ha: out_r = 16'h3aed;
              4'hb: out_r = 16'h3ae6;
              4'hc: out_r = 16'h3adf;
              4'hd: out_r = 16'h3ad8;
              4'he: out_r = 16'h3ad1;
              4'hf: out_r = 16'h3acb;
              default: begin end
            endcase
          end
          3'h5: begin
            out_r = 16'h3ac5;
            case (mant_lo4)
              4'h1: out_r = 16'h3abf;
              4'h2: out_r = 16'h3ab9;
              4'h3: out_r = 16'h3ab3;
              4'h4: out_r = 16'h3aae;
              4'h5: out_r = 16'h3aa8;
              4'h6: out_r = 16'h3aa3;
              4'h7: out_r = 16'h3a9e;
              4'h8: out_r = 16'h3a99;
              4'h9: out_r = 16'h3a95;
              4'ha: out_r = 16'h3a90;
              4'hb: out_r = 16'h3a8c;
              4'hc: out_r = 16'h3a87;
              4'hd: out_r = 16'h3a83;
              4'he: out_r = 16'h3a7e;
              4'hf: out_r = 16'h3a76;
              default: begin end
            endcase
          end
          3'h6: begin
            out_r = 16'h3a6f;
            case (mant_lo4)
              4'h1: out_r = 16'h3a67;
              4'h2: out_r = 16'h3a60;
              4'h3: out_r = 16'h3a59;
              4'h4: out_r = 16'h3a53;
              4'h5: out_r = 16'h3a4c;
              4'h6: out_r = 16'h3a46;
              4'h7: out_r = 16'h3a40;
              4'h8: out_r = 16'h3a3a;
              4'h9: out_r = 16'h3a34;
              4'ha: out_r = 16'h3a2f;
              4'hb: out_r = 16'h3a29;
              4'hc: out_r = 16'h3a24;
              4'hd: out_r = 16'h3a1f;
              4'he: out_r = 16'h3a1a;
              4'hf: out_r = 16'h3a16;
              default: begin end
            endcase
          end
          3'h7: begin
            out_r = 16'h3a11;
            case (mant_lo4)
              4'h1: out_r = 16'h3a0c;
              4'h2: out_r = 16'h3a08;
              4'h3: out_r = 16'h3a04;
              4'h4: out_r = 16'h3a00;
              4'h5: out_r = 16'h39f8;
              4'h6: out_r = 16'h39f0;
              4'h7: out_r = 16'h39e9;
              4'h8: out_r = 16'h39e2;
              4'h9: out_r = 16'h39db;
              4'ha: out_r = 16'h39d4;
              4'hb: out_r = 16'h39ce;
              4'hc: out_r = 16'h39c7;
              4'hd: out_r = 16'h39c1;
              4'he: out_r = 16'h39bb;
              4'hf: out_r = 16'h39b5;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h182: begin
        case (mant_hi3)
          3'h0: begin
            out_r = 16'h39b0;
            case (mant_lo4)
              4'h1: out_r = 16'h39a5;
              4'h2: out_r = 16'h399b;
              4'h3: out_r = 16'h3992;
              4'h4: out_r = 16'h3989;
              4'h5: out_r = 16'h3981;
              4'h6: out_r = 16'h3972;
              4'h7: out_r = 16'h3963;
              4'h8: out_r = 16'h3955;
              4'h9: out_r = 16'h3948;
              4'ha: out_r = 16'h393c;
              4'hb: out_r = 16'h3931;
              4'hc: out_r = 16'h3926;
              4'hd: out_r = 16'h391c;
              4'he: out_r = 16'h3913;
              4'hf: out_r = 16'h390a;
              default: begin end
            endcase
          end
          3'h1: begin
            out_r = 16'h3901;
            case (mant_lo4)
              4'h1: out_r = 16'h38f3;
              4'h2: out_r = 16'h38e4;
              4'h3: out_r = 16'h38d7;
              4'h4: out_r = 16'h38ca;
              4'h5: out_r = 16'h38bd;
              4'h6: out_r = 16'h38b2;
              4'h7: out_r = 16'h38a7;
              4'h8: out_r = 16'h389d;
              4'h9: out_r = 16'h3893;
              4'ha: out_r = 16'h388b;
              4'hb: out_r = 16'h3882;
              4'hc: out_r = 16'h3874;
              4'hd: out_r = 16'h3866;
              4'he: out_r = 16'h3858;
              4'hf: out_r = 16'h384b;
              default: begin end
            endcase
          end
          3'h2: begin
            out_r = 16'h383e;
            case (mant_lo4)
              4'h1: out_r = 16'h3833;
              4'h2: out_r = 16'h3828;
              4'h3: out_r = 16'h381e;
              4'h4: out_r = 16'h3814;
              4'h5: out_r = 16'h380b;
              4'h6: out_r = 16'h3803;
              4'h7: out_r = 16'h37f6;
              4'h8: out_r = 16'h37e7;
              4'h9: out_r = 16'h37d9;
              4'ha: out_r = 16'h37cc;
              4'hb: out_r = 16'h37bf;
              4'hc: out_r = 16'h37b4;
              4'hd: out_r = 16'h37a9;
              4'he: out_r = 16'h379f;
              4'hf: out_r = 16'h3795;
              default: begin end
            endcase
          end
          3'h3: begin
            out_r = 16'h378c;
            case (mant_lo4)
              4'h1: out_r = 16'h3784;
              4'h2: out_r = 16'h3777;
              4'h3: out_r = 16'h3768;
              4'h4: out_r = 16'h375a;
              4'h5: out_r = 16'h374d;
              4'h6: out_r = 16'h3741;
              4'h7: out_r = 16'h3735;
              4'h8: out_r = 16'h372a;
              4'h9: out_r = 16'h3720;
              4'ha: out_r = 16'h3716;
              4'hb: out_r = 16'h370d;
              4'hc: out_r = 16'h3704;
              4'hd: out_r = 16'h36f9;
              4'he: out_r = 16'h36ea;
              4'hf: out_r = 16'h36db;
              default: begin end
            endcase
          end
          3'h4: begin
            out_r = 16'h36ce;
            case (mant_lo4)
              4'h1: out_r = 16'h36c2;
              4'h2: out_r = 16'h36b6;
              4'h3: out_r = 16'h36ab;
              4'h4: out_r = 16'h36a1;
              4'h5: out_r = 16'h3697;
              4'h6: out_r = 16'h368e;
              4'h7: out_r = 16'h3685;
              4'h8: out_r = 16'h367a;
              4'h9: out_r = 16'h366b;
              4'ha: out_r = 16'h365d;
              4'hb: out_r = 16'h364f;
              4'hc: out_r = 16'h3643;
              4'hd: out_r = 16'h3637;
              4'he: out_r = 16'h362c;
              4'hf: out_r = 16'h3621;
              default: begin end
            endcase
          end
          3'h5: begin
            out_r = 16'h3618;
            case (mant_lo4)
              4'h1: out_r = 16'h360e;
              4'h2: out_r = 16'h3606;
              4'h3: out_r = 16'h35fc;
              4'h4: out_r = 16'h35ec;
              4'h5: out_r = 16'h35de;
              4'h6: out_r = 16'h35d1;
              4'h7: out_r = 16'h35c4;
              4'h8: out_r = 16'h35b8;
              4'h9: out_r = 16'h35ad;
              4'ha: out_r = 16'h35a2;
              4'hb: out_r = 16'h3599;
              4'hc: out_r = 16'h358f;
              4'hd: out_r = 16'h3587;
              4'he: out_r = 16'h357d;
              4'hf: out_r = 16'h356e;
              default: begin end
            endcase
          end
          3'h6: begin
            out_r = 16'h355f;
            case (mant_lo4)
              4'h1: out_r = 16'h3552;
              4'h2: out_r = 16'h3545;
              4'h3: out_r = 16'h3539;
              4'h4: out_r = 16'h352e;
              4'h5: out_r = 16'h3523;
              4'h6: out_r = 16'h3519;
              4'h7: out_r = 16'h3510;
              4'h8: out_r = 16'h3507;
              4'h9: out_r = 16'h34fe;
              4'ha: out_r = 16'h34ef;
              4'hb: out_r = 16'h34e0;
              4'hc: out_r = 16'h34d3;
              4'hd: out_r = 16'h34c6;
              4'he: out_r = 16'h34ba;
              4'hf: out_r = 16'h34af;
              default: begin end
            endcase
          end
          3'h7: begin
            out_r = 16'h34a4;
            case (mant_lo4)
              4'h1: out_r = 16'h349a;
              4'h2: out_r = 16'h3491;
              4'h3: out_r = 16'h3488;
              4'h4: out_r = 16'h3480;
              4'h5: out_r = 16'h3470;
              4'h6: out_r = 16'h3462;
              4'h7: out_r = 16'h3454;
              4'h8: out_r = 16'h3447;
              4'h9: out_r = 16'h343b;
              4'ha: out_r = 16'h3430;
              4'hb: out_r = 16'h3425;
              4'hc: out_r = 16'h341b;
              4'hd: out_r = 16'h3412;
              4'he: out_r = 16'h3409;
              4'hf: out_r = 16'h3401;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h183: begin
        case (mant_hi3)
          3'h0: begin
            out_r = 16'h33f2;
            case (mant_lo4)
              4'h1: out_r = 16'h33d5;
              4'h2: out_r = 16'h33bc;
              4'h3: out_r = 16'h33a6;
              4'h4: out_r = 16'h3393;
              4'h5: out_r = 16'h3381;
              4'h6: out_r = 16'h3364;
              4'h7: out_r = 16'h3349;
              4'h8: out_r = 16'h3332;
              4'h9: out_r = 16'h331d;
              4'ha: out_r = 16'h330a;
              4'hb: out_r = 16'h32f4;
              4'hc: out_r = 16'h32d8;
              4'hd: out_r = 16'h32be;
              4'he: out_r = 16'h32a8;
              4'hf: out_r = 16'h3294;
              default: begin end
            endcase
          end
          3'h1: begin
            out_r = 16'h3283;
            case (mant_lo4)
              4'h1: out_r = 16'h3267;
              4'h2: out_r = 16'h324c;
              4'h3: out_r = 16'h3234;
              4'h4: out_r = 16'h321f;
              4'h5: out_r = 16'h320c;
              4'h6: out_r = 16'h31f7;
              4'h7: out_r = 16'h31da;
              4'h8: out_r = 16'h31c1;
              4'h9: out_r = 16'h31aa;
              4'ha: out_r = 16'h3196;
              4'hb: out_r = 16'h3184;
              4'hc: out_r = 16'h316a;
              4'hd: out_r = 16'h314e;
              4'he: out_r = 16'h3136;
              4'hf: out_r = 16'h3121;
              default: begin end
            endcase
          end
          3'h2: begin
            out_r = 16'h310e;
            case (mant_lo4)
              4'h1: out_r = 16'h30fa;
              4'h2: out_r = 16'h30dd;
              4'h3: out_r = 16'h30c3;
              4'h4: out_r = 16'h30ac;
              4'h5: out_r = 16'h3098;
              4'h6: out_r = 16'h3086;
              4'h7: out_r = 16'h306c;
              4'h8: out_r = 16'h3050;
              4'h9: out_r = 16'h3038;
              4'ha: out_r = 16'h3022;
              4'hb: out_r = 16'h300f;
              4'hc: out_r = 16'h2ffd;
              4'hd: out_r = 16'h2fdf;
              4'he: out_r = 16'h2fc5;
              4'hf: out_r = 16'h2fae;
              default: begin end
            endcase
          end
          3'h3: begin
            out_r = 16'h2f99;
            case (mant_lo4)
              4'h1: out_r = 16'h2f87;
              4'h2: out_r = 16'h2f6f;
              4'h3: out_r = 16'h2f53;
              4'h4: out_r = 16'h2f3a;
              4'h5: out_r = 16'h2f24;
              4'h6: out_r = 16'h2f11;
              4'h7: out_r = 16'h2f00;
              4'h8: out_r = 16'h2ee2;
              4'h9: out_r = 16'h2ec7;
              4'ha: out_r = 16'h2eb0;
              4'hb: out_r = 16'h2e9b;
              4'hc: out_r = 16'h2e89;
              4'hd: out_r = 16'h2e72;
              4'he: out_r = 16'h2e55;
              4'hf: out_r = 16'h2e3c;
              default: begin end
            endcase
          end
          3'h4: begin
            out_r = 16'h2e26;
            case (mant_lo4)
              4'h1: out_r = 16'h2e13;
              4'h2: out_r = 16'h2e01;
              4'h3: out_r = 16'h2de4;
              4'h4: out_r = 16'h2dc9;
              4'h5: out_r = 16'h2db2;
              4'h6: out_r = 16'h2d9d;
              4'h7: out_r = 16'h2d8a;
              4'h8: out_r = 16'h2d74;
              4'h9: out_r = 16'h2d58;
              4'ha: out_r = 16'h2d3e;
              4'hb: out_r = 16'h2d28;
              4'hc: out_r = 16'h2d14;
              4'hd: out_r = 16'h2d03;
              4'he: out_r = 16'h2ce7;
              4'hf: out_r = 16'h2ccc;
              default: begin end
            endcase
          end
          3'h5: begin
            out_r = 16'h2cb4;
            case (mant_lo4)
              4'h1: out_r = 16'h2c9f;
              4'h2: out_r = 16'h2c8c;
              4'h3: out_r = 16'h2c77;
              4'h4: out_r = 16'h2c5a;
              4'h5: out_r = 16'h2c40;
              4'h6: out_r = 16'h2c2a;
              4'h7: out_r = 16'h2c16;
              4'h8: out_r = 16'h2c04;
              4'h9: out_r = 16'h2be9;
              4'ha: out_r = 16'h2bce;
              4'hb: out_r = 16'h2bb6;
              4'hc: out_r = 16'h2ba0;
              4'hd: out_r = 16'h2b8e;
              4'he: out_r = 16'h2b7a;
              4'hf: out_r = 16'h2b5d;
              default: begin end
            endcase
          end
          3'h6: begin
            out_r = 16'h2b43;
            case (mant_lo4)
              4'h1: out_r = 16'h2b2c;
              4'h2: out_r = 16'h2b18;
              4'h3: out_r = 16'h2b06;
              4'h4: out_r = 16'h2aec;
              4'h5: out_r = 16'h2ad0;
              4'h6: out_r = 16'h2ab8;
              4'h7: out_r = 16'h2aa2;
              4'h8: out_r = 16'h2a8f;
              4'h9: out_r = 16'h2a7d;
              4'ha: out_r = 16'h2a5f;
              4'hb: out_r = 16'h2a45;
              4'hc: out_r = 16'h2a2e;
              4'hd: out_r = 16'h2a19;
              4'he: out_r = 16'h2a07;
              4'hf: out_r = 16'h29ef;
              default: begin end
            endcase
          end
          3'h7: begin
            out_r = 16'h29d3;
            case (mant_lo4)
              4'h1: out_r = 16'h29ba;
              4'h2: out_r = 16'h29a4;
              4'h3: out_r = 16'h2991;
              4'h4: out_r = 16'h2980;
              4'h5: out_r = 16'h2962;
              4'h6: out_r = 16'h2947;
              4'h7: out_r = 16'h2930;
              4'h8: out_r = 16'h291b;
              4'h9: out_r = 16'h2909;
              4'ha: out_r = 16'h28f1;
              4'hb: out_r = 16'h28d5;
              4'hc: out_r = 16'h28bc;
              4'hd: out_r = 16'h28a6;
              4'he: out_r = 16'h2892;
              4'hf: out_r = 16'h2881;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h184: begin
        case (mant_hi3)
          3'h0: begin
            out_r = 16'h2864;
            case (mant_lo4)
              4'h1: out_r = 16'h2832;
              4'h2: out_r = 16'h280a;
              4'h3: out_r = 16'h27d8;
              4'h4: out_r = 16'h27a8;
              4'h5: out_r = 16'h2783;
              4'h6: out_r = 16'h274c;
              4'h7: out_r = 16'h271f;
              4'h8: out_r = 16'h26f7;
              4'h9: out_r = 16'h26c0;
              4'ha: out_r = 16'h2696;
              4'hb: out_r = 16'h2669;
              4'hc: out_r = 16'h2636;
              4'hd: out_r = 16'h260e;
              4'he: out_r = 16'h25dc;
              4'hf: out_r = 16'h25ac;
              default: begin end
            endcase
          end
          3'h1: begin
            out_r = 16'h2586;
            case (mant_lo4)
              4'h1: out_r = 16'h2550;
              4'h2: out_r = 16'h2522;
              4'h3: out_r = 16'h24fd;
              4'h4: out_r = 16'h24c5;
              4'h5: out_r = 16'h2499;
              4'h6: out_r = 16'h246f;
              4'h7: out_r = 16'h243a;
              4'h8: out_r = 16'h2411;
              4'h9: out_r = 16'h23e1;
              4'ha: out_r = 16'h23b0;
              4'hb: out_r = 16'h2389;
              4'hc: out_r = 16'h2355;
              4'hd: out_r = 16'h2326;
              4'he: out_r = 16'h2301;
              4'hf: out_r = 16'h22c9;
              default: begin end
            endcase
          end
          3'h2: begin
            out_r = 16'h229d;
            case (mant_lo4)
              4'h1: out_r = 16'h2274;
              4'h2: out_r = 16'h223e;
              4'h3: out_r = 16'h2214;
              4'h4: out_r = 16'h21e7;
              4'h5: out_r = 16'h21b4;
              4'h6: out_r = 16'h218c;
              4'h7: out_r = 16'h215a;
              4'h8: out_r = 16'h212a;
              4'h9: out_r = 16'h2104;
              4'ha: out_r = 16'h20ce;
              4'hb: out_r = 16'h20a0;
              4'hc: out_r = 16'h207a;
              4'hd: out_r = 16'h2042;
              4'he: out_r = 16'h2017;
              4'hf: out_r = 16'h1fec;
              default: begin end
            endcase
          end
          3'h3: begin
            out_r = 16'h1fb8;
            case (mant_lo4)
              4'h1: out_r = 16'h1f8f;
              4'h2: out_r = 16'h1f5f;
              4'h3: out_r = 16'h1f2e;
              4'h4: out_r = 16'h1f07;
              4'h5: out_r = 16'h1ed3;
              4'h6: out_r = 16'h1ea4;
              4'h7: out_r = 16'h1e7f;
              4'h8: out_r = 16'h1e47;
              4'h9: out_r = 16'h1e1b;
              4'ha: out_r = 16'h1df1;
              4'hb: out_r = 16'h1dbc;
              4'hc: out_r = 16'h1d92;
              4'hd: out_r = 16'h1d64;
              4'he: out_r = 16'h1d32;
              4'hf: out_r = 16'h1d0a;
              default: begin end
            endcase
          end
          3'h4: begin
            out_r = 16'h1cd7;
            case (mant_lo4)
              4'h1: out_r = 16'h1ca8;
              4'h2: out_r = 16'h1c83;
              4'h3: out_r = 16'h1c4b;
              4'h4: out_r = 16'h1c1e;
              4'h5: out_r = 16'h1bf7;
              4'h6: out_r = 16'h1bc0;
              4'h7: out_r = 16'h1b96;
              4'h8: out_r = 16'h1b69;
              4'h9: out_r = 16'h1b36;
              4'ha: out_r = 16'h1b0d;
              4'hb: out_r = 16'h1adc;
              4'hc: out_r = 16'h1aac;
              4'hd: out_r = 16'h1a86;
              4'he: out_r = 16'h1a50;
              4'hf: out_r = 16'h1a22;
              default: begin end
            endcase
          end
          3'h5: begin
            out_r = 16'h19fc;
            case (mant_lo4)
              4'h1: out_r = 16'h19c5;
              4'h2: out_r = 16'h1999;
              4'h3: out_r = 16'h196e;
              4'h4: out_r = 16'h193a;
              4'h5: out_r = 16'h1911;
              4'h6: out_r = 16'h18e1;
              4'h7: out_r = 16'h18af;
              4'h8: out_r = 16'h1889;
              4'h9: out_r = 16'h1855;
              4'ha: out_r = 16'h1826;
              4'hb: out_r = 16'h1801;
              4'hc: out_r = 16'h17c9;
              4'hd: out_r = 16'h179d;
              4'he: out_r = 16'h1774;
              4'hf: out_r = 16'h173e;
              default: begin end
            endcase
          end
          3'h6: begin
            out_r = 16'h1714;
            case (mant_lo4)
              4'h1: out_r = 16'h16e6;
              4'h2: out_r = 16'h16b3;
              4'h3: out_r = 16'h168c;
              4'h4: out_r = 16'h165a;
              4'h5: out_r = 16'h162a;
              4'h6: out_r = 16'h1604;
              4'h7: out_r = 16'h15ce;
              4'h8: out_r = 16'h15a0;
              4'h9: out_r = 16'h157a;
              4'ha: out_r = 16'h1542;
              4'hb: out_r = 16'h1517;
              4'hc: out_r = 16'h14ec;
              4'hd: out_r = 16'h14b8;
              4'he: out_r = 16'h148f;
              4'hf: out_r = 16'h145f;
              default: begin end
            endcase
          end
          3'h7: begin
            out_r = 16'h142d;
            case (mant_lo4)
              4'h1: out_r = 16'h1407;
              4'h2: out_r = 16'h13d2;
              4'h3: out_r = 16'h13a4;
              4'h4: out_r = 16'h137f;
              4'h5: out_r = 16'h1347;
              4'h6: out_r = 16'h131b;
              4'h7: out_r = 16'h12f1;
              4'h8: out_r = 16'h12bc;
              4'h9: out_r = 16'h1292;
              4'ha: out_r = 16'h1264;
              4'hb: out_r = 16'h1231;
              4'hc: out_r = 16'h120a;
              4'hd: out_r = 16'h11d7;
              4'he: out_r = 16'h11a8;
              4'hf: out_r = 16'h1183;
              default: begin end
            endcase
          end
          default: begin end
        endcase
      end
      9'h185: begin
        case (mant_hi3)
          3'h0: begin
            out_r = 16'h114b;
            case (mant_lo4)
              4'h1: out_r = 16'h10f7;
              4'h2: out_r = 16'h1096;
              4'h3: out_r = 16'h1035;
              4'h4: out_r = 16'h0fdc;
              4'h5: out_r = 16'h0f86;
              4'h6: out_r = 16'h0f22;
              4'h7: out_r = 16'h0ec4;
              4'h8: out_r = 16'h0e6e;
              4'h9: out_r = 16'h0e11;
              4'ha: out_r = 16'h0daf;
              4'hb: out_r = 16'h0d55;
              4'hc: out_r = 16'h0d01;
              4'hd: out_r = 16'h0c9c;
              4'he: out_r = 16'h0c3e;
              4'hf: out_r = 16'h0be6;
              default: begin end
            endcase
          end
          3'h1: begin
            out_r = 16'h0b8c;
            case (mant_lo4)
              4'h1: out_r = 16'h0b29;
              4'h2: out_r = 16'h0ace;
              4'h3: out_r = 16'h0a79;
              4'h4: out_r = 16'h0a17;
              4'h5: out_r = 16'h09b7;
              4'h6: out_r = 16'h095f;
              4'h7: out_r = 16'h0907;
              4'h8: out_r = 16'h08a4;
              4'h9: out_r = 16'h0847;
              4'ha: out_r = 16'h07f1;
              4'hb: out_r = 16'h0792;
              4'hc: out_r = 16'h0731;
              4'hd: out_r = 16'h06d7;
              4'he: out_r = 16'h0682;
              4'hf: out_r = 16'h061e;
              default: begin end
            endcase
          end
          3'h2: begin
            out_r = 16'h05c0;
            case (mant_lo4)
              4'h1: out_r = 16'h0569;
              4'h2: out_r = 16'h050d;
              4'h3: out_r = 16'h04ab;
              4'h4: out_r = 16'h0450;
              4'h5: out_r = 16'h03fc;
              4'h6: out_r = 16'h0399;
              4'h7: out_r = 16'h0339;
              4'h8: out_r = 16'h02e1;
              4'h9: out_r = 16'h0288;
              4'ha: out_r = 16'h0226;
              4'hb: out_r = 16'h01c9;
              4'hc: out_r = 16'h0174;
              4'hd: out_r = 16'h0114;
              4'he: out_r = 16'h00b3;
              4'hf: out_r = 16'h0000;
              default: begin end
            endcase
          end
          3'h3: begin
            out_r = 16'h0000;
          end
          3'h4: begin
            out_r = 16'h0000;
          end
          3'h5: begin
            out_r = 16'h0000;
          end
          3'h6: begin
            out_r = 16'h0000;
          end
          3'h7: begin
            out_r = 16'h0000;
          end
          default: begin end
        endcase
      end
      9'h1ff: begin
        case (mant_hi3)
          3'h0: begin
            out_r = 16'h0000;
            case (mant_lo4)
              4'h1: out_r = 16'h7fc0;
              4'h2: out_r = 16'h7fc0;
              4'h3: out_r = 16'h7fc0;
              4'h4: out_r = 16'h7fc0;
              4'h5: out_r = 16'h7fc0;
              4'h6: out_r = 16'h7fc0;
              4'h7: out_r = 16'h7fc0;
              4'h8: out_r = 16'h7fc0;
              4'h9: out_r = 16'h7fc0;
              4'ha: out_r = 16'h7fc0;
              4'hb: out_r = 16'h7fc0;
              4'hc: out_r = 16'h7fc0;
              4'hd: out_r = 16'h7fc0;
              4'he: out_r = 16'h7fc0;
              4'hf: out_r = 16'h7fc0;
              default: begin end
            endcase
          end
          3'h1: begin
            out_r = 16'h7fc0;
          end
          3'h2: begin
            out_r = 16'h7fc0;
          end
          3'h3: begin
            out_r = 16'h7fc0;
          end
          3'h4: begin
            out_r = 16'h7fc0;
          end
          3'h5: begin
            out_r = 16'h7fc0;
          end
          3'h6: begin
            out_r = 16'h7fc0;
          end
          3'h7: begin
            out_r = 16'h7fc0;
          end
          default: begin end
        endcase
      end
      default: begin end
    endcase
  end
  assign out = out_r;
endmodule
