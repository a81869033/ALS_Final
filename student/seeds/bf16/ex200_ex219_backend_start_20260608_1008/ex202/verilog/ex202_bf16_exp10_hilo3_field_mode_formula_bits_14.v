module ex202_bf16_exp10_hilo3_field_mode_formula_bits_14(in, out);
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
  reg out_sign;
  reg [7:0] out_exp;
  reg [6:0] out_mant;
  always @* begin
    out_sign = 1'b0;
    out_exp = 8'h7f;
    out_mant = 7'h00;
    casez (sign_exp)
      9'b110000101: {out_sign, out_exp, out_mant} = 16'h0000;
      9'b11000011?: {out_sign, out_exp, out_mant} = 16'h0000;
      9'b110001???: {out_sign, out_exp, out_mant} = 16'h0000;
      9'b11001????: {out_sign, out_exp, out_mant} = 16'h0000;
      9'b1101?????: {out_sign, out_exp, out_mant} = 16'h0000;
      9'b1110?????: {out_sign, out_exp, out_mant} = 16'h0000;
      9'b11110????: {out_sign, out_exp, out_mant} = 16'h0000;
      9'b111110???: {out_sign, out_exp, out_mant} = 16'h0000;
      9'b1111110??: {out_sign, out_exp, out_mant} = 16'h0000;
      9'b11111110?: {out_sign, out_exp, out_mant} = 16'h0000;
      9'b111111110: {out_sign, out_exp, out_mant} = 16'h0000;
      9'b101110101: {out_sign, out_exp, out_mant} = 16'h3f7f;
      9'b001110110: {out_sign, out_exp, out_mant} = 16'h3f81;
      9'b010000101: {out_sign, out_exp, out_mant} = 16'h7f80;
      9'b01000011?: {out_sign, out_exp, out_mant} = 16'h7f80;
      9'b010001???: {out_sign, out_exp, out_mant} = 16'h7f80;
      9'b01001????: {out_sign, out_exp, out_mant} = 16'h7f80;
      9'b0101?????: {out_sign, out_exp, out_mant} = 16'h7f80;
      9'b0110?????: {out_sign, out_exp, out_mant} = 16'h7f80;
      9'b01110????: {out_sign, out_exp, out_mant} = 16'h7f80;
      9'b011110???: {out_sign, out_exp, out_mant} = 16'h7f80;
      9'b0111110??: {out_sign, out_exp, out_mant} = 16'h7f80;
      9'b01111110?: {out_sign, out_exp, out_mant} = 16'h7f80;
      9'b011111110: {out_sign, out_exp, out_mant} = 16'h7f80;
        9'h075: begin
          case (mant_hi3)
            3'h0: begin
              out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h00;
            end
            3'h1: begin
              out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h00;
            end
            3'h2: begin
              out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h00;
            end
            3'h3: begin
              out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h00;
            end
            3'h4: begin
              out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h00;
            end
            3'h5: begin
              out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h00;
              case (mant_lo4)
                4'he: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h01; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h01; end
                default: begin end
              endcase
            end
            3'h6: begin
              out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h01;
            end
            3'h7: begin
              out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h01;
            end
            default: begin end
          endcase
        end
        9'h077: begin
          case (mant_hi3)
            3'h0: begin
              out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h01;
            end
            3'h1: begin
              out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h01;
            end
            3'h2: begin
              out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h02;
              case (mant_lo4)
                4'h0: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h01; end
                4'h1: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h01; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h01; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h01; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h01; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h01; end
                default: begin end
              endcase
            end
            3'h3: begin
              out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h02;
            end
            3'h4: begin
              out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h02;
            end
            3'h5: begin
              out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h02;
            end
            3'h6: begin
              out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h02;
            end
            3'h7: begin
              out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h02;
            end
            default: begin end
          endcase
        end
        9'h078: begin
          case (mant_hi3)
            3'h0: begin
              out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h02;
              case (mant_lo4)
                4'ha: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h03; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h03; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h03; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h03; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h03; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h03; end
                default: begin end
              endcase
            end
            3'h1: begin
              out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h03;
            end
            3'h2: begin
              out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h03;
            end
            3'h3: begin
              out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h03;
            end
            3'h4: begin
              out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h04;
            end
            3'h5: begin
              out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h04;
            end
            3'h6: begin
              out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h04;
            end
            3'h7: begin
              out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h05;
              case (mant_lo4)
                4'h0: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h04; end
                4'h1: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h04; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h04; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h04; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h04; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h04; end
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h079: begin
          case (mant_hi3)
            3'h0: begin
              out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h05;
            end
            3'h1: begin
              out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h06;
              case (mant_lo4)
                4'h0: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h05; end
                4'h1: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h05; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h05; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h05; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h05; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h05; end
                default: begin end
              endcase
            end
            3'h2: begin
              out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h06;
            end
            3'h3: begin
              out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h07;
              case (mant_lo4)
                4'h0: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h06; end
                default: begin end
              endcase
            end
            3'h4: begin
              out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h07;
              case (mant_lo4)
                4'hb: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h08; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h08; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h08; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h08; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h08; end
                default: begin end
              endcase
            end
            3'h5: begin
              out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h08;
            end
            3'h6: begin
              out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h09;
              case (mant_lo4)
                4'h0: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h08; end
                4'h1: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h08; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h08; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h08; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h08; end
                default: begin end
              endcase
            end
            3'h7: begin
              out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h09;
              case (mant_lo4)
                4'hf: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h0a; end
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h07a: begin
          case (mant_hi3)
            3'h0: begin
              out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h0a;
              case (mant_lo4)
                4'hd: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h0b; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h0b; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h0b; end
                default: begin end
              endcase
            end
            3'h1: begin
              out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h0b;
              case (mant_lo4)
                4'ha: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h0c; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h0c; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h0c; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h0c; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h0c; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h0c; end
                default: begin end
              endcase
            end
            3'h2: begin
              out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h0d;
              case (mant_lo4)
                4'h0: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h0c; end
                4'h1: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h0c; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h0c; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h0c; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h0c; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h0c; end
                default: begin end
              endcase
            end
            3'h3: begin
              out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h0e;
              case (mant_lo4)
                4'h0: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h0d; end
                4'h1: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h0d; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h0d; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h0f; end
                default: begin end
              endcase
            end
            3'h4: begin
              out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h0f;
              case (mant_lo4)
                4'hc: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h10; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h10; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h10; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h10; end
                default: begin end
              endcase
            end
            3'h5: begin
              out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h10;
              case (mant_lo4)
                4'h8: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h11; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h11; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h11; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h11; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h11; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h11; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h11; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h11; end
                default: begin end
              endcase
            end
            3'h6: begin
              out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h12;
              case (mant_lo4)
                4'h0: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h11; end
                4'h1: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h11; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h11; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h11; end
                default: begin end
              endcase
            end
            3'h7: begin
              out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h13;
              case (mant_lo4)
                4'h0: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h12; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h14; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h14; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h14; end
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h07b: begin
          case (mant_hi3)
            3'h0: begin
              out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h15;
              case (mant_lo4)
                4'h0: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h14; end
                4'h1: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h14; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h14; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h14; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h14; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h16; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h16; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h16; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h16; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h16; end
                default: begin end
              endcase
            end
            3'h1: begin
              out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h18;
              case (mant_lo4)
                4'h0: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h16; end
                4'h1: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h17; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h17; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h17; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h17; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h17; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h19; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h19; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h19; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h19; end
                default: begin end
              endcase
            end
            3'h2: begin
              out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h1a;
              case (mant_lo4)
                4'h0: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h19; end
                4'h1: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h19; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h1b; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h1b; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h1b; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h1b; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h1b; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h1b; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h1c; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h1c; end
                default: begin end
              endcase
            end
            3'h3: begin
              out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h1d;
              case (mant_lo4)
                4'h0: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h1c; end
                4'h1: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h1c; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h1c; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h1e; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h1e; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h1e; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h1e; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h1e; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h1e; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h1f; end
                default: begin end
              endcase
            end
            3'h4: begin
              out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h20;
              case (mant_lo4)
                4'h0: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h1f; end
                4'h1: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h1f; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h1f; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h1f; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h21; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h21; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h21; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h21; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h21; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h22; end
                default: begin end
              endcase
            end
            3'h5: begin
              out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h24;
              case (mant_lo4)
                4'h0: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h22; end
                4'h1: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h22; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h22; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h22; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h22; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h23; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h23; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h23; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h23; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h23; end
                default: begin end
              endcase
            end
            3'h6: begin
              out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h27;
              case (mant_lo4)
                4'h0: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h25; end
                4'h1: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h25; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h25; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h25; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h25; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h26; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h26; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h26; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h26; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h26; end
                default: begin end
              endcase
            end
            3'h7: begin
              out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h2a;
              case (mant_lo4)
                4'h0: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h28; end
                4'h1: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h28; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h28; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h28; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h28; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h29; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h29; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h29; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h29; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h29; end
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h07c: begin
          case (mant_hi3)
            3'h0: begin
              out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h2b;
              case (mant_lo4)
                4'h3: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h2c; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h2c; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h2d; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h2d; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h2d; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h2e; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h2e; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h2f; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h2f; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h2f; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h30; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h30; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h31; end
                default: begin end
              endcase
            end
            3'h1: begin
              out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h33;
              case (mant_lo4)
                4'h0: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h31; end
                4'h1: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h31; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h32; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h32; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h34; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h34; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h35; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h35; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h35; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h36; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h36; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h37; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h37; end
                default: begin end
              endcase
            end
            3'h2: begin
              out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h39;
              case (mant_lo4)
                4'h0: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h37; end
                4'h1: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h38; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h38; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h3a; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h3a; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h3b; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h3b; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h3c; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h3c; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h3c; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h3d; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h3d; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h3e; end
                default: begin end
              endcase
            end
            3'h3: begin
              out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h3f;
              case (mant_lo4)
                4'h0: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h3e; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h40; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h40; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h41; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h41; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h42; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h42; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h42; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h43; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h43; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h44; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h44; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h45; end
                default: begin end
              endcase
            end
            3'h4: begin
              out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h46;
              case (mant_lo4)
                4'h0: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h45; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h47; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h47; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h48; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h48; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h49; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h49; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h4a; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h4a; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h4b; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h4b; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h4b; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h4c; end
                default: begin end
              endcase
            end
            3'h5: begin
              out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h51;
              case (mant_lo4)
                4'h0: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h4c; end
                4'h1: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h4d; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h4d; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h4e; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h4e; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h4f; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h4f; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h50; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h50; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h52; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h52; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h53; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h53; end
                default: begin end
              endcase
            end
            3'h6: begin
              out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h54;
              case (mant_lo4)
                4'h2: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h55; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h55; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h56; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h56; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h57; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h57; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h58; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h58; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h59; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h59; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h5a; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h5a; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h5b; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h5b; end
                default: begin end
              endcase
            end
            3'h7: begin
              out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h5c;
              case (mant_lo4)
                4'h2: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h5d; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h5d; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h5e; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h5e; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h5f; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h5f; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h60; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h60; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h61; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h61; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h62; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h62; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h63; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h63; end
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h07d: begin
          case (mant_hi3)
            3'h0: begin
              out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h64;
              case (mant_lo4)
                4'h1: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h65; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h66; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h67; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h68; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h69; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h6a; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h6b; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h6c; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h6d; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h6e; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h6f; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h70; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h71; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h72; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h74; end
                default: begin end
              endcase
            end
            3'h1: begin
              out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h01;
              case (mant_lo4)
                4'h0: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h75; end
                4'h1: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h76; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h77; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h78; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h79; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h7a; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h7b; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h7c; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h7e; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h7f; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h00; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h02; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h02; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h03; end
                default: begin end
              endcase
            end
            3'h2: begin
              out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h05;
              case (mant_lo4)
                4'h0: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h03; end
                4'h1: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h04; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h06; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h06; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h07; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h08; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h08; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h09; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h09; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h0a; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h0b; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h0b; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h0c; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h0d; end
                default: begin end
              endcase
            end
            3'h3: begin
              out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h0f;
              case (mant_lo4)
                4'h0: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h0d; end
                4'h1: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h0e; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h10; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h10; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h11; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h12; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h12; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h13; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h14; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h14; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h15; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h16; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h16; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h17; end
                default: begin end
              endcase
            end
            3'h4: begin
              out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h18;
              case (mant_lo4)
                4'h2: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h19; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h1a; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h1b; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h1b; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h1c; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h1d; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h1d; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h1e; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h1f; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h1f; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h20; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h21; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h22; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h22; end
                default: begin end
              endcase
            end
            3'h5: begin
              out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h25;
              case (mant_lo4)
                4'h0: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h23; end
                4'h1: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h24; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h26; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h27; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h28; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h28; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h29; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h2a; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h2b; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h2b; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h2c; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h2d; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h2e; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h2e; end
                default: begin end
              endcase
            end
            3'h6: begin
              out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h32;
              case (mant_lo4)
                4'h0: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h2f; end
                4'h1: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h30; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h31; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h33; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h34; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h35; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h36; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h36; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h37; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h38; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h39; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h3a; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h3b; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h3b; end
                default: begin end
              endcase
            end
            3'h7: begin
              out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h41;
              case (mant_lo4)
                4'h0: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h3c; end
                4'h1: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h3d; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h3e; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h3f; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h40; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h42; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h43; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h44; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h45; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h46; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h47; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h48; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h49; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h49; end
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h07e: begin
          case (mant_hi3)
            3'h0: begin
              out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h4a;
              case (mant_lo4)
                4'h1: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h4c; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h4e; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h50; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h52; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h54; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h56; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h58; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h59; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h5b; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h5d; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h5f; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h61; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h63; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h66; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h68; end
                default: begin end
              endcase
            end
            3'h1: begin
              out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h6a;
              case (mant_lo4)
                4'h1: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h6c; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h6e; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h70; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h72; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h74; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h77; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h79; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h7b; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h80; out_mant = 7'h7d; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h81; out_mant = 7'h00; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h81; out_mant = 7'h01; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h81; out_mant = 7'h02; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h81; out_mant = 7'h03; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h81; out_mant = 7'h05; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h81; out_mant = 7'h06; end
                default: begin end
              endcase
            end
            3'h2: begin
              out_sign = 1'b0; out_exp = 8'h81; out_mant = 7'h07;
              case (mant_lo4)
                4'h1: begin out_sign = 1'b0; out_exp = 8'h81; out_mant = 7'h08; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h81; out_mant = 7'h09; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h81; out_mant = 7'h0b; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h81; out_mant = 7'h0c; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h81; out_mant = 7'h0d; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h81; out_mant = 7'h0e; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h81; out_mant = 7'h10; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h81; out_mant = 7'h11; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h81; out_mant = 7'h12; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h81; out_mant = 7'h14; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h81; out_mant = 7'h15; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h81; out_mant = 7'h16; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h81; out_mant = 7'h18; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h81; out_mant = 7'h19; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h81; out_mant = 7'h1a; end
                default: begin end
              endcase
            end
            3'h3: begin
              out_sign = 1'b0; out_exp = 8'h81; out_mant = 7'h1c;
              case (mant_lo4)
                4'h1: begin out_sign = 1'b0; out_exp = 8'h81; out_mant = 7'h1d; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h81; out_mant = 7'h1f; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h81; out_mant = 7'h20; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h81; out_mant = 7'h22; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h81; out_mant = 7'h23; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h81; out_mant = 7'h24; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h81; out_mant = 7'h26; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h81; out_mant = 7'h27; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h81; out_mant = 7'h29; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h81; out_mant = 7'h2a; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h81; out_mant = 7'h2c; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h81; out_mant = 7'h2e; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h81; out_mant = 7'h2f; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h81; out_mant = 7'h31; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h81; out_mant = 7'h32; end
                default: begin end
              endcase
            end
            3'h4: begin
              out_sign = 1'b0; out_exp = 8'h81; out_mant = 7'h34;
              case (mant_lo4)
                4'h1: begin out_sign = 1'b0; out_exp = 8'h81; out_mant = 7'h36; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h81; out_mant = 7'h37; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h81; out_mant = 7'h39; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h81; out_mant = 7'h3b; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h81; out_mant = 7'h3c; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h81; out_mant = 7'h3e; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h81; out_mant = 7'h40; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h81; out_mant = 7'h41; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h81; out_mant = 7'h43; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h81; out_mant = 7'h45; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h81; out_mant = 7'h47; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h81; out_mant = 7'h48; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h81; out_mant = 7'h4a; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h81; out_mant = 7'h4c; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h81; out_mant = 7'h4e; end
                default: begin end
              endcase
            end
            3'h5: begin
              out_sign = 1'b0; out_exp = 8'h81; out_mant = 7'h50;
              case (mant_lo4)
                4'h1: begin out_sign = 1'b0; out_exp = 8'h81; out_mant = 7'h52; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h81; out_mant = 7'h54; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h81; out_mant = 7'h55; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h81; out_mant = 7'h57; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h81; out_mant = 7'h59; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h81; out_mant = 7'h5b; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h81; out_mant = 7'h5d; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h81; out_mant = 7'h5f; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h81; out_mant = 7'h61; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h81; out_mant = 7'h63; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h81; out_mant = 7'h65; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h81; out_mant = 7'h67; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h81; out_mant = 7'h6a; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h81; out_mant = 7'h6c; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h81; out_mant = 7'h6e; end
                default: begin end
              endcase
            end
            3'h6: begin
              out_sign = 1'b0; out_exp = 8'h81; out_mant = 7'h70;
              case (mant_lo4)
                4'h1: begin out_sign = 1'b0; out_exp = 8'h81; out_mant = 7'h72; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h81; out_mant = 7'h74; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h81; out_mant = 7'h77; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h81; out_mant = 7'h79; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h81; out_mant = 7'h7b; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h81; out_mant = 7'h7d; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h82; out_mant = 7'h00; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h82; out_mant = 7'h01; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h82; out_mant = 7'h02; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h82; out_mant = 7'h03; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h82; out_mant = 7'h04; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h82; out_mant = 7'h06; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h82; out_mant = 7'h07; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h82; out_mant = 7'h08; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h82; out_mant = 7'h09; end
                default: begin end
              endcase
            end
            3'h7: begin
              out_sign = 1'b0; out_exp = 8'h82; out_mant = 7'h0b;
              case (mant_lo4)
                4'h1: begin out_sign = 1'b0; out_exp = 8'h82; out_mant = 7'h0c; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h82; out_mant = 7'h0d; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h82; out_mant = 7'h0e; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h82; out_mant = 7'h10; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h82; out_mant = 7'h11; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h82; out_mant = 7'h12; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h82; out_mant = 7'h14; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h82; out_mant = 7'h15; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h82; out_mant = 7'h16; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h82; out_mant = 7'h18; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h82; out_mant = 7'h19; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h82; out_mant = 7'h1a; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h82; out_mant = 7'h1c; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h82; out_mant = 7'h1d; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h82; out_mant = 7'h1f; end
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h07f: begin
          case (mant_hi3)
            3'h0: begin
              out_sign = 1'b0; out_exp = 8'h82; out_mant = 7'h20;
              case (mant_lo4)
                4'h1: begin out_sign = 1'b0; out_exp = 8'h82; out_mant = 7'h23; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h82; out_mant = 7'h26; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h82; out_mant = 7'h29; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h82; out_mant = 7'h2c; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h82; out_mant = 7'h2f; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h82; out_mant = 7'h32; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h82; out_mant = 7'h35; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h82; out_mant = 7'h39; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h82; out_mant = 7'h3c; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h82; out_mant = 7'h40; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h82; out_mant = 7'h43; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h82; out_mant = 7'h47; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h82; out_mant = 7'h4a; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h82; out_mant = 7'h4e; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h82; out_mant = 7'h52; end
                default: begin end
              endcase
            end
            3'h1: begin
              out_sign = 1'b0; out_exp = 8'h82; out_mant = 7'h55;
              case (mant_lo4)
                4'h1: begin out_sign = 1'b0; out_exp = 8'h82; out_mant = 7'h59; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h82; out_mant = 7'h5d; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h82; out_mant = 7'h61; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h82; out_mant = 7'h65; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h82; out_mant = 7'h69; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h82; out_mant = 7'h6e; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h82; out_mant = 7'h72; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h82; out_mant = 7'h76; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h82; out_mant = 7'h7b; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h82; out_mant = 7'h7f; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h83; out_mant = 7'h02; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h83; out_mant = 7'h04; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h83; out_mant = 7'h07; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h83; out_mant = 7'h09; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h83; out_mant = 7'h0c; end
                default: begin end
              endcase
            end
            3'h2: begin
              out_sign = 1'b0; out_exp = 8'h83; out_mant = 7'h0e;
              case (mant_lo4)
                4'h1: begin out_sign = 1'b0; out_exp = 8'h83; out_mant = 7'h11; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h83; out_mant = 7'h13; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h83; out_mant = 7'h16; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h83; out_mant = 7'h19; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h83; out_mant = 7'h1c; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h83; out_mant = 7'h1e; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h83; out_mant = 7'h21; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h83; out_mant = 7'h24; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h83; out_mant = 7'h27; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h83; out_mant = 7'h2a; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h83; out_mant = 7'h2d; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h83; out_mant = 7'h31; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h83; out_mant = 7'h34; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h83; out_mant = 7'h37; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h83; out_mant = 7'h3a; end
                default: begin end
              endcase
            end
            3'h3: begin
              out_sign = 1'b0; out_exp = 8'h83; out_mant = 7'h3e;
              case (mant_lo4)
                4'h1: begin out_sign = 1'b0; out_exp = 8'h83; out_mant = 7'h41; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h83; out_mant = 7'h45; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h83; out_mant = 7'h48; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h83; out_mant = 7'h4c; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h83; out_mant = 7'h50; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h83; out_mant = 7'h53; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h83; out_mant = 7'h57; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h83; out_mant = 7'h5b; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h83; out_mant = 7'h5f; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h83; out_mant = 7'h63; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h83; out_mant = 7'h67; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h83; out_mant = 7'h6b; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h83; out_mant = 7'h70; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h83; out_mant = 7'h74; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h83; out_mant = 7'h78; end
                default: begin end
              endcase
            end
            3'h4: begin
              out_sign = 1'b0; out_exp = 8'h83; out_mant = 7'h7d;
              case (mant_lo4)
                4'h1: begin out_sign = 1'b0; out_exp = 8'h84; out_mant = 7'h01; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h84; out_mant = 7'h03; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h84; out_mant = 7'h06; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h84; out_mant = 7'h08; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h84; out_mant = 7'h0a; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h84; out_mant = 7'h0d; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h84; out_mant = 7'h0f; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h84; out_mant = 7'h12; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h84; out_mant = 7'h15; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h84; out_mant = 7'h17; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h84; out_mant = 7'h1a; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h84; out_mant = 7'h1d; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h84; out_mant = 7'h20; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h84; out_mant = 7'h23; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h84; out_mant = 7'h26; end
                default: begin end
              endcase
            end
            3'h5: begin
              out_sign = 1'b0; out_exp = 8'h84; out_mant = 7'h29;
              case (mant_lo4)
                4'h1: begin out_sign = 1'b0; out_exp = 8'h84; out_mant = 7'h2c; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h84; out_mant = 7'h2f; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h84; out_mant = 7'h32; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h84; out_mant = 7'h35; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h84; out_mant = 7'h39; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h84; out_mant = 7'h3c; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h84; out_mant = 7'h3f; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h84; out_mant = 7'h43; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h84; out_mant = 7'h46; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h84; out_mant = 7'h4a; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h84; out_mant = 7'h4e; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h84; out_mant = 7'h51; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h84; out_mant = 7'h55; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h84; out_mant = 7'h59; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h84; out_mant = 7'h5d; end
                default: begin end
              endcase
            end
            3'h6: begin
              out_sign = 1'b0; out_exp = 8'h84; out_mant = 7'h61;
              case (mant_lo4)
                4'h1: begin out_sign = 1'b0; out_exp = 8'h84; out_mant = 7'h65; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h84; out_mant = 7'h69; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h84; out_mant = 7'h6d; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h84; out_mant = 7'h72; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h84; out_mant = 7'h76; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h84; out_mant = 7'h7b; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h84; out_mant = 7'h7f; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h85; out_mant = 7'h02; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h85; out_mant = 7'h04; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h85; out_mant = 7'h07; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h85; out_mant = 7'h09; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h85; out_mant = 7'h0c; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h85; out_mant = 7'h0e; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h85; out_mant = 7'h11; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h85; out_mant = 7'h13; end
                default: begin end
              endcase
            end
            3'h7: begin
              out_sign = 1'b0; out_exp = 8'h85; out_mant = 7'h16;
              case (mant_lo4)
                4'h1: begin out_sign = 1'b0; out_exp = 8'h85; out_mant = 7'h19; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h85; out_mant = 7'h1b; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h85; out_mant = 7'h1e; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h85; out_mant = 7'h21; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h85; out_mant = 7'h24; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h85; out_mant = 7'h27; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h85; out_mant = 7'h2a; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h85; out_mant = 7'h2d; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h85; out_mant = 7'h30; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h85; out_mant = 7'h34; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h85; out_mant = 7'h37; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h85; out_mant = 7'h3a; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h85; out_mant = 7'h3d; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h85; out_mant = 7'h41; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h85; out_mant = 7'h44; end
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h080: begin
          case (mant_hi3)
            3'h0: begin
              out_sign = 1'b0; out_exp = 8'h85; out_mant = 7'h48;
              case (mant_lo4)
                4'h1: begin out_sign = 1'b0; out_exp = 8'h85; out_mant = 7'h4f; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h85; out_mant = 7'h57; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h85; out_mant = 7'h5f; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h85; out_mant = 7'h67; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h85; out_mant = 7'h6f; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h85; out_mant = 7'h78; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h86; out_mant = 7'h01; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h86; out_mant = 7'h05; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h86; out_mant = 7'h0a; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h86; out_mant = 7'h0f; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h86; out_mant = 7'h15; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h86; out_mant = 7'h1a; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h86; out_mant = 7'h20; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h86; out_mant = 7'h25; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h86; out_mant = 7'h2c; end
                default: begin end
              endcase
            end
            3'h1: begin
              out_sign = 1'b0; out_exp = 8'h86; out_mant = 7'h32;
              case (mant_lo4)
                4'h1: begin out_sign = 1'b0; out_exp = 8'h86; out_mant = 7'h38; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h86; out_mant = 7'h3f; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h86; out_mant = 7'h46; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h86; out_mant = 7'h4d; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h86; out_mant = 7'h55; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h86; out_mant = 7'h5d; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h86; out_mant = 7'h65; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h86; out_mant = 7'h6d; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h86; out_mant = 7'h76; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h86; out_mant = 7'h7f; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h87; out_mant = 7'h04; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h87; out_mant = 7'h09; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h87; out_mant = 7'h0e; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h87; out_mant = 7'h13; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h87; out_mant = 7'h19; end
                default: begin end
              endcase
            end
            3'h2: begin
              out_sign = 1'b0; out_exp = 8'h87; out_mant = 7'h1e;
              case (mant_lo4)
                4'h1: begin out_sign = 1'b0; out_exp = 8'h87; out_mant = 7'h24; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h87; out_mant = 7'h2a; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h87; out_mant = 7'h30; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h87; out_mant = 7'h37; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h87; out_mant = 7'h3d; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h87; out_mant = 7'h44; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h87; out_mant = 7'h4b; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h87; out_mant = 7'h53; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h87; out_mant = 7'h5b; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h87; out_mant = 7'h63; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h87; out_mant = 7'h6b; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h87; out_mant = 7'h73; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h87; out_mant = 7'h7c; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h88; out_mant = 7'h03; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h88; out_mant = 7'h08; end
                default: begin end
              endcase
            end
            3'h3: begin
              out_sign = 1'b0; out_exp = 8'h88; out_mant = 7'h0d;
              case (mant_lo4)
                4'h1: begin out_sign = 1'b0; out_exp = 8'h88; out_mant = 7'h12; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h88; out_mant = 7'h17; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h88; out_mant = 7'h1d; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h88; out_mant = 7'h22; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h88; out_mant = 7'h28; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h88; out_mant = 7'h2e; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h88; out_mant = 7'h35; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h88; out_mant = 7'h3b; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h88; out_mant = 7'h42; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h88; out_mant = 7'h49; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h88; out_mant = 7'h51; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h88; out_mant = 7'h58; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h88; out_mant = 7'h60; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h88; out_mant = 7'h69; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h88; out_mant = 7'h71; end
                default: begin end
              endcase
            end
            3'h4: begin
              out_sign = 1'b0; out_exp = 8'h88; out_mant = 7'h7a;
              case (mant_lo4)
                4'h1: begin out_sign = 1'b0; out_exp = 8'h89; out_mant = 7'h02; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h89; out_mant = 7'h06; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h89; out_mant = 7'h0b; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h89; out_mant = 7'h10; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h89; out_mant = 7'h16; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h89; out_mant = 7'h1b; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h89; out_mant = 7'h21; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h89; out_mant = 7'h27; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h89; out_mant = 7'h2d; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h89; out_mant = 7'h33; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h89; out_mant = 7'h3a; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h89; out_mant = 7'h40; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h89; out_mant = 7'h48; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h89; out_mant = 7'h4f; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h89; out_mant = 7'h56; end
                default: begin end
              endcase
            end
            3'h5: begin
              out_sign = 1'b0; out_exp = 8'h89; out_mant = 7'h5e;
              case (mant_lo4)
                4'h1: begin out_sign = 1'b0; out_exp = 8'h89; out_mant = 7'h66; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h89; out_mant = 7'h6f; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h89; out_mant = 7'h78; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h8a; out_mant = 7'h00; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h8a; out_mant = 7'h05; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h8a; out_mant = 7'h0a; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h8a; out_mant = 7'h0f; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h8a; out_mant = 7'h14; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h8a; out_mant = 7'h1a; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h8a; out_mant = 7'h1f; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h8a; out_mant = 7'h25; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h8a; out_mant = 7'h2b; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h8a; out_mant = 7'h31; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h8a; out_mant = 7'h38; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h8a; out_mant = 7'h3f; end
                default: begin end
              endcase
            end
            3'h6: begin
              out_sign = 1'b0; out_exp = 8'h8a; out_mant = 7'h46;
              case (mant_lo4)
                4'h1: begin out_sign = 1'b0; out_exp = 8'h8a; out_mant = 7'h4d; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h8a; out_mant = 7'h54; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h8a; out_mant = 7'h5c; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h8a; out_mant = 7'h64; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h8a; out_mant = 7'h6d; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h8a; out_mant = 7'h75; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h8a; out_mant = 7'h7e; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h8b; out_mant = 7'h04; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h8b; out_mant = 7'h09; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h8b; out_mant = 7'h0e; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h8b; out_mant = 7'h13; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h8b; out_mant = 7'h18; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h8b; out_mant = 7'h1e; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h8b; out_mant = 7'h24; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h8b; out_mant = 7'h2a; end
                default: begin end
              endcase
            end
            3'h7: begin
              out_sign = 1'b0; out_exp = 8'h8b; out_mant = 7'h30;
              case (mant_lo4)
                4'h1: begin out_sign = 1'b0; out_exp = 8'h8b; out_mant = 7'h36; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h8b; out_mant = 7'h3d; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h8b; out_mant = 7'h44; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h8b; out_mant = 7'h4b; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h8b; out_mant = 7'h52; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h8b; out_mant = 7'h5a; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h8b; out_mant = 7'h62; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h8b; out_mant = 7'h6a; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h8b; out_mant = 7'h73; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h8b; out_mant = 7'h7c; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h8c; out_mant = 7'h03; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h8c; out_mant = 7'h07; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h8c; out_mant = 7'h0c; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h8c; out_mant = 7'h11; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h8c; out_mant = 7'h17; end
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h081: begin
          case (mant_hi3)
            3'h0: begin
              out_sign = 1'b0; out_exp = 8'h8c; out_mant = 7'h1c;
              case (mant_lo4)
                4'h1: begin out_sign = 1'b0; out_exp = 8'h8c; out_mant = 7'h28; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h8c; out_mant = 7'h34; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h8c; out_mant = 7'h42; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h8c; out_mant = 7'h50; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h8c; out_mant = 7'h60; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h8c; out_mant = 7'h71; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h8d; out_mant = 7'h01; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h8d; out_mant = 7'h0b; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h8d; out_mant = 7'h15; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h8d; out_mant = 7'h20; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h8d; out_mant = 7'h2c; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h8d; out_mant = 7'h39; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h8d; out_mant = 7'h47; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h8d; out_mant = 7'h56; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h8d; out_mant = 7'h66; end
                default: begin end
              endcase
            end
            3'h1: begin
              out_sign = 1'b0; out_exp = 8'h8d; out_mant = 7'h77;
              case (mant_lo4)
                4'h1: begin out_sign = 1'b0; out_exp = 8'h8e; out_mant = 7'h05; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h8e; out_mant = 7'h0f; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h8e; out_mant = 7'h19; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h8e; out_mant = 7'h25; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h8e; out_mant = 7'h31; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h8e; out_mant = 7'h3e; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h8e; out_mant = 7'h4c; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h8e; out_mant = 7'h5c; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h8e; out_mant = 7'h6c; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h8e; out_mant = 7'h7e; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h8f; out_mant = 7'h08; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h8f; out_mant = 7'h12; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h8f; out_mant = 7'h1d; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h8f; out_mant = 7'h29; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h8f; out_mant = 7'h36; end
                default: begin end
              endcase
            end
            3'h2: begin
              out_sign = 1'b0; out_exp = 8'h8f; out_mant = 7'h43;
              case (mant_lo4)
                4'h1: begin out_sign = 1'b0; out_exp = 8'h8f; out_mant = 7'h52; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h8f; out_mant = 7'h62; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h8f; out_mant = 7'h72; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h90; out_mant = 7'h02; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h90; out_mant = 7'h0c; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h90; out_mant = 7'h16; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h90; out_mant = 7'h22; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h90; out_mant = 7'h2e; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h90; out_mant = 7'h3b; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h90; out_mant = 7'h49; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h90; out_mant = 7'h58; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h90; out_mant = 7'h68; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h90; out_mant = 7'h79; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h91; out_mant = 7'h06; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h91; out_mant = 7'h10; end
                default: begin end
              endcase
            end
            3'h3: begin
              out_sign = 1'b0; out_exp = 8'h91; out_mant = 7'h1a;
              case (mant_lo4)
                4'h1: begin out_sign = 1'b0; out_exp = 8'h91; out_mant = 7'h26; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h91; out_mant = 7'h32; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h91; out_mant = 7'h40; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h91; out_mant = 7'h4e; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h91; out_mant = 7'h5d; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h91; out_mant = 7'h6e; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h92; out_mant = 7'h00; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h92; out_mant = 7'h09; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h92; out_mant = 7'h14; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h92; out_mant = 7'h1f; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h92; out_mant = 7'h2a; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h92; out_mant = 7'h37; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h92; out_mant = 7'h45; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h92; out_mant = 7'h53; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h92; out_mant = 7'h63; end
                default: begin end
              endcase
            end
            3'h4: begin
              out_sign = 1'b0; out_exp = 8'h92; out_mant = 7'h74;
              case (mant_lo4)
                4'h1: begin out_sign = 1'b0; out_exp = 8'h93; out_mant = 7'h03; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h93; out_mant = 7'h0d; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h93; out_mant = 7'h17; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h93; out_mant = 7'h23; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h93; out_mant = 7'h2f; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h93; out_mant = 7'h3c; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h93; out_mant = 7'h4a; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h93; out_mant = 7'h59; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h93; out_mant = 7'h69; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h93; out_mant = 7'h7b; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h94; out_mant = 7'h07; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h94; out_mant = 7'h11; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h94; out_mant = 7'h1c; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h94; out_mant = 7'h27; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h94; out_mant = 7'h34; end
                default: begin end
              endcase
            end
            3'h5: begin
              out_sign = 1'b0; out_exp = 8'h94; out_mant = 7'h41;
              case (mant_lo4)
                4'h1: begin out_sign = 1'b0; out_exp = 8'h94; out_mant = 7'h4f; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h94; out_mant = 7'h5f; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h94; out_mant = 7'h70; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h95; out_mant = 7'h01; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h95; out_mant = 7'h0a; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h95; out_mant = 7'h15; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h95; out_mant = 7'h20; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h95; out_mant = 7'h2c; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h95; out_mant = 7'h38; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h95; out_mant = 7'h46; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h95; out_mant = 7'h55; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h95; out_mant = 7'h65; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h95; out_mant = 7'h76; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h96; out_mant = 7'h04; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h96; out_mant = 7'h0e; end
                default: begin end
              endcase
            end
            3'h6: begin
              out_sign = 1'b0; out_exp = 8'h96; out_mant = 7'h19;
              case (mant_lo4)
                4'h1: begin out_sign = 1'b0; out_exp = 8'h96; out_mant = 7'h24; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h96; out_mant = 7'h30; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h96; out_mant = 7'h3d; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h96; out_mant = 7'h4b; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h96; out_mant = 7'h5b; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h96; out_mant = 7'h6b; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h96; out_mant = 7'h7d; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h97; out_mant = 7'h08; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h97; out_mant = 7'h12; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h97; out_mant = 7'h1d; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h97; out_mant = 7'h28; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h97; out_mant = 7'h35; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h97; out_mant = 7'h42; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h97; out_mant = 7'h51; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h97; out_mant = 7'h61; end
                default: begin end
              endcase
            end
            3'h7: begin
              out_sign = 1'b0; out_exp = 8'h97; out_mant = 7'h71;
              case (mant_lo4)
                4'h1: begin out_sign = 1'b0; out_exp = 8'h98; out_mant = 7'h02; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h98; out_mant = 7'h0b; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h98; out_mant = 7'h16; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h98; out_mant = 7'h21; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h98; out_mant = 7'h2d; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h98; out_mant = 7'h3a; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h98; out_mant = 7'h48; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h98; out_mant = 7'h57; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h98; out_mant = 7'h67; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h98; out_mant = 7'h78; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h99; out_mant = 7'h05; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h99; out_mant = 7'h0f; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h99; out_mant = 7'h1a; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h99; out_mant = 7'h25; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h99; out_mant = 7'h31; end
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h082: begin
          case (mant_hi3)
            3'h0: begin
              out_sign = 1'b0; out_exp = 8'h99; out_mant = 7'h3f;
              case (mant_lo4)
                4'h1: begin out_sign = 1'b0; out_exp = 8'h99; out_mant = 7'h5c; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h99; out_mant = 7'h7e; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h9a; out_mant = 7'h13; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h9a; out_mant = 7'h2a; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h9a; out_mant = 7'h44; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h9a; out_mant = 7'h62; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h9b; out_mant = 7'h03; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h9b; out_mant = 7'h17; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h9b; out_mant = 7'h2e; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h9b; out_mant = 7'h49; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h9b; out_mant = 7'h68; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h9c; out_mant = 7'h06; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h9c; out_mant = 7'h1b; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h9c; out_mant = 7'h33; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h9c; out_mant = 7'h4e; end
                default: begin end
              endcase
            end
            3'h1: begin
              out_sign = 1'b0; out_exp = 8'h9c; out_mant = 7'h6e;
              case (mant_lo4)
                4'h1: begin out_sign = 1'b0; out_exp = 8'h9d; out_mant = 7'h0a; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h9d; out_mant = 7'h1f; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h9d; out_mant = 7'h38; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h9d; out_mant = 7'h54; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h9d; out_mant = 7'h75; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h9e; out_mant = 7'h0d; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h9e; out_mant = 7'h23; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h9e; out_mant = 7'h3c; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h9e; out_mant = 7'h5a; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h9e; out_mant = 7'h7b; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h9f; out_mant = 7'h11; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h9f; out_mant = 7'h28; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h9f; out_mant = 7'h42; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h9f; out_mant = 7'h5f; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'ha0; out_mant = 7'h01; end
                default: begin end
              endcase
            end
            3'h2: begin
              out_sign = 1'b0; out_exp = 8'ha0; out_mant = 7'h15;
              case (mant_lo4)
                4'h1: begin out_sign = 1'b0; out_exp = 8'ha0; out_mant = 7'h2c; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'ha0; out_mant = 7'h47; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'ha0; out_mant = 7'h65; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'ha1; out_mant = 7'h04; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'ha1; out_mant = 7'h19; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'ha1; out_mant = 7'h31; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'ha1; out_mant = 7'h4c; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'ha1; out_mant = 7'h6c; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'ha2; out_mant = 7'h08; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'ha2; out_mant = 7'h1d; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'ha2; out_mant = 7'h35; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'ha2; out_mant = 7'h51; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'ha2; out_mant = 7'h72; end
                4'he: begin out_sign = 1'b0; out_exp = 8'ha3; out_mant = 7'h0c; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'ha3; out_mant = 7'h21; end
                default: begin end
              endcase
            end
            3'h3: begin
              out_sign = 1'b0; out_exp = 8'ha3; out_mant = 7'h3a;
              case (mant_lo4)
                4'h1: begin out_sign = 1'b0; out_exp = 8'ha3; out_mant = 7'h57; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'ha3; out_mant = 7'h78; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'ha4; out_mant = 7'h0f; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'ha4; out_mant = 7'h26; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'ha4; out_mant = 7'h3f; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'ha4; out_mant = 7'h5d; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'ha4; out_mant = 7'h7f; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'ha5; out_mant = 7'h13; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'ha5; out_mant = 7'h2a; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'ha5; out_mant = 7'h44; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'ha5; out_mant = 7'h63; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'ha6; out_mant = 7'h03; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'ha6; out_mant = 7'h17; end
                4'he: begin out_sign = 1'b0; out_exp = 8'ha6; out_mant = 7'h2f; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'ha6; out_mant = 7'h4a; end
                default: begin end
              endcase
            end
            3'h4: begin
              out_sign = 1'b0; out_exp = 8'ha6; out_mant = 7'h69;
              case (mant_lo4)
                4'h1: begin out_sign = 1'b0; out_exp = 8'ha7; out_mant = 7'h06; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'ha7; out_mant = 7'h1b; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'ha7; out_mant = 7'h33; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'ha7; out_mant = 7'h4f; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'ha7; out_mant = 7'h6f; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'ha8; out_mant = 7'h0a; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'ha8; out_mant = 7'h1f; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'ha8; out_mant = 7'h38; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'ha8; out_mant = 7'h55; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'ha8; out_mant = 7'h75; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'ha9; out_mant = 7'h0e; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'ha9; out_mant = 7'h24; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'ha9; out_mant = 7'h3d; end
                4'he: begin out_sign = 1'b0; out_exp = 8'ha9; out_mant = 7'h5a; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'ha9; out_mant = 7'h7c; end
                default: begin end
              endcase
            end
            3'h5: begin
              out_sign = 1'b0; out_exp = 8'haa; out_mant = 7'h12;
              case (mant_lo4)
                4'h1: begin out_sign = 1'b0; out_exp = 8'haa; out_mant = 7'h28; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'haa; out_mant = 7'h42; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'haa; out_mant = 7'h60; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'hab; out_mant = 7'h01; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'hab; out_mant = 7'h15; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'hab; out_mant = 7'h2d; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'hab; out_mant = 7'h47; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'hab; out_mant = 7'h66; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'hac; out_mant = 7'h05; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'hac; out_mant = 7'h19; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'hac; out_mant = 7'h31; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'hac; out_mant = 7'h4d; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'hac; out_mant = 7'h6c; end
                4'he: begin out_sign = 1'b0; out_exp = 8'had; out_mant = 7'h08; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'had; out_mant = 7'h1e; end
                default: begin end
              endcase
            end
            3'h6: begin
              out_sign = 1'b0; out_exp = 8'had; out_mant = 7'h36;
              case (mant_lo4)
                4'h1: begin out_sign = 1'b0; out_exp = 8'had; out_mant = 7'h52; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'had; out_mant = 7'h73; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'hae; out_mant = 7'h0c; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'hae; out_mant = 7'h22; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'hae; out_mant = 7'h3b; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'hae; out_mant = 7'h58; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'hae; out_mant = 7'h79; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'haf; out_mant = 7'h10; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'haf; out_mant = 7'h26; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'haf; out_mant = 7'h40; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'haf; out_mant = 7'h5d; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'hb0; out_mant = 7'h00; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'hb0; out_mant = 7'h14; end
                4'he: begin out_sign = 1'b0; out_exp = 8'hb0; out_mant = 7'h2b; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'hb0; out_mant = 7'h45; end
                default: begin end
              endcase
            end
            3'h7: begin
              out_sign = 1'b0; out_exp = 8'hb0; out_mant = 7'h63;
              case (mant_lo4)
                4'h1: begin out_sign = 1'b0; out_exp = 8'hb1; out_mant = 7'h03; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'hb1; out_mant = 7'h18; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'hb1; out_mant = 7'h2f; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'hb1; out_mant = 7'h4a; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'hb1; out_mant = 7'h69; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'hb2; out_mant = 7'h07; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'hb2; out_mant = 7'h1c; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'hb2; out_mant = 7'h34; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'hb2; out_mant = 7'h50; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'hb2; out_mant = 7'h70; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'hb3; out_mant = 7'h0a; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'hb3; out_mant = 7'h20; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'hb3; out_mant = 7'h39; end
                4'he: begin out_sign = 1'b0; out_exp = 8'hb3; out_mant = 7'h55; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'hb3; out_mant = 7'h76; end
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h083: begin
          case (mant_hi3)
            3'h0: begin
              out_sign = 1'b0; out_exp = 8'hb4; out_mant = 7'h0e;
              case (mant_lo4)
                4'h1: begin out_sign = 1'b0; out_exp = 8'hb4; out_mant = 7'h3e; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'hb4; out_mant = 7'h7d; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'hb5; out_mant = 7'h28; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'hb5; out_mant = 7'h61; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'hb6; out_mant = 7'h16; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'hb6; out_mant = 7'h48; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'hb7; out_mant = 7'h05; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'hb7; out_mant = 7'h32; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'hb7; out_mant = 7'h6d; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'hb8; out_mant = 7'h1e; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'hb8; out_mant = 7'h53; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'hb9; out_mant = 7'h0c; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'hb9; out_mant = 7'h3b; end
                4'he: begin out_sign = 1'b0; out_exp = 8'hb9; out_mant = 7'h7a; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'hba; out_mant = 7'h27; end
                default: begin end
              endcase
            end
            3'h1: begin
              out_sign = 1'b0; out_exp = 8'hba; out_mant = 7'h5e;
              case (mant_lo4)
                4'h1: begin out_sign = 1'b0; out_exp = 8'hbb; out_mant = 7'h14; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'hbb; out_mant = 7'h45; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'hbc; out_mant = 7'h04; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'hbc; out_mant = 7'h30; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'hbc; out_mant = 7'h6a; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'hbd; out_mant = 7'h1c; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'hbd; out_mant = 7'h50; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'hbe; out_mant = 7'h0b; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'hbe; out_mant = 7'h39; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'hbe; out_mant = 7'h77; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'hbf; out_mant = 7'h25; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'hbf; out_mant = 7'h5b; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'hc0; out_mant = 7'h12; end
                4'he: begin out_sign = 1'b0; out_exp = 8'hc0; out_mant = 7'h43; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'hc1; out_mant = 7'h02; end
                default: begin end
              endcase
            end
            3'h2: begin
              out_sign = 1'b0; out_exp = 8'hc1; out_mant = 7'h2d;
              case (mant_lo4)
                4'h1: begin out_sign = 1'b0; out_exp = 8'hc1; out_mant = 7'h67; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'hc2; out_mant = 7'h1a; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'hc2; out_mant = 7'h4e; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'hc3; out_mant = 7'h09; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'hc3; out_mant = 7'h37; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'hc3; out_mant = 7'h74; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'hc4; out_mant = 7'h23; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'hc4; out_mant = 7'h59; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'hc5; out_mant = 7'h11; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'hc5; out_mant = 7'h41; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'hc6; out_mant = 7'h01; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'hc6; out_mant = 7'h2b; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'hc6; out_mant = 7'h65; end
                4'he: begin out_sign = 1'b0; out_exp = 8'hc7; out_mant = 7'h18; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'hc7; out_mant = 7'h4b; end
                default: begin end
              endcase
            end
            3'h3: begin
              out_sign = 1'b0; out_exp = 8'hc8; out_mant = 7'h08;
              case (mant_lo4)
                4'h1: begin out_sign = 1'b0; out_exp = 8'hc8; out_mant = 7'h35; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'hc8; out_mant = 7'h71; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'hc9; out_mant = 7'h21; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'hc9; out_mant = 7'h56; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'hca; out_mant = 7'h0f; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'hca; out_mant = 7'h3f; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'hca; out_mant = 7'h7e; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'hcb; out_mant = 7'h29; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'hcb; out_mant = 7'h62; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'hcc; out_mant = 7'h17; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'hcc; out_mant = 7'h49; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'hcd; out_mant = 7'h06; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'hcd; out_mant = 7'h33; end
                4'he: begin out_sign = 1'b0; out_exp = 8'hcd; out_mant = 7'h6e; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'hce; out_mant = 7'h1f; end
                default: begin end
              endcase
            end
            3'h4: begin
              out_sign = 1'b0; out_exp = 8'hce; out_mant = 7'h54;
              case (mant_lo4)
                4'h1: begin out_sign = 1'b0; out_exp = 8'hcf; out_mant = 7'h0d; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'hcf; out_mant = 7'h3c; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'hcf; out_mant = 7'h7b; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'hd0; out_mant = 7'h27; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'hd0; out_mant = 7'h5f; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'hd1; out_mant = 7'h15; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'hd1; out_mant = 7'h46; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'hd2; out_mant = 7'h04; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'hd2; out_mant = 7'h30; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'hd2; out_mant = 7'h6b; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'hd3; out_mant = 7'h1d; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'hd3; out_mant = 7'h51; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'hd4; out_mant = 7'h0c; end
                4'he: begin out_sign = 1'b0; out_exp = 8'hd4; out_mant = 7'h3a; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'hd4; out_mant = 7'h78; end
                default: begin end
              endcase
            end
            3'h5: begin
              out_sign = 1'b0; out_exp = 8'hd5; out_mant = 7'h25;
              case (mant_lo4)
                4'h1: begin out_sign = 1'b0; out_exp = 8'hd5; out_mant = 7'h5d; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'hd6; out_mant = 7'h13; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'hd6; out_mant = 7'h44; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'hd7; out_mant = 7'h03; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'hd7; out_mant = 7'h2e; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'hd7; out_mant = 7'h69; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'hd8; out_mant = 7'h1b; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'hd8; out_mant = 7'h4f; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'hd9; out_mant = 7'h0a; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'hd9; out_mant = 7'h38; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'hd9; out_mant = 7'h75; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'hda; out_mant = 7'h23; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'hda; out_mant = 7'h5a; end
                4'he: begin out_sign = 1'b0; out_exp = 8'hdb; out_mant = 7'h11; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'hdb; out_mant = 7'h42; end
                default: begin end
              endcase
            end
            3'h6: begin
              out_sign = 1'b0; out_exp = 8'hdc; out_mant = 7'h01;
              case (mant_lo4)
                4'h1: begin out_sign = 1'b0; out_exp = 8'hdc; out_mant = 7'h2c; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'hdc; out_mant = 7'h66; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'hdd; out_mant = 7'h19; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'hdd; out_mant = 7'h4c; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'hde; out_mant = 7'h08; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'hde; out_mant = 7'h36; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'hde; out_mant = 7'h72; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'hdf; out_mant = 7'h22; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'hdf; out_mant = 7'h57; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'he0; out_mant = 7'h10; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'he0; out_mant = 7'h40; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'he0; out_mant = 7'h7f; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'he1; out_mant = 7'h2a; end
                4'he: begin out_sign = 1'b0; out_exp = 8'he1; out_mant = 7'h63; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'he2; out_mant = 7'h17; end
                default: begin end
              endcase
            end
            3'h7: begin
              out_sign = 1'b0; out_exp = 8'he2; out_mant = 7'h4a;
              case (mant_lo4)
                4'h1: begin out_sign = 1'b0; out_exp = 8'he3; out_mant = 7'h07; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'he3; out_mant = 7'h34; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'he3; out_mant = 7'h6f; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'he4; out_mant = 7'h20; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'he4; out_mant = 7'h55; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'he5; out_mant = 7'h0e; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'he5; out_mant = 7'h3d; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'he5; out_mant = 7'h7c; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'he6; out_mant = 7'h28; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'he6; out_mant = 7'h60; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'he7; out_mant = 7'h16; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'he7; out_mant = 7'h48; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'he8; out_mant = 7'h05; end
                4'he: begin out_sign = 1'b0; out_exp = 8'he8; out_mant = 7'h31; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'he8; out_mant = 7'h6d; end
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h084: begin
          case (mant_hi3)
            3'h0: begin
              out_sign = 1'b0; out_exp = 8'he9; out_mant = 7'h1e;
              case (mant_lo4)
                4'h1: begin out_sign = 1'b0; out_exp = 8'hea; out_mant = 7'h0c; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'hea; out_mant = 7'h79; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'heb; out_mant = 7'h5e; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'hec; out_mant = 7'h45; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'hed; out_mant = 7'h2f; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'hee; out_mant = 7'h1c; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'hef; out_mant = 7'h0b; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'hef; out_mant = 7'h77; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'hf0; out_mant = 7'h5b; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'hf1; out_mant = 7'h43; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'hf2; out_mant = 7'h2d; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'hf3; out_mant = 7'h1a; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'hf4; out_mant = 7'h09; end
                4'he: begin out_sign = 1'b0; out_exp = 8'hf4; out_mant = 7'h74; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'hf5; out_mant = 7'h59; end
                default: begin end
              endcase
            end
            3'h1: begin
              out_sign = 1'b0; out_exp = 8'hff; out_mant = 7'h00;
              case (mant_lo4)
                4'h0: begin out_sign = 1'b0; out_exp = 8'hf6; out_mant = 7'h41; end
                4'h1: begin out_sign = 1'b0; out_exp = 8'hf7; out_mant = 7'h2b; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'hf8; out_mant = 7'h18; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'hf9; out_mant = 7'h07; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'hf9; out_mant = 7'h71; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'hfa; out_mant = 7'h56; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'hfb; out_mant = 7'h3e; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'hfc; out_mant = 7'h29; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'hfd; out_mant = 7'h16; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'hfe; out_mant = 7'h06; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'hfe; out_mant = 7'h6e; end
                default: begin end
              endcase
            end
            3'h2: begin
              out_sign = 1'b0; out_exp = 8'hff; out_mant = 7'h00;
            end
            3'h3: begin
              out_sign = 1'b0; out_exp = 8'hff; out_mant = 7'h00;
            end
            3'h4: begin
              out_sign = 1'b0; out_exp = 8'hff; out_mant = 7'h00;
            end
            3'h5: begin
              out_sign = 1'b0; out_exp = 8'hff; out_mant = 7'h00;
            end
            3'h6: begin
              out_sign = 1'b0; out_exp = 8'hff; out_mant = 7'h00;
            end
            3'h7: begin
              out_sign = 1'b0; out_exp = 8'hff; out_mant = 7'h00;
            end
            default: begin end
          endcase
        end
        9'h0ff: begin
          case (mant_hi3)
            3'h0: begin
              out_sign = 1'b0; out_exp = 8'hff; out_mant = 7'h40;
              case (mant_lo4)
                4'h0: begin out_sign = 1'b0; out_exp = 8'hff; out_mant = 7'h00; end
                default: begin end
              endcase
            end
            3'h1: begin
              out_sign = 1'b0; out_exp = 8'hff; out_mant = 7'h40;
            end
            3'h2: begin
              out_sign = 1'b0; out_exp = 8'hff; out_mant = 7'h40;
            end
            3'h3: begin
              out_sign = 1'b0; out_exp = 8'hff; out_mant = 7'h40;
            end
            3'h4: begin
              out_sign = 1'b0; out_exp = 8'hff; out_mant = 7'h40;
            end
            3'h5: begin
              out_sign = 1'b0; out_exp = 8'hff; out_mant = 7'h40;
            end
            3'h6: begin
              out_sign = 1'b0; out_exp = 8'hff; out_mant = 7'h40;
            end
            3'h7: begin
              out_sign = 1'b0; out_exp = 8'hff; out_mant = 7'h40;
            end
            default: begin end
          endcase
        end
        9'h174: begin
          case (mant_hi3)
            3'h0: begin
              out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h00;
            end
            3'h1: begin
              out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h00;
            end
            3'h2: begin
              out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h00;
            end
            3'h3: begin
              out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h00;
            end
            3'h4: begin
              out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h00;
            end
            3'h5: begin
              out_sign = 1'b0; out_exp = 8'h7f; out_mant = 7'h00;
              case (mant_lo4)
                4'hf: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h7f; end
                default: begin end
              endcase
            end
            3'h6: begin
              out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h7f;
            end
            3'h7: begin
              out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h7f;
            end
            default: begin end
          endcase
        end
        9'h176: begin
          case (mant_hi3)
            3'h0: begin
              out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h7f;
            end
            3'h1: begin
              out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h7f;
            end
            3'h2: begin
              out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h7f;
              case (mant_lo4)
                4'h8: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h7e; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h7e; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h7e; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h7e; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h7e; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h7e; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h7e; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h7e; end
                default: begin end
              endcase
            end
            3'h3: begin
              out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h7e;
            end
            3'h4: begin
              out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h7e;
            end
            3'h5: begin
              out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h7e;
            end
            3'h6: begin
              out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h7e;
            end
            3'h7: begin
              out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h7e;
            end
            default: begin end
          endcase
        end
        9'h177: begin
          case (mant_hi3)
            3'h0: begin
              out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h7e;
              case (mant_lo4)
                4'hc: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h7d; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h7d; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h7d; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h7d; end
                default: begin end
              endcase
            end
            3'h1: begin
              out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h7d;
            end
            3'h2: begin
              out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h7d;
            end
            3'h3: begin
              out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h7d;
            end
            3'h4: begin
              out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h7c;
              case (mant_lo4)
                4'h0: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h7d; end
                4'h1: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h7d; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h7d; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h7d; end
                default: begin end
              endcase
            end
            3'h5: begin
              out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h7c;
            end
            3'h6: begin
              out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h7c;
            end
            3'h7: begin
              out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h7c;
              case (mant_lo4)
                4'hd: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h7b; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h7b; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h7b; end
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h178: begin
          case (mant_hi3)
            3'h0: begin
              out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h7b;
            end
            3'h1: begin
              out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h7b;
              case (mant_lo4)
                4'hb: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h7a; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h7a; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h7a; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h7a; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h7a; end
                default: begin end
              endcase
            end
            3'h2: begin
              out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h7a;
            end
            3'h3: begin
              out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h79;
              case (mant_lo4)
                4'h0: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h7a; end
                4'h1: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h7a; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h7a; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h7a; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h7a; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h7a; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h7a; end
                default: begin end
              endcase
            end
            3'h4: begin
              out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h79;
            end
            3'h5: begin
              out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h78;
              case (mant_lo4)
                4'h0: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h79; end
                4'h1: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h79; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h79; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h79; end
                default: begin end
              endcase
            end
            3'h6: begin
              out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h78;
            end
            3'h7: begin
              out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h77;
              case (mant_lo4)
                4'h0: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h78; end
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h179: begin
          case (mant_hi3)
            3'h0: begin
              out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h76;
              case (mant_lo4)
                4'h0: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h77; end
                4'h1: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h77; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h77; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h77; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h77; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h77; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h77; end
                default: begin end
              endcase
            end
            3'h1: begin
              out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h75;
              case (mant_lo4)
                4'h0: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h76; end
                4'h1: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h76; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h76; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h76; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h76; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h76; end
                default: begin end
              endcase
            end
            3'h2: begin
              out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h74;
              case (mant_lo4)
                4'h0: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h75; end
                4'h1: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h75; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h75; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h75; end
                default: begin end
              endcase
            end
            3'h3: begin
              out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h73;
              case (mant_lo4)
                4'h0: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h74; end
                4'h1: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h74; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h74; end
                default: begin end
              endcase
            end
            3'h4: begin
              out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h72;
              case (mant_lo4)
                4'h0: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h73; end
                default: begin end
              endcase
            end
            3'h5: begin
              out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h71;
              case (mant_lo4)
                4'hf: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h70; end
                default: begin end
              endcase
            end
            3'h6: begin
              out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h70;
              case (mant_lo4)
                4'he: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h6f; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h6f; end
                default: begin end
              endcase
            end
            3'h7: begin
              out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h6f;
              case (mant_lo4)
                4'hc: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h6e; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h6e; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h6e; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h6e; end
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h17a: begin
          case (mant_hi3)
            3'h0: begin
              out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h6d;
              case (mant_lo4)
                4'h0: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h6e; end
                4'h1: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h6e; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h6e; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h6e; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h6e; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h6e; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h6c; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h6c; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h6c; end
                default: begin end
              endcase
            end
            3'h1: begin
              out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h6b;
              case (mant_lo4)
                4'h0: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h6c; end
                4'h1: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h6c; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h6c; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h6c; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h6c; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h6a; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h6a; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h6a; end
                default: begin end
              endcase
            end
            3'h2: begin
              out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h69;
              case (mant_lo4)
                4'h0: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h6a; end
                4'h1: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h6a; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h6a; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h6a; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h68; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h68; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h68; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h68; end
                default: begin end
              endcase
            end
            3'h3: begin
              out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h67;
              case (mant_lo4)
                4'h0: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h68; end
                4'h1: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h68; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h68; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h66; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h66; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h66; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h66; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h66; end
                default: begin end
              endcase
            end
            3'h4: begin
              out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h65;
              case (mant_lo4)
                4'h0: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h66; end
                4'h1: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h66; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h66; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h64; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h64; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h64; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h64; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h64; end
                default: begin end
              endcase
            end
            3'h5: begin
              out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h63;
              case (mant_lo4)
                4'h0: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h64; end
                4'h1: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h64; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h62; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h62; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h62; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h62; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h62; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h62; end
                default: begin end
              endcase
            end
            3'h6: begin
              out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h61;
              case (mant_lo4)
                4'h0: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h62; end
                4'h1: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h62; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h60; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h60; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h60; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h60; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h60; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h60; end
                default: begin end
              endcase
            end
            3'h7: begin
              out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h5f;
              case (mant_lo4)
                4'h0: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h60; end
                4'h1: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h60; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h5e; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h5e; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h5e; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h5e; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h5e; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h5e; end
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h17b: begin
          case (mant_hi3)
            3'h0: begin
              out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h5d;
              case (mant_lo4)
                4'h0: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h5e; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h5c; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h5c; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h5c; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h5c; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h5b; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h5b; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h5b; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h5b; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h5a; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h5a; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h5a; end
                default: begin end
              endcase
            end
            3'h1: begin
              out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h59;
              case (mant_lo4)
                4'h0: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h5a; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h58; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h58; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h58; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h58; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h57; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h57; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h57; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h57; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h56; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h56; end
                default: begin end
              endcase
            end
            3'h2: begin
              out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h53;
              case (mant_lo4)
                4'h0: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h56; end
                4'h1: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h56; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h55; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h55; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h55; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h55; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h54; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h54; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h54; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h54; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h52; end
                default: begin end
              endcase
            end
            3'h3: begin
              out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h4f;
              case (mant_lo4)
                4'h0: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h52; end
                4'h1: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h52; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h52; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h51; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h51; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h51; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h51; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h50; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h50; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h50; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h50; end
                default: begin end
              endcase
            end
            3'h4: begin
              out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h4c;
              case (mant_lo4)
                4'h0: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h4e; end
                4'h1: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h4e; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h4e; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h4e; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h4d; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h4d; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h4d; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h4d; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h4b; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h4b; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h4b; end
                default: begin end
              endcase
            end
            3'h5: begin
              out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h49;
              case (mant_lo4)
                4'h0: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h4b; end
                4'h1: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h4a; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h4a; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h4a; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h4a; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h48; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h48; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h48; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h48; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h47; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h47; end
                default: begin end
              endcase
            end
            3'h6: begin
              out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h45;
              case (mant_lo4)
                4'h0: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h47; end
                4'h1: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h47; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h47; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h46; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h46; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h46; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h46; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h44; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h44; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h44; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h44; end
                default: begin end
              endcase
            end
            3'h7: begin
              out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h43;
              case (mant_lo4)
                4'h5: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h42; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h42; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h42; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h42; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h41; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h41; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h41; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h41; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h41; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h40; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h40; end
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h17c: begin
          case (mant_hi3)
            3'h0: begin
              out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h3d;
              case (mant_lo4)
                4'h0: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h40; end
                4'h1: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h40; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h3f; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h3f; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h3e; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h3e; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h3c; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h3c; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h3b; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h3b; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h3a; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h3a; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h3a; end
                default: begin end
              endcase
            end
            3'h1: begin
              out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h38;
              case (mant_lo4)
                4'h0: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h39; end
                4'h1: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h39; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h37; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h37; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h36; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h36; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h35; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h35; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h35; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h34; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h34; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h33; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h33; end
                default: begin end
              endcase
            end
            3'h2: begin
              out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h31;
              case (mant_lo4)
                4'h0: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h33; end
                4'h1: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h32; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h32; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h30; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h30; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h2f; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h2f; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h2f; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h2e; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h2e; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h2d; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h2d; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h2d; end
                default: begin end
              endcase
            end
            3'h3: begin
              out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h2c;
              case (mant_lo4)
                4'h3: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h2b; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h2b; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h2a; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h2a; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h2a; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h29; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h29; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h28; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h28; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h28; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h27; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h27; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h27; end
                default: begin end
              endcase
            end
            3'h4: begin
              out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h25;
              case (mant_lo4)
                4'h0: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h26; end
                4'h1: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h26; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h24; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h24; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h24; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h23; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h23; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h23; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h22; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h22; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h21; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h21; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h21; end
                default: begin end
              endcase
            end
            3'h5: begin
              out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h20;
              case (mant_lo4)
                4'h3: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h1f; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h1f; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h1f; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h1e; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h1e; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h1e; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h1d; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h1d; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h1c; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h1c; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h1c; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h1b; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h1b; end
                default: begin end
              endcase
            end
            3'h6: begin
              out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h1a;
              case (mant_lo4)
                4'h0: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h1b; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h19; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h19; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h19; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h18; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h18; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h18; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h17; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h17; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h17; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h16; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h16; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h16; end
                default: begin end
              endcase
            end
            3'h7: begin
              out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h15;
              case (mant_lo4)
                4'h3: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h14; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h14; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h14; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h13; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h13; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h13; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h12; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h12; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h12; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h11; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h11; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h11; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h10; end
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h17d: begin
          case (mant_hi3)
            3'h0: begin
              out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h0f;
              case (mant_lo4)
                4'h0: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h10; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h0e; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h0d; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h0d; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h0c; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h0b; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h0b; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h0a; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h0a; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h09; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h08; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h08; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h07; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h07; end
                default: begin end
              endcase
            end
            3'h1: begin
              out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h05;
              case (mant_lo4)
                4'h0: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h06; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h04; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h04; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h03; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h02; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h02; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h01; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h01; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h7e; out_mant = 7'h00; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h7f; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h7e; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h7d; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h7c; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h7a; end
                default: begin end
              endcase
            end
            3'h2: begin
              out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h79;
              case (mant_lo4)
                4'h1: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h78; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h77; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h76; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h75; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h74; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h73; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h72; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h71; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h6f; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h6e; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h6d; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h6c; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h6b; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h6a; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h69; end
                default: begin end
              endcase
            end
            3'h3: begin
              out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h68;
              case (mant_lo4)
                4'h1: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h67; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h66; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h65; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h64; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h63; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h62; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h61; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h60; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h5f; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h5e; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h5d; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h5c; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h5b; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h5a; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h59; end
                default: begin end
              endcase
            end
            3'h4: begin
              out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h4d;
              case (mant_lo4)
                4'h0: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h58; end
                4'h1: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h57; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h56; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h55; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h54; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h53; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h52; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h51; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h50; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h4f; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h4e; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h4c; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h4b; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h4a; end
                default: begin end
              endcase
            end
            3'h5: begin
              out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h44;
              case (mant_lo4)
                4'h0: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h49; end
                4'h1: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h48; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h47; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h46; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h45; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h43; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h42; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h41; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h40; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h3f; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h3e; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h3e; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h3d; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h3c; end
                default: begin end
              endcase
            end
            3'h6: begin
              out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h38;
              case (mant_lo4)
                4'h0: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h3b; end
                4'h1: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h3a; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h39; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h37; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h36; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h35; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h34; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h34; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h33; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h32; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h31; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h30; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h30; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h2f; end
                default: begin end
              endcase
            end
            3'h7: begin
              out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h2c;
              case (mant_lo4)
                4'h0: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h2e; end
                4'h1: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h2d; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h2b; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h2a; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h29; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h29; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h28; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h27; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h26; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h26; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h25; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h24; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h23; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h23; end
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h17e: begin
          case (mant_hi3)
            3'h0: begin
              out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h22;
              case (mant_lo4)
                4'h1: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h20; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h1f; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h1e; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h1c; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h1b; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h19; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h18; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h17; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h15; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h14; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h13; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h11; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h10; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h0f; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h0d; end
                default: begin end
              endcase
            end
            3'h1: begin
              out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h0c;
              case (mant_lo4)
                4'h1: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h0b; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h0a; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h08; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h07; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h06; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h05; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h04; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h02; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h01; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h7d; out_mant = 7'h00; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h7c; out_mant = 7'h7e; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h7c; out_mant = 7'h7c; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h7c; out_mant = 7'h79; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h7c; out_mant = 7'h77; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h7c; out_mant = 7'h75; end
                default: begin end
              endcase
            end
            3'h2: begin
              out_sign = 1'b0; out_exp = 8'h7c; out_mant = 7'h73;
              case (mant_lo4)
                4'h1: begin out_sign = 1'b0; out_exp = 8'h7c; out_mant = 7'h71; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h7c; out_mant = 7'h6e; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h7c; out_mant = 7'h6c; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h7c; out_mant = 7'h6a; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h7c; out_mant = 7'h68; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h7c; out_mant = 7'h66; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h7c; out_mant = 7'h64; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h7c; out_mant = 7'h62; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h7c; out_mant = 7'h60; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h7c; out_mant = 7'h5e; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h7c; out_mant = 7'h5c; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h7c; out_mant = 7'h5a; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h7c; out_mant = 7'h58; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h7c; out_mant = 7'h56; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h7c; out_mant = 7'h54; end
                default: begin end
              endcase
            end
            3'h3: begin
              out_sign = 1'b0; out_exp = 8'h7c; out_mant = 7'h52;
              case (mant_lo4)
                4'h1: begin out_sign = 1'b0; out_exp = 8'h7c; out_mant = 7'h50; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h7c; out_mant = 7'h4f; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h7c; out_mant = 7'h4d; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h7c; out_mant = 7'h4b; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h7c; out_mant = 7'h49; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h7c; out_mant = 7'h47; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h7c; out_mant = 7'h45; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h7c; out_mant = 7'h44; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h7c; out_mant = 7'h42; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h7c; out_mant = 7'h40; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h7c; out_mant = 7'h3e; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h7c; out_mant = 7'h3d; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h7c; out_mant = 7'h3b; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h7c; out_mant = 7'h39; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h7c; out_mant = 7'h38; end
                default: begin end
              endcase
            end
            3'h4: begin
              out_sign = 1'b0; out_exp = 8'h7c; out_mant = 7'h36;
              case (mant_lo4)
                4'h1: begin out_sign = 1'b0; out_exp = 8'h7c; out_mant = 7'h34; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h7c; out_mant = 7'h33; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h7c; out_mant = 7'h31; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h7c; out_mant = 7'h30; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h7c; out_mant = 7'h2e; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h7c; out_mant = 7'h2d; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h7c; out_mant = 7'h2b; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h7c; out_mant = 7'h29; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h7c; out_mant = 7'h28; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h7c; out_mant = 7'h26; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h7c; out_mant = 7'h25; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h7c; out_mant = 7'h23; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h7c; out_mant = 7'h22; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h7c; out_mant = 7'h21; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h7c; out_mant = 7'h1f; end
                default: begin end
              endcase
            end
            3'h5: begin
              out_sign = 1'b0; out_exp = 8'h7c; out_mant = 7'h1e;
              case (mant_lo4)
                4'h1: begin out_sign = 1'b0; out_exp = 8'h7c; out_mant = 7'h1c; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h7c; out_mant = 7'h1b; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h7c; out_mant = 7'h19; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h7c; out_mant = 7'h18; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h7c; out_mant = 7'h17; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h7c; out_mant = 7'h15; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h7c; out_mant = 7'h14; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h7c; out_mant = 7'h13; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h7c; out_mant = 7'h11; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h7c; out_mant = 7'h10; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h7c; out_mant = 7'h0f; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h7c; out_mant = 7'h0e; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h7c; out_mant = 7'h0c; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h7c; out_mant = 7'h0b; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h7c; out_mant = 7'h0a; end
                default: begin end
              endcase
            end
            3'h6: begin
              out_sign = 1'b0; out_exp = 8'h7c; out_mant = 7'h09;
              case (mant_lo4)
                4'h1: begin out_sign = 1'b0; out_exp = 8'h7c; out_mant = 7'h07; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h7c; out_mant = 7'h06; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h7c; out_mant = 7'h05; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h7c; out_mant = 7'h04; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h7c; out_mant = 7'h03; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h7c; out_mant = 7'h01; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h7c; out_mant = 7'h00; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h7b; out_mant = 7'h7e; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h7b; out_mant = 7'h7c; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h7b; out_mant = 7'h7a; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h7b; out_mant = 7'h77; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h7b; out_mant = 7'h75; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h7b; out_mant = 7'h73; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h7b; out_mant = 7'h71; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h7b; out_mant = 7'h6f; end
                default: begin end
              endcase
            end
            3'h7: begin
              out_sign = 1'b0; out_exp = 8'h7b; out_mant = 7'h6c;
              case (mant_lo4)
                4'h1: begin out_sign = 1'b0; out_exp = 8'h7b; out_mant = 7'h6a; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h7b; out_mant = 7'h68; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h7b; out_mant = 7'h66; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h7b; out_mant = 7'h64; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h7b; out_mant = 7'h62; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h7b; out_mant = 7'h60; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h7b; out_mant = 7'h5e; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h7b; out_mant = 7'h5c; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h7b; out_mant = 7'h5a; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h7b; out_mant = 7'h58; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h7b; out_mant = 7'h56; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h7b; out_mant = 7'h54; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h7b; out_mant = 7'h52; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h7b; out_mant = 7'h51; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h7b; out_mant = 7'h4f; end
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h17f: begin
          case (mant_hi3)
            3'h0: begin
              out_sign = 1'b0; out_exp = 8'h7b; out_mant = 7'h4d;
              case (mant_lo4)
                4'h1: begin out_sign = 1'b0; out_exp = 8'h7b; out_mant = 7'h49; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h7b; out_mant = 7'h46; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h7b; out_mant = 7'h42; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h7b; out_mant = 7'h3f; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h7b; out_mant = 7'h3b; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h7b; out_mant = 7'h38; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h7b; out_mant = 7'h35; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h7b; out_mant = 7'h31; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h7b; out_mant = 7'h2e; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h7b; out_mant = 7'h2b; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h7b; out_mant = 7'h28; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h7b; out_mant = 7'h25; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h7b; out_mant = 7'h22; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h7b; out_mant = 7'h1f; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h7b; out_mant = 7'h1c; end
                default: begin end
              endcase
            end
            3'h1: begin
              out_sign = 1'b0; out_exp = 8'h7b; out_mant = 7'h1a;
              case (mant_lo4)
                4'h1: begin out_sign = 1'b0; out_exp = 8'h7b; out_mant = 7'h17; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h7b; out_mant = 7'h14; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h7b; out_mant = 7'h12; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h7b; out_mant = 7'h0f; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h7b; out_mant = 7'h0c; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h7b; out_mant = 7'h0a; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h7b; out_mant = 7'h07; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h7b; out_mant = 7'h05; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h7b; out_mant = 7'h03; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h7b; out_mant = 7'h00; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h7a; out_mant = 7'h7c; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h7a; out_mant = 7'h78; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h7a; out_mant = 7'h73; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h7a; out_mant = 7'h6f; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h7a; out_mant = 7'h6b; end
                default: begin end
              endcase
            end
            3'h2: begin
              out_sign = 1'b0; out_exp = 8'h7a; out_mant = 7'h66;
              case (mant_lo4)
                4'h1: begin out_sign = 1'b0; out_exp = 8'h7a; out_mant = 7'h62; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h7a; out_mant = 7'h5e; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h7a; out_mant = 7'h5a; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h7a; out_mant = 7'h56; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h7a; out_mant = 7'h53; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h7a; out_mant = 7'h4f; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h7a; out_mant = 7'h4b; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h7a; out_mant = 7'h47; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h7a; out_mant = 7'h44; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h7a; out_mant = 7'h40; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h7a; out_mant = 7'h3d; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h7a; out_mant = 7'h3a; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h7a; out_mant = 7'h36; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h7a; out_mant = 7'h33; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h7a; out_mant = 7'h30; end
                default: begin end
              endcase
            end
            3'h3: begin
              out_sign = 1'b0; out_exp = 8'h7a; out_mant = 7'h2d;
              case (mant_lo4)
                4'h1: begin out_sign = 1'b0; out_exp = 8'h7a; out_mant = 7'h2a; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h7a; out_mant = 7'h27; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h7a; out_mant = 7'h24; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h7a; out_mant = 7'h21; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h7a; out_mant = 7'h1e; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h7a; out_mant = 7'h1b; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h7a; out_mant = 7'h18; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h7a; out_mant = 7'h16; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h7a; out_mant = 7'h13; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h7a; out_mant = 7'h10; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h7a; out_mant = 7'h0e; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h7a; out_mant = 7'h0b; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h7a; out_mant = 7'h09; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h7a; out_mant = 7'h06; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h7a; out_mant = 7'h04; end
                default: begin end
              endcase
            end
            3'h4: begin
              out_sign = 1'b0; out_exp = 8'h7a; out_mant = 7'h02;
              case (mant_lo4)
                4'h1: begin out_sign = 1'b0; out_exp = 8'h79; out_mant = 7'h7e; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h79; out_mant = 7'h7a; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h79; out_mant = 7'h75; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h79; out_mant = 7'h71; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h79; out_mant = 7'h6d; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h79; out_mant = 7'h69; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h79; out_mant = 7'h64; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h79; out_mant = 7'h60; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h79; out_mant = 7'h5c; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h79; out_mant = 7'h58; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h79; out_mant = 7'h55; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h79; out_mant = 7'h51; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h79; out_mant = 7'h4d; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h79; out_mant = 7'h49; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h79; out_mant = 7'h46; end
                default: begin end
              endcase
            end
            3'h5: begin
              out_sign = 1'b0; out_exp = 8'h79; out_mant = 7'h42;
              case (mant_lo4)
                4'h1: begin out_sign = 1'b0; out_exp = 8'h79; out_mant = 7'h3f; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h79; out_mant = 7'h3b; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h79; out_mant = 7'h38; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h79; out_mant = 7'h35; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h79; out_mant = 7'h32; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h79; out_mant = 7'h2e; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h79; out_mant = 7'h2b; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h79; out_mant = 7'h28; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h79; out_mant = 7'h25; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h79; out_mant = 7'h22; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h79; out_mant = 7'h1f; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h79; out_mant = 7'h1d; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h79; out_mant = 7'h1a; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h79; out_mant = 7'h17; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h79; out_mant = 7'h14; end
                default: begin end
              endcase
            end
            3'h6: begin
              out_sign = 1'b0; out_exp = 8'h79; out_mant = 7'h12;
              case (mant_lo4)
                4'h1: begin out_sign = 1'b0; out_exp = 8'h79; out_mant = 7'h0f; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h79; out_mant = 7'h0d; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h79; out_mant = 7'h0a; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h79; out_mant = 7'h08; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h79; out_mant = 7'h05; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h79; out_mant = 7'h03; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h79; out_mant = 7'h00; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h78; out_mant = 7'h7c; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h78; out_mant = 7'h78; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h78; out_mant = 7'h73; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h78; out_mant = 7'h6f; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h78; out_mant = 7'h6b; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h78; out_mant = 7'h67; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h78; out_mant = 7'h62; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h78; out_mant = 7'h5e; end
                default: begin end
              endcase
            end
            3'h7: begin
              out_sign = 1'b0; out_exp = 8'h78; out_mant = 7'h5a;
              case (mant_lo4)
                4'h1: begin out_sign = 1'b0; out_exp = 8'h78; out_mant = 7'h57; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h78; out_mant = 7'h53; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h78; out_mant = 7'h4f; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h78; out_mant = 7'h4b; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h78; out_mant = 7'h48; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h78; out_mant = 7'h44; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h78; out_mant = 7'h41; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h78; out_mant = 7'h3d; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h78; out_mant = 7'h3a; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h78; out_mant = 7'h37; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h78; out_mant = 7'h33; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h78; out_mant = 7'h30; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h78; out_mant = 7'h2d; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h78; out_mant = 7'h2a; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h78; out_mant = 7'h27; end
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h180: begin
          case (mant_hi3)
            3'h0: begin
              out_sign = 1'b0; out_exp = 8'h78; out_mant = 7'h24;
              case (mant_lo4)
                4'h1: begin out_sign = 1'b0; out_exp = 8'h78; out_mant = 7'h1e; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h78; out_mant = 7'h18; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h78; out_mant = 7'h13; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h78; out_mant = 7'h0e; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h78; out_mant = 7'h09; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h78; out_mant = 7'h04; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h77; out_mant = 7'h7f; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h77; out_mant = 7'h76; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h77; out_mant = 7'h6d; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h77; out_mant = 7'h65; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h77; out_mant = 7'h5d; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h77; out_mant = 7'h55; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h77; out_mant = 7'h4d; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h77; out_mant = 7'h46; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h77; out_mant = 7'h3f; end
                default: begin end
              endcase
            end
            3'h1: begin
              out_sign = 1'b0; out_exp = 8'h77; out_mant = 7'h38;
              case (mant_lo4)
                4'h1: begin out_sign = 1'b0; out_exp = 8'h77; out_mant = 7'h32; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h77; out_mant = 7'h2b; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h77; out_mant = 7'h25; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h77; out_mant = 7'h20; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h77; out_mant = 7'h1a; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h77; out_mant = 7'h14; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h77; out_mant = 7'h0f; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h77; out_mant = 7'h0a; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h77; out_mant = 7'h05; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h77; out_mant = 7'h01; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h76; out_mant = 7'h78; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h76; out_mant = 7'h6f; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h76; out_mant = 7'h67; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h76; out_mant = 7'h5f; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h76; out_mant = 7'h57; end
                default: begin end
              endcase
            end
            3'h2: begin
              out_sign = 1'b0; out_exp = 8'h76; out_mant = 7'h4f;
              case (mant_lo4)
                4'h1: begin out_sign = 1'b0; out_exp = 8'h76; out_mant = 7'h48; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h76; out_mant = 7'h41; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h76; out_mant = 7'h3a; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h76; out_mant = 7'h33; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h76; out_mant = 7'h2d; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h76; out_mant = 7'h27; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h76; out_mant = 7'h21; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h76; out_mant = 7'h1b; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h76; out_mant = 7'h16; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h76; out_mant = 7'h11; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h76; out_mant = 7'h0c; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h76; out_mant = 7'h07; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h76; out_mant = 7'h02; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h75; out_mant = 7'h7a; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h75; out_mant = 7'h72; end
                default: begin end
              endcase
            end
            3'h3: begin
              out_sign = 1'b0; out_exp = 8'h75; out_mant = 7'h69;
              case (mant_lo4)
                4'h1: begin out_sign = 1'b0; out_exp = 8'h75; out_mant = 7'h61; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h75; out_mant = 7'h59; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h75; out_mant = 7'h51; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h75; out_mant = 7'h4a; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h75; out_mant = 7'h43; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h75; out_mant = 7'h3c; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h75; out_mant = 7'h35; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h75; out_mant = 7'h2f; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h75; out_mant = 7'h29; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h75; out_mant = 7'h23; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h75; out_mant = 7'h1d; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h75; out_mant = 7'h17; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h75; out_mant = 7'h12; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h75; out_mant = 7'h0d; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h75; out_mant = 7'h08; end
                default: begin end
              endcase
            end
            3'h4: begin
              out_sign = 1'b0; out_exp = 8'h75; out_mant = 7'h03;
              case (mant_lo4)
                4'h1: begin out_sign = 1'b0; out_exp = 8'h74; out_mant = 7'h7d; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h74; out_mant = 7'h74; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h74; out_mant = 7'h6b; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h74; out_mant = 7'h63; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h74; out_mant = 7'h5b; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h74; out_mant = 7'h53; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h74; out_mant = 7'h4c; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h74; out_mant = 7'h45; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h74; out_mant = 7'h3e; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h74; out_mant = 7'h37; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h74; out_mant = 7'h30; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h74; out_mant = 7'h2a; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h74; out_mant = 7'h24; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h74; out_mant = 7'h1e; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h74; out_mant = 7'h19; end
                default: begin end
              endcase
            end
            3'h5: begin
              out_sign = 1'b0; out_exp = 8'h74; out_mant = 7'h13;
              case (mant_lo4)
                4'h1: begin out_sign = 1'b0; out_exp = 8'h74; out_mant = 7'h0e; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h74; out_mant = 7'h09; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h74; out_mant = 7'h04; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h73; out_mant = 7'h7f; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h73; out_mant = 7'h76; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h73; out_mant = 7'h6e; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h73; out_mant = 7'h65; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h73; out_mant = 7'h5d; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h73; out_mant = 7'h55; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h73; out_mant = 7'h4e; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h73; out_mant = 7'h46; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h73; out_mant = 7'h3f; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h73; out_mant = 7'h39; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h73; out_mant = 7'h32; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h73; out_mant = 7'h2c; end
                default: begin end
              endcase
            end
            3'h6: begin
              out_sign = 1'b0; out_exp = 8'h73; out_mant = 7'h26;
              case (mant_lo4)
                4'h1: begin out_sign = 1'b0; out_exp = 8'h73; out_mant = 7'h20; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h73; out_mant = 7'h1a; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h73; out_mant = 7'h15; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h73; out_mant = 7'h10; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h73; out_mant = 7'h0a; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h73; out_mant = 7'h06; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h73; out_mant = 7'h01; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h72; out_mant = 7'h79; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h72; out_mant = 7'h70; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h72; out_mant = 7'h67; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h72; out_mant = 7'h5f; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h72; out_mant = 7'h57; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h72; out_mant = 7'h50; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h72; out_mant = 7'h48; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h72; out_mant = 7'h41; end
                default: begin end
              endcase
            end
            3'h7: begin
              out_sign = 1'b0; out_exp = 8'h72; out_mant = 7'h3a;
              case (mant_lo4)
                4'h1: begin out_sign = 1'b0; out_exp = 8'h72; out_mant = 7'h34; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h72; out_mant = 7'h2e; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h72; out_mant = 7'h27; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h72; out_mant = 7'h21; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h72; out_mant = 7'h1c; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h72; out_mant = 7'h16; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h72; out_mant = 7'h11; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h72; out_mant = 7'h0c; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h72; out_mant = 7'h07; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h72; out_mant = 7'h02; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h71; out_mant = 7'h7b; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h71; out_mant = 7'h72; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h71; out_mant = 7'h6a; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h71; out_mant = 7'h61; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h71; out_mant = 7'h59; end
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h181: begin
          case (mant_hi3)
            3'h0: begin
              out_sign = 1'b0; out_exp = 8'h71; out_mant = 7'h52;
              case (mant_lo4)
                4'h1: begin out_sign = 1'b0; out_exp = 8'h71; out_mant = 7'h43; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h71; out_mant = 7'h36; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h71; out_mant = 7'h29; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h71; out_mant = 7'h1d; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h71; out_mant = 7'h12; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h71; out_mant = 7'h08; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h70; out_mant = 7'h7d; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h70; out_mant = 7'h6c; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h70; out_mant = 7'h5b; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h70; out_mant = 7'h4c; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h70; out_mant = 7'h3e; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h70; out_mant = 7'h31; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h70; out_mant = 7'h25; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h70; out_mant = 7'h19; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h70; out_mant = 7'h0f; end
                default: begin end
              endcase
            end
            3'h1: begin
              out_sign = 1'b0; out_exp = 8'h70; out_mant = 7'h05;
              case (mant_lo4)
                4'h1: begin out_sign = 1'b0; out_exp = 8'h6f; out_mant = 7'h77; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h6f; out_mant = 7'h66; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h6f; out_mant = 7'h56; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h6f; out_mant = 7'h47; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h6f; out_mant = 7'h39; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h6f; out_mant = 7'h2c; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h6f; out_mant = 7'h20; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h6f; out_mant = 7'h15; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h6f; out_mant = 7'h0b; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h6f; out_mant = 7'h01; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h6e; out_mant = 7'h70; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h6e; out_mant = 7'h60; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h6e; out_mant = 7'h50; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h6e; out_mant = 7'h42; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h6e; out_mant = 7'h34; end
                default: begin end
              endcase
            end
            3'h2: begin
              out_sign = 1'b0; out_exp = 8'h6e; out_mant = 7'h28;
              case (mant_lo4)
                4'h1: begin out_sign = 1'b0; out_exp = 8'h6e; out_mant = 7'h1c; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h6e; out_mant = 7'h11; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h6e; out_mant = 7'h07; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h6d; out_mant = 7'h7c; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h6d; out_mant = 7'h6a; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h6d; out_mant = 7'h5a; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h6d; out_mant = 7'h4b; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h6d; out_mant = 7'h3d; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h6d; out_mant = 7'h30; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h6d; out_mant = 7'h23; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h6d; out_mant = 7'h18; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h6d; out_mant = 7'h0d; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h6d; out_mant = 7'h04; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h6c; out_mant = 7'h75; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h6c; out_mant = 7'h64; end
                default: begin end
              endcase
            end
            3'h3: begin
              out_sign = 1'b0; out_exp = 8'h6c; out_mant = 7'h54;
              case (mant_lo4)
                4'h1: begin out_sign = 1'b0; out_exp = 8'h6c; out_mant = 7'h45; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h6c; out_mant = 7'h38; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h6c; out_mant = 7'h2b; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h6c; out_mant = 7'h1f; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h6c; out_mant = 7'h14; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h6c; out_mant = 7'h0a; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h6c; out_mant = 7'h00; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h6b; out_mant = 7'h6f; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h6b; out_mant = 7'h5e; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h6b; out_mant = 7'h4f; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h6b; out_mant = 7'h40; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h6b; out_mant = 7'h33; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h6b; out_mant = 7'h27; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h6b; out_mant = 7'h1b; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h6b; out_mant = 7'h10; end
                default: begin end
              endcase
            end
            3'h4: begin
              out_sign = 1'b0; out_exp = 8'h6b; out_mant = 7'h06;
              case (mant_lo4)
                4'h1: begin out_sign = 1'b0; out_exp = 8'h6a; out_mant = 7'h7a; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h6a; out_mant = 7'h68; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h6a; out_mant = 7'h58; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h6a; out_mant = 7'h49; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h6a; out_mant = 7'h3b; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h6a; out_mant = 7'h2e; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h6a; out_mant = 7'h22; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h6a; out_mant = 7'h17; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h6a; out_mant = 7'h0c; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h6a; out_mant = 7'h03; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h69; out_mant = 7'h73; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h69; out_mant = 7'h62; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h69; out_mant = 7'h53; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h69; out_mant = 7'h44; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h69; out_mant = 7'h36; end
                default: begin end
              endcase
            end
            3'h5: begin
              out_sign = 1'b0; out_exp = 8'h69; out_mant = 7'h2a;
              case (mant_lo4)
                4'h1: begin out_sign = 1'b0; out_exp = 8'h69; out_mant = 7'h1e; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h69; out_mant = 7'h13; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h69; out_mant = 7'h09; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h68; out_mant = 7'h7f; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h68; out_mant = 7'h6d; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h68; out_mant = 7'h5c; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h68; out_mant = 7'h4d; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h68; out_mant = 7'h3f; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h68; out_mant = 7'h32; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h68; out_mant = 7'h25; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h68; out_mant = 7'h1a; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h68; out_mant = 7'h0f; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h68; out_mant = 7'h05; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h67; out_mant = 7'h78; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h67; out_mant = 7'h67; end
                default: begin end
              endcase
            end
            3'h6: begin
              out_sign = 1'b0; out_exp = 8'h67; out_mant = 7'h57;
              case (mant_lo4)
                4'h1: begin out_sign = 1'b0; out_exp = 8'h67; out_mant = 7'h48; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h67; out_mant = 7'h3a; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h67; out_mant = 7'h2d; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h67; out_mant = 7'h21; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h67; out_mant = 7'h16; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h67; out_mant = 7'h0b; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h67; out_mant = 7'h02; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h66; out_mant = 7'h72; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h66; out_mant = 7'h61; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h66; out_mant = 7'h51; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h66; out_mant = 7'h43; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h66; out_mant = 7'h35; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h66; out_mant = 7'h29; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h66; out_mant = 7'h1d; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h66; out_mant = 7'h12; end
                default: begin end
              endcase
            end
            3'h7: begin
              out_sign = 1'b0; out_exp = 8'h66; out_mant = 7'h08;
              case (mant_lo4)
                4'h1: begin out_sign = 1'b0; out_exp = 8'h65; out_mant = 7'h7d; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h65; out_mant = 7'h6b; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h65; out_mant = 7'h5b; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h65; out_mant = 7'h4c; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h65; out_mant = 7'h3e; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h65; out_mant = 7'h30; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h65; out_mant = 7'h24; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h65; out_mant = 7'h19; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h65; out_mant = 7'h0e; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h65; out_mant = 7'h04; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h64; out_mant = 7'h76; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h64; out_mant = 7'h65; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h64; out_mant = 7'h55; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h64; out_mant = 7'h46; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h64; out_mant = 7'h39; end
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h182: begin
          case (mant_hi3)
            3'h0: begin
              out_sign = 1'b0; out_exp = 8'h64; out_mant = 7'h2c;
              case (mant_lo4)
                4'h1: begin out_sign = 1'b0; out_exp = 8'h64; out_mant = 7'h15; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h64; out_mant = 7'h01; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h63; out_mant = 7'h5f; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h63; out_mant = 7'h41; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h63; out_mant = 7'h27; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h63; out_mant = 7'h11; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h62; out_mant = 7'h7b; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h62; out_mant = 7'h59; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h62; out_mant = 7'h3c; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h62; out_mant = 7'h23; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h62; out_mant = 7'h0d; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h61; out_mant = 7'h74; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h61; out_mant = 7'h54; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h61; out_mant = 7'h37; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h61; out_mant = 7'h1f; end
                default: begin end
              endcase
            end
            3'h1: begin
              out_sign = 1'b0; out_exp = 8'h61; out_mant = 7'h09;
              case (mant_lo4)
                4'h1: begin out_sign = 1'b0; out_exp = 8'h60; out_mant = 7'h6e; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h60; out_mant = 7'h4e; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h60; out_mant = 7'h33; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h60; out_mant = 7'h1b; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h60; out_mant = 7'h06; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h5f; out_mant = 7'h68; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h5f; out_mant = 7'h49; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h5f; out_mant = 7'h2e; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h5f; out_mant = 7'h17; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h5f; out_mant = 7'h02; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h5e; out_mant = 7'h62; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h5e; out_mant = 7'h44; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h5e; out_mant = 7'h29; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h5e; out_mant = 7'h13; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h5d; out_mant = 7'h7e; end
                default: begin end
              endcase
            end
            3'h2: begin
              out_sign = 1'b0; out_exp = 8'h5d; out_mant = 7'h5c;
              case (mant_lo4)
                4'h1: begin out_sign = 1'b0; out_exp = 8'h5d; out_mant = 7'h3e; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h5d; out_mant = 7'h25; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h5d; out_mant = 7'h0f; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h5c; out_mant = 7'h77; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h5c; out_mant = 7'h56; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h5c; out_mant = 7'h39; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h5c; out_mant = 7'h21; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h5c; out_mant = 7'h0b; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h5b; out_mant = 7'h71; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h5b; out_mant = 7'h51; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h5b; out_mant = 7'h35; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h5b; out_mant = 7'h1c; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h5b; out_mant = 7'h07; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h5a; out_mant = 7'h6b; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h5a; out_mant = 7'h4b; end
                default: begin end
              endcase
            end
            3'h3: begin
              out_sign = 1'b0; out_exp = 8'h5a; out_mant = 7'h30;
              case (mant_lo4)
                4'h1: begin out_sign = 1'b0; out_exp = 8'h5a; out_mant = 7'h18; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h5a; out_mant = 7'h04; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h59; out_mant = 7'h64; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h59; out_mant = 7'h46; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h59; out_mant = 7'h2b; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h59; out_mant = 7'h14; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h59; out_mant = 7'h00; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h58; out_mant = 7'h5f; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h58; out_mant = 7'h41; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h58; out_mant = 7'h27; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h58; out_mant = 7'h11; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h57; out_mant = 7'h7a; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h57; out_mant = 7'h59; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h57; out_mant = 7'h3c; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h57; out_mant = 7'h23; end
                default: begin end
              endcase
            end
            3'h4: begin
              out_sign = 1'b0; out_exp = 8'h57; out_mant = 7'h0d;
              case (mant_lo4)
                4'h1: begin out_sign = 1'b0; out_exp = 8'h56; out_mant = 7'h74; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h56; out_mant = 7'h53; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h56; out_mant = 7'h37; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h56; out_mant = 7'h1e; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h56; out_mant = 7'h09; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h55; out_mant = 7'h6d; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h55; out_mant = 7'h4e; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h55; out_mant = 7'h32; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h55; out_mant = 7'h1a; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h55; out_mant = 7'h05; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h54; out_mant = 7'h67; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h54; out_mant = 7'h48; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h54; out_mant = 7'h2d; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h54; out_mant = 7'h16; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h54; out_mant = 7'h02; end
                default: begin end
              endcase
            end
            3'h5: begin
              out_sign = 1'b0; out_exp = 8'h53; out_mant = 7'h61;
              case (mant_lo4)
                4'h1: begin out_sign = 1'b0; out_exp = 8'h53; out_mant = 7'h43; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h53; out_mant = 7'h29; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h53; out_mant = 7'h12; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h52; out_mant = 7'h7d; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h52; out_mant = 7'h5b; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h52; out_mant = 7'h3e; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h52; out_mant = 7'h24; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h52; out_mant = 7'h0e; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h51; out_mant = 7'h77; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h51; out_mant = 7'h56; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h51; out_mant = 7'h39; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h51; out_mant = 7'h20; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h51; out_mant = 7'h0b; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h50; out_mant = 7'h70; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h50; out_mant = 7'h50; end
                default: begin end
              endcase
            end
            3'h6: begin
              out_sign = 1'b0; out_exp = 8'h50; out_mant = 7'h34;
              case (mant_lo4)
                4'h1: begin out_sign = 1'b0; out_exp = 8'h50; out_mant = 7'h1c; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h50; out_mant = 7'h07; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h4f; out_mant = 7'h6a; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h4f; out_mant = 7'h4b; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h4f; out_mant = 7'h2f; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h4f; out_mant = 7'h18; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h4f; out_mant = 7'h04; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h4e; out_mant = 7'h64; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h4e; out_mant = 7'h45; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h4e; out_mant = 7'h2b; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h4e; out_mant = 7'h14; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h4e; out_mant = 7'h00; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h4d; out_mant = 7'h5e; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h4d; out_mant = 7'h40; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h4d; out_mant = 7'h26; end
                default: begin end
              endcase
            end
            3'h7: begin
              out_sign = 1'b0; out_exp = 8'h4d; out_mant = 7'h10;
              case (mant_lo4)
                4'h1: begin out_sign = 1'b0; out_exp = 8'h4c; out_mant = 7'h7a; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h4c; out_mant = 7'h58; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h4c; out_mant = 7'h3b; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h4c; out_mant = 7'h22; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h4c; out_mant = 7'h0c; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h4b; out_mant = 7'h73; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h4b; out_mant = 7'h53; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h4b; out_mant = 7'h36; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h4b; out_mant = 7'h1e; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h4b; out_mant = 7'h09; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h4a; out_mant = 7'h6d; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h4a; out_mant = 7'h4d; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h4a; out_mant = 7'h32; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h4a; out_mant = 7'h1a; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h4a; out_mant = 7'h05; end
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h183: begin
          case (mant_hi3)
            3'h0: begin
              out_sign = 1'b0; out_exp = 8'h49; out_mant = 7'h67;
              case (mant_lo4)
                4'h1: begin out_sign = 1'b0; out_exp = 8'h49; out_mant = 7'h2d; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h49; out_mant = 7'h02; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h48; out_mant = 7'h42; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h48; out_mant = 7'h12; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h47; out_mant = 7'h5b; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h47; out_mant = 7'h24; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h46; out_mant = 7'h76; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h46; out_mant = 7'h38; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h46; out_mant = 7'h0a; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h45; out_mant = 7'h4f; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h45; out_mant = 7'h1c; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h44; out_mant = 7'h69; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h44; out_mant = 7'h2f; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h44; out_mant = 7'h03; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h43; out_mant = 7'h45; end
                default: begin end
              endcase
            end
            3'h1: begin
              out_sign = 1'b0; out_exp = 8'h43; out_mant = 7'h14;
              case (mant_lo4)
                4'h1: begin out_sign = 1'b0; out_exp = 8'h42; out_mant = 7'h5d; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h42; out_mant = 7'h26; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h41; out_mant = 7'h79; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h41; out_mant = 7'h3b; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h41; out_mant = 7'h0c; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h40; out_mant = 7'h52; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h40; out_mant = 7'h1d; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h3f; out_mant = 7'h6c; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h3f; out_mant = 7'h31; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h3f; out_mant = 7'h05; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h3e; out_mant = 7'h47; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h3e; out_mant = 7'h15; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h3d; out_mant = 7'h60; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h3d; out_mant = 7'h28; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h3c; out_mant = 7'h7c; end
                default: begin end
              endcase
            end
            3'h2: begin
              out_sign = 1'b0; out_exp = 8'h3c; out_mant = 7'h3d;
              case (mant_lo4)
                4'h1: begin out_sign = 1'b0; out_exp = 8'h3c; out_mant = 7'h0e; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h3b; out_mant = 7'h54; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h3b; out_mant = 7'h1f; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h3a; out_mant = 7'h6f; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h3a; out_mant = 7'h33; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h3a; out_mant = 7'h06; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h39; out_mant = 7'h4a; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h39; out_mant = 7'h17; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h38; out_mant = 7'h63; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h38; out_mant = 7'h2a; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h37; out_mant = 7'h7f; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h37; out_mant = 7'h3f; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h37; out_mant = 7'h0f; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h36; out_mant = 7'h57; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h36; out_mant = 7'h21; end
                default: begin end
              endcase
            end
            3'h3: begin
              out_sign = 1'b0; out_exp = 8'h35; out_mant = 7'h72;
              case (mant_lo4)
                4'h1: begin out_sign = 1'b0; out_exp = 8'h35; out_mant = 7'h35; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h35; out_mant = 7'h08; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h34; out_mant = 7'h4c; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h34; out_mant = 7'h19; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h33; out_mant = 7'h65; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h33; out_mant = 7'h2c; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h33; out_mant = 7'h01; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h32; out_mant = 7'h41; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h32; out_mant = 7'h11; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h31; out_mant = 7'h5a; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h31; out_mant = 7'h23; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h30; out_mant = 7'h75; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h30; out_mant = 7'h37; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h30; out_mant = 7'h0a; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h2f; out_mant = 7'h4e; end
                default: begin end
              endcase
            end
            3'h4: begin
              out_sign = 1'b0; out_exp = 8'h2f; out_mant = 7'h1b;
              case (mant_lo4)
                4'h1: begin out_sign = 1'b0; out_exp = 8'h2e; out_mant = 7'h68; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h2e; out_mant = 7'h2e; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h2e; out_mant = 7'h03; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h2d; out_mant = 7'h44; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h2d; out_mant = 7'h13; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h2c; out_mant = 7'h5c; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h2c; out_mant = 7'h25; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h2b; out_mant = 7'h78; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h2b; out_mant = 7'h3a; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h2b; out_mant = 7'h0b; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h2a; out_mant = 7'h51; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h2a; out_mant = 7'h1d; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h29; out_mant = 7'h6b; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h29; out_mant = 7'h30; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h29; out_mant = 7'h04; end
                default: begin end
              endcase
            end
            3'h5: begin
              out_sign = 1'b0; out_exp = 8'h28; out_mant = 7'h46;
              case (mant_lo4)
                4'h1: begin out_sign = 1'b0; out_exp = 8'h28; out_mant = 7'h15; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h27; out_mant = 7'h5f; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h27; out_mant = 7'h27; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h26; out_mant = 7'h7b; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h26; out_mant = 7'h3c; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h26; out_mant = 7'h0d; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h25; out_mant = 7'h53; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h25; out_mant = 7'h1e; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h24; out_mant = 7'h6e; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h24; out_mant = 7'h32; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h24; out_mant = 7'h06; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h23; out_mant = 7'h48; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h23; out_mant = 7'h16; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h22; out_mant = 7'h61; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h22; out_mant = 7'h29; end
                default: begin end
              endcase
            end
            3'h6: begin
              out_sign = 1'b0; out_exp = 8'h21; out_mant = 7'h7e;
              case (mant_lo4)
                4'h1: begin out_sign = 1'b0; out_exp = 8'h21; out_mant = 7'h3e; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h21; out_mant = 7'h0f; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h20; out_mant = 7'h56; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h20; out_mant = 7'h20; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h1f; out_mant = 7'h70; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h1f; out_mant = 7'h34; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h1f; out_mant = 7'h07; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h1e; out_mant = 7'h4b; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h1e; out_mant = 7'h18; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h1d; out_mant = 7'h64; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h1d; out_mant = 7'h2b; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h1d; out_mant = 7'h00; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h1c; out_mant = 7'h40; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h1c; out_mant = 7'h10; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h1b; out_mant = 7'h58; end
                default: begin end
              endcase
            end
            3'h7: begin
              out_sign = 1'b0; out_exp = 8'h1b; out_mant = 7'h22;
              case (mant_lo4)
                4'h1: begin out_sign = 1'b0; out_exp = 8'h1a; out_mant = 7'h73; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h1a; out_mant = 7'h36; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h1a; out_mant = 7'h09; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h19; out_mant = 7'h4d; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h19; out_mant = 7'h1a; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h18; out_mant = 7'h67; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h18; out_mant = 7'h2d; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h18; out_mant = 7'h02; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h17; out_mant = 7'h43; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h17; out_mant = 7'h12; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h16; out_mant = 7'h5b; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h16; out_mant = 7'h24; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h15; out_mant = 7'h76; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h15; out_mant = 7'h39; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h15; out_mant = 7'h0a; end
                default: begin end
              endcase
            end
            default: begin end
          endcase
        end
        9'h184: begin
          case (mant_hi3)
            3'h0: begin
              out_sign = 1'b0; out_exp = 8'h14; out_mant = 7'h50;
              case (mant_lo4)
                4'h1: begin out_sign = 1'b0; out_exp = 8'h13; out_mant = 7'h6a; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h13; out_mant = 7'h03; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h12; out_mant = 7'h14; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h11; out_mant = 7'h26; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h10; out_mant = 7'h3b; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h0f; out_mant = 7'h52; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h0e; out_mant = 7'h6c; end
                4'h8: begin out_sign = 1'b0; out_exp = 8'h0e; out_mant = 7'h05; end
                4'h9: begin out_sign = 1'b0; out_exp = 8'h0d; out_mant = 7'h15; end
                4'ha: begin out_sign = 1'b0; out_exp = 8'h0c; out_mant = 7'h28; end
                4'hb: begin out_sign = 1'b0; out_exp = 8'h0b; out_mant = 7'h3d; end
                4'hc: begin out_sign = 1'b0; out_exp = 8'h0a; out_mant = 7'h55; end
                4'hd: begin out_sign = 1'b0; out_exp = 8'h09; out_mant = 7'h6f; end
                4'he: begin out_sign = 1'b0; out_exp = 8'h09; out_mant = 7'h07; end
                4'hf: begin out_sign = 1'b0; out_exp = 8'h08; out_mant = 7'h17; end
                default: begin end
              endcase
            end
            3'h1: begin
              out_sign = 1'b0; out_exp = 8'h00; out_mant = 7'h00;
              case (mant_lo4)
                4'h0: begin out_sign = 1'b0; out_exp = 8'h07; out_mant = 7'h2a; end
                4'h1: begin out_sign = 1'b0; out_exp = 8'h06; out_mant = 7'h3f; end
                4'h2: begin out_sign = 1'b0; out_exp = 8'h05; out_mant = 7'h57; end
                4'h3: begin out_sign = 1'b0; out_exp = 8'h04; out_mant = 7'h72; end
                4'h4: begin out_sign = 1'b0; out_exp = 8'h04; out_mant = 7'h08; end
                4'h5: begin out_sign = 1'b0; out_exp = 8'h03; out_mant = 7'h19; end
                4'h6: begin out_sign = 1'b0; out_exp = 8'h02; out_mant = 7'h2c; end
                4'h7: begin out_sign = 1'b0; out_exp = 8'h01; out_mant = 7'h42; end
                default: begin end
              endcase
            end
            3'h2: begin
              out_sign = 1'b0; out_exp = 8'h00; out_mant = 7'h00;
            end
            3'h3: begin
              out_sign = 1'b0; out_exp = 8'h00; out_mant = 7'h00;
            end
            3'h4: begin
              out_sign = 1'b0; out_exp = 8'h00; out_mant = 7'h00;
            end
            3'h5: begin
              out_sign = 1'b0; out_exp = 8'h00; out_mant = 7'h00;
            end
            3'h6: begin
              out_sign = 1'b0; out_exp = 8'h00; out_mant = 7'h00;
            end
            3'h7: begin
              out_sign = 1'b0; out_exp = 8'h00; out_mant = 7'h00;
            end
            default: begin end
          endcase
        end
        9'h1ff: begin
          case (mant_hi3)
            3'h0: begin
              out_sign = 1'b0; out_exp = 8'hff; out_mant = 7'h40;
              case (mant_lo4)
                4'h0: begin out_sign = 1'b0; out_exp = 8'h00; out_mant = 7'h00; end
                default: begin end
              endcase
            end
            3'h1: begin
              out_sign = 1'b0; out_exp = 8'hff; out_mant = 7'h40;
            end
            3'h2: begin
              out_sign = 1'b0; out_exp = 8'hff; out_mant = 7'h40;
            end
            3'h3: begin
              out_sign = 1'b0; out_exp = 8'hff; out_mant = 7'h40;
            end
            3'h4: begin
              out_sign = 1'b0; out_exp = 8'hff; out_mant = 7'h40;
            end
            3'h5: begin
              out_sign = 1'b0; out_exp = 8'hff; out_mant = 7'h40;
            end
            3'h6: begin
              out_sign = 1'b0; out_exp = 8'hff; out_mant = 7'h40;
            end
            3'h7: begin
              out_sign = 1'b0; out_exp = 8'hff; out_mant = 7'h40;
            end
            default: begin end
          endcase
        end
      default: begin end
    endcase
  end
  wire bit_14 = ((~in[15]) & ((in[14:7] > 8'd125) | ((in[14:7] == 8'd125) & (mant >= 7'd26)))) | (in[15] & (in[14:7] == 8'hff) & (mant != 7'd0));
  assign out = {out_sign, bit_14, out_exp[6], out_exp[5], out_exp[4], out_exp[3], out_exp[2], out_exp[1], out_exp[0], out_mant[6], out_mant[5], out_mant[4], out_mant[3], out_mant[2], out_mant[1], out_mant[0]};
endmodule
